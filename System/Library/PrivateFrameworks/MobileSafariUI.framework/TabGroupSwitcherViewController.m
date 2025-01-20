@interface TabGroupSwitcherViewController
- (BOOL)capsuleCollectionViewShouldFocusSelectedItem:(id)a3;
- (BOOL)containerView:(id)a3 shouldDismantleChildView:(id)a4 atIndex:(int64_t)a5;
- (TabContainerView)view;
- (TabController)tabController;
- (TabGroupSwitcherViewController)initWithTabController:(id)a3;
- (TabGroupSwitcherViewControllerDelegate)delegate;
- (id)_dragPreviewForCapsuleView:(uint64_t)a1;
- (id)capsuleCollectionView:(id)a3 contentViewForItemAtIndex:(int64_t)a4;
- (id)containerView:(id)a3 childViewAtIndex:(int64_t)a4;
- (id)contextMenuInteraction:(id)a3 configuration:(id)a4 dismissalPreviewForItemWithIdentifier:(id)a5;
- (id)contextMenuInteraction:(id)a3 configuration:(id)a4 highlightPreviewForItemWithIdentifier:(id)a5;
- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4;
- (id)createToolbarForCapsuleCollectionView:(id)a3;
- (int64_t)numberOfChildrenForContainerView:(id)a3;
- (unint64_t)numberOfItemsInCapsuleCollectionView:(id)a3;
- (void)activeTabGroupDidChange;
- (void)adjustDiscreteAnimationCount:(void *)result;
- (void)capsuleCollectionView:(id)a3 didBeginSelectionGestureOnAxis:(unint64_t)a4;
- (void)capsuleCollectionView:(id)a3 didSelectItemAtIndex:(int64_t)a4;
- (void)capsuleCollectionView:(id)a3 didUpdateProgress:(double)a4 toSelectItemAtIndex:(int64_t)a5 progressToTopAction:(double)a6 snapToAxis:(unint64_t)a7;
- (void)capsuleCollectionView:(id)a3 willEndSelectionGestureWithCoordinator:(id)a4;
- (void)capsuleCollectionView:(id)a3 willSelectItemAtIndex:(int64_t)a4 coordinator:(id)a5;
- (void)closeAllTabs:(id)a3;
- (void)containerView:(id)a3 dismantleChildView:(id)a4;
- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5;
- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5;
- (void)createTab:(id)a3;
- (void)dismissTabSwitcher:(id)a3;
- (void)presentTabGroups:(id)a3;
- (void)recenterViews;
- (void)reloadTabGroup:(id)a3;
- (void)reloadTabGroups;
- (void)setDelegate:(id)a3;
- (void)tabCollectionViewWillPresent:(id)a3;
- (void)tabOverview:(id)a3 didUpdateScalePercentageForActiveItem:(double)a4;
- (void)updateToolbarButtons;
- (void)viewDidLayoutSubviews;
@end

@implementation TabGroupSwitcherViewController

- (TabGroupSwitcherViewController)initWithTabController:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)TabGroupSwitcherViewController;
  v6 = [(TabGroupSwitcherViewController *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_tabController, a3);
    tabGroups = v7->_tabGroups;
    v7->_tabGroups = (NSArray *)MEMORY[0x1E4F1CBF0];

    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    tabGroupIDToTabViewAdaptorMap = v7->_tabGroupIDToTabViewAdaptorMap;
    v7->_tabGroupIDToTabViewAdaptorMap = v9;

    v11 = v7;
  }

  return v7;
}

- (TabContainerView)view
{
  view = self->_view;
  if (!view)
  {
    v4 = (TabGroupSwitcherView *)-[TabGroupSwitcherView initWithTabGroupSwitcher:]((id *)[TabGroupSwitcherView alloc], self);
    id v5 = self->_view;
    self->_view = v4;

    view = self->_view;
  }
  return (TabContainerView *)view;
}

