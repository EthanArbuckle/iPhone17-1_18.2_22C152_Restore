@interface UIRemoteInputViewHost
- (BOOL)shouldShowDockView;
- (BOOL)updateAssistantViewIfNecessary;
- (BOOL)updateCustomInputViewIfNecessary;
- (UIEdgeInsets)assistantViewInsets;
- (UIInputViewSet)inputViewSet;
- (UIRemoteInputViewInfo)assistantViewInfo;
- (UIRemoteInputViewInfo)inputViewInfo;
- (UIWindow)assistantViewWindow;
- (UIWindow)inputViewWindow;
- (id)remoteAssistantItemForResponder:(id)a3;
- (id)rtiGroupsForBarButtonItemGroups:(id)a3;
- (id)settingsScene;
- (void)setInputViewSet:(id)a3;
- (void)setShouldShowDockView:(BOOL)a3;
- (void)updateInputViewsIfNecessary;
@end

@implementation UIRemoteInputViewHost

- (void)setInputViewSet:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v4 = (UIInputViewSet *)a3;
  v5 = _UIRemoteInputViewHostLogger();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138412290;
    v18 = v4;
    _os_log_impl(&dword_1853B0000, v5, OS_LOG_TYPE_DEFAULT, "UIRemoteInputViewHost, setInputViewSet: %@", (uint8_t *)&v17, 0xCu);
  }

  inputView = self->_inputView;
  if (inputView)
  {
    v7 = [(UIInputViewSet *)v4 hostedCustomInputView];

    if (inputView != v7)
    {
      [(UIViewController *)self->_inputViewController willMoveToParentViewController:0];
      v8 = [(UIViewController *)self->_inputRootViewController view];
      v9 = [(UIViewController *)self->_inputRootViewController view];
      v10 = [v9 constraints];
      [v8 removeConstraints:v10];

      [(UIView *)self->_inputView removeFromSuperview];
      [(UIViewController *)self->_inputViewController removeFromParentViewController];
      inputViewController = self->_inputViewController;
      self->_inputViewController = 0;

      v12 = _UIRemoteInputViewHostLogger();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = self->_inputView;
        int v17 = 138412290;
        v18 = v13;
        _os_log_impl(&dword_1853B0000, v12, OS_LOG_TYPE_DEFAULT, "UIRemoteInputViewHost will nil inputView: %@", (uint8_t *)&v17, 0xCu);
      }

      v14 = self->_inputView;
      self->_inputView = 0;

      inputViewHeightConstraint = self->_inputViewHeightConstraint;
      self->_inputViewHeightConstraint = 0;
    }
  }
  if (!v4) {
    [(UIRemoteInputViewHost *)self setShouldShowDockView:0];
  }
  inputViewSet = self->_inputViewSet;
  self->_inputViewSet = v4;
}

- (UIRemoteInputViewInfo)assistantViewInfo
{
  v3 = objc_alloc_init(UIRemoteInputViewInfo);
  [(UIRemoteInputViewInfo *)v3 setContextId:[(UIWindow *)self->_assistantViewWindow _contextId]];
  v4 = [(UIInputViewSet *)self->_inputViewSet assistantViewController];
  v5 = [v4 view];
  [v5 bounds];
  -[UIRemoteInputViewInfo setSize:](v3, "setSize:", v6, v7);

  if ([(id)objc_opt_class() instancesRespondToSelector:sel_insets])
  {
    v8 = +[UIScreen mainScreen];
    [v8 bounds];
    -[UIRemoteInputViewInfo setInsets:](v3, "setInsets:", v9 * 0.5, 0.0, 50.0, 0.0);
  }
  return v3;
}

- (UIEdgeInsets)assistantViewInsets
{
  v2 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  v3 = [v2 containerRootController];

  v4 = +[UIKeyboardInputModeController sharedInputModeController];
  v5 = [v4 currentInputMode];

  +[UIKeyboardImpl deviceSpecificPaddingForInterfaceOrientation:inputMode:](UIKeyboardImpl, "deviceSpecificPaddingForInterfaceOrientation:inputMode:", [v3 keyboardOrientation], v5);
  double v7 = v6;
  double v9 = v8;
  +[UIKeyboardImpl deviceSpecificStaticHitBufferForInterfaceOrientation:inputMode:](UIKeyboardImpl, "deviceSpecificStaticHitBufferForInterfaceOrientation:inputMode:", [v3 keyboardOrientation], v5);
  double v11 = v7 - v10;
  double v13 = -(v9 - v12);

  double v14 = 0.0;
  double v15 = 0.0;
  double v16 = v11;
  double v17 = v13;
  result.right = v17;
  result.bottom = v15;
  result.left = v16;
  result.top = v14;
  return result;
}

