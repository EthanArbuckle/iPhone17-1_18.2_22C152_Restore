@interface PKEnterValueNewBalanceView
- (BOOL)amountIsWithdrawal;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSDecimalNumber)cardBalance;
- (NSDecimalNumber)maxBalance;
- (NSDecimalNumber)maxLoadAmount;
- (NSDecimalNumber)minBalance;
- (NSDecimalNumber)minLoadAmount;
- (NSString)currencyCode;
- (NSString)maxLoadAmountText;
- (NSString)promptText;
- (NSString)updatedBalancePromptText;
- (PKEnterValueNewBalanceView)init;
- (PKEnterValueNewBalanceView)initWithCurrencyCode:(id)a3;
- (PKEnterValueNewBalanceViewDelegate)delegate;
- (id)_minimalFormattedStringForAmount:(id)a3;
- (id)_textForPrompt:(id)a3 amount:(id)a4;
- (void)_addSubviews;
- (void)_createAmountFormatter;
- (void)_updateAdditionalAmount:(id)a3 subtractAdditionalAmountFromCurrentAmount:(BOOL)a4;
- (void)_updateBalanceText;
- (void)addAmountToBalance:(id)a3;
- (void)currentBalanceTapRecognized;
- (void)layoutSubviews;
- (void)setAmountIsWithdrawal:(BOOL)a3;
- (void)setCardBalance:(id)a3;
- (void)setCurrencyCode:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setMaxBalance:(id)a3;
- (void)setMaxLoadAmount:(id)a3;
- (void)setMaxLoadAmountText:(id)a3;
- (void)setMinBalance:(id)a3;
- (void)setMinLoadAmount:(id)a3;
- (void)setPromptText:(id)a3;
- (void)setUpdatedBalancePromptText:(id)a3;
- (void)showSpinner:(BOOL)a3;
- (void)subtractAmountFromBalance:(id)a3;
@end

@implementation PKEnterValueNewBalanceView

- (PKEnterValueNewBalanceView)init
{
  return [(PKEnterValueNewBalanceView *)self initWithCurrencyCode:0];
}

- (PKEnterValueNewBalanceView)initWithCurrencyCode:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PKEnterValueNewBalanceView;
  v5 = [(PKEnterValueNewBalanceView *)&v16 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    currencyCode = v5->_currencyCode;
    v5->_currencyCode = (NSString *)v6;

    v8 = PKLocalizedPaymentString(&cfstr_PerformActionE_0.isa);
    [(PKEnterValueNewBalanceView *)v5 setPromptText:v8];

    v9 = PKLocalizedPaymentString(&cfstr_PerformActionE_1.isa);
    [(PKEnterValueNewBalanceView *)v5 setUpdatedBalancePromptText:v9];

    v10 = PKLocalizedPaymentString(&cfstr_PerformActionE_2.isa);
    [(PKEnterValueNewBalanceView *)v5 setMaxLoadAmountText:v10];

    [(PKEnterValueNewBalanceView *)v5 _createAmountFormatter];
    uint64_t v11 = [MEMORY[0x1E4F28C28] zero];
    cardBalance = v5->_cardBalance;
    v5->_cardBalance = (NSDecimalNumber *)v11;

    uint64_t v13 = [MEMORY[0x1E4F28C28] zero];
    additionalAmount = v5->_additionalAmount;
    v5->_additionalAmount = (NSDecimalNumber *)v13;

    [(PKEnterValueNewBalanceView *)v5 _addSubviews];
  }

  return v5;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)PKEnterValueNewBalanceView;
  [(PKEnterValueNewBalanceView *)&v4 layoutSubviews];
  [(PKEnterValueNewBalanceView *)self bounds];
  label = self->_label;
  CGRect v6 = CGRectInset(v5, 13.0, 0.0);
  -[UILabel setFrame:](label, "setFrame:", v6.origin.x, v6.origin.y, v6.size.width, v6.size.height);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  if (self->_showSpinner)
  {
    [(UIActivityIndicatorView *)self->_spinner frame];
    double v4 = v3;
    double v6 = v5;
  }
  else
  {
    double width = a3.width;
    -[UILabel sizeThatFits:](self->_label, "sizeThatFits:", a3.width + -26.0, a3.height);
    double v4 = fmin(v8 + 26.0, width);
  }
  result.height = v6;
  result.double width = v4;
  return result;
}

