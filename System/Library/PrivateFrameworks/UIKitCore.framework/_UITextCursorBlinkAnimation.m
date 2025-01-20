@interface _UITextCursorBlinkAnimation
- (BOOL)isEnabled;
- (UIView)cursorShapeView;
- (_UITextCursorBlinkAnimation)initWithCursorShapeView:(id)a3;
- (void)reset;
- (void)setEnabled:(BOOL)a3;
@end

@implementation _UITextCursorBlinkAnimation

- (_UITextCursorBlinkAnimation)initWithCursorShapeView:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UITextCursorBlinkAnimation;
  v5 = [(_UITextCursorBlinkAnimation *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_cursorShapeView, v4);
  }

  return v6;
}

- (void)setEnabled:(BOOL)a3
{
  if (self->_enabled != a3)
  {
    self->_enabled = a3;
    caretBlinkAnimation = self->_caretBlinkAnimation;
    if (a3)
    {
      if (!caretBlinkAnimation)
      {
        v5 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"opacity"];
        v6 = self->_caretBlinkAnimation;
        self->_caretBlinkAnimation = v5;

        [(CAKeyframeAnimation *)self->_caretBlinkAnimation setCalculationMode:*MEMORY[0x1E4F39D78]];
        [(CAKeyframeAnimation *)self->_caretBlinkAnimation setValues:&unk_1ED3F0B50];
        [(CAKeyframeAnimation *)self->_caretBlinkAnimation setKeyTimes:&unk_1ED3F0B68];
        [(CAKeyframeAnimation *)self->_caretBlinkAnimation setDuration:1.0];
        LODWORD(v7) = 2139095039;
        [(CAKeyframeAnimation *)self->_caretBlinkAnimation setRepeatCount:v7];
      }
      WeakRetained = (CAKeyframeAnimation *)objc_loadWeakRetained((id *)&self->_cursorShapeView);
      objc_super v8 = [(CAKeyframeAnimation *)WeakRetained layer];
      [v8 addAnimation:self->_caretBlinkAnimation forKey:@"_uitcvba"];

      v9 = WeakRetained;
    }
    else
    {
      if (!caretBlinkAnimation) {
        return;
      }
      id v10 = objc_loadWeakRetained((id *)&self->_cursorShapeView);
      v11 = [v10 layer];
      [v11 removeAnimationForKey:@"_uitcvba"];

      v9 = self->_caretBlinkAnimation;
      self->_caretBlinkAnimation = 0;
    }
  }
}

- (void)reset
{
  if (self->_enabled && self->_caretBlinkAnimation)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_cursorShapeView);
    v3 = [WeakRetained layer];
    [v3 addAnimation:self->_caretBlinkAnimation forKey:@"_uitcvba"];
  }
}

- (UIView)cursorShapeView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cursorShapeView);
  return (UIView *)WeakRetained;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_cursorShapeView);
  objc_storeStrong((id *)&self->_caretBlinkAnimation, 0);
}

@end