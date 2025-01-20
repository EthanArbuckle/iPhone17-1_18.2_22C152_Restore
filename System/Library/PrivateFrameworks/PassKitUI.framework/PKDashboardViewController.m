@interface PKDashboardViewController
+ (id)backgroundColor;
- ($EBFECD39B7590C85DF69C2EC68399AD0)methodsForItemIdentifier:(id)a3;
- (BOOL)_isCellVisibleAtIndexPath:(id)a3 withTopSafeArea:(double)a4 contentOffset:(double)a5;
- (BOOL)_isIndexPathAFooter:(id)a3;
- (BOOL)_isIndexPathAHeader:(id)a3;
- (BOOL)_isListSectionAtIndex:(int64_t)a3;
- (BOOL)collectionView:(id)a3 layout:(id)a4 hasFooterForSectionAtIndex:(int64_t)a5;
- (BOOL)collectionView:(id)a3 layout:(id)a4 hasHeaderForSectionAtIndex:(int64_t)a5;
- (BOOL)collectionView:(id)a3 layout:(id)a4 isListSectionAtIndex:(int64_t)a5;
- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4;
- (BOOL)freezeChromelessNavigationItem;
- (BOOL)itemIsIndependentInCollectionView:(id)a3 atIndexPath:(id)a4;
- (BOOL)itemIsStackableInCollectionView:(id)a3 atIndexPath:(id)a4;
- (BOOL)shouldPresentAllContent;
- (BOOL)useChromelessNavigationItem;
- (CGPoint)_scrollView:(id)a3 adjustedOffsetForOffset:(CGPoint)result translation:(CGPoint)a5 startPoint:(CGPoint)a6 locationInView:(CGPoint)a7 horizontalVelocity:(double *)a8 verticalVelocity:(double *)a9;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (NSArray)actualIndexPathsForSelectedItems;
- (PKDashboardDataSource)dataSource;
- (PKDashboardDelegate)delegate;
- (PKDashboardViewController)initWithDataSource:(id)a3 presenters:(id)a4 layout:(id)a5;
- (id)_actualItemIndexPathForIndexPath:(id)a3;
- (id)_footerViewAtIndexPath:(id)a3 isCell:(BOOL)a4;
- (id)_headerViewAtIndexPath:(id)a3 isCell:(BOOL)a4;
- (id)_internalIndexPathForItemIndexPath:(id)a3;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 layout:(id)a4 trailingSwipeActionsConfigurationForItemAtIndexPath:(id)a5;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (int64_t)preferredStatusBarStyle;
- (void)_hideAllContentAnimated:(BOOL)a3;
- (void)_presentAllContent;
- (void)_resolveDismissInteractionForScrollView:(id)a3;
- (void)_setupPresenters:(id)a3;
- (void)_updateNavigationBarAppearance;
- (void)_updateNavigationBarVisibility;
- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionView:(id)a3 didHighlightItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didUnhighlightItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 prefetchItemsAtIndexPaths:(id)a4;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)contentIsLoaded;
- (void)dealloc;
- (void)deleteItemsAtIndexPaths:(id)a3;
- (void)deleteSections:(id)a3;
- (void)insertItemsAtIndexPaths:(id)a3;
- (void)insertSections:(id)a3;
- (void)invalidateLayoutForCell:(id)a3;
- (void)itemChanged:(id)a3 atIndexPath:(id)a4;
- (void)moveItemAtIndexPath:(id)a3 toIndexPath:(id)a4;
- (void)moveSection:(int64_t)a3 toSection:(int64_t)a4;
- (void)performBatchUpdates:(id)a3 completion:(id)a4;
- (void)reloadSections:(id)a3;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)setActionForVisibilityChange:(id)a3 indexPath:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setFreezeChromelessNavigationItem:(BOOL)a3;
- (void)setUseChromelessNavigationItem:(BOOL)a3;
- (void)shouldPresentAllContent:(BOOL)a3 animated:(BOOL)a4;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateContent;
- (void)viewDidLoad;
@end

@implementation PKDashboardViewController

+ (id)backgroundColor
{
  return (id)[MEMORY[0x1E4FB1618] systemGroupedBackgroundColor];
}

- (PKDashboardViewController)initWithDataSource:(id)a3 presenters:(id)a4 layout:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = v11;
  if (!v11)
  {
    id v12 = objc_alloc_init(MEMORY[0x1E4FB15C0]);
    [v12 setScrollDirection:0];
    objc_msgSend(v12, "setSectionInset:", 12.0, 0.0, 12.0, 0.0);
  }
  v34.receiver = self;
  v34.super_class = (Class)PKDashboardViewController;
  v13 = [(PKDashboardViewController *)&v34 initWithCollectionViewLayout:v12];
  if (v13)
  {
    uint64_t v14 = [objc_alloc(MEMORY[0x1E4F88168]) initWithMass:1.0 stiffness:107.313414 damping:18.18598];
    collectionViewFactory = v13->_collectionViewFactory;
    v13->_collectionViewFactory = (PKUISpringAnimationFactory *)v14;

    v16 = v13->_collectionViewFactory;
    v17 = PKMagicCurve();
    [(PKUISpringAnimationFactory *)v16 setTiming:v17];

    [(PKDashboardViewController *)v13 _setupPresenters:v10];
    objc_storeStrong((id *)&v13->_dataSource, a3);
    if (v9 && (objc_opt_respondsToSelector() & 1) != 0) {
      [v9 setDataSourceDelegate:v13];
    }
    if (v11) {
      objc_storeStrong((id *)&v13->_customLayout, a5);
    }
    v18 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    titlesForSection = v13->_titlesForSection;
    v13->_titlesForSection = v18;

    v20 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    footerTextItemsBySection = v13->_footerTextItemsBySection;
    v13->_footerTextItemsBySection = v20;

    v22 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    blocksOnVisibilityChange = v13->_blocksOnVisibilityChange;
    v13->_blocksOnVisibilityChange = v22;

    v13->_useChromelessNavigationItem = 0;
    v24 = [PKDashboardTitleHeaderView alloc];
    double v25 = *MEMORY[0x1E4F1DB28];
    double v26 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v27 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v28 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    uint64_t v29 = -[PKDashboardTitleHeaderView initWithFrame:](v24, "initWithFrame:", *MEMORY[0x1E4F1DB28], v26, v27, v28);
    sampleHeaderView = v13->_sampleHeaderView;
    v13->_sampleHeaderView = (PKDashboardTitleHeaderView *)v29;

    v31 = -[PKDashboardFooterTextView initWithFrame:]([PKDashboardFooterTextView alloc], "initWithFrame:", v25, v26, v27, v28);
    sampleFooterView = v13->_sampleFooterView;
    v13->_sampleFooterView = v31;

    [(PKDashboardViewController *)v13 _updateNavigationBarAppearance];
  }

  return v13;
}

- (void)dealloc
{
  free(self->_presentersOptionalMethods);
  v3.receiver = self;
  v3.super_class = (Class)PKDashboardViewController;
  [(PKDashboardViewController *)&v3 dealloc];
}

