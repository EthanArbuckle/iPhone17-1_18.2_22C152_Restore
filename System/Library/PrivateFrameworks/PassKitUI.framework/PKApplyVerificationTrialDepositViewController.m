@interface PKApplyVerificationTrialDepositViewController
- (BOOL)_needsPreflight;
- (BOOL)_performActionForActionIdentifier:(id)a3;
- (CGSize)_heroImageSize;
- (PKApplyVerificationTrialDepositViewController)initWithController:(id)a3 setupDelegate:(id)a4 verificationPage:(id)a5;
- (PKApplyVerificationTrialDepositViewController)initWithSetupDelegate:(id)a3 context:(int64_t)a4 verificationPage:(id)a5 account:(id)a6;
- (id)_alertControllerForContactSupport;
- (id)_alertControllerForError:(id)a3;
- (id)_userEnteredAmounts;
- (unint64_t)_verificationStatus;
- (void)_clearAllTextFields;
- (void)_handleNextButtonTapped;
- (void)_primaryButtonPressed;
- (void)_requestTrialDeposits;
- (void)_secondaryButtonPressed;
- (void)_submitCodes:(id)a3;
- (void)_terminateFlow;
- (void)_updateContentUnavailableConfigurationUsingState:(id)a3;
- (void)preflightWithCompletion:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation PKApplyVerificationTrialDepositViewController

- (PKApplyVerificationTrialDepositViewController)initWithSetupDelegate:(id)a3 context:(int64_t)a4 verificationPage:(id)a5 account:(id)a6
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v11 = a5;
  id v12 = a6;
  v23.receiver = self;
  v23.super_class = (Class)PKApplyVerificationTrialDepositViewController;
  v13 = [(PKDynamicProvisioningFieldsPageViewController *)&v23 initWithWebService:0 context:a4 setupDelegate:a3 fieldsPage:v11];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_verificationPage, a5);
    objc_storeStrong((id *)&v14->_account, a6);
    v15 = [(PKApplyVerificationPage *)v14->_verificationPage fieldModel];
    v16 = [v15 paymentSetupFields];
    uint64_t v17 = [v16 count];

    if (v17)
    {
      id v18 = objc_alloc(MEMORY[0x1E4FB14A8]);
      v19 = PKLocalizedPaymentString(&cfstr_Submit.isa);
      v20 = (void *)[v18 initWithTitle:v19 style:2 target:v14 action:sel__handleNextButtonTapped];

      v24[0] = v20;
      v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
      [(PKPaymentSetupFieldsViewController *)v14 _setRightBarButtonItems:v21 animated:0];
    }
    else
    {
      [(PKPaymentSetupFieldsViewController *)v14 _setNavigationBarEnabled:0 animated:0];
    }
  }

  return v14;
}

- (PKApplyVerificationTrialDepositViewController)initWithController:(id)a3 setupDelegate:(id)a4 verificationPage:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a4;
  uint64_t v12 = [v9 context];
  v13 = [v9 account];
  v14 = [(PKApplyVerificationTrialDepositViewController *)self initWithSetupDelegate:v11 context:v12 verificationPage:v10 account:v13];

  if (v14) {
    objc_storeStrong((id *)&v14->_controller, a3);
  }

  return v14;
}

