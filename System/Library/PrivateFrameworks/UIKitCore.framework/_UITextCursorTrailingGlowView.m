@interface _UITextCursorTrailingGlowView
- (BOOL)isTrailingAnimationEnabled;
- (CGPath)pathForRect:(CGRect)a3;
- (CGRect)estimatedCurrentFrame;
- (_UITextCursorTrailingGlowView)initWithFrame:(CGRect)a3;
- (id)transitionBlock;
- (void)_animate;
- (void)_updateShapeAndAnimate;
- (void)animationDidStop:(id)a3 finished:(BOOL)a4;
- (void)cursorDidMoveToFrame:(CGRect)a3 fromPreviousFrame:(CGRect)a4 isNewLine:(BOOL)a5;
- (void)setTintColor:(id)a3;
- (void)setTrailingAnimationEnabled:(BOOL)a3;
- (void)setTransitionBlock:(id)a3;
@end

@implementation _UITextCursorTrailingGlowView

- (_UITextCursorTrailingGlowView)initWithFrame:(CGRect)a3
{
  v15.receiver = self;
  v15.super_class = (Class)_UITextCursorTrailingGlowView;
  v3 = -[UIView initWithFrame:](&v15, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(UIView *)v3 setUserInteractionEnabled:0];
    v5 = [_UIShapeView alloc];
    uint64_t v6 = -[UIView initWithFrame:](v5, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    shapeView = v4->_shapeView;
    v4->_shapeView = (_UIShapeView *)v6;

    [(UIView *)v4 addSubview:v4->_shapeView];
    v8 = [[UIDictationGlowEffect alloc] initWithView:v4];
    dictationGlowEffect = v4->_dictationGlowEffect;
    v4->_dictationGlowEffect = v8;

    v10 = +[_UIDictationSettingsDomain rootSettings];
    [v10 trailingGlowBlurRadius];
    -[UIDictationGlowEffect setBlurRadius:](v4->_dictationGlowEffect, "setBlurRadius:");

    v11 = +[_UIDictationSettingsDomain rootSettings];
    [v11 trailingGlowAlpha];
    -[UIView setAlpha:](v4, "setAlpha:");

    v12 = [(UIView *)v4 tintColor];
    [(UIView *)v4 alpha];
    v13 = objc_msgSend(v12, "colorWithAlphaComponent:");
    [(UIDictationGlowEffect *)v4->_dictationGlowEffect setTintColor:v13];
  }
  return v4;
}

- (void)setTrailingAnimationEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = +[_UIDictationSettingsDomain rootSettings];
  int v6 = [v5 trailAnimationEnabled];

  if (v6)
  {
    self->_trailingAnimationEnabled = v3;
    if (v3)
    {
      if ([(UIView *)self isHidden]) {
        [(UIView *)self setHidden:0];
      }
      [(_UITextCursorTrailingGlowView *)self _updateShapeAndAnimate];
    }
    else if (self->_animation)
    {
      v7 = [(UIView *)self->_shapeView layer];
      v8 = [v7 mask];
      [v8 removeAnimationForKey:@"mask animation"];

      animation = self->_animation;
      self->_animation = 0;

      [(UIView *)self setHidden:1];
    }
  }
}

- (void)_updateShapeAndAnimate
{
  if (self->_needsToUpdateAnimation)
  {
    self->_needsToUpdateAnimation = 0;
    [(UIView *)self bounds];
    [(UIView *)self bounds];
    [(UIView *)self bounds];
    double v4 = v3;
    [(UIView *)self bounds];
    -[UIView setFrame:](self->_shapeView, "setFrame:", 0.0, 0.0, v4);
    id v5 = [(UIView *)self tintColor];
    uint64_t v6 = [v5 CGColor];
    v7 = [(_UIShapeView *)self->_shapeView shapeLayer];
    [v7 setFillColor:v6];

    [(_UITextCursorTrailingGlowView *)self _animate];
  }
}

