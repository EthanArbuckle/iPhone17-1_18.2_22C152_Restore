@interface SFCapsuleCollectionViewUpdate
- (BOOL)isAnimated;
- (NSArray)itemsAfterUpdate;
- (NSArray)itemsBeforeUpdate;
- (NSIndexSet)indexesOfDeletedItems;
- (NSIndexSet)indexesOfInsertedItems;
- (NSIndexSet)indexesOfVisibleItemsBeforeUpdate;
- (NSSet)deletedItems;
- (SFCapsuleCollectionView)collectionView;
- (SFCapsuleCollectionViewUpdate)initWithCollectionView:(id)a3;
- (int64_t)indexAfterUpdateOfSelectedItemBeforeUpdate;
- (int64_t)indexBeforeUpdateOfSelectedItemAfterUpdate;
- (int64_t)selectedItemIndexAfterUpdate;
- (int64_t)selectedItemIndexBeforeUpdate;
- (void)_calculateIndexesIfNeeded;
- (void)deleteItemsAtIndexes:(id)a3 animated:(BOOL)a4;
- (void)insertItemsAtIndexes:(id)a3 animated:(BOOL)a4;
- (void)setSelectedItemIndex:(int64_t)a3 animated:(BOOL)a4;
@end

@implementation SFCapsuleCollectionViewUpdate

- (SFCapsuleCollectionViewUpdate)initWithCollectionView:(id)a3
{
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)SFCapsuleCollectionViewUpdate;
  v5 = [(SFCapsuleCollectionViewUpdate *)&v26 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_collectionView, v4);
    v7 = [v4 _items];
    uint64_t v8 = [v7 copy];
    itemsBeforeUpdate = v6->_itemsBeforeUpdate;
    v6->_itemsBeforeUpdate = (NSArray *)v8;

    v10 = [v4 _indexesOfVisibleItemsIncludingAction:1];
    uint64_t v11 = [v10 copy];
    indexesOfVisibleItemsBeforeUpdate = v6->_indexesOfVisibleItemsBeforeUpdate;
    v6->_indexesOfVisibleItemsBeforeUpdate = (NSIndexSet *)v11;

    v6->_selectedItemIndexBeforeUpdate = [v4 selectedItemIndex];
    v13 = [v4 _items];
    uint64_t v14 = [v13 mutableCopy];
    itemsAfterUpdate = v6->_itemsAfterUpdate;
    v6->_itemsAfterUpdate = (NSMutableArray *)v14;

    v6->_selectedItemIndexAfterUpdate = v6->_selectedItemIndexBeforeUpdate;
    uint64_t v16 = [MEMORY[0x1E4F1CA80] set];
    deletedItems = v6->_deletedItems;
    v6->_deletedItems = (NSMutableSet *)v16;

    uint64_t v18 = [MEMORY[0x1E4F1CA80] set];
    insertedItems = v6->_insertedItems;
    v6->_insertedItems = (NSMutableSet *)v18;

    uint64_t v20 = [MEMORY[0x1E4F28D60] indexSet];
    indexesOfDeletedItems = v6->_indexesOfDeletedItems;
    v6->_indexesOfDeletedItems = (NSIndexSet *)v20;

    uint64_t v22 = [MEMORY[0x1E4F28D60] indexSet];
    indexesOfInsertedItems = v6->_indexesOfInsertedItems;
    v6->_indexesOfInsertedItems = (NSIndexSet *)v22;

    v24 = v6;
  }

  return v6;
}

- (void)setSelectedItemIndex:(int64_t)a3 animated:(BOOL)a4
{
  if (self->_selectedItemIndexAfterUpdate != a3)
  {
    indexesOfDeletedItems = self->_indexesOfDeletedItems;
    self->_indexesOfDeletedItems = 0;

    indexesOfInsertedItems = self->_indexesOfInsertedItems;
    self->_indexesOfInsertedItems = 0;

    self->_selectedItemIndexAfterUpdate = a3;
    BOOL v9 = self->_animated || a4;
    self->_animated = v9;
  }
}