- (void)viewDidLayoutSubviews
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v2 = *(void *)(a1 + 72);
    v3 = v2 ? *(void **)(v2 + 440) : 0;
    [v3 obscuredInsetsForState:0 ignoringKeyboard:1];
    if (*(double *)(a1 + 32) != v4)
    {
      double v5 = v4;
      *(double *)(a1 + 32) = v4;
      v6 = [*(id *)(a1 + 88) tabCollectionViewProvider];
      v7 = [v6 tabThumbnailCollectionView];

      if (objc_opt_respondsToSelector()) {
        [v7 setAlternateBottomSafeAreaInset:v5];
      }
      long long v16 = 0u;
      long long v17 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      v8 = objc_msgSend(*(id *)(a1 + 56), "objectEnumerator", 0);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v15;
        do
        {
          uint64_t v12 = 0;
          do
          {
            if (*(void *)v15 != v11) {
              objc_enumerationMutation(v8);
            }
            objc_super v13 = [*(id *)(*((void *)&v14 + 1) + 8 * v12) tabOverview];
            [v13 setAlternateBottomSafeAreaInset:v5];

            ++v12;
          }
          while (v10 != v12);
          uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
        }
        while (v10);
      }
    }
  }
}

- (void)reloadTabGroups
{
  if (!self->_ignoreReloadData)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    double v4 = [(TabController *)self->_tabController privateTabGroupIfAvailable];
    objc_msgSend(v3, "safari_addObjectUnlessNil:", v4);

    double v5 = [(TabController *)self->_tabController unnamedTabGroup];
    objc_msgSend(v3, "safari_addObjectUnlessNil:", v5);

    v6 = [(TabController *)self->_tabController namedTabGroups];
    [v3 addObjectsFromArray:v6];

    v7 = (NSArray *)[v3 copy];
    tabGroups = self->_tabGroups;
    self->_tabGroups = v7;

    uint64_t v9 = self->_tabGroups;
    uint64_t v10 = [(TabController *)self->_tabController activeTabGroup];
    uint64_t v11 = [(NSArray *)v9 indexOfObject:v10];

    view = self->_view;
    if (view) {
      containerView = view->_containerView;
    }
    else {
      containerView = 0;
    }
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __49__TabGroupSwitcherViewController_reloadTabGroups__block_invoke;
    v16[3] = &__block_descriptor_40_e8_q16__0q8l;
    v16[4] = v11;
    [(SFTabViewContainerView *)containerView reloadDataWithPostUpdateActions:v16];
    long long v14 = self->_view;
    if (v14) {
      long long v14 = (TabGroupSwitcherView *)v14->_capsuleView;
    }
    long long v15 = v14;
    [(TabGroupSwitcherView *)v15 reloadData];
    if (v11 != 0x7FFFFFFFFFFFFFFFLL) {
      [(TabGroupSwitcherView *)v15 setSelectedItemIndex:v11];
    }
    -[TabGroupSwitcherViewController updateToolbarButtons]((id *)&self->super.isa);
  }
}

uint64_t __49__TabGroupSwitcherViewController_reloadTabGroups__block_invoke(uint64_t a1)
{
  return *(void *)(a1 + 32);
}

- (void)updateToolbarButtons
{
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained(a1 + 10);
    if ((objc_opt_respondsToSelector() & 1) != 0
      && [WeakRetained tabGroupSwitcherCanShowProfileInToolbar:a1])
    {
      uint64_t v2 = [a1[11] activeProfile];
      id v3 = +[ToolbarItemConfiguration configurationForProfile:v2];
    }
    else
    {
      id v3 = +[ToolbarItemConfiguration configurationForTabGroupPicker];
    }
    [v3 setEmphasized:0];
    [a1[8] setTabGroupButtonConfiguration:v3];
  }
}

- (void)reloadTabGroup:(id)a3
{
  NSUInteger v4 = [(NSArray *)self->_tabGroups indexOfObject:a3];
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v9 = [MEMORY[0x1E4F28D60] indexSetWithIndex:v4];
    view = self->_view;
    if (view) {
      containerView = view->_containerView;
    }
    else {
      containerView = 0;
    }
    [(SFTabViewContainerView *)containerView reloadViewsAtIndexes:v9];
    v7 = self->_view;
    if (v7) {
      capsuleView = v7->_capsuleView;
    }
    else {
      capsuleView = 0;
    }
    [(SFCapsuleCollectionView *)capsuleView reloadItemsAtIndexes:v9];
  }
}

