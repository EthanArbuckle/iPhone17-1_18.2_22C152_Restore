@interface PXStatusController
- (NSObject)confirmationAlertToken;
- (PXStatusController)init;
- (PXStatusControllerDelegate)delegate;
- (PXStatusViewModel)viewModel;
- (UIContentUnavailableConfiguration)configuration;
- (void)_handleButtonAction:(id)a3;
- (void)_updateButtonTitle;
- (void)_updateMessage;
- (void)_updateTitle;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)setConfirmationAlertToken:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setViewModel:(id)a3;
@end

@implementation PXStatusController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_confirmationAlertToken, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_viewModel, 0);
}

- (void)setConfirmationAlertToken:(id)a3
{
}

- (NSObject)confirmationAlertToken
{
  return self->_confirmationAlertToken;
}

- (UIContentUnavailableConfiguration)configuration
{
  return self->_configuration;
}

- (void)setDelegate:(id)a3
{
}

- (PXStatusControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PXStatusControllerDelegate *)WeakRetained;
}

- (PXStatusViewModel)viewModel
{
  return self->_viewModel;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6 = a4;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  if ((void *)PXStatusViewModelObservationContext == a5)
  {
    if ((v6 & 2) == 0) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  v15 = [MEMORY[0x1E4F28B00] currentHandler];
  [v15 handleFailureInMethod:a2, self, @"PXStatusController.m", 169, @"Invalid parameter not satisfying: %@", @"context == PXStatusViewModelObservationContext" object file lineNumber description];

  if ((v6 & 2) != 0) {
LABEL_3:
  }
    [(PXStatusController *)self _updateTitle];
LABEL_4:
  if ((v6 & 0xC) != 0) {
    [(PXStatusController *)self _updateMessage];
  }
  if ((v6 & 0x10) != 0
    && ([(PXStatusController *)self confirmationAlertToken],
        v10 = objc_claimAutoreleasedReturnValue(),
        [(PXStatusController *)self _updateButtonTitle],
        v10)
    || (v6 & 0xE0) != 0
    && ([(PXStatusController *)self confirmationAlertToken],
        (v10 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    [(PXStatusController *)self setConfirmationAlertToken:0];
    v11 = PLUserStatusUIGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      viewModel = self->_viewModel;
      *(_DWORD *)buf = 138543362;
      v17 = viewModel;
      _os_log_impl(&dword_1A9AE7000, v11, OS_LOG_TYPE_DEFAULT, "Status View: Auto-dismiss alert for replaced action (%{public}@)", buf, 0xCu);
    }

    v13 = [(PXStatusController *)self delegate];
    v14 = [v13 presentationEnvironmentForStatusController:self];

    [v14 dismissAlertWithToken:v10 completionHandler:0];
  }
}

- (void)_handleButtonAction:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(PXStatusViewModel *)self->_viewModel action];
  char v6 = PLUserStatusUIGetLog();
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      viewModel = self->_viewModel;
      *(_DWORD *)buf = 138543362;
      v36 = viewModel;
      _os_log_impl(&dword_1A9AE7000, v7, OS_LOG_TYPE_DEFAULT, "Status View: User invoked un-pause action (%{public}@)", buf, 0xCu);
    }

    v7 = [(PXStatusViewModel *)self->_viewModel actionConfirmationAlertTitle];
    uint64_t v9 = [(PXStatusViewModel *)self->_viewModel actionConfirmationAlertButtonTitle];
    v10 = (void *)v9;
    if (v7) {
      BOOL v11 = v9 == 0;
    }
    else {
      BOOL v11 = 1;
    }
    int v12 = !v11;
    v13 = PLUserStatusUIGetLog();
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
    if (v12)
    {
      if (v14)
      {
        v15 = self->_viewModel;
        *(_DWORD *)buf = 138543362;
        v36 = v15;
        _os_log_impl(&dword_1A9AE7000, v13, OS_LOG_TYPE_DEFAULT, "Status View: Will present confirmation alert (%{public}@)", buf, 0xCu);
      }

      objc_initWeak(&location, self);
      objc_initWeak(&from, self->_viewModel);
      v16 = [(PXStatusController *)self delegate];
      v17 = [v16 presentationEnvironmentForStatusController:self];

      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __42__PXStatusController__handleButtonAction___block_invoke;
      v25[3] = &unk_1E5DB0B48;
      v26 = v7;
      v27 = self;
      id v28 = v4;
      id v29 = v10;
      objc_copyWeak(&v31, &from);
      objc_copyWeak(&v32, &location);
      v30 = v5;
      uint64_t v18 = [v17 presentAlertWithConfigurationHandler:v25];
      if (v18)
      {
        v19 = PLSharingGetLog();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          v20 = self->_viewModel;
          *(_DWORD *)buf = 138543362;
          v36 = v20;
          _os_log_impl(&dword_1A9AE7000, v19, OS_LOG_TYPE_DEFAULT, "Status View: Did present confirmation alert (%{public}@)", buf, 0xCu);
        }

        [(PXStatusController *)self setConfirmationAlertToken:v18];
      }
      else
      {
        v23 = PLSharingGetLog();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          v24 = self->_viewModel;
          *(_DWORD *)buf = 138543362;
          v36 = v24;
          _os_log_impl(&dword_1A9AE7000, v23, OS_LOG_TYPE_ERROR, "Status View: Failed to present confirmation alert (%{public}@)", buf, 0xCu);
        }
      }
      objc_destroyWeak(&v32);
      objc_destroyWeak(&v31);

      objc_destroyWeak(&from);
      objc_destroyWeak(&location);
    }
    else
    {
      if (v14)
      {
        v22 = self->_viewModel;
        *(_DWORD *)buf = 138543362;
        v36 = v22;
        _os_log_impl(&dword_1A9AE7000, v13, OS_LOG_TYPE_DEFAULT, "Status View: Invoking action without confirmation (%{public}@)", buf, 0xCu);
      }

      v5[2](v5);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v21 = self->_viewModel;
    *(_DWORD *)buf = 138543362;
    v36 = v21;
    _os_log_impl(&dword_1A9AE7000, v7, OS_LOG_TYPE_ERROR, "Status View: No action for button (%{public}@)", buf, 0xCu);
  }
}

