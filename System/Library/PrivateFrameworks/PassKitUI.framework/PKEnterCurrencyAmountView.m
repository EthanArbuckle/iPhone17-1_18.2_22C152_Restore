@interface PKEnterCurrencyAmountView
+ (id)_defaultTextColor;
- (BOOL)clearAmountOnFirstKeyboardInput;
- (BOOL)enabled;
- (BOOL)ignoreIntegralNumber;
- (BOOL)isFirstKeyboardInput;
- (BOOL)showsDecimalPointButton;
- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5;
- (CGSize)defaultKeyboardSize;
- (CGSize)intrinsicContentSize;
- (CGSize)lastLayoutBoundsSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSDecimalNumber)currentAmount;
- (NSDecimalNumberHandler)roundingBehavior;
- (NSNumber)kerning;
- (NSNumberFormatter)amountFormatter;
- (NSNumberFormatter)currencySymbolAmountFormatter;
- (NSString)amountString;
- (NSString)currency;
- (PKEnterCurrencyAmountView)initWithCurrency:(id)a3 amount:(id)a4;
- (PKEnterCurrencyAmountView)initWithCurrency:(id)a3 amount:(id)a4 bottomView:(id)a5;
- (PKEnterCurrencyAmountViewDelegate)delegate;
- (PKNumberPadInputView)numberPad;
- (UIColor)keyboardColor;
- (UIColor)textColor;
- (UIFont)amountFont;
- (UIFont)currencySymbolFont;
- (UILabel)amountLabel;
- (UITextField)amountTextField;
- (UIView)inputAccessoryView;
- (double)labelScaleFactor;
- (id)_decimalNumberFromString:(id)a3;
- (id)_formatAmount:(id)a3 minimumFractionDigits:(unint64_t)a4;
- (id)_formatAmountForDisplay:(id)a3 alwaysShowDecimalSeparator:(BOOL)a4 minimumFractionDigits:(unint64_t)a5 useGroupingSeparator:(BOOL)a6;
- (id)_formattedStringForAmount:(id)a3;
- (id)pk_childrenForAppearance;
- (id)viewForFirstBaselineLayout;
- (id)viewForLastBaselineLayout;
- (unint64_t)_numberOfDecimalPlacesInString:(id)a3 decimalSeperator:(id)a4;
- (void)_addSuperscriptToAttributedString:(id)a3 formattedCurrencyAmount:(id)a4 currencyAmountWithoutSymbols:(id)a5;
- (void)_addSuperscriptToAttributedString:(id)a3 inRange:(_NSRange)a4;
- (void)_configureAmountTextFieldInputView;
- (void)_createAmountFormatter;
- (void)_createNumberPad;
- (void)_createSubviews;
- (void)_updateContent;
- (void)didMoveToWindow;
- (void)dismissKeyboard;
- (void)layoutSubviews;
- (void)numberPadInputView:(id)a3 requestReplaceSelectedTextFieldRangeWithText:(id)a4;
- (void)numberPadInputViewRequestDeleteText:(id)a3;
- (void)pk_applyAppearance:(id)a3;
- (void)setAmountFont:(id)a3;
- (void)setAmountFormatter:(id)a3;
- (void)setAmountLabel:(id)a3;
- (void)setAmountString:(id)a3;
- (void)setClearAmountOnFirstKeyboardInput:(BOOL)a3;
- (void)setCurrency:(id)a3;
- (void)setCurrencySymbolAmountFormatter:(id)a3;
- (void)setCurrencySymbolFont:(id)a3;
- (void)setCurrentAmount:(id)a3;
- (void)setCurrentAmount:(id)a3 forceFormatForDisplay:(BOOL)a4;
- (void)setDelegate:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setIgnoreIntegralNumber:(BOOL)a3;
- (void)setInputAccessoryView:(id)a3;
- (void)setIsFirstKeyboardInput:(BOOL)a3;
- (void)setKerning:(id)a3;
- (void)setKeyboardColor:(id)a3;
- (void)setLabelScaleFactor:(double)a3;
- (void)setLastLayoutBoundsSize:(CGSize)a3;
- (void)setNumberPad:(id)a3;
- (void)setRoundingBehavior:(id)a3;
- (void)setShowsDecimalPointButton:(BOOL)a3;
- (void)setTextColor:(id)a3;
- (void)showKeyboard;
@end

@implementation PKEnterCurrencyAmountView

- (void)pk_applyAppearance:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PKEnterCurrencyAmountView;
  id v4 = a3;
  [(UIView *)&v6 pk_applyAppearance:v4];
  v5 = objc_msgSend(v4, "buttonTextColor", v6.receiver, v6.super_class);

  [(PKEnterCurrencyAmountView *)self setTextColor:v5];
}

- (id)pk_childrenForAppearance
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = [(PKEnterCurrencyAmountView *)self amountTextField];
  v5[0] = v2;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

+ (id)_defaultTextColor
{
  return (id)[MEMORY[0x1E4FB1618] labelColor];
}

