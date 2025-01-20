@interface SBUIPasscodeLockViewBase
- ($1D129F7B4C980C50E70029647222EF17)transitionContext;
- ($20D0CF0D87A8AD096D8C820DF2D4BB3C)proudLockConfiguration;
- (BOOL)_accountingForExternallyShownProudLock;
- (BOOL)_canRecognizeBiometricAuthentication;
- (BOOL)_effectivelyHasProudLockShowingBiometricStates;
- (BOOL)_isBoundsPortraitOriented;
- (BOOL)_proudLockShowingBiometricStates;
- (BOOL)_setAuthenticationViewTypeToFaceIDWithWatch;
- (BOOL)_statusStateShouldNotUpdateForUnsupportedGlassesFeedback:(unint64_t)a3;
- (BOOL)_supportsProudLock;
- (BOOL)allowsAutomaticBiometricPresentationTransition;
- (BOOL)alwaysShowPasscodeButtonForFaceIDMatchFailure;
- (BOOL)becomeFirstResponder;
- (BOOL)biometricPresentationAncillaryButtonsVisible;
- (BOOL)canBecomeFirstResponder;
- (BOOL)canPeformBiometricAuthentication;
- (BOOL)canResignFirstResponder;
- (BOOL)canSuggestSwipeToRetry;
- (BOOL)confirmedNotInPocket;
- (BOOL)hasBiometricAuthenticationCapabilityEnabled;
- (BOOL)hasPasscodeSet;
- (BOOL)isBiometricAuthenticationAllowed;
- (BOOL)isBiometricLockedOut;
- (BOOL)isScreenOn;
- (BOOL)isTransitioning;
- (BOOL)playsKeypadSounds;
- (BOOL)resignFirstResponder;
- (BOOL)shouldResetForFailedPasscodeAttempt;
- (BOOL)showsCancelButton;
- (BOOL)showsEmergencyCallButton;
- (BOOL)showsLockIconForFaceID;
- (BOOL)showsProudLock;
- (BOOL)showsStatusField;
- (BOOL)supportsPoseidonCoaching;
- (BOOL)usesBiometricPresentation;
- (NSString)_statusSubtitleText;
- (NSString)_statusText;
- (NSString)overrideFaceIDReason;
- (NSString)overridePasscodeButtonTitle;
- (NSString)passcode;
- (NSString)unlockDestination;
- (NSTimer)screenBrightnessChangedTimer;
- (SBFLegibilitySettingsProvider)backgroundLegibilitySettingsProvider;
- (SBUIBiometricResource)biometricResource;
- (SBUIPasscodeEntryField)_entryField;
- (SBUIPasscodeLockViewBase)initWithFrame:(CGRect)a3;
- (SBUIPasscodeLockViewDelegate)delegate;
- (SBUIPoseidonContainerViewController)poseidonContainerViewController;
- (SBUIProudLockContainerViewController)overrideProudLockContainerViewController;
- (UIColor)customBackgroundColor;
- (UINotificationFeedbackGenerator)authenticationFeedbackBehavior;
- (UIView)biometricAuthenticationView;
- (UIView)passcodeAuthenticationView;
- (UIView)poseidonContainerView;
- (_UIKBFeedbackGenerating)keyboardFeedbackBehavior;
- (double)_biometricViewAlphaFromPasscodeLockViewState:(int64_t)a3;
- (double)_luminanceBoostFromDisplayBrightness;
- (double)_luminanceBoostFromLegibility;
- (double)_luminosityBoost;
- (double)_numberPadOffsetFromTopOfScreen:(id)a3;
- (double)backgroundAlpha;
- (double)passcodeBiometricAuthenticationViewNumberPadAncillaryButtonOffsetFromTopOfScreen:(id)a3;
- (double)passcodeBiometricAuthenticationViewSideButtonsOffsetFromCenter:(id)a3;
- (id)_defaultStatusText;
- (id)_deviceSpecificTemperatureStringForTemperatureState:(unint64_t)a3;
- (id)_proudLockContainerViewControllerToUpdate;
- (int)style;
- (int64_t)_orientation;
- (int64_t)passcodeLockViewState;
- (unint64_t)_statusState;
- (unint64_t)_statusStateForLockoutState:(unint64_t)a3;
- (void)_advanceToPasscodeForMatchFailure:(BOOL)a3;
- (void)_advanceToPasscodeTimerFired;
- (void)_applyProudLockContainerViewControllerConfiguration;
- (void)_armAdvanceToPasscodeTimer;
- (void)_clearBrightnessChangeTimer;
- (void)_disarmAdvanceToPasscodeTimer;
- (void)_evaluateBiometricMatchingState;
- (void)_evaluateLuminance;
- (void)_handleBiometricAuthentication;
- (void)_handleNonPasscodeAuthenticationAndUpdateProudLock;
- (void)_luminanceBoostDidChange;
- (void)_noteDeviceHasBeenUnlockedOnceSinceBoot:(BOOL)a3;
- (void)_noteScreenBrightnessDidChange;
- (void)_notifyDelegatePasscodeEnteredViaMesa;
- (void)_overrideBiometricMatchingEnabled:(BOOL)a3 forReason:(id)a4;
- (void)_playAuthenticationFeedbackForSuccess:(BOOL)a3 jiggleLock:(BOOL)a4;
- (void)_resetForFailedBiometricAttempt;
- (void)_resetForFailedPasscode:(BOOL)a3;
- (void)_resetProudLockAndTitleTextForFailedBiometricAttempt;
- (void)_resetStatusText;
- (void)_resumeBiometricMatchingAdvisory:(BOOL)a3;
- (void)_screenBrightnessReallyDidChange;
- (void)_sendDelegateKeypadKeyDown;
- (void)_sendDelegateKeypadKeyUp;
- (void)_setBiometricMatchingState:(unint64_t)a3;
- (void)_setEntryField:(id)a3;
- (void)_setLegibilitySettings:(id)a3;
- (void)_setLuminosityBoost:(double)a3;
- (void)_setPasscodeLockViewState:(int64_t)a3 animated:(BOOL)a4;
- (void)_setStatusState:(unint64_t)a3;
- (void)_setStatusState:(unint64_t)a3 animated:(BOOL)a4;
- (void)_setStatusStateSwipeToRetryAnimated:(BOOL)a3;
- (void)_setStatusSubtitleText:(id)a3;
- (void)_setStatusText:(id)a3;
- (void)_setSuppressTitleText:(BOOL)a3 animated:(BOOL)a4;
- (void)_updateBiometricAlpha;
- (void)_updateBiometricGlyphForBioEvent:(unint64_t)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)_updateBiometricLayout;
- (void)_updateProudLockForBioEvent:(unint64_t)a3;
- (void)_updateProudLockForBioUnlockWithCompletion:(id)a3;
- (void)_updateStatusStateForLockoutIfNecessaryAnimatedly:(BOOL)a3;
- (void)_updateStatusTextForBioEvent:(unint64_t)a3 animated:(BOOL)a4;
- (void)autofillForSuccessfulMesaAttemptWithCompletion:(id)a3;
- (void)beginTransitionToState:(int64_t)a3;
- (void)biometricResource:(id)a3 matchingEnabledDidChange:(BOOL)a4;
- (void)biometricResource:(id)a3 observeEvent:(unint64_t)a4;
- (void)dealloc;
- (void)didEndTransitionToState:(int64_t)a3;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)noteBottomFaceHasBeenOccluded;
- (void)passcodeBiometricAuthenticationViewCancelButtonHit:(id)a3;
- (void)passcodeBiometricAuthenticationViewEmergencyCallButtonHit:(id)a3;
- (void)passcodeBiometricAuthenticationViewUsePasscodeButtonHit:(id)a3;
- (void)phoneUnlockWithWatchControllerAttemptFailed:(id)a3 withError:(id)a4;
- (void)providerLegibilitySettingsChanged:(id)a3;
- (void)reset;
- (void)resetForFailedMesaAttemptWithStatusText:(id)a3 andSubtitle:(id)a4;
- (void)resetForFailedPasscode;
- (void)resetForScreenOff;
- (void)resetForSuccess;
- (void)setAllowsAutomaticBiometricPresentationTransition:(BOOL)a3;
- (void)setAllowsStatusTextUpdatingOnResignFirstResponder:(BOOL)a3;
- (void)setAlwaysShowPasscodeButtonForFaceIDMatchFailure:(BOOL)a3;
- (void)setAuthenticationFeedbackBehavior:(id)a3;
- (void)setBackgroundAlpha:(double)a3;
- (void)setBackgroundLegibilitySettingsProvider:(id)a3;
- (void)setBiometricAuthenticationAllowed:(BOOL)a3;
- (void)setBiometricAuthenticationView:(id)a3;
- (void)setBiometricPresentationAncillaryButtonsVisible:(BOOL)a3;
- (void)setBiometricResource:(id)a3;
- (void)setCanSuggestSwipeToRetry:(BOOL)a3;
- (void)setConfirmedNotInPocket:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setIsTransitioning:(BOOL)a3;
- (void)setKeyboardFeedbackBehavior:(id)a3;
- (void)setNeedsStatusTextUpdate;
- (void)setOverrideFaceIDReason:(id)a3;
- (void)setOverridePasscodeButtonTitle:(id)a3;
- (void)setOverrideProudLockContainerViewController:(id)a3;
- (void)setPasscodeAuthenticationView:(id)a3;
- (void)setPasscodeLockViewState:(int64_t)a3;
- (void)setPlaysKeypadSounds:(BOOL)a3;
- (void)setPoseidonContainerView:(id)a3;
- (void)setPoseidonContainerViewController:(id)a3;
- (void)setProudLockConfiguration:(id *)a3;
- (void)setScreenBrightnessChangedTimer:(id)a3;
- (void)setScreenOn:(BOOL)a3;
- (void)setShouldResetForFailedPasscodeAttempt:(BOOL)a3;
- (void)setShowsCancelButton:(BOOL)a3;
- (void)setShowsEmergencyCallButton:(BOOL)a3;
- (void)setShowsLockIconForFaceID:(BOOL)a3;
- (void)setShowsProudLock:(BOOL)a3;
- (void)setShowsStatusField:(BOOL)a3;
- (void)setStyle:(int)a3;
- (void)setTransitionContext:(id *)a3;
- (void)setUnlockDestination:(id)a3;
- (void)setUsesBiometricPresentation:(BOOL)a3;
- (void)updateForTransitionToPasscodeView:(BOOL)a3 animated:(BOOL)a4;
- (void)updateStatusText:(id)a3 subtitle:(id)a4 animated:(BOOL)a5;
- (void)updateStatusTextAnimated:(BOOL)a3;
- (void)updateTransitionWithProgress:(double)a3;
- (void)willEndTransitionToState:(int64_t)a3;
- (void)willMoveToSuperview:(id)a3;
- (void)willMoveToWindow:(id)a3;
@end

@implementation SBUIPasscodeLockViewBase

- (SBUIPasscodeLockViewBase)initWithFrame:(CGRect)a3
{
  v30.receiver = self;
  v30.super_class = (Class)SBUIPasscodeLockViewBase;
  v3 = -[SBUIPasscodeLockViewBase initWithFrame:](&v30, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_isBiometricAuthenticationAllowed = 1;
    v3->_allowsAutomaticBiometricPresentationTransition = 1;
    v3->_biometricMatchingState = 0;
    [(SBUIPasscodeLockViewBase *)v3 bounds];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    v13 = (UIView *)objc_alloc_init(MEMORY[0x1E4F42FF0]);
    passcodeAuthenticationView = v4->_passcodeAuthenticationView;
    v4->_passcodeAuthenticationView = v13;

    v15 = -[SBUIPasscodeBiometricAuthenticationView initWithFrame:layoutDelegate:]([SBUIPasscodeBiometricAuthenticationView alloc], "initWithFrame:layoutDelegate:", v4, v6, v8, v10, v12);
    biometricAuthenticationView = v4->_biometricAuthenticationView;
    v4->_biometricAuthenticationView = v15;

    [(SBUIPasscodeBiometricAuthenticationView *)v4->_biometricAuthenticationView setDelegate:v4];
    [(SBUIPasscodeBiometricAuthenticationView *)v4->_biometricAuthenticationView setAncillaryButtonsVisible:1];
    [(SBUIPasscodeLockViewBase *)v4 _setPasscodeLockViewState:1 animated:0];
    -[UIView setFrame:](v4->_passcodeAuthenticationView, "setFrame:", v6, v8, v10, v12);
    [(SBUIPasscodeLockViewBase *)v4 addSubview:v4->_passcodeAuthenticationView];
    [(SBUIPasscodeLockViewBase *)v4 addSubview:v4->_biometricAuthenticationView];
    uint64_t v17 = [MEMORY[0x1E4F431E8] feedbackGeneratorWithView:v4];
    keyboardFeedbackBehavior = v4->_keyboardFeedbackBehavior;
    v4->_keyboardFeedbackBehavior = (_UIKBFeedbackGenerating *)v17;

    v19 = +[SBUIExternalPreferences sharedInstance];
    -[SBUIPasscodeLockViewBase setPlaysKeypadSounds:](v4, "setPlaysKeypadSounds:", [v19 keyboardPlaysSounds]);

    [(SBUIPasscodeLockViewBase *)v4 setShowsCancelButton:1];
    [(SBUIPasscodeLockViewBase *)v4 setShowsEmergencyCallButton:MGGetBoolAnswer()];
    [(SBUIPasscodeLockViewBase *)v4 setShowsStatusField:1];
    v20 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v21 = *MEMORY[0x1E4F43CB0];
    v22 = [MEMORY[0x1E4F42D90] mainScreen];
    [v20 addObserver:v4 selector:sel__noteScreenBrightnessDidChange name:v21 object:v22];

    [(SBUIPasscodeLockViewBase *)v4 _noteScreenBrightnessDidChange];
    v4->_allowsStatusTextUpdatingOnResignFirstResponder = 1;
    v4->_deviceHasBeenUnlockedOnceSinceBoot = 1;
    v23 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", &unk_1EFCEAD10, &unk_1EFCEAD28, &unk_1EFCEAD40, &unk_1EFCEAD58, 0);
    id v24 = objc_alloc(MEMORY[0x1E4F42C10]);
    v25 = [MEMORY[0x1E4F43268] privateConfigurationForTypes:v23];
    uint64_t v26 = [v24 initWithConfiguration:v25 view:v4];
    authenticationFeedbackBehavior = v4->_authenticationFeedbackBehavior;
    v4->_authenticationFeedbackBehavior = (UINotificationFeedbackGenerator *)v26;

    v4->_shouldConsiderTapGuard = 1;
    v28 = +[SBUIPhoneUnlockWithWatchController sharedInstance];
    [v28 addObserver:v4];
  }
  return v4;
}