- (void)activeTabGroupDidChange
{
  if (!self->_activeAnimationCount) {
    -[TabGroupSwitcherViewController recenterViews]((uint64_t)self);
  }
}

- (void)recenterViews
{
  if (a1)
  {
    uint64_t v2 = *(void **)(a1 + 40);
    id v3 = [*(id *)(a1 + 88) activeTabGroup];
    uint64_t v4 = [v2 indexOfObject:v3];

    if (v4 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v5 = *(void *)(a1 + 72);
      if (v5) {
        v6 = *(void **)(v5 + 448);
      }
      else {
        v6 = 0;
      }
      [v6 revealChildAtIndex:v4];
      uint64_t v7 = *(void *)(a1 + 72);
      if (v7) {
        v8 = *(void **)(v7 + 440);
      }
      else {
        v8 = 0;
      }
      [v8 setSelectedItemIndex:v4];
    }
  }
}

- (void)closeAllTabs:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained closeAllTabsForTabGroupSwitcher:self];
  }
}

- (void)createTab:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained openNewTabForTabGroupSwitcher:self];
  }
}

- (void)presentTabGroups:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained presentTabGroupSheetForTabGroupSwitcher:self];
  }
}

- (void)dismissTabSwitcher:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained dismissTabGroupSwitcher:self];
  }
}

- (void)tabCollectionViewWillPresent:(id)a3
{
  if ([(NSArray *)self->_tabGroups count])
  {
    view = self->_view;
    if (view) {
      containerView = view->_containerView;
    }
    else {
      containerView = 0;
    }
    [(SFTabViewContainerView *)containerView reloadViewsAtIndexes:0];
  }
  else
  {
    [(TabGroupSwitcherViewController *)self reloadTabGroups];
  }
}

- (void)tabOverview:(id)a3 didUpdateScalePercentageForActiveItem:(double)a4
{
  view = self->_view;
  if (view)
  {
    double v5 = fmax(fmin(a4, 1.0), 0.0);
    if (view->_tabViewPresentationProgress != v5)
    {
      view->_tabViewPresentationProgress = v5;
      [(TabGroupSwitcherView *)view setNeedsLayout];
    }
  }
}

- (int64_t)numberOfChildrenForContainerView:(id)a3
{
  return [(NSArray *)self->_tabGroups count];
}

- (id)containerView:(id)a3 childViewAtIndex:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [(NSArray *)self->_tabGroups objectAtIndexedSubscript:a4];
  v8 = [(TabController *)self->_tabController activeTabGroup];
  int v9 = WBSIsEqual();

  if (v9)
  {
    uint64_t v10 = [(TabController *)self->_tabController tabCollectionViewProvider];
    uint64_t v11 = [v10 tabThumbnailCollectionView];

    if (objc_opt_respondsToSelector()) {
      [(TabOverviewDataSourceAdaptor *)v11 setAlternateBottomSafeAreaInset:self->_lastBottomInset];
    }
    uint64_t v12 = [(TabOverviewDataSourceAdaptor *)v11 view];
  }
  else
  {
    tabGroupIDToTabViewAdaptorMap = self->_tabGroupIDToTabViewAdaptorMap;
    if (!tabGroupIDToTabViewAdaptorMap)
    {
      long long v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      long long v15 = self->_tabGroupIDToTabViewAdaptorMap;
      self->_tabGroupIDToTabViewAdaptorMap = v14;

      tabGroupIDToTabViewAdaptorMap = self->_tabGroupIDToTabViewAdaptorMap;
    }
    long long v16 = [v7 uuid];
    uint64_t v11 = [(NSMutableDictionary *)tabGroupIDToTabViewAdaptorMap objectForKeyedSubscript:v16];

    if (!v11)
    {
      long long v17 = [[TabOverviewDataSourceAdaptor alloc] initWithTabGroup:v7 tabController:self->_tabController];
      v18 = (void *)MEMORY[0x1E4FB1EB0];
      uint64_t v25 = MEMORY[0x1E4F143A8];
      uint64_t v26 = 3221225472;
      v27 = __65__TabGroupSwitcherViewController_containerView_childViewAtIndex___block_invoke;
      v28 = &unk_1E6D77D90;
      id v29 = v6;
      uint64_t v11 = v17;
      v30 = v11;
      [v18 performWithoutAnimation:&v25];
      uint64_t v19 = self->_tabGroupIDToTabViewAdaptorMap;
      v20 = objc_msgSend(v7, "uuid", v25, v26, v27, v28);
      [(NSMutableDictionary *)v19 setObject:v11 forKeyedSubscript:v20];
    }
    double lastBottomInset = self->_lastBottomInset;
    v22 = [(TabOverviewDataSourceAdaptor *)v11 tabOverview];
    [v22 setAlternateBottomSafeAreaInset:lastBottomInset];

    uint64_t v12 = [(TabOverviewDataSourceAdaptor *)v11 tabOverview];
  }
  v23 = (void *)v12;

  return v23;
}

