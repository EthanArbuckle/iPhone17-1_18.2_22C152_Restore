@interface STYDeviceInfo
+ (BOOL)isAppleInternal;
+ (BOOL)isMemoryConstrained;
+ (NSString)hardwareModel;
+ (NSString)osBuild;
+ (id)_determineHardwareModel;
+ (unint64_t)_determineBootVolumeType;
+ (unint64_t)bootVolumeType;
@end

@implementation STYDeviceInfo

+ (unint64_t)bootVolumeType
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31__STYDeviceInfo_bootVolumeType__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (bootVolumeType_onceToken != -1) {
    dispatch_once(&bootVolumeType_onceToken, block);
  }
  return bootVolumeType_bootVolumeType;
}

uint64_t __31__STYDeviceInfo_bootVolumeType__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _determineBootVolumeType];
  bootVolumeType_bootVolumeType = result;
  return result;
}

+ (unint64_t)_determineBootVolumeType
{
  return 2;
}

+ (NSString)hardwareModel
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __30__STYDeviceInfo_hardwareModel__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (hardwareModel_onceToken != -1) {
    dispatch_once(&hardwareModel_onceToken, block);
  }
  v2 = (void *)hardwareModel_model;
  return (NSString *)v2;
}

uint64_t __30__STYDeviceInfo_hardwareModel__block_invoke(uint64_t a1)
{
  hardwareModel_model = [*(id *)(a1 + 32) _determineHardwareModel];
  return MEMORY[0x1F41817F8]();
}

+ (NSString)osBuild
{
  if (osBuild_onceToken != -1) {
    dispatch_once(&osBuild_onceToken, &__block_literal_global_1);
  }
  v2 = (void *)osBuild_osBuild;
  return (NSString *)v2;
}

void __24__STYDeviceInfo_osBuild__block_invoke()
{
  id v2 = (id)_CFCopySupplementalVersionDictionary();
  uint64_t v0 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F1CD10]];
  v1 = (void *)osBuild_osBuild;
  osBuild_osBuild = v0;
}

+ (id)_determineHardwareModel
{
  size_t size = 0;
  sysctlbyname("hw.model", 0, &size, 0, 0);
  if (size)
  {
    id v2 = malloc_type_malloc(size, 0x100004077774924uLL);
    sysctlbyname("hw.model", v2, &size, 0, 0);
    v3 = [NSString stringWithUTF8String:v2];
    free(v2);
  }
  else
  {
    v3 = @"model_name_unavailable";
  }
  return v3;
}

+ (BOOL)isMemoryConstrained
{
  if (isMemoryConstrained_onceToken != -1) {
    dispatch_once(&isMemoryConstrained_onceToken, &__block_literal_global_4);
  }
  return isMemoryConstrained_isMemoryConstrained;
}

void __36__STYDeviceInfo_isMemoryConstrained__block_invoke()
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  size_t v10 = 8;
  unint64_t v11 = 0;
  int v0 = sysctlbyname("hw.memsize", &v11, &v10, 0, 0);
  if (v0)
  {
    int v1 = v0;
    int v2 = *__error();
    v3 = +[STYFrameworkHelper sharedHelper];
    v4 = [v3 logHandle];

    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __36__STYDeviceInfo_isMemoryConstrained__block_invoke_cold_1(v2, v1, v4);
    }

    v5 = +[STYFrameworkHelper sharedHelper];
    v6 = [v5 logHandle];

    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D3037000, v6, OS_LOG_TYPE_DEFAULT, "Going ahead with default threshold", buf, 2u);
    }

LABEL_10:
    isMemoryConstrained_isMemoryConstrained = 1;
    return;
  }
  unint64_t v7 = v11;
  v8 = +[STYFrameworkHelper sharedHelper];
  v9 = [v8 logHandle];

  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v13 = v7 >> 20;
    _os_log_impl(&dword_1D3037000, v9, OS_LOG_TYPE_DEFAULT, "physicalSizeinMB is %lld ", buf, 0xCu);
  }

  if (v7 >> 22 <= 0x1DA) {
    goto LABEL_10;
  }
}

+ (BOOL)isAppleInternal
{
  return MEMORY[0x1F40CD648]("com.apple.Sentry", a2);
}

void __36__STYDeviceInfo_isMemoryConstrained__block_invoke_cold_1(int a1, int a2, NSObject *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v4[0] = 67109634;
  v4[1] = a2;
  __int16 v5 = 1024;
  int v6 = a1;
  __int16 v7 = 2080;
  v8 = strerror(a1);
  _os_log_error_impl(&dword_1D3037000, a3, OS_LOG_TYPE_ERROR, "Failed to retrieve memory size. return code : %d errNum : %d errStr: %s", (uint8_t *)v4, 0x18u);
}

@end