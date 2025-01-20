@interface PKAccountOtherCardNumbersViewController
- (BOOL)_isVirtualCardSupportedButNotEnabled;
- (PKAccountOtherCardNumbersViewController)initWithPaymentPass:(id)a3 account:(id)a4 context:(int64_t)a5 preferDefaultTitle:(BOOL)a6;
- (PKAccountOtherCardNumbersViewController)initWithPhysicalCard:(id)a3 paymentPass:(id)a4 account:(id)a5 context:(int64_t)a6 preferDefaultTitle:(BOOL)a7;
- (id)_analyticsPageTag;
- (id)_contentConfigurationForExpiredCardMessage;
- (id)_groupedFooterWithText:(id)a3 tableView:(id)a4;
- (id)_localizedStringForKey:(id)a3;
- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (void)_appendApplePayCardNumberSectionToConfiguration:(id)a3;
- (void)_appendNetworkSectionToConfiguration:(id)a3;
- (void)_appendPhysicalCardExpiredMessageSectionToConfiguration:(id)a3;
- (void)_appendPhysicalCardNumberSectionToConfiguration:(id)a3;
- (void)_appendPinSectionToConfiguration:(id)a3;
- (void)_appendSetUpVirtualCardSectionToConfiguration:(id)a3;
- (void)_beginReportingIfNecessary;
- (void)_endReportingIfNecessary;
- (void)_presentReplaceExpiredPhysicalCard;
- (void)_updateCardNumbersConfigurationAnimated:(BOOL)a3;
- (void)dealloc;
- (void)physicalCardsChanged:(id)a3 forAccountIdentifier:(id)a4;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
- (void)virtualCardEnrollmentViewController:(id)a3 didCompleteWithSuccess:(BOOL)a4;
@end

@implementation PKAccountOtherCardNumbersViewController

- (PKAccountOtherCardNumbersViewController)initWithPhysicalCard:(id)a3 paymentPass:(id)a4 account:(id)a5 context:(int64_t)a6 preferDefaultTitle:(BOOL)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  v24.receiver = self;
  v24.super_class = (Class)PKAccountOtherCardNumbersViewController;
  v16 = -[PKAccountOtherCardNumbersViewController initWithStyle:](&v24, sel_initWithStyle_, objc_msgSend(MEMORY[0x1E4FB1D00], "pkui_groupedStyleWithRoundedCorners:", 1));
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_physicalCard, a3);
    objc_storeStrong((id *)&v17->_paymentPass, a4);
    objc_storeStrong((id *)&v17->_account, a5);
    v17->_context = a6;
    v17->_preferDefaultTitle = a7;
    uint64_t v18 = [MEMORY[0x1E4F84270] sharedInstance];
    accountService = v17->_accountService;
    v17->_accountService = (PKAccountService *)v18;

    [(PKAccountService *)v17->_accountService registerObserver:v17];
    if ([(PKAccount *)v17->_account feature] == 2)
    {
      id v20 = objc_alloc(MEMORY[0x1E4F1C9A8]);
      v21 = (void *)[v20 initWithCalendarIdentifier:*MEMORY[0x1E4F1C318]];
      v22 = [(PKAccount *)v17->_account productTimeZone];
      [v21 setTimeZone:v22];

      v17->_isPhysicalCardExpired = [(PKPhysicalCard *)v17->_physicalCard isExpiredInCalendar:v21];
    }
    else
    {
      v17->_isPhysicalCardExpired = 0;
    }
  }

  return v17;
}

- (PKAccountOtherCardNumbersViewController)initWithPaymentPass:(id)a3 account:(id)a4 context:(int64_t)a5 preferDefaultTitle:(BOOL)a6
{
  id v11 = a3;
  id v12 = a4;
  v18.receiver = self;
  v18.super_class = (Class)PKAccountOtherCardNumbersViewController;
  id v13 = -[PKAccountOtherCardNumbersViewController initWithStyle:](&v18, sel_initWithStyle_, objc_msgSend(MEMORY[0x1E4FB1D00], "pkui_groupedStyleWithRoundedCorners:", 1));
  id v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_paymentPass, a3);
    objc_storeStrong((id *)&v14->_account, a4);
    v14->_context = a5;
    v14->_preferDefaultTitle = a6;
    v14->_isPhysicalCardExpired = 0;
    uint64_t v15 = [MEMORY[0x1E4F84270] sharedInstance];
    accountService = v14->_accountService;
    v14->_accountService = (PKAccountService *)v15;

    [(PKAccountService *)v14->_accountService registerObserver:v14];
  }

  return v14;
}

