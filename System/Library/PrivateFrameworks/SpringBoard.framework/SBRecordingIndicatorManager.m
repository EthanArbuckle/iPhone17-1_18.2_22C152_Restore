@interface SBRecordingIndicatorManager
+ (BOOL)_supportsSecureIndicator;
- (BOOL)_supportsStatusBarItem;
- (BOOL)canSystemApertureRegisterRecordingIndicatorElement;
- (BOOL)isIndicatorVisible;
- (BOOL)isIndicatorVisibleAtStatusBarLocation;
- (BOOL)isSystemApertureEmpty;
- (BOOL)systemApertureIsSoLargeThatTheStatusBarIsProbablyHidden;
- (NSSet)activeCameraAndMicrophoneActivityAttributions;
- (SAInvalidatable)recordingIndicatorElementAssertion;
- (SBRecordingIndicatorManager)initWithWindowScene:(id)a3;
- (SBRecordingIndicatorSystemApertureElement)recordingIndicatorElement;
- (SBWindowScene)windowScene;
- (id)_indicatorIdentifierForSensorType:(int64_t)a3;
- (uint64_t)_configureSupportForRotatingIndicator;
- (unint64_t)_indicatorTypeForSensorType:(int64_t)a3;
- (unint64_t)displayMode;
- (void)_createRecordingIndicatorForStandaloneLocation;
- (void)_createRecordingIndicatorForStatusBarLocation;
- (void)_createRecordingIndicatorForSystemApertureLocation;
- (void)_dataProviderDidUpdate:(id)a3;
- (void)_setIndicatorVisible:(BOOL)a3 atLocation:(unint64_t)a4;
- (void)_updateIndicatorStyleForSensorActivityAttributions:(id)a3;
- (void)_updateIndicatorViewForSensorType:(int64_t)a3;
- (void)_updateRecordingIndicatorForStatusBarChanges;
- (void)_updateRecordingIndicatorLocationIfNecessary;
- (void)_updateSystemApertureElementAssertion;
- (void)activeInterfaceOrientationDidChangeToOrientation:(int64_t)a3 willAnimateWithDuration:(double)a4 fromOrientation:(int64_t)a5;
- (void)activityDidChangeForSensorActivityDataProvider:(id)a3;
- (void)controlCenterDidDismiss:(id)a3;
- (void)controlCenterWillPresent:(id)a3;
- (void)dealloc;
- (void)differentiateWithoutColorDidChange:(id)a3;
- (void)recordingIndicatorViewController:(id)a3 didUpdateIndicatorState:(unint64_t)a4;
- (void)setActiveCameraAndMicrophoneActivityAttributions:(id)a3;
- (void)setCanSystemApertureRegisterRecordingIndicatorElement:(BOOL)a3;
- (void)setIndicatorVisible:(BOOL)a3;
- (void)setIndicatorVisibleAtStatusBarLocation:(BOOL)a3;
- (void)setRecordingIndicatorElement:(id)a3;
- (void)setRecordingIndicatorElementAssertion:(id)a3;
- (void)setSystemApertureEmpty:(BOOL)a3;
- (void)setSystemApertureIsSoLargeThatTheStatusBarIsProbablyHidden:(BOOL)a3;
- (void)setWindowScene:(id)a3;
- (void)settings:(id)a3 changedValueForKey:(id)a4;
- (void)significantTimeChange:(id)a3;
- (void)systemApertureLayoutDidChange:(id)a3;
@end

@implementation SBRecordingIndicatorManager

- (void)_updateRecordingIndicatorForStatusBarChanges
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(SBRecordingIndicatorManager *)self displayMode];
  if (v3 == 4)
  {
    [(SBRecordingIndicatorManager *)self _updateRecordingIndicatorLocationIfNecessary];
  }
  else if (v3 == 2 && [(SBRecordingIndicatorManager *)self isIndicatorVisible])
  {
    v4 = [(UIWindow *)self->_recordingIndicatorWindow _sbWindowScene];
    v5 = [v4 statusBarManager];
    v6 = [v5 assertionManager];

    int v7 = [v6 isFrontmostStatusBarPartHidden:2];
    if (self->_indicatorStatusBarPartIsHidden == v7) {
      goto LABEL_16;
    }
    BOOL v8 = v7;
    v9 = SBLogStatusBarish();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = NSStringFromBOOL();
      v11 = NSStringFromBOOL();
      int v14 = 138543618;
      v15 = v10;
      __int16 v16 = 2114;
      v17 = v11;
      _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "[Recording Indicator] indicatorStatusBarPartIsHidden changed from %{public}@ to %{public}@", (uint8_t *)&v14, 0x16u);
    }
    self->_indicatorStatusBarPartIsHidden = v8;
    if (self->_indicatorIsHiddenForControlCenter) {
      goto LABEL_16;
    }
    recordingIndicatorViewController = self->_recordingIndicatorViewController;
    if (v8)
    {
      if ([(SBRecordingIndicatorViewController *)recordingIndicatorViewController indicatorState] == 1)
      {
LABEL_16:

        return;
      }
      recordingIndicatorViewController = self->_recordingIndicatorViewController;
      uint64_t v13 = 1;
    }
    else
    {
      uint64_t v13 = 0;
    }
    [(SBRecordingIndicatorViewController *)recordingIndicatorViewController updateIndicatorVisibilityWithFastFadeAnimation:v13];
    [(SBRecordingIndicatorManager *)self _setIndicatorVisible:!v8 atLocation:1];
    goto LABEL_16;
  }
}

