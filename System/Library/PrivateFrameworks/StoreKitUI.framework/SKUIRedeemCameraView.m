@interface SKUIRedeemCameraView
- (BOOL)_isShowingRedeemer;
- (BOOL)textFieldShouldBeginEditing:(id)a3;
- (BOOL)textFieldShouldEndEditing:(id)a3;
- (BOOL)textFieldShouldReturn:(id)a3;
- (NSString)text;
- (SKUIITunesPassConfiguration)ITunesPassConfiguration;
- (SKUIRedeemCameraView)initWithClientContext:(id)a3;
- (SKUIRedeemCameraViewDelegate)delegate;
- (UIImage)image;
- (id)_newTextFieldWithClientContext:(id)a3 placeholderColor:(id)a4;
- (void)_hideKeyboard;
- (void)_iTunesPassLearnMoreAction:(id)a3;
- (void)_landingButtonAction:(id)a3;
- (void)_pauseRedeemer;
- (void)_resumeRedeemer;
- (void)_showRedeemer:(BOOL)a3;
- (void)_tapGestureAction:(id)a3;
- (void)_termsButtonAction:(id)a3;
- (void)dealloc;
- (void)keyboardDidShow:(id)a3;
- (void)keyboardWillHide:(id)a3;
- (void)keyboardWillShow:(id)a3;
- (void)layoutSubviews;
- (void)setDelegate:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setITunesPassConfiguration:(id)a3;
- (void)setImage:(id)a3;
- (void)setText:(id)a3;
- (void)showKeyboard;
- (void)textFieldTextDidChange:(id)a3;
@end

@implementation SKUIRedeemCameraView

- (SKUIRedeemCameraView)initWithClientContext:(id)a3
{
  id v5 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIRedeemCameraView initWithClientContext:]();
  }
  v34.receiver = self;
  v34.super_class = (Class)SKUIRedeemCameraView;
  v6 = [(SKUIRedeemCameraView *)&v34 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_clientContext, a3);
    v8 = [[SKUIRedeemCameraLandingView alloc] initWithClientContext:v5];
    landingView = v7->_landingView;
    v7->_landingView = v8;

    v10 = [(SKUIRedeemCameraLandingView *)v7->_landingView button];
    [v10 addTarget:v7 action:sel__landingButtonAction_ forControlEvents:64];

    [(SKUIRedeemCameraView *)v7 addSubview:v7->_landingView];
    v11 = [(SKUIRedeemCameraView *)v7 tintColor];
    uint64_t v12 = [(SKUIRedeemCameraView *)v7 _newTextFieldWithClientContext:v5 placeholderColor:v11];
    textField = v7->_textField;
    v7->_textField = (SKUIRedeemTextField *)v12;

    [(SKUIRedeemTextField *)v7->_textField setDelegate:v7];
    [(SKUIRedeemCameraView *)v7 addSubview:v7->_textField];
    v14 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.5];
    uint64_t v15 = [(SKUIRedeemCameraView *)v7 _newTextFieldWithClientContext:v5 placeholderColor:v14];
    inputAccessoryTextField = v7->_inputAccessoryTextField;
    v7->_inputAccessoryTextField = (SKUIRedeemTextField *)v15;

    [(SKUIRedeemTextField *)v7->_inputAccessoryTextField setDelegate:v7];
    [(SKUIRedeemTextField *)v7->_inputAccessoryTextField setEnablesReturnKeyAutomatically:1];
    [(SKUIRedeemTextField *)v7->_inputAccessoryTextField setBackdropBackground:1];
    [(SKUIRedeemTextField *)v7->_textField setInputAccessoryView:v7->_inputAccessoryTextField];
    id v17 = objc_alloc_init(MEMORY[0x1E4FB1D38]);
    [v17 addTarget:v7 action:sel__tapGestureAction_];
    v18 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    overlay = v7->_overlay;
    v7->_overlay = v18;

    v20 = v7->_overlay;
    v21 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:1.0];
    [(UIView *)v20 setBackgroundColor:v21];

    [(UIView *)v7->_overlay setAlpha:0.0];
    [(UIView *)v7->_overlay addGestureRecognizer:v17];
    v22 = [[SKUILinkButton alloc] initWithArrowStyle:0];
    termsButton = v7->_termsButton;
    v7->_termsButton = &v22->super;

    v24 = v7->_termsButton;
    if (v5) {
      [v5 localizedStringForKey:@"REDEEM_TERMS_LINK" inTable:@"Redeem"];
    }
    else {
    v25 = +[SKUIClientContext localizedStringForKey:@"REDEEM_TERMS_LINK" inBundles:0 inTable:@"Redeem"];
    }
    [(UIButton *)v24 setTitle:v25 forState:0];

    v26 = [(UIButton *)v7->_termsButton titleLabel];
    v27 = [MEMORY[0x1E4FB08E0] systemFontOfSize:12.0];
    [v26 setFont:v27];

    v28 = v7->_termsButton;
    v29 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.6];
    [(UIButton *)v28 setTitleColor:v29 forState:0];

    v30 = v7->_termsButton;
    v31 = [MEMORY[0x1E4FB1618] blackColor];
    [(UIButton *)v30 setTitleColor:v31 forState:1];

    [(UIButton *)v7->_termsButton addTarget:v7 action:sel__termsButtonAction_ forControlEvents:64];
    [(SKUIRedeemCameraView *)v7 addSubview:v7->_termsButton];
    v32 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v32 addObserver:v7 selector:sel_keyboardWillShow_ name:*MEMORY[0x1E4FB2C58] object:0];
    [v32 addObserver:v7 selector:sel_keyboardDidShow_ name:*MEMORY[0x1E4FB2BC8] object:0];
    [v32 addObserver:v7 selector:sel_keyboardWillHide_ name:*MEMORY[0x1E4FB2C50] object:0];
    [v32 addObserver:v7 selector:sel_keyboardDidHide_ name:*MEMORY[0x1E4FB2BC0] object:0];
    [v32 addObserver:v7 selector:sel_textFieldTextDidChange_ name:*MEMORY[0x1E4FB3018] object:v7->_inputAccessoryTextField];
  }
  return v7;
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
  [(SKUIRedeemTextField *)self->_inputAccessoryTextField setDelegate:0];
  [(SKUIRedeemITunesPassLockup *)self->_iTunesPassLockup removeTarget:self action:0 forControlEvents:0xFFFFFFFFLL];

  v4.receiver = self;
  v4.super_class = (Class)SKUIRedeemCameraView;
  [(SKUIRedeemCameraView *)&v4 dealloc];
}

