@interface PKAccountBillPaymentAmountDescriptionView
- (BOOL)_isEnteredAmountValid;
- (BOOL)_shouldShakeWithNewAmount:(id)a3;
- (BOOL)enterCurrencyAmountView:(id)a3 shouldChangeAmountFrom:(id)a4 to:(id)a5;
- (BOOL)showAmount;
- (BOOL)showDescriptionLabels;
- (BOOL)showDescriptionSubtitle;
- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSDecimalNumber)amount;
- (NSDecimalNumber)maximumAmount;
- (NSDecimalNumber)minimumAmount;
- (NSString)descriptionText;
- (NSString)titleText;
- (PKAccountBillPaymentAmountContainerView)amountContainerView;
- (PKAccountBillPaymentAmountDescriptionView)initWithSuggestedAmountList:(id)a3 account:(id)a4 configuration:(id)a5 delegate:(id)a6;
- (PKAccountBillPaymentAmountDescriptionViewDelegate)delegate;
- (id)_enterCurrencyAmountView;
- (id)_keypadSuggestions;
- (id)_suggestedAmountDescriptionAttributedString;
- (void)_enteredAmountDidChangeTo:(id)a3;
- (void)_updateDescriptionAlpha;
- (void)_updateEnteredAmount:(id)a3;
- (void)dismissKeyboard;
- (void)enterCurrencyAmountViewDidChangeAmount:(id)a3;
- (void)layoutSubviews;
- (void)normalizeEnteredAmount;
- (void)numberPadSuggestionsView:(id)a3 didSelectSuggestion:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setDescriptionText:(id)a3;
- (void)setMaximumAmount:(id)a3;
- (void)setMinimumAmount:(id)a3;
- (void)setShowAmount:(BOOL)a3;
- (void)setShowDescriptionLabels:(BOOL)a3;
- (void)setShowDescriptionSubtitle:(BOOL)a3;
- (void)setTitleText:(id)a3;
- (void)showKeyboard;
@end

@implementation PKAccountBillPaymentAmountDescriptionView

