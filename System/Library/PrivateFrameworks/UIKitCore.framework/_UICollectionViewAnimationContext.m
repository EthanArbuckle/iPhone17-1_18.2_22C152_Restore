@interface _UICollectionViewAnimationContext
- (NSArray)appearingAttributes;
- (NSArray)disappearingAttributes;
- (NSArray)updates;
- (UICollectionViewLayout)layout;
- (_NSRange)finalSectionGlobalItemRangeForSection:(int64_t)a3;
- (_NSRange)initalSectionGlobalItemRangeForSection:(int64_t)a3;
- (id)finalIndexPathForInitialIndexPath:(id)a3;
- (id)finalIndexPathForSupplementaryElementOfKind:(id)a3 forInitialIndexPath:(id)a4;
- (id)finalLayoutAttributesForDisappearingItemAtIndexPath:(uint64_t)a1;
- (id)initWithDataSourceTranslator:(void *)a3 updates:(void *)a4 layout:;
- (id)initialIndexPathForFinalIndexPath:(id)a3;
- (id)initialIndexPathForSupplementaryElementOfKind:(id)a3 forFinalIndexPath:(id)a4;
- (id)initialLayoutAttributesForAppearingItemAtIndexPath:(uint64_t)a1;
- (int64_t)finalGlobalIndexForInitialGlobalIndex:(int64_t)a3;
- (int64_t)finalSectionCount;
- (int64_t)finalSectionIndexForInitialSectionIndex:(int64_t)a3;
- (int64_t)initialGlobalIndexForFinalGlobalIndex:(int64_t)a3;
- (int64_t)initialSectionCount;
- (int64_t)initialSectionIndexForFinalSectionIndex:(int64_t)a3;
- (void)setAnimationsForOnScreenViews:(uint64_t)a1;
- (void)setAppearingAttributes:(id)a3;
- (void)setDisappearingAttributes:(id)a3;
@end

@implementation _UICollectionViewAnimationContext

- (void)setAnimationsForOnScreenViews:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 64), a2);
  }
}

- (id)initWithDataSourceTranslator:(void *)a3 updates:(void *)a4 layout:
{
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  if (a1)
  {
    v17.receiver = a1;
    v17.super_class = (Class)_UICollectionViewAnimationContext;
    v11 = (id *)objc_msgSendSuper2(&v17, sel_init);
    a1 = v11;
    if (v11)
    {
      objc_storeStrong(v11 + 5, a2);
      objc_storeStrong(a1 + 3, a3);
      objc_storeStrong(a1 + 4, a4);
      id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      id v13 = a1[1];
      a1[1] = v12;

      id v14 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      id v15 = a1[2];
      a1[2] = v14;
    }
  }

  return a1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentlyVisibleItemIndexPaths, 0);
  objc_storeStrong((id *)&self->_previouslyVisibleItemIndexPaths, 0);
  objc_storeStrong((id *)&self->_animationsForOnScreenViews, 0);
  objc_storeStrong((id *)&self->_disappearingAnimations, 0);
  objc_storeStrong((id *)&self->_appearingAnimations, 0);
  objc_storeStrong((id *)&self->_dataSourceTranslator, 0);
  objc_storeStrong((id *)&self->_layout, 0);
  objc_storeStrong((id *)&self->_updates, 0);
  objc_storeStrong((id *)&self->_disappearingAttributesDict, 0);
  objc_storeStrong((id *)&self->_appearingAttributesDict, 0);
}

- (NSArray)updates
{
  return self->_updates;
}

- (NSArray)appearingAttributes
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v4 = self->_updates;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (!objc_msgSend(v9, "updateAction", (void)v14))
        {
          id v10 = [v9 indexPathAfterUpdate];
          v11 = -[_UICollectionViewAnimationContext initialLayoutAttributesForAppearingItemAtIndexPath:]((uint64_t)self, v10);

          if (v11)
          {
            id v12 = (void *)[v11 copy];
            [v3 addObject:v12];
          }
        }
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (id)initialLayoutAttributesForAppearingItemAtIndexPath:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    v4 = +[_UICollectionViewItemKey collectionItemKeyForCellWithIndexPath:]((uint64_t)_UICollectionViewItemKey, v3);
    uint64_t v5 = [*(id *)(a1 + 8) objectForKeyedSubscript:v4];
    if (!v5)
    {
      uint64_t v5 = [*(id *)(a1 + 32) _initialLayoutAttributesForAppearingItemAtIndexPath:v3];
    }
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (void)setAppearingAttributes:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        id v10 = +[_UICollectionViewItemKey collectionItemKeyForLayoutAttributes:]((uint64_t)_UICollectionViewItemKey, (uint64_t)v9);
        v11 = (void *)[v9 copy];
        [(NSMutableDictionary *)self->_appearingAttributesDict setObject:v11 forKeyedSubscript:v10];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
}

