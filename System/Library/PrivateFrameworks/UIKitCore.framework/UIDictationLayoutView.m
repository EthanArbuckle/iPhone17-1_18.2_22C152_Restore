@interface UIDictationLayoutView
- (BOOL)isShowing;
- (UIDictationLayoutView)initWithFrame:(CGRect)a3;
- (id)darkGrayColor;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (void)finishReturnToKeyboard;
- (void)globeButtonPressed:(id)a3 withEvent:(id)a4;
- (void)globeButtonPressed:(id)a3 withEvent:(id)a4 location:(CGPoint)a5;
- (void)keyboardButtonPressed:(id)a3;
- (void)layoutSubviews;
- (void)returnToKeyboard;
- (void)setRenderConfig:(id)a3;
- (void)setState:(int)a3;
- (void)updateLanguageLabel;
@end

@implementation UIDictationLayoutView

- (UIDictationLayoutView)initWithFrame:(CGRect)a3
{
  v23.receiver = self;
  v23.super_class = (Class)UIDictationLayoutView;
  v3 = -[UIDictationView initWithFrame:](&v23, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [UILabel alloc];
    uint64_t v5 = -[UILabel initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    languageLabel = v3->_languageLabel;
    v3->_languageLabel = (UILabel *)v5;

    [(UILabel *)v3->_languageLabel setTextAlignment:1];
    [(UILabel *)v3->_languageLabel setLineBreakMode:0];
    uint64_t v7 = +[UIButton buttonWithType:0];
    keyboardButton = v3->_keyboardButton;
    v3->_keyboardButton = (UIButton *)v7;

    [(UIControl *)v3->_keyboardButton addTarget:v3 action:sel_keyboardButtonPressed_ forControlEvents:64];
    v9 = v3->_keyboardButton;
    v10 = _UIImageWithName(@"dictation_keyboard.png");
    [(UIButton *)v9 setImage:v10 forState:0];

    -[UIButton setFrame:](v3->_keyboardButton, "setFrame:", 0.0, 0.0, 40.0, 40.0);
    uint64_t v11 = +[UIButton buttonWithType:0];
    globeButton = v3->_globeButton;
    v3->_globeButton = (UIButton *)v11;

    [(UIControl *)v3->_globeButton addTarget:v3 action:sel_globeButtonPressed_withEvent_ forControlEvents:4095];
    v13 = v3->_globeButton;
    v14 = _UIImageWithName(@"dictation_global.png");
    [(UIButton *)v13 setImage:v14 forState:0];

    -[UIButton setFrame:](v3->_globeButton, "setFrame:", 0.0, 0.0, 40.0, 40.0);
    v15 = v3->_keyboardButton;
    v16 = [[UIPointerInteraction alloc] initWithDelegate:v3];
    [(UIView *)v15 addInteraction:v16];

    v17 = v3->_globeButton;
    v18 = [[UIPointerInteraction alloc] initWithDelegate:v3];
    [(UIView *)v17 addInteraction:v18];

    v19 = +[UIButton buttonWithType:0];
    v20 = +[UIColor clearColor];
    [(UIView *)v19 setBackgroundColor:v20];

    [(UIView *)v19 addTarget:v3 action:sel_keyboardButtonPressed_ forControlEvents:64];
    waveTapEndpointButtonView = v3->_waveTapEndpointButtonView;
    v3->_waveTapEndpointButtonView = v19;
  }
  return v3;
}

- (id)darkGrayColor
{
  return +[UIColor colorWithRed:0.314 green:0.333 blue:0.36 alpha:1.0];
}

- (void)keyboardButtonPressed:(id)a3
{
  v8 = (UIButton *)a3;
  v4 = +[UIInputSwitcherView sharedInstance];
  if ([v4 isVisible])
  {
    [v4 hide];
  }
  else
  {
    if (self->_keyboardButton == v8)
    {
      uint64_t v5 = 15;
    }
    else if ((UIButton *)self->_waveTapEndpointButtonView == v8)
    {
      uint64_t v5 = 14;
    }
    else
    {
      uint64_t v5 = 0;
    }
    v6 = +[UIDictationController sharedInstance];
    [v6 setReasonType:v5];

    uint64_t v7 = +[UIDictationController sharedInstance];
    [v7 stopDictation];
  }
  [(UIDictationLayoutView *)self returnToKeyboard];
}

- (void)updateLanguageLabel
{
  v31[2] = *MEMORY[0x1E4F143B8];
  if (self->_blackTextColor) {
    [(UIDictationLayoutView *)self darkGrayColor];
  }
  else {
  v3 = +[UIColor whiteColor];
  }
  uint64_t v4 = *(void *)off_1E52D2040;
  v30[0] = *(void *)off_1E52D2048;
  v30[1] = v4;
  v31[0] = v3;
  uint64_t v5 = [off_1E52D39B8 systemFontOfSize:18.0];
  v31[1] = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:2];

  UIKeyboardLocalizedDictationDisplayName(self->_currentDictationLanguage);
  uint64_t v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  currentDictationLanguage = v7;
  if (!v7) {
    currentDictationLanguage = self->_currentDictationLanguage;
  }
  v9 = currentDictationLanguage;

  v10 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v9 attributes:v6];
  [(UILabel *)self->_languageLabel setAttributedText:v10];

  [(UILabel *)self->_languageLabel setNumberOfLines:1];
  [(UIView *)self->_languageLabel sizeToFit];
  [(UIView *)self size];
  double v12 = v11;
  [(UIView *)self center];
  double v14 = v12 - v13;
  [(UIView *)self center];
  if (v14 < v15) {
    double v15 = v14;
  }
  double v16 = v15 + v15;
  v17 = [(UIView *)self->_keyboardButton window];

  if (v17) {
    double v16 = v16 + -120.0;
  }
  [(UIView *)self->_languageLabel size];
  if (v16 < v18) {
    [(UILabel *)self->_languageLabel setNumberOfLines:2];
  }
  [(UIView *)self->_languageLabel size];
  -[UIView setSize:](self->_languageLabel, "setSize:", v16, v19 * (double)[(UILabel *)self->_languageLabel numberOfLines]);
  v20 = [(UIView *)self->_keyboardButton superview];

  if (v20)
  {
    [(UIView *)self size];
    double v22 = v21 * 0.5;
    [(UIView *)self->_keyboardButton center];
    languageLabel = self->_languageLabel;
  }
  else
  {
    v25 = +[UIKeyboard activeKeyboard];
    unint64_t v26 = [v25 interfaceOrientation] - 3;

    [(UIView *)self size];
    double v22 = v27 * 0.5;
    [(UIView *)self size];
    languageLabel = self->_languageLabel;
    if (v26 > 1) {
      double v29 = -10.0;
    }
    else {
      double v29 = -20.0;
    }
    double v23 = v28 + v29;
  }
  -[UIView setCenter:](languageLabel, "setCenter:", v22, v23);
  [(UIView *)self addSubview:self->_languageLabel];
  [(UIView *)self->_languageLabel setAlpha:1.0];
}

