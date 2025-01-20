@interface UISystemInputViewController
+ (BOOL)canUseSystemInputViewControllerForResponder:(id)a3;
+ (id)_canonicalTraitsForResponder:(id)a3;
+ (id)_carPlay_systemInputViewControllerForResponder:(id)a3 editorView:(id)a4 containingResponder:(id)a5 traitCollection:(id)a6;
+ (id)_iOS_systemInputViewControllerForResponder:(id)a3 editorView:(id)a4 containingResponder:(id)a5 traitCollection:(id)a6;
+ (id)_tvOS_systemInputViewControllerForResponder:(id)a3 editorView:(id)a4 containingResponder:(id)a5 traitCollection:(id)a6;
+ (id)systemInputViewControllerForResponder:(id)a3 editorView:(id)a4;
+ (id)systemInputViewControllerForResponder:(id)a3 editorView:(id)a4 containingResponder:(id)a5;
+ (void)setKeyboardInteractionModel:(unint64_t)a3;
- (BOOL)_disableAutomaticKeyboardBehavior;
- (BOOL)didDisplayRecents;
- (BOOL)isAutomaticResponderTransition;
- (BOOL)keyboardCanBecomeFocusedWithZeroAlpha;
- (BOOL)notifyKeyboardOnScreenOnFocusOnly;
- (BOOL)supportsRecentInputsIntegration;
- (BOOL)supportsTouchInput;
- (BOOL)willPresentFullscreen;
- (BOOL)willShowRecentsList;
- (BOOL)willUpdateBackgroundEffectOnInputModeChange;
- (NSArray)editorConstraints;
- (NSArray)horizontalAlignments;
- (NSArray)keyboardConstraints;
- (NSArray)verticalAlignments;
- (UIButton)doneButton;
- (UICompatibilityInputViewController)keyboardVC;
- (UIEdgeInsets)unfocusedFocusGuideOutsets;
- (UIKBSystemLayoutViewController)editorVC;
- (UIKeyboard)keyboard;
- (UILabel)_promptLabel;
- (UILexicon)cachedRecents;
- (UIRecentsInputViewController)recentsVC;
- (UISystemInputViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (UISystemInputViewControllerDelegate)systemInputViewControllerDelegate;
- (UITextInput)nextInputDelegate;
- (UITextInput)persistentDelegate;
- (UITextInputTraits)textInputTraits;
- (UIView)containingView;
- (UIView)contentLayoutView;
- (UIViewController)inputVC;
- (id)_accessoryViewControllerForEdge:(int64_t)a3;
- (id)_remoteInputSessionIdentifier;
- (id)_traitCollectionForUserInterfaceStyle;
- (id)accessoryViewControllerForEdge:(int64_t)a3;
- (id)alignmentConstraintArrayForAxis:(int64_t)a3;
- (id)alignmentConstraintForAxis:(int64_t)a3;
- (id)constraintFromView:(id)a3 attribute:(int64_t)a4 toView:(id)a5 attribute:(int64_t)a6;
- (id)constraintsForEdge:(int64_t)a3;
- (id)doneButtonStringForCurrentInputDelegate;
- (id)preferredFocusEnvironments;
- (id)viewForFocusHeading:(unint64_t)a3 fromView:(id)a4;
- (int64_t)blurEffectStyle;
- (int64_t)resolvedKeyboardStyle;
- (unint64_t)_horizontalLayoutTypeForEdge:(int64_t)a3;
- (unint64_t)_verticalLayoutTypeForEdge:(int64_t)a3;
- (unint64_t)requestedInteractionModel;
- (void)_addAccessoryViewController:(id)a3;
- (void)_addChildInputViewController;
- (void)_clearCursorLocationIfNotFirstResponder;
- (void)_createKeyboardIfNecessary;
- (void)_didSuspend:(id)a3;
- (void)_dismissSystemInputViewController;
- (void)_removeAccessoryViewController:(id)a3;
- (void)_resetDelegate;
- (void)_restoreKeyboardIfNecessary;
- (void)_returnButtonPressed;
- (void)_setNonInputViewVisibility:(BOOL)a3;
- (void)_setSystemInputInteractionActive:(BOOL)a3;
- (void)_willResume:(id)a3;
- (void)_windowDidBecomeApplicationKey:(id)a3;
- (void)_windowWillBecomeApplicationKey:(id)a3;
- (void)configureRecentsVCIfNecessary;
- (void)dealloc;
- (void)didSelectRecentInput;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)findNextInputDelegate;
- (void)inputModeDidChange:(id)a3;
- (void)notifyDelegateWithAccessoryVisibility:(BOOL)a3;
- (void)populateCoreHierarchy;
- (void)prepareForRelease;
- (void)pressesBegan:(id)a3 withEvent:(id)a4;
- (void)pressesCancelled:(id)a3 withEvent:(id)a4;
- (void)pressesEnded:(id)a3 withEvent:(id)a4;
- (void)reloadInputViewsForPersistentDelegate;
- (void)resetContainingResponder;
- (void)setAccessoryViewController:(id)a3 forEdge:(int64_t)a4;
- (void)setAlignmentConstraint:(id)a3 forAxis:(int64_t)a4;
- (void)setAlignmentConstraintArray:(id)a3 forAxis:(int64_t)a4;
- (void)setBlurEffectStyle:(int64_t)a3;
- (void)setCachedRecents:(id)a3;
- (void)setConstraints:(id)a3 forEdge:(int64_t)a4;
- (void)setContainingView:(id)a3;
- (void)setContentLayoutView:(id)a3;
- (void)setDidDisplayRecents:(BOOL)a3;
- (void)setDoneButton:(id)a3;
- (void)setEditorConstraints:(id)a3;
- (void)setEditorVC:(id)a3;
- (void)setHorizontalAlignments:(id)a3;
- (void)setInputVC:(id)a3;
- (void)setIsAutomaticResponderTransition:(BOOL)a3;
- (void)setKeyboard:(id)a3;
- (void)setKeyboardCanBecomeFocusedWithZeroAlpha:(BOOL)a3;
- (void)setKeyboardConstraints:(id)a3;
- (void)setKeyboardVC:(id)a3;
- (void)setNextInputDelegate:(id)a3;
- (void)setNotifyKeyboardOnScreenOnFocusOnly:(BOOL)a3;
- (void)setPersistentDelegate:(id)a3;
- (void)setRecentsVC:(id)a3;
- (void)setRequestedInteractionModel:(unint64_t)a3;
- (void)setResolvedKeyboardStyle:(int64_t)a3;
- (void)setSupportsRecentInputsIntegration:(BOOL)a3;
- (void)setSupportsTouchInput:(BOOL)a3;
- (void)setSystemInputViewControllerDelegate:(id)a3;
- (void)setTextInputTraits:(id)a3;
- (void)setUnfocusedFocusGuideOutsets:(UIEdgeInsets)a3;
- (void)setVerticalAlignments:(id)a3;
- (void)setWillPresentFullscreen:(BOOL)a3;
- (void)setWillUpdateBackgroundEffectOnInputModeChange:(BOOL)a3;
- (void)set_promptLabel:(id)a3;
- (void)setupKeyboard;
- (void)switchToKeyboard;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateAlignmentConstraints;
- (void)updateViewConstraints;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation UISystemInputViewController

+ (void)setKeyboardInteractionModel:(unint64_t)a3
{
  id v4 = +[UIKeyboardImpl sharedInstance];
  [v4 setRequestedInteractionModel:a3];
}

+ (BOOL)canUseSystemInputViewControllerForResponder:(id)a3
{
  id v3 = a3;
  if (![v3 conformsToProtocol:&unk_1ED42F658]
    || ([v3 _disableAutomaticKeyboardUI] & 1) != 0
    || (+[UIDevice currentDevice],
        id v4 = objc_claimAutoreleasedReturnValue(),
        char v5 = [v4 _isHardwareKeyboardAvailable],
        v4,
        (v5 & 1) != 0))
  {
    BOOL v6 = 0;
  }
  else
  {
    v8 = [v3 traitCollection];
    v9 = v8;
    if (v8)
    {
      id v10 = v8;
    }
    else
    {
      v11 = [v3 _responderWindow];
      v12 = [v11 screen];
      id v10 = [v12 traitCollection];
    }
    BOOL v6 = [v10 userInterfaceIdiom] == 2;
  }
  return v6;
}

+ (id)systemInputViewControllerForResponder:(id)a3 editorView:(id)a4
{
  return (id)[a1 systemInputViewControllerForResponder:a3 editorView:a4 containingResponder:a3];
}

+ (id)systemInputViewControllerForResponder:(id)a3 editorView:(id)a4 containingResponder:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = [v10 _disableAutomaticKeyboardUI];
  int v12 = [v8 conformsToProtocol:&unk_1ED42F658];
  if (v11
    && v12
    && ([v9 window], v13 = objc_claimAutoreleasedReturnValue(), v13, v13))
  {
    id v14 = 0;
  }
  else
  {
    v15 = [v10 traitCollection];
    if (!v15)
    {
      v16 = [v10 _responderWindow];
      v17 = [v16 screen];
      v15 = [v17 traitCollection];

      int v18 = v15 ? 0 : v11;
      if (v18 == 1)
      {
        v19 = +[UIScreen mainScreen];
        v15 = [v19 traitCollection];
      }
    }
    uint64_t v20 = [v15 userInterfaceIdiom];
    v21 = 0;
    switch(v20)
    {
      case 0:
      case 1:
        v21 = objc_msgSend(a1, "_iOS_systemInputViewControllerForResponder:editorView:containingResponder:traitCollection:", v8, v9, v10, v15);
        break;
      case 2:
      case 8:
        v21 = objc_msgSend(a1, "_tvOS_systemInputViewControllerForResponder:editorView:containingResponder:traitCollection:", v8, v9, v10, v15);
        break;
      case 3:
        v21 = objc_msgSend(a1, "_carPlay_systemInputViewControllerForResponder:editorView:containingResponder:traitCollection:", v8, v9, v10, v15);
        break;
      default:
        break;
    }
    id v14 = v21;
  }
  return v14;
}

+ (id)_carPlay_systemInputViewControllerForResponder:(id)a3 editorView:(id)a4 containingResponder:(id)a5 traitCollection:(id)a6
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if ([v13 userInterfaceIdiom] == 3)
  {
    int v14 = [v12 _disableAutomaticKeyboardUI];
    if ([v10 conformsToProtocol:&unk_1ED42F658]) {
      v15 = v10;
    }
    else {
      v15 = 0;
    }
    id v16 = v15;
    uint64_t v17 = [objc_alloc((Class)a1) initWithNibName:0 bundle:0];
    objc_msgSend((id)v17, "setSupportsTouchInput:", objc_msgSend(v13, "primaryInteractionModel") & 1);
    [(id)v17 setPersistentDelegate:v16];
    [(id)v17 setWillUpdateBackgroundEffectOnInputModeChange:0];
    [(id)v17 setIsAutomaticResponderTransition:__automaticNextFocusResponder == (void)v10];
    *(unsigned char *)(v17 + 1025) = v14 ^ 1;
    *(void *)(v17 + 1000) = v12;
    v45 = v16;
    v43 = +[UITextInputTraits traitsByAdoptingTraits:v16];
    objc_msgSend((id)v17, "setTextInputTraits:");
    int v18 = [(id)v17 textInputTraits];
    uint64_t v19 = [v18 keyboardAppearance];

    if ((unint64_t)(v19 - 1) > 9) {
      uint64_t v20 = 1000;
    }
    else {
      uint64_t v20 = qword_186B99490[v19 - 1];
    }
    [(id)v17 setBlurEffectStyle:v20];
    v21 = [UIKBFocusVCView alloc];
    v22 = -[UIView initWithFrame:](v21, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [(UIView *)v22 setTranslatesAutoresizingMaskIntoConstraints:0];
    v23 = +[UIColor tableBackgroundColor];
    [(UIView *)v22 setBackgroundColor:v23];

    [(id)v17 setView:v22];
    [(id)v17 setContainingView:v22];
    v46 = [MEMORY[0x1E4F1CA48] array];
    if (v11)
    {
      v24 = +[UIViewController viewControllerForView:v11];
      if (!v24)
      {
        v24 = [[UIViewController alloc] initWithNibName:0 bundle:0];
        [(UIViewController *)v24 setView:v11];
      }
      v25 = +[UIKBSystemLayoutViewController systemLayoutViewControllerWithViewController:v24];
      [v25 setVerticalLayoutType:4];
      if (([(id)v17 supportsTouchInput] | v14) == 1)
      {
        if ((v14 & 1) == 0) {
          objc_msgSend(v25, "setMinimumInsets:", 0.0, 0.0, 32.0, 0.0);
        }
        [(id)v17 setEditorVC:v25];
      }
      else
      {
        [v25 setHorizontalLayoutType:3];
        [v46 addObject:v25];
      }
    }
    id v44 = v11;
    v26 = [v45 inputView];
    v27 = [v45 inputViewController];
    if (!v27 && v26)
    {
      v27 = +[UICompatibilityInputViewController inputViewControllerWithView:v26];
    }
    [(id)v17 setInputVC:v27];
    [(id)v17 populateCoreHierarchy];
    [(id)v17 updateViewConstraints];
    if ((v14 & 1) == 0 && [v46 count])
    {
      id v41 = v12;
      id v42 = v10;
      v28 = [(UIViewController *)[UIKBStackViewController alloc] initWithNibName:0 bundle:0];
      v29 = [(UIKBStackViewController *)v28 stackView];
      [v29 setAxis:1];

      v30 = [(UIKBStackViewController *)v28 stackView];
      [v30 setAlignment:0];

      v31 = [(UIKBStackViewController *)v28 stackView];
      [v31 setDistribution:0];

      long long v49 = 0u;
      long long v50 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      id v32 = v46;
      uint64_t v33 = [v32 countByEnumeratingWithState:&v47 objects:v51 count:16];
      if (v33)
      {
        uint64_t v34 = v33;
        uint64_t v35 = *(void *)v48;
        do
        {
          for (uint64_t i = 0; i != v34; ++i)
          {
            if (*(void *)v48 != v35) {
              objc_enumerationMutation(v32);
            }
            -[UIKBStackViewController addChildViewController:](v28, "addChildViewController:", *(void *)(*((void *)&v47 + 1) + 8 * i), v41, v42);
          }
          uint64_t v34 = [v32 countByEnumeratingWithState:&v47 objects:v51 count:16];
        }
        while (v34);
      }

      [(id)v17 setAccessoryViewController:v28 forEdge:3];
      id v12 = v41;
      id v10 = v42;
    }
    v37 = objc_msgSend((id)v17, "contentLayoutView", v41, v42);
    v38 = [(id)v17 keyboardVC];
    v39 = [v38 view];
    [v37 bringSubviewToFront:v39];

    id v11 = v44;
  }
  else
  {
    uint64_t v17 = 0;
  }

  return (id)v17;
}

