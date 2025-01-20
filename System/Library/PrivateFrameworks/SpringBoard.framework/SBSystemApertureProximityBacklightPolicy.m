@interface SBSystemApertureProximityBacklightPolicy
- (BOOL)_isGracePeriodDisabledByEntitledApp;
- (BOOL)isSystemApertureBacklightPolicy;
- (BOOL)proximityBacklightPolicyTouchHandlingView:(id)a3 shouldConsumeTouchForHitTest:(CGPoint)a4 withEvent:(id)a5;
- (SBProximitySettings)_proximitySettings;
- (SBSystemApertureProximityBacklightPolicy)initWithConfiguration:(id)a3;
- (SBSystemApertureProximityBacklightPolicyDelegate)delegate;
- (double)_nontelephonyTouchAllowanceGracePeriod;
- (void)_objectThatCanPreventTouchesWithinProximityDidChange:(BOOL)a3 fromGracePeriod:(BOOL)a4;
- (void)_scheduleBacklightFactorToZeroForTouchWithinSystemAperture;
- (void)_setProximitySettings:(id)a3;
- (void)_startCancelingTouches;
- (void)_stopCancelingTouches;
- (void)dealloc;
- (void)proximitySensorManager:(id)a3 objectWithinProximityDidChange:(BOOL)a4;
- (void)proximitySensorManager:(id)a3 objectWithinProximityDidChange:(BOOL)a4 detectionMode:(int)a5;
- (void)proximitySensorManager:(id)a3 shouldSuppressBacklightChanges:(BOOL)a4;
- (void)setDelegate:(id)a3;
- (void)setSystemApertureBacklightPolicy:(BOOL)a3;
@end

@implementation SBSystemApertureProximityBacklightPolicy

- (SBSystemApertureProximityBacklightPolicy)initWithConfiguration:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SBSystemApertureProximityBacklightPolicy;
  v5 = [(SBDefaultProximityBacklightPolicy *)&v13 initWithConfiguration:v4];
  if (v5)
  {
    uint64_t v6 = [v4 sensorModeController];
    sensorModeController = v5->_sensorModeController;
    v5->_sensorModeController = (SBHIDUISensorModeController *)v6;

    uint64_t v8 = [v4 proximitySettings];
    proximitySettings = v5->_proximitySettings;
    v5->_proximitySettings = (SBProximitySettings *)v8;

    uint64_t v10 = [v4 systemGestureManager];
    systemGestureManager = v5->_systemGestureManager;
    v5->_systemGestureManager = (SBSystemGestureManager *)v10;

    BKSHIDServicesSetObjectInProximityIgnoresTouches();
  }

  return v5;
}

- (void)dealloc
{
  [(BSInvalidatable *)self->_suppressSystemGestures invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SBSystemApertureProximityBacklightPolicy;
  [(SBDefaultProximityBacklightPolicy *)&v3 dealloc];
}

- (void)proximitySensorManager:(id)a3 objectWithinProximityDidChange:(BOOL)a4
{
}

- (void)proximitySensorManager:(id)a3 shouldSuppressBacklightChanges:(BOOL)a4
{
  self->_suppressBacklightChanges = a4;
}

- (double)_nontelephonyTouchAllowanceGracePeriod
{
  objc_super v3 = [MEMORY[0x1E4F4F330] sharedInstance];
  id v4 = [v3 sensorCharacteristics];

  uint64_t v5 = [v4 suggestedSystemApertureGracePeriodForScreenOff];
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v6 = [(SBSystemApertureProximityBacklightPolicy *)self _proximitySettings];
    [v6 nonTelephonyTouchAllowanceGracePeriodDuration];
    double v8 = v7;
  }
  else
  {
    double v8 = (double)v5 / 1000.0;
  }

  return v8;
}

