@interface NSDiffableDataSourceSectionSnapshot
- (BOOL)_itemHasChildren:(id)a3;
- (BOOL)containsItem:(id)item;
- (BOOL)isEqual:(id)a3;
- (BOOL)isExpanded:(id)item;
- (BOOL)isVisible:(id)item;
- (NSArray)_rootItems;
- (NSArray)collapsedItemsUpdates;
- (NSArray)expandedItems;
- (NSArray)expandedItemsUpdates;
- (NSArray)items;
- (NSArray)rootItems;
- (NSArray)visibleItems;
- (NSDiffableDataSourceSectionSnapshot)init;
- (NSDiffableDataSourceSectionSnapshot)initWithSnapshot:(id)a3;
- (NSDiffableDataSourceSectionSnapshot)initWithState:(id)a3;
- (NSDiffableDataSourceSectionSnapshot)snapshotOfParentItem:(id)parentItem;
- (NSDiffableDataSourceSectionSnapshot)snapshotOfParentItem:(id)parentItem includingParentItem:(BOOL)includingParentItem;
- (NSIndexSet)_visibleIndexes;
- (NSInteger)indexOfItem:(id)item;
- (NSInteger)levelOfItem:(id)item;
- (NSOrderedSet)_itemsOrderedSet;
- (NSOrderedSet)_visibleItemsOrderedSet;
- (NSString)visualDescription;
- (_NSDiffableDataSourceSectionSnapshotState)_state;
- (id)_indexesOfChildrenForParent:(id)a3 recursive:(BOOL)a4;
- (id)_indexesOfItems:(id)a3;
- (id)_indexesOfItems:(id)a3 ignoringItemsNotFound:(BOOL)a4;
- (id)_itemAfterItem:(id)a3;
- (id)_itemBeforeItem:(id)a3;
- (id)childrenOfParent:(id)a3;
- (id)childrenOfParent:(id)a3 recursive:(BOOL)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)insertSnapshot:(NSDiffableDataSourceSectionSnapshot *)snapshot afterItem:(id)item;
- (id)parentOfChildItem:(id)childItem;
- (id)snapshotter;
- (void)_prepareForApplyToDataSource;
- (void)_replaceItem:(id)a3 withItem:(id)a4;
- (void)appendItems:(NSArray *)items;
- (void)appendItems:(NSArray *)items intoParentItem:(id)parentItem;
- (void)collapseItems:(NSArray *)items;
- (void)deleteAllItems;
- (void)deleteItems:(NSArray *)items;
- (void)deleteItems:(id)a3 orphanDisposition:(int64_t)a4;
- (void)expandItems:(NSArray *)items;
- (void)insertItems:(NSArray *)items afterItem:(id)afterIdentifier;
- (void)insertItems:(NSArray *)items beforeItem:(id)beforeIdentifier;
- (void)insertItems:(id)a3 afterItem:(id)a4 insertionMode:(int64_t)a5;
- (void)insertSnapshot:(NSDiffableDataSourceSectionSnapshot *)snapshot beforeItem:(id)item;
- (void)replaceChildrenOfParentItem:(id)parentItem withSnapshot:(NSDiffableDataSourceSectionSnapshot *)snapshot;
- (void)setChildrenWithSnapshot:(id)a3 forParent:(id)a4;
@end

@implementation NSDiffableDataSourceSectionSnapshot

- (NSDiffableDataSourceSectionSnapshot)initWithState:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NSDiffableDataSourceSectionSnapshot;
  v6 = [(NSDiffableDataSourceSectionSnapshot *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_state, a3);
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    expandedItemsUpdates = v7->_expandedItemsUpdates;
    v7->_expandedItemsUpdates = v8;

    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    collapsedItemsUpdates = v7->_collapsedItemsUpdates;
    v7->_collapsedItemsUpdates = v10;
  }
  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  state = self->_state;
  return (id)[v4 initWithState:state];
}

- (NSDiffableDataSourceSectionSnapshot)init
{
  v3 = objc_alloc_init(_NSDiffableDataSourceSectionSnapshotState);
  v4 = [(NSDiffableDataSourceSectionSnapshot *)self initWithState:v3];

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collapsedItemsUpdates, 0);
  objc_storeStrong((id *)&self->_expandedItemsUpdates, 0);
  objc_storeStrong((id *)&self->_state, 0);
}

- (void)deleteItems:(NSArray *)items
{
}

- (void)replaceChildrenOfParentItem:(id)parentItem withSnapshot:(NSDiffableDataSourceSectionSnapshot *)snapshot
{
  id v24 = parentItem;
  v7 = snapshot;
  if (v24)
  {
    if (v7) {
      goto LABEL_3;
    }
  }
  else
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"NSDiffableDataSourceSectionSnapshot.m", 259, @"Invalid parameter not satisfying: %@", @"parentItem != nil" object file lineNumber description];

    if (v7) {
      goto LABEL_3;
    }
  }
  v22 = [MEMORY[0x1E4F28B00] currentHandler];
  [v22 handleFailureInMethod:a2, self, @"NSDiffableDataSourceSectionSnapshot.m", 260, @"Invalid parameter not satisfying: %@", @"snapshot != nil" object file lineNumber description];

