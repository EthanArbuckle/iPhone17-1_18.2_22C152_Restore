@interface ICDataSource
- (BOOL)isTogglingLock;
- (ICDataSource)initWithCollectionView:(id)a3 cellProvider:(id)a4;
- (ICItemIdentifier)firstRelevantItemIdentifier;
- (NSArray)sectionTypes;
- (UICollectionView)collectionView;
- (UICollectionViewDiffableDataSource)collectionViewDiffableDataSource;
- (id)associatedCellsForItemIdentifiers:(id)a3;
- (id)nextRelevantItemIdentifierAfter:(id)a3;
- (id)willCollapseItemHandler;
- (id)willExpandItemHandler;
- (void)dealloc;
- (void)noteLockManagerDidToggleLock:(id)a3;
- (void)noteLockManagerWillToggleLock:(id)a3;
- (void)reindexDataAnimated:(BOOL)a3;
- (void)reloadDataAnimated:(BOOL)a3;
- (void)setSectionTypes:(id)a3;
- (void)setTogglingLock:(BOOL)a3;
- (void)setWillCollapseItemHandler:(id)a3;
- (void)setWillExpandItemHandler:(id)a3;
@end

@implementation ICDataSource

- (UICollectionViewDiffableDataSource)collectionViewDiffableDataSource
{
  return self->_collectionViewDiffableDataSource;
}

- (void)setWillExpandItemHandler:(id)a3
{
}

- (void)setSectionTypes:(id)a3
{
}

- (ICDataSource)initWithCollectionView:(id)a3 cellProvider:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)ICDataSource;
  v8 = [(ICDataSource *)&v18 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_collectionView, v6);
    uint64_t v10 = [objc_alloc(MEMORY[0x1E4FB1598]) initWithCollectionView:v6 cellProvider:v7];
    collectionViewDiffableDataSource = v9->_collectionViewDiffableDataSource;
    v9->_collectionViewDiffableDataSource = (UICollectionViewDiffableDataSource *)v10;

    v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v12 addObserver:v9 selector:sel_accountHidesNotesInCustomFoldersDidChange_ name:*MEMORY[0x1E4F82FD8] object:0];

    v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v13 addObserver:v9 selector:sel_accountHidesNotesInCustomFoldersDidChange_ name:*MEMORY[0x1E4F82FC8] object:0];

    v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v14 addObserver:v9 selector:sel_accountHidesNotesInCustomFoldersDidChange_ name:*MEMORY[0x1E4F82FD0] object:0];

    v15 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v15 addObserver:v9 selector:sel_noteLockManagerWillToggleLock_ name:@"ICNoteLockManagerWillToggleLock" object:0];

    v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v16 addObserver:v9 selector:sel_noteLockManagerDidToggleLock_ name:@"ICNoteLockManagerDidToggleLock" object:0];
  }
  return v9;
}

- (UICollectionView)collectionView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);
  return (UICollectionView *)WeakRetained;
}

- (NSArray)sectionTypes
{
  return self->_sectionTypes;
}

- (BOOL)isTogglingLock
{
  return self->_togglingLock;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)ICDataSource;
  [(ICDataSource *)&v4 dealloc];
}

- (void)reloadDataAnimated:(BOOL)a3
{
}

- (void)reindexDataAnimated:(BOOL)a3
{
}

- (id)associatedCellsForItemIdentifiers:(id)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __50__ICDataSource_associatedCellsForItemIdentifiers___block_invoke;
  v5[3] = &unk_1E5FDD7B8;
  v5[4] = self;
  v3 = objc_msgSend(a3, "ic_compactMap:", v5);
  return v3;
}

id __50__ICDataSource_associatedCellsForItemIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  v5 = [v3 collectionViewDiffableDataSource];
  id v6 = [v5 indexPathForItemIdentifier:v4];

  if (v6)
  {
    id v7 = [*(id *)(a1 + 32) collectionView];
    v8 = [v7 cellForItemAtIndexPath:v6];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)nextRelevantItemIdentifierAfter:(id)a3
{
  return 0;
}

- (void)noteLockManagerWillToggleLock:(id)a3
{
}

- (void)noteLockManagerDidToggleLock:(id)a3
{
}

- (id)willExpandItemHandler
{
  return self->_willExpandItemHandler;
}

- (id)willCollapseItemHandler
{
  return self->_willCollapseItemHandler;
}

- (void)setWillCollapseItemHandler:(id)a3
{
}

- (ICItemIdentifier)firstRelevantItemIdentifier
{
  return self->_firstRelevantItemIdentifier;
}

- (void)setTogglingLock:(BOOL)a3
{
  self->_togglingLock = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_firstRelevantItemIdentifier, 0);
  objc_storeStrong(&self->_willCollapseItemHandler, 0);
  objc_storeStrong(&self->_willExpandItemHandler, 0);
  objc_storeStrong((id *)&self->_sectionTypes, 0);
  objc_storeStrong((id *)&self->_collectionViewDiffableDataSource, 0);
  objc_destroyWeak((id *)&self->_collectionView);
}

@end