@interface UICollectionViewLayoutInvalidationContext
- (BOOL)_requiresFullCacheInvalidation;
- (BOOL)_retainExistingSizingInfoForEstimates;
- (BOOL)_shouldInvalidateCollectionViewContentSize;
- (BOOL)invalidateDataSourceCounts;
- (BOOL)invalidateEverything;
- (CGPoint)contentOffsetAdjustment;
- (CGPoint)interactiveMovementTarget;
- (CGSize)contentSizeAdjustment;
- (NSArray)_updateItems;
- (NSArray)invalidatedItemIndexPaths;
- (NSArray)previousIndexPathsForInteractivelyMovingItems;
- (NSArray)targetIndexPathsForInteractivelyMovingItems;
- (NSDictionary)invalidatedDecorationIndexPaths;
- (NSDictionary)invalidatedSupplementaryIndexPaths;
- (id)_invalidatedSupplementaryViews;
- (int64_t)_intent;
- (uint64_t)_shouldInvalidatePreferredAttributes;
- (void)_invalidateSupplementaryElementsOfKind:(id)a3 atIndexPaths:(id)a4;
- (void)_orthogonalSectionsWithContentSizeChanges;
- (void)_removeInvalidatedDecorationOfKind:(id)a3 indexPath:(id)a4;
- (void)_removeInvalidatedItemIndexPath:(id)a3;
- (void)_removeInvalidatedSupplementaryOfKind:(id)a3 indexPath:(id)a4;
- (void)_setIntent:(int64_t)a3;
- (void)_setInteractiveMovementTarget:(CGPoint)a3;
- (void)_setInvalidateDataSourceCounts:(BOOL)a3;
- (void)_setInvalidateEverything:(BOOL)a3;
- (void)_setInvalidatedSupplementaryViews:(id)a3;
- (void)_setPreviousIndexPathsForInteractivelyMovingItems:(id)a3;
- (void)_setRequiresFullCacheInvalidation;
- (void)_setRetainExistingSizingInfoForEstimates:(BOOL)a3;
- (void)_setShouldInvalidateCollectionViewContentSize:(BOOL)a3;
- (void)_setTargetIndexPathsForInteractivelyMovingItems:(id)a3;
- (void)_setUpdateItems:(id)a3;
- (void)invalidateDecorationElementsOfKind:(NSString *)elementKind atIndexPaths:(NSArray *)indexPaths;
- (void)invalidateItemsAtIndexPaths:(NSArray *)indexPaths;
- (void)setContentOffsetAdjustment:(CGPoint)contentOffsetAdjustment;
- (void)setContentSizeAdjustment:(CGSize)contentSizeAdjustment;
@end

@implementation UICollectionViewLayoutInvalidationContext

- (void)_removeInvalidatedItemIndexPath:(id)a3
{
}

- (void)invalidateItemsAtIndexPaths:(NSArray *)indexPaths
{
  if ([(NSArray *)indexPaths count])
  {
    invalidatedItemIndexPaths = self->_invalidatedItemIndexPaths;
    if (!invalidatedItemIndexPaths)
    {
      v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
      v7 = self->_invalidatedItemIndexPaths;
      self->_invalidatedItemIndexPaths = v6;

      invalidatedItemIndexPaths = self->_invalidatedItemIndexPaths;
    }
    [(NSMutableSet *)invalidatedItemIndexPaths addObjectsFromArray:indexPaths];
  }
}

- (void)_orthogonalSectionsWithContentSizeChanges
{
  if (a1)
  {
    v2 = a1;
    v3 = (void *)a1[13];
    if (!v3)
    {
      id v4 = objc_alloc_init(MEMORY[0x1E4F28E60]);
      v5 = (void *)v2[13];
      v2[13] = v4;

      v3 = (void *)v2[13];
    }
    a1 = v3;
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__indexPathsForItemsRequiringPreferredAttributes, 0);
  objc_storeStrong((id *)&self->_orthogonalSectionsWithContentSizeChanges, 0);
  objc_storeStrong((id *)&self->_targetIndexPathsForReorderedItems, 0);
  objc_storeStrong((id *)&self->_previousIndexPathsForReorderedItems, 0);
  objc_storeStrong((id *)&self->_updateItems, 0);
  objc_storeStrong((id *)&self->_invalidatedDecorationIndexPaths, 0);
  objc_storeStrong((id *)&self->_invalidatedSupplementaryIndexPaths, 0);
  objc_storeStrong((id *)&self->_invalidatedItemIndexPaths, 0);
}