- (void)layoutSubviews
{
  [(SBUIPasscodeLockViewBase *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  BOOL v11 = [(SBUIPasscodeLockViewBase *)self isTransitioning];
  double y = v6;
  double width = v8;
  double height = v10;
  double x = v4;
  double v16 = v10;
  double v17 = v8;
  double v18 = v6;
  double v19 = v4;
  if (!v11)
  {
    int64_t passcodeLockViewState = self->_passcodeLockViewState;
    if (passcodeLockViewState)
    {
      double y = v6;
      double width = v8;
      double height = v10;
      double x = v4;
      double v16 = v10;
      double v17 = v8;
      double v18 = v6;
      double v19 = v4;
      if (passcodeLockViewState == 1)
      {
        v26.origin.double x = v4;
        v26.origin.double y = v6;
        v26.size.double width = v8;
        v26.size.double height = v10;
        CGFloat v21 = CGRectGetHeight(v26) * 0.5;
        v27.origin.double x = v4;
        v27.origin.double y = v6;
        v27.size.double width = v8;
        v27.size.double height = v10;
        CGRect v28 = CGRectOffset(v27, 0.0, v21);
        double x = v28.origin.x;
        double y = v28.origin.y;
        double width = v28.size.width;
        double height = v28.size.height;
        double v16 = v10;
        double v17 = v8;
        double v18 = v6;
        double v19 = v4;
      }
    }
    else
    {
      v29.origin.double x = v4;
      v29.origin.double y = v6;
      v29.size.double width = v8;
      v29.size.double height = v10;
      CGFloat v22 = CGRectGetHeight(v29) * -0.5;
      v30.origin.double x = v4;
      v30.origin.double y = v6;
      v30.size.double width = v8;
      v30.size.double height = v10;
      *(CGRect *)&double v19 = CGRectOffset(v30, 0.0, v22);
      double y = v6;
      double width = v8;
      double height = v10;
      double x = v4;
    }
  }
  -[UIView setFrame:](self->_passcodeAuthenticationView, "setFrame:", v19, v18, v17, v16);
  -[SBUIPasscodeBiometricAuthenticationView setFrame:](self->_biometricAuthenticationView, "setFrame:", x, y, width, height);
  proudLockContainerViewController = self->_proudLockContainerViewController;
  if (proudLockContainerViewController)
  {
    id v24 = [(SBUIProudLockContainerViewController *)proudLockContainerViewController view];
    objc_msgSend(v24, "setFrame:", v4, v6, v8, v10);
    [(SBUIPasscodeLockViewBase *)self bringSubviewToFront:v24];
  }
}

- (NSString)unlockDestination
{
  return [(SBUIPasscodeBiometricAuthenticationView *)self->_biometricAuthenticationView unlockDestination];
}

- (void)setUnlockDestination:(id)a3
{
}

- (void)setUsesBiometricPresentation:(BOOL)a3
{
  BOOL v3 = a3;
  v13[1] = *MEMORY[0x1E4F143B8];
  unint64_t v5 = [(SBUIBiometricResource *)self->_biometricResource biometricLockoutState];
  BOOL v6 = [(SBUIBiometricResource *)self->_biometricResource hasBiometricAuthenticationCapabilityEnabled];
  if (v5) {
    uint64_t v7 = 1;
  }
  else {
    uint64_t v7 = !v3 || !v6;
  }
  [(SBUIPasscodeLockViewBase *)self _setPasscodeLockViewState:v7 animated:0];
  if (v7 == 1 && v6 && v5 != 0)
  {
    double v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
    double v12 = @"SBUIPasscodeLockViewBiometricTransitionToPasscodeReasonKey";
    v13[0] = @"SBUIPasscodeLockViewBiometricTransitionToPasscodeReasonBioLockout";
    BOOL v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
    [v10 postNotificationName:@"SBUIPasscodeLockViewBiometricTransitionToPasscode" object:self userInfo:v11];
  }
}

- (BOOL)showsEmergencyCallButton
{
  return [(SBUIPasscodeBiometricAuthenticationView *)self->_biometricAuthenticationView showsEmergencyCallButton];
}

- (void)setShowsEmergencyCallButton:(BOOL)a3
{
}

- (BOOL)showsCancelButton
{
  return [(SBUIPasscodeBiometricAuthenticationView *)self->_biometricAuthenticationView showsCancelButton];
}

- (void)setShowsCancelButton:(BOOL)a3
{
}

- (BOOL)biometricPresentationAncillaryButtonsVisible
{
  return [(SBUIPasscodeBiometricAuthenticationView *)self->_biometricAuthenticationView ancillaryButtonsVisible];
}

- (void)setBiometricPresentationAncillaryButtonsVisible:(BOOL)a3
{
}

- (void)setShowsProudLock:(BOOL)a3
{
  unsigned int v4 = a3 & ~[(SBUIPasscodeLockViewBase *)self _accountingForExternallyShownProudLock];
  if (self->_showsProudLock != v4)
  {
    self->_showsProudLock = v4;
    if (v4 && [(SBUIPasscodeLockViewBase *)self _supportsProudLock])
    {
      unint64_t v5 = [[SBUIProudLockContainerViewController alloc] initWithAuthenticationInformationProvider:self];
      proudLockContainerViewController = self->_proudLockContainerViewController;
      self->_proudLockContainerViewController = v5;

      uint64_t v7 = self->_proudLockContainerViewController;
      long long v8 = *(_OWORD *)&self->_proudLockConfiguration.durationToSuppressCameraCoveredWhenWakingWithSmartCover;
      void v13[2] = *(_OWORD *)&self->_proudLockConfiguration.minimumDurationShowingCoaching;
      v13[3] = v8;
      v13[4] = *(_OWORD *)&self->_proudLockConfiguration.coachingDelaysUnlock;
      long long v9 = *(_OWORD *)&self->_proudLockConfiguration.bkCoachingHintsEnabled;
      v13[0] = *(_OWORD *)&self->_proudLockConfiguration.showScanningState;
      v13[1] = v9;
      [(SBUIProudLockContainerViewController *)v7 setConfiguration:v13];
      [(SBUIProudLockContainerViewController *)self->_proudLockContainerViewController setSuppressNotLooking:1];
      double v10 = [(SBUIProudLockContainerViewController *)self->_proudLockContainerViewController view];
      [(SBUIPasscodeLockViewBase *)self addSubview:v10];

      [(SBUIProudLockContainerViewController *)self->_proudLockContainerViewController viewWillAppear:0];
    }
    else
    {
      [(SBUIProudLockContainerViewController *)self->_proudLockContainerViewController viewDidDisappear:0];
      BOOL v11 = [(SBUIProudLockContainerViewController *)self->_proudLockContainerViewController view];
      [v11 removeFromSuperview];

      double v12 = self->_proudLockContainerViewController;
      self->_proudLockContainerViewController = 0;
    }
  }
}

- (void)setPoseidonContainerView:(id)a3
{
  unint64_t v5 = (UIView *)a3;
  if (self->_poseidonContainerView != v5)
  {
    BOOL v6 = v5;
    objc_storeStrong((id *)&self->_poseidonContainerView, a3);
    [(SBUIPasscodeLockViewBase *)self addSubview:self->_poseidonContainerView];
    unint64_t v5 = v6;
  }
}

- (void)setPoseidonContainerViewController:(id)a3
{
  unint64_t v5 = (SBUIPoseidonContainerViewController *)a3;
  p_poseidonContainerViewController = &self->_poseidonContainerViewController;
  if (self->_poseidonContainerViewController != v5)
  {
    uint64_t v7 = v5;
    objc_storeStrong((id *)&self->_poseidonContainerViewController, a3);
    [(SBUIPoseidonContainerViewController *)*p_poseidonContainerViewController setAuthenticationInformationProvider:self];
    [(SBUIPoseidonContainerViewController *)*p_poseidonContainerViewController showCoaching:1];
    unint64_t v5 = v7;
  }
}

- (BOOL)supportsPoseidonCoaching
{
  return [(SBUIBiometricResource *)self->_biometricResource hasPoseidonSupport];
}

- (void)setOverrideProudLockContainerViewController:(id)a3
{
  unint64_t v5 = (SBUIProudLockContainerViewController *)a3;
  p_overrideProudLockContainerViewController = &self->_overrideProudLockContainerViewController;
  overrideProudLockContainerViewController = self->_overrideProudLockContainerViewController;
  if (overrideProudLockContainerViewController != v5)
  {
    long long v8 = v5;
    [(SBUIProudLockContainerViewController *)overrideProudLockContainerViewController setSuppressScanningState:1];
    [(SBUIProudLockContainerViewController *)*p_overrideProudLockContainerViewController setSuppressNotLooking:0];
    objc_storeStrong((id *)&self->_overrideProudLockContainerViewController, a3);
    [(SBUIProudLockContainerViewController *)*p_overrideProudLockContainerViewController setSuppressScanningState:0];
    [(SBUIProudLockContainerViewController *)*p_overrideProudLockContainerViewController setSuppressNotLooking:1];
    if (!*p_overrideProudLockContainerViewController) {
      self->_proudLockConfiguration.substate = 0;
    }
    overrideProudLockContainerViewController = (SBUIProudLockContainerViewController *)[(SBUIPasscodeLockViewBase *)self _applyProudLockContainerViewControllerConfiguration];
    unint64_t v5 = v8;
  }
  MEMORY[0x1F41817F8](overrideProudLockContainerViewController, v5);
}

- (void)setProudLockConfiguration:(id *)a3
{
  p_proudLockConfiguration = &self->_proudLockConfiguration;
  long long v6 = *(_OWORD *)&self->_proudLockConfiguration.durationToSuppressCameraCoveredWhenWakingWithSmartCover;
  v15[2] = *(_OWORD *)&self->_proudLockConfiguration.minimumDurationShowingCoaching;
  v15[3] = v6;
  v15[4] = *(_OWORD *)&self->_proudLockConfiguration.coachingDelaysUnlock;
  long long v7 = *(_OWORD *)&self->_proudLockConfiguration.bkCoachingHintsEnabled;
  v15[0] = *(_OWORD *)&self->_proudLockConfiguration.showScanningState;
  v15[1] = v7;
  long long v8 = *(_OWORD *)&a3->var7;
  v14[2] = *(_OWORD *)&a3->var5;
  v14[3] = v8;
  v14[4] = *(_OWORD *)&a3->var9;
  long long v9 = *(_OWORD *)&a3->var3;
  v14[0] = *(_OWORD *)&a3->var0;
  v14[1] = v9;
  if (!SBUIProudLockContainerViewControllerConfigurationEqualToConfiguration((double *)v15, (double *)v14))
  {
    long long v10 = *(_OWORD *)&a3->var3;
    long long v11 = *(_OWORD *)&a3->var5;
    long long v12 = *(_OWORD *)&a3->var7;
    *(void *)&p_proudLockConfiguration->coachingDelaysUnlock = *(void *)&a3->var9;
    long long v13 = *(_OWORD *)&a3->var0;
    *(_OWORD *)&p_proudLockConfiguration->minimumDurationShowingCoaching = v11;
    *(_OWORD *)&p_proudLockConfiguration->durationToSuppressCameraCoveredWhenWakingWithSmartCover = v12;
    *(_OWORD *)&p_proudLockConfiguration->showScanningState = v13;
    *(_OWORD *)&p_proudLockConfiguration->bkCoachingHintsEnabled = v10;
    p_proudLockConfiguration->suppressFaceIDDisabledState = 1;
    p_proudLockConfiguration->substate = 1;
    [(SBUIPasscodeLockViewBase *)self _applyProudLockContainerViewControllerConfiguration];
  }
}

- (void)setShowsLockIconForFaceID:(BOOL)a3
{
}

- (void)setOverrideFaceIDReason:(id)a3
{
}

- (void)setOverridePasscodeButtonTitle:(id)a3
{
}

- (BOOL)canPeformBiometricAuthentication
{
  if ([(SBUIPasscodeLockViewBase *)self isBiometricLockedOut]) {
    return 0;
  }
  biometricResource = self->_biometricResource;
  return [(SBUIBiometricResource *)biometricResource hasBiometricAuthenticationCapabilityEnabled];
}

- (void)_applyProudLockContainerViewControllerConfiguration
{
  proudLockContainerViewController = self->_proudLockContainerViewController;
  long long v4 = *(_OWORD *)&self->_proudLockConfiguration.durationToSuppressCameraCoveredWhenWakingWithSmartCover;
  long long v11 = *(_OWORD *)&self->_proudLockConfiguration.minimumDurationShowingCoaching;
  long long v12 = v4;
  long long v13 = *(_OWORD *)&self->_proudLockConfiguration.coachingDelaysUnlock;
  long long v5 = *(_OWORD *)&self->_proudLockConfiguration.bkCoachingHintsEnabled;
  long long v9 = *(_OWORD *)&self->_proudLockConfiguration.showScanningState;
  long long v10 = v5;
  [(SBUIProudLockContainerViewController *)proudLockContainerViewController setConfiguration:&v9];
  overrideProudLockContainerViewController = self->_overrideProudLockContainerViewController;
  long long v7 = *(_OWORD *)&self->_proudLockConfiguration.durationToSuppressCameraCoveredWhenWakingWithSmartCover;
  long long v11 = *(_OWORD *)&self->_proudLockConfiguration.minimumDurationShowingCoaching;
  long long v12 = v7;
  long long v13 = *(_OWORD *)&self->_proudLockConfiguration.coachingDelaysUnlock;
  long long v8 = *(_OWORD *)&self->_proudLockConfiguration.bkCoachingHintsEnabled;
  long long v9 = *(_OWORD *)&self->_proudLockConfiguration.showScanningState;
  long long v10 = v8;
  [(SBUIProudLockContainerViewController *)overrideProudLockContainerViewController setConfiguration:&v9];
}

- (BOOL)_supportsProudLock
{
  if ([(SBUIBiometricResource *)self->_biometricResource hasPearlSupport]
    || (MGGetBoolAnswer() & 1) != 0)
  {
    return 1;
  }
  biometricResource = self->_biometricResource;
  return [(SBUIBiometricResource *)biometricResource hasPoseidonSupport];
}

- (id)_proudLockContainerViewControllerToUpdate
{
  overrideProudLockContainerViewController = self->_overrideProudLockContainerViewController;
  if (!overrideProudLockContainerViewController) {
    overrideProudLockContainerViewController = self->_proudLockContainerViewController;
  }
  BOOL v3 = overrideProudLockContainerViewController;
  return v3;
}

- (void)setPasscodeLockViewState:(int64_t)a3
{
}

- (void)_setPasscodeLockViewState:(int64_t)a3 animated:(BOOL)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (self->_passcodeLockViewState != a3)
  {
    BOOL v4 = a4;
    self->_int64_t passcodeLockViewState = a3;
    long long v7 = SBLogCommon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      long long v8 = @"SBUIPasscodeLockViewStateBiometric";
      if (a3 == 1) {
        long long v8 = @"SBUIPasscodeLockViewStatePasscode";
      }
      long long v9 = v8;
      *(_DWORD *)buf = 138412290;
      v20 = v9;
      _os_log_impl(&dword_1A7607000, v7, OS_LOG_TYPE_DEFAULT, "Setting passcode lock view state to: %@", buf, 0xCu);
    }
    if (v4) {
      double v10 = 0.3;
    }
    else {
      double v10 = 0.0;
    }
    if (v4) {
      double v11 = 0.57;
    }
    else {
      double v11 = 0.0;
    }
    [(SBUIPasscodeLockViewBase *)self setNeedsLayout];
    int64_t passcodeLockViewState = self->_passcodeLockViewState;
    if (passcodeLockViewState)
    {
      if (passcodeLockViewState == 1)
      {
        [(SBUIPasscodeLockViewBase *)self willTransitionToPasscodeView];
        v17[0] = MEMORY[0x1E4F143A8];
        v17[1] = 3221225472;
        v17[2] = __63__SBUIPasscodeLockViewBase__setPasscodeLockViewState_animated___block_invoke;
        v17[3] = &unk_1E5CCC5A8;
        v17[4] = self;
        BOOL v18 = v4;
        [MEMORY[0x1E4F42FF0] animateWithDuration:2 delay:v17 options:0 animations:v10 completion:0.0];
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __63__SBUIPasscodeLockViewBase__setPasscodeLockViewState_animated___block_invoke_2;
        v16[3] = &unk_1E5CCC580;
        v16[4] = self;
        [MEMORY[0x1E4F42FF0] animateWithDuration:6 delay:v16 usingSpringWithDamping:0 initialSpringVelocity:v11 options:0.0 animations:0.97 completion:0.0];
      }
    }
    else
    {
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __63__SBUIPasscodeLockViewBase__setPasscodeLockViewState_animated___block_invoke_3;
      v15[3] = &unk_1E5CCC580;
      v15[4] = self;
      [MEMORY[0x1E4F42FF0] animateWithDuration:0 delay:v15 options:&__block_literal_global_0 animations:v10 completion:0.0];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __63__SBUIPasscodeLockViewBase__setPasscodeLockViewState_animated___block_invoke_5;
      v14[3] = &unk_1E5CCC580;
      v14[4] = self;
      [MEMORY[0x1E4F42FF0] animateWithDuration:4 delay:v14 usingSpringWithDamping:0 initialSpringVelocity:v11 options:0.0 animations:0.97 completion:0.0];
      if ([(SBUIBiometricResource *)self->_biometricResource hasPearlSupport]) {
        [(SBUIPasscodeLockViewBase *)self _armAdvanceToPasscodeTimer];
      }
    }
    long long v13 = [(SBUIPasscodeLockViewBase *)self delegate];
    if (objc_opt_respondsToSelector()) {
      [v13 passcodeLockViewStateChange:self];
    }
  }
}

