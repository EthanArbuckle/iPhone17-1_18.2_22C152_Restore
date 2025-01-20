@interface SBLockScreenContentAssertionTestRecipe
- (id)title;
- (void)handleVolumeDecrease;
- (void)handleVolumeIncrease;
@end

@implementation SBLockScreenContentAssertionTestRecipe

- (id)title
{
  return @"Lock Screen Content Assertion";
}

- (void)handleVolumeIncrease
{
  if (!self->_currentAssertion)
  {
    id v6 = xpc_null_create();
    v3 = (void *)[objc_alloc(MEMORY[0x1E4FA6BF0]) initWithServiceName:@"com.apple.TestRemoteAlert" viewControllerClassName:@"RemoteContentViewController" xpcEndpoint:v6 userInfo:0];
    v4 = [MEMORY[0x1E4FA6B30] acquireRemoteContentAssertionWithDefinition:v3 errorHandler:&__block_literal_global_392];
    currentAssertion = self->_currentAssertion;
    self->_currentAssertion = v4;
  }
}

- (void)handleVolumeDecrease
{
  [(SBSLockScreenRemoteContentAssertion *)self->_currentAssertion invalidate];
  currentAssertion = self->_currentAssertion;
  self->_currentAssertion = 0;
}

- (void).cxx_destruct
{
}

@end