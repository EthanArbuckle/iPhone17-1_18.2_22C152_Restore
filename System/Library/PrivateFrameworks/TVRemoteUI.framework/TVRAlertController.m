@interface TVRAlertController
- (BOOL)_canShowWhileLocked;
- (CGRect)previousKeyboardFrame;
- (NSString)text;
- (TVRAlertController)initWithCoder:(id)a3;
- (TVRAlertController)initWithKeyboardAttributes:(id)a3;
- (TVRAlertController)initWithNibName:(id)a3 bundle:(id)a4;
- (TVRAlertController)initWithTitle:(id)a3 PINEntryAttributes:(id)a4;
- (TVRAlertController)initWithTitle:(id)a3 keyboardAttributes:(id)a4;
- (TVRAlertController)initWithTitle:(id)a3 passcodeSize:(int64_t)a4;
- (TVRAlertControllerDelegate)delegate;
- (TVRAlertView)alertView;
- (TVRCKeyboardAttributes)keyboardAttributes;
- (TVRKeyboardView)keyboardView;
- (UIView)dimmingView;
- (id)_contentViewBasedOnType;
- (id)animationControllerForDismissedController:(id)a3;
- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5;
- (id)initForTextPasswordType:(id)a3;
- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5;
- (unint64_t)supportedInterfaceOrientations;
- (unint64_t)type;
- (void)_cancel;
- (void)_keyboardChanged:(id)a3;
- (void)_layoutForKeyboardFrame:(CGRect)a3;
- (void)_observeKeyboardNotifications;
- (void)alertView:(id)a3 didUpdateText:(id)a4;
- (void)alertViewDidCancel:(id)a3;
- (void)enableDictationButton:(BOOL)a3;
- (void)keyboardView:(id)a3 didUpdateText:(id)a4;
- (void)keyboardView:(id)a3 generatedTextInputPayload:(id)a4;
- (void)keyboardViewDidCancel:(id)a3;
- (void)keyboardViewDidHitReturnKey:(id)a3;
- (void)keyboardViewPressedDictationButton:(id)a3;
- (void)keyboardViewReleasedDictationButton:(id)a3;
- (void)loadView;
- (void)setAlertView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDimmingView:(id)a3;
- (void)setKeyboardAttributes:(id)a3;
- (void)setKeyboardView:(id)a3;
- (void)setPreviousKeyboardFrame:(CGRect)a3;
- (void)setText:(id)a3;
- (void)setType:(unint64_t)a3;
- (void)viewDidLayoutSubviews;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation TVRAlertController

- (TVRAlertController)initWithKeyboardAttributes:(id)a3
{
  id v4 = a3;
  v5 = [v4 title];
  v6 = [(TVRAlertController *)self initWithTitle:v5 keyboardAttributes:v4];

  return v6;
}

- (TVRAlertController)initWithTitle:(id)a3 keyboardAttributes:(id)a4
{
  objc_storeStrong((id *)&self->_keyboardAttributes, a4);
  id v7 = a4;
  id v8 = a3;
  v9 = [v7 PINEntryAttributes];

  v10 = [(TVRAlertController *)self initWithTitle:v8 PINEntryAttributes:v9];
  return v10;
}

- (TVRAlertController)initWithTitle:(id)a3 passcodeSize:(int64_t)a4
{
  v6 = (objc_class *)MEMORY[0x263F7C9D0];
  id v7 = a3;
  id v8 = (void *)[[v6 alloc] initWithDigitCount:a4];
  v9 = [(TVRAlertController *)self initWithTitle:v7 PINEntryAttributes:v8];

  return v9;
}

