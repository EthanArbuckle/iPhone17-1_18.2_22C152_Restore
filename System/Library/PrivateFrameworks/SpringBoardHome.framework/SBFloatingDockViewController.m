@interface SBFloatingDockViewController
- (BOOL)_isInAppToAppTransition;
- (BOOL)_isInSwitcherTransition;
- (BOOL)_isLibraryContainedInForeground;
- (BOOL)_shouldOpenFolderIcon:(id)a3;
- (BOOL)folderController:(id)a3 canChangeCurrentPageIndexToIndex:(int64_t)a4;
- (BOOL)folderController:(id)a3 iconListView:(id)a4 canHandleIconDropSession:(id)a5;
- (BOOL)folderController:(id)a3 iconListView:(id)a4 shouldAllowSpringLoadedInteractionForIconDropSession:(id)a5 onIconView:(id)a6;
- (BOOL)folderControllerShouldClose:(id)a3 withPinchGesture:(id)a4;
- (BOOL)iconListView:(id)a3 canHandleIconDropSession:(id)a4;
- (BOOL)iconListView:(id)a3 shouldAllowSpringLoadedInteractionForIconDropSession:(id)a4 onIconView:(id)a5;
- (BOOL)iconViewCanBecomeFocused:(id)a3;
- (BOOL)iconViewCanBeginDrags:(id)a3;
- (BOOL)isDefaultContainerForegroundForPresenter:(id)a3;
- (BOOL)isDisplayingIcon:(id)a3;
- (BOOL)isDisplayingIcon:(id)a3 inLocation:(id)a4;
- (BOOL)isDisplayingIcon:(id)a3 inLocations:(id)a4;
- (BOOL)isDisplayingIconView:(id)a3;
- (BOOL)isDisplayingIconView:(id)a3 inLocation:(id)a4;
- (BOOL)isEditing;
- (BOOL)isIconViewRecycled:(id)a3;
- (BOOL)isLibraryPodIconEffectivelyVisible;
- (BOOL)isLibraryPodIconEnabled;
- (BOOL)isLibraryPodIconVisible;
- (BOOL)isPresentingFolder;
- (BOOL)isPresentingIconLocation:(id)a3;
- (BOOL)isPresentingLibrary;
- (BOOL)isPresentingLibraryInForeground;
- (BOOL)isTransitioningUnderlyingBackgroundStyle;
- (BOOL)shouldIndicateImpossibleDrop;
- (BOOL)suppressesEditingStateForListViews;
- (BOOL)wantsFastIconReordering;
- (CGRect)floatingDockScreenFrame;
- (CGRect)floatingDockScreenPresentationFrame;
- (CGSize)maximumEditingIconSize;
- (Class)controllerClassForFolder:(id)a3;
- (NSMutableArray)currentCollapseCompletions;
- (NSMutableArray)currentExpandCompletions;
- (NSSet)presentedIconLocations;
- (NSString)description;
- (SBFloatingDockSuggestionsViewProviding)suggestionsViewController;
- (SBFloatingDockView)dockView;
- (SBFloatingDockViewController)initWithIconManager:(id)a3 iconViewProvider:(id)a4;
- (SBFloatingDockViewControllerDelegate)delegate;
- (SBFolderController)presentedFolderController;
- (SBFolderPresentingViewController)folderPresentingViewController;
- (SBHFloatingDockStyleConfiguration)transitionTargetUnderlyingPresentationStyleConfiguration;
- (SBHFloatingDockStyleConfiguration)underlyingPresentationStyleConfiguration;
- (SBHIconManager)iconManager;
- (SBHIconModel)iconModel;
- (SBHLibraryViewController)libraryViewController;
- (SBHModalLibraryPresenter)libraryPresenter;
- (SBHTouchPassThroughView)scalingView;
- (SBHomeScreenIconTransitionAnimator)currentFolderAnimator;
- (SBIconListLayoutProvider)listLayoutProvider;
- (SBIconListModel)dockListModel;
- (SBIconListView)dockIconListView;
- (SBIconView)libraryPodIconView;
- (SBIconViewProviding)iconViewProvider;
- (UIWindow)animationWindow;
- (_UILegibilitySettings)legibilitySettings;
- (double)contentHeight;
- (double)contentHeightForFrame:(CGRect)a3;
- (double)dockOffscreenProgress;
- (double)lastDockHeight;
- (double)maximumContentHeight;
- (double)maximumDockContinuousCornerRadius;
- (double)minimumHomeScreenScaleForFolderPresentationController:(id)a3;
- (double)minimumVerticalMarginForFrame:(CGRect)a3;
- (double)preferredVerticalMargin;
- (double)requestedVerticalMargin;
- (double)translationFromFullyPresentedFrame;
- (id)_backdropGroupName;
- (id)_backdropGroupNamespace;
- (id)acquireOrderSourceContainerViewBeforeLibraryViewAssertionForReason:(id)a3;
- (id)configureForPresentingLibraryViewController:(id)a3;
- (id)containerViewControllerForPresentingInForeground:(id)a3;
- (id)customImageViewControllerForIconView:(id)a3;
- (id)dequeueReusableIconViewOfClass:(Class)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)dockViewIfExists;
- (id)firstIconViewForIcon:(id)a3;
- (id)firstIconViewForIcon:(id)a3 excludingLocations:(id)a4;
- (id)firstIconViewForIcon:(id)a3 inLocations:(id)a4;
- (id)firstIconViewForIcon:(id)a3 options:(unint64_t)a4;
- (id)folderController:(id)a3 accessibilityTintColorForScreenRect:(CGRect)a4;
- (id)folderController:(id)a3 iconListView:(id)a4 customSpringAnimationBehaviorForDroppingItem:(id)a5;
- (id)folderController:(id)a3 iconListView:(id)a4 iconDropSessionDidUpdate:(id)a5;
- (id)folderController:(id)a3 iconListView:(id)a4 previewForDroppingIconDragItem:(id)a5 proposedPreview:(id)a6;
- (id)folderPresentationController:(id)a3 animationControllerForTransitionWithFolder:(id)a4 presenting:(BOOL)a5 animated:(BOOL)a6;
- (id)folderPresentationController:(id)a3 sourceViewForPresentingViewController:(id)a4;
- (id)iconListView:(id)a3 customSpringAnimationBehaviorForDroppingItem:(id)a4;
- (id)iconListView:(id)a3 iconDropSessionDidUpdate:(id)a4;
- (id)iconListView:(id)a3 iconViewForDroppingIconDragItem:(id)a4 proposedIconView:(id)a5;
- (id)iconListView:(id)a3 previewForDroppingIconDragItem:(id)a4 proposedPreview:(id)a5;
- (id)iconViewForIcon:(id)a3 location:(id)a4;
- (id)libraryIconViewControllerForPresenter:(id)a3;
- (id)libraryIconViewForPresenter:(id)a3;
- (id)libraryPodIconViewIfLoaded;
- (id)recentIconListView;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (id)suggestionsIconLocation;
- (id)userIconListView;
- (id)userIconLocation;
- (int64_t)_backgroundUserInterfaceStyle;
- (unint64_t)_backgroundEffectForPresentedFolder;
- (unint64_t)_currentFolderIconBackgroundStyle;
- (unint64_t)_platterEffectForPresentedFolder;
- (unint64_t)focusEffectTypeForIconView:(id)a3;
- (void)_addDockGestureRecognizer:(id)a3;
- (void)_coalesceRequestsToResizeDockForChangedNumberOfIcons;
- (void)_presentFolderForIcon:(id)a3 location:(id)a4 animated:(BOOL)a5 completion:(id)a6;
- (void)_rebuildAfterIconModelChange;
- (void)_rebuildLibraryPodIcon;
- (void)_rebuildUserIconListView;
- (void)_resizeDockForChangedNumberOfIconsAnimated:(BOOL)a3;
- (void)_setPaddingEdgeInsets:(UIEdgeInsets)a3;
- (void)_sizeCategoryDidChange:(id)a3;
- (void)_updateDockForStyleConfiguration:(id)a3;
- (void)_updateEditingStateAnimated:(BOOL)a3;
- (void)_updateFolderIconBackgroundsForStyleConfiguration:(id)a3;
- (void)_updateLibraryPodDockAccessoryViewDisplayed;
- (void)_updateLibraryPodIconComponentVisibility;
- (void)_updatePlatterShadowForStyleConfiguration:(id)a3;
- (void)_updatePresentedFolderBackgroundForStyleConfiguration:(id)a3;
- (void)_updateViewBackdropGroupName;
- (void)cleanUpAfterUnderlyingBackgroundStyleTransition;
- (void)configureIconView:(id)a3 forIcon:(id)a4;
- (void)coronaAnimationController:(id)a3 willAnimateCoronaTransitionWithAnimator:(id)a4;
- (void)dealloc;
- (void)dismissLibraryAnimated:(BOOL)a3 completion:(id)a4;
- (void)dismissPresentedFolderAnimated:(BOOL)a3 completion:(id)a4;
- (void)dockViewDidBecomeVisible;
- (void)dockViewDidResignVisible;
- (void)dockViewWillBecomeVisible;
- (void)dockViewWillResignVisible;
- (void)enumerateDisplayedIconViewsForIcon:(id)a3 usingBlock:(id)a4;
- (void)enumerateDisplayedIconViewsUsingBlock:(id)a3;
- (void)enumerateIconListViewsUsingBlock:(id)a3;
- (void)enumerateIconListsUsingBlock:(id)a3;
- (void)enumerateVisibleIconViewsUsingBlock:(id)a3;
- (void)floatingDockSuggestionsViewControllerDidChangeNumberOfVisibleSuggestions:(id)a3;
- (void)floatingDockViewMainPlatterDidChangeFrame:(id)a3;
- (void)folderController:(id)a3 didBeginEditingTitle:(id)a4;
- (void)folderController:(id)a3 didEndEditingTitle:(id)a4;
- (void)folderController:(id)a3 draggedIconShouldDropFromListView:(id)a4;
- (void)folderController:(id)a3 iconListView:(id)a4 iconDragItem:(id)a5 willAnimateDropWithAnimator:(id)a6;
- (void)folderController:(id)a3 iconListView:(id)a4 iconDropSessionDidEnter:(id)a5;
- (void)folderController:(id)a3 iconListView:(id)a4 iconDropSessionDidExit:(id)a5;
- (void)folderController:(id)a3 iconListView:(id)a4 performIconDrop:(id)a5;
- (void)folderController:(id)a3 iconListView:(id)a4 springLoadedInteractionForIconDragDidCompleteOnIconView:(id)a5;
- (void)folderController:(id)a3 iconListView:(id)a4 willUseIconView:(id)a5 forDroppingIconDragItem:(id)a6;
- (void)folderControllerDidClose:(id)a3;
- (void)folderControllerDidOpen:(id)a3;
- (void)folderControllerShouldBeginEditing:(id)a3 withHaptic:(BOOL)a4;
- (void)folderControllerShouldEndEditing:(id)a3;
- (void)folderControllerWillBeginScrolling:(id)a3;
- (void)folderControllerWillClose:(id)a3;
- (void)folderControllerWillOpen:(id)a3;
- (void)folderPresentationController:(id)a3 willPerformTransitionWithFolder:(id)a4 presenting:(BOOL)a5 withTransitionCoordinator:(id)a6;
- (void)handleSpringLoadDidActivateForLibraryIndicatorIconView:(id)a3;
- (void)icon:(id)a3 touchEnded:(BOOL)a4;
- (void)icon:(id)a3 touchMoved:(id)a4;
- (void)iconDraggingDidChange:(id)a3;
- (void)iconEditingDidChange:(id)a3;
- (void)iconList:(id)a3 didAddIcon:(id)a4;
- (void)iconList:(id)a3 didRemoveIcon:(id)a4;
- (void)iconListView:(id)a3 iconDragItem:(id)a4 willAnimateDropWithAnimator:(id)a5;
- (void)iconListView:(id)a3 iconDropSessionDidEnter:(id)a4;
- (void)iconListView:(id)a3 iconDropSessionDidExit:(id)a4;
- (void)iconListView:(id)a3 performIconDrop:(id)a4;
- (void)iconListView:(id)a3 springLoadedInteractionForIconDragDidCompleteOnIconView:(id)a4;
- (void)iconListView:(id)a3 willUseIconView:(id)a4 forDroppingIconDragItem:(id)a5;
- (void)iconModelDidLayout:(id)a3;
- (void)iconTapped:(id)a3;
- (void)iconTouchBegan:(id)a3;
- (void)iconView:(id)a3 didChangeCustomImageViewController:(id)a4;
- (void)layoutUserControlledIconListsWithAnimationType:(int64_t)a3 forceRelayout:(BOOL)a4;
- (void)libraryIndicatorIconView:(id)a3 didAcceptDropForSession:(id)a4;
- (void)libraryViewController:(id)a3 dataSourceDidChange:(id)a4;
- (void)listLayoutProviderDidChange:(id)a3;
- (void)prepareForTransitionToStyleConfiguration:(id)a3 fromDockVisible:(BOOL)a4 toDockVisible:(BOOL)a5;
- (void)presentFolderForIcon:(id)a3 location:(id)a4 animated:(BOOL)a5 completion:(id)a6;
- (void)presentLibraryAnimated:(BOOL)a3 completion:(id)a4;
- (void)recycleIconView:(id)a3;
- (void)reduceTransparencyEnabledStateDidChange:(id)a3;
- (void)returnScalingView;
- (void)setCurrentCollapseCompletions:(id)a3;
- (void)setCurrentExpandCompletions:(id)a3;
- (void)setCurrentFolderAnimator:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDockListModel:(id)a3;
- (void)setDockOffscreenProgress:(double)a3;
- (void)setDockView:(id)a3;
- (void)setEditing:(BOOL)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setFolderPresentingViewController:(id)a3;
- (void)setLastDockHeight:(double)a3;
- (void)setLegibilitySettings:(id)a3;
- (void)setLibraryPodIconEnabled:(BOOL)a3;
- (void)setLibraryPodIconVisible:(BOOL)a3;
- (void)setLibraryPodIconVisible:(BOOL)a3 animated:(BOOL)a4;
- (void)setLibraryPresenter:(id)a3;
- (void)setListLayoutProvider:(id)a3;
- (void)setListLayoutProvider:(id)a3 animated:(BOOL)a4;
- (void)setMaximumEditingIconSize:(CGSize)a3;
- (void)setRequestedVerticalMargin:(double)a3;
- (void)setScalingView:(id)a3;
- (void)setShouldIndicateImpossibleDrop:(BOOL)a3;
- (void)setSuggestionsViewController:(id)a3;
- (void)setSuppressesEditingStateForListViews:(BOOL)a3;
- (void)setTransitionTargetUnderlyingPresentationStyleConfiguration:(id)a3;
- (void)setTransitioningUnderlyingPresentationStyleConfiguration:(BOOL)a3;
- (void)setUnderlyingPresentationStyleConfiguration:(id)a3;
- (void)setWantsFastIconReordering:(BOOL)a3;
- (void)toggleLibraryPresentedAnimated:(BOOL)a3 completion:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation SBFloatingDockViewController

