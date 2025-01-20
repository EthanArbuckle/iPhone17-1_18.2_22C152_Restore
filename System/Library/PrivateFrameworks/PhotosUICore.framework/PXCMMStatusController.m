@interface PXCMMStatusController
- (PXCMMStatusController)init;
- (PXCMMStatusController)initWithStatusPresentation:(id)a3 viewModel:(id)a4;
- (PXStatusViewModel)viewModel;
- (void)_updateWithChangeDescriptor:(unint64_t)a3;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
@end

@implementation PXCMMStatusController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_statusPresentation, 0);
}

- (PXStatusViewModel)viewModel
{
  return self->_viewModel;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  id v9 = a3;
  if ((void *)PXMomentShareStatusPresentationChangeObserverContext != a5)
  {
    id v12 = v9;
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"PXCMMStatusController.m", 78, @"Invalid parameter not satisfying: %@", @"context == PXMomentShareStatusPresentationChangeObserverContext" object file lineNumber description];

    id v9 = v12;
  }
  if ((a4 & 0x7E8) != 0)
  {
    id v11 = v9;
    [(PXCMMStatusController *)self _updateWithChangeDescriptor:a4];
    id v9 = v11;
  }
}

- (void)_updateWithChangeDescriptor:(unint64_t)a3
{
  viewModel = self->_viewModel;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __53__PXCMMStatusController__updateWithChangeDescriptor___block_invoke;
  v4[3] = &unk_1E5DCE7F8;
  v4[4] = self;
  v4[5] = a3;
  [(PXStatusViewModel *)viewModel performChanges:v4];
}

void __53__PXCMMStatusController__updateWithChangeDescriptor___block_invoke(uint64_t a1, void *a2)
{
  id v11 = a2;
  uint64_t v3 = *(void *)(a1 + 40);
  if ((v3 & 8) != 0)
  {
    v5 = [*(id *)(*(void *)(a1 + 32) + 8) activityTitle];
    [v11 setTitle:v5];

    uint64_t v3 = *(void *)(a1 + 40);
    if ((v3 & 0x20) == 0)
    {
LABEL_3:
      if ((v3 & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((v3 & 0x20) == 0)
  {
    goto LABEL_3;
  }
  v6 = [*(id *)(*(void *)(a1 + 32) + 8) pauseTitle];
  [v11 setMessage:v6];

  uint64_t v3 = *(void *)(a1 + 40);
  if ((v3 & 0x40) == 0)
  {
LABEL_4:
    if ((v3 & 0x80) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  v7 = [*(id *)(*(void *)(a1 + 32) + 8) actionTitle];
  [v11 setActionTitle:v7];

  uint64_t v3 = *(void *)(a1 + 40);
  if ((v3 & 0x80) == 0)
  {
LABEL_5:
    if ((v3 & 0x100) == 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  v8 = [*(id *)(*(void *)(a1 + 32) + 8) actionConfirmationAlertTitle];
  [v11 setActionConfirmationAlertTitle:v8];

  uint64_t v3 = *(void *)(a1 + 40);
  if ((v3 & 0x100) == 0)
  {
LABEL_6:
    if ((v3 & 0x200) == 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  id v9 = [*(id *)(*(void *)(a1 + 32) + 8) actionConfirmationAlertSubtitle];
  [v11 setActionConfirmationAlertSubtitle:v9];

  uint64_t v3 = *(void *)(a1 + 40);
  if ((v3 & 0x200) == 0)
  {
LABEL_7:
    if ((v3 & 0x400) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_17:
  v10 = [*(id *)(*(void *)(a1 + 32) + 8) actionConfirmationAlertButtonTitle];
  [v11 setActionConfirmationAlertButtonTitle:v10];

  if ((*(void *)(a1 + 40) & 0x400) != 0)
  {
LABEL_8:
    v4 = [*(id *)(*(void *)(a1 + 32) + 8) action];
    [v11 setAction:v4];
  }
LABEL_9:
}

- (PXCMMStatusController)initWithStatusPresentation:(id)a3 viewModel:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9) {
      goto LABEL_3;
    }
  }
  else
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"PXCMMStatusController.m", 32, @"Invalid parameter not satisfying: %@", @"statusPresentation" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
  }
  v15 = [MEMORY[0x1E4F28B00] currentHandler];
  [v15 handleFailureInMethod:a2, self, @"PXCMMStatusController.m", 33, @"Invalid parameter not satisfying: %@", @"viewModel" object file lineNumber description];

LABEL_3:
  v16.receiver = self;
  v16.super_class = (Class)PXCMMStatusController;
  id v11 = [(PXCMMStatusController *)&v16 init];
  id v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_statusPresentation, a3);
    [(PXMomentShareStatusPresentation *)v12->_statusPresentation registerChangeObserver:v12 context:PXMomentShareStatusPresentationChangeObserverContext];
    objc_storeStrong((id *)&v12->_viewModel, a4);
    [(PXCMMStatusController *)v12 _updateWithChangeDescriptor:-1];
  }

  return v12;
}

- (PXCMMStatusController)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXCMMStatusController.m", 28, @"%s is not available as initializer", "-[PXCMMStatusController init]");

  abort();
}

@end