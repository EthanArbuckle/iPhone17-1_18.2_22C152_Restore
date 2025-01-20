@interface _UIBarCustomizationChicletAnchorView
+ (id)_jitterRotationAnimationWithAmount:(double)a3;
+ (id)_jitterRotationAnimationWithStrength:(double)a3;
+ (id)_jitterXTranslationAnimationWithAmount:(double)a3;
+ (id)_jitterXTranslationAnimationWithStrength:(double)a3;
+ (id)_jitterYTranslationAnimationWithAmount:(double)a3;
+ (id)_jitterYTranslationAnimationWithStrength:(double)a3;
- (BOOL)debugUIEnabled;
- (BOOL)isUserInteractionEnabled;
- (BOOL)jiggling;
- (CGSize)sizeThatFits:(CGSize)a3;
- (UIView)positionAdaptorView;
- (_UIBarCustomizationChiclet)chiclet;
- (_UIBarCustomizationChicletAnchorView)init;
- (double)contentPadding;
- (id)description;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (int64_t)state;
- (void)layoutSubviews;
- (void)setChiclet:(id)a3;
- (void)setContentPadding:(double)a3;
- (void)setDebugUIEnabled:(BOOL)a3;
- (void)setJiggling:(BOOL)a3;
- (void)setPositionAdaptorView:(id)a3;
- (void)setState:(int64_t)a3;
@end

@implementation _UIBarCustomizationChicletAnchorView

- (_UIBarCustomizationChicletAnchorView)init
{
  v10.receiver = self;
  v10.super_class = (Class)_UIBarCustomizationChicletAnchorView;
  v2 = [(UIView *)&v10 init];
  if (v2)
  {
    v3 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", 0.0, 0.0, 4.0, 4.0);
    [(_UIBarCustomizationChicletAnchorView *)v2 setPositionAdaptorView:v3];

    v4 = [(_UIBarCustomizationChicletAnchorView *)v2 positionAdaptorView];
    [(UIView *)v2 addSubview:v4];

    if (_UIInternalPreferencesRevisionOnce != -1) {
      dispatch_once(&_UIInternalPreferencesRevisionOnce, &__block_literal_global_5_8);
    }
    int v5 = _UIInternalPreferencesRevisionVar;
    if (_UIInternalPreferencesRevisionVar < 1
      || (int v9 = _UIInternalPreference_BarCustomizationDebugEnabled,
          _UIInternalPreferencesRevisionVar == _UIInternalPreference_BarCustomizationDebugEnabled))
    {
      BOOL v6 = 0;
    }
    else
    {
      do
      {
        BOOL v6 = v5 < v9;
        if (v5 < v9) {
          break;
        }
        _UIInternalPreferenceSync(v5, &_UIInternalPreference_BarCustomizationDebugEnabled, @"BarCustomizationDebugEnabled", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool);
        int v9 = _UIInternalPreference_BarCustomizationDebugEnabled;
      }
      while (v5 != _UIInternalPreference_BarCustomizationDebugEnabled);
    }
    if (byte_1E8FD4F84) {
      BOOL v7 = v6;
    }
    else {
      BOOL v7 = 0;
    }
    [(_UIBarCustomizationChicletAnchorView *)v2 setDebugUIEnabled:v7];
  }
  return v2;
}

- (void)layoutSubviews
{
  v18.receiver = self;
  v18.super_class = (Class)_UIBarCustomizationChicletAnchorView;
  [(UIView *)&v18 layoutSubviews];
  [(UIView *)self bounds];
  double v5 = v4 + v3 * 0.5;
  double v8 = v7 + v6 * 0.5;
  int v9 = [(_UIBarCustomizationChicletAnchorView *)self positionAdaptorView];
  objc_msgSend(v9, "setCenter:", v5, v8);

  objc_super v10 = [(_UIBarCustomizationChicletAnchorView *)self positionAdaptorView];
  [v10 bounds];
  double v13 = v12 + v11 * 0.5;
  double v16 = v15 + v14 * 0.5;
  v17 = [(_UIBarCustomizationChicletAnchorView *)self chiclet];
  objc_msgSend(v17, "setCenter:", v13, v16);
}

- (void)setChiclet:(id)a3
{
  double v5 = (_UIBarCustomizationChiclet *)a3;
  p_chiclet = &self->_chiclet;
  chiclet = self->_chiclet;
  int v9 = v5;
  if (chiclet != v5)
  {
    [(_UIBarCustomizationChiclet *)chiclet setAnchorView:0];
    objc_storeStrong((id *)&self->_chiclet, a3);
    if (*p_chiclet)
    {
      [(_UIBarCustomizationChiclet *)*p_chiclet setAnchorView:self];
      double v8 = [(_UIBarCustomizationChicletAnchorView *)self positionAdaptorView];
      [v8 addSubview:*p_chiclet];

      [(UIView *)self sizeToFit];
    }
  }
}