- (PKAccountBillPaymentAmountDescriptionView)initWithSuggestedAmountList:(id)a3 account:(id)a4 configuration:(id)a5 delegate:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v37.receiver = self;
  v37.super_class = (Class)PKAccountBillPaymentAmountDescriptionView;
  v15 = [(PKAccountBillPaymentAmountDescriptionView *)&v37 init];
  v16 = v15;
  if (v15)
  {
    objc_storeWeak((id *)&v15->_delegate, v14);
    objc_storeStrong((id *)&v16->_suggestionList, a3);
    objc_storeStrong((id *)&v16->_account, a4);
    objc_storeStrong((id *)&v16->_configuration, a5);
    v16->_showDescriptionLabels = 1;
    v16->_showDescriptionSubtitle = 1;
    uint64_t v17 = PKLocalizedFeatureString();
    learnMoreString = v16->_learnMoreString;
    v16->_learnMoreString = (NSString *)v17;

    v19 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    suggestedAmountTitleLabel = v16->_suggestedAmountTitleLabel;
    v16->_suggestedAmountTitleLabel = v19;

    [(UILabel *)v16->_suggestedAmountTitleLabel setTextAlignment:1];
    v34 = PKFontForDefaultDesign((void *)*MEMORY[0x1E4FB2948], (void *)*MEMORY[0x1E4FB2790], 32770, 0);
    [(UILabel *)v16->_suggestedAmountTitleLabel setFont:v34];
    [(UILabel *)v16->_suggestedAmountTitleLabel setNumberOfLines:0];
    [(UILabel *)v16->_suggestedAmountTitleLabel setAccessibilityIdentifier:*MEMORY[0x1E4F85AB8]];
    uint64_t v21 = objc_msgSend(MEMORY[0x1E4FB1DD8], "pkui_plainNonInteractiveTextViewWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    suggestedAmountDescriptionView = v16->_suggestedAmountDescriptionView;
    v16->_suggestedAmountDescriptionView = (UITextView *)v21;

    [(UITextView *)v16->_suggestedAmountDescriptionView setDelegate:v16];
    [(UITextView *)v16->_suggestedAmountDescriptionView setSelectable:1];
    [(UITextView *)v16->_suggestedAmountDescriptionView setUserInteractionEnabled:1];
    [(UITextView *)v16->_suggestedAmountDescriptionView _setInteractiveTextSelectionDisabled:1];
    -[UITextView setTextContainerInset:](v16->_suggestedAmountDescriptionView, "setTextContainerInset:", *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));
    [(UITextView *)v16->_suggestedAmountDescriptionView setAccessibilityIdentifier:*MEMORY[0x1E4F85A60]];
    v23 = [PKAccountBillPaymentAmountContainerView alloc];
    v24 = [(PKBillPaymentSuggestedAmountList *)v16->_suggestionList currencyCode];
    uint64_t v25 = [(PKAccountBillPaymentAmountContainerView *)v23 initWithCurrencyCode:v24 minimumAmount:v16->_minimumAmount];
    amountContainerView = v16->_amountContainerView;
    v16->_amountContainerView = (PKAccountBillPaymentAmountContainerView *)v25;

    v27 = [(PKAccountBillPaymentAmountDescriptionView *)v16 _enterCurrencyAmountView];
    [v27 setDelegate:v16];
    v28 = [(PKAccountBillPaymentAmountDescriptionView *)v16 _keypadSuggestions];
    v29 = [[PKNumberPadSuggestionsView alloc] initWithDefaultFrame];
    suggestionView = v16->_suggestionView;
    v16->_suggestionView = v29;

    [(PKNumberPadSuggestionsView *)v16->_suggestionView setDelegate:v16];
    v31 = v16->_suggestionView;
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __104__PKAccountBillPaymentAmountDescriptionView_initWithSuggestedAmountList_account_configuration_delegate___block_invoke;
    v35[3] = &unk_1E59CE078;
    id v36 = v28;
    id v32 = v28;
    [(PKNumberPadSuggestionsView *)v31 performBatchUpdates:v35];
    [v27 setInputAccessoryView:v16->_suggestionView];
    [(PKAccountBillPaymentAmountDescriptionView *)v16 addSubview:v16->_suggestedAmountTitleLabel];
    [(PKAccountBillPaymentAmountDescriptionView *)v16 addSubview:v16->_suggestedAmountDescriptionView];
    [(PKAccountBillPaymentAmountDescriptionView *)v16 addSubview:v16->_amountContainerView];
    [(PKAccountBillPaymentAmountDescriptionView *)v16 setAccessibilityIdentifier:*MEMORY[0x1E4F85470]];
  }
  return v16;
}

void __104__PKAccountBillPaymentAmountDescriptionView_initWithSuggestedAmountList_account_configuration_delegate___block_invoke(uint64_t a1, void *a2)
{
  v3 = (void *)MEMORY[0x1E4FB1618];
  id v6 = a2;
  v4 = [v3 labelColor];
  [v6 setButtonTextColor:v4];

  v5 = +[PKAccountBillPaymentViewController backgroundColor];
  [v6 setButtonBackgroundColor:v5];

  [v6 setSuggestions:*(void *)(a1 + 32)];
}

