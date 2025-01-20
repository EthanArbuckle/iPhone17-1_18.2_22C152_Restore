@interface _UIKeyShortcutHUDViewController
- (BOOL)_canChangeFirstResponder:(id)a3 toResponder:(id)a4;
- (BOOL)_canShowWhileLocked;
- (BOOL)_disableAutomaticKeyboardUI;
- (BOOL)_suppressSoftwareKeyboard;
- (BOOL)canBecomeFirstResponder;
- (BOOL)hasText;
- (BOOL)isCompletelyPresented;
- (BOOL)isHUDPresentedIntoSearchMode;
- (BOOL)isHidden;
- (BOOL)isSearching;
- (BOOL)menuViewController:(id)a3 shouldPersistSelectionForShortcut:(id)a4;
- (BOOL)passthroughScrollInteraction:(id)a3 shouldInteractAtLocation:(CGPoint)a4 withEvent:(id)a5;
- (BOOL)passthroughScrollInteractionDidRecognize:(id)a3;
- (BOOL)shouldDismissHUDForModifierKeyTap;
- (BOOL)shouldIgnoreNextSearchFieldTextChangedCallback;
- (NSLayoutConstraint)hudContainerBottomEdgeConstraint;
- (NSLayoutConstraint)hudContainerBottomSafeAreaEdgeConstraint;
- (NSLayoutConstraint)hudContainerLeadingEdgeConstraint;
- (NSLayoutConstraint)hudContainerTopEdgeConstraint;
- (NSLayoutConstraint)hudContainerTrailingEdgeConstraint;
- (NSLayoutConstraint)menuPreferredHeightConstraint;
- (NSLayoutConstraint)menuPreferredWidthConstraint;
- (NSLayoutConstraint)menuToolbarSpacingConstraint;
- (NSLayoutConstraint)toolbarPreferredWidthConstraint;
- (NSMutableDictionary)hudToModelKeyCommandsMap;
- (UIKeyCommand)showShortcutsKeyCommand;
- (UIKeyShortcutHUDMetrics)metrics;
- (UIKeyShortcutHUDMetricsProvider)metricsProvider;
- (UIView)hudContainerView;
- (UIViewPropertyAnimator)hudAppearanceAnimator;
- (UIViewPropertyAnimator)menuPanelAnimator;
- (UIViewPropertyAnimator)searchTransitionAnimator;
- (_UIKeyShortcutHUDCollectionViewManager)collectionViewManager;
- (_UIKeyShortcutHUDConfiguration)configuration;
- (_UIKeyShortcutHUDMenuViewController)menuVC;
- (_UIKeyShortcutHUDToolbarViewController)toolbarVC;
- (_UIKeyShortcutHUDViewController)init;
- (_UIKeyShortcutHUDViewControllerDelegate)delegate;
- (_UIKeyShortcutHUDWindow)hudWindow;
- (_UIPassthroughScrollInteraction)passthroughScrollInteraction;
- (id)_defaultHUDAppearanceAnimatorForHidden:(BOOL)a3;
- (id)_defaultSearchTransitionAnimator;
- (id)preferredFocusEnvironments;
- (id)undoManager;
- (int64_t)heldModifierFlags;
- (void)_focusTopSearchResultWithDelay:(BOOL)a3;
- (void)_hudWillBecomeHidden:(BOOL)a3;
- (void)_setDisplayedMenu:(id)a3 animated:(BOOL)a4;
- (void)_setMenuHeight:(double)a3;
- (void)_setMenuWidth:(double)a3;
- (void)_setSearching:(BOOL)a3 animated:(BOOL)a4;
- (void)_setSearching:(BOOL)a3 animated:(BOOL)a4 initialSearchText:(id)a5;
- (void)_setupCollectionViewManagement;
- (void)_setupHUDKeyCommands;
- (void)_setupInitialDisplayedMenu;
- (void)_setupInitialViewState;
- (void)_setupLayout;
- (void)_setupMetrics;
- (void)_setupSubviews;
- (void)_stopInFlightAnimationsForAnimator:(id)a3 endPosition:(int64_t)a4;
- (void)_updateDisplayedMenuForCurrentHeldModifierFlagsAnimated:(BOOL)a3;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)handleEscapeKeyCommand:(id)a3;
- (void)handleModelKeyCommand:(id)a3;
- (void)handleShowShortcutsKeyCommand:(id)a3;
- (void)insertText:(id)a3;
- (void)menuViewController:(id)a3 didScrollToCategory:(id)a4 withCategoryIndex:(int64_t)a5;
- (void)menuViewController:(id)a3 didSelectShortcut:(id)a4;
- (void)setCollectionViewManager:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDisplayedMenu:(id)a3;
- (void)setHeldModifierFlags:(int64_t)a3;
- (void)setHidden:(BOOL)a3 completionHandler:(id)a4;
- (void)setHudAppearanceAnimator:(id)a3;
- (void)setHudContainerBottomEdgeConstraint:(id)a3;
- (void)setHudContainerBottomSafeAreaEdgeConstraint:(id)a3;
- (void)setHudContainerLeadingEdgeConstraint:(id)a3;
- (void)setHudContainerTopEdgeConstraint:(id)a3;
- (void)setHudContainerTrailingEdgeConstraint:(id)a3;
- (void)setHudContainerView:(id)a3;
- (void)setHudPresentedIntoSearchMode:(BOOL)a3;
- (void)setHudToModelKeyCommandsMap:(id)a3;
- (void)setHudWindow:(id)a3;
- (void)setMenuPanelAnimator:(id)a3;
- (void)setMenuPreferredHeightConstraint:(id)a3;
- (void)setMenuPreferredWidthConstraint:(id)a3;
- (void)setMenuToolbarSpacingConstraint:(id)a3;
- (void)setMenuVC:(id)a3;
- (void)setMetrics:(id)a3;
- (void)setMetricsProvider:(id)a3;
- (void)setPassthroughScrollInteraction:(id)a3;
- (void)setSearchTransitionAnimator:(id)a3;
- (void)setShouldIgnoreNextSearchFieldTextChangedCallback:(BOOL)a3;
- (void)setShowShortcutsKeyCommand:(id)a3;
- (void)setToolbarPreferredWidthConstraint:(id)a3;
- (void)setToolbarVC:(id)a3;
- (void)setupPassthroughScrollInteraction;
- (void)showHelp:(id)a3;
- (void)toolbarViewController:(id)a3 didSelectCategory:(id)a4 categoryIndex:(int64_t)a5 animated:(BOOL)a6;
- (void)toolbarViewController:(id)a3 didUpdateSearchText:(id)a4;
- (void)toolbarViewControllerDidPressCancelSearchButton:(id)a3;
- (void)toolbarViewControllerDidPressSearchButton:(id)a3;
- (void)viewDidLoad;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation _UIKeyShortcutHUDViewController

