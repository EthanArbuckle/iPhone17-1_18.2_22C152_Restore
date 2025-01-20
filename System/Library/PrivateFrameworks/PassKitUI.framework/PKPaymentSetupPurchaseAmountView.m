@interface PKPaymentSetupPurchaseAmountView
- (BOOL)_isAmountValid:(id)a3;
- (BOOL)_shouldShakeCard:(id)a3;
- (BOOL)displayingBalanceErrorMessage;
- (BOOL)enterCurrencyAmountView:(id)a3 shouldChangeAmountFrom:(id)a4 to:(id)a5;
- (CGSize)defaultKeyboardSize;
- (NSDecimalNumber)currentAmount;
- (NSDecimalNumber)depositAmount;
- (NSDecimalNumber)maxLoadedBalance;
- (NSDecimalNumber)minLoadedBalance;
- (NSLayoutConstraint)centeringConstraint;
- (NSLayoutConstraint)fixedConstraint;
- (NSString)currency;
- (PKEnterCurrencyAmountView)enterCurrencyAmountView;
- (PKNumberPadSuggestionsView)suggestionView;
- (PKNumericSuggestionsEnterValueAlgorithm)suggestionGenerator;
- (PKPaymentProvisioningMethodMetadata)provisioningMethodMetadata;
- (PKPaymentSetupProduct)product;
- (PKPaymentSetupPurchaseAmountView)initWithProduct:(id)a3 provisioningMethodMetadata:(id)a4;
- (PKPaymentSetupPurchaseAmountViewDelegate)delegate;
- (UILabel)messageLabel;
- (UIStackView)amountStackView;
- (UITextField)amountTextField;
- (UIView)centeringView;
- (id)_defaultSuggestions;
- (id)_defaultValues;
- (void)_createConstraints;
- (void)_createSubviews;
- (void)_updateCurrentAmount:(id)a3;
- (void)_updateMessageLabelForAmount:(id)a3;
- (void)enterCurrencyAmountViewDidChangeAmount:(id)a3;
- (void)enterCurrencyAmountViewDidLayoutKeyboard:(id)a3;
- (void)layoutSubviews;
- (void)numberPadSuggestionsView:(id)a3 didSelectSuggestion:(id)a4;
- (void)setAmountStackView:(id)a3;
- (void)setCenteringConstraint:(id)a3;
- (void)setCenteringView:(id)a3;
- (void)setCurrency:(id)a3;
- (void)setCurrentAmount:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDepositAmount:(id)a3;
- (void)setDisplayingBalanceErrorMessage:(BOOL)a3;
- (void)setEnterCurrencyAmountView:(id)a3;
- (void)setFixedConstraint:(id)a3;
- (void)setMaxLoadedBalance:(id)a3;
- (void)setMessageLabel:(id)a3;
- (void)setMinLoadedBalance:(id)a3;
- (void)setProduct:(id)a3;
- (void)setProvisioningMethodMetadata:(id)a3;
- (void)setSuggestionGenerator:(id)a3;
- (void)setSuggestionView:(id)a3;
- (void)updateConstraints;
@end

@implementation PKPaymentSetupPurchaseAmountView

