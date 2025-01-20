@interface SPUIUnifiedFieldViewController
+ (double)insetMarginsForSearchField;
- (BOOL)_canShowWhileLocked;
- (BOOL)handlingKeyboardFrameChange;
- (BOOL)isUnifiedFieldDocked;
- (BOOL)tryToLayoutForBadFrame;
- (CALayer)searchProtectorLayer;
- (CGSize)dockedUnifiedFieldSize;
- (CGSize)unifiedFieldSize;
- (NSLayoutConstraint)leadingConstraint;
- (NSLayoutConstraint)trailingConstraint;
- (SBFFeatherBlurView)topBlur;
- (SPUIDynamicKeyboardVisualEffectView)keyboardVisualEffectView;
- (SPUINavigationController)searchNavigationController;
- (SPUINavigationSwipeRecognizerDelegate)swipeRecognizer;
- (SPUISearchHeader)searchHeader;
- (SPUITextField)fakeTextField;
- (SPUIUnifiedFieldViewController)initWithNavigationController:(id)a3;
- (SPUIUnifiedFieldViewControllerDelegate)delegate;
- (UIButton)backButton;
- (UIView)fakeOriginalLeftView;
- (UIView)originalLeftView;
- (double)keyboardProtectorHeight;
- (double)unifiedFieldCornerRadius;
- (id)generateBackButton;
- (int64_t)preferredUserInterfaceStyle;
- (void)dealloc;
- (void)dismissSingleLevelViewController;
- (void)doALayoutPass;
- (void)keyboardFrameChanged:(id)a3;
- (void)keyboardWillHide:(id)a3;
- (void)keyboardWillShow:(id)a3;
- (void)processStateForeground;
- (void)resetSearchFieldContentWithSearchToken:(id)a3 text:(id)a4 wantsBackButton:(BOOL)a5 transitionCoordinator:(id)a6;
- (void)setBackButton:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFakeOriginalLeftView:(id)a3;
- (void)setFakeTextField:(id)a3;
- (void)setHandlingKeyboardFrameChange:(BOOL)a3;
- (void)setKeyboardVisualEffectView:(id)a3;
- (void)setLeadingConstraint:(id)a3;
- (void)setOriginalLeftView:(id)a3;
- (void)setSwipeRecognizer:(id)a3;
- (void)setTopBlur:(id)a3;
- (void)setTrailingConstraint:(id)a3;
- (void)setTryToLayoutForBadFrame:(BOOL)a3;
- (void)viewDidLayoutSubviews;
@end

@implementation SPUIUnifiedFieldViewController

- (CALayer)searchProtectorLayer
{
  return (CALayer *)objc_getProperty(self, a2, 992, 1);
}

- (void)keyboardFrameChanged:(id)a3
{
  id v4 = a3;
  [(SPUIUnifiedFieldViewController *)self setHandlingKeyboardFrameChange:1];
  v5 = [v4 userInfo];
  v6 = [v5 objectForKeyedSubscript:*MEMORY[0x263F837B8]];
  [v6 CGRectValue];
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;

  v15 = [v4 userInfo];

  v16 = [v15 objectForKeyedSubscript:*MEMORY[0x263F83780]];
  [v16 floatValue];
  double v34 = v17;

  v18 = [(SPUIUnifiedFieldViewController *)self view];
  v19 = objc_msgSend(v18, "tlks_screen");
  [v19 bounds];
  CGFloat v21 = v20;
  CGFloat v23 = v22;
  CGFloat v25 = v24;
  CGFloat v27 = v26;

  v36.origin.x = v8;
  v36.origin.y = v10;
  v36.size.width = v12;
  v36.size.height = v14;
  v38.origin.x = v21;
  v38.origin.y = v23;
  v38.size.width = v25;
  v38.size.height = v27;
  CGRect v37 = CGRectIntersection(v36, v38);
  CGFloat Height = CGRectGetHeight(v37);
  v35[0] = MEMORY[0x263EF8330];
  v35[1] = 3221225472;
  v35[2] = __55__SPUIUnifiedFieldViewController_keyboardFrameChanged___block_invoke;
  v35[3] = &unk_264E90638;
  v35[4] = self;
  *(CGFloat *)&v35[5] = Height;
  [MEMORY[0x263F82E00] animateWithDuration:196608 delay:v35 options:0 animations:v34 completion:0.0];
  [(SPUIUnifiedFieldViewController *)self setHandlingKeyboardFrameChange:0];
  v29 = [(SPUIUnifiedFieldViewController *)self view];
  v30 = [v29 window];
  v31 = [v30 windowScene];
  uint64_t v32 = [v31 activationState];

  if (!v32)
  {
    v33 = [(SPUIUnifiedFieldViewController *)self delegate];
    [v33 unifiedFieldViewControllerDidLayoutForKeyboardFrameChange:self];
  }
}