- (void)dealloc
{
  [(PKAccountService *)self->_accountService unregisterObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)PKAccountOtherCardNumbersViewController;
  [(PKAccountOtherCardNumbersViewController *)&v3 dealloc];
}

- (void)viewDidLoad
{
  v21[2] = *MEMORY[0x1E4F143B8];
  v19.receiver = self;
  v19.super_class = (Class)PKAccountOtherCardNumbersViewController;
  [(PKSettingsTableViewController *)&v19 viewDidLoad];
  [(PKAccountOtherCardNumbersViewController *)self _updateCardNumbersConfigurationAnimated:1];
  objc_super v3 = [(PKAccountOtherCardNumbersViewController *)self navigationItem];
  v4 = PKLocalizedCardNumbersString(&cfstr_CardNumbersTit.isa);
  [v3 setTitle:v4];

  if (!self->_preferDefaultTitle)
  {
    v5 = [MEMORY[0x1E4F84D50] sharedService];
    if (PKVirtualCardEnabledWithWebService() && ![(PKAccount *)self->_account feature])
    {
      int v16 = [(PKPaymentPass *)self->_paymentPass hasActiveVirtualCard];

      if (v16)
      {
        v17 = [(PKAccountOtherCardNumbersViewController *)self navigationItem];
        objc_super v18 = PKLocalizedCardNumbersString(&cfstr_CardNumbersOth.isa);
        [v17 setTitle:v18];
      }
    }
    else
    {
    }
    if ([(PKAccount *)self->_account feature] == 2)
    {
      v6 = [(PKAccountOtherCardNumbersViewController *)self navigationItem];
      v7 = PKLocalizedCardNumbersString(&cfstr_CardNumbersOth.isa);
      [v6 setTitle:v7];
    }
  }
  v8 = [(PKAccountOtherCardNumbersViewController *)self tableView];
  [v8 registerClass:objc_opt_class() forHeaderFooterViewReuseIdentifier:@"footer"];

  if ([(PKAccountOtherCardNumbersViewController *)self _isVirtualCardSupportedButNotEnabled])
  {
    [(PKAccountOtherCardNumbersViewController *)self _beginReportingIfNecessary];
    v9 = (void *)MEMORY[0x1E4F843E0];
    uint64_t v10 = *MEMORY[0x1E4F87038];
    uint64_t v11 = *MEMORY[0x1E4F86308];
    v21[0] = *MEMORY[0x1E4F864A0];
    uint64_t v12 = *MEMORY[0x1E4F86730];
    v20[0] = v11;
    v20[1] = v12;
    id v13 = [(PKAccountOtherCardNumbersViewController *)self _analyticsPageTag];
    v21[1] = v13;
    id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:2];
    [v9 subject:v10 sendEvent:v14];
  }
  uint64_t v15 = [(PKAccountOtherCardNumbersViewController *)self view];
  [v15 setAccessibilityIdentifier:*MEMORY[0x1E4F851F0]];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKAccountOtherCardNumbersViewController;
  [(PKAccountOtherCardNumbersViewController *)&v4 viewWillDisappear:a3];
  if ([(PKAccountOtherCardNumbersViewController *)self _isVirtualCardSupportedButNotEnabled])
  {
    [(PKAccountOtherCardNumbersViewController *)self _endReportingIfNecessary];
  }
}

- (BOOL)_isVirtualCardSupportedButNotEnabled
{
  objc_super v3 = [MEMORY[0x1E4F84D50] sharedService];
  if (PKVirtualCardEnabledWithWebService()
    && [(PKPaymentPass *)self->_paymentPass supportsVirtualCardNumber])
  {
    int v4 = [(PKPaymentPass *)self->_paymentPass hasActiveVirtualCard] ^ 1;
  }
  else
  {
    LOBYTE(v4) = 0;
  }

  return v4;
}

- (id)_analyticsPageTag
{
  if (self->_context == 3) {
    v2 = (id *)MEMORY[0x1E4F86FC0];
  }
  else {
    v2 = (id *)MEMORY[0x1E4F86158];
  }
  return *v2;
}

