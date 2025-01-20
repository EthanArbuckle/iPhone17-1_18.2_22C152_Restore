@interface PKAmountKeypadViewController
- ($85E40A55691FE2F31975A98F57E3065D)pkui_navigationStatusBarStyleDescriptor;
- (BOOL)showCancelButton;
- (PKAmountKeypadViewController)initWithRemoteMessagesComposer:(id)a3 recipient:(id)a4 sendFlowType:(int64_t)a5 familyCollection:(id)a6;
- (PKAmountKeypadViewController)initWithRemoteMessagesComposer:(id)a3 recipientAddress:(id)a4 sendFlowType:(int64_t)a5 familyCollection:(id)a6;
- (double)percentExpanded;
- (id)_composeRecipientForAddress:(id)a3;
- (id)_paymentSetupNavigationControllerForProvisioningController:(id)a3;
- (id)_peerPaymentController;
- (id)currentBalance;
- (id)maximumTransferAmount;
- (id)minimumTransferAmount;
- (void)_cancelButtonPressed;
- (void)_configureAvatarView;
- (void)_nextButtonPressed;
- (void)_openPaymentSetupWithNetworkWhitelist:(id)a3 paymentSetupMode:(int64_t)a4;
- (void)_presentRecurringDetailViewController;
- (void)dealloc;
- (void)handleAction:(unint64_t)a3 completion:(id)a4;
- (void)loadView;
- (void)paymentSetupDidFinish:(id)a3;
- (void)recurringPaymentDetailViewControllerDidDisappearWithRecurringPayment:(id)a3;
- (void)setRecurringPeerPayment:(id)a3;
- (void)setShowCancelButton:(BOOL)a3;
- (void)setUpContainerView;
- (void)setUpNavigationBar;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation PKAmountKeypadViewController

- (PKAmountKeypadViewController)initWithRemoteMessagesComposer:(id)a3 recipientAddress:(id)a4 sendFlowType:(int64_t)a5 familyCollection:(id)a6
{
  id v10 = a6;
  id v11 = a3;
  v12 = [(PKAmountKeypadViewController *)self _composeRecipientForAddress:a4];
  v13 = [(PKAmountKeypadViewController *)self initWithRemoteMessagesComposer:v11 recipient:v12 sendFlowType:a5 familyCollection:v10];

  return v13;
}

