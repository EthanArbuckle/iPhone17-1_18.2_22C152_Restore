@interface SKUIGiftResultView
- (NSString)title;
- (SKUIGiftItemView)itemView;
- (SKUIGiftResultView)initWithFrame:(CGRect)a3;
- (UIButton)giftAgainButton;
- (UIImage)image;
- (void)layoutSubviews;
- (void)setImage:(id)a3;
- (void)setItemView:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation SKUIGiftResultView

- (SKUIGiftResultView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIGiftResultView initWithFrame:]();
  }
  v14.receiver = self;
  v14.super_class = (Class)SKUIGiftResultView;
  v8 = -[SKUIGiftResultView initWithFrame:](&v14, sel_initWithFrame_, x, y, width, height);
  if (v8)
  {
    uint64_t v9 = [MEMORY[0x1E4FB14D0] buttonWithType:1];
    giftAgainButton = v8->_giftAgainButton;
    v8->_giftAgainButton = (UIButton *)v9;

    [(UIButton *)v8->_giftAgainButton setAutoresizingMask:5];
    v11 = [(UIButton *)v8->_giftAgainButton titleLabel];
    v12 = [MEMORY[0x1E4FB08E0] systemFontOfSize:18.0];
    [v11 setFont:v12];

    [(SKUIGiftResultView *)v8 addSubview:v8->_giftAgainButton];
  }
  return v8;
}

- (UIImage)image
{
  return [(UIImageView *)self->_imageView image];
}

- (void)setImage:(id)a3
{
  id v12 = a3;
  id v4 = [(UIImageView *)self->_imageView image];

  if (v4 != v12)
  {
    imageView = self->_imageView;
    if (v12)
    {
      if (!imageView)
      {
        v7 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
        v8 = self->_imageView;
        self->_imageView = v7;

        uint64_t v9 = self->_imageView;
        v10 = [(SKUIGiftResultView *)self backgroundColor];
        [(UIImageView *)v9 setBackgroundColor:v10];

        [(SKUIGiftResultView *)self addSubview:self->_imageView];
        imageView = self->_imageView;
      }
      -[UIImageView setImage:](imageView, "setImage:");
      [(UIImageView *)self->_imageView sizeToFit];
    }
    else
    {
      [(UIImageView *)imageView removeFromSuperview];
      v11 = self->_imageView;
      self->_imageView = 0;
    }
    uint64_t v5 = [(SKUIGiftResultView *)self setNeedsLayout];
  }

  MEMORY[0x1F4181820](v5);
}

- (void)setItemView:(id)a3
{
  uint64_t v5 = (SKUIGiftItemView *)a3;
  p_itemView = &self->_itemView;
  itemView = self->_itemView;
  if (itemView != v5)
  {
    v10 = v5;
    if (itemView) {
      [(SKUIGiftItemView *)itemView removeFromSuperview];
    }
    objc_storeStrong((id *)&self->_itemView, a3);
    v8 = *p_itemView;
    uint64_t v9 = [(SKUIGiftResultView *)self backgroundColor];
    [(SKUIGiftItemView *)v8 setBackgroundColor:v9];

    if (*p_itemView) {
      -[SKUIGiftResultView addSubview:](self, "addSubview:");
    }
    itemView = (SKUIGiftItemView *)[(SKUIGiftResultView *)self setNeedsLayout];
    uint64_t v5 = v10;
  }

  MEMORY[0x1F41817F8](itemView, v5);
}

- (void)setTitle:(id)a3
{
  id v15 = a3;
  id v4 = [(SKUIGiftResultView *)self title];
  if (v4 != v15 && ([v15 isEqualToString:v4] & 1) == 0)
  {
    titleLabel = self->_titleLabel;
    if (v15)
    {
      if (!titleLabel)
      {
        v6 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
        v7 = self->_titleLabel;
        self->_titleLabel = v6;

        v8 = self->_titleLabel;
        uint64_t v9 = [(SKUIGiftResultView *)self backgroundColor];
        [(UILabel *)v8 setBackgroundColor:v9];

        v10 = self->_titleLabel;
        v11 = [MEMORY[0x1E4FB08E0] boldSystemFontOfSize:16.0];
        [(UILabel *)v10 setFont:v11];

        [(UILabel *)self->_titleLabel setNumberOfLines:0];
        [(UILabel *)self->_titleLabel setTextAlignment:1];
        id v12 = self->_titleLabel;
        v13 = [MEMORY[0x1E4FB1618] _labelColor];
        [(UILabel *)v12 setTextColor:v13];

        [(SKUIGiftResultView *)self addSubview:self->_titleLabel];
        titleLabel = self->_titleLabel;
      }
      -[UILabel setText:](titleLabel, "setText:");
    }
    else
    {
      [(UILabel *)titleLabel removeFromSuperview];
      objc_super v14 = self->_titleLabel;
      self->_titleLabel = 0;
    }
    [(SKUIGiftResultView *)self setNeedsLayout];
  }
}