uint64_t __63__SBUIPasscodeLockViewBase__setPasscodeLockViewState_animated___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 520) setAlpha:1.0];
  [*(id *)(a1 + 32) _updateBiometricAlpha];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(unsigned __int8 *)(a1 + 40);
  return [v2 updateForTransitionToPasscodeView:1 animated:v3];
}

uint64_t __63__SBUIPasscodeLockViewBase__setPasscodeLockViewState_animated___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

uint64_t __63__SBUIPasscodeLockViewBase__setPasscodeLockViewState_animated___block_invoke_3(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 520) setAlpha:0.0];
  [*(id *)(a1 + 32) _updateBiometricAlpha];
  v2 = *(void **)(a1 + 32);
  return [v2 updateForTransitionToPasscodeView:0 animated:0];
}

uint64_t __63__SBUIPasscodeLockViewBase__setPasscodeLockViewState_animated___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

- (void)noteBottomFaceHasBeenOccluded
{
  if (![(SBUIPasscodeLockViewBase *)self _setAuthenticationViewTypeToFaceIDWithWatch])
  {
    uint64_t v3 = +[SBUIPeriocularController sharedInstance];
    char v4 = [v3 periocularEnabled];

    if ((v4 & 1) == 0)
    {
      [(SBUIPasscodeLockViewBase *)self _advanceToPasscodeForMatchFailure:1];
    }
  }
}

- (BOOL)_setAuthenticationViewTypeToFaceIDWithWatch
{
  uint64_t v3 = +[SBUIPhoneUnlockWithWatchController sharedInstance];
  if ([v3 phoneUnlockWithWatchEnabled]
    && [v3 didDetectFaceRequirementsForPAU])
  {
    [(SBUIPasscodeBiometricAuthenticationView *)self->_biometricAuthenticationView setType:3];
    char v4 = SBLogPhoneUnlockWithWatch();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long v7 = 0;
      _os_log_impl(&dword_1A7607000, v4, OS_LOG_TYPE_DEFAULT, "Passcode authentication view type set to FaceID with watch", v7, 2u);
    }

    BOOL v5 = 1;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)isBiometricLockedOut
{
  v2 = [(SBUIPasscodeLockViewBase *)self biometricResource];
  BOOL v3 = [v2 biometricLockoutState] != 0;

  return v3;
}

- (BOOL)hasPasscodeSet
{
  return 1;
}

- (BOOL)hasBiometricAuthenticationCapabilityEnabled
{
  v2 = [(SBUIPasscodeLockViewBase *)self biometricResource];
  char v3 = [v2 hasBiometricAuthenticationCapabilityEnabled];

  return v3;
}

- (void)beginTransitionToState:(int64_t)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if ([(SBUIPasscodeLockViewBase *)self isTransitioning])
  {
    double v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"SBUIPasscodeLockViewBase.m" lineNumber:582 description:@"We cannot begin a passcode transition while we already have one in progress."];
  }
  long long v6 = SBLogCommon();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    long long v7 = @"SBUIPasscodeLockViewStateBiometric";
    if (a3 == 1) {
      long long v7 = @"SBUIPasscodeLockViewStatePasscode";
    }
    long long v8 = v7;
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v8;
    _os_log_impl(&dword_1A7607000, v6, OS_LOG_TYPE_DEFAULT, "Passcode lock view beginning transition to state: %@", (uint8_t *)&buf, 0xCu);
  }
  int64_t passcodeLockViewState = self->_passcodeLockViewState;
  *(void *)&long long buf = passcodeLockViewState;
  *((void *)&buf + 1) = a3;
  uint64_t v14 = 0;
  [(SBUIPasscodeLockViewBase *)self setTransitionContext:&buf];
  [(SBUIPasscodeLockViewBase *)self setIsTransitioning:1];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __51__SBUIPasscodeLockViewBase_beginTransitionToState___block_invoke;
  v12[3] = &unk_1E5CCC580;
  v12[4] = self;
  [MEMORY[0x1E4F42FF0] performWithoutAnimation:v12];
  if (!a3 && passcodeLockViewState == 1)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __51__SBUIPasscodeLockViewBase_beginTransitionToState___block_invoke_2;
    v11[3] = &unk_1E5CCC580;
    v11[4] = self;
    [MEMORY[0x1E4F42FF0] animateWithDuration:4 delay:v11 usingSpringWithDamping:0 initialSpringVelocity:0.57 options:0.0 animations:0.97 completion:0.0];
    [(SBUIPasscodeLockViewBase *)self updateForTransitionToPasscodeView:0 animated:1];
  }
}

uint64_t __51__SBUIPasscodeLockViewBase_beginTransitionToState___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) layoutIfNeeded];
  [*(id *)(*(void *)(a1 + 32) + 520) setAlpha:1.0];
  v2 = *(void **)(*(void *)(a1 + 32) + 528);
  return [v2 setAlpha:1.0];
}

uint64_t __51__SBUIPasscodeLockViewBase_beginTransitionToState___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 520) setAlpha:0.0];
}

- (void)updateTransitionWithProgress:(double)a3
{
  long long v7 = 0uLL;
  double v8 = 0.0;
  [(SBUIPasscodeLockViewBase *)self transitionContext];
  double v8 = a3;
  long long v5 = v7;
  double v6 = a3;
  [(SBUIPasscodeLockViewBase *)self setTransitionContext:&v5];
  [(SBUIPasscodeLockViewBase *)self _updateBiometricAlpha];
}

- (void)willEndTransitionToState:(int64_t)a3
{
  long long v7 = 0uLL;
  uint64_t v8 = 0;
  [(SBUIPasscodeLockViewBase *)self transitionContext];
  *((void *)&v7 + 1) = a3;
  long long v5 = v7;
  uint64_t v6 = v8;
  [(SBUIPasscodeLockViewBase *)self setTransitionContext:&v5];
}

- (void)didEndTransitionToState:(int64_t)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  long long v5 = SBLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = @"SBUIPasscodeLockViewStateBiometric";
    if (a3 == 1) {
      uint64_t v6 = @"SBUIPasscodeLockViewStatePasscode";
    }
    long long v7 = v6;
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v7;
    _os_log_impl(&dword_1A7607000, v5, OS_LOG_TYPE_DEFAULT, "Passcode lock view did end transition to state: %@", (uint8_t *)&buf, 0xCu);
  }
  long long buf = 0uLL;
  uint64_t v10 = 0;
  [(SBUIPasscodeLockViewBase *)self transitionContext];
  if (a3 == 1 && (void)buf == 1)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __52__SBUIPasscodeLockViewBase_didEndTransitionToState___block_invoke;
    v8[3] = &unk_1E5CCC580;
    v8[4] = self;
    [MEMORY[0x1E4F42FF0] performWithoutAnimation:v8];
    [(SBUIPasscodeLockViewBase *)self updateForTransitionToPasscodeView:1 animated:1];
  }
  [(SBUIPasscodeLockViewBase *)self setIsTransitioning:0];
  [(SBUIPasscodeLockViewBase *)self _setPasscodeLockViewState:a3 animated:0];
}

uint64_t __52__SBUIPasscodeLockViewBase_didEndTransitionToState___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) layoutIfNeeded];
  v2 = *(void **)(*(void *)(a1 + 32) + 520);
  return [v2 setAlpha:1.0];
}

- (void)_updateBiometricAlpha
{
  [(SBUIPasscodeLockViewBase *)self _biometricViewAlphaFromPasscodeLockViewState:self->_passcodeLockViewState];
  double v4 = v3;
  if ([(SBUIPasscodeLockViewBase *)self isTransitioning])
  {
    [(SBUIPasscodeLockViewBase *)self transitionContext];
    [(SBUIPasscodeLockViewBase *)self _biometricViewAlphaFromPasscodeLockViewState:0];
    double v6 = v5;
    [(SBUIPasscodeLockViewBase *)self _biometricViewAlphaFromPasscodeLockViewState:0];
    double v4 = v6 + 0.0 * (v7 - v6);
  }
  uint64_t v8 = [(SBUIPasscodeLockViewBase *)self biometricAuthenticationView];
  [v8 setAlpha:v4];
}

- (double)_biometricViewAlphaFromPasscodeLockViewState:(int64_t)a3
{
  double result = 0.0;
  if (!a3) {
    return 1.0;
  }
  return result;
}

- (void)setAllowsAutomaticBiometricPresentationTransition:(BOOL)a3
{
  if (self->_allowsAutomaticBiometricPresentationTransition != a3)
  {
    self->_allowsAutomaticBiometricPresentationTransition = a3;
    if (!self->_passcodeLockViewState)
    {
      if (a3)
      {
        [(SBUIPasscodeLockViewBase *)self _armAdvanceToPasscodeTimer];
        self->_proudLockConfiguration.substate = 2;
        [(SBUIPasscodeLockViewBase *)self _applyProudLockContainerViewControllerConfiguration];
      }
      else
      {
        [(SBUIPasscodeLockViewBase *)self _disarmAdvanceToPasscodeTimer];
      }
    }
  }
}

- (void)_armAdvanceToPasscodeTimer
{
  double v3 = SBLogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v4 = 0;
    _os_log_impl(&dword_1A7607000, v3, OS_LOG_TYPE_DEFAULT, "Passcode lock view armed advance to passcode timer", v4, 2u);
  }

  [(SBUIPasscodeLockViewBase *)self _disarmAdvanceToPasscodeTimer];
  [(SBUIPasscodeLockViewBase *)self performSelector:sel__advanceToPasscodeTimerFired withObject:0 afterDelay:2.0];
}

- (void)_disarmAdvanceToPasscodeTimer
{
}

- (void)_advanceToPasscodeTimerFired
{
  v9[1] = *MEMORY[0x1E4F143B8];
  double v3 = [(SBUIPasscodeLockViewBase *)self unlockDestination];

  if (!v3)
  {
    double v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v8 = @"SBUIPasscodeLockViewBiometricTransitionToPasscodeReasonKey";
    v9[0] = @"SBUIPasscodeLockViewBiometricTransitionToPasscodeReasonTimerExpired";
    double v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
    [v4 postNotificationName:@"SBUIPasscodeLockViewBiometricTransitionToPasscode" object:self userInfo:v5];
  }
  [(SBUIPasscodeLockViewBase *)self _advanceToPasscodeForMatchFailure:0];
  double v6 = SBLogCommon();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v7 = 0;
    _os_log_impl(&dword_1A7607000, v6, OS_LOG_TYPE_DEFAULT, "Passcode lock view advance to passcode timer fired.", v7, 2u);
  }
}

- (void)_advanceToPasscodeForMatchFailure:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  double v5 = SBLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    double v6 = NSStringFromBOOL();
    int v8 = 138412290;
    long long v9 = v6;
    _os_log_impl(&dword_1A7607000, v5, OS_LOG_TYPE_DEFAULT, "Passcode lock view advanced to passcode for match failure: %@", (uint8_t *)&v8, 0xCu);
  }
  [(SBUIPasscodeLockViewBase *)self _disarmAdvanceToPasscodeTimer];
  if (v3)
  {
    [(SBUIPasscodeLockViewBase *)self _setStatusStateSwipeToRetryAnimated:0];
    [(SBUIPasscodeLockViewBase *)self _setSuppressTitleText:0 animated:0];
    [(SBUIPasscodeLockViewBase *)self layoutIfNeeded];
  }
  if (![(SBUIPasscodeLockViewBase *)self confirmedNotInPocket]
    && (self->_shouldConsiderTapGuard ? (BOOL v7 = !v3) : (BOOL v7 = 0), v7)
    || self->_alwaysShowPasscodeButtonForFaceIDMatchFailure)
  {
    [(SBUIPasscodeBiometricAuthenticationView *)self->_biometricAuthenticationView setAncillaryButtonsVisible:1];
    [(SBUIPasscodeBiometricAuthenticationView *)self->_biometricAuthenticationView setFaceIDUsePasscodeButtonVisible:1];
  }
  else
  {
    [(SBUIPasscodeBiometricAuthenticationView *)self->_biometricAuthenticationView setAncillaryButtonsVisible:0];
    [(SBUIPasscodeBiometricAuthenticationView *)self->_biometricAuthenticationView setFaceIDUsePasscodeButtonVisible:0];
    [(SBUIPasscodeLockViewBase *)self _setPasscodeLockViewState:1 animated:1];
  }
  self->_proudLockConfiguration.substate = 3;
  [(SBUIPasscodeLockViewBase *)self _applyProudLockContainerViewControllerConfiguration];
  self->_shouldConsiderTapGuard = 0;
}

- (void)updateForTransitionToPasscodeView:(BOOL)a3 animated:(BOOL)a4
{
  double v5 = [(SBUIPasscodeLockViewBase *)self window];
  BOOL v6 = v5 != 0;

  [(SBUIPasscodeLockViewBase *)self _overrideBiometricMatchingEnabled:v6 forReason:@"PasscodeLockViewTransitionToPasscode"];
  [(SBUIPasscodeLockViewBase *)self becomeFirstResponder];
  [(SBUIPasscodeLockViewBase *)self _overrideBiometricMatchingEnabled:0 forReason:@"PasscodeLockViewTransitionToPasscode"];
}

- (void)willMoveToSuperview:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SBUIPasscodeLockViewBase;
  -[SBUIPasscodeLockViewBase willMoveToSuperview:](&v6, sel_willMoveToSuperview_);
  if (a3)
  {
    BOOL v5 = [(SBUIPasscodeLockViewBase *)self _proudLockShowingBiometricStates];
    if ([(SBUIBiometricResource *)self->_biometricResource hasPearlSupport]
      && [(SBUIBiometricResource *)self->_biometricResource hasBiometricAuthenticationCapabilityEnabled]&& (v5 & [(SBUIBiometricResource *)self->_biometricResource isMatchingEnabled]) == 1)
    {
      [(SBUIPasscodeLockViewBase *)self _setSuppressTitleText:1 animated:0];
    }
    [(SBUIPasscodeLockViewBase *)self updateStatusTextAnimated:0];
  }
}

- (void)dealloc
{
  [(SBUIBiometricResource *)self->_biometricResource removeObserver:self];
  [(SBUIPasscodeLockViewBase *)self _clearBrightnessChangeTimer];
  [(SBUIPasscodeLockViewBase *)self _setBiometricMatchingState:0];
  BOOL v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  [(SBFLegibilitySettingsProvider *)self->_backgroundLegibilitySettingsProvider setDelegate:0];
  if ([(_UIKBFeedbackGenerating *)self->_keyboardFeedbackBehavior isActive]) {
    [(_UIKBFeedbackGenerating *)self->_keyboardFeedbackBehavior deactivate];
  }
  [(SBUIPasscodeLockViewBase *)self setOverrideProudLockContainerViewController:0];
  double v4 = +[SBUIPhoneUnlockWithWatchController sharedInstance];
  [v4 removeObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)SBUIPasscodeLockViewBase;
  [(SBUIPasscodeLockViewBase *)&v5 dealloc];
}

- (void)resetForFailedPasscode
{
}

- (void)resetForScreenOff
{
  if ([(SBUIPasscodeLockViewBase *)self _statusState] == 8)
  {
    [(SBUIPasscodeLockViewBase *)self _setStatusState:0];
  }
}

- (void)resetForSuccess
{
  [(SBUIPasscodeLockViewBase *)self reset];
  BOOL v3 = [(SBUIPasscodeLockViewBase *)self _proudLockContainerViewControllerToUpdate];
  [v3 setAuthenticated:1];

  poseidonContainerViewController = self->_poseidonContainerViewController;
  [(SBUIPoseidonContainerViewController *)poseidonContainerViewController showCoaching:0];
}

- (void)reset
{
}

- (void)setAllowsStatusTextUpdatingOnResignFirstResponder:(BOOL)a3
{
  self->_allowsStatusTextUpdatingOnResignFirstResponder = a3;
}

- (NSString)passcode
{
  return 0;
}

- (void)setBiometricResource:(id)a3
{
  objc_super v5 = (SBUIBiometricResource *)a3;
  p_biometricResource = &self->_biometricResource;
  biometricResource = self->_biometricResource;
  int v8 = v5;
  if (biometricResource != v5)
  {
    [(SBUIBiometricResource *)biometricResource removeObserver:self];
    objc_storeStrong((id *)&self->_biometricResource, a3);
    [(SBUIBiometricResource *)*p_biometricResource addObserver:self];
    if (*p_biometricResource)
    {
      [(SBUIPasscodeLockViewBase *)self _updateStatusStateForLockoutIfNecessaryAnimatedly:0];
      [(SBUIPasscodeLockViewBase *)self _updateBiometricLayout];
    }
  }
}

