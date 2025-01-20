@interface SBHStackConfigurationViewController
- (BOOL)_allowUserInteraction;
- (BOOL)_canAddAdditionalWidgets;
- (BOOL)_shouldKeepIconImageViewControllersStatic;
- (BOOL)_shouldUseConcentricCornersWhenExpanded;
- (BOOL)_widgetDataSourceIsSuggestion:(id)a3;
- (BOOL)canDismissWhileDragging;
- (BOOL)didPerformDrop;
- (BOOL)didRemoveDraggedIconsForDismissal;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)hidesPresenterTitledButtons;
- (BOOL)icon:(id)a3 canReceiveGrabbedIcon:(id)a4;
- (BOOL)iconDragManager:(id)a3 canAddDragItemsToSession:(id)a4 fromIconView:(id)a5;
- (BOOL)iconDragManager:(id)a3 doesIconRepresentRealIconPosition:(id)a4 inLocation:(id)a5;
- (BOOL)iconDragManager:(id)a3 dragsSupportSystemDragsForIconView:(id)a4;
- (BOOL)iconListModel:(id)a3 isAllowedToContainIcon:(id)a4;
- (BOOL)iconShouldAllowAccessoryViewTap:(id)a3;
- (BOOL)iconShouldAllowCloseBoxTap:(id)a3;
- (BOOL)iconView:(id)a3 supportsConfigurationForDataSource:(id)a4;
- (BOOL)iconViewCanBecomeFocused:(id)a3;
- (BOOL)iconViewDisplaysAccessories:(id)a3;
- (BOOL)iconViewDisplaysCloseBox:(id)a3;
- (BOOL)iconViewDisplaysLabel:(id)a3;
- (BOOL)isDisplayingEditingButtons;
- (BOOL)isEditing;
- (BOOL)isEditingIcons;
- (CGPoint)_targetContentOffsetForWidgetIndex:(unint64_t)a3;
- (CGRect)contentBoundingFrame;
- (CGSize)_stableApertureSize;
- (NSMutableDictionary)userInfo;
- (NSSet)apertureBackgroundViews;
- (NSSet)fadingViews;
- (NSSet)materialViews;
- (NSSet)widgetBackgroundViews;
- (SBHCustomIconListLayout)customLayout;
- (SBHIconImageAppearance)overrideIconImageAppearance;
- (SBHIconImageStyleConfiguration)overrideIconImageStyleConfiguration;
- (SBHStackConfigurationViewController)initWithConfiguration:(id)a3 iconView:(id)a4 iconViewProvider:(id)a5 listLayoutProvider:(id)a6 showsAddButton:(BOOL)a7 showsDoneButton:(BOOL)a8;
- (SBHStackConfigurationViewControllerDelegate)delegate;
- (SBHWidgetSheetViewControllerPresenter)presenter;
- (SBIconDragManager)iconDragManager;
- (SBIconListView)iconListView;
- (SBIconView)currentConfiguringIconView;
- (SBIconView)currentDraggingIconView;
- (SBIconView)sourceIconView;
- (SBIconView)sourceStackIconView;
- (SBLeafIconDataSource)visiblyActiveDataSource;
- (SBTitledHomeScreenButton)addButton;
- (SBTitledHomeScreenButton)doneButton;
- (UIEdgeInsets)visibleContainerInsets;
- (UIView)visiblyActiveDataSourceSnapshotView;
- (UIView)widgetContentContainerView;
- (UIView)widgetStackMatchingBackgroundView;
- (double)_expandedPageControlOutset;
- (double)_iconContentScale;
- (double)titledButtonsAlpha;
- (double)verticalMarginPercentageForConfigurationOfIconView:(id)a3;
- (id)_newHomeScreenButtonBackgroundView;
- (id)_unraveledWidgetIconForDataSource:(id)a3 withGridSizeClass:(id)a4;
- (id)animationCoordinator;
- (id)customImageViewControllerForIconView:(id)a3;
- (id)draggingDelegateForIconView:(id)a3;
- (id)iconDragManager:(id)a3 dragPreviewForIconView:(id)a4;
- (id)iconDragManager:(id)a3 draggedIconForIdentifier:(id)a4;
- (id)iconDragManager:(id)a3 iconDropSessionDidUpdate:(id)a4 inIconListView:(id)a5 draggedIcons:(id)a6 proposedDropProposal:(id)a7;
- (id)iconDragManager:(id)a3 targetedDragPreviewForIconView:(id)a4 item:(id)a5 session:(id)a6 previewParameters:(id)a7;
- (id)iconListViewForIndexPath:(id)a3;
- (id)iconView:(id)a3 configurationInteractionForDataSource:(id)a4;
- (id)iconView:(id)a3 homeScreenContentViewForConfigurationInteraction:(id)a4;
- (id)iconViewQueryableForIconDragManager:(id)a3;
- (id)keepIconImageViewControllersStaticForReason:(id)a3;
- (id)makeTitledButtonOfClass:(Class)a3;
- (id)nonEditingStatusBarHidingReason;
- (id)reuseDelegateForIconView:(id)a3;
- (id)rootListModelForIconDragManager:(id)a3;
- (id)rootViewForIconDragManager:(id)a3;
- (id)shortcutsDelegateForIconView:(id)a3;
- (id)stackConfigurationInteractionForIconView:(id)a3;
- (id)widgetInsertionRippleIconAnimatorForIcon:(id)a3 iconListView:(id)a4 withReferenceIconView:(id)a5;
- (id)windowForIconDragPreviewsForIconDragManager:(id)a3 forWindowScene:(id)a4;
- (int64_t)_iconViewComponentBackgroundViewType;
- (int64_t)closeBoxTypeForIconView:(id)a3;
- (int64_t)iconView:(id)a3 accessoryTypeWithProposedAccessoryType:(int64_t)a4;
- (int64_t)iconView:(id)a3 userInterfaceStyleForConfigurationInteraction:(id)a4;
- (unint64_t)_sourceActiveWidgetIndex;
- (unint64_t)_widgetIndexForContentOffset:(CGPoint)a3;
- (unint64_t)presenterType;
- (unint64_t)supportedInterfaceOrientations;
- (void)_cancelCloseConfigurationTimer;
- (void)_closeConfigurationTimerFired;
- (void)_didChangePageControlPage:(id)a3;
- (void)_didTapAddWidgetButton:(id)a3;
- (void)_didTapBackgroundView:(id)a3;
- (void)_didTapDoneButton:(id)a3;
- (void)_didToggleSmartRotate:(id)a3;
- (void)_didToggleSuggestions:(id)a3;
- (void)_iconListDidChangeWidgetIcons;
- (void)_promoteWidgetIcon:(id)a3;
- (void)_requestDismissal;
- (void)_saveConfiguration;
- (void)_scrollToWidgetIndex:(unint64_t)a3 animated:(BOOL)a4;
- (void)_scrollToWidgetIndex:(unint64_t)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)_setCloseFolderTimerIfNecessary;
- (void)_setPageControlScale:(double)a3;
- (void)_setupApertureViewInContainer:(id)a3;
- (void)_setupBackgroundInContainer:(id)a3;
- (void)_setupContentViewWithContentFrame:(CGRect)a3;
- (void)_setupEditingButtons;
- (void)_setupIconListViewCenteredInScrollView:(id)a3;
- (void)_setupLargeSizeLayoutAdjustmentsIfNecessary;
- (void)_setupMatchMoveAnimationWithSourceView:(id)a3 targetView:(id)a4;
- (void)_setupPageControlInContainer:(id)a3;
- (void)_setupScrollViewInContainer:(id)a3;
- (void)_setupTapToDismissGestureInView:(id)a3;
- (void)_updateAddWidgetButtonOperabilityForDataSourceCount;
- (void)_updateButtonSubtitleForSmartRotate:(BOOL)a3 animated:(BOOL)a4;
- (void)_updateCurrentPageControlPage;
- (void)_updateEditingStateAnimated:(BOOL)a3;
- (void)_updateForWidgetIconCountChanged;
- (void)_updateLayoutForEditButtons;
- (void)_updatePresentationModeForIconViews;
- (void)animationCoordinator;
- (void)configureWithStackLayoutMetrics:(SBHStackLayoutMetrics *)a3;
- (void)coronaAnimationController:(id)a3 willAnimateCoronaTransitionWithAnimator:(id)a4;
- (void)didMoveToParentViewController:(id)a3;
- (void)enumerateScrollableIconViewsUsingBlock:(id)a3;
- (void)iconAccessoryViewTapped:(id)a3;
- (void)iconCloseBoxTapped:(id)a3;
- (void)iconDragManager:(id)a3 didPerformIconDrop:(id)a4 withIcons:(id)a5 inIconListView:(id)a6;
- (void)iconDragManager:(id)a3 iconDropSession:(id)a4 didEnterIconListView:(id)a5;
- (void)iconDragManager:(id)a3 iconDropSession:(id)a4 didExitIconListView:(id)a5;
- (void)iconDragManager:(id)a3 iconListView:(id)a4 item:(id)a5 willAnimateDropWithAnimator:(id)a6;
- (void)iconDragManager:(id)a3 iconView:(id)a4 didEndDragSession:(id)a5 withOperation:(unint64_t)a6;
- (void)iconDragManager:(id)a3 iconView:(id)a4 dragLiftAnimationDidChangeDirection:(int64_t)a5;
- (void)iconDragManager:(id)a3 iconView:(id)a4 item:(id)a5 willAnimateDragCancelWithAnimator:(id)a6;
- (void)iconDragManager:(id)a3 iconView:(id)a4 willAnimateDragLiftWithAnimator:(id)a5 session:(id)a6;
- (void)iconDragManager:(id)a3 iconView:(id)a4 willBeginDragSession:(id)a5;
- (void)iconDragManagerIconDraggingDidChange:(id)a3;
- (void)iconList:(id)a3 didAddIcon:(id)a4;
- (void)iconList:(id)a3 didMoveIcon:(id)a4;
- (void)iconList:(id)a3 didRemoveIcon:(id)a4;
- (void)iconList:(id)a3 didReplaceIcon:(id)a4 withIcon:(id)a5;
- (void)iconTapped:(id)a3;
- (void)iconView:(id)a3 configurationDidEndWithInteraction:(id)a4;
- (void)iconView:(id)a3 configurationDidUpdateWithInteraction:(id)a4;
- (void)iconView:(id)a3 configurationWillBeginWithInteraction:(id)a4;
- (void)iconView:(id)a3 configurationWillEndWithInteraction:(id)a4;
- (void)leafIcon:(id)a3 didAddIconDataSource:(id)a4;
- (void)leafIcon:(id)a3 didChangeActiveDataSource:(id)a4;
- (void)loadView;
- (void)noteIconDrag:(id)a3 didChangeInIconListView:(id)a4;
- (void)noteIconDrag:(id)a3 didEnterIconListView:(id)a4;
- (void)noteIconDrag:(id)a3 didExitIconListView:(id)a4;
- (void)noteIconDragDidEnd;
- (void)scrollIconToVisible:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)scrollViewDidEndScrolling:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)setAddButton:(id)a3;
- (void)setCanDismissWhileDragging:(BOOL)a3;
- (void)setContentBoundingFrame:(CGRect)a3;
- (void)setCurrentConfiguringIconView:(id)a3;
- (void)setCurrentDraggingIconView:(id)a3;
- (void)setCustomLayout:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDidPerformDrop:(BOOL)a3;
- (void)setDidRemoveDraggedIconsForDismissal:(BOOL)a3;
- (void)setDoneButton:(id)a3;
- (void)setEditingIcons:(BOOL)a3;
- (void)setIconDragManager:(id)a3;
- (void)setOverrideIconImageAppearance:(id)a3;
- (void)setOverrideIconImageStyleConfiguration:(id)a3;
- (void)setPresenter:(id)a3;
- (void)setScrollPosition:(unint64_t)a3;
- (void)setSuppressesEditingStateForListView:(BOOL)a3;
- (void)setTitledButtonsAlpha:(double)a3;
- (void)setTitledButtonsEnabled:(BOOL)a3;
- (void)stackConfigurationView:(id)a3 didHitTestView:(id)a4 atPoint:(CGPoint)a5 withEvent:(id)a6;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)willDismiss;
@end

@implementation SBHStackConfigurationViewController

- (SBHStackConfigurationViewController)initWithConfiguration:(id)a3 iconView:(id)a4 iconViewProvider:(id)a5 listLayoutProvider:(id)a6 showsAddButton:(BOOL)a7 showsDoneButton:(BOOL)a8
{
  id v15 = a3;
  id v16 = a4;
  id v39 = a5;
  id v17 = a6;
  v40.receiver = self;
  v40.super_class = (Class)SBHStackConfigurationViewController;
  v18 = [(SBHStackConfigurationViewController *)&v40 init];
  v19 = v18;
  if (v18)
  {
    id v38 = v15;
    objc_storeStrong((id *)&v18->_listLayoutProvider, a6);
    objc_storeStrong((id *)&v19->_iconViewProvider, a5);
    objc_storeStrong((id *)&v19->_configuration, a3);
    objc_storeStrong((id *)&v19->_stackIconView, a4);
    v19->_titledButtonsAlpha = 1.0;
    v19->_needsAddButton = a7;
    v19->_needsDoneButton = a8;
    v19->_canDismissWhileDragging = 1;
    uint64_t v20 = [v16 delegate];
    defaultIconViewDelegate = v19->_defaultIconViewDelegate;
    v19->_defaultIconViewDelegate = (SBIconViewDelegate *)v20;

    v22 = +[SBHHomeScreenDomain rootSettings];
    uint64_t v23 = [v22 widgetSettings];
    widgetSettings = v19->_widgetSettings;
    v19->_widgetSettings = (SBHWidgetSettings *)v23;

    v25 = [(SBHScrollableIconViewInteraction *)[SBHScrollableConfiguringIconViewInteraction alloc] initWithContainer:v19];
    scrollingInteraction = v19->_scrollingInteraction;
    v19->_scrollingInteraction = &v25->super;

    v27 = objc_alloc_init(SBIconDragManager);
    iconDragManager = v19->_iconDragManager;
    v19->_iconDragManager = v27;

    [(SBIconDragManager *)v19->_iconDragManager setDelegate:v19];
    v29 = [(SBIconListLayoutProvider *)v19->_listLayoutProvider layoutForIconLocation:@"SBIconLocationRoot"];
    if (objc_opt_respondsToSelector())
    {
      v30 = [v29 rootFolderVisualConfiguration];
    }
    else
    {
      v30 = objc_alloc_init(SBHRootFolderVisualConfiguration);
    }
    rootFolderVisualConfiguration = v19->_rootFolderVisualConfiguration;
    v19->_rootFolderVisualConfiguration = v30;

    id v32 = v29;
    v33 = SBHIconListLayoutIconGridSizeClassSizes(v32, [v16 orientation]);

    v34 = [v16 icon];
    v35 = [v34 gridSizeClass];
    unsigned __int16 v36 = [v33 gridSizeForGridSizeClass:v35];

    v19->_stackSizeIsSmall = v36 <= (unsigned __int16)[v33 gridSizeForGridSizeClass:@"SBHIconGridSizeClassSmall"];
    id v15 = v38;
  }

  return v19;
}

