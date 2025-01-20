@interface UIKeyboardDockItemButton
- (BOOL)pointInsideTapActionRegion:(CGPoint)a3;
- (CAShapeLayer)debugHitLayer;
- (CAShapeLayer)shapeLayer;
- (CGRect)imageRectForContentRect:(CGRect)a3;
- (CGRect)rectWithSize:(CGSize)a3 forContentRect:(CGRect)a4 withAlignmentRectInsets:(UIEdgeInsets)a5;
- (CGRect)tapActionRegion;
- (CGRect)titleRectForContentRect:(CGRect)a3;
- (NSString)identifier;
- (void)addAnimatitionIfNeeded;
- (void)didMoveToSuperview;
- (void)drawRect:(CGRect)a3;
- (void)layoutSubviews;
- (void)setDebugHitLayer:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setShapeLayer:(id)a3;
- (void)setTapActionRegion:(CGRect)a3;
- (void)setTintColor:(id)a3;
- (void)setupDictationAnimationButtonIfNeeded;
- (void)updateFillColor;
@end

@implementation UIKeyboardDockItemButton

- (CGRect)rectWithSize:(CGSize)a3 forContentRect:(CGRect)a4 withAlignmentRectInsets:(UIEdgeInsets)a5
{
  double height = a4.size.height;
  double width = a4.size.width;
  double v7 = a3.height;
  double v8 = a3.width;
  if ([(UIView *)self contentMode] == UIViewContentModeLeft)
  {
    [(UIButton *)self imageEdgeInsets];
    double v11 = 0.0 - v10;
  }
  else if ([(UIView *)self contentMode] == UIViewContentModeRight)
  {
    [(UIButton *)self imageEdgeInsets];
    double v11 = width - v8 + v12;
  }
  else if ([(UIView *)self contentMode] == UIViewContentModeCenter)
  {
    UIRoundToViewScale(self);
    double v11 = v13;
  }
  else
  {
    double v11 = *MEMORY[0x1E4F1DAD8];
  }
  [(UIButton *)self imageEdgeInsets];
  double v15 = height - v7 + v14;
  double v16 = v11;
  double v17 = v8;
  double v18 = v7;
  result.size.double height = v18;
  result.size.double width = v17;
  result.origin.y = v15;
  result.origin.x = v16;
  return result;
}

- (CGRect)imageRectForContentRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v8 = [(UIButton *)self currentImage];
  [v8 size];
  double v10 = v9;
  double v12 = v11;
  double v13 = [(UIButton *)self currentImage];
  [v13 alignmentRectInsets];
  -[UIKeyboardDockItemButton rectWithSize:forContentRect:withAlignmentRectInsets:](self, "rectWithSize:forContentRect:withAlignmentRectInsets:", v10, v12, x, y, width, height, v14, v15, v16, v17);
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;

  double v26 = v19;
  double v27 = v21;
  double v28 = v23;
  double v29 = v25;
  result.size.double height = v29;
  result.size.double width = v28;
  result.origin.double y = v27;
  result.origin.double x = v26;
  return result;
}

- (CGRect)titleRectForContentRect:(CGRect)a3
{
  v20[1] = *MEMORY[0x1E4F143B8];
  v4 = [(UIButton *)self currentTitle];
  uint64_t v19 = *(void *)off_1E52D2040;
  v5 = [off_1E52D39B8 systemFontOfSize:16.0];
  v20[0] = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
  [v4 sizeWithAttributes:v6];
  -[UIKeyboardDockItemButton rectWithSize:forContentRect:withAlignmentRectInsets:](self, "rectWithSize:forContentRect:withAlignmentRectInsets:", 0, 0, 0, 0);
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  double v15 = v8;
  double v16 = v10;
  double v17 = v12;
  double v18 = v14;
  result.size.double height = v18;
  result.size.double width = v17;
  result.origin.double y = v16;
  result.origin.double x = v15;
  return result;
}

- (void)drawRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    if (qword_1EB25B2F8 != -1) {
      dispatch_once(&qword_1EB25B2F8, &__block_literal_global_353);
    }
    if (_MergedGlobals_13_0)
    {
      double v8 = +[UIColor orangeColor];
      [v8 setFill];

      ContextStack = GetContextStack(0);
      if (*(int *)ContextStack < 1) {
        double v10 = 0;
      }
      else {
        double v10 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
      }
      [(UIKeyboardDockItemButton *)self tapActionRegion];
      CGContextFillRect(v10, v12);
    }
  }
  v11.receiver = self;
  v11.super_class = (Class)UIKeyboardDockItemButton;
  -[UIView drawRect:](&v11, sel_drawRect_, x, y, width, height);
}

