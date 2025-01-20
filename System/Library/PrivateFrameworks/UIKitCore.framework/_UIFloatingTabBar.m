@interface _UIFloatingTabBar
+ (NSCopying)visualStyleRegistryIdentity;
+ (void)registerPlatformMetrics;
- (BOOL)_canDragTab:(id)a3;
- (BOOL)_isEffectivelyEmpty;
- (BOOL)_isRecentItemIndexPath:(id)a3;
- (BOOL)_isValidDropTargetIndexPath:(id)a3;
- (BOOL)collectionView:(id)a3 canEditItemAtIndexPath:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)hasActiveDrag;
- (BOOL)isEditing;
- (BOOL)isInTransitionAnimation;
- (BOOL)scrubbingEnabled;
- (BOOL)selectionViewFollowsHighlightedItem;
- (BOOL)showRecentItem;
- (BOOL)showsSidebarButton;
- (BOOL)tabDragController:(id)a3 canHandleDropSessionForTab:(id)a4;
- (BOOL)tabDragController:(id)a3 isDisplayingTab:(id)a4;
- (CGAffineTransform)additionalTransform;
- (CGPoint)sidebarButtonOrigin;
- (CGRect)_itemFrameForItemAtIndexPath:(id)a3 inCoordinateSpace:(id)a4;
- (CGRect)contentLayoutFrame;
- (CGRect)frameForExpandedDropTarget;
- (CGSize)_maximumContainerSizeForPagination;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSDiffableDataSourceSnapshot)lastSnapshot;
- (NSIndexPath)highlightedIndexPath;
- (NSIndexPath)selectionViewIndexPath;
- (NSString)backdropGroupName;
- (UIAction)sidebarButtonAction;
- (UIButton)sidebarButton;
- (UICollectionViewDiffableDataSource)dataSource;
- (UILongPressGestureRecognizer)editModeGestureRecognizer;
- (UIPointerInteraction)pointerInteraction;
- (UISpringLoadedInteraction)springLoadedInteraction;
- (UISpringLoadedInteractionEffect)blinkEffect;
- (UIView)backgroundCaptureView;
- (UIView)collectionViewContainer;
- (UIView)contentView;
- (UIVisualEffectView)backgroundView;
- (_UIContinuousSelectionGestureRecognizer)selectionGestureRecognizer;
- (_UIEditMenuCollectionView)collectionView;
- (_UIFloatingTabBar)initWithCoder:(id)a3;
- (_UIFloatingTabBar)initWithFrame:(CGRect)a3;
- (_UIFloatingTabBarDragController)dragController;
- (_UIFloatingTabBarListItem)expandedGroupItem;
- (_UIFloatingTabBarListItem)outgoingExpandedGroupItem;
- (_UIFloatingTabBarListItem)recentItem;
- (_UIFloatingTabBarPageButton)leftArrowButton;
- (_UIFloatingTabBarPageButton)rightArrowButton;
- (_UIFloatingTabBarParser)parser;
- (_UIFloatingTabBarPinnedItemsView)pinnedItemsView;
- (_UIFloatingTabBarSelectionContainerView)selectionContainerView;
- (_UIGroupCompletion)selectionFrameGroupCompletion;
- (_UITabModel)tabModel;
- (_UIVisualEffectBackdropView)backdropCaptureView;
- (double)baselineOffsetFromTop;
- (double)contentCornerRadius;
- (id)_contentTabForRecentTab:(id)a3;
- (id)_currentPlatformMetrics;
- (id)_destinationIndexPathForDropSession:(id)a3;
- (id)_indexPathForGestureRecognizer:(id)a3;
- (id)_indexPathForItemAtDataSourceIndex:(int64_t)a3;
- (id)_indexPathForSelectedItem;
- (id)_indexPathForTabItem:(id)a3;
- (id)_tabBarController;
- (id)_targetedPreviewForTab:(id)a3;
- (id)_targetedPreviewForTabAtIndexPath:(id)a3;
- (id)_viewForItemAtIndexPath:(id)a3;
- (id)contentFrameDidChangeBlock;
- (id)currentBackgroundEffect;
- (id)currentSelectionTitle;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (id)resolvedPopoverPresentationControllerSourceItemForTab:(id)a3;
- (id)tabCustomizationProxy;
- (id)tabDragController:(id)a3 destinationIndexPathForDropSession:(id)a4;
- (id)tabDragController:(id)a3 dropProposalForSession:(id)a4;
- (id)tabDragController:(id)a3 previewForCancellingTab:(id)a4;
- (id)tabDragController:(id)a3 previewForInsertingTab:(id)a4;
- (id)tabDragController:(id)a3 previewForLiftingTab:(id)a4;
- (id)tabDragController:(id)a3 tabForBeginningSession:(id)a4;
- (int64_t)_indexInDataSourceForItemAtIndexPath:(id)a3;
- (int64_t)_pageIndexForItemAtIndexPath:(id)a3;
- (void)_animateSelection:(id)a3 completion:(id)a4;
- (void)_createDataSource;
- (void)_createViewHierarchy;
- (void)_didTapLeftArrowButton:(id)a3;
- (void)_didTapRightArrowButton:(id)a3;
- (void)_handleLongPressGestureRecognizer:(id)a3;
- (void)_handleSelectionGesture:(id)a3;
- (void)_invalidateDataSourceAnimated:(BOOL)a3;
- (void)_invalidateFavoriteOrderAnimated:(BOOL)a3;
- (void)_observeScrollViewDidScroll:(id)a3;
- (void)_scrollToSelectedItemAnimated:(BOOL)a3;
- (void)_scrollToSelectedItemIfNeeded;
- (void)_selectItemAtIndexPath:(id)a3;
- (void)_setHasSelectionHighlight:(BOOL)a3 forItemAtIndexPath:(id)a4;
- (void)_setHighlighted:(BOOL)a3 forItemAtIndexPath:(id)a4;
- (void)_setNeedsPaginationScrollTarget;
- (void)_setNeedsPaginationUpdate;
- (void)_setNeedsScrollToSelectedItem;
- (void)_setNeedsSelectionAlphaUpdate;
- (void)_setNeedsSelectionFrameUpdate;
- (void)_setSelectedItem:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)_tabModel:(id)a3 customizationStoreDidChange:(id)a4;
- (void)_tabModel:(id)a3 didChangeSelectedLeaf:(id)a4 previousElement:(id)a5;
- (void)_tabModel:(id)a3 favoriteOrderDidChange:(id)a4 animated:(BOOL)a5;
- (void)_tabModel:(id)a3 favoriteOrderDidReset:(id)a4;
- (void)_tabModel:(id)a3 tabContentDidChange:(id)a4;
- (void)_tabModel:(id)a3 visibilityDidChangeForTab:(id)a4;
- (void)_tabModelDidReload:(id)a3;
- (void)_updateBackgroundShadow;
- (void)_updateContentAlphaForItemAtIndexPath:(id)a3;
- (void)_updateContentAlphaForVisibleCells;
- (void)_updateContentSizeCategory;
- (void)_updateDataSourceFromParserAnimated:(BOOL)a3;
- (void)_updateEditModeGestureRecognizer;
- (void)_updatePaginationIfNeeded;
- (void)_updateSelectedItemAnimated:(BOOL)a3 completion:(id)a4;
- (void)_updateSelectedLeaf:(id)a3 previousElement:(id)a4;
- (void)_updateSelectionViewFrameAnimated:(BOOL)a3 completion:(id)a4;
- (void)_updateSelectionViewVisibilityAnimated:(BOOL)a3;
- (void)_updateTabBarPaginationAnimated:(BOOL)a3;
- (void)_updateTransform;
- (void)_validateRecentItemForParser:(id)a3;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)layoutSubviews;
- (void)prepareForTransitionToVisibility:(BOOL)a3;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillBeginDecelerating:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)setAdditionalTransform:(CGAffineTransform *)a3;
- (void)setBackdropGroupName:(id)a3;
- (void)setBounds:(CGRect)a3;
- (void)setContentFrameDidChangeBlock:(id)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setExpandedGroupItem:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)setFrameForExpandedDropTarget:(CGRect)a3;
- (void)setHighlightedIndexPath:(id)a3;
- (void)setScrubbingEnabled:(BOOL)a3;
- (void)setSelectionViewFollowsHighlightedItem:(BOOL)a3;
- (void)setSelectionViewIndexPath:(id)a3;
- (void)setShowRecentItem:(BOOL)a3;
- (void)setSidebarButtonAction:(id)a3;
- (void)setTabModel:(id)a3;
- (void)tabDragController:(id)a3 acceptItemsIntoTabFromDropSession:(id)a4;
- (void)tabDragController:(id)a3 hideDraggedTab:(id)a4;
- (void)tabDragController:(id)a3 pendingDropTabDidChange:(id)a4;
- (void)tabDragController:(id)a3 updateFavoriteOrderAnimated:(BOOL)a4;
- (void)tabModelEditingStateDidChange;
- (void)transitionDidEnd;
- (void)updateBarForEditingState;
- (void)updateEditingStateIfNeeded;
@end

@implementation _UIFloatingTabBar

- (_UIFloatingTabBar)initWithFrame:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_UIFloatingTabBar;
  v3 = -[UIView initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    +[_UIFloatingTabBar registerPlatformMetrics];
    [(_UIFloatingTabBar *)v3 _createViewHierarchy];
    [(_UIFloatingTabBar *)v3 _createDataSource];
  }
  return v3;
}

- (_UIFloatingTabBar)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_UIFloatingTabBar;
  v3 = [(UIView *)&v5 initWithCoder:a3];
  if (v3)
  {
    +[_UIFloatingTabBar registerPlatformMetrics];
    [(_UIFloatingTabBar *)v3 _createViewHierarchy];
    [(_UIFloatingTabBar *)v3 _createDataSource];
  }
  return v3;
}