- (_UIKeyShortcutHUDViewController)init
{
  v3.receiver = self;
  v3.super_class = (Class)_UIKeyShortcutHUDViewController;
  result = [(UIViewController *)&v3 init];
  if (result) {
    result->_hidden = 1;
  }
  return result;
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)_UIKeyShortcutHUDViewController;
  [(UIViewController *)&v5 viewDidLoad];
  [(_UIKeyShortcutHUDViewController *)self _setupMetrics];
  [(_UIKeyShortcutHUDViewController *)self _setupSubviews];
  [(_UIKeyShortcutHUDViewController *)self _setupLayout];
  [(_UIKeyShortcutHUDViewController *)self _setupInitialDisplayedMenu];
  [(_UIKeyShortcutHUDViewController *)self _setupCollectionViewManagement];
  [(_UIKeyShortcutHUDViewController *)self _setupInitialViewState];
  [(_UIKeyShortcutHUDViewController *)self _setupHUDKeyCommands];
  hudContainerView = self->_hudContainerView;
  v4[0] = _UIKeyShortcutHUDAnimationShrunkTransform;
  v4[1] = unk_186B95040;
  v4[2] = xmmword_186B95050;
  [(UIView *)hudContainerView setTransform:v4];
  [(UIView *)self->_hudContainerView setAlpha:0.0];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)_UIKeyShortcutHUDViewController;
  -[UIViewController viewWillTransitionToSize:withTransitionCoordinator:](&v11, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __86___UIKeyShortcutHUDViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v8[3] = &unk_1E52ECEE8;
  objc_copyWeak(v9, &location);
  v8[4] = self;
  v9[1] = *(id *)&width;
  v9[2] = *(id *)&height;
  [v7 animateAlongsideTransition:v8 completion:0];
  objc_destroyWeak(v9);
  objc_destroyWeak(&location);
}

- (void)_setupMetrics
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  objc_super v3 = [(_UIKeyShortcutHUDViewController *)self metricsProvider];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hudWindow);
  objc_super v5 = [v3 metricsForWindow:WeakRetained];
  metrics = self->_metrics;
  self->_metrics = v5;

  +[UIKeyShortcutHUDMetrics setCurrentMetrics:self->_metrics];
  id v7 = _UIKeyShortcutHUDLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = self->_metrics;
    int v19 = 138543362;
    v20 = v8;
    _os_log_impl(&dword_1853B0000, v7, OS_LOG_TYPE_DEFAULT, "HUD metrics: %{public}@", (uint8_t *)&v19, 0xCu);
  }

  id v9 = objc_loadWeakRetained((id *)&self->_hudWindow);
  v10 = [v9 traitCollection];
  [(UIKeyShortcutHUDMetrics *)self->_metrics setTraitCollection:v10];

  objc_super v11 = [(_UIKeyShortcutHUDConfiguration *)self->_configuration clientTraits];
  [(UIKeyShortcutHUDMetrics *)self->_metrics setClientTraits:v11];

  id v12 = objc_loadWeakRetained((id *)&self->_hudWindow);
  v13 = [v12 windowScene];
  v14 = [v13 coordinateSpace];
  [v14 bounds];
  [(UIKeyShortcutHUDMetrics *)self->_metrics setAvailableVerticalSpace:CGRectGetHeight(v22)];

  [(UIKeyShortcutHUDMetrics *)self->_metrics computeOneTimeMetrics];
  v15 = objc_opt_new();
  [v15 setHidden:1];
  v16 = [(UIViewController *)self view];
  [v16 addSubview:v15];

  [(UIKeyShortcutHUDMetrics *)self->_metrics setSelfSizingPlayground:v15];
  v17 = [(_UIKeyShortcutHUDConfiguration *)self->_configuration model];
  v18 = [v17 menu];
  [(UIKeyShortcutHUDMetrics *)self->_metrics setBaseMenu:v18];
}

- (void)_setupInitialDisplayedMenu
{
}

- (void)_setupSubviews
{
  objc_super v3 = (UIView *)objc_opt_new();
  hudContainerView = self->_hudContainerView;
  self->_hudContainerView = v3;

  [(UIView *)self->_hudContainerView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIKeyShortcutHUDMetrics *)self->_metrics platterShadowOpacity];
  float v6 = v5;
  id v7 = [(UIView *)self->_hudContainerView layer];
  *(float *)&double v8 = v6;
  [v7 setShadowOpacity:v8];

  [(UIKeyShortcutHUDMetrics *)self->_metrics platterShadowRadius];
  double v10 = v9;
  objc_super v11 = [(UIView *)self->_hudContainerView layer];
  [v11 setShadowRadius:v10];

  double v12 = *MEMORY[0x1E4F1DB30];
  double v13 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  v14 = [(UIView *)self->_hudContainerView layer];
  objc_msgSend(v14, "setShadowOffset:", v12, v13);

  v15 = [(UIViewController *)self view];
  [v15 addSubview:self->_hudContainerView];

  v16 = (_UIKeyShortcutHUDMenuViewController *)objc_opt_new();
  menuVC = self->_menuVC;
  self->_menuVC = v16;

  [(_UIKeyShortcutHUDMenuViewController *)self->_menuVC setMetrics:self->_metrics];
  [(_UIKeyShortcutHUDMenuViewController *)self->_menuVC setDelegate:self];
  v18 = [(UIViewController *)self->_menuVC view];
  [v18 setTranslatesAutoresizingMaskIntoConstraints:0];

  int v19 = self->_hudContainerView;
  v20 = [(UIViewController *)self->_menuVC view];
  [(UIView *)v19 addSubview:v20];

  [(UIViewController *)self addChildViewController:self->_menuVC];
  [(UIViewController *)self->_menuVC didMoveToParentViewController:self];
  uint64_t v21 = (_UIKeyShortcutHUDToolbarViewController *)objc_opt_new();
  toolbarVC = self->_toolbarVC;
  self->_toolbarVC = v21;

  v23 = [(_UIKeyShortcutHUDConfiguration *)self->_configuration model];
  v24 = [v23 menu];
  [(_UIKeyShortcutHUDToolbarViewController *)self->_toolbarVC setMenu:v24];

  [(_UIKeyShortcutHUDToolbarViewController *)self->_toolbarVC setMetrics:self->_metrics];
  [(_UIKeyShortcutHUDToolbarViewController *)self->_toolbarVC setDelegate:self];
  v25 = [(UIViewController *)self->_toolbarVC view];
  [v25 setTranslatesAutoresizingMaskIntoConstraints:0];

  v26 = self->_hudContainerView;
  v27 = [(UIViewController *)self->_toolbarVC view];
  [(UIView *)v26 addSubview:v27];

  [(UIViewController *)self addChildViewController:self->_toolbarVC];
  v28 = self->_toolbarVC;
  [(UIViewController *)v28 didMoveToParentViewController:self];
}

