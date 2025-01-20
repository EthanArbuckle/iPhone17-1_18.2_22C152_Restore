@interface PKSuperscriptedCurrencyAmountLabel
- (BOOL)showsNegativeValueDesignation;
- (BOOL)showsPositiveValueDesignation;
- (CGSize)lastLayedOutBoundsSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSDecimalNumber)amount;
- (NSString)currencyCode;
- (PKSuperscriptedCurrencyAmountLabel)initWithPrimaryFont:(id)a3 superscriptFont:(id)a4 positiveValueTextColor:(id)a5 negativeValueTextColor:(id)a6;
- (UIColor)negativeValueTextColor;
- (UIColor)positiveValueTextColor;
- (UIFont)primaryFont;
- (UIFont)superscriptFont;
- (UILabel)label;
- (double)labelScaleFactor;
- (id)_attributedString;
- (void)_addSuperscriptToAttributedString:(id)a3 formattedCurrencyAmount:(id)a4 currencyAmountWithoutSymbols:(id)a5;
- (void)_addSuperscriptToAttributedString:(id)a3 inRange:(_NSRange)a4;
- (void)_updateLabel;
- (void)layoutSubviews;
- (void)setAmount:(id)a3;
- (void)setAmount:(id)a3 currencyCode:(id)a4;
- (void)setCurrencyCode:(id)a3;
- (void)setLabel:(id)a3;
- (void)setLabelScaleFactor:(double)a3;
- (void)setLastLayedOutBoundsSize:(CGSize)a3;
- (void)setNegativeValueTextColor:(id)a3;
- (void)setPositiveValueTextColor:(id)a3;
- (void)setPrimaryFont:(id)a3;
- (void)setShowsNegativeValueDesignation:(BOOL)a3;
- (void)setShowsPositiveValueDesignation:(BOOL)a3;
- (void)setSuperscriptFont:(id)a3;
@end

@implementation PKSuperscriptedCurrencyAmountLabel

- (PKSuperscriptedCurrencyAmountLabel)initWithPrimaryFont:(id)a3 superscriptFont:(id)a4 positiveValueTextColor:(id)a5 negativeValueTextColor:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)PKSuperscriptedCurrencyAmountLabel;
  v15 = -[PKSuperscriptedCurrencyAmountLabel initWithFrame:](&v20, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_primaryFont, a3);
    objc_storeStrong((id *)&v16->_superscriptFont, a4);
    objc_storeStrong((id *)&v16->_positiveValueTextColor, a5);
    objc_storeStrong((id *)&v16->_negativeValueTextColor, a6);
    v17 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    label = v16->_label;
    v16->_label = v17;

    [(UILabel *)v16->_label setTextAlignment:1];
    [(UILabel *)v16->_label setAdjustsFontSizeToFitWidth:1];
    [(UILabel *)v16->_label setNumberOfLines:1];
    v16->_labelScaleFactor = 1.0;
    [(PKSuperscriptedCurrencyAmountLabel *)v16 addSubview:v16->_label];
  }

  return v16;
}

- (void)setCurrencyCode:(id)a3
{
  v5 = (NSString *)a3;
  if (self->_currencyCode != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_currencyCode, a3);
    [(PKSuperscriptedCurrencyAmountLabel *)self _updateLabel];
    v5 = v6;
  }
}

- (void)setAmount:(id)a3
{
  v5 = (NSDecimalNumber *)a3;
  if (self->_amount != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_amount, a3);
    [(PKSuperscriptedCurrencyAmountLabel *)self _updateLabel];
    v5 = v6;
  }
}

- (void)setAmount:(id)a3 currencyCode:(id)a4
{
  v9 = (NSDecimalNumber *)a3;
  v7 = (NSString *)a4;
  if (self->_amount == v9)
  {
    p_currencyCode = &self->_currencyCode;
    if (self->_currencyCode == v7) {
      goto LABEL_7;
    }
  }
  else
  {
    objc_storeStrong((id *)&self->_amount, a3);
    p_currencyCode = &self->_currencyCode;
    if (self->_currencyCode == v7) {
      goto LABEL_6;
    }
  }
  objc_storeStrong((id *)p_currencyCode, a4);
LABEL_6:
  [(PKSuperscriptedCurrencyAmountLabel *)self _updateLabel];
LABEL_7:
}