- (BOOL)playsKeypadSounds
{
  return self->_playsKeypadSounds;
}

- (void)setPlaysKeypadSounds:(BOOL)a3
{
  if (self->_playsKeypadSounds != a3)
  {
    self->_playsKeypadSounds = a3;
    if (a3) {
      [(_UIKBFeedbackGenerating *)self->_keyboardFeedbackBehavior activateWithCompletionBlock:0];
    }
  }
}

- (void)setScreenOn:(BOOL)a3
{
  if (self->_screenOn != a3)
  {
    self->_screenOn = a3;
    if (!a3)
    {
      [(SBUIPasscodeLockViewBase *)self resetForScreenOff];
      if ([(_UIKBFeedbackGenerating *)self->_keyboardFeedbackBehavior isActive])
      {
        keyboardFeedbackBehavior = self->_keyboardFeedbackBehavior;
        [(_UIKBFeedbackGenerating *)keyboardFeedbackBehavior deactivate];
      }
    }
  }
}

- (void)setBackgroundAlpha:(double)a3
{
  if (self->_backgroundAlpha != a3)
  {
    self->_backgroundAlpha = a3;
    id v5 = [(SBUIPasscodeLockViewBase *)self customBackgroundColor];
    double v4 = [v5 colorWithAlphaComponent:self->_backgroundAlpha];
    [(SBUIPasscodeLockViewBase *)self setBackgroundColor:v4];
  }
}

- (void)setBackgroundLegibilitySettingsProvider:(id)a3
{
  id v5 = (SBFLegibilitySettingsProvider *)a3;
  p_backgroundLegibilitySettingsProvider = &self->_backgroundLegibilitySettingsProvider;
  backgroundLegibilitySettingsProvider = self->_backgroundLegibilitySettingsProvider;
  if (backgroundLegibilitySettingsProvider != v5)
  {
    int v8 = v5;
    [(SBFLegibilitySettingsProvider *)backgroundLegibilitySettingsProvider setDelegate:0];
    objc_storeStrong((id *)&self->_backgroundLegibilitySettingsProvider, a3);
    [(SBFLegibilitySettingsProvider *)*p_backgroundLegibilitySettingsProvider setDelegate:self];
    backgroundLegibilitySettingsProvider = (SBFLegibilitySettingsProvider *)[(SBUIPasscodeLockViewBase *)self providerLegibilitySettingsChanged:*p_backgroundLegibilitySettingsProvider];
    id v5 = v8;
  }
  MEMORY[0x1F41817F8](backgroundLegibilitySettingsProvider, v5);
}

- (void)resetForFailedMesaAttemptWithStatusText:(id)a3 andSubtitle:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(SBUIPasscodeLockViewBase *)self _resetForFailedBiometricAttempt];
  [(SBUIPasscodeLockViewBase *)self updateStatusText:v7 subtitle:v6 animated:1];
}

- (void)autofillForSuccessfulMesaAttemptWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(SBUIPasscodeLockViewBase *)self _entryField];
  [v5 _autofillForBiometricAuthenticationWithCompletion:v4];
}

- (void)setBiometricAuthenticationAllowed:(BOOL)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (self->_isBiometricAuthenticationAllowed != a3)
  {
    [(SBUIPasscodeLockViewBase *)self updateStatusTextAnimated:1];
    self->_isBiometricAuthenticationAllowed = a3;
    if (!a3 && self->_pendingBioUnlock)
    {
      id v5 = SBLogCommon();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        int v6 = 134217984;
        id v7 = self;
        _os_log_impl(&dword_1A7607000, v5, OS_LOG_TYPE_INFO, "Disabling matching for passcode lock view (%p) but there is a pending bio unlock", (uint8_t *)&v6, 0xCu);
      }

      self->_pendingBioUnlock = 0;
    }
    [(SBUIPasscodeLockViewBase *)self _evaluateBiometricMatchingState];
  }
}

- (void)_evaluateBiometricMatchingState
{
  uint64_t v3 = [(NSMutableSet *)self->_biometricMatchingEnabledOverrideReasons count];
  id v4 = [(SBUIPasscodeLockViewBase *)self window];

  if (v4 || v3)
  {
    if (self->_isBiometricAuthenticationAllowed)
    {
      BOOL v6 = [(SBUIPasscodeLockViewBase *)self _canRecognizeBiometricAuthentication];
      if (v3) {
        uint64_t v5 = 1;
      }
      else {
        uint64_t v5 = v6;
      }
    }
    else
    {
      uint64_t v5 = 2;
    }
  }
  else
  {
    uint64_t v5 = 0;
  }
  [(SBUIPasscodeLockViewBase *)self _setBiometricMatchingState:v5];
}

- (void)_setBiometricMatchingState:(unint64_t)a3
{
  if (self->_biometricMatchingState == a3) {
    return;
  }
  self->_unint64_t biometricMatchingState = a3;
  id v4 = NSString;
  uint64_t v5 = (objc_class *)objc_opt_class();
  BOOL v6 = NSStringFromClass(v5);
  id v12 = [v4 stringWithFormat:@"PasscodeUI-<%@:%p>", v6, self];

  id v7 = self->_biometricMatchingAssertion;
  unint64_t biometricMatchingState = self->_biometricMatchingState;
  switch(biometricMatchingState)
  {
    case 0uLL:
      uint64_t v10 = 0;
LABEL_9:
      biometricMatchingAssertion = self->_biometricMatchingAssertion;
      self->_biometricMatchingAssertion = v10;

      break;
    case 2uLL:
      uint64_t v9 = 0;
      goto LABEL_8;
    case 1uLL:
      [(SBUIPasscodeLockViewBase *)self _updateStatusStateForLockoutIfNecessaryAnimatedly:0];
      uint64_t v9 = 3;
LABEL_8:
      uint64_t v10 = [(SBUIBiometricResource *)self->_biometricResource acquireMatchingAssertionWithMode:v9 reason:v12];
      goto LABEL_9;
  }
  [(BSInvalidatable *)v7 invalidate];
}

- (void)_overrideBiometricMatchingEnabled:(BOOL)a3 forReason:(id)a4
{
  BOOL v4 = a3;
  id v7 = a4;
  id v13 = v7;
  if (!v7)
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"SBUIPasscodeLockViewBase.m", 934, @"Invalid parameter not satisfying: %@", @"reason" object file lineNumber description];

    id v7 = 0;
  }
  biometricMatchingEnabledOverrideReasons = self->_biometricMatchingEnabledOverrideReasons;
  if (v4)
  {
    if (!biometricMatchingEnabledOverrideReasons)
    {
      uint64_t v9 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
      uint64_t v10 = self->_biometricMatchingEnabledOverrideReasons;
      self->_biometricMatchingEnabledOverrideReasons = v9;

      id v7 = v13;
      biometricMatchingEnabledOverrideReasons = self->_biometricMatchingEnabledOverrideReasons;
    }
    [(NSMutableSet *)biometricMatchingEnabledOverrideReasons addObject:v7];
  }
  else
  {
    [(NSMutableSet *)biometricMatchingEnabledOverrideReasons removeObject:v7];
    if ([(NSMutableSet *)self->_biometricMatchingEnabledOverrideReasons count]) {
      goto LABEL_10;
    }
    uint64_t v11 = self->_biometricMatchingEnabledOverrideReasons;
    self->_biometricMatchingEnabledOverrideReasons = 0;
  }
  [(SBUIPasscodeLockViewBase *)self _evaluateBiometricMatchingState];
LABEL_10:
}

- (void)_resumeBiometricMatchingAdvisory:(BOOL)a3
{
}

- (BOOL)canBecomeFirstResponder
{
  return [(SBUIPasscodeEntryField *)self->_entryField canBecomeFirstResponder];
}

- (BOOL)becomeFirstResponder
{
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  [(SBUIPasscodeLockViewBase *)self transitionContext];
  [(SBUIPasscodeLockViewBase *)self isTransitioning];
  if (self->_passcodeLockViewState == 1)
  {
    unsigned __int8 v3 = [(SBUIPasscodeEntryField *)self->_entryField becomeFirstResponder];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)SBUIPasscodeLockViewBase;
    unsigned __int8 v3 = [(SBUIPasscodeLockViewBase *)&v6 becomeFirstResponder];
  }
  BOOL v4 = v3;
  [(SBUIPasscodeLockViewBase *)self _evaluateBiometricMatchingState];
  if (self->_isBiometricAuthenticationAllowed && self->_pendingBioUnlock)
  {
    self->_pendingBioUnlock = 0;
    [(SBUIPasscodeLockViewBase *)self _handleBiometricAuthentication];
  }
  return v4;
}

- (BOOL)resignFirstResponder
{
  if ([(SBUIPasscodeEntryField *)self->_entryField isFirstResponder])
  {
    if (![(SBUIPasscodeEntryField *)self->_entryField resignFirstResponder])
    {
      LOBYTE(v3) = 0;
      return v3;
    }
  }
  else
  {
    unsigned int v3 = [(SBUIPasscodeLockViewBase *)self isFirstResponder];
    if (!v3) {
      return v3;
    }
    v5.receiver = self;
    v5.super_class = (Class)SBUIPasscodeLockViewBase;
    unsigned int v3 = [(SBUIPasscodeLockViewBase *)&v5 resignFirstResponder];
    if (!v3) {
      return v3;
    }
  }
  [(SBUIPasscodeLockViewBase *)self reset];
  [(SBUIPasscodeLockViewBase *)self _evaluateBiometricMatchingState];
  if (self->_isBiometricAuthenticationAllowed && self->_allowsStatusTextUpdatingOnResignFirstResponder) {
    [(SBUIPasscodeLockViewBase *)self _resetStatusText];
  }
  LOBYTE(v3) = 1;
  return v3;
}

- (BOOL)canResignFirstResponder
{
  return [(SBUIPasscodeEntryField *)self->_entryField canResignFirstResponder];
}

- (BOOL)_canRecognizeBiometricAuthentication
{
  if ([(SBUIPasscodeLockViewBase *)self isFirstResponder]) {
    return 1;
  }
  entryField = self->_entryField;
  return [(SBUIPasscodeEntryField *)entryField isFirstResponder];
}

- (void)willMoveToWindow:(id)a3
{
  if (a3) {
    [(SBUIPasscodeLockViewBase *)self _luminanceBoostDidChange];
  }
}

- (void)didMoveToWindow
{
  v6.receiver = self;
  v6.super_class = (Class)SBUIPasscodeLockViewBase;
  [(SBUIPasscodeLockViewBase *)&v6 didMoveToWindow];
  [(SBUIPasscodeLockViewBase *)self _evaluateBiometricMatchingState];
  unsigned int v3 = [(SBUIPasscodeLockViewBase *)self window];

  if (!v3)
  {
    if ([(SBUIPasscodeLockViewBase *)self isFirstResponder]) {
      [(SBUIPasscodeLockViewBase *)self resignFirstResponder];
    }
    if (self->_isBiometricAuthenticationAllowed && self->_allowsStatusTextUpdatingOnResignFirstResponder) {
      [(SBUIPasscodeLockViewBase *)self _resetStatusText];
    }
    if (self->_pendingBioUnlock)
    {
      BOOL v4 = SBLogCommon();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)objc_super v5 = 0;
        _os_log_impl(&dword_1A7607000, v4, OS_LOG_TYPE_INFO, "Passcode lock view has been removed from the view hierarchy but has a pending bio unlock", v5, 2u);
      }

      self->_pendingBioUnlock = 0;
    }
  }
}

- (void)updateStatusText:(id)a3 subtitle:(id)a4 animated:(BOOL)a5
{
}

- (int64_t)_orientation
{
  return [(id)*MEMORY[0x1E4F43630] activeInterfaceOrientation];
}

- (BOOL)_isBoundsPortraitOriented
{
  [(SBUIPasscodeLockViewBase *)self bounds];
  CGFloat x = v11.origin.x;
  CGFloat y = v11.origin.y;
  CGFloat width = v11.size.width;
  CGFloat height = v11.size.height;
  CGFloat v6 = CGRectGetWidth(v11);
  v12.origin.CGFloat x = x;
  v12.origin.CGFloat y = y;
  v12.size.CGFloat width = width;
  v12.size.CGFloat height = height;
  v7.n128_u64[0] = CGRectGetHeight(v12);
  v8.n128_f64[0] = v6;
  return MEMORY[0x1F410C358](v8, v7);
}

- (void)_setLegibilitySettings:(id)a3
{
  objc_super v5 = (_UILegibilitySettings *)a3;
  p_legibilitySettings = &self->_legibilitySettings;
  if (self->_legibilitySettings != v5)
  {
    __n128 v8 = v5;
    objc_storeStrong((id *)&self->_legibilitySettings, a3);
    __n128 v7 = [(SBUIPasscodeLockViewBase *)self _proudLockContainerViewControllerToUpdate];
    [v7 setLegibilitySettings:*p_legibilitySettings];

    [(SBUIProudLockContainerViewController *)self->_proudLockContainerViewController setLegibilitySettings:*p_legibilitySettings];
    [(SBUIPasscodeLockViewBase *)self _evaluateLuminance];
    objc_super v5 = v8;
  }
}

- (void)_setLuminosityBoost:(double)a3
{
  if (self->_luminanceBoost != a3)
  {
    self->_luminanceBoost = a3;
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __48__SBUIPasscodeLockViewBase__setLuminosityBoost___block_invoke;
    v3[3] = &unk_1E5CCC580;
    v3[4] = self;
    [MEMORY[0x1E4F42FF0] animateWithDuration:v3 animations:0.2];
  }
}

uint64_t __48__SBUIPasscodeLockViewBase__setLuminosityBoost___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _luminanceBoostDidChange];
}

- (void)_luminanceBoostDidChange
{
  [(SBUIPasscodeLockViewBase *)self _luminosityBoost];
  double v4 = fmin(fmax(v3 + 0.15, 0.07), 0.8);
  entryField = self->_entryField;
  [(SBUIPasscodeEntryField *)entryField _setLuminosityBoost:v4];
}

- (void)_sendDelegateKeypadKeyDown
{
  uint64_t v3 = [(SBUIPasscodeLockViewBase *)self delegate];
  if (v3)
  {
    double v4 = (void *)v3;
    if (objc_opt_respondsToSelector()) {
      [v4 passcodeLockViewKeypadKeyDown:self];
    }
  }
  MEMORY[0x1F4181820]();
}

- (void)_sendDelegateKeypadKeyUp
{
  uint64_t v3 = [(SBUIPasscodeLockViewBase *)self delegate];
  if (v3)
  {
    double v4 = (void *)v3;
    if (objc_opt_respondsToSelector()) {
      [v4 passcodeLockViewKeypadKeyUp:self];
    }
  }
  MEMORY[0x1F4181820]();
}

- (void)_updateStatusStateForLockoutIfNecessaryAnimatedly:(BOOL)a3
{
  if (self->_isBiometricAuthenticationAllowed)
  {
    BOOL v3 = a3;
    if (![(SBUIPasscodeLockViewBase *)self _statusState])
    {
      unint64_t v5 = [(SBUIBiometricResource *)self->_biometricResource biometricLockoutState];
      if ([(SBUIBiometricResource *)self->_biometricResource hasBiometricAuthenticationCapabilityEnabled])
      {
        if ([(SBUIBiometricResource *)self->_biometricResource isMatchingEnabled] && v5 != 0)
        {
          unint64_t v7 = [(SBUIPasscodeLockViewBase *)self _statusStateForLockoutState:v5];
          [(SBUIPasscodeLockViewBase *)self _setStatusState:v7 animated:v3];
        }
      }
    }
  }
}

