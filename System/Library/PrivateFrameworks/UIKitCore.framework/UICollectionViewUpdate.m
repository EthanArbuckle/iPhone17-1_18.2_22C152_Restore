@interface UICollectionViewUpdate
- (NSString)description;
- (_NSRange)finalSectionGlobalItemRangeForSection:(int64_t)a3;
- (_NSRange)initalSectionGlobalItemRangeForSection:(int64_t)a3;
- (id)finalIndexPathForInitialIndexPath:(id)a3;
- (id)finalIndexPathForSupplementaryElementOfKind:(id)a3 forInitialIndexPath:(id)a4;
- (id)initWithCollectionView:(void *)a3 updateItems:(void *)a4 moveItemSourceIndexPaths:(void *)a5 oldModel:(void *)a6 newModel:(double)a7 oldContentOffset:(double)a8 newContentOffset:(double)a9;
- (id)initialIndexPathForFinalIndexPath:(id)a3;
- (id)initialIndexPathForSupplementaryElementOfKind:(id)a3 forFinalIndexPath:(id)a4;
- (id)newIndexPathForSupplementaryElementOfKind:(void *)a3 oldIndexPath:;
- (id)validatedNewIndexPathForSupplementaryElementOfKind:(void *)a3 oldIndexPath:;
- (id)validatedOldIndexPathForSupplementaryElementOfKind:(void *)a3 newIndexPath:;
- (int64_t)finalGlobalIndexForInitialGlobalIndex:(int64_t)a3;
- (int64_t)finalSectionCount;
- (int64_t)finalSectionIndexForInitialSectionIndex:(int64_t)a3;
- (int64_t)initialGlobalIndexForFinalGlobalIndex:(int64_t)a3;
- (int64_t)initialSectionCount;
- (int64_t)initialSectionIndexForFinalSectionIndex:(int64_t)a3;
- (uint64_t)hasDeletedAuxiliaryElementOfKind:(void *)a3 atIndexPath:;
- (uint64_t)hasInsertedAuxiliaryElementOfKind:(void *)a3 atIndexPath:;
- (uint64_t)hasMovedItemAtOldIndexPath:(uint64_t)a1;
- (void)_computeAuxiliaryUpdates;
- (void)_generateUpdateMaps;
- (void)_processDeletedAuxiliaryOfKind:(void *)a3 atIndexPath:(int)a4 isSupplementary:;
- (void)_processInsertedAuxiliaryOfKind:(void *)a3 atIndexPath:(int)a4 isSupplementary:;
- (void)dealloc;
@end

@implementation UICollectionViewUpdate

