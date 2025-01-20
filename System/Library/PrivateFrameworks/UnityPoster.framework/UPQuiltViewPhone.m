@interface UPQuiltViewPhone
- (CAShapeLayer)bottomLeftQuiltPieceLayer;
- (CAShapeLayer)bottomRightQuiltPieceLayer;
- (CAShapeLayer)topQuiltPieceLayer;
- (CGPath)bottomLeftQuiltPathRef;
- (CGPath)topQuiltPathRef;
- (UIColor)bottomLeftQuiltColor;
- (UIColor)bottomRightQuiltColor;
- (UIColor)intersectionPieceColor;
- (UIColor)topQuiltColor;
- (UPQuiltConfigurationPhone)configuration;
- (UPQuiltViewPhone)initWithFrame:(CGRect)a3;
- (id)description;
- (uint64_t)bottomRightQuiltPathRef;
- (uint64_t)intersectionPiecePathRef;
- (void)cleanupQuiltPaths;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setBottomLeftQuiltColor:(id)a3;
- (void)setBottomLeftQuiltPieceLayer:(id)a3;
- (void)setBottomRightQuiltColor:(id)a3;
- (void)setBottomRightQuiltPieceLayer:(id)a3;
- (void)setColors;
- (void)setConfiguration:(id)a3;
- (void)setIntersectionPieceColor:(id)a3;
- (void)setTopQuiltColor:(id)a3;
- (void)setTopQuiltPieceLayer:(id)a3;
- (void)updateQuiltsWithUnlockProgress:(double)a3 wakeProgress:(double)a4;
@end

@implementation UPQuiltViewPhone

- (UPQuiltViewPhone)initWithFrame:(CGRect)a3
{
  v17.receiver = self;
  v17.super_class = (Class)UPQuiltViewPhone;
  v3 = -[UPQuiltViewPhone initWithFrame:](&v17, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x263F15880] layer];
    topQuiltPieceLayer = v3->_topQuiltPieceLayer;
    v3->_topQuiltPieceLayer = (CAShapeLayer *)v4;

    uint64_t v6 = [MEMORY[0x263F15880] layer];
    bottomLeftQuiltPieceLayer = v3->_bottomLeftQuiltPieceLayer;
    v3->_bottomLeftQuiltPieceLayer = (CAShapeLayer *)v6;

    uint64_t v8 = [MEMORY[0x263F15880] layer];
    intersectionPieceLayer = v3->_intersectionPieceLayer;
    v3->_intersectionPieceLayer = (CAShapeLayer *)v8;

    uint64_t v10 = [MEMORY[0x263F15880] layer];
    bottomRightQuiltPieceLayer = v3->_bottomRightQuiltPieceLayer;
    v3->_bottomRightQuiltPieceLayer = (CAShapeLayer *)v10;

    v12 = [(UPQuiltViewPhone *)v3 layer];
    [v12 addSublayer:v3->_topQuiltPieceLayer];

    v13 = [(UPQuiltViewPhone *)v3 layer];
    [v13 addSublayer:v3->_bottomLeftQuiltPieceLayer];

    v14 = [(UPQuiltViewPhone *)v3 layer];
    [v14 addSublayer:v3->_intersectionPieceLayer];

    v15 = [(UPQuiltViewPhone *)v3 layer];
    [v15 addSublayer:v3->_bottomRightQuiltPieceLayer];

    [(UPQuiltViewPhone *)v3 setNeedsLayout];
  }
  return v3;
}

- (void)setTopQuiltColor:(id)a3
{
  v5 = (UIColor *)a3;
  [(CAShapeLayer *)self->_topQuiltPieceLayer setHidden:v5 == 0];
  if (self->_topQuiltColor != v5)
  {
    objc_storeStrong((id *)&self->_topQuiltColor, a3);
    [(CAShapeLayer *)self->_topQuiltPieceLayer setFillColor:[(UIColor *)v5 CGColor]];
  }
}

- (void)setBottomLeftQuiltColor:(id)a3
{
  v5 = (UIColor *)a3;
  [(CAShapeLayer *)self->_bottomLeftQuiltPieceLayer setHidden:v5 == 0];
  if (self->_bottomLeftQuiltColor != v5)
  {
    objc_storeStrong((id *)&self->_bottomLeftQuiltColor, a3);
    [(CAShapeLayer *)self->_bottomLeftQuiltPieceLayer setFillColor:[(UIColor *)v5 CGColor]];
  }
}

- (void)setIntersectionPieceColor:(id)a3
{
  v5 = (UIColor *)a3;
  [(CAShapeLayer *)self->_intersectionPieceLayer setHidden:v5 == 0];
  if (self->_intersectionPieceColor != v5)
  {
    [MEMORY[0x263F158F8] begin];
    [MEMORY[0x263F158F8] setDisableActions:1];
    objc_storeStrong((id *)&self->_intersectionPieceColor, a3);
    [(CAShapeLayer *)self->_intersectionPieceLayer setFillColor:[(UIColor *)v5 CGColor]];
    [MEMORY[0x263F158F8] commit];
  }
}

