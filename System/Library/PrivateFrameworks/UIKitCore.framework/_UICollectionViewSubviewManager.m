@interface _UICollectionViewSubviewManager
- (BOOL)enqueueViewForReuse:(uint64_t)a1;
- (BOOL)hasVisibleCells;
- (_UICollectionViewSubviewCollection)allVisibleViewsSubviewCollection;
- (id)allVisibleViews;
- (id)allVisibleViewsHashTable;
- (id)dequeueReusableViewWithReuseIdentifier:(void *)a3 elementKind:(uint64_t)a4 elementCategory:;
- (id)description;
- (id)visibleCellAtIndexPath:(id *)a1;
- (id)visibleViewOfKind:(uint64_t)a3 inCategory:(uint64_t)a4 atIndexPath:;
- (id)visibleViewWithLayoutAttributes:(id *)a1;
- (uint64_t)enumerateAllViewsInReuseQueueWithEnumerator:(uint64_t)result;
- (uint64_t)indexPathsForVisibleCells;
- (uint64_t)indexPathsForVisibleDecorationsOfKind:(uint64_t *)a1;
- (uint64_t)indexPathsForVisibleSupplementariesOfKind:(uint64_t *)a1;
- (uint64_t)isViewInReuseQueue:(uint64_t)a1;
- (uint64_t)removeAllVisibleViews;
- (uint64_t)replaceVisibleViewsWithoutCopyingWithContentsOfSubviewCollection:(uint64_t)result;
- (uint64_t)setVisibleCell:(uint64_t)a3 atIndexPath:;
- (uint64_t)updateVisibleCellsUsingFilter:(uint64_t)result;
- (uint64_t)visibleCells;
- (uint64_t)visibleDecorationOfKind:(uint64_t)a3 atIndexPath:;
- (uint64_t)visibleDecorationsOfKind:(uint64_t *)a1;
- (uint64_t)visibleSupplementariesOfKind:(uint64_t *)a1;
- (uint64_t)visibleSupplementaryOfKind:(uint64_t)a3 atIndexPath:;
- (void)_getElementKindReuseQueues:(void *)a3 reuseQueue:(uint64_t)a4 forReuseIdentifier:(void *)a5 elementKind:(int)a6 creatingIfNecessary:;
- (void)ensureViewIsRemovedFromReuseQueue:(uint64_t)a1;
- (void)initWithCollectionView:(void *)a1;
- (void)removeAllDequeuedViewsWithEnumerator:(uint64_t)a1;
@end

@implementation _UICollectionViewSubviewManager

- (id)allVisibleViews
{
  if (a1)
  {
    -[_UICollectionViewSubviewCollection allViews](a1[1]);
    a1 = (id **)objc_claimAutoreleasedReturnValue();
    uint64_t v1 = vars8;
  }
  return a1;
}

- (uint64_t)visibleCells
{
  if (a1)
  {
    -[_UICollectionViewSubviewCollection cells](a1[1]);
    a1 = (uint64_t *)objc_claimAutoreleasedReturnValue();
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)visibleViewOfKind:(uint64_t)a3 inCategory:(uint64_t)a4 atIndexPath:
{
  if (a1)
  {
    -[_UICollectionViewSubviewCollection viewOfKind:inCategory:atIndexPath:](a1[1], a2, a3, a4);
    a1 = (id **)objc_claimAutoreleasedReturnValue();
    uint64_t v4 = vars8;
  }
  return a1;
}

- (void)removeAllDequeuedViewsWithEnumerator:(uint64_t)a1
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    if (!a2)
    {
      v10 = [MEMORY[0x1E4F28B00] currentHandler];
      [v10 handleFailureInMethod:sel_removeAllDequeuedViewsWithEnumerator_, a1, @"_UICollectionViewSubviewManager.m", 376, @"Invalid parameter not satisfying: %@", @"enumerator != nil" object file lineNumber description];
    }
    id v4 = *(id *)(a1 + 24);
    if ([v4 count])
    {
      char v15 = 0;
      long long v11 = 0u;
      long long v12 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
      id v5 = v4;
      uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v16 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v12;
LABEL_7:
        uint64_t v9 = 0;
        while (1)
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v5);
          }
          (*(void (**)(uint64_t, void, char *))(a2 + 16))(a2, *(void *)(*((void *)&v11 + 1) + 8 * v9), &v15);
          if (v15) {
            break;
          }
          if (v7 == ++v9)
          {
            uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v16 count:16];
            if (v7) {
              goto LABEL_7;
            }
            break;
          }
        }
      }

      [v5 removeAllObjects];
    }
  }
}

