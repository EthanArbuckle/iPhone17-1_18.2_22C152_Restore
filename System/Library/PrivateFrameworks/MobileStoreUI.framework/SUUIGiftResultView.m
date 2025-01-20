@interface SUUIGiftResultView
- (NSString)title;
- (SUUIGiftItemView)itemView;
- (SUUIGiftResultView)initWithFrame:(CGRect)a3;
- (UIButton)giftAgainButton;
- (UIImage)image;
- (void)layoutSubviews;
- (void)setImage:(id)a3;
- (void)setItemView:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation SUUIGiftResultView

- (SUUIGiftResultView)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SUUIGiftResultView;
  v3 = -[SUUIGiftResultView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x263F824E8] buttonWithType:1];
    giftAgainButton = v3->_giftAgainButton;
    v3->_giftAgainButton = (UIButton *)v4;

    [(UIButton *)v3->_giftAgainButton setAutoresizingMask:5];
    v6 = [(UIButton *)v3->_giftAgainButton titleLabel];
    v7 = [MEMORY[0x263F81708] systemFontOfSize:18.0];
    [v6 setFont:v7];

    [(SUUIGiftResultView *)v3 addSubview:v3->_giftAgainButton];
  }
  return v3;
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
        v7 = (UIImageView *)objc_alloc_init(MEMORY[0x263F82828]);
        v8 = self->_imageView;
        self->_imageView = v7;

        objc_super v9 = self->_imageView;
        v10 = [(SUUIGiftResultView *)self backgroundColor];
        [(UIImageView *)v9 setBackgroundColor:v10];

        [(SUUIGiftResultView *)self addSubview:self->_imageView];
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
    uint64_t v5 = [(SUUIGiftResultView *)self setNeedsLayout];
  }
  MEMORY[0x270F9A790](v5);
}

- (void)setItemView:(id)a3
{
  uint64_t v5 = (SUUIGiftItemView *)a3;
  p_itemView = &self->_itemView;
  itemView = self->_itemView;
  if (itemView != v5)
  {
    v10 = v5;
    if (itemView) {
      [(SUUIGiftItemView *)itemView removeFromSuperview];
    }
    objc_storeStrong((id *)&self->_itemView, a3);
    v8 = *p_itemView;
    objc_super v9 = [(SUUIGiftResultView *)self backgroundColor];
    [(SUUIGiftItemView *)v8 setBackgroundColor:v9];

    if (*p_itemView) {
      -[SUUIGiftResultView addSubview:](self, "addSubview:");
    }
    itemView = (SUUIGiftItemView *)[(SUUIGiftResultView *)self setNeedsLayout];
    uint64_t v5 = v10;
  }
  MEMORY[0x270F9A758](itemView, v5);
}

- (void)setTitle:(id)a3
{
  id v15 = a3;
  id v4 = [(SUUIGiftResultView *)self title];
  if (v4 != v15 && ([v15 isEqualToString:v4] & 1) == 0)
  {
    titleLabel = self->_titleLabel;
    if (v15)
    {
      if (!titleLabel)
      {
        v6 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
        v7 = self->_titleLabel;
        self->_titleLabel = v6;

        v8 = self->_titleLabel;
        objc_super v9 = [(SUUIGiftResultView *)self backgroundColor];
        [(UILabel *)v8 setBackgroundColor:v9];

        v10 = self->_titleLabel;
        v11 = [MEMORY[0x263F81708] boldSystemFontOfSize:16.0];
        [(UILabel *)v10 setFont:v11];

        [(UILabel *)self->_titleLabel setNumberOfLines:0];
        [(UILabel *)self->_titleLabel setTextAlignment:1];
        id v12 = self->_titleLabel;
        v13 = [MEMORY[0x263F825C8] labelColor];
        [(UILabel *)v12 setTextColor:v13];

        [(SUUIGiftResultView *)self addSubview:self->_titleLabel];
        titleLabel = self->_titleLabel;
      }
      -[UILabel setText:](titleLabel, "setText:");
    }
    else
    {
      [(UILabel *)titleLabel removeFromSuperview];
      v14 = self->_titleLabel;
      self->_titleLabel = 0;
    }
    [(SUUIGiftResultView *)self setNeedsLayout];
  }
}

- (NSString)title
{
  return [(UILabel *)self->_titleLabel text];
}

- (void)layoutSubviews
{
  v3 = [MEMORY[0x263F82438] sharedApplication];
  uint64_t v4 = [v3 userInterfaceLayoutDirection];

  [(SUUIGiftResultView *)self bounds];
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
      +[SUUICGRectHelpers rect:withFlippedOriginXRelativeTo:](SUUICGRectHelpers, "rect:withFlippedOriginXRelativeTo:", v30, v23, v25, v26, v55, v57, v9, v11);
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
    [(SUUIGiftItemView *)itemView frame];
    CGFloat v28 = v36;
    v37 = self->_itemView;
    double v55 = v6;
    if (v4)
    {
      double v31 = 15.0;
      +[SUUICGRectHelpers rect:withFlippedOriginXRelativeTo:](SUUICGRectHelpers, "rect:withFlippedOriginXRelativeTo:", 15.0, v23, v12, v36, v6, v57, v9, v11);
    }
    else
    {
      double v38 = 15.0;
      double v39 = v23;
      double v40 = v12;
      double v31 = 15.0;
    }
    -[SUUIGiftItemView setFrame:](v37, "setFrame:", v38, v39, v40);
    double v41 = 0.0;
    CGFloat v27 = v12;
  }
  v59.origin.x = v31;
  v59.origin.y = v23;
  v59.size.width = v27;
  v59.size.height = v28;
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
    +[SUUICGRectHelpers rect:withFlippedOriginXRelativeTo:](SUUICGRectHelpers, "rect:withFlippedOriginXRelativeTo:", 15.0, v23, v12, v18, v6, v57, v9, v56);
  }
  -[UILabel setFrame:](titleLabel, "setFrame:", v43, v44, v45, v46);
  v60.origin.x = 15.0;
  v60.origin.y = v23;
  v60.size.width = v12;
  v60.size.height = v18;
  double v47 = CGRectGetMaxY(v60) + 16.0;
  float v48 = (v9 - v14) * 0.5;
  double v49 = floorf(v48);
  giftAgainButton = self->_giftAgainButton;
  if (v4)
  {
    +[SUUICGRectHelpers rect:withFlippedOriginXRelativeTo:](SUUICGRectHelpers, "rect:withFlippedOriginXRelativeTo:", v49, v47, v14, v16, v6, v57, v9, v56);
    double v14 = v51;
    double v16 = v52;
  }
  -[UIButton setFrame:](giftAgainButton, "setFrame:", v49, v47, v14, v16);
}

- (UIButton)giftAgainButton
{
  return self->_giftAgainButton;
}

- (SUUIGiftItemView)itemView
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

@end