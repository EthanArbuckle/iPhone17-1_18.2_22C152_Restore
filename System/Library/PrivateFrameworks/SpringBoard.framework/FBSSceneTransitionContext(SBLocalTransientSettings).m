@interface FBSSceneTransitionContext(SBLocalTransientSettings)
- (double)watchdogScaleFactor;
- (void)setWatchdogScaleFactor:()SBLocalTransientSettings;
@end

@implementation FBSSceneTransitionContext(SBLocalTransientSettings)

- (void)setWatchdogScaleFactor:()SBLocalTransientSettings
{
  id v4 = [a1 transientLocalClientSettings];
  v3 = [NSNumber numberWithDouble:a2];
  [v4 setObject:v3 forSetting:1];
}

- (double)watchdogScaleFactor
{
  v1 = [a1 transientLocalClientSettings];
  v2 = [v1 objectForSetting:1];

  if (v2)
  {
    [v2 doubleValue];
    double v4 = v3;
  }
  else
  {
    double v4 = 1.0;
  }

  return v4;
}

@end