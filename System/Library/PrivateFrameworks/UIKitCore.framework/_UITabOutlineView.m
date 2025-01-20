@interface _UITabOutlineView
- (BOOL)_canDragTab:(id)a3;
- (BOOL)_canMoveTab:(id)a3 toDestinationIndexPath:(id)a4;
- (BOOL)_isHeaderIndexPath:(id)a3;
- (BOOL)_showSidebarBarButtonItem;
- (BOOL)collectionView:(id)a3 canFocusItemAtIndexPath:(id)a4;
- (BOOL)collectionView:(id)a3 canHandleDropSession:(id)a4;
- (BOOL)collectionView:(id)a3 canPerformPrimaryActionForItemAtIndexPath:(id)a4;
- (BOOL)collectionView:(id)a3 dragSessionAllowsMoveOperation:(id)a4;
- (BOOL)collectionView:(id)a3 shouldDeselectItemAtIndexPath:(id)a4;
- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4;
- (BOOL)collectionView:(id)a3 shouldSpringLoadItemAtIndexPath:(id)a4 withContext:(id)a5;
- (BOOL)didUpdateWillDisplayTab;
- (BOOL)isEditing;
- (NSMutableDictionary)contentByIdentifier;
- (NSMutableSet)collapsedSectionIdentifiers;
- (NSMutableSet)editingCollapsedSectionIdentifiers;
- (NSMutableSet)updatedTabsDuringApplySnapshot;
- (UIBarButtonItem)resetBarButtonItem;
- (UIBarButtonItem)sidebarBarButtonItem;
- (UICollectionView)collectionView;
- (UICollectionViewDiffableDataSource)dataSource;
- (UINavigationBar)navigationBar;
- (UINavigationItem)navigationItem;
- (UITab)willDisplayTab;
- (UIVisualEffectView)backgroundView;
- (_UIDuoShadowView)shadowView;
- (_UIGroupCompletion)dataSourceUpdateGroupCompletion;
- (_UITabSidebarBottomBarWrapperView)bottomBarView;
- (_UIVisualEffectBackdropView)backgroundCaptureView;
- (double)sidebarButtonOrigin;
- (id)_actionForIndexPath:(id)a3;
- (id)_bottomToolbar;
- (id)_currentSidebarImage;
- (id)_dataSourceUpdateGroupCompletionCreateIfNeeded:(BOOL)a3;
- (id)_defaultBarBackdropGroupName;
- (id)_existingSectionSnapshotForTabIdentifier:(id)a3;
- (id)_footerContentConfiguration;
- (id)_headerContentConfiguration;
- (id)_leadingSwipeActionsConfigurationForItemAtIndexPath:(id)a3;
- (id)_sidebarContentForIndexPath:(id)a3;
- (id)_tabBarController;
- (id)_tabForIndexPath:(id)a3;
- (id)_tabsByIdentifier;
- (id)_trailingSwipeActionsConfigurationForItemAtIndexPath:(id)a3;
- (id)activeTransaction;
- (id)collectionView:(id)a3 contextMenuConfigurationForItemsAtIndexPaths:(id)a4 point:(CGPoint)a5;
- (id)collectionView:(id)a3 dropSessionDidUpdate:(id)a4 withDestinationIndexPath:(id)a5;
- (id)collectionView:(id)a3 itemsForAddingToDragSession:(id)a4 atIndexPath:(id)a5 point:(CGPoint)a6;
- (id)collectionView:(id)a3 itemsForBeginningDragSession:(id)a4 atIndexPath:(id)a5;
- (id)collectionView:(id)a3 targetIndexPathForMoveOfItemFromOriginalIndexPath:(id)a4 atCurrentIndexPath:(id)a5 toProposedIndexPath:(id)a6;
- (id)contentView;
- (id)currentBackgroundEffect;
- (id)delegate;
- (id)indexPathForPreferredFocusedViewInCollectionView:(id)a3;
- (id)initWithSidebar:(id *)a1;
- (id)preferredFocusEnvironments;
- (id)resolvedPopoverPresentationControllerSourceItemForTab:(id)a3;
- (id)shadowProperties;
- (uint64_t)setAdditionalEditingInsets:(double)a3;
- (uint64_t)setEditing:(uint64_t)a3 animated:;
- (void)_activateNewSidebarTransaction;
- (void)_commitCurrentSidebarTransaction;
- (void)_configureShadowView;
- (void)_createViewHierarchy;
- (void)_performWithWillDisplayTab:(id)a3 block:(id)a4;
- (void)_performWithoutAffectingContent:(id)a3;
- (void)_performWithoutAffectingSelection:(id)a3;
- (void)_reconfigureItemsInDataSourceForTabs:(id)a3 animated:(BOOL)a4;
- (void)_reloadDataSourceSnapshotAnimated:(BOOL)a3;
- (void)_resetCustomization;
- (void)_tabModel:(id)a3 customizationStoreDidChange:(id)a4;
- (void)_tabModel:(id)a3 didChangeSelectedLeaf:(id)a4 previousElement:(id)a5;
- (void)_tabModel:(id)a3 didReplaceOldItem:(id)a4 newItem:(id)a5;
- (void)_tabModel:(id)a3 tabContentDidChange:(id)a4;
- (void)_tabModel:(id)a3 visibilityDidChangeForTab:(id)a4;
- (void)_tabModelDidReload:(id)a3;
- (void)_updateConfigurationForCell:(id)a3 inState:(id)a4 content:(id)a5 indexPath:(id)a6;
- (void)_updateEditBarButtonItem;
- (void)_updateEditingInsets;
- (void)_updateScrollEdgeAppearance;
- (void)_updateSelectedItemAnimated:(BOOL)a3;
- (void)_updateSnapshot:(id)a3 usingNode:(id)a4;
- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5;
- (void)collectionView:(id)a3 dragSessionDidEnd:(id)a4;
- (void)collectionView:(id)a3 dragSessionWillBegin:(id)a4;
- (void)collectionView:(id)a3 dropSessionDidEnd:(id)a4;
- (void)collectionView:(id)a3 dropSessionDidEnter:(id)a4;
- (void)collectionView:(id)a3 performDropWithCoordinator:(id)a4;
- (void)collectionView:(id)a3 performPrimaryActionForItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionView:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5;
- (void)didMoveToSuperview;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)footerContentConfigurationDidChange:(id *)a1;
- (void)hasActiveDrag;
- (void)headerContentConfigurationDidChange:(id *)a1;
- (void)layoutSubviews;
- (void)prepareForTransitionToVisibility:(unsigned char *)a1;
- (void)reconfigureItemForTab:(void *)a1;
- (void)safeAreaInsetsDidChange;
- (void)scrollToTarget:(uint64_t)a3 animated:;
- (void)setBottomBarView:(id)a3;
- (void)setDisplayedGroup:(uint64_t)a1;
- (void)setOverrideBackgroundEffect:(id *)a1;
- (void)setSidebarButtonAction:(id *)a1;
- (void)setTitle:(id *)a1;
- (void)setTransitionsToTabBar:(uint64_t)a1;
- (void)tabModelEditingStateDidChange;
- (void)updateBottomBarView;
- (void)willMoveToSuperview:(id)a3;
@end

@implementation _UITabOutlineView

- (id)initWithSidebar:(id *)a1
{
  v19[1] = *MEMORY[0x1E4F143B8];
  v3 = a2;
  if (!a1) {
    goto LABEL_11;
  }
  v17.receiver = a1;
  v17.super_class = (Class)_UITabOutlineView;
  a1 = (id *)objc_msgSendSuper2(&v17, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  if (!a1) {
    goto LABEL_11;
  }
  if (!v3)
  {
    v5 = 0;
    goto LABEL_13;
  }
  id v4 = v3[5];
  v5 = v4;
  if (!v4)
  {
LABEL_13:
    v6 = 0;
    goto LABEL_6;
  }
  v6 = (void *)*((void *)v4 + 145);
LABEL_6:
  id v7 = v6;

  objc_storeStrong(a1 + 56, v6);
  a1[58] = v3;
  *((unsigned char *)a1 + 432) = 1;
  *((unsigned char *)a1 + 433) = 1;
  v8 = -[UIView _internalTraitOverrides](a1);
  [v8 _setNSIntegerValue:1 forTraitToken:0x1ED3F5C28];

  v9 = -[UIView _internalTraitOverrides](a1);
  [v9 _setNSIntegerValue:2 forTraitToken:0x1ED3F5BF8];

  [a1 _createViewHierarchy];
  v19[0] = 0x1ED3F5A78;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
  id v11 = (id)[a1 _registerForTraitTokenChanges:v10 withTarget:a1 action:sel__displayScaleTraitChanged];

  uint64_t v18 = 0x1ED3F5A48;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v18 count:1];
  id v13 = (id)[a1 _registerForTraitTokenChanges:v12 withTarget:a1 action:sel__userInterfaceStyleTraitChanged];

  [v7 addObserver:a1];
  v14 = [v7 tabItems];
  uint64_t v15 = [v14 count];

  if (v15)
  {
    [a1 _reloadDataSourceSnapshotAnimated:0];
    [a1 _updateSelectedItemAnimated:0];
  }
  if ([v7 isEditing]) {
    -[_UITabOutlineView setEditing:animated:]((uint64_t)a1, 1, 0);
  }

LABEL_11:
  return a1;
}

- (uint64_t)setEditing:(uint64_t)a3 animated:
{
  if (result)
  {
    id v4 = (unsigned char *)result;
    if (*(unsigned __int8 *)(result + 435) != a2)
    {
      *(unsigned char *)(result + 435) = a2;
      if (a2)
      {
        id v6 = *(id *)(result + 448);
        id v7 = [v6 tabItems];
        v4[416] = _UITabItemsHasAnyCustomizablePlacement(v7);
      }
      [v4 _updateEditBarButtonItem];
      [v4 _reloadDataSourceSnapshotAnimated:a3];
      v8 = [v4 collectionView];
      [v8 setSelectionFollowsFocus:a2 ^ 1];

      if (a3)
      {
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        v12[2] = __41___UITabOutlineView_setEditing_animated___block_invoke;
        v12[3] = &unk_1E52D9FC0;
        v12[4] = v4;
        char v13 = a2;
        +[UIView animateWithDuration:v12 animations:0.3];
      }
      else
      {
        v10[0] = MEMORY[0x1E4F143A8];
        v10[1] = 3221225472;
        v10[2] = __41___UITabOutlineView_setEditing_animated___block_invoke_2;
        v10[3] = &unk_1E52D9FC0;
        v10[4] = v4;
        char v11 = a2;
        +[UIView performWithoutAnimation:v10];
      }
      v9 = [v4 bottomBarView];
      [v9 setHidden:a2];

      [v4 _updateSelectedItemAnimated:a3];
      return [v4 _updateEditingInsets];
    }
  }
  return result;
}

- (void)prepareForTransitionToVisibility:(unsigned char *)a1
{
  if (a1)
  {
    a1[411] = 1;
    if (a2)
    {
      if (a1[413] && ([a1 isEditing] & 1) == 0)
      {
        v3 = [a1 collectionView];
        id v4 = [v3 indexPathsForSelectedItems];
        v5 = [v4 firstObject];

        if (v5)
        {
          id v6 = [a1 collectionView];
          [v6 scrollToItemAtIndexPath:v5 atScrollPosition:0 animated:0];
        }
      }
      a1[413] = 0;
    }
  }
}