- (void)showSpinner:(BOOL)a3
{
  if (self->_showSpinner != a3)
  {
    self->_showSpinner = a3;
    spinner = self->_spinner;
    if (a3)
    {
      if (!spinner)
      {
        double v5 = (UIActivityIndicatorView *)[objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:100];
        double v6 = self->_spinner;
        self->_spinner = v5;

        [(UIActivityIndicatorView *)self->_spinner startAnimating];
        [(UIActivityIndicatorView *)self->_spinner sizeToFit];
        [(PKEnterValueNewBalanceView *)self addSubview:self->_spinner];
      }
      [(UILabel *)self->_label removeFromSuperview];
    }
    else
    {
      [(UIActivityIndicatorView *)spinner removeFromSuperview];
      v7 = [(UILabel *)self->_label superview];

      if (!v7) {
        [(PKEnterValueNewBalanceView *)self addSubview:self->_label];
      }
    }
    [(PKEnterValueNewBalanceView *)self sizeToFit];
    [(PKEnterValueNewBalanceView *)self setNeedsLayout];
  }
}

- (void)addAmountToBalance:(id)a3
{
}

- (void)subtractAmountFromBalance:(id)a3
{
}

- (void)_updateAdditionalAmount:(id)a3 subtractAdditionalAmountFromCurrentAmount:(BOOL)a4
{
  v7 = (NSDecimalNumber *)a3;
  p_additionalAmount = &self->_additionalAmount;
  if (self->_additionalAmount != v7)
  {
    uint64_t v13 = v7;
    objc_storeStrong((id *)&self->_additionalAmount, a3);
    self->_subtractAdditionalAmountFromCurrentAmount = a4;
    if (!*p_additionalAmount
      || ([MEMORY[0x1E4F28C28] notANumber],
          v9 = objc_claimAutoreleasedReturnValue(),
          int v10 = [(NSDecimalNumber *)v13 isEqual:v9],
          v9,
          v10))
    {
      uint64_t v11 = [MEMORY[0x1E4F28C28] zero];
      v12 = *p_additionalAmount;
      *p_additionalAmount = (NSDecimalNumber *)v11;
    }
    [(PKEnterValueNewBalanceView *)self _updateBalanceText];
    [(PKEnterValueNewBalanceView *)self sizeToFit];
    [(PKEnterValueNewBalanceView *)self setNeedsLayout];
    v7 = v13;
  }
}

- (void)setMaxBalance:(id)a3
{
  double v5 = (NSDecimalNumber *)a3;
  double v6 = v5;
  if (self->_maxBalance != v5)
  {
    double v8 = v5;
    char v7 = -[NSDecimalNumber isEqualToNumber:](v5, "isEqualToNumber:");
    double v6 = v8;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_maxBalance, a3);
      [(PKEnterValueNewBalanceView *)self _updateBalanceText];
      [(PKEnterValueNewBalanceView *)self sizeToFit];
      [(PKEnterValueNewBalanceView *)self setNeedsLayout];
      double v6 = v8;
    }
  }
}

- (void)setMinBalance:(id)a3
{
  double v5 = (NSDecimalNumber *)a3;
  double v6 = v5;
  if (self->_minBalance != v5)
  {
    double v8 = v5;
    char v7 = -[NSDecimalNumber isEqualToNumber:](v5, "isEqualToNumber:");
    double v6 = v8;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_minBalance, a3);
      [(PKEnterValueNewBalanceView *)self _updateBalanceText];
      [(PKEnterValueNewBalanceView *)self sizeToFit];
      [(PKEnterValueNewBalanceView *)self setNeedsLayout];
      double v6 = v8;
    }
  }
}