- (void)setTabModel:(id)a3
{
  id v5 = a3;
  p_tabModel = &self->_tabModel;
  v7 = self->_tabModel;
  v8 = (_UITabModel *)v5;
  v15 = v8;
  if (v7 == v8)
  {

    v10 = v15;
LABEL_11:

    goto LABEL_12;
  }
  if (v8 && v7)
  {
    char v9 = [(_UITabModel *)v7 isEqual:v8];

    if (v9) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  v11 = [(_UITabModel *)*p_tabModel tabItems];
  uint64_t v12 = [v11 count];

  [(_UITabModel *)*p_tabModel removeObserver:self];
  objc_storeStrong((id *)&self->_tabModel, a3);
  -[_UICollectionViewAnimationContext setAnimationsForOnScreenViews:]((uint64_t)self->_parser, v15);
  [(_UITabModel *)*p_tabModel addObserver:self];
  [(_UIFloatingTabBar *)self _updateEditModeGestureRecognizer];
  if (v12
    || ([(_UITabModel *)v15 tabItems],
        v13 = objc_claimAutoreleasedReturnValue(),
        uint64_t v14 = [v13 count],
        v13,
        v14))
  {
    [(_UIFloatingTabBar *)self _invalidateDataSourceAnimated:0];
    v10 = [(_UITabModel *)v15 selectedLeaf];
    [(_UIFloatingTabBar *)self _updateSelectedLeaf:v10 previousElement:0];
    goto LABEL_11;
  }
LABEL_12:
}

- (id)_tabBarController
{
  v2 = [(_UIFloatingTabBar *)self tabModel];
  v3 = [v2 tabBarController];

  return v3;
}

- (BOOL)showsSidebarButton
{
  if (!self->_sidebarButtonAction || [(_UIFloatingTabBar *)self isEditing]) {
    return 0;
  }
  v4 = [(_UIFloatingTabBar *)self tabModel];
  id v5 = [v4 tabItems];
  BOOL v3 = [v5 count] != 0;

  return v3;
}

- (void)setSidebarButtonAction:(id)a3
{
  id v7 = a3;
  if (self->_sidebarButtonAction)
  {
    id v5 = [(_UIFloatingTabBar *)self sidebarButton];
    [v5 removeAction:self->_sidebarButtonAction forControlEvents:0x2000];
  }
  objc_storeStrong((id *)&self->_sidebarButtonAction, a3);
  if (v7)
  {
    v6 = [(_UIFloatingTabBar *)self sidebarButton];
    [v6 addAction:v7 forControlEvents:0x2000];
  }
  [(_UIFloatingTabBar *)self _setNeedsPaginationUpdate];
  [(_UIFloatingTabBar *)self _setNeedsSelectionFrameUpdate];
}

- (UIButton)sidebarButton
{
  v20[1] = *MEMORY[0x1E4F143B8];
  if (!self->_sidebarButton && [(_UIFloatingTabBar *)self showsSidebarButton])
  {
    BOOL v3 = [(UIView *)self traitCollection];
    v4 = _UIFloatingTabBarGetPlatformMetrics([v3 userInterfaceIdiom]);

    id v5 = [v4 sidebarButtonConfiguration];
    v6 = [v4 contentPaletteProvider];
    id v7 = [(UIView *)self traitCollection];
    v8 = v6[2](v6, [v7 userInterfaceStyle]);
    char v9 = [v8 inactiveColor];
    [v5 setBaseForegroundColor:v9];

    v10 = [(_UIFloatingTabBar *)self sidebarButtonAction];
    v11 = +[UIButton buttonWithConfiguration:v5 primaryAction:v10];

    [(UIView *)v11 _setContinuousCornerRadius:*MEMORY[0x1E4F3A430]];
    [(UIButton *)v11 setSpringLoaded:1];
    [(UIView *)v11 setAlpha:0.0];
    v20[0] = 0x1ED3F5A48;
    uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
    id v13 = [(UIView *)v11 _registerForTraitTokenChanges:v12 withHandler:&__block_literal_global_645];

    uint64_t v14 = +[UIHoverHighlightEffect effect];
    v15 = +[UIShape capsuleShape];
    v16 = +[UIHoverStyle styleWithEffect:v14 shape:v15];
    [(UIControl *)v11 setHoverStyle:v16];

    [(UIView *)self->_contentView addSubview:v11];
    sidebarButton = self->_sidebarButton;
    self->_sidebarButton = v11;
  }
  v18 = self->_sidebarButton;
  return v18;
}

- (void)setBackdropGroupName:(id)a3
{
  objc_storeStrong((id *)&self->_backdropGroupName, a3);
  id v5 = a3;
  id v6 = [(_UIFloatingTabBar *)self backgroundView];
  [v6 _setGroupName:v5];
}

- (void)setAdditionalTransform:(CGAffineTransform *)a3
{
  p_additionalTransform = &self->_additionalTransform;
  long long v6 = *(_OWORD *)&self->_additionalTransform.c;
  *(_OWORD *)&t1.a = *(_OWORD *)&self->_additionalTransform.a;
  *(_OWORD *)&t1.c = v6;
  *(_OWORD *)&t1.tx = *(_OWORD *)&self->_additionalTransform.tx;
  long long v7 = *(_OWORD *)&a3->c;
  *(_OWORD *)&v10.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&v10.c = v7;
  *(_OWORD *)&v10.tx = *(_OWORD *)&a3->tx;
  if (!CGAffineTransformEqualToTransform(&t1, &v10))
  {
    long long v8 = *(_OWORD *)&a3->a;
    long long v9 = *(_OWORD *)&a3->tx;
    *(_OWORD *)&p_additionalTransform->c = *(_OWORD *)&a3->c;
    *(_OWORD *)&p_additionalTransform->tx = v9;
    *(_OWORD *)&p_additionalTransform->a = v8;
    [(_UIFloatingTabBar *)self _updateTransform];
  }
}

- (double)contentCornerRadius
{
  [(UIVisualEffectView *)self->_backgroundView _continuousCornerRadius];
  return result;
}

- (CGPoint)sidebarButtonOrigin
{
  sidebarButton = self->_sidebarButton;
  BOOL v3 = [(_UIFloatingTabBar *)self contentView];
  -[UIView convertPoint:toView:](sidebarButton, "convertPoint:toView:", v3, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.y = v9;
  result.x = v8;
  return result;
}

- (CGRect)contentLayoutFrame
{
  [(UIView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v7 = [(_UIFloatingTabBar *)self contentView];
  [v7 frame];
  double v9 = v8;
  double v11 = v10;

  double v12 = v9;
  double v13 = v4;
  double v14 = v11;
  double v15 = v6;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (id)currentSelectionTitle
{
  double v3 = [(_UIFloatingTabBar *)self _indexPathForSelectedItem];
  double v4 = [(_UIFloatingTabBar *)self dataSource];
  double v5 = [v4 itemIdentifierForIndexPath:v3];

  if (v5)
  {
    double v6 = [v5 contentTab];
    double v7 = [v6 _compactRepresentation];
    if (v7)
    {
      double v8 = [v6 _compactRepresentation];
      double v9 = [v8 title];
    }
    else
    {
      double v9 = [v6 title];
    }
  }
  else
  {
    double v9 = 0;
  }

  return v9;
}

- (id)currentBackgroundEffect
{
  v2 = [(_UIFloatingTabBar *)self backgroundView];
  double v3 = [v2 effect];

  return v3;
}

- (void)prepareForTransitionToVisibility:(BOOL)a3
{
  BOOL v3 = a3;
  p_backdropCaptureView = &self->_backdropCaptureView;
  obj = self->_backdropCaptureView;
  if (!obj)
  {
    obj = objc_alloc_init(_UIVisualEffectBackdropView);
    double v6 = [(_UIFloatingTabBar *)self contentView];
    [v6 bounds];
    -[UIView setFrame:](obj, "setFrame:");

    [(UIView *)obj setAutoresizingMask:18];
    objc_storeStrong((id *)p_backdropCaptureView, obj);
  }
  double v7 = [(_UIFloatingTabBar *)self contentView];
  [v7 insertSubview:obj atIndex:0];

  if (v3 && (*(unsigned char *)&self->_needsUpdate & 0x20) != 0)
  {
    if (![(_UIFloatingTabBar *)self isEditing]) {
      [(_UIFloatingTabBar *)self _scrollToSelectedItemAnimated:0];
    }
    *(unsigned char *)&self->_needsUpdate &= ~0x20u;
  }
  self->_isInTransitionAnimation = 1;
}

- (void)transitionDidEnd
{
  [(UIView *)self->_backdropCaptureView removeFromSuperview];
  backdropCaptureView = self->_backdropCaptureView;
  self->_backdropCaptureView = 0;

  self->_isInTransitionAnimation = 0;
}

- (void)_createViewHierarchy
{
  v61[1] = *MEMORY[0x1E4F143B8];
  self->_showRecentItem = 1;
  uint64_t v3 = MEMORY[0x1E4F1DAB8];
  long long v4 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&self->_additionalTransform.a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&self->_additionalTransform.c = v4;
  *(_OWORD *)&self->_additionalTransform.tx = *(_OWORD *)(v3 + 32);
  CGSize v5 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
  self->_frameForExpandedDropTarget.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
  self->_frameForExpandedDropTarget.size = v5;
  v50 = [(_UIFloatingTabBar *)self _currentPlatformMetrics];
  double v6 = objc_alloc_init(_UIVisualEffectBackdropView);
  [(UIView *)self addSubview:v6];
  v47 = v6;
  objc_storeStrong((id *)&self->_backgroundCaptureView, v6);
  double v7 = [UIVisualEffectView alloc];
  double v8 = [v50 backgroundEffect];
  v53 = [(UIVisualEffectView *)v7 initWithEffect:v8];

  double v9 = [(_UIFloatingTabBar *)self backdropGroupName];
  [(UIVisualEffectView *)v53 _setGroupName:v9];

  [(UIVisualEffectView *)v53 _setCaptureView:v47];
  double v10 = [(UIView *)v53 layer];
  [v10 setShadowPathIsBounds:1];

  double v11 = [(UIView *)v53 layer];
  [v11 setCornerCurve:*MEMORY[0x1E4F39EA8]];

  double v12 = [(UIView *)v53 layer];
  [v12 setCornerRadius:*MEMORY[0x1E4F3A430]];

  double v13 = [(UIVisualEffectView *)v53 _backgroundHost];
  double v14 = [v13 contentView];
  double v15 = [v14 layer];
  [v15 setAllowsEdgeAntialiasing:1];

  [(UIView *)self addSubview:v53];
  objc_storeStrong((id *)&self->_backgroundView, v53);
  v16 = objc_opt_new();
  [v16 _setOverrideVibrancyTrait:1];
  [v16 _setOverrideUserInterfaceRenderingMode:2];
  [(UIView *)self addSubview:v16];
  objc_storeStrong((id *)&self->_contentView, v16);
  v17 = [_UIFloatingTabBarSelectionContainerView alloc];
  double v18 = *MEMORY[0x1E4F1DB28];
  double v19 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v20 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v21 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  v22 = -[_UIFloatingTabBarSelectionContainerView initWithFrame:](v17, "initWithFrame:", *MEMORY[0x1E4F1DB28], v19, v20, v21);
  [v16 addSubview:v22];
  v45 = v22;
  objc_storeStrong((id *)&self->_selectionContainerView, v22);
  v23 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", v18, v19, v20, v21);
  [v16 addSubview:v23];
  v46 = v23;
  objc_storeStrong((id *)&self->_collectionViewContainer, v23);
  v44 = [[_UIFloatingTabBarCollectionViewLayout alloc] initWithFloatingTabBar:self];
  v24 = -[UICollectionView initWithFrame:collectionViewLayout:]([_UIFloatingTabBarCollectionView alloc], "initWithFrame:collectionViewLayout:", v44, v18, v19, v20, v21);
  -[UICollectionView setPrefetchingEnabled:](v24, "setPrefetchingEnabled:", [v50 supportsGroupClusters] ^ 1);
  [(UICollectionView *)v24 setDelegate:self];
  [(UICollectionView *)v24 setBackgroundColor:0];
  [(UIScrollView *)v24 setPagingEnabled:1];
  [(UICollectionView *)v24 setAllowsSelection:0];
  [(UICollectionView *)v24 setAllowsMultipleSelection:0];
  [(UIScrollView *)v24 setShowsVerticalScrollIndicator:0];
  [(UIScrollView *)v24 setShowsHorizontalScrollIndicator:0];
  [(UIView *)v24 setClipsToBounds:0];
  [(UIScrollView *)v24 _setAdjustsTargetsOnContentOffsetChanges:0];
  [(UIScrollView *)v24 _setAutoScrollEnabled:0];
  v25 = [(UIView *)v24 layer];
  [v25 setAllowsGroupOpacity:0];

  [(UICollectionView *)v24 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"UIFloatingTabBar.Cell"];
  [(UICollectionView *)v24 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"UIFloatingTabBar.GroupCell"];
  [(UICollectionView *)v24 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"UIFloatingTabBar.PlaceholderCell"];
  objc_initWeak(&location, self);
  v56[0] = MEMORY[0x1E4F143A8];
  v56[1] = 3221225472;
  v56[2] = __41___UIFloatingTabBar__createViewHierarchy__block_invoke;
  v56[3] = &unk_1E52DC308;
  objc_copyWeak(&v57, &location);
  [(_UIFloatingTabBarCollectionView *)v24 setLayoutSubviewHandler:v56];
  [(UIView *)v46 addSubview:v24];
  objc_storeStrong((id *)&self->_collectionView, v24);
  v26 = [(UIScrollView *)v24 panGestureRecognizer];
  [v16 addGestureRecognizer:v26];

  obj = -[_UIFloatingTabBarPinnedItemsView initWithFrame:]([_UIFloatingTabBarPinnedItemsView alloc], "initWithFrame:", v18, v19, v20, v21);
  [v16 addSubview:obj];
  objc_storeStrong((id *)&self->_pinnedItemsView, obj);
  v52 = [[_UIFloatingTabBarPageButton alloc] initWithDirection:0];
  v27 = [(_UIFloatingTabBarPageButton *)v52 button];
  [v27 addTarget:self action:sel__didTapLeftArrowButton_ forControlEvents:0x2000];

  [v16 addSubview:v52];
  objc_storeStrong((id *)&self->_leftArrowButton, v52);
  v51 = [[_UIFloatingTabBarPageButton alloc] initWithDirection:1];
  v28 = [(_UIFloatingTabBarPageButton *)v51 button];
  [v28 addTarget:self action:sel__didTapRightArrowButton_ forControlEvents:0x2000];

  [v16 addSubview:v51];
  objc_storeStrong((id *)&self->_rightArrowButton, v51);
  v29 = [(_UIFloatingTabBar *)self collectionView];
  [v29 _addScrollViewScrollObserver:self];

  [(_UIFloatingTabBar *)self _setNeedsSelectionFrameUpdate];
  v30 = [(UIGestureRecognizer *)[_UIContinuousSelectionGestureRecognizer alloc] initWithTarget:self action:sel__handleSelectionGesture_];
  [(UIGestureRecognizer *)v30 setCancelsTouchesInView:0];
  [(UIGestureRecognizer *)v30 setDelegate:self];
  [v16 addGestureRecognizer:v30];
  objc_storeStrong((id *)&self->_selectionGestureRecognizer, v30);
  v48 = [[UIPointerInteraction alloc] initWithDelegate:self];
  [v16 addInteraction:v48];
  objc_storeStrong((id *)&self->_pointerInteraction, v48);
  v31 = [[_UIFloatingTabBarDragController alloc] initWithDelegate:self view:self];
  dragController = self->_dragController;
  self->_dragController = v31;

  v33 = +[UISpringLoadedInteraction _blinkEffect];
  blinkEffect = self->_blinkEffect;
  self->_blinkEffect = v33;

  v35 = objc_alloc_init(_UIFloatingTabBarSpringLoadedInteractionBehavior);
  [(_UIFloatingTabBarSpringLoadedInteractionBehavior *)v35 setTabBar:self];
  v36 = [UISpringLoadedInteraction alloc];
  v54[0] = MEMORY[0x1E4F143A8];
  v54[1] = 3221225472;
  v54[2] = __41___UIFloatingTabBar__createViewHierarchy__block_invoke_2;
  v54[3] = &unk_1E530F1F0;
  objc_copyWeak(&v55, &location);
  v37 = [(UISpringLoadedInteraction *)v36 initWithInteractionBehavior:v35 interactionEffect:v35 activationHandler:v54];
  [v16 addInteraction:v37];
  _UIBarsSetAccessibilityLimits(self);
  [(UIView *)self setTintAdjustmentMode:1];
  v61[0] = 0x1ED3F5A60;
  v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:v61 count:1];
  id v39 = [(UIView *)self _registerForTraitTokenChanges:v38 withTarget:self action:sel_setNeedsLayout];

  v60[0] = 0x1ED3F5AD8;
  v60[1] = 0x1ED3F5B38;
  v60[2] = 0x1ED3F5A60;
  v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:v60 count:3];
  id v41 = [(UIView *)self _registerForTraitTokenChanges:v40 withTarget:self action:sel__updateContentSizeCategory];

  uint64_t v59 = 0x1ED3F5A48;
  v42 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v59 count:1];
  id v43 = [(UIView *)self _registerForTraitTokenChanges:v42 withTarget:self action:sel__updateBackgroundShadow];

  objc_destroyWeak(&v55);
  objc_destroyWeak(&v57);
  objc_destroyWeak(&location);
}

- (void)_createDataSource
{
  objc_initWeak(&location, self);
  long long v4 = [UICollectionViewDiffableDataSource alloc];
  CGSize v5 = [(_UIFloatingTabBar *)self collectionView];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __38___UIFloatingTabBar__createDataSource__block_invoke;
  v13[3] = &unk_1E530F218;
  objc_copyWeak(v14, &location);
  v14[1] = (id)a2;
  double v6 = [(UICollectionViewDiffableDataSource *)v4 initWithCollectionView:v5 cellProvider:v13];
  dataSource = self->_dataSource;
  self->_dataSource = v6;

  double v8 = objc_alloc_init(_UIFloatingTabBarParser);
  parser = self->_parser;
  self->_parser = v8;

  double v10 = [(_UIFloatingTabBar *)self _currentPlatformMetrics];
  char v11 = [v10 supportsGroupClusters];
  double v12 = self->_parser;
  if (v12) {
    v12->_supportsGroupClusters = v11;
  }

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
}

- (void)_invalidateDataSourceAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v14 = [(_UIFloatingTabBar *)self parser];
  CGSize v5 = [(_UIFloatingTabBar *)self dragController];
  double v6 = [v5 pendingDropTab];
  -[_UIDocumentUnavailableConfiguration setDocumentTargetView:]((uint64_t)v14, v6);

  double v7 = [(_UIFloatingTabBar *)self dragController];
  double v8 = [v7 pendingFavoriteOrder];
  -[UIBackgroundConfiguration _setImage:]((uint64_t)v14, v8);

  double v9 = (void *)MEMORY[0x1E4F1CAD0];
  double v10 = [(_UIFloatingTabBar *)self dragController];
  char v11 = [v10 pendingDropTab];
  double v12 = [v11 identifier];
  double v13 = objc_msgSend(v9, "setWithObjects:", v12, 0);
  -[_UIFloatingTabBarParser setIgnoredFavoriteOrderItems:]((uint64_t)v14, v13);

  -[_UIFloatingTabBarParser reloadItems]((uint64_t)v14);
  [(_UIFloatingTabBar *)self _updateDataSourceFromParserAnimated:v3];
}

- (void)_invalidateFavoriteOrderAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v14 = [(_UIFloatingTabBar *)self parser];
  CGSize v5 = [(_UIFloatingTabBar *)self dragController];
  double v6 = [v5 pendingDropTab];
  -[_UIDocumentUnavailableConfiguration setDocumentTargetView:]((uint64_t)v14, v6);

  double v7 = [(_UIFloatingTabBar *)self dragController];
  double v8 = [v7 pendingFavoriteOrder];
  -[UIBackgroundConfiguration _setImage:]((uint64_t)v14, v8);

  double v9 = (void *)MEMORY[0x1E4F1CAD0];
  double v10 = [(_UIFloatingTabBar *)self dragController];
  char v11 = [v10 pendingDropTab];
  double v12 = [v11 identifier];
  double v13 = objc_msgSend(v9, "setWithObjects:", v12, 0);
  -[_UIFloatingTabBarParser setIgnoredFavoriteOrderItems:]((uint64_t)v14, v13);

  -[_UIFloatingTabBarParser invalidateFavorites]((uint64_t)v14);
  [(_UIFloatingTabBar *)self _updateDataSourceFromParserAnimated:v3];
}

- (void)_updateDataSourceFromParserAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  v21[1] = *MEMORY[0x1E4F143B8];
  CGSize v5 = [(_UIFloatingTabBar *)self parser];
  id v6 = objc_alloc_init((Class)off_1E52D2BB8);
  [v6 appendSectionsWithIdentifiers:&unk_1ED3F17E0];
  double v7 = -[_UIFloatingTabBarParser fixedItems](v5);
  [v6 appendItemsWithIdentifiers:v7];

  [v6 appendSectionsWithIdentifiers:&unk_1ED3F17F8];
  double v8 = -[_UIFloatingTabBarParser items](v5);
  [v6 appendItemsWithIdentifiers:v8];

  [(_UIFloatingTabBar *)self _validateRecentItemForParser:v5];
  double v9 = [(_UIFloatingTabBar *)self recentItem];
  if (v9)
  {
    double v10 = [(_UIFloatingTabBar *)self tabModel];
    char v11 = [v10 isEditing];

    if ((v11 & 1) == 0)
    {
      [v6 appendSectionsWithIdentifiers:&unk_1ED3F1810];
      double v12 = [(_UIFloatingTabBar *)self recentItem];
      v21[0] = v12;
      double v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
      [v6 appendItemsWithIdentifiers:v13];
    }
  }
  objc_storeStrong((id *)&self->_lastSnapshot, v6);
  objc_initWeak(&location, self);
  dataSource = self->_dataSource;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __57___UIFloatingTabBar__updateDataSourceFromParserAnimated___block_invoke;
  v17[3] = &unk_1E52E7E68;
  objc_copyWeak(&v18, &location);
  BOOL v19 = v3;
  [(UICollectionViewDiffableDataSource *)dataSource applySnapshot:v6 animatingDifferences:v3 completion:v17];
  double v15 = [(_UIFloatingTabBar *)self pinnedItemsView];
  v16 = -[_UIFloatingTabBarParser pinnedItems](v5);
  [v15 setItems:v16 animated:v3];

  [(_UIFloatingTabBar *)self _updateTabBarPaginationAnimated:v3];
  [(_UIFloatingTabBar *)self _updateSelectionViewFrameAnimated:v3 completion:0];
  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

- (void)_updateContentSizeCategory
{
  [(_UIFloatingTabBar *)self _setNeedsPaginationUpdate];
  [(_UIFloatingTabBar *)self _setNeedsSelectionFrameUpdate];
  id v4 = [(_UIFloatingTabBar *)self collectionView];
  BOOL v3 = [v4 collectionViewLayout];
  [v3 invalidateLayout];
}

- (id)_viewForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  if ([v4 section] == 3)
  {
    CGSize v5 = [(_UIFloatingTabBar *)self pinnedItemsView];
    uint64_t v6 = [v4 item];

    double v7 = [v5 itemViewForItemAtIndex:v6];
  }
  else
  {
    CGSize v5 = [(_UIFloatingTabBar *)self collectionView];
    double v8 = [v5 cellForItemAtIndexPath:v4];

    double v7 = [v8 contentView];
  }
  return v7;
}

- (void)_updateTransform
{
  BOOL v3 = [(_UIFloatingTabBar *)self _currentPlatformMetrics];
  memset(&v14, 0, sizeof(v14));
  id v4 = [(_UIFloatingTabBar *)self tabModel];
  if ([v4 isEditing])
  {
    if (v3) {
      [v3 editModeTransform];
    }
    else {
      memset(&v14, 0, sizeof(v14));
    }
  }
  else
  {
    long long v5 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&v14.a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&v14.c = v5;
    *(_OWORD *)&v14.tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  }

  memset(&v13, 0, sizeof(v13));
  [(_UIFloatingTabBar *)self additionalTransform];
  CGAffineTransform t1 = v14;
  CGAffineTransformConcat(&v13, &t1, &t2);
  [(UIView *)self transform];
  CGAffineTransform t1 = v13;
  if (!CGAffineTransformEqualToTransform(&t1, &v10))
  {
    CGAffineTransform v9 = v13;
    [(UIView *)self setTransform:&v9];
    uint64_t v6 = [(_UIFloatingTabBar *)self contentFrameDidChangeBlock];

    if (v6)
    {
      double v7 = [(_UIFloatingTabBar *)self contentFrameDidChangeBlock];
      double v8 = [(_UIFloatingTabBar *)self contentView];
      [v8 frame];
      v7[2](v7);
    }
  }
}

- (void)_updateBackgroundShadow
{
  id v9 = [(_UIFloatingTabBar *)self _currentPlatformMetrics];
  BOOL v3 = objc_opt_new();
  id v4 = [(_UIFloatingTabBar *)self tabModel];
  if ([v4 isEditing])
  {
    long long v5 = [v9 editModeBackgroundShadowProvider];

    if (!v5) {
      goto LABEL_5;
    }
    id v4 = [v9 editModeBackgroundShadowProvider];
    uint64_t v6 = [(UIView *)self traitCollection];
    uint64_t v7 = v4[2](v4, [v6 userInterfaceStyle]);

    BOOL v3 = (void *)v7;
  }

LABEL_5:
  double v8 = [(_UIFloatingTabBar *)self backgroundView];
  [v3 applyToView:v8];
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(UIView *)self bounds];
  if (v9 != width || v8 != height) {
    [(_UIFloatingTabBar *)self _setNeedsPaginationUpdate];
  }
  v11.receiver = self;
  v11.super_class = (Class)_UIFloatingTabBar;
  -[UIView setBounds:](&v11, sel_setBounds_, x, y, width, height);
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(UIView *)self frame];
  if (v9 != width || v8 != height) {
    [(_UIFloatingTabBar *)self _setNeedsPaginationUpdate];
  }
  v11.receiver = self;
  v11.super_class = (Class)_UIFloatingTabBar;
  -[UIView setFrame:](&v11, sel_setFrame_, x, y, width, height);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  if (self->_largestItemHeight == 0.0)
  {
    double height = a3.height;
    uint64_t v6 = objc_alloc_init(_UIFloatingTabBarItemView);
    [(UIView *)v6 setHidden:1];
    [(_UIFloatingTabBarItemView *)v6 setEditing:0];
    uint64_t v7 = [(_UIFloatingTabBar *)self contentView];
    [v7 addSubview:v6];

    -[_UIFloatingTabBarItemView sizeThatFits:](v6, "sizeThatFits:", width, height);
    self->_largestItemHeight = v8;
    [(_UIFloatingTabBarItemView *)v6 baselineOffsetFromTop];
    self->_minimumItemBaselineFromTop = v9;
    [(UIView *)v6 removeFromSuperview];
  }
  CGAffineTransform v10 = [(_UIFloatingTabBar *)self _currentPlatformMetrics];
  [v10 backgroundInsets];
  double v12 = v11;
  double v14 = v13;

  double v15 = self->_largestItemHeight + v12 + v14;
  double v16 = width;
  result.double height = v15;
  result.double width = v16;
  return result;
}

