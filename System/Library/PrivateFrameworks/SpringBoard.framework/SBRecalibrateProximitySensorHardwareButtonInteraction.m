@interface SBRecalibrateProximitySensorHardwareButtonInteraction
- (BOOL)_disallowsAnyPressForReason:(id *)a3;
- (BOOL)consumeInitialPressDown;
- (BOOL)consumeSinglePressUp;
- (BOOL)didResetProxCalibration;
- (SBProximitySensorManager)sensorManager;
- (SBRecalibrateProximitySensorHardwareButtonInteraction)initWithProximitySensorManager:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)hardwareButtonGestureParameters;
- (void)setDidResetProxCalibration:(BOOL)a3;
- (void)setSensorManager:(id)a3;
@end

@implementation SBRecalibrateProximitySensorHardwareButtonInteraction

- (SBRecalibrateProximitySensorHardwareButtonInteraction)initWithProximitySensorManager:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBRecalibrateProximitySensorHardwareButtonInteraction;
  v6 = [(SBRecalibrateProximitySensorHardwareButtonInteraction *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_sensorManager, a3);
  }

  return v7;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SBRecalibrateProximitySensorHardwareButtonInteraction;
  v4 = [(SBHardwareButtonGestureParametersProviderBase *)&v7 descriptionBuilderWithMultilinePrefix:a3];
  id v5 = (id)[v4 appendBool:self->_didResetProxCalibration withName:@"didResetProxCalibration"];
  return v4;
}

- (BOOL)consumeInitialPressDown
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  self->_didResetProxCalibration = 0;
  BOOL v4 = [(SBProximitySensorManager *)self->_sensorManager isObjectInProximity];
  BOOL result = 0;
  if (v4)
  {
    if (MGGetBoolAnswer())
    {
      ADClientAddValueForScalarKey();
      v6 = SBLogButtonsLock();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        objc_super v7 = NSStringFromSelector(a2);
        int v8 = 138543362;
        objc_super v9 = v7;
        _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ result: ignoring lock down because object within proximity", (uint8_t *)&v8, 0xCu);
      }
      return 1;
    }
    else
    {
      [(SBProximitySensorManager *)self->_sensorManager resetProximityCalibration];
      BOOL result = 0;
      self->_didResetProxCalibration = 1;
    }
  }
  return result;
}

- (BOOL)consumeSinglePressUp
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  BOOL didResetProxCalibration = self->_didResetProxCalibration;
  if (self->_didResetProxCalibration)
  {
    self->_BOOL didResetProxCalibration = 0;
    BOOL v4 = SBLogButtonsLock();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = NSStringFromSelector(a2);
      int v7 = 138543362;
      int v8 = v5;
      _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ result: ignoring because we recalibrated prox, and we don't want to lock the screen in this case", (uint8_t *)&v7, 0xCu);
    }
  }
  return didResetProxCalibration;
}

- (BOOL)_disallowsAnyPressForReason:(id *)a3
{
  *a3 = 0;
  int v4 = [(SBProximitySensorManager *)self->_sensorManager isObjectInProximity];
  if (v4)
  {
    int v4 = MGGetBoolAnswer();
    if (v4)
    {
      *a3 = @"object in proximity && opposed lock/volume buttons";
      LOBYTE(v4) = 1;
    }
  }
  return v4;
}

- (id)hardwareButtonGestureParameters
{
  v2 = objc_alloc_init(SBHardwareButtonGestureParameters);
  return v2;
}

- (SBProximitySensorManager)sensorManager
{
  return self->_sensorManager;
}

- (void)setSensorManager:(id)a3
{
}

- (BOOL)didResetProxCalibration
{
  return self->_didResetProxCalibration;
}

- (void)setDidResetProxCalibration:(BOOL)a3
{
  self->_BOOL didResetProxCalibration = a3;
}

- (void).cxx_destruct
{
}

@end