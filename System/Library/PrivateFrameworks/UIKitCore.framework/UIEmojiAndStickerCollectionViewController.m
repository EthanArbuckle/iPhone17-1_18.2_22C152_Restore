@interface UIEmojiAndStickerCollectionViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)handleHardwareKeyboardEvent:(id)a3;
- (BOOL)handleKeyEvent:(id)a3;
- (NSArray)searchResults;
- (STKEmojiAndStickerCollectionViewConfiguration)configuration;
- (UIEmojiAndStickerCollectionViewController)init;
- (UIEmojiAndStickerCollectionViewController)initWithConfiguration:(id)a3;
- (UIEmojiAndStickerCollectionViewControllerDelegate)delegate;
- (id)emojiKeyManager;
- (void)addNoResultsViewIfNeeded;
- (void)handleKeyUIEvent:(id)a3 dismiss:(BOOL)a4;
- (void)setConfiguration:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setSearchResults:(id)a3;
- (void)viewDidLoad;
- (void)viewIsAppearing:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation UIEmojiAndStickerCollectionViewController

- (UIEmojiAndStickerCollectionViewController)initWithConfiguration:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UIEmojiAndStickerCollectionViewController;
  v6 = [(UIViewController *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_configuration, a3);
  }

  return v7;
}

- (UIEmojiAndStickerCollectionViewController)init
{
  v3.receiver = self;
  v3.super_class = (Class)UIEmojiAndStickerCollectionViewController;
  return [(UIViewController *)&v3 init];
}

- (id)emojiKeyManager
{
  return [(UIKeyboardLayoutStar *)self->_layout emojiKeyManager];
}

- (void)viewDidLoad
{
  v50[4] = *MEMORY[0x1E4F143B8];
  v48.receiver = self;
  v48.super_class = (Class)UIEmojiAndStickerCollectionViewController;
  [(UIViewController *)&v48 viewDidLoad];
  objc_super v3 = [UIKeyboardLayoutStar alloc];
  v4 = [(UIViewController *)self view];
  [v4 bounds];
  id v5 = -[UIKeyboardLayoutStar initWithFrame:](v3, "initWithFrame:");
  layout = self->_layout;
  self->_layout = v5;

  [(UIKeyboardLayoutStar *)self->_layout setPreventPaddlesForPointerTouches:1];
  [(UIView *)self->_layout setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIKeyboardLayoutStar *)self->_layout setDelegate:self];
  v7 = [(UIViewController *)self view];
  [v7 addSubview:self->_layout];

  v43 = [(UIView *)self->_layout topAnchor];
  v45 = [(UIViewController *)self view];
  v41 = [v45 safeAreaLayoutGuide];
  v39 = [v41 topAnchor];
  v37 = [v43 constraintEqualToAnchor:v39];
  v50[0] = v37;
  v35 = [(UIView *)self->_layout leadingAnchor];
  v36 = [(UIViewController *)self view];
  v34 = [v36 safeAreaLayoutGuide];
  v33 = [v34 leadingAnchor];
  v32 = [v35 constraintEqualToAnchor:v33];
  v50[1] = v32;
  v30 = [(UIView *)self->_layout trailingAnchor];
  v31 = [(UIViewController *)self view];
  v8 = [v31 safeAreaLayoutGuide];
  objc_super v9 = [v8 trailingAnchor];
  v10 = [v30 constraintEqualToAnchor:v9];
  v50[2] = v10;
  v11 = [(UIView *)self->_layout bottomAnchor];
  v12 = [(UIViewController *)self view];
  v13 = [v12 safeAreaLayoutGuide];
  v14 = [v13 bottomAnchor];
  v15 = [v11 constraintEqualToAnchor:v14];
  v50[3] = v15;
  v47 = [MEMORY[0x1E4F1C978] arrayWithObjects:v50 count:4];

  [MEMORY[0x1E4F5B268] activateConstraints:v47];
  v16 = [UIEmojiAndStickerBackgroundView alloc];
  v17 = [(UIViewController *)self view];
  [v17 bounds];
  v18 = -[UIEmojiAndStickerBackgroundView initWithFrame:](v16, "initWithFrame:");
  backgroundView = self->_backgroundView;
  self->_backgroundView = v18;

  [(UIView *)self->_backgroundView setTranslatesAutoresizingMaskIntoConstraints:0];
  v20 = [(UIViewController *)self view];
  [v20 insertSubview:self->_backgroundView belowSubview:self->_layout];

  v38 = (void *)MEMORY[0x1E4F5B268];
  v46 = [(UIView *)self->_backgroundView topAnchor];
  v44 = [(UIView *)self->_layout topAnchor];
  v42 = [v46 constraintEqualToAnchor:v44];
  v49[0] = v42;
  v40 = [(UIView *)self->_backgroundView leadingAnchor];
  v21 = [(UIView *)self->_layout leadingAnchor];
  v22 = [v40 constraintEqualToAnchor:v21];
  v49[1] = v22;
  v23 = [(UIView *)self->_backgroundView trailingAnchor];
  v24 = [(UIView *)self->_layout trailingAnchor];
  v25 = [v23 constraintEqualToAnchor:v24];
  v49[2] = v25;
  v26 = [(UIView *)self->_backgroundView bottomAnchor];
  v27 = [(UIView *)self->_layout bottomAnchor];
  v28 = [v26 constraintEqualToAnchor:v27];
  v49[3] = v28;
  v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:4];
  [v38 activateConstraints:v29];
}

