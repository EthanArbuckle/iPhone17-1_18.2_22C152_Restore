@interface UIDictationFloatingStarkView
- (CGPoint)positionForShow;
- (UIDictationFloatingStarkView)initWithFrame:(CGRect)a3;
- (void)dimmingViewWasTapped:(id)a3;
- (void)endpointButtonPressed;
- (void)finishReturnToKeyboard;
- (void)layoutSubviews;
- (void)prepareForReturnToKeyboard;
- (void)returnToKeyboard;
- (void)setInputViewsHiddenForDictation:(BOOL)a3;
- (void)setState:(int)a3;
- (void)show;
@end

@implementation UIDictationFloatingStarkView

- (UIDictationFloatingStarkView)initWithFrame:(CGRect)a3
{
  v25[2] = *MEMORY[0x1E4F143B8];
  v20.receiver = self;
  v20.super_class = (Class)UIDictationFloatingStarkView;
  v3 = -[UIDictationView initWithFrame:](&v20, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 addObserver:v3 selector:sel_applicationEnteredBackground name:@"UIApplicationDidEnterBackgroundNotification" object:0];

    v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 addObserver:v3 selector:sel_keyboardDidShow_ name:@"UIKeyboardDidShowNotification" object:0];

    uint64_t v6 = +[UIButton buttonWithType:0];
    endpointButton = v3->super._endpointButton;
    v3->super._endpointButton = (UIButton *)v6;

    [(UIControl *)v3->super._endpointButton addTarget:v3 action:sel_endpointButtonPressed forControlEvents:64];
    -[UIButton setFrame:](v3->super._endpointButton, "setFrame:", 0.0, 0.0, 143.0, 48.0);
    uint64_t v23 = *(void *)off_1E52D2040;
    v8 = [off_1E52D39B8 systemFontOfSize:20.0];
    v25[0] = v8;
    uint64_t v24 = *(void *)off_1E52D2048;
    uint64_t v9 = v24;
    v10 = +[UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:1.0];
    v25[1] = v10;
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:&v23 count:2];

    v12 = _UIKitBundle();
    v13 = [v12 localizedStringForKey:@"Done" value:@"Done" table:@"Localizable"];

    v14 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v13 attributes:v11];
    [(UIButton *)v3->super._endpointButton setAttributedTitle:v14 forState:0];
    v15 = (void *)[v14 mutableCopy];
    uint64_t v21 = v9;
    v16 = +[UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha:1.0];
    v22 = v16;
    v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v22 forKeys:&v21 count:1];

    objc_msgSend(v15, "addAttributes:range:", v17, 0, objc_msgSend(v13, "length"));
    [(UIButton *)v3->super._endpointButton setAttributedTitle:v15 forState:1];
    v18 = v3;
  }
  return v3;
}

- (void)layoutSubviews
{
  v23.receiver = self;
  v23.super_class = (Class)UIDictationFloatingStarkView;
  [(UIView *)&v23 layoutSubviews];
  v3 = [(UIView *)self window];
  v4 = __UIStatusBarManagerForWindow(v3);
  [v4 statusBarHeight];
  double v6 = v5;

  double v7 = v6 + 20.0;
  double v8 = v6 + 20.0 + 100.0 + 20.0;
  [(UIView *)self frame];
  double v10 = v9 * 0.5;
  [(UIView *)self size];
  double v12 = v11 - v8;
  [(UIView *)self->super._endpointButton size];
  -[UIView setCenter:](self->super._endpointButton, "setCenter:", v10, v12 - v13 * 0.5);
  v14 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  v15 = [v14 scene];
  v16 = [v15 screen];

  v17 = [v16 _capabilityForKey:@"UIScreenCapabilityTouchLevelsKey"];
  uint64_t v18 = [v17 integerValue];

  v19 = [(UIView *)self->super._endpointButton superview];

  if (v18 == 2)
  {
    if (v19 == self) {
      [(UIView *)self->super._endpointButton removeFromSuperview];
    }
  }
  else if (v19 != self)
  {
    [(UIView *)self addSubview:self->super._endpointButton];
  }
  [(UIView *)self size];
  double v21 = v20 + -100.0 - v7;
  [(UIView *)self size];
  -[SUICFlamesView setFrame:](self->super._flamesView, "setFrame:", 0.0, v21, v22, 100.0);
  [(SUICFlamesView *)self->super._flamesView setNeedsLayout];
}