- (void)_setupLayout
{
  v91[5] = *MEMORY[0x1E4F143B8];
  objc_super v3 = [(UIView *)self->_hudContainerView topAnchor];
  v4 = [(UIViewController *)self view];
  double v5 = [v4 topAnchor];
  [(UIKeyShortcutHUDMetrics *)self->_metrics minimumScreenEdgeDistance];
  objc_msgSend(v3, "constraintGreaterThanOrEqualToAnchor:constant:", v5);
  float v6 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  hudContainerTopEdgeConstraint = self->_hudContainerTopEdgeConstraint;
  self->_hudContainerTopEdgeConstraint = v6;

  double v8 = [(UIView *)self->_hudContainerView leadingAnchor];
  double v9 = [(UIViewController *)self view];
  double v10 = [v9 leadingAnchor];
  [(UIKeyShortcutHUDMetrics *)self->_metrics minimumScreenEdgeDistance];
  objc_msgSend(v8, "constraintGreaterThanOrEqualToAnchor:constant:", v10);
  objc_super v11 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  hudContainerLeadingEdgeConstraint = self->_hudContainerLeadingEdgeConstraint;
  self->_hudContainerLeadingEdgeConstraint = v11;

  double v13 = [(UIViewController *)self view];
  v14 = [v13 trailingAnchor];
  v15 = [(UIView *)self->_hudContainerView trailingAnchor];
  [(UIKeyShortcutHUDMetrics *)self->_metrics minimumScreenEdgeDistance];
  objc_msgSend(v14, "constraintGreaterThanOrEqualToAnchor:constant:", v15);
  v16 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  hudContainerTrailingEdgeConstraint = self->_hudContainerTrailingEdgeConstraint;
  self->_hudContainerTrailingEdgeConstraint = v16;

  v18 = [(UIViewController *)self view];
  int v19 = [v18 bottomAnchor];
  v20 = [(UIView *)self->_hudContainerView bottomAnchor];
  [(UIKeyShortcutHUDMetrics *)self->_metrics minimumBottomScreenEdgeDistance];
  objc_msgSend(v19, "constraintGreaterThanOrEqualToAnchor:constant:", v20);
  uint64_t v21 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  hudContainerBottomEdgeConstraint = self->_hudContainerBottomEdgeConstraint;
  self->_hudContainerBottomEdgeConstraint = v21;

  v23 = [(UIViewController *)self view];
  v24 = [v23 safeAreaLayoutGuide];
  v25 = [v24 bottomAnchor];
  v26 = [(UIView *)self->_hudContainerView bottomAnchor];
  v27 = [v25 constraintEqualToAnchor:v26];
  hudContainerBottomSafeAreaEdgeConstraint = self->_hudContainerBottomSafeAreaEdgeConstraint;
  self->_hudContainerBottomSafeAreaEdgeConstraint = v27;

  LODWORD(v29) = 1144750080;
  [(NSLayoutConstraint *)self->_hudContainerBottomSafeAreaEdgeConstraint setPriority:v29];
  v30 = (void *)MEMORY[0x1E4F5B268];
  v31 = self->_hudContainerLeadingEdgeConstraint;
  v91[0] = self->_hudContainerTopEdgeConstraint;
  v91[1] = v31;
  v32 = self->_hudContainerBottomEdgeConstraint;
  v91[2] = self->_hudContainerTrailingEdgeConstraint;
  v91[3] = v32;
  v33 = [(UIView *)self->_hudContainerView centerXAnchor];
  v34 = [(UIViewController *)self view];
  v35 = [v34 centerXAnchor];
  v36 = [v33 constraintEqualToAnchor:v35];
  v91[4] = v36;
  v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:v91 count:5];
  [v30 activateConstraints:v37];

  if (![(UIKeyShortcutHUDMetrics *)self->_metrics shouldExtendToolbarThroughSafeArea])[(NSLayoutConstraint *)self->_hudContainerBottomSafeAreaEdgeConstraint setActive:1]; {
  v38 = [(UIViewController *)self->_menuVC view];
  }
  v39 = [v38 widthAnchor];
  [(UIKeyShortcutHUDMetrics *)self->_metrics standardHUDWidth];
  objc_msgSend(v39, "constraintEqualToConstant:");
  v40 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  menuPreferredWidthConstraint = self->_menuPreferredWidthConstraint;
  self->_menuPreferredWidthConstraint = v40;

  v42 = [(UIViewController *)self->_menuVC view];
  v43 = [v42 heightAnchor];
  [(UIKeyShortcutHUDMetrics *)self->_metrics standardMenuPanelHeight];
  objc_msgSend(v43, "constraintEqualToConstant:");
  v44 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  menuPreferredHeightConstraint = self->_menuPreferredHeightConstraint;
  self->_menuPreferredHeightConstraint = v44;

  v46 = [(UIViewController *)self->_toolbarVC view];
  v47 = [v46 topAnchor];
  v48 = [(UIViewController *)self->_menuVC view];
  v49 = [v48 bottomAnchor];
  [(UIKeyShortcutHUDMetrics *)self->_metrics standardMenuToolbarSpacing];
  objc_msgSend(v47, "constraintEqualToAnchor:constant:", v49);
  v50 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  menuToolbarSpacingConstraint = self->_menuToolbarSpacingConstraint;
  self->_menuToolbarSpacingConstraint = v50;

  v52 = [(UIViewController *)self->_toolbarVC view];
  v53 = [v52 widthAnchor];
  [(UIKeyShortcutHUDMetrics *)self->_metrics standardHUDWidth];
  objc_msgSend(v53, "constraintEqualToConstant:");
  v54 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  toolbarPreferredWidthConstraint = self->_toolbarPreferredWidthConstraint;
  self->_toolbarPreferredWidthConstraint = v54;

  v76 = (void *)MEMORY[0x1E4F5B268];
  v89 = [(UIViewController *)self->_menuVC view];
  v88 = [v89 topAnchor];
  v87 = [(UIView *)self->_hudContainerView topAnchor];
  v86 = [v88 constraintEqualToAnchor:v87];
  v90[0] = v86;
  v85 = [(UIViewController *)self->_menuVC view];
  v84 = [v85 leadingAnchor];
  v83 = [(UIView *)self->_hudContainerView leadingAnchor];
  v82 = [v84 constraintEqualToAnchor:v83];
  v90[1] = v82;
  v81 = [(UIViewController *)self->_menuVC view];
  v80 = [v81 trailingAnchor];
  v78 = [(UIView *)self->_hudContainerView trailingAnchor];
  v77 = [v80 constraintEqualToAnchor:v78];
  v56 = self->_menuPreferredWidthConstraint;
  v90[2] = v77;
  v90[3] = v56;
  v57 = self->_menuToolbarSpacingConstraint;
  v90[4] = self->_menuPreferredHeightConstraint;
  v90[5] = v57;
  v79 = [(UIViewController *)self->_toolbarVC view];
  v75 = [v79 centerXAnchor];
  v74 = [(UIView *)self->_hudContainerView centerXAnchor];
  v73 = [v75 constraintEqualToAnchor:v74];
  v90[6] = v73;
  v72 = [(UIViewController *)self->_toolbarVC view];
  v71 = [v72 bottomAnchor];
  v70 = [(UIView *)self->_hudContainerView bottomAnchor];
  v69 = [v71 constraintEqualToAnchor:v70];
  v58 = self->_toolbarPreferredWidthConstraint;
  v90[7] = v69;
  v90[8] = v58;
  v59 = [(UIViewController *)self->_toolbarVC view];
  v60 = [v59 widthAnchor];
  v61 = [(UIView *)self->_hudContainerView widthAnchor];
  v62 = [v60 constraintLessThanOrEqualToAnchor:v61];
  v90[9] = v62;
  v63 = [(UIView *)self->_hudContainerView safeAreaLayoutGuide];
  v64 = [v63 bottomAnchor];
  v65 = [(UIViewController *)self->_toolbarVC view];
  v66 = [v65 topAnchor];
  [(UIKeyShortcutHUDMetrics *)self->_metrics standardToolbarContentHeight];
  v67 = objc_msgSend(v64, "constraintEqualToAnchor:constant:", v66);
  v90[10] = v67;
  v68 = [MEMORY[0x1E4F1C978] arrayWithObjects:v90 count:11];
  [v76 activateConstraints:v68];
}

- (void)_setupCollectionViewManagement
{
  objc_super v3 = (_UIKeyShortcutHUDCollectionViewManager *)objc_opt_new();
  collectionViewManager = self->_collectionViewManager;
  self->_collectionViewManager = v3;

  [(_UIKeyShortcutHUDCollectionViewManager *)self->_collectionViewManager setHudVC:self];
  [(_UIKeyShortcutHUDCollectionViewManager *)self->_collectionViewManager setMenu:self->_menuVC];
  [(_UIKeyShortcutHUDCollectionViewManager *)self->_collectionViewManager setToolbar:self->_toolbarVC];
  double v5 = [(_UIKeyShortcutHUDToolbarViewController *)self->_toolbarVC searchButton];
  [(_UIKeyShortcutHUDCollectionViewManager *)self->_collectionViewManager setSearchButton:v5];

  [(_UIKeyShortcutHUDMenuViewController *)self->_menuVC setCollectionViewManager:self->_collectionViewManager];
  [(_UIKeyShortcutHUDToolbarViewController *)self->_toolbarVC setCollectionViewManager:self->_collectionViewManager];
  float v6 = self->_collectionViewManager;
  +[_UIKeyShortcutHUDUtilities setCurrentHUDCollectionViewManager:]((uint64_t)_UIKeyShortcutHUDUtilities, v6);
}

