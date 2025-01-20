@interface NSData
@end

@implementation NSData

void __43__NSData_MIBUExtension__dataWithHexString___block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    BOOL v2 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v2) {
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
}

void __43__NSData_MIBUExtension__dataWithHexString___block_invoke_3()
{
  os_log_t v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    BOOL v2 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v2) {
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
}

@end