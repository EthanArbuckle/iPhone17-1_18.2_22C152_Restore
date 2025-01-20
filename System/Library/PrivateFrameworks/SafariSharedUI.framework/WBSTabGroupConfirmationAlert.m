@interface WBSTabGroupConfirmationAlert
+ (id)deleteConfirmationAlertWithTabGroup:(id)a3 manager:(id)a4 delegate:(id)a5;
- (WBSTabGroupConfirmationAlertDelegate)delegate;
- (WBTabGroup)tabGroup;
- (WBTabGroupManager)tabGroupManager;
- (id)_representativeHost;
- (int64_t)role;
- (void)_configureAlert;
- (void)_handleResult:(BOOL)a3;
- (void)_initializeStringsForDeleteConfirmation;
- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4;
- (void)presentFromViewController:(id)a3 withResultHandler:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setRole:(int64_t)a3;
@end

@implementation WBSTabGroupConfirmationAlert

+ (id)deleteConfirmationAlertWithTabGroup:(id)a3 manager:(id)a4 delegate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [a1 alertControllerWithTitle:0 message:0 preferredStyle:1];
  v12 = (void *)v11[169];
  v11[169] = v8;
  id v13 = v8;

  v14 = (void *)v11[170];
  v11[170] = v9;

  [v11 setRole:4];
  [v11 setDelegate:v10];

  [v11 _initializeStringsForDeleteConfirmation];
  [v11 _configureAlert];
  return v11;
}

- (id)_representativeHost
{
  v3 = [(WBSTabGroupConfirmationAlert *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    v4 = [v3 representativeURLForTabGroupConfirmationAlert:self];
    v5 = objc_msgSend(v4, "safari_userVisibleHostOrExtensionDisplayName");
  }
  else
  {
    v5 = 0;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0 && ![v5 length])
  {
    v6 = [(WBTabGroup *)self->_tabGroup representativeURL];
    uint64_t v7 = objc_msgSend(v6, "safari_userVisibleHostOrExtensionDisplayName");

    v5 = (void *)v7;
  }

  return v5;
}

- (void)_initializeStringsForDeleteConfirmation
{
  id v33 = [(WBSTabGroupConfirmationAlert *)self _representativeHost];
  if (![v33 length])
  {
    self->_automaticallyConfirm = 1;
    goto LABEL_16;
  }
  v3 = [(WBTabGroup *)self->_tabGroup tabs];
  uint64_t v4 = [v3 count];

  v5 = [(WBTabGroupManager *)self->_tabGroupManager shareRecordForTabGroup:self->_tabGroup];
  v6 = [v5 currentUserParticipant];
  uint64_t v7 = [v5 owner];
  int v8 = [v6 isEqual:v7];

  id v9 = NSString;
  if (!v5)
  {
    v16 = _WBSLocalizedString();
    v17 = [(WBTabGroup *)self->_tabGroup title];
    objc_msgSend(v9, "stringWithFormat:", v16, v17);
    v18 = (NSString *)objc_claimAutoreleasedReturnValue();
    title = self->_title;
    self->_title = v18;

    if (v4 == 2)
    {
      v20 = NSString;
    }
    else
    {
      if (v4 != 1)
      {
        uint64_t v28 = v4 - 1;
        v29 = NSString;
        v15 = _WBSLocalizedString();
        objc_msgSend(v29, "localizedStringWithFormat:", v15, v33, v28);
        v27 = (NSString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_13;
      }
      v20 = NSString;
    }
    v15 = _WBSLocalizedString();
    objc_msgSend(v20, "stringWithFormat:", v15, v33);
    v27 = (NSString *)objc_claimAutoreleasedReturnValue();
LABEL_13:
    message = self->_message;
    self->_message = v27;

    goto LABEL_14;
  }
  if (v8)
  {
    id v10 = _WBSLocalizedString();
    v11 = [(WBTabGroup *)self->_tabGroup title];
    objc_msgSend(v9, "stringWithFormat:", v10, v11);
    v12 = (NSString *)objc_claimAutoreleasedReturnValue();
    id v13 = self->_title;
    self->_title = v12;

    _WBSLocalizedString();
    v14 = (NSString *)objc_claimAutoreleasedReturnValue();
    v15 = self->_message;
    self->_message = v14;
LABEL_14:

    goto LABEL_15;
  }
  v21 = _WBSLocalizedString();
  v22 = [(WBTabGroup *)self->_tabGroup title];
  objc_msgSend(v9, "stringWithFormat:", v21, v22);
  v23 = (NSString *)objc_claimAutoreleasedReturnValue();
  v24 = self->_title;
  self->_title = v23;

  _WBSLocalizedString();
  v25 = (NSString *)objc_claimAutoreleasedReturnValue();
  v26 = self->_message;
  self->_message = v25;

LABEL_15:
  _WBSLocalizedString();
  v31 = (NSString *)objc_claimAutoreleasedReturnValue();
  confirmButtonTitle = self->_confirmButtonTitle;
  self->_confirmButtonTitle = v31;

LABEL_16:
}

- (void)_handleResult:(BOOL)a3
{
  id resultHandler = self->_resultHandler;
  if (resultHandler)
  {
    BOOL v5 = a3;
    uint64_t v7 = (void (**)(id, BOOL))MEMORY[0x1AD115160](resultHandler, a2);
    id v6 = self->_resultHandler;
    self->_id resultHandler = 0;

    v7[2](v7, v5);
  }
}

- (void)_configureAlert
{
  if (!self->_automaticallyConfirm)
  {
    if (self->_title) {
      title = (__CFString *)self->_title;
    }
    else {
      title = &stru_1F031A860;
    }
    [(WBSTabGroupConfirmationAlert *)self setTitle:title];
    if (self->_message) {
      message = (__CFString *)self->_message;
    }
    else {
      message = &stru_1F031A860;
    }
    [(WBSTabGroupConfirmationAlert *)self setMessage:message];
    objc_initWeak(&location, self);
    BOOL v5 = (void *)MEMORY[0x1E4F42720];
    id v6 = _WBSLocalizedString();
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __47__WBSTabGroupConfirmationAlert__configureAlert__block_invoke;
    v13[3] = &unk_1E5E45180;
    objc_copyWeak(&v14, &location);
    uint64_t v7 = [v5 actionWithTitle:v6 style:1 handler:v13];
    [(WBSTabGroupConfirmationAlert *)self addAction:v7];

    confirmButtonTitle = self->_confirmButtonTitle;
    id v9 = (void *)MEMORY[0x1E4F42720];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __47__WBSTabGroupConfirmationAlert__configureAlert__block_invoke_2;
    v11[3] = &unk_1E5E45180;
    objc_copyWeak(&v12, &location);
    id v10 = [v9 actionWithTitle:confirmButtonTitle style:2 handler:v11];
    [(WBSTabGroupConfirmationAlert *)self addAction:v10];

    objc_destroyWeak(&v12);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
}

void __47__WBSTabGroupConfirmationAlert__configureAlert__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleResult:0];
}

void __47__WBSTabGroupConfirmationAlert__configureAlert__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleResult:1];
}