LABEL_3:
  v8 = [(_NSDiffableDataSourceSectionSnapshotState *)self->_state snapshotterMutableCopy];
  v9 = [(_NSDiffableDataSourceSectionSnapshotState *)self->_state identifiers];
  v10 = (void *)[v9 mutableCopy];

  int64_t v11 = [(_NSDiffableDataSourceSectionSnapshotState *)self->_state indexOfIdentifier:v24];
  if (v11 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2, self, @"NSDiffableDataSourceSectionSnapshot.m", 266, @"Parent item identifier does not exist in section snapshot: %@", v24 object file lineNumber description];
  }
  v12 = [(_NSDiffableDataSourceSectionSnapshotState *)self->_state snapshotter];
  objc_super v13 = [v12 childrenForParentAtIndex:v11 recursive:1];

  if (v13) {
    [v10 removeObjectsAtIndexes:v13];
  }
  v14 = [(NSDiffableDataSourceSectionSnapshot *)v7 items];
  uint64_t v15 = [v14 count];

  if (v15)
  {
    v16 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", v11 + 1, v15);
    v17 = [(NSDiffableDataSourceSectionSnapshot *)v7 items];
    [v10 insertObjects:v17 atIndexes:v16];
  }
  v18 = [(NSDiffableDataSourceSectionSnapshot *)v7 snapshotter];
  [v8 replaceChildItemsFromSnapshotter:v18 forParentIndex:v11];

  v19 = [[_NSDiffableDataSourceSectionSnapshotState alloc] initWithSnapshotter:v8 identifiers:v10];
  state = self->_state;
  self->_state = v19;
}

- (id)snapshotter
{
  return [(_NSDiffableDataSourceSectionSnapshotState *)self->_state snapshotter];
}

- (NSArray)visibleItems
{
  v3 = [(_NSDiffableDataSourceSectionSnapshotState *)self->_state snapshotter];
  v4 = [v3 visibleIndexes];

  id v5 = [(_NSDiffableDataSourceSectionSnapshotState *)self->_state identifiers];
  v6 = [v5 objectsAtIndexes:v4];

  return (NSArray *)v6;
}

- (void)_prepareForApplyToDataSource
{
}

- (void)expandItems:(NSArray *)items
{
  v10 = items;
  if ([(NSArray *)v10 count])
  {
    [(NSMutableArray *)self->_expandedItemsUpdates addObjectsFromArray:v10];
    v4 = [(NSDiffableDataSourceSectionSnapshot *)self _indexesOfItems:v10 ignoringItemsNotFound:1];
    id v5 = [(_NSDiffableDataSourceSectionSnapshotState *)self->_state snapshotterMutableCopy];
    [v5 expandIndexes:v4];
    v6 = [_NSDiffableDataSourceSectionSnapshotState alloc];
    v7 = [(_NSDiffableDataSourceSectionSnapshotState *)self->_state identifiers];
    v8 = [(_NSDiffableDataSourceSectionSnapshotState *)v6 initWithSnapshotter:v5 identifiers:v7];
    state = self->_state;
    self->_state = v8;
  }
}

- (void)appendItems:(NSArray *)items intoParentItem:(id)parentItem
{
  v33 = items;
  id v7 = parentItem;
  if ([(NSArray *)v33 count])
  {
    if (v7)
    {
      v8 = [(NSDiffableDataSourceSectionSnapshot *)self childrenOfParent:v7];
      if ([v8 count])
      {
        v9 = [v8 lastObject];
        [(NSDiffableDataSourceSectionSnapshot *)self insertItems:v33 afterItem:v9];
      }
      else
      {
        int64_t v10 = [(_NSDiffableDataSourceSectionSnapshotState *)self->_state indexOfIdentifier:v7];
        if (v10 == 0x7FFFFFFFFFFFFFFFLL)
        {
          v32 = [MEMORY[0x1E4F28B00] currentHandler];
          [v32 handleFailureInMethod:a2, self, @"NSDiffableDataSourceSectionSnapshot.m", 97, @"Parent item identifier does not exist in section snapshot: %@", v7 object file lineNumber description];
        }
        v9 = [(_NSDiffableDataSourceSectionSnapshotState *)self->_state snapshotterMutableCopy];
        uint64_t v11 = objc_msgSend(v9, "appendChildItemsWithCount:toParentIndex:", -[NSArray count](v33, "count"), v10);
        uint64_t v13 = v12;
        v14 = [(_NSDiffableDataSourceSectionSnapshotState *)self->_state identifiers];
        uint64_t v15 = (void *)[v14 mutableCopy];

        uint64_t v16 = [v15 count];
        v17 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", v11, v13);
        [v15 insertObjects:v33 atIndexes:v17];

        uint64_t v18 = [v15 count] - v16;
        if (v18 != [(NSArray *)v33 count])
        {
          v19 = [(_NSDiffableDataSourceSectionSnapshotState *)self->_state identifiers];
          BUG_IN_CLIENT_OF_DIFFABLE_DATA_SOURCE__DUPLICATE_ITEM_IDENTIFIERS_IN_SECTION_SNAPSHOT(v19, v33);
        }
        v20 = [[_NSDiffableDataSourceSectionSnapshotState alloc] initWithSnapshotter:v9 identifiers:v15];
        state = self->_state;
        self->_state = v20;
      }
      v22 = [(_NSDiffableDataSourceSectionSnapshotState *)self->_state snapshotter];
      uint64_t v23 = [v22 count];
      id v24 = [(_NSDiffableDataSourceSectionSnapshotState *)self->_state identifiers];
      uint64_t v25 = [v24 count];

      if (v23 != v25)
      {
        v26 = [MEMORY[0x1E4F28B00] currentHandler];
        v27 = [(_NSDiffableDataSourceSectionSnapshotState *)self->_state snapshotter];
        uint64_t v28 = [v27 count];
        v29 = [(_NSDiffableDataSourceSectionSnapshotState *)self->_state identifiers];
        uint64_t v30 = [v29 count];
        v31 = [(_NSDiffableDataSourceSectionSnapshotState *)self->_state identifiers];
        [v26 handleFailureInMethod:a2, self, @"NSDiffableDataSourceSectionSnapshot.m", 117, @"NSDiffableDataSourceSectionSnapshot internal inconsistency: snapshotter count (%ld) does not match identifier count (%ld). Identifiers: %@", v28, v30, v31 object file lineNumber description];
      }
    }
    else
    {
      [(NSDiffableDataSourceSectionSnapshot *)self appendItems:v33];
    }
  }
}