- (TVRAlertController)initWithTitle:(id)a3 PINEntryAttributes:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)TVRAlertController;
  id v8 = [(TVRAlertController *)&v16 initWithNibName:0 bundle:0];
  v9 = v8;
  if (v8)
  {
    [(TVRAlertController *)v8 setModalPresentationStyle:4];
    [(TVRAlertController *)v9 setTransitioningDelegate:v9];
    [(TVRAlertController *)v9 setTitle:v6];
    [(TVRAlertController *)v9 _observeKeyboardNotifications];
    if (v7)
    {
      v9->_type = 0;
      v10 = objc_alloc_init(TVRAlertView);
      p_alertView = (id *)&v9->_alertView;
      alertView = v9->_alertView;
      v9->_alertView = v10;

      [(TVRAlertView *)v9->_alertView setTitle:v6];
      [(TVRAlertView *)v9->_alertView setPINEntryAttributes:v7];
    }
    else
    {
      v9->_type = 1;
      v13 = objc_alloc_init(TVRKeyboardView);
      p_alertView = (id *)&v9->_keyboardView;
      keyboardView = v9->_keyboardView;
      v9->_keyboardView = v13;

      [(TVRKeyboardView *)v9->_keyboardView setTitle:v6];
      [(TVRKeyboardView *)v9->_keyboardView setAttributes:v9->_keyboardAttributes];
    }
    [*p_alertView setDelegate:v9];
  }

  return v9;
}

- (id)initForTextPasswordType:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)TVRAlertController;
  v5 = [(TVRAlertController *)&v12 initWithNibName:0 bundle:0];
  id v6 = v5;
  if (v5)
  {
    [(TVRAlertController *)v5 setModalPresentationStyle:4];
    [(TVRAlertController *)v6 setTransitioningDelegate:v6];
    [(TVRAlertController *)v6 setTitle:v4];
    [(TVRAlertController *)v6 _observeKeyboardNotifications];
    v6->_type = 2;
    uint64_t v7 = [objc_alloc(MEMORY[0x263F7C9C8]) _init];
    keyboardAttributes = v6->_keyboardAttributes;
    v6->_keyboardAttributes = (TVRCKeyboardAttributes *)v7;

    [(TVRCKeyboardAttributes *)v6->_keyboardAttributes _setSecure:1];
    [(TVRCKeyboardAttributes *)v6->_keyboardAttributes _setAutocorrectionType:1];
    [(TVRCKeyboardAttributes *)v6->_keyboardAttributes _setAutocapitalizationType:0];
    [(TVRCKeyboardAttributes *)v6->_keyboardAttributes _setEnablesReturnKeyAutomatically:1];
    v9 = objc_alloc_init(TVRKeyboardView);
    keyboardView = v6->_keyboardView;
    v6->_keyboardView = v9;

    [(TVRKeyboardView *)v6->_keyboardView setTitle:v4];
    [(TVRKeyboardView *)v6->_keyboardView setAttributes:v6->_keyboardAttributes];
    [(TVRKeyboardView *)v6->_keyboardView setDelegate:v6];
  }

  return v6;
}

- (TVRAlertController)initWithCoder:(id)a3
{
  id v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v5 = [v4 localizedStringForKey:@"TVRemoteUIAlertTitle" value:&stru_26DB4CAE0 table:@"Localizable"];
  id v6 = [(TVRAlertController *)self initWithTitle:v5 passcodeSize:4];

  return v6;
}

- (TVRAlertController)initWithNibName:(id)a3 bundle:(id)a4
{
  v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v6 = [v5 localizedStringForKey:@"TVRemoteUIAlertTitle" value:&stru_26DB4CAE0 table:@"Localizable"];
  uint64_t v7 = [(TVRAlertController *)self initWithTitle:v6 passcodeSize:4];

  return v7;
}

- (void)enableDictationButton:(BOOL)a3
{
}