- (void)presentFromViewController:(id)a3 withResultHandler:(id)a4
{
  id v6 = a3;
  if (self->_automaticallyConfirm)
  {
    (*((void (**)(id, uint64_t))a4 + 2))(a4, 1);
  }
  else
  {
    uint64_t v7 = (void *)MEMORY[0x1AD115160](a4);
    id resultHandler = self->_resultHandler;
    self->_id resultHandler = v7;

    id v9 = [v6 presentedViewController];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v9 role] == self->_role)
    {
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __76__WBSTabGroupConfirmationAlert_presentFromViewController_withResultHandler___block_invoke;
      v10[3] = &unk_1E5E40D38;
      id v11 = v6;
      id v12 = self;
      [v11 dismissViewControllerAnimated:1 completion:v10];
    }
    else
    {
      [v6 presentViewController:self animated:1 completion:0];
    }
  }
}

uint64_t __76__WBSTabGroupConfirmationAlert_presentFromViewController_withResultHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) presentViewController:*(void *)(a1 + 40) animated:1 completion:0];
}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)WBSTabGroupConfirmationAlert;
  [(WBSTabGroupConfirmationAlert *)&v6 dismissViewControllerAnimated:a3 completion:a4];
  BOOL v5 = [(WBSTabGroupConfirmationAlert *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v5 tabGroupConfirmationAlertDidBeginDismissal:self];
  }
}

- (WBTabGroup)tabGroup
{
  return self->_tabGroup;
}

- (WBTabGroupManager)tabGroupManager
{
  return self->_tabGroupManager;
}

- (int64_t)role
{
  return self->_role;
}

- (void)setRole:(int64_t)a3
{
  self->_role = a3;
}

- (WBSTabGroupConfirmationAlertDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WBSTabGroupConfirmationAlertDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_tabGroupManager, 0);
  objc_storeStrong((id *)&self->_tabGroup, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong(&self->_resultHandler, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_confirmButtonTitle, 0);
}

@end