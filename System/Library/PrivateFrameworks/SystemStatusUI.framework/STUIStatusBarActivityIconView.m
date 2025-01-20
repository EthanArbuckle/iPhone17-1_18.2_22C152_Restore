@interface STUIStatusBarActivityIconView
- (BOOL)isRinging;
- (BOOL)isSymbolPulsing;
- (CAShapeLayer)innerRingShapeLayer;
- (CAShapeLayer)outerRingShapeLayer;
- (UIEdgeInsets)alignmentRectInsets;
- (id)actionForLayer:(id)a3 forKey:(id)a4;
- (void)_setupRingingLayersForStyleAttributes:(id)a3;
- (void)_teardownRingingLayers;
- (void)applyStyleAttributes:(id)a3;
- (void)layoutSubviews;
- (void)resumePersistentAnimation;
- (void)setInnerRingShapeLayer:(id)a3;
- (void)setOuterRingShapeLayer:(id)a3;
- (void)setRinging:(BOOL)a3 forUpdate:(id)a4;
- (void)setSymbolPulsing:(BOOL)a3 forUpdate:(id)a4;
@end

@implementation STUIStatusBarActivityIconView

- (void)_setupRingingLayersForStyleAttributes:(id)a3
{
  if (!self->_innerRingShapeLayer)
  {
    [a3 iconScale];
    self->_ringingIconScale = v4;
    v5 = [MEMORY[0x1E4F39C88] layer];
    innerRingShapeLayer = self->_innerRingShapeLayer;
    self->_innerRingShapeLayer = v5;

    Mutable = CGPathCreateMutable();
    v8 = CGPathCreateMutable();
    CGPathAddArc(v8, 0, self->_ringingIconScale * 9.0, 0.0, self->_ringingIconScale * 4.0, 0.785398163, -0.785398163, 1);
    CGPathAddPath(Mutable, 0, v8);
    CGPathRelease(v8);
    v9 = CGPathCreateMutable();
    CGPathAddArc(v9, 0, self->_ringingIconScale * -9.0, 0.0, self->_ringingIconScale * 4.0, 3.92699082, 2.35619449, 1);
    CGPathAddPath(Mutable, 0, v9);
    CGPathRelease(v9);
    [(CAShapeLayer *)self->_innerRingShapeLayer setPath:Mutable];
    [(CAShapeLayer *)self->_innerRingShapeLayer setLineWidth:0.0];
    [(CAShapeLayer *)self->_innerRingShapeLayer setOpacity:0.0];
    uint64_t v10 = *MEMORY[0x1E4F3A458];
    [(CAShapeLayer *)self->_innerRingShapeLayer setLineCap:*MEMORY[0x1E4F3A458]];
    id v11 = [MEMORY[0x1E4FB1618] colorWithWhite:1.0 alpha:0.75];
    -[CAShapeLayer setStrokeColor:](self->_innerRingShapeLayer, "setStrokeColor:", [v11 CGColor]);

    id v12 = [MEMORY[0x1E4FB1618] clearColor];
    -[CAShapeLayer setFillColor:](self->_innerRingShapeLayer, "setFillColor:", [v12 CGColor]);

    CGPathRelease(Mutable);
    v13 = [(STUIStatusBarActivityIconView *)self layer];
    [v13 addSublayer:self->_innerRingShapeLayer];

    v14 = [MEMORY[0x1E4F39C88] layer];
    outerRingShapeLayer = self->_outerRingShapeLayer;
    self->_outerRingShapeLayer = v14;

    v16 = CGPathCreateMutable();
    v17 = CGPathCreateMutable();
    CGPathAddArc(v17, 0, self->_ringingIconScale * 11.0, 0.0, self->_ringingIconScale * 6.5, 0.785398163, -0.785398163, 1);
    CGPathAddPath(v16, 0, v17);
    CGPathRelease(v17);
    v18 = CGPathCreateMutable();
    CGPathAddArc(v18, 0, self->_ringingIconScale * -11.0, 0.0, self->_ringingIconScale * 6.5, 3.92699082, 2.35619449, 1);
    CGPathAddPath(v16, 0, v18);
    CGPathRelease(v18);
    [(CAShapeLayer *)self->_outerRingShapeLayer setPath:v16];
    [(CAShapeLayer *)self->_outerRingShapeLayer setLineWidth:0.0];
    [(CAShapeLayer *)self->_outerRingShapeLayer setOpacity:0.0];
    [(CAShapeLayer *)self->_outerRingShapeLayer setLineCap:v10];
    id v19 = [MEMORY[0x1E4FB1618] colorWithWhite:1.0 alpha:0.5];
    -[CAShapeLayer setStrokeColor:](self->_outerRingShapeLayer, "setStrokeColor:", [v19 CGColor]);

    id v20 = [MEMORY[0x1E4FB1618] clearColor];
    -[CAShapeLayer setFillColor:](self->_outerRingShapeLayer, "setFillColor:", [v20 CGColor]);

    CGPathRelease(v16);
    id v21 = [(STUIStatusBarActivityIconView *)self layer];
    [v21 addSublayer:self->_outerRingShapeLayer];
  }
}

