@interface SKUIFullscreenRedeemCameraView
- (BOOL)enabled;
- (BOOL)textFieldShouldReturn:(id)a3;
- (NSString)text;
- (SKUIFullscreenRedeemCameraView)initWithClientContext:(id)a3;
- (SKUIRedeemCameraViewDelegate)delegate;
- (UIImage)image;
- (id)_newTextFieldWithClientContext:(id)a3;
- (void)_hideKeyboard;
- (void)_pauseRedeemer;
- (void)_resumeRedeemer;
- (void)dealloc;
- (void)keyboardDidHide:(id)a3;
- (void)keyboardWillHide:(id)a3;
- (void)keyboardWillShow:(id)a3;
- (void)layoutSubviews;
- (void)setDelegate:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setText:(id)a3;
- (void)showKeyboard;
- (void)start;
- (void)textFieldDidBeginEditing:(id)a3;
- (void)textFieldDidEndEditing:(id)a3;
- (void)textFieldTextDidChange:(id)a3;
@end

@implementation SKUIFullscreenRedeemCameraView

- (SKUIFullscreenRedeemCameraView)initWithClientContext:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIFullscreenRedeemCameraView initWithClientContext:]();
  }
  v19.receiver = self;
  v19.super_class = (Class)SKUIFullscreenRedeemCameraView;
  v5 = [(SKUIFullscreenRedeemCameraView *)&v19 init];
  if (v5)
  {
    uint64_t v6 = [objc_alloc(MEMORY[0x1E4FB1FE0]) initWithPrivateStyle:10060];
    textFieldSafeAreaBackdrop = v5->_textFieldSafeAreaBackdrop;
    v5->_textFieldSafeAreaBackdrop = (_UIBackdropView *)v6;

    [(SKUIFullscreenRedeemCameraView *)v5 addSubview:v5->_textFieldSafeAreaBackdrop];
    uint64_t v8 = [(SKUIFullscreenRedeemCameraView *)v5 _newTextFieldWithClientContext:v4];
    textField = v5->_textField;
    v5->_textField = (SKUIRedeemTextField *)v8;

    [(SKUIRedeemTextField *)v5->_textField setDelegate:v5];
    v10 = v5->_textField;
    v11 = [MEMORY[0x1E4FB1618] clearColor];
    [(SKUIRedeemTextField *)v10 setBackgroundColor:v11];

    [(SKUIRedeemTextField *)v5->_textField setOpaque:0];
    [(SKUIFullscreenRedeemCameraView *)v5 addSubview:v5->_textField];
    id v12 = objc_alloc_init(MEMORY[0x1E4FB1D38]);
    [v12 addTarget:v5 action:sel__tapGestureAction_];
    v13 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    overlay = v5->_overlay;
    v5->_overlay = v13;

    v15 = v5->_overlay;
    v16 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:1.0];
    [(UIView *)v15 setBackgroundColor:v16];

    [(UIView *)v5->_overlay setAlpha:0.0];
    [(UIView *)v5->_overlay addGestureRecognizer:v12];
    v17 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v17 addObserver:v5 selector:sel_keyboardWillShow_ name:*MEMORY[0x1E4FB2C58] object:0];
    [v17 addObserver:v5 selector:sel_keyboardDidShow_ name:*MEMORY[0x1E4FB2BC8] object:0];
    [v17 addObserver:v5 selector:sel_keyboardWillHide_ name:*MEMORY[0x1E4FB2C50] object:0];
    [v17 addObserver:v5 selector:sel_keyboardDidHide_ name:*MEMORY[0x1E4FB2BC0] object:0];
    [v17 addObserver:v5 selector:sel_textFieldTextDidChange_ name:*MEMORY[0x1E4FB3018] object:v5->_textField];
    v5->_enabled = 1;
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
  v4.super_class = (Class)SKUIFullscreenRedeemCameraView;
  [(SKUIFullscreenRedeemCameraView *)&v4 dealloc];
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