- (void)layoutSubviews
{
  v26.receiver = self;
  v26.super_class = (Class)PKAccountBillPaymentAmountDescriptionView;
  [(PKAccountBillPaymentAmountDescriptionView *)&v26 layoutSubviews];
  [(PKAccountBillPaymentAmountDescriptionView *)self bounds];
  CGFloat v4 = v3;
  double v6 = v5;
  [(PKAccountBillPaymentAmountContainerView *)self->_amountContainerView frame];
  -[PKAccountBillPaymentAmountContainerView sizeThatFits:](self->_amountContainerView, "sizeThatFits:", v6, 1.79769313e308);
  PKRectCenteredXInRect();
  CGFloat v8 = v7;
  CGFloat v24 = v10;
  CGFloat v25 = v9;
  -[PKAccountBillPaymentAmountContainerView setFrame:](self->_amountContainerView, "setFrame:");
  [(UILabel *)self->_suggestedAmountTitleLabel frame];
  -[UILabel sizeThatFits:](self->_suggestedAmountTitleLabel, "sizeThatFits:", v6, 1.79769313e308);
  PKRectCenteredXInRect();
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v17 = v4;
  if ([(PKAccountBillPaymentAmountDescriptionView *)self showAmount])
  {
    v27.origin.x = v8;
    v27.origin.y = v4;
    v27.size.height = v24;
    v27.size.width = v25;
    double v17 = CGRectGetMaxY(v27) + 17.0;
  }
  -[UILabel setFrame:](self->_suggestedAmountTitleLabel, "setFrame:", v12, v17, v14, v16);
  [(UITextView *)self->_suggestedAmountDescriptionView frame];
  -[UITextView sizeThatFits:](self->_suggestedAmountDescriptionView, "sizeThatFits:", v6, 1.79769313e308);
  PKRectCenteredXInRect();
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  v28.origin.x = v12;
  v28.origin.y = v17;
  v28.size.width = v14;
  v28.size.height = v16;
  -[UITextView setFrame:](self->_suggestedAmountDescriptionView, "setFrame:", v19, CGRectGetMaxY(v28) + 6.0, v21, v23);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  if (self->_showDescriptionLabels)
  {
    -[UILabel sizeThatFits:](self->_suggestedAmountTitleLabel, "sizeThatFits:", a3.width, 1.79769313e308);
    double v6 = v5 + 0.0;
    if (self->_showDescriptionSubtitle)
    {
      -[UITextView sizeThatFits:](self->_suggestedAmountDescriptionView, "sizeThatFits:", width, 1.79769313e308);
      double v6 = v6 + 6.0 + v7;
    }
  }
  else
  {
    double v6 = 0.0;
  }
  if ([(PKAccountBillPaymentAmountDescriptionView *)self showAmount])
  {
    -[PKAccountBillPaymentAmountContainerView sizeThatFits:](self->_amountContainerView, "sizeThatFits:", width, 1.79769313e308);
    double v9 = v6 + v8;
    double v10 = v6 + v8 + 17.0;
    if (self->_showDescriptionLabels) {
      double v6 = v10;
    }
    else {
      double v6 = v9;
    }
  }
  double v11 = width;
  double v12 = v6;
  result.height = v12;
  result.double width = v11;
  return result;
}

- (void)numberPadSuggestionsView:(id)a3 didSelectSuggestion:(id)a4
{
  objc_msgSend(a4, "value", a3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [(PKAccountBillPaymentAmountDescriptionView *)self _updateEnteredAmount:v6];
  if ([(PKAccountBillPaymentAmountDescriptionView *)self _shouldShakeWithNewAmount:v6])
  {
    double v5 = [(PKAccountBillPaymentAmountDescriptionView *)self _enterCurrencyAmountView];
    objc_msgSend(v5, "pkui_smallShakeWithCompletion:", 0);
  }
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained billPaymentAmountDescriptionViewHasTappedLearnMore:self];

  return 0;
}

- (void)setTitleText:(id)a3
{
  p_titleText = &self->_titleText;
  id v6 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_titleText, a3);
    [(UILabel *)self->_suggestedAmountTitleLabel setText:*p_titleText];
    [(PKAccountBillPaymentAmountDescriptionView *)self setNeedsLayout];
  }
}