+ (id)_tvOS_systemInputViewControllerForResponder:(id)a3 editorView:(id)a4 containingResponder:(id)a5 traitCollection:(id)a6
{
  uint64_t v148 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if ([v13 userInterfaceIdiom] != 2 && objc_msgSend(v13, "userInterfaceIdiom") != 8)
  {
    uint64_t v17 = 0;
    goto LABEL_91;
  }
  v133 = v13;
  int v14 = [v12 _disableAutomaticKeyboardUI];
  if ([v10 conformsToProtocol:&unk_1ED42F658]) {
    v15 = v10;
  }
  else {
    v15 = 0;
  }
  id v16 = v15;
  uint64_t v17 = [objc_alloc((Class)a1) initWithNibName:0 bundle:0];
  v132 = +[UITextInputTraits traitsByAdoptingTraits:v16];
  objc_msgSend((id)v17, "setTextInputTraits:");
  [(id)v17 setPersistentDelegate:v16];
  [(id)v17 setWillPresentFullscreen:v14 ^ 1u];
  [(id)v17 setWillUpdateBackgroundEffectOnInputModeChange:0];
  [(id)v17 setIsAutomaticResponderTransition:__automaticNextFocusResponder == (void)v10];
  *(unsigned char *)(v17 + 1025) = v14 ^ 1;
  *(void *)(v17 + 1000) = v12;
  *(unsigned char *)(v17 + 1027) = 1;
  int v18 = [(id)v17 textInputTraits];
  uint64_t v19 = [v18 keyboardAppearance];

  if ((unint64_t)(v19 - 1) > 9) {
    uint64_t v20 = 1000;
  }
  else {
    uint64_t v20 = qword_186B99490[v19 - 1];
  }
  [(id)v17 setBlurEffectStyle:v20];
  id v131 = v12;
  if (v14)
  {
    v21 = [UIKBFocusVCView alloc];
    v22 = -[UIView initWithFrame:](v21, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [(UIView *)v22 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(id)v17 setView:v22];
    [(id)v17 setContainingView:v22];
  }
  else
  {
    [(id)v17 setModalPresentationStyle:5];
    [(id)v17 setModalTransitionStyle:2];
    v23 = [UIVisualEffectView alloc];
    v24 = +[UIBlurEffect effectWithStyle:](UIBlurEffect, "effectWithStyle:", [(id)v17 blurEffectStyle]);
    v22 = [(UIVisualEffectView *)v23 initWithEffect:v24];

    [(UIKBFocusVCView *)v22 _setGroupName:@"UIKBBackdropGroupName"];
    [(id)v17 setView:v22];
    v25 = [(UIKBFocusVCView *)v22 contentView];
    [(id)v17 setContainingView:v25];
  }
  v137 = [MEMORY[0x1E4F1CA48] array];
  if (v11)
  {
    v26 = +[UIViewController viewControllerForView:v11];
    if (!v26)
    {
      v26 = [[UIViewController alloc] initWithNibName:0 bundle:0];
      [(UIViewController *)v26 setView:v11];
    }
    v27 = +[UIKBSystemLayoutViewController systemLayoutViewControllerWithViewController:v26];
    [v27 setVerticalLayoutType:4];
    if (([(id)v17 supportsTouchInput] | v14) == 1)
    {
      if ((v14 & 1) == 0) {
        objc_msgSend(v27, "setMinimumInsets:", 0.0, 0.0, 32.0, 0.0);
      }
      [(id)v17 setEditorVC:v27];
    }
    else
    {
      [v27 setHorizontalLayoutType:3];
      [v137 addObject:v27];
    }
  }
  uint64_t v28 = [v16 inputView];
  uint64_t v29 = [v16 inputViewController];
  if (!v29 && v28)
  {
    uint64_t v29 = +[UICompatibilityInputViewController inputViewControllerWithView:v28];
  }
  v130 = (void *)v28;
  v136 = (void *)v29;
  [(id)v17 setInputVC:v29];
  [(id)v17 populateCoreHierarchy];
  if (v14)
  {
    v134 = 0;
    goto LABEL_36;
  }
  [(id)v17 findNextInputDelegate];
  v30 = +[UIButton buttonWithType:1];
  v31 = [(id)v17 doneButtonStringForCurrentInputDelegate];
  [v30 setTitle:v31 forState:0];

  [v30 addTarget:v17 action:sel__returnButtonPressed forControlEvents:0x2000];
  if (v19 == 2)
  {
    uint64_t v32 = 4005;
LABEL_31:
    uint64_t v33 = +[UIBlurEffect _effectWithStyle:v32 invertAutomaticStyle:0];
    uint64_t v34 = [v30 _contentBackdropView];
    [v34 setEffect:v33];

    goto LABEL_32;
  }
  if ((v19 & 0xFFFFFFFFFFFFFFF7) == 1)
  {
    uint64_t v32 = 4000;
    goto LABEL_31;
  }
LABEL_32:
  uint64_t v35 = [[UIViewController alloc] initWithNibName:0 bundle:0];
  [(UIViewController *)v35 setView:v30];
  if ([(id)v17 supportsTouchInput])
  {
    [(id)v17 setAccessoryViewController:v35 forEdge:2];
    v36 = [(id)v17 _accessoryViewControllerForEdge:2];
    objc_msgSend(v36, "setMinimumInsets:", -112.0, 0.0, 0.0, 0.0);

    [v30 _setSpeedBumpEdges:1];
    v134 = 0;
  }
  else
  {
    v37 = +[UIKBSystemLayoutViewController systemLayoutViewControllerWithViewController:v35];
    [v37 setVerticalLayoutType:3];
    objc_msgSend(v37, "setMinimumInsets:", -112.0, 0.0, 0.0, 0.0);
    v134 = v37;
    [v137 addObject:v37];
  }
  v38 = [[UITapGestureRecognizer alloc] initWithTarget:v17 action:sel__returnButtonPressed];
  [(UITapGestureRecognizer *)v38 setAllowedPressTypes:&unk_1ED3EFF08];
  [(UIGestureRecognizer *)v38 setAllowedTouchTypes:MEMORY[0x1E4F1CBF0]];
  v39 = [(id)v17 view];
  [v39 addGestureRecognizer:v38];

  [(id)v17 setDoneButton:v30];
LABEL_36:
  uint64_t v40 = [v16 inputAccessoryView];
  uint64_t v41 = [v16 inputAccessoryViewController];
  if (v41)
  {
    id v42 = (void *)v41;
    BOOL v43 = 0;
    goto LABEL_38;
  }
  if (v40) {
    char v46 = 1;
  }
  else {
    char v46 = v14;
  }
  if (v46)
  {
    BOOL v43 = 0;
    if (!v40) {
      goto LABEL_65;
    }
    goto LABEL_64;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    uint64_t v40 = 0;
    goto LABEL_65;
  }
  v58 = [v16 _defaultPromptString];
  BOOL v43 = v58 != 0;
  if (v58)
  {
    unint64_t v59 = [v133 userInterfaceStyle];
    v60 = -[UILabel initWithFrame:]([UILabel alloc], "initWithFrame:", 0.0, 0.0, 300.0, 70.0);
    v61 = 0;
    switch([v132 keyboardAppearance])
    {
      case 1:
      case 9:
        goto LABEL_60;
      case 2:
        goto LABEL_59;
      case 10:
        if (v59 > 1)
        {
LABEL_60:
          uint64_t v62 = +[UIColor lightTextColor];
        }
        else
        {
LABEL_59:
          uint64_t v62 = +[UIColor darkTextColor];
        }
        v61 = (void *)v62;
        break;
      default:
        break;
    }
    [(UILabel *)v60 setTextColor:v61];
    [(UIView *)v60 setOpaque:0];
    [(UIView *)v60 setBackgroundColor:0];
    [(UILabel *)v60 setText:v58];
    v63 = [off_1E52D39B8 preferredFontForTextStyle:@"UICTFontTextStyleTitle2"];
    [(UILabel *)v60 setFont:v63];

    [(UIView *)v60 sizeToFit];
    objc_msgSend((id)v17, "set_promptLabel:", v60);

    uint64_t v40 = (uint64_t)v60;
  }
  else
  {
    uint64_t v40 = 0;
  }

  if (v40)
  {
LABEL_64:
    id v42 = +[UICompatibilityInputViewController inputViewControllerWithView:v40];
    if (v42)
    {
LABEL_38:
      v135 = (void *)v40;
      if ([(id)v17 supportsTouchInput])
      {
        [(id)v17 setAccessoryViewController:v42 forEdge:0];
        id v44 = 0;
        if (v43)
        {
          v45 = [(id)v17 _accessoryViewControllerForEdge:0];
          objc_msgSend(v45, "setMinimumInsets:", 0.0, 0.0, 70.0, 0.0);

          id v44 = 0;
        }
      }
      else
      {
        id v44 = +[UIKBSystemLayoutViewController systemLayoutViewControllerWithViewController:v42];
        [v44 setHorizontalLayoutType:1];
        [v44 setVerticalLayoutType:3];
        objc_msgSend(v44, "setMinimumInsets:", 0.0, 0.0, 20.0, 0.0);
        [v137 insertObject:v44 atIndex:0];
      }
      long long v47 = [v42 view];
      char v48 = objc_opt_respondsToSelector();

      if (v48)
      {
        long long v49 = [v136 view];
        [v49 _alignmentOffset];
        double v51 = v50;
        double v53 = v52;
        v54 = [(id)v17 alignmentConstraintForAxis:0];
        [v54 setConstant:v51];

        int v55 = 1;
        v56 = [(id)v17 alignmentConstraintForAxis:1];
        [v56 setConstant:v53];

        v57 = [(id)v17 view];
        [v57 setNeedsLayout];

        if (v14) {
          goto LABEL_90;
        }
      }
      else
      {
        int v55 = 1;
        if (v14) {
          goto LABEL_90;
        }
      }
LABEL_66:
      if ([v137 count])
      {
        id v128 = v10;
        id v129 = v11;
        v64 = [(UIViewController *)[UIKBStackViewController alloc] initWithNibName:0 bundle:0];
        v65 = [(UIKBStackViewController *)v64 stackView];
        [v65 setAxis:1];

        v66 = [(UIKBStackViewController *)v64 stackView];
        [v66 setAlignment:0];

        v67 = [(UIKBStackViewController *)v64 stackView];
        [v67 setDistribution:0];

        long long v140 = 0u;
        long long v141 = 0u;
        long long v138 = 0u;
        long long v139 = 0u;
        id v68 = v137;
        uint64_t v69 = [v68 countByEnumeratingWithState:&v138 objects:v147 count:16];
        if (v69)
        {
          uint64_t v70 = v69;
          uint64_t v71 = *(void *)v139;
          do
          {
            for (uint64_t i = 0; i != v70; ++i)
            {
              if (*(void *)v139 != v71) {
                objc_enumerationMutation(v68);
              }
              [(UIKBStackViewController *)v64 addChildViewController:*(void *)(*((void *)&v138 + 1) + 8 * i)];
            }
            uint64_t v70 = [v68 countByEnumeratingWithState:&v138 objects:v147 count:16];
          }
          while (v70);
        }

        [(id)v17 setAccessoryViewController:v64 forEdge:3];
        int v73 = [(id)v17 supportsTouchInput];
        v74 = [(id)v17 _accessoryViewControllerForEdge:3];
        v75 = v74;
        if (v73)
        {
          objc_msgSend(v74, "setMinimumInsets:", 0.0, -300.0, 0.0, 0.0);

          v75 = [(id)v17 _accessoryViewControllerForEdge:3];
          objc_msgSend(v75, "setCenteredOffsets:", 0.0, -140.0);
        }
        else
        {
          objc_msgSend(v74, "setMinimumInsets:", 0.0, -292.0, 0.0, 0.0);
        }

        id v10 = v128;
        id v11 = v129;
        if (([(id)v17 supportsTouchInput] & 1) == 0 && ((v135 == 0) & ~v55) == 0)
        {
          v76 = objc_alloc_init(UIFocusGuide);
          if (v44) {
            v77 = v44;
          }
          else {
            v77 = v42;
          }
          v78 = [v77 view];
          if (v135)
          {
            v146 = v135;
            v79 = &v146;
          }
          else
          {
            v145 = v42;
            v79 = &v145;
          }
          v80 = [MEMORY[0x1E4F1C978] arrayWithObjects:v79 count:1];
          [(UIFocusGuide *)v76 setPreferredFocusEnvironments:v80];

          v81 = [(id)v17 view];
          [v81 addLayoutGuide:v76];

          v110 = (void *)MEMORY[0x1E4F5B268];
          v122 = [(UILayoutGuide *)v76 leadingAnchor];
          v126 = [(id)v17 keyboardVC];
          v120 = [v126 focusSafeAreaLayoutGuide];
          v118 = [v120 trailingAnchor];
          v116 = [v122 constraintEqualToAnchor:v118];
          v144[0] = v116;
          v112 = [(UILayoutGuide *)v76 trailingAnchor];
          v114 = [(id)v17 view];
          v108 = [v114 trailingAnchor];
          v106 = [v112 constraintEqualToAnchor:v108];
          v144[1] = v106;
          v104 = [(UILayoutGuide *)v76 topAnchor];
          v102 = [v78 topAnchor];
          v100 = [v104 constraintEqualToAnchor:v102];
          v144[2] = v100;
          v125 = v76;
          v82 = [(UILayoutGuide *)v76 bottomAnchor];
          v124 = v78;
          v83 = [v78 bottomAnchor];
          v84 = [v82 constraintEqualToAnchor:v83];
          v144[3] = v84;
          v85 = [MEMORY[0x1E4F1C978] arrayWithObjects:v144 count:4];
          [v110 activateConstraints:v85];

          v86 = objc_alloc_init(UIFocusGuide);
          if (v134) {
            [v134 view];
          }
          else {
          v127 = [(id)v17 doneButton];
          }
          v87 = [(id)v17 doneButton];
          v143 = v87;
          v88 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v143 count:1];
          [(UIFocusGuide *)v86 setPreferredFocusEnvironments:v88];

          v89 = [(id)v17 view];
          [v89 addLayoutGuide:v86];

          v109 = (void *)MEMORY[0x1E4F5B268];
          v121 = [(UILayoutGuide *)v86 leadingAnchor];
          v123 = [(id)v17 keyboardVC];
          v119 = [v123 focusSafeAreaLayoutGuide];
          v117 = [v119 trailingAnchor];
          v115 = [v121 constraintEqualToAnchor:v117];
          v142[0] = v115;
          v111 = [(UILayoutGuide *)v86 trailingAnchor];
          v113 = [(id)v17 view];
          v105 = [v113 trailingAnchor];
          v103 = [v111 constraintEqualToAnchor:v105];
          v142[1] = v103;
          v101 = [(UILayoutGuide *)v86 topAnchor];
          v99 = [v127 topAnchor];
          v98 = [v101 constraintEqualToAnchor:v99];
          v142[2] = v98;
          v90 = [(UILayoutGuide *)v86 bottomAnchor];
          [v127 bottomAnchor];
          v91 = v107 = v86;
          v92 = [v90 constraintEqualToAnchor:v91];
          v142[3] = v92;
          v93 = [MEMORY[0x1E4F1C978] arrayWithObjects:v142 count:4];
          [v109 activateConstraints:v93];

          id v11 = v129;
        }
      }
      goto LABEL_90;
    }
  }
LABEL_65:
  v135 = (void *)v40;
  [(id)v17 updateViewConstraints];
  int v55 = 0;
  id v42 = 0;
  id v44 = 0;
  if ((v14 & 1) == 0) {
    goto LABEL_66;
  }
LABEL_90:
  v94 = [(id)v17 contentLayoutView];
  v95 = [(id)v17 keyboardVC];
  v96 = [v95 view];
  [v94 bringSubviewToFront:v96];

  id v12 = v131;
  id v13 = v133;
LABEL_91:
  +[_UIKeyboardUsageTracking keyboardSupportsTouch:](_UIKeyboardUsageTracking, "keyboardSupportsTouch:", [(id)v17 supportsTouchInput]);

  return (id)v17;
}