- (BOOL)updateAssistantViewIfNecessary
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  v3 = +[UIScreen mainScreen];
  v4 = +[UIWindowScene _keyboardWindowSceneForScreen:v3 create:1];

  v5 = [(UIRemoteInputViewHost *)self settingsScene];
  [v4 _setSettingsScene:v5];

  double v6 = [(UIInputViewSet *)self->_inputViewSet inputAssistantView];

  assistantViewWindow = self->_assistantViewWindow;
  if (v6)
  {
    if (assistantViewWindow)
    {
      double v8 = [(UIWindow *)assistantViewWindow windowScene];

      if (v8 != v4)
      {
        [(UIWindow *)self->_assistantViewWindow setWindowScene:v4];
        [(UIWindow *)self->_assistantViewWindow setRootViewController:self->_assistantViewController];
      }
    }
    else
    {
      v24 = [[_UIRemoteInputViewHostWindow alloc] initWithWindowScene:v4];
      v25 = self->_assistantViewWindow;
      self->_assistantViewWindow = &v24->super.super.super;

      v26 = objc_alloc_init(_UIRemoteInputViewHostViewController);
      assistantViewController = self->_assistantViewController;
      self->_assistantViewController = &v26->super;

      [(UIWindow *)self->_assistantViewWindow setRootViewController:self->_assistantViewController];
      [(UIWindow *)self->_assistantViewWindow setHidden:0];
    }
    v28 = [(UIInputViewSet *)self->_inputViewSet assistantViewController];
    v29 = [v28 parentViewController];
    v30 = self->_assistantViewController;

    if (v29 != v30)
    {
      v31 = self->_assistantViewController;
      v32 = [(UIInputViewSet *)self->_inputViewSet assistantViewController];
      [(UIViewController *)v31 addChildViewController:v32];

      v33 = [(UIViewController *)self->_assistantViewController view];
      v34 = [(UIInputViewSet *)self->_inputViewSet inputAssistantView];
      [v33 addSubview:v34];

      v35 = [(UIInputViewSet *)self->_inputViewSet assistantViewController];
      [v35 didMoveToParentViewController:self->_assistantViewController];

      v36 = [(UIViewController *)self->_assistantViewController view];
      [v36 setTranslatesAutoresizingMaskIntoConstraints:1];
    }
    v37 = [(UIInputViewSet *)self->_inputViewSet assistantViewController];
    v38 = +[UIKeyboardImpl activeInstance];
    v39 = [v38 delegate];
    [v37 automaticallySetCenterViewControllerBasedOnInputDelegate:v39];

    v40 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
    v41 = [v40 containerRootController];

    [(UIView *)self->_assistantViewWindow bounds];
    double v43 = v42;
    double v45 = v44;
    v46 = [(UIInputViewSet *)self->_inputViewSet inputAssistantView];
    v47 = [v46 traitCollection];
    [v37 preferredHeightForTraitCollection:v47];
    double v49 = v48;

    v50 = +[UIKeyboardImpl activeInstance];
    if ([v50 isMinimized])
    {
      BOOL v51 = +[UIDevice _hasHomeButton];

      if (!v51) {
        double v49 = v49 + 14.0;
      }
    }
    else
    {
    }
    v52 = +[UIScreen mainScreen];
    [v52 bounds];

    v53 = +[UIScreen mainScreen];
    [v53 bounds];
    double v55 = v54;

    [(UIRemoteInputViewHost *)self assistantViewInsets];
    double v58 = v55 - (v56 - v57);
    v59 = [(UIRemoteInputViewHost *)self assistantViewInfo];
    [v59 insets];
    double v61 = v60;

    v62 = [(UIViewController *)self->_assistantViewController view];
    objc_msgSend(v62, "setFrame:", v43, v61, v58, v49);

    v63 = [(UIInputViewSet *)self->_inputViewSet inputAssistantView];
    [v63 setTranslatesAutoresizingMaskIntoConstraints:1];

    v64 = [(UIInputViewSet *)self->_inputViewSet inputAssistantView];
    objc_msgSend(v64, "setFrame:", v43, v45, v58, v49);

    v65 = [v37 view];
    [v65 layoutIfNeeded];

    v66 = [v37 view];
    int v23 = [v66 isHidden] ^ 1;
  }
  else
  {
    double v9 = [(UIWindow *)assistantViewWindow rootViewController];
    double v10 = [v9 childViewControllers];
    uint64_t v11 = [v10 count];

    if (v11)
    {
      long long v70 = 0u;
      long long v71 = 0u;
      long long v68 = 0u;
      long long v69 = 0u;
      double v12 = [(UIWindow *)self->_assistantViewWindow rootViewController];
      double v13 = [v12 childViewControllers];

      uint64_t v14 = [v13 countByEnumeratingWithState:&v68 objects:v72 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v69;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v69 != v16) {
              objc_enumerationMutation(v13);
            }
            v18 = *(void **)(*((void *)&v68 + 1) + 8 * i);
            [v18 willMoveToParentViewController:0];
            uint64_t v19 = [v18 view];
            v20 = [v18 view];
            v21 = [v20 constraints];
            [v19 removeConstraints:v21];

            v22 = [v18 view];
            [v22 removeFromSuperview];

            [v18 removeFromParentViewController];
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v68 objects:v72 count:16];
        }
        while (v15);
      }
    }
    LOBYTE(v23) = 0;
  }

  return v23;
}