- (void)layoutSubviews
{
  v122.receiver = self;
  v122.super_class = (Class)_UIFloatingTabBar;
  [(UIView *)&v122 layoutSubviews];
  [(_UIFloatingTabBar *)self _updatePaginationIfNeeded];
  BOOL v3 = [(_UIFloatingTabBar *)self _currentPlatformMetrics];
  BOOL v4 = [(UIView *)self _shouldReverseLayoutDirection];
  if ([(_UIFloatingTabBar *)self _isEffectivelyEmpty])
  {
    long long v5 = [(_UIFloatingTabBar *)self recentItem];
    BOOL v6 = v5 == 0;
  }
  else
  {
    BOOL v6 = 0;
  }
  [(UIView *)self bounds];
  double v109 = v7;
  double v110 = v8;
  double v10 = v9;
  double v12 = v11;
  double v13 = [(_UIFloatingTabBar *)self leftArrowButton];
  objc_msgSend(v13, "sizeThatFits:", v10, v12);
  double v15 = v14;

  double v16 = [(_UIFloatingTabBar *)self sidebarButton];
  objc_msgSend(v16, "sizeThatFits:", v10, v12);
  double v18 = v17;

  BOOL v19 = [(_UIFloatingTabBar *)self showsSidebarButton];
  double v20 = *MEMORY[0x1E4F1DB30];
  double v106 = v18;
  if (v19) {
    double v20 = v18;
  }
  double v120 = v20;
  double v21 = [(_UIFloatingTabBar *)self pinnedItemsView];
  double v107 = v10;
  double v108 = v12;
  objc_msgSend(v21, "sizeThatFits:", v10, v12);
  double v23 = v22;

  v24 = [(_UIFloatingTabBar *)self collectionView];
  [v24 currentPage];
  double v26 = v25;

  double v27 = fmax(fmin(v26, 1.0), 0.0);
  v28 = [(_UIFloatingTabBar *)self collectionView];
  v29 = [v28 pages];
  double v30 = fmax(fmin((double)(unint64_t)[v29 count] - v26 + -1.0, 1.0), 0.0);

  if (v4) {
    double v31 = v30;
  }
  else {
    double v31 = v27;
  }
  if (v4) {
    double v32 = v27;
  }
  else {
    double v32 = v30;
  }
  double v113 = v31;
  double v114 = v15;
  double v33 = v15 * v31;
  double v115 = v32;
  double v34 = v15 * v32;
  [v3 backgroundInsets];
  double v36 = v35;
  double v38 = v37;
  double v40 = v39;
  double v42 = v41;
  double v112 = v33;
  double v43 = v120 + v33;
  double v104 = v23;
  double v44 = v23 + v34 + v43;
  double largestPageWidth = self->_largestPageWidth;
  v45 = [(_UIFloatingTabBar *)self collectionView];
  [v45 viewWidthForPageProgress:v26];
  double v117 = v38;
  double v47 = v42 + v38 + v46 + v44;

  recCGAffineTransform t2 = v36;
  double v48 = v40 + v36 + self->_largestItemHeight;
  v49 = [(_UIFloatingTabBar *)self collectionViewContainer];
  objc_msgSend(v49, "setFrame:", 0.0, 0.0, v47, v48);

  v50 = [(_UIFloatingTabBar *)self collectionViewContainer];
  [v50 _setContinuousCornerRadius:v48 * 0.5];

  v51 = [(_UIFloatingTabBar *)self selectionContainerView];
  objc_msgSend(v51, "setFrame:", 0.0, 0.0, v47, v48);

  v52 = [(_UIFloatingTabBar *)self selectionContainerView];
  double v116 = v48 * 0.5;
  [v52 _setContinuousCornerRadius:v48 * 0.5];

  v53 = [(_UIFloatingTabBar *)self collectionView];
  [v53 frame];
  double v102 = v54;

  double v100 = v42;
  double v111 = v34;
  if (v4)
  {
    double v55 = v47 - v42;
    double v56 = v104;
    double v57 = v55 - largestPageWidth - v34 - v120;
    double v58 = largestPageWidth;
  }
  else
  {
    double v57 = v38 + v43;
    double v55 = v47 - v42;
    double v58 = largestPageWidth;
    double v56 = v104;
  }
  uint64_t v59 = [(_UIFloatingTabBar *)self collectionView];
  double v105 = v57;
  objc_msgSend(v59, "setFrame:", v57, 0.0, v58, v48);

  v60 = [(_UIFloatingTabBar *)self collectionView];
  objc_msgSend(v60, "_setVisibleRectEdgeInsets:", 0.0, -(v120 + v114 + v44), 0.0, -(v120 + v114 + v44));

  double v61 = v120 + v55 - v38 - v44;
  if (v4) {
    double v61 = 0.0;
  }
  double v62 = v38 + v112 + v61;
  v63 = [(_UIFloatingTabBar *)self pinnedItemsView];
  double v121 = v48;
  objc_msgSend(v63, "setFrame:", v62, 0.0, v56, v48);

  double largestItemHeight = self->_largestItemHeight;
  if (v6) {
    double v65 = 0.0;
  }
  else {
    double v65 = v47;
  }
  v66 = [(_UIFloatingTabBar *)self leftArrowButton];
  objc_msgSend(v66, "setFrame:", v112 - v114, rect2, v114, largestItemHeight);

  v67 = [(_UIFloatingTabBar *)self leftArrowButton];
  [v67 setContentOpacity:v113];

  double v68 = v65;
  v69 = [(_UIFloatingTabBar *)self rightArrowButton];
  objc_msgSend(v69, "setFrame:", v65 - v111, rect2, v114, largestItemHeight);

  v70 = [(_UIFloatingTabBar *)self rightArrowButton];
  [v70 setContentOpacity:v115];

  if (v4)
  {
    v71 = [(_UIFloatingTabBar *)self rightArrowButton];
    [v71 frame];
    double v72 = v106;
    double v73 = v107;
    double v74 = CGRectGetMinX(v123) - v106 - v101;
    double v76 = v109;
    double v75 = v110;
    double v77 = v108;
  }
  else
  {
    v71 = [(_UIFloatingTabBar *)self leftArrowButton];
    [v71 frame];
    double v74 = v117 + CGRectGetMaxX(v124);
    double v76 = v109;
    double v75 = v110;
    double v73 = v107;
    double v77 = v108;
    double v72 = v106;
  }

  v78 = [(_UIFloatingTabBar *)self sidebarButton];
  objc_msgSend(v78, "setFrame:", v74, rect2, v72, largestItemHeight);

  if ([(_UIFloatingTabBar *)self showsSidebarButton]) {
    double v79 = 1.0;
  }
  else {
    double v79 = 0.0;
  }
  v80 = [(_UIFloatingTabBar *)self sidebarButton];
  [v80 setAlpha:v79];

  double v81 = v76 + (v73 - v68) * 0.5;
  double v82 = v75 + (v77 - v121) * 0.5;
  v83 = [(_UIFloatingTabBar *)self contentView];
  [v83 frame];
  CGFloat v85 = v84;
  CGFloat rect2a = v86;
  CGFloat v88 = v87;
  CGFloat v90 = v89;

  v91 = [(_UIFloatingTabBar *)self contentView];
  objc_msgSend(v91, "setFrame:", v81, v82, v68, v121);

  v92 = [(_UIFloatingTabBar *)self backgroundCaptureView];
  objc_msgSend(v92, "setFrame:", v81, v82, v68, v121);

  v93 = [(_UIFloatingTabBar *)self backgroundView];
  objc_msgSend(v93, "setFrame:", v81, v82, v68, v121);

  v94 = [(_UIFloatingTabBar *)self contentView];
  [v94 _setContinuousCornerRadius:v116];

  v95 = [(_UIFloatingTabBar *)self backgroundView];
  [v95 _setContinuousCornerRadius:v116];

  uint64_t v96 = [(_UIFloatingTabBar *)self contentFrameDidChangeBlock];
  if (v96)
  {
    v97 = (void *)v96;
    v125.origin.double x = v81;
    v125.origin.double y = v82;
    v125.size.double width = v68;
    v125.size.double height = v121;
    v126.origin.double x = v85;
    v126.origin.double y = rect2a;
    v126.size.double width = v88;
    v126.size.double height = v90;
    BOOL v98 = CGRectEqualToRect(v125, v126);

    if (!v98)
    {
      v99 = [(_UIFloatingTabBar *)self contentFrameDidChangeBlock];
      v99[2](v81, v82, v68, v121);
    }
  }
  if ((*(unsigned char *)&self->_needsUpdate & 2) != 0 || v102 != v105) {
    [(_UIFloatingTabBar *)self _updateSelectionViewFrameAnimated:0 completion:0];
  }
}

- (void)_updateTabBarPaginationAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  [(_UIFloatingTabBar *)self _setNeedsPaginationUpdate];
  if (v3)
  {
    uint64_t v5 = [(UIView *)self window];
    if (v5)
    {
      BOOL v6 = (void *)v5;
      double v7 = [(_UIFloatingTabBar *)self contentView];
      [v7 frame];
      IsEmptdouble y = CGRectIsEmpty(v10);

      if (!IsEmpty)
      {
        v9[0] = MEMORY[0x1E4F143A8];
        v9[1] = 3221225472;
        v9[2] = __53___UIFloatingTabBar__updateTabBarPaginationAnimated___block_invoke;
        v9[3] = &unk_1E52D9F70;
        v9[4] = self;
        [(_UIFloatingTabBar *)self _animateSelection:v9 completion:0];
      }
    }
  }
}

- (void)_setNeedsPaginationUpdate
{
  *(unsigned char *)&self->_needsUpdate |= 1u;
  [(UIView *)self setNeedsLayout];
}

- (void)_setNeedsPaginationScrollTarget
{
  *(unsigned char *)&self->_needsUpdate |= 0x10u;
}

- (CGSize)_maximumContainerSizeForPagination
{
  BOOL v3 = [(_UIFloatingTabBar *)self _currentPlatformMetrics];
  BOOL v4 = [(_UIFloatingTabBar *)self expandedGroupItem];
  if (v4)
  {

LABEL_4:
    [v3 maximumExpandedWidth];
    double v8 = v7;
    double v9 = 0.95;
    goto LABEL_6;
  }
  uint64_t v5 = [(_UIFloatingTabBar *)self tabModel];
  int v6 = [v5 isEditing];

  if (v6) {
    goto LABEL_4;
  }
  [v3 maximumWidth];
  double v8 = v10;
  double v9 = 0.65;
LABEL_6:
  +[UIViewController _horizontalContentMarginForView:self];
  double v12 = v11;
  [(UIView *)self bounds];
  double v14 = v13;
  double v16 = v15 - (v12 + v12);
  double v17 = [(_UIFloatingTabBar *)self pinnedItemsView];
  objc_msgSend(v17, "sizeThatFits:", v16, v14);
  double v19 = v18;

  if ([(_UIFloatingTabBar *)self showsSidebarButton])
  {
    double v20 = [(_UIFloatingTabBar *)self sidebarButton];
    objc_msgSend(v20, "sizeThatFits:", v16, v14);
    double v19 = v19 + v21;
  }
  double v22 = fmin(v8, v9 * v16) - v19;
  double v23 = v14;
  result.double height = v23;
  result.double width = v22;
  return result;
}

- (void)_updatePaginationIfNeeded
{
  uint64_t v119 = *MEMORY[0x1E4F143B8];
  if ((*(unsigned char *)&self->_needsUpdate & 1) == 0) {
    return;
  }
  uint64_t v104 = 408;
  uint64_t v105 = [(_UIFloatingTabBar *)self collectionView];
  id v108 = [(UIView *)self traitCollection];
  BOOL v3 = [(_UIFloatingTabBar *)self _currentPlatformMetrics];
  BOOL v4 = [(_UIFloatingTabBar *)self lastSnapshot];
  uint64_t v5 = [v4 itemIdentifiers];

  [(_UIFloatingTabBar *)self _maximumContainerSizeForPagination];
  double v7 = v6;
  double v9 = v8;
  double v10 = [(_UIFloatingTabBar *)self leftArrowButton];
  objc_msgSend(v10, "sizeThatFits:", v7, v9);
  uint64_t v12 = v11;

  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v14 = [v5 count];
  uint64_t v102 = (uint64_t)&v102;
  MEMORY[0x1F4188790](v14);
  double v16 = (char *)&v102 - v15;
  double v17 = [[_UIEditMenuListPage alloc] initWithStartIndex:0];
  [v13 addObject:v17];
  BOOL v18 = [(_UIFloatingTabBar *)self isEditing];
  id v103 = v3;
  [v3 editModeItemMargins];
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;
  double v27 = objc_alloc_init(_UIFloatingTabBarItemView);
  [(_UIFloatingTabBarItemView *)v27 setSuppressJiggleAnimation:1];
  [(UIView *)v27 setHidden:1];
  BOOL v111 = v18;
  [(_UIFloatingTabBarItemView *)v27 setEditing:v18];
  v28 = [(_UIFloatingTabBar *)self contentView];
  [v28 addSubview:v27];

  uint64_t v29 = [v5 count];
  double v113 = v9;
  uint64_t v112 = v12;
  if (v29)
  {
    unint64_t v30 = 0;
    double v107 = *MEMORY[0x1E4F1DB30];
    double v106 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    double v110 = v22 + v26;
    double v109 = v20 + v24;
    double v31 = 0.0;
    double v32 = v9;
    double v33 = v7;
    do
    {
      double v34 = [v5 objectAtIndex:v30];
      [v13 count];
      [v5 count];
      UIRoundToViewScale(self);
      double v36 = v35;
      double v37 = [v34 contentTab];

      if (v37)
      {
        double v38 = [v34 contentTab];
        [(_UIFloatingTabBarItemView *)v27 setItem:v38];

        -[_UIFloatingTabBarItemView sizeThatFits:](v27, "sizeThatFits:", v7, v113);
        double v40 = v39;
        double v42 = v41;
        [(_UIFloatingTabBarItemView *)v27 baselineOffsetFromTop];
        double v44 = v43;
        BOOL v45 = [(_UIFloatingTabBarItemView *)v27 isCustomizableItem];
        double v46 = v110 + v40;
        if (v45 && v111)
        {
          double v42 = v109 + v42;
          double v40 = v110 + v40;
        }
      }
      else
      {
        double v47 = [v34 children];

        if (v47)
        {
          double v48 = [v34 children];
          +[_UIFloatingTabBarGroupCell layoutSizeForGroupItems:v48 traitCollection:v108];
          double v40 = v49;
          double v42 = v50;
        }
        else
        {
          int v51 = [v34 isPlaceholder];
          if (v51) {
            double v42 = 0.0;
          }
          else {
            double v42 = v106;
          }
          double v46 = 80.0;
          if (v51) {
            double v40 = 80.0;
          }
          else {
            double v40 = v107;
          }
        }
        double v44 = v113;
      }
      double v52 = fmin(v40, v36);
      *(double *)&v16[8 * v30] = v52;
      [(_UIEditMenuListPage *)v17 width];
      UIRoundToViewScale(self);
      if (v53 > v36)
      {
        double v54 = [[_UIEditMenuListPage alloc] initWithStartIndex:v30];

        [v13 addObject:v54];
        double v17 = v54;
      }
      [(_UIEditMenuListPage *)v17 appendItemWithWidth:v52];
      double v31 = fmax(v31, v42);
      double v32 = fmin(v32, v44);

      ++v30;
      double v7 = v33;
    }
    while (v30 < [v5 count]);
  }
  else
  {
    double v31 = 0.0;
    double v32 = v9;
  }
  if ((unint64_t)[v13 count] >= 2)
  {
    UIRoundToViewScale(self);
    double v56 = v55;
    uint64_t v57 = [(_UIEditMenuListPage *)v17 range];
    uint64_t v58 = v57 - 1;
    if (v57 != 1)
    {
      double v59 = 0.0;
      do
      {
        double v60 = *(double *)&v16[8 * v58];
        [(_UIEditMenuListPage *)v17 width];
        UIRoundToViewScale(self);
        if (v61 >= v56) {
          break;
        }
        double v59 = v59 + v60;
        [(_UIEditMenuListPage *)v17 prependItemWithWidth:v60];
        --v58;
      }
      while (v58);
      if (v59 > 0.0)
      {
        double v62 = objc_msgSend(v13, "objectAtIndex:", objc_msgSend(v13, "count") - 2);
        [v62 setOverlapWidth:v59];
      }
    }
  }
  if (v111 && ![v5 count])
  {
    v63 = [(_UIFloatingTabBar *)self pinnedItemsView];
    v64 = [v63 items];
    uint64_t v65 = [v64 count];

    if (!v65) {
      [(_UIEditMenuListPage *)v17 appendItemWithWidth:80.0];
    }
  }
  long long v117 = 0u;
  long long v116 = 0u;
  long long v115 = 0u;
  long long v114 = 0u;
  id v66 = v13;
  uint64_t v67 = [v66 countByEnumeratingWithState:&v114 objects:v118 count:16];
  double v68 = (void *)v105;
  if (v67)
  {
    uint64_t v69 = v67;
    uint64_t v70 = *(void *)v115;
    double v71 = 0.0;
    double v72 = v113;
    do
    {
      for (uint64_t i = 0; i != v69; ++i)
      {
        if (*(void *)v115 != v70) {
          objc_enumerationMutation(v66);
        }
        [*(id *)(*((void *)&v114 + 1) + 8 * i) width];
        double v71 = fmax(v74, v71);
      }
      uint64_t v69 = [v66 countByEnumeratingWithState:&v114 objects:v118 count:16];
    }
    while (v69);
  }
  else
  {
    double v71 = 0.0;
    double v72 = v113;
  }

  self->_double largestPageWidth = v71;
  if (![v5 count] || v31 == 0.0)
  {
    double v75 = [(_UIFloatingTabBar *)self pinnedItemsView];
    double v76 = [v75 items];
    uint64_t v77 = [v76 count];

    if (v77)
    {
      v78 = [(_UIFloatingTabBar *)self pinnedItemsView];
      objc_msgSend(v78, "sizeThatFits:", v7, v72);
      double v31 = v79;
    }
    else
    {
      -[_UIFloatingTabBarItemView sizeThatFits:](v27, "sizeThatFits:", v7, v72);
      double v31 = v80;
    }
    [(_UIFloatingTabBarItemView *)v27 baselineOffsetFromTop];
    double v32 = v81;
  }
  self->_double largestItemHeight = v31;
  self->_minimumItemBaselineFromTop = v32;
  id v82 = [v68 pages];
  id v83 = v66;
  double v84 = v83;
  if (v82 == v83)
  {

    double v86 = v84;
  }
  else
  {
    if (v83 && v82)
    {
      char v85 = [v82 isEqual:v83];

      if (v85) {
        goto LABEL_60;
      }
    }
    else
    {
    }
    double v86 = [(_UIFloatingTabBar *)self _indexPathForSelectedItem];
    if (![(_UIFloatingTabBar *)self isEditing])
    {
      if (v86)
      {
        double v87 = [(_UIFloatingTabBar *)self collectionView];
        CGFloat v88 = [v87 indexPathsForVisibleItems];
        int v89 = [v88 containsObject:v86];

        if (v89) {
          [(_UIFloatingTabBar *)self _setNeedsScrollToSelectedItem];
        }
      }
    }
    [(_UIFloatingTabBar *)self _setNeedsSelectionFrameUpdate];
    [(_UIFloatingTabBar *)self _setNeedsPaginationScrollTarget];
  }

LABEL_60:
  [v68 contentInset];
  double v91 = v90;
  double v93 = v92;
  double v95 = v94;
  [(_UIEditMenuListPage *)v17 width];
  objc_msgSend(v68, "setContentInset:", v91, v93, v95, v71 - v96);
  [v68 setPages:v84];
  unint64_t v97 = [v84 count];
  BOOL v98 = v97 < 2;
  uint64_t v99 = v97 > 1 || v111;
  [v68 setScrollEnabled:v97 > 1];
  double v100 = [(_UIFloatingTabBar *)self collectionViewContainer];
  [v100 setClipsToBounds:v99];

  double v101 = [(_UIFloatingTabBar *)self contentView];
  [v101 setClipsToBounds:v99];

  [(_UIFloatingTabBar *)self setScrubbingEnabled:v98];
  [(_UIFloatingTabBar *)self _setNeedsSelectionAlphaUpdate];
  [(UIView *)v27 removeFromSuperview];
  *((unsigned char *)&self->super.super.super.isa + v104) &= ~1u;
}

