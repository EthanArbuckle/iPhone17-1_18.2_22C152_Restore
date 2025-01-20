@interface CryptexRemoteDeviceIdentifier
- (CryptexRemoteDeviceIdentifier)initWithChipInstance:(const _img4_chip_instance *)a3;
- (_img4_chip_instance)inst;
- (void)dealloc;
@end

@implementation CryptexRemoteDeviceIdentifier

- (CryptexRemoteDeviceIdentifier)initWithChipInstance:(const _img4_chip_instance *)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v7.receiver = self;
  v7.super_class = (Class)CryptexRemoteDeviceIdentifier;
  v4 = [(CryptexRemoteDeviceIdentifier *)&v7 init];
  v5 = (_img4_chip_instance *)malloc_type_calloc(1uLL, 0x90uLL, 0x61D5536CuLL);
  if (!v5) {
    -[CryptexRemoteDeviceIdentifier initWithChipInstance:](&v8, v9);
  }
  v4->_inst = v5;
  memmove(v5, a3, 0x90uLL);
  return v4;
}

- (void)dealloc
{
  inst = self->_inst;
  if (inst)
  {
    free(inst);
    self->_inst = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)CryptexRemoteDeviceIdentifier;
  [(CryptexRemoteDeviceIdentifier *)&v4 dealloc];
}

- (_img4_chip_instance)inst
{
  return self->_inst;
}

- (void)initWithChipInstance:(void *)a1 .cold.1(void *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1_0(a1, a2);
  os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
  v2 = __error();
  strerror(*v2);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5_0();
  __break(1u);
}

@end