- (UIImage)image
{
  return [(SKUIRedeemCameraLandingView *)self->_landingView image];
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  textField = self->_textField;
  if (a3)
  {
    v6 = [MEMORY[0x1E4FB1618] blackColor];
    [(SKUIRedeemTextField *)textField setTextColor:v6];

    inputAccessoryTextField = self->_inputAccessoryTextField;
    [MEMORY[0x1E4FB1618] blackColor];
  }
  else
  {
    v8 = [MEMORY[0x1E4FB1618] colorWithWhite:0.392156863 alpha:1.0];
    [(SKUIRedeemTextField *)textField setTextColor:v8];

    inputAccessoryTextField = self->_inputAccessoryTextField;
    [MEMORY[0x1E4FB1618] colorWithWhite:0.392156863 alpha:1.0];
  v9 = };
  [(SKUIRedeemTextField *)inputAccessoryTextField setTextColor:v9];

  [(SKUIRedeemTextField *)self->_textField setEnabled:v3];
  [(SKUIRedeemTextField *)self->_inputAccessoryTextField setEnabled:v3];

  [(SKUIRedeemCameraView *)self setUserInteractionEnabled:v3];
}

- (void)setImage:(id)a3
{
}

- (void)setITunesPassConfiguration:(id)a3
{
  p_iTunesPassConfiguration = &self->_iTunesPassConfiguration;
  v9 = (SKUIITunesPassConfiguration *)a3;
  if (*p_iTunesPassConfiguration != v9)
  {
    [(SKUIRedeemITunesPassLockup *)self->_iTunesPassLockup removeTarget:self action:0 forControlEvents:0xFFFFFFFFLL];
    [(SKUIRedeemITunesPassLockup *)self->_iTunesPassLockup removeFromSuperview];
    iTunesPassLockup = self->_iTunesPassLockup;
    self->_iTunesPassLockup = 0;

    objc_storeStrong((id *)&self->_iTunesPassConfiguration, a3);
    if (*p_iTunesPassConfiguration)
    {
      v7 = [[SKUIRedeemITunesPassLockup alloc] initWithITunesPassConfiguration:*p_iTunesPassConfiguration clientContext:self->_clientContext];
      v8 = self->_iTunesPassLockup;
      self->_iTunesPassLockup = v7;

      [(SKUIRedeemITunesPassLockup *)self->_iTunesPassLockup addTarget:self action:sel__iTunesPassLearnMoreAction_ forControlEvents:64];
      [(SKUIRedeemCameraView *)self addSubview:self->_iTunesPassLockup];
    }
  }
}