- (void)viewDidLoad
{
  v11.receiver = self;
  v11.super_class = (Class)PKApplyVerificationTrialDepositViewController;
  [(PKDynamicProvisioningFieldsPageViewController *)&v11 viewDidLoad];
  v3 = [(PKPaymentSetupTableViewController *)self dockView];
  v4 = [v3 footerView];
  [v4 setManualEntryButton:0];
  v5 = [(PKApplyVerificationPage *)self->_verificationPage primaryActionTitle];
  if (v5)
  {
    v6 = [v3 primaryButton];
    [v6 setTitle:v5 forState:0];
    [v6 addTarget:self action:sel__primaryButtonPressed forControlEvents:0x2000];
  }
  else
  {
    [v3 setPrimaryButton:0];
  }
  v7 = [(PKApplyVerificationPage *)self->_verificationPage secondaryActionTitle];
  if (v7)
  {
    v8 = [v4 secondaryActionButton];
    [v8 setTitle:v7 forState:0];
    [v8 addTarget:self action:sel__secondaryButtonPressed forControlEvents:0x2000];
  }
  else
  {
    [v4 setSecondaryActionButton:0];
  }
  id v9 = [(PKPaymentSetupFieldsViewController *)self headerView];
  [v9 setTopPadding:20.0];
  [v9 setBottomPadding:20.0];
  heroImage = self->_heroImage;
  if (heroImage)
  {
    [(PKApplyVerificationTrialDepositViewController *)self _heroImageSize];
    objc_msgSend(v9, "setImageViewImage:withSize:animated:", heroImage, 0);
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PKApplyVerificationTrialDepositViewController;
  [(PKPaymentSetupFieldsViewController *)&v7 viewWillAppear:a3];
  if ([(PKApplyVerificationTrialDepositViewController *)self _needsPreflight])
  {
    self->_isPreflighting = 1;
    [(PKApplyVerificationTrialDepositViewController *)self _setNeedsUpdateContentUnavailableConfiguration];
    objc_initWeak(&location, self);
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __64__PKApplyVerificationTrialDepositViewController_viewWillAppear___block_invoke;
    v4[3] = &unk_1E59CB100;
    objc_copyWeak(&v5, &location);
    [(PKApplyVerificationTrialDepositViewController *)self preflightWithCompletion:v4];
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

void __64__PKApplyVerificationTrialDepositViewController_viewWillAppear___block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__PKApplyVerificationTrialDepositViewController_viewWillAppear___block_invoke_2;
  block[3] = &unk_1E59CA7F8;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v2);
}

void __64__PKApplyVerificationTrialDepositViewController_viewWillAppear___block_invoke_2(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    if (WeakRetained[163])
    {
      id v2 = [WeakRetained headerView];
      uint64_t v3 = v4[163];
      [v4 _heroImageSize];
      objc_msgSend(v2, "setImageViewImage:withSize:animated:", v3, 1);

      WeakRetained = v4;
    }
    *((unsigned char *)WeakRetained + 1312) = 0;
    [v4 _setNeedsUpdateContentUnavailableConfiguration];
    WeakRetained = v4;
  }
}

- (void)preflightWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F1CB10];
  v6 = [(PKApplyVerificationPage *)self->_verificationPage heroImageURL];
  objc_super v7 = [v5 URLWithString:v6];

  if (v7)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __73__PKApplyVerificationTrialDepositViewController_preflightWithCompletion___block_invoke;
    aBlock[3] = &unk_1E59DBE28;
    aBlock[4] = self;
    id v15 = v4;
    v8 = (void (**)(void *, void *))_Block_copy(aBlock);
    id v9 = [MEMORY[0x1E4F84830] sharedImageAssetDownloader];
    id v10 = [v9 cachedDataForURL:v7];

    if (v10)
    {
      v8[2](v8, v10);
    }
    else
    {
      objc_super v11 = [MEMORY[0x1E4F84830] sharedImageAssetDownloader];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __73__PKApplyVerificationTrialDepositViewController_preflightWithCompletion___block_invoke_3;
      v12[3] = &unk_1E59CE028;
      v13 = v8;
      [v11 downloadFromUrl:v7 completionHandler:v12];
    }
  }
  else if (v4)
  {
    (*((void (**)(id, uint64_t))v4 + 2))(v4, 1);
  }
}