- (void)_setIntent:(int64_t)a3
{
  self->_intent = a3;
}

- (void)_setUpdateItems:(id)a3
{
  updateItems = self->_updateItems;
  p_updateItems = &self->_updateItems;
  if (updateItems != a3) {
    objc_storeStrong((id *)p_updateItems, a3);
  }
}

- (int64_t)_intent
{
  return self->_intent;
}

- (BOOL)invalidateEverything
{
  return (*(unsigned char *)&self->_invalidationContextFlags >> 1) & 1;
}

- (NSArray)invalidatedItemIndexPaths
{
  return (NSArray *)[(NSMutableSet *)self->_invalidatedItemIndexPaths allObjects];
}

- (NSDictionary)invalidatedDecorationIndexPaths
{
  if (self->_invalidatedDecorationIndexPaths)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", -[NSMutableDictionary count](self->_invalidatedDecorationIndexPaths, "count"));
    invalidatedDecorationIndexPaths = self->_invalidatedDecorationIndexPaths;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __76__UICollectionViewLayoutInvalidationContext_invalidatedDecorationIndexPaths__block_invoke;
    v7[3] = &unk_1E52E6220;
    id v5 = v3;
    id v8 = v5;
    [(NSMutableDictionary *)invalidatedDecorationIndexPaths enumerateKeysAndObjectsUsingBlock:v7];
  }
  else
  {
    id v5 = 0;
  }
  return (NSDictionary *)v5;
}

- (NSDictionary)invalidatedSupplementaryIndexPaths
{
  if (self->_invalidatedSupplementaryIndexPaths)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", -[NSMutableDictionary count](self->_invalidatedSupplementaryIndexPaths, "count"));
    invalidatedSupplementaryIndexPaths = self->_invalidatedSupplementaryIndexPaths;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __79__UICollectionViewLayoutInvalidationContext_invalidatedSupplementaryIndexPaths__block_invoke;
    v7[3] = &unk_1E52E6220;
    id v5 = v3;
    id v8 = v5;
    [(NSMutableDictionary *)invalidatedSupplementaryIndexPaths enumerateKeysAndObjectsUsingBlock:v7];
  }
  else
  {
    id v5 = 0;
  }
  return (NSDictionary *)v5;
}

- (CGSize)contentSizeAdjustment
{
  double width = self->_contentSizeAdjustment.width;
  double height = self->_contentSizeAdjustment.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGPoint)contentOffsetAdjustment
{
  double x = self->_contentOffsetAdjustment.x;
  double y = self->_contentOffsetAdjustment.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (uint64_t)_shouldInvalidatePreferredAttributes
{
  if (result)
  {
    uint64_t v1 = (unsigned __int8 *)result;
    if (dyld_program_sdk_at_least())
    {
      unint64_t v2 = [v1 _intent];
      CGPoint result = 1;
      if (v2 <= 0xF && ((1 << v2) & 0x8062) != 0) {
        return (v1[112] >> 1) & 1;
      }
    }
    else
    {
      return 1;
    }
  }
  return result;
}

- (BOOL)_shouldInvalidateCollectionViewContentSize
{
  return (*(unsigned char *)&self->_invalidationContextFlags >> 2) & 1;
}

- (BOOL)_requiresFullCacheInvalidation
{
  if (!a1) {
    return 0;
  }
  if ((a1[112] & 0x10) != 0
    || dyld_program_sdk_at_least() && ([a1 invalidateEverything] & 1) != 0)
  {
    return 1;
  }
  unint64_t v2 = [a1 invalidatedItemIndexPaths];
  if ([v2 count])
  {
    BOOL v3 = 0;
  }
  else
  {
    id v4 = [a1 invalidatedSupplementaryIndexPaths];
    if ([v4 count])
    {
      BOOL v3 = 0;
    }
    else
    {
      id v5 = [a1 invalidatedDecorationIndexPaths];
      BOOL v3 = [v5 count] == 0;
    }
  }

  unint64_t v6 = [a1 _intent];
  unint64_t v7 = v6;
  if (v6 > 0xF)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:sel__requiresFullCacheInvalidation, a1, @"UICollectionViewLayout.m", 986, @"UICollectionView internal bug: Created context with unknown intent: %lld. Context: %@", v7, a1 object file lineNumber description];

    return 1;
  }
  if (((1 << v6) & 0xE5B) == 0) {
    return ((1 << v6) & 0x71A4) != 0;
  }
  return v3;
}

