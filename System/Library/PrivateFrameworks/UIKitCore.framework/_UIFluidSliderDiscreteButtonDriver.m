@interface _UIFluidSliderDiscreteButtonDriver
- ($F24F406B2B787EFB06265DBA3D28CBD5)_range;
- (BOOL)_isRepeating;
- (BOOL)enabled;
- (BSAbsoluteMachTimer)_releaseTimer;
- (BSAbsoluteMachTimer)_repeatTimer;
- (NSString)name;
- (UIView)view;
- (double)_lastReleaseTimestamp;
- (double)_minimumPressDuration;
- (double)_overflowAmount;
- (double)_repeatCadence;
- (double)_repeatDelay;
- (double)_trackLength;
- (double)_value;
- (double)stretchAmount;
- (double)velocityMultiplier;
- (id)drivable;
- (unint64_t)_pressedButton;
- (unint64_t)trackAxis;
- (void)_clearReleaseTimer;
- (void)_clearRepeatTimer;
- (void)_handleButton:(unint64_t)a3 state:(unint64_t)a4;
- (void)_incrementValue;
- (void)_issueUpdateWithValue:(double)a3;
- (void)_releaseCurrentlyPressedButton;
- (void)dealloc;
- (void)pressDown;
- (void)pressUp;
- (void)releaseDown;
- (void)releaseUp;
- (void)setDrivable:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setStretchAmount:(double)a3;
- (void)setTrackAxis:(unint64_t)a3;
- (void)setVelocityMultiplier:(double)a3;
- (void)setView:(id)a3;
- (void)set_isRepeating:(BOOL)a3;
- (void)set_lastReleaseTimestamp:(double)a3;
- (void)set_pressedButton:(unint64_t)a3;
- (void)set_releaseTimer:(id)a3;
- (void)set_repeatTimer:(id)a3;
- (void)set_value:(double)a3;
- (void)stop;
@end

@implementation _UIFluidSliderDiscreteButtonDriver

- (void)stop
{
  [(_UIFluidSliderDiscreteButtonDriver *)self _clearRepeatTimer];
  [(_UIFluidSliderDiscreteButtonDriver *)self _clearReleaseTimer];
}

- (void)dealloc
{
  [(_UIFluidSliderDiscreteButtonDriver *)self _clearRepeatTimer];
  [(_UIFluidSliderDiscreteButtonDriver *)self _clearReleaseTimer];
  v3.receiver = self;
  v3.super_class = (Class)_UIFluidSliderDiscreteButtonDriver;
  [(_UIFluidSliderDiscreteButtonDriver *)&v3 dealloc];
}

- (void)pressUp
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  objc_super v3 = *(NSObject **)(__UILogGetCategoryCachedImpl("FluidSliderInteraction", &pressUp___s_category) + 8);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    v5 = [(_UIFluidSliderDiscreteButtonDriver *)self name];
    int v6 = 138412546;
    v7 = v5;
    __int16 v8 = 2080;
    v9 = "-[_UIFluidSliderDiscreteButtonDriver pressUp]";
    _os_log_impl(&dword_1853B0000, v4, OS_LOG_TYPE_DEFAULT, "[FluidSlider Physical Button Update] %@: %s", (uint8_t *)&v6, 0x16u);
  }
  [(_UIFluidSliderDiscreteButtonDriver *)self _handleButton:1 state:0];
}

- (void)releaseUp
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  objc_super v3 = *(NSObject **)(__UILogGetCategoryCachedImpl("FluidSliderInteraction", &releaseUp___s_category) + 8);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    v5 = [(_UIFluidSliderDiscreteButtonDriver *)self name];
    int v6 = 138412546;
    v7 = v5;
    __int16 v8 = 2080;
    v9 = "-[_UIFluidSliderDiscreteButtonDriver releaseUp]";
    _os_log_impl(&dword_1853B0000, v4, OS_LOG_TYPE_DEFAULT, "[FluidSlider Physical Button Update] %@: %s", (uint8_t *)&v6, 0x16u);
  }
  [(_UIFluidSliderDiscreteButtonDriver *)self _handleButton:1 state:2];
}

- (void)pressDown
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  objc_super v3 = *(NSObject **)(__UILogGetCategoryCachedImpl("FluidSliderInteraction", &pressDown___s_category) + 8);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    v5 = [(_UIFluidSliderDiscreteButtonDriver *)self name];
    int v6 = 138412546;
    v7 = v5;
    __int16 v8 = 2080;
    v9 = "-[_UIFluidSliderDiscreteButtonDriver pressDown]";
    _os_log_impl(&dword_1853B0000, v4, OS_LOG_TYPE_DEFAULT, "[FluidSlider Physical Button Update] %@: %s", (uint8_t *)&v6, 0x16u);
  }
  [(_UIFluidSliderDiscreteButtonDriver *)self _handleButton:2 state:0];
}