- (double)_numberPadOffsetFromTopOfScreen:(id)a3
{
  id v5 = a3;
  BOOL v6 = [(SBUIPasscodeLockViewBase *)self _isBoundsPortraitOriented];
  unint64_t v7 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v8 = [v7 userInterfaceIdiom];

  unint64_t v9 = v8 & 0xFFFFFFFFFFFFFFFBLL;
  int v10 = __sb__runningInSpringBoard();
  char v11 = v10;
  if (v10)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      BOOL v12 = 0;
      goto LABEL_14;
    }
  }
  else
  {
    uint64_t v8 = [MEMORY[0x1E4F42948] currentDevice];
    if ([(id)v8 userInterfaceIdiom])
    {
      BOOL v12 = 0;
LABEL_13:

      goto LABEL_14;
    }
  }
  int v13 = __sb__runningInSpringBoard();
  char v14 = v13;
  if (v13)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    BOOL v3 = [MEMORY[0x1E4F42D90] mainScreen];
    [v3 _referenceBounds];
  }
  BSSizeRoundForScale();
  BOOL v12 = v15 >= *(double *)(MEMORY[0x1E4FA6E50] + 40);
  if ((v14 & 1) == 0) {

  }
  if ((v11 & 1) == 0) {
    goto LABEL_13;
  }
LABEL_14:
  if (v9 == 1 || !v6 || v12)
  {
    char v20 = v9 == 1 || v6;
    if (v20)
    {
      [MEMORY[0x1E4FA5F68] pinNumberPadBaseOffsetFromTopOfScreen:v6];
      double v22 = v21;
    }
    else
    {
      [MEMORY[0x1E4FA5F68] pinNumberPadButtonOuterCircleDiameter:0];
      double v24 = v23 * 4.0;
      [MEMORY[0x1E4FA5F68] pinNumberPadButtonPaddingHeight:0];
      double v26 = v24 + v25 * 6.0;
      [(SBUIPasscodeLockViewBase *)self bounds];
      double v22 = (v27 - v26) * 0.75;
    }
    [v5 _distanceToTopOfFirstButton];
    double v19 = v22 - v28;
  }
  else
  {
    [(SBUIPasscodeLockViewBase *)self bounds];
    double v17 = v16;
    [v5 bounds];
    double v19 = v17 - v18;
  }

  return v19;
}

- (void)_setStatusText:(id)a3
{
  id v4 = a3;
  statusText = self->_statusText;
  id v9 = v4;
  if (!statusText || (uint64_t v6 = [(NSString *)statusText isEqualToString:v4], v4 = v9, (v6 & 1) == 0))
  {
    unint64_t v7 = (NSString *)[v4 copy];
    uint64_t v8 = self->_statusText;
    self->_statusText = v7;

    uint64_t v6 = [(SBUIPasscodeLockViewBase *)self setNeedsStatusTextUpdate];
    id v4 = v9;
  }
  MEMORY[0x1F41817F8](v6, v4);
}

- (void)setNeedsStatusTextUpdate
{
  self->_needStatusTextUpdate = 1;
}

- (void)_setStatusSubtitleText:(id)a3
{
  id v4 = a3;
  statusSubtitleText = self->_statusSubtitleText;
  id v9 = v4;
  if (!statusSubtitleText
    || (uint64_t v6 = [(NSString *)statusSubtitleText isEqualToString:v4], v4 = v9, (v6 & 1) == 0))
  {
    unint64_t v7 = (NSString *)[v4 copy];
    uint64_t v8 = self->_statusSubtitleText;
    self->_statusSubtitleText = v7;

    uint64_t v6 = [(SBUIPasscodeLockViewBase *)self setNeedsStatusTextUpdate];
    id v4 = v9;
  }
  MEMORY[0x1F41817F8](v6, v4);
}

- (void)_setSuppressTitleText:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_suppressTitleText != a3)
  {
    self->_suppressTitleText = a3;
    [(SBUIPasscodeLockViewBase *)self updateStatusTextAnimated:a4];
  }
}

- (void)updateStatusTextAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  unint64_t v5 = [(SBUIPasscodeLockViewBase *)self _statusState];
  uint64_t v6 = [(SBUIPasscodeLockViewBase *)self _orientation];
  switch(v5)
  {
    case 1uLL:
      unint64_t v7 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      uint64_t v8 = [v7 localizedStringForKey:@"PASSCODE_ENTRY_PROMPT" value:&stru_1EFCB7578 table:@"SpringBoardUIServices"];

      if ([(SBUIBiometricResource *)self->_biometricResource hasPearlSupport]) {
        id v9 = @"FACE_ID_NEEDS_PASSCODE_REBOOT";
      }
      else {
        id v9 = @"MESA_NEEDS_PASSCODE_REBOOT";
      }
      int v10 = [MEMORY[0x1E4F42948] modelSpecificLocalizedStringKeyForKey:v9];
      char v11 = _SBUIAXAwareLocalizedStringForKey(v10, v6);
      BOOL v12 = SBLogCommon();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_31;
      }
      *(_WORD *)long long buf = 0;
      int v13 = "Passcode view status: Face ID or Mesa needs passcode after reboot";
      goto LABEL_30;
    case 2uLL:
      char v14 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      uint64_t v8 = [v14 localizedStringForKey:@"PASSCODE_ENTRY_PROMPT" value:&stru_1EFCB7578 table:@"SpringBoardUIServices"];

      char v11 = _SBUIPasscodeLocalizeStringForMesaOrPearlKey(@"MESA_NEEDS_PASSCODE_BIO_LOCKOUT", @"FACE_ID_NEEDS_PASSCODE_BIO_LOCKOUT", self->_biometricResource, v6);
      int v10 = SBLogCommon();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_80;
      }
      *(_WORD *)long long buf = 0;
      double v15 = "Passcode view status: Face ID or Mesa needs passcode bio lockout";
      goto LABEL_79;
    case 3uLL:
      double v16 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      uint64_t v8 = [v16 localizedStringForKey:@"PASSCODE_ENTRY_PROMPT" value:&stru_1EFCB7578 table:@"SpringBoardUIServices"];

      char v11 = _SBUIPasscodeLocalizeStringForMesaOrPearlKey(@"MESA_NEEDS_PASSCODE", @"FACE_ID_NEEDS_PASSCODE", self->_biometricResource, v6);
      int v10 = SBLogCommon();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_80;
      }
      *(_WORD *)long long buf = 0;
      double v15 = "Passcode view status: Face ID or Mesa needs passcode for bio expiraion";
      goto LABEL_79;
    case 4uLL:
      double v17 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      uint64_t v8 = [v17 localizedStringForKey:@"PASSCODE_ENTRY_PROMPT" value:&stru_1EFCB7578 table:@"SpringBoardUIServices"];

      char v11 = _SBUIPasscodeLocalizeStringForMesaOrPearlKey(@"MESA_NEEDS_PASSCODE", @"FACE_ID_NEEDS_PASSCODE", self->_biometricResource, v6);
      int v10 = SBLogCommon();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_80;
      }
      *(_WORD *)long long buf = 0;
      double v15 = "Passcode view status: Face ID or Mesa needs passcode for bio enabling";
      goto LABEL_79;
    case 5uLL:
      double v18 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      uint64_t v8 = [v18 localizedStringForKey:@"PASSCODE_ENTRY_PROMPT" value:&stru_1EFCB7578 table:@"SpringBoardUIServices"];

      if ([(SBUIBiometricResource *)self->_biometricResource hasPearlSupport]) {
        double v19 = @"FACE_ID_NEEDS_PASSCODE_FOR_SOFTWARE_UPDATE";
      }
      else {
        double v19 = @"MESA_NEEDS_PASSCODE_FOR_SOFTWARE_UPDATE";
      }
      int v10 = [MEMORY[0x1E4F42948] modelSpecificLocalizedStringKeyForKey:v19];
      char v11 = _SBUIAXAwareLocalizedStringForKey(v10, v6);
      BOOL v12 = SBLogCommon();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_31;
      }
      *(_WORD *)long long buf = 0;
      int v13 = "Passcode view status: Face ID or Mesa needs passcode for software update";
      goto LABEL_30;
    case 6uLL:
      char v20 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      uint64_t v8 = [v20 localizedStringForKey:@"PASSCODE_ENTRY_PROMPT" value:&stru_1EFCB7578 table:@"SpringBoardUIServices"];

      if ([(SBUIBiometricResource *)self->_biometricResource hasPearlSupport]) {
        double v21 = @"FACE_ID_NEEDS_PASSCODE_FOR_ESCROW_UPDATE";
      }
      else {
        double v21 = @"MESA_NEEDS_PASSCODE_FOR_ESCROW_UPDATE";
      }
      int v10 = [MEMORY[0x1E4F42948] modelSpecificLocalizedStringKeyForKey:v21];
      char v11 = _SBUIAXAwareLocalizedStringForKey(v10, v6);
      BOOL v12 = SBLogCommon();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_31;
      }
      *(_WORD *)long long buf = 0;
      int v13 = "Passcode view status: Face ID or Mesa needs passcode for escrow update";
      goto LABEL_30;
    case 7uLL:
      double v22 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      uint64_t v8 = [v22 localizedStringForKey:@"PASSCODE_ENTRY_PROMPT" value:&stru_1EFCB7578 table:@"SpringBoardUIServices"];

      if ([(SBUIBiometricResource *)self->_biometricResource hasPearlSupport]) {
        double v23 = @"FACE_ID_NEEDS_PASSCODE_BIO_DROPPED";
      }
      else {
        double v23 = @"MESA_NEEDS_PASSCODE_BIO_DROPPED";
      }
      int v10 = [MEMORY[0x1E4F42948] modelSpecificLocalizedStringKeyForKey:v23];
      char v11 = _SBUIAXAwareLocalizedStringForKey(v10, v6);
      BOOL v12 = SBLogCommon();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_31;
      }
      *(_WORD *)long long buf = 0;
      int v13 = "Passcode view status: Face ID or Mesa needs passcode due to token drop";
LABEL_30:
      _os_log_impl(&dword_1A7607000, v12, OS_LOG_TYPE_DEFAULT, v13, buf, 2u);
LABEL_31:

      goto LABEL_80;
    case 8uLL:
      double v24 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      uint64_t v8 = [v24 localizedStringForKey:@"PASSCODE_ENTRY_PROMPT_RETRY" value:&stru_1EFCB7578 table:@"SpringBoardUIServices"];

      int v10 = SBLogCommon();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_39;
      }
      *(_WORD *)long long buf = 0;
      double v25 = "Passcode view status: Passcode entry prompt to retry";
      goto LABEL_38;
    case 9uLL:
      double v26 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      uint64_t v8 = [v26 localizedStringForKey:@"PASSCODE_ENTRY_PROMPT_RETRY" value:&stru_1EFCB7578 table:@"SpringBoardUIServices"];

      char v11 = _SBUIAXAwareLocalizedStringForKey(@"MESA_IS_DIRTY", v6);
      int v10 = SBLogCommon();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_80;
      }
      *(_WORD *)long long buf = 0;
      double v15 = "Passcode view status: Mesa is dirty";
      goto LABEL_79;
    case 0xAuLL:
      double v27 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      uint64_t v8 = [v27 localizedStringForKey:@"SWIPE_UP_TO_RETRY_PROMPT" value:&stru_1EFCB7578 table:@"SpringBoardUIServices"];

      int v10 = SBLogCommon();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_39;
      }
      *(_WORD *)long long buf = 0;
      double v25 = "Passcode view status: Swipe up to retry prompt";
LABEL_38:
      _os_log_impl(&dword_1A7607000, v10, OS_LOG_TYPE_DEFAULT, v25, buf, 2u);
LABEL_39:
      char v11 = 0;
      goto LABEL_80;
    case 0xBuLL:
      double v28 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      uint64_t v8 = [v28 localizedStringForKey:@"PASSCODE_ENTRY_PROMPT" value:&stru_1EFCB7578 table:@"SpringBoardUIServices"];

      char v11 = _SBUIAXAwareLocalizedStringForKey(@"WATCH_LOCKED_PROMPT", v6);
      int v10 = SBLogCommon();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_80;
      }
      *(_WORD *)long long buf = 0;
      double v15 = "Passcode view status: Watch locked prompt";
      goto LABEL_79;
    case 0xCuLL:
      CGRect v29 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      uint64_t v8 = [v29 localizedStringForKey:@"PASSCODE_ENTRY_PROMPT" value:&stru_1EFCB7578 table:@"SpringBoardUIServices"];

      char v11 = _SBUIAXAwareLocalizedStringForKey(@"SLEEP_MODE_PROMPT", v6);
      int v10 = SBLogCommon();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_80;
      }
      *(_WORD *)long long buf = 0;
      double v15 = "Passcode view status: Watch in sleep mode prompt";
      goto LABEL_79;
    case 0xDuLL:
      CGRect v30 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      uint64_t v8 = [v30 localizedStringForKey:@"PASSCODE_ENTRY_PROMPT" value:&stru_1EFCB7578 table:@"SpringBoardUIServices"];

      if (MGGetBoolAnswer())
      {
        char v11 = _SBUIAXAwareLocalizedStringForKey(@"WATCH_WLAN_OFF_PROMPT", v6);
        int v10 = SBLogCommon();
        if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_80;
        }
        *(_WORD *)long long buf = 0;
        double v15 = "Passcode view status: Watch Wlan off prompt";
      }
      else
      {
        char v11 = _SBUIAXAwareLocalizedStringForKey(@"WATCH_WIFI_OFF_PROMPT", v6);
        int v10 = SBLogCommon();
        if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_80;
        }
        *(_WORD *)long long buf = 0;
        double v15 = "Passcode view status: Watch Wifi off prompt";
      }
      goto LABEL_79;
    case 0xEuLL:
      v31 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      uint64_t v8 = [v31 localizedStringForKey:@"PASSCODE_ENTRY_PROMPT" value:&stru_1EFCB7578 table:@"SpringBoardUIServices"];

      char v11 = _SBUIAXAwareLocalizedStringForKey(@"WATCH_OUT_OF_RANGE_PROMPT", v6);
      int v10 = SBLogCommon();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_80;
      }
      *(_WORD *)long long buf = 0;
      double v15 = "Passcode view status: Watch out of range prompt";
      goto LABEL_79;
    case 0xFuLL:
      v32 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      uint64_t v8 = [v32 localizedStringForKey:@"PASSCODE_ENTRY_PROMPT" value:&stru_1EFCB7578 table:@"SpringBoardUIServices"];

      char v11 = _SBUIAXAwareLocalizedStringForKey(@"PHONE_BT_OFF_PROMPT", v6);
      int v10 = SBLogCommon();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_80;
      }
      *(_WORD *)long long buf = 0;
      double v15 = "Passcode view status: Phone bluetooth off prompt";
      goto LABEL_79;
    case 0x10uLL:
      v33 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      uint64_t v8 = [v33 localizedStringForKey:@"PASSCODE_ENTRY_PROMPT" value:&stru_1EFCB7578 table:@"SpringBoardUIServices"];

      if (MGGetBoolAnswer())
      {
        char v11 = _SBUIAXAwareLocalizedStringForKey(@"PHONE_WLAN_OFF_PROMPT", v6);
        int v10 = SBLogCommon();
        if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_80;
        }
        *(_WORD *)long long buf = 0;
        double v15 = "Passcode view status: Phone Wlan off prompt";
      }
      else
      {
        char v11 = _SBUIAXAwareLocalizedStringForKey(@"PHONE_WIFI_OFF_PROMPT", v6);
        int v10 = SBLogCommon();
        if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_80;
        }
        *(_WORD *)long long buf = 0;
        double v15 = "Passcode view status: Watch Wifi off prompt";
      }
      goto LABEL_79;
    case 0x11uLL:
      v34 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      uint64_t v8 = [v34 localizedStringForKey:@"PASSCODE_ENTRY_PROMPT" value:&stru_1EFCB7578 table:@"SpringBoardUIServices"];

      if (MGGetBoolAnswer())
      {
        char v11 = _SBUIAXAwareLocalizedStringForKey(@"PHONE_BT_AND_WLAN_OFF_PROMPT", v6);
        int v10 = SBLogCommon();
        if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_80;
        }
        *(_WORD *)long long buf = 0;
        double v15 = "Passcode view status: Phone bluetooth and Wlan off prompt";
      }
      else
      {
        char v11 = _SBUIAXAwareLocalizedStringForKey(@"PHONE_BT_AND_WIFI_OFF_PROMPT", v6);
        int v10 = SBLogCommon();
        if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_80;
        }
        *(_WORD *)long long buf = 0;
        double v15 = "Passcode view status: Phone bluetooth and Wifi off prompt";
      }
LABEL_79:
      _os_log_impl(&dword_1A7607000, v10, OS_LOG_TYPE_DEFAULT, v15, buf, 2u);