- (SBFloatingDockViewController)initWithIconManager:(id)a3 iconViewProvider:(id)a4
{
  v23[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v22.receiver = self;
  v22.super_class = (Class)SBFloatingDockViewController;
  v8 = [(SBFloatingDockViewController *)&v22 initWithNibName:0 bundle:0];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_iconManager, v6);
    objc_storeWeak((id *)&v9->_iconViewProvider, v7);
    v10 = [v6 iconModel];
    v11 = [v10 rootFolder];
    uint64_t v12 = [v11 dock];
    dockListModel = v9->_dockListModel;
    v9->_dockListModel = (SBIconListModel *)v12;

    uint64_t v14 = [v6 listLayoutProvider];
    listLayoutProvider = v9->_listLayoutProvider;
    v9->_listLayoutProvider = (SBIconListLayoutProvider *)v14;

    v16 = +[SBHFloatingDockStyleConfiguration defaultConfiguration];
    [(SBFloatingDockViewController *)v9 setUnderlyingPresentationStyleConfiguration:v16];

    v17 = self;
    v23[0] = v17;
    v18 = self;
    v23[1] = v18;
    v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];
    id v20 = (id)[(SBFloatingDockViewController *)v9 registerForTraitChanges:v19 withAction:sel__updateViewBackdropGroupName];
  }
  return v9;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)SBFloatingDockViewController;
  [(SBFloatingDockViewController *)&v4 dealloc];
}

- (void)viewDidLoad
{
  v21.receiver = self;
  v21.super_class = (Class)SBFloatingDockViewController;
  [(SBFloatingDockViewController *)&v21 viewDidLoad];
  v3 = [(SBFloatingDockViewController *)self view];
  objc_super v4 = [(SBFloatingDockViewController *)self iconManager];
  v5 = [(SBFloatingDockViewController *)self dockListModel];
  [v5 addListObserver:self];
  id v6 = objc_alloc_init(SBFloatingDockView);
  id v7 = [(SBFloatingDockView *)v6 mainPlatterView];
  v8 = [(SBFloatingDockViewController *)self _backdropGroupName];
  [v7 setBackdropGroupName:v8];

  v9 = [(SBFloatingDockViewController *)self _backdropGroupNamespace];
  [v7 setBackdropGroupNamespace:v9];

  [(SBFloatingDockView *)v6 setDelegate:self];
  [(SBFloatingDockViewController *)self setDockView:v6];
  [v3 addSubview:v6];
  [(SBFloatingDockViewController *)self _rebuildUserIconListView];
  self->_libraryPodIconVisible = 1;
  [(SBFloatingDockViewController *)self _updateLibraryPodDockAccessoryViewDisplayed];
  v10 = [(SBFloatingDockViewController *)self suggestionsViewController];
  if (v10)
  {
    [(SBFloatingDockViewController *)self addChildViewController:v10];
    v11 = [v10 listView];
    [(SBFloatingDockView *)v6 setRecentIconListView:v11];
    [v10 didMoveToParentViewController:self];
    uint64_t v12 = [v4 iconImageCache];
    [v11 setIconImageCache:v12];

    v13 = [v4 folderIconImageCache];
    [v11 setFolderIconImageCache:v13];
  }
  uint64_t v14 = objc_alloc_init(SBFolderPresentingViewController);
  [(SBFolderPresentingViewController *)v14 setFolderPresentationDelegate:self];
  [(SBFloatingDockViewController *)self setFolderPresentingViewController:v14];
  v15 = [(SBFolderPresentingViewController *)v14 view];
  [v15 setAutoresizingMask:18];

  v16 = [(SBFolderPresentingViewController *)v14 view];
  [v3 bounds];
  objc_msgSend(v16, "setFrame:");

  [(SBFloatingDockViewController *)self bs_addChildViewController:v14];
  v17 = [(SBFolderPresentingViewController *)v14 view];
  [v3 sendSubviewToBack:v17];

  v18 = [SBHTouchPassThroughView alloc];
  [v3 bounds];
  v19 = -[SBHTouchPassThroughView initWithFrame:](v18, "initWithFrame:");
  [(SBHTouchPassThroughView *)v19 setAutoresizingMask:18];
  [(SBFloatingDockViewController *)self setScalingView:v19];
  [v3 addSubview:v19];
  id v20 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v20 addObserver:self selector:sel_iconManagerDidChangeIconModel_ name:@"SBHIconManagerIconModelDidChange" object:v4];
  [v20 addObserver:self selector:sel_iconModelDidLayout_ name:@"SBIconModelDidLayoutIconStateNotification" object:0];
  [v20 addObserver:self selector:sel_iconEditingDidChange_ name:@"SBHIconManagerEditingStateChanged" object:v4];
  [v20 addObserver:self selector:sel_iconDraggingDidChange_ name:@"SBHIconManagerIconDraggingChanged" object:v4];
  [v20 addObserver:self selector:sel_listLayoutProviderDidChange_ name:@"SBHIconManagerListLayoutProviderDidChange" object:v4];
  [v20 addObserver:self selector:sel_reduceTransparencyEnabledStateDidChange_ name:*MEMORY[0x1E4FB24A8] object:0];
  [v20 addObserver:self selector:sel__sizeCategoryDidChange_ name:*MEMORY[0x1E4FB27A8] object:0];
}

- (void)viewDidAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SBFloatingDockViewController;
  [(SBFloatingDockViewController *)&v7 viewDidAppear:a3];
  objc_super v4 = [(SBFloatingDockViewController *)self dockView];
  v5 = [v4 window];

  if (objc_opt_respondsToSelector())
  {
    id v6 = objc_msgSend(v5, "sb_coronaAnimationController");
    [v6 addParticipant:self];
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SBFloatingDockViewController;
  [(SBFloatingDockViewController *)&v7 viewDidDisappear:a3];
  objc_super v4 = [(SBFloatingDockViewController *)self dockView];
  v5 = [v4 window];

  if (objc_opt_respondsToSelector())
  {
    id v6 = objc_msgSend(v5, "sb_coronaAnimationController");
    [v6 removeParticipant:self];
  }
}

- (void)viewDidLayoutSubviews
{
  v25.receiver = self;
  v25.super_class = (Class)SBFloatingDockViewController;
  [(SBFloatingDockViewController *)&v25 viewDidLayoutSubviews];
  v3 = [(SBFloatingDockViewController *)self view];
  [v3 bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  -[SBFloatingDockViewController contentHeightForFrame:](self, "contentHeightForFrame:");
  UICeilToViewScale();
  CGFloat v13 = v12;
  memset(&slice, 0, sizeof(slice));
  memset(&remainder, 0, sizeof(remainder));
  v26.origin.x = v5;
  v26.origin.y = v7;
  v26.size.width = v9;
  v26.size.height = v11;
  CGRectDivide(v26, &slice, &remainder, v13, CGRectMaxYEdge);
  -[SBFloatingDockView setBounds:](self->_dockView, "setBounds:", 0.0, 0.0, slice.size.width, slice.size.height);
  dockView = self->_dockView;
  UIRectGetCenter();
  -[SBFloatingDockView setCenter:](dockView, "setCenter:");
  v15 = self->_dockView;
  [(SBFloatingDockViewController *)self translationFromFullyPresentedFrame];
  long long v16 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&v21.a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&v21.c = v16;
  *(_OWORD *)&v21.tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  CGAffineTransformTranslate(&v22, &v21, 0.0, v17);
  [(SBFloatingDockView *)v15 setTransform:&v22];
  [(SBFloatingDockViewController *)self lastDockHeight];
  if (v13 != v18)
  {
    [(SBFloatingDockViewController *)self setLastDockHeight:v13];
    v19 = [(SBFloatingDockViewController *)self iconManager];
    [v19 noteFloatingDockWillChangeHeight];
    id v20 = [(SBFloatingDockViewController *)self delegate];
    [v20 floatingDockViewController:self didChangeContentHeight:v13];
  }
  [(SBFloatingDockView *)self->_dockView setFocusGroupIdentifier:@"FolderViewFocusGroup"];
}

- (SBFloatingDockView)dockView
{
  [(SBFloatingDockViewController *)self loadViewIfNeeded];
  dockView = self->_dockView;
  return dockView;
}

- (id)dockViewIfExists
{
  return self->_dockView;
}

- (void)setDockView:(id)a3
{
}

- (id)userIconListView
{
  v2 = [(SBFloatingDockViewController *)self dockView];
  v3 = [v2 userIconListView];

  return v3;
}

- (id)libraryPodIconViewIfLoaded
{
  return self->_libraryPodIconView;
}

- (SBIconView)libraryPodIconView
{
  p_libraryPodIconView = &self->_libraryPodIconView;
  libraryPodIconView = self->_libraryPodIconView;
  if (!libraryPodIconView)
  {
    CGFloat v5 = [(SBFloatingDockViewController *)self iconManager];
    double v6 = objc_alloc_init(SBHLibraryPodIndicatorIcon);
    unint64_t v7 = +[SBDockIconListView defaultIconViewConfigurationOptions] | 0x10;
    double v8 = [SBIconView alloc];
    CGFloat v9 = [v5 listLayoutProvider];
    double v10 = [(SBIconView *)v8 initWithConfigurationOptions:v7 listLayoutProvider:v9];

    [(SBIconView *)v10 setDelegate:self];
    [(SBIconView *)v10 addObserver:self];
    [(SBIconView *)v10 setIcon:v6];
    [(SBIconView *)v10 setAllowsCloseBox:0];
    [(SBIconView *)v10 setAllowsEditingAnimation:0];
    [(SBIconView *)v10 setIconContentScalingEnabled:1];
    CGFloat v11 = [(SBFloatingDockViewController *)self userIconLocation];
    [(SBIconView *)v10 setLocation:v11 animated:0];

    double v12 = [v5 iconImageCache];
    [(SBIconView *)v10 setIconImageCache:v12];

    CGFloat v13 = [v5 folderIconImageCache];
    [(SBIconView *)v10 setFolderIconImageCache:v13];

    uint64_t v14 = [[SBHLibraryIndicatorIconDropInteractionDelegate alloc] initWithLibraryIndicatorIconView:v10];
    libraryIconDropInteractionDelegate = self->_libraryIconDropInteractionDelegate;
    self->_libraryIconDropInteractionDelegate = v14;

    [(SBHLibraryIndicatorIconDropInteractionDelegate *)self->_libraryIconDropInteractionDelegate setContextProvider:self];
    objc_storeStrong((id *)p_libraryPodIconView, v10);
    long long v16 = (void *)MEMORY[0x1E4FB1EB0];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __50__SBFloatingDockViewController_libraryPodIconView__block_invoke;
    v19[3] = &unk_1E6AAC810;
    id v20 = v10;
    CGFloat v17 = v10;
    [v16 performWithoutAnimation:v19];

    libraryPodIconView = *p_libraryPodIconView;
  }
  return libraryPodIconView;
}

uint64_t __50__SBFloatingDockViewController_libraryPodIconView__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setNeedsLayout];
  v2 = *(void **)(a1 + 32);
  return [v2 layoutIfNeeded];
}

- (id)recentIconListView
{
  v2 = [(SBFloatingDockViewController *)self dockView];
  v3 = [v2 recentIconListView];

  return v3;
}

- (void)setLibraryPodIconEnabled:(BOOL)a3
{
  if (self->_libraryPodIconEnabled != a3)
  {
    BOOL v5 = [(SBFloatingDockViewController *)self isLibraryPodIconEffectivelyVisible];
    self->_libraryPodIconEnabled = a3;
    if (v5 != [(SBFloatingDockViewController *)self isLibraryPodIconEffectivelyVisible])[(SBFloatingDockViewController *)self _resizeDockForChangedNumberOfIconsAnimated:1]; {
    if (!a3)
    }
    {
      libraryPodIconView = self->_libraryPodIconView;
      self->_libraryPodIconView = 0;

      libraryIconViewController = self->_libraryIconViewController;
      self->_libraryIconViewController = 0;

      libraryIconDropInteractionDelegate = self->_libraryIconDropInteractionDelegate;
      self->_libraryIconDropInteractionDelegate = 0;

      [(SBFloatingDockViewController *)self _updateLibraryPodDockAccessoryViewDisplayed];
    }
  }
}

- (void)_rebuildLibraryPodIcon
{
  if ([(SBFloatingDockViewController *)self isLibraryPodIconEnabled])
  {
    libraryPodIconView = self->_libraryPodIconView;
    self->_libraryPodIconView = 0;

    libraryIconViewController = self->_libraryIconViewController;
    self->_libraryIconViewController = 0;

    libraryIconDropInteractionDelegate = self->_libraryIconDropInteractionDelegate;
    self->_libraryIconDropInteractionDelegate = 0;

    id v6 = [(SBFloatingDockViewController *)self dockView];
    [v6 setAccessoryIconView:0];
    [(SBFloatingDockViewController *)self _updateLibraryPodDockAccessoryViewDisplayed];
  }
}

- (void)setLibraryPodIconVisible:(BOOL)a3
{
}

- (void)setLibraryPodIconVisible:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_libraryPodIconVisible != a3)
  {
    BOOL v4 = a4;
    BOOL v7 = [(SBFloatingDockViewController *)self isLibraryPodIconEffectivelyVisible];
    self->_libraryPodIconVisible = a3;
    if (v7 != [(SBFloatingDockViewController *)self isLibraryPodIconEffectivelyVisible])
    {
      [(SBFloatingDockViewController *)self _resizeDockForChangedNumberOfIconsAnimated:v4];
    }
  }
}

- (BOOL)isLibraryPodIconEffectivelyVisible
{
  BOOL v3 = [(SBFloatingDockViewController *)self isLibraryPodIconEnabled];
  if (v3)
  {
    LOBYTE(v3) = [(SBFloatingDockViewController *)self isLibraryPodIconVisible];
  }
  return v3;
}

- (id)configureForPresentingLibraryViewController:(id)a3
{
  BOOL v5 = (SBHLibraryViewController *)a3;
  libraryViewController = self->_libraryViewController;
  if (libraryViewController != v5)
  {
    [(SBHLibraryViewController *)libraryViewController removeObserver:self];
    objc_storeStrong((id *)&self->_libraryViewController, a3);
    [(SBHLibraryViewController *)self->_libraryViewController addObserver:self];
    libraryIconViewController = self->_libraryIconViewController;
    double v8 = [(SBHLibraryViewController *)v5 podFolderViewController];
    CGFloat v9 = [v8 dataSource];
    [(SBHLibraryIconViewController *)libraryIconViewController setLibraryDataSource:v9];

    if (v5)
    {
      double v10 = [(SBFloatingDockViewController *)self delegate];
      uint64_t v11 = [v10 libraryContainerViewControllerForFloatingDockViewController:self];
      double v12 = (void *)v11;
      if (v11) {
        CGFloat v13 = (SBFloatingDockViewController *)v11;
      }
      else {
        CGFloat v13 = self;
      }
      uint64_t v14 = v13;

      v15 = [[SBHModalLibraryPresenter alloc] initWithContainerViewController:v14 libraryViewController:v5];
      [(SBHModalLibraryPresenter *)v15 setContextProvider:self];
      [(SBHLibraryViewController *)v5 setPresenter:v15];
      [(SBFloatingDockViewController *)self setLibraryPresenter:v15];
    }
    else
    {
      [(SBFloatingDockViewController *)self setLibraryPresenter:0];
    }
  }
  long long v16 = [(SBFloatingDockViewController *)self libraryPresenter];

  return v16;
}

