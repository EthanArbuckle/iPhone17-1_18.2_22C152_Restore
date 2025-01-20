@interface SBLockScreenViewControllerBase
- (BOOL)canBeDeactivatedForUIUnlockFromSource:(int)a3;
- (BOOL)canHostAnApp;
- (BOOL)contentOccludesBackground;
- (BOOL)expectsFaceContact;
- (BOOL)handleHeadsetButtonPress:(BOOL)a3;
- (BOOL)handleHomeButtonDoublePress;
- (BOOL)handleHomeButtonLongPress;
- (BOOL)handleHomeButtonPress;
- (BOOL)handleLockButtonPress;
- (BOOL)handleVoiceCommandButtonPress;
- (BOOL)handleVolumeDownButtonPress;
- (BOOL)handleVolumeUpButtonPress;
- (BOOL)isAuthenticated;
- (BOOL)isHostingAnApp;
- (BOOL)isInScreenOffMode;
- (BOOL)isMainPageVisible;
- (BOOL)isMakingEmergencyCall;
- (BOOL)isPasscodeLockVisible;
- (BOOL)isShowingMediaControls;
- (BOOL)isUnlockDisabled;
- (BOOL)shouldAutoUnlockForSource:(int)a3;
- (BOOL)shouldDisableALS;
- (BOOL)shouldPresentOrDismissCoverSheetSpotlight;
- (BOOL)shouldShowLockStatusBarTime;
- (BOOL)shouldUnlockUIOnKeyDownEvent;
- (BOOL)suppressesBanners;
- (BOOL)suppressesControlCenter;
- (BOOL)suppressesScreenshots;
- (BOOL)willUIUnlockFromSource:(int)a3;
- (SBBiometricUnlockBehaviorDelegate)biometricUnlockBehaviorDelegate;
- (SBFLegacyWallpaperWakeAnimator)legacyWallpaperWakeAnimator;
- (SBFLockScreenActionContext)_customLockScreenActionContext;
- (SBIdleTimerCoordinating)idleTimerCoordinator;
- (UIVisualEffectView)wakeEffectView;
- (double)backlightLevel;
- (id)coordinatorRequestedIdleTimerBehavior:(id)a3;
- (id)createHomeButtonShowPasscodeRecognizerForHomeButtonPress;
- (id)createHomeButtonSuppressAfterUnlockRecognizerForUnlockSource:(int)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)hostedAppSceneHandle;
- (id)hostedAppSceneHandles;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)backlightLuminance;
- (void)jiggleLockIcon;
- (void)prepareForUILock;
- (void)prepareForUIUnlock;
- (void)setAuthenticated:(BOOL)a3;
- (void)setBacklightLevel:(double)a3;
- (void)setBiometricUnlockBehaviorDelegate:(id)a3;
- (void)setCustomLockScreenActionContext:(id)a3;
- (void)setIdleTimerCoordinator:(id)a3;
- (void)setInScreenOffMode:(BOOL)a3;
- (void)setInScreenOffMode:(BOOL)a3 forAutoUnlock:(BOOL)a4 fromUnlockSource:(int)a5;
- (void)setPasscodeLockVisible:(BOOL)a3 animated:(BOOL)a4;
- (void)setPasscodeLockVisible:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)setWakeEffectView:(id)a3;
- (void)viewDidLoad;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation SBLockScreenViewControllerBase

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)SBLockScreenViewControllerBase;
  [(SBLockScreenViewControllerBase *)&v8 viewDidLoad];
  v3 = [(SBLockScreenViewControllerBase *)self view];
  id v4 = objc_alloc(MEMORY[0x1E4F43028]);
  [v3 bounds];
  v5 = objc_msgSend(v4, "initWithFrame:");
  [v5 setAutoresizingMask:18];
  [v3 addSubview:v5];
  [v3 sendSubviewToBack:v5];
  v6 = (SBFLegacyWallpaperWakeAnimator *)objc_alloc_init(MEMORY[0x1E4FA5F30]);
  legacyWallpaperWakeAnimator = self->_legacyWallpaperWakeAnimator;
  self->_legacyWallpaperWakeAnimator = v6;

  [(SBFLegacyWallpaperWakeAnimator *)self->_legacyWallpaperWakeAnimator setWakeEffectView:v5];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v14.receiver = self;
  v14.super_class = (Class)SBLockScreenViewControllerBase;
  id v6 = a4;
  -[SBLockScreenViewControllerBase viewWillTransitionToSize:withTransitionCoordinator:](&v14, sel_viewWillTransitionToSize_withTransitionCoordinator_, v6, width, height);
  v7 = SBFWindowForViewControllerTransition();
  uint64_t v8 = [v7 _toWindowOrientation];

  [v6 transitionDuration];
  double v10 = v9;
  v11 = +[SBWallpaperController sharedInstance];
  [v11 orientationSource:3 willRotateToInterfaceOrientation:v8 duration:v10];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __85__SBLockScreenViewControllerBase_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v13[3] = &__block_descriptor_48_e56_v16__0___UIViewControllerTransitionCoordinatorContext__8l;
  v13[4] = v8;
  *(double *)&v13[5] = v10;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __85__SBLockScreenViewControllerBase_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
  v12[3] = &__block_descriptor_40_e56_v16__0___UIViewControllerTransitionCoordinatorContext__8l;
  v12[4] = v8;
  [v6 animateAlongsideTransition:v13 completion:v12];
}

