@interface PXPhotoStreamComposeServiceViewController
- (BOOL)addToExistingWorkflow;
- (BOOL)shouldAllowAlbumPicking;
- (NSString)albumTitle;
- (PXPhotoStreamComposeServiceDelegate)delegate;
- (id)completion;
- (void)setAddToExistingWorkflow:(BOOL)a3;
- (void)setAlbumTitle:(id)a3;
- (void)setAssetsToShare:(id)a3;
- (void)setCompletion:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setShouldAllowAlbumPicking:(BOOL)a3;
- (void)setSourcesToShare:(id)a3;
@end

@implementation PXPhotoStreamComposeServiceViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_albumTitle, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setAlbumTitle:(id)a3
{
}

- (NSString)albumTitle
{
  return self->_albumTitle;
}

- (void)setAddToExistingWorkflow:(BOOL)a3
{
  self->_addToExistingWorkflow = a3;
}

- (BOOL)addToExistingWorkflow
{
  return self->_addToExistingWorkflow;
}

- (void)setCompletion:(id)a3
{
}

- (id)completion
{
  return self->_completion;
}

- (void)setShouldAllowAlbumPicking:(BOOL)a3
{
  self->_shouldAllowAlbumPicking = a3;
}

- (BOOL)shouldAllowAlbumPicking
{
  return self->_shouldAllowAlbumPicking;
}

- (void)setDelegate:(id)a3
{
}

- (PXPhotoStreamComposeServiceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PXPhotoStreamComposeServiceDelegate *)WeakRetained;
}

- (void)setSourcesToShare:(id)a3
{
  id v5 = a3;
  v6 = [MEMORY[0x1E4F28B00] currentHandler];
  v7 = (objc_class *)objc_opt_class();
  v8 = NSStringFromClass(v7);
  [v6 handleFailureInMethod:a2, self, @"PXPhotoStreamComposeServiceViewController.m", 22, @"Method %s is a responsibility of subclass %@", "-[PXPhotoStreamComposeServiceViewController setSourcesToShare:]", v8 object file lineNumber description];

  abort();
}

- (void)setAssetsToShare:(id)a3
{
  id v5 = a3;
  v6 = [MEMORY[0x1E4F28B00] currentHandler];
  v7 = (objc_class *)objc_opt_class();
  v8 = NSStringFromClass(v7);
  [v6 handleFailureInMethod:a2, self, @"PXPhotoStreamComposeServiceViewController.m", 18, @"Method %s is a responsibility of subclass %@", "-[PXPhotoStreamComposeServiceViewController setAssetsToShare:]", v8 object file lineNumber description];

  abort();
}

@end