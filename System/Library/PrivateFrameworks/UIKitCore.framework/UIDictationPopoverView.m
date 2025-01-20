@interface UIDictationPopoverView
+ (CGSize)viewSize;
- (CGSize)intrinsicContentSize;
- (UIDictationPopoverView)initWithFrame:(CGRect)a3;
- (id)buttonImageNamed:(id)a3;
- (id)languageButtons:(BOOL)a3;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (void)cancelButtonPressed:(id)a3;
- (void)centerButtonPressed:(id)a3;
- (void)clearLanguageButtons;
- (void)keyboardButtonPressed:(id)a3;
- (void)languageButtonPressed:(id)a3 withEvent:(id)a4;
- (void)layoutSubviews;
- (void)returnToKeyboard;
- (void)setState:(int)a3;
- (void)startButtonPressed:(id)a3;
- (void)stopButtonPressed:(id)a3;
- (void)willMoveToWindow:(id)a3;
@end

@implementation UIDictationPopoverView

+ (CGSize)viewSize
{
  double v2 = 172.0;
  double v3 = 40.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)intrinsicContentSize
{
  double v2 = objc_opt_class();
  [v2 viewSize];
  result.height = v4;
  result.width = v3;
  return result;
}

- (id)buttonImageNamed:(id)a3
{
  double v3 = +[UIImage systemImageNamed:a3];
  double v4 = +[UIColor systemGrayColor];
  v5 = [v3 imageWithTintColor:v4 renderingMode:1];

  return v5;
}