void __65__TabGroupSwitcherViewController_containerView_childViewAtIndex___block_invoke(uint64_t a1)
{
  uint64_t v2 = [TabOverview alloc];
  [*(id *)(a1 + 32) bounds];
  id v3 = -[TabOverview initWithFrame:](v2, "initWithFrame:");
  [(TabOverview *)v3 setBarPlacement:2];
  [(TabOverview *)v3 setUserInteractionEnabled:0];
  [*(id *)(a1 + 40) setTabOverview:v3];
  [(TabOverview *)v3 presentAnimated:0];
}

- (BOOL)containerView:(id)a3 shouldDismantleChildView:(id)a4 atIndex:(int64_t)a5
{
  tabController = self->_tabController;
  id v7 = a4;
  v8 = [(TabController *)tabController tabCollectionViewProvider];
  int v9 = [v8 tabThumbnailCollectionView];
  id v10 = [v9 view];

  return v10 != v7 && !self->_hasActiveUserInteraction && self->_activeAnimationCount == 0;
}

- (void)containerView:(id)a3 dismantleChildView:(id)a4
{
  id v5 = a4;
  id v6 = [(TabController *)self->_tabController tabCollectionViewProvider];
  id v7 = [v6 tabThumbnailCollectionView];
  id v8 = [v7 view];

  if (v8 != v5)
  {
    int v9 = [(NSMutableDictionary *)self->_tabGroupIDToTabViewAdaptorMap allValues];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __67__TabGroupSwitcherViewController_containerView_dismantleChildView___block_invoke;
    v14[3] = &unk_1E6D7B660;
    id v15 = v5;
    id v10 = objc_msgSend(v9, "safari_firstObjectPassingTest:", v14);

    if (v10)
    {
      tabGroupIDToTabViewAdaptorMap = self->_tabGroupIDToTabViewAdaptorMap;
      uint64_t v12 = [v10 tabGroup];
      objc_super v13 = [v12 uuid];
      [(NSMutableDictionary *)tabGroupIDToTabViewAdaptorMap setObject:0 forKeyedSubscript:v13];
    }
  }
}

BOOL __67__TabGroupSwitcherViewController_containerView_dismantleChildView___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 tabOverview];
  BOOL v4 = v3 == *(void **)(a1 + 32);

  return v4;
}

- (unint64_t)numberOfItemsInCapsuleCollectionView:(id)a3
{
  return [(NSArray *)self->_tabGroups count];
}

- (id)capsuleCollectionView:(id)a3 contentViewForItemAtIndex:(int64_t)a4
{
  id v6 = objc_msgSend(a3, "createOrDequeueContentViewWithIdentifier:atIndex:", @"tab-group");
  id v7 = [(NSArray *)self->_tabGroups objectAtIndexedSubscript:a4];
  id v8 = [v7 displayTitle];
  [v6 setTitle:v8];

  return v6;
}

- (void)adjustDiscreteAnimationCount:(void *)result
{
  if (result)
  {
    uint64_t v2 = result[2] + a2;
    result[1] += a2;
    result[2] = v2;
    uint64_t v3 = result[9];
    if (v3) {
      BOOL v4 = *(void **)(v3 + 448);
    }
    else {
      BOOL v4 = 0;
    }
    return (void *)[v4 setExtendsVisibleRange:v2 != 0];
  }
  return result;
}