void __73__PKApplyVerificationTrialDepositViewController_preflightWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x1E4FB1818] imageWithData:v3];
    uint64_t v5 = *(void *)(a1 + 32);
    v6 = *(void **)(v5 + 1304);
    *(void *)(v5 + 1304) = v4;
  }
  objc_super v7 = *(void **)(a1 + 40);
  if (v7)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __73__PKApplyVerificationTrialDepositViewController_preflightWithCompletion___block_invoke_2;
    block[3] = &unk_1E59CAA98;
    id v9 = v7;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __73__PKApplyVerificationTrialDepositViewController_preflightWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __73__PKApplyVerificationTrialDepositViewController_preflightWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)_needsPreflight
{
  id v3 = [(PKApplyVerificationPage *)self->_verificationPage heroImageURL];
  if (v3) {
    BOOL v4 = self->_heroImage == 0;
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (void)_handleNextButtonTapped
{
  switch([(PKApplyVerificationTrialDepositViewController *)self _verificationStatus])
  {
    case 0uLL:
    case 2uLL:
    case 4uLL:
      [(PKApplyVerificationTrialDepositViewController *)self _terminateFlow];
      break;
    case 1uLL:
      id v3 = @"triggerTrialDeposits";
      goto LABEL_7;
    case 3uLL:
      id v3 = @"submitTrialDeposits";
LABEL_7:
      [(PKApplyVerificationTrialDepositViewController *)self _performActionForActionIdentifier:v3];
      break;
    default:
      return;
  }
}

- (void)_primaryButtonPressed
{
  id v3 = [(PKApplyVerificationPage *)self->_verificationPage primaryActionIdentifier];
  BOOL v4 = [(PKApplyVerificationTrialDepositViewController *)self _performActionForActionIdentifier:v3];

  if (!v4)
  {
    [(PKApplyVerificationTrialDepositViewController *)self _terminateFlow];
  }
}

- (void)_secondaryButtonPressed
{
  id v3 = [(PKApplyVerificationPage *)self->_verificationPage secondaryActionIdentifier];
  BOOL v4 = [(PKApplyVerificationTrialDepositViewController *)self _performActionForActionIdentifier:v3];

  if (!v4)
  {
    [(PKApplyVerificationTrialDepositViewController *)self _terminateFlow];
  }
}

- (BOOL)_performActionForActionIdentifier:(id)a3
{
  BOOL v4 = (__CFString *)a3;
  uint64_t v5 = v4;
  if (v4 == @"triggerTrialDeposits") {
    goto LABEL_4;
  }
  if (!v4)
  {
LABEL_15:
    BOOL v7 = 0;
    goto LABEL_16;
  }
  int v6 = [(__CFString *)v4 isEqualToString:@"triggerTrialDeposits"];

  if (!v6)
  {
    v8 = v5;
    if (v8 == @"callSavingsSupport"
      || (id v9 = v8,
          int v10 = [(__CFString *)v8 isEqualToString:@"callSavingsSupport"],
          v9,
          v10))
    {
      objc_initWeak(&location, self);
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __83__PKApplyVerificationTrialDepositViewController__performActionForActionIdentifier___block_invoke;
      v19[3] = &unk_1E59CA7F8;
      objc_copyWeak(&v20, &location);
      dispatch_async(MEMORY[0x1E4F14428], v19);
      objc_destroyWeak(&v20);
      objc_destroyWeak(&location);
      goto LABEL_5;
    }
    objc_super v11 = v9;
    if (v11 == @"submitTrialDeposits"
      || (uint64_t v12 = v11,
          int v13 = [(__CFString *)v11 isEqualToString:@"submitTrialDeposits"],
          v12,
          v13))
    {
      v14 = [(PKApplyVerificationTrialDepositViewController *)self _userEnteredAmounts];
      [(PKApplyVerificationTrialDepositViewController *)self _submitCodes:v14];

      goto LABEL_5;
    }
    id v15 = v12;
    if (v15 == @"skipTrialDeposits"
      || (v16 = v15,
          int v17 = [(__CFString *)v15 isEqualToString:@"skipTrialDeposits"],
          v16,
          v17))
    {
      [(PKApplyVerificationTrialDepositViewController *)self _submitCodes:0];
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_4:
  [(PKApplyVerificationTrialDepositViewController *)self _requestTrialDeposits];
LABEL_5:
  BOOL v7 = 1;
LABEL_16:

  return v7;
}

void __83__PKApplyVerificationTrialDepositViewController__performActionForActionIdentifier___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    id v2 = [WeakRetained _alertControllerForContactSupport];
    if (v2)
    {
      id v3 = [v4 navigationController];
      [v3 presentViewController:v2 animated:1 completion:0];
    }
    id WeakRetained = v4;
  }
}

- (void)_terminateFlow
{
  [(PKApplyController *)self->_controller endApplyFlow];
  id v3 = [(PKPaymentSetupFieldsViewController *)self setupDelegate];
  id v5 = v3;
  if (v3)
  {
    [v3 viewControllerDidTerminateSetupFlow:self];
  }
  else
  {
    id v4 = [(PKApplyVerificationTrialDepositViewController *)self presentingViewController];
    [v4 dismissViewControllerAnimated:1 completion:0];
  }
}

- (void)_submitCodes:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 count] == 0;
  [(PKDynamicProvisioningFieldsPageViewController *)self showSpinner:1];
  id v6 = objc_alloc_init(MEMORY[0x1E4F844A0]);
  [v6 setTrialDeposits:v4];
  [v6 setSkippedVerification:v5];
  objc_initWeak(&location, self);
  controller = self->_controller;
  verificationPage = self->_verificationPage;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __62__PKApplyVerificationTrialDepositViewController__submitCodes___block_invoke;
  v9[3] = &unk_1E59CB9C8;
  objc_copyWeak(&v10, &location);
  [(PKApplyController *)controller submitVerificationPage:verificationPage verificationInfo:v6 completion:v9];
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __62__PKApplyVerificationTrialDepositViewController__submitCodes___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__PKApplyVerificationTrialDepositViewController__submitCodes___block_invoke_2;
  block[3] = &unk_1E59CB378;
  objc_copyWeak(&v12, (id *)(a1 + 32));
  id v10 = v6;
  id v11 = v5;
  id v7 = v5;
  id v8 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v12);
}