- (PKPaymentSetupPurchaseAmountView)initWithProduct:(id)a3 provisioningMethodMetadata:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v26.receiver = self;
  v26.super_class = (Class)PKPaymentSetupPurchaseAmountView;
  v9 = [(PKPaymentSetupPurchaseAmountView *)&v26 init];
  if (v9)
  {
    uint64_t v10 = [MEMORY[0x1E4F28C28] zero];
    currentAmount = v9->_currentAmount;
    v9->_currentAmount = (NSDecimalNumber *)v10;

    objc_storeStrong((id *)&v9->_product, a3);
    objc_storeStrong((id *)&v9->_provisioningMethodMetadata, a4);
    uint64_t v12 = [v8 currency];
    currency = v9->_currency;
    v9->_currency = (NSString *)v12;

    v14 = [v8 depositAmount];
    v15 = v14;
    if (!v14)
    {
      v15 = [MEMORY[0x1E4F28C28] zero];
    }
    objc_storeStrong((id *)&v9->_depositAmount, v15);
    if (!v14) {

    }
    uint64_t v16 = [v8 minLoadedBalance];
    minLoadedBalance = v9->_minLoadedBalance;
    v9->_minLoadedBalance = (NSDecimalNumber *)v16;

    uint64_t v18 = [v8 maxLoadedBalance];
    maxLoadedBalance = v9->_maxLoadedBalance;
    v9->_maxLoadedBalance = (NSDecimalNumber *)v18;

    uint64_t v20 = PKMaximumFractionDigitsForCurrencyCode();
    v21 = (PKNumericSuggestionsEnterValueAlgorithm *)objc_alloc_init(MEMORY[0x1E4F84818]);
    suggestionGenerator = v9->_suggestionGenerator;
    v9->_suggestionGenerator = v21;

    [(PKNumericSuggestionsEnterValueAlgorithm *)v9->_suggestionGenerator setMinBalance:v9->_minLoadedBalance];
    [(PKNumericSuggestionsEnterValueAlgorithm *)v9->_suggestionGenerator setMaxBalance:v9->_maxLoadedBalance];
    [(PKNumericSuggestionsEnterValueAlgorithm *)v9->_suggestionGenerator setCardBalance:v9->_currentAmount];
    [(PKNumericSuggestionsEnterValueAlgorithm *)v9->_suggestionGenerator setCurrencyCode:v9->_currency];
    [(PKNumericSuggestionsEnterValueAlgorithm *)v9->_suggestionGenerator setPowerOfTenFactor:3 - v20];
    [(PKNumericSuggestionsEnterValueAlgorithm *)v9->_suggestionGenerator setDecimalPrecision:v20];
    v23 = v9->_suggestionGenerator;
    v24 = [(PKPaymentSetupPurchaseAmountView *)v9 _defaultValues];
    [(PKNumericSuggestionsEnterValueAlgorithm *)v23 setDefaultValues:v24];

    [(PKPaymentSetupPurchaseAmountView *)v9 _createSubviews];
    [(PKPaymentSetupPurchaseAmountView *)v9 _createConstraints];
    [(PKPaymentSetupPurchaseAmountView *)v9 _updateCurrentAmount:v9->_currentAmount];
    [(PKPaymentSetupPurchaseAmountView *)v9 _updateMessageLabelForAmount:v9->_currentAmount];
  }

  return v9;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PKPaymentSetupPurchaseAmountView;
  [(PKPaymentSetupPurchaseAmountView *)&v3 layoutSubviews];
  [(PKPaymentSetupPurchaseAmountView *)self bounds];
  [(PKNumberPadSuggestionsView *)self->_suggestionView frame];
  -[PKNumberPadSuggestionsView setFrame:](self->_suggestionView, "setFrame:");
}

- (void)updateConstraints
{
  v17[1] = *MEMORY[0x1E4F143B8];
  v13.receiver = self;
  v13.super_class = (Class)PKPaymentSetupPurchaseAmountView;
  [(PKPaymentSetupPurchaseAmountView *)&v13 updateConstraints];
  if ([(PKPaymentSetupPurchaseAmountView *)self displayingBalanceErrorMessage]
    && ![(NSLayoutConstraint *)self->_fixedConstraint isActive])
  {
    fixedConstraint = self->_fixedConstraint;
    [(UIStackView *)self->_amountStackView frame];
    [(NSLayoutConstraint *)fixedConstraint setConstant:v4];
    v5 = (void *)MEMORY[0x1E4F28DC8];
    v17[0] = self->_fixedConstraint;
    v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
    [v5 activateConstraints:v6];

    id v7 = (void *)MEMORY[0x1E4F28DC8];
    centeringConstraint = self->_centeringConstraint;
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&centeringConstraint count:1];
    [v7 deactivateConstraints:v8];
  }
  if (![(PKPaymentSetupPurchaseAmountView *)self displayingBalanceErrorMessage]
    && ![(NSLayoutConstraint *)self->_centeringConstraint isActive])
  {
    v9 = (void *)MEMORY[0x1E4F28DC8];
    v15 = self->_centeringConstraint;
    uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v15 count:1];
    [v9 activateConstraints:v10];

    v11 = (void *)MEMORY[0x1E4F28DC8];
    v14 = self->_fixedConstraint;
    uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v14 count:1];
    [v11 deactivateConstraints:v12];
  }
}