- (NSArray)disappearingAttributes
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = self->_updates;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v9, "updateAction", (void)v14) == 1)
        {
          id v10 = [v9 indexPathBeforeUpdate];
          v11 = -[_UICollectionViewAnimationContext finalLayoutAttributesForDisappearingItemAtIndexPath:]((uint64_t)self, v10);

          if (v11)
          {
            long long v12 = (void *)[v11 copy];
            [v3 addObject:v12];
          }
        }
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (id)finalLayoutAttributesForDisappearingItemAtIndexPath:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = +[_UICollectionViewItemKey collectionItemKeyForCellWithIndexPath:]((uint64_t)_UICollectionViewItemKey, v3);
    uint64_t v5 = [*(id *)(a1 + 16) objectForKeyedSubscript:v4];
    if (!v5)
    {
      uint64_t v5 = [*(id *)(a1 + 32) _finalLayoutAttributesForDisappearingItemAtIndexPath:v3];
    }
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (void)setDisappearingAttributes:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v10 = [v9 indexPath];
        v11 = +[_UICollectionViewItemKey collectionItemKeyForCellWithIndexPath:]((uint64_t)_UICollectionViewItemKey, v10);

        long long v12 = (void *)[v9 copy];
        [(NSMutableDictionary *)self->_disappearingAttributesDict setObject:v12 forKeyedSubscript:v11];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }
}

- (int64_t)finalGlobalIndexForInitialGlobalIndex:(int64_t)a3
{
  return [(_UICollectionViewUpdateTranslating *)self->_dataSourceTranslator finalGlobalIndexForInitialGlobalIndex:a3];
}

- (int64_t)initialGlobalIndexForFinalGlobalIndex:(int64_t)a3
{
  return [(_UICollectionViewUpdateTranslating *)self->_dataSourceTranslator initialGlobalIndexForFinalGlobalIndex:a3];
}

- (id)finalIndexPathForInitialIndexPath:(id)a3
{
  return (id)[(_UICollectionViewUpdateTranslating *)self->_dataSourceTranslator finalIndexPathForInitialIndexPath:a3];
}

- (id)initialIndexPathForFinalIndexPath:(id)a3
{
  return (id)[(_UICollectionViewUpdateTranslating *)self->_dataSourceTranslator initialIndexPathForFinalIndexPath:a3];
}

- (int64_t)finalSectionIndexForInitialSectionIndex:(int64_t)a3
{
  return [(_UICollectionViewUpdateTranslating *)self->_dataSourceTranslator finalSectionIndexForInitialSectionIndex:a3];
}

- (int64_t)initialSectionIndexForFinalSectionIndex:(int64_t)a3
{
  return [(_UICollectionViewUpdateTranslating *)self->_dataSourceTranslator finalSectionIndexForInitialSectionIndex:a3];
}

- (id)finalIndexPathForSupplementaryElementOfKind:(id)a3 forInitialIndexPath:(id)a4
{
  return (id)[(_UICollectionViewUpdateTranslating *)self->_dataSourceTranslator finalIndexPathForSupplementaryElementOfKind:a3 forInitialIndexPath:a4];
}

- (id)initialIndexPathForSupplementaryElementOfKind:(id)a3 forFinalIndexPath:(id)a4
{
  return (id)[(_UICollectionViewUpdateTranslating *)self->_dataSourceTranslator initialIndexPathForSupplementaryElementOfKind:a3 forFinalIndexPath:a4];
}

- (_NSRange)initalSectionGlobalItemRangeForSection:(int64_t)a3
{
  NSUInteger v3 = [(_UICollectionViewUpdateTranslating *)self->_dataSourceTranslator initalSectionGlobalItemRangeForSection:a3];
  result.length = v4;
  result.location = v3;
  return result;
}

- (_NSRange)finalSectionGlobalItemRangeForSection:(int64_t)a3
{
  NSUInteger v3 = [(_UICollectionViewUpdateTranslating *)self->_dataSourceTranslator finalSectionGlobalItemRangeForSection:a3];
  result.length = v4;
  result.location = v3;
  return result;
}

- (int64_t)initialSectionCount
{
  return [(_UICollectionViewUpdateTranslating *)self->_dataSourceTranslator initialSectionCount];
}

- (int64_t)finalSectionCount
{
  return [(_UICollectionViewUpdateTranslating *)self->_dataSourceTranslator finalSectionCount];
}

- (UICollectionViewLayout)layout
{
  return self->_layout;
}

@end