void __42__PXStatusController__handleButtonAction___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setTitle:*(void *)(a1 + 32)];
  id v4 = [*(id *)(*(void *)(a1 + 40) + 8) actionConfirmationAlertSubtitle];
  [v3 setMessage:v4];

  [v3 setStyle:0];
  id v5 = *(id *)(a1 + 48);
  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }

  [v3 setSourceItem:v6];
  uint64_t v7 = *(void *)(a1 + 56);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __42__PXStatusController__handleButtonAction___block_invoke_2;
  v14[3] = &unk_1E5DB0B20;
  v8 = (id *)(a1 + 72);
  objc_copyWeak(&v16, (id *)(a1 + 72));
  uint64_t v9 = (id *)(a1 + 80);
  objc_copyWeak(&v17, (id *)(a1 + 80));
  id v15 = *(id *)(a1 + 64);
  [v3 addActionWithTitle:v7 style:0 action:v14];
  v10 = PXLocalizedStringFromTable(@"PXCancel", @"PhotosUICore");
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __42__PXStatusController__handleButtonAction___block_invoke_212;
  v11[3] = &unk_1E5DD0838;
  objc_copyWeak(&v12, v8);
  objc_copyWeak(&v13, v9);
  [v3 addActionWithTitle:v10 style:1 action:v11];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&v12);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&v16);
}

uint64_t __42__PXStatusController__handleButtonAction___block_invoke_2(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v2 = PLUserStatusUIGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    int v6 = 138543362;
    id v7 = WeakRetained;
    _os_log_impl(&dword_1A9AE7000, v2, OS_LOG_TYPE_DEFAULT, "Status View: User confirmed action (%{public}@)", (uint8_t *)&v6, 0xCu);
  }
  id v4 = objc_loadWeakRetained((id *)(a1 + 48));
  [v4 setConfirmationAlertToken:0];

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __42__PXStatusController__handleButtonAction___block_invoke_212(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = PLUserStatusUIGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    int v5 = 138543362;
    id v6 = WeakRetained;
    _os_log_impl(&dword_1A9AE7000, v2, OS_LOG_TYPE_DEFAULT, "Status View: User cancelled action (%{public}@)", (uint8_t *)&v5, 0xCu);
  }
  id v4 = objc_loadWeakRetained((id *)(a1 + 40));
  [v4 setConfirmationAlertToken:0];
}