- (PKAmountKeypadViewController)initWithRemoteMessagesComposer:(id)a3 recipient:(id)a4 sendFlowType:(int64_t)a5 familyCollection:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v33.receiver = self;
  v33.super_class = (Class)PKAmountKeypadViewController;
  v14 = [(PKAmountKeypadViewController *)&v33 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_recipient, a4);
    v15->_sendFlowType = a5;
    objc_storeStrong((id *)&v15->_remoteMessagesComposer, a3);
    v16 = objc_alloc_init(PKPeerPaymentMessagesContentAmountEntryViewController);
    amountEntryViewController = v15->_amountEntryViewController;
    v15->_amountEntryViewController = v16;

    [(PKPeerPaymentMessagesContentAmountEntryViewController *)v15->_amountEntryViewController setSourceType:1];
    [(PKPeerPaymentMessagesContentAmountEntryViewController *)v15->_amountEntryViewController setDelegate:v15];
    if ((unint64_t)a5 >= 2)
    {
      if (a5 == 2)
      {
        [(PKPeerPaymentMessagesContentAmountEntryViewController *)v15->_amountEntryViewController setShowSendAndRequest:0];
        [(PKPeerPaymentMessagesContentAmountEntryViewController *)v15->_amountEntryViewController setShowSetupRecurringSend:0];
      }
    }
    else
    {
      [(PKPeerPaymentMessagesContentAmountEntryViewController *)v15->_amountEntryViewController setShowSendAndRequest:1];
      v18 = [(PKAmountKeypadViewController *)v15 _peerPaymentController];
      v19 = [v18 account];

      v20 = v15->_amountEntryViewController;
      if ([v19 supportsRecurringPayments])
      {
        v21 = [v13 currentUser];
        if ([v19 isEligibleForRecurringPaymentsForUser:v21]) {
          uint64_t v22 = PKIsVision() ^ 1;
        }
        else {
          uint64_t v22 = 0;
        }
        [(PKPeerPaymentMessagesContentAmountEntryViewController *)v20 setShowSetupRecurringSend:v22];
      }
      else
      {
        [(PKPeerPaymentMessagesContentAmountEntryViewController *)v20 setShowSetupRecurringSend:0];
      }
    }
    objc_storeStrong((id *)&v15->_familyCollection, a6);
    v23 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    containerView = v15->_containerView;
    v15->_containerView = v23;

    v25 = objc_alloc_init(PKAvatarView);
    avatarView = v15->_avatarView;
    v15->_avatarView = v25;

    v27 = [MEMORY[0x1E4F84E10] sharedService];
    uint64_t v28 = *MEMORY[0x1E4F87C70];
    v29 = [v12 address];
    [v27 prewarmDeviceScoreForEndpoint:v28 recipientAddress:v29 quoteDestinationType:1];

    uint64_t v30 = *MEMORY[0x1E4F87C68];
    v31 = [v12 address];
    [v27 prewarmDeviceScoreForEndpoint:v30 recipientAddress:v31 quoteDestinationType:1];
  }
  return v15;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F84E10] sharedService];
  v4 = [(CNComposeRecipient *)self->_recipient address];
  [v3 unloadDeviceScoreForEndpoint:*MEMORY[0x1E4F87C68] recipientAddress:v4 quoteDestinationType:1];
  [v3 unloadDeviceScoreForEndpoint:*MEMORY[0x1E4F87C70] recipientAddress:v4 quoteDestinationType:1];

  v5.receiver = self;
  v5.super_class = (Class)PKAmountKeypadViewController;
  [(PKAmountKeypadViewController *)&v5 dealloc];
}

- (void)setRecurringPeerPayment:(id)a3
{
  objc_storeStrong((id *)&self->_recurringPayment, a3);
  id v5 = a3;
  v6 = v5;
  if (v5)
  {
    v7 = [v5 amount];
    v8 = [v6 currency];
    PKCurrencyAmountMake();
    id v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = [MEMORY[0x1E4F28C28] zero];
    v8 = [(PKAmountKeypadViewController *)self _peerPaymentController];
    v9 = [v8 account];
    id v10 = [v9 currentBalance];
    id v11 = [v10 currency];
    PKCurrencyAmountMake();
    id v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  [(PKPeerPaymentMessagesContentAmountEntryViewController *)self->_amountEntryViewController setAmount:v12];
}

- (void)setShowCancelButton:(BOOL)a3
{
  if (self->_showCancelButton != a3)
  {
    self->_showCancelButton = a3;
    [(PKAmountKeypadViewController *)self setUpNavigationBar];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKAmountKeypadViewController;
  [(PKAmountKeypadViewController *)&v4 viewWillAppear:a3];
  [(PKAmountKeypadViewController *)self setUpNavigationBar];
}

- (void)viewDidAppear:(BOOL)a3
{
  v14[5] = *MEMORY[0x1E4F143B8];
  v12.receiver = self;
  v12.super_class = (Class)PKAmountKeypadViewController;
  [(PKAmountKeypadViewController *)&v12 viewDidAppear:a3];
  v3 = (void *)MEMORY[0x1E4F843E0];
  uint64_t v4 = *MEMORY[0x1E4F87000];
  uint64_t v5 = *MEMORY[0x1E4F869F0];
  uint64_t v6 = *MEMORY[0x1E4F86730];
  v13[0] = *MEMORY[0x1E4F864C8];
  v13[1] = v6;
  uint64_t v7 = *MEMORY[0x1E4F86990];
  v14[0] = v5;
  v14[1] = v7;
  uint64_t v8 = *MEMORY[0x1E4F864A0];
  uint64_t v9 = *MEMORY[0x1E4F86A60];
  v13[2] = *MEMORY[0x1E4F86308];
  v13[3] = v9;
  uint64_t v10 = *MEMORY[0x1E4F86A70];
  v14[2] = v8;
  v14[3] = v10;
  v13[4] = *MEMORY[0x1E4F86A10];
  v14[4] = *MEMORY[0x1E4F86A28];
  id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:5];
  [v3 subject:v4 sendEvent:v11];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v14[5] = *MEMORY[0x1E4F143B8];
  v12.receiver = self;
  v12.super_class = (Class)PKAmountKeypadViewController;
  [(PKAmountKeypadViewController *)&v12 viewDidDisappear:a3];
  v3 = (void *)MEMORY[0x1E4F843E0];
  uint64_t v4 = *MEMORY[0x1E4F87000];
  uint64_t v5 = *MEMORY[0x1E4F869F0];
  uint64_t v6 = *MEMORY[0x1E4F86730];
  v13[0] = *MEMORY[0x1E4F864C8];
  v13[1] = v6;
  uint64_t v7 = *MEMORY[0x1E4F86990];
  v14[0] = v5;
  v14[1] = v7;
  uint64_t v8 = *MEMORY[0x1E4F864A8];
  uint64_t v9 = *MEMORY[0x1E4F86A60];
  v13[2] = *MEMORY[0x1E4F86308];
  v13[3] = v9;
  uint64_t v10 = *MEMORY[0x1E4F86A70];
  v14[2] = v8;
  v14[3] = v10;
  v13[4] = *MEMORY[0x1E4F86A10];
  v14[4] = *MEMORY[0x1E4F86A28];
  id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:5];
  [v3 subject:v4 sendEvent:v11];
}