- (void)proximitySensorManager:(id)a3 objectWithinProximityDidChange:(BOOL)a4 detectionMode:(int)a5
{
  BOOL v6 = a4;
  *(void *)&v28[5] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  BOOL v9 = !self->_suppressBacklightChanges || !v6;
  if (v9 || self->_objectThatCanPreventTouchesInProximity)
  {
    if (self->_objectInProximityAccordingToProxManager != v6)
    {
      self->_objectInProximityAccordingToProxManager = v6;
      if (self->_touchAllowanceGracePeriodTimer)
      {
        uint64_t v10 = SBLogProximitySensor();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          v11 = NSStringFromBKSHIDServicesProximityDetectionMode();
          *(_DWORD *)buf = 67109378;
          v28[0] = v6;
          LOWORD(v28[1]) = 2114;
          *(void *)((char *)&v28[1] + 2) = v11;
          _os_log_impl(&dword_1D85BA000, v10, OS_LOG_TYPE_DEFAULT, "Canceling grace period due to incoming event (objectInProximity:%{BOOL}u mode:%{public}@)", buf, 0x12u);
        }
        [(NSTimer *)self->_touchAllowanceGracePeriodTimer invalidate];
        touchAllowanceGracePeriodTimer = self->_touchAllowanceGracePeriodTimer;
        self->_touchAllowanceGracePeriodTimer = 0;
      }
      [(SBSystemApertureProximityBacklightPolicy *)self _nontelephonyTouchAllowanceGracePeriod];
      if (v6
        && (double v14 = v13, v13 > 0.0)
        && ((BOOL v15 = [(SBSystemApertureProximityBacklightPolicy *)self _isGracePeriodDisabledByEntitledApp], a5 != 6)? (v16 = 1): (v16 = v15), (v16 & 1) == 0))
      {
        objc_initWeak(&location, self);
        objc_initWeak(&from, v8);
        v18 = SBLogProximitySensor();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          *(double *)v28 = v14;
          _os_log_impl(&dword_1D85BA000, v18, OS_LOG_TYPE_DEFAULT, "Scheduling grace period (%gs)", buf, 0xCu);
        }

        v19 = (void *)MEMORY[0x1E4F1CB00];
        v22[0] = MEMORY[0x1E4F143A8];
        v22[1] = 3221225472;
        v22[2] = __112__SBSystemApertureProximityBacklightPolicy_proximitySensorManager_objectWithinProximityDidChange_detectionMode___block_invoke;
        v22[3] = &unk_1E6B0B420;
        objc_copyWeak(&v23, &location);
        v24[1] = *(id *)&v14;
        objc_copyWeak(v24, &from);
        v20 = [v19 scheduledTimerWithTimeInterval:0 repeats:v22 block:v14];
        v21 = self->_touchAllowanceGracePeriodTimer;
        self->_touchAllowanceGracePeriodTimer = v20;

        objc_destroyWeak(v24);
        objc_destroyWeak(&v23);
        objc_destroyWeak(&from);
        objc_destroyWeak(&location);
      }
      else
      {
        [(SBSystemApertureProximityBacklightPolicy *)self _objectThatCanPreventTouchesWithinProximityDidChange:v6 fromGracePeriod:0];
      }
    }
  }
  else
  {
    v17 = SBLogProximitySensor();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D85BA000, v17, OS_LOG_TYPE_DEFAULT, "Suppresing prox -- backlight change suppression is active", buf, 2u);
    }
  }
}

void __112__SBSystemApertureProximityBacklightPolicy_proximitySensorManager_objectWithinProximityDidChange_detectionMode___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && [v3 isValid])
  {
    uint64_t v5 = SBLogProximitySensor();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 48);
      int v9 = 134217984;
      uint64_t v10 = v6;
      _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "Grace period finished (%gs)", (uint8_t *)&v9, 0xCu);
    }

    double v7 = (void *)WeakRetained[12];
    WeakRetained[12] = 0;

    id v8 = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "_objectThatCanPreventTouchesWithinProximityDidChange:fromGracePeriod:", objc_msgSend(v8, "isObjectInProximity"), 1);
  }
}