LABEL_80:

      if (!v8)
      {
LABEL_81:
        uint64_t v8 = [(SBUIPasscodeLockViewBase *)self _defaultStatusText];
      }
      if (self->_suppressTitleText && ![v11 length])
      {

        uint64_t v8 = @" ";
      }
      [(SBUIPasscodeLockViewBase *)self _setStatusText:v8];
      [(SBUIPasscodeLockViewBase *)self _setStatusSubtitleText:v11];
      if (self->_needStatusTextUpdate)
      {
        v45 = [(SBUIPasscodeLockViewBase *)self _statusText];
        v46 = [(SBUIPasscodeLockViewBase *)self _statusSubtitleText];
        [(SBUIPasscodeLockViewBase *)self updateStatusText:v45 subtitle:v46 animated:v3];

        self->_needStatusTextUpdate = 0;
      }

      return;
    case 0x12uLL:
      v35 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      uint64_t v8 = [v35 localizedStringForKey:@"PASSCODE_ENTRY_PROMPT" value:&stru_1EFCB7578 table:@"SpringBoardUIServices"];

      char v11 = _SBUIAXAwareLocalizedStringForKey(@"PHONE_UNLOCK_REQUIRED_PROMPT", v6);
      int v10 = SBLogCommon();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_80;
      }
      *(_WORD *)long long buf = 0;
      double v15 = "Passcode view status: Phone unlocked required prompt";
      goto LABEL_79;
    case 0x13uLL:
      v36 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      uint64_t v8 = [v36 localizedStringForKey:@"PASSCODE_ENTRY_PROMPT" value:&stru_1EFCB7578 table:@"SpringBoardUIServices"];

      char v11 = _SBUIAXAwareLocalizedStringForKey(@"GENERIC_WATCH_UNLOCK_ERROR_PROMPT", v6);
      int v10 = SBLogCommon();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_80;
      }
      *(_WORD *)long long buf = 0;
      double v15 = "Passcode view status: Generic watch unlock error prompt";
      goto LABEL_79;
    case 0x14uLL:
      v37 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      uint64_t v8 = [v37 localizedStringForKey:@"PASSCODE_ENTRY_PROMPT" value:&stru_1EFCB7578 table:@"SpringBoardUIServices"];

      char v11 = SBUIStringForPhoneUnlockWithWatchErrorCode(self->_errorCode);
      int v10 = SBLogCommon();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_80;
      }
      *(_WORD *)long long buf = 0;
      double v15 = "Passcode view status: Watch unlock error";
      goto LABEL_79;
    case 0x15uLL:
      v38 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      uint64_t v8 = [v38 localizedStringForKey:@"PASSCODE_ENTRY_PROMPT" value:&stru_1EFCB7578 table:@"SpringBoardUIServices"];

      char v11 = _SBUIAXAwareLocalizedStringForKey(@"FACE_ID_INTERLOCKED", v6);
      int v10 = SBLogCommon();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_80;
      }
      *(_WORD *)long long buf = 0;
      double v15 = "Passcode view status: Face ID interlocked";
      goto LABEL_79;
    case 0x16uLL:
      v39 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      uint64_t v8 = [v39 localizedStringForKey:@"PASSCODE_ENTRY_PROMPT" value:&stru_1EFCB7578 table:@"SpringBoardUIServices"];

      v40 = [(SBUIPasscodeLockViewBase *)self _deviceSpecificTemperatureStringForTemperatureState:1];
      char v11 = _SBUIAXAwareLocalizedStringForKey(v40, v6);

      int v10 = SBLogCommon();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_80;
      }
      *(_WORD *)long long buf = 0;
      double v15 = "Passcode view status: Thermal state too hot";
      goto LABEL_79;
    case 0x17uLL:
      v41 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      uint64_t v8 = [v41 localizedStringForKey:@"PASSCODE_ENTRY_PROMPT" value:&stru_1EFCB7578 table:@"SpringBoardUIServices"];

      v42 = [(SBUIPasscodeLockViewBase *)self _deviceSpecificTemperatureStringForTemperatureState:0];
      char v11 = _SBUIAXAwareLocalizedStringForKey(v42, v6);

      int v10 = SBLogCommon();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_80;
      }
      *(_WORD *)long long buf = 0;
      double v15 = "Passcode view status: Thermal state too cold";
      goto LABEL_79;
    case 0x18uLL:
      v43 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      uint64_t v8 = [v43 localizedStringForKey:@"PASSCODE_ENTRY_PROMPT" value:&stru_1EFCB7578 table:@"SpringBoardUIServices"];

      char v11 = _SBUIAXAwareLocalizedStringForKey(@"FACE_ID_UNSUPPORTED_GLASSES_PROMPT", v6);
      int v10 = SBLogCommon();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_80;
      }
      *(_WORD *)long long buf = 0;
      double v15 = "Passcode view status: Unsupported Glasses";
      goto LABEL_79;
    case 0x19uLL:
      v44 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      uint64_t v8 = [v44 localizedStringForKey:@"PASSCODE_ENTRY_PROMPT" value:&stru_1EFCB7578 table:@"SpringBoardUIServices"];

      char v11 = _SBUIAXAwareLocalizedStringForKey(@"FACE_ID_PERIOCULAR_TIMED_OUT_PROMPT", v6);
      int v10 = SBLogCommon();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_80;
      }
      *(_WORD *)long long buf = 0;
      double v15 = "Passcode view status: Periocular timed out";
      goto LABEL_79;
    default:
      if (self->_deviceHasBeenUnlockedOnceSinceBoot)
      {
        char v11 = 0;
      }
      else
      {
        v47 = NSString;
        v48 = _SBUIAXAwareLocalizedStringForKey(@"PASSCODE_AFTER_REBOOT", v6);
        v49 = [MEMORY[0x1E4F42948] currentDevice];
        v50 = [v49 model];
        char v11 = objc_msgSend(v47, "stringWithFormat:", v48, v50);

        v51 = SBLogCommon();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl(&dword_1A7607000, v51, OS_LOG_TYPE_DEFAULT, "Passcode view status: Face ID or Mesa needs passcode after reboot", buf, 2u);
        }
      }
      goto LABEL_81;
  }
}

- (id)_deviceSpecificTemperatureStringForTemperatureState:(unint64_t)a3
{
  BOOL v4 = [(SBUIBiometricResource *)self->_biometricResource hasPearlSupport];
  unint64_t v5 = @"MESA";
  if (v4) {
    unint64_t v5 = @"FACE_ID";
  }
  uint64_t v6 = @"COLD";
  if (a3 == 1) {
    uint64_t v6 = @"HOT";
  }
  unint64_t v7 = [NSString stringWithFormat:@"%@_DEVICE_TOO_%@", v5, v6];
  uint64_t v8 = [MEMORY[0x1E4F42948] modelSpecificLocalizedStringKeyForKey:v7];

  return v8;
}

- (unint64_t)_statusStateForLockoutState:(unint64_t)a3
{
  if (a3 - 1 > 8) {
    return 0;
  }
  else {
    return qword_1A76A52F0[a3 - 1];
  }
}

- (void)_setStatusState:(unint64_t)a3
{
}

- (void)_setStatusState:(unint64_t)a3 animated:(BOOL)a4
{
  if (self->_statusState != a3)
  {
    BOOL v4 = a4;
    self->_statusState = a3;
    if (!-[SBUIPasscodeLockViewBase _statusStateShouldNotUpdateForUnsupportedGlassesFeedback:](self, "_statusStateShouldNotUpdateForUnsupportedGlassesFeedback:"))[(SBUIPasscodeLockViewBase *)self updateStatusTextAnimated:v4]; {
    self->_previousStatusState = a3;
    }
  }
}

- (id)_defaultStatusText
{
  uint64_t v3 = [(SBUIPasscodeLockViewBase *)self _orientation];
  if (self->_deviceHasBeenUnlockedOnceSinceBoot
    && self->_isBiometricAuthenticationAllowed
    && [(SBUIBiometricResource *)self->_biometricResource hasBiometricAuthenticationCapabilityEnabled]&& [(SBUIBiometricResource *)self->_biometricResource hasMesaSupport]&& [(SBUIBiometricResource *)self->_biometricResource isMatchingEnabled])
  {
    BOOL v4 = @"PASSCODE_MESA_ENTRY_PROMPT";
  }
  else
  {
    BOOL v4 = @"PASSCODE_ENTRY_PROMPT";
  }
  unint64_t v5 = _SBUIAXAwareLocalizedStringForKey(v4, v3);
  return v5;
}

- (void)_resetForFailedPasscode:(BOOL)a3
{
  BOOL v3 = a3;
  [(SBUIPasscodeLockViewBase *)self _playAuthenticationFeedbackForSuccess:0 jiggleLock:1];
  entryField = self->_entryField;
  [(SBUIPasscodeEntryField *)entryField _resetForFailedPasscode:v3];
}

- (void)_noteDeviceHasBeenUnlockedOnceSinceBoot:(BOOL)a3
{
  self->_deviceHasBeenUnlockedOnceSinceBoot = a3;
  [(SBUIPasscodeLockViewBase *)self updateStatusTextAnimated:0];
}

- (void)_playAuthenticationFeedbackForSuccess:(BOOL)a3 jiggleLock:(BOOL)a4
{
  BOOL v5 = a3;
  BOOL v7 = [(SBUIBiometricResource *)self->_biometricResource hasPearlSupport];
  if (v5)
  {
    if (v7)
    {
      int v8 = _AXSPearlAuthenticationHapticsEnabled();
      uint64_t v9 = 1014;
      if (!v8) {
        uint64_t v9 = 1000;
      }
    }
    else
    {
      uint64_t v9 = 1000;
    }
  }
  else
  {
    uint64_t v9 = 1001;
    if (v7) {
      uint64_t v9 = 1015;
    }
  }
  authenticationFeedbackBehavior = self->_authenticationFeedbackBehavior;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __77__SBUIPasscodeLockViewBase__playAuthenticationFeedbackForSuccess_jiggleLock___block_invoke;
  v11[3] = &unk_1E5CCCCF8;
  v11[4] = self;
  void v11[5] = v9;
  BOOL v12 = a4;
  [(UINotificationFeedbackGenerator *)authenticationFeedbackBehavior activateWithCompletionBlock:v11];
}

void __77__SBUIPasscodeLockViewBase__playAuthenticationFeedbackForSuccess_jiggleLock___block_invoke(uint64_t a1, char a2)
{
  if (a2) {
    [*(id *)(*(void *)(a1 + 32) + 688) _privateNotificationOccurred:*(void *)(a1 + 40)];
  }
  [*(id *)(*(void *)(a1 + 32) + 688) deactivate];
  if (*(unsigned char *)(a1 + 48))
  {
    BOOL v3 = [MEMORY[0x1E4F28B50] mainBundle];
    BOOL v4 = [v3 bundleIdentifier];
    int v5 = [v4 isEqualToString:@"com.apple.springboard"];

    if (v5)
    {
      uint64_t v6 = [(id)*MEMORY[0x1E4F43630] statusBar];
      [v6 jiggleLockIcon];
    }
    id v7 = [*(id *)(a1 + 32) _proudLockContainerViewControllerToUpdate];
    [v7 updateLockForBiometricMatchFailure];
  }
}

- (void)_noteScreenBrightnessDidChange
{
  id v4 = [(SBUIPasscodeLockViewBase *)self screenBrightnessChangedTimer];
  [(SBUIPasscodeLockViewBase *)self setScreenBrightnessChangedTimer:0];
  if (fabs(self->_currentBacklightLevel) >= 2.22044605e-16)
  {
    BOOL v3 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:self target:sel__screenBrightnessReallyDidChange selector:0 userInfo:0 repeats:0.3];
    [(SBUIPasscodeLockViewBase *)self setScreenBrightnessChangedTimer:v3];
  }
  else
  {
    [(SBUIPasscodeLockViewBase *)self _screenBrightnessReallyDidChange];
  }
  [v4 invalidate];
}

- (BOOL)_proudLockShowingBiometricStates
{
  v2 = [(SBUIPasscodeLockViewBase *)self _proudLockContainerViewControllerToUpdate];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)_effectivelyHasProudLockShowingBiometricStates
{
  if ([(SBUIPasscodeLockViewBase *)self _proudLockShowingBiometricStates]) {
    return 1;
  }
  return [(SBUIPasscodeLockViewBase *)self _accountingForExternallyShownProudLock];
}

- (BOOL)_accountingForExternallyShownProudLock
{
  BOOL v2 = 1;
  uint64_t v3 = SBFEffectiveArtworkSubtype();
  if (v3 > 2795)
  {
    if (v3 != 2796 && v3 != 2868) {
      return 0;
    }
  }
  else if (v3 != 2556 && v3 != 2622)
  {
    return 0;
  }
  return v2;
}

- (void)_clearBrightnessChangeTimer
{
  uint64_t v3 = [(SBUIPasscodeLockViewBase *)self screenBrightnessChangedTimer];
  [v3 invalidate];

  [(SBUIPasscodeLockViewBase *)self setScreenBrightnessChangedTimer:0];
}

- (void)_screenBrightnessReallyDidChange
{
  [(SBUIPasscodeLockViewBase *)self _clearBrightnessChangeTimer];
  BKSDisplayBrightnessGetCurrent();
  double v4 = v3;
  if (self->_currentBacklightLevel != v4)
  {
    self->_currentBacklightLevel = v4;
    [(SBUIPasscodeLockViewBase *)self _evaluateLuminance];
  }
}

- (double)_luminanceBoostFromLegibility
{
  double v6 = 0.0;
  double v7 = 0.0;
  double v5 = 0.0;
  BOOL v2 = [(_UILegibilitySettings *)self->_legibilitySettings contentColor];
  [v2 getRed:&v7 green:&v6 blue:&v5 alpha:0];

  [MEMORY[0x1E4F428B8] _luminanceWithRed:v7 green:v6 blue:v5];
  if (v3 < 0.1) {
    return 0.3;
  }
  if (v3 <= 0.3) {
    return v3 * -1.15 + 0.415;
  }
  return 0.07;
}

- (double)_luminanceBoostFromDisplayBrightness
{
  return fmin(fmax(pow(fmin(fmax(self->_currentBacklightLevel, 0.0), 1.0) * -2.0 + 3.0, 7.0) / 4374.0, 0.0), 0.5);
}

- (void)_evaluateLuminance
{
  [(SBUIPasscodeLockViewBase *)self _luminanceBoostFromLegibility];
  double v4 = v3;
  [(SBUIPasscodeLockViewBase *)self _luminanceBoostFromDisplayBrightness];
  double v6 = fmin(fmax(v4 + v5, 0.07), 0.8);
  [(SBUIPasscodeLockViewBase *)self _setLuminosityBoost:v6];
}

- (void)_resetStatusText
{
}

- (void)_resetProudLockAndTitleTextForFailedBiometricAttempt
{
  double v3 = +[SBUIBiometricResource sharedInstance];
  int v4 = [v3 hasPearlSupport];

  if (v4) {
    [(SBUIPasscodeLockViewBase *)self _setStatusStateSwipeToRetryAnimated:1];
  }
  [(SBUIPasscodeLockViewBase *)self _setSuppressTitleText:0 animated:1];
  double v5 = [(SBUIPasscodeLockViewBase *)self _entryField];
  double v6 = [v5 stringValue];
  uint64_t v7 = [v6 length];

  int v8 = [(SBUIPasscodeLockViewBase *)self _proudLockContainerViewControllerToUpdate];
  id v9 = v8;
  if (v7) {
    [v8 reset];
  }
  else {
    [v8 updateLockForBiometricMatchFailure];
  }
}

