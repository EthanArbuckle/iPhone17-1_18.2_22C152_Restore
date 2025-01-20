@interface UIInputViewSet
+ (id)emptyInputSet;
+ (id)inputSetWithInputView:(id)a3 accessoryView:(id)a4;
+ (id)inputSetWithInputView:(id)a3 accessoryView:(id)a4 assistantView:(id)a5;
+ (id)inputSetWithKeyboardAndAccessoryView:(id)a3;
+ (id)inputSetWithKeyboardAndAccessoryView:(id)a3 assistantView:(id)a4;
+ (id)inputSetWithOriginalInputSet:(id)a3 duplicateInputView:(BOOL)a4 duplicateInputAccessoryView:(BOOL)a5 duplicateInputAssistantView:(BOOL)a6;
+ (id)inputSetWithPlaceholderAndAccessoryView:(id)a3;
+ (id)inputSetWithPlaceholderAndAccessoryView:(id)a3 assistantView:(id)a4;
+ (id)inputSetWithPlaceholderAndCustomInputView:(id)a3 accessoryView:(id)a4 assistantView:(id)a5;
- (BOOL)__isCKAccessoryView;
- (BOOL)_accessorySuppressesShadow;
- (BOOL)_actLikeInputAccessoryViewSupportsSplit;
- (BOOL)_inputAccessoryViewSupportsSplit;
- (BOOL)_inputViewIsSplit;
- (BOOL)_inputViewIsVisible;
- (BOOL)_inputViewSetSupportsSplit;
- (BOOL)_inputViewSupportsSplit;
- (BOOL)_isFullscreen;
- (BOOL)_isKeyboard;
- (BOOL)canAnimateToInputViewSet:(id)a3;
- (BOOL)containsResponder:(id)a3;
- (BOOL)containsView:(id)a3;
- (BOOL)hasNonPlaceholderViews;
- (BOOL)hierarchyContainsView:(id)a3;
- (BOOL)inSyncWithOrientation:(int64_t)a3 forKeyboard:(id)a4;
- (BOOL)inputViewKeyboardCanSplit;
- (BOOL)isCustomInputView;
- (BOOL)isEmpty;
- (BOOL)isEqual:(id)a3;
- (BOOL)isInputAccessoryViewPlaceholder;
- (BOOL)isInputAssistantViewPlaceholder;
- (BOOL)isInputViewPlaceholder;
- (BOOL)isLocalMinimumHeightInputView;
- (BOOL)isNullInputView;
- (BOOL)isRemoteKeyboard;
- (BOOL)isSplit;
- (BOOL)isStrictSupersetOfViewSet:(id)a3;
- (BOOL)restoreUsingBecomeFirstResponder;
- (BOOL)setAccessoryViewVisible:(BOOL)a3 delay:(double)a4;
- (BOOL)shouldShowDockView;
- (BOOL)usesKeyClicks;
- (BOOL)visible;
- (CGRect)_leftInputViewSetFrame;
- (CGRect)_rightInputViewSetFrame;
- (CGRect)inputAccessoryViewBounds;
- (CGRect)inputAssistantViewBounds;
- (CGRect)inputViewBounds;
- (UIInputViewController)accessoryViewController;
- (UIInputViewController)assistantViewController;
- (UIInputViewController)inputViewController;
- (UIInputViewSet)initWithInputView:(id)a3 accessoryView:(id)a4 assistantView:(id)a5 isKeyboard:(BOOL)a6;
- (UIInputViewSet)initWithInputView:(id)a3 customInputView:(id)a4 accessoryView:(id)a5 assistantView:(id)a6 isKeyboard:(BOOL)a7;
- (UIKBRenderConfig)restorableRenderConfig;
- (UIKeyboard)keyboard;
- (UIResponder)accessoryControllerNextResponder;
- (UIResponder)accessoryViewNextResponder;
- (UIResponder)restorableResponder;
- (UIView)hostedCustomInputView;
- (UIView)inputAccessoryView;
- (UIView)inputAssistantView;
- (UIView)inputView;
- (UIView)layeringView;
- (UIView)splitExemptSubview;
- (double)inputViewSplitHeight;
- (double)splitHeightDelta;
- (id)_splittableInputAccessoryView;
- (id)_themableInputAccessoryView;
- (id)description;
- (id)inputSetWithInputAccessoryViewFromInputSet:(id)a3;
- (id)inputSetWithInputAccessoryViewOnly;
- (id)normalizePlaceholders;
- (int64_t)keyboardOrientation:(id)a3;
- (void)_beginSplitTransitionIfNeeded;
- (void)_endSplitTransitionIfNeeded;
- (void)_forceRestoreUsingBecomeFirstResponder:(BOOL)a3;
- (void)_setRenderConfig:(id)a3;
- (void)_setSplitProgress:(double)a3;
- (void)dealloc;
- (void)inheritNullState:(id)a3;
- (void)refreshPresentation;
- (void)setAccessoryControllerNextResponder:(id)a3;
- (void)setAccessoryViewController:(id)a3;
- (void)setAccessoryViewNextResponder:(id)a3;
- (void)setAssistantViewController:(id)a3;
- (void)setHostedCustomInputView:(id)a3;
- (void)setInputAccessoryView:(id)a3;
- (void)setInputAssistantView:(id)a3;
- (void)setInputView:(id)a3;
- (void)setInputViewController:(id)a3;
- (void)setIsCustomInputView:(BOOL)a3;
- (void)setIsRemoteKeyboard:(BOOL)a3;
- (void)setKeyboardAssistantBar:(id)a3;
- (void)setRestorableRenderConfig:(id)a3;
- (void)setRestorableResponder:(id)a3;
- (void)setRestoreUsingBecomeFirstResponder:(BOOL)a3;
- (void)setShouldShowDockView:(BOOL)a3;
- (void)setSplitHeightDelta:(double)a3;
@end

@implementation UIInputViewSet

- (id)description
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  v22.receiver = self;
  v22.super_class = (Class)UIInputViewSet;
  v4 = [(UIInputViewSet *)&v22 description];
  v5 = [v3 stringWithFormat:@"<%@; ", v4];

  if ([(UIInputViewSet *)self isEmpty])
  {
    v6 = @"(empty)";
LABEL_21:
    [v5 appendString:v6];
    goto LABEL_22;
  }
  if (!self->_inputViewController)
  {
    v9 = [(UIInputViewSet *)self inputView];

    if (v9)
    {
      [v5 appendFormat:@"keyboard = [uninitialized]; "];
      goto LABEL_11;
    }
  }
  v7 = [(UIInputViewSet *)self keyboard];

  if (v7)
  {
    v8 = [(UIInputViewSet *)self keyboard];
    [v5 appendFormat:@"keyboard = %@%%; ", v8];
  }
  else
  {
    v10 = [(UIInputViewSet *)self inputView];

    if (!v10) {
      goto LABEL_11;
    }
    v8 = [(UIInputViewSet *)self inputView];
    v11 = objc_msgSend(v8, "_kb_description");
    [v5 appendFormat:@"view = %@; ", v11];
  }
