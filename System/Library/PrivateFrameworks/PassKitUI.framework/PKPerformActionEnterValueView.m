@interface PKPerformActionEnterValueView
- (BOOL)_isCurrentAmountValid;
- (BOOL)_shouldShakeCard:(id)a3;
- (BOOL)enterCurrencyAmountView:(id)a3 shouldChangeAmountFrom:(id)a4 to:(id)a5;
- (NSDecimalNumber)cardBalance;
- (NSDecimalNumber)maxLoadAmount;
- (NSDecimalNumber)maxLoadedBalance;
- (NSDecimalNumber)minLoadAmount;
- (NSDecimalNumber)minLoadedBalance;
- (PKPerformActionEnterValueView)init;
- (PKPerformActionEnterValueView)initWithPass:(id)a3 action:(id)a4 paymentDataProvider:(id)a5;
- (PKPerformActionViewDelegate)delegate;
- (UITextField)amountTextField;
- (double)_amountTopPadding;
- (id)pass;
- (id)transactionAmount;
- (id)transactionCurrency;
- (void)_createSubviews;
- (void)_currentAmountDidChangeTo:(id)a3 shouldGenerateNewSuggestions:(BOOL)a4;
- (void)_didTapSetUpAutoReloadButton;
- (void)_readCurrentBalance;
- (void)_updateCurrentAmount:(id)a3 shouldGenerateNewSuggestions:(BOOL)a4;
- (void)_updateCurrentBalanceWithUpdatedTransitProperties;
- (void)_updatePeerPaymentAccount;
- (void)dealloc;
- (void)enterCurrencyAmountViewDidChangeAmount:(id)a3;
- (void)fetchServiceProviderDataWithCompletion:(id)a3;
- (void)layoutSubviews;
- (void)numberPadSuggestionsView:(id)a3 didSelectSuggestion:(id)a4;
- (void)paymentPassWithUniqueIdentifier:(id)a3 didUpdateWithTransitPassProperties:(id)a4;
- (void)saveLastInputValues;
- (void)setCardBalance:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setMaxLoadAmount:(id)a3;
- (void)setMaxLoadedBalance:(id)a3;
- (void)setMinBalance:(id)a3;
- (void)setMinLoadAmount:(id)a3;
- (void)setMinLoadedBalance:(id)a3;
- (void)willDismissViewController;
@end

@implementation PKPerformActionEnterValueView

- (PKPerformActionEnterValueView)init
{
  return [(PKPerformActionEnterValueView *)self initWithPass:0 action:0 paymentDataProvider:0];
}