- (void)setText:(id)a3
{
  id v9 = a3;
  objc_super v4 = [(SKUIRedeemTextField *)self->_textField text];
  char v5 = [v4 isEqualToString:v9];

  if ((v5 & 1) == 0) {
    [(SKUIRedeemTextField *)self->_textField setText:v9];
  }
  v6 = [(SKUIRedeemTextField *)self->_inputAccessoryTextField text];
  char v7 = [v6 isEqualToString:v9];

  if ((v7 & 1) == 0) {
    [(SKUIRedeemTextField *)self->_inputAccessoryTextField setText:v9];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained SKUIRedeemCameraView:self textFieldDidChange:v9];
}

- (void)showKeyboard
{
}

- (NSString)text
{
  return (NSString *)[(SKUIRedeemTextField *)self->_inputAccessoryTextField text];
}

- (void)layoutSubviews
{
  [(SKUIRedeemCameraView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  -[UIView setFrame:](self->_overlay, "setFrame:");
  p_textField = (id *)&self->_textField;
  [(SKUIRedeemTextField *)self->_textField frame];
  double v13 = v12;
  double v15 = v14;
  if ([(SKUIRedeemCameraView *)self _isShowingRedeemer])
  {
    -[UIView setFrame:](self->_redeemerView, "setFrame:", v4, v6, v8, v10);
    double v16 = v10 - v15;
  }
  else
  {
    double v50 = v13;
    if (self->_iTunesPassLockup)
    {
      id v17 = [MEMORY[0x1E4FB1BA8] mainScreen];
      [v17 bounds];
      double v19 = v18;

      BOOL v20 = v19 <= 480.0;
      double v21 = 20.0;
      if (v19 <= 480.0) {
        double v21 = 10.0;
      }
      double v49 = v21;
      if (v19 > 480.0) {
        double v22 = 30.0;
      }
      else {
        double v22 = 17.0;
      }
      [(SKUIRedeemITunesPassLockup *)self->_iTunesPassLockup frame];
      -[SKUIRedeemITunesPassLockup sizeThatFits:](self->_iTunesPassLockup, "sizeThatFits:", v8 + -60.0, 1.79769313e308);
      double v45 = v23;
      double v46 = v24;
      double v25 = v15 + v22 + v24;
      double v44 = v22;
    }
    else
    {
      double v45 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
      double v46 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
      v26 = [MEMORY[0x1E4FB1BA8] mainScreen];
      [v26 bounds];
      BOOL v28 = v27 > 480.0;

      BOOL v20 = 0;
      double v49 = dbl_1C1CCC400[v28];
      double v44 = 0.0;
      double v22 = 30.0;
      double v25 = v15;
    }
    [(SKUIRedeemCameraLandingView *)self->_landingView frame];
    double v30 = v29;
    [(SKUIRedeemCameraLandingView *)self->_landingView setSpacingStyle:v20];
    -[SKUIRedeemCameraLandingView sizeThatFits:](self->_landingView, "sizeThatFits:", v8, v10);
    double v32 = v31;
    double v34 = v33;
    double v35 = v25 + v49 + v33;
    [(UIButton *)self->_termsButton frame];
    -[UIButton sizeThatFits:](self->_termsButton, "sizeThatFits:", v8, v10);
    double v47 = v37;
    double v48 = v36;
    double v51 = v22;
    *(float *)&double v36 = (v10 - (v35 + v22 + v37)) * 0.5;
    CGFloat v38 = floorf(*(float *)&v36);
    -[SKUIRedeemCameraLandingView setFrame:](self->_landingView, "setFrame:", v30, v38, v32, v34);
    v53.origin.x = v30;
    v53.origin.y = v38;
    v53.size.width = v32;
    v53.size.height = v34;
    double v39 = v49 + CGRectGetMaxY(v53);
    objc_msgSend(*p_textField, "setFrame:", v50, v39, v8, v15);
    v54.origin.x = v50;
    v54.origin.y = v39;
    v54.size.width = v8;
    v54.size.height = v15;
    double MaxY = CGRectGetMaxY(v54);
    if (self->_iTunesPassLockup)
    {
      v55.origin.x = v50;
      v55.origin.y = v39;
      v55.size.width = v8;
      v55.size.height = v15;
      CGFloat v41 = v44 + CGRectGetMaxY(v55);
      -[SKUIRedeemITunesPassLockup setFrame:](self->_iTunesPassLockup, "setFrame:", 30.0, v41, v45, v46);
      v56.origin.x = 30.0;
      v56.origin.y = v41;
      v56.size.width = v45;
      v56.size.height = v46;
      double MaxY = CGRectGetMaxY(v56);
    }
    double v15 = v47;
    float v42 = (v8 - v48) * 0.5;
    double v13 = roundf(v42);
    double v16 = v51 + MaxY;
    p_textField = (id *)&self->_termsButton;
    double v8 = v48;
  }
  id v43 = *p_textField;

  objc_msgSend(v43, "setFrame:", v13, v16, v8, v15);
}

- (void)keyboardWillShow:(id)a3
{
  if (self->_displayRedeem)
  {
    double v4 = [(SKUIRedeemTextField *)self->_textField text];
    [(SKUIRedeemCameraView *)self setText:v4];

    [(SKUIRedeemCameraView *)self _pauseRedeemer];
    [(SKUIRedeemCameraView *)self addSubview:self->_overlay];
    [(SKUIRedeemCameraView *)self setNeedsLayout];
    overlay = self->_overlay;
    double v6 = [MEMORY[0x1E4FB1618] blackColor];
    [(UIView *)overlay setBackgroundColor:v6];

    [(UIView *)self->_overlay setAlpha:0.0];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __41__SKUIRedeemCameraView_keyboardWillShow___block_invoke;
    v7[3] = &unk_1E6422020;
    v7[4] = self;
    [MEMORY[0x1E4FB1EB0] animateWithDuration:v7 animations:0.2];
  }
}

uint64_t __41__SKUIRedeemCameraView_keyboardWillShow___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v2 = (void *)v1[57];
  int v3 = [v1 _isShowingRedeemer];
  double v4 = 0.7;
  if (v3) {
    double v4 = 0.4;
  }

  return [v2 setAlpha:v4];
}

- (void)keyboardDidShow:(id)a3
{
  if (self->_displayRedeem) {
    [(SKUIRedeemTextField *)self->_inputAccessoryTextField becomeFirstResponder];
  }
}

- (void)keyboardWillHide:(id)a3
{
  if (!self->_displayRedeem)
  {
    double v4 = [(SKUIRedeemTextField *)self->_inputAccessoryTextField text];
    [(SKUIRedeemCameraView *)self setText:v4];

    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __41__SKUIRedeemCameraView_keyboardWillHide___block_invoke;
    v6[3] = &unk_1E6422020;
    v6[4] = self;
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __41__SKUIRedeemCameraView_keyboardWillHide___block_invoke_2;
    v5[3] = &unk_1E64223D0;
    v5[4] = self;
    [MEMORY[0x1E4FB1EB0] animateWithDuration:v6 animations:v5 completion:0.2];
  }
}

uint64_t __41__SKUIRedeemCameraView_keyboardWillHide___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 456) setAlpha:0.0];
}