- (void)setMaxLoadAmount:(id)a3
{
  double v5 = (NSDecimalNumber *)a3;
  double v6 = v5;
  if (self->_maxLoadAmount != v5)
  {
    double v8 = v5;
    char v7 = -[NSDecimalNumber isEqualToNumber:](v5, "isEqualToNumber:");
    double v6 = v8;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_maxLoadAmount, a3);
      [(PKEnterValueNewBalanceView *)self _updateBalanceText];
      [(PKEnterValueNewBalanceView *)self sizeToFit];
      [(PKEnterValueNewBalanceView *)self setNeedsLayout];
      double v6 = v8;
    }
  }
}

- (void)setMinLoadAmount:(id)a3
{
  double v5 = (NSDecimalNumber *)a3;
  double v6 = v5;
  if (self->_minLoadAmount != v5)
  {
    double v8 = v5;
    char v7 = -[NSDecimalNumber isEqualToNumber:](v5, "isEqualToNumber:");
    double v6 = v8;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_minLoadAmount, a3);
      [(PKEnterValueNewBalanceView *)self _updateBalanceText];
      [(PKEnterValueNewBalanceView *)self sizeToFit];
      [(PKEnterValueNewBalanceView *)self setNeedsLayout];
      double v6 = v8;
    }
  }
}

- (void)setCardBalance:(id)a3
{
  double v5 = (NSDecimalNumber *)a3;
  double v6 = v5;
  p_cardBalance = &self->_cardBalance;
  if (self->_cardBalance != v5)
  {
    uint64_t v13 = v5;
    char v8 = -[NSDecimalNumber isEqualToNumber:](v5, "isEqualToNumber:");
    double v6 = v13;
    if ((v8 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_cardBalance, a3);
      if (!*p_cardBalance
        || ([MEMORY[0x1E4F28C28] notANumber],
            v9 = objc_claimAutoreleasedReturnValue(),
            int v10 = [(NSDecimalNumber *)v13 isEqual:v9],
            v9,
            v10))
      {
        uint64_t v11 = [MEMORY[0x1E4F28C28] zero];
        v12 = *p_cardBalance;
        *p_cardBalance = (NSDecimalNumber *)v11;
      }
      [(PKEnterValueNewBalanceView *)self _updateBalanceText];
      [(PKEnterValueNewBalanceView *)self sizeToFit];
      [(PKEnterValueNewBalanceView *)self setNeedsLayout];
      double v6 = v13;
    }
  }
}

- (void)setCurrencyCode:(id)a3
{
  double v5 = (NSString *)a3;
  if (self->_currencyCode != v5)
  {
    double v6 = v5;
    objc_storeStrong((id *)&self->_currencyCode, a3);
    if (self->_currencyCode)
    {
      [(PKEnterValueNewBalanceView *)self addSubview:self->_label];
      [(PKEnterValueNewBalanceView *)self _createAmountFormatter];
    }
    else
    {
      [(UILabel *)self->_label removeFromSuperview];
    }
    [(PKEnterValueNewBalanceView *)self _updateBalanceText];
    [(PKEnterValueNewBalanceView *)self sizeToFit];
    [(PKEnterValueNewBalanceView *)self setNeedsLayout];
    double v5 = v6;
  }
}

- (void)setPromptText:(id)a3
{
  id v5 = a3;
  p_promptText = &self->_promptText;
  promptText = self->_promptText;
  uint64_t v13 = (NSString *)v5;
  char v8 = promptText;
  if (v8 == v13)
  {

LABEL_11:
    int v10 = v13;
    goto LABEL_12;
  }
  if (!v13 || !v8)
  {

    goto LABEL_8;
  }
  BOOL v9 = [(NSString *)v13 isEqualToString:v8];

  int v10 = v13;
  if (!v9)
  {
LABEL_8:
    objc_storeStrong((id *)&self->_promptText, a3);
    if (!*p_promptText)
    {
      uint64_t v11 = PKLocalizedPaymentString(&cfstr_PerformActionE_0.isa);
      v12 = *p_promptText;
      *p_promptText = (NSString *)v11;
    }
    [(PKEnterValueNewBalanceView *)self _updateBalanceText];
    goto LABEL_11;
  }
LABEL_12:
}