- (void)setPrimaryFont:(id)a3
{
  v5 = (UIFont *)a3;
  if (v5 && self->_primaryFont != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_primaryFont, a3);
    [(PKSuperscriptedCurrencyAmountLabel *)self _updateLabel];
    v5 = v6;
  }
}

- (void)setSuperscriptFont:(id)a3
{
  v5 = (UIFont *)a3;
  if (v5 && self->_superscriptFont != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_superscriptFont, a3);
    [(PKSuperscriptedCurrencyAmountLabel *)self _updateLabel];
    v5 = v6;
  }
}

- (void)setPositiveValueTextColor:(id)a3
{
  v5 = (UIColor *)a3;
  if (v5 && self->_positiveValueTextColor != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_positiveValueTextColor, a3);
    [(PKSuperscriptedCurrencyAmountLabel *)self _updateLabel];
    v5 = v6;
  }
}

- (void)setNegativeValueTextColor:(id)a3
{
  v5 = (UIColor *)a3;
  if (v5 && self->_negativeValueTextColor != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_negativeValueTextColor, a3);
    [(PKSuperscriptedCurrencyAmountLabel *)self _updateLabel];
    v5 = v6;
  }
}

- (void)setShowsPositiveValueDesignation:(BOOL)a3
{
  if (self->_showsPositiveValueDesignation != a3)
  {
    self->_showsPositiveValueDesignation = a3;
    [(PKSuperscriptedCurrencyAmountLabel *)self _updateLabel];
  }
}

- (void)setShowsNegativeValueDesignation:(BOOL)a3
{
  if (self->_showsNegativeValueDesignation != a3)
  {
    self->_showsNegativeValueDesignation = a3;
    [(PKSuperscriptedCurrencyAmountLabel *)self _updateLabel];
  }
}