- (void)appendItems:(NSArray *)items
{
  uint64_t v23 = items;
  if ([(NSArray *)v23 count])
  {
    id v5 = [(_NSDiffableDataSourceSectionSnapshotState *)self->_state snapshotterMutableCopy];
    objc_msgSend(v5, "appendChildItemsWithCount:", -[NSArray count](v23, "count"));
    v6 = [(_NSDiffableDataSourceSectionSnapshotState *)self->_state identifiers];
    id v7 = (void *)[v6 mutableCopy];

    uint64_t v8 = [v7 count];
    [v7 addObjectsFromArray:v23];
    uint64_t v9 = [v7 count] - v8;
    if (v9 != [(NSArray *)v23 count])
    {
      int64_t v10 = [(_NSDiffableDataSourceSectionSnapshotState *)self->_state identifiers];
      BUG_IN_CLIENT_OF_DIFFABLE_DATA_SOURCE__DUPLICATE_ITEM_IDENTIFIERS_IN_SECTION_SNAPSHOT(v10, v23);
    }
    uint64_t v11 = [[_NSDiffableDataSourceSectionSnapshotState alloc] initWithSnapshotter:v5 identifiers:v7];
    state = self->_state;
    self->_state = v11;

    uint64_t v13 = [(_NSDiffableDataSourceSectionSnapshotState *)self->_state snapshotter];
    uint64_t v14 = [v13 count];
    uint64_t v15 = [(_NSDiffableDataSourceSectionSnapshotState *)self->_state identifiers];
    uint64_t v16 = [v15 count];

    if (v14 != v16)
    {
      v17 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v18 = [(_NSDiffableDataSourceSectionSnapshotState *)self->_state snapshotter];
      uint64_t v19 = [v18 count];
      v20 = [(_NSDiffableDataSourceSectionSnapshotState *)self->_state identifiers];
      uint64_t v21 = [v20 count];
      v22 = [(_NSDiffableDataSourceSectionSnapshotState *)self->_state identifiers];
      [v17 handleFailureInMethod:a2, self, @"NSDiffableDataSourceSectionSnapshot.m", 76, @"NSDiffableDataSourceSectionSnapshot internal inconsistency: snapshotter count (%ld) does not match identifier count (%ld). Identifiers: %@", v19, v21, v22 object file lineNumber description];
    }
  }
}

- (NSArray)items
{
  v2 = [(_NSDiffableDataSourceSectionSnapshotState *)self->_state identifiers];
  v3 = [v2 array];

  return (NSArray *)v3;
}

- (id)childrenOfParent:(id)a3 recursive:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  int64_t v8 = [(_NSDiffableDataSourceSectionSnapshotState *)self->_state indexOfIdentifier:v7];
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"NSDiffableDataSourceSectionSnapshot.m", 340, @"Parent item identifier does not exist in section snapshot: %@", v7 object file lineNumber description];
  }
  uint64_t v9 = [(_NSDiffableDataSourceSectionSnapshotState *)self->_state snapshotter];
  int64_t v10 = [v9 childrenForParentAtIndex:v8 recursive:v4];

  uint64_t v11 = [(_NSDiffableDataSourceSectionSnapshotState *)self->_state identifiers];
  uint64_t v12 = [v11 objectsAtIndexes:v10];

  return v12;
}

- (id)_indexesOfItems:(id)a3 ignoringItemsNotFound:(BOOL)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        int64_t v14 = [(_NSDiffableDataSourceSectionSnapshotState *)self->_state indexOfIdentifier:v13];
        if (v14 == 0x7FFFFFFFFFFFFFFFLL)
        {
          if (!a4)
          {
            uint64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
            [v15 handleFailureInMethod:a2, self, @"NSDiffableDataSourceSectionSnapshot.m", 572, @"Failed to find index of item %@", v13 object file lineNumber description];
          }
        }
        else
        {
          [v7 addIndex:v14];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v10);
  }

  return v7;
}

- (id)parentOfChildItem:(id)childItem
{
  id v5 = childItem;
  int64_t v6 = [(_NSDiffableDataSourceSectionSnapshotState *)self->_state indexOfIdentifier:v5];
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"NSDiffableDataSourceSectionSnapshot.m", 451, @"Child item identifier does not exist in section snapshot: %@", v5 object file lineNumber description];
  }
  id v7 = [(_NSDiffableDataSourceSectionSnapshotState *)self->_state snapshotter];
  uint64_t v8 = [v7 parentForChildAtIndex:v6];

  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v9 = 0;
  }
  else
  {
    uint64_t v10 = [(_NSDiffableDataSourceSectionSnapshotState *)self->_state identifiers];
    uint64_t v9 = [v10 objectAtIndexedSubscript:v8];
  }
  return v9;
}

- (id)childrenOfParent:(id)a3
{
  return [(NSDiffableDataSourceSectionSnapshot *)self childrenOfParent:a3 recursive:0];
}

- (void)setChildrenWithSnapshot:(id)a3 forParent:(id)a4
{
}