- (PKPerformActionEnterValueView)initWithPass:(id)a3 action:(id)a4 paymentDataProvider:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if ([v10 type] == 1)
  {
    v50.receiver = self;
    v50.super_class = (Class)PKPerformActionEnterValueView;
    v12 = [(PKPerformActionEnterValueView *)&v50 init];
    v13 = v12;
    if (v12)
    {
      objc_storeStrong((id *)&v12->_pass, a3);
      objc_storeStrong((id *)&v13->_action, a4);
      uint64_t v14 = [MEMORY[0x1E4F28C28] zero];
      cardBalance = v13->_cardBalance;
      v13->_cardBalance = (NSDecimalNumber *)v14;

      uint64_t v16 = [MEMORY[0x1E4F28C28] zero];
      currentAmount = v13->_currentAmount;
      v13->_currentAmount = (NSDecimalNumber *)v16;

      v18 = [v9 paymentPass];
      int v19 = [v18 hasAssociatedPeerPaymentAccount];

      if (v19)
      {
        uint64_t v20 = [MEMORY[0x1E4F84E00] sharedInstance];
        peerPaymentService = v13->_peerPaymentService;
        v13->_peerPaymentService = (PKPeerPaymentService *)v20;

        v22 = [MEMORY[0x1E4F28EB8] defaultCenter];
        [v22 addObserver:v13 selector:sel__peerPaymentAccountChanged_ name:*MEMORY[0x1E4F87CB0] object:v13->_peerPaymentService];

        [(PKPerformActionEnterValueView *)v13 _updatePeerPaymentAccount];
      }
      v23 = [v10 enteredValueItem];
      uint64_t v24 = [v23 minLoadAmount];
      minLoadAmount = v13->_minLoadAmount;
      v13->_minLoadAmount = (NSDecimalNumber *)v24;

      v26 = [v10 enteredValueItem];
      uint64_t v27 = [v26 maxLoadAmount];
      maxLoadAmount = v13->_maxLoadAmount;
      v13->_maxLoadAmount = (NSDecimalNumber *)v27;

      v29 = [v10 enteredValueItem];
      uint64_t v30 = [v29 minLoadedBalance];
      minLoadedBalance = v13->_minLoadedBalance;
      v13->_minLoadedBalance = (NSDecimalNumber *)v30;

      v32 = [v10 enteredValueItem];
      uint64_t v33 = [v32 maxLoadedBalance];
      maxLoadedBalance = v13->_maxLoadedBalance;
      v13->_maxLoadedBalance = (NSDecimalNumber *)v33;

      v35 = [(PKPass *)v13->_pass paymentPass];
      LODWORD(v32) = +[PKPaymentAutoReloadSetupController shouldOfferAutoReloadForPass:v35];

      if (v32) {
        v13->_shouldShowAutoReloadButton = 1;
      }
      objc_storeStrong((id *)&v13->_paymentServiceDataProvider, a5);
      if (objc_opt_respondsToSelector()) {
        [(PKPaymentDataProvider *)v13->_paymentServiceDataProvider addDelegate:v13];
      }
      v36 = objc_msgSend(v10, "enteredValueItem", 544);
      v37 = [v36 currency];

      uint64_t v38 = PKMaximumFractionDigitsForCurrencyCode();
      id v39 = objc_alloc(MEMORY[0x1E4F84810]);
      v40 = [v9 serialNumber];
      uint64_t v41 = [v39 initWithPassSerialNumber:v40];
      lastInput = v13->_lastInput;
      v13->_lastInput = (PKNumericSuggestionLastInput *)v41;

      uint64_t v43 = [objc_alloc(MEMORY[0x1E4F84818]) initWithLastInput:v13->_lastInput];
      suggestionGenerator = v13->_suggestionGenerator;
      v13->_suggestionGenerator = (PKNumericSuggestionsEnterValueAlgorithm *)v43;

      [(PKNumericSuggestionsEnterValueAlgorithm *)v13->_suggestionGenerator setPowerOfTenFactor:3 - v38];
      [(PKNumericSuggestionsEnterValueAlgorithm *)v13->_suggestionGenerator setDecimalPrecision:v38];
      [(PKNumericSuggestionsEnterValueAlgorithm *)v13->_suggestionGenerator setCurrencyCode:v37];
      [(PKNumericSuggestionsEnterValueAlgorithm *)v13->_suggestionGenerator setCardBalance:v13->_cardBalance];
      [(PKNumericSuggestionsEnterValueAlgorithm *)v13->_suggestionGenerator setMaxLoadAmount:*(Class *)((char *)&v13->super.super.super.isa + v49)];
      [(PKNumericSuggestionsEnterValueAlgorithm *)v13->_suggestionGenerator setMinLoadAmount:v13->_minLoadAmount];
      [(PKNumericSuggestionsEnterValueAlgorithm *)v13->_suggestionGenerator setMinBalance:v13->_minLoadedBalance];
      [(PKNumericSuggestionsEnterValueAlgorithm *)v13->_suggestionGenerator setMaxBalance:v13->_maxLoadedBalance];
      v45 = v13->_suggestionGenerator;
      v46 = [(PKPaymentPassAction *)v13->_action enteredValueItem];
      v47 = [v46 defaultSuggestions];
      [(PKNumericSuggestionsEnterValueAlgorithm *)v45 setDefaultValues:v47];

      [(PKPerformActionEnterValueView *)v13 _createSubviews];
      [(PKPerformActionEnterValueView *)v13 _updateCurrentAmount:v13->_currentAmount shouldGenerateNewSuggestions:1];
      [(PKPerformActionEnterValueView *)v13 _readCurrentBalance];
    }
  }
  else
  {

    v13 = 0;
  }

  return v13;
}

- (void)dealloc
{
  if (objc_opt_respondsToSelector()) {
    [(PKPaymentDataProvider *)self->_paymentServiceDataProvider removeDelegate:self];
  }
  v3.receiver = self;
  v3.super_class = (Class)PKPerformActionEnterValueView;
  [(PKPerformActionEnterValueView *)&v3 dealloc];
}

