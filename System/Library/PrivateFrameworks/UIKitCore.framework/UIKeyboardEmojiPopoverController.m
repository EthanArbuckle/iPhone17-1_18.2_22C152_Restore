@interface UIKeyboardEmojiPopoverController
+ (id)visualEffectGroupName;
- (BOOL)handleHardwareKeyboardEvent:(id)a3;
- (BOOL)isPhone;
- (BOOL)wantsDimmingView;
- (CGSize)preferredContentSize;
- (CGSize)preferredContentSizeForPhone;
- (UIKeyboardEmojiPopoverController)initWithTextInputTraits:(id)a3;
- (UIKeyboardEmojiPopoverController)initWithTextInputTraits:(id)a3 hasVerticalScrolling:(BOOL)a4;
- (UIKeyboardEmojiPopoverController)initWithTextInputTraits:(id)a3 taskQueue:(id)a4;
- (UIKeyboardEmojiPopoverController)initWithTextInputTraits:(id)a3 taskQueue:(id)a4 scrollingDirection:(int64_t)a5;
- (UIKeyboardEmojiPopoverController)initWithTextInputTraits:(id)a3 taskQueue:(id)a4 scrollingDirection:(int64_t)a5 window:(id)a6 caretRect:(CGRect)a7;
- (UIKeyboardEmojiPopoverController)initWithTextInputTraits:(id)a3 taskQueue:(id)a4 window:(id)a5;
- (UIKeyboardLayoutStar)layout;
- (double)keyboardHeightAdjustmentForCaretRect:(CGRect)a3 windowSize:(CGSize)a4;
- (double)preferredTextFieldHeight;
- (id)_containerForContainerWindowPortalInteraction;
- (id)keyboardLayout:(id)a3 containingViewForActiveKey:(id)a4 inKeyplaneView:(id)a5;
- (id)keyboardLayout:(id)a3 willChangeRenderConfig:(id)a4;
- (int64_t)overrideUserInterfaceStyle;
- (void)associateEmojiSearchViewWithEmojiInputView;
- (void)configurePopoverPresentationController:(id)a3;
- (void)dealloc;
- (void)keyboardLayout:(id)a3 didSwitchToKeyplane:(id)a4;
- (void)setLayout:(id)a3;
- (void)shouldDismissNotification:(id)a3;
- (void)showKeyboardLayout;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewIsAppearing:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation UIKeyboardEmojiPopoverController

- (UIKeyboardEmojiPopoverController)initWithTextInputTraits:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(UIKeyboardTaskQueue);
  v6 = [(UIKeyboardEmojiPopoverController *)self initWithTextInputTraits:v4 taskQueue:v5];

  return v6;
}

- (UIKeyboardEmojiPopoverController)initWithTextInputTraits:(id)a3 taskQueue:(id)a4
{
  return [(UIKeyboardEmojiPopoverController *)self initWithTextInputTraits:a3 taskQueue:a4 scrollingDirection:0];
}

- (UIKeyboardEmojiPopoverController)initWithTextInputTraits:(id)a3 taskQueue:(id)a4 window:(id)a5
{
  return -[UIKeyboardEmojiPopoverController initWithTextInputTraits:taskQueue:scrollingDirection:window:caretRect:](self, "initWithTextInputTraits:taskQueue:scrollingDirection:window:caretRect:", a3, a4, 0, a5, *MEMORY[0x1E4F1DB20], *(double *)(MEMORY[0x1E4F1DB20] + 8), *(double *)(MEMORY[0x1E4F1DB20] + 16), *(double *)(MEMORY[0x1E4F1DB20] + 24));
}

- (UIKeyboardEmojiPopoverController)initWithTextInputTraits:(id)a3 hasVerticalScrolling:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = objc_alloc_init(UIKeyboardTaskQueue);
  v8 = [(UIKeyboardEmojiPopoverController *)self initWithTextInputTraits:v6 taskQueue:v7 scrollingDirection:v4];

  return v8;
}

