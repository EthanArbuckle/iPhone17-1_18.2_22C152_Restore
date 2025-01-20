@interface PKPeerPaymentActionAddMoneyViewController
- (BOOL)_isCurrentAmountValid;
- (BOOL)_shouldShakeCard:(id)a3;
- (BOOL)_showSignageWithinKeypad;
- (BOOL)enterCurrencyAmountView:(id)a3 shouldChangeAmountFrom:(id)a4 to:(id)a5;
- (PKPeerPaymentActionAddMoneyViewController)initWithPaymentPass:(id)a3 webService:(id)a4 passLibraryDataProvider:(id)a5 context:(int64_t)a6;
- (id)_addBarButton;
- (id)_spinnerBarButton;
- (id)presentationSceneIdentifierForPeerPaymentActionController:(id)a3;
- (id)presentationSceneIdentifierForTopUpController:(id)a3;
- (void)_addBarButtonPressed:(id)a3;
- (void)_currentAmountDidChangeTo:(id)a3 shouldGenerateNewSuggestions:(BOOL)a4;
- (void)_showNavigationBarSpinner:(BOOL)a3;
- (void)_updateBarButtonEnabledState;
- (void)_updateCurrentAmount:(id)a3 shouldGenerateNewSuggestions:(BOOL)a4;
- (void)_updateLayoutForKeyboardAction:(id)a3;
- (void)dealloc;
- (void)didSelectSuggestion:(id)a3;
- (void)enterCurrencyAmountPassViewDidLoadPassSnapshot:(id)a3;
- (void)enterCurrencyAmountViewDidChangeAmount:(id)a3;
- (void)keyboardWillChange:(id)a3;
- (void)keyboardWillHide:(id)a3;
- (void)keyboardWillShow:(id)a3;
- (void)loadView;
- (void)numberPadSuggestionsView:(id)a3 didSelectSuggestion:(id)a4;
- (void)peerPaymentActionController:(id)a3 hasChangedState:(unint64_t)a4;
- (void)setCardBalance:(id)a3;
- (void)setMaxBalance:(id)a3;
- (void)setMaxLoadAmount:(id)a3;
- (void)setMinBalance:(id)a3;
- (void)setMinLoadAmount:(id)a3;
- (void)thresholdTopUpController:(id)a3 requestsDismissViewController:(id)a4;
- (void)thresholdTopUpController:(id)a3 requestsPresentViewController:(id)a4;
- (void)thresholdTopUpController:(id)a3 requestsPushViewController:(id)a4;
- (void)thresholdTopUpControllerCompletedSetup:(id)a3;
- (void)updateAccountValues;
- (void)updateFirstResponder;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)willDismissViewController;
@end

@implementation PKPeerPaymentActionAddMoneyViewController

- (PKPeerPaymentActionAddMoneyViewController)initWithPaymentPass:(id)a3 webService:(id)a4 passLibraryDataProvider:(id)a5 context:(int64_t)a6
{
  v33[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v32.receiver = self;
  v32.super_class = (Class)PKPeerPaymentActionAddMoneyViewController;
  v13 = [(PKPeerPaymentActionViewController *)&v32 initWithPaymentPass:v10 webService:v11 passLibraryDataProvider:v12 context:a6];
  if (v13)
  {
    id v14 = objc_alloc_init(MEMORY[0x1E4F84818]);
    v15 = (void *)*((void *)v13 + 136);
    *((void *)v13 + 136) = v14;

    [v13 setControllerAction:1];
    long long v16 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
    *(_OWORD *)(v13 + 1128) = *MEMORY[0x1E4F1DB20];
    *(_OWORD *)(v13 + 1144) = v16;
    v17 = [v13 navigationItem];
    id v18 = objc_alloc_init(MEMORY[0x1E4FB19D8]);
    [v18 configureWithTransparentBackground];
    v19 = +[PKPeerPaymentActionViewController navigationBarBackgroundColor];
    [v18 setBackgroundColor:v19];

    [v17 setStandardAppearance:v18];
    v20 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentPer_7.isa);
    [v17 setTitle:v20];

    v21 = [v13 _addBarButton];
    [v17 setRightBarButtonItem:v21];

    [v13 _updateBarButtonEnabledState];
    objc_initWeak(&location, v13);
    v22 = [v13 account];
    id v23 = [v13 account];
    if ([v23 supportsThresholdTopUp])
    {
      char v24 = PKIsVision();

      if (v24)
      {
LABEL_6:
        v33[0] = objc_opt_class();
        v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:1];
        id v26 = (id)[v13 registerForTraitChanges:v25 withHandler:&__block_literal_global_152];

        [v11 prewarmDeviceScoreForEndpoint:*MEMORY[0x1E4F87C68] recipientAddress:0 quoteDestinationType:3];
        objc_destroyWeak(&location);

        goto LABEL_7;
      }
      id v23 = objc_alloc_init(MEMORY[0x1E4F84C38]);
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __108__PKPeerPaymentActionAddMoneyViewController_initWithPaymentPass_webService_passLibraryDataProvider_context___block_invoke;
      v28[3] = &unk_1E59D8B38;
      id v29 = v22;
      objc_copyWeak(&v30, &location);
      [v23 familyMembersWithCompletion:v28];
      objc_destroyWeak(&v30);
    }
    goto LABEL_6;
  }
LABEL_7:

  return (PKPeerPaymentActionAddMoneyViewController *)v13;
}

void __108__PKPeerPaymentActionAddMoneyViewController_initWithPaymentPass_webService_passLibraryDataProvider_context___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F84710]) initWithFamilyMembers:v3];
  v5 = *(void **)(a1 + 32);
  v6 = [v4 currentUser];
  LODWORD(v5) = [v5 isEligibleForThresholdTopUpForUser:v6];

  if (v5)
  {
    v7 = [MEMORY[0x1E4F84E00] sharedInstance];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __108__PKPeerPaymentActionAddMoneyViewController_initWithPaymentPass_webService_passLibraryDataProvider_context___block_invoke_2;
    v8[3] = &unk_1E59CB088;
    objc_copyWeak(&v9, (id *)(a1 + 40));
    [v7 recurringPaymentsWithCompletion:v8];

    objc_destroyWeak(&v9);
  }
}