- (void)releaseDown
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  objc_super v3 = *(NSObject **)(__UILogGetCategoryCachedImpl("FluidSliderInteraction", &releaseDown___s_category) + 8);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    v5 = [(_UIFluidSliderDiscreteButtonDriver *)self name];
    int v6 = 138412546;
    v7 = v5;
    __int16 v8 = 2080;
    v9 = "-[_UIFluidSliderDiscreteButtonDriver releaseDown]";
    _os_log_impl(&dword_1853B0000, v4, OS_LOG_TYPE_DEFAULT, "[FluidSlider Physical Button Update] %@: %s", (uint8_t *)&v6, 0x16u);
  }
  [(_UIFluidSliderDiscreteButtonDriver *)self _handleButton:2 state:2];
}

- (NSString)name
{
  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (void)_handleButton:(unint64_t)a3 state:(unint64_t)a4
{
  if (a4)
  {
    if (a4 == 1)
    {
      v33 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
      [v33 handleFailureInMethod:a2, self, @"_UIFluidSliderDiscreteButtonDriver.m", 115, @"Received a button update in the changed state. This is a discrete driver, so this shouldn't be possible." object file lineNumber description];
    }
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    -[_UIFluidSliderDiscreteButtonDriver set_lastReleaseTimestamp:](self, "set_lastReleaseTimestamp:");
    BOOL v5 = [(_UIFluidSliderDiscreteButtonDriver *)self _isRepeating];
    [(_UIFluidSliderDiscreteButtonDriver *)self _clearRepeatTimer];
    if (v5)
    {
      [(_UIFluidSliderDiscreteButtonDriver *)self _releaseCurrentlyPressedButton];
      return;
    }
    v27 = (void *)[objc_alloc(MEMORY[0x1E4F4F660]) initWithIdentifier:@"com.apple.UIKit.DiscreteButtonDriverReleaseTimer"];
    [(_UIFluidSliderDiscreteButtonDriver *)self set_releaseTimer:v27];

    objc_initWeak(&location, self);
    v21 = [(_UIFluidSliderDiscreteButtonDriver *)self _releaseTimer];
    [(_UIFluidSliderDiscreteButtonDriver *)self _minimumPressDuration];
    double v29 = v28;
    uint64_t v30 = MEMORY[0x1E4F14428];
    id v31 = MEMORY[0x1E4F14428];
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __58___UIFluidSliderDiscreteButtonDriver__handleButton_state___block_invoke_2;
    v34[3] = &unk_1E52F3060;
    v26 = &v35;
    objc_copyWeak(&v35, &location);
    [v21 scheduleWithFireInterval:v30 leewayInterval:v34 queue:v29 handler:0.0];
LABEL_17:

    objc_destroyWeak(v26);
    objc_destroyWeak(&location);
    return;
  }
  v7 = [(_UIFluidSliderDiscreteButtonDriver *)self _releaseTimer];

  if (v7)
  {
    [(_UIFluidSliderDiscreteButtonDriver *)self _clearReleaseTimer];
    [(_UIFluidSliderDiscreteButtonDriver *)self _releaseCurrentlyPressedButton];
  }
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v9 = v8;
  [(_UIFluidSliderDiscreteButtonDriver *)self _lastReleaseTimestamp];
  double v11 = v10;
  [(_UIFluidSliderDiscreteButtonDriver *)self _minimumPressDuration];
  double v13 = v12;
  [(_UIFluidSliderDiscreteButtonDriver *)self set_lastReleaseTimestamp:0.0];
  [(_UIFluidSliderDiscreteButtonDriver *)self set_pressedButton:a3];
  v14 = [(_UIFluidSliderDiscreteButtonDriver *)self drivable];
  [v14 value];
  -[_UIFluidSliderDiscreteButtonDriver set_value:](self, "set_value:");

  v15 = [(_UIFluidSliderDiscreteButtonDriver *)self _repeatTimer];

  if (!v15)
  {
    [(_UIFluidSliderDiscreteButtonDriver *)self _incrementValue];
    v16 = (void *)[objc_alloc(MEMORY[0x1E4F4F660]) initWithIdentifier:@"com.apple.UIKit.DiscreteButtonDriverRepeatTimer"];
    [(_UIFluidSliderDiscreteButtonDriver *)self set_repeatTimer:v16];

    objc_initWeak(&location, self);
    [(_UIFluidSliderDiscreteButtonDriver *)self _repeatDelay];
    double v18 = v17;
    double v19 = v9 - v11;
    if (v9 - v11 < v13
      || ([(_UIFluidSliderDiscreteButtonDriver *)self _value], v19 <= 0.0)
      || ([(_UIFluidSliderDiscreteButtonDriver *)self _value], v19 >= 1.0))
    {
      [(_UIFluidSliderDiscreteButtonDriver *)self _repeatCadence];
      double v18 = v20;
    }
    v21 = [(_UIFluidSliderDiscreteButtonDriver *)self _repeatTimer];
    [(_UIFluidSliderDiscreteButtonDriver *)self _repeatCadence];
    double v23 = v22;
    uint64_t v24 = MEMORY[0x1E4F14428];
    id v25 = MEMORY[0x1E4F14428];
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __58___UIFluidSliderDiscreteButtonDriver__handleButton_state___block_invoke;
    v36[3] = &unk_1E52F3060;
    v26 = &v37;
    objc_copyWeak(&v37, &location);
    [v21 scheduleRepeatingWithFireInterval:v24 repeatInterval:v36 leewayInterval:v18 queue:v23 handler:0.0];
    goto LABEL_17;
  }
}

- (void)_clearRepeatTimer
{
  [(BSAbsoluteMachTimer *)self->_repeatTimer invalidate];
  repeatTimer = self->_repeatTimer;
  self->_repeatTimer = 0;

  [(_UIFluidSliderDiscreteButtonDriver *)self set_isRepeating:0];
}

- (void)_clearReleaseTimer
{
  [(BSAbsoluteMachTimer *)self->_releaseTimer invalidate];
  releaseTimer = self->_releaseTimer;
  self->_releaseTimer = 0;
}

- (void)_incrementValue
{
  if ([(_UIFluidSliderDiscreteButtonDriver *)self _pressedButton])
  {
    unint64_t v3 = [(_UIFluidSliderDiscreteButtonDriver *)self _pressedButton];
    v4 = [(_UIFluidSliderDiscreteButtonDriver *)self drivable];
    double v5 = 1.0 / (double)(unint64_t)[v4 stepCount];

    [(_UIFluidSliderDiscreteButtonDriver *)self _value];
    if (v3 != 1) {
      double v5 = -v5;
    }
    [(_UIFluidSliderDiscreteButtonDriver *)self velocityMultiplier];
    double v7 = v5 * v6;
    [(_UIFluidSliderDiscreteButtonDriver *)self _value];
    [(_UIFluidSliderDiscreteButtonDriver *)self set_value:v8 + v7];
    [(_UIFluidSliderDiscreteButtonDriver *)self _value];
    -[_UIFluidSliderDiscreteButtonDriver _issueUpdateWithValue:](self, "_issueUpdateWithValue:");
  }
}

- (void)_releaseCurrentlyPressedButton
{
  [(_UIFluidSliderDiscreteButtonDriver *)self set_pressedButton:0];
  unint64_t v3 = [(_UIFluidSliderDiscreteButtonDriver *)self drivable];
  [v3 value];
  double v5 = v4;

  double v6 = fmax(fmin(v5, 1.0), 0.0);
  [(_UIFluidSliderDiscreteButtonDriver *)self _issueUpdateWithValue:v6];
}

- (void)_issueUpdateWithValue:(double)a3
{
  unint64_t v5 = [(_UIFluidSliderDiscreteButtonDriver *)self _pressedButton];
  [(_UIFluidSliderDiscreteButtonDriver *)self stretchAmount];
  double v7 = v6;
  double v8 = [(_UIFluidSliderDiscreteButtonDriver *)self drivable];
  [v8 currentTrackLength];
  double v10 = v7 / v9;

  [(_UIFluidSliderDiscreteButtonDriver *)self _range];
  double v13 = -v10;
  if (v11 <= a3) {
    double v13 = v10;
  }
  double v14 = fmax(v11, fmin(a3, v12));
  if (v13 != 0.0) {
    double v14 = v14 + v13 * (1.0 - 1.0 / ((a3 - v14) / v13 * 0.55 + 1.0));
  }
  v15 = +[_UIFluidSliderSettingsDomain rootSettings];
  v16 = [v15 discreteButtonDriverSettings];

  if (v5)
  {
    unint64_t v17 = [(_UIFluidSliderDiscreteButtonDriver *)self _pressedButton];
    unint64_t v18 = [(_UIFluidSliderDiscreteButtonDriver *)self trackAxis];
    if (v17 == 1)
    {
      if (v18 == 1) {
        [v16 horizontalVolumeUpScale];
      }
      else {
        [v16 verticalVolumeUpScale];
      }
    }
    else if (v18 == 1)
    {
      [v16 horizontalVolumeDownScale];
    }
    else
    {
      [v16 verticalVolumeDownScale];
    }
    double v22 = v19;
    BOOL v20 = [(_UIFluidSliderDiscreteButtonDriver *)self _isRepeating];
    v21 = [v16 update];
  }
  else
  {
    BOOL v20 = [(_UIFluidSliderDiscreteButtonDriver *)self _isRepeating];
    v21 = [v16 settle];
    double v22 = 1.0;
  }
  BOOL v23 = v5 != 0;
  uint64_t v24 = [v21 springAnimationBehavior];

  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __60___UIFluidSliderDiscreteButtonDriver__issueUpdateWithValue___block_invoke;
  v26[3] = &unk_1E53058A0;
  uint64_t v25 = 2;
  if (v20) {
    uint64_t v25 = 3;
  }
  v26[4] = self;
  *(double *)&v26[5] = v14;
  *(double *)&v26[6] = v22;
  v26[7] = v23;
  v26[8] = v25;
  v26[9] = 0xBFF0000000000000;
  +[UIView _animateUsingSpringBehavior:v24 tracking:0 animations:v26 completion:0];
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)_range
{
  unint64_t v3 = [(_UIFluidSliderDiscreteButtonDriver *)self drivable];
  int v4 = [v3 isLocked];

  if (v4)
  {
    unint64_t v5 = [(_UIFluidSliderDiscreteButtonDriver *)self drivable];
    [v5 value];
    double v7 = v6;

    double v8 = v7;
  }
  else
  {
    double v8 = 1.0;
    double v7 = 0.0;
  }
  double v9 = v7;
  result.var1 = v8;
  result.var0 = v9;
  return result;
}

- (double)_trackLength
{
  v2 = [(_UIFluidSliderDiscreteButtonDriver *)self drivable];
  [v2 currentTrackLength];
  double v4 = v3;

  return v4;
}

- (double)_overflowAmount
{
  [(_UIFluidSliderDiscreteButtonDriver *)self stretchAmount];
  double v4 = v3;
  [(_UIFluidSliderDiscreteButtonDriver *)self _trackLength];
  return v4 / v5 * 0.5;
}

- (double)_repeatDelay
{
  v2 = +[_UIFluidSliderSettingsDomain rootSettings];
  double v3 = [v2 discreteButtonDriverSettings];
  [v3 repeatDelay];
  double v5 = v4;

  return v5;
}

- (double)_repeatCadence
{
  v2 = +[_UIFluidSliderSettingsDomain rootSettings];
  double v3 = [v2 discreteButtonDriverSettings];
  [v3 repeatCadence];
  double v5 = v4;

  return v5;
}

- (double)_minimumPressDuration
{
  v2 = +[_UIFluidSliderSettingsDomain rootSettings];
  double v3 = [v2 discreteButtonDriverSettings];
  [v3 minimumPressDuration];
  double v5 = v4;

  return v5;
}

- (id)drivable
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_drivable);
  return WeakRetained;
}