- (UIKeyboardEmojiPopoverController)initWithTextInputTraits:(id)a3 taskQueue:(id)a4 scrollingDirection:(int64_t)a5
{
  return -[UIKeyboardEmojiPopoverController initWithTextInputTraits:taskQueue:scrollingDirection:window:caretRect:](self, "initWithTextInputTraits:taskQueue:scrollingDirection:window:caretRect:", a3, a4, a5, 0, *MEMORY[0x1E4F1DB20], *(double *)(MEMORY[0x1E4F1DB20] + 8), *(double *)(MEMORY[0x1E4F1DB20] + 16), *(double *)(MEMORY[0x1E4F1DB20] + 24));
}

- (UIKeyboardEmojiPopoverController)initWithTextInputTraits:(id)a3 taskQueue:(id)a4 scrollingDirection:(int64_t)a5 window:(id)a6 caretRect:(CGRect)a7
{
  double height = a7.size.height;
  double width = a7.size.width;
  double y = a7.origin.y;
  double x = a7.origin.x;
  id v16 = a3;
  id v17 = a4;
  id v18 = a6;
  v30.receiver = self;
  v30.super_class = (Class)UIKeyboardEmojiPopoverController;
  v19 = [(UIKeyboardPopoverController *)&v30 init];
  if (v19)
  {
    v20 = [v18 traitCollection];
    if ([v20 horizontalSizeClass] == 1) {
      double v21 = 320.0;
    }
    else {
      double v21 = 375.0;
    }

    uint64_t v22 = +[UIKBScreenTraits traitsForPopoverEmulatingWidth:1 minorEdge:1 orientation:0 idiom:v21];
    screenTraits = v19->_screenTraits;
    v19->_screenTraits = (UIKBScreenTraits *)v22;

    if (a5 == 1)
    {
      [(UIKBScreenTraits *)v19->_screenTraits setResizeKeyboardHeight:1];
      [v18 bounds];
      -[UIKeyboardEmojiPopoverController keyboardHeightAdjustmentForCaretRect:windowSize:](v19, "keyboardHeightAdjustmentForCaretRect:windowSize:", x, y, width, height, v24, v25);
      -[UIKBScreenTraits setKeyboardHeightAdjustment:](v19->_screenTraits, "setKeyboardHeightAdjustment:");
    }
    [(UIKBScreenTraits *)v19->_screenTraits setPreferredEmojiScrollingDirection:a5];
    objc_storeStrong((id *)&v19->_textInputTraits, a3);
    objc_storeStrong((id *)&v19->_taskQueue, a4);
    v26 = UIKeyboardGetKBStarName(@"emoji", v19->_screenTraits, 0, 0);
    uint64_t v27 = +[UIKeyboardLayoutStar keyboardWithName:v26 screenTraits:v19->_screenTraits];
    keyboard = v19->_keyboard;
    v19->_keyboard = (UIKBTree *)v27;
  }
  return v19;
}

- (void)dealloc
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v3 = self->_hiddenKeys;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v7++) setVisible:1];
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  [(UIKeyboardLayoutStar *)self->_layout setDelegate:0];
  v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v8 removeObserver:self];

  v9.receiver = self;
  v9.super_class = (Class)UIKeyboardEmojiPopoverController;
  [(UIViewController *)&v9 dealloc];
}