- (void)deleteItems:(id)a3 orphanDisposition:(int64_t)a4
{
  id v7 = a3;
  if ([v7 count])
  {
    if ((unint64_t)a4 >= 2)
    {
      uint64_t v16 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"NSDiffableDataSourceSectionSnapshot.m", 200, @"Invalid _NSDiffableDataSourceSectionSnapshotOrphanDisposition: %ld", a4);
    }
    uint64_t v8 = [(_NSDiffableDataSourceSectionSnapshotState *)self->_state snapshotterMutableCopy];
    uint64_t v9 = [(_NSDiffableDataSourceSectionSnapshotState *)self->_state identifiers];
    uint64_t v10 = (void *)[v9 mutableCopy];

    uint64_t v11 = [(NSDiffableDataSourceSectionSnapshot *)self _indexesOfItems:v7];
    uint64_t v12 = (void *)[v11 mutableCopy];
    char v13 = [v8 isFlat];
    if (!a4 && (v13 & 1) == 0)
    {
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __69__NSDiffableDataSourceSectionSnapshot_deleteItems_orphanDisposition___block_invoke;
      v17[3] = &unk_1E52DADC0;
      id v18 = v8;
      id v19 = v12;
      [v11 enumerateIndexesUsingBlock:v17];
    }
    [v8 deleteIndexes:v12 orphanDisposition:a4 != 0];
    [v10 removeObjectsAtIndexes:v12];
    int64_t v14 = [[_NSDiffableDataSourceSectionSnapshotState alloc] initWithSnapshotter:v8 identifiers:v10];
    state = self->_state;
    self->_state = v14;
  }
}

- (NSDiffableDataSourceSectionSnapshot)initWithSnapshot:(id)a3
{
  BOOL v4 = [a3 _state];
  id v5 = [(NSDiffableDataSourceSectionSnapshot *)self initWithState:v4];

  return v5;
}

- (void)insertItems:(NSArray *)items beforeItem:(id)beforeIdentifier
{
  long long v21 = items;
  id v7 = beforeIdentifier;
  if ([(NSArray *)v21 count])
  {
    int64_t v8 = [(_NSDiffableDataSourceSectionSnapshotState *)self->_state indexOfIdentifier:v7];
    if (v8 == 0x7FFFFFFFFFFFFFFFLL)
    {
      id v19 = [MEMORY[0x1E4F28B00] currentHandler];
      [v19 handleFailureInMethod:a2, self, @"NSDiffableDataSourceSectionSnapshot.m", 131, @"Item identifier to insert before does not exist in section snapshot: %@", v7 object file lineNumber description];
    }
    uint64_t v9 = [(NSArray *)v21 count];
    uint64_t v10 = [(_NSDiffableDataSourceSectionSnapshotState *)self->_state snapshotterMutableCopy];
    [v10 insertCount:v9 beforeIndex:v8];
    uint64_t v11 = [(_NSDiffableDataSourceSectionSnapshotState *)self->_state identifiers];
    uint64_t v12 = (void *)[v11 mutableCopy];

    char v13 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", v8, v9);
    uint64_t v14 = [v12 count];
    [v12 insertObjects:v21 atIndexes:v13];
    if ([v12 count] - v14 != v9)
    {
      uint64_t v15 = [(_NSDiffableDataSourceSectionSnapshotState *)self->_state identifiers];
      BUG_IN_CLIENT_OF_DIFFABLE_DATA_SOURCE__DUPLICATE_ITEM_IDENTIFIERS_IN_SECTION_SNAPSHOT(v15, v21);
    }
    uint64_t v16 = [v10 count];
    if (v16 != [v12 count])
    {
      long long v20 = [MEMORY[0x1E4F28B00] currentHandler];
      [v20 handleFailureInMethod:a2, self, @"NSDiffableDataSourceSectionSnapshot.m", 148, @"NSDiffableDataSourceSectionSnapshot internal inconsistency: snapshotter count (%ld) does not match identifier count (%ld). Identifiers: %@", objc_msgSend(v10, "count"), objc_msgSend(v12, "count"), v12 object file lineNumber description];
    }
    v17 = [[_NSDiffableDataSourceSectionSnapshotState alloc] initWithSnapshotter:v10 identifiers:v12];
    state = self->_state;
    self->_state = v17;
  }
}

- (void)insertItems:(NSArray *)items afterItem:(id)afterIdentifier
{
}

