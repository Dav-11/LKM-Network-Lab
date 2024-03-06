# To support cross-compiling for kernel modules:
# For architecture (cpu) 'arch', invoke make as:
#  make ARCH=<arch> CROSS_COMPILE=<cross-compiler-prefix>
ifeq ($(ARCH),arm)
  # *UPDATE* 'KDIR' below to point to the ARM Linux kernel source tree on your box
  KDIR ?= ~/rpi_work/kernel_rpi/linux
else ifeq ($(ARCH),arm64)
  # *UPDATE* 'KDIR' below to point to the ARM64 (Aarch64) Linux kernel source
  # tree on your box
  KDIR ?= ~/kernel/linux-4.14
else ifeq ($(ARCH),powerpc)
  # *UPDATE* 'KDIR' below to point to the PPC64 Linux kernel source tree on your box
  KDIR ?= ~/kernel/linux-4.9.1
else
  # 'KDIR' is the Linux 'kernel headers' package on your host system; this is
  # usually an x86_64, but could be anything, really (f.e. building directly
  # on a Raspberry Pi implies that it's the host)
  KDIR ?= /lib/modules/$(shell uname -r)/build
endif


PWD   			:= $(shell pwd)
EXTRA_CFLAGS   	+= -DDEBUG
obj-m        	= tcp_sock_example.o

# we have no file "pbtools_lkm.c" in this example
# therefore we specify: module pbtools_lkm.ko relies on
# main.c and pbtools.c ... it's this makefile module magic thing..
# see online resources for more information
# YOU DON'T need this IF you have *.c-file with the name of the final kernel module :)
tcp_sock_example-y := \
	tcp_sock.o 

build:

	@echo
	@echo '--- Building : KDIR=${KDIR} ARCH=${ARCH} CROSS_COMPILE=${CROSS_COMPILE} EXTRA_CFLAGS=${EXTRA_CFLAGS} ---'
	@echo

	# build
	$(MAKE) -C $(KDIR) M=$(PWD) modules

install:
	@echo
	@echo "--- installing ---"
	@echo " [First, invoke the 'make' ]"
	make
	@echo
	@echo " [Now for the 'sudo make install' ]"
	sudo make -C $(KDIR) M=$(PWD) modules_install
	sudo depmod

clean:
	@echo
	@echo "--- cleaning ---"
	@echo
	$(MAKE) -C $(KDIR) M=$(PWD) clean

load:
	sudo insmod $(PWD)/tcp_sock_example.ko

unload:
	sudo rmmod tcp_sock_example