- (void)setHandlingKeyboardFrameChange:(BOOL)a3
{
  self->_handlingKeyboardFrameChange = a3;
}

- (int64_t)preferredUserInterfaceStyle
{
  if ([MEMORY[0x263F79140] enableFloatingWindow]) {
    return 0;
  }
  else {
    return 2;
  }
}

- (BOOL)isUnifiedFieldDocked
{
  v3 = [(SPUIUnifiedFieldViewController *)self searchHeader];
  id v4 = [v3 searchField];
  if ([v4 isFirstResponder])
  {
    v5 = [(SPUIUnifiedFieldViewController *)self keyboardVisualEffectView];
    char v6 = [v5 hideVisualEffectView];
  }
  else
  {
    char v6 = 1;
  }

  return v6;
}

- (SPUIUnifiedFieldViewController)initWithNavigationController:(id)a3
{
  id v5 = a3;
  v71.receiver = self;
  v71.super_class = (Class)SPUIUnifiedFieldViewController;
  char v6 = [(SPUIUnifiedFieldViewController *)&v71 init];
  double v7 = v6;
  if (v6)
  {
    CGFloat v8 = [(SPUIUnifiedFieldViewController *)v6 view];
    [v8 _setOverrideVibrancyTrait:1];

    objc_storeStrong((id *)&v7->_searchNavigationController, a3);
    double v9 = [v5 searchViewController];
    uint64_t v10 = [v9 headerView];
    searchHeader = v7->_searchHeader;
    v7->_searchHeader = (SPUISearchHeader *)v10;

    [v5 setNavigationBarHidden:1];
    [v5 setUnifiedFieldDelegate:v7];
    [(SPUIUnifiedFieldViewController *)v7 addChildViewController:v5];
    CGFloat v12 = [(SPUIUnifiedFieldViewController *)v7 view];
    double v13 = [v5 view];
    [v12 addSubview:v13];

    CGFloat v14 = (void *)MEMORY[0x263F67C10];
    v15 = [v5 view];
    [v14 fillContainerWithView:v15];

    v16 = [[SPUINavigationSwipeRecognizerDelegate alloc] initWithNavigationController:v7->_searchNavigationController];
    [(SPUIUnifiedFieldViewController *)v7 setSwipeRecognizer:v16];

    float v17 = [(SPUIUnifiedFieldViewController *)v7 swipeRecognizer];
    v18 = [v5 interactivePopGestureRecognizer];
    [v18 setDelegate:v17];

    v19 = objc_opt_new();
    [(SPUIUnifiedFieldViewController *)v7 setKeyboardVisualEffectView:v19];
    double v20 = [(SPUIUnifiedFieldViewController *)v7 keyboardVisualEffectView];
    uint64_t v21 = [v20 layer];
    searchProtectorLayer = v7->_searchProtectorLayer;
    v7->_searchProtectorLayer = (CALayer *)v21;

    CGFloat v23 = [(SPUIUnifiedFieldViewController *)v7 view];
    [v23 addSubview:v19];

    double v24 = [(SPUIUnifiedFieldViewController *)v7 view];
    CGFloat v25 = [(SPUIUnifiedFieldViewController *)v7 searchHeader];
    [v24 addSubview:v25];

    double v26 = [(SPUIUnifiedFieldViewController *)v7 searchHeader];
    [v26 setTranslatesAutoresizingMaskIntoConstraints:0];

    CGFloat v27 = [(SPUIUnifiedFieldViewController *)v7 searchHeader];
    v28 = [v27 bottomAnchor];
    v29 = [(SPUIUnifiedFieldViewController *)v7 view];
    v30 = [v29 keyboardLayoutGuide];
    v31 = [v30 topAnchor];
    uint64_t v32 = [v28 constraintEqualToAnchor:v31];

    LODWORD(v33) = 1148829696;
    [v32 setPriority:v33];
    [v32 setActive:1];
    double v34 = [(SPUIUnifiedFieldViewController *)v7 view];
    v35 = [v34 bottomAnchor];
    CGRect v36 = [(SPUIUnifiedFieldViewController *)v7 searchHeader];
    CGRect v37 = [v36 bottomAnchor];
    CGRect v38 = [v35 constraintGreaterThanOrEqualToAnchor:v37 constant:16.0];

    [v38 setActive:1];
    v39 = [(SPUIUnifiedFieldViewController *)v7 searchHeader];
    v40 = [v39 leadingAnchor];
    v41 = [(SPUIUnifiedFieldViewController *)v7 view];
    v42 = [v41 leadingAnchor];
    v43 = [v40 constraintEqualToAnchor:v42];
    [(SPUIUnifiedFieldViewController *)v7 setLeadingConstraint:v43];

    v44 = [(SPUIUnifiedFieldViewController *)v7 leadingConstraint];
    [v44 setActive:1];

    v45 = [(SPUIUnifiedFieldViewController *)v7 searchHeader];
    v46 = [v45 trailingAnchor];
    v47 = [(SPUIUnifiedFieldViewController *)v7 view];
    v48 = [v47 trailingAnchor];
    v49 = [v46 constraintEqualToAnchor:v48];
    [(SPUIUnifiedFieldViewController *)v7 setTrailingConstraint:v49];

    v50 = [(SPUIUnifiedFieldViewController *)v7 trailingConstraint];
    [v50 setActive:1];

    v51 = (void *)[objc_alloc(MEMORY[0x263F79198]) initWithRecipe:5];
    [(SPUIUnifiedFieldViewController *)v7 setTopBlur:v51];

    v52 = [(SPUIUnifiedFieldViewController *)v7 view];
    v53 = [(SPUIUnifiedFieldViewController *)v7 topBlur];
    [v52 addSubview:v53];

    v54 = [(SPUIUnifiedFieldViewController *)v7 topBlur];
    v55 = [v5 searchViewController];
    [v55 setTopBlurView:v54];

    v56 = objc_opt_new();
    [(SPUIUnifiedFieldViewController *)v7 setFakeTextField:v56];

    v57 = [(SPUIUnifiedFieldViewController *)v7 fakeTextField];
    [v57 setUserInteractionEnabled:0];

    v58 = [MEMORY[0x263F825C8] clearColor];
    v59 = [(SPUIUnifiedFieldViewController *)v7 fakeTextField];
    [v59 setTokenBackgroundColor:v58];

    v60 = [(SPUIUnifiedFieldViewController *)v7 fakeTextField];
    [v60 setSymbolAnimationEnabled:0];

    v61 = [(SPUIUnifiedFieldViewController *)v7 fakeTextField];
    [v61 setCanAcquireFieldEditor:0];

    v62 = [(SPUIUnifiedFieldViewController *)v7 fakeTextField];
    [v62 setTextAlignment:1];

    v63 = [(SPUIUnifiedFieldViewController *)v7 fakeTextField];
    v64 = [v63 leftView];
    [(SPUIUnifiedFieldViewController *)v7 setFakeOriginalLeftView:v64];

    v65 = [MEMORY[0x263F08A00] defaultCenter];
    [v65 addObserver:v7 selector:sel_keyboardFrameChanged_ name:*MEMORY[0x263F837F8] object:0];

    v66 = [MEMORY[0x263F08A00] defaultCenter];
    [v66 addObserver:v7 selector:sel_keyboardWillShow_ name:*MEMORY[0x263F83808] object:0];

    v67 = [MEMORY[0x263F08A00] defaultCenter];
    [v67 addObserver:v7 selector:sel_keyboardWillHide_ name:*MEMORY[0x263F83800] object:0];

    v68 = [MEMORY[0x263F08A00] defaultCenter];
    [v68 addObserver:v7 selector:sel_processStateForeground name:*MEMORY[0x263F83928] object:0];

    v69 = [MEMORY[0x263F08A00] defaultCenter];
    [v69 addObserver:v7 selector:sel_doALayoutPass name:@"SPUILayoutPass" object:0];
  }
  return v7;
}