- (void)globeButtonPressed:(id)a3 withEvent:(id)a4
{
  id v6 = a4;
  id v8 = a3;
  [v8 bounds];
  double MidX = CGRectGetMidX(v10);
  [v8 bounds];
  objc_msgSend(v8, "convertPoint:toView:", 0, MidX, CGRectGetMidY(v11) + -20.0);
  -[UIDictationLayoutView globeButtonPressed:withEvent:location:](self, "globeButtonPressed:withEvent:location:", v8, v6);
}

- (void)globeButtonPressed:(id)a3 withEvent:(id)a4 location:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  id v9 = a3;
  id v10 = a4;
  CGRect v11 = +[UIKeyboardInputModeController sharedInputModeController];
  double v12 = [v11 enabledDictationLanguages];

  if ([v12 count])
  {
    [(UIDictationView *)self setSwitchingLanguage:1];
    double v13 = +[UIInputSwitcherView sharedInstance];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __63__UIDictationLayoutView_globeButtonPressed_withEvent_location___block_invoke;
    v17[3] = &unk_1E52D9F70;
    v17[4] = self;
    id v14 = (id)objc_msgSend(v13, "buttonPressed:withEvent:location:isForDictation:tapAction:", v9, v10, 1, v17, x, y);
  }
  else
  {
    double v15 = +[UIDictationController sharedInstance];
    [v15 setReasonType:16];

    double v16 = +[UIDictationController sharedInstance];
    [v16 stopDictation];

    [(UIDictationLayoutView *)self returnToKeyboard];
  }
}

