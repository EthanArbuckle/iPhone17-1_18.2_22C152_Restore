@interface PKPaymentPreferenceDetailedCell
- (BOOL)inlineEditingEnabled;
- (CGSize)sizeThatFits:(CGSize)a3;
- (PKPaymentPreferenceDetailedCell)initWithReuseIdentifier:(id)a3;
- (PKPaymentPreferenceDetailedCellTextField)textField;
- (double)leadingOffset;
- (double)minimumCellHeight;
- (id)pk_childrenForAppearance;
- (void)layoutSubviews;
- (void)pk_applyAppearance:(id)a3;
- (void)prepareForReuse;
- (void)setInlineEditingEnabled:(BOOL)a3;
- (void)setLeadingOffset:(double)a3;
- (void)setMinimumCellHeight:(double)a3;
- (void)showTextField:(BOOL)a3;
@end

@implementation PKPaymentPreferenceDetailedCell

- (PKPaymentPreferenceDetailedCell)initWithReuseIdentifier:(id)a3
{
  v15.receiver = self;
  v15.super_class = (Class)PKPaymentPreferenceDetailedCell;
  v3 = [(PKPaymentPreferenceDetailedCell *)&v15 initWithStyle:3 reuseIdentifier:a3];
  v4 = v3;
  if (v3)
  {
    v14.receiver = v3;
    v14.super_class = (Class)PKPaymentPreferenceDetailedCell;
    v5 = [(PKPaymentPreferenceDetailedCell *)&v14 detailTextLabel];
    v6 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [v5 setTextColor:v6];

    [v5 setNumberOfLines:2];
    v4->_leadingOffset = 0.0;
    v4->_minimumCellHeight = 56.0;
    v7 = objc_alloc_init(PKPaymentPreferenceDetailedCellTextField);
    textField = v4->_textField;
    v4->_textField = v7;

    v9 = [(PKPaymentPreferenceDetailedCell *)v4 contentView];
    [v9 addSubview:v4->_textField];

    v10 = v4->_textField;
    v11 = [(PKPaymentPreferenceDetailedCell *)v4 textLabel];
    v12 = [v11 font];
    [(PKPaymentPreferenceDetailedCellTextField *)v10 setFont:v12];

    [(PKPaymentPreferenceDetailedCellTextField *)v4->_textField setAutocapitalizationType:1];
    [(PKPaymentPreferenceDetailedCellTextField *)v4->_textField setAutocorrectionType:2];
    [(PKPaymentPreferenceDetailedCellTextField *)v4->_textField setEnabled:0];
    [(PKPaymentPreferenceDetailedCellTextField *)v4->_textField setHidden:1];
    v4->_isLeftToRight = [(PKPaymentPreferenceDetailedCell *)v4 _shouldReverseLayoutDirection] ^ 1;
  }
  return v4;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  v10.receiver = self;
  v10.super_class = (Class)PKPaymentPreferenceDetailedCell;
  -[PKTableViewCell sizeThatFits:](&v10, sel_sizeThatFits_, a3.width, a3.height);
  double v4 = v3;
  double v6 = v5;
  PKFloatCeilToPixel();
  double v8 = fmax(v6, v7);
  double v9 = v4;
  result.height = v8;
  result.width = v9;
  return result;
}

- (void)prepareForReuse
{
  v6.receiver = self;
  v6.super_class = (Class)PKPaymentPreferenceDetailedCell;
  [(PKPaymentPreferenceCell *)&v6 prepareForReuse];
  [(PKPaymentPreferenceDetailedCellTextField *)self->_textField setEnabled:0];
  [(PKPaymentPreferenceDetailedCellTextField *)self->_textField setHidden:1];
  [(PKPaymentPreferenceDetailedCellTextField *)self->_textField setIsInvalid:0];
  double v3 = [(PKPaymentPreferenceDetailedCell *)self detailTextLabel];
  [v3 setHidden:0];

  double v4 = [(PKPaymentPreferenceDetailedCell *)self textLabel];
  [v4 setHidden:0];
  double v5 = [MEMORY[0x1E4FB1618] labelColor];
  [v4 setTextColor:v5];

  self->_minimumCellHeight = 56.0;
  self->_leadingOffset = 0.0;
}

