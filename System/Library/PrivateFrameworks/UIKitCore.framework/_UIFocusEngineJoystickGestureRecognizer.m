@interface _UIFocusEngineJoystickGestureRecognizer
- (BOOL)_isGestureType:(int64_t)a3;
- (BOOL)_shouldReceivePress:(id)a3;
- (CGPoint)previousStickPosition;
- (CGPoint)stickPosition;
- (_UIFocusEngineJoystickGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4;
- (void)_calculateStickPositionFromPresses:(id)a3 withEvent:(id)a4;
- (void)pressesBegan:(id)a3 withEvent:(id)a4;
- (void)pressesCancelled:(id)a3 withEvent:(id)a4;
- (void)pressesChanged:(id)a3 withEvent:(id)a4;
- (void)pressesEnded:(id)a3 withEvent:(id)a4;
@end

@implementation _UIFocusEngineJoystickGestureRecognizer

- (_UIFocusEngineJoystickGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  v6.receiver = self;
  v6.super_class = (Class)_UIFocusEngineJoystickGestureRecognizer;
  result = [(UIGestureRecognizer *)&v6 initWithTarget:a3 action:a4];
  if (result)
  {
    CGPoint v5 = (CGPoint)*MEMORY[0x1E4F1DAD8];
    result->_stickPosition = (CGPoint)*MEMORY[0x1E4F1DAD8];
    result->_previousStickPosition = v5;
  }
  return result;
}

- (BOOL)_shouldReceivePress:(id)a3
{
  id v3 = a3;
  if ([v3 _source] == 2) {
    char v4 = [v3 _isAnalogStickPress];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  id v5 = a4;
  id v6 = [v5 allPresses];
  [(_UIFocusEngineJoystickGestureRecognizer *)self _calculateStickPositionFromPresses:v6 withEvent:v5];
}

- (void)pressesChanged:(id)a3 withEvent:(id)a4
{
  id v5 = a4;
  id v6 = [v5 allPresses];
  [(_UIFocusEngineJoystickGestureRecognizer *)self _calculateStickPositionFromPresses:v6 withEvent:v5];
}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  id v5 = a4;
  id v6 = [v5 allPresses];
  [(_UIFocusEngineJoystickGestureRecognizer *)self _calculateStickPositionFromPresses:v6 withEvent:v5];
}

- (void)pressesCancelled:(id)a3 withEvent:(id)a4
{
  id v5 = a4;
  id v6 = [v5 allPresses];
  [(_UIFocusEngineJoystickGestureRecognizer *)self _calculateStickPositionFromPresses:v6 withEvent:v5];
}

- (void)_calculateStickPositionFromPresses:(id)a3 withEvent:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  double v6 = *MEMORY[0x1E4F1DAD8];
  double v7 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v8 = [v5 countByEnumeratingWithState:&v24 objects:v28 count:16];
  double v9 = v7;
  double v10 = v6;
  if (v8)
  {
    uint64_t v11 = v8;
    uint64_t v12 = *(void *)v25;
    double v9 = v7;
    double v10 = v6;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v25 != v12) {
          objc_enumerationMutation(v5);
        }
        v14 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        if ([(_UIFocusEngineJoystickGestureRecognizer *)self _shouldReceivePress:v14])
        {
          if (![v14 type])
          {
            [v14 force];
            double v9 = v15;
          }
          if ([v14 type] == 1)
          {
            [v14 force];
            double v9 = -v16;
          }
          if ([v14 type] == 3)
          {
            [v14 force];
            double v10 = v17;
          }
          if ([v14 type] == 2)
          {
            [v14 force];
            double v10 = -v18;
          }
        }
      }
      uint64_t v11 = [v5 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v11);
  }
  p_stickPosition = &self->_stickPosition;
  if (v10 != self->_stickPosition.x || v9 != self->_stickPosition.y)
  {
    self->_previousStickPosition = *p_stickPosition;
    p_stickPosition->x = v10;
    self->_stickPosition.y = v9;
    BOOL v21 = v9 == v7 && v10 == v6;
    if (self->_previousStickPosition.x != v6 || self->_previousStickPosition.y != v7)
    {
      if (v21) {
        uint64_t v23 = 3;
      }
      else {
        uint64_t v23 = 2;
      }
      goto LABEL_33;
    }
    if (!v21)
    {
      uint64_t v23 = 1;
LABEL_33:
      [(UIGestureRecognizer *)self setState:v23];
    }
  }
}

- (BOOL)_isGestureType:(int64_t)a3
{
  return a3 == 17;
}

- (CGPoint)stickPosition
{
  double x = self->_stickPosition.x;
  double y = self->_stickPosition.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CGPoint)previousStickPosition
{
  double x = self->_previousStickPosition.x;
  double y = self->_previousStickPosition.y;
  result.double y = y;
  result.double x = x;
  return result;
}

@end