void __63__UIDictationLayoutView_globeButtonPressed_withEvent_location___block_invoke(uint64_t a1)
{
  v2 = +[UIDictationController sharedInstance];
  [v2 setReasonType:16];

  v3 = +[UIDictationController activeInstance];
  [v3 stopDictation];

  uint64_t v4 = +[UIKeyboardInputModeController sharedInputModeController];
  uint64_t v5 = [v4 enabledDictationLanguages];

  uint64_t v6 = [v5 indexOfObject:*(void *)(*(void *)(a1 + 32) + 496)];
  if (v6 + 1 < (unint64_t)[v5 count]) {
    uint64_t v7 = v6 + 1;
  }
  else {
    uint64_t v7 = 0;
  }
  uint64_t v8 = [v5 objectAtIndex:v7];
  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = *(void **)(v9 + 496);
  *(void *)(v9 + 496) = v8;

  gDictationViewSharedInstance_block_invoke___touchUp = CFAbsoluteTimeGetCurrent();
  dispatch_time_t v11 = dispatch_time(0, 500000000);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __63__UIDictationLayoutView_globeButtonPressed_withEvent_location___block_invoke_2;
  v12[3] = &unk_1E52D9CD0;
  v12[4] = *(void *)(a1 + 32);
  v12[5] = 0x3FE0000000000000;
  dispatch_after(v11, MEMORY[0x1E4F14428], v12);
  [*(id *)(a1 + 32) updateLanguageLabel];
}

void __63__UIDictationLayoutView_globeButtonPressed_withEvent_location___block_invoke_2(uint64_t a1)
{
  if (CFAbsoluteTimeGetCurrent() - *(double *)&gDictationViewSharedInstance_block_invoke___touchUp >= *(double *)(a1 + 40))
  {
    v2 = +[UIDictationController sharedInstance];
    [v2 setReasonType:16];

    v3 = +[UIDictationController sharedInstance];
    [v3 switchToDictationLanguage:*(void *)(*(void *)(a1 + 32) + 496)];

    [*(id *)(a1 + 32) setSwitchingLanguage:0];
    uint64_t v4 = *(void **)(a1 + 32);
    [v4 setNeedsLayout];
  }
}

- (void)setRenderConfig:(id)a3
{
  background = self->super._background;
  id v4 = a3;
  id v5 = [(UIKeyboardDicationBackground *)background gradient];
  [v5 setRenderConfig:v4];
}

- (void)setState:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (a3 == 2)
  {
    [(UIView *)self bounds];
    double v9 = v8;
    SUICFlamesViewClass = (objc_class *)getSUICFlamesViewClass();
    flamesView = self->super._flamesView;
    if (flamesView)
    {
      -[SUICFlamesView setFrame:](flamesView, "setFrame:", 0.0, 0.0, v9, 100.0);
    }
    else
    {
      id v12 = [SUICFlamesViewClass alloc];
      double v13 = +[UIScreen mainScreen];
      id v14 = (SUICFlamesView *)objc_msgSend(v12, "initWithFrame:screen:fidelity:", v13, 2, 0.0, 0.0, v9, 100.0);
      double v15 = self->super._flamesView;
      self->super._flamesView = v14;
    }
    [(SUICFlamesView *)self->super._flamesView setDelegate:self];
    [(SUICFlamesView *)self->super._flamesView setHidden:0];
    [(SUICFlamesView *)self->super._flamesView setMode:1];
    [(SUICFlamesView *)self->super._flamesView setState:1];
    if (self->_blackTextColor) {
      [(UIDictationLayoutView *)self darkGrayColor];
    }
    else {
    double v16 = +[UIColor whiteColor];
    }
    [(SUICFlamesView *)self->super._flamesView setDictationColor:v16];

    [(SUICFlamesView *)self->super._flamesView setNeedsLayout];
    [(UIView *)self addSubview:self->super._flamesView];
    [(UIView *)self setNeedsLayout];
  }
  else if (a3 == 1)
  {
    id v5 = +[UIKeyboardImpl activeInstance];
    uint64_t v6 = [v5 _inheritedRenderConfig];
    [(UIDictationLayoutView *)self setRenderConfig:v6];

    uint64_t v7 = [(UIKeyboardDicationBackground *)self->super._background gradient];
    [v7 startColorTransitionIn];
  }
  else
  {
    [(SUICFlamesView *)self->super._flamesView setHidden:1];
  }
  v17 = [(UIKeyboardDicationBackground *)self->super._background gradient];
  [v17 setNeedsLayout];

  v18.receiver = self;
  v18.super_class = (Class)UIDictationLayoutView;
  [(UIDictationView *)&v18 setState:v3];
}