- (id)visibleViewWithLayoutAttributes:(id *)a1
{
  v2 = a1;
  if (a1)
  {
    id v4 = [a2 representedElementKind];
    uint64_t v5 = [a2 representedElementCategory];
    uint64_t v6 = [a2 indexPath];
    -[_UICollectionViewSubviewManager visibleViewOfKind:inCategory:atIndexPath:](v2, (uint64_t)v4, v5, (uint64_t)v6);
    v2 = (id **)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (uint64_t)indexPathsForVisibleCells
{
  if (a1)
  {
    -[_UICollectionViewSubviewCollection indexPathsForCells](a1[1]);
    a1 = (uint64_t *)objc_claimAutoreleasedReturnValue();
    uint64_t v1 = vars8;
  }
  return a1;
}

- (_UICollectionViewSubviewCollection)allVisibleViewsSubviewCollection
{
  if (a1)
  {
    v2 = objc_alloc_init(_UICollectionViewSubviewCollection);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __67___UICollectionViewSubviewManager_allVisibleViewsSubviewCollection__block_invoke;
    v5[3] = &unk_1E52E5F30;
    v3 = v2;
    uint64_t v6 = v3;
    -[_UICollectionViewSubviewCollection enumerateAllViewsWithEnumerator:](*(void *)(a1 + 8), (uint64_t)v5);
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)visibleCellAtIndexPath:(id *)a1
{
  if (a1)
  {
    -[_UICollectionViewSubviewCollection cellAtIndexPath:](a1[1], a2);
    a1 = (id **)objc_claimAutoreleasedReturnValue();
    uint64_t v2 = vars8;
  }
  return a1;
}

- (uint64_t)replaceVisibleViewsWithoutCopyingWithContentsOfSubviewCollection:(uint64_t)result
{
  if (result)
  {
    uint64_t v2 = result;
    -[_UICollectionViewSubviewCollection transferAllViewsWithoutCopyingToSubviewCollection:](a2, *(id **)(result + 8));
    v3 = *(void **)(v2 + 40);
    return [v3 _subviewManagerDidUpdateVisibleCells];
  }
  return result;
}

- (BOOL)hasVisibleCells
{
  if (!a1) {
    return 0;
  }
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  uint64_t v1 = *(void *)(a1 + 8);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __50___UICollectionViewSubviewManager_hasVisibleCells__block_invoke;
  v4[3] = &unk_1E5302070;
  v4[4] = &v5;
  -[_UICollectionViewSubviewCollection enumerateCellsWithEnumerator:](v1, (uint64_t)v4);
  BOOL v2 = *((unsigned char *)v6 + 24) != 0;
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (BOOL)enqueueViewForReuse:(uint64_t)a1
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  id v4 = [a2 reuseIdentifier];
  uint64_t v5 = [a2 _layoutAttributes];
  uint64_t v6 = -[UIBarButtonItemGroup _items](v5);

  BOOL v7 = 0;
  if (v4 && v6)
  {
    id v26 = 0;
    id v27 = 0;
    -[_UICollectionViewSubviewManager _getElementKindReuseQueues:reuseQueue:forReuseIdentifier:elementKind:creatingIfNecessary:](a1, &v27, &v26, (uint64_t)v4, v6, 1);
    id v8 = v27;
    id v9 = v26;
    id v10 = *(id *)(a1 + 40);
    if (os_variant_has_internal_diagnostics())
    {
      if (!v10)
      {
        v22 = __UIFaultDebugAssertLog();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_1853B0000, v22, OS_LOG_TYPE_FAULT, "UICollectionView internal inconsistency: attempted to reuse view for a nil collection view", buf, 2u);
        }
      }
    }
    else if (!v10)
    {
      v25 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_MergedGlobals_1197) + 8);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1853B0000, v25, OS_LOG_TYPE_ERROR, "UICollectionView internal inconsistency: attempted to reuse view for a nil collection view", buf, 2u);
      }
    }
    if (!v9)
    {
      v23 = [MEMORY[0x1E4F28B00] currentHandler];
      v24 = [a2 _layoutAttributes];
      objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", sel_enqueueViewForReuse_, a1, @"_UICollectionViewSubviewManager.m", 264, @"UICollectionView internal inconsistency: expected reuse queue for view. Collection view: %@; view: %@; layout attributes: %@",
        v10,
        a2,
        v24);
    }
    [v10 bounds];
    double Width = CGRectGetWidth(v35);
    [v10 bounds];
    double v12 = Width * CGRectGetHeight(v36);
    [a2 bounds];
    double v13 = CGRectGetWidth(v37);
    [a2 bounds];
    double v14 = v13 * CGRectGetHeight(v38);
    if (v14 < 1.0) {
      double v14 = 1.0;
    }
    unint64_t v15 = vcvtpd_s64_f64(v12 * 1.5 / v14) + 1;
    unint64_t v16 = [v9 count];
    BOOL v17 = v16 >= v15;
    BOOL v7 = v16 < v15;
    if (v17) {
      goto LABEL_18;
    }
    if (([v9 containsObject:a2] & 1) == 0)
    {
      [v9 addObject:a2];
      goto LABEL_18;
    }
    if (os_variant_has_internal_diagnostics())
    {
      v19 = __UIFaultDebugAssertLog();
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
        goto LABEL_16;
      }
      v20 = [a2 _layoutAttributes];
      *(_DWORD *)buf = 138412802;
      id v29 = v10;
      __int16 v30 = 2112;
      v31 = a2;
      __int16 v32 = 2112;
      v33 = v20;
      _os_log_fault_impl(&dword_1853B0000, v19, OS_LOG_TYPE_FAULT, "UICollectionView internal inconsistency: attempted to queue view that is already in the reuse queue. Collection view: %@; view: %@; layout attributes: %@",
        buf,
        0x20u);
    }
    else
    {
      v18 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB262450) + 8);
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
LABEL_18:

        goto LABEL_19;
      }
      v19 = v18;
      v20 = [a2 _layoutAttributes];
      *(_DWORD *)buf = 138412802;
      id v29 = v10;
      __int16 v30 = 2112;
      v31 = a2;
      __int16 v32 = 2112;
      v33 = v20;
      _os_log_impl(&dword_1853B0000, v19, OS_LOG_TYPE_ERROR, "UICollectionView internal inconsistency: attempted to queue view that is already in the reuse queue. Collection view: %@; view: %@; layout attributes: %@",
        buf,
        0x20u);
    }

