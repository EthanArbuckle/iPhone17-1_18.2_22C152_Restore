@interface FCGeoUtilities
+ (BOOL)isRunningInSupportedRegion;
+ (id)currentRegion;
@end

@implementation FCGeoUtilities

+ (BOOL)isRunningInSupportedRegion
{
  v2 = NewsCoreUserDefaults();
  char v3 = [v2 BOOLForKey:@"simulate_unsupported_region"];

  if (v3)
  {
    LOBYTE(v4) = 0;
  }
  else
  {
    v5 = [MEMORY[0x1E4F64500] sharedConfiguration];
    v6 = [v5 countryCode];

    int v4 = [v6 isEqualToString:@"CN"] ^ 1;
  }
  return v4;
}

+ (id)currentRegion
{
  v2 = [MEMORY[0x1E4F64500] sharedConfiguration];
  char v3 = [v2 countryCode];

  return v3;
}

@end