- (void)layoutSubviews
{
  v60.receiver = self;
  v60.super_class = (Class)UIDictationLayoutView;
  [(UIView *)&v60 layoutSubviews];
  [(UIView *)self size];
  double v4 = v3;
  double v6 = v5;
  if (+[UIKeyboardImpl isSplit])
  {
    uint64_t v7 = +[UIKeyboardImpl activeInstance];
    char v8 = [v7 centerFilled];

    if ((v8 & 1) == 0)
    {
      double v9 = +[UIKeyboardLayoutDictation activeInstance];
      [v9 splitLeftSize];
      double v4 = v10;
    }
  }
  BOOL v11 = +[UIKeyboardImpl showsGlobeAndDictationKeysExternally];
  id v12 = +[UIKeyboardInputMode dictationInputMode];
  double v13 = [v12 triggeringTouch];
  if (v13) {
    char v14 = 1;
  }
  else {
    char v14 = v11;
  }

  -[SUICFlamesView setSize:](self->super._flamesView, "setSize:", v4, 100.0);
  [(UIView *)self frame];
  if (v11) {
    double v16 = v15 * 0.5;
  }
  else {
    double v16 = v15 * 94.0 / 216.0;
  }
  -[SUICFlamesView setCenter:](self->super._flamesView, "setCenter:", v4 * 0.5, v16);
  [(SUICFlamesView *)self->super._flamesView setNeedsLayout];
  v17 = +[UIKeyboardImpl activeInstance];
  objc_super v18 = [v17 _inheritedRenderConfig];
  self->_blackTextColor = [v18 lightKeyboard];

  double v19 = +[UIDevice currentDevice];
  uint64_t v20 = [v19 userInterfaceIdiom];

  [(UIView *)self bounds];
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;
  double v28 = v27;
  if ((v20 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    [(UIView *)self size];
    double v30 = v29 * 0.5;
    [(UIView *)self size];
    double v57 = v6;
    double v32 = v31 * 0.25;
    [(UIView *)self size];
    double v34 = v33 * 0.25;
    double v22 = v22 + v34;
    double v35 = v32 + v34;
    double v6 = v57;
    double v26 = v26 - v35;
    double v24 = v24 + v30;
    double v28 = v28 - (v30 + 0.0);
  }
  -[UIView setFrame:](self->_waveTapEndpointButtonView, "setFrame:", v22, v24, v26, v28);
  [(UIView *)self addSubview:self->_waveTapEndpointButtonView];
  if (v4 * 0.25 <= 80.0) {
    double v36 = v4 * 0.25;
  }
  else {
    double v36 = 80.0;
  }
  if (v14)
  {
    [(UIView *)self->_globeButton removeFromSuperview];
    [(UIView *)self->_keyboardButton removeFromSuperview];
  }
  else
  {
    double v37 = v6 - fmin(v6 * 0.25, 40.0);
    double v38 = v6 * 0.5;
    v39 = +[UIKeyboardInputModeController sharedInputModeController];
    v40 = [v39 enabledDictationLanguages];
    unint64_t v41 = [v40 count];

    globeButton = self->_globeButton;
    if (v41 < 2)
    {
      [(UIView *)globeButton removeFromSuperview];
    }
    else
    {
      -[UIView setSize:](globeButton, "setSize:", v36, v38);
      -[UIView setCenter:](self->_globeButton, "setCenter:", 40.0, v37);
      v43 = self->_globeButton;
      if (self->_blackTextColor) {
        v44 = @"dictation_global_dark.png";
      }
      else {
        v44 = @"dictation_global.png";
      }
      v45 = _UIImageWithName(v44);
      [(UIButton *)v43 setImage:v45 forState:0];

      [(UIView *)self addSubview:self->_globeButton];
    }
    -[UIView setSize:](self->_keyboardButton, "setSize:", v36, v38);
    v46 = [(UIView *)self->_globeButton superview];

    double v47 = v4 + -40.0;
    if (!v46) {
      double v47 = v4 * 0.5;
    }
    -[UIView setCenter:](self->_keyboardButton, "setCenter:", v47, v37);
    keyboardButton = self->_keyboardButton;
    if (self->_blackTextColor) {
      v49 = @"dictation_keyboard_dark.png";
    }
    else {
      v49 = @"dictation_keyboard.png";
    }
    v50 = _UIImageWithName(v49);
    [(UIButton *)keyboardButton setImage:v50 forState:0];

    [(UIView *)self addSubview:self->_keyboardButton];
  }
  if ([(UIDictationView *)self showLanguageLabel])
  {
    [(UIDictationView *)self setShowLanguageLabel:0];
    v51 = +[UIKeyboardImpl activeInstance];
    v52 = [v51 activeDictationLanguage];
    currentDictationLanguage = self->_currentDictationLanguage;
    self->_currentDictationLanguage = v52;

    [(UIView *)self->_languageLabel alpha];
    if (v54 == 0.0) {
      double v55 = 0.75;
    }
    else {
      double v55 = 0.25;
    }
    if (self->_currentDictationLanguage)
    {
      v56 = [(UIView *)self->_globeButton superview];

      if (!v56) {
        [(UIView *)self->_keyboardButton setAlpha:0.0];
      }
      [(UIDictationLayoutView *)self updateLanguageLabel];
    }
    v58[4] = self;
    v59[0] = MEMORY[0x1E4F143A8];
    v59[1] = 3221225472;
    v59[2] = __39__UIDictationLayoutView_layoutSubviews__block_invoke;
    v59[3] = &unk_1E52D9F70;
    v59[4] = self;
    v58[0] = MEMORY[0x1E4F143A8];
    v58[1] = 3221225472;
    v58[2] = __39__UIDictationLayoutView_layoutSubviews__block_invoke_2;
    v58[3] = &unk_1E52DC3A0;
    +[UIView animateWithDuration:0 delay:v59 options:v58 animations:0.25 completion:v55];
  }
  [(UIDictationView *)self removeBackgroundView];
}

void __39__UIDictationLayoutView_layoutSubviews__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 488) setAlpha:0.0];
  v2 = [*(id *)(*(void *)(a1 + 32) + 472) superview];

  if (!v2)
  {
    double v3 = *(void **)(*(void *)(a1 + 32) + 480);
    [v3 setAlpha:1.0];
  }
}