- (id)initialIndexPathForFinalIndexPath:(id)a3
{
  id v4 = a3;
  if (v4
    && (uint64_t v5 = -[UICollectionViewUpdate initialGlobalIndexForFinalGlobalIndex:](self, "initialGlobalIndexForFinalGlobalIndex:", -[UICollectionViewData validatedGlobalIndexForItemAtIndexPath:]((uint64_t)self->_newModel, v4)), v5 != 0x7FFFFFFFFFFFFFFFLL))
  {
    v6 = -[UICollectionViewData validatedIndexPathForItemAtGlobalIndex:](self->_oldModel, v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (int64_t)initialGlobalIndexForFinalGlobalIndex:(int64_t)a3
{
  unint64_t newGlobalItemCount = self->_updateMaps.newGlobalItemCount;
  newGlobalItemMap = self->_updateMaps.newGlobalItemMap;
  if (!newGlobalItemMap)
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    v8 = objc_msgSend(NSString, "stringWithUTF8String:", "NSInteger _UIUpdateMapOldGlobalItemForNewGlobalItem(const _UIDataSourceUpdateMaps, const NSInteger)");
    [v7 handleFailureInFunction:v8, @"_UIDataSourceBatchUpdateMap.h", 185, @"Invalid parameter not satisfying: %@", @"updateMaps.newGlobalItemMap != NULL" file lineNumber description];
  }
  if ((unint64_t)a3 > 0x7FFFFFFFFFFFFFFELL) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  if (newGlobalItemCount <= a3) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  int64_t result = newGlobalItemMap[a3];
  if (result == -1) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  return result;
}

void __45__UICollectionViewUpdate__generateUpdateMaps__block_invoke_5(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  id v4 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a2];
  _UIDataSourceUpdateFromCollectionViewUpdateItem(v4, a3);
}

uint64_t __45__UICollectionViewUpdate__generateUpdateMaps__block_invoke_3(uint64_t a1, unsigned int a2)
{
  unint64_t v2 = -[UICollectionViewData numberOfItemsBeforeSection:](*(void *)(a1 + 32), a2);
  if (v2 != 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v3 = v2;
    if (!HIDWORD(v2)) {
      return v3;
    }
    uint64_t v5 = [MEMORY[0x1E4F28B00] currentHandler];
    v6 = [NSString stringWithUTF8String:"_UIMapIndex _UIMapIndexFromNSInteger(const NSInteger)"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"_UIDataSourceBatchUpdateMap.h", 28, @"NSInteger index is negative or too large: %ld", v3);
  }
  return 0xFFFFFFFFLL;
}

uint64_t __45__UICollectionViewUpdate__generateUpdateMaps__block_invoke_7(uint64_t a1, uint64_t a2, unsigned int a3)
{
  return [*(id *)(a1 + 32) addIndex:a3];
}

uint64_t __45__UICollectionViewUpdate__generateUpdateMaps__block_invoke_4(uint64_t a1, unsigned int a2)
{
  unint64_t v2 = -[UICollectionViewData numberOfItemsInSection:](*(void *)(a1 + 32), a2);
  if (v2 != 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v3 = v2;
    if (!HIDWORD(v2)) {
      return v3;
    }
    uint64_t v5 = [MEMORY[0x1E4F28B00] currentHandler];
    v6 = [NSString stringWithUTF8String:"_UIMapIndex _UIMapIndexFromNSInteger(const NSInteger)"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"_UIDataSourceBatchUpdateMap.h", 28, @"NSInteger index is negative or too large: %ld", v3);
  }
  return 0xFFFFFFFFLL;
}

uint64_t __45__UICollectionViewUpdate__generateUpdateMaps__block_invoke(uint64_t a1, unsigned int a2)
{
  unint64_t v2 = -[UICollectionViewData numberOfItemsBeforeSection:](*(void *)(a1 + 32), a2);
  if (v2 != 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v3 = v2;
    if (!HIDWORD(v2)) {
      return v3;
    }
    uint64_t v5 = [MEMORY[0x1E4F28B00] currentHandler];
    v6 = [NSString stringWithUTF8String:"_UIMapIndex _UIMapIndexFromNSInteger(const NSInteger)"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"_UIDataSourceBatchUpdateMap.h", 28, @"NSInteger index is negative or too large: %ld", v3);
  }
  return 0xFFFFFFFFLL;
}

uint64_t __45__UICollectionViewUpdate__generateUpdateMaps__block_invoke_6(uint64_t a1, uint64_t a2, unsigned int a3)
{
  return [*(id *)(a1 + 32) addIndex:a3];
}

uint64_t __45__UICollectionViewUpdate__generateUpdateMaps__block_invoke_2(uint64_t a1, unsigned int a2)
{
  unint64_t v2 = -[UICollectionViewData numberOfItemsInSection:](*(void *)(a1 + 32), a2);
  if (v2 != 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v3 = v2;
    if (!HIDWORD(v2)) {
      return v3;
    }
    uint64_t v5 = [MEMORY[0x1E4F28B00] currentHandler];
    v6 = [NSString stringWithUTF8String:"_UIMapIndex _UIMapIndexFromNSInteger(const NSInteger)"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"_UIDataSourceBatchUpdateMap.h", 28, @"NSInteger index is negative or too large: %ld", v3);
  }
  return 0xFFFFFFFFLL;
}

- (_NSRange)finalSectionGlobalItemRangeForSection:(int64_t)a3
{
  int64_t v5 = -[UICollectionViewData numberOfSections]((uint64_t)self->_newModel);
  NSUInteger v6 = 0;
  uint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  if ((a3 & 0x8000000000000000) == 0 && v5 > a3)
  {
    uint64_t v7 = -[UICollectionViewData numberOfItemsBeforeSection:]((uint64_t)self->_newModel, a3);
    NSUInteger v6 = -[UICollectionViewData numberOfItemsInSection:]((uint64_t)self->_newModel, a3);
  }
  NSUInteger v8 = v7;
  result.length = v6;
  result.location = v8;
  return result;
}

- (int64_t)initialSectionIndexForFinalSectionIndex:(int64_t)a3
{
  unint64_t newSectionCount = self->_updateMaps.newSectionCount;
  newSectionMap = self->_updateMaps.newSectionMap;
  if (!newSectionMap)
  {
    uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    NSUInteger v8 = objc_msgSend(NSString, "stringWithUTF8String:", "NSInteger _UIUpdateMapOldSectionForNewSection(const _UIDataSourceUpdateMaps, const NSInteger)");
    [v7 handleFailureInFunction:v8, @"_UIDataSourceBatchUpdateMap.h", 157, @"Invalid parameter not satisfying: %@", @"updateMaps.newSectionMap != NULL" file lineNumber description];
  }
  if ((unint64_t)a3 > 0x7FFFFFFFFFFFFFFELL) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  if (newSectionCount <= a3) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  int64_t result = newSectionMap[a3];
  if (result == -1) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  return result;
}

- (id)initWithCollectionView:(void *)a3 updateItems:(void *)a4 moveItemSourceIndexPaths:(void *)a5 oldModel:(void *)a6 newModel:(double)a7 oldContentOffset:(double)a8 newContentOffset:(double)a9
{
  id v19 = a2;
  id v20 = a3;
  id v21 = a4;
  id v22 = a5;
  id v23 = a6;
  if (a1)
  {
    v30.receiver = a1;
    v30.super_class = (Class)UICollectionViewUpdate;
    v24 = (id *)objc_msgSendSuper2(&v30, sel_init);
    a1 = v24;
    if (v24)
    {
      objc_storeWeak(v24 + 16, v19);
      objc_storeStrong(a1 + 1, a3);
      objc_storeStrong(a1 + 2, a5);
      objc_storeStrong(a1 + 3, a6);
      *((double *)a1 + 4) = a7;
      *((double *)a1 + 5) = a8;
      *((double *)a1 + 6) = a9;
      *((double *)a1 + 7) = a10;
      uint64_t v25 = [MEMORY[0x1E4F29128] UUID];
      id v26 = a1[28];
      a1[28] = (id)v25;

      uint64_t v27 = [v21 copy];
      id v28 = a1[18];
      a1[18] = (id)v27;

      [a1 _generateUpdateMaps];
    }
  }

  return a1;
}

- (id)finalIndexPathForInitialIndexPath:(id)a3
{
  id v4 = a3;
  if (v4
    && (uint64_t v5 = -[UICollectionViewUpdate finalGlobalIndexForInitialGlobalIndex:](self, "finalGlobalIndexForInitialGlobalIndex:", -[UICollectionViewData validatedGlobalIndexForItemAtIndexPath:]((uint64_t)self->_oldModel, v4)), v5 != 0x7FFFFFFFFFFFFFFFLL))
  {
    NSUInteger v6 = -[UICollectionViewData validatedIndexPathForItemAtGlobalIndex:](self->_newModel, v5);
  }
  else
  {
    NSUInteger v6 = 0;
  }

  return v6;
}

- (int64_t)finalGlobalIndexForInitialGlobalIndex:(int64_t)a3
{
  unint64_t oldGlobalItemCount = self->_updateMaps.oldGlobalItemCount;
  oldGlobalItemMap = self->_updateMaps.oldGlobalItemMap;
  if (!oldGlobalItemMap)
  {
    uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    NSUInteger v8 = objc_msgSend(NSString, "stringWithUTF8String:", "NSInteger _UIUpdateMapNewGlobalItemForOldGlobalItem(const _UIDataSourceUpdateMaps, const NSInteger)");
    [v7 handleFailureInFunction:v8, @"_UIDataSourceBatchUpdateMap.h", 171, @"Invalid parameter not satisfying: %@", @"updateMaps.oldGlobalItemMap != NULL" file lineNumber description];
  }
  if ((unint64_t)a3 > 0x7FFFFFFFFFFFFFFELL) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  if (oldGlobalItemCount <= a3) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  int64_t result = oldGlobalItemMap[a3];
  if (result == -1) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  return result;
}

- (int64_t)finalSectionIndexForInitialSectionIndex:(int64_t)a3
{
  unint64_t oldSectionCount = self->_updateMaps.oldSectionCount;
  oldSectionMap = self->_updateMaps.oldSectionMap;
  if (!oldSectionMap)
  {
    uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    NSUInteger v8 = objc_msgSend(NSString, "stringWithUTF8String:", "NSInteger _UIUpdateMapNewSectionForOldSection(const _UIDataSourceUpdateMaps, const NSInteger)");
    [v7 handleFailureInFunction:v8, @"_UIDataSourceBatchUpdateMap.h", 143, @"Invalid parameter not satisfying: %@", @"updateMaps.oldSectionMap != NULL" file lineNumber description];
  }
  if ((unint64_t)a3 > 0x7FFFFFFFFFFFFFFELL) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  if (oldSectionCount <= a3) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  int64_t result = oldSectionMap[a3];
  if (result == -1) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  return result;
}

- (id)validatedNewIndexPathForSupplementaryElementOfKind:(void *)a3 oldIndexPath:
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    int has_internal_diagnostics = os_variant_has_internal_diagnostics();
    uint64_t v8 = *(void *)(a1 + 80);
    if (has_internal_diagnostics)
    {
      if (!v8 || !*(void *)(a1 + 88))
      {
        v17 = __UIFaultDebugAssertLog();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)id v22 = 0;
          _os_log_fault_impl(&dword_1853B0000, v17, OS_LOG_TYPE_FAULT, "UICollectionView internal inconsistency: _computeAuxiliaryUpdates must be called by the layout first", v22, 2u);
        }
      }
    }
    else if (!v8 || !*(void *)(a1 + 88))
    {
      v16 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &validatedNewIndexPathForSupplementaryElementOfKind_oldIndexPath____s_category)+ 8);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1853B0000, v16, OS_LOG_TYPE_ERROR, "UICollectionView internal inconsistency: _computeAuxiliaryUpdates must be called by the layout first", buf, 2u);
      }
    }
    if ([v6 item] != 0x7FFFFFFFFFFFFFFFLL)
    {
      if ([*(id *)(a1 + 136) containsObject:v5])
      {
        a1 = [(id)a1 finalIndexPathForInitialIndexPath:v6];
        goto LABEL_19;
      }
      unint64_t v9 = [v6 section];
      if (v9 < [*(id *)(a1 + 80) count])
      {
        unint64_t v10 = *(unsigned int *)(a1 + 152);
        uint64_t v11 = *(void *)(a1 + 168);
        if (!v11)
        {
          unint64_t v20 = *(unsigned int *)(a1 + 152);
          v18 = [MEMORY[0x1E4F28B00] currentHandler];
          id v19 = objc_msgSend(NSString, "stringWithUTF8String:", "NSInteger _UIUpdateMapNewSectionForOldSection(const _UIDataSourceUpdateMaps, const NSInteger)");
          [v18 handleFailureInFunction:v19, @"_UIDataSourceBatchUpdateMap.h", 143, @"Invalid parameter not satisfying: %@", @"updateMaps.oldSectionMap != NULL" file lineNumber description];

          unint64_t v10 = v20;
          uint64_t v11 = 0;
        }
        if (v9 > 0x7FFFFFFFFFFFFFFELL
          || v9 >= v10
          || (unint64_t v12 = *(unsigned int *)(v11 + 4 * v9), v12 == -1))
        {
          unint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
        }
        if (v12 < [*(id *)(a1 + 88) count])
        {
          v13 = [*(id *)(a1 + 80) objectAtIndexedSubscript:v9];
          v14 = [v13 objectForKey:v5];

          if (objc_msgSend(v14, "containsIndex:", objc_msgSend(v6, "item")))
          {
            a1 = 0;
          }
          else
          {
            a1 = -[UICollectionViewUpdate newIndexPathForSupplementaryElementOfKind:oldIndexPath:](a1, v5, v6);
          }

          goto LABEL_19;
        }
      }
    }
    a1 = 0;
  }
