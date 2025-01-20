@interface SBUIProudLockContainerViewController
- ($20D0CF0D87A8AD096D8C820DF2D4BB3C)configuration;
- (BOOL)_canShowWhileLocked;
- (BOOL)_canTransitionToState:(int64_t)a3;
- (BOOL)_isBiometricLockedOut;
- (BOOL)_isShowingCoachingCondition:(unint64_t)a3;
- (BOOL)canLeaveCoachingCondition;
- (BOOL)canShowCameraCovered;
- (BOOL)canShowCoachingCondition;
- (BOOL)canShowScanningState;
- (BOOL)hasSeenFaceSinceScreenOn;
- (BOOL)isAuthenticated;
- (BOOL)isGuidanceTextVisible;
- (BOOL)isPortrait;
- (BOOL)isScreenOn;
- (BOOL)shouldShowScanningState;
- (BOOL)suppressAlongsideCoaching;
- (BOOL)suppressNotLooking;
- (BOOL)suppressScanningState;
- (SBUIProudLockContainerViewController)initWithAuthenticationInformationProvider:(id)a3;
- (SBUIProudLockContainerViewControllerDelegate)delegate;
- (SBUIProudLockContainerViewControllerLockStatusProvider)authenticationInformationProvider;
- (UIView)cameraCoveredView;
- (_UILegibilitySettings)legibilitySettings;
- (double)proudLockLandscapeOffset;
- (id)_proudLockIconView;
- (id)orientationProvider;
- (id)testProudLockIconView;
- (id)unlockCompletion;
- (int64_t)_actualIconState;
- (int64_t)_iconViewStateForCoachingCondition:(unint64_t)a3;
- (int64_t)orientation;
- (unint64_t)_effectiveCoachingConditionForCondition:(unint64_t)a3;
- (unint64_t)_effectiveCoachingConditionForCondition:(unint64_t)a3 orientation:(int64_t)a4;
- (unint64_t)forceCount;
- (void)__reallyAllowCameraCoveredReinstatingCoachingIfNecessary;
- (void)_allowCameraCoveredForUnlockSource:(int)a3;
- (void)_allowCoachingCondition;
- (void)_allowCoachingConditionImmediately:(BOOL)a3;
- (void)_allowLeavingCoachingCondition;
- (void)_allowScanningState;
- (void)_clearCoachingCondition;
- (void)_dontCallThis_showLockIfNeededAnimated:(BOOL)a3 force:(BOOL)a4 completion:(id)a5;
- (void)_dontCallThis_updateCoachingCondition:(unint64_t)a3 animated:(BOOL)a4;
- (void)_handleBiometricEvent:(unint64_t)a3;
- (void)_performForcedUpdate:(id)a3;
- (void)_provideFeedbackForCoachingCondition:(unint64_t)a3;
- (void)_reallyAllowCameraCovered;
- (void)_reallyAllowCoachingConditionAnimated:(BOOL)a3;
- (void)_reallyAllowLeavingCoachingCondition;
- (void)_setCoachingCondition:(unint64_t)a3 animated:(BOOL)a4;
- (void)_setCoachingCondition:(unint64_t)a3 animated:(BOOL)a4 force:(BOOL)a5;
- (void)_setCoachingCondition:(unint64_t)a3 animated:(BOOL)a4 skipScanningState:(BOOL)a5 force:(BOOL)a6;
- (void)_setCounterTransformForOrientation:(int64_t)a3;
- (void)_setIconState:(int64_t)a3 animated:(BOOL)a4;
- (void)_setIconState:(int64_t)a3 animated:(BOOL)a4 options:(int64_t)a5 force:(BOOL)a6 completion:(id)a7;
- (void)_setLocalTransformForOrientation:(int64_t)a3;
- (void)_startScanningStateTimer;
- (void)_updateIconViewStateAnimated:(BOOL)a3;
- (void)_updateIconViewStateAnimated:(BOOL)a3 force:(BOOL)a4 completion:(id)a5;
- (void)_updateLockForFaceInView;
- (void)_updateLockForMatchStarted;
- (void)_updateScanningState;
- (void)handleBiometricEvent:(unint64_t)a3;
- (void)handlePhoneUnlockWithWatchError:(id)a3;
- (void)loadView;
- (void)overrideProudLockIconViewLayoutWithSize:(CGSize)a3 offset:(CGPoint)a4 extent:(double)a5;
- (void)reset;
- (void)setAuthenticated:(BOOL)a3;
- (void)setAuthenticated:(BOOL)a3 completion:(id)a4;
- (void)setAuthenticationInformationProvider:(id)a3;
- (void)setCanLeaveCoachingCondition:(BOOL)a3;
- (void)setCanShowCameraCovered:(BOOL)a3;
- (void)setCanShowCoachingCondition:(BOOL)a3;
- (void)setCanShowScanningState:(BOOL)a3;
- (void)setConfiguration:(id *)a3;
- (void)setDelegate:(id)a3;
- (void)setForceCount:(unint64_t)a3;
- (void)setGuidanceTextVisible:(BOOL)a3;
- (void)setHasSeenFaceSinceScreenOn:(BOOL)a3;
- (void)setLegibilitySettings:(id)a3;
- (void)setOrientationProvider:(id)a3;
- (void)setScreenOn:(BOOL)a3;
- (void)setScreenOn:(BOOL)a3 fromUnlockSource:(int)a4;
- (void)setShouldShowScanningState:(BOOL)a3;
- (void)setSuppressAlongsideCoaching:(BOOL)a3;
- (void)setSuppressNotLooking:(BOOL)a3;
- (void)setSuppressScanningState:(BOOL)a3;
- (void)setTestProudLockIconView:(id)a3;
- (void)setUnlockCompletion:(id)a3;
- (void)updateForScreenWillTurnOff;
- (void)updateLockForBiometricMatchFailure;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation SBUIProudLockContainerViewController

- (SBUIProudLockContainerViewController)initWithAuthenticationInformationProvider:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SBUIProudLockContainerViewController;
  v5 = [(SBUIProudLockContainerViewController *)&v8 init];
  v6 = v5;
  if (v5)
  {
    [(SBUIProudLockContainerViewController *)v5 setAuthenticationInformationProvider:v4];
    [(SBUIProudLockContainerViewController *)v6 setScreenOn:1];
    [(SBUIProudLockContainerViewController *)v6 setSuppressScanningState:1];
    [(SBUIProudLockContainerViewController *)v6 setSuppressNotLooking:0];
  }

  return v6;
}

