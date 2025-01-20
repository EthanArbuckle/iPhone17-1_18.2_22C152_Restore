@interface SUUIMessageBanner
- (BOOL)showsClearButton;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSAttributedString)attributedMessage;
- (NSString)message;
- (SUUIMessageBanner)initWithFrame:(CGRect)a3;
- (SUUIMessageBannerDelegate)delegate;
- (id)value;
- (void)_buttonAction:(id)a3;
- (void)_clearButtonAction:(id)a3;
- (void)layoutSubviews;
- (void)setAttributedMessage:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setMessage:(id)a3;
- (void)setShowsClearButton:(BOOL)a3;
@end

@implementation SUUIMessageBanner

- (SUUIMessageBanner)initWithFrame:(CGRect)a3
{
  v14.receiver = self;
  v14.super_class = (Class)SUUIMessageBanner;
  v3 = -[SUUIMessageBanner initWithFrame:](&v14, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
    label = v3->_label;
    v3->_label = v4;

    [(UILabel *)v3->_label setNumberOfLines:0];
    [(SUUIMessageBanner *)v3 addSubview:v3->_label];
    uint64_t v6 = [MEMORY[0x263F824E8] buttonWithType:1];
    button = v3->_button;
    v3->_button = (UIButton *)v6;

    [(UIButton *)v3->_button addTarget:v3 action:sel__buttonAction_ forControlEvents:64];
    [(SUUIMessageBanner *)v3 addSubview:v3->_button];
    v8 = (UIView *)objc_alloc_init(MEMORY[0x263F82E00]);
    borderView = v3->_borderView;
    v3->_borderView = v8;

    v10 = v3->_borderView;
    v11 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.25];
    [(UIView *)v10 setBackgroundColor:v11];

    [(SUUIMessageBanner *)v3 addSubview:v3->_borderView];
    v12 = [MEMORY[0x263F825C8] whiteColor];
    [(SUUIMessageBanner *)v3 setBackgroundColor:v12];
  }
  return v3;
}

- (BOOL)showsClearButton
{
  return self->_clearButton != 0;
}

- (void)setShowsClearButton:(BOOL)a3
{
  if ([(SUUIMessageBanner *)self showsClearButton] != a3)
  {
    if (a3)
    {
      v5 = objc_alloc_init(SUUIMessageBannerCloseButton);
      clearButton = self->_clearButton;
      self->_clearButton = &v5->super;

      [(UIButton *)self->_clearButton addTarget:self action:sel__clearButtonAction_ forControlEvents:64];
      [(UIButton *)self->_clearButton setAdjustsImageWhenHighlighted:0];
      v7 = self->_clearButton;
      v8 = (void *)MEMORY[0x263F827E8];
      v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v10 = [v8 imageNamed:@"BannerCloseButton" inBundle:v9];
      [(UIButton *)v7 setImage:v10 forState:0];

      LODWORD(v11) = -1.0;
      [(UIButton *)self->_clearButton setCharge:v11];
      [(SUUIMessageBanner *)self addSubview:self->_clearButton];
      [(SUUIMessageBanner *)self setNeedsLayout];
    }
    else
    {
      [(UIButton *)self->_clearButton removeFromSuperview];
      v12 = self->_clearButton;
      self->_clearButton = 0;
    }
  }
}

- (void)setMessage:(id)a3
{
  v13[3] = *MEMORY[0x263EF8340];
  v4 = (objc_class *)MEMORY[0x263F81650];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  [v6 setAlignment:1];
  [v6 setLineBreakMode:4];
  v12[0] = *MEMORY[0x263F814F0];
  v7 = [MEMORY[0x263F81708] systemFontOfSize:14.0];
  v13[0] = v7;
  v12[1] = *MEMORY[0x263F81500];
  v8 = [MEMORY[0x263F825C8] blackColor];
  v12[2] = *MEMORY[0x263F81540];
  v13[1] = v8;
  v13[2] = v6;
  v9 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:3];

  label = self->_label;
  double v11 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:v5 attributes:v9];

  [(UILabel *)label setAttributedText:v11];
}

