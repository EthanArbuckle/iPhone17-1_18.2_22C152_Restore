@interface SBNotchedStatusBarProximityBacklightPolicy
- (SBNotchedStatusBarProximityBacklightPolicy)initWithConfiguration:(id)a3;
- (SBNotchedStatusBarProximityBacklightPolicy)initWithConfiguration:(id)a3 touchHandlingController:(id)a4;
- (SBProximitySettings)_proximitySettings;
- (double)_debounceDurationForNumberOfTouchesReceivedWithObjectInProximity:(BOOL)a3;
- (id)_createNewEnablementCondition;
- (void)_absorbTouchesBelowStatusBarHeight;
- (void)_absorbTouchesFullScreen;
- (void)_scheduleBacklightFactorToZeroAfterDebounceDuration:(double)a3;
- (void)_setProximitySettings:(id)a3;
- (void)_stopAbsorbingTouches;
- (void)condition:(id)a3 enablementDidChange:(BOOL)a4;
- (void)dealloc;
- (void)didHitAllowedRegion:(CGPoint)a3;
- (void)proximitySensorManager:(id)a3 objectWithinProximityDidChange:(BOOL)a4;
- (void)windowSceneDidConnect:(id)a3;
@end

@implementation SBNotchedStatusBarProximityBacklightPolicy

- (SBNotchedStatusBarProximityBacklightPolicy)initWithConfiguration:(id)a3
{
  id v4 = a3;
  v5 = [SBProximityTouchHandlingController alloc];
  v6 = [v4 proximitySettings];
  v7 = [(SBProximityTouchHandlingController *)v5 initWithSettings:v6 touchHandlingDelegate:self];

  v8 = [(SBNotchedStatusBarProximityBacklightPolicy *)self initWithConfiguration:v4 touchHandlingController:v7];
  return v8;
}

- (SBNotchedStatusBarProximityBacklightPolicy)initWithConfiguration:(id)a3 touchHandlingController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SBNotchedStatusBarProximityBacklightPolicy;
  v8 = [(SBDefaultProximityBacklightPolicy *)&v12 initWithConfiguration:v6];
  if (v8)
  {
    uint64_t v9 = [v6 proximitySettings];
    proximitySettings = v8->_proximitySettings;
    v8->_proximitySettings = (SBProximitySettings *)v9;

    objc_storeStrong((id *)&v8->_proxTouchHandlingController, a4);
  }

  return v8;
}