- (void)loadView
{
  v3 = objc_alloc_init(SBUIProudLockIconView);
  [(SBUIProudLockIconView *)v3 bs_setHitTestingDisabled:1];
  [(SBUIProudLockContainerViewController *)self setView:v3];
}

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)SBUIProudLockContainerViewController;
  [(SBUIProudLockContainerViewController *)&v7 viewDidLoad];
  objc_initWeak(&location, self);
  dispatch_time_t v3 = dispatch_time(0, 100000000);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __51__SBUIProudLockContainerViewController_viewDidLoad__block_invoke;
  v4[3] = &unk_1E5CCC710;
  objc_copyWeak(&v5, &location);
  dispatch_after(v3, MEMORY[0x1E4F14428], v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __51__SBUIProudLockContainerViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    uint64_t v2 = [WeakRetained interfaceOrientation];
    [v3 _setCounterTransformForOrientation:v2];
    [v3 _setLocalTransformForOrientation:v2];
    id WeakRetained = v3;
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SBUIProudLockContainerViewController;
  [(SBUIProudLockContainerViewController *)&v4 viewWillAppear:a3];
  [(SBUIProudLockContainerViewController *)self _updateIconViewStateAnimated:0];
  [(SBUIProudLockContainerViewController *)self _startScanningStateTimer];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v23.receiver = self;
  v23.super_class = (Class)SBUIProudLockContainerViewController;
  id v7 = a4;
  -[SBUIProudLockContainerViewController viewWillTransitionToSize:withTransitionCoordinator:](&v23, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  objc_super v8 = [(SBUIProudLockContainerViewController *)self _proudLockIconView];
  v9 = [v8 cameraCoveredView];
  v10 = [v9 superview];
  v11 = [(SBUIProudLockContainerViewController *)self view];

  if (v10 != v11)
  {
    uint64_t v12 = [v10 superview];

    v10 = (void *)v12;
  }
  if (v9) {
    [v9 transform];
  }
  else {
    memset(&v21, 0, sizeof(v21));
  }
  CGAffineTransformRotate(&v22, &v21, -1.0e-13);
  [v9 setTransform:&v22];
  if (v9) {
    [v9 localTransform];
  }
  else {
    memset(&v19, 0, sizeof(v19));
  }
  CGAffineTransformRotate(&v20, &v19, 1.0e-13);
  [v9 setLocalTransform:&v20];
  v13 = SBUIWindowForViewControllerTransition(v7);
  uint64_t v14 = [v13 _toWindowOrientation];

  [(SBUIProudLockContainerViewController *)self _setLocalTransformForOrientation:v14];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __91__SBUIProudLockContainerViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v16[3] = &unk_1E5CCDA90;
  id v17 = v10;
  uint64_t v18 = v14;
  v16[4] = self;
  id v15 = v10;
  [v7 animateAlongsideTransition:v16 completion:0];
}

uint64_t __91__SBUIProudLockContainerViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _setCounterTransformForOrientation:*(void *)(a1 + 48)];
  [*(id *)(a1 + 40) setNeedsLayout];
  [*(id *)(a1 + 40) layoutIfNeeded];
  uint64_t v2 = [*(id *)(a1 + 32) _effectiveCoachingConditionForCondition:*(void *)(*(void *)(a1 + 32) + 984) orientation:*(void *)(a1 + 48)];
  id v3 = *(void **)(a1 + 32);
  return [v3 _setCoachingCondition:v2 animated:1 force:1];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)setScreenOn:(BOOL)a3
{
}

- (void)setScreenOn:(BOOL)a3 fromUnlockSource:(int)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (self->_screenOn != a3)
  {
    uint64_t v4 = *(void *)&a4;
    self->_BOOL screenOn = a3;
    v6 = SBLogLockScreenBiometricFaceIDCoaching();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      if (self->_screenOn) {
        id v7 = @"On";
      }
      else {
        id v7 = @"Off";
      }
      int v9 = 138543362;
      v10 = v7;
      _os_log_impl(&dword_1A7607000, v6, OS_LOG_TYPE_DEFAULT, "Received: Screen  %{public}@", (uint8_t *)&v9, 0xCu);
    }

    BOOL screenOn = self->_screenOn;
    [(SBUIProudLockContainerViewController *)self reset];
    if (screenOn)
    {
      self->_unlockSource = v4;
      if (![(SBUIProudLockContainerViewController *)self _isBiometricLockedOut])
      {
        [(SBUIProudLockContainerViewController *)self _startScanningStateTimer];
        [(SBUIProudLockContainerViewController *)self _allowCameraCoveredForUnlockSource:v4];
      }
      [(SBUIProudLockContainerViewController *)self _allowCoachingConditionImmediately:0];
      [(SBUIProudLockContainerViewController *)self _setCoachingCondition:[(SBUIProudLockContainerViewController *)self _effectiveCoachingConditionForCondition:self->_desiredCoachingCondition] animated:0];
    }
  }
}

- (void)setAuthenticated:(BOOL)a3
{
}

- (void)setAuthenticated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = v6;
  if (self->_authenticated == v4)
  {
    if (v6) {
      (*((void (**)(id))v6 + 2))(v6);
    }
  }
  else
  {
    self->_authenticated = v4;
    objc_super v8 = SBLogLockScreenBiometricFaceIDCoaching();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      if (self->_authenticated) {
        int v9 = &stru_1EFCB7578;
      }
      else {
        int v9 = @"Not ";
      }
      int v10 = 138543362;
      uint64_t v11 = v9;
      _os_log_impl(&dword_1A7607000, v8, OS_LOG_TYPE_DEFAULT, "Received:  %{public}@Authenticated", (uint8_t *)&v10, 0xCu);
    }

    [(SBUIProudLockContainerViewController *)self setShouldShowScanningState:0];
    [(id)objc_opt_class() cancelPreviousPerformRequestsWithTarget:self selector:sel__allowScanningState object:0];
    [(SBUIProudLockContainerViewController *)self setCanShowScanningState:1];
    [(SBUIProudLockContainerViewController *)self _clearCoachingCondition];
    [(SBUIProudLockContainerViewController *)self _updateIconViewStateAnimated:1 force:0 completion:v7];
  }
}

- (void)setLegibilitySettings:(id)a3
{
  id v5 = a3;
  p_legibilitySettings = &self->_legibilitySettings;
  if (([(_UILegibilitySettings *)self->_legibilitySettings isEqual:v5] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_legibilitySettings, a3);
    id v7 = SBLogLockScreenBiometricFaceIDCoaching();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)int v9 = 0;
      _os_log_impl(&dword_1A7607000, v7, OS_LOG_TYPE_INFO, "Updating Legibility Settings", v9, 2u);
    }

    objc_super v8 = [(SBUIProudLockContainerViewController *)self _proudLockIconView];
    [v8 setLegibilitySettings:*p_legibilitySettings];
  }
}

- (void)setConfiguration:(id *)a3
{
  p_configuration = &self->_configuration;
  long long v6 = *(_OWORD *)&self->_configuration.durationToSuppressCameraCoveredWhenWakingWithSmartCover;
  v17[2] = *(_OWORD *)&self->_configuration.minimumDurationShowingCoaching;
  v17[3] = v6;
  v17[4] = *(_OWORD *)&self->_configuration.coachingDelaysUnlock;
  long long v7 = *(_OWORD *)&self->_configuration.bkCoachingHintsEnabled;
  v17[0] = *(_OWORD *)&self->_configuration.showScanningState;
  v17[1] = v7;
  long long v8 = *(_OWORD *)&a3->var7;
  v16[2] = *(_OWORD *)&a3->var5;
  v16[3] = v8;
  v16[4] = *(_OWORD *)&a3->var9;
  long long v9 = *(_OWORD *)&a3->var3;
  v16[0] = *(_OWORD *)&a3->var0;
  v16[1] = v9;
  if (!SBUIProudLockContainerViewControllerConfigurationEqualToConfiguration((double *)v17, (double *)v16))
  {
    BOOL suppressFaceIDDisabledState = p_configuration->suppressFaceIDDisabledState;
    unint64_t substate = p_configuration->substate;
    *(_OWORD *)&p_configuration->showScanningState = *(_OWORD *)&a3->var0;
    long long v12 = *(_OWORD *)&a3->var9;
    long long v14 = *(_OWORD *)&a3->var3;
    long long v13 = *(_OWORD *)&a3->var5;
    *(_OWORD *)&p_configuration->durationToSuppressCameraCoveredWhenWakingWithSmartCover = *(_OWORD *)&a3->var7;
    *(_OWORD *)&p_configuration->coachingDelaysUnlock = v12;
    *(_OWORD *)&p_configuration->bkCoachingHintsEnabled = v14;
    *(_OWORD *)&p_configuration->minimumDurationShowingCoaching = v13;
    id v15 = [(SBUIProudLockContainerViewController *)self _proudLockIconView];
    [v15 setDurationOnCameraCoveredGlyphBeforeCoaching:p_configuration->durationOnCameraCoveredGlyphBeforeCoaching];

    if (suppressFaceIDDisabledState != p_configuration->suppressFaceIDDisabledState
      || substate != p_configuration->substate)
    {
      [(SBUIProudLockContainerViewController *)self _updateIconViewStateAnimated:1];
    }
  }
}