- (void)viewDidLoad
{
  v75[5] = *MEMORY[0x1E4F143B8];
  v67.receiver = self;
  v67.super_class = (Class)UIKeyboardEmojiPopoverController;
  [(UIKeyboardPopoverController *)&v67 viewDidLoad];
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel_shouldDismissNotification_ name:@"UIKeyboardEmojiPopoverControllerShouldDismiss" object:0];

  uint64_t v4 = objc_alloc_init(UIKeyboardLayoutStar);
  layout = self->_layout;
  self->_layout = v4;

  [(UIKeyboardLayoutStar *)self->_layout setDelegate:self];
  [(UIKeyboardLayoutStar *)self->_layout setPreventPaddlesForPointerTouches:1];
  [(UIView *)self->_layout setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIKeyboardLayout *)self->_layout setTaskQueue:self->_taskQueue];
  if (!+[UIKeyboard isRemoteEmojiCollectionViewEnabled]) {
    [(UIKeyboardEmojiPopoverController *)self showKeyboardLayout];
  }
  uint64_t v6 = [(UIViewController *)self view];
  [v6 addSubview:self->_layout];

  if ([(UIKeyboardEmojiPopoverController *)self isPhone]) {
    double v7 = -2.0;
  }
  else {
    double v7 = 0.0;
  }
  v8 = [(UIKeyboardLayoutStar *)self->_layout emojiKeyManager];
  if (!v8) {
    goto LABEL_18;
  }
  objc_super v9 = [(UIKeyboardLayoutStar *)self->_layout emojiKeyManager];
  long long v10 = [v9 inputView];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {

    goto LABEL_10;
  }
  BOOL v11 = +[UIKeyboard isRemoteEmojiCollectionViewEnabled];

  if (!v11)
  {
LABEL_18:
    BOOL v29 = [(UIKeyboardEmojiPopoverController *)self isPhone];
LABEL_19:
    objc_super v30 = [(UIView *)self->_layout topAnchor];
    v31 = [(UIViewController *)self view];
    v32 = [v31 safeAreaLayoutGuide];
    v33 = [v32 topAnchor];
    v34 = [v30 constraintEqualToAnchor:v33];
    v74 = v34;
    v65 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v74 count:1];

    goto LABEL_20;
  }
LABEL_10:
  uint64_t v69 = 0;
  v70 = &v69;
  uint64_t v71 = 0x2050000000;
  long long v12 = (void *)getTUIEmojiSearchInputViewControllerClass_softClass;
  uint64_t v72 = getTUIEmojiSearchInputViewControllerClass_softClass;
  if (!getTUIEmojiSearchInputViewControllerClass_softClass)
  {
    v68[0] = MEMORY[0x1E4F143A8];
    v68[1] = 3221225472;
    v68[2] = __getTUIEmojiSearchInputViewControllerClass_block_invoke;
    v68[3] = &unk_1E52D9900;
    v68[4] = &v69;
    __getTUIEmojiSearchInputViewControllerClass_block_invoke((uint64_t)v68);
    long long v12 = (void *)v70[3];
  }
  long long v13 = v12;
  _Block_object_dispose(&v69, 8);
  v14 = (void *)[[v13 alloc] initWithNibName:0 bundle:0];
  objc_storeStrong((id *)&self->_emojiSearchInputViewController, v14);
  uint64_t v15 = [v14 view];
  [v15 setTranslatesAutoresizingMaskIntoConstraints:0];

  [(UIViewController *)self addChildViewController:v14];
  id v16 = [(UIViewController *)self view];
  id v17 = [v14 view];
  [v16 addSubview:v17];

  v63 = [v14 view];
  v55 = [v63 topAnchor];
  v61 = [(UIViewController *)self view];
  v59 = [v61 safeAreaLayoutGuide];
  v57 = [v59 topAnchor];
  v53 = [v55 constraintEqualToAnchor:v57 constant:8.0];
  v75[0] = v53;
  v51 = [(UIView *)self->_layout topAnchor];
  v52 = [v14 view];
  v50 = [v52 bottomAnchor];
  v49 = [v51 constraintEqualToAnchor:v50];
  v75[1] = v49;
  v48 = [v14 view];
  v47 = [v48 leadingAnchor];
  v46 = [(UIView *)self->_layout leadingAnchor];
  id v18 = [v47 constraintEqualToAnchor:v46 constant:v7];
  v75[2] = v18;
  v19 = [(UIView *)self->_layout trailingAnchor];
  v20 = [v14 view];
  double v21 = [v20 trailingAnchor];
  uint64_t v22 = [v19 constraintEqualToAnchor:v21 constant:v7];
  v75[3] = v22;
  v23 = [v14 view];
  double v24 = [v23 heightAnchor];
  [(UIKeyboardEmojiPopoverController *)self preferredTextFieldHeight];
  double v25 = objc_msgSend(v24, "constraintEqualToConstant:");
  v75[4] = v25;
  v65 = [MEMORY[0x1E4F1C978] arrayWithObjects:v75 count:5];

  v26 = [v14 emojiSearchView];
  [v26 setPredictionViewVisible:0];
  [v26 setCollapsed:0];
  uint64_t v27 = [v26 searchTextField];
  [v27 setKeyboardType:122];

  v28 = [v26 searchTextField];
  [v28 setReturnKeyType:9];

  if (objc_opt_respondsToSelector()) {
    [v26 setResultsViewVisible:0];
  }
  if (!+[UIKeyboard isRemoteEmojiCollectionViewEnabled]) {
    [(UIKeyboardEmojiPopoverController *)self associateEmojiSearchViewWithEmojiInputView];
  }

  BOOL v29 = [(UIKeyboardEmojiPopoverController *)self isPhone];
  if (!v65) {
    goto LABEL_19;
  }