- (void)_setupPresenters:(id)a3
{
  id v34 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  size_t v6 = [v34 count];
  uint64_t v7 = 1024;
  self->_presentersOptionalMethods = ($EBFECD39B7590C85DF69C2EC68399AD0 *)malloc_type_malloc(v6, 0x100004077774924uLL);
  if (v6)
  {
    uint64_t v8 = 0;
    v32 = self;
    id v33 = v4;
    do
    {
      id v9 = [v34 objectAtIndex:v8];
      id v10 = objc_msgSend((id)objc_msgSend(v9, "itemClass"), "identifier");
      [v4 setObject:v9 forKey:v10];
      id v11 = [NSNumber numberWithUnsignedInteger:v8];
      [v5 setObject:v11 forKey:v10];

      char v12 = objc_opt_respondsToSelector();
      uint64_t v13 = v7;
      size_t v14 = v6;
      id v15 = v5;
      if (objc_opt_respondsToSelector()) {
        char v16 = 2;
      }
      else {
        char v16 = 0;
      }
      char v17 = v16 & 0xFE | v12 & 1;
      if (objc_opt_respondsToSelector()) {
        char v18 = 4;
      }
      else {
        char v18 = 0;
      }
      if (objc_opt_respondsToSelector()) {
        char v19 = 8;
      }
      else {
        char v19 = 0;
      }
      char v20 = v17 | v18 | v19;
      if (objc_opt_respondsToSelector()) {
        char v21 = 16;
      }
      else {
        char v21 = 0;
      }
      if (objc_opt_respondsToSelector()) {
        char v22 = 32;
      }
      else {
        char v22 = 0;
      }
      if (objc_opt_respondsToSelector()) {
        char v23 = 64;
      }
      else {
        char v23 = 0;
      }
      char v24 = v21 | v22;
      if (objc_opt_respondsToSelector()) {
        char v25 = 0x80;
      }
      else {
        char v25 = 0;
      }
      char v26 = v24 | v23;
      id v5 = v15;
      size_t v6 = v14;
      uint64_t v7 = v13;
      char v27 = v20 | v26;
      self = v32;
      id v4 = v33;
      (*(unsigned char **)((char *)&v32->super.super.super.super.isa + v7))[v8] = v27 | v25;

      ++v8;
    }
    while (v6 != v8);
  }
  double v28 = (NSDictionary *)[v4 copy];
  presentersPerIdentifier = self->_presentersPerIdentifier;
  self->_presentersPerIdentifier = v28;

  v30 = (NSDictionary *)[v5 copy];
  presenterMethodsIndexPerIdentifier = self->_presenterMethodsIndexPerIdentifier;
  self->_presenterMethodsIndexPerIdentifier = v30;
}

- ($EBFECD39B7590C85DF69C2EC68399AD0)methodsForItemIdentifier:(id)a3
{
  id v4 = [(NSDictionary *)self->_presenterMethodsIndexPerIdentifier objectForKey:a3];
  uint64_t v5 = [v4 integerValue];

  return ($EBFECD39B7590C85DF69C2EC68399AD0)*((unsigned __int8 *)self->_presentersOptionalMethods + v5);
}

- (void)viewDidLoad
{
  v10.receiver = self;
  v10.super_class = (Class)PKDashboardViewController;
  [(PKDashboardViewController *)&v10 viewDidLoad];
  objc_super v3 = [(PKDashboardViewController *)self collectionView];
  [v3 setAlwaysBounceVertical:1];
  [v3 setBounces:1];
  id v4 = [MEMORY[0x1E4FB1618] clearColor];
  [v3 setBackgroundColor:v4];

  [v3 setPrefetchDataSource:self];
  [v3 _setAdjustsContentInsetWhenScrollDisabled:1];
  presentersPerIdentifier = self->_presentersPerIdentifier;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __40__PKDashboardViewController_viewDidLoad__block_invoke;
  v8[3] = &unk_1E59D8210;
  id v6 = v3;
  id v9 = v6;
  [(NSDictionary *)presentersPerIdentifier enumerateKeysAndObjectsUsingBlock:v8];
  [v6 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"HeaderViewIdentifier"];
  [v6 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"FooterViewIdentifier"];
  [v6 registerClass:objc_opt_class() forSupplementaryViewOfKind:*MEMORY[0x1E4FB2770] withReuseIdentifier:@"HeaderSupplementaryViewIdentifier"];
  [v6 registerClass:objc_opt_class() forSupplementaryViewOfKind:*MEMORY[0x1E4FB2760] withReuseIdentifier:@"FooterSupplementaryViewIdentifier"];
  [(PKDashboardViewController *)self _updateNavigationBarVisibility];
  if (self->_contentIsLoaded) {
    [(PKDashboardViewController *)self updateContent];
  }
  uint64_t v7 = [(PKDashboardViewController *)self view];
  [v7 setAccessibilityIdentifier:*MEMORY[0x1E4F85420]];
}

void __40__PKDashboardViewController_viewDidLoad__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = [a3 collectionViewCellClasses];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
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
        objc_msgSend(*(id *)(a1 + 32), "registerClass:forCellWithReuseIdentifier:", objc_msgSend(v4, "objectForKey:", *(void *)(*((void *)&v9 + 1) + 8 * v8)), *(void *)(*((void *)&v9 + 1) + 8 * v8));
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (int64_t)preferredStatusBarStyle
{
  return 0;
}

- (void)setActionForVisibilityChange:(id)a3 indexPath:(id)a4
{
  id aBlock = a3;
  id v6 = a4;
  if (v6)
  {
    blocksOnVisibilityChange = self->_blocksOnVisibilityChange;
    if (aBlock)
    {
      uint64_t v8 = _Block_copy(aBlock);
      [(NSMutableDictionary *)blocksOnVisibilityChange setObject:v8 forKey:v6];

      long long v9 = [(PKDashboardViewController *)self collectionView];
      [v9 safeAreaInsets];
      double v11 = v10;
      [v9 contentOffset];
      if (-[PKDashboardViewController _isCellVisibleAtIndexPath:withTopSafeArea:contentOffset:](self, "_isCellVisibleAtIndexPath:withTopSafeArea:contentOffset:", v6, v11))
      {
        long long v12 = [(NSSet *)self->_visibleCellsExcludingSafeArea setByAddingObject:v6];
        visibleCellsExcludingSafeArea = self->_visibleCellsExcludingSafeArea;
        self->_visibleCellsExcludingSafeArea = v12;
      }
    }
    else
    {
      [(NSMutableDictionary *)blocksOnVisibilityChange removeObjectForKey:v6];
      uint64_t v14 = [(NSSet *)self->_visibleCellsExcludingSafeArea pk_setByRemovingObject:v6];
      long long v9 = self->_visibleCellsExcludingSafeArea;
      self->_visibleCellsExcludingSafeArea = v14;
    }
  }
}

- (BOOL)_isCellVisibleAtIndexPath:(id)a3 withTopSafeArea:(double)a4 contentOffset:(double)a5
{
  uint64_t v8 = [(PKDashboardViewController *)self _actualItemIndexPathForIndexPath:a3];
  long long v9 = [(PKDashboardViewController *)self collectionView];
  double v10 = [v9 cellForItemAtIndexPath:v8];
  double v11 = v10;
  if (v10)
  {
    [v10 frame];
    BOOL v14 = a4 + a5 <= v12 + v13;
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (void)shouldPresentAllContent:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_shouldPresentAllContent != a3)
  {
    self->_shouldPresentAllContent = a3;
    if (a3)
    {
      self->_presentationAnimated = a4;
      if (self->_contentIsLoaded) {
        [(PKDashboardViewController *)self _presentAllContent];
      }
    }
    else
    {
      self->_presentationAnimated = 0;
      [(PKDashboardViewController *)self _hideAllContentAnimated:a4];
    }
  }
}

- (void)setFreezeChromelessNavigationItem:(BOOL)a3
{
  if (self->_freezeChromelessNavigationItem != a3)
  {
    self->_freezeChromelessNavigationItem = a3;
    [(PKDashboardViewController *)self _updateNavigationBarVisibility];
  }
}

- (void)setUseChromelessNavigationItem:(BOOL)a3
{
  if (self->_useChromelessNavigationItem != a3)
  {
    self->_useChromelessNavigationItem = a3;
    [(PKDashboardViewController *)self _updateNavigationBarAppearance];
  }
}