- (void)setSuggestionsViewController:(id)a3
{
  BOOL v5 = (SBFloatingDockSuggestionsViewProviding *)a3;
  suggestionsViewController = self->_suggestionsViewController;
  if (suggestionsViewController != v5)
  {
    BOOL v7 = v5;
    [(SBFloatingDockSuggestionsViewProviding *)suggestionsViewController setFloatingDockViewController:0];
    objc_storeStrong((id *)&self->_suggestionsViewController, a3);
    [(SBFloatingDockSuggestionsViewProviding *)self->_suggestionsViewController setFloatingDockViewController:self];
    BOOL v5 = v7;
  }
}

- (id)suggestionsIconLocation
{
  v2 = [(SBFloatingDockViewController *)self suggestionsViewController];
  BOOL v3 = [v2 listView];
  BOOL v4 = [v3 iconLocation];

  return v4;
}

- (id)userIconLocation
{
  return @"SBIconLocationFloatingDock";
}

- (double)maximumContentHeight
{
  return 150.0;
}

- (double)contentHeight
{
  v2 = [(SBFloatingDockViewController *)self dockView];
  [v2 contentHeight];
  double v4 = v3;

  return v4;
}

- (double)contentHeightForFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  BOOL v7 = [(SBFloatingDockViewController *)self dockView];
  objc_msgSend(v7, "contentHeightForBounds:", x, y, width, height);
  double v9 = v8;

  return v9;
}

- (double)preferredVerticalMargin
{
  v2 = [(SBFloatingDockViewController *)self dockView];
  [v2 interIconSpacing];
  double v4 = v3;

  return v4;
}

- (double)requestedVerticalMargin
{
  v2 = [(SBFloatingDockViewController *)self dockView];
  [v2 platterVerticalMargin];
  double v4 = v3;

  return v4;
}

- (void)setRequestedVerticalMargin:(double)a3
{
  id v4 = [(SBFloatingDockViewController *)self dockView];
  [v4 setPlatterVerticalMargin:a3];
}

- (double)minimumVerticalMarginForFrame:(CGRect)a3
{
  BSRectWithSize();
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v12 = [(SBFloatingDockViewController *)self dockView];
  objc_msgSend(v12, "platterShadowOutsetsForBounds:", v5, v7, v9, v11);
  double v14 = v13;

  return v14;
}

- (double)translationFromFullyPresentedFrame
{
  double v3 = [(SBFloatingDockViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  -[SBFloatingDockViewController contentHeightForFrame:](self, "contentHeightForFrame:");
  UICeilToViewScale();
  double v13 = v12;
  [(SBFloatingDockViewController *)self dockOffscreenProgress];
  double v15 = v14;
  double v16 = 0.0;
  if ((BSFloatIsZero() & 1) == 0)
  {
    -[SBFloatingDockViewController minimumVerticalMarginForFrame:](self, "minimumVerticalMarginForFrame:", v5, v7, v9, v11);
    double v16 = v15 * (v13 + v17);
  }

  return v16;
}

- (double)maximumDockContinuousCornerRadius
{
  v2 = [(SBFloatingDockViewController *)self dockView];
  [v2 maximumDockContinuousCornerRadius];
  double v4 = v3;

  return v4;
}

- (void)enumerateVisibleIconViewsUsingBlock:(id)a3
{
  id v4 = a3;
  double v5 = [(SBFloatingDockViewController *)self userIconListView];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __68__SBFloatingDockViewController_enumerateVisibleIconViewsUsingBlock___block_invoke;
  v7[3] = &unk_1E6AACE80;
  id v8 = v4;
  id v6 = v4;
  [v5 enumerateIconViewsUsingBlock:v7];
}

uint64_t __68__SBFloatingDockViewController_enumerateVisibleIconViewsUsingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)enumerateIconListViewsUsingBlock:(id)a3
{
  double v7 = (void (**)(id, void *))a3;
  id v4 = [(SBFloatingDockViewController *)self userIconListView];
  v7[2](v7, v4);

  double v5 = [(SBFloatingDockViewController *)self suggestionsViewController];
  id v6 = [v5 listView];

  if (v6) {
    v7[2](v7, v6);
  }
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (void)setLegibilitySettings:(id)a3
{
  id v5 = a3;
  if (([v5 isEqual:self->_legibilitySettings] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_legibilitySettings, a3);
    id v6 = [(SBFloatingDockViewController *)self folderPresentingViewController];
    double v7 = [v6 presentedFolderController];
    [v7 setLegibilitySettings:v5];

    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __54__SBFloatingDockViewController_setLegibilitySettings___block_invoke;
    v8[3] = &unk_1E6AB47D0;
    id v9 = v5;
    [(SBFloatingDockViewController *)self enumerateIconListViewsUsingBlock:v8];
  }
}

uint64_t __54__SBFloatingDockViewController_setLegibilitySettings___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setLegibilitySettings:*(void *)(a1 + 32)];
}

- (BOOL)isPresentingFolder
{
  double v3 = [(SBFloatingDockViewController *)self presentedFolderController];
  if (v3)
  {
    id v4 = [(SBFloatingDockViewController *)self presentedFolderController];
    char v5 = [v4 isOpen];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (SBFolderController)presentedFolderController
{
  v2 = [(SBFloatingDockViewController *)self folderPresentingViewController];
  double v3 = [v2 presentedFolderController];

  return (SBFolderController *)v3;
}

- (BOOL)isEditing
{
  v2 = [(SBFloatingDockViewController *)self dockView];
  char v3 = [v2 isEditing];

  return v3;
}

- (void)setEditing:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(SBFloatingDockViewController *)self dockView];
  [v4 setEditing:v3];
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  id v6 = [(SBFloatingDockViewController *)self dockView];
  [v6 setEditing:v5 animated:v4];
}

- (CGSize)maximumEditingIconSize
{
  v2 = [(SBFloatingDockViewController *)self dockView];
  [v2 maximumEditingIconSize];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.double height = v8;
  result.double width = v7;
  return result;
}

- (void)setMaximumEditingIconSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v5 = [(SBFloatingDockViewController *)self dockView];
  objc_msgSend(v5, "setMaximumEditingIconSize:", width, height);
}

- (void)setSuppressesEditingStateForListViews:(BOOL)a3
{
  if (self->_suppressesEditingStateForListViews != a3)
  {
    self->_suppressesEditingStateForListViews = a3;
    [(SBFloatingDockViewController *)self _updateEditingStateAnimated:1];
  }
}

- (void)setListLayoutProvider:(id)a3
{
}

- (void)setListLayoutProvider:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  double v7 = (SBIconListLayoutProvider *)a3;
  if (self->_listLayoutProvider != v7)
  {
    objc_storeStrong((id *)&self->_listLayoutProvider, a3);
    uint64_t v9 = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    double v11 = __63__SBFloatingDockViewController_setListLayoutProvider_animated___block_invoke;
    double v12 = &unk_1E6AB51B8;
    double v8 = v7;
    double v13 = v8;
    BOOL v14 = v4;
    [(SBFloatingDockViewController *)self enumerateIconListsUsingBlock:&v9];
    -[SBIconView setListLayoutProvider:animated:](self->_libraryPodIconView, "setListLayoutProvider:animated:", v8, v4, v9, v10, v11, v12);
    [(SBFloatingDockViewController *)self _resizeDockForChangedNumberOfIconsAnimated:v4];
  }
}

uint64_t __63__SBFloatingDockViewController_setListLayoutProvider_animated___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setLayoutProvider:*(void *)(a1 + 32) animated:*(unsigned __int8 *)(a1 + 40)];
}

- (NSString)description
{
  return (NSString *)[(SBFloatingDockViewController *)self descriptionWithMultilinePrefix:0];
}

- (CGRect)floatingDockScreenFrame
{
  double v3 = [(SBFloatingDockViewController *)self dockView];
  BOOL v4 = [v3 window];
  id v5 = [v4 windowScene];
  double v6 = [v5 screen];

  if (v6)
  {
    [v3 platterFrame];
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    [(SBFloatingDockViewController *)self translationFromFullyPresentedFrame];
    CGFloat v16 = v15;
    v34.origin.double x = v8;
    v34.origin.double y = v10;
    v34.size.double width = v12;
    v34.size.double height = v14;
    CGRect v35 = CGRectOffset(v34, 0.0, v16);
    double x = v35.origin.x;
    double y = v35.origin.y;
    double width = v35.size.width;
    double height = v35.size.height;
    CGAffineTransform v21 = [v6 fixedCoordinateSpace];
    objc_msgSend(v3, "convertRect:toCoordinateSpace:", v21, x, y, width, height);
    double v23 = v22;
    double v25 = v24;
    double v27 = v26;
    double v29 = v28;
  }
  else
  {
    double v23 = *MEMORY[0x1E4F1DB28];
    double v25 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v27 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v29 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }

  double v30 = v23;
  double v31 = v25;
  double v32 = v27;
  double v33 = v29;
  result.size.double height = v33;
  result.size.double width = v32;
  result.origin.double y = v31;
  result.origin.double x = v30;
  return result;
}

- (CGRect)floatingDockScreenPresentationFrame
{
  double v3 = [(SBFloatingDockViewController *)self dockView];
  BOOL v4 = [v3 window];
  id v5 = [v4 windowScene];
  double v6 = [v5 screen];

  if (v6)
  {
    [v3 platterFrame];
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    [(SBFloatingDockViewController *)self translationFromFullyPresentedFrame];
    CGFloat v16 = v15;
    v45.origin.double x = v8;
    v45.origin.double y = v10;
    v45.size.double width = v12;
    v45.size.double height = v14;
    CGRect v46 = CGRectOffset(v45, 0.0, v16);
    double x = v46.origin.x;
    double y = v46.origin.y;
    double width = v46.size.width;
    double height = v46.size.height;
    CGAffineTransform v21 = [v3 layer];
    double v22 = [v3 layer];
    double v23 = [v22 presentationLayer];
    objc_msgSend(v21, "convertRect:fromLayer:", v23, x, y, width, height);
    double v25 = v24;
    double v27 = v26;
    double v29 = v28;
    double v31 = v30;

    double v32 = [v6 fixedCoordinateSpace];
    objc_msgSend(v3, "convertRect:toCoordinateSpace:", v32, v25, v27, v29, v31);
    double v34 = v33;
    double v36 = v35;
    double v38 = v37;
    double v40 = v39;
  }
  else
  {
    double v34 = *MEMORY[0x1E4F1DB28];
    double v36 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v38 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v40 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }

  double v41 = v34;
  double v42 = v36;
  double v43 = v38;
  double v44 = v40;
  result.size.double height = v44;
  result.size.double width = v43;
  result.origin.double y = v42;
  result.origin.double x = v41;
  return result;
}

- (void)dockViewWillBecomeVisible
{
  [(SBFloatingDockViewController *)self _updateLibraryPodIconComponentVisibility];
  double v3 = [(SBFloatingDockViewController *)self dockView];
  [v3 setHidden:0];

  [(SBFloatingDockViewController *)self enumerateVisibleIconViewsUsingBlock:&__block_literal_global_73];
  id v4 = [(SBFloatingDockViewController *)self suggestionsViewController];
  [v4 dockViewWillBecomeVisible];
}

uint64_t __57__SBFloatingDockViewController_dockViewWillBecomeVisible__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setPaused:0 forReason:4];
}

- (void)dockViewWillResignVisible
{
  [(SBFloatingDockViewController *)self enumerateVisibleIconViewsUsingBlock:&__block_literal_global_59];
  id v3 = [(SBFloatingDockViewController *)self suggestionsViewController];
  [v3 dockViewWillResignVisible];
}

uint64_t __57__SBFloatingDockViewController_dockViewWillResignVisible__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setPaused:1 forReason:4];
}

- (void)dockViewDidResignVisible
{
  id v3 = [(SBFloatingDockViewController *)self suggestionsViewController];
  [v3 dockViewDidResignVisible];

  id v7 = [(SBFloatingDockViewController *)self dockView];
  id v4 = [v7 window];
  id v5 = objc_msgSend(v4, "sb_coronaAnimationController");
  [v5 removeParticipant:self];

  [v7 setHidden:1];
  [(SBFloatingDockViewController *)self _updateLibraryPodIconComponentVisibility];
  double v6 = [MEMORY[0x1E4FB1790] focusSystemForEnvironment:v7];
  [v6 _focusEnvironmentWillDisappear:v7];
}

- (void)dockViewDidBecomeVisible
{
  id v3 = [(SBFloatingDockViewController *)self dockView];
  id v4 = [v3 window];
  id v5 = objc_msgSend(v4, "sb_coronaAnimationController");
  [v5 addParticipant:self];

  id v6 = [(SBFloatingDockViewController *)self suggestionsViewController];
  [v6 dockViewDidBecomeVisible];
}

- (void)layoutUserControlledIconListsWithAnimationType:(int64_t)a3 forceRelayout:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = [(SBFloatingDockViewController *)self userIconListView];
  id v9 = v7;
  if (v4)
  {
    [v7 setIconsNeedLayout];
    id v7 = v9;
  }
  [v7 layoutIconsIfNeededWithAnimationType:a3 options:0];
  CGFloat v8 = [(SBFloatingDockViewController *)self presentedFolderController];
  [v8 layoutIconListsWithAnimationType:a3 forceRelayout:v4];
}

- (void)enumerateIconListsUsingBlock:(id)a3
{
  BOOL v4 = (void (**)(id, id))a3;
  id v6 = [(SBFloatingDockViewController *)self userIconListView];
  v4[2](v4, v6);
  id v5 = [(SBFloatingDockViewController *)self recentIconListView];
  v4[2](v4, v5);
}

- (BOOL)isDisplayingIcon:(id)a3
{
  id v4 = a3;
  id v5 = [(SBFloatingDockViewController *)self userIconLocation];
  BOOL v6 = [(SBFloatingDockViewController *)self isDisplayingIcon:v4 inLocation:v5];

  if (v6)
  {
    BOOL v7 = 1;
  }
  else
  {
    CGFloat v8 = [(SBFloatingDockViewController *)self suggestionsIconLocation];
    BOOL v7 = v8
      && [(SBFloatingDockViewController *)self isDisplayingIcon:v4 inLocation:v8];
  }
  return v7;
}