LABEL_20:
  if (v29) {
    double v35 = 8.0;
  }
  else {
    double v35 = 0.0;
  }
  v62 = [(UIView *)self->_layout leadingAnchor];
  v66 = [(UIViewController *)self view];
  v64 = [v66 safeAreaLayoutGuide];
  v60 = [v64 leadingAnchor];
  v58 = [v62 constraintEqualToAnchor:v60 constant:v35];
  v73[0] = v58;
  v54 = [(UIView *)self->_layout trailingAnchor];
  v56 = [(UIViewController *)self view];
  v36 = [v56 safeAreaLayoutGuide];
  v37 = [v36 trailingAnchor];
  v38 = [v54 constraintEqualToAnchor:v37 constant:-v35];
  v73[1] = v38;
  v39 = [(UIView *)self->_layout bottomAnchor];
  v40 = [(UIViewController *)self view];
  v41 = [v40 safeAreaLayoutGuide];
  v42 = [v41 bottomAnchor];
  v43 = [v39 constraintEqualToAnchor:v42];
  v73[2] = v43;
  v44 = [MEMORY[0x1E4F1C978] arrayWithObjects:v73 count:3];
  v45 = [v65 arrayByAddingObjectsFromArray:v44];

  [MEMORY[0x1E4F5B268] activateConstraints:v45];
}

- (void)shouldDismissNotification:(id)a3
{
  id v13 = a3;
  uint64_t v4 = [v13 object];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  uint64_t v6 = v13;
  if (isKindOfClass)
  {
    double v7 = [v13 object];
    v8 = [(UIViewController *)self popoverPresentationController];
    objc_super v9 = [v8 containerView];
    long long v10 = [v7 view];
    BOOL v11 = -[UIView _containsView:]((uint64_t)v9, (uint64_t)v10);

    if (v11)
    {
      long long v12 = +[UIKeyboardImpl activeInstance];
      [v12 dismissEmojiPopoverIfNecessaryWithCompletion:0];
    }
    uint64_t v6 = v13;
  }
}

- (void)showKeyboardLayout
{
  v3 = [(UIView *)self->_layout _inheritedRenderConfig];
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = +[UIKBRenderConfig defaultConfig];
  }
  uint64_t v6 = v5;

  id v7 = (id)[v6 copy];
  [v7 setIsFloating:1];
  [(UIKeyboardLayoutStar *)self->_layout showKeyboardWithInputMode:@"emoji" renderConfig:v7 inputTraits:self->_textInputTraits screenTraits:self->_screenTraits splitTraits:0];
}

- (void)associateEmojiSearchViewWithEmojiInputView
{
  v3 = [(UIKeyboardLayoutStar *)self->_layout emojiKeyManager];
  id v7 = [v3 inputView];

  if (v7)
  {
    [(TUIEmojiSearchInputViewController *)self->_emojiSearchInputViewController setDelegate:v7];
    [v7 setEmojiSearchInputViewController:self->_emojiSearchInputViewController];
    uint64_t v4 = [(TUIEmojiSearchInputViewController *)self->_emojiSearchInputViewController emojiSearchView];
    id v5 = [v4 searchTextField];
    [v7 setEmojiSearchField:v5];

    uint64_t v6 = [v4 searchTextField];
    [v6 becomeFirstResponder];
  }
}