- (UIView)cameraCoveredView
{
  uint64_t v2 = [(SBUIProudLockContainerViewController *)self _proudLockIconView];
  id v3 = [v2 cameraCoveredView];

  return (UIView *)v3;
}

- (void)reset
{
  id v3 = SBLogLockScreenBiometricFaceIDCoaching();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A7607000, v3, OS_LOG_TYPE_DEFAULT, "==== Reset ====", buf, 2u);
  }

  self->_unlockSource = 0;
  self->_mostRecentCoachingFeedbackCondition = 1;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __45__SBUIProudLockContainerViewController_reset__block_invoke;
  v4[3] = &unk_1E5CCC580;
  void v4[4] = self;
  [(SBUIProudLockContainerViewController *)self _performForcedUpdate:v4];
}

uint64_t __45__SBUIProudLockContainerViewController_reset__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setCanShowScanningState:0];
  [*(id *)(a1 + 32) setShouldShowScanningState:0];
  [*(id *)(a1 + 32) setCanLeaveCoachingCondition:1];
  [*(id *)(a1 + 32) _clearCoachingCondition];
  [*(id *)(a1 + 32) setCanShowCoachingCondition:0];
  [*(id *)(a1 + 32) setHasSeenFaceSinceScreenOn:0];
  [*(id *)(a1 + 32) setCanShowCameraCovered:0];
  uint64_t v2 = *(void **)(a1 + 32);
  return [v2 _updateIconViewStateAnimated:0 force:1 completion:0];
}

- (void)updateLockForBiometricMatchFailure
{
  id v3 = SBLogLockScreenBiometricFaceIDCoaching();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1A7607000, v3, OS_LOG_TYPE_DEFAULT, "Received: Face ID Match Failure", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  [(SBUIProudLockContainerViewController *)self setShouldShowScanningState:0];
  [(SBUIProudLockContainerViewController *)self setCanLeaveCoachingCondition:1];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __74__SBUIProudLockContainerViewController_updateLockForBiometricMatchFailure__block_invoke;
  v4[3] = &unk_1E5CCC738;
  objc_copyWeak(&v5, buf);
  [(SBUIProudLockContainerViewController *)self _setIconState:3 animated:1 options:0 force:0 completion:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(buf);
}

void __74__SBUIProudLockContainerViewController_updateLockForBiometricMatchFailure__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ([WeakRetained suppressNotLooking])
  {
    [WeakRetained _setIconState:1 animated:0];
  }
  else
  {
    [WeakRetained setCanShowCoachingCondition:1];
    [WeakRetained _setCoachingCondition:9 animated:1];
  }
}

- (void)updateForScreenWillTurnOff
{
  uint64_t v2 = SBLogLockScreenBiometricFaceIDCoaching();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl(&dword_1A7607000, v2, OS_LOG_TYPE_DEFAULT, "Received: Screen Will Turn Off", v3, 2u);
  }
}

- (void)setSuppressNotLooking:(BOOL)a3
{
  if (self->_suppressNotLooking != a3)
  {
    self->_suppressNotLooking = a3;
    if (a3)
    {
      int64_t desiredIconState = self->_desiredIconState;
      if (desiredIconState == 20 || desiredIconState == 17) {
        [(SBUIProudLockContainerViewController *)self _updateIconViewStateAnimated:1];
      }
    }
  }
}

- (void)setSuppressAlongsideCoaching:(BOOL)a3
{
  if (self->_suppressAlongsideCoaching != a3)
  {
    self->_suppressAlongsideCoaching = a3;
    BOOL v4 = [MEMORY[0x1E4F42948] currentDevice];
    uint64_t v5 = [v4 userInterfaceIdiom];

    BOOL v6 = (v5 & 0xFFFFFFFFFFFFFFFBLL) == 1
      || (unint64_t)([(id)*MEMORY[0x1E4F43630] activeInterfaceOrientation] - 5) < 0xFFFFFFFFFFFFFFFELL;
    long long v7 = [(SBUIProudLockContainerViewController *)self _proudLockIconView];
    id v9 = v7;
    BOOL v8 = !self->_suppressAlongsideCoaching && v6;
    [v7 setAllowsAlongsideCoaching:v8];
  }
}

- (void)setHasSeenFaceSinceScreenOn:(BOOL)a3
{
  if (self->_hasSeenFaceSinceScreenOn != a3)
  {
    self->_hasSeenFaceSinceScreenOn = a3;
    if (a3
      && self->_configuration.bkCoachingHintsEnabled
      && [(SBUIProudLockContainerViewController *)self _isBiometricLockedOut])
    {
      [(SBUIProudLockContainerViewController *)self _setIconState:17 animated:1];
    }
  }
}

- (BOOL)isGuidanceTextVisible
{
  unint64_t v2 = [(SBUIProudLockContainerViewController *)self _actualIconState];
  return SBUIProudLockIconViewStateShowsCoachingText(v2);
}

- (void)handlePhoneUnlockWithWatchError:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __72__SBUIProudLockContainerViewController_handlePhoneUnlockWithWatchError___block_invoke;
  v6[3] = &unk_1E5CCC878;
  id v7 = v4;
  BOOL v8 = self;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __72__SBUIProudLockContainerViewController_handlePhoneUnlockWithWatchError___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) code];
  id v6 = +[SBUIPhoneUnlockWithWatchController sharedInstance];
  if ([v6 showRawErrorCodes])
  {
    [v6 setErrorCode:v2];
    uint64_t v3 = 11;
  }
  else
  {
    uint64_t v3 = 10;
  }
  id v4 = +[SBUIBiometricResource sharedInstance];
  uint64_t v5 = [v4 biometricLockoutState];

  if (!v5) {
    [*(id *)(a1 + 40) _provideFeedbackForCoachingCondition:v3];
  }
}

- (void)handleBiometricEvent:(unint64_t)a3
{
  id v5 = +[SBUIBiometricResource sharedInstance];
  if ([v5 hasBiometricAuthenticationCapabilityEnabled]) {
    [(SBUIProudLockContainerViewController *)self _handleBiometricEvent:a3];
  }
}