void __108__PKPeerPaymentActionAddMoneyViewController_initWithPaymentPass_webService_passLibraryDataProvider_context___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = a2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        if ([*(id *)(*((void *)&v11 + 1) + 8 * v7) type] == 3)
        {

          goto LABEL_11;
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __108__PKPeerPaymentActionAddMoneyViewController_initWithPaymentPass_webService_passLibraryDataProvider_context___block_invoke_3;
  v8[3] = &unk_1E59CB0B0;
  objc_copyWeak(&v9, (id *)(a1 + 32));
  char v10 = 1;
  dispatch_async(MEMORY[0x1E4F14428], v8);
  objc_destroyWeak(&v9);
LABEL_11:
}

void __108__PKPeerPaymentActionAddMoneyViewController_initWithPaymentPass_webService_passLibraryDataProvider_context___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    *((unsigned char *)WeakRetained + 1168) = 1;
    id v3 = WeakRetained;
    [*((id *)WeakRetained + 139) setHidden:*(unsigned char *)(a1 + 40) == 0];
    id WeakRetained = v3;
  }
}

void __108__PKPeerPaymentActionAddMoneyViewController_initWithPaymentPass_webService_passLibraryDataProvider_context___block_invoke_4(uint64_t a1, void *a2)
{
  v2 = [a2 viewIfLoaded];
  if (v2)
  {
    id v3 = v2;
    [v2 setNeedsLayout];
    v2 = v3;
  }
}

- (void)dealloc
{
  id v3 = [(PKPeerPaymentActionViewController *)self webService];
  [v3 unloadDeviceScoreForEndpoint:*MEMORY[0x1E4F87C68] recipientAddress:0 quoteDestinationType:3];

  v4.receiver = self;
  v4.super_class = (Class)PKPeerPaymentActionAddMoneyViewController;
  [(PKPeerPaymentActionViewController *)&v4 dealloc];
}

- (void)loadView
{
  v35.receiver = self;
  v35.super_class = (Class)PKPeerPaymentActionAddMoneyViewController;
  [(PKPeerPaymentActionViewController *)&v35 loadView];
  id v3 = [(PKPeerPaymentActionViewController *)self account];
  objc_super v4 = [(PKPeerPaymentActionAddMoneyViewController *)self view];
  if (PKPeerPaymentFDICSignageEnabled()
    && ([(PKPeerPaymentActionViewController *)self account],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        int IsFDICInsured = PKPeerPaymentAccountIsFDICInsured(),
        v5,
        IsFDICInsured))
  {
    uint64_t v7 = [[PKFDICSignageView alloc] initWithFeature:1 displayingBankName:1];
    -[PKFDICSignageView setContentInsets:](v7, "setContentInsets:", 16.0, 16.0, 16.0, 16.0);
    v8 = [PKDashboardViewControllerFooterContainer alloc];
    id v9 = -[PKDashboardViewControllerFooterContainer initWithFrame:](v8, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [(PKDashboardViewControllerFooterContainer *)v9 setMinimumFooterHeight:0.0];
    [(PKDashboardViewControllerFooterContainer *)v9 setBackdropOpaque:1];
    [(PKDashboardViewControllerFooterContainer *)v9 setCurrentFooter:v7];
  }
  else
  {
    id v9 = 0;
  }
  char v10 = [(PKPeerPaymentActionViewController *)self currentAmount];
  long long v11 = [v3 currentBalance];
  long long v12 = [v11 currency];
  long long v13 = PKCurrencyAmountCreate(v10, v12);

  long long v14 = [(PKPeerPaymentActionViewController *)self pass];
  LODWORD(v10) = [(PKPeerPaymentActionAddMoneyViewController *)self _showSignageWithinKeypad];
  v15 = [PKEnterCurrencyAmountPassView alloc];
  if (v10)
  {
    uint64_t v16 = [(PKEnterCurrencyAmountPassView *)v15 initWithCurrenyAmount:v13 pass:v14 withdrawal:0 keypadBottomView:v9];
    amountPassView = self->_amountPassView;
    self->_amountPassView = v16;
  }
  else
  {
    id v18 = [(PKEnterCurrencyAmountPassView *)v15 initWithCurrenyAmount:v13 pass:v14 withdrawal:0];
    v19 = self->_amountPassView;
    self->_amountPassView = v18;

    objc_storeStrong((id *)&self->_footerContainer, v9);
    if (self->_footerContainer) {
      objc_msgSend(v4, "addSubview:");
    }
  }
  v20 = [(PKEnterCurrencyAmountPassView *)self->_amountPassView enterCurrencyAmountView];
  [v20 setDelegate:self];
  [(PKEnterCurrencyAmountPassView *)self->_amountPassView setDelegate:self];
  if ([MEMORY[0x1E4FB18E0] isInHardwareKeyboardMode])
  {
    v21 = [v20 amountTextField];
    [v21 setDisablePrediction:1];
  }
  else
  {
    v22 = [[PKNumberPadSuggestionsView alloc] initWithDefaultFrame];
    suggestionView = self->_suggestionView;
    self->_suggestionView = v22;

    [(PKNumberPadSuggestionsView *)self->_suggestionView setDelegate:self];
    [v20 setInputAccessoryView:self->_suggestionView];
  }
  objc_initWeak(&location, self);
  char v24 = (void *)MEMORY[0x1E4FB13F0];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __53__PKPeerPaymentActionAddMoneyViewController_loadView__block_invoke;
  v32[3] = &unk_1E59CBEE0;
  objc_copyWeak(&v33, &location);
  v25 = [v24 actionWithHandler:v32];
  id v26 = [MEMORY[0x1E4FB14D8] plainButtonConfiguration];
  v27 = PKLocalizedPeerPaymentRecurringString(&cfstr_AutoReloadSetu.isa);
  [v26 setTitle:v27];

  [v26 setTitleTextAttributesTransformer:&__block_literal_global_41];
  v28 = [MEMORY[0x1E4FB14D0] buttonWithConfiguration:v26 primaryAction:v25];
  actionButton = self->_actionButton;
  self->_actionButton = v28;

  [(UIButton *)self->_actionButton setHidden:!self->_offerThresholdTopUp];
  [(UIButton *)self->_actionButton setAccessibilityIdentifier:*MEMORY[0x1E4F85258]];
  [v4 addSubview:self->_actionButton];
  [v4 addSubview:self->_amountPassView];
  id v30 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v30 addObserver:self selector:sel_keyboardWillShow_ name:*MEMORY[0x1E4FB2C58] object:0];
  [v30 addObserver:self selector:sel_keyboardWillChange_ name:*MEMORY[0x1E4FB2C48] object:0];
  [v30 addObserver:self selector:sel_keyboardWillHide_ name:*MEMORY[0x1E4FB2C50] object:0];
  v31 = [(PKPeerPaymentActionAddMoneyViewController *)self view];
  [v31 setAccessibilityIdentifier:*MEMORY[0x1E4F851D0]];

  objc_destroyWeak(&v33);
  objc_destroyWeak(&location);
}

