@interface NSProcessInfo(SafariCoreExtras)
- (id)_safari_operatingSystemVersionStringFromOperatingSystemVersion:()SafariCoreExtras;
- (id)safari_deviceUDID;
- (id)safari_operatingSystemVersionString;
- (uint64_t)safari_isPasswordManagerTestMode;
- (uint64_t)safari_systemSupportsBookmarkDAVMoves;
@end

@implementation NSProcessInfo(SafariCoreExtras)

- (uint64_t)safari_isPasswordManagerTestMode
{
  if (safari_isPasswordManagerTestMode_onceToken != -1) {
    dispatch_once(&safari_isPasswordManagerTestMode_onceToken, &__block_literal_global_10_0);
  }
  return safari_isPasswordManagerTestMode_isTestMode;
}

- (id)safari_operatingSystemVersionString
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__NSProcessInfo_SafariCoreExtras__safari_operatingSystemVersionString__block_invoke;
  block[3] = &unk_1E615A768;
  block[4] = a1;
  if (safari_operatingSystemVersionString_onceToken != -1) {
    dispatch_once(&safari_operatingSystemVersionString_onceToken, block);
  }
  return (id)safari_operatingSystemVersionString_osVersionString;
}

- (id)_safari_operatingSystemVersionStringFromOperatingSystemVersion:()SafariCoreExtras
{
  uint64_t v3 = a3[2];
  if (v3) {
    objc_msgSend(NSString, "stringWithFormat:", @"%ld.%ld.%ld", *a3, a3[1], v3);
  }
  else {
  v4 = objc_msgSend(NSString, "stringWithFormat:", @"%ld.%ld", *a3, a3[1], v6);
  }
  return v4;
}

- (id)safari_deviceUDID
{
  if (safari_deviceUDID_onceToken != -1) {
    dispatch_once(&safari_deviceUDID_onceToken, &__block_literal_global_27);
  }
  v0 = (void *)safari_deviceUDID_udid;
  return v0;
}

- (uint64_t)safari_systemSupportsBookmarkDAVMoves
{
  return 1;
}

@end