- (void)finishReturnToKeyboard
{
  BOOL automaticAppearanceWasEnabled = self->super._automaticAppearanceWasEnabled;
  id v3 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  [v3 setAutomaticAppearanceEnabled:automaticAppearanceWasEnabled];
}

- (void)prepareForReturnToKeyboard
{
  id v3 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  self->super._BOOL automaticAppearanceWasEnabled = [v3 automaticAppearanceEnabled];

  id v4 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  [v4 setAutomaticAppearanceEnabled:1];
}

- (void)setState:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (a3 == 2)
  {
    [(UIView *)self bounds];
    double v6 = v5;
    SUICFlamesViewClass = (objc_class *)getSUICFlamesViewClass();
    flamesView = self->super._flamesView;
    if (flamesView)
    {
      -[SUICFlamesView setFrame:](flamesView, "setFrame:", 0.0, 0.0, v6, 100.0);
    }
    else
    {
      id v9 = [SUICFlamesViewClass alloc];
      double v10 = +[UIScreen mainScreen];
      double v11 = (SUICFlamesView *)objc_msgSend(v9, "initWithFrame:screen:fidelity:", v10, 2, 0.0, 0.0, v6, 100.0);
      double v12 = self->super._flamesView;
      self->super._flamesView = v11;
    }
    [(SUICFlamesView *)self->super._flamesView setDelegate:self];
    [(SUICFlamesView *)self->super._flamesView setMode:1];
    [(SUICFlamesView *)self->super._flamesView setState:1];
    [(SUICFlamesView *)self->super._flamesView setNeedsLayout];
    [(UIView *)self addSubview:self->super._flamesView];
    double v13 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
    v14 = [v13 scene];
    v15 = [v14 screen];

    v16 = [v15 _capabilityForKey:@"UIScreenCapabilityTouchLevelsKey"];
    uint64_t v17 = [v16 integerValue];

    if (v17 != 2) {
      [(UIView *)self addSubview:self->super._endpointButton];
    }
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __41__UIDictationFloatingStarkView_setState___block_invoke;
    v19[3] = &unk_1E52D9F70;
    v19[4] = self;
    +[UIView animateWithDuration:0 delay:v19 options:&__block_literal_global_258_0 animations:0.1 completion:0.0];
    [(UIView *)self setNeedsLayout];
  }
  v18.receiver = self;
  v18.super_class = (Class)UIDictationFloatingStarkView;
  [(UIDictationView *)&v18 setState:v3];
}

uint64_t __41__UIDictationFloatingStarkView_setState___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 416) setAlpha:1.0];
}

- (void)setInputViewsHiddenForDictation:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  double v5 = [v4 containerView];

  if (v3)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __64__UIDictationFloatingStarkView_setInputViewsHiddenForDictation___block_invoke;
    v12[3] = &unk_1E52D9F70;
    double v6 = &v13;
    double v13 = v5;
    id v7 = v5;
    +[UIView animateWithDuration:v12 animations:&__block_literal_global_261_0 completion:0.25];
  }
  else
  {
    double v8 = +[UIKeyboard activeKeyboard];
    [v8 setMinimized:0];

    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __64__UIDictationFloatingStarkView_setInputViewsHiddenForDictation___block_invoke_3;
    v10[3] = &unk_1E52D9F70;
    double v6 = &v11;
    double v11 = v5;
    id v9 = v5;
    +[UIView animateWithDuration:0x20000 delay:v10 options:0 animations:0.25 completion:0.25];
  }
}