LABEL_19:

  return (id)a1;
}

- (id)newIndexPathForSupplementaryElementOfKind:(void *)a3 oldIndexPath:
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    int has_internal_diagnostics = os_variant_has_internal_diagnostics();
    uint64_t v8 = *(void *)(a1 + 80);
    if (has_internal_diagnostics)
    {
      if (!v8 || !*(void *)(a1 + 88))
      {
        v24 = __UIFaultDebugAssertLog();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)objc_super v30 = 0;
          _os_log_fault_impl(&dword_1853B0000, v24, OS_LOG_TYPE_FAULT, "UICollectionView internal inconsistency: _computeAuxiliaryUpdates must be called by the layout first", v30, 2u);
        }
      }
    }
    else if (!v8 || !*(void *)(a1 + 88))
    {
      id v23 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &newIndexPathForSupplementaryElementOfKind_oldIndexPath____s_category)+ 8);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1853B0000, v23, OS_LOG_TYPE_ERROR, "UICollectionView internal inconsistency: _computeAuxiliaryUpdates must be called by the layout first", buf, 2u);
      }
    }
    uint64_t v9 = [v6 item];
    if (v9 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v11 = v9;
      if (![*(id *)(a1 + 136) containsObject:v5])
      {
        unint64_t v12 = [v6 section];
        unint64_t v13 = *(unsigned int *)(a1 + 152);
        uint64_t v14 = *(void *)(a1 + 168);
        if (!v14)
        {
          unint64_t v27 = *(unsigned int *)(a1 + 152);
          unint64_t v28 = v12;
          uint64_t v25 = [MEMORY[0x1E4F28B00] currentHandler];
          id v26 = objc_msgSend(NSString, "stringWithUTF8String:", "NSInteger _UIUpdateMapNewSectionForOldSection(const _UIDataSourceUpdateMaps, const NSInteger)");
          [v25 handleFailureInFunction:v26, @"_UIDataSourceBatchUpdateMap.h", 143, @"Invalid parameter not satisfying: %@", @"updateMaps.oldSectionMap != NULL" file lineNumber description];

          unint64_t v13 = v27;
          unint64_t v12 = v28;
        }
        if (v12 > 0x7FFFFFFFFFFFFFFELL
          || v12 >= v13
          || (uint64_t v15 = *(unsigned int *)(v14 + 4 * v12), v15 == -1))
        {
          uint64_t v15 = 0x7FFFFFFFFFFFFFFFLL;
        }
        v16 = objc_msgSend(*(id *)(a1 + 80), "objectAtIndexedSubscript:");
        v17 = [v16 valueForKey:v5];
        uint64_t v18 = v11 - objc_msgSend(v17, "countOfIndexesInRange:", 0, v11);

        id v19 = [*(id *)(a1 + 88) objectAtIndexedSubscript:v15];
        unint64_t v20 = [v19 valueForKey:v5];
        uint64_t v21 = objc_msgSend(v20, "countOfIndexesInRange:", 0, v18 + 1) + v18;

        id v10 = [MEMORY[0x1E4F28D58] indexPathForItem:v21 inSection:v15];
        goto LABEL_17;
      }
      a1 = [(id)a1 finalIndexPathForInitialIndexPath:v6];
      if (a1) {
        goto LABEL_18;
      }
    }
    id v10 = v6;
