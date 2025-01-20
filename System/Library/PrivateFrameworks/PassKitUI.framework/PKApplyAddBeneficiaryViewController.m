@interface PKApplyAddBeneficiaryViewController
- (PKApplyAddBeneficiaryViewController)initWithController:(id)a3 setupDelegate:(id)a4 pageContent:(id)a5;
- (PKApplyAddBeneficiaryViewController)initWithSetupDelegate:(id)a3 context:(int64_t)a4 pageContent:(id)a5 account:(id)a6;
- (id)_alertControllerForError:(id)a3;
- (id)defaultHeaderViewSubTitle;
- (id)defaultHeaderViewTitle;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (void)_setNavigationBarEnabled:(BOOL)a3;
- (void)_submit;
- (void)_terminateFlow;
- (void)showSpinner:(BOOL)a3;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)viewDidLoad;
@end

@implementation PKApplyAddBeneficiaryViewController

- (PKApplyAddBeneficiaryViewController)initWithSetupDelegate:(id)a3 context:(int64_t)a4 pageContent:(id)a5 account:(id)a6
{
  v64[1] = *MEMORY[0x1E4F143B8];
  id v51 = a3;
  id v43 = a5;
  id v8 = a5;
  id v44 = a6;
  id v49 = a6;
  v50 = v8;
  v9 = [v8 fieldModel];
  v10 = [v9 visiblePaymentSetupFields];

  id v52 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v59[0] = MEMORY[0x1E4F143A8];
  v59[1] = 3221225472;
  v59[2] = __89__PKApplyAddBeneficiaryViewController_initWithSetupDelegate_context_pageContent_account___block_invoke;
  v59[3] = &unk_1E59D65D0;
  id v14 = v13;
  id v60 = v14;
  id v15 = v12;
  id v61 = v15;
  v48 = v10;
  [v10 enumerateObjectsUsingBlock:v59];
  v16 = (void *)[objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"self" ascending:1];
  v64[0] = v16;
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v64 count:1];
  v47 = v14;
  v18 = [v14 sortedArrayUsingDescriptors:v17];

  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id obj = v18;
  uint64_t v19 = [obj countByEnumeratingWithState:&v55 objects:v63 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v56;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v56 != v21) {
          objc_enumerationMutation(obj);
        }
        v23 = [v15 objectForKeyedSubscript:*(void *)(*((void *)&v55 + 1) + 8 * i)];
        v24 = [v23 lastObject];
        if ([v24 isFieldTypeLabel])
        {
          v25 = [v23 firstObject];
          v26 = [v25 identifier];

          v27 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v24, 0, v43, v44);
          [v52 setObject:v27 forKeyedSubscript:v26];

          [v23 removeLastObject];
        }
        v28 = objc_msgSend(v23, "pk_arrayByApplyingBlock:", &__block_literal_global_116);
        [v11 addObject:v28];
      }
      uint64_t v20 = [obj countByEnumeratingWithState:&v55 objects:v63 count:16];
    }
    while (v20);
  }

  id v29 = objc_alloc(MEMORY[0x1E4F84C88]);
  v30 = (void *)[v48 copy];
  v31 = (void *)[v52 copy];
  v32 = (void *)[v29 initWithPaymentSetupFields:v30 footerFields:v31];

  v54.receiver = self;
  v54.super_class = (Class)PKApplyAddBeneficiaryViewController;
  v33 = [(PKPaymentSetupFieldsViewController *)&v54 initWithWebService:0 context:a4 setupDelegate:v51 setupFieldsModel:v32];
  v34 = v33;
  if (v33)
  {
    [(PKPaymentSetupFieldsViewController *)v33 setSectionIdentifiers:v11];
    objc_storeStrong((id *)&v34->_pageContent, v43);
    objc_storeStrong((id *)&v34->_account, v44);
    v35 = [(PKDynamicProvisioningFieldsPageContent *)v34->_pageContent fieldModel];
    v36 = [v35 paymentSetupFields];
    uint64_t v37 = [v36 count];

    if (v37)
    {
      id v38 = objc_alloc(MEMORY[0x1E4FB14A8]);
      v39 = PKLocalizedPaymentString(&cfstr_Submit.isa);
      v40 = (void *)[v38 initWithTitle:v39 style:2 target:v34 action:sel__handleNextButtonTapped];

      v62 = v40;
      v41 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v62 count:1];
      [(PKPaymentSetupFieldsViewController *)v34 _setRightBarButtonItems:v41 animated:0];
    }
    else
    {
      [(PKPaymentSetupFieldsViewController *)v34 _setNavigationBarEnabled:0 animated:0];
    }
  }

  return v34;
}

