@interface PKCurrencyAmountEntryCollectionViewCell
- (BOOL)_inputIsValid:(id)a3;
- (BOOL)isEditable;
- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5;
- (BOOL)textFieldShouldBeginEditing:(id)a3;
- (CGSize)_layoutWithBounds:(CGRect)a3 isTemplateLayout:(BOOL)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)title;
- (PKCurrencyAmount)currencyAmount;
- (PKCurrencyAmountEntryCollectionViewCell)init;
- (PKCurrencyAmountEntryCollectionViewCell)initWithFrame:(CGRect)a3;
- (PKCurrencyAmountEntryCollectionViewCellDelegate)delegate;
- (UIColor)titleColor;
- (id)_amountFromInput:(id)a3;
- (void)layoutSubviews;
- (void)setCurrencyAmount:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIsEditable:(BOOL)a3;
- (void)setTitle:(id)a3;
- (void)setTitleColor:(id)a3;
- (void)textFieldDidEndEditing:(id)a3;
@end

@implementation PKCurrencyAmountEntryCollectionViewCell

- (PKCurrencyAmountEntryCollectionViewCell)init
{
  return -[PKCurrencyAmountEntryCollectionViewCell initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
}

- (PKCurrencyAmountEntryCollectionViewCell)initWithFrame:(CGRect)a3
{
  v20.receiver = self;
  v20.super_class = (Class)PKCurrencyAmountEntryCollectionViewCell;
  v3 = -[PKCurrencyAmountEntryCollectionViewCell initWithFrame:](&v20, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(PKCurrencyAmountEntryCollectionViewCell *)v3 contentView];
    uint64_t v6 = [MEMORY[0x1E4FB1618] labelColor];
    titleColor = v4->_titleColor;
    v4->_titleColor = (UIColor *)v6;

    id v8 = objc_alloc(MEMORY[0x1E4FB1930]);
    uint64_t v9 = objc_msgSend(v8, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = (UILabel *)v9;

    [(UILabel *)v4->_titleLabel setTextColor:v4->_titleColor];
    [(UILabel *)v4->_titleLabel setNumberOfLines:1];
    v11 = v4->_titleLabel;
    v12 = (NSString *)*MEMORY[0x1E4FB28C8];
    v13 = PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB28C8], 0);
    [(UILabel *)v11 setFont:v13];

    [v5 addSubview:v4->_titleLabel];
    LODWORD(v11) = [(PKCurrencyAmountEntryCollectionViewCell *)v4 _shouldReverseLayoutDirection];
    v14 = (UITextField *)objc_alloc_init(MEMORY[0x1E4FB1D70]);
    amountTextField = v4->_amountTextField;
    v4->_amountTextField = v14;

    [(UITextField *)v4->_amountTextField setKeyboardType:8];
    if (v11) {
      uint64_t v16 = 0;
    }
    else {
      uint64_t v16 = 2;
    }
    [(UITextField *)v4->_amountTextField setTextAlignment:v16];
    v17 = v4->_amountTextField;
    v18 = PKFontForDefaultDesign(v12, 0);
    [(UITextField *)v17 setFont:v18];

    [(UITextField *)v4->_amountTextField setDelegate:v4];
    [v5 addSubview:v4->_amountTextField];
  }
  return v4;
}

- (void)setTitle:(id)a3
{
  id v4 = a3;
  v5 = self->_title;
  uint64_t v6 = (NSString *)v4;
  v10 = v6;
  if (v5 == v6)
  {

    goto LABEL_9;
  }
  if (!v6 || !v5)
  {

    goto LABEL_8;
  }
  BOOL v7 = [(NSString *)v5 isEqualToString:v6];

  if (!v7)
  {
LABEL_8:
    id v8 = (NSString *)[(NSString *)v10 copy];
    title = self->_title;
    self->_title = v8;

    [(UILabel *)self->_titleLabel setText:self->_title];
    [(PKCurrencyAmountEntryCollectionViewCell *)self setNeedsLayout];
  }
LABEL_9:
}

- (void)setTitleColor:(id)a3
{
  p_titleColor = &self->_titleColor;
  objc_storeStrong((id *)&self->_titleColor, a3);
  id v6 = a3;
  [(UILabel *)self->_titleLabel setTextColor:*p_titleColor];
}