- (void)setUpdatedBalancePromptText:(id)a3
{
  id v5 = a3;
  p_updatedBalancePromptText = &self->_updatedBalancePromptText;
  updatedBalancePromptText = self->_updatedBalancePromptText;
  uint64_t v13 = (NSString *)v5;
  char v8 = updatedBalancePromptText;
  if (v8 == v13)
  {

LABEL_11:
    int v10 = v13;
    goto LABEL_12;
  }
  if (!v13 || !v8)
  {

    goto LABEL_8;
  }
  BOOL v9 = [(NSString *)v13 isEqualToString:v8];

  int v10 = v13;
  if (!v9)
  {
LABEL_8:
    objc_storeStrong((id *)&self->_updatedBalancePromptText, a3);
    if (!*p_updatedBalancePromptText)
    {
      uint64_t v11 = PKLocalizedPaymentString(&cfstr_PerformActionE_1.isa);
      v12 = *p_updatedBalancePromptText;
      *p_updatedBalancePromptText = (NSString *)v11;
    }
    [(PKEnterValueNewBalanceView *)self _updateBalanceText];
    goto LABEL_11;
  }
LABEL_12:
}

- (void)setMaxLoadAmountText:(id)a3
{
  id v5 = a3;
  p_maxLoadAmountText = &self->_maxLoadAmountText;
  maxLoadAmountText = self->_maxLoadAmountText;
  uint64_t v13 = (NSString *)v5;
  char v8 = maxLoadAmountText;
  if (v8 == v13)
  {

LABEL_11:
    int v10 = v13;
    goto LABEL_12;
  }
  if (!v13 || !v8)
  {

    goto LABEL_8;
  }
  BOOL v9 = [(NSString *)v13 isEqualToString:v8];

  int v10 = v13;
  if (!v9)
  {
LABEL_8:
    objc_storeStrong((id *)&self->_maxLoadAmountText, a3);
    if (!*p_maxLoadAmountText)
    {
      uint64_t v11 = PKLocalizedPaymentString(&cfstr_PerformActionE_2.isa);
      v12 = *p_maxLoadAmountText;
      *p_maxLoadAmountText = (NSString *)v11;
    }
    [(PKEnterValueNewBalanceView *)self _updateBalanceText];
    goto LABEL_11;
  }
LABEL_12:
}

- (id)_minimalFormattedStringForAmount:(id)a3
{
  id v4 = a3;
  if (v4 && self->_currencyCode)
  {
    id v5 = (void *)[objc_alloc(MEMORY[0x1E4F84610]) initWithAmount:v4 currency:self->_currencyCode exponent:0];
    double v6 = [v5 minimalFormattedStringValue];
  }
  else
  {
    double v6 = 0;
  }

  return v6;
}

- (id)_textForPrompt:(id)a3 amount:(id)a4
{
  id v6 = a3;
  char v7 = [(PKEnterValueNewBalanceView *)self _minimalFormattedStringForAmount:a4];
  char v8 = [NSString stringWithFormat:@"%@ %@", v6, v7];

  return v8;
}

