@interface SLDisambiguationCollectionViewController
- (BOOL)isInitialLoad;
- (CGRect)attributionViewFrame;
- (NSDictionary)attributionMap;
- (NSDiffableDataSourceSnapshot)snapshot;
- (SLDisambiguationCollectionViewController)initWithHighlight:(id)a3;
- (SLDisambiguationCompositionalLayout)layout;
- (SLHighlight)highlight;
- (UICollectionViewDiffableDataSource)dataSource;
- (id)cellForIndexPath:(id)a3 inCollectionView:(id)a4 withItemIdentifier:(id)a5;
- (id)createAttributionMapWithHighlight:(id)a3;
- (id)dataSourceWithCollectionView:(id)a3;
- (id)finalCompositionalLayout;
- (id)finalLayoutGroup:(id)a3 itemsCount:(unint64_t)a4 collectionWidth:(double)a5 targetItemHeight:(double)a6;
- (id)finalLayoutSectionForEnvironment:(id)a3;
- (id)initialCompositionalLayout;
- (id)initialLayoutGroup:(id)a3 itemsCount:(unint64_t)a4 collectionWidth:(double)a5 targetItemHeight:(double)a6;
- (id)initialLayoutSectionForEnvironment:(id)a3;
- (unint64_t)cellPillViewVariant;
- (void)collectionViewBackgroundTapped:(id)a3;
- (void)loadView;
- (void)setAttributionMap:(id)a3;
- (void)setAttributionViewFrame:(CGRect)a3;
- (void)setDataSource:(id)a3;
- (void)setHighlight:(id)a3;
- (void)setIsInitialLoad:(BOOL)a3;
- (void)setLayout:(id)a3;
- (void)setSnapshot:(id)a3;
- (void)startAnimation;
- (void)updateDataSourceSnapshot;
- (void)viewDidLayoutSubviews;
@end

@implementation SLDisambiguationCollectionViewController

- (SLDisambiguationCollectionViewController)initWithHighlight:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5 = [SLDisambiguationCompositionalLayout alloc];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __62__SLDisambiguationCollectionViewController_initWithHighlight___block_invoke;
  v11[3] = &unk_1E58AA230;
  objc_copyWeak(&v12, &location);
  v6 = [(SLDisambiguationCompositionalLayout *)v5 initWithSectionProvider:v11];
  [(SLDisambiguationCollectionViewController *)self setLayout:v6];

  [(SLDisambiguationCollectionViewController *)self setIsInitialLoad:1];
  v7 = [(SLDisambiguationCollectionViewController *)self layout];
  v10.receiver = self;
  v10.super_class = (Class)SLDisambiguationCollectionViewController;
  v8 = [(SLDisambiguationCollectionViewController *)&v10 initWithCollectionViewLayout:v7];

  if (v8) {
    [(SLDisambiguationCollectionViewController *)v8 setHighlight:v4];
  }
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

  return v8;
}

id __62__SLDisambiguationCollectionViewController_initWithHighlight___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v3 = (id *)(a1 + 32);
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained(v3);
  v6 = [WeakRetained initialLayoutSectionForEnvironment:v4];

  return v6;
}