- (UIImage)image
{
  return 0;
}

- (void)showKeyboard
{
}

- (void)setEnabled:(BOOL)a3
{
  if (self->_enabled != a3)
  {
    self->_BOOL enabled = a3;
    textField = self->_textField;
    if (a3) {
      [MEMORY[0x1E4FB1618] blackColor];
    }
    else {
    id v5 = [MEMORY[0x1E4FB1618] colorWithWhite:0.392156863 alpha:1.0];
    }
    [(SKUIRedeemTextField *)textField setTextColor:v5];

    [(SKUIRedeemTextField *)self->_textField setEnabled:self->_enabled];
    BOOL enabled = self->_enabled;
    [(SKUIFullscreenRedeemCameraView *)self setUserInteractionEnabled:enabled];
  }
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)start
{
  if (!self->_redeemerView)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_super v4 = [WeakRetained redeemerViewForSKUIRedeemCameraView:self];
    redeemerView = self->_redeemerView;
    self->_redeemerView = v4;

    uint64_t v6 = self->_redeemerView;
    [(SKUIFullscreenRedeemCameraView *)self insertSubview:v6 atIndex:0];
  }
}

- (void)layoutSubviews
{
  [(SKUIFullscreenRedeemCameraView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  -[UIView setFrame:](self->_overlay, "setFrame:");
  -[UIView setFrame:](self->_redeemerView, "setFrame:", v4, v6, v8, v10);
  [(SKUIFullscreenRedeemCameraView *)self safeAreaInsets];
  double v12 = v11;
  if ([(SKUIRedeemTextField *)self->_textField isFirstResponder]
    && (p_keyboardRect = &self->_keyboardRect, !CGRectEqualToRect(self->_keyboardRect, *MEMORY[0x1E4F1DB28])))
  {
    v21.origin.x = p_keyboardRect->origin.x;
    v21.origin.y = self->_keyboardRect.origin.y;
    v21.size.width = self->_keyboardRect.size.width;
    v21.size.height = self->_keyboardRect.size.height;
    -[SKUIRedeemTextField setFrame:](self->_textField, "setFrame:", 0.0, CGRectGetMinY(v21) + -44.0, v8, 44.0);
    textFieldSafeAreaBackdrop = self->_textFieldSafeAreaBackdrop;
    double v17 = CGRectGetMinY(*p_keyboardRect) + -44.0;
    v15 = textFieldSafeAreaBackdrop;
    double v18 = v8;
    double v16 = 44.0;
  }
  else
  {
    double v14 = v10 + -44.0 - v12;
    -[SKUIRedeemTextField setFrame:](self->_textField, "setFrame:", 0.0, v14, v8, 44.0);
    v15 = self->_textFieldSafeAreaBackdrop;
    double v16 = v12 + 44.0;
    double v17 = v14;
    double v18 = v8;
  }

  -[_UIBackdropView setFrame:](v15, "setFrame:", 0.0, v17, v18, v16);
}

- (void)keyboardWillShow:(id)a3
{
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v13 = 0;
  double v14 = 0.0;
  double v4 = [a3 userInfo];
  double v5 = [v4 objectForKey:*MEMORY[0x1E4FB2BD8]];
  [v5 getValue:&v15];

  double v6 = [v4 objectForKey:*MEMORY[0x1E4FB2BA0]];
  [v6 getValue:&v13];

  double v7 = [v4 objectForKey:*MEMORY[0x1E4FB2BA8]];
  [v7 getValue:&v14];

  -[SKUIFullscreenRedeemCameraView convertRect:fromView:](self, "convertRect:fromView:", 0, v15, v16);
  self->_keyboardRect.origin.x = v8;
  self->_keyboardRect.origin.y = v9;
  self->_keyboardRect.size.width = v10;
  self->_keyboardRect.size.height = v11;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __51__SKUIFullscreenRedeemCameraView_keyboardWillShow___block_invoke;
  v12[3] = &unk_1E6422020;
  v12[4] = self;
  [MEMORY[0x1E4FB1EB0] animateWithDuration:v13 delay:v12 options:0 animations:v14 completion:0.0];
}

uint64_t __51__SKUIFullscreenRedeemCameraView_keyboardWillShow___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  double v3 = *(void **)(v2 + 432);
  CGFloat v4 = CGRectGetMinY(*(CGRect *)(v2 + 448)) + -44.0;
  [*(id *)(a1 + 32) bounds];
  objc_msgSend(v3, "setFrame:", 0.0, v4);
  uint64_t v5 = *(void *)(a1 + 32);
  double v6 = *(void **)(v5 + 440);
  double v7 = CGRectGetMinY(*(CGRect *)(v5 + 448)) + -44.0;
  [*(id *)(a1 + 32) bounds];

  return objc_msgSend(v6, "setFrame:", 0.0, v7);
}

- (void)keyboardWillHide:(id)a3
{
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v13 = 0;
  double v14 = 0.0;
  CGFloat v4 = [a3 userInfo];
  uint64_t v5 = [v4 objectForKey:*MEMORY[0x1E4FB2BD8]];
  [v5 getValue:&v15];

  double v6 = [v4 objectForKey:*MEMORY[0x1E4FB2BA0]];
  [v6 getValue:&v13];

  double v7 = [v4 objectForKey:*MEMORY[0x1E4FB2BA8]];
  [v7 getValue:&v14];

  -[SKUIFullscreenRedeemCameraView convertRect:fromView:](self, "convertRect:fromView:", 0, v15, v16);
  self->_keyboardRect.origin.x = v8;
  self->_keyboardRect.origin.y = v9;
  self->_keyboardRect.size.width = v10;
  self->_keyboardRect.size.height = v11;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __51__SKUIFullscreenRedeemCameraView_keyboardWillHide___block_invoke;
  v12[3] = &unk_1E6422020;
  v12[4] = self;
  [MEMORY[0x1E4FB1EB0] animateWithDuration:v13 delay:v12 options:0 animations:v14 completion:0.0];
}

uint64_t __51__SKUIFullscreenRedeemCameraView_keyboardWillHide___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) safeAreaInsets];
  double v3 = v2;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(v4 + 432);
  CGFloat v6 = CGRectGetMinY(*(CGRect *)(v4 + 448)) + -44.0 - v2;
  [*(id *)(a1 + 32) bounds];
  objc_msgSend(v5, "setFrame:", 0.0, v6);
  uint64_t v7 = *(void *)(a1 + 32);
  CGFloat v8 = *(void **)(v7 + 440);
  double v9 = CGRectGetMinY(*(CGRect *)(v7 + 448)) + -44.0 - v3;
  [*(id *)(a1 + 32) bounds];

  return objc_msgSend(v8, "setFrame:", 0.0, v9);
}