- (void)_updateBalanceText
{
  BOOL subtractAdditionalAmountFromCurrentAmount = self->_subtractAdditionalAmountFromCurrentAmount;
  p_cardBalance = &self->_cardBalance;
  cardBalance = self->_cardBalance;
  additionalAmount = self->_additionalAmount;
  if (subtractAdditionalAmountFromCurrentAmount) {
    [(NSDecimalNumber *)cardBalance decimalNumberBySubtracting:additionalAmount];
  }
  else {
  uint64_t v7 = [(NSDecimalNumber *)cardBalance decimalNumberByAdding:additionalAmount];
  }
  maxBalance = self->_maxBalance;
  id v36 = (id)v7;
  if (maxBalance) {
    BOOL v9 = [(NSDecimalNumber *)maxBalance compare:v7] != NSOrderedAscending;
  }
  else {
    BOOL v9 = 1;
  }
  p_maxLoadAmount = (id *)&self->_maxLoadAmount;
  maxLoadAmount = self->_maxLoadAmount;
  v34 = p_cardBalance;
  if (maxLoadAmount)
  {
    BOOL v12 = [(NSDecimalNumber *)maxLoadAmount compare:self->_additionalAmount] == NSOrderedAscending;
    if (*p_maxLoadAmount && self->_maxBalance && !self->_subtractAdditionalAmountFromCurrentAmount)
    {
      uint64_t v13 = -[NSDecimalNumber decimalNumberByAdding:](*p_cardBalance, "decimalNumberByAdding:");
      BOOL v14 = [v13 compare:self->_maxBalance] == -1;

      goto LABEL_14;
    }
  }
  else
  {
    BOOL v12 = 0;
  }
  BOOL v14 = 0;
LABEL_14:
  v15 = self->_additionalAmount;
  objc_super v16 = objc_msgSend(MEMORY[0x1E4F28C28], "zero", v34);
  uint64_t v17 = [(NSDecimalNumber *)v15 compare:v16];

  if (!v17)
  {
    label = self->_label;
    uint64_t v23 = [(PKEnterValueNewBalanceView *)self promptText];
    goto LABEL_22;
  }
  if (v9 || v14)
  {
    if (v12)
    {
      v18 = self->_label;
      v19 = [(PKEnterValueNewBalanceView *)self maxLoadAmountText];
      v20 = v35;
      if (!self->_amountIsWithdrawal || [*p_maxLoadAmount compare:*v35] != 1) {
        v20 = &self->_maxLoadAmount;
      }
      v21 = [(PKEnterValueNewBalanceView *)self _textForPrompt:v19 amount:*v20];
      [(UILabel *)v18 setText:v21];

      goto LABEL_25;
    }
    minLoadAmount = self->_minLoadAmount;
    if (minLoadAmount
      && [(NSDecimalNumber *)minLoadAmount compare:self->_additionalAmount] == NSOrderedDescending)
    {
      v27 = self->_label;
      v28 = PKLocalizedPaymentString(&cfstr_PerformActionE_4.isa);
      v29 = self->_minLoadAmount;
      goto LABEL_24;
    }
    minBalance = self->_minBalance;
    if (minBalance
      && [(NSDecimalNumber *)minBalance compare:v36] == NSOrderedDescending
      && self->_subtractAdditionalAmountFromCurrentAmount)
    {
      v27 = self->_label;
      v28 = PKLocalizedPaymentString(&cfstr_PerformActionE.isa);
      v29 = *v35;
      goto LABEL_24;
    }
    label = self->_label;
    uint64_t v23 = [(PKEnterValueNewBalanceView *)self updatedBalancePromptText];
LABEL_22:
    v24 = (void *)v23;
    v25 = [(PKEnterValueNewBalanceView *)self _textForPrompt:v23 amount:v36];
    [(UILabel *)label setText:v25];

    uint64_t v26 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    goto LABEL_26;
  }
  v27 = self->_label;
  v28 = PKLocalizedPaymentString(&cfstr_PerformActionE_3.isa);
  v29 = self->_maxBalance;
LABEL_24:
  v30 = [(PKEnterValueNewBalanceView *)self _textForPrompt:v28 amount:v29];
  [(UILabel *)v27 setText:v30];

LABEL_25:
  uint64_t v26 = [MEMORY[0x1E4FB1618] labelColor];
LABEL_26:
  v31 = (void *)v26;
  [(UILabel *)self->_label setTextColor:v26];
  [(UILabel *)self->_label sizeToFit];
  [(PKEnterValueNewBalanceView *)self setNeedsLayout];
}

- (void)currentBalanceTapRecognized
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  double v3 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    char v4 = objc_opt_respondsToSelector();
    double v3 = v5;
    if (v4)
    {
      [v5 didTapNewBalanceView];
      double v3 = v5;
    }
  }
}