- (BOOL)isDisplayingIconView:(id)a3
{
  id v4 = a3;
  id v5 = [(SBFloatingDockViewController *)self userIconListView];
  if ([v5 isDisplayingIconView:v4])
  {
    char v6 = 1;
  }
  else
  {
    BOOL v7 = [(SBFloatingDockViewController *)self suggestionsViewController];
    CGFloat v8 = [v7 listView];

    char v6 = [v8 isDisplayingIconView:v4];
  }

  return v6;
}

- (BOOL)isDisplayingIconView:(id)a3 inLocation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  CGFloat v8 = [(SBFloatingDockViewController *)self userIconLocation];
  int v9 = [v7 isEqualToString:v8];

  if (v9)
  {
    CGFloat v10 = [(SBFloatingDockViewController *)self userIconListView];
    double v11 = v10;
LABEL_5:
    char v15 = [v10 isDisplayingIconView:v6];
    goto LABEL_6;
  }
  CGFloat v12 = [(SBFloatingDockViewController *)self suggestionsIconLocation];
  int v13 = [v7 isEqualToString:v12];

  if (v13)
  {
    CGFloat v14 = [(SBFloatingDockViewController *)self suggestionsViewController];
    double v11 = [v14 listView];

    CGFloat v10 = v11;
    goto LABEL_5;
  }
  if (!self->_libraryPodIconView
    || ![(SBFloatingDockViewController *)self isLibraryPodIconEffectivelyVisible])
  {
    BOOL v16 = 0;
    goto LABEL_7;
  }
  double v11 = [(SBIconView *)self->_libraryPodIconView location];
  char v15 = [v7 isEqualToString:v11];
LABEL_6:
  BOOL v16 = v15;

LABEL_7:
  return v16;
}

- (void)enumerateDisplayedIconViewsUsingBlock:(id)a3
{
  id v4 = a3;
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  char v11 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __70__SBFloatingDockViewController_enumerateDisplayedIconViewsUsingBlock___block_invoke;
  v7[3] = &unk_1E6AB5200;
  int v9 = v10;
  id v5 = v4;
  id v8 = v5;
  [(SBFloatingDockViewController *)self enumerateIconListViewsUsingBlock:v7];
  if (self->_libraryPodIconView
    && [(SBFloatingDockViewController *)self isLibraryPodIconEffectivelyVisible])
  {
    char v6 = 0;
    (*((void (**)(id, SBIconView *, char *))v5 + 2))(v5, self->_libraryPodIconView, &v6);
  }

  _Block_object_dispose(v10, 8);
}

void __70__SBFloatingDockViewController_enumerateDisplayedIconViewsUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __70__SBFloatingDockViewController_enumerateDisplayedIconViewsUsingBlock___block_invoke_2;
    v6[3] = &unk_1E6AAE5A8;
    id v4 = *(id *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    id v7 = v4;
    uint64_t v8 = v5;
    [a2 enumerateIconViewsUsingBlock:v6];
  }
}

uint64_t __70__SBFloatingDockViewController_enumerateDisplayedIconViewsUsingBlock___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  char v7 = 0;
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  if (v7)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (void)enumerateDisplayedIconViewsForIcon:(id)a3 usingBlock:(id)a4
{
  id v13 = a3;
  char v6 = (void (**)(id, void *))a4;
  char v7 = [(SBFloatingDockViewController *)self userIconListView];
  uint64_t v8 = [v7 displayedIconViewForIcon:v13];

  if (v8) {
    v6[2](v6, v8);
  }
  int v9 = [(SBFloatingDockViewController *)self suggestionsViewController];
  CGFloat v10 = [v9 listView];
  char v11 = [v10 displayedIconViewForIcon:v13];

  if (v11) {
    v6[2](v6, v11);
  }
  if (self->_libraryPodIconView)
  {
    if ([(SBFloatingDockViewController *)self isLibraryPodIconEffectivelyVisible])
    {
      id v12 = [(SBIconView *)self->_libraryPodIconView icon];

      if (v12 == v13) {
        v6[2](v6, self->_libraryPodIconView);
      }
    }
  }
}

- (void)prepareForTransitionToStyleConfiguration:(id)a3 fromDockVisible:(BOOL)a4 toDockVisible:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  [(SBFloatingDockViewController *)self setTransitioningUnderlyingPresentationStyleConfiguration:1];
  [(SBFloatingDockViewController *)self setTransitionTargetUnderlyingPresentationStyleConfiguration:v8];
  if (v6 && v5)
  {
    int v9 = (void *)MEMORY[0x1E4FB1EB0];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __103__SBFloatingDockViewController_prepareForTransitionToStyleConfiguration_fromDockVisible_toDockVisible___block_invoke;
    v14[3] = &unk_1E6AACA90;
    v14[4] = self;
    CGFloat v10 = &v15;
    id v15 = v8;
    [v9 animateWithDuration:v14 animations:0.3];
LABEL_7:

    goto LABEL_8;
  }
  if (v5 && !v6)
  {
    char v11 = (void *)MEMORY[0x1E4FB1EB0];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __103__SBFloatingDockViewController_prepareForTransitionToStyleConfiguration_fromDockVisible_toDockVisible___block_invoke_2;
    v12[3] = &unk_1E6AACA90;
    v12[4] = self;
    CGFloat v10 = &v13;
    id v13 = v8;
    [v11 performWithoutAnimation:v12];
    goto LABEL_7;
  }
LABEL_8:
}

uint64_t __103__SBFloatingDockViewController_prepareForTransitionToStyleConfiguration_fromDockVisible_toDockVisible___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateDockForStyleConfiguration:*(void *)(a1 + 40)];
}

uint64_t __103__SBFloatingDockViewController_prepareForTransitionToStyleConfiguration_fromDockVisible_toDockVisible___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateDockForStyleConfiguration:*(void *)(a1 + 40)];
}

- (void)cleanUpAfterUnderlyingBackgroundStyleTransition
{
  id v3 = [(SBFloatingDockViewController *)self transitionTargetUnderlyingPresentationStyleConfiguration];
  [(SBFloatingDockViewController *)self setTransitioningUnderlyingPresentationStyleConfiguration:0];
  [(SBFloatingDockViewController *)self setUnderlyingPresentationStyleConfiguration:v3];
  [(SBFloatingDockViewController *)self _updateDockForStyleConfiguration:v3];
}

- (void)setDockOffscreenProgress:(double)a3
{
  if (self->_dockOffscreenProgress != a3)
  {
    self->_dockOffscreenProgress = a3;
    id v4 = [(SBFloatingDockViewController *)self viewIfLoaded];
    [v4 setNeedsLayout];

    id v5 = [(SBFloatingDockViewController *)self viewIfLoaded];
    [v5 layoutIfNeeded];
  }
}

- (id)iconViewForIcon:(id)a3 location:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SBFloatingDockViewController *)self suggestionsIconLocation];
  if (v8 && [v7 isEqualToString:v8])
  {
    int v9 = [(SBFloatingDockViewController *)self suggestionsViewController];
    uint64_t v10 = [v9 iconViewForIcon:v6 location:v7];
LABEL_7:
    BOOL v16 = (void *)v10;

    goto LABEL_9;
  }
  char v11 = [(SBFloatingDockViewController *)self userIconLocation];
  int v12 = [v7 isEqualToString:v11];

  if (v12)
  {
    id v13 = [(SBFloatingDockViewController *)self userIconListView];
    CGFloat v14 = [v13 model];
    int v15 = [v14 directlyContainsIcon:v6];

    if (v15)
    {
      int v9 = [(SBFloatingDockViewController *)self userIconListView];
      uint64_t v10 = [v9 displayedIconViewForIcon:v6];
      goto LABEL_7;
    }
  }
  BOOL v16 = 0;
LABEL_9:

  return v16;
}

- (id)firstIconViewForIcon:(id)a3 inLocations:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = a4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = -[SBFloatingDockViewController iconViewForIcon:location:](self, "iconViewForIcon:location:", v6, *(void *)(*((void *)&v15 + 1) + 8 * i), (void)v15);
        if (v12)
        {
          id v13 = (void *)v12;
          goto LABEL_11;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  id v13 = 0;
LABEL_11:

  return v13;
}

- (id)firstIconViewForIcon:(id)a3
{
  id v4 = a3;
  id v5 = [(SBFloatingDockViewController *)self presentedIconLocations];
  id v6 = [v5 allObjects];
  id v7 = [(SBFloatingDockViewController *)self firstIconViewForIcon:v4 inLocations:v6];

  return v7;
}

- (id)firstIconViewForIcon:(id)a3 excludingLocations:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(SBFloatingDockViewController *)self presentedIconLocations];
  uint64_t v9 = (void *)[v8 mutableCopy];

  [v9 minusSet:v6];
  uint64_t v10 = [v9 allObjects];
  char v11 = [(SBFloatingDockViewController *)self firstIconViewForIcon:v7 inLocations:v10];

  return v11;
}

- (id)firstIconViewForIcon:(id)a3 options:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [(SBFloatingDockViewController *)self userIconListView];
  uint64_t v8 = [v7 displayedIconViewForIcon:v6];

  if (!v8)
  {
    if ((a4 & 0x40) != 0)
    {
      uint64_t v8 = 0;
    }
    else
    {
      uint64_t v9 = [(SBFloatingDockViewController *)self suggestionsViewController];
      uint64_t v8 = SBIconViewQueryingFirstIconViewForIcon(v9, v6, a4);
    }
  }

  return v8;
}

- (BOOL)isDisplayingIcon:(id)a3 inLocation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(SBFloatingDockViewController *)self suggestionsIconLocation];
  if (v8 && [v7 isEqualToString:v8])
  {
    uint64_t v9 = [(SBFloatingDockViewController *)self suggestionsViewController];
    char v10 = [v9 isDisplayingIcon:v6 inLocation:v7];
  }
  else
  {
    char v11 = [(SBFloatingDockViewController *)self userIconLocation];
    int v12 = [v7 isEqualToString:v11];

    if (!v12)
    {
      char v10 = 0;
      goto LABEL_8;
    }
    uint64_t v9 = [(SBFloatingDockViewController *)self userIconListView];
    id v13 = [v9 model];
    char v10 = [v13 directlyContainsIcon:v6];
  }
LABEL_8:

  return v10;
}

- (BOOL)isDisplayingIcon:(id)a3 inLocations:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = a4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        if (-[SBFloatingDockViewController isDisplayingIcon:inLocation:](self, "isDisplayingIcon:inLocation:", v6, *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14))
        {
          BOOL v12 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  BOOL v12 = 0;
LABEL_11:

  return v12;
}

- (void)_addDockGestureRecognizer:(id)a3
{
}

- (void)_setPaddingEdgeInsets:(UIEdgeInsets)a3
{
}

- (void)_rebuildUserIconListView
{
  id v11 = [(SBFloatingDockViewController *)self dockViewIfExists];
  if (v11)
  {
    id v3 = [(SBFloatingDockViewController *)self iconManager];
    id v4 = [(SBFloatingDockViewController *)self dockListModel];
    id v5 = [SBFloatingDockIconListView alloc];
    id v6 = [v3 listLayoutProvider];
    id v7 = [(SBFloatingDockViewController *)self userIconLocation];
    uint64_t v8 = [(SBDockIconListView *)v5 initWithModel:v4 layoutProvider:v6 iconLocation:v7 orientation:1 iconViewProvider:self];

    [(SBIconListView *)v8 setIconViewConfigurationOptions:2];
    [(SBIconListView *)v8 setDragDelegate:self];
    uint64_t v9 = [v3 iconImageCache];
    [(SBIconListView *)v8 setIconImageCache:v9];

    uint64_t v10 = [v3 folderIconImageCache];
    [(SBIconListView *)v8 setFolderIconImageCache:v10];

    [(SBIconListView *)v8 setAutomaticallyAdjustsLayoutMetricsToFit:0];
    [(SBIconListView *)v8 addLayoutObserver:self];
    [v11 setUserIconListView:v8];
  }
}

- (void)_rebuildAfterIconModelChange
{
  id v6 = [(SBFloatingDockViewController *)self iconManager];
  id v3 = [v6 iconModel];
  id v4 = [v3 rootFolder];
  id v5 = [v4 dock];

  [v5 addListObserver:self];
  [(SBFloatingDockViewController *)self setDockListModel:v5];
  [(SBFloatingDockViewController *)self _rebuildUserIconListView];
  [(SBFloatingDockViewController *)self _rebuildLibraryPodIcon];
  [(SBFloatingDockViewController *)self _resizeDockForChangedNumberOfIconsAnimated:0];
}

- (void)_updateLibraryPodDockAccessoryViewDisplayed
{
  id v7 = [(SBFloatingDockViewController *)self dockView];
  BOOL v3 = [(SBFloatingDockViewController *)self isLibraryPodIconEnabled];
  id v4 = [v7 accessoryIconView];

  if (!v3 || v4)
  {
    if (v4) {
      char v6 = v3;
    }
    else {
      char v6 = 1;
    }
    if ((v6 & 1) == 0) {
      [v7 setAccessoryIconView:0];
    }
  }
  else
  {
    id v5 = [(SBFloatingDockViewController *)self libraryPodIconView];
    [v7 setAccessoryIconView:v5];
  }
  objc_msgSend(v7, "setAccessoryIconViewVisible:", -[SBFloatingDockViewController isLibraryPodIconVisible](self, "isLibraryPodIconVisible"));
}

- (BOOL)_shouldOpenFolderIcon:(id)a3
{
  id v4 = a3;
  id v5 = [(SBFloatingDockViewController *)self userIconListView];
  char v6 = [v5 model];
  char v7 = [v6 directlyContainsIcon:v4];

  return v7;
}

- (void)_resizeDockForChangedNumberOfIconsAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  resizeRunLoopObserver = self->_resizeRunLoopObserver;
  if (resizeRunLoopObserver)
  {
    CFRunLoopObserverInvalidate(resizeRunLoopObserver);
    CFRelease(self->_resizeRunLoopObserver);
    self->_resizeRunLoopObserver = 0;
  }
  char v6 = [(SBFloatingDockViewController *)self userIconListView];
  [v6 layoutIconsIfNeededWithAnimationType:0 options:0];
  [(SBFloatingDockViewController *)self _updateLibraryPodDockAccessoryViewDisplayed];
  char v7 = [(SBFloatingDockViewController *)self dockView];
  [v7 setNeedsLayout];
  [v7 contentHeight];
  uint64_t v9 = v8;
  [v7 frame];
  long long v14 = (void *)MEMORY[0x1E4FB1EB0];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __75__SBFloatingDockViewController__resizeDockForChangedNumberOfIconsAnimated___block_invoke;
  v17[3] = &unk_1E6AB5228;
  id v18 = v7;
  uint64_t v19 = self;
  if (v3) {
    double v15 = 0.3;
  }
  else {
    double v15 = 0.0;
  }
  uint64_t v20 = v9;
  uint64_t v21 = v10;
  uint64_t v22 = v11;
  uint64_t v23 = v12;
  uint64_t v24 = v13;
  id v16 = v7;
  [v14 animateWithDuration:2 delay:v17 options:0 animations:v15 completion:0.0];
}

