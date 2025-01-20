@interface _UICollectionViewDragSourceControllerDragState
- (NSMutableOrderedSet)dataSourceIndexPathsOfDraggingItems;
- (NSPointerArray)dragItemsWithRebasableIndexPaths;
- (_UICollectionViewDragSourceControllerDragState)init;
- (id)dataSourceIndexPathForDragItem:(void *)a3 forCollectionView:;
- (id)description;
- (id)dragFromDataSourceIndexPath;
- (id)draggingDataSourceIndexPaths;
- (void)rebaseForUpdates:(void *)a1;
- (void)setDataSourceIndexPathsOfDraggingItems:(id)a3;
- (void)setDragItemsWithRebasableIndexPaths:(id)a3;
@end

@implementation _UICollectionViewDragSourceControllerDragState

- (id)draggingDataSourceIndexPaths
{
  if (a1)
  {
    v1 = [a1 dataSourceIndexPathsOfDraggingItems];
    v2 = [v1 array];
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)dragFromDataSourceIndexPath
{
  if (a1)
  {
    v1 = [a1 dataSourceIndexPathsOfDraggingItems];
    v2 = [v1 firstObject];
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)dataSourceIndexPathForDragItem:(void *)a3 forCollectionView:
{
  id v5 = a3;
  if (a1)
  {
    v6 = [a2 _privateLocalContext];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = [v6 collectionView];
      if (v7 == v5)
      {
        a1 = [v6 indexPath];
      }
      else
      {
        a1 = 0;
      }
    }
    else
    {
      a1 = 0;
    }
  }
  return a1;
}

- (void)rebaseForUpdates:(void *)a1
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  v3 = a2;
  if (a1)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v5 = [a1 dataSourceIndexPathsOfDraggingItems];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v32 objects:v37 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v33 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = v3[2](v3, *(void *)(*((void *)&v32 + 1) + 8 * i));
          if (v10) {
            [v4 addObject:v10];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v32 objects:v37 count:16];
      }
      while (v7);
    }

    v11 = [a1 dataSourceIndexPathsOfDraggingItems];
    [v11 removeAllObjects];

    v12 = [a1 dataSourceIndexPathsOfDraggingItems];
    v26 = v4;
    v13 = [v4 array];
    [v12 addObjectsFromArray:v13];

    v14 = [a1 dragItemsWithRebasableIndexPaths];
    [v14 compact];

    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    obuint64_t j = [a1 dragItemsWithRebasableIndexPaths];
    uint64_t v15 = [obj countByEnumeratingWithState:&v28 objects:v36 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v29;
      do
      {
        for (uint64_t j = 0; j != v16; ++j)
        {
          if (*(void *)v29 != v17) {
            objc_enumerationMutation(obj);
          }
          v19 = *(void **)(*((void *)&v28 + 1) + 8 * j);
          v20 = [v19 _privateLocalContext];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v21 = [v20 indexPath];
            v22 = ((void (**)(id, void *))v3)[2](v3, v21);

            v23 = [_UICollectionViewSourcePrivateLocalObject alloc];
            v24 = [v20 collectionView];
            v25 = [(_UICollectionViewSourcePrivateLocalObject *)v23 initWithIndexPath:v22 collectionView:v24];
            [v19 _setPrivateLocalContext:v25];
          }
        }
        uint64_t v16 = [obj countByEnumeratingWithState:&v28 objects:v36 count:16];
      }
      while (v16);
    }
  }
}

- (_UICollectionViewDragSourceControllerDragState)init
{
  v8.receiver = self;
  v8.super_class = (Class)_UICollectionViewDragSourceControllerDragState;
  v2 = [(_UICollectionViewDragSourceControllerDragState *)&v8 init];
  if (v2)
  {
    v3 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E4F1CA70]);
    dataSourceIndexPathsOfDraggingItems = v2->_dataSourceIndexPathsOfDraggingItems;
    v2->_dataSourceIndexPathsOfDraggingItems = v3;

    uint64_t v5 = [MEMORY[0x1E4F28F50] weakObjectsPointerArray];
    dragItemsWithRebasableIndexPaths = v2->_dragItemsWithRebasableIndexPaths;
    v2->_dragItemsWithRebasableIndexPaths = (NSPointerArray *)v5;
  }
  return v2;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  uint64_t v6 = -[_UICollectionViewDragSourceControllerDragState dragFromDataSourceIndexPath](self);
  uint64_t v7 = __UICVIndexPathDescription(v6);
  objc_super v8 = [(_UICollectionViewDragSourceControllerDragState *)self dataSourceIndexPathsOfDraggingItems];
  v9 = [v8 array];
  v10 = __UICVIndexPathsDescription(v9);
  v11 = [v3 stringWithFormat:@"<%@:%p dragFrom=%@ draggingItems=%@>", v5, self, v7, v10];

  return v11;
}

- (NSMutableOrderedSet)dataSourceIndexPathsOfDraggingItems
{
  return self->_dataSourceIndexPathsOfDraggingItems;
}

- (void)setDataSourceIndexPathsOfDraggingItems:(id)a3
{
}

- (NSPointerArray)dragItemsWithRebasableIndexPaths
{
  return self->_dragItemsWithRebasableIndexPaths;
}

- (void)setDragItemsWithRebasableIndexPaths:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dragItemsWithRebasableIndexPaths, 0);
  objc_storeStrong((id *)&self->_dataSourceIndexPathsOfDraggingItems, 0);
}

@end