- (void)_animate
{
  [(UIView *)self bounds];
  double x = v20.origin.x;
  CGFloat y = v20.origin.y;
  double width = v20.size.width;
  double height = v20.size.height;
  double MaxX = CGRectGetMaxX(v20);
  v8 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"path"];
  animation = self->_animation;
  self->_animation = v8;

  v10 = +[_UIDictationSettingsDomain rootSettings];
  [v10 trailingGlowDuration];
  -[CABasicAnimation setDuration:](self->_animation, "setDuration:");

  v11 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A498]];
  [(CABasicAnimation *)self->_animation setTimingFunction:v11];

  -[CABasicAnimation setFromValue:](self->_animation, "setFromValue:", -[_UITextCursorTrailingGlowView pathForRect:](self, "pathForRect:", x, y, width, height));
  -[CABasicAnimation setToValue:](self->_animation, "setToValue:", -[_UITextCursorTrailingGlowView pathForRect:](self, "pathForRect:", MaxX, y, 0.0, height));
  [(CABasicAnimation *)self->_animation setDelegate:self];
  v12 = +[_UIDictationSettingsDomain rootSettings];
  [v12 trailFrameRate];
  *(float *)&CGFloat y = v13;
  v14 = +[_UIDictationSettingsDomain rootSettings];
  [v14 trailFrameRate];
  float v16 = v15;
  CAFrameRateRange v19 = CAFrameRateRangeMake(30.0, *(float *)&y, v16);
  -[CABasicAnimation setPreferredFrameRateRange:](self->_animation, "setPreferredFrameRateRange:", *(double *)&v19.minimum, *(double *)&v19.maximum, *(double *)&v19.preferred);

  v17 = [(_UIShapeView *)self->_shapeView shapeLayer];
  [v17 addAnimation:self->_animation forKey:@"mask animation"];

  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  self->_animationStartTime = v18;
}

- (CGPath)pathForRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v7 = +[UIBezierPath bezierPath];
  v8 = +[_UIDictationSettingsDomain rootSettings];
  [v8 headHeight];
  double v10 = (1.0 - v9) * 0.5;

  v11 = +[_UIDictationSettingsDomain rootSettings];
  [v11 tailHeight];
  double v13 = (1.0 - v12) * 0.5;

  v21.origin.CGFloat x = x;
  v21.origin.CGFloat y = y;
  v21.size.CGFloat width = width;
  v21.size.CGFloat height = height;
  double MinX = CGRectGetMinX(v21);
  v22.origin.CGFloat x = x;
  v22.origin.CGFloat y = y;
  v22.size.CGFloat width = width;
  v22.size.CGFloat height = height;
  objc_msgSend(v7, "moveToPoint:", MinX, CGRectGetMaxY(v22) * (1.0 - v13));
  v23.origin.CGFloat x = x;
  v23.origin.CGFloat y = y;
  v23.size.CGFloat width = width;
  v23.size.CGFloat height = height;
  double v15 = CGRectGetMinX(v23);
  v24.origin.CGFloat x = x;
  v24.origin.CGFloat y = y;
  v24.size.CGFloat width = width;
  v24.size.CGFloat height = height;
  objc_msgSend(v7, "addLineToPoint:", v15, v13 * CGRectGetMaxY(v24));
  v25.origin.CGFloat x = x;
  v25.origin.CGFloat y = y;
  v25.size.CGFloat width = width;
  v25.size.CGFloat height = height;
  double MaxX = CGRectGetMaxX(v25);
  v26.origin.CGFloat x = x;
  v26.origin.CGFloat y = y;
  v26.size.CGFloat width = width;
  v26.size.CGFloat height = height;
  objc_msgSend(v7, "addLineToPoint:", MaxX, v10 * CGRectGetMaxY(v26));
  v27.origin.CGFloat x = x;
  v27.origin.CGFloat y = y;
  v27.size.CGFloat width = width;
  v27.size.CGFloat height = height;
  double v17 = CGRectGetMaxX(v27);
  v28.origin.CGFloat x = x;
  v28.origin.CGFloat y = y;
  v28.size.CGFloat width = width;
  v28.size.CGFloat height = height;
  objc_msgSend(v7, "addLineToPoint:", v17, (1.0 - v10) * CGRectGetMaxY(v28));
  [v7 closePath];
  id v18 = v7;
  CAFrameRateRange v19 = (CGPath *)[v18 CGPath];

  return v19;
}

