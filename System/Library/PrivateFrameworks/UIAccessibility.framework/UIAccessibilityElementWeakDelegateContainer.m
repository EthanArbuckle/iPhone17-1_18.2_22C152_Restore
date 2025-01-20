@interface UIAccessibilityElementWeakDelegateContainer
- (id)delegate;
- (void)setDelegate:(id)a3;
@end

@implementation UIAccessibilityElementWeakDelegateContainer

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained(&self->_delegate);

  return WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end