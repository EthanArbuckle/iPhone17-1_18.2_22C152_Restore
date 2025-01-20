@interface PKCollectionHeaderView
- (CGSize)_layoutWithBounds:(CGRect)a3 isTemplateLayout:(BOOL)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)primaryText;
- (NSString)secondaryText;
- (NSString)tertiaryText;
- (UIImage)image;
- (double)bottomPadding;
- (double)heightOfHeaderWithoutText;
- (double)topPadding;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setBottomPadding:(double)a3;
- (void)setImage:(id)a3;
- (void)setPrimaryText:(id)a3;
- (void)setSecondaryText:(id)a3;
- (void)setTertiaryText:(id)a3;
- (void)setTopPadding:(double)a3;
@end

@implementation PKCollectionHeaderView

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)PKCollectionHeaderView;
  [(PKCollectionHeaderView *)&v4 layoutSubviews];
  v3 = [(PKCollectionHeaderView *)self contentView];
  [v3 bounds];
  -[PKCollectionHeaderView _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 0);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[PKCollectionHeaderView _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 1, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)_layoutWithBounds:(CGRect)a3 isTemplateLayout:(BOOL)a4
{
  CGFloat width = a3.size.width;
  uint64_t v19 = 0;
  v20 = (double *)&v19;
  double v6 = self->_topPadding + 0.0;
  uint64_t v21 = 0x2020000000;
  double v22 = v6;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __61__PKCollectionHeaderView__layoutWithBounds_isTemplateLayout___block_invoke;
  v17[3] = &unk_1E59CBBF8;
  v17[4] = &v19;
  *(double *)&v17[5] = a3.origin.x + 12.0;
  *(double *)&v17[6] = a3.origin.y + 0.0;
  *(double *)&v17[7] = a3.size.width + -24.0;
  v17[8] = *(void *)&a3.size.height;
  BOOL v18 = a4;
  v7 = (void (**)(void *, UIImageView *, double, double))_Block_copy(v17);
  v7[2](v7, self->_imageView, 90.0, 0.0);
  if (self->_imageView) {
    v8.n128_f64[0] = 10.0;
  }
  else {
    v8.n128_f64[0] = 0.0;
  }
  ((void (*)(void (**)(void *, UIImageView *, double, double), UILabel *, double, __n128))v7[2])(v7, self->_primaryLabel, 0.0, v8);
  double v10 = 4.0;
  v11.n128_u64[0] = 0;
  if (self->_primaryLabel) {
    v9.n128_f64[0] = 4.0;
  }
  else {
    v9.n128_f64[0] = 0.0;
  }
  ((void (*)(void (**)(void *, UIImageView *, double, double), UILabel *, __n128, __n128))v7[2])(v7, self->_secondaryLabel, v11, v9);
  if (!self->_secondaryLabel)
  {
    if (self->_primaryLabel) {
      double v10 = 4.0;
    }
    else {
      double v10 = 0.0;
    }
  }
  v7[2](v7, (UIImageView *)self->_tertiaryLabel, 0.0, v10);
  v12 = v20;
  double v13 = v20[3] + 0.0;
  v20[3] = v13;
  double v14 = v13 + self->_bottomPadding;
  v12[3] = v14;

  _Block_object_dispose(&v19, 8);
  double v15 = width;
  double v16 = v14;
  result.height = v16;
  result.CGFloat width = v15;
  return result;
}

void __61__PKCollectionHeaderView__layoutWithBounds_isTemplateLayout___block_invoke(uint64_t a1, void *a2, double a3, double a4)
{
  id v7 = a2;
  if (v7)
  {
    id v9 = v7;
    [v7 frame];
    *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = *(double *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                            + 24)
                                                                + a4;
    if (a3 <= 0.0) {
      objc_msgSend(v9, "sizeThatFits:", *(double *)(a1 + 56), *(double *)(a1 + 64));
    }
    PKRectCenteredXInRect();
    *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v8
                                                                + *(double *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                            + 24);
    id v7 = v9;
    if (!*(unsigned char *)(a1 + 72))
    {
      objc_msgSend(v9, "setFrame:");
      id v7 = v9;
    }
  }
}

- (double)heightOfHeaderWithoutText
{
  [(UIImageView *)self->_imageView frame];

  return CGRectGetMaxY(*(CGRect *)&v2);
}