- (void)capsuleCollectionView:(id)a3 willSelectItemAtIndex:(int64_t)a4 coordinator:(id)a5
{
  if (!self->_hasActiveUserInteraction)
  {
    id v7 = a5;
    -[TabGroupSwitcherViewController adjustDiscreteAnimationCount:](self, 1);
    view = self->_view;
    if (view) {
      view = (TabGroupSwitcherView *)view->_containerView;
    }
    int v9 = view;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __90__TabGroupSwitcherViewController_capsuleCollectionView_willSelectItemAtIndex_coordinator___block_invoke;
    v12[3] = &unk_1E6D7B688;
    objc_super v13 = v9;
    int64_t v14 = a4;
    id v10 = v9;
    [v7 addAnimations:v12];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __90__TabGroupSwitcherViewController_capsuleCollectionView_willSelectItemAtIndex_coordinator___block_invoke_2;
    v11[3] = &unk_1E6D77E20;
    v11[4] = self;
    [v7 addCompletion:v11];
  }
}

uint64_t __90__TabGroupSwitcherViewController_capsuleCollectionView_willSelectItemAtIndex_coordinator___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) revealChildAtIndex:*(void *)(a1 + 40)];
}

void *__90__TabGroupSwitcherViewController_capsuleCollectionView_willSelectItemAtIndex_coordinator___block_invoke_2(uint64_t a1)
{
  return -[TabGroupSwitcherViewController adjustDiscreteAnimationCount:](*(void **)(a1 + 32), -1);
}

- (void)capsuleCollectionView:(id)a3 didSelectItemAtIndex:(int64_t)a4
{
  if (!self->_hasActiveUserInteraction)
  {
    id v5 = [(NSArray *)self->_tabGroups objectAtIndexedSubscript:a4];
    id v6 = [v5 uuid];

    id v7 = [(TabController *)self->_tabController activeTabGroupUUID];
    char v8 = WBSIsEqual();

    if ((v8 & 1) == 0)
    {
      int v9 = (void *)MEMORY[0x1E4FB1EB0];
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __77__TabGroupSwitcherViewController_capsuleCollectionView_didSelectItemAtIndex___block_invoke;
      v10[3] = &unk_1E6D77D90;
      v10[4] = self;
      id v11 = v6;
      [v9 performWithoutAnimation:v10];
    }
  }
}

void __77__TabGroupSwitcherViewController_capsuleCollectionView_didSelectItemAtIndex___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 88) tabCollectionViewProvider];
  uint64_t v3 = [v2 tabOverview];

  if (v3)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __77__TabGroupSwitcherViewController_capsuleCollectionView_didSelectItemAtIndex___block_invoke_2;
    v13[3] = &unk_1E6D77D90;
    BOOL v4 = *(void **)(a1 + 40);
    v13[4] = *(void *)(a1 + 32);
    id v5 = &v14;
    id v14 = v4;
    [v3 performUpdatesWithoutTabCloseAnimation:v13];
  }
  else
  {
    id v6 = (void *)MEMORY[0x1E4FB1EB0];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __77__TabGroupSwitcherViewController_capsuleCollectionView_didSelectItemAtIndex___block_invoke_3;
    v11[3] = &unk_1E6D77D90;
    id v7 = *(void **)(a1 + 40);
    v11[4] = *(void *)(a1 + 32);
    id v5 = &v12;
    id v12 = v7;
    [v6 performWithoutAnimation:v11];
  }

  char v8 = *(void **)(*(void *)(a1 + 32) + 72);
  if (v8) {
    char v8 = (void *)v8[56];
  }
  int v9 = v8;
  id v10 = [v9 visibleChildIndexes];
  [v9 reloadViewsAtIndexes:v10];
}

uint64_t __77__TabGroupSwitcherViewController_capsuleCollectionView_didSelectItemAtIndex___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 88) setActiveTabGroupUUID:*(void *)(a1 + 40)];
}

uint64_t __77__TabGroupSwitcherViewController_capsuleCollectionView_didSelectItemAtIndex___block_invoke_3(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 88) setActiveTabGroupUUID:*(void *)(a1 + 40)];
}

- (BOOL)capsuleCollectionViewShouldFocusSelectedItem:(id)a3
{
  return 0;
}

