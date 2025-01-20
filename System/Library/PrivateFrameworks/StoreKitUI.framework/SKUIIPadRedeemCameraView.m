@interface SKUIIPadRedeemCameraView
- (BOOL)textFieldShouldReturn:(id)a3;
- (NSString)text;
- (SKUIIPadRedeemCameraView)initWithClientContext:(id)a3;
- (SKUIRedeemCameraViewDelegate)delegate;
- (UIImage)image;
- (double)_adjustVerticalSpacingForHeight:(double)a3;
- (id)_newTextFieldWithClientContext:(id)a3 placeholderColor:(id)a4;
- (void)_hideKeyboard;
- (void)_landingButtonAction:(id)a3;
- (void)_termsButtonAction:(id)a3;
- (void)dealloc;
- (void)keyboardDidChange:(id)a3;
- (void)layoutSubviews;
- (void)setDelegate:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setImage:(id)a3;
- (void)setText:(id)a3;
- (void)showKeyboard;
- (void)textFieldTextDidChange:(id)a3;
@end

@implementation SKUIIPadRedeemCameraView

- (SKUIIPadRedeemCameraView)initWithClientContext:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIIPadRedeemCameraView initWithClientContext:]();
  }
  v26.receiver = self;
  v26.super_class = (Class)SKUIIPadRedeemCameraView;
  v5 = [(SKUIIPadRedeemCameraView *)&v26 init];
  if (v5)
  {
    v6 = (UIScrollView *)objc_alloc_init(MEMORY[0x1E4FB1BE0]);
    scrollView = v5->_scrollView;
    v5->_scrollView = v6;

    [(SKUIIPadRedeemCameraView *)v5 addSubview:v5->_scrollView];
    v8 = [[SKUIRedeemCameraLandingView alloc] initWithClientContext:v4];
    landingView = v5->_landingView;
    v5->_landingView = v8;

    v10 = [(SKUIRedeemCameraLandingView *)v5->_landingView button];
    [v10 addTarget:v5 action:sel__landingButtonAction_ forControlEvents:64];

    [(UIScrollView *)v5->_scrollView addSubview:v5->_landingView];
    v11 = [(SKUIIPadRedeemCameraView *)v5 tintColor];
    uint64_t v12 = [(SKUIIPadRedeemCameraView *)v5 _newTextFieldWithClientContext:v4 placeholderColor:v11];
    textField = v5->_textField;
    v5->_textField = (SKUIRedeemTextField *)v12;

    [(SKUIRedeemTextField *)v5->_textField setDelegate:v5];
    [(UIScrollView *)v5->_scrollView addSubview:v5->_textField];
    v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v14 addObserver:v5 selector:sel_keyboardDidChange_ name:*MEMORY[0x1E4FB2C58] object:0];
    [v14 addObserver:v5 selector:sel_keyboardDidChange_ name:*MEMORY[0x1E4FB2C50] object:0];
    [v14 addObserver:v5 selector:sel_textFieldTextDidChange_ name:*MEMORY[0x1E4FB3018] object:v5->_textField];
    v15 = [[SKUILinkButton alloc] initWithArrowStyle:0];
    termsButton = v5->_termsButton;
    v5->_termsButton = &v15->super;

    v17 = v5->_termsButton;
    if (v4) {
      [v4 localizedStringForKey:@"REDEEM_TERMS_LINK" inTable:@"Redeem"];
    }
    else {
    v18 = +[SKUIClientContext localizedStringForKey:@"REDEEM_TERMS_LINK" inBundles:0 inTable:@"Redeem"];
    }
    [(UIButton *)v17 setTitle:v18 forState:0];

    v19 = [(UIButton *)v5->_termsButton titleLabel];
    v20 = [MEMORY[0x1E4FB08E0] systemFontOfSize:12.0];
    [v19 setFont:v20];

    v21 = v5->_termsButton;
    v22 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.6];
    [(UIButton *)v21 setTitleColor:v22 forState:0];

    v23 = v5->_termsButton;
    v24 = [MEMORY[0x1E4FB1618] blackColor];
    [(UIButton *)v23 setTitleColor:v24 forState:1];

    [(UIButton *)v5->_termsButton addTarget:v5 action:sel__termsButtonAction_ forControlEvents:64];
    [(UIScrollView *)v5->_scrollView addSubview:v5->_termsButton];
  }
  return v5;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4FB2C58] object:0];
  [v3 removeObserver:self name:*MEMORY[0x1E4FB2BC8] object:0];
  [v3 removeObserver:self name:*MEMORY[0x1E4FB2C50] object:0];
  [v3 removeObserver:self name:*MEMORY[0x1E4FB2BC0] object:0];
  [v3 removeObserver:self name:*MEMORY[0x1E4FB3018] object:0];
  [(SKUIRedeemTextField *)self->_textField setDelegate:0];

  v4.receiver = self;
  v4.super_class = (Class)SKUIIPadRedeemCameraView;
  [(SKUIIPadRedeemCameraView *)&v4 dealloc];
}