- (void)setPrimaryText:(id)a3
{
  id v5 = a3;
  p_primaryText = &self->_primaryText;
  primaryText = self->_primaryText;
  uint64_t v19 = (NSString *)v5;
  double v8 = primaryText;
  if (v8 == v19)
  {

LABEL_13:
    double v10 = v19;
    goto LABEL_14;
  }
  if (!v19 || !v8)
  {

    goto LABEL_8;
  }
  BOOL v9 = [(NSString *)v19 isEqualToString:v8];

  double v10 = v19;
  if (!v9)
  {
LABEL_8:
    objc_storeStrong((id *)&self->_primaryText, a3);
    uint64_t v11 = [(NSString *)*p_primaryText length];
    primaryLabel = self->_primaryLabel;
    if (v11)
    {
      if (!primaryLabel)
      {
        id v13 = objc_alloc(MEMORY[0x1E4FB1930]);
        double v14 = (UILabel *)objc_msgSend(v13, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
        double v15 = self->_primaryLabel;
        self->_primaryLabel = v14;

        double v16 = self->_primaryLabel;
        v17 = PKFontForDefaultDesign((void *)*MEMORY[0x1E4FB2988], (void *)*MEMORY[0x1E4FB2788], 2, 0);
        [(UILabel *)v16 setFont:v17];

        [(UILabel *)self->_primaryLabel setNumberOfLines:0];
        [(UILabel *)self->_primaryLabel setTextAlignment:1];
        [(PKCollectionHeaderView *)self addSubview:self->_primaryLabel];
      }
    }
    else
    {
      [(UILabel *)primaryLabel removeFromSuperview];
      BOOL v18 = self->_primaryLabel;
      self->_primaryLabel = 0;
    }
    [(UILabel *)self->_primaryLabel setText:*p_primaryText];
    [(PKCollectionHeaderView *)self setNeedsLayout];
    goto LABEL_13;
  }
LABEL_14:
}

- (void)setSecondaryText:(id)a3
{
  id v5 = a3;
  p_secondaryText = &self->_secondaryText;
  secondaryText = self->_secondaryText;
  uint64_t v21 = (NSString *)v5;
  double v8 = secondaryText;
  if (v8 == v21)
  {

LABEL_13:
    double v10 = v21;
    goto LABEL_14;
  }
  if (!v21 || !v8)
  {

    goto LABEL_8;
  }
  BOOL v9 = [(NSString *)v21 isEqualToString:v8];

  double v10 = v21;
  if (!v9)
  {
LABEL_8:
    objc_storeStrong((id *)&self->_secondaryText, a3);
    uint64_t v11 = [(NSString *)*p_secondaryText length];
    secondaryLabel = self->_secondaryLabel;
    if (v11)
    {
      if (!secondaryLabel)
      {
        id v13 = objc_alloc(MEMORY[0x1E4FB1930]);
        double v14 = (UILabel *)objc_msgSend(v13, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
        double v15 = self->_secondaryLabel;
        self->_secondaryLabel = v14;

        double v16 = self->_secondaryLabel;
        v17 = PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB2950], (NSString *)*MEMORY[0x1E4FB2790]);
        [(UILabel *)v16 setFont:v17];

        [(UILabel *)self->_secondaryLabel setNumberOfLines:0];
        [(UILabel *)self->_secondaryLabel setTextAlignment:1];
        BOOL v18 = self->_secondaryLabel;
        uint64_t v19 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
        [(UILabel *)v18 setTextColor:v19];

        [(PKCollectionHeaderView *)self addSubview:self->_secondaryLabel];
      }
    }
    else
    {
      [(UILabel *)secondaryLabel removeFromSuperview];
      v20 = self->_secondaryLabel;
      self->_secondaryLabel = 0;
    }
    [(UILabel *)self->_secondaryLabel setText:*p_secondaryText];
    [(PKCollectionHeaderView *)self setNeedsLayout];
    goto LABEL_13;
  }
LABEL_14:
}