- (void)_beginReportingIfNecessary
{
  uint64_t v3 = *MEMORY[0x1E4F87038];
  int v4 = [MEMORY[0x1E4F843E0] reporterForSubject:*MEMORY[0x1E4F87038]];

  if (!v4)
  {
    self->_didBeginPassManagementSubject = 1;
    v5 = (void *)MEMORY[0x1E4F843E0];
    [v5 beginSubjectReporting:v3];
  }
}

- (void)_endReportingIfNecessary
{
  if (self->_didBeginPassManagementSubject) {
    [MEMORY[0x1E4F843E0] endSubjectReporting:*MEMORY[0x1E4F87038]];
  }
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  id v6 = a3;
  if ([(PKSettingsTableViewController *)self indexOfSectionWithIdentifier:@"physicalCardNumber"] == a4)
  {
    v7 = @"ACCOUNT_SERVICE_CARD_NUMBERS_OTHER_NUMBERS_TITANIUM_SECONDARY";
LABEL_5:
    uint64_t v8 = [(PKAccountOtherCardNumbersViewController *)self _localizedStringForKey:v7];
LABEL_6:
    v9 = (void *)v8;
    uint64_t v10 = [(PKAccountOtherCardNumbersViewController *)self _groupedFooterWithText:v8 tableView:v6];

    goto LABEL_7;
  }
  if ([(PKSettingsTableViewController *)self indexOfSectionWithIdentifier:@"applePayCardNumber"] == a4)
  {
    v7 = @"ACCOUNT_SERVICE_CARD_NUMBERS_OTHER_NUMBERS_APPLE_PAY_SECONDARY";
    goto LABEL_5;
  }
  if ([(PKSettingsTableViewController *)self indexOfSectionWithIdentifier:@"PIN"] == a4)
  {
    uint64_t v8 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentPin.isa);
    goto LABEL_6;
  }
  if ([(PKSettingsTableViewController *)self indexOfSectionWithIdentifier:@"setUpVirtualCard"] == a4)
  {
    if ([(PKPaymentPass *)self->_paymentPass associatedAccountFeatureIdentifier] == 1) {
      PKLocalizedCashVPANString(&cfstr_CardNumbersOth_0.isa);
    }
    else {
    uint64_t v8 = PKLocalizedVirtualCardString(&cfstr_CardNumbersOth_1.isa);
    }
    goto LABEL_6;
  }
  uint64_t v10 = 0;
LABEL_7:

  return v10;
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  return 0;
}

- (void)_updateCardNumbersConfigurationAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  int v16 = objc_alloc_init(PKSettingsTableViewConfiguration);
  v5 = [MEMORY[0x1E4F84D50] sharedService];
  if (PKVirtualCardEnabledWithWebService())
  {
    char v6 = [(PKPaymentPass *)self->_paymentPass hasActiveVirtualCard];

    if ((v6 & 1) == 0
      && [(PKPaymentPass *)self->_paymentPass supportsVirtualCardNumber])
    {
      [(PKAccountOtherCardNumbersViewController *)self _appendSetUpVirtualCardSectionToConfiguration:v16];
    }
  }
  else
  {
  }
  if (![(PKAccount *)self->_account feature])
  {
    v7 = [MEMORY[0x1E4F84D50] sharedService];
    if (PKVirtualCardEnabledWithWebService())
    {
      char v8 = [(PKPaymentPass *)self->_paymentPass hasActiveVirtualCard];

      if ((v8 & 1) == 0) {
        [(PKAccountOtherCardNumbersViewController *)self _appendNetworkSectionToConfiguration:v16];
      }
    }
    else
    {
    }
  }
  if (self->_physicalCard
    || ![(PKAccount *)self->_account feature]
    && ([(PKPaymentPass *)self->_paymentPass primaryAccountNumberSuffix],
        id v14 = objc_claimAutoreleasedReturnValue(),
        uint64_t v15 = [v14 length],
        v14,
        v15))
  {
    if (self->_isPhysicalCardExpired)
    {
      if ([(PKAccount *)self->_account supportsRequestPhysicalCard])
      {
        if ([(PKAccount *)self->_account state] == 1)
        {
          v9 = [(PKAccount *)self->_account accountIdentifier];
          uint64_t v10 = [(PKPhysicalCard *)self->_physicalCard identifier];
          char HasDismissedPhysicalCardExpiredCardNumbersMessage = PKAppleCardHasDismissedPhysicalCardExpiredCardNumbersMessage();

          if ((HasDismissedPhysicalCardExpiredCardNumbersMessage & 1) == 0) {
            [(PKAccountOtherCardNumbersViewController *)self _appendPhysicalCardExpiredMessageSectionToConfiguration:v16];
          }
        }
      }
    }
    [(PKAccountOtherCardNumbersViewController *)self _appendPhysicalCardNumberSectionToConfiguration:v16];
  }
  if (self->_paymentPass)
  {
    [(PKAccountOtherCardNumbersViewController *)self _appendApplePayCardNumberSectionToConfiguration:v16];
    paymentPass = self->_paymentPass;
  }
  else
  {
    paymentPass = 0;
  }
  if ([(PKPaymentPass *)paymentPass hasAssociatedPeerPaymentAccount]) {
    [(PKAccountOtherCardNumbersViewController *)self _appendPinSectionToConfiguration:v16];
  }
  id v13 = v16;
  if (v16)
  {
    [(PKSettingsTableViewController *)self applyConfiguration:v16 animated:v3];
    id v13 = v16;
  }
}