- (UIDictationPopoverView)initWithFrame:(CGRect)a3
{
  v44.receiver = self;
  v44.super_class = (Class)UIDictationPopoverView;
  double v3 = -[UIDictationView initWithFrame:](&v44, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = +[UIButton buttonWithType:0];
    cancelButton = v3->_cancelButton;
    v3->_cancelButton = (UIButton *)v4;

    [(UIControl *)v3->_cancelButton addTarget:v3 action:sel_cancelButtonPressed_ forControlEvents:64];
    v6 = v3->_cancelButton;
    v7 = [(UIDictationPopoverView *)v3 buttonImageNamed:@"xmark.square.fill"];
    [(UIButton *)v6 setImage:v7 forState:0];

    [(UIView *)v3 addSubview:v3->_cancelButton];
    -[UIButton setFrame:](v3->_cancelButton, "setFrame:", 130.0, 0.0, 42.0, 40.0);
    uint64_t v8 = +[UIButton buttonWithType:0];
    centerButton = v3->_centerButton;
    v3->_centerButton = (UIButton *)v8;

    [(UIControl *)v3->_centerButton addTarget:v3 action:sel_centerButtonPressed_ forControlEvents:64];
    [(UIView *)v3 addSubview:v3->_centerButton];
    uint64_t v10 = [(UIDictationPopoverView *)v3 buttonImageNamed:@"mic.slash"];
    stopDictationImage = v3->_stopDictationImage;
    v3->_stopDictationImage = (UIImage *)v10;

    -[UIView setSize:](v3->_centerButton, "setSize:", 114.0, 40.0);
    [(UIView *)v3->_centerButton setAlpha:0.3];
    uint64_t v12 = +[UIButton buttonWithType:0];
    languageButton = v3->_languageButton;
    v3->_languageButton = (UIButton *)v12;

    [(UIControl *)v3->_languageButton addTarget:v3 action:sel_languageButtonPressed_withEvent_ forControlEvents:64];
    [(UIView *)v3 addSubview:v3->_languageButton];
    v14 = +[UIColor systemGrayColor];
    [(UIButton *)v3->_languageButton setTintColor:v14];

    -[UIButton setFrame:](v3->_languageButton, "setFrame:", 0.0, 0.0, 42.0, 40.0);
    uint64_t v15 = +[UIButton buttonWithType:0];
    startButton = v3->_startButton;
    v3->_startButton = (UIButton *)v15;

    [(UIControl *)v3->_startButton addTarget:v3 action:sel_startButtonPressed_ forControlEvents:64];
    v17 = v3->_startButton;
    v18 = [(UIDictationPopoverView *)v3 buttonImageNamed:@"mic"];
    [(UIButton *)v17 setImage:v18 forState:0];

    [(UIView *)v3 addSubview:v3->_startButton];
    [(UIView *)v3->_cancelButton size];
    -[UIView setSize:](v3->_startButton, "setSize:");
    uint64_t v19 = +[UIButton buttonWithType:0];
    stopButton = v3->_stopButton;
    v3->_stopButton = (UIButton *)v19;

    [(UIControl *)v3->_stopButton addTarget:v3 action:sel_stopButtonPressed_ forControlEvents:64];
    v21 = v3->_stopButton;
    v22 = [(UIDictationPopoverView *)v3 buttonImageNamed:@"mic.slash"];
    [(UIButton *)v21 setImage:v22 forState:0];

    [(UIView *)v3 addSubview:v3->_stopButton];
    [(UIView *)v3->_cancelButton size];
    -[UIView setSize:](v3->_stopButton, "setSize:");
    uint64_t v23 = +[UIButton buttonWithType:0];
    keyboardButton = v3->_keyboardButton;
    v3->_keyboardButton = (UIButton *)v23;

    [(UIControl *)v3->_keyboardButton addTarget:v3 action:sel_keyboardButtonPressed_ forControlEvents:64];
    uint64_t v25 = [(UIDictationPopoverView *)v3 buttonImageNamed:@"keyboard"];
    showKeyboardButtonImage = v3->_showKeyboardButtonImage;
    v3->_showKeyboardButtonImage = (UIImage *)v25;

    uint64_t v27 = [(UIDictationPopoverView *)v3 buttonImageNamed:@"keyboard.chevron.compact.down"];
    hideKeyboardButtonImage = v3->_hideKeyboardButtonImage;
    v3->_hideKeyboardButtonImage = (UIImage *)v27;

    [(UIButton *)v3->_keyboardButton setImage:v3->_hideKeyboardButtonImage forState:0];
    [(UIView *)v3 addSubview:v3->_keyboardButton];
    [(UIView *)v3->_cancelButton size];
    -[UIView setSize:](v3->_keyboardButton, "setSize:");
    [(UIView *)v3 setTranslatesAutoresizingMaskIntoConstraints:0];
    uint64_t v29 = [MEMORY[0x1E4F1CA48] array];
    languageButtons = v3->_languageButtons;
    v3->_languageButtons = (NSMutableArray *)v29;

    [(UIDictationView *)v3 removeBackgroundView];
    v31 = v3->_cancelButton;
    v32 = [[UIPointerInteraction alloc] initWithDelegate:v3];
    [(UIView *)v31 addInteraction:v32];

    v33 = v3->_languageButton;
    v34 = [[UIPointerInteraction alloc] initWithDelegate:v3];
    [(UIView *)v33 addInteraction:v34];

    v35 = v3->_centerButton;
    v36 = [[UIPointerInteraction alloc] initWithDelegate:v3];
    [(UIView *)v35 addInteraction:v36];

    v37 = v3->_startButton;
    v38 = [[UIPointerInteraction alloc] initWithDelegate:v3];
    [(UIView *)v37 addInteraction:v38];

    v39 = v3->_stopButton;
    v40 = [[UIPointerInteraction alloc] initWithDelegate:v3];
    [(UIView *)v39 addInteraction:v40];

    v41 = v3->_keyboardButton;
    v42 = [[UIPointerInteraction alloc] initWithDelegate:v3];
    [(UIView *)v41 addInteraction:v42];
  }
  return v3;
}

