@interface SBRecalibrateProximitySensorMultiphaseHardwareButtonInteraction
- (BOOL)_disallowsAnyPressForReason:(id *)a3;
- (BOOL)consumeInitialPressDown;
- (BOOL)consumeSinglePressUp;
- (BOOL)disallowsSinglePressForReason:(id *)a3;
- (BSAbsoluteMachTimer)timer;
- (SBProximitySensorManager)sensorManager;
- (SBRecalibrateProximitySensorMultiphaseHardwareButtonInteraction)initWithProximitySensorManager:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)hardwareButtonGestureParameters;
- (int64_t)phase;
- (void)_timerDidFire;
- (void)_transitionToPhase:(int64_t)a3;
- (void)_transitionToPhase:(int64_t)a3 timeout:(double)a4;
- (void)dealloc;
- (void)proximitySensorManager:(id)a3 objectWithinProximityDidChange:(BOOL)a4;
- (void)setPhase:(int64_t)a3;
- (void)setSensorManager:(id)a3;
- (void)setTimer:(id)a3;
@end

@implementation SBRecalibrateProximitySensorMultiphaseHardwareButtonInteraction

- (SBRecalibrateProximitySensorMultiphaseHardwareButtonInteraction)initWithProximitySensorManager:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBRecalibrateProximitySensorMultiphaseHardwareButtonInteraction;
  v6 = [(SBRecalibrateProximitySensorMultiphaseHardwareButtonInteraction *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_sensorManager, a3);
    [(SBProximitySensorManager *)v7->_sensorManager addObserver:v7];
  }

  return v7;
}

- (void)dealloc
{
  [(BSAbsoluteMachTimer *)self->_timer invalidate];
  [(SBProximitySensorManager *)self->_sensorManager removeObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)SBRecalibrateProximitySensorMultiphaseHardwareButtonInteraction;
  [(SBRecalibrateProximitySensorMultiphaseHardwareButtonInteraction *)&v3 dealloc];
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)SBRecalibrateProximitySensorMultiphaseHardwareButtonInteraction;
  v4 = [(SBHardwareButtonGestureParametersProviderBase *)&v10 descriptionBuilderWithMultilinePrefix:a3];
  id v5 = v4;
  unint64_t phase = self->_phase;
  if (phase > 2) {
    v7 = @"<unknown>";
  }
  else {
    v7 = off_1E6B0A0E0[phase];
  }
  id v8 = (id)[v4 appendObject:v7 withName:@"phase"];
  return v5;
}

- (BOOL)consumeInitialPressDown
{
  return [(SBProximitySensorManager *)self->_sensorManager isObjectInProximity]
      || self->_phase != 0;
}

- (BOOL)consumeSinglePressUp
{
  int64_t phase = self->_phase;
  double v4 = 0.0;
  if (phase == 2) {
    goto LABEL_10;
  }
  if (phase == 1)
  {
    if (![(SBProximitySensorManager *)self->_sensorManager isObjectInProximity]) {
      goto LABEL_11;
    }
    [(SBProximitySensorManager *)self->_sensorManager resetProximityCalibration];
    double v4 = 1.0;
LABEL_10:
    BOOL v6 = 1;
    uint64_t v7 = 2;
    goto LABEL_12;
  }
  if (phase)
  {
LABEL_11:
    BOOL v6 = 0;
    uint64_t v7 = 0;
    goto LABEL_12;
  }
  BOOL v5 = [(SBProximitySensorManager *)self->_sensorManager isObjectInProximity];
  BOOL v6 = v5;
  if (v5) {
    double v4 = 2.0;
  }
  else {
    double v4 = 0.0;
  }
  uint64_t v7 = v5;
LABEL_12:
  [(SBRecalibrateProximitySensorMultiphaseHardwareButtonInteraction *)self _transitionToPhase:v7 timeout:v4];
  return v6;
}

