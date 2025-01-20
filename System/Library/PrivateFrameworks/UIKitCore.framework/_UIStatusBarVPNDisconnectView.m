@interface _UIStatusBarVPNDisconnectView
- (CAShapeLayer)iconSlashMaskShapeLayer;
- (CAShapeLayer)slashShapeLayer;
- (CGSize)intrinsicContentSize;
- (UIEdgeInsets)alignmentRectInsets;
- (UIView)slashView;
- (_UIStatusBarImageView)iconView;
- (id)viewForLastBaselineLayout;
- (void)_setupForStyleAttributes:(id)a3;
- (void)animateSlashForUpdate:(id)a3;
- (void)applyStyleAttributes:(id)a3;
- (void)resetSlashForUpdate:(id)a3;
- (void)setIconSlashMaskShapeLayer:(id)a3;
- (void)setIconView:(id)a3;
- (void)setSlashShapeLayer:(id)a3;
- (void)setSlashView:(id)a3;
- (void)updateFramesForStyleAttributes:(id)a3;
@end

@implementation _UIStatusBarVPNDisconnectView

- (void)_setupForStyleAttributes:(id)a3
{
  if (!self->_iconView)
  {
    id v4 = a3;
    v5 = +[_UIStatusBarImageProvider sharedProvider];
    v6 = [v5 imageNamed:@"VPN" styleAttributes:v4];

    id v32 = [v6 imageWithRenderingMode:2];

    v7 = [(UIImageView *)[_UIStatusBarImageView alloc] initWithImage:v32];
    iconView = self->_iconView;
    self->_iconView = v7;

    [(UIView *)self addSubview:self->_iconView];
    v9 = [UIView alloc];
    [(UIView *)self->_iconView frame];
    v10 = -[UIView initWithFrame:](v9, "initWithFrame:");
    id v11 = +[UIColor blackColor];
    uint64_t v12 = [v11 CGColor];
    v13 = [(UIView *)v10 layer];
    [v13 setBackgroundColor:v12];

    v14 = [MEMORY[0x1E4F39C88] layer];
    iconSlashMaskShapeLayer = self->_iconSlashMaskShapeLayer;
    self->_iconSlashMaskShapeLayer = v14;

    id v16 = +[UIColor blackColor];
    -[CAShapeLayer setStrokeColor:](self->_iconSlashMaskShapeLayer, "setStrokeColor:", [v16 CGColor]);

    Mutable = CGPathCreateMutable();
    v34.origin.x = 5.0;
    v34.origin.y = -3.0;
    v34.size.width = 19.0;
    v34.size.height = 19.0;
    CGFloat MinX = CGRectGetMinX(v34);
    v35.origin.x = 5.0;
    v35.origin.y = -3.0;
    v35.size.width = 19.0;
    v35.size.height = 19.0;
    CGFloat MinY = CGRectGetMinY(v35);
    CGPathMoveToPoint(Mutable, 0, MinX, MinY);
    v36.origin.x = 5.0;
    v36.origin.y = -3.0;
    v36.size.width = 19.0;
    v36.size.height = 19.0;
    CGFloat MaxX = CGRectGetMaxX(v36);
    v37.origin.x = 5.0;
    v37.origin.y = -3.0;
    v37.size.width = 19.0;
    v37.size.height = 19.0;
    CGFloat MaxY = CGRectGetMaxY(v37);
    CGPathAddLineToPoint(Mutable, 0, MaxX, MaxY);
    [(CAShapeLayer *)self->_iconSlashMaskShapeLayer setPath:Mutable];
    CGPathRelease(Mutable);
    [(CAShapeLayer *)self->_iconSlashMaskShapeLayer setLineWidth:4.0];
    uint64_t v22 = *MEMORY[0x1E4F3A458];
    [(CAShapeLayer *)self->_iconSlashMaskShapeLayer setLineCap:*MEMORY[0x1E4F3A458]];
    id v23 = +[UIColor blackColor];
    -[CAShapeLayer setStrokeColor:](self->_iconSlashMaskShapeLayer, "setStrokeColor:", [v23 CGColor]);

    [(CAShapeLayer *)self->_iconSlashMaskShapeLayer setStrokeEnd:0.0];
    v24 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A370]];
    [(CAShapeLayer *)self->_iconSlashMaskShapeLayer setCompositingFilter:v24];

    v25 = [(UIView *)v10 layer];
    [v25 addSublayer:self->_iconSlashMaskShapeLayer];

    [(UIView *)self->_iconView setMaskView:v10];
    v26 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", 5.0, -3.0, 19.0, 19.0);
    slashView = self->_slashView;
    self->_slashView = v26;

    [(UIView *)self addSubview:self->_slashView];
    v28 = [MEMORY[0x1E4F39C88] layer];
    slashShapeLayer = self->_slashShapeLayer;
    self->_slashShapeLayer = v28;

    v30 = CGPathCreateMutable();
    CGPathMoveToPoint(v30, 0, 0.0, 0.0);
    CGPathAddLineToPoint(v30, 0, 19.0, 19.0);
    [(CAShapeLayer *)self->_slashShapeLayer setPath:v30];
    CGPathRelease(v30);
    [(CAShapeLayer *)self->_slashShapeLayer setLineWidth:1.0];
    [(CAShapeLayer *)self->_slashShapeLayer setLineCap:v22];
    [(CAShapeLayer *)self->_slashShapeLayer setStrokeEnd:0.0];
    v31 = [(UIView *)self->_slashView layer];
    [v31 addSublayer:self->_slashShapeLayer];

    [(UIImageView *)self->_iconView setImage:v32];
  }
}