- (id)contentView
{
  if (a1)
  {
    a1 = [a1[66] contentView];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (double)sidebarButtonOrigin
{
  if (!a1) {
    return 0.0;
  }
  v2 = [a1 navigationItem];
  v3 = [v2 leftBarButtonItem];
  [v3 frameInView:a1];
  double v5 = v4;

  return v5;
}

- (id)currentBackgroundEffect
{
  if (a1)
  {
    uint64_t v1 = [a1 backgroundView];
    v2 = [v1 effect];
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (void)setOverrideBackgroundEffect:(id *)a1
{
  id v4 = a2;
  if (a1 && a1[61] != v4)
  {
    id v9 = v4;
    objc_storeStrong(a1 + 61, a2);
    id v5 = v9;
    if (!v5)
    {
      id v6 = [a1 traitCollection];
      id v7 = _UIFloatingTabBarGetPlatformMetrics([v6 userInterfaceIdiom]);

      id v5 = [v7 sidebarBackgroundEffect];
    }
    v8 = [a1 backgroundView];
    [v8 setEffect:v5];

    id v4 = v9;
  }
}

- (id)_tabBarController
{
  if (self) {
    self = (_UITabOutlineView *)self->_tabModel;
  }
  return (id)[(_UITabOutlineView *)self tabBarController];
}

- (id)shadowProperties
{
  if (a1)
  {
    uint64_t v1 = [a1 shadowView];
    v2 = (void *)v1;
    if (v1) {
      v3 = *(void **)(v1 + 416);
    }
    else {
      v3 = 0;
    }
    id v4 = v3;
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (void)_createViewHierarchy
{
  v83[1] = *MEMORY[0x1E4F143B8];
  +[_UIFloatingTabBar registerPlatformMetrics];
  id v4 = [(UIView *)self traitCollection];
  v55 = _UIFloatingTabBarGetPlatformMetrics([v4 userInterfaceIdiom]);

  char v5 = [v55 sidebarPrefersMacAppearance];
  id v6 = objc_alloc_init(_UIVisualEffectBackdropView);
  [(_UIVisualEffectBackdropView *)v6 setRenderMode:1];
  [(UIView *)self addSubview:v6];
  v54 = v6;
  objc_storeStrong((id *)&self->_backgroundCaptureView, v6);
  if ((v5 & 1) == 0)
  {
    id v7 = objc_alloc_init(_UIDuoShadowView);
    shadowView = self->_shadowView;
    self->_shadowView = v7;
    id v9 = v7;

    [(_UITabOutlineView *)self _configureShadowView];
    [(UIView *)self addSubview:v9];
  }
  v10 = [UIVisualEffectView alloc];
  char v11 = [v55 sidebarBackgroundEffect];
  v12 = [(UIVisualEffectView *)v10 initWithEffect:v11];

  v56 = v12;
  char v13 = [(UIVisualEffectView *)v12 contentView];
  [v13 setClipsToBounds:1];

  [(UIVisualEffectView *)v12 _setCaptureView:v54];
  [(UIView *)self addSubview:v12];
  objc_storeStrong((id *)&self->_backgroundView, v12);
  if (v5)
  {
    obj = 0;
  }
  else
  {
    v14 = [[UINavigationItem alloc] initWithTitle:&stru_1ED0E84C0];
    [(UINavigationItem *)v14 _setManualScrollEdgeAppearanceEnabled:1];
    navigationItem = self->_navigationItem;
    self->_navigationItem = v14;
    v16 = v14;

    objc_super v17 = [UINavigationBar alloc];
    obj = -[UINavigationBar initWithFrame:](v17, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    uint64_t v18 = [(_UITabOutlineView *)self _defaultBarBackdropGroupName];
    [(UINavigationBar *)obj _setBackdropViewLayerGroupName:v18];

    [(UINavigationBar *)obj _setBarPosition:3];
    [(UINavigationBar *)obj _setWantsHostedTabBarMetrics:self->_wantsHostedTabBarMetricsForNavigationBar];
    v83[0] = v16;
    v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v83 count:1];
    [(UINavigationBar *)obj setItems:v19];

    v20 = [(UIVisualEffectView *)v12 contentView];
    [v20 addSubview:obj];

    objc_storeStrong((id *)&self->_navigationBar, obj);
  }
  objc_initWeak(&location, self);
  v21 = [UICollectionViewCompositionalLayout alloc];
  v80[0] = MEMORY[0x1E4F143A8];
  v80[1] = 3221225472;
  v80[2] = __41___UITabOutlineView__createViewHierarchy__block_invoke;
  v80[3] = &unk_1E5300C98;
  objc_copyWeak(&v81, &location);
  v53 = [(UICollectionViewCompositionalLayout *)v21 initWithSectionProvider:v80];
  v22 = [UICollectionView alloc];
  [(UIView *)self bounds];
  v23 = -[UICollectionView initWithFrame:collectionViewLayout:](v22, "initWithFrame:collectionViewLayout:", v53);
  [(UICollectionView *)v23 setAllowsFocus:1];
  [(UICollectionView *)v23 setSelectionFollowsFocus:1];
  [(UICollectionView *)v23 setSpringLoaded:1];
  [(UICollectionView *)v23 setDragDelegate:self];
  [(UICollectionView *)v23 setDropDelegate:self];
  if (v23)
  {
    dragAndDropController = v23->_dragAndDropController;
    if (dragAndDropController) {
      dragAndDropController->_flockSelectedItemsOnDrag = 0;
    }
  }
  [(UICollectionView *)v23 _setAllowsBandSelectionForMultipleSelection:0];
  [(UICollectionView *)v23 _setPreferredDragDestinationVisualStyle:1];
  -[UICollectionView setContentInset:](v23, "setContentInset:", 9.0, 0.0, 9.0, 0.0);
  [(UICollectionView *)v23 setDelegate:self];
  [(UICollectionView *)v23 setAllowsMultipleSelectionDuringEditing:1];
  [(UIScrollView *)v23 _addScrollViewScrollObserver:self];
  v25 = [(UIVisualEffectView *)v12 contentView];
  if (obj) {
    [v25 insertSubview:v23 belowSubview:self->_navigationBar];
  }
  else {
    [v25 addSubview:v23];
  }

  objc_storeStrong((id *)&self->_collectionView, v23);
  uint64_t v26 = objc_opt_class();
  v78[0] = MEMORY[0x1E4F143A8];
  v78[1] = 3221225472;
  v78[2] = __41___UITabOutlineView__createViewHierarchy__block_invoke_4;
  v78[3] = &unk_1E5310B58;
  objc_copyWeak(&v79, &location);
  v27 = +[UICollectionViewCellRegistration registrationWithCellClass:v26 configurationHandler:v78];
  v28 = [UICollectionViewDiffableDataSource alloc];
  v75[0] = MEMORY[0x1E4F143A8];
  v75[1] = 3221225472;
  v75[2] = __41___UITabOutlineView__createViewHierarchy__block_invoke_6;
  v75[3] = &unk_1E5310B80;
  objc_copyWeak(&v77, &location);
  id v52 = v27;
  id v76 = v52;
  v29 = [(UICollectionViewDiffableDataSource *)v28 initWithCollectionView:v23 cellProvider:v75];
  dataSource = self->_dataSource;
  self->_dataSource = v29;

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __41___UITabOutlineView__createViewHierarchy__block_invoke_7;
  aBlock[3] = &unk_1E5310BA8;
  objc_copyWeak(&v74, &location);
  v57 = _Block_copy(aBlock);
  v31 = +[UICollectionViewSupplementaryRegistration registrationWithSupplementaryClass:objc_opt_class() elementKind:@"UICollectionElementKindSectionHeader" configurationHandler:v57];
  v32 = +[UICollectionViewSupplementaryRegistration registrationWithSupplementaryClass:objc_opt_class() elementKind:@"UICollectionElementKindSectionFooter" configurationHandler:v57];
  v33 = +[UICollectionViewSupplementaryRegistration registrationWithSupplementaryClass:objc_opt_class() elementKind:@"UITabOutlineView.EditHeader" configurationHandler:v57];
  v69[0] = MEMORY[0x1E4F143A8];
  v69[1] = 3221225472;
  v69[2] = __41___UITabOutlineView__createViewHierarchy__block_invoke_8;
  v69[3] = &unk_1E5300D98;
  id v49 = v31;
  id v70 = v49;
  id v50 = v32;
  id v71 = v50;
  id v51 = v33;
  id v72 = v51;
  [(UICollectionViewDiffableDataSource *)self->_dataSource setSupplementaryViewProvider:v69];
  v67[0] = MEMORY[0x1E4F143A8];
  v67[1] = 3221225472;
  v67[2] = __41___UITabOutlineView__createViewHierarchy__block_invoke_9;
  v67[3] = &unk_1E5300DC0;
  objc_copyWeak(&v68, &location);
  v34 = [(UICollectionViewDiffableDataSource *)self->_dataSource reorderingHandlers];
  [v34 setCanReorderItemHandler:v67];

  v65[0] = MEMORY[0x1E4F143A8];
  v65[1] = 3221225472;
  v65[2] = __41___UITabOutlineView__createViewHierarchy__block_invoke_10;
  v65[3] = &unk_1E5310BD0;
  objc_copyWeak(v66, &location);
  v66[1] = (id)a2;
  v35 = [(UICollectionViewDiffableDataSource *)self->_dataSource reorderingHandlers];
  [v35 setWillReorderHandler:v65];

  v63[0] = MEMORY[0x1E4F143A8];
  v63[1] = 3221225472;
  v63[2] = __41___UITabOutlineView__createViewHierarchy__block_invoke_11;
  v63[3] = &unk_1E5310BD0;
  objc_copyWeak(v64, &location);
  v64[1] = (id)a2;
  v36 = [(UICollectionViewDiffableDataSource *)self->_dataSource reorderingHandlers];
  [v36 setDidReorderHandler:v63];

  v37 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
  collapsedSectionIdentifiers = self->_collapsedSectionIdentifiers;
  self->_collapsedSectionIdentifiers = v37;

  v39 = self->_tabModel;
  v40 = [(_UITabModel *)v39 customizationStore];
  v41 = [v40 collapsedSectionIdentifiers];

  if ([v41 count]) {
    [(NSMutableSet *)self->_collapsedSectionIdentifiers unionSet:v41];
  }
  v61[0] = MEMORY[0x1E4F143A8];
  v61[1] = 3221225472;
  v61[2] = __41___UITabOutlineView__createViewHierarchy__block_invoke_12;
  v61[3] = &unk_1E5310BF8;
  objc_copyWeak(&v62, &location);
  v42 = [(UICollectionViewDiffableDataSource *)self->_dataSource sectionSnapshotHandlers];
  [v42 setWillExpandItemHandler:v61];

  v59[0] = MEMORY[0x1E4F143A8];
  v59[1] = 3221225472;
  v59[2] = __41___UITabOutlineView__createViewHierarchy__block_invoke_14;
  v59[3] = &unk_1E5310C20;
  objc_copyWeak(&v60, &location);
  v59[4] = self;
  v43 = [(UICollectionViewDiffableDataSource *)self->_dataSource sectionSnapshotHandlers];
  [v43 setWillCollapseItemHandler:v59];

  v44 = [(_UITabOutlineView *)self _currentSidebarImage];
  v45 = [[UIBarButtonItem alloc] initWithImage:v44 style:0 target:0 action:0];
  [(UIBarButtonItem *)v45 setSpringLoaded:1];
  objc_storeStrong((id *)&self->_sidebarBarButtonItem, v45);
  v46 = _UINSLocalizedStringWithDefaultValue(@"Reset", @"Reset");
  v47 = [[UIBarButtonItem alloc] initWithTitle:v46 style:0 target:self action:sel__resetCustomization];
  objc_storeStrong((id *)&self->_resetBarButtonItem, v47);
  v48 = [(_UITabOutlineView *)self navigationItem];
  [v48 setLeftBarButtonItem:v45];

  [(_UITabOutlineView *)self _updateEditBarButtonItem];
  objc_destroyWeak(&v60);
  objc_destroyWeak(&v62);

  objc_destroyWeak(v64);
  objc_destroyWeak(v66);
  objc_destroyWeak(&v68);

  objc_destroyWeak(&v74);
  objc_destroyWeak(&v77);

  objc_destroyWeak(&v79);
  objc_destroyWeak(&v81);
  objc_destroyWeak(&location);
}

- (void)_configureShadowView
{
  if (self->_shadowView)
  {
    id v8 = [(UIView *)self traitCollection];
    [v8 displayScale];
    double v4 = v3;
    char v5 = objc_opt_new();
    [v5 setRadius:0.0];
    double v6 = 1.0;
    objc_msgSend(v5, "setOffset:", 1.0 / v4, 0.0);
    if ([v8 userInterfaceStyle] == 2)
    {
      id v7 = +[UIColor opaqueSeparatorColor];
      [v5 setColor:v7];
    }
    else
    {
      double v6 = 0.16;
    }
    [v5 setOpacity:v6];
    -[_UIDuoShadowView setPrimaryShadow:]((uint64_t)self->_shadowView, v5);
  }
}

- (void)_resetCustomization
{
  double v3 = [(_UITabOutlineView *)self activeTransaction];
  if (self)
  {
    double v4 = [(_UITabModel *)self->_tabModel tabItems];
    [v3 resetCustomizationForTabs:v4];

    tabModel = self->_tabModel;
  }
  else
  {
    id v7 = [0 tabItems];
    [v3 resetCustomizationForTabs:v7];

    tabModel = 0;
  }
  double v6 = [(_UITabModel *)tabModel customizationStore];
  [v6 reset];

  [(_UITabOutlineView *)self _reloadDataSourceSnapshotAnimated:1];
  [(_UITabOutlineView *)self _updateSelectedItemAnimated:1];
}

- (void)_updateConfigurationForCell:(id)a3 inState:(id)a4 content:(id)a5 indexPath:(id)a6
{
  v30 = (id *)a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = v30;
  if (v30)
  {
    if (v11) {
      goto LABEL_3;
    }
LABEL_24:
    v29 = [MEMORY[0x1E4F28B00] currentHandler];
    [v29 handleFailureInMethod:a2, self, @"_UITabOutlineView.m", 596, @"Invalid parameter not satisfying: %@", @"state != nil" object file lineNumber description];

    v14 = v30;
    if (v30) {
      goto LABEL_4;
    }
LABEL_25:
    id v15 = 0;
    goto LABEL_6;
  }
  v28 = [MEMORY[0x1E4F28B00] currentHandler];
  [v28 handleFailureInMethod:a2, self, @"_UITabOutlineView.m", 595, @"Invalid parameter not satisfying: %@", @"cell != nil" object file lineNumber description];

  v14 = 0;
  if (!v11) {
    goto LABEL_24;
  }
LABEL_3:
  if (!v14) {
    goto LABEL_25;
  }
LABEL_4:
  id v15 = v14[109];
  if (!v15 || (*((unsigned char *)v30 + 868) & 1) == 0)
  {
LABEL_6:
    BOOL v16 = [(_UITabOutlineView *)self _isHeaderIndexPath:v13];
    objc_super v17 = [v12 tab];

    if (v17)
    {
      uint64_t v18 = [UITabSidebarItemRequest alloc];
      v19 = [v12 tab];
      uint64_t v20 = [(UITabSidebarItemRequest *)v18 _initWithTab:v19 cell:v30 isHeader:v16];
    }
    else
    {
      v23 = [v12 action];

      if (!v23)
      {
LABEL_19:
        -[_UITabSidebarCell setSidebarItem:]((uint64_t)v30, 0);
        goto LABEL_20;
      }
      v24 = [UITabSidebarItemRequest alloc];
      v19 = [v12 action];
      uint64_t v20 = [(UITabSidebarItemRequest *)v24 _initWithAction:v19 cell:v30];
    }
    v25 = (void *)v20;

    if (v25)
    {
      if (self) {
        sidebar = self->_sidebar;
      }
      else {
        sidebar = 0;
      }
      v27 = -[UITabBarControllerSidebar _sidebarItemForRequest:]((uint64_t)sidebar, v25);
      -[_UITabSidebarCell setSidebarItem:]((uint64_t)v30, v27);

      goto LABEL_20;
    }
    goto LABEL_19;
  }
  -[_UITabSidebarCell pushCurrentStateIntoSidebarItem](v30);
  if (self) {
    v21 = self->_sidebar;
  }
  else {
    v21 = 0;
  }
  -[UITabBarControllerSidebar _updatedSidebarItem:](v21, v15);
  id v22 = (id)objc_claimAutoreleasedReturnValue();
  if (v22 != v15) {
    -[_UITabSidebarCell setSidebarItem:]((uint64_t)v30, v22);
  }

LABEL_20:
}

- (id)_leadingSwipeActionsConfigurationForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  char v5 = [(_UITabOutlineView *)self _tabForIndexPath:v4];
  if (v5 && ![(_UITabOutlineView *)self _isHeaderIndexPath:v4])
  {
    if (self) {
      sidebar = self->_sidebar;
    }
    else {
      sidebar = 0;
    }
    double v6 = -[UITabBarControllerSidebar _leadingSwipeActionsConfigurationForTab:]((uint64_t)sidebar, v5);
  }
  else
  {
    double v6 = 0;
  }

  return v6;
}

- (id)_trailingSwipeActionsConfigurationForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  char v5 = [(_UITabOutlineView *)self _tabForIndexPath:v4];
  if (v5 && ![(_UITabOutlineView *)self _isHeaderIndexPath:v4])
  {
    if (self) {
      sidebar = self->_sidebar;
    }
    else {
      sidebar = 0;
    }
    double v6 = -[UITabBarControllerSidebar _trailingSwipeActionsConfigurationForTab:]((uint64_t)sidebar, v5);
  }
  else
  {
    double v6 = 0;
  }

  return v6;
}

- (void)willMoveToSuperview:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_UITabOutlineView;
  [(UIView *)&v5 didMoveToSuperview];
  if (a3) {
    [(_UITabOutlineView *)self _updateSelectedItemAnimated:0];
  }
}

- (void)didMoveToSuperview
{
  v3.receiver = self;
  v3.super_class = (Class)_UITabOutlineView;
  [(UIView *)&v3 didMoveToSuperview];
  [(_UITabOutlineView *)self _updateEditingInsets];
}

- (void)layoutSubviews
{
  v43.receiver = self;
  v43.super_class = (Class)_UITabOutlineView;
  [(UIView *)&v43 layoutSubviews];
  [(UIView *)self _shouldReverseLayoutDirection];
  [(UIView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  id v11 = [(_UITabOutlineView *)self shadowView];
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  id v12 = [(_UITabOutlineView *)self backgroundView];
  objc_msgSend(v12, "setFrame:", v4, v6, v8, v10);

  id v13 = [(_UITabOutlineView *)self backgroundCaptureView];
  objc_msgSend(v13, "setFrame:", v4, v6, v8, v10);

  v14 = [(_UITabOutlineView *)self navigationBar];
  objc_msgSend(v14, "sizeThatFits:", v8, v10);
  double v16 = v15;
  double v18 = v17;

  [(UIView *)self safeAreaInsets];
  double v20 = v19;
  v21 = [(_UITabOutlineView *)self navigationBar];
  objc_msgSend(v21, "setFrame:", 0.0, v20, v16, v18);

  if (self->_isNavigationBarSafeAreaDirty)
  {
    id v22 = [(_UITabOutlineView *)self navigationBar];
    [v22 safeAreaInsetsDidChange];

    self->_isNavigationBarSafeAreaDirty = 0;
  }
  v23 = [(_UITabOutlineView *)self navigationBar];

  if (!v23)
  {
    [(UIView *)self safeAreaInsets];
    double v18 = v24;
  }
  v25 = [(_UITabOutlineView *)self bottomBarView];
  v28 = v25;
  double v29 = 0.0;
  if (v25)
  {
    LODWORD(v26) = 1148846080;
    LODWORD(v27) = 1112014848;
    objc_msgSend(v25, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", v8, 44.0, v26, v27);
    double v31 = v30;
    double v32 = v10 - v30;
    v33 = [(_UITabOutlineView *)self _bottomToolbar];
    v34 = [v33 items];
    uint64_t v35 = [v34 count];

    if (v35)
    {
      [v28 setLayoutWithinSafeArea:1];
      [(UIView *)self safeAreaInsets];
      double v32 = v32 - v36;
      [(UIView *)self safeAreaInsets];
      double v38 = v31 + v37;
    }
    else
    {
      [v28 setLayoutWithinSafeArea:0];
      double v38 = v31;
    }
    objc_msgSend(v28, "setFrame:", 0.0, v32, v8, v38);
    double v29 = v31 + 0.0;
  }
  double v39 = v18 + 0.0;
  v40 = [(_UITabOutlineView *)self collectionView];
  objc_msgSend(v40, "setContentInset:", v39, 0.0, v29, 0.0);

  v41 = [(_UITabOutlineView *)self collectionView];
  objc_msgSend(v41, "setVerticalScrollIndicatorInsets:", v39, 0.0, v29, 0.0);

  v42 = [(_UITabOutlineView *)self collectionView];
  objc_msgSend(v42, "setFrame:", v4, v6, v8, v10);

  [(_UITabOutlineView *)self _updateScrollEdgeAppearance];
}

- (void)safeAreaInsetsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)_UITabOutlineView;
  [(UIView *)&v3 safeAreaInsetsDidChange];
  self->_isNavigationBarSafeAreaDirty = 1;
}

- (void)setDisplayedGroup:(uint64_t)a1
{
  id v4 = a2;
  if (a1 && *(id *)(a1 + 456) != v4)
  {
    id v8 = v4;
    if (v4)
    {
      double v5 = [v4 _tabModel];
      double v6 = *(void **)(a1 + 448);

      if (v5 != v6)
      {
        double v7 = [MEMORY[0x1E4F28B00] currentHandler];
        [v7 handleFailureInMethod:sel_setDisplayedGroup_ object:a1 file:@"_UITabOutlineView.m" lineNumber:728 description:@"Trying to display a group that is not part of the tab model."];
      }
    }
    objc_storeStrong((id *)(a1 + 456), a2);
    [(id)a1 _reloadDataSourceSnapshotAnimated:0];
    [(id)a1 _updateSelectedItemAnimated:0];
    id v4 = v8;
  }
}

- (void)setSidebarButtonAction:(id *)a1
{
  id v3 = a2;
  if (a1)
  {
    id v7 = v3;
    id v4 = (void *)[v3 copy];

    objc_storeStrong(a1 + 60, v4);
    double v5 = +[UIImage _systemImageNamed:@"rectangle.line.horizontal.inset.top"];
    [v4 setImage:v5];

    double v6 = [a1 sidebarBarButtonItem];
    [v6 setPrimaryAction:v4];
    objc_msgSend(v6, "setHidden:", objc_msgSend(a1, "_showSidebarBarButtonItem") ^ 1);
    [a1 setNeedsLayout];

    id v3 = v4;
  }
}

- (void)setTitle:(id *)a1
{
  id v9 = a2;
  if (a1)
  {
    id v4 = a1[59];
    id v5 = v9;
    double v6 = v5;
    if (v4 == v5)
    {
    }
    else
    {
      if (v5 && v4)
      {
        char v7 = [v4 isEqual:v5];

        if (v7) {
          goto LABEL_11;
        }
      }
      else
      {
      }
      objc_storeStrong(a1 + 59, a2);
      id v8 = [a1 navigationItem];
      [v8 setTitle:v6];
      double v6 = v8;
    }
  }
LABEL_11:
}

- (void)setTransitionsToTabBar:(uint64_t)a1
{
  if (a1 && *(unsigned __int8 *)(a1 + 432) != a2)
  {
    *(unsigned char *)(a1 + 432) = a2;
    id v3 = [(id)a1 _currentSidebarImage];
    [*(id *)(a1 + 608) setImage:v3];
  }
}

- (id)_defaultBarBackdropGroupName
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"<TabSidebar.NavigationBar %p>", self);
}

- (id)_currentSidebarImage
{
  if (self && self->_transitionsToTabBar)
  {
    v2 = +[UIImage _systemImageNamed:@"rectangle.line.horizontal.inset.top"];
  }
  else
  {
    v2 = +[UIImage systemImageNamed:@"sidebar.leading"];
  }
  return v2;
}

- (void)_updateSelectedItemAnimated:(BOOL)a3
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  if (!self->_ignoringSelectionUpdates)
  {
    BOOL v3 = a3;
    if ([(_UITabModel *)self->_tabModel isEditing])
    {
      BOOL v49 = v3;
      id v5 = [(_UITabOutlineView *)self dataSource];
      uint64_t v6 = [v5 snapshot];

      v47 = (void *)v6;
      char v7 = (void *)v6;
      id v8 = &OBJC_IVAR___UIScrollView__asyncScrollDecelerationState;
      id v9 = [v7 itemIdentifiers];
      double v10 = [(_UITabOutlineView *)self collectionView];
      v48 = [v10 indexPathsForSelectedItems];

      long long v52 = 0u;
      long long v53 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      id v11 = v9;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v50 objects:v58 count:16];
      if (!v12) {
        goto LABEL_18;
      }
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v51;
      while (1)
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v51 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void *)(*((void *)&v50 + 1) + 8 * v15);
          double v17 = [(_UITabOutlineView *)self contentByIdentifier];
          double v18 = [v17 objectForKey:v16];
          double v19 = [v18 tab];

          char v20 = [*(id *)((char *)&self->super.super.super.isa + v8[393]) isTabHidden:v19];
          if (v19)
          {
            char v21 = v20;
            id v22 = [(_UITabOutlineView *)self dataSource];
            v23 = [v22 indexPathForItemIdentifier:v16];

            double v24 = [(_UITabOutlineView *)self collectionView];
            BOOL v25 = [(_UITabOutlineView *)self collectionView:v24 shouldSelectItemAtIndexPath:v23];

            int v26 = [v19 _hasCustomizablePlacement];
            if ((v21 & 1) == 0 && v25 | v26)
            {
              double v27 = [(_UITabOutlineView *)self collectionView];
              [v27 selectItemAtIndexPath:v23 animated:v49 scrollPosition:0];
              id v8 = &OBJC_IVAR___UIScrollView__asyncScrollDecelerationState;
              goto LABEL_14;
            }
            id v8 = &OBJC_IVAR___UIScrollView__asyncScrollDecelerationState;
            if ([v48 containsObject:v23])
            {
              double v27 = [(_UITabOutlineView *)self collectionView];
              [v27 deselectItemAtIndexPath:v23 animated:v49];
LABEL_14:
            }
          }

          ++v15;
        }
        while (v13 != v15);
        uint64_t v13 = [v11 countByEnumeratingWithState:&v50 objects:v58 count:16];
        if (!v13)
        {
LABEL_18:

          v28 = v47;
          goto LABEL_37;
        }
      }
    }
    v28 = [(_UITabModel *)self->_tabModel selectedLeaf];
    double v29 = [(_UITabOutlineView *)self dataSource];
    double v30 = [v28 identifier];
    id v11 = [v29 indexPathForItemIdentifier:v30];

    BOOL v31 = v11 == 0;
    if (v28) {
      BOOL v32 = v11 == 0;
    }
    else {
      BOOL v32 = 0;
    }
    if (v32)
    {
      do
      {
        v33 = v28;
        v28 = [v28 _parentGroup];

        v34 = [(_UITabOutlineView *)self dataSource];
        uint64_t v35 = [v28 identifier];
        id v11 = [v34 indexPathForItemIdentifier:v35];

        BOOL v31 = v11 == 0;
      }
      while (v28 && !v11);
    }
    double v36 = [(_UITabOutlineView *)self collectionView];
    id v37 = v36;
    if (v31)
    {
      double v38 = [v36 indexPathsForSelectedItems];

      long long v56 = 0u;
      long long v57 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      id v37 = v38;
      uint64_t v39 = [v37 countByEnumeratingWithState:&v54 objects:v59 count:16];
      if (v39)
      {
        uint64_t v40 = v39;
        uint64_t v41 = *(void *)v55;
        do
        {
          uint64_t v42 = 0;
          do
          {
            BOOL v43 = v3;
            if (*(void *)v55 != v41) {
              objc_enumerationMutation(v37);
            }
            uint64_t v44 = *(void *)(*((void *)&v54 + 1) + 8 * v42);
            v45 = [(_UITabOutlineView *)self collectionView];
            uint64_t v46 = v44;
            BOOL v3 = v43;
            [v45 deselectItemAtIndexPath:v46 animated:v43];

            ++v42;
          }
          while (v40 != v42);
          uint64_t v40 = [v37 countByEnumeratingWithState:&v54 objects:v59 count:16];
        }
        while (v40);
      }
    }
    else
    {
      [v36 selectItemAtIndexPath:v11 animated:v3 scrollPosition:0];
    }