- (unint64_t)displayMode
{
  return self->_displayMode;
}

- (void)_updateSystemApertureElementAssertion
{
  BOOL v3 = [(SBRecordingIndicatorManager *)self isIndicatorVisible];
  unint64_t v4 = [(SBRecordingIndicatorViewController *)self->_recordingIndicatorViewControllerSystemAperturePortal indicatorState];
  int v5 = [(SAInvalidatable *)self->_recordingIndicatorElementAssertion isValid];
  if (!v3 && !v4 && v5 != 0)
  {
    int v7 = SBLogStatusBarish();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "[Recording Indicator] Invalidating SystemAperture element", buf, 2u);
    }

    [(SAInvalidatable *)self->_recordingIndicatorElementAssertion invalidateWithReason:@"SBRecordingIndicatorViewController isIndicatorIdleAndOff changed"];
    recordingIndicatorElementAssertion = self->_recordingIndicatorElementAssertion;
    self->_recordingIndicatorElementAssertion = 0;
LABEL_13:

    goto LABEL_14;
  }
  if (((v5 | !v3) & 1) == 0)
  {
    v9 = SBLogStatusBarish();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "[Recording Indicator] Registering SystemAperture element", v12, 2u);
    }

    recordingIndicatorElementAssertion = [(id)SBApp systemApertureControllerForMainDisplay];
    v10 = [recordingIndicatorElementAssertion registerElement:self->_recordingIndicatorElement];
    v11 = self->_recordingIndicatorElementAssertion;
    self->_recordingIndicatorElementAssertion = v10;

    goto LABEL_13;
  }
LABEL_14:
  [(SBRecordingIndicatorManager *)self _updateRecordingIndicatorLocationIfNecessary];
}

- (void)_updateRecordingIndicatorLocationIfNecessary
{
  if (![(SBRecordingIndicatorManager *)self isIndicatorVisible])
  {
    int v5 = self;
    uint64_t v6 = 0;
LABEL_9:
    [(SBRecordingIndicatorManager *)v5 _setIndicatorVisible:v6 atLocation:0];
    [(SBRecordingIndicatorManager *)self _setIndicatorVisible:0 atLocation:1];
    BOOL v3 = self;
    uint64_t v4 = 0;
    goto LABEL_10;
  }
  if ([(SBRecordingIndicatorManager *)self isSystemApertureEmpty]
    && self->_canSystemApertureRegisterRecordingIndicatorElement)
  {
    [(SBRecordingIndicatorManager *)self _setIndicatorVisible:0 atLocation:0];
    [(SBRecordingIndicatorManager *)self _setIndicatorVisible:0 atLocation:1];
    BOOL v3 = self;
    uint64_t v4 = 1;
LABEL_10:
    [(SBRecordingIndicatorManager *)v3 _setIndicatorVisible:v4 atLocation:2];
    return;
  }
  unint64_t v7 = [(SBRecordingIndicatorManager *)self displayMode];
  if (v7 != 4)
  {
    if (v7 != 3) {
      return;
    }
    int v5 = self;
    uint64_t v6 = 1;
    goto LABEL_9;
  }
  BOOL v8 = [(UIWindow *)self->_recordingIndicatorWindow _sbWindowScene];
  v9 = [v8 statusBarManager];
  id v11 = [v9 assertionManager];

  LODWORD(v8) = [v11 isFrontmostStatusBarPartHidden:2];
  uint64_t v10 = (v8 | [(SBRecordingIndicatorManager *)self systemApertureIsSoLargeThatTheStatusBarIsProbablyHidden]) ^ 1;
  -[SBRecordingIndicatorManager _setIndicatorVisible:atLocation:](self, "_setIndicatorVisible:atLocation:");
  [(SBRecordingIndicatorManager *)self _setIndicatorVisible:v10 atLocation:1];
  [(SBRecordingIndicatorManager *)self _setIndicatorVisible:0 atLocation:2];
}

