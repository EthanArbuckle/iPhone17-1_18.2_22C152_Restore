@interface SBHBorrowedIconView
- (BSInvalidatable)borrowingAssertion;
- (void)configureBorrowingIconImageViewFromIconView:(id)a3;
- (void)invalidate;
- (void)setBorrowingAssertion:(id)a3;
@end

@implementation SBHBorrowedIconView

- (void)configureBorrowingIconImageViewFromIconView:(id)a3
{
  id v4 = a3;
  v5 = [v4 borrowIconImageViewWithOptions:1];
  borrowingAssertion = self->_borrowingAssertion;
  self->_borrowingAssertion = v5;

  id v9 = [v4 customIconImageViewController];
  v7 = [v9 parentViewController];
  objc_msgSend(v7, "bs_removeChildViewController:", v9);

  [(SBIconView *)self setOverrideCustomIconImageViewController:v9];
  [v4 configureMatchingIconView:self];
  v8 = [v4 accessibilityTintColor];

  [(SBIconView *)self setAccessibilityTintColor:v8];
}

- (void)invalidate
{
  [(SBIconView *)self setIcon:0];
  [(SBIconView *)self setOverrideCustomIconImageViewController:0];
  v3 = [(SBHBorrowedIconView *)self borrowingAssertion];
  [v3 invalidate];

  [(SBHBorrowedIconView *)self setBorrowingAssertion:0];
}

- (BSInvalidatable)borrowingAssertion
{
  return self->_borrowingAssertion;
}

- (void)setBorrowingAssertion:(id)a3
{
}

- (void).cxx_destruct
{
}

@end