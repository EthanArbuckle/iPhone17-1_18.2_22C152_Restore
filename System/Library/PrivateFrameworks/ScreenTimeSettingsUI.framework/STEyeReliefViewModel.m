@interface STEyeReliefViewModel
- (BOOL)hasAcknowledgedIntroScreens;
- (BOOL)inDemoMode;
- (BOOL)isEyeReliefEnabled;
- (void)acknowledgeIntroScreens;
- (void)setIsEyeReliefEnabled:(BOOL)a3;
@end

@implementation STEyeReliefViewModel

- (BOOL)inDemoMode
{
  v2 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.EyeRelief"];
  char v3 = [v2 BOOLForKey:@"OnboardingDemoMode"];

  return v3;
}

- (BOOL)hasAcknowledgedIntroScreens
{
  v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  char v3 = [v2 BOOLForKey:@"ScreenTimeEyeReliefIntroAcknowledged"];

  return v3;
}

- (void)acknowledgeIntroScreens
{
  id v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  [v2 setBool:1 forKey:@"ScreenTimeEyeReliefIntroAcknowledged"];
}

- (BOOL)isEyeReliefEnabled
{
  return self->_isEyeReliefEnabled;
}

- (void)setIsEyeReliefEnabled:(BOOL)a3
{
  self->_isEyeReliefEnabled = a3;
}

@end