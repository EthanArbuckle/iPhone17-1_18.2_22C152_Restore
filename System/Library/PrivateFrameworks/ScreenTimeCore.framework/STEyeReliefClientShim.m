@interface STEyeReliefClientShim
+ (BOOL)isScreenDistanceEnabled;
+ (BOOL)toggleDistanceSampling;
@end

@implementation STEyeReliefClientShim

+ (BOOL)isScreenDistanceEnabled
{
  v2 = objc_opt_new();
  unsigned __int8 v3 = [v2 isDistanceSamplingEnabledWithError:0];

  return v3;
}

+ (BOOL)toggleDistanceSampling
{
  v2 = objc_opt_new();
  unsigned __int8 v3 = [v2 toggleDistanceSampling:0];

  return v3;
}

@end