- (void)insertItems:(id)a3 afterItem:(id)a4 insertionMode:(int64_t)a5
{
  id v26 = a3;
  id v9 = a4;
  if ([v26 count])
  {
    if ((unint64_t)a5 >= 2)
    {
      uint64_t v23 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"NSDiffableDataSourceSectionSnapshot.m", 163, @"Invalid _NSDiffableDataSourceSectionSnapshotInsertionMode: %ld", a5);
    }
    BOOL v10 = a5 != 0;
    int64_t v11 = [(_NSDiffableDataSourceSectionSnapshotState *)self->_state indexOfIdentifier:v9];
    if (v11 == 0x7FFFFFFFFFFFFFFFLL)
    {
      id v24 = [MEMORY[0x1E4F28B00] currentHandler];
      [v24 handleFailureInMethod:a2, self, @"NSDiffableDataSourceSectionSnapshot.m", 167, @"Item identifier to insert after does not exist in section snapshot: %@", v9 object file lineNumber description];
    }
    uint64_t v12 = [v26 count];
    char v13 = [(_NSDiffableDataSourceSectionSnapshotState *)self->_state snapshotterMutableCopy];
    uint64_t v14 = [v13 insertCount:v12 afterIndex:v11 insertionMode:v10];
    uint64_t v15 = [(_NSDiffableDataSourceSectionSnapshotState *)self->_state identifiers];
    uint64_t v16 = (void *)[v15 mutableCopy];

    v17 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", v14, v12);
    uint64_t v18 = [v16 count];
    [v16 insertObjects:v26 atIndexes:v17];
    if ([v16 count] - v18 != v12)
    {
      id v19 = [(_NSDiffableDataSourceSectionSnapshotState *)self->_state identifiers];
      BUG_IN_CLIENT_OF_DIFFABLE_DATA_SOURCE__DUPLICATE_ITEM_IDENTIFIERS_IN_SECTION_SNAPSHOT(v19, v26);
    }
    uint64_t v20 = [v13 count];
    if (v20 != [v16 count])
    {
      uint64_t v25 = [MEMORY[0x1E4F28B00] currentHandler];
      [v25 handleFailureInMethod:a2, self, @"NSDiffableDataSourceSectionSnapshot.m", 184, @"NSDiffableDataSourceSectionSnapshot internal inconsistency: snapshotter count (%ld) does not match identifier count (%ld). Identifiers: %@", objc_msgSend(v13, "count"), objc_msgSend(v16, "count"), v16 object file lineNumber description];
    }
    long long v21 = [[_NSDiffableDataSourceSectionSnapshotState alloc] initWithSnapshotter:v13 identifiers:v16];
    state = self->_state;
    self->_state = v21;
  }
}

void __69__NSDiffableDataSourceSectionSnapshot_deleteItems_orphanDisposition___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) childrenForParentAtIndex:a2 recursive:1];
  [*(id *)(a1 + 40) addIndexes:v3];
}

- (void)deleteAllItems
{
  id v3 = objc_alloc_init(_NSDiffableDataSourceSectionSnapshotState);
  state = self->_state;
  self->_state = v3;
}

- (void)collapseItems:(NSArray *)items
{
  BOOL v10 = items;
  if ([(NSArray *)v10 count])
  {
    [(NSMutableArray *)self->_collapsedItemsUpdates addObjectsFromArray:v10];
    BOOL v4 = [(NSDiffableDataSourceSectionSnapshot *)self _indexesOfItems:v10 ignoringItemsNotFound:1];
    id v5 = [(_NSDiffableDataSourceSectionSnapshotState *)self->_state snapshotterMutableCopy];
    [v5 collapseIndexes:v4];
    int64_t v6 = [_NSDiffableDataSourceSectionSnapshotState alloc];
    id v7 = [(_NSDiffableDataSourceSectionSnapshotState *)self->_state identifiers];
    int64_t v8 = [(_NSDiffableDataSourceSectionSnapshotState *)v6 initWithSnapshotter:v5 identifiers:v7];
    state = self->_state;
    self->_state = v8;
  }
}

- (BOOL)containsItem:(id)item
{
  return [(_NSDiffableDataSourceSectionSnapshotState *)self->_state containsIdentifier:item];
}

- (NSInteger)indexOfItem:(id)item
{
  return [(_NSDiffableDataSourceSectionSnapshotState *)self->_state indexOfIdentifier:item];
}

- (BOOL)isExpanded:(id)item
{
  id v5 = item;
  int64_t v6 = [(_NSDiffableDataSourceSectionSnapshotState *)self->_state indexOfIdentifier:v5];
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    BOOL v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"NSDiffableDataSourceSectionSnapshot.m", 308, @"Item identifier does not exist in section snapshot: %@", v5 object file lineNumber description];
  }
  id v7 = [(_NSDiffableDataSourceSectionSnapshotState *)self->_state snapshotter];
  char v8 = [v7 indexIsExpanded:v6];

  return v8;
}

- (BOOL)isVisible:(id)item
{
  id v5 = item;
  int64_t v6 = [(_NSDiffableDataSourceSectionSnapshotState *)self->_state indexOfIdentifier:v5];
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    BOOL v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"NSDiffableDataSourceSectionSnapshot.m", 315, @"Item identifier does not exist in section snapshot: %@", v5 object file lineNumber description];
  }
  id v7 = [(_NSDiffableDataSourceSectionSnapshotState *)self->_state snapshotter];
  char v8 = [v7 indexIsVisible:v6];

  return v8;
}

- (NSInteger)levelOfItem:(id)item
{
  id v5 = item;
  int64_t v6 = [(_NSDiffableDataSourceSectionSnapshotState *)self->_state indexOfIdentifier:v5];
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    BOOL v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"NSDiffableDataSourceSectionSnapshot.m", 323, @"Item identifier does not exist in section snapshot: %@", v5 object file lineNumber description];
  }
  id v7 = [(_NSDiffableDataSourceSectionSnapshotState *)self->_state snapshotter];
  NSInteger v8 = [v7 levelForIndex:v6];

  return v8;
}

- (NSDiffableDataSourceSectionSnapshot)snapshotOfParentItem:(id)parentItem
{
  return (NSDiffableDataSourceSectionSnapshot *)[(NSDiffableDataSourceSectionSnapshot *)self childSnapshotOfParent:parentItem includingParent:0];
}