LABEL_37:
  }
}

- (void)_updateSnapshot:(id)a3 usingNode:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 identifier];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  v23 = v7;
  id v9 = [v7 children];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v24 objects:v30 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v25 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        uint64_t v15 = [v14 identifier];
        double v29 = v15;
        uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v29 count:1];
        [v6 appendItems:v16 intoParentItem:v8];

        [(_UITabOutlineView *)self _updateSnapshot:v6 usingNode:v14];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v24 objects:v30 count:16];
    }
    while (v11);
  }

  double v17 = [v23 actions];

  if (v17)
  {
    double v18 = [v23 actions];
    [v6 appendItems:v18 intoParentItem:v8];
  }
  double v19 = [(_UITabOutlineView *)self _existingSectionSnapshotForTabIdentifier:v8];
  if ([(_UITabOutlineView *)self isEditing]) {
    [(_UITabOutlineView *)self editingCollapsedSectionIdentifiers];
  }
  else {
  char v20 = [(_UITabOutlineView *)self collapsedSectionIdentifiers];
  }
  char v21 = [v20 containsObject:v8];

  if ((v21 & 1) == 0)
  {
    v28 = v8;
    id v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v28 count:1];
    [v6 expandItems:v22];
  }
}

- (void)_reloadDataSourceSnapshotAnimated:(BOOL)a3
{
  uint64_t v145 = *MEMORY[0x1E4F143B8];
  if (self->_ignoringContentUpdates) {
    return;
  }
  BOOL v3 = self;
  BOOL v105 = a3;
  uint64_t v4 = objc_msgSend(NSString, "stringWithFormat:", @"Root-%p", self);
  id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v4, 0);
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v7 = objc_alloc_init(NSDiffableDataSourceSectionSnapshot);
  v110 = v6;
  v103 = (void *)v4;
  [v6 setObject:v7 forKeyedSubscript:v4];
  uint64_t v8 = [(_UITabModel *)v3->_tabModel isEditing];
  id v9 = [(_UITabModel *)v3->_tabModel tabItems];
  uint64_t v10 = v3->_displayedGroup;
  uint64_t v11 = [(_UITabGroup *)v10 _tabModel];
  tabModel = v3->_tabModel;

  v100 = v10;
  if (v11 == tabModel)
  {
    uint64_t v13 = [(_UITabOutlineView *)v3 activeTransaction];
    uint64_t v14 = [(_UITabGroup *)v10 identifier];
    uint64_t v15 = [v13 currentDisplayOrderForGroupWithIdentifier:v14];

    uint64_t v16 = [(_UITabGroup *)v10 _orderedChildrenForDisplayOrder:v15];

    id v9 = (void *)v16;
  }
  double v17 = [_UITabOutlineParser alloc];
  double v18 = [(_UITabOutlineView *)v3 activeTransaction];
  v101 = v9;
  double v19 = [(_UITabOutlineParser *)v17 initWithTabs:v9 includeAllowsHidingItems:v8 transaction:v18];

  long long v134 = 0u;
  long long v135 = 0u;
  long long v132 = 0u;
  long long v133 = 0u;
  v106 = v19;
  char v20 = [(_UITabOutlineParser *)v19 rootItems];
  uint64_t v21 = [v20 countByEnumeratingWithState:&v132 objects:v144 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v133;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v133 != v23) {
          objc_enumerationMutation(v20);
        }
        long long v25 = [*(id *)(*((void *)&v132 + 1) + 8 * i) identifier];
        v143 = v25;
        long long v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v143 count:1];
        [(NSDiffableDataSourceSectionSnapshot *)v7 appendItems:v26];
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v132 objects:v144 count:16];
    }
    while (v22);
  }
  v102 = v7;

  long long v130 = 0u;
  long long v131 = 0u;
  long long v128 = 0u;
  long long v129 = 0u;
  long long v27 = [(_UITabOutlineParser *)v106 groupItems];
  uint64_t v28 = [v27 countByEnumeratingWithState:&v128 objects:v142 count:16];
  v111 = v3;
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v129;
    do
    {
      for (uint64_t j = 0; j != v29; ++j)
      {
        if (*(void *)v129 != v30) {
          objc_enumerationMutation(v27);
        }
        BOOL v32 = *(void **)(*((void *)&v128 + 1) + 8 * j);
        v33 = objc_alloc_init(NSDiffableDataSourceSectionSnapshot);
        v34 = [v32 identifier];
        v141 = v34;
        uint64_t v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v141 count:1];
        [(NSDiffableDataSourceSectionSnapshot *)v33 appendItems:v35];

        BOOL v3 = v111;
        [(_UITabOutlineView *)v111 _updateSnapshot:v33 usingNode:v32];
        [v5 addObject:v34];
        [v110 setObject:v33 forKeyedSubscript:v34];
      }
      uint64_t v29 = [v27 countByEnumeratingWithState:&v128 objects:v142 count:16];
    }
    while (v29);
  }

  v99 = [(_UITabOutlineView *)v3 _dataSourceUpdateGroupCompletionCreateIfNeeded:1];
  [v99 increment];
  double v36 = [(_UITabOutlineView *)v3 dataSource];
  id v37 = [v36 snapshot];

  double v38 = [v37 sectionIdentifiers];
  uint64_t v39 = [v5 differenceFromArray:v38 withOptions:4];
  v98 = v38;
  v104 = v39;
  v107 = v37;
  if ([v38 count])
  {
    BOOL v40 = v105;
    if ([v39 hasChanges])
    {
      uint64_t v41 = [MEMORY[0x1E4F1CA48] array];
      long long v124 = 0u;
      long long v125 = 0u;
      long long v126 = 0u;
      long long v127 = 0u;
      uint64_t v42 = [v39 removals];
      uint64_t v43 = [v42 countByEnumeratingWithState:&v124 objects:v140 count:16];
      if (v43)
      {
        uint64_t v44 = v43;
        uint64_t v45 = *(void *)v125;
        do
        {
          for (uint64_t k = 0; k != v44; ++k)
          {
            if (*(void *)v125 != v45) {
              objc_enumerationMutation(v42);
            }
            v47 = *(void **)(*((void *)&v124 + 1) + 8 * k);
            if ([v47 associatedIndex] == 0x7FFFFFFFFFFFFFFFLL)
            {
              v48 = [v47 object];
              [v41 addObject:v48];
            }
          }
          uint64_t v44 = [v42 countByEnumeratingWithState:&v124 objects:v140 count:16];
        }
        while (v44);
      }

      obuint64_t j = v41;
      [v37 deleteSectionsWithIdentifiers:v41];
      long long v122 = 0u;
      long long v123 = 0u;
      long long v120 = 0u;
      long long v121 = 0u;
      BOOL v49 = [v104 insertions];
      uint64_t v50 = [v49 countByEnumeratingWithState:&v120 objects:v139 count:16];
      if (v50)
      {
        uint64_t v51 = v50;
        uint64_t v52 = *(void *)v121;
        do
        {
          for (uint64_t m = 0; m != v51; ++m)
          {
            if (*(void *)v121 != v52) {
              objc_enumerationMutation(v49);
            }
            long long v54 = *(void **)(*((void *)&v120 + 1) + 8 * m);
            long long v55 = [v54 object];
            long long v56 = objc_msgSend(v5, "objectAtIndex:", objc_msgSend(v54, "index") - 1);
            if ([v54 associatedIndex] == 0x7FFFFFFFFFFFFFFFLL)
            {
              v138 = v55;
              long long v57 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v138 count:1];
              [v37 insertSectionsWithIdentifiers:v57 afterSectionWithIdentifier:v56];
            }
            else
            {
              [v37 moveSectionWithIdentifier:v55 afterSectionWithIdentifier:v56];
            }
          }
          uint64_t v51 = [v49 countByEnumeratingWithState:&v120 objects:v139 count:16];
        }
        while (v51);
      }

      BOOL v3 = v111;
      BOOL v40 = v105;
      uint64_t v39 = v104;
    }
  }
  else
  {
    [v37 appendSectionsWithIdentifiers:v5];
    BOOL v40 = v105;
  }
  if ([v39 hasChanges])
  {
    v58 = [(_UITabOutlineView *)v3 dataSource];
    [v58 applySnapshot:v37 animatingDifferences:v40];
  }
  uint64_t v59 = [(_UITabOutlineParser *)v106 contentByIdentifier];
  contentByIdentifier = v3->_contentByIdentifier;
  v3->_contentByIdentifier = (NSMutableDictionary *)v59;

  displayedGroup = v3->_displayedGroup;
  if (displayedGroup)
  {
    id v62 = displayedGroup;
    v63 = +[_UITabSidebarContent contentForTab:v62];
    v64 = v3->_contentByIdentifier;
    v65 = v3->_displayedGroup;
    v66 = [(_UITabGroup *)v65 identifier];
    [(NSMutableDictionary *)v64 setObject:v63 forKeyedSubscript:v66];

    BOOL v40 = v105;
  }
  long long v118 = 0u;
  long long v119 = 0u;
  long long v116 = 0u;
  long long v117 = 0u;
  id obja = v5;
  uint64_t v67 = [obja countByEnumeratingWithState:&v116 objects:v137 count:16];
  if (v67)
  {
    uint64_t v68 = v67;
    uint64_t v69 = *(void *)v117;
    do
    {
      for (uint64_t n = 0; n != v68; ++n)
      {
        if (*(void *)v117 != v69) {
          objc_enumerationMutation(obja);
        }
        uint64_t v71 = *(void *)(*((void *)&v116 + 1) + 8 * n);
        id v72 = [v110 objectForKeyedSubscript:v71];
        v73 = [(_UITabOutlineView *)v3 dataSource];
        [v73 applySnapshot:v72 toSection:v71 animatingDifferences:v40];
      }
      uint64_t v68 = [obja countByEnumeratingWithState:&v116 objects:v137 count:16];
    }
    while (v68);
  }

  long long v114 = 0u;
  long long v115 = 0u;
  long long v112 = 0u;
  long long v113 = 0u;
  id v74 = [(_UITabOutlineView *)v3 collectionView];
  v75 = [v74 preparedCells];

  uint64_t v76 = [v75 countByEnumeratingWithState:&v112 objects:v136 count:16];
  if (!v76)
  {
    v78 = 0;
    v91 = v102;
    v92 = v111;
    v93 = v99;
    v90 = v107;
    goto LABEL_72;
  }
  uint64_t v77 = v76;
  v78 = 0;
  uint64_t v79 = *(void *)v113;
  do
  {
    for (iuint64_t i = 0; ii != v77; ++ii)
    {
      if (*(void *)v113 != v79) {
        objc_enumerationMutation(v75);
      }
      id v81 = *(void **)(*((void *)&v112 + 1) + 8 * ii);
      if (v81) {
        id v81 = (void *)v81[109];
      }
      v82 = v81;
      v83 = [v82 tab];

      v84 = v111->_contentByIdentifier;
      v85 = [v83 identifier];
      v86 = [(NSMutableDictionary *)v84 objectForKeyedSubscript:v85];
      v87 = [v86 tab];

      if (v83 && v87 && v83 != v87)
      {
        if (v78)
        {
          v88 = [v87 identifier];
          [v78 addObject:v88];
        }
        else
        {
          v89 = (void *)MEMORY[0x1E4F1CA48];
          v88 = [v87 identifier];
          v78 = [v89 arrayWithObject:v88];
        }
      }
    }
    uint64_t v77 = [v75 countByEnumeratingWithState:&v112 objects:v136 count:16];
  }
  while (v77);

  v90 = v107;
  if (!v78)
  {
    v91 = v102;
    v92 = v111;
    v93 = v99;
    goto LABEL_74;
  }
  v91 = v102;
  v92 = v111;
  v93 = v99;
  if ([v78 count])
  {
    v94 = [(_UITabOutlineView *)v111 dataSource];
    v95 = [v94 snapshot];

    [v95 reconfigureItemsWithIdentifiers:v78];
    v75 = [(_UITabOutlineView *)v111 dataSource];
    [v75 applySnapshot:v95 animatingDifferences:v105];
    v90 = v95;
LABEL_72:
  }