- (SPUITextField)fakeTextField
{
  return (SPUITextField *)objc_getProperty(self, a2, 1072, 1);
}

- (void)viewDidLayoutSubviews
{
  v38.receiver = self;
  v38.super_class = (Class)SPUIUnifiedFieldViewController;
  [(SPUIUnifiedFieldViewController *)&v38 viewDidLayoutSubviews];
  [(SPUIUnifiedFieldViewController *)self keyboardProtectorHeight];
  double v4 = v3;
  id v5 = [(SPUIUnifiedFieldViewController *)self keyboardVisualEffectView];
  [v5 setSearchFieldHeight:v4];

  char v6 = [(SPUIUnifiedFieldViewController *)self view];
  [v6 bounds];
  double v8 = v7;
  double v10 = v9;

  double v11 = [(SPUIUnifiedFieldViewController *)self searchHeader];
  [v11 frame];
  double MinY = CGRectGetMinY(v39);

  double v13 = [(SPUIUnifiedFieldViewController *)self view];
  [v13 bounds];
  CGFloat v14 = CGRectGetHeight(v40) - MinY;

  v15 = [(SPUIUnifiedFieldViewController *)self keyboardVisualEffectView];
  objc_msgSend(v15, "setFrame:", v8, MinY, v10, v14);

  v16 = [(SPUIUnifiedFieldViewController *)self searchHeader];
  [v16 frame];
  double v18 = v17;
  v19 = [(SPUIUnifiedFieldViewController *)self searchNavigationController];
  objc_msgSend(v19, "setAdditionalSafeAreaInsets:", 0.0, 0.0, v18, 0.0);

  double v20 = [(SPUIUnifiedFieldViewController *)self view];
  [v20 bounds];
  double v22 = v21;
  CGFloat v23 = [(SPUIUnifiedFieldViewController *)self view];
  double v24 = [v23 window];
  CGFloat v25 = [v24 windowScene];
  double v26 = [v25 statusBarManager];
  [v26 statusBarFrame];
  double v28 = v27;
  v29 = [(SPUIUnifiedFieldViewController *)self topBlur];
  objc_msgSend(v29, "setFrame:", 0.0, 0.0, v22, v28);

  v30 = [(SPUIUnifiedFieldViewController *)self delegate];
  objc_msgSend(v30, "unifiedFieldViewControllerDidLayoutUnifiedField:dueToKeyboardLayout:", self, -[SPUIUnifiedFieldViewController handlingKeyboardFrameChange](self, "handlingKeyboardFrameChange"));

  v31 = [(SPUIUnifiedFieldViewController *)self view];
  uint64_t v32 = [v31 keyboardLayoutGuide];
  [v32 layoutFrame];
  double v34 = v33;
  v35 = [(SPUIUnifiedFieldViewController *)self searchHeader];
  [v35 frame];
  if (v34 <= v36)
  {
  }
  else
  {
    BOOL v37 = [(SPUIUnifiedFieldViewController *)self tryToLayoutForBadFrame];

    if (!v37)
    {
      [(SPUIUnifiedFieldViewController *)self setTryToLayoutForBadFrame:1];
      [(SPUIUnifiedFieldViewController *)self doALayoutPass];
      [(SPUIUnifiedFieldViewController *)self setTryToLayoutForBadFrame:0];
    }
  }
}

