@interface SBBacklightServicesPlatformProvider
- (BLSHBacklightPlatformProvider)backlightPlatformProvider;
- (SBAlwaysOnPolicyCoordinator)alwaysOnPolicyCoordinator;
- (SBBacklightServicesPlatformProvider)init;
- (SBBacklightServicesPlatformProvider)initWithBacklightEnvironmentSessionProvider:(id)a3;
- (SBBacklightSignificantUserInteractionMonitor)significantUserInteractionMonitor;
- (UIWindowScene)windowScene;
- (void)completeInitializationAfterBLSStartup;
- (void)setSignificantUserInteractionMonitor:(id)a3;
- (void)setWindowScene:(id)a3;
@end

@implementation SBBacklightServicesPlatformProvider

- (SBBacklightServicesPlatformProvider)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  v5 = NSStringFromSelector(sel_initWithBacklightEnvironmentSessionProvider_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SBBacklightServicesPlatformProvider.m", 24, @"%s is unavailable; use %@ instead",
    "-[SBBacklightServicesPlatformProvider init]",
    v5);

  return 0;
}

- (SBBacklightServicesPlatformProvider)initWithBacklightEnvironmentSessionProvider:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBBacklightServicesPlatformProvider;
  v5 = [(SBBacklightServicesPlatformProvider *)&v9 init];
  if (v5)
  {
    v6 = [[SBBacklightPlatformProvider alloc] initWithBacklightEnvironmentSessionProvider:v4];
    backlightPlatformProvider = v5->_backlightPlatformProvider;
    v5->_backlightPlatformProvider = v6;
  }
  return v5;
}

- (void)completeInitializationAfterBLSStartup
{
}

- (UIWindowScene)windowScene
{
  return [(SBBacklightPlatformProvider *)self->_backlightPlatformProvider windowScene];
}

- (void)setWindowScene:(id)a3
{
}

- (SBBacklightSignificantUserInteractionMonitor)significantUserInteractionMonitor
{
  return [(SBBacklightPlatformProvider *)self->_backlightPlatformProvider significantUserInteractionMonitor];
}

- (void)setSignificantUserInteractionMonitor:(id)a3
{
}

- (SBAlwaysOnPolicyCoordinator)alwaysOnPolicyCoordinator
{
  return [(SBBacklightPlatformProvider *)self->_backlightPlatformProvider alwaysOnPolicyCoordinator];
}

- (BLSHBacklightPlatformProvider)backlightPlatformProvider
{
  return (BLSHBacklightPlatformProvider *)self->_backlightPlatformProvider;
}

- (void).cxx_destruct
{
}

@end