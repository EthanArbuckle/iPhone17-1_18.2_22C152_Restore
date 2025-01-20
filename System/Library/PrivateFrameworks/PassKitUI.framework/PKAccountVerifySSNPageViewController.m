@interface PKAccountVerifySSNPageViewController
- (PKAccountVerifySSNPageViewController)initWithAccount:(id)a3 context:(int64_t)a4;
- (id)defaultHeaderViewSubTitle;
- (id)defaultHeaderViewTitle;
- (void)_cancelPressed;
- (void)_handleNextStep;
- (void)_showSpinner:(BOOL)a3;
- (void)_terminateFlow;
- (void)viewDidLoad;
@end

@implementation PKAccountVerifySSNPageViewController

- (PKAccountVerifySSNPageViewController)initWithAccount:(id)a3 context:(int64_t)a4
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v19 = a3;
  v6 = [MEMORY[0x1E4F84C50] paymentSetupFieldWithIdentifier:*MEMORY[0x1E4F87B68]];
  v7 = [MEMORY[0x1E4F84C50] paymentSetupFieldWithIdentifier:*MEMORY[0x1E4F87AE0]];
  v8 = [v6 identifier];
  id v9 = objc_alloc(MEMORY[0x1E4F84C88]);
  v26[0] = v6;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:1];
  v23 = v7;
  v24 = v8;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v23 count:1];
  v25 = v11;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v25 forKeys:&v24 count:1];
  v13 = (void *)[v9 initWithPaymentSetupFields:v10 footerFields:v12];

  v20.receiver = self;
  v20.super_class = (Class)PKAccountVerifySSNPageViewController;
  v14 = [(PKPaymentSetupFieldsViewController *)&v20 initWithWebService:0 context:a4 setupDelegate:0 setupFieldsModel:v13];
  if (v14)
  {
    v21 = v8;
    v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v21 count:1];
    v22 = v15;
    v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v22 count:1];
    [(PKPaymentSetupFieldsViewController *)v14 setSectionIdentifiers:v16];

    objc_storeStrong((id *)&v14->_account, a3);
  }

  return v14;
}

- (void)viewDidLoad
{
  v11[1] = *MEMORY[0x1E4F143B8];
  v9.receiver = self;
  v9.super_class = (Class)PKAccountVerifySSNPageViewController;
  [(PKPaymentSetupFieldsViewController *)&v9 viewDidLoad];
  [(PKPaymentSetupFieldsViewController *)self setHidesBackButton:1 animated:0];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:1 target:self action:sel__cancelPressed];
  v11[0] = v3;
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  [(PKPaymentSetupFieldsViewController *)self _setLeftBarButtonItems:v4 animated:0];

  id v5 = objc_alloc(MEMORY[0x1E4FB14A8]);
  v6 = PKLocalizedString(&cfstr_Done.isa);
  v7 = (void *)[v5 initWithTitle:v6 style:2 target:self action:sel__handleNextStep];

  v10 = v7;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v10 count:1];
  [(PKPaymentSetupFieldsViewController *)self _setRightBarButtonItems:v8 animated:0];
}

- (void)_showSpinner:(BOOL)a3
{
  BOOL v3 = a3;
  self->_isLoading = a3;
  id v5 = [(PKPaymentSetupTableViewController *)self dockView];
  if (v3) {
    [(PKPaymentSetupFieldsViewController *)self showActivitySpinnerWithTitle:0 subtitle:0];
  }
  else {
    [(PKPaymentSetupFieldsViewController *)self hideActivitySpinner];
  }
  [v5 setButtonsEnabled:!v3];
}

- (id)defaultHeaderViewTitle
{
  return (id)PKLocalizedMadisonString(&cfstr_VerifySsnTitle.isa);
}

- (id)defaultHeaderViewSubTitle
{
  return (id)PKLocalizedMadisonString(&cfstr_VerifySsnMessa.isa);
}

- (void)_handleNextStep
{
  [(PKAccountVerifySSNPageViewController *)self _showSpinner:1];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __55__PKAccountVerifySSNPageViewController__handleNextStep__block_invoke;
  aBlock[3] = &unk_1E59CB6D8;
  aBlock[4] = self;
  BOOL v3 = _Block_copy(aBlock);
  v4 = [MEMORY[0x1E4F84D50] sharedService];
  id v5 = objc_alloc_init(MEMORY[0x1E4F84300]);
  [v5 setDestination:3];
  v6 = [(PKAccount *)self->_account accountBaseURL];
  [v5 setBaseURL:v6];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __55__PKAccountVerifySSNPageViewController__handleNextStep__block_invoke_2;
  v9[3] = &unk_1E59D8A48;
  id v10 = v4;
  id v11 = v3;
  v9[4] = self;
  id v7 = v4;
  id v8 = v3;
  [v7 accountServiceCertificatesWithRequest:v5 completion:v9];
}

uint64_t __55__PKAccountVerifySSNPageViewController__handleNextStep__block_invoke(uint64_t a1, int a2)
{
  uint64_t result = [*(id *)(a1 + 32) _showSpinner:0];
  if (a2)
  {
    id v5 = *(void **)(a1 + 32);
    return [v5 _terminateFlow];
  }
  return result;
}