- (void)didMoveToSuperview
{
  v3.receiver = self;
  v3.super_class = (Class)UIKeyboardDockItemButton;
  [(UIView *)&v3 didMoveToSuperview];
  [(UIKeyboardDockItemButton *)self setupDictationAnimationButtonIfNeeded];
}

- (void)setTintColor:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)UIKeyboardDockItemButton;
  [(UIButton *)&v4 setTintColor:a3];
  [(UIKeyboardDockItemButton *)self updateFillColor];
}

- (void)updateFillColor
{
  BOOL v3 = [(UIView *)self _lightStyleRenderConfig];
  objc_super v4 = [(UIKeyboardDockItemButton *)self shapeLayer];

  if (v4)
  {
    if (v3) {
      +[UIKeyboardDockItem _standardGlyphColor];
    }
    else {
    id v5 = +[UIKeyboardDockItem _darkStyleGlyphColor];
    }
    uint64_t v6 = [v5 CGColor];
    double v7 = [(UIKeyboardDockItemButton *)self shapeLayer];
    [v7 setFillColor:v6];
  }
  if (qword_1EB25B2F8 != -1) {
    dispatch_once(&qword_1EB25B2F8, &__block_literal_global_353);
  }
  if (_MergedGlobals_13_0)
  {
    id v10 = +[UIColor colorWithRed:1.0 green:1.0 blue:0.0 alpha:0.4];
    uint64_t v8 = [v10 CGColor];
    double v9 = [(UIKeyboardDockItemButton *)self debugHitLayer];
    [v9 setFillColor:v8];
  }
}

- (void)layoutSubviews
{
  v28.receiver = self;
  v28.super_class = (Class)UIKeyboardDockItemButton;
  [(UIButton *)&v28 layoutSubviews];
  BOOL v3 = [(UIKeyboardDockItemButton *)self identifier];
  int v4 = [v3 isEqualToString:@"dictationRunning"];

  if (v4)
  {
    id v5 = [(UIButton *)self imageView];
    uint64_t v6 = [v5 layer];
    [v6 setCompositingFilter:*MEMORY[0x1E4F3A370]];
  }
  double v7 = [(UIKeyboardDockItemButton *)self debugHitLayer];

  if (v7)
  {
    uint64_t v8 = [(UIKeyboardDockItemButton *)self debugHitLayer];
    [v8 removeFromSuperlayer];

    [(UIKeyboardDockItemButton *)self setDebugHitLayer:0];
  }
  if (_os_feature_enabled_impl())
  {
    if (qword_1EB25B2F8 != -1) {
      dispatch_once(&qword_1EB25B2F8, &__block_literal_global_353);
    }
    if (_MergedGlobals_13_0)
    {
      double v9 = [MEMORY[0x1E4F39C88] layer];
      [(UIKeyboardDockItemButton *)self setDebugHitLayer:v9];

      [(UIKeyboardDockItemButton *)self tapActionRegion];
      +[UIBezierPath bezierPathWithOvalInRect:](UIBezierPath, "bezierPathWithOvalInRect:");
      id v10 = objc_claimAutoreleasedReturnValue();
      uint64_t v11 = [v10 CGPath];
      CGRect v12 = [(UIKeyboardDockItemButton *)self debugHitLayer];
      [v12 setPath:v11];

      [(UIKeyboardDockItemButton *)self tapActionRegion];
      double v14 = v13;
      double v16 = v15;
      double v18 = v17;
      double v20 = v19;
      double v21 = [(UIKeyboardDockItemButton *)self debugHitLayer];
      objc_msgSend(v21, "setBounds:", v14, v16, v18, v20);

      [(UIKeyboardDockItemButton *)self tapActionRegion];
      double MidX = CGRectGetMidX(v29);
      [(UIKeyboardDockItemButton *)self tapActionRegion];
      double MidY = CGRectGetMidY(v30);
      double v24 = [(UIKeyboardDockItemButton *)self debugHitLayer];
      objc_msgSend(v24, "setPosition:", MidX, MidY);

      double v25 = [(UIView *)self layer];
      double v26 = [(UIKeyboardDockItemButton *)self debugHitLayer];
      double v27 = [(UIView *)self layer];
      [v25 insertSublayer:v26 below:v27];

      [(UIKeyboardDockItemButton *)self updateFillColor];
    }
  }
}

- (BOOL)pointInsideTapActionRegion:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if (_os_feature_enabled_impl())
  {
    [(UIKeyboardDockItemButton *)self tapActionRegion];
    uint64_t v6 = +[UIBezierPath bezierPathWithOvalInRect:](UIBezierPath, "bezierPathWithOvalInRect:");
    char v7 = objc_msgSend(v6, "containsPoint:", x, y);

    return v7;
  }
  else
  {
    [(UIKeyboardDockItemButton *)self tapActionRegion];
    double v13 = x;
    double v14 = y;
    return CGRectContainsPoint(*(CGRect *)&v9, *(CGPoint *)&v13);
  }
}