- (void)_didTapLeftArrowButton:(id)a3
{
  BOOL v4 = [(UIView *)self _shouldReverseLayoutDirection];
  uint64_t v5 = [(_UIFloatingTabBar *)self collectionView];
  double v6 = v5;
  if (v4) {
    [v5 incrementTargetPage];
  }
  else {
    [v5 decrementTargetPage];
  }

  [(_UIFloatingTabBar *)self _updateSelectionViewVisibilityAnimated:1];
}

- (void)_didTapRightArrowButton:(id)a3
{
  BOOL v4 = [(UIView *)self _shouldReverseLayoutDirection];
  uint64_t v5 = [(_UIFloatingTabBar *)self collectionView];
  double v6 = v5;
  if (v4) {
    [v5 decrementTargetPage];
  }
  else {
    [v5 incrementTargetPage];
  }

  [(_UIFloatingTabBar *)self _updateSelectionViewVisibilityAnimated:1];
}

- (BOOL)scrubbingEnabled
{
  v2 = [(_UIFloatingTabBar *)self collectionView];
  char v3 = [v2 bounces] ^ 1;

  return v3;
}

- (void)setScrubbingEnabled:(BOOL)a3
{
  if (a3) {
    double v4 = 0.0;
  }
  else {
    double v4 = 10.0;
  }
  BOOL v5 = !a3;
  double v6 = [(_UIFloatingTabBar *)self collectionView];
  [v6 setBounces:v5];

  id v7 = [(_UIFloatingTabBar *)self selectionGestureRecognizer];
  objc_msgSend(v7, "setAllowableMovement:", v4, v4);
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)_UIFloatingTabBar;
  -[UIView hitTest:withEvent:](&v13, sel_hitTest_withEvent_, v7, x, y);
  double v8 = (_UIFloatingTabBar *)objc_claimAutoreleasedReturnValue();
  double v9 = v8;
  if (v8 == self || v8 == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && [(_UIFloatingTabBar *)self isEditing]
      && !CGRectIsNull(self->_frameForExpandedDropTarget)
      && (v15.x = x, v15.double y = y, CGRectContainsPoint(self->_frameForExpandedDropTarget, v15)))
    {
      uint64_t v11 = self;
    }
    else
    {
      uint64_t v11 = 0;
    }

    double v9 = v11;
  }

  return v9;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  id v5 = [(_UIFloatingTabBar *)self selectionGestureRecognizer];

  if (v5 == v4)
  {
    id v7 = [(_UIFloatingTabBar *)self _indexPathForGestureRecognizer:v4];
    if (v7)
    {
      double v8 = [(_UIFloatingTabBar *)self tabModel];
      LODWORD(self) = [v8 isEditing] ^ 1;

LABEL_9:
      goto LABEL_10;
    }
LABEL_8:
    LOBYTE(self) = 0;
    goto LABEL_9;
  }
  id v6 = [(_UIFloatingTabBar *)self editModeGestureRecognizer];

  if (v6 == v4)
  {
    id v7 = [(_UIFloatingTabBar *)self tabModel];
    if ([v7 isEditable] && !-[_UIFloatingTabBar isEditing](self, "isEditing"))
    {
      LOBYTE(self) = !self->_isInTransitionAnimation;
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  LOBYTE(self) = 1;
LABEL_10:

  return (char)self;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(_UIFloatingTabBar *)self selectionGestureRecognizer];

  if (v8 == v7)
  {
    double v10 = [(_UIFloatingTabBar *)self collectionView];
    id v11 = [v10 panGestureRecognizer];
    if (v11 == v6)
    {
      BOOL v9 = 1;
    }
    else
    {
      id v12 = [(_UIFloatingTabBar *)self editModeGestureRecognizer];
      BOOL v9 = v12 == v6;
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (id)_indexPathForGestureRecognizer:(id)a3
{
  id v4 = a3;
  id v5 = [(_UIFloatingTabBar *)self pinnedItemsView];
  [v4 locationInView:v5];
  double v7 = v6;
  double v9 = v8;

  double v10 = [(_UIFloatingTabBar *)self pinnedItemsView];
  uint64_t v11 = objc_msgSend(v10, "itemIndexForItemAtLocation:", v7, v9);

  if (v11 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v12 = [(_UIFloatingTabBar *)self collectionView];
    [v4 locationInView:v12];
    double v14 = v13;

    CGPoint v15 = [(_UIFloatingTabBar *)self collectionView];
    [v15 bounds];
    double MidY = CGRectGetMidY(v27);

    double v17 = [(_UIFloatingTabBar *)self collectionView];
    [v17 bounds];
    v26.double x = v14;
    v26.double y = MidY;
    BOOL v18 = CGRectContainsPoint(v28, v26);

    if (v18)
    {
      double v19 = [(_UIFloatingTabBar *)self collectionView];
      double v20 = objc_msgSend(v19, "indexPathForItemAtPoint:", v14, MidY);
    }
    else
    {
      double v20 = 0;
    }
    int64_t v21 = [(_UIFloatingTabBar *)self _pageIndexForItemAtIndexPath:v20];
    double v22 = [(_UIFloatingTabBar *)self collectionView];
    uint64_t v23 = [v22 targetPage];

    if (v21 != v23)
    {

      double v20 = 0;
    }
  }
  else
  {
    double v20 = [MEMORY[0x1E4F28D58] indexPathForItem:v11 inSection:3];
  }

  return v20;
}

- (void)_handleSelectionGesture:(id)a3
{
  id v31 = a3;
  id v4 = -[_UIFloatingTabBar _indexPathForGestureRecognizer:](self, "_indexPathForGestureRecognizer:");
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [(_UIFloatingTabBar *)self highlightedIndexPath];
  }
  double v7 = v6;

  id v8 = v7;
  double v9 = [(_UIFloatingTabBar *)self collectionView];
  if ([v9 isDecelerating])
  {
    double v10 = [(_UIFloatingTabBar *)self collectionView];
    uint64_t v11 = [v10 panGestureRecognizer];
    BOOL v12 = [v11 state] == 5;
  }
  else
  {
    BOOL v12 = 1;
  }

  if (![(_UIFloatingTabBar *)self selectionViewFollowsHighlightedItem]
    && [v31 state] != 1)
  {
    double v13 = [(_UIFloatingTabBar *)self contentView];
    [v31 locationInView:v13];
    double v15 = v14;
    [v13 bounds];
    double v16 = vabdd_f64(v15, CGRectGetMidY(v33));
    [v13 bounds];
    double v17 = v16 + CGRectGetHeight(v34) * -0.5;
    BOOL v18 = [(_UIFloatingTabBar *)self _currentPlatformMetrics];
    [v18 selectionDistanceThresholdForUnselectedItems];
    double v20 = v19;

    if (v17 > v20)
    {

      id v8 = 0;
    }
  }
  BOOL v21 = 0;
  double v22 = v8;
  switch([v31 state])
  {
    case 1:
      uint64_t v23 = [(_UIFloatingTabBar *)self _indexPathForSelectedItem];
      -[_UIFloatingTabBar setSelectionViewFollowsHighlightedItem:](self, "setSelectionViewFollowsHighlightedItem:", [v8 isEqual:v23]);

      double v24 = [(_UIFloatingTabBar *)self selectionFrameGroupCompletion];
      [v24 increment];

      BOOL v21 = 0;
      double v22 = v8;
      goto LABEL_21;
    case 2:
      goto LABEL_21;
    case 3:

      if (v8) {
        BOOL v21 = v12;
      }
      else {
        BOOL v21 = 0;
      }
      double v25 = [(_UIFloatingTabBar *)self selectionFrameGroupCompletion];
      [v25 complete];

      goto LABEL_20;
    case 4:
      CGPoint v26 = [(_UIFloatingTabBar *)self selectionFrameGroupCompletion];
      [v26 complete];

      goto LABEL_19;
    default:
LABEL_19:

      [(_UIFloatingTabBar *)self setSelectionViewFollowsHighlightedItem:1];
      BOOL v21 = 0;
LABEL_20:
      double v22 = 0;
LABEL_21:
      BOOL v27 = [(_UIFloatingTabBar *)self selectionViewFollowsHighlightedItem];
      CGRect v28 = [(_UIFloatingTabBar *)self selectionViewIndexPath];
      if ([v22 isEqual:v28])
      {

        [(_UIFloatingTabBar *)self setHighlightedIndexPath:v22];
      }
      else
      {
        highlightedIndexPath = self->_highlightedIndexPath;
        unint64_t v30 = [(_UIFloatingTabBar *)self selectionViewIndexPath];
        LOBYTE(highlightedIndexPath) = [(NSIndexPath *)highlightedIndexPath isEqual:v30];

        [(_UIFloatingTabBar *)self setHighlightedIndexPath:v22];
        if (((highlightedIndexPath | v27) & 1) == 0) {
          goto LABEL_25;
        }
      }
      [(_UIFloatingTabBar *)self _updateSelectionViewFrameAnimated:1 completion:0];
LABEL_25:
      if (v21) {
        [(_UIFloatingTabBar *)self _selectItemAtIndexPath:v8];
      }

      return;
  }
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  double v9 = [v7 view];
  [v8 location];
  double v11 = v10;
  double v13 = v12;
  double v14 = [(_UIFloatingTabBar *)self pinnedItemsView];
  objc_msgSend(v9, "convertPoint:toView:", v14, v11, v13);
  double v16 = v15;
  double v18 = v17;

  double v19 = [(_UIFloatingTabBar *)self pinnedItemsView];
  uint64_t v20 = objc_msgSend(v19, "itemIndexForItemAtLocation:", v16, v18);

  if (v20 != 0x7FFFFFFFFFFFFFFFLL)
  {
    CGRect v33 = [MEMORY[0x1E4F28D58] indexPathForItem:v20 inSection:3];
    uint64_t v57 = [(_UIFloatingTabBar *)self pinnedItemsView];
    [v57 itemFrameForItemAtIndex:v20];
    double v59 = v58;
    double v61 = v60;
    double v63 = v62;
    double v65 = v64;

    id v66 = [(_UIFloatingTabBar *)self pinnedItemsView];
    uint64_t v67 = [v7 view];
    objc_msgSend(v66, "convertRect:toView:", v67, v59, v61, v63, v65);
    double v69 = v68;
    double v71 = v70;
    double v73 = v72;
    double v75 = v74;

    double v56 = +[UIPointerRegion regionWithRect:identifier:](UIPointerRegion, "regionWithRect:identifier:", v33, v69, v71, v73, v75);
    goto LABEL_9;
  }
  BOOL v21 = [v7 view];
  [v8 location];
  double v23 = v22;
  double v25 = v24;
  CGPoint v26 = [(_UIFloatingTabBar *)self collectionView];
  objc_msgSend(v21, "convertPoint:toView:", v26, v23, v25);
  double v28 = v27;
  double v30 = v29;

  id v31 = [(_UIFloatingTabBar *)self collectionView];
  [v31 bounds];
  v80.double x = v28;
  v80.double y = v30;
  LODWORD(v26) = CGRectContainsPoint(v81, v80);

  if (!v26) {
    goto LABEL_8;
  }
  double v32 = [(_UIFloatingTabBar *)self collectionView];
  CGRect v33 = objc_msgSend(v32, "indexPathForItemAtPoint:", v28, v30);

  int64_t v34 = [(_UIFloatingTabBar *)self _pageIndexForItemAtIndexPath:v33];
  double v35 = [(_UIFloatingTabBar *)self collectionView];
  uint64_t v36 = [v35 targetPage];

  if (v34 != v36)
  {

LABEL_8:
    double v56 = 0;
    CGRect v33 = 0;
    goto LABEL_9;
  }
  if (v33)
  {
    double v37 = [(_UIFloatingTabBar *)self collectionView];
    double v38 = [v37 cellForItemAtIndexPath:v33];

    [v38 bounds];
    double v40 = v39;
    double v42 = v41;
    double v44 = v43;
    double v46 = v45;
    double v47 = [v7 view];
    objc_msgSend(v38, "convertRect:toView:", v47, v40, v42, v44, v46);
    double v49 = v48;
    double v51 = v50;
    double v53 = v52;
    double v55 = v54;

    double v56 = +[UIPointerRegion regionWithRect:identifier:](UIPointerRegion, "regionWithRect:identifier:", v33, v49, v51, v53, v55);
  }
  else
  {
    double v56 = 0;
  }
LABEL_9:
  double v76 = [(_UIFloatingTabBar *)self tabModel];
  if ([v76 isEditing])
  {
    uint64_t v77 = [v33 section];

    if (v77 == 1) {
      goto LABEL_13;
    }
    double v76 = v56;
    double v56 = 0;
  }

LABEL_13:
  return v56;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v5 = objc_msgSend(a4, "identifier", a3);
  id v6 = self;
  id v7 = [(_UIFloatingTabBar *)v6 _viewForItemAtIndexPath:v5];
  [v7 bounds];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v16 = [v7 superview];
  [v7 center];
  objc_msgSend(v16, "convertPoint:toView:", v6);
  double v18 = v17;
  double v20 = v19;

  BOOL v21 = -[UIPreviewTarget initWithContainer:center:]([UIPreviewTarget alloc], "initWithContainer:center:", v6, v18, v20);
  double v22 = [(_UIFloatingTabBar *)v6 tabModel];
  int v23 = [v22 isEditing];

  if (v23)
  {
    double v24 = [(_UIFloatingTabBar *)v6 _targetedPreviewForTabAtIndexPath:v5];
    uint64_t v25 = [v24 retargetedPreviewWithTarget:v21];
LABEL_10:
    double v32 = (UITargetedPreview *)v25;
    CGRect v33 = off_1E52D43F0;
    goto LABEL_13;
  }
  CGPoint v26 = [(_UIFloatingTabBar *)v6 _indexPathForSelectedItem];
  id v27 = v5;
  id v28 = v26;
  if (v27 == v28)
  {

    goto LABEL_9;
  }
  double v29 = v28;
  if (v27 && v28)
  {
    int v30 = [v27 isEqual:v28];

    if (!v30) {
      goto LABEL_12;
    }
LABEL_9:
    id v31 = [UITargetedPreview alloc];
    double v24 = objc_opt_new();
    uint64_t v25 = [(UITargetedPreview *)v31 initWithView:v7 parameters:v24 target:v21];
    goto LABEL_10;
  }

LABEL_12:
  int64_t v34 = [UITargetedPreview alloc];
  double v24 = objc_opt_new();
  double v32 = [(UITargetedPreview *)v34 initWithView:v7 parameters:v24 target:v21];
  CGRect v33 = off_1E52D43D8;
LABEL_13:

  double v35 = [(__objc2_class *)*v33 effectWithPreview:v32];
  objc_msgSend(v7, "convertRect:toView:", v6, v9, v11, v13, v15);
  double v37 = v36;
  double v39 = v38;
  double v41 = v40;
  double v43 = v42;
  double v44 = [(UITargetedPreview *)v32 view];
  [v44 bounds];
  double v45 = +[UIPointerShape shapeWithRoundedRect:cornerRadius:](UIPointerShape, "shapeWithRoundedRect:cornerRadius:", v37, v39, v41, v43, CGRectGetHeight(v49) * 0.5);

  double v46 = +[UIPointerStyle styleWithEffect:v35 shape:v45];

  return v46;
}

- (BOOL)_canDragTab:(id)a3
{
  return [a3 _hasCustomizablePlacement];
}

- (BOOL)_isValidDropTargetIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4 && ![v4 section])
  {
    uint64_t v7 = [v5 item];
    double v8 = [(_UIFloatingTabBar *)self lastSnapshot];
    BOOL v6 = v7 == [v8 numberOfItemsInSection:&unk_1ED3F73B0];
  }
  else
  {
    BOOL v6 = 1;
  }

  return v6;
}