- (void)_setIndicatorVisible:(BOOL)a3 atLocation:(unint64_t)a4
{
  BOOL v4 = a3;
  if (a4 == 2)
  {
    unint64_t v8 = [(SBRecordingIndicatorViewController *)self->_recordingIndicatorViewControllerSystemAperturePortal indicatorState];
    if (v4)
    {
      if (v8 - 1 < 2) {
        return;
      }
      recordingIndicatorViewControllerSystemAperturePortal = self->_recordingIndicatorViewControllerSystemAperturePortal;
      goto LABEL_10;
    }
    if (v8) {
      BOOL v11 = v8 == 3;
    }
    else {
      BOOL v11 = 1;
    }
    if (!v11)
    {
      recordingIndicatorViewControllerSystemAperturePortal = self->_recordingIndicatorViewControllerSystemAperturePortal;
      goto LABEL_24;
    }
  }
  else
  {
    if (a4 != 1)
    {
      if (a4) {
        return;
      }
      unint64_t v6 = [(SBRecordingIndicatorViewController *)self->_recordingIndicatorViewController indicatorState];
      if (v4)
      {
        if (v6 - 1 < 2) {
          return;
        }
        recordingIndicatorViewControllerSystemAperturePortal = self->_recordingIndicatorViewController;
LABEL_10:
        uint64_t v9 = 1;
LABEL_25:
        [(SBRecordingIndicatorViewController *)recordingIndicatorViewControllerSystemAperturePortal updateIndicatorVisibility:v9];
        return;
      }
      if (!v6 || v6 == 3) {
        return;
      }
      recordingIndicatorViewControllerSystemAperturePortal = self->_recordingIndicatorViewController;
LABEL_24:
      uint64_t v9 = 0;
      goto LABEL_25;
    }
    BOOL v10 = a3;
    [(SBRecordingIndicatorManager *)self setIndicatorVisibleAtStatusBarLocation:v10];
  }
}

- (BOOL)isIndicatorVisible
{
  return self->_indicatorVisible;
}

- (void)setIndicatorVisibleAtStatusBarLocation:(BOOL)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (self->_indicatorVisibleAtStatusBarLocation != a3)
  {
    BOOL v3 = a3;
    self->_indicatorVisibleAtStatusBarLocation = a3;
    BOOL v4 = SBLogStatusBarish();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = @"off";
      if (v3) {
        int v5 = @"on";
      }
      int v7 = 138543362;
      unint64_t v8 = v5;
      _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "[Recording Indicator] Turning %{public}@ at Status Bar location (via status bar data change)", (uint8_t *)&v7, 0xCu);
    }

    unint64_t v6 = [(id)SBApp statusBarStateAggregator];
    [v6 updateStatusBarItem:28];
  }
}

- (BOOL)isSystemApertureEmpty
{
  return self->_systemApertureEmpty;
}

- (void)recordingIndicatorViewController:(id)a3 didUpdateIndicatorState:(unint64_t)a4
{
  int v5 = (SBRecordingIndicatorViewController *)a3;
  v12 = v5;
  if (self->_recordingIndicatorViewControllerSystemAperturePortal == v5)
  {
    [(SBRecordingIndicatorManager *)self _updateSystemApertureElementAssertion];
    int v5 = v12;
  }
  unint64_t v6 = [(SBRecordingIndicatorViewController *)v5 viewIfLoaded];
  int v7 = [v6 window];
  unint64_t v8 = [v7 windowScene];

  uint64_t v9 = [v8 traitCollection];
  uint64_t v10 = [v9 _backlightLuminance];

  if (v10 == 1)
  {
    BOOL v11 = [v8 _backlightSceneEnvironment];
    [v11 invalidateAllTimelinesForReason:@"recording indicator visibility change"];
  }
}

- (void)activityDidChangeForSensorActivityDataProvider:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [v4 activeCameraAndMicrophoneActivityAttributions];
  if (![(NSSet *)self->_activeCameraAndMicrophoneActivityAttributions isEqualToSet:v5])
  {
    objc_storeStrong((id *)&self->_activeCameraAndMicrophoneActivityAttributions, v5);
    unint64_t v6 = SBLogStatusBarish();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138543362;
      unint64_t v8 = v5;
      _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "[Recording Indicator] Active camera/microphone activity changed:\n%{public}@", (uint8_t *)&v7, 0xCu);
    }

    [(SBRecordingIndicatorManager *)self _dataProviderDidUpdate:v4];
  }
}

