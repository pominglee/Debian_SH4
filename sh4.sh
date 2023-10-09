:

exec qemu-system-sh4 \
	-M r2d,usb=off \
	-nodefaults \
	-serial null \
	-serial mon:stdio \
	-monitor none \
	-display none \
	-kernel vmlinuz-5.16.0 \
	-append "console=ttySC1,115200 root=/dev/vda earlycon=scif,mmio16,0xffe80000 noiotrap apparmor=0 selinux=0" \
	-drive file=sh4.qcow2,format=qcow2,id=d0,media=disk,if=virtio \
	-drive file=swap.raw,format=raw,id=d1,media=disk,if=virtio \
	-net nic,netdev=net0,model=rtl8139 \
	-netdev user,id=net0,hostfwd=tcp::31335-:22
