@interface _SBScrollEventSniffer
- (SBWindowScene)windowScene;
- (_SBScrollEventSnifferDelegate)delegate;
- (void)handleEvent:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setWindowScene:(id)a3;
@end

@implementation _SBScrollEventSniffer

- (void)handleEvent:(id)a3
{
  if ([a3 type] == 10)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained eventSnifferHandledQualifyingScroll:self];
  }
}

- (_SBScrollEventSnifferDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (_SBScrollEventSnifferDelegate *)WeakRetained;
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