@interface UIRemoteEmojiAndStickerInputView
- (BOOL)emojiSearchTextField:(id)a3 shouldSendQuery:(id)a4;
- (BOOL)focusingCollectionView;
- (BOOL)handleKeyEvent:(id)a3;
- (BOOL)isInSearchPopover;
- (BOOL)shouldCutAHoleForEmojiSearchField;
- (TUIEmojiSearchInputViewController)emojiSearchInputViewController;
- (TUIEmojiSearchTextField)emojiSearchField;
- (UIRemoteEmojiAndStickerInputView)initWithFrame:(CGRect)a3 keyplane:(id)a4 key:(id)a5 screenTraits:(id)a6;
- (id)contentViewController;
- (id)emojiKeyManager;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)didSelectEditWithStickerIdentifer:(id)a3 sourceRect:(CGRect)a4;
- (void)didSelectEmoji:(id)a3;
- (void)didSelectEmoji:(id)a3 dismiss:(BOOL)a4;
- (void)didSelectPresentPicker;
- (void)didSelectSticker:(id)a3;
- (void)didSelectSticker:(id)a3 dismiss:(BOOL)a4;
- (void)emojiSearchTextFieldDidBecomeActive:(id)a3;
- (void)emojiSearchTextFieldDidBecomeInactive:(id)a3;
- (void)emojiSearchTextFieldWillBecomeActive:(id)a3;
- (void)emojiSearchTextFieldWillBecomeInactive:(id)a3;
- (void)setEmojiKeyManager:(id)a3;
- (void)setEmojiSearchField:(id)a3;
- (void)setEmojiSearchInputViewController:(id)a3;
- (void)setFocusingCollectionView:(BOOL)a3;
- (void)setFrame:(CGRect)a3;
- (void)setIsInSearchPopover:(BOOL)a3;
- (void)willHideStickerEditor;
- (void)willShowStickerEditor;
@end

@implementation UIRemoteEmojiAndStickerInputView

- (UIRemoteEmojiAndStickerInputView)initWithFrame:(CGRect)a3 keyplane:(id)a4 key:(id)a5 screenTraits:(id)a6
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  objc_storeStrong((id *)&self->_keyplane, a4);
  id v14 = a4;
  id v15 = a6;
  id v16 = a5;
  v19.receiver = self;
  v19.super_class = (Class)UIRemoteEmojiAndStickerInputView;
  v17 = -[UIKBViewControllerBackedKeyView initWithFrame:keyplane:key:screenTraits:](&v19, sel_initWithFrame_keyplane_key_screenTraits_, v14, v16, v15, x, y, width, height);

  return v17;
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8 = [(UIKBKeyView *)self screenTraits];
  uint64_t v9 = [v8 orientation];
  if (v8)
  {
    uint64_t v10 = v9;
  }
  else
  {
    v11 = +[UIKeyboard activeKeyboard];
    uint64_t v10 = [v11 interfaceOrientation];

    v12 = +[UIKeyboardImpl keyboardScreen];
    v8 = +[UIKBScreenTraits traitsWithScreen:v12 orientation:v10];
  }
  [(UIKBTree *)self->_keyplane frame];
  if (width != v13 && (!v8 || !v8[35]))
  {
    [(UIKBTree *)self->_keyplane frame];
    CGFloat v15 = (width - v14) * 0.5;
    v26.origin.double x = x;
    v26.origin.double y = y;
    v26.size.double width = width;
    v26.size.double height = height;
    CGRect v27 = CGRectInset(v26, v15, 0.0);
    double x = v27.origin.x;
    double y = v27.origin.y;
    double width = v27.size.width;
    double height = v27.size.height;
    [v8 bounds];
    if (v16 >= 812.0)
    {
      v17 = +[UIScreen mainScreen];
      [v17 bounds];
      double v19 = v18;
      double v21 = v20;

      if (v19 <= v21) {
        double v22 = v21;
      }
      else {
        double v22 = v19;
      }
      if (v19 >= v21) {
        double v23 = v21;
      }
      else {
        double v23 = v19;
      }
      if ((unint64_t)(v10 - 3) >= 2) {
        double v22 = v23;
      }
      CGFloat v24 = (width - v22) * 0.5;
      v28.origin.double x = x;
      v28.origin.double y = y;
      v28.size.double width = width;
      v28.size.double height = height;
      CGRect v29 = CGRectInset(v28, v24, 0.0);
      double x = v29.origin.x;
      double y = v29.origin.y;
      double width = v29.size.width;
      double height = v29.size.height;
    }
  }
  v25.receiver = self;
  v25.super_class = (Class)UIRemoteEmojiAndStickerInputView;
  -[UIView setFrame:](&v25, sel_setFrame_, x, y, width, height);
}