LABEL_17:
    a1 = (uint64_t)v10;
  }
LABEL_18:

  return (id)a1;
}

- (void)_computeAuxiliaryUpdates
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v2 = -[UICollectionViewData numberOfSections](*(void *)(a1 + 16));
    uint64_t v3 = -[UICollectionViewData numberOfSections](*(void *)(a1 + 24));
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v5 = *(void **)(a1 + 96);
    *(void *)(a1 + 96) = v4;

    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v7 = *(void **)(a1 + 104);
    *(void *)(a1 + 104) = v6;

    uint64_t v8 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v2];
    uint64_t v9 = *(void **)(a1 + 80);
    *(void *)(a1 + 80) = v8;

    uint64_t v10 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v3];
    uint64_t v11 = *(void **)(a1 + 88);
    *(void *)(a1 + 88) = v10;

    if (v2 >= 1)
    {
      do
      {
        unint64_t v12 = *(void **)(a1 + 80);
        unint64_t v13 = [MEMORY[0x1E4F1CA60] dictionary];
        [v12 addObject:v13];

        --v2;
      }
      while (v2);
    }
    if (v3 >= 1)
    {
      do
      {
        uint64_t v14 = *(void **)(a1 + 88);
        uint64_t v15 = [MEMORY[0x1E4F1CA60] dictionary];
        [v14 addObject:v15];

        --v3;
      }
      while (v3);
    }
    v48 = objc_opt_new();
    v16 = -[UICollectionViewData knownSupplementaryElementKinds](*(id **)(a1 + 16));
    v17 = -[UICollectionViewData knownSupplementaryElementKinds](*(id **)(a1 + 24));
    if (v16)
    {
      uint64_t v18 = [v16 setByAddingObjectsFromSet:v17];

      v17 = (void *)v18;
    }
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 128));
    unint64_t v20 = [WeakRetained collectionViewLayout];

    long long v71 = 0u;
    long long v72 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    obuint64_t j = v17;
    uint64_t v52 = [obj countByEnumeratingWithState:&v69 objects:v77 count:16];
    if (v52)
    {
      uint64_t v50 = *(void *)v70;
      v51 = v20;
      do
      {
        for (uint64_t i = 0; i != v52; ++i)
        {
          if (*(void *)v70 != v50) {
            objc_enumerationMutation(obj);
          }
          uint64_t v22 = *(void *)(*((void *)&v69 + 1) + 8 * i);
          if ([v20 _anchorForAuxiliaryElementOfKind:v22] == 3) {
            [v48 addObject:v22];
          }
          id v23 = [v20 indexPathsToDeleteForSupplementaryViewOfKind:v22];
          long long v65 = 0u;
          long long v66 = 0u;
          long long v67 = 0u;
          long long v68 = 0u;
          uint64_t v24 = [v23 countByEnumeratingWithState:&v65 objects:v76 count:16];
          if (v24)
          {
            uint64_t v25 = v24;
            uint64_t v26 = *(void *)v66;
            do
            {
              for (uint64_t j = 0; j != v25; ++j)
              {
                if (*(void *)v66 != v26) {
                  objc_enumerationMutation(v23);
                }
                -[UICollectionViewUpdate _processDeletedAuxiliaryOfKind:atIndexPath:isSupplementary:](a1, v22, *(void **)(*((void *)&v65 + 1) + 8 * j), 1);
              }
              uint64_t v25 = [v23 countByEnumeratingWithState:&v65 objects:v76 count:16];
            }
            while (v25);
          }
          uint64_t v28 = [v20 indexPathsToDeleteForDecorationViewOfKind:v22];
          v29 = (void *)v28;
          objc_super v30 = (void *)MEMORY[0x1E4F1CBF0];
          if (v28) {
            objc_super v30 = (void *)v28;
          }
          id v31 = v30;

          long long v63 = 0u;
          long long v64 = 0u;
          long long v61 = 0u;
          long long v62 = 0u;
          id v32 = v31;
          uint64_t v33 = [v32 countByEnumeratingWithState:&v61 objects:v75 count:16];
          if (v33)
          {
            uint64_t v34 = v33;
            uint64_t v35 = *(void *)v62;
            do
            {
              for (uint64_t k = 0; k != v34; ++k)
              {
                if (*(void *)v62 != v35) {
                  objc_enumerationMutation(v32);
                }
                -[UICollectionViewUpdate _processDeletedAuxiliaryOfKind:atIndexPath:isSupplementary:](a1, v22, *(void **)(*((void *)&v61 + 1) + 8 * k), 0);
              }
              uint64_t v34 = [v32 countByEnumeratingWithState:&v61 objects:v75 count:16];
            }
            while (v34);
          }

          v37 = [v20 indexPathsToInsertForSupplementaryViewOfKind:v22];
          long long v57 = 0u;
          long long v58 = 0u;
          long long v59 = 0u;
          long long v60 = 0u;
          uint64_t v38 = [v37 countByEnumeratingWithState:&v57 objects:v74 count:16];
          if (v38)
          {
            uint64_t v39 = v38;
            uint64_t v40 = *(void *)v58;
            do
            {
              for (uint64_t m = 0; m != v39; ++m)
              {
                if (*(void *)v58 != v40) {
                  objc_enumerationMutation(v37);
                }
                -[UICollectionViewUpdate _processInsertedAuxiliaryOfKind:atIndexPath:isSupplementary:](a1, v22, *(void **)(*((void *)&v57 + 1) + 8 * m), 1);
              }
              uint64_t v39 = [v37 countByEnumeratingWithState:&v57 objects:v74 count:16];
            }
            while (v39);
          }
          v42 = [v20 indexPathsToInsertForDecorationViewOfKind:v22];
          long long v53 = 0u;
          long long v54 = 0u;
          long long v55 = 0u;
          long long v56 = 0u;
          uint64_t v43 = [v42 countByEnumeratingWithState:&v53 objects:v73 count:16];
          if (v43)
          {
            uint64_t v44 = v43;
            uint64_t v45 = *(void *)v54;
            do
            {
              for (uint64_t n = 0; n != v44; ++n)
              {
                if (*(void *)v54 != v45) {
                  objc_enumerationMutation(v42);
                }
                -[UICollectionViewUpdate _processInsertedAuxiliaryOfKind:atIndexPath:isSupplementary:](a1, v22, *(void **)(*((void *)&v53 + 1) + 8 * n), 0);
              }
              uint64_t v44 = [v42 countByEnumeratingWithState:&v53 objects:v73 count:16];
            }
            while (v44);
          }

          unint64_t v20 = v51;
        }
        uint64_t v52 = [obj countByEnumeratingWithState:&v69 objects:v77 count:16];
      }
      while (v52);
    }

    v47 = *(void **)(a1 + 136);
    *(void *)(a1 + 136) = v48;
  }
}

