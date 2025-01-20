@interface NFHardwareSerialCreateSources
@end

@implementation NFHardwareSerialCreateSources

void ___NFHardwareSerialCreateSources_block_invoke()
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v0 = (const void **)MEMORY[0x263F8C6C0];
  dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
  Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (Logger) {
    Logger(3, "%s:%i Error ! Unexpected invocation of read handler", "_NFHardwareSerialCreateSources_block_invoke", 1071);
  }
  dispatch_get_specific(*v0);
  v2 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446466;
    v4 = "_NFHardwareSerialCreateSources_block_invoke";
    __int16 v5 = 1024;
    int v6 = 1071;
    _os_log_impl(&dword_237D7D000, v2, OS_LOG_TYPE_ERROR, "%{public}s:%i Error ! Unexpected invocation of read handler", buf, 0x12u);
  }
}

void ___NFHardwareSerialCreateSources_block_invoke_2()
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v0 = (const void **)MEMORY[0x263F8C6C0];
  dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
  Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (Logger) {
    Logger(3, "%s:%i Error ! Unexpected invocation of write handler", "_NFHardwareSerialCreateSources_block_invoke_2", 1081);
  }
  dispatch_get_specific(*v0);
  v2 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446466;
    v4 = "_NFHardwareSerialCreateSources_block_invoke_2";
    __int16 v5 = 1024;
    int v6 = 1081;
    _os_log_impl(&dword_237D7D000, v2, OS_LOG_TYPE_ERROR, "%{public}s:%i Error ! Unexpected invocation of write handler", buf, 0x12u);
  }
}

uint64_t ___NFHardwareSerialCreateSources_block_invoke_143(uint64_t a1)
{
  return close(*(_DWORD *)(a1 + 32));
}

@end