+ (id)_iOS_systemInputViewControllerForResponder:(id)a3 editorView:(id)a4 containingResponder:(id)a5 traitCollection:(id)a6
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  if ([v11 userInterfaceIdiom] && objc_msgSend(v11, "userInterfaceIdiom") != 1)
  {
    uint64_t v17 = 0;
  }
  else
  {
    id v40 = v11;
    int v12 = [v10 _disableAutomaticKeyboardUI];
    char v13 = v12;
    uint64_t v14 = v12 ^ 1u;
    if ([v9 conformsToProtocol:&unk_1ED42F658]) {
      v15 = v9;
    }
    else {
      v15 = 0;
    }
    id v16 = v15;
    uint64_t v17 = [objc_alloc((Class)a1) initWithNibName:0 bundle:0];
    *(unsigned char *)(v17 + 1024) = 1;
    [(id)v17 setPersistentDelegate:v16];
    [(id)v17 setWillPresentFullscreen:v14];
    [(id)v17 setWillUpdateBackgroundEffectOnInputModeChange:1];
    [(id)v17 setIsAutomaticResponderTransition:__automaticNextFocusResponder == (void)v9];
    *(unsigned char *)(v17 + 1025) = 1;
    id v41 = v10;
    *(void *)(v17 + 1000) = v10;
    uint64_t v18 = +[UITextInputTraits traitsByAdoptingTraits:v16];
    [(id)v17 setTextInputTraits:v18];
    uint64_t v19 = [(id)v17 textInputTraits];
    uint64_t v20 = [v19 keyboardAppearance];

    v21 = +[UIKeyboardInputModeController sharedInputModeController];
    v22 = [v21 currentInputMode];
    v23 = +[UIKBRenderConfig configForAppearance:v20 inputMode:v22 traitEnvironment:0];
    uint64_t v24 = [v23 blurEffectStyle];

    [(id)v17 setBlurEffectStyle:v24];
    if (v13)
    {
      v25 = [UIKBFocusVCView alloc];
      v26 = -[UIView initWithFrame:](v25, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      [(UIView *)v26 setTranslatesAutoresizingMaskIntoConstraints:0];
      [(id)v17 setView:v26];
      [(id)v17 setContainingView:v26];
    }
    else
    {
      [(id)v17 setModalPresentationStyle:5];
      [(id)v17 setModalTransitionStyle:2];
      v27 = [UIVisualEffectView alloc];
      uint64_t v28 = +[UIBlurEffect effectWithStyle:](UIBlurEffect, "effectWithStyle:", [(id)v17 blurEffectStyle]);
      v26 = [(UIVisualEffectView *)v27 initWithEffect:v28];

      [(UIKBFocusVCView *)v26 _setGroupName:@"UIKBBackdropGroupName"];
      [(id)v17 setView:v26];
      uint64_t v29 = [(UIKBFocusVCView *)v26 contentView];
      [(id)v17 setContainingView:v29];
    }
    v30 = [v16 inputView];
    v31 = [v16 inputViewController];
    if (!v31 && v30)
    {
      v31 = +[UICompatibilityInputViewController inputViewControllerWithView:v30];
    }
    [(id)v17 setInputVC:v31];
    [(id)v17 populateCoreHierarchy];
    uint64_t v32 = [v16 inputAccessoryView];
    uint64_t v33 = [v16 inputAccessoryViewController];
    if (!v33 && v32)
    {
      uint64_t v33 = +[UICompatibilityInputViewController inputViewControllerWithView:v32];
    }
    id v39 = v9;
    uint64_t v34 = (void *)v18;
    if (v33)
    {
      if ([(id)v17 supportsTouchInput]) {
        [(id)v17 setAccessoryViewController:v33 forEdge:0];
      }
    }
    else
    {
      [(id)v17 updateViewConstraints];
    }
    uint64_t v35 = [(id)v17 contentLayoutView];
    v36 = [(id)v17 keyboardVC];
    v37 = [v36 view];
    [v35 bringSubviewToFront:v37];

    id v11 = v40;
    id v10 = v41;
    id v9 = v39;
  }

  return (id)v17;
}

- (int64_t)resolvedKeyboardStyle
{
  self->_resolvedKeyboardStyle = 0;
  return 0;
}

- (void)_restoreKeyboardIfNecessary
{
  id v3 = [(UISystemInputViewController *)self keyboardVC];
  id v4 = [v3 parentViewController];

  if (v4 != self)
  {
    char v5 = [(UISystemInputViewController *)self keyboardVC];
    BOOL v6 = [(UISystemInputViewController *)self keyboard];
    [v5 setDeferredSystemView:v6];

    [(UISystemInputViewController *)self _addChildInputViewController];
    [(UISystemInputViewController *)self updateViewConstraints];
    id v9 = [(UISystemInputViewController *)self contentLayoutView];
    v7 = [(UISystemInputViewController *)self keyboardVC];
    id v8 = [v7 view];
    [v9 bringSubviewToFront:v8];
  }
}

- (void)populateCoreHierarchy
{
  v30[4] = *MEMORY[0x1E4F143B8];
  id v3 = [UIView alloc];
  id v4 = [(UISystemInputViewController *)self containingView];
  [v4 bounds];
  char v5 = -[UIView initWithFrame:](v3, "initWithFrame:");
  [(UISystemInputViewController *)self setContentLayoutView:v5];

  BOOL v6 = [(UISystemInputViewController *)self contentLayoutView];
  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];

  v7 = [(UISystemInputViewController *)self contentLayoutView];
  [v7 setOpaque:0];

  id v8 = [(UISystemInputViewController *)self containingView];
  id v9 = [(UISystemInputViewController *)self contentLayoutView];
  [v8 addSubview:v9];

  [(UISystemInputViewController *)self _addChildInputViewController];
  id v10 = [(UISystemInputViewController *)self editorVC];

  if (v10)
  {
    id v11 = [(UISystemInputViewController *)self editorVC];
    [(UISystemInputViewController *)self _addAccessoryViewController:v11];
  }
  if ([(UISystemInputViewController *)self willPresentFullscreen])
  {
    [(UISystemInputViewController *)self updateAlignmentConstraints];
  }
  else
  {
    int v12 = (void *)MEMORY[0x1E4F5B268];
    uint64_t v29 = [(UISystemInputViewController *)self contentLayoutView];
    uint64_t v28 = [(UISystemInputViewController *)self containingView];
    v27 = [v12 constraintWithItem:v29 attribute:3 relatedBy:0 toItem:v28 attribute:3 multiplier:1.0 constant:0.0];
    v30[0] = v27;
    char v13 = (void *)MEMORY[0x1E4F5B268];
    v26 = [(UISystemInputViewController *)self contentLayoutView];
    uint64_t v14 = [(UISystemInputViewController *)self containingView];
    v15 = [v13 constraintWithItem:v26 attribute:4 relatedBy:0 toItem:v14 attribute:4 multiplier:1.0 constant:0.0];
    v30[1] = v15;
    id v16 = (void *)MEMORY[0x1E4F5B268];
    uint64_t v17 = [(UISystemInputViewController *)self contentLayoutView];
    uint64_t v18 = [(UISystemInputViewController *)self containingView];
    uint64_t v19 = [v16 constraintWithItem:v17 attribute:1 relatedBy:0 toItem:v18 attribute:1 multiplier:1.0 constant:0.0];
    v30[2] = v19;
    uint64_t v20 = (void *)MEMORY[0x1E4F5B268];
    v21 = [(UISystemInputViewController *)self contentLayoutView];
    v22 = [(UISystemInputViewController *)self containingView];
    v23 = [v20 constraintWithItem:v21 attribute:2 relatedBy:0 toItem:v22 attribute:2 multiplier:1.0 constant:0.0];
    v30[3] = v23;
    uint64_t v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:4];

    v25 = [(UISystemInputViewController *)self containingView];
    [v25 addConstraints:v24];
  }
}

- (id)_traitCollectionForUserInterfaceStyle
{
  if ([(UISystemInputViewController *)self willPresentFullscreen])
  {
    id v3 = [(UITraitEnvironment *)self->_containingResponder traitCollection];
    id v4 = v3;
    if (v3)
    {
      id v5 = v3;
    }
    else
    {
      v13.receiver = self;
      v13.super_class = (Class)UISystemInputViewController;
      id v5 = [(UIViewController *)&v13 traitCollection];
    }
    v7 = v5;

    id v8 = [(UISystemInputViewController *)self textInputTraits];
    uint64_t v9 = [v8 keyboardAppearance];

    switch(v9)
    {
      case 9:
        uint64_t v10 = 1000;
        break;
      case 2:
        uint64_t v10 = 1;
        break;
      case 1:
        uint64_t v10 = 2;
        break;
      default:
        uint64_t v10 = [v7 userInterfaceStyle];
        break;
    }
    BOOL v6 = [v7 _traitCollectionByReplacingNSIntegerValue:v10 forTraitToken:0x1ED3F5A48];
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)UISystemInputViewController;
    BOOL v6 = [(UIViewController *)&v12 traitCollection];
  }
  return v6;
}

