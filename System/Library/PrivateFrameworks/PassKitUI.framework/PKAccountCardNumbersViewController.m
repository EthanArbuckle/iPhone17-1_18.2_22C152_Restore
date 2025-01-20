@interface PKAccountCardNumbersViewController
+ (id)_virtualCardSections;
- (BOOL)_virtualCardCredentialDetailsRowIsEnabled:(unint64_t)a3;
- (BOOL)canBecomeFirstResponder;
- (BOOL)canReplaceCard;
- (BOOL)pkui_disablesAutomaticDismissalUponEnteringBackground;
- (BOOL)redactSensitiveDetails;
- (BOOL)shouldMapSection:(unint64_t)a3;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (PKAccountCardNumbersViewController)initWithPass:(id)a3 accountService:(id)a4 account:(id)a5 cardCredentials:(id)a6 virtualCard:(id)a7 physicalCard:(id)a8 context:(int64_t)a9;
- (PKAccountCardNumbersViewController)initWithPass:(id)a3 accountService:(id)a4 account:(id)a5 physicalCard:(id)a6 context:(int64_t)a7;
- (PKAccountCardNumbersViewController)initWithPass:(id)a3 localAuthenticationContext:(id)a4 virtualCard:(id)a5 context:(int64_t)a6;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (id)_buttonCellForRowIndex:(int64_t)a3 text:(id)a4 cellStyle:(int64_t)a5 forTableView:(id)a6;
- (id)_cardCredentialsCellForRowIndex:(int64_t)a3 tableView:(id)a4;
- (id)_credentialsCellWithPrimaryText:(id)a3 detailText:(id)a4 detailImage:(id)a5 forSection:(unint64_t)a6 forTableView:(id)a7;
- (id)_credentialsCellWithPrimaryText:(id)a3 detailText:(id)a4 detailImage:(id)a5 forTableView:(id)a6;
- (id)_credentialsCellWithPrimaryText:(id)a3 detailText:(id)a4 forTableView:(id)a5;
- (id)_dynamicSecurityCodeCellForRowIndex:(int64_t)a3 tableView:(id)a4;
- (id)_genericDisplayableError:(id)a3;
- (id)_hyperlinkViewWithLinkText:(id)a3 footerText:(id)a4 urlString:(id)a5;
- (id)_loadingCellForRowIndex:(int64_t)a3 tableView:(id)a4;
- (id)_localizedStringForKey:(id)a3;
- (id)_otherNumbersCellForRowIndex:(int64_t)a3 tableView:(id)a4;
- (id)_replaceCardAlertFromIndexPath:(id)a3;
- (id)_reuseIdentifierForSection:(unint64_t)a3;
- (id)_tableHeaderView;
- (id)_virtualCardStateFooter;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4;
- (int64_t)_numberOfVirtualCardCredentialDetailsRowsEnabled;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (unint64_t)_virtualCardCredentialDetailsRowForRowIndex:(int64_t)a3;
- (void)_beginReportingIfNecessary;
- (void)_copyCardDetails;
- (void)_endReportingIfNecessary;
- (void)_handleReplacementError:(id)a3;
- (void)_replaceVirtualCard;
- (void)_retrieveCardCredentials;
- (void)_retryCardCredentials;
- (void)_sendAnalyticsButtonTapped:(id)a3;
- (void)_sendAnalyticsEvent:(id)a3;
- (void)_setupNotifications;
- (void)_toggleDynamicSecurityCodeSetting;
- (void)_willHideUIMenuController:(id)a3;
- (void)applicationDidBecomeActive:(id)a3;
- (void)applicationDidEnterBackground:(id)a3;
- (void)applicationWillDeactivate:(id)a3;
- (void)applicationWillResignActive:(id)a3;
- (void)paymentAuthorizationViewController:(id)a3 didAuthorizePayment:(id)a4 handler:(id)a5;
- (void)paymentAuthorizationViewControllerDidFinish:(id)a3;
- (void)setRedactSensitiveDetails:(BOOL)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)willMoveToParentViewController:(id)a3;
@end

@implementation PKAccountCardNumbersViewController

- (PKAccountCardNumbersViewController)initWithPass:(id)a3 accountService:(id)a4 account:(id)a5 cardCredentials:(id)a6 virtualCard:(id)a7 physicalCard:(id)a8 context:(int64_t)a9
{
  id v16 = a3;
  id v17 = a4;
  id v27 = a5;
  id v28 = a6;
  id v29 = a7;
  id v26 = a8;
  v30.receiver = self;
  v30.super_class = (Class)PKAccountCardNumbersViewController;
  v18 = -[PKSectionTableViewController initWithStyle:numberOfSections:](&v30, sel_initWithStyle_numberOfSections_, objc_msgSend(MEMORY[0x1E4FB1D00], "pkui_groupedStyleDefaultRoundedCornerBehavior"), 4);
  v19 = v18;
  if (v18)
  {
    p_cardCredentials = &v18->_cardCredentials;
    objc_storeStrong((id *)&v18->_cardCredentials, a6);
    objc_storeStrong((id *)&v19->_virtualCard, a7);
    objc_storeStrong((id *)&v19->_accountService, a4);
    objc_storeStrong((id *)&v19->_account, a5);
    objc_storeStrong((id *)&v19->_pass, a3);
    v19->_accountFeatureIdentifier = [(PKAccount *)v19->_account feature];
    v19->_context = a9;
    objc_storeStrong((id *)&v19->_physicalCard, a8);
    v19->_redactSensitiveDetails = 0;
    if (v19->_virtualCard && [v29 state] == 1 && *p_cardCredentials)
    {
      v21 = (void *)[v29 copy];
      v22 = PKLocalizedFeatureString();
      [v21 setDisplayName:v22];

      [v21 setKeychainCardCredentials:v28];
      [(PKAccountService *)v19->_accountService writeVirtualCardToKeychain:v21 completion:0];
    }
    [(PKAccountCardNumbersViewController *)v19 _setupNotifications];
    id v17 = v24;
    id v16 = v25;
  }

  return v19;
}

- (PKAccountCardNumbersViewController)initWithPass:(id)a3 accountService:(id)a4 account:(id)a5 physicalCard:(id)a6 context:(int64_t)a7
{
  return [(PKAccountCardNumbersViewController *)self initWithPass:a3 accountService:a4 account:a5 cardCredentials:0 virtualCard:0 physicalCard:a6 context:a7];
}

- (PKAccountCardNumbersViewController)initWithPass:(id)a3 localAuthenticationContext:(id)a4 virtualCard:(id)a5 context:(int64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v19.receiver = self;
  v19.super_class = (Class)PKAccountCardNumbersViewController;
  v14 = -[PKSectionTableViewController initWithStyle:numberOfSections:](&v19, sel_initWithStyle_numberOfSections_, objc_msgSend(MEMORY[0x1E4FB1D00], "pkui_groupedStyleDefaultRoundedCornerBehavior"), 4);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_pass, a3);
    objc_storeStrong((id *)&v15->_virtualCard, a5);
    v15->_context = a6;
    v15->_accountFeatureIdentifier = [v11 associatedAccountFeatureIdentifier];
    v15->_redactSensitiveDetails = 0;
    id v16 = (PKPaymentService *)objc_alloc_init(MEMORY[0x1E4F84C38]);
    paymentService = v15->_paymentService;
    v15->_paymentService = v16;

    objc_storeStrong((id *)&v15->_localAuthenticationContext, a4);
    [(PKAccountCardNumbersViewController *)v15 _setupNotifications];
    [(PKAccountCardNumbersViewController *)v15 _retrieveCardCredentials];
  }

  return v15;
}

- (void)_setupNotifications
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel_applicationWillResignActive_ name:*MEMORY[0x1E4FB2738] object:0];
  [v3 addObserver:self selector:sel_applicationDidBecomeActive_ name:*MEMORY[0x1E4FB2628] object:0];
  [v3 addObserver:self selector:sel_applicationDidEnterBackground_ name:*MEMORY[0x1E4FB2640] object:0];
  [v3 addObserver:self selector:sel_applicationWillDeactivate_ name:*MEMORY[0x1E4FB31A0] object:0];
  [v3 addObserver:self selector:sel__willHideUIMenuController_ name:*MEMORY[0x1E4FB2CB8] object:0];
}

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)PKAccountCardNumbersViewController;
  [(PKSectionTableViewController *)&v8 viewDidLoad];
  id v3 = [(PKAccountCardNumbersViewController *)self tableView];
  [v3 setAllowsSelection:1];
  [v3 setRowHeight:*MEMORY[0x1E4FB2F28]];
  v4 = [(PKAccountCardNumbersViewController *)self _tableHeaderView];
  [v3 setTableHeaderView:v4];

  v5 = [(PKAccountCardNumbersViewController *)self navigationItem];
  v6 = PKLocalizedCardNumbersString(&cfstr_CardNumbersTit.isa);
  [v5 setTitle:v6];

  v7 = [(PKAccountCardNumbersViewController *)self view];
  [v7 setAccessibilityIdentifier:*MEMORY[0x1E4F85368]];
}