- (id)createToolbarForCapsuleCollectionView:(id)a3
{
  toolbar = self->_toolbar;
  if (toolbar)
  {
    BOOL v4 = toolbar;
  }
  else
  {
    id v6 = objc_alloc_init(TabOverviewToolbar);
    id v7 = self->_toolbar;
    self->_toolbar = v6;

    [(TabOverviewToolbar *)self->_toolbar setBackgroundHidden:1];
    [(TabOverviewToolbar *)self->_toolbar setTabGroupButtonDisplayStyle:1];
    [(TabOverviewToolbar *)self->_toolbar setPlacement:1];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __72__TabGroupSwitcherViewController_createToolbarForCapsuleCollectionView___block_invoke;
    v20[3] = &unk_1E6D7B6D8;
    v20[4] = self;
    char v8 = objc_msgSend(MEMORY[0x1E4FB1970], "safari_menuWithUncachedChildrenProvider:", v20);
    int v9 = self->_toolbar;
    id v10 = objc_msgSend(MEMORY[0x1E4FB13F0], "safari_actionWithTarget:selector:", self, sel_createTab_);
    [(TabOverviewToolbar *)v9 addPrimaryAction:v10 forBarButton:1];

    [(TabOverviewToolbar *)self->_toolbar setMenu:v8 forBarButton:1];
    id v11 = self->_toolbar;
    id v12 = objc_msgSend(MEMORY[0x1E4FB13F0], "safari_actionWithTarget:selector:", self, sel_presentTabGroups_);
    [(TabOverviewToolbar *)v11 addPrimaryAction:v12 forBarButton:0];

    objc_super v13 = self->_toolbar;
    id v14 = [(TabController *)self->_tabController tabGroupsMenuForTabGroupButton:1];
    [(TabOverviewToolbar *)v13 setMenu:v14 forBarButton:0];

    [(TabOverviewToolbar *)self->_toolbar setBarButton:0 enabled:1];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __72__TabGroupSwitcherViewController_createToolbarForCapsuleCollectionView___block_invoke_3;
    v19[3] = &unk_1E6D7B6D8;
    v19[4] = self;
    id v15 = objc_msgSend(MEMORY[0x1E4FB1970], "safari_menuWithUncachedChildrenProvider:", v19);
    long long v16 = self->_toolbar;
    long long v17 = objc_msgSend(MEMORY[0x1E4FB13F0], "safari_actionWithTarget:selector:", self, sel_dismissTabSwitcher_);
    [(TabOverviewToolbar *)v16 addPrimaryAction:v17 forBarButton:2];

    [(TabOverviewToolbar *)self->_toolbar setMenu:v15 forBarButton:2];
    -[TabGroupSwitcherViewController updateToolbarButtons]((id *)&self->super.isa);
    BOOL v4 = self->_toolbar;
  }
  return v4;
}

id __72__TabGroupSwitcherViewController_createToolbarForCapsuleCollectionView___block_invoke(uint64_t a1)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  if ([*(id *)(*(void *)(a1 + 32) + 88) isPrivateBrowsingEnabled])
  {
    uint64_t v2 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __72__TabGroupSwitcherViewController_createToolbarForCapsuleCollectionView___block_invoke_2;
    v8[3] = &unk_1E6D7B6B0;
    v8[4] = *(void *)(a1 + 32);
    uint64_t v3 = (void *)MEMORY[0x1E4E42950](v8);
    BOOL v4 = (void *)MEMORY[0x1E4FB1970];
    id v5 = [*(id *)(*(void *)(a1 + 32) + 88) activeProfile];
    id v6 = objc_msgSend(v4, "safari_recentlyClosedTabsMenuForProfile:showProfileTitle:openHandler:", v5, objc_msgSend(*(id *)(*(void *)(a1 + 32) + 88), "hasMultipleProfiles"), v3);
    v9[0] = v6;
    uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  }
  return v2;
}

void __72__TabGroupSwitcherViewController_createToolbarForCapsuleCollectionView___block_invoke_2(uint64_t a1, uint64_t a2)
{
  [*(id *)(*(void *)(a1 + 32) + 88) insertTabDocumentFromTabStateData:a2];
  id v4 = [MEMORY[0x1E4F97E48] sharedLogger];
  uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 88) tabCollectionViewProvider];
  objc_msgSend(v4, "didOpenNewTabWithURLWithTrigger:tabCollectionViewType:", 4, objc_msgSend(v3, "visibleTabCollectionViewType"));
}