- (void)_setNonInputViewVisibility:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(UISystemInputViewController *)self editorVC];

  if (v5)
  {
    BOOL v6 = [(UISystemInputViewController *)self editorVC];
    v7 = [v6 view];
    [v7 setHidden:!v3];
  }
  id v8 = [(UISystemInputViewController *)self doneButton];

  if (v8)
  {
    uint64_t v9 = [(UISystemInputViewController *)self doneButton];
    [v9 setHidden:!v3];
  }
  accessoryViewControllers = self->_accessoryViewControllers;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __58__UISystemInputViewController__setNonInputViewVisibility___block_invoke;
  v11[3] = &__block_descriptor_33_e43_v32__0__NSNumber_8__UIViewController_16_B24l;
  BOOL v12 = v3;
  [(NSMutableDictionary *)accessoryViewControllers enumerateKeysAndObjectsUsingBlock:v11];
}

void __58__UISystemInputViewController__setNonInputViewVisibility___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  BOOL v3 = *(unsigned char *)(a1 + 32) == 0;
  id v4 = [a3 view];
  [v4 setHidden:v3];
}

- (BOOL)keyboardCanBecomeFocusedWithZeroAlpha
{
  BOOL v3 = [(UIViewController *)self view];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0) {
    return 0;
  }
  id v5 = [(UIViewController *)self view];
  char v6 = [v5 isEligibleForFocusWithZeroAlpha];

  return v6;
}

- (void)setKeyboardCanBecomeFocusedWithZeroAlpha:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(UIViewController *)self view];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v7 = [(UIViewController *)self view];
    [v7 setIsEligibleForFocusWithZeroAlpha:v3];
  }
}

- (void)_addChildInputViewController
{
  BOOL v3 = [(UISystemInputViewController *)self recentsVC];

  if (v3)
  {
    id v4 = [(UIViewController *)self childViewControllers];
    id v5 = [(UISystemInputViewController *)self recentsVC];
    char v6 = [v4 containsObject:v5];

    if (v6) {
      goto LABEL_10;
    }
    uint64_t v7 = [(UISystemInputViewController *)self recentsVC];
  }
  else
  {
    id v8 = [(UISystemInputViewController *)self inputVC];

    if (v8)
    {
      uint64_t v9 = [(UIViewController *)self childViewControllers];
      uint64_t v10 = [(UISystemInputViewController *)self inputVC];
      char v11 = [v9 containsObject:v10];

      if (v11) {
        goto LABEL_10;
      }
      uint64_t v7 = [(UISystemInputViewController *)self inputVC];
    }
    else
    {
      [(UISystemInputViewController *)self _createKeyboardIfNecessary];
      BOOL v12 = [(UIViewController *)self childViewControllers];
      objc_super v13 = [(UISystemInputViewController *)self keyboardVC];
      char v14 = [v12 containsObject:v13];

      if (v14) {
        goto LABEL_10;
      }
      uint64_t v7 = [(UISystemInputViewController *)self keyboardVC];
    }
  }
  v15 = (void *)v7;
  [(UISystemInputViewController *)self _addAccessoryViewController:v7];

LABEL_10:
  [(UISystemInputViewController *)self _setNonInputViewVisibility:v3 == 0];
  [(UISystemInputViewController *)self _updateRemoteTextEditingSession];
}

- (id)_remoteInputSessionIdentifier
{
  remoteInputSessionIdentifier = self->_remoteInputSessionIdentifier;
  if (!remoteInputSessionIdentifier)
  {
    id v4 = (NSUUID *)objc_alloc_init(MEMORY[0x1E4F29128]);
    id v5 = self->_remoteInputSessionIdentifier;
    self->_remoteInputSessionIdentifier = v4;

    remoteInputSessionIdentifier = self->_remoteInputSessionIdentifier;
  }
  return remoteInputSessionIdentifier;
}

- (void)_createKeyboardIfNecessary
{
  BOOL v3 = [(UISystemInputViewController *)self keyboard];

  if (!v3)
  {
    id v4 = [[UIKeyboard alloc] initLazily];
    [(UISystemInputViewController *)self setKeyboard:v4];

    id v5 = [(UISystemInputViewController *)self keyboard];
    objc_msgSend(v5, "_setDisableTouchInput:", -[UISystemInputViewController supportsTouchInput](self, "supportsTouchInput") ^ 1);

    char v6 = [(UISystemInputViewController *)self keyboard];
    objc_msgSend(v6, "_setUseLinearLayout:", -[UISystemInputViewController supportsTouchInput](self, "supportsTouchInput"));

    unint64_t v7 = [(UISystemInputViewController *)self requestedInteractionModel];
    id v8 = [(UISystemInputViewController *)self keyboard];
    [v8 setRequestedInteractionModel:v7];

    uint64_t v9 = [(UISystemInputViewController *)self keyboard];
    [v9 setTranslatesAutoresizingMaskIntoConstraints:0];

    uint64_t v10 = [(UISystemInputViewController *)self keyboard];
    char v11 = +[UICompatibilityInputViewController deferredInputModeControllerWithKeyboard:v10];
    [(UISystemInputViewController *)self setKeyboardVC:v11];
  }
  BOOL v12 = +[UIKeyboardPreferencesController sharedPreferencesController];
  objc_super v13 = [v12 preferencesActions];
  char v14 = [v13 currentInputModeSupportsCrescendo];

  if ((v14 & 1) == 0)
  {
    v15 = [(UISystemInputViewController *)self keyboardVC];
    id v16 = [v15 view];
    LODWORD(v17) = 1148846080;
    [v16 setContentCompressionResistancePriority:1 forAxis:v17];

    id v20 = [(UISystemInputViewController *)self keyboardVC];
    uint64_t v18 = [v20 view];
    LODWORD(v19) = 1148846080;
    [v18 setContentCompressionResistancePriority:0 forAxis:v19];
  }
}

- (void)_windowWillBecomeApplicationKey:(id)a3
{
  id v4 = a3;
  id v11 = +[UIWindow _applicationKeyWindow];
  id v5 = [v4 object];

  char v6 = [v11 traitCollection];
  uint64_t v7 = [v6 userInterfaceIdiom];

  id v8 = [(UIResponder *)self _responderWindow];
  if (v5 != v8 || v5 == v11) {
    goto LABEL_6;
  }
  uint64_t v9 = [(UISystemInputViewController *)self persistentDelegate];
  int v10 = [v9 isFirstResponder];

  if (v10 && v7 != 3)
  {
    id v8 = [v11 firstResponder];
    [v8 resignFirstResponder];
LABEL_6:
  }
}

- (void)_windowDidBecomeApplicationKey:(id)a3
{
  id v7 = [a3 object];
  id v4 = [(UIResponder *)self _responderWindow];
  if (v7 == v4)
  {
    id v5 = [(UISystemInputViewController *)self persistentDelegate];
    int v6 = [v5 isFirstResponder];

    if (v6) {
      [(UISystemInputViewController *)self _restoreKeyboardIfNecessary];
    }
  }
  else
  {
  }
}

- (void)setRequestedInteractionModel:(unint64_t)a3
{
  if (self->_requestedInteractionModel != a3)
  {
    self->_requestedInteractionModel = a3;
    self->_supportsTouchInput = a3 < 2;
    id v5 = [(UISystemInputViewController *)self keyboard];

    if (v5)
    {
      id v6 = [(UISystemInputViewController *)self keyboard];
      [v6 setRequestedInteractionModel:a3];
    }
  }
}

- (void)setInputVC:(id)a3
{
  id v5 = (UIViewController *)a3;
  p_inputVC = &self->_inputVC;
  inputVC = self->_inputVC;
  if (inputVC != v5)
  {
    v15 = v5;
    if (inputVC)
    {
      id v8 = [(UIViewController *)self childViewControllers];
      int v9 = [v8 containsObject:*p_inputVC];

      id v5 = v15;
      if (v9)
      {
        [(UISystemInputViewController *)self _removeAccessoryViewController:*p_inputVC];
        id v5 = v15;
      }
    }
    if (v5)
    {
      if (self->_keyboardVC)
      {
        int v10 = [(UIViewController *)self childViewControllers];
        int v11 = [v10 containsObject:self->_keyboardVC];

        if (v11) {
          [(UISystemInputViewController *)self _removeAccessoryViewController:self->_keyboardVC];
        }
      }
    }
    objc_storeStrong((id *)&self->_inputVC, a3);
    [(UISystemInputViewController *)self _addChildInputViewController];
    BOOL v12 = [(UIViewController *)self view];
    objc_super v13 = [v12 window];

    if (v13)
    {
      [(UISystemInputViewController *)self updateViewConstraints];
      [(UISystemInputViewController *)self updateAlignmentConstraints];
    }
    else
    {
      char v14 = [(UIViewController *)self view];
      [v14 setNeedsUpdateConstraints];
    }
    id v5 = v15;
  }
}

- (void)setRecentsVC:(id)a3
{
  id v5 = (UIRecentsInputViewController *)a3;
  p_recentsVC = &self->_recentsVC;
  recentsVC = self->_recentsVC;
  if (recentsVC != v5)
  {
    v15 = v5;
    if (recentsVC)
    {
      id v8 = [(UIViewController *)self childViewControllers];
      int v9 = [v8 containsObject:*p_recentsVC];

      id v5 = v15;
      if (v9)
      {
        [(UISystemInputViewController *)self _removeAccessoryViewController:*p_recentsVC];
        id v5 = v15;
      }
    }
    if (v5)
    {
      if (self->_keyboardVC)
      {
        int v10 = [(UIViewController *)self childViewControllers];
        int v11 = [v10 containsObject:self->_keyboardVC];

        if (v11) {
          [(UISystemInputViewController *)self _removeAccessoryViewController:self->_keyboardVC];
        }
      }
    }
    objc_storeStrong((id *)&self->_recentsVC, a3);
    [(UISystemInputViewController *)self _addChildInputViewController];
    BOOL v12 = [(UIViewController *)self view];
    objc_super v13 = [v12 window];

    if (v13)
    {
      [(UISystemInputViewController *)self updateViewConstraints];
      [(UISystemInputViewController *)self updateAlignmentConstraints];
    }
    else
    {
      char v14 = [(UIViewController *)self view];
      [v14 setNeedsUpdateConstraints];
    }
    id v5 = v15;
  }
}

- (void)didSelectRecentInput
{
  if ([(UISystemInputViewController *)self willPresentFullscreen])
  {
    [(UISystemInputViewController *)self _returnButtonPressed];
  }
  else
  {
    BOOL v3 = [(UISystemInputViewController *)self systemInputViewControllerDelegate];
    char v4 = objc_opt_respondsToSelector();

    if (v4)
    {
      id v5 = [(UISystemInputViewController *)self systemInputViewControllerDelegate];
      [v5 systemInputViewControllerDidAcceptRecentInput:self];
    }
  }
}

- (void)switchToKeyboard
{
  [(UISystemInputViewController *)self setRecentsVC:0];
  [(UISystemInputViewController *)self notifyDelegateWithAccessoryVisibility:1];
  [(UISystemInputViewController *)self _setSystemInputInteractionActive:1];
}

- (UITextInputTraits)textInputTraits
{
  return self->_textInputTraits;
}

- (void)setSupportsRecentInputsIntegration:(BOOL)a3
{
  BOOL v3 = a3;
  self->_supportsRecentInputsIntegration = a3;
  if (a3)
  {
    id v5 = [(UISystemInputViewController *)self recentsVC];
    if (!v5)
    {
LABEL_11:
      [(UISystemInputViewController *)self configureRecentsVCIfNecessary];
      return;
    }
    if (self->_supportsRecentInputsIntegration)
    {

      return;
    }
    id v7 = v5;
  }
  id v6 = [(UISystemInputViewController *)self recentsVC];

  if (v3) {
  if (v6)
  }
    goto LABEL_11;
}

- (void)configureRecentsVCIfNecessary
{
  if ([(UISystemInputViewController *)self willShowRecentsList]
    && ![(UISystemInputViewController *)self didDisplayRecents])
  {
    BOOL v12 = [(UITableViewController *)[UIRecentsInputViewController alloc] initWithStyle:0];
    BOOL v3 = [(UISystemInputViewController *)self textInputTraits];
    -[UIRecentsInputViewController setCanManageList:](v12, "setCanManageList:", [v3 manageRecentInputs]);

    char v4 = [(UISystemInputViewController *)self persistentDelegate];
    id v5 = [v4 recentsAccessoryView];
    [(UIRecentsInputViewController *)v12 setCustomHeaderView:v5];

    id v6 = +[UIBlurEffect effectWithStyle:[(UISystemInputViewController *)self blurEffectStyle]];
    id v7 = [(UITraitEnvironment *)self->_containingResponder traitCollection];
    id v8 = objc_msgSend(v6, "effectForUserInterfaceStyle:", objc_msgSend(v7, "userInterfaceStyle"));

    -[UIRecentsInputViewController setContainingEffectStyle:](v12, "setContainingEffectStyle:", [v8 _style]);
    [(UISystemInputViewController *)self setRecentsVC:v12];
    int v9 = [(UISystemInputViewController *)self recentsVC];
    [v9 setRecentInputDelegate:self];

    int v10 = [(UISystemInputViewController *)self cachedRecents];
    int v11 = [(UISystemInputViewController *)self recentsVC];
    [v11 setRecentInputs:v10];

    [(UISystemInputViewController *)self setDidDisplayRecents:1];
    [(UISystemInputViewController *)self notifyDelegateWithAccessoryVisibility:0];
  }
}

- (void)setSystemInputViewControllerDelegate:(id)a3
{
  if (self->_systemInputViewControllerDelegate != a3)
  {
    self->_systemInputViewControllerDelegate = (UISystemInputViewControllerDelegate *)a3;
    id v4 = [(UISystemInputViewController *)self recentsVC];
    [(UISystemInputViewController *)self notifyDelegateWithAccessoryVisibility:v4 == 0];
  }
}