- (id)tabDragController:(id)a3 tabForBeginningSession:(id)a4
{
  id v5 = a4;
  BOOL v6 = [(_UIFloatingTabBar *)self collectionView];
  [v5 locationInView:v6];
  double v8 = v7;
  double v10 = v9;

  double v11 = [(_UIFloatingTabBar *)self collectionView];
  double v12 = objc_msgSend(v11, "indexPathForItemAtPoint:", v8, v10);

  if (v12)
  {
    double v13 = [(_UIFloatingTabBar *)self dataSource];
    double v14 = [v13 itemIdentifierForIndexPath:v12];

    double v15 = [v14 tabForSelection];
    BOOL v16 = [(_UIFloatingTabBar *)self _canDragTab:v15];

    if (v16)
    {
      double v17 = [v14 tabForSelection];
    }
    else
    {
      double v17 = 0;
    }
  }
  else
  {
    double v17 = 0;
  }

  return v17;
}

- (id)tabDragController:(id)a3 previewForLiftingTab:(id)a4
{
  return [(_UIFloatingTabBar *)self _targetedPreviewForTab:a4];
}

- (id)tabDragController:(id)a3 previewForCancellingTab:(id)a4
{
  return [(_UIFloatingTabBar *)self _targetedPreviewForTab:a4];
}

- (void)tabDragController:(id)a3 hideDraggedTab:(id)a4
{
  id v8 = [(_UIFloatingTabBar *)self _indexPathForTabItem:a4];
  id v5 = [(_UIFloatingTabBar *)self collectionView];
  BOOL v6 = [v5 cellForItemAtIndexPath:v8];

  double v7 = [v6 contentView];
  [v7 setHidden:1];
}

- (id)tabDragController:(id)a3 destinationIndexPathForDropSession:(id)a4
{
  return [(_UIFloatingTabBar *)self _destinationIndexPathForDropSession:a4];
}

- (BOOL)tabDragController:(id)a3 canHandleDropSessionForTab:(id)a4
{
  id v5 = a4;
  BOOL v6 = [v5 _tabModel];
  double v7 = [(_UIFloatingTabBar *)self tabModel];
  if (v6 == v7) {
    int v8 = [v5 _isAction] ^ 1;
  }
  else {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (id)tabDragController:(id)a3 dropProposalForSession:(id)a4
{
  id v5 = a4;
  BOOL v6 = [(_UIFloatingTabBar *)self collectionView];
  [v5 locationInView:v6];

  double v7 = [(_UIFloatingTabBar *)self collectionView];
  [v7 bounds];
  CGRectGetMidY(v22);

  int v8 = [(_UIFloatingTabBar *)self _destinationIndexPathForDropSession:v5];
  double v9 = [(_UIFloatingTabBar *)self tabModel];
  char v10 = [v9 isEditing];

  if (v10)
  {
    double v11 = [v5 items];
    double v12 = [v11 firstObject];

    double v13 = [v12 localObject];
    if ([v13 _tabPlacement] == 6)
    {
      uint64_t v14 = 1;
    }
    else if ([(_UIFloatingTabBar *)self _isValidDropTargetIndexPath:v8] {
           && ([(_UIFloatingTabBar *)self tabModel],
    }
               BOOL v16 = objc_claimAutoreleasedReturnValue(),
               char v17 = [v16 isTabHidden:v13],
               v16,
               (v17 & 1) == 0))
    {
      if ([(_UIFloatingTabBar *)self _canDragTab:v13]) {
        uint64_t v14 = 3;
      }
      else {
        uint64_t v14 = 1;
      }
    }
    else
    {
      uint64_t v14 = 0;
    }
  }
  else
  {
    if (!v8)
    {
      uint64_t v14 = 0;
      goto LABEL_14;
    }
    if ([v8 section] == 3)
    {
      double v15 = [(_UIFloatingTabBar *)self pinnedItemsView];
      objc_msgSend(v15, "tabForSelectionAtItemIndex:", objc_msgSend(v8, "item"));
    }
    else
    {
      double v18 = [(_UIFloatingTabBar *)self dataSource];
      double v15 = [v18 itemIdentifierForIndexPath:v8];

      [v15 tabForSelection];
    double v12 = };

    double v13 = [(_UIFloatingTabBar *)self _tabBarController];
    uint64_t v14 = (uint64_t)-[UITabBarController _tab:operationForAcceptingItemsFromDropSession:](v13, v12, v5);
  }

LABEL_14:
  double v19 = [[UIDropProposal alloc] initWithDropOperation:v14];

  return v19;
}

- (BOOL)tabDragController:(id)a3 isDisplayingTab:(id)a4
{
  id v5 = a4;
  BOOL v6 = [(_UIFloatingTabBar *)self parser];
  double v7 = -[_UIFloatingTabBarParser itemIdentifiers](v6);
  int v8 = [v5 identifier];

  LOBYTE(v5) = [v7 containsObject:v8];
  return (char)v5;
}

- (void)tabDragController:(id)a3 acceptItemsIntoTabFromDropSession:(id)a4
{
  id v11 = a4;
  id v5 = -[_UIFloatingTabBar _destinationIndexPathForDropSession:](self, "_destinationIndexPathForDropSession:");
  BOOL v6 = v5;
  if (v5)
  {
    if ([v5 section] == 3)
    {
      double v7 = [(_UIFloatingTabBar *)self pinnedItemsView];
      objc_msgSend(v7, "tabForSelectionAtItemIndex:", objc_msgSend(v6, "item"));
    }
    else
    {
      int v8 = [(_UIFloatingTabBar *)self dataSource];
      double v7 = [v8 itemIdentifierForIndexPath:v6];

      [v7 tabForSelection];
    double v9 = };

    char v10 = [(_UIFloatingTabBar *)self _tabBarController];
    -[UITabBarController _tab:acceptItemsFromDropSession:](v10, v9, v11);
  }
}

- (void)tabDragController:(id)a3 pendingDropTabDidChange:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [(_UIFloatingTabBar *)self parser];
  double v7 = (void *)v6;
  if (v6) {
    int v8 = *(void **)(v6 + 80);
  }
  else {
    int v8 = 0;
  }
  id v9 = v8;

  if (v9 != v5)
  {
    [(_UIFloatingTabBar *)self _invalidateFavoriteOrderAnimated:1];
  }
}

- (id)tabDragController:(id)a3 previewForInsertingTab:(id)a4
{
  return [(_UIFloatingTabBar *)self _targetedPreviewForTab:a4];
}

- (void)tabDragController:(id)a3 updateFavoriteOrderAnimated:(BOOL)a4
{
}

- (id)_targetedPreviewForTab:(id)a3
{
  id v4 = [(_UIFloatingTabBar *)self _indexPathForTabItem:a3];
  if (v4)
  {
    id v5 = [(_UIFloatingTabBar *)self _targetedPreviewForTabAtIndexPath:v4];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)_targetedPreviewForTabAtIndexPath:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(_UIFloatingTabBar *)self _pageIndexForItemAtIndexPath:v4];
  uint64_t v6 = [(_UIFloatingTabBar *)self _viewForItemAtIndexPath:v4];

  if (v6
    && ([(_UIFloatingTabBar *)self collectionView],
        double v7 = objc_claimAutoreleasedReturnValue(),
        uint64_t v8 = [v7 targetPage],
        v7,
        v5 == v8))
  {
    id v9 = [(_UIFloatingTabBar *)self contentView];
    [v6 center];
    double v11 = v10;
    double v13 = v12;
    uint64_t v14 = [v6 superview];
    objc_msgSend(v9, "convertPoint:fromView:", v14, v11, v13);
    double v16 = v15;
    double v18 = v17;

    double v19 = objc_opt_new();
    [v19 setHidesSourceViewDuringDropAnimation:1];
    double v20 = +[UIColor secondarySystemBackgroundColor];
    [v19 setBackgroundColor:v20];

    [v6 bounds];
    double v22 = v21;
    double v24 = v23;
    double v26 = v25;
    double v28 = v27;
    [v6 bounds];
    double v29 = +[UIBezierPath _bezierPathWithPillRect:cornerRadius:](UIBezierPath, "_bezierPathWithPillRect:cornerRadius:", v22, v24, v26, v28, CGRectGetHeight(v36) * 0.5);
    [v19 setVisiblePath:v29];

    int v30 = [UIDragPreviewTarget alloc];
    id v31 = [(_UIFloatingTabBar *)self contentView];
    double v32 = -[UIPreviewTarget initWithContainer:center:](v30, "initWithContainer:center:", v31, v16, v18);

    CGRect v33 = [[UITargetedDragPreview alloc] initWithView:v6 parameters:v19 target:v32];
  }
  else
  {
    CGRect v33 = 0;
  }

  return v33;
}

- (id)_destinationIndexPathForDropSession:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(_UIFloatingTabBar *)self collectionView];
  [v4 locationInView:v5];
  double v7 = v6;
  [v5 bounds];
  double MidY = CGRectGetMidY(v87);
  id v9 = [(_UIFloatingTabBar *)self tabModel];
  char v10 = [v9 isEditing];

  if ((v10 & 1) == 0)
  {
    double v11 = [(_UIFloatingTabBar *)self pinnedItemsView];
    [v4 locationInView:v11];
    double v13 = v12;
    double v15 = v14;

    double v16 = [(_UIFloatingTabBar *)self pinnedItemsView];
    uint64_t v17 = objc_msgSend(v16, "itemIndexForItemAtLocation:", v13, v15);

    if (v17 != 0x7FFFFFFFFFFFFFFFLL)
    {
      double v18 = [MEMORY[0x1E4F28D58] indexPathForItem:v17 inSection:3];
      if (v18) {
        goto LABEL_36;
      }
    }
  }
  double v19 = [(_UIFloatingTabBar *)self collectionView];
  [v19 bounds];
  v86.double x = v7;
  v86.double y = MidY;
  BOOL v20 = CGRectContainsPoint(v88, v86);

  if (v20)
  {
    double v21 = [(_UIFloatingTabBar *)self collectionView];
    double v18 = objc_msgSend(v21, "indexPathForItemAtPoint:", v7, MidY);
  }
  else
  {
    double v18 = 0;
  }
  double v22 = [(_UIFloatingTabBar *)self tabModel];
  int v23 = [v22 isEditing];

  if (!v23) {
    goto LABEL_36;
  }
  if (!v18)
  {
    double v24 = [v5 pages];
    double v25 = objc_msgSend(v24, "objectAtIndex:", objc_msgSend(v5, "targetPage"));

    double v26 = [(_UIFloatingTabBar *)self contentView];
    [v4 locationInView:v26];
    double v28 = v27;

    double v29 = [(_UIFloatingTabBar *)self contentView];
    [v29 bounds];
    int v30 = v28 < CGRectGetMidX(v89);

    int v31 = [(UIView *)self _shouldReverseLayoutDirection];
    double v84 = v25;
    unint64_t v33 = [v25 range];
    if (v30 == v31)
    {
      unint64_t v35 = v32;
      CGRect v36 = [(_UIFloatingTabBar *)self dragController];
      double v37 = [v36 pendingFavoriteOrder];
      uint64_t v38 = [v37 indexOfObject:0x1ED0ECD20];

      if (v38 == 0x7FFFFFFFFFFFFFFFLL
        || ([MEMORY[0x1E4F28D58] indexPathForItem:v38 inSection:1],
            double v39 = objc_claimAutoreleasedReturnValue(),
            unint64_t v40 = [(_UIFloatingTabBar *)self _indexInDataSourceForItemAtIndexPath:v39], v39, v40 < v33)|| v40 - v33 >= v35)
      {
        unint64_t v44 = v35;
        double v45 = [(UIView *)self traitCollection];
        double v43 = _UIFloatingTabBarGetPlatformMetrics([v45 userInterfaceIdiom]);

        [(_UIFloatingTabBar *)self _maximumContainerSizeForPagination];
        double v47 = v46;
        double v49 = v48;
        double v50 = [(_UIFloatingTabBar *)self leftArrowButton];
        [(UIView *)self bounds];
        objc_msgSend(v50, "sizeThatFits:", v51, v52);

        double v53 = [(_UIFloatingTabBar *)self lastSnapshot];
        [v53 numberOfItems];

        [v43 editModeItemMargins];
        double v55 = v54;
        double v57 = v56;
        double v58 = [_UIFloatingTabBarItemView alloc];
        double v59 = -[_UIFloatingTabBarItemView initWithFrame:](v58, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
        [(UIView *)v59 setHidden:1];
        [(_UIFloatingTabBarItemView *)v59 setSuppressJiggleAnimation:1];
        [(_UIFloatingTabBarItemView *)v59 setEditing:1];
        double v60 = [v4 items];
        double v61 = [v60 firstObject];
        double v62 = [v61 localObject];
        [(_UIFloatingTabBarItemView *)v59 setItem:v62];

        double v63 = [(_UIFloatingTabBar *)self contentView];
        [v63 addSubview:v59];

        -[_UIFloatingTabBarItemView sizeThatFits:](v59, "sizeThatFits:", v47, v49);
        double v65 = v64;
        if ([v5 targetPage] < 1)
        {
          double v69 = 0.0;
        }
        else
        {
          id v66 = [v5 pages];
          uint64_t v67 = objc_msgSend(v66, "objectAtIndex:", objc_msgSend(v5, "targetPage") - 1);

          [v67 overlapWidth];
          double v69 = v68;
        }
        unint64_t v70 = v33 + v44 - 1;
        if (v70 >= v33)
        {
          double v71 = v55 + v57 + v65;
          double v72 = 0.0;
          while (1)
          {
            double v73 = [(_UIFloatingTabBar *)self _indexPathForItemAtDataSourceIndex:v70];
            if ([v73 section] != 1)
            {
              double v18 = 0;
              goto LABEL_28;
            }
            double v74 = [v5 pages];
            [v74 count];

            unint64_t v75 = v70 + 1;
            UIRoundToViewScale(self);
            double v77 = v76;
            [v84 width];
            if (v71 + v78 - v69 - v72 <= v77) {
              break;
            }
            double v79 = [v5 cellForItemAtIndexPath:v73];
            [v79 bounds];
            double v72 = v72 + v80;

            --v70;
            if (v75 - 2 < v33)
            {
              double v18 = 0;
              goto LABEL_29;
            }
          }
          double v18 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForItem:inSection:", objc_msgSend(v73, "item") + 1, 1);
LABEL_28:
        }
        else
        {
          double v18 = 0;
        }
LABEL_29:
        [(UIView *)v59 removeFromSuperview];
      }
      else
      {
        uint64_t v41 = [v84 range];
        [v84 range];
        double v43 = [(_UIFloatingTabBar *)self _indexPathForItemAtDataSourceIndex:v41 + v42 - 1];
        double v18 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForItem:inSection:", objc_msgSend(v43, "item") + 1, 1);
      }

      if (!v18)
      {
        CGRect v81 = [(_UIFloatingTabBar *)self lastSnapshot];
        uint64_t v34 = [v81 numberOfItemsInSection:&unk_1ED3F7380];

LABEL_33:
        double v18 = [MEMORY[0x1E4F28D58] indexPathForItem:v34 inSection:1];

        if (!v18) {
          goto LABEL_36;
        }
        goto LABEL_34;
      }
    }
    else
    {
      double v18 = [(_UIFloatingTabBar *)self _indexPathForItemAtDataSourceIndex:v33];
      if (!v18)
      {
        uint64_t v34 = 0;
        goto LABEL_33;
      }
    }
  }
LABEL_34:
  if (![v18 section])
  {
    uint64_t v82 = [MEMORY[0x1E4F28D58] indexPathForItem:0 inSection:1];

    double v18 = (void *)v82;
  }
LABEL_36:

  return v18;
}

- (void)setHighlightedIndexPath:(id)a3
{
  id v5 = a3;
  highlightedIndexPath = self->_highlightedIndexPath;
  double v11 = (NSIndexPath *)v5;
  double v7 = highlightedIndexPath;
  if (v7 == v11)
  {

LABEL_12:
    char v10 = v11;
    goto LABEL_13;
  }
  uint64_t v8 = v7;
  if (v11 && v7)
  {
    char v9 = [(NSIndexPath *)v11 isEqual:v7];

    char v10 = v11;
    if (v9) {
      goto LABEL_13;
    }
  }
  else
  {
  }
  if (self->_highlightedIndexPath) {
    -[_UIFloatingTabBar _setHighlighted:forItemAtIndexPath:](self, "_setHighlighted:forItemAtIndexPath:", 0);
  }
  objc_storeStrong((id *)&self->_highlightedIndexPath, a3);
  char v10 = v11;
  if (v11)
  {
    [(_UIFloatingTabBar *)self _setHighlighted:1 forItemAtIndexPath:v11];
    goto LABEL_12;
  }
LABEL_13:
}

- (void)_setHasSelectionHighlight:(BOOL)a3 forItemAtIndexPath:(id)a4
{
  BOOL v4 = a3;
  id v9 = a4;
  if ([v9 section] == 3)
  {
    if (v4) {
      uint64_t v6 = [v9 item];
    }
    else {
      uint64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
    }
    uint64_t v8 = [(_UIFloatingTabBar *)self pinnedItemsView];
    [v8 setSelectionViewIndex:v6];
  }
  else
  {
    double v7 = [(_UIFloatingTabBar *)self collectionView];
    uint64_t v8 = [v7 cellForItemAtIndexPath:v9];

    [v8 setHasSelectionHighlight:v4];
  }
}