uint64_t __41__SKUIRedeemCameraView_keyboardWillHide___block_invoke_2(uint64_t result, int a2)
{
  if (a2) {
    return [*(id *)(*(void *)(result + 32) + 456) removeFromSuperview];
  }
  return result;
}

- (void)textFieldTextDidChange:(id)a3
{
  id v4 = [(SKUIRedeemTextField *)self->_inputAccessoryTextField text];
  [(SKUIRedeemCameraView *)self setText:v4];
}

- (BOOL)textFieldShouldBeginEditing:(id)a3
{
  if (self->_textField == a3) {
    self->_displayRedeem = 1;
  }
  return 1;
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  p_delegate = &self->_delegate;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  double v7 = [v5 text];

  [WeakRetained SKUIRedeemCameraView:self textFieldDidRedeem:v7];
  return 1;
}

- (BOOL)textFieldShouldEndEditing:(id)a3
{
  if (self->_textField == a3) {
    self->_displayRedeem = 0;
  }
  return 1;
}

- (void)_iTunesPassLearnMoreAction:(id)a3
{
  id v4 = [(SKUIRedeemCameraView *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 showITunesPassLearnMoreForSKUIRedeemCameraView:self];
  }
}

- (void)_landingButtonAction:(id)a3
{
  [(SKUIRedeemCameraView *)self setText:&stru_1F1C879E8];

  [(SKUIRedeemCameraView *)self _showRedeemer:1];
}

