@interface PKDataReleaseMerchantCell
- (BOOL)useShadows;
- (CGSize)_layoutWithBounds:(CGRect)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)title;
- (PKDataReleaseMerchantCell)initWithReuseIdentifier:(id)a3;
- (void)_dynamicUserInterfaceTraitDidChange;
- (void)_setupImageView;
- (void)_updateImageViewDynamicColors;
- (void)layoutSubviews;
- (void)setImage:(id)a3 animated:(BOOL)a4;
- (void)setStrokeImage:(BOOL)a3;
- (void)setTitle:(id)a3;
- (void)setUseShadows:(BOOL)a3;
@end

@implementation PKDataReleaseMerchantCell

- (PKDataReleaseMerchantCell)initWithReuseIdentifier:(id)a3
{
  v17.receiver = self;
  v17.super_class = (Class)PKDataReleaseMerchantCell;
  v3 = [(PKDataReleaseMerchantCell *)&v17 initWithReuseIdentifier:a3];
  if (v3)
  {
    v4 = [MEMORY[0x1E4FB1498] clearConfiguration];
    [(PKDataReleaseMerchantCell *)v3 setBackgroundConfiguration:v4];
    v5 = [(PKDataReleaseMerchantCell *)v3 contentView];
    v6 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    imageBackgroundView = v3->_imageBackgroundView;
    v3->_imageBackgroundView = v6;

    [v5 addSubview:v3->_imageBackgroundView];
    v8 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
    imageView = v3->_imageView;
    v3->_imageView = v8;

    [(PKDataReleaseMerchantCell *)v3 _setupImageView];
    [v5 addSubview:v3->_imageView];
    v10 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = v10;

    v12 = v3->_titleLabel;
    v13 = PKFontForDefaultDesign((void *)*MEMORY[0x1E4FB2990], (void *)*MEMORY[0x1E4FB27F0], 2, 0);
    [(UILabel *)v12 setFont:v13];

    [(UILabel *)v3->_titleLabel setAdjustsFontSizeToFitWidth:1];
    [(UILabel *)v3->_titleLabel setTextAlignment:1];
    v14 = v3->_titleLabel;
    v15 = [MEMORY[0x1E4FB1618] labelColor];
    [(UILabel *)v14 setTextColor:v15];

    [v5 addSubview:v3->_titleLabel];
  }
  return v3;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)PKDataReleaseMerchantCell;
  [(PKDataReleaseMerchantCell *)&v4 layoutSubviews];
  v3 = [(PKDataReleaseMerchantCell *)self contentView];
  [v3 bounds];
  [(PKDataReleaseMerchantCell *)self _layoutWithBounds:"_layoutWithBounds:"];
}