- (void)notifyDelegateWithAccessoryVisibility:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(UISystemInputViewController *)self systemInputViewControllerDelegate];
  if (v5)
  {
    id v6 = (void *)v5;
    id v7 = [(UISystemInputViewController *)self systemInputViewControllerDelegate];
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      id v9 = [(UISystemInputViewController *)self systemInputViewControllerDelegate];
      [v9 systemInputViewController:self didChangeAccessoryVisibility:v3];
    }
  }
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(UISystemInputViewController *)self willPresentFullscreen]
    && _UIPressesContainsPressType(v6, 5))
  {
    char v8 = [(UIViewController *)self _window];
    id v9 = [v8 firstResponder];

    if (!v9)
    {
      v11.receiver = self;
      v11.super_class = (Class)UISystemInputViewController;
      [(UIResponder *)&v11 pressesBegan:v6 withEvent:v7];
    }
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)UISystemInputViewController;
    [(UIResponder *)&v10 pressesBegan:v6 withEvent:v7];
  }
}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(UISystemInputViewController *)self willPresentFullscreen]
    && _UIPressesContainsPressType(v6, 5))
  {
    char v8 = [(UIViewController *)self _window];
    id v9 = [v8 firstResponder];

    if (v9)
    {
      [v9 _nonDestructivelyResignFirstResponder];
    }
    else
    {
      v11.receiver = self;
      v11.super_class = (Class)UISystemInputViewController;
      [(UIResponder *)&v11 pressesEnded:v6 withEvent:v7];
    }
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)UISystemInputViewController;
    [(UIResponder *)&v10 pressesEnded:v6 withEvent:v7];
  }
}

- (void)pressesCancelled:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(UISystemInputViewController *)self willPresentFullscreen]
    && _UIPressesContainsPressType(v6, 5))
  {
    char v8 = [(UIViewController *)self _window];
    id v9 = [v8 firstResponder];

    if (!v9)
    {
      v11.receiver = self;
      v11.super_class = (Class)UISystemInputViewController;
      [(UIResponder *)&v11 pressesCancelled:v6 withEvent:v7];
    }
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)UISystemInputViewController;
    [(UIResponder *)&v10 pressesCancelled:v6 withEvent:v7];
  }
}

- (void)_dismissSystemInputViewController
{
  BOOL v3 = [(UISystemInputViewController *)self nextInputDelegate];

  if (v3)
  {
    uint64_t v4 = [(UISystemInputViewController *)self nextInputDelegate];
    uint64_t v5 = (void *)__automaticNextFocusResponder;
    __automaticNextFocusResponder = v4;

    [(UISystemInputViewController *)self setIsAutomaticResponderTransition:1];
    id v6 = [(UISystemInputViewController *)self keyboard];
    [v6 setDisableInteraction:1];

    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __64__UISystemInputViewController__dismissSystemInputViewController__block_invoke;
    v9[3] = &unk_1E52D9F70;
    v9[4] = self;
    +[UIViewController _performWithoutDeferringTransitions:v9];
    id v7 = (void *)__automaticNextFocusResponder;
    __automaticNextFocusResponder = 0;
  }
  else
  {
    id v8 = [(UISystemInputViewController *)self persistentDelegate];
    [v8 resignFirstResponder];
  }
}

void __64__UISystemInputViewController__dismissSystemInputViewController__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) persistentDelegate];
  [v1 resignFirstResponder];

  [(id)__automaticNextFocusResponder becomeFirstResponder];
  if (([(id)__automaticNextFocusResponder isFirstResponder] & 1) == 0)
  {
    id v2 = +[UIKeyboard activeKeyboard];
    [v2 setDisableInteraction:0];
  }
}

- (void)_returnButtonPressed
{
  id v3 = [(UISystemInputViewController *)self persistentDelegate];
  if (objc_opt_respondsToSelector()) {
    [v3 keyboardInput:v3 shouldInsertText:@"\n" isMarkedText:0];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v3 sendActionsForControlEvents:0x80000];
  }
  [(UISystemInputViewController *)self _dismissSystemInputViewController];
}

- (UISystemInputViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)UISystemInputViewController;
  result = [(UIViewController *)&v5 initWithNibName:a3 bundle:a4];
  if (result) {
    result->_supportsTouchInput = 1;
  }
  return result;
}

- (void)dealloc
{
  v12[9] = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v12[0] = @"UIApplicationDidEnterBackgroundNotification";
  v12[1] = @"UIApplicationWillEnterForegroundNotification";
  v12[2] = @"UIApplicationWillResignActiveNotification";
  v12[3] = @"UIApplicationDidBecomeActiveNotification";
  v12[4] = 0x1ED180380;
  v12[5] = 0x1ED180360;
  v12[6] = @"UITextInputCurrentInputModeDidChangeNotification";
  v12[7] = @"_UIWindowWillBecomeApplicationKeyNotification";
  v12[8] = @"_UIWindowDidBecomeApplicationKeyNotification";
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:9];
  -[NSNotificationCenter _uiRemoveObserver:names:](v3, self, v4);

  objc_super v5 = +[UIKeyboardImpl activeInstance];
  id v6 = [v5 delegate];
  persistentDelegate = self->_persistentDelegate;

  if (v6 == persistentDelegate)
  {
    id v8 = +[UIKeyboardImpl activeInstance];
    [v8 setDelegate:0];
  }
  self->_systemInputViewControllerDelegate = 0;
  nextInputDelegate = self->_nextInputDelegate;
  self->_nextInputDelegate = 0;

  objc_super v10 = self->_persistentDelegate;
  self->_persistentDelegate = 0;

  self->_containingResponder = 0;
  v11.receiver = self;
  v11.super_class = (Class)UISystemInputViewController;
  [(UIViewController *)&v11 dealloc];
}

- (void)prepareForRelease
{
  id v3 = +[UIKeyboardImpl activeInstance];
  uint64_t v4 = [v3 delegate];
  persistentDelegate = self->_persistentDelegate;

  if (v4 == persistentDelegate)
  {
    if (self->_isVisible) {
      [(UISystemInputViewController *)self _setSystemInputInteractionActive:0];
    }
    id v6 = +[UIKeyboardImpl activeInstance];
    [v6 setDelegate:0];
  }
}

- (void)resetContainingResponder
{
  self->_containingResponder = 0;
}

- (BOOL)_disableAutomaticKeyboardBehavior
{
  return 1;
}

- (void)viewDidAppear:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)UISystemInputViewController;
  [(UIViewController *)&v9 viewDidAppear:a3];
  self->_isVisible = 1;
  uint64_t v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  objc_super v5 = [(UIResponder *)self _responderWindow];
  [v4 addObserver:self selector:sel__windowWillBecomeApplicationKey_ name:@"_UIWindowWillBecomeApplicationKeyNotification" object:v5];

  id v6 = [(UIResponder *)self _responderWindow];
  [v4 addObserver:self selector:sel__windowDidBecomeApplicationKey_ name:@"_UIWindowDidBecomeApplicationKeyNotification" object:v6];

  if ([(UISystemInputViewController *)self willPresentFullscreen])
  {
    id v7 = [(UIViewController *)self presentationController];
    [v7 _disableMenuPressForBackGesture];
  }
  else
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __45__UISystemInputViewController_viewDidAppear___block_invoke;
    v8[3] = &unk_1E52D9F70;
    v8[4] = self;
    [(id)UIApp _performBlockAfterCATransactionCommits:v8];
  }
}

void __45__UISystemInputViewController_viewDidAppear___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _responderWindow];
  id v3 = [v2 _focusSystem];
  id v8 = [v3 _focusedView];

  uint64_t v4 = [*(id *)(a1 + 32) keyboard];
  if ([v4 isFocused])
  {
  }
  else
  {
    objc_super v5 = [*(id *)(a1 + 32) keyboard];
    uint64_t v6 = [v5 cursorLocation];

    if (v6 && v8)
    {
      id v7 = [*(id *)(a1 + 32) keyboard];
      [v7 setCursorLocation:0];

      [*(id *)(a1 + 32) _setSystemInputInteractionActive:0];
      goto LABEL_7;
    }
  }
  +[UIDictationController keyboardDidUpdateOnScreenStatus];
LABEL_7:
}

- (id)preferredFocusEnvironments
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v3 = [(UISystemInputViewController *)self recentsVC];

  if (v3)
  {
    uint64_t v4 = [(UISystemInputViewController *)self recentsVC];
    v12[0] = v4;
    objc_super v5 = (void **)v12;
LABEL_7:
    id v8 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v5, 1, v10, v11, v12[0]);

    goto LABEL_8;
  }
  uint64_t v6 = [(UISystemInputViewController *)self inputVC];

  if (v6)
  {
    uint64_t v4 = [(UISystemInputViewController *)self inputVC];
    objc_super v11 = v4;
    objc_super v5 = &v11;
    goto LABEL_7;
  }
  id v7 = [(UISystemInputViewController *)self keyboardVC];

  if (v7)
  {
    uint64_t v4 = [(UISystemInputViewController *)self keyboardVC];
    objc_super v10 = v4;
    objc_super v5 = &v10;
    goto LABEL_7;
  }
  id v8 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_8:
  return v8;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)UISystemInputViewController;
  [(UIViewController *)&v6 didUpdateFocusInContext:a3 withAnimationCoordinator:a4];
  [(UISystemInputViewController *)self _updateRemoteTextEditingSession];
  if ([(UISystemInputViewController *)self notifyKeyboardOnScreenOnFocusOnly])
  {
    objc_super v5 = [(UISystemInputViewController *)self keyboard];
    -[UISystemInputViewController _setSystemInputInteractionActive:](self, "_setSystemInputInteractionActive:", [v5 isFocused]);
  }
}

- (UIEdgeInsets)unfocusedFocusGuideOutsets
{
  id v2 = [(UISystemInputViewController *)self keyboard];
  [v2 unfocusedFocusGuideOutsets];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.right = v14;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

- (void)setUnfocusedFocusGuideOutsets:(UIEdgeInsets)a3
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  id v9 = [(UISystemInputViewController *)self keyboard];
  double v8 = [(UIViewController *)self view];
  objc_msgSend(v9, "setUnfocusedFocusGuideOutsets:fromView:", v8, top, left, bottom, right);
}

- (id)viewForFocusHeading:(unint64_t)a3 fromView:(id)a4
{
  id v7 = a4;
  if (v7)
  {
    if (a3)
    {
LABEL_3:
      double v8 = +[UIFocusSystem focusSystemForEnvironment:v7];
      id v9 = [[_UIFocusMovementRequest alloc] initWithFocusSystem:v8];
      double v10 = +[_UIFocusItemInfo infoWithView:v7];
      [(_UIFocusMovementRequest *)v9 setFocusedItemInfo:v10];

      double v11 = +[_UIFocusMovementInfo _movementWithHeading:a3 isInitial:1];
      [(_UIFocusMovementRequest *)v9 setMovementInfo:v11];

      double v12 = [v8 _movementPerformer];
      double v13 = [v12 contextForFocusMovement:v9];

      uint64_t v14 = [v13 nextFocusedView];
      v15 = (void *)v14;
      if (v14) {
        id v16 = (void *)v14;
      }
      else {
        id v16 = v7;
      }
      id v17 = v16;

      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"UISystemInputViewController.m", 1718, @"Invalid parameter not satisfying: %@", @"view" object file lineNumber description];

    if (a3) {
      goto LABEL_3;
    }
  }
  id v17 = v7;
LABEL_9:

  return v17;
}

- (void)findNextInputDelegate
{
  double v3 = [(UISystemInputViewController *)self persistentDelegate];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v10 = [(UITextInput *)self->_persistentDelegate _responderWindow];
    double v5 = [v10 _focusEventRecognizer];
    if (v5)
    {
      double v6 = [(UISystemInputViewController *)self persistentDelegate];
      id v7 = [(UISystemInputViewController *)self viewForFocusHeading:16 fromView:v6];
      double v8 = v7;
      if (v7 && v7 != v6 && [v7 conformsToProtocol:&unk_1ED42F658])
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v9 = v8;
          if ([v9 isEditable]) {
            [(UISystemInputViewController *)self setNextInputDelegate:v9];
          }
        }
        else
        {
          [(UISystemInputViewController *)self setNextInputDelegate:v8];
        }
      }
    }
  }
}

- (id)doneButtonStringForCurrentInputDelegate
{
  double v3 = [(UISystemInputViewController *)self persistentDelegate];
  uint64_t v4 = [v3 returnKeyType];

  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 9;
  }
  double v6 = [(UISystemInputViewController *)self nextInputDelegate];

  if (v6) {
    uint64_t v7 = 4;
  }
  else {
    uint64_t v7 = v5;
  }
  return UIKeyboardLocalizedReturnKeyName(v7);
}

- (void)setDoneButton:(id)a3
{
  id v8 = a3;
  objc_storeStrong((id *)&self->_doneButton, a3);
  doneButton = self->_doneButton;
  double v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v7 = v6;
  if (doneButton) {
    [v6 addObserver:self selector:sel_inputModeDidChange_ name:@"UITextInputCurrentInputModeDidChangeNotification" object:0];
  }
  else {
    [v6 removeObserver:self name:@"UITextInputCurrentInputModeDidChangeNotification" object:0];
  }
}

