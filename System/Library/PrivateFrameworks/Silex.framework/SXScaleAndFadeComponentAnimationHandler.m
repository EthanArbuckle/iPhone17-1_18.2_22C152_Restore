@interface SXScaleAndFadeComponentAnimationHandler
- (SXScaleAndFadeComponentAnimationHandler)initWithComponent:(id)a3 withAnimation:(id)a4;
- (double)initialAlpha;
- (double)initialScale;
- (void)finishAnimation;
- (void)prepareAnimation;
- (void)setInitialAlpha:(double)a3;
- (void)setInitialScale:(double)a3;
- (void)startAnimation;
- (void)updateAnimationWithFactor:(double)a3;
@end

@implementation SXScaleAndFadeComponentAnimationHandler

- (SXScaleAndFadeComponentAnimationHandler)initWithComponent:(id)a3 withAnimation:(id)a4
{
  v15.receiver = self;
  v15.super_class = (Class)SXScaleAndFadeComponentAnimationHandler;
  v4 = [(SXComponentAnimationHandler *)&v15 initWithComponent:a3 withAnimation:a4];
  v5 = v4;
  if (v4)
  {
    v6 = [(SXComponentAnimationHandler *)v4 animation];
    [v6 initialAlpha];
    if (v7 == 1.79769313e308)
    {
      v5->_initialAlpha = 0.3;
    }
    else
    {
      v8 = [(SXComponentAnimationHandler *)v5 animation];
      [v8 initialAlpha];
      v5->_initialAlpha = v9;
    }
    v10 = [(SXComponentAnimationHandler *)v5 animation];
    [v10 initialAlpha];
    if (v11 == 1.79769313e308)
    {
      v5->_initialScale = 0.75;
    }
    else
    {
      v12 = [(SXComponentAnimationHandler *)v5 animation];
      [v12 initialScale];
      v5->_initialScale = v13;
    }
  }
  return v5;
}

- (void)prepareAnimation
{
  v19.receiver = self;
  v19.super_class = (Class)SXScaleAndFadeComponentAnimationHandler;
  [(SXComponentAnimationHandler *)&v19 prepareAnimation];
  memset(&v18, 0, sizeof(v18));
  [(SXScaleAndFadeComponentAnimationHandler *)self initialScale];
  CGFloat v4 = v3;
  [(SXScaleAndFadeComponentAnimationHandler *)self initialScale];
  CATransform3DMakeScale(&v18, v4, v5, 1.0);
  [(SXScaleAndFadeComponentAnimationHandler *)self initialAlpha];
  double v7 = v6;
  if (UIAccessibilityIsVoiceOverRunning() || UIAccessibilityIsReduceMotionEnabled())
  {
    long long v8 = *(_OWORD *)(MEMORY[0x263F15740] + 80);
    *(_OWORD *)&v18.m31 = *(_OWORD *)(MEMORY[0x263F15740] + 64);
    *(_OWORD *)&v18.m33 = v8;
    long long v9 = *(_OWORD *)(MEMORY[0x263F15740] + 112);
    *(_OWORD *)&v18.m41 = *(_OWORD *)(MEMORY[0x263F15740] + 96);
    *(_OWORD *)&v18.m43 = v9;
    long long v10 = *(_OWORD *)(MEMORY[0x263F15740] + 16);
    *(_OWORD *)&v18.m11 = *MEMORY[0x263F15740];
    *(_OWORD *)&v18.m13 = v10;
    long long v11 = *(_OWORD *)(MEMORY[0x263F15740] + 48);
    *(_OWORD *)&v18.m21 = *(_OWORD *)(MEMORY[0x263F15740] + 32);
    *(_OWORD *)&v18.m23 = v11;
    double v7 = 1.0;
  }
  v12 = [(SXComponentAnimationHandler *)self component];
  double v13 = [v12 layer];
  CATransform3D v17 = v18;
  [v13 setTransform:&v17];

  v14 = [(SXComponentAnimationHandler *)self component];
  objc_super v15 = [v14 layer];
  *(float *)&double v16 = v7;
  [v15 setOpacity:v16];
}