- (void)layoutSubviews
{
  v37.receiver = self;
  v37.super_class = (Class)PKPerformActionEnterValueView;
  [(PKPerformActionEnterValueView *)&v37 layoutSubviews];
  [(PKPerformActionEnterValueView *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  double v8 = v7;
  CGFloat v10 = v9;
  [(PKPerformActionEnterValueView *)self _amountTopPadding];
  double v35 = v11;
  -[PKEnterCurrencyAmountView sizeThatFits:](self->_enterCurrencyAmountView, "sizeThatFits:", v8, 1.79769313e308);
  double v13 = v12;
  v38.origin.x = v4;
  v38.origin.y = v6;
  v38.size.width = v8;
  v38.size.height = v10;
  double MinX = CGRectGetMinX(v38);
  v39.origin.x = v4;
  v39.origin.y = v6;
  CGFloat v14 = v6;
  v39.size.width = v8;
  v39.size.height = v10;
  double Width = CGRectGetWidth(v39);
  -[PKEnterCurrencyAmountView setFrame:](self->_enterCurrencyAmountView, "setFrame:", MinX, v35, Width, v13);
  -[PKEnterValueNewBalanceView sizeThatFits:](self->_newBalanceView, "sizeThatFits:", v8, 1.79769313e308);
  double v17 = v16;
  v40.origin.x = v4;
  v40.origin.y = v14;
  v40.size.width = v8;
  v40.size.height = v10;
  double v18 = CGRectGetMinX(v40);
  v41.origin.x = MinX;
  v41.origin.y = v35;
  v41.size.width = Width;
  v41.size.height = v13;
  double v19 = CGRectGetMaxY(v41) + 6.0;
  v42.origin.x = v4;
  v42.origin.y = v14;
  v42.size.width = v8;
  v42.size.height = v10;
  double v36 = v17;
  -[PKEnterValueNewBalanceView setFrame:](self->_newBalanceView, "setFrame:", v18, v19, CGRectGetWidth(v42), v17);
  [(PKNumberPadSuggestionsView *)self->_suggestionView frame];
  CGFloat v21 = v20;
  CGFloat v23 = v22;
  CGFloat v25 = v24;
  -[PKNumberPadSuggestionsView setFrame:](self->_suggestionView, "setFrame:");
  if (self->_shouldShowAutoReloadButton)
  {
    [(PKEnterCurrencyAmountView *)self->_enterCurrencyAmountView defaultKeyboardSize];
    double v33 = v19;
    double v27 = v26;
    v43.origin.x = v21;
    v43.origin.y = v23;
    v43.size.width = v8;
    v43.size.height = v25;
    double v28 = v27 + CGRectGetHeight(v43);
    -[UIButton sizeThatFits:](self->_autoReloadButton, "sizeThatFits:", v8, 1.79769313e308);
    double v30 = v29;
    v44.origin.x = v4;
    v44.origin.y = v14;
    v44.size.width = v8;
    v44.size.height = v10;
    double v31 = CGRectGetMinX(v44);
    v45.origin.x = v4;
    v45.origin.y = v14;
    v45.size.width = v8;
    v45.size.height = v10;
    double v32 = CGRectGetWidth(v45);
    v46.origin.x = v4;
    v46.origin.y = v14;
    v46.size.width = v8;
    v46.size.height = v10;
    -[UIButton setFrame:](self->_autoReloadButton, "setFrame:", v31, v36 + v33 + (CGRectGetMaxY(v46) - v28 - v30 - v33 - v36 + 15.0) * 0.5, v32, v30);
  }
}

- (id)pass
{
  return self->_pass;
}

- (id)transactionAmount
{
  return self->_currentAmount;
}

- (id)transactionCurrency
{
  v2 = [(PKPaymentPassAction *)self->_action enteredValueItem];
  double v3 = [v2 currency];

  return v3;
}

- (void)fetchServiceProviderDataWithCompletion:(id)a3
{
  action = self->_action;
  double v5 = (void (**)(id, void *))a3;
  CGFloat v6 = [(PKPaymentPassAction *)action enteredValueItem];
  double v7 = [v6 serviceProviderData];
  id v10 = (id)[v7 mutableCopy];

  currentAmount = self->_currentAmount;
  if (currentAmount) {
    [v10 setObject:currentAmount forKey:*MEMORY[0x1E4F87D38]];
  }
  double v9 = (void *)[v10 copy];
  v5[2](v5, v9);
}

- (void)willDismissViewController
{
}

- (void)setCardBalance:(id)a3
{
  double v5 = (NSDecimalNumber *)a3;
  CGFloat v6 = v5;
  p_cardBalance = &self->_cardBalance;
  if (self->_cardBalance != v5)
  {
    double v12 = v5;
    char v8 = -[NSDecimalNumber isEqualToNumber:](v5, "isEqualToNumber:");
    CGFloat v6 = v12;
    if ((v8 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_cardBalance, a3);
      if (!*p_cardBalance)
      {
        uint64_t v9 = [MEMORY[0x1E4F28C28] zero];
        id v10 = *p_cardBalance;
        *p_cardBalance = (NSDecimalNumber *)v9;
      }
      -[PKNumericSuggestionsEnterValueAlgorithm setCardBalance:](self->_suggestionGenerator, "setCardBalance:");
      [(PKEnterValueNewBalanceView *)self->_newBalanceView setCardBalance:*p_cardBalance];
      double v11 = [MEMORY[0x1E4F28C28] zero];
      [(PKPerformActionEnterValueView *)self _updateCurrentAmount:v11 shouldGenerateNewSuggestions:1];

      CGFloat v6 = v12;
    }
  }
}

- (void)setMaxLoadedBalance:(id)a3
{
  double v5 = (NSDecimalNumber *)a3;
  CGFloat v6 = v5;
  p_maxLoadedBalance = &self->_maxLoadedBalance;
  if (self->_maxLoadedBalance != v5)
  {
    id v10 = v5;
    char v8 = -[NSDecimalNumber isEqualToNumber:](v5, "isEqualToNumber:");
    CGFloat v6 = v10;
    if ((v8 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_maxLoadedBalance, a3);
      [(PKNumericSuggestionsEnterValueAlgorithm *)self->_suggestionGenerator setMaxBalance:*p_maxLoadedBalance];
      [(PKEnterValueNewBalanceView *)self->_newBalanceView setMaxBalance:*p_maxLoadedBalance];
      uint64_t v9 = [MEMORY[0x1E4F28C28] zero];
      [(PKPerformActionEnterValueView *)self _updateCurrentAmount:v9 shouldGenerateNewSuggestions:1];

      CGFloat v6 = v10;
    }
  }
}

- (void)setMinBalance:(id)a3
{
  double v5 = (NSDecimalNumber *)a3;
  CGFloat v6 = v5;
  if (self->_minLoadedBalance != v5)
  {
    uint64_t v9 = v5;
    char v7 = -[NSDecimalNumber isEqualToNumber:](v5, "isEqualToNumber:");
    CGFloat v6 = v9;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_minLoadedBalance, a3);
      [(PKNumericSuggestionsEnterValueAlgorithm *)self->_suggestionGenerator setMinBalance:self->_minLoadedBalance];
      char v8 = [MEMORY[0x1E4F28C28] zero];
      [(PKPerformActionEnterValueView *)self _updateCurrentAmount:v8 shouldGenerateNewSuggestions:1];

      CGFloat v6 = v9;
    }
  }
}