- (void)layoutSubviews
{
  v9.receiver = self;
  v9.super_class = (Class)PKSuperscriptedCurrencyAmountLabel;
  [(PKSuperscriptedCurrencyAmountLabel *)&v9 layoutSubviews];
  [(PKSuperscriptedCurrencyAmountLabel *)self bounds];
  double v4 = v3;
  double v6 = v5;
  -[UILabel setFrame:](self->_label, "setFrame:");
  if (v4 != self->_lastLayedOutBoundsSize.width || v6 != self->_lastLayedOutBoundsSize.height)
  {
    self->_lastLayedOutBoundsSize.width = v4;
    self->_lastLayedOutBoundsSize.height = v6;
    [(UILabel *)self->_label _actualScaleFactor];
    self->_labelScaleFactor = v8;
    [(PKSuperscriptedCurrencyAmountLabel *)self _updateLabel];
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[UILabel sizeThatFits:](self->_label, "sizeThatFits:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)_updateLabel
{
  self->_lastLayedOutBoundsSize = (CGSize)*MEMORY[0x1E4F1DB30];
  id v3 = [(PKSuperscriptedCurrencyAmountLabel *)self _attributedString];
  [(UILabel *)self->_label setAttributedText:v3];
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
        -[PKSuperscriptedCurrencyAmountLabel _addSuperscriptToAttributedString:inRange:](self, "_addSuperscriptToAttributedString:inRange:", v18, v12, v15 - v12);
      }
      if (v12 + v14 > v15 + v17) {
        -[PKSuperscriptedCurrencyAmountLabel _addSuperscriptToAttributedString:inRange:](self, "_addSuperscriptToAttributedString:inRange:", v18, v15 + v17, v12 + v14 - (v15 + v17));
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
    primaryFont = self->_primaryFont;
    id v15 = a3;
    [(UIFont *)primaryFont capHeight];
    double v10 = v9;
    [(UIFont *)self->_superscriptFont capHeight];
    unint64_t v12 = (unint64_t)((v10 - v11) * self->_labelScaleFactor);
    [v15 beginEditing];
    objc_msgSend(v15, "addAttribute:value:range:", *MEMORY[0x1E4FB06F8], self->_superscriptFont, location, length);
    uint64_t v13 = *MEMORY[0x1E4FB06C8];
    uint64_t v14 = [NSNumber numberWithUnsignedInteger:v12];
    objc_msgSend(v15, "addAttribute:value:range:", v13, v14, location, length);

    [v15 endEditing];
  }
}

- (id)_attributedString
{
  v23[3] = *MEMORY[0x1E4F143B8];
  amount = self->_amount;
  if (!amount
    || !self->_currencyCode
    || !self->_primaryFont
    || !self->_superscriptFont
    || (p_positiveValueTextColor = &self->_positiveValueTextColor, !self->_positiveValueTextColor)
    || !self->_negativeValueTextColor)
  {
    id v18 = 0;
    goto LABEL_13;
  }
  double v5 = [MEMORY[0x1E4F28C28] zero];
  uint64_t v6 = [(NSDecimalNumber *)amount compare:v5];

  v7 = self->_amount;
  if (v6 == -1)
  {
    id v8 = self->_amount;
    double v9 = [MEMORY[0x1E4F28C28] decimalNumberWithMantissa:1 exponent:0 isNegative:1];
    uint64_t v10 = [(NSDecimalNumber *)v8 decimalNumberByMultiplyingBy:v9];

    p_positiveValueTextColor = &self->_negativeValueTextColor;
    v7 = (NSDecimalNumber *)v10;
  }
  v22[0] = *MEMORY[0x1E4FB06C0];
  double v11 = [MEMORY[0x1E4FB1618] clearColor];
  uint64_t v12 = *MEMORY[0x1E4FB0700];
  uint64_t v13 = *p_positiveValueTextColor;
  v23[0] = v11;
  v23[1] = v13;
  uint64_t v14 = *MEMORY[0x1E4FB06F8];
  v22[1] = v12;
  v22[2] = v14;
  v23[2] = self->_primaryFont;
  id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:3];

  uint64_t v16 = PKFormattedCurrencyStringFromNumber();
  uint64_t v17 = PKFormattedCurrencyStringExcludingCurrencySymbolsFromNumber();
  if (v6 == -1)
  {
    if (self->_showsNegativeValueDesignation)
    {
      PKLocalizedPaymentString(&cfstr_SuperscriptedC_0.isa, &stru_1EF1B4C70.isa, v16);
      goto LABEL_18;
    }
LABEL_19:
    uint64_t v20 = [NSString stringWithFormat:@"%@", v16];
    goto LABEL_20;
  }
  if (!self->_showsPositiveValueDesignation) {
    goto LABEL_19;
  }
  PKLocalizedPaymentString(&cfstr_SuperscriptedC.isa, &stru_1EF1B4C70.isa, v16);
  uint64_t v20 = LABEL_18:;
LABEL_20:
  v21 = (void *)v20;
  id v18 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v20 attributes:v15];
  [(PKSuperscriptedCurrencyAmountLabel *)self _addSuperscriptToAttributedString:v18 formattedCurrencyAmount:v16 currencyAmountWithoutSymbols:v17];

LABEL_13:

  return v18;
}

- (NSString)currencyCode
{
  return self->_currencyCode;
}

- (NSDecimalNumber)amount
{
  return self->_amount;
}

- (UIFont)primaryFont
{
  return self->_primaryFont;
}

- (UIFont)superscriptFont
{
  return self->_superscriptFont;
}

- (UIColor)positiveValueTextColor
{
  return self->_positiveValueTextColor;
}

- (UIColor)negativeValueTextColor
{
  return self->_negativeValueTextColor;
}

- (BOOL)showsPositiveValueDesignation
{
  return self->_showsPositiveValueDesignation;
}

- (BOOL)showsNegativeValueDesignation
{
  return self->_showsNegativeValueDesignation;
}

- (UILabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (CGSize)lastLayedOutBoundsSize
{
  double width = self->_lastLayedOutBoundsSize.width;
  double height = self->_lastLayedOutBoundsSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setLastLayedOutBoundsSize:(CGSize)a3
{
  self->_lastLayedOutBoundsSize = a3;
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
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_negativeValueTextColor, 0);
  objc_storeStrong((id *)&self->_positiveValueTextColor, 0);
  objc_storeStrong((id *)&self->_superscriptFont, 0);
  objc_storeStrong((id *)&self->_primaryFont, 0);
  objc_storeStrong((id *)&self->_amount, 0);

  objc_storeStrong((id *)&self->_currencyCode, 0);
}

@end