- (void)loadView
{
  v5.receiver = self;
  v5.super_class = (Class)PKAmountKeypadViewController;
  [(PKAmountKeypadViewController *)&v5 loadView];
  v3 = [(PKAmountKeypadViewController *)self view];
  uint64_t v4 = +[PKPeerPaymentTheme backgroundColor];
  [v3 setBackgroundColor:v4];

  [(PKAmountKeypadViewController *)self _configureAvatarView];
  [(PKAmountKeypadViewController *)self setUpContainerView];
}

- (void)setUpContainerView
{
  v3 = [(PKAmountKeypadViewController *)self view];
  [v3 addSubview:self->_containerView];

  [(UIView *)self->_containerView setPreservesSuperviewLayoutMargins:1];
  [(UIView *)self->_containerView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(PKAmountKeypadViewController *)self addChildViewController:self->_amountEntryViewController];
  containerView = self->_containerView;
  id v5 = [(PKPeerPaymentMessagesContentAmountEntryViewController *)self->_amountEntryViewController view];
  [(UIView *)containerView addSubview:v5];
}

- (void)viewDidLayoutSubviews
{
  containerView = self->_containerView;
  uint64_t v4 = [(PKAmountKeypadViewController *)self view];
  [v4 bounds];
  -[UIView setFrame:](containerView, "setFrame:");

  id v5 = [(PKPeerPaymentMessagesContentAmountEntryViewController *)self->_amountEntryViewController view];
  [(UIView *)self->_containerView bounds];
  double v7 = v6;
  [(UIView *)self->_containerView bounds];
  objc_msgSend(v5, "setFrame:", 0.0, 0.0, v7);

  v8.receiver = self;
  v8.super_class = (Class)PKAmountKeypadViewController;
  [(PKAmountKeypadViewController *)&v8 viewDidLayoutSubviews];
}