- (NSArray)actualIndexPathsForSelectedItems
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v4 = [(PKDashboardViewController *)self collectionView];
  uint64_t v5 = [v4 indexPathsForSelectedItems];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        double v11 = -[PKDashboardViewController _actualItemIndexPathForIndexPath:](self, "_actualItemIndexPathForIndexPath:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
        [v3 addObject:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return (NSArray *)v3;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return [(PKDashboardDataSource *)self->_dataSource numberOfSections];
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = (void *)MEMORY[0x1A6224460]();
  uint64_t v8 = [(PKDashboardDataSource *)self->_dataSource numberOfItemsInSection:a4];
  uint64_t v9 = [(PKDashboardDataSource *)self->_dataSource titleForSection:a4];
  titlesForSection = self->_titlesForSection;
  double v11 = [NSNumber numberWithInteger:a4];
  if (v9) {
    [(NSMutableDictionary *)titlesForSection setObject:v9 forKey:v11];
  }
  else {
    [(NSMutableDictionary *)titlesForSection removeObjectForKey:v11];
  }

  double v12 = [(PKDashboardDataSource *)self->_dataSource footerTextItemForSection:a4];
  footerTextItemsBySection = self->_footerTextItemsBySection;
  long long v14 = [NSNumber numberWithInteger:a4];
  if (v12) {
    [(NSMutableDictionary *)footerTextItemsBySection setObject:v12 forKey:v14];
  }
  else {
    [(NSMutableDictionary *)footerTextItemsBySection removeObjectForKey:v14];
  }

  BOOL v15 = [(PKDashboardViewController *)self _isListSectionAtIndex:a4];
  if (v9) {
    int64_t v16 = v8 + 1;
  }
  else {
    int64_t v16 = v8;
  }
  if (v12) {
    ++v16;
  }
  if (v15) {
    int64_t v17 = v8;
  }
  else {
    int64_t v17 = v16;
  }

  return v17;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(PKDashboardViewController *)self _isIndexPathAHeader:v7])
  {
    uint64_t v8 = [(PKDashboardViewController *)self _headerViewAtIndexPath:v7 isCell:1];
LABEL_5:
    uint64_t v9 = (void *)v8;
    goto LABEL_25;
  }
  if ([(PKDashboardViewController *)self _isIndexPathAFooter:v7])
  {
    uint64_t v8 = [(PKDashboardViewController *)self _footerViewAtIndexPath:v7 isCell:1];
    goto LABEL_5;
  }
  double v10 = [(PKDashboardViewController *)self _actualItemIndexPathForIndexPath:v7];
  double v11 = [(PKDashboardDataSource *)self->_dataSource itemAtIndexPath:v10];
  double v12 = [(id)objc_opt_class() identifier];
  long long v13 = [(NSDictionary *)self->_presentersPerIdentifier objectForKey:v12];
  uint64_t v9 = [v13 cellForItem:v11 inCollectionView:v6 atIndexPath:v10];
  BOOL v14 = -[PKDashboardViewController _isListSectionAtIndex:](self, "_isListSectionAtIndex:", [v7 section]);
  if (([v9 wantsCustomAppearance] & 1) == 0)
  {
    uint64_t v29 = v13;
    v30 = v12;
    uint64_t v31 = [v10 row];
    footerTextItemsBySection = self->_footerTextItemsBySection;
    int64_t v16 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v7, "section"));
    int64_t v17 = [(NSMutableDictionary *)footerTextItemsBySection objectForKey:v16];

    uint64_t v18 = objc_msgSend(v6, "numberOfItemsInSection:", objc_msgSend(v7, "section"));
    uint64_t v19 = [v7 row];
    if (v17) {
      int v20 = v14;
    }
    else {
      int v20 = 1;
    }
    BOOL v21 = v20 == 0;
    uint64_t v22 = 1;
    if (v21) {
      uint64_t v22 = 2;
    }
    uint64_t v23 = v19 + v22;
    if (v31 || v18 != v23)
    {
      if (!v31 || v18 != v23)
      {
        [v9 setMaskType:v31 == 0];
        double v12 = v30;
        long long v13 = v29;
        if (([(PKDashboardViewController *)self methodsForItemIdentifier:v30] & 0x80) != 0) {
          int v27 = [v29 hideSeparatorForItem:v11 inCollectionView:v6] | v14;
        }
        else {
          int v27 = v14;
        }
        uint64_t v26 = v27 ^ 1u;
        goto LABEL_23;
      }
      char v24 = v9;
      uint64_t v25 = 2;
    }
    else
    {
      char v24 = v9;
      uint64_t v25 = 3;
    }
    [v24 setMaskType:v25];
    uint64_t v26 = 0;
    long long v13 = v29;
    double v12 = v30;
LABEL_23:
    [v9 setShowsBottomSeparator:v26];
  }

LABEL_25:

  return v9;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if ([v7 isEqualToString:*MEMORY[0x1E4FB2770]])
  {
    uint64_t v9 = [(PKDashboardViewController *)self _headerViewAtIndexPath:v8 isCell:0];
LABEL_5:
    double v10 = (void *)v9;
    goto LABEL_7;
  }
  if ([v7 isEqualToString:*MEMORY[0x1E4FB2760]])
  {
    uint64_t v9 = [(PKDashboardViewController *)self _footerViewAtIndexPath:v8 isCell:0];
    goto LABEL_5;
  }
  double v10 = 0;
LABEL_7:

  return v10;
}

- (void)collectionView:(id)a3 prefetchItemsAtIndexPaths:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v22 = a3;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v6 = a4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v25;
    double v10 = &OBJC_IVAR___PKPayLaterMakePaymentSectionController__selectedItem;
    do
    {
      uint64_t v11 = 0;
      uint64_t v23 = v8;
      do
      {
        if (*(void *)v25 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void *)(*((void *)&v24 + 1) + 8 * v11);
        if (!-[PKDashboardViewController _isIndexPathAHeader:](self, "_isIndexPathAHeader:", v12, v22)
          && ![(PKDashboardViewController *)self _isIndexPathAFooter:v12])
        {
          long long v13 = (void *)MEMORY[0x1A6224460]();
          BOOL v14 = [(PKDashboardViewController *)self _actualItemIndexPathForIndexPath:v12];
          BOOL v15 = [*(id *)((char *)&self->super.super.super.super.isa + v10[484]) itemAtIndexPath:v14];
          int64_t v16 = [(id)objc_opt_class() identifier];
          if (([(PKDashboardViewController *)self methodsForItemIdentifier:v16] & 0x40) != 0)
          {
            [(NSDictionary *)self->_presentersPerIdentifier objectForKey:v16];
            uint64_t v17 = v9;
            uint64_t v18 = v13;
            id v19 = v6;
            v21 = int v20 = v10;
            [v21 prefetchForItem:v15 inCollectionView:v22];

            double v10 = v20;
            id v6 = v19;
            long long v13 = v18;
            uint64_t v9 = v17;
            uint64_t v8 = v23;
          }
        }
        ++v11;
      }
      while (v8 != v11);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v8);
  }
}

- (BOOL)_isListSectionAtIndex:(int64_t)a3
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  dataSource = self->_dataSource;

  return [(PKDashboardDataSource *)dataSource isListLayoutForSection:a3];
}

- (BOOL)_isIndexPathAHeader:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 section];
  if ([(PKDashboardViewController *)self _isListSectionAtIndex:v5]
    || [v4 row])
  {
    BOOL v6 = 0;
  }
  else
  {
    titlesForSection = self->_titlesForSection;
    uint64_t v8 = [NSNumber numberWithUnsignedInteger:v5];
    uint64_t v9 = [(NSMutableDictionary *)titlesForSection objectForKey:v8];
    BOOL v6 = v9 != 0;
  }
  return v6;
}

- (BOOL)_isIndexPathAFooter:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 section];
  if ([(PKDashboardViewController *)self _isListSectionAtIndex:v5])
  {
    BOOL v6 = 0;
  }
  else
  {
    uint64_t v7 = [v4 row] + 1;
    uint64_t v8 = [(PKDashboardViewController *)self collectionView];
    if (v7 == [(PKDashboardViewController *)self collectionView:v8 numberOfItemsInSection:v5])
    {
      footerTextItemsBySection = self->_footerTextItemsBySection;
      double v10 = [NSNumber numberWithUnsignedInteger:v5];
      uint64_t v11 = [(NSMutableDictionary *)footerTextItemsBySection objectForKey:v10];
      BOOL v6 = v11 != 0;
    }
    else
    {
      BOOL v6 = 0;
    }
  }
  return v6;
}

- (id)_actualItemIndexPathForIndexPath:(id)a3
{
  id v4 = a3;
  titlesForSection = self->_titlesForSection;
  BOOL v6 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "section"));
  uint64_t v7 = [(NSMutableDictionary *)titlesForSection objectForKey:v6];

  if (v7
    && !-[PKDashboardViewController _isListSectionAtIndex:](self, "_isListSectionAtIndex:", [v4 section])
    && [v4 row] >= 1)
  {
    uint64_t v8 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForRow:inSection:", objc_msgSend(v4, "row") - 1, objc_msgSend(v4, "section"));

    id v4 = (id)v8;
  }

  return v4;
}

