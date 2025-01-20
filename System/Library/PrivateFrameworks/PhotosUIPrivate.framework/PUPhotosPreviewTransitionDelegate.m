@interface PUPhotosPreviewTransitionDelegate
- (PUPhotosPreviewPresentationControllerDelegate)photosPreviewingDelegate;
- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5;
- (void)setPhotosPreviewingDelegate:(id)a3;
@end

@implementation PUPhotosPreviewTransitionDelegate

- (void).cxx_destruct
{
}

- (void)setPhotosPreviewingDelegate:(id)a3
{
}

- (PUPhotosPreviewPresentationControllerDelegate)photosPreviewingDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_photosPreviewingDelegate);
  return (PUPhotosPreviewPresentationControllerDelegate *)WeakRetained;
}

- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5
{
  id v7 = a4;
  id v8 = a3;
  v9 = [(_UIPreviewPresentationController *)[PUPhotosPreviewPresentationController alloc] initWithPresentedViewController:v8 presentingViewController:v7];

  v10 = [(PUPhotosPreviewTransitionDelegate *)self photosPreviewingDelegate];
  [(PUPhotosPreviewPresentationController *)v9 setPhotosPreviewingDelegate:v10];

  return v9;
}

@end