- (void)setDescriptionText:(id)a3
{
  id v13 = a3;
  if ([v13 length])
  {
    CGFloat v4 = [v13 stringByAppendingFormat:@" %@", self->_learnMoreString];
  }
  else
  {
    CGFloat v4 = self->_learnMoreString;
  }
  double v5 = v4;
  descriptionText = self->_descriptionText;
  double v7 = v4;
  double v8 = descriptionText;
  if (v7 == v8)
  {

    goto LABEL_12;
  }
  double v9 = v8;
  if (!v7 || !v8)
  {

    goto LABEL_11;
  }
  BOOL v10 = [(NSString *)v7 isEqualToString:v8];

  if (!v10)
  {
LABEL_11:
    objc_storeStrong((id *)&self->_descriptionText, v5);
    suggestedAmountDescriptionView = self->_suggestedAmountDescriptionView;
    double v12 = [(PKAccountBillPaymentAmountDescriptionView *)self _suggestedAmountDescriptionAttributedString];
    [(UITextView *)suggestedAmountDescriptionView setAttributedText:v12];

    [(PKAccountBillPaymentAmountDescriptionView *)self setNeedsLayout];
  }
LABEL_12:
}

- (id)_suggestedAmountDescriptionAttributedString
{
  if ([(NSString *)self->_descriptionText length])
  {
    NSUInteger v3 = [(NSString *)self->_descriptionText length];
    CGFloat v4 = [MEMORY[0x1E4F1CB10] URLWithString:&stru_1EF1B5B50];
    uint64_t v5 = [(NSString *)self->_descriptionText rangeOfString:self->_learnMoreString];
    uint64_t v7 = v6;
    double v8 = PKFontForDefaultDesign((void *)*MEMORY[0x1E4FB2948], (void *)*MEMORY[0x1E4FB2790], 0x8000, 0);
    double v9 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:self->_descriptionText];
    BOOL v10 = [MEMORY[0x1E4FB1618] linkColor];
    objc_msgSend(v9, "pk_addLinkURL:toRange:withColor:isUnderlined:", v4, v5, v7, v10, 0);

    double v11 = [MEMORY[0x1E4FB0850] defaultParagraphStyle];
    double v12 = (void *)[v11 mutableCopy];

    [v12 setLineBreakMode:0];
    [v12 setAlignment:1];
    objc_msgSend(v9, "addAttribute:value:range:", *MEMORY[0x1E4FB0738], v12, 0, v3);
    uint64_t v13 = *MEMORY[0x1E4FB0700];
    double v14 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    objc_msgSend(v9, "addAttribute:value:range:", v13, v14, 0, v3);

    objc_msgSend(v9, "addAttribute:value:range:", *MEMORY[0x1E4FB06F8], v8, 0, v3);
  }
  else
  {
    double v9 = 0;
  }

  return v9;
}

- (void)setShowAmount:(BOOL)a3
{
  [(PKAccountBillPaymentAmountContainerView *)self->_amountContainerView setShowAmount:a3];

  [(PKAccountBillPaymentAmountDescriptionView *)self setNeedsLayout];
}

- (BOOL)showAmount
{
  return [(PKAccountBillPaymentAmountContainerView *)self->_amountContainerView showAmount];
}

- (void)setShowDescriptionLabels:(BOOL)a3
{
  if (((!self->_showDescriptionLabels ^ a3) & 1) == 0)
  {
    self->_showDescriptionLabels = a3;
    [(PKAccountBillPaymentAmountDescriptionView *)self _updateDescriptionAlpha];
    [(PKAccountBillPaymentAmountDescriptionView *)self setNeedsLayout];
  }
}

- (void)setShowDescriptionSubtitle:(BOOL)a3
{
  if (((!self->_showDescriptionSubtitle ^ a3) & 1) == 0)
  {
    self->_showDescriptionSubtitle = a3;
    [(PKAccountBillPaymentAmountDescriptionView *)self _updateDescriptionAlpha];
    [(PKAccountBillPaymentAmountDescriptionView *)self setNeedsLayout];
  }
}

- (void)_updateDescriptionAlpha
{
  LOBYTE(v2) = self->_showDescriptionLabels;
  [(UILabel *)self->_suggestedAmountTitleLabel setAlpha:(double)v2];
  suggestedAmountDescriptionView = self->_suggestedAmountDescriptionView;
  if (self->_showDescriptionLabels)
  {
    LOBYTE(v4) = self->_showDescriptionSubtitle;
    double v6 = (double)v4;
  }
  else
  {
    double v6 = 0.0;
  }

  [(UITextView *)suggestedAmountDescriptionView setAlpha:v6];
}

