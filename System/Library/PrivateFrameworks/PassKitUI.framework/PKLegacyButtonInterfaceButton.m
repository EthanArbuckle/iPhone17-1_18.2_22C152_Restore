@interface PKLegacyButtonInterfaceButton
- (BOOL)showSpinner;
- (PKLegacyButtonInterfaceButton)initWithFrame:(CGRect)a3;
- (void)setShowSpinner:(BOOL)a3;
- (void)updateBackgroundColorWithColor:(id)a3;
- (void)updateTitleColorWithColor:(id)a3;
- (void)updateWithImage:(id)a3;
@end

@implementation PKLegacyButtonInterfaceButton

- (PKLegacyButtonInterfaceButton)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PKLegacyButtonInterfaceButton;
  v3 = -[PKLegacyButtonInterfaceButton initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v6.receiver = v3;
    v6.super_class = (Class)PKLegacyButtonInterfaceButton;
    [(PKLegacyButtonInterfaceButton *)&v6 setConfigurationUpdateHandler:&__block_literal_global_97];
  }
  return v4;
}

void __47__PKLegacyButtonInterfaceButton_initWithFrame___block_invoke(uint64_t a1, void *a2)
{
  v2 = a2;
  v3 = [v2 configuration];
  [v3 setShowsActivityIndicator:v2[744]];
  [v3 setBaseBackgroundColor:*((void *)v2 + 94)];
  [v3 setBaseForegroundColor:*((void *)v2 + 95)];
  [v3 setImage:*((void *)v2 + 96)];
  id v4 = [v3 updatedConfigurationForButton:v2];

  [v2 setConfiguration:v4];
}

- (BOOL)showSpinner
{
  return self->_showSpinner;
}

- (void)setShowSpinner:(BOOL)a3
{
  if (self->_showSpinner != a3)
  {
    self->_showSpinner = a3;
    [(PKLegacyButtonInterfaceButton *)self setNeedsUpdateConfiguration];
  }
}

- (void)updateBackgroundColorWithColor:(id)a3
{
  v5 = (UIColor *)a3;
  if (self->_overrideBackgroundColor != v5)
  {
    objc_super v6 = v5;
    objc_storeStrong((id *)&self->_overrideBackgroundColor, a3);
    [(PKLegacyButtonInterfaceButton *)self setNeedsUpdateConfiguration];
    v5 = v6;
  }
}

- (void)updateTitleColorWithColor:(id)a3
{
  v5 = (UIColor *)a3;
  if (self->_overrideForegroundColor != v5)
  {
    objc_super v6 = v5;
    objc_storeStrong((id *)&self->_overrideForegroundColor, a3);
    [(PKLegacyButtonInterfaceButton *)self setNeedsUpdateConfiguration];
    v5 = v6;
  }
}

- (void)updateWithImage:(id)a3
{
  v5 = (UIImage *)a3;
  if (self->_image != v5)
  {
    objc_super v6 = v5;
    objc_storeStrong((id *)&self->_image, a3);
    [(PKLegacyButtonInterfaceButton *)self setNeedsUpdateConfiguration];
    v5 = v6;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_overrideForegroundColor, 0);

  objc_storeStrong((id *)&self->_overrideBackgroundColor, 0);
}

@end