- (void)updateFramesForStyleAttributes:(id)a3
{
  [(_UIStatusBarImageView *)self->_iconView intrinsicContentSize];
  double v5 = v4;
  double v7 = v6;
  v8 = [(UIView *)self window];
  v9 = [v8 screen];
  [v9 scale];
  double v11 = UIRectIntegralWithScale(0.0, 0.0, v5, v7, v10);
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;

  [(UIView *)self->_iconView frame];
  v25.origin.x = v18;
  v25.origin.y = v19;
  v25.size.width = v20;
  v25.size.height = v21;
  v24.origin.x = v11;
  v24.origin.y = v13;
  v24.size.width = v15;
  v24.size.height = v17;
  if (!CGRectEqualToRect(v24, v25))
  {
    -[UIImageView setFrame:](self->_iconView, "setFrame:", v11, v13, v15, v17);
    uint64_t v22 = [(UIView *)self->_iconView maskView];
    objc_msgSend(v22, "setFrame:", v11, v13, v15, v17);

    [(UIView *)self invalidateIntrinsicContentSize];
  }
}

- (void)applyStyleAttributes:(id)a3
{
  id v4 = a3;
  [(_UIStatusBarVPNDisconnectView *)self _setupForStyleAttributes:v4];
  [(_UIStatusBarImageView *)self->_iconView applyStyleAttributes:v4];
  [(_UIStatusBarVPNDisconnectView *)self updateFramesForStyleAttributes:v4];
  double v5 = [v4 imageTintColor];

  id v6 = v5;
  -[CAShapeLayer setStrokeColor:](self->_slashShapeLayer, "setStrokeColor:", [v6 CGColor]);
}

- (void)resetSlashForUpdate:(id)a3
{
  id v4 = [a3 styleAttributes];
  [(_UIStatusBarVPNDisconnectView *)self _setupForStyleAttributes:v4];

  [MEMORY[0x1E4F39CF8] begin];
  [MEMORY[0x1E4F39CF8] disableActions];
  [(CAShapeLayer *)self->_iconSlashMaskShapeLayer setStrokeEnd:0.0];
  [(CAShapeLayer *)self->_slashShapeLayer setStrokeEnd:0.0];
  double v5 = (void *)MEMORY[0x1E4F39CF8];
  [v5 commit];
}

- (void)animateSlashForUpdate:(id)a3
{
  id v4 = [a3 styleAttributes];
  [(_UIStatusBarVPNDisconnectView *)self _setupForStyleAttributes:v4];

  id v8 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"strokeEnd"];
  double v5 = [(UIView *)self layer];
  [v5 convertTime:0 toLayer:CACurrentMediaTime()];
  [v8 setBeginTime:v6 + 0.75];

  [v8 setFromValue:&unk_1ED3F1E18];
  [v8 setToValue:&unk_1ED3F1E28];
  [v8 setDuration:0.75];
  [v8 setDelegate:self];
  double v7 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A490]];
  [v8 setTimingFunction:v7];

  [(CAShapeLayer *)self->_iconSlashMaskShapeLayer addAnimation:v8 forKey:@"slash"];
  [(CAShapeLayer *)self->_slashShapeLayer addAnimation:v8 forKey:@"slash"];
  [(CAShapeLayer *)self->_iconSlashMaskShapeLayer setStrokeEnd:1.0];
  [(CAShapeLayer *)self->_slashShapeLayer setStrokeEnd:1.0];
}

- (UIEdgeInsets)alignmentRectInsets
{
  [(UIImageView *)self->_iconView alignmentRectInsets];
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (id)viewForLastBaselineLayout
{
  return self->_iconView;
}

- (CGSize)intrinsicContentSize
{
  [(_UIStatusBarImageView *)self->_iconView intrinsicContentSize];
  result.height = v3;
  result.width = v2;
  return result;
}

- (_UIStatusBarImageView)iconView
{
  return self->_iconView;
}

- (void)setIconView:(id)a3
{
}

- (CAShapeLayer)iconSlashMaskShapeLayer
{
  return self->_iconSlashMaskShapeLayer;
}

- (void)setIconSlashMaskShapeLayer:(id)a3
{
}

- (UIView)slashView
{
  return self->_slashView;
}

- (void)setSlashView:(id)a3
{
}

- (CAShapeLayer)slashShapeLayer
{
  return self->_slashShapeLayer;
}

- (void)setSlashShapeLayer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_slashShapeLayer, 0);
  objc_storeStrong((id *)&self->_slashView, 0);
  objc_storeStrong((id *)&self->_iconSlashMaskShapeLayer, 0);
  objc_storeStrong((id *)&self->_iconView, 0);
}

@end