- (void)viewIsAppearing:(BOOL)a3
{
  v26.receiver = self;
  v26.super_class = (Class)UIEmojiAndStickerCollectionViewController;
  [(UIViewController *)&v26 viewIsAppearing:a3];
  layout = self->_layout;
  id v5 = +[UIKeyboardImpl sharedInstance];
  [v5 setActiveLayout:layout];

  v6 = +[UIKeyboardImpl activeInstance];
  v7 = [v6 taskQueue];
  [(UIKeyboardLayout *)self->_layout setTaskQueue:v7];

  v8 = [(UIViewController *)self view];
  objc_super v9 = [v8 window];
  if (v9)
  {
    v10 = [(UIViewController *)self view];
    v11 = [v10 window];
    uint64_t v12 = [v11 interfaceOrientation];
  }
  else
  {
    uint64_t v12 = 1;
  }

  configuration = self->_configuration;
  if (configuration)
  {
    [(STKEmojiAndStickerCollectionViewConfiguration *)configuration keyboardWidth];
    double v15 = v14;
    v16 = [(UIViewController *)self view];
    [v16 bounds];
    +[UIKBScreenTraits traitsForRemoteEmojiKeyboardForHostWidth:[(STKEmojiAndStickerCollectionViewConfiguration *)self->_configuration isKeyboardMinorEdgeWidth] clientWidth:v12 minorEdge:[(STKEmojiAndStickerCollectionViewConfiguration *)self->_configuration userInterfaceIdiom] orientation:[(STKEmojiAndStickerCollectionViewConfiguration *)self->_configuration isInPopover] idiom:v15 isPopover:v17];
  }
  else
  {
    v16 = [(UIViewController *)self view];
    [v16 bounds];
    +[UIKBScreenTraits traitsForPopoverEmulatingWidth:1 minorEdge:v12 orientation:0 idiom:v20];
  }
  v18 = (UIKBScreenTraits *)objc_claimAutoreleasedReturnValue();
  screenTraits = self->_screenTraits;
  self->_screenTraits = v18;

  v21 = [(UIView *)self->_layout _inheritedRenderConfig];
  v22 = v21;
  if (v21)
  {
    id v23 = v21;
  }
  else
  {
    id v23 = +[UIKBRenderConfig defaultConfig];
  }
  v24 = v23;

  v25 = (void *)[v24 copy];
  [v25 setIsFloating:0];
  [(UIKeyboardLayoutStar *)self->_layout showKeyboardWithInputMode:@"emoji" renderConfig:v25 inputTraits:0 screenTraits:self->_screenTraits splitTraits:0];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)UIEmojiAndStickerCollectionViewController;
  [(UIViewController *)&v8 viewWillDisappear:a3];
  [(UIKeyboardLayoutStar *)self->_layout deactivateActiveKeys];
  [(UIKeyboardLayout *)self->_layout setTaskQueue:0];
  v4 = +[UIKeyboardImpl sharedInstance];
  id v5 = [v4 activeLayout];
  layout = self->_layout;

  if (v5 == layout)
  {
    v7 = +[UIKeyboardImpl sharedInstance];
    [v7 setActiveLayout:0];

    +[UIKeyboardImpl releaseSharedInstance];
  }
}