- (NSDecimalNumber)amount
{
  return self->_enteredAmount;
}

- (void)showKeyboard
{
  id v2 = [(PKAccountBillPaymentAmountDescriptionView *)self _enterCurrencyAmountView];
  [v2 showKeyboard];
}

- (void)dismissKeyboard
{
  id v2 = [(PKAccountBillPaymentAmountDescriptionView *)self _enterCurrencyAmountView];
  [v2 dismissKeyboard];
}

- (void)normalizeEnteredAmount
{
  id v8 = [(PKAccountBillPaymentAmountDescriptionView *)self _enterCurrencyAmountView];
  NSUInteger v3 = self->_enteredAmount;
  p_maximumAmount = &self->_maximumAmount;
  maximumAmount = self->_maximumAmount;
  if (maximumAmount
    && [(NSDecimalNumber *)maximumAmount compare:self->_enteredAmount] == NSOrderedAscending
    || (p_maximumAmount = &self->_minimumAmount, (minimumAmount = self->_minimumAmount) != 0)
    && [(NSDecimalNumber *)minimumAmount compare:self->_enteredAmount] == NSOrderedDescending)
  {
    uint64_t v7 = *p_maximumAmount;

    NSUInteger v3 = v7;
  }
  [(PKAccountBillPaymentAmountDescriptionView *)self _updateEnteredAmount:v3];
  [v8 setCurrentAmount:v3 forceFormatForDisplay:1];
}

- (BOOL)enterCurrencyAmountView:(id)a3 shouldChangeAmountFrom:(id)a4 to:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if ([(PKAccountBillPaymentAmountDescriptionView *)self _shouldShakeWithNewAmount:v8])
  {
    double v9 = [(PKAccountBillPaymentAmountDescriptionView *)self _enterCurrencyAmountView];
    objc_msgSend(v9, "pkui_smallShakeWithCompletion:", 0);
  }
  if (self->_minimumAmount
    && objc_msgSend(v7, "compare:") == -1
    && [v8 compare:self->_minimumAmount] == -1)
  {
    uint64_t v13 = [MEMORY[0x1E4F28C28] zero];
    if ([v7 compare:v13])
    {
      double v14 = [MEMORY[0x1E4F28C28] zero];
      uint64_t v15 = [v8 compare:v14];

      if (v15)
      {
        BOOL v11 = 0;
        goto LABEL_10;
      }
    }
    else
    {
    }
  }
  maximumAmount = self->_maximumAmount;
  BOOL v11 = !maximumAmount
     || [(NSDecimalNumber *)maximumAmount compare:v7] != NSOrderedAscending
     || [(NSDecimalNumber *)self->_maximumAmount compare:v8] != NSOrderedAscending;
LABEL_10:

  return v11;
}

- (void)enterCurrencyAmountViewDidChangeAmount:(id)a3
{
  unint64_t v4 = [a3 currentAmount];
  enteredAmount = self->_enteredAmount;
  self->_enteredAmount = v4;
  double v6 = v4;

  [(PKAccountBillPaymentAmountDescriptionView *)self _enteredAmountDidChangeTo:v6];
}

- (void)_updateEnteredAmount:(id)a3
{
  objc_storeStrong((id *)&self->_enteredAmount, a3);
  id v6 = a3;
  uint64_t v5 = [(PKAccountBillPaymentAmountDescriptionView *)self _enterCurrencyAmountView];
  [v5 setCurrentAmount:v6 forceFormatForDisplay:PKIsVision() ^ 1];

  [(PKAccountBillPaymentAmountDescriptionView *)self _enteredAmountDidChangeTo:v6];
}

- (void)_enteredAmountDidChangeTo:(id)a3
{
  p_delegate = &self->_delegate;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "billPaymentAmountDescriptionView:hasChangedAmount:isValidAmount:", self, v5, -[PKAccountBillPaymentAmountDescriptionView _isEnteredAmountValid](self, "_isEnteredAmountValid"));
}