- (void)keyboardDidHide:(id)a3
{
  CGSize v3 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
  self->_keyboardRect.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
  self->_keyboardRect.size = v3;
}

- (void)textFieldTextDidChange:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  uint64_t v4 = [(SKUIRedeemTextField *)self->_textField text];
  [WeakRetained SKUIRedeemCameraView:self textFieldDidChange:v4];
}

- (void)textFieldDidBeginEditing:(id)a3
{
  [(SKUIFullscreenRedeemCameraView *)self insertSubview:self->_overlay belowSubview:self->_textField];
  overlay = self->_overlay;
  [(SKUIFullscreenRedeemCameraView *)self bounds];
  -[UIView setFrame:](overlay, "setFrame:");
  uint64_t v5 = self->_overlay;
  CGFloat v6 = [MEMORY[0x1E4FB1618] blackColor];
  [(UIView *)v5 setBackgroundColor:v6];

  [(UIView *)self->_overlay setAlpha:0.0];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__SKUIFullscreenRedeemCameraView_textFieldDidBeginEditing___block_invoke;
  v7[3] = &unk_1E6422020;
  v7[4] = self;
  [MEMORY[0x1E4FB1EB0] animateWithDuration:v7 animations:0.2];
  [(SKUIFullscreenRedeemCameraView *)self _pauseRedeemer];
}