- (void)viewWillAppear:(BOOL)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v5.receiver = self;
  v5.super_class = (Class)PKAccountCardNumbersViewController;
  [(PKAccountCardNumbersViewController *)&v5 viewWillAppear:a3];
  if ([(PKVirtualCard *)self->_virtualCard type] == 2) {
    [(PKAccountCardNumbersViewController *)self _beginReportingIfNecessary];
  }
  uint64_t v6 = *MEMORY[0x1E4F86308];
  v7[0] = *MEMORY[0x1E4F864A0];
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  [(PKAccountCardNumbersViewController *)self _sendAnalyticsEvent:v4];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v5.receiver = self;
  v5.super_class = (Class)PKAccountCardNumbersViewController;
  [(PKAccountCardNumbersViewController *)&v5 viewWillDisappear:a3];
  uint64_t v6 = *MEMORY[0x1E4F86308];
  v7[0] = *MEMORY[0x1E4F864A8];
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  [(PKAccountCardNumbersViewController *)self _sendAnalyticsEvent:v4];

  if ([(PKVirtualCard *)self->_virtualCard type] == 2) {
    [(PKAccountCardNumbersViewController *)self _endReportingIfNecessary];
  }
}

- (void)_beginReportingIfNecessary
{
  uint64_t v3 = *MEMORY[0x1E4F87038];
  v4 = [MEMORY[0x1E4F843E0] reporterForSubject:*MEMORY[0x1E4F87038]];

  if (!v4)
  {
    self->_didBeginPassManagementSubject = 1;
    objc_super v5 = (void *)MEMORY[0x1E4F843E0];
    [v5 beginSubjectReporting:v3];
  }
}

- (void)_endReportingIfNecessary
{
  if (self->_didBeginPassManagementSubject)
  {
    self->_didBeginPassManagementSubject = 0;
    [MEMORY[0x1E4F843E0] endSubjectReporting:*MEMORY[0x1E4F87038]];
  }
}

- (void)viewWillLayoutSubviews
{
  v10.receiver = self;
  v10.super_class = (Class)PKAccountCardNumbersViewController;
  [(PKAccountCardNumbersViewController *)&v10 viewWillLayoutSubviews];
  uint64_t v3 = [(PKAccountCardNumbersViewController *)self tableView];
  v4 = [v3 tableHeaderView];
  if (v4)
  {
    [v3 bounds];
    double v6 = v5;
    [v4 frame];
    double v8 = v7;
    objc_msgSend(v4, "sizeThatFits:", v6, 1.79769313e308);
    if (v8 != v9)
    {
      [v3 _rectForTableHeaderView];
      objc_msgSend(v4, "setFrame:");
      [v3 setTableHeaderView:0];
      [v3 setTableHeaderView:v4];
    }
  }
}

- (void)willMoveToParentViewController:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKAccountCardNumbersViewController;
  -[PKAccountCardNumbersViewController willMoveToParentViewController:](&v5, sel_willMoveToParentViewController_);
  if (!a3) {
    [(PKAccountCardNumbersViewController *)self _sendAnalyticsButtonTapped:*MEMORY[0x1E4F860D0]];
  }
}

- (BOOL)pkui_disablesAutomaticDismissalUponEnteringBackground
{
  return 1;
}

- (BOOL)shouldMapSection:(unint64_t)a3
{
  switch(a3)
  {
    case 0uLL:
      if (self->_loadingCredentials) {
        return 1;
      }
      v4 = [MEMORY[0x1E4F84D50] sharedService];
      BOOL v5 = PKVirtualCardEnabledWithWebService()
        && [(PKVirtualCard *)self->_virtualCard type] == 2
        && self->_cardCredentials == 0;
      goto LABEL_22;
    case 1uLL:
      double v6 = [MEMORY[0x1E4F84D50] sharedService];
      if (!PKVirtualCardEnabledWithWebService())
      {

        goto LABEL_17;
      }
      uint64_t v7 = [(PKVirtualCard *)self->_virtualCard type];

      if (v7 != 2)
      {
LABEL_17:
        account = self->_account;
        return [(PKAccount *)account supportsShowVirtualCard];
      }
      return self->_cardCredentials || self->_loadingCredentials;
    case 2uLL:
      double v8 = self->_account;
      return [(PKAccount *)v8 supportsDynamicSecurityCodes];
    case 3uLL:
      v4 = [(PKPaymentPass *)self->_pass devicePaymentApplications];
      if ([v4 count]) {
        BOOL v5 = 1;
      }
      else {
        BOOL v5 = self->_physicalCard != 0;
      }
LABEL_22:

      return v5;
    default:
      return 0;
  }
}

- (void)applicationDidBecomeActive:(id)a3
{
}

- (void)applicationWillResignActive:(id)a3
{
}

- (void)applicationDidEnterBackground:(id)a3
{
}

- (void)applicationWillDeactivate:(id)a3
{
}

- (void)setRedactSensitiveDetails:(BOOL)a3
{
  if (self->_redactSensitiveDetails != a3)
  {
    self->_redactSensitiveDetails = a3;
    id v3 = [(PKAccountCardNumbersViewController *)self tableView];
    [v3 reloadData];
  }
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  switch([(PKSectionTableViewController *)self sectionForIndex:a4])
  {
    case 0uLL:
    case 2uLL:
    case 3uLL:
      int64_t result = 1;
      break;
    case 1uLL:
      if (!self->_virtualCard) {
        goto LABEL_7;
      }
      int64_t result = [(PKAccountCardNumbersViewController *)self _numberOfVirtualCardCredentialDetailsRowsEnabled];
      break;
    default:
LABEL_7:
      int64_t result = 0;
      break;
  }
  return result;
}

- (int64_t)_numberOfVirtualCardCredentialDetailsRowsEnabled
{
  uint64_t v3 = 0;
  int64_t v4 = 0;
  do
    v4 += [(PKAccountCardNumbersViewController *)self _virtualCardCredentialDetailsRowIsEnabled:v3++];
  while (v3 != 6);
  return v4;
}

- (BOOL)_virtualCardCredentialDetailsRowIsEnabled:(unint64_t)a3
{
  switch(a3)
  {
    case 0uLL:
      BOOL v5 = [MEMORY[0x1E4F84D50] sharedService];
      if (!PKVirtualCardEnabledWithWebService())
      {

        goto LABEL_19;
      }
      uint64_t v6 = [(PKVirtualCard *)self->_virtualCard type];

      if (v6 != 2) {
        goto LABEL_19;
      }
      virtualCard = self->_virtualCard;
      if (!virtualCard) {
        goto LABEL_21;
      }
      double v8 = [(PKVirtualCard *)virtualCard cardholderName];
      if (v8) {
        BOOL v4 = !self->_loadingCredentials;
      }
      else {
        BOOL v4 = 0;
      }

      return v4;
    case 1uLL:
    case 3uLL:
      if (!self->_cardCredentials && !self->_loadingReplacementCard) {
        goto LABEL_21;
      }
      return !self->_loadingCredentials;
    case 2uLL:
LABEL_19:
      objc_super v10 = self->_virtualCard;
      if (!v10 || self->_loadingCredentials) {
        goto LABEL_21;
      }
      id v12 = [(PKVirtualCard *)v10 expiration];
      if (v12)
      {
        BOOL v4 = 1;
      }
      else
      {
        id v13 = [(PKVirtualCardCredentials *)self->_cardCredentials expiration];
        BOOL v4 = v13 != 0;
      }
      goto LABEL_32;
    case 4uLL:
      if (self->_cardCredentials || self->_loadingReplacementCard || self->_loadingCredentials) {
        return 1;
      }
      id v12 = [MEMORY[0x1E4F84D50] sharedService];
      BOOL v4 = PKVirtualCardEnabledWithWebService()
        && [(PKPaymentPass *)self->_pass hasActiveVirtualCard]
        && self->_cardCredentials == 0;
LABEL_32:

      return v4;
    case 5uLL:
      double v9 = self->_virtualCard;
      if (!v9 || [(PKVirtualCard *)v9 state] == 3 || self->_loadingCredentials) {
        goto LABEL_21;
      }
      BOOL v4 = self->_cardCredentials != 0;
      break;
    default:
LABEL_21:
      BOOL v4 = 0;
      break;
  }
  return v4;
}

