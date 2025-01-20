@interface TSKPulseAnimationController
- (BOOL)autohide;
- (BOOL)drawRoundedRect;
- (BOOL)pulsating;
- (TSKPulseAnimationController)initWithDelegate:(id)a3;
- (double)duration;
- (double)pulseOffset;
- (void)animationDidStop:(id)a3 finished:(BOOL)a4;
- (void)dealloc;
- (void)disconnect;
- (void)reset;
- (void)setAutohide:(BOOL)a3;
- (void)setDuration:(double)a3;
- (void)setPulsating:(BOOL)a3;
- (void)setPulseOffset:(double)a3;
- (void)startAnimating;
- (void)stop;
@end

@implementation TSKPulseAnimationController

- (TSKPulseAnimationController)initWithDelegate:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TSKPulseAnimationController;
  result = [(TSKPulseAnimationController *)&v5 init];
  if (result)
  {
    result->_delegate = (TSKPulseAnimationControllerProtocol *)a3;
    result->_duration = 0.1;
    result->_pulseOffset = 6.0;
  }
  return result;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)TSKPulseAnimationController;
  [(TSKHighlightController *)&v2 dealloc];
}

- (void)reset
{
  self->_delegate = 0;
  v2.receiver = self;
  v2.super_class = (Class)TSKPulseAnimationController;
  [(TSKHighlightController *)&v2 reset];
}

- (void)disconnect
{
  self->_delegate = 0;
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  if (self->_pulsating
    && (!self->_autohide
     || objc_msgSend((id)objc_msgSend(a3, "keyPath"), "isEqualToString:", @"opacity")))
  {
    self->_pulsating = 0;
    if (self->_autohide)
    {
      [(TSKHighlightController *)self hide];
      [(CALayer *)[(TSKHighlightController *)self layer] removeAllAnimations];
      [(TSKHighlightController *)self setImage:0];
    }
    delegate = self->_delegate;
    -[TSKPulseAnimationControllerProtocol pulseAnimationDidStopForPulse:](delegate, "pulseAnimationDidStopForPulse:", self, a4);
  }
}

- (void)stop
{
  BOOL pulsating = self->_pulsating;
  self->_BOOL pulsating = 0;
  [(TSKHighlightController *)self hide];
  [(CALayer *)[(TSKHighlightController *)self layer] removeAllAnimations];
  [(TSKHighlightController *)self setImage:0];
  if (pulsating)
  {
    delegate = self->_delegate;
    [(TSKPulseAnimationControllerProtocol *)delegate pulseAnimationDidStopForPulse:self];
  }
}

- (BOOL)drawRoundedRect
{
  return 1;
}