- (void)configurePopoverPresentationController:(id)a3
{
  id v3 = a3;
  [v3 setPopoverBackgroundViewClass:objc_opt_class()];
}

- (double)preferredTextFieldHeight
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2050000000;
  v2 = (void *)getTUIEmojiSearchTextFieldClass_softClass;
  uint64_t v9 = getTUIEmojiSearchTextFieldClass_softClass;
  if (!getTUIEmojiSearchTextFieldClass_softClass)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __getTUIEmojiSearchTextFieldClass_block_invoke;
    v5[3] = &unk_1E52D9900;
    v5[4] = &v6;
    __getTUIEmojiSearchTextFieldClass_block_invoke((uint64_t)v5);
    v2 = (void *)v7[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v6, 8);
  [v3 preferredHeight];
  return result;
}

- (CGSize)preferredContentSize
{
  keyboard = self->_keyboard;
  if (keyboard)
  {
    [(UIKBTree *)keyboard frame];
    double v5 = v4;
    double v7 = v6;
  }
  else
  {
    +[UIKeyboardLayoutStar keyboardSizeForInputMode:@"emoji" screenTraits:self->_screenTraits keyboardType:124];
    double v5 = v8;
    double v7 = v9;
  }
  if ([(UIKBScreenTraits *)self->_screenTraits resizeKeyboardHeight])
  {
    [(UIKBScreenTraits *)self->_screenTraits keyboardHeightAdjustment];
    double v7 = v7 + v10;
  }
  [(UIKeyboardEmojiPopoverController *)self preferredTextFieldHeight];
  double v12 = v11;
  if ([(UIKeyboardEmojiPopoverController *)self isPhone])
  {
    [(UIKeyboardEmojiPopoverController *)self preferredContentSizeForPhone];
    double v5 = v14;
  }
  else
  {
    double v13 = v7 + v12 + 8.0;
  }
  double v15 = v5;
  result.double height = v13;
  result.double width = v15;
  return result;
}

- (BOOL)isPhone
{
  v2 = [(UIViewController *)self traitCollection];
  BOOL v3 = [v2 userInterfaceIdiom] == 0;

  return v3;
}

- (CGSize)preferredContentSizeForPhone
{
  BOOL v3 = [(UIKBScreenTraits *)self->_screenTraits screen];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;

  double v8 = [(UIViewController *)self viewIfLoaded];
  double v9 = [v8 window];

  double v10 = [(UIViewController *)self traitCollection];
  uint64_t v11 = [v10 verticalSizeClass];

  [v9 safeAreaInsets];
  double v13 = v12;
  double v15 = v14;
  [v9 safeAreaInsets];
  if (v11 == 1)
  {
    double v18 = (v5 - (v13 + v16)) * 0.5 + -32.0;
    [v9 safeAreaInsets];
    double v20 = v19;
    [v9 safeAreaInsets];
    double v22 = v7 - (v20 + v21);
  }
  else
  {
    double v18 = v5 - (v15 + v17);
    [v9 safeAreaInsets];
    double v24 = v23;
    [v9 safeAreaInsets];
    double v22 = (v7 - (v24 + v25)) * 0.5 + -32.0;
  }

  double v26 = v18;
  double v27 = v22;
  result.double height = v27;
  result.double width = v26;
  return result;
}