LABEL_11:
  v12 = [(UIInputViewSet *)self hostedCustomInputView];

  if (v12)
  {
    v13 = [(UIInputViewSet *)self hostedCustomInputView];
    v14 = objc_msgSend(v13, "_kb_description");
    [v5 appendFormat:@"hostedCustomInputView = %@; ", v14];
  }
  v15 = [(UIInputViewSet *)self inputAssistantView];

  if (v15)
  {
    v16 = [(UIInputViewSet *)self inputAssistantView];
    v17 = objc_msgSend(v16, "_kb_description");
    [v5 appendFormat:@"assistant = %@; ", v17];
  }
  v18 = [(UIInputViewSet *)self inputAccessoryView];

  if (v18)
  {
    v19 = [(UIInputViewSet *)self inputAccessoryView];
    v20 = objc_msgSend(v19, "_kb_description");
    [v5 appendFormat:@"accessory = %@; ", v20];
  }
  if (![(UIInputViewSet *)self usesKeyClicks]) {
    [v5 appendString:@"usesKeyClicks = NO;  "];
  }
  if (![(UIInputViewSet *)self visible])
  {
    v6 = @"(not visible)";
    goto LABEL_21;
  }
LABEL_22:
  [v5 appendString:@">"];
  return v5;
}

- (void)setShouldShowDockView:(BOOL)a3
{
  self->_shouldShowDockView = a3;
}

- (void)setIsCustomInputView:(BOOL)a3
{
  self->_isCustomInputView = a3;
}

+ (id)inputSetWithInputView:(id)a3 accessoryView:(id)a4 assistantView:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = [[UIInputViewSet alloc] initWithInputView:v9 accessoryView:v8 assistantView:v7 isKeyboard:0];

  return v10;
}

- (UIInputViewSet)initWithInputView:(id)a3 accessoryView:(id)a4 assistantView:(id)a5 isKeyboard:(BOOL)a6
{
  return [(UIInputViewSet *)self initWithInputView:a3 customInputView:0 accessoryView:a4 assistantView:a5 isKeyboard:a6];
}

- (void)dealloc
{
  accessoryViewController = self->_accessoryViewController;
  self->_accessoryViewController = 0;

  assistantViewController = self->_assistantViewController;
  self->_assistantViewController = 0;

  inputViewController = self->_inputViewController;
  self->_inputViewController = 0;

  v6.receiver = self;
  v6.super_class = (Class)UIInputViewSet;
  [(UIInputViewSet *)&v6 dealloc];
}

- (void)setIsRemoteKeyboard:(BOOL)a3
{
  self->_isRemoteKeyboard = a3;
}

- (void)inheritNullState:(id)a3
{
  self->_isNullInputView = [a3 isNullInputView];
}

- (BOOL)isNullInputView
{
  return self->_isNullInputView;
}

- (BOOL)isSplit
{
  if (![(UIInputViewSet *)self supportsSplit]
    || !+[UIKeyboardImpl isSplit])
  {
    return 0;
  }
  v3 = [(UIInputViewSet *)self inputView];
  BOOL v4 = v3 != 0;

  return v4;
}

- (UIInputViewSet)initWithInputView:(id)a3 customInputView:(id)a4 accessoryView:(id)a5 assistantView:(id)a6 isKeyboard:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v20.receiver = self;
  v20.super_class = (Class)UIInputViewSet;
  v16 = [(UIInputViewSet *)&v20 init];
  if (v16)
  {
    if ([v12 translatesAutoresizingMaskIntoConstraints])
    {
      if (([v12 autoresizingMask] & 0x10) == 0)
      {
        [v12 frame];
        if (v17 <= 0.0)
        {

          id v12 = 0;
          v16->_isNullInputView = 1;
        }
      }
    }
    objc_storeStrong((id *)&v16->_inputAssistantView, a6);
    objc_storeStrong((id *)&v16->_inputAccessoryView, a5);
    objc_storeStrong((id *)&v16->_inputView, v12);
    objc_storeStrong((id *)&v16->_hostedCustomInputView, a4);
    if (v7)
    {
      v18 = [(UIInputViewSet *)v16 keyboard];
      [v18 syncMinimizedStateToHardwareKeyboardAttachedState];
    }
    if ([(UIInputViewSet *)v16 _inputViewSetSupportsSplit])
    {
      +[UIKeyboardImpl refreshRivenStateWithTraits:0 isKeyboard:v7];
      [(UIInputViewSet *)v16 refreshPresentation];
    }
  }

  return v16;
}

- (BOOL)_inputViewSetSupportsSplit
{
  if (!+[UIKeyboardImpl rivenPreference]
    || ![(UIInputViewSet *)self _inputViewSupportsSplit])
  {
    return 0;
  }
  return [(UIInputViewSet *)self _actLikeInputAccessoryViewSupportsSplit];
}

- (BOOL)isInputViewPlaceholder
{
  v2 = [(UIInputViewSet *)self inputView];
  char v3 = objc_opt_respondsToSelector();

  return v3 & 1;
}

- (BOOL)isCustomInputView
{
  return self->_isCustomInputView;
}

- (BOOL)shouldShowDockView
{
  return self->_shouldShowDockView;
}

- (void)setHostedCustomInputView:(id)a3
{
}

- (UIView)hostedCustomInputView
{
  return self->_hostedCustomInputView;
}

- (BOOL)containsResponder:(id)a3
{
  id v4 = a3;
  v5 = [(UIInputViewSet *)self inputView];
  if ([v5 _containsResponder:v4])
  {
    char v6 = 1;
  }
  else
  {
    BOOL v7 = [(UIInputViewSet *)self inputAccessoryView];
    char v6 = [v7 _containsResponder:v4];
  }
  return v6;
}

- (BOOL)isRemoteKeyboard
{
  return self->_isRemoteKeyboard;
}

- (UIKeyboard)keyboard
{
  v2 = [(UIInputViewSet *)self inputViewController];
  char v3 = [v2 _keyboard];

  return (UIKeyboard *)v3;
}

- (BOOL)isEmpty
{
  char v3 = [(UIInputViewSet *)self inputView];
  if (v3)
  {
    BOOL v4 = 0;
  }
  else
  {
    v5 = [(UIInputViewSet *)self inputAssistantView];
    if (v5)
    {
      BOOL v4 = 0;
    }
    else
    {
      char v6 = [(UIInputViewSet *)self inputAccessoryView];
      BOOL v4 = v6 == 0;
    }
  }

  return v4;
}

- (UIView)inputAccessoryView
{
  return self->_inputAccessoryView;
}

- (UIView)inputAssistantView
{
  return self->_inputAssistantView;
}

- (UIInputViewController)inputViewController
{
  if (!self->_inputViewController)
  {
    char v3 = [(UIInputViewSet *)self inputView];

    if (v3)
    {
      BOOL v4 = [(UIInputViewSet *)self inputView];
      v5 = [v4 superview];

      char v6 = [(UIInputViewSet *)self inputView];
      BOOL v7 = +[UICompatibilityInputViewController inputViewControllerWithView:v6];
      inputViewController = self->_inputViewController;
      self->_inputViewController = v7;

      if (v5)
      {
        id v9 = [(UIInputViewSet *)self inputView];
        v10 = [v9 superview];

        if (v5 != v10)
        {
          v11 = +[UIPeripheralHost sharedInstance];
          [v11 removePreservedInputViewSetForInputView:v5];
        }
      }
      id v12 = [(UIViewController *)self->_inputViewController view];
      [(UIInputViewSet *)self setInputView:v12];
    }
  }
  id v13 = self->_inputViewController;
  return v13;
}