- (void)setTertiaryText:(id)a3
{
  id v5 = a3;
  p_tertiaryText = &self->_tertiaryText;
  tertiaryText = self->_tertiaryText;
  uint64_t v21 = (NSString *)v5;
  double v8 = tertiaryText;
  if (v8 == v21)
  {

LABEL_13:
    double v10 = v21;
    goto LABEL_14;
  }
  if (!v21 || !v8)
  {

    goto LABEL_8;
  }
  BOOL v9 = [(NSString *)v21 isEqualToString:v8];

  double v10 = v21;
  if (!v9)
  {
LABEL_8:
    objc_storeStrong((id *)&self->_tertiaryText, a3);
    uint64_t v11 = [(NSString *)*p_tertiaryText length];
    tertiaryLabel = self->_tertiaryLabel;
    if (v11)
    {
      if (!tertiaryLabel)
      {
        id v13 = objc_alloc(MEMORY[0x1E4FB1930]);
        double v14 = (UILabel *)objc_msgSend(v13, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
        double v15 = self->_tertiaryLabel;
        self->_tertiaryLabel = v14;

        double v16 = self->_tertiaryLabel;
        v17 = PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB2950], (NSString *)*MEMORY[0x1E4FB2790]);
        [(UILabel *)v16 setFont:v17];

        [(UILabel *)self->_tertiaryLabel setNumberOfLines:0];
        [(UILabel *)self->_tertiaryLabel setTextAlignment:1];
        BOOL v18 = self->_tertiaryLabel;
        uint64_t v19 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
        [(UILabel *)v18 setTextColor:v19];

        [(PKCollectionHeaderView *)self addSubview:self->_tertiaryLabel];
      }
    }
    else
    {
      [(UILabel *)tertiaryLabel removeFromSuperview];
      v20 = self->_tertiaryLabel;
      self->_tertiaryLabel = 0;
    }
    [(UILabel *)self->_tertiaryLabel setText:*p_tertiaryText];
    [(PKCollectionHeaderView *)self setNeedsLayout];
    goto LABEL_13;
  }
LABEL_14:
}

- (void)setTopPadding:(double)a3
{
  if (self->_topPadding != a3)
  {
    self->_topPadding = a3;
    [(PKCollectionHeaderView *)self setNeedsLayout];
  }
}

- (void)setBottomPadding:(double)a3
{
  if (self->_bottomPadding != a3)
  {
    self->_bottomPadding = a3;
    [(PKCollectionHeaderView *)self setNeedsLayout];
  }
}

- (void)setImage:(id)a3
{
  id v5 = (UIImage *)a3;
  p_image = &self->_image;
  if (self->_image != v5)
  {
    v12 = v5;
    objc_storeStrong((id *)&self->_image, a3);
    imageView = self->_imageView;
    if (*p_image)
    {
      if (!imageView)
      {
        id v8 = objc_alloc(MEMORY[0x1E4FB1838]);
        BOOL v9 = (UIImageView *)objc_msgSend(v8, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
        double v10 = self->_imageView;
        self->_imageView = v9;

        [(UIImageView *)self->_imageView setContentMode:1];
        [(UIImageView *)self->_imageView setClipsToBounds:1];
        [(UIImageView *)self->_imageView _setContinuousCornerRadius:12.0];
        [(PKCollectionHeaderView *)self addSubview:self->_imageView];
      }
    }
    else
    {
      [(UIImageView *)imageView removeFromSuperview];
      uint64_t v11 = self->_imageView;
      self->_imageView = 0;
    }
    [(UIImageView *)self->_imageView setImage:*p_image];
    [(PKCollectionHeaderView *)self setNeedsLayout];
    id v5 = v12;
  }
}

- (void)prepareForReuse
{
  v11.receiver = self;
  v11.super_class = (Class)PKCollectionHeaderView;
  [(PKCollectionHeaderView *)&v11 prepareForReuse];
  [(UILabel *)self->_primaryLabel removeFromSuperview];
  primaryLabel = self->_primaryLabel;
  self->_primaryLabel = 0;

  primaryText = self->_primaryText;
  self->_primaryText = 0;

  [(UILabel *)self->_secondaryLabel removeFromSuperview];
  secondaryLabel = self->_secondaryLabel;
  self->_secondaryLabel = 0;

  secondaryText = self->_secondaryText;
  self->_secondaryText = 0;

  [(UILabel *)self->_tertiaryLabel removeFromSuperview];
  tertiaryLabel = self->_tertiaryLabel;
  self->_tertiaryLabel = 0;

  tertiaryText = self->_tertiaryText;
  self->_tertiaryText = 0;

  self->_topPadding = 0.0;
  self->_bottomPadding = 0.0;
  image = self->_image;
  self->_image = 0;

  [(UIImageView *)self->_imageView removeFromSuperview];
  imageView = self->_imageView;
  self->_imageView = 0;
}

- (UIImage)image
{
  return self->_image;
}

- (NSString)primaryText
{
  return self->_primaryText;
}

- (NSString)secondaryText
{
  return self->_secondaryText;
}

- (NSString)tertiaryText
{
  return self->_tertiaryText;
}

- (double)topPadding
{
  return self->_topPadding;
}

- (double)bottomPadding
{
  return self->_bottomPadding;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tertiaryText, 0);
  objc_storeStrong((id *)&self->_secondaryText, 0);
  objc_storeStrong((id *)&self->_primaryText, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_tertiaryLabel, 0);
  objc_storeStrong((id *)&self->_secondaryLabel, 0);

  objc_storeStrong((id *)&self->_primaryLabel, 0);
}

@end