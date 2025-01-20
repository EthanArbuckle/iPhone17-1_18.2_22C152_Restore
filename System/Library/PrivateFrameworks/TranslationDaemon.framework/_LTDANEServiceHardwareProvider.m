@interface _LTDANEServiceHardwareProvider
+ (BOOL)isAvailable;
+ (id)subType;
+ (void)logCapabilities;
@end

@implementation _LTDANEServiceHardwareProvider

+ (void)logCapabilities
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v2 = _LTOSLogAssets();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3[0] = 67109376;
    v3[1] = 1;
    __int16 v4 = 1024;
    int v5 = 1;
    _os_log_impl(&dword_2600DC000, v2, OS_LOG_TYPE_INFO, "ANE hardware provider capabilities MG:%{BOOL}i ANE:%{BOOL}i", (uint8_t *)v3, 0xEu);
  }
}

+ (BOOL)isAvailable
{
  if (isAvailable_once != -1) {
    dispatch_once(&isAvailable_once, &__block_literal_global_1);
  }
  return isAvailable_result;
}

+ (id)subType
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __41___LTDANEServiceHardwareProvider_subType__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (subType_once != -1) {
    dispatch_once(&subType_once, block);
  }
  v2 = (void *)subType_result;
  return v2;
}

@end