- (SPUIDynamicKeyboardVisualEffectView)keyboardVisualEffectView
{
  return (SPUIDynamicKeyboardVisualEffectView *)objc_getProperty(self, a2, 1024, 1);
}

- (SBFFeatherBlurView)topBlur
{
  return (SBFFeatherBlurView *)objc_getProperty(self, a2, 1032, 1);
}

- (SPUINavigationController)searchNavigationController
{
  return (SPUINavigationController *)objc_getProperty(self, a2, 1000, 1);
}

- (double)keyboardProtectorHeight
{
  double v3 = [(SPUIUnifiedFieldViewController *)self searchHeader];
  double v4 = [v3 searchField];
  [v4 intrinsicContentSize];
  double v6 = v5;
  double v7 = [(SPUIUnifiedFieldViewController *)self searchHeader];
  [v7 bottomPadding];
  double v9 = v6 + v8;
  double v10 = [(SPUIUnifiedFieldViewController *)self searchHeader];
  [v10 topPadding];
  double v12 = v9 + v11;

  return v12;
}

- (CGSize)unifiedFieldSize
{
  v2 = [(SPUIUnifiedFieldViewController *)self searchHeader];
  double v3 = [v2 searchField];
  [v3 intrinsicContentSize];
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (SPUISearchHeader)searchHeader
{
  return (SPUISearchHeader *)objc_getProperty(self, a2, 1008, 1);
}

- (BOOL)handlingKeyboardFrameChange
{
  return self->_handlingKeyboardFrameChange;
}

- (SPUIUnifiedFieldViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SPUIUnifiedFieldViewControllerDelegate *)WeakRetained;
}

void __55__SPUIUnifiedFieldViewController_keyboardFrameChanged___block_invoke(uint64_t a1)
{
  BOOL v2 = *(double *)(a1 + 40) <= 0.0;
  double v3 = [*(id *)(a1 + 32) keyboardVisualEffectView];
  [v3 setHideVisualEffectView:v2];

  double v4 = [*(id *)(a1 + 32) keyboardVisualEffectView];
  [v4 setHideFeatheredBlur:0];

  BOOL v5 = *(double *)(a1 + 40) == 0.0;
  double v6 = [*(id *)(a1 + 32) keyboardVisualEffectView];
  [v6 setHideVisualEffectView:v5];

  [(id)objc_opt_class() insetMarginsForSearchField];
  double v8 = v7;
  if (*(double *)(a1 + 40) <= 0.0) {
    double v9 = v7;
  }
  else {
    double v9 = 0.0;
  }
  double v10 = [*(id *)(a1 + 32) leadingConstraint];
  [v10 setConstant:v9];

  if (*(double *)(a1 + 40) <= 0.0) {
    double v11 = -v8;
  }
  else {
    double v11 = 0.0;
  }
  double v12 = [*(id *)(a1 + 32) trailingConstraint];
  [v12 setConstant:v11];

  id v13 = [*(id *)(a1 + 32) view];
  [v13 layoutIfNeeded];
}