- (id)_internalIndexPathForItemIndexPath:(id)a3
{
  id v4 = a3;
  titlesForSection = self->_titlesForSection;
  BOOL v6 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "section"));
  uint64_t v7 = [(NSMutableDictionary *)titlesForSection objectForKey:v6];

  if (v7
    && !-[PKDashboardViewController _isListSectionAtIndex:](self, "_isListSectionAtIndex:", [v4 section]))
  {
    uint64_t v8 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForRow:inSection:", objc_msgSend(v4, "row") + 1, objc_msgSend(v4, "section"));

    id v4 = (id)v8;
  }

  return v4;
}

- (id)_headerViewAtIndexPath:(id)a3 isCell:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  titlesForSection = self->_titlesForSection;
  uint64_t v8 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v6, "section"));
  uint64_t v9 = [(NSMutableDictionary *)titlesForSection objectForKey:v8];

  if (!v9)
  {
    uint64_t v12 = 0;
    goto LABEL_21;
  }
  double v10 = [(PKDashboardViewController *)self collectionView];
  uint64_t v11 = v10;
  if (v4) {
    [v10 dequeueReusableCellWithReuseIdentifier:@"HeaderViewIdentifier" forIndexPath:v6];
  }
  else {
  uint64_t v12 = [v10 dequeueReusableSupplementaryViewOfKind:*MEMORY[0x1E4FB2770] withReuseIdentifier:@"HeaderSupplementaryViewIdentifier" forIndexPath:v6];
  }

  long long v13 = [v9 title];
  [v12 setTitle:v13];

  BOOL v14 = [v9 titleColor];
  if (v14)
  {
    BOOL v15 = [MEMORY[0x1E4FB1618] systemGrayColor];
    [v12 setTitleColor:v15];
  }
  objc_msgSend(v12, "setTitleStyle:", objc_msgSend(v9, "style"));
  int64_t v16 = [v9 actionTitle];

  if (v16)
  {
    uint64_t v17 = [v9 actionTitle];
    [v12 setActionTitle:v17];
  }
  else
  {
    uint64_t v18 = [v9 actionImage];

    if (!v18) {
      goto LABEL_13;
    }
    uint64_t v17 = [v9 actionImage];
    [v12 setActionImage:v17];
  }

LABEL_13:
  id v19 = [v9 action];

  if (v19)
  {
    int v20 = [v9 action];
    [v12 setAction:v20];
LABEL_17:

    goto LABEL_18;
  }
  BOOL v21 = [v9 menu];

  if (v21)
  {
    int v20 = [v9 menu];
    [v12 setMenu:v20];
    goto LABEL_17;
  }
LABEL_18:
  id v22 = [v9 actionColor];

  if (v22)
  {
    uint64_t v23 = [v9 actionColor];
    [v12 setActionColor:v23];
  }
  objc_msgSend(v12, "setActionStyle:", objc_msgSend(v9, "actionStyle"));
  objc_msgSend(v12, "setUseActionInsets:", objc_msgSend(v9, "useActionInsets"));
  objc_msgSend(v12, "setPreferBaselineAlignment:", objc_msgSend(v9, "preferBaselineAlignment"));

LABEL_21:

  return v12;
}

- (id)_footerViewAtIndexPath:(id)a3 isCell:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  footerTextItemsBySection = self->_footerTextItemsBySection;
  uint64_t v8 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v6, "section"));
  uint64_t v9 = [(NSMutableDictionary *)footerTextItemsBySection objectForKey:v8];

  if (v9)
  {
    double v10 = [(PKDashboardViewController *)self collectionView];
    uint64_t v11 = v10;
    if (v4) {
      [v10 dequeueReusableCellWithReuseIdentifier:@"FooterViewIdentifier" forIndexPath:v6];
    }
    else {
    uint64_t v12 = [v10 dequeueReusableSupplementaryViewOfKind:*MEMORY[0x1E4FB2760] withReuseIdentifier:@"FooterSupplementaryViewIdentifier" forIndexPath:v6];
    }

    objc_msgSend(v12, "setMaximumLines:", objc_msgSend(v9, "maximumNumberOfLines"));
    +[PKDashboardCollectionViewCell defaultHorizontalInset];
    objc_msgSend(v12, "setHorizontalInset:");
    long long v13 = [v9 footerText];
    [v12 setFooterText:v13];

    BOOL v14 = [v9 sources];
    [v12 setSources:v14];

    BOOL v15 = [v9 linkTextColor];
    [v12 setLinkTextColor:v15];

    objc_msgSend(v12, "setBottomInsetType:", objc_msgSend(v9, "bottomInsetType"));
    objc_msgSend(v12, "setUseCustomContentInsets:", objc_msgSend(v9, "useCustomContentInsets"));
    [v9 customContentInsets];
    objc_msgSend(v12, "setCustomContentInsets:");
    int64_t v16 = [v9 font];
    [v12 setFont:v16];

    uint64_t v17 = [v9 fdicConfiguration];
    if (v17) {
      uint64_t v18 = [[PKFDICSignageView alloc] initWithConfiguration:v17];
    }
    else {
      uint64_t v18 = 0;
    }
    [v12 setAdditionalView:v18];
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  self->_dragging = 1;
  self->_draggingVelocity = (CGPoint)*MEMORY[0x1E4F1DAD8];
  p_delegate = &self->_delegate;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  id v6 = [v5 panGestureRecognizer];

  if ((unint64_t)([v6 state] - 1) >= 2) {
    goto LABEL_8;
  }
  uint64_t v7 = [(PKDashboardViewController *)self viewIfLoaded];
  [v6 locationInView:v7];
  if (!v7 || !WeakRetained)
  {

LABEL_8:
    self->_trackingDismissInteraction = 0;
    goto LABEL_9;
  }
  double v10 = v8;
  double v11 = v9;
  int v12 = objc_msgSend(WeakRetained, "dashboardViewController:shouldStartDismissInteractionFromPoint:", self);

  self->_trackingDismissInteraction = v12;
  if (v12 && (objc_opt_respondsToSelector() & 1) != 0) {
    objc_msgSend(WeakRetained, "dashboardViewController:willStartDismissInteractionFromPoint:", self, v10, v11);
  }
LABEL_9:
}

- (CGPoint)_scrollView:(id)a3 adjustedOffsetForOffset:(CGPoint)result translation:(CGPoint)a5 startPoint:(CGPoint)a6 locationInView:(CGPoint)a7 horizontalVelocity:(double *)a8 verticalVelocity:(double *)a9
{
  if (self->_trackingDismissInteraction) {
    result.y = a6.y - a5.y;
  }
  return result;
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  self->_draggingVelocity = a4;
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  self->_dragging = 0;
  if (!a4) {
    [(PKDashboardViewController *)self _resolveDismissInteractionForScrollView:a3];
  }
}

- (void)_resolveDismissInteractionForScrollView:(id)a3
{
  id v4 = a3;
  if (self->_trackingDismissInteraction)
  {
    id v13 = v4;
    self->_trackingDismissInteraction = 0;
    double x = self->_draggingVelocity.x;
    double y = self->_draggingVelocity.y;
    self->_draggingVelocitdouble y = (CGPoint)*MEMORY[0x1E4F1DAD8];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (WeakRetained)
    {
      char v8 = objc_opt_respondsToSelector();
      [v13 contentOffset];
      double v10 = v9;
      double v12 = v11;
      if (objc_msgSend(WeakRetained, "dashboardViewController:dismissInteractionShouldDismissForContentOffset:velocity:", self))
      {
        [v13 stopScrollingAndZooming];
        objc_msgSend(v13, "setContentOffset:", v10, v12);
        if (v8) {
          [WeakRetained dashboardViewController:self didEndDismissInteraction:1];
        }
        objc_msgSend(WeakRetained, "dashboardViewController:dismissInteractionDismissedForContentOffset:velocity:", self, v10, v12, x, y);
      }
      else if (v8)
      {
        [WeakRetained dashboardViewController:self didEndDismissInteraction:0];
      }
    }

    id v4 = v13;
  }
}