- (PKEnterCurrencyAmountView)initWithCurrency:(id)a3 amount:(id)a4
{
  return [(PKEnterCurrencyAmountView *)self initWithCurrency:a3 amount:a4 bottomView:0];
}

- (PKEnterCurrencyAmountView)initWithCurrency:(id)a3 amount:(id)a4 bottomView:(id)a5
{
  v8 = (__CFString *)a3;
  id v9 = a4;
  id v10 = a5;
  v21.receiver = self;
  v21.super_class = (Class)PKEnterCurrencyAmountView;
  v11 = [(PKEnterCurrencyAmountView *)&v21 init];
  v12 = v11;
  if (v11)
  {
    v11->_isFirstKeyboardInput = 1;
    if (v8) {
      v13 = v8;
    }
    else {
      v13 = @"USD";
    }
    objc_storeStrong((id *)&v11->_currency, v13);
    v12->_labelScaleFactor = 1.0;
    uint64_t v14 = [MEMORY[0x1E4FB08E0] _lightSystemFontOfSize:70.0];
    currencySymbolFont = v12->_currencySymbolFont;
    v12->_currencySymbolFont = (UIFont *)v14;

    uint64_t v16 = [MEMORY[0x1E4FB08E0] _lightSystemFontOfSize:70.0];
    amountFont = v12->_amountFont;
    v12->_amountFont = (UIFont *)v16;

    uint64_t v18 = [(id)objc_opt_class() _defaultTextColor];
    textColor = v12->_textColor;
    v12->_textColor = (UIColor *)v18;

    objc_storeStrong((id *)&v12->_bottomView, a5);
    [(PKEnterCurrencyAmountView *)v12 _createAmountFormatter];
    [(PKEnterCurrencyAmountView *)v12 _createSubviews];
    [(PKEnterCurrencyAmountView *)v12 setCurrentAmount:v9];
    [(PKEnterCurrencyAmountView *)v12 setShowsDecimalPointButton:0];
    [(PKEnterCurrencyAmountView *)v12 setEnabled:1];
    [(PKEnterCurrencyAmountView *)v12 setAccessibilityIdentifier:*MEMORY[0x1E4F85228]];
  }

  return v12;
}

- (void)setShowsDecimalPointButton:(BOOL)a3
{
  self->_showsDecimalPointButton = a3;
  -[PKNumberPadInputView setShowsDecimalPointButton:](self->_numberPad, "setShowsDecimalPointButton:");
}

- (void)setCurrentAmount:(id)a3
{
}

- (void)setCurrentAmount:(id)a3 forceFormatForDisplay:(BOOL)a4
{
  id v6 = a3;
  id v11 = v6;
  if (a4)
  {
    v7 = v6;
    char v8 = 0;
    if (!v6) {
      goto LABEL_9;
    }
  }
  else
  {
    id v9 = [(PKEnterCurrencyAmountView *)self currentAmount];
    char v8 = PKEqualObjects();

    v7 = v11;
    if (!v11) {
      goto LABEL_9;
    }
  }
  if ((v8 & 1) == 0)
  {
    id v10 = [(PKEnterCurrencyAmountView *)self _formattedStringForAmount:v7];
    if (v10)
    {
      objc_storeStrong((id *)&self->_amountString, v10);
      [(PKEnterCurrencyAmountView *)self _updateContent];
    }

    v7 = v11;
  }
LABEL_9:
}

- (NSDecimalNumber)currentAmount
{
  v2 = [(PKEnterCurrencyAmountView *)self _decimalNumberFromString:self->_amountString];
  v3 = [MEMORY[0x1E4F28C28] notANumber];
  if ([v2 isEqualToNumber:v3])
  {
    id v4 = [MEMORY[0x1E4F28C28] zero];
  }
  else
  {
    id v4 = v2;
  }
  v5 = v4;

  return (NSDecimalNumber *)v5;
}

- (NSString)amountString
{
  return self->_amountString;
}

- (void)setCurrency:(id)a3
{
  id v5 = a3;
  if (!-[NSString isEqualToString:](self->_currency, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_currency, a3);
    [(PKEnterCurrencyAmountView *)self _createAmountFormatter];
    [(PKEnterCurrencyAmountView *)self setNeedsLayout];
  }
}

- (void)setInputAccessoryView:(id)a3
{
  p_internalInputAccessoryView = &self->_internalInputAccessoryView;
  id v6 = (UIView *)a3;
  if (*p_internalInputAccessoryView != v6)
  {
    objc_storeStrong((id *)&self->_internalInputAccessoryView, a3);
    if (self->_numberPad) {
      [(UITextField *)self->_amountTextField setInputAccessoryView:*p_internalInputAccessoryView];
    }
  }
}

- (UIView)inputAccessoryView
{
  return self->_internalInputAccessoryView;
}

- (void)dismissKeyboard
{
}

- (void)showKeyboard
{
  [(PKEnterCurrencyAmountView *)self _configureAmountTextFieldInputView];
  amountTextField = self->_amountTextField;

  [(UITextField *)amountTextField becomeFirstResponder];
}

