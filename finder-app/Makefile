default_target: all

all:
ifneq ($(CROSS_COMPILE),aarch64-none-linux-gnu-)

	@echo "CC writer.c"
	@gcc -o writer.o -c writer.c
	@echo "Linking Application"
	@gcc -o writer writer.o

else

	@echo "CC writer.c"
	@$(CROSS_COMPILE)gcc -o writer.o -c writer.c
	@echo "Linking Application"
	@$(CROSS_COMPILE)gcc -Wl,-M=writer.map,-A=cortex_a53 writer.o -o writer

endif

clean:

	@echo "Removing .o files"
	@rm -f ./*.o

help:
	@echo "make [target]"
	@echo "target:"
	@echo "    all (the default if no target is provided) - Builds application"
	@echo "    clean - clean out files"