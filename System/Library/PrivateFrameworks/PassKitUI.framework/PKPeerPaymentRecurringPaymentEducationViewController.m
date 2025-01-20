@interface PKPeerPaymentRecurringPaymentEducationViewController
- (PKPeerPaymentRecurringPaymentEducationViewController)initWithContext:(int64_t)a3 transactionSourceCollection:(id)a4 familyCollection:(id)a5;
- (id)addCardHandler;
- (void)_requestOpenURL:(id)a3;
- (void)explanationViewDidSelectContinue:(id)a3;
- (void)setAddCardHandler:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation PKPeerPaymentRecurringPaymentEducationViewController

- (PKPeerPaymentRecurringPaymentEducationViewController)initWithContext:(int64_t)a3 transactionSourceCollection:(id)a4 familyCollection:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v23.receiver = self;
  v23.super_class = (Class)PKPeerPaymentRecurringPaymentEducationViewController;
  v11 = [(PKExplanationViewController *)&v23 initWithContext:a3];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_transactionSourceCollection, a4);
    objc_storeStrong((id *)&v12->_familyCollection, a5);
    v13 = [MEMORY[0x1E4F84E10] sharedService];
    v14 = [v13 targetDevice];
    uint64_t v15 = [v14 account];
    account = v12->_account;
    v12->_account = (PKPeerPaymentAccount *)v15;

    v17 = [MEMORY[0x1E4F84898] sharedInstance];
    v18 = [(PKPeerPaymentAccount *)v12->_account associatedPassUniqueID];
    v19 = [v17 passWithUniqueID:v18];
    uint64_t v20 = [v19 paymentPass];
    paymentPass = v12->_paymentPass;
    v12->_paymentPass = (PKPaymentPass *)v20;
  }
  return v12;
}

- (void)viewDidLoad
{
  v25.receiver = self;
  v25.super_class = (Class)PKPeerPaymentRecurringPaymentEducationViewController;
  [(PKExplanationViewController *)&v25 viewDidLoad];
  [(PKPeerPaymentRecurringPaymentEducationViewController *)self setModalInPresentation:1];
  [(PKExplanationViewController *)self setShowCancelButton:1];
  v3 = [(PKExplanationViewController *)self explanationView];
  [v3 setShowPrivacyView:0];
  [v3 setDelegate:self];
  v4 = (void *)MEMORY[0x1E4FB1818];
  v5 = PKPassKitUIBundle();
  uint64_t v6 = [v4 imageNamed:@"Hero_Apple_Cash_Recurring" inBundle:v5 withConfiguration:0];

  [v3 setImage:v6];
  v7 = PKLocalizedPeerPaymentRecurringString(&cfstr_RecurringPayme_9.isa);
  [v3 setTitleText:v7];

  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v9 = PKLocalizedPeerPaymentRecurringString(&cfstr_RecurringPayme_10.isa);
  id v10 = PKLocalizedPeerPaymentRecurringString(&cfstr_RecurringPayme_11.isa);
  v11 = PKLocalizedPeerPaymentRecurringString(&cfstr_RecurringPayme_12.isa, &stru_1EF1B5770.isa, v9, v10);
  objc_initWeak(&location, self);
  v12 = [PKTextRangeHyperlink alloc];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __67__PKPeerPaymentRecurringPaymentEducationViewController_viewDidLoad__block_invoke;
  v22[3] = &unk_1E59CB010;
  objc_copyWeak(&v23, &location);
  v22[4] = self;
  v13 = [(PKTextRangeHyperlink *)v12 initWithLinkText:v10 action:v22];
  uint64_t v20 = (void *)v9;
  v21 = (void *)v6;
  [v8 addObject:v13];
  v14 = objc_alloc_init(PKMultiHyperlinkView);
  [(PKMultiHyperlinkView *)v14 setText:v11];
  uint64_t v15 = [MEMORY[0x1E4FB1618] labelColor];
  [(PKMultiHyperlinkView *)v14 setTextColor:v15];

  [(PKMultiHyperlinkView *)v14 setTextAlignment:1];
  v16 = PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB28C8], (NSString *)*MEMORY[0x1E4FB2790]);
  [(PKMultiHyperlinkView *)v14 setTextFont:v16];

  [(PKMultiHyperlinkView *)v14 setSources:v8];
  [v3 setBodyView:v14];
  v17 = [v3 dockView];
  v18 = [v17 primaryButton];
  v19 = PKLocalizedPeerPaymentRecurringString(&cfstr_RecurringPayme_13.isa);
  [v18 setTitle:v19 forState:0];

  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);
}

void __67__PKPeerPaymentRecurringPaymentEducationViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    if ([*(id *)(*(void *)(a1 + 32) + 1056) termsAcceptanceRequired])
    {
      v3 = [MEMORY[0x1E4F84E10] sharedService];
      v4 = [v3 targetDevice];
      [v4 updateAccountWithCompletion:&__block_literal_global_191];
    }
    else
    {
      v3 = [v5[133] localizedValueForFieldKey:*MEMORY[0x1E4F87A80]];
      v4 = [MEMORY[0x1E4F1CB10] URLWithString:v3];
      if (v4) {
        [v5 _requestOpenURL:v4];
      }
    }

    WeakRetained = v5;
  }
}

