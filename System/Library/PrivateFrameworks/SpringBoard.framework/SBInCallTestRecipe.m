@interface SBInCallTestRecipe
- (id)title;
- (void)handleVolumeDecrease;
- (void)handleVolumeIncrease;
@end

@implementation SBInCallTestRecipe

- (id)title
{
  return @"InCall";
}

- (void)handleVolumeIncrease
{
  if (!self->_isPresentationActive)
  {
    self->_isPresentationActive = 1;
    id v2 = (id)[objc_alloc(MEMORY[0x1E4FA6AF8]) initWithSceneBundleIdentifier:@"com.apple.FakePhone"];
    [MEMORY[0x1E4FA6B00] performPresentationWithConfiguration:v2 completion:0];
  }
}

- (void)handleVolumeDecrease
{
  if (self->_isPresentationActive)
  {
    self->_isPresentationActive = 0;
    id v3 = +[SBWorkspace mainWorkspace];
    id v2 = [v3 inCallPresentationManager];
    [v2 _dismissAllPresentations];
  }
}

@end