- (void)dealloc
{
  [(SBProximityTouchHandlingController *)self->_proxTouchHandlingController invalidate];
  [(SBNotchedStatusBarProximityBacklightPolicyEnablementCondition *)self->_enablementCondition invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SBNotchedStatusBarProximityBacklightPolicy;
  [(SBDefaultProximityBacklightPolicy *)&v3 dealloc];
}

- (void)_scheduleBacklightFactorToZeroAfterDebounceDuration:(double)a3
{
  if (BSFloatGreaterThanFloat())
  {
    v5.receiver = self;
    v5.super_class = (Class)SBNotchedStatusBarProximityBacklightPolicy;
    [(SBDefaultProximityBacklightPolicy *)&v5 _scheduleBacklightFactorToZeroAfterDebounceDuration:a3];
  }
}

- (id)_createNewEnablementCondition
{
  v2 = objc_alloc_init(SBNotchedStatusBarProximityBacklightPolicyEnablementCondition);
  return v2;
}

- (void)proximitySensorManager:(id)a3 objectWithinProximityDidChange:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  if (self->_objectInProximity != v4)
  {
    id v13 = v7;
    self->_objectInProximity = v4;
    if (v4)
    {
      if (self->_touchesReceivedWithObjectInProximity)
      {
        v11 = [MEMORY[0x1E4F28B00] currentHandler];
        [v11 handleFailureInMethod:a2 object:self file:@"SBNotchedStatusBarProximityBacklightPolicy.m" lineNumber:106 description:@"Expected _touchesReceivedWithObjectInProximity to be 0."];
      }
      if (self->_timesEnabledWithObjectInProximity)
      {
        objc_super v12 = [MEMORY[0x1E4F28B00] currentHandler];
        [v12 handleFailureInMethod:a2 object:self file:@"SBNotchedStatusBarProximityBacklightPolicy.m" lineNumber:107 description:@"Expected _timesEnabledWithObjectInProximity to be 0."];
      }
      v8 = [(SBNotchedStatusBarProximityBacklightPolicy *)self _createNewEnablementCondition];
      enablementCondition = self->_enablementCondition;
      self->_enablementCondition = v8;

      [(SBNotchedStatusBarProximityBacklightPolicyEnablementCondition *)self->_enablementCondition setDelegate:self];
      if ([(SBNotchedStatusBarProximityBacklightPolicyEnablementCondition *)self->_enablementCondition isEnabled])
      {
        [(SBNotchedStatusBarProximityBacklightPolicy *)self _debounceDurationForNumberOfTouchesReceivedWithObjectInProximity:1];
        -[SBNotchedStatusBarProximityBacklightPolicy _scheduleBacklightFactorToZeroAfterDebounceDuration:](self, "_scheduleBacklightFactorToZeroAfterDebounceDuration:");
        [(SBNotchedStatusBarProximityBacklightPolicy *)self _absorbTouchesBelowStatusBarHeight];
      }
      else
      {
        [(SBDefaultProximityBacklightPolicy *)self _scheduleBacklightFactorToZeroAfterDefaultDuration];
        [(SBNotchedStatusBarProximityBacklightPolicy *)self _absorbTouchesFullScreen];
      }
    }
    else
    {
      [(SBNotchedStatusBarProximityBacklightPolicy *)self _stopAbsorbingTouches];
      [(SBNotchedStatusBarProximityBacklightPolicyEnablementCondition *)self->_enablementCondition invalidate];
      v10 = self->_enablementCondition;
      self->_enablementCondition = 0;

      self->_timesEnabledWithObjectInProximity = 0;
      self->_touchesReceivedWithObjectInProximity = 0;
      [(SBDefaultProximityBacklightPolicy *)self _restoreBacklightFactor];
    }
    id v7 = v13;
  }
}

- (void)windowSceneDidConnect:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBNotchedStatusBarProximityBacklightPolicy;
  id v4 = a3;
  [(SBDefaultProximityBacklightPolicy *)&v5 windowSceneDidConnect:v4];
  -[SBProximityTouchHandlingController windowSceneDidConnect:](self->_proxTouchHandlingController, "windowSceneDidConnect:", v4, v5.receiver, v5.super_class);
}

- (void)didHitAllowedRegion:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (!self->_objectInProximity)
  {
    objc_super v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"SBNotchedStatusBarProximityBacklightPolicy.m" lineNumber:145 description:@"Requires object in proximity."];
  }
  unint64_t v6 = self->_touchesReceivedWithObjectInProximity + 1;
  self->_touchesReceivedWithObjectInProximitCGFloat y = v6;
  id v7 = SBLogProximitySensor();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6 > 2)
  {
    if (v8)
    {
      v17.CGFloat x = x;
      v17.CGFloat y = y;
      v10 = NSStringFromCGPoint(v17);
      int v13 = 138412290;
      v14 = v10;
      _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "HIT allowed region (%@), and NOT allowed to reschedule backlight debounce timer because maximum touches reached.", (uint8_t *)&v13, 0xCu);
    }
  }
  else
  {
    if (v8)
    {
      v16.CGFloat x = x;
      v16.CGFloat y = y;
      uint64_t v9 = NSStringFromCGPoint(v16);
      int v13 = 138412290;
      v14 = v9;
      _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "HIT allowed region (%@), and allowed to reschedule backlight debounce timer.", (uint8_t *)&v13, 0xCu);
    }
    [(SBNotchedStatusBarProximityBacklightPolicy *)self _debounceDurationForNumberOfTouchesReceivedWithObjectInProximity:0];
    -[SBNotchedStatusBarProximityBacklightPolicy _scheduleBacklightFactorToZeroAfterDebounceDuration:](self, "_scheduleBacklightFactorToZeroAfterDebounceDuration:");
  }
}

