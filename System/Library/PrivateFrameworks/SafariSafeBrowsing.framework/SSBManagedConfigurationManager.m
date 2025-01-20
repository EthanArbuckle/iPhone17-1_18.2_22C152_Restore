@interface SSBManagedConfigurationManager
+ (BOOL)isSafeBrowsingEnabledStateLockedDownByRestrictions;
+ (BOOL)restrictedBoolValueForSafeBrowsing;
@end

@implementation SSBManagedConfigurationManager

+ (BOOL)isSafeBrowsingEnabledStateLockedDownByRestrictions
{
  v2 = [MEMORY[0x263F53C50] sharedConnection];
  char v3 = [v2 isBoolSettingLockedDownByRestrictions:*MEMORY[0x263F53A38]];

  return v3;
}

+ (BOOL)restrictedBoolValueForSafeBrowsing
{
  v2 = [MEMORY[0x263F53C50] sharedConnection];
  BOOL v3 = [v2 BOOLRestrictionForFeature:*MEMORY[0x263F53A38]] != 2;

  return v3;
}

@end