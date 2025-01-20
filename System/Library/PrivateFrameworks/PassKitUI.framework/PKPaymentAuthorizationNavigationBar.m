@interface PKPaymentAuthorizationNavigationBar
+ (id)_leftBarButtonItemWithImage:(id)a3;
+ (id)applePayBarButtonItem;
+ (id)cardOnFileBarButtonItemForRequestor:(unint64_t)a3;
- (PKPaymentAuthorizationNavigationBar)initWithFrame:(CGRect)a3;
- (void)_dynamicUserInterfaceTraitDidChange;
- (void)didUpdateInterfaceStyle;
- (void)layoutSubviews;
@end

@implementation PKPaymentAuthorizationNavigationBar

+ (id)_leftBarButtonItemWithImage:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4FB1838];
  id v4 = a3;
  v5 = (void *)[[v3 alloc] initWithImage:v4];

  v6 = [MEMORY[0x1E4FB1618] labelColor];
  [v5 setTintColor:v6];

  [v5 bounds];
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", v7, v9, v11, v13);
  [v15 addSubview:v5];
  v16 = [MEMORY[0x1E4FB1438] sharedApplication];
  uint64_t v17 = [v16 userInterfaceLayoutDirection];

  if (v17 == 1) {
    double v18 = 4.0;
  }
  else {
    double v18 = -4.0;
  }
  v22.origin.x = v8;
  v22.origin.y = v10;
  v22.size.width = v12;
  v22.size.height = v14;
  CGRect v23 = CGRectOffset(v22, v18, 1.0);
  objc_msgSend(v5, "setFrame:", v23.origin.x, v23.origin.y, v23.size.width, v23.size.height);
  v19 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithCustomView:v15];

  return v19;
}

+ (id)cardOnFileBarButtonItemForRequestor:(unint64_t)a3
{
  if (a3 > 5) {
    id v4 = 0;
  }
  else {
    id v4 = off_1E59DE8D0[a3];
  }
  v5 = PKUIImageNamed(v4);
  v6 = [v5 imageWithRenderingMode:2];
  double v7 = [a1 _leftBarButtonItemWithImage:v6];

  return v7;
}

+ (id)applePayBarButtonItem
{
  v3 = PKUIImageNamed(@"Payment_Logo");
  id v4 = [v3 imageWithRenderingMode:2];
  v5 = [a1 _leftBarButtonItemWithImage:v4];

  return v5;
}

- (PKPaymentAuthorizationNavigationBar)initWithFrame:(CGRect)a3
{
  v14.receiver = self;
  v14.super_class = (Class)PKPaymentAuthorizationNavigationBar;
  v3 = -[PKPaymentAuthorizationNavigationBar initWithFrame:](&v14, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    environmentLabel = v3->_environmentLabel;
    v3->_environmentLabel = v4;

    v6 = v3->_environmentLabel;
    double v7 = [MEMORY[0x1E4FB08E0] systemFontOfSize:13.0];
    [(UILabel *)v6 setFont:v7];

    CGFloat v8 = v3->_environmentLabel;
    double v9 = [MEMORY[0x1E4FB1618] tertiaryLabelColor];
    [(UILabel *)v8 setTextColor:v9];

    CGFloat v10 = v3->_environmentLabel;
    double v11 = PKLocalizedEnvironmentHint();
    [(UILabel *)v10 setText:v11];

    [(UILabel *)v3->_environmentLabel sizeToFit];
    [(PKPaymentAuthorizationNavigationBar *)v3 addSubview:v3->_environmentLabel];
    id v12 = objc_alloc_init(MEMORY[0x1E4FB1818]);
    [(PKPaymentAuthorizationNavigationBar *)v3 setBackgroundImage:v12 forBarMetrics:0];
    [(PKPaymentAuthorizationNavigationBar *)v3 setTranslucent:1];
    [(PKPaymentAuthorizationNavigationBar *)v3 didUpdateInterfaceStyle];
  }
  return v3;
}

- (void)_dynamicUserInterfaceTraitDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PKPaymentAuthorizationNavigationBar;
  [(PKPaymentAuthorizationNavigationBar *)&v3 _dynamicUserInterfaceTraitDidChange];
  [(PKPaymentAuthorizationNavigationBar *)self didUpdateInterfaceStyle];
}

- (void)didUpdateInterfaceStyle
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  CGFloat v8 = __Block_byref_object_copy__58;
  double v9 = __Block_byref_object_dispose__58;
  id v10 = 0;
  objc_super v3 = [(PKPaymentAuthorizationNavigationBar *)self traitCollection];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __62__PKPaymentAuthorizationNavigationBar_didUpdateInterfaceStyle__block_invoke;
  v4[3] = &unk_1E59CB4B0;
  v4[4] = &v5;
  PKUIPerformWithEffectiveTraitCollection(v3, v4);

  [(PKPaymentAuthorizationNavigationBar *)self setShadowImage:v6[5]];
  _Block_object_dispose(&v5, 8);
}

void __62__PKPaymentAuthorizationNavigationBar_didUpdateInterfaceStyle__block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4FB1818];
  PKAuthorizationSeparatorColor();
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = objc_msgSend(v2, "pkui_imageWithColor:", v6);
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (void)layoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)PKPaymentAuthorizationNavigationBar;
  [(PKPaymentAuthorizationNavigationBar *)&v14 layoutSubviews];
  uint64_t v3 = [(PKPaymentAuthorizationNavigationBar *)self backItem];

  double v4 = 0.0;
  if (!v3)
  {
    uint64_t v5 = [(PKPaymentAuthorizationNavigationBar *)self topItem];
    id v6 = [v5 leftBarButtonItem];
    uint64_t v7 = [v6 customView];

    if (v7)
    {
      [(UILabel *)self->_environmentLabel frame];
      CGFloat v8 = [MEMORY[0x1E4FB1438] sharedApplication];
      uint64_t v9 = [v8 userInterfaceLayoutDirection];

      [v7 frame];
      if (v9 == 1) {
        CGRectGetMinX(*(CGRect *)&v10);
      }
      else {
        CGRectGetMaxX(*(CGRect *)&v10);
      }
      [(PKPaymentAuthorizationNavigationBar *)self frame];
      UIRectCenteredYInRect();
      -[UILabel setFrame:](self->_environmentLabel, "setFrame:");
      double v4 = 1.0;
    }
  }
  [(UILabel *)self->_environmentLabel setAlpha:v4];
}

- (void).cxx_destruct
{
}

@end