- (void)_setupInitialViewState
{
  objc_super v3 = [(_UIKeyShortcutHUDConfiguration *)self->_configuration model];
  v4 = [v3 menu];
  double v5 = [v4 children];
  id v6 = [v5 firstObject];

  [(_UIKeyShortcutHUDToolbarViewController *)self->_toolbarVC selectCategory:v6 withCategoryIndex:0];
  if ([(_UIKeyShortcutHUDConfiguration *)self->_configuration isSearching])
  {
    [(_UIKeyShortcutHUDViewController *)self _setSearching:1 animated:0];
    [(_UIKeyShortcutHUDViewController *)self setHudPresentedIntoSearchMode:1];
  }
  [(UIViewController *)self setNeedsFocusUpdate];
}

- (void)_setupHUDKeyCommands
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  objc_super v3 = [MEMORY[0x1E4F1CA48] array];
  v4 = +[UIKeyCommand keyCommandWithInput:@"UIKeyInputEscape" modifierFlags:0 action:sel_handleEscapeKeyCommand_];
  double v5 = [v4 _nonRepeatableKeyCommand];

  [v5 _setEnumerationPriority:0];
  [v5 setAttributes:4];
  v32 = v5;
  [v3 addObject:v5];
  id v6 = +[UIKeyCommand keyCommandWithInput:@"?" modifierFlags:0x100000 action:sel_showHelp_];
  id v7 = [v6 _nonRepeatableKeyCommand];

  [v7 setAttributes:4];
  v31 = v7;
  [v3 addObject:v7];
  double v8 = [(_UIKeyShortcutHUDViewController *)self configuration];
  double v9 = [v8 clientTraits];
  int v10 = [v9 isSystemApp];

  if (v10)
  {
    objc_super v11 = +[UIKeyCommand keyCommandWithInput:@"m" modifierFlags:0x800000 action:sel_handleShowShortcutsKeyCommand_];
    double v12 = [v11 _allowGlobeModifierKeyCommand];
    double v13 = [v12 _nonRepeatableKeyCommand];

    [v13 setAttributes:4];
    [v3 addObject:v13];
    objc_storeWeak((id *)&self->_showShortcutsKeyCommand, v13);
  }
  v14 = [MEMORY[0x1E4F1CA60] dictionary];
  hudToModelKeyCommandsMap = self->_hudToModelKeyCommandsMap;
  self->_hudToModelKeyCommandsMap = v14;

  v16 = [(_UIKeyShortcutHUDConfiguration *)self->_configuration model];
  v17 = [v16 modelKeyCommandsExcludingHUDCommands:v3];

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id obj = v17;
  uint64_t v18 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        CGRect v22 = self;
        v23 = v3;
        if (*(void *)v35 != v20) {
          objc_enumerationMutation(obj);
        }
        v24 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        v25 = [v24 _keyCodes];

        if (v25)
        {
          v26 = [v24 _keyCodes];
          +[UIKeyCommand keyCommandWithKeyCodes:modifierFlags:action:](UIKeyCommand, "keyCommandWithKeyCodes:modifierFlags:action:", v26, [v24 modifierFlags], sel_handleModelKeyCommand_);
        }
        else
        {
          v26 = [v24 input];
          +[UIKeyCommand keyCommandWithInput:modifierFlags:action:](UIKeyCommand, "keyCommandWithInput:modifierFlags:action:", v26, [v24 modifierFlags], sel_handleModelKeyCommand_);
        v27 = };

        v28 = [v27 _nonRepeatableKeyCommand];

        [v28 setWantsPriorityOverSystemBehavior:0];
        objc_msgSend(v28, "setAllowsAutomaticLocalization:", objc_msgSend(v24, "allowsAutomaticMirroring"));
        objc_msgSend(v28, "setAllowsAutomaticMirroring:", objc_msgSend(v24, "allowsAutomaticMirroring"));
        double v29 = [v28 _allowGlobeModifierKeyCommand];

        self = v22;
        [(NSMutableDictionary *)v22->_hudToModelKeyCommandsMap setObject:v24 forKeyedSubscript:v29];
        objc_super v3 = v23;
        [v23 addObject:v29];
      }
      uint64_t v19 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
    }
    while (v19);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_hudWindow);
  [WeakRetained setHudKeyCommands:v3];
}

- (void)setupPassthroughScrollInteraction
{
  objc_super v3 = objc_alloc_init(_UIPassthroughScrollInteraction);
  passthroughScrollInteraction = self->_passthroughScrollInteraction;
  self->_passthroughScrollInteraction = v3;

  [(_UIPassthroughScrollInteraction *)self->_passthroughScrollInteraction setDelegate:self];
  id v5 = [(UIViewController *)self view];
  [v5 addInteraction:self->_passthroughScrollInteraction];
}

- (void)setHidden:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if (self->_hidden != v4)
  {
    self->_hidden = v4;
    [(_UIKeyShortcutHUDViewController *)self _stopInFlightAnimationsForAnimator:self->_hudAppearanceAnimator endPosition:2];
    id v7 = [(_UIKeyShortcutHUDViewController *)self _defaultHUDAppearanceAnimatorForHidden:v4];
    hudAppearanceAnimator = self->_hudAppearanceAnimator;
    self->_hudAppearanceAnimator = v7;

    [(_UIKeyShortcutHUDViewController *)self _hudWillBecomeHidden:v4];
    [(_UIKeyShortcutHUDMenuViewController *)self->_menuVC hudWillBecomeHidden:v4];
    [(_UIKeyShortcutHUDToolbarViewController *)self->_toolbarVC hudWillBecomeHidden:v4];
    if (v4) {
      self->_completelyPresented = 0;
    }
    objc_initWeak(&location, self);
    double v9 = self->_hudAppearanceAnimator;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __63___UIKeyShortcutHUDViewController_setHidden_completionHandler___block_invoke;
    v18[3] = &unk_1E52E7E68;
    objc_copyWeak(&v19, &location);
    BOOL v20 = v4;
    [(UIViewPropertyAnimator *)v9 addAnimations:v18];
    int v10 = self->_hudAppearanceAnimator;
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    double v13 = __63___UIKeyShortcutHUDViewController_setHidden_completionHandler___block_invoke_2;
    v14 = &unk_1E52ECF10;
    objc_copyWeak(&v16, &location);
    BOOL v17 = v4;
    id v15 = v6;
    [(UIViewPropertyAnimator *)v10 addCompletion:&v11];
    [(UIViewPropertyAnimator *)self->_hudAppearanceAnimator startAnimation];

    objc_destroyWeak(&v16);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
}

- (void)_hudWillBecomeHidden:(BOOL)a3
{
  if (a3)
  {
    BOOL v4 = [(UIViewController *)self view];
    [v4 setUserInteractionEnabled:0];

    id v5 = [(_UIKeyShortcutHUDViewController *)self hudContainerView];
    [v5 _setSafeAreaInsetsFrozen:1];
  }
}

- (BOOL)shouldDismissHUDForModifierKeyTap
{
  v2 = [(_UIKeyShortcutHUDToolbarViewController *)self->_toolbarVC searchBar];
  char v3 = [v2 isEditing] ^ 1;

  return v3;
}

- (BOOL)passthroughScrollInteraction:(id)a3 shouldInteractAtLocation:(CGPoint)a4 withEvent:(id)a5
{
  double y = a4.y;
  double x = a4.x;
  id v8 = a5;
  double v9 = [(UIViewController *)self view];
  int v10 = objc_msgSend(v9, "hitTest:withEvent:", v8, x, y);

  uint64_t v11 = [(UIViewController *)self view];
  if (v10) {
    BOOL v12 = v10 == v11;
  }
  else {
    BOOL v12 = 1;
  }
  BOOL v13 = v12;

  return v13;
}