LABEL_16:
    goto LABEL_18;
  }
LABEL_19:

  return v7;
}

- (uint64_t)updateVisibleCellsUsingFilter:(uint64_t)result
{
  if (result)
  {
    uint64_t v2 = result;
    -[_UICollectionViewSubviewCollection updateCellsUsingFilter:](*(void *)(result + 8), a2);
    v3 = *(void **)(v2 + 40);
    return [v3 _subviewManagerDidUpdateVisibleCells];
  }
  return result;
}

- (uint64_t)setVisibleCell:(uint64_t)a3 atIndexPath:
{
  if (result)
  {
    uint64_t v3 = result;
    -[_UICollectionViewSubviewCollection setCell:atIndexPath:](*(void *)(result + 8), a2, a3);
    id v4 = *(void **)(v3 + 40);
    return [v4 _subviewManagerDidUpdateVisibleCells];
  }
  return result;
}

- (id)dequeueReusableViewWithReuseIdentifier:(void *)a3 elementKind:(uint64_t)a4 elementCategory:
{
  id v4 = a1;
  if (!a1) {
    goto LABEL_11;
  }
  if (a2)
  {
    if (!a3) {
      goto LABEL_4;
    }
  }
  else
  {
    double v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:sel_dequeueReusableViewWithReuseIdentifier_elementKind_elementCategory_, v4, @"_UICollectionViewSubviewManager.m", 231, @"Invalid parameter not satisfying: %@", @"reuseIdentifier != nil" object file lineNumber description];

    if (!a3)
    {
LABEL_4:
      if (a4)
      {
        double v13 = [MEMORY[0x1E4F28B00] currentHandler];
        [v13 handleFailureInMethod:sel_dequeueReusableViewWithReuseIdentifier_elementKind_elementCategory_, v4, @"_UICollectionViewSubviewManager.m", 232, @"Invalid parameter not satisfying: %@", @"elementKind != nil || elementCategory == UICollectionElementCategoryCell" object file lineNumber description];
      }
    }
  }
  id v14 = 0;
  id v15 = 0;
  -[_UICollectionViewSubviewManager _getElementKindReuseQueues:reuseQueue:forReuseIdentifier:elementKind:creatingIfNecessary:]((uint64_t)v4, &v15, &v14, a2, a3, 0);
  id v8 = v15;
  id v9 = v14;
  id v4 = [v9 lastObject];
  if (v4)
  {
    objc_msgSend(v9, "removeObjectAtIndex:", objc_msgSend(v9, "count") - 1);
    if (![v9 count]) {
      [v8 removeObjectForKey:a2];
    }
    id v10 = v4;
  }