- (UITextField)amountTextField
{
  return [(PKEnterCurrencyAmountView *)self->_enterCurrencyAmountView amountTextField];
}

- (CGSize)defaultKeyboardSize
{
  [(PKEnterCurrencyAmountView *)self->_enterCurrencyAmountView defaultKeyboardSize];
  result.height = v3;
  result.width = v2;
  return result;
}

- (BOOL)enterCurrencyAmountView:(id)a3 shouldChangeAmountFrom:(id)a4 to:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if ([(PKPaymentSetupPurchaseAmountView *)self _shouldShakeCard:v8])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained shakeCard];
  }
  maxLoadedBalance = self->_maxLoadedBalance;
  BOOL v11 = !maxLoadedBalance
     || [(NSDecimalNumber *)maxLoadedBalance compare:v7] != NSOrderedAscending
     || [(NSDecimalNumber *)self->_maxLoadedBalance compare:v8] != NSOrderedAscending;

  return v11;
}

- (void)enterCurrencyAmountViewDidChangeAmount:(id)a3
{
  id v4 = [a3 currentAmount];
  [(PKPaymentSetupPurchaseAmountView *)self _updateCurrentAmount:v4];
}

- (void)enterCurrencyAmountViewDidLayoutKeyboard:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained paymentSetupPurchaseAmountViewDidLayoutKeyboard:self];
}

- (void)numberPadSuggestionsView:(id)a3 didSelectSuggestion:(id)a4
{
  objc_msgSend(a4, "value", a3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [(PKEnterCurrencyAmountView *)self->_enterCurrencyAmountView setCurrentAmount:v6];
  [(PKPaymentSetupPurchaseAmountView *)self _updateCurrentAmount:v6];
  if ([(PKPaymentSetupPurchaseAmountView *)self _shouldShakeCard:v6])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained shakeCard];
  }
}