- (void)loadView
{
  v3 = [MEMORY[0x263F82B60] mainScreen];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = *MEMORY[0x263F00148];
  double v13 = *(double *)(MEMORY[0x263F00148] + 8);
  id v20 = (id)objc_msgSend(objc_alloc(MEMORY[0x263F82E00]), "initWithFrame:", v5, v7, v9, v11);
  v14 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x263F82E00]), "initWithFrame:", v12, v13, v9, v11);
  dimmingView = self->_dimmingView;
  self->_dimmingView = v14;

  objc_super v16 = self->_dimmingView;
  v17 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.4];
  [(UIView *)v16 setBackgroundColor:v17];

  [(UIView *)self->_dimmingView setAutoresizingMask:18];
  [v20 addSubview:self->_dimmingView];
  if (self->_type - 1 <= 1)
  {
    v18 = (void *)[objc_alloc(MEMORY[0x263F82CB0]) initWithTarget:self action:sel__cancel];
    [v18 setNumberOfTapsRequired:1];
    [v18 setNumberOfTouchesRequired:1];
    [(UIView *)self->_dimmingView addGestureRecognizer:v18];
  }
  alertView = self->_alertView;
  if (!alertView) {
    alertView = self->_keyboardView;
  }
  [v20 addSubview:alertView];
  [(TVRAlertController *)self setView:v20];
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)TVRAlertController;
  [(TVRAlertController *)&v3 viewDidLayoutSubviews];
  -[TVRAlertController _layoutForKeyboardFrame:](self, "_layoutForKeyboardFrame:", self->_previousKeyboardFrame.origin.x, self->_previousKeyboardFrame.origin.y, self->_previousKeyboardFrame.size.width, self->_previousKeyboardFrame.size.height);
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TVRAlertController;
  [(TVRAlertController *)&v5 viewWillAppear:a3];
  double v4 = [(TVRAlertController *)self _contentViewBasedOnType];
  [v4 becomeFirstResponder];
}

- (unint64_t)supportedInterfaceOrientations
{
  v2 = [(TVRAlertController *)self traitCollection];
  if ([v2 userInterfaceIdiom] == 1) {
    unint64_t v3 = 30;
  }
  else {
    unint64_t v3 = 2;
  }

  return v3;
}

- (void)setText:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  objc_super v5 = (NSString *)a3;
  double v6 = _TVRUIKeyboardLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    text = self->_text;
    int v8 = 136315650;
    double v9 = "-[TVRAlertController setText:]";
    __int16 v10 = 2114;
    double v11 = text;
    __int16 v12 = 2114;
    double v13 = v5;
    _os_log_impl(&dword_227326000, v6, OS_LOG_TYPE_DEFAULT, "%s setting text:%{public}@ to new text:%{public}@", (uint8_t *)&v8, 0x20u);
  }

  if (self->_text != v5)
  {
    objc_storeStrong((id *)&self->_text, a3);
    [(TVRKeyboardView *)self->_keyboardView setText:v5];
    [(TVRAlertView *)self->_alertView setText:v5];
  }
}

- (void)setKeyboardAttributes:(id)a3
{
  objc_super v5 = (TVRCKeyboardAttributes *)a3;
  if (self->_keyboardAttributes != v5)
  {
    objc_storeStrong((id *)&self->_keyboardAttributes, a3);
    [(TVRKeyboardView *)self->_keyboardView setAttributes:v5];
  }
}

- (void)keyboardView:(id)a3 didUpdateText:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = a4;
  double v7 = _TVRUIKeyboardLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315394;
    __int16 v12 = "-[TVRAlertController keyboardView:didUpdateText:]";
    __int16 v13 = 2114;
    id v14 = v6;
    _os_log_impl(&dword_227326000, v7, OS_LOG_TYPE_DEFAULT, "%s text:%{public}@", (uint8_t *)&v11, 0x16u);
  }

  objc_storeStrong((id *)&self->_text, a4);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    id v10 = objc_loadWeakRetained((id *)&self->_delegate);
    [v10 alertController:self enteredText:v6];
  }
}

- (void)keyboardViewPressedDictationButton:(id)a3
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)p_delegate);
    [v7 alertControllerPressedDictationButton:self];
  }
}

- (void)keyboardViewReleasedDictationButton:(id)a3
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)p_delegate);
    [v7 alertControllerReleasedDictationButton:self];
  }
}

- (void)keyboardViewDidCancel:(id)a3
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)p_delegate);
    [v7 alertControllerCancelled:self];
  }
  [(TVRAlertController *)self dismissViewControllerAnimated:1 completion:0];
}

- (void)keyboardViewDidHitReturnKey:(id)a3
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)p_delegate);
    [v7 alertControllerHitKeyboardReturnKey:self];
  }
}

- (void)keyboardView:(id)a3 generatedTextInputPayload:(id)a4
{
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)&self->_delegate);
    [v7 alertController:self generatedTextInputPayload:v8];
  }
}

- (void)alertView:(id)a3 didUpdateText:(id)a4
{
  id v9 = a4;
  objc_storeStrong((id *)&self->_text, a4);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = objc_loadWeakRetained((id *)&self->_delegate);
    [v8 alertController:self enteredText:v9];
  }
}