- (void)setCurrencyAmount:(id)a3
{
  id v5 = a3;
  id v6 = v5;
  if (v5)
  {
    id v17 = v5;
    if (!self->_currencyFormatter) {
      goto LABEL_4;
    }
    BOOL v7 = [v5 currency];
    id v8 = [(PKCurrencyAmount *)self->_currencyAmount currency];
    char v9 = [v7 isEqualToString:v8];

    id v6 = v17;
    if ((v9 & 1) == 0)
    {
LABEL_4:
      v10 = [v6 currency];
      PKMutableNumberFormatterForCurrencyCode();
      v11 = (NSNumberFormatter *)objc_claimAutoreleasedReturnValue();
      currencyFormatter = self->_currencyFormatter;
      self->_currencyFormatter = v11;
    }
    char v13 = PKEqualObjects();
    id v6 = v17;
    if ((v13 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_currencyAmount, a3);
      v14 = self->_currencyFormatter;
      v15 = [(PKCurrencyAmount *)self->_currencyAmount amount];
      uint64_t v16 = [(NSNumberFormatter *)v14 stringFromNumber:v15];

      [(UITextField *)self->_amountTextField setText:v16];
      id v6 = v17;
    }
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  -[PKCurrencyAmountEntryCollectionViewCell _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 1, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), a3.width, a3.height);
  double v6 = fmin(height, 44.0);
  if (v5 < 44.0) {
    double v5 = v6;
  }
  result.double height = v5;
  result.width = v4;
  return result;
}

- (void)layoutSubviews
{
  v17[2] = *MEMORY[0x1E4F143B8];
  v16.receiver = self;
  v16.super_class = (Class)PKCurrencyAmountEntryCollectionViewCell;
  [(PKCurrencyAmountEntryCollectionViewCell *)&v16 layoutSubviews];
  id v3 = objc_alloc(MEMORY[0x1E4FB1DF0]);
  double v4 = objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  id v5 = objc_alloc(MEMORY[0x1E4FB14A8]);
  double v6 = (void *)MEMORY[0x1E4FB13F0];
  BOOL v7 = PKLocalizedString(&cfstr_Done.isa);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __57__PKCurrencyAmountEntryCollectionViewCell_layoutSubviews__block_invoke;
  v15[3] = &unk_1E59D5200;
  v15[4] = self;
  id v8 = [v6 actionWithTitle:v7 image:0 identifier:0 handler:v15];
  char v9 = (void *)[v5 initWithPrimaryAction:v8];

  v10 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:5 target:0 action:0];
  v17[0] = v10;
  v17[1] = v9;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
  [v4 setItems:v11];

  [v4 sizeToFit];
  [(UITextField *)self->_amountTextField setInputAccessoryView:v4];
  amountTextField = self->_amountTextField;
  if (self->_isEditable) {
    [MEMORY[0x1E4FB1618] labelColor];
  }
  else {
  char v13 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  }
  [(UITextField *)amountTextField setTextColor:v13];

  [(UITextField *)self->_amountTextField setUserInteractionEnabled:self->_isEditable];
  v14 = [(PKCurrencyAmountEntryCollectionViewCell *)self contentView];
  [v14 bounds];
  -[PKCurrencyAmountEntryCollectionViewCell _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 0);
}

uint64_t __57__PKCurrencyAmountEntryCollectionViewCell_layoutSubviews__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 872) resignFirstResponder];
}

- (CGSize)_layoutWithBounds:(CGRect)a3 isTemplateLayout:(BOOL)a4
{
  CGFloat width = a3.size.width;
  CGRect v42 = CGRectInset(a3, 16.0, 13.0);
  CGFloat x = v42.origin.x;
  CGFloat y = v42.origin.y;
  double v9 = v42.size.width;
  double height = v42.size.height;
  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v42.size.width, v42.size.height);
  double v12 = v11;
  double v14 = v13;
  -[UITextField sizeThatFits:](self->_amountTextField, "sizeThatFits:", v9, height);
  double v16 = v15;
  memset(&slice, 0, sizeof(slice));
  v39.origin.CGFloat x = x;
  v39.origin.CGFloat y = y;
  v39.size.CGFloat width = v9;
  v39.size.double height = height;
  if (v12 + 8.0 + v17 > v9)
  {
    double v18 = v14 + 2.0 + v15;
    v39.size.double height = v18;
    p_CGRect slice = &slice;
    v43.origin.CGFloat x = x;
    v43.origin.CGFloat y = y;
    v43.size.CGFloat width = v9;
    v43.size.double height = v14 + 2.0 + v16;
    CGRectDivide(v43, &slice, &v39, v14, CGRectMinYEdge);
    CGFloat v20 = slice.origin.x;
    CGFloat v21 = slice.origin.y;
    double v22 = slice.size.width;
    double v23 = slice.size.height;
    CGRectDivide(v39, &slice, &v39, 2.0, CGRectMinYEdge);
    CGRectDivide(v39, &slice, &v39, v16, CGRectMinYEdge);
    if (a4) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  if ([(PKCurrencyAmountEntryCollectionViewCell *)self _shouldReverseLayoutDirection])CGRectEdge v24 = CGRectMaxXEdge; {
  else
  }
    CGRectEdge v24 = CGRectMinXEdge;
  p_CGRect slice = &v39;
  v44.origin.CGFloat x = x;
  v44.origin.CGFloat y = y;
  v44.size.CGFloat width = v9;
  v44.size.double height = height;
  CGRectDivide(v44, &slice, &v39, fmin(v9, v12), v24);
  PKContentAlignmentMake();
  PKSizeAlignedInRect();
  CGFloat v20 = v25;
  CGFloat v21 = v26;
  double v22 = v27;
  double v23 = v28;
  CGRectDivide(v39, &slice, &v39, 8.0, v24);
  double v18 = v23;
  if (!a4)
  {
LABEL_8:
    double v30 = p_slice->size.width;
    double v29 = p_slice->size.height;
    double v31 = v21;
    double v32 = width;
    double v33 = v20;
    double v35 = p_slice->origin.x;
    CGFloat v34 = p_slice->origin.y;
    -[UILabel setFrame:](self->_titleLabel, "setFrame:", v33, v31, v22, v23, *(void *)&v39.origin.x, *(void *)&v39.origin.y, *(void *)&v39.size.width);
    double v36 = v34;
    CGFloat width = v32;
    -[UITextField setFrame:](self->_amountTextField, "setFrame:", v35, v36, v30, v29);
  }
LABEL_9:
  double v37 = v18 + 26.0;
  double v38 = width;
  result.double height = v37;
  result.CGFloat width = v38;
  return result;
}