- (void)_handleBiometricEvent:(unint64_t)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  switch(a3)
  {
    case 0x1BuLL:
      [(SBUIProudLockContainerViewController *)self _updateIconViewStateAnimated:1];
      break;
    case 0xDuLL:
      [(SBUIProudLockContainerViewController *)self _updateLockForFaceInView];
      break;
    case 0xCuLL:
      id v5 = +[SBUIBiometricResource sharedInstance];
      char v6 = [v5 hasPoseidonSupport];

      if ((v6 & 1) == 0) {
        [(SBUIProudLockContainerViewController *)self _updateLockForMatchStarted];
      }
      break;
  }
  if (SBUIBiometricEventIsProvidingFeedback(a3)) {
    [(SBUIProudLockContainerViewController *)self _provideFeedbackForCoachingCondition:SBUIFaceIDCoachingConditionForBiometricEvent(a3)];
  }
  if (a3 <= 0x21 && ((1 << a3) & 0x2070009E0) != 0)
  {
    id v7 = SBLogLockScreenBiometricFaceIDCoaching();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v8 = NSStringFromSBUIBiometricEvent(a3);
      int v9 = 138543362;
      int v10 = v8;
      _os_log_impl(&dword_1A7607000, v7, OS_LOG_TYPE_DEFAULT, "Received: Require Passcode -  %{public}@", (uint8_t *)&v9, 0xCu);
    }
    [(SBUIProudLockContainerViewController *)self _updateIconViewStateAnimated:1];
  }
}

- (void)_provideFeedbackForCoachingCondition:(unint64_t)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = SBLogLockScreenBiometricFaceIDCoaching();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    char v6 = DebugStringForSBUIFaceIDCoachingCondition(a3);
    int v10 = 138543362;
    uint64_t v11 = v6;
    _os_log_impl(&dword_1A7607000, v5, OS_LOG_TYPE_DEFAULT, "Received: Coaching -  %{public}@", (uint8_t *)&v10, 0xCu);
  }
  self->_mostRecentCoachingFeedbackCondition = a3;
  unint64_t v7 = [(SBUIProudLockContainerViewController *)self _effectiveCoachingConditionForCondition:a3];
  if (v7 == 4 && !self->_canShowCameraCovered)
  {
    BOOL v8 = SBLogLockScreenBiometricFaceIDCoaching();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = DebugStringForSBUIFaceIDCoachingCondition(4uLL);
      int v10 = 138543362;
      uint64_t v11 = v9;
      _os_log_impl(&dword_1A7607000, v8, OS_LOG_TYPE_DEFAULT, "Couldn't set coaching condition because it is currently suppressed -  %{public}@", (uint8_t *)&v10, 0xCu);
    }
  }
  else
  {
    [(SBUIProudLockContainerViewController *)self _setCoachingCondition:v7 animated:1];
  }
}

- (void)_updateLockForFaceInView
{
  uint64_t v3 = SBLogLockScreenBiometricFaceIDCoaching();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v4[0]) = 0;
    _os_log_impl(&dword_1A7607000, v3, OS_LOG_TYPE_DEFAULT, "Received: Face In View", (uint8_t *)v4, 2u);
  }

  memset(v4, 0, sizeof(v4));
  [(SBUIProudLockContainerViewController *)self configuration];
  if (LOBYTE(v4[0]) && ![(SBUIProudLockContainerViewController *)self _isBiometricLockedOut]) {
    [(SBUIProudLockContainerViewController *)self setShouldShowScanningState:1];
  }
  [(SBUIProudLockContainerViewController *)self setHasSeenFaceSinceScreenOn:1];
}

- (void)_updateLockForMatchStarted
{
  uint64_t v3 = SBLogLockScreenBiometricFaceIDCoaching();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v6) = 0;
    _os_log_impl(&dword_1A7607000, v3, OS_LOG_TYPE_DEFAULT, "Received: Match Started", (uint8_t *)&v6, 2u);
  }

  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v6 = 0u;
  [(SBUIProudLockContainerViewController *)self configuration];
  if ((_BYTE)v6 && BYTE1(v6) && self->_unlockSource != 10)
  {
    self->_shouldShowScanningState = 0;
    [(SBUIProudLockContainerViewController *)self setShouldShowScanningState:1];
  }
  else if ((_BYTE)v7)
  {
    unint64_t desiredIconState = self->_desiredIconState;
    BOOL v5 = desiredIconState == 1 || desiredIconState == 4;
    if (!v5 && (desiredIconState == 20 || (SBUIProudLockIconViewStateIsCoaching(desiredIconState) & 1) == 0)) {
      [(SBUIProudLockContainerViewController *)self _setIconState:1 animated:1];
    }
  }
}

- (double)proudLockLandscapeOffset
{
  uint64_t v2 = [(SBUIProudLockContainerViewController *)self _proudLockIconView];
  [v2 proudLockLandscapeOffset];
  double v4 = v3;

  return v4;
}

- (void)overrideProudLockIconViewLayoutWithSize:(CGSize)a3 offset:(CGPoint)a4 extent:(double)a5
{
  double y = a4.y;
  double x = a4.x;
  double height = a3.height;
  double width = a3.width;
  id v10 = [(SBUIProudLockContainerViewController *)self _proudLockIconView];
  objc_msgSend(v10, "setOverrideSize:offset:extent:", width, height, x, y, a5);
}

- (BOOL)isPortrait
{
  uint64_t v2 = [(SBUIProudLockContainerViewController *)self view];
  double v3 = [v2 window];
  BOOL v4 = (unint64_t)([v3 interfaceOrientation] - 1) < 2;

  return v4;
}

- (int64_t)orientation
{
  uint64_t v2 = [(SBUIProudLockContainerViewController *)self view];
  double v3 = [v2 window];
  int64_t v4 = [v3 interfaceOrientation];

  return v4;
}

- (id)_proudLockIconView
{
  testProudLockIconView = self->_testProudLockIconView;
  if (testProudLockIconView)
  {
    double v3 = testProudLockIconView;
  }
  else
  {
    double v3 = [(SBUIProudLockContainerViewController *)self view];
  }
  return v3;
}

- (int64_t)_actualIconState
{
  uint64_t v2 = [(SBUIProudLockContainerViewController *)self _proudLockIconView];
  int64_t v3 = [v2 state];

  return v3;
}

- (BOOL)_isBiometricLockedOut
{
  uint64_t v2 = [(SBUIProudLockContainerViewController *)self authenticationInformationProvider];
  char v3 = [v2 isBiometricLockedOut];

  return v3;
}

- (void)setUnlockCompletion:(id)a3
{
  id v4 = a3;
  if (v4 && self->_unlockCompletion)
  {
    BOOL v5 = (void *)MEMORY[0x1AD0CF1C0]();
    long long v6 = (void *)[v4 copy];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __60__SBUIProudLockContainerViewController_setUnlockCompletion___block_invoke;
    v13[3] = &unk_1E5CCDAB8;
    id v14 = v5;
    id v15 = v6;
    id v7 = v6;
    id v8 = v5;
    long long v9 = (void *)MEMORY[0x1AD0CF1C0](v13);
    id unlockCompletion = self->_unlockCompletion;
    self->_id unlockCompletion = v9;
  }
  else
  {
    uint64_t v11 = (void *)[v4 copy];
    id v12 = self->_unlockCompletion;
    self->_id unlockCompletion = v11;
  }
}

uint64_t __60__SBUIProudLockContainerViewController_setUnlockCompletion___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