- (void)_appendNetworkSectionToConfiguration:(id)a3
{
  id v4 = a3;
  uint64_t v12 = [[PKTableViewDiffableDataSourceSection alloc] initWithIdentifier:@"network"];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  char v6 = [(PKPaymentPass *)self->_paymentPass devicePrimaryPaymentApplication];
  [v6 paymentNetworkIdentifier];
  v7 = PKDisplayablePaymentNetworkNameForPaymentCredentialType();

  char v8 = [PKKeyValueTableViewSettingsRow alloc];
  v9 = PKLocalizedCardNumbersString(&cfstr_CardNumbersVir_4.isa);
  uint64_t v10 = [(PKKeyValueTableViewSettingsRow *)v8 initWithIdentifier:@"network" title:v9 value:v7];

  [v5 addObject:v10];
  uint64_t v11 = (void *)[v5 copy];
  [v4 appendSection:v12 rows:v11];
}

- (void)_appendSetUpVirtualCardSectionToConfiguration:(id)a3
{
  id v4 = a3;
  id v5 = [[PKTableViewDiffableDataSourceSection alloc] initWithIdentifier:@"setUpVirtualCard"];
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v7 = [PKButtonTableViewSettingsRow alloc];
  char v8 = PKLocalizedVirtualCardString(&cfstr_CardNumbersOth_2.isa);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __89__PKAccountOtherCardNumbersViewController__appendSetUpVirtualCardSectionToConfiguration___block_invoke;
  v11[3] = &unk_1E59D2CC8;
  v11[4] = self;
  v9 = [(PKButtonTableViewSettingsRow *)v7 initWithIdentifier:@"setUpVirtualCard" title:v8 tapHandler:v11];

  [(PKButtonTableViewSettingsRow *)v9 setEnabled:1];
  [v6 addObject:v9];
  uint64_t v10 = (void *)[v6 copy];
  [v4 appendSection:v5 rows:v10];
}

void __89__PKAccountOtherCardNumbersViewController__appendSetUpVirtualCardSectionToConfiguration___block_invoke(uint64_t a1)
{
  v12[3] = *MEMORY[0x1E4F143B8];
  v2 = -[PKVirtualCardEnrollmentViewController initWithPaymentPass:context:delegate:]([PKVirtualCardEnrollmentViewController alloc], "initWithPaymentPass:context:delegate:", *(void *)(*(void *)(a1 + 32) + 1048), *(void *)(*(void *)(a1 + 32) + 1064));
  BOOL v3 = (void *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v2];
  [v3 setModalPresentationStyle:2];
  [*(id *)(a1 + 32) presentViewController:v3 animated:1 completion:0];
  id v4 = (void *)MEMORY[0x1E4F843E0];
  uint64_t v5 = *MEMORY[0x1E4F87038];
  uint64_t v6 = *MEMORY[0x1E4F86308];
  v12[0] = *MEMORY[0x1E4F86380];
  uint64_t v7 = *MEMORY[0x1E4F86730];
  v11[0] = v6;
  v11[1] = v7;
  char v8 = [*(id *)(a1 + 32) _analyticsPageTag];
  v11[2] = *MEMORY[0x1E4F86120];
  uint64_t v9 = *MEMORY[0x1E4F86C10];
  v12[1] = v8;
  v12[2] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:3];
  [v4 subject:v5 sendEvent:v10];
}

