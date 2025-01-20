@interface _UISearchControllerTVKeyboardContainerView
- (UIScrollView)observedScrollView;
- (void)setObservedScrollView:(id)a3;
@end

@implementation _UISearchControllerTVKeyboardContainerView

- (UIScrollView)observedScrollView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observedScrollView);
  return (UIScrollView *)WeakRetained;
}

- (void)setObservedScrollView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end