- (double)keyboardHeightAdjustmentForCaretRect:(CGRect)a3 windowSize:(CGSize)a4
{
  double height = a4.height;
  CGFloat v5 = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  BOOL IsNull = CGRectIsNull(a3);
  double result = 100.0;
  if (!IsNull && height != 0.0)
  {
    v17.origin.CGFloat x = x;
    v17.origin.CGFloat y = y;
    v17.size.CGFloat width = width;
    v17.size.double height = v5;
    double MinY = CGRectGetMinY(v17);
    v18.origin.CGFloat x = x;
    v18.origin.CGFloat y = y;
    v18.size.CGFloat width = width;
    v18.size.double height = v5;
    double v13 = height - CGRectGetMaxY(v18);
    if (MinY >= v13) {
      double v13 = MinY;
    }
    double v14 = v13 + -66.0;
    if (v14 >= 0.0) {
      double v15 = v14;
    }
    else {
      double v15 = 0.0;
    }
    [(UIKeyboardEmojiPopoverController *)self preferredContentSize];
    double result = v15 - v16;
    if (v15 - v16 > 100.0) {
      double result = 100.0;
    }
    if (result < 0.0) {
      return 0.0;
    }
  }
  return result;
}

- (void)viewIsAppearing:(BOOL)a3
{
  v10.receiver = self;
  v10.super_class = (Class)UIKeyboardEmojiPopoverController;
  [(UIViewController *)&v10 viewIsAppearing:a3];
  double v4 = [(UIViewController *)self presentationController];
  CGFloat v5 = [v4 containerView];

  double v6 = [UIKBViewForResponderForwarding alloc];
  [v5 bounds];
  double v7 = -[UIView initWithFrame:](v6, "initWithFrame:");
  containerForActiveKeys = self->_containerForActiveKeys;
  self->_containerForActiveKeys = v7;

  [(UIKBViewForResponderForwarding *)self->_containerForActiveKeys setResponderForForwarding:self->_layout];
  [v5 addSubview:self->_containerForActiveKeys];
  double v9 = +[UIKeyboardImpl activeInstance];
  [v9 _postInputResponderCapabilitiesChangedNotificationWithOutput:0 selectionChanged:0];
}