- (void)setTextColor:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v4 = [(id)objc_opt_class() _defaultTextColor];
  }
  id v9 = v4;
  char v5 = PKEqualObjects();
  id v6 = v9;
  if ((v5 & 1) == 0)
  {
    v7 = (UIColor *)[v9 copy];
    textColor = self->_textColor;
    self->_textColor = v7;

    if ([(PKEnterCurrencyAmountView *)self isUserInteractionEnabled]) {
      [(UILabel *)self->_amountLabel setTextColor:v9];
    }
    [(PKNumberPadInputView *)self->_numberPad setTextColor:self->_textColor];
    id v6 = v9;
  }
}

- (void)setKeyboardColor:(id)a3
{
  objc_storeStrong((id *)&self->_keyboardColor, a3);
  id v5 = a3;
  [(PKNumberPadInputView *)self->_numberPad setNumberPadColor:v5];
}

- (UIColor)keyboardColor
{
  keyboardColor = self->_keyboardColor;
  if (keyboardColor)
  {
    v3 = keyboardColor;
  }
  else
  {
    v3 = [(PKNumberPadInputView *)self->_numberPad numberPadColor];
  }

  return v3;
}

- (void)setCurrencySymbolFont:(id)a3
{
  id v5 = (UIFont *)a3;
  p_currencySymbolFont = &self->_currencySymbolFont;
  if (self->_currencySymbolFont != v5)
  {
    id v9 = v5;
    objc_storeStrong((id *)&self->_currencySymbolFont, a3);
    if (!*p_currencySymbolFont)
    {
      uint64_t v7 = [MEMORY[0x1E4FB08E0] _lightSystemFontOfSize:70.0];
      char v8 = *p_currencySymbolFont;
      *p_currencySymbolFont = (UIFont *)v7;
    }
    [(PKEnterCurrencyAmountView *)self _updateContent];
    id v5 = v9;
  }
}

- (void)setAmountFont:(id)a3
{
  id v5 = (UIFont *)a3;
  p_amountFont = &self->_amountFont;
  if (self->_amountFont != v5)
  {
    id v9 = v5;
    objc_storeStrong((id *)&self->_amountFont, a3);
    if (!*p_amountFont)
    {
      uint64_t v7 = [MEMORY[0x1E4FB08E0] _lightSystemFontOfSize:70.0];
      char v8 = *p_amountFont;
      *p_amountFont = (UIFont *)v7;
    }
    -[UILabel setFont:](self->_amountLabel, "setFont:");
    [(UILabel *)self->_amountLabel sizeToFit];
    [(PKEnterCurrencyAmountView *)self _updateContent];
    id v5 = v9;
  }
}

- (void)setEnabled:(BOOL)a3
{
  if (self->_enabled != a3)
  {
    self->_enabled = a3;
    amountLabel = self->_amountLabel;
    if (a3)
    {
      textColor = self->_textColor;
      id v5 = self->_amountLabel;
      [(UILabel *)v5 setTextColor:textColor];
    }
    else
    {
      id v6 = [MEMORY[0x1E4FB1618] tertiaryLabelColor];
      [(UILabel *)amountLabel setTextColor:v6];
    }
  }
}

- (CGSize)defaultKeyboardSize
{
  numberPad = self->_numberPad;
  if (numberPad)
  {
    [(PKNumberPadInputView *)numberPad frame];
    double v4 = v3;
    double v6 = v5;
  }
  else
  {
    +[PKNumberPadInputView defaultSizeForInterfaceOrientation:1];
  }
  result.height = v6;
  result.width = v4;
  return result;
}

