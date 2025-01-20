@interface STUIStatusBarVPNDisconnectView
- (BOOL)prefersBaselineAlignment;
- (CAShapeLayer)slashShapeLayer;
- (CAShapeLayer)vpnSlashMaskShapeLayer;
- (CGSize)intrinsicContentSize;
- (STUIStatusBarStringView)vpnView;
- (UIEdgeInsets)alignmentRectInsets;
- (UIView)slashView;
- (id)viewForLastBaselineLayout;
- (void)_setupForStyleAttributes:(id)a3;
- (void)animateSlashForUpdate:(id)a3;
- (void)applyStyleAttributes:(id)a3;
- (void)resetSlashForUpdate:(id)a3;
- (void)setSlashShapeLayer:(id)a3;
- (void)setSlashView:(id)a3;
- (void)setVpnSlashMaskShapeLayer:(id)a3;
- (void)setVpnView:(id)a3;
@end

@implementation STUIStatusBarVPNDisconnectView

- (void)_setupForStyleAttributes:(id)a3
{
  if (!self->_vpnView)
  {
    v4 = objc_alloc_init(STUIStatusBarStringView);
    vpnView = self->_vpnView;
    self->_vpnView = v4;

    [(STUIStatusBarStringView *)self->_vpnView setText:@"VPN"];
    [(STUIStatusBarStringView *)self->_vpnView setEncapsulated:1];
    [(STUIStatusBarStringView *)self->_vpnView sizeToFit];
    [(STUIStatusBarVPNDisconnectView *)self addSubview:self->_vpnView];
    id v6 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    [(STUIStatusBarStringView *)self->_vpnView frame];
    id v28 = (id)objc_msgSend(v6, "initWithFrame:");
    id v7 = [MEMORY[0x1E4FB1618] blackColor];
    uint64_t v8 = [v7 CGColor];
    v9 = [v28 layer];
    [v9 setBackgroundColor:v8];

    v10 = [MEMORY[0x1E4F39C88] layer];
    vpnSlashMaskShapeLayer = self->_vpnSlashMaskShapeLayer;
    self->_vpnSlashMaskShapeLayer = v10;

    id v12 = [MEMORY[0x1E4FB1618] blackColor];
    -[CAShapeLayer setStrokeColor:](self->_vpnSlashMaskShapeLayer, "setStrokeColor:", [v12 CGColor]);

    Mutable = CGPathCreateMutable();
    v30.origin.x = 5.0;
    v30.origin.y = 0.0;
    v30.size.width = 19.0;
    v30.size.height = 19.0;
    CGFloat MinX = CGRectGetMinX(v30);
    v31.origin.x = 5.0;
    v31.origin.y = 0.0;
    v31.size.width = 19.0;
    v31.size.height = 19.0;
    CGFloat MinY = CGRectGetMinY(v31);
    CGPathMoveToPoint(Mutable, 0, MinX, MinY);
    v32.origin.x = 5.0;
    v32.origin.y = 0.0;
    v32.size.width = 19.0;
    v32.size.height = 19.0;
    CGFloat MaxX = CGRectGetMaxX(v32);
    v33.origin.x = 5.0;
    v33.origin.y = 0.0;
    v33.size.width = 19.0;
    v33.size.height = 19.0;
    CGFloat MaxY = CGRectGetMaxY(v33);
    CGPathAddLineToPoint(Mutable, 0, MaxX, MaxY);
    [(CAShapeLayer *)self->_vpnSlashMaskShapeLayer setPath:Mutable];
    CGPathRelease(Mutable);
    [(CAShapeLayer *)self->_vpnSlashMaskShapeLayer setLineWidth:4.0];
    uint64_t v18 = *MEMORY[0x1E4F3A458];
    [(CAShapeLayer *)self->_vpnSlashMaskShapeLayer setLineCap:*MEMORY[0x1E4F3A458]];
    id v19 = [MEMORY[0x1E4FB1618] blackColor];
    -[CAShapeLayer setStrokeColor:](self->_vpnSlashMaskShapeLayer, "setStrokeColor:", [v19 CGColor]);

    [(CAShapeLayer *)self->_vpnSlashMaskShapeLayer setStrokeEnd:0.0];
    v20 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A370]];
    [(CAShapeLayer *)self->_vpnSlashMaskShapeLayer setCompositingFilter:v20];

    v21 = [v28 layer];
    [v21 addSublayer:self->_vpnSlashMaskShapeLayer];

    [(STUIStatusBarStringView *)self->_vpnView setMaskView:v28];
    v22 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", 5.0, 0.0, 19.0, 19.0);
    slashView = self->_slashView;
    self->_slashView = v22;

    [(STUIStatusBarVPNDisconnectView *)self addSubview:self->_slashView];
    v24 = [MEMORY[0x1E4F39C88] layer];
    slashShapeLayer = self->_slashShapeLayer;
    self->_slashShapeLayer = v24;

    v26 = CGPathCreateMutable();
    CGPathMoveToPoint(v26, 0, 0.0, 0.0);
    CGPathAddLineToPoint(v26, 0, 19.0, 19.0);
    [(CAShapeLayer *)self->_slashShapeLayer setPath:v26];
    CGPathRelease(v26);
    [(CAShapeLayer *)self->_slashShapeLayer setLineWidth:1.0];
    [(CAShapeLayer *)self->_slashShapeLayer setLineCap:v18];
    [(CAShapeLayer *)self->_slashShapeLayer setStrokeEnd:0.0];
    v27 = [(UIView *)self->_slashView layer];
    [v27 addSublayer:self->_slashShapeLayer];
  }
}