- (void)keyboardButtonPressed:(id)a3
{
  self->_popoverPage = 1;
  uint64_t v4 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  v5 = [v4 containerRootController];
  v6 = [v5 placement];
  uint64_t v7 = [v6 showsKeyboard];

  uint64_t v8 = +[UIKeyboardImpl activeInstance];
  [v8 setKeyboardMinimizedByDictation:v7];

  [(UIView *)self setNeedsLayout];
}

- (void)startButtonPressed:(id)a3
{
  self->_popoverPage = 0;
  uint64_t v4 = +[UIDictationController sharedInstance];
  [v4 startDictation];

  [(UIDictationView *)self setSwitchingLanguage:0];
  [(UIView *)self setNeedsLayout];
}

- (void)stopButtonPressed:(id)a3
{
  self->_popoverPage = 1;
  [(UIDictationView *)self setSwitchingLanguage:1];
  uint64_t v4 = +[UIDictationController sharedInstance];
  [v4 stopAndCancelDictationWithReasonType:15];

  [(UIView *)self setNeedsLayout];
}

- (void)centerButtonPressed:(id)a3
{
  id v7 = a3;
  if (+[UIDictationController isRunning])
  {
    if (!self->_popoverPage)
    {
      uint64_t v4 = +[UIKeyboardPreferencesController sharedPreferencesController];
      v5 = [v4 preferencesActions];
      int v6 = [v5 BOOLForPreferenceKey:@"ShowKeyboardButtonOnDictationPopover"];

      if (v6) {
        [(UIDictationPopoverView *)self stopButtonPressed:v7];
      }
      else {
        [(UIDictationPopoverView *)self cancelButtonPressed:v7];
      }
    }
  }
  else
  {
    [(UIDictationPopoverView *)self startButtonPressed:v7];
  }
}

- (void)cancelButtonPressed:(id)a3
{
  self->_popoverPage = 0;
  [(UIDictationView *)self setSwitchingLanguage:0];
  double v3 = +[UIDictationController sharedInstance];
  [v3 setReasonType:29];

  uint64_t v4 = +[UIKeyboardImpl sharedInstance];
  [v4 dismissDictationPopover];

  id v5 = +[UIDictationController sharedInstance];
  [v5 resignFirstResponderWhenIdleIfNeeded];
}

- (void)clearLanguageButtons
{
  if (self->_languageView)
  {
    double v3 = [(UIView *)self->_cancelButton superview];

    if (v3 != self)
    {
      [(UIView *)self addSubview:self->_cancelButton];
      [(UIView *)self size];
      double v5 = v4;
      [(UIView *)self size];
      -[UIView setFrameOrigin:](self->_cancelButton, "setFrameOrigin:", v5 - v6, 0.0);
    }
    [(NSMutableArray *)self->_languageButtons makeObjectsPerformSelector:sel_removeFromSuperview];
    [(NSMutableArray *)self->_languageButtons removeAllObjects];
    [(UIView *)self->_languageView removeFromSuperview];
    languageView = self->_languageView;
    self->_languageView = 0;
  }
}