void __89__PKApplyAddBeneficiaryViewController_initWithSetupDelegate_context_pageContent_account___block_invoke(uint64_t a1, void *a2)
{
  id v13 = a2;
  uint64_t v3 = [v13 groupNumber];
  if (v3 >= 1)
  {
    uint64_t v4 = v3;
    v5 = *(void **)(a1 + 32);
    v6 = [NSNumber numberWithInteger:v3];
    [v5 addObject:v6];

    v7 = *(void **)(a1 + 40);
    id v8 = [NSNumber numberWithInteger:v4];
    v9 = [v7 objectForKeyedSubscript:v8];

    if (v9)
    {
      [v9 addObject:v13];
    }
    else
    {
      v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v13, 0);
      id v11 = *(void **)(a1 + 40);
      id v12 = [NSNumber numberWithInteger:v4];
      [v11 setObject:v10 forKeyedSubscript:v12];
    }
  }
  if ([v13 isMemberOfClass:objc_opt_class()]) {
    [v13 setDisallowCurrentYear:0];
  }
}

uint64_t __89__PKApplyAddBeneficiaryViewController_initWithSetupDelegate_context_pageContent_account___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

- (PKApplyAddBeneficiaryViewController)initWithController:(id)a3 setupDelegate:(id)a4 pageContent:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a4;
  uint64_t v12 = [v9 context];
  id v13 = [v9 account];
  id v14 = [(PKApplyAddBeneficiaryViewController *)self initWithSetupDelegate:v11 context:v12 pageContent:v10 account:v13];

  if (v14) {
    objc_storeStrong((id *)&v14->_controller, a3);
  }

  return v14;
}

- (void)viewDidLoad
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)PKApplyAddBeneficiaryViewController;
  [(PKPaymentSetupFieldsViewController *)&v6 viewDidLoad];
  [(PKPaymentSetupFieldsViewController *)self setHidesBackButton:1 animated:0];
  uint64_t v3 = (UIBarButtonItem *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:1 target:self action:sel_handleCancelTapped];
  cancelButton = self->_cancelButton;
  self->_cancelButton = v3;

  v7[0] = self->_cancelButton;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  [(PKPaymentSetupFieldsViewController *)self _setLeftBarButtonItems:v5 animated:0];
}