void __55__PKAccountVerifySSNPageViewController__handleNextStep__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5 || v6)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __55__PKAccountVerifySSNPageViewController__handleNextStep__block_invoke_3;
    block[3] = &unk_1E59CE110;
    id v16 = v6;
    uint64_t v17 = *(void *)(a1 + 32);
    id v21 = v16;
    uint64_t v22 = v17;
    id v23 = *(id *)(a1 + 48);
    dispatch_async(MEMORY[0x1E4F14428], block);

    id v8 = v21;
  }
  else
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F842D0]);
    objc_super v9 = [*(id *)(*(void *)(a1 + 32) + 1224) accountIdentifier];
    [v8 setAccountIdentifier:v9];

    id v10 = [*(id *)(*(void *)(a1 + 32) + 1224) accountBaseURL];
    [v8 setBaseURL:v10];

    id v11 = [*(id *)(a1 + 32) fieldForIdentifier:*MEMORY[0x1E4F87B68]];
    v12 = [v11 submissionString];

    [v8 setSsn:v12];
    objc_msgSend(v8, "setFeatureIdentifier:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1224), "feature"));
    v13 = [v5 encryptionCertificates];
    [v8 setCertificates:v13];

    v14 = [v5 encryptionVersion];
    [v8 setEncryptionVersion:v14];

    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __55__PKAccountVerifySSNPageViewController__handleNextStep__block_invoke_5;
    v18[3] = &unk_1E59D8A20;
    v15 = *(void **)(a1 + 40);
    v18[4] = *(void *)(a1 + 32);
    id v19 = *(id *)(a1 + 48);
    [v15 accountUpdateUserInfoWithRequest:v8 completion:v18];
  }
}

void __55__PKAccountVerifySSNPageViewController__handleNextStep__block_invoke_3(uint64_t a1)
{
  v2 = PKAccountDisplayableError();
  id v3 = PKAlertForDisplayableErrorWithHandlers(v2, 0, 0, 0);

  if (v3)
  {
    v4 = [*(id *)(a1 + 40) navigationController];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __55__PKAccountVerifySSNPageViewController__handleNextStep__block_invoke_4;
    v5[3] = &unk_1E59CAA98;
    id v6 = *(id *)(a1 + 48);
    [v4 presentViewController:v3 animated:1 completion:v5];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

uint64_t __55__PKAccountVerifySSNPageViewController__handleNextStep__block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __55__PKAccountVerifySSNPageViewController__handleNextStep__block_invoke_5(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __55__PKAccountVerifySSNPageViewController__handleNextStep__block_invoke_6;
    block[3] = &unk_1E59CE110;
    id v6 = (id *)v15;
    id v7 = v4;
    uint64_t v8 = *(void *)(a1 + 32);
    objc_super v9 = *(void **)(a1 + 40);
    v15[0] = v7;
    v15[1] = v8;
    id v16 = v9;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  else
  {
    id v10 = [MEMORY[0x1E4F84270] sharedInstance];
    id v11 = [*(id *)(*(void *)(a1 + 32) + 1224) accountIdentifier];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __55__PKAccountVerifySSNPageViewController__handleNextStep__block_invoke_8;
    v12[3] = &unk_1E59D89F8;
    id v6 = &v13;
    id v13 = *(id *)(a1 + 40);
    [v10 updateAccountUsersForAccountWithIdentifier:v11 completion:v12];
  }
}

void __55__PKAccountVerifySSNPageViewController__handleNextStep__block_invoke_6(uint64_t a1)
{
  v2 = PKAccountDisplayableError();
  id v3 = PKAlertForDisplayableErrorWithHandlers(v2, 0, 0, 0);

  if (v3)
  {
    id v4 = [*(id *)(a1 + 40) navigationController];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __55__PKAccountVerifySSNPageViewController__handleNextStep__block_invoke_7;
    v5[3] = &unk_1E59CAA98;
    id v6 = *(id *)(a1 + 48);
    [v4 presentViewController:v3 animated:1 completion:v5];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

uint64_t __55__PKAccountVerifySSNPageViewController__handleNextStep__block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __55__PKAccountVerifySSNPageViewController__handleNextStep__block_invoke_8(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__PKAccountVerifySSNPageViewController__handleNextStep__block_invoke_9;
  block[3] = &unk_1E59CAA98;
  id v2 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __55__PKAccountVerifySSNPageViewController__handleNextStep__block_invoke_9(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_cancelPressed
{
  id v3 = [(PKPaymentSetupFieldsViewController *)self setupDelegate];
  id v5 = v3;
  if (v3)
  {
    [v3 viewControllerDidCancelSetupFlow:self];
  }
  else
  {
    id v4 = [(PKAccountVerifySSNPageViewController *)self presentingViewController];
    [v4 dismissViewControllerAnimated:1 completion:0];
  }
}

- (void)_terminateFlow
{
  id v3 = [(PKPaymentSetupFieldsViewController *)self setupDelegate];
  id v5 = v3;
  if (v3)
  {
    [v3 viewControllerDidTerminateSetupFlow:self];
  }
  else
  {
    id v4 = [(PKAccountVerifySSNPageViewController *)self presentingViewController];
    [v4 dismissViewControllerAnimated:1 completion:0];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_storeStrong((id *)&self->_aboutCreditReportingField, 0);

  objc_storeStrong((id *)&self->_account, 0);
}

@end