- (void)alertViewDidCancel:(id)a3
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)p_delegate);
    [v7 alertControllerCancelled:self];
  }
  [(TVRAlertController *)self dismissViewControllerAnimated:1 completion:0];
}

- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [[TVRPresentationController alloc] initWithPresentedViewController:v7 presentingViewController:v6];

  return v8;
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  id v6 = objc_alloc_init(_TVRMAlertControllerTransitioning);
  [(_TVRMAlertControllerTransitioning *)v6 setIsPresentation:1];
  [(TVRAlertController *)self loadViewIfNeeded];
  id v7 = [(TVRAlertController *)self _contentViewBasedOnType];
  [(_TVRMAlertControllerTransitioning *)v6 setContentView:v7];

  [(_TVRMAlertControllerTransitioning *)v6 setDimmingView:self->_dimmingView];
  return v6;
}

- (id)animationControllerForDismissedController:(id)a3
{
  double v4 = objc_alloc_init(_TVRMAlertControllerTransitioning);
  [(_TVRMAlertControllerTransitioning *)v4 setIsPresentation:0];
  objc_super v5 = [(TVRAlertController *)self _contentViewBasedOnType];
  [(_TVRMAlertControllerTransitioning *)v4 setContentView:v5];

  [(_TVRMAlertControllerTransitioning *)v4 setDimmingView:self->_dimmingView];
  return v4;
}

- (void)_observeKeyboardNotifications
{
  unint64_t v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 addObserver:self selector:sel__keyboardChanged_ name:*MEMORY[0x263F83808] object:0];

  id v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 addObserver:self selector:sel__keyboardChanged_ name:*MEMORY[0x263F83800] object:0];
}

- (void)_keyboardChanged:(id)a3
{
  id v4 = a3;
  objc_super v5 = [v4 userInfo];
  id v6 = [v5 valueForKey:*MEMORY[0x263F837B0]];
  [v6 CGRectValue];
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;

  uint64_t v15 = [v4 userInfo];
  objc_super v16 = [v15 valueForKey:*MEMORY[0x263F837B8]];
  [v16 CGRectValue];
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  CGFloat v22 = v21;
  CGFloat v24 = v23;

  v25 = [v4 userInfo];
  v26 = [v25 valueForKey:*MEMORY[0x263F83780]];
  [v26 floatValue];
  float v34 = v27;

  v28 = [v4 userInfo];

  v29 = [v28 valueForKey:*MEMORY[0x263F83778]];
  uint64_t v30 = [v29 integerValue];

  v37.origin.x = v8;
  v37.origin.y = v10;
  v37.size.width = v12;
  v37.size.height = v14;
  v38.origin.x = v18;
  v38.origin.y = v20;
  v38.size.width = v22;
  v38.size.height = v24;
  if (CGRectEqualToRect(v37, v38)
    || ([(TVRAlertController *)self view],
        v31 = objc_claimAutoreleasedReturnValue(),
        [v31 layer],
        v32 = objc_claimAutoreleasedReturnValue(),
        char v33 = [v32 needsLayout],
        v32,
        v31,
        (v33 & 1) != 0))
  {
    v35[0] = MEMORY[0x263EF8330];
    v35[1] = 3221225472;
    v35[2] = __39__TVRAlertController__keyboardChanged___block_invoke_2;
    v35[3] = &unk_2648000D0;
    v35[4] = self;
    *(CGFloat *)&v35[5] = v18;
    *(CGFloat *)&v35[6] = v20;
    *(CGFloat *)&v35[7] = v22;
    *(CGFloat *)&v35[8] = v24;
    [MEMORY[0x263F82E00] performWithoutAnimation:v35];
  }
  else
  {
    v36[0] = MEMORY[0x263EF8330];
    v36[1] = 3221225472;
    v36[2] = __39__TVRAlertController__keyboardChanged___block_invoke;
    v36[3] = &unk_2648000D0;
    v36[4] = self;
    *(CGFloat *)&v36[5] = v18;
    *(CGFloat *)&v36[6] = v20;
    *(CGFloat *)&v36[7] = v22;
    *(CGFloat *)&v36[8] = v24;
    [MEMORY[0x263F82E00] animateWithDuration:v30 << 16 delay:v36 options:0 animations:v34 completion:0.0];
  }
  self->_previousKeyboardFrame.origin.x = v18;
  self->_previousKeyboardFrame.origin.y = v20;
  self->_previousKeyboardFrame.size.width = v22;
  self->_previousKeyboardFrame.size.height = v24;
}