- (void)loadView
{
  v30.receiver = self;
  v30.super_class = (Class)SLDisambiguationCollectionViewController;
  [(SLDisambiguationCollectionViewController *)&v30 loadView];
  id v3 = objc_alloc(MEMORY[0x1E4FB1568]);
  id v4 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v4 bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  v13 = [(SLDisambiguationCollectionViewController *)self layout];
  v14 = objc_msgSend(v3, "initWithFrame:collectionViewLayout:", v13, v6, v8, v10, v12);
  [(SLDisambiguationCollectionViewController *)self setCollectionView:v14];

  v15 = [(SLDisambiguationCollectionViewController *)self collectionView];
  [v15 setPrefetchingEnabled:0];

  v16 = [(SLDisambiguationCollectionViewController *)self collectionView];
  v17 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel_collectionViewBackgroundTapped_];
  [v16 addGestureRecognizer:v17];

  v18 = [(SLDisambiguationCollectionViewController *)self collectionView];
  v19 = [(SLDisambiguationCollectionViewController *)self dataSourceWithCollectionView:v18];
  [(SLDisambiguationCollectionViewController *)self setDataSource:v19];

  v20 = [(SLDisambiguationCollectionViewController *)self dataSource];
  v21 = [(SLDisambiguationCollectionViewController *)self collectionView];
  [v21 setDataSource:v20];

  v22 = [(SLDisambiguationCollectionViewController *)self collectionView];
  [v22 setDelegate:self];

  v23 = [(SLDisambiguationCollectionViewController *)self collectionView];
  uint64_t v24 = objc_opt_class();
  v25 = +[SLHighlightDisambiguationCell reuseIdentifier];
  [v23 registerClass:v24 forCellWithReuseIdentifier:v25];

  v26 = [MEMORY[0x1E4FB1618] clearColor];
  v27 = [v26 colorWithAlphaComponent:0.7];
  v28 = [(SLDisambiguationCollectionViewController *)self collectionView];
  [v28 setBackgroundColor:v27];

  v29 = [(SLDisambiguationCollectionViewController *)self collectionView];
  [v29 setAlpha:1.0];

  [(SLDisambiguationCollectionViewController *)self updateDataSourceSnapshot];
}

- (void)viewDidLayoutSubviews
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  v36.receiver = self;
  v36.super_class = (Class)SLDisambiguationCollectionViewController;
  [(SLDisambiguationCollectionViewController *)&v36 viewDidLayoutSubviews];
  if ([(SLDisambiguationCollectionViewController *)self isInitialLoad])
  {
    id v3 = [(SLDisambiguationCollectionViewController *)self view];
    id v4 = [v3 window];
    [(SLDisambiguationCollectionViewController *)self attributionViewFrame];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    v13 = [(SLDisambiguationCollectionViewController *)self collectionView];
    objc_msgSend(v4, "convertRect:toView:", v13, v6, v8, v10, v12);
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
    double v21 = v20;

    v22 = [(SLDisambiguationCollectionViewController *)self collectionView];
    v23 = [v22 visibleCells];
    uint64_t v24 = [v23 count];

    if (v24)
    {
      if ([(SLDisambiguationCollectionViewController *)self isInitialLoad])
      {
        long long v34 = 0u;
        long long v35 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        v25 = [(SLDisambiguationCollectionViewController *)self collectionView];
        v26 = [v25 visibleCells];

        uint64_t v27 = [v26 countByEnumeratingWithState:&v32 objects:v37 count:16];
        if (v27)
        {
          uint64_t v28 = v27;
          uint64_t v29 = *(void *)v33;
          do
          {
            uint64_t v30 = 0;
            do
            {
              if (*(void *)v33 != v29) {
                objc_enumerationMutation(v26);
              }
              id v31 = *(id *)(*((void *)&v32 + 1) + 8 * v30);
              [v31 setContentMode:1];
              objc_msgSend(v31, "setFrame:", v15, v17, v19, v21);

              ++v30;
            }
            while (v28 != v30);
            uint64_t v28 = [v26 countByEnumeratingWithState:&v32 objects:v37 count:16];
          }
          while (v28);
        }

        [(SLDisambiguationCollectionViewController *)self startAnimation];
        [(SLDisambiguationCollectionViewController *)self setIsInitialLoad:0];
      }
    }
  }
}