void __75__SBFloatingDockViewController__resizeDockForChangedNumberOfIconsAnimated___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) layoutIfNeeded];
  [*(id *)(a1 + 32) contentHeight];
  double v3 = v2;
  id v6 = [*(id *)(a1 + 40) delegate];
  if (*(double *)(a1 + 48) != v3)
  {
    id v4 = [*(id *)(a1 + 40) iconManager];
    [v4 noteFloatingDockWillChangeHeight];
    [v4 noteFloatingDockWillAnimateChangeInHeight];
    [v6 floatingDockViewController:*(void *)(a1 + 40) didChangeContentHeight:v3];
  }
  [*(id *)(a1 + 32) frame];
  if ((BSRectEqualToRect() & 1) == 0)
  {
    id v5 = *(void **)(a1 + 40);
    [v5 floatingDockScreenFrame];
    objc_msgSend(v6, "floatingDockViewController:didChangeContentFrame:", v5);
  }
}

- (void)_coalesceRequestsToResizeDockForChangedNumberOfIcons
{
  if (!self->_resizeRunLoopObserver)
  {
    objc_initWeak(&location, self);
    CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __84__SBFloatingDockViewController__coalesceRequestsToResizeDockForChangedNumberOfIcons__block_invoke;
    v5[3] = &unk_1E6AAD210;
    objc_copyWeak(&v6, &location);
    self->_resizeRunLoopObserver = CFRunLoopObserverCreateWithHandler(v3, 0xA0uLL, 0, 0, v5);
    Main = CFRunLoopGetMain();
    CFRunLoopAddObserver(Main, self->_resizeRunLoopObserver, (CFRunLoopMode)*MEMORY[0x1E4F1D410]);
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

void __84__SBFloatingDockViewController__coalesceRequestsToResizeDockForChangedNumberOfIcons__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _resizeDockForChangedNumberOfIconsAnimated:1];
}

- (BOOL)_isInAppToAppTransition
{
  double v2 = self;
  CFAllocatorRef v3 = [(SBFloatingDockViewController *)self delegate];
  LOBYTE(v2) = [v3 isFloatingDockViewControllerPresentedOverTransitioningAppToAppContent:v2];

  return (char)v2;
}

- (BOOL)_isInSwitcherTransition
{
  double v2 = self;
  CFAllocatorRef v3 = [(SBFloatingDockViewController *)self delegate];
  LOBYTE(v2) = [v3 isFloatingDockViewControllerPresentedOverTransitioningSwitcherContent:v2];

  return (char)v2;
}

- (BOOL)_isLibraryContainedInForeground
{
  double v2 = [(SBFloatingDockViewController *)self libraryPresenter];
  char v3 = [v2 isLibraryContainedInForeground];

  return v3;
}

- (unint64_t)_backgroundEffectForPresentedFolder
{
  double v2 = [(SBFloatingDockViewController *)self underlyingPresentationStyleConfiguration];
  unint64_t v3 = [v2 backgroundEffect];

  return v3;
}

- (unint64_t)_platterEffectForPresentedFolder
{
  double v2 = [(SBFloatingDockViewController *)self underlyingPresentationStyleConfiguration];
  unint64_t v3 = [v2 platterEffect];

  return v3;
}

- (unint64_t)_currentFolderIconBackgroundStyle
{
  double v2 = [(SBFloatingDockViewController *)self underlyingPresentationStyleConfiguration];
  unint64_t v3 = [v2 folderIconBackgroundStyle];

  return v3;
}

- (void)_updateDockForStyleConfiguration:(id)a3
{
  id v4 = a3;
  [(SBFloatingDockViewController *)self _updateFolderIconBackgroundsForStyleConfiguration:v4];
  [(SBFloatingDockViewController *)self _updatePresentedFolderBackgroundForStyleConfiguration:v4];
  [(SBFloatingDockViewController *)self _updatePlatterShadowForStyleConfiguration:v4];

  BOOL v5 = [(SBFloatingDockViewController *)self wantsFastIconReordering];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __65__SBFloatingDockViewController__updateDockForStyleConfiguration___block_invoke;
  v6[3] = &__block_descriptor_33_e24_v16__0__SBIconListView_8l;
  BOOL v7 = v5;
  [(SBFloatingDockViewController *)self enumerateIconListViewsUsingBlock:v6];
}

uint64_t __65__SBFloatingDockViewController__updateDockForStyleConfiguration___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setWantsFastIconReordering:*(unsigned __int8 *)(a1 + 32)];
}

- (void)_updateLibraryPodIconComponentVisibility
{
  if ([(SBFloatingDockViewController *)self isPresentingLibrary])
  {
    BOOL v3 = [(SBFloatingDockViewController *)self isPresentingLibraryInForeground];
    [(SBFloatingDockViewController *)self setLibraryPodIconVisible:v3 ^ 1 animated:v3];
    id v4 = self->_libraryIconViewController;
    BOOL v5 = [(SBHLibraryIconViewController *)v4 categoryStackView];
    id v6 = v5;
    if (v3) {
      double v7 = 0.0;
    }
    else {
      double v7 = 1.0;
    }
    if (v3) {
      double v8 = 1.0;
    }
    else {
      double v8 = 0.0;
    }
    [v5 setAlpha:v7];

    id v9 = [(SBHLibraryIconViewController *)v4 dismissalView];

    [v9 setAlpha:v8];
  }
}

- (void)_updateFolderIconBackgroundsForStyleConfiguration:(id)a3
{
  uint64_t v4 = [a3 folderIconBackgroundStyle];
  BOOL v5 = [(SBFloatingDockViewController *)self userIconListView];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __82__SBFloatingDockViewController__updateFolderIconBackgroundsForStyleConfiguration___block_invoke;
  v6[3] = &__block_descriptor_40_e27_v32__0__SBIconView_8Q16_B24l;
  void v6[4] = v4;
  [v5 enumerateIconViewsUsingBlock:v6];
}

void __82__SBFloatingDockViewController__updateFolderIconBackgroundsForStyleConfiguration___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  BOOL v3 = [v5 icon];
  int v4 = [v3 isFolderIcon];

  if (v4) {
    [v5 setFolderBackgroundStyle:*(void *)(a1 + 32)];
  }
}

- (void)_updatePresentedFolderBackgroundForStyleConfiguration:(id)a3
{
  id v4 = [(SBFloatingDockViewController *)self folderPresentingViewController];
  objc_msgSend(v4, "setBackgroundEffect:", -[SBFloatingDockViewController _backgroundEffectForPresentedFolder](self, "_backgroundEffectForPresentedFolder"));
}

- (void)_updatePlatterShadowForStyleConfiguration:(id)a3
{
  uint64_t v4 = [a3 wantsPlatterShadow];
  id v5 = [(SBFloatingDockViewController *)self dockView];
  [v5 setHasPlatterShadow:v4];
}

- (id)_backdropGroupName
{
  BOOL v3 = objc_msgSend(NSString, "stringWithFormat:", @"-%p", self);
  uint64_t v4 = [@"SBFloatingDockViewControllerBackdropGroupName" stringByAppendingString:v3];
  if ([(SBFloatingDockViewController *)self _backgroundUserInterfaceStyle] == 2) {
    id v5 = @"-Dark";
  }
  else {
    id v5 = @"-Light";
  }
  id v6 = [v4 stringByAppendingString:v5];

  return v6;
}

- (id)_backdropGroupNamespace
{
  return (id)*MEMORY[0x1E4F39DA0];
}

- (int64_t)_backgroundUserInterfaceStyle
{
  double v2 = [(SBFloatingDockViewController *)self traitCollection];
  int64_t v3 = objc_msgSend(MEMORY[0x1E4FB1E20], "sbh_materialUserInterfaceStyleFromTraitCollection:", v2);

  return v3;
}

- (void)_updateViewBackdropGroupName
{
  int64_t v3 = [(SBFloatingDockViewController *)self _backgroundUserInterfaceStyle];
  uint64_t v4 = [(SBFloatingDockViewController *)self dockView];
  [v4 setOverrideUserInterfaceStyle:v3];

  id v8 = [(SBFloatingDockViewController *)self _backdropGroupName];
  id v5 = [(SBHLibraryIconViewController *)self->_libraryIconViewController categoryStackView];
  [v5 setBackdropGroupName:v8];

  id v6 = [(SBFloatingDockViewController *)self dockView];
  double v7 = [v6 mainPlatterView];
  [v7 setBackdropGroupName:v8];
}

- (void)iconModelDidLayout:(id)a3
{
  id v4 = a3;
  id v7 = [(SBFloatingDockViewController *)self iconManager];
  id v5 = [v7 iconModel];
  id v6 = [v4 object];

  if (v5 == v6) {
    [(SBFloatingDockViewController *)self _rebuildAfterIconModelChange];
  }
}

- (void)iconEditingDidChange:(id)a3
{
}

- (void)_updateEditingStateAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v12 = [(SBFloatingDockViewController *)self delegate];
  if ((objc_opt_respondsToSelector() & 1) == 0
    || ([v12 isFloatingDockViewControllerPresentedOnExternalDisplay:self] & 1) == 0)
  {
    BOOL v5 = [(SBFloatingDockViewController *)self isEditing];
    if (v5) {
      uint64_t v6 = [(SBFloatingDockViewController *)self suppressesEditingStateForListViews] ^ 1;
    }
    else {
      uint64_t v6 = 0;
    }
    id v7 = [(SBFloatingDockViewController *)self userIconListView];
    [v7 setEditing:v6];
    [v7 updateEditingStateAnimated:v3];
    id v8 = [(SBFloatingDockViewController *)self dockView];
    id v9 = [v8 recentIconListView];

    [v9 setEditing:v6];
    [v9 updateEditingStateAnimated:v3];
    [(SBIconView *)self->_libraryPodIconView setEditing:v6 animated:v3];
    if ([(SBFloatingDockViewController *)self isPresentingFolder])
    {
      uint64_t v10 = [(SBFloatingDockViewController *)self folderPresentingViewController];
      uint64_t v11 = [v10 presentedFolderController];
      [v11 setEditing:v5 animated:v3];
    }
  }
}

- (void)iconDraggingDidChange:(id)a3
{
  id v4 = [(SBFloatingDockViewController *)self iconManager];
  unsigned int v5 = [v4 isIconDragging];

  uint64_t v6 = [(SBFloatingDockViewController *)self dockView];
  [v6 setMinimumUserIconSpaces:v5];

  [(SBFloatingDockViewController *)self _resizeDockForChangedNumberOfIconsAnimated:1];
  if ((v5 & 1) == 0)
  {
    bouncedDropSessions = self->_bouncedDropSessions;
    self->_bouncedDropSessions = 0;
  }
}

- (void)reduceTransparencyEnabledStateDidChange:(id)a3
{
  id v4 = [(SBFloatingDockViewController *)self folderPresentingViewController];
  objc_msgSend(v4, "setBackgroundEffect:", -[SBFloatingDockViewController _backgroundEffectForPresentedFolder](self, "_backgroundEffectForPresentedFolder"));

  id v7 = [(SBFloatingDockViewController *)self presentedFolderController];
  unsigned int v5 = self;
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    objc_msgSend(v7, "setBackgroundEffect:", -[SBFloatingDockViewController _platterEffectForPresentedFolder](self, "_platterEffectForPresentedFolder"));
  }
}

- (void)_sizeCategoryDidChange:(id)a3
{
  id v3 = [(SBFloatingDockViewController *)self userIconListView];
  [v3 removeAllIconViews];
  [v3 layoutIconsNow];
}

- (void)listLayoutProviderDidChange:(id)a3
{
  id v4 = [(SBFloatingDockViewController *)self iconManager];
  unsigned int v5 = [v4 listLayoutProvider];
  [(SBFloatingDockViewController *)self setListLayoutProvider:v5];
  uint64_t v6 = [v4 folderIconImageCache];
  id v7 = [v4 iconImageCache];
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  id v12 = __60__SBFloatingDockViewController_listLayoutProviderDidChange___block_invoke;
  uint64_t v13 = &unk_1E6AB5270;
  id v14 = v6;
  id v15 = v7;
  id v8 = v7;
  id v9 = v6;
  [(SBFloatingDockViewController *)self enumerateIconListsUsingBlock:&v10];
  -[SBIconView setFolderIconImageCache:](self->_libraryPodIconView, "setFolderIconImageCache:", v9, v10, v11, v12, v13);
  [(SBIconView *)self->_libraryPodIconView setIconImageCache:v8];
}

void __60__SBFloatingDockViewController_listLayoutProviderDidChange___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setFolderIconImageCache:v3];
  [v4 setIconImageCache:*(void *)(a1 + 40)];
}

- (void)floatingDockViewMainPlatterDidChangeFrame:(id)a3
{
  id v4 = [(SBFloatingDockViewController *)self delegate];
  [(SBFloatingDockViewController *)self floatingDockScreenFrame];
  objc_msgSend(v4, "floatingDockViewController:didChangeContentFrame:", self);
}

- (void)coronaAnimationController:(id)a3 willAnimateCoronaTransitionWithAnimator:(id)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __98__SBFloatingDockViewController_coronaAnimationController_willAnimateCoronaTransitionWithAnimator___block_invoke;
  v4[3] = &unk_1E6AAC810;
  v4[4] = self;
  [a4 addAnimations:v4];
}

void __98__SBFloatingDockViewController_coronaAnimationController_willAnimateCoronaTransitionWithAnimator___block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) dockView];
  double v2 = (void *)MEMORY[0x1E4FB1EB0];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __98__SBFloatingDockViewController_coronaAnimationController_willAnimateCoronaTransitionWithAnimator___block_invoke_2;
  v4[3] = &unk_1E6AAC810;
  id v5 = v1;
  id v3 = v1;
  [v2 performWithoutAnimation:v4];
  objc_msgSend(v3, "pl_performCrossFadeIfNecessary");
}

uint64_t __98__SBFloatingDockViewController_coronaAnimationController_willAnimateCoronaTransitionWithAnimator___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setNeedsLayout];
  double v2 = *(void **)(a1 + 32);
  return [v2 layoutIfNeeded];
}