- (NSDiffableDataSourceSectionSnapshot)snapshotOfParentItem:(id)parentItem includingParentItem:(BOOL)includingParentItem
{
  BOOL v4 = includingParentItem;
  id v7 = parentItem;
  if (!v7)
  {
    long long v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"NSDiffableDataSourceSectionSnapshot.m", 359, @"Invalid parameter not satisfying: %@", @"item != nil" object file lineNumber description];
  }
  int64_t v8 = [(_NSDiffableDataSourceSectionSnapshotState *)self->_state indexOfIdentifier:v7];
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"NSDiffableDataSourceSectionSnapshot.m", 361, @"Parent item identifier does not exist in section snapshot: %@", v7 object file lineNumber description];
  }
  id v9 = [(_NSDiffableDataSourceSectionSnapshotState *)self->_state snapshotter];
  BOOL v10 = [v9 snapshotterRepresentingSubtreeForIndex:v8 includingParent:v4];

  int64_t v11 = [v10 _allIndexes];
  if ([v11 count])
  {
    uint64_t v12 = (void *)MEMORY[0x1E4F1CAA0];
    char v13 = [(_NSDiffableDataSourceSectionSnapshotState *)self->_state identifiers];
    uint64_t v14 = [v10 _allIndexes];
    uint64_t v15 = [v13 objectsAtIndexes:v14];
    uint64_t v16 = [v12 orderedSetWithArray:v15];

    v17 = objc_msgSend(v10, "_snapshotterByShiftingIndexesByCount:", -objc_msgSend(v11, "firstIndex"));
    uint64_t v18 = [[_NSDiffableDataSourceSectionSnapshotState alloc] initWithSnapshotter:v17 identifiers:v16];
    id v19 = [[NSDiffableDataSourceSectionSnapshot alloc] initWithState:v18];
  }
  else
  {
    id v19 = objc_alloc_init(NSDiffableDataSourceSectionSnapshot);
  }

  return v19;
}

- (void)insertSnapshot:(NSDiffableDataSourceSectionSnapshot *)snapshot beforeItem:(id)item
{
  uint64_t v25 = snapshot;
  id v7 = item;
  int64_t v8 = [(NSDiffableDataSourceSectionSnapshot *)v25 items];
  uint64_t v9 = [v8 count];
  if (v9)
  {
    uint64_t v10 = v9;
    int64_t v11 = [(_NSDiffableDataSourceSectionSnapshotState *)self->_state indexOfIdentifier:v7];
    if (v11 == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v23 = [MEMORY[0x1E4F28B00] currentHandler];
      [v23 handleFailureInMethod:a2, self, @"NSDiffableDataSourceSectionSnapshot.m", 391, @"Item identifier to insert before does not exist in section snapshot: %@", v7 object file lineNumber description];
    }
    uint64_t v12 = [(_NSDiffableDataSourceSectionSnapshotState *)self->_state snapshotterMutableCopy];
    char v13 = [(NSDiffableDataSourceSectionSnapshot *)v25 _state];
    uint64_t v14 = [v13 snapshotterMutableCopy];

    [v12 insertSubtreeFromSnapshotter:v14 beforeIndex:v11];
    uint64_t v15 = [(_NSDiffableDataSourceSectionSnapshotState *)self->_state identifiers];
    uint64_t v16 = (void *)[v15 mutableCopy];

    v17 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", v11, v10);
    uint64_t v18 = [v16 count];
    [v16 insertObjects:v8 atIndexes:v17];
    if ([v16 count] - v18 != v10)
    {
      id v19 = [(_NSDiffableDataSourceSectionSnapshotState *)self->_state identifiers];
      BUG_IN_CLIENT_OF_DIFFABLE_DATA_SOURCE__DUPLICATE_ITEM_IDENTIFIERS_IN_SECTION_SNAPSHOT(v19, v8);
    }
    uint64_t v20 = [v12 count];
    if (v20 != [v16 count])
    {
      id v24 = [MEMORY[0x1E4F28B00] currentHandler];
      [v24 handleFailureInMethod:a2, self, @"NSDiffableDataSourceSectionSnapshot.m", 408, @"NSDiffableDataSourceSectionSnapshot internal inconsistency: snapshotter count (%ld) does not match identifier count (%ld). Identifiers: %@", objc_msgSend(v12, "count"), objc_msgSend(v16, "count"), v16 object file lineNumber description];
    }
    long long v21 = [[_NSDiffableDataSourceSectionSnapshotState alloc] initWithSnapshotter:v12 identifiers:v16];
    state = self->_state;
    self->_state = v21;
  }
}

