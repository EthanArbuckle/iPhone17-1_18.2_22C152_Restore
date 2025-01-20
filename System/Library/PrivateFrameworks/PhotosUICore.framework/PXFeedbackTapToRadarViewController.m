@interface PXFeedbackTapToRadarViewController
- (BOOL)requestScreenshotPermission;
- (NSArray)routes;
- (NSString)routesDescription;
- (PXFeedbackTapToRadarViewController)init;
- (_PXFeedbackTapToRadarViewController)feedbackViewController;
- (id)fileRadarHandler;
- (void)didSelectFileRadarButtonWithScreenshotAllowed:(BOOL)a3 attachDiagnose:(BOOL)a4 selectedRoute:(id)a5;
- (void)setFeedbackViewController:(id)a3;
- (void)setFileRadarHandler:(id)a3;
- (void)setRequestScreenshotPermission:(BOOL)a3;
- (void)setRoutes:(id)a3;
- (void)setRoutesDescription:(id)a3;
@end

@implementation PXFeedbackTapToRadarViewController

void __54___PXFeedbackTapToRadarViewController_fileRadarButton__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _didSelectFileRadarButton];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feedbackViewController, 0);
  objc_storeStrong((id *)&self->_routesDescription, 0);
  objc_storeStrong((id *)&self->_routes, 0);
  objc_storeStrong(&self->_fileRadarHandler, 0);
}

- (void)setFeedbackViewController:(id)a3
{
}

- (_PXFeedbackTapToRadarViewController)feedbackViewController
{
  return self->_feedbackViewController;
}

- (void)setRoutesDescription:(id)a3
{
}

- (NSString)routesDescription
{
  return self->_routesDescription;
}

- (void)setRoutes:(id)a3
{
}

- (NSArray)routes
{
  return self->_routes;
}

- (void)setRequestScreenshotPermission:(BOOL)a3
{
  self->_requestScreenshotPermission = a3;
}

- (BOOL)requestScreenshotPermission
{
  return self->_requestScreenshotPermission;
}

- (void)setFileRadarHandler:(id)a3
{
}

- (id)fileRadarHandler
{
  return self->_fileRadarHandler;
}

- (void)didSelectFileRadarButtonWithScreenshotAllowed:(BOOL)a3 attachDiagnose:(BOOL)a4 selectedRoute:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  id v8 = a5;
  v9 = [(PXFeedbackTapToRadarViewController *)self fileRadarHandler];
  v9[2](v9, v6, v5, v8);
}

- (PXFeedbackTapToRadarViewController)init
{
  v5.receiver = self;
  v5.super_class = (Class)PXFeedbackTapToRadarViewController;
  v2 = [(PXFeedbackTapToRadarViewController *)&v5 init];
  if (v2)
  {
    v3 = objc_alloc_init(_PXFeedbackTapToRadarViewController);
    [(_PXFeedbackTapToRadarViewController *)v3 setDelegate:v2];
    [(PXFeedbackTapToRadarViewController *)v2 pushViewController:v3 animated:0];
  }
  return v2;
}

@end