- (void)_setHighlighted:(BOOL)a3 forItemAtIndexPath:(id)a4
{
  BOOL v4 = a3;
  id v9 = a4;
  if ([v9 section] == 3)
  {
    if (v4) {
      uint64_t v6 = [v9 item];
    }
    else {
      uint64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
    }
    uint64_t v8 = [(_UIFloatingTabBar *)self pinnedItemsView];
    [v8 setHighlightedIndex:v6];
  }
  else
  {
    double v7 = [(_UIFloatingTabBar *)self collectionView];
    uint64_t v8 = [v7 cellForItemAtIndexPath:v9];

    [v8 setHighlighted:v4];
  }
}

- (void)tabModelEditingStateDidChange
{
  char v3 = [(_UIFloatingTabBar *)self tabModel];
  int v4 = [v3 isEditing];

  id v5 = [(_UIFloatingTabBar *)self tabModel];
  id v33 = [v5 customizationStore];

  if (v4)
  {
    uint64_t v6 = [v33 excludedItems];
    double v7 = v6;
    if (v6)
    {
      id v8 = v6;
    }
    else
    {
      id v8 = [MEMORY[0x1E4F1CAD0] set];
    }
    double v16 = v8;

    int v31 = [(_UIFloatingTabBar *)self parser];
    double v18 = -[_UIFloatingTabBarParser currentFavoriteOrder](v31);

    double v14 = [(_UIFloatingTabBar *)self dragController];
    [v14 beginEditingWithFavoriteOrder:v18 excludedItems:v16];
  }
  else
  {
    id v9 = [(_UIFloatingTabBar *)self parser];
    char v10 = -[_UIFloatingTabBarParser sourceTabIdentifiers](v9);

    double v11 = [(_UIFloatingTabBar *)self dragController];
    double v12 = [v11 pendingFavoriteOrder];

    double v13 = [(_UIFloatingTabBar *)self dragController];
    double v14 = [v13 excludedItems];

    double v15 = [(_UIFloatingTabBar *)self parser];
    double v16 = -[_UIFloatingTabBarParser validateFavoriteOrder:](v15, v10);

    uint64_t v17 = [(_UIFloatingTabBar *)self parser];
    double v18 = -[_UIFloatingTabBarParser validateFavoriteOrder:](v17, v12);

    [v33 saveFavoriteOrderCustomization:v18 defaultIdentifiers:v16 excludedIdentifiers:v14];
    double v19 = [(_UIFloatingTabBar *)self dragController];
    [v19 endEditing];

    if ([v33 hasFavoriteOrderCustomization])
    {
      uint64_t v32 = [v18 count];
      BOOL v20 = [(_UIFloatingTabBar *)self parser];
      double v21 = -[_UIFloatingTabBarParser fixedItems](v20);
      uint64_t v22 = [v21 count];
      int v23 = [(_UIFloatingTabBar *)self parser];
      double v24 = -[_UIFloatingTabBarParser pinnedItems](v23);
      uint64_t v25 = [v24 count];

      double v26 = +[_UITabAnalytics sharedInstance]();
      double v27 = [(_UIFloatingTabBar *)self tabModel];
      double v28 = [v27 tabBarController];
      if (v26)
      {
        ++v26[2];
        v26[3] = v22 + v32 + v25;
        -[_UITabAnalytics _sendCustomizationEvent:](v26, v28);
      }
    }
    double v29 = [(_UIFloatingTabBar *)self tabModel];
    int v30 = [v29 selectedLeaf];

    [(_UIFloatingTabBar *)self _updateSelectedLeaf:v30 previousElement:v30];
  }
}

- (void)updateEditingStateIfNeeded
{
  if ((*(unsigned char *)&self->_needsUpdate & 0x40) != 0)
  {
    BOOL v3 = [(_UIFloatingTabBar *)self isEditing];
    [(_UIFloatingTabBar *)self setEditing:v3 animated:0];
  }
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  if (self->_editing != a3 || (*(unsigned char *)&self->_needsUpdate & 0x40) != 0)
  {
    self->_editing = a3;
    double v7 = [(UIView *)self window];

    char needsUpdate = (char)self->_needsUpdate;
    if (v7)
    {
      *(unsigned char *)&self->_char needsUpdate = needsUpdate & 0xBF;
      [(_UIFloatingTabBar *)self _setNeedsPaginationUpdate];
      [(_UIFloatingTabBar *)self _updatePaginationIfNeeded];
      id v9 = [(_UIFloatingTabBar *)self _currentPlatformMetrics];
      char v10 = [(_UIFloatingTabBar *)self collectionView];
      [v10 setEditing:v5];

      double v11 = [(_UIFloatingTabBar *)self pinnedItemsView];
      [v11 setEditing:v5];

      double v12 = [(_UIFloatingTabBar *)self recentItem];

      if (v12)
      {
        [(_UIFloatingTabBar *)self _updateDataSourceFromParserAnimated:v4];
      }
      else
      {
        double v13 = [(_UIFloatingTabBar *)self collectionView];
        double v14 = [v13 collectionViewLayout];
        [v14 invalidateLayout];

        [(UIView *)self setNeedsLayout];
        [(_UIFloatingTabBar *)self _setNeedsSelectionFrameUpdate];
      }
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __41___UIFloatingTabBar_setEditing_animated___block_invoke;
      v17[3] = &unk_1E52DF220;
      void v17[4] = self;
      BOOL v18 = v5;
      BOOL v19 = v4;
      double v15 = _Block_copy(v17);
      double v16 = +[UIViewSpringAnimationBehavior behaviorWithDampingRatio:1.0 response:0.5];
      if (v4) {
        +[UIView _animateUsingSpringBehavior:v16 tracking:0 animations:v15 completion:0];
      }
      else {
        +[UIView performWithoutAnimation:v15];
      }
      [(_UIFloatingTabBar *)self _updateSelectionViewFrameAnimated:v4 completion:0];
    }
    else
    {
      *(unsigned char *)&self->_char needsUpdate = needsUpdate | 0x40;
    }
  }
}

- (void)updateBarForEditingState
{
  [(_UIFloatingTabBar *)self _updateTransform];
  [(_UIFloatingTabBar *)self _updateBackgroundShadow];
}

- (void)_updateEditModeGestureRecognizer
{
  BOOL v3 = [(_UIFloatingTabBar *)self tabModel];
  uint64_t v4 = [v3 isEditable];

  if (v4 && !self->_editModeGestureRecognizer)
  {
    BOOL v5 = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:sel__handleLongPressGestureRecognizer_];
    editModeGestureRecognizer = self->_editModeGestureRecognizer;
    self->_editModeGestureRecognizer = v5;

    [(UILongPressGestureRecognizer *)self->_editModeGestureRecognizer setMinimumPressDuration:0.5];
    [(UIGestureRecognizer *)self->_editModeGestureRecognizer setDelegate:self];
    double v7 = [(_UIFloatingTabBar *)self contentView];
    [v7 addGestureRecognizer:self->_editModeGestureRecognizer];
  }
  id v8 = self->_editModeGestureRecognizer;
  [(UIGestureRecognizer *)v8 setEnabled:v4];
}

- (void)_handleLongPressGestureRecognizer:(id)a3
{
  uint64_t v4 = [(_UIFloatingTabBar *)self selectionGestureRecognizer];
  [v4 setEnabled:0];

  BOOL v5 = [(_UIFloatingTabBar *)self selectionGestureRecognizer];
  [v5 setEnabled:1];

  id v6 = [(_UIFloatingTabBar *)self tabModel];
  [v6 setEditing:1];
}

- (void)setShowRecentItem:(BOOL)a3
{
  if (self->_showRecentItem != a3)
  {
    self->_showRecentItem = a3;
    uint64_t v4 = [(_UIFloatingTabBar *)self tabModel];
    id v5 = [v4 selectedLeaf];

    [(_UIFloatingTabBar *)self _updateSelectedLeaf:v5 previousElement:v5];
  }
}

- (void)_validateRecentItemForParser:(id)a3
{
  id v10 = a3;
  uint64_t v4 = [(_UIFloatingTabBar *)self recentItem];
  id v5 = [v4 tabForSelection];

  id v6 = [v5 _tabModel];
  double v7 = [(_UIFloatingTabBar *)self tabModel];
  if (v6 != v7
    || (-[_UIFloatingTabBarParser containsTab:]((uint64_t)v10, v5) & 1) != 0
    || -[_UIFloatingTabBarParser containsDescendantOfTab:]((BOOL)v10, v5))
  {

LABEL_5:
    recentItem = self->_recentItem;
    self->_recentItem = 0;

    goto LABEL_6;
  }
  char v9 = [v5 isHidden];

  if (v9) {
    goto LABEL_5;
  }
LABEL_6:
}

- (BOOL)_isRecentItemIndexPath:(id)a3
{
  return [a3 section] == 2;
}

- (id)_contentTabForRecentTab:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 _parentGroup];

  if (v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v6 = v3;
    if (v6)
    {
      double v7 = v6;
      do
      {
        [v5 addObject:v7];
        uint64_t v8 = [v7 _parentGroup];

        double v7 = (void *)v8;
      }
      while (v8);
    }
    uint64_t v9 = [v5 indexOfObjectWithOptions:2 passingTest:&__block_literal_global_123_1];
    if (v9 != 0x7FFFFFFFFFFFFFFFLL)
    {
      [v5 objectAtIndex:v9];
    }
  }

  return 0;
}

- (void)_tabModelDidReload:(id)a3
{
  id v4 = a3;
  int v5 = [(_UIFloatingTabBar *)self _isEffectivelyEmpty];
  id v6 = [v4 tabItems];

  LODWORD(v4) = [v6 count] != 0;
  uint64_t v7 = v4 & ~v5;
  [(_UIFloatingTabBar *)self _invalidateDataSourceAnimated:v7];
  [(_UIFloatingTabBar *)self _updateSelectedItemAnimated:v7 completion:0];
}

- (void)_tabModel:(id)a3 tabContentDidChange:(id)a4
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = [(_UIFloatingTabBar *)self _indexPathForTabItem:v5];
  unint64_t v7 = [v5 _tabPlacement] - 4;
  if (v7 > 2)
  {
    uint64_t v8 = 1;
    if (!v6) {
      goto LABEL_14;
    }
  }
  else
  {
    uint64_t v8 = qword_186B9E100[v7];
    if (!v6) {
      goto LABEL_14;
    }
  }
  if ([v6 section] == v8)
  {
    [(_UIFloatingTabBar *)self _setNeedsPaginationUpdate];
    if ([v6 section] == 3)
    {
      uint64_t v9 = [(_UIFloatingTabBar *)self pinnedItemsView];
      [v9 reloadItemViewForTab:v5];
    }
    else
    {
      int64_t v12 = [(_UIFloatingTabBar *)self _indexInDataSourceForItemAtIndexPath:v6];
      if (v12 == 0x7FFFFFFFFFFFFFFFLL)
      {
LABEL_13:
        [(_UIFloatingTabBar *)self _updateTabBarPaginationAnimated:1];
        [(_UIFloatingTabBar *)self _updateSelectionViewFrameAnimated:1 completion:0];
        goto LABEL_14;
      }
      int64_t v13 = v12;
      double v14 = [(_UIFloatingTabBar *)self dataSource];
      double v15 = [v14 snapshot];

      double v16 = [(NSDiffableDataSourceSnapshot *)v15 itemIdentifiers];
      uint64_t v9 = [v16 objectAtIndex:v13];

      v21[0] = v9;
      uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
      [(NSDiffableDataSourceSnapshot *)v15 reconfigureItemsWithIdentifiers:v17];

      lastSnapshot = self->_lastSnapshot;
      self->_lastSnapshot = v15;
      BOOL v19 = v15;

      BOOL v20 = [(_UIFloatingTabBar *)self dataSource];
      [v20 applySnapshot:v19 animatingDifferences:1];
    }
    goto LABEL_13;
  }
  [(_UIFloatingTabBar *)self _invalidateDataSourceAnimated:1];
  id v10 = [(_UIFloatingTabBar *)self tabModel];
  id v11 = [v10 selectedLeaf];

  if (v11 == v5) {
    [(_UIFloatingTabBar *)self _updateSelectedLeaf:v5 previousElement:v5];
  }
LABEL_14:
}

- (void)_tabModel:(id)a3 visibilityDidChangeForTab:(id)a4
{
  id v9 = a4;
  id v5 = [(_UIFloatingTabBar *)self _indexPathForTabItem:v9];
  BOOL v6 = v5 != 0;

  unint64_t v7 = [(_UIFloatingTabBar *)self tabModel];
  int v8 = [v7 isTabHidden:v9];

  if (((v6 ^ v8) & 1) == 0)
  {
    [(_UIFloatingTabBar *)self _invalidateDataSourceAnimated:1];
    if ((v8 & 1) == 0) {
      [(_UIFloatingTabBar *)self _updateSelectedLeaf:v9 previousElement:v9];
    }
  }
}

- (void)_tabModel:(id)a3 didChangeSelectedLeaf:(id)a4 previousElement:(id)a5
{
}

- (void)_tabModel:(id)a3 customizationStoreDidChange:(id)a4
{
}

- (void)_tabModel:(id)a3 favoriteOrderDidChange:(id)a4 animated:(BOOL)a5
{
}

- (void)_tabModel:(id)a3 favoriteOrderDidReset:(id)a4
{
  id v5 = [(_UIFloatingTabBar *)self parser];
  -[_UIFloatingTabBarParser sourceTabIdentifiers](v5);
  id v7 = (id)objc_claimAutoreleasedReturnValue();

  BOOL v6 = [(_UIFloatingTabBar *)self dragController];
  [v6 resetFavoriteOrderWithDefaultOrder:v7];

  [(_UIFloatingTabBar *)self _invalidateFavoriteOrderAnimated:1];
}

- (void)_updateSelectedLeaf:(id)a3 previousElement:(id)a4
{
  id v22 = a3;
  id v6 = a4;
  id v7 = [(UIView *)self window];
  if (v7) {
    BOOL v8 = !self->_isInTransitionAnimation;
  }
  else {
    BOOL v8 = 0;
  }

  BOOL v9 = [(_UIFloatingTabBar *)self showRecentItem];
  id v10 = [(_UIFloatingTabBar *)self recentItem];
  id v11 = [(_UIFloatingTabBar *)self _indexPathForTabItem:v22];
  if (v9)
  {
    int64_t v12 = [(_UIFloatingTabBar *)self parser];
    int64_t v13 = -[_UIFloatingTabBarParser itemIdentifiers](v12);
    double v14 = [v22 identifier];
    if (([v13 containsObject:v14] & 1) != 0
      || v11 && ![(_UIFloatingTabBar *)self _isRecentItemIndexPath:v11])
    {
    }
    else
    {
      id v15 = [v10 tabForSelection];

      if (v15 != v22)
      {
        if (v22 && ([v22 isHidden] & 1) == 0)
        {
          double v16 = [[_UIFloatingTabBarListItem alloc] initWithTab:v22];
          double v21 = [(_UIFloatingTabBar *)self _contentTabForRecentTab:v22];
          [(_UIFloatingTabBarListItem *)v16 setContentTab:v21];
        }
        else
        {
          double v16 = 0;
        }
        recentItem = self->_recentItem;
        self->_recentItem = v16;
        goto LABEL_18;
      }
    }
    if (v10)
    {
      uint64_t v17 = [v10 tabForSelection];
      int v18 = [v17 _isAncestorOfTab:v22];

      if (v18)
      {
LABEL_17:
        recentItem = self->_recentItem;
        self->_recentItem = 0;
LABEL_18:

        [(_UIFloatingTabBar *)self _updateDataSourceFromParserAnimated:v8];
        [(_UIFloatingTabBar *)self _scrollToSelectedItemAnimated:v8];
        goto LABEL_21;
      }
    }
  }
  else if (v10)
  {
    goto LABEL_17;
  }
  if (v6 != v22)
  {
    [(_UIFloatingTabBar *)self _scrollToSelectedItemAnimated:v8];
    [(_UIFloatingTabBar *)self _updateSelectedItemAnimated:v8 completion:0];
  }
LABEL_21:
  BOOL v20 = [(UIView *)self window];

  if (!v20) {
    *(unsigned char *)&self->_needsUpdate |= 0x20u;
  }
}

- (id)resolvedPopoverPresentationControllerSourceItemForTab:(id)a3
{
  id v4 = [(_UIFloatingTabBar *)self _indexPathForTabItem:a3];
  if (v4)
  {
    int64_t v5 = [(_UIFloatingTabBar *)self _pageIndexForItemAtIndexPath:v4];
    id v6 = [(_UIFloatingTabBar *)self collectionView];
    uint64_t v7 = [v6 targetPage];

    if ([v4 section] == 3)
    {
      BOOL v8 = [(_UIFloatingTabBar *)self pinnedItemsView];
      BOOL v9 = objc_msgSend(v8, "itemViewForItemAtIndex:", objc_msgSend(v4, "item"));

      goto LABEL_16;
    }
    if (v5 == v7)
    {
      uint64_t v10 = [(_UIFloatingTabBar *)self _viewForItemAtIndexPath:v4];
      goto LABEL_15;
    }
    BOOL v11 = [(UIView *)self _shouldReverseLayoutDirection];
    BOOL v12 = v5 > v7;
    if (!v11) {
      BOOL v12 = v5 < v7;
    }
    if (v12) {
      [(_UIFloatingTabBar *)self leftArrowButton];
    }
    else {
      [(_UIFloatingTabBar *)self rightArrowButton];
    }
  }
  else if ([(_UIFloatingTabBar *)self showsSidebarButton])
  {
    [(_UIFloatingTabBar *)self sidebarButton];
  }
  else
  {
    [(_UIFloatingTabBar *)self contentView];
  uint64_t v10 = };
LABEL_15:
  BOOL v9 = (void *)v10;
LABEL_16:

  return v9;
}

- (void)_setNeedsSelectionFrameUpdate
{
  *(unsigned char *)&self->_needsUpdate |= 2u;
  [(UIView *)self setNeedsLayout];
}

- (void)_setNeedsSelectionAlphaUpdate
{
  *(unsigned char *)&self->_needsUpdate |= 4u;
}

