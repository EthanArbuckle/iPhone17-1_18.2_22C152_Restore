@interface PXCPLStatusController
- (NSAttributedString)fallbackAttributedMessage;
- (NSString)fallbackActionTitle;
- (NSString)fallbackMessage;
- (NSString)fallbackTitle;
- (PXCPLStatusController)init;
- (PXCPLStatusController)initWithViewModel:(id)a3;
- (PXCPLUIStatusProvider)statusProvider;
- (id)fallbackAction;
- (void)_statusProviderDidChange;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)setFallbackAction:(id)a3;
- (void)setFallbackActionTitle:(id)a3;
- (void)setFallbackAttributedMessage:(id)a3;
- (void)setFallbackMessage:(id)a3;
- (void)setFallbackTitle:(id)a3;
- (void)setStatusProvider:(id)a3;
@end

@implementation PXCPLStatusController

- (void).cxx_destruct
{
  objc_storeStrong(&self->_fallbackAction, 0);
  objc_storeStrong((id *)&self->_fallbackActionTitle, 0);
  objc_storeStrong((id *)&self->_fallbackAttributedMessage, 0);
  objc_storeStrong((id *)&self->_fallbackMessage, 0);
  objc_storeStrong((id *)&self->_fallbackTitle, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_statusProvider, 0);
}

- (id)fallbackAction
{
  return self->_fallbackAction;
}

- (NSString)fallbackActionTitle
{
  return self->_fallbackActionTitle;
}

- (NSAttributedString)fallbackAttributedMessage
{
  return self->_fallbackAttributedMessage;
}

- (NSString)fallbackMessage
{
  return self->_fallbackMessage;
}

- (NSString)fallbackTitle
{
  return self->_fallbackTitle;
}

- (PXCPLUIStatusProvider)statusProvider
{
  return self->_statusProvider;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  __int16 v6 = a4;
  id v9 = a3;
  if ((void *)PXCPLUIStatusProviderChangeObserverContext != a5)
  {
    id v12 = v9;
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"PXCPLStatusController.m", 162, @"Invalid parameter not satisfying: %@", @"context == PXCPLUIStatusProviderChangeObserverContext" object file lineNumber description];

    id v9 = v12;
  }
  if ((v6 & 0x25E3) != 0)
  {
    id v11 = v9;
    [(PXCPLStatusController *)self _statusProviderDidChange];
    id v9 = v11;
  }
}

- (void)_statusProviderDidChange
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  v3 = [(PXCPLUIStatusProvider *)self->_statusProvider status];
  v27 = v3;
  if (!v3)
  {
    v26 = [0 stateDescription];
LABEL_10:
    v8 = self->_fallbackTitle;
    id v9 = self->_fallbackMessage;
    v15 = self->_fallbackAttributedMessage;
    v10 = self->_fallbackActionTitle;
    v14 = _Block_copy(self->_fallbackAction);
    id v11 = 0;
    id v12 = 0;
    v13 = 0;
    goto LABEL_11;
  }
  v4 = v3;
  uint64_t v5 = [v3 state];
  __int16 v6 = [v4 stateDescription];
  v7 = v6;
  if (!v5)
  {
    v26 = v6;
    goto LABEL_10;
  }
  if (![v6 length])
  {
    v16 = PLUserStatusGetLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v40 = v4;
      _os_log_impl(&dword_1A9AE7000, v16, OS_LOG_TYPE_ERROR, "No or empty state description provided: %{public}@", buf, 0xCu);
    }
    v26 = v7;

    goto LABEL_10;
  }
  v8 = v7;
  id v9 = [v4 failureDescription];
  v10 = [v4 actionTitle];
  id v11 = [v4 actionConfirmationAlertTitle];
  id v12 = [v4 actionConfirmationAlertSubtitle];
  v13 = [v4 actionConfirmationAlertButtonTitle];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __49__PXCPLStatusController__statusProviderDidChange__block_invoke;
  aBlock[3] = &unk_1E5DD36F8;
  id v38 = v4;
  v14 = _Block_copy(aBlock);

  v15 = 0;
  v26 = v8;
LABEL_11:
  viewModel = self->_viewModel;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __49__PXCPLStatusController__statusProviderDidChange__block_invoke_2;
  v28[3] = &unk_1E5DC1FD0;
  v29 = v8;
  v30 = v9;
  v31 = v15;
  v32 = v10;
  id v33 = v11;
  id v34 = v12;
  id v35 = v13;
  id v36 = v14;
  id v18 = v14;
  id v19 = v13;
  id v20 = v12;
  id v21 = v11;
  v22 = v10;
  v23 = v15;
  v24 = v9;
  v25 = v8;
  [(PXStatusViewModel *)viewModel performChanges:v28];
}

void __49__PXCPLStatusController__statusProviderDidChange__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) action];
  if (v2)
  {
    id v4 = v2;
    v3 = [*(id *)(a1 + 32) action];
    v3[2](v3, *(void *)(a1 + 32));

    v2 = v4;
  }
}