- (void)layoutSubviews
{
  v10.receiver = self;
  v10.super_class = (Class)PKEnterCurrencyAmountView;
  [(PKEnterCurrencyAmountView *)&v10 layoutSubviews];
  [(PKEnterCurrencyAmountView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  [(UILabel *)self->_amountLabel frame];
  -[UILabel setFrame:](self->_amountLabel, "setFrame:", v4 * 0.5 - v7 * 0.5, 0.0);
  if (v4 != self->_lastLayoutBoundsSize.width || v6 != self->_lastLayoutBoundsSize.height)
  {
    self->_lastLayoutBoundsSize.width = v4;
    self->_lastLayoutBoundsSize.height = v6;
    [(UILabel *)self->_amountLabel _actualScaleFactor];
    self->_labelScaleFactor = v9;
    [(PKEnterCurrencyAmountView *)self _updateContent];
  }
}

- (CGSize)intrinsicContentSize
{
  [(UILabel *)self->_amountLabel intrinsicContentSize];
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[UILabel sizeThatFits:](self->_amountLabel, "sizeThatFits:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (id)viewForFirstBaselineLayout
{
  return self->_amountLabel;
}

- (id)viewForLastBaselineLayout
{
  return self->_amountLabel;
}

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)PKEnterCurrencyAmountView;
  [(PKEnterCurrencyAmountView *)&v3 didMoveToWindow];
  [(PKEnterCurrencyAmountView *)self _createNumberPad];
}

- (void)_createNumberPad
{
  if (!self->_numberPad)
  {
    objc_super v3 = [(PKEnterCurrencyAmountView *)self window];
    double v4 = v3;
    if (v3)
    {
      double v5 = [v3 windowScene];
      double v6 = v5;
      if (v5)
      {
        +[PKNumberPadInputView defaultSizeForInterfaceOrientation:](PKNumberPadInputView, "defaultSizeForInterfaceOrientation:", [v5 interfaceOrientation]);
        double v8 = v7;
        double v10 = v9;
        if ((PKHomeButtonIsAvailable() & 1) == 0)
        {
          [v4 safeAreaInsets];
          double v10 = v10 + v11;
        }
        -[UIView sizeThatFits:](self->_bottomView, "sizeThatFits:", v8, v10);
        double v13 = v12;
        uint64_t v14 = [PKNumberPadInputView alloc];
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __45__PKEnterCurrencyAmountView__createNumberPad__block_invoke;
        v18[3] = &unk_1E59DB8E8;
        v18[4] = self;
        v15 = -[PKNumberPadInputView initWithFrame:delegate:configurator:](v14, "initWithFrame:delegate:configurator:", self, v18, 0.0, 0.0, v8, v10 + v13);
        numberPad = self->_numberPad;
        self->_numberPad = v15;

        [(PKEnterCurrencyAmountView *)self _configureAmountTextFieldInputView];
        if (self->_internalInputAccessoryView) {
          -[UITextField setInputAccessoryView:](self->_amountTextField, "setInputAccessoryView:");
        }
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        if (objc_opt_respondsToSelector()) {
          [WeakRetained enterCurrencyAmountViewDidLayoutKeyboard:self];
        }
      }
    }
  }
}

void __45__PKEnterCurrencyAmountView__createNumberPad__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 432);
  id v4 = a2;
  [v4 setShowsDecimalPointButton:v3];
  [v4 setNumberPadColor:*(void *)(*(void *)(a1 + 32) + 416)];
  [v4 setTextColor:*(void *)(*(void *)(a1 + 32) + 464)];
  [v4 setBottomView:*(void *)(*(void *)(a1 + 32) + 424)];
}

- (void)_configureAmountTextFieldInputView
{
  char v3 = [MEMORY[0x1E4FB18E0] isInHardwareKeyboardMode];
  amountTextField = self->_amountTextField;
  if (v3) {
    numberPad = 0;
  }
  else {
    numberPad = self->_numberPad;
  }

  [(UITextField *)amountTextField setInputView:numberPad];
}

- (void)numberPadInputView:(id)a3 requestReplaceSelectedTextFieldRangeWithText:(id)a4
{
  id v9 = a4;
  double v5 = [(UITextField *)self->_amountTextField selectedTextRange];
  if (v5)
  {
    amountTextField = self->_amountTextField;
    uint64_t v7 = [(UITextField *)amountTextField selectionRange];
    if (-[PKEnterCurrencyAmountView textField:shouldChangeCharactersInRange:replacementString:](self, "textField:shouldChangeCharactersInRange:replacementString:", amountTextField, v7, v8, v9))
    {
      [(UITextField *)self->_amountTextField replaceRange:v5 withText:v9];
    }
  }
}

