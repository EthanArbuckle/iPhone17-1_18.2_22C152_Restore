@interface PKPaymentSetupInitialCardEducationIconsView
- (CGSize)sizeThatFits:(CGSize)result;
- (PKPaymentSetupInitialCardEducationIconsView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation PKPaymentSetupInitialCardEducationIconsView

- (PKPaymentSetupInitialCardEducationIconsView)initWithFrame:(CGRect)a3
{
  v26.receiver = self;
  v26.super_class = (Class)PKPaymentSetupInitialCardEducationIconsView;
  v3 = -[PKPaymentSetupInitialCardEducationIconsView initWithFrame:](&v26, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    p_width = &v3->_applePayIconSize.width;
    if ((unint64_t)PKUIGetMinScreenType() < 4)
    {
      *(_OWORD *)p_width = xmmword_1A0444230;
      v5 = &v3->_contactlessIconSize.width;
      v3->_contactlessIconSize.width = 62.0;
      uint64_t v6 = 0x4042800000000000;
    }
    else
    {
      *(_OWORD *)p_width = xmmword_1A0444240;
      v5 = &v3->_contactlessIconSize.width;
      v3->_contactlessIconSize.width = 67.0;
      uint64_t v6 = 0x4044000000000000;
    }
    *((void *)v5 + 1) = v6;
    v7 = PKPassKitUIBundle();
    double v8 = PKUIScreenScale();
    v9 = [v7 URLForResource:@"ApplePayLogoBlackBorder" withExtension:@"pdf"];
    id v10 = objc_alloc(MEMORY[0x1E4FB1838]);
    v11 = PKUIImageFromPDF(v9, *p_width, v3->_applePayIconSize.height, v8);
    v12 = [v11 imageWithRenderingMode:2];
    uint64_t v13 = [v10 initWithImage:v12];
    applePayIcon = v3->_applePayIcon;
    v3->_applePayIcon = (UIImageView *)v13;

    [(UIImageView *)v3->_applePayIcon setContentMode:1];
    v15 = v3->_applePayIcon;
    v16 = [MEMORY[0x1E4FB1618] labelColor];
    [(UIImageView *)v15 setTintColor:v16];

    [(PKPaymentSetupInitialCardEducationIconsView *)v3 addSubview:v3->_applePayIcon];
    v17 = [v7 URLForResource:@"ContactlessSymbol" withExtension:@"pdf"];

    id v18 = objc_alloc(MEMORY[0x1E4FB1838]);
    v19 = PKUIImageFromPDF(v17, *v5, v5[1], v8);
    v20 = [v19 imageWithRenderingMode:2];
    uint64_t v21 = [v18 initWithImage:v20];
    contactlessIcon = v3->_contactlessIcon;
    v3->_contactlessIcon = (UIImageView *)v21;

    [(UIImageView *)v3->_contactlessIcon setContentMode:1];
    v23 = v3->_contactlessIcon;
    v24 = [MEMORY[0x1E4FB1618] labelColor];
    [(UIImageView *)v23 setTintColor:v24];

    [(PKPaymentSetupInitialCardEducationIconsView *)v3 addSubview:v3->_contactlessIcon];
  }
  return v3;
}

- (void)layoutSubviews
{
  v19.receiver = self;
  v19.super_class = (Class)PKPaymentSetupInitialCardEducationIconsView;
  [(PKPaymentSetupInitialCardEducationIconsView *)&v19 layoutSubviews];
  [(PKPaymentSetupInitialCardEducationIconsView *)self bounds];
  [(PKPaymentSetupInitialCardEducationIconsView *)self _shouldReverseLayoutDirection];
  PKSizeAspectFit();
  PKSizeAspectFit();
  PKSizeAlignedInRect();
  PKContentAlignmentMake();
  PKSizeAlignedInRect();
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  PKContentAlignmentMake();
  PKSizeAlignedInRect();
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  -[UIImageView setFrame:](self->_applePayIcon, "setFrame:", v4, v6, v8, v10);
  -[UIImageView setFrame:](self->_contactlessIcon, "setFrame:", v12, v14, v16, v18);
}

- (CGSize)sizeThatFits:(CGSize)result
{
  double height = self->_applePayIconSize.height;
  if (height <= self->_contactlessIconSize.height) {
    double height = self->_contactlessIconSize.height;
  }
  double v4 = height + 20.0;
  result.double height = v4;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactlessIcon, 0);

  objc_storeStrong((id *)&self->_applePayIcon, 0);
}

@end