- (void)_createSubviews
{
  v31[2] = *MEMORY[0x1E4F143B8];
  double v3 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  centeringView = self->_centeringView;
  self->_centeringView = v3;

  [(UIView *)self->_centeringView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIView *)self->_centeringView setHidden:1];
  [(PKPaymentSetupPurchaseAmountView *)self addSubview:self->_centeringView];
  double v5 = *MEMORY[0x1E4FB09E0];
  id v6 = PKRoundedSystemFontOfSizeAndWeight(60.0, *MEMORY[0x1E4FB09E0]);
  id v7 = PKRoundedSystemFontOfSizeAndWeight(36.0, v5);
  id v8 = [[PKEnterCurrencyAmountView alloc] initWithCurrency:self->_currency amount:self->_currentAmount];
  enterCurrencyAmountView = self->_enterCurrencyAmountView;
  self->_enterCurrencyAmountView = v8;

  [(PKEnterCurrencyAmountView *)self->_enterCurrencyAmountView setDelegate:self];
  [(PKEnterCurrencyAmountView *)self->_enterCurrencyAmountView setAmountFont:v6];
  [(PKEnterCurrencyAmountView *)self->_enterCurrencyAmountView setCurrencySymbolFont:v7];
  [(PKEnterCurrencyAmountView *)self->_enterCurrencyAmountView setKerning:&unk_1EF2B8880];
  [(PKEnterCurrencyAmountView *)self->_enterCurrencyAmountView setTranslatesAutoresizingMaskIntoConstraints:0];
  uint64_t v10 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
  messageLabel = self->_messageLabel;
  self->_messageLabel = v10;

  [(UILabel *)self->_messageLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  uint64_t v12 = self->_messageLabel;
  objc_super v13 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  [(UILabel *)v12 setTextColor:v13];

  v14 = self->_messageLabel;
  v15 = PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB28D0], (NSString *)*MEMORY[0x1E4FB2790]);
  [(UILabel *)v14 setFont:v15];

  [(UILabel *)self->_messageLabel setTextAlignment:1];
  [(UILabel *)self->_messageLabel setNumberOfLines:2];
  id v16 = objc_alloc(MEMORY[0x1E4FB1C60]);
  v17 = self->_messageLabel;
  v31[0] = self->_enterCurrencyAmountView;
  v31[1] = v17;
  uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:2];
  v19 = (UIStackView *)[v16 initWithArrangedSubviews:v18];
  amountStackView = self->_amountStackView;
  self->_amountStackView = v19;

  [(UIStackView *)self->_amountStackView setAxis:1];
  [(UIStackView *)self->_amountStackView setAlignment:3];
  [(UIStackView *)self->_amountStackView setDistribution:0];
  [(UIStackView *)self->_amountStackView setSpacing:32.0];
  [(UIStackView *)self->_amountStackView setBaselineRelativeArrangement:1];
  [(UIStackView *)self->_amountStackView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(PKPaymentSetupPurchaseAmountView *)self addSubview:self->_amountStackView];
  if ([(PKNumericSuggestionsEnterValueAlgorithm *)self->_suggestionGenerator hasValidDefaultSuggestions])
  {
    v21 = [(PKPaymentSetupPurchaseAmountView *)self _defaultSuggestions];
    v22 = [[PKNumberPadSuggestionsView alloc] initWithDefaultFrame];
    suggestionView = self->_suggestionView;
    self->_suggestionView = v22;

    [(PKNumberPadSuggestionsView *)self->_suggestionView setDelegate:self];
    v24 = self->_suggestionView;
    uint64_t v26 = MEMORY[0x1E4F143A8];
    uint64_t v27 = 3221225472;
    v28 = __51__PKPaymentSetupPurchaseAmountView__createSubviews__block_invoke;
    v29 = &unk_1E59CE078;
    id v30 = v21;
    id v25 = v21;
    [(PKNumberPadSuggestionsView *)v24 performBatchUpdates:&v26];
    -[PKEnterCurrencyAmountView setInputAccessoryView:](self->_enterCurrencyAmountView, "setInputAccessoryView:", self->_suggestionView, v26, v27, v28, v29);
  }
}

void __51__PKPaymentSetupPurchaseAmountView__createSubviews__block_invoke(uint64_t a1, void *a2)
{
  double v3 = (void *)MEMORY[0x1E4FB1618];
  id v5 = a2;
  id v4 = [v3 labelColor];
  [v5 setButtonTextColor:v4];

  [v5 setSuggestions:*(void *)(a1 + 32)];
}