- (void)_setNeedsScrollToSelectedItem
{
  *(unsigned char *)&self->_needsUpdate |= 8u;
}

- (void)_updateSelectedItemAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  BOOL v8 = (void (**)(id, uint64_t, void))a4;
  id v6 = [(_UIFloatingTabBar *)self _indexPathForSelectedItem];
  uint64_t v7 = v6;
  if (v6)
  {
    if ([v6 section] == 3) {
      [(_UIFloatingTabBar *)self setExpandedGroupItem:0];
    }
    [(_UIFloatingTabBar *)self _updateSelectionViewFrameAnimated:v4 completion:v8];
    [(_UIFloatingTabBar *)self _updateSelectionViewVisibilityAnimated:v4];
  }
  else if (v8)
  {
    v8[2](v8, 1, 0);
  }
}

- (void)_setSelectedItem:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v13 = a3;
  BOOL v8 = (void (**)(id, uint64_t, void))a5;
  if ([(_UITabModel *)self->_tabModel shouldSelectTab:v13])
  {
    id v9 = [(_UITabModel *)self->_tabModel selectedItem];
    id v10 = v13;
    BOOL v11 = v10;
    if (v9 == v10)
    {

      [(_UITabModel *)self->_tabModel selectElement:v11 notifyOnReselection:1];
    }
    else
    {
      if (!v10 || !v9)
      {

        [(_UITabModel *)self->_tabModel selectElement:v11 notifyOnReselection:1];
LABEL_11:
        [(_UIFloatingTabBar *)self _updateSelectedItemAnimated:v6 completion:v8];
        goto LABEL_12;
      }
      char v12 = [v9 isEqual:v10];

      [(_UITabModel *)self->_tabModel selectElement:v11 notifyOnReselection:1];
      if ((v12 & 1) == 0) {
        goto LABEL_11;
      }
    }
  }
  if (v8) {
    v8[2](v8, 1, 0);
  }
LABEL_12:
}

- (void)_selectItemAtIndexPath:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    uint64_t v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"_UIFloatingTabBar.m", 1995, @"Invalid parameter not satisfying: %@", @"indexPath" object file lineNumber description];
  }
  if ([v5 section] != 3)
  {
    BOOL v8 = [(_UIFloatingTabBar *)self dataSource];
    uint64_t v7 = [v8 itemIdentifierForIndexPath:v5];

    id v9 = [v7 tabForSelection];
    id v10 = [v7 children];

    if (v10)
    {
      [(_UIFloatingTabBar *)self setExpandedGroupItem:v7];
    }
    else
    {
      BOOL v11 = [v7 tabForSelection];
      int v12 = [v11 _isElement];

      if (v12)
      {
        objc_initWeak(&location, self);
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __44___UIFloatingTabBar__selectItemAtIndexPath___block_invoke;
        v18[3] = &unk_1E5306400;
        objc_copyWeak(&v21, &location);
        id v19 = v9;
        id v13 = v7;
        id v20 = v13;
        [(_UIFloatingTabBar *)self _setSelectedItem:v19 animated:1 completion:v18];
        double v14 = [(_UIFloatingTabBar *)self expandedGroupItem];
        id v15 = [v13 parent];

        if (v14 != v15) {
          [(_UIFloatingTabBar *)self setExpandedGroupItem:0];
        }

        objc_destroyWeak(&v21);
        objc_destroyWeak(&location);
      }
      else
      {
        double v16 = [MEMORY[0x1E4F28B00] currentHandler];
        [v16 handleFailureInMethod:a2 object:self file:@"_UIFloatingTabBar.m" lineNumber:2035 description:@"Non-UITabElement tabs are currently not supported"];
      }
    }
    goto LABEL_14;
  }
  BOOL v6 = [(_UIFloatingTabBar *)self pinnedItemsView];
  uint64_t v7 = objc_msgSend(v6, "tabForSelectionAtItemIndex:", objc_msgSend(v5, "item"));

  if (![v7 _isElement])
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"_UIFloatingTabBar.m" lineNumber:2002 description:@"Non-UITabElement tabs are currently not supported"];
LABEL_14:

    goto LABEL_15;
  }
  [(_UIFloatingTabBar *)self _setSelectedItem:v7 animated:1 completion:0];
LABEL_15:
}

- (BOOL)_isEffectivelyEmpty
{
  v2 = [(_UIFloatingTabBar *)self parser];
  id v3 = -[_UIFloatingTabBarParser itemIdentifiers](v2);
  BOOL v4 = [v3 count] == 0;

  return v4;
}

- (id)_indexPathForTabItem:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    int v12 = 0;
    goto LABEL_10;
  }
  id v5 = [(_UIFloatingTabBar *)self lastSnapshot];
  BOOL v6 = [v5 itemIdentifiers];

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __42___UIFloatingTabBar__indexPathForTabItem___block_invoke;
  v15[3] = &unk_1E52DF0A0;
  id v7 = v4;
  id v16 = v7;
  uint64_t v8 = [v6 indexOfObjectPassingTest:v15];
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v9 = [(_UIFloatingTabBar *)self pinnedItemsView];
    uint64_t v10 = [v9 itemIndexForTab:v7];

    if (v10 != 0x7FFFFFFFFFFFFFFFLL)
    {
      int v12 = [MEMORY[0x1E4F28D58] indexPathForItem:v10 inSection:3];
      goto LABEL_9;
    }
    BOOL v11 = [v7 _parentGroup];
    int v12 = [(_UIFloatingTabBar *)self _indexPathForTabItem:v11];
  }
  else
  {
    BOOL v11 = [v6 objectAtIndex:v8];
    id v13 = [(_UIFloatingTabBar *)self dataSource];
    int v12 = [v13 indexPathForItemIdentifier:v11];
  }
LABEL_9:

LABEL_10:
  return v12;
}

- (id)_indexPathForSelectedItem
{
  id v3 = [(_UIFloatingTabBar *)self tabModel];
  id v4 = [v3 selectedLeaf];

  if (!v4
    || ([v4 _isMoreTab] & 1) != 0
    || [(_UIFloatingTabBar *)self _isEffectivelyEmpty]
    && ([(_UIFloatingTabBar *)self recentItem],
        BOOL v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        !v6))
  {
    id v5 = 0;
  }
  else
  {
    id v5 = [(_UIFloatingTabBar *)self _indexPathForTabItem:v4];
  }

  return v5;
}

- (CGRect)_itemFrameForItemAtIndexPath:(id)a3 inCoordinateSpace:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  if ([v7 section] == 3)
  {
    uint64_t v8 = [(_UIFloatingTabBar *)self pinnedItemsView];
    uint64_t v9 = [v7 item];

    [v8 itemFrameForItemAtIndex:v9];
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;

    int v18 = [(_UIFloatingTabBar *)self pinnedItemsView];
    id v19 = v18;
    double v20 = v11;
    double v21 = v13;
    double v22 = v15;
    double v23 = v17;
  }
  else
  {
    double v24 = [(_UIFloatingTabBar *)self collectionView];
    id v19 = [v24 cellForItemAtIndexPath:v7];

    if (!v19)
    {
      double v26 = *MEMORY[0x1E4F1DB20];
      double v28 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
      double v30 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
      double v32 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
      goto LABEL_7;
    }
    [v19 bounds];
    int v18 = v19;
  }
  objc_msgSend(v18, "convertRect:toCoordinateSpace:", v6, v20, v21, v22, v23);
  double v26 = v25;
  double v28 = v27;
  double v30 = v29;
  double v32 = v31;
LABEL_7:

  double v33 = v26;
  double v34 = v28;
  double v35 = v30;
  double v36 = v32;
  result.size.double height = v36;
  result.size.double width = v35;
  result.origin.double y = v34;
  result.origin.double x = v33;
  return result;
}

- (void)_updateSelectionViewFrameAnimated:(BOOL)a3 completion:(id)a4
{
  uint64_t v4 = a3;
  id v6 = a4;
  uint64_t v7 = [(_UIFloatingTabBar *)self _indexPathForSelectedItem];
  if (!v7)
  {
    [(_UIFloatingTabBar *)self setSelectionViewIndexPath:0];
    [(_UIFloatingTabBar *)self _updateSelectionViewVisibilityAnimated:v4];
    goto LABEL_28;
  }
  uint64_t v8 = (void *)v7;
  uint64_t v9 = [(_UIFloatingTabBar *)self highlightedIndexPath];
  if (!v9)
  {
    LOBYTE(v11) = 0;
    goto LABEL_9;
  }
  double v10 = (void *)v9;
  if ([(_UIFloatingTabBar *)self selectionViewFollowsHighlightedItem])
  {
  }
  else
  {
    double v12 = [(_UIFloatingTabBar *)self highlightedIndexPath];
    double v13 = [(_UIFloatingTabBar *)self selectionViewIndexPath];
    int v11 = [v12 isEqual:v13];

    if (!v11) {
      goto LABEL_9;
    }
  }
  uint64_t v14 = [(_UIFloatingTabBar *)self highlightedIndexPath];

  LOBYTE(v11) = 1;
  uint64_t v8 = (void *)v14;
LABEL_9:
  [(_UIFloatingTabBar *)self setSelectionViewIndexPath:v8];
  double v15 = [(_UIFloatingTabBar *)self selectionContainerView];
  [(_UIFloatingTabBar *)self _itemFrameForItemAtIndexPath:v8 inCoordinateSpace:v15];
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  CGFloat v21 = v20;
  CGFloat v23 = v22;

  v51.origin.double x = v17;
  v51.origin.double y = v19;
  v51.size.double width = v21;
  v51.size.double height = v23;
  if (CGRectIsNull(v51)) {
    goto LABEL_31;
  }
  v52.origin.double x = v17;
  v52.origin.double y = v19;
  v52.size.double width = v21;
  v52.size.double height = v23;
  double MidY = CGRectGetMidY(v52);
  double v25 = [(_UIFloatingTabBar *)self collectionView];
  [v25 bounds];
  double v26 = CGRectGetMidY(v53);

  if (MidY == v26)
  {
LABEL_31:
    if (self->_isInTransitionAnimation) {
      uint64_t v4 = 0;
    }
    else {
      uint64_t v4 = v4;
    }
    double v27 = [(_UIFloatingTabBar *)self contentView];
    double v28 = [v27 traitCollection];
    uint64_t v29 = [v28 valueForNSIntegerTrait:objc_opt_class()];

    double v30 = [(_UIFloatingTabBar *)self contentView];
    double v31 = [v30 traitCollection];
    BOOL v32 = [v31 valueForNSIntegerTrait:objc_opt_class()] != 0;

    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __66___UIFloatingTabBar__updateSelectionViewFrameAnimated_completion___block_invoke;
    aBlock[3] = &unk_1E52E8950;
    aBlock[4] = self;
    *(CGFloat *)&aBlock[5] = v17;
    *(CGFloat *)&aBlock[6] = v19;
    *(CGFloat *)&aBlock[7] = v21;
    *(CGFloat *)&aBlock[8] = v23;
    char v49 = v11;
    BOOL v50 = v32;
    double v33 = (void (**)(void))_Block_copy(aBlock);
    if (v4 == 1 && !v29)
    {
      double v34 = [(_UIFloatingTabBar *)self selectionContainerView];
      [v34 selectionViewFrame];
      v55.origin.double x = v17;
      v55.origin.double y = v19;
      v55.size.double width = v21;
      v55.size.double height = v23;
      BOOL v35 = CGRectEqualToRect(v54, v55);

      if (!v35)
      {
        double v36 = [(UIView *)self->_contentView traitOverrides];
        [v36 setNSIntegerValue:1 forTrait:objc_opt_class()];
      }
    }
    double v37 = [(_UIFloatingTabBar *)self selectionFrameGroupCompletion];
    objc_initWeak(&location, self);
    uint64_t v41 = MEMORY[0x1E4F143A8];
    uint64_t v42 = 3221225472;
    double v43 = __66___UIFloatingTabBar__updateSelectionViewFrameAnimated_completion___block_invoke_2;
    unint64_t v44 = &unk_1E5305158;
    id v38 = v37;
    id v45 = v38;
    id v46 = v6;
    double v39 = (void (**)(void *, uint64_t, void))_Block_copy(&v41);
    objc_msgSend(v38, "increment", v41, v42, v43, v44);
    if (v4)
    {
      [(_UIFloatingTabBar *)self _animateSelection:v33 completion:v39];
    }
    else if (+[UIView _isInAnimationBlock])
    {
      v33[2](v33);
      v39[2](v39, 1, 0);
    }
    else
    {
      +[UIView _animateByRetargetingAnimations:v33 completion:v39];
    }
    char needsUpdate = (char)self->_needsUpdate;
    *(unsigned char *)&self->_char needsUpdate = needsUpdate & 0xFD;
    if ((needsUpdate & 4) != 0) {
      [(_UIFloatingTabBar *)self _updateSelectionViewVisibilityAnimated:v4];
    }

    objc_destroyWeak(&location);
  }
  else
  {
    [(_UIFloatingTabBar *)self _setNeedsSelectionAlphaUpdate];
    [(_UIFloatingTabBar *)self _setNeedsSelectionFrameUpdate];
  }

LABEL_28:
}

- (_UIGroupCompletion)selectionFrameGroupCompletion
{
  selectionFrameGroupCompletion = self->_selectionFrameGroupCompletion;
  if (!selectionFrameGroupCompletion)
  {
    uint64_t v4 = objc_alloc_init(_UIGroupCompletion);
    id v5 = self->_selectionFrameGroupCompletion;
    self->_selectionFrameGroupCompletion = v4;

    objc_initWeak(&location, self);
    id v6 = self->_selectionFrameGroupCompletion;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __50___UIFloatingTabBar_selectionFrameGroupCompletion__block_invoke;
    v8[3] = &unk_1E52DC308;
    objc_copyWeak(&v9, &location);
    [(_UIGroupCompletion *)v6 addNonIncrementingCompletion:v8];
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
    selectionFrameGroupCompletion = self->_selectionFrameGroupCompletion;
  }
  return selectionFrameGroupCompletion;
}

- (BOOL)hasActiveDrag
{
  v2 = [(_UIFloatingTabBar *)self dragController];
  char v3 = [v2 hasActiveDrag];

  return v3;
}

- (double)baselineOffsetFromTop
{
  char v3 = [(_UIFloatingTabBar *)self _currentPlatformMetrics];
  [v3 backgroundInsets];
  double v5 = v4;
  [v3 titleMargins];
  double v7 = v5 + v6 + self->_minimumItemBaselineFromTop;

  return v7;
}

- (int64_t)_indexInDataSourceForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  int64_t v5 = [v4 item];
  if ([v4 section] >= 1)
  {
    double v6 = [(_UIFloatingTabBar *)self lastSnapshot];
    v5 += [v6 numberOfItemsInSection:&unk_1ED3F7368];
  }
  if ([v4 section] > 1)
  {
    double v7 = [(_UIFloatingTabBar *)self lastSnapshot];
    v5 += [v7 numberOfItemsInSection:&unk_1ED3F7380];
  }
  return v5;
}

- (id)_indexPathForItemAtDataSourceIndex:(int64_t)a3
{
  int64_t v5 = [(_UIFloatingTabBar *)self lastSnapshot];
  double v6 = [v5 itemIdentifiers];
  unint64_t v7 = [v6 count];

  if (v7 <= a3)
  {
    double v12 = 0;
  }
  else
  {
    uint64_t v8 = [(_UIFloatingTabBar *)self lastSnapshot];
    id v9 = [v8 itemIdentifiers];
    double v10 = [v9 objectAtIndex:a3];

    int v11 = [(_UIFloatingTabBar *)self dataSource];
    double v12 = [v11 indexPathForItemIdentifier:v10];
  }
  return v12;
}

- (int64_t)_pageIndexForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(_UIFloatingTabBar *)self _indexInDataSourceForItemAtIndexPath:v4];
  double v6 = [(_UIFloatingTabBar *)self collectionView];
  unint64_t v7 = [v6 pages];
  uint64_t v8 = [(_UIFloatingTabBar *)self collectionView];
  id v9 = objc_msgSend(v7, "objectAtIndexedSubscript:", objc_msgSend(v8, "targetPage"));
  unint64_t v10 = [v9 range];
  unint64_t v12 = v11;

  if (v5 < v10 || v5 - v10 >= v12)
  {
    uint64_t v19 = 0;
    double v20 = &v19;
    uint64_t v21 = 0x2020000000;
    uint64_t v22 = 0x7FFFFFFFFFFFFFFFLL;
    double v15 = [(_UIFloatingTabBar *)self collectionView];
    double v16 = [v15 pages];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __50___UIFloatingTabBar__pageIndexForItemAtIndexPath___block_invoke;
    v18[3] = &unk_1E5300400;
    void v18[4] = &v19;
    v18[5] = v5;
    [v16 enumerateObjectsUsingBlock:v18];

    int64_t v14 = v20[3];
    _Block_object_dispose(&v19, 8);
  }
  else
  {
    double v13 = [(_UIFloatingTabBar *)self collectionView];
    int64_t v14 = [v13 targetPage];
  }
  return v14;
}

- (void)_scrollToSelectedItemAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v10 = [(_UIFloatingTabBar *)self _indexPathForSelectedItem];
  BOOL v5 = [v10 section] == 3;
  double v6 = v10;
  if (!v5)
  {
    if (*(unsigned char *)&self->_needsUpdate)
    {
      [(_UIFloatingTabBar *)self _setNeedsScrollToSelectedItem];
    }
    else
    {
      if (v10)
      {
        int64_t v7 = [(_UIFloatingTabBar *)self _pageIndexForItemAtIndexPath:v10];
        double v6 = v10;
        if (v7 == 0x7FFFFFFFFFFFFFFFLL) {
          goto LABEL_9;
        }
        uint64_t v8 = [(_UIFloatingTabBar *)self collectionView];
        [v8 setTargetPage:v7];

        id v9 = [(_UIFloatingTabBar *)self collectionView];
        [v9 scrollToTargetPageAnimated:v3];
      }
      [(_UIFloatingTabBar *)self _updateSelectionViewVisibilityAnimated:v3];
    }
    double v6 = v10;
  }