- (id)languageButtons:(BOOL)a3
{
  BOOL v24 = a3;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  double v4 = [UIView alloc];
  double v5 = -[UIView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  double v6 = +[UIKeyboardInputMode dictationInputMode];
  id v7 = [v6 currentInputModeForDictation];
  v26 = [v7 dictationLanguage];

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v8 = +[UIKeyboardInputModeController sharedInputModeController];
  v9 = [v8 enabledDictationLanguages];

  id obj = v9;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v28;
    double v13 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v28 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        v16 = +[UIButton buttonWithType:0];
        v17 = +[UIKeyboardInputMode dictationInputMode];
        v18 = [v17 indicatorIconForDictationLanguage:v15 scaleFactor:1.0];
        [v16 setImage:v18 forState:0];

        if ([v15 isEqualToString:v26]) {
          +[UIColor blueColor];
        }
        else {
        uint64_t v19 = +[UIColor systemGrayColor];
        }
        [v16 setTintColor:v19];

        [v16 addTarget:self action:sel_languageButtonPressed_withEvent_ forControlEvents:64];
        [(UIView *)v5 addSubview:v16];
        objc_msgSend(v16, "setFrame:", v13, 0.0, 42.0, 40.0);
        double v13 = v13 + 31.0;
        [(NSMutableArray *)self->_languageButtons addObject:v16];
        v20 = [[UIPointerInteraction alloc] initWithDelegate:self];
        [v16 addInteraction:v20];
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v11);
  }
  else
  {
    double v13 = 0.0;
  }

  if (v24)
  {
    [(UIView *)v5 addSubview:self->_cancelButton];
    -[UIView setFrameOrigin:](self->_cancelButton, "setFrameOrigin:", v13, 0.0);
    [(UIView *)self->_cancelButton size];
    double v13 = v13 + v21;
  }
  [(UIView *)self size];
  -[UIView setFrame:](v5, "setFrame:", 0.0, 0.0, v13, v22);

  return v5;
}

- (void)languageButtonPressed:(id)a3 withEvent:(id)a4
{
  id v5 = a3;
  double v6 = +[UIDictationController sharedInstance];
  [v6 setReasonType:28];

  if ([(UIButton *)self->_languageButton isEqual:v5])
  {
    id v7 = +[UIKeyboardInputModeController sharedInputModeController];
    uint64_t v8 = [v7 enabledDictationLanguages];
    unint64_t v9 = [v8 count];

    if (v9 < 5)
    {
      double v22 = [(UIDictationPopoverView *)self languageButtons:0];
      languageView = self->_languageView;
      self->_languageView = v22;
    }
    else
    {
      uint64_t v10 = [(UIDictationPopoverView *)self languageButtons:1];
      uint64_t v11 = [UIScrollView alloc];
      [(UIView *)self bounds];
      uint64_t v12 = -[UIScrollView initWithFrame:](v11, "initWithFrame:");
      [v10 frame];
      -[UIScrollView setContentSize:](v12, "setContentSize:", v13, v14);
      [(UIView *)v12 addSubview:v10];
      objc_storeStrong((id *)&self->_languageView, v12);
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __58__UIDictationPopoverView_languageButtonPressed_withEvent___block_invoke;
      v25[3] = &unk_1E52D9F70;
      v26 = v12;
      uint64_t v15 = v12;
      +[UIView animateWithDuration:0 delay:v25 options:0 animations:0.25 completion:0.25];
    }
    [(UIView *)self addSubview:self->_languageView];
    self->_popoverPage = 2;
    [(UIDictationView *)self setSwitchingLanguage:1];
    BOOL v24 = +[UIDictationController sharedInstance];
    [v24 stopDictation];

    [(UIView *)self setNeedsLayout];
  }
  else
  {
    v16 = +[UIDictationController sharedInstance];
    int v17 = [v16 state];

    if (!v17)
    {
      self->_popoverPage = 0;
      v18 = +[UIKeyboardInputModeController sharedInputModeController];
      uint64_t v19 = [v18 enabledDictationLanguages];
      v20 = objc_msgSend(v19, "objectAtIndex:", -[NSMutableArray indexOfObject:](self->_languageButtons, "indexOfObject:", v5));

      [(UIDictationPopoverView *)self clearLanguageButtons];
      double v21 = +[UIDictationController sharedInstance];
      [v21 switchToDictationLanguage:v20];

      [(UIDictationView *)self setSwitchingLanguage:0];
    }
  }
}

uint64_t __58__UIDictationPopoverView_languageButtonPressed_withEvent___block_invoke(uint64_t a1)
{
  double v2 = *(void **)(a1 + 32);
  [v2 contentSize];
  double v4 = v3;
  [*(id *)(a1 + 32) size];
  double v6 = v4 - v5;
  return objc_msgSend(v2, "setContentOffset:", v6, 0.0);
}