- (BOOL)updateCustomInputViewIfNecessary
{
  v3 = +[UIScreen mainScreen];
  v4 = +[UIWindowScene _keyboardWindowSceneForScreen:v3 create:1];

  v5 = [(UIRemoteInputViewHost *)self settingsScene];
  [v4 _setSettingsScene:v5];

  double v6 = [(UIInputViewSet *)self->_inputViewSet hostedCustomInputView];

  if (v6)
  {
    double v7 = [(UIInputViewSet *)self->_inputViewSet hostedCustomInputView];
    double v8 = +[UICompatibilityInputViewController inputViewControllerWithView:v7];
    inputViewController = self->_inputViewController;
    self->_inputViewController = v8;

    inputViewWindow = self->_inputViewWindow;
    if (inputViewWindow)
    {
      uint64_t v11 = [(UIWindow *)self->_inputViewWindow windowScene];

      if (v11 != v4)
      {
        [(UIWindow *)self->_inputViewWindow setWindowScene:v4];
        int v12 = 1;
        goto LABEL_8;
      }
    }
    else
    {
      uint64_t v14 = [[_UIRemoteInputViewHostWindow alloc] initWithWindowScene:v4];
      uint64_t v15 = self->_inputViewWindow;
      self->_inputViewWindow = &v14->super.super.super;

      uint64_t v16 = objc_alloc_init(_UIRemoteInputViewHostViewController);
      inputRootViewController = self->_inputRootViewController;
      self->_inputRootViewController = &v16->super;

      [(UIWindow *)self->_inputViewWindow setHostWindowDelegate:self];
      [(UIWindow *)self->_inputViewWindow setRootViewController:self->_inputRootViewController];
      [(UIWindow *)self->_inputViewWindow setHidden:0];
      v18 = [(UIViewController *)self->_inputRootViewController view];
      [v18 setTranslatesAutoresizingMaskIntoConstraints:0];

      uint64_t v19 = [(UIViewController *)self->_inputRootViewController view];
      v20 = [v19 layer];
      [v20 setHitTestsAsOpaque:1];
    }
    int v12 = 0;
LABEL_8:
    inputView = self->_inputView;
    v22 = [(UIViewController *)self->_inputViewController view];

    if (inputView != v22)
    {
      int v23 = +[UIViewController viewControllerForView:self->_inputView];
      [v23 willMoveToParentViewController:0];
      v24 = [(UIViewController *)self->_inputRootViewController view];
      v25 = [(UIViewController *)self->_inputRootViewController view];
      v26 = [v25 constraints];
      [v24 removeConstraints:v26];

      [(UIView *)self->_inputView removeFromSuperview];
      [v23 removeFromParentViewController];
      v27 = [(UIViewController *)self->_inputViewController view];
      v28 = self->_inputView;
      self->_inputView = v27;

      int v12 = 1;
    }
    v29 = +[UIScreen mainScreen];
    [v29 bounds];
    double v31 = v30;

    if (+[UIKeyboardImpl isFloating])
    {
      +[UIKeyboardImpl floatingWidth];
      double v31 = v32;
    }
    v33 = [(UIView *)self->_inputView superview];
    v34 = [(UIViewController *)self->_inputRootViewController view];

    if (v33 != v34)
    {
      [(UIViewController *)self->_inputViewController willMoveToParentViewController:0];
      v35 = [(UIViewController *)self->_inputRootViewController view];
      v36 = [(UIViewController *)self->_inputRootViewController view];
      v37 = [v36 constraints];
      [v35 removeConstraints:v37];

      [(UIView *)self->_inputView removeFromSuperview];
      [(UIViewController *)self->_inputViewController removeFromParentViewController];
      [(UIViewController *)self->_inputRootViewController addChildViewController:self->_inputViewController];
      v38 = [(UIViewController *)self->_inputRootViewController view];
      [v38 addSubview:self->_inputView];

      [(UIViewController *)self->_inputViewController didMoveToParentViewController:self->_inputRootViewController];
      v39 = [(UIViewController *)self->_inputRootViewController view];
      v40 = [v39 widthAnchor];
      v41 = [v40 constraintEqualToConstant:v31];
      inputViewWidthConstraint = self->_inputViewWidthConstraint;
      self->_inputViewWidthConstraint = v41;

      int v12 = 1;
      [(NSLayoutConstraint *)self->_inputViewWidthConstraint setActive:1];
      double v43 = [(UIViewController *)self->_inputRootViewController view];
      double v44 = [v43 topAnchor];
      double v45 = [(UIView *)self->_inputView topAnchor];
      v46 = [v44 constraintEqualToAnchor:v45];
      [v46 setActive:1];

      v47 = [(UIViewController *)self->_inputRootViewController view];
      double v48 = [v47 bottomAnchor];
      double v49 = [(UIView *)self->_inputView bottomAnchor];
      v50 = [v48 constraintEqualToAnchor:v49];
      inputViewBottomConstraint = self->_inputViewBottomConstraint;
      self->_inputViewBottomConstraint = v50;

      [(NSLayoutConstraint *)self->_inputViewBottomConstraint setActive:1];
      v52 = [(UIViewController *)self->_inputRootViewController view];
      v53 = [v52 leadingAnchor];
      double v54 = [(UIView *)self->_inputView leadingAnchor];
      double v55 = [v53 constraintEqualToAnchor:v54];
      [v55 setActive:1];

      double v56 = [(UIViewController *)self->_inputRootViewController view];
      double v57 = [v56 trailingAnchor];
      double v58 = [(UIView *)self->_inputView trailingAnchor];
      v59 = [v57 constraintEqualToAnchor:v58];
      [v59 setActive:1];

      double v60 = [(UIViewController *)self->_inputRootViewController view];
      double v61 = [v60 bottomAnchor];
      v62 = [(UIView *)self->_inputViewWindow bottomAnchor];
      v63 = [v61 constraintEqualToAnchor:v62];
      [v63 setActive:1];
    }
    if (SubviewUsesClassicLayout(self->_inputView))
    {
      v64 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
      v65 = [v64 containerRootController];
      [v65 sizeForInputViewController:self->_inputViewController inputView:self->_inputView];
      double v67 = v66;

      inputViewHeightConstraint = self->_inputViewHeightConstraint;
      if (inputViewHeightConstraint)
      {
        [(NSLayoutConstraint *)inputViewHeightConstraint setConstant:v67];
      }
      else
      {
        long long v71 = [MEMORY[0x1E4F5B268] constraintWithItem:self->_inputView attribute:8 relatedBy:0 toItem:0 attribute:0 multiplier:0.0 constant:v67];
        LODWORD(v72) = 1148846080;
        [(NSLayoutConstraint *)v71 setPriority:v72];
        [(NSLayoutConstraint *)v71 setIdentifier:@"inputHeight"];
        uint64_t v73 = self->_inputViewHeightConstraint;
        self->_inputViewHeightConstraint = v71;
      }
      long long v69 = self->_inputViewHeightConstraint;
      int v12 = 1;
      uint64_t v70 = 1;
    }
    else
    {
      long long v69 = self->_inputViewHeightConstraint;
      if (!v69) {
        goto LABEL_22;
      }
      uint64_t v70 = 0;
    }
    [(NSLayoutConstraint *)v69 setActive:v70];
LABEL_22:
    BOOL v74 = [(UIRemoteInputViewHost *)self shouldShowDockView];
    double v75 = 75.0;
    if (!v74) {
      double v75 = 0.0;
    }
    [(NSLayoutConstraint *)self->_inputViewBottomConstraint setConstant:v75];
    [(NSLayoutConstraint *)self->_inputViewWidthConstraint setConstant:v31];
    v76 = [(UIRemoteInputViewHost *)self inputViewSet];
    v77 = [v76 hostedCustomInputView];
    [v77 frame];
    double v79 = v78;
    double v81 = v80;

    if (self->_previousInputViewSize.width == v79 && self->_previousInputViewSize.height == v81)
    {
      if (!inputViewWindow) {
        goto LABEL_30;
      }
    }
    else
    {
      self->_previousInputViewSize.width = v79;
      self->_previousInputViewSize.height = v81;
      int v12 = 1;
      if (!inputViewWindow) {
        goto LABEL_30;
      }
    }
    [(UIView *)self->_inputView frame];
    if (v82 != 0.0)
    {
LABEL_31:
      BOOL v13 = v12 != 0;
      goto LABEL_32;
    }
LABEL_30:
    [(UIView *)self->_inputViewWindow layoutIfNeeded];
    int v12 = 1;
    goto LABEL_31;
  }
  BOOL v13 = 0;
LABEL_32:

  return v13;
}