- (int64_t)finalSectionCount
{
  return -[UICollectionViewData numberOfSections]((uint64_t)self->_newModel);
}

- (void)_processInsertedAuxiliaryOfKind:(void *)a3 atIndexPath:(int)a4 isSupplementary:
{
  id v18 = a3;
  uint64_t v7 = [v18 length];
  if (v7 == 1)
  {
    id v8 = *(id *)(a1 + 104);
  }
  else
  {
    unint64_t v9 = [v18 section];
    if ((v9 & 0x8000000000000000) != 0 || v9 >= [*(id *)(a1 + 88) count])
    {
      unint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
      if (a4) {
        uint64_t v14 = @"indexPathsToInsertForSupplementaryViewOfKind:";
      }
      else {
        uint64_t v14 = @"indexPathsToInsertForDecorationViewOfKind:";
      }
      uint64_t v15 = objc_msgSend(v18, "_ui_shortDescription");
      uint64_t v16 = -[UICollectionViewData numberOfSections](*(void *)(a1 + 24));
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 128));
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", sel__processInsertedAuxiliaryOfKind_atIndexPath_isSupplementary_, a1, @"UICollectionViewUpdate.m", 235, @"UICollectionView received an index path with an invalid section from %@. Element kind: %@; index path: %@; number of sections after update: %ld, collection view: %@",
        v14,
        a2,
        v15,
        v16,
        WeakRetained);
    }
    id v8 = [*(id *)(a1 + 88) objectAtIndexedSubscript:v9];
  }
  uint64_t v10 = v8;
  id v11 = [v8 objectForKeyedSubscript:a2];
  if (!v11)
  {
    id v11 = objc_alloc_init(MEMORY[0x1E4F28E60]);
    [v10 setObject:v11 forKeyedSubscript:a2];
  }
  if (v7 == 1) {
    uint64_t v12 = [v18 indexAtPosition:0];
  }
  else {
    uint64_t v12 = [v18 item];
  }
  [v11 addIndex:v12];
}

- (void)_processDeletedAuxiliaryOfKind:(void *)a3 atIndexPath:(int)a4 isSupplementary:
{
  id v18 = a3;
  uint64_t v7 = [v18 length];
  if (v7 == 1)
  {
    id v8 = *(id *)(a1 + 96);
  }
  else
  {
    unint64_t v9 = [v18 section];
    if ((v9 & 0x8000000000000000) != 0 || v9 >= [*(id *)(a1 + 80) count])
    {
      unint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
      if (a4) {
        uint64_t v14 = @"indexPathsToDeleteForSupplementaryViewOfKind:";
      }
      else {
        uint64_t v14 = @"indexPathsToDeleteForDecorationViewOfKind:";
      }
      uint64_t v15 = objc_msgSend(v18, "_ui_shortDescription");
      uint64_t v16 = -[UICollectionViewData numberOfSections](*(void *)(a1 + 16));
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 128));
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", sel__processDeletedAuxiliaryOfKind_atIndexPath_isSupplementary_, a1, @"UICollectionViewUpdate.m", 207, @"UICollectionView received an index path with an invalid section from %@. Element kind: %@; index path: %@; number of sections before update: %ld; collection view: %@",
        v14,
        a2,
        v15,
        v16,
        WeakRetained);
    }
    id v8 = [*(id *)(a1 + 80) objectAtIndexedSubscript:v9];
  }
  uint64_t v10 = v8;
  id v11 = [v8 objectForKeyedSubscript:a2];
  if (!v11)
  {
    id v11 = objc_alloc_init(MEMORY[0x1E4F28E60]);
    [v10 setObject:v11 forKeyedSubscript:a2];
  }
  if (v7 == 1) {
    uint64_t v12 = [v18 indexAtPosition:0];
  }
  else {
    uint64_t v12 = [v18 item];
  }
  [v11 addIndex:v12];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_invalidUpdatesErrorMessage, 0);
  objc_storeStrong((id *)&self->_moveItemSourceIndexPaths, 0);
  objc_storeStrong((id *)&self->_itemAnchoredAuxiliaryElementKinds, 0);
  objc_destroyWeak((id *)&self->_collectionView);
  objc_storeStrong((id *)&self->_newFocusedItemState, 0);
  objc_storeStrong((id *)&self->_oldFocusedItemState, 0);
  objc_storeStrong((id *)&self->_insertedSupplementaryTopLevelIndexesDict, 0);
  objc_storeStrong((id *)&self->_deletedSupplementaryTopLevelIndexesDict, 0);
  objc_storeStrong((id *)&self->_insertedSupplementaryIndexesSectionArray, 0);
  objc_storeStrong((id *)&self->_deletedSupplementaryIndexesSectionArray, 0);
  objc_storeStrong((id *)&self->_insertedSections, 0);
  objc_storeStrong((id *)&self->_deletedSections, 0);
  objc_storeStrong((id *)&self->_newModel, 0);
  objc_storeStrong((id *)&self->_oldModel, 0);
  objc_storeStrong((id *)&self->_updateItems, 0);
}