- (void)_resetForFailedBiometricAttempt
{
  double v3 = SBLogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1A7607000, v3, OS_LOG_TYPE_DEFAULT, "Passcode lock view resetting for failed biometric attempt", buf, 2u);
  }

  if (self->_passcodeLockViewState == 1)
  {
    if ([(SBUIPasscodeLockViewBase *)self _effectivelyHasProudLockShowingBiometricStates])
    {
      [(SBUIPasscodeLockViewBase *)self _resetProudLockAndTitleTextForFailedBiometricAttempt];
    }
    else
    {
      double v6 = [(SBUIPasscodeLockViewBase *)self _entryField];
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __59__SBUIPasscodeLockViewBase__resetForFailedBiometricAttempt__block_invoke;
      v8[3] = &unk_1E5CCC580;
      v8[4] = self;
      [v6 _autofillForBiometricAuthenticationWithCompletion:v8];
    }
  }
  else
  {
    if ([(SBUIPasscodeBiometricAuthenticationView *)self->_biometricAuthenticationView type] != 3) {
      [(SBUIPasscodeLockViewBase *)self _resetProudLockAndTitleTextForFailedBiometricAttempt];
    }
    if ([(SBUIBiometricResource *)self->_biometricResource hasPearlSupport])
    {
      if ([(SBUIPasscodeLockViewBase *)self _accountingForExternallyShownProudLock])
      {
        int64_t v4 = 0;
      }
      else
      {
        int64_t v4 = 800000000;
      }
      dispatch_time_t v5 = dispatch_time(0, v4);
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __59__SBUIPasscodeLockViewBase__resetForFailedBiometricAttempt__block_invoke_3;
      v7[3] = &unk_1E5CCC580;
      v7[4] = self;
      dispatch_after(v5, MEMORY[0x1E4F14428], v7);
    }
  }
}

void __59__SBUIPasscodeLockViewBase__resetForFailedBiometricAttempt__block_invoke(uint64_t a1)
{
  dispatch_time_t v2 = dispatch_time(0, 300000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__SBUIPasscodeLockViewBase__resetForFailedBiometricAttempt__block_invoke_2;
  block[3] = &unk_1E5CCC580;
  block[4] = *(void *)(a1 + 32);
  dispatch_after(v2, MEMORY[0x1E4F14428], block);
}

void __59__SBUIPasscodeLockViewBase__resetForFailedBiometricAttempt__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _setSuppressTitleText:0 animated:1];
  [*(id *)(a1 + 32) _playAuthenticationFeedbackForSuccess:0 jiggleLock:1];
  id v2 = [*(id *)(a1 + 32) _entryField];
  [v2 _resetForFailedPasscode:1];
}

uint64_t __59__SBUIPasscodeLockViewBase__resetForFailedBiometricAttempt__block_invoke_3(uint64_t a1)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v2 = *(void **)(a1 + 32);
  if (v2[59] != 1)
  {
    double v3 = [v2 unlockDestination];

    if (!v3)
    {
      int64_t v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
      uint64_t v5 = *(void *)(a1 + 32);
      int v8 = @"SBUIPasscodeLockViewBiometricTransitionToPasscodeReasonKey";
      v9[0] = @"SBUIPasscodeLockViewBiometricTransitionToPasscodeReasonMatchFailure";
      double v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
      [v4 postNotificationName:@"SBUIPasscodeLockViewBiometricTransitionToPasscode" object:v5 userInfo:v6];
    }
  }
  if ([*(id *)(*(void *)(a1 + 32) + 528) type] == 3) {
    [*(id *)(a1 + 32) _resetProudLockAndTitleTextForFailedBiometricAttempt];
  }
  return [*(id *)(a1 + 32) _advanceToPasscodeForMatchFailure:1];
}

- (void)_handleNonPasscodeAuthenticationAndUpdateProudLock
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __78__SBUIPasscodeLockViewBase__handleNonPasscodeAuthenticationAndUpdateProudLock__block_invoke;
  v4[3] = &unk_1E5CCC580;
  v4[4] = self;
  double v3 = (void (**)(void))MEMORY[0x1AD0CF1C0](v4, a2);
  if (![(SBUIPasscodeLockViewBase *)self _supportsProudLock]) {
    goto LABEL_5;
  }
  if (!self->_proudLockConfiguration.coachingDelaysUnlock)
  {
    [(SBUIPasscodeLockViewBase *)self _updateProudLockForBioUnlockWithCompletion:0];
LABEL_5:
    v3[2](v3);
    goto LABEL_6;
  }
  [(SBUIPasscodeLockViewBase *)self _updateProudLockForBioUnlockWithCompletion:v3];
LABEL_6:
}

unsigned char *__78__SBUIPasscodeLockViewBase__handleNonPasscodeAuthenticationAndUpdateProudLock__block_invoke(uint64_t a1)
{
  double result = *(unsigned char **)(a1 + 32);
  if (result[480]) {
    return (unsigned char *)[result _handleBiometricAuthentication];
  }
  return result;
}

- (void)_handleBiometricAuthentication
{
  [(SBUIPasscodeLockViewBase *)self _disarmAdvanceToPasscodeTimer];
  [(SBUIPasscodeLockViewBase *)self _playAuthenticationFeedbackForSuccess:1 jiggleLock:0];
  double v3 = [(SBUIPasscodeLockViewBase *)self _entryField];
  [v3 _autofillForBiometricAuthenticationWithCompletion:0];

  if ([(SBUIPasscodeLockViewBase *)self _accountingForExternallyShownProudLock])
  {
    int64_t v4 = 0;
  }
  else
  {
    int64_t v4 = 200000000;
  }
  dispatch_time_t v5 = dispatch_time(0, v4);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__SBUIPasscodeLockViewBase__handleBiometricAuthentication__block_invoke;
  block[3] = &unk_1E5CCC580;
  block[4] = self;
  dispatch_after(v5, MEMORY[0x1E4F14428], block);
}

uint64_t __58__SBUIPasscodeLockViewBase__handleBiometricAuthentication__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _notifyDelegatePasscodeEnteredViaMesa];
}

- (void)_notifyDelegatePasscodeEnteredViaMesa
{
  uint64_t v3 = [(SBUIPasscodeLockViewBase *)self delegate];
  if (v3)
  {
    int64_t v4 = (void *)v3;
    if (objc_opt_respondsToSelector()) {
      [v4 passcodeLockViewPasscodeEnteredViaMesa:self];
    }
  }
  MEMORY[0x1F4181820]();
}

- (void)_updateProudLockForBioUnlockWithCompletion:(id)a3
{
  id v8 = a3;
  if ([(SBUIPasscodeLockViewBase *)self _proudLockShowingBiometricStates])
  {
    BOOL v4 = [(SBUIPasscodeLockViewBase *)self _accountingForExternallyShownProudLock];
    dispatch_time_t v5 = [(SBUIPasscodeLockViewBase *)self _proudLockContainerViewControllerToUpdate];
    double v6 = v5;
    if (!v4)
    {
      [v5 setAuthenticated:1 completion:v8];

      goto LABEL_7;
    }
    [v5 setAuthenticated:1 completion:0];
  }
  uint64_t v7 = v8;
  if (!v8) {
    goto LABEL_8;
  }
  (*((void (**)(id))v8 + 2))(v8);
LABEL_7:
  uint64_t v7 = v8;
LABEL_8:
}

- (void)_updateProudLockForBioEvent:(unint64_t)a3
{
  if (a3 != 4)
  {
    id v5 = [(SBUIPasscodeLockViewBase *)self _proudLockContainerViewControllerToUpdate];
    [v5 handleBiometricEvent:a3];
  }
}

- (void)_updateStatusTextForBioEvent:(unint64_t)a3 animated:(BOOL)a4
{
  BOOL v6 = [(SBUIBiometricResource *)self->_biometricResource hasPearlSupport];
  unint64_t statusState = 1;
  switch(a3)
  {
    case 5uLL:
    case 6uLL:
    case 0xBuLL:
      unint64_t statusState = 4;
      break;
    case 7uLL:
      unint64_t statusState = 3;
      break;
    case 8uLL:
      break;
    case 9uLL:
      unint64_t statusState = 9;
      break;
    case 0xAuLL:
      int v8 = self->_passcodeLockViewState != 1 || v6;
      if (v8 == 1) {
        unint64_t statusState = self->_statusState;
      }
      else {
        unint64_t statusState = 8;
      }
      break;
    case 0x18uLL:
      unint64_t statusState = 21;
      break;
    case 0x19uLL:
      unint64_t statusState = 22;
      break;
    case 0x1AuLL:
      unint64_t statusState = 23;
      break;
    case 0x1EuLL:
      unint64_t statusState = 24;
      break;
    case 0x20uLL:
      unint64_t statusState = 25;
      break;
    case 0x21uLL:
      unint64_t statusState = 7;
      break;
    default:
      unint64_t statusState = 0;
      break;
  }
  [(SBUIPasscodeLockViewBase *)self _setStatusState:statusState];
}

- (void)_updateBiometricGlyphForBioEvent:(unint64_t)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  int v8 = (void (**)(id, void))a5;
  BOOL v9 = [(SBUIBiometricResource *)self->_biometricResource hasPearlSupport];
  uint64_t v17 = 0;
  double v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  uint64_t v13 = 0;
  char v14 = &v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 6;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __81__SBUIPasscodeLockViewBase__updateBiometricGlyphForBioEvent_animated_completion___block_invoke;
  v12[3] = &unk_1E5CCCD20;
  v12[4] = &v17;
  void v12[5] = &v13;
  uint64_t v10 = MEMORY[0x1AD0CF1C0](v12);
  char v11 = (void *)v10;
  if (!self->_passcodeLockViewState && !v9)
  {
    if (a3 - 9 < 3)
    {
      a3 = 0;
LABEL_5:
      (*(void (**)(uint64_t, unint64_t))(v10 + 16))(v10, a3);
      goto LABEL_6;
    }
    if (a3 < 2) {
      goto LABEL_5;
    }
    if (a3 == 4)
    {
      a3 = 12;
      goto LABEL_5;
    }
  }
LABEL_6:
  if (*((unsigned char *)v18 + 24))
  {
    [(SBUIPasscodeBiometricAuthenticationView *)self->_biometricAuthenticationView setGlyphViewState:v14[3] animated:v5 completion:v8];
  }
  else if (v8)
  {
    v8[2](v8, 0);
  }

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);
}

uint64_t __81__SBUIPasscodeLockViewBase__updateBiometricGlyphForBioEvent_animated_completion___block_invoke(uint64_t result, uint64_t a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = a2;
  return result;
}

- (void)_updateBiometricLayout
{
  if ([(SBUIBiometricResource *)self->_biometricResource hasPearlSupport]) {
    uint64_t v3 = 2;
  }
  else {
    uint64_t v3 = 1;
  }
  biometricAuthenticationView = self->_biometricAuthenticationView;
  [(SBUIPasscodeBiometricAuthenticationView *)biometricAuthenticationView setType:v3];
}

- (void)_setStatusStateSwipeToRetryAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(SBUIPasscodeLockViewBase *)self canSuggestSwipeToRetry])
  {
    unint64_t phoneUnlockWithWatchFailedStatusState = self->_phoneUnlockWithWatchFailedStatusState;
    BOOL v6 = self;
    if (!phoneUnlockWithWatchFailedStatusState) {
      unint64_t phoneUnlockWithWatchFailedStatusState = 10;
    }
  }
  else
  {
    BOOL v6 = self;
    unint64_t phoneUnlockWithWatchFailedStatusState = 0;
  }
  [(SBUIPasscodeLockViewBase *)v6 _setStatusState:phoneUnlockWithWatchFailedStatusState animated:v3];
}

- (BOOL)_statusStateShouldNotUpdateForUnsupportedGlassesFeedback:(unint64_t)a3
{
  return a3 == 10 && self->_previousStatusState == 24;
}

- (void)providerLegibilitySettingsChanged:(id)a3
{
  uint64_t v4 = [(SBFLegibilitySettingsProvider *)self->_backgroundLegibilitySettingsProvider legibilitySettings];
  uint64_t v5 = v4;
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v4 = [(SBUIPasscodeLockViewBase *)self _setLegibilitySettings:v4];
    uint64_t v5 = v6;
  }
  MEMORY[0x1F41817F8](v4, v5);
}

- (void)biometricResource:(id)a3 matchingEnabledDidChange:(BOOL)a4
{
  if (a4)
  {
    [(SBUIPasscodeLockViewBase *)self _updateStatusStateForLockoutIfNecessaryAnimatedly:0];
    [(SBUIPasscodeLockViewBase *)self updateStatusTextAnimated:1];
  }
  else
  {
    dispatch_time_t v5 = dispatch_time(0, 500000000);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __71__SBUIPasscodeLockViewBase_biometricResource_matchingEnabledDidChange___block_invoke;
    v6[3] = &unk_1E5CCC5A8;
    v6[4] = self;
    char v7 = 1;
    dispatch_after(v5, MEMORY[0x1E4F14428], v6);
  }
}

void __71__SBUIPasscodeLockViewBase_biometricResource_matchingEnabledDidChange___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) window];

  if (v2)
  {
    BOOL v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(unsigned __int8 *)(a1 + 40);
    [v3 updateStatusTextAnimated:v4];
  }
}

- (void)biometricResource:(id)a3 observeEvent:(unint64_t)a4
{
  if ([(SBUIPasscodeLockViewBase *)self _canRecognizeBiometricAuthentication])
  {
    if (a4 - 9 > 2)
    {
      switch(a4)
      {
        case 0uLL:
          biometricAuthenticationView = self->_biometricAuthenticationView;
          uint64_t v12 = 0;
          goto LABEL_26;
        case 1uLL:
          biometricAuthenticationView = self->_biometricAuthenticationView;
          uint64_t v12 = 1;
LABEL_26:
          [(SBUIPasscodeBiometricAuthenticationView *)biometricAuthenticationView setGlyphViewState:v12];
          break;
        case 4uLL:
          [(SBUIPasscodeLockViewBase *)self _handleNonPasscodeAuthenticationAndUpdateProudLock];
          break;
        case 5uLL:
        case 6uLL:
        case 7uLL:
        case 8uLL:
        case 0x18uLL:
        case 0x19uLL:
        case 0x1AuLL:
        case 0x21uLL:
          [(SBUIPasscodeLockViewBase *)self _updateStatusTextForBioEvent:a4 animated:1];
          [(SBUIPasscodeLockViewBase *)self _setPasscodeLockViewState:1 animated:1];
          uint64_t v6 = [(SBUIPasscodeLockViewBase *)self _proudLockContainerViewControllerToUpdate];
          [v6 setAuthenticated:0];

          break;
        case 0xDuLL:
          if (!self->_passcodeLockViewState) {
            [(SBUIPasscodeLockViewBase *)self _disarmAdvanceToPasscodeTimer];
          }
          break;
        case 0xFuLL:
          if (!self->_passcodeLockViewState) {
            [(SBUIPasscodeLockViewBase *)self _resetForFailedBiometricAttempt];
          }
          break;
        case 0x15uLL:
          [(SBUIPasscodeLockViewBase *)self noteFaceHasBeenOccluded];
          break;
        case 0x1CuLL:
          [(SBUIPasscodeLockViewBase *)self noteBottomFaceHasBeenOccluded];
          break;
        case 0x1DuLL:
          [(SBUIPasscodeLockViewBase *)self _setAuthenticationViewTypeToFaceIDWithWatch];
          break;
        case 0x1EuLL:
          uint64_t v13 = self;
          uint64_t v14 = 30;
          goto LABEL_37;
        case 0x20uLL:
          uint64_t v13 = self;
          uint64_t v14 = 32;
LABEL_37:
          [(SBUIPasscodeLockViewBase *)v13 _updateStatusTextForBioEvent:v14 animated:1];
          [(SBUIPasscodeLockViewBase *)self _advanceToPasscodeForMatchFailure:0];
          break;
        default:
          break;
      }
    }
    else
    {
      [(SBUIPasscodeBiometricAuthenticationView *)self->_biometricAuthenticationView setGlyphViewState:0];
      [(SBUIPasscodeLockViewBase *)self _resetForFailedBiometricAttempt];
      [(SBUIPasscodeLockViewBase *)self _updateStatusTextForBioEvent:a4 animated:1];
    }
    [(SBUIPasscodeLockViewBase *)self _updateBiometricGlyphForBioEvent:a4 animated:1 completion:0];
    [(SBUIPasscodeLockViewBase *)self _updateProudLockForBioEvent:a4];
    BOOL v15 = [(SBUIPasscodeLockViewBase *)self isBiometricLockedOut];
    if (a4 == 4 || v15)
    {
      poseidonContainerViewController = self->_poseidonContainerViewController;
      [(SBUIPoseidonContainerViewController *)poseidonContainerViewController showCoaching:0];
    }
    return;
  }
  if ((a4 & 0xFFFFFFFFFFFFFFFCLL) == 8)
  {
    if (a4 == 11)
    {
LABEL_6:
      [(SBUIPasscodeLockViewBase *)self _setStatusState:2];
      return;
    }
    goto LABEL_16;
  }
  if ((a4 & 0xFFFFFFFFFFFFFFFCLL) <= 8)
  {
    switch(a4)
    {
      case 4uLL:
        if (self->_isBiometricAuthenticationAllowed)
        {
          char v7 = [(SBUIPasscodeLockViewBase *)self window];

          if (v7)
          {
            int v8 = SBLogBiometricResource();
            if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
              -[SBUIPasscodeLockViewBase biometricResource:observeEvent:]((uint64_t)self, v8);
            }

            self->_pendingBioUnlock = 1;
            int v9 = self->_currentPendingBioUnlockToken + 1;
            self->_currentPendingBioUnlockToken = v9;
            dispatch_time_t v10 = dispatch_time(0, 1000000000);
            v17[0] = MEMORY[0x1E4F143A8];
            v17[1] = 3221225472;
            v17[2] = __59__SBUIPasscodeLockViewBase_biometricResource_observeEvent___block_invoke;
            v17[3] = &unk_1E5CCCD48;
            v17[4] = self;
            int v18 = v9;
            dispatch_after(v10, MEMORY[0x1E4F14428], v17);
          }
        }
        return;
      case 5uLL:
      case 7uLL:
        goto LABEL_16;
      case 6uLL:
        goto LABEL_6;
      default:
        JUMPOUT(0);
    }
  }
  if (a4 <= 0x21 && ((1 << a4) & 0x207000000) != 0)
  {
LABEL_16:
    [(SBUIPasscodeLockViewBase *)self _updateStatusTextForBioEvent:a4 animated:0];
  }
}