- (void)_appendPhysicalCardExpiredMessageSectionToConfiguration:(id)a3
{
  v21[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [[PKTableViewDiffableDataSourceSection alloc] initWithIdentifier:@"physicalCardExpiredMessage"];
  uint64_t v6 = [PKMessageTableViewSettingsRow alloc];
  uint64_t v7 = [(PKAccountOtherCardNumbersViewController *)self _contentConfigurationForExpiredCardMessage];
  char v8 = [(PKMessageTableViewSettingsRow *)v6 initWithIdentifier:@"physicalCardExpiredMessage" contentConfiguration:v7];

  objc_initWeak(&location, self);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __99__PKAccountOtherCardNumbersViewController__appendPhysicalCardExpiredMessageSectionToConfiguration___block_invoke;
  v18[3] = &unk_1E59CA7F8;
  objc_copyWeak(&v19, &location);
  [(PKMessageTableViewSettingsRow *)v8 setActionOnDismiss:v18];
  uint64_t v9 = [PKButtonTableViewSettingsRow alloc];
  uint64_t v10 = PKLocalizedFeatureString();
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  uint64_t v15 = __99__PKAccountOtherCardNumbersViewController__appendPhysicalCardExpiredMessageSectionToConfiguration___block_invoke_2;
  int v16 = &unk_1E59D2CF0;
  objc_copyWeak(&v17, &location);
  uint64_t v11 = [(PKButtonTableViewSettingsRow *)v9 initWithIdentifier:@"physicalCardExpiredMessageAction" title:v10 tapHandler:&v13];

  -[PKButtonTableViewSettingsRow setStyle:](v11, "setStyle:", 2, v13, v14, v15, v16);
  [(PKButtonTableViewSettingsRow *)v11 setEnabled:1];
  v21[0] = v8;
  v21[1] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:2];
  [v4 appendSection:v5 rows:v12];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

void __99__PKAccountOtherCardNumbersViewController__appendPhysicalCardExpiredMessageSectionToConfiguration___block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    v2 = [WeakRetained[132] accountIdentifier];
    BOOL v3 = [v4[130] identifier];
    PKAppleCardSetHasDismissedPhysicalCardExpiredCardNumbersMessage();

    [v4 _updateCardNumbersConfigurationAnimated:1];
    WeakRetained = v4;
  }
}

void __99__PKAccountOtherCardNumbersViewController__appendPhysicalCardExpiredMessageSectionToConfiguration___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _presentReplaceExpiredPhysicalCard];
    id WeakRetained = v2;
  }
}

- (id)_contentConfigurationForExpiredCardMessage
{
  id v2 = [MEMORY[0x1E4FB1948] subtitleCellConfiguration];
  BOOL v3 = PKLocalizedFeatureString();
  [v2 setText:v3];

  id v4 = [v2 textProperties];
  uint64_t v5 = PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB28C8], (NSString *)*MEMORY[0x1E4FB27F0], *MEMORY[0x1E4FB09B8]);
  [v4 setFont:v5];

  uint64_t v6 = PKLocalizedFeatureString();
  [v2 setSecondaryText:v6];

  uint64_t v7 = [v2 secondaryTextProperties];
  char v8 = PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB2950], 0);
  [v7 setFont:v8];

  uint64_t v9 = [v2 secondaryTextProperties];
  uint64_t v10 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  [v9 setColor:v10];

  [v2 setTextToSecondaryTextVerticalPadding:5.0];
  uint64_t v11 = PKPassKitUIBundle();
  uint64_t v12 = [v11 URLForResource:@"MessageAlert" withExtension:@"pdf"];
  double v13 = PKUIScreenScale();
  uint64_t v14 = PKUIImageFromPDF(v12, 42.0, 42.0, v13);

  [v2 setImage:v14];
  uint64_t v15 = [v2 imageProperties];
  int v16 = [MEMORY[0x1E4FB1830] configurationWithPointSize:42.0];
  [v15 setPreferredSymbolConfiguration:v16];

  [v2 setImageToTextPadding:12.0];
  id v17 = [v2 imageProperties];
  objc_msgSend(v17, "setReservedLayoutSize:", 42.0, 42.0);

  objc_msgSend(v2, "setDirectionalLayoutMargins:", 12.0, 20.0, 12.0, 20.0);

  return v2;
}

