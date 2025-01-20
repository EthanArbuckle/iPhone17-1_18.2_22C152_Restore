@interface PKTransactionHistoryTransactionGroupHeaderCell
- (BOOL)useShadows;
- (CGSize)_layoutWithBounds:(CGRect)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)subtitle;
- (NSString)title;
- (PKTransactionHistoryTransactionGroupHeaderCell)initWithFrame:(CGRect)a3;
- (void)_dynamicUserInterfaceTraitDidChange;
- (void)_setupImageView;
- (void)_updateImageViewDynamicColors;
- (void)layoutSubviews;
- (void)setImage:(id)a3 animated:(BOOL)a4;
- (void)setStrokeImage:(BOOL)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
- (void)setUseShadows:(BOOL)a3;
@end

@implementation PKTransactionHistoryTransactionGroupHeaderCell

- (PKTransactionHistoryTransactionGroupHeaderCell)initWithFrame:(CGRect)a3
{
  v21.receiver = self;
  v21.super_class = (Class)PKTransactionHistoryTransactionGroupHeaderCell;
  v3 = -[PKDashboardCollectionViewCell initWithFrame:](&v21, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(PKDashboardCollectionViewCell *)v3 setWantsCustomAppearance:1];
    v5 = [(PKTransactionHistoryTransactionGroupHeaderCell *)v4 contentView];
    v6 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    imageBackgroundView = v4->_imageBackgroundView;
    v4->_imageBackgroundView = v6;

    [v5 addSubview:v4->_imageBackgroundView];
    v8 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
    imageView = v4->_imageView;
    v4->_imageView = v8;

    [(PKTransactionHistoryTransactionGroupHeaderCell *)v4 _setupImageView];
    [v5 addSubview:v4->_imageView];
    v10 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = v10;

    [(UILabel *)v4->_titleLabel setAdjustsFontSizeToFitWidth:1];
    [(UILabel *)v4->_titleLabel setNumberOfLines:2];
    [(UILabel *)v4->_titleLabel setTextAlignment:1];
    v12 = v4->_titleLabel;
    v13 = [MEMORY[0x1E4FB1618] labelColor];
    [(UILabel *)v12 setTextColor:v13];

    [v5 addSubview:v4->_titleLabel];
    v14 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    subtitleLabel = v4->_subtitleLabel;
    v4->_subtitleLabel = v14;

    [(UILabel *)v4->_subtitleLabel setAdjustsFontSizeToFitWidth:1];
    [(UILabel *)v4->_subtitleLabel setNumberOfLines:1];
    v16 = v4->_subtitleLabel;
    v17 = PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB2950], (NSString *)*MEMORY[0x1E4FB27B8]);
    [(UILabel *)v16 setFont:v17];

    v18 = v4->_subtitleLabel;
    v19 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [(UILabel *)v18 setTextColor:v19];

    [v5 addSubview:v4->_subtitleLabel];
  }
  return v4;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)PKTransactionHistoryTransactionGroupHeaderCell;
  [(PKDashboardCollectionViewCell *)&v4 layoutSubviews];
  v3 = [(PKTransactionHistoryTransactionGroupHeaderCell *)self contentView];
  [v3 bounds];
  [(PKTransactionHistoryTransactionGroupHeaderCell *)self _layoutWithBounds:"_layoutWithBounds:"];
}