void __53__PKPeerPaymentActionAddMoneyViewController_loadView__block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v1 = [PKPeerPaymentThresholdTopUpController alloc];
    v2 = [WeakRetained account];
    id v3 = [WeakRetained pass];
    uint64_t v4 = [WeakRetained context];
    uint64_t v5 = [WeakRetained passLibraryDataProvider];
    uint64_t v6 = [(PKPeerPaymentThresholdTopUpController *)v1 initWithPeerPaymentAccount:v2 pass:v3 context:v4 passLibraryDataProvider:v5 delegate:WeakRetained];
    id v7 = WeakRetained[145];
    WeakRetained[145] = (id)v6;

    [WeakRetained[145] presentTopUpFlowForRecurringPayment:0];
  }
}

id __53__PKPeerPaymentActionAddMoneyViewController_loadView__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = (void *)[a2 mutableCopy];
  id v3 = PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB28C8], (NSString *)*MEMORY[0x1E4FB27D0]);
  [v2 setObject:v3 forKeyedSubscript:*MEMORY[0x1E4FB06F8]];

  return v2;
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKPeerPaymentActionAddMoneyViewController;
  [(PKPeerPaymentActionAddMoneyViewController *)&v5 viewWillAppear:a3];
  uint64_t v4 = [(PKPeerPaymentActionAddMoneyViewController *)self view];
  [v4 layoutIfNeeded];

  [(PKPeerPaymentActionAddMoneyViewController *)self updateFirstResponder];
}

- (void)viewWillLayoutSubviews
{
  v49.receiver = self;
  v49.super_class = (Class)PKPeerPaymentActionAddMoneyViewController;
  [(PKPeerPaymentActionAddMoneyViewController *)&v49 viewWillLayoutSubviews];
  id v3 = [(PKPeerPaymentActionAddMoneyViewController *)self view];
  [v3 safeAreaInsets];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  [v3 bounds];
  double v13 = v12;
  double rect = v5 + v14;
  double v16 = v15 - (v7 + v11);
  double v18 = v17 - (v5 + v9);
  [(PKNumberPadSuggestionsView *)self->_suggestionView frame];
  -[PKNumberPadSuggestionsView setFrame:](self->_suggestionView, "setFrame:");
  double v19 = 0.0;
  if (!CGRectIsNull(self->_keyboardFrame))
  {
    if (PKIsPhone())
    {
      double v19 = self->_keyboardFrame.size.height - v9;
    }
    else
    {
      v20 = [v3 window];
      v21 = v20;
      if (v20)
      {
        objc_msgSend(v20, "convertRect:fromWindow:", 0, self->_keyboardFrame.origin.x, self->_keyboardFrame.origin.y, self->_keyboardFrame.size.width, self->_keyboardFrame.size.height);
        objc_msgSend(v3, "convertRect:fromView:", 0);
        double v19 = fmax(rect + v18 - v22, 0.0);
      }
    }
  }
  double v23 = v7 + v13;
  char v24 = (double *)MEMORY[0x1E4F1DB30];
  double v25 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  footerContainer = self->_footerContainer;
  double v27 = v25;
  if (footerContainer)
  {
    -[PKDashboardViewControllerFooterContainer sizeThatFits:](footerContainer, "sizeThatFits:", v16, v18);
    double v28 = v9;
    CGFloat v29 = v18;
    CGFloat v30 = v16;
    double v32 = v31;
    double v27 = v33;
    v50.origin.x = v23;
    v50.origin.y = rect;
    v50.size.width = v30;
    v50.size.height = v29;
    CGFloat MaxY = CGRectGetMaxY(v50);
    double v35 = v32;
    double v16 = v30;
    double v18 = v29;
    -[PKDashboardViewControllerFooterContainer setFrame:](self->_footerContainer, "setFrame:", v23, MaxY - v27 - v19, v35, v28 + v27);
  }
  actionButton = self->_actionButton;
  if (actionButton)
  {
    -[UIButton sizeThatFits:](actionButton, "sizeThatFits:", v16, v18);
    double v47 = v16;
    double v38 = v37;
    double v39 = v19 + v27;
    double v40 = v39 + v37;
    -[PKEnterCurrencyAmountPassView sizeThatFits:](self->_amountPassView, "sizeThatFits:", *v24, v25);
    double v42 = fmin(fmax(v18 - v40 - v41, 0.0) * 0.5, 32.0);
    v43 = self->_actionButton;
    PKRectCenteredXInRect();
    -[UIButton setFrame:](v43, "setFrame:");
    double v25 = v38;
    double v16 = v47;
  }
  else
  {
    double v39 = v19 + v27;
    double v42 = 32.0;
  }
  double v44 = v42 + v25;
  if (v25 <= 0.0) {
    double v44 = -0.0;
  }
  -[PKEnterCurrencyAmountPassView sizeThatFits:](self->_amountPassView, "sizeThatFits:", v16, v18 - (v39 + v44));
  -[PKEnterCurrencyAmountPassView setFrame:](self->_amountPassView, "setFrame:", v23, rect, v45, v46);
}

