#!/bin/bash

export ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu-

function run() {
	local qemu=qemu-system-aarch64
	echo "Start Linux Kernel"
	$qemu -machine virt,gic-version=3 -cpu cortex-a53 -nographic -smp 1 \
		-m size=4G \
		-kernel arch/arm64/boot/Image \
		-semihosting-config enable=on,target=native \
		-device virtio-blk-device,drive=hd0 \
		-drive file=./rootfs.ext4,format=raw,if=none,id=hd0 \
		-netdev user,hostfwd=tcp::22222-:22,hostfwd=tcp::11234-:1234,id=eth0 \
		-device virtio-net-device,netdev=eth0 \
		-dtb ./qemu.dtb
}

function debug() {
	local qemu=qemu-system-aarch64
	echo "Start Linux Kernel"
	$qemu -machine virt,gic-version=3 -cpu cortex-a53 -nographic -smp 1 \
		-m size=4G \
		-kernel arch/arm64/boot/Image \
		-semihosting-config enable=on,target=native \
		-device virtio-blk-device,drive=hd0 \
		-drive file=./rootfs.ext4,format=raw,if=none,id=hd0 \
		-netdev user,hostfwd=tcp::22222-:22,hostfwd=tcp::11234-:1234,id=eth0 \
		-device virtio-net-device,netdev=eth0 \
		-dtb ./qemu.dtb \
		-s -S
}

function gdb() {
  gdb-multiarch vmlinux -ex "target remote :1234"
}

function dtb2dts() {
	dtc -I dtb -O dts $1 -o $2
}

function dts2dtb() {
	dtc -I dts -O dtb $1 -o $2
}

function gen_qemu_dts {
	qemu-system-aarch64 -machine virt,gic-version=3 -machine dumpdtb=qemu.dtb
}

function pk_in {
  sudo mount -o loop rootfs.ext4 tmp
  sudo cp -v $1 tmp/root/
  sudo umount tmp
}