- (void)insertItemsAtIndexes:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ([v6 count])
  {
    indexesOfDeletedItems = self->_indexesOfDeletedItems;
    self->_indexesOfDeletedItems = 0;

    indexesOfInsertedItems = self->_indexesOfInsertedItems;
    self->_indexesOfInsertedItems = 0;

    BOOL v9 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v6, "count"));
    unint64_t v10 = [v9 count];
    if (v10 < [v6 count])
    {
      do
      {
        uint64_t v11 = [SFCapsuleCollectionViewItem alloc];
        id WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);
        v13 = [(SFCapsuleCollectionViewItem *)v11 initWithCollectionView:WeakRetained];
        [v9 addObject:v13];

        unint64_t v14 = [v9 count];
      }
      while (v14 < [v6 count]);
    }
    [(NSMutableSet *)self->_insertedItems addObjectsFromArray:v9];
    [(NSMutableArray *)self->_itemsAfterUpdate insertObjects:v9 atIndexes:v6];
    int64_t selectedItemIndexAfterUpdate = self->_selectedItemIndexAfterUpdate;
    self->_int64_t selectedItemIndexAfterUpdate = objc_msgSend(v6, "countOfIndexesInRange:", 0, selectedItemIndexAfterUpdate + 1)+ selectedItemIndexAfterUpdate;
    if ([(NSMutableArray *)self->_itemsAfterUpdate count] > 1)
    {
      int64_t v16 = self->_selectedItemIndexAfterUpdate;
      if (v16 >= [(NSMutableArray *)self->_itemsAfterUpdate count] - 1) {
        self->_int64_t selectedItemIndexAfterUpdate = [(NSMutableArray *)self->_itemsAfterUpdate count] - 2;
      }
    }
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __63__SFCapsuleCollectionViewUpdate_insertItemsAtIndexes_animated___block_invoke;
    v20[3] = &unk_1E54E9920;
    v20[4] = self;
    v17 = [v6 indexesPassingTest:v20];
    uint64_t v18 = v17;
    BOOL animated = self->_animated;
    if (!self->_animated && v4) {
      BOOL animated = [v17 count] != 0;
    }
    self->_BOOL animated = animated;
  }
}

BOOL __63__SFCapsuleCollectionViewUpdate_insertItemsAtIndexes_animated___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2 - *(void *)(*(void *)(a1 + 32) + 104);
  if (v2 < 0) {
    uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 104) - a2;
  }
  return (unint64_t)v2 < 2;
}

- (void)deleteItemsAtIndexes:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  indexesOfDeletedItems = self->_indexesOfDeletedItems;
  self->_indexesOfDeletedItems = 0;

  indexesOfInsertedItems = self->_indexesOfInsertedItems;
  self->_indexesOfInsertedItems = 0;

  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __63__SFCapsuleCollectionViewUpdate_deleteItemsAtIndexes_animated___block_invoke;
  v22[3] = &unk_1E54E9920;
  v22[4] = self;
  BOOL v9 = [v6 indexesPassingTest:v22];
  unint64_t v10 = v9;
  BOOL animated = self->_animated;
  if (!self->_animated && v4) {
    BOOL animated = [v9 count] != 0;
  }
  self->_BOOL animated = animated;
  deletedItems = self->_deletedItems;
  v13 = [(NSMutableArray *)self->_itemsAfterUpdate objectsAtIndexes:v6];
  [(NSMutableSet *)deletedItems addObjectsFromArray:v13];

  unint64_t v14 = (void *)[(NSMutableArray *)self->_itemsAfterUpdate copy];
  [(NSMutableArray *)self->_itemsAfterUpdate removeObjectsAtIndexes:v6];
  int64_t selectedItemIndexAfterUpdate = self->_selectedItemIndexAfterUpdate;
  for (uint64_t i = [(NSMutableArray *)self->_itemsAfterUpdate count];
        selectedItemIndexAfterUpdate < i - 1
     && [v6 containsIndex:selectedItemIndexAfterUpdate];
        uint64_t i = [(NSMutableArray *)self->_itemsAfterUpdate count])
  {
    ++selectedItemIndexAfterUpdate;
  }
  if (selectedItemIndexAfterUpdate >= 1)
  {
    while ([v6 containsIndex:selectedItemIndexAfterUpdate])
    {
      if (selectedItemIndexAfterUpdate-- <= 1)
      {
        int64_t selectedItemIndexAfterUpdate = 0;
        break;
      }
    }
  }
  itemsAfterUpdate = self->_itemsAfterUpdate;
  v19 = [v14 objectAtIndexedSubscript:selectedItemIndexAfterUpdate];
  uint64_t v20 = [(NSMutableArray *)itemsAfterUpdate indexOfObject:v19];

  if (v20 == 0x7FFFFFFFFFFFFFFFLL) {
    int64_t v21 = 0;
  }
  else {
    int64_t v21 = v20;
  }
  self->_int64_t selectedItemIndexAfterUpdate = v21;
}

BOOL __63__SFCapsuleCollectionViewUpdate_deleteItemsAtIndexes_animated___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2 - *(void *)(*(void *)(a1 + 32) + 104);
  if (v2 < 0) {
    uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 104) - a2;
  }
  return (unint64_t)v2 < 2;
}

- (NSIndexSet)indexesOfDeletedItems
{
  [(SFCapsuleCollectionViewUpdate *)self _calculateIndexesIfNeeded];
  indexesOfDeletedItems = self->_indexesOfDeletedItems;

  return indexesOfDeletedItems;
}