- (void)loadView
{
  v35.receiver = self;
  v35.super_class = (Class)SBHStackConfigurationViewController;
  [(SBHStackConfigurationViewController *)&v35 loadView];
  v3 = [SBHStackConfigurationView alloc];
  v4 = [(SBHStackConfigurationViewController *)self view];
  [v4 frame];
  v5 = -[SBHStackConfigurationView initWithFrame:](v3, "initWithFrame:");

  [(SBHStackConfigurationView *)v5 setDelegate:self];
  [(SBHStackConfigurationViewController *)self setView:v5];
  v6 = [(SBHStackConfigurationViewController *)self view];
  BOOL v7 = [(SBHWidgetSettings *)self->_widgetSettings stackConfigurationBlursBackground];
  widgetSettings = self->_widgetSettings;
  if (v7)
  {
    if ([(SBHWidgetSettings *)widgetSettings stackConfigurationUsesFolderBlur])
    {
      v9 = [MEMORY[0x1E4FB16C8] currentDevice];
      uint64_t v10 = objc_msgSend(v9, "sbf_animatedBlurRadiusGraphicsQuality");

      v11 = @"folderExpandedBackgroundHomeSimplified";
      if (v10 == 100) {
        v11 = @"folderExpandedBackgroundHome";
      }
      v12 = (void *)MEMORY[0x1E4F743C8];
      v13 = v11;
      v14 = SBHBundle();
      id v15 = [v12 materialViewWithRecipeNamed:v13 inBundle:v14 options:0 initialWeighting:0 scaleAdjustment:1.0];
    }
    else
    {
      v18 = (void *)MEMORY[0x1E4F743C8];
      v14 = SBHBundle();
      id v15 = [v18 materialViewWithRecipeNamed:@"stackConfigurationBackground" inBundle:v14 options:0 initialWeighting:0 scaleAdjustment:1.0];
    }

    [v6 bounds];
    objc_msgSend(v15, "setFrame:");
    [v15 setAutoresizingMask:18];
    v19 = SBHHomeScreenMaterialViewBackdropScaleAdjustmentHandlerForCurrentDevice();
    [v15 setBackdropScaleAdjustment:v19];

    [v15 setGroupNameBase:@"Widget-Stack-Configuration"];
    [v6 addSubview:v15];
    backgroundMaterialView = self->_backgroundMaterialView;
    self->_backgroundMaterialView = (MTMaterialView *)v15;
    id v21 = v15;

    [(SBHWidgetSettings *)self->_widgetSettings stackConfigurationDimmingAlpha];
    double v17 = v22;
  }
  else
  {
    [(SBHWidgetSettings *)widgetSettings stackConfigurationNoBlurDimmingAlpha];
    double v17 = v16;
  }
  uint64_t v23 = [SBHStackConfigurationBackgroundDimmingView alloc];
  [v6 bounds];
  v24 = -[SBHStackConfigurationBackgroundDimmingView initWithFrame:](v23, "initWithFrame:");
  [(SBHStackConfigurationBackgroundDimmingView *)v24 setAutoresizingMask:18];
  v25 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:v17];
  [(SBHStackConfigurationBackgroundDimmingView *)v24 setBackgroundColor:v25];

  [v6 addSubview:v24];
  backgroundDimmingView = self->_backgroundDimmingView;
  self->_backgroundDimmingView = v24;
  v27 = v24;

  v28 = [SBHTouchPassThroughView alloc];
  [v6 bounds];
  v29 = -[SBHTouchPassThroughView initWithFrame:](v28, "initWithFrame:");
  [(UIView *)v29 setAutoresizingMask:18];
  [v6 addSubview:v29];
  scalingView = self->_scalingView;
  self->_scalingView = v29;
  v31 = v29;

  id v32 = [SBHTouchPassThroughView alloc];
  [(UIView *)v31 bounds];
  v33 = -[SBHTouchPassThroughView initWithFrame:](v32, "initWithFrame:");
  [(UIView *)v31 addSubview:v33];
  contentView = self->_contentView;
  self->_contentView = v33;
}

- (void)viewDidLoad
{
  v12.receiver = self;
  v12.super_class = (Class)SBHStackConfigurationViewController;
  [(SBHStackConfigurationViewController *)&v12 viewDidLoad];
  v3 = [(SBHStackConfigurationViewController *)self presenter];
  if (objc_opt_respondsToSelector()) {
    -[SBHStackConfigurationViewController setOverrideUserInterfaceStyle:](self, "setOverrideUserInterfaceStyle:", [v3 overrideUserInterfaceStyleForPresentingWidgetSheet]);
  }
  [(SBHStackConfigurationViewController *)self contentBoundingFrame];
  -[SBHStackConfigurationViewController _setupContentViewWithContentFrame:](self, "_setupContentViewWithContentFrame:");
  v4 = self->_contentView;
  [(SBHStackConfigurationViewController *)self _setupBackgroundInContainer:v4];
  v5 = self->_contentView;
  [(SBHStackConfigurationViewController *)self _setupApertureViewInContainer:v5];
  v6 = self->_apertureView;
  [(SBHStackConfigurationViewController *)self _setupScrollViewInContainer:v6];
  BOOL v7 = self->_scrollView;
  [(SBHStackConfigurationViewController *)self _setupIconListViewCenteredInScrollView:v7];
  v8 = self->_contentView;
  [(SBHStackConfigurationViewController *)self _setupPageControlInContainer:v8];
  v9 = [(SBHStackConfigurationViewController *)self view];
  [(SBHStackConfigurationViewController *)self _setupTapToDismissGestureInView:v9];
  [(SBHStackConfigurationViewController *)self _setupEditingButtons];
  [(SBHStackConfigurationViewController *)self _setupLargeSizeLayoutAdjustmentsIfNecessary];
  [(SBHStackConfigurationApertureView *)self->_apertureView setContentScrollView:self->_scrollView];
  -[SBHStackConfigurationApertureView setIconImageInfo:](self->_apertureView, "setIconImageInfo:", self->_iconImageInfo.size.width, self->_iconImageInfo.size.height, self->_iconImageInfo.scale, self->_iconImageInfo.continuousCornerRadius);
  [(SBHStackConfigurationApertureView *)self->_apertureView setIconListView:self->_iconListView];
  self->_scrollPositionNeed = 1;
  [(SBHStackConfigurationViewController *)self _stableApertureSize];
  -[SBHStackConfigurationBackgroundViewController setApertureSize:](self->_backgroundViewController, "setApertureSize:");
  [(SBHStackConfigurationBackgroundDimmingView *)self->_backgroundDimmingView setIconListView:self->_iconListView];
  [(UIPageControl *)self->_pageControl setAccessibilityIdentifier:@"stack-configuration-page-control"];
  [(SBHStackConfigurationApertureView *)self->_apertureView setAccessibilityIdentifier:@"stack-configuration-aperture-view"];
  uint64_t v10 = [(CCUILabeledRoundButtonViewController *)self->_smartRotateButtonViewController button];
  [v10 setAccessibilityIdentifier:@"stack-configuration-smart-rotate-button"];

  v11 = [(CCUILabeledRoundButtonViewController *)self->_suggestionsButtonViewController button];

  [v11 setAccessibilityIdentifier:@"stack-configuration-suggestions-button"];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SBHStackConfigurationViewController;
  [(SBHStackConfigurationViewController *)&v4 viewWillAppear:a3];
  [(SBIconListView *)self->_iconListView showAllIcons];
  [(SBHStackConfigurationViewController *)self _updatePresentationModeForIconViews];
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)SBHStackConfigurationViewController;
  [(SBHStackConfigurationViewController *)&v3 viewDidLayoutSubviews];
  [(SBHStackConfigurationViewController *)self _updateLayoutForEditButtons];
  if (self->_scrollPositionNeed)
  {
    [(SBHStackConfigurationViewController *)self _scrollToWidgetIndex:[(SBHStackConfigurationViewController *)self _sourceActiveWidgetIndex] animated:0];
    self->_scrollPositionNeed = 0;
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SBHStackConfigurationViewController;
  [(SBHStackConfigurationViewController *)&v7 viewDidAppear:a3];
  objc_super v4 = [(SBHStackConfigurationViewController *)self view];
  v5 = [v4 window];
  v6 = objc_msgSend(v5, "sb_coronaAnimationController");

  [v6 addParticipant:self];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SBHStackConfigurationViewController;
  [(SBHStackConfigurationViewController *)&v7 viewDidDisappear:a3];
  objc_super v4 = [(SBHStackConfigurationViewController *)self view];
  v5 = [v4 window];
  v6 = objc_msgSend(v5, "sb_coronaAnimationController");

  [v6 removeParticipant:self];
}

- (void)didMoveToParentViewController:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SBHStackConfigurationViewController;
  -[SBHStackConfigurationViewController didMoveToParentViewController:](&v7, sel_didMoveToParentViewController_);
  if (a3)
  {
    v5 = [(SBHStackConfigurationViewController *)self view];
    v6 = [v5 window];

    [(SBHStackConfigurationViewController *)self _setupMatchMoveAnimationWithSourceView:v6 targetView:self->_backgroundDimmingView];
    [(SBHStackConfigurationViewController *)self _setupMatchMoveAnimationWithSourceView:v6 targetView:self->_backgroundMaterialView];
  }
}

- (unint64_t)supportedInterfaceOrientations
{
  if (__sb__runningInSpringBoard())
  {
    BOOL v2 = SBFEffectiveDeviceClass() == 2;
  }
  else
  {
    objc_super v3 = [MEMORY[0x1E4FB16C8] currentDevice];
    BOOL v2 = [v3 userInterfaceIdiom] == 1;
  }
  if (v2) {
    return 30;
  }
  else {
    return 2;
  }
}

- (void)setEditingIcons:(BOOL)a3
{
  if (self->_editingIcons != a3)
  {
    self->_editingIcons = a3;
    [(SBHStackConfigurationViewController *)self _updateEditingStateAnimated:1];
  }
}

- (SBLeafIconDataSource)visiblyActiveDataSource
{
  objc_super v3 = [(SBIconView *)self->_stackIconView icon];
  if ([v3 iconDataSourceCount])
  {
    [(BSUIScrollView *)self->_scrollView contentOffset];
    unint64_t v4 = -[SBHStackConfigurationViewController _widgetIndexForContentOffset:](self, "_widgetIndexForContentOffset:");
    uint64_t v5 = [v3 iconDataSourceCount];
    if (v5 - 1 < v4) {
      unint64_t v4 = v5 - 1;
    }
    v6 = [v3 iconDataSources];
    objc_super v7 = [v6 objectAtIndex:v4];
  }
  else
  {
    objc_super v7 = 0;
  }

  return (SBLeafIconDataSource *)v7;
}

- (SBIconView)sourceStackIconView
{
  return self->_stackIconView;
}

- (id)animationCoordinator
{
  if (([(SBHStackConfigurationViewController *)self isViewLoaded] & 1) == 0)
  {
    unint64_t v4 = SBLogIcon();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      [(SBHStackConfigurationViewController *)(uint64_t)self animationCoordinator];
    }

    [(SBHStackConfigurationViewController *)self loadViewIfNeeded];
  }
  return self;
}

- (SBIconListView)iconListView
{
  return self->_iconListView;
}

- (id)keepIconImageViewControllersStaticForReason:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = objc_alloc(MEMORY[0x1E4F4F838]);
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  v13 = __83__SBHStackConfigurationViewController_keepIconImageViewControllersStaticForReason___block_invoke;
  v14 = &unk_1E6AAD538;
  objc_copyWeak(&v15, &location);
  v6 = (void *)[v5 initWithIdentifier:@"KeepStackIconImagesStatic" forReason:v4 invalidationBlock:&v11];
  keepStaticAssertions = self->_keepStaticAssertions;
  if (!keepStaticAssertions)
  {
    objc_msgSend(MEMORY[0x1E4F28D30], "weakObjectsHashTable", v11, v12, v13, v14);
    v8 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    v9 = self->_keepStaticAssertions;
    self->_keepStaticAssertions = v8;

    keepStaticAssertions = self->_keepStaticAssertions;
  }
  -[NSHashTable addObject:](keepStaticAssertions, "addObject:", v6, v11, v12, v13, v14);
  [(SBHStackConfigurationViewController *)self _updatePresentationModeForIconViews];
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

  return v6;
}

void __83__SBHStackConfigurationViewController_keepIconImageViewControllersStaticForReason___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained[159] removeObject:v5];
    [v4 _updatePresentationModeForIconViews];
  }
}

- (void)scrollIconToVisible:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  v8 = (void (**)(void))a5;
  iconListView = self->_iconListView;
  id v10 = a3;
  uint64_t v11 = [(SBIconListView *)iconListView icons];
  uint64_t v12 = [v11 indexOfObject:v10];

  if (v12 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v8) {
      v8[2](v8);
    }
  }
  else
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __79__SBHStackConfigurationViewController_scrollIconToVisible_animated_completion___block_invoke;
    aBlock[3] = &unk_1E6AADF78;
    id v15 = v8;
    v13 = _Block_copy(aBlock);
    [(SBHStackConfigurationViewController *)self _scrollToWidgetIndex:v12 animated:v5 completion:v13];
  }
}

uint64_t __79__SBHStackConfigurationViewController_scrollIconToVisible_animated_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)setOverrideIconImageAppearance:(id)a3
{
  id v6 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    id v4 = (SBHIconImageAppearance *)[v6 copy];
    overrideIconImageAppearance = self->_overrideIconImageAppearance;
    self->_overrideIconImageAppearance = v4;

    [(SBIconListView *)self->_iconListView setOverrideIconImageAppearance:v6];
  }
}

- (void)setOverrideIconImageStyleConfiguration:(id)a3
{
  id v6 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    id v4 = (SBHIconImageStyleConfiguration *)[v6 copy];
    overrideIconImageStyleConfiguration = self->_overrideIconImageStyleConfiguration;
    self->_overrideIconImageStyleConfiguration = v4;

    [(SBIconListView *)self->_iconListView setOverrideIconImageStyleConfiguration:v6];
  }
}

- (id)nonEditingStatusBarHidingReason
{
  return @"SBHStackConfigurationPresentedReason";
}

- (BOOL)hidesPresenterTitledButtons
{
  return 1;
}

- (NSMutableDictionary)userInfo
{
  userInfo = self->_userInfo;
  if (!userInfo)
  {
    id v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    BOOL v5 = self->_userInfo;
    self->_userInfo = v4;

    userInfo = self->_userInfo;
  }
  return userInfo;
}

- (unint64_t)presenterType
{
  return 2;
}

- (BOOL)isDisplayingEditingButtons
{
  return self->_needsAddButton || self->_needsDoneButton;
}

- (void)setSuppressesEditingStateForListView:(BOOL)a3
{
  if (self->_suppressesEditingStateForListView != a3)
  {
    self->_suppressesEditingStateForListView = a3;
    [(SBHStackConfigurationViewController *)self _updateEditingStateAnimated:1];
  }
}

- (void)setTitledButtonsAlpha:(double)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (self->_titledButtonsAlpha != a3)
  {
    self->_titledButtonsAlpha = a3;
    BOOL v5 = SBLogIcon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 134349056;
      double v7 = a3;
      _os_log_impl(&dword_1D7F0A000, v5, OS_LOG_TYPE_DEFAULT, "SBHStackConfigurationViewController setTitledButtonsAlpha: %{public}f", (uint8_t *)&v6, 0xCu);
    }

    [(SBTitledHomeScreenButton *)self->_doneButton setAlpha:a3];
    [(SBTitledHomeScreenButton *)self->_addButton setAlpha:a3];
  }
}

- (SBIconView)sourceIconView
{
  return self->_stackIconView;
}

- (UIView)widgetContentContainerView
{
  return self->_contentView;
}

- (NSSet)materialViews
{
  objc_super v3 = [MEMORY[0x1E4F1CA80] set];
  objc_msgSend(v3, "bs_safeAddObject:", self->_backgroundMaterialView);
  return (NSSet *)v3;
}

- (NSSet)fadingViews
{
  objc_super v3 = [MEMORY[0x1E4F1CA80] set];
  [v3 addObject:self->_backgroundDimmingView];
  id v4 = [(CCUILabeledRoundButtonViewController *)self->_smartRotateButtonViewController view];
  [v3 addObject:v4];

  BOOL v5 = [(CCUILabeledRoundButtonViewController *)self->_suggestionsButtonViewController view];
  [v3 addObject:v5];

  int v6 = [(SBHStackConfigurationViewController *)self presenter];
  double v7 = v6;
  if (!v6 || ([v6 isDisplayingEditingButtons] & 1) == 0)
  {
    uint64_t v8 = [(SBHStackConfigurationViewController *)self doneButton];
    objc_msgSend(v3, "bs_safeAddObject:", v8);

    v9 = [(SBHStackConfigurationViewController *)self addButton];
    objc_msgSend(v3, "bs_safeAddObject:", v9);
  }
  return (NSSet *)v3;
}

- (NSSet)widgetBackgroundViews
{
  objc_super v3 = [MEMORY[0x1E4F1CA80] set];
  iconListView = self->_iconListView;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __60__SBHStackConfigurationViewController_widgetBackgroundViews__block_invoke;
  v7[3] = &unk_1E6AAD830;
  id v5 = v3;
  id v8 = v5;
  [(SBIconListView *)iconListView enumerateDisplayedIconViewsUsingBlock:v7];

  return (NSSet *)v5;
}

void __60__SBHStackConfigurationViewController_widgetBackgroundViews__block_invoke(uint64_t a1, void *a2)
{
  objc_super v3 = [a2 customIconImageViewController];
  uint64_t v4 = objc_opt_class();
  id v9 = v3;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      id v5 = v9;
    }
    else {
      id v5 = 0;
    }
  }
  else
  {
    id v5 = 0;
  }
  id v6 = v5;

  double v7 = *(void **)(a1 + 32);
  id v8 = [v6 backgroundView];

  objc_msgSend(v7, "bs_safeAddObject:", v8);
}

- (NSSet)apertureBackgroundViews
{
  return [(SBHStackConfigurationApertureView *)self->_apertureView backgroundViews];
}

- (UIView)widgetStackMatchingBackgroundView
{
  return [(SBHStackConfigurationApertureView *)self->_apertureView widgetStackMatchingBackgroundView];
}