- (void)setDelegate:(id)a3
{
  p_delegate = &self->_delegate;
  id v6 = a3;
  id v5 = objc_storeWeak((id *)p_delegate, v6);
  objc_msgSend(v6, "setRightBarButtonEnabled:", -[PKPerformActionEnterValueView _isCurrentAmountValid](self, "_isCurrentAmountValid"));
}

- (void)saveLastInputValues
{
  if (self->_maxLoadedBalance)
  {
    double v3 = [(NSDecimalNumber *)self->_currentAmount decimalNumberByAdding:self->_cardBalance];
    uint64_t v4 = [v3 isEqualToNumber:self->_maxLoadedBalance];
  }
  else
  {
    uint64_t v4 = 0;
  }
  [(PKNumericSuggestionLastInput *)self->_lastInput setWentToMax:v4];
  [(PKNumericSuggestionLastInput *)self->_lastInput setValue:self->_currentAmount];
  lastInput = self->_lastInput;

  [(PKNumericSuggestionLastInput *)lastInput save];
}

- (UITextField)amountTextField
{
  return [(PKEnterCurrencyAmountView *)self->_enterCurrencyAmountView amountTextField];
}

- (void)paymentPassWithUniqueIdentifier:(id)a3 didUpdateWithTransitPassProperties:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __100__PKPerformActionEnterValueView_paymentPassWithUniqueIdentifier_didUpdateWithTransitPassProperties___block_invoke;
  block[3] = &unk_1E59CA8E8;
  block[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __100__PKPerformActionEnterValueView_paymentPassWithUniqueIdentifier_didUpdateWithTransitPassProperties___block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(*(void *)(a1 + 32) + 448) uniqueID];
  if (PKEqualObjects())
  {
    char v2 = PKEqualObjects();

    if ((v2 & 1) == 0)
    {
      objc_storeStrong((id *)(*(void *)(a1 + 32) + 480), *(id *)(a1 + 48));
      double v3 = *(void **)(a1 + 32);
      [v3 _updateCurrentBalanceWithUpdatedTransitProperties];
    }
  }
  else
  {
  }
}

- (void)numberPadSuggestionsView:(id)a3 didSelectSuggestion:(id)a4
{
  id v5 = a4;
  id v6 = [v5 value];
  BOOL v7 = [(PKPerformActionEnterValueView *)self _shouldShakeCard:v6];

  id v8 = [v5 value];
  int v9 = [v5 usedMaximumSuggestion];

  [(PKPerformActionEnterValueView *)self _updateCurrentAmount:v8 shouldGenerateNewSuggestions:v9 | v7];
  if (v7)
  {
    id v10 = [(PKPerformActionEnterValueView *)self delegate];
    [v10 shakeCard];
  }
}

- (BOOL)enterCurrencyAmountView:(id)a3 shouldChangeAmountFrom:(id)a4 to:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if ([(PKPerformActionEnterValueView *)self _shouldShakeCard:v8])
  {
    int v9 = [(PKPerformActionEnterValueView *)self delegate];
    [v9 shakeCard];
  }
  id v10 = [(NSDecimalNumber *)self->_cardBalance decimalNumberByAdding:v7];
  id v11 = [(NSDecimalNumber *)self->_cardBalance decimalNumberByAdding:v8];

  maxLoadedBalance = self->_maxLoadedBalance;
  BOOL v13 = !maxLoadedBalance
     || [(NSDecimalNumber *)maxLoadedBalance compare:v10] != NSOrderedAscending
     || [(NSDecimalNumber *)self->_maxLoadedBalance compare:v11] != NSOrderedAscending
     || [v10 compare:v11] == 1;

  return v13;
}

- (void)enterCurrencyAmountViewDidChangeAmount:(id)a3
{
  id v4 = [a3 currentAmount];
  currentAmount = self->_currentAmount;
  self->_currentAmount = v4;
  id v6 = v4;

  [(PKEnterValueNewBalanceView *)self->_newBalanceView addAmountToBalance:v6];
  [(PKPerformActionEnterValueView *)self _currentAmountDidChangeTo:v6 shouldGenerateNewSuggestions:1];
}