- (void)numberPadInputViewRequestDeleteText:(id)a3
{
  id v4 = [(UITextField *)self->_amountTextField selectedTextRange];
  if (!v4) {
    return;
  }
  id v19 = v4;
  if (![v4 isEmpty])
  {
    id v11 = v19;
LABEL_7:
    id v19 = v11;
    double v12 = [(UITextField *)self->_amountTextField beginningOfDocument];
    amountTextField = self->_amountTextField;
    uint64_t v14 = [v19 start];
    uint64_t v15 = [(UITextField *)amountTextField offsetFromPosition:v12 toPosition:v14];

    uint64_t v16 = self->_amountTextField;
    v17 = [v19 end];
    uint64_t v18 = [(UITextField *)v16 offsetFromPosition:v12 toPosition:v17];

    if (-[PKEnterCurrencyAmountView textField:shouldChangeCharactersInRange:replacementString:](self, "textField:shouldChangeCharactersInRange:replacementString:", self->_amountTextField, v15, v18 - v15, &stru_1EF1B5B50))
    {
      [(UITextField *)self->_amountTextField replaceRange:v19 withText:&stru_1EF1B5B50];
    }

    goto LABEL_10;
  }
  double v5 = self->_amountTextField;
  double v6 = [v19 start];
  uint64_t v7 = [(UITextField *)v5 positionFromPosition:v6 offset:-1];

  if (v7)
  {
    uint64_t v8 = self->_amountTextField;
    id v9 = [v19 end];
    uint64_t v10 = [(UITextField *)v8 textRangeFromPosition:v7 toPosition:v9];

    id v11 = (id)v10;
    if (!v10) {
      return;
    }
    goto LABEL_7;
  }
LABEL_10:
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length = a4.length;
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = v9;
  if (self->_enabled)
  {
    id v55 = v8;
    id v11 = [v8 text];
    uint64_t v12 = [v11 length];

    unint64_t v13 = 0x1E4F28000uLL;
    if (!v12)
    {
      uint64_t v14 = [MEMORY[0x1E4F28C28] zero];
      uint64_t v15 = [(PKEnterCurrencyAmountView *)self _formatAmount:v14 minimumFractionDigits:0];
      amountString = self->_amountString;
      self->_amountString = v15;
    }
    if (self->_isFirstKeyboardInput && self->_clearAmountOnFirstKeyboardInput)
    {
      v17 = [MEMORY[0x1E4F28C28] zero];
      uint64_t v18 = [(PKEnterCurrencyAmountView *)self _formatAmount:v17 minimumFractionDigits:0];
      id v19 = self->_amountString;
      self->_amountString = v18;
    }
    self->_isFirstKeyboardInput = 0;
    unint64_t v56 = [(NSNumberFormatter *)self->_amountFormatter maximumFractionDigits];
    v54 = [MEMORY[0x1E4F1CA20] currentLocale];
    v20 = [v54 decimalSeparator];
    objc_super v21 = self->_amountString;
    uint64_t v22 = [(NSString *)v21 rangeOfString:v20];
    BOOL v57 = v22 != 0x7FFFFFFFFFFFFFFFLL;
    v23 = [(NSNumberFormatter *)self->_amountFormatter groupingSeparator];
    v24 = [v10 stringByReplacingOccurrencesOfString:v23 withString:&stru_1EF1B5B50];

    v25 = [(PKEnterCurrencyAmountView *)self _decimalNumberFromString:v24];
    v53 = v25;
    if ((([v24 isEqualToString:v20] & 1) != 0
       || v25
       && ([MEMORY[0x1E4F28C28] notANumber],
           v26 = objc_claimAutoreleasedReturnValue(),
           char v27 = [v25 isEqualToNumber:v26],
           v26,
           (v27 & 1) == 0))
      && [v24 length])
    {
      if ([v24 length])
      {
        unint64_t v28 = 0;
        v52 = v20;
        do
        {
          v29 = objc_msgSend(v24, "substringWithRange:", v28, 1);
          if ([v29 isEqualToString:v20])
          {
            if (v57 || v56 == 0)
            {
              v30 = PKLogFacilityTypeGetObject();
              if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_19F450000, v30, OS_LOG_TYPE_DEFAULT, "Ignoring decimal character input, input already has a decimal character", buf, 2u);
              }
            }
            else
            {
              [(NSString *)v21 stringByAppendingString:v29];
              v30 = v21;
              BOOL v57 = 1;
              objc_super v21 = (NSString *)objc_claimAutoreleasedReturnValue();
            }
            goto LABEL_32;
          }
          v30 = [(PKEnterCurrencyAmountView *)self _decimalNumberFromString:v29];
          v31 = [*(id *)(v13 + 3112) notANumber];
          char v32 = [v30 isEqualToNumber:v31];

          if (v32)
          {
            v33 = PKLogFacilityTypeGetObject();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v59 = v29;
              v34 = v33;
              v35 = "Ignoring non-numeric input: %@";
              uint32_t v36 = 12;
LABEL_28:
              _os_log_impl(&dword_19F450000, v34, OS_LOG_TYPE_DEFAULT, v35, buf, v36);
            }
          }
          else
          {
            if (!v57)
            {
              v33 = [(PKEnterCurrencyAmountView *)self _decimalNumberFromString:v21];
              unint64_t v37 = v13;
              v38 = [*(id *)(v13 + 3112) zero];
              int v39 = [v33 isEqualToNumber:v38];

              if (v39)
              {
                v40 = v29;
              }
              else
              {
                v40 = [(NSString *)v21 stringByAppendingString:v29];
              }
              v41 = v40;

              objc_super v21 = v41;
              unint64_t v13 = v37;
              v20 = v52;
              goto LABEL_31;
            }
            if ([(PKEnterCurrencyAmountView *)self _numberOfDecimalPlacesInString:v21 decimalSeperator:v20] >= v56)
            {
              v33 = PKLogFacilityTypeGetObject();
              if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                v34 = v33;
                v35 = "Ignoring input beyond maximum number of decimal places";
                uint32_t v36 = 2;
                goto LABEL_28;
              }
            }
            else
            {
              [(NSString *)v21 stringByAppendingString:v29];
              v33 = v21;
              objc_super v21 = (NSString *)objc_claimAutoreleasedReturnValue();
            }
          }
LABEL_31:

LABEL_32:
          ++v28;
        }
        while (v28 < [v24 length]);
      }
    }
    else if (length && [(NSString *)v21 length])
    {
      if (v22 == 0x7FFFFFFFFFFFFFFFLL || self->_showsDecimalPointButton) {
        uint64_t v42 = [(NSString *)v21 length] - 1;
      }
      else {
        uint64_t v42 = [(NSString *)v21 rangeOfString:v20];
      }
      uint64_t v43 = -[NSString substringWithRange:](v21, "substringWithRange:", 0, v42);

      objc_super v21 = (NSString *)v43;
    }
    v44 = [(PKEnterCurrencyAmountView *)self currentAmount];
    if ([(NSString *)v21 length]) {
      [(PKEnterCurrencyAmountView *)self _decimalNumberFromString:v21];
    }
    else {
    v45 = [*(id *)(v13 + 3112) zero];
    }
    if (v45)
    {
      v46 = [*(id *)(v13 + 3112) notANumber];
      char v47 = [v45 isEqualToNumber:v46];

      if ((v47 & 1) == 0)
      {
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        int v49 = [WeakRetained enterCurrencyAmountView:self shouldChangeAmountFrom:v44 to:v45];

        if (v49)
        {
          objc_storeStrong((id *)&self->_amountString, v21);
          [(PKEnterCurrencyAmountView *)self _updateContent];
          id v50 = objc_loadWeakRetained((id *)&self->_delegate);
          [v50 enterCurrencyAmountViewDidChangeAmount:self];
        }
      }
    }

    id v8 = v55;
  }
  else
  {
    v24 = v9;
  }

  return 0;
}