- (void)viewWillLayoutSubviews
{
  v9.receiver = self;
  v9.super_class = (Class)UIEmojiAndStickerCollectionViewController;
  [(UIViewController *)&v9 viewWillLayoutSubviews];
  double v3 = 0.0;
  if ([(STKEmojiAndStickerCollectionViewConfiguration *)self->_configuration userInterfaceIdiom] == 1
    && ([(STKEmojiAndStickerCollectionViewConfiguration *)self->_configuration isInPopover] & 1) == 0)
  {
    v4 = [(UIViewController *)self traitCollection];
    uint64_t v5 = [v4 horizontalSizeClass];

    if (v5 == 2)
    {
      uint64_t v11 = 0;
      uint64_t v12 = &v11;
      uint64_t v13 = 0x2050000000;
      v6 = (void *)_MergedGlobals_1_32;
      uint64_t v14 = _MergedGlobals_1_32;
      if (!_MergedGlobals_1_32)
      {
        v10[0] = MEMORY[0x1E4F143A8];
        v10[1] = 3221225472;
        v10[2] = __getTUIEmojiSearchTextFieldClass_block_invoke_1;
        v10[3] = &unk_1E52D9900;
        v10[4] = &v11;
        __getTUIEmojiSearchTextFieldClass_block_invoke_1((uint64_t)v10);
        v6 = (void *)v12[3];
      }
      id v7 = v6;
      _Block_object_dispose(&v11, 8);
      [v7 preferredHeight];
      double v3 = v8;
    }
  }
  [(UIEmojiAndStickerBackgroundView *)self->_backgroundView setCutoutHeight:v3];
}

- (BOOL)handleHardwareKeyboardEvent:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [[UIKey alloc] initWithKeyboardEvent:v4];

  v6 = [(UIKeyboardLayoutStar *)self->_layout emojiKeyManager];
  id v7 = [v6 inputView];

  LOBYTE(v6) = [v7 handleKeyEvent:v5];
  return (char)v6;
}

- (BOOL)handleKeyEvent:(id)a3
{
  layout = self->_layout;
  id v4 = a3;
  uint64_t v5 = [(UIKeyboardLayoutStar *)layout emojiKeyManager];
  v6 = [v5 inputView];

  LOBYTE(v5) = [v6 handleKeyEvent:v4];
  return (char)v5;
}

- (void)handleKeyUIEvent:(id)a3 dismiss:(BOOL)a4
{
  BOOL v4 = a4;
  id v13 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v7 = v13;
  if (isKindOfClass)
  {
    double v8 = [v13 _modifiedInput];
    if (v8)
    {
      objc_super v9 = [(UIEmojiAndStickerCollectionViewController *)self delegate];
      char v10 = objc_opt_respondsToSelector();

      uint64_t v11 = [(UIEmojiAndStickerCollectionViewController *)self delegate];
      uint64_t v12 = v11;
      if (v10) {
        [v11 didSelectEmoji:v8 dismiss:v4];
      }
      else {
        [v11 didSelectEmoji:v8];
      }
    }
    id v7 = v13;
  }
}