- (void)scrollViewDidScroll:(id)a3
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v4 = [(PKDashboardViewController *)self collectionView];
  [v4 contentOffset];
  double v6 = v5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v8 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained contentDidScroll];
  }
  [(PKDashboardViewController *)self _updateNavigationBarVisibility];
  [v4 safeAreaInsets];
  double v10 = v9;
  if (vabdd_f64(v6, self->_lastScrollOffset) > 10.0)
  {
    self->_lastScrollOffset = v6;
    double v11 = [(NSMutableDictionary *)self->_blocksOnVisibilityChange allKeys];
    double v12 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithArray:v11];
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    id v13 = v11;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v47 objects:v53 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v48;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v48 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = *(void *)(*((void *)&v47 + 1) + 8 * i);
          if (!-[PKDashboardViewController _isCellVisibleAtIndexPath:withTopSafeArea:contentOffset:](self, "_isCellVisibleAtIndexPath:withTopSafeArea:contentOffset:", v18, v10, v6))[v12 removeObject:v18]; {
        }
          }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v47 objects:v53 count:16];
      }
      while (v15);
    }

    if (self->_visibleCellsExcludingSafeArea)
    {
      v37 = v8;
      v38 = v4;
      id v19 = (void *)[v12 mutableCopy];
      [v19 minusSet:self->_visibleCellsExcludingSafeArea];
      long long v45 = 0u;
      long long v46 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      id v20 = v19;
      uint64_t v21 = [v20 countByEnumeratingWithState:&v43 objects:v52 count:16];
      if (v21)
      {
        uint64_t v22 = v21;
        uint64_t v23 = *(void *)v44;
        do
        {
          for (uint64_t j = 0; j != v22; ++j)
          {
            if (*(void *)v44 != v23) {
              objc_enumerationMutation(v20);
            }
            uint64_t v25 = [(NSMutableDictionary *)self->_blocksOnVisibilityChange objectForKey:*(void *)(*((void *)&v43 + 1) + 8 * j)];
            long long v26 = (void *)v25;
            if (v25) {
              (*(void (**)(uint64_t, uint64_t))(v25 + 16))(v25, 1);
            }
          }
          uint64_t v22 = [v20 countByEnumeratingWithState:&v43 objects:v52 count:16];
        }
        while (v22);
      }

      long long v27 = (void *)[(NSSet *)self->_visibleCellsExcludingSafeArea mutableCopy];
      [v27 minusSet:v12];
      long long v41 = 0u;
      long long v42 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      id v28 = v27;
      uint64_t v29 = [v28 countByEnumeratingWithState:&v39 objects:v51 count:16];
      if (v29)
      {
        uint64_t v30 = v29;
        uint64_t v31 = *(void *)v40;
        do
        {
          for (uint64_t k = 0; k != v30; ++k)
          {
            if (*(void *)v40 != v31) {
              objc_enumerationMutation(v28);
            }
            uint64_t v33 = [(NSMutableDictionary *)self->_blocksOnVisibilityChange objectForKey:*(void *)(*((void *)&v39 + 1) + 8 * k)];
            id v34 = (void *)v33;
            if (v33) {
              (*(void (**)(uint64_t, void))(v33 + 16))(v33, 0);
            }
          }
          uint64_t v30 = [v28 countByEnumeratingWithState:&v39 objects:v51 count:16];
        }
        while (v30);
      }

      char v8 = v37;
      id v4 = v38;
    }
    v35 = (NSSet *)[v12 copy];
    visibleCellsExcludingSafeArea = self->_visibleCellsExcludingSafeArea;
    self->_visibleCellsExcludingSafeArea = v35;
  }
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(PKDashboardViewController *)self _isIndexPathAHeader:v7]
    || [(PKDashboardViewController *)self _isIndexPathAFooter:v7])
  {
    char v8 = 0;
    double v9 = v7;
  }
  else
  {
    double v9 = [(PKDashboardViewController *)self _actualItemIndexPathForIndexPath:v7];

    double v10 = [(PKDashboardDataSource *)self->_dataSource itemAtIndexPath:v9];
    double v11 = [(id)objc_opt_class() identifier];
    if ([(PKDashboardViewController *)self methodsForItemIdentifier:v11])
    {
      double v12 = [(NSDictionary *)self->_presentersPerIdentifier objectForKey:v11];
      char v8 = [v12 canSelectItem:v10 inCollectionView:v6 atIndexPath:v9];
    }
    else
    {
      char v8 = 1;
    }
  }
  return v8;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  if (![(PKDashboardViewController *)self _isIndexPathAHeader:v6]
    && ![(PKDashboardViewController *)self _isIndexPathAFooter:v6]
    && ([v12 isEditing] & 1) == 0)
  {
    uint64_t v7 = [(PKDashboardViewController *)self _actualItemIndexPathForIndexPath:v6];

    char v8 = [(PKDashboardDataSource *)self->_dataSource itemAtIndexPath:v7];
    double v9 = [(id)objc_opt_class() identifier];
    double v10 = [(NSDictionary *)self->_presentersPerIdentifier objectForKey:v9];
    double v11 = [(PKDashboardViewController *)self navigationController];
    [v10 didSelectItem:v8 inCollectionView:v12 atIndexPath:v7 navigationController:v11 canPresent:0];

    id v6 = (id)v7;
  }
}

- (void)collectionView:(id)a3 didUnhighlightItemAtIndexPath:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  uint64_t v7 = [(PKDashboardViewController *)self _actualItemIndexPathForIndexPath:v6];
  BOOL v8 = -[PKDashboardViewController _isListSectionAtIndex:](self, "_isListSectionAtIndex:", [v7 section]);
  if ([v7 item] >= 1)
  {
    double v9 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForItem:inSection:", objc_msgSend(v6, "item") - 1, objc_msgSend(v6, "section"));
    double v10 = [v11 cellForItemAtIndexPath:v9];
    if (!v8)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [v10 setBottomSeparatorVisible:1 animated:1];
      }
    }
  }
}