- (void)setUpNavigationBar
{
  id v11 = [(PKAmountKeypadViewController *)self navigationItem];
  [v11 setBackButtonDisplayMode:2];
  if (self->_showCancelButton)
  {
    v3 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:1 target:self action:sel__cancelButtonPressed];
    uint64_t v4 = +[PKPeerPaymentTheme secondaryTextColor];
    [v3 setTintColor:v4];

    [v11 setLeftBarButtonItem:v3];
  }
  else
  {
    [v11 setLeftBarButtonItem:0];
  }
  nextButton = self->_nextButton;
  if (self->_sendFlowType == 2)
  {
    if (nextButton) {
      goto LABEL_10;
    }
    id v6 = objc_alloc(MEMORY[0x1E4FB14A8]);
    double v7 = PKLocalizedPaymentString(&cfstr_Next.isa);
    objc_super v8 = (UIBarButtonItem *)[v6 initWithTitle:v7 style:0 target:self action:sel__nextButtonPressed];
    uint64_t v9 = self->_nextButton;
    self->_nextButton = v8;

    uint64_t v10 = self->_nextButton;
  }
  else
  {
    if (!nextButton) {
      goto LABEL_10;
    }
    self->_nextButton = 0;

    uint64_t v10 = 0;
  }
  [v11 setRightBarButtonItem:v10];
LABEL_10:
  [v11 setTitleView:self->_avatarView];
}

- (void)_configureAvatarView
{
  uint64_t v3 = [(CNComposeRecipient *)self->_recipient contact];
  id v5 = (id)v3;
  if (v3)
  {
    [(PKAvatarView *)self->_avatarView setContact:v3];
  }
  else
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1BA40]);
    [v4 setContactType:0];
    [(PKAvatarView *)self->_avatarView setContact:v4];
  }
}

- (void)_cancelButtonPressed
{
  v16[6] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)MEMORY[0x1E4F843E0];
  uint64_t v4 = *MEMORY[0x1E4F87000];
  uint64_t v5 = *MEMORY[0x1E4F869F0];
  uint64_t v6 = *MEMORY[0x1E4F86730];
  v15[0] = *MEMORY[0x1E4F864C8];
  v15[1] = v6;
  uint64_t v7 = *MEMORY[0x1E4F86990];
  v16[0] = v5;
  v16[1] = v7;
  uint64_t v8 = *MEMORY[0x1E4F86380];
  uint64_t v9 = *MEMORY[0x1E4F86120];
  v15[2] = *MEMORY[0x1E4F86308];
  v15[3] = v9;
  uint64_t v10 = *MEMORY[0x1E4F86148];
  v16[2] = v8;
  v16[3] = v10;
  uint64_t v11 = *MEMORY[0x1E4F86A10];
  v15[4] = *MEMORY[0x1E4F86A60];
  v15[5] = v11;
  uint64_t v12 = *MEMORY[0x1E4F86A28];
  v16[4] = *MEMORY[0x1E4F86A70];
  v16[5] = v12;
  id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:6];
  [v3 subject:v4 sendEvent:v13];

  v14 = [(PKAmountKeypadViewController *)self presentingViewController];
  [v14 dismissViewControllerAnimated:1 completion:0];
}

- (void)_nextButtonPressed
{
  void v15[6] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)MEMORY[0x1E4F843E0];
  uint64_t v4 = *MEMORY[0x1E4F87000];
  uint64_t v5 = *MEMORY[0x1E4F869F0];
  uint64_t v6 = *MEMORY[0x1E4F86730];
  v14[0] = *MEMORY[0x1E4F864C8];
  v14[1] = v6;
  uint64_t v7 = *MEMORY[0x1E4F86990];
  v15[0] = v5;
  v15[1] = v7;
  uint64_t v8 = *MEMORY[0x1E4F86380];
  uint64_t v9 = *MEMORY[0x1E4F86120];
  v14[2] = *MEMORY[0x1E4F86308];
  v14[3] = v9;
  uint64_t v10 = *MEMORY[0x1E4F86670];
  v15[2] = v8;
  v15[3] = v10;
  uint64_t v11 = *MEMORY[0x1E4F86A10];
  v14[4] = *MEMORY[0x1E4F86A60];
  v14[5] = v11;
  uint64_t v12 = *MEMORY[0x1E4F86A28];
  v15[4] = *MEMORY[0x1E4F86A70];
  v15[5] = v12;
  id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:6];
  [v3 subject:v4 sendEvent:v13];

  [(PKAmountKeypadViewController *)self _presentRecurringDetailViewController];
}