LABEL_11:
  return v4;
}

- (void)_getElementKindReuseQueues:(void *)a3 reuseQueue:(uint64_t)a4 forReuseIdentifier:(void *)a5 elementKind:(int)a6 creatingIfNecessary:
{
  if (!a1) {
    return;
  }
  if (a2)
  {
    if (a3) {
      goto LABEL_4;
    }
LABEL_20:
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:sel__getElementKindReuseQueues_reuseQueue_forReuseIdentifier_elementKind_creatingIfNecessary_, a1, @"_UICollectionViewSubviewManager.m", 342, @"Invalid parameter not satisfying: %@", @"reuseQueueForIdentifier != nil" object file lineNumber description];

    if (a4) {
      goto LABEL_5;
    }
    goto LABEL_21;
  }
  v18 = [MEMORY[0x1E4F28B00] currentHandler];
  [v18 handleFailureInMethod:sel__getElementKindReuseQueues_reuseQueue_forReuseIdentifier_elementKind_creatingIfNecessary_, a1, @"_UICollectionViewSubviewManager.m", 341, @"Invalid parameter not satisfying: %@", @"reuseQueuesForElementKind != nil" object file lineNumber description];

  if (!a3) {
    goto LABEL_20;
  }
LABEL_4:
  if (a4) {
    goto LABEL_5;
  }
LABEL_21:
  v20 = [MEMORY[0x1E4F28B00] currentHandler];
  [v20 handleFailureInMethod:sel__getElementKindReuseQueues_reuseQueue_forReuseIdentifier_elementKind_creatingIfNecessary_, a1, @"_UICollectionViewSubviewManager.m", 343, @"Invalid parameter not satisfying: %@", @"reuseIdentifier != nil" object file lineNumber description];