- (BOOL)passthroughScrollInteractionDidRecognize:(id)a3
{
  BOOL v4 = _UIKeyShortcutHUDLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_1853B0000, v4, OS_LOG_TYPE_DEFAULT, "Dismissing HUD due to interaction outside HUD", v7, 2u);
  }

  id v5 = [(_UIKeyShortcutHUDViewController *)self delegate];
  [v5 keyShortcutHUDViewControllerDidRequestDismissal:self];

  return 1;
}

- (void)handleEscapeKeyCommand:(id)a3
{
  if ([(_UIKeyShortcutHUDViewController *)self isSearching]
    && ![(_UIKeyShortcutHUDViewController *)self isHUDPresentedIntoSearchMode])
  {
    [(_UIKeyShortcutHUDViewController *)self _setSearching:0 animated:1];
  }
  else
  {
    BOOL v4 = _UIKeyShortcutHUDLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_1853B0000, v4, OS_LOG_TYPE_DEFAULT, "Dismissing HUD due to esc key command", v6, 2u);
    }

    id v5 = [(_UIKeyShortcutHUDViewController *)self delegate];
    [v5 keyShortcutHUDViewControllerDidRequestDismissal:self];
  }
}

- (void)showHelp:(id)a3
{
}

- (void)handleShowShortcutsKeyCommand:(id)a3
{
  if ([(_UIKeyShortcutHUDViewController *)self isSearching])
  {
    [(_UIKeyShortcutHUDViewController *)self _setSearching:0 animated:1];
  }
  else
  {
    BOOL v4 = _UIKeyShortcutHUDLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_1853B0000, v4, OS_LOG_TYPE_DEFAULT, "Dismissing HUD due to hitting Globe-M key command", v6, 2u);
    }

    id v5 = [(_UIKeyShortcutHUDViewController *)self delegate];
    [v5 keyShortcutHUDViewControllerDidRequestDismissal:self];
  }
}

- (void)handleModelKeyCommand:(id)a3
{
  BOOL v4 = [(NSMutableDictionary *)self->_hudToModelKeyCommandsMap objectForKeyedSubscript:a3];
  if (v4)
  {
    id v5 = [(_UIKeyShortcutHUDConfiguration *)self->_configuration model];
    id v6 = [v5 modelShortcutForModelKeyCommand:v4];

    if (v6)
    {
      id v7 = [(UIViewController *)self view];
      [v7 setUserInteractionEnabled:0];

      id WeakRetained = objc_loadWeakRetained((id *)&self->_hudWindow);
      [WeakRetained setHudKeyCommands:0];

      menuVC = self->_menuVC;
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __57___UIKeyShortcutHUDViewController_handleModelKeyCommand___block_invoke;
      v11[3] = &unk_1E52ECF38;
      v11[4] = self;
      id v12 = v6;
      id v10 = v6;
      [(_UIKeyShortcutHUDMenuViewController *)menuVC flashShortcutIfVisible:v10 completionHandler:v11];
    }
  }
}

- (void)setDisplayedMenu:(id)a3
{
}

- (void)_setDisplayedMenu:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  metrics = self->_metrics;
  id v7 = a3;
  [(UIKeyShortcutHUDMetrics *)metrics setDisplayedMenu:v7 searching:[(_UIKeyShortcutHUDViewController *)self isSearching]];
  [(_UIKeyShortcutHUDMenuViewController *)self->_menuVC setMenu:v7 animated:v4];
}

- (id)preferredFocusEnvironments
{
  return [(_UIKeyShortcutHUDCollectionViewManager *)self->_collectionViewManager preferredFocusEnvironments];
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
}

- (void)_focusTopSearchResultWithDelay:(BOOL)a3
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __66___UIKeyShortcutHUDViewController__focusTopSearchResultWithDelay___block_invoke;
  aBlock[3] = &unk_1E52D9F70;
  aBlock[4] = self;
  BOOL v4 = _Block_copy(aBlock);
  id v5 = v4;
  if (a3)
  {
    dispatch_time_t v6 = dispatch_time(0, 50000000);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __66___UIKeyShortcutHUDViewController__focusTopSearchResultWithDelay___block_invoke_2;
    v7[3] = &unk_1E52DA040;
    id v8 = v5;
    dispatch_after(v6, MEMORY[0x1E4F14428], v7);
  }
  else
  {
    (*((void (**)(void *))v4 + 2))(v4);
  }
}

- (void)setHeldModifierFlags:(int64_t)a3
{
  if (self->_heldModifierFlags != a3)
  {
    self->_heldModifierFlags = a3;
    if ([(UIViewController *)self isViewLoaded])
    {
      BOOL v4 = [(UIViewController *)self view];
      int v5 = [v4 isUserInteractionEnabled];

      if (v5)
      {
        [(_UIKeyShortcutHUDViewController *)self _updateDisplayedMenuForCurrentHeldModifierFlagsAnimated:0];
      }
    }
  }
}

- (void)_updateDisplayedMenuForCurrentHeldModifierFlagsAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if (![(_UIKeyShortcutHUDViewController *)self isSearching])
  {
    id v6 = [(_UIKeyShortcutHUDConfiguration *)self->_configuration model];
    int v5 = [v6 menuWithAlternatesForModifierFlags:self->_heldModifierFlags];
    [(_UIKeyShortcutHUDViewController *)self _setDisplayedMenu:v5 animated:v3];
  }
}

- (void)_setSearching:(BOOL)a3 animated:(BOOL)a4
{
}