- (void)_presentReplaceExpiredPhysicalCard
{
  objc_initWeak(&location, self);
  accountService = self->_accountService;
  id v4 = [(PKAccount *)self->_account accountIdentifier];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __77__PKAccountOtherCardNumbersViewController__presentReplaceExpiredPhysicalCard__block_invoke;
  v5[3] = &unk_1E59CBE48;
  objc_copyWeak(&v6, &location);
  [(PKAccountService *)accountService accountUsersForAccountWithIdentifier:v4 completion:v5];

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __77__PKAccountOtherCardNumbersViewController__presentReplaceExpiredPhysicalCard__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v6 = (void *)[objc_alloc(MEMORY[0x1E4F842C8]) initWithAccountUsers:v3];
    uint64_t v7 = [v6 currentAccountUser];
    char v8 = (void *)*((void *)WeakRetained + 135);
    uint64_t v9 = [*((id *)WeakRetained + 132) accountIdentifier];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __77__PKAccountOtherCardNumbersViewController__presentReplaceExpiredPhysicalCard__block_invoke_2;
    void v11[3] = &unk_1E59D2D40;
    objc_copyWeak(&v13, v4);
    id v10 = v7;
    id v12 = v10;
    [v8 physicalCardsForAccountWithIdentifier:v9 completion:v11];

    objc_destroyWeak(&v13);
  }
}

void __77__PKAccountOtherCardNumbersViewController__presentReplaceExpiredPhysicalCard__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = [PKPhysicalCardController alloc];
    uint64_t v4 = WeakRetained[135];
    uint64_t v5 = WeakRetained[131];
    uint64_t v6 = WeakRetained[132];
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CAD0]);
    uint64_t v9 = [(PKPhysicalCardController *)v3 initWithAccountService:v4 paymentPass:v5 account:v6 accountUser:v7 physicalCards:v8];

    uint64_t v10 = WeakRetained[133];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __77__PKAccountOtherCardNumbersViewController__presentReplaceExpiredPhysicalCard__block_invoke_3;
    void v11[3] = &unk_1E59D2D18;
    void v11[4] = WeakRetained;
    [(PKPhysicalCardController *)v9 replaceFlowViewControllerForReason:1 content:v10 currentPhysicalCard:0 completion:v11];
  }
}

void __77__PKAccountOtherCardNumbersViewController__presentReplaceExpiredPhysicalCard__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  if (v7)
  {
    uint64_t v6 = [[PKNavigationController alloc] initWithRootViewController:v7];
    [(PKNavigationController *)v6 setModalPresentationStyle:2];
  }
  else
  {
    if (!v5) {
      goto LABEL_6;
    }
    uint64_t v6 = (PKNavigationController *)PKAlertForDisplayableErrorWithHandlers(v5, 0, 0, 0);
  }
  [*(id *)(a1 + 32) presentViewController:v6 animated:1 completion:0];

LABEL_6:
}