- (void)setDrivable:(id)a3
{
}

- (UIView)view
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  return (UIView *)WeakRetained;
}

- (void)setView:(id)a3
{
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (double)stretchAmount
{
  return self->_stretchAmount;
}

- (void)setStretchAmount:(double)a3
{
  self->_stretchAmount = a3;
}

- (double)velocityMultiplier
{
  return self->_velocityMultiplier;
}

- (void)setVelocityMultiplier:(double)a3
{
  self->_velocityMultiplier = a3;
}

- (unint64_t)trackAxis
{
  return self->_trackAxis;
}

- (void)setTrackAxis:(unint64_t)a3
{
  self->_trackAxis = a3;
}

- (BSAbsoluteMachTimer)_repeatTimer
{
  return self->_repeatTimer;
}

- (void)set_repeatTimer:(id)a3
{
}

- (BSAbsoluteMachTimer)_releaseTimer
{
  return self->_releaseTimer;
}

- (void)set_releaseTimer:(id)a3
{
}

- (BOOL)_isRepeating
{
  return self->_isRepeating;
}

- (void)set_isRepeating:(BOOL)a3
{
  self->_isRepeating = a3;
}

- (unint64_t)_pressedButton
{
  return self->__pressedButton;
}

- (void)set_pressedButton:(unint64_t)a3
{
  self->__pressedButton = a3;
}

- (double)_value
{
  return self->__value;
}

- (void)set_value:(double)a3
{
  self->__value = a3;
}

- (double)_lastReleaseTimestamp
{
  return self->__lastReleaseTimestamp;
}

- (void)set_lastReleaseTimestamp:(double)a3
{
  self->__lastReleaseTimestamp = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_releaseTimer, 0);
  objc_storeStrong((id *)&self->_repeatTimer, 0);
  objc_destroyWeak((id *)&self->_view);
  objc_destroyWeak((id *)&self->_drivable);
}

@end