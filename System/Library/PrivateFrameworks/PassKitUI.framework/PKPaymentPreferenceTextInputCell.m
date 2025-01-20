@interface PKPaymentPreferenceTextInputCell
- (PKPaymentPreferenceTextInputCell)initWithReuseIdentifier:(id)a3;
- (UITextField)textField;
- (void)layoutSubviews;
- (void)setTextField:(id)a3;
@end

@implementation PKPaymentPreferenceTextInputCell

- (PKPaymentPreferenceTextInputCell)initWithReuseIdentifier:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PKPaymentPreferenceTextInputCell;
  v3 = [(PKPaymentPreferenceTextInputCell *)&v9 initWithStyle:0 reuseIdentifier:a3];
  v4 = v3;
  if (v3)
  {
    [(PKPaymentPreferenceTextInputCell *)v3 setSelectionStyle:0];
    v5 = (UITextField *)objc_alloc_init(MEMORY[0x1E4FB1D70]);
    textField = v4->_textField;
    v4->_textField = v5;

    v7 = [(PKPaymentPreferenceTextInputCell *)v4 contentView];
    [v7 addSubview:v4->_textField];

    [(UITextField *)v4->_textField setAutocapitalizationType:1];
    [(UITextField *)v4->_textField setAutocorrectionType:2];
  }
  return v4;
}

- (void)layoutSubviews
{
  v10.receiver = self;
  v10.super_class = (Class)PKPaymentPreferenceTextInputCell;
  [(PKPaymentPreferenceTextInputCell *)&v10 layoutSubviews];
  [(PKPaymentPreferenceTextInputCell *)self layoutMargins];
  double v4 = v3;
  double v6 = v5;
  [(PKPaymentPreferenceTextInputCell *)self bounds];
  double v8 = v7 - v4 - v6;
  textField = self->_textField;
  [(PKPaymentPreferenceTextInputCell *)self bounds];
  -[UITextField setFrame:](textField, "setFrame:", v4, 0.0, v8);
}

- (UITextField)textField
{
  return self->_textField;
}

- (void)setTextField:(id)a3
{
}

- (void).cxx_destruct
{
}

@end