- (id)_composeRecipientForAddress:(id)a3
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1B980]);
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = [(PKAvatarView *)self->_avatarView descriptorForRequiredKeys];
    uint64_t v8 = (void *)v7;
    if (v7)
    {
      v27[0] = v7;
      uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:1];
      [v6 addObjectsFromArray:v9];
    }
    uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F845E8]) initWithContactStore:v5 keysToFetch:v6];
    uint64_t v11 = [v10 contactForHandle:v4];
    uint64_t v12 = [MEMORY[0x1E4F84D50] sharedService];
    id v13 = [v12 context];
    v14 = [v13 configuration];
    v15 = [v14 contactFormatConfiguration];

    v16 = (void *)[objc_alloc(MEMORY[0x1E4F845D8]) initWithConfiguration:v15];
    if ([v16 emailAddressIsValid:v4])
    {
      uint64_t v17 = 0;
    }
    else
    {
      [MEMORY[0x1E4F1BA70] phoneNumberWithStringValue:v4];
      v26 = v12;
      v19 = v11;
      v20 = v10;
      v21 = v8;
      uint64_t v22 = v6;
      v24 = id v23 = v5;
      if ([v16 phoneNumberIsValid:v24 forCountryCode:0]) {
        uint64_t v17 = 1;
      }
      else {
        uint64_t v17 = 5;
      }

      id v5 = v23;
      uint64_t v6 = v22;
      uint64_t v8 = v21;
      uint64_t v10 = v20;
      uint64_t v11 = v19;
      uint64_t v12 = v26;
    }
    v18 = (void *)[objc_alloc(MEMORY[0x1E4F5A138]) initWithContact:v11 address:v4 kind:v17];
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (void)_presentRecurringDetailViewController
{
  uint64_t v3 = [(PKAmountKeypadViewController *)self _peerPaymentController];
  id v4 = [v3 account];
  id v24 = 0;
  uint64_t v25 = 0;
  BOOL v5 = +[PKPeerPaymentActionController canPerformPeerPaymentAction:3 account:v4 unableReason:&v25 displayableError:&v24];
  id v6 = v24;
  if (v5)
  {
    if (!self->_recurringPayment)
    {
      uint64_t v7 = (PKPeerPaymentRecurringPayment *)objc_alloc_init(MEMORY[0x1E4F84DD8]);
      recurringPayment = self->_recurringPayment;
      self->_recurringPayment = v7;

      [(PKPeerPaymentRecurringPayment *)self->_recurringPayment setType:1];
      uint64_t v9 = self->_recurringPayment;
      uint64_t v10 = [(CNComposeRecipient *)self->_recipient address];
      [(PKPeerPaymentRecurringPayment *)v9 setRecipientAddress:v10];

      [(PKPeerPaymentRecurringPayment *)self->_recurringPayment setFrequency:1];
      uint64_t v11 = self->_recurringPayment;
      uint64_t v12 = [MEMORY[0x1E4F1C9C8] date];
      [(PKPeerPaymentRecurringPayment *)v11 setStartDate:v12];

      [(PKPeerPaymentRecurringPayment *)self->_recurringPayment setSentByMe:1];
    }
    id v13 = [(PKPeerPaymentMessagesContentAmountEntryViewController *)self->_amountEntryViewController amount];
    v14 = self->_recurringPayment;
    v15 = [v13 currency];
    [(PKPeerPaymentRecurringPayment *)v14 setCurrency:v15];

    v16 = self->_recurringPayment;
    uint64_t v17 = [v13 amount];
    [(PKPeerPaymentRecurringPayment *)v16 setAmount:v17];

    v18 = [v4 recurringPaymentsFeatureDescriptor];
    v19 = [[PKPeerPaymentRecurringPaymentDetailViewController alloc] initWithRecurringPayment:self->_recurringPayment recipient:self->_recipient mode:1 context:0 peerPaymentController:v3 remoteMessagesComposer:self->_remoteMessagesComposer];
    [(PKPeerPaymentRecurringPaymentDetailViewController *)v19 setDelegate:self];
    v20 = [v18 minimumAmount];
    [(PKPeerPaymentRecurringPaymentDetailViewController *)v19 setMinimumAmount:v20];

    v21 = [v18 maximumAmount];
    [(PKPeerPaymentRecurringPaymentDetailViewController *)v19 setMaximumAmount:v21];

    [(PKPeerPaymentRecurringPaymentDetailViewController *)v19 setOverrideUserInterfaceStyle:2];
    uint64_t v22 = [(PKAmountKeypadViewController *)self navigationController];
    [v22 pushViewController:v19 animated:1];
  }
  else
  {
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __69__PKAmountKeypadViewController__presentRecurringDetailViewController__block_invoke;
    v23[3] = &unk_1E59CA7D0;
    v23[4] = self;
    id v13 = +[PKPeerPaymentActionController alertControllerForPeerPaymentActionUnableReason:v25 displayableError:v6 addCardActionHandler:v23];
    [(PKAmountKeypadViewController *)self presentViewController:v13 animated:1 completion:0];
  }
}

