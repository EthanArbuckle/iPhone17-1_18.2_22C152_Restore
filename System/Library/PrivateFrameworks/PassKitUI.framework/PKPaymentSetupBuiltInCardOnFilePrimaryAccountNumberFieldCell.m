@interface PKPaymentSetupBuiltInCardOnFilePrimaryAccountNumberFieldCell
- (BOOL)hasDarkAppearance;
- (BOOL)isEnabled;
- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5;
- (BOOL)textFieldShouldBeginEditing:(id)a3;
- (BOOL)textFieldShouldClear:(id)a3;
- (PKPaymentSetupBuiltInCardOnFilePrimaryAccountNumberFieldCell)init;
- (id)_networkImage;
- (int64_t)paymentCredentialType;
- (void)_updateNetworkImage;
- (void)dealloc;
- (void)pk_applyAppearance:(id)a3;
- (void)setAccessoryView:(id)a3;
- (void)setHasDarkAppearance:(BOOL)a3;
- (void)setPaymentCredentialType:(int64_t)a3;
- (void)setPaymentSetupField:(id)a3;
@end

@implementation PKPaymentSetupBuiltInCardOnFilePrimaryAccountNumberFieldCell

- (void)pk_applyAppearance:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PKPaymentSetupBuiltInCardOnFilePrimaryAccountNumberFieldCell;
  id v4 = a3;
  [(PKPaymentSetupFieldCell *)&v6 pk_applyAppearance:v4];
  uint64_t v5 = objc_msgSend(v4, "hasDarkAppearance", v6.receiver, v6.super_class);

  [(PKPaymentSetupBuiltInCardOnFilePrimaryAccountNumberFieldCell *)self setHasDarkAppearance:v5];
}

- (PKPaymentSetupBuiltInCardOnFilePrimaryAccountNumberFieldCell)init
{
  v3.receiver = self;
  v3.super_class = (Class)PKPaymentSetupBuiltInCardOnFilePrimaryAccountNumberFieldCell;
  return [(PKPaymentSetupFieldCell *)&v3 init];
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)PKPaymentSetupBuiltInCardOnFilePrimaryAccountNumberFieldCell;
  [(PKPaymentSetupFieldCell *)&v2 dealloc];
}

- (BOOL)isEnabled
{
  return 0;
}

- (void)setPaymentSetupField:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PKPaymentSetupBuiltInCardOnFilePrimaryAccountNumberFieldCell;
  [(PKPaymentSetupFieldCell *)&v3 setPaymentSetupField:a3];
}

- (void)setHasDarkAppearance:(BOOL)a3
{
  if (self->_hasDarkAppearance != a3)
  {
    self->_hasDarkAppearance = a3;
    [(PKPaymentSetupBuiltInCardOnFilePrimaryAccountNumberFieldCell *)self _updateNetworkImage];
  }
}

- (void)setAccessoryView:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKPaymentSetupBuiltInCardOnFilePrimaryAccountNumberFieldCell;
  [(PKPaymentSetupBuiltInCardOnFilePrimaryAccountNumberFieldCell *)&v4 setAccessoryView:a3];
  [(PKPaymentSetupBuiltInCardOnFilePrimaryAccountNumberFieldCell *)self setNeedsLayout];
}

- (void)setPaymentCredentialType:(int64_t)a3
{
  if (self->_paymentCredentialType != a3)
  {
    self->_paymentCredentialType = a3;
    [(PKPaymentSetupBuiltInCardOnFilePrimaryAccountNumberFieldCell *)self _updateNetworkImage];
  }
}

- (void)_updateNetworkImage
{
  uint64_t v3 = [(PKPaymentSetupBuiltInCardOnFilePrimaryAccountNumberFieldCell *)self _networkImage];
  accessoryImageView = self->_accessoryImageView;
  id v7 = (id)v3;
  if (v3)
  {
    if (accessoryImageView)
    {
      [(UIImageView *)accessoryImageView setImage:v3];
      [(UIImageView *)self->_accessoryImageView sizeToFit];
    }
    else
    {
      uint64_t v5 = (UIImageView *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v3];
      objc_super v6 = self->_accessoryImageView;
      self->_accessoryImageView = v5;

      [(UIImageView *)self->_accessoryImageView setAccessibilityIgnoresInvertColors:1];
    }
  }
  else
  {
    self->_accessoryImageView = 0;
  }
  [(PKPaymentSetupBuiltInCardOnFilePrimaryAccountNumberFieldCell *)self setAccessoryView:self->_accessoryImageView];
}

- (BOOL)textFieldShouldBeginEditing:(id)a3
{
  return 0;
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  return 0;
}

- (BOOL)textFieldShouldClear:(id)a3
{
  return 0;
}

- (id)_networkImage
{
  return PKUINetworkImageForCredentialType(self->_paymentCredentialType);
}

- (int64_t)paymentCredentialType
{
  return self->_paymentCredentialType;
}

- (BOOL)hasDarkAppearance
{
  return self->_hasDarkAppearance;
}

- (void).cxx_destruct
{
}

@end