void __62__PKApplyVerificationTrialDepositViewController__submitCodes___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __62__PKApplyVerificationTrialDepositViewController__submitCodes___block_invoke_3;
    aBlock[3] = &unk_1E59CB6D8;
    aBlock[4] = WeakRetained;
    id v4 = _Block_copy(aBlock);
    id v5 = (void (**)(void, void))v4;
    if (*(void *)(a1 + 32))
    {
      id v6 = objc_msgSend(v3, "_alertControllerForError:");
      if (v6) {
        [v3 presentViewController:v6 animated:1 completion:0];
      }
      ((void (**)(void, BOOL))v5)[2](v5, v6 != 0);
    }
    else if (*(void *)(a1 + 40))
    {
      id v7 = [v3 navigationController];
      objc_msgSend(v7, "pk_presentPaymentSetupViewController:animated:completion:", *(void *)(a1 + 40), 1, v5);
    }
    else
    {
      (*((void (**)(void *, void))v4 + 2))(v4, 0);
    }
  }
}

uint64_t __62__PKApplyVerificationTrialDepositViewController__submitCodes___block_invoke_3(uint64_t a1, char a2)
{
  uint64_t result = [*(id *)(a1 + 32) showSpinner:0];
  if ((a2 & 1) == 0)
  {
    [*(id *)(*(void *)(a1 + 32) + 1280) endApplyFlow];
    id v5 = *(void **)(a1 + 32);
    return [v5 _terminateFlow];
  }
  return result;
}

- (void)_requestTrialDeposits
{
  id v3 = [(PKPaymentSetupTableViewController *)self dockView];
  id v4 = [v3 primaryButton];

  [v4 setShowSpinner:1];
  [v4 setEnabled:0];
  objc_initWeak(&location, self);
  controller = self->_controller;
  verificationPage = self->_verificationPage;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __70__PKApplyVerificationTrialDepositViewController__requestTrialDeposits__block_invoke;
  v8[3] = &unk_1E59CC710;
  objc_copyWeak(&v11, &location);
  id v7 = v4;
  id v9 = v7;
  id v10 = self;
  [(PKApplyController *)controller resendVerificationForPage:verificationPage completion:v8];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __70__PKApplyVerificationTrialDepositViewController__requestTrialDeposits__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __70__PKApplyVerificationTrialDepositViewController__requestTrialDeposits__block_invoke_2;
  v8[3] = &unk_1E59CE888;
  objc_copyWeak(&v12, (id *)(a1 + 48));
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  id v9 = v5;
  uint64_t v10 = v6;
  id v11 = v4;
  id v7 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v8);

  objc_destroyWeak(&v12);
}

void __70__PKApplyVerificationTrialDepositViewController__requestTrialDeposits__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    [*(id *)(a1 + 32) setShowSpinner:0];
    [*(id *)(a1 + 32) setEnabled:1];
    id v3 = [*(id *)(a1 + 40) _alertControllerForError:*(void *)(a1 + 48)];
    if (v3) {
      [v4 presentViewController:v3 animated:1 completion:0];
    }
    else {
      [v4 _terminateFlow];
    }

    id WeakRetained = v4;
  }
}