- (BOOL)_isEnteredAmountValid
{
  enteredAmount = self->_enteredAmount;
  unint64_t v4 = [MEMORY[0x1E4F28C28] notANumber];
  LOBYTE(enteredAmount) = [(NSDecimalNumber *)enteredAmount isEqualToNumber:v4];

  if (enteredAmount) {
    return 0;
  }
  id v5 = self->_enteredAmount;
  id v6 = [MEMORY[0x1E4F28C28] zero];
  LOBYTE(v5) = [(NSDecimalNumber *)v5 isEqualToNumber:v6];

  if (v5) {
    return 0;
  }
  maximumAmount = self->_maximumAmount;
  if (maximumAmount)
  {
    if ([(NSDecimalNumber *)maximumAmount compare:self->_enteredAmount] == NSOrderedAscending) {
      return 0;
    }
  }
  minimumAmount = self->_minimumAmount;
  return !minimumAmount
      || [(NSDecimalNumber *)minimumAmount compare:self->_enteredAmount] != NSOrderedDescending;
}

- (BOOL)_shouldShakeWithNewAmount:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [MEMORY[0x1E4F28C28] notANumber];
    uint64_t v6 = [v4 compare:v5];

    if (v6)
    {
      id v7 = [(NSDecimalNumber *)self->_maximumAmount decimalNumberBySubtracting:v4];
      id v8 = [MEMORY[0x1E4F28C28] zero];
      uint64_t v9 = [v7 compare:v8];

      if (v9 != -1)
      {
        BOOL v10 = [MEMORY[0x1E4F28C28] zero];
        if (([v4 isEqualToNumber:v10] & 1) != 0 || (minimumAmount = self->_minimumAmount) == 0)
        {
        }
        else
        {
          uint64_t v12 = [(NSDecimalNumber *)minimumAmount compare:v4];

          if (v12 == 1) {
            goto LABEL_7;
          }
        }
        BOOL v13 = 0;
        goto LABEL_11;
      }
LABEL_7:
      BOOL v13 = 1;
LABEL_11:

      goto LABEL_12;
    }
  }
  BOOL v13 = 0;
LABEL_12:

  return v13;
}