- (id)validatedOldIndexPathForSupplementaryElementOfKind:(void *)a3 newIndexPath:
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    int has_internal_diagnostics = os_variant_has_internal_diagnostics();
    uint64_t v8 = *(void *)(a1 + 80);
    if (has_internal_diagnostics)
    {
      if (!v8 || !*(void *)(a1 + 88))
      {
        uint64_t v35 = __UIFaultDebugAssertLog();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)uint64_t v45 = 0;
          _os_log_fault_impl(&dword_1853B0000, v35, OS_LOG_TYPE_FAULT, "UICollectionView internal inconsistency: _computeAuxiliaryUpdates must be called by the layout first", v45, 2u);
        }
      }
    }
    else if (!v8 || !*(void *)(a1 + 88))
    {
      uint64_t v34 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB25FE80) + 8);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1853B0000, v34, OS_LOG_TYPE_ERROR, "UICollectionView internal inconsistency: _computeAuxiliaryUpdates must be called by the layout first", buf, 2u);
      }
    }
    if ([v6 item] == 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_6;
    }
    if ([*(id *)(a1 + 136) containsObject:v5])
    {
      a1 = [(id)a1 initialIndexPathForFinalIndexPath:v6];
      goto LABEL_38;
    }
    unint64_t v9 = [v6 section];
    if (v9 >= [*(id *)(a1 + 88) count])
    {
LABEL_6:
      a1 = 0;
      goto LABEL_38;
    }
    uint64_t v10 = [*(id *)(a1 + 88) objectAtIndexedSubscript:v9];
    id v11 = [v10 objectForKey:v5];

    if (v11 && (objc_msgSend(v11, "containsIndex:", objc_msgSend(v6, "item")) & 1) != 0) {
      goto LABEL_24;
    }
    unint64_t v12 = *(unsigned int *)(a1 + 156);
    uint64_t v13 = *(void *)(a1 + 176);
    if (!v13)
    {
      v36 = [MEMORY[0x1E4F28B00] currentHandler];
      v37 = objc_msgSend(NSString, "stringWithUTF8String:", "NSInteger _UIUpdateMapOldSectionForNewSection(const _UIDataSourceUpdateMaps, const NSInteger)");
      [v36 handleFailureInFunction:v37, @"_UIDataSourceBatchUpdateMap.h", 157, @"Invalid parameter not satisfying: %@", @"updateMaps.newSectionMap != NULL" file lineNumber description];
    }
    if (v9 > 0x7FFFFFFFFFFFFFFELL
      || v9 >= v12
      || (unint64_t v14 = *(unsigned int *)(v13 + 4 * v9), v14 == -1))
    {
      unint64_t v14 = 0x7FFFFFFFFFFFFFFFLL;
    }
    if (v14 >= [*(id *)(a1 + 80) count])
    {
LABEL_24:
      a1 = 0;
LABEL_37:

      goto LABEL_38;
    }
    id v15 = v5;
    id v16 = v6;
    int v17 = os_variant_has_internal_diagnostics();
    uint64_t v18 = *(void *)(a1 + 80);
    if (v17)
    {
      if (!v18 || !*(void *)(a1 + 88))
      {
        uint64_t v39 = __UIFaultDebugAssertLog();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)v47 = 0;
          _os_log_fault_impl(&dword_1853B0000, v39, OS_LOG_TYPE_FAULT, "UICollectionView internal inconsistency: _computeAuxiliaryUpdates must be called by the layout first", v47, 2u);
        }
      }
    }
    else if (!v18 || !*(void *)(a1 + 88))
    {
      uint64_t v38 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_MergedGlobals_995) + 8);
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v46 = 0;
        _os_log_impl(&dword_1853B0000, v38, OS_LOG_TYPE_ERROR, "UICollectionView internal inconsistency: _computeAuxiliaryUpdates must be called by the layout first", v46, 2u);
      }
    }
    uint64_t v19 = [v16 item];
    if (v19 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v21 = v19;
      if (![*(id *)(a1 + 136) containsObject:v15])
      {
        unint64_t v22 = [v16 section];
        unint64_t v23 = *(unsigned int *)(a1 + 156);
        uint64_t v24 = *(void *)(a1 + 176);
        if (!v24)
        {
          unint64_t v43 = v22;
          uint64_t v40 = [MEMORY[0x1E4F28B00] currentHandler];
          v41 = objc_msgSend(NSString, "stringWithUTF8String:", "NSInteger _UIUpdateMapOldSectionForNewSection(const _UIDataSourceUpdateMaps, const NSInteger)");
          [v40 handleFailureInFunction:v41, @"_UIDataSourceBatchUpdateMap.h", 157, @"Invalid parameter not satisfying: %@", @"updateMaps.newSectionMap != NULL" file lineNumber description];

          unint64_t v22 = v43;
        }
        if (v22 > 0x7FFFFFFFFFFFFFFELL
          || v22 >= v23
          || (uint64_t v25 = *(unsigned int *)(v24 + 4 * v22), v25 == -1))
        {
          uint64_t v25 = 0x7FFFFFFFFFFFFFFFLL;
        }
        uint64_t v42 = v25;
        uint64_t v26 = objc_msgSend(*(id *)(a1 + 88), "objectAtIndexedSubscript:");
        unint64_t v27 = [v26 valueForKey:v15];
        id v28 = v15;
        uint64_t v29 = v21 - objc_msgSend(v27, "countOfIndexesInRange:", 0, v21);

        objc_super v30 = [*(id *)(a1 + 80) objectAtIndexedSubscript:v42];
        id v31 = [v30 valueForKey:v28];
        uint64_t v32 = objc_msgSend(v31, "countOfIndexesInRange:", 0, v29 + 1) + v29;
        id v15 = v28;

        id v20 = [MEMORY[0x1E4F28D58] indexPathForItem:v32 inSection:v42];
        goto LABEL_35;
      }
      a1 = [(id)a1 initialIndexPathForFinalIndexPath:v16];
      if (a1)
      {
LABEL_36:

        goto LABEL_37;
      }
    }
    id v20 = v16;
LABEL_35:
    a1 = (uint64_t)v20;
    goto LABEL_36;
  }
LABEL_38:

  return (id)a1;
}

- (id)initialIndexPathForSupplementaryElementOfKind:(id)a3 forFinalIndexPath:(id)a4
{
  return -[UICollectionViewUpdate validatedOldIndexPathForSupplementaryElementOfKind:newIndexPath:]((uint64_t)self, a3, a4);
}

- (void)dealloc
{
  _UIDataSourceDestroyUpdateMaps((uint64_t)&self->_updateMaps);
  v3.receiver = self;
  v3.super_class = (Class)UICollectionViewUpdate;
  [(UICollectionViewUpdate *)&v3 dealloc];
}