- (UIView)inputView
{
  return self->_inputView;
}

- (void)setInputViewController:(id)a3
{
}

- (void)setAssistantViewController:(id)a3
{
}

- (void)setAccessoryViewController:(id)a3
{
}

- (BOOL)isInputAccessoryViewPlaceholder
{
  v2 = [(UIInputViewSet *)self inputAccessoryView];
  char v3 = objc_opt_respondsToSelector();

  return v3 & 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostedCustomInputView, 0);
  objc_destroyWeak((id *)&self->_accessorControllerNextResponder);
  objc_storeStrong((id *)&self->_assistantViewController, 0);
  objc_storeStrong((id *)&self->_accessoryViewController, 0);
  objc_storeStrong((id *)&self->_inputViewController, 0);
  objc_storeStrong((id *)&self->_inputAssistantView, 0);
  objc_storeStrong((id *)&self->_inputAccessoryView, 0);
  objc_storeStrong((id *)&self->_inputView, 0);
  objc_destroyWeak((id *)&self->_accessoryControllerNextResponder);
  objc_destroyWeak((id *)&self->_accessoryViewNextResponder);
  objc_storeStrong((id *)&self->_restorableRenderConfig, 0);
  objc_destroyWeak((id *)&self->_restorableResponder);
}

+ (id)inputSetWithOriginalInputSet:(id)a3 duplicateInputView:(BOOL)a4 duplicateInputAccessoryView:(BOOL)a5 duplicateInputAssistantView:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  BOOL v8 = a4;
  id v9 = a3;
  v10 = v9;
  if (v8 && v7 && v6)
  {
    v11 = (UIInputViewSet *)v9;
    goto LABEL_9;
  }
  v11 = objc_alloc_init(UIInputViewSet);
  if (v8)
  {
    uint64_t v17 = [v10 inputView];
    inputView = v11->_inputView;
    v11->_inputView = (UIView *)v17;

    uint64_t v19 = [v10 inputViewController];
    inputViewController = v11->_inputViewController;
    v11->_inputViewController = (UIInputViewController *)v19;

    v11->_isCustomInputView = [v10 isCustomInputView];
    if (!v7)
    {
LABEL_7:
      if (!v6) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else if (!v7)
  {
    goto LABEL_7;
  }
  uint64_t v21 = [v10 inputAccessoryView];
  inputAccessoryView = v11->_inputAccessoryView;
  v11->_inputAccessoryView = (UIView *)v21;

  uint64_t v23 = [v10 accessoryViewController];
  accessoryViewController = v11->_accessoryViewController;
  v11->_accessoryViewController = (UIInputViewController *)v23;

  if (v6)
  {
LABEL_8:
    uint64_t v12 = [v10 inputAssistantView];
    inputAssistantView = v11->_inputAssistantView;
    v11->_inputAssistantView = (UIView *)v12;

    uint64_t v14 = [v10 assistantViewController];
    assistantViewController = v11->_assistantViewController;
    v11->_assistantViewController = (UIInputViewController *)v14;
  }
LABEL_9:

  return v11;
}

- (BOOL)hasNonPlaceholderViews
{
  char v3 = [(UIInputViewSet *)self inputView];
  if (v3) {
    char v4 = ![(UIInputViewSet *)self isInputViewPlaceholder];
  }
  else {
    char v4 = 0;
  }

  v5 = [(UIInputViewSet *)self inputAssistantView];
  if (v5) {
    int v6 = ![(UIInputViewSet *)self isInputAssistantViewPlaceholder];
  }
  else {
    LOBYTE(v6) = 0;
  }

  BOOL v7 = [(UIInputViewSet *)self inputAccessoryView];
  if (v7) {
    int v8 = ![(UIInputViewSet *)self isInputAccessoryViewPlaceholder];
  }
  else {
    LOBYTE(v8) = 0;
  }

  if (v4) {
    return 1;
  }
  else {
    return v6 | v8;
  }
}

- (BOOL)_inputViewSupportsSplit
{
  if ([(UIInputViewSet *)self _isKeyboard])
  {
    return UIKeyboardSupportsSplit();
  }
  else
  {
    char v4 = 1;
    v5 = NormaliseInputView(self->_inputView, 1);
    if (v5)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        char v4 = [v5 _supportsSplit];
      }
      else {
        char v4 = 0;
      }
    }

    return v4;
  }
}

- (CGRect)inputViewBounds
{
  [(UIView *)self->_inputView _compatibleBounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  if (![(UIInputViewSet *)self _isKeyboard] && [(UIInputViewSet *)self isSplit])
  {
    [(UIView *)self->_inputView leftContentViewSize];
    double v10 = v11;
    [(UIView *)self->_inputView rightContentViewSize];
    if (v10 < v12) {
      double v10 = v12;
    }
    double v6 = 0.0;
    double v4 = 0.0;
  }
  double v13 = v4;
  double v14 = v6;
  double v15 = v8;
  double v16 = v10;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (void)refreshPresentation
{
  BOOL v3 = [(UIInputViewSet *)self isSplit];
  [(UIInputViewSet *)self inputViewBounds];
  double Width = CGRectGetWidth(v28);
  if (Width == 0.0)
  {
    double v5 = +[UIKeyboardImpl activeInstance];
    [v5 bounds];
    double v6 = CGRectGetWidth(v29);
  }
  else
  {
    double v6 = Width;
  }
  double v7 = 0.0;
  double v8 = 0.0;
  if (v3)
  {
    [(UIInputViewSet *)self _leftInputViewSetFrame];
    double v7 = CGRectGetWidth(v30);
    [(UIInputViewSet *)self _rightInputViewSetFrame];
    double v8 = v6 - CGRectGetWidth(v31) - v7;
  }
  if (![(UIInputViewSet *)self _isKeyboard]
    && [(UIInputViewSet *)self _inputViewSupportsSplit])
  {
    [(UIView *)self->_inputView _setLeftOffset:v7 gapWidth:v8];
  }
  if ([(UIInputViewSet *)self _inputAccessoryViewSupportsSplit])
  {
    [(UIView *)self->_inputAccessoryView size];
    if (v9 == 0.0 && v7 != 0.0)
    {
      [(UIInputViewSet *)self inputViewBounds];
      double v10 = CGRectGetWidth(v32);
      [(UIView *)self->_inputAccessoryView size];
      [(UIView *)self->_inputAccessoryView setSize:v10];
    }
    [(UIView *)self->_inputAccessoryView _setLeftOffset:v7 gapWidth:v8];
  }
  double v11 = +[UIKeyboardImpl activeInstance];
  uint64_t v12 = [v11 shouldShowCandidateBar];
  double v13 = +[UIKeyboardImpl activeInstance];
  [v13 setShowsCandidateBar:v12];

  if (+[UIKeyboardImpl isSplit]
    && [(UIInputViewSet *)self _isKeyboard])
  {
    double v14 = +[UIKeyboardImpl activeInstance];
    if ([v14 showsCandidateBar])
    {
    }
    else
    {
      double v15 = +[UIKeyboardImpl activeInstance];
      int v16 = [v15 shouldShowCandidateBar];

      if (!v16) {
        goto LABEL_20;
      }
    }
    [(UIInputViewSet *)self _rightInputViewSetFrame];
    double v17 = v6 - CGRectGetWidth(v33);
    [(UIInputViewSet *)self _leftInputViewSetFrame];
    double v18 = v17 - CGRectGetWidth(v34);
    uint64_t v19 = +[UIKeyboardImpl activeInstance];
    objc_super v20 = [v19 candidateController];
    [v20 setSplitGap:v18];

    uint64_t v21 = +[UIKeyboardImpl activeInstance];
    objc_super v22 = [v21 candidateController];
    [v22 updateStates];
  }
LABEL_20:
  uint64_t v23 = [(UIInputViewSet *)self _splittableInputAccessoryView];

  if (v23)
  {
    v24 = [(UIInputViewSet *)self _splittableInputAccessoryView];
    [v24 didEndSplitTransition];
  }
  if ([(UIInputViewSet *)self _isKeyboard]
    && +[UIKeyboardImpl isFloating]
    && ![(UIInputViewSet *)self isInputViewPlaceholder])
  {
    [(UIInputViewSet *)self inputViewBounds];
    +[UIPeripheralHost adjustFloatingPersistentOffsetForKeyboardSize:](UIPeripheralHost, "adjustFloatingPersistentOffsetForKeyboardSize:", v25, v26);
  }
}

- (BOOL)_isKeyboard
{
  v2 = [(UIInputViewSet *)self keyboard];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)_inputAccessoryViewSupportsSplit
{
  inputAccessoryView = self->_inputAccessoryView;
  if (!inputAccessoryView) {
    return 1;
  }
  char v3 = 1;
  double v4 = NormaliseInputView(inputAccessoryView, 1);
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v4 conformsToProtocol:&unk_1ED50E3A0]) {
      char v3 = [v4 _supportsSplit];
    }
    else {
      char v3 = 0;
    }
  }

  return v3;
}