- (void)_updatePeerPaymentAccount
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__PKPerformActionEnterValueView__updatePeerPaymentAccount__block_invoke;
  block[3] = &unk_1E59CA7D0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __58__PKPerformActionEnterValueView__updatePeerPaymentAccount__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 512) account];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 520);
  *(void *)(v3 + 520) = v2;

  id v5 = [*(id *)(*(void *)(a1 + 32) + 520) currentBalance];
  id v10 = [v5 amount];

  if (v10
    && ([MEMORY[0x1E4F28C28] notANumber],
        id v6 = objc_claimAutoreleasedReturnValue(),
        int v7 = [v10 isEqual:v6],
        v6,
        !v7))
  {
    id v9 = v10;
  }
  else
  {
    uint64_t v8 = [MEMORY[0x1E4F28C28] zero];

    id v9 = (id)v8;
  }
  id v11 = v9;
  [*(id *)(a1 + 32) setCardBalance:v9];
}

- (void)_readCurrentBalance
{
  uint64_t v3 = [(PKPass *)self->_pass paymentPass];
  id v4 = v3;
  if (v3)
  {
    if ([v3 hasAssociatedPeerPaymentAccount])
    {
      id v5 = [(PKPeerPaymentAccount *)self->_peerPaymentAccount currentBalance];
      id v6 = [v5 amount];

      if (!v6
        || ([MEMORY[0x1E4F28C28] notANumber],
            int v7 = objc_claimAutoreleasedReturnValue(),
            int v8 = [v6 isEqual:v7],
            v7,
            v8))
      {
        uint64_t v9 = [MEMORY[0x1E4F28C28] zero];

        id v6 = (id)v9;
      }
      [(PKPerformActionEnterValueView *)self setCardBalance:v6];
      goto LABEL_20;
    }
    id v10 = [v4 devicePrimaryPaymentApplication];
    v37[0] = 0;
    v37[1] = v37;
    v37[2] = 0x3032000000;
    v37[3] = __Block_byref_object_copy__61;
    v37[4] = __Block_byref_object_dispose__61;
    id v38 = [(PKPaymentPassAction *)self->_action associatedEnteredValueIdentifier];
    v35[0] = 0;
    v35[1] = v35;
    v35[2] = 0x2020000000;
    char v36 = 0;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __52__PKPerformActionEnterValueView__readCurrentBalance__block_invoke;
    aBlock[3] = &unk_1E59DED48;
    id v6 = v10;
    id v31 = v6;
    id v32 = v4;
    double v33 = self;
    v34 = v35;
    id v11 = _Block_copy(aBlock);
    if ([(PKPass *)self->_pass isRemotePass])
    {
      id v12 = objc_alloc_init(getNPKCompanionAgentConnectionClass_7());
      if (objc_opt_respondsToSelector())
      {
        BOOL v13 = [(PKPass *)self->_pass uniqueID];
        v28[0] = MEMORY[0x1E4F143A8];
        v28[1] = 3221225472;
        v28[2] = __52__PKPerformActionEnterValueView__readCurrentBalance__block_invoke_2;
        v28[3] = &unk_1E59DED70;
        id v29 = v11;
        [v12 transitStateWithPassUniqueIdentifier:v13 paymentApplication:v6 completion:v28];
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) == 0) {
        goto LABEL_13;
      }
      paymentServiceDataProvider = self->_paymentServiceDataProvider;
      v15 = [(PKPass *)self->_pass uniqueID];
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __52__PKPerformActionEnterValueView__readCurrentBalance__block_invoke_4;
      v26[3] = &unk_1E59DED70;
      id v27 = v11;
      [(PKPaymentDataProvider *)paymentServiceDataProvider transitStateWithPassUniqueIdentifier:v15 paymentApplication:v6 completion:v26];

      id v12 = v27;
    }

LABEL_13:
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __52__PKPerformActionEnterValueView__readCurrentBalance__block_invoke_6;
    v25[3] = &unk_1E59DEDC0;
    v25[6] = v35;
    v25[4] = self;
    v25[5] = v37;
    double v16 = _Block_copy(v25);
    if ([(PKPass *)self->_pass isRemotePass])
    {
      id v17 = objc_alloc_init(getNPKCompanionAgentConnectionClass_7());
      if (objc_opt_respondsToSelector())
      {
        double v18 = [(PKPass *)self->_pass uniqueID];
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __52__PKPerformActionEnterValueView__readCurrentBalance__block_invoke_8;
        v23[3] = &unk_1E59CACA8;
        id v24 = v16;
        [v17 balancesForPaymentPassWithUniqueIdentifier:v18 completion:v23];
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) == 0)
      {
LABEL_19:

        _Block_object_dispose(v35, 8);
        _Block_object_dispose(v37, 8);

LABEL_20:
        goto LABEL_21;
      }
      double v19 = self->_paymentServiceDataProvider;
      double v20 = [(PKPass *)self->_pass uniqueID];
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __52__PKPerformActionEnterValueView__readCurrentBalance__block_invoke_10;
      v21[3] = &unk_1E59CACA8;
      id v22 = v16;
      [(PKPaymentDataProvider *)v19 balancesForPaymentPassWithUniqueIdentifier:v20 completion:v21];

      id v17 = v22;
    }

    goto LABEL_19;
  }
