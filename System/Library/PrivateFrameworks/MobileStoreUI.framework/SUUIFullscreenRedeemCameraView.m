@interface SUUIFullscreenRedeemCameraView
- (BOOL)enabled;
- (BOOL)textFieldShouldReturn:(id)a3;
- (NSString)text;
- (SUUIFullscreenRedeemCameraView)initWithClientContext:(id)a3;
- (SUUIRedeemCameraViewDelegate)delegate;
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

@implementation SUUIFullscreenRedeemCameraView

- (SUUIFullscreenRedeemCameraView)initWithClientContext:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)SUUIFullscreenRedeemCameraView;
  v5 = [(SUUIFullscreenRedeemCameraView *)&v19 init];
  if (v5)
  {
    uint64_t v6 = [objc_alloc(MEMORY[0x263F82EB8]) initWithPrivateStyle:10060];
    textFieldSafeAreaBackdrop = v5->_textFieldSafeAreaBackdrop;
    v5->_textFieldSafeAreaBackdrop = (_UIBackdropView *)v6;

    [(SUUIFullscreenRedeemCameraView *)v5 addSubview:v5->_textFieldSafeAreaBackdrop];
    uint64_t v8 = [(SUUIFullscreenRedeemCameraView *)v5 _newTextFieldWithClientContext:v4];
    textField = v5->_textField;
    v5->_textField = (SUUIRedeemTextField *)v8;

    [(SUUIRedeemTextField *)v5->_textField setDelegate:v5];
    v10 = v5->_textField;
    v11 = [MEMORY[0x263F825C8] clearColor];
    [(SUUIRedeemTextField *)v10 setBackgroundColor:v11];

    [(SUUIRedeemTextField *)v5->_textField setOpaque:0];
    [(SUUIFullscreenRedeemCameraView *)v5 addSubview:v5->_textField];
    id v12 = objc_alloc_init(MEMORY[0x263F82CB0]);
    [v12 addTarget:v5 action:sel__tapGestureAction_];
    v13 = (UIView *)objc_alloc_init(MEMORY[0x263F82E00]);
    overlay = v5->_overlay;
    v5->_overlay = v13;

    v15 = v5->_overlay;
    v16 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:1.0];
    [(UIView *)v15 setBackgroundColor:v16];

    [(UIView *)v5->_overlay setAlpha:0.0];
    [(UIView *)v5->_overlay addGestureRecognizer:v12];
    v17 = [MEMORY[0x263F08A00] defaultCenter];
    [v17 addObserver:v5 selector:sel_keyboardWillShow_ name:*MEMORY[0x263F83808] object:0];
    [v17 addObserver:v5 selector:sel_keyboardDidShow_ name:*MEMORY[0x263F837A8] object:0];
    [v17 addObserver:v5 selector:sel_keyboardWillHide_ name:*MEMORY[0x263F83800] object:0];
    [v17 addObserver:v5 selector:sel_keyboardDidHide_ name:*MEMORY[0x263F837A0] object:0];
    [v17 addObserver:v5 selector:sel_textFieldTextDidChange_ name:*MEMORY[0x263F83AC8] object:v5->_textField];
    v5->_enabled = 1;
  }
  return v5;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x263F83808] object:0];
  [v3 removeObserver:self name:*MEMORY[0x263F837A8] object:0];
  [v3 removeObserver:self name:*MEMORY[0x263F83800] object:0];
  [v3 removeObserver:self name:*MEMORY[0x263F837A0] object:0];
  [v3 removeObserver:self name:*MEMORY[0x263F83AC8] object:0];
  [(SUUIRedeemTextField *)self->_textField setDelegate:0];

  v4.receiver = self;
  v4.super_class = (Class)SUUIFullscreenRedeemCameraView;
  [(SUUIFullscreenRedeemCameraView *)&v4 dealloc];
}

- (void)setText:(id)a3
{
  textField = self->_textField;
  id v5 = a3;
  [(SUUIRedeemTextField *)textField setText:v5];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained SUUIRedeemCameraView:self textFieldDidChange:v5];
}

- (NSString)text
{
  return (NSString *)[(SUUIRedeemTextField *)self->_textField text];
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
      [MEMORY[0x263F825C8] blackColor];
    }
    else {
    id v5 = [MEMORY[0x263F825C8] colorWithWhite:0.392156863 alpha:1.0];
    }
    [(SUUIRedeemTextField *)textField setTextColor:v5];

    [(SUUIRedeemTextField *)self->_textField setEnabled:self->_enabled];
    BOOL enabled = self->_enabled;
    [(SUUIFullscreenRedeemCameraView *)self setUserInteractionEnabled:enabled];
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
    objc_super v4 = [WeakRetained redeemerViewForSUUIRedeemCameraView:self];
    redeemerView = self->_redeemerView;
    self->_redeemerView = v4;

    uint64_t v6 = self->_redeemerView;
    [(SUUIFullscreenRedeemCameraView *)self insertSubview:v6 atIndex:0];
  }
}