- (UIView)visiblyActiveDataSourceSnapshotView
{
  objc_super v3 = [(SBHStackConfigurationViewController *)self visiblyActiveDataSource];
  uint64_t v4 = v3;
  if (!v3) {
    goto LABEL_5;
  }
  id v5 = &v15;
  uint64_t v15 = 0;
  double v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__8;
  v19 = __Block_byref_object_dispose__8;
  id v20 = 0;
  iconListView = self->_iconListView;
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  uint64_t v11 = __74__SBHStackConfigurationViewController_visiblyActiveDataSourceSnapshotView__block_invoke;
  uint64_t v12 = &unk_1E6AAD6B8;
  id v13 = v3;
  v14 = &v15;
  [(SBIconListView *)iconListView enumerateDisplayedIconViewsUsingBlock:&v9];
  uint64_t v7 = v16[5];
  if (v7)
  {
    objc_msgSend((id)v16[5], "iconImageSnapshotView", v9, v10, v11, v12);
    id v5 = (uint64_t *)objc_claimAutoreleasedReturnValue();
    [v5 setClipsToBounds:1];
  }

  _Block_object_dispose(&v15, 8);
  if (!v7) {
LABEL_5:
  }
    id v5 = 0;

  return (UIView *)v5;
}

void __74__SBHStackConfigurationViewController_visiblyActiveDataSourceSnapshotView__block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v11 = a2;
  id v6 = [v11 icon];
  if ([v6 isWidgetIcon])
  {
    uint64_t v7 = [v6 activeDataSource];
    id v8 = [v7 uniqueIdentifier];
    uint64_t v9 = [*(id *)(a1 + 32) uniqueIdentifier];
    int v10 = [v8 isEqualToString:v9];

    if (v10)
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
      *a3 = 1;
    }
  }
}

- (void)configureWithStackLayoutMetrics:(SBHStackLayoutMetrics *)a3
{
  long long v5 = *(_OWORD *)&a3->var1.height;
  v34[0] = *(_OWORD *)&a3->var0;
  v34[1] = v5;
  long long v6 = *(_OWORD *)&a3->var4;
  v34[2] = *(_OWORD *)&a3->var2.y;
  v34[3] = v6;
  v33[0] = SBHStackLayoutMetricsUnspecified;
  v33[1] = *(_OWORD *)&qword_1D81E8010;
  v33[2] = xmmword_1D81E8020;
  v33[3] = *(_OWORD *)&qword_1D81E8030;
  BOOL v7 = SBHStackLayoutMetricsEqualToMetrics((double *)v34, (double *)v33);
  if (v7)
  {
    [(SBHStackConfigurationViewController *)self _expandedPageControlOutset];
    double var3 = 1.0;
  }
  else
  {
    double var3 = a3->var3;
    double var5 = a3->var5;
  }
  [(NSLayoutConstraint *)self->_pageControlOutsetConstraint setConstant:var5];
  double var4 = 1.0;
  if (!v7) {
    double var4 = a3->var4;
  }
  [(UIPageControl *)self->_pageControl setAlpha:var4];
  [(SBHStackConfigurationViewController *)self _setPageControlScale:var3];
  double var0 = a3->var0;
  [(SBHStackConfigurationViewController *)self _iconContentScale];
  double width = SBHSizeScaled(self->_scaledIconSpacing.width, self->_scaledIconSpacing.height, var0 / v12);
  if (v7)
  {
    double width = self->_scaledIconSpacing.width;
    double height = self->_scaledIconSpacing.height;
  }
  -[SBIconListView setIconSpacing:](self->_iconListView, "setIconSpacing:", width, height);
  iconListView = self->_iconListView;
  if (v7)
  {
    [(SBHStackConfigurationViewController *)self _iconContentScale];
    -[SBIconListView setIconContentScale:](iconListView, "setIconContentScale:");
    BOOL v16 = [(SBHStackConfigurationViewController *)self _shouldUseConcentricCornersWhenExpanded];
  }
  else
  {
    [(SBIconListView *)iconListView setIconContentScale:a3->var0];
    BOOL v16 = 1;
  }
  [(SBHStackConfigurationApertureView *)self->_apertureView setUsesConcentricCorners:v16];
  [(SBHStackConfigurationViewController *)self _stableApertureSize];
  double v32 = v17;
  double v19 = v18;
  double v21 = a3->var1.width;
  double v20 = a3->var1.height;
  [(NSLayoutConstraint *)self->_apertureHeightConstraint multiplier];
  double v23 = v22;
  double v24 = 0.0;
  double v25 = 0.0;
  double v26 = 0.0;
  double v27 = 0.0;
  if (!v7)
  {
    double v26 = v20 - v19;
    double v25 = v21 - v32;
    double x = a3->var2.x;
    [(SBHStackConfigurationApertureView *)self->_apertureView center];
    double v24 = x - v29;
    double y = a3->var2.y;
    [(SBHStackConfigurationApertureView *)self->_apertureView center];
    double v27 = y - v31;
  }
  [(NSLayoutConstraint *)self->_apertureSizeConstraint setConstant:v25];
  [(NSLayoutConstraint *)self->_apertureHeightConstraint setConstant:v26 - v25 * v23];
  [(NSLayoutConstraint *)self->_apertureCenterXConstraint setConstant:v24];
  [(NSLayoutConstraint *)self->_apertureCenterYConstraint setConstant:v27];
  [(SBHStackConfigurationApertureView *)self->_apertureView layoutIfNeeded];
}

- (void)setScrollPosition:(unint64_t)a3
{
  if (self->_scrollPositionNeed != a3)
  {
    self->_scrollPositionNeed = a3;
    id v3 = [(SBHStackConfigurationViewController *)self view];
    [v3 setNeedsLayout];
  }
}

- (void)_setupContentViewWithContentFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v24[4] = *MEMORY[0x1E4F143B8];
  if (a3.size.width == *MEMORY[0x1E4F1DB30] && a3.size.height == *(double *)(MEMORY[0x1E4F1DB30] + 8)) {
    NSLog(&cfstr_CanTSetupWithA.isa, a2);
  }
  uint64_t v9 = [(UIView *)self->_contentView superview];
  int v10 = self->_contentView;
  [(UIView *)v10 setTranslatesAutoresizingMaskIntoConstraints:0];
  double v20 = (void *)MEMORY[0x1E4F28DC8];
  double v23 = [(UIView *)v10 widthAnchor];
  double v22 = [v23 constraintEqualToConstant:width];
  v24[0] = v22;
  id v11 = [(UIView *)v10 heightAnchor];
  double v12 = [v11 constraintEqualToConstant:height];
  v24[1] = v12;
  id v13 = [(UIView *)v10 topAnchor];
  double v21 = v9;
  v14 = [v9 topAnchor];
  uint64_t v15 = [v13 constraintEqualToAnchor:v14 constant:y];
  v24[2] = v15;
  BOOL v16 = [(UIView *)v10 leftAnchor];
  double v17 = [v9 leftAnchor];
  double v18 = [v16 constraintEqualToAnchor:v17 constant:x];
  v24[3] = v18;
  double v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:4];
  [v20 activateConstraints:v19];
}

- (void)_setupBackgroundInContainer:(id)a3
{
  v45[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v5 = [(SBHStackConfigurationViewController *)self traitCollection];
  BOOL v6 = [v5 userInterfaceStyle] == 1;

  BOOL v7 = SBHBundle();
  id v8 = [MEMORY[0x1E4FB1618] systemBlueColor];
  uint64_t v9 = self->_configuration;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __67__SBHStackConfigurationViewController__setupBackgroundInContainer___block_invoke;
  aBlock[3] = &unk_1E6AB0750;
  id v39 = v9;
  id v40 = v7;
  BOOL v43 = v6;
  id v41 = v8;
  v42 = self;
  id v37 = v8;
  id v36 = v7;
  objc_super v35 = v9;
  v34 = (void (**)(void *, uint64_t))_Block_copy(aBlock);
  v34[2](v34, 1);
  int v10 = (CCUILabeledRoundButtonViewController *)objc_claimAutoreleasedReturnValue();
  v34[2](v34, 0);
  id v11 = (CCUILabeledRoundButtonViewController *)objc_claimAutoreleasedReturnValue();
  smartRotateButtonViewController = self->_smartRotateButtonViewController;
  self->_smartRotateButtonViewController = v10;
  v33 = v10;

  suggestionsButtonViewController = self->_suggestionsButtonViewController;
  self->_suggestionsButtonViewController = v11;
  double v32 = v11;

  [(SBHStackConfigurationViewController *)self _updateButtonSubtitleForSmartRotate:1 animated:0];
  [(SBHStackConfigurationViewController *)self _updateButtonSubtitleForSmartRotate:0 animated:0];
  double v31 = [[SBHStackConfigurationBackgroundViewController alloc] initWithNibName:0 bundle:0];
  [(SBHStackConfigurationViewController *)self bs_addChildViewController:v31 withSuperview:v4];
  v45[0] = v33;
  v45[1] = v32;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:2];
  [(SBHStackConfigurationBackgroundViewController *)v31 setFooterButtons:v14];

  uint64_t v15 = [(SBHStackConfigurationBackgroundViewController *)v31 view];
  [v15 setTranslatesAutoresizingMaskIntoConstraints:0];
  double v25 = (void *)MEMORY[0x1E4F28DC8];
  v30 = [v15 topAnchor];
  double v29 = [v4 topAnchor];
  v28 = [v30 constraintEqualToAnchor:v29];
  v44[0] = v28;
  double v27 = [v15 bottomAnchor];
  double v26 = [v4 bottomAnchor];
  BOOL v16 = [v27 constraintEqualToAnchor:v26];
  v44[1] = v16;
  double v17 = [v15 leadingAnchor];
  double v18 = [v4 leadingAnchor];
  double v19 = [v17 constraintEqualToAnchor:v18];
  v44[2] = v19;
  double v20 = [v15 trailingAnchor];
  double v21 = [v4 trailingAnchor];

  double v22 = [v20 constraintEqualToAnchor:v21];
  v44[3] = v22;
  double v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:4];
  [v25 activateConstraints:v23];

  backgroundViewController = self->_backgroundViewController;
  self->_backgroundViewController = v31;
}

id __67__SBHStackConfigurationViewController__setupBackgroundInContainer___block_invoke(uint64_t a1, int a2)
{
  id v4 = @"suggestion-icon";
  if (a2)
  {
    id v4 = @"ranking-icon";
    long long v5 = @"STACK_CONFIGURATION_ALLOW_SUGGESTIONS";
  }
  else
  {
    long long v5 = @"STACK_CONFIGURATION_ALLOW_EXTERNAL_SUGGESTIONS";
  }
  BOOL v6 = v4;
  BOOL v7 = v5;
  id v8 = *(void **)(a1 + 32);
  if (a2) {
    uint64_t v9 = [v8 allowsSuggestions];
  }
  else {
    uint64_t v9 = [v8 allowsExternalSuggestions];
  }
  uint64_t v10 = v9;
  id v11 = sel__didToggleSmartRotate_;
  uint64_t v28 = 0;
  double v29 = &v28;
  uint64_t v30 = 0x2050000000;
  double v12 = (void *)getCCUICAPackageDescriptionClass_softClass;
  uint64_t v31 = getCCUICAPackageDescriptionClass_softClass;
  if (!getCCUICAPackageDescriptionClass_softClass)
  {
    uint64_t v23 = MEMORY[0x1E4F143A8];
    uint64_t v24 = 3221225472;
    double v25 = __getCCUICAPackageDescriptionClass_block_invoke;
    double v26 = &unk_1E6AAD648;
    double v27 = &v28;
    __getCCUICAPackageDescriptionClass_block_invoke((uint64_t)&v23);
    double v12 = (void *)v29[3];
  }
  id v13 = v12;
  _Block_object_dispose(&v28, 8);
  v14 = [v13 descriptionForPackageNamed:v6 inBundle:*(void *)(a1 + 40)];
  [v14 setFlipsForRightToLeftLayoutDirection:1];
  uint64_t v28 = 0;
  double v29 = &v28;
  uint64_t v30 = 0x2050000000;
  uint64_t v15 = (void *)getCCUILabeledRoundButtonViewControllerClass_softClass;
  uint64_t v31 = getCCUILabeledRoundButtonViewControllerClass_softClass;
  if (!getCCUILabeledRoundButtonViewControllerClass_softClass)
  {
    uint64_t v23 = MEMORY[0x1E4F143A8];
    uint64_t v24 = 3221225472;
    double v25 = __getCCUILabeledRoundButtonViewControllerClass_block_invoke;
    double v26 = &unk_1E6AAD648;
    double v27 = &v28;
    __getCCUILabeledRoundButtonViewControllerClass_block_invoke((uint64_t)&v23);
    uint64_t v15 = (void *)v29[3];
  }
  if (!a2) {
    id v11 = sel__didToggleSuggestions_;
  }
  BOOL v16 = v15;
  _Block_object_dispose(&v28, 8);
  double v17 = (void *)[[v16 alloc] initWithGlyphPackageDescription:v14 highlightColor:*(void *)(a1 + 48) useLightStyle:*(unsigned __int8 *)(a1 + 64)];
  double v18 = [v17 button];
  [v18 addTarget:*(void *)(a1 + 56) action:v11 forControlEvents:64];

  [v17 setGlyphState:@"State 1"];
  double v19 = SBHBundle();
  double v20 = [v19 localizedStringForKey:v7 value:&stru_1F2FA0300 table:@"SpringBoardHome"];
  [v17 setTitle:v20];

  [v17 setLabelsVisible:1];
  [v17 setEnabled:v10];
  double v21 = [v17 button];
  [v21 layoutIfNeeded];

  return v17;
}

- (int64_t)_iconViewComponentBackgroundViewType
{
  id v3 = [(SBHStackConfigurationViewController *)self delegate];
  if (v3 && (objc_opt_respondsToSelector() & 1) != 0) {
    int64_t v4 = [v3 stackConfigurationViewControllerIconViewComponentBackgroundViewType:self];
  }
  else {
    int64_t v4 = 4;
  }

  return v4;
}

- (void)_setupApertureViewInContainer:(id)a3
{
  v35[4] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int64_t v5 = [(SBHStackConfigurationViewController *)self _iconViewComponentBackgroundViewType];
  BOOL v6 = [SBHStackConfigurationApertureView alloc];
  BOOL v7 = -[SBHStackConfigurationApertureView initWithFrame:iconViewBackgroundType:](v6, "initWithFrame:iconViewBackgroundType:", v5, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(SBHStackConfigurationApertureView *)v7 setUsesConcentricCorners:[(SBHStackConfigurationViewController *)self _shouldUseConcentricCornersWhenExpanded]];
  [(SBHStackConfigurationApertureView *)v7 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(SBHStackConfigurationApertureView *)v7 setClipsToBounds:1];
  [(SBHStackConfigurationViewController *)self contentBoundingFrame];
  if (v8 <= v9) {
    double v10 = v8;
  }
  else {
    double v10 = v9;
  }
  double v11 = v10 * 0.744 / v8;
  double v12 = [(SBHStackConfigurationApertureView *)v7 widthAnchor];
  id v13 = [v4 widthAnchor];
  v14 = [v12 constraintEqualToAnchor:v13 multiplier:v11];

  uint64_t v15 = [(SBHStackConfigurationApertureView *)v7 heightAnchor];
  BOOL v16 = [(SBHStackConfigurationApertureView *)v7 widthAnchor];
  double v17 = [v15 constraintEqualToAnchor:v16 multiplier:1.0];

  double v18 = [(SBHStackConfigurationApertureView *)v7 centerXAnchor];
  double v19 = [v4 centerXAnchor];
  double v20 = [v18 constraintEqualToAnchor:v19];

  double v21 = [(SBHStackConfigurationApertureView *)v7 centerYAnchor];
  double v22 = [v4 centerYAnchor];
  uint64_t v23 = [v21 constraintEqualToAnchor:v22];

  [v4 addSubview:v7];
  uint64_t v24 = (void *)MEMORY[0x1E4F28DC8];
  v35[0] = v20;
  v35[1] = v23;
  v35[2] = v17;
  v35[3] = v14;
  double v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:4];
  [v24 activateConstraints:v25];

  apertureCenterXConstraint = self->_apertureCenterXConstraint;
  self->_apertureCenterXConstraint = v20;
  double v27 = v20;

  apertureCenterYConstraint = self->_apertureCenterYConstraint;
  self->_apertureCenterYConstraint = v23;
  double v29 = v23;

  apertureHeightConstraint = self->_apertureHeightConstraint;
  self->_apertureHeightConstraint = v17;
  uint64_t v31 = v17;

  apertureSizeConstraint = self->_apertureSizeConstraint;
  self->_apertureSizeConstraint = v14;
  v33 = v14;

  apertureView = self->_apertureView;
  self->_apertureView = v7;
}