- (unint64_t)_numberOfDecimalPlacesInString:(id)a3 decimalSeperator:(id)a4
{
  id v5 = a3;
  uint64_t v6 = [v5 rangeOfString:a4 options:4];
  if (v6 == 0x7FFFFFFFFFFFFFFFLL) {
    unint64_t v8 = 0;
  }
  else {
    unint64_t v8 = [v5 length] - (v6 + v7);
  }

  return v8;
}

- (void)_createAmountFormatter
{
  PKMutableNumberFormatterForCurrencyCodeExcludingCurrencySymbols();
  char v3 = (NSNumberFormatter *)objc_claimAutoreleasedReturnValue();
  amountFormatter = self->_amountFormatter;
  self->_amountFormatter = v3;

  [(NSNumberFormatter *)self->_amountFormatter setUsesGroupingSeparator:0];
  [(NSNumberFormatter *)self->_amountFormatter setAlwaysShowsDecimalSeparator:0];
  [(NSNumberFormatter *)self->_amountFormatter setMinimumFractionDigits:0];
  [(NSNumberFormatter *)self->_amountFormatter setGeneratesDecimalNumbers:1];
  [(NSNumberFormatter *)self->_amountFormatter setPositivePrefix:&stru_1EF1B5B50];
  [(NSNumberFormatter *)self->_amountFormatter setPositiveSuffix:&stru_1EF1B5B50];
  [(NSNumberFormatter *)self->_amountFormatter setNegativeSuffix:&stru_1EF1B5B50];
  PKMutableNumberFormatterForCurrencyCode();
  id v5 = (NSNumberFormatter *)objc_claimAutoreleasedReturnValue();
  currencySymbolAmountFormatter = self->_currencySymbolAmountFormatter;
  self->_currencySymbolAmountFormatter = v5;

  [(NSNumberFormatter *)self->_currencySymbolAmountFormatter setGeneratesDecimalNumbers:1];
  __int16 v7 = [(NSNumberFormatter *)self->_amountFormatter maximumFractionDigits];
  unint64_t v8 = [MEMORY[0x1E4F28C30] decimalNumberHandlerWithRoundingMode:0 scale:v7 raiseOnExactness:0 raiseOnOverflow:0 raiseOnUnderflow:0 raiseOnDivideByZero:0];
  roundingBehavior = self->_roundingBehavior;
  self->_roundingBehavior = v8;
}

- (id)_formatAmountForDisplay:(id)a3 alwaysShowDecimalSeparator:(BOOL)a4 minimumFractionDigits:(unint64_t)a5 useGroupingSeparator:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v8 = a4;
  currencySymbolAmountFormatter = self->_currencySymbolAmountFormatter;
  id v11 = a3;
  [(NSNumberFormatter *)currencySymbolAmountFormatter setAlwaysShowsDecimalSeparator:v8];
  [(NSNumberFormatter *)self->_currencySymbolAmountFormatter setMinimumFractionDigits:a5];
  [(NSNumberFormatter *)self->_currencySymbolAmountFormatter setUsesGroupingSeparator:v6];
  uint64_t v12 = [(NSNumberFormatter *)self->_currencySymbolAmountFormatter stringFromNumber:v11];

  unint64_t v13 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
  uint64_t v14 = [v12 stringByTrimmingCharactersInSet:v13];

  return v14;
}

- (void)_addSuperscriptToAttributedString:(id)a3 formattedCurrencyAmount:(id)a4 currencyAmountWithoutSymbols:(id)a5
{
  id v8 = a3;
  if (v8 && a4 && a5)
  {
    id v18 = v8;
    id v9 = a5;
    id v10 = a4;
    id v11 = [v18 string];
    uint64_t v12 = [v11 rangeOfString:v10 options:0];
    uint64_t v14 = v13;

    uint64_t v15 = [v11 rangeOfString:v9 options:0];
    uint64_t v17 = v16;

    if (v12 != 0x7FFFFFFFFFFFFFFFLL && v15 != 0x7FFFFFFFFFFFFFFFLL)
    {
      if (v15 > v12) {
        -[PKEnterCurrencyAmountView _addSuperscriptToAttributedString:inRange:](self, "_addSuperscriptToAttributedString:inRange:", v18, v12, v15 - v12);
      }
      if (v12 + v14 > v15 + v17) {
        -[PKEnterCurrencyAmountView _addSuperscriptToAttributedString:inRange:](self, "_addSuperscriptToAttributedString:inRange:", v18, v15 + v17, v12 + v14 - (v15 + v17));
      }
    }

    id v8 = v18;
  }
}