void __59__SBUIPasscodeLockViewBase_biometricResource_observeEvent___block_invoke(uint64_t a1)
{
  v1 = (uint64_t *)(a1 + 32);
  if (*(_DWORD *)(*(void *)(a1 + 32) + 516) == *(_DWORD *)(a1 + 40))
  {
    id v2 = SBLogBiometricResource();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
      __59__SBUIPasscodeLockViewBase_biometricResource_observeEvent___block_invoke_cold_1(v1, v2);
    }

    *(unsigned char *)(*v1 + 513) = 0;
  }
}

- (double)passcodeBiometricAuthenticationViewSideButtonsOffsetFromCenter:(id)a3
{
  +[SBUIPasscodeLockNumberPad _inputButtonCircleSize];
  double v5 = v4;
  +[SBUIPasscodeLockNumberPad _inputButtonCircleSpacing];
  double v7 = v6 * 3.0 + v5 * 3.0;
  +[SBUIPasscodeLockNumberPad _inputButtonCircleSpacing];
  double v9 = v7 + v8 * 3.0;
  dispatch_time_t v10 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v11 = [v10 userInterfaceIdiom];

  if ((v11 & 0xFFFFFFFFFFFFFFFBLL) == 1
    || [(SBUIPasscodeLockViewBase *)self _isBoundsPortraitOriented])
  {
    return v9 / 3.0;
  }
  else
  {
    return v9 * 0.5;
  }
}

- (double)passcodeBiometricAuthenticationViewNumberPadAncillaryButtonOffsetFromTopOfScreen:(id)a3
{
  double v4 = [[SBUIPasscodeLockNumberPad alloc] initWithDefaultSizeAndLightStyle:0];
  [(SBUIPasscodeLockViewBase *)self _numberPadOffsetFromTopOfScreen:v4];
  double v6 = v5;
  [(SBUIPasscodeLockNumberPad *)v4 ancillaryButtonOffset];
  double v8 = v6 + v7;

  return v8;
}

- (void)passcodeBiometricAuthenticationViewUsePasscodeButtonHit:(id)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  [(SBUIPasscodeBiometricAuthenticationView *)self->_biometricAuthenticationView setAncillaryButtonsVisible:0];
  [(SBUIPasscodeBiometricAuthenticationView *)self->_biometricAuthenticationView setFaceIDUsePasscodeButtonVisible:0];
  [(SBUIPasscodeLockViewBase *)self _setPasscodeLockViewState:1 animated:1];
  [(SBUIPasscodeLockViewBase *)self _disarmAdvanceToPasscodeTimer];
  double v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  double v6 = @"SBUIPasscodeLockViewBiometricTransitionToPasscodeReasonKey";
  v7[0] = @"SBUIPasscodeLockViewBiometricTransitionToPasscodeReasonUserRequested";
  double v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  [v4 postNotificationName:@"SBUIPasscodeLockViewBiometricTransitionToPasscode" object:self userInfo:v5];
}

- (void)passcodeBiometricAuthenticationViewCancelButtonHit:(id)a3
{
  uint64_t v4 = [(SBUIPasscodeLockViewBase *)self delegate];
  if (v4)
  {
    double v5 = (void *)v4;
    if (objc_opt_respondsToSelector()) {
      [v5 passcodeLockViewCancelButtonPressed:self];
    }
  }
  MEMORY[0x1F4181820]();
}

- (void)passcodeBiometricAuthenticationViewEmergencyCallButtonHit:(id)a3
{
  uint64_t v4 = [(SBUIPasscodeLockViewBase *)self delegate];
  if (v4)
  {
    double v5 = (void *)v4;
    if (objc_opt_respondsToSelector()) {
      [v5 passcodeLockViewEmergencyCallButtonPressed:self];
    }
  }
  MEMORY[0x1F4181820]();
}

- (void)phoneUnlockWithWatchControllerAttemptFailed:(id)a3 withError:(id)a4
{
  id v14 = a4;
  double v5 = +[SBUIPeriocularController sharedInstance];
  char v6 = [v5 periocularEnabled];

  id v8 = v14;
  if (v6) {
    goto LABEL_21;
  }
  uint64_t v9 = [v14 code];
  dispatch_time_t v10 = +[SBUIPhoneUnlockWithWatchController sharedInstance];
  int v11 = [v10 showRawErrorCodes];

  if (v11)
  {
    self->_unint64_t phoneUnlockWithWatchFailedStatusState = 20;
    uint64_t v12 = &OBJC_IVAR___SBUIPasscodeLockViewBase__errorCode;
    uint64_t v13 = v9;
    goto LABEL_19;
  }
  uint64_t v12 = &OBJC_IVAR___SBUIPasscodeLockViewBase__phoneUnlockWithWatchFailedStatusState;
  uint64_t v13 = 11;
  if (v9 > 158)
  {
    if (v9 > 203)
    {
      if ((unint64_t)(v9 - 213) < 4)
      {
        uint64_t v12 = &OBJC_IVAR___SBUIPasscodeLockViewBase__phoneUnlockWithWatchFailedStatusState;
        uint64_t v13 = 18;
        goto LABEL_19;
      }
      if (v9 == 204)
      {
        uint64_t v12 = &OBJC_IVAR___SBUIPasscodeLockViewBase__phoneUnlockWithWatchFailedStatusState;
        uint64_t v13 = 12;
        goto LABEL_19;
      }
    }
    else
    {
      switch(v9)
      {
        case 159:
          goto LABEL_19;
        case 186:
LABEL_18:
          uint64_t v13 = 19;
          goto LABEL_19;
        case 199:
          uint64_t v13 = 13;
          goto LABEL_19;
      }
    }
  }
  else
  {
    if (v9 > 113)
    {
      switch(v9)
      {
        case 114:
        case 128:
        case 131:
        case 137:
        case 139:
          goto LABEL_18;
        case 120:
          uint64_t v13 = 16;
          break;
        case 123:
          uint64_t v13 = 15;
          break;
        case 124:
          uint64_t v13 = 17;
          break;
        case 130:
        case 138:
          uint64_t v13 = 14;
          break;
        case 135:
          goto LABEL_19;
        default:
          goto LABEL_29;
      }
      goto LABEL_19;
    }
    switch(v9)
    {
      case 'e':
        goto LABEL_18;
      case 'f':
        goto LABEL_19;
      case 'g':
        goto LABEL_18;
    }
  }
LABEL_29:
  uint64_t v13 = 0;
  uint64_t v12 = &OBJC_IVAR___SBUIPasscodeLockViewBase__phoneUnlockWithWatchFailedStatusState;
LABEL_19:
  *(Class *)((char *)&self->super.super.super.isa + *v12) = (Class)v13;
  [(SBUIPasscodeLockViewBase *)self _advanceToPasscodeForMatchFailure:1];
  uint64_t v7 = [(SBUIBiometricResource *)self->_biometricResource biometricLockoutState];
  id v8 = v14;
  if (!v7)
  {
    uint64_t v7 = [(SBUIPasscodeLockViewBase *)self _resetForFailedBiometricAttempt];
    id v8 = v14;
  }
LABEL_21:
  MEMORY[0x1F41817F8](v7, v8);
}

- (SBUIPasscodeLockViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBUIPasscodeLockViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)showsStatusField
{
  return self->_showsStatusField;
}

- (void)setShowsStatusField:(BOOL)a3
{
  self->_showsStatusField = a3;
}

- (BOOL)usesBiometricPresentation
{
  return self->_usesBiometricPresentation;
}

- (BOOL)allowsAutomaticBiometricPresentationTransition
{
  return self->_allowsAutomaticBiometricPresentationTransition;
}

- (BOOL)showsProudLock
{
  return self->_showsProudLock;
}

- (UIView)poseidonContainerView
{
  return self->_poseidonContainerView;
}

- (SBUIPoseidonContainerViewController)poseidonContainerViewController
{
  return self->_poseidonContainerViewController;
}

- (SBUIProudLockContainerViewController)overrideProudLockContainerViewController
{
  return self->_overrideProudLockContainerViewController;
}

- (double)backgroundAlpha
{
  return self->_backgroundAlpha;
}

- (UIColor)customBackgroundColor
{
  return self->_customBackgroundColor;
}

- (SBUIPasscodeEntryField)_entryField
{
  return self->_entryField;
}

- (void)_setEntryField:(id)a3
{
}

- (SBFLegibilitySettingsProvider)backgroundLegibilitySettingsProvider
{
  return self->_backgroundLegibilitySettingsProvider;
}

- (double)_luminosityBoost
{
  return self->_luminanceBoost;
}

- (BOOL)isScreenOn
{
  return self->_screenOn;
}

- (BOOL)isBiometricAuthenticationAllowed
{
  return self->_isBiometricAuthenticationAllowed;
}

- (int64_t)passcodeLockViewState
{
  return self->_passcodeLockViewState;
}

- (UIView)passcodeAuthenticationView
{
  return self->_passcodeAuthenticationView;
}

- (void)setPasscodeAuthenticationView:(id)a3
{
}

- (UIView)biometricAuthenticationView
{
  return &self->_biometricAuthenticationView->super.super;
}

- (void)setBiometricAuthenticationView:(id)a3
{
}

- (BOOL)confirmedNotInPocket
{
  return self->_confirmedNotInPocket;
}

- (void)setConfirmedNotInPocket:(BOOL)a3
{
  self->_confirmedNotInPocket = a3;
}

- (BOOL)canSuggestSwipeToRetry
{
  return self->_canSuggestSwipeToRetry;
}

- (void)setCanSuggestSwipeToRetry:(BOOL)a3
{
  self->_canSuggestSwipeToRetrCGFloat y = a3;
}

- (BOOL)showsLockIconForFaceID
{
  return self->_showsLockIconForFaceID;
}

- (NSString)overrideFaceIDReason
{
  return self->_overrideFaceIDReason;
}

- (NSString)overridePasscodeButtonTitle
{
  return self->_overridePasscodeButtonTitle;
}

- (BOOL)alwaysShowPasscodeButtonForFaceIDMatchFailure
{
  return self->_alwaysShowPasscodeButtonForFaceIDMatchFailure;
}

- (void)setAlwaysShowPasscodeButtonForFaceIDMatchFailure:(BOOL)a3
{
  self->_alwaysShowPasscodeButtonForFaceIDMatchFailure = a3;
}

- ($20D0CF0D87A8AD096D8C820DF2D4BB3C)proudLockConfiguration
{
  long long v3 = *(_OWORD *)&self[9].var9;
  *(_OWORD *)&retstr->var5 = *(_OWORD *)&self[9].var7;
  *(_OWORD *)&retstr->var7 = v3;
  *(_OWORD *)&retstr->var9 = *(_OWORD *)&self[10].var0;
  long long v4 = *(_OWORD *)&self[9].var5;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[9].var3;
  *(_OWORD *)&retstr->var3 = v4;
  return self;
}

- (SBUIBiometricResource)biometricResource
{
  return self->_biometricResource;
}

- (int)style
{
  return self->_style;
}

- (void)setStyle:(int)a3
{
  self->_style = a3;
}

- (_UIKBFeedbackGenerating)keyboardFeedbackBehavior
{
  return self->_keyboardFeedbackBehavior;
}

- (void)setKeyboardFeedbackBehavior:(id)a3
{
}

- (BOOL)shouldResetForFailedPasscodeAttempt
{
  return self->_shouldResetForFailedPasscodeAttempt;
}

- (void)setShouldResetForFailedPasscodeAttempt:(BOOL)a3
{
  self->_shouldResetForFailedPasscodeAttempt = a3;
}

- (unint64_t)_statusState
{
  return self->_statusState;
}

- (NSTimer)screenBrightnessChangedTimer
{
  return self->_screenBrightnessChangedTimer;
}

- (void)setScreenBrightnessChangedTimer:(id)a3
{
}

- (UINotificationFeedbackGenerator)authenticationFeedbackBehavior
{
  return self->_authenticationFeedbackBehavior;
}

- (void)setAuthenticationFeedbackBehavior:(id)a3
{
}

- (BOOL)isTransitioning
{
  return self->_isTransitioning;
}

- (void)setIsTransitioning:(BOOL)a3
{
  self->_isTransitioning = a3;
}

- ($1D129F7B4C980C50E70029647222EF17)transitionContext
{
  *($1383D3E36CD83AA20A6819E41324702A *)retstr = *($1383D3E36CD83AA20A6819E41324702A *)((char *)self + 712);
  return self;
}

- (void)setTransitionContext:(id *)a3
{
  double var2 = a3->var2;
  *(_OWORD *)&self->_transitionContext.fromState = *(_OWORD *)&a3->var0;
  self->_transitionContext.progress = var2;
}

- (NSString)_statusText
{
  return self->_statusText;
}

- (NSString)_statusSubtitleText
{
  return self->_statusSubtitleText;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusSubtitleText, 0);
  objc_storeStrong((id *)&self->_statusText, 0);
  objc_storeStrong((id *)&self->_authenticationFeedbackBehavior, 0);
  objc_storeStrong((id *)&self->_screenBrightnessChangedTimer, 0);
  objc_storeStrong((id *)&self->_keyboardFeedbackBehavior, 0);
  objc_storeStrong((id *)&self->_biometricResource, 0);
  objc_storeStrong((id *)&self->_overridePasscodeButtonTitle, 0);
  objc_storeStrong((id *)&self->_overrideFaceIDReason, 0);
  objc_storeStrong((id *)&self->_entryField, 0);
  objc_storeStrong((id *)&self->_poseidonContainerViewController, 0);
  objc_storeStrong((id *)&self->_poseidonContainerView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_overrideProudLockContainerViewController, 0);
  objc_storeStrong((id *)&self->_proudLockContainerViewController, 0);
  objc_storeStrong((id *)&self->_biometricAuthenticationView, 0);
  objc_storeStrong((id *)&self->_passcodeAuthenticationView, 0);
  objc_storeStrong((id *)&self->_biometricMatchingEnabledOverrideReasons, 0);
  objc_storeStrong((id *)&self->_biometricMatchingAssertion, 0);
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
  objc_storeStrong((id *)&self->_backgroundLegibilitySettingsProvider, 0);
  objc_storeStrong((id *)&self->_customBackgroundColor, 0);
}

- (void)biometricResource:(uint64_t)a1 observeEvent:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1A7607000, a2, OS_LOG_TYPE_DEBUG, "Recognizing a pending bio-unlock for passcode view (%p)", (uint8_t *)&v2, 0xCu);
}

void __59__SBUIPasscodeLockViewBase_biometricResource_observeEvent___block_invoke_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 134217984;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_1A7607000, a2, OS_LOG_TYPE_DEBUG, "Pending bio-unlock expired for passcode view (%p)", (uint8_t *)&v3, 0xCu);
}

@end