- (void)updateInputViewsIfNecessary
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (+[UIKeyboard usesLocalKeyboard])
  {
    v3 = [(UIInputViewSet *)self->_inputViewSet inputAssistantView];
    [v3 setTranslatesAutoresizingMaskIntoConstraints:0];

    v4 = _UIRemoteInputViewHostLogger();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 67109120;
      BOOL v10 = +[UIKeyboard usesLocalKeyboard];
      _os_log_impl(&dword_1853B0000, v4, OS_LOG_TYPE_DEFAULT, "UIRemoteInputViewHost, updateInputViewsIfNecessary useLocal %d", (uint8_t *)&v9, 8u);
    }
    goto LABEL_8;
  }
  BOOL v5 = [(UIRemoteInputViewHost *)self updateAssistantViewIfNecessary];
  BOOL v6 = [(UIRemoteInputViewHost *)self updateCustomInputViewIfNecessary];
  double v7 = _UIRemoteInputViewHostLogger();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 67109376;
    BOOL v10 = v5;
    __int16 v11 = 1024;
    BOOL v12 = v6;
    _os_log_impl(&dword_1853B0000, v7, OS_LOG_TYPE_DEFAULT, "UIRemoteInputViewHost, assistantViewNeedsUpdate: %d, customInputViewNeedsUpdate: %d", (uint8_t *)&v9, 0xEu);
  }

  if (v5 || v6)
  {
    v4 = +[UIKeyboardImpl activeInstance];
    double v8 = [v4 remoteTextInputPartner];
    [v8 documentTraitsChanged];

LABEL_8:
  }
}