- (void)startAnimation
{
  id v3 = +[SLDisambiguationCollectionViewAnimator init];
  objc_initWeak(&location, self);
  id v4 = [SLDisambiguationCompositionalLayout alloc];
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  double v9 = __58__SLDisambiguationCollectionViewController_startAnimation__block_invoke;
  double v10 = &unk_1E58AA230;
  objc_copyWeak(&v11, &location);
  double v5 = [(SLDisambiguationCompositionalLayout *)v4 initWithSectionProvider:&v7];
  double v6 = [(SLDisambiguationCollectionViewController *)self collectionView];
  [v6 setCollectionViewLayout:v5 withAnimator:v3];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

id __58__SLDisambiguationCollectionViewController_startAnimation__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = (id *)(a1 + 32);
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained(v3);
  double v6 = [WeakRetained finalLayoutSectionForEnvironment:v4];

  return v6;
}

- (void)setHighlight:(id)a3
{
  double v6 = (SLHighlight *)a3;
  if (self->_highlight != v6)
  {
    objc_storeStrong((id *)&self->_highlight, a3);
    double v5 = [(SLDisambiguationCollectionViewController *)self createAttributionMapWithHighlight:v6];
    [(SLDisambiguationCollectionViewController *)self setAttributionMap:v5];
  }
}

- (void)updateDataSourceSnapshot
{
  id v3 = objc_alloc_init(MEMORY[0x1E4FB1360]);
  [(SLDisambiguationCollectionViewController *)self setSnapshot:v3];

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __68__SLDisambiguationCollectionViewController_updateDataSourceSnapshot__block_invoke;
  aBlock[3] = &unk_1E58A8720;
  aBlock[4] = self;
  id v4 = (void (**)(void))_Block_copy(aBlock);
  if ([MEMORY[0x1E4F29060] isMainThread]) {
    v4[2](v4);
  }
  else {
    dispatch_async(MEMORY[0x1E4F14428], v4);
  }
}

void __68__SLDisambiguationCollectionViewController_updateDataSourceSnapshot__block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F1CA48] array];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v3 = objc_msgSend(*(id *)(a1 + 32), "attributionMap", 0);
  id v4 = [v3 allKeys];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        if (([v2 containsObject:v9] & 1) == 0) {
          [v2 addObject:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v17 objects:v22 count:16];
    }
    while (v6);
  }

  double v10 = [*(id *)(a1 + 32) snapshot];
  uint64_t v11 = [v10 indexOfSectionIdentifier:@"MainSection"];

  if (v11 == 0x7FFFFFFFFFFFFFFFLL)
  {
    double v12 = [*(id *)(a1 + 32) snapshot];
    double v21 = @"MainSection";
    v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v21 count:1];
    [v12 appendSectionsWithIdentifiers:v13];
  }
  double v14 = [*(id *)(a1 + 32) snapshot];
  [v14 appendItemsWithIdentifiers:v2 intoSectionWithIdentifier:@"MainSection"];

  double v15 = [*(id *)(a1 + 32) dataSource];
  double v16 = [*(id *)(a1 + 32) snapshot];
  [v15 applySnapshot:v16 animatingDifferences:1];
}

- (id)createAttributionMapWithHighlight:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  double v16 = v4;
  uint64_t v6 = [v4 attributions];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        double v12 = [v11 uniqueIdentifier];
        uint64_t v13 = [v12 length];

        if (v13)
        {
          double v14 = [v11 uniqueIdentifier];
          [v5 setObject:v11 forKey:v14];
        }
        else
        {
          NSLog(&cfstr_Slattributiond.isa, self, v11);
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }

  return v5;
}

- (void)collectionViewBackgroundTapped:(id)a3
{
  id v4 = [a3 view];
  uint64_t v5 = [(SLDisambiguationCollectionViewController *)self collectionView];

  if (v4 == v5)
  {
    [(SLDisambiguationCollectionViewController *)self dismissViewControllerAnimated:1 completion:0];
  }
}

- (id)dataSourceWithCollectionView:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = objc_alloc(MEMORY[0x1E4FB1598]);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __73__SLDisambiguationCollectionViewController_dataSourceWithCollectionView___block_invoke;
  v8[3] = &unk_1E58AA258;
  objc_copyWeak(&v9, &location);
  uint64_t v6 = (void *)[v5 initWithCollectionView:v4 cellProvider:v8];
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

  return v6;
}