- (CGSize)_layoutWithBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(PKTransactionHistoryTransactionGroupHeaderCell *)self _shouldReverseLayoutDirection];
  v8 = [(UILabel *)self->_subtitleLabel text];
  if ([v8 length])
  {

    memset(&v39, 0, sizeof(v39));
    BOOL v9 = 1;
    double v10 = -18.0;
    double v11 = 18.0;
  }
  else
  {
    v12 = [(UIImageView *)self->_imageView image];

    memset(&v39, 0, sizeof(v39));
    double v10 = -18.0;
    double v11 = 18.0;
    if (!v12)
    {
      double v11 = 5.0;
      double v10 = -5.0;
    }
    BOOL v9 = v12 != 0;
  }
  double v13 = y + v11;
  double v14 = height + v10;
  remainder.origin.double x = x + 18.0;
  remainder.origin.double y = y + v11;
  remainder.size.double width = width + -36.0;
  remainder.size.double height = height + v10;
  v15 = [(UIImageView *)self->_imageView image];

  if (v15)
  {
    v42.origin.double x = x + 18.0;
    v42.origin.double y = v13;
    v42.size.double width = width + -36.0;
    v42.size.double height = v14;
    CGRectDivide(v42, &v39, &remainder, 100.0, CGRectMinYEdge);
    if (!self->_isTemplateLayout)
    {
      PKSizeAlignedInRect();
      double v17 = v16;
      double v19 = v18;
      double v21 = v20;
      double v23 = v22;
      -[UIImageView setFrame:](self->_imageView, "setFrame:");
      -[UIView setFrame:](self->_imageBackgroundView, "setFrame:", v17, v19, v21, v23);
    }
    CGRectDivide(remainder, &v39, &remainder, 18.0, CGRectMinYEdge);
  }
  titleLabel = self->_titleLabel;
  v25 = (void **)MEMORY[0x1E4FB2980];
  if (v9) {
    v25 = (void **)MEMORY[0x1E4FB2988];
  }
  v26 = PKFontForDefaultDesign(*v25, (void *)*MEMORY[0x1E4FB27B8], 2, 0);
  [(UILabel *)titleLabel setFont:v26];

  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", remainder.size.width, remainder.size.height);
  CGRectDivide(remainder, &v39, &remainder, v27, CGRectMinYEdge);
  if (!self->_isTemplateLayout)
  {
    v28 = self->_titleLabel;
    if (!v9) {
      PKContentAlignmentMake();
    }
    PKSizeAlignedInRect();
    -[UILabel setFrame:](v28, "setFrame:");
  }
  -[UILabel sizeThatFits:](self->_subtitleLabel, "sizeThatFits:", remainder.size.width, remainder.size.height);
  CGFloat v30 = remainder.size.width;
  if (v29 > 0.0)
  {
    CGFloat v31 = v29;
    CGFloat v32 = remainder.origin.x;
    CGFloat v33 = remainder.origin.y;
    CGFloat v34 = remainder.size.height;
    CGRectDivide(*(CGRect *)(&v30 - 2), &v39, &remainder, 3.0, CGRectMinYEdge);
    CGRectDivide(remainder, &v39, &remainder, v31, CGRectMinYEdge);
    if (!self->_isTemplateLayout)
    {
      subtitleLabel = self->_subtitleLabel;
      PKSizeAlignedInRect();
      -[UILabel setFrame:](subtitleLabel, "setFrame:");
    }
  }
  v43.origin.double x = x;
  v43.origin.double y = y;
  v43.size.double width = width;
  v43.size.double height = height;
  CGFloat v36 = CGRectGetWidth(v43);
  double MaxY = CGRectGetMaxY(v39);
  double v38 = v36;
  result.double height = MaxY;
  result.double width = v38;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  self->_isTemplateLayout = 1;
  -[PKTransactionHistoryTransactionGroupHeaderCell _layoutWithBounds:](self, "_layoutWithBounds:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), a3.width, 3.40282347e38);
  self->_isTemplateLayout = 0;
  result.double height = v5;
  result.double width = v4;
  return result;
}

- (void)_updateImageViewDynamicColors
{
  v3 = [(PKTransactionHistoryTransactionGroupHeaderCell *)self traitCollection];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __79__PKTransactionHistoryTransactionGroupHeaderCell__updateImageViewDynamicColors__block_invoke;
  v4[3] = &unk_1E59CA7D0;
  v4[4] = self;
  PKUIPerformWithEffectiveTraitCollection(v3, v4);
}

void __79__PKTransactionHistoryTransactionGroupHeaderCell__updateImageViewDynamicColors__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 760) layer];
  id v1 = [MEMORY[0x1E4FB1618] systemGrayColor];
  objc_msgSend(v2, "setBorderColor:", objc_msgSend(v1, "CGColor"));
}

- (void)_dynamicUserInterfaceTraitDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PKTransactionHistoryTransactionGroupHeaderCell;
  [(PKTransactionHistoryTransactionGroupHeaderCell *)&v3 _dynamicUserInterfaceTraitDidChange];
  [(PKTransactionHistoryTransactionGroupHeaderCell *)self _updateImageViewDynamicColors];
}

- (NSString)title
{
  return [(UILabel *)self->_titleLabel text];
}

- (void)setTitle:(id)a3
{
  [(UILabel *)self->_titleLabel setText:a3];

  [(PKTransactionHistoryTransactionGroupHeaderCell *)self setNeedsLayout];
}

- (NSString)subtitle
{
  return [(UILabel *)self->_subtitleLabel text];
}

- (void)setSubtitle:(id)a3
{
  [(UILabel *)self->_subtitleLabel setText:a3];

  [(PKTransactionHistoryTransactionGroupHeaderCell *)self setNeedsLayout];
}