- (void)_createConstraints
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v4 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_amountStackView attribute:5 relatedBy:0 toItem:self attribute:5 multiplier:1.0 constant:0.0];
  [v3 addObject:v4];

  id v5 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_amountStackView attribute:6 relatedBy:0 toItem:self attribute:6 multiplier:1.0 constant:0.0];
  [v3 addObject:v5];

  id v6 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_centeringView attribute:5 relatedBy:0 toItem:self attribute:5 multiplier:1.0 constant:0.0];
  [v3 addObject:v6];

  id v7 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_centeringView attribute:6 relatedBy:0 toItem:self attribute:6 multiplier:1.0 constant:0.0];
  [v3 addObject:v7];

  id v8 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_centeringView attribute:3 relatedBy:0 toItem:self attribute:3 multiplier:1.0 constant:0.0];
  [v3 addObject:v8];

  v9 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_centeringView attribute:4 relatedBy:0 toItem:self attribute:4 multiplier:1.0 constant:0.0];
  [v3 addObject:v9];

  uint64_t v10 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_amountStackView attribute:10 relatedBy:0 toItem:self->_centeringView attribute:10 multiplier:1.0 constant:0.0];
  centeringConstraint = self->_centeringConstraint;
  self->_centeringConstraint = v10;

  LODWORD(v12) = 1144750080;
  [(NSLayoutConstraint *)self->_centeringConstraint setPriority:v12];
  objc_super v13 = (void *)MEMORY[0x1E4F28DC8];
  amountStackView = self->_amountStackView;
  [(UIStackView *)amountStackView frame];
  objc_msgSend(v13, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", amountStackView, 3, 0, self, 3, 1.0);
  v15 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  fixedConstraint = self->_fixedConstraint;
  self->_fixedConstraint = v15;

  LODWORD(v17) = 1144750080;
  [(NSLayoutConstraint *)self->_fixedConstraint setPriority:v17];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v18 = v3;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v19)
  {
    uint64_t v21 = v19;
    uint64_t v22 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v25 != v22) {
          objc_enumerationMutation(v18);
        }
        LODWORD(v20) = 1144750080;
        objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * i), "setPriority:", v20, (void)v24);
      }
      uint64_t v21 = [v18 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v21);
  }

  [v18 addObject:self->_centeringConstraint];
  [MEMORY[0x1E4F28DC8] activateConstraints:v18];
}

- (id)_defaultValues
{
  v9[3] = *MEMORY[0x1E4F143B8];
  double v2 = [(PKPaymentProvisioningMethodMetadata *)self->_provisioningMethodMetadata digitalIssuanceMetadata];
  id v3 = [v2 defaultSuggestions];
  if ([v3 count])
  {
    id v4 = v3;
  }
  else
  {
    id v5 = [MEMORY[0x1E4F28C28] decimalNumberWithString:@"50"];
    id v6 = objc_msgSend(MEMORY[0x1E4F28C28], "decimalNumberWithString:", @"100", v5);
    v9[1] = v6;
    id v7 = [MEMORY[0x1E4F28C28] decimalNumberWithString:@"200"];
    v9[2] = v7;
    id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:3];
  }

  return v4;
}

- (id)_defaultSuggestions
{
  id v3 = [(PKPaymentSetupPurchaseAmountView *)self _defaultValues];
  id v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  uint64_t v10 = __55__PKPaymentSetupPurchaseAmountView__defaultSuggestions__block_invoke;
  BOOL v11 = &unk_1E59CEC28;
  id v12 = v4;
  objc_super v13 = self;
  id v5 = v4;
  [v3 enumerateObjectsUsingBlock:&v8];
  id v6 = objc_msgSend(v5, "copy", v8, v9, v10, v11);

  return v6;
}

void __55__PKPaymentSetupPurchaseAmountView__defaultSuggestions__block_invoke(uint64_t a1, uint64_t a2)
{
  double v2 = *(void **)(a1 + 32);
  id v3 = [MEMORY[0x1E4F84808] suggestionWithValue:a2 currencyCode:*(void *)(*(void *)(a1 + 40) + 440)];
  [v2 addObject:v3];
}

- (BOOL)_isAmountValid:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F28C28] notANumber];
  if ([v4 isEqualToNumber:v5])
  {
    BOOL v6 = 1;
  }
  else
  {
    id v7 = [MEMORY[0x1E4F28C28] zero];
    if (![v4 compare:v7]
      || (maxLoadedBalance = self->_maxLoadedBalance) != 0
      && [(NSDecimalNumber *)maxLoadedBalance compare:v4] == NSOrderedAscending)
    {
      BOOL v6 = 1;
    }
    else
    {
      minLoadedBalance = self->_minLoadedBalance;
      if (minLoadedBalance) {
        BOOL v6 = [(NSDecimalNumber *)minLoadedBalance compare:v4] == NSOrderedDescending;
      }
      else {
        BOOL v6 = 0;
      }
    }
  }
  return !v6;
}