id __73__SLDisambiguationCollectionViewController_dataSourceWithCollectionView___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v6 = (id *)(a1 + 32);
  id v7 = a4;
  id v8 = a3;
  id v9 = a2;
  id WeakRetained = objc_loadWeakRetained(v6);
  uint64_t v11 = [WeakRetained cellForIndexPath:v8 inCollectionView:v9 withItemIdentifier:v7];

  return v11;
}

- (id)cellForIndexPath:(id)a3 inCollectionView:(id)a4 withItemIdentifier:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = +[SLHighlightDisambiguationCell reuseIdentifier];
  double v12 = [v9 dequeueReusableCellWithReuseIdentifier:v11 forIndexPath:v10];

  uint64_t v13 = [(SLDisambiguationCollectionViewController *)self attributionMap];
  double v14 = [v13 objectForKey:v8];

  if (v14) {
    [v12 updateWithAttribution:v14];
  }

  return v12;
}

- (id)finalCompositionalLayout
{
  objc_initWeak(&location, self);
  id v2 = objc_alloc(MEMORY[0x1E4FB1580]);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __68__SLDisambiguationCollectionViewController_finalCompositionalLayout__block_invoke;
  v5[3] = &unk_1E58AA230;
  objc_copyWeak(&v6, &location);
  id v3 = (void *)[v2 initWithSectionProvider:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
  return v3;
}

id __68__SLDisambiguationCollectionViewController_finalCompositionalLayout__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = (id *)(a1 + 32);
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained(v3);
  id v6 = [WeakRetained finalLayoutSectionForEnvironment:v4];

  return v6;
}

- (id)initialCompositionalLayout
{
  objc_initWeak(&location, self);
  id v2 = objc_alloc(MEMORY[0x1E4FB1580]);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __70__SLDisambiguationCollectionViewController_initialCompositionalLayout__block_invoke;
  v5[3] = &unk_1E58AA230;
  objc_copyWeak(&v6, &location);
  id v3 = (void *)[v2 initWithSectionProvider:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
  return v3;
}

id __70__SLDisambiguationCollectionViewController_initialCompositionalLayout__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = (id *)(a1 + 32);
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained(v3);
  id v6 = [WeakRetained initialLayoutSectionForEnvironment:v4];

  return v6;
}

- (id)finalLayoutSectionForEnvironment:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4FB1308];
  id v5 = a3;
  uint64_t v22 = [v4 absoluteDimension:335.0];
  id v6 = [MEMORY[0x1E4FB1308] absoluteDimension:64.0];
  id v7 = [MEMORY[0x1E4FB1338] sizeWithWidthDimension:v22 heightDimension:v6];
  id v8 = [MEMORY[0x1E4FB1328] itemWithLayoutSize:v7];
  objc_msgSend(v8, "setContentInsets:", 0.0, 0.0, 0.0, 0.0);
  id v9 = [MEMORY[0x1E4FB1308] fractionalWidthDimension:1.0];
  id v10 = [MEMORY[0x1E4FB1308] fractionalHeightDimension:1.0];
  uint64_t v11 = [MEMORY[0x1E4FB1338] sizeWithWidthDimension:v9 heightDimension:v10];
  double v12 = [(SLDisambiguationCollectionViewController *)self finalLayoutGroup:v11 itemsCount:[(NSDiffableDataSourceSnapshot *)self->_snapshot numberOfItems] collectionWidth:335.0 targetItemHeight:64.0];
  uint64_t v13 = [MEMORY[0x1E4FB1340] fixedSpacing:10.0];
  [v12 setInterItemSpacing:v13];

  double v14 = [v5 container];
  [v14 contentSize];
  double v15 = [v5 traitCollection];

  [v15 displayScale];
  UIRoundToScale();
  double v17 = v16;

  [v12 contentInsets];
  double v19 = v18;
  [v12 contentInsets];
  objc_msgSend(v12, "setContentInsets:", v19, v17);
  long long v20 = [MEMORY[0x1E4FB1330] sectionWithGroup:v12];

  return v20;
}