- (void)condition:(id)a3 enablementDidChange:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  if (self->_objectInProximity)
  {
    if (!v4) {
      goto LABEL_11;
    }
  }
  else
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"SBNotchedStatusBarProximityBacklightPolicy.m" lineNumber:162 description:@"Requires object in proximity."];

    if (!v4) {
      goto LABEL_11;
    }
  }
  unint64_t v8 = self->_timesEnabledWithObjectInProximity + 1;
  self->_timesEnabledWithObjectInProximitCGFloat y = v8;
  uint64_t v9 = SBLogProximitySensor();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v8 > 2)
  {
    if (v10)
    {
      *(_WORD *)objc_super v12 = 0;
      _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "Condition changed to allow prox touch handling, but NOT allowed to reschedule backlight debounce timer because max enablements reached.", v12, 2u);
    }
  }
  else
  {
    if (v10)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "Condition changed to allow prox touch handling, and allowed to reschedule backlight debounce timer.", buf, 2u);
    }

    [(SBNotchedStatusBarProximityBacklightPolicy *)self _debounceDurationForNumberOfTouchesReceivedWithObjectInProximity:0];
    -[SBNotchedStatusBarProximityBacklightPolicy _scheduleBacklightFactorToZeroAfterDebounceDuration:](self, "_scheduleBacklightFactorToZeroAfterDebounceDuration:");
  }
  [(SBNotchedStatusBarProximityBacklightPolicy *)self _absorbTouchesBelowStatusBarHeight];
LABEL_11:
}

- (void)_absorbTouchesBelowStatusBarHeight
{
  proxTouchHandlingController = self->_proxTouchHandlingController;
  [(SBNotchedStatusBarProximityBacklightPolicyEnablementCondition *)self->_enablementCondition enabledStatusBarHeight];
  -[SBProximityTouchHandlingController setStatusBarHeight:](proxTouchHandlingController, "setStatusBarHeight:");
  BOOL v4 = self->_proxTouchHandlingController;
  [(SBProximityTouchHandlingController *)v4 setAbsorbTouchesBelowStatusBar:1];
}

- (void)_absorbTouchesFullScreen
{
  [(SBProximityTouchHandlingController *)self->_proxTouchHandlingController setStatusBarHeight:0.0];
  proxTouchHandlingController = self->_proxTouchHandlingController;
  [(SBProximityTouchHandlingController *)proxTouchHandlingController setAbsorbTouchesBelowStatusBar:1];
}

- (void)_stopAbsorbingTouches
{
}

- (double)_debounceDurationForNumberOfTouchesReceivedWithObjectInProximity:(BOOL)a3
{
  touchesReceivedWithObjectInProximitCGFloat y = self->_touchesReceivedWithObjectInProximity;
  if (a3 && !touchesReceivedWithObjectInProximity)
  {
    BOOL v4 = [(SBNotchedStatusBarProximityBacklightPolicy *)self _proximitySettings];
    [v4 initialBacklightDebounceDuration];
LABEL_6:
    double v6 = v5;

    return v6;
  }
  double v6 = 0.0;
  if (touchesReceivedWithObjectInProximity <= 2)
  {
    BOOL v4 = [(SBNotchedStatusBarProximityBacklightPolicy *)self _proximitySettings];
    [v4 subsequentBacklightDebounceDuration];
    goto LABEL_6;
  }
  return v6;
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
  objc_storeStrong((id *)&self->_enablementCondition, 0);
  objc_storeStrong((id *)&self->_proxTouchHandlingController, 0);
}

@end