- (void)setUseShadows:(BOOL)a3
{
  if (((!self->_useShadows ^ a3) & 1) == 0)
  {
    BOOL v3 = a3;
    self->_useShadows = a3;
    double v4 = [(UIView *)self->_imageBackgroundView layer];
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
  double v7 = (UIImage *)a3;
  p_image = &self->_image;
  if (self->_image != v7)
  {
    objc_storeStrong((id *)&self->_image, a3);
    imageView = self->_imageView;
    if (!*p_image)
    {
      v15 = [(UIImageView *)imageView superview];
      if (v15)
      {
      }
      else
      {
        v25 = [(UIView *)self->_imageBackgroundView superview];

        if (!v25) {
          goto LABEL_21;
        }
      }
      [(UIImageView *)self->_imageView removeFromSuperview];
      [(UIView *)self->_imageBackgroundView removeFromSuperview];
      [(PKTransactionHistoryTransactionGroupHeaderCell *)self setNeedsLayout];
      goto LABEL_21;
    }
    if (imageView)
    {
      if (v4)
      {
        double v10 = imageView;
        double v11 = (UIImageView *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:*p_image];
        v12 = self->_imageView;
        self->_imageView = v11;

        [(PKTransactionHistoryTransactionGroupHeaderCell *)self _setupImageView];
        [(UIImageView *)self->_imageView setImage:*p_image];
        [(UIImageView *)self->_imageView setAlpha:0.0];
        double v13 = (void *)MEMORY[0x1E4FB1EB0];
        v28[0] = MEMORY[0x1E4F143A8];
        v28[1] = 3221225472;
        v28[2] = __68__PKTransactionHistoryTransactionGroupHeaderCell_setImage_animated___block_invoke;
        v28[3] = &unk_1E59CA870;
        v28[4] = self;
        double v29 = v10;
        v26[0] = MEMORY[0x1E4F143A8];
        v26[1] = 3221225472;
        v26[2] = __68__PKTransactionHistoryTransactionGroupHeaderCell_setImage_animated___block_invoke_2;
        v26[3] = &unk_1E59CB6D8;
        CGFloat v27 = v29;
        double v14 = v29;
        objc_msgSend(v13, "pkui_animateUsingOptions:animations:completion:", 4, v28, v26);
      }
      else
      {
        double v14 = [(UIImageView *)imageView image];
        [(UIImageView *)self->_imageView setImage:*p_image];
        double v18 = [(UIImageView *)self->_imageView image];

        if (v18 == v14)
        {
          [(UIImageView *)self->_imageView removeFromSuperview];
          double v19 = (UIImageView *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:*p_image];
          double v20 = self->_imageView;
          self->_imageView = v19;

          [(PKTransactionHistoryTransactionGroupHeaderCell *)self _setupImageView];
        }
      }
    }
    else
    {
      double v16 = (UIImageView *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:*p_image];
      double v17 = self->_imageView;
      self->_imageView = v16;

      [(PKTransactionHistoryTransactionGroupHeaderCell *)self _setupImageView];
    }
    double v21 = [(UIImageView *)self->_imageView superview];

    if (!v21)
    {
      double v22 = [(PKTransactionHistoryTransactionGroupHeaderCell *)self contentView];
      [v22 addSubview:self->_imageView];
    }
    double v23 = [(UIView *)self->_imageBackgroundView superview];

    if (!v23)
    {
      v24 = [(PKTransactionHistoryTransactionGroupHeaderCell *)self contentView];
      [v24 insertSubview:self->_imageBackgroundView below:self->_imageView];

LABEL_18:
      [(PKTransactionHistoryTransactionGroupHeaderCell *)self setNeedsLayout];
      [(PKTransactionHistoryTransactionGroupHeaderCell *)self layoutIfNeeded];
      goto LABEL_21;
    }
    if (!v21) {
      goto LABEL_18;
    }
  }
LABEL_21:
}

uint64_t __68__PKTransactionHistoryTransactionGroupHeaderCell_setImage_animated___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 760) setAlpha:1.0];
  id v2 = *(void **)(a1 + 40);

  return [v2 setAlpha:0.0];
}

uint64_t __68__PKTransactionHistoryTransactionGroupHeaderCell_setImage_animated___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeFromSuperview];
}

- (void)_setupImageView
{
  [(UIImageView *)self->_imageView setContentMode:1];
  [(UIImageView *)self->_imageView setClipsToBounds:1];
  [(UIImageView *)self->_imageView _setContinuousCornerRadius:8.0];
  BOOL v3 = [(UIImageView *)self->_imageView layer];
  if (self->_strokeImage) {
    double v4 = PKUIPixelLength();
  }
  else {
    double v4 = 0.0;
  }
  [v3 setBorderWidth:v4];

  [(PKTransactionHistoryTransactionGroupHeaderCell *)self _updateImageViewDynamicColors];
  imageBackgroundView = self->_imageBackgroundView;

  [(UIView *)imageBackgroundView _setContinuousCornerRadius:8.0];
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
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);

  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end