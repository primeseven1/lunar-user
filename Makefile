KERNEL_IMAGE := ./lunar/lunar

ISO_ROOT := tools/testing/iso
ISO_OUTPUT := tools/testing/lunar.iso

kmenuconfig:
	make -C lunar menuconfig

iso:
	make -C lunar all
	@cp $(KERNEL_IMAGE) $(ISO_ROOT)
	@xorriso -as mkisofs -b boot/limine/limine-bios-cd.bin -no-emul-boot \
		-no-emul-boot -boot-load-size 4 -boot-info-table --efi-boot boot/limine/limine-uefi-cd.bin \
		--efi-boot-part --efi-boot-image --protective-msdos-label $(ISO_ROOT) -o $(ISO_OUTPUT) &> /dev/null
	@./tools/limine/limine bios-install $(ISO_OUTPUT) &> /dev/null
	@echo "[ISO] $(ISO_OUTPUT)"

clean:
	make -C lunar clean