- (CGSize)_layoutWithBounds:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  memset(&v29, 0, sizeof(v29));
  double v8 = a3.origin.x + 16.0;
  double v9 = a3.origin.y + 0.0;
  double v10 = a3.size.width + -32.0;
  remainder.origin.CGFloat x = a3.origin.x + 16.0;
  remainder.origin.CGFloat y = a3.origin.y + 0.0;
  remainder.size.CGFloat width = a3.size.width + -32.0;
  remainder.size.CGFloat height = a3.size.height;
  v11 = [(UIImageView *)self->_imageView image];

  if (v11)
  {
    v32.origin.CGFloat x = v8;
    v32.origin.CGFloat y = v9;
    v32.size.CGFloat width = v10;
    v32.size.CGFloat height = height;
    CGRectDivide(v32, &v29, &remainder, 54.0, CGRectMinYEdge);
    if (!self->_isTemplateLayout)
    {
      PKSizeAlignedInRect();
      double v13 = v12;
      double v15 = v14;
      double v17 = v16;
      double v19 = v18;
      -[UIImageView setFrame:](self->_imageView, "setFrame:");
      -[UIView setFrame:](self->_imageBackgroundView, "setFrame:", v13, v15, v17, v19);
    }
    CGRectDivide(remainder, &v29, &remainder, 10.0, CGRectMinYEdge);
  }
  v20 = [(PKDataReleaseMerchantCell *)self traitCollection];
  v21 = [v20 preferredContentSizeCategory];
  IsAccessibilityCategorCGFloat y = UIContentSizeCategoryIsAccessibilityCategory(v21);

  if (IsAccessibilityCategory) {
    uint64_t v23 = 0;
  }
  else {
    uint64_t v23 = 2;
  }
  [(UILabel *)self->_titleLabel setNumberOfLines:v23];
  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", remainder.size.width, remainder.size.height);
  CGRectDivide(remainder, &v29, &remainder, v24, CGRectMinYEdge);
  if (!self->_isTemplateLayout)
  {
    titleLabel = self->_titleLabel;
    PKSizeAlignedInRect();
    -[UILabel setFrame:](titleLabel, "setFrame:");
  }
  CGRectDivide(remainder, &v29, &remainder, 29.0, CGRectMinYEdge);
  v33.origin.CGFloat x = x;
  v33.origin.CGFloat y = y;
  v33.size.CGFloat width = width;
  v33.size.CGFloat height = height;
  CGFloat v26 = CGRectGetWidth(v33);
  double MaxY = CGRectGetMaxY(v29);
  double v28 = v26;
  result.CGFloat height = MaxY;
  result.CGFloat width = v28;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  objc_super v4 = [(PKDataReleaseMerchantCell *)self contentView];
  [v4 frame];

  self->_isTemplateLayout = 1;
  double v5 = *MEMORY[0x1E4F1DAD8];
  double v6 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  PKFloatRoundToPixel();
  -[PKDataReleaseMerchantCell _layoutWithBounds:](self, "_layoutWithBounds:", v5, v6, v7, 3.40282347e38);
  self->_isTemplateLayout = 0;
  result.CGFloat height = v9;
  result.CGFloat width = v8;
  return result;
}

- (void)_updateImageViewDynamicColors
{
  v3 = [(PKDataReleaseMerchantCell *)self traitCollection];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __58__PKDataReleaseMerchantCell__updateImageViewDynamicColors__block_invoke;
  v4[3] = &unk_1E59CA7D0;
  v4[4] = self;
  PKUIPerformWithEffectiveTraitCollection(v3, v4);
}

void __58__PKDataReleaseMerchantCell__updateImageViewDynamicColors__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 608) layer];
  id v1 = [MEMORY[0x1E4FB1618] systemGrayColor];
  objc_msgSend(v2, "setBorderColor:", objc_msgSend(v1, "CGColor"));
}

- (void)_dynamicUserInterfaceTraitDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PKDataReleaseMerchantCell;
  [(PKDataReleaseMerchantCell *)&v3 _dynamicUserInterfaceTraitDidChange];
  [(PKDataReleaseMerchantCell *)self _updateImageViewDynamicColors];
}

- (NSString)title
{
  return [(UILabel *)self->_titleLabel text];
}

- (void)setTitle:(id)a3
{
  [(UILabel *)self->_titleLabel setText:a3];

  [(PKDataReleaseMerchantCell *)self setNeedsLayout];
}

- (void)setUseShadows:(BOOL)a3
{
  if (((!self->_useShadows ^ a3) & 1) == 0)
  {
    BOOL v3 = a3;
    self->_useShadows = a3;
    objc_super v4 = [(UIView *)self->_imageBackgroundView layer];
    id v8 = v4;
    double v5 = 0.0;
    if (v3)
    {
      double v5 = 20.0;
      float v6 = 0.15;
    }
    else
    {
      float v6 = 0.0;
    }
    [v4 setShadowRadius:v5];
    *(float *)&double v7 = v6;
    [v8 setShadowOpacity:v7];
  }
}