- (void)_objectThatCanPreventTouchesWithinProximityDidChange:(BOOL)a3 fromGracePeriod:(BOOL)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (self->_objectThatCanPreventTouchesInProximity != a3)
  {
    BOOL v4 = a4;
    BOOL v5 = a3;
    double v7 = [(SBSystemApertureProximityBacklightPolicy *)self delegate];
    WeakRetained = (_SBSystemApertureProximityTouchHandlingView *)objc_loadWeakRetained((id *)&self->_touchTrackingView);
    int v9 = (_SBSystemApertureProximityTouchHandlingView *)objc_loadWeakRetained((id *)&self->_touchBlockingView);
    self->_objectThatCanPreventTouchesInProximity = v5;
    uint64_t v10 = [(SBSystemApertureProximityBacklightPolicy *)self _proximitySettings];
    int v11 = [v10 allowTouchesInJindoWhenObjectInProximity];

    if (v5)
    {
      if (!WeakRetained) {
        WeakRetained = [[_SBSystemApertureProximityTouchHandlingView alloc] initWithDelegate:self hitTestsAsOpaque:v11 ^ 1u];
      }
      v12 = [(SBSystemApertureProximityBacklightPolicy *)self _proximitySettings];
      int v13 = [v12 colorScreenEdgeWhenObjectInProximity];

      if (v13)
      {
        double v14 = [(_SBSystemApertureProximityTouchHandlingView *)WeakRetained layer];
        id v15 = [MEMORY[0x1E4F428B8] systemYellowColor];
        objc_msgSend(v14, "setBorderColor:", objc_msgSend(v15, "CGColor"));

        char v16 = [(_SBSystemApertureProximityTouchHandlingView *)WeakRetained layer];
        [v16 setBorderWidth:3.0];
      }
      if (!v9) {
        int v9 = [[_SBSystemApertureProximityTouchHandlingView alloc] initWithDelegate:self hitTestsAsOpaque:1];
      }
      objc_storeWeak((id *)&self->_touchTrackingView, WeakRetained);
      objc_storeWeak((id *)&self->_touchBlockingView, v9);
      [v7 systemApertureProximityBacklightPolicy:self embedProximityTouchTrackingView:WeakRetained touchBlockingView:v9];
      if (v4)
      {
        v17 = SBLogProximitySensor();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v27) = 0;
          _os_log_impl(&dword_1D85BA000, v17, OS_LOG_TYPE_DEFAULT, "Scheduling backlight factor to zero immediately because we already spent time on the grace period.", (uint8_t *)&v27, 2u);
        }

        [(SBSystemApertureProximityBacklightPolicy *)self _startCancelingTouches];
        double v18 = 0.0;
        v19 = self;
LABEL_23:
        [(SBDefaultProximityBacklightPolicy *)v19 _scheduleBacklightFactorToZeroAfterDebounceDuration:v18];
        goto LABEL_24;
      }
      if ([v7 systemApertureProximityBacklightPolicyShouldConsiderSystemApertureInert:self])
      {
        v22 = SBLogProximitySensor();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v27) = 0;
          _os_log_impl(&dword_1D85BA000, v22, OS_LOG_TYPE_DEFAULT, "Scheduling backlight factor to zero after default duration (0.5s) because System Aperture is inert.", (uint8_t *)&v27, 2u);
        }

        [(SBSystemApertureProximityBacklightPolicy *)self _startCancelingTouches];
        [(SBDefaultProximityBacklightPolicy *)self _scheduleBacklightFactorToZeroAfterDefaultDuration];
        goto LABEL_24;
      }
      id v23 = [(SBSystemApertureProximityBacklightPolicy *)self _proximitySettings];
      [v23 initialBacklightDebounceDuration];
      double v25 = v24;

      if (BSFloatGreaterThanFloat())
      {
        v26 = SBLogProximitySensor();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          int v27 = 134217984;
          double v28 = v25;
          _os_log_impl(&dword_1D85BA000, v26, OS_LOG_TYPE_DEFAULT, "Scheduling backlight factor to zero after initialBacklightDebounceDuration (%gs) because System Aperture is active.", (uint8_t *)&v27, 0xCu);
        }

        [(SBSystemApertureProximityBacklightPolicy *)self _startCancelingTouches];
        v19 = self;
        double v18 = v25;
        goto LABEL_23;
      }
    }
    else
    {
      [(SBSystemApertureProximityBacklightPolicy *)self _stopCancelingTouches];
      self->_numberOfTouchesWhileObjectInProximity = 0;
      [(SBDefaultProximityBacklightPolicy *)self _restoreBacklightFactor];
      v20 = 0;
      v21 = 0;
      if (!((unint64_t)WeakRetained | (unint64_t)v9))
      {
LABEL_25:

        return;
      }
      [v7 systemApertureProximityBacklightPolicy:self removeProximityTouchTrackingView:WeakRetained touchBlockingView:v9];
    }
LABEL_24:
    v20 = v9;
    v21 = WeakRetained;
    goto LABEL_25;
  }
}