uint64_t __39__TVRAlertController__keyboardChanged___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_layoutForKeyboardFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

uint64_t __39__TVRAlertController__keyboardChanged___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_layoutForKeyboardFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (void)_layoutForKeyboardFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat y = a3.origin.y;
  CGFloat width = a3.size.width;
  CGFloat x = a3.origin.x;
  id v27 = [(TVRAlertController *)self _contentViewBasedOnType];
  objc_msgSend(v27, "sizeThatFits:", 270.0, 0.0);
  double v7 = v6;
  double v9 = v8;
  CGFloat v10 = [(TVRAlertController *)self view];
  [v10 bounds];
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;

  double v25 = v9;
  double v26 = v7;
  UIRectCenteredIntegralRect();
  v29.origin.CGFloat x = v12;
  v29.origin.CGFloat y = v14;
  v29.size.CGFloat width = v16;
  v29.size.CGFloat height = v18;
  v33.origin.CGFloat x = x;
  v33.origin.CGFloat y = y;
  v33.size.CGFloat width = width;
  v33.size.CGFloat height = height;
  CGRect v30 = CGRectIntersection(v29, v33);
  CGFloat v19 = v30.origin.x;
  CGFloat v20 = v30.origin.y;
  CGFloat v21 = v30.size.width;
  CGFloat v22 = v30.size.height;
  if (!CGRectIsNull(v30))
  {
    v31.origin.CGFloat x = v19;
    v31.origin.CGFloat y = v20;
    v31.size.CGFloat width = v21;
    v31.size.CGFloat height = v22;
    if (!CGRectIsEmpty(v31))
    {
      v32.origin.CGFloat x = v19;
      v32.origin.CGFloat y = v20;
      v32.size.CGFloat width = v21;
      v32.size.CGFloat height = v22;
      CGRectGetHeight(v32);
      UIRectCenteredIntegralRect();
    }
  }
  UIRectGetCenter();
  objc_msgSend(v27, "setCenter:");
  objc_msgSend(v27, "setBounds:", 0.0, 0.0, v26, v25);
}

- (id)_contentViewBasedOnType
{
  if (self->_type) {
    v2 = &OBJC_IVAR___TVRAlertController__keyboardView;
  }
  else {
    v2 = &OBJC_IVAR___TVRAlertController__alertView;
  }
  id v3 = *(id *)((char *)&self->super.super.super.isa + *v2);
  return v3;
}

- (void)_cancel
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)p_delegate);
    [v6 alertControllerCancelled:self];
  }
  [(TVRAlertController *)self dismissViewControllerAnimated:1 completion:0];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (NSString)text
{
  return self->_text;
}

- (TVRCKeyboardAttributes)keyboardAttributes
{
  return self->_keyboardAttributes;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (TVRAlertControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (TVRAlertControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (TVRAlertView)alertView
{
  return self->_alertView;
}

- (void)setAlertView:(id)a3
{
}

- (TVRKeyboardView)keyboardView
{
  return self->_keyboardView;
}

- (void)setKeyboardView:(id)a3
{
}

- (UIView)dimmingView
{
  return self->_dimmingView;
}

- (void)setDimmingView:(id)a3
{
}

- (CGRect)previousKeyboardFrame
{
  double x = self->_previousKeyboardFrame.origin.x;
  double y = self->_previousKeyboardFrame.origin.y;
  double width = self->_previousKeyboardFrame.size.width;
  double height = self->_previousKeyboardFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setPreviousKeyboardFrame:(CGRect)a3
{
  self->_previousKeyboardFrame = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dimmingView, 0);
  objc_storeStrong((id *)&self->_keyboardView, 0);
  objc_storeStrong((id *)&self->_alertView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_keyboardAttributes, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end