- (id)_splittableInputAccessoryView
{
  if ([(UIInputViewSet *)self _inputAccessoryViewSupportsSplit])
  {
    char v3 = [(UIInputViewSet *)self inputAccessoryView];
  }
  else
  {
    char v3 = 0;
  }
  return v3;
}

+ (id)emptyInputSet
{
  v2 = (void *)emptyInputSet_EmptySet;
  if (!emptyInputSet_EmptySet)
  {
    char v3 = [[UIInputViewSet alloc] initWithInputView:0 accessoryView:0 assistantView:0 isKeyboard:0];
    double v4 = (void *)emptyInputSet_EmptySet;
    emptyInputSet_EmptySet = (uint64_t)v3;

    v2 = (void *)emptyInputSet_EmptySet;
  }
  return v2;
}

- (void)setRestoreUsingBecomeFirstResponder:(BOOL)a3
{
  self->_restoreUsingBecomeFirstResponder = a3 & ~dyld_program_sdk_at_least();
}

- (void)setRestorableResponder:(id)a3
{
}

- (void)setRestorableRenderConfig:(id)a3
{
}

- (void)setAccessoryViewNextResponder:(id)a3
{
}

- (void)setAccessoryControllerNextResponder:(id)a3
{
}

- (UIResponder)restorableResponder
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_restorableResponder);
  return (UIResponder *)WeakRetained;
}

- (UIResponder)accessoryViewNextResponder
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accessoryViewNextResponder);
  return (UIResponder *)WeakRetained;
}

- (UIInputViewController)accessoryViewController
{
  if (!self->_accessoryViewController)
  {
    char v3 = [(UIInputViewSet *)self inputAccessoryView];

    if (v3)
    {
      double v4 = [(UIInputViewSet *)self inputAccessoryView];
      double v5 = +[UICompatibilityInputViewController inputViewControllerWithView:v4];
      accessoryViewController = self->_accessoryViewController;
      self->_accessoryViewController = v5;

      double v7 = [(UIViewController *)self->_accessoryViewController view];
      [(UIInputViewSet *)self setInputAccessoryView:v7];
    }
  }
  double v8 = self->_accessoryViewController;
  return v8;
}

- (UIResponder)accessoryControllerNextResponder
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accessorControllerNextResponder);
  return (UIResponder *)WeakRetained;
}

- (BOOL)canAnimateToInputViewSet:(id)a3
{
  id v4 = a3;
  if (-[UIInputViewSet isEmpty](self, "isEmpty") || ([v4 isEmpty] & 1) != 0) {
    goto LABEL_3;
  }
  double v7 = [(UIInputViewSet *)self inputAccessoryView];
  double v8 = [v4 inputAccessoryView];
  if (v7 != v8)
  {

LABEL_7:
    BOOL v5 = [(UIInputViewSet *)self isEqual:v4];
    goto LABEL_4;
  }
  uint64_t v9 = [(UIInputViewSet *)self inputView];
  if (v9)
  {
    double v10 = (void *)v9;
    double v11 = [v4 inputView];

    if (v11) {
      goto LABEL_7;
    }
  }
  else
  {
  }
LABEL_3:
  BOOL v5 = 1;
LABEL_4:

  return v5;
}

+ (id)inputSetWithInputView:(id)a3 accessoryView:(id)a4
{
  return (id)[a1 inputSetWithInputView:a3 accessoryView:a4 assistantView:0];
}

+ (id)inputSetWithKeyboardAndAccessoryView:(id)a3 assistantView:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  double v7 = +[UIDevice currentDevice];
  if ([v7 userInterfaceIdiom] == 6)
  {
    BOOL v8 = +[UIKeyboard isKeyboardProcess];

    if (v8)
    {
      uint64_t v9 = [UIInputView alloc];
      double v10 = -[UIInputView initWithFrame:](v9, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      [(UIInputView *)v10 setAllowsSelfSizing:1];
      [(UIView *)v10 setTranslatesAutoresizingMaskIntoConstraints:0];
      double v11 = [(UIView *)v10 heightAnchor];
      uint64_t v12 = [v11 constraintEqualToConstant:0.0];
      [v12 setActive:1];

      double v13 = 0;
      goto LABEL_6;
    }
  }
  else
  {
  }
  double v14 = +[UIKeyboardAutomatic sharedInstance];
  double v13 = +[UICompatibilityInputViewController deferredInputModeControllerWithKeyboard:v14];

  double v10 = [v13 view];
LABEL_6:
  double v15 = [[UIInputViewSet alloc] initWithInputView:v10 accessoryView:v6 assistantView:v5 isKeyboard:1];

  [(UIInputViewSet *)v15 setInputViewController:v13];
  return v15;
}

+ (id)inputSetWithKeyboardAndAccessoryView:(id)a3
{
  return (id)[a1 inputSetWithKeyboardAndAccessoryView:a3 assistantView:0];
}

+ (id)inputSetWithPlaceholderAndAccessoryView:(id)a3
{
  return (id)[a1 inputSetWithPlaceholderAndAccessoryView:a3 assistantView:0];
}

+ (id)inputSetWithPlaceholderAndAccessoryView:(id)a3 assistantView:(id)a4
{
  return (id)[a1 inputSetWithPlaceholderAndCustomInputView:0 accessoryView:a3 assistantView:a4];
}