- (void)startAnimation
{
  v24[2] = *MEMORY[0x263EF8340];
  v23.receiver = self;
  v23.super_class = (Class)SXScaleAndFadeComponentAnimationHandler;
  [(SXComponentAnimationHandler *)&v23 startAnimation];
  double v3 = [(SXComponentAnimationHandler *)self component];
  CGFloat v4 = [v3 layer];
  CGFloat v5 = [v4 presentationLayer];

  if (!v5)
  {
    double v6 = [(SXComponentAnimationHandler *)self component];
    CGFloat v5 = [v6 layer];
  }
  double v7 = [MEMORY[0x263F15750] animation];
  [v7 setDelegate:self];
  [v7 setDuration:0.3];
  long long v8 = [MEMORY[0x263F15760] animationWithKeyPath:@"opacity"];
  long long v9 = NSNumber;
  [v5 opacity];
  long long v10 = objc_msgSend(v9, "numberWithFloat:");
  [v8 setFromValue:v10];

  [v8 setToValue:&unk_26D593B30];
  long long v11 = [v5 valueForKeyPath:@"transform.scale"];
  v12 = [MEMORY[0x263F15760] animationWithKeyPath:@"transform.scale"];
  [v12 setFromValue:v11];
  [v12 setToValue:&unk_26D593B30];
  v24[0] = v8;
  v24[1] = v12;
  double v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:2];
  [v7 setAnimations:v13];

  v14 = [(SXComponentAnimationHandler *)self component];
  objc_super v15 = [v14 layer];
  [v15 addAnimation:v7 forKey:@"scaleAndFade"];

  memset(&v22, 0, sizeof(v22));
  CATransform3DMakeScale(&v22, 1.0, 1.0, 1.0);
  double v16 = [(SXComponentAnimationHandler *)self component];
  CATransform3D v17 = [v16 layer];
  CATransform3D v21 = v22;
  [v17 setTransform:&v21];

  CATransform3D v18 = [(SXComponentAnimationHandler *)self component];
  objc_super v19 = [v18 layer];
  LODWORD(v20) = 1.0;
  [v19 setOpacity:v20];
}

- (void)updateAnimationWithFactor:(double)a3
{
  v21.receiver = self;
  v21.super_class = (Class)SXScaleAndFadeComponentAnimationHandler;
  -[SXComponentAnimationHandler updateAnimationWithFactor:](&v21, sel_updateAnimationWithFactor_);
  [(SXScaleAndFadeComponentAnimationHandler *)self initialAlpha];
  double v6 = v5;
  [(SXScaleAndFadeComponentAnimationHandler *)self initialAlpha];
  double v8 = v7;
  [(SXScaleAndFadeComponentAnimationHandler *)self initialScale];
  double v10 = v9;
  [(SXScaleAndFadeComponentAnimationHandler *)self initialScale];
  double v12 = v11;
  if (UIAccessibilityIsVoiceOverRunning() || UIAccessibilityIsReduceMotionEnabled()) {
    double v13 = 1.0;
  }
  else {
    double v13 = v12 + (1.0 - v10) * a3;
  }
  memset(&v20, 0, sizeof(v20));
  CATransform3DMakeScale(&v20, v13, v13, 1.0);
  v14 = [(SXComponentAnimationHandler *)self component];
  objc_super v15 = [v14 layer];
  CATransform3D v19 = v20;
  [v15 setTransform:&v19];

  double v16 = [(SXComponentAnimationHandler *)self component];
  CATransform3D v17 = [v16 layer];
  *(float *)&double v18 = v8 + (1.0 - v6) * a3;
  [v17 setOpacity:v18];
}

- (void)finishAnimation
{
  v13.receiver = self;
  v13.super_class = (Class)SXScaleAndFadeComponentAnimationHandler;
  [(SXComponentAnimationHandler *)&v13 finishAnimation];
  double v3 = [(SXComponentAnimationHandler *)self component];
  CGFloat v4 = [v3 layer];
  long long v5 = *(_OWORD *)(MEMORY[0x263F15740] + 80);
  v12[4] = *(_OWORD *)(MEMORY[0x263F15740] + 64);
  v12[5] = v5;
  long long v6 = *(_OWORD *)(MEMORY[0x263F15740] + 112);
  v12[6] = *(_OWORD *)(MEMORY[0x263F15740] + 96);
  v12[7] = v6;
  long long v7 = *(_OWORD *)(MEMORY[0x263F15740] + 16);
  v12[0] = *MEMORY[0x263F15740];
  v12[1] = v7;
  long long v8 = *(_OWORD *)(MEMORY[0x263F15740] + 48);
  v12[2] = *(_OWORD *)(MEMORY[0x263F15740] + 32);
  v12[3] = v8;
  [v4 setTransform:v12];

  double v9 = [(SXComponentAnimationHandler *)self component];
  double v10 = [v9 layer];
  LODWORD(v11) = 1.0;
  [v10 setOpacity:v11];
}

- (double)initialAlpha
{
  return self->_initialAlpha;
}

- (void)setInitialAlpha:(double)a3
{
  self->_initialAlpha = a3;
}

- (double)initialScale
{
  return self->_initialScale;
}

- (void)setInitialScale:(double)a3
{
  self->_initialScale = a3;
}

@end