- (void)_addSuperscriptToAttributedString:(id)a3 inRange:(_NSRange)a4
{
  if (a4.location != 0x7FFFFFFFFFFFFFFFLL)
  {
    NSUInteger length = a4.length;
    NSUInteger location = a4.location;
    amountFont = self->_amountFont;
    id v15 = a3;
    [(UIFont *)amountFont capHeight];
    double v10 = v9;
    [(UIFont *)self->_currencySymbolFont capHeight];
    unint64_t v12 = (unint64_t)((v10 - v11) * self->_labelScaleFactor);
    [v15 beginEditing];
    objc_msgSend(v15, "addAttribute:value:range:", *MEMORY[0x1E4FB06F8], self->_currencySymbolFont, location, length);
    uint64_t v13 = *MEMORY[0x1E4FB06C8];
    uint64_t v14 = [NSNumber numberWithUnsignedInteger:v12];
    objc_msgSend(v15, "addAttribute:value:range:", v13, v14, location, length);

    [v15 endEditing];
  }
}

- (id)_formatAmount:(id)a3 minimumFractionDigits:(unint64_t)a4
{
  amountFormatter = self->_amountFormatter;
  id v7 = a3;
  [(NSNumberFormatter *)amountFormatter setMinimumFractionDigits:a4];
  id v8 = [(NSNumberFormatter *)self->_amountFormatter stringFromNumber:v7];

  return v8;
}

- (id)_decimalNumberFromString:(id)a3
{
  uint64_t v4 = [(NSNumberFormatter *)self->_amountFormatter numberFromString:a3];
  id v5 = [v4 decimalNumberByRoundingAccordingToBehavior:self->_roundingBehavior];

  return v5;
}

- (void)_updateContent
{
  v19[1] = *MEMORY[0x1E4F143B8];
  if (![(NSString *)self->_amountString length])
  {
    char v3 = [MEMORY[0x1E4F28C28] zero];
    uint64_t v4 = [(PKEnterCurrencyAmountView *)self _formatAmount:v3 minimumFractionDigits:0];
    amountString = self->_amountString;
    self->_amountString = v4;
  }
  BOOL v6 = [MEMORY[0x1E4F1CA20] currentLocale];
  id v7 = [v6 decimalSeparator];
  BOOL v8 = [(NSString *)self->_amountString rangeOfString:v7] != 0x7FFFFFFFFFFFFFFFLL;
  unint64_t v9 = [(PKEnterCurrencyAmountView *)self _numberOfDecimalPlacesInString:self->_amountString decimalSeperator:v7];
  double v10 = [(PKEnterCurrencyAmountView *)self currentAmount];
  double v11 = [(PKEnterCurrencyAmountView *)self _formatAmountForDisplay:v10 alwaysShowDecimalSeparator:v8 minimumFractionDigits:v9 useGroupingSeparator:1];
  if (v11)
  {
    id v12 = objc_alloc(MEMORY[0x1E4F28E48]);
    if (self->_kerning) {
      kerning = self->_kerning;
    }
    else {
      kerning = (NSNumber *)&unk_1EF2B9948;
    }
    uint64_t v18 = *MEMORY[0x1E4FB0710];
    v19[0] = kerning;
    uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
    id v15 = (void *)[v12 initWithString:v11 attributes:v14];
  }
  else
  {
    id v15 = 0;
  }
  uint64_t v16 = [(NSNumberFormatter *)self->_currencySymbolAmountFormatter currencySymbol];
  uint64_t v17 = [v11 stringByReplacingOccurrencesOfString:v16 withString:&stru_1EF1B5B50];
  [(PKEnterCurrencyAmountView *)self _addSuperscriptToAttributedString:v15 formattedCurrencyAmount:v11 currencyAmountWithoutSymbols:v17];
  [(UILabel *)self->_amountLabel setAttributedText:v15];
  [(UITextField *)self->_amountTextField setText:v11];
  [(UILabel *)self->_amountLabel sizeToFit];
  [(PKEnterCurrencyAmountView *)self setNeedsLayout];
}