- (id)_keypadSuggestions
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  BOOL IsLastMonthsStatement = accountCurrentStatementIsLastMonthsStatement(self->_account);
  id v5 = [(PKBillPaymentSuggestedAmountList *)self->_suggestionList currencyCode];
  [(PKAccount *)self->_account feature];
  uint64_t v6 = [(PKAccount *)self->_account creditDetails];
  id v7 = [v6 accountSummary];
  id v8 = [v7 currentStatement];
  v43 = [v7 balanceSummary];
  uint64_t v9 = [v7 pastDueAmount];
  v44 = v8;
  if (IsLastMonthsStatement)
  {
    v47 = [v8 closingDate];
  }
  else
  {
    v47 = 0;
  }
  id v10 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v45 = v6;
  BOOL v11 = [v6 productTimeZone];
  [v10 setTimeZone:v11];

  uint64_t v12 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
  [v10 setLocale:v12];

  [v10 setLocalizedDateFormatFromTemplate:@"MMM"];
  v46 = v9;
  if (v9)
  {
    BOOL v13 = [MEMORY[0x1E4F28C28] zero];
    uint64_t v14 = [v9 compare:v13];

    if (v14 == 1)
    {
      uint64_t v15 = (void *)MEMORY[0x1E4F84808];
      double v16 = PKLocalizedFeatureString();
      if (v5)
      {
        double v17 = [v15 suggestionWithTitle:v16 value:v46 currencyCode:v5];
      }
      else
      {
        double v18 = [v6 currencyCode];
        double v17 = [v15 suggestionWithTitle:v16 value:v46 currencyCode:v18];
      }
      [v3 addObject:v17];
    }
  }
  double v19 = [(PKBillPaymentSuggestedAmountList *)self->_suggestionList suggestedAmountWithCategory:1];
  if (v19)
  {
    double v20 = (void *)MEMORY[0x1E4F84808];
    double v21 = PKLocalizedFeatureString();
    double v22 = [v19 amount];
    double v23 = [v20 suggestionWithTitle:v21 value:v22 currencyCode:v5];

    [v3 addObject:v23];
  }
  CGFloat v24 = [(PKBillPaymentSuggestedAmountList *)self->_suggestionList suggestedAmountWithCategory:18];

  if (v24)
  {
    if (v47 && (objc_msgSend(v10, "stringFromDate:"), (uint64_t v25 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      objc_super v26 = (void *)v25;
      uint64_t v42 = v25;
      CGRect v27 = PKLocalizedFeatureString();
    }
    else
    {
      CGRect v27 = PKLocalizedFeatureString();
    }
    CGRect v28 = (void *)MEMORY[0x1E4F84808];
    v29 = objc_msgSend(v24, "amount", v42);
    v30 = [v28 suggestionWithTitle:v27 value:v29 currencyCode:v5];

    [v3 addObject:v30];
  }
  v31 = [(PKBillPaymentSuggestedAmountList *)self->_suggestionList suggestedAmountWithCategory:19];

  if (v31)
  {
    id v32 = [v43 pendingPurchases];
    if (!v32
      || ([MEMORY[0x1E4F28C28] zero],
          v33 = objc_claimAutoreleasedReturnValue(),
          uint64_t v34 = [v32 compare:v33],
          v33,
          v34 != 1))
    {
      [(PKAccountServiceAccountResolutionConfiguration *)self->_configuration earlyInstallmentPlan];
    }
    v35 = PKLocalizedFeatureString();
    id v36 = (void *)MEMORY[0x1E4F84808];
    objc_super v37 = [v31 amount];
    v38 = [v36 suggestionWithTitle:v35 value:v37 currencyCode:v5];

    [v3 addObject:v38];
  }
  if ((unint64_t)[v3 count] > 3)
  {
    uint64_t v39 = objc_msgSend(v3, "subarrayWithRange:", 0, 3);
  }
  else
  {
    uint64_t v39 = [v3 copy];
  }
  v40 = (void *)v39;

  return v40;
}

- (id)_enterCurrencyAmountView
{
  return [(PKAccountBillPaymentAmountContainerView *)self->_amountContainerView enterCurrencyAmountView];
}

- (PKAccountBillPaymentAmountDescriptionViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKAccountBillPaymentAmountDescriptionViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (PKAccountBillPaymentAmountContainerView)amountContainerView
{
  return self->_amountContainerView;
}

- (NSString)titleText
{
  return self->_titleText;
}

- (NSString)descriptionText
{
  return self->_descriptionText;
}

- (NSDecimalNumber)minimumAmount
{
  return self->_minimumAmount;
}

- (void)setMinimumAmount:(id)a3
{
}

- (NSDecimalNumber)maximumAmount
{
  return self->_maximumAmount;
}

- (void)setMaximumAmount:(id)a3
{
}

- (BOOL)showDescriptionLabels
{
  return self->_showDescriptionLabels;
}

- (BOOL)showDescriptionSubtitle
{
  return self->_showDescriptionSubtitle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maximumAmount, 0);
  objc_storeStrong((id *)&self->_minimumAmount, 0);
  objc_storeStrong((id *)&self->_descriptionText, 0);
  objc_storeStrong((id *)&self->_titleText, 0);
  objc_storeStrong((id *)&self->_amountContainerView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_suggestionList, 0);
  objc_storeStrong((id *)&self->_learnMoreString, 0);
  objc_storeStrong((id *)&self->_enteredAmount, 0);
  objc_storeStrong((id *)&self->_suggestionView, 0);
  objc_storeStrong((id *)&self->_suggestedAmountDescriptionView, 0);

  objc_storeStrong((id *)&self->_suggestedAmountTitleLabel, 0);
}

@end