- (CGSize)_heroImageSize
{
  if (self->_heroImage)
  {
    double v3 = PKUIPixelLength();
    [(UIImage *)self->_heroImage size];
    double v5 = v3 * v4;
    double v7 = v3 * v6;
  }
  else
  {
    double v7 = *MEMORY[0x1E4F1DB30];
    double v5 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  result.height = v5;
  result.width = v7;
  return result;
}

- (unint64_t)_verificationStatus
{
  id v2 = [(PKApplyController *)self->_controller fundingSource];
  double v3 = [v2 fundingDetails];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v4 = [v3 verificationDetails];
    unint64_t v5 = [v4 status];
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

- (id)_userEnteredAmounts
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  double v4 = [(PKApplyVerificationPage *)self->_verificationPage fieldModel];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  unint64_t v5 = objc_msgSend(v4, "visiblePaymentSetupFields", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v11 = [v10 identifier];
        id v12 = [(PKPaymentSetupFieldsViewController *)self cellForIdentifier:v11];
        [v12 updatePaymentSetupFieldWithFormatting];

        int v13 = [v10 submissionString];
        if ([v13 length]) {
          [v3 addObject:v13];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  return v3;
}

- (void)_clearAllTextFields
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = [(PKApplyVerificationPage *)self->_verificationPage fieldModel];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  double v4 = objc_msgSend(v3, "visiblePaymentSetupFields", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = [*(id *)(*((void *)&v14 + 1) + 8 * v8) identifier];
        uint64_t v10 = [(PKPaymentSetupFieldsViewController *)self cellForIdentifier:v9];

        id v11 = [v10 editableTextField];
        [v11 setText:0];

        [v10 updatePaymentSetupFieldWithCurrentCellValue];
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  id v12 = [(PKPaymentSetupFieldsViewController *)self firstEmptyCell];
  int v13 = [v12 editableTextField];
  [v13 becomeFirstResponder];
}

- (id)_alertControllerForError:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v17 = 0;
    goto LABEL_41;
  }
  uint64_t v5 = v4;
  uint64_t v6 = [v4 domain];
  int v7 = [v6 isEqualToString:*MEMORY[0x1E4F871A0]];

  uint64_t v8 = (void *)MEMORY[0x1E4F28A50];
  if (v7)
  {
    id v9 = [v5 userInfo];
    uint64_t v10 = [v9 objectForKeyedSubscript:*v8];

    uint64_t v5 = (void *)v10;
  }
  id v11 = [v5 domain];
  id v12 = (void *)*MEMORY[0x1E4F87C30];
  id v13 = v11;
  id v14 = v12;
  if (v13 == v14)
  {

    goto LABEL_11;
  }
  long long v15 = v14;
  if (v13 && v14)
  {
    char v16 = [v13 isEqualToString:v14];

    if ((v16 & 1) == 0) {
      goto LABEL_17;
    }
LABEL_11:
    long long v18 = [v5 userInfo];
    uint64_t v19 = [v18 objectForKeyedSubscript:*v8];

    uint64_t v20 = [v19 domain];
    v21 = (void *)*MEMORY[0x1E4F88098];
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
        uint64_t v27 = 0;
        uint64_t v26 = 0;
LABEL_22:
        uint64_t v28 = [v5 code];
        int v29 = 0;
        char v30 = 1;
        if (v28 > 40455)
        {
          if (v28 != 40457)
          {
            if (v28 == 40456)
            {
              if (!(v26 | v27))
              {
                [(PKAccount *)self->_account feature];
                uint64_t v26 = PKLocalizedFeatureString();
                uint64_t v27 = PKLocalizedFeatureString();
              }
              int v29 = 1;
              goto LABEL_34;
            }
            goto LABEL_31;
          }
        }
        else if (v28 != 40423 && v28 != 40454)
        {
LABEL_31:
          if (!(v26 | v27))
          {
            uint64_t v26 = [v5 localizedFailureReason];
            uint64_t v27 = [v5 localizedRecoverySuggestion];
          }
          int v29 = 0;
          char v30 = 0;
        }
LABEL_34:
        if (v26 | v27)
        {
          id v17 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v26 message:v27 preferredStyle:1];
          v31 = (void *)&unk_1A0442000;
          if (v29)
          {
            objc_initWeak(&location, self);
            v32 = (void *)MEMORY[0x1E4FB1410];
            v33 = PKLocalizedPaymentString(&cfstr_TryAgainButton.isa);
            v41[0] = MEMORY[0x1E4F143A8];
            v41[1] = 3221225472;
            v41[2] = __74__PKApplyVerificationTrialDepositViewController__alertControllerForError___block_invoke;
            v41[3] = &unk_1E59CCFF0;
            objc_copyWeak(&v42, &location);
            v34 = [v32 actionWithTitle:v33 style:0 handler:v41];

            [v17 addAction:v34];
            [v17 setPreferredAction:v34];

            objc_destroyWeak(&v42);
            objc_destroyWeak(&location);
            v31 = &unk_1A0442000;
          }
          v35 = (void *)MEMORY[0x1E4FB1410];
          v36 = PKLocalizedString(&cfstr_Cancel.isa);
          v39[0] = MEMORY[0x1E4F143A8];
          v39[1] = v31[313];
          v39[2] = __74__PKApplyVerificationTrialDepositViewController__alertControllerForError___block_invoke_2;
          v39[3] = &unk_1E59D09A0;
          char v40 = v30;
          v39[4] = self;
          v37 = [v35 actionWithTitle:v36 style:1 handler:v39];
          [v17 addAction:v37];
        }
        else
        {
          id v17 = 0;
        }

        goto LABEL_40;
      }
      int v25 = [v22 isEqualToString:v23];

      if (!v25) {
        goto LABEL_21;
      }
    }
    uint64_t v26 = [v19 localizedFailureReason];
    uint64_t v27 = [v19 localizedRecoverySuggestion];
    goto LABEL_22;
  }