- (void)inputModeDidChange:(id)a3
{
  uint64_t v4 = [(UISystemInputViewController *)self doneButton];

  if (v4)
  {
    uint64_t v5 = [(UISystemInputViewController *)self doneButton];
    double v6 = [(UISystemInputViewController *)self doneButtonStringForCurrentInputDelegate];
    [v5 setTitle:v6 forState:0];
  }
  if ([(UISystemInputViewController *)self willPresentFullscreen])
  {
    if ([(UISystemInputViewController *)self willUpdateBackgroundEffectOnInputModeChange])
    {
      uint64_t v7 = [(UIViewController *)self view];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        id v9 = [(UISystemInputViewController *)self textInputTraits];
        uint64_t v10 = [v9 keyboardAppearance];
        double v11 = +[UIKeyboardInputModeController sharedInputModeController];
        double v12 = [v11 currentInputMode];
        double v13 = +[UIKBRenderConfig configForAppearance:v10 inputMode:v12 traitEnvironment:0];
        uint64_t v14 = [v13 blurEffectStyle];

        [(UISystemInputViewController *)self setBlurEffectStyle:v14];
        id v16 = [(UIViewController *)self view];
        v15 = +[UIBlurEffect effectWithStyle:[(UISystemInputViewController *)self blurEffectStyle]];
        [v16 setEffect:v15];
      }
    }
  }
}

- (void)reloadInputViewsForPersistentDelegate
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  if (+[UIKeyboard usesInputSystemUI])
  {
    double v3 = [(UIViewController *)self _window];
    uint64_t v4 = [v3 screen];
    uint64_t v5 = [v4 traitCollection];
    uint64_t v6 = [v5 userInterfaceIdiom];

    if (v6 == 3)
    {
      uint64_t v7 = +[UIKeyboardImpl activeInstance];
      id v8 = [v7 inputDelegate];

      id v9 = +[UIWindowScene _keyWindowScene]();
      uint64_t v10 = [v9 screen];

      if (v8)
      {
        double v11 = [v8 _responderWindow];
        double v12 = [v11 screen];
        if (v12 == v10)
        {
          double v13 = [(UIViewController *)self _window];
          uint64_t v14 = [v13 screen];

          if (v14 != v10) {
            [v8 resignFirstResponder];
          }
        }
        else
        {
        }
      }
    }
  }
  v15 = [(UISystemInputViewController *)self persistentDelegate];
  int v16 = [v15 isFirstResponder];

  if (v16)
  {
    id v17 = +[UIKeyboardImpl activeInstance];
    uint64_t v18 = [(UISystemInputViewController *)self persistentDelegate];
    [v17 setDelegate:v18];

    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    double v19 = [(UIViewController *)self childViewControllers];
    uint64_t v20 = [v19 countByEnumeratingWithState:&v33 objects:v37 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v34 != v22) {
            objc_enumerationMutation(v19);
          }
          uint64_t v24 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          v25 = [(UISystemInputViewController *)self keyboardVC];

          if (v24 != v25)
          {
            v26 = [(UISystemInputViewController *)self traitCollection];
            [v24 traitCollectionDidChange:v26];
          }
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v33 objects:v37 count:16];
      }
      while (v21);
    }

    return;
  }
  v27 = [(UISystemInputViewController *)self textInputTraits];
  if (([v27 forceSpellingDictation] & 1) == 0)
  {
    uint64_t v28 = [(UISystemInputViewController *)self textInputTraits];
    if (!UIKeyboardTypeSupportsDictationSpelling([v28 dictationKeyboardType]))
    {
      v30 = [(UISystemInputViewController *)self textInputTraits];
      char v31 = [v30 isSecureTextEntry];

      if ((v31 & 1) == 0) {
        goto LABEL_25;
      }
      goto LABEL_24;
    }
  }
LABEL_24:
  uint64_t v29 = +[UIDictationController activeInstance];
  [v29 markKeyboardDidReset];

LABEL_25:
  [(UISystemInputViewController *)self setupKeyboard];
  id v32 = [(UIViewController *)self view];
  [v32 setNeedsUpdateConstraints];
}

- (BOOL)willShowRecentsList
{
  double v3 = [(UISystemInputViewController *)self cachedRecents];
  if (!v3)
  {
    uint64_t v4 = [(UISystemInputViewController *)self textInputTraits];
    char v5 = [v4 isSecureTextEntry];

    if (v5) {
      goto LABEL_5;
    }
    uint64_t v6 = (void *)MEMORY[0x1E4FAE450];
    uint64_t v7 = [(UISystemInputViewController *)self textInputTraits];
    double v3 = [v6 traitsForUITextInputTraits:v7];

    id v8 = (void *)MEMORY[0x1E4FAE3E8];
    id v9 = [v3 recentInputIdentifier];
    uint64_t v10 = [v8 recentInputForIdentifier:v9];

    double v11 = +[UILexicon _lexiconWithTILexicon:v10];
    [(UISystemInputViewController *)self setCachedRecents:v11];
  }
LABEL_5:
  double v12 = [(UISystemInputViewController *)self cachedRecents];
  double v13 = [v12 entries];
  if ([v13 count]) {
    BOOL v14 = [(UISystemInputViewController *)self supportsRecentInputsIntegration];
  }
  else {
    BOOL v14 = 0;
  }

  return v14;
}

- (id)constraintFromView:(id)a3 attribute:(int64_t)a4 toView:(id)a5 attribute:(int64_t)a6
{
  return (id)[MEMORY[0x1E4F5B268] constraintWithItem:a3 attribute:a4 relatedBy:0 toItem:a5 attribute:a6 multiplier:1.0 constant:0.0];
}

- (void)updateAlignmentConstraints
{
  if (![(UISystemInputViewController *)self willPresentFullscreen]) {
    return;
  }
  id v22 = [MEMORY[0x1E4F1CA48] array];
  double v3 = [(UISystemInputViewController *)self alignmentConstraintForAxis:0];
  if (!v3)
  {
    uint64_t v4 = (void *)MEMORY[0x1E4F5B268];
    char v5 = [(UISystemInputViewController *)self contentLayoutView];
    uint64_t v6 = [(UISystemInputViewController *)self containingView];
    double v3 = [v4 constraintWithItem:v5 attribute:9 relatedBy:0 toItem:v6 attribute:9 multiplier:1.0 constant:0.0];

    [(UISystemInputViewController *)self setAlignmentConstraint:v3 forAxis:0];
    [v22 addObject:v3];
  }
  uint64_t v7 = [(UISystemInputViewController *)self contentLayoutView];
  uint64_t v8 = [(UISystemInputViewController *)self recentsVC];
  if (v8)
  {
    id v9 = (void *)v8;
    uint64_t v10 = [(UIViewController *)self childViewControllers];
    double v11 = [(UISystemInputViewController *)self recentsVC];
    int v12 = [v10 containsObject:v11];

    if (v12)
    {
      double v13 = [(UISystemInputViewController *)self recentsVC];
      uint64_t v14 = [v13 view];

      uint64_t v7 = (void *)v14;
    }
  }
  v15 = [(UISystemInputViewController *)self alignmentConstraintForAxis:1];
  if (!v15) {
    goto LABEL_10;
  }
  int v16 = v15;
  id v17 = [v15 firstItem];

  if (v17 != v7)
  {
    uint64_t v18 = [(UISystemInputViewController *)self containingView];
    [v18 removeConstraint:v16];

    [(UISystemInputViewController *)self setAlignmentConstraint:0 forAxis:1];
LABEL_10:
    double v19 = (void *)MEMORY[0x1E4F5B268];
    uint64_t v20 = [(UISystemInputViewController *)self containingView];
    int v16 = [v19 constraintWithItem:v7 attribute:10 relatedBy:0 toItem:v20 attribute:10 multiplier:1.0 constant:0.0];

    [(UISystemInputViewController *)self setAlignmentConstraint:v16 forAxis:1];
    [v22 addObject:v16];
  }
  uint64_t v21 = [(UISystemInputViewController *)self containingView];
  [v21 addConstraints:v22];
}

- (void)updateViewConstraints
{
  v103[3] = *MEMORY[0x1E4F143B8];
  v96.receiver = self;
  v96.super_class = (Class)UISystemInputViewController;
  [(UIViewController *)&v96 updateViewConstraints];
  id v3 = [(UISystemInputViewController *)self contentLayoutView];
  uint64_t v4 = [(UISystemInputViewController *)self recentsVC];
  char v5 = [v4 view];
  int v6 = [v5 isDescendantOfView:v3];

  int v83 = v6;
  if (v6)
  {
    uint64_t v7 = [(UISystemInputViewController *)self recentsVC];
LABEL_7:
    uint64_t v14 = v7;
    uint64_t v15 = [v7 view];

    goto LABEL_8;
  }
  uint64_t v8 = [(UISystemInputViewController *)self inputVC];
  id v9 = [v8 view];
  int v10 = [v9 isDescendantOfView:v3];

  if (v10)
  {
    uint64_t v7 = [(UISystemInputViewController *)self inputVC];
    goto LABEL_7;
  }
  double v11 = [(UISystemInputViewController *)self keyboardVC];
  int v12 = [v11 view];
  int v13 = [v12 isDescendantOfView:v3];

  if (v13)
  {
    uint64_t v7 = [(UISystemInputViewController *)self keyboardVC];
    goto LABEL_7;
  }
  uint64_t v15 = 0;
LABEL_8:
  int v16 = [(UISystemInputViewController *)self editorVC];
  uint64_t v17 = [v16 view];

  uint64_t v18 = [(UISystemInputViewController *)self _accessoryViewControllerForEdge:0];
  uint64_t v19 = [v18 view];

  uint64_t v20 = [(UISystemInputViewController *)self _accessoryViewControllerForEdge:2];
  uint64_t v21 = [v20 view];

  id v22 = [(UISystemInputViewController *)self _accessoryViewControllerForEdge:1];
  uint64_t v23 = [v22 view];

  uint64_t v24 = [(UISystemInputViewController *)self _accessoryViewControllerForEdge:3];
  uint64_t v25 = [v24 view];

  v88 = (void *)v19;
  if (v19) {
    v26 = (void *)v19;
  }
  else {
    v26 = v3;
  }
  if (v17) {
    v26 = (void *)v17;
  }
  id v87 = v26;
  if (v87 == v3) {
    uint64_t v27 = 3;
  }
  else {
    uint64_t v27 = 4;
  }
  v93 = (void *)v23;
  if (v23) {
    uint64_t v28 = (void *)v23;
  }
  else {
    uint64_t v28 = v3;
  }
  if (v23) {
    uint64_t v29 = 2;
  }
  else {
    uint64_t v29 = 1;
  }
  uint64_t v89 = v29;
  id v86 = v28;
  v92 = (void *)v25;
  if (v25) {
    v30 = (void *)v25;
  }
  else {
    v30 = v3;
  }
  if (v25) {
    uint64_t v31 = 1;
  }
  else {
    uint64_t v31 = 2;
  }
  id v85 = v30;
  if (v15) {
    id v32 = (void *)v15;
  }
  else {
    id v32 = v3;
  }
  id v91 = v32;
  v94 = (void *)v21;
  if (v21) {
    long long v33 = (void *)v21;
  }
  else {
    long long v33 = (void *)v15;
  }
  id v34 = v33;
  long long v35 = (void *)v15;
  id v90 = v34;
  v95 = (void *)v17;
  if (v15)
  {
    long long v36 = [(UISystemInputViewController *)self keyboardConstraints];

    if (v36)
    {
      v37 = [(UISystemInputViewController *)self keyboardConstraints];
      [v3 removeConstraints:v37];
    }
    if (v83)
    {
      uint64_t v38 = [MEMORY[0x1E4F5B268] constraintWithItem:v35 attribute:1 relatedBy:1 toItem:v86 attribute:1 multiplier:1.0 constant:0.0];
      [MEMORY[0x1E4F5B268] constraintWithItem:v35 attribute:2 relatedBy:-1 toItem:v85 attribute:2 multiplier:1.0 constant:0.0];
    }
    else
    {
      uint64_t v38 = [(UISystemInputViewController *)self constraintFromView:v35 attribute:1 toView:v86 attribute:v89];
      [(UISystemInputViewController *)self constraintFromView:v35 attribute:2 toView:v85 attribute:v31];
    id v39 = };
    id v40 = [(UISystemInputViewController *)self constraintFromView:v35 attribute:3 toView:v87 attribute:v27];
    v103[0] = v38;
    v103[1] = v39;
    v103[2] = v40;
    id v41 = [MEMORY[0x1E4F1C978] arrayWithObjects:v103 count:3];
    if ([(UISystemInputViewController *)self supportsTouchInput])
    {
      id v42 = [v35 superview];
      [(UISystemInputViewController *)self constraintFromView:v35 attribute:9 toView:v42 attribute:9];
      id v44 = v43 = v38;

      uint64_t v45 = [v41 arrayByAddingObject:v44];

      uint64_t v38 = v43;
      id v41 = (void *)v45;
    }
    if (!v94)
    {
      [v3 safeAreaLayoutGuide];
      char v46 = v84 = v38;
      long long v47 = [v46 bottomAnchor];
      char v48 = [v35 bottomAnchor];
      long long v49 = [v47 constraintEqualToAnchor:v48];

      uint64_t v38 = v84;
      uint64_t v50 = [v41 arrayByAddingObject:v49];

      id v34 = v90;
      id v41 = (void *)v50;
    }
    [(UISystemInputViewController *)self setKeyboardConstraints:v41];
    double v51 = [(UISystemInputViewController *)self keyboardConstraints];
    [v3 addConstraints:v51];

    uint64_t v17 = (uint64_t)v95;
  }
  if (v17)
  {
    double v52 = [(UISystemInputViewController *)self editorConstraints];

    if (v52)
    {
      double v53 = [(UISystemInputViewController *)self editorConstraints];
      [v3 removeConstraints:v53];
    }
    v54 = [(UISystemInputViewController *)self constraintFromView:v95 attribute:1 toView:v86 attribute:v89];
    uint64_t v55 = [(UISystemInputViewController *)self constraintFromView:v95 attribute:7 toView:v91 attribute:7];
    v56 = (void *)v55;
    if (v88)
    {
      v101[0] = v54;
      v101[1] = v55;
      v57 = [MEMORY[0x1E4F1C978] arrayWithObjects:v101 count:2];
      [(UISystemInputViewController *)self setEditorConstraints:v57];
    }
    else
    {
      v57 = [(UISystemInputViewController *)self constraintFromView:v95 attribute:3 toView:v3 attribute:3];
      v102[0] = v54;
      v102[1] = v56;
      v102[2] = v57;
      v58 = [MEMORY[0x1E4F1C978] arrayWithObjects:v102 count:3];
      [(UISystemInputViewController *)self setEditorConstraints:v58];
    }
    unint64_t v59 = [(UISystemInputViewController *)self editorConstraints];
    [v3 addConstraints:v59];
  }
  if (v88)
  {
    v60 = [(UISystemInputViewController *)self constraintFromView:v88 attribute:1 toView:v86 attribute:v89];
    v61 = [(UISystemInputViewController *)self constraintFromView:v88 attribute:7 toView:v91 attribute:7];
    uint64_t v62 = [(UISystemInputViewController *)self constraintFromView:v88 attribute:3 toView:v3 attribute:3];
    if (v95) {
      v63 = v95;
    }
    else {
      v63 = v35;
    }
    v64 = [(UISystemInputViewController *)self constraintFromView:v88 attribute:4 toView:v63 attribute:3];
    v100[0] = v60;
    v100[1] = v61;
    v100[2] = v62;
    v100[3] = v64;
    v65 = [MEMORY[0x1E4F1C978] arrayWithObjects:v100 count:4];
    [(UISystemInputViewController *)self setConstraints:v65 forEdge:0];

    id v34 = v90;
  }
  v66 = v94;
  if (v94)
  {
    v67 = [(UISystemInputViewController *)self constraintFromView:v94 attribute:1 toView:v86 attribute:v89];
    id v68 = [(UISystemInputViewController *)self constraintFromView:v94 attribute:7 toView:v91 attribute:7];
    if (v35) {
      uint64_t v69 = v35;
    }
    else {
      uint64_t v69 = v95;
    }
    uint64_t v70 = [(UISystemInputViewController *)self constraintFromView:v94 attribute:3 toView:v69 attribute:4];
    uint64_t v71 = [(UISystemInputViewController *)self constraintFromView:v94 attribute:4 toView:v3 attribute:4];
    v99[0] = v67;
    v99[1] = v68;
    v99[2] = v70;
    v99[3] = v71;
    v72 = [MEMORY[0x1E4F1C978] arrayWithObjects:v99 count:4];
    [(UISystemInputViewController *)self setConstraints:v72 forEdge:2];

    id v34 = v90;
    v66 = v94;
  }
  int v73 = v93;
  if (v93)
  {
    v74 = [(UISystemInputViewController *)self constraintFromView:v93 attribute:3 toView:v3 attribute:3];
    v75 = [(UISystemInputViewController *)self constraintFromView:v93 attribute:4 toView:v34 attribute:4];
    v76 = [(UISystemInputViewController *)self constraintFromView:v93 attribute:1 toView:v3 attribute:1];
    v98[0] = v74;
    v98[1] = v75;
    v98[2] = v76;
    v77 = [MEMORY[0x1E4F1C978] arrayWithObjects:v98 count:3];
    [(UISystemInputViewController *)self setConstraints:v77 forEdge:1];

    id v34 = v90;
    int v73 = v93;
  }
  v78 = v92;
  if (v92)
  {
    v79 = [(UISystemInputViewController *)self constraintFromView:v92 attribute:3 toView:v3 attribute:3];
    v80 = [(UISystemInputViewController *)self constraintFromView:v92 attribute:4 toView:v34 attribute:4];
    v81 = [(UISystemInputViewController *)self constraintFromView:v92 attribute:2 toView:v3 attribute:2];
    v97[0] = v79;
    v97[1] = v80;
    v97[2] = v81;
    v82 = [MEMORY[0x1E4F1C978] arrayWithObjects:v97 count:3];
    [(UISystemInputViewController *)self setConstraints:v82 forEdge:3];

    id v34 = v90;
    int v73 = v93;

    v78 = v92;
  }
}