- (void)_dataProviderDidUpdate:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_storeStrong((id *)&self->_dataProvider, a3);
  if (self->_visibilityIsForcedByPrototypeSettings)
  {
    unint64_t v6 = SBLogStatusBarish();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "[Recording Indicator] Visibility is forced by prototype settings", buf, 2u);
    }
    goto LABEL_23;
  }
  unint64_t v6 = [v5 activeCameraAndMicrophoneActivityAttributions];
  if ([v6 count])
  {
    [(SBRecordingIndicatorManager *)self _updateIndicatorStyleForSensorActivityAttributions:v6];
    int v7 = self;
    uint64_t v8 = 1;
LABEL_6:
    [(SBRecordingIndicatorManager *)v7 setIndicatorVisible:v8];
    goto LABEL_21;
  }
  if ([(SBRecordingIndicatorManager *)self isIndicatorVisible])
  {
    uint64_t v9 = [MEMORY[0x1E4F1C9C8] date];
    [v9 timeIntervalSinceDate:self->_indicatorDisplayTime];
    double v11 = v10;

    if (v11 >= 0.0)
    {
      if (v11 > 2.0)
      {
        int v7 = self;
        uint64_t v8 = 0;
        goto LABEL_6;
      }
    }
    else
    {
      v12 = SBLogStatusBarish();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D85BA000, v12, OS_LOG_TYPE_DEFAULT, "[Recording Indicator] Elapsed time should not be negative, did the system time change?", buf, 2u);
      }

      double v11 = 0.0;
    }
    BOOL v13 = [(NSTimer *)self->_minimumTimeOnScreenTimer isValid];
    int v14 = SBLogStatusBarish();
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
    if (v13)
    {
      if (v15)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D85BA000, v14, OS_LOG_TYPE_DEFAULT, "[Recording Indicator] Timer is already valid", buf, 2u);
      }
    }
    else
    {
      if (v15)
      {
        *(_DWORD *)buf = 134349312;
        uint64_t v26 = 0x4000000000000000;
        __int16 v27 = 2050;
        double v28 = v11;
        _os_log_impl(&dword_1D85BA000, v14, OS_LOG_TYPE_DEFAULT, "[Recording Indicator] Starting a timer to keep the indicator on screen for a minimum of %{public}.2f seconds (elapsed %{public}.2fs)", buf, 0x16u);
      }

      __int16 v16 = (void *)MEMORY[0x1E4F1CB00];
      uint64_t v19 = MEMORY[0x1E4F143A8];
      uint64_t v20 = 3221225472;
      v21 = __54__SBRecordingIndicatorManager__dataProviderDidUpdate___block_invoke;
      v22 = &unk_1E6AFAC30;
      v23 = self;
      id v24 = v5;
      v17 = [v16 scheduledTimerWithTimeInterval:0 repeats:&v19 block:2.0 - v11];
      minimumTimeOnScreenTimer = self->_minimumTimeOnScreenTimer;
      self->_minimumTimeOnScreenTimer = v17;
    }
  }
LABEL_21:
  if ([(SBRecordingIndicatorManager *)self _supportsStatusBarItem]) {
    [(SBRecordingIndicatorManager *)self _updateRecordingIndicatorForStatusBarChanges];
  }
LABEL_23:
}

- (void)setIndicatorVisible:(BOOL)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (self->_indicatorVisible != a3)
  {
    BOOL v3 = a3;
    self->_indicatorVisible = a3;
    id v5 = SBLogStatusBarish();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v6 = @"off";
      if (v3) {
        unint64_t v6 = @"on";
      }
      int v19 = 138543362;
      uint64_t v20 = v6;
      _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "[Recording Indicator] Turning %{public}@...", (uint8_t *)&v19, 0xCu);
    }

    [(NSTimer *)self->_minimumTimeOnScreenTimer invalidate];
    minimumTimeOnScreenTimer = self->_minimumTimeOnScreenTimer;
    self->_minimumTimeOnScreenTimer = 0;

    if (v3)
    {
      uint64_t v8 = [MEMORY[0x1E4F1C9C8] date];
      indicatorDisplayTime = self->_indicatorDisplayTime;
      self->_indicatorDisplayTime = v8;
    }
    else
    {
      indicatorDisplayTime = self->_indicatorDisplayTime;
      self->_indicatorDisplayTime = 0;
    }

    unint64_t v10 = [(SBRecordingIndicatorManager *)self displayMode];
    if (v10 < 2)
    {
      double v11 = self;
      BOOL v12 = v3;
      uint64_t v13 = 0;
    }
    else
    {
      if (v10 - 3 < 2)
      {
        [(SBRecordingIndicatorManager *)self _updateSystemApertureElementAssertion];
        if (v3) {
          [(SBRecordingIndicatorSystemApertureElement *)self->_recordingIndicatorElement pulse];
        }
        return;
      }
      if (v10 != 2) {
        return;
      }
      if (v3)
      {
        int v14 = [(UIWindow *)self->_recordingIndicatorWindow _sbWindowScene];
        BOOL v15 = [v14 statusBarManager];
        __int16 v16 = [v15 assertionManager];
        uint64_t v17 = [v16 isFrontmostStatusBarHidden];
        uint64_t v18 = v17 ^ 1;
        [(SBRecordingIndicatorManager *)self _setIndicatorVisible:v17 atLocation:0];
        [(SBRecordingIndicatorManager *)self _setIndicatorVisible:v18 atLocation:1];

        return;
      }
      [(SBRecordingIndicatorManager *)self _setIndicatorVisible:0 atLocation:0];
      double v11 = self;
      BOOL v12 = 0;
      uint64_t v13 = 1;
    }
    [(SBRecordingIndicatorManager *)v11 _setIndicatorVisible:v12 atLocation:v13];
  }
}

- (void)_updateIndicatorStyleForSensorActivityAttributions:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v11;
      while (2)
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v5);
          }
          if (!objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9), "sensor", (void)v10))
          {
            [(SBRecordingIndicatorManager *)self _updateIndicatorViewForSensorType:0];

            goto LABEL_12;
          }
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }

    [(SBRecordingIndicatorManager *)self _updateIndicatorViewForSensorType:1];
  }
LABEL_12:
}

