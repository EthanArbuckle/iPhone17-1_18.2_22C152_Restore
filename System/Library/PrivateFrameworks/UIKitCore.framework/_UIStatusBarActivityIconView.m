@interface _UIStatusBarActivityIconView
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
@end

@implementation _UIStatusBarActivityIconView

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
    id v11 = +[UIColor colorWithWhite:1.0 alpha:0.75];
    -[CAShapeLayer setStrokeColor:](self->_innerRingShapeLayer, "setStrokeColor:", [v11 CGColor]);

    id v12 = +[UIColor clearColor];
    -[CAShapeLayer setFillColor:](self->_innerRingShapeLayer, "setFillColor:", [v12 CGColor]);

    CGPathRelease(Mutable);
    v13 = [(UIView *)self layer];
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
    id v19 = +[UIColor colorWithWhite:1.0 alpha:0.5];
    -[CAShapeLayer setStrokeColor:](self->_outerRingShapeLayer, "setStrokeColor:", [v19 CGColor]);

    id v20 = +[UIColor clearColor];
    -[CAShapeLayer setFillColor:](self->_outerRingShapeLayer, "setFillColor:", [v20 CGColor]);

    CGPathRelease(v16);
    id v21 = [(UIView *)self layer];
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
  v11.receiver = self;
  v11.super_class = (Class)_UIStatusBarActivityIconView;
  [(UIImageView *)&v11 layoutSubviews];
  [MEMORY[0x1E4F39CF8] begin];
  [MEMORY[0x1E4F39CF8] setDisableActions:1];
  [(UIView *)self bounds];
  -[CAShapeLayer setPosition:](self->_innerRingShapeLayer, "setPosition:", v4 + v3 * 0.5, v6 + v5 * 0.5);
  [(UIView *)self bounds];
  -[CAShapeLayer setPosition:](self->_outerRingShapeLayer, "setPosition:", v8 + v7 * 0.5, v10 + v9 * 0.5);
  [MEMORY[0x1E4F39CF8] commit];
}

- (void)applyStyleAttributes:(id)a3
{
  id v4 = a3;
  double v5 = v4;
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
        [(_UIStatusBarActivityIconView *)self _teardownRingingLayers];
        [(_UIStatusBarActivityIconView *)self _setupRingingLayersForStyleAttributes:v5];
        [(_UIStatusBarActivityIconView *)self resumePersistentAnimation];
      }
      double v10 = [v5 imageTintColor];
      id v11 = [v10 colorWithAlphaComponent:0.75];
      -[CAShapeLayer setStrokeColor:](self->_innerRingShapeLayer, "setStrokeColor:", [v11 CGColor]);

      id v12 = [v5 imageTintColor];
      id v13 = [v12 colorWithAlphaComponent:0.5];
      -[CAShapeLayer setStrokeColor:](self->_outerRingShapeLayer, "setStrokeColor:", [v13 CGColor]);
    }
  }
  v14.receiver = self;
  v14.super_class = (Class)_UIStatusBarActivityIconView;
  [(_UIStatusBarImageView *)&v14 applyStyleAttributes:v5];
}

- (id)actionForLayer:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 isEqualToString:*MEMORY[0x1E4F3A4A8]])
  {
    double v8 = [UIViewBlockBasedCAAction alloc];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __54___UIStatusBarActivityIconView_actionForLayer_forKey___block_invoke;
    v13[3] = &unk_1E52D9F70;
    v13[4] = self;
    uint64_t v9 = [(UIViewBlockBasedCAAction *)v8 initWithEmptyBlock:v13];
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)_UIStatusBarActivityIconView;
    uint64_t v9 = [(UIView *)&v12 actionForLayer:v6 forKey:v7];
  }
  double v10 = (void *)v9;

  return v10;
}

- (void)resumePersistentAnimation
{
  v20[4] = *MEMORY[0x1E4F143B8];
  [(UIView *)self setNeedsLayout];
  if (self->_ringing)
  {
    double v3 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"opacity"];
    [v3 setValues:&unk_1ED3F1228];
    [v3 setDuration:1.85];
    id v4 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"lineWidth"];
    v20[0] = &unk_1ED3F2658;
    double v5 = [NSNumber numberWithDouble:self->_ringingIconScale * 1.5];
    v20[1] = v5;
    v20[2] = &unk_1ED3F2658;
    v20[3] = &unk_1ED3F2658;
    id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:4];
    [v4 setValues:v6];

    [v4 setDuration:1.85];
    id v7 = [MEMORY[0x1E4F39B38] animation];
    [v7 setDuration:2.0];
    v19[0] = v3;
    v19[1] = v4;
    double v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
    [v7 setAnimations:v8];

    LODWORD(v9) = 2139095040;
    [v7 setRepeatCount:v9];
    [(CAShapeLayer *)self->_innerRingShapeLayer addAnimation:v7 forKey:@"innerRing"];
    double v10 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"opacity"];
    [v10 setValues:&unk_1ED3F1240];
    [v10 setBeginTime:0.15];
    [v10 setDuration:1.85];
    id v11 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"lineWidth"];
    v18[0] = &unk_1ED3F2658;
    objc_super v12 = [NSNumber numberWithDouble:self->_ringingIconScale + self->_ringingIconScale];
    v18[1] = v12;
    v18[2] = &unk_1ED3F2658;
    v18[3] = &unk_1ED3F2658;
    id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:4];
    [v11 setValues:v13];

    [v11 setBeginTime:0.15];
    [v11 setDuration:1.85];
    objc_super v14 = [MEMORY[0x1E4F39B38] animation];
    [v14 setDuration:2.0];
    v17[0] = v10;
    v17[1] = v11;
    v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
    [v14 setAnimations:v15];

    LODWORD(v16) = 2139095040;
    [v14 setRepeatCount:v16];
    [(CAShapeLayer *)self->_outerRingShapeLayer addAnimation:v14 forKey:@"outerRing"];
  }
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
      id v7 = [v6 styleAttributes];
      [(_UIStatusBarActivityIconView *)self _setupRingingLayersForStyleAttributes:v7];

      [(_UIStatusBarActivityIconView *)self resumePersistentAnimation];
    }
    else
    {
      [(_UIStatusBarActivityIconView *)self _teardownRingingLayers];
    }
    [(UIView *)self invalidateIntrinsicContentSize];
    id v6 = v8;
  }
}

- (UIEdgeInsets)alignmentRectInsets
{
  if (self->_ringing)
  {
    v11.receiver = self;
    v11.super_class = (Class)_UIStatusBarActivityIconView;
    [(UIImageView *)&v11 alignmentRectInsets];
    double v5 = self->_ringingIconScale * 8.5;
    double v7 = v6 - v5;
    double v9 = v8 - v5;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)_UIStatusBarActivityIconView;
    [(UIImageView *)&v10 alignmentRectInsets];
  }
  result.right = v9;
  result.bottom = v4;
  result.left = v7;
  result.top = v3;
  return result;
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
}

@end