+ (id)inputSetWithPlaceholderAndCustomInputView:(id)a3 accessoryView:(id)a4 assistantView:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = a3;
  double v10 = +[_UIRemoteKeyboardPlaceholderView placeholderWithWidthSizer:&__block_literal_global_16 heightWithScene:0];
  if (!v7)
  {
    double v11 = +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient];
    [v11 heightForRemoteIAVPlaceholderIfNecessary];
    double v13 = v12;

    if (v13 == 0.0)
    {
      id v7 = 0;
    }
    else
    {
      double v14 = +[UIScreen mainScreen];
      [v14 bounds];
      id v7 = +[_UIRemoteKeyboardPlaceholderView placeholderWithWidth:v15 height:v13];
    }
  }
  int v16 = [[UIInputViewSet alloc] initWithInputView:v10 customInputView:v9 accessoryView:v7 assistantView:v8 isKeyboard:0];

  return v16;
}

double __88__UIInputViewSet_inputSetWithPlaceholderAndCustomInputView_accessoryView_assistantView___block_invoke()
{
  if (+[UIKeyboardImpl isFloating])
  {
    +[UIKeyboardImpl floatingWidth];
  }
  else
  {
    v1 = +[UIScreen mainScreen];
    [v1 bounds];
    double v3 = v2;

    return v3;
  }
  return result;
}

- (UIInputViewController)assistantViewController
{
  if (!self->_assistantViewController)
  {
    double v3 = [(UIInputViewSet *)self inputAssistantView];

    if (v3)
    {
      id v4 = [(UIInputViewSet *)self inputAssistantView];
      id v5 = +[UICompatibilityInputViewController inputViewControllerWithView:v4];
      assistantViewController = self->_assistantViewController;
      self->_assistantViewController = v5;

      id v7 = [(UIViewController *)self->_assistantViewController view];
      [(UIInputViewSet *)self setInputAssistantView:v7];
    }
  }
  id v8 = self->_assistantViewController;
  return v8;
}

- (void)setKeyboardAssistantBar:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  inputAssistantView = self->_inputAssistantView;
  if (!v4)
  {
    if (!inputAssistantView) {
      goto LABEL_9;
    }
    id v13 = 0;
    self->_inputAssistantView = 0;

    assistantViewController = self->_assistantViewController;
    self->_assistantViewController = 0;
    goto LABEL_8;
  }
  if (!inputAssistantView)
  {
    if (self->_inputView)
    {
      id v13 = v4;
      BOOL v7 = [(UIInputViewSet *)self isInputViewPlaceholder];
      id v5 = v13;
      if (!v7)
      {
        id v8 = [(UIInputViewController *)[UICompatibilityInputViewController alloc] initWithNibName:0 bundle:0];
        id v9 = self->_assistantViewController;
        self->_assistantViewController = &v8->super;

        double v10 = [(UIViewController *)self->_assistantViewController view];
        [v10 addSubview:v13];

        double v11 = [(UIViewController *)self->_assistantViewController view];
        assistantViewController = self->_inputAssistantView;
        self->_inputAssistantView = v11;
LABEL_8:

        id v5 = v13;
      }
    }
  }
LABEL_9:
}

- (id)inputSetWithInputAccessoryViewOnly
{
  double v2 = [(UIInputViewSet *)self inputAccessoryView];
  double v3 = +[UIInputViewSet inputSetWithInputView:0 accessoryView:v2];

  return v3;
}

- (id)inputSetWithInputAccessoryViewFromInputSet:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(UIInputViewSet);
  uint64_t v6 = [(UIInputViewSet *)self inputView];
  inputView = v5->_inputView;
  v5->_inputView = (UIView *)v6;

  uint64_t v8 = [(UIInputViewSet *)self inputAssistantView];
  inputAssistantView = v5->_inputAssistantView;
  v5->_inputAssistantView = (UIView *)v8;

  uint64_t v10 = [v4 inputAccessoryView];
  inputAccessoryView = v5->_inputAccessoryView;
  v5->_inputAccessoryView = (UIView *)v10;

  uint64_t v12 = [(UIInputViewSet *)self inputViewController];
  inputViewController = v5->_inputViewController;
  v5->_inputViewController = (UIInputViewController *)v12;

  uint64_t v14 = [(UIInputViewSet *)self assistantViewController];
  assistantViewController = v5->_assistantViewController;
  v5->_assistantViewController = (UIInputViewController *)v14;

  uint64_t v16 = [v4 accessoryViewController];

  accessoryViewController = v5->_accessoryViewController;
  v5->_accessoryViewController = (UIInputViewController *)v16;

  v5->_isCustomInputView = [(UIInputViewSet *)self isCustomInputView];
  v5->_isNullInputView = [(UIInputViewSet *)self isNullInputView];
  v5->_shouldShowDockView = [(UIInputViewSet *)self shouldShowDockView];
  return v5;
}

- (id)normalizePlaceholders
{
  double v3 = objc_alloc_init(UIInputViewSet);
  id v4 = [(UIInputViewSet *)self inputView];
  uint64_t v5 = NormaliseInputView(v4, 0);
  inputView = v3->_inputView;
  v3->_inputView = (UIView *)v5;

  BOOL v7 = [(UIInputViewSet *)self inputAssistantView];
  uint64_t v8 = NormaliseInputView(v7, 0);
  id v9 = v8;
  if (v8)
  {
    uint64_t v10 = v8;
    p_inputAssistantView = (uint64_t *)&v3->_inputAssistantView;
    inputAssistantView = v3->_inputAssistantView;
    v3->_inputAssistantView = v10;
  }
  else
  {
    inputAssistantView = [(UIInputViewSet *)self inputView];
    if (objc_opt_respondsToSelector())
    {
      uint64_t v13 = [inputAssistantView associatedView];
    }
    else
    {
      uint64_t v13 = 0;
    }
    p_inputAssistantView = (uint64_t *)&v3->_inputAssistantView;
    uint64_t v14 = v3->_inputAssistantView;
    v3->_inputAssistantView = (UIView *)v13;
  }
  double v15 = [(UIInputViewSet *)self inputAccessoryView];
  uint64_t v16 = NormaliseInputView(v15, 0);
  inputAccessoryView = v3->_inputAccessoryView;
  v3->_inputAccessoryView = (UIView *)v16;

  double v18 = [(UIInputViewSet *)self inputView];
  uint64_t v19 = (uint64_t)v3->_inputView;
  if (v18 == (void *)v19) {
    [(UIInputViewSet *)self inputViewController];
  }
  else {
  uint64_t v20 = GetInputViewController(v19);
  }
  inputViewController = v3->_inputViewController;
  v3->_inputViewController = (UIInputViewController *)v20;

  objc_super v22 = [(UIInputViewSet *)self assistantViewController];
  if (v22 == v3->_assistantViewController) {
    [(UIInputViewSet *)self assistantViewController];
  }
  else {
  uint64_t v23 = GetInputViewController(*p_inputAssistantView);
  }
  assistantViewController = v3->_assistantViewController;
  v3->_assistantViewController = (UIInputViewController *)v23;

  double v25 = [(UIInputViewSet *)self accessoryViewController];
  if (v25 == v3->_accessoryViewController) {
    [(UIInputViewSet *)self accessoryViewController];
  }
  else {
  uint64_t v26 = GetInputViewController((uint64_t)v3->_inputAccessoryView);
  }
  accessoryViewController = v3->_accessoryViewController;
  v3->_accessoryViewController = (UIInputViewController *)v26;

  v3->_isCustomInputView = [(UIInputViewSet *)self isCustomInputView];
  v3->_isNullInputView = [(UIInputViewSet *)self isNullInputView];
  v3->_shouldShowDockView = [(UIInputViewSet *)self shouldShowDockView];
  return v3;
}