- (void)collectionView:(id)a3 didHighlightItemAtIndexPath:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  uint64_t v7 = [(PKDashboardViewController *)self _actualItemIndexPathForIndexPath:v6];
  BOOL v8 = -[PKDashboardViewController _isListSectionAtIndex:](self, "_isListSectionAtIndex:", [v7 section]);
  if ([v7 item] >= 1)
  {
    double v9 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForItem:inSection:", objc_msgSend(v6, "item") - 1, objc_msgSend(v6, "section"));
    double v10 = [v11 cellForItemAtIndexPath:v9];
    if (!v8)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [v10 setBottomSeparatorVisible:0 animated:1];
      }
    }
  }
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  double v9 = *MEMORY[0x1E4F1DB30];
  double v10 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  if ([(PKDashboardViewController *)self _isIndexPathAHeader:v8])
  {
    titlesForSection = self->_titlesForSection;
    id v12 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v8, "section"));
    id v13 = [(NSMutableDictionary *)titlesForSection objectForKey:v12];

    if (v13)
    {
      sampleHeaderView = self->_sampleHeaderView;
      uint64_t v15 = [v13 title];
      [(PKDashboardTitleHeaderView *)sampleHeaderView setTitle:v15];

      -[PKDashboardTitleHeaderView setTitleStyle:](self->_sampleHeaderView, "setTitleStyle:", [v13 style]);
      uint64_t v16 = self->_sampleHeaderView;
      uint64_t v17 = [v13 actionTitle];
      [(PKDashboardTitleHeaderView *)v16 setActionTitle:v17];

      uint64_t v18 = self->_sampleHeaderView;
      id v19 = [v13 actionImage];
      [(PKDashboardTitleHeaderView *)v18 setActionImage:v19];

      id v20 = self->_sampleHeaderView;
      uint64_t v21 = [v13 action];
      [(PKDashboardTitleHeaderView *)v20 setAction:v21];

      -[PKDashboardTitleHeaderView setActionStyle:](self->_sampleHeaderView, "setActionStyle:", [v13 actionStyle]);
      uint64_t v22 = self->_sampleHeaderView;
      [v7 bounds];
      double v24 = v23;
      +[PKDashboardCollectionViewCell defaultHorizontalInset];
      -[PKDashboardTitleHeaderView sizeThatFits:](v22, "sizeThatFits:", v24 + v25 * -2.0, 3.40282347e38);
      double v9 = v26;
      double v10 = v27;
    }
  }
  else if ([(PKDashboardViewController *)self _isIndexPathAFooter:v8])
  {
    footerTextItemsBySection = self->_footerTextItemsBySection;
    uint64_t v29 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v8, "section"));
    id v13 = [(NSMutableDictionary *)footerTextItemsBySection objectForKey:v29];

    if (v13)
    {
      uint64_t v30 = [v13 footerText];
      uint64_t v31 = [v13 fdicConfiguration];
      if ([v30 length]) {
        BOOL v32 = 0;
      }
      else {
        BOOL v32 = v31 == 0;
      }
      if (!v32)
      {
        -[PKDashboardFooterTextView setMaximumLines:](self->_sampleFooterView, "setMaximumLines:", [v13 maximumNumberOfLines]);
        [(PKDashboardFooterTextView *)self->_sampleFooterView setFooterText:v30];
        -[PKDashboardFooterTextView setBottomInsetType:](self->_sampleFooterView, "setBottomInsetType:", [v13 bottomInsetType]);
        -[PKDashboardFooterTextView setUseCustomContentInsets:](self->_sampleFooterView, "setUseCustomContentInsets:", [v13 useCustomContentInsets]);
        sampleFooterView = self->_sampleFooterView;
        [v13 customContentInsets];
        -[PKDashboardFooterTextView setCustomContentInsets:](sampleFooterView, "setCustomContentInsets:");
        id v34 = self->_sampleFooterView;
        v35 = [v13 font];
        [(PKDashboardFooterTextView *)v34 setFont:v35];

        if (v31) {
          v36 = [[PKFDICSignageView alloc] initWithConfiguration:v31];
        }
        else {
          v36 = 0;
        }
        [(PKDashboardFooterTextView *)self->_sampleFooterView setAdditionalView:v36];
        long long v42 = self->_sampleFooterView;
        [v7 bounds];
        double v44 = v43;
        +[PKDashboardCollectionViewCell defaultHorizontalInset];
        -[PKDashboardFooterTextView sizeThatFits:](v42, "sizeThatFits:", v44 + v45 * -2.0, 3.40282347e38);
        double v9 = v46;
        double v10 = v47;
      }
    }
  }
  else
  {
    uint64_t v37 = [(PKDashboardViewController *)self _actualItemIndexPathForIndexPath:v8];

    id v13 = [(PKDashboardDataSource *)self->_dataSource itemAtIndexPath:v37];
    v38 = [(id)objc_opt_class() identifier];
    long long v39 = [(NSDictionary *)self->_presentersPerIdentifier objectForKey:v38];
    [v39 sizeForItem:v13 inCollectionView:v7 atIndexPath:v37];
    double v9 = v40;
    double v10 = v41;

    id v8 = (id)v37;
  }

  double v48 = v9;
  double v49 = v10;
  result.height = v49;
  result.width = v48;
  return result;
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v16 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [v9 section];
  if (v10 >= -[PKDashboardViewController numberOfSectionsInCollectionView:](self, "numberOfSectionsInCollectionView:", v16)|| (uint64_t v11 = [v9 item], v11 >= -[PKDashboardViewController collectionView:numberOfItemsInSection:](self, "collectionView:numberOfItemsInSection:", v16, objc_msgSend(v9, "section")))|| -[PKDashboardViewController _isIndexPathAHeader:](self, "_isIndexPathAHeader:", v9)|| -[PKDashboardViewController _isIndexPathAFooter:](self, "_isIndexPathAFooter:", v9))
  {
    id v12 = v9;
  }
  else
  {
    id v12 = [(PKDashboardViewController *)self _actualItemIndexPathForIndexPath:v9];

    id v13 = [(PKDashboardDataSource *)self->_dataSource itemAtIndexPath:v12];
    if (v13)
    {
      uint64_t v14 = [(id)objc_opt_class() identifier];
      if (([(PKDashboardViewController *)self methodsForItemIdentifier:v14] & 2) != 0)
      {
        uint64_t v15 = [(NSDictionary *)self->_presentersPerIdentifier objectForKey:v14];
        [v15 cellDidDisappear:v8 forItem:v13 inCollectionView:v16 atIndexPath:v12];
      }
    }
  }
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v14 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([(PKDashboardViewController *)self _isIndexPathAHeader:v9]
    || [(PKDashboardViewController *)self _isIndexPathAFooter:v9])
  {
    uint64_t v10 = v9;
  }
  else
  {
    uint64_t v10 = [(PKDashboardViewController *)self _actualItemIndexPathForIndexPath:v9];

    uint64_t v11 = [(PKDashboardDataSource *)self->_dataSource itemAtIndexPath:v10];
    if (v11)
    {
      id v12 = [(id)objc_opt_class() identifier];
      if (([(PKDashboardViewController *)self methodsForItemIdentifier:v12] & 4) != 0)
      {
        id v13 = [(NSDictionary *)self->_presentersPerIdentifier objectForKey:v12];
        [v13 cellWillAppear:v8 forItem:v11 inCollectionView:v14 atIndexPath:v10];
      }
    }
  }
}

- (BOOL)itemIsStackableInCollectionView:(id)a3 atIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(PKDashboardViewController *)self _isIndexPathAHeader:v7]
    || [(PKDashboardViewController *)self _isIndexPathAFooter:v7])
  {
    char v8 = 0;
    id v9 = v7;
  }
  else
  {
    id v9 = [(PKDashboardViewController *)self _actualItemIndexPathForIndexPath:v7];

    uint64_t v10 = [(PKDashboardDataSource *)self->_dataSource itemAtIndexPath:v9];
    if (v10)
    {
      uint64_t v11 = [(id)objc_opt_class() identifier];
      if (([(PKDashboardViewController *)self methodsForItemIdentifier:v11] & 0x10) != 0)
      {
        id v12 = [(NSDictionary *)self->_presentersPerIdentifier objectForKey:v11];
        char v8 = [v12 cellIsStackableForItem:v10 inCollectionView:v6 atIndexPath:v9];
      }
      else
      {
        char v8 = 0;
      }
    }
    else
    {
      char v8 = 0;
    }
  }
  return v8;
}

- (BOOL)itemIsIndependentInCollectionView:(id)a3 atIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(PKDashboardViewController *)self _isIndexPathAHeader:v7]
    || [(PKDashboardViewController *)self _isIndexPathAFooter:v7])
  {
    char v8 = 0;
    id v9 = v7;
  }
  else
  {
    id v9 = [(PKDashboardViewController *)self _actualItemIndexPathForIndexPath:v7];

    uint64_t v10 = [(PKDashboardDataSource *)self->_dataSource itemAtIndexPath:v9];
    if (v10)
    {
      uint64_t v11 = [(id)objc_opt_class() identifier];
      if (([(PKDashboardViewController *)self methodsForItemIdentifier:v11] & 0x20) != 0)
      {
        id v12 = [(NSDictionary *)self->_presentersPerIdentifier objectForKey:v11];
        char v8 = [v12 cellIsIndependentForItem:v10 inCollectionView:v6 atIndexPath:v9];
      }
      else
      {
        char v8 = 0;
      }
    }
    else
    {
      char v8 = 0;
    }
  }
  return v8;
}

- (BOOL)collectionView:(id)a3 layout:(id)a4 isListSectionAtIndex:(int64_t)a5
{
  return -[PKDashboardViewController _isListSectionAtIndex:](self, "_isListSectionAtIndex:", a5, a4);
}