LABEL_74:
  [v93 complete];
  v96 = [(_UITabOutlineView *)v92 activeTransaction];
  if (v96)
  {
    v97 = [(_UITabOutlineView *)v92 _tabsByIdentifier];
    [v96 updateTabs:v97];
  }
}

- (id)_existingSectionSnapshotForTabIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(_UITabOutlineView *)self dataSource];
  id v6 = [v5 snapshot];
  id v7 = [v6 sectionIdentifierForSectionContainingItemIdentifier:v4];

  if (v7)
  {
    uint64_t v8 = [(_UITabOutlineView *)self dataSource];
    id v9 = [v8 snapshotForSection:v7];

    uint64_t v10 = [v9 items];
    uint64_t v11 = [v10 count];

    if (v11) {
      goto LABEL_5;
    }
  }
  id v9 = 0;
LABEL_5:

  return v9;
}

- (void)_reconfigureItemsInDataSourceForTabs:(id)a3 animated:(BOOL)a4
{
  BOOL v23 = a4;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v5, "count"));
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v25 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        uint64_t v13 = [v12 identifier];
        uint64_t v14 = [(_UITabOutlineView *)self dataSource];
        uint64_t v15 = [v14 indexPathForItemIdentifier:v13];

        if (v15)
        {
          uint64_t v16 = [(_UITabOutlineView *)self willDisplayTab];

          if (v12 == v16)
          {
            self->_didUpdateWillDisplayTab = 1;
          }
          else
          {
            [v6 addObject:v13];
            double v17 = +[_UITabSidebarContent contentForTab:v12];
            [(NSMutableDictionary *)self->_contentByIdentifier setObject:v17 forKey:v13];
            double v18 = [(_UITabOutlineView *)self activeTransaction];
            [v18 replaceTab:v12 forIdentifier:v13];
          }
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v9);
  }

  if ([v6 count])
  {
    double v19 = [(_UITabOutlineView *)self dataSource];
    char v20 = [v19 snapshot];

    [v20 reconfigureItemsWithIdentifiers:v6];
    uint64_t v21 = [(_UITabOutlineView *)self _dataSourceUpdateGroupCompletionCreateIfNeeded:1];
    [v21 increment];
    uint64_t v22 = [(_UITabOutlineView *)self dataSource];
    [v22 applySnapshot:v20 animatingDifferences:v23];

    [v21 complete];
  }
}