- (void)peerPaymentActionController:(id)a3 hasChangedState:(unint64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)PKPeerPaymentActionAddMoneyViewController;
  -[PKPeerPaymentActionViewController peerPaymentActionController:hasChangedState:](&v7, sel_peerPaymentActionController_hasChangedState_, a3);
  if (a4 != 2)
  {
    if (a4 != 1) {
      return;
    }
    double v6 = [(PKPeerPaymentActionAddMoneyViewController *)self navigationController];
    [v6 dismissViewControllerAnimated:1 completion:0];
  }
  [(PKPeerPaymentActionAddMoneyViewController *)self updateFirstResponder];
  [(PKPeerPaymentActionAddMoneyViewController *)self _showNavigationBarSpinner:0];
}

- (id)presentationSceneIdentifierForPeerPaymentActionController:(id)a3
{
  id v3 = [(PKPeerPaymentActionAddMoneyViewController *)self view];
  double v4 = [v3 window];
  double v5 = [v4 windowScene];
  double v6 = [v5 _sceneIdentifier];

  return v6;
}

- (void)willDismissViewController
{
  v4.receiver = self;
  v4.super_class = (Class)PKPeerPaymentActionAddMoneyViewController;
  [(PKPeerPaymentActionViewController *)&v4 willDismissViewController];
  id v3 = [(PKEnterCurrencyAmountPassView *)self->_amountPassView enterCurrencyAmountView];
  [v3 dismissKeyboard];
}

- (void)updateFirstResponder
{
  id v3 = [(PKPeerPaymentActionAddMoneyViewController *)self navigationController];
  objc_super v4 = [v3 presentedViewController];

  if (!v4)
  {
    id v6 = [(PKEnterCurrencyAmountPassView *)self->_amountPassView enterCurrencyAmountView];
    double v5 = [v6 amountTextField];
    [v5 becomeFirstResponder];
  }
}

- (void)updateAccountValues
{
  v30.receiver = self;
  v30.super_class = (Class)PKPeerPaymentActionAddMoneyViewController;
  [(PKPeerPaymentActionViewController *)&v30 updateAccountValues];
  id v3 = [(PKPeerPaymentActionViewController *)self account];
  [(PKPeerPaymentActionAddMoneyViewController *)self _updateBarButtonEnabledState];
  if (v3)
  {
    objc_super v4 = [v3 currentBalance];
    double v5 = [v3 maximumBalance];
    id v6 = [v4 currency];
    uint64_t v7 = PKMaximumFractionDigitsForCurrencyCode();

    suggestionGenerator = self->_suggestionGenerator;
    double v9 = [v4 amount];
    [(PKNumericSuggestionsEnterValueAlgorithm *)suggestionGenerator setCardBalance:v9];

    double v10 = self->_suggestionGenerator;
    double v11 = [v4 currency];
    [(PKNumericSuggestionsEnterValueAlgorithm *)v10 setCurrencyCode:v11];

    [(PKNumericSuggestionsEnterValueAlgorithm *)self->_suggestionGenerator setPowerOfTenFactor:3 - v7];
    [(PKNumericSuggestionsEnterValueAlgorithm *)self->_suggestionGenerator setDecimalPrecision:v7];
    double v12 = self->_suggestionGenerator;
    double v13 = [v3 defaultSuggestions];
    [(PKNumericSuggestionsEnterValueAlgorithm *)v12 setDefaultValues:v13];

    double v14 = self->_suggestionGenerator;
    double v15 = [(PKPeerPaymentActionViewController *)self maxLoadAmount];
    [(PKNumericSuggestionsEnterValueAlgorithm *)v14 setMaxLoadAmount:v15];

    double v16 = self->_suggestionGenerator;
    double v17 = [(PKPeerPaymentActionViewController *)self minLoadAmount];
    [(PKNumericSuggestionsEnterValueAlgorithm *)v16 setMinLoadAmount:v17];

    [(PKNumericSuggestionsEnterValueAlgorithm *)self->_suggestionGenerator setMaxBalance:v5];
    double v18 = self->_suggestionGenerator;
    double v19 = [(PKPeerPaymentActionViewController *)self minBalance];
    [(PKNumericSuggestionsEnterValueAlgorithm *)v18 setMinBalance:v19];

    v20 = [(PKEnterCurrencyAmountPassView *)self->_amountPassView enterCurrencyAmountView];
    v21 = [v4 currency];
    [v20 setCurrency:v21];

    [v20 sizeToFit];
    double v22 = [(PKEnterCurrencyAmountPassView *)self->_amountPassView balanceView];
    double v23 = [v4 currency];
    [v22 setCurrencyCode:v23];

    char v24 = [(PKPeerPaymentActionViewController *)self minBalance];
    [v22 setMinBalance:v24];

    [v22 setMaxBalance:v5];
    double v25 = [(PKPeerPaymentActionViewController *)self minLoadAmount];
    [v22 setMinLoadAmount:v25];

    id v26 = [(PKPeerPaymentActionViewController *)self maxLoadAmount];
    [v22 setMaxLoadAmount:v26];

    double v27 = [v4 amount];
    [v22 setCardBalance:v27];

    [v22 sizeToFit];
    [(PKPeerPaymentActionAddMoneyViewController *)self setMaxBalance:v5];
    double v28 = [(PKPeerPaymentActionViewController *)self currentAmount];
    [(PKPeerPaymentActionAddMoneyViewController *)self _updateCurrentAmount:v28 shouldGenerateNewSuggestions:1];

    CGFloat v29 = [(PKPeerPaymentActionAddMoneyViewController *)self view];
    [v29 setNeedsLayout];
  }
}