- (NSString)title
{
  return [(UILabel *)self->_titleLabel text];
}

- (void)layoutSubviews
{
  v3 = [MEMORY[0x1E4FB1438] sharedApplication];
  uint64_t v4 = [v3 userInterfaceLayoutDirection];

  [(SKUIGiftResultView *)self bounds];
  double v6 = v5;
  double v57 = v7;
  double v9 = v8;
  double v11 = v10;
  double v12 = v8 + -30.0;
  [(UIButton *)self->_giftAgainButton frame];
  double v14 = v13;
  double v16 = v15;
  [(UILabel *)self->_titleLabel frame];
  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v12, 1.79769313e308);
  double v18 = v17;
  imageView = self->_imageView;
  if (imageView || (imageView = self->_itemView) != 0)
  {
    [imageView bounds];
    double v21 = v20 + 15.0;
  }
  else
  {
    double v21 = 0.0;
  }
  double v56 = v11;
  float v22 = (v11 - (v16 + v18 + v21)) * 0.5;
  double v23 = floorf(v22);
  v24 = self->_imageView;
  if (v24)
  {
    double v54 = v14;
    double v55 = v6;
    double v53 = v16;
    [(UIImageView *)v24 frame];
    CGFloat v27 = v25;
    CGFloat v28 = v26;
    float v29 = (v9 - v25) * 0.5;
    float v30 = floorf(v29);
    double v31 = v30;
    v32 = self->_imageView;
    if (v4)
    {
      +[SKUICGRectHelpers rect:withFlippedOriginXRelativeTo:](SKUICGRectHelpers, "rect:withFlippedOriginXRelativeTo:", v30, v23, v25, v26, v55, v57, v9, v11);
    }
    else
    {
      double v33 = v30;
      double v34 = v23;
    }
    -[UIImageView setFrame:](v32, "setFrame:", v33, v34);
    double v41 = 15.0;
  }
  else
  {
    itemView = self->_itemView;
    if (!itemView) {
      goto LABEL_16;
    }
    double v53 = v16;
    double v54 = v14;
    [(SKUIGiftItemView *)itemView frame];
    CGFloat v28 = v36;
    v37 = self->_itemView;
    double v55 = v6;
    if (v4)
    {
      double v31 = 15.0;
      +[SKUICGRectHelpers rect:withFlippedOriginXRelativeTo:](SKUICGRectHelpers, "rect:withFlippedOriginXRelativeTo:", 15.0, v23, v12, v36, v6, v57, v9, v11);
    }
    else
    {
      double v38 = 15.0;
      double v39 = v23;
      double v40 = v12;
      double v31 = 15.0;
    }
    -[SKUIGiftItemView setFrame:](v37, "setFrame:", v38, v39, v40);
    double v41 = 0.0;
    CGFloat v27 = v12;
  }
  v59.origin.double x = v31;
  v59.origin.double y = v23;
  v59.size.double width = v27;
  v59.size.double height = v28;
  double v23 = CGRectGetMaxY(v59) + v41;
  double v16 = v53;
  double v14 = v54;
  double v6 = v55;
LABEL_16:
  -[UILabel setFrame:](self->_titleLabel, "setFrame:", 15.0, v23, v12, v18);
  titleLabel = self->_titleLabel;
  double v43 = 15.0;
  double v44 = v23;
  double v45 = v12;
  double v46 = v18;
  if (v4) {
    +[SKUICGRectHelpers rect:withFlippedOriginXRelativeTo:](SKUICGRectHelpers, "rect:withFlippedOriginXRelativeTo:", 15.0, v23, v12, v18, v6, v57, v9, v56);
  }
  -[UILabel setFrame:](titleLabel, "setFrame:", v43, v44, v45, v46);
  v60.origin.double x = 15.0;
  v60.origin.double y = v23;
  v60.size.double width = v12;
  v60.size.double height = v18;
  double v47 = CGRectGetMaxY(v60) + 16.0;
  float v48 = (v9 - v14) * 0.5;
  double v49 = floorf(v48);
  giftAgainButton = self->_giftAgainButton;
  if (v4)
  {
    +[SKUICGRectHelpers rect:withFlippedOriginXRelativeTo:](SKUICGRectHelpers, "rect:withFlippedOriginXRelativeTo:", v49, v47, v14, v16, v6, v57, v9, v56);
    double v14 = v51;
    double v16 = v52;
  }

  -[UIButton setFrame:](giftAgainButton, "setFrame:", v49, v47, v14, v16);
}

- (UIButton)giftAgainButton
{
  return self->_giftAgainButton;
}

- (SKUIGiftItemView)itemView
{
  return self->_itemView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_itemView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);

  objc_storeStrong((id *)&self->_giftAgainButton, 0);
}

- (void)initWithFrame:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIGiftResultView initWithFrame:]";
}

@end