uint64_t __39__UIDictationLayoutView_layoutSubviews__block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 488) removeFromSuperview];
}

- (void)finishReturnToKeyboard
{
  [(SUICFlamesView *)self->super._flamesView removeFromSuperview];
  [(SUICFlamesView *)self->super._flamesView setDelegate:0];
  flamesView = self->super._flamesView;
  self->super._flamesView = 0;

  v4.receiver = self;
  v4.super_class = (Class)UIDictationLayoutView;
  [(UIDictationView *)&v4 finishReturnToKeyboard];
}

- (void)returnToKeyboard
{
  if (self->super._background)
  {
    id v2 = [(UIKeyboardDicationBackground *)self->super._background gradient];
    [v2 startColorTransitionOut];
  }
  else
  {
    v3.receiver = self;
    v3.super_class = (Class)UIDictationLayoutView;
    [(UIDictationView *)&v3 returnToKeyboard];
  }
}

- (BOOL)isShowing
{
  id v2 = +[UIKeyboardImpl sharedInstance];
  if ([v2 isUsingDictationLayout])
  {
    char v3 = 1;
  }
  else
  {
    objc_super v4 = +[UIKeyboardImpl sharedInstance];
    char v3 = [v4 isDictationPopoverPresented];
  }
  return v3;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  objc_super v4 = [a3 view];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    double v5 = 0;
    goto LABEL_11;
  }
  double v5 = [v4 imageView];
  if (!v5)
  {
LABEL_11:
    double v25 = 0;
    goto LABEL_12;
  }
  double v6 = [[UITargetedPreview alloc] initWithView:v5];
  [v4 size];
  double v8 = v7;
  double v10 = v9;
  [v5 origin];
  double v12 = v11;
  double v14 = v13;
  [v5 size];
  double v17 = v10 - v16;
  double v18 = 0.0;
  if (v10 - v16 < 0.0) {
    double v17 = 0.0;
  }
  if (v8 - v15 >= 0.0) {
    double v18 = v8 - v15;
  }
  if (v17 >= v18) {
    double v17 = v18;
  }
  double v19 = v12 - v17 * 0.5;
  double v20 = v14 - v17 * 0.5;
  double v21 = v15 + v17;
  double v22 = v16 + v17;
  double v23 = +[UIPointerEffect effectWithPreview:v6];
  double v24 = +[UIPointerShape shapeWithRoundedRect:](UIPointerShape, "shapeWithRoundedRect:", v19, v20, v21, v22);
  double v25 = +[UIPointerStyle styleWithEffect:v23 shape:v24];

LABEL_12:
  id v26 = v25;

  return v26;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_waveTapEndpointButtonView, 0);
  objc_storeStrong((id *)&self->_currentDictationLanguage, 0);
  objc_storeStrong((id *)&self->_languageLabel, 0);
  objc_storeStrong((id *)&self->_keyboardButton, 0);
  objc_storeStrong((id *)&self->_globeButton, 0);
}

@end