LABEL_5:
  double v12 = @"UICollectionElementKindCell";
  if (a5) {
    double v12 = a5;
  }
  id v21 = v12;
  double v13 = objc_msgSend(*(id *)(a1 + 16), "objectForKeyedSubscript:");
  if (v13) {
    goto LABEL_10;
  }
  if (a6)
  {
    double v13 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:5];
    [*(id *)(a1 + 16) setObject:v13 forKeyedSubscript:v21];
LABEL_10:
    id v14 = [v13 objectForKeyedSubscript:a4];
    if (v14) {
      BOOL v15 = 1;
    }
    else {
      BOOL v15 = a6 == 0;
    }
    if (!v15)
    {
      id v14 = (void *)[objc_alloc(MEMORY[0x1E4F1CA70]) initWithCapacity:5];
      [v13 setObject:v14 forKeyedSubscript:a4];
    }
    id v16 = v13;
    *a2 = v16;
    id v17 = v14;
    *a3 = v17;
  }
}

- (uint64_t)isViewInReuseQueue:(uint64_t)a1
{
  if (!a1) {
    return 0;
  }
  id v4 = [a2 reuseIdentifier];
  uint64_t v5 = [a2 _layoutAttributes];
  uint64_t v6 = -[UIBarButtonItemGroup _items](v5);

  uint64_t v7 = 0;
  if (v4 && v6)
  {
    id v11 = 0;
    id v12 = 0;
    -[_UICollectionViewSubviewManager _getElementKindReuseQueues:reuseQueue:forReuseIdentifier:elementKind:creatingIfNecessary:](a1, &v12, &v11, (uint64_t)v4, v6, 0);
    id v8 = v12;
    id v9 = v11;
    uint64_t v7 = [v9 containsObject:a2];
  }
  return v7;
}

- (uint64_t)removeAllVisibleViews
{
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = *(id **)(result + 8);
    if (v2)
    {
      [v2[1] removeAllObjects];
      [v2[2] removeAllObjects];
      [v2[3] removeAllObjects];
    }
    uint64_t v3 = *(void **)(v1 + 40);
    return [v3 _subviewManagerDidUpdateVisibleCells];
  }
  return result;
}

- (uint64_t)visibleDecorationOfKind:(uint64_t)a3 atIndexPath:
{
  if (a1)
  {
    -[_UICollectionViewSubviewCollection decorationOfKind:atIndexPath:](a1[1], a2, a3);
    a1 = (uint64_t *)objc_claimAutoreleasedReturnValue();
    uint64_t v3 = vars8;
  }
  return a1;
}

- (uint64_t)visibleSupplementaryOfKind:(uint64_t)a3 atIndexPath:
{
  if (a1)
  {
    -[_UICollectionViewSubviewCollection supplementaryOfKind:atIndexPath:](a1[1], a2, a3);
    a1 = (uint64_t *)objc_claimAutoreleasedReturnValue();
    uint64_t v3 = vars8;
  }
  return a1;
}

- (uint64_t)indexPathsForVisibleSupplementariesOfKind:(uint64_t *)a1
{
  if (a1)
  {
    -[_UICollectionViewSubviewCollection indexPathsForSupplementariesOfKind:](a1[1], a2);
    a1 = (uint64_t *)objc_claimAutoreleasedReturnValue();
    uint64_t v2 = vars8;
  }
  return a1;
}

- (void)initWithCollectionView:(void *)a1
{
  if (!a1) {
    return 0;
  }
  v14.receiver = a1;
  v14.super_class = (Class)_UICollectionViewSubviewManager;
  uint64_t v3 = objc_msgSendSuper2(&v14, sel_init);
  id v4 = v3;
  if (v3)
  {
    v3[5] = a2;
    uint64_t v5 = objc_alloc_init(_UICollectionViewSubviewCollection);
    uint64_t v6 = (void *)v4[1];
    v4[1] = v5;

    uint64_t v7 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:3];
    id v8 = (void *)v4[2];
    v4[2] = v7;

    uint64_t v9 = [objc_alloc(MEMORY[0x1E4F28D30]) initWithOptions:512 capacity:5];
    id v10 = (void *)v4[3];
    v4[3] = v9;

    uint64_t v11 = [objc_alloc(MEMORY[0x1E4F28D30]) initWithOptions:514 capacity:5];
    id v12 = (void *)v4[4];
    v4[4] = v11;
  }
  return v4;
}