- (void)setState:(int64_t)a3
{
  if (self->_state != a3)
  {
    self->_state = a3;
    [(UIView *)self setClipsToBounds:a3 == 1];
  }
}

- (BOOL)isUserInteractionEnabled
{
  if ([(_UIBarCustomizationChicletAnchorView *)self state]) {
    return 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)_UIBarCustomizationChicletAnchorView;
  return [(UIView *)&v4 isUserInteractionEnabled];
}

- (void)setContentPadding:(double)a3
{
  if (self->_contentPadding != a3)
  {
    self->_contentPadding = a3;
    [(UIView *)self sizeToFit];
    if (+[UIView _isInAnimationBlock])
    {
      [(UIView *)self layoutIfNeeded];
    }
  }
}

- (void)setJiggling:(BOOL)a3
{
  int v3 = a3;
  id v12 = [(_UIBarCustomizationChicletAnchorView *)self chiclet];
  if (([v12 fixed] & 1) == 0)
  {
    int jiggling = self->_jiggling;

    if (jiggling == v3) {
      return;
    }
    self->_int jiggling = v3;
    double v6 = [(_UIBarCustomizationChicletAnchorView *)self positionAdaptorView];
    id v12 = [v6 layer];

    if (self->_jiggling)
    {
      double v7 = [(_UIBarCustomizationChicletAnchorView *)self chiclet];
      [v7 bounds];
      double v8 = 60.0 / CGRectGetWidth(v14);

      if (v8 > 1.0) {
        double v8 = 1.0;
      }
      int v9 = [(id)objc_opt_class() _jitterRotationAnimationWithStrength:v8];
      objc_super v10 = [(id)objc_opt_class() _jitterXTranslationAnimationWithStrength:1.0];
      double v11 = [(id)objc_opt_class() _jitterYTranslationAnimationWithStrength:1.0];
      [v12 addAnimation:v9 forKey:@"RotationJitterAnimation"];
      [v12 addAnimation:v10 forKey:@"XTranslationJitterAnimation"];
      [v12 addAnimation:v11 forKey:@"YTranslationJitterAnimation"];
    }
    else
    {
      [v12 removeAllAnimations];
    }
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  objc_super v4 = [(_UIBarCustomizationChicletAnchorView *)self chiclet];
  [v4 bounds];
  double Width = CGRectGetWidth(v11);
  [(_UIBarCustomizationChicletAnchorView *)self contentPadding];
  double v7 = Width + v6;

  double v8 = 100.0;
  double v9 = v7;
  result.height = v8;
  result.width = v9;
  return result;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  if ([(_UIBarCustomizationChicletAnchorView *)self isUserInteractionEnabled])
  {
    double v8 = [(_UIBarCustomizationChicletAnchorView *)self chiclet];
    double v9 = v8;
    if (v8 && ([v8 fixed] & 1) == 0)
    {
      -[UIView convertPoint:toView:](self, "convertPoint:toView:", v9, x, y);
      objc_super v10 = objc_msgSend(v9, "hitTest:withEvent:", v7);
    }
    else
    {
      objc_super v10 = 0;
    }
  }
  else
  {
    objc_super v10 = 0;
  }

  return v10;
}

- (id)description
{
  int v3 = NSString;
  [(UIView *)self frame];
  uint64_t v5 = v4;
  [(UIView *)self frame];
  uint64_t v7 = v6;
  [(UIView *)self frame];
  uint64_t v9 = v8;
  [(UIView *)self frame];
  CGRect v11 = objc_msgSend(v3, "stringWithFormat:", @"(%g %g %g %g)", v5, v7, v9, v10);;
  int64_t v12 = [(_UIBarCustomizationChicletAnchorView *)self state];
  double v13 = @"Dragging";
  if (v12 != 1) {
    double v13 = 0;
  }
  if (v12) {
    CGRect v14 = v13;
  }
  else {
    CGRect v14 = @"Default";
  }
  objc_msgSend(MEMORY[0x1E4F28E78], "stringWithFormat:", @"<%@: %p; frame = %@; state = %@>",
    objc_opt_class(),
    self,
    v11,
  double v15 = v14);

  return v15;
}

+ (id)_jitterXTranslationAnimationWithStrength:(double)a3
{
  return (id)[a1 _jitterXTranslationAnimationWithAmount:a3 * 0.4];
}

+ (id)_jitterXTranslationAnimationWithAmount:(double)a3
{
  uint64_t v4 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"transform.translation.x"];
  [v4 setDuration:0.134];
  [v4 setBeginTime:(double)arc4random_uniform(0x64u) / 100.0];
  uint64_t v5 = [NSNumber numberWithDouble:a3];
  [v4 setFromValue:v5];

  uint64_t v6 = [NSNumber numberWithDouble:-a3];
  [v4 setToValue:v6];

  LODWORD(v7) = 1052266988;
  LODWORD(v8) = 1059145646;
  LODWORD(v9) = 1.0;
  uint64_t v10 = [MEMORY[0x1E4F39C10] functionWithControlPoints:v7 :0.0 :v8 :v9];
  [v4 setTimingFunction:v10];

  LODWORD(v11) = 2139095040;
  [v4 setRepeatCount:v11];
  [v4 setAutoreverses:1];
  [v4 setRemovedOnCompletion:0];
  return v4;
}

