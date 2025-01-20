@interface PLRevGeoLocationHelper
+ (BOOL)isAutoNaviCountryCode:(id)a3;
+ (BOOL)isAutoNaviRevGeoProvider:(id)a3;
+ (BOOL)isCurrentRevGeoProviderAutoNavi;
+ (id)appleProviderID;
+ (id)autoNaviCountryCode;
+ (id)autoNaviProviderID;
+ (id)currentRevGeoProvider;
+ (void)simulateAutoNaviForBlock:(id)a3;
@end

@implementation PLRevGeoLocationHelper

+ (id)autoNaviCountryCode
{
  return @"CN";
}

+ (id)currentRevGeoProvider
{
  v2 = [getGEOCountryConfigurationClass() sharedConfiguration];
  v3 = [v2 countryCode];

  if ([v3 isEqualToString:@"CN"]) {
    goto LABEL_5;
  }
  if (SimulateGeoServiceAutoNaviProvider_onceToken != -1) {
    dispatch_once(&SimulateGeoServiceAutoNaviProvider_onceToken, &__block_literal_global_17138);
  }
  if (simulateGeoServiceAutoNaviProvider) {
LABEL_5:
  }
    v4 = @"35230";
  else {
    v4 = @"7618";
  }

  return v4;
}

+ (BOOL)isAutoNaviCountryCode:(id)a3
{
  return [a3 isEqualToString:@"CN"];
}

+ (BOOL)isAutoNaviRevGeoProvider:(id)a3
{
  return [a3 isEqualToString:@"35230"];
}

+ (BOOL)isCurrentRevGeoProviderAutoNavi
{
  v2 = [getGEOCountryConfigurationClass() sharedConfiguration];
  v3 = [v2 countryCode];

  if ([v3 isEqualToString:@"CN"])
  {
    BOOL v4 = 1;
  }
  else
  {
    if (SimulateGeoServiceAutoNaviProvider_onceToken != -1) {
      dispatch_once(&SimulateGeoServiceAutoNaviProvider_onceToken, &__block_literal_global_17138);
    }
    BOOL v4 = simulateGeoServiceAutoNaviProvider != 0;
  }

  return v4;
}

+ (void)simulateAutoNaviForBlock:(id)a3
{
  uint64_t v3 = SimulateGeoServiceAutoNaviProvider_onceToken;
  BOOL v4 = (void (**)(void))a3;
  if (v3 != -1) {
    dispatch_once(&SimulateGeoServiceAutoNaviProvider_onceToken, &__block_literal_global_17138);
  }
  char v5 = simulateGeoServiceAutoNaviProvider;
  simulateGeoServiceAutoNaviProvider = 1;
  v4[2](v4);

  simulateGeoServiceAutoNaviProvider = v5;
}

+ (id)appleProviderID
{
  return @"7618";
}

+ (id)autoNaviProviderID
{
  return @"35230";
}

@end