- (CGSize)dockedUnifiedFieldSize
{
  double v3 = [(SPUIUnifiedFieldViewController *)self view];
  double v4 = [v3 window];
  BOOL v5 = [v4 windowScene];
  double v6 = [v5 _FBSScene];
  double v7 = [v6 settings];
  double v8 = [v7 displayConfiguration];
  double v9 = [v8 identity];
  if ([v9 isContinuityDisplay]) {
    int v10 = 0;
  }
  else {
    int v10 = [MEMORY[0x263F828A0] isInHardwareKeyboardMode] ^ 1;
  }

  [(SPUIUnifiedFieldViewController *)self unifiedFieldSize];
  double v13 = v12;
  if (v10)
  {
    CGFloat v14 = [(SPUIUnifiedFieldViewController *)self view];
    [v14 bounds];
    double v16 = v15;

    [(id)objc_opt_class() insetMarginsForSearchField];
    double v18 = v16 + v17 * -2.0;
    v19 = [(SPUIUnifiedFieldViewController *)self searchHeader];
    objc_msgSend(v19, "sizeThatFits:", v18, v13);
    double v21 = v20;
  }
  else
  {
    double v21 = v11;
  }
  double v22 = v21;
  double v23 = v13;
  result.height = v23;
  result.width = v22;
  return result;
}

+ (double)insetMarginsForSearchField
{
  [MEMORY[0x263F7E3D0] standardTableCellContentInset];
  return result;
}

- (NSLayoutConstraint)trailingConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 1048, 1);
}

- (NSLayoutConstraint)leadingConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 1040, 1);
}

- (SPUINavigationSwipeRecognizerDelegate)swipeRecognizer
{
  return (SPUINavigationSwipeRecognizerDelegate *)objc_getProperty(self, a2, 1016, 1);
}

- (void)setTrailingConstraint:(id)a3
{
}

- (void)setTopBlur:(id)a3
{
}

- (void)setSwipeRecognizer:(id)a3
{
}

- (void)setLeadingConstraint:(id)a3
{
}

- (void)setKeyboardVisualEffectView:(id)a3
{
}

- (void)setFakeTextField:(id)a3
{
}

- (void)setFakeOriginalLeftView:(id)a3
{
}

- (double)unifiedFieldCornerRadius
{
  BOOL v2 = [(SPUIUnifiedFieldViewController *)self searchHeader];
  double v3 = [v2 searchField];
  [v3 backgroundCornerRadius];
  double v5 = v4;

  return v5;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)setDelegate:(id)a3
{
}

- (void)keyboardWillShow:(id)a3
{
  double v4 = [(SPUIUnifiedFieldViewController *)self backButton];

  if (v4)
  {
    double v5 = [(SPUIUnifiedFieldViewController *)self originalLeftView];
    [v5 setAlpha:1.0];

    id v8 = [(SPUIUnifiedFieldViewController *)self originalLeftView];
    double v6 = [(SPUIUnifiedFieldViewController *)self searchHeader];
    double v7 = [v6 searchField];
    [v7 setLeftView:v8];
  }
}

- (UIButton)backButton
{
  return (UIButton *)objc_getProperty(self, a2, 1056, 1);
}

- (void)processStateForeground
{
  dispatch_time_t v3 = dispatch_time(0, 500000000);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__SPUIUnifiedFieldViewController_processStateForeground__block_invoke;
  block[3] = &unk_264E90660;
  block[4] = self;
  dispatch_after(v3, MEMORY[0x263EF83A0], block);
}

uint64_t __56__SPUIUnifiedFieldViewController_processStateForeground__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) doALayoutPass];
}

- (void)doALayoutPass
{
  dispatch_time_t v3 = [(SPUIUnifiedFieldViewController *)self view];
  [v3 setNeedsLayout];

  id v4 = [(SPUIUnifiedFieldViewController *)self view];
  [v4 layoutIfNeeded];
}

- (void)dealloc
{
  dispatch_time_t v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)SPUIUnifiedFieldViewController;
  [(SPUIUnifiedFieldViewController *)&v4 dealloc];
}

- (void)keyboardWillHide:(id)a3
{
  objc_super v4 = [(SPUIUnifiedFieldViewController *)self searchNavigationController];
  double v5 = [v4 viewControllers];
  unint64_t v6 = [v5 count];

  if (v6 > 1)
  {
    double v7 = [(SPUIUnifiedFieldViewController *)self backButton];

    if (v7)
    {
      id v10 = [(SPUIUnifiedFieldViewController *)self backButton];
      id v8 = [(SPUIUnifiedFieldViewController *)self searchHeader];
      double v9 = [v8 searchField];
      [v9 setLeftView:v10];
    }
  }
  else
  {
    [(SPUIUnifiedFieldViewController *)self setBackButton:0];
  }
}