- (void)_tapGestureAction:(id)a3
{
  if ([(SKUIRedeemCameraView *)self _isShowingRedeemer])
  {
    [(SKUIRedeemCameraView *)self setText:&stru_1F1C879E8];
    [(SKUIRedeemCameraView *)self _hideKeyboard];
    [(SKUIRedeemCameraView *)self _resumeRedeemer];
  }
  else
  {
    [(SKUIRedeemCameraView *)self _hideKeyboard];
  }
}

- (void)_termsButtonAction:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F1CB10], "termsAndConditionsURL", a3);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  SKUIMetricsOpenURL(v3);
}

- (void)_hideKeyboard
{
  [(SKUIRedeemTextField *)self->_inputAccessoryTextField resignFirstResponder];
  textField = self->_textField;

  [(SKUIRedeemTextField *)textField resignFirstResponder];
}

- (BOOL)_isShowingRedeemer
{
  return self->_landingView == 0;
}

- (id)_newTextFieldWithClientContext:(id)a3 placeholderColor:(id)a4
{
  v18[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  double v7 = -[SKUIRedeemTextField initWithFrame:]([SKUIRedeemTextField alloc], "initWithFrame:", 0.0, 0.0, 1.0, 44.0);
  [(SKUIRedeemTextField *)v7 setAutocorrectionType:1];
  [(SKUIRedeemTextField *)v7 setAutocapitalizationType:3];
  double v8 = [MEMORY[0x1E4FB08E0] systemFontOfSize:16.0];
  [(SKUIRedeemTextField *)v7 setFont:v8];
  uint64_t v9 = *MEMORY[0x1E4FB06F8];
  v18[0] = v8;
  uint64_t v10 = *MEMORY[0x1E4FB0700];
  v17[0] = v9;
  v17[1] = v10;
  v11 = v6;
  if (!v6)
  {
    v11 = [MEMORY[0x1E4FB1618] colorWithWhite:0.7 alpha:1.0];
  }
  v18[1] = v11;
  double v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];
  if (!v6) {

  }
  id v13 = objc_alloc(MEMORY[0x1E4F28B18]);
  if (v5) {
    [v5 localizedStringForKey:@"CAMERA_REDEEM_ENTER_CODE" inTable:@"Redeem"];
  }
  else {
  double v14 = +[SKUIClientContext localizedStringForKey:@"CAMERA_REDEEM_ENTER_CODE" inBundles:0 inTable:@"Redeem"];
  }
  double v15 = (void *)[v13 initWithString:v14 attributes:v12];

  [(SKUIRedeemTextField *)v7 setAttributedPlaceholder:v15];
  return v7;
}

- (void)_pauseRedeemer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained cancelRedeemerViewForSKUIRedeemCameraView:self];
}

- (void)_resumeRedeemer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained startRedeemerViewForSKUIRedeemCameraView:self];
}

- (void)_showRedeemer:(BOOL)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained presentFullScreenCameraViewForSKUIRedeemCameraView:self];
}

- (SKUIRedeemCameraViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SKUIRedeemCameraViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SKUIITunesPassConfiguration)ITunesPassConfiguration
{
  return self->_iTunesPassConfiguration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textField, 0);
  objc_storeStrong((id *)&self->_termsButton, 0);
  objc_storeStrong((id *)&self->_redeemerView, 0);
  objc_storeStrong((id *)&self->_overlay, 0);
  objc_storeStrong((id *)&self->_landingView, 0);
  objc_storeStrong((id *)&self->_iTunesPassLockup, 0);
  objc_storeStrong((id *)&self->_iTunesPassConfiguration, 0);
  objc_storeStrong((id *)&self->_inputAccessoryTextField, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_clientContext, 0);
}

- (void)initWithClientContext:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIRedeemCameraView initWithClientContext:]";
}

@end