- (id)contentViewController
{
  viewController = self->_viewController;
  if (!viewController)
  {
    uint64_t v22 = 0;
    double v23 = &v22;
    uint64_t v24 = 0x2050000000;
    v4 = (void *)getSTKEmojiAndStickerCollectionViewControllerClass_softClass;
    uint64_t v25 = getSTKEmojiAndStickerCollectionViewControllerClass_softClass;
    if (!getSTKEmojiAndStickerCollectionViewControllerClass_softClass)
    {
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __getSTKEmojiAndStickerCollectionViewControllerClass_block_invoke;
      v21[3] = &unk_1E52D9900;
      v21[4] = &v22;
      __getSTKEmojiAndStickerCollectionViewControllerClass_block_invoke(v21);
      v4 = (void *)v23[3];
    }
    v5 = v4;
    _Block_object_dispose(&v22, 8);
    v6 = (STKEmojiAndStickerCollectionViewController *)objc_alloc_init(v5);
    v7 = self->_viewController;
    self->_viewController = v6;

    [(STKEmojiAndStickerCollectionViewController *)self->_viewController setDelegate:self];
    if ((objc_opt_respondsToSelector() & 1) != 0 && getSTKEmojiAndStickerCollectionViewConfigurationClass())
    {
      id v8 = objc_alloc_init((Class)getSTKEmojiAndStickerCollectionViewConfigurationClass());
      uint64_t v9 = [(UIKBKeyView *)self screenTraits];
      objc_msgSend(v8, "setUserInterfaceIdiom:", objc_msgSend(v9, "idiom"));
      [v9 keyboardWidth];
      objc_msgSend(v8, "setKeyboardWidth:");
      objc_msgSend(v8, "setIsKeyboardMinorEdgeWidth:", objc_msgSend(v9, "isKeyboardMinorEdgeWidth"));
      objc_msgSend(v8, "setIsInPopover:", objc_msgSend(v9, "isInPopover"));
      if (objc_opt_respondsToSelector())
      {
        uint64_t v10 = +[UIKeyboardImpl activeInstance];
        int v11 = [v10 canInsertAdaptiveImageGlyph];

        v12 = +[UIKeyboardImpl activeInstance];
        if ([v12 canPasteImage])
        {
          double v13 = +[UIKeyboardEmojiPreferences sharedInstance];
          unsigned int v14 = [v13 memojiSettingEnabled];
        }
        else
        {
          unsigned int v14 = 0;
        }

        int v15 = MKBGetDeviceLockState();
        if (v15 == 3 || v15 == 0) {
          uint64_t v17 = v11 | v14;
        }
        else {
          uint64_t v17 = 0;
        }
        [v8 setDoesSupportImageGlyph:v17];
      }
      if (objc_opt_respondsToSelector())
      {
        [v9 screenToNativeScaleRatio];
        objc_msgSend(v8, "setScreenToNativeScaleRatio:");
      }
      if (objc_opt_respondsToSelector()) {
        objc_msgSend(v8, "setDoesSupportGenmoji:", objc_msgSend(getTUIEmojiSearchViewClass(), "shouldShowGenmoji"));
      }
      if (objc_opt_respondsToSelector())
      {
        getTUIEmojiSearchViewClass();
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v8, "setDoesSupportStickersApp:", objc_msgSend(getTUIEmojiSearchViewClass(), "isNotificationExtension") ^ 1);
        }
      }
      [(STKEmojiAndStickerCollectionViewController *)self->_viewController setConfiguration:v8];
    }
    double v18 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v18 addObserver:self selector:sel_willShowStickerEditor name:0x1ED148440 object:0];

    double v19 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v19 addObserver:self selector:sel_willHideStickerEditor name:0x1ED148460 object:0];

    viewController = self->_viewController;
  }
  return viewController;
}