- (BOOL)_shouldShakeCard:(id)a3
{
  maxLoadedBalance = self->_maxLoadedBalance;
  if (maxLoadedBalance) {
    LOBYTE(maxLoadedBalance) = [(NSDecimalNumber *)maxLoadedBalance compare:a3] == NSOrderedAscending;
  }
  return (char)maxLoadedBalance;
}

- (void)_updateCurrentAmount:(id)a3
{
  p_currentAmount = &self->_currentAmount;
  objc_storeStrong((id *)&self->_currentAmount, a3);
  id v6 = a3;
  BOOL v7 = [(PKPaymentSetupPurchaseAmountView *)self _isAmountValid:*p_currentAmount];
  id v9 = [(PKNumericSuggestionsEnterValueAlgorithm *)self->_suggestionGenerator suggestionsWithAmount:*p_currentAmount];
  [(PKNumberPadSuggestionsView *)self->_suggestionView setSuggestions:v9];
  [(PKPaymentSetupPurchaseAmountView *)self _updateMessageLabelForAmount:*p_currentAmount];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained didUpdateAmount:*p_currentAmount isValid:v7];
}

- (void)_updateMessageLabelForAmount:(id)a3
{
  id v19 = a3;
  maxLoadedBalance = self->_maxLoadedBalance;
  if (maxLoadedBalance
    && [(NSDecimalNumber *)maxLoadedBalance compare:self->_currentAmount] == NSOrderedAscending)
  {
    [(PKPaymentSetupPurchaseAmountView *)self setDisplayingBalanceErrorMessage:1];
    id v18 = (void *)[objc_alloc(MEMORY[0x1E4F84610]) initWithAmount:self->_maxLoadedBalance currency:self->_currency exponent:0];
    id v9 = [v18 minimalFormattedStringValue];

    PKLocalizedPaymentString(&cfstr_SetupPurchaseE.isa, &stru_1EF1B4C70.isa, v9);
    goto LABEL_15;
  }
  minLoadedBalance = self->_minLoadedBalance;
  if (minLoadedBalance)
  {
    if ([(NSDecimalNumber *)minLoadedBalance compare:v19] == NSOrderedDescending)
    {
      id v6 = [MEMORY[0x1E4F28C28] zero];
      uint64_t v7 = [v19 compare:v6];

      if (v7)
      {
        [(PKPaymentSetupPurchaseAmountView *)self setDisplayingBalanceErrorMessage:1];
        uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F84610]) initWithAmount:self->_minLoadedBalance currency:self->_currency exponent:0];
        id v9 = [v8 minimalFormattedStringValue];

        PKLocalizedPaymentString(&cfstr_SetupPurchaseE_0.isa, &stru_1EF1B4C70.isa, v9);
        double v17 = LABEL_15:;
LABEL_16:
        [(UILabel *)self->_messageLabel setText:v17];

        goto LABEL_18;
      }
    }
  }
  depositAmount = self->_depositAmount;
  BOOL v11 = [MEMORY[0x1E4F28C28] zero];
  uint64_t v12 = [(NSDecimalNumber *)depositAmount compare:v11];

  [(PKPaymentSetupPurchaseAmountView *)self setDisplayingBalanceErrorMessage:0];
  if (v12)
  {
    objc_super v13 = (void *)[objc_alloc(MEMORY[0x1E4F84610]) initWithAmount:self->_depositAmount currency:self->_currency exponent:0];
    id v9 = [v13 minimalFormattedStringValue];

    uint64_t v14 = [(PKPaymentProvisioningMethodMetadata *)self->_provisioningMethodMetadata depositType];
    v15 = @"SETUP_PURCHASE_REFUNDABLE_SERVICE_FEE_AMOUNT_MESSAGE";
    if (v14 == 2) {
      v15 = @"SETUP_PURCHASE_NONREFUNDABLE_SERVICE_FEE_AMOUNT_MESSAGE";
    }
    if (v14 == 1) {
      id v16 = @"SETUP_PURCHASE_REFUNDABLE_DEPOSIT_AMOUNT_MESSAGE";
    }
    else {
      id v16 = v15;
    }
    double v17 = PKLocalizedPaymentString(&v16->isa, &stru_1EF1B4C70.isa, v9);
    goto LABEL_16;
  }
  [(UILabel *)self->_messageLabel setText:0];
