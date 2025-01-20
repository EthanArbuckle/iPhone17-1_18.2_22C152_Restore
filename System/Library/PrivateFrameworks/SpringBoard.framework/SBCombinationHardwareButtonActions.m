@interface SBCombinationHardwareButtonActions
- (void)performPresentPowerDownTransientOverlayAction;
- (void)performTakeScreenshotAction;
@end

@implementation SBCombinationHardwareButtonActions

- (void)performTakeScreenshotAction
{
  v2 = +[SBLockScreenManager sharedInstance];
  v3 = [v2 lockScreenEnvironment];
  v4 = [v3 backlightController];
  char v5 = [v4 isInScreenOffMode];

  if ((v5 & 1) == 0)
  {
    v6 = (void *)SBApp;
    [v6 takeScreenshot];
  }
}

- (void)performPresentPowerDownTransientOverlayAction
{
  id v2 = +[SBWorkspace mainWorkspace];
  [v2 presentPowerDownTransientOverlay];
}

@end