- (UIRemoteInputViewInfo)inputViewInfo
{
  if ([(UIInputViewSet *)self->_inputViewSet isCustomInputView])
  {
    v3 = objc_alloc_init(UIRemoteInputViewInfo);
    [(UIRemoteInputViewInfo *)v3 setContextId:[(UIWindow *)self->_inputViewWindow _contextId]];
    v4 = [(UIViewController *)self->_inputViewController view];
    [v4 frame];
    double v6 = v5;
    double v8 = v7;

    BOOL v9 = [(UIRemoteInputViewHost *)self shouldShowDockView];
    double v10 = -0.0;
    if (v9) {
      double v10 = 75.0;
    }
    double v11 = v8 + v10;
    -[UIRemoteInputViewInfo setSize:](v3, "setSize:", v6, v11);
    [(UIView *)self->_inputViewWindow frame];
    -[UIRemoteInputViewInfo setInsets:](v3, "setInsets:", v12 - v11, 0.0, 0.0, 0.0);
    [(UIRemoteInputViewInfo *)v3 setShouldShowDockView:[(UIRemoteInputViewHost *)self shouldShowDockView]];
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)rtiGroupsForBarButtonItemGroups:(id)a3
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v29 = a3;
  uint64_t v47 = 0;
  double v48 = &v47;
  uint64_t v49 = 0x2050000000;
  v4 = (void *)qword_1EB25F078;
  uint64_t v50 = qword_1EB25F078;
  if (!qword_1EB25F078)
  {
    uint64_t v42 = MEMORY[0x1E4F143A8];
    uint64_t v43 = 3221225472;
    double v44 = __getTUIAssistantButtonSizeProviderClass_block_invoke;
    double v45 = &unk_1E52D9900;
    v46 = &v47;
    __getTUIAssistantButtonSizeProviderClass_block_invoke((uint64_t)&v42);
    v4 = (void *)v48[3];
  }
  double v5 = v4;
  _Block_object_dispose(&v47, 8);
  id v6 = objc_alloc_init(v5);
  if (v6)
  {
    v28 = [(UIInputViewSet *)self->_inputViewSet assistantViewController];
    v27 = objc_msgSend(v28, "styleFromAssistantBarStyle:", objc_msgSend(v28, "assistantBarStyle"));
    [v27 barButtonWidth];
    objc_msgSend(v6, "setBarButtonWidth:");
    double v30 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v29, "count"));
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    obuint64_t j = v29;
    uint64_t v33 = [obj countByEnumeratingWithState:&v38 objects:v52 count:16];
    if (v33)
    {
      uint64_t v32 = *(void *)v39;
      while (2)
      {
        for (uint64_t i = 0; i != v33; ++i)
        {
          if (*(void *)v39 != v32) {
            objc_enumerationMutation(obj);
          }
          double v8 = *(void **)(*((void *)&v38 + 1) + 8 * i);
          if (([v8 isHidden] & 1) == 0)
          {
            id v9 = objc_alloc(MEMORY[0x1E4F1CA48]);
            double v10 = [v8 barButtonItems];
            double v11 = objc_msgSend(v9, "initWithCapacity:", objc_msgSend(v10, "count"));

            uint64_t v47 = 0;
            double v48 = &v47;
            uint64_t v49 = 0x2050000000;
            double v12 = (void *)qword_1EB25F088;
            uint64_t v50 = qword_1EB25F088;
            if (!qword_1EB25F088)
            {
              uint64_t v42 = MEMORY[0x1E4F143A8];
              uint64_t v43 = 3221225472;
              double v44 = __getRTIBarButtonGroupClass_block_invoke;
              double v45 = &unk_1E52D9900;
              v46 = &v47;
              __getRTIBarButtonGroupClass_block_invoke((uint64_t)&v42);
              double v12 = (void *)v48[3];
            }
            uint64_t v13 = v12;
            _Block_object_dispose(&v47, 8);
            id v14 = objc_alloc_init(v13);
            if (!v14)
            {

              id v25 = 0;
              v24 = v30;
              goto LABEL_28;
            }
            uint64_t v15 = [v8 representativeItem];
            [v6 preferredSizeForButtonBarItem:v15];
            *(float *)&double v16 = v16;
            [v14 setRepresentativeItemWidth:v16];

            long long v36 = 0u;
            long long v37 = 0u;
            long long v34 = 0u;
            long long v35 = 0u;
            double v17 = [v8 barButtonItems];
            uint64_t v18 = [v17 countByEnumeratingWithState:&v34 objects:v51 count:16];
            if (v18)
            {
              uint64_t v19 = *(void *)v35;
              do
              {
                for (uint64_t j = 0; j != v18; ++j)
                {
                  if (*(void *)v35 != v19) {
                    objc_enumerationMutation(v17);
                  }
                  v21 = *(void **)(*((void *)&v34 + 1) + 8 * j);
                  if (([v21 isHidden] & 1) == 0)
                  {
                    [v6 preferredSizeForButtonBarItem:v21];
                    *(float *)&double v22 = v22;
                    int v23 = [NSNumber numberWithFloat:v22];
                    [v11 addObject:v23];
                  }
                }
                uint64_t v18 = [v17 countByEnumeratingWithState:&v34 objects:v51 count:16];
              }
              while (v18);
            }

            [v14 setItemWidths:v11];
            [v30 addObject:v14];
          }
        }
        uint64_t v33 = [obj countByEnumeratingWithState:&v38 objects:v52 count:16];
        if (v33) {
          continue;
        }
        break;
      }
    }

    v24 = v30;
    id v25 = v30;