- (NSString)message
{
  return [(UILabel *)self->_label text];
}

- (void)setAttributedMessage:(id)a3
{
}

- (id)value
{
  return [(UILabel *)self->_label attributedText];
}

- (void)layoutSubviews
{
  v33.receiver = self;
  v33.super_class = (Class)SUUIMessageBanner;
  [(SUUIMessageBanner *)&v33 layoutSubviews];
  [(SUUIMessageBanner *)self bounds];
  double MaxX = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  -[UIButton setFrame:](self->_button, "setFrame:");
  borderView = self->_borderView;
  v34.origin.x = MaxX;
  v34.origin.y = v6;
  v34.size.width = v8;
  v34.size.height = v10;
  double MaxY = CGRectGetMaxY(v34);
  v13 = [MEMORY[0x263F82B60] mainScreen];
  [v13 scale];
  double v15 = MaxY - 1.0 / v14;
  v16 = [MEMORY[0x263F82B60] mainScreen];
  [v16 scale];
  -[UIView setFrame:](borderView, "setFrame:", v6, v15, v8, 1.0 / v17);

  clearButton = self->_clearButton;
  if (clearButton)
  {
    [(UIButton *)clearButton sizeToFit];
    [(SUUIMessageBanner *)self bringSubviewToFront:self->_clearButton];
    [(UIButton *)self->_clearButton frame];
    double v20 = v19;
    double v22 = v21;
    v23 = [MEMORY[0x263F82670] currentDevice];
    uint64_t v24 = [v23 userInterfaceIdiom];

    double v25 = 10.0;
    if ((v24 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
      double v25 = 20.0;
    }
    CGFloat v26 = MaxX + v25;
    float v27 = (v10 - v22) * 0.5;
    CGFloat v28 = floorf(v27);
    -[UIButton setFrame:](self->_clearButton, "setFrame:", v26, v28, v20, v22);
    v35.origin.x = v26;
    v35.origin.y = v28;
    v35.size.width = v20;
    v35.size.height = v22;
    double MaxX = CGRectGetMaxX(v35);
    [(SUUIMessageBanner *)self bounds];
    double v8 = CGRectGetMaxX(v36) - MaxX;
  }
  label = self->_label;
  v30 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v31 = [v30 userInterfaceIdiom];

  if ((v31 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    double v32 = 20.0;
  }
  else {
    double v32 = 10.0;
  }
  v37.origin.x = MaxX;
  v37.origin.y = v6;
  v37.size.width = v8;
  v37.size.height = v10;
  CGRect v38 = CGRectInset(v37, v32, 15.0);
  -[UILabel setFrame:](label, "setFrame:", v38.origin.x, v38.origin.y, v38.size.width, v38.size.height);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  label = self->_label;
  double v5 = objc_msgSend(MEMORY[0x263F82670], "currentDevice", a3.width, a3.height);
  uint64_t v6 = [v5 userInterfaceIdiom];

  double v7 = 40.0;
  if ((v6 & 0xFFFFFFFFFFFFFFFBLL) != 1) {
    double v7 = 20.0;
  }
  -[UILabel sizeThatFits:](label, "sizeThatFits:", width - v7, 1.79769313e308);
  double v9 = v8 + 30.0;
  double v10 = width;
  result.height = v9;
  result.double width = v10;
  return result;
}

- (void)_buttonAction:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained askPermissionBannerDidSelect:self];
}

- (void)_clearButtonAction:(id)a3
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)p_delegate);
    [v7 askPermissionBannerDidClear:self];
  }
}

- (SUUIMessageBannerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SUUIMessageBannerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSAttributedString)attributedMessage
{
  return self->_attributedMessage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributedMessage, 0);
  objc_storeStrong((id *)&self->_clearButton, 0);
  objc_storeStrong((id *)&self->_borderView, 0);
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end