- (id)insertSnapshot:(NSDiffableDataSourceSectionSnapshot *)snapshot afterItem:(id)item
{
  id v7 = snapshot;
  id v8 = item;
  uint64_t v9 = [(NSDiffableDataSourceSectionSnapshot *)v7 items];
  uint64_t v10 = [v9 count];
  if (v10)
  {
    uint64_t v11 = v10;
    int64_t v12 = [(_NSDiffableDataSourceSectionSnapshotState *)self->_state indexOfIdentifier:v8];
    if (v12 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v29 = [MEMORY[0x1E4F28B00] currentHandler];
      [v29 handleFailureInMethod:a2, self, @"NSDiffableDataSourceSectionSnapshot.m", 421, @"Item identifier to insert after does not exist in section snapshot: %@", v8 object file lineNumber description];
    }
    SEL v32 = a2;
    char v13 = [(_NSDiffableDataSourceSectionSnapshotState *)self->_state snapshotterMutableCopy];
    uint64_t v14 = [(NSDiffableDataSourceSectionSnapshot *)v7 _state];
    uint64_t v15 = [v14 snapshotterMutableCopy];

    v33 = (void *)v15;
    uint64_t v16 = [v13 insertSubtreeFromSnapshotter:v15 afterIndex:v12];
    if (v16 == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v30 = [MEMORY[0x1E4F28B00] currentHandler];
      [v30 handleFailureInMethod:v32, self, @"NSDiffableDataSourceSectionSnapshot.m", 426, @"NSDiffableDataSourceSectionSnapshot internal inconsistency: failed to insert subtree from snapshotter (%@) into snapshotter (%@) at insertion index %ld", v33, v13, v12 object file lineNumber description];
    }
    v17 = [(_NSDiffableDataSourceSectionSnapshotState *)self->_state identifiers];
    if (v16 == [v17 count])
    {
      uint64_t v18 = 0;
    }
    else
    {
      if (v16 - v12 != 1) {
        int64_t v12 = v16;
      }
      id v19 = [(_NSDiffableDataSourceSectionSnapshotState *)self->_state identifiers];
      uint64_t v18 = [v19 objectAtIndexedSubscript:v12];
    }
    uint64_t v20 = [(_NSDiffableDataSourceSectionSnapshotState *)self->_state identifiers];
    long long v21 = (void *)[v20 mutableCopy];

    v22 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", v16, v11);
    uint64_t v23 = [v21 count];
    [v21 insertObjects:v9 atIndexes:v22];
    if ([v21 count] - v23 != v11)
    {
      id v24 = [(_NSDiffableDataSourceSectionSnapshotState *)self->_state identifiers];
      BUG_IN_CLIENT_OF_DIFFABLE_DATA_SOURCE__DUPLICATE_ITEM_IDENTIFIERS_IN_SECTION_SNAPSHOT(v24, v9);
    }
    uint64_t v25 = [v13 count];
    if (v25 != [v21 count])
    {
      v31 = [MEMORY[0x1E4F28B00] currentHandler];
      [v31 handleFailureInMethod:v32, self, @"NSDiffableDataSourceSectionSnapshot.m", 441, @"NSDiffableDataSourceSectionSnapshot internal inconsistency: snapshotter count (%ld) does not match identifier count (%ld). Identifiers: %@", objc_msgSend(v13, "count"), objc_msgSend(v21, "count"), v21 object file lineNumber description];
    }
    id v26 = [[_NSDiffableDataSourceSectionSnapshotState alloc] initWithSnapshotter:v13 identifiers:v21];
    state = self->_state;
    self->_state = v26;
  }
  else
  {
    uint64_t v18 = 0;
  }

  return v18;
}

- (NSArray)expandedItems
{
  id v3 = [(_NSDiffableDataSourceSectionSnapshotState *)self->_state snapshotter];
  BOOL v4 = [v3 expandedIndexes];

  id v5 = [(_NSDiffableDataSourceSectionSnapshotState *)self->_state identifiers];
  int64_t v6 = [v5 objectsAtIndexes:v4];

  return (NSArray *)v6;
}

- (NSArray)rootItems
{
  id v3 = [(_NSDiffableDataSourceSectionSnapshotState *)self->_state snapshotter];
  BOOL v4 = [v3 rootIndexes];

  id v5 = [(_NSDiffableDataSourceSectionSnapshotState *)self->_state identifiers];
  int64_t v6 = [v5 objectsAtIndexes:v4];

  return (NSArray *)v6;
}

- (NSString)visualDescription
{
  id v3 = (void *)MEMORY[0x1E4F28E78];
  BOOL v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  int64_t v6 = [v3 stringWithFormat:@"<%@: %p\n", v5, self];

  id v7 = [(_NSDiffableDataSourceSectionSnapshotState *)self->_state identifiers];
  id v8 = [(_NSDiffableDataSourceSectionSnapshotState *)self->_state snapshotter];
  if ([v7 count])
  {
    unint64_t v9 = 0;
    do
    {
      uint64_t v10 = [v8 levelForIndex:v9];
      uint64_t v11 = [v7 objectAtIndexedSubscript:v9];
      int64_t v12 = [&stru_1ED0E84C0 stringByPaddingToLength:2 * v10 withString:@" " startingAtIndex:0];
      int v13 = [v8 indexIsExpanded:v9];
      uint64_t v14 = @"-";
      if (v13) {
        uint64_t v14 = @"+";
      }
      uint64_t v15 = v14;
      if ([v8 indexIsVisible:v9]) {
        uint64_t v16 = @"*";
      }
      else {
        uint64_t v16 = @" ";
      }
      [v6 appendFormat:@"%@%@%@%@\n", v12, v15, v16, v11];

      ++v9;
    }
    while (v9 < [v7 count]);
  }
  [v6 appendString:@">"];

  return (NSString *)v6;
}

- (id)description
{
  id v3 = NSString;
  BOOL v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  int64_t v6 = [(_NSDiffableDataSourceSectionSnapshotState *)self->_state snapshotter];
  id v7 = [v6 visualDescription];
  id v8 = [v3 stringWithFormat:@"<%@: %p\n%@>", v5, self, v7];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  BOOL v4 = (NSDiffableDataSourceSectionSnapshot *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(_NSDiffableDataSourceSectionSnapshotState *)self->_state isEqual:v4->_state];
  }

  return v5;
}

- (NSArray)expandedItemsUpdates
{
  return (NSArray *)self->_expandedItemsUpdates;
}

- (NSArray)collapsedItemsUpdates
{
  return (NSArray *)self->_collapsedItemsUpdates;
}