- (void)applyStyleAttributes:(id)a3
{
  id v4 = a3;
  [(STUIStatusBarVPNDisconnectView *)self _setupForStyleAttributes:v4];
  [(STUIStatusBarStringView *)self->_vpnView applyStyleAttributes:v4];
  v5 = [v4 imageTintColor];

  id v6 = v5;
  -[CAShapeLayer setStrokeColor:](self->_slashShapeLayer, "setStrokeColor:", [v6 CGColor]);
}

- (void)resetSlashForUpdate:(id)a3
{
  id v4 = [a3 styleAttributes];
  [(STUIStatusBarVPNDisconnectView *)self _setupForStyleAttributes:v4];

  [MEMORY[0x1E4F39CF8] begin];
  [MEMORY[0x1E4F39CF8] disableActions];
  [(CAShapeLayer *)self->_vpnSlashMaskShapeLayer setStrokeEnd:0.0];
  [(CAShapeLayer *)self->_slashShapeLayer setStrokeEnd:0.0];
  v5 = (void *)MEMORY[0x1E4F39CF8];
  [v5 commit];
}

- (void)animateSlashForUpdate:(id)a3
{
  id v4 = [a3 styleAttributes];
  [(STUIStatusBarVPNDisconnectView *)self _setupForStyleAttributes:v4];

  id v8 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"strokeEnd"];
  v5 = [(STUIStatusBarVPNDisconnectView *)self layer];
  [v5 convertTime:0 toLayer:CACurrentMediaTime()];
  [v8 setBeginTime:v6 + 0.75];

  [v8 setFromValue:&unk_1F2F9CCF0];
  [v8 setToValue:&unk_1F2F9CD00];
  [v8 setDuration:0.75];
  [v8 setDelegate:self];
  id v7 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A490]];
  [v8 setTimingFunction:v7];

  [(CAShapeLayer *)self->_vpnSlashMaskShapeLayer addAnimation:v8 forKey:@"slash"];
  [(CAShapeLayer *)self->_slashShapeLayer addAnimation:v8 forKey:@"slash"];
  [(CAShapeLayer *)self->_vpnSlashMaskShapeLayer setStrokeEnd:1.0];
  [(CAShapeLayer *)self->_slashShapeLayer setStrokeEnd:1.0];
}

- (BOOL)prefersBaselineAlignment
{
  return 1;
}

- (UIEdgeInsets)alignmentRectInsets
{
  [(STUIStatusBarStringView *)self->_vpnView alignmentRectInsets];
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (id)viewForLastBaselineLayout
{
  return self->_vpnView;
}

- (CGSize)intrinsicContentSize
{
  [(STUIStatusBarStringView *)self->_vpnView intrinsicContentSize];
  result.height = v3;
  result.width = v2;
  return result;
}

- (STUIStatusBarStringView)vpnView
{
  return self->_vpnView;
}

- (void)setVpnView:(id)a3
{
}

- (CAShapeLayer)vpnSlashMaskShapeLayer
{
  return self->_vpnSlashMaskShapeLayer;
}

- (void)setVpnSlashMaskShapeLayer:(id)a3
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
  objc_storeStrong((id *)&self->_vpnSlashMaskShapeLayer, 0);
  objc_storeStrong((id *)&self->_vpnView, 0);
}

@end