- (void)_updateIndicatorViewForSensorType:(int64_t)a3
{
  unint64_t v5 = -[SBRecordingIndicatorManager _indicatorTypeForSensorType:](self, "_indicatorTypeForSensorType:");
  [(SBRecordingIndicatorViewController *)self->_recordingIndicatorViewController updateIndicatorType:v5];
  [(SBRecordingIndicatorViewController *)self->_recordingIndicatorViewControllerUIKitStatusBarPortal updateIndicatorType:v5];
  [(SBRecordingIndicatorViewController *)self->_recordingIndicatorViewControllerSystemAperturePortal updateIndicatorType:v5];
  id v7 = [(SBRecordingIndicatorManager *)self _indicatorIdentifierForSensorType:a3];
  uint64_t v6 = [(SBRecordingIndicatorViewController *)self->_recordingIndicatorViewController indicatorView];
  [v6 setAccessibilityIdentifier:v7];
}

- (BOOL)_supportsStatusBarItem
{
  return (([(SBRecordingIndicatorManager *)self displayMode] - 2) & 0xFFFFFFFFFFFFFFFDLL) == 0;
}

- (unint64_t)_indicatorTypeForSensorType:(int64_t)a3
{
  if (a3 != 1) {
    return 0;
  }
  if (UIAccessibilityShouldDifferentiateWithoutColor()) {
    return 2;
  }
  return 1;
}

- (id)_indicatorIdentifierForSensorType:(int64_t)a3
{
  if (a3 == 1) {
    return @"microphone-recording-indicator";
  }
  else {
    return @"camera-recording-indicator";
  }
}

- (SBRecordingIndicatorManager)initWithWindowScene:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)SBRecordingIndicatorManager;
  unint64_t v5 = [(SBRecordingIndicatorManager *)&v18 init];
  uint64_t v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_windowScene, v4);
    if ([(id)objc_opt_class() _supportsSecureIndicator]
      && [v4 isMainDisplayWindowScene])
    {
      uint64_t v7 = SBFEffectiveArtworkSubtype();
      if (v7 > 2795)
      {
        if (v7 != 2796 && v7 != 2868) {
          goto LABEL_22;
        }
      }
      else if (v7 != 2556 && v7 != 2622)
      {
LABEL_22:
        v6->_displayMode = 1;
        [(SBRecordingIndicatorManager *)v6 _createRecordingIndicatorForStandaloneLocation];
        [(SBRecordingIndicatorManager *)v6 _createRecordingIndicatorForSecureIndicator];
        goto LABEL_26;
      }
LABEL_25:
      v6->_displayMode = 3;
      [(SBRecordingIndicatorManager *)v6 _createRecordingIndicatorForStandaloneLocation];
      [(SBRecordingIndicatorManager *)v6 _createRecordingIndicatorForSystemApertureLocation];
      goto LABEL_26;
    }
    if (__sb__runningInSpringBoard())
    {
      if (SBFEffectiveDeviceClass() == 2 || SBFEffectiveHomeButtonType() != 2) {
        goto LABEL_19;
      }
LABEL_15:
      uint64_t v10 = SBFEffectiveArtworkSubtype();
      if (v10 > 2795)
      {
        if (v10 == 2796 || v10 == 2868) {
          goto LABEL_25;
        }
      }
      else if (v10 == 2556 || v10 == 2622)
      {
        goto LABEL_25;
      }
      v6->_displayMode = 0;
      [(SBRecordingIndicatorManager *)v6 _createRecordingIndicatorForStandaloneLocation];
      goto LABEL_26;
    }
    uint64_t v8 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v8 userInterfaceIdiom] == 1)
    {
    }
    else
    {
      uint64_t v9 = SBFEffectiveHomeButtonType();

      if (v9 == 2) {
        goto LABEL_15;
      }
    }
LABEL_19:
    v6->_displayMode = 2;
    [(SBRecordingIndicatorManager *)v6 _createRecordingIndicatorForStandaloneLocation];
    [(SBRecordingIndicatorManager *)v6 _createRecordingIndicatorForStatusBarLocation];
LABEL_26:
    long long v11 = [(id)SBApp sensorActivityDataProvider];
    [v11 addObserver:v6];
    long long v12 = +[SBRecordingIndicatorDomain rootSettings];
    [v12 addKeyObserver:v6];

    long long v13 = [(UIWindow *)v6->_recordingIndicatorWindow _sbWindowScene];
    int v14 = [v13 statusBarManager];
    uint64_t v15 = [v14 assertionManager];
    [v15 addObserver:v6];

    __int16 v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v16 addObserver:v6 selector:sel_controlCenterWillPresent_ name:@"SBControlCenterControllerWillPresentNotification" object:0];
    [v16 addObserver:v6 selector:sel_controlCenterDidDismiss_ name:@"SBControlCenterControllerDidDismissNotification" object:0];
    [v16 addObserver:v6 selector:sel_systemApertureLayoutDidChange_ name:@"SBSystemApertureLayoutDidChangeNotification" object:0];
    [v16 addObserver:v6 selector:sel_differentiateWithoutColorDidChange_ name:*MEMORY[0x1E4F43498] object:0];
    [v16 addObserver:v6 selector:sel_significantTimeChange_ name:@"SBSignificantTimeChangedNotification" object:0];
    [(SBRecordingIndicatorManager *)v6 activityDidChangeForSensorActivityDataProvider:v11];
  }
  return v6;
}

