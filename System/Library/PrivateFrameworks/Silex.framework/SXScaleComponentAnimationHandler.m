@interface SXScaleComponentAnimationHandler
- (void)finishAnimation;
- (void)prepareAnimation;
- (void)startAnimation;
- (void)updateAnimationWithFactor:(double)a3;
@end

@implementation SXScaleComponentAnimationHandler

- (void)prepareAnimation
{
  v7.receiver = self;
  v7.super_class = (Class)SXScaleComponentAnimationHandler;
  [(SXComponentAnimationHandler *)&v7 prepareAnimation];
  memset(&v6, 0, sizeof(v6));
  CATransform3DMakeScale(&v6, 0.5, 0.5, 1.0);
  v3 = [(SXComponentAnimationHandler *)self component];
  v4 = [v3 layer];
  CATransform3D v5 = v6;
  [v4 setTransform:&v5];
}

- (void)updateAnimationWithFactor:(double)a3
{
  v10.receiver = self;
  v10.super_class = (Class)SXScaleComponentAnimationHandler;
  -[SXComponentAnimationHandler updateAnimationWithFactor:](&v10, sel_updateAnimationWithFactor_);
  if (UIAccessibilityIsVoiceOverRunning() || UIAccessibilityIsReduceMotionEnabled()) {
    double v5 = 1.0;
  }
  else {
    double v5 = a3 * 0.5 + 0.5;
  }
  memset(&v9, 0, sizeof(v9));
  CATransform3DMakeScale(&v9, v5, v5, 1.0);
  CATransform3D v6 = [(SXComponentAnimationHandler *)self component];
  objc_super v7 = [v6 layer];
  CATransform3D v8 = v9;
  [v7 setTransform:&v8];
}

- (void)startAnimation
{
  v14.receiver = self;
  v14.super_class = (Class)SXScaleComponentAnimationHandler;
  [(SXComponentAnimationHandler *)&v14 startAnimation];
  v3 = [(SXComponentAnimationHandler *)self component];
  v4 = [v3 layer];
  double v5 = [v4 presentationLayer];

  CATransform3D v6 = [MEMORY[0x263F15760] animationWithKeyPath:@"transform.scale"];
  objc_super v7 = [v5 valueForKeyPath:@"transform.scale"];
  [v6 setFromValue:v7];

  [v6 setToValue:&unk_26D593B48];
  [v6 setDuration:0.3];
  CATransform3D v8 = [MEMORY[0x263F15808] functionWithName:*MEMORY[0x263F15EB8]];
  [v6 setTimingFunction:v8];

  [v6 setDelegate:self];
  [v6 setRemovedOnCompletion:0];
  [v6 setFillMode:*MEMORY[0x263F15AB0]];
  CATransform3D v9 = [(SXComponentAnimationHandler *)self component];
  objc_super v10 = [v9 layer];
  [v10 addAnimation:v6 forKey:@"scaleAnimation"];

  v11 = [(SXComponentAnimationHandler *)self component];
  v12 = [v11 layer];
  CATransform3DMakeScale(&v13, 1.0, 1.0, 1.0);
  [v12 setTransform:&v13];
}

- (void)finishAnimation
{
  v12.receiver = self;
  v12.super_class = (Class)SXScaleComponentAnimationHandler;
  [(SXComponentAnimationHandler *)&v12 finishAnimation];
  v3 = [(SXComponentAnimationHandler *)self component];
  v4 = [v3 layer];
  [v4 removeAnimationForKey:@"scaleAnimation"];

  double v5 = [(SXComponentAnimationHandler *)self component];
  CATransform3D v6 = [v5 layer];
  long long v7 = *(_OWORD *)(MEMORY[0x263F15740] + 80);
  v11[4] = *(_OWORD *)(MEMORY[0x263F15740] + 64);
  v11[5] = v7;
  long long v8 = *(_OWORD *)(MEMORY[0x263F15740] + 112);
  v11[6] = *(_OWORD *)(MEMORY[0x263F15740] + 96);
  v11[7] = v8;
  long long v9 = *(_OWORD *)(MEMORY[0x263F15740] + 16);
  v11[0] = *MEMORY[0x263F15740];
  v11[1] = v9;
  long long v10 = *(_OWORD *)(MEMORY[0x263F15740] + 48);
  v11[2] = *(_OWORD *)(MEMORY[0x263F15740] + 32);
  v11[3] = v10;
  [v6 setTransform:v11];
}

@end