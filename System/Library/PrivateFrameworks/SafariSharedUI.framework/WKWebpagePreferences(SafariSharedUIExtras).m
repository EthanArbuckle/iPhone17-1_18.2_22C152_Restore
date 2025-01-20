@interface WKWebpagePreferences(SafariSharedUIExtras)
- (uint64_t)safari_areAdvancedPrivacyProtectionsEnabled;
- (uint64_t)safari_setAdvancedPrivacyProtectionsEnabled:()SafariSharedUIExtras privateBrowsing:;
@end

@implementation WKWebpagePreferences(SafariSharedUIExtras)

- (uint64_t)safari_areAdvancedPrivacyProtectionsEnabled
{
  return [a1 _networkConnectionIntegrityPolicy] & 1;
}

- (uint64_t)safari_setAdvancedPrivacyProtectionsEnabled:()SafariSharedUIExtras privateBrowsing:
{
  uint64_t v4 = 321;
  if (a4) {
    uint64_t v4 = 449;
  }
  if (a3) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  return [a1 _setNetworkConnectionIntegrityPolicy:v5];
}

@end