- (void)setImage:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(UIImageView *)self->_imageView image];

  if (v7 != v6)
  {
    imageView = self->_imageView;
    if (!v6)
    {
      double v14 = [(UIImageView *)imageView superview];
      if (v14)
      {
      }
      else
      {
        v21 = [(UIView *)self->_imageBackgroundView superview];

        if (!v21) {
          goto LABEL_19;
        }
      }
      [(UIImageView *)self->_imageView removeFromSuperview];
      [(UIView *)self->_imageBackgroundView removeFromSuperview];
      [(PKDataReleaseMerchantCell *)self setNeedsLayout];
      goto LABEL_19;
    }
    if (imageView)
    {
      if (v4)
      {
        double v9 = imageView;
        double v10 = (UIImageView *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v6];
        v11 = self->_imageView;
        self->_imageView = v10;

        [(PKDataReleaseMerchantCell *)self _setupImageView];
        [(UIImageView *)self->_imageView setImage:v6];
        [(UIImageView *)self->_imageView setAlpha:0.0];
        double v12 = (void *)MEMORY[0x1E4FB1EB0];
        v24[0] = MEMORY[0x1E4F143A8];
        v24[1] = 3221225472;
        v24[2] = __47__PKDataReleaseMerchantCell_setImage_animated___block_invoke;
        v24[3] = &unk_1E59CA870;
        v24[4] = self;
        v25 = v9;
        v22[0] = MEMORY[0x1E4F143A8];
        v22[1] = 3221225472;
        v22[2] = __47__PKDataReleaseMerchantCell_setImage_animated___block_invoke_2;
        v22[3] = &unk_1E59CB6D8;
        uint64_t v23 = v25;
        double v13 = v25;
        objc_msgSend(v12, "pkui_animateUsingOptions:animations:completion:", 4, v24, v22);
      }
      else
      {
        [(UIImageView *)imageView setImage:v6];
      }
    }
    else
    {
      double v15 = (UIImageView *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v6];
      double v16 = self->_imageView;
      self->_imageView = v15;

      [(PKDataReleaseMerchantCell *)self _setupImageView];
    }
    double v17 = [(UIImageView *)self->_imageView superview];

    if (!v17)
    {
      double v18 = [(PKDataReleaseMerchantCell *)self contentView];
      [v18 addSubview:self->_imageView];
    }
    double v19 = [(UIView *)self->_imageBackgroundView superview];

    if (!v19)
    {
      v20 = [(PKDataReleaseMerchantCell *)self contentView];
      [v20 insertSubview:self->_imageBackgroundView below:self->_imageView];

LABEL_16:
      [(PKDataReleaseMerchantCell *)self setNeedsLayout];
      [(PKDataReleaseMerchantCell *)self layoutIfNeeded];
      goto LABEL_19;
    }
    if (!v17) {
      goto LABEL_16;
    }
  }
LABEL_19:
}

uint64_t __47__PKDataReleaseMerchantCell_setImage_animated___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 608) setAlpha:1.0];
  id v2 = *(void **)(a1 + 40);

  return [v2 setAlpha:0.0];
}

uint64_t __47__PKDataReleaseMerchantCell_setImage_animated___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeFromSuperview];
}

- (void)_setupImageView
{
  [(UIImageView *)self->_imageView setContentMode:1];
  [(UIImageView *)self->_imageView setClipsToBounds:1];
  imageView = self->_imageView;
  BOOL v4 = [MEMORY[0x1E4FB1618] whiteColor];
  [(UIImageView *)imageView setTintColor:v4];

  [(UIImageView *)self->_imageView _setContinuousCornerRadius:12.0];
  double v5 = [(UIImageView *)self->_imageView layer];
  if (self->_strokeImage) {
    double v6 = PKUIPixelLength();
  }
  else {
    double v6 = 0.0;
  }
  [v5 setBorderWidth:v6];

  [(PKDataReleaseMerchantCell *)self _updateImageViewDynamicColors];
  imageBackgroundView = self->_imageBackgroundView;

  [(UIView *)imageBackgroundView _setContinuousCornerRadius:12.0];
}

- (void)setStrokeImage:(BOOL)a3
{
  if (((!self->_strokeImage ^ a3) & 1) == 0)
  {
    self->_strokeImage = a3;
    imageView = self->_imageView;
    if (imageView)
    {
      id v6 = [(UIImageView *)imageView layer];
      if (self->_strokeImage) {
        double v5 = PKUIPixelLength();
      }
      else {
        double v5 = 0.0;
      }
      [v6 setBorderWidth:v5];
    }
  }
}

- (BOOL)useShadows
{
  return self->_useShadows;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageBackgroundView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);

  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end