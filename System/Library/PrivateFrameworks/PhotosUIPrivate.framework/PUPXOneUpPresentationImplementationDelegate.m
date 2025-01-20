@interface PUPXOneUpPresentationImplementationDelegate
- (BOOL)oneUpPresentation:(id)a3 canStartAnimated:(BOOL)a4;
- (BOOL)oneUpPresentation:(id)a3 handlePresentingPinchGestureRecognizer:(id)a4;
- (BOOL)oneUpPresentation:(id)a3 startWithConfigurationHandler:(id)a4;
- (BOOL)oneUpPresentationCanStop:(id)a3;
- (id)oneUpPresentationLastViewedAssetReference:(id)a3;
- (id)previewViewControllerForOneUpPresentation:(id)a3 allowingActions:(BOOL)a4;
- (void)oneUpPresentation:(id)a3 commitPreviewViewController:(id)a4;
- (void)oneUpPresentation:(id)a3 didDismissPreviewViewController:(id)a4 committing:(BOOL)a5;
- (void)oneUpPresentation:(id)a3 presentingViewControllerViewDidAppear:(BOOL)a4;
- (void)oneUpPresentation:(id)a3 presentingViewControllerViewDidDisappear:(BOOL)a4;
- (void)oneUpPresentation:(id)a3 presentingViewControllerViewIsAppearing:(BOOL)a4;
- (void)oneUpPresentation:(id)a3 presentingViewControllerViewWillAppear:(BOOL)a4;
- (void)oneUpPresentation:(id)a3 presentingViewControllerViewWillDisappear:(BOOL)a4;
- (void)oneUpPresentation:(id)a3 registerStateChangeHandler:(id)a4;
- (void)oneUpPresentation:(id)a3 stopAnimated:(BOOL)a4;
- (void)oneUpPresentationInvalidatePresentingGeometry:(id)a3;
@end

@implementation PUPXOneUpPresentationImplementationDelegate

- (void)oneUpPresentation:(id)a3 presentingViewControllerViewIsAppearing:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = +[PUPXOneUpPresentationImplementation implementationForOneUpPresentation:a3];
  [v5 presentingViewControllerViewIsAppearing:v4];
}

- (void)oneUpPresentation:(id)a3 presentingViewControllerViewWillAppear:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = +[PUPXOneUpPresentationImplementation implementationForOneUpPresentation:a3];
  [v5 presentingViewControllerViewWillAppear:v4];
}

- (void)oneUpPresentation:(id)a3 registerStateChangeHandler:(id)a4
{
  id v5 = a4;
  id v6 = +[PUPXOneUpPresentationImplementation implementationForOneUpPresentation:a3];
  [v6 registerStateChangeHandler:v5];
}

- (void)oneUpPresentation:(id)a3 presentingViewControllerViewDidAppear:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = +[PUPXOneUpPresentationImplementation implementationForOneUpPresentation:a3];
  [v5 presentingViewControllerViewDidAppear:v4];
}

- (void)oneUpPresentationInvalidatePresentingGeometry:(id)a3
{
  id v3 = +[PUPXOneUpPresentationImplementation implementationForOneUpPresentation:a3];
  [v3 invalidatePresentingGeometry];
}

- (BOOL)oneUpPresentation:(id)a3 handlePresentingPinchGestureRecognizer:(id)a4
{
  id v5 = a4;
  id v6 = +[PUPXOneUpPresentationImplementation implementationForOneUpPresentation:a3];
  char v7 = [v6 handlePresentingPinchGestureRecognizer:v5];

  return v7;
}

- (void)oneUpPresentation:(id)a3 stopAnimated:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = +[PUPXOneUpPresentationImplementation implementationForOneUpPresentation:a3];
  [v5 stopAnimated:v4];
}

- (BOOL)oneUpPresentationCanStop:(id)a3
{
  id v3 = +[PUPXOneUpPresentationImplementation implementationForOneUpPresentation:a3];
  char v4 = [v3 canStop];

  return v4;
}

- (void)oneUpPresentation:(id)a3 commitPreviewViewController:(id)a4
{
  id v5 = a4;
  id v6 = +[PUPXOneUpPresentationImplementation implementationForOneUpPresentation:a3];
  [v6 commitPreviewViewController:v5];
}

- (void)oneUpPresentation:(id)a3 didDismissPreviewViewController:(id)a4 committing:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  id v8 = +[PUPXOneUpPresentationImplementation implementationForOneUpPresentation:a3];
  [v8 didDismissPreviewViewController:v7 committing:v5];
}

- (id)previewViewControllerForOneUpPresentation:(id)a3 allowingActions:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = +[PUPXOneUpPresentationImplementation implementationForOneUpPresentation:a3];
  id v6 = [v5 previewViewControllerAllowingActions:v4];

  return v6;
}

- (BOOL)oneUpPresentation:(id)a3 startWithConfigurationHandler:(id)a4
{
  id v5 = a4;
  id v6 = +[PUPXOneUpPresentationImplementation implementationForOneUpPresentation:a3];
  char v7 = [v6 startWithConfigurationHandler:v5];

  return v7;
}

- (id)oneUpPresentationLastViewedAssetReference:(id)a3
{
  id v3 = +[PUPXOneUpPresentationImplementation implementationForOneUpPresentation:a3];
  BOOL v4 = [v3 lastViewedAssetReference];

  return v4;
}

- (BOOL)oneUpPresentation:(id)a3 canStartAnimated:(BOOL)a4
{
  uint64_t v4 = a4;
  id v5 = +[PUPXOneUpPresentationImplementation implementationForOneUpPresentation:a3];
  LOBYTE(v4) = [v5 canStartAnimated:v4];

  return v4;
}

- (void)oneUpPresentation:(id)a3 presentingViewControllerViewDidDisappear:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = +[PUPXOneUpPresentationImplementation implementationForOneUpPresentation:a3];
  [v5 presentingViewControllerViewDidDisappear:v4];
}

- (void)oneUpPresentation:(id)a3 presentingViewControllerViewWillDisappear:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = +[PUPXOneUpPresentationImplementation implementationForOneUpPresentation:a3];
  [v5 presentingViewControllerViewWillDisappear:v4];
}

@end