- (void)setBottomRightQuiltColor:(id)a3
{
  v5 = (UIColor *)a3;
  [(CAShapeLayer *)self->_bottomRightQuiltPieceLayer setHidden:v5 == 0];
  if (self->_bottomRightQuiltColor != v5)
  {
    objc_storeStrong((id *)&self->_bottomRightQuiltColor, a3);
    [(CAShapeLayer *)self->_bottomRightQuiltPieceLayer setFillColor:[(UIColor *)v5 CGColor]];
  }
}

- (void)layoutSubviews
{
  v3 = [(UPQuiltView *)self quiltViewDelegate];
  [v3 regenerateConfiguration];

  [(UPQuiltViewPhone *)self bounds];
  -[CAShapeLayer setFrame:](self->_topQuiltPieceLayer, "setFrame:");
  [(UPQuiltViewPhone *)self bounds];
  -[CAShapeLayer setFrame:](self->_bottomLeftQuiltPieceLayer, "setFrame:");
  [(UPQuiltViewPhone *)self bounds];
  -[CAShapeLayer setFrame:](self->_intersectionPieceLayer, "setFrame:");
  [(UPQuiltViewPhone *)self bounds];
  bottomRightQuiltPieceLayer = self->_bottomRightQuiltPieceLayer;
  -[CAShapeLayer setFrame:](bottomRightQuiltPieceLayer, "setFrame:");
}

- (CGPath)topQuiltPathRef
{
  v2 = [(CAShapeLayer *)self->_topQuiltPieceLayer presentationLayer];
  v3 = (CGPath *)[v2 path];

  return v3;
}

- (CGPath)bottomLeftQuiltPathRef
{
  v2 = [(CAShapeLayer *)self->_bottomLeftQuiltPieceLayer presentationLayer];
  v3 = (CGPath *)[v2 path];

  return v3;
}

- (uint64_t)intersectionPiecePathRef
{
  if (result)
  {
    v1 = [*(id *)(result + 560) presentationLayer];
    uint64_t v2 = [v1 path];

    return v2;
  }
  return result;
}

- (uint64_t)bottomRightQuiltPathRef
{
  if (result)
  {
    v1 = [*(id *)(result + 576) presentationLayer];
    uint64_t v2 = [v1 path];

    return v2;
  }
  return result;
}

- (void)setConfiguration:(id)a3
{
  v9 = (UPQuiltConfigurationPhone *)a3;
  if (self->_configuration != v9)
  {
    objc_storeStrong((id *)&self->_configuration, a3);
    id v5 = [(UPQuiltConfigurationPhone *)v9 topQuiltAwakeLockedPath];
    -[CAShapeLayer setPath:](self->_topQuiltPieceLayer, "setPath:", [v5 CGPath]);

    id v6 = [(UPQuiltConfigurationPhone *)v9 bottomLeftQuiltAwakeLockedPath];
    -[CAShapeLayer setPath:](self->_bottomLeftQuiltPieceLayer, "setPath:", [v6 CGPath]);

    id v7 = [(UPQuiltConfigurationPhone *)v9 intersectionPieceAwakeLockedPath];
    -[CAShapeLayer setPath:](self->_intersectionPieceLayer, "setPath:", [v7 CGPath]);

    id v8 = [(UPQuiltConfigurationPhone *)v9 bottomRightQuiltAwakeLockedPath];
    -[CAShapeLayer setPath:](self->_bottomRightQuiltPieceLayer, "setPath:", [v8 CGPath]);
  }
}

- (void)setColors
{
  id v3 = [MEMORY[0x263F825C8] colorWithRed:0.953 green:0.0 blue:0.254 alpha:0.066];
  -[CAShapeLayer setFillColor:](self->_topQuiltPieceLayer, "setFillColor:", [v3 CGColor]);

  id v4 = [MEMORY[0x263F825C8] colorWithRed:0.0 green:0.559 blue:0.23 alpha:1.0];
  -[CAShapeLayer setFillColor:](self->_bottomLeftQuiltPieceLayer, "setFillColor:", [v4 CGColor]);

  id v5 = [MEMORY[0x263F825C8] colorWithRed:0.98 green:0.8 blue:0.0 alpha:1.0];
  -[CAShapeLayer setFillColor:](self->_intersectionPieceLayer, "setFillColor:", [v5 CGColor]);
}