- (unint64_t)_virtualCardCredentialDetailsRowForRowIndex:(int64_t)a3
{
  unint64_t v5 = 0;
  uint64_t v6 = 0;
  do
  {
    if ([(PKAccountCardNumbersViewController *)self _virtualCardCredentialDetailsRowIsEnabled:v5])
    {
      if (v6 == a3) {
        return v5;
      }
      ++v6;
    }
    ++v5;
  }
  while (v5 != 6);
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  switch(-[PKSectionTableViewController sectionForIndex:](self, "sectionForIndex:", [v7 section]))
  {
    case 0uLL:
      uint64_t v8 = -[PKAccountCardNumbersViewController _loadingCellForRowIndex:tableView:](self, "_loadingCellForRowIndex:tableView:", [v7 row], v6);
      goto LABEL_7;
    case 1uLL:
      uint64_t v8 = -[PKAccountCardNumbersViewController _cardCredentialsCellForRowIndex:tableView:](self, "_cardCredentialsCellForRowIndex:tableView:", [v7 row], v6);
      goto LABEL_7;
    case 2uLL:
      uint64_t v8 = -[PKAccountCardNumbersViewController _dynamicSecurityCodeCellForRowIndex:tableView:](self, "_dynamicSecurityCodeCellForRowIndex:tableView:", [v7 row], v6);
      goto LABEL_7;
    case 3uLL:
      uint64_t v8 = -[PKAccountCardNumbersViewController _otherNumbersCellForRowIndex:tableView:](self, "_otherNumbersCellForRowIndex:tableView:", [v7 row], v6);
LABEL_7:
      double v9 = (void *)v8;
      break;
    default:
      double v9 = 0;
      break;
  }

  return v9;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  return *MEMORY[0x1E4FB2F28];
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  unint64_t v5 = [(PKSectionTableViewController *)self sectionForIndex:a4];
  if (v5 != 3)
  {
    if (v5 == 1)
    {
      id v6 = [MEMORY[0x1E4F84D50] sharedService];
      if (PKVirtualCardEnabledWithWebService())
      {
        char v7 = [(PKPaymentPass *)self->_pass hasActiveVirtualCard];

        if (v7) {
          goto LABEL_5;
        }
      }
      else
      {
      }
      if (self->_virtualCard) {
        [(PKAccountCardNumbersViewController *)self _virtualCardStateFooter];
      }
      else {
      uint64_t v8 = PKLocalizedFeatureString();
      }
      goto LABEL_12;
    }
LABEL_5:
    uint64_t v8 = 0;
    goto LABEL_12;
  }
  uint64_t v8 = [(PKAccountCardNumbersViewController *)self _localizedStringForKey:@"ACCOUNT_SERVICE_CARD_NUMBERS_OTHER_FOOTER"];
LABEL_12:

  return v8;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  unint64_t v5 = [(PKSectionTableViewController *)self sectionForIndex:a4];
  if (v5 == 1)
  {
    id v6 = [MEMORY[0x1E4F84D50] sharedService];
    if (!PKVirtualCardEnabledWithWebService())
    {
      uint64_t v8 = 0;
      goto LABEL_13;
    }
    int v9 = [(PKPaymentPass *)self->_pass hasActiveVirtualCard];

    if (v9)
    {
      id v6 = PKLocalizedVirtualCardString(&cfstr_CardNumbersDyn.isa);
      char v7 = PKLocalizedVirtualCardString(&cfstr_CardNumbersDyn_0.isa, &stru_1EF1B4C70.isa, v6);
      if (self->_accountFeatureIdentifier == 1) {
        objc_super v10 = (id *)MEMORY[0x1E4F870E8];
      }
      else {
        objc_super v10 = (id *)MEMORY[0x1E4F88078];
      }
      id v11 = *v10;
      uint64_t v8 = [(PKAccountCardNumbersViewController *)self _hyperlinkViewWithLinkText:v6 footerText:v7 urlString:v11];

      goto LABEL_10;
    }
LABEL_11:
    uint64_t v8 = 0;
    goto LABEL_14;
  }
  if (v5 != 2) {
    goto LABEL_11;
  }
  id v6 = PKLocalizedFeatureString();
  char v7 = PKLocalizedFeatureString();
  uint64_t v8 = [(PKAccountCardNumbersViewController *)self _hyperlinkViewWithLinkText:v6, v7, @"https://support.apple.com/ht212328?cid=mc-ols-applecard-article_h212328-wallet_ui-04242021", v6 footerText urlString];
LABEL_10:

LABEL_13:
LABEL_14:

  return v8;
}

- (id)_hyperlinkViewWithLinkText:(id)a3 footerText:(id)a4 urlString:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = objc_alloc_init(PKFooterHyperlinkView);
  id v12 = [MEMORY[0x1E4F1CB10] URLWithString:v10];
  id v13 = PKAttributedStringByAddingLinkToSubstring(v9, v8, v12);
  [(PKFooterHyperlinkView *)v11 setAttributedText:v13];

  objc_initWeak(&location, self);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __86__PKAccountCardNumbersViewController__hyperlinkViewWithLinkText_footerText_urlString___block_invoke;
  v15[3] = &unk_1E59DA350;
  objc_copyWeak(&v16, &location);
  [(PKFooterHyperlinkView *)v11 setAction:v15];
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

  return v11;
}

void __86__PKAccountCardNumbersViewController__hyperlinkViewWithLinkText_footerText_urlString___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  BOOL v4 = WeakRetained;
  if (WeakRetained)
  {
    WeakRetained[1193] = 1;
    unint64_t v5 = [WeakRetained tableView];
    [v5 reloadData];

    id v6 = [MEMORY[0x1E4FB1438] sharedApplication];
    [v6 openURL:v7 options:MEMORY[0x1E4F1CC08] completionHandler:&__block_literal_global_184];
  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 cellForRowAtIndexPath:v7];
  unint64_t v9 = -[PKSectionTableViewController sectionForIndex:](self, "sectionForIndex:", [v7 section]);
  if (v9 == 3)
  {
    if (![(PKAccountCardNumbersViewController *)self shouldMapSection:3]) {
      goto LABEL_16;
    }
    id v10 = [[PKAccountOtherCardNumbersViewController alloc] initWithPhysicalCard:self->_physicalCard paymentPass:self->_pass account:self->_account context:self->_context preferDefaultTitle:0];
    id v11 = [(PKAccountCardNumbersViewController *)self navigationController];
    [v11 pushViewController:v10 animated:1];

    id v12 = (void *)MEMORY[0x1E4F86050];
    goto LABEL_8;
  }
  if (v9 != 1)
  {
    if (!v9 && !self->_loadingCredentials) {
      [(PKAccountCardNumbersViewController *)self _retryCardCredentials];
    }
    goto LABEL_16;
  }
  unint64_t v13 = -[PKAccountCardNumbersViewController _virtualCardCredentialDetailsRowForRowIndex:](self, "_virtualCardCredentialDetailsRowForRowIndex:", [v7 row]);
  if (!v8) {
    goto LABEL_16;
  }
  if (v13 >= 5)
  {
    if (v13 != 5) {
      goto LABEL_16;
    }
    [v6 deselectRowAtIndexPath:v7 animated:1];
    if (![(PKAccountCardNumbersViewController *)self canReplaceCard]) {
      goto LABEL_16;
    }
    id v10 = [(PKAccountCardNumbersViewController *)self _replaceCardAlertFromIndexPath:v7];
    [(PKAccountCardNumbersViewController *)self presentViewController:v10 animated:1 completion:0];
    id v12 = (void *)MEMORY[0x1E4F86B90];
LABEL_8:
    [(PKAccountCardNumbersViewController *)self _sendAnalyticsButtonTapped:*v12];

    goto LABEL_16;
  }
  id v14 = objc_alloc(MEMORY[0x1E4FB1990]);
  v15 = PKLocalizedString(&cfstr_MenuActionCopy.isa);
  id v16 = (void *)[v14 initWithTitle:v15 action:sel__copyCardDetails];

  if (v16)
  {
    id v17 = [MEMORY[0x1E4FB1978] sharedMenuController];
    v19[0] = v16;
    v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
    [v17 setMenuItems:v18];

    [v8 frame];
    objc_msgSend(v17, "showMenuFromView:rect:", v6);
  }