- (void)didSelectEmoji:(id)a3
{
}

- (void)didSelectEmoji:(id)a3 dismiss:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ([(UIRemoteEmojiAndStickerInputView *)self isInSearchPopover])
  {
    v7 = +[UIKeyboardImpl activeInstance];
    id v8 = v7;
    if (!v4)
    {
      uint64_t v9 = [v7 inputDelegateManager];

      uint64_t v16 = [v9 shouldRespectForwardingInputDelegate];
      [v9 setShouldRespectForwardingInputDelegate:0];
      [v9 insertText:v6];
      [v9 setShouldRespectForwardingInputDelegate:v16];
      goto LABEL_10;
    }
    [v7 clearForwardingInputDelegateAndResign:0];
  }
  uint64_t v9 = +[UIKeyboardImpl activeInstance];
  uint64_t v10 = [v9 _layout];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v11 = [(UIKBKeyView *)self key];
    v12 = [v10 createKeyEventForStringAction:v6 forKey:v11 inputFlags:0];

    if (qword_1EB25CBA8 != -1) {
      dispatch_once(&qword_1EB25CBA8, &__block_literal_global_177);
    }
    double v13 = [v9 taskQueue];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __59__UIRemoteEmojiAndStickerInputView_didSelectEmoji_dismiss___block_invoke_3;
    v17[3] = &unk_1E52E3628;
    id v18 = v9;
    id v19 = v12;
    uint64_t v14 = _MergedGlobals_3_8;
    id v15 = v12;
    [v13 performSingleTask:v17 breadcrumb:v14];
  }
LABEL_10:
}

void __59__UIRemoteEmojiAndStickerInputView_didSelectEmoji_dismiss___block_invoke()
{
  uint64_t v0 = [&__block_literal_global_85 copy];
  v1 = (void *)_MergedGlobals_3_8;
  _MergedGlobals_3_8 = v0;
}

uint64_t __59__UIRemoteEmojiAndStickerInputView_didSelectEmoji_dismiss___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

uint64_t __59__UIRemoteEmojiAndStickerInputView_didSelectEmoji_dismiss___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _handleKeyEvent:*(void *)(a1 + 40) executionContext:a2];
}

- (void)didSelectSticker:(id)a3
{
}

- (void)didSelectSticker:(id)a3 dismiss:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  id v8 = v5;
  if (v4)
  {
    id v6 = +[UIKeyboardImpl activeInstance];
    [v6 dismissEmojiPopoverIfNecessaryWithCompletion:0];

    id v5 = v8;
  }
  if (v5)
  {
    v7 = +[UIKeyboardImpl activeInstance];
    [v7 insertSticker:v8];

    id v5 = v8;
  }
}

- (void)didSelectEditWithStickerIdentifer:(id)a3 sourceRect:(CGRect)a4
{
  if (a3)
  {
    double height = a4.size.height;
    double width = a4.size.width;
    double y = a4.origin.y;
    double x = a4.origin.x;
    viewController = self->_viewController;
    id v10 = a3;
    id v23 = [(STKEmojiAndStickerCollectionViewController *)viewController childViewControllers];
    int v11 = [v23 firstObject];
    v12 = [(UIView *)self window];
    double v13 = [v11 view];
    objc_msgSend(v12, "convertRect:fromView:", v13, x, y, width, height);
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
    double v21 = v20;

    uint64_t v22 = +[UIKeyboardImpl activeInstance];
    objc_msgSend(v22, "presentStickerEditorWithStickerIdentifier:sourceRect:", v10, v15, v17, v19, v21);
  }
}

