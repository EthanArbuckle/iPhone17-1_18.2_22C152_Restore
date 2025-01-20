@interface SKUIMessageBanner
- (BOOL)showsClearButton;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSAttributedString)attributedMessage;
- (NSString)message;
- (SKUIMessageBanner)initWithFrame:(CGRect)a3;
- (SKUIMessageBannerDelegate)delegate;
- (id)value;
- (void)_buttonAction:(id)a3;
- (void)_clearButtonAction:(id)a3;
- (void)layoutSubviews;
- (void)setAttributedMessage:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setMessage:(id)a3;
- (void)setShowsClearButton:(BOOL)a3;
@end

@implementation SKUIMessageBanner

- (SKUIMessageBanner)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIMessageBanner initWithFrame:]();
  }
  v19.receiver = self;
  v19.super_class = (Class)SKUIMessageBanner;
  v8 = -[SKUIMessageBanner initWithFrame:](&v19, sel_initWithFrame_, x, y, width, height);
  if (v8)
  {
    v9 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    label = v8->_label;
    v8->_label = v9;

    [(UILabel *)v8->_label setNumberOfLines:0];
    [(SKUIMessageBanner *)v8 addSubview:v8->_label];
    uint64_t v11 = [MEMORY[0x1E4FB14D0] buttonWithType:1];
    button = v8->_button;
    v8->_button = (UIButton *)v11;

    [(UIButton *)v8->_button addTarget:v8 action:sel__buttonAction_ forControlEvents:64];
    [(SKUIMessageBanner *)v8 addSubview:v8->_button];
    v13 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    borderView = v8->_borderView;
    v8->_borderView = v13;

    v15 = v8->_borderView;
    v16 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.25];
    [(UIView *)v15 setBackgroundColor:v16];

    [(SKUIMessageBanner *)v8 addSubview:v8->_borderView];
    v17 = [MEMORY[0x1E4FB1618] whiteColor];
    [(SKUIMessageBanner *)v8 setBackgroundColor:v17];
  }
  return v8;
}

- (BOOL)showsClearButton
{
  return self->_clearButton != 0;
}

- (void)setShowsClearButton:(BOOL)a3
{
  if ([(SKUIMessageBanner *)self showsClearButton] != a3)
  {
    if (a3)
    {
      v5 = objc_alloc_init(SKUIMessageBannerCloseButton);
      clearButton = self->_clearButton;
      self->_clearButton = &v5->super;

      [(UIButton *)self->_clearButton addTarget:self action:sel__clearButtonAction_ forControlEvents:64];
      [(UIButton *)self->_clearButton setAdjustsImageWhenHighlighted:0];
      v7 = self->_clearButton;
      v8 = (void *)MEMORY[0x1E4FB1818];
      v9 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v10 = [v8 imageNamed:@"BannerCloseButton" inBundle:v9];
      [(UIButton *)v7 setImage:v10 forState:0];

      LODWORD(v11) = -1.0;
      [(UIButton *)self->_clearButton setCharge:v11];
      [(SKUIMessageBanner *)self addSubview:self->_clearButton];
      [(SKUIMessageBanner *)self setNeedsLayout];
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
  v13[3] = *MEMORY[0x1E4F143B8];
  v4 = (objc_class *)MEMORY[0x1E4FB0848];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  [v6 setAlignment:1];
  [v6 setLineBreakMode:4];
  v12[0] = *MEMORY[0x1E4FB06F8];
  v7 = [MEMORY[0x1E4FB08E0] systemFontOfSize:14.0];
  v13[0] = v7;
  v12[1] = *MEMORY[0x1E4FB0700];
  v8 = [MEMORY[0x1E4FB1618] blackColor];
  v12[2] = *MEMORY[0x1E4FB0738];
  v13[1] = v8;
  v13[2] = v6;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:3];

  label = self->_label;
  double v11 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v5 attributes:v9];

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
  v33.super_class = (Class)SKUIMessageBanner;
  [(SKUIMessageBanner *)&v33 layoutSubviews];
  [(SKUIMessageBanner *)self bounds];
  double MaxX = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  -[UIButton setFrame:](self->_button, "setFrame:");
  borderView = self->_borderView;
  v34.origin.double x = MaxX;
  v34.origin.double y = v6;
  v34.size.double width = v8;
  v34.size.double height = v10;
  double MaxY = CGRectGetMaxY(v34);
  v13 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v13 scale];
  double v15 = MaxY - 1.0 / v14;
  v16 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v16 scale];
  -[UIView setFrame:](borderView, "setFrame:", v6, v15, v8, 1.0 / v17);

  clearButton = self->_clearButton;
  if (clearButton)
  {
    [(UIButton *)clearButton sizeToFit];
    [(SKUIMessageBanner *)self bringSubviewToFront:self->_clearButton];
    [(UIButton *)self->_clearButton frame];
    double v20 = v19;
    double v22 = v21;
    v23 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v24 = [v23 userInterfaceIdiom];

    double v25 = 10.0;
    if ((v24 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
      double v25 = 20.0;
    }
    CGFloat v26 = MaxX + v25;
    float v27 = (v10 - v22) * 0.5;
    CGFloat v28 = floorf(v27);
    -[UIButton setFrame:](self->_clearButton, "setFrame:", v26, v28, v20, v22);
    v35.origin.double x = v26;
    v35.origin.double y = v28;
    v35.size.double width = v20;
    v35.size.double height = v22;
    double MaxX = CGRectGetMaxX(v35);
    [(SKUIMessageBanner *)self bounds];
    double v8 = CGRectGetMaxX(v36) - MaxX;
  }
  label = self->_label;
  v30 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v31 = [v30 userInterfaceIdiom];

  if ((v31 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    double v32 = 20.0;
  }
  else {
    double v32 = 10.0;
  }
  v37.origin.double x = MaxX;
  v37.origin.double y = v6;
  v37.size.double width = v8;
  v37.size.double height = v10;
  CGRect v38 = CGRectInset(v37, v32, 15.0);
  -[UILabel setFrame:](label, "setFrame:", v38.origin.x, v38.origin.y, v38.size.width, v38.size.height);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  label = self->_label;
  double v5 = objc_msgSend(MEMORY[0x1E4FB16C8], "currentDevice", a3.width, a3.height);
  uint64_t v6 = [v5 userInterfaceIdiom];

  double v7 = 40.0;
  if ((v6 & 0xFFFFFFFFFFFFFFFBLL) != 1) {
    double v7 = 20.0;
  }
  -[UILabel sizeThatFits:](label, "sizeThatFits:", width - v7, 1.79769313e308);
  double v9 = v8 + 30.0;
  double v10 = width;
  result.double height = v9;
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

- (SKUIMessageBannerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SKUIMessageBannerDelegate *)WeakRetained;
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

- (void)initWithFrame:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIMessageBanner initWithFrame:]";
}

@end