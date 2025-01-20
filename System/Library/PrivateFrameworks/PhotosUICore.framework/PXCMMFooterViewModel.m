@interface PXCMMFooterViewModel
- (PXCMMFooterViewModel)init;
- (PXCMMFooterViewModel)initWithMomentShareStatusPresentation:(id)a3 mode:(int64_t)a4;
- (PXCMMFooterViewModelDelegate)delegate;
- (void)_invokeStopSharingActionForInvitation:(id)a3 session:(id)a4;
- (void)_updateAllProperties;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)setDelegate:(id)a3;
@end

@implementation PXCMMFooterViewModel

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_momentShareStatusPresentation, 0);
}

- (PXCMMFooterViewModelDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PXCMMFooterViewModelDelegate *)WeakRetained;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  __int16 v6 = a4;
  id v9 = a3;
  if ((void *)PXMomentShareStatusPresentationObservationContext_190718 != a5)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"PXCMMFooterViewModel.m" lineNumber:198 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  if ((v6 & 0x886F) != 0)
  {
    id v11 = v9;
    [(PXCMMFooterViewModel *)self _updateAllProperties];
    id v9 = v11;
  }
}

- (void)_invokeStopSharingActionForInvitation:(id)a3 session:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = PLSharingGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v6 identifier];
    *(_DWORD *)buf = 138543362;
    v19 = v9;
    _os_log_impl(&dword_1A9AE7000, v8, OS_LOG_TYPE_DEFAULT, "PXCMMFooterViewModel: Will delete owned moment share: %{public}@", buf, 0xCu);
  }
  v10 = [v7 actionManager];
  id v11 = [v10 actionPerformerForActionType:@"PXCMMActionTypeDelete"];

  v12 = [(PXCMMFooterViewModel *)self delegate];
  if (!v12) {
    PXAssertGetLog();
  }
  v13 = [v12 presentationEnvironmentForCMMFooterViewModel:self];
  [v11 setPresentationEnvironment:v13];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __70__PXCMMFooterViewModel__invokeStopSharingActionForInvitation_session___block_invoke;
  v16[3] = &unk_1E5DD3158;
  id v17 = v6;
  id v14 = v6;
  id v15 = (id)[v11 performActionWithSession:v7 completionHandler:v16];
}

void __70__PXCMMFooterViewModel__invokeStopSharingActionForInvitation_session___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = PLSharingGetLog();
  id v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = [*(id *)(a1 + 32) identifier];
      int v13 = 138543362;
      id v14 = v8;
      id v9 = "PXCMMFooterViewModel: Did delete owned moment share: %{public}@";
      v10 = v7;
      os_log_type_t v11 = OS_LOG_TYPE_DEFAULT;
      uint32_t v12 = 12;
LABEL_6:
      _os_log_impl(&dword_1A9AE7000, v10, v11, v9, (uint8_t *)&v13, v12);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v8 = [*(id *)(a1 + 32) identifier];
    int v13 = 138543618;
    id v14 = v8;
    __int16 v15 = 2112;
    id v16 = v5;
    id v9 = "PXCMMFooterViewModel: Failed to delete owned moment share: %{public}@, error: %@";
    v10 = v7;
    os_log_type_t v11 = OS_LOG_TYPE_ERROR;
    uint32_t v12 = 22;
    goto LABEL_6;
  }
}

- (void)_updateAllProperties
{
  v3 = [(PXMomentShareStatusPresentation *)self->_momentShareStatusPresentation assetsTitle];
  v4 = [(PXMomentShareStatusPresentation *)self->_momentShareStatusPresentation expirationTitle];
  int64_t v5 = [(PXMomentShareStatusPresentation *)self->_momentShareStatusPresentation type];
  if (v5 != 1)
  {
    if (!v5)
    {
      id v6 = v4;
      id v7 = 0;
      goto LABEL_15;
    }
LABEL_13:
    id v7 = 0;
    id v6 = 0;
    goto LABEL_15;
  }
  int64_t mode = self->_mode;
  if (mode == 1)
  {
    id v6 = [(PXMomentShareStatusPresentation *)self->_momentShareStatusPresentation assetsSaveStatusTitle];
    id v7 = v4;
    goto LABEL_15;
  }
  if (mode) {
    goto LABEL_13;
  }
  uint64_t v9 = [(PXMomentShareStatusPresentation *)self->_momentShareStatusPresentation byline];
  v10 = (void *)v9;
  if (v9) {
    os_log_type_t v11 = (void *)v9;
  }
  else {
    os_log_type_t v11 = v4;
  }
  if (v9) {
    uint32_t v12 = v4;
  }
  else {
    uint32_t v12 = 0;
  }
  id v6 = v11;
  id v7 = v12;

LABEL_15:
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __44__PXCMMFooterViewModel__updateAllProperties__block_invoke;
  v16[3] = &unk_1E5DC3640;
  id v17 = v3;
  id v18 = v6;
  id v19 = v7;
  long long v20 = 0u;
  long long v21 = 0u;
  id v22 = 0;
  id v13 = v7;
  id v14 = v6;
  id v15 = v3;
  [(PXFooterViewModel *)self performChanges:v16];
}

void __44__PXCMMFooterViewModel__updateAllProperties__block_invoke(void *a1, void *a2)
{
  uint64_t v3 = a1[4];
  id v4 = a2;
  [v4 setTitle:v3];
  [v4 setSubtitle1:a1[5]];
  [v4 setSubtitle2:a1[6]];
  [v4 setActionTitle:a1[7]];
  [v4 setActionConfirmationAlertTitle:a1[8]];
  [v4 setActionConfirmationAlertSubtitle:a1[9]];
  [v4 setActionConfirmationAlertButtonTitle:a1[10]];
  [v4 setAction:a1[11]];
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  int64_t v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    [(PXCMMFooterViewModel *)self _updateAllProperties];
    int64_t v5 = obj;
  }
}

- (PXCMMFooterViewModel)initWithMomentShareStatusPresentation:(id)a3 mode:(int64_t)a4
{
  id v8 = a3;
  if (!v8)
  {
    uint32_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"PXCMMFooterViewModel.m", 33, @"Invalid parameter not satisfying: %@", @"momentShareStatusPresentation" object file lineNumber description];
  }
  v13.receiver = self;
  v13.super_class = (Class)PXCMMFooterViewModel;
  uint64_t v9 = [(PXFooterViewModel *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_momentShareStatusPresentation, a3);
    [(PXMomentShareStatusPresentation *)v10->_momentShareStatusPresentation registerChangeObserver:v10 context:PXMomentShareStatusPresentationObservationContext_190718];
    v10->_int64_t mode = a4;
    [(PXCMMFooterViewModel *)v10 _updateAllProperties];
  }

  return v10;
}

- (PXCMMFooterViewModel)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXCMMFooterViewModel.m", 29, @"%s is not available as initializer", "-[PXCMMFooterViewModel init]");

  abort();
}

@end