- (void)_generateUpdateMaps
{
  objc_super v3 = self->_oldModel;
  unint64_t v4 = -[UICollectionViewData numberOfSections]((uint64_t)v3);
  if (v4 == 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_2;
  }
  uint64_t v5 = v4;
  if (HIDWORD(v4))
  {
    uint64_t v32 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v33 = [NSString stringWithUTF8String:"_UIMapIndex _UIMapIndexFromNSInteger(const NSInteger)"];
    objc_msgSend(v32, "handleFailureInFunction:file:lineNumber:description:", v33, @"_UIDataSourceBatchUpdateMap.h", 28, @"NSInteger index is negative or too large: %ld", v5);

LABEL_2:
    uint64_t v5 = 0xFFFFFFFFLL;
  }
  if (v3)
  {
    if ((*(unsigned char *)&v3->_collectionViewDataFlags & 2) == 0) {
      -[UICollectionViewData _updateItemCounts]((uint64_t)v3);
    }
    unint64_t totalItemCount = v3->_totalItemCount;
    if (totalItemCount == 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_8;
    }
    if (HIDWORD(totalItemCount))
    {
      uint64_t v38 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v39 = [NSString stringWithUTF8String:"_UIMapIndex _UIMapIndexFromNSInteger(const NSInteger)"];
      objc_msgSend(v38, "handleFailureInFunction:file:lineNumber:description:", v39, @"_UIDataSourceBatchUpdateMap.h", 28, @"NSInteger index is negative or too large: %ld", totalItemCount);

LABEL_8:
      unint64_t v7 = 0xFFFFFFFF00000000;
      goto LABEL_11;
    }
  }
  else
  {
    unint64_t totalItemCount = 0;
  }
  unint64_t v7 = totalItemCount << 32;
LABEL_11:
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __45__UICollectionViewUpdate__generateUpdateMaps__block_invoke;
  aBlock[3] = &unk_1E52E6400;
  uint64_t v8 = v3;
  long long v67 = v8;
  uint64_t v44 = _Block_copy(aBlock);
  v64[0] = MEMORY[0x1E4F143A8];
  v64[1] = 3221225472;
  v64[2] = __45__UICollectionViewUpdate__generateUpdateMaps__block_invoke_2;
  v64[3] = &unk_1E52E6400;
  unint64_t v9 = v8;
  long long v65 = v9;
  unint64_t v43 = _Block_copy(v64);
  uint64_t v10 = self->_newModel;
  unint64_t v11 = -[UICollectionViewData numberOfSections]((uint64_t)v10);
  uint64_t v12 = v11;
  if (v11 == 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_12:
    uint64_t v12 = 0xFFFFFFFFLL;
    goto LABEL_14;
  }
  if (HIDWORD(v11))
  {
    uint64_t v34 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v35 = [NSString stringWithUTF8String:"_UIMapIndex _UIMapIndexFromNSInteger(const NSInteger)"];
    objc_msgSend(v34, "handleFailureInFunction:file:lineNumber:description:", v35, @"_UIDataSourceBatchUpdateMap.h", 28, @"NSInteger index is negative or too large: %ld", v12);

    goto LABEL_12;
  }
LABEL_14:
  uint64_t v40 = v9;
  if (!v10)
  {
    unint64_t v13 = 0;
    goto LABEL_20;
  }
  if ((*(unsigned char *)&v10->_collectionViewDataFlags & 2) == 0) {
    -[UICollectionViewData _updateItemCounts]((uint64_t)v10);
  }
  unint64_t v13 = v10->_totalItemCount;
  if (v13 == 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_18;
  }
  if (!HIDWORD(v13))
  {
LABEL_20:
    unint64_t v14 = v13 << 32;
    goto LABEL_21;
  }
  v36 = [MEMORY[0x1E4F28B00] currentHandler];
  v37 = [NSString stringWithUTF8String:"_UIMapIndex _UIMapIndexFromNSInteger(const NSInteger)"];
  objc_msgSend(v36, "handleFailureInFunction:file:lineNumber:description:", v37, @"_UIDataSourceBatchUpdateMap.h", 28, @"NSInteger index is negative or too large: %ld", v13);

LABEL_18:
  unint64_t v14 = 0xFFFFFFFF00000000;
LABEL_21:
  v62[0] = MEMORY[0x1E4F143A8];
  v62[1] = 3221225472;
  v62[2] = __45__UICollectionViewUpdate__generateUpdateMaps__block_invoke_3;
  v62[3] = &unk_1E52E6400;
  id v15 = v10;
  long long v63 = v15;
  uint64_t v42 = _Block_copy(v62);
  v60[0] = MEMORY[0x1E4F143A8];
  v60[1] = 3221225472;
  v60[2] = __45__UICollectionViewUpdate__generateUpdateMaps__block_invoke_4;
  v60[3] = &unk_1E52E6400;
  id v16 = v15;
  long long v61 = v16;
  v41 = _Block_copy(v60);
  int v17 = self->_updateItems;
  v58[0] = MEMORY[0x1E4F143A8];
  v58[1] = 3221225472;
  v58[2] = __45__UICollectionViewUpdate__generateUpdateMaps__block_invoke_5;
  v58[3] = &unk_1E52E6428;
  uint64_t v18 = v17;
  long long v59 = v18;
  uint64_t v19 = _Block_copy(v58);
  id v20 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  id v21 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  v53[0] = MEMORY[0x1E4F143A8];
  v53[1] = 3221225472;
  v53[2] = __45__UICollectionViewUpdate__generateUpdateMaps__block_invoke_6;
  v53[3] = &unk_1E52E6450;
  unint64_t v22 = (NSIndexSet *)v20;
  long long v54 = v22;
  v55[0] = _Block_copy(v53);
  v51[0] = MEMORY[0x1E4F143A8];
  v51[1] = 3221225472;
  v51[2] = __45__UICollectionViewUpdate__generateUpdateMaps__block_invoke_7;
  v51[3] = &unk_1E52E6450;
  unint64_t v23 = (NSIndexSet *)v21;
  uint64_t v52 = v23;
  v55[1] = _Block_copy(v51);
  long long v56 = 0u;
  long long v57 = 0u;
  v48[0] = v7 | v5;
  v48[1] = _Block_copy(v44);
  v48[2] = _Block_copy(v43);
  v47[0] = v14 | v12;
  v47[1] = _Block_copy(v42);
  v47[2] = _Block_copy(v41);
  uint64_t v24 = [(NSArray *)v18 count];
  __copy_constructor_8_8_sb0_sb8_sb16_sb24_sb32_sb40(v46, v55);
  id v45 = 0;
  _UIDataSourceGenerateUpdateMaps((unsigned int *)v48, (unsigned int *)v47, v24, (uint64_t)v19, (uint64_t *)v46, &v45, (uint64_t)v49);
  uint64_t v25 = (NSString *)v45;
  long long v26 = v49[1];
  *(_OWORD *)&self->_updateMaps.unint64_t oldSectionCount = v49[0];
  *(_OWORD *)&self->_updateMaps.oldSectionMap = v26;
  *(_OWORD *)&self->_updateMaps.oldGlobalItemMap = v49[2];
  *(void *)&self->_updateMaps.updatesAreInvalid = v50;
  deletedSections = self->_deletedSections;
  self->_deletedSections = v22;
  id v28 = v22;

  insertedSections = self->_insertedSections;
  self->_insertedSections = v23;
  objc_super v30 = v23;

  invalidUpdatesErrorMessage = self->_invalidUpdatesErrorMessage;
  self->_invalidUpdatesErrorMessage = v25;

  __destructor_8_sb0_sb8_sb16_sb24_sb32_sb40((uint64_t)v55);
}

- (NSString)description
{
  objc_super v3 = NSString;
  unint64_t v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  id v6 = [v3 stringWithFormat:@"[%@ - %p: old:%@ new%@ items:<%@>]", v5, self, self->_oldModel, self->_newModel, self->_updateItems];

  return (NSString *)v6;
}