LABEL_21:
}

void __52__PKPerformActionEnterValueView__readCurrentBalance__block_invoke(uint64_t a1, void *a2)
{
  id obj = [a2 transitPassPropertiesWithPaymentApplication:*(void *)(a1 + 32) pass:*(void *)(a1 + 40)];
  uint64_t v3 = [obj balanceAmount];
  if (v3)
  {
    id v4 = (void *)v3;
    char v5 = PKEqualObjects();

    if ((v5 & 1) == 0)
    {
      objc_storeStrong((id *)(*(void *)(a1 + 48) + 480), obj);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
      [*(id *)(a1 + 48) _updateCurrentBalanceWithUpdatedTransitProperties];
    }
  }
}

void __52__PKPerformActionEnterValueView__readCurrentBalance__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __52__PKPerformActionEnterValueView__readCurrentBalance__block_invoke_3;
  v6[3] = &unk_1E59CAD68;
  id v4 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __52__PKPerformActionEnterValueView__readCurrentBalance__block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __52__PKPerformActionEnterValueView__readCurrentBalance__block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __52__PKPerformActionEnterValueView__readCurrentBalance__block_invoke_5;
  v6[3] = &unk_1E59CAD68;
  id v4 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __52__PKPerformActionEnterValueView__readCurrentBalance__block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __52__PKPerformActionEnterValueView__readCurrentBalance__block_invoke_6(void *a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = [a2 allObjects];
  uint64_t v3 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v19;
    id v15 = (id)*MEMORY[0x1E4F87980];
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v19 != v5) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v8 = *(void *)(a1[5] + 8);
        uint64_t v10 = *(void *)(v8 + 40);
        uint64_t v9 = (id *)(v8 + 40);
        if (!v10 && !*(unsigned char *)(*(void *)(a1[6] + 8) + 24)) {
          objc_storeStrong(v9, v15);
        }
        id v11 = [v7 identifiers];
        v17[0] = MEMORY[0x1E4F143A8];
        v17[1] = 3221225472;
        v17[2] = __52__PKPerformActionEnterValueView__readCurrentBalance__block_invoke_7;
        v17[3] = &unk_1E59DED98;
        v17[4] = a1[5];
        int v12 = objc_msgSend(v11, "pk_hasObjectPassingTest:", v17);

        if (v12)
        {
          BOOL v13 = (void *)a1[4];
          CGFloat v14 = [v7 value];
          [v13 setCardBalance:v14];
        }
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v4);
  }
}

BOOL __52__PKPerformActionEnterValueView__readCurrentBalance__block_invoke_7(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v5 = v3;
  id v6 = v5;
  if (v4 == v5)
  {
    BOOL v7 = 1;
  }
  else
  {
    BOOL v7 = 0;
    if (v5 && v4) {
      BOOL v7 = [v4 caseInsensitiveCompare:v5] == 0;
    }
  }

  return v7;
}