- (void)_setCounterTransformForOrientation:(int64_t)a3
{
  id v4 = [(SBUIProudLockContainerViewController *)self _proudLockIconView];
  BOOL v5 = [v4 cameraCoveredView];
  long long v6 = [v5 superview];
  id v7 = [(SBUIProudLockContainerViewController *)self view];

  if (v6 != v7)
  {
    uint64_t v8 = [v6 superview];

    long long v6 = (void *)v8;
  }
  uint64_t v9 = SBUIFaceIDCameraOrientationForDevice();
  SBUIInterfaceOrientationForFaceIDCameraOrientation(v9);
  SBTransformFromOrientationToOrientation();
  [v5 setTransform:&v10];
  [v6 setNeedsLayout];
}

- (void)_setLocalTransformForOrientation:(int64_t)a3
{
  id v4 = [(SBUIProudLockContainerViewController *)self _proudLockIconView];
  BOOL v5 = [v4 cameraCoveredView];

  uint64_t v6 = SBUIFaceIDCameraOrientationForDevice();
  switch(a3)
  {
    case 1:
      if (v6 == 2)
      {
        CGFloat v7 = -1.57079633;
        uint64_t v8 = (CGAffineTransform *)v13;
        uint64_t v9 = (CGAffineTransform *)v13;
        goto LABEL_10;
      }
      break;
    case 2:
      if (v6 == 2)
      {
        CGFloat v7 = 1.57079633;
        uint64_t v8 = &v12;
        uint64_t v9 = &v12;
        goto LABEL_10;
      }
      break;
    case 3:
      if (v6 == 1)
      {
        CGFloat v7 = 1.57079633;
        uint64_t v8 = (CGAffineTransform *)v10;
        uint64_t v9 = (CGAffineTransform *)v10;
        goto LABEL_10;
      }
      break;
    case 4:
      if (v6 == 1)
      {
        CGFloat v7 = -1.57079633;
        uint64_t v8 = (CGAffineTransform *)v11;
        uint64_t v9 = (CGAffineTransform *)v11;
LABEL_10:
        CGAffineTransformMakeRotation(v9, v7);
        [v5 setLocalTransform:v8];
      }
      break;
    default:
      break;
  }
}

- (id)testProudLockIconView
{
  return self->_testProudLockIconView;
}

- (void)setTestProudLockIconView:(id)a3
{
  BOOL v5 = (SBUIProudLockIconView *)a3;
  if (self->_testProudLockIconView != v5)
  {
    uint64_t v6 = v5;
    objc_storeStrong((id *)&self->_testProudLockIconView, a3);
    [(SBUIProudLockIconView *)self->_testProudLockIconView setDurationOnCameraCoveredGlyphBeforeCoaching:self->_configuration.durationOnCameraCoveredGlyphBeforeCoaching];
    BOOL v5 = v6;
  }
}

- (id)orientationProvider
{
  if (self->_orientationProvider) {
    self = (SBUIProudLockContainerViewController *)self->_orientationProvider;
  }
  return self;
}

- (void)setOrientationProvider:(id)a3
{
  BOOL v5 = (SBUIProudLockContainerViewControllerOrientationProvider *)a3;
  p_orientationProvider = &self->_orientationProvider;
  if (self->_orientationProvider != v5)
  {
    CGFloat v7 = v5;
    objc_storeStrong((id *)p_orientationProvider, a3);
    BOOL v5 = v7;
  }
  MEMORY[0x1F41817F8](p_orientationProvider, v5);
}

- (void)_updateIconViewStateAnimated:(BOOL)a3
{
}

- (void)_updateIconViewStateAnimated:(BOOL)a3 force:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  id v10 = a5;
  unint64_t desiredCoachingCondition = self->_desiredCoachingCondition;
  if (!SBUIFaceIDCoachingConditionShouldBeVisible(desiredCoachingCondition)
    || desiredCoachingCondition == 8 && self->_configuration.suppressFaceIDDisabledState)
  {
    [(SBUIProudLockContainerViewController *)self _dontCallThis_showLockIfNeededAnimated:v6 force:v5 completion:v10];
  }
  else
  {
    [(SBUIProudLockContainerViewController *)self _dontCallThis_updateCoachingCondition:desiredCoachingCondition animated:v6];
    uint64_t v9 = v10;
    if (!v10) {
      goto LABEL_8;
    }
    (*((void (**)(id))v10 + 2))(v10);
  }
  uint64_t v9 = v10;
LABEL_8:
}

- (void)_dontCallThis_showLockIfNeededAnimated:(BOOL)a3 force:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  id v8 = a5;
  BOOL v9 = [(SBUIProudLockContainerViewController *)self isAuthenticated];
  id v10 = [(SBUIProudLockContainerViewController *)self authenticationInformationProvider];
  if ([v10 hasPasscodeSet])
  {
    if (v9)
    {
      [(SBUIProudLockContainerViewController *)self setCanShowCoachingCondition:0];
      uint64_t v11 = 2;
    }
    else if (self->_desiredIconState == 3)
    {
      uint64_t v11 = 3;
    }
    else if (self->_hasSeenFaceSinceScreenOn {
           && self->_configuration.bkCoachingHintsEnabled
    }
           && !self->_configuration.suppressFaceIDDisabledState
           && [(SBUIProudLockContainerViewController *)self _isBiometricLockedOut])
    {
      uint64_t v11 = 17;
    }
    else
    {
      uint64_t v11 = 1;
    }
  }
  else
  {
    uint64_t v11 = 0;
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __96__SBUIProudLockContainerViewController__dontCallThis_showLockIfNeededAnimated_force_completion___block_invoke;
  v13[3] = &unk_1E5CCC6C0;
  id v14 = v8;
  id v12 = v8;
  [(SBUIProudLockContainerViewController *)self _setIconState:v11 animated:v6 options:0 force:v5 completion:v13];
}

uint64_t __96__SBUIProudLockContainerViewController__dontCallThis_showLockIfNeededAnimated_force_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_dontCallThis_updateCoachingCondition:(unint64_t)a3 animated:(BOOL)a4
{
  if (self->_canShowCoachingCondition && SBUIFaceIDCoachingConditionShouldBeVisible(a3))
  {
    if (a3 == 8)
    {
      if (self->_configuration.suppressFaceIDDisabledState) {
        return;
      }
    }
    else if (a3 == 4 && !self->_canShowCameraCovered)
    {
      return;
    }
    BOOL v6 = [(SBUIProudLockContainerViewController *)self delegate];
    int v7 = [v6 proudLockContainerViewControllerIsCoverSheetVisible:self];

    if ((a3 & 0xFFFFFFFFFFFFFFFELL) != 0xA || v7)
    {
      int64_t v8 = [(SBUIProudLockContainerViewController *)self _iconViewStateForCoachingCondition:a3];
      [(SBUIProudLockContainerViewController *)self _setIconState:v8 animated:1 options:0 force:0 completion:&__block_literal_global_22];
    }
  }
}

- (void)_setCoachingCondition:(unint64_t)a3 animated:(BOOL)a4
{
}

- (void)_setCoachingCondition:(unint64_t)a3 animated:(BOOL)a4 force:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  [(SBUIProudLockContainerViewController *)self configuration];
  [(SBUIProudLockContainerViewController *)self _setCoachingCondition:a3 animated:v6 skipScanningState:v9 == 0 force:v5];
}