- (void)_setSearching:(BOOL)a3 animated:(BOOL)a4 initialSearchText:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  id v8 = a5;
  if (self->_searching == v6)
  {
    [(_UIKeyShortcutHUDMenuViewController *)self->_menuVC prepareForSearchTransition:v6];
    [(_UIKeyShortcutHUDToolbarViewController *)self->_toolbarVC prepareForSearchTransition:v6];
    [(_UIKeyShortcutHUDMenuViewController *)self->_menuVC setSearching:v6];
    [(_UIKeyShortcutHUDToolbarViewController *)self->_toolbarVC setSearching:v6];
    [(_UIKeyShortcutHUDMenuViewController *)self->_menuVC didCompleteSearchTransition];
    [(_UIKeyShortcutHUDToolbarViewController *)self->_toolbarVC didCompleteSearchTransition];
  }
  else
  {
    self->_searching = v6;
    if (!v6) {
      [(_UIKeyShortcutHUDViewController *)self setHudPresentedIntoSearchMode:0];
    }
    [(_UIKeyShortcutHUDViewController *)self _stopInFlightAnimationsForAnimator:self->_menuPanelAnimator endPosition:2];
    [(_UIKeyShortcutHUDViewController *)self _stopInFlightAnimationsForAnimator:self->_searchTransitionAnimator endPosition:0];
    [(_UIKeyShortcutHUDMenuViewController *)self->_menuVC prepareForSearchTransition:v6];
    [(_UIKeyShortcutHUDToolbarViewController *)self->_toolbarVC prepareForSearchTransition:v6];
    objc_initWeak(location, self);
    double v9 = [(UIViewController *)self->_menuVC view];
    [v9 alpha];
    double v11 = v10;
    BOOL v12 = v10 > 0.0;

    BOOL v13 = [(_UIKeyShortcutHUDConfiguration *)self->_configuration model];
    v14 = objc_msgSend(v13, "searchMenuWithSearchText:maxSearchResultEntries:", v8, -[UIKeyShortcutHUDMetrics maxNumberOfCellsInSearchResults](self->_metrics, "maxNumberOfCellsInSearchResults"));

    int v15 = 0;
    if (v6 && v14)
    {
      if ([v14 isEmpty])
      {
        int v15 = 0;
      }
      else
      {
        int v15 = 1;
        [(UIKeyShortcutHUDMetrics *)self->_metrics setDisplayedMenu:v14 searching:1];
      }
    }
    id v31 = v8;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __76___UIKeyShortcutHUDViewController__setSearching_animated_initialSearchText___block_invoke;
    aBlock[3] = &unk_1E52ECF60;
    objc_copyWeak(&v56, location);
    BOOL v57 = v6;
    char v58 = v15;
    v32 = (void (**)(void))_Block_copy(aBlock);
    v47[0] = MEMORY[0x1E4F143A8];
    v47[1] = 3221225472;
    v47[2] = __76___UIKeyShortcutHUDViewController__setSearching_animated_initialSearchText___block_invoke_2;
    v47[3] = &unk_1E52ECF88;
    objc_copyWeak(&v50, location);
    BOOL v51 = v6;
    char v52 = v15;
    id v16 = v14;
    BOOL v53 = v5;
    id v30 = v16;
    id v48 = v16;
    v49 = self;
    BOOL v54 = v12;
    BOOL v17 = (void (**)(void))_Block_copy(v47);
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __76___UIKeyShortcutHUDViewController__setSearching_animated_initialSearchText___block_invoke_4;
    v43[3] = &unk_1E52ECFB0;
    objc_copyWeak(&v44, location);
    BOOL v45 = v6;
    char v46 = v15;
    uint64_t v18 = _Block_copy(v43);
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __76___UIKeyShortcutHUDViewController__setSearching_animated_initialSearchText___block_invoke_5;
    v41[3] = &unk_1E52DC6C0;
    objc_copyWeak(&v42, location);
    id v19 = _Block_copy(v41);
    metrics = self->_metrics;
    if (v6)
    {
      if (v15)
      {
        [(UIKeyShortcutHUDMetrics *)metrics searchModePreferredMenuPanelWidth];
        -[NSLayoutConstraint setConstant:](self->_menuPreferredWidthConstraint, "setConstant:");
        [(UIKeyShortcutHUDMetrics *)self->_metrics searchModePreferredMenuPanelHeight];
        -[_UIKeyShortcutHUDViewController _setMenuHeight:](self, "_setMenuHeight:");
      }
      else
      {
        [(UIKeyShortcutHUDMetrics *)metrics searchModeStandardHUDWidth];
        -[NSLayoutConstraint setConstant:](self->_menuPreferredWidthConstraint, "setConstant:");
      }
      [(UIKeyShortcutHUDMetrics *)self->_metrics searchModeStandardHUDWidth];
    }
    else
    {
      [(UIKeyShortcutHUDMetrics *)metrics standardMenuPanelHeight];
      -[_UIKeyShortcutHUDViewController _setMenuHeight:](self, "_setMenuHeight:");
      if (v11 <= 0.0)
      {
        [(_UIKeyShortcutHUDMenuViewController *)self->_menuVC setSearching:0];
        [(_UIKeyShortcutHUDViewController *)self _updateDisplayedMenuForCurrentHeldModifierFlagsAnimated:0];
        uint64_t v21 = [(UIViewController *)self view];
        [v21 layoutIfNeeded];
      }
      [(UIKeyShortcutHUDMetrics *)self->_metrics standardHUDWidth];
      -[NSLayoutConstraint setConstant:](self->_menuPreferredWidthConstraint, "setConstant:");
      [(UIKeyShortcutHUDMetrics *)self->_metrics standardHUDWidth];
    }
    -[NSLayoutConstraint setConstant:](self->_toolbarPreferredWidthConstraint, "setConstant:");
    if (v5)
    {
      CGRect v22 = [(_UIKeyShortcutHUDViewController *)self _defaultMenuPanelAnimator];
      menuPanelAnimator = self->_menuPanelAnimator;
      self->_menuPanelAnimator = v22;

      v24 = self->_menuPanelAnimator;
      v39[0] = MEMORY[0x1E4F143A8];
      v39[1] = 3221225472;
      v39[2] = __76___UIKeyShortcutHUDViewController__setSearching_animated_initialSearchText___block_invoke_6;
      v39[3] = &unk_1E52DA040;
      v40 = v32;
      [(UIViewPropertyAnimator *)v24 addAnimations:v39];
      v25 = self->_menuPanelAnimator;
      v37[0] = MEMORY[0x1E4F143A8];
      v37[1] = 3221225472;
      v37[2] = __76___UIKeyShortcutHUDViewController__setSearching_animated_initialSearchText___block_invoke_7;
      v37[3] = &unk_1E52E5E20;
      id v38 = v18;
      [(UIViewPropertyAnimator *)v25 addCompletion:v37];
      v26 = [(_UIKeyShortcutHUDViewController *)self _defaultSearchTransitionAnimator];
      searchTransitionAnimator = self->_searchTransitionAnimator;
      self->_searchTransitionAnimator = v26;

      v28 = self->_searchTransitionAnimator;
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = __76___UIKeyShortcutHUDViewController__setSearching_animated_initialSearchText___block_invoke_8;
      v35[3] = &unk_1E52DA040;
      long long v36 = v17;
      [(UIViewPropertyAnimator *)v28 addAnimations:v35];
      double v29 = self->_searchTransitionAnimator;
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = __76___UIKeyShortcutHUDViewController__setSearching_animated_initialSearchText___block_invoke_9;
      v33[3] = &unk_1E52E5E20;
      id v34 = v19;
      [(UIViewPropertyAnimator *)v29 addCompletion:v33];
      [(UIViewPropertyAnimator *)self->_menuPanelAnimator startAnimation];
      [(UIViewPropertyAnimator *)self->_searchTransitionAnimator startAnimation];
    }
    else
    {
      v32[2]();
      v17[2](v17);
      (*((void (**)(void *, void))v18 + 2))(v18, 0);
      (*((void (**)(void *, void))v19 + 2))(v19, 0);
    }

    objc_destroyWeak(&v42);
    objc_destroyWeak(&v44);

    objc_destroyWeak(&v50);
    objc_destroyWeak(&v56);

    objc_destroyWeak(location);
    id v8 = v31;
  }
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (BOOL)_canChangeFirstResponder:(id)a3 toResponder:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(UIResponder *)self _containsResponder:v7]
    && [(_UIKeyShortcutHUDViewController *)self isHidden])
  {
    BOOL v8 = 0;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)_UIKeyShortcutHUDViewController;
    BOOL v8 = [(UIResponder *)&v10 _canChangeFirstResponder:v6 toResponder:v7];
  }

  return v8;
}

- (void)insertText:(id)a3
{
  id v4 = a3;
  if ([(_UIKeyShortcutHUDViewController *)self isHidden])
  {
    BOOL v5 = v4;
  }
  else
  {
    id v6 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
    id v8 = [v4 stringByTrimmingCharactersInSet:v6];

    if ([v8 length])
    {
      [(_UIKeyShortcutHUDViewController *)self _setSearching:1 animated:1 initialSearchText:v8];
      [(_UIKeyShortcutHUDViewController *)self setShouldIgnoreNextSearchFieldTextChangedCallback:1];
      id v7 = [(_UIKeyShortcutHUDViewController *)self delegate];
      [v7 keyShortcutHUDViewControllerDidBeginTypeAheadSearch:self];
    }
    BOOL v5 = v8;
  }
}

- (BOOL)hasText
{
  v2 = [(_UIKeyShortcutHUDToolbarViewController *)self->_toolbarVC searchBar];
  BOOL v3 = [v2 text];
  BOOL v4 = [v3 length] != 0;

  return v4;
}