- (id)_dataSourceUpdateGroupCompletionCreateIfNeeded:(BOOL)a3
{
  dataSourceUpdateGroupCompletiouint64_t n = self->_dataSourceUpdateGroupCompletion;
  if (dataSourceUpdateGroupCompletion) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = !a3;
  }
  if (!v5)
  {
    id v6 = objc_alloc_init(_UIGroupCompletion);
    id v7 = self->_dataSourceUpdateGroupCompletion;
    self->_dataSourceUpdateGroupCompletiouint64_t n = v6;

    objc_initWeak(&location, self);
    uint64_t v8 = self->_dataSourceUpdateGroupCompletion;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __68___UITabOutlineView__dataSourceUpdateGroupCompletionCreateIfNeeded___block_invoke;
    v10[3] = &unk_1E52DC308;
    objc_copyWeak(&v11, &location);
    [(_UIGroupCompletion *)v8 addNonIncrementingCompletion:v10];
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
    dataSourceUpdateGroupCompletiouint64_t n = self->_dataSourceUpdateGroupCompletion;
  }
  return dataSourceUpdateGroupCompletion;
}

- (id)_tabForIndexPath:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(_UITabOutlineView *)self dataSource];
  id v6 = [v5 itemIdentifierForIndexPath:v4];

  id v7 = [(NSMutableDictionary *)self->_contentByIdentifier objectForKey:v6];
  uint64_t v8 = [v7 tab];

  return v8;
}

- (id)_actionForIndexPath:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(_UITabOutlineView *)self dataSource];
  id v6 = [v5 itemIdentifierForIndexPath:v4];

  id v7 = [(NSMutableDictionary *)self->_contentByIdentifier objectForKey:v6];
  uint64_t v8 = [v7 action];

  return v8;
}

- (id)_sidebarContentForIndexPath:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(_UITabOutlineView *)self dataSource];
  id v6 = [v5 itemIdentifierForIndexPath:v4];

  id v7 = [(NSMutableDictionary *)self->_contentByIdentifier objectForKey:v6];

  return v7;
}

- (BOOL)_isHeaderIndexPath:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 section] >= 1 && objc_msgSend(v3, "item") == 0;

  return v4;
}

- (BOOL)_canDragTab:(id)a3
{
  id v4 = a3;
  if ([v4 _isAction])
  {
    LOBYTE(v5) = 0;
  }
  else if ([v4 _canBeReordered])
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    if (self) {
      tabModel = self->_tabModel;
    }
    else {
      tabModel = 0;
    }
    id v7 = tabModel;
    if (-[_UITabModel isEditing](v7, "isEditing") && [v4 _hasCustomizablePlacement])
    {
      if (self) {
        uint64_t v8 = self->_tabModel;
      }
      else {
        uint64_t v8 = 0;
      }
      BOOL v5 = ![(_UITabModel *)v8 isTabHidden:v4];
    }
    else
    {
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (void)headerContentConfigurationDidChange:(id *)a1
{
  if (a1)
  {
    id v6 = [a1 _headerContentConfiguration];
    if ((a2 == 0) != (v6 != 0))
    {
      id v4 = [MEMORY[0x1E4F28D58] indexPathForItem:0 inSection:0];
      BOOL v5 = [a1[68] supplementaryViewForElementKind:@"UICollectionElementKindSectionHeader" atIndexPath:v4];
      [v5 setContentConfiguration:v6];
    }
    else
    {
      id v4 = [a1[69] snapshot];
      [a1[69] applySnapshot:v4 animatingDifferences:1];
    }
  }
}

- (void)footerContentConfigurationDidChange:(id *)a1
{
  if (a1)
  {
    id v7 = [a1 _footerContentConfiguration];
    if ((a2 == 0) != (v7 != 0))
    {
      uint64_t v4 = [a1[68] numberOfSections];
      BOOL v5 = [MEMORY[0x1E4F28D58] indexPathForItem:0 inSection:v4 - 1];
      id v6 = [a1[68] supplementaryViewForElementKind:@"UICollectionElementKindSectionFooter" atIndexPath:v5];
      [v6 setContentConfiguration:v7];
    }
    else
    {
      BOOL v5 = [a1[69] snapshot];
      [a1[69] applySnapshot:v5 animatingDifferences:1];
    }
  }
}

- (void)updateBottomBarView
{
  if (a1)
  {
    v2 = [(id)a1 _bottomToolbar];
    [v2 _setItemsDidChangeBlock:0];

    id v3 = *(void **)(a1 + 624);
    if (v3)
    {
      [v3 removeFromSuperview];
      uint64_t v4 = *(void **)(a1 + 624);
      *(void *)(a1 + 624) = 0;

      [(id)a1 setNeedsLayout];
    }
    BOOL v5 = (id *)*(id *)(a1 + 464);
    id v6 = -[_UICollectionLayoutAuxillaryItemSolver supplementaryFrames](v5);

    if (v6)
    {
      objc_initWeak(&location, (id)a1);
      uint64_t v15 = MEMORY[0x1E4F143A8];
      uint64_t v16 = 3221225472;
      double v17 = __40___UITabOutlineView_updateBottomBarView__block_invoke;
      double v18 = &unk_1E52DC308;
      objc_copyWeak(&v19, &location);
      id v7 = _Block_copy(&v15);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v8 = v6;
        uint64_t v9 = objc_msgSend(*(id *)(a1 + 528), "_groupName", v15, v16, v17, v18);
        uint64_t v10 = v9;
        if (!v9)
        {
          uint64_t v10 = [(id)a1 _defaultBarBackdropGroupName];
        }
        [v8 _setBackdropViewLayerGroupName:v10];
        if (!v9) {

        }
        [v8 _setItemsDidChangeBlock:v7];
        *(unsigned char *)(a1 + 412) = 1;
      }
      else
      {
        *(unsigned char *)(a1 + 412) = 0;
      }
      id v11 = [[_UITabSidebarBottomBarWrapperView alloc] initWithView:v6 intrinsicContentSizeInvalidationHandler:v7];
      uint64_t v12 = *(void **)(a1 + 624);
      *(void *)(a1 + 624) = v11;

      uint64_t v13 = [(id)a1 backgroundView];
      uint64_t v14 = [v13 contentView];
      [v14 addSubview:*(void *)(a1 + 624)];

      [(id)a1 setNeedsLayout];
      objc_destroyWeak(&v19);
      objc_destroyWeak(&location);
    }
  }
}

- (id)_headerContentConfiguration
{
  if (self) {
    self = (_UITabOutlineView *)self->_sidebar;
  }
  return -[UITabBarControllerSidebar _actualHeaderContentConfiguration]((id *)&self->super.super.super.isa);
}

- (id)_footerContentConfiguration
{
  if (self) {
    self = (_UITabOutlineView *)self->_sidebar;
  }
  return -[UITabBarControllerSidebar _actualFooterContentConfiguration]((id *)&self->super.super.super.isa);
}

- (id)_bottomToolbar
{
  if (self->_bottomBarIsToolbar)
  {
    v2 = [(_UITabSidebarBottomBarWrapperView *)self->_bottomBarView view];
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (void)scrollToTarget:(uint64_t)a3 animated:
{
  BOOL v5 = a2;
  if (!a1) {
    goto LABEL_10;
  }
  double v18 = v5;
  if (v5) {
    id v6 = (void *)v5[2];
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  if (!v7)
  {
    if (v18 && *((unsigned char *)v18 + 8))
    {
      uint64_t v14 = [a1 _headerContentConfiguration];

      if (v14)
      {
        uint64_t v12 = [MEMORY[0x1E4F28D58] indexPathForItem:0x7FFFFFFFFFFFFFFFLL inSection:0];
        uint64_t v13 = 1;
        goto LABEL_8;
      }
      BOOL v5 = v18;
      if (*((unsigned char *)v18 + 8)) {
        goto LABEL_10;
      }
    }
    uint64_t v15 = [a1 _footerContentConfiguration];

    BOOL v5 = v18;
    if (!v15) {
      goto LABEL_10;
    }
    uint64_t v16 = [a1 collectionView];
    uint64_t v17 = [v16 numberOfSections] - 1;

    uint64_t v12 = [MEMORY[0x1E4F28D58] indexPathForItem:0x7FFFFFFFFFFFFFFFLL inSection:v17];
    uint64_t v13 = 4;
    goto LABEL_8;
  }
  id v8 = [a1 dataSource];
  if (v18) {
    uint64_t v9 = (void *)v18[2];
  }
  else {
    uint64_t v9 = 0;
  }
  id v10 = v9;
  id v11 = [v10 identifier];
  uint64_t v12 = [v8 indexPathForItemIdentifier:v11];

  uint64_t v13 = 0;
LABEL_8:
  BOOL v5 = v18;
  if (v12)
  {
    [a1[68] scrollToItemAtIndexPath:v12 atScrollPosition:v13 animated:a3];

    BOOL v5 = v18;
  }
LABEL_10:
}

- (void)reconfigureItemForTab:(void *)a1
{
  if (a1)
  {
    id v3 = [MEMORY[0x1E4F1CAD0] setWithObject:a2];
    [a1 _reconfigureItemsInDataSourceForTabs:v3 animated:1];
  }
}

- (id)resolvedPopoverPresentationControllerSourceItemForTab:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(_UITabOutlineView *)self contentByIdentifier];
  id v6 = [v4 identifier];
  id v7 = [v5 objectForKey:v6];
  id v8 = [v7 tab];

  if (v8)
  {
    id v9 = v4;
    if (v9)
    {
      do
      {
        id v10 = v9;
        id v11 = [(_UITabOutlineView *)self dataSource];
        uint64_t v12 = [v9 identifier];
        uint64_t v13 = [v11 indexPathForItemIdentifier:v12];

        uint64_t v14 = [(_UITabOutlineView *)self collectionView];
        uint64_t v15 = [v14 cellForItemAtIndexPath:v13];

        id v9 = [v10 _parentGroup];
      }
      while (v9 && !v15);
    }
    else
    {
      uint64_t v15 = 0;
    }
  }
  else
  {
    uint64_t v15 = 0;
  }

  return v15;
}

- (void)_tabModelDidReload:(id)a3
{
  [(_UITabOutlineView *)self _reloadDataSourceSnapshotAnimated:1];
  [(_UITabOutlineView *)self _updateSelectedItemAnimated:1];
}

- (void)_tabModel:(id)a3 tabContentDidChange:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(_UITabOutlineView *)self _dataSourceUpdateGroupCompletionCreateIfNeeded:0];
  if (v8)
  {
    updatedTabsDuringApplySnapshot = self->_updatedTabsDuringApplySnapshot;
    if (!updatedTabsDuringApplySnapshot)
    {
      id v10 = [MEMORY[0x1E4F1CA80] set];
      id v11 = self->_updatedTabsDuringApplySnapshot;
      self->_updatedTabsDuringApplySnapshot = v10;

      objc_initWeak(&location, self);
      uint64_t v13 = MEMORY[0x1E4F143A8];
      uint64_t v14 = 3221225472;
      uint64_t v15 = __51___UITabOutlineView__tabModel_tabContentDidChange___block_invoke;
      uint64_t v16 = &unk_1E52DC308;
      objc_copyWeak(&v17, &location);
      [v8 addNonIncrementingCompletion:&v13];
      objc_destroyWeak(&v17);
      objc_destroyWeak(&location);
      updatedTabsDuringApplySnapshot = self->_updatedTabsDuringApplySnapshot;
    }
    -[NSMutableSet addObject:](updatedTabsDuringApplySnapshot, "addObject:", v7, v13, v14, v15, v16);
  }
  else
  {
    uint64_t v12 = [MEMORY[0x1E4F1CAD0] setWithObject:v7];
    [(_UITabOutlineView *)self _reconfigureItemsInDataSourceForTabs:v12 animated:1];
  }
}