- (id)constraintsForEdge:(int64_t)a3
{
  accessoryConstraints = self->_accessoryConstraints;
  uint64_t v4 = [NSNumber numberWithInteger:a3];
  char v5 = [(NSMutableDictionary *)accessoryConstraints objectForKey:v4];

  return v5;
}

- (void)setConstraints:(id)a3 forEdge:(int64_t)a4
{
  id v10 = a3;
  int v6 = [(UISystemInputViewController *)self constraintsForEdge:a4];
  if (v6)
  {
    uint64_t v7 = [(UISystemInputViewController *)self contentLayoutView];
    [v7 removeConstraints:v6];
  }
  accessoryConstraints = self->_accessoryConstraints;
  id v9 = [NSNumber numberWithInteger:a4];
  if (v10)
  {
    [(NSMutableDictionary *)accessoryConstraints setObject:v10 forKey:v9];

    id v9 = [(UISystemInputViewController *)self contentLayoutView];
    [v9 addConstraints:v10];
  }
  else
  {
    [(NSMutableDictionary *)accessoryConstraints removeObjectForKey:v9];
  }
}

- (void)_addAccessoryViewController:(id)a3
{
  if (a3)
  {
    id v9 = a3;
    [(UIViewController *)self addChildViewController:v9];
    uint64_t v4 = [(UISystemInputViewController *)self contentLayoutView];
    char v5 = [v9 view];
    [v4 addSubview:v5];

    int v6 = [(UISystemInputViewController *)self contentLayoutView];
    uint64_t v7 = [(UISystemInputViewController *)self keyboardVC];
    uint64_t v8 = [v7 view];
    [v6 bringSubviewToFront:v8];

    [v9 didMoveToParentViewController:self];
  }
}

- (void)_removeAccessoryViewController:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v3 = [v4 view];
    [v3 removeFromSuperview];

    [v4 removeFromParentViewController];
  }
}

- (unint64_t)_verticalLayoutTypeForEdge:(int64_t)a3
{
  if (((a3 - 1) & 0xFFFFFFFFFFFFFFFDLL) != 0) {
    return 3;
  }
  else {
    return 1;
  }
}

- (unint64_t)_horizontalLayoutTypeForEdge:(int64_t)a3
{
  if (((a3 - 1) & 0xFFFFFFFFFFFFFFFDLL) != 0) {
    return 1;
  }
  else {
    return 3;
  }
}

- (id)_accessoryViewControllerForEdge:(int64_t)a3
{
  accessoryViewControllers = self->_accessoryViewControllers;
  id v4 = [NSNumber numberWithInteger:a3];
  char v5 = [(NSMutableDictionary *)accessoryViewControllers objectForKey:v4];

  return v5;
}

- (id)accessoryViewControllerForEdge:(int64_t)a3
{
  id v3 = [(UISystemInputViewController *)self _accessoryViewControllerForEdge:a3];
  id v4 = [v3 childViewControllers];
  char v5 = [v4 firstObject];

  return v5;
}

- (void)setAccessoryViewController:(id)a3 forEdge:(int64_t)a4
{
  id v15 = a3;
  if (!self->_accessoryViewControllers)
  {
    int v6 = (NSMutableDictionary *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:4];
    accessoryViewControllers = self->_accessoryViewControllers;
    self->_accessoryViewControllers = v6;

    uint64_t v8 = (NSMutableDictionary *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:4];
    accessoryConstraints = self->_accessoryConstraints;
    self->_accessoryConstraints = v8;
  }
  id v10 = [(UISystemInputViewController *)self _accessoryViewControllerForEdge:a4];
  [(UISystemInputViewController *)self _removeAccessoryViewController:v10];
  if (v15)
  {
    double v11 = +[UIKBSystemLayoutViewController systemLayoutViewControllerWithViewController:v15];
    objc_msgSend(v11, "setVerticalLayoutType:", -[UISystemInputViewController _verticalLayoutTypeForEdge:](self, "_verticalLayoutTypeForEdge:", a4));
    objc_msgSend(v11, "setHorizontalLayoutType:", -[UISystemInputViewController _horizontalLayoutTypeForEdge:](self, "_horizontalLayoutTypeForEdge:", a4));
    int v12 = self->_accessoryViewControllers;
    int v13 = [NSNumber numberWithInteger:a4];
    [(NSMutableDictionary *)v12 setObject:v11 forKey:v13];

    [(UISystemInputViewController *)self _addAccessoryViewController:v11];
  }
  else
  {
    uint64_t v14 = self->_accessoryViewControllers;
    double v11 = [NSNumber numberWithInteger:a4];
    [(NSMutableDictionary *)v14 removeObjectForKey:v11];
  }

  [(UISystemInputViewController *)self updateViewConstraints];
}

- (id)alignmentConstraintArrayForAxis:(int64_t)a3
{
  if (a3 == 1)
  {
    id v3 = [(UISystemInputViewController *)self verticalAlignments];
  }
  else if (a3)
  {
    id v3 = 0;
  }
  else
  {
    id v3 = [(UISystemInputViewController *)self horizontalAlignments];
  }
  return v3;
}

- (void)setAlignmentConstraintArray:(id)a3 forAxis:(int64_t)a4
{
  id v6 = a3;
  if (a4 == 1)
  {
    id v7 = v6;
    [(UISystemInputViewController *)self setVerticalAlignments:v6];
  }
  else
  {
    if (a4) {
      goto LABEL_6;
    }
    id v7 = v6;
    [(UISystemInputViewController *)self setHorizontalAlignments:v6];
  }
  id v6 = v7;
LABEL_6:
}

- (id)alignmentConstraintForAxis:(int64_t)a3
{
  if (a3 == 1)
  {
    id v3 = [(UISystemInputViewController *)self verticalAlignments];
    goto LABEL_5;
  }
  if (!a3)
  {
    id v3 = [(UISystemInputViewController *)self horizontalAlignments];
LABEL_5:
    id v4 = v3;
    char v5 = [v3 firstObject];

    goto LABEL_7;
  }
  char v5 = 0;
LABEL_7:
  return v5;
}

- (void)setAlignmentConstraint:(id)a3 forAxis:(int64_t)a4
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = v6;
  if (a4 == 1)
  {
    if (!v6)
    {
      [(UISystemInputViewController *)self setVerticalAlignments:0];
      goto LABEL_10;
    }
    id v9 = v6;
    uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v9 count:1];
    [(UISystemInputViewController *)self setVerticalAlignments:v8];
LABEL_7:

    goto LABEL_10;
  }
  if (!a4)
  {
    if (!v6)
    {
      [(UISystemInputViewController *)self setHorizontalAlignments:0];
      goto LABEL_10;
    }
    v10[0] = v6;
    uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
    [(UISystemInputViewController *)self setHorizontalAlignments:v8];
    goto LABEL_7;
  }
LABEL_10:
}

- (void)setPersistentDelegate:(id)a3
{
  id v9 = a3;
  char v5 = [(UISystemInputViewController *)self persistentDelegate];
  char v6 = [v5 isFirstResponder];

  objc_storeStrong((id *)&self->_persistentDelegate, a3);
  if ((v6 & 1) != 0 || [v9 isFirstResponder])
  {
    id v7 = +[UIKeyboardImpl activeInstance];
    uint64_t v8 = [(UISystemInputViewController *)self persistentDelegate];
    [v7 setDelegate:v8];
  }
}

- (void)_resetDelegate
{
  id v3 = +[UIKeyboardImpl activeInstance];
  [v3 setTextInputChangesIgnored:1];

  id v4 = [(UISystemInputViewController *)self persistentDelegate];
  char v5 = [v4 isFirstResponder];

  if ((v5 & 1) == 0)
  {
    char v6 = [(UISystemInputViewController *)self persistentDelegate];
    [v6 becomeFirstResponder];
  }
  id v7 = +[UIKeyboardImpl activeInstance];
  [v7 setTextInputChangesIgnored:0];

  uint64_t v8 = [(UISystemInputViewController *)self persistentDelegate];
  if (v8)
  {
    id v9 = (void *)v8;
    id v10 = +[UIKeyboardImpl sharedInstance];
    double v11 = [v10 delegate];
    int v12 = [(UISystemInputViewController *)self persistentDelegate];

    if (v11 != v12)
    {
      id v14 = +[UIKeyboardImpl sharedInstance];
      int v13 = [(UISystemInputViewController *)self persistentDelegate];
      [v14 setDelegate:v13];
    }
  }
}

- (void)_clearCursorLocationIfNotFirstResponder
{
  id v3 = [(UISystemInputViewController *)self persistentDelegate];
  char v4 = [v3 isFirstResponder];

  if ((v4 & 1) == 0)
  {
    id v5 = [(UISystemInputViewController *)self keyboard];
    [v5 setCursorLocation:0];
  }
}