LABEL_16:
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  id v5 = a4;
  unint64_t v6 = -[PKSectionTableViewController sectionForIndex:](self, "sectionForIndex:", [v5 section]);
  if (v6 == 3) {
    goto LABEL_7;
  }
  if (v6 == 1)
  {
    if (-[PKAccountCardNumbersViewController _virtualCardCredentialDetailsRowForRowIndex:](self, "_virtualCardCredentialDetailsRowForRowIndex:", [v5 row]) == 5)
    {
      BOOL v7 = [(PKAccountCardNumbersViewController *)self canReplaceCard];
      goto LABEL_9;
    }
LABEL_7:
    BOOL v7 = 1;
    goto LABEL_9;
  }
  if (v6) {
    BOOL v7 = 0;
  }
  else {
    BOOL v7 = !self->_loadingCredentials;
  }
LABEL_9:

  return v7;
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)_willHideUIMenuController:(id)a3
{
  id v4 = [(PKAccountCardNumbersViewController *)self tableView];
  uint64_t v3 = [v4 indexPathForSelectedRow];
  [v4 deselectRowAtIndexPath:v3 animated:1];
}

- (void)_copyCardDetails
{
  id v9 = [(PKAccountCardNumbersViewController *)self tableView];
  uint64_t v3 = [v9 indexPathForSelectedRow];
  id v4 = [v9 cellForRowAtIndexPath:v3];
  switch(-[PKAccountCardNumbersViewController _virtualCardCredentialDetailsRowForRowIndex:](self, "_virtualCardCredentialDetailsRowForRowIndex:", [v3 row]))
  {
    case 0uLL:
    case 3uLL:
    case 4uLL:
      id v5 = [v4 detailText];
      if (v5) {
        goto LABEL_3;
      }
      break;
    case 1uLL:
      BOOL v7 = [v4 detailText];
      uint64_t v8 = [v7 stringByReplacingOccurrencesOfString:@" " withString:&stru_1EF1B5B50];
      goto LABEL_9;
    case 2uLL:
      BOOL v7 = [v4 detailText];
      uint64_t v8 = PKShortExpiration();
LABEL_9:
      id v5 = (void *)v8;

      if (v5)
      {
LABEL_3:
        unint64_t v6 = [MEMORY[0x1E4FB1A78] generalPasteboard];
        [v6 setString:v5];
      }
      break;
    default:
      break;
  }
}

- (id)_loadingCellForRowIndex:(int64_t)a3 tableView:(id)a4
{
  id v5 = a4;
  if (self->_loadingCredentials) {
    unint64_t v6 = @"CARD_NUMBERS_VIRTUAL_LOADING";
  }
  else {
    unint64_t v6 = @"CARD_NUMBERS_VIRTUAL_UNAVAILABLE";
  }
  BOOL v7 = PKLocalizedCardNumbersString(&v6->isa);
  if (self->_loadingCredentials)
  {
    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v8 = PKLocalizedCardNumbersString(&cfstr_CardNumbersVir_7.isa);
  }
  id v9 = [(PKAccountCardNumbersViewController *)self _credentialsCellWithPrimaryText:v7 detailText:v8 detailImage:0 forSection:0 forTableView:v5];
  id v10 = [MEMORY[0x1E4FB1618] tertiaryLabelColor];
  [v9 setTitleTextColor:v10];

  id v11 = [MEMORY[0x1E4FB1618] systemBlueColor];
  [v9 setDetailTextColor:v11];

  [v9 setShowsActionSpinner:self->_loadingCredentials];

  return v9;
}

- (id)_cardCredentialsCellForRowIndex:(int64_t)a3 tableView:(id)a4
{
  id v6 = a4;
  switch([(PKAccountCardNumbersViewController *)self _virtualCardCredentialDetailsRowForRowIndex:a3])
  {
    case 0uLL:
      BOOL v7 = PKLocalizedCardNumbersString(&cfstr_CardNumbersVir_8.isa);
      uint64_t v8 = [(PKVirtualCard *)self->_virtualCard cardholderName];
      id v9 = [(PKAccountCardNumbersViewController *)self _credentialsCellWithPrimaryText:v7 detailText:v8 forTableView:v6];
      id v10 = v9;
      id v11 = (void *)MEMORY[0x1E4F85370];
      goto LABEL_31;
    case 1uLL:
      BOOL v7 = PKLocalizedCardNumbersString(&cfstr_CardNumbersVir_9.isa);
      if (!self->_redactSensitiveDetails)
      {
        v15 = [(PKVirtualCardCredentials *)self->_cardCredentials primaryAccountNumber];
LABEL_28:
        PKFormattedStringForPAN();
        uint64_t v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_29;
      }
      uint64_t v12 = [(PKVirtualCard *)self->_virtualCard FPANSuffix];
      if (v12)
      {
        unint64_t v13 = (void *)v12;
        uint64_t v14 = [(PKVirtualCard *)self->_virtualCard type];

        if (v14 != 2)
        {
          id v26 = NSString;
          id v27 = PKPANMask();
          id v28 = PKPANMask();
          id v29 = PKPANMask();
          objc_super v30 = [(PKVirtualCard *)self->_virtualCard FPANSuffix];
          v15 = [v26 stringWithFormat:@"%@%@%@%@", v27, v28, v29, v30];

          goto LABEL_28;
        }
      }
      uint64_t v8 = [(PKVirtualCardCredentials *)self->_cardCredentials primaryAccountNumber];

      if (!v8) {
        goto LABEL_30;
      }
      v15 = [(PKVirtualCardCredentials *)self->_cardCredentials primaryAccountNumber];
      id v16 = PKFPANSuffixFromFPAN();
      PKMaskedPaymentPAN();
      uint64_t v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_29:
LABEL_30:
      id v9 = [(PKAccountCardNumbersViewController *)self _credentialsCellWithPrimaryText:v7 detailText:v8 forTableView:v6];
      id v10 = v9;
      id v11 = (void *)MEMORY[0x1E4F85360];
LABEL_31:
      [v9 setAccessibilityIdentifier:*v11];
LABEL_32:

      return v10;
    case 2uLL:
      BOOL v7 = PKLocalizedCardNumbersString(&cfstr_CardNumbersVir_10.isa);
      uint64_t v8 = [(PKVirtualCard *)self->_virtualCard expiration];
      id v17 = [MEMORY[0x1E4F84D50] sharedService];
      if (!PKVirtualCardEnabledWithWebService()) {
        goto LABEL_12;
      }
      int v18 = [(PKPaymentPass *)self->_pass hasActiveVirtualCard];

      if (v18)
      {
        [(PKVirtualCardCredentials *)self->_cardCredentials formattedExpiration];
        id v17 = v8;
        uint64_t v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_12:
      }
      id v9 = [(PKAccountCardNumbersViewController *)self _credentialsCellWithPrimaryText:v7 detailText:v8 forTableView:v6];
      id v10 = v9;
      id v11 = (void *)MEMORY[0x1E4F85518];
      goto LABEL_31;
    case 3uLL:
      BOOL v7 = PKLocalizedCardNumbersString(&cfstr_CardNumbersVir_11.isa);
      if (self->_redactSensitiveDetails)
      {
        objc_super v19 = 0;
        uint64_t v8 = @"•••";
      }
      else
      {
        uint64_t v8 = [(PKVirtualCardCredentials *)self->_cardCredentials cardSecurityCode];
        if ([(PKVirtualCard *)self->_virtualCard hasDynamicSecurityCode])
        {
          v22 = (void *)MEMORY[0x1E4FB1830];
          v23 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
          v24 = [v22 configurationWithFont:v23];

          v25 = [MEMORY[0x1E4FB1818] systemImageNamed:@"clock.arrow.2.circlepath"];
          objc_super v19 = [v25 imageWithSymbolConfiguration:v24];
        }
        else
        {
          objc_super v19 = 0;
        }
      }
      id v10 = [(PKAccountCardNumbersViewController *)self _credentialsCellWithPrimaryText:v7 detailText:v8 detailImage:v19 forTableView:v6];
      [v10 setAccessibilityIdentifier:*MEMORY[0x1E4F85320]];

      goto LABEL_32;
    case 4uLL:
      BOOL v7 = PKLocalizedCardNumbersString(&cfstr_CardNumbersVir_4.isa);
      if (![(PKVirtualCardCredentials *)self->_cardCredentials cardType]) {
        [(PKVirtualCard *)self->_virtualCard credentialType];
      }
      PKDisplayablePaymentNetworkNameForPaymentCredentialType();
      uint64_t v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
      id v9 = [(PKAccountCardNumbersViewController *)self _credentialsCellWithPrimaryText:v7 detailText:v8 forTableView:v6];
      id v10 = v9;
      id v11 = (void *)MEMORY[0x1E4F85710];
      goto LABEL_31;
    case 5uLL:
      if (self->_loadingReplacementCard) {
        v20 = @"CARD_NUMBERS_VIRTUAL_REPLACING_TITLE";
      }
      else {
        v20 = @"CARD_NUMBERS_VIRTUAL_REPLACE_TITLE";
      }
      v21 = PKLocalizedCardNumbersString(&v20->isa);
      id v10 = [(PKAccountCardNumbersViewController *)self _buttonCellForRowIndex:a3 text:v21 cellStyle:0 forTableView:v6];
      [v10 setAccessibilityIdentifier:*MEMORY[0x1E4F85908]];

      goto LABEL_23;
    default:
      id v10 = 0;
LABEL_23:
      uint64_t v8 = 0;
      BOOL v7 = 0;
      goto LABEL_32;
  }
}