- (void)updateQuiltsWithUnlockProgress:(double)a3 wakeProgress:(double)a4
{
  double v5 = 1.0;
  double v6 = a4 * 5.0 + (1.0 - a4) * 0.0;
  double v7 = a3 * 45.0 + (1.0 - a3) * 0.0;
  id v8 = [(UPQuiltConfigurationPhone *)self->_configuration bottomLeftQuiltAsleepPath];
  v9 = [(UPQuiltConfigurationPhone *)self->_configuration bottomLeftQuiltAwakeLockedPath];
  if (v6 <= 5.0) {
    double v10 = v6 / 5.0;
  }
  else {
    double v10 = 1.0;
  }
  v11 = UPInterpolateBetweenBezierPaths(v8, v9, v10);

  v12 = [(UPQuiltConfigurationPhone *)self->_configuration bottomLeftQuiltUnlockedPath];
  if (v7 <= 45.0) {
    double v5 = v7 / 45.0;
  }
  v13 = UPInterpolateBetweenBezierPaths(v11, v12, v5);

  v14 = [(UPQuiltConfigurationPhone *)self->_configuration topQuiltAsleepPath];
  v15 = [(UPQuiltConfigurationPhone *)self->_configuration topQuiltAwakeLockedPath];
  v16 = UPInterpolateBetweenBezierPaths(v14, v15, v10);

  objc_super v17 = [(UPQuiltConfigurationPhone *)self->_configuration topQuiltUnlockedPath];
  v18 = UPInterpolateBetweenBezierPaths(v16, v17, v5);

  v19 = [(UPQuiltConfigurationPhone *)self->_configuration bottomRightQuiltAwakeLockedPath];
  v20 = [(UPQuiltConfigurationPhone *)self->_configuration bottomRightQuiltUnlockedPath];
  v21 = UPInterpolateBetweenBezierPaths(v19, v20, v5);

  id v22 = v18;
  v23 = (const CGPath *)[v22 CGPath];
  id v24 = v13;
  CopyByIntersectingPath = CGPathCreateCopyByIntersectingPath(v23, (CGPathRef)[v24 CGPath], 0);
  id v26 = v22;
  CopyBySubtractingPath = CGPathCreateCopyBySubtractingPath((CGPathRef)[v26 CGPath], CopyByIntersectingPath, 0);
  id v30 = v24;
  v28 = CGPathCreateCopyBySubtractingPath((CGPathRef)[v30 CGPath], CopyByIntersectingPath, 0);
  [(CAShapeLayer *)self->_topQuiltPieceLayer setPath:CopyBySubtractingPath];
  [(CAShapeLayer *)self->_bottomLeftQuiltPieceLayer setPath:v28];
  [(CAShapeLayer *)self->_intersectionPieceLayer setPath:CopyByIntersectingPath];
  id v29 = v21;
  -[CAShapeLayer setPath:](self->_bottomRightQuiltPieceLayer, "setPath:", [v29 CGPath]);
  if (CopyByIntersectingPath) {
    CGPathRelease(CopyByIntersectingPath);
  }
  if (CopyBySubtractingPath) {
    CGPathRelease(CopyBySubtractingPath);
  }
  if (v28) {
    CGPathRelease(v28);
  }
}

- (void)cleanupQuiltPaths
{
  if (a1)
  {
    uint64_t v2 = *(const CGPath **)(a1 + 536);
    if (v2)
    {
      CGPathRelease(v2);
      *(void *)(a1 + 536) = 0;
    }
    id v3 = *(const CGPath **)(a1 + 552);
    if (v3)
    {
      CGPathRelease(v3);
      *(void *)(a1 + 552) = 0;
    }
  }
}

- (void)dealloc
{
  -[UPQuiltViewPhone cleanupQuiltPaths]((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)UPQuiltViewPhone;
  [(UPQuiltViewPhone *)&v3 dealloc];
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"UPQuilt = memory:%p", self);
}

- (UIColor)topQuiltColor
{
  return self->_topQuiltColor;
}

- (UIColor)bottomLeftQuiltColor
{
  return self->_bottomLeftQuiltColor;
}

- (UIColor)intersectionPieceColor
{
  return self->_intersectionPieceColor;
}

- (UIColor)bottomRightQuiltColor
{
  return self->_bottomRightQuiltColor;
}

- (CAShapeLayer)topQuiltPieceLayer
{
  return self->_topQuiltPieceLayer;
}

- (void)setTopQuiltPieceLayer:(id)a3
{
}

- (CAShapeLayer)bottomLeftQuiltPieceLayer
{
  return self->_bottomLeftQuiltPieceLayer;
}

- (void)setBottomLeftQuiltPieceLayer:(id)a3
{
}

- (CAShapeLayer)bottomRightQuiltPieceLayer
{
  return self->_bottomRightQuiltPieceLayer;
}

- (void)setBottomRightQuiltPieceLayer:(id)a3
{
}

- (UPQuiltConfigurationPhone)configuration
{
  return self->_configuration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_bottomRightQuiltColor, 0);
  objc_storeStrong((id *)&self->_intersectionPieceColor, 0);
  objc_storeStrong((id *)&self->_bottomLeftQuiltColor, 0);
  objc_storeStrong((id *)&self->_topQuiltColor, 0);
  objc_storeStrong((id *)&self->_bottomRightQuiltPieceLayer, 0);
  objc_storeStrong((id *)&self->_intersectionPieceLayer, 0);
  objc_storeStrong((id *)&self->_bottomLeftQuiltPieceLayer, 0);
  objc_storeStrong((id *)&self->_topQuiltPieceLayer, 0);
}

@end