- (void)resetSearchFieldContentWithSearchToken:(id)a3 text:(id)a4 wantsBackButton:(BOOL)a5 transitionCoordinator:(id)a6
{
  BOOL v7 = a5;
  id v57 = a3;
  id v10 = a4;
  id v58 = a6;
  double v11 = [(SPUIUnifiedFieldViewController *)self searchHeader];
  double v12 = [v11 searchField];

  double v13 = [v12 _fieldEditor];
  v74[0] = MEMORY[0x263EF8330];
  v74[1] = 3221225472;
  v74[2] = __116__SPUIUnifiedFieldViewController_resetSearchFieldContentWithSearchToken_text_wantsBackButton_transitionCoordinator___block_invoke;
  v74[3] = &unk_264E90660;
  id v14 = v12;
  id v75 = v14;
  [v13 _performWhileSuppressingDelegateNotifications:v74];

  double v15 = [(SPUIUnifiedFieldViewController *)self fakeTextField];
  [v14 addSubview:v15];

  double v16 = [(SPUIUnifiedFieldViewController *)self fakeTextField];
  double v17 = [v14 primaryColor];
  double v18 = [v14 secondaryColor];
  uint64_t v19 = [v14 isOnDarkBackground];
  double v20 = (void *)MEMORY[0x263F7E398];
  double v21 = [(SPUIUnifiedFieldViewController *)self view];
  double v22 = [v20 bestAppearanceForView:v21];
  [v16 updateWithPrimaryColor:v17 secondaryColor:v18 isOnDarkBackground:v19 appearance:v22];

  BOOL v23 = v7;
  double v24 = (void *)MEMORY[0x263F67C10];
  CGFloat v25 = [(SPUIUnifiedFieldViewController *)self fakeTextField];
  [v24 fillContainerWithView:v25];

  double v26 = [MEMORY[0x263F825C8] clearColor];
  double v27 = [(SPUIUnifiedFieldViewController *)self fakeTextField];
  [v27 setTokenBackgroundColor:v26];

  double v28 = [(SPUIUnifiedFieldViewController *)self fakeTextField];
  v29 = [v28 canvasView];
  [v29 setAlpha:0.0];

  if (v7)
  {
    v30 = [v14 _placeholderLabel];
    [v30 setHidden:1];

    v31 = [(SPUIUnifiedFieldViewController *)self generateBackButton];
    uint64_t v32 = [(SPUIUnifiedFieldViewController *)self fakeTextField];
    [v32 setLeftView:v31];

    double v33 = [(SPUIUnifiedFieldViewController *)self searchHeader];
    [v33 unfocusSearchFieldWithReason:5 afterCommit:0];
  }
  else
  {
    double v33 = [(SPUIUnifiedFieldViewController *)self fakeOriginalLeftView];
    double v34 = [(SPUIUnifiedFieldViewController *)self fakeTextField];
    [v34 setLeftView:v33];
  }
  v35 = v57;

  double v36 = [(SPUIUnifiedFieldViewController *)self fakeTextField];
  BOOL v37 = [v36 leftView];
  double v38 = 0.0;
  [v37 setAlpha:0.0];

  CGRect v39 = [(SPUIUnifiedFieldViewController *)self fakeTextField];
  CGRect v40 = [v39 rightView];
  [v40 setAlpha:0.0];

  v41 = [(SPUIUnifiedFieldViewController *)self fakeTextField];
  __116__SPUIUnifiedFieldViewController_resetSearchFieldContentWithSearchToken_text_wantsBackButton_transitionCoordinator___block_invoke_2((uint64_t)v41, v41, (uint64_t)v10, v57);

  if ([v14 hasContent]) {
    double v38 = 1.0;
  }
  v42 = [(SPUIUnifiedFieldViewController *)self fakeTextField];
  v43 = [v42 _clearButton];
  [v43 setAlpha:v38];

  v44 = [(SPUIUnifiedFieldViewController *)self fakeTextField];
  [v44 layoutBelowIfNeeded];

  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __116__SPUIUnifiedFieldViewController_resetSearchFieldContentWithSearchToken_text_wantsBackButton_transitionCoordinator___block_invoke_3;
  aBlock[3] = &unk_264E90A80;
  aBlock[4] = self;
  id v45 = v14;
  id v69 = v45;
  id v72 = &__block_literal_global_2;
  id v46 = v10;
  id v70 = v46;
  id v47 = v35;
  id v71 = v47;
  BOOL v73 = v23;
  v48 = _Block_copy(aBlock);
  v66[0] = MEMORY[0x263EF8330];
  v66[1] = 3221225472;
  v66[2] = __116__SPUIUnifiedFieldViewController_resetSearchFieldContentWithSearchToken_text_wantsBackButton_transitionCoordinator___block_invoke_4;
  v66[3] = &unk_264E90AA8;
  v66[4] = self;
  id v49 = v45;
  id v67 = v49;
  v50 = _Block_copy(v66);
  v51 = v50;
  if (v58)
  {
    v64[0] = MEMORY[0x263EF8330];
    v64[1] = 3221225472;
    v64[2] = __116__SPUIUnifiedFieldViewController_resetSearchFieldContentWithSearchToken_text_wantsBackButton_transitionCoordinator___block_invoke_5;
    v64[3] = &unk_264E90740;
    v52 = &v65;
    v65 = v50;
    v62[0] = MEMORY[0x263EF8330];
    v62[1] = 3221225472;
    v62[2] = __116__SPUIUnifiedFieldViewController_resetSearchFieldContentWithSearchToken_text_wantsBackButton_transitionCoordinator___block_invoke_6;
    v62[3] = &unk_264E90740;
    v53 = &v63;
    id v63 = v48;
    id v54 = v51;
    [v58 animateAlongsideTransition:v64 completion:v62];
  }
  else
  {
    v55 = (void *)MEMORY[0x263F82E00];
    v59[0] = MEMORY[0x263EF8330];
    v59[1] = 3221225472;
    v59[2] = __116__SPUIUnifiedFieldViewController_resetSearchFieldContentWithSearchToken_text_wantsBackButton_transitionCoordinator___block_invoke_7;
    v59[3] = &unk_264E90AD0;
    v52 = &v60;
    v60 = v50;
    v53 = &v61;
    id v61 = v48;
    id v56 = v51;
    [v55 performWithoutAnimation:v59];
  }
}