- (id)_dynamicSecurityCodeCellForRowIndex:(int64_t)a3 tableView:(id)a4
{
  id v5 = a4;
  id v6 = [(PKAccountCardNumbersViewController *)self _reuseIdentifierForSection:2];
  BOOL v7 = [v5 dequeueReusableCellWithIdentifier:v6];

  dynamicSecurityCodeCell = self->_dynamicSecurityCodeCell;
  self->_dynamicSecurityCodeCell = v7;

  id v9 = self->_dynamicSecurityCodeCell;
  if (!v9)
  {
    id v10 = PKLocalizedFeatureString();
    id v11 = [[PKSettingTableCell alloc] initWithTitle:v10 target:self action:sel__toggleDynamicSecurityCodeSetting];
    uint64_t v12 = self->_dynamicSecurityCodeCell;
    self->_dynamicSecurityCodeCell = v11;

    id v9 = self->_dynamicSecurityCodeCell;
  }
  [(PKSettingTableCell *)v9 setOn:[(PKVirtualCard *)self->_virtualCard hasDynamicSecurityCode]];
  [(PKSettingTableCell *)self->_dynamicSecurityCodeCell setAccessibilityIdentifier:*MEMORY[0x1E4F854B8]];
  unint64_t v13 = self->_dynamicSecurityCodeCell;

  return v13;
}

- (id)_otherNumbersCellForRowIndex:(int64_t)a3 tableView:(id)a4
{
  id v5 = a4;
  id v6 = PKLocalizedCardNumbersString(&cfstr_CardNumbersOth.isa);
  BOOL v7 = [(PKAccountCardNumbersViewController *)self _reuseIdentifierForSection:3];
  uint64_t v8 = [v5 dequeueReusableCellWithIdentifier:v7];

  if (!v8) {
    uint64_t v8 = [[PKStackedLabelCell alloc] initWithReuseIdentifier:v7];
  }
  [(PKStackedLabelCell *)v8 setTitleText:v6];
  [(PKStackedLabelCell *)v8 setAccessoryType:1];
  [(PKStackedLabelCell *)v8 setAccessibilityIdentifier:*MEMORY[0x1E4F851F0]];

  return v8;
}

- (id)_credentialsCellWithPrimaryText:(id)a3 detailText:(id)a4 forTableView:(id)a5
{
  return [(PKAccountCardNumbersViewController *)self _credentialsCellWithPrimaryText:a3 detailText:a4 detailImage:0 forTableView:a5];
}

- (id)_credentialsCellWithPrimaryText:(id)a3 detailText:(id)a4 detailImage:(id)a5 forTableView:(id)a6
{
  return [(PKAccountCardNumbersViewController *)self _credentialsCellWithPrimaryText:a3 detailText:a4 detailImage:a5 forSection:1 forTableView:a6];
}

- (id)_credentialsCellWithPrimaryText:(id)a3 detailText:(id)a4 detailImage:(id)a5 forSection:(unint64_t)a6 forTableView:(id)a7
{
  id v12 = a3;
  id v13 = a7;
  id v14 = a5;
  id v15 = a4;
  id v16 = [(PKAccountCardNumbersViewController *)self _reuseIdentifierForSection:a6];
  id v17 = [v13 dequeueReusableCellWithIdentifier:v16];

  if (!v17) {
    id v17 = [[PKStackedLabelCell alloc] initWithReuseIdentifier:v16];
  }
  [(PKStackedLabelCell *)v17 setTitleText:v12];
  [(PKStackedLabelCell *)v17 setDetailText:v15];

  [(PKStackedLabelCell *)v17 setDetailImage:v14];
  [(UIView *)v17 pkui_setExcludedFromScreenCapture:self->_redactSensitiveDetails andBroadcasting:1];
  [(PKStackedLabelCell *)v17 setAccessibilityIdentifier:*MEMORY[0x1E4F853E0]];

  return v17;
}

- (id)_buttonCellForRowIndex:(int64_t)a3 text:(id)a4 cellStyle:(int64_t)a5 forTableView:(id)a6
{
  id v9 = NSString;
  id v10 = a6;
  id v11 = a4;
  id v12 = [(PKAccountCardNumbersViewController *)self _reuseIdentifierForSection:1];
  id v13 = [v9 stringWithFormat:@"%@-%@", v12, @"Button"];

  id v14 = [v10 dequeueReusableCellWithIdentifier:v13];

  if (!v14)
  {
    id v14 = [[PKTableViewCell alloc] initWithStyle:a5 reuseIdentifier:v13];
    [(PKTableViewCell *)v14 setUserInteractionEnabled:1];
  }
  id v15 = [MEMORY[0x1E4FB1618] systemBlueColor];
  if (![(PKAccountCardNumbersViewController *)self canReplaceCard])
  {
    uint64_t v16 = [MEMORY[0x1E4FB1618] tertiaryLabelColor];

    id v15 = (void *)v16;
  }
  [(PKTableViewCell *)v14 setShowsActionSpinner:self->_loadingReplacementCard];
  id v17 = [(PKTableViewCell *)v14 textLabel];
  [v17 setTextColor:v15];
  [v17 setText:v11];

  [v17 setNumberOfLines:0];

  return v14;
}

- (BOOL)canReplaceCard
{
  if (self->_loadingCredentials || self->_hasReplacedCredentials) {
    return 0;
  }
  uint64_t v4 = [(PKVirtualCard *)self->_virtualCard type];
  virtualCard = self->_virtualCard;
  if (v4 != 2)
  {
    if ([(PKVirtualCard *)virtualCard type] != 1) {
      return 0;
    }
    virtualCard = self->_account;
  }
  return [(PKVirtualCard *)virtualCard state] == 1;
}

- (id)_tableHeaderView
{
  id v2 = objc_alloc_init(MEMORY[0x1E4FB1D30]);
  uint64_t v3 = [MEMORY[0x1E4FB1948] groupedHeaderConfiguration];
  uint64_t v4 = PKLocalizedCardNumbersString(&cfstr_CardNumbersVir_14.isa);
  [v3 setText:v4];

  id v5 = [v3 textProperties];
  [v5 setLineBreakMode:0];

  objc_msgSend(v3, "setDirectionalLayoutMargins:", 20.0, 16.0, 8.0, 0.0);
  [v2 setContentConfiguration:v3];

  return v2;
}

- (id)_reuseIdentifierForSection:(unint64_t)a3
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"Section-%zd", a3);
}

- (id)_virtualCardStateFooter
{
  if ([(PKAccount *)self->_account state] == 1)
  {
    switch([(PKVirtualCard *)self->_virtualCard state])
    {
      case 1:
        uint64_t v3 = PKLocalizedCardNumbersString(&cfstr_CardNumbersVir_15.isa);
        break;
      case 2:
      case 3:
      case 4:
        goto LABEL_4;
      default:
        uint64_t v3 = 0;
        break;
    }
  }
  else
  {
LABEL_4:
    uint64_t v3 = PKLocalizedFeatureString();
  }

  return v3;
}