- (void)setState:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (a3 == 2)
  {
    if (!self->super._flamesView)
    {
      id v5 = objc_alloc((Class)getSUICFlamesViewClass());
      [(UIView *)self bounds];
      double v7 = v6;
      double v9 = v8;
      double v11 = v10;
      double v13 = v12;
      double v14 = +[UIScreen mainScreen];
      uint64_t v15 = (SUICFlamesView *)objc_msgSend(v5, "initWithFrame:screen:fidelity:", v14, 2, v7, v9, v11, v13);
      flamesView = self->super._flamesView;
      self->super._flamesView = v15;

      [(SUICFlamesView *)self->super._flamesView setDelegate:self];
      [(SUICFlamesView *)self->super._flamesView setMode:1];
      [(UIView *)self insertSubview:self->super._flamesView belowSubview:self->_centerButton];
      [(SUICFlamesView *)self->super._flamesView setTranslatesAutoresizingMaskIntoConstraints:0];
      int v17 = [(SUICFlamesView *)self->super._flamesView leadingAnchor];
      v18 = [(UIView *)self->_centerButton leadingAnchor];
      uint64_t v19 = [v17 constraintEqualToAnchor:v18];
      [v19 setActive:1];

      v20 = [(SUICFlamesView *)self->super._flamesView trailingAnchor];
      double v21 = [(UIView *)self->_centerButton trailingAnchor];
      double v22 = [v20 constraintEqualToAnchor:v21];
      [v22 setActive:1];

      uint64_t v23 = [(SUICFlamesView *)self->super._flamesView leadingAnchor];
      BOOL v24 = [(UIView *)self->_centerButton leadingAnchor];
      uint64_t v25 = [v23 constraintEqualToAnchor:v24];
      [v25 setActive:1];

      v26 = [(SUICFlamesView *)self->super._flamesView topAnchor];
      long long v27 = [(UIView *)self->_centerButton topAnchor];
      long long v28 = [v26 constraintEqualToAnchor:v27];
      [v28 setActive:1];

      long long v29 = [(SUICFlamesView *)self->super._flamesView bottomAnchor];
      long long v30 = [(UIView *)self->_centerButton bottomAnchor];
      v31 = [v29 constraintEqualToAnchor:v30];
      [v31 setActive:1];
    }
    BOOL v32 = +[UIKeyboard isKeyboardProcess];
    v33 = +[UIKeyboardImpl activeInstance];
    v34 = v33;
    if (v32) {
      [v33 remoteTextInputPartner];
    }
    else {
    v35 = [v33 textInputTraits];
    }
    v36 = [v35 insertionPointColor];

    if (v36)
    {
      [(SUICFlamesView *)self->super._flamesView setDictationColor:v36];
    }
    else
    {
      v37 = +[UIColor blueColor];
      [(SUICFlamesView *)self->super._flamesView setDictationColor:v37];
    }
    [(SUICFlamesView *)self->super._flamesView setHidden:0];
    [(SUICFlamesView *)self->super._flamesView setState:1];
    [(SUICFlamesView *)self->super._flamesView setNeedsLayout];
    [(UIView *)self setNeedsLayout];
  }
  else if (a3 == 1)
  {
    [(UIDictationPopoverView *)self clearLanguageButtons];
    self->_popoverPage = 0;
  }
  else
  {
    [(SUICFlamesView *)self->super._flamesView setHidden:1];
  }
  v38.receiver = self;
  v38.super_class = (Class)UIDictationPopoverView;
  [(UIDictationView *)&v38 setState:v3];
}