- (void)_createSubviews
{
  char v3 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
  amountLabel = self->_amountLabel;
  self->_amountLabel = v3;

  id v5 = self->_amountLabel;
  BOOL v6 = [(PKEnterCurrencyAmountView *)self amountFont];
  [(UILabel *)v5 setFont:v6];

  [(UILabel *)self->_amountLabel setTextAlignment:1];
  [(UILabel *)self->_amountLabel sizeToFit];
  [(UILabel *)self->_amountLabel setAccessibilityIdentifier:*MEMORY[0x1E4F85878]];
  [(PKEnterCurrencyAmountView *)self addSubview:self->_amountLabel];
  id v7 = objc_alloc_init(_PKEnterCurrencyWithSuggestionsTextField);
  [(_PKEnterCurrencyWithSuggestionsTextField *)v7 setHidden:1];
  [(_PKEnterCurrencyWithSuggestionsTextField *)v7 setDelegate:self];
  id v11 = [(_PKEnterCurrencyWithSuggestionsTextField *)v7 inputAssistantItem];
  uint64_t v8 = MEMORY[0x1E4F1CBF0];
  [v11 setLeadingBarButtonGroups:MEMORY[0x1E4F1CBF0]];
  [v11 setTrailingBarButtonGroups:v8];
  amountTextField = self->_amountTextField;
  self->_amountTextField = &v7->super;
  double v10 = v7;

  [(PKEnterCurrencyAmountView *)self addSubview:self->_amountTextField];
}

- (id)_formattedStringForAmount:(id)a3
{
  id v4 = a3;
  if (objc_msgSend(v4, "pk_isIntegralNumber") && !self->_ignoreIntegralNumber) {
    NSUInteger v5 = 0;
  }
  else {
    NSUInteger v5 = [(NSNumberFormatter *)self->_amountFormatter maximumFractionDigits];
  }
  BOOL v6 = [(PKEnterCurrencyAmountView *)self _formatAmount:v4 minimumFractionDigits:v5];

  return v6;
}

- (BOOL)showsDecimalPointButton
{
  return self->_showsDecimalPointButton;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (BOOL)ignoreIntegralNumber
{
  return self->_ignoreIntegralNumber;
}

- (void)setIgnoreIntegralNumber:(BOOL)a3
{
  self->_ignoreIntegralNumber = a3;
}

- (BOOL)clearAmountOnFirstKeyboardInput
{
  return self->_clearAmountOnFirstKeyboardInput;
}

- (void)setClearAmountOnFirstKeyboardInput:(BOOL)a3
{
  self->_clearAmountOnFirstKeyboardInput = a3;
}

- (UITextField)amountTextField
{
  return self->_amountTextField;
}

- (void)setAmountString:(id)a3
{
}

- (NSString)currency
{
  return self->_currency;
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (UIFont)amountFont
{
  return self->_amountFont;
}

- (UIFont)currencySymbolFont
{
  return self->_currencySymbolFont;
}

- (NSNumber)kerning
{
  return self->_kerning;
}

- (void)setKerning:(id)a3
{
}

- (PKEnterCurrencyAmountViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKEnterCurrencyAmountViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UILabel)amountLabel
{
  return self->_amountLabel;
}

- (void)setAmountLabel:(id)a3
{
}

- (PKNumberPadInputView)numberPad
{
  return self->_numberPad;
}

- (void)setNumberPad:(id)a3
{
}

- (NSDecimalNumberHandler)roundingBehavior
{
  return self->_roundingBehavior;
}

- (void)setRoundingBehavior:(id)a3
{
}

- (NSNumberFormatter)amountFormatter
{
  return self->_amountFormatter;
}

- (void)setAmountFormatter:(id)a3
{
}

- (NSNumberFormatter)currencySymbolAmountFormatter
{
  return self->_currencySymbolAmountFormatter;
}

- (void)setCurrencySymbolAmountFormatter:(id)a3
{
}

- (BOOL)isFirstKeyboardInput
{
  return self->_isFirstKeyboardInput;
}

- (void)setIsFirstKeyboardInput:(BOOL)a3
{
  self->_isFirstKeyboardInput = a3;
}

- (CGSize)lastLayoutBoundsSize
{
  double width = self->_lastLayoutBoundsSize.width;
  double height = self->_lastLayoutBoundsSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setLastLayoutBoundsSize:(CGSize)a3
{
  self->_lastLayoutBoundsSize = a3;
}

- (double)labelScaleFactor
{
  return self->_labelScaleFactor;
}

- (void)setLabelScaleFactor:(double)a3
{
  self->_labelScaleFactor = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currencySymbolAmountFormatter, 0);
  objc_storeStrong((id *)&self->_amountFormatter, 0);
  objc_storeStrong((id *)&self->_roundingBehavior, 0);
  objc_storeStrong((id *)&self->_numberPad, 0);
  objc_storeStrong((id *)&self->_amountLabel, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_kerning, 0);
  objc_storeStrong((id *)&self->_currencySymbolFont, 0);
  objc_storeStrong((id *)&self->_amountFont, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_currency, 0);
  objc_storeStrong((id *)&self->_amountString, 0);
  objc_storeStrong((id *)&self->_amountTextField, 0);
  objc_storeStrong((id *)&self->_bottomView, 0);
  objc_storeStrong((id *)&self->_keyboardColor, 0);

  objc_storeStrong((id *)&self->_internalInputAccessoryView, 0);
}

@end