- (BOOL)textFieldShouldBeginEditing:(id)a3
{
  return self->_isEditable;
}

- (void)textFieldDidEndEditing:(id)a3
{
  id v4 = a3;
  id v5 = [v4 text];
  id v7 = [(PKCurrencyAmountEntryCollectionViewCell *)self _amountFromInput:v5];

  double v6 = [(NSNumberFormatter *)self->_currencyFormatter stringFromNumber:v7];
  [v4 setText:v6];
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v9 = a5;
  v10 = [a3 text];
  double v11 = objc_msgSend(v10, "stringByReplacingCharactersInRange:withString:", location, length, v9);

  BOOL v12 = [(PKCurrencyAmountEntryCollectionViewCell *)self _inputIsValid:v11];
  if (v12)
  {
    double v13 = [(PKCurrencyAmountEntryCollectionViewCell *)self _amountFromInput:v11];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained amountDidChange:v13];
  }
  return v12;
}

- (BOOL)_inputIsValid:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(NSNumberFormatter *)self->_currencyFormatter maximumFractionDigits];
  double v6 = [(NSNumberFormatter *)self->_currencyFormatter currencySymbol];
  id v7 = [v4 stringByReplacingOccurrencesOfString:v6 withString:&stru_1EF1B5B50];
  id v8 = [MEMORY[0x1E4F28C28] decimalNumberWithString:v7];
  id v9 = v8;
  if (v8) {
    int v10 = objc_msgSend(v8, "pk_isNotANumber") ^ 1;
  }
  else {
    LOBYTE(v10) = 0;
  }
  uint64_t v11 = objc_msgSend(v7, "pk_posixStringDecimalPlaces");
  id v12 = v4;
  id v13 = v6;
  double v14 = v13;
  if (v13 == v12)
  {
    char v15 = 1;
  }
  else
  {
    char v15 = 0;
    if (v12 && v13) {
      char v15 = [v12 isEqualToString:v13];
    }
  }

  double v16 = v7;
  double v17 = v16;
  if (v16 == @".")
  {
    char v18 = 1;
  }
  else if (v16)
  {
    char v18 = [(__CFString *)v16 isEqualToString:@"."];
  }
  else
  {
    char v18 = 0;
  }

  if (v11 <= v5) {
    char v19 = v10;
  }
  else {
    char v19 = 0;
  }
  char v20 = v19 | v15 | v18;

  return v20;
}

- (id)_amountFromInput:(id)a3
{
  currencyFormatter = self->_currencyFormatter;
  id v5 = a3;
  double v6 = [(NSNumberFormatter *)currencyFormatter currencySymbol];
  int v7 = [v5 containsString:v6];

  if (v7)
  {
    id v8 = [(NSNumberFormatter *)self->_currencyFormatter numberFromString:v5];

    id v9 = (void *)MEMORY[0x1E4F28C28];
    if (v8)
    {
      [v8 decimalValue];
    }
    else
    {
      v12[0] = 0;
      v12[1] = 0;
      int v13 = 0;
    }
    int v10 = [v9 decimalNumberWithDecimal:v12];
  }
  else
  {
    int v10 = [MEMORY[0x1E4F28C28] decimalNumberWithString:v5];
  }

  return v10;
}

- (NSString)title
{
  return self->_title;
}

- (UIColor)titleColor
{
  return self->_titleColor;
}

- (PKCurrencyAmount)currencyAmount
{
  return self->_currencyAmount;
}

- (BOOL)isEditable
{
  return self->_isEditable;
}

- (void)setIsEditable:(BOOL)a3
{
  self->_isEditable = a3;
}

- (PKCurrencyAmountEntryCollectionViewCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKCurrencyAmountEntryCollectionViewCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_currencyAmount, 0);
  objc_storeStrong((id *)&self->_titleColor, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_currencyFormatter, 0);
  objc_storeStrong((id *)&self->_amountTextField, 0);

  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end