void __85__SBLockScreenViewControllerBase_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  id v2 = +[SBWallpaperController sharedInstance];
  [v2 orientationSource:3 willAnimateRotationToInterfaceOrientation:*(void *)(a1 + 32) duration:*(double *)(a1 + 40)];
}

void __85__SBLockScreenViewControllerBase_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  id v2 = +[SBWallpaperController sharedInstance];
  [v2 orientationSource:3 didRotateFromInterfaceOrientation:*(void *)(a1 + 32)];
}

- (id)succinctDescription
{
  id v2 = [(SBLockScreenViewControllerBase *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(SBLockScreenViewControllerBase *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (BOOL)suppressesBanners
{
  return 1;
}

- (BOOL)suppressesControlCenter
{
  return 0;
}

- (BOOL)suppressesScreenshots
{
  return 0;
}

- (BOOL)isPasscodeLockVisible
{
  return 0;
}

- (void)setPasscodeLockVisible:(BOOL)a3 animated:(BOOL)a4
{
}

- (void)setPasscodeLockVisible:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
  if (a5) {
    (*((void (**)(id))a5 + 2))(a5);
  }
}

- (BOOL)isUnlockDisabled
{
  return 0;
}

- (void)prepareForUIUnlock
{
  id v2 = +[SBIdleTimerGlobalCoordinator sharedInstance];
  [v2 resetIdleTimerForReason:@"LS:PrepareForUIUnlock"];
}

- (void)prepareForUILock
{
  v3 = +[SBBacklightController sharedInstance];
  int v4 = [v3 screenIsOn];

  if (v4)
  {
    v5 = +[SBIdleTimerGlobalCoordinator sharedInstance];
    [v5 resetIdleTimerForReason:@"LS:PrepareForUILock"];

    [(SBLockScreenViewControllerBase *)self setInScreenOffMode:0];
  }
  id v6 = +[SBAlertItemsController sharedInstance];
  [v6 convertUnlockedAlertsToLockedAlerts];
}

- (BOOL)willUIUnlockFromSource:(int)a3
{
  return 1;
}

- (BOOL)canBeDeactivatedForUIUnlockFromSource:(int)a3
{
  return 1;
}

- (BOOL)isMakingEmergencyCall
{
  return 0;
}

- (BOOL)isInScreenOffMode
{
  return 0;
}

- (void)setInScreenOffMode:(BOOL)a3
{
}

- (void)setInScreenOffMode:(BOOL)a3 forAutoUnlock:(BOOL)a4 fromUnlockSource:(int)a5
{
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E4F42FF0], "_performWithAnimation:", &__block_literal_global_412, a4, *(void *)&a5);
    v5 = +[SBEventObserverRegistry sharedInstance];
    [v5 setValue:1 forState:*MEMORY[0x1E4FA6FC8]];
    id v6 = SBLockScreenDimmedNotification;
    v7 = (void *)MEMORY[0x1E4FA6FA8];
  }
  else
  {
    v5 = +[SBEventObserverRegistry sharedInstance];
    [v5 setValue:0 forState:*MEMORY[0x1E4FA6FC8]];
    id v6 = SBLockScreenUndimmedNotification;
    v7 = (void *)MEMORY[0x1E4FA6FB0];
  }

  uint64_t v8 = +[SBEventObserverRegistry sharedInstance];
  [v8 postEventToInterestedObservers:*v7];

  id v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v9 postNotificationName:*v6 object:0];
}

void __84__SBLockScreenViewControllerBase_setInScreenOffMode_forAutoUnlock_fromUnlockSource___block_invoke()
{
  id v0 = [(id)SBApp HUDController];
  [v0 dismissHUDs:1];
}