- (void)keyboardWillShow:(id)a3
{
  objc_super v4 = [a3 userInfo];
  double v5 = [v4 objectForKey:*MEMORY[0x1E4FB2BD8]];

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62__PKPeerPaymentActionAddMoneyViewController_keyboardWillShow___block_invoke;
  v7[3] = &unk_1E59CADB8;
  v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  [(PKPeerPaymentActionAddMoneyViewController *)self _updateLayoutForKeyboardAction:v7];
}

BOOL __62__PKPeerPaymentActionAddMoneyViewController_keyboardWillShow___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  CGFloat v3 = *(double *)(v2 + 1128);
  CGFloat v4 = *(double *)(v2 + 1136);
  CGFloat v5 = *(double *)(v2 + 1144);
  CGFloat v6 = *(double *)(v2 + 1152);
  *(unsigned char *)(v2 + 1120) = 1;
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v7 = *(void **)(a1 + 40);
  double v9 = (void *)(v8 + 1128);
  if (v7)
  {
    [v7 CGRectValue];
    *double v9 = v10;
    v9[1] = v11;
    v9[2] = v12;
    v9[3] = v13;
  }
  else
  {
    long long v14 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
    *(_OWORD *)double v9 = *MEMORY[0x1E4F1DB20];
    *(_OWORD *)(v8 + 1144) = v14;
  }
  v16.origin.x = v3;
  v16.origin.y = v4;
  v16.size.width = v5;
  v16.size.height = v6;
  return !CGRectEqualToRect(*(CGRect *)(*(void *)(a1 + 32) + 1128), v16);
}

- (void)keyboardWillChange:(id)a3
{
  if (self->_keyboardVisible)
  {
    CGFloat v4 = [a3 userInfo];
    CGFloat v5 = [v4 objectForKey:*MEMORY[0x1E4FB2BD8]];

    if (v5)
    {
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __64__PKPeerPaymentActionAddMoneyViewController_keyboardWillChange___block_invoke;
      v6[3] = &unk_1E59CADB8;
      v6[4] = self;
      id v7 = v5;
      [(PKPeerPaymentActionAddMoneyViewController *)self _updateLayoutForKeyboardAction:v6];
    }
  }
}

BOOL __64__PKPeerPaymentActionAddMoneyViewController_keyboardWillChange___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  CGFloat v3 = v2 + 141;
  CGFloat v4 = *((double *)v2 + 141);
  CGFloat v5 = *((double *)v2 + 142);
  CGFloat v6 = *((double *)v2 + 143);
  CGFloat v7 = *((double *)v2 + 144);
  [*(id *)(a1 + 40) CGRectValue];
  *CGFloat v3 = v8;
  v3[1] = v9;
  v3[2] = v10;
  v3[3] = v11;
  v13.origin.x = v4;
  v13.origin.y = v5;
  v13.size.width = v6;
  v13.size.height = v7;
  return !CGRectEqualToRect(*(CGRect *)(*(void *)(a1 + 32) + 1128), v13);
}

- (void)keyboardWillHide:(id)a3
{
  if (self->_keyboardVisible)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __62__PKPeerPaymentActionAddMoneyViewController_keyboardWillHide___block_invoke;
    v3[3] = &unk_1E59CADE0;
    v3[4] = self;
    [(PKPeerPaymentActionAddMoneyViewController *)self _updateLayoutForKeyboardAction:v3];
  }
}

BOOL __62__PKPeerPaymentActionAddMoneyViewController_keyboardWillHide___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  CGRect v8 = *(CGRect *)(v1 + 1128);
  *(unsigned char *)(v1 + 1120) = 0;
  uint64_t v2 = (_OWORD *)(*(void *)(a1 + 32) + 1128);
  long long v3 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
  _OWORD *v2 = *MEMORY[0x1E4F1DB20];
  v2[1] = v3;
  *(void *)&long long v3 = *(void *)(*(void *)(a1 + 32) + 1128);
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 1136);
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 1144);
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 1152);
  return !CGRectEqualToRect(*(CGRect *)&v3, v8);
}

- (void)_updateLayoutForKeyboardAction:(id)a3
{
  uint64_t v4 = (unsigned int (**)(void))a3;
  if (v4)
  {
    uint64_t v5 = [(PKPeerPaymentActionAddMoneyViewController *)self viewIfLoaded];
    uint64_t v6 = v5;
    if (v5)
    {
      [v5 layoutIfNeeded];
      if (v4[2](v4))
      {
        [v6 setNeedsLayout];
        CGFloat v7 = (void *)MEMORY[0x1E4FB1EB0];
        v10[0] = MEMORY[0x1E4F143A8];
        v10[1] = 3221225472;
        v10[2] = __76__PKPeerPaymentActionAddMoneyViewController__updateLayoutForKeyboardAction___block_invoke;
        v10[3] = &unk_1E59CA7D0;
        id v11 = v6;
        v8[0] = MEMORY[0x1E4F143A8];
        v8[1] = 3221225472;
        v8[2] = __76__PKPeerPaymentActionAddMoneyViewController__updateLayoutForKeyboardAction___block_invoke_2;
        v8[3] = &unk_1E59CAEA8;
        void v8[4] = self;
        id v9 = v11;
        [v7 _animateUsingDefaultTimingWithOptions:134 animations:v10 completion:v8];
      }
    }
    else
    {
      v4[2](v4);
    }
  }
}

uint64_t __76__PKPeerPaymentActionAddMoneyViewController__updateLayoutForKeyboardAction___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