LABEL_18:
  [(PKPaymentSetupPurchaseAmountView *)self setNeedsUpdateConstraints];
}

- (PKPaymentSetupPurchaseAmountViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKPaymentSetupPurchaseAmountViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (PKPaymentSetupProduct)product
{
  return self->_product;
}

- (void)setProduct:(id)a3
{
}

- (PKPaymentProvisioningMethodMetadata)provisioningMethodMetadata
{
  return self->_provisioningMethodMetadata;
}

- (void)setProvisioningMethodMetadata:(id)a3
{
}

- (NSString)currency
{
  return self->_currency;
}

- (void)setCurrency:(id)a3
{
}

- (NSDecimalNumber)depositAmount
{
  return self->_depositAmount;
}

- (void)setDepositAmount:(id)a3
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

- (void)setMaxLoadedBalance:(id)a3
{
}

- (UIStackView)amountStackView
{
  return self->_amountStackView;
}

- (void)setAmountStackView:(id)a3
{
}

- (PKEnterCurrencyAmountView)enterCurrencyAmountView
{
  return self->_enterCurrencyAmountView;
}

- (void)setEnterCurrencyAmountView:(id)a3
{
}

- (NSDecimalNumber)currentAmount
{
  return self->_currentAmount;
}

- (void)setCurrentAmount:(id)a3
{
}

- (UILabel)messageLabel
{
  return self->_messageLabel;
}

- (void)setMessageLabel:(id)a3
{
}

- (UIView)centeringView
{
  return self->_centeringView;
}

- (void)setCenteringView:(id)a3
{
}

- (NSLayoutConstraint)fixedConstraint
{
  return self->_fixedConstraint;
}

- (void)setFixedConstraint:(id)a3
{
}

- (NSLayoutConstraint)centeringConstraint
{
  return self->_centeringConstraint;
}

- (void)setCenteringConstraint:(id)a3
{
}

- (BOOL)displayingBalanceErrorMessage
{
  return self->_displayingBalanceErrorMessage;
}

- (void)setDisplayingBalanceErrorMessage:(BOOL)a3
{
  self->_displayingBalanceErrorMessage = a3;
}

- (PKNumberPadSuggestionsView)suggestionView
{
  return self->_suggestionView;
}

- (void)setSuggestionView:(id)a3
{
}

- (PKNumericSuggestionsEnterValueAlgorithm)suggestionGenerator
{
  return self->_suggestionGenerator;
}

- (void)setSuggestionGenerator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestionGenerator, 0);
  objc_storeStrong((id *)&self->_suggestionView, 0);
  objc_storeStrong((id *)&self->_centeringConstraint, 0);
  objc_storeStrong((id *)&self->_fixedConstraint, 0);
  objc_storeStrong((id *)&self->_centeringView, 0);
  objc_storeStrong((id *)&self->_messageLabel, 0);
  objc_storeStrong((id *)&self->_currentAmount, 0);
  objc_storeStrong((id *)&self->_enterCurrencyAmountView, 0);
  objc_storeStrong((id *)&self->_amountStackView, 0);
  objc_storeStrong((id *)&self->_maxLoadedBalance, 0);
  objc_storeStrong((id *)&self->_minLoadedBalance, 0);
  objc_storeStrong((id *)&self->_depositAmount, 0);
  objc_storeStrong((id *)&self->_currency, 0);
  objc_storeStrong((id *)&self->_provisioningMethodMetadata, 0);
  objc_storeStrong((id *)&self->_product, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end