- (void)viewDidLayoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)UIKeyboardEmojiPopoverController;
  [(UIViewController *)&v14 viewDidLayoutSubviews];
  if (!self->_shownKeyboardLayout)
  {
    self->_shownKeyboardLayout = 1;
    if (+[UIKeyboard isRemoteEmojiCollectionViewEnabled])
    {
      if (![(UIKeyboardEmojiPopoverController *)self isPhone])
      {
LABEL_9:
        [(UIKeyboardEmojiPopoverController *)self showKeyboardLayout];
        [(UIKeyboardEmojiPopoverController *)self associateEmojiSearchViewWithEmojiInputView];
        return;
      }
      [(UIKBScreenTraits *)self->_screenTraits setResizeKeyboardHeight:0];
      BOOL v3 = [(UIViewController *)self view];
      [v3 bounds];
      double v5 = v4;
      double v7 = v6;

      double v8 = [(UIViewController *)self popoverPresentationController];
      if ([v8 arrowDirection] == 2)
      {
      }
      else
      {
        double v9 = [(UIViewController *)self popoverPresentationController];
        uint64_t v10 = [v9 arrowDirection];

        if (v10 != 1)
        {
LABEL_8:
          uint64_t v11 = [(TUIEmojiSearchInputViewController *)self->_emojiSearchInputViewController emojiSearchView];
          [v11 bounds];
          double v13 = v7 - v12;

          -[UIKBScreenTraits setPreferredContentSizeInPopover:](self->_screenTraits, "setPreferredContentSizeInPopover:", v5 + -12.0, v13);
          goto LABEL_9;
        }
      }
      double v7 = v7 + -13.0;
      goto LABEL_8;
    }
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v12.receiver = self;
  v12.super_class = (Class)UIKeyboardEmojiPopoverController;
  [(UIViewController *)&v12 viewWillDisappear:a3];
  BOOL v4 = +[UIKeyboard isRemoteEmojiCollectionViewEnabled];
  layout = self->_layout;
  if (v4)
  {
    double v6 = [(UIKeyboardLayoutStar *)layout keyplane];
    double v7 = [v6 firstCachedKeyWithName:@"Emoji-InputView-Key"];

    double v8 = [(UIKeyboardLayoutStar *)self->_layout currentKeyplaneView];
    double v9 = [v8 viewForKey:v7];

    [v9 frame];
    objc_msgSend(v9, "setFrame:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
    [(UIView *)self->_layout addSubview:v9];
  }
  else
  {
    [(UIKeyboardLayoutStar *)layout deactivateActiveKeys];
  }
  uint64_t v10 = +[UIKeyboardImpl activeInstance];
  [v10 clearForwardingInputDelegateAndResign:0];

  uint64_t v11 = +[UIKeyboardImpl activeInstance];
  [v11 _postInputResponderCapabilitiesChangedNotificationWithOutput:0 selectionChanged:0];
}

- (UIKeyboardLayoutStar)layout
{
  return self->_layout;
}

- (BOOL)handleHardwareKeyboardEvent:(id)a3
{
  id v4 = a3;
  double v5 = [[UIKey alloc] initWithKeyboardEvent:v4];

  double v6 = [(UIKeyboardLayoutStar *)self->_layout emojiKeyManager];
  double v7 = [v6 inputView];

  LOBYTE(v6) = [v7 handleKeyEvent:v5];
  return (char)v6;
}

- (int64_t)overrideUserInterfaceStyle
{
  v2 = [(UIKeyboardLayoutStar *)self->_layout renderConfig];
  if ([v2 lightKeyboard]) {
    int64_t v3 = 1;
  }
  else {
    int64_t v3 = 2;
  }

  return v3;
}

- (BOOL)wantsDimmingView
{
  return 1;
}

- (void)keyboardLayout:(id)a3 didSwitchToKeyplane:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!self->_hiddenKeys)
  {
    double v8 = [MEMORY[0x1E4F1CA48] array];
    hiddenKeys = self->_hiddenKeys;
    self->_hiddenKeys = v8;
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v10 = [v7 cachedKeysByKeyName:@"Emoji-International-Key"];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v27 != v13) {
          objc_enumerationMutation(v10);
        }
        double v15 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        [v15 setVisible:0];
        [(NSMutableArray *)self->_hiddenKeys addObject:v15];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v12);
  }

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  double v16 = objc_msgSend(v7, "cachedKeysByKeyName:", @"Delete-Key", 0);
  uint64_t v17 = [v16 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v23;
    do
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v23 != v19) {
          objc_enumerationMutation(v16);
        }
        double v21 = *(void **)(*((void *)&v22 + 1) + 8 * j);
        if ([(UITextInputTraits *)self->_textInputTraits keyboardType] != 124)
        {
          [v21 setVisible:0];
          [(NSMutableArray *)self->_hiddenKeys addObject:v21];
        }
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v18);
  }
}

- (id)keyboardLayout:(id)a3 containingViewForActiveKey:(id)a4 inKeyplaneView:(id)a5
{
  return self->_containerForActiveKeys;
}

- (id)_containerForContainerWindowPortalInteraction
{
  return self->_containerForActiveKeys;
}

- (id)keyboardLayout:(id)a3 willChangeRenderConfig:(id)a4
{
  id v4 = a4;
  if (([v4 isFloating] & 1) == 0)
  {
    double v5 = (void *)[v4 copy];

    [v5 setIsFloating:1];
    id v4 = v5;
  }
  return v4;
}

+ (id)visualEffectGroupName
{
  return @"UIKeyboardEmojiPopoverController";
}

- (void)setLayout:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_emojiSearchInputViewController, 0);
  objc_storeStrong((id *)&self->_containerForActiveKeys, 0);
  objc_storeStrong((id *)&self->_hiddenKeys, 0);
  objc_storeStrong((id *)&self->_keyboard, 0);
  objc_storeStrong((id *)&self->_taskQueue, 0);
  objc_storeStrong((id *)&self->_textInputTraits, 0);
  objc_storeStrong((id *)&self->_screenTraits, 0);
  objc_storeStrong((id *)&self->_layout, 0);
}

@end