- (void)layoutSubviews
{
  v43[3] = *MEMORY[0x1E4F143B8];
  v42.receiver = self;
  v42.super_class = (Class)UIDictationPopoverView;
  [(UIView *)&v42 layoutSubviews];
  startButton = self->_startButton;
  v43[0] = self->_stopButton;
  v43[1] = startButton;
  v43[2] = self->_keyboardButton;
  double v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v43 count:3];
  [v4 enumerateObjectsUsingBlock:&__block_literal_global_381_1];

  id v5 = +[UIKeyboardPreferencesController sharedPreferencesController];
  double v6 = [v5 preferencesActions];
  int v7 = [v6 BOOLForPreferenceKey:@"ShowKeyboardButtonOnDictationPopover"];

  [(UIView *)self->_centerButton setHidden:0];
  [(UIView *)self->_languageButton size];
  double v9 = v8;
  [(id)objc_opt_class() viewSize];
  -[UIView setSize:](self, "setSize:");
  double v10 = +[UIKeyboardInputModeController sharedInputModeController];
  double v11 = [v10 enabledDictationLanguages];
  -[UIView setHidden:](self->_languageButton, "setHidden:", (unint64_t)[v11 count] < 2);

  unint64_t popoverPage = self->_popoverPage;
  if (popoverPage == 1)
  {
    [(UIView *)self->_startButton setHidden:0];
    uint64_t v15 = +[UIKeyboardImpl activeInstance];
    unsigned int v16 = v7 & ~[v15 hardwareKeyboardAttached];

    if (v16 == 1)
    {
      [(UIView *)self->_keyboardButton setHidden:0];
      int v17 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
      v18 = [v17 containerRootController];
      uint64_t v19 = [v18 placement];
      int v20 = [v19 showsKeyboard];

      uint64_t v21 = 22;
      if (v20) {
        uint64_t v21 = 23;
      }
      [(UIButton *)self->_keyboardButton setImage:*(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___UIKeyboardDicationBackground__gradient[v21]) forState:0];
    }
    BOOL v22 = [(UIView *)self->_languageButton isHidden];
    BOOL v23 = [(UIView *)self->_keyboardButton isHidden];
    BOOL v24 = v23;
    if (v22)
    {
      [(UIView *)self->_languageButton center];
      if (v24)
      {
        -[UIView setCenter:](self->_startButton, "setCenter:");
        uint64_t v25 = 0;
        double v9 = 0.0;
        goto LABEL_24;
      }
      -[UIView setCenter:](self->_keyboardButton, "setCenter:");
    }
    else if (!v23)
    {
      [(UIView *)self size];
      double v27 = v26;
      [(UIView *)self size];
      double v29 = (v27 - v28) / 3.0;
      [(UIView *)self->_languageButton center];
      double v31 = v30 + v29;
      [(UIView *)self->_keyboardButton center];
      [(UIView *)self->_keyboardButton setCenter:v31];
      [(UIView *)self->_keyboardButton center];
      double v33 = v29 + v32;
LABEL_22:
      [(UIView *)self->_startButton center];
      [(UIView *)self->_startButton setCenter:v33];
      goto LABEL_23;
    }
    [(UIView *)self center];
    double v33 = v40;
    goto LABEL_22;
  }
  if (popoverPage == 2)
  {
    [(UIView *)self->_centerButton setHidden:1];
    languageButton = self->_languageButton;
    uint64_t v14 = 1;
LABEL_4:
    [(UIView *)languageButton setHidden:v14];
LABEL_23:
    uint64_t v25 = 0;
    goto LABEL_24;
  }
  if ([(UIView *)self->_languageButton isHidden])
  {
    if (!v7)
    {
      uint64_t v25 = 0;
      double v9 = 16.0;
      goto LABEL_24;
    }
    languageButton = self->_stopButton;
    uint64_t v14 = 0;
    goto LABEL_4;
  }
  v34 = +[UIKeyboardImpl activeInstance];
  v35 = [v34 activeDictationLanguage];

  v36 = self->_languageButton;
  v37 = +[UIKeyboardInputMode dictationInputMode];
  objc_super v38 = [v37 indicatorIconForDictationLanguage:v35 scaleFactor:1.0];
  [(UIButton *)v36 setImage:v38 forState:0];

  uint64_t v25 = 0;
  if (v7) {
    uint64_t v25 = self->_stopDictationImage;
  }
  [(UIView *)self->_languageButton size];
  double v9 = v39;