- (void)setTintColor:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_UITextCursorTrailingGlowView;
  id v4 = a3;
  [(UIView *)&v7 setTintColor:v4];
  id v5 = +[_UIDictationSettingsDomain rootSettings];
  [v5 trailingGlowAlpha];
  uint64_t v6 = objc_msgSend(v4, "colorWithAlphaComponent:");

  [(UIDictationGlowEffect *)self->_dictationGlowEffect setTintColor:v6];
}

- (void)cursorDidMoveToFrame:(CGRect)a3 fromPreviousFrame:(CGRect)a4 isNewLine:(BOOL)a5
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  CGFloat v9 = a3.size.height;
  CGFloat v10 = a3.size.width;
  double v11 = a3.origin.y;
  double v12 = a3.origin.x;
  if (a5 && self->_animation) {
    [(_UITextCursorTrailingGlowView *)self setTrailingAnimationEnabled:0];
  }
  if (v11 == y)
  {
    v18.origin.double x = x;
    v18.origin.double y = y;
    v18.size.CGFloat width = width;
    v18.size.CGFloat height = height;
    v21.origin.double x = v12;
    v21.origin.double y = v11;
    v21.size.CGFloat width = v10;
    v21.size.CGFloat height = v9;
    if (!CGRectEqualToRect(v18, v21) && x < v12)
    {
      if (self->_animation)
      {
        [(_UITextCursorTrailingGlowView *)self estimatedCurrentFrame];
        double x = v14;
        double y = v15;
        CGFloat width = v16;
        CGFloat height = v17;
      }
      v19.origin.double x = x;
      v19.origin.double y = y;
      v19.size.CGFloat width = width;
      v19.size.CGFloat height = height;
      v22.origin.double x = v12;
      v22.origin.double y = v11;
      v22.size.CGFloat width = v10;
      v22.size.CGFloat height = v9;
      CGRect v20 = CGRectUnion(v19, v22);
      -[UIView setFrame:](self, "setFrame:", v20.origin.x, v20.origin.y, v20.size.width, v20.size.height);
      self->_needsToUpdateAnimation = 1;
    }
  }
}

- (CGRect)estimatedCurrentFrame
{
  [(UIView *)self frame];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v12 = v11;
  [(CABasicAnimation *)self->_animation duration];
  double v14 = fmax(fmin((v12 - self->_animationStartTime) / v13, 1.0), 0.0);
  double v15 = [(CABasicAnimation *)self->_animation timingFunction];
  *(float *)&double v16 = v14;
  [v15 _solveForInput:v16];
  double v18 = v17;

  v24.origin.double x = v4;
  v24.origin.double y = v6;
  v24.size.CGFloat width = v8;
  v24.size.CGFloat height = v10;
  double MaxX = CGRectGetMaxX(v24);
  v25.origin.double x = v4;
  v25.origin.double y = v6;
  v25.size.CGFloat width = v8;
  v25.size.CGFloat height = v10;
  double v20 = MaxX * v18 + (1.0 - v18) * CGRectGetMinX(v25);
  double v21 = MaxX - v20;
  double v22 = v6;
  double v23 = v10;
  result.size.CGFloat height = v23;
  result.size.CGFloat width = v21;
  result.origin.double y = v22;
  result.origin.double x = v20;
  return result;
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  if (a4)
  {
    animation = self->_animation;
    self->_animation = 0;

    [(UIView *)self setHidden:1];
    CGFloat v6 = [(_UITextCursorTrailingGlowView *)self transitionBlock];

    if (v6)
    {
      double v7 = [(_UITextCursorTrailingGlowView *)self transitionBlock];
      v7[2]();
    }
  }
}

- (id)transitionBlock
{
  return self->_transitionBlock;
}

- (void)setTransitionBlock:(id)a3
{
}

- (BOOL)isTrailingAnimationEnabled
{
  return self->_trailingAnimationEnabled;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_transitionBlock, 0);
  objc_storeStrong((id *)&self->_animation, 0);
  objc_storeStrong((id *)&self->_dictationGlowEffect, 0);
  objc_storeStrong((id *)&self->_shapeView, 0);
}

@end