- (void)showTextField:(BOOL)a3
{
  if (a3 && self->_inlineEditingEnabled)
  {
    [(PKPaymentPreferenceDetailedCellTextField *)self->_textField setEnabled:1];
    [(PKPaymentPreferenceDetailedCellTextField *)self->_textField setHidden:0];
    [(PKPaymentPreferenceDetailedCellTextField *)self->_textField becomeFirstResponder];
    double v4 = [(PKPaymentPreferenceDetailedCell *)self detailTextLabel];
    [v4 setHidden:1];

    double v5 = [(PKPaymentPreferenceDetailedCell *)self textLabel];
    id v8 = v5;
    uint64_t v6 = 1;
  }
  else
  {
    [(PKPaymentPreferenceDetailedCellTextField *)self->_textField setEnabled:0];
    [(PKPaymentPreferenceDetailedCellTextField *)self->_textField setHidden:1];
    [(PKPaymentPreferenceDetailedCellTextField *)self->_textField resignFirstResponder];
    double v7 = [(PKPaymentPreferenceDetailedCell *)self detailTextLabel];
    [v7 setHidden:0];

    double v5 = [(PKPaymentPreferenceDetailedCell *)self textLabel];
    id v8 = v5;
    uint64_t v6 = 0;
  }
  [v5 setHidden:v6];
}

- (void)layoutSubviews
{
  v27.receiver = self;
  v27.super_class = (Class)PKPaymentPreferenceDetailedCell;
  [(PKPaymentPreferenceDetailedCell *)&v27 layoutSubviews];
  double v3 = [(PKPaymentPreferenceDetailedCell *)self contentView];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v26 = v8;

  double v9 = [(PKPaymentPreferenceDetailedCell *)self textLabel];
  [v9 frame];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  v18 = [(PKPaymentPreferenceDetailedCell *)self detailTextLabel];
  [v18 frame];
  double leadingOffset = self->_leadingOffset;
  if (leadingOffset > 0.0)
  {
    double v22 = v19;
    double v23 = v20;
    double v15 = v7 - leadingOffset;
    if (self->_isLeftToRight) {
      double v11 = self->_leadingOffset;
    }
    else {
      double v11 = v5;
    }
    objc_msgSend(v9, "setFrame:", v11, v13, v15, v17);
    objc_msgSend(v18, "setFrame:", v11, v22, v15, v23);
  }
  double v24 = v15 + v11;
  double v25 = 0.0;
  if (self->_isLeftToRight)
  {
    double v25 = v11;
    double v24 = v7 - v11;
  }
  -[PKPaymentPreferenceDetailedCellTextField setFrame:](self->_textField, "setFrame:", v25, 0.0, v24, v26);
}

- (BOOL)inlineEditingEnabled
{
  return self->_inlineEditingEnabled;
}

- (void)setInlineEditingEnabled:(BOOL)a3
{
  self->_inlineEditingEnabled = a3;
}

- (PKPaymentPreferenceDetailedCellTextField)textField
{
  return self->_textField;
}

- (double)leadingOffset
{
  return self->_leadingOffset;
}

- (void)setLeadingOffset:(double)a3
{
  self->_double leadingOffset = a3;
}

- (double)minimumCellHeight
{
  return self->_minimumCellHeight;
}

- (void)setMinimumCellHeight:(double)a3
{
  self->_minimumCellHeight = a3;
}

- (void).cxx_destruct
{
}

- (id)pk_childrenForAppearance
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = [(PKPaymentPreferenceDetailedCell *)self textField];
  v5[0] = v2;
  double v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

- (void)pk_applyAppearance:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PKPaymentPreferenceDetailedCell;
  id v4 = a3;
  [(PKTableViewCell *)&v6 pk_applyAppearance:v4];
  double v5 = objc_msgSend(v4, "tintColor", v6.receiver, v6.super_class);

  [(PKPaymentPreferenceDetailedCell *)self setTintColor:v5];
}

@end