- (BOOL)proximityBacklightPolicyTouchHandlingView:(id)a3 shouldConsumeTouchForHitTest:(CGPoint)a4 withEvent:(id)a5
{
  double y = a4.y;
  double x = a4.x;
  v19[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_touchTrackingView);
  id v10 = objc_loadWeakRetained((id *)&self->_touchBlockingView);
  int v11 = [(SBSystemApertureProximityBacklightPolicy *)self delegate];
  char v12 = [v11 systemApertureProximityBacklightPolicyShouldConsiderSystemApertureInert:self];
  int v13 = [(SBSystemApertureProximityBacklightPolicy *)self _proximitySettings];
  char v14 = [v13 allowTouchesInJindoWhenObjectInProximity];

  if ((v12 & 1) == 0)
  {
    if (WeakRetained == v8)
    {
      unint64_t v15 = self->_numberOfTouchesWhileObjectInProximity + 1;
      self->_numberOfTouchesWhileObjectInProximitdouble y = v15;
      if (v15 <= 2)
      {
        self->_isTrackingTouchPossiblyInJindoWithObjectInProximitdouble y = objc_msgSend(v11, "systemApertureProximityBacklightPolicy:isSystemApertureElementVisibleAtPoint:", self, x, y);
        v19[0] = *MEMORY[0x1E4F1C4B0];
        char v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
        [(SBSystemApertureProximityBacklightPolicy *)self performSelector:sel__scheduleBacklightFactorToZeroForTouchWithinSystemAperture withObject:0 afterDelay:v16 inModes:0.0];
      }
    }
    else if (v10 == v8)
    {
      self->_isTrackingTouchPossiblyInJindoWithObjectInProximitdouble y = 0;
    }
  }
  if (v10 == v8) {
    char v17 = 1;
  }
  else {
    char v17 = v14 ^ 1;
  }

  return v17;
}

- (void)_startCancelingTouches
{
  if (!self->_suppressSystemGestures)
  {
    BKSHIDServicesCancelTouchesOnMainDisplay();
    systemGestureManager = self->_systemGestureManager;
    id v6 = +[SBSystemGestureManager deviceHardwareButtonGestureTypes];
    BOOL v4 = [(SBSystemGestureManager *)systemGestureManager acquireSystemGestureDisableAssertionForReason:@"objectInProximity" exceptSystemGestureTypes:v6];
    suppressSystemGestures = self->_suppressSystemGestures;
    self->_suppressSystemGestures = v4;
  }
}

- (void)_stopCancelingTouches
{
  [(BSInvalidatable *)self->_suppressSystemGestures invalidate];
  suppressSystemGestures = self->_suppressSystemGestures;
  self->_suppressSystemGestures = 0;
}

- (BOOL)_isGracePeriodDisabledByEntitledApp
{
  v2 = self;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  LOBYTE(v2) = [WeakRetained systemApertureProximityBacklightPolicyShouldDisableGracePeriod:v2];

  return (char)v2;
}

- (void)_scheduleBacklightFactorToZeroForTouchWithinSystemAperture
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (self->_isTrackingTouchPossiblyInJindoWithObjectInProximity)
  {
    self->_isTrackingTouchPossiblyInJindoWithObjectInProximitdouble y = 0;
    id v3 = [(SBSystemApertureProximityBacklightPolicy *)self _proximitySettings];
    [v3 subsequentBacklightDebounceDuration];
    double v5 = v4;

    id v6 = SBLogProximitySensor();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 134217984;
      double v8 = v5;
      _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "Scheduling backlight factor to zero after subsequentBacklightDebounceDuration (%.3f) because System Aperture is active and either did handle or could have handled touch.", (uint8_t *)&v7, 0xCu);
    }

    if (BSFloatGreaterThanFloat()) {
      [(SBDefaultProximityBacklightPolicy *)self _scheduleBacklightFactorToZeroAfterDebounceDuration:v5];
    }
  }
}

- (SBSystemApertureProximityBacklightPolicyDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBSystemApertureProximityBacklightPolicyDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isSystemApertureBacklightPolicy
{
  return self->_systemApertureBacklightPolicy;
}

- (void)setSystemApertureBacklightPolicy:(BOOL)a3
{
  self->_systemApertureBacklightPolicdouble y = a3;
}

- (SBProximitySettings)_proximitySettings
{
  return self->_proximitySettings;
}

- (void)_setProximitySettings:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proximitySettings, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_touchAllowanceGracePeriodTimer, 0);
  objc_destroyWeak((id *)&self->_touchBlockingView);
  objc_destroyWeak((id *)&self->_touchTrackingView);
  objc_storeStrong((id *)&self->_suppressSystemGestures, 0);
  objc_storeStrong((id *)&self->_systemGestureManager, 0);
  objc_storeStrong((id *)&self->_sensorModeController, 0);
}

@end