- (void)_appendPhysicalCardNumberSectionToConfiguration:(id)a3
{
  id v4 = a3;
  v22 = [[PKTableViewDiffableDataSourceSection alloc] initWithIdentifier:@"physicalCardNumber"];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([(PKAccount *)self->_account feature] == 2)
  {
    uint64_t v6 = NSString;
    id v7 = PKPANMask();
    id v8 = PKPANMask();
    uint64_t v9 = [(PKPhysicalCard *)self->_physicalCard FPANSuffix];
    uint64_t v10 = PKMaskedPaymentPAN();
    uint64_t v11 = [v6 stringWithFormat:@"%@ %@ %@", v7, v8, v10];
    id v12 = PKLTRString();
  }
  else
  {
    id v7 = [(PKPaymentPass *)self->_paymentPass primaryAccountNumberSuffix];
    id v12 = PKMaskedPaymentPAN();
  }

  id v13 = [PKKeyValueTableViewSettingsRow alloc];
  uint64_t v14 = [(PKAccountOtherCardNumbersViewController *)self _localizedStringForKey:@"ACCOUNT_SERVICE_CARD_NUMBERS_OTHER_NUMBERS_TITANIUM_TITLE"];
  uint64_t v15 = [(PKKeyValueTableViewSettingsRow *)v13 initWithIdentifier:@"physicalCardNumber" title:v14 value:v12];

  [(PKKeyValueTableViewSettingsRow *)v15 setSensitive:1];
  [v5 addObject:v15];
  int v16 = [(PKPhysicalCard *)self->_physicalCard formattedExpiration];
  if (v16)
  {
    id v17 = [PKKeyValueTableViewSettingsRow alloc];
    objc_super v18 = [(PKAccountOtherCardNumbersViewController *)self _localizedStringForKey:@"ACCOUNT_SERVICE_CARD_NUMBERS_OTHER_NUMBERS_TITANIUM_EXPIRATION_TITLE"];
    id v19 = [(PKKeyValueTableViewSettingsRow *)v17 initWithIdentifier:@"physicalCardExpiration" title:v18 value:v16];

    if (self->_isPhysicalCardExpired)
    {
      id v20 = [MEMORY[0x1E4FB1618] systemRedColor];
      [(PKKeyValueTableViewSettingsRow *)v19 setSecondaryTextColor:v20];
    }
    [v5 addObject:v19];
  }
  else
  {
    id v19 = v15;
  }
  v21 = (void *)[v5 copy];
  [v4 appendSection:v22 rows:v21];
}

- (void)_appendApplePayCardNumberSectionToConfiguration:(id)a3
{
  id v4 = a3;
  id v5 = [[PKTableViewDiffableDataSourceSection alloc] initWithIdentifier:@"applePayCardNumber"];
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v7 = [(PKPaymentPass *)self->_paymentPass devicePaymentApplications];
  id v8 = [v7 allObjects];

  uint64_t v9 = [(PKPaymentPass *)self->_paymentPass sortedPaymentApplications:v8 ascending:1];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __91__PKAccountOtherCardNumbersViewController__appendApplePayCardNumberSectionToConfiguration___block_invoke;
  v13[3] = &unk_1E59D2D68;
  v13[4] = self;
  id v14 = v9;
  id v15 = v6;
  id v10 = v6;
  id v11 = v9;
  [v11 enumerateObjectsUsingBlock:v13];
  id v12 = (void *)[v10 copy];
  [v4 appendSection:v5 rows:v12];
}

void __91__PKAccountOtherCardNumbersViewController__appendApplePayCardNumberSectionToConfiguration___block_invoke(id *a1, void *a2)
{
  id v17 = a2;
  id v3 = PKSanitizedDeviceAccountNumberForPaymentApplication();
  if ([*((id *)a1[4] + 132) feature] == 2)
  {
    id v4 = NSString;
    id v5 = PKPANMask();
    id v6 = PKPANMask();
    id v7 = [v4 stringWithFormat:@"%@ %@ %@", v5, v6, v3];
    PKLTRString();
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v8 = v3;
  }
  uint64_t v9 = NSString;
  id v10 = [v17 applicationIdentifier];
  id v11 = [v9 stringWithFormat:@"%@-%@", @"applePayCardNumber", v10];

  id v12 = [a1[4] _localizedStringForKey:@"ACCOUNT_SERVICE_CARD_NUMBERS_OTHER_NUMBERS_APPLE_PAY_TITLE"];
  if ((unint64_t)[a1[5] count] >= 2)
  {
    id v13 = [v17 displayName];
    id v14 = v13;
    if (v13)
    {
      id v15 = v13;

      id v12 = v15;
    }
  }
  int v16 = [[PKKeyValueTableViewSettingsRow alloc] initWithIdentifier:v11 title:v12 value:v8];
  [(PKKeyValueTableViewSettingsRow *)v16 setSensitive:1];
  [a1[6] addObject:v16];
}