- (void)layoutSubviews
{
  [(SUUIFullscreenRedeemCameraView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  -[UIView setFrame:](self->_overlay, "setFrame:");
  -[UIView setFrame:](self->_redeemerView, "setFrame:", v4, v6, v8, v10);
  [(SUUIFullscreenRedeemCameraView *)self safeAreaInsets];
  double v12 = v11;
  if ([(SUUIRedeemTextField *)self->_textField isFirstResponder]
    && (p_keyboardRect = &self->_keyboardRect, !CGRectEqualToRect(self->_keyboardRect, *MEMORY[0x263F001A8])))
  {
    v21.origin.x = p_keyboardRect->origin.x;
    v21.origin.y = self->_keyboardRect.origin.y;
    v21.size.width = self->_keyboardRect.size.width;
    v21.size.height = self->_keyboardRect.size.height;
    -[SUUIRedeemTextField setFrame:](self->_textField, "setFrame:", 0.0, CGRectGetMinY(v21) + -44.0, v8, 44.0);
    textFieldSafeAreaBackdrop = self->_textFieldSafeAreaBackdrop;
    double v17 = CGRectGetMinY(*p_keyboardRect) + -44.0;
    v15 = textFieldSafeAreaBackdrop;
    double v18 = v8;
    double v16 = 44.0;
  }
  else
  {
    double v14 = v10 + -44.0 - v12;
    -[SUUIRedeemTextField setFrame:](self->_textField, "setFrame:", 0.0, v14, v8, 44.0);
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
  double v5 = [v4 objectForKey:*MEMORY[0x263F837B8]];
  [v5 getValue:&v15];

  double v6 = [v4 objectForKey:*MEMORY[0x263F83778]];
  [v6 getValue:&v13];

  double v7 = [v4 objectForKey:*MEMORY[0x263F83780]];
  [v7 getValue:&v14];

  -[SUUIFullscreenRedeemCameraView convertRect:fromView:](self, "convertRect:fromView:", 0, v15, v16);
  self->_keyboardRect.origin.x = v8;
  self->_keyboardRect.origin.y = v9;
  self->_keyboardRect.size.width = v10;
  self->_keyboardRect.size.height = v11;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __51__SUUIFullscreenRedeemCameraView_keyboardWillShow___block_invoke;
  v12[3] = &unk_265400980;
  v12[4] = self;
  [MEMORY[0x263F82E00] animateWithDuration:v13 delay:v12 options:0 animations:v14 completion:0.0];
}

uint64_t __51__SUUIFullscreenRedeemCameraView_keyboardWillShow___block_invoke(uint64_t a1)
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
  uint64_t v5 = [v4 objectForKey:*MEMORY[0x263F837B8]];
  [v5 getValue:&v15];

  double v6 = [v4 objectForKey:*MEMORY[0x263F83778]];
  [v6 getValue:&v13];

  double v7 = [v4 objectForKey:*MEMORY[0x263F83780]];
  [v7 getValue:&v14];

  -[SUUIFullscreenRedeemCameraView convertRect:fromView:](self, "convertRect:fromView:", 0, v15, v16);
  self->_keyboardRect.origin.x = v8;
  self->_keyboardRect.origin.y = v9;
  self->_keyboardRect.size.width = v10;
  self->_keyboardRect.size.height = v11;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __51__SUUIFullscreenRedeemCameraView_keyboardWillHide___block_invoke;
  v12[3] = &unk_265400980;
  v12[4] = self;
  [MEMORY[0x263F82E00] animateWithDuration:v13 delay:v12 options:0 animations:v14 completion:0.0];
}

uint64_t __51__SUUIFullscreenRedeemCameraView_keyboardWillHide___block_invoke(uint64_t a1)
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
  CGSize v3 = *(CGSize *)(MEMORY[0x263F001A8] + 16);
  self->_keyboardRect.origin = (CGPoint)*MEMORY[0x263F001A8];
  self->_keyboardRect.size = v3;
}

- (void)textFieldTextDidChange:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  uint64_t v4 = [(SUUIRedeemTextField *)self->_textField text];
  [WeakRetained SUUIRedeemCameraView:self textFieldDidChange:v4];
}