- (int64_t)backlightLuminance
{
  id v2 = [(SBLockScreenViewControllerBase *)self traitCollection];
  int64_t v3 = [v2 _backlightLuminance];

  return v3;
}

- (BOOL)handleHomeButtonPress
{
  return 0;
}

- (BOOL)handleHomeButtonDoublePress
{
  return 1;
}

- (BOOL)handleHomeButtonLongPress
{
  return 0;
}

- (BOOL)handleLockButtonPress
{
  return 0;
}

- (BOOL)handleVoiceCommandButtonPress
{
  return 0;
}

- (BOOL)handleVolumeUpButtonPress
{
  return 0;
}

- (BOOL)handleVolumeDownButtonPress
{
  return 0;
}

- (BOOL)handleHeadsetButtonPress:(BOOL)a3
{
  return 0;
}

- (BOOL)canHostAnApp
{
  return 0;
}

- (BOOL)isHostingAnApp
{
  return 0;
}

- (id)hostedAppSceneHandle
{
  return 0;
}

- (id)hostedAppSceneHandles
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (BOOL)contentOccludesBackground
{
  return 0;
}

- (BOOL)shouldDisableALS
{
  return 1;
}

- (BOOL)shouldShowLockStatusBarTime
{
  return 0;
}

- (SBFLockScreenActionContext)_customLockScreenActionContext
{
  return self->_customLockScreenActionContext;
}

- (void)setCustomLockScreenActionContext:(id)a3
{
  v5 = (SBFLockScreenActionContext *)a3;
  if (self->_customLockScreenActionContext != v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_customLockScreenActionContext, a3);
    v5 = v6;
  }
}

- (BOOL)isShowingMediaControls
{
  return 0;
}

- (id)createHomeButtonShowPasscodeRecognizerForHomeButtonPress
{
  return 0;
}

- (id)createHomeButtonSuppressAfterUnlockRecognizerForUnlockSource:(int)a3
{
  return 0;
}

- (void)jiggleLockIcon
{
  id v2 = [(UIViewController *)self _sbWindowScene];
  id v4 = [v2 statusBarManager];

  int64_t v3 = [v4 statusBar];
  [v3 jiggleLockIcon];
}

- (BOOL)isMainPageVisible
{
  return 0;
}

- (BOOL)shouldUnlockUIOnKeyDownEvent
{
  return 1;
}

- (BOOL)shouldAutoUnlockForSource:(int)a3
{
  return 0;
}

- (BOOL)shouldPresentOrDismissCoverSheetSpotlight
{
  return 0;
}

- (BOOL)isAuthenticated
{
  return self->_authenticated;
}

- (void)setAuthenticated:(BOOL)a3
{
  self->_authenticated = a3;
}

- (BOOL)expectsFaceContact
{
  return self->_expectsFaceContact;
}

- (SBIdleTimerCoordinating)idleTimerCoordinator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_idleTimerCoordinator);
  return (SBIdleTimerCoordinating *)WeakRetained;
}

- (void)setIdleTimerCoordinator:(id)a3
{
}

- (double)backlightLevel
{
  return self->_backlightLevel;
}

- (void)setBacklightLevel:(double)a3
{
  self->_backlightLevel = a3;
}

- (SBBiometricUnlockBehaviorDelegate)biometricUnlockBehaviorDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_biometricUnlockBehaviorDelegate);
  return (SBBiometricUnlockBehaviorDelegate *)WeakRetained;
}

- (void)setBiometricUnlockBehaviorDelegate:(id)a3
{
}

- (UIVisualEffectView)wakeEffectView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_wakeEffectView);
  return (UIVisualEffectView *)WeakRetained;
}

- (void)setWakeEffectView:(id)a3
{
}

- (SBFLegacyWallpaperWakeAnimator)legacyWallpaperWakeAnimator
{
  return self->_legacyWallpaperWakeAnimator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_legacyWallpaperWakeAnimator, 0);
  objc_destroyWeak((id *)&self->_wakeEffectView);
  objc_destroyWeak((id *)&self->_biometricUnlockBehaviorDelegate);
  objc_destroyWeak((id *)&self->_idleTimerCoordinator);
  objc_storeStrong((id *)&self->_customLockScreenActionContext, 0);
}

- (id)coordinatorRequestedIdleTimerBehavior:(id)a3
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return +[SBIdleTimerBehavior disabledBehavior];
}

@end