- (void)_setCoachingCondition:(unint64_t)a3 animated:(BOOL)a4 skipScanningState:(BOOL)a5 force:(BOOL)a6
{
  unint64_t desiredCoachingCondition = self->_desiredCoachingCondition;
  if (desiredCoachingCondition == a3 && !a6) {
    return;
  }
  int v9 = a5;
  BOOL v10 = a4;
  if (SBUIFaceIDCoachingConditionShouldBeVisible(desiredCoachingCondition)
    && SBUIFaceIDCoachingConditionShouldBeVisible(a3))
  {
    [(SBUIProudLockContainerViewController *)self _setCoachingCondition:1 animated:1];
  }
  self->_unint64_t desiredCoachingCondition = a3;
  int ShouldBeVisible = SBUIFaceIDCoachingConditionShouldBeVisible(a3);
  if (ShouldBeVisible)
  {
    SBUICoachingTextForSBUIFaceIDCoachingCondition(a3);
    id v17 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v17 = 0;
  }
  long long v13 = [(SBUIProudLockContainerViewController *)self delegate];
  [v13 proudLockContainerViewController:self guidanceTextVisibilityDidChange:v17 animated:v10];

  if (!(v10 & ~v9) && ((ShouldBeVisible ^ 1) & 1) == 0)
  {
    id v14 = self;
    uint64_t v15 = 1;
LABEL_21:
    [(SBUIProudLockContainerViewController *)v14 _updateIconViewStateAnimated:v15];
    goto LABEL_22;
  }
  id v14 = self;
  if (self->_desiredIconState == 5) {
    char v16 = 0;
  }
  else {
    char v16 = ShouldBeVisible;
  }
  if ((v16 & 1) == 0)
  {
    uint64_t v15 = v10;
    goto LABEL_21;
  }
  [(SBUIProudLockContainerViewController *)self _setIconState:5 animated:v10];
LABEL_22:
}

- (unint64_t)_effectiveCoachingConditionForCondition:(unint64_t)a3
{
  BOOL v5 = [(SBUIProudLockContainerViewController *)self view];
  BOOL v6 = [v5 window];
  uint64_t v7 = [v6 interfaceOrientation];

  return [(SBUIProudLockContainerViewController *)self _effectiveCoachingConditionForCondition:a3 orientation:v7];
}

- (unint64_t)_effectiveCoachingConditionForCondition:(unint64_t)a3 orientation:(int64_t)a4
{
  uint64_t v7 = +[SBUIBiometricResource sharedInstance];
  if (![v7 hasBiometricAuthenticationCapabilityEnabled]
    || ![v7 isPearlDetectEnabled])
  {
    a3 = 1;
    goto LABEL_25;
  }
  uint64_t v8 = SBUIFaceIDCameraOrientationForDevice();
  if (v8 == 1)
  {
    uint64_t v9 = 2;
  }
  else
  {
    if (v8 != 2)
    {
      SBUIFaceIDCoachingConditionShouldBeVisible(a3);
      goto LABEL_23;
    }
    uint64_t v9 = 4;
  }
  if ((SBUIFaceIDCoachingConditionShouldBeVisible(a3) & 1) != 0 || v9 != a4)
  {
LABEL_23:
    if (a3 == 12) {
      a3 = 1;
    }
    goto LABEL_25;
  }
  if (__sb__runningInSpringBoard())
  {
    if (SBFEffectiveDeviceClass() == 2)
    {
      BOOL v10 = [(SBUIProudLockContainerViewController *)self isAuthenticated];
      if (a3 == 12) {
        a3 = 1;
      }
      if (v10) {
        goto LABEL_25;
      }
LABEL_21:
      a3 = 12;
      goto LABEL_25;
    }
    goto LABEL_23;
  }
  uint64_t v11 = [MEMORY[0x1E4F42948] currentDevice];
  if ([v11 userInterfaceIdiom] != 1)
  {

    goto LABEL_23;
  }
  BOOL v12 = [(SBUIProudLockContainerViewController *)self isAuthenticated];

  if (a3 == 12) {
    a3 = 1;
  }
  if (!v12) {
    goto LABEL_21;
  }
LABEL_25:

  return a3;
}

- (void)_clearCoachingCondition
{
}

- (void)_setIconState:(int64_t)a3 animated:(BOOL)a4
{
}

- (void)_setIconState:(int64_t)a3 animated:(BOOL)a4 options:(int64_t)a5 force:(BOOL)a6 completion:(id)a7
{
  BOOL v9 = a4;
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  BOOL v12 = (void (**)(id, uint64_t))a7;
  if (a6) {
    goto LABEL_4;
  }
  if (![(SBUIProudLockContainerViewController *)self _canTransitionToState:a3])
  {
    v30 = SBLogBiometricResource();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      v31 = NSStringForSBUIProudLockIconViewState([(SBUIProudLockContainerViewController *)self _actualIconState]);
      v32 = NSStringForSBUIProudLockIconViewState(a3);
      *(_DWORD *)buf = 138543618;
      unint64_t v39 = (unint64_t)v31;
      __int16 v40 = 2114;
      int64_t v41 = (int64_t)v32;
      _os_log_impl(&dword_1A7607000, v30, OS_LOG_TYPE_DEFAULT, "Ignoring request to go from SBUIProudLockIconViewState %{public}@ to %{public}@", buf, 0x16u);
    }
    if (v12) {
      v12[2](v12, 1);
    }
    goto LABEL_27;
  }
  if (self->_forceCount) {
LABEL_4:
  }
    a5 |= 2uLL;
  unint64_t v13 = [(SBUIProudLockContainerViewController *)self _actualIconState];
  int IsCoaching = SBUIProudLockIconViewStateIsCoaching(v13);
  uint64_t v15 = SBLogBiometricResource();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    int64_t desiredIconState = self->_desiredIconState;
    *(_DWORD *)buf = 134218496;
    unint64_t v39 = v13;
    __int16 v40 = 2048;
    int64_t v41 = desiredIconState;
    __int16 v42 = 2048;
    int64_t v43 = a3;
    _os_log_impl(&dword_1A7607000, v15, OS_LOG_TYPE_INFO, "actualIconState: %lu - _desiredIconState: %lu - toIconState: %lu", buf, 0x20u);
  }

  self->_int64_t desiredIconState = a3;
  int v17 = SBUIProudLockIconViewStateIsCoaching(a3);
  unsigned int v33 = IsCoaching & ~SBUIProudLockIconViewStateIsCoaching(self->_desiredIconState);
  if (!IsCoaching
    || ((unint64_t)(self->_desiredIconState - 1) >= 3 ? (BOOL v18 = v17 == 0) : (BOOL v18 = 0),
        v18 || self->_canLeaveCoachingCondition))
  {
    CGAffineTransform v19 = SBLogLockScreenBiometricFaceIDCoaching();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      CGAffineTransform v20 = NSStringForSBUIProudLockIconViewState(self->_desiredIconState);
      *(_DWORD *)buf = 138543362;
      unint64_t v39 = (unint64_t)v20;
      _os_log_impl(&dword_1A7607000, v19, OS_LOG_TYPE_DEFAULT, "=> Transitioning to state: %{public}@", buf, 0xCu);
    }
    CGAffineTransform v21 = v12;

    uint64_t v22 = SBUIFaceIDCoachingConditionForSBUIProudLockIconViewState(self->_desiredIconState);
    objc_super v23 = SBUICoachingTextForSBUIFaceIDCoachingCondition(v22);
    v24 = [(SBUIProudLockContainerViewController *)self delegate];
    v25 = [v24 transientSubtitleText];

    BOOL v26 = v9;
    if (v25) {
      uint64_t v27 = [v25 isEqualToString:v23] ^ 1;
    }
    else {
      uint64_t v27 = 1;
    }
    v28 = [(SBUIProudLockContainerViewController *)self _proudLockIconView];
    int64_t v29 = self->_desiredIconState;
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __88__SBUIProudLockContainerViewController__setIconState_animated_options_force_completion___block_invoke;
    v34[3] = &unk_1E5CCDAE0;
    v34[4] = self;
    v35 = v21;
    char v36 = v17;
    char v37 = v33;
    [v28 setState:v29 animated:v26 updateText:v27 options:a5 completion:v34];

    if (v17) {
      goto LABEL_19;
    }
  }
  else
  {
    CGAffineTransform v21 = v12;
    [(SBUIProudLockContainerViewController *)self setUnlockCompletion:v12];
    if (v17)
    {
LABEL_19:
      [(SBUIProudLockContainerViewController *)self setCanLeaveCoachingCondition:0];
      BOOL v12 = v21;
      goto LABEL_27;
    }
  }
  BOOL v12 = v21;
  if (v33) {
    [(SBUIProudLockContainerViewController *)self setCanShowCoachingCondition:0];
  }