- (void)_setRenderConfig:(id)a3
{
  id v8 = a3;
  id v4 = [(UIInputViewSet *)self keyboard];

  if (v4)
  {
    uint64_t v5 = [(UIInputViewSet *)self keyboard];
    [v5 _setRenderConfig:v8];
  }
  uint64_t v6 = [(UIInputViewSet *)self _themableInputAccessoryView];

  if (v6)
  {
    BOOL v7 = [(UIInputViewSet *)self _themableInputAccessoryView];
    [v7 _setRenderConfig:v8];
  }
}

- (UIView)layeringView
{
  double v3 = [(UIInputViewSet *)self inputView];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(UIInputViewSet *)self inputAccessoryView];
  }
  uint64_t v6 = v5;

  return (UIView *)v6;
}

- (UIView)splitExemptSubview
{
  double v2 = +[UIKeyboardImpl sharedInstance];
  if ([v2 showsCandidateBar])
  {
    double v3 = [v2 candidateController];
    id v4 = [v3 candidateBar];
  }
  else
  {
    id v4 = 0;
  }

  return (UIView *)v4;
}

- (void)_forceRestoreUsingBecomeFirstResponder:(BOOL)a3
{
  self->_restoreUsingBecomeFirstResponder = a3;
}

- (BOOL)restoreUsingBecomeFirstResponder
{
  return self->_restoreUsingBecomeFirstResponder;
}