- (BOOL)collectionView:(id)a3 layout:(id)a4 hasHeaderForSectionAtIndex:(int64_t)a5
{
  titlesForSection = self->_titlesForSection;
  id v6 = objc_msgSend(NSNumber, "numberWithInteger:", a5, a4);
  id v7 = [(NSMutableDictionary *)titlesForSection objectForKeyedSubscript:v6];
  LOBYTE(titlesForSection) = v7 != 0;

  return (char)titlesForSection;
}

- (BOOL)collectionView:(id)a3 layout:(id)a4 hasFooterForSectionAtIndex:(int64_t)a5
{
  footerTextItemsBySection = self->_footerTextItemsBySection;
  id v6 = objc_msgSend(NSNumber, "numberWithInteger:", a5, a4);
  id v7 = [(NSMutableDictionary *)footerTextItemsBySection objectForKeyedSubscript:v6];
  LOBYTE(footerTextItemsBySection) = v7 != 0;

  return (char)footerTextItemsBySection;
}

- (id)collectionView:(id)a3 layout:(id)a4 trailingSwipeActionsConfigurationForItemAtIndexPath:(id)a5
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dataSource = self->_dataSource;
  id v12 = [(PKDashboardViewController *)self _actualItemIndexPathForIndexPath:v10];
  id v13 = [(PKDashboardDataSource *)dataSource itemAtIndexPath:v12];

  if ((objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0
    && [(PKDashboardDataSource *)self->_dataSource canDeleteItem:v13])
  {
    id v14 = PKLocalizedString(&cfstr_DashboardTrail.isa);
    objc_initWeak(&location, self);
    uint64_t v15 = (void *)MEMORY[0x1E4FB1688];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __103__PKDashboardViewController_collectionView_layout_trailingSwipeActionsConfigurationForItemAtIndexPath___block_invoke;
    v21[3] = &unk_1E59D7B90;
    objc_copyWeak(&v23, &location);
    id v22 = v13;
    id v16 = [v15 contextualActionWithStyle:1 title:v14 handler:v21];
    uint64_t v17 = (void *)MEMORY[0x1E4FB1CC0];
    v25[0] = v16;
    uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
    id v19 = [v17 configurationWithActions:v18];

    [v19 setPerformsFirstActionWithFullSwipe:0];
    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }
  else
  {
    id v19 = 0;
  }

  return v19;
}

void __103__PKDashboardViewController_collectionView_layout_trailingSwipeActionsConfigurationForItemAtIndexPath___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  double v5 = (id *)(a1 + 40);
  id v6 = a4;
  id WeakRetained = (id *)objc_loadWeakRetained(v5);
  [WeakRetained[144] deleteItem:*(void *)(a1 + 32) completionHandler:v6];
}

- (void)updateContent
{
  if (self->_contentIsLoaded)
  {
    id v3 = [(PKDashboardViewController *)self collectionView];
    [v3 reloadData];

    id v4 = [(PKDashboardViewController *)self collectionViewLayout];
    [v4 invalidateLayout];

    if (self->_shouldPresentAllContent)
    {
      self->_presentationAnimated = 1;
      [(PKDashboardViewController *)self _presentAllContent];
    }
  }
}

- (void)contentIsLoaded
{
  if (!self->_contentIsLoaded)
  {
    self->_contentIsLoaded = 1;
    if ([(PKDashboardViewController *)self isViewLoaded])
    {
      [(PKDashboardViewController *)self updateContent];
    }
  }
}

- (void)invalidateLayoutForCell:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = [(PKDashboardViewController *)self collectionView];
  id v6 = [v5 indexPathForCell:v4];

  if (v6)
  {
    id v7 = [(PKDashboardViewController *)self collectionView];
    v9[0] = v6;
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
    [v7 reloadItemsAtIndexPaths:v8];
  }
}

- (void)itemChanged:(id)a3 atIndexPath:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  id v7 = [(PKDashboardViewController *)self collectionView];
  id v8 = [(PKDashboardViewController *)self _internalIndexPathForItemIndexPath:v6];
  id v9 = [v7 cellForItemAtIndexPath:v8];
  if (v9)
  {
    id v10 = [(id)objc_opt_class() identifier];
    uint64_t v11 = [(NSDictionary *)self->_presentersPerIdentifier objectForKey:v10];
    [v11 updateCell:v9 forItem:v12 inCollectionView:v7 atIndexPath:v6];
  }
}

- (void)performBatchUpdates:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PKDashboardViewController *)self collectionView];
  id v12 = v7;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __60__PKDashboardViewController_performBatchUpdates_completion___block_invoke;
  v13[3] = &unk_1E59CAA98;
  id v14 = v6;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __60__PKDashboardViewController_performBatchUpdates_completion___block_invoke_2;
  v11[3] = &unk_1E59CA9F8;
  id v9 = v7;
  id v10 = v6;
  [v8 performBatchUpdates:v13 completion:v11];
}

uint64_t __60__PKDashboardViewController_performBatchUpdates_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __60__PKDashboardViewController_performBatchUpdates_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)reloadSections:(id)a3
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __44__PKDashboardViewController_reloadSections___block_invoke;
  v6[3] = &unk_1E59CB5A0;
  v6[4] = self;
  id v4 = a3;
  [v4 enumerateIndexesUsingBlock:v6];
  double v5 = [(PKDashboardViewController *)self collectionView];
  [v5 reloadSections:v4];
}

void __44__PKDashboardViewController_reloadSections___block_invoke(uint64_t a1, uint64_t a2)
{
  id v9 = [*(id *)(*(void *)(a1 + 32) + 1152) titleForSection:a2];
  id v4 = *(void **)(*(void *)(a1 + 32) + 1048);
  double v5 = [NSNumber numberWithUnsignedInteger:a2];
  if (v9) {
    [v4 setObject:v9 forKey:v5];
  }
  else {
    [v4 removeObjectForKey:v5];
  }

  id v6 = [*(id *)(*(void *)(a1 + 32) + 1152) footerTextItemForSection:a2];
  id v7 = *(void **)(*(void *)(a1 + 32) + 1064);
  id v8 = [NSNumber numberWithUnsignedInteger:a2];
  if (v6) {
    [v7 setObject:v6 forKey:v8];
  }
  else {
    [v7 removeObjectForKey:v8];
  }
}

- (void)deleteItemsAtIndexPaths:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = -[PKDashboardViewController _internalIndexPathForItemIndexPath:](self, "_internalIndexPathForItemIndexPath:", *(void *)(*((void *)&v13 + 1) + 8 * v10), (void)v13);
        [v5 addObject:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  id v12 = [(PKDashboardViewController *)self collectionView];
  [v12 deleteItemsAtIndexPaths:v5];
}

- (void)insertItemsAtIndexPaths:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = -[PKDashboardViewController _internalIndexPathForItemIndexPath:](self, "_internalIndexPathForItemIndexPath:", *(void *)(*((void *)&v13 + 1) + 8 * v10), (void)v13);
        [v5 addObject:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  id v12 = [(PKDashboardViewController *)self collectionView];
  [v12 insertItemsAtIndexPaths:v5];
}

- (void)moveItemAtIndexPath:(id)a3 toIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(PKDashboardViewController *)self collectionView];
  [v8 moveItemAtIndexPath:v7 toIndexPath:v6];
}

- (void)insertSections:(id)a3
{
  id v4 = a3;
  id v5 = [(PKDashboardViewController *)self collectionView];
  [v5 insertSections:v4];
}

- (void)deleteSections:(id)a3
{
  id v4 = a3;
  id v5 = [(PKDashboardViewController *)self collectionView];
  [v5 deleteSections:v4];
}

- (void)moveSection:(int64_t)a3 toSection:(int64_t)a4
{
  id v6 = [(PKDashboardViewController *)self collectionView];
  [v6 moveSection:a3 toSection:a4];
}