- (void)didSelectPresentPicker
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = +[UIKeyboard keyboardBundleIdentifier];
  int v3 = [v2 isEqualToString:@"com.apple.MobileSMS"];

  if (v3)
  {
    id v9 = +[UIKeyboardMediaController sharedKeyboardMediaController];
    [v9 presentCard];
  }
  else
  {
    BOOL v4 = +[UIKeyboardImpl activeInstance];
    id v5 = [v4 inputDelegateManager];

    id v6 = [v5 delegateRespectingForwardingDelegate:0];
    v7 = [v6 textInputView];
    if ([v6 conformsToProtocol:&unk_1ED42F658])
    {
      id v8 = +[UIKeyboardImpl activeInstance];
      objc_msgSend(v8, "handleStickerEvent_presentCard");
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      int v11 = v6;
      _os_log_error_impl(&dword_1853B0000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "responder %@ does not conform to UITextInput. Cannot present stickers.", buf, 0xCu);
    }
  }
}

- (BOOL)handleKeyEvent:(id)a3
{
  id v4 = a3;
  id v5 = [(UIRemoteEmojiAndStickerInputView *)self emojiSearchField];
  id v6 = [v5 markedTextRange];

  if (v6)
  {
    BOOL v7 = 0;
    id v8 = &stru_1ED0E84C0;
  }
  else
  {
    id v9 = [(UIRemoteEmojiAndStickerInputView *)self emojiSearchField];
    id v8 = [v9 text];

    if (([v4 equalsKeyCode:82 modifiers:0x100000] & 1) == 0
      && ([v4 equalsKeyCode:81 modifiers:0x100000] & 1) == 0
      && ([v4 equalsKeyCode:80 modifiers:0x100000] & 1) == 0
      && ([v4 equalsKeyCode:79 modifiers:0x100000] & 1) == 0
      && ([v4 unmodifiedKeyCodeEquals:43] & 1) == 0
      && ([v4 equalsKeyCode:43 modifiers:0x20000] & 1) == 0)
    {
      if (-[__CFString length](v8, "length") && [v4 unmodifiedKeyCodeEquals:81])
      {
        [(UIRemoteEmojiAndStickerInputView *)self setFocusingCollectionView:1];
      }
      else if ([(__CFString *)v8 length] {
             && ![(UIRemoteEmojiAndStickerInputView *)self focusingCollectionView]
      }
             || ([v4 unmodifiedKeyCodeEquals:82] & 1) == 0
             && ([v4 unmodifiedKeyCodeEquals:81] & 1) == 0
             && ([v4 unmodifiedKeyCodeEquals:80] & 1) == 0
             && ([v4 unmodifiedKeyCodeEquals:79] & 1) == 0
             && ([v4 unmodifiedKeyCodeEquals:44] & 1) == 0
             && ![v4 unmodifiedKeyCodeEquals:40])
      {
        BOOL v7 = 0;
        goto LABEL_23;
      }
    }
    if (objc_opt_respondsToSelector()) {
      [(STKEmojiAndStickerCollectionViewController *)self->_viewController handleKeyEvent:v4];
    }
    BOOL v7 = 1;
  }
LABEL_23:

  return v7;
}