- (void)_teardownRingingLayers
{
  innerRingShapeLayer = self->_innerRingShapeLayer;
  if (innerRingShapeLayer)
  {
    [(CAShapeLayer *)innerRingShapeLayer removeFromSuperlayer];
    double v4 = self->_innerRingShapeLayer;
    self->_innerRingShapeLayer = 0;

    [(CAShapeLayer *)self->_outerRingShapeLayer removeFromSuperlayer];
    outerRingShapeLayer = self->_outerRingShapeLayer;
    self->_outerRingShapeLayer = 0;
  }
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)STUIStatusBarActivityIconView;
  [(STUIStatusBarActivityIconView *)&v3 layoutSubviews];
  [MEMORY[0x1E4F39CF8] begin];
  [MEMORY[0x1E4F39CF8] setDisableActions:1];
  [(STUIStatusBarActivityIconView *)self bounds];
  UIRectGetCenter();
  -[CAShapeLayer setPosition:](self->_innerRingShapeLayer, "setPosition:");
  [(STUIStatusBarActivityIconView *)self bounds];
  UIRectGetCenter();
  -[CAShapeLayer setPosition:](self->_outerRingShapeLayer, "setPosition:");
  [MEMORY[0x1E4F39CF8] commit];
}

- (void)applyStyleAttributes:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (self->_ringing)
  {
    double ringingIconScale = self->_ringingIconScale;
    [v4 iconScale];
    if (ringingIconScale != v7)
    {
      double v8 = self->_ringingIconScale;
      [v5 iconScale];
      if (v8 != v9)
      {
        [(STUIStatusBarActivityIconView *)self _teardownRingingLayers];
        [(STUIStatusBarActivityIconView *)self _setupRingingLayersForStyleAttributes:v5];
        [(STUIStatusBarActivityIconView *)self resumePersistentAnimation];
      }
      uint64_t v10 = [v5 imageTintColor];
      id v11 = [v10 colorWithAlphaComponent:0.75];
      -[CAShapeLayer setStrokeColor:](self->_innerRingShapeLayer, "setStrokeColor:", [v11 CGColor]);

      id v12 = [v5 imageTintColor];
      id v13 = [v12 colorWithAlphaComponent:0.5];
      -[CAShapeLayer setStrokeColor:](self->_outerRingShapeLayer, "setStrokeColor:", [v13 CGColor]);
    }
  }
  v14.receiver = self;
  v14.super_class = (Class)STUIStatusBarActivityIconView;
  [(STUIStatusBarImageView *)&v14 applyStyleAttributes:v5];
}

- (id)actionForLayer:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 isEqualToString:*MEMORY[0x1E4F3A4A8]])
  {
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    objc_super v14 = __55__STUIStatusBarActivityIconView_actionForLayer_forKey___block_invoke;
    v15 = &unk_1E6AA37A0;
    v16 = self;
    uint64_t v8 = _StatusBar_UIBlockBasedCAAction();
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)STUIStatusBarActivityIconView;
    uint64_t v8 = [(STUIStatusBarActivityIconView *)&v11 actionForLayer:v6 forKey:v7];
  }
  double v9 = (void *)v8;

  return v9;
}

uint64_t __55__STUIStatusBarActivityIconView_actionForLayer_forKey___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) resumePersistentAnimation];
}