- (void)startAnimating
{
  v32[3] = *MEMORY[0x263EF8340];
  [(CALayer *)[(TSKHighlightController *)self layer] removeAllAnimations];
  if ([(TSKHighlightController *)self path])
  {
    CGRectGetWidth(self->super._overallRect);
    CGRectGetHeight(self->super._overallRect);
    TSUClamp();
    *(float *)&double v3 = v3;
    self->_BOOL pulsating = 1;
    long long v4 = *(_OWORD *)(MEMORY[0x263F15740] + 80);
    *(_OWORD *)&v30.m31 = *(_OWORD *)(MEMORY[0x263F15740] + 64);
    *(_OWORD *)&v30.m33 = v4;
    long long v26 = *(_OWORD *)&v30.m31;
    long long v27 = v4;
    long long v5 = v4;
    long long v6 = *(_OWORD *)(MEMORY[0x263F15740] + 112);
    *(_OWORD *)&v30.m41 = *(_OWORD *)(MEMORY[0x263F15740] + 96);
    *(_OWORD *)&v30.m43 = v6;
    long long v24 = *(_OWORD *)&v30.m41;
    long long v25 = v6;
    long long v7 = v6;
    long long v8 = *(_OWORD *)(MEMORY[0x263F15740] + 16);
    *(_OWORD *)&v30.m11 = *MEMORY[0x263F15740];
    *(_OWORD *)&v30.m13 = v8;
    long long v22 = *(_OWORD *)&v30.m11;
    long long v23 = v8;
    long long v9 = v8;
    long long v10 = *(_OWORD *)(MEMORY[0x263F15740] + 48);
    *(_OWORD *)&v30.m21 = *(_OWORD *)(MEMORY[0x263F15740] + 32);
    *(_OWORD *)&v30.m23 = v10;
    long long v20 = *(_OWORD *)&v30.m21;
    long long v21 = v10;
    CGFloat v11 = *(float *)&v3;
    CGFloat v12 = -(self->super._overallRect.origin.x * *(float *)&v3 - self->super._overallRect.origin.x);
    CGFloat v13 = -(self->super._overallRect.origin.y * v11 - self->super._overallRect.origin.y);
    *(_OWORD *)&v29.m31 = *(_OWORD *)&v30.m31;
    *(_OWORD *)&v29.m33 = v5;
    *(_OWORD *)&v29.m41 = *(_OWORD *)&v30.m41;
    *(_OWORD *)&v29.m43 = v7;
    *(_OWORD *)&v29.m11 = *(_OWORD *)&v30.m11;
    *(_OWORD *)&v29.m13 = v9;
    *(_OWORD *)&v29.m21 = *(_OWORD *)&v30.m21;
    *(_OWORD *)&v29.m23 = v10;
    CATransform3DTranslate(&v30, &v29, v12, v13, 0.0);
    CGFloat v14 = -(self->super._overallRect.size.width - self->super._overallRect.size.width * v11) * -0.5;
    CGFloat v15 = -(self->super._overallRect.size.height - self->super._overallRect.size.height * v11) * -0.5;
    CATransform3D v28 = v30;
    CATransform3DTranslate(&v29, &v28, v14, v15, 0.0);
    CATransform3D v30 = v29;
    CATransform3D v28 = v29;
    CATransform3DScale(&v29, &v28, v11, v11, 1.0);
    CATransform3D v30 = v29;
    v16 = (void *)[MEMORY[0x263F157D8] animationWithKeyPath:@"transform"];
    [v16 setKeyTimes:&unk_26D739330];
    *(_OWORD *)&v29.m31 = v26;
    *(_OWORD *)&v29.m33 = v27;
    *(_OWORD *)&v29.m41 = v24;
    *(_OWORD *)&v29.m43 = v25;
    *(_OWORD *)&v29.m11 = v22;
    *(_OWORD *)&v29.m13 = v23;
    *(_OWORD *)&v29.m21 = v20;
    *(_OWORD *)&v29.m23 = v21;
    v32[0] = [MEMORY[0x263F08D40] valueWithCATransform3D:&v29];
    CATransform3D v29 = v30;
    v32[1] = [MEMORY[0x263F08D40] valueWithCATransform3D:&v29];
    *(_OWORD *)&v29.m31 = v26;
    *(_OWORD *)&v29.m33 = v27;
    *(_OWORD *)&v29.m41 = v24;
    *(_OWORD *)&v29.m43 = v25;
    *(_OWORD *)&v29.m11 = v22;
    *(_OWORD *)&v29.m13 = v23;
    *(_OWORD *)&v29.m21 = v20;
    *(_OWORD *)&v29.m23 = v21;
    v32[2] = [MEMORY[0x263F08D40] valueWithCATransform3D:&v29];
    objc_msgSend(v16, "setValues:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v32, 3));
    v31[0] = [MEMORY[0x263F15808] functionWithName:*MEMORY[0x263F15EC8]];
    v31[1] = [MEMORY[0x263F15808] functionWithName:*MEMORY[0x263F15EC0]];
    objc_msgSend(v16, "setTimingFunctions:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v31, 2));
    [v16 setDuration:self->_duration];
    [v16 setDelegate:self];
    uint64_t v17 = *MEMORY[0x263F15AB0];
    [v16 setFillMode:*MEMORY[0x263F15AB0]];
    [v16 setRemovedOnCompletion:0];
    [(CALayer *)[(TSKHighlightController *)self layer] addAnimation:v16 forKey:@"PulseAnimation"];
    if (self->_autohide)
    {
      v18 = (void *)[MEMORY[0x263F15760] animationWithKeyPath:@"opacity"];
      LODWORD(v19) = 1.0;
      objc_msgSend(v18, "setFromValue:", objc_msgSend(NSNumber, "numberWithFloat:", v19));
      objc_msgSend(v18, "setToValue:", objc_msgSend(NSNumber, "numberWithFloat:", 0.0));
      [v18 setDelegate:self];
      [v18 setBeginTime:CACurrentMediaTime() + self->_duration * 2.0];
      [v18 setDuration:self->_duration + self->_duration];
      [v18 setRemovedOnCompletion:0];
      [v18 setFillMode:v17];
      [(CALayer *)[(TSKHighlightController *)self layer] addAnimation:v18 forKey:@"PulseAnimationFade"];
    }
  }
}

- (BOOL)pulsating
{
  return self->_pulsating;
}

- (void)setPulsating:(BOOL)a3
{
  self->_BOOL pulsating = a3;
}

- (BOOL)autohide
{
  return self->_autohide;
}

- (void)setAutohide:(BOOL)a3
{
  self->_autohide = a3;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (double)pulseOffset
{
  return self->_pulseOffset;
}

- (void)setPulseOffset:(double)a3
{
  self->_pulseOffset = a3;
}

@end