id __72__TabGroupSwitcherViewController_createToolbarForCapsuleCollectionView___block_invoke_3(uint64_t a1)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  if ([*(id *)(*(void *)(a1 + 32) + 88) isPrivateBrowsingAndLocked])
  {
    v1 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    uint64_t v2 = (void *)MEMORY[0x1E4FB1638];
    uint64_t v3 = _WBSLocalizedString();
    id v4 = [MEMORY[0x1E4FB1818] systemImageNamed:@"xmark"];
    id v5 = [v2 commandWithTitle:v3 image:v4 action:sel_closeAllTabs_ propertyList:0];

    [v5 setAttributes:2];
    v7[0] = v5;
    v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  }
  return v1;
}

- (void)capsuleCollectionView:(id)a3 didBeginSelectionGestureOnAxis:(unint64_t)a4
{
  self->_hasActiveUserInteraction = 1;
  view = self->_view;
  if (view) {
    containerView = view->_containerView;
  }
  else {
    containerView = 0;
  }
  -[SFTabViewContainerView setUserInteractionEnabled:](containerView, "setUserInteractionEnabled:", 0, a4);
}

- (void)capsuleCollectionView:(id)a3 didUpdateProgress:(double)a4 toSelectItemAtIndex:(int64_t)a5 progressToTopAction:(double)a6 snapToAxis:(unint64_t)a7
{
  id v10 = a3;
  int64_t v11 = [v10 selectedItemIndex];
  uint64_t v12 = [v10 selectedItemIndex];

  view = self->_view;
  if (view) {
    containerView = view->_containerView;
  }
  else {
    containerView = 0;
  }
  double v15 = -1.0;
  if (v11 < a5) {
    double v15 = 1.0;
  }
  double v16 = (double)v12 + a4 * v15;
  [(SFTabViewContainerView *)containerView revealChildAtFractionalIndex:v16];
}

- (void)capsuleCollectionView:(id)a3 willEndSelectionGestureWithCoordinator:(id)a4
{
  id v6 = a3;
  ++self->_activeAnimationCount;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __95__TabGroupSwitcherViewController_capsuleCollectionView_willEndSelectionGestureWithCoordinator___block_invoke;
  v10[3] = &unk_1E6D7A4B8;
  v10[4] = self;
  id v11 = v6;
  id v7 = v6;
  id v8 = a4;
  [v8 addAnimations:v10];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  void v9[2] = __95__TabGroupSwitcherViewController_capsuleCollectionView_willEndSelectionGestureWithCoordinator___block_invoke_2;
  v9[3] = &unk_1E6D77E20;
  v9[4] = self;
  [v8 addCompletion:v9];
}

void __95__TabGroupSwitcherViewController_capsuleCollectionView_willEndSelectionGestureWithCoordinator___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 24) = 0;
  *(unsigned char *)(*(void *)(a1 + 32) + 25) = 1;
  uint64_t v2 = [*(id *)(a1 + 40) selectedItemIndex];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 56);
  id v5 = [*(id *)(v3 + 40) objectAtIndexedSubscript:v2];
  id v6 = [v5 uuid];
  id v7 = [v4 objectForKeyedSubscript:v6];
  id v13 = [v7 tabOverview];

  [*(id *)(a1 + 32) capsuleCollectionView:*(void *)(a1 + 40) didSelectItemAtIndex:v2];
  id v8 = [*(id *)(*(void *)(a1 + 32) + 88) tabCollectionViewProvider];
  int v9 = [v8 tabOverview];

  if (v13) {
    objc_msgSend(v9, "copyGeometryFromTabOverview:");
  }
  else {
    [v9 endAnimation];
  }
  id v10 = *(void **)(*(void *)(a1 + 32) + 72);
  if (v10) {
    id v10 = (void *)v10[56];
  }
  id v11 = *(void **)(a1 + 40);
  uint64_t v12 = v10;
  objc_msgSend(v12, "revealChildAtIndex:", objc_msgSend(v11, "selectedItemIndex"));

  *(unsigned char *)(*(void *)(a1 + 32) + 25) = 0;
}