- (void)resumePersistentAnimation
{
  v22[4] = *MEMORY[0x1E4F143B8];
  [(STUIStatusBarActivityIconView *)self setNeedsLayout];
  if (self->_ringing)
  {
    objc_super v3 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"opacity"];
    [v3 setValues:&unk_1F2F9C918];
    [v3 setDuration:1.85];
    id v4 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"lineWidth"];
    v22[0] = &unk_1F2F9CCD0;
    v5 = [MEMORY[0x1E4F28ED0] numberWithDouble:self->_ringingIconScale * 1.5];
    v22[1] = v5;
    v22[2] = &unk_1F2F9CCD0;
    v22[3] = &unk_1F2F9CCD0;
    id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:4];
    [v4 setValues:v6];

    [v4 setDuration:1.85];
    id v7 = [MEMORY[0x1E4F39B38] animation];
    [v7 setDuration:2.0];
    v21[0] = v3;
    v21[1] = v4;
    uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:2];
    [v7 setAnimations:v8];

    LODWORD(v9) = 2139095040;
    [v7 setRepeatCount:v9];
    [(CAShapeLayer *)self->_innerRingShapeLayer addAnimation:v7 forKey:@"innerRing"];
    uint64_t v10 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"opacity"];
    [v10 setValues:&unk_1F2F9C930];
    [v10 setBeginTime:0.15];
    [v10 setDuration:1.85];
    objc_super v11 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"lineWidth"];
    v20[0] = &unk_1F2F9CCD0;
    uint64_t v12 = [MEMORY[0x1E4F28ED0] numberWithDouble:self->_ringingIconScale + self->_ringingIconScale];
    v20[1] = v12;
    v20[2] = &unk_1F2F9CCD0;
    v20[3] = &unk_1F2F9CCD0;
    uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:4];
    [v11 setValues:v13];

    [v11 setBeginTime:0.15];
    [v11 setDuration:1.85];
    objc_super v14 = [MEMORY[0x1E4F39B38] animation];
    [v14 setDuration:2.0];
    v19[0] = v10;
    v19[1] = v11;
    v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
    [v14 setAnimations:v15];

    LODWORD(v16) = 2139095040;
    [v14 setRepeatCount:v16];
    [(CAShapeLayer *)self->_outerRingShapeLayer addAnimation:v14 forKey:@"outerRing"];
  }
  symbolPulseEffect = self->_symbolPulseEffect;
  if (symbolPulseEffect)
  {
    v18 = [MEMORY[0x1E4F41A50] optionsWithRepeating];
    [(STUIStatusBarActivityIconView *)self addSymbolEffect:symbolPulseEffect options:v18 animated:1];
  }
}

- (UIEdgeInsets)alignmentRectInsets
{
  if (self->_ringing)
  {
    v11.receiver = self;
    v11.super_class = (Class)STUIStatusBarActivityIconView;
    [(STUIStatusBarActivityIconView *)&v11 alignmentRectInsets];
    double v5 = self->_ringingIconScale * 8.5;
    double v7 = v6 - v5;
    double v9 = v8 - v5;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)STUIStatusBarActivityIconView;
    [(STUIStatusBarActivityIconView *)&v10 alignmentRectInsets];
  }
  result.right = v9;
  result.bottom = v4;
  result.left = v7;
  result.top = v3;
  return result;
}

- (BOOL)isRinging
{
  return self->_ringing;
}

- (void)setRinging:(BOOL)a3 forUpdate:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if (self->_ringing != v4)
  {
    self->_ringing = v4;
    id v8 = v6;
    if (v4)
    {
      double v7 = [v6 styleAttributes];
      [(STUIStatusBarActivityIconView *)self _setupRingingLayersForStyleAttributes:v7];

      [(STUIStatusBarActivityIconView *)self resumePersistentAnimation];
    }
    else
    {
      [(STUIStatusBarActivityIconView *)self _teardownRingingLayers];
    }
    [(STUIStatusBarActivityIconView *)self invalidateIntrinsicContentSize];
    id v6 = v8;
  }
}

- (BOOL)isSymbolPulsing
{
  return self->_symbolPulseEffect != 0;
}

- (void)setSymbolPulsing:(BOOL)a3 forUpdate:(id)a4
{
  BOOL v4 = a3;
  if ([(STUIStatusBarActivityIconView *)self isSymbolPulsing] != a3)
  {
    if (v4)
    {
      id v6 = [MEMORY[0x1E4F41A58] effect];
      symbolPulseEffect = self->_symbolPulseEffect;
      self->_symbolPulseEffect = v6;

      id v8 = self->_symbolPulseEffect;
      uint64_t v12 = [MEMORY[0x1E4F41A50] optionsWithRepeating];
      [(STUIStatusBarActivityIconView *)self addSymbolEffect:v8 options:v12 animated:1];
      double v9 = (NSSymbolPulseEffect *)v12;
    }
    else
    {
      objc_super v10 = self->_symbolPulseEffect;
      objc_super v11 = [MEMORY[0x1E4F41A50] options];
      [(STUIStatusBarActivityIconView *)self removeSymbolEffectOfType:v10 options:v11 animated:1];

      double v9 = self->_symbolPulseEffect;
      self->_symbolPulseEffect = 0;
    }
  }
}

- (CAShapeLayer)innerRingShapeLayer
{
  return self->_innerRingShapeLayer;
}

- (void)setInnerRingShapeLayer:(id)a3
{
}

- (CAShapeLayer)outerRingShapeLayer
{
  return self->_outerRingShapeLayer;
}

- (void)setOuterRingShapeLayer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outerRingShapeLayer, 0);
  objc_storeStrong((id *)&self->_innerRingShapeLayer, 0);
  objc_storeStrong((id *)&self->_symbolPulseEffect, 0);
}

@end