- (id)initialLayoutSectionForEnvironment:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4FB1308];
  id v5 = a3;
  uint64_t v22 = [v4 absoluteDimension:335.0];
  id v6 = [MEMORY[0x1E4FB1308] absoluteDimension:64.0];
  id v7 = [MEMORY[0x1E4FB1338] sizeWithWidthDimension:v22 heightDimension:v6];
  id v8 = [MEMORY[0x1E4FB1328] itemWithLayoutSize:v7];
  objc_msgSend(v8, "setContentInsets:", 0.0, 0.0, 0.0, 0.0);
  id v9 = [MEMORY[0x1E4FB1308] fractionalWidthDimension:1.0];
  id v10 = [MEMORY[0x1E4FB1308] fractionalHeightDimension:1.0];
  uint64_t v11 = [MEMORY[0x1E4FB1338] sizeWithWidthDimension:v9 heightDimension:v10];
  double v12 = [(SLDisambiguationCollectionViewController *)self initialLayoutGroup:v11 itemsCount:[(NSDiffableDataSourceSnapshot *)self->_snapshot numberOfItems] collectionWidth:335.0 targetItemHeight:64.0];
  uint64_t v13 = [MEMORY[0x1E4FB1340] fixedSpacing:10.0];
  [v12 setInterItemSpacing:v13];

  double v14 = [v5 container];
  [v14 contentSize];
  double v15 = [v5 traitCollection];

  [v15 displayScale];
  UIRoundToScale();
  double v17 = v16;

  [v12 contentInsets];
  double v19 = v18;
  [v12 contentInsets];
  objc_msgSend(v12, "setContentInsets:", v19, v17);
  long long v20 = [MEMORY[0x1E4FB1330] sectionWithGroup:v12];

  return v20;
}

- (id)initialLayoutGroup:(id)a3 itemsCount:(unint64_t)a4 collectionWidth:(double)a5 targetItemHeight:(double)a6
{
  id v8 = a3;
  objc_initWeak(&location, self);
  id v9 = (void *)MEMORY[0x1E4FB1318];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __107__SLDisambiguationCollectionViewController_initialLayoutGroup_itemsCount_collectionWidth_targetItemHeight___block_invoke;
  v12[3] = &unk_1E58AA280;
  v13[1] = (id)a4;
  objc_copyWeak(v13, &location);
  id v10 = [v9 customGroupWithLayoutSize:v8 itemProvider:v12];
  objc_destroyWeak(v13);
  objc_destroyWeak(&location);

  return v10;
}

id __107__SLDisambiguationCollectionViewController_initialLayoutGroup_itemsCount_collectionWidth_targetItemHeight___block_invoke(uint64_t a1)
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:*(void *)(a1 + 40)];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = [WeakRetained view];
  id v5 = [v4 window];
  id v6 = objc_loadWeakRetained((id *)(a1 + 32));
  [v6 attributionViewFrame];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  id v15 = objc_loadWeakRetained((id *)(a1 + 32));
  double v16 = [v15 collectionView];
  objc_msgSend(v5, "convertRect:toView:", v16, v8, v10, v12, v14);
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;

  if (*(void *)(a1 + 40))
  {
    unint64_t v25 = 0;
    do
    {
      v26 = objc_msgSend(MEMORY[0x1E4FB1320], "customItemWithFrame:zIndex:", v25, v18, v20, v22, v24);
      [v2 addObject:v26];
      ++v25;
    }
    while (*(void *)(a1 + 40) > v25);
  }
  return v2;
}