- (void)_tabModel:(id)a3 didReplaceOldItem:(id)a4 newItem:(id)a5
{
  v35[1] = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  if (([v7 _isGroup] & 1) == 0 && !objc_msgSend(v8, "_isGroup"))
  {
    contentByIdentifier = self->_contentByIdentifier;
    id v10 = [v7 identifier];
    [(NSMutableDictionary *)contentByIdentifier removeObjectForKey:v10];

    id v11 = self->_contentByIdentifier;
    uint64_t v12 = +[_UITabSidebarContent contentForTab:v8];
    uint64_t v13 = [v8 identifier];
    [(NSMutableDictionary *)v11 setObject:v12 forKey:v13];

    uint64_t v14 = [(_UITabOutlineView *)self activeTransaction];
    uint64_t v15 = [v8 identifier];
    [v14 replaceTab:v8 forIdentifier:v15];

    uint64_t v16 = [(_UITabOutlineView *)self dataSource];
    id v17 = [v16 snapshot];

    double v18 = [(_UITabOutlineView *)self _dataSourceUpdateGroupCompletionCreateIfNeeded:1];
    [v18 increment];
    id v19 = [v7 identifier];
    char v20 = [v8 identifier];
    id v21 = v19;
    id v22 = v20;
    if (v21 == v22)
    {
    }
    else
    {
      BOOL v23 = v22;
      if (!v21 || !v22)
      {

LABEL_12:
        long long v27 = [v7 identifier];
        uint64_t v28 = [v17 indexOfItemIdentifier:v27];

        if (v28 == 0x7FFFFFFFFFFFFFFFLL)
        {
          if (([v8 isHidden] & 1) == 0)
          {
            [v18 complete];
            [(_UITabOutlineView *)self _reloadDataSourceSnapshotAnimated:1];
          }
          goto LABEL_17;
        }
        uint64_t v29 = [v8 identifier];
        v34 = v29;
        uint64_t v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v34 count:1];
        uint64_t v31 = [v7 identifier];
        [v17 insertItemsWithIdentifiers:v30 afterItemWithIdentifier:v31];

        long long v25 = [v7 identifier];
        v33 = v25;
        long long v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v33 count:1];
        [v17 deleteItemsWithIdentifiers:v26];
LABEL_16:

        BOOL v32 = [(_UITabOutlineView *)self dataSource];
        [v32 applySnapshot:v17 animatingDifferences:1];

        [v18 complete];
LABEL_17:

        goto LABEL_18;
      }
      char v24 = [v21 isEqual:v22];

      if ((v24 & 1) == 0) {
        goto LABEL_12;
      }
    }
    long long v25 = [v8 identifier];
    v35[0] = v25;
    long long v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:1];
    [v17 reconfigureItemsWithIdentifiers:v26];
    goto LABEL_16;
  }
  [(_UITabOutlineView *)self _reloadDataSourceSnapshotAnimated:1];
LABEL_18:
}

- (void)_tabModel:(id)a3 visibilityDidChangeForTab:(id)a4
{
  id v15 = a4;
  if (self) {
    tabModel = self->_tabModel;
  }
  else {
    tabModel = 0;
  }
  if ([(_UITabModel *)tabModel isEditing])
  {
    if (!self->_ignoringSelectionUpdates)
    {
      id v6 = [(_UITabOutlineView *)self dataSource];
      id v7 = [v15 identifier];
      id v8 = [v6 indexPathForItemIdentifier:v7];

      id v9 = [(_UITabOutlineView *)self collectionView];
      BOOL v10 = [(_UITabOutlineView *)self collectionView:v9 shouldSelectItemAtIndexPath:v8];

      BOOL v11 = [(_UITabModel *)self->_tabModel isTabHidden:v15];
      uint64_t v12 = [(_UITabOutlineView *)self collectionView];
      uint64_t v13 = v12;
      if (v11 || !v10) {
        [v12 deselectItemAtIndexPath:v8 animated:1];
      }
      else {
        [v12 selectItemAtIndexPath:v8 animated:1 scrollPosition:0];
      }

      uint64_t v14 = [(_UITabOutlineView *)self activeTransaction];
      [v14 updateTab:v15 toHidden:v11];
    }
  }
  else
  {
    [(_UITabOutlineView *)self _reloadDataSourceSnapshotAnimated:1];
    [(_UITabOutlineView *)self _updateSelectedItemAnimated:1];
  }
}

- (void)_tabModel:(id)a3 didChangeSelectedLeaf:(id)a4 previousElement:(id)a5
{
  id v6 = [(UIView *)self superview];
  if (v6) {
    BOOL v7 = +[UIView areAnimationsEnabled];
  }
  else {
    BOOL v7 = 0;
  }

  id v8 = [(UIView *)self superview];

  if (!v8) {
    self->_needsScrollToSelectedItemWhenBecomingVisible = 1;
  }
  [(_UITabOutlineView *)self _updateSelectedItemAnimated:v7];
}

- (void)_tabModel:(id)a3 customizationStoreDidChange:(id)a4
{
  BOOL v5 = objc_msgSend(a4, "collapsedSectionIdentifiers", a3);
  id v6 = (NSMutableSet *)[v5 mutableCopy];
  collapsedSectionIdentifiers = self->_collapsedSectionIdentifiers;
  self->_collapsedSectionIdentifiers = v6;

  [(_UITabOutlineView *)self _reloadDataSourceSnapshotAnimated:1];
  -[_UITabOutlineView delegate]((id *)&self->super.super.super.isa);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [v8 outlineViewDidChangeCustomizationStore:self];
}

- (id)delegate
{
  if (WeakRetained)
  {
    WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 55);
    uint64_t v1 = vars8;
  }
  return WeakRetained;
}

- (BOOL)_showSidebarBarButtonItem
{
  if (self->_sidebarButtonAction) {
    return ![(_UITabModel *)self->_tabModel isEditing];
  }
  else {
    return 0;
  }
}

- (void)_updateEditBarButtonItem
{
  v2 = self;
  v32[2] = *MEMORY[0x1E4F143B8];
  if (self) {
    self = (_UITabOutlineView *)self->_tabModel;
  }
  BOOL v3 = [(_UITabOutlineView *)self isEditing];
  BOOL v4 = [(_UITabOutlineView *)v2 _showSidebarBarButtonItem];
  BOOL v5 = [(_UITabOutlineView *)v2 sidebarBarButtonItem];
  [v5 setHidden:!v4];

  if (v3 || (!v2 ? (tabModel = 0) : (tabModel = v2->_tabModel), [(_UITabModel *)tabModel isEditable]))
  {
    objc_initWeak(&location, v2);
    BOOL v7 = _UINSLocalizedStringWithDefaultValue(@"Edit Sidebar", @"Edit Sidebar");
    id v8 = +[UIImage systemImageNamed:@"checklist"];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __45___UITabOutlineView__updateEditBarButtonItem__block_invoke;
    v27[3] = &unk_1E52F0C80;
    objc_copyWeak(&v28, &location);
    BOOL v29 = v3;
    id v9 = +[UIAction actionWithTitle:v7 image:v8 identifier:0 handler:v27];

    if (v3)
    {
      BOOL v10 = [(_UITabOutlineView *)v2 resetBarButtonItem];
      BOOL v11 = [(_UITabOutlineView *)v2 navigationItem];
      [v11 setLeftBarButtonItem:v10];

      uint64_t v12 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:0 primaryAction:v9];
      uint64_t v13 = [(_UITabOutlineView *)v2 navigationItem];
      [(UIBarButtonItem *)v13 setRightBarButtonItem:v12];
    }
    else
    {
      if (v2) {
        sidebar = v2->_sidebar;
      }
      else {
        sidebar = 0;
      }
      id v15 = sidebar;
      uint64_t v12 = [(UITabBarControllerSidebar *)v15 navigationOverflowItems];

      uint64_t v16 = [(_UITabOutlineView *)v2 sidebarBarButtonItem];
      id v17 = [(_UITabOutlineView *)v2 navigationItem];
      [v17 setLeftBarButtonItem:v16];

      if (v12)
      {
        uint64_t v31 = v9;
        v32[0] = v12;
        double v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v31 count:1];
        id v19 = +[UIMenu menuWithTitle:&stru_1ED0E84C0 image:0 identifier:0 options:1 children:v18];
        v32[1] = v19;
        char v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:2];
        uint64_t v13 = +[UIMenu menuWithChildren:v20];

        id v21 = [UIBarButtonItem alloc];
        id v22 = +[UIImage systemImageNamed:@"ellipsis.circle"];
        BOOL v23 = [(UIBarButtonItem *)v21 initWithImage:v22 menu:v13];
        char v24 = [(_UITabOutlineView *)v2 navigationItem];
        [v24 setRightBarButtonItem:v23];
      }
      else
      {
        uint64_t v13 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:2 primaryAction:v9];
        id v22 = [(_UITabOutlineView *)v2 navigationItem];
        [v22 setRightBarButtonItem:v13];
      }
    }
    objc_destroyWeak(&v28);

    objc_destroyWeak(&location);
  }
  else
  {
    long long v25 = [(_UITabOutlineView *)v2 navigationItem];
    [v25 setRightBarButtonItem:0];
  }
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __45___UITabOutlineView__updateEditBarButtonItem__block_invoke_2;
  v26[3] = &unk_1E52D9F70;
  v26[4] = v2;
  +[UIView performWithoutAnimation:v26];
}

- (void)_performWithoutAffectingSelection:(id)a3
{
  self->_ignoringSelectionUpdates = 1;
  (*((void (**)(id, SEL))a3 + 2))(a3, a2);
  self->_ignoringSelectionUpdates = 0;
}

- (void)_performWithoutAffectingContent:(id)a3
{
  self->_ignoringContentUpdates = 1;
  (*((void (**)(id, SEL))a3 + 2))(a3, a2);
  self->_ignoringContentUpdates = 0;
}

- (void)_performWithWillDisplayTab:(id)a3 block:(id)a4
{
  p_willDisplayTab = &self->_willDisplayTab;
  objc_storeStrong((id *)&self->_willDisplayTab, a3);
  id v9 = a3;
  BOOL v7 = (void (**)(id, id))a4;
  v7[2](v7, v9);

  id v8 = *p_willDisplayTab;
  *p_willDisplayTab = 0;
}

- (id)activeTransaction
{
  if (self)
  {
    uint64_t v2 = *((void *)self + 58);
    if (v2) {
      return *(id *)(v2 + 96);
    }
    else {
      return 0;
    }
  }
  return self;
}

- (void)tabModelEditingStateDidChange
{
  if (a1)
  {
    if ([*(id *)(a1 + 448) isEditing])
    {
      [(id)a1 _activateNewSidebarTransaction];
      id v2 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      BOOL v3 = *(void **)(a1 + 576);
      *(void *)(a1 + 576) = v2;
    }
    else
    {
      BOOL v4 = [(id)a1 activeTransaction];

      if (!v4)
      {
        BOOL v5 = [MEMORY[0x1E4F28B00] currentHandler];
        objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", sel_tabModelEditingStateDidChange, a1, @"_UITabOutlineView.m", 1480, @"UIKit internal error: Tab outline view should not be exiting edit mode without an active transaction. Model: %@; Outline view: %@",
          *(void *)(a1 + 448),
          a1);
      }
      [(id)a1 _commitCurrentSidebarTransaction];
      BOOL v3 = *(void **)(a1 + 576);
      *(void *)(a1 + 576) = 0;
    }
  }
}

- (uint64_t)setAdditionalEditingInsets:(double)a3
{
  if (result)
  {
    BOOL v5 = (void *)result;
    BOOL v6 = *(double *)(result + 640) == a3 && *(double *)(result + 632) == a2;
    BOOL v7 = v6 && *(double *)(result + 656) == a5;
    if (!v7 || *(double *)(result + 648) != a4)
    {
      *(double *)(result + 632) = a2;
      *(double *)(result + 640) = a3;
      *(double *)(result + 648) = a4;
      *(double *)(result + 656) = a5;
      [(id)result _updateEditingInsets];
      result = +[UIView _isInAnimationBlockWithAnimationsEnabled];
      if (result)
      {
        return [v5 layoutIfNeeded];
      }
    }
  }
  return result;
}

- (void)_updateEditingInsets
{
  [(UIView *)self _setSafeAreaInsetsFrozen:0];
  if (self)
  {
    double top = self->_additionalEditingInsets.top;
    double left = self->_additionalEditingInsets.left;
    bottouint64_t m = self->_additionalEditingInsets.bottom;
    double right = self->_additionalEditingInsets.right;
  }
  else
  {
    double left = 0.0;
    bottouint64_t m = 0.0;
    double right = 0.0;
    double top = 0.0;
  }
  BOOL v7 = [(UIView *)self superview];
  if (v7)
  {
    if (left != 0.0 || top != 0.0 || right != 0.0)
    {

LABEL_10:
      id v8 = [(UIView *)self superview];
      [v8 safeAreaInsets];
      double v10 = v9;
      double v12 = v11;
      double v14 = v13;
      double v16 = v15;

      [(UIView *)self _setSafeAreaInsetsFrozen:1];
      -[UIView _setSafeAreaInsets:updateSubviewsDuringNextLayoutPass:]((double *)self, 1, top + v10, left + v12, bottom + v14, right + v16);
      goto LABEL_11;
    }

    if (bottom != 0.0) {
      goto LABEL_10;
    }
  }
LABEL_11:
  self->_isNavigationBarSafeAreaDirty = 1;
}