- (NSIndexSet)indexesOfInsertedItems
{
  [(SFCapsuleCollectionViewUpdate *)self _calculateIndexesIfNeeded];
  indexesOfInsertedItems = self->_indexesOfInsertedItems;

  return indexesOfInsertedItems;
}

- (void)_calculateIndexesIfNeeded
{
  if (!self->_indexesOfDeletedItems || !self->_indexesOfInsertedItems)
  {
    *(int64x2_t *)&self->_indexBeforeUpdateOfSelectedItemAfterUpdate = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
    if ([(NSArray *)self->_itemsBeforeUpdate count] < 2)
    {
      v3 = 0;
    }
    else
    {
      v3 = [(NSArray *)self->_itemsBeforeUpdate objectAtIndexedSubscript:self->_selectedItemIndexBeforeUpdate];
    }
    if ((unint64_t)[(NSMutableArray *)self->_itemsAfterUpdate count] < 2)
    {
      BOOL v4 = 0;
    }
    else
    {
      BOOL v4 = [(NSMutableArray *)self->_itemsAfterUpdate objectAtIndexedSubscript:self->_selectedItemIndexAfterUpdate];
    }
    itemsBeforeUpdate = self->_itemsBeforeUpdate;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __58__SFCapsuleCollectionViewUpdate__calculateIndexesIfNeeded__block_invoke;
    v16[3] = &unk_1E54E9948;
    id v17 = v4;
    uint64_t v18 = self;
    id v6 = v4;
    v7 = [(NSArray *)itemsBeforeUpdate indexesOfObjectsPassingTest:v16];
    indexesOfDeletedItems = self->_indexesOfDeletedItems;
    self->_indexesOfDeletedItems = v7;

    itemsAfterUpdate = self->_itemsAfterUpdate;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __58__SFCapsuleCollectionViewUpdate__calculateIndexesIfNeeded__block_invoke_2;
    v13[3] = &unk_1E54E9948;
    id v14 = v3;
    v15 = self;
    id v10 = v3;
    uint64_t v11 = [(NSMutableArray *)itemsAfterUpdate indexesOfObjectsPassingTest:v13];
    indexesOfInsertedItems = self->_indexesOfInsertedItems;
    self->_indexesOfInsertedItems = v11;
  }
}

uint64_t __58__SFCapsuleCollectionViewUpdate__calculateIndexesIfNeeded__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a1 + 32) == a2) {
    *(void *)(*(void *)(a1 + 40) + 56) = a3;
  }
  return [*(id *)(*(void *)(a1 + 40) + 16) containsObject:a2];
}

uint64_t __58__SFCapsuleCollectionViewUpdate__calculateIndexesIfNeeded__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a1 + 32) == a2) {
    *(void *)(*(void *)(a1 + 40) + 64) = a3;
  }
  return [*(id *)(*(void *)(a1 + 40) + 24) containsObject:a2];
}

- (int64_t)indexBeforeUpdateOfSelectedItemAfterUpdate
{
  return self->_indexBeforeUpdateOfSelectedItemAfterUpdate;
}

- (int64_t)indexAfterUpdateOfSelectedItemBeforeUpdate
{
  return self->_indexAfterUpdateOfSelectedItemBeforeUpdate;
}

- (SFCapsuleCollectionView)collectionView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);

  return (SFCapsuleCollectionView *)WeakRetained;
}

- (NSArray)itemsBeforeUpdate
{
  return self->_itemsBeforeUpdate;
}

- (NSIndexSet)indexesOfVisibleItemsBeforeUpdate
{
  return self->_indexesOfVisibleItemsBeforeUpdate;
}

- (int64_t)selectedItemIndexBeforeUpdate
{
  return self->_selectedItemIndexBeforeUpdate;
}

- (NSArray)itemsAfterUpdate
{
  return &self->_itemsAfterUpdate->super;
}

- (int64_t)selectedItemIndexAfterUpdate
{
  return self->_selectedItemIndexAfterUpdate;
}

- (BOOL)isAnimated
{
  return self->_animated;
}

- (NSSet)deletedItems
{
  return &self->_deletedItems->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexesOfVisibleItemsBeforeUpdate, 0);
  objc_storeStrong((id *)&self->_itemsBeforeUpdate, 0);
  objc_destroyWeak((id *)&self->_collectionView);
  objc_storeStrong((id *)&self->_indexesOfInsertedItems, 0);
  objc_storeStrong((id *)&self->_indexesOfDeletedItems, 0);
  objc_storeStrong((id *)&self->_insertedItems, 0);
  objc_storeStrong((id *)&self->_deletedItems, 0);

  objc_storeStrong((id *)&self->_itemsAfterUpdate, 0);
}

@end