- (id)finalLayoutGroup:(id)a3 itemsCount:(unint64_t)a4 collectionWidth:(double)a5 targetItemHeight:(double)a6
{
  id v10 = a3;
  objc_initWeak(&location, self);
  double v11 = (void *)MEMORY[0x1E4FB1318];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __105__SLDisambiguationCollectionViewController_finalLayoutGroup_itemsCount_collectionWidth_targetItemHeight___block_invoke;
  v14[3] = &unk_1E58AA2A8;
  v15[1] = (id)a4;
  objc_copyWeak(v15, &location);
  v15[2] = *(id *)&a5;
  v15[3] = *(id *)&a6;
  double v12 = [v11 customGroupWithLayoutSize:v10 itemProvider:v14];
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);

  return v12;
}

id __105__SLDisambiguationCollectionViewController_finalLayoutGroup_itemsCount_collectionWidth_targetItemHeight___block_invoke(uint64_t a1)
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:*(void *)(a1 + 40)];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = [WeakRetained collectionView];
  [v4 frame];
  double v6 = v5;

  id v7 = objc_loadWeakRetained((id *)(a1 + 32));
  double v8 = [v7 collectionView];
  [v8 frame];
  double v10 = v9;
  double v11 = *(double *)(a1 + 48);

  unint64_t v12 = *(void *)(a1 + 40);
  if (v12)
  {
    unint64_t v13 = 0;
    double v14 = v6 * 0.5;
    double v15 = (v10 - v11) * 0.5;
    double MaxY = 0.0;
    do
    {
      CGFloat v18 = *(double *)(a1 + 48);
      double v17 = *(double *)(a1 + 56);
      double v19 = v14 + (double)v12 * -0.5 * v17;
      if (v13) {
        double v19 = MaxY;
      }
      CGFloat v20 = v19 + 10.0;
      double v21 = objc_msgSend(MEMORY[0x1E4FB1320], "customItemWithFrame:zIndex:", v13, v15, v19 + 10.0, *(double *)(a1 + 48), *(double *)(a1 + 56));
      [v2 addObject:v21];
      v24.origin.x = v15;
      v24.origin.y = v20;
      v24.size.width = v18;
      v24.size.height = v17;
      double MaxY = CGRectGetMaxY(v24);
      ++v13;

      unint64_t v12 = *(void *)(a1 + 40);
    }
    while (v12 > v13);
  }
  return v2;
}

- (unint64_t)cellPillViewVariant
{
  id v3 = [(SLDisambiguationCollectionViewController *)self collectionView];
  id v4 = [v3 visibleCells];

  if (!v4) {
    return 0;
  }
  double v5 = [(SLDisambiguationCollectionViewController *)self collectionView];
  double v6 = [v5 visibleCells];
  id v7 = [v6 firstObject];

  double v8 = [v7 expandedAttributionView];
  unint64_t v9 = [v8 pillVariant];

  return v9;
}

- (CGRect)attributionViewFrame
{
  double x = self->_attributionViewFrame.origin.x;
  double y = self->_attributionViewFrame.origin.y;
  double width = self->_attributionViewFrame.size.width;
  double height = self->_attributionViewFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setAttributionViewFrame:(CGRect)a3
{
  self->_attributionViewFrame = a3;
}

- (UICollectionViewDiffableDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
}

- (NSDiffableDataSourceSnapshot)snapshot
{
  return self->_snapshot;
}

- (void)setSnapshot:(id)a3
{
}

- (NSDictionary)attributionMap
{
  return self->_attributionMap;
}

- (void)setAttributionMap:(id)a3
{
}

- (SLHighlight)highlight
{
  return self->_highlight;
}

- (SLDisambiguationCompositionalLayout)layout
{
  return self->_layout;
}

- (void)setLayout:(id)a3
{
}

- (BOOL)isInitialLoad
{
  return self->_isInitialLoad;
}

- (void)setIsInitialLoad:(BOOL)a3
{
  self->_isInitialLoad = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layout, 0);
  objc_storeStrong((id *)&self->_highlight, 0);
  objc_storeStrong((id *)&self->_attributionMap, 0);
  objc_storeStrong((id *)&self->_snapshot, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
}

@end