- (void)_activateNewSidebarTransaction
{
  BOOL v4 = [(_UITabOutlineView *)self activeTransaction];

  if (v4)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    double v9 = v8;
    if (self) {
      tabModel = self->_tabModel;
    }
    else {
      tabModel = 0;
    }
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"_UITabOutlineView.m", 1562, @"UIKit internal error: Attempting to create a new transaction without while there is already an active transaction. Model: %@; Outline view: %@",
      tabModel,
      self);
  }
  id v11 = [(_UITabOutlineView *)self _tabsByIdentifier];
  BOOL v5 = [_UITabSidebarTransaction alloc];
  if (self)
  {
    BOOL v6 = [(_UITabSidebarTransaction *)v5 initWithTabs:v11 sidebar:self->_sidebar];
    sidebar = self->_sidebar;
  }
  else
  {
    BOOL v6 = [(_UITabSidebarTransaction *)v5 initWithTabs:v11 sidebar:0];
    sidebar = 0;
  }
  -[_UICollectionLayoutSectionListSolver setPreferredSizes:]((uint64_t)sidebar, v6);
}

- (void)_commitCurrentSidebarTransaction
{
  BOOL v3 = [(_UITabOutlineView *)self activeTransaction];

  if (v3)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __53___UITabOutlineView__commitCurrentSidebarTransaction__block_invoke;
    v5[3] = &unk_1E52D9F70;
    v5[4] = self;
    [(_UITabOutlineView *)self _performWithoutAffectingContent:v5];
    if (self) {
      sidebar = self->_sidebar;
    }
    else {
      sidebar = 0;
    }
    -[_UICollectionLayoutSectionListSolver setPreferredSizes:]((uint64_t)sidebar, 0);
  }
}

- (id)_tabsByIdentifier
{
  BOOL v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", -[NSMutableDictionary count](self->_contentByIdentifier, "count"));
  contentByIdentifier = self->_contentByIdentifier;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __38___UITabOutlineView__tabsByIdentifier__block_invoke;
  v7[3] = &unk_1E5310C48;
  id v5 = v3;
  id v8 = v5;
  [(NSMutableDictionary *)contentByIdentifier enumerateKeysAndObjectsUsingBlock:v7];

  return v5;
}

- (void)_updateScrollEdgeAppearance
{
  id v13 = [(_UITabOutlineView *)self collectionView];
  BOOL v3 = [(_UITabOutlineView *)self navigationBar];
  [v3 frame];
  double MaxY = CGRectGetMaxY(v15);

  [v13 contentOffset];
  double v6 = fmax(fmin((-v5 - MaxY) / (MaxY + -4.0 - MaxY), 1.0), 0.0);
  BOOL v7 = [(_UITabOutlineView *)self navigationItem];
  [v7 _setManualScrollEdgeAppearanceProgress:v6];

  id v8 = [(_UITabOutlineView *)self _bottomToolbar];
  if (v8)
  {
    [(UIView *)self->_bottomBarView frame];
    double MinY = CGRectGetMinY(v16);
    [v13 contentSize];
    double v11 = v10;
    [v13 contentOffset];
    objc_msgSend(v8, "_setBackgroundTransitionProgress:", fmax(fmin((v11 - v12 - (MinY + 4.0)) / (MinY - (MinY + 4.0)), 1.0), 0.0));
  }
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  id v5 = a4;
  double v6 = [(_UITabOutlineView *)self _tabForIndexPath:v5];
  BOOL v7 = [(_UITabOutlineView *)self _isHeaderIndexPath:v5];

  if (v7) {
    int v8 = 0;
  }
  else {
    int v8 = [v6 _isElement];
  }
  if (self) {
    tabModel = self->_tabModel;
  }
  else {
    tabModel = 0;
  }
  if ([(_UITabModel *)tabModel isEditing])
  {
    if ([v6 allowsHiding]) {
      int v10 = [v6 _isGroup] ^ 1;
    }
    else {
      LOBYTE(v10) = 0;
    }
    char v11 = v8 & v10;
  }
  else if (v8)
  {
    char v11 = [(_UITabModel *)self->_tabModel shouldSelectTab:v6];
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  double v6 = [(_UITabOutlineView *)self _tabForIndexPath:a4];
  if ([v6 _isElement] && !self->_ignoresSelectionChangeFromFocusUpdate)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __61___UITabOutlineView_collectionView_didSelectItemAtIndexPath___block_invoke;
    v7[3] = &unk_1E52DA070;
    void v7[4] = self;
    id v8 = v6;
    SEL v9 = a2;
    [(_UITabOutlineView *)self _performWithoutAffectingSelection:v7];
  }
}

- (BOOL)collectionView:(id)a3 shouldDeselectItemAtIndexPath:(id)a4
{
  id v5 = [(_UITabOutlineView *)self _tabForIndexPath:a4];
  if (self) {
    tabModel = self->_tabModel;
  }
  else {
    tabModel = 0;
  }
  if (-[_UITabModel isEditing](tabModel, "isEditing") && [v5 _isElement]) {
    char v7 = [v5 allowsHiding];
  }
  else {
    char v7 = 0;
  }

  return v7;
}

- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4
{
  id v6 = a4;
  if (self) {
    tabModel = self->_tabModel;
  }
  else {
    tabModel = 0;
  }
  if ([(_UITabModel *)tabModel isEditing])
  {
    id v8 = [(_UITabOutlineView *)self activeTransaction];

    if (!v8)
    {
      char v11 = [MEMORY[0x1E4F28B00] currentHandler];
      [v11 handleFailureInMethod:a2 object:self file:@"_UITabOutlineView.m" lineNumber:1677 description:@"Cannot edit an item without an active transaction"];
    }
    SEL v9 = [(_UITabOutlineView *)self _tabForIndexPath:v6];
    int v10 = v9;
    if (v9)
    {
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __63___UITabOutlineView_collectionView_didDeselectItemAtIndexPath___block_invoke;
      v12[3] = &unk_1E52D9F98;
      v12[4] = self;
      id v13 = v9;
      [(_UITabOutlineView *)self _performWithoutAffectingSelection:v12];
    }
  }
}

- (BOOL)collectionView:(id)a3 canPerformPrimaryActionForItemAtIndexPath:(id)a4
{
  id v5 = a4;
  if (self) {
    tabModel = self->_tabModel;
  }
  else {
    tabModel = 0;
  }
  if ([(_UITabModel *)tabModel isEditing])
  {
    BOOL v7 = 0;
  }
  else
  {
    id v8 = [(_UITabOutlineView *)self _tabForIndexPath:v5];
    if ([v8 _isAction])
    {
      BOOL v7 = 1;
    }
    else
    {
      SEL v9 = [(_UITabOutlineView *)self _actionForIndexPath:v5];
      BOOL v7 = v9 != 0;
    }
  }

  return v7;
}

- (void)collectionView:(id)a3 performPrimaryActionForItemAtIndexPath:(id)a4
{
  id v8 = a4;
  id v5 = -[_UITabOutlineView _actionForIndexPath:](self, "_actionForIndexPath:");
  id v6 = v5;
  if (v5)
  {
    [v5 performWithSender:0 target:0];
  }
  else
  {
    BOOL v7 = [(_UITabOutlineView *)self _tabForIndexPath:v8];
    if ([v7 _isAction]) {
      [v7 _performAction];
    }
  }
}

- (BOOL)collectionView:(id)a3 canFocusItemAtIndexPath:(id)a4
{
  id v5 = a4;
  if ([(_UITabOutlineView *)self isEditing])
  {
    id v6 = [(_UITabOutlineView *)self _tabForIndexPath:v5];
    if ([v6 allowsHiding]) {
      char v7 = 1;
    }
    else {
      char v7 = [v6 _isGroup];
    }
  }
  else
  {
    char v7 = 1;
  }

  return v7;
}

- (id)indexPathForPreferredFocusedViewInCollectionView:(id)a3
{
  if (self->_preferredItemIdentifierForFocusAfterCollapse)
  {
    BOOL v4 = [(_UITabOutlineView *)self dataSource];
    id v5 = [v4 indexPathForItemIdentifier:self->_preferredItemIdentifierForFocusAfterCollapse];
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

- (void)collectionView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5
{
  id v11 = a3;
  char v7 = [a4 nextFocusedIndexPath];
  self->_prefersCollectionViewFocused = v7 != 0;
  if ([(_UITabOutlineView *)self isEditing] || !v7)
  {
    self->_ignoresSelectionChangeFromFocusUpdate = 0;
    if (!v7) {
      goto LABEL_6;
    }
  }
  else
  {
    id v8 = [v11 indexPathsForSelectedItems];
    char v9 = [v8 containsObject:v7];

    self->_ignoresSelectionChangeFromFocusUpdate = v9;
  }
  preferredItemIdentifierForFocusAfterCollapse = self->_preferredItemIdentifierForFocusAfterCollapse;
  self->_preferredItemIdentifierForFocusAfterCollapse = 0;

LABEL_6:
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)_UITabOutlineView;
  [(UIView *)&v5 didUpdateFocusInContext:a3 withAnimationCoordinator:a4];
  self->_ignoresSelectionChangeFromFocusUpdate = 0;
}

- (id)preferredFocusEnvironments
{
  v6[1] = *MEMORY[0x1E4F143B8];
  if (self->_prefersCollectionViewFocused)
  {
    id v2 = [(_UITabOutlineView *)self collectionView];
    v6[0] = v2;
    BOOL v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)_UITabOutlineView;
    BOOL v3 = [(UIView *)&v5 preferredFocusEnvironments];
  }
  return v3;
}

- (BOOL)collectionView:(id)a3 shouldSpringLoadItemAtIndexPath:(id)a4 withContext:(id)a5
{
  id v6 = a4;
  if (self) {
    tabModel = self->_tabModel;
  }
  else {
    tabModel = 0;
  }
  if ([(_UITabModel *)tabModel isEditing])
  {
    char v8 = 0;
  }
  else
  {
    char v9 = [(_UITabOutlineView *)self _tabForIndexPath:v6];
    if ([v9 isSpringLoaded])
    {
      if ([v9 _isGroup])
      {
        uint64_t v10 = [v9 identifier];
        id v11 = [(_UITabOutlineView *)self _existingSectionSnapshotForTabIdentifier:v10];

        double v12 = [v9 identifier];
        LOBYTE(v10) = [v11 isExpanded:v12];

        char v8 = v10 ^ 1;
      }
      else
      {
        char v8 = 1;
      }
    }
    else
    {
      char v8 = 0;
    }
  }
  return v8;
}

- (void)hasActiveDrag
{
  if (result)
  {
    uint64_t v1 = [result collectionView];
    uint64_t v2 = [v1 hasActiveDrag];

    return (void *)v2;
  }
  return result;
}

- (id)collectionView:(id)a3 itemsForBeginningDragSession:(id)a4 atIndexPath:(id)a5
{
  id v7 = a4;
  char v8 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v9 = a5;
  id v10 = objc_alloc_init(v8);
  id v11 = [(_UITabOutlineView *)self _tabForIndexPath:v9];

  if (![(_UITabOutlineView *)self isEditing])
  {
    if (self) {
      sidebar = self->_sidebar;
    }
    else {
      sidebar = 0;
    }
    id v13 = -[UITabBarControllerSidebar _itemsForBeginningDragSession:tab:]((uint64_t)sidebar, v7, v11);
    [v10 addObjectsFromArray:v13];
  }
  if (![v10 count] && -[_UITabOutlineView _canDragTab:](self, "_canDragTab:", v11))
  {
    id v14 = objc_alloc_init(MEMORY[0x1E4F28D78]);
    CGRect v15 = [[UIDragItem alloc] initWithItemProvider:v14];
    [(UIDragItem *)v15 setLocalObject:v11];
    [v10 addObject:v15];
    [v7 setLocalContext:self];
  }
  return v10;
}

- (id)collectionView:(id)a3 itemsForAddingToDragSession:(id)a4 atIndexPath:(id)a5 point:(CGPoint)a6
{
  id v8 = a4;
  id v9 = a5;
  if ([(_UITabOutlineView *)self isEditing]
    || ([v8 localContext],
        id v10 = (_UITabOutlineView *)objc_claimAutoreleasedReturnValue(),
        v10,
        v10 == self))
  {
    id v13 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    id v11 = [(_UITabOutlineView *)self _tabForIndexPath:v9];
    if (self) {
      sidebar = self->_sidebar;
    }
    else {
      sidebar = 0;
    }
    id v13 = -[UITabBarControllerSidebar _itemsForAddingToDragSession:tab:]((uint64_t)sidebar, v8, v11);
  }
  return v13;
}