uint64_t __59__SKUIFullscreenRedeemCameraView_textFieldDidBeginEditing___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 416) setAlpha:0.4];
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  p_delegate = &self->_delegate;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  uint64_t v7 = [v5 text];

  [WeakRetained SKUIRedeemCameraView:self textFieldDidRedeem:v7];
  return 1;
}

- (void)textFieldDidEndEditing:(id)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __57__SKUIFullscreenRedeemCameraView_textFieldDidEndEditing___block_invoke;
  v5[3] = &unk_1E6422020;
  v5[4] = self;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __57__SKUIFullscreenRedeemCameraView_textFieldDidEndEditing___block_invoke_2;
  v4[3] = &unk_1E64223D0;
  v4[4] = self;
  [MEMORY[0x1E4FB1EB0] animateWithDuration:v5 animations:v4 completion:0.2];
  UIKeyboardOrderOutAutomatic();
  if ([(SKUIFullscreenRedeemCameraView *)self enabled])
  {
    [(SKUIFullscreenRedeemCameraView *)self _resumeRedeemer];
    [(SKUIFullscreenRedeemCameraView *)self setText:&stru_1F1C879E8];
  }
}

uint64_t __57__SKUIFullscreenRedeemCameraView_textFieldDidEndEditing___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 416) setAlpha:0.0];
}

uint64_t __57__SKUIFullscreenRedeemCameraView_textFieldDidEndEditing___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 416) removeFromSuperview];
}

- (void)_hideKeyboard
{
}

- (id)_newTextFieldWithClientContext:(id)a3
{
  id v4 = a3;
  id v5 = -[SKUIRedeemTextField initWithFrame:]([SKUIRedeemTextField alloc], "initWithFrame:", 0.0, 0.0, 1.0, 44.0);
  [(SKUIRedeemTextField *)v5 setSuppressBorder:1];
  [(SKUIRedeemTextField *)v5 setAutocorrectionType:1];
  [(SKUIRedeemTextField *)v5 setAutocapitalizationType:3];
  CGFloat v6 = [MEMORY[0x1E4FB08E0] systemFontOfSize:16.0];
  [(SKUIRedeemTextField *)v5 setFont:v6];
  if (v4) {
    [v4 localizedStringForKey:@"CAMERA_REDEEM_ENTER_CODE" inTable:@"Redeem"];
  }
  else {
  uint64_t v7 = +[SKUIClientContext localizedStringForKey:@"CAMERA_REDEEM_ENTER_CODE" inBundles:0 inTable:@"Redeem"];
  }
  id v8 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  uint64_t v9 = *MEMORY[0x1E4FB06F8];
  uint64_t v10 = [(SKUIFullscreenRedeemCameraView *)self tintColor];
  CGFloat v11 = (void *)v10;
  if (v10)
  {
    double v12 = objc_msgSend(v8, "initWithObjectsAndKeys:", v6, v9, v10, *MEMORY[0x1E4FB0700], 0);
  }
  else
  {
    uint64_t v13 = [MEMORY[0x1E4FB1618] colorWithWhite:0.7 alpha:1.0];
    double v12 = objc_msgSend(v8, "initWithObjectsAndKeys:", v6, v9, v13, *MEMORY[0x1E4FB0700], 0);
  }
  double v14 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v7 attributes:v12];
  [(SKUIRedeemTextField *)v5 setAttributedPlaceholder:v14];

  return v5;
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
  objc_storeStrong((id *)&self->_textFieldSafeAreaBackdrop, 0);
  objc_storeStrong((id *)&self->_textField, 0);
  objc_storeStrong((id *)&self->_redeemerView, 0);
  objc_storeStrong((id *)&self->_overlay, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)initWithClientContext:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIFullscreenRedeemCameraView initWithClientContext:]";
}

@end