- (void)_setupScrollViewInContainer:(id)a3
{
  v24[4] = *MEMORY[0x1E4F143B8];
  id v4 = (objc_class *)MEMORY[0x1E4F4F8E0];
  id v5 = a3;
  id v6 = [v4 alloc];
  [v5 bounds];
  BOOL v7 = (BSUIScrollView *)objc_msgSend(v6, "initWithFrame:");
  [(BSUIScrollView *)v7 setContentInsetAdjustmentBehavior:2];
  [(BSUIScrollView *)v7 setDecelerationRate:*MEMORY[0x1E4FB2EE8]];
  [(BSUIScrollView *)v7 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(BSUIScrollView *)v7 setShowsHorizontalScrollIndicator:0];
  [(BSUIScrollView *)v7 setShowsVerticalScrollIndicator:0];
  [(BSUIScrollView *)v7 setAlwaysBounceVertical:1];
  [(BSUIScrollView *)v7 setClipsToBounds:0];
  [(BSUIScrollView *)v7 setDelegate:self];
  [v5 addSubview:v7];
  double v18 = (void *)MEMORY[0x1E4F28DC8];
  double v22 = [v5 topAnchor];
  double v21 = [(BSUIScrollView *)v7 topAnchor];
  double v20 = [v22 constraintEqualToAnchor:v21];
  v24[0] = v20;
  double v19 = [v5 bottomAnchor];
  double v8 = [(BSUIScrollView *)v7 bottomAnchor];
  double v9 = [v19 constraintEqualToAnchor:v8];
  v24[1] = v9;
  double v10 = [v5 leadingAnchor];
  double v11 = [(BSUIScrollView *)v7 leadingAnchor];
  double v12 = [v10 constraintEqualToAnchor:v11];
  v24[2] = v12;
  id v13 = [v5 trailingAnchor];

  v14 = [(BSUIScrollView *)v7 trailingAnchor];
  uint64_t v15 = [v13 constraintEqualToAnchor:v14];
  v24[3] = v15;
  BOOL v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:4];
  [v18 activateConstraints:v16];

  scrollView = self->_scrollView;
  self->_scrollView = v7;
}

- (void)_setupIconListViewCenteredInScrollView:(id)a3
{
  uint64_t v113 = *MEMORY[0x1E4F143B8];
  id v95 = a3;
  id v4 = [(SBIconView *)self->_stackIconView icon];
  id v5 = [v4 gridSizeClass];

  id v6 = [(SBHStackConfiguration *)self->_configuration dataSources];
  v92 = [(SBIconView *)self->_stackIconView location];
  BOOL v7 = [(SBIconListLayoutProvider *)self->_listLayoutProvider layoutForIconLocation:"layoutForIconLocation:"];
  [v7 iconImageInfoForGridSizeClass:v5];
  CGFloat v9 = v8;
  double v11 = v10;
  double v90 = v13;
  double v91 = v12;
  double v14 = SBHIconListLayoutEditingAnimationStrengthForGridSizeClass(v7, v5);
  [(SBHStackConfigurationViewController *)self _iconContentScale];
  double v16 = v15;
  double v17 = (double *)MEMORY[0x1E4F1DB30];
  double v18 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v19 = [v18 userInterfaceIdiom];

  v94 = v7;
  if ((v19 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    double v20 = SBHIconListLayoutIconImageInfoForGridSizeClass(v7, @"SBHIconGridSizeClassSmall");
    double v21 = SBHIconListLayoutIconImageInfoForGridSizeClass(v7, @"SBHIconGridSizeClassMedium") + v20 * -2.0;
    CGFloat v22 = v11;
    if (objc_opt_respondsToSelector())
    {
      if ([(SBIconViewDelegate *)self->_defaultIconViewDelegate iconViewDisplaysLabel:self->_stackIconView])double v23 = v21 + v21; {
      else
      }
        double v23 = v21;
    }
    else
    {
      double v23 = v21 + v21;
    }
  }
  else
  {
    CGFloat v22 = v11;
    uint64_t v24 = [(SBIconListLayoutProvider *)self->_listLayoutProvider layoutForIconLocation:@"SBIconLocationRoot"];
    SBHIconListLayoutListIconSpacing(v24, 1);
    double v23 = v25;
  }
  double v89 = *v17;
  double v26 = v14 / v16;
  [(SBHStackConfigurationViewController *)self _iconContentScale];
  double v28 = v23 * v27;
  v93 = objc_alloc_init(SBHIconGridSizeClassSizeMap);
  SBHIconGridSize v29 = (SBHIconGridSize)[(SBHIconGridSizeClassSizeMap *)v93 gridSizeForGridSizeClass:v5];
  unsigned __int16 columns = v29.columns;
  uint64_t v31 = HIWORD(*(unsigned int *)&v29);
  unint64_t v32 = [(SBHWidgetSettings *)self->_widgetSettings maximumWidgetsInAStack];
  uint64_t v33 = columns;
  unint64_t v34 = v32 * v31;
  objc_super v35 = [[SBIconListModel alloc] initWithFolder:0 gridSize:columns | ((unsigned __int16)v32 << 16)];
  [(SBIconListModel *)v35 setDelegate:self];
  long long v107 = 0u;
  long long v108 = 0u;
  long long v106 = 0u;
  long long v105 = 0u;
  id v36 = v6;
  uint64_t v37 = [v36 countByEnumeratingWithState:&v105 objects:v112 count:16];
  if (v37)
  {
    uint64_t v38 = v37;
    uint64_t v39 = *(void *)v106;
    do
    {
      for (uint64_t i = 0; i != v38; ++i)
      {
        if (*(void *)v106 != v39) {
          objc_enumerationMutation(v36);
        }
        id v41 = [(SBHStackConfigurationViewController *)self _unraveledWidgetIconForDataSource:*(void *)(*((void *)&v105 + 1) + 8 * i) withGridSizeClass:v5];
        [(SBIconListModel *)v35 addIcon:v41];
      }
      uint64_t v38 = [v36 countByEnumeratingWithState:&v105 objects:v112 count:16];
    }
    while (v38);
  }

  [(SBIconListModel *)v35 addListObserver:self];
  v42 = [(SBIconView *)self->_stackIconView icon];
  [v42 addObserver:self];

  double v43 = *MEMORY[0x1E4FB2848];
  double v44 = *(double *)(MEMORY[0x1E4FB2848] + 8);
  double v45 = *(double *)(MEMORY[0x1E4FB2848] + 16);
  double v46 = *(double *)(MEMORY[0x1E4FB2848] + 24);
  v47 = objc_alloc_init(SBIconListGridLayoutConfiguration);
  [(SBIconListGridLayoutConfiguration *)v47 setNumberOfPortraitRows:v34];
  [(SBIconListGridLayoutConfiguration *)v47 setNumberOfPortraitColumns:v33];
  -[SBIconListGridLayoutConfiguration setPortraitLayoutInsets:](v47, "setPortraitLayoutInsets:", v43, v44, v45, v46);
  [(SBIconListGridLayoutConfiguration *)v47 setIconGridSizeClassSizes:v93];
  v99[0] = MEMORY[0x1E4F143A8];
  v99[1] = 3221225472;
  v99[2] = __78__SBHStackConfigurationViewController__setupIconListViewCenteredInScrollView___block_invoke;
  v99[3] = &unk_1E6AB0778;
  v48 = v47;
  v100 = v48;
  CGFloat v101 = v9;
  CGFloat v102 = v22;
  double v103 = v91;
  double v104 = v90;
  SBHEnumerateIconGridSizeClasses(v99);
  v96[0] = MEMORY[0x1E4F143A8];
  v96[1] = 3221225472;
  v96[2] = __78__SBHStackConfigurationViewController__setupIconListViewCenteredInScrollView___block_invoke_2;
  v96[3] = &unk_1E6AB07A0;
  v49 = v48;
  v97 = v49;
  double v98 = v26;
  SBHEnumerateIconGridSizeClasses(v96);
  v86 = [[SBHIconGridSizeClassSet alloc] initWithGridSizeClass:v5];
  -[SBIconListGridLayoutConfiguration setSupportedIconGridSizeClasses:](v49, "setSupportedIconGridSizeClasses:");
  v87 = v49;
  v50 = [[SBIconListGridLayout alloc] initWithLayoutConfiguration:v49];
  uint64_t v51 = [v94 iconAccessoryVisualConfiguration];
  v52 = [(SBIconListGridLayout *)v50 layoutConfiguration];
  v84 = (void *)v51;
  [v52 setIconAccessoryVisualConfiguration:v51];

  v53 = [SBHCustomIconListLayoutProvider alloc];
  v110 = @"SBIconLocationStackConfiguration";
  v111 = v50;
  v85 = v50;
  v54 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v111 forKeys:&v110 count:1];
  uint64_t v55 = [(SBHCustomIconListLayoutProvider *)v53 initWithListLayouts:v54];

  v83 = (void *)v55;
  v56 = [(SBIconListView *)[SBHStackConfigurationIconListView alloc] initWithModel:v35 layoutProvider:v55 iconLocation:@"SBIconLocationStackConfiguration" orientation:1 iconViewProvider:self->_iconViewProvider];
  [(SBHStackConfigurationIconListView *)v56 setIconViewDelegate:self];
  [(SBIconListView *)v56 hideAllIcons];
  [(SBHStackConfigurationViewController *)self _iconContentScale];
  -[SBIconListView setIconContentScale:](v56, "setIconContentScale:");
  [(SBIconListView *)v56 setAutomaticallyAdjustsLayoutMetricsToFit:0];
  -[SBIconListView setIconSpacing:](v56, "setIconSpacing:", v89, v28);
  v57 = [(SBIconView *)self->_stackIconView legibilitySettings];
  [(SBIconListView *)v56 setLegibilitySettings:v57];

  v58 = [(SBHStackConfigurationViewController *)self overrideIconImageAppearance];
  [(SBIconListView *)v56 setOverrideIconImageAppearance:v58];

  v59 = [(SBHStackConfigurationViewController *)self overrideIconImageStyleConfiguration];
  [(SBIconListView *)v56 setOverrideIconImageStyleConfiguration:v59];

  v60 = [(SBHStackConfigurationViewController *)self delegate];
  v88 = v60;
  if (objc_opt_respondsToSelector())
  {
    if ([v60 stackConfigurationViewControllerShouldDisallowLabelArea:self]) {
      uint64_t v61 = 18;
    }
    else {
      uint64_t v61 = 16;
    }
  }
  else
  {
    uint64_t v61 = 16;
  }
  [(SBIconListView *)v56 setIconViewConfigurationOptions:v61];
  [(SBIconListView *)v56 setBoundsSizeTracksContentSize:1];
  [(SBIconListView *)v56 setDragDelegate:self->_iconDragManager];
  [(SBHStackConfigurationIconListView *)v56 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v95 addSubview:v56];
  v76 = (void *)MEMORY[0x1E4F28DC8];
  v82 = [(SBHStackConfigurationIconListView *)v56 topAnchor];
  v81 = [v95 topAnchor];
  v80 = [v82 constraintEqualToAnchor:v81];
  v109[0] = v80;
  v79 = [(SBHStackConfigurationIconListView *)v56 bottomAnchor];
  v78 = [v95 bottomAnchor];
  v77 = [v79 constraintEqualToAnchor:v78];
  v109[1] = v77;
  v75 = [(SBHStackConfigurationIconListView *)v56 centerXAnchor];
  v74 = [v95 centerXAnchor];
  v73 = [v75 constraintEqualToAnchor:v74];
  v109[2] = v73;
  v72 = [(SBHStackConfigurationIconListView *)v56 trailingAnchor];
  v71 = [v95 trailingAnchor];
  v70 = [v72 constraintLessThanOrEqualToAnchor:v71];
  v109[3] = v70;
  v62 = [(SBHStackConfigurationIconListView *)v56 leadingAnchor];
  v63 = [v95 leadingAnchor];
  v64 = [v62 constraintGreaterThanOrEqualToAnchor:v63];
  v109[4] = v64;
  v65 = [MEMORY[0x1E4F1C978] arrayWithObjects:v109 count:5];
  [v76 activateConstraints:v65];

  [(SBIconListView *)v56 intrinsicContentSize];
  objc_msgSend(v95, "setContentSize:");
  self->_iconImageInfo.size.double width = v9;
  self->_iconImageInfo.size.double height = v22;
  self->_iconImageInfo.scale = v91;
  self->_iconImageInfo.continuousCornerRadius = v90;
  self->_scaledIconSpacing.double width = v89;
  self->_scaledIconSpacing.double height = v28;
  objc_storeStrong((id *)&self->_iconListView, v56);
  if ([v94 conformsToProtocol:&unk_1F30556F8])
  {
    v66 = [[SBHCustomIconListLayout alloc] initWithBaseListLayout:v94];
    customLayout = self->_customLayout;
    self->_customLayout = v66;

    [(SBIconListView *)self->_iconListView setLayoutDelegate:self->_customLayout];
  }
  rootListModel = self->_rootListModel;
  self->_rootListModel = v35;
  v69 = v35;
}

uint64_t __78__SBHStackConfigurationViewController__setupIconListViewCenteredInScrollView___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setIconImageInfo:forGridSizeClass:", a2, *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

uint64_t __78__SBHStackConfigurationViewController__setupIconListViewCenteredInScrollView___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setEditingAnimationStrength:a2 forGridSizeClass:*(double *)(a1 + 40)];
}

- (void)_setupPageControlInContainer:(id)a3
{
  v26[2] = *MEMORY[0x1E4F143B8];
  id v4 = (objc_class *)MEMORY[0x1E4FB1A40];
  id v5 = a3;
  id v6 = (UIPageControl *)objc_alloc_init(v4);
  [(UIPageControl *)v6 addTarget:self action:sel__didChangePageControlPage_ forControlEvents:4096];
  [(UIPageControl *)v6 setAllowsContinuousInteraction:0];
  [(UIPageControl *)v6 setHidesForSinglePage:1];
  [(UIPageControl *)v6 setDirection:3];
  BOOL v7 = [(SBIconView *)self->_stackIconView legibilitySettings];
  double v8 = [v7 primaryColor];
  [(UIPageControl *)v6 setCurrentPageIndicatorTintColor:v8];

  CGFloat v9 = [v7 secondaryColor];
  [(UIPageControl *)v6 setPageIndicatorTintColor:v9];

  double v10 = [(SBHStackConfiguration *)self->_configuration dataSources];
  uint64_t v11 = [v10 count];

  [(UIPageControl *)v6 setNumberOfPages:v11];
  [(UIPageControl *)v6 _setPreferredNumberOfVisibleIndicators:[(SBHWidgetSettings *)self->_widgetSettings maximumWidgetsInAStack]];
  CGAffineTransformMakeScale(&v25, 1.0, 1.0);
  [(UIPageControl *)v6 setTransform:&v25];
  [(UIPageControl *)v6 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v5 addSubview:v6];

  double v12 = self->_apertureView;
  double v13 = [(UIPageControl *)v6 centerXAnchor];
  double v14 = [(SBHStackConfigurationApertureView *)v12 trailingAnchor];
  [(SBHStackConfigurationViewController *)self _expandedPageControlOutset];
  objc_msgSend(v13, "constraintEqualToAnchor:constant:", v14);
  double v15 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();

  double v16 = (void *)MEMORY[0x1E4F28DC8];
  double v17 = [(UIPageControl *)v6 centerYAnchor];
  double v18 = [(SBHStackConfigurationApertureView *)v12 centerYAnchor];
  uint64_t v19 = [v17 constraintEqualToAnchor:v18];
  v26[0] = v19;
  v26[1] = v15;
  double v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:2];
  [v16 activateConstraints:v20];

  pageControlOutsetConstraint = self->_pageControlOutsetConstraint;
  self->_pageControlOutsetConstraint = v15;
  CGFloat v22 = v15;

  pageControl = self->_pageControl;
  self->_pageControl = v6;
  uint64_t v24 = v6;
}

- (id)_unraveledWidgetIconForDataSource:(id)a3 withGridSizeClass:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  char v8 = objc_opt_respondsToSelector();
  CGFloat v9 = [SBWidgetIcon alloc];
  double v10 = v9;
  if (v8)
  {
    uint64_t v11 = [v7 uniqueIdentifier];
    double v12 = [(SBWidgetIcon *)v10 initWithLeafIdentifier:v11 applicationBundleID:0];
  }
  else
  {
    double v12 = [(SBLeafIcon *)v9 initWithUniqueLeafIdentifier];
  }
  [(SBLeafIcon *)v12 addIconDataSource:v7];

  [(SBIcon *)v12 setGridSizeClass:v6];
  [(SBLeafIcon *)v12 addObserver:self];
  return v12;
}

- (void)_setupTapToDismissGestureInView:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4FB1D38];
  id v5 = a3;
  id v6 = (id)[[v4 alloc] initWithTarget:self action:sel__didTapBackgroundView_];
  [v6 setDelegate:self];
  [v6 setDelaysTouchesBegan:0];
  [v6 setDelaysTouchesEnded:0];
  [v5 addGestureRecognizer:v6];
}

