@interface TabOverviewDataSourceAdaptor
- (BOOL)respondsToSelector:(SEL)a3;
- (BOOL)tabCollectionView:(id)a3 canCloseItem:(id)a4;
- (BOOL)tabCollectionView:(id)a3 includesHeaderInSnapshotForItems:(id)a4;
- (TabController)tabController;
- (TabOverview)tabOverview;
- (TabOverviewDataSourceAdaptor)initWithTabGroup:(id)a3 tabController:(id)a4;
- (WBTabGroup)tabGroup;
- (double)tabCollectionViewItemHeaderHeightIncludedInSnapshot:(id)a3;
- (id)currentItemForTabOverview:(id)a3;
- (id)forwardingTargetForSelector:(SEL)a3;
- (id)methodSignatureForSelector:(SEL)a3;
- (id)tabCollectionView:(id)a3 borrowContentViewForItem:(id)a4 withTopBackdropView:(id *)a5 ofHeight:(double)a6;
- (id)tabCollectionViewManager;
- (id)undoManagerForTabCollectionView:(id)a3;
- (void)configureTabOverviewFromTabGroup;
- (void)forwardInvocation:(id)a3;
- (void)setTabOverview:(id)a3;
@end

@implementation TabOverviewDataSourceAdaptor

- (TabOverviewDataSourceAdaptor)initWithTabGroup:(id)a3 tabController:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)TabOverviewDataSourceAdaptor;
  v9 = [(TabOverviewDataSourceAdaptor *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_tabGroup, a3);
    objc_storeStrong((id *)&v10->_tabController, a4);
    v11 = v10;
  }

  return v10;
}

- (void)setTabOverview:(id)a3
{
  v5 = (TabOverview *)a3;
  tabOverview = self->_tabOverview;
  if (tabOverview != v5)
  {
    id v8 = v5;
    [(TabOverview *)tabOverview setDelegate:0];
    objc_storeStrong((id *)&self->_tabOverview, a3);
    currentItem = self->_currentItem;
    self->_currentItem = 0;

    [(TabOverviewDataSourceAdaptor *)self configureTabOverviewFromTabGroup];
    v5 = v8;
  }
}

- (void)configureTabOverviewFromTabGroup
{
  if (self->_tabOverview)
  {
    if ([(WBTabGroup *)self->_tabGroup isNamed])
    {
      v3 = [(WBTabGroup *)self->_tabGroup displayTitle];
      [(TabOverview *)self->_tabOverview setTitle:v3];
    }
    else
    {
      [(TabOverview *)self->_tabOverview setTitle:0];
    }
    [(TabOverview *)self->_tabOverview setDelegate:self];
    if ([(WBTabGroup *)self->_tabGroup isPrivateBrowsing])
    {
      v4 = -[TabController _application](self->_tabController);
      int v5 = [v4 isPrivateBrowsingLocked];

      if (v5)
      {
        [(TabOverview *)self->_tabOverview setShowsLockedPrivateBrowsingView:1 withUnlockHandler:0];
        [(TabOverview *)self->_tabOverview setShowsPrivateBrowsingExplanationView:0 animated:0];
        [(TabOverview *)self->_tabOverview setItems:MEMORY[0x1E4F1CBF0]];
        goto LABEL_21;
      }
    }
    [(TabOverview *)self->_tabOverview setShowsLockedPrivateBrowsingView:0 withUnlockHandler:0];
    if ([(WBTabGroup *)self->_tabGroup usesGlobalPinnedTabs])
    {
      v6 = [(TabController *)self->_tabController globalPinnedTabsForTabGroup:self->_tabGroup];
      id v7 = [(WBTabGroup *)self->_tabGroup tabs];
      id v8 = [v6 arrayByAddingObjectsFromArray:v7];
    }
    else
    {
      v6 = [(WBTabGroup *)self->_tabGroup tabs];
      id v8 = objc_msgSend(v6, "safari_partionedArrayUsingCondition:", &__block_literal_global_73);
    }

    if ([(WBTabGroup *)self->_tabGroup isPrivateBrowsing]
      && [v8 count] == 1)
    {
      v9 = [v8 objectAtIndexedSubscript:0];
      if ([v9 isBlank])
      {

LABEL_16:
        [(TabOverview *)self->_tabOverview setShowsPrivateBrowsingExplanationView:1 animated:0];
        [(TabOverview *)self->_tabOverview setItems:MEMORY[0x1E4F1CBF0]];
        currentItem = self->_currentItem;
        self->_currentItem = 0;

LABEL_20:
LABEL_21:
        if ([(WBTabGroup *)self->_tabGroup isNamed])
        {
          id v20 = objc_alloc_init(MEMORY[0x1E4F783B0]);
          [v20 setTabGroup:self->_tabGroup];
          [(TabOverview *)self->_tabOverview bounds];
          objc_msgSend(v20, "sizeThatFits:", v21, v22);
          self->_bannerHeight = v23;
        }
        else
        {
          self->_bannerHeight = 0.0;
        }
        return;
      }
      v10 = [(TabController *)self->_tabController privateTabs];
      v11 = [v10 objectAtIndexedSubscript:0];
      int v12 = [v11 isBlank];

      if (v12) {
        goto LABEL_16;
      }
    }
    [(TabOverview *)self->_tabOverview setShowsPrivateBrowsingExplanationView:0 animated:0];
    v14 = [(WBTabGroup *)self->_tabGroup lastSelectedTabUUID];
    uint64_t v24 = MEMORY[0x1E4F143A8];
    uint64_t v25 = 3221225472;
    v26 = __64__TabOverviewDataSourceAdaptor_configureTabOverviewFromTabGroup__block_invoke_2;
    v27 = &unk_1E6D7F060;
    unint64_t v15 = v14;
    id v28 = (id)v15;
    v29 = self;
    v16 = objc_msgSend(v8, "safari_mapObjectsUsingBlock:", &v24);
    -[TabOverview setItems:](self->_tabOverview, "setItems:", v16, v24, v25, v26, v27);

    if (!((unint64_t)self->_currentItem | v15))
    {
      v17 = [(TabOverview *)self->_tabOverview items];
      v18 = [v17 firstObject];
      v19 = self->_currentItem;
      self->_currentItem = v18;
    }
    goto LABEL_20;
  }
}