- (BOOL)iconListView:(id)a3 canHandleIconDropSession:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SBFloatingDockViewController *)self userIconListView];

  if (v8 == v6)
  {
    uint64_t v10 = [(SBFloatingDockViewController *)self iconManager];
    uint64_t v11 = [v10 iconDragManager];

    char v9 = [v11 canHandleIconDropSession:v7 inIconListView:v6];
    char v12 = [v11 canAcceptDropInSession:v7 inIconListView:v6];

    if (v12) {
      goto LABEL_9;
    }
  }
  else
  {
    char v9 = 0;
  }
  if ([(SBFloatingDockViewController *)self shouldIndicateImpossibleDrop]
    && ![(NSHashTable *)self->_bouncedDropSessions containsObject:v7])
  {
    uint64_t v13 = [(SBFloatingDockViewController *)self dockView];
    [v13 bounce];

    bouncedDropSessions = self->_bouncedDropSessions;
    if (!bouncedDropSessions)
    {
      id v15 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
      id v16 = self->_bouncedDropSessions;
      self->_bouncedDropSessions = v15;

      bouncedDropSessions = self->_bouncedDropSessions;
    }
    [(NSHashTable *)bouncedDropSessions addObject:v7];
  }
LABEL_9:

  return v9;
}

- (void)iconListView:(id)a3 iconDropSessionDidEnter:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id v7 = [(SBFloatingDockViewController *)self userIconListView];

  if (v7 == v10)
  {
    id v8 = [(SBFloatingDockViewController *)self iconManager];
    char v9 = [v8 iconDragManager];
    [v9 iconDropSessionDidEnter:v6 inIconListView:v10];
  }
}

- (id)iconListView:(id)a3 iconDropSessionDidUpdate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SBFloatingDockViewController *)self userIconListView];

  if (v8 == v6)
  {
    id v10 = [(SBFloatingDockViewController *)self iconManager];
    uint64_t v11 = [v10 iconDragManager];
    char v9 = [v11 iconDropSessionDidUpdate:v7 inIconListView:v6];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (void)iconListView:(id)a3 iconDropSessionDidExit:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id v7 = [(SBFloatingDockViewController *)self userIconListView];

  if (v7 == v10)
  {
    id v8 = [(SBFloatingDockViewController *)self iconManager];
    char v9 = [v8 iconDragManager];
    [v9 iconDropSessionDidExit:v6 fromIconListView:v10];
  }
}

- (void)iconListView:(id)a3 performIconDrop:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SBFloatingDockViewController *)self iconManager];
  char v9 = [v8 iconDragManager];
  [v9 performIconDrop:v6 inIconListView:v7];

  [(SBFloatingDockViewController *)self _resizeDockForChangedNumberOfIconsAnimated:1];
}

- (id)iconListView:(id)a3 iconViewForDroppingIconDragItem:(id)a4 proposedIconView:(id)a5
{
  id v5 = a5;
  return v5;
}

- (void)iconListView:(id)a3 willUseIconView:(id)a4 forDroppingIconDragItem:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v12 = [(SBFloatingDockViewController *)self iconManager];
  uint64_t v11 = [v12 iconDragManager];
  [v11 iconListView:v10 willUseIconView:v9 forDroppingIconDragItem:v8];
}

- (id)iconListView:(id)a3 previewForDroppingIconDragItem:(id)a4 proposedPreview:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = [(SBFloatingDockViewController *)self iconManager];
  id v12 = [v11 iconDragManager];
  uint64_t v13 = [v12 iconListView:v10 previewForDroppingIconDragItem:v9 proposedPreview:v8];

  return v13;
}

- (void)iconListView:(id)a3 iconDragItem:(id)a4 willAnimateDropWithAnimator:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v12 = [(SBFloatingDockViewController *)self iconManager];
  uint64_t v11 = [v12 iconDragManager];
  [v11 iconListView:v10 iconDragItem:v9 willAnimateDropWithAnimator:v8];
}

- (BOOL)iconListView:(id)a3 shouldAllowSpringLoadedInteractionForIconDropSession:(id)a4 onIconView:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = [(SBFloatingDockViewController *)self iconManager];
  id v10 = [v9 iconDragManager];
  char v11 = [v10 shouldAllowSpringLoadedInteractionForIconDropSession:v8 onIconView:v7];

  return v11;
}

- (void)iconListView:(id)a3 springLoadedInteractionForIconDragDidCompleteOnIconView:(id)a4
{
  id v5 = a4;
  id v7 = [(SBFloatingDockViewController *)self iconManager];
  id v6 = [v7 iconDragManager];
  [v6 performSpringLoadedInteractionForIconDragOnIconView:v5];
}

- (id)iconListView:(id)a3 customSpringAnimationBehaviorForDroppingItem:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SBFloatingDockViewController *)self iconManager];
  id v9 = [v8 iconDragManager];
  id v10 = [v9 iconListView:v7 customSpringAnimationBehaviorForDroppingItem:v6];

  return v10;
}

- (void)iconList:(id)a3 didAddIcon:(id)a4
{
  id v5 = a3;
  id v6 = [(SBFloatingDockViewController *)self dockListModel];

  if (v6 == v5)
  {
    [(SBFloatingDockViewController *)self _coalesceRequestsToResizeDockForChangedNumberOfIcons];
  }
}

- (void)iconList:(id)a3 didRemoveIcon:(id)a4
{
  id v5 = a3;
  id v6 = [(SBFloatingDockViewController *)self dockListModel];

  if (v6 == v5)
  {
    [(SBFloatingDockViewController *)self _coalesceRequestsToResizeDockForChangedNumberOfIcons];
  }
}

- (BOOL)isPresentingIconLocation:(id)a3
{
  id v4 = a3;
  id v5 = [(SBFloatingDockViewController *)self userIconLocation];
  char v6 = [v4 isEqualToString:v5];

  if (v6)
  {
    char v7 = 1;
  }
  else
  {
    id v8 = [(SBFloatingDockViewController *)self suggestionsViewController];
    char v7 = [v8 isPresentingIconLocation:v4];
  }
  return v7;
}

- (NSSet)presentedIconLocations
{
  id v3 = (void *)MEMORY[0x1E4F1CAD0];
  id v4 = [(SBFloatingDockViewController *)self userIconLocation];
  id v5 = [v3 setWithObject:v4];

  char v6 = [(SBFloatingDockViewController *)self suggestionsViewController];
  char v7 = [v6 presentedIconLocations];
  id v8 = [v5 setByAddingObjectsFromSet:v7];

  return (NSSet *)v8;
}

- (id)dequeueReusableIconViewOfClass:(Class)a3
{
  id v4 = [(SBFloatingDockViewController *)self iconViewProvider];
  id v5 = [v4 dequeueReusableIconViewOfClass:a3];

  return v5;
}

- (void)recycleIconView:(id)a3
{
  id v4 = a3;
  id v5 = [(SBFloatingDockViewController *)self iconViewProvider];
  [v5 recycleIconView:v4];
}

- (BOOL)isIconViewRecycled:(id)a3
{
  id v4 = a3;
  id v5 = [(SBFloatingDockViewController *)self iconViewProvider];
  char v6 = [v5 isIconViewRecycled:v4];

  return v6;
}

- (void)configureIconView:(id)a3 forIcon:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  char v7 = [(SBFloatingDockViewController *)self iconViewProvider];
  [v7 configureIconView:v9 forIcon:v6];

  id v8 = [v9 icon];
  LODWORD(v7) = [v8 isFolderIcon];

  if (v7) {
    objc_msgSend(v9, "setFolderBackgroundStyle:", -[SBFloatingDockViewController _currentFolderIconBackgroundStyle](self, "_currentFolderIconBackgroundStyle"));
  }
}

- (void)iconTouchBegan:(id)a3
{
}

- (void)icon:(id)a3 touchMoved:(id)a4
{
  id v5 = a4;
  id v26 = a3;
  UIEdgeInsetsMakeWithEdges();
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  [v26 bounds];
  CGFloat v15 = v9 + v14;
  CGFloat v17 = v7 + v16;
  CGFloat v19 = v18 - (v9 + v13);
  CGFloat v21 = v20 - (v7 + v11);
  [v5 locationInView:v26];
  CGFloat v23 = v22;
  CGFloat v25 = v24;

  v29.origin.double x = v15;
  v29.origin.double y = v17;
  v29.size.double width = v19;
  v29.size.double height = v21;
  v28.double x = v23;
  v28.double y = v25;
  objc_msgSend(v26, "setHighlighted:", CGRectContainsPoint(v29, v28));
}

- (void)icon:(id)a3 touchEnded:(BOOL)a4
{
}

- (void)iconTapped:(id)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  [(SBFloatingDockViewController *)self toggleLibraryPresentedAnimated:1 completion:0];
  id v4 = [(SBFloatingDockViewController *)self delegate];
  unsigned int v5 = [v4 isFloatingDockViewControllerPresentedOverApplication:self];
  uint64_t v11 = *MEMORY[0x1E4FA74D0];
  double v6 = [NSNumber numberWithUnsignedInteger:v5];
  v12[0] = v6;
  double v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
  double v8 = (void *)MEMORY[0x1E4FA5E78];
  id v9 = v7;
  double v10 = [v8 sharedInstance];
  [v10 emitEvent:53 withPayload:v9];
}

- (BOOL)iconViewCanBeginDrags:(id)a3
{
  return 0;
}

- (id)customImageViewControllerForIconView:(id)a3
{
  libraryIconViewController = self->_libraryIconViewController;
  if (!libraryIconViewController)
  {
    id v5 = a3;
    double v6 = [SBHLibraryIconViewController alloc];
    double v7 = [v5 listLayoutProvider];

    double v8 = [(SBHLibraryIconViewController *)v6 initWithListLayoutProvider:v7];
    id v9 = [(SBFloatingDockViewController *)self libraryViewController];
    double v10 = [v9 podFolderViewController];
    uint64_t v11 = [v10 dataSource];
    [(SBHLibraryIconViewController *)v8 setLibraryDataSource:v11];

    double v12 = [(SBHLibraryIconViewController *)v8 categoryStackView];
    double v13 = [(SBFloatingDockViewController *)self _backdropGroupName];
    [v12 setBackdropGroupName:v13];

    double v14 = [(SBFloatingDockViewController *)self _backdropGroupNamespace];
    [v12 setBackdropGroupNamespace:v14];

    CGFloat v15 = self->_libraryIconViewController;
    self->_libraryIconViewController = v8;

    libraryIconViewController = self->_libraryIconViewController;
  }
  return libraryIconViewController;
}

- (void)iconView:(id)a3 didChangeCustomImageViewController:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if (v6) {
    [(SBFloatingDockViewController *)self bs_removeChildViewController:v6];
  }
  double v7 = [v8 customIconImageViewController];
  if (v7) {
    [(SBFloatingDockViewController *)self bs_addChildViewController:v7];
  }
}

- (BOOL)iconViewCanBecomeFocused:(id)a3
{
  id v4 = a3;
  id v5 = [(SBFloatingDockViewController *)self iconManager];
  if (objc_opt_respondsToSelector()) {
    char v6 = [v5 iconViewCanBecomeFocused:v4];
  }
  else {
    char v6 = 1;
  }

  return v6;
}

- (unint64_t)focusEffectTypeForIconView:(id)a3
{
  return 1;
}

- (void)floatingDockSuggestionsViewControllerDidChangeNumberOfVisibleSuggestions:(id)a3
{
}

- (BOOL)isPresentingLibrary
{
  double v2 = [(SBFloatingDockViewController *)self libraryPresenter];
  char v3 = [v2 isPresentingLibrary];

  return v3;
}

- (BOOL)isPresentingLibraryInForeground
{
  BOOL v3 = [(SBFloatingDockViewController *)self isPresentingLibrary];
  if (v3)
  {
    LOBYTE(v3) = [(SBFloatingDockViewController *)self _isLibraryContainedInForeground];
  }
  return v3;
}

- (void)presentLibraryAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [(SBFloatingDockViewController *)self libraryPresenter];
  [v7 presentLibraryWithAnimation:v4 completion:v6];
}

- (void)dismissLibraryAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v7 = a4;
  if (v4
    && (![(SBFloatingDockViewController *)self _isLibraryContainedInForeground]
     || [(SBFloatingDockViewController *)self _isInAppToAppTransition]
     || [(SBFloatingDockViewController *)self _isInSwitcherTransition]))
  {
    id v6 = [(SBFloatingDockViewController *)self libraryPresenter];
    [v6 dismissLibraryWithTransition:2 completion:v7];
  }
  else
  {
    id v6 = [(SBFloatingDockViewController *)self libraryPresenter];
    [v6 dismissLibraryWithAnimation:v4 completion:v7];
  }
}

- (void)toggleLibraryPresentedAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [(SBFloatingDockViewController *)self libraryPresenter];
  [v7 toggleLibraryPresentedInForegroundWithAnimation:v4 completion:v6];
}

- (void)libraryViewController:(id)a3 dataSourceDidChange:(id)a4
{
}

- (BOOL)isDefaultContainerForegroundForPresenter:(id)a3
{
  BOOL v3 = self;
  BOOL v4 = [(SBFloatingDockViewController *)self delegate];
  LOBYTE(v3) = [v4 isDefaultLibraryContainerViewControllerForegroundForFloatingDockViewController:v3];

  return (char)v3;
}

- (id)containerViewControllerForPresentingInForeground:(id)a3
{
  BOOL v4 = [(SBFloatingDockViewController *)self delegate];
  id v5 = [v4 foregroundLibraryContainerViewControllerForFloatingDockViewController:self];

  return v5;
}

- (id)acquireOrderSourceContainerViewBeforeLibraryViewAssertionForReason:(id)a3
{
  id v4 = a3;
  id v5 = [(SBFloatingDockViewController *)self delegate];
  id v6 = [v5 floatingDockViewController:self acquireOrderFloatingDockContainerBeforeLibraryAssertionForReason:v4];

  return v6;
}

- (id)libraryIconViewForPresenter:(id)a3
{
  return self->_libraryPodIconView;
}

- (id)libraryIconViewControllerForPresenter:(id)a3
{
  return self->_libraryIconViewController;
}

- (void)libraryIndicatorIconView:(id)a3 didAcceptDropForSession:(id)a4
{
  id v5 = a4;
  id v7 = [(SBFloatingDockViewController *)self iconManager];
  id v6 = [v7 iconDragManager];
  [v6 noteDragItemWasConsumedExternallyForDropSession:v5];
}

- (void)handleSpringLoadDidActivateForLibraryIndicatorIconView:(id)a3
{
}

