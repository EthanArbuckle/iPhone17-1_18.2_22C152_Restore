@interface SVVideoAdViewControllerProvider
- (SVVideoAdViewControllerProvider)initWithViewControllerProvider:(id)a3;
- (SVVideoAdViewControllerProviding)viewControllerProvider;
- (UIViewController)viewControllerForModalPresentation;
@end

@implementation SVVideoAdViewControllerProvider

- (SVVideoAdViewControllerProvider)initWithViewControllerProvider:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SVVideoAdViewControllerProvider;
  v5 = [(SVVideoAdViewControllerProvider *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_viewControllerProvider, v4);
  }

  return v6;
}

- (UIViewController)viewControllerForModalPresentation
{
  v2 = [(SVVideoAdViewControllerProvider *)self viewControllerProvider];
  v3 = [v2 viewControllerForModalPresentation];

  return (UIViewController *)v3;
}

- (SVVideoAdViewControllerProviding)viewControllerProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewControllerProvider);

  return (SVVideoAdViewControllerProviding *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end