uint64_t __64__TabOverviewDataSourceAdaptor_configureTabOverviewFromTabGroup__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isPinned] ^ 1;
}

TabOverviewItem *__64__TabOverviewDataSourceAdaptor_configureTabOverviewFromTabGroup__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [TabOverviewItem alloc];
  id v5 = objc_alloc(MEMORY[0x1E4F29128]);
  v6 = [v3 uuid];
  id v7 = (void *)[v5 initWithUUIDString:v6];
  id v8 = [(TabOverviewItem *)v4 initWithUUID:v7];

  v9 = [v3 title];
  if ([v9 length]) {
    [v3 title];
  }
  else {
  v10 = +[TabDocument blankTabTitleWithLibraryType:0 controlledByAutomation:0];
  }
  [(TabOverviewItem *)v8 setTitle:v10];

  -[TabOverviewItem setPinned:](v8, "setPinned:", [v3 isPinned]);
  v11 = [v3 uuid];
  int v12 = WBSIsEqual();

  if (v12) {
    objc_storeStrong((id *)(*(void *)(a1 + 40) + 8), v8);
  }

  return v8;
}

- (id)tabCollectionViewManager
{
  return (id)-[TabController tabCollectionViewManager]((uint64_t)self->_tabController);
}

- (id)methodSignatureForSelector:(SEL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)TabOverviewDataSourceAdaptor;
  id v5 = -[TabOverviewDataSourceAdaptor methodSignatureForSelector:](&v8, sel_methodSignatureForSelector_);
  if (!v5)
  {
    v6 = [(TabOverviewDataSourceAdaptor *)self tabCollectionViewManager];
    id v5 = [v6 methodSignatureForSelector:a3];
  }
  return v5;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)TabOverviewDataSourceAdaptor;
  if (-[TabOverviewDataSourceAdaptor respondsToSelector:](&v7, sel_respondsToSelector_))
  {
    char v4 = 1;
  }
  else
  {
    id v5 = [(TabOverviewDataSourceAdaptor *)self tabCollectionViewManager];
    char v4 = objc_opt_respondsToSelector();
  }
  return v4 & 1;
}

- (void)forwardInvocation:(id)a3
{
  id v4 = a3;
  [v4 selector];
  id v5 = [(TabOverviewDataSourceAdaptor *)self tabCollectionViewManager];
  if (objc_opt_respondsToSelector())
  {
    [v4 invokeWithTarget:v5];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)TabOverviewDataSourceAdaptor;
    [(TabOverviewDataSourceAdaptor *)&v6 forwardInvocation:v4];
  }
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  id v3 = [(TabOverviewDataSourceAdaptor *)self tabCollectionViewManager];
  if (objc_opt_respondsToSelector()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (id)tabCollectionView:(id)a3 borrowContentViewForItem:(id)a4 withTopBackdropView:(id *)a5 ofHeight:(double)a6
{
  id v6 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  return v6;
}

- (BOOL)tabCollectionView:(id)a3 canCloseItem:(id)a4
{
  id v4 = [(WBTabGroup *)self->_tabGroup tabs];
  if ([v4 count] == 1)
  {
    id v5 = [v4 objectAtIndexedSubscript:0];
    char v6 = [v5 isBlank];

    char v7 = v6 ^ 1;
  }
  else
  {
    char v7 = 1;
  }

  return v7;
}

- (id)undoManagerForTabCollectionView:(id)a3
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F29140]);
  return v3;
}

- (double)tabCollectionViewItemHeaderHeightIncludedInSnapshot:(id)a3
{
  return self->_bannerHeight;
}

- (BOOL)tabCollectionView:(id)a3 includesHeaderInSnapshotForItems:(id)a4
{
  tabGroup = self->_tabGroup;
  id v5 = objc_msgSend(a4, "UUID", a3);
  char v6 = [v5 UUIDString];
  char v7 = [(WBTabGroup *)tabGroup tabWithUUID:v6];
  char v8 = [v7 isBlank] ^ 1;

  return v8;
}

- (id)currentItemForTabOverview:(id)a3
{
  return self->_currentItem;
}

- (TabController)tabController
{
  return self->_tabController;
}

- (WBTabGroup)tabGroup
{
  return self->_tabGroup;
}

- (TabOverview)tabOverview
{
  return self->_tabOverview;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tabOverview, 0);
  objc_storeStrong((id *)&self->_tabGroup, 0);
  objc_storeStrong((id *)&self->_tabController, 0);
  objc_storeStrong((id *)&self->_currentItem, 0);
}

@end