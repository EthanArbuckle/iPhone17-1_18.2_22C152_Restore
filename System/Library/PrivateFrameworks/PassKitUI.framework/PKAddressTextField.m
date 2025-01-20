@interface PKAddressTextField
- (BOOL)isInvalid;
- (PKAddressTextField)initWithFrame:(CGRect)a3 style:(int64_t)a4;
- (PKAddressTextFieldDelegate)addressDelegate;
- (PKContactFieldConfiguration)contactFieldConfiguration;
- (PKUniqueAddressField)addressField;
- (UIColor)defaultColor;
- (UIColor)invalidColor;
- (int64_t)style;
- (void)insertTextSuggestion:(id)a3;
- (void)setAddressDelegate:(id)a3;
- (void)setAddressField:(id)a3;
- (void)setContactFieldConfiguration:(id)a3;
- (void)setDefaultColor:(id)a3;
- (void)setInvalidColor:(id)a3;
- (void)setIsInvalid:(BOOL)a3 showErrorGlyph:(BOOL)a4;
- (void)setStyle:(int64_t)a3;
@end

@implementation PKAddressTextField

- (PKAddressTextField)initWithFrame:(CGRect)a3 style:(int64_t)a4
{
  v17.receiver = self;
  v17.super_class = (Class)PKAddressTextField;
  v5 = -[PKAddressTextField initWithFrame:](&v17, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = v5;
  if (v5)
  {
    v5->_style = a4;
    if (a4 == 2) {
      PKBridgeTextColor();
    }
    else {
    v7 = [MEMORY[0x1E4FB1618] labelColor];
    }
    objc_storeStrong((id *)&v6->_defaultColor, v7);

    uint64_t v8 = objc_msgSend(MEMORY[0x1E4FB1618], "pkui_osloErrorColor");
    invalidColor = v6->_invalidColor;
    v6->_invalidColor = (UIColor *)v8;

    v10 = PKUISmallExclamationMarkImage();
    v11 = (void *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v10];
    [v11 setTintColor:v6->_invalidColor];
    [v11 setContentMode:7];
    [v10 size];
    double v13 = v12 + 20.0;
    [v10 size];
    objc_msgSend(v11, "setFrame:", 0.0, 0.0, v13, v14);
    [(PKAddressTextField *)v6 setRightView:v11];
    [(PKAddressTextField *)v6 setRightViewMode:0];
    v15 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
    [(PKAddressTextField *)v6 setFont:v15];

    [(PKAddressTextField *)v6 setAccessibilityIdentifier:*MEMORY[0x1E4F851F8]];
  }
  return v6;
}

- (void)insertTextSuggestion:(id)a3
{
  id v5 = [a3 inputText];
  -[PKAddressTextField setText:](self, "setText:");
  id WeakRetained = objc_loadWeakRetained((id *)&self->_addressDelegate);
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0) {
    [WeakRetained addressTextField:self textDidChange:v5];
  }
}

- (void)setIsInvalid:(BOOL)a3 showErrorGlyph:(BOOL)a4
{
  BOOL v4 = a4;
  if (self->_isInvalid != a3)
  {
    self->_isInvalid = a3;
    uint64_t v6 = 1;
    if (a3) {
      uint64_t v6 = 2;
    }
    [(PKAddressTextField *)self setTextColor:*(Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR___PKAddressTextField__style[v6])];
  }
  if (v4) {
    uint64_t v7 = 3;
  }
  else {
    uint64_t v7 = 0;
  }

  [(PKAddressTextField *)self setRightViewMode:v7];
}

- (PKUniqueAddressField)addressField
{
  return self->_addressField;
}

- (void)setAddressField:(id)a3
{
}

- (PKContactFieldConfiguration)contactFieldConfiguration
{
  return self->_contactFieldConfiguration;
}

- (void)setContactFieldConfiguration:(id)a3
{
}

- (int64_t)style
{
  return self->_style;
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
}

- (PKAddressTextFieldDelegate)addressDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_addressDelegate);

  return (PKAddressTextFieldDelegate *)WeakRetained;
}

- (void)setAddressDelegate:(id)a3
{
}

- (BOOL)isInvalid
{
  return self->_isInvalid;
}

- (UIColor)defaultColor
{
  return self->_defaultColor;
}

- (void)setDefaultColor:(id)a3
{
}

- (UIColor)invalidColor
{
  return self->_invalidColor;
}

- (void)setInvalidColor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invalidColor, 0);
  objc_storeStrong((id *)&self->_defaultColor, 0);
  objc_destroyWeak((id *)&self->_addressDelegate);
  objc_storeStrong((id *)&self->_contactFieldConfiguration, 0);

  objc_storeStrong((id *)&self->_addressField, 0);
}

@end