- (id)_replaceCardAlertFromIndexPath:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x1E4FB1418];
  id v5 = PKLocalizedCardNumbersString(&cfstr_CardNumbersVir_16.isa);
  id v6 = PKLocalizedCardNumbersString(&cfstr_CardNumbersVir_17.isa);
  BOOL v7 = [v4 alertControllerWithTitle:v5 message:v6 preferredStyle:1];

  uint64_t v8 = (void *)MEMORY[0x1E4FB1410];
  id v9 = PKLocalizedCardNumbersString(&cfstr_CardNumbersVir_18.isa);
  id v10 = [v8 actionWithTitle:v9 style:1 handler:0];

  id v11 = (void *)MEMORY[0x1E4FB1410];
  id v12 = PKLocalizedCardNumbersString(&cfstr_CardNumbersVir_19.isa);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __69__PKAccountCardNumbersViewController__replaceCardAlertFromIndexPath___block_invoke;
  v15[3] = &unk_1E59CB1F0;
  void v15[4] = self;
  id v13 = [v11 actionWithTitle:v12 style:0 handler:v15];

  [v7 addAction:v10];
  [v7 addAction:v13];

  return v7;
}

void __69__PKAccountCardNumbersViewController__replaceCardAlertFromIndexPath___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 1152) = 1;
  id v2 = [MEMORY[0x1E4F84D50] sharedService];
  if (!PKVirtualCardEnabledWithWebService())
  {

    goto LABEL_7;
  }
  uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 1096) type];

  if (v3 != 2)
  {
LABEL_7:
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void **)(v5 + 1104);
    *(void *)(v5 + 1104) = 0;

    [*(id *)(a1 + 32) reloadData];
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(void **)(v7 + 1112);
    id v9 = [*(id *)(v7 + 1096) identifier];
    id v10 = [*(id *)(*(void *)(a1 + 32) + 1128) accountIdentifier];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __69__PKAccountCardNumbersViewController__replaceCardAlertFromIndexPath___block_invoke_2;
    v11[3] = &unk_1E59DBB20;
    v11[4] = *(void *)(a1 + 32);
    [v8 performVirtualCardAction:3 forVirtualCardIdentifier:v9 forAccountIdentifier:v10 completion:v11];

    return;
  }
  uint64_t v4 = *(void **)(a1 + 32);

  [v4 _replaceVirtualCard];
}

void __69__PKAccountCardNumbersViewController__replaceCardAlertFromIndexPath___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__PKAccountCardNumbersViewController__replaceCardAlertFromIndexPath___block_invoke_3;
  block[3] = &unk_1E59CA8E8;
  id v11 = v6;
  id v12 = v7;
  uint64_t v13 = *(void *)(a1 + 32);
  id v8 = v7;
  id v9 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __69__PKAccountCardNumbersViewController__replaceCardAlertFromIndexPath___block_invoke_3(id *a1)
{
  if (a1[4]
    && ([a1[5] domain],
        id v2 = objc_claimAutoreleasedReturnValue(),
        char v3 = [v2 isEqualToString:*MEMORY[0x1E4F28760]],
        v2,
        (v3 & 1) == 0))
  {
    objc_storeStrong((id *)a1[6] + 137, a1[4]);
    [a1[6] reloadData];
    id v6 = a1[4];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    void v7[2] = __69__PKAccountCardNumbersViewController__replaceCardAlertFromIndexPath___block_invoke_4;
    v7[3] = &unk_1E59DBAF8;
    v7[4] = a1[6];
    id v8 = v6;
    +[PKAccountCardNumbersPresenter authAndDecryptWithVirtualCard:v8 completion:v7];
  }
  else
  {
    id v5 = a1[5];
    id v4 = a1[6];
    [v4 _handleReplacementError:v5];
  }
}

void __69__PKAccountCardNumbersViewController__replaceCardAlertFromIndexPath___block_invoke_4(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__PKAccountCardNumbersViewController__replaceCardAlertFromIndexPath___block_invoke_5;
  block[3] = &unk_1E59CB7E8;
  id v10 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v15 = v8;
  id v16 = v10;
  id v17 = v7;
  id v18 = v9;
  id v11 = v9;
  id v12 = v7;
  id v13 = v8;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __69__PKAccountCardNumbersViewController__replaceCardAlertFromIndexPath___block_invoke_5(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 1152) = 0;
  if (*(void *)(a1 + 40))
  {
    id v2 = [*(id *)(a1 + 32) navigationController];
    id v3 = (id)[v2 popViewControllerAnimated:1];
    id v4 = [*(id *)(a1 + 32) transitionCoordinator];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __69__PKAccountCardNumbersViewController__replaceCardAlertFromIndexPath___block_invoke_6;
    v10[3] = &unk_1E59DBAD0;
    id v5 = *(id *)(a1 + 64);
    uint64_t v6 = *(void *)(a1 + 32);
    id v11 = v5;
    uint64_t v12 = v6;
    id v13 = v2;
    id v7 = v2;
    [v4 animateAlongsideTransition:0 completion:v10];
  }
  else
  {
    id v7 = (id)[*(id *)(a1 + 48) copy];
    [v7 setKeychainCardCredentials:*(void *)(a1 + 56)];
    id v8 = PKLocalizedFeatureString();
    [v7 setDisplayName:v8];

    [*(id *)(*(void *)(a1 + 32) + 1112) writeVirtualCardToKeychain:v7 completion:0];
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 1104), *(id *)(a1 + 56));
    *(unsigned char *)(*(void *)(a1 + 32) + 1169) = 1;
  }

  return [*(id *)(a1 + 32) reloadData];
}

void __69__PKAccountCardNumbersViewController__replaceCardAlertFromIndexPath___block_invoke_6(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    PKAccountDisplayableError();
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    id v2 = PKAlertForDisplayableErrorWithHandlers(v3, 0, 0, 0);
    [*(id *)(a1 + 48) presentViewController:v2 animated:1 completion:0];
  }
}

- (void)_replaceVirtualCard
{
  if (PKVirtualCardSecureRefreshEnabled()
    && [(PKVirtualCard *)self->_virtualCard refreshType] == 1)
  {
    id v3 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "Presenting virtual card refresh Oslo sheet", buf, 2u);
    }

    id v4 = (void *)[objc_alloc(MEMORY[0x1E4F85118]) initRefreshRequestWithPaymentPass:self->_pass];
    id v5 = [[PKPaymentAuthorizationViewController alloc] initWithPaymentRequest:v4];
    [(PKPaymentAuthorizationViewController *)v5 setDelegate:self];
    [(PKAccountCardNumbersViewController *)self presentViewController:v5 animated:1 completion:0];
  }
  else
  {
    unint64_t accountFeatureIdentifier = self->_accountFeatureIdentifier;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    void v7[2] = __57__PKAccountCardNumbersViewController__replaceVirtualCard__block_invoke;
    v7[3] = &unk_1E59DBB70;
    v7[4] = self;
    +[PKCardNumbersAuthentication authenticationContextLocationBased:1 featureIdentifier:accountFeatureIdentifier completion:v7];
  }
}

void __57__PKAccountCardNumbersViewController__replaceVirtualCard__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5 || v6)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __57__PKAccountCardNumbersViewController__replaceVirtualCard__block_invoke_4;
    v13[3] = &unk_1E59CA870;
    v13[4] = *(void *)(a1 + 32);
    id v14 = v6;
    dispatch_async(MEMORY[0x1E4F14428], v13);
    uint64_t v12 = v14;
  }
  else
  {
    uint64_t v17 = 0;
    id v18 = &v17;
    uint64_t v19 = 0x3032000000;
    v20 = __Block_byref_object_copy__50;
    v21 = __Block_byref_object_dispose__50;
    id v22 = v5;
    *(unsigned char *)(*(void *)(a1 + 32) + 1168) = 1;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __57__PKAccountCardNumbersViewController__replaceVirtualCard__block_invoke_193;
    block[3] = &unk_1E59CA7D0;
    void block[4] = *(void *)(a1 + 32);
    dispatch_async(MEMORY[0x1E4F14428], block);
    uint64_t v8 = *(void *)(a1 + 32);
    id v9 = *(void **)(v8 + 1120);
    uint64_t v10 = *(void *)(v8 + 1096);
    id v11 = [(id)v18[5] externalizedContext];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __57__PKAccountCardNumbersViewController__replaceVirtualCard__block_invoke_2;
    v15[3] = &unk_1E59DBB48;
    void v15[4] = *(void *)(a1 + 32);
    void v15[5] = &v17;
    [v9 regenerateVPANCardCredentialsForVirtualCard:v10 authorization:v11 completion:v15];

    _Block_object_dispose(&v17, 8);
    uint64_t v12 = v22;
  }
}