- (void)_setupLargeSizeLayoutAdjustmentsIfNecessary
{
  id v3 = [(SBIconView *)self->_stackIconView icon];
  uint64_t v24 = [v3 gridSizeClass];

  BOOL stackSizeIsSmall = self->_stackSizeIsSmall;
  if (v24 == @"SBHIconGridSizeClassMedium")
  {
    int v5 = 0;
    if (self->_stackSizeIsSmall) {
      goto LABEL_14;
    }
  }
  else
  {
    int v5 = -[__CFString isEqualToString:](v24, "isEqualToString:") ^ 1;
    if (stackSizeIsSmall) {
      goto LABEL_14;
    }
  }
  id v6 = self->_apertureView;
  double width = self->_iconImageInfo.size.width;
  double height = self->_iconImageInfo.size.height;
  [(SBHStackConfigurationViewController *)self contentBoundingFrame];
  double v10 = v9;
  [(SBHStackConfigurationViewController *)self _iconContentScale];
  double v12 = v11;
  double v13 = (width + v10) * 0.5;
  if (v12 < 0.9) {
    double v13 = width;
  }
  double v14 = v13 / v10;
  [(NSLayoutConstraint *)self->_apertureSizeConstraint setActive:0];
  double v15 = [(SBHStackConfigurationApertureView *)v6 widthAnchor];
  double v16 = [(SBHStackConfigurationApertureView *)v6 superview];
  double v17 = [v16 widthAnchor];
  double v18 = [v15 constraintEqualToAnchor:v17 multiplier:v14];

  [v18 setActive:1];
  objc_storeStrong((id *)&self->_apertureSizeConstraint, v18);
  if (v5)
  {
    [(NSLayoutConstraint *)self->_apertureHeightConstraint setActive:0];
    if (v24 == @"SBHIconGridSizeClassExtraLarge"
      || -[__CFString isEqualToString:](v24, "isEqualToString:"))
    {
      double v19 = (v10 * v14 - width * v12 + height * v12) / (v10 * v14);
    }
    else
    {
      double v19 = height / width;
    }
    double v20 = [(SBHStackConfigurationApertureView *)v6 heightAnchor];
    double v21 = [(SBHStackConfigurationApertureView *)v6 widthAnchor];
    CGFloat v22 = [v20 constraintEqualToAnchor:v21 multiplier:v19];

    [(NSLayoutConstraint *)v22 setActive:1];
    apertureHeightConstraint = self->_apertureHeightConstraint;
    self->_apertureHeightConstraint = v22;
  }
LABEL_14:
}

- (void)_setupEditingButtons
{
  if (self->_needsAddButton)
  {
    uint64_t v3 = objc_opt_class();
    id v4 = [(SBHStackConfigurationViewController *)self makeTitledButtonOfClass:v3];
    if (v3)
    {
      if (objc_opt_isKindOfClass()) {
        int v5 = v4;
      }
      else {
        int v5 = 0;
      }
    }
    else
    {
      int v5 = 0;
    }
    id v6 = v5;

    [v6 addTarget:self action:sel__didTapAddWidgetButton_ forControlEvents:0x2000];
    [v6 setAccessibilityIdentifier:@"stack-configuration-widget-add-button"];
    [(SBHStackConfigurationViewController *)self setAddButton:v6];
  }
  if (self->_needsDoneButton)
  {
    uint64_t v7 = objc_opt_class();
    char v8 = [(SBHStackConfigurationViewController *)self makeTitledButtonOfClass:v7];
    if (v7)
    {
      if (objc_opt_isKindOfClass()) {
        double v9 = v8;
      }
      else {
        double v9 = 0;
      }
    }
    else
    {
      double v9 = 0;
    }
    id v10 = v9;

    [v10 addTarget:self action:sel__didTapDoneButton_ forControlEvents:0x2000];
    [v10 setAccessibilityIdentifier:@"stack-configuration-done-button"];
    [(SBHStackConfigurationViewController *)self setDoneButton:v10];
  }
  [(SBHStackConfigurationViewController *)self _updateAddWidgetButtonOperabilityForDataSourceCount];
  [(SBHStackConfigurationViewController *)self _updateLayoutForEditButtons];
}

- (id)_newHomeScreenButtonBackgroundView
{
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)makeTitledButtonOfClass:(Class)a3
{
  id v5 = [(SBHStackConfigurationViewController *)self _newHomeScreenButtonBackgroundView];
  id v6 = [a3 alloc];
  uint64_t v7 = objc_msgSend(v6, "initWithFrame:backgroundView:", v5, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  char v8 = [v7 configuration];
  [(SBHRootFolderVisualConfiguration *)self->_rootFolderVisualConfiguration editModeButtonContentEdgeInsets];
  objc_msgSend(v8, "setContentInsets:");
  [v7 setConfiguration:v8];
  [(SBHRootFolderVisualConfiguration *)self->_rootFolderVisualConfiguration editModeButtonSize];
  objc_msgSend(v7, "setPreferredContentFittingSize:");
  double v9 = [v7 materialView];
  id v10 = [(SBIconView *)self->_stackIconView legibilitySettings];
  objc_msgSend(v9, "setLegibilityStyle:", objc_msgSend(v10, "style"));

  return v7;
}

- (void)_updateLayoutForEditButtons
{
  uint64_t v3 = [(SBHStackConfigurationViewController *)self view];
  [(UIView *)v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  [(SBHStackConfigurationViewController *)self contentBoundingFrame];
  BOOL v14 = v13 == v9 && v12 == v11;
  scalingView = v3;
  if (v14) {
    scalingView = self->_scalingView;
  }
  double v16 = scalingView;
  double v17 = [(SBHStackConfigurationViewController *)self doneButton];
  double v18 = [(SBHStackConfigurationViewController *)self addButton];
  double v19 = [v17 superview];

  if (v19 != v16) {
    [(UIView *)v16 addSubview:v17];
  }
  double v20 = [v18 superview];

  if (v20 != v16) {
    [(UIView *)v16 addSubview:v18];
  }
  long long v21 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
  long long v24 = *MEMORY[0x1E4F1DB28];
  long long v25 = v21;
  long long v22 = v24;
  long long v23 = v21;
  +[SBRootFolderView _editButtonLayoutFramesInBounds:forVisualConfiguration:withTranslationOffset:inRTL:doneButton:addWidgetButton:doneButtonFrame:addWidgetButtonFrame:](SBRootFolderView, "_editButtonLayoutFramesInBounds:forVisualConfiguration:withTranslationOffset:inRTL:doneButton:addWidgetButton:doneButtonFrame:addWidgetButtonFrame:", self->_rootFolderVisualConfiguration, objc_msgSend((id)*MEMORY[0x1E4FB2608], "userInterfaceLayoutDirection", v24, v21) == 1, v17, v18, &v22, &v24, v5, v7, v9, v11, 0.0);
  objc_msgSend(v17, "setFrame:", v22, v23);
  objc_msgSend(v18, "setFrame:", v24, v25);
}

- (id)draggingDelegateForIconView:(id)a3
{
  return self->_iconDragManager;
}

- (id)reuseDelegateForIconView:(id)a3
{
  return self->_defaultIconViewDelegate;
}

- (id)shortcutsDelegateForIconView:(id)a3
{
  return self->_defaultIconViewDelegate;
}

- (void)iconTapped:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 supportsConfigurationCard])
  {
    double v4 = SBLogIcon();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 138412290;
      id v6 = v3;
      _os_log_impl(&dword_1D7F0A000, v4, OS_LOG_TYPE_DEFAULT, "Starting configuration of icon within stack configuration due to tap: %@", (uint8_t *)&v5, 0xCu);
    }

    [v3 presentConfigurationCard];
  }
}

- (BOOL)iconShouldAllowCloseBoxTap:(id)a3
{
  return ![(SBIconDragManager *)self->_iconDragManager isTrackingActiveOrDroppingIconDrags];
}

- (void)iconCloseBoxTapped:(id)a3
{
  id v3 = a3;
  double v4 = [v3 icon];
  uint64_t v5 = [v4 displayName];

  id v6 = (void *)MEMORY[0x1E4FB1418];
  uint64_t v7 = NSString;
  double v8 = SBHBundle();
  double v9 = [v8 localizedStringForKey:@"REMOVE_WIDGET_TITLE_REMOVE_WITH_NAME" value:&stru_1F2FA0300 table:@"SpringBoardHome"];
  double v28 = (void *)v5;
  double v10 = objc_msgSend(v7, "stringWithFormat:", v9, v5);
  double v11 = NSString;
  double v12 = SBHBundle();
  double v13 = [v12 localizedStringForKey:@"REMOVE_WIDGET_BODY_REMOVE_DATA" value:&stru_1F2FA0300 table:@"SpringBoardHome"];
  BOOL v14 = objc_msgSend(v11, "stringWithFormat:", v13, v5);
  double v15 = [v6 alertControllerWithTitle:v10 message:v14 preferredStyle:1];

  double v16 = self->_iconListView;
  double v17 = (void *)MEMORY[0x1E4FB1410];
  double v18 = SBHBundle();
  double v19 = [v18 localizedStringForKey:@"REMOVE_WIDGET_BUTTON_REMOVE" value:&stru_1F2FA0300 table:@"SpringBoardHome"];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __58__SBHStackConfigurationViewController_iconCloseBoxTapped___block_invoke;
  v29[3] = &unk_1E6AB07C8;
  id v30 = v3;
  uint64_t v31 = v16;
  unint64_t v32 = self;
  double v20 = v16;
  id v21 = v3;
  long long v22 = [v17 actionWithTitle:v19 style:2 handler:v29];

  [v15 addAction:v22];
  long long v23 = (void *)MEMORY[0x1E4FB1410];
  long long v24 = [v21 icon];
  long long v25 = [v24 uninstallAlertCancelTitle];
  double v26 = [v23 actionWithTitle:v25 style:1 handler:0];

  [v15 addAction:v26];
  [v15 setPreferredAction:v22];
  [(SBHStackConfigurationViewController *)self presentViewController:v15 animated:1 completion:0];
}

void __58__SBHStackConfigurationViewController_iconCloseBoxTapped___block_invoke(uint64_t a1)
{
  BOOL v2 = *(void **)(a1 + 32);
  if (v2)
  {
    id v6 = [v2 icon];
    id v3 = [*(id *)(a1 + 40) model];
    [v3 removeIcon:v6];
    double v4 = [v6 activeDataSource];
    if ([*(id *)(a1 + 48) _widgetDataSourceIsSuggestion:v4])
    {
      uint64_t v5 = [*(id *)(a1 + 48) delegate];
      [v5 stackConfigurationViewController:*(void *)(a1 + 48) didRemoveSuggestedWidgetIcon:v6];
    }
    [*(id *)(a1 + 40) layoutIconsIfNeededWithAnimationType:0 options:1];
  }
}

- (BOOL)iconShouldAllowAccessoryViewTap:(id)a3
{
  return ![(SBIconDragManager *)self->_iconDragManager isTrackingActiveOrDroppingIconDrags];
}

- (void)iconAccessoryViewTapped:(id)a3
{
  id v4 = [a3 icon];
  if ([v4 isWidgetIcon])
  {
    [(SBHStackConfigurationViewController *)self _promoteWidgetIcon:v4];
    [(SBIconListView *)self->_iconListView layoutIconsIfNeededWithAnimationType:0 options:0];
  }
}

- (void)_promoteWidgetIcon:(id)a3
{
  id v8 = a3;
  id v4 = [v8 activeDataSource];
  uint64_t v5 = [(SBHStackConfigurationViewController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v6 = [(SBIconView *)self->_stackIconView icon];
    uint64_t v7 = [v5 stackConfigurationViewController:self promoteSuggestedWidget:v4 withinStack:v6];

    if (v7) {
      [v8 replaceIconDataSource:v4 withIconDataSource:v7];
    }
  }
}

- (BOOL)iconViewDisplaysLabel:(id)a3
{
  id v4 = a3;
  if (objc_opt_respondsToSelector()) {
    char v5 = [(SBIconViewDelegate *)self->_defaultIconViewDelegate iconViewDisplaysLabel:v4];
  }
  else {
    char v5 = 1;
  }

  return v5;
}

- (BOOL)iconViewDisplaysAccessories:(id)a3
{
  id v4 = [a3 icon];
  if ([v4 isWidgetIcon])
  {
    char v5 = [v4 activeDataSource];
    BOOL v6 = [(SBHStackConfigurationViewController *)self _widgetDataSourceIsSuggestion:v5];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)iconViewDisplaysCloseBox:(id)a3
{
  id v4 = [a3 icon];
  if ([v4 isWidgetIcon])
  {
    char v5 = [v4 activeDataSource];
    if ([(SBHStackConfigurationViewController *)self _widgetDataSourceIsSuggestion:v5])
    {
      char v6 = 0;
    }
    else
    {
      uint64_t v7 = [(SBHStackConfigurationViewController *)self delegate];
      if (objc_opt_respondsToSelector()) {
        char v6 = [v7 stackConfigurationViewController:self allowsRemovalOfIconDataSource:v5];
      }
      else {
        char v6 = 1;
      }
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (int64_t)closeBoxTypeForIconView:(id)a3
{
  return 1;
}

- (int64_t)iconView:(id)a3 accessoryTypeWithProposedAccessoryType:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [v6 icon];
  int v8 = [v6 isEditing];

  if (!v8 || ![v7 isWidgetIcon])
  {
    if (a4 != 3) {
      goto LABEL_10;
    }
    goto LABEL_7;
  }
  double v9 = [v7 activeDataSource];
  BOOL v10 = [(SBHStackConfigurationViewController *)self _widgetDataSourceIsSuggestion:v9];

  if (a4 == 3 || v10)
  {
LABEL_7:
    if ([(SBHStackConfigurationViewController *)self _canAddAdditionalWidgets]) {
      a4 = 3;
    }
    else {
      a4 = 0;
    }
  }
LABEL_10:

  return a4;
}

- (BOOL)icon:(id)a3 canReceiveGrabbedIcon:(id)a4
{
  return 0;
}

- (id)customImageViewControllerForIconView:(id)a3
{
  id v4 = a3;
  if (objc_opt_respondsToSelector())
  {
    char v5 = [(SBIconViewDelegate *)self->_defaultIconViewDelegate customImageViewControllerForIconView:v4];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (BOOL)iconViewCanBecomeFocused:(id)a3
{
  return 0;
}

- (BOOL)iconView:(id)a3 supportsConfigurationForDataSource:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (objc_opt_respondsToSelector()) {
    char v8 = [(SBIconViewDelegate *)self->_defaultIconViewDelegate iconView:v6 supportsConfigurationForDataSource:v7];
  }
  else {
    char v8 = 0;
  }

  return v8;
}

- (id)iconView:(id)a3 configurationInteractionForDataSource:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (objc_opt_respondsToSelector())
  {
    char v8 = [(SBIconViewDelegate *)self->_defaultIconViewDelegate iconView:v6 configurationInteractionForDataSource:v7];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (id)stackConfigurationInteractionForIconView:(id)a3
{
  return 0;
}

- (int64_t)iconView:(id)a3 userInterfaceStyleForConfigurationInteraction:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (objc_opt_respondsToSelector())
  {
    int64_t v8 = [(SBIconViewDelegate *)self->_defaultIconViewDelegate iconView:v6 userInterfaceStyleForConfigurationInteraction:v7];
  }
  else
  {
    double v9 = [(SBHStackConfigurationViewController *)self traitCollection];
    int64_t v8 = [v9 userInterfaceStyle];
  }
  return v8;
}

- (id)iconView:(id)a3 homeScreenContentViewForConfigurationInteraction:(id)a4
{
  return self->_scalingView;
}

- (void)iconView:(id)a3 configurationDidUpdateWithInteraction:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  if (objc_opt_respondsToSelector()) {
    [(SBIconViewDelegate *)self->_defaultIconViewDelegate iconView:v7 configurationDidUpdateWithInteraction:v6];
  }
}

- (void)iconView:(id)a3 configurationWillBeginWithInteraction:(id)a4
{
  id v6 = a3;
  id v5 = [(SBHStackConfigurationViewController *)self currentConfiguringIconView];
  if (v5 != v6)
  {
    [v5 dismissConfigurationCardImmediately];
    [(SBHStackConfigurationViewController *)self setCurrentConfiguringIconView:v6];
  }
}

- (void)iconView:(id)a3 configurationWillEndWithInteraction:(id)a4
{
  iconListView = self->_iconListView;
  id v6 = a3;
  id v7 = [(SBIconListView *)iconListView icons];
  int64_t v8 = [v6 icon];

  uint64_t v9 = [v7 indexOfObject:v8];
  if (v9 != 0x7FFFFFFFFFFFFFFFLL)
  {
    [(SBHStackConfigurationViewController *)self _scrollToWidgetIndex:v9 animated:1];
  }
}

- (void)iconView:(id)a3 configurationDidEndWithInteraction:(id)a4
{
  id v5 = a3;
  id v6 = [(SBHStackConfigurationViewController *)self currentConfiguringIconView];

  if (v6 == v5)
  {
    [(SBHStackConfigurationViewController *)self setCurrentConfiguringIconView:0];
  }
}

- (double)verticalMarginPercentageForConfigurationOfIconView:(id)a3
{
  id v4 = a3;
  double v5 = -1.0;
  if (objc_opt_respondsToSelector())
  {
    [(SBIconViewDelegate *)self->_defaultIconViewDelegate verticalMarginPercentageForConfigurationOfIconView:v4];
    double v5 = v6;
  }

  return v5;
}

- (void)leafIcon:(id)a3 didChangeActiveDataSource:(id)a4
{
  stackIconView = self->_stackIconView;
  id v6 = a3;
  id v7 = [(SBIconView *)stackIconView icon];

  if (v7 != v6)
  {
    [(SBHStackConfigurationViewController *)self _iconListDidChangeWidgetIcons];
  }
}

- (void)leafIcon:(id)a3 didAddIconDataSource:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SBIconView *)self->_stackIconView icon];

  if (v8 == v6)
  {
    uint64_t v22 = 0;
    long long v23 = &v22;
    uint64_t v24 = 0x2020000000;
    char v25 = 0;
    uint64_t v9 = self->_rootListModel;
    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    double v18 = __69__SBHStackConfigurationViewController_leafIcon_didAddIconDataSource___block_invoke;
    double v19 = &unk_1E6AB07F0;
    id v21 = &v22;
    id v10 = v7;
    id v20 = v10;
    [(SBIconListModel *)v9 enumerateIconsUsingBlock:&v16];
    if (!*((unsigned char *)v23 + 24))
    {
      double v11 = objc_msgSend(v6, "iconDataSources", v16, v17, v18, v19);
      uint64_t v12 = [v11 indexOfObject:v10];

      double v13 = [v6 gridSizeClass];
      BOOL v14 = [(SBHStackConfigurationViewController *)self _unraveledWidgetIconForDataSource:v10 withGridSizeClass:v13];
      id v15 = [(SBIconListModel *)v9 insertIcon:v14 atIndex:v12];
      [(SBIconListView *)self->_iconListView layoutIconsIfNeededWithAnimationType:0 options:1];
    }
    _Block_object_dispose(&v22, 8);
  }
}

void __69__SBHStackConfigurationViewController_leafIcon_didAddIconDataSource___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v10 = a2;
  if ([v10 isWidgetIcon])
  {
    id v6 = [v10 activeDataSource];
    uint64_t v8 = *(void *)(a1 + 40);
    uint64_t v7 = a1 + 40;
    *(unsigned char *)(*(void *)(v8 + 8) + 24) = v6 == *(void **)(v7 - 8);
  }
  else
  {
    uint64_t v9 = *(void *)(a1 + 40);
    uint64_t v7 = a1 + 40;
    *(unsigned char *)(*(void *)(v9 + 8) + 24) = 0;
  }
  *a4 = *(unsigned char *)(*(void *)(*(void *)v7 + 8) + 24);
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = a3;
  [(SBHStackConfigurationViewController *)self _updateCurrentPageControlPage];
  [(SBHStackConfigurationViewController *)self _updatePresentationModeForIconViews];
  [(SBHScrollableIconViewInteraction *)self->_scrollingInteraction clippingScrollViewDidScroll:v4];
}

