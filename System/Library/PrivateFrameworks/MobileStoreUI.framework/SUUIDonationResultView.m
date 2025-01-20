@interface SUUIDonationResultView
- (NSString)message;
- (NSString)title;
- (UIImage)image;
- (void)layoutSubviews;
- (void)setImage:(id)a3;
- (void)setMessage:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation SUUIDonationResultView

- (UIImage)image
{
  return [(UIImageView *)self->_imageView image];
}

- (NSString)message
{
  return [(UILabel *)self->_messageLabel text];
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

        v9 = self->_imageView;
        v10 = [(SUUIDonationResultView *)self backgroundColor];
        [(UIImageView *)v9 setBackgroundColor:v10];

        [(SUUIDonationResultView *)self addSubview:self->_imageView];
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
    uint64_t v5 = [(SUUIDonationResultView *)self setNeedsLayout];
  }
  MEMORY[0x270F9A790](v5);
}

- (void)setMessage:(id)a3
{
  id v15 = a3;
  id v4 = [(SUUIDonationResultView *)self message];
  if (v4 != v15 && ([v15 isEqualToString:v4] & 1) == 0)
  {
    messageLabel = self->_messageLabel;
    if (v15)
    {
      if (!messageLabel)
      {
        v6 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
        v7 = self->_messageLabel;
        self->_messageLabel = v6;

        v8 = self->_messageLabel;
        v9 = [(SUUIDonationResultView *)self backgroundColor];
        [(UILabel *)v8 setBackgroundColor:v9];

        v10 = self->_messageLabel;
        v11 = [MEMORY[0x263F81708] systemFontOfSize:14.0];
        [(UILabel *)v10 setFont:v11];

        [(UILabel *)self->_messageLabel setNumberOfLines:0];
        [(UILabel *)self->_messageLabel setTextAlignment:1];
        id v12 = self->_messageLabel;
        v13 = [MEMORY[0x263F825C8] secondaryLabelColor];
        [(UILabel *)v12 setTextColor:v13];

        [(SUUIDonationResultView *)self addSubview:self->_messageLabel];
        messageLabel = self->_messageLabel;
      }
      -[UILabel setText:](messageLabel, "setText:");
    }
    else
    {
      [(UILabel *)messageLabel removeFromSuperview];
      v14 = self->_messageLabel;
      self->_messageLabel = 0;
    }
    [(SUUIDonationResultView *)self setNeedsLayout];
  }
}

- (void)setTitle:(id)a3
{
  id v15 = a3;
  id v4 = [(SUUIDonationResultView *)self title];
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
        v9 = [(SUUIDonationResultView *)self backgroundColor];
        [(UILabel *)v8 setBackgroundColor:v9];

        v10 = self->_titleLabel;
        v11 = [MEMORY[0x263F81708] boldSystemFontOfSize:17.0];
        [(UILabel *)v10 setFont:v11];

        [(UILabel *)self->_titleLabel setNumberOfLines:0];
        [(UILabel *)self->_titleLabel setTextAlignment:1];
        id v12 = self->_titleLabel;
        v13 = [MEMORY[0x263F825C8] labelColor];
        [(UILabel *)v12 setTextColor:v13];

        [(SUUIDonationResultView *)self addSubview:self->_titleLabel];
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
    [(SUUIDonationResultView *)self setNeedsLayout];
  }
}

- (NSString)title
{
  return [(UILabel *)self->_titleLabel text];
}

- (void)layoutSubviews
{
  [(SUUIDonationResultView *)self bounds];
  double v4 = v3;
  double v36 = v5;
  double v6 = v3 + -60.0;
  [(UIImageView *)self->_imageView frame];
  double v8 = v7;
  double v10 = v9;
  float v11 = (v4 - v7) * 0.5;
  double v12 = floorf(v11);
  [(UILabel *)self->_titleLabel frame];
  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v6, 1.79769313e308);
  double v14 = v13;
  [(UILabel *)self->_messageLabel frame];
  -[UILabel sizeThatFits:](self->_messageLabel, "sizeThatFits:", v6, 1.79769313e308);
  double v16 = v15;
  v17 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v18 = [v17 userInterfaceIdiom];

  double v19 = 8.0;
  if ((v18 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    double v19 = 46.0;
  }
  double v20 = v14 + v10 + v19;
  v21 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v22 = [v21 userInterfaceIdiom];

  double v23 = 12.0;
  if ((v22 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    double v23 = 10.0;
  }
  float v24 = (v36 - (v16 + v20 + v23)) * 0.5;
  CGFloat v25 = floorf(v24);
  -[UIImageView setFrame:](self->_imageView, "setFrame:", v12, v25, v8, v10);
  v38.origin.x = v12;
  v38.origin.y = v25;
  v38.size.width = v8;
  v38.size.height = v10;
  double MaxY = CGRectGetMaxY(v38);
  v27 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v28 = [v27 userInterfaceIdiom];

  double v29 = 8.0;
  if ((v28 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    double v29 = 46.0;
  }
  CGFloat v30 = MaxY + v29;
  -[UILabel setFrame:](self->_titleLabel, "setFrame:", 30.0, v30, v6, v14);
  v39.origin.x = 30.0;
  v39.origin.y = v30;
  v39.size.width = v6;
  v39.size.height = v14;
  double v31 = CGRectGetMaxY(v39);
  v32 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v33 = [v32 userInterfaceIdiom];

  double v34 = 10.0;
  if ((v33 & 0xFFFFFFFFFFFFFFFBLL) != 1) {
    double v34 = 12.0;
  }
  messageLabel = self->_messageLabel;
  -[UILabel setFrame:](messageLabel, "setFrame:", 30.0, v31 + v34, v6, v16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_messageLabel, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end