LABEL_24:
  [(UIButton *)self->_centerButton setImage:v25 forState:0];
  [(UIView *)self->_cancelButton origin];
  -[UIButton setFrame:](self->_centerButton, "setFrame:", v9, 0.0, v41 - v9, 40.0);
}

uint64_t __40__UIDictationPopoverView_layoutSubviews__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setHidden:1];
}

- (void)willMoveToWindow:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    [(UIDictationView *)self setSwitchingLanguage:0];
    [(SUICFlamesView *)self->super._flamesView removeFromSuperview];
    [(SUICFlamesView *)self->super._flamesView setDelegate:0];
    flamesView = self->super._flamesView;
    self->super._flamesView = 0;

    goto LABEL_12;
  }
  if ([(NSMutableArray *)self->_languageButtons count])
  {
    [(UIDictationView *)self setSwitchingLanguage:1];
    unint64_t v5 = 2;
  }
  else if (+[UIDictationController isRunning])
  {
    unint64_t v5 = 0;
  }
  else
  {
    int v7 = +[UIKeyboardImpl sharedInstance];
    int v8 = [v7 isDictationPopoverPresented];

    if (!v8) {
      goto LABEL_10;
    }
    unint64_t v5 = 1;
  }
  self->_unint64_t popoverPage = v5;
LABEL_10:
  double v9 = +[UIDictationController activeInstance];
  int v10 = [v9 state];

  if (v10 == 2) {
    [(UIDictationPopoverView *)self setState:2];
  }
LABEL_12:
  v11.receiver = self;
  v11.super_class = (Class)UIDictationPopoverView;
  [(UIView *)&v11 willMoveToWindow:v4];
}

- (void)returnToKeyboard
{
  [(UIDictationPopoverView *)self willMoveToWindow:0];
  if (self->_popoverPage != 1)
  {
    uint64_t v3 = +[UIDictationController sharedInstance];
    int v4 = [v3 shouldSuppressSoftwareKeyboard];

    if (v4)
    {
      unint64_t v5 = +[UIDictationController sharedInstance];
      [v5 resignFirstResponderWhenIdleIfNeeded];
    }
  }
  v6.receiver = self;
  v6.super_class = (Class)UIDictationPopoverView;
  [(UIDictationView *)&v6 returnToKeyboard];
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  int v4 = [a3 view];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    unint64_t v5 = 0;
    goto LABEL_11;
  }
  unint64_t v5 = [v4 imageView];
  if (!v5)
  {
LABEL_11:
    uint64_t v25 = 0;
    goto LABEL_12;
  }
  objc_super v6 = [[UITargetedPreview alloc] initWithView:v5];
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
  BOOL v23 = +[UIPointerEffect effectWithPreview:v6];
  BOOL v24 = +[UIPointerShape shapeWithRoundedRect:](UIPointerShape, "shapeWithRoundedRect:", v19, v20, v21, v22);
  uint64_t v25 = +[UIPointerStyle styleWithEffect:v23 shape:v24];

LABEL_12:
  id v26 = v25;

  return v26;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_languageView, 0);
  objc_storeStrong((id *)&self->_languageButtons, 0);
  objc_storeStrong((id *)&self->_stopDictationImage, 0);
  objc_storeStrong((id *)&self->_hideKeyboardButtonImage, 0);
  objc_storeStrong((id *)&self->_showKeyboardButtonImage, 0);
  objc_storeStrong((id *)&self->_keyboardButton, 0);
  objc_storeStrong((id *)&self->_stopButton, 0);
  objc_storeStrong((id *)&self->_startButton, 0);
  objc_storeStrong((id *)&self->_centerButton, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_languageButton, 0);
}

@end