- (void)presentFolderForIcon:(id)a3 location:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  double v13 = [(SBFloatingDockViewController *)self currentFolderAnimator];
  double v14 = v13;
  if (v13)
  {
    CGFloat v15 = [v13 childViewController];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v16 = [v15 folder];
      CGFloat v17 = [v16 icon];
    }
    else
    {
      CGFloat v17 = 0;
    }
    if ([v10 isEqual:v17])
    {
      if (v12)
      {
        id v19 = [(SBFloatingDockViewController *)self currentExpandCompletions];
        if (!v19)
        {
          id v19 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          [(SBFloatingDockViewController *)self setCurrentExpandCompletions:v19];
        }
        double v20 = (void *)[v12 copy];
        CGFloat v21 = _Block_copy(v20);
        [v19 addObject:v21];
      }
      if ([v14 currentOperation] == 1) {
        [v14 reverse];
      }
    }
    else if (v12)
    {
      (*((void (**)(id, void))v12 + 2))(v12, 0);
    }
  }
  else
  {
    objc_initWeak(&location, self);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __82__SBFloatingDockViewController_presentFolderForIcon_location_animated_completion___block_invoke;
    aBlock[3] = &unk_1E6AB2790;
    objc_copyWeak(&v24, &location);
    id v23 = v12;
    double v18 = _Block_copy(aBlock);
    [(SBFloatingDockViewController *)self _presentFolderForIcon:v10 location:v11 animated:v7 completion:v18];

    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }
}

void __82__SBFloatingDockViewController_presentFolderForIcon_location_animated_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = [WeakRetained currentExpandCompletions];
  id v6 = [WeakRetained currentCollapseCompletions];
  [WeakRetained setCurrentExpandCompletions:0];
  [WeakRetained setCurrentCollapseCompletions:0];
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, uint64_t))(v7 + 16))(v7, a2);
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(v8);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v22 + 1) + 8 * i) + 16))();
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v10);
  }

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v13 = v6;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v19;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v19 != v16) {
          objc_enumerationMutation(v13);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v18 + 1) + 8 * j) + 16))(*(void *)(*((void *)&v18 + 1) + 8 * j));
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v15);
  }
}

- (void)dismissPresentedFolderAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  uint64_t v7 = [(SBFloatingDockViewController *)self iconManager];
  if ([v7 canCloseFolders])
  {
    id v8 = [(SBFloatingDockViewController *)self currentFolderAnimator];
    if (v8)
    {
      if (v6)
      {
        id v9 = [(SBFloatingDockViewController *)self currentCollapseCompletions];
        if (!v9)
        {
          id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          [(SBFloatingDockViewController *)self setCurrentCollapseCompletions:v9];
        }
        uint64_t v10 = (void *)[v6 copy];
        uint64_t v11 = _Block_copy(v10);
        [v9 addObject:v11];
      }
      if (![v8 currentOperation]) {
        [v8 reverse];
      }
    }
    else
    {
      objc_initWeak(&location, self);
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __74__SBFloatingDockViewController_dismissPresentedFolderAnimated_completion___block_invoke;
      aBlock[3] = &unk_1E6AB2790;
      objc_copyWeak(&v18, &location);
      id v17 = v6;
      id v12 = _Block_copy(aBlock);
      id v13 = [(SBFloatingDockViewController *)self folderPresentingViewController];
      uint64_t v14 = [v13 presentedFolderController];
      if (v14)
      {
        uint64_t v15 = [v7 iconDragManager];
        [v15 noteFolderControllerWillClose:v14];
      }
      [v13 dismissPresentedFolderControllerAnimated:v4 completion:v12];

      objc_destroyWeak(&v18);
      objc_destroyWeak(&location);
    }
  }
  else if (v6)
  {
    (*((void (**)(id, void))v6 + 2))(v6, 0);
  }
}

void __74__SBFloatingDockViewController_dismissPresentedFolderAnimated_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = [WeakRetained currentExpandCompletions];
  id v6 = [WeakRetained currentCollapseCompletions];
  [WeakRetained setCurrentExpandCompletions:0];
  [WeakRetained setCurrentCollapseCompletions:0];
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, uint64_t))(v7 + 16))(v7, a2);
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v23;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(v8);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v22 + 1) + 8 * v12++) + 16))();
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v10);
  }

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v13 = v6;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v19;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v19 != v16) {
          objc_enumerationMutation(v13);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v18 + 1) + 8 * v17) + 16))(*(void *)(*((void *)&v18 + 1) + 8 * v17));
        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = [v13 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v15);
  }
}

- (void)_presentFolderForIcon:(id)a3 location:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = (void (**)(id, void))a6;
  if (v10 && [(SBFloatingDockViewController *)self _shouldOpenFolderIcon:v10])
  {
    id v13 = [(SBFloatingDockViewController *)self userIconListView];
    uint64_t v14 = [v13 displayedIconViewForIcon:v10];
    if (v14)
    {
      double v32 = v13;
      uint64_t v15 = [(SBFloatingDockViewController *)self iconManager];
      uint64_t v16 = [v10 folder];
      Class v30 = (Class)[v15 controllerClassForFolderClass:objc_opt_class()];
      id v17 = objc_alloc_init((Class)[(objc_class *)v30 configurationClass]);
      double v31 = (void *)v16;
      [v17 setFolder:v16];
      long long v18 = [v15 listLayoutProvider];
      [v17 setListLayoutProvider:v18];

      objc_msgSend(v17, "setOrientation:", objc_msgSend(v15, "interfaceOrientation"));
      [v17 setIconViewProvider:self];
      long long v19 = [v15 folderIconImageCache];
      [v17 setFolderIconImageCache:v19];

      long long v20 = [(SBFloatingDockViewController *)self legibilitySettings];
      [v17 setLegibilitySettings:v20];

      [v17 setFolderDelegate:self];
      [v17 setOriginatingIconLocation:v11];
      long long v21 = [v15 delegate];
      objc_msgSend(v17, "setAddsFocusGuidesForWrapping:", objc_msgSend(v21, "isFocusAllowedForIconManager:", v15));

      long long v22 = self;
      LOBYTE(v16) = objc_opt_isKindOfClass();

      if (v16)
      {
        id v23 = v17;
        unint64_t v24 = [(SBFloatingDockViewController *)self _platterEffectForPresentedFolder];
        if (v24 == 1) {
          uint64_t v25 = 3;
        }
        else {
          uint64_t v25 = v24;
        }
        [v23 setBackgroundEffect:v25];
      }
      id v26 = (void *)[[v30 alloc] initWithConfiguration:v17];
      [v26 setFolderIconView:v14];
      objc_msgSend(v26, "setEditing:animated:", objc_msgSend(v15, "isEditing"), 0);
      double v27 = [(SBFloatingDockViewController *)self folderPresentingViewController];
      objc_msgSend(v27, "setBackgroundEffect:", -[SBFloatingDockViewController _backgroundEffectForPresentedFolder](self, "_backgroundEffectForPresentedFolder"));
      [v27 presentFolderController:v26 animated:v7 completion:v12];

      id v13 = v32;
    }
    else
    {
      CGRect v29 = SBLogCommon();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
        -[SBFloatingDockViewController _presentFolderForIcon:location:animated:completion:]();
      }

      if (v12) {
        v12[2](v12, 0);
      }
    }
  }
  else
  {
    uint64_t v28 = SBLogCommon();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      -[SBFloatingDockViewController _presentFolderForIcon:location:animated:completion:]();
    }

    if (v12) {
      v12[2](v12, 0);
    }
  }
}

- (id)folderPresentationController:(id)a3 animationControllerForTransitionWithFolder:(id)a4 presenting:(BOOL)a5 animated:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = [(SBFloatingDockViewController *)self folderPresentingViewController];

  id v13 = 0;
  if (v12 != v11 || !v6) {
    goto LABEL_17;
  }
  uint64_t v14 = [v10 folder];
  uint64_t v15 = [v14 icon];

  if (v15
    && +[SBScaleIconZoomAnimator validateAnimationContainer:self targetIcon:v15])
  {
    int v16 = 0;
    if (v7) {
      goto LABEL_11;
    }
LABEL_10:
    if ([(SBFloatingDockViewController *)self _isInAppToAppTransition]) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  id v17 = SBLogCommon();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
    -[SBFloatingDockViewController folderPresentationController:animationControllerForTransitionWithFolder:presenting:animated:]((uint64_t)v15, v17);
  }

  int v16 = 1;
  if (!v7) {
    goto LABEL_10;
  }
LABEL_11:
  if ((v16 | UIAccessibilityIsReduceMotionEnabled()) != 1)
  {
    long long v20 = [[SBFolderIconZoomAnimator alloc] initWithAnimationContainer:self innerFolderController:v10 folderIcon:v15];
    [(SBFolderIconZoomAnimator *)v20 setIsAnimatingInFloatingDock:1];
    goto LABEL_14;
  }
LABEL_12:
  long long v18 = [SBIconFadeAnimator alloc];
  long long v19 = [v10 contentView];
  long long v20 = [(SBIconFadeAnimator *)v18 initWithAnimationContainer:self crossfadeView:v19];

  [(SBFolderIconZoomAnimator *)v20 setFadesReferenceView:0];
LABEL_14:
  id v13 = [[SBHomeScreenIconTransitionAnimator alloc] initWithIconAnimator:v20 childViewController:v10 operation:v7 ^ 1];
  [(SBFloatingDockViewController *)self setCurrentFolderAnimator:v13];
  long long v21 = [(SBFloatingDockViewController *)self iconManager];
  [(SBHomeScreenIconTransitionAnimator *)v13 setDelegate:v21];

  long long v22 = [(SBFloatingDockViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v22 floatingDockViewController:self willUseAnimator:v13 forTransitioningWithFolder:v10 presenting:v7];
  }

LABEL_17:
  return v13;
}

- (void)folderPresentationController:(id)a3 willPerformTransitionWithFolder:(id)a4 presenting:(BOOL)a5 withTransitionCoordinator:(id)a6
{
  BOOL v7 = a5;
  id v10 = a4;
  id v11 = a6;
  id v12 = a3;
  id v13 = [(SBFloatingDockViewController *)self folderPresentingViewController];

  if (v13 == v12)
  {
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __130__SBFloatingDockViewController_folderPresentationController_willPerformTransitionWithFolder_presenting_withTransitionCoordinator___block_invoke;
    v19[3] = &unk_1E6AB1380;
    void v19[4] = self;
    id v20 = v10;
    BOOL v21 = v7;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __130__SBFloatingDockViewController_folderPresentationController_willPerformTransitionWithFolder_presenting_withTransitionCoordinator___block_invoke_2;
    v16[3] = &unk_1E6AB2718;
    id v14 = v20;
    id v17 = v14;
    long long v18 = self;
    [v11 animateAlongsideTransition:v19 completion:v16];
    if ([v11 isAnimated]) {
      [v11 animateAlongsideTransition:&__block_literal_global_96_0 completion:0];
    }
    uint64_t v15 = [(SBFloatingDockViewController *)self delegate];
    [v15 floatingDockViewController:self willPerformTransitionWithFolder:v14 presenting:v7 withTransitionCoordinator:v11];
  }
}

void __130__SBFloatingDockViewController_folderPresentationController_willPerformTransitionWithFolder_presenting_withTransitionCoordinator___block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  if ([*(id *)(a1 + 32) _platterEffectForPresentedFolder] == 1)
  {
    BOOL v3 = self;
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      int v5 = [v9 isCancelled];
      if (*(unsigned char *)(a1 + 48)) {
        int v6 = v5;
      }
      else {
        int v6 = 1;
      }
      uint64_t v7 = 3;
      if (((*(unsigned char *)(a1 + 48) == 0) & v5) != 0) {
        uint64_t v7 = 1;
      }
      if (v6) {
        uint64_t v8 = v7;
      }
      else {
        uint64_t v8 = 1;
      }
      [*(id *)(a1 + 40) setBackgroundEffect:v8];
    }
  }
}

void __130__SBFloatingDockViewController_folderPresentationController_willPerformTransitionWithFolder_presenting_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) view];
  double v2 = [*(id *)(a1 + 32) contentView];
  id v3 = [v2 superview];

  if (v3 != v4)
  {
    [v4 addSubview:v2];
    [v4 setNeedsLayout];
  }
  [*(id *)(a1 + 40) setCurrentFolderAnimator:0];
}

uint64_t __130__SBFloatingDockViewController_folderPresentationController_willPerformTransitionWithFolder_presenting_withTransitionCoordinator___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t result = [a2 isInteractive];
  if ((result & 1) == 0)
  {
    id v3 = (void *)MEMORY[0x1E4FB1EB0];
    return [v3 _recenterMotionEffects];
  }
  return result;
}

- (double)minimumHomeScreenScaleForFolderPresentationController:(id)a3
{
  id v4 = [(SBFloatingDockViewController *)self delegate];
  [v4 minimumHomeScreenScaleForFloatingDockViewController:self];
  double v6 = v5;

  return v6;
}

- (id)folderPresentationController:(id)a3 sourceViewForPresentingViewController:(id)a4
{
  id v5 = a4;
  double v6 = self;
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    uint64_t v8 = [v5 folder];
    id v9 = [v8 icon];

    id v10 = [(SBFloatingDockViewController *)self firstIconViewForIcon:v9];
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (UIWindow)animationWindow
{
  double v2 = [(SBFloatingDockViewController *)self view];
  id v3 = [v2 window];

  return (UIWindow *)v3;
}

- (SBHIconModel)iconModel
{
  double v2 = [(SBFloatingDockViewController *)self iconManager];
  id v3 = [v2 iconModel];

  return (SBHIconModel *)v3;
}

- (SBIconListView)dockIconListView
{
  return 0;
}

- (void)returnScalingView
{
  id v4 = [(SBFloatingDockViewController *)self view];
  id v3 = [(SBFloatingDockViewController *)self scalingView];
  [v4 addSubview:v3];
}

- (Class)controllerClassForFolder:(id)a3
{
  id v4 = a3;
  id v5 = [(SBFloatingDockViewController *)self iconManager];
  uint64_t v6 = objc_opt_class();

  uint64_t v7 = [v5 controllerClassForFolderClass:v6];

  return (Class)v7;
}

- (BOOL)folderController:(id)a3 canChangeCurrentPageIndexToIndex:(int64_t)a4
{
  return 1;
}

- (void)folderController:(id)a3 draggedIconShouldDropFromListView:(id)a4
{
}

- (BOOL)folderControllerShouldClose:(id)a3 withPinchGesture:(id)a4
{
  return 0;
}

- (void)folderControllerWillOpen:(id)a3
{
  [(SBFloatingDockSuggestionsViewProviding *)self->_suggestionsViewController dockFolderWillBeginTransitioning];
  id v6 = [(SBFloatingDockViewController *)self iconManager];
  id v4 = [v6 rootFolderController];
  id v5 = [v4 folderView];
  [v5 setSuppressesEditingStateForListViews:1];
}

- (void)folderControllerDidOpen:(id)a3
{
}

- (void)folderControllerWillClose:(id)a3
{
  if (![(SBFloatingDockViewController *)self _isInAppToAppTransition])
  {
    id v4 = [(SBFloatingDockViewController *)self delegate];
    [v4 floatingDockViewController:self wantsToBePresented:1];
  }
  [(SBFloatingDockSuggestionsViewProviding *)self->_suggestionsViewController dockFolderWillBeginTransitioning];
  id v7 = [(SBFloatingDockViewController *)self iconManager];
  id v5 = [v7 rootFolderController];
  id v6 = [v5 folderView];
  [v6 setSuppressesEditingStateForListViews:0];
}

- (void)folderControllerDidClose:(id)a3
{
}

- (void)folderControllerShouldBeginEditing:(id)a3 withHaptic:(BOOL)a4
{
  id v20 = a3;
  id v5 = [(SBFloatingDockViewController *)self delegate];
  if ((objc_opt_respondsToSelector() & 1) == 0
    || ([v5 isFloatingDockViewControllerPresentedOnExternalDisplay:self] & 1) == 0)
  {
    id v6 = [(SBFloatingDockViewController *)self iconManager];
    id v7 = [v20 view];
    uint64_t v8 = [v20 view];
    [v8 center];
    double v10 = v9;
    double v12 = v11;
    id v13 = [v6 iconEditingFeedbackBehavior];
    id v14 = [v13 view];
    objc_msgSend(v7, "convertPoint:toView:", v14, v10, v12);
    double v16 = v15;
    double v18 = v17;

    long long v19 = [v6 iconEditingFeedbackBehavior];
    objc_msgSend(v6, "setEditing:withFeedbackBehavior:location:", 1, v19, v16, v18);
  }
}

- (void)folderControllerShouldEndEditing:(id)a3
{
  id v3 = [(SBFloatingDockViewController *)self iconManager];
  [v3 setEditing:0];
}

- (void)folderControllerWillBeginScrolling:(id)a3
{
  id v4 = [(SBFloatingDockViewController *)self iconManager];
  id v3 = [v4 iconDragManager];
  [v3 noteFolderBeganScrolling];
}

- (void)folderController:(id)a3 didBeginEditingTitle:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  id v7 = [(SBFloatingDockViewController *)self iconManager];
  if (objc_opt_respondsToSelector()) {
    [v7 folderController:v8 didBeginEditingTitle:v6];
  }
}

