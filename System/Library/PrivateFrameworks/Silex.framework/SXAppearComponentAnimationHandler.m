@interface SXAppearComponentAnimationHandler
- (void)finishAnimation;
- (void)prepareAnimation;
- (void)startAnimation;
@end

@implementation SXAppearComponentAnimationHandler

- (void)prepareAnimation
{
  v4.receiver = self;
  v4.super_class = (Class)SXAppearComponentAnimationHandler;
  [(SXComponentAnimationHandler *)&v4 prepareAnimation];
  if (!UIAccessibilityIsVoiceOverRunning())
  {
    v3 = [(SXComponentAnimationHandler *)self component];
    [v3 setHidden:1];
  }
}

- (void)startAnimation
{
  if (!UIAccessibilityIsVoiceOverRunning())
  {
    v7.receiver = self;
    v7.super_class = (Class)SXAppearComponentAnimationHandler;
    [(SXComponentAnimationHandler *)&v7 startAnimation];
    v3 = [(SXComponentAnimationHandler *)self component];
    [v3 setAlpha:0.0];

    objc_super v4 = [(SXComponentAnimationHandler *)self component];
    [v4 setHidden:0];

    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __51__SXAppearComponentAnimationHandler_startAnimation__block_invoke;
    v6[3] = &unk_2646511F8;
    v6[4] = self;
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __51__SXAppearComponentAnimationHandler_startAnimation__block_invoke_2;
    v5[3] = &unk_2646521E0;
    v5[4] = self;
    [MEMORY[0x263F1CB60] animateWithDuration:2 delay:v6 options:v5 animations:0.1 completion:0.0];
  }
}

void __51__SXAppearComponentAnimationHandler_startAnimation__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) component];
  [v1 setAlpha:1.0];
}

uint64_t __51__SXAppearComponentAnimationHandler_startAnimation__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishAnimation];
}

- (void)finishAnimation
{
  v4.receiver = self;
  v4.super_class = (Class)SXAppearComponentAnimationHandler;
  [(SXComponentAnimationHandler *)&v4 finishAnimation];
  if (!UIAccessibilityIsVoiceOverRunning())
  {
    v3 = [(SXComponentAnimationHandler *)self component];
    [v3 setHidden:0];
  }
}

@end