uint64_t __69__PKAmountKeypadViewController__presentRecurringDetailViewController__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _openPaymentSetupWithNetworkWhitelist:0 paymentSetupMode:0];
}

- (id)_peerPaymentController
{
  return [(PKPeerPaymentRemoteMessagesComposer *)self->_remoteMessagesComposer peerPaymentController];
}

- (void)_openPaymentSetupWithNetworkWhitelist:(id)a3 paymentSetupMode:(int64_t)a4
{
  id v6 = a3;
  objc_initWeak(&location, self);
  id v7 = objc_alloc(MEMORY[0x1E4F84BB8]);
  uint64_t v8 = [MEMORY[0x1E4F84D50] sharedService];
  uint64_t v9 = (void *)[v7 initWithWebService:v8];

  [v9 setAllowedPaymentNetworks:v6];
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CAD0]);
  [v9 setAllowedFeatureIdentifiers:v10];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __87__PKAmountKeypadViewController__openPaymentSetupWithNetworkWhitelist_paymentSetupMode___block_invoke;
  v12[3] = &unk_1E59CAEF8;
  objc_copyWeak(v14, &location);
  id v11 = v9;
  id v13 = v11;
  v14[1] = (id)a4;
  [v11 preflightWithCompletion:v12];

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
}

void __87__PKAmountKeypadViewController__openPaymentSetupWithNetworkWhitelist_paymentSetupMode___block_invoke(id *a1, char a2, void *a3)
{
  id v5 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __87__PKAmountKeypadViewController__openPaymentSetupWithNetworkWhitelist_paymentSetupMode___block_invoke_2;
  block[3] = &unk_1E59CAED0;
  objc_copyWeak(v11, a1 + 5);
  char v12 = a2;
  id v6 = a1[4];
  v11[1] = a1[6];
  id v9 = v6;
  id v10 = v5;
  id v7 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(v11);
}

void __87__PKAmountKeypadViewController__openPaymentSetupWithNetworkWhitelist_paymentSetupMode___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    if (*(unsigned char *)(a1 + 64))
    {
      id v4 = [WeakRetained _paymentSetupNavigationControllerForProvisioningController:*(void *)(a1 + 32)];
      [v4 setPaymentSetupMode:*(void *)(a1 + 56)];
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __87__PKAmountKeypadViewController__openPaymentSetupWithNetworkWhitelist_paymentSetupMode___block_invoke_3;
      v9[3] = &unk_1E59CAEA8;
      v9[4] = v3;
      id v10 = v4;
      id v5 = v4;
      [v5 preflightWithCompletion:v9];
    }
    else
    {
      id v6 = *(void **)(a1 + 40);
      if (v6)
      {
        id v7 = v6;
      }
      else
      {
        PKDisplayableErrorForCommonType();
        id v7 = (id)objc_claimAutoreleasedReturnValue();
      }
      id v5 = v7;
      uint64_t v8 = +[PKPaymentSetupNavigationController viewControllerForPresentingPaymentError:v7];
      [v3 presentViewController:v8 animated:1 completion:0];
    }
  }
}