- (void)_createAmountFormatter
{
  PKMutableNumberFormatterForCurrencyCode();
  double v3 = (NSNumberFormatter *)objc_claimAutoreleasedReturnValue();
  currentAmountFormatter = self->_currentAmountFormatter;
  self->_currentAmountFormatter = v3;

  [(NSNumberFormatter *)self->_currentAmountFormatter setAlwaysShowsDecimalSeparator:0];
  id v5 = self->_currentAmountFormatter;

  [(NSNumberFormatter *)v5 setMinimumFractionDigits:0];
}

- (void)_addSubviews
{
  double v3 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
  label = self->_label;
  self->_label = v3;

  id v5 = self->_label;
  id v6 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  [(UILabel *)v5 setTextColor:v6];

  uint64_t v7 = self->_label;
  char v8 = PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB28C8], (NSString *)*MEMORY[0x1E4FB2790]);
  [(UILabel *)v7 setFont:v8];

  [(UILabel *)self->_label setNumberOfLines:2];
  [(UILabel *)self->_label setMinimumScaleFactor:0.5];
  [(UILabel *)self->_label setAdjustsFontSizeToFitWidth:1];
  [(UILabel *)self->_label setTextAlignment:1];
  [(UILabel *)self->_label sizeToFit];
  [(UILabel *)self->_label setUserInteractionEnabled:1];
  [(UILabel *)self->_label setAccessibilityIdentifier:*MEMORY[0x1E4F85A60]];
  BOOL v9 = (UITapGestureRecognizer *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel_currentBalanceTapRecognized];
  tapRecognizer = self->_tapRecognizer;
  self->_tapRecognizer = v9;

  [(UITapGestureRecognizer *)self->_tapRecognizer setDelegate:self];
  [(UITapGestureRecognizer *)self->_tapRecognizer setNumberOfTapsRequired:1];
  [(UILabel *)self->_label addGestureRecognizer:self->_tapRecognizer];
  [(PKEnterValueNewBalanceView *)self addSubview:self->_label];

  [(PKEnterValueNewBalanceView *)self _updateBalanceText];
}

- (NSString)promptText
{
  return self->_promptText;
}

- (NSString)updatedBalancePromptText
{
  return self->_updatedBalancePromptText;
}

- (NSString)maxLoadAmountText
{
  return self->_maxLoadAmountText;
}

- (NSString)currencyCode
{
  return self->_currencyCode;
}

- (NSDecimalNumber)cardBalance
{
  return self->_cardBalance;
}

- (NSDecimalNumber)maxBalance
{
  return self->_maxBalance;
}

- (NSDecimalNumber)minBalance
{
  return self->_minBalance;
}

- (NSDecimalNumber)maxLoadAmount
{
  return self->_maxLoadAmount;
}

- (NSDecimalNumber)minLoadAmount
{
  return self->_minLoadAmount;
}

- (PKEnterValueNewBalanceViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKEnterValueNewBalanceViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)amountIsWithdrawal
{
  return self->_amountIsWithdrawal;
}

- (void)setAmountIsWithdrawal:(BOOL)a3
{
  self->_amountIsWithdrawal = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_minLoadAmount, 0);
  objc_storeStrong((id *)&self->_maxLoadAmount, 0);
  objc_storeStrong((id *)&self->_minBalance, 0);
  objc_storeStrong((id *)&self->_maxBalance, 0);
  objc_storeStrong((id *)&self->_cardBalance, 0);
  objc_storeStrong((id *)&self->_currencyCode, 0);
  objc_storeStrong((id *)&self->_maxLoadAmountText, 0);
  objc_storeStrong((id *)&self->_updatedBalancePromptText, 0);
  objc_storeStrong((id *)&self->_promptText, 0);
  objc_storeStrong((id *)&self->_tapRecognizer, 0);
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_currentAmountFormatter, 0);

  objc_storeStrong((id *)&self->_additionalAmount, 0);
}

@end