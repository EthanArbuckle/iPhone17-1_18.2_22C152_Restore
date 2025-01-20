@interface SBBacklightControllerDefaultContext
- (BLSHBacklightHostObservable)blsBacklight;
- (SBHIDUISensorModeController)HIDUISensorModeController;
- (SBIdleTimerDefaults)idleTimerDefaults;
- (SBLockScreenManager)lockScreenManager;
- (SBProximitySensorManager)proximitySensorManager;
- (SBScreenSleepCoordinator)screenSleepCoordinator;
- (SBScreenWakeAnimationController)screenWakeAnimationController;
- (SBWakeLogger)wakeLogger;
@end

@implementation SBBacklightControllerDefaultContext

- (BLSHBacklightHostObservable)blsBacklight
{
  return (BLSHBacklightHostObservable *)[MEMORY[0x1E4F4F550] sharedBacklightHost];
}

- (SBLockScreenManager)lockScreenManager
{
  return (SBLockScreenManager *)+[SBLockScreenManager sharedInstanceIfExists];
}

- (SBIdleTimerDefaults)idleTimerDefaults
{
  v2 = +[SBDefaults localDefaults];
  v3 = [v2 idleTimerDefaults];

  return (SBIdleTimerDefaults *)v3;
}

- (SBScreenSleepCoordinator)screenSleepCoordinator
{
  return (SBScreenSleepCoordinator *)[(id)SBApp screenSleepCoordinator];
}

- (SBScreenWakeAnimationController)screenWakeAnimationController
{
  return +[SBScreenWakeAnimationController sharedInstance];
}

- (SBWakeLogger)wakeLogger
{
  return (SBWakeLogger *)[MEMORY[0x1E4FA60D0] sharedInstance];
}

- (SBHIDUISensorModeController)HIDUISensorModeController
{
  return (SBHIDUISensorModeController *)[(id)SBApp HIDUISensorController];
}

- (SBProximitySensorManager)proximitySensorManager
{
  return (SBProximitySensorManager *)[(id)SBApp proximitySensorManager];
}

@end