- (void)showSpinner:(BOOL)a3
{
  if (self->_isLoading != a3)
  {
    self->_isLoading = a3;
    BOOL v4 = !a3;
    v5 = [(PKApplyAddBeneficiaryViewController *)self navigationController];
    objc_super v6 = [v5 view];
    v7 = v6;
    if (v6)
    {
      id v8 = v6;
    }
    else
    {
      id v8 = [(PKApplyAddBeneficiaryViewController *)self view];
    }
    id v18 = v8;

    [v18 setUserInteractionEnabled:v4];
    id v9 = [(PKPaymentSetupTableViewController *)self dockView];
    [v9 setButtonsEnabled:v4];

    [(PKApplyAddBeneficiaryViewController *)self _setNavigationBarEnabled:v4];
    id v10 = [(PKApplyAddBeneficiaryViewController *)self navigationItem];
    id v11 = v10;
    if (self->_isLoading)
    {
      self->_backHidden = [v10 hidesBackButton];
      uint64_t v12 = [v11 rightBarButtonItem];
      hiddenRightBarButtonItem = self->_hiddenRightBarButtonItem;
      self->_hiddenRightBarButtonItem = v12;

      if (!self->_spinningNavBarItem)
      {
        id v14 = (UIActivityIndicatorView *)[objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:100];
        activityIndicatorView = self->_activityIndicatorView;
        self->_activityIndicatorView = v14;

        v16 = (UIBarButtonItem *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithCustomView:self->_activityIndicatorView];
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
  id v10 = [(PKApplyAddBeneficiaryViewController *)self navigationController];
  v5 = [v10 navigationBar];
  [v5 setUserInteractionEnabled:v3];

  objc_super v6 = [v10 interactivePopGestureRecognizer];
  [v6 setEnabled:v3];

  v7 = [(PKApplyAddBeneficiaryViewController *)self navigationItem];
  id v8 = [v7 leftBarButtonItem];
  [v8 setEnabled:v3];

  id v9 = [v7 rightBarButtonItem];
  [v9 setEnabled:v3];
}

- (id)defaultHeaderViewTitle
{
  return (id)[(PKDynamicProvisioningFieldsPageContent *)self->_pageContent title];
}

- (id)defaultHeaderViewSubTitle
{
  return (id)[(PKDynamicProvisioningFieldsPageContent *)self->_pageContent subtitle];
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)PKApplyAddBeneficiaryViewController;
  [(PKPaymentSetupFieldsViewController *)&v17 tableView:a3 willDisplayCell:v8 forRowAtIndexPath:a5];
  id v9 = [v8 textLabel];
  id v10 = [v9 font];
  id v11 = v10;
  if (v10)
  {
    id v12 = v10;
  }
  else
  {
    id v12 = [MEMORY[0x1E4FB08E0] boldSystemFontOfSize:18.0];
  }
  id v13 = v12;

  id v14 = [(PKPaymentSetupFieldsViewController *)self fieldsModel];
  id v15 = [(PKPaymentSetupFieldsViewController *)self fieldsModel];
  v16 = [v15 visibleSetupFieldIdentifiers];
  [v14 minimumRequiredWidthForFieldIdentifiers:v16 withFont:v13];

  PKFloatCeilToPixel();
  objc_msgSend(v8, "setMinimumTextLabelWidth:");
  [v8 setHidePrediction:1];
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  objc_super v6 = [(PKPaymentSetupFieldsViewController *)self sectionIdentifiers];

  if (!v6)
  {
    id v15 = 0;
    goto LABEL_13;
  }
  v7 = [(PKPaymentSetupFieldsViewController *)self sectionIdentifiers];
  id v8 = [v7 objectAtIndexedSubscript:a4];
  id v9 = [v8 firstObject];

  id v10 = (void *)*MEMORY[0x1E4F87B78];
  id v11 = v9;
  id v12 = v10;
  if (v11 == v12)
  {
  }
  else
  {
    id v13 = v12;
    if (!v11 || !v12)
    {

LABEL_11:
      id v15 = 0;
      goto LABEL_12;
    }
    int v14 = [v11 isEqualToString:v12];

    if (!v14) {
      goto LABEL_11;
    }
  }
  id v15 = PKLocalizedFeatureString();
LABEL_12:

LABEL_13:

  return v15;
}

- (void)_terminateFlow
{
  [(PKApplyController *)self->_controller endApplyFlow];
  BOOL v3 = [(PKPaymentSetupFieldsViewController *)self setupDelegate];
  id v5 = v3;
  if (v3)
  {
    [v3 viewControllerDidTerminateSetupFlow:self];
  }
  else
  {
    BOOL v4 = [(PKApplyAddBeneficiaryViewController *)self presentingViewController];
    [v4 dismissViewControllerAnimated:1 completion:0];
  }
}

- (void)_submit
{
  v10[2] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F30B50]);
  v9[0] = &unk_1EF2B93F0;
  BOOL v4 = PKLocalizedString(&cfstr_Wallet_0.isa);
  v9[1] = &unk_1EF2B9408;
  v10[0] = v4;
  v10[1] = MEMORY[0x1E4F1CC38];
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];

  [(PKApplyAddBeneficiaryViewController *)self showSpinner:1];
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __46__PKApplyAddBeneficiaryViewController__submit__block_invoke;
  v6[3] = &unk_1E59D6618;
  objc_copyWeak(&v7, &location);
  [v3 evaluatePolicy:2 options:v5 reply:v6];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __46__PKApplyAddBeneficiaryViewController__submit__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_super v6 = WeakRetained;
  if (WeakRetained)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __46__PKApplyAddBeneficiaryViewController__submit__block_invoke_2;
    aBlock[3] = &unk_1E59CB6D8;
    aBlock[4] = WeakRetained;
    id v7 = _Block_copy(aBlock);
    id v8 = v7;
    if (!a2 || a3)
    {
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __46__PKApplyAddBeneficiaryViewController__submit__block_invoke_5;
      v14[3] = &unk_1E59CAA98;
      id v15 = v7;
      id v13 = v7;
      dispatch_async(MEMORY[0x1E4F14428], v14);
      id v12 = v15;
    }
    else
    {
      id v9 = (void *)v6[153];
      uint64_t v10 = v6[155];
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __46__PKApplyAddBeneficiaryViewController__submit__block_invoke_3;
      v16[3] = &unk_1E59CAC08;
      v16[4] = v6;
      objc_super v17 = v7;
      id v11 = v7;
      [v9 submitFieldsPage:v10 completion:v16];
      id v12 = v17;
    }
  }
}

uint64_t __46__PKApplyAddBeneficiaryViewController__submit__block_invoke_2(uint64_t a1, int a2)
{
  uint64_t result = [*(id *)(a1 + 32) showSpinner:0];
  if (a2)
  {
    [*(id *)(*(void *)(a1 + 32) + 1224) endApplyFlow];
    id v5 = *(void **)(a1 + 32);
    return [v5 _terminateFlow];
  }
  return result;
}

