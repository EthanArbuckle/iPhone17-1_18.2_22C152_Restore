@interface SBCaptureHardwareButtonFullPressRecognizer
- (BOOL)_shouldReceiveDynamicButton:(id)a3;
- (BOOL)isCaptureButtonFullyPressed;
- (SBCaptureHardwareButtonFullPressRecognizer)initWithTarget:(id)a3 action:(SEL)a4;
- (unint64_t)pressDownTimestamp;
- (unint64_t)pressUpTimestamp;
- (void)_beginIfNeeded;
- (void)_cancelIfNeeded;
- (void)_dynamicButtonsBegan:(id)a3 withEvent:(id)a4;
- (void)_dynamicButtonsCancelled:(id)a3 withEvent:(id)a4;
- (void)_dynamicButtonsChanged:(id)a3 withEvent:(id)a4;
- (void)_dynamicButtonsEnded:(id)a3 withEvent:(id)a4;
- (void)_endIfNeeded;
- (void)reset;
@end

@implementation SBCaptureHardwareButtonFullPressRecognizer

- (SBCaptureHardwareButtonFullPressRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)SBCaptureHardwareButtonFullPressRecognizer;
  v4 = [(_UIAbstractDynamicButtonGestureRecognizer *)&v7 initWithTarget:a3 action:a4];
  v5 = v4;
  if (v4)
  {
    [(_UIAbstractDynamicButtonGestureRecognizer *)v4 _setAllowedPhysicalButtons:32];
    [(SBCaptureHardwareButtonFullPressRecognizer *)v5 _setRequiresSystemGesturesToFail:0];
  }
  return v5;
}

- (BOOL)isCaptureButtonFullyPressed
{
  return self->_isCaptureButtonFullyPressed;
}

- (unint64_t)pressDownTimestamp
{
  return self->_lastDownTimestamp;
}

- (unint64_t)pressUpTimestamp
{
  return self->_lastUpTimestamp;
}

- (BOOL)_shouldReceiveDynamicButton:(id)a3
{
  id v4 = a3;
  [v4 _physicalButton];
  uint64_t v5 = _UIPhysicalButtonSetForPhysicalButton();
  BOOL v6 = (v5 & ~[(_UIAbstractDynamicButtonGestureRecognizer *)self _allowedPhysicalButtons]) == 0
    && [v4 _stage] == 4;

  return v6;
}

- (void)_dynamicButtonsBegan:(id)a3 withEvent:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if ((unint64_t)[v7 count] >= 2)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"SBCaptureHardwareButtonFullPressRecognizer.m" lineNumber:54 description:@"Only expect one Camera Capture Button"];
  }
  v9 = [v7 anyObject];
  if ([v9 _stage] == 4)
  {
    [v9 _timestamp];
    self->_lastDownTimestamp = _UIMachTimeForMediaTime();
    self->_isCaptureButtonFullyPressed = 1;
    [(SBCaptureHardwareButtonFullPressRecognizer *)self _beginIfNeeded];
  }
  v11.receiver = self;
  v11.super_class = (Class)SBCaptureHardwareButtonFullPressRecognizer;
  [(_UIAbstractDynamicButtonGestureRecognizer *)&v11 _dynamicButtonsBegan:v7 withEvent:v8];
}

- (void)_dynamicButtonsChanged:(id)a3 withEvent:(id)a4
{
  v4.receiver = self;
  v4.super_class = (Class)SBCaptureHardwareButtonFullPressRecognizer;
  [(_UIAbstractDynamicButtonGestureRecognizer *)&v4 _dynamicButtonsChanged:a3 withEvent:a4];
}

- (void)_dynamicButtonsEnded:(id)a3 withEvent:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if ((unint64_t)[v7 count] >= 2)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"SBCaptureHardwareButtonFullPressRecognizer.m" lineNumber:69 description:@"Only expect one Camera Capture Button"];
  }
  v9 = [v7 anyObject];
  if ([v9 _stage] == 4)
  {
    self->_isCaptureButtonFullyPressed = 0;
    [v9 _timestamp];
    self->_lastUpTimestamp = _UIMachTimeForMediaTime();
    [(SBCaptureHardwareButtonFullPressRecognizer *)self _endIfNeeded];
  }
  v11.receiver = self;
  v11.super_class = (Class)SBCaptureHardwareButtonFullPressRecognizer;
  [(_UIAbstractDynamicButtonGestureRecognizer *)&v11 _dynamicButtonsEnded:v7 withEvent:v8];
}

- (void)_dynamicButtonsCancelled:(id)a3 withEvent:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(SBCaptureHardwareButtonFullPressRecognizer *)self _cancelIfNeeded];
  v8.receiver = self;
  v8.super_class = (Class)SBCaptureHardwareButtonFullPressRecognizer;
  [(_UIAbstractDynamicButtonGestureRecognizer *)&v8 _dynamicButtonsCancelled:v7 withEvent:v6];
}

- (void)_beginIfNeeded
{
  if (![(SBCaptureHardwareButtonFullPressRecognizer *)self state])
  {
    [(SBCaptureHardwareButtonFullPressRecognizer *)self setState:1];
  }
}

- (void)_endIfNeeded
{
  if ((unint64_t)([(SBCaptureHardwareButtonFullPressRecognizer *)self state] - 1) <= 1)
  {
    [(SBCaptureHardwareButtonFullPressRecognizer *)self setState:3];
  }
}

- (void)_cancelIfNeeded
{
  if ([(SBCaptureHardwareButtonFullPressRecognizer *)self state] <= 2)
  {
    [(SBCaptureHardwareButtonFullPressRecognizer *)self setState:4];
  }
}

- (void)reset
{
  self->_isCaptureButtonFullyPressed = 0;
  self->_lastDownTimestamp = 0;
  self->_lastUpTimestamp = 0;
}

@end