void __76__PKPeerPaymentActionAddMoneyViewController__updateLayoutForKeyboardAction___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) traitCollection];
  uint64_t v3 = [v2 userInterfaceIdiom];

  if (v3 == 1)
  {
    [*(id *)(a1 + 40) setNeedsLayout];
    uint64_t v4 = (void *)MEMORY[0x1E4FB1EB0];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __76__PKPeerPaymentActionAddMoneyViewController__updateLayoutForKeyboardAction___block_invoke_3;
    v5[3] = &unk_1E59CA7D0;
    id v6 = *(id *)(a1 + 40);
    [v4 _animateUsingDefaultTimingWithOptions:134 animations:v5 completion:0];
  }
}

uint64_t __76__PKPeerPaymentActionAddMoneyViewController__updateLayoutForKeyboardAction___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

- (BOOL)_showSignageWithinKeypad
{
  int v2 = PKIsPhone();
  if (v2) {
    LOBYTE(v2) = [MEMORY[0x1E4FB18E0] isInHardwareKeyboardMode] ^ 1;
  }
  return v2;
}

- (void)enterCurrencyAmountPassViewDidLoadPassSnapshot:(id)a3
{
  id v3 = [(PKPeerPaymentActionAddMoneyViewController *)self viewIfLoaded];
  [v3 setNeedsLayout];
}

- (void)numberPadSuggestionsView:(id)a3 didSelectSuggestion:(id)a4
{
}

- (void)didSelectSuggestion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 value];
  -[PKPeerPaymentActionAddMoneyViewController _updateCurrentAmount:shouldGenerateNewSuggestions:](self, "_updateCurrentAmount:shouldGenerateNewSuggestions:", v5, [v4 usedMaximumSuggestion]);

  id v6 = [v4 value];

  LODWORD(v4) = [(PKPeerPaymentActionAddMoneyViewController *)self _shouldShakeCard:v6];
  if (v4)
  {
    amountPassView = self->_amountPassView;
    [(PKEnterCurrencyAmountPassView *)amountPassView shakePassView];
  }
}

- (BOOL)enterCurrencyAmountView:(id)a3 shouldChangeAmountFrom:(id)a4 to:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if ([(PKPeerPaymentActionAddMoneyViewController *)self _shouldShakeCard:v8]) {
    [(PKEnterCurrencyAmountPassView *)self->_amountPassView shakePassView];
  }
  id v9 = [(PKPeerPaymentActionViewController *)self maxLoadAmount];
  uint64_t v10 = [(PKPeerPaymentActionViewController *)self cardBalance];
  id v11 = [(PKPeerPaymentActionViewController *)self maxBalance];
  BOOL v12 = !v9 || [v9 compare:v7] != -1 || objc_msgSend(v9, "compare:", v8) != -1;
  CGRect v13 = [v8 decimalNumberByAdding:v10];
  long long v14 = [v7 decimalNumberByAdding:v10];
  if (v11 && [v11 compare:v13] == -1 && objc_msgSend(v11, "compare:", v14) == -1) {
    BOOL v12 = 0;
  }

  return v12;
}

- (void)enterCurrencyAmountViewDidChangeAmount:(id)a3
{
  id v5 = [a3 currentAmount];
  [(PKPeerPaymentActionViewController *)self setCurrentAmount:v5];
  id v4 = [(PKEnterCurrencyAmountPassView *)self->_amountPassView balanceView];
  [v4 addAmountToBalance:v5];

  [(PKPeerPaymentActionAddMoneyViewController *)self _currentAmountDidChangeTo:v5 shouldGenerateNewSuggestions:1];
}

- (void)setCardBalance:(id)a3
{
  id v4 = a3;
  id v5 = [(PKPeerPaymentActionViewController *)self cardBalance];
  v8.receiver = self;
  v8.super_class = (Class)PKPeerPaymentActionAddMoneyViewController;
  [(PKPeerPaymentActionViewController *)&v8 setCardBalance:v4];
  if (v5 != v4 && ([v4 isEqualToNumber:v5] & 1) == 0)
  {
    [(PKNumericSuggestionsEnterValueAlgorithm *)self->_suggestionGenerator setCardBalance:v4];
    id v6 = [(PKEnterCurrencyAmountPassView *)self->_amountPassView balanceView];
    [v6 setCardBalance:v4];

    id v7 = [MEMORY[0x1E4F28C28] zero];
    [(PKPeerPaymentActionAddMoneyViewController *)self _updateCurrentAmount:v7 shouldGenerateNewSuggestions:1];
  }
}

- (void)setMaxBalance:(id)a3
{
  id v4 = a3;
  id v5 = [(PKPeerPaymentActionViewController *)self maxBalance];
  v8.receiver = self;
  v8.super_class = (Class)PKPeerPaymentActionAddMoneyViewController;
  [(PKPeerPaymentActionViewController *)&v8 setMaxBalance:v4];
  if (v5 != v4 && ([v4 isEqualToNumber:v5] & 1) == 0)
  {
    [(PKNumericSuggestionsEnterValueAlgorithm *)self->_suggestionGenerator setMaxBalance:v4];
    id v6 = [(PKEnterCurrencyAmountPassView *)self->_amountPassView balanceView];
    [v6 setMaxBalance:v4];

    id v7 = [MEMORY[0x1E4F28C28] zero];
    [(PKPeerPaymentActionAddMoneyViewController *)self _updateCurrentAmount:v7 shouldGenerateNewSuggestions:1];
  }
}

- (void)setMinBalance:(id)a3
{
  id v4 = a3;
  id v5 = [(PKPeerPaymentActionViewController *)self minBalance];
  v8.receiver = self;
  v8.super_class = (Class)PKPeerPaymentActionAddMoneyViewController;
  [(PKPeerPaymentActionViewController *)&v8 setMinBalance:v4];
  if (v5 != v4 && ([v4 isEqualToNumber:v5] & 1) == 0)
  {
    [(PKNumericSuggestionsEnterValueAlgorithm *)self->_suggestionGenerator setMinBalance:v4];
    id v6 = [(PKEnterCurrencyAmountPassView *)self->_amountPassView balanceView];
    [v6 setMinBalance:v4];

    id v7 = [MEMORY[0x1E4F28C28] zero];
    [(PKPeerPaymentActionAddMoneyViewController *)self _updateCurrentAmount:v7 shouldGenerateNewSuggestions:1];
  }
}