void __57__PKAccountCardNumbersViewController__replaceVirtualCard__block_invoke_193(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [(id)objc_opt_class() _virtualCardSections];
  [v1 recomputeMappedSectionsAndReloadSections:v2];
}

void __57__PKAccountCardNumbersViewController__replaceVirtualCard__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = 0;

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__PKAccountCardNumbersViewController__replaceVirtualCard__block_invoke_3;
  block[3] = &unk_1E59CA8E8;
  void block[4] = *(void *)(a1 + 32);
  id v12 = v5;
  id v13 = v6;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __57__PKAccountCardNumbersViewController__replaceVirtualCard__block_invoke_3(void *a1)
{
  *(unsigned char *)(a1[4] + 1152) = 0;
  *(unsigned char *)(a1[4] + 1168) = 0;
  id v2 = (void *)a1[5];
  id v3 = (id *)(a1[4] + 1104);
  if (v2)
  {
    objc_storeStrong(v3, v2);
    *(unsigned char *)(a1[4] + 1169) = 1;
    id v4 = (void *)a1[4];
    id v8 = [(id)objc_opt_class() _virtualCardSections];
    [v4 recomputeMappedSectionsAndReloadSections:v8];
  }
  else
  {
    id v5 = *v3;
    *id v3 = 0;

    id v6 = (void *)a1[4];
    uint64_t v7 = a1[6];
    [v6 _handleReplacementError:v7];
  }
}

void __57__PKAccountCardNumbersViewController__replaceVirtualCard__block_invoke_4(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 1152) = 0;
  if ((objc_msgSend(*(id *)(a1 + 40), "pk_shouldSuppressAfterAuthenticationPolicyWasLocationBased:", 1) & 1) == 0)
  {
    id v3 = +[PKCardNumbersAuthentication genericDisplayableVirtualCardError];
    id v2 = PKAlertForDisplayableErrorWithHandlers(v3, 0, 0, 0);
    [*(id *)(a1 + 32) presentViewController:v2 animated:1 completion:0];
  }
}

- (void)_handleReplacementError:(id)a3
{
  id v4 = a3;
  self->_loadingReplacementCard = 0;
  id v16 = v4;
  if (!v4) {
    goto LABEL_14;
  }
  id v5 = [v4 domain];
  int v6 = [v5 isEqualToString:*MEMORY[0x1E4F88098]];

  if (!v6)
  {
    id v10 = [MEMORY[0x1E4F84D50] sharedService];
    if (PKVirtualCardEnabledWithWebService())
    {
      uint64_t v11 = [(PKVirtualCard *)self->_virtualCard type];

      if (v11 == 2)
      {
        id v12 = [(PKAccountCardNumbersViewController *)self _genericDisplayableError:v16];
LABEL_12:
        id v13 = v12;
        id v8 = PKAlertForDisplayableErrorWithHandlers(v12, 0, 0, 0);

        [(PKAccountCardNumbersViewController *)self presentViewController:v8 animated:1 completion:0];
        goto LABEL_13;
      }
    }
    else
    {
    }
    id v12 = +[PKAccountFlowController displayableErrorForError:v16 featureIdentifier:self->_accountFeatureIdentifier genericErrorTitle:0 genericErrorMessage:0];
    goto LABEL_12;
  }
  unint64_t v7 = [v16 code];
  if (v7 > 5) {
    goto LABEL_14;
  }
  if (v7 != 3)
  {
    id v8 = [(PKAccountCardNumbersViewController *)self _genericDisplayableError:v16];
    if (!v8) {
      goto LABEL_14;
    }
    goto LABEL_6;
  }
  id v14 = [(PKAccountCardNumbersViewController *)self _localizedStringForKey:@"ACCOUNT_SERVICE_CARD_NUMBERS_VIRTUAL_RATE_LIMIT_ERROR_TITLE"];
  id v15 = [(PKAccountCardNumbersViewController *)self _localizedStringForKey:@"ACCOUNT_SERVICE_CARD_NUMBERS_VIRTUAL_RATE_LIMIT_ERROR_MESSAGE"];
  PKDisplayableErrorCustom();
  id v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
LABEL_6:
    id v9 = PKAlertForDisplayableErrorWithHandlers(v8, 0, 0, 0);
    [(PKAccountCardNumbersViewController *)self presentViewController:v9 animated:1 completion:0];

LABEL_13:
  }
LABEL_14:
  [(PKSectionTableViewController *)self reloadData];
}

- (id)_genericDisplayableError:(id)a3
{
  id v3 = a3;
  id v4 = PKLocalizedCardNumbersString(&cfstr_CardNumbersVir_20.isa);
  id v5 = PKLocalizedCardNumbersString(&cfstr_CardNumbersVir_21.isa);
  int v6 = PKDisplayableErrorCustom();

  return v6;
}

- (void)_toggleDynamicSecurityCodeSetting
{
  if ([(PKVirtualCard *)self->_virtualCard hasDynamicSecurityCode]) {
    uint64_t v3 = 7;
  }
  else {
    uint64_t v3 = 6;
  }
  [(PKSettingTableCell *)self->_dynamicSecurityCodeCell showSpinner:1];
  accountService = self->_accountService;
  id v5 = [(PKVirtualCard *)self->_virtualCard identifier];
  int v6 = [(PKAccount *)self->_account accountIdentifier];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __71__PKAccountCardNumbersViewController__toggleDynamicSecurityCodeSetting__block_invoke;
  v7[3] = &unk_1E59DBB20;
  v7[4] = self;
  [(PKAccountService *)accountService performVirtualCardAction:v3 forVirtualCardIdentifier:v5 forAccountIdentifier:v6 completion:v7];
}

void __71__PKAccountCardNumbersViewController__toggleDynamicSecurityCodeSetting__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__PKAccountCardNumbersViewController__toggleDynamicSecurityCodeSetting__block_invoke_2;
  block[3] = &unk_1E59CA8E8;
  void block[4] = *(void *)(a1 + 32);
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __71__PKAccountCardNumbersViewController__toggleDynamicSecurityCodeSetting__block_invoke_2(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 1176) showSpinner:0];
  id v2 = *(void **)(a1 + 40);
  if (v2) {
    BOOL v3 = *(void *)(a1 + 48) == 0;
  }
  else {
    BOOL v3 = 0;
  }
  if (v3)
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 1096), v2);
    id v6 = *(void **)(a1 + 32);
    id v7 = [(id)objc_opt_class() _virtualCardSections];
    [v6 recomputeMappedSectionsAndReloadSections:v7];

    uint64_t v8 = *(void *)(a1 + 32);
    id v9 = *(void **)(v8 + 1112);
    id v5 = [*(id *)(v8 + 1096) securityCodeIdentifier];
    id v10 = [*(id *)(*(void *)(a1 + 32) + 1096) identifier];
    id v11 = [*(id *)(*(void *)(a1 + 32) + 1128) accountIdentifier];
    [v9 noteSecurityCodeActivityWithAction:1 forSecurityCodeIdentifier:v5 forVirtualCardIdentifier:v10 forAccountIdentifier:v11 completion:&__block_literal_global_211];
  }
  else
  {
    id v4 = +[PKAccountFlowController displayableErrorForError:featureIdentifier:genericErrorTitle:genericErrorMessage:](PKAccountFlowController, "displayableErrorForError:featureIdentifier:genericErrorTitle:genericErrorMessage:");
    id v5 = PKAlertForDisplayableErrorWithHandlers(v4, 0, 0, 0);

    [*(id *)(a1 + 32) presentViewController:v5 animated:1 completion:0];
  }

  uint64_t v12 = *(void *)(a1 + 32);
  id v13 = *(void **)(v12 + 1176);
  uint64_t v14 = [*(id *)(v12 + 1096) hasDynamicSecurityCode];

  return [v13 setOn:v14];
}

void __71__PKAccountCardNumbersViewController__toggleDynamicSecurityCodeSetting__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v4 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    uint64_t v6 = a3;
    _os_log_impl(&dword_19F450000, v4, OS_LOG_TYPE_DEFAULT, "Called noteSecurityCodeActivityWithAction after enabling dynamic security code with error: %@", (uint8_t *)&v5, 0xCu);
  }
}