LABEL_27:
}

uint64_t __88__SBUIProudLockContainerViewController__setIconState_animated_options_force_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (*(void *)(v5 + 976) == 2)
  {
    uint64_t result = *(void *)(v5 + 1064);
    if (result)
    {
      (*(void (**)(uint64_t, uint64_t))(result + 16))(result, a2);
      uint64_t result = [*(id *)(a1 + 32) setUnlockCompletion:0];
    }
  }
  if (*(unsigned char *)(a1 + 48))
  {
    BOOL v6 = *(void **)(a1 + 32);
    return [v6 _allowLeavingCoachingCondition];
  }
  else if (*(unsigned char *)(a1 + 49))
  {
    uint64_t v7 = *(void **)(a1 + 32);
    return [v7 _allowCoachingConditionImmediately:0];
  }
  return result;
}

- (BOOL)_canTransitionToState:(int64_t)a3
{
  if (!self->_screenOn) {
    goto LABEL_23;
  }
  int64_t v5 = [(SBUIProudLockContainerViewController *)self _actualIconState];
  if (v5 == a3)
  {
LABEL_3:
    LOBYTE(v6) = 0;
    return v6;
  }
  unint64_t v7 = v5;
  if (v5 != 17 || (LOBYTE(v6) = 0, a3 == 1) && self->_configuration.suppressFaceIDDisabledState)
  {
    int IsCoaching = SBUIProudLockIconViewStateIsCoaching(v7);
    int v9 = SBUIProudLockIconViewStateIsCoaching(a3);
    if (SBUIProudLockIconViewStateIsUpsideDown(v7)) {
      char IsUpsideDown = 1;
    }
    else {
      char IsUpsideDown = SBUIProudLockIconViewStateIsUpsideDown(a3);
    }
    int IsCameraCovered = SBUIProudLockIconViewStateIsCameraCovered(v7);
    if (IsCameraCovered) {
      int IsCameraCovered = SBUIProudLockIconViewStateIsCameraCovered(a3);
    }
    if ((IsUpsideDown & 1) == 0
      && ((unint64_t)a3 > 0x11 || ((1 << a3) & 0x2000E) == 0)
      && (IsCoaching ^ 1 | IsCameraCovered | v9) != 1)
    {
      goto LABEL_3;
    }
    if (v7 != 5)
    {
      if (v7 == 2)
      {
        if ((unint64_t)a3 < 0x12) {
          return (0x20003u >> a3) & 1;
        }
        goto LABEL_3;
      }
LABEL_23:
      LOBYTE(v6) = 1;
      return v6;
    }
    if ((unint64_t)(a3 - 2) < 3
      || a3 == 1 && [(SBUIProudLockContainerViewController *)self _isBiometricLockedOut])
    {
      goto LABEL_23;
    }
    int v6 = SBUIProudLockIconViewStateIsCoaching(a3);
    if (v6) {
      goto LABEL_23;
    }
  }
  return v6;
}

- (void)setCanShowScanningState:(BOOL)a3
{
  if (self->_canShowScanningState != a3)
  {
    self->_canShowScanningState = a3;
    [(SBUIProudLockContainerViewController *)self _updateScanningState];
  }
}

- (void)setShouldShowScanningState:(BOOL)a3
{
  if (self->_shouldShowScanningState != a3)
  {
    self->_shouldShowScanningState = a3;
    [(SBUIProudLockContainerViewController *)self _updateScanningState];
  }
}

- (void)setSuppressScanningState:(BOOL)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (self->_suppressScanningState != a3)
  {
    self->_BOOL suppressScanningState = a3;
    id v4 = SBLogLockScreenBiometricFaceIDCoaching();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      BOOL suppressScanningState = self->_suppressScanningState;
      v6[0] = 67109120;
      v6[1] = suppressScanningState;
      _os_log_impl(&dword_1A7607000, v4, OS_LOG_TYPE_DEFAULT, "Received: Suppress Scanning State %{BOOL}d", (uint8_t *)v6, 8u);
    }

    [(SBUIProudLockContainerViewController *)self _updateScanningState];
  }
}

- (void)_updateScanningState
{
  if (self->_canShowScanningState
    && self->_shouldShowScanningState
    && !self->_suppressScanningState
    && self->_configuration.bkCoachingHintsEnabled)
  {
    [(SBUIProudLockContainerViewController *)self _setIconState:5 animated:1];
  }
}

- (void)_startScanningStateTimer
{
  [(id)objc_opt_class() cancelPreviousPerformRequestsWithTarget:self selector:sel__allowScanningState object:0];
  [(SBUIProudLockContainerViewController *)self configuration];
  [(SBUIProudLockContainerViewController *)self performSelector:sel__allowScanningState withObject:0 afterDelay:v3];
}

- (void)_allowCoachingConditionImmediately:(BOOL)a3
{
  BOOL v3 = a3;
  [(id)objc_opt_class() cancelPreviousPerformRequestsWithTarget:self selector:sel__allowCoachingCondition object:0];
  if ([(SBUIProudLockContainerViewController *)self canShowCoachingCondition])
  {
    BOOL v5 = !v3;
    int v6 = self;
LABEL_5:
    [(SBUIProudLockContainerViewController *)v6 _reallyAllowCoachingConditionAnimated:v5];
    return;
  }
  if (v3)
  {
    int v6 = self;
    BOOL v5 = 0;
    goto LABEL_5;
  }
  double minimumDurationBetweenLeavingCoachingAndCoaching = self->_configuration.minimumDurationBetweenLeavingCoachingAndCoaching;
  [(SBUIProudLockContainerViewController *)self performSelector:sel__allowCoachingCondition withObject:0 afterDelay:minimumDurationBetweenLeavingCoachingAndCoaching];
}

- (void)_reallyAllowCoachingConditionAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  [(SBUIProudLockContainerViewController *)self setCanShowCoachingCondition:1];
  [(SBUIProudLockContainerViewController *)self _updateIconViewStateAnimated:v3];
}