- (uint64_t)hasInsertedAuxiliaryElementOfKind:(void *)a3 atIndexPath:
{
  id v5 = a2;
  id v6 = a3;
  if (!a1) {
    goto LABEL_13;
  }
  int has_internal_diagnostics = os_variant_has_internal_diagnostics();
  uint64_t v8 = *(void *)(a1 + 88);
  if (has_internal_diagnostics)
  {
    if (!v8)
    {
      id v15 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)uint64_t v19 = 0;
        _os_log_fault_impl(&dword_1853B0000, v15, OS_LOG_TYPE_FAULT, "UICollectionView internal inconsistency: _computeAuxiliaryUpdates must be called by the layout first", v19, 2u);
      }
    }
  }
  else if (!v8)
  {
    int v17 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &hasInsertedAuxiliaryElementOfKind_atIndexPath____s_category)+ 8);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1853B0000, v17, OS_LOG_TYPE_ERROR, "UICollectionView internal inconsistency: _computeAuxiliaryUpdates must be called by the layout first", buf, 2u);
    }
  }
  if (!v6)
  {
    id v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:sel_hasInsertedAuxiliaryElementOfKind_atIndexPath_, a1, @"UICollectionViewUpdate.m", 376, @"Invalid parameter not satisfying: %@", @"indexPath != nil" object file lineNumber description];
  }
  if ([v6 length] == 1)
  {
    unint64_t v9 = [*(id *)(a1 + 104) objectForKeyedSubscript:v5];
    uint64_t v10 = [v6 indexAtPosition:0];
    goto LABEL_11;
  }
  unint64_t v11 = [v6 section];
  if (v11 >= [*(id *)(a1 + 88) count])
  {
LABEL_13:
    uint64_t v13 = 0;
    goto LABEL_14;
  }
  uint64_t v12 = [*(id *)(a1 + 88) objectAtIndexedSubscript:v11];
  unint64_t v9 = [v12 objectForKey:v5];

  if (!v9)
  {
    uint64_t v13 = 0;
    goto LABEL_12;
  }
  uint64_t v10 = [v6 item];
LABEL_11:
  uint64_t v13 = [v9 containsIndex:v10];
LABEL_12:

LABEL_14:
  return v13;
}

- (uint64_t)hasDeletedAuxiliaryElementOfKind:(void *)a3 atIndexPath:
{
  id v5 = a2;
  id v6 = a3;
  unint64_t v7 = v6;
  if (!a1) {
    goto LABEL_13;
  }
  if (!v6)
  {
    id v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:sel_hasDeletedAuxiliaryElementOfKind_atIndexPath_, a1, @"UICollectionViewUpdate.m", 398, @"Invalid parameter not satisfying: %@", @"indexPath != nil" object file lineNumber description];
  }
  int has_internal_diagnostics = os_variant_has_internal_diagnostics();
  uint64_t v9 = *(void *)(a1 + 80);
  if (has_internal_diagnostics)
  {
    if (!v9)
    {
      int v17 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)id v20 = 0;
        _os_log_fault_impl(&dword_1853B0000, v17, OS_LOG_TYPE_FAULT, "UICollectionView internal inconsistency: _computeAuxiliaryUpdates must be called by the layout first", v20, 2u);
      }
    }
  }
  else if (!v9)
  {
    uint64_t v18 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &hasDeletedAuxiliaryElementOfKind_atIndexPath____s_category)+ 8);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1853B0000, v18, OS_LOG_TYPE_ERROR, "UICollectionView internal inconsistency: _computeAuxiliaryUpdates must be called by the layout first", buf, 2u);
    }
  }
  if ([v7 length] == 1)
  {
    uint64_t v10 = [*(id *)(a1 + 96) objectForKeyedSubscript:v5];
    uint64_t v11 = [v7 indexAtPosition:0];
    goto LABEL_11;
  }
  unint64_t v12 = [v7 section];
  if (v12 >= [*(id *)(a1 + 80) count])
  {
LABEL_13:
    uint64_t v14 = 0;
    goto LABEL_14;
  }
  uint64_t v13 = [*(id *)(a1 + 80) objectAtIndexedSubscript:v12];
  uint64_t v10 = [v13 objectForKey:v5];

  if (!v10)
  {
    uint64_t v14 = 0;
    goto LABEL_12;
  }
  uint64_t v11 = [v7 item];
LABEL_11:
  uint64_t v14 = [v10 containsIndex:v11];
LABEL_12:

LABEL_14:
  return v14;
}

- (uint64_t)hasMovedItemAtOldIndexPath:(uint64_t)a1
{
  id v3 = a2;
  unint64_t v4 = v3;
  if (a1)
  {
    if (!v3)
    {
      unint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
      [v7 handleFailureInMethod:sel_hasMovedItemAtOldIndexPath_, a1, @"UICollectionViewUpdate.m", 419, @"Invalid parameter not satisfying: %@", @"oldIndexPath != nil" object file lineNumber description];
    }
    if ([*(id *)(a1 + 144) containsObject:v4])
    {
      a1 = 1;
    }
    else if ([v4 item] == 0x7FFFFFFFFFFFFFFFLL)
    {
      a1 = 0;
    }
    else
    {
      id v5 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForItem:inSection:", 0x7FFFFFFFFFFFFFFFLL, objc_msgSend(v4, "section"));
      a1 = [*(id *)(a1 + 144) containsObject:v5];
    }
  }

  return a1;
}

- (id)finalIndexPathForSupplementaryElementOfKind:(id)a3 forInitialIndexPath:(id)a4
{
  return -[UICollectionViewUpdate validatedNewIndexPathForSupplementaryElementOfKind:oldIndexPath:]((uint64_t)self, a3, a4);
}

- (_NSRange)initalSectionGlobalItemRangeForSection:(int64_t)a3
{
  int64_t v5 = -[UICollectionViewData numberOfSections]((uint64_t)self->_oldModel);
  NSUInteger v6 = 0;
  uint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  if ((a3 & 0x8000000000000000) == 0 && v5 > a3)
  {
    uint64_t v7 = -[UICollectionViewData numberOfItemsBeforeSection:]((uint64_t)self->_oldModel, a3);
    NSUInteger v6 = -[UICollectionViewData numberOfItemsInSection:]((uint64_t)self->_oldModel, a3);
  }
  NSUInteger v8 = v7;
  result.length = v6;
  result.locatiouint64_t n = v8;
  return result;
}

- (int64_t)initialSectionCount
{
  return -[UICollectionViewData numberOfSections]((uint64_t)self->_oldModel);
}

@end