- (void)_setInvalidateEverything:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_invalidationContextFlags = *(unsigned char *)&self->_invalidationContextFlags & 0xFD | v3;
}

- (void)_setRequiresFullCacheInvalidation
{
  *(unsigned char *)&self->_invalidationContextFlags |= 0x10u;
}

- (void)setContentOffsetAdjustment:(CGPoint)contentOffsetAdjustment
{
  self->_contentOffsetAdjustment = contentOffsetAdjustment;
}

- (void)_setShouldInvalidateCollectionViewContentSize:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_invalidationContextFlags = *(unsigned char *)&self->_invalidationContextFlags & 0xFB | v3;
}

void __76__UICollectionViewLayoutInvalidationContext_invalidatedDecorationIndexPaths__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = [a3 allObjects];
  [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:a2];
}

void __79__UICollectionViewLayoutInvalidationContext_invalidatedSupplementaryIndexPaths__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = [a3 allObjects];
  [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:a2];
}

- (id)_invalidatedSupplementaryViews
{
  return self->_invalidatedSupplementaryIndexPaths;
}

- (BOOL)_retainExistingSizingInfoForEstimates
{
  return self->_retainExistingSizingInfoForEstimates;
}

- (void)_setInvalidateDataSourceCounts:(BOOL)a3
{
  *(unsigned char *)&self->_invalidationContextFlags = *(unsigned char *)&self->_invalidationContextFlags & 0xFE | a3;
}

- (void)invalidateDecorationElementsOfKind:(NSString *)elementKind atIndexPaths:(NSArray *)indexPaths
{
  invalidatedDecorationIndexPaths = self->_invalidatedDecorationIndexPaths;
  if (!invalidatedDecorationIndexPaths)
  {
    id v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v9 = self->_invalidatedDecorationIndexPaths;
    self->_invalidatedDecorationIndexPaths = v8;

    invalidatedDecorationIndexPaths = self->_invalidatedDecorationIndexPaths;
  }
  v10 = [(NSMutableDictionary *)invalidatedDecorationIndexPaths objectForKeyedSubscript:elementKind];
  id v12 = v10;
  if (v10)
  {
    [v10 addObjectsFromArray:indexPaths];
  }
  else
  {
    v11 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithArray:indexPaths];
    [(NSMutableDictionary *)self->_invalidatedDecorationIndexPaths setObject:v11 forKeyedSubscript:elementKind];
  }
}

- (void)_invalidateSupplementaryElementsOfKind:(id)a3 atIndexPaths:(id)a4
{
  if (a3 && a4)
  {
    invalidatedSupplementaryIndexPaths = self->_invalidatedSupplementaryIndexPaths;
    if (!invalidatedSupplementaryIndexPaths)
    {
      id v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      v9 = self->_invalidatedSupplementaryIndexPaths;
      self->_invalidatedSupplementaryIndexPaths = v8;

      invalidatedSupplementaryIndexPaths = self->_invalidatedSupplementaryIndexPaths;
    }
    id v11 = [(NSMutableDictionary *)invalidatedSupplementaryIndexPaths objectForKeyedSubscript:a3];
    if (v11)
    {
      [v11 addObjectsFromArray:a4];
    }
    else
    {
      v10 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithArray:a4];
      [(NSMutableDictionary *)self->_invalidatedSupplementaryIndexPaths setObject:v10 forKeyedSubscript:a3];
    }
  }
}