- (void)setMaxLoadAmount:(id)a3
{
  id v4 = a3;
  id v5 = [(PKPeerPaymentActionViewController *)self maxLoadAmount];
  v8.receiver = self;
  v8.super_class = (Class)PKPeerPaymentActionAddMoneyViewController;
  [(PKPeerPaymentActionViewController *)&v8 setMaxLoadAmount:v4];
  if (v5 != v4 && ([v4 isEqualToNumber:v5] & 1) == 0)
  {
    [(PKNumericSuggestionsEnterValueAlgorithm *)self->_suggestionGenerator setMaxLoadAmount:v4];
    id v6 = [(PKEnterCurrencyAmountPassView *)self->_amountPassView balanceView];
    [v6 setMaxLoadAmount:v4];

    id v7 = [MEMORY[0x1E4F28C28] zero];
    [(PKPeerPaymentActionAddMoneyViewController *)self _updateCurrentAmount:v7 shouldGenerateNewSuggestions:1];
  }
}

- (void)setMinLoadAmount:(id)a3
{
  id v4 = a3;
  id v5 = [(PKPeerPaymentActionViewController *)self minLoadAmount];
  v8.receiver = self;
  v8.super_class = (Class)PKPeerPaymentActionAddMoneyViewController;
  [(PKPeerPaymentActionViewController *)&v8 setMinLoadAmount:v4];
  if (v5 != v4 && ([v4 isEqualToNumber:v5] & 1) == 0)
  {
    [(PKNumericSuggestionsEnterValueAlgorithm *)self->_suggestionGenerator setMinLoadAmount:v4];
    id v6 = [(PKEnterCurrencyAmountPassView *)self->_amountPassView balanceView];
    [v6 setMinLoadAmount:v4];

    id v7 = [MEMORY[0x1E4F28C28] zero];
    [(PKPeerPaymentActionAddMoneyViewController *)self _updateCurrentAmount:v7 shouldGenerateNewSuggestions:1];
  }
}

- (id)_addBarButton
{
  id v3 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentPer_8.isa);
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithTitle:v3 style:2 target:self action:sel__addBarButtonPressed_];
  [v4 setAccessibilityIdentifier:*MEMORY[0x1E4F851C8]];

  return v4;
}

- (id)_spinnerBarButton
{
  int v2 = (void *)[objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:100];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithCustomView:v2];
  [v2 startAnimating];

  return v3;
}

- (void)_updateBarButtonEnabledState
{
  id v3 = [(PKPeerPaymentActionAddMoneyViewController *)self navigationItem];
  id v6 = [v3 rightBarButtonItem];

  id v4 = [(PKPeerPaymentActionViewController *)self account];

  if (v4) {
    BOOL v5 = [(PKPeerPaymentActionAddMoneyViewController *)self _isCurrentAmountValid];
  }
  else {
    BOOL v5 = 0;
  }
  [v6 setEnabled:v5];
}

- (void)_addBarButtonPressed:(id)a3
{
  [(PKPeerPaymentActionAddMoneyViewController *)self _showNavigationBarSpinner:1];
  id v9 = [(PKPeerPaymentActionViewController *)self currentAmount];
  id v4 = [(PKPeerPaymentActionViewController *)self account];
  BOOL v5 = [v4 currentBalance];
  id v6 = [v5 currency];

  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F84610]) initWithAmount:v9 currency:v6 exponent:0];
  objc_super v8 = [(PKPeerPaymentActionViewController *)self actionController];
  [v8 performActionWithCurrencyAmount:v7];
}

- (void)_updateCurrentAmount:(id)a3 shouldGenerateNewSuggestions:(BOOL)a4
{
  BOOL v4 = a4;
  id v8 = a3;
  [(PKPeerPaymentActionViewController *)self setCurrentAmount:v8];
  id v6 = [(PKEnterCurrencyAmountPassView *)self->_amountPassView balanceView];
  [v6 addAmountToBalance:v8];

  id v7 = [(PKEnterCurrencyAmountPassView *)self->_amountPassView enterCurrencyAmountView];
  [v7 setCurrentAmount:v8];

  [(PKPeerPaymentActionAddMoneyViewController *)self _currentAmountDidChangeTo:v8 shouldGenerateNewSuggestions:v4];
}