void __67__PKPeerPaymentRecurringPaymentEducationViewController_viewDidLoad__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    if (PKIsPad())
    {
      v3 = NSNumber;
      v4 = [MEMORY[0x1E4FB1438] sharedApplication];
      v5 = objc_msgSend(v3, "numberWithInteger:", objc_msgSend(v4, "statusBarOrientation"));
    }
    else
    {
      v5 = &unk_1EF2B9960;
    }
    uint64_t v6 = [MEMORY[0x1E4F84E00] sharedInstance];
    [v6 presentPeerPaymentTermsAndConditionsWithAccount:v2 orientation:v5 completion:&__block_literal_global_54_0];
  }
  else
  {
    v5 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "Cannot present terms acceptance flow because the account is nil", v7, 2u);
    }
  }
}

void __67__PKPeerPaymentRecurringPaymentEducationViewController_viewDidLoad__block_invoke_51()
{
  v0 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_19F450000, v0, OS_LOG_TYPE_DEFAULT, "Presented Terms & Conditions acceptance flow", v1, 2u);
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PKPeerPaymentRecurringPaymentEducationViewController;
  [(PKPeerPaymentRecurringPaymentEducationViewController *)&v3 viewDidAppear:a3];
  PKPeerPaymentRecurringPaymentSetHasShownEducationMessage();
}

- (void)_requestOpenURL:(id)a3
{
  v4 = (objc_class *)MEMORY[0x1E4F3AEB8];
  id v5 = a3;
  id v7 = (id)[[v4 alloc] initWithURL:v5];

  [v7 setModalPresentationStyle:2];
  uint64_t v6 = [(PKPeerPaymentRecurringPaymentEducationViewController *)self navigationController];
  [v6 presentViewController:v7 animated:1 completion:0];
}

- (void)explanationViewDidSelectContinue:(id)a3
{
  id v12 = 0;
  uint64_t v13 = 0;
  BOOL v4 = +[PKPeerPaymentActionController canPerformPeerPaymentAction:3 account:self->_account unableReason:&v13 displayableError:&v12];
  id v5 = v12;
  if (v4)
  {
    objc_initWeak(&location, self);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __89__PKPeerPaymentRecurringPaymentEducationViewController_explanationViewDidSelectContinue___block_invoke;
    block[3] = &unk_1E59CA7F8;
    objc_copyWeak(&v10, &location);
    dispatch_async(MEMORY[0x1E4F14428], block);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  else
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __89__PKPeerPaymentRecurringPaymentEducationViewController_explanationViewDidSelectContinue___block_invoke_2;
    v8[3] = &unk_1E59CA7D0;
    v8[4] = self;
    uint64_t v6 = +[PKPeerPaymentActionController alertControllerForPeerPaymentActionUnableReason:v13 displayableError:v5 addCardActionHandler:v8];
    id v7 = [(PKPeerPaymentRecurringPaymentEducationViewController *)self navigationController];
    [v7 presentViewController:v6 animated:1 completion:0];
  }
}

void __89__PKPeerPaymentRecurringPaymentEducationViewController_explanationViewDidSelectContinue___block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v1 = [[PKRecipientPickerViewController alloc] initWithTransactionSourceCollection:WeakRetained[130] familyCollection:WeakRetained[131] peerPaymentSendFlowType:2];
    id v2 = [WeakRetained navigationController];
    [v2 pushViewController:v1 animated:1];
  }
}

void __89__PKPeerPaymentRecurringPaymentEducationViewController_explanationViewDidSelectContinue___block_invoke_2(uint64_t a1)
{
  objc_initWeak(&location, *(id *)(a1 + 32));
  id v2 = [*(id *)(a1 + 32) navigationController];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __89__PKPeerPaymentRecurringPaymentEducationViewController_explanationViewDidSelectContinue___block_invoke_3;
  v3[3] = &unk_1E59CA7F8;
  objc_copyWeak(&v4, &location);
  [v2 dismissViewControllerAnimated:1 completion:v3];

  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __89__PKPeerPaymentRecurringPaymentEducationViewController_explanationViewDidSelectContinue___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v3 = *((void *)WeakRetained + 134);
    if (v3)
    {
      id v4 = v2;
      (*(void (**)(void))(v3 + 16))();
      id v2 = v4;
    }
  }
}

- (id)addCardHandler
{
  return self->_addCardHandler;
}

- (void)setAddCardHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_addCardHandler, 0);
  objc_storeStrong((id *)&self->_paymentPass, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_familyCollection, 0);

  objc_storeStrong((id *)&self->_transactionSourceCollection, 0);
}

@end