- (id)_localizedStringForKey:(id)a3
{
  id v4 = a3;
  unint64_t accountFeatureIdentifier = self->_accountFeatureIdentifier;
  if (accountFeatureIdentifier == 1)
  {
    uint64_t v6 = [v4 substringFromIndex:objc_msgSend(@"ACCOUNT_SERVICE_", "length")];
    uint64_t v7 = PKLocalizedCashVPANString(v6);
    goto LABEL_5;
  }
  if (!accountFeatureIdentifier)
  {
    uint64_t v6 = [v4 substringFromIndex:objc_msgSend(@"ACCOUNT_SERVICE_", "length")];
    uint64_t v7 = PKLocalizedVirtualCardString(v6);
LABEL_5:
    uint64_t v8 = (void *)v7;

    goto LABEL_7;
  }
  uint64_t v8 = PKLocalizedFeatureString();
LABEL_7:

  return v8;
}

- (void)_retryCardCredentials
{
  if ([(LAContext *)self->_localAuthenticationContext checkContextValidWithError:0])
  {
    [(PKAccountCardNumbersViewController *)self _retrieveCardCredentials];
  }
  else
  {
    self->_loadingCredentials = 1;
    BOOL v3 = [(id)objc_opt_class() _virtualCardSections];
    [(PKSectionTableViewController *)self recomputeMappedSectionsAndReloadSections:v3];

    unint64_t accountFeatureIdentifier = self->_accountFeatureIdentifier;
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __59__PKAccountCardNumbersViewController__retryCardCredentials__block_invoke;
    v5[3] = &unk_1E59DBB70;
    v5[4] = self;
    +[PKCardNumbersAuthentication authenticationContextLocationBased:1 featureIdentifier:accountFeatureIdentifier completion:v5];
  }
}

void __59__PKAccountCardNumbersViewController__retryCardCredentials__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__PKAccountCardNumbersViewController__retryCardCredentials__block_invoke_2;
  block[3] = &unk_1E59CA8E8;
  id v10 = v5;
  id v11 = v6;
  uint64_t v12 = *(void *)(a1 + 32);
  id v7 = v6;
  id v8 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __59__PKAccountCardNumbersViewController__retryCardCredentials__block_invoke_2(uint64_t a1)
{
  BOOL v3 = *(void **)(a1 + 32);
  id v2 = *(void **)(a1 + 40);
  if (v3) {
    BOOL v4 = v2 == 0;
  }
  else {
    BOOL v4 = 0;
  }
  if (v4)
  {
    objc_storeStrong((id *)(*(void *)(a1 + 48) + 1184), v3);
    id v7 = *(void **)(a1 + 48);
    [v7 _retrieveCardCredentials];
  }
  else
  {
    if ((objc_msgSend(v2, "pk_shouldSuppressAfterAuthenticationPolicyWasLocationBased:", 1) & 1) == 0)
    {
      id v5 = +[PKCardNumbersAuthentication genericDisplayableVirtualCardError];
      id v6 = PKAlertForDisplayableErrorWithHandlers(v5, 0, 0, 0);
      [*(id *)(a1 + 48) presentViewController:v6 animated:1 completion:0];
    }
    *(unsigned char *)(*(void *)(a1 + 48) + 1168) = 0;
  }
}

- (void)_retrieveCardCredentials
{
  BOOL v3 = [(LAContext *)self->_localAuthenticationContext externalizedContext];
  if (v3 && (PKUIOnlyDemoModeEnabled() & 1) == 0)
  {
    self->_loadingCredentials = 1;
    BOOL v4 = [(id)objc_opt_class() _virtualCardSections];
    [(PKSectionTableViewController *)self recomputeMappedSectionsAndReloadSections:v4];

    id v5 = objc_alloc_init(MEMORY[0x1E4F85120]);
    virtualCard = self->_virtualCard;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    void v7[2] = __62__PKAccountCardNumbersViewController__retrieveCardCredentials__block_invoke;
    v7[3] = &unk_1E59DBBB8;
    v7[4] = self;
    [v5 credentialsForVirtualCard:virtualCard authorization:v3 options:3 merchantHost:0 completion:v7];
  }
}

void __62__PKAccountCardNumbersViewController__retrieveCardCredentials__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  *(unsigned char *)(*(void *)(a1 + 32) + 1168) = 0;
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(void **)(v7 + 1184);
  *(void *)(v7 + 1184) = 0;

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__PKAccountCardNumbersViewController__retrieveCardCredentials__block_invoke_2;
  block[3] = &unk_1E59CA8E8;
  uint64_t v9 = *(void *)(a1 + 32);
  id v13 = v5;
  uint64_t v14 = v9;
  id v15 = v6;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __62__PKAccountCardNumbersViewController__retrieveCardCredentials__block_invoke_2(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  if (v2)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    id v4 = v2;
    id v5 = *(void **)(v3 + 1104);
    *(void *)(v3 + 1104) = v4;
  }
  else
  {
    id v6 = [*(id *)(a1 + 48) domain];
    int v7 = [v6 isEqualToString:*MEMORY[0x1E4F88098]];

    if (v7 && [*(id *)(a1 + 48) code] == 3)
    {
      id v8 = +[PKCardNumbersAuthentication rateLimitDisplayableVirtualCardError];
    }
    else
    {
      id v8 = +[PKCardNumbersAuthentication genericDisplayableVirtualCardError];
    }
    id v5 = v8;
    id v9 = PKAlertForDisplayableErrorWithHandlers(v8, 0, 0, 0);
    [*(id *)(a1 + 40) presentViewController:v9 animated:1 completion:0];
  }
  id v10 = *(void **)(a1 + 40);
  id v11 = [(id)objc_opt_class() _virtualCardSections];
  [v10 recomputeMappedSectionsAndReloadSections:v11];
}

+ (id)_virtualCardSections
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  [v2 addIndex:0];
  [v2 addIndex:1];
  [v2 addIndex:2];

  return v2;
}

- (void)paymentAuthorizationViewController:(id)a3 didAuthorizePayment:(id)a4 handler:(id)a5
{
  id v5 = (void (**)(id, void *))a5;
  id v6 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v9 = 0;
    _os_log_impl(&dword_19F450000, v6, OS_LOG_TYPE_DEFAULT, "Finished virtual card refresh", v9, 2u);
  }

  id v7 = objc_alloc(MEMORY[0x1E4F84A30]);
  id v8 = (void *)[v7 initWithStatus:0 errors:MEMORY[0x1E4F1CBF0]];
  v5[2](v5, v8);
}

- (void)paymentAuthorizationViewControllerDidFinish:(id)a3
{
  self->_loadingReplacementCard = 0;
  [(PKAccountCardNumbersViewController *)self dismissViewControllerAnimated:1 completion:0];
}

- (void)_sendAnalyticsButtonTapped:(id)a3
{
  v9[2] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *MEMORY[0x1E4F86120];
  v8[0] = *MEMORY[0x1E4F86308];
  v8[1] = v4;
  v9[0] = *MEMORY[0x1E4F86380];
  v9[1] = a3;
  id v5 = (void *)MEMORY[0x1E4F1C9E8];
  id v6 = a3;
  id v7 = [v5 dictionaryWithObjects:v9 forKeys:v8 count:2];

  [(PKAccountCardNumbersViewController *)self _sendAnalyticsEvent:v7];
}

- (void)_sendAnalyticsEvent:(id)a3
{
  id v4 = (id)[a3 mutableCopy];
  [v4 setObject:*MEMORY[0x1E4F86160] forKey:*MEMORY[0x1E4F86730]];
  if (self->_accountFeatureIdentifier == 1)
  {
    [v4 setObject:*MEMORY[0x1E4F869F0] forKey:*MEMORY[0x1E4F864C8]];
    [MEMORY[0x1E4F843E0] subject:*MEMORY[0x1E4F87000] sendEvent:v4];
  }
  if ([(PKVirtualCard *)self->_virtualCard type] == 2) {
    [MEMORY[0x1E4F843E0] subject:*MEMORY[0x1E4F87038] sendEvent:v4];
  }
}

- (BOOL)redactSensitiveDetails
{
  return self->_redactSensitiveDetails;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localAuthenticationContext, 0);
  objc_storeStrong((id *)&self->_dynamicSecurityCodeCell, 0);
  objc_storeStrong((id *)&self->_physicalCard, 0);
  objc_storeStrong((id *)&self->_pass, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_paymentService, 0);
  objc_storeStrong((id *)&self->_accountService, 0);
  objc_storeStrong((id *)&self->_cardCredentials, 0);

  objc_storeStrong((id *)&self->_virtualCard, 0);
}

@end