- (void)textFieldDidBeginEditing:(id)a3
{
  [(SUUIFullscreenRedeemCameraView *)self insertSubview:self->_overlay belowSubview:self->_textField];
  overlay = self->_overlay;
  [(SUUIFullscreenRedeemCameraView *)self bounds];
  -[UIView setFrame:](overlay, "setFrame:");
  uint64_t v5 = self->_overlay;
  CGFloat v6 = [MEMORY[0x263F825C8] blackColor];
  [(UIView *)v5 setBackgroundColor:v6];

  [(UIView *)self->_overlay setAlpha:0.0];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __59__SUUIFullscreenRedeemCameraView_textFieldDidBeginEditing___block_invoke;
  v7[3] = &unk_265400980;
  v7[4] = self;
  [MEMORY[0x263F82E00] animateWithDuration:v7 animations:0.2];
  [(SUUIFullscreenRedeemCameraView *)self _pauseRedeemer];
}

uint64_t __59__SUUIFullscreenRedeemCameraView_textFieldDidBeginEditing___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 416) setAlpha:0.4];
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  p_delegate = &self->_delegate;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  uint64_t v7 = [v5 text];

  [WeakRetained SUUIRedeemCameraView:self textFieldDidRedeem:v7];
  return 1;
}

- (void)textFieldDidEndEditing:(id)a3
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __57__SUUIFullscreenRedeemCameraView_textFieldDidEndEditing___block_invoke;
  v5[3] = &unk_265400980;
  v5[4] = self;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __57__SUUIFullscreenRedeemCameraView_textFieldDidEndEditing___block_invoke_2;
  v4[3] = &unk_265400AC8;
  v4[4] = self;
  [MEMORY[0x263F82E00] animateWithDuration:v5 animations:v4 completion:0.2];
  UIKeyboardOrderOutAutomatic();
  if ([(SUUIFullscreenRedeemCameraView *)self enabled])
  {
    [(SUUIFullscreenRedeemCameraView *)self _resumeRedeemer];
    [(SUUIFullscreenRedeemCameraView *)self setText:&stru_2704F8130];
  }
}

uint64_t __57__SUUIFullscreenRedeemCameraView_textFieldDidEndEditing___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 416) setAlpha:0.0];
}

uint64_t __57__SUUIFullscreenRedeemCameraView_textFieldDidEndEditing___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 416) removeFromSuperview];
}

- (void)_hideKeyboard
{
}

- (id)_newTextFieldWithClientContext:(id)a3
{
  id v4 = a3;
  id v5 = -[SUUIRedeemTextField initWithFrame:]([SUUIRedeemTextField alloc], "initWithFrame:", 0.0, 0.0, 1.0, 44.0);
  [(SUUIRedeemTextField *)v5 setSuppressBorder:1];
  [(SUUIRedeemTextField *)v5 setAutocorrectionType:1];
  [(SUUIRedeemTextField *)v5 setAutocapitalizationType:3];
  CGFloat v6 = [MEMORY[0x263F81708] systemFontOfSize:16.0];
  [(SUUIRedeemTextField *)v5 setFont:v6];
  if (v4) {
    [v4 localizedStringForKey:@"CAMERA_REDEEM_ENTER_CODE" inTable:@"Redeem"];
  }
  else {
  uint64_t v7 = +[SUUIClientContext localizedStringForKey:@"CAMERA_REDEEM_ENTER_CODE" inBundles:0 inTable:@"Redeem"];
  }
  id v8 = objc_alloc(NSDictionary);
  uint64_t v9 = *MEMORY[0x263F814F0];
  uint64_t v10 = [(SUUIFullscreenRedeemCameraView *)self tintColor];
  CGFloat v11 = (void *)v10;
  if (v10)
  {
    double v12 = objc_msgSend(v8, "initWithObjectsAndKeys:", v6, v9, v10, *MEMORY[0x263F81500], 0);
  }
  else
  {
    uint64_t v13 = [MEMORY[0x263F825C8] colorWithWhite:0.7 alpha:1.0];
    double v12 = objc_msgSend(v8, "initWithObjectsAndKeys:", v6, v9, v13, *MEMORY[0x263F81500], 0);
  }
  double v14 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:v7 attributes:v12];
  [(SUUIRedeemTextField *)v5 setAttributedPlaceholder:v14];

  return v5;
}

- (void)_pauseRedeemer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained cancelRedeemerViewForSUUIRedeemCameraView:self];
}

- (void)_resumeRedeemer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained startRedeemerViewForSUUIRedeemCameraView:self];
}

- (SUUIRedeemCameraViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SUUIRedeemCameraViewDelegate *)WeakRetained;
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

@end