- (BOOL)_disallowsAnyPressForReason:(id *)a3
{
  *a3 = 0;
  BOOL v4 = [(SBProximitySensorManager *)self->_sensorManager isObjectInProximity];
  if (v4) {
    *a3 = @"object in proximity";
  }
  return v4;
}

- (BOOL)disallowsSinglePressForReason:(id *)a3
{
  *a3 = 0;
  return 0;
}

- (void)proximitySensorManager:(id)a3 objectWithinProximityDidChange:(BOOL)a4
{
  if (!a4 && self->_phase != 2) {
    [(SBRecalibrateProximitySensorMultiphaseHardwareButtonInteraction *)self _transitionToPhase:0];
  }
}

- (id)hardwareButtonGestureParameters
{
  objc_super v3 = objc_alloc_init(SBMutableHardwareButtonGestureParameters);
  [(SBMutableHardwareButtonGestureParameters *)v3 setMaximumPressCount:self->_phase > 0];
  return v3;
}

- (void)_transitionToPhase:(int64_t)a3
{
}

- (void)_transitionToPhase:(int64_t)a3 timeout:(double)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (self->_phase != a3)
  {
    uint64_t v7 = SBLogButtonsInteraction();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = objc_opt_class();
      unint64_t phase = self->_phase;
      if (phase > 2) {
        objc_super v10 = @"<unknown>";
      }
      else {
        objc_super v10 = off_1E6B0A0E0[phase];
      }
      if ((unint64_t)a3 > 2) {
        v11 = @"<unknown>";
      }
      else {
        v11 = off_1E6B0A0E0[a3];
      }
      *(_DWORD *)buf = 138544130;
      v22 = v8;
      __int16 v23 = 2114;
      v24 = v10;
      __int16 v25 = 2114;
      v26 = v11;
      __int16 v27 = 2048;
      double v28 = a4;
      id v12 = v8;
      _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ transition from::%{public}@ to:%{public}@ timeout:%g", buf, 0x2Au);
    }
    self->_unint64_t phase = a3;
    [(BSAbsoluteMachTimer *)self->_timer invalidate];
    timer = self->_timer;
    self->_timer = 0;

    if (a4 > 0.0 && self->_phase >= 1)
    {
      objc_initWeak((id *)buf, self);
      v14 = (BSAbsoluteMachTimer *)[objc_alloc(MEMORY[0x1E4F4F660]) initWithIdentifier:@"SBRecalibrateProximitySensorMultiphaseHardwareButtonInteraction.timer"];
      v15 = self->_timer;
      self->_timer = v14;

      v16 = self->_timer;
      id v17 = MEMORY[0x1E4F14428];
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __94__SBRecalibrateProximitySensorMultiphaseHardwareButtonInteraction__transitionToPhase_timeout___block_invoke;
      v19[3] = &unk_1E6AF5838;
      objc_copyWeak(&v20, (id *)buf);
      [(BSAbsoluteMachTimer *)v16 scheduleWithFireInterval:MEMORY[0x1E4F14428] leewayInterval:v19 queue:a4 handler:0.0];

      objc_destroyWeak(&v20);
      objc_destroyWeak((id *)buf);
    }
    v18 = [(SBRecalibrateProximitySensorMultiphaseHardwareButtonInteraction *)self hardwareButtonGestureParameters];
    [(SBHardwareButtonGestureParametersProviderBase *)self publishUpdatedParameters:v18];
  }
}

void __94__SBRecalibrateProximitySensorMultiphaseHardwareButtonInteraction__transitionToPhase_timeout___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _timerDidFire];
}

- (void)_timerDidFire
{
}

- (int64_t)phase
{
  return self->_phase;
}

- (void)setPhase:(int64_t)a3
{
  self->_unint64_t phase = a3;
}

- (SBProximitySensorManager)sensorManager
{
  return self->_sensorManager;
}

- (void)setSensorManager:(id)a3
{
}

- (BSAbsoluteMachTimer)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_sensorManager, 0);
}

@end