void __95__TabGroupSwitcherViewController_capsuleCollectionView_willEndSelectionGestureWithCoordinator___block_invoke_2(uint64_t a1)
{
  --*(void *)(*(void *)(a1 + 32) + 8);
  v1 = *(void **)(*(void *)(a1 + 32) + 72);
  if (v1) {
    v1 = (void *)v1[56];
  }
  uint64_t v2 = v1;
  [v2 setUserInteractionEnabled:1];
  [v2 reloadViewsAtIndexes:0];
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  tabController = self->_tabController;
  id v5 = [(TabController *)tabController activeTabGroup];
  id v6 = [(TabController *)tabController contextMenuConfigurationForTabGroup:v5 variant:3];

  [v6 setPreferredMenuElementOrder:1];
  return v6;
}

- (id)_dragPreviewForCapsuleView:(uint64_t)a1
{
  if (a1)
  {
    v1 = *(void **)(a1 + 72);
    if (v1) {
      v1 = (void *)v1[55];
    }
    uint64_t v2 = v1;
    uint64_t v3 = objc_msgSend(v2, "viewForItemAtIndex:", objc_msgSend(v2, "selectedItemIndex"));
    [v2 capsuleBackgroundCornerRadius];
    objc_msgSend(v3, "_setContinuousCornerRadius:");
    id v4 = objc_msgSend(v2, "contentViewForItemAtIndex:", objc_msgSend(v2, "selectedItemIndex"));
    id v5 = objc_alloc_init(MEMORY[0x1E4FB1B28]);
    id v6 = (void *)MEMORY[0x1E4FB14C0];
    [v4 bounds];
    objc_msgSend(v4, "convertRect:toView:", v3);
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    [v2 capsuleBackgroundCornerRadius];
    double v16 = v15;

    long long v17 = objc_msgSend(v6, "bezierPathWithRoundedRect:cornerRadius:", v8, v10, v12, v14, v16);
    [v5 setVisiblePath:v17];

    v18 = [MEMORY[0x1E4FB1618] clearColor];
    [v5 setBackgroundColor:v18];

    uint64_t v19 = (void *)[objc_alloc(MEMORY[0x1E4FB1D40]) initWithView:v3 parameters:v5];
  }
  else
  {
    uint64_t v19 = 0;
  }
  return v19;
}

- (id)contextMenuInteraction:(id)a3 configuration:(id)a4 highlightPreviewForItemWithIdentifier:(id)a5
{
  id v6 = [a3 view];
  double v7 = -[TabGroupSwitcherViewController _dragPreviewForCapsuleView:]((uint64_t)self);

  return v7;
}

- (id)contextMenuInteraction:(id)a3 configuration:(id)a4 dismissalPreviewForItemWithIdentifier:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ([(TabController *)self->_tabController tabGroupWithUUID:v8],
        double v9 = objc_claimAutoreleasedReturnValue(),
        v9,
        !v9))
  {
    double v11 = 0;
  }
  else
  {
    double v10 = [v7 view];
    double v11 = -[TabGroupSwitcherViewController _dragPreviewForCapsuleView:]((uint64_t)self);
  }
  return v11;
}

- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5
{
  view = self->_view;
  if (view) {
    capsuleView = view->_capsuleView;
  }
  else {
    capsuleView = 0;
  }
  [(SFCapsuleCollectionView *)capsuleView setSelectedItemUsesLiftedPreviewAppearance:1 animator:a5];
}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  view = self->_view;
  if (view) {
    capsuleView = view->_capsuleView;
  }
  else {
    capsuleView = 0;
  }
  [(SFCapsuleCollectionView *)capsuleView setSelectedItemUsesLiftedPreviewAppearance:0 animator:a5];
}

- (TabGroupSwitcherViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (TabGroupSwitcherViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (TabController)tabController
{
  return self->_tabController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tabController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_view, 0);
  objc_storeStrong((id *)&self->_toolbar, 0);
  objc_storeStrong((id *)&self->_tabGroupIDToTabViewAdaptorMap, 0);
  objc_storeStrong((id *)&self->_tabGroupPickerButton, 0);
  objc_storeStrong((id *)&self->_tabGroups, 0);
}

@end