- (void)scrollViewWillBeginDragging:(id)a3
{
}

- (void)scrollViewDidEndScrolling:(id)a3
{
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double y = a4.y;
  objc_msgSend(a3, "contentOffset", a4.x);
  unint64_t v8 = -[SBHStackConfigurationViewController _widgetIndexForContentOffset:](self, "_widgetIndexForContentOffset:");
  unint64_t v9 = -[SBHStackConfigurationViewController _widgetIndexForContentOffset:](self, "_widgetIndexForContentOffset:", a5->x, a5->y);
  id v10 = [(SBIconListView *)self->_iconListView icons];
  uint64_t v11 = [v10 count];

  if (fabs(y) >= 0.05 && v9 == v8)
  {
    uint64_t v13 = v8 - 1;
    if (y >= 0.0) {
      uint64_t v13 = v8 + 1;
    }
    uint64_t v14 = v13 & ~(v13 >> 63);
    if (v11 - 1 >= v14) {
      unint64_t v9 = v14;
    }
    else {
      unint64_t v9 = v11 - 1;
    }
  }
  [(SBHStackConfigurationViewController *)self _targetContentOffsetForWidgetIndex:v9];
  a5->double x = v15;
  a5->double y = v16;
}

- (UIEdgeInsets)visibleContainerInsets
{
  double v2 = *MEMORY[0x1E4FB2848];
  double v3 = *(double *)(MEMORY[0x1E4FB2848] + 8);
  double v4 = *(double *)(MEMORY[0x1E4FB2848] + 16);
  double v5 = *(double *)(MEMORY[0x1E4FB2848] + 24);
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)enumerateScrollableIconViewsUsingBlock:(id)a3
{
}

- (void)coronaAnimationController:(id)a3 willAnimateCoronaTransitionWithAnimator:(id)a4
{
  id v6 = self->_backgroundMaterialView;
  uint64_t v7 = self->_apertureView;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __105__SBHStackConfigurationViewController_coronaAnimationController_willAnimateCoronaTransitionWithAnimator___block_invoke;
  v10[3] = &unk_1E6AACA90;
  uint64_t v11 = v6;
  uint64_t v12 = v7;
  unint64_t v8 = v7;
  unint64_t v9 = v6;
  [a4 addAnimations:v10];
}

void __105__SBHStackConfigurationViewController_coronaAnimationController_willAnimateCoronaTransitionWithAnimator___block_invoke(uint64_t a1)
{
  double v2 = (void *)MEMORY[0x1E4FB1EB0];
  uint64_t v3 = MEMORY[0x1E4F143A8];
  uint64_t v4 = 3221225472;
  double v5 = __105__SBHStackConfigurationViewController_coronaAnimationController_willAnimateCoronaTransitionWithAnimator___block_invoke_2;
  id v6 = &unk_1E6AACA90;
  id v7 = *(id *)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  [v2 performWithoutAnimation:&v3];
  objc_msgSend(*(id *)(a1 + 32), "pl_performCrossFadeIfNecessary", v3, v4, v5, v6);
  objc_msgSend(*(id *)(a1 + 40), "pl_performCrossFadeIfNecessary");
}

uint64_t __105__SBHStackConfigurationViewController_coronaAnimationController_willAnimateCoronaTransitionWithAnimator___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setNeedsLayout];
  [*(id *)(a1 + 32) layoutIfNeeded];
  [*(id *)(a1 + 40) setNeedsLayout];
  double v2 = *(void **)(a1 + 40);
  return [v2 layoutIfNeeded];
}

- (double)_iconContentScale
{
  double v3 = 1.0;
  if ([(SBHWidgetSettings *)self->_widgetSettings stackConfigurationShouldScaleWidgets])
  {
    uint64_t v4 = [(SBIconView *)self->_stackIconView icon];
    double v5 = [v4 gridSizeClass];

    id v6 = [(SBHStackConfigurationViewController *)self delegate];
    [v6 stackConfigurationViewController:self iconContentScaleForGridSizeClass:v5];
    double v3 = v7;

    if (v3 <= 0.0)
    {
      if (v5 == @"SBHIconGridSizeClassMedium"
        || -[__CFString isEqualToString:](v5, "isEqualToString:"))
      {
        [(SBHWidgetSettings *)self->_widgetSettings stackConfigurationMediumIconScale];
      }
      else if (v5 == @"SBHIconGridSizeClassLarge" {
             || (-[__CFString isEqualToString:](v5, "isEqualToString:") & 1) != 0
      }
             || v5 == @"SBHIconGridSizeClassNewsLargeTall"
             || -[__CFString isEqualToString:](v5, "isEqualToString:"))
      {
        [(SBHWidgetSettings *)self->_widgetSettings stackConfigurationLargeIconScale];
      }
      else
      {
        if (v5 != @"SBHIconGridSizeClassExtraLarge")
        {
          double v3 = 1.0;
          if (!-[__CFString isEqualToString:](v5, "isEqualToString:")) {
            goto LABEL_12;
          }
        }
        [(SBHWidgetSettings *)self->_widgetSettings stackConfigurationExtraLargeIconScale];
      }
      double v3 = v8;
    }
LABEL_12:
  }
  return v3;
}

- (CGSize)_stableApertureSize
{
  [(SBHStackConfigurationViewController *)self contentBoundingFrame];
  double v4 = v3;
  [(NSLayoutConstraint *)self->_apertureSizeConstraint multiplier];
  double v6 = v4 * v5;
  [(NSLayoutConstraint *)self->_apertureHeightConstraint multiplier];
  double v8 = v6 * v7;
  double v9 = v6;
  result.double height = v8;
  result.double width = v9;
  return result;
}

- (BOOL)_shouldUseConcentricCornersWhenExpanded
{
  return !self->_stackSizeIsSmall;
}

- (double)_expandedPageControlOutset
{
  double v3 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  double result = 14.0;
  if ((v4 & 0xFFFFFFFFFFFFFFFBLL) != 1)
  {
    double result = 17.0;
    if (!self->_stackSizeIsSmall) {
      return 10.0;
    }
  }
  return result;
}

- (unint64_t)_sourceActiveWidgetIndex
{
  double v3 = [(SBIconView *)self->_stackIconView icon];
  uint64_t v4 = [(SBHStackConfiguration *)self->_configuration dataSources];
  double v5 = [v3 activeDataSource];
  uint64_t v6 = [v4 indexOfObject:v5];

  if (v6 == 0x7FFFFFFFFFFFFFFFLL) {
    unint64_t v7 = 0;
  }
  else {
    unint64_t v7 = v6;
  }

  return v7;
}

- (unint64_t)_widgetIndexForContentOffset:(CGPoint)a3
{
  double y = a3.y;
  [(SBHStackConfigurationApertureView *)self->_apertureView bounds];
  double v6 = v5 * 0.5;
  [(SBIconListView *)self->_iconListView iconSpacing];
  double v8 = v7;
  [(SBIconListView *)self->_iconListView additionalLayoutInsets];
  double v10 = v9;
  double height = self->_iconImageInfo.size.height;
  [(SBIconListView *)self->_iconListView iconContentScale];
  unint64_t v13 = vcvtmd_u64_f64((v6 + v8 * 0.5 + y - v10) / (v8 + height * v12));
  uint64_t v14 = [(SBIconListView *)self->_iconListView icons];
  unint64_t v15 = [v14 count] - 1;

  if (v15 >= v13) {
    return v13;
  }
  else {
    return v15;
  }
}

- (CGPoint)_targetContentOffsetForWidgetIndex:(unint64_t)a3
{
  [(SBIconListView *)self->_iconListView iconContentScale];
  double v6 = v5;
  double height = self->_iconImageInfo.size.height;
  [(SBIconListView *)self->_iconListView iconSpacing];
  double v9 = (v6 * height + v8) * (double)a3;
  double v10 = 0.0;
  result.double y = v9;
  result.double x = v10;
  return result;
}

- (void)_scrollToWidgetIndex:(unint64_t)a3 animated:(BOOL)a4
{
}

- (void)_scrollToWidgetIndex:(unint64_t)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v19 = a5;
  double v8 = [(SBIconListView *)self->_iconListView icons];
  unint64_t v9 = [v8 count];

  if (v9 <= a3)
  {
    double v18 = v19;
    if (!v19) {
      goto LABEL_12;
    }
    (*((void (**)(id, void))v19 + 2))(v19, 0);
  }
  else
  {
    [(SBHStackConfigurationApertureView *)self->_apertureView layoutIfNeeded];
    double v10 = 0.0;
    if (self->_scrollPositionNeed == 2)
    {
      uint64_t v11 = [(SBIconView *)self->_stackIconView customIconImageViewController];
      double v12 = -1.0;
      if (objc_opt_respondsToSelector())
      {
        if ([v11 imageViewAlignment] == 1) {
          double v12 = 1.0;
        }
        else {
          double v12 = -1.0;
        }
      }
      [(SBIconView *)self->_stackIconView iconImageFrame];
      double Height = CGRectGetHeight(v21);
      double v14 = self->_iconImageInfo.size.height;
      [(SBIconListView *)self->_iconListView iconContentScale];
      double v10 = v12 * (v14 * v15 - Height) * 0.5;
    }
    [(SBHStackConfigurationViewController *)self _targetContentOffsetForWidgetIndex:a3];
    -[BSUIScrollView setContentOffset:animated:completion:](self->_scrollView, "setContentOffset:animated:completion:", v5, v19, v16 + 0.0, v10 + v17);
  }
  double v18 = v19;
LABEL_12:
}

- (void)_setPageControlScale:(double)a3
{
  pageControl = self->_pageControl;
  CGAffineTransformMakeScale(&v4, a3, a3);
  [(UIPageControl *)pageControl setTransform:&v4];
}

- (void)_updateCurrentPageControlPage
{
  [(BSUIScrollView *)self->_scrollView contentOffset];
  unint64_t v3 = -[SBHStackConfigurationViewController _widgetIndexForContentOffset:](self, "_widgetIndexForContentOffset:");
  if ([(UIPageControl *)self->_pageControl currentPage] != v3)
  {
    pageControl = self->_pageControl;
    [(UIPageControl *)pageControl setCurrentPage:v3];
  }
}

- (void)_updateForWidgetIconCountChanged
{
  unint64_t v3 = [(SBIconListView *)self->_iconListView icons];
  unint64_t v4 = [v3 count];

  if ([(UIPageControl *)self->_pageControl numberOfPages] != v4)
  {
    [(UIPageControl *)self->_pageControl setNumberOfPages:v4];
    [(SBHStackConfigurationViewController *)self _updateCurrentPageControlPage];
  }
  [(SBHStackConfigurationViewController *)self _updateAddWidgetButtonOperabilityForDataSourceCount];
  BOOL v5 = v4 < 2;
  [(CCUILabeledRoundButtonViewController *)self->_smartRotateButtonViewController setInoperative:v5];
  suggestionsButtonViewController = self->_suggestionsButtonViewController;
  [(CCUILabeledRoundButtonViewController *)suggestionsButtonViewController setInoperative:v5];
}

- (void)_setupMatchMoveAnimationWithSourceView:(id)a3 targetView:(id)a4
{
  BOOL v5 = (void *)MEMORY[0x1E4FA5E88];
  id v6 = a4;
  id v7 = [v5 matchMoveAnimationForPinningToView:a3];
  [v6 addAnimation:v7 forKey:@"SBHStackConfigurationBackgroundMatchMoveKey"];
}

- (void)_updateButtonSubtitleForSmartRotate:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  configuration = self->_configuration;
  if (a3)
  {
    BOOL v8 = [(SBHStackConfiguration *)configuration allowsSuggestions];
    unint64_t v9 = &OBJC_IVAR___SBHStackConfigurationViewController__smartRotateButtonViewController;
  }
  else
  {
    BOOL v8 = [(SBHStackConfiguration *)configuration allowsExternalSuggestions];
    unint64_t v9 = &OBJC_IVAR___SBHStackConfigurationViewController__suggestionsButtonViewController;
  }
  id v10 = *(id *)((char *)&self->super.super.super.isa + *v9);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __84__SBHStackConfigurationViewController__updateButtonSubtitleForSmartRotate_animated___block_invoke;
  aBlock[3] = &unk_1E6AAD728;
  id v11 = v10;
  id v25 = v11;
  BOOL v26 = v8;
  double v12 = (void (**)(void))_Block_copy(aBlock);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __84__SBHStackConfigurationViewController__updateButtonSubtitleForSmartRotate_animated___block_invoke_2;
  v19[3] = &unk_1E6AB0818;
  BOOL v21 = a3;
  BOOL v22 = v8;
  BOOL v23 = v4;
  id v13 = v11;
  id v20 = v13;
  double v14 = (void (**)(void))_Block_copy(v19);
  if (v4)
  {
    double v15 = (void *)MEMORY[0x1E4FB1EB0];
    double v16 = [v13 view];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __84__SBHStackConfigurationViewController__updateButtonSubtitleForSmartRotate_animated___block_invoke_6;
    v17[3] = &unk_1E6AAD4C8;
    double v18 = v12;
    [v15 transitionWithView:v16 duration:5242886 options:v17 animations:0 completion:0.15];

    v14[2](v14);
  }
  else
  {
    v12[2](v12);
    v14[2](v14);
  }
}

void __84__SBHStackConfigurationViewController__updateButtonSubtitleForSmartRotate_animated___block_invoke(uint64_t a1)
{
  double v2 = *(void **)(a1 + 32);
  unint64_t v3 = SBHBundle();
  id v6 = v3;
  if (*(unsigned char *)(a1 + 40)) {
    BOOL v4 = @"ON";
  }
  else {
    BOOL v4 = @"OFF";
  }
  BOOL v5 = [v3 localizedStringForKey:v4 value:&stru_1F2FA0300 table:@"SpringBoardHome"];
  [v2 setSubtitle:v5];
}