- (void)setText:(id)a3
{
  textField = self->_textField;
  id v5 = a3;
  [(SKUIRedeemTextField *)textField setText:v5];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained SKUIRedeemCameraView:self textFieldDidChange:v5];
}

- (NSString)text
{
  return (NSString *)[(SKUIRedeemTextField *)self->_textField text];
}

- (void)setImage:(id)a3
{
}

- (UIImage)image
{
  return [(SKUIRedeemCameraLandingView *)self->_landingView image];
}

- (void)showKeyboard
{
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  textField = self->_textField;
  if (a3) {
    [MEMORY[0x1E4FB1618] blackColor];
  }
  else {
  v6 = [MEMORY[0x1E4FB1618] colorWithWhite:0.392156863 alpha:1.0];
  }
  [(SKUIRedeemTextField *)textField setTextColor:v6];

  [(SKUIRedeemTextField *)self->_textField setEnabled:v3];

  [(SKUIIPadRedeemCameraView *)self setUserInteractionEnabled:v3];
}

- (void)layoutSubviews
{
  [(SKUIIPadRedeemCameraView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v12 = [v11 userInterfaceIdiom];

  if ((v12 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    double v13 = 44.0;
  }
  else {
    double v13 = 94.0;
  }
  scrollView = self->_scrollView;
  if (scrollView)
  {
    -[UIScrollView setContentSize:](scrollView, "setContentSize:", v8, v10);
    -[UIScrollView setFrame:](self->_scrollView, "setFrame:", v4, v6, v8, v10);
  }
  landingView = self->_landingView;
  if (landingView)
  {
    [(SKUIRedeemCameraLandingView *)landingView frame];
    -[SKUIRedeemCameraLandingView sizeThatFits:](self->_landingView, "sizeThatFits:", v8, v10);
    CGFloat v17 = v16;
    CGFloat v19 = v18;
    -[SKUIRedeemCameraLandingView setFrame:](self->_landingView, "setFrame:", 0.0, v13, v16, v18);
    v31.origin.x = 0.0;
    v31.origin.y = v13;
    v31.size.width = v17;
    v31.size.height = v19;
    double v13 = CGRectGetMaxY(v31) + 49.0;
  }
  textField = self->_textField;
  if (textField)
  {
    -[SKUIRedeemTextField setFrame:](textField, "setFrame:", 0.0, v13, v8, 44.0);
    v32.origin.x = 0.0;
    v32.origin.y = v13;
    v32.size.width = v8;
    v32.size.height = 44.0;
    double v13 = CGRectGetMaxY(v32) + 36.0;
  }
  termsButton = self->_termsButton;
  if (termsButton)
  {
    [(UIButton *)termsButton sizeToFit];
    [(UIButton *)self->_termsButton frame];
    double v23 = v22;
    double v25 = v24;
    float v26 = (v8 - v22) * 0.5;
    double v27 = roundf(v26);
    [(SKUIIPadRedeemCameraView *)self _adjustVerticalSpacingForHeight:v13];
    v29 = self->_termsButton;
    -[UIButton setFrame:](v29, "setFrame:", v27, v28, v23, v25);
  }
}

- (void)keyboardDidChange:(id)a3
{
  double v4 = [a3 userInfo];
  id v15 = [v4 objectForKey:*MEMORY[0x1E4FB2BD8]];

  if (v15)
  {
    double v5 = [(UIScrollView *)self->_scrollView superview];
    [v15 CGRectValue];
    objc_msgSend(v5, "convertRect:fromView:", 0);
    CGFloat v7 = v6;
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    CGFloat v13 = v12;

    [(UIScrollView *)self->_scrollView frame];
    v19.origin.x = v7;
    v19.origin.y = v9;
    v19.size.width = v11;
    v19.size.double height = v13;
    CGRect v18 = CGRectIntersection(v17, v19);
    double height = v18.size.height;
    [(UIScrollView *)self->_scrollView contentInset];
    -[UIScrollView setContentInset:](self->_scrollView, "setContentInset:");
    [(UIScrollView *)self->_scrollView scrollIndicatorInsets];
    -[UIScrollView setScrollIndicatorInsets:](self->_scrollView, "setScrollIndicatorInsets:");
    -[UIScrollView setContentOffset:animated:](self->_scrollView, "setContentOffset:animated:", 1, 0.0, height);
  }
}

- (void)textFieldTextDidChange:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  double v4 = [(SKUIRedeemTextField *)self->_textField text];
  [WeakRetained SKUIRedeemCameraView:self textFieldDidChange:v4];
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  p_delegate = &self->_delegate;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  CGFloat v7 = [v5 text];

  [WeakRetained SKUIRedeemCameraView:self textFieldDidRedeem:v7];
  return 1;
}

- (void)_landingButtonAction:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained presentFullScreenCameraViewForSKUIRedeemCameraView:self];
}