- (void)_appendPinSectionToConfiguration:(id)a3
{
  id v4 = a3;
  id v14 = [[PKTableViewDiffableDataSourceSection alloc] initWithIdentifier:@"PIN"];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v6 = [(PKPaymentPass *)self->_paymentPass localizedValueForFieldKey:*MEMORY[0x1E4F87528]];
  id v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    PKLocalizedPeerPaymentString(&cfstr_PeerPaymentPin_0.isa);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v9 = v8;

  id v10 = [PKKeyValueTableViewSettingsRow alloc];
  id v11 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentPin_1.isa);
  id v12 = [(PKKeyValueTableViewSettingsRow *)v10 initWithIdentifier:@"PIN" title:v11 value:v9];

  [v5 addObject:v12];
  id v13 = (void *)[v5 copy];
  [v4 appendSection:v14 rows:v13];
}

- (id)_groupedFooterWithText:(id)a3 tableView:(id)a4
{
  id v5 = a3;
  id v6 = [a4 dequeueReusableHeaderFooterViewWithIdentifier:@"footer"];
  id v7 = [MEMORY[0x1E4FB1948] groupedFooterConfiguration];
  [v7 setText:v5];

  [v7 directionalLayoutMargins];
  objc_msgSend(v7, "setDirectionalLayoutMargins:");
  [v6 setContentConfiguration:v7];

  return v6;
}

- (id)_localizedStringForKey:(id)a3
{
  account = self->_account;
  id v5 = (NSString *)a3;
  if ([(PKAccount *)account feature])
  {
    [(PKAccount *)self->_account feature];
    id v6 = PKLocalizedFeatureString();
  }
  else
  {
    -[NSString substringFromIndex:](v5, "substringFromIndex:", [@"ACCOUNT_SERVICE_" length]);
    id v7 = (NSString *)objc_claimAutoreleasedReturnValue();

    id v6 = PKLocalizedCardNumbersString(v7);
    id v5 = v7;
  }

  return v6;
}

- (void)virtualCardEnrollmentViewController:(id)a3 didCompleteWithSuccess:(BOOL)a4
{
  BOOL v4 = a4;
  [(PKAccountOtherCardNumbersViewController *)self dismissViewControllerAnimated:1 completion:0];
  if (v4)
  {
    id v7 = [(PKAccountOtherCardNumbersViewController *)self navigationController];
    id v6 = (id)[v7 popViewControllerAnimated:0];
  }
}

- (void)physicalCardsChanged:(id)a3 forAccountIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __85__PKAccountOtherCardNumbersViewController_physicalCardsChanged_forAccountIdentifier___block_invoke;
  v10[3] = &unk_1E59CB378;
  objc_copyWeak(&v13, &location);
  id v11 = v7;
  id v12 = v6;
  id v8 = v6;
  id v9 = v7;
  dispatch_async(MEMORY[0x1E4F14428], v10);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __85__PKAccountOtherCardNumbersViewController_physicalCardsChanged_forAccountIdentifier___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v2 = (void *)WeakRetained[132];
  if (v2)
  {
    id v3 = *(void **)(a1 + 32);
    BOOL v4 = [v2 accountIdentifier];
    id v5 = v3;
    id v6 = v4;
    id v7 = v6;
    if (v5 == v6)
    {
    }
    else
    {
      if (!v5 || !v6)
      {

LABEL_12:
        goto LABEL_13;
      }
      char v8 = [v5 isEqualToString:v6];

      if ((v8 & 1) == 0) {
        goto LABEL_12;
      }
    }
    int v9 = *((unsigned __int8 *)WeakRetained + 1074);

    if (v9 && objc_msgSend(*(id *)(a1 + 40), "pk_hasObjectPassingTest:", &__block_literal_global_78))
    {
      *((unsigned char *)WeakRetained + 1074) = 0;
      id v10 = (void *)WeakRetained[130];
      WeakRetained[130] = 0;

      [WeakRetained _updateCardNumbersConfigurationAnimated:1];
    }
  }
LABEL_13:
}

uint64_t __85__PKAccountOtherCardNumbersViewController_physicalCardsChanged_forAccountIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 state] == 1)
  {
    id v3 = [v2 accountUserAltDSID];
    BOOL v4 = PKCurrentUserAltDSID();
    id v5 = v3;
    id v6 = v4;
    id v7 = v6;
    if (v5 == v6)
    {
      uint64_t v8 = 1;
    }
    else
    {
      uint64_t v8 = 0;
      if (v5 && v6) {
        uint64_t v8 = [v5 isEqualToString:v6];
      }
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountService, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_paymentPass, 0);

  objc_storeStrong((id *)&self->_physicalCard, 0);
}

@end