- (void)_createRecordingIndicatorForStandaloneLocation
{
  id v9 = [(SBRecordingIndicatorManager *)self windowScene];
  BOOL v3 = [[SBRecordingIndicatorWindow alloc] initWithWindowScene:v9 debugName:@"Recording Indicator"];
  id v4 = [[SBRecordingIndicatorViewController alloc] initForLocation:0 windowScene:v9];
  recordingIndicatorViewController = self->_recordingIndicatorViewController;
  self->_recordingIndicatorViewController = v4;

  [(SBRecordingIndicatorWindow *)v3 setRootViewController:self->_recordingIndicatorViewController];
  [(SBRecordingIndicatorWindow *)v3 setWindowLevel:*MEMORY[0x1E4F43CD0] + 10.0];
  [(SBRecordingIndicatorWindow *)v3 setUserInteractionEnabled:0];
  [(SBWindow *)v3 setHidden:0];
  recordingIndicatorWindow = self->_recordingIndicatorWindow;
  self->_recordingIndicatorWindow = &v3->super.super.super.super.super;
  uint64_t v7 = v3;

  uint64_t v8 = +[SBReachabilityManager sharedInstance];
  [v8 ignoreWindowForReachability:self->_recordingIndicatorWindow];

  [(SBRecordingIndicatorViewController *)self->_recordingIndicatorViewController setDelegate:self];
}

- (void)_createRecordingIndicatorForStatusBarLocation
{
  id v9 = [(SBRecordingIndicatorManager *)self windowScene];
  BOOL v3 = [[SBRecordingIndicatorWindow alloc] initWithWindowScene:v9 debugName:@"Recording Indicator (UIKit Status Bar Portal)"];
  id v4 = [[SBRecordingIndicatorViewController alloc] initForLocation:1 windowScene:v9];
  recordingIndicatorViewControllerUIKitStatusBarPortal = self->_recordingIndicatorViewControllerUIKitStatusBarPortal;
  self->_recordingIndicatorViewControllerUIKitStatusBarPortal = v4;

  [(SBRecordingIndicatorWindow *)v3 setRootViewController:self->_recordingIndicatorViewControllerUIKitStatusBarPortal];
  [(SBRecordingIndicatorWindow *)v3 setWindowLevel:*MEMORY[0x1E4F43F20] + -1.0];
  [(SBRecordingIndicatorWindow *)v3 setUserInteractionEnabled:0];
  [(SBWindow *)v3 setHidden:0];
  objc_storeStrong((id *)&self->_recordingIndicatorWindowUIKitStatusBarPortal, v3);
  SBStatusBarIsSpeakeasy();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = [(SBRecordingIndicatorViewController *)self->_recordingIndicatorViewControllerUIKitStatusBarPortal indicatorView];
  uint64_t v8 = [v9 screen];
  [v6 registerSensorActivityIndicator:v7 forScreen:v8];
  [(SBRecordingIndicatorViewController *)self->_recordingIndicatorViewControllerUIKitStatusBarPortal setDelegate:self];
  -[SBRecordingIndicatorManager _configureSupportForRotatingIndicator]((uint64_t)self);
}

- (uint64_t)_configureSupportForRotatingIndicator
{
  if (result)
  {
    uint64_t v1 = result;
    [(id)SBApp addActiveOrientationObserver:result];
    uint64_t v2 = [(id)SBApp activeInterfaceOrientation];
    BOOL v3 = *(void **)(v1 + 32);
    return [v3 setActiveInterfaceOrientation:v2 withDuration:0.0];
  }
  return result;
}

- (void)_createRecordingIndicatorForSystemApertureLocation
{
  id v12 = [(SBRecordingIndicatorManager *)self windowScene];
  BOOL v3 = [[SBRecordingIndicatorWindow alloc] initWithWindowScene:v12 debugName:@"Recording Indicator (SystemAperture Portal)"];
  id v4 = [[SBRecordingIndicatorViewController alloc] initForLocation:2 windowScene:v12];
  recordingIndicatorViewControllerSystemAperturePortal = self->_recordingIndicatorViewControllerSystemAperturePortal;
  self->_recordingIndicatorViewControllerSystemAperturePortal = v4;

  [(SBRecordingIndicatorWindow *)v3 setRootViewController:self->_recordingIndicatorViewControllerSystemAperturePortal];
  [(SBRecordingIndicatorWindow *)v3 setWindowLevel:*MEMORY[0x1E4F43CD0] + 5.0];
  [(SBRecordingIndicatorWindow *)v3 setUserInteractionEnabled:0];
  [(SBWindow *)v3 setHidden:0];
  recordingIndicatorWindowSystemAperturePortal = self->_recordingIndicatorWindowSystemAperturePortal;
  self->_recordingIndicatorWindowSystemAperturePortal = &v3->super.super.super.super.super;
  uint64_t v7 = v3;

  uint64_t v8 = [(SBRecordingIndicatorViewController *)self->_recordingIndicatorViewControllerSystemAperturePortal indicatorContainerView];
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F43298]) initWithSourceView:v8];
  [v9 setMatchesAlpha:1];
  uint64_t v10 = [[SBRecordingIndicatorSystemApertureElement alloc] initWithRecordingIndicatorView:v9 recordingIndicatorManager:self];
  recordingIndicatorElement = self->_recordingIndicatorElement;
  self->_recordingIndicatorElement = v10;

  [(SBRecordingIndicatorViewController *)self->_recordingIndicatorViewControllerSystemAperturePortal setDelegate:self];
}