- (void)setupDictationAnimationButtonIfNeeded
{
  id v32 = [(UIKeyboardDockItemButton *)self identifier];
  if (![v32 isEqualToString:@"dictationRunning"]
    || (([(UIView *)self frame],
         double v4 = *MEMORY[0x1E4F1DB30],
         double v5 = *(double *)(MEMORY[0x1E4F1DB30] + 8),
         v6 == *MEMORY[0x1E4F1DB30])
      ? (BOOL v7 = v3 == v5)
      : (BOOL v7 = 0),
        v7))
  {
  }
  else
  {
    uint64_t v8 = [(UIButton *)self imageView];
    [v8 frame];
    double v10 = v9;
    double v12 = v11;

    if (v10 != v4 || v12 != v5)
    {
      double v14 = [(UIKeyboardDockItemButton *)self shapeLayer];

      if (!v14)
      {
        double v15 = *MEMORY[0x1E4F1DAD8];
        double v16 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
        double v17 = [MEMORY[0x1E4F39C88] layer];
        [(UIKeyboardDockItemButton *)self setShapeLayer:v17];

        +[UIBezierPath bezierPathWithOvalInRect:](UIBezierPath, "bezierPathWithOvalInRect:", v15, v16, 48.0, 48.0);
        id v18 = objc_claimAutoreleasedReturnValue();
        uint64_t v19 = [v18 CGPath];
        double v20 = [(UIKeyboardDockItemButton *)self shapeLayer];
        [v20 setPath:v19];

        double v21 = [(UIKeyboardDockItemButton *)self shapeLayer];
        objc_msgSend(v21, "setBounds:", v15, v16, 48.0, 48.0);

        double v22 = [(UIButton *)self imageView];
        [v22 center];
        double v24 = v23;
        double v26 = v25;
        double v27 = [(UIKeyboardDockItemButton *)self shapeLayer];
        objc_msgSend(v27, "setPosition:", v24, v26);

        objc_super v28 = [(UIView *)self layer];
        CGRect v29 = [(UIKeyboardDockItemButton *)self shapeLayer];
        CGRect v30 = [(UIButton *)self imageView];
        v31 = [v30 layer];
        [v28 insertSublayer:v29 below:v31];

        [(UIKeyboardDockItemButton *)self updateFillColor];
      }
    }
  }
}

- (void)addAnimatitionIfNeeded
{
  double v3 = [(UIKeyboardDockItemButton *)self shapeLayer];
  id v14 = [v3 animationKeys];

  char v4 = [v14 containsObject:@"opacityAnimation"];
  double v5 = (void *)MEMORY[0x1E4F3A490];
  if ((v4 & 1) == 0)
  {
    double v6 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"opacity"];
    [v6 setDuration:1.0];
    LODWORD(v7) = 2139095039;
    [v6 setRepeatCount:v7];
    [v6 setAutoreverses:1];
    [v6 setFromValue:&unk_1ED3F20A8];
    [v6 setToValue:&unk_1ED3F20B8];
    uint64_t v8 = [MEMORY[0x1E4F39C10] functionWithName:*v5];
    [v6 setTimingFunction:v8];

    double v9 = [(UIKeyboardDockItemButton *)self shapeLayer];
    [v9 addAnimation:v6 forKey:@"opacityAnimation"];
  }
  if (([v14 containsObject:@"scaleXYanimation"] & 1) == 0)
  {
    double v10 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"transform.scale.xy"];
    [v10 setFromValue:&unk_1ED3F53D0];
    [v10 setToValue:&unk_1ED3F20C8];
    [v10 setDuration:1.0];
    LODWORD(v11) = 2139095039;
    [v10 setRepeatCount:v11];
    [v10 setAutoreverses:1];
    double v12 = [MEMORY[0x1E4F39C10] functionWithName:*v5];
    [v10 setTimingFunction:v12];

    double v13 = [(UIKeyboardDockItemButton *)self shapeLayer];
    [v13 addAnimation:v10 forKey:@"scaleXYanimation"];
  }
}

- (CGRect)tapActionRegion
{
  double x = self->_tapActionRegion.origin.x;
  double y = self->_tapActionRegion.origin.y;
  double width = self->_tapActionRegion.size.width;
  double height = self->_tapActionRegion.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setTapActionRegion:(CGRect)a3
{
  self->_tapActionRegion = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (CAShapeLayer)shapeLayer
{
  return self->_shapeLayer;
}

- (void)setShapeLayer:(id)a3
{
}

- (CAShapeLayer)debugHitLayer
{
  return self->_debugHitLayer;
}

- (void)setDebugHitLayer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugHitLayer, 0);
  objc_storeStrong((id *)&self->_shapeLayer, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end