uint64_t __87__PKAmountKeypadViewController__openPaymentSetupWithNetworkWhitelist_paymentSetupMode___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) presentViewController:*(void *)(a1 + 40) animated:1 completion:0];
}

- (id)_paymentSetupNavigationControllerForProvisioningController:(id)a3
{
  id v4 = a3;
  id v5 = [[PKPaymentSetupNavigationController alloc] initWithProvisioningController:v4 context:0];

  [(PKNavigationController *)v5 setCustomFormSheetPresentationStyleForiPad];
  [(PKPaymentSetupNavigationController *)v5 setSetupDelegate:self];
  [(PKPaymentSetupNavigationController *)v5 setShowsWelcomeViewController:0];

  return v5;
}

- (void)paymentSetupDidFinish:(id)a3
{
  id v3 = [(PKAmountKeypadViewController *)self presentedViewController];
  [v3 dismissViewControllerAnimated:1 completion:0];
}

- (void)handleAction:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  if (a3 == 1) {
    goto LABEL_6;
  }
  if (a3 != 7)
  {
    if (a3 == 2) {
      a3 = 0;
    }
    else {
      a3 = 3;
    }
LABEL_6:
    objc_initWeak(&location, self);
    [(PKPeerPaymentRemoteMessagesComposer *)self->_remoteMessagesComposer setActionType:a3];
    remoteMessagesComposer = self->_remoteMessagesComposer;
    uint64_t v8 = [(PKPeerPaymentMessagesContentAmountEntryViewController *)self->_amountEntryViewController amount];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __56__PKAmountKeypadViewController_handleAction_completion___block_invoke;
    v9[3] = &unk_1E59CB0D8;
    objc_copyWeak(&v11, &location);
    id v10 = v6;
    [(PKPeerPaymentRemoteMessagesComposer *)remoteMessagesComposer presentRemoteMessageComposerWithAmount:v8 requestToken:0 memo:0 sessionID:0 overViewController:self completion:v9];

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
    goto LABEL_7;
  }
  [(PKAmountKeypadViewController *)self _presentRecurringDetailViewController];
  if (v6) {
    (*((void (**)(id, uint64_t))v6 + 2))(v6, 1);
  }
LABEL_7:
}

void __56__PKAmountKeypadViewController_handleAction_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  id v6 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = [WeakRetained presentingViewController];
    [v4 dismissViewControllerAnimated:1 completion:0];

    id v3 = v6;
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5)
  {
    (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v5, 1);
    id v3 = v6;
  }
}

- (id)minimumTransferAmount
{
  v2 = [(PKAmountKeypadViewController *)self _peerPaymentController];
  id v3 = [v2 account];
  id v4 = [v3 sendToUserFeatureDescriptor];
  uint64_t v5 = [v4 minimumAmount];

  return v5;
}

- (id)maximumTransferAmount
{
  v2 = [(PKAmountKeypadViewController *)self _peerPaymentController];
  id v3 = [v2 account];
  id v4 = [v3 sendToUserFeatureDescriptor];
  uint64_t v5 = [v4 maximumAmount];

  return v5;
}

- (id)currentBalance
{
  v2 = [(PKAmountKeypadViewController *)self _peerPaymentController];
  id v3 = [v2 account];
  id v4 = [v3 currentBalance];

  return v4;
}

- (double)percentExpanded
{
  return 1.0;
}

- (void)recurringPaymentDetailViewControllerDidDisappearWithRecurringPayment:(id)a3
{
}

- ($85E40A55691FE2F31975A98F57E3065D)pkui_navigationStatusBarStyleDescriptor
{
  BOOL v2 = 1;
  int64_t v3 = 1;
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- (BOOL)showCancelButton
{
  return self->_showCancelButton;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nextButton, 0);
  objc_storeStrong((id *)&self->_avatarView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_recurringPayment, 0);
  objc_storeStrong((id *)&self->_familyCollection, 0);
  objc_storeStrong((id *)&self->_amountEntryViewController, 0);
  objc_storeStrong((id *)&self->_remoteMessagesComposer, 0);

  objc_storeStrong((id *)&self->_recipient, 0);
}

@end