@interface PUPhotosPreviewPresentationController
- (PUPhotosPreviewPresentationControllerDelegate)photosPreviewingDelegate;
- (void)_revealTransitionDidComplete:(BOOL)a3;
- (void)setPhotosPreviewingDelegate:(id)a3;
@end

@implementation PUPhotosPreviewPresentationController

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

- (void)_revealTransitionDidComplete:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(PUPhotosPreviewPresentationController *)self photosPreviewingDelegate];
  v6 = [(PUPhotosPreviewPresentationController *)self presentedViewController];
  [v5 photosPreviewPresentationController:self willPresentPreviewViewController:v6];

  v7.receiver = self;
  v7.super_class = (Class)PUPhotosPreviewPresentationController;
  [(_UIPreviewPresentationController *)&v7 _revealTransitionDidComplete:v3];
}

@end