- (id)allVisibleViewsHashTable
{
  if (a1)
  {
    -[_UICollectionViewSubviewCollection allViewsHashTable](a1[1]);
    a1 = (id **)objc_claimAutoreleasedReturnValue();
    uint64_t v1 = vars8;
  }
  return a1;
}

- (uint64_t)visibleSupplementariesOfKind:(uint64_t *)a1
{
  if (a1)
  {
    -[_UICollectionViewSubviewCollection supplementariesOfKind:](a1[1], a2);
    a1 = (uint64_t *)objc_claimAutoreleasedReturnValue();
    uint64_t v2 = vars8;
  }
  return a1;
}

- (uint64_t)enumerateAllViewsInReuseQueueWithEnumerator:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    if (!a2)
    {
      uint64_t v5 = [MEMORY[0x1E4F28B00] currentHandler];
      [v5 handleFailureInMethod:sel_enumerateAllViewsInReuseQueueWithEnumerator_, v3, @"_UICollectionViewSubviewManager.m", 296, @"Invalid parameter not satisfying: %@", @"enumerator != nil" object file lineNumber description];
    }
    id v4 = *(void **)(v3 + 16);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __79___UICollectionViewSubviewManager_enumerateAllViewsInReuseQueueWithEnumerator___block_invoke;
    v6[3] = &unk_1E52E5F58;
    v6[4] = a2;
    return [v4 enumerateKeysAndObjectsUsingBlock:v6];
  }
  return result;
}

- (uint64_t)visibleDecorationsOfKind:(uint64_t *)a1
{
  if (a1)
  {
    -[_UICollectionViewSubviewCollection decorationsOfKind:](a1[1], a2);
    a1 = (uint64_t *)objc_claimAutoreleasedReturnValue();
    uint64_t v2 = vars8;
  }
  return a1;
}

- (uint64_t)indexPathsForVisibleDecorationsOfKind:(uint64_t *)a1
{
  if (a1)
  {
    -[_UICollectionViewSubviewCollection indexPathsForDecorationsOfKind:](a1[1], a2);
    a1 = (uint64_t *)objc_claimAutoreleasedReturnValue();
    uint64_t v2 = vars8;
  }
  return a1;
}

- (void)ensureViewIsRemovedFromReuseQueue:(uint64_t)a1
{
  if (a1)
  {
    id v4 = [a2 reuseIdentifier];
    uint64_t v5 = [a2 _layoutAttributes];
    uint64_t v6 = -[UIBarButtonItemGroup _items](v5);

    if (v4 && v6)
    {
      id v10 = 0;
      id v11 = 0;
      -[_UICollectionViewSubviewManager _getElementKindReuseQueues:reuseQueue:forReuseIdentifier:elementKind:creatingIfNecessary:](a1, &v11, &v10, (uint64_t)v4, v6, 0);
      id v7 = v11;
      id v8 = v10;
      uint64_t v9 = v8;
      if (v8)
      {
        [v8 removeObject:a2];
        if (![v9 count]) {
          [v7 removeObjectForKey:v4];
        }
      }
    }
  }
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"<%@ %p visibleViews = %@; reuseQueues = %@>",
               objc_opt_class(),
               self,
               self->_visibleViews,
               self->_reuseQueues);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewsPreparingForDisplay, 0);
  objc_storeStrong((id *)&self->_dequeuedViews, 0);
  objc_storeStrong((id *)&self->_reuseQueues, 0);
  objc_storeStrong((id *)&self->_visibleViews, 0);
}

@end