- (void)_termsButtonAction:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F1CB10], "termsAndConditionsURL", a3);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  SKUIMetricsOpenURL(v3);
}

- (double)_adjustVerticalSpacingForHeight:(double)a3
{
  double v4 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v5 = [v4 userInterfaceIdiom];

  if (v5 == 1)
  {
    double v6 = [MEMORY[0x1E4FB1F48] keyWindow];
    [v6 bounds];
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    CGFloat v14 = v13;

    v20.origin.x = v8;
    v20.origin.y = v10;
    v20.size.width = v12;
    v20.size.double height = v14;
    double Width = CGRectGetWidth(v20);
    v21.origin.x = v8;
    v21.origin.y = v10;
    v21.size.width = v12;
    v21.size.double height = v14;
    double Height = CGRectGetHeight(v21);
    if (Width >= 1024.0 && Height >= 1024.0)
    {
      if (Height <= Width) {
        double v18 = 320.0;
      }
      else {
        double v18 = 461.0;
      }
      return a3 + v18;
    }
  }
  return a3;
}

- (void)_hideKeyboard
{
}

- (id)_newTextFieldWithClientContext:(id)a3 placeholderColor:(id)a4
{
  v18[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  double v7 = -[SKUIRedeemTextField initWithFrame:]([SKUIRedeemTextField alloc], "initWithFrame:", 0.0, 0.0, 1.0, 44.0);
  [(SKUIRedeemTextField *)v7 setAutocorrectionType:1];
  [(SKUIRedeemTextField *)v7 setAutocapitalizationType:3];
  CGFloat v8 = [MEMORY[0x1E4FB08E0] systemFontOfSize:16.0];
  [(SKUIRedeemTextField *)v7 setFont:v8];
  uint64_t v9 = *MEMORY[0x1E4FB06F8];
  v18[0] = v8;
  uint64_t v10 = *MEMORY[0x1E4FB0700];
  v17[0] = v9;
  v17[1] = v10;
  double v11 = v6;
  if (!v6)
  {
    double v11 = [MEMORY[0x1E4FB1618] colorWithWhite:0.7 alpha:1.0];
  }
  v18[1] = v11;
  CGFloat v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];
  if (!v6) {

  }
  id v13 = objc_alloc(MEMORY[0x1E4F28B18]);
  if (v5) {
    [v5 localizedStringForKey:@"CAMERA_REDEEM_ENTER_CODE" inTable:@"Redeem"];
  }
  else {
  CGFloat v14 = +[SKUIClientContext localizedStringForKey:@"CAMERA_REDEEM_ENTER_CODE" inBundles:0 inTable:@"Redeem"];
  }
  id v15 = (void *)[v13 initWithString:v14 attributes:v12];

  [(SKUIRedeemTextField *)v7 setAttributedPlaceholder:v15];
  return v7;
}

- (SKUIRedeemCameraViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SKUIRedeemCameraViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textField, 0);
  objc_storeStrong((id *)&self->_termsButton, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_redeemerView, 0);
  objc_storeStrong((id *)&self->_landingView, 0);
  objc_storeStrong((id *)&self->_inputAccessoryTextField, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)initWithClientContext:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIIPadRedeemCameraView initWithClientContext:]";
}

@end