void __49__PXCPLStatusController__statusProviderDidChange__block_invoke_2(void *a1, void *a2)
{
  uint64_t v3 = a1[4];
  id v4 = a2;
  [v4 setTitle:v3];
  [v4 setMessage:a1[5]];
  [v4 setAttributedMessage:a1[6]];
  [v4 setActionTitle:a1[7]];
  [v4 setActionConfirmationAlertTitle:a1[8]];
  [v4 setActionConfirmationAlertSubtitle:a1[9]];
  [v4 setActionConfirmationAlertButtonTitle:a1[10]];
  [v4 setAction:a1[11]];
}

- (void)setFallbackAction:(id)a3
{
  id aBlock = a3;
  id v4 = _Block_copy(self->_fallbackAction);
  uint64_t v5 = _Block_copy(aBlock);
  if (v4 == v5)
  {
  }
  else
  {
    __int16 v6 = v5;
    char v7 = [v4 isEqual:v5];

    if ((v7 & 1) == 0)
    {
      v8 = (void *)[aBlock copy];
      id fallbackAction = self->_fallbackAction;
      self->_id fallbackAction = v8;

      [(PXCPLStatusController *)self _statusProviderDidChange];
    }
  }
}

- (void)setFallbackActionTitle:(id)a3
{
  v8 = (NSString *)a3;
  id v4 = self->_fallbackActionTitle;
  if (v4 == v8)
  {
  }
  else
  {
    BOOL v5 = [(NSString *)v4 isEqualToString:v8];

    if (!v5)
    {
      __int16 v6 = (NSString *)[(NSString *)v8 copy];
      fallbackActionTitle = self->_fallbackActionTitle;
      self->_fallbackActionTitle = v6;

      [(PXCPLStatusController *)self _statusProviderDidChange];
    }
  }
}

- (void)setFallbackAttributedMessage:(id)a3
{
  v8 = (NSAttributedString *)a3;
  id v4 = self->_fallbackAttributedMessage;
  if (v4 == v8)
  {
  }
  else
  {
    char v5 = [(NSAttributedString *)v4 isEqual:v8];

    if ((v5 & 1) == 0)
    {
      __int16 v6 = (NSAttributedString *)[(NSAttributedString *)v8 copy];
      fallbackAttributedMessage = self->_fallbackAttributedMessage;
      self->_fallbackAttributedMessage = v6;

      [(PXCPLStatusController *)self _statusProviderDidChange];
    }
  }
}

- (void)setFallbackMessage:(id)a3
{
  v8 = (NSString *)a3;
  id v4 = self->_fallbackMessage;
  if (v4 == v8)
  {
  }
  else
  {
    BOOL v5 = [(NSString *)v4 isEqualToString:v8];

    if (!v5)
    {
      __int16 v6 = (NSString *)[(NSString *)v8 copy];
      fallbackMessage = self->_fallbackMessage;
      self->_fallbackMessage = v6;

      [(PXCPLStatusController *)self _statusProviderDidChange];
    }
  }
}

- (void)setFallbackTitle:(id)a3
{
  v8 = (NSString *)a3;
  id v4 = self->_fallbackTitle;
  if (v4 == v8)
  {
  }
  else
  {
    BOOL v5 = [(NSString *)v4 isEqualToString:v8];

    if (!v5)
    {
      __int16 v6 = (NSString *)[(NSString *)v8 copy];
      fallbackTitle = self->_fallbackTitle;
      self->_fallbackTitle = v6;

      [(PXCPLStatusController *)self _statusProviderDidChange];
    }
  }
}

- (void)setStatusProvider:(id)a3
{
  BOOL v5 = (PXCPLUIStatusProvider *)a3;
  statusProvider = self->_statusProvider;
  if (statusProvider != v5)
  {
    char v7 = v5;
    [(PXCPLUIStatusProvider *)statusProvider unregisterChangeObserver:self context:PXCPLUIStatusProviderChangeObserverContext];
    objc_storeStrong((id *)&self->_statusProvider, a3);
    [(PXCPLUIStatusProvider *)self->_statusProvider registerChangeObserver:self context:PXCPLUIStatusProviderChangeObserverContext];
    [(PXCPLStatusController *)self _statusProviderDidChange];
    BOOL v5 = v7;
  }
}

- (PXCPLStatusController)initWithViewModel:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"PXCPLStatusController.m", 35, @"Invalid parameter not satisfying: %@", @"viewModel" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)PXCPLStatusController;
  char v7 = [(PXCPLStatusController *)&v11 init];
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_viewModel, a3);
    [(PXCPLStatusController *)v8 _statusProviderDidChange];
  }

  return v8;
}

- (PXCPLStatusController)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXCPLStatusController.m", 31, @"%s is not available as initializer", "-[PXCPLStatusController init]");

  abort();
}

@end