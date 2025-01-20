@interface NSProcessInfo
@end

@implementation NSProcessInfo

void __67__NSProcessInfo_SafariCoreExtras__safari_isPasswordManagerTestMode__block_invoke()
{
  v0 = [MEMORY[0x1E4F28F80] processInfo];
  v1 = [v0 environment];
  id v2 = [v1 objectForKeyedSubscript:@"PASSWORD_MANAGER_TESTING"];

  if ([v2 BOOLValue]) {
    safari_isPasswordManagerTestMode_isTestMode = +[WBSFeatureAvailability isInternalInstall];
  }
}

void __70__NSProcessInfo_SafariCoreExtras__safari_operatingSystemVersionString__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  if (v1) {
    [*(id *)(a1 + 32) operatingSystemVersion];
  }
  else {
    memset(v4, 0, sizeof(v4));
  }
  uint64_t v2 = objc_msgSend(v1, "_safari_operatingSystemVersionStringFromOperatingSystemVersion:", v4);
  v3 = (void *)safari_operatingSystemVersionString_osVersionString;
  safari_operatingSystemVersionString_osVersionString = v2;
}

void __52__NSProcessInfo_SafariCoreExtras__safari_deviceUDID__block_invoke()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v4.tv_sec = 0;
  v4.tv_nsec = 0;
  memset(v5, 0, sizeof(v5));
  if (gethostuuid(v5, &v4)) {
    id v0 = objc_alloc_init(MEMORY[0x1E4F29128]);
  }
  else {
    id v0 = (id)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:v5];
  }
  v1 = v0;
  uint64_t v2 = [v0 UUIDString];
  v3 = (void *)safari_deviceUDID_udid;
  safari_deviceUDID_udid = v2;
}

@end