- (void)_allowCameraCoveredForUnlockSource:(int)a3
{
  if (a3 == 41)
  {
    BOOL v4 = SBUIFaceIDCameraOrientationForDevice() != 2;
    p_durationToSuppressCameraCoveredWhenWakingWithMagicKeyboard = &self->_configuration.durationToSuppressCameraCoveredWhenWakingWithMagicKeyboard;
    goto LABEL_5;
  }
  if (a3 == 3)
  {
    BOOL v4 = 0;
    p_durationToSuppressCameraCoveredWhenWakingWithMagicKeyboard = &self->_configuration.durationToSuppressCameraCoveredWhenWakingWithSmartCover;
LABEL_5:
    double v6 = *p_durationToSuppressCameraCoveredWhenWakingWithMagicKeyboard;
    goto LABEL_7;
  }
  BOOL v4 = 1;
  double v6 = 0.0;
LABEL_7:
  [(id)objc_opt_class() cancelPreviousPerformRequestsWithTarget:self selector:sel___reallyAllowCameraCoveredReinstatingCoachingIfNecessary object:0];
  if (![(SBUIProudLockContainerViewController *)self canShowCameraCovered])
  {
    if (v4)
    {
      [(SBUIProudLockContainerViewController *)self _reallyAllowCameraCovered];
    }
    else
    {
      [(SBUIProudLockContainerViewController *)self performSelector:sel___reallyAllowCameraCoveredReinstatingCoachingIfNecessary withObject:0 afterDelay:v6];
    }
  }
}

- (void)_reallyAllowCameraCovered
{
  [(SBUIProudLockContainerViewController *)self setCanShowCameraCovered:1];
  [(SBUIProudLockContainerViewController *)self _updateIconViewStateAnimated:1];
}

- (void)__reallyAllowCameraCoveredReinstatingCoachingIfNecessary
{
  [(SBUIProudLockContainerViewController *)self _reallyAllowCameraCovered];
  if (self->_mostRecentCoachingFeedbackCondition == 4)
  {
    [(SBUIProudLockContainerViewController *)self _setCoachingCondition:4 animated:1];
  }
}

- (void)_allowLeavingCoachingCondition
{
  [(id)objc_opt_class() cancelPreviousPerformRequestsWithTarget:self selector:sel__reallyAllowLeavingCoachingCondition object:0];
  double minimumDurationShowingCoaching = self->_configuration.minimumDurationShowingCoaching;
  [(SBUIProudLockContainerViewController *)self performSelector:sel__reallyAllowLeavingCoachingCondition withObject:0 afterDelay:minimumDurationShowingCoaching];
}

- (void)_reallyAllowLeavingCoachingCondition
{
  [(SBUIProudLockContainerViewController *)self setCanLeaveCoachingCondition:1];
  [(SBUIProudLockContainerViewController *)self _updateIconViewStateAnimated:1];
}

- (void)setCanLeaveCoachingCondition:(BOOL)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (self->_canLeaveCoachingCondition != a3)
  {
    self->_canLeaveCoachingCondition = a3;
    if (a3 && (SBUIProudLockIconViewStateIsCoaching(self->_desiredIconState) & 1) == 0)
    {
      BOOL v4 = SBLogBiometricResource();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        int64_t desiredIconState = self->_desiredIconState;
        v8[0] = 67109120;
        v8[1] = desiredIconState;
        _os_log_impl(&dword_1A7607000, v4, OS_LOG_TYPE_DEFAULT, "Desired icon state: %d isn't coaching, leaving coaching", (uint8_t *)v8, 8u);
      }

      unint64_t desiredCoachingCondition = self->_desiredCoachingCondition;
      BOOL v7 = [(SBUIProudLockContainerViewController *)self _isShowingCoachingCondition:desiredCoachingCondition];
      [(SBUIProudLockContainerViewController *)self _clearCoachingCondition];
      if (!v7) {
        [(SBUIProudLockContainerViewController *)self _setCoachingCondition:desiredCoachingCondition animated:1];
      }
    }
  }
}

- (void)_allowScanningState
{
}

- (void)_allowCoachingCondition
{
}

- (BOOL)_isShowingCoachingCondition:(unint64_t)a3
{
  int64_t v4 = [(SBUIProudLockContainerViewController *)self _iconViewStateForCoachingCondition:a3];
  return v4 == [(SBUIProudLockContainerViewController *)self _actualIconState];
}

- (int64_t)_iconViewStateForCoachingCondition:(unint64_t)a3
{
  [(SBUIProudLockContainerViewController *)self configuration];
  unint64_t v5 = v9;
  double v6 = [(SBUIProudLockContainerViewController *)self orientationProvider];
  uint64_t v7 = [v6 orientation];

  return SBUIProudLockIconViewStateForSBUIFaceIDCoachingCondition(a3, v7, v5);
}

- (void)_performForcedUpdate:(id)a3
{
  unint64_t forceCount = self->_forceCount;
  self->_unint64_t forceCount = forceCount + 1;
  if (a3)
  {
    (*((void (**)(id, SEL))a3 + 2))(a3, a2);
    unint64_t forceCount = self->_forceCount - 1;
  }
  self->_unint64_t forceCount = forceCount;
}

- ($20D0CF0D87A8AD096D8C820DF2D4BB3C)configuration
{
  long long v3 = *(_OWORD *)&self[14].var2;
  *(_OWORD *)&retstr->var5 = *(_OWORD *)&self[13].var12;
  *(_OWORD *)&retstr->var7 = v3;
  *(_OWORD *)&retstr->var9 = *(_OWORD *)&self[14].var4;
  long long v4 = *(_OWORD *)&self[13].var8;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[13].var6;
  *(_OWORD *)&retstr->var3 = v4;
  return self;
}

- (SBUIProudLockContainerViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBUIProudLockContainerViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (BOOL)isAuthenticated
{
  return self->_authenticated;
}

- (BOOL)isScreenOn
{
  return self->_screenOn;
}

- (BOOL)suppressScanningState
{
  return self->_suppressScanningState;
}

- (BOOL)suppressNotLooking
{
  return self->_suppressNotLooking;
}

- (void)setGuidanceTextVisible:(BOOL)a3
{
  self->_guidanceTextVisible = a3;
}

- (BOOL)suppressAlongsideCoaching
{
  return self->_suppressAlongsideCoaching;
}

- (SBUIProudLockContainerViewControllerLockStatusProvider)authenticationInformationProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_authenticationInformationProvider);
  return (SBUIProudLockContainerViewControllerLockStatusProvider *)WeakRetained;
}

- (void)setAuthenticationInformationProvider:(id)a3
{
}

- (BOOL)canShowScanningState
{
  return self->_canShowScanningState;
}

- (BOOL)shouldShowScanningState
{
  return self->_shouldShowScanningState;
}

- (BOOL)canShowCoachingCondition
{
  return self->_canShowCoachingCondition;
}

- (void)setCanShowCoachingCondition:(BOOL)a3
{
  self->_canShowCoachingCondition = a3;
}

- (BOOL)canLeaveCoachingCondition
{
  return self->_canLeaveCoachingCondition;
}

- (BOOL)hasSeenFaceSinceScreenOn
{
  return self->_hasSeenFaceSinceScreenOn;
}

- (BOOL)canShowCameraCovered
{
  return self->_canShowCameraCovered;
}

- (void)setCanShowCameraCovered:(BOOL)a3
{
  self->_canShowCameraCovered = a3;
}

- (id)unlockCompletion
{
  return self->_unlockCompletion;
}

- (unint64_t)forceCount
{
  return self->_forceCount;
}

- (void)setForceCount:(unint64_t)a3
{
  self->_unint64_t forceCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_unlockCompletion, 0);
  objc_destroyWeak((id *)&self->_authenticationInformationProvider);
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_orientationProvider, 0);
  objc_storeStrong((id *)&self->_testProudLockIconView, 0);
}

@end