- (void)_setInvalidatedSupplementaryViews:(id)a3
{
  id v5 = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(a3, "count"));
  invalidatedSupplementaryIndexPaths = self->_invalidatedSupplementaryIndexPaths;
  self->_invalidatedSupplementaryIndexPaths = v5;

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __79__UICollectionViewLayoutInvalidationContext__setInvalidatedSupplementaryViews___block_invoke;
  v7[3] = &unk_1E52DD258;
  void v7[4] = self;
  [a3 enumerateKeysAndObjectsUsingBlock:v7];
}

void __79__UICollectionViewLayoutInvalidationContext__setInvalidatedSupplementaryViews___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = [a3 mutableCopy];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      return;
    }
    uint64_t v6 = [objc_alloc(MEMORY[0x1E4F1CA80]) initWithArray:a3];
  }
  id v7 = (id)v6;
  [*(id *)(*(void *)(a1 + 32) + 16) setObject:v6 forKeyedSubscript:a2];
}

- (void)_removeInvalidatedSupplementaryOfKind:(id)a3 indexPath:(id)a4
{
  id v7 = -[NSMutableDictionary objectForKeyedSubscript:](self->_invalidatedSupplementaryIndexPaths, "objectForKeyedSubscript:");
  id v8 = v7;
  if (v7)
  {
    v10 = v7;
    [v7 removeObject:a4];
    uint64_t v9 = [v10 count];
    id v8 = v10;
    if (!v9)
    {
      [(NSMutableDictionary *)self->_invalidatedSupplementaryIndexPaths removeObjectForKey:a3];
      id v8 = v10;
    }
  }
}

- (void)_removeInvalidatedDecorationOfKind:(id)a3 indexPath:(id)a4
{
  id v7 = -[NSMutableDictionary objectForKeyedSubscript:](self->_invalidatedDecorationIndexPaths, "objectForKeyedSubscript:");
  id v8 = v7;
  if (v7)
  {
    v10 = v7;
    [v7 removeObject:a4];
    uint64_t v9 = [v10 count];
    id v8 = v10;
    if (!v9)
    {
      [(NSMutableDictionary *)self->_invalidatedDecorationIndexPaths removeObjectForKey:a3];
      id v8 = v10;
    }
  }
}

- (BOOL)invalidateDataSourceCounts
{
  return *(unsigned char *)&self->_invalidationContextFlags & 1;
}

- (NSArray)_updateItems
{
  unint64_t v2 = self->_updateItems;
  return v2;
}

- (void)setContentSizeAdjustment:(CGSize)contentSizeAdjustment
{
  self->_contentSizeAdjustment = contentSizeAdjustment;
}

- (NSArray)previousIndexPathsForInteractivelyMovingItems
{
  return self->_previousIndexPathsForReorderedItems;
}

- (void)_setPreviousIndexPathsForInteractivelyMovingItems:(id)a3
{
  if (self->_previousIndexPathsForReorderedItems != a3)
  {
    id v4 = (NSArray *)[a3 copy];
    previousIndexPathsForReorderedItems = self->_previousIndexPathsForReorderedItems;
    self->_previousIndexPathsForReorderedItems = v4;
  }
}

- (NSArray)targetIndexPathsForInteractivelyMovingItems
{
  return self->_targetIndexPathsForReorderedItems;
}

- (void)_setTargetIndexPathsForInteractivelyMovingItems:(id)a3
{
  targetIndexPathsForReorderedItems = self->_targetIndexPathsForReorderedItems;
  p_targetIndexPathsForReorderedItems = &self->_targetIndexPathsForReorderedItems;
  if (targetIndexPathsForReorderedItems != a3) {
    objc_storeStrong((id *)p_targetIndexPathsForReorderedItems, a3);
  }
}

- (CGPoint)interactiveMovementTarget
{
  double x = self->_reorderingTarget.x;
  double y = self->_reorderingTarget.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)_setInteractiveMovementTarget:(CGPoint)a3
{
  self->_reorderingTarget = a3;
}

- (void)_setRetainExistingSizingInfoForEstimates:(BOOL)a3
{
  self->_retainExistingSizingInfoForEstimates = a3;
}

@end