- (id)undoManager
{
  return 0;
}

- (BOOL)_disableAutomaticKeyboardUI
{
  if ([(UIResponder *)self isFirstResponder]) {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)_UIKeyShortcutHUDViewController;
  return [(UIResponder *)&v4 _disableAutomaticKeyboardUI];
}

- (BOOL)_suppressSoftwareKeyboard
{
  return 1;
}

- (id)_defaultHUDAppearanceAnimatorForHidden:(BOOL)a3
{
  if (a3) {
    BOOL v3 = [[UICubicTimingParameters alloc] initWithAnimationCurve:0];
  }
  else {
    BOOL v3 = -[UISpringTimingParameters initWithMass:stiffness:damping:initialVelocity:]([UISpringTimingParameters alloc], "initWithMass:stiffness:damping:initialVelocity:", 2.0, 1500.0, 500.0, 0.0, 0.0);
  }
  objc_super v4 = v3;
  BOOL v5 = [[UIViewPropertyAnimator alloc] initWithDuration:v3 timingParameters:0.15];

  return v5;
}

- (id)_defaultSearchTransitionAnimator
{
  v2 = -[UISpringTimingParameters initWithMass:stiffness:damping:initialVelocity:]([UISpringTimingParameters alloc], "initWithMass:stiffness:damping:initialVelocity:", 3.0, 1000.0, 500.0, 0.0, 0.0);
  BOOL v3 = [[UIViewPropertyAnimator alloc] initWithDuration:v2 timingParameters:0.5];

  return v3;
}

- (void)_stopInFlightAnimationsForAnimator:(id)a3 endPosition:(int64_t)a4
{
  id v5 = a3;
  id v6 = v5;
  if (v5)
  {
    id v8 = v5;
    uint64_t v7 = [v5 state];
    id v6 = v8;
    if (v7)
    {
      [v8 stopAnimation:0];
      [v8 finishAnimationAtPosition:a4];
      id v6 = v8;
    }
  }
}

- (void)_setMenuHeight:(double)a3
{
  -[NSLayoutConstraint setConstant:](self->_menuPreferredHeightConstraint, "setConstant:");
  [(UIKeyShortcutHUDMetrics *)self->_metrics hiddenMenuPanelHeight];
  double v6 = v5;
  double v7 = 0.0;
  if (v6 != a3) {
    [(UIKeyShortcutHUDMetrics *)self->_metrics standardMenuToolbarSpacing];
  }
  menuToolbarSpacingConstraint = self->_menuToolbarSpacingConstraint;
  [(NSLayoutConstraint *)menuToolbarSpacingConstraint setConstant:v7];
}

- (void)_setMenuWidth:(double)a3
{
}

- (void)menuViewController:(id)a3 didScrollToCategory:(id)a4 withCategoryIndex:(int64_t)a5
{
}

- (void)menuViewController:(id)a3 didSelectShortcut:(id)a4
{
  id v14 = a4;
  double v5 = [(_UIKeyShortcutHUDViewController *)self configuration];
  double v6 = [v5 clientTraits];
  if (([v6 isSystemApp] & 1) == 0)
  {

    goto LABEL_6;
  }
  double v7 = [v14 uiKeyCommand];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_showShortcutsKeyCommand);
  int v9 = [v7 isEqual:WeakRetained];

  if (!v9)
  {
LABEL_6:
    BOOL v12 = [(UIViewController *)self view];
    [v12 setUserInteractionEnabled:0];

    BOOL v13 = [(_UIKeyShortcutHUDViewController *)self delegate];
    [v13 keyShortcutHUDViewController:self didSelectShortcut:v14];

    goto LABEL_7;
  }
  BOOL v10 = [(_UIKeyShortcutHUDViewController *)self isSearching];
  double v11 = v14;
  if (!v10) {
    goto LABEL_8;
  }
  [(_UIKeyShortcutHUDViewController *)self _setSearching:0 animated:1];
LABEL_7:
  double v11 = v14;
LABEL_8:
}

- (BOOL)menuViewController:(id)a3 shouldPersistSelectionForShortcut:(id)a4
{
  id v5 = a4;
  double v6 = [(_UIKeyShortcutHUDViewController *)self configuration];
  double v7 = [v6 clientTraits];
  if ([v7 isSystemApp])
  {
    id v8 = [v5 uiKeyCommand];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_showShortcutsKeyCommand);
    char v10 = [v8 isEqual:WeakRetained];

    char v11 = v10 ^ 1;
  }
  else
  {
    char v11 = 1;
  }

  return v11;
}

- (void)toolbarViewControllerDidPressSearchButton:(id)a3
{
}

- (void)toolbarViewControllerDidPressCancelSearchButton:(id)a3
{
}

- (void)toolbarViewController:(id)a3 didUpdateSearchText:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(_UIKeyShortcutHUDViewController *)self shouldIgnoreNextSearchFieldTextChangedCallback])
  {
    [(_UIKeyShortcutHUDViewController *)self setShouldIgnoreNextSearchFieldTextChangedCallback:0];
  }
  else if ([(_UIKeyShortcutHUDViewController *)self isSearching])
  {
    [(_UIKeyShortcutHUDViewController *)self _stopInFlightAnimationsForAnimator:self->_menuPanelAnimator endPosition:2];
    id v8 = [(_UIKeyShortcutHUDConfiguration *)self->_configuration model];
    int v9 = objc_msgSend(v8, "searchMenuWithSearchText:maxSearchResultEntries:", v7, -[UIKeyShortcutHUDMetrics maxNumberOfCellsInSearchResults](self->_metrics, "maxNumberOfCellsInSearchResults"));

    if (([v9 isEmpty] & 1) == 0)
    {
      [(_UIKeyShortcutHUDViewController *)self _setDisplayedMenu:v9 animated:0];
      [(_UIKeyShortcutHUDViewController *)self _focusTopSearchResultWithDelay:0];
    }
    char v10 = [(UIViewController *)self->_menuVC view];
    [v10 alpha];
    double v12 = v11;

    int v13 = [v9 isEmpty];
    metrics = self->_metrics;
    if ((v13 ^ 1))
    {
      [(UIKeyShortcutHUDMetrics *)metrics searchModePreferredMenuPanelHeight];
      id v16 = v18;
      [(UIKeyShortcutHUDMetrics *)self->_metrics searchModePreferredMenuPanelWidth];
    }
    else
    {
      [(UIKeyShortcutHUDMetrics *)metrics hiddenMenuPanelHeight];
      id v16 = v15;
      [(UIKeyShortcutHUDMetrics *)self->_metrics hiddenMenuPanelWidth];
    }
    id v19 = v17;
    objc_initWeak(&location, self);
    BOOL v20 = [(_UIKeyShortcutHUDViewController *)self _defaultMenuPanelAnimator];
    menuPanelAnimator = self->_menuPanelAnimator;
    self->_menuPanelAnimator = v20;

    CGRect v22 = self->_menuPanelAnimator;
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __77___UIKeyShortcutHUDViewController_toolbarViewController_didUpdateSearchText___block_invoke;
    v28[3] = &unk_1E52E7E68;
    objc_copyWeak(&v29, &location);
    char v30 = v13 ^ 1;
    [(UIViewPropertyAnimator *)v22 addAnimations:v28];
    if ((((v12 > 0.0) ^ v13) & 1) != 0 || (v13 & 1) == 0)
    {
      [(_UIKeyShortcutHUDViewController *)self _setMenuHeight:*(double *)&v16];
      [(_UIKeyShortcutHUDViewController *)self _setMenuWidth:*(double *)&v19];
      v24 = [(UIViewController *)self view];
      [v24 layoutIfNeeded];
    }
    else
    {
      v23 = self->_menuPanelAnimator;
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __77___UIKeyShortcutHUDViewController_toolbarViewController_didUpdateSearchText___block_invoke_2;
      v25[3] = &unk_1E52ECFD8;
      objc_copyWeak(v27, &location);
      v27[1] = v16;
      v27[2] = v19;
      id v26 = v9;
      [(UIViewPropertyAnimator *)v23 addCompletion:v25];

      objc_destroyWeak(v27);
    }
    [(UIViewPropertyAnimator *)self->_menuPanelAnimator startAnimation];
    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);
  }
}