void __46__PKApplyAddBeneficiaryViewController__submit__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = [*(id *)(a1 + 32) _alertControllerForError:v6];
    if (v7) {
      [*(id *)(a1 + 32) presentViewController:v7 animated:1 completion:0];
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else if (v5)
  {
    id v8 = [*(id *)(a1 + 32) navigationController];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    void v9[2] = __46__PKApplyAddBeneficiaryViewController__submit__block_invoke_4;
    v9[3] = &unk_1E59CA9F8;
    id v10 = *(id *)(a1 + 40);
    objc_msgSend(v8, "pk_presentPaymentSetupViewController:animated:completion:", v5, 1, v9);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t __46__PKApplyAddBeneficiaryViewController__submit__block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __46__PKApplyAddBeneficiaryViewController__submit__block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_alertControllerForError:(id)a3
{
  id v3 = a3;
  BOOL v4 = v3;
  if (!v3)
  {
    id v17 = 0;
    goto LABEL_38;
  }
  id v5 = v3;
  id v6 = [v5 domain];
  int v7 = [v6 isEqualToString:*MEMORY[0x1E4F871A0]];

  id v8 = (void *)MEMORY[0x1E4F28A50];
  id v9 = v5;
  if (v7)
  {
    id v10 = [v5 userInfo];
    id v9 = [v10 objectForKeyedSubscript:*v8];
  }
  id v11 = [v9 domain];
  id v12 = (void *)*MEMORY[0x1E4F87C30];
  id v13 = v11;
  id v14 = v12;
  if (v13 == v14)
  {

    goto LABEL_11;
  }
  id v15 = v14;
  if (v13 && v14)
  {
    char v16 = [v13 isEqualToString:v14];

    if ((v16 & 1) == 0) {
      goto LABEL_17;
    }
LABEL_11:
    id v18 = [v9 userInfo];
    uint64_t v19 = [v18 objectForKeyedSubscript:*v8];

    uint64_t v20 = [v19 domain];
    uint64_t v21 = (void *)*MEMORY[0x1E4F88098];
    id v22 = v20;
    id v23 = v21;
    if (v22 == v23)
    {
    }
    else
    {
      v24 = v23;
      if (!v22 || !v23)
      {

LABEL_21:
        uint64_t v26 = 0;
        uint64_t v27 = 0;
        goto LABEL_22;
      }
      int v25 = [v22 isEqualToString:v23];

      if (!v25) {
        goto LABEL_21;
      }
    }
    uint64_t v26 = [v19 localizedFailureReason];
    uint64_t v27 = [v19 localizedRecoverySuggestion];
LABEL_22:
    if ([v9 code] == 60049)
    {
      if (!(v26 | v27))
      {
        uint64_t v26 = PKLocalizedFeatureString();
        uint64_t v27 = PKLocalizedFeatureString();
      }
    }
    else if (!(v26 | v27))
    {
      v28 = [v9 localizedFailureReason];
      id v29 = v28;
      if (v28)
      {
        id v30 = v28;
      }
      else
      {
        id v30 = [v5 localizedFailureReason];
      }
      uint64_t v26 = (uint64_t)v30;

      v31 = [v9 localizedRecoverySuggestion];
      v32 = v31;
      if (v31)
      {
        id v33 = v31;
      }
      else
      {
        id v33 = [v5 localizedRecoverySuggestion];
      }
      uint64_t v27 = (uint64_t)v33;
    }
    if (v26 | v27)
    {
      id v17 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v26 message:v27 preferredStyle:1];
      v34 = (void *)MEMORY[0x1E4FB1410];
      v35 = PKLocalizedString(&cfstr_OkButtonTitle.isa);
      v36 = [v34 actionWithTitle:v35 style:1 handler:0];
      [v17 addAction:v36];
    }
    else
    {
      id v17 = 0;
    }

    goto LABEL_37;
  }

LABEL_17:
  id v17 = PKAlertForDisplayableErrorWithHandlers(v9, 0, 0, 0);
LABEL_37:

LABEL_38:

  return v17;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityIndicatorView, 0);
  objc_storeStrong((id *)&self->_hiddenRightBarButtonItem, 0);
  objc_storeStrong((id *)&self->_spinningNavBarItem, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_pageContent, 0);
  objc_storeStrong((id *)&self->_account, 0);

  objc_storeStrong((id *)&self->_controller, 0);
}

@end