- (void)dealloc
{
  [(SAInvalidatable *)self->_recordingIndicatorElementAssertion invalidateWithReason:@"dealloc"];
  [(SBSensorActivityDataProvider *)self->_dataProvider removeObserver:self];
  BOOL v3 = +[SBRecordingIndicatorDomain rootSettings];
  [v3 removeKeyObserver:self];

  id v4 = [(UIWindow *)self->_recordingIndicatorWindow _sbWindowScene];
  unint64_t v5 = [v4 statusBarManager];
  uint64_t v6 = [v5 assertionManager];
  [v6 removeObserver:self];

  uint64_t v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v7 removeObserver:self];

  v8.receiver = self;
  v8.super_class = (Class)SBRecordingIndicatorManager;
  [(SBRecordingIndicatorManager *)&v8 dealloc];
}

uint64_t __54__SBRecordingIndicatorManager__dataProviderDidUpdate___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 72) invalidate];
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  return [v2 _dataProviderDidUpdate:v3];
}

+ (BOOL)_supportsSecureIndicator
{
  if (_supportsSecureIndicator_onceToken != -1) {
    dispatch_once(&_supportsSecureIndicator_onceToken, &__block_literal_global_49);
  }
  return _supportsSecureIndicator_supportsSecureIndicator;
}

uint64_t __55__SBRecordingIndicatorManager__supportsSecureIndicator__block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  _supportsSecureIndicator_supportsSecureIndicator = result;
  return result;
}

- (void)activeInterfaceOrientationDidChangeToOrientation:(int64_t)a3 willAnimateWithDuration:(double)a4 fromOrientation:(int64_t)a5
{
}

- (void)controlCenterWillPresent:(id)a3
{
  if ([(SBRecordingIndicatorManager *)self displayMode] == 2)
  {
    if ([(SBRecordingIndicatorManager *)self isIndicatorVisible]
      && self->_indicatorStatusBarPartIsHidden)
    {
      id v4 = SBLogStatusBarish();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)unint64_t v5 = 0;
        _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "[Recording Indicator] Now hiding for Control Center", v5, 2u);
      }

      [(SBRecordingIndicatorViewController *)self->_recordingIndicatorViewController updateIndicatorVisibilityWithFastFadeAnimation:0];
    }
    self->_indicatorIsHiddenForControlCenter = 1;
  }
}

- (void)controlCenterDidDismiss:(id)a3
{
  if ([(SBRecordingIndicatorManager *)self displayMode] == 2)
  {
    if ([(SBRecordingIndicatorManager *)self isIndicatorVisible]
      && self->_indicatorStatusBarPartIsHidden)
    {
      id v4 = SBLogStatusBarish();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)unint64_t v5 = 0;
        _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "[Recording Indicator] No longer hiding for Control Center", v5, 2u);
      }

      [(SBRecordingIndicatorViewController *)self->_recordingIndicatorViewController updateIndicatorVisibilityWithFastFadeAnimation:1];
    }
    self->_indicatorIsHiddenForControlCenter = 0;
  }
}

- (void)systemApertureLayoutDidChange:(id)a3
{
  id v17 = [a3 userInfo];
  id v4 = [v17 objectForKey:@"SBSystemApertureOriginatingDisplayIdentity"];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  uint64_t v6 = [WeakRetained _sbDisplayConfiguration];
  uint64_t v7 = [v6 identity];

  if (v7 == v4)
  {
    objc_super v8 = [v17 objectForKey:@"SBSystemApertureVisibleElementIdentifiers"];
    id v9 = v8;
    if (v8) {
      BOOL v10 = [v8 count] == 0;
    }
    else {
      BOOL v10 = 1;
    }
    [(SBRecordingIndicatorManager *)self setSystemApertureEmpty:v10];
    long long v11 = [v17 objectForKey:@"SBSystemApertureCanRegisterRecordingIndicator"];
    uint64_t v12 = [v11 BOOLValue];

    [(SBRecordingIndicatorManager *)self setCanSystemApertureRegisterRecordingIndicatorElement:v12];
    unint64_t v13 = [(SBRecordingIndicatorManager *)self displayMode];
    if (v13 == 4)
    {
      int v14 = [v17 objectForKey:@"SBSystemApertureFrames"];
      if ([v14 count])
      {
        uint64_t v15 = [v14 firstObject];
        [v15 CGRectValue];
        uint64_t v16 = BSFloatGreaterThanFloat();
        if (self->_systemApertureIsSoLargeThatTheStatusBarIsProbablyHidden != v16)
        {
          [(SBRecordingIndicatorManager *)self setSystemApertureIsSoLargeThatTheStatusBarIsProbablyHidden:v16];
          [(SBRecordingIndicatorManager *)self _updateRecordingIndicatorLocationIfNecessary];
        }
      }
    }
    else if (v13 == 3)
    {
      [(SBRecordingIndicatorManager *)self _updateRecordingIndicatorLocationIfNecessary];
    }
  }
}