- (void)toolbarViewController:(id)a3 didSelectCategory:(id)a4 categoryIndex:(int64_t)a5 animated:(BOOL)a6
{
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_UIKeyShortcutHUDViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (_UIKeyShortcutHUDViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (_UIKeyShortcutHUDWindow)hudWindow
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hudWindow);
  return (_UIKeyShortcutHUDWindow *)WeakRetained;
}

- (void)setHudWindow:(id)a3
{
}

- (_UIKeyShortcutHUDConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (UIKeyShortcutHUDMetricsProvider)metricsProvider
{
  return self->_metricsProvider;
}

- (void)setMetricsProvider:(id)a3
{
}

- (BOOL)isSearching
{
  return self->_searching;
}

- (int64_t)heldModifierFlags
{
  return self->_heldModifierFlags;
}

- (UIView)hudContainerView
{
  return self->_hudContainerView;
}

- (void)setHudContainerView:(id)a3
{
}

- (_UIKeyShortcutHUDMenuViewController)menuVC
{
  return self->_menuVC;
}

- (void)setMenuVC:(id)a3
{
}

- (_UIKeyShortcutHUDToolbarViewController)toolbarVC
{
  return self->_toolbarVC;
}

- (void)setToolbarVC:(id)a3
{
}

- (BOOL)isHidden
{
  return self->_hidden;
}

- (BOOL)isCompletelyPresented
{
  return self->_completelyPresented;
}

- (NSLayoutConstraint)hudContainerLeadingEdgeConstraint
{
  return self->_hudContainerLeadingEdgeConstraint;
}

- (void)setHudContainerLeadingEdgeConstraint:(id)a3
{
}

- (NSLayoutConstraint)hudContainerTrailingEdgeConstraint
{
  return self->_hudContainerTrailingEdgeConstraint;
}

- (void)setHudContainerTrailingEdgeConstraint:(id)a3
{
}

- (NSLayoutConstraint)hudContainerTopEdgeConstraint
{
  return self->_hudContainerTopEdgeConstraint;
}

- (void)setHudContainerTopEdgeConstraint:(id)a3
{
}

- (NSLayoutConstraint)hudContainerBottomEdgeConstraint
{
  return self->_hudContainerBottomEdgeConstraint;
}

- (void)setHudContainerBottomEdgeConstraint:(id)a3
{
}

- (NSLayoutConstraint)hudContainerBottomSafeAreaEdgeConstraint
{
  return self->_hudContainerBottomSafeAreaEdgeConstraint;
}

- (void)setHudContainerBottomSafeAreaEdgeConstraint:(id)a3
{
}

- (NSLayoutConstraint)menuPreferredWidthConstraint
{
  return self->_menuPreferredWidthConstraint;
}

- (void)setMenuPreferredWidthConstraint:(id)a3
{
}

- (NSLayoutConstraint)menuPreferredHeightConstraint
{
  return self->_menuPreferredHeightConstraint;
}

- (void)setMenuPreferredHeightConstraint:(id)a3
{
}

- (NSLayoutConstraint)menuToolbarSpacingConstraint
{
  return self->_menuToolbarSpacingConstraint;
}

- (void)setMenuToolbarSpacingConstraint:(id)a3
{
}

- (NSLayoutConstraint)toolbarPreferredWidthConstraint
{
  return self->_toolbarPreferredWidthConstraint;
}

- (void)setToolbarPreferredWidthConstraint:(id)a3
{
}

- (_UIKeyShortcutHUDCollectionViewManager)collectionViewManager
{
  return self->_collectionViewManager;
}

- (void)setCollectionViewManager:(id)a3
{
}

- (UIKeyShortcutHUDMetrics)metrics
{
  return self->_metrics;
}

- (void)setMetrics:(id)a3
{
}

- (_UIPassthroughScrollInteraction)passthroughScrollInteraction
{
  return self->_passthroughScrollInteraction;
}

- (void)setPassthroughScrollInteraction:(id)a3
{
}

- (NSMutableDictionary)hudToModelKeyCommandsMap
{
  return self->_hudToModelKeyCommandsMap;
}

- (void)setHudToModelKeyCommandsMap:(id)a3
{
}

- (UIKeyCommand)showShortcutsKeyCommand
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_showShortcutsKeyCommand);
  return (UIKeyCommand *)WeakRetained;
}

- (void)setShowShortcutsKeyCommand:(id)a3
{
}

- (UIViewPropertyAnimator)hudAppearanceAnimator
{
  return self->_hudAppearanceAnimator;
}

- (void)setHudAppearanceAnimator:(id)a3
{
}

- (UIViewPropertyAnimator)menuPanelAnimator
{
  return self->_menuPanelAnimator;
}

- (void)setMenuPanelAnimator:(id)a3
{
}

- (UIViewPropertyAnimator)searchTransitionAnimator
{
  return self->_searchTransitionAnimator;
}

- (void)setSearchTransitionAnimator:(id)a3
{
}

- (BOOL)isHUDPresentedIntoSearchMode
{
  return self->_hudPresentedIntoSearchMode;
}

- (void)setHudPresentedIntoSearchMode:(BOOL)a3
{
  self->_hudPresentedIntoSearchMode = a3;
}

- (BOOL)shouldIgnoreNextSearchFieldTextChangedCallback
{
  return self->_shouldIgnoreNextSearchFieldTextChangedCallback;
}

- (void)setShouldIgnoreNextSearchFieldTextChangedCallback:(BOOL)a3
{
  self->_shouldIgnoreNextSearchFieldTextChangedCallback = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchTransitionAnimator, 0);
  objc_storeStrong((id *)&self->_menuPanelAnimator, 0);
  objc_storeStrong((id *)&self->_hudAppearanceAnimator, 0);
  objc_destroyWeak((id *)&self->_showShortcutsKeyCommand);
  objc_storeStrong((id *)&self->_hudToModelKeyCommandsMap, 0);
  objc_storeStrong((id *)&self->_passthroughScrollInteraction, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_collectionViewManager, 0);
  objc_storeStrong((id *)&self->_toolbarPreferredWidthConstraint, 0);
  objc_storeStrong((id *)&self->_menuToolbarSpacingConstraint, 0);
  objc_storeStrong((id *)&self->_menuPreferredHeightConstraint, 0);
  objc_storeStrong((id *)&self->_menuPreferredWidthConstraint, 0);
  objc_storeStrong((id *)&self->_hudContainerBottomSafeAreaEdgeConstraint, 0);
  objc_storeStrong((id *)&self->_hudContainerBottomEdgeConstraint, 0);
  objc_storeStrong((id *)&self->_hudContainerTopEdgeConstraint, 0);
  objc_storeStrong((id *)&self->_hudContainerTrailingEdgeConstraint, 0);
  objc_storeStrong((id *)&self->_hudContainerLeadingEdgeConstraint, 0);
  objc_storeStrong((id *)&self->_toolbarVC, 0);
  objc_storeStrong((id *)&self->_menuVC, 0);
  objc_storeStrong((id *)&self->_hudContainerView, 0);
  objc_storeStrong((id *)&self->_metricsProvider, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_destroyWeak((id *)&self->_hudWindow);
  objc_destroyWeak((id *)&self->_delegate);
}

@end