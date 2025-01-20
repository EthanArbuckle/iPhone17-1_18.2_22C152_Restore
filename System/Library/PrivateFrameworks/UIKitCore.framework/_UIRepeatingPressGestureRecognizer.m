@interface _UIRepeatingPressGestureRecognizer
- (BOOL)_isGestureType:(int64_t)a3;
- (BOOL)_shouldReceivePress:(id)a3;
- (_UIRepeatingGestureClock)clock;
- (_UIRepeatingPressGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4;
- (double)_force;
- (int64_t)_buttonType;
- (unint64_t)changeCount;
- (unint64_t)numberOfTouchesRequired;
- (void)_resetGestureRecognizer;
- (void)_setButtonType:(int64_t)a3;
- (void)pressesBegan:(id)a3 withEvent:(id)a4;
- (void)pressesCancelled:(id)a3 withEvent:(id)a4;
- (void)pressesChanged:(id)a3 withEvent:(id)a4;
- (void)pressesEnded:(id)a3 withEvent:(id)a4;
- (void)repeatingGestureClockDidTick:(id)a3;
- (void)setChangeCount:(unint64_t)a3;
- (void)setClock:(id)a3;
- (void)setNumberOfTouchesRequired:(unint64_t)a3;
- (void)setView:(id)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation _UIRepeatingPressGestureRecognizer

- (_UIRepeatingPressGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)_UIRepeatingPressGestureRecognizer;
  v4 = [(UIGestureRecognizer *)&v7 initWithTarget:a3 action:a4];
  if (v4)
  {
    v5 = objc_opt_new();
    [v5 setDelegate:v4];
    [(_UIRepeatingPressGestureRecognizer *)v4 setClock:v5];
  }
  return v4;
}

- (int64_t)_buttonType
{
  v2 = [(UIGestureRecognizer *)self allowedPressTypes];
  if ([v2 count])
  {
    v3 = [v2 firstObject];
    int64_t v4 = [v3 integerValue];
  }
  else
  {
    int64_t v4 = -1;
  }

  return v4;
}

- (void)_setButtonType:(int64_t)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  if ([(_UIRepeatingPressGestureRecognizer *)self _buttonType] != a3)
  {
    v6 = [(UIGestureRecognizer *)self view];

    if (v6)
    {
      v9 = [MEMORY[0x1E4F28B00] currentHandler];
      [v9 handleFailureInMethod:a2 object:self file:@"UIRepeatingPressGestureRecognizer.m" lineNumber:59 description:@"_buttonType can't be changed after a gesture recognizer is added to a view"];
    }
    objc_super v7 = [NSNumber numberWithInteger:a3];
    v10[0] = v7;
    v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
    [(UIGestureRecognizer *)self setAllowedPressTypes:v8];
  }
}

- (BOOL)_shouldReceivePress:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_UIRepeatingPressGestureRecognizer;
  if (-[UIGestureRecognizer _shouldReceivePress:](&v7, sel__shouldReceivePress_)) {
    return 1;
  }
  int64_t v6 = [(_UIRepeatingPressGestureRecognizer *)self _buttonType];
  return v6 == [a3 type];
}

- (void)setView:(id)a3
{
  if (!a3)
  {
    v5 = [(_UIRepeatingPressGestureRecognizer *)self clock];
    [v5 stopClock];
  }
  v6.receiver = self;
  v6.super_class = (Class)_UIRepeatingPressGestureRecognizer;
  [(UIGestureRecognizer *)&v6 setView:a3];
}

- (void)_resetGestureRecognizer
{
  self->_force = 0.0;
  v3 = [(_UIRepeatingPressGestureRecognizer *)self clock];
  [v3 stopClock];

  v4.receiver = self;
  v4.super_class = (Class)_UIRepeatingPressGestureRecognizer;
  [(UIGestureRecognizer *)&v4 _resetGestureRecognizer];
}

- (BOOL)_isGestureType:(int64_t)a3
{
  return a3 == 12;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  self->_force = 1.0;
  if ([(_UIRepeatingPressGestureRecognizer *)self _buttonType] == -1)
  {
    [(_UIRepeatingPressGestureRecognizer *)self setChangeCount:0];
    [(UIGestureRecognizer *)self setState:1];
    id v5 = [(_UIRepeatingPressGestureRecognizer *)self clock];
    [v5 startClock];
  }
  else
  {
    [(UIGestureRecognizer *)self setState:5];
  }
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  if ([(_UIRepeatingPressGestureRecognizer *)self _buttonType] == -1)
  {
    [(UIGestureRecognizer *)self setState:2];
  }
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  if ([(_UIRepeatingPressGestureRecognizer *)self _buttonType] == -1)
  {
    [(UIGestureRecognizer *)self setState:3];
    id v5 = [(_UIRepeatingPressGestureRecognizer *)self clock];
    [v5 stopClock];
  }
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  if ([(_UIRepeatingPressGestureRecognizer *)self _buttonType] == -1)
  {
    [(UIGestureRecognizer *)self setState:4];
    id v5 = [(_UIRepeatingPressGestureRecognizer *)self clock];
    [v5 stopClock];
  }
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  id v5 = objc_msgSend(a4, "_lastPreparedPress", a3);
  [v5 force];
  self->_force = v6;

  [(_UIRepeatingPressGestureRecognizer *)self setChangeCount:0];
  [(UIGestureRecognizer *)self setState:1];
  id v7 = [(_UIRepeatingPressGestureRecognizer *)self clock];
  [v7 startClock];
}

- (void)pressesChanged:(id)a3 withEvent:(id)a4
{
  id v5 = objc_msgSend(a4, "_lastPreparedPress", a3);
  [v5 force];
  self->_force = v6;

  [(UIGestureRecognizer *)self setState:2];
}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  self->_force = 0.0;
  -[UIGestureRecognizer setState:](self, "setState:", 3, a4);
  id v5 = [(_UIRepeatingPressGestureRecognizer *)self clock];
  [v5 stopClock];
}

- (void)pressesCancelled:(id)a3 withEvent:(id)a4
{
  self->_force = 0.0;
  -[UIGestureRecognizer setState:](self, "setState:", 4, a4);
  id v5 = [(_UIRepeatingPressGestureRecognizer *)self clock];
  [v5 stopClock];
}

- (void)repeatingGestureClockDidTick:(id)a3
{
  [(_UIRepeatingPressGestureRecognizer *)self setChangeCount:[(_UIRepeatingPressGestureRecognizer *)self changeCount] + 1];
  [(UIGestureRecognizer *)self setState:2];
}

- (unint64_t)numberOfTouchesRequired
{
  return self->_numberOfTouchesRequired;
}

- (void)setNumberOfTouchesRequired:(unint64_t)a3
{
  self->_numberOfTouchesRequired = a3;
}

- (double)_force
{
  return self->_force;
}

- (unint64_t)changeCount
{
  return self->_changeCount;
}

- (void)setChangeCount:(unint64_t)a3
{
  self->_changeCount = a3;
}

- (_UIRepeatingGestureClock)clock
{
  return self->_clock;
}

- (void)setClock:(id)a3
{
}

- (void).cxx_destruct
{
}

@end