- (void)setupKeyboard
{
  id v3 = [(UISystemInputViewController *)self keyboard];
  objc_msgSend(v3, "_setDisableTouchInput:", -[UISystemInputViewController supportsTouchInput](self, "supportsTouchInput") ^ 1);

  char v4 = [(UISystemInputViewController *)self keyboard];
  objc_msgSend(v4, "_setUseLinearLayout:", -[UISystemInputViewController supportsTouchInput](self, "supportsTouchInput"));

  id v5 = [(UISystemInputViewController *)self keyboard];
  objc_msgSend(v5, "_setUseRecentsAlert:", -[UISystemInputViewController supportsRecentInputsIntegration](self, "supportsRecentInputsIntegration") ^ 1);

  [(UISystemInputViewController *)self _resetDelegate];
  char v6 = [(UIViewController *)self _window];

  if (v6)
  {
    id v7 = [(UISystemInputViewController *)self keyboardVC];
    [v7 assertCurrentInputModeIfNecessary];
  }
  [(UISystemInputViewController *)self configureRecentsVCIfNecessary];
  uint64_t v8 = [(UISystemInputViewController *)self keyboard];
  char v9 = [v8 isActive];

  if ((v9 & 1) == 0)
  {
    id v10 = [(UISystemInputViewController *)self keyboard];
    [v10 activate];

    double v11 = [(UIViewController *)self view];
    [v11 setNeedsLayout];

    int v12 = [(UISystemInputViewController *)self contentLayoutView];
    [v12 setNeedsLayout];
  }
  [(UISystemInputViewController *)self _clearCursorLocationIfNotFirstResponder];
  int v13 = [(UISystemInputViewController *)self keyboard];
  objc_msgSend(v13, "_setDisableTouchInput:", -[UISystemInputViewController supportsTouchInput](self, "supportsTouchInput") ^ 1);

  id v14 = [(UISystemInputViewController *)self keyboard];
  objc_msgSend(v14, "_setUseRecentsAlert:", -[UISystemInputViewController supportsRecentInputsIntegration](self, "supportsRecentInputsIntegration") ^ 1);

  +[UIDictationController keyboardDidUpdateOnScreenStatus];
}

- (void)viewWillLayoutSubviews
{
  v2.receiver = self;
  v2.super_class = (Class)UISystemInputViewController;
  [(UIViewController *)&v2 viewWillLayoutSubviews];
}

- (void)viewWillAppear:(BOOL)a3
{
  v13.receiver = self;
  v13.super_class = (Class)UISystemInputViewController;
  [(UIViewController *)&v13 viewWillAppear:a3];
  BOOL needsSetupAgain = self->_needsSetupAgain;
  if (self->_needsSetupAgain)
  {
    self->_BOOL needsSetupAgain = 0;
    [(UISystemInputViewController *)self _addChildInputViewController];
    [(UISystemInputViewController *)self setupKeyboard];
  }
  int v5 = 1;
  self->_isVisible = 1;
  char v6 = [(UISystemInputViewController *)self recentsVC];
  if (v6)
  {
    id v7 = [(UIViewController *)self childViewControllers];
    uint64_t v8 = [(UISystemInputViewController *)self recentsVC];
    int v9 = [v7 containsObject:v8];

    int v5 = v9 ^ 1;
  }

  if ([(UISystemInputViewController *)self notifyKeyboardOnScreenOnFocusOnly])
  {
    id v10 = [(UISystemInputViewController *)self keyboard];
    int v11 = [v10 isFocused];
  }
  else
  {
    int v11 = 1;
  }
  if (needsSetupAgain) {
    int v12 = v11;
  }
  else {
    int v12 = 1;
  }
  if ((v5 & v12) == 1) {
    [(UISystemInputViewController *)self _setSystemInputInteractionActive:1];
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v13.receiver = self;
  v13.super_class = (Class)UISystemInputViewController;
  [(UIViewController *)&v13 viewWillDisappear:a3];
  char v4 = [(UISystemInputViewController *)self textInputTraits];
  if (([v4 forceSpellingDictation] & 1) == 0)
  {
    int v5 = [(UISystemInputViewController *)self textInputTraits];
    if (!UIKeyboardTypeSupportsDictationSpelling([v5 dictationKeyboardType]))
    {
      int v11 = [(UISystemInputViewController *)self textInputTraits];
      char v12 = [v11 isSecureTextEntry];

      if ((v12 & 1) == 0) {
        goto LABEL_6;
      }
      goto LABEL_5;
    }
  }
LABEL_5:
  char v6 = +[UIDictationController activeInstance];
  [v6 markKeyboardDidReset];

LABEL_6:
  self->_BOOL needsSetupAgain = 1;
  id v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v8 = [(UIResponder *)self _responderWindow];
  [v7 removeObserver:self name:@"_UIWindowWillBecomeApplicationKeyNotification" object:v8];

  int v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
  id v10 = [(UIResponder *)self _responderWindow];
  [v9 removeObserver:self name:@"_UIWindowDidBecomeApplicationKeyNotification" object:v10];

  self->_isVisible = 0;
  [(UISystemInputViewController *)self _setSystemInputInteractionActive:0];
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  [(UISystemInputViewController *)self traitCollection];

  v5.receiver = self;
  v5.super_class = (Class)UISystemInputViewController;
  [(UIViewController *)&v5 traitCollectionDidChange:v4];
}

- (void)_didSuspend:(id)a3
{
  if (self->_isVisible)
  {
    id v4 = +[UIDictationController activeInstance];
    [v4 setPauseUpdatingHelperMessage:1];

    [(UISystemInputViewController *)self _setSystemInputInteractionActive:0];
  }
}

- (void)_willResume:(id)a3
{
  if ([(UISystemInputViewController *)self notifyKeyboardOnScreenOnFocusOnly])
  {
    id v4 = [(UISystemInputViewController *)self keyboard];
    char v5 = [v4 isFocused];

    char v6 = v5 ^ 1;
  }
  else
  {
    char v6 = 0;
  }
  if (self->_isVisible && (v6 & 1) == 0)
  {
    [(UISystemInputViewController *)self _setSystemInputInteractionActive:1];
    [(UISystemInputViewController *)self _updateRemoteTextEditingSession];
  }
  id v7 = [(UISystemInputViewController *)self keyboard];
  int v8 = [v7 isActive];

  if (v8)
  {
    [(UISystemInputViewController *)self _resetDelegate];
    int v9 = [(UISystemInputViewController *)self keyboard];
    [v9 activate];

    [(UISystemInputViewController *)self _clearCursorLocationIfNotFirstResponder];
  }
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (!v6)
  {
    self->_isVisible = 0;
    [(UISystemInputViewController *)self _setSystemInputInteractionActive:0];
  }
  v7.receiver = self;
  v7.super_class = (Class)UISystemInputViewController;
  [(UIViewController *)&v7 viewDidMoveToWindow:v6 shouldAppearOrDisappear:v4];
}

- (void)_setSystemInputInteractionActive:(BOOL)a3
{
  BOOL v3 = a3;
  char v5 = +[UIPeripheralHost sharedInstance];
  [v5 setKeyboardOnScreenNotifyKey:v3];

  activeSystemInputInteraction = self->_activeSystemInputInteraction;
  if (v3)
  {
    if (activeSystemInputInteraction) {
      return;
    }
    objc_super v7 = objc_alloc_init(_UISystemInputActivityInteraction);
    int v8 = self->_activeSystemInputInteraction;
    self->_activeSystemInputInteraction = (UIInteraction *)v7;

    int v11 = [(UIViewController *)self view];
    [v11 addInteraction:self->_activeSystemInputInteraction];
    int v9 = (UIInteraction *)v11;
  }
  else
  {
    if (!activeSystemInputInteraction) {
      return;
    }
    id v10 = [(UIViewController *)self view];
    [v10 removeInteraction:self->_activeSystemInputInteraction];

    int v9 = self->_activeSystemInputInteraction;
    self->_activeSystemInputInteraction = 0;
  }
}

+ (id)_canonicalTraitsForResponder:(id)a3
{
  return +[UITextInputTraits traitsByAdoptingTraits:a3];
}

- (BOOL)supportsTouchInput
{
  return self->_supportsTouchInput;
}

- (void)setSupportsTouchInput:(BOOL)a3
{
  self->_supportsTouchInput = a3;
}

- (BOOL)supportsRecentInputsIntegration
{
  return self->_supportsRecentInputsIntegration;
}

- (UISystemInputViewControllerDelegate)systemInputViewControllerDelegate
{
  return self->_systemInputViewControllerDelegate;
}

- (BOOL)isAutomaticResponderTransition
{
  return self->_isAutomaticResponderTransition;
}

- (void)setIsAutomaticResponderTransition:(BOOL)a3
{
  self->_isAutomaticResponderTransition = a3;
}

- (UITextInput)persistentDelegate
{
  return self->_persistentDelegate;
}

- (UIKeyboard)keyboard
{
  return self->_keyboard;
}

- (void)setKeyboard:(id)a3
{
}

- (NSArray)keyboardConstraints
{
  return self->_keyboardConstraints;
}

- (void)setKeyboardConstraints:(id)a3
{
}

- (UICompatibilityInputViewController)keyboardVC
{
  return self->_keyboardVC;
}

- (void)setKeyboardVC:(id)a3
{
}

- (NSArray)editorConstraints
{
  return self->_editorConstraints;
}

- (void)setEditorConstraints:(id)a3
{
}

- (UIKBSystemLayoutViewController)editorVC
{
  return self->_editorVC;
}

- (void)setEditorVC:(id)a3
{
}

- (UIButton)doneButton
{
  return self->_doneButton;
}

- (UIViewController)inputVC
{
  return self->_inputVC;
}

- (UIRecentsInputViewController)recentsVC
{
  return self->_recentsVC;
}

- (NSArray)verticalAlignments
{
  return self->_verticalAlignments;
}

- (void)setVerticalAlignments:(id)a3
{
}

- (NSArray)horizontalAlignments
{
  return self->_horizontalAlignments;
}

- (void)setHorizontalAlignments:(id)a3
{
}

- (UITextInput)nextInputDelegate
{
  return self->_nextInputDelegate;
}

- (void)setNextInputDelegate:(id)a3
{
}

- (void)setTextInputTraits:(id)a3
{
}

- (UILexicon)cachedRecents
{
  return self->_cachedRecents;
}

- (void)setCachedRecents:(id)a3
{
}

- (UILabel)_promptLabel
{
  return self->_promptLabel;
}

- (void)set_promptLabel:(id)a3
{
}

- (BOOL)notifyKeyboardOnScreenOnFocusOnly
{
  return self->_notifyKeyboardOnScreenOnFocusOnly;
}

- (void)setNotifyKeyboardOnScreenOnFocusOnly:(BOOL)a3
{
  self->_notifyKeyboardOnScreenOnFocusOnly = a3;
}

- (void)setResolvedKeyboardStyle:(int64_t)a3
{
  self->_resolvedKeyboardStyle = a3;
}

- (unint64_t)requestedInteractionModel
{
  return self->_requestedInteractionModel;
}

- (BOOL)willPresentFullscreen
{
  return self->_willPresentFullscreen;
}

- (void)setWillPresentFullscreen:(BOOL)a3
{
  self->_willPresentFullscreen = a3;
}

- (BOOL)willUpdateBackgroundEffectOnInputModeChange
{
  return self->_willUpdateBackgroundEffectOnInputModeChange;
}

- (void)setWillUpdateBackgroundEffectOnInputModeChange:(BOOL)a3
{
  self->_willUpdateBackgroundEffectOnInputModeChange = a3;
}

- (BOOL)didDisplayRecents
{
  return self->_didDisplayRecents;
}

- (void)setDidDisplayRecents:(BOOL)a3
{
  self->_didDisplayRecents = a3;
}

- (UIView)containingView
{
  return self->_containingView;
}

- (void)setContainingView:(id)a3
{
}

- (UIView)contentLayoutView
{
  return self->_contentLayoutView;
}

- (void)setContentLayoutView:(id)a3
{
}

- (int64_t)blurEffectStyle
{
  return self->_blurEffectStyle;
}

- (void)setBlurEffectStyle:(int64_t)a3
{
  self->_blurEffectStyle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentLayoutView, 0);
  objc_storeStrong((id *)&self->_containingView, 0);
  objc_storeStrong((id *)&self->_promptLabel, 0);
  objc_storeStrong((id *)&self->_cachedRecents, 0);
  objc_storeStrong((id *)&self->_textInputTraits, 0);
  objc_storeStrong((id *)&self->_nextInputDelegate, 0);
  objc_storeStrong((id *)&self->_horizontalAlignments, 0);
  objc_storeStrong((id *)&self->_verticalAlignments, 0);
  objc_storeStrong((id *)&self->_recentsVC, 0);
  objc_storeStrong((id *)&self->_inputVC, 0);
  objc_storeStrong((id *)&self->_doneButton, 0);
  objc_storeStrong((id *)&self->_editorVC, 0);
  objc_storeStrong((id *)&self->_editorConstraints, 0);
  objc_storeStrong((id *)&self->_keyboardVC, 0);
  objc_storeStrong((id *)&self->_keyboardConstraints, 0);
  objc_storeStrong((id *)&self->_keyboard, 0);
  objc_storeStrong((id *)&self->_persistentDelegate, 0);
  objc_storeStrong((id *)&self->_activeSystemInputInteraction, 0);
  objc_storeStrong((id *)&self->_remoteInputSessionIdentifier, 0);
  objc_storeStrong((id *)&self->_accessoryConstraints, 0);
  objc_storeStrong((id *)&self->_accessoryViewControllers, 0);
}

@end