LABEL_17:
  id v17 = PKAlertForDisplayableErrorWithHandlers(v5, 0, 0, 0);
LABEL_40:

LABEL_41:

  return v17;
}

void __74__PKApplyVerificationTrialDepositViewController__alertControllerForError___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _clearAllTextFields];
    id WeakRetained = v2;
  }
}

uint64_t __74__PKApplyVerificationTrialDepositViewController__alertControllerForError___block_invoke_2(uint64_t result)
{
  if (*(unsigned char *)(result + 40)) {
    return [*(id *)(result + 32) _performActionForActionIdentifier:@"skipTrialDeposits"];
  }
  return result;
}

- (id)_alertControllerForContactSupport
{
  id v3 = [(PKAccount *)self->_account savingsDetails];
  id v4 = [v3 contactNumber];

  if (v4)
  {
    [(PKAccount *)self->_account feature];
    uint64_t v5 = PKLocalizedFeatureString();
    uint64_t v6 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v5 message:0 preferredStyle:0];
    int v7 = (void *)MEMORY[0x1E4FB1410];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __82__PKApplyVerificationTrialDepositViewController__alertControllerForContactSupport__block_invoke;
    v13[3] = &unk_1E59CB1F0;
    id v14 = v4;
    uint64_t v8 = [v7 actionWithTitle:v14 style:0 handler:v13];
    [v6 addAction:v8];

    id v9 = (void *)MEMORY[0x1E4FB1410];
    uint64_t v10 = PKLocalizedString(&cfstr_Cancel.isa);
    id v11 = [v9 actionWithTitle:v10 style:1 handler:0];
    [v6 addAction:v11];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

void __82__PKApplyVerificationTrialDepositViewController__alertControllerForContactSupport__block_invoke()
{
  id v1 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  v0 = PKTelephoneURLFromPhoneNumber();
  [v1 openSensitiveURL:v0 withOptions:0];
}

- (void)_updateContentUnavailableConfigurationUsingState:(id)a3
{
  if (self->_isPreflighting)
  {
    id v4 = (void *)MEMORY[0x1E4FB1658];
    id v5 = a3;
    uint64_t v6 = [v4 loadingConfiguration];
    id v10 = [v6 updatedConfigurationForState:v5];

    int v7 = [v10 background];
    uint64_t v8 = [(PKApplyVerificationTrialDepositViewController *)self view];
    id v9 = [v8 backgroundColor];
    [v7 setBackgroundColor:v9];
  }
  else
  {
    id v10 = 0;
  }
  [(PKApplyVerificationTrialDepositViewController *)self _setContentUnavailableConfiguration:v10];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heroImage, 0);
  objc_storeStrong((id *)&self->_verificationPage, 0);
  objc_storeStrong((id *)&self->_account, 0);

  objc_storeStrong((id *)&self->_controller, 0);
}

@end