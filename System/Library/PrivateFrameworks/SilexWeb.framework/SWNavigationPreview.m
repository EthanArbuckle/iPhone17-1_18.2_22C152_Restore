@interface SWNavigationPreview
- (NSURLRequest)request;
- (SWNavigationHandler)navigationHandler;
- (SWNavigationPreview)initWithViewController:(id)a3 navigationHandler:(id)a4 URLRequest:(id)a5;
- (UIViewController)viewController;
@end

@implementation SWNavigationPreview

- (SWNavigationPreview)initWithViewController:(id)a3 navigationHandler:(id)a4 URLRequest:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)SWNavigationPreview;
  v11 = [(SWNavigationPreview *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_viewController, v8);
    objc_storeStrong((id *)&v12->_navigationHandler, a4);
    objc_storeStrong((id *)&v12->_request, a5);
  }

  return v12;
}

- (UIViewController)viewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
  return (UIViewController *)WeakRetained;
}

- (SWNavigationHandler)navigationHandler
{
  return self->_navigationHandler;
}

- (NSURLRequest)request
{
  return self->_request;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_navigationHandler, 0);
  objc_destroyWeak((id *)&self->_viewController);
}

@end