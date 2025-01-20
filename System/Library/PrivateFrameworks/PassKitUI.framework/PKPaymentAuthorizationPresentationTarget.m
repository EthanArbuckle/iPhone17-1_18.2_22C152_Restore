@interface PKPaymentAuthorizationPresentationTarget
- (BOOL)shouldAnimatePresentation;
- (UIViewController)presentingViewController;
- (UIViewController)viewControllerToPresent;
- (id)presentationCompletion;
- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4;
- (void)presentPendingViewControllerIfNecessary;
- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)setPresentationCompletion:(id)a3;
- (void)setPresentingViewController:(id)a3;
- (void)setShouldAnimatePresentation:(BOOL)a3;
- (void)setViewControllerToPresent:(id)a3;
@end

@implementation PKPaymentAuthorizationPresentationTarget

- (void)presentPendingViewControllerIfNecessary
{
  p_presentingViewController = &self->_presentingViewController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);
  if (WeakRetained)
  {
    viewControllerToPresent = self->_viewControllerToPresent;

    if (viewControllerToPresent)
    {
      id v6 = objc_loadWeakRetained((id *)p_presentingViewController);
      [v6 presentViewController:self->_viewControllerToPresent animated:self->_shouldAnimatePresentation completion:self->_presentationCompletion];

      v7 = self->_viewControllerToPresent;
      self->_viewControllerToPresent = 0;
    }
  }
}

- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  objc_storeStrong((id *)&self->_viewControllerToPresent, a3);
  id v9 = a3;
  id v10 = a5;
  self->_shouldAnimatePresentation = a4;
  v11 = _Block_copy(v10);

  id presentationCompletion = self->_presentationCompletion;
  self->_id presentationCompletion = v11;

  [(PKPaymentAuthorizationPresentationTarget *)self presentPendingViewControllerIfNecessary];
}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  v8 = (void (**)(void))a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);
  v7 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained dismissViewControllerAnimated:v4 completion:v8];
  }
  else if (v8)
  {
    v8[2]();
  }
}

- (UIViewController)presentingViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);

  return (UIViewController *)WeakRetained;
}

- (void)setPresentingViewController:(id)a3
{
}

- (UIViewController)viewControllerToPresent
{
  return self->_viewControllerToPresent;
}

- (void)setViewControllerToPresent:(id)a3
{
}

- (BOOL)shouldAnimatePresentation
{
  return self->_shouldAnimatePresentation;
}

- (void)setShouldAnimatePresentation:(BOOL)a3
{
  self->_shouldAnimatePresentation = a3;
}

- (id)presentationCompletion
{
  return self->_presentationCompletion;
}

- (void)setPresentationCompletion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_presentationCompletion, 0);
  objc_storeStrong((id *)&self->_viewControllerToPresent, 0);

  objc_destroyWeak((id *)&self->_presentingViewController);
}

@end