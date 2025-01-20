@interface SUUIRedeemResultMessageView
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)message;
- (NSString)title;
- (void)layoutSubviews;
- (void)setBackgroundColor:(id)a3;
- (void)setMessage:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation SUUIRedeemResultMessageView

- (NSString)message
{
  return [(UILabel *)self->_messageLabel text];
}

- (void)setMessage:(id)a3
{
  id v15 = a3;
  id v4 = [(SUUIRedeemResultMessageView *)self message];
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
        v9 = [(SUUIRedeemResultMessageView *)self backgroundColor];
        [(UILabel *)v8 setBackgroundColor:v9];

        v10 = self->_messageLabel;
        v11 = [MEMORY[0x263F81708] systemFontOfSize:14.0];
        [(UILabel *)v10 setFont:v11];

        [(UILabel *)self->_messageLabel setNumberOfLines:0];
        [(UILabel *)self->_messageLabel setTextAlignment:1];
        v12 = self->_messageLabel;
        v13 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.6];
        [(UILabel *)v12 setTextColor:v13];

        [(SUUIRedeemResultMessageView *)self addSubview:self->_messageLabel];
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
    [(SUUIRedeemResultMessageView *)self setNeedsLayout];
  }
}

- (void)setTitle:(id)a3
{
  id v15 = a3;
  id v4 = [(SUUIRedeemResultMessageView *)self title];
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
        v9 = [(SUUIRedeemResultMessageView *)self backgroundColor];
        [(UILabel *)v8 setBackgroundColor:v9];

        v10 = self->_titleLabel;
        v11 = [MEMORY[0x263F81708] boldSystemFontOfSize:17.0];
        [(UILabel *)v10 setFont:v11];

        [(UILabel *)self->_titleLabel setNumberOfLines:3];
        [(UILabel *)self->_titleLabel setTextAlignment:1];
        v12 = self->_titleLabel;
        v13 = [MEMORY[0x263F825C8] blackColor];
        [(UILabel *)v12 setTextColor:v13];

        [(SUUIRedeemResultMessageView *)self addSubview:self->_titleLabel];
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
    [(SUUIRedeemResultMessageView *)self setNeedsLayout];
  }
}

- (NSString)title
{
  return [(UILabel *)self->_titleLabel text];
}

- (void)layoutSubviews
{
  [(SUUIRedeemResultMessageView *)self bounds];
  double v4 = v3;
  v5 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v6 = [v5 userInterfaceIdiom];

  double v7 = 60.0;
  double v8 = 30.0;
  if ((v6 & 0xFFFFFFFFFFFFFFFBLL) != 1) {
    double v7 = 30.0;
  }
  double v9 = v4 - v7;
  titleLabel = self->_titleLabel;
  if (titleLabel)
  {
    [(UILabel *)titleLabel frame];
    v11 = [MEMORY[0x263F82670] currentDevice];
    uint64_t v12 = [v11 userInterfaceIdiom];

    if ((v12 & 0xFFFFFFFFFFFFFFFBLL) != 1) {
      double v8 = 15.0;
    }
    -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v9, 1.79769313e308);
    CGFloat v14 = v13;
    -[UILabel setFrame:](self->_titleLabel, "setFrame:", v8, 0.0, v9, v13);
    v23.origin.y = 0.0;
    v23.origin.x = v8;
    v23.size.width = v9;
    v23.size.height = v14;
    double v15 = CGRectGetMaxY(v23) + 13.0;
  }
  else
  {
    double v15 = 0.0;
  }
  messageLabel = self->_messageLabel;
  if (messageLabel)
  {
    [(UILabel *)messageLabel frame];
    v17 = [MEMORY[0x263F82670] currentDevice];
    uint64_t v18 = [v17 userInterfaceIdiom];

    if ((v18 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
      double v19 = 30.0;
    }
    else {
      double v19 = 15.0;
    }
    -[UILabel sizeThatFits:](self->_messageLabel, "sizeThatFits:", v9, 1.79769313e308);
    v21 = self->_messageLabel;
    -[UILabel setFrame:](v21, "setFrame:", v19, v15, v9, v20);
  }
}

- (void)setBackgroundColor:(id)a3
{
  messageLabel = self->_messageLabel;
  id v5 = a3;
  [(UILabel *)messageLabel setBackgroundColor:v5];
  [(UILabel *)self->_titleLabel setBackgroundColor:v5];
  v6.receiver = self;
  v6.super_class = (Class)SUUIRedeemResultMessageView;
  [(SUUIRedeemResultMessageView *)&v6 setBackgroundColor:v5];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  id v5 = objc_msgSend(MEMORY[0x263F82670], "currentDevice", a3.width, a3.height);
  uint64_t v6 = [v5 userInterfaceIdiom];

  double v7 = 60.0;
  if ((v6 & 0xFFFFFFFFFFFFFFFBLL) != 1) {
    double v7 = 30.0;
  }
  double v8 = width - v7;
  titleLabel = self->_titleLabel;
  if (titleLabel)
  {
    -[UILabel sizeThatFits:](titleLabel, "sizeThatFits:", width - v7, 1.79769313e308);
    double v11 = v10 + 0.0;
  }
  else
  {
    double v11 = 0.0;
  }
  messageLabel = self->_messageLabel;
  if (messageLabel)
  {
    -[UILabel sizeThatFits:](messageLabel, "sizeThatFits:", v8, 1.79769313e308);
    double v11 = v11 + v13;
  }
  if (self->_titleLabel && self->_messageLabel) {
    double v11 = v11 + 13.0;
  }
  double v14 = width;
  double v15 = v11;
  result.height = v15;
  result.double width = v14;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_messageLabel, 0);
}

@end