uint64_t __116__SPUIUnifiedFieldViewController_resetSearchFieldContentWithSearchToken_text_wantsBackButton_transitionCoordinator___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) unmarkText];
}

void __116__SPUIUnifiedFieldViewController_resetSearchFieldContentWithSearchToken_text_wantsBackButton_transitionCoordinator___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  if (a4) {
    a3 = 0;
  }
  id v6 = a4;
  id v7 = a2;
  [v7 updateTextRange:a3];
  [v7 updateToken:v6];
}

void __116__SPUIUnifiedFieldViewController_resetSearchFieldContentWithSearchToken_text_wantsBackButton_transitionCoordinator___block_invoke_3(uint64_t a1, char a2)
{
  objc_super v4 = [*(id *)(a1 + 32) fakeTextField];
  [v4 removeFromSuperview];

  double v5 = [*(id *)(a1 + 40) _fieldEditor];
  [v5 setAlpha:1.0];

  id v6 = [*(id *)(a1 + 40) canvasView];
  [v6 setAlpha:1.0];

  if (a2) {
    return;
  }
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  if (*(void *)(a1 + 56))
  {
    id v7 = [*(id *)(a1 + 32) searchHeader];
    [v7 setUseClearTokens:1];
  }
  id v8 = *(void **)(a1 + 32);
  if (*(unsigned char *)(a1 + 72))
  {
    double v9 = [v8 backButton];

    if (!v9)
    {
      id v10 = [*(id *)(a1 + 32) generateBackButton];
      [*(id *)(a1 + 32) setBackButton:v10];
    }
    double v11 = [*(id *)(a1 + 32) backButton];
    double v12 = [*(id *)(a1 + 40) leftView];

    if (v11 != v12)
    {
      double v13 = [*(id *)(a1 + 40) leftView];
      [*(id *)(a1 + 32) setOriginalLeftView:v13];
    }
    uint64_t v14 = [*(id *)(a1 + 32) backButton];
    goto LABEL_12;
  }
  double v15 = [v8 originalLeftView];

  if (v15)
  {
    uint64_t v14 = [*(id *)(a1 + 32) originalLeftView];
LABEL_12:
    double v16 = (void *)v14;
    [*(id *)(a1 + 40) setLeftView:v14];
  }
  double v17 = [*(id *)(a1 + 40) leftView];
  [v17 setAlpha:1.0];

  id v18 = [*(id *)(a1 + 40) _placeholderLabel];
  [v18 setHidden:0];
}