+ (id)_jitterYTranslationAnimationWithStrength:(double)a3
{
  return (id)[a1 _jitterYTranslationAnimationWithAmount:a3 * 0.4];
}

+ (id)_jitterYTranslationAnimationWithAmount:(double)a3
{
  uint64_t v4 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"transform.translation.y"];
  [v4 setDuration:0.142];
  [v4 setBeginTime:(double)arc4random_uniform(0x64u) / 100.0];
  uint64_t v5 = [NSNumber numberWithDouble:a3];
  [v4 setFromValue:v5];

  uint64_t v6 = [NSNumber numberWithDouble:-a3];
  [v4 setToValue:v6];

  LODWORD(v7) = 1052266988;
  LODWORD(v8) = 1059145646;
  LODWORD(v9) = 1.0;
  uint64_t v10 = [MEMORY[0x1E4F39C10] functionWithControlPoints:v7 :0.0 :v8 :v9];
  [v4 setTimingFunction:v10];

  LODWORD(v11) = 2139095040;
  [v4 setRepeatCount:v11];
  [v4 setAutoreverses:1];
  [v4 setRemovedOnCompletion:0];
  return v4;
}

+ (id)_jitterRotationAnimationWithStrength:(double)a3
{
  return (id)[a1 _jitterRotationAnimationWithAmount:a3 * 0.03];
}

+ (id)_jitterRotationAnimationWithAmount:(double)a3
{
  uint64_t v4 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"transform.rotation"];
  [v4 setDuration:0.128];
  [v4 setBeginTime:(double)arc4random_uniform(0x64u) / 100.0];
  uint64_t v5 = [NSNumber numberWithDouble:-a3];
  [v4 setFromValue:v5];

  uint64_t v6 = [NSNumber numberWithDouble:a3];
  [v4 setToValue:v6];

  LODWORD(v7) = 1052266988;
  LODWORD(v8) = 1059145646;
  LODWORD(v9) = 1.0;
  uint64_t v10 = [MEMORY[0x1E4F39C10] functionWithControlPoints:v7 :0.0 :v8 :v9];
  [v4 setTimingFunction:v10];

  LODWORD(v11) = 2139095040;
  [v4 setRepeatCount:v11];
  [v4 setAutoreverses:1];
  [v4 setRemovedOnCompletion:0];
  return v4;
}

- (void)setDebugUIEnabled:(BOOL)a3
{
  if (self->_debugUIEnabled != a3)
  {
    self->_debugUIEnabled = a3;
    if (a3)
    {
      uint64_t v4 = +[UIColor colorWithHue:(double)arc4random_uniform(0x167u) / 359.0 saturation:0.6 brightness:0.9 alpha:1.0];
      uint64_t v5 = [(UIView *)self layer];
      [v5 setBorderWidth:1.0];

      id v6 = v4;
      uint64_t v7 = [v6 CGColor];
      double v8 = [(UIView *)self layer];
      [v8 setBorderColor:v7];

      double v9 = [(_UIBarCustomizationChicletAnchorView *)self positionAdaptorView];
      uint64_t v10 = [v9 layer];
      [v10 setBorderWidth:1.0];

      id v15 = v6;
      uint64_t v11 = [v15 CGColor];
      int64_t v12 = [(_UIBarCustomizationChicletAnchorView *)self positionAdaptorView];
      double v13 = [v12 layer];
      [v13 setBorderColor:v11];
    }
    else
    {
      CGRect v14 = [(UIView *)self layer];
      [v14 setBorderWidth:0.0];

      id v15 = [(_UIBarCustomizationChicletAnchorView *)self positionAdaptorView];
      int64_t v12 = [v15 layer];
      [v12 setBorderWidth:0.0];
    }
  }
}

- (int64_t)state
{
  return self->_state;
}

- (double)contentPadding
{
  return self->_contentPadding;
}

- (BOOL)jiggling
{
  return self->_jiggling;
}

- (_UIBarCustomizationChiclet)chiclet
{
  return self->_chiclet;
}

- (UIView)positionAdaptorView
{
  return self->_positionAdaptorView;
}

- (void)setPositionAdaptorView:(id)a3
{
}

- (BOOL)debugUIEnabled
{
  return self->_debugUIEnabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_positionAdaptorView, 0);
  objc_storeStrong((id *)&self->_chiclet, 0);
}

@end