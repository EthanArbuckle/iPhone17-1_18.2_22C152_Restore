@interface PKDynamicProvisioningFieldsPageViewController
- (BOOL)isLoading;
- (PKDynamicProvisioningFieldsPageContent)fieldsPage;
- (PKDynamicProvisioningFieldsPageViewController)initWithWebService:(id)a3 context:(int64_t)a4 setupDelegate:(id)a5 fieldsPage:(id)a6;
- (id)defaultHeaderViewSubTitle;
- (id)defaultHeaderViewTitle;
- (void)_setNavigationBarEnabled:(BOOL)a3;
- (void)handleCancelTapped;
- (void)showSpinner:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation PKDynamicProvisioningFieldsPageViewController

- (PKDynamicProvisioningFieldsPageViewController)initWithWebService:(id)a3 context:(int64_t)a4 setupDelegate:(id)a5 fieldsPage:(id)a6
{
  id v33 = a3;
  id v32 = a5;
  id obj = a6;
  id v29 = a6;
  v8 = [v29 fieldModel];
  v9 = [v8 visiblePaymentSetupFields];

  v10 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithArray:v9];
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v47 = 0;
  v48 = &v47;
  uint64_t v49 = 0x2020000000;
  char v50 = 0;
  uint64_t v43 = 0;
  v44 = &v43;
  uint64_t v45 = 0x2020000000;
  char v46 = 0;
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __101__PKDynamicProvisioningFieldsPageViewController_initWithWebService_context_setupDelegate_fieldsPage___block_invoke;
  v35[3] = &unk_1E59D90F0;
  id v14 = v13;
  id v36 = v14;
  id v15 = v11;
  id v37 = v15;
  id v16 = v12;
  id v38 = v16;
  id v17 = v10;
  id v39 = v17;
  v41 = &v47;
  id v18 = v9;
  id v40 = v18;
  v42 = &v43;
  [v18 enumerateObjectsUsingBlock:v35];
  if (!*((unsigned char *)v48 + 24))
  {
    v19 = objc_msgSend(v14, "copy", obj);
    [v16 addObject:v19];
  }
  if (*((unsigned char *)v44 + 24))
  {
    id v20 = objc_alloc(MEMORY[0x1E4F84C88]);
    v21 = (void *)[v17 copy];
    v22 = (void *)[v15 copy];
    v23 = (void *)[v20 initWithPaymentSetupFields:v21 footerFields:v22];
  }
  else
  {
    v23 = (void *)[objc_alloc(MEMORY[0x1E4F84C88]) initWithPaymentSetupFields:v18];
  }
  v34.receiver = self;
  v34.super_class = (Class)PKDynamicProvisioningFieldsPageViewController;
  v24 = -[PKPaymentSetupFieldsViewController initWithWebService:context:setupDelegate:setupFieldsModel:](&v34, sel_initWithWebService_context_setupDelegate_setupFieldsModel_, v33, a4, v32, v23, obj);
  v25 = v24;
  if (v24)
  {
    [(PKPaymentSetupFieldsViewController *)v24 setSectionIdentifiers:v16];
    objc_storeStrong((id *)&v25->_fieldsPage, obja);
  }

  _Block_object_dispose(&v43, 8);
  _Block_object_dispose(&v47, 8);

  return v25;
}

void __101__PKDynamicProvisioningFieldsPageViewController_initWithWebService_context_setupDelegate_fieldsPage___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v17 = a2;
  if ([v17 isFieldTypeLabel])
  {
    uint64_t v5 = [*(id *)(a1 + 32) firstObject];
    if (v5)
    {
      v6 = (void *)v5;
      v7 = *(void **)(a1 + 40);
      v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v17, 0);
      [v7 setValue:v8 forKey:v6];

      v9 = *(void **)(a1 + 48);
      v10 = (void *)[*(id *)(a1 + 32) copy];
      [v9 addObject:v10];

      [*(id *)(a1 + 32) removeAllObjects];
      [*(id *)(a1 + 56) removeObject:v17];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = [*(id *)(a1 + 64) count] - 1 == a3;
      *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 1;
    }
    else
    {
      id v14 = [*(id *)(a1 + 48) lastObject];
      v6 = [v14 firstObject];
      if (v6)
      {
        id v15 = [*(id *)(a1 + 40) objectForKey:v6];
        [v15 addObject:v17];
        *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = [*(id *)(a1 + 64) count] - 1 == a3;
        *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 1;
      }
      else
      {
        id v16 = *(void **)(a1 + 32);
        id v15 = [v17 identifier];
        [v16 addObject:v15];
      }
    }
  }
  else
  {
    char v11 = [v17 isFieldTypeFooter];
    id v12 = v17;
    if (v11) {
      goto LABEL_11;
    }
    id v13 = *(void **)(a1 + 32);
    v6 = [v17 identifier];
    [v13 addObject:v6];
  }

  id v12 = v17;
