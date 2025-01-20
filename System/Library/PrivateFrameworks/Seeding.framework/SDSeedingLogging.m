@interface SDSeedingLogging
+ (OS_os_log)analyticsHandle;
+ (OS_os_log)betaHandle;
+ (OS_os_log)httpHandle;
+ (OS_os_log)mdmHandle;
+ (OS_os_log)migrateHandle;
+ (OS_os_log)profileHandle;
+ (id)fwHandle;
@end

@implementation SDSeedingLogging

+ (id)fwHandle
{
  if (fwHandle_onceToken != -1) {
    dispatch_once(&fwHandle_onceToken, &__block_literal_global_3);
  }
  v2 = (void *)fwHandle_handle;
  return v2;
}

uint64_t __28__SDSeedingLogging_fwHandle__block_invoke()
{
  fwHandle_handle = (uint64_t)os_log_create("com.apple.seeding", "Framework");
  return MEMORY[0x1F41817F8]();
}

+ (OS_os_log)httpHandle
{
  if (httpHandle_onceToken != -1) {
    dispatch_once(&httpHandle_onceToken, &__block_literal_global_5);
  }
  v2 = (void *)httpHandle_handle;
  return (OS_os_log *)v2;
}

uint64_t __30__SDSeedingLogging_httpHandle__block_invoke()
{
  httpHandle_handle = (uint64_t)os_log_create("com.apple.seeding", "HTTP");
  return MEMORY[0x1F41817F8]();
}

+ (OS_os_log)profileHandle
{
  if (profileHandle_onceToken != -1) {
    dispatch_once(&profileHandle_onceToken, &__block_literal_global_8);
  }
  v2 = (void *)profileHandle_handle;
  return (OS_os_log *)v2;
}

uint64_t __33__SDSeedingLogging_profileHandle__block_invoke()
{
  profileHandle_handle = (uint64_t)os_log_create("com.apple.seeding", "Profile");
  return MEMORY[0x1F41817F8]();
}

+ (OS_os_log)migrateHandle
{
  if (migrateHandle_onceToken != -1) {
    dispatch_once(&migrateHandle_onceToken, &__block_literal_global_11);
  }
  v2 = (void *)migrateHandle_handle;
  return (OS_os_log *)v2;
}

uint64_t __33__SDSeedingLogging_migrateHandle__block_invoke()
{
  migrateHandle_handle = (uint64_t)os_log_create("com.apple.seeding", "migrate");
  return MEMORY[0x1F41817F8]();
}

+ (OS_os_log)betaHandle
{
  if (betaHandle_onceToken != -1) {
    dispatch_once(&betaHandle_onceToken, &__block_literal_global_14);
  }
  v2 = (void *)betaHandle_handle;
  return (OS_os_log *)v2;
}

uint64_t __30__SDSeedingLogging_betaHandle__block_invoke()
{
  betaHandle_handle = (uint64_t)os_log_create("com.apple.seeding", "sd-beta");
  return MEMORY[0x1F41817F8]();
}

+ (OS_os_log)analyticsHandle
{
  if (analyticsHandle_onceToken != -1) {
    dispatch_once(&analyticsHandle_onceToken, &__block_literal_global_17_0);
  }
  v2 = (void *)analyticsHandle_handle;
  return (OS_os_log *)v2;
}

uint64_t __35__SDSeedingLogging_analyticsHandle__block_invoke()
{
  analyticsHandle_handle = (uint64_t)os_log_create("com.apple.seeding", "analytics");
  return MEMORY[0x1F41817F8]();
}

+ (OS_os_log)mdmHandle
{
  if (mdmHandle_onceToken != -1) {
    dispatch_once(&mdmHandle_onceToken, &__block_literal_global_20);
  }
  v2 = (void *)mdmHandle_handle;
  return (OS_os_log *)v2;
}

uint64_t __29__SDSeedingLogging_mdmHandle__block_invoke()
{
  mdmHandle_handle = (uint64_t)os_log_create("com.apple.seeding", "mdm");
  return MEMORY[0x1F41817F8]();
}

@end