void __84__SBHStackConfigurationViewController__updateButtonSubtitleForSmartRotate_animated___block_invoke_2(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 41);
  if (*(unsigned char *)(a1 + 40))
  {
    if (*(unsigned char *)(a1 + 41))
    {
      unint64_t v3 = *(void **)(a1 + 32);
      if (*(unsigned char *)(a1 + 42))
      {
        [v3 setGlyphState:@"State 2"];
        dispatch_time_t v4 = dispatch_time(0, 300000000);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __84__SBHStackConfigurationViewController__updateButtonSubtitleForSmartRotate_animated___block_invoke_3;
        block[3] = &unk_1E6AAC810;
        id v15 = *(id *)(a1 + 32);
        dispatch_after(v4, MEMORY[0x1E4F14428], block);
        BOOL v5 = v15;
LABEL_12:

        return;
      }
      BOOL v8 = @"State 3";
    }
    else
    {
      unint64_t v3 = *(void **)(a1 + 32);
      BOOL v8 = @"State 1";
    }
  }
  else
  {
    int v6 = *(unsigned __int8 *)(a1 + 42);
    unint64_t v3 = *(void **)(a1 + 32);
    if (v2)
    {
      if (v6)
      {
        [v3 setGlyphState:@"State 3"];
        dispatch_time_t v7 = dispatch_time(0, 100000000);
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        v12[2] = __84__SBHStackConfigurationViewController__updateButtonSubtitleForSmartRotate_animated___block_invoke_4;
        v12[3] = &unk_1E6AAC810;
        id v13 = *(id *)(a1 + 32);
        dispatch_after(v7, MEMORY[0x1E4F14428], v12);
        BOOL v5 = v13;
        goto LABEL_12;
      }
      BOOL v8 = @"State 4";
    }
    else
    {
      if (v6)
      {
        [v3 setGlyphState:@"State 1"];
        dispatch_time_t v9 = dispatch_time(0, 100000000);
        v10[0] = MEMORY[0x1E4F143A8];
        v10[1] = 3221225472;
        v10[2] = __84__SBHStackConfigurationViewController__updateButtonSubtitleForSmartRotate_animated___block_invoke_5;
        v10[3] = &unk_1E6AAC810;
        id v11 = *(id *)(a1 + 32);
        dispatch_after(v9, MEMORY[0x1E4F14428], v10);
        BOOL v5 = v11;
        goto LABEL_12;
      }
      BOOL v8 = @"State 2";
    }
  }
  [v3 setGlyphState:v8];
}

void __84__SBHStackConfigurationViewController__updateButtonSubtitleForSmartRotate_animated___block_invoke_3(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) glyphState];
  int v3 = [v2 isEqualToString:@"State 2"];

  if (v3)
  {
    dispatch_time_t v4 = *(void **)(a1 + 32);
    [v4 setGlyphState:@"State 3"];
  }
}

void __84__SBHStackConfigurationViewController__updateButtonSubtitleForSmartRotate_animated___block_invoke_4(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) glyphState];
  int v3 = [v2 isEqualToString:@"State 3"];

  if (v3)
  {
    dispatch_time_t v4 = *(void **)(a1 + 32);
    [v4 setGlyphState:@"State 4"];
  }
}

void __84__SBHStackConfigurationViewController__updateButtonSubtitleForSmartRotate_animated___block_invoke_5(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) glyphState];
  int v3 = [v2 isEqualToString:@"State 1"];

  if (v3)
  {
    dispatch_time_t v4 = *(void **)(a1 + 32);
    [v4 setGlyphState:@"State 2"];
  }
}

uint64_t __84__SBHStackConfigurationViewController__updateButtonSubtitleForSmartRotate_animated___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_updateAddWidgetButtonOperabilityForDataSourceCount
{
  addButton = self->_addButton;
  BOOL v3 = [(SBHStackConfigurationViewController *)self _canAddAdditionalWidgets];
  [(SBHomeScreenButton *)addButton setEnabled:v3];
}

- (void)_iconListDidChangeWidgetIcons
{
  BOOL v3 = [(SBIconListView *)self->_iconListView model];
  dispatch_time_t v4 = [v3 icons];
  objc_msgSend(v4, "bs_compactMap:", &__block_literal_global_36);
  id v5 = (id)objc_claimAutoreleasedReturnValue();

  [(SBHStackConfiguration *)self->_configuration setDataSources:v5];
  [(SBHStackConfigurationViewController *)self _saveConfiguration];
}

id __68__SBHStackConfigurationViewController__iconListDidChangeWidgetIcons__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isWidgetIcon])
  {
    BOOL v3 = [v2 activeDataSource];
  }
  else
  {
    BOOL v3 = 0;
  }

  return v3;
}

- (void)_saveConfiguration
{
  id v3 = [(SBHStackConfigurationViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v3 stackConfigurationViewController:self didCommitStackConfiguration:self->_configuration];
  }
}

- (void)_updateEditingStateAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = self->_editingIcons && !self->_suppressesEditingStateForListView;
  [(SBIconListView *)self->_iconListView setEditing:v5];
  iconListView = self->_iconListView;
  [(SBIconListView *)iconListView updateEditingStateAnimated:v3];
}

- (void)_requestDismissal
{
  id v3 = [(SBHStackConfigurationViewController *)self delegate];
  [v3 stackConfigurationViewControllerRequestsDismissal:self];
}

- (BOOL)_widgetDataSourceIsSuggestion:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  BOOL v4 = ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    && [v3 suggestionSource] == 1;

  return v4;
}

- (BOOL)_canAddAdditionalWidgets
{
  id v2 = self;
  id v3 = [(SBHStackConfiguration *)self->_configuration dataSources];
  unint64_t v4 = [v3 count];
  LOBYTE(v2) = v4 < [(SBHWidgetSettings *)v2->_widgetSettings maximumWidgetsInAStack];

  return (char)v2;
}

- (void)setTitledButtonsEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(SBHStackConfigurationViewController *)self doneButton];
  [v5 setEnabled:v3];

  id v6 = [(SBHStackConfigurationViewController *)self addButton];
  [v6 setEnabled:v3];
}

- (void)_didChangePageControlPage:(id)a3
{
  uint64_t v4 = [a3 currentPage];
  [(SBHScrollableIconViewInteraction *)self->_scrollingInteraction updateScrolling:1];
  [(SBHStackConfigurationViewController *)self _scrollToWidgetIndex:v4 animated:0];
  scrollingInteraction = self->_scrollingInteraction;
  [(SBHScrollableIconViewInteraction *)scrollingInteraction updateScrolling:0];
}

- (void)_didToggleSmartRotate:(id)a3
{
  [(SBHStackConfiguration *)self->_configuration setAllowsSuggestions:[(SBHStackConfiguration *)self->_configuration allowsSuggestions] ^ 1];
  [(SBHStackConfigurationViewController *)self _updateButtonSubtitleForSmartRotate:1 animated:1];
  [(SBHStackConfigurationViewController *)self _saveConfiguration];
}

- (void)_didToggleSuggestions:(id)a3
{
  BOOL v4 = [(SBHStackConfiguration *)self->_configuration allowsExternalSuggestions];
  if (v4)
  {
    BOOL v5 = self->_iconListView;
    id v6 = [(SBIconListView *)v5 icons];
    dispatch_time_t v7 = objc_msgSend(v6, "bs_compactMap:", &__block_literal_global_270);

    BOOL v8 = [(SBIconListView *)self->_iconListView model];
    [v8 removeIcons:v7 options:0];
    [(SBIconListView *)v5 layoutIconsIfNeededWithAnimationType:0 options:0];
  }
  [(SBHStackConfiguration *)self->_configuration setAllowsExternalSuggestions:!v4];
  [(SBHStackConfigurationViewController *)self _updateButtonSubtitleForSmartRotate:0 animated:1];
  [(SBHStackConfigurationViewController *)self _saveConfiguration];
}

id __61__SBHStackConfigurationViewController__didToggleSuggestions___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isWidgetIcon])
  {
    BOOL v3 = [v2 firstSuggestedIconDataSource];
    if (v3) {
      BOOL v4 = v2;
    }
    else {
      BOOL v4 = 0;
    }
    id v5 = v4;
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (void)_didTapAddWidgetButton:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  BOOL v4 = [(SBHStackConfiguration *)self->_configuration dataSources];
  unint64_t v5 = [v4 count];
  unint64_t v6 = [(SBHWidgetSettings *)self->_widgetSettings maximumWidgetsInAStack];

  dispatch_time_t v7 = SBLogIcon();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
  if (v5 >= v6)
  {
    if (v8)
    {
      int v9 = 138412290;
      id v10 = self;
      _os_log_impl(&dword_1D7F0A000, v7, OS_LOG_TYPE_INFO, "'%@' ignoring tap to present Add Widget Sheet", (uint8_t *)&v9, 0xCu);
    }
  }
  else
  {
    if (v8)
    {
      int v9 = 138412290;
      id v10 = self;
      _os_log_impl(&dword_1D7F0A000, v7, OS_LOG_TYPE_INFO, "'%@' requesting presentation of Add Widget Sheet", (uint8_t *)&v9, 0xCu);
    }

    dispatch_time_t v7 = [(SBHStackConfigurationViewController *)self delegate];
    [v7 stackConfigurationViewControllerRequestsPresentAddWidgetSheet:self];
  }
}

- (void)_didTapDoneButton:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  BOOL v4 = [(SBHStackConfigurationViewController *)self delegate];
  if (v4 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v4 stackConfigurationViewControllerDoneButtonTapped:self];
  }
  unint64_t v5 = SBLogIcon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 138412290;
    dispatch_time_t v7 = self;
    _os_log_impl(&dword_1D7F0A000, v5, OS_LOG_TYPE_INFO, "'%@' requesting dismissal; Done button tapped",
      (uint8_t *)&v6,
      0xCu);
  }

  [(SBHStackConfigurationViewController *)self _requestDismissal];
}

- (void)_didTapBackgroundView:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [v4 view];
  [v4 locationInView:v5];
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  id v10 = [MEMORY[0x1E4F1CA80] setWithObject:self->_apertureView];
  uint64_t v11 = [(CCUILabeledRoundButtonViewController *)self->_smartRotateButtonViewController view];
  [v10 addObject:v11];

  double v12 = [(CCUILabeledRoundButtonViewController *)self->_suggestionsButtonViewController view];
  [v10 addObject:v12];

  id v13 = [(SBHStackConfigurationViewController *)self addButton];
  objc_msgSend(v10, "bs_safeAddObject:", v13);

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v14 = v10;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v21 objects:v27 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v22;
    while (2)
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v22 != v17) {
          objc_enumerationMutation(v14);
        }
        id v19 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        objc_msgSend(v19, "bounds", (void)v21);
        objc_msgSend(v19, "convertRect:toView:", v5);
        v29.double x = v7;
        v29.double y = v9;
        if (CGRectContainsPoint(v30, v29))
        {

          goto LABEL_13;
        }
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v21 objects:v27 count:16];
      if (v16) {
        continue;
      }
      break;
    }
  }

  id v20 = SBLogIcon();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    BOOL v26 = self;
    _os_log_impl(&dword_1D7F0A000, v20, OS_LOG_TYPE_INFO, "'%@' requesting dismissal due to tap gesture", buf, 0xCu);
  }

  [(SBHStackConfigurationViewController *)self _requestDismissal];
LABEL_13:
}

- (BOOL)_shouldKeepIconImageViewControllersStatic
{
  return [(NSHashTable *)self->_keepStaticAssertions count] != 0;
}

- (void)_updatePresentationModeForIconViews
{
  BOOL v3 = [(SBHStackConfigurationViewController *)self _shouldKeepIconImageViewControllersStatic];
  [(BSUIScrollView *)self->_scrollView contentOffset];
  unint64_t v4 = -[SBHStackConfigurationViewController _widgetIndexForContentOffset:](self, "_widgetIndexForContentOffset:");
  unint64_t v5 = v4;
  if (v4) {
    unint64_t v6 = v4 - 1;
  }
  else {
    unint64_t v6 = 0;
  }
  id v13 = [(SBIconListView *)self->_iconListView icons];
  if ([v13 count])
  {
    unint64_t v7 = 0;
    unint64_t v12 = v5 + 1;
    do
    {
      BOOL v8 = v3 || v7 < v6 || v7 > v12;
      CGFloat v9 = objc_msgSend(v13, "objectAtIndexedSubscript:", v7, v12);
      id v10 = [(SBIconListView *)self->_iconListView displayedIconViewForIcon:v9];
      uint64_t v11 = [v10 customIconImageViewController];
      if (objc_opt_respondsToSelector()) {
        [v11 setPresentationMode:v8];
      }

      ++v7;
    }
    while (v7 < [v13 count]);
  }
}

- (BOOL)_allowUserInteraction
{
  return 1;
}

- (void)_cancelCloseConfigurationTimer
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1D7F0A000, log, OS_LOG_TYPE_DEBUG, "[SBHStackConfigurationViewController] _cancelCloseConfigurationTimer was called", v1, 2u);
}

- (void)_closeConfigurationTimerFired
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  BOOL v3 = SBLogIcon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = 138412290;
    unint64_t v5 = self;
    _os_log_impl(&dword_1D7F0A000, v3, OS_LOG_TYPE_INFO, "'%@' requesting dismissal; Close configuration timer fired",
      (uint8_t *)&v4,
      0xCu);
  }

  [(SBHStackConfigurationViewController *)self _requestDismissal];
}

- (void)_setCloseFolderTimerIfNecessary
{
  if (!self->_closeConfigurationTimer
    && self->_grabbedIconHasEverEnteredStackConfigurationView
    && [(SBHStackConfigurationViewController *)self closesAfterDragExits]
    && ![(NSMutableSet *)self->_draggingEnteredIconListViews count])
  {
    BOOL v3 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:self target:sel__closeConfigurationTimerFired selector:0 userInfo:0 repeats:0.5];
    closeConfigurationTimer = self->_closeConfigurationTimer;
    self->_closeConfigurationTimer = v3;
  }
}

- (void)willDismiss
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  [(SBHStackConfigurationViewController *)self _cancelCloseConfigurationTimer];
  if ([(SBIconDragManager *)self->_iconDragManager isTrackingUserActiveIconDrags])
  {
    BOOL v3 = [(SBIconListView *)self->_iconListView model];
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    int v4 = objc_msgSend(v3, "icons", 0);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v11;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void *)(*((void *)&v10 + 1) + 8 * i);
          if ([(SBIconDragManager *)self->_iconDragManager isTrackingDragOfIcon:v9]) {
            [v3 removeIcon:v9];
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v6);
    }

    [(SBHStackConfigurationViewController *)self setDidRemoveDraggedIconsForDismissal:1];
  }
}

- (void)noteIconDrag:(id)a3 didEnterIconListView:(id)a4
{
  id v15 = a3;
  id v6 = a4;
  draggingEnteredIconListViews = self->_draggingEnteredIconListViews;
  if (!draggingEnteredIconListViews)
  {
    BOOL v8 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    uint64_t v9 = self->_draggingEnteredIconListViews;
    self->_draggingEnteredIconListViews = v8;

    draggingEnteredIconListViews = self->_draggingEnteredIconListViews;
  }
  [(NSMutableSet *)draggingEnteredIconListViews addObject:v6];
  [v15 locationInView:v6];
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  [v6 bounds];
  v17.double x = v11;
  v17.double y = v13;
  if (CGRectContainsPoint(v18, v17))
  {
    [(SBHStackConfigurationViewController *)self _cancelAllInteractionTimers];
    self->_grabbedIconHasEverEnteredStackConfigurationView = 1;
  }
  id v14 = [(SBHStackConfigurationViewController *)self delegate];
  [v14 stackConfigurationViewController:self isConsumingDropSession:v15];
}

- (void)noteIconDrag:(id)a3 didChangeInIconListView:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  if (![(SBHStackConfigurationViewController *)self _allowUserInteraction]) {
    [(SBHStackConfigurationViewController *)self _cancelAllInteractionTimers];
  }
  if ([(NSMutableSet *)self->_draggingEnteredIconListViews containsObject:v6])
  {
    [v11 locationInView:v6];
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    [v6 bounds];
    v13.double x = v8;
    v13.double y = v10;
    if (CGRectContainsPoint(v14, v13))
    {
      self->_grabbedIconHasEverEnteredStackConfigurationView = 1;
    }
    else
    {
      [(NSMutableSet *)self->_draggingEnteredIconListViews removeObject:v6];
      [(SBHStackConfigurationViewController *)self _setCloseFolderTimerIfNecessary];
    }
  }
}

- (void)noteIconDrag:(id)a3 didExitIconListView:(id)a4
{
  id v5 = a4;
  if (-[NSMutableSet containsObject:](self->_draggingEnteredIconListViews, "containsObject:"))
  {
    [(NSMutableSet *)self->_draggingEnteredIconListViews removeObject:v5];
    if (![(SBHStackConfigurationViewController *)self didPerformDrop]) {
      [(SBHStackConfigurationViewController *)self _setCloseFolderTimerIfNecessary];
    }
  }
}

- (void)noteIconDragDidEnd
{
  [(SBHStackConfigurationViewController *)self _cancelAllInteractionTimers];
  self->_grabbedIconHasEverEnteredStackConfigurationView = 0;
  draggingEnteredIconListViews = self->_draggingEnteredIconListViews;
  self->_draggingEnteredIconListViews = 0;
}