- (void)addNoResultsViewIfNeeded
{
  v24[4] = *MEMORY[0x1E4F143B8];
  if (!self->_noResultsView)
  {
    double v3 = objc_alloc_init(UIEmojiNoResultsView);
    noResultsView = self->_noResultsView;
    self->_noResultsView = v3;

    [(UIView *)self->_noResultsView setTranslatesAutoresizingMaskIntoConstraints:0];
    uint64_t v5 = [(UIViewController *)self view];
    [v5 addSubview:self->_noResultsView];

    v16 = (void *)MEMORY[0x1E4F5B268];
    v22 = [(UIView *)self->_noResultsView topAnchor];
    id v23 = [(UIViewController *)self view];
    v21 = [v23 topAnchor];
    double v20 = [v22 constraintEqualToAnchor:v21];
    v24[0] = v20;
    v18 = [(UIView *)self->_noResultsView bottomAnchor];
    v19 = [(UIViewController *)self view];
    double v17 = [v19 bottomAnchor];
    v6 = [v18 constraintEqualToAnchor:v17];
    v24[1] = v6;
    id v7 = [(UIView *)self->_noResultsView leadingAnchor];
    double v8 = [(UIViewController *)self view];
    objc_super v9 = [v8 leadingAnchor];
    char v10 = [v7 constraintEqualToAnchor:v9];
    v24[2] = v10;
    uint64_t v11 = [(UIView *)self->_noResultsView trailingAnchor];
    uint64_t v12 = [(UIViewController *)self view];
    id v13 = [v12 trailingAnchor];
    uint64_t v14 = [v11 constraintEqualToAnchor:v13];
    v24[3] = v14;
    double v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:4];
    [v16 activateConstraints:v15];
  }
}

- (void)setSearchResults:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4 && ![v4 count])
  {
    [(UIEmojiAndStickerCollectionViewController *)self addNoResultsViewIfNeeded];
    BOOL v6 = 1;
  }
  else
  {
    BOOL v6 = 0;
  }
  [(UIView *)self->_noResultsView setHidden:v6 ^ 1];
  [(UIView *)self->_layout setHidden:v6];
  [(UIEmojiNoResultsView *)self->_noResultsView setSupportsGenmoji:[(STKEmojiAndStickerCollectionViewConfiguration *)self->_configuration doesSupportGenmoji]];
  id v7 = +[UIDevice currentDevice];
  uint64_t v8 = [v7 userInterfaceIdiom];

  if (v8)
  {
    if ([(STKEmojiAndStickerCollectionViewConfiguration *)self->_configuration doesSupportGenmoji])
    {
      char v9 = !v6;
      if (self->_previousShowsNoResultsView) {
        char v9 = 1;
      }
      if (v9)
      {
        char v12 = !self->_previousShowsNoResultsView || v6;
        if (v12) {
          goto LABEL_20;
        }
        uint64_t v10 = +[_UISignalAnalytics getIASignalGenmojiCreationCreateNewEmojiDismissed];
      }
      else
      {
        uint64_t v10 = +[_UISignalAnalytics getIASignalGenmojiCreationCreateNewEmojiButtonShown];
      }
      id v13 = (void *)v10;
      +[_UISignalAnalytics sendGenmojiCreationSignal:v10 payload:0];
    }
LABEL_20:
    self->_previousShowsNoResultsView = v6;
    goto LABEL_21;
  }
  uint64_t v11 = _UISignalAnalyticsLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v16 = 0;
    _os_log_error_impl(&dword_1853B0000, v11, OS_LOG_TYPE_ERROR, "Unexpected idiom in UIEmojiAndStickerCollectionViewController setSearchResults", v16, 2u);
  }

LABEL_21:
  uint64_t v14 = [(UIKeyboardLayoutStar *)self->_layout emojiKeyManager];
  double v15 = [v14 inputView];

  [v15 setSearchResults:v5];
}

- (NSArray)searchResults
{
  v2 = [(UIKeyboardLayoutStar *)self->_layout emojiKeyManager];
  double v3 = [v2 inputView];

  id v4 = [v3 searchResults];

  return (NSArray *)v4;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (STKEmojiAndStickerCollectionViewConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (UIEmojiAndStickerCollectionViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (UIEmojiAndStickerCollectionViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_noResultsView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_screenTraits, 0);
  objc_storeStrong((id *)&self->_layout, 0);
}

@end