- (void)_currentAmountDidChangeTo:(id)a3 shouldGenerateNewSuggestions:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v26 = a3;
  if (v4)
  {
    val = self;
    char v24 = [(PKNumericSuggestionsEnterValueAlgorithm *)self->_suggestionGenerator suggestionsWithAmount:v26];
    int v6 = [MEMORY[0x1E4FB18E0] isInHardwareKeyboardMode];
    if (self->_suggestionView)
    {
      id v7 = v24;
      [(PKNumberPadSuggestionsView *)val->_suggestionView setSuggestions:v24];
    }
    else
    {
      id v7 = v24;
      if (v6)
      {
        id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        objc_initWeak(&location, val);
        long long v32 = 0u;
        long long v33 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        id obj = v24;
        uint64_t v9 = [obj countByEnumeratingWithState:&v30 objects:v36 count:16];
        if (v9)
        {
          uint64_t v10 = *(void *)v31;
          do
          {
            for (uint64_t i = 0; i != v9; ++i)
            {
              if (*(void *)v31 != v10) {
                objc_enumerationMutation(obj);
              }
              BOOL v12 = *(void **)(*((void *)&v30 + 1) + 8 * i);
              CGRect v13 = (void *)MEMORY[0x1E4FB13F0];
              long long v14 = [v12 displayValue];
              v28[0] = MEMORY[0x1E4F143A8];
              v28[1] = 3221225472;
              v28[2] = __100__PKPeerPaymentActionAddMoneyViewController__currentAmountDidChangeTo_shouldGenerateNewSuggestions___block_invoke;
              v28[3] = &unk_1E59CE6B8;
              objc_copyWeak(&v29, &location);
              void v28[4] = v12;
              double v15 = [v13 actionWithTitle:v14 image:0 identifier:0 handler:v28];

              CGRect v16 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithPrimaryAction:v15];
              double v17 = [MEMORY[0x1E4FB1618] labelColor];
              [v16 setTintColor:v17];

              [v8 addObject:v16];
              objc_destroyWeak(&v29);
            }
            uint64_t v9 = [obj countByEnumeratingWithState:&v30 objects:v36 count:16];
          }
          while (v9);
        }

        double v18 = [(PKEnterCurrencyAmountPassView *)val->_amountPassView enterCurrencyAmountView];
        double v19 = [v18 amountTextField];
        v20 = [v19 inputAssistantItem];

        v21 = (void *)[objc_alloc(MEMORY[0x1E4FB14B8]) initWithBarButtonItems:v8 representativeItem:0];
        double v35 = v21;
        double v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v35 count:1];
        [v20 setTrailingBarButtonGroups:v22];

        objc_destroyWeak(&location);
        id v7 = v24;
      }
    }

    self = val;
  }
  [(PKPeerPaymentActionAddMoneyViewController *)self _updateBarButtonEnabledState];
  double v23 = [(PKPeerPaymentActionAddMoneyViewController *)self view];
  [v23 setNeedsLayout];
}

void __100__PKPeerPaymentActionAddMoneyViewController__currentAmountDidChangeTo_shouldGenerateNewSuggestions___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained didSelectSuggestion:*(void *)(a1 + 32)];
}

- (BOOL)_isCurrentAmountValid
{
  id v3 = [(PKPeerPaymentActionViewController *)self currentAmount];
  BOOL v4 = [(PKPeerPaymentActionViewController *)self cardBalance];
  BOOL v5 = [(PKPeerPaymentActionViewController *)self minBalance];
  int v6 = [(PKPeerPaymentActionViewController *)self maxBalance];
  id v7 = [(PKPeerPaymentActionViewController *)self minLoadAmount];
  id v8 = [(PKPeerPaymentActionViewController *)self maxLoadAmount];
  uint64_t v9 = [v4 decimalNumberByAdding:v3];
  uint64_t v10 = [MEMORY[0x1E4F28C28] notANumber];
  char v11 = [v3 isEqualToNumber:v10];

  BOOL v12 = [MEMORY[0x1E4F28C28] zero];
  uint64_t v13 = [v3 compare:v12];

  if (!v13
    || v8 && [v8 compare:v3] == -1
    || v7 && [v7 compare:v3] == 1
    || v5 && [v5 compare:v9] == 1)
  {
    char v14 = 0;
  }
  else
  {
    char v14 = v11 ^ 1;
    if (v6 && [v6 compare:v9] == -1) {
      char v14 = 0;
    }
  }

  return v14;
}

- (BOOL)_shouldShakeCard:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(PKPeerPaymentActionViewController *)self cardBalance];
  int v6 = [(PKPeerPaymentActionViewController *)self maxBalance];
  id v7 = [(PKPeerPaymentActionViewController *)self maxLoadAmount];
  if (v4)
  {
    id v8 = [MEMORY[0x1E4F28C28] notANumber];
    uint64_t v9 = [v4 compare:v8];

    if (v9)
    {
      uint64_t v10 = [v4 decimalNumberByAdding:v5];
      LOBYTE(v9) = v7 && [v7 compare:v4] == -1 || v6 && objc_msgSend(v6, "compare:", v10) == -1;
    }
  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v9;
}

- (void)_showNavigationBarSpinner:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(PKEnterCurrencyAmountPassView *)self->_amountPassView enterCurrencyAmountView];
  BOOL v6 = !v3;
  [v5 setEnabled:v6];

  id v8 = [(PKPeerPaymentActionAddMoneyViewController *)self navigationItem];
  if (v6) {
    [(PKPeerPaymentActionAddMoneyViewController *)self _addBarButton];
  }
  else {
  id v7 = [(PKPeerPaymentActionAddMoneyViewController *)self _spinnerBarButton];
  }
  [v8 setRightBarButtonItem:v7];
}

- (void)thresholdTopUpController:(id)a3 requestsPushViewController:(id)a4
{
  id v5 = a4;
  id v6 = [(PKPeerPaymentActionAddMoneyViewController *)self navigationController];
  [v6 pushViewController:v5 animated:1];
}

- (void)thresholdTopUpController:(id)a3 requestsDismissViewController:(id)a4
{
}

- (void)thresholdTopUpController:(id)a3 requestsPresentViewController:(id)a4
{
}

- (id)presentationSceneIdentifierForTopUpController:(id)a3
{
  BOOL v3 = [(PKPeerPaymentActionAddMoneyViewController *)self view];
  id v4 = [v3 window];
  id v5 = [v4 windowScene];
  id v6 = [v5 _sceneIdentifier];

  return v6;
}

- (void)thresholdTopUpControllerCompletedSetup:(id)a3
{
  id v4 = [(PKPeerPaymentActionAddMoneyViewController *)self navigationController];
  BOOL v3 = [v4 presentingViewController];
  [v3 dismissViewControllerAnimated:1 completion:0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footerContainer, 0);
  objc_storeStrong((id *)&self->_topUpController, 0);
  objc_storeStrong((id *)&self->_actionButton, 0);
  objc_storeStrong((id *)&self->_amountPassView, 0);
  objc_storeStrong((id *)&self->_suggestionView, 0);

  objc_storeStrong((id *)&self->_suggestionGenerator, 0);
}

@end