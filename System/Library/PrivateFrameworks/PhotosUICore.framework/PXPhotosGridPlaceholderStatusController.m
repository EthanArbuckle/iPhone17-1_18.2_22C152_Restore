@interface PXPhotosGridPlaceholderStatusController
- (PXPhotosGridPlaceholderStatusController)init;
- (PXStatusController)statusController;
- (id)initForPresentingCPLStatus:(BOOL)a3 fallbackTitle:(id)a4 fallbackAttributedMessage:(id)a5;
@end

@implementation PXPhotosGridPlaceholderStatusController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cplStatusController, 0);
  objc_storeStrong((id *)&self->_cplUIStatusProvider, 0);
  objc_storeStrong((id *)&self->_statusController, 0);
  objc_storeStrong((id *)&self->_fallbackAttributedMessage, 0);
  objc_storeStrong((id *)&self->_fallbackTitle, 0);
}

- (PXStatusController)statusController
{
  statusController = self->_statusController;
  if (!statusController)
  {
    if (self->_presentCPLStatus)
    {
      v4 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
      v5 = [[PXPhotoKitCPLActionManager alloc] initWithPhotoLibrary:v4];
      v6 = [[PXCPLUIStatusProvider alloc] initWithPhotoLibrary:v4 actionManager:v5];
      cplUIStatusProvider = self->_cplUIStatusProvider;
      self->_cplUIStatusProvider = v6;
    }
    v8 = objc_alloc_init(PXStatusController);
    v9 = self->_statusController;
    self->_statusController = v8;

    v10 = [PXCPLStatusController alloc];
    v11 = [(PXStatusController *)self->_statusController viewModel];
    v12 = [(PXCPLStatusController *)v10 initWithViewModel:v11];
    cplStatusController = self->_cplStatusController;
    self->_cplStatusController = v12;

    [(PXCPLStatusController *)self->_cplStatusController setStatusProvider:self->_cplUIStatusProvider];
    [(PXCPLStatusController *)self->_cplStatusController setFallbackTitle:self->_fallbackTitle];
    [(PXCPLStatusController *)self->_cplStatusController setFallbackAttributedMessage:self->_fallbackAttributedMessage];
    statusController = self->_statusController;
  }
  return statusController;
}

- (id)initForPresentingCPLStatus:(BOOL)a3 fallbackTitle:(id)a4 fallbackAttributedMessage:(id)a5
{
  id v10 = a4;
  id v11 = a5;
  v12 = v11;
  if (v10)
  {
    if (v11) {
      goto LABEL_3;
    }
  }
  else
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"PXPhotosGridPlaceholderStatusController.m", 35, @"Invalid parameter not satisfying: %@", @"fallbackTitle" object file lineNumber description];

    if (v12) {
      goto LABEL_3;
    }
  }
  v17 = [MEMORY[0x1E4F28B00] currentHandler];
  [v17 handleFailureInMethod:a2, self, @"PXPhotosGridPlaceholderStatusController.m", 36, @"Invalid parameter not satisfying: %@", @"fallbackAttributedMessage" object file lineNumber description];

LABEL_3:
  v18.receiver = self;
  v18.super_class = (Class)PXPhotosGridPlaceholderStatusController;
  v13 = [(PXPhotosGridPlaceholderStatusController *)&v18 init];
  p_isa = (id *)&v13->super.isa;
  if (v13)
  {
    v13->_presentCPLStatus = a3;
    objc_storeStrong((id *)&v13->_fallbackTitle, a4);
    objc_storeStrong(p_isa + 3, a5);
  }

  return p_isa;
}

- (PXPhotosGridPlaceholderStatusController)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXPhotosGridPlaceholderStatusController.m", 31, @"%s is not available as initializer", "-[PXPhotosGridPlaceholderStatusController init]");

  abort();
}

@end