- (void)folderController:(id)a3 didEndEditingTitle:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  id v7 = [(SBFloatingDockViewController *)self iconManager];
  if (objc_opt_respondsToSelector()) {
    [v7 folderController:v8 didEndEditingTitle:v6];
  }
}

- (BOOL)folderController:(id)a3 iconListView:(id)a4 canHandleIconDropSession:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  id v11 = [(SBFloatingDockViewController *)self presentedFolderController];

  if (v11 == v10)
  {
    id v13 = [(SBFloatingDockViewController *)self iconManager];
    id v14 = [v13 iconDragManager];
    char v12 = [v14 canHandleIconDropSession:v9 inIconListView:v8];
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (void)folderController:(id)a3 iconListView:(id)a4 iconDropSessionDidEnter:(id)a5
{
  id v13 = a4;
  id v8 = a5;
  id v9 = a3;
  id v10 = [(SBFloatingDockViewController *)self presentedFolderController];

  if (v10 == v9)
  {
    id v11 = [(SBFloatingDockViewController *)self iconManager];
    char v12 = [v11 iconDragManager];
    [v12 iconDropSessionDidEnter:v8 inIconListView:v13];
  }
}

- (id)folderController:(id)a3 iconListView:(id)a4 iconDropSessionDidUpdate:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  id v11 = [(SBFloatingDockViewController *)self presentedFolderController];

  if (v11 == v10)
  {
    id v13 = [(SBFloatingDockViewController *)self iconManager];
    id v14 = [v13 iconDragManager];
    char v12 = [v14 iconDropSessionDidUpdate:v9 inIconListView:v8];
  }
  else
  {
    char v12 = (void *)[objc_alloc(MEMORY[0x1E4FB1740]) initWithDropOperation:0];
  }

  return v12;
}

- (void)folderController:(id)a3 iconListView:(id)a4 iconDropSessionDidExit:(id)a5
{
  id v13 = a4;
  id v8 = a5;
  id v9 = a3;
  id v10 = [(SBFloatingDockViewController *)self presentedFolderController];

  if (v10 == v9)
  {
    id v11 = [(SBFloatingDockViewController *)self iconManager];
    char v12 = [v11 iconDragManager];
    [v12 iconDropSessionDidExit:v8 fromIconListView:v13];
  }
}

- (void)folderController:(id)a3 iconListView:(id)a4 performIconDrop:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v10 = [(SBFloatingDockViewController *)self iconManager];
  id v9 = [v10 iconDragManager];
  [v9 performIconDrop:v7 inIconListView:v8];
}

- (void)folderController:(id)a3 iconListView:(id)a4 willUseIconView:(id)a5 forDroppingIconDragItem:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v13 = [(SBFloatingDockViewController *)self iconManager];
  char v12 = [v13 iconDragManager];
  [v12 iconListView:v11 willUseIconView:v10 forDroppingIconDragItem:v9];
}

- (id)folderController:(id)a3 iconListView:(id)a4 previewForDroppingIconDragItem:(id)a5 proposedPreview:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  char v12 = [(SBFloatingDockViewController *)self iconManager];
  id v13 = [v12 iconDragManager];
  id v14 = [v13 iconListView:v11 previewForDroppingIconDragItem:v10 proposedPreview:v9];

  return v14;
}

- (void)folderController:(id)a3 iconListView:(id)a4 iconDragItem:(id)a5 willAnimateDropWithAnimator:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v13 = [(SBFloatingDockViewController *)self iconManager];
  char v12 = [v13 iconDragManager];
  [v12 iconListView:v11 iconDragItem:v10 willAnimateDropWithAnimator:v9];
}

- (BOOL)folderController:(id)a3 iconListView:(id)a4 shouldAllowSpringLoadedInteractionForIconDropSession:(id)a5 onIconView:(id)a6
{
  id v8 = a6;
  id v9 = a5;
  id v10 = [(SBFloatingDockViewController *)self iconManager];
  id v11 = [v10 iconDragManager];
  char v12 = [v11 shouldAllowSpringLoadedInteractionForIconDropSession:v9 onIconView:v8];

  return v12;
}

- (void)folderController:(id)a3 iconListView:(id)a4 springLoadedInteractionForIconDragDidCompleteOnIconView:(id)a5
{
  id v6 = a5;
  id v8 = [(SBFloatingDockViewController *)self iconManager];
  id v7 = [v8 iconDragManager];
  [v7 performSpringLoadedInteractionForIconDragOnIconView:v6];
}

- (id)folderController:(id)a3 iconListView:(id)a4 customSpringAnimationBehaviorForDroppingItem:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = [(SBFloatingDockViewController *)self iconManager];
  id v10 = [v9 iconDragManager];
  id v11 = [v10 iconListView:v8 customSpringAnimationBehaviorForDroppingItem:v7];

  return v11;
}

- (id)folderController:(id)a3 accessibilityTintColorForScreenRect:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v8 = [(SBFloatingDockViewController *)self iconManager];
  id v9 = objc_msgSend(v8, "accessibilityTintColorForScreenRect:", x, y, width, height);

  return v9;
}

- (id)succinctDescription
{
  double v2 = [(SBFloatingDockViewController *)self succinctDescriptionBuilder];
  id v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  id v3 = [(SBFloatingDockViewController *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = [(SBFloatingDockViewController *)self succinctDescriptionBuilder];
  [(SBFloatingDockViewController *)self dockOffscreenProgress];
  id v5 = (id)objc_msgSend(v4, "appendFloat:withName:decimalPrecision:", @"dockOffscreenProgress", 2);
  id v6 = [(SBFloatingDockViewController *)self suggestionsViewController];
  id v7 = (id)[v4 appendObject:v6 withName:@"suggestionsViewController"];

  [(SBFloatingDockViewController *)self contentHeight];
  id v8 = (id)objc_msgSend(v4, "appendDouble:withName:decimalPrecision:", @"contentHeight", 1);
  [(SBFloatingDockViewController *)self maximumContentHeight];
  id v9 = (id)objc_msgSend(v4, "appendDouble:withName:decimalPrecision:", @"maximumContentHeight", 1);
  id v10 = (id)objc_msgSend(v4, "appendBool:withName:ifEqualTo:", -[SBFloatingDockViewController isPresentingLibrary](self, "isPresentingLibrary"), @"isPresentingLibrary", 1);
  id v11 = (id)objc_msgSend(v4, "appendBool:withName:ifEqualTo:", -[SBFloatingDockViewController _isLibraryContainedInForeground](self, "_isLibraryContainedInForeground"), @"isLibraryContainedInForeground", 1);
  id v12 = (id)objc_msgSend(v4, "appendBool:withName:ifEqualTo:", -[SBFloatingDockViewController isPresentingFolder](self, "isPresentingFolder"), @"isPresentingFolder", 1);
  id v13 = [(SBFloatingDockViewController *)self presentedFolderController];
  id v14 = (id)[v4 appendObject:v13 withName:@"presentedFolderController" skipIfNil:1];

  double v15 = [(SBFloatingDockViewController *)self legibilitySettings];
  id v16 = (id)[v4 appendObject:v15 withName:@"legibilitySettings"];

  double v17 = [(SBFloatingDockViewController *)self underlyingPresentationStyleConfiguration];
  id v18 = (id)[v4 appendObject:v17 withName:@"underlyingPresentationStyleConfiguration"];

  return v4;
}

- (SBFloatingDockViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBFloatingDockViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SBFloatingDockSuggestionsViewProviding)suggestionsViewController
{
  return self->_suggestionsViewController;
}

- (BOOL)isLibraryPodIconEnabled
{
  return self->_libraryPodIconEnabled;
}

- (BOOL)isLibraryPodIconVisible
{
  return self->_libraryPodIconVisible;
}

- (SBHLibraryViewController)libraryViewController
{
  return self->_libraryViewController;
}

- (SBIconListLayoutProvider)listLayoutProvider
{
  return self->_listLayoutProvider;
}

- (BOOL)suppressesEditingStateForListViews
{
  return self->_suppressesEditingStateForListViews;
}

- (double)dockOffscreenProgress
{
  return self->_dockOffscreenProgress;
}

- (BOOL)wantsFastIconReordering
{
  return self->_wantsFastIconReordering;
}

- (void)setWantsFastIconReordering:(BOOL)a3
{
  self->_wantsFastIconReordering = a3;
}

- (BOOL)shouldIndicateImpossibleDrop
{
  return self->_shouldIndicateImpossibleDrop;
}

- (void)setShouldIndicateImpossibleDrop:(BOOL)a3
{
  self->_shouldIndicateImpossibleDrop = a3;
}

- (SBHIconManager)iconManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_iconManager);
  return (SBHIconManager *)WeakRetained;
}

- (SBIconViewProviding)iconViewProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_iconViewProvider);
  return (SBIconViewProviding *)WeakRetained;
}

- (SBIconListModel)dockListModel
{
  return self->_dockListModel;
}

- (void)setDockListModel:(id)a3
{
}

- (SBHModalLibraryPresenter)libraryPresenter
{
  return self->_libraryPresenter;
}

- (void)setLibraryPresenter:(id)a3
{
}

- (SBFolderPresentingViewController)folderPresentingViewController
{
  return self->_folderPresentingViewController;
}

- (void)setFolderPresentingViewController:(id)a3
{
}

- (SBHomeScreenIconTransitionAnimator)currentFolderAnimator
{
  return self->_currentFolderAnimator;
}

- (void)setCurrentFolderAnimator:(id)a3
{
}

- (NSMutableArray)currentExpandCompletions
{
  return self->_currentExpandCompletions;
}

- (void)setCurrentExpandCompletions:(id)a3
{
}

- (NSMutableArray)currentCollapseCompletions
{
  return self->_currentCollapseCompletions;
}

- (void)setCurrentCollapseCompletions:(id)a3
{
}

- (SBHTouchPassThroughView)scalingView
{
  return self->_scalingView;
}

- (void)setScalingView:(id)a3
{
}

- (double)lastDockHeight
{
  return self->_lastDockHeight;
}

- (void)setLastDockHeight:(double)a3
{
  self->_lastDockHeight = a3;
}

- (SBHFloatingDockStyleConfiguration)underlyingPresentationStyleConfiguration
{
  return self->_underlyingPresentationStyleConfiguration;
}

- (void)setUnderlyingPresentationStyleConfiguration:(id)a3
{
}

- (BOOL)isTransitioningUnderlyingBackgroundStyle
{
  return self->_transitioningUnderlyingPresentationStyleConfiguration;
}

- (void)setTransitioningUnderlyingPresentationStyleConfiguration:(BOOL)a3
{
  self->_transitioningUnderlyingPresentationStyleConfiguration = a3;
}

- (SBHFloatingDockStyleConfiguration)transitionTargetUnderlyingPresentationStyleConfiguration
{
  return self->_transitionTargetUnderlyingPresentationStyleConfiguration;
}

- (void)setTransitionTargetUnderlyingPresentationStyleConfiguration:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitionTargetUnderlyingPresentationStyleConfiguration, 0);
  objc_storeStrong((id *)&self->_underlyingPresentationStyleConfiguration, 0);
  objc_storeStrong((id *)&self->_scalingView, 0);
  objc_storeStrong((id *)&self->_currentCollapseCompletions, 0);
  objc_storeStrong((id *)&self->_currentExpandCompletions, 0);
  objc_storeStrong((id *)&self->_currentFolderAnimator, 0);
  objc_storeStrong((id *)&self->_folderPresentingViewController, 0);
  objc_storeStrong((id *)&self->_libraryPresenter, 0);
  objc_storeStrong((id *)&self->_dockListModel, 0);
  objc_destroyWeak((id *)&self->_iconViewProvider);
  objc_destroyWeak((id *)&self->_iconManager);
  objc_storeStrong((id *)&self->_listLayoutProvider, 0);
  objc_storeStrong((id *)&self->_libraryViewController, 0);
  objc_storeStrong((id *)&self->_suggestionsViewController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_bouncedDropSessions, 0);
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
  objc_storeStrong((id *)&self->_libraryIconDropInteractionDelegate, 0);
  objc_storeStrong((id *)&self->_libraryIconViewController, 0);
  objc_storeStrong((id *)&self->_libraryPodIconView, 0);
  objc_storeStrong((id *)&self->_dockView, 0);
}

- (void)_presentFolderForIcon:location:animated:completion:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_2_2();
  _os_log_error_impl(&dword_1D7F0A000, v0, OS_LOG_TYPE_ERROR, "%s Folder icon %@ cannot be opened because it does not exist in the user icon list", (uint8_t *)v1, 0x16u);
}

- (void)_presentFolderForIcon:location:animated:completion:.cold.2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_2_2();
  _os_log_error_impl(&dword_1D7F0A000, v0, OS_LOG_TYPE_ERROR, "%s No folder icon view for %@", (uint8_t *)v1, 0x16u);
}

- (void)folderPresentationController:(uint64_t)a1 animationControllerForTransitionWithFolder:(NSObject *)a2 presenting:animated:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D7F0A000, a2, OS_LOG_TYPE_ERROR, "Forcing cross-fade animation for floating dock folder transition for icon: %@", (uint8_t *)&v2, 0xCu);
}

@end