void __52__PKPerformActionEnterValueView__readCurrentBalance__block_invoke_8(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __52__PKPerformActionEnterValueView__readCurrentBalance__block_invoke_9;
  v6[3] = &unk_1E59CAD68;
  id v4 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __52__PKPerformActionEnterValueView__readCurrentBalance__block_invoke_9(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __52__PKPerformActionEnterValueView__readCurrentBalance__block_invoke_10(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __52__PKPerformActionEnterValueView__readCurrentBalance__block_invoke_11;
  v6[3] = &unk_1E59CAD68;
  id v4 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __52__PKPerformActionEnterValueView__readCurrentBalance__block_invoke_11(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)_updateCurrentBalanceWithUpdatedTransitProperties
{
  uint64_t v3 = [(PKTransitPassProperties *)self->_transitProperties balance];
  id v7 = (id)v3;
  if (v3
    && (objc_msgSend(MEMORY[0x1E4F28C28], "notANumber", v3),
        id v4 = objc_claimAutoreleasedReturnValue(),
        char v5 = [v7 isEqualToNumber:v4],
        v4,
        uint64_t v3 = (uint64_t)v7,
        (v5 & 1) == 0))
  {
    [(PKPerformActionEnterValueView *)self setCardBalance:v7];
  }
  else
  {
    id v6 = objc_msgSend(MEMORY[0x1E4F28C28], "zero", v3);
    [(PKPerformActionEnterValueView *)self setCardBalance:v6];
  }
}

- (BOOL)_shouldShakeCard:(id)a3
{
  id v4 = a3;
  if (v4
    && ([MEMORY[0x1E4F28C28] notANumber],
        char v5 = objc_claimAutoreleasedReturnValue(),
        uint64_t v6 = [v4 compare:v5],
        v5,
        v6))
  {
    id v7 = [v4 decimalNumberByAdding:self->_cardBalance];
    id v8 = [v7 stringValue];
    unint64_t v9 = [v8 length];

    BOOL v10 = 1;
    if (v9 <= 7)
    {
      maxLoadAmount = self->_maxLoadAmount;
      if (!maxLoadAmount || [(NSDecimalNumber *)maxLoadAmount compare:v4] != NSOrderedAscending)
      {
        maxLoadedBalance = self->_maxLoadedBalance;
        if (!maxLoadedBalance || [(NSDecimalNumber *)maxLoadedBalance compare:v7] != NSOrderedAscending) {
          BOOL v10 = 0;
        }
      }
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (double)_amountTopPadding
{
  if (PKUIGetMinScreenWidthType()
    && ([(PKPerformActionEnterValueView *)self traitCollection],
        uint64_t v3 = objc_claimAutoreleasedReturnValue(),
        uint64_t v4 = [v3 verticalSizeClass],
        v3,
        v4 != 1))
  {
    return 44.0;
  }
  else
  {
    return 6.0;
  }
}

- (void)_updateCurrentAmount:(id)a3 shouldGenerateNewSuggestions:(BOOL)a4
{
  BOOL v4 = a4;
  objc_storeStrong((id *)&self->_currentAmount, a3);
  id v7 = a3;
  [(PKEnterValueNewBalanceView *)self->_newBalanceView addAmountToBalance:v7];
  [(PKEnterCurrencyAmountView *)self->_enterCurrencyAmountView setCurrentAmount:v7];
  [(PKPerformActionEnterValueView *)self _currentAmountDidChangeTo:v7 shouldGenerateNewSuggestions:v4];
}

- (void)_currentAmountDidChangeTo:(id)a3 shouldGenerateNewSuggestions:(BOOL)a4
{
  if (a4)
  {
    char v5 = [(PKNumericSuggestionsEnterValueAlgorithm *)self->_suggestionGenerator suggestionsWithAmount:a3];
    [(PKNumberPadSuggestionsView *)self->_suggestionView setSuggestions:v5];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "setRightBarButtonEnabled:", -[PKPerformActionEnterValueView _isCurrentAmountValid](self, "_isCurrentAmountValid"));

  [(PKPerformActionEnterValueView *)self setNeedsLayout];
}

- (BOOL)_isCurrentAmountValid
{
  uint64_t v3 = self->_currentAmount;
  BOOL v4 = [MEMORY[0x1E4F28C28] notANumber];
  char v5 = [(NSDecimalNumber *)v3 isEqualToNumber:v4];

  uint64_t v6 = [(NSDecimalNumber *)v3 decimalNumberByAdding:self->_cardBalance];
  id v7 = [MEMORY[0x1E4F28C28] zero];
  uint64_t v8 = [(NSDecimalNumber *)v3 compare:v7];

  if (!v8
    || (maxLoadedBalance = self->_maxLoadedBalance) != 0
    && [(NSDecimalNumber *)maxLoadedBalance compare:v6] == NSOrderedAscending
    || (minLoadedBalance = self->_minLoadedBalance) != 0
    && [(NSDecimalNumber *)minLoadedBalance compare:v6] == NSOrderedDescending
    || self->_minLoadAmount && -[NSDecimalNumber compare:](self->_currentAmount, "compare:") == NSOrderedAscending)
  {
    char v11 = 0;
  }
  else
  {
    char v11 = v5 ^ 1;
    if (self->_maxLoadAmount && -[NSDecimalNumber compare:](self->_currentAmount, "compare:") == NSOrderedDescending) {
      char v11 = 0;
    }
  }

  return v11;
}

- (void)_createSubviews
{
  double v3 = *MEMORY[0x1E4FB09E0];
  PKRoundedSystemFontOfSizeAndWeight(60.0, *MEMORY[0x1E4FB09E0]);
  id v20 = (id)objc_claimAutoreleasedReturnValue();
  BOOL v4 = PKRoundedSystemFontOfSizeAndWeight(36.0, v3);
  char v5 = [(PKPaymentPassAction *)self->_action enteredValueItem];
  uint64_t v6 = [v5 currency];

  id v7 = [[PKEnterCurrencyAmountView alloc] initWithCurrency:v6 amount:self->_currentAmount];
  enterCurrencyAmountView = self->_enterCurrencyAmountView;
  self->_enterCurrencyAmountView = v7;

  [(PKEnterCurrencyAmountView *)self->_enterCurrencyAmountView setDelegate:self];
  [(PKEnterCurrencyAmountView *)self->_enterCurrencyAmountView setAmountFont:v20];
  [(PKEnterCurrencyAmountView *)self->_enterCurrencyAmountView setCurrencySymbolFont:v4];
  [(PKEnterCurrencyAmountView *)self->_enterCurrencyAmountView setKerning:&unk_1EF2B8980];
  [(PKPerformActionEnterValueView *)self addSubview:self->_enterCurrencyAmountView];
  if ([(PKNumericSuggestionsEnterValueAlgorithm *)self->_suggestionGenerator hasValidDefaultSuggestions])
  {
    unint64_t v9 = [[PKNumberPadSuggestionsView alloc] initWithDefaultFrame];
    suggestionView = self->_suggestionView;
    self->_suggestionView = v9;

    [(PKNumberPadSuggestionsView *)self->_suggestionView setDelegate:self];
    [(PKEnterCurrencyAmountView *)self->_enterCurrencyAmountView setInputAccessoryView:self->_suggestionView];
  }
  char v11 = [PKEnterValueNewBalanceView alloc];
  int v12 = [(PKPaymentPassAction *)self->_action enteredValueItem];
  BOOL v13 = [v12 currency];
  CGFloat v14 = [(PKEnterValueNewBalanceView *)v11 initWithCurrencyCode:v13];
  newBalanceView = self->_newBalanceView;
  self->_newBalanceView = v14;

  [(PKEnterValueNewBalanceView *)self->_newBalanceView setMaxBalance:self->_maxLoadedBalance];
  [(PKEnterValueNewBalanceView *)self->_newBalanceView setMinBalance:self->_minLoadedBalance];
  [(PKEnterValueNewBalanceView *)self->_newBalanceView setMinLoadAmount:self->_minLoadAmount];
  [(PKEnterValueNewBalanceView *)self->_newBalanceView setMaxLoadAmount:self->_maxLoadAmount];
  [(PKEnterValueNewBalanceView *)self->_newBalanceView setCardBalance:self->_cardBalance];
  [(PKEnterValueNewBalanceView *)self->_newBalanceView sizeToFit];
  [(PKPerformActionEnterValueView *)self addSubview:self->_newBalanceView];
  if (self->_shouldShowAutoReloadButton)
  {
    double v16 = (UIButton *)objc_alloc_init(MEMORY[0x1E4FB14D0]);
    autoReloadButton = self->_autoReloadButton;
    self->_autoReloadButton = v16;

    long long v18 = [MEMORY[0x1E4FB14D8] plainButtonConfiguration];
    [v18 setTitleLineBreakMode:4];
    [v18 setTitleAlignment:2];
    long long v19 = PKLocalizedPaymentString(&cfstr_PassDetailsSet_2.isa);
    [v18 setTitle:v19];

    [(UIButton *)self->_autoReloadButton setConfiguration:v18];
    [(UIButton *)self->_autoReloadButton addTarget:self action:sel__didTapSetUpAutoReloadButton forControlEvents:64];
    [(UIButton *)self->_autoReloadButton setAccessibilityIdentifier:*MEMORY[0x1E4F85258]];
    [(PKPerformActionEnterValueView *)self addSubview:self->_autoReloadButton];
  }
}

- (void)_didTapSetUpAutoReloadButton
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    BOOL v4 = WeakRetained;
    id v5 = objc_loadWeakRetained((id *)p_delegate);
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      id v7 = objc_loadWeakRetained((id *)p_delegate);
      [v7 didTapSetUpAutoReloadButton];
    }
  }
}

- (PKPerformActionViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKPerformActionViewDelegate *)WeakRetained;
}

- (NSDecimalNumber)cardBalance
{
  return self->_cardBalance;
}

- (NSDecimalNumber)minLoadAmount
{
  return self->_minLoadAmount;
}

- (void)setMinLoadAmount:(id)a3
{
}

- (NSDecimalNumber)maxLoadAmount
{
  return self->_maxLoadAmount;
}

- (void)setMaxLoadAmount:(id)a3
{
}

- (NSDecimalNumber)minLoadedBalance
{
  return self->_minLoadedBalance;
}

- (void)setMinLoadedBalance:(id)a3
{
}

- (NSDecimalNumber)maxLoadedBalance
{
  return self->_maxLoadedBalance;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maxLoadedBalance, 0);
  objc_storeStrong((id *)&self->_minLoadedBalance, 0);
  objc_storeStrong((id *)&self->_maxLoadAmount, 0);
  objc_storeStrong((id *)&self->_minLoadAmount, 0);
  objc_storeStrong((id *)&self->_cardBalance, 0);
  objc_storeStrong((id *)&self->_peerPaymentAccount, 0);
  objc_storeStrong((id *)&self->_peerPaymentService, 0);
  objc_storeStrong((id *)&self->_paymentServiceDataProvider, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_currentAmount, 0);
  objc_storeStrong((id *)&self->_transitProperties, 0);
  objc_storeStrong((id *)&self->_lastInput, 0);
  objc_storeStrong((id *)&self->_suggestionGenerator, 0);
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_pass, 0);
  objc_storeStrong((id *)&self->_autoReloadButton, 0);
  objc_storeStrong((id *)&self->_suggestionView, 0);
  objc_storeStrong((id *)&self->_newBalanceView, 0);

  objc_storeStrong((id *)&self->_enterCurrencyAmountView, 0);
}

@end