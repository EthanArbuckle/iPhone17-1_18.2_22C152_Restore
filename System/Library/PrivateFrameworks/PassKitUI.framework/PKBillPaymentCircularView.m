@interface PKBillPaymentCircularView
- (CGSize)sizeThatFits:(CGSize)a3;
- (PKBillPaymentCircularView)init;
- (UIColor)primaryColor;
- (UIColor)secondaryColor;
- (UIImage)image;
- (id)_defaultSecondaryColor;
- (void)_updateColors;
- (void)layoutSubviews;
- (void)setImage:(id)a3;
- (void)setImage:(id)a3 applyColor:(BOOL)a4;
- (void)setPrimaryColor:(id)a3;
- (void)setSecondaryColor:(id)a3;
@end

@implementation PKBillPaymentCircularView

- (PKBillPaymentCircularView)init
{
  v15.receiver = self;
  v15.super_class = (Class)PKBillPaymentCircularView;
  v2 = [(PKBillPaymentCircularView *)&v15 init];
  if (v2)
  {
    v3 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    primaryView = v2->_primaryView;
    v2->_primaryView = v3;

    v5 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    secondaryView = v2->_secondaryView;
    v2->_secondaryView = v5;

    v7 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
    imageView = v2->_imageView;
    v2->_imageView = v7;

    v9 = [(PKBillPaymentCircularView *)v2 _defaultSecondaryColor];
    secondaryColor = v2->_secondaryColor;
    v2->_secondaryColor = v9;

    objc_storeStrong((id *)&v2->_primaryColor, v9);
    [(PKBillPaymentCircularView *)v2 addSubview:v2->_secondaryView];
    [(PKBillPaymentCircularView *)v2 addSubview:v2->_primaryView];
    [(PKBillPaymentCircularView *)v2 addSubview:v2->_imageView];
    v11 = [(PKBillPaymentCircularView *)v2 layer];
    id v12 = [MEMORY[0x1E4FB1618] blackColor];
    objc_msgSend(v11, "setShadowColor:", objc_msgSend(v12, "CGColor"));

    objc_msgSend(v11, "setShadowOffset:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
    [v11 setShadowRadius:4.0];
    LODWORD(v13) = 0.25;
    [v11 setShadowOpacity:v13];
    __33__PKBillPaymentCircularView_init__block_invoke(v2->_primaryView);
    __33__PKBillPaymentCircularView_init__block_invoke(v2->_secondaryView);
    [(PKBillPaymentCircularView *)v2 _updateColors];
  }
  return v2;
}

void __33__PKBillPaymentCircularView_init__block_invoke(void *a1)
{
  if (a1)
  {
    id v1 = [a1 layer];
    [v1 setMasksToBounds:1];
    [v1 setCornerCurve:*MEMORY[0x1E4F39EA0]];
  }
}

- (void)layoutSubviews
{
  v31.receiver = self;
  v31.super_class = (Class)PKBillPaymentCircularView;
  [(PKBillPaymentCircularView *)&v31 layoutSubviews];
  [(PKBillPaymentCircularView *)self bounds];
  PKSizeAlignedInRect();
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  uint64_t v11 = PKUIGetMinScreenWidthType();
  double v12 = 3.5;
  if (!v11) {
    double v12 = 3.0;
  }
  double v13 = v4 + v12;
  double v14 = v6 + v12;
  double v15 = 7.0;
  if (!v11) {
    double v15 = 6.0;
  }
  double v16 = v8 - v15;
  double v17 = v10 - v15;
  image = self->_image;
  if (image) {
    [(UIImage *)image size];
  }
  PKSizeAlignedInRect();
  double v29 = v20;
  double v30 = v19;
  double v27 = v22;
  double v28 = v21;
  -[UIView setFrame:](self->_primaryView, "setFrame:", v13, v14, v16, v17);
  v23 = [(UIView *)self->_primaryView layer];
  [v23 setCornerRadius:v16 * 0.5];

  -[UIView setFrame:](self->_secondaryView, "setFrame:", v4, v6, v8, v10);
  v24 = [(UIView *)self->_secondaryView layer];
  [v24 setCornerRadius:v8 * 0.5];

  -[UIImageView setFrame:](self->_imageView, "setFrame:", v30, v29, v28, v27);
  v32.origin.x = v4;
  v32.origin.y = v6;
  v32.size.width = v8;
  v32.size.height = v10;
  if (!CGRectEqualToRect(self->_shadowFrame, v32))
  {
    self->_shadowFrame.origin.x = v4;
    self->_shadowFrame.origin.y = v6;
    self->_shadowFrame.size.width = v8;
    self->_shadowFrame.size.height = v10;
    v25 = [(PKBillPaymentCircularView *)self layer];
    objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithOvalInRect:", v4, v6, v8, v10);
    id v26 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setShadowPath:", objc_msgSend(v26, "CGPath"));
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3 = fmin(a3.width, a3.height);
  double v4 = v3;
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)setImage:(id)a3
{
}

- (void)setImage:(id)a3 applyColor:(BOOL)a4
{
  BOOL v4 = a4;
  double v7 = (UIImage *)a3;
  double v8 = v7;
  if (self->_image != v7)
  {
    if (v4)
    {
      primaryColor = self->_primaryColor;
      if (!primaryColor) {
        primaryColor = self->_secondaryColor;
      }
      double v10 = [(UIImage *)v7 _flatImageWithColor:primaryColor];
    }
    else
    {
      double v10 = v7;
    }
    uint64_t v11 = v10;
    objc_storeStrong((id *)&self->_image, a3);
    [(PKBillPaymentCircularView *)self setNeedsLayout];
    if (self->_image) {
      [(UIImageView *)self->_imageView setImage:v11];
    }
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __49__PKBillPaymentCircularView_setImage_applyColor___block_invoke;
    v12[3] = &unk_1E59CA7D0;
    v12[4] = self;
    objc_msgSend(MEMORY[0x1E4FB1EB0], "pkui_animateUsingOptions:delay:animations:completion:", 0, v12, 0, 0.0);
  }
}

uint64_t __49__PKBillPaymentCircularView_setImage_applyColor___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

- (void)_updateColors
{
  primaryView = self->_primaryView;
  primaryColor = self->_primaryColor;
  if (!primaryColor) {
    primaryColor = self->_secondaryColor;
  }
  [(UIView *)primaryView setBackgroundColor:primaryColor];
  secondaryView = self->_secondaryView;
  secondaryColor = self->_secondaryColor;

  [(UIView *)secondaryView setBackgroundColor:secondaryColor];
}

- (UIColor)primaryColor
{
  return [(UIView *)self->_primaryView backgroundColor];
}

- (void)setPrimaryColor:(id)a3
{
  id v6 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    BOOL v4 = (UIColor *)[v6 copy];
    primaryColor = self->_primaryColor;
    self->_primaryColor = v4;

    [(PKBillPaymentCircularView *)self _updateColors];
  }
}

- (void)setSecondaryColor:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v4 = [(PKBillPaymentCircularView *)self _defaultSecondaryColor];
  }
  id v7 = v4;
  if ((PKEqualObjects() & 1) == 0)
  {
    double v5 = (UIColor *)[v7 copy];
    secondaryColor = self->_secondaryColor;
    self->_secondaryColor = v5;

    [(PKBillPaymentCircularView *)self _updateColors];
  }
}

- (id)_defaultSecondaryColor
{
  return (id)[MEMORY[0x1E4FB1618] whiteColor];
}

- (UIColor)secondaryColor
{
  return self->_secondaryColor;
}

- (UIImage)image
{
  return self->_image;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_secondaryColor, 0);
  objc_storeStrong((id *)&self->_primaryColor, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_secondaryView, 0);

  objc_storeStrong((id *)&self->_primaryView, 0);
}

@end