void __116__SPUIUnifiedFieldViewController_resetSearchFieldContentWithSearchToken_text_wantsBackButton_transitionCoordinator___block_invoke_4(uint64_t a1, double a2)
{
  double v4 = 1.0 - a2;
  double v5 = [*(id *)(a1 + 32) fakeTextField];
  id v6 = [v5 canvasView];
  [v6 setAlpha:1.0 - a2];

  id v7 = [*(id *)(a1 + 40) leftView];
  [v7 setAlpha:a2];

  id v8 = [*(id *)(a1 + 32) fakeTextField];
  double v9 = [v8 leftView];
  [v9 setAlpha:1.0 - a2];

  if (![*(id *)(a1 + 40) hasContent]) {
    double v4 = 0.0;
  }
  id v10 = [*(id *)(a1 + 32) fakeTextField];
  double v11 = [v10 _placeholderLabel];
  [v11 setAlpha:v4];

  double v12 = [*(id *)(a1 + 40) _fieldEditor];
  [v12 setAlpha:a2];

  double v13 = [*(id *)(a1 + 40) canvasView];
  [v13 setAlpha:a2];

  [*(id *)(a1 + 40) layoutIfNeeded];
  id v14 = [*(id *)(a1 + 40) _fieldEditor];
  [v14 setAlpha:a2];
}

uint64_t __116__SPUIUnifiedFieldViewController_resetSearchFieldContentWithSearchToken_text_wantsBackButton_transitionCoordinator___block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  [a2 percentComplete];
  dispatch_time_t v3 = *(uint64_t (**)(uint64_t))(v2 + 16);
  return v3(v2);
}

uint64_t __116__SPUIUnifiedFieldViewController_resetSearchFieldContentWithSearchToken_text_wantsBackButton_transitionCoordinator___block_invoke_6(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = [a2 isCancelled];
  double v4 = *(uint64_t (**)(uint64_t, uint64_t))(v2 + 16);
  return v4(v2, v3);
}

uint64_t __116__SPUIUnifiedFieldViewController_resetSearchFieldContentWithSearchToken_text_wantsBackButton_transitionCoordinator___block_invoke_7(uint64_t a1)
{
  (*(void (**)(double))(*(void *)(a1 + 32) + 16))(1.0);
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

- (id)generateBackButton
{
  uint64_t v3 = [MEMORY[0x263F824F0] plainButtonConfiguration];
  double v4 = (void *)MEMORY[0x263F67C70];
  double v5 = [(SPUIUnifiedFieldViewController *)self searchHeader];
  id v6 = [v5 searchField];
  id v7 = [v6 font];
  id v8 = [v4 uiImageWithSymbolName:@"chevron.backward" font:v7 scale:-1];
  [v3 setImage:v8];

  [v3 setImagePlacement:2];
  double v9 = (void *)MEMORY[0x263F7E3B0];
  id v10 = [(SPUIUnifiedFieldViewController *)self view];
  [v9 deviceScaledRoundedValue:v10 forView:3.5];
  double v12 = v11;

  objc_msgSend(v3, "setContentInsets:", 0.0, 6.0, 0.0, v12);
  double v13 = objc_opt_new();
  [v13 setConfiguration:v3];
  [v13 setRole:1];
  [v13 addTarget:self action:sel_dismissSingleLevelViewController forControlEvents:64];

  return v13;
}

- (void)dismissSingleLevelViewController
{
  uint64_t v3 = [(SPUIUnifiedFieldViewController *)self searchNavigationController];
  id v4 = (id)[v3 popViewControllerAnimated:1];

  double v5 = [(SPUIUnifiedFieldViewController *)self searchNavigationController];
  id v6 = [v5 viewControllers];
  unint64_t v7 = [v6 count];

  if (v7 <= 1)
  {
    [(SPUIUnifiedFieldViewController *)self setBackButton:0];
  }
}

- (void)setBackButton:(id)a3
{
}

- (UIView)originalLeftView
{
  return (UIView *)objc_getProperty(self, a2, 1064, 1);
}

- (void)setOriginalLeftView:(id)a3
{
}

- (UIView)fakeOriginalLeftView
{
  return (UIView *)objc_getProperty(self, a2, 1080, 1);
}

- (BOOL)tryToLayoutForBadFrame
{
  return self->_tryToLayoutForBadFrame;
}

- (void)setTryToLayoutForBadFrame:(BOOL)a3
{
  self->_tryToLayoutForBadFrame = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fakeOriginalLeftView, 0);
  objc_storeStrong((id *)&self->_fakeTextField, 0);
  objc_storeStrong((id *)&self->_originalLeftView, 0);
  objc_storeStrong((id *)&self->_backButton, 0);
  objc_storeStrong((id *)&self->_trailingConstraint, 0);
  objc_storeStrong((id *)&self->_leadingConstraint, 0);
  objc_storeStrong((id *)&self->_topBlur, 0);
  objc_storeStrong((id *)&self->_keyboardVisualEffectView, 0);
  objc_storeStrong((id *)&self->_swipeRecognizer, 0);
  objc_storeStrong((id *)&self->_searchHeader, 0);
  objc_storeStrong((id *)&self->_searchNavigationController, 0);
  objc_storeStrong((id *)&self->_searchProtectorLayer, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end