- (void)_presentAllContent
{
  if (!self->_isPresentingContent)
  {
    id v3 = [(PKDashboardViewController *)self collectionView];
    customLayout = self->_customLayout;
    if (customLayout)
    {
      if (objc_opt_respondsToSelector())
      {
        self->_isPresentingContent = 1;
        if (self->_presentationAnimated)
        {
          v5[0] = MEMORY[0x1E4F143A8];
          v5[1] = 3221225472;
          v5[2] = __47__PKDashboardViewController__presentAllContent__block_invoke_2;
          v5[3] = &unk_1E59CAEA8;
          v5[4] = self;
          id v6 = v3;
          [v6 performBatchUpdates:&__block_literal_global_143 completion:v5];
        }
        else
        {
          [(PKDashboardLayout *)self->_customLayout revealContentAnimated:0];
          [(PKDashboardLayout *)self->_customLayout invalidateLayout];
          self->_isPresentingContent = 0;
        }
        goto LABEL_8;
      }
      customLayout = self->_customLayout;
    }
    [(PKDashboardLayout *)customLayout invalidateLayout];
LABEL_8:
  }
}

void __47__PKDashboardViewController__presentAllContent__block_invoke_2(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4FB1EB0];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 1128);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __47__PKDashboardViewController__presentAllContent__block_invoke_3;
  v6[3] = &unk_1E59CA870;
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 32);
  id v7 = v4;
  uint64_t v8 = v5;
  objc_msgSend(v2, "pkui_animateUsingFactory:withDelay:options:animations:completion:", v3, 0, v6, 0, 0.0);
}

uint64_t __47__PKDashboardViewController__presentAllContent__block_invoke_3(uint64_t a1)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __47__PKDashboardViewController__presentAllContent__block_invoke_4;
  v4[3] = &unk_1E59CA7D0;
  v1 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __47__PKDashboardViewController__presentAllContent__block_invoke_5;
  v3[3] = &unk_1E59CB6D8;
  v3[4] = v5;
  return [v1 performBatchUpdates:v4 completion:v3];
}

uint64_t __47__PKDashboardViewController__presentAllContent__block_invoke_4(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1088) revealContentAnimated:1];
}

uint64_t __47__PKDashboardViewController__presentAllContent__block_invoke_5(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 1098) = 0;
  return result;
}

- (void)_hideAllContentAnimated:(BOOL)a3
{
  if (!self->_isHidingContent)
  {
    BOOL v3 = a3;
    uint64_t v5 = [(PKDashboardViewController *)self collectionView];
    if (self->_customLayout && (objc_opt_respondsToSelector() & 1) != 0)
    {
      if (v3)
      {
        self->_isHidingContent = 1;
        id v6 = (void *)MEMORY[0x1E4FB1EB0];
        collectionViewFactordouble y = self->_collectionViewFactory;
        v8[0] = MEMORY[0x1E4F143A8];
        v8[1] = 3221225472;
        v8[2] = __53__PKDashboardViewController__hideAllContentAnimated___block_invoke;
        v8[3] = &unk_1E59CA870;
        id v9 = v5;
        uint64_t v10 = self;
        objc_msgSend(v6, "pkui_animateUsingFactory:withDelay:options:animations:completion:", collectionViewFactory, 0x20000, v8, 0, 0.0);
      }
      else
      {
        [(PKDashboardLayout *)self->_customLayout hideContent];
      }
    }
  }
}

uint64_t __53__PKDashboardViewController__hideAllContentAnimated___block_invoke(uint64_t a1)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __53__PKDashboardViewController__hideAllContentAnimated___block_invoke_2;
  v4[3] = &unk_1E59CA7D0;
  v1 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __53__PKDashboardViewController__hideAllContentAnimated___block_invoke_3;
  v3[3] = &unk_1E59CB6D8;
  v3[4] = v5;
  return [v1 performBatchUpdates:v4 completion:v3];
}

uint64_t __53__PKDashboardViewController__hideAllContentAnimated___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1088) hideContent];
}

uint64_t __53__PKDashboardViewController__hideAllContentAnimated___block_invoke_3(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 1099) = 0;
  return result;
}

- (void)_updateNavigationBarAppearance
{
  BOOL v3 = [(PKDashboardViewController *)self navigationItem];
  id v5 = v3;
  if (self->_useChromelessNavigationItem)
  {
    if (self->_freezeChromelessNavigationItem) {
      [v3 _setManualScrollEdgeAppearanceProgress:0.0];
    }
    else {
      [(PKDashboardViewController *)self _updateNavigationBarVisibility];
    }
    objc_msgSend(v5, "pkui_setupScrollEdgeChromelessAppearance");
    BOOL useChromelessNavigationItem = self->_useChromelessNavigationItem;
    BOOL v3 = v5;
  }
  else
  {
    BOOL useChromelessNavigationItem = 0;
  }
  [v3 _setManualScrollEdgeAppearanceEnabled:useChromelessNavigationItem];
  if (!self->_useChromelessNavigationItem)
  {
    [v5 setScrollEdgeAppearance:0];
    [v5 _setManualScrollEdgeAppearanceProgress:1.0];
  }
}

- (void)_updateNavigationBarVisibility
{
  if (self->_useChromelessNavigationItem && !self->_freezeChromelessNavigationItem)
  {
    id v4 = [(PKDashboardViewController *)self navigationItem];
    if ([(PKDashboardViewController *)self isViewLoaded])
    {
      BOOL v3 = [(PKDashboardViewController *)self collectionView];
      objc_msgSend(v3, "pkui_adjustManualScrollEdgeAppearanceProgressForNavigationItem:", v4);
    }
    else
    {
      [v4 _setManualScrollEdgeAppearanceProgress:0.0];
    }
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PKDashboardViewController;
  [(PKDashboardViewController *)&v19 traitCollectionDidChange:v4];
  if (self->_contentIsLoaded)
  {
    id v5 = [(PKDashboardViewController *)self traitCollection];
    presentersPerIdentifier = self->_presentersPerIdentifier;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __54__PKDashboardViewController_traitCollectionDidChange___block_invoke;
    v16[3] = &unk_1E59D8238;
    v16[4] = self;
    id v7 = v4;
    id v17 = v7;
    id v8 = v5;
    id v18 = v8;
    [(NSDictionary *)presentersPerIdentifier enumerateKeysAndObjectsUsingBlock:v16];
    if (v7)
    {
      if (v8)
      {
        id v9 = [v7 preferredContentSizeCategory];
        uint64_t v10 = [v8 preferredContentSizeCategory];
        NSComparisonResult v11 = UIContentSizeCategoryCompareToCategory(v9, v10);

        if (v11)
        {
          id v12 = [PKDashboardTitleHeaderView alloc];
          long long v13 = -[PKDashboardTitleHeaderView initWithFrame:](v12, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
          sampleHeaderView = self->_sampleHeaderView;
          self->_sampleHeaderView = v13;

          long long v15 = [(PKDashboardViewController *)self collectionView];
          [v15 reloadData];
        }
      }
    }
  }
}

void __54__PKDashboardViewController_traitCollectionDidChange___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v8 = a3;
  if (([*(id *)(a1 + 32) methodsForItemIdentifier:a2] & 8) != 0)
  {
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 48);
    id v7 = [*(id *)(a1 + 32) collectionView];
    [v8 traitCollectionDidChangeFromTrait:v6 toTrait:v5 inCollectionView:v7];
  }
}

- (PKDashboardDataSource)dataSource
{
  return self->_dataSource;
}

- (PKDashboardDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKDashboardDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)shouldPresentAllContent
{
  return self->_shouldPresentAllContent;
}

- (BOOL)freezeChromelessNavigationItem
{
  return self->_freezeChromelessNavigationItem;
}

- (BOOL)useChromelessNavigationItem
{
  return self->_useChromelessNavigationItem;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_blocksOnVisibilityChange, 0);
  objc_storeStrong((id *)&self->_collectionViewFactory, 0);
  objc_storeStrong((id *)&self->_customLayout, 0);
  objc_storeStrong((id *)&self->_visibleCellsExcludingSafeArea, 0);
  objc_storeStrong((id *)&self->_footerTextItemsBySection, 0);
  objc_storeStrong((id *)&self->_sampleFooterView, 0);
  objc_storeStrong((id *)&self->_titlesForSection, 0);
  objc_storeStrong((id *)&self->_sampleHeaderView, 0);
  objc_storeStrong((id *)&self->_presenterMethodsIndexPerIdentifier, 0);

  objc_storeStrong((id *)&self->_presentersPerIdentifier, 0);
}

@end