- (void)iconDragManager:(id)a3 iconView:(id)a4 willBeginDragSession:(id)a5
{
  [(SBHStackConfigurationViewController *)self setCurrentDraggingIconView:a4];
  if (![(SBHStackConfigurationViewController *)self canDismissWhileDragging]) {
    [(SBHStackConfigurationViewController *)self setTitledButtonsEnabled:0];
  }
  [(SBHStackConfigurationViewController *)self setDidPerformDrop:0];
}

- (BOOL)iconDragManager:(id)a3 canAddDragItemsToSession:(id)a4 fromIconView:(id)a5
{
  return 0;
}

- (void)iconDragManager:(id)a3 iconView:(id)a4 willAnimateDragLiftWithAnimator:(id)a5 session:(id)a6
{
  id v12 = a4;
  id v9 = a5;
  id v10 = a6;
  id v11 = [(SBHStackConfigurationViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v11 stackConfigurationViewController:self iconView:v12 willAnimateDragLiftWithAnimator:v9 session:v10];
  }
}

- (void)iconDragManager:(id)a3 iconView:(id)a4 dragLiftAnimationDidChangeDirection:(int64_t)a5
{
  id v8 = a4;
  double v7 = [(SBHStackConfigurationViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v7 stackConfigurationViewController:self iconView:v8 dragLiftAnimationDidChangeDirection:a5];
  }
}

- (void)iconDragManager:(id)a3 iconView:(id)a4 item:(id)a5 willAnimateDragCancelWithAnimator:(id)a6
{
  id v12 = a5;
  if ([(SBHStackConfigurationViewController *)self didRemoveDraggedIconsForDismissal])
  {
    double v7 = objc_msgSend(v12, "sbh_appDragLocalContext");
    iconDragManager = self->_iconDragManager;
    id v9 = [v7 uniqueIdentifier];
    id v10 = [(SBIconDragManager *)iconDragManager draggedIconForIdentifier:v9];

    id v11 = [(SBIconListView *)self->_iconListView model];
    [v11 addIcon:v10];
  }
}

- (void)iconDragManager:(id)a3 iconView:(id)a4 didEndDragSession:(id)a5 withOperation:(unint64_t)a6
{
  id v7 = a4;
  id v8 = [(SBHStackConfigurationViewController *)self currentDraggingIconView];

  if (v8 == v7) {
    [(SBHStackConfigurationViewController *)self setCurrentDraggingIconView:0];
  }
  if (![(SBHStackConfigurationViewController *)self canDismissWhileDragging])
  {
    [(SBHStackConfigurationViewController *)self setTitledButtonsEnabled:1];
  }
}

- (BOOL)iconDragManager:(id)a3 dragsSupportSystemDragsForIconView:(id)a4
{
  id v5 = a4;
  id v6 = [(SBHStackConfigurationViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    char v7 = [v6 stackConfigurationViewController:self dragsSupportSystemDragsForIconView:v5];
  }
  else {
    char v7 = [v5 dragsSupportSystemDragsByDefault];
  }
  BOOL v8 = v7;

  return v8;
}

- (void)iconDragManager:(id)a3 iconDropSession:(id)a4 didEnterIconListView:(id)a5
{
}

- (id)iconDragManager:(id)a3 iconDropSessionDidUpdate:(id)a4 inIconListView:(id)a5 draggedIcons:(id)a6 proposedDropProposal:(id)a7
{
  id v10 = a7;
  [(SBHStackConfigurationViewController *)self noteIconDrag:a4 didChangeInIconListView:a5];
  return v10;
}

- (void)iconDragManager:(id)a3 iconDropSession:(id)a4 didExitIconListView:(id)a5
{
}

- (void)iconDragManagerIconDraggingDidChange:(id)a3
{
  if (([a3 isIconDragging] & 1) == 0)
  {
    [(SBHStackConfigurationViewController *)self noteIconDragDidEnd];
  }
}

- (void)iconDragManager:(id)a3 didPerformIconDrop:(id)a4 withIcons:(id)a5 inIconListView:(id)a6
{
  [(SBHStackConfigurationViewController *)self _cancelCloseConfigurationTimer];
  [(SBHStackConfigurationViewController *)self setDidPerformDrop:1];
}

- (void)iconDragManager:(id)a3 iconListView:(id)a4 item:(id)a5 willAnimateDropWithAnimator:(id)a6
{
  id v8 = a4;
  objc_msgSend(a5, "sbh_appDragLocalContext");
  id v20 = (id)objc_claimAutoreleasedReturnValue();
  iconDragManager = self->_iconDragManager;
  id v10 = [v20 uniqueIdentifier];
  id v11 = [(SBIconDragManager *)iconDragManager draggedIconForIdentifier:v10];

  [v8 rectForIcon:v11];
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  CGFloat v19 = v18;

  v22.origin.double x = v13;
  v22.origin.double y = v15;
  v22.size.double width = v17;
  v22.size.double height = v19;
  CGRect v23 = CGRectInset(v22, 0.0, -8.0);
  -[BSUIScrollView scrollRectToVisible:animated:](self->_scrollView, "scrollRectToVisible:animated:", 1, v23.origin.x, v23.origin.y, v23.size.width, v23.size.height);
}

- (id)rootListModelForIconDragManager:(id)a3
{
  return self->_rootListModel;
}

- (id)rootViewForIconDragManager:(id)a3
{
  return self->_iconListView;
}

- (BOOL)isEditing
{
  return 1;
}

- (BOOL)iconDragManager:(id)a3 doesIconRepresentRealIconPosition:(id)a4 inLocation:(id)a5
{
  return 1;
}

- (id)iconListViewForIndexPath:(id)a3
{
  return self->_iconListView;
}

- (id)iconViewQueryableForIconDragManager:(id)a3
{
  return self->_iconListView;
}

- (id)iconDragManager:(id)a3 draggedIconForIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = [(SBHStackConfigurationViewController *)self delegate];
  char v7 = [v6 stackConfigurationViewController:self draggedIconForIdentifier:v5];

  return v7;
}

- (id)widgetInsertionRippleIconAnimatorForIcon:(id)a3 iconListView:(id)a4 withReferenceIconView:(id)a5
{
  listLayoutProvider = self->_listLayoutProvider;
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  double v12 = [(SBIconListLayoutProvider *)listLayoutProvider layoutForIconLocation:@"SBIconLocationRoot"];
  CGFloat v13 = [SBHWidgetInsertionRippleIconAnimator alloc];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __115__SBHStackConfigurationViewController_widgetInsertionRippleIconAnimatorForIcon_iconListView_withReferenceIconView___block_invoke;
  v16[3] = &unk_1E6AAC810;
  v16[4] = self;
  double v14 = [(SBHWidgetInsertionRippleIconAnimator *)v13 initWithIconListView:v10 widgetIcon:v11 referenceLayout:v12 referenceIconView:v9 additionalIconListView:0 preludeBlock:v16];

  return v14;
}

void __115__SBHStackConfigurationViewController_widgetInsertionRippleIconAnimatorForIcon_iconListView_withReferenceIconView___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 stackConfigurationViewControllerWillAnimateWidgetInsertion:*(void *)(a1 + 32)];
}

- (id)iconDragManager:(id)a3 dragPreviewForIconView:(id)a4
{
  id v5 = a4;
  id v6 = [(SBHStackConfigurationViewController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    char v7 = [v6 stackConfigurationViewController:self dragPreviewForIconView:v5];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (id)iconDragManager:(id)a3 targetedDragPreviewForIconView:(id)a4 item:(id)a5 session:(id)a6 previewParameters:(id)a7
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  CGFloat v15 = [(SBHStackConfigurationViewController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    double v16 = [v15 stackConfigurationViewController:self targetedDragPreviewForIconView:v11 item:v12 session:v13 previewParameters:v14];
  }
  else
  {
    double v16 = 0;
  }

  return v16;
}

- (id)windowForIconDragPreviewsForIconDragManager:(id)a3 forWindowScene:(id)a4
{
  id v5 = a4;
  id v6 = [(SBHStackConfigurationViewController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    char v7 = [v6 windowForIconDragPreviewsForStackConfigurationViewController:self forWindowScene:v5];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (BOOL)iconListModel:(id)a3 isAllowedToContainIcon:(id)a4
{
  id v5 = a4;
  id v6 = [v5 gridSizeClass];
  char v7 = [(SBIconView *)self->_stackIconView icon];
  id v8 = [v7 gridSizeClass];
  if (v6 == v8)
  {
    char v12 = 1;
  }
  else
  {
    id v9 = [v5 gridSizeClass];
    id v10 = [(SBIconView *)self->_stackIconView icon];
    id v11 = [v10 gridSizeClass];
    char v12 = [v9 isEqualToString:v11];
  }
  return v12;
}

- (void)iconList:(id)a3 didAddIcon:(id)a4
{
  id v5 = a4;
  if ([v5 isWidgetIcon])
  {
    [v5 addObserver:self];
    [(SBHStackConfigurationViewController *)self _iconListDidChangeWidgetIcons];
  }
  [(SBHStackConfigurationViewController *)self _updateForWidgetIconCountChanged];
}

- (void)iconList:(id)a3 didReplaceIcon:(id)a4 withIcon:(id)a5
{
  id v8 = a4;
  id v7 = a5;
  if (([v8 isWidgetIcon] & 1) != 0 || objc_msgSend(v7, "isWidgetIcon"))
  {
    [v8 removeObserver:self];
    [v7 addObserver:self];
    [(SBHStackConfigurationViewController *)self _iconListDidChangeWidgetIcons];
  }
  [(SBHStackConfigurationViewController *)self _updateForWidgetIconCountChanged];
}

- (void)iconList:(id)a3 didRemoveIcon:(id)a4
{
  id v7 = a4;
  if ([v7 isPlaceholder])
  {
    id v5 = [v7 referencedIcon];
  }
  else
  {
    id v5 = v7;
  }
  id v6 = v5;
  if (v5)
  {
    [v5 removeObserver:self];
    [(SBHStackConfigurationViewController *)self _iconListDidChangeWidgetIcons];
  }
  [(SBHStackConfigurationViewController *)self _updateForWidgetIconCountChanged];
}

- (void)iconList:(id)a3 didMoveIcon:(id)a4
{
  id v9 = a4;
  if ([v9 isPlaceholder])
  {
    id v5 = [v9 referencedIcon];
  }
  else
  {
    id v5 = v9;
  }
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
    id v8 = [v7 activeDataSource];
    if ([(SBHStackConfigurationViewController *)self _widgetDataSourceIsSuggestion:v8])
    {
      [(SBHStackConfigurationViewController *)self _promoteWidgetIcon:v7];
    }
    [(SBHStackConfigurationViewController *)self _iconListDidChangeWidgetIcons];
  }
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  if ([(SBHStackConfigurationViewController *)self canDismissWhileDragging]) {
    return 1;
  }
  id v5 = [(SBHStackConfigurationViewController *)self currentDraggingIconView];
  BOOL v4 = v5 == 0;

  return v4;
}

- (void)stackConfigurationView:(id)a3 didHitTestView:(id)a4 atPoint:(CGPoint)a5 withEvent:(id)a6
{
  id v7 = (void *)MEMORY[0x1E4F1CA48];
  id v8 = a4;
  id v12 = [v7 array];
  id v9 = [(SBHStackConfigurationViewController *)self addButton];
  objc_msgSend(v12, "bs_safeAddObject:", v9);

  uint64_t v10 = [(SBHStackConfigurationViewController *)self doneButton];
  objc_msgSend(v12, "bs_safeAddObject:", v10);

  LOBYTE(v10) = [v12 containsObject:v8];
  if ((v10 & 1) == 0)
  {
    id v11 = [(SBHStackConfigurationViewController *)self delegate];
    if (objc_opt_respondsToSelector()) {
      [v11 stackConfigurationViewControllerDidReceiveUserTouch:self];
    }
  }
}

- (double)titledButtonsAlpha
{
  return self->_titledButtonsAlpha;
}

- (SBHStackConfigurationViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBHStackConfigurationViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SBHWidgetSheetViewControllerPresenter)presenter
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presenter);
  return (SBHWidgetSheetViewControllerPresenter *)WeakRetained;
}

- (void)setPresenter:(id)a3
{
}

- (CGRect)contentBoundingFrame
{
  double x = self->_contentBoundingFrame.origin.x;
  double y = self->_contentBoundingFrame.origin.y;
  double width = self->_contentBoundingFrame.size.width;
  double height = self->_contentBoundingFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setContentBoundingFrame:(CGRect)a3
{
  self->_contentBoundingFrame = a3;
}

- (BOOL)canDismissWhileDragging
{
  return self->_canDismissWhileDragging;
}

- (void)setCanDismissWhileDragging:(BOOL)a3
{
  self->_canDismissWhileDragging = a3;
}

- (BOOL)isEditingIcons
{
  return self->_editingIcons;
}

- (SBIconView)currentConfiguringIconView
{
  return self->_currentConfiguringIconView;
}

- (void)setCurrentConfiguringIconView:(id)a3
{
}

- (SBHIconImageAppearance)overrideIconImageAppearance
{
  return self->_overrideIconImageAppearance;
}

- (SBHIconImageStyleConfiguration)overrideIconImageStyleConfiguration
{
  return self->_overrideIconImageStyleConfiguration;
}

- (SBIconDragManager)iconDragManager
{
  return self->_iconDragManager;
}

- (void)setIconDragManager:(id)a3
{
}

- (SBIconView)currentDraggingIconView
{
  return self->_currentDraggingIconView;
}

- (void)setCurrentDraggingIconView:(id)a3
{
}

- (SBTitledHomeScreenButton)doneButton
{
  return self->_doneButton;
}

- (void)setDoneButton:(id)a3
{
}

- (SBTitledHomeScreenButton)addButton
{
  return self->_addButton;
}

- (void)setAddButton:(id)a3
{
}

- (BOOL)didPerformDrop
{
  return self->_didPerformDrop;
}

- (void)setDidPerformDrop:(BOOL)a3
{
  self->_didPerformDrop = a3;
}

- (BOOL)didRemoveDraggedIconsForDismissal
{
  return self->_didRemoveDraggedIconsForDismissal;
}

- (void)setDidRemoveDraggedIconsForDismissal:(BOOL)a3
{
  self->_didRemoveDraggedIconsForDismissal = a3;
}

- (SBHCustomIconListLayout)customLayout
{
  return self->_customLayout;
}

- (void)setCustomLayout:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customLayout, 0);
  objc_storeStrong((id *)&self->_addButton, 0);
  objc_storeStrong((id *)&self->_doneButton, 0);
  objc_storeStrong((id *)&self->_currentDraggingIconView, 0);
  objc_storeStrong((id *)&self->_iconDragManager, 0);
  objc_storeStrong((id *)&self->_overrideIconImageStyleConfiguration, 0);
  objc_storeStrong((id *)&self->_overrideIconImageAppearance, 0);
  objc_storeStrong((id *)&self->_currentConfiguringIconView, 0);
  objc_destroyWeak((id *)&self->_presenter);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_keepStaticAssertions, 0);
  objc_storeStrong((id *)&self->_draggingEnteredIconListViews, 0);
  objc_storeStrong((id *)&self->_closeConfigurationTimer, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_scalingView, 0);
  objc_storeStrong((id *)&self->_pageControl, 0);
  objc_storeStrong((id *)&self->_pageControlOutsetConstraint, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_scrollingInteraction, 0);
  objc_storeStrong((id *)&self->_apertureSizeConstraint, 0);
  objc_storeStrong((id *)&self->_apertureHeightConstraint, 0);
  objc_storeStrong((id *)&self->_apertureCenterYConstraint, 0);
  objc_storeStrong((id *)&self->_apertureCenterXConstraint, 0);
  objc_storeStrong((id *)&self->_apertureView, 0);
  objc_storeStrong((id *)&self->_backgroundDimmingView, 0);
  objc_storeStrong((id *)&self->_backgroundMaterialView, 0);
  objc_storeStrong((id *)&self->_suggestionsButtonViewController, 0);
  objc_storeStrong((id *)&self->_smartRotateButtonViewController, 0);
  objc_storeStrong((id *)&self->_backgroundViewController, 0);
  objc_storeStrong((id *)&self->_rootListModel, 0);
  objc_storeStrong((id *)&self->_stackIconView, 0);
  objc_storeStrong((id *)&self->_iconListView, 0);
  objc_storeStrong((id *)&self->_widgetSettings, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_iconViewProvider, 0);
  objc_storeStrong((id *)&self->_defaultIconViewDelegate, 0);
  objc_storeStrong((id *)&self->_listLayoutProvider, 0);
  objc_storeStrong((id *)&self->_rootFolderVisualConfiguration, 0);
}

- (void)animationCoordinator
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = NSStringFromSelector(aSelector);
  int v6 = 138412546;
  uint64_t v7 = a1;
  __int16 v8 = 2112;
  id v9 = v5;
  _os_log_error_impl(&dword_1D7F0A000, a3, OS_LOG_TYPE_ERROR, "'%@' forcefully loading view in order to provide a valid animation coordinator. %@ was probably queried outside of a view controller transition animator.", (uint8_t *)&v6, 0x16u);
}

@end