- (BOOL)containsView:(id)a3
{
  id v4 = a3;
  id v5 = [(UIInputViewSet *)self inputView];
  if (v5 == v4)
  {
    BOOL v8 = 1;
  }
  else
  {
    id v6 = [(UIInputViewSet *)self inputAssistantView];
    if (v6 == v4)
    {
      BOOL v8 = 1;
    }
    else
    {
      id v7 = [(UIInputViewSet *)self inputAccessoryView];
      BOOL v8 = v7 == v4;
    }
  }

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (int v5 = [v4 isRemoteKeyboard], v5 == -[UIInputViewSet isRemoteKeyboard](self, "isRemoteKeyboard")))
  {
    id v7 = [v4 inputView];
    BOOL v8 = [(UIInputViewSet *)self inputView];
    if (v7 == v8 || [v7 isEqual:v8])
    {
      id v9 = [v4 hostedCustomInputView];
      uint64_t v10 = [(UIInputViewSet *)self hostedCustomInputView];
      if (v9 == v10 || [v9 isEqual:v10])
      {
        double v11 = [v4 inputAssistantView];
        uint64_t v12 = [(UIInputViewSet *)self inputAssistantView];
        if (v11 == v12 || [v11 isEqual:v12])
        {
          uint64_t v13 = [v4 inputAccessoryView];
          uint64_t v14 = [(UIInputViewSet *)self inputAccessoryView];
          if (v13 == v14) {
            char v6 = 1;
          }
          else {
            char v6 = [v13 isEqual:v14];
          }
        }
        else
        {
          char v6 = 0;
        }
      }
      else
      {
        char v6 = 0;
      }
    }
    else
    {
      char v6 = 0;
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (BOOL)usesKeyClicks
{
  double v3 = [(UIInputViewSet *)self inputView];
  if (objc_opt_respondsToSelector())
  {
    id v4 = [(UIInputViewSet *)self inputView];
    char v5 = [v4 enableInputClicksWhenVisible];

    if (v5) {
      return 1;
    }
  }
  else
  {
  }
  char v6 = [(UIInputViewSet *)self inputAssistantView];
  if (objc_opt_respondsToSelector())
  {
    id v7 = [(UIInputViewSet *)self inputAssistantView];
    char v8 = [v7 enableInputClicksWhenVisible];

    if (v8) {
      return 1;
    }
  }
  else
  {
  }
  uint64_t v10 = [(UIInputViewSet *)self inputAccessoryView];
  if (objc_opt_respondsToSelector())
  {
    double v11 = [(UIInputViewSet *)self inputAccessoryView];
    char v9 = [v11 enableInputClicksWhenVisible];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (BOOL)_inputViewIsVisible
{
  double v3 = [(UIInputViewSet *)self inputView];
  if (v3)
  {
    id v4 = [(UIInputViewSet *)self keyboard];
    int v5 = [v4 isMinimized] ^ 1;
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (BOOL)visible
{
  double v3 = [(UIInputViewSet *)self inputAccessoryView];
  if (v3) {
    BOOL v4 = 1;
  }
  else {
    BOOL v4 = [(UIInputViewSet *)self _inputViewIsVisible];
  }

  return v4;
}

- (BOOL)isStrictSupersetOfViewSet:(id)a3
{
  id v5 = a3;
  if (([v5 isEqual:self] & 1) == 0)
  {
    id v7 = [v5 inputAccessoryView];
    if (v7)
    {
      char v8 = [v5 inputAccessoryView];
      uint64_t v9 = [(UIInputViewSet *)self inputAccessoryView];
      if (v8 != (void *)v9)
      {
        double v3 = (void *)v9;
        BOOL v6 = 0;
LABEL_12:

LABEL_13:
        goto LABEL_14;
      }
      double v3 = v8;
    }
    uint64_t v10 = [v5 inputView];
    if (v10)
    {
      double v11 = [v5 inputView];
      uint64_t v12 = [(UIInputViewSet *)self inputView];
      BOOL v6 = v11 == v12;
    }
    else
    {
      BOOL v6 = 1;
    }

    char v8 = v3;
    if (!v7) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  BOOL v6 = 0;
LABEL_14:

  return v6;
}

- (int64_t)keyboardOrientation:(id)a3
{
  BOOL v4 = (__objc2_class *)a3;
  if ([(UIInputViewSet *)self _isKeyboard])
  {
    id v5 = [(UIInputViewSet *)self keyboard];
    int64_t v6 = [v5 interfaceOrientation];
  }
  else
  {
    if (v4) {
      id v7 = v4;
    }
    else {
      id v7 = UIKeyboardSceneDelegate;
    }
    int64_t v6 = [(__objc2_class *)v7 interfaceOrientation];
  }

  return v6;
}

- (BOOL)inSyncWithOrientation:(int64_t)a3 forKeyboard:(id)a4
{
  if ([(UIInputViewSet *)self keyboardOrientation:a4] != a3) {
    return 0;
  }
  inputAccessoryView = self->_inputAccessoryView;
  if (!inputAccessoryView) {
    return 1;
  }
  [(UIView *)inputAccessoryView bounds];
  double v8 = v7;
  uint64_t v9 = +[UIScreen mainScreen];
  [v9 bounds];
  double v11 = v10;
  double v13 = v12;

  double v14 = (unint64_t)(a3 - 3) >= 2 ? v11 : v13;
  return v8 == v14;
}

- (BOOL)__isCKAccessoryView
{
  double v3 = [(UIInputViewSet *)self inputAccessoryView];

  if (!v3) {
    return 0;
  }
  BOOL v4 = [(UIInputViewSet *)self inputAccessoryView];
  id v5 = (objc_class *)objc_opt_class();
  Name = class_getName(v5);

  return strcmp(Name, "CKMessageEntryView") == 0;
}

- (BOOL)_isFullscreen
{
  double v2 = +[UITextEffectsWindow sharedTextEffectsWindowForWindowScene:0];
  double v3 = -[UIWindow _fbsScene](v2);
  BOOL v4 = [v3 settings];

  [v4 frame];
  double v6 = v5;
  double v8 = v7;
  [v2 frame];
  if (v10 == v6 && v9 == v8)
  {
    BOOL v14 = 1;
  }
  else
  {
    [v2 frame];
    BOOL v14 = v13 == v6 && v12 == v8;
  }

  return v14;
}

- (BOOL)_actLikeInputAccessoryViewSupportsSplit
{
  if ([(UIInputViewSet *)self _inputAccessoryViewSupportsSplit]) {
    return 1;
  }
  else {
    return ![(UIInputViewSet *)self _isFullscreen];
  }
}

- (BOOL)inputViewKeyboardCanSplit
{
  BOOL v3 = +[UIKeyboardImpl rivenPreference];
  if (v3)
  {
    LOBYTE(v3) = [(UIInputViewSet *)self _inputViewSupportsSplit];
  }
  return v3;
}

- (BOOL)isInputAssistantViewPlaceholder
{
  double v2 = [(UIInputViewSet *)self inputAssistantView];
  char v3 = objc_opt_respondsToSelector();

  return v3 & 1;
}

- (BOOL)isLocalMinimumHeightInputView
{
  BOOL v3 = [(UIInputViewSet *)self isInputViewPlaceholder];
  if (v3)
  {
    BOOL v4 = [(UIInputViewSet *)self inputView];
    char v5 = [v4 isLocalMinimumHeightPlaceholder];

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (BOOL)_inputViewIsSplit
{
  if (![(UIInputViewSet *)self inputViewKeyboardCanSplit]
    || !+[UIKeyboardImpl isSplit])
  {
    return 0;
  }
  BOOL v3 = [(UIInputViewSet *)self inputView];
  BOOL v4 = v3 != 0;

  return v4;
}

- (CGRect)inputAccessoryViewBounds
{
  [(UIView *)self->_inputAccessoryView _compatibleBounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  if ([(UIInputViewSet *)self isSplit]
    && [(UIInputViewSet *)self _inputAccessoryViewSupportsSplit])
  {
    [(UIView *)self->_inputAccessoryView leftContentViewSize];
    double v10 = v11;
    [(UIView *)self->_inputAccessoryView rightContentViewSize];
    if (v10 < v12) {
      double v10 = v12;
    }
    double v6 = 0.0;
    double v4 = 0.0;
  }
  double v13 = v4;
  double v14 = v6;
  double v15 = v8;
  double v16 = v10;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (double)inputViewSplitHeight
{
  if ([(UIInputViewSet *)self _isKeyboard])
  {
    double v3 = +[UIKeyboardImpl activeInstance];
    [v3 frameForKeylayoutName:@"split-left"];
    double v5 = v4;
  }
  else if ([(UIInputViewSet *)self supportsSplit])
  {
    [(UIView *)self->_inputView leftContentViewSize];
    return v6;
  }
  else
  {
    [(UIInputViewSet *)self inputViewBounds];
    return v7;
  }
  return v5;
}

- (CGRect)_leftInputViewSetFrame
{
  if ([(UIInputViewSet *)self _isKeyboard])
  {
    double v3 = +[UIKeyboardImpl activeInstance];
    [v3 frameForKeylayoutName:@"split-left"];
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
  }
  else
  {
    BOOL v12 = [(UIInputViewSet *)self supportsSplit];
    double v5 = *MEMORY[0x1E4F1DAD8];
    double v7 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    if (v12)
    {
      [(UIView *)self->_inputView leftContentViewSize];
      double v9 = v13;
      double v11 = v14;
    }
    else
    {
      [(UIInputViewSet *)self inputViewBounds];
      double v9 = v15 * 0.5;
      [(UIInputViewSet *)self inputViewBounds];
      double v11 = v16;
    }
  }
  double v17 = [(UIInputViewSet *)self inputAccessoryView];

  if (v17)
  {
    if ([(UIInputViewSet *)self isSplit]
      && [(UIInputViewSet *)self _inputAccessoryViewSupportsSplit])
    {
      [(UIView *)self->_inputAccessoryView leftContentViewSize];
      double v11 = v11 + v18;
    }
    else
    {
      [(UIView *)self->_inputAccessoryView bounds];
      double v11 = v11 + v19;
    }
  }
  uint64_t v20 = +[UIKeyboardImpl activeInstance];
  int v21 = [v20 showsCandidateBar];

  if (v21)
  {
    objc_super v22 = +[UIKeyboardImpl activeInstance];
    uint64_t v23 = [v22 candidateController];
    [v23 candidateBarHeight];
    double v11 = v11 + v24;
  }
  double v25 = v5;
  double v26 = v7;
  double v27 = v9;
  double v28 = v11;
  result.size.height = v28;
  result.size.width = v27;
  result.origin.y = v26;
  result.origin.x = v25;
  return result;
}

- (CGRect)_rightInputViewSetFrame
{
  if ([(UIInputViewSet *)self _isKeyboard])
  {
    double v3 = +[UIKeyboardImpl activeInstance];
    [v3 frameForKeylayoutName:@"split-right"];
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
  }
  else
  {
    if ([(UIInputViewSet *)self supportsSplit])
    {
      [(UIView *)self->_inputView rightContentViewSize];
      double v9 = v12;
      double v11 = v13;
      [(UIInputViewSet *)self inputViewBounds];
      double v5 = v14 - v9;
    }
    else
    {
      [(UIInputViewSet *)self inputViewBounds];
      double v5 = v15 * 0.5;
      [(UIInputViewSet *)self inputViewBounds];
      double v9 = v16 * 0.5;
      [(UIInputViewSet *)self inputViewBounds];
      double v11 = v17;
    }
    double v7 = 0.0;
  }
  double v18 = [(UIInputViewSet *)self inputAccessoryView];

  if (v18)
  {
    if ([(UIInputViewSet *)self supportsSplit]
      && [(UIInputViewSet *)self _inputAccessoryViewSupportsSplit])
    {
      [(UIView *)self->_inputAccessoryView rightContentViewSize];
      double v11 = v11 + v19;
    }
    else
    {
      [(UIView *)self->_inputAccessoryView bounds];
      double v11 = v11 + v20;
    }
  }
  int v21 = +[UIKeyboardImpl activeInstance];
  int v22 = [v21 showsCandidateBar];

  if (v22)
  {
    uint64_t v23 = +[UIKeyboardImpl activeInstance];
    double v24 = [v23 candidateController];
    [v24 candidateBarHeight];
    double v11 = v11 + v25;
  }
  double v26 = v5;
  double v27 = v7;
  double v28 = v9;
  double v29 = v11;
  result.size.height = v29;
  result.size.width = v28;
  result.origin.y = v27;
  result.origin.x = v26;
  return result;
}

- (BOOL)hierarchyContainsView:(id)a3
{
  id v4 = a3;
  double v5 = [(UIInputViewSet *)self inputView];
  if (!v5) {
    goto LABEL_6;
  }
  if ([(UIInputViewSet *)self isInputViewPlaceholder])
  {
    uint64_t v6 = [v5 placeheldView];

    double v5 = (void *)v6;
  }
  if ([v4 isDescendantOfView:v5])
  {
    BOOL v7 = 1;
  }
  else
  {
LABEL_6:
    double v8 = [(UIInputViewSet *)self inputAccessoryView];
    if (!v8) {
      goto LABEL_11;
    }
    if ([(UIInputViewSet *)self isInputAccessoryViewPlaceholder])
    {
      uint64_t v9 = [v8 placeheldView];

      double v8 = (void *)v9;
    }
    if ([v4 isDescendantOfView:v8])
    {
      BOOL v7 = 1;
    }
    else
    {
LABEL_11:
      double v10 = [(UIInputViewSet *)self inputAssistantView];
      if (!v10) {
        goto LABEL_16;
      }
      if ([(UIInputViewSet *)self isInputAssistantViewPlaceholder])
      {
        uint64_t v11 = [v10 placeheldView];

        double v10 = (void *)v11;
      }
      if ([v4 isDescendantOfView:v10]) {
        BOOL v7 = 1;
      }
      else {
LABEL_16:
      }
        BOOL v7 = 0;
    }
  }

  return v7;
}

- (BOOL)setAccessoryViewVisible:(BOOL)a3 delay:(double)a4
{
  BOOL v5 = a3;
  uint64_t v6 = [(UIInputViewSet *)self inputAccessoryView];
  BOOL v7 = +[UIKeyboardImpl sharedInstance];
  int v8 = [v7 showsCandidateBar];

  if (v8)
  {
    uint64_t v9 = +[UIKeyboardImpl sharedInstance];
    double v10 = [v9 candidateController];
    uint64_t v11 = [v10 candidateBar];
  }
  else
  {
    uint64_t v11 = 0;
  }
  double v12 = (double)v5;
  if ((!v6 || ([v6 alpha], v13 == v12)) && (!v11 || (objc_msgSend(v11, "alpha"), v14 == v12)))
  {
    BOOL v15 = 0;
  }
  else
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __48__UIInputViewSet_setAccessoryViewVisible_delay___block_invoke;
    v17[3] = &unk_1E52DA070;
    id v18 = v11;
    double v20 = (double)v5;
    id v19 = v6;
    +[UIView animateWithDuration:117440512 delay:v17 options:0 animations:0.15 completion:a4];

    BOOL v15 = 1;
  }

  return v15;
}

uint64_t __48__UIInputViewSet_setAccessoryViewVisible_delay___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:*(double *)(a1 + 48)];
  double v2 = *(double *)(a1 + 48);
  double v3 = *(void **)(a1 + 40);
  return [v3 setAlpha:v2];
}

- (id)_themableInputAccessoryView
{
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    double v3 = self->_inputAccessoryView;
  }
  else {
    double v3 = 0;
  }
  return v3;
}

- (BOOL)_accessorySuppressesShadow
{
  if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1
    || ([(UIInputViewSet *)self inputAccessoryView], (uint64_t v3 = objc_claimAutoreleasedReturnValue()) == 0)
    || (id v4 = (void *)v3, v5 = [(UIInputViewSet *)self __isCKAccessoryView], v4, v5))
  {
    char v6 = 0;
  }
  else
  {
    int v8 = [(UIInputViewSet *)self _splittableInputAccessoryView];
    uint64_t v9 = v8;
    if (v8)
    {
      char isKindOfClass = [v8 _isToolbars];
    }
    else
    {
      uint64_t v11 = [(UIInputViewSet *)self inputAccessoryView];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
    }
    char v6 = isKindOfClass ^ 1;
  }
  return v6 & 1;
}

- (void)_beginSplitTransitionIfNeeded
{
  [(UIInputViewSet *)self _leftInputViewSetFrame];
  double Width = CGRectGetWidth(v10);
  [(UIInputViewSet *)self inputViewBounds];
  double v4 = CGRectGetWidth(v11);
  [(UIInputViewSet *)self _rightInputViewSetFrame];
  double v5 = v4 - CGRectGetWidth(v12) - Width;
  char v6 = +[UIKeyboardImpl activeInstance];
  char v7 = [v6 centerFilled];

  if (![(UIInputViewSet *)self _isKeyboard]
    && [(UIInputViewSet *)self _inputViewSupportsSplit])
  {
    [(UIView *)self->_inputView _beginSplitTransitionIfNeeded:Width gapWidth:v5];
  }
  if ((v7 & 1) == 0 && [(UIInputViewSet *)self _inputAccessoryViewSupportsSplit])
  {
    inputAccessoryView = self->_inputAccessoryView;
    [(UIView *)inputAccessoryView _beginSplitTransitionIfNeeded:Width gapWidth:v5];
  }
}

- (void)_endSplitTransitionIfNeeded
{
  BOOL v3 = [(UIInputViewSet *)self isSplit];
  double v4 = +[UIKeyboardImpl activeInstance];
  char v5 = [v4 centerFilled];

  if (![(UIInputViewSet *)self _isKeyboard]
    && [(UIInputViewSet *)self _inputViewSupportsSplit])
  {
    [(UIView *)self->_inputView _endSplitTransitionIfNeeded:v3];
  }
  if ((v5 & 1) == 0 && [(UIInputViewSet *)self _inputAccessoryViewSupportsSplit])
  {
    inputAccessoryView = self->_inputAccessoryView;
    [(UIView *)inputAccessoryView _endSplitTransitionIfNeeded:v3];
  }
}

- (void)_setSplitProgress:(double)a3
{
  char v5 = +[UIKeyboardImpl activeInstance];
  char v6 = [v5 centerFilled];

  if (![(UIInputViewSet *)self _isKeyboard]
    && [(UIInputViewSet *)self _inputViewSupportsSplit])
  {
    [(UIView *)self->_inputView _setProgress:a3 boundedBy:0.0];
  }
  if ((v6 & 1) == 0 && [(UIInputViewSet *)self _inputAccessoryViewSupportsSplit])
  {
    inputAccessoryView = self->_inputAccessoryView;
    [(UIView *)inputAccessoryView _setProgress:a3 boundedBy:0.25];
  }
}

- (void)setInputView:(id)a3
{
}

- (void)setInputAccessoryView:(id)a3
{
}

- (void)setInputAssistantView:(id)a3
{
}

- (double)splitHeightDelta
{
  return self->_splitHeightDelta;
}

- (void)setSplitHeightDelta:(double)a3
{
  self->_splitHeightDelta = a3;
}

- (UIKBRenderConfig)restorableRenderConfig
{
  return self->_restorableRenderConfig;
}

- (CGRect)inputAssistantViewBounds
{
  double x = self->_inputAssistantViewBounds.origin.x;
  double y = self->_inputAssistantViewBounds.origin.y;
  double width = self->_inputAssistantViewBounds.size.width;
  double height = self->_inputAssistantViewBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

@end