- (BOOL)collectionView:(id)a3 dragSessionAllowsMoveOperation:(id)a4
{
  objc_msgSend(a4, "localContext", a3);
  objc_super v5 = (_UITabOutlineView *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = v5 == self;

  return (char)self;
}

- (void)collectionView:(id)a3 dragSessionWillBegin:(id)a4
{
  id v7 = a4;
  id v6 = [v7 localContext];

  if (v6 == self) {
    objc_storeStrong((id *)&self->_activeDragSession, a4);
  }
}

- (void)collectionView:(id)a3 dragSessionDidEnd:(id)a4
{
  activeDragSessiouint64_t n = self->_activeDragSession;
  self->_activeDragSessiouint64_t n = 0;
}

- (void)collectionView:(id)a3 dropSessionDidEnter:(id)a4
{
  id v12 = a4;
  if (self) {
    tabModel = self->_tabModel;
  }
  else {
    tabModel = 0;
  }
  if ([(_UITabModel *)tabModel isEditing])
  {
    id v6 = [v12 items];
    id v7 = [v6 firstObject];

    id v8 = [v12 items];
    if ([v8 count] == 1)
    {
      id v9 = [v7 localObject];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
      {
LABEL_9:

        goto LABEL_10;
      }
      id v8 = [v7 localObject];
      id v11 = [v7 previewProvider];

      if (v11) {
        [v7 setPreviewProvider:0];
      }
    }

    goto LABEL_9;
  }
LABEL_10:
}

- (void)collectionView:(id)a3 dropSessionDidEnd:(id)a4
{
  id v5 = a4;
  id v6 = [(_UITabOutlineView *)self _tabBarController];
  -[UITabBarController _tabDropSessionDidUpdate:withDestinationTab:](v6, v5, 0);
}

- (BOOL)collectionView:(id)a3 canHandleDropSession:(id)a4
{
  return 1;
}

- (id)collectionView:(id)a3 targetIndexPathForMoveOfItemFromOriginalIndexPath:(id)a4 atCurrentIndexPath:(id)a5 toProposedIndexPath:(id)a6
{
  id v8 = a4;
  id v9 = a6;
  id v10 = [(_UITabOutlineView *)self _tabForIndexPath:v8];
  if ([(_UITabOutlineView *)self _canMoveTab:v10 toDestinationIndexPath:v9]) {
    id v11 = v9;
  }
  else {
    id v11 = v8;
  }
  id v12 = v11;

  return v12;
}

- (id)collectionView:(id)a3 dropSessionDidUpdate:(id)a4 withDestinationIndexPath:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if (self) {
    tabModel = self->_tabModel;
  }
  else {
    tabModel = 0;
  }
  BOOL v10 = [(_UITabModel *)tabModel isEditing];
  BOOL v11 = v10;
  if (v8)
  {
    id v12 = [v7 localDragSession];
    if (v12)
    {
      id v13 = [v7 localDragSession];
      if (self) {
        activeDragSessiouint64_t n = self->_activeDragSession;
      }
      else {
        activeDragSessiouint64_t n = 0;
      }
      BOOL v15 = v13 == activeDragSession;
    }
    else
    {
      BOOL v15 = 0;
    }

    if (v11 || v15)
    {
LABEL_12:
      CGRect v16 = [v7 items];
      id v17 = [v16 firstObject];

      double v18 = [v7 localDragSession];
      id v19 = [v18 localContext];

      if (v19 != self)
      {
LABEL_13:
        char v20 = 0;
LABEL_23:

        goto LABEL_28;
      }
      id v28 = [v7 items];
      if ([v28 count] != 1) {
        goto LABEL_21;
      }
      BOOL v29 = [v17 localObject];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0) {
        goto LABEL_13;
      }
      id v28 = [v17 localObject];
      if ([(_UITabOutlineView *)self _canMoveTab:v28 toDestinationIndexPath:v8])
      {
        char v20 = [[UICollectionViewDropProposal alloc] initWithDropOperation:3 dropLocation:0];
      }
      else
      {
LABEL_21:
        char v20 = 0;
      }

      goto LABEL_23;
    }
    id v21 = [(_UITabOutlineView *)self _sidebarContentForIndexPath:v8];
    if (v21)
    {
      id v17 = v21;
      id v22 = [v21 tab];

      if (v22)
      {
        BOOL v23 = [(_UITabOutlineView *)self _tabBarController];
        char v24 = [v17 tab];
        uint64_t v25 = (uint64_t)-[UITabBarController _tab:operationForAcceptingItemsFromDropSession:](v23, v24, v7);

        long long v26 = [(_UITabOutlineView *)self _tabBarController];
        long long v27 = [v17 tab];
        -[UITabBarController _tabDropSessionDidUpdate:withDestinationTab:](v26, v7, v27);
      }
      else
      {
        if (self) {
          sidebar = self->_sidebar;
        }
        else {
          sidebar = 0;
        }
        BOOL v32 = sidebar;
        long long v26 = [v17 action];
        long long v27 = [v17 group];
        uint64_t v25 = -[UITabBarControllerSidebar _sidebarAction:group:operationForAcceptingItemsFromDropSession:]((uint64_t)v32, v26, v27, v7);
      }
      char v20 = [[UICollectionViewDropProposal alloc] initWithDropOperation:v25 dropLocation:1];
LABEL_28:

      if (v20) {
        goto LABEL_30;
      }
    }
  }
  else if (v10)
  {
    goto LABEL_12;
  }
  char v20 = [[UICollectionViewDropProposal alloc] initWithDropOperation:0];
LABEL_30:

  return v20;
}

- (void)collectionView:(id)a3 performDropWithCoordinator:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  if (self) {
    tabModel = self->_tabModel;
  }
  else {
    tabModel = 0;
  }
  if (![(_UITabModel *)tabModel isEditing])
  {
    id v7 = [v5 proposal];
    uint64_t v8 = [v7 dropLocation];

    if (v8)
    {
      id v9 = [v5 destinationIndexPath];
      if (v9)
      {
        BOOL v10 = [(_UITabOutlineView *)self collectionView];
        BOOL v11 = [v10 cellForItemAtIndexPath:v9];

        id v12 = [v5 session];
        [v12 locationInView:v11];
        double v14 = v13;
        double v16 = v15;

        id v17 = [(_UITabOutlineView *)self _sidebarContentForIndexPath:v9];
        double v18 = [v17 tab];

        if (v18)
        {
          id v19 = [(_UITabOutlineView *)self _tabBarController];
          char v20 = [v17 tab];
          id v21 = [v5 session];
          -[UITabBarController _tab:acceptItemsFromDropSession:](v19, v20, v21);
        }
        else
        {
          if (self) {
            sidebar = self->_sidebar;
          }
          else {
            sidebar = 0;
          }
          BOOL v23 = sidebar;
          id v19 = [v17 action];
          char v20 = [v17 group];
          id v21 = [v5 session];
          -[UITabBarControllerSidebar _sidebarAction:group:acceptItemsFromDropSession:]((uint64_t)v23, v19, v20, v21);
        }
        long long v33 = 0u;
        long long v34 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        char v24 = objc_msgSend(v5, "session", 0);
        uint64_t v25 = [v24 items];

        uint64_t v26 = [v25 countByEnumeratingWithState:&v31 objects:v35 count:16];
        if (v26)
        {
          uint64_t v27 = v26;
          uint64_t v28 = *(void *)v32;
          do
          {
            for (uint64_t i = 0; i != v27; ++i)
            {
              if (*(void *)v32 != v28) {
                objc_enumerationMutation(v25);
              }
              id v30 = (id)objc_msgSend(v5, "dropItem:intoItemAtIndexPath:rect:", *(void *)(*((void *)&v31 + 1) + 8 * i), v9, v14, v16, 0.0, 0.0);
            }
            uint64_t v27 = [v25 countByEnumeratingWithState:&v31 objects:v35 count:16];
          }
          while (v27);
        }
      }
    }
  }
}

- (id)collectionView:(id)a3 contextMenuConfigurationForItemsAtIndexPaths:(id)a4 point:(CGPoint)a5
{
  id v6 = a4;
  if (self) {
    tabModel = self->_tabModel;
  }
  else {
    tabModel = 0;
  }
  if (-[_UITabModel isEditing](tabModel, "isEditing") || [v6 count] != 1)
  {
    BOOL v11 = 0;
  }
  else
  {
    uint64_t v8 = [v6 objectAtIndex:0];
    id v9 = [(_UITabOutlineView *)self _tabForIndexPath:v8];
    if (v9)
    {
      if (self) {
        sidebar = self->_sidebar;
      }
      else {
        sidebar = 0;
      }
      BOOL v11 = -[UITabBarControllerSidebar _contextMenuConfigurationForTab:]((uint64_t)sidebar, v9);
      [v11 _setTab:v9];
    }
    else
    {
      BOOL v11 = 0;
    }
  }
  return v11;
}

- (void)collectionView:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  BOOL v11 = [v9 _tab];

  if (v11)
  {
    id v12 = [(_UITabOutlineView *)self dataSource];
    double v13 = [v9 _tab];
    double v14 = [v13 identifier];
    double v15 = [v12 indexPathForItemIdentifier:v14];

    if (v15)
    {
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __94___UITabOutlineView_collectionView_willPerformPreviewActionForMenuWithConfiguration_animator___block_invoke;
      v17[3] = &unk_1E52DCB30;
      v17[4] = self;
      id v18 = v15;
      id v19 = v8;
      id v16 = v15;
      [v10 addAnimations:v17];
    }
  }
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = (id *)v7;
    id v10 = v9;
    if (v9)
    {
      id v11 = v9[109];
      id v12 = v11;
      if (v11)
      {
        self->_didUpdateWillDisplayTab = 0;
        double v13 = [v11 _tab];
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        v14[2] = __71___UITabOutlineView_collectionView_willDisplayCell_forItemAtIndexPath___block_invoke;
        v14[3] = &unk_1E5310C70;
        v14[4] = self;
        double v15 = v10;
        id v16 = v15;
        id v17 = v8;
        [(_UITabOutlineView *)self _performWithWillDisplayTab:v13 block:v14];
      }
    }
    else
    {
      id v12 = 0;
    }
  }
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v12 = (id *)a4;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v7 = v12;
  if (isKindOfClass)
  {
    if (v12)
    {
      id v8 = v12[109];
      if (v8)
      {
        if (self) {
          sidebar = self->_sidebar;
        }
        else {
          sidebar = 0;
        }
        id v10 = sidebar;
        id v11 = [v8 _tab];
        -[UITabBarControllerSidebar _didEndDisplayingTab:]((uint64_t)v10, v11);
      }
    }
    else
    {
      id v8 = 0;
    }

    id v7 = v12;
  }
}

- (BOOL)_canMoveTab:(id)a3 toDestinationIndexPath:(id)a4
{
  if (a4)
  {
    id v6 = a4;
    id v7 = a3;
    id v8 = [(_UITabOutlineView *)self _tabForIndexPath:v6];
    BOOL v9 = [(_UITabOutlineView *)self _isHeaderIndexPath:v6];

    int v10 = !v9;
    LODWORD(v6) = [v8 _canBeReordered];
    id v11 = [v8 _parentGroup];
    id v12 = [v7 _parentGroup];

    BOOL v13 = (v11 == v12) & ~[v8 _isAction] & v6 & v10;
    double v14 = [(_UITabOutlineView *)self dataSource];
    double v15 = [v8 identifier];
    id v16 = [v14 indexPathForItemIdentifier:v15];

    if (self && (id v17 = self->_displayedGroup) != 0)
    {
    }
    else if (![v16 section])
    {
      LOBYTE(v13) = 0;
    }
  }
  else
  {
    LOBYTE(v13) = 0;
  }
  return v13;
}

- (_UIDuoShadowView)shadowView
{
  return self->_shadowView;
}

- (UINavigationItem)navigationItem
{
  return self->_navigationItem;
}

- (UINavigationBar)navigationBar
{
  return self->_navigationBar;
}

- (UIVisualEffectView)backgroundView
{
  return self->_backgroundView;
}

- (_UIVisualEffectBackdropView)backgroundCaptureView
{
  return self->_backgroundCaptureView;
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (UICollectionViewDiffableDataSource)dataSource
{
  return self->_dataSource;
}

- (NSMutableDictionary)contentByIdentifier
{
  return self->_contentByIdentifier;
}

- (NSMutableSet)collapsedSectionIdentifiers
{
  return self->_collapsedSectionIdentifiers;
}

- (NSMutableSet)editingCollapsedSectionIdentifiers
{
  return self->_editingCollapsedSectionIdentifiers;
}

- (_UIGroupCompletion)dataSourceUpdateGroupCompletion
{
  return self->_dataSourceUpdateGroupCompletion;
}

- (NSMutableSet)updatedTabsDuringApplySnapshot
{
  return self->_updatedTabsDuringApplySnapshot;
}

- (UITab)willDisplayTab
{
  return self->_willDisplayTab;
}

- (BOOL)didUpdateWillDisplayTab
{
  return self->_didUpdateWillDisplayTab;
}

- (BOOL)isEditing
{
  return self->_editing;
}

- (UIBarButtonItem)sidebarBarButtonItem
{
  return self->_sidebarBarButtonItem;
}

- (UIBarButtonItem)resetBarButtonItem
{
  return self->_resetBarButtonItem;
}

- (_UITabSidebarBottomBarWrapperView)bottomBarView
{
  return self->_bottomBarView;
}

- (void)setBottomBarView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bottomBarView, 0);
  objc_storeStrong((id *)&self->_resetBarButtonItem, 0);
  objc_storeStrong((id *)&self->_sidebarBarButtonItem, 0);
  objc_storeStrong((id *)&self->_willDisplayTab, 0);
  objc_storeStrong((id *)&self->_updatedTabsDuringApplySnapshot, 0);
  objc_storeStrong((id *)&self->_dataSourceUpdateGroupCompletion, 0);
  objc_storeStrong((id *)&self->_editingCollapsedSectionIdentifiers, 0);
  objc_storeStrong((id *)&self->_collapsedSectionIdentifiers, 0);
  objc_storeStrong((id *)&self->_contentByIdentifier, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_backgroundCaptureView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_navigationBar, 0);
  objc_storeStrong((id *)&self->_navigationItem, 0);
  objc_storeStrong((id *)&self->_shadowView, 0);
  objc_storeStrong((id *)&self->_activeDragSession, 0);
  objc_storeStrong((id *)&self->_overrideBackgroundEffect, 0);
  objc_storeStrong((id *)&self->_sidebarButtonAction, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_displayedGroup, 0);
  objc_storeStrong((id *)&self->_tabModel, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_preferredItemIdentifierForFocusAfterCollapse, 0);
}

@end