- (void)_updateButtonTitle
{
  id v3 = [(PXStatusViewModel *)self->_viewModel actionTitle];
  uint64_t v4 = [v3 length];
  int v5 = [(PXStatusController *)self configuration];
  id v6 = [v5 buttonProperties];
  uint64_t v7 = [v6 configuration];
  uint64_t v8 = v7;
  if (v4)
  {
    [v7 setTitle:v3];

    objc_initWeak(&location, self);
    uint64_t v9 = (void *)MEMORY[0x1E4FB13F0];
    uint64_t v17 = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3221225472;
    v19 = __40__PXStatusController__updateButtonTitle__block_invoke;
    v20 = &unk_1E5DD2930;
    objc_copyWeak(&v21, &location);
    v10 = [v9 actionWithHandler:&v17];
    BOOL v11 = [(PXStatusController *)self configuration];
    id v12 = [v11 buttonProperties];
    [v12 setPrimaryAction:v10];

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }
  else
  {
    [v7 setTitle:0];

    id v13 = [(PXStatusController *)self configuration];
    BOOL v14 = [v13 buttonProperties];
    [v14 setPrimaryAction:0];
  }
  id v15 = [(PXStatusController *)self delegate];
  id v16 = [(PXStatusController *)self configuration];
  [v15 statusController:self configurationDidChange:v16];
}

void __40__PXStatusController__updateButtonTitle__block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  uint64_t v4 = [v3 sender];

  [WeakRetained _handleButtonAction:v4];
}

- (void)_updateMessage
{
  id v9 = [(PXStatusViewModel *)self->_viewModel message];
  id v3 = [(PXStatusController *)self viewModel];
  uint64_t v4 = [v3 attributedMessage];

  if (v4)
  {
    int v5 = [(PXStatusViewModel *)self->_viewModel attributedMessage];
    id v6 = [(PXStatusController *)self configuration];
    [v6 setSecondaryAttributedText:v5];
  }
  else
  {
    int v5 = [(PXStatusController *)self configuration];
    [v5 setSecondaryText:v9];
  }

  uint64_t v7 = [(PXStatusController *)self delegate];
  uint64_t v8 = [(PXStatusController *)self configuration];
  [v7 statusController:self configurationDidChange:v8];
}

- (void)_updateTitle
{
  id v7 = [(PXStatusViewModel *)self->_viewModel title];
  if ([v7 length]) {
    id v3 = v7;
  }
  else {
    id v3 = 0;
  }
  uint64_t v4 = [(PXStatusController *)self configuration];
  [v4 setText:v3];

  int v5 = [(PXStatusController *)self delegate];
  id v6 = [(PXStatusController *)self configuration];
  [v5 statusController:self configurationDidChange:v6];
}

- (void)setViewModel:(id)a3
{
  v10 = (PXStatusViewModel *)a3;
  if (!v10)
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"PXStatusController.m", 58, @"Invalid parameter not satisfying: %@", @"viewModel" object file lineNumber description];
  }
  id v6 = self->_viewModel;
  if (v6 == v10)
  {
  }
  else
  {
    id v7 = v10;
    char v8 = [(PXStatusViewModel *)v7 isEqual:v6];

    if ((v8 & 1) == 0)
    {
      [(PXStatusViewModel *)self->_viewModel unregisterChangeObserver:self context:PXStatusViewModelObservationContext];
      objc_storeStrong((id *)&self->_viewModel, a3);
      [(PXStatusViewModel *)self->_viewModel registerChangeObserver:self context:PXStatusViewModelObservationContext];
      [(PXStatusController *)self _updateTitle];
      [(PXStatusController *)self _updateMessage];
      [(PXStatusController *)self _updateButtonTitle];
    }
  }
}

- (PXStatusController)init
{
  v11.receiver = self;
  v11.super_class = (Class)PXStatusController;
  v2 = [(PXStatusController *)&v11 init];
  if (v2)
  {
    id v3 = objc_alloc_init(PXStatusViewModel);
    viewModel = v2->_viewModel;
    v2->_viewModel = v3;

    int v5 = v2->_viewModel;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __26__PXStatusController_init__block_invoke;
    v9[3] = &unk_1E5DB0AF8;
    v10 = &stru_1F00B0030;
    [(PXStatusViewModel *)v5 performChanges:v9];
    [(PXStatusViewModel *)v2->_viewModel registerChangeObserver:v2 context:PXStatusViewModelObservationContext];
    uint64_t v6 = [MEMORY[0x1E4FB1658] emptyConfiguration];
    configuration = v2->_configuration;
    v2->_configuration = (UIContentUnavailableConfiguration *)v6;
  }
  return v2;
}

uint64_t __26__PXStatusController_init__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setTitle:*(void *)(a1 + 32)];
}

@end