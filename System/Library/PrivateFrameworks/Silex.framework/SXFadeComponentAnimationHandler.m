@interface SXFadeComponentAnimationHandler
- (double)initialAlpha;
- (void)finishAnimation;
- (void)prepareAnimation;
- (void)startAnimation;
- (void)updateAnimationWithFactor:(double)a3;
@end

@implementation SXFadeComponentAnimationHandler

- (void)prepareAnimation
{
  v6.receiver = self;
  v6.super_class = (Class)SXFadeComponentAnimationHandler;
  [(SXComponentAnimationHandler *)&v6 prepareAnimation];
  BOOL IsVoiceOverRunning = UIAccessibilityIsVoiceOverRunning();
  v4 = [(SXComponentAnimationHandler *)self component];
  double v5 = 1.0;
  if (!IsVoiceOverRunning) {
    [(SXFadeComponentAnimationHandler *)self initialAlpha];
  }
  [v4 setAlpha:v5];
}

- (void)updateAnimationWithFactor:(double)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SXFadeComponentAnimationHandler;
  -[SXComponentAnimationHandler updateAnimationWithFactor:](&v8, sel_updateAnimationWithFactor_);
  if (!UIAccessibilityIsVoiceOverRunning())
  {
    [(SXFadeComponentAnimationHandler *)self initialAlpha];
    double v6 = v5 + (1.0 - v5) * a3;
    v7 = [(SXComponentAnimationHandler *)self component];
    [v7 setAlpha:v6];
  }
}

- (void)startAnimation
{
  if (!UIAccessibilityIsVoiceOverRunning())
  {
    v5.receiver = self;
    v5.super_class = (Class)SXFadeComponentAnimationHandler;
    [(SXComponentAnimationHandler *)&v5 startAnimation];
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __49__SXFadeComponentAnimationHandler_startAnimation__block_invoke;
    v4[3] = &unk_2646511F8;
    v4[4] = self;
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __49__SXFadeComponentAnimationHandler_startAnimation__block_invoke_2;
    v3[3] = &unk_2646521E0;
    v3[4] = self;
    [MEMORY[0x263F1CB60] animateWithDuration:2 delay:v4 options:v3 animations:0.3 completion:0.0];
  }
}

void __49__SXFadeComponentAnimationHandler_startAnimation__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) component];
  [v1 setAlpha:1.0];
}

uint64_t __49__SXFadeComponentAnimationHandler_startAnimation__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishAnimation];
}

- (void)finishAnimation
{
  v4.receiver = self;
  v4.super_class = (Class)SXFadeComponentAnimationHandler;
  [(SXComponentAnimationHandler *)&v4 finishAnimation];
  if (!UIAccessibilityIsVoiceOverRunning())
  {
    v3 = [(SXComponentAnimationHandler *)self component];
    [v3 setAlpha:1.0];
  }
}

- (double)initialAlpha
{
  v3 = [(SXComponentAnimationHandler *)self animation];
  [v3 initialAlpha];
  if (v4 == 1.79769313e308)
  {
    double v7 = 0.3;
  }
  else
  {
    objc_super v5 = [(SXComponentAnimationHandler *)self animation];
    [v5 initialAlpha];
    double v7 = v6;
  }
  return v7;
}

@end