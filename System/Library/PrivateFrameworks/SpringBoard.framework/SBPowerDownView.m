@interface SBPowerDownView
- (SBPowerDownViewDelegate)powerDownDelegate;
- (void)_cancelButtonTapped;
- (void)_didTapFindMy;
- (void)_idleTimerFired;
- (void)_powerDownSliderDidBeginSlide;
- (void)_powerDownSliderDidCancelSlide;
- (void)_powerDownSliderDidCompleteSlide;
- (void)_powerDownSliderDidUpdateSlideWithValue:(double)a3;
- (void)setPowerDownDelegate:(id)a3;
@end

@implementation SBPowerDownView

- (void)_powerDownSliderDidBeginSlide
{
  v3 = [(SBPowerDownView *)self powerDownDelegate];
  if (objc_opt_respondsToSelector()) {
    [v3 powerDownViewDidBeginSlide:self];
  }
  v4.receiver = self;
  v4.super_class = (Class)SBPowerDownView;
  [(SBUIPowerDownView *)&v4 _powerDownSliderDidBeginSlide];
}

- (void)_powerDownSliderDidUpdateSlideWithValue:(double)a3
{
  v5 = [(SBPowerDownView *)self powerDownDelegate];
  if (objc_opt_respondsToSelector()) {
    [v5 powerDownView:self didUpdateSlideWithValue:a3];
  }
  v6.receiver = self;
  v6.super_class = (Class)SBPowerDownView;
  [(SBUIPowerDownView *)&v6 _powerDownSliderDidUpdateSlideWithValue:a3];
}

- (void)_powerDownSliderDidCompleteSlide
{
  v3 = [(SBPowerDownView *)self powerDownDelegate];
  if ([(SBUIPowerDownView *)self deviceSupportsFindMy]
    && (BOOL v4 = [(SBUIPowerDownView *)self shouldPowerDownViewShowFindMyAlert], v3)
    && v4)
  {
    v9.receiver = self;
    v9.super_class = (Class)SBPowerDownView;
    [(SBUIPowerDownView *)&v9 _prepareViewsForAlert];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __51__SBPowerDownView__powerDownSliderDidCompleteSlide__block_invoke;
    v7[3] = &unk_1E6AF5290;
    v7[4] = self;
    id v8 = v3;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __51__SBPowerDownView__powerDownSliderDidCompleteSlide__block_invoke_2;
    v6[3] = &unk_1E6AF4AC0;
    v6[4] = self;
    [v8 showPowerDownFindMyAlertWithProceed:v7 cancelCompletion:v6];
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      [v3 powerDownViewDidCompleteSlide:self];
    }
    v5.receiver = self;
    v5.super_class = (Class)SBPowerDownView;
    [(SBUIPowerDownView *)&v5 _powerDownSliderDidCompleteSlide];
  }
}

id __51__SBPowerDownView__powerDownSliderDidCompleteSlide__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setShouldPowerDownViewShowFindMyAlert:0];
  if (objc_opt_respondsToSelector()) {
    [*(id *)(a1 + 40) powerDownViewDidCompleteSlide:*(void *)(a1 + 32)];
  }
  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)SBPowerDownView;
  return objc_msgSendSuper2(&v3, sel__powerDownSliderDidCompleteSlide);
}

uint64_t __51__SBPowerDownView__powerDownSliderDidCompleteSlide__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setShouldPowerDownViewShowFindMyAlert:0];
}

- (void)_powerDownSliderDidCancelSlide
{
  objc_super v3 = [(SBPowerDownView *)self powerDownDelegate];
  if (objc_opt_respondsToSelector()) {
    [v3 powerDownViewDidCancelSlide:self];
  }
  v4.receiver = self;
  v4.super_class = (Class)SBPowerDownView;
  [(SBUIPowerDownView *)&v4 _powerDownSliderDidCancelSlide];
}

- (void)_cancelButtonTapped
{
  objc_super v3 = [(SBPowerDownView *)self powerDownDelegate];
  if (objc_opt_respondsToSelector()) {
    [v3 powerDownViewDidReceiveCancelButtonAction:self];
  }
  v4.receiver = self;
  v4.super_class = (Class)SBPowerDownView;
  [(SBUIPowerDownView *)&v4 _cancelButtonTapped];
}

- (void)_didTapFindMy
{
  objc_super v3 = [(SBPowerDownView *)self powerDownDelegate];
  v4.receiver = self;
  v4.super_class = (Class)SBPowerDownView;
  [(SBUIPowerDownView *)&v4 _prepareViewsForAlert];
  [v3 showPowerDownFindMyAlert];
}

- (void)_idleTimerFired
{
  objc_super v3 = [(SBPowerDownView *)self powerDownDelegate];
  if (objc_opt_respondsToSelector()) {
    [v3 powerDownViewDidFireIdleTimer:self];
  }
  v4.receiver = self;
  v4.super_class = (Class)SBPowerDownView;
  [(SBUIPowerDownView *)&v4 _idleTimerFired];
}

- (SBPowerDownViewDelegate)powerDownDelegate
{
  v4.receiver = self;
  v4.super_class = (Class)SBPowerDownView;
  v2 = [(SBUIPowerDownView *)&v4 delegate];
  return (SBPowerDownViewDelegate *)v2;
}

- (void)setPowerDownDelegate:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)SBPowerDownView;
  [(SBUIPowerDownView *)&v3 setDelegate:a3];
}

@end