LABEL_9:
}

- (void)_scrollToSelectedItemIfNeeded
{
  char needsUpdate = (char)self->_needsUpdate;
  if ((needsUpdate & 8) != 0)
  {
    [(_UIFloatingTabBar *)self _scrollToSelectedItemAnimated:0];
    char needsUpdate = *(unsigned char *)&self->_needsUpdate & 0xE7;
    *(unsigned char *)&self->_char needsUpdate = needsUpdate;
  }
  if ((needsUpdate & 0x10) != 0)
  {
    id v4 = [(_UIFloatingTabBar *)self collectionView];
    [v4 scrollToTargetPageAnimated:0];

    *(unsigned char *)&self->_needsUpdate &= ~0x10u;
  }
}

- (void)_updateSelectionViewVisibilityAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(_UIFloatingTabBar *)self _indexPathForSelectedItem];
  int64_t v6 = [(_UIFloatingTabBar *)self _indexInDataSourceForItemAtIndexPath:v5];
  if (v5)
  {
    unint64_t v7 = v6;
    if ([v5 section] == 3)
    {
      BOOL v8 = 1;
    }
    else
    {
      id v9 = [(_UIFloatingTabBar *)self collectionView];
      id v10 = [v9 pages];
      unint64_t v11 = [(_UIFloatingTabBar *)self collectionView];
      unint64_t v12 = objc_msgSend(v10, "objectAtIndexedSubscript:", objc_msgSend(v11, "targetPage"));
      unint64_t v13 = [v12 range];
      unint64_t v15 = v14;

      BOOL v8 = v7 >= v13 && v7 - v13 < v15;
    }
  }
  else
  {
    BOOL v8 = 0;
  }
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __60___UIFloatingTabBar__updateSelectionViewVisibilityAnimated___block_invoke;
  v19[3] = &unk_1E52D9FC0;
  v19[4] = self;
  BOOL v20 = v8;
  CGFloat v17 = _Block_copy(v19);
  double v18 = v17;
  if (v3) {
    [(_UIFloatingTabBar *)self _animateSelection:v17 completion:0];
  }
  else {
    (*((void (**)(void *))v17 + 2))(v17);
  }
  *(unsigned char *)&self->_needsUpdate &= ~4u;
}

- (void)setSelectionViewIndexPath:(id)a3
{
  id v5 = a3;
  int64_t v6 = self->_selectionViewIndexPath;
  unint64_t v7 = (NSIndexPath *)v5;
  id v10 = v7;
  if (v6 == v7)
  {

LABEL_12:
    id v9 = v10;
    goto LABEL_13;
  }
  if (v7 && v6)
  {
    char v8 = [(NSIndexPath *)v6 isEqual:v7];

    id v9 = v10;
    if (v8) {
      goto LABEL_13;
    }
  }
  else
  {
  }
  if (self->_selectionViewIndexPath) {
    -[_UIFloatingTabBar _setHasSelectionHighlight:forItemAtIndexPath:](self, "_setHasSelectionHighlight:forItemAtIndexPath:", 0);
  }
  objc_storeStrong((id *)&self->_selectionViewIndexPath, a3);
  id v9 = v10;
  if (v10)
  {
    [(_UIFloatingTabBar *)self _setHasSelectionHighlight:1 forItemAtIndexPath:v10];
    goto LABEL_12;
  }
LABEL_13:
}

- (void)_animateSelection:(id)a3 completion:(id)a4
{
}

- (void)setExpandedGroupItem:(id)a3
{
  v32[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  p_expandedGroupItem = (id *)&self->_expandedGroupItem;
  char v8 = self->_expandedGroupItem;
  id v9 = (_UIFloatingTabBarListItem *)v6;
  id v10 = v9;
  if (v8 == v9)
  {
  }
  else
  {
    if (v9 && v8)
    {
      BOOL v11 = [(_UIFloatingTabBarListItem *)v8 isEqual:v9];

      if (v11) {
        goto LABEL_15;
      }
    }
    else
    {
    }
    unint64_t v12 = [(_UIFloatingTabBar *)self dataSource];
    unint64_t v13 = [v12 snapshot];

    if (*p_expandedGroupItem)
    {
      v32[0] = *p_expandedGroupItem;
      unint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:1];
      unint64_t v15 = [*p_expandedGroupItem children];
      double v16 = [v15 firstObject];
      [v13 insertItemsWithIdentifiers:v14 afterItemWithIdentifier:v16];

      CGFloat v17 = [*p_expandedGroupItem children];
      [v13 deleteItemsWithIdentifiers:v17];

      objc_storeStrong((id *)&self->_outgoingExpandedGroupItem, *p_expandedGroupItem);
    }
    objc_storeStrong((id *)&self->_expandedGroupItem, a3);
    if (v10)
    {
      double v18 = [(_UIFloatingTabBarListItem *)v10 children];
      BOOL v19 = v18 == 0;

      if (v19)
      {
        CGFloat v23 = [MEMORY[0x1E4F28B00] currentHandler];
        [v23 handleFailureInMethod:a2 object:self file:@"_UIFloatingTabBar.m" lineNumber:2381 description:@"Cannot expand a group without children"];
      }
      BOOL v20 = [(_UIFloatingTabBarListItem *)v10 children];
      [v13 insertItemsWithIdentifiers:v20 afterItemWithIdentifier:v10];

      double v31 = v10;
      uint64_t v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v31 count:1];
      [v13 deleteItemsWithIdentifiers:v21];
    }
    objc_initWeak(&location, self);
    objc_storeStrong((id *)&self->_lastSnapshot, v13);
    uint64_t v22 = [(_UIFloatingTabBar *)self dataSource];
    uint64_t v24 = MEMORY[0x1E4F143A8];
    uint64_t v25 = 3221225472;
    double v26 = __42___UIFloatingTabBar_setExpandedGroupItem___block_invoke;
    double v27 = &unk_1E52D9960;
    objc_copyWeak(&v29, &location);
    double v28 = self;
    [v22 applySnapshot:v13 animatingDifferences:1 completion:&v24];

    -[_UIFloatingTabBar _updateTabBarPaginationAnimated:](self, "_updateTabBarPaginationAnimated:", 1, v24, v25, v26, v27);
    [(_UIFloatingTabBar *)self _updateSelectionViewFrameAnimated:1 completion:0];
    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);
  }
LABEL_15:
}

- (void)_observeScrollViewDidScroll:(id)a3
{
  [(_UIFloatingTabBar *)self _setNeedsSelectionFrameUpdate];
  [(UIView *)self setNeedsLayout];
}

- (void)_updateContentAlphaForVisibleCells
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  BOOL v3 = [(_UIFloatingTabBar *)self collectionView];
  id v4 = [v3 indexPathsForVisibleItems];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [(_UIFloatingTabBar *)self _updateContentAlphaForItemAtIndexPath:*(void *)(*((void *)&v9 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)_updateContentAlphaForItemAtIndexPath:(id)a3
{
  id v39 = a3;
  uint64_t v4 = [(_UIFloatingTabBar *)self collectionView];
  uint64_t v5 = [(id)v4 layoutAttributesForItemAtIndexPath:v39];

  LOBYTE(v4) = [(UIView *)self _shouldReverseLayoutDirection];
  uint64_t v6 = [(_UIFloatingTabBar *)self collectionView];
  [v5 frame];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  unint64_t v15 = [(_UIFloatingTabBar *)self collectionViewContainer];
  objc_msgSend(v6, "convertRect:toView:", v15, v8, v10, v12, v14);
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  CGFloat v21 = v20;
  CGFloat v23 = v22;

  if (v4)
  {
    uint64_t v24 = [(_UIFloatingTabBar *)self pinnedItemsView];
    [v24 frame];
    double MaxX = CGRectGetMaxX(v41);

    if ([(_UIFloatingTabBar *)self showsSidebarButton]) {
      [(_UIFloatingTabBar *)self sidebarButton];
    }
    else {
    double v26 = [(_UIFloatingTabBar *)self rightArrowButton];
    }
  }
  else
  {
    if ([(_UIFloatingTabBar *)self showsSidebarButton]) {
      [(_UIFloatingTabBar *)self sidebarButton];
    }
    else {
    double v27 = [(_UIFloatingTabBar *)self leftArrowButton];
    }
    [v27 frame];
    double MaxX = CGRectGetMaxX(v42);

    double v26 = [(_UIFloatingTabBar *)self pinnedItemsView];
  }
  double v28 = v26;
  [v26 frame];
  double MinX = CGRectGetMinX(v43);

  v44.origin.double x = v17;
  v44.origin.double y = v19;
  v44.size.double width = v21;
  v44.size.double height = v23;
  double v30 = MaxX - CGRectGetMinX(v44);
  v45.origin.double x = v17;
  v45.origin.double y = v19;
  v45.size.double width = v21;
  v45.size.double height = v23;
  double v31 = CGRectGetMaxX(v45) - MinX;
  BOOL v32 = [(_UIFloatingTabBar *)self _currentPlatformMetrics];
  [v32 contentAlphaDistanceThreshold];
  double v34 = v33;

  v46.origin.double x = v17;
  v46.origin.double y = v19;
  v46.size.double width = v21;
  v46.size.double height = v23;
  double v35 = fmax(fmin(1.0 - fmax(v30, v31) / fmin(v34, CGRectGetWidth(v46)), 1.0), 0.0);
  double v36 = [(_UIFloatingTabBar *)self collectionView];
  double v37 = [v36 cellForItemAtIndexPath:v39];

  id v38 = [v37 contentView];
  [v38 setAlpha:v35];
}

- (void)scrollViewDidScroll:(id)a3
{
  uint64_t v4 = [(_UIFloatingTabBar *)self selectionGestureRecognizer];
  uint64_t v5 = [v4 state];

  if (v5)
  {
    uint64_t v6 = [(_UIFloatingTabBar *)self selectionGestureRecognizer];
    [v6 setEnabled:0];

    id v7 = [(_UIFloatingTabBar *)self selectionGestureRecognizer];
    [v7 setEnabled:1];
  }
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __49___UIFloatingTabBar_scrollViewWillBeginDragging___block_invoke;
  v3[3] = &unk_1E52D9F70;
  v3[4] = self;
  [(_UIFloatingTabBar *)self _animateSelection:v3 completion:0];
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  id v7 = [(_UIFloatingTabBar *)self collectionView];
  objc_msgSend(v7, "pageProgressForContentOffset:clamped:", 1, a5->x, a5->y);
  double v9 = v8;

  id v10 = [(_UIFloatingTabBar *)self collectionView];
  [v10 setTargetPage:llround(v9)];
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  if (!a4) {
    [(_UIFloatingTabBar *)self _updateSelectionViewVisibilityAnimated:1];
  }
}

- (void)scrollViewWillBeginDecelerating:(id)a3
{
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v14 = a4;
  id v7 = a5;
  double v8 = [(_UIFloatingTabBar *)self highlightedIndexPath];
  objc_msgSend(v14, "setHighlighted:", objc_msgSend(v7, "isEqual:", v8));

  double v9 = [(_UIFloatingTabBar *)self selectionViewIndexPath];
  uint64_t v10 = [v7 isEqual:v9];

  [v14 setHasSelectionHighlight:v10];
  double v11 = [v14 listItem];
  double v12 = [(_UIFloatingTabBar *)self outgoingExpandedGroupItem];
  LODWORD(v9) = [v11 isEqual:v12];

  if (v9)
  {
    double v13 = [v14 contentView];
    [v13 setHidden:1];
  }
}

- (BOOL)collectionView:(id)a3 canEditItemAtIndexPath:(id)a4
{
  return 1;
}

- (id)_currentPlatformMetrics
{
  v2 = [(UIView *)self traitCollection];
  BOOL v3 = _UIFloatingTabBarGetPlatformMetrics([v2 userInterfaceIdiom]);

  return v3;
}

+ (NSCopying)visualStyleRegistryIdentity
{
  return (NSCopying *)@"_UIFloatingTabBar";
}

+ (void)registerPlatformMetrics
{
  if (registerPlatformMetrics___defaultRegistrationToken != -1) {
    dispatch_once(&registerPlatformMetrics___defaultRegistrationToken, &__block_literal_global_147_2);
  }
}

- (_UITabModel)tabModel
{
  return self->_tabModel;
}

- (BOOL)showRecentItem
{
  return self->_showRecentItem;
}

- (UIAction)sidebarButtonAction
{
  return self->_sidebarButtonAction;
}

- (NSString)backdropGroupName
{
  return self->_backdropGroupName;
}

- (CGAffineTransform)additionalTransform
{
  long long v3 = *(_OWORD *)&self[15].c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[15].a;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&self[15].tx;
  return self;
}

- (CGRect)frameForExpandedDropTarget
{
  double x = self->_frameForExpandedDropTarget.origin.x;
  double y = self->_frameForExpandedDropTarget.origin.y;
  double width = self->_frameForExpandedDropTarget.size.width;
  double height = self->_frameForExpandedDropTarget.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setFrameForExpandedDropTarget:(CGRect)a3
{
  self->_frameForExpandedDropTarget = a3;
}

- (id)contentFrameDidChangeBlock
{
  return self->_contentFrameDidChangeBlock;
}

- (void)setContentFrameDidChangeBlock:(id)a3
{
}

- (BOOL)isInTransitionAnimation
{
  return self->_isInTransitionAnimation;
}

- (UISpringLoadedInteraction)springLoadedInteraction
{
  return self->_springLoadedInteraction;
}

- (UISpringLoadedInteractionEffect)blinkEffect
{
  return self->_blinkEffect;
}

- (_UIFloatingTabBarDragController)dragController
{
  return self->_dragController;
}

- (UIPointerInteraction)pointerInteraction
{
  return self->_pointerInteraction;
}

- (UIVisualEffectView)backgroundView
{
  return self->_backgroundView;
}

- (UIView)backgroundCaptureView
{
  return self->_backgroundCaptureView;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (_UIVisualEffectBackdropView)backdropCaptureView
{
  return self->_backdropCaptureView;
}

- (_UIFloatingTabBarSelectionContainerView)selectionContainerView
{
  return self->_selectionContainerView;
}

- (_UIContinuousSelectionGestureRecognizer)selectionGestureRecognizer
{
  return self->_selectionGestureRecognizer;
}

- (UIView)collectionViewContainer
{
  return self->_collectionViewContainer;
}

- (_UIEditMenuCollectionView)collectionView
{
  return self->_collectionView;
}

- (UICollectionViewDiffableDataSource)dataSource
{
  return self->_dataSource;
}

- (NSDiffableDataSourceSnapshot)lastSnapshot
{
  return self->_lastSnapshot;
}

- (_UIFloatingTabBarPinnedItemsView)pinnedItemsView
{
  return self->_pinnedItemsView;
}

- (_UIFloatingTabBarListItem)expandedGroupItem
{
  return self->_expandedGroupItem;
}

- (_UIFloatingTabBarListItem)outgoingExpandedGroupItem
{
  return self->_outgoingExpandedGroupItem;
}

- (_UIFloatingTabBarPageButton)leftArrowButton
{
  return self->_leftArrowButton;
}

- (_UIFloatingTabBarPageButton)rightArrowButton
{
  return self->_rightArrowButton;
}

- (UILongPressGestureRecognizer)editModeGestureRecognizer
{
  return self->_editModeGestureRecognizer;
}

- (_UIFloatingTabBarParser)parser
{
  return self->_parser;
}

- (_UIFloatingTabBarListItem)recentItem
{
  return self->_recentItem;
}

- (BOOL)isEditing
{
  return self->_editing;
}

- (NSIndexPath)highlightedIndexPath
{
  return self->_highlightedIndexPath;
}

- (NSIndexPath)selectionViewIndexPath
{
  return self->_selectionViewIndexPath;
}

- (BOOL)selectionViewFollowsHighlightedItem
{
  return self->_selectionViewFollowsHighlightedItem;
}

- (void)setSelectionViewFollowsHighlightedItem:(BOOL)a3
{
  self->_selectionViewFollowsHighlightedItem = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectionViewIndexPath, 0);
  objc_storeStrong((id *)&self->_highlightedIndexPath, 0);
  objc_storeStrong((id *)&self->_recentItem, 0);
  objc_storeStrong((id *)&self->_parser, 0);
  objc_storeStrong((id *)&self->_editModeGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_rightArrowButton, 0);
  objc_storeStrong((id *)&self->_leftArrowButton, 0);
  objc_storeStrong((id *)&self->_outgoingExpandedGroupItem, 0);
  objc_storeStrong((id *)&self->_expandedGroupItem, 0);
  objc_storeStrong((id *)&self->_pinnedItemsView, 0);
  objc_storeStrong((id *)&self->_lastSnapshot, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_collectionViewContainer, 0);
  objc_storeStrong((id *)&self->_selectionGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_selectionContainerView, 0);
  objc_storeStrong((id *)&self->_backdropCaptureView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_backgroundCaptureView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_pointerInteraction, 0);
  objc_storeStrong((id *)&self->_dragController, 0);
  objc_storeStrong((id *)&self->_blinkEffect, 0);
  objc_storeStrong((id *)&self->_springLoadedInteraction, 0);
  objc_storeStrong(&self->_contentFrameDidChangeBlock, 0);
  objc_storeStrong((id *)&self->_backdropGroupName, 0);
  objc_storeStrong((id *)&self->_sidebarButtonAction, 0);
  objc_storeStrong((id *)&self->_tabModel, 0);
  objc_storeStrong((id *)&self->_selectionFrameGroupCompletion, 0);
  objc_storeStrong((id *)&self->_sidebarButton, 0);
}

- (id)tabCustomizationProxy
{
  if ([(_UIFloatingTabBar *)self isEditing])
  {
    long long v3 = [_UIFloatingTabBarCustomizationProxy alloc];
    uint64_t v4 = self;
    if (v3)
    {
      v7.receiver = v3;
      v7.super_class = (Class)_UIFloatingTabBarCustomizationProxy;
      id v5 = [(UIView *)&v7 init];
      long long v3 = (_UIFloatingTabBarCustomizationProxy *)v5;
      if (v5) {
        objc_storeWeak((id *)v5 + 1, v4);
      }
    }
  }
  else
  {
    long long v3 = 0;
  }
  return v3;
}

@end