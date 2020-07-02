#include <sys/ioctl.h>
#include <linux/types.h>
#include <fcntl.h>
#include <string.h> 
#include <unistd.h>
#include <sys/time.h>
#include <xenctrl.h>
#include <xen/sys/privcmd.h>
#include <errno.h>
#include <xen/xen.h>
#define INT_MAX 2147483647
#define INT_MIN (-INT_MAX - 1)
#define SHIFT 6
#define MASK 0x3f
int main(void){
	int fd;
	FILE* covFd;
	int ret,  count;
	char* fn;  
        long long int cover[5000] = {0};
	int pc[5000*32];
	memset(pc, 0, sizeof(pc));
	privcmd_hypercall_t set_cover={
			__HYPERVISOR_set_cov_array,
			{(long long int)&cover,0,0,0,0}
	}; 
	fd = open("/proc/xen/privcmd",O_RDWR);
	if (fd<0){
			perror("cannot open privcmd");
			return 0;
	}
	ret = ioctl(fd,IOCTL_PRIVCMD_HYPERCALL, &set_cover); 
	if (ret <  0)
	{
		printf("-------------failed!\n\n");
		return 0;
	}
	count = 0;
	fn = "/dev/cov";
	for (int i = 0; i < 5000; ++i )
	{
		if (cover[i] == 0)
			continue;
		for (int j = 0; j < 32; ++j)
		{
			if (cover[i] & (1 << j))
			{
				pc[count++] = i*32+j;
			}
		}
	}
	covFd= fopen(fn, "wb");
	FILE *fdata = NULL; 
	struct timeval tv;
	fdata = fopen("/root/Cdata", "a+"); 
	gettimeofday(&tv, NULL);
	fprintf(fdata, "%d\t%ld\n",count, tv.tv_usec);
	fclose(fdata);

	FILE *fc = NULL; 
	fc = fopen("/root/CC", "a+"); 
	fprintf(fc, "%d\n",count);
	fclose(fc);
	printf("pcsize = %d \t count = %d\n", sizeof(pc), count);
	fwrite(pc, sizeof(pc), 1, covFd);
	
	fclose(covFd);
	close(fd);
	return 0;

}




