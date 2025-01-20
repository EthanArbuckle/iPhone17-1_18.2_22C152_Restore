@interface _SBContinuityTouchEventSniffer
- (SBWindowScene)windowScene;
- (_SBContinuityTouchEventSnifferDelegate)delegate;
- (void)handleEvent:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setWindowScene:(id)a3;
@end

@implementation _SBContinuityTouchEventSniffer

- (void)handleEvent:(id)a3
{
  if (![a3 type])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained eventSnifferHandledQualifyingContinuityTouch:self];
  }
}

- (_SBContinuityTouchEventSnifferDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (_SBContinuityTouchEventSnifferDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SBWindowScene)windowScene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  return (SBWindowScene *)WeakRetained;
}

- (void)setWindowScene:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_windowScene);
  objc_destroyWeak((id *)&self->_delegate);
}

@end