LABEL_28:
  }
  else
  {
    id v25 = 0;
  }

  return v25;
}

- (id)remoteAssistantItemForResponder:(id)a3
{
  id v4 = a3;
  double v5 = [v4 _responderWindow];
  id v6 = [v5 windowScene];
  double v7 = [v6 keyboardSceneDelegate];
  double v8 = [v7 systemInputAssistantViewController];

  if ([v8 _assistantItemsVisibleForResponder:v4]
    && ([v8 observedInputAssistantItem], (uint64_t v9 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    double v10 = (void *)v9;
    double v11 = [v8 observedInputAssistantItem];
  }
  else
  {
    double v11 = [v4 inputAssistantItem];
  }
  uint64_t v31 = 0;
  uint64_t v32 = &v31;
  uint64_t v33 = 0x2050000000;
  double v12 = (void *)getRTIAssistantItemClass_softClass;
  uint64_t v34 = getRTIAssistantItemClass_softClass;
  if (!getRTIAssistantItemClass_softClass)
  {
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __getRTIAssistantItemClass_block_invoke;
    v30[3] = &unk_1E52D9900;
    v30[4] = &v31;
    __getRTIAssistantItemClass_block_invoke((uint64_t)v30);
    double v12 = (void *)v32[3];
  }
  uint64_t v13 = v12;
  _Block_object_dispose(&v31, 8);
  id v14 = objc_alloc_init(v13);
  if (v14)
  {
    objc_msgSend(v14, "setShowsBarButtonItemsInline:", objc_msgSend(v11, "_showsBarButtonItemsInline"));
    if (objc_opt_respondsToSelector())
    {
      uint64_t v15 = [v4 inputDashboardViewController];
      [v14 setShowsInputDashboardViewController:v15 != 0];
    }
    else
    {
      [v14 setShowsInputDashboardViewController:0];
    }
    if ([v14 showsInputDashboardViewController])
    {
      double v16 = [v4 inputDashboardViewController];
      char v17 = objc_opt_respondsToSelector();

      if (v17)
      {
        uint64_t v18 = [v4 inputDashboardViewController];
        uint64_t v19 = [v4 inputDashboardViewController];
        v20 = [v19 traitCollection];
        [v18 preferredWidthForTraitCollection:v20];
        *(float *)&double v21 = v21;
        [v14 setCenterViewPreferredWidth:v21];
      }
    }
    double v22 = [v11 _detachedTintColor];
    [v14 setDetachedTintColor:v22];

    int v23 = [v11 _detachedBackgroundColor];
    [v14 setDetachedBackgroundColor:v23];

    objc_msgSend(v14, "setVisibleWhenMinimized:", objc_msgSend(v11, "_isVisibleWhenMinimized"));
    v24 = [v11 leadingBarButtonGroups];
    id v25 = [(UIRemoteInputViewHost *)self rtiGroupsForBarButtonItemGroups:v24];
    [v14 setLeadingBarButtonGroups:v25];

    v26 = [v11 trailingBarButtonGroups];
    v27 = [(UIRemoteInputViewHost *)self rtiGroupsForBarButtonItemGroups:v26];
    [v14 setTrailingBarButtonGroups:v27];

    id v28 = v14;
  }

  return v14;
}

- (id)settingsScene
{
  v2 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  v3 = [v2 scene];
  if (!v3)
  {
    id v4 = [v2 responder];
    double v5 = [v4 _responderWindow];
    v3 = [v5 windowScene];
  }
  return v3;
}

- (UIWindow)inputViewWindow
{
  return self->_inputViewWindow;
}

- (UIWindow)assistantViewWindow
{
  return self->_assistantViewWindow;
}

- (UIInputViewSet)inputViewSet
{
  return self->_inputViewSet;
}

- (BOOL)shouldShowDockView
{
  return self->_shouldShowDockView;
}

- (void)setShouldShowDockView:(BOOL)a3
{
  self->_shouldShowDockView = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputViewSet, 0);
  objc_storeStrong((id *)&self->_assistantViewWindow, 0);
  objc_storeStrong((id *)&self->_inputViewWindow, 0);
  objc_storeStrong((id *)&self->_assistantViewController, 0);
  objc_storeStrong((id *)&self->_inputViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_inputViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_inputViewWidthConstraint, 0);
  objc_storeStrong((id *)&self->_inputView, 0);
  objc_storeStrong((id *)&self->_inputViewController, 0);
  objc_storeStrong((id *)&self->_inputRootViewController, 0);
}

@end