uint64_t __64__UIDictationFloatingStarkView_setInputViewsHiddenForDictation___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

void __64__UIDictationFloatingStarkView_setInputViewsHiddenForDictation___block_invoke_2()
{
  id v0 = +[UIKeyboard activeKeyboard];
  [v0 setMinimized:1];
}

uint64_t __64__UIDictationFloatingStarkView_setInputViewsHiddenForDictation___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

- (void)dimmingViewWasTapped:(id)a3
{
  id v3 = +[UIDictationController sharedInstance];
  [v3 cancelDictation];
}

- (void)returnToKeyboard
{
  BOOL automaticAppearanceWasEnabled = self->super._automaticAppearanceWasEnabled;
  id v4 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  [v4 setAutomaticAppearanceEnabled:automaticAppearanceWasEnabled];

  double v5 = +[UIPeripheralHost sharedInstance];
  [v5 disableInterfaceAutorotation:0];

  [(UIDictationFloatingStarkView *)self prepareForReturnToKeyboard];
  self->super._keyboardInTransition = 1;
  double v6 = +[UIPeripheralHost sharedInstance];
  [v6 disableInterfaceAutorotation:1];

  v7[4] = self;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __48__UIDictationFloatingStarkView_returnToKeyboard__block_invoke;
  v8[3] = &unk_1E52D9F70;
  v8[4] = self;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__UIDictationFloatingStarkView_returnToKeyboard__block_invoke_2;
  v7[3] = &unk_1E52DC3A0;
  +[UIView animateWithDuration:0x20000 delay:v8 options:v7 animations:0.125 completion:0.0];
  [(UIDictationFloatingStarkView *)self finishReturnToKeyboard];
}

uint64_t __48__UIDictationFloatingStarkView_returnToKeyboard__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __48__UIDictationFloatingStarkView_returnToKeyboard__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) removeFromSuperview];
  [*(id *)(a1 + 32) setInputViewsHiddenForDictation:0];
  [*(id *)(a1 + 32) performSelector:sel_keyboardDidShow_ withObject:0 afterDelay:0.1];
  [*(id *)(*(void *)(a1 + 32) + 440) removeFromSuperview];
  [*(id *)(*(void *)(a1 + 32) + 440) setDelegate:0];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 440);
  *(void *)(v2 + 440) = 0;

  id v4 = *(void **)(*(void *)(a1 + 32) + 416);
  return [v4 removeFromSuperview];
}

- (CGPoint)positionForShow
{
  [(UIDictationView *)self currentScreenSize];
  double v3 = v2 * 0.5;
  double v5 = v4 * 0.5;
  result.y = v5;
  result.x = v3;
  return result;
}

- (void)show
{
  id v12 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  self->super._BOOL automaticAppearanceWasEnabled = [v12 automaticAppearanceEnabled];
  [v12 setAutomaticAppearanceEnabled:0];
  double v3 = +[UIPeripheralHost sharedInstance];
  [v3 disableInterfaceAutorotation:1];

  double v4 = [v12 containerWindow];
  [v4 beginDisablingInterfaceAutorotation];

  [(UIDictationFloatingStarkView *)self setInputViewsHiddenForDictation:1];
  double v5 = +[UIWindowScene _keyWindowScene]();
  double v6 = +[UITextEffectsWindow sharedTextEffectsWindowForWindowScene:v5];

  +[UIDictationView viewSize];
  double v8 = v7;
  double v10 = v9;
  [v6 size];
  -[UIView setFrame:](self, "setFrame:", 0.0, v11 - v10, v8, v10);
  [v6 addSubview:self];
  [(UIView *)self setAlpha:1.0];
  [(UIView *)self setNeedsLayout];
  [(UIView *)self->super._endpointButton setAlpha:0.0];
}

- (void)endpointButtonPressed
{
  id v2 = +[UIDictationController sharedInstance];
  [v2 stopDictation];
}

@end