LABEL_11:
}

- (void)viewDidLoad
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)PKDynamicProvisioningFieldsPageViewController;
  [(PKPaymentSetupFieldsViewController *)&v6 viewDidLoad];
  [(PKPaymentSetupFieldsViewController *)self setHidesBackButton:1 animated:0];
  v3 = (UIBarButtonItem *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:1 target:self action:sel_handleCancelTapped];
  cancelButton = self->_cancelButton;
  self->_cancelButton = v3;

  [(UIBarButtonItem *)self->_cancelButton setAccessibilityIdentifier:*MEMORY[0x1E4F85488]];
  v7[0] = self->_cancelButton;
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  [(PKPaymentSetupFieldsViewController *)self _setLeftBarButtonItems:v5 animated:0];
}

- (void)handleCancelTapped
{
}

- (void)showSpinner:(BOOL)a3
{
  if (self->_isLoading != a3)
  {
    self->_isLoading = a3;
    BOOL v4 = !a3;
    uint64_t v5 = [(PKDynamicProvisioningFieldsPageViewController *)self navigationController];
    objc_super v6 = [v5 view];
    v7 = v6;
    if (v6)
    {
      id v8 = v6;
    }
    else
    {
      id v8 = [(PKDynamicProvisioningFieldsPageViewController *)self view];
    }
    id v18 = v8;

    [v18 setUserInteractionEnabled:v4];
    v9 = [(PKPaymentSetupTableViewController *)self dockView];
    [v9 setButtonsEnabled:v4];

    [(PKDynamicProvisioningFieldsPageViewController *)self _setNavigationBarEnabled:v4];
    v10 = [(PKDynamicProvisioningFieldsPageViewController *)self navigationItem];
    char v11 = v10;
    if (self->_isLoading)
    {
      self->_backHidden = [v10 hidesBackButton];
      id v12 = [v11 rightBarButtonItem];
      hiddenRightBarButtonItem = self->_hiddenRightBarButtonItem;
      self->_hiddenRightBarButtonItem = v12;

      if (!self->_spinningNavBarItem)
      {
        id v14 = (UIActivityIndicatorView *)[objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:100];
        activityIndicatorView = self->_activityIndicatorView;
        self->_activityIndicatorView = v14;

        id v16 = (UIBarButtonItem *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithCustomView:self->_activityIndicatorView];
        spinningNavBarItem = self->_spinningNavBarItem;
        self->_spinningNavBarItem = v16;
      }
      [(UIActivityIndicatorView *)self->_activityIndicatorView startAnimating];
      [v11 setRightBarButtonItem:self->_spinningNavBarItem];
      [v11 setHidesBackButton:1];
    }
    else
    {
      [(UIActivityIndicatorView *)self->_activityIndicatorView stopAnimating];
      [v11 setRightBarButtonItem:self->_hiddenRightBarButtonItem];
      [v11 setHidesBackButton:self->_backHidden];
      [(UIBarButtonItem *)self->_hiddenRightBarButtonItem setEnabled:[(PKPaymentSetupFieldsViewController *)self isComplete]];
    }
    [v18 setNeedsLayout];
  }
}

- (void)_setNavigationBarEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v10 = [(PKDynamicProvisioningFieldsPageViewController *)self navigationController];
  uint64_t v5 = [v10 navigationBar];
  [v5 setUserInteractionEnabled:v3];

  objc_super v6 = [v10 interactivePopGestureRecognizer];
  [v6 setEnabled:v3];

  v7 = [(PKDynamicProvisioningFieldsPageViewController *)self navigationItem];
  id v8 = [v7 leftBarButtonItem];
  [v8 setEnabled:v3];

  v9 = [v7 rightBarButtonItem];
  [v9 setEnabled:v3];
}

- (id)defaultHeaderViewTitle
{
  return (id)[(PKDynamicProvisioningFieldsPageContent *)self->_fieldsPage title];
}

- (id)defaultHeaderViewSubTitle
{
  return (id)[(PKDynamicProvisioningFieldsPageContent *)self->_fieldsPage subtitle];
}

- (PKDynamicProvisioningFieldsPageContent)fieldsPage
{
  return self->_fieldsPage;
}

- (BOOL)isLoading
{
  return self->_isLoading;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fieldsPage, 0);
  objc_storeStrong((id *)&self->_activityIndicatorView, 0);
  objc_storeStrong((id *)&self->_hiddenRightBarButtonItem, 0);
  objc_storeStrong((id *)&self->_spinningNavBarItem, 0);

  objc_storeStrong((id *)&self->_cancelButton, 0);
}

@end