- (BOOL)shouldCutAHoleForEmojiSearchField
{
  v2 = [(UIKBKeyView *)self screenTraits];
  BOOL v3 = [v2 idiom] == 1;

  return v3;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  if ([(UIRemoteEmojiAndStickerInputView *)self shouldCutAHoleForEmojiSearchField])
  {
    id v8 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
    id v9 = [v8 systemInputAssistantViewController];
    id v10 = [v9 view];

    -[UIView convertPoint:toView:](self, "convertPoint:toView:", v10, x, y);
    double v12 = v11;
    double v14 = v13;
    if (objc_msgSend(v10, "pointInside:withEvent:", v7))
    {
      uint64_t v15 = objc_msgSend(v10, "hitTest:withEvent:", v7, v12, v14);
      if (v15)
      {
        double v16 = (void *)v15;

        goto LABEL_7;
      }
    }
  }
  v18.receiver = self;
  v18.super_class = (Class)UIRemoteEmojiAndStickerInputView;
  double v16 = -[UIView hitTest:withEvent:](&v18, sel_hitTest_withEvent_, v7, x, y);
LABEL_7:

  return v16;
}

- (void)emojiSearchTextFieldWillBecomeActive:(id)a3
{
  id v5 = [(UIRemoteEmojiAndStickerInputView *)self emojiSearchField];
  id v4 = [(UIKBKeyView *)self renderConfig];
  [v5 _setRenderConfig:v4];
}

- (void)emojiSearchTextFieldDidBecomeActive:(id)a3
{
  id v4 = a3;
  id v5 = +[UIKeyboardInputModeController sharedInputModeController];
  [v5 changePreferredEmojiSearchInputModeForInputDelegate:v4];

  [(UIRemoteEmojiAndStickerInputView *)self setIsInSearchPopover:1];
}

- (void)emojiSearchTextFieldWillBecomeInactive:(id)a3
{
  [(UIRemoteEmojiAndStickerInputView *)self setIsInSearchPopover:0];
  id v3 = +[UIKeyboardImpl activeInstance];
  [v3 clearForwardingInputDelegateAndResign:0];
}

- (void)emojiSearchTextFieldDidBecomeInactive:(id)a3
{
  id v3 = +[UIKeyboardImpl activeInstance];
  [v3 updateAssistantView];

  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 postNotificationName:@"UIKeyboardSwitchedAwayFromEmoji" object:0];

  id v7 = +[UIKeyboardInputModeController sharedInputModeController];
  id v5 = +[UIKeyboardInputModeController sharedInputModeController];
  id v6 = [v5 hardwareInputMode];
  [v7 setCurrentInputMode:v6];
}

- (BOOL)emojiSearchTextField:(id)a3 shouldSendQuery:(id)a4
{
  id v5 = a4;
  if (objc_opt_respondsToSelector()) {
    [(STKEmojiAndStickerCollectionViewController *)self->_viewController searchWithQuery:v5];
  }

  return 0;
}

- (void)willShowStickerEditor
{
  id v3 = [(UIKBKeyView *)self screenTraits];
  int v4 = [v3 isInPopover];

  if (v4)
  {
    [(UIView *)self setAlpha:0.0];
  }
}

- (void)willHideStickerEditor
{
}

- (id)emojiKeyManager
{
  id WeakRetained = objc_loadWeakRetained(&self->_emojiKeyManager);
  return WeakRetained;
}

- (void)setEmojiKeyManager:(id)a3
{
}

- (TUIEmojiSearchInputViewController)emojiSearchInputViewController
{
  return self->_emojiSearchInputViewController;
}

- (void)setEmojiSearchInputViewController:(id)a3
{
}

- (TUIEmojiSearchTextField)emojiSearchField
{
  return self->_emojiSearchField;
}

- (void)setEmojiSearchField:(id)a3
{
}

- (BOOL)isInSearchPopover
{
  return self->_isInSearchPopover;
}

- (void)setIsInSearchPopover:(BOOL)a3
{
  self->_isInSearchPopover = a3;
}

- (BOOL)focusingCollectionView
{
  return self->_focusingCollectionView;
}

- (void)setFocusingCollectionView:(BOOL)a3
{
  self->_focusingCollectionView = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_emojiSearchField, 0);
  objc_storeStrong((id *)&self->_emojiSearchInputViewController, 0);
  objc_destroyWeak(&self->_emojiKeyManager);
  objc_storeStrong((id *)&self->_keyplane, 0);
  objc_storeStrong((id *)&self->_viewController, 0);
}

@end