- (void)_replaceItem:(id)a3 withItem:(id)a4
{
  id v17 = a3;
  id v7 = a4;
  id v8 = [(_NSDiffableDataSourceSectionSnapshotState *)self->_state identifiers];
  int64_t v9 = [(_NSDiffableDataSourceSectionSnapshotState *)self->_state indexOfIdentifier:v17];
  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"NSDiffableDataSourceSectionSnapshot.m", 540, @"Item identifier does not exist in section snapshot: %@", v17 object file lineNumber description];
  }
  if ([(_NSDiffableDataSourceSectionSnapshotState *)self->_state containsIdentifier:v7])
  {
    uint64_t v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"NSDiffableDataSourceSectionSnapshot.m", 542, @"Item identifier already exists in section snapshot: %@", v7 object file lineNumber description];
  }
  uint64_t v10 = (void *)[v8 mutableCopy];
  [v10 replaceObjectAtIndex:v9 withObject:v7];
  uint64_t v11 = [_NSDiffableDataSourceSectionSnapshotState alloc];
  int64_t v12 = [(_NSDiffableDataSourceSectionSnapshotState *)self->_state snapshotterMutableCopy];
  int v13 = [(_NSDiffableDataSourceSectionSnapshotState *)v11 initWithSnapshotter:v12 identifiers:v10];
  state = self->_state;
  self->_state = v13;
}

- (id)_indexesOfChildrenForParent:(id)a3 recursive:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  int64_t v8 = [(_NSDiffableDataSourceSectionSnapshotState *)self->_state indexOfIdentifier:v7];
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    int64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"NSDiffableDataSourceSectionSnapshot.m", 552, @"Parent item identifier does not exist in section snapshot: %@", v7 object file lineNumber description];
  }
  int64_t v9 = [(_NSDiffableDataSourceSectionSnapshotState *)self->_state snapshotter];
  uint64_t v10 = [v9 childrenForParentAtIndex:v8 recursive:v4];

  return v10;
}

- (id)_indexesOfItems:(id)a3
{
  return [(NSDiffableDataSourceSectionSnapshot *)self _indexesOfItems:a3 ignoringItemsNotFound:0];
}

- (NSArray)_rootItems
{
  id v3 = [(_NSDiffableDataSourceSectionSnapshotState *)self->_state snapshotter];
  BOOL v4 = [(_NSDiffableDataSourceSectionSnapshotState *)self->_state identifiers];
  BOOL v5 = [v3 rootIndexes];
  if ([v5 count])
  {
    int64_t v6 = [v4 array];
    id v7 = [v6 objectsAtIndexes:v5];
  }
  else
  {
    id v7 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return (NSArray *)v7;
}

- (NSOrderedSet)_itemsOrderedSet
{
  return [(_NSDiffableDataSourceSectionSnapshotState *)self->_state identifiers];
}

- (NSOrderedSet)_visibleItemsOrderedSet
{
  id v3 = [(_NSDiffableDataSourceSectionSnapshotState *)self->_state snapshotter];
  int v4 = [v3 isFlat];

  if (v4)
  {
    BOOL v5 = [(_NSDiffableDataSourceSectionSnapshotState *)self->_state identifiers];
  }
  else
  {
    int64_t v6 = (void *)MEMORY[0x1E4F1CAA0];
    id v7 = [(NSDiffableDataSourceSectionSnapshot *)self visibleItems];
    BOOL v5 = [v6 orderedSetWithArray:v7];
  }
  return (NSOrderedSet *)v5;
}

- (_NSDiffableDataSourceSectionSnapshotState)_state
{
  return self->_state;
}

- (BOOL)_itemHasChildren:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"NSDiffableDataSourceSectionSnapshot.m", 614, @"Invalid parameter not satisfying: %@", @"item != nil" object file lineNumber description];
  }
  int64_t v6 = [(_NSDiffableDataSourceSectionSnapshotState *)self->_state indexOfIdentifier:v5];
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"NSDiffableDataSourceSectionSnapshot.m", 616, @"Item identifier does not exist in section snapshot: %@", v5 object file lineNumber description];
  }
  id v7 = [(_NSDiffableDataSourceSectionSnapshotState *)self->_state snapshotter];
  char v8 = [v7 hasChildrenForParentAtIndex:v6];

  return v8;
}

- (NSIndexSet)_visibleIndexes
{
  v2 = [(_NSDiffableDataSourceSectionSnapshotState *)self->_state snapshotter];
  id v3 = [v2 visibleIndexes];

  return (NSIndexSet *)v3;
}

- (id)_itemBeforeItem:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"NSDiffableDataSourceSectionSnapshot.m", 627, @"Invalid parameter not satisfying: %@", @"item != nil" object file lineNumber description];
  }
  unint64_t v6 = [(_NSDiffableDataSourceSectionSnapshotState *)self->_state indexOfIdentifier:v5] - 1;
  if (v6 > 0x7FFFFFFFFFFFFFFDLL)
  {
    char v8 = 0;
  }
  else
  {
    id v7 = [(_NSDiffableDataSourceSectionSnapshotState *)self->_state identifiers];
    char v8 = [v7 objectAtIndexedSubscript:v6];
  }
  return v8;
}

- (id)_itemAfterItem:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    int v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"NSDiffableDataSourceSectionSnapshot.m", 641, @"Invalid parameter not satisfying: %@", @"item != nil" object file lineNumber description];
  }
  int64_t v6 = [(_NSDiffableDataSourceSectionSnapshotState *)self->_state indexOfIdentifier:v5];
  if (v6 == 0x7FFFFFFFFFFFFFFFLL
    || (unint64_t v7 = v6 + 1,
        [(_NSDiffableDataSourceSectionSnapshotState *)self->_state identifiers],
        char v8 = objc_claimAutoreleasedReturnValue(),
        unint64_t v9 = [v8 count],
        v8,
        v7 >= v9))
  {
    uint64_t v11 = 0;
  }
  else
  {
    uint64_t v10 = [(_NSDiffableDataSourceSectionSnapshotState *)self->_state identifiers];
    uint64_t v11 = [v10 objectAtIndexedSubscript:v7];
  }
  return v11;
}

@end