- (void)differentiateWithoutColorDidChange:(id)a3
{
  id v4 = SBLogStatusBarish();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unint64_t v5 = 0;
    _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "[Recording Indicator] Received UIAccessibility setting differentiateWithoutColorDidChange notification, simulating Recording Indicator UI updates...", v5, 2u);
  }

  [(SBRecordingIndicatorManager *)self _dataProviderDidUpdate:self->_dataProvider];
}

- (void)significantTimeChange:(id)a3
{
  if ([(SBRecordingIndicatorManager *)self isIndicatorVisible])
  {
    id v4 = SBLogStatusBarish();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "[Recording Indicator] Resetting indicator display time as system time changed and we are showing the indicator", v7, 2u);
    }

    unint64_t v5 = [MEMORY[0x1E4F1C9C8] date];
    indicatorDisplayTime = self->_indicatorDisplayTime;
    self->_indicatorDisplayTime = v5;
  }
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  unint64_t v5 = +[SBRecordingIndicatorDomain rootSettings];
  uint64_t v6 = [v5 sensorType];

  if (v6 == 1)
  {
    self->_visibilityIsForcedByPrototypeSettings = 1;
    [(SBRecordingIndicatorManager *)self setIndicatorVisible:1];
    uint64_t v7 = self;
    uint64_t v8 = 0;
    goto LABEL_5;
  }
  if (v6 == 2)
  {
    self->_visibilityIsForcedByPrototypeSettings = 1;
    [(SBRecordingIndicatorManager *)self setIndicatorVisible:1];
    uint64_t v7 = self;
    uint64_t v8 = 1;
LABEL_5:
    [(SBRecordingIndicatorManager *)v7 _updateIndicatorViewForSensorType:v8];
    return;
  }
  self->_visibilityIsForcedByPrototypeSettings = 0;
  [(SBRecordingIndicatorManager *)self setIndicatorVisible:0];
}

- (BOOL)isIndicatorVisibleAtStatusBarLocation
{
  return self->_indicatorVisibleAtStatusBarLocation;
}

- (SBWindowScene)windowScene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  return (SBWindowScene *)WeakRetained;
}

- (void)setWindowScene:(id)a3
{
}

- (NSSet)activeCameraAndMicrophoneActivityAttributions
{
  return self->_activeCameraAndMicrophoneActivityAttributions;
}

- (void)setActiveCameraAndMicrophoneActivityAttributions:(id)a3
{
}

- (SBRecordingIndicatorSystemApertureElement)recordingIndicatorElement
{
  return self->_recordingIndicatorElement;
}

- (void)setRecordingIndicatorElement:(id)a3
{
}

- (SAInvalidatable)recordingIndicatorElementAssertion
{
  return self->_recordingIndicatorElementAssertion;
}

- (void)setRecordingIndicatorElementAssertion:(id)a3
{
}

- (BOOL)systemApertureIsSoLargeThatTheStatusBarIsProbablyHidden
{
  return self->_systemApertureIsSoLargeThatTheStatusBarIsProbablyHidden;
}

- (void)setSystemApertureIsSoLargeThatTheStatusBarIsProbablyHidden:(BOOL)a3
{
  self->_systemApertureIsSoLargeThatTheStatusBarIsProbablyHidden = a3;
}

- (void)setSystemApertureEmpty:(BOOL)a3
{
  self->_systemApertureEmpty = a3;
}

- (BOOL)canSystemApertureRegisterRecordingIndicatorElement
{
  return self->_canSystemApertureRegisterRecordingIndicatorElement;
}

- (void)setCanSystemApertureRegisterRecordingIndicatorElement:(BOOL)a3
{
  self->_canSystemApertureRegisterRecordingIndicatorElement = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordingIndicatorElementAssertion, 0);
  objc_storeStrong((id *)&self->_recordingIndicatorElement, 0);
  objc_storeStrong((id *)&self->_activeCameraAndMicrophoneActivityAttributions, 0);
  objc_destroyWeak((id *)&self->_windowScene);
  objc_storeStrong((id *)&self->_dataProvider, 0);
  objc_storeStrong((id *)&self->_minimumTimeOnScreenTimer, 0);
  objc_storeStrong((id *)&self->_indicatorDisplayTime, 0);
  objc_storeStrong((id *)&self->_recordingIndicatorViewControllerSystemAperturePortal, 0);
  objc_storeStrong((id *)&self->_recordingIndicatorViewControllerUIKitStatusBarPortal, 0);
  objc_storeStrong((id *)&self->_recordingIndicatorViewController, 0);
  objc_storeStrong((id *)&self->_recordingIndicatorWindowSystemAperturePortal, 0);
  objc_storeStrong((id *)&self->_recordingIndicatorWindowUIKitStatusBarPortal, 0);
  objc_storeStrong((id *)&self->_recordingIndicatorWindow, 0);
}

@end