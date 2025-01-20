@interface SBLegacyLockScreenEnvironment
- (NSString)description;
- (SBApplicationHosting)applicationHoster;
- (SBAutoUnlockRule)autoUnlockRule;
- (SBBiometricUnlockBehavior)biometricUnlockBehavior;
- (SBButtonEventsHandler)buttonEventsHandler;
- (SBFScreenWakeAnimationTarget)screenWakeAnimationTarget;
- (SBIdleTimerProviding)idleTimerProvider;
- (SBLegacyLockScreenEnvironment)initWithLockScreenViewController:(id)a3;
- (SBLockScreenApplicationLaunching)applicationLauncher;
- (SBLockScreenBacklightControlling)backlightController;
- (SBLockScreenBehaviorSuppressing)behaviorSuppressor;
- (SBLockScreenBlockedStateObserving)blockedStateObserver;
- (SBLockScreenButtonObserving)buttonObserver;
- (SBLockScreenCallHandling)callController;
- (SBLockScreenContentStateProviding)contentStateProvider;
- (SBLockScreenCustomActionStoring)customActionStore;
- (SBLockScreenIdleTimerControlling)idleTimerController;
- (SBLockScreenLockingAndUnlocking)lockController;
- (SBLockScreenMediaControlsPresenting)mediaControlsPresenter;
- (SBLockScreenPasscodeViewPresenting)passcodeViewPresenter;
- (SBLockScreenPluginPresenting)pluginPresenter;
- (SBLockScreenProximityBehaviorProviding)proximityBehaviorProvider;
- (SBLockScreenSpotlightPresenting)spotlightPresenter;
- (SBLockScreenStatusBarTransitioning)statusBarTransitionController;
- (SBSWidgetMetricsProviding)widgetMetricsProvider;
- (UIViewController)rootViewController;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
@end

@implementation SBLegacyLockScreenEnvironment

- (SBLegacyLockScreenEnvironment)initWithLockScreenViewController:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBLegacyLockScreenEnvironment;
  v6 = [(SBLegacyLockScreenEnvironment *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_lockScreenViewController, a3);
  }

  return v7;
}

- (UIViewController)rootViewController
{
  return (UIViewController *)self->_lockScreenViewController;
}

- (SBAutoUnlockRule)autoUnlockRule
{
  return (SBAutoUnlockRule *)self->_lockScreenViewController;
}

- (SBBiometricUnlockBehavior)biometricUnlockBehavior
{
  return (SBBiometricUnlockBehavior *)self->_lockScreenViewController;
}

- (SBButtonEventsHandler)buttonEventsHandler
{
  return (SBButtonEventsHandler *)self->_lockScreenViewController;
}

- (SBApplicationHosting)applicationHoster
{
  return (SBApplicationHosting *)self->_lockScreenViewController;
}

- (SBIdleTimerProviding)idleTimerProvider
{
  return (SBIdleTimerProviding *)self->_lockScreenViewController;
}

- (SBFScreenWakeAnimationTarget)screenWakeAnimationTarget
{
  return [(SBLockScreenViewControllerBase *)self->_lockScreenViewController legacyWallpaperWakeAnimator];
}

- (SBLockScreenApplicationLaunching)applicationLauncher
{
  return 0;
}

- (SBLockScreenBacklightControlling)backlightController
{
  return (SBLockScreenBacklightControlling *)self->_lockScreenViewController;
}

- (SBLockScreenBehaviorSuppressing)behaviorSuppressor
{
  return (SBLockScreenBehaviorSuppressing *)self->_lockScreenViewController;
}

- (SBLockScreenBlockedStateObserving)blockedStateObserver
{
  return (SBLockScreenBlockedStateObserving *)self->_lockScreenViewController;
}

- (SBLockScreenButtonObserving)buttonObserver
{
  return (SBLockScreenButtonObserving *)self->_lockScreenViewController;
}

- (SBLockScreenCallHandling)callController
{
  return (SBLockScreenCallHandling *)self->_lockScreenViewController;
}

- (SBLockScreenContentStateProviding)contentStateProvider
{
  return (SBLockScreenContentStateProviding *)self->_lockScreenViewController;
}

- (SBLockScreenCustomActionStoring)customActionStore
{
  return (SBLockScreenCustomActionStoring *)self->_lockScreenViewController;
}

- (SBLockScreenIdleTimerControlling)idleTimerController
{
  return (SBLockScreenIdleTimerControlling *)self->_lockScreenViewController;
}

- (SBLockScreenLockingAndUnlocking)lockController
{
  return (SBLockScreenLockingAndUnlocking *)self->_lockScreenViewController;
}

- (SBLockScreenMediaControlsPresenting)mediaControlsPresenter
{
  return (SBLockScreenMediaControlsPresenting *)self->_lockScreenViewController;
}

- (SBLockScreenPasscodeViewPresenting)passcodeViewPresenter
{
  return (SBLockScreenPasscodeViewPresenting *)self->_lockScreenViewController;
}

- (SBLockScreenPluginPresenting)pluginPresenter
{
  return (SBLockScreenPluginPresenting *)self->_lockScreenViewController;
}

- (SBLockScreenProximityBehaviorProviding)proximityBehaviorProvider
{
  return (SBLockScreenProximityBehaviorProviding *)self->_lockScreenViewController;
}

- (SBLockScreenStatusBarTransitioning)statusBarTransitionController
{
  return (SBLockScreenStatusBarTransitioning *)self->_lockScreenViewController;
}

- (SBSWidgetMetricsProviding)widgetMetricsProvider
{
  return 0;
}

- (SBLockScreenSpotlightPresenting)spotlightPresenter
{
  return 0;
}

- (NSString)description
{
  return (NSString *)[(SBLegacyLockScreenEnvironment *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(SBLegacyLockScreenEnvironment *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = (id)[v3 appendObject:self->_lockScreenViewController withName:@"lockScreenViewController"];
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(SBLegacyLockScreenEnvironment *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (void).cxx_destruct
{
}

@end