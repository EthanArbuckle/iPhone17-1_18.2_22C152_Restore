@interface UICollectionViewData
- (BOOL)dataSourceMatchesCurrentCounts;
- (CGRect)_TEST_validLayoutRect;
- (_BYTE)indexPathForItemAtGlobalIndex:(unsigned char *)a1;
- (_BYTE)validatedIndexPathForItemAtGlobalIndex:(unsigned char *)a1;
- (double)collectionViewContentRect;
- (double)rectForItemAtIndexPath:(uint64_t)a1;
- (id).cxx_construct;
- (id)_layoutAttributesForElementsInRect:(int)a3 cellsOnly:(int)a4 validateIfNeeded:(double)a5 includeIndelibleElements:(double)a6;
- (id)_layoutAttributesForElementsInRectForMapping:(double)a3;
- (id)dataSourceCountsDescription;
- (id)descriptionIncludingPointer:(uint64_t)a1;
- (id)existingSupplementaryLayoutAttributes;
- (id)existingSupplementaryLayoutAttributesInSection:(uint64_t)a1;
- (id)knownDecorationElementKinds;
- (id)knownSupplementaryElementKinds;
- (id)layoutAttributesForCellsInRect:(double)a3 validateLayout:(double)a4;
- (id)layoutAttributesForDecorationViewOfKind:(void *)a3 atIndexPath:;
- (id)layoutAttributesForElementsInRect:(double)a3;
- (id)layoutAttributesForGlobalItemIndex:(unsigned char *)a1;
- (id)layoutAttributesForItemAtIndexPath:(uint64_t)a1;
- (id)layoutAttributesForSupplementaryElementOfKind:(void *)a3 atIndexPath:;
- (uint64_t)_existingNumberOfItemsInSection:(uint64_t)result;
- (uint64_t)_isIndexPathValid:(int)a3 validateItemCounts:;
- (uint64_t)_prepareToLoadData;
- (uint64_t)_shouldUseReorderingLayoutAttributesForItemAtIndexPath:(uint64_t)a1;
- (uint64_t)_validateContentSize;
- (uint64_t)finalizeCollectionViewUpdates;
- (uint64_t)globalIndexForItemAtIndexPath:(uint64_t)result;
- (uint64_t)initWithCollectionView:(void *)a3 layout:;
- (uint64_t)invalidateDecorationIndexPaths:(uint64_t)result;
- (uint64_t)invalidateSupplementaryIndexPaths:(uint64_t)result;
- (uint64_t)numberOfItemsBeforeSection:(uint64_t)result;
- (uint64_t)numberOfItemsInSection:(uint64_t)result;
- (uint64_t)numberOfSections;
- (uint64_t)validateLayoutInRectImmediatelyValidatingContentSizeIgnoringSpecificInvalidations:(CGFloat)a3;
- (uint64_t)validatedGlobalIndexForItemAtIndexPath:(uint64_t)result;
- (void)_attributesMapDidPageInAttributes:(unint64_t)a3 globalItemIndex:(int8x16_t)a4;
- (void)_cachedLayoutAttributesForGlobalItemIndex:(void *)a1;
- (void)_setCachedLayoutAttributes:(unint64_t)a3 forGlobalItemIndex:;
- (void)_setLayoutAttributes:(int64_t)a3 atGlobalItemIndex:;
- (void)_updateItemCounts;
- (void)invalidate:(uint64_t)a1;
- (void)invalidateItemsAtIndexPaths:(uint64_t)a1;
- (void)validateDecorationViews;
- (void)validateItems;
- (void)validateLayoutInRect:(CGFloat)a3;
- (void)validateSupplementaryViews;
@end

@implementation UICollectionViewData

- (_BYTE)validatedIndexPathForItemAtGlobalIndex:(unsigned char *)a1
{
  if (a1)
  {
    v4 = a1;
    if ((a1[96] & 2) == 0) {
      -[UICollectionViewData _updateItemCounts]((uint64_t)a1);
    }
    a1 = 0;
    if ((a2 & 0x8000000000000000) == 0 && *((void *)v4 + 21) > a2)
    {
      -[UICollectionViewData indexPathForItemAtGlobalIndex:](v4, a2);
      a1 = (unsigned char *)objc_claimAutoreleasedReturnValue();
    }
    uint64_t v2 = vars8;
  }
  return a1;
}

- (id)layoutAttributesForItemAtIndexPath:(uint64_t)a1
{
  if (!a1
    || (-[UICollectionViewData _prepareToLoadData](a1),
        !-[UICollectionViewData _isIndexPathValid:validateItemCounts:](a1, a2, 0)))
  {
LABEL_17:
    v6 = 0;
    goto LABEL_18;
  }
  if (!-[UICollectionViewData _shouldUseReorderingLayoutAttributesForItemAtIndexPath:](a1, (uint64_t)a2)
    || (v4 = *(void **)(a1 + 16),
        id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8)),
        [WeakRetained _reorderingTargetPosition],
        objc_msgSend(v4, "_layoutAttributesForReorderedItemAtIndexPath:withTargetPosition:", a2),
        v6 = objc_claimAutoreleasedReturnValue(),
        WeakRetained,
        !v6))
  {
    uint64_t v7 = *(void *)(a1 + 168);
    uint64_t v15 = 0;
    uint64_t v16 = 0;
    objc_msgSend(a2, "ui_getSectionIndex:itemIndex:", &v16, &v15);
    uint64_t v8 = -[UICollectionViewData numberOfItemsBeforeSection:](a1, v16);
    unint64_t v9 = v15 + v8;
    if (v15 + v8 >= v7)
    {
      v13 = [MEMORY[0x1E4F28B00] currentHandler];
      [v13 handleFailureInMethod:sel_layoutAttributesForItemAtIndexPath_, a1, @"UICollectionViewData.mm", 704, @"attempting to access layout attributes at invalid index path: %@ globalIndex: %ld numItems: %ld", a2, v9, v7 object file lineNumber description];
    }
    v6 = -[UICollectionViewData _cachedLayoutAttributesForGlobalItemIndex:]((void *)a1, v9);
    if (!v6)
    {
      if ((*(unsigned char *)(a1 + 96) & 0x10) != 0)
      {
        v6 = 0;
      }
      else
      {
        v6 = [*(id *)(a1 + 16) layoutAttributesForItemAtIndexPath:a2];
        -[UICollectionViewData _setLayoutAttributes:atGlobalItemIndex:]((void *)a1, v6, v9);
      }
    }
    char v10 = dyld_program_sdk_at_least();
    char v11 = v6 ? 1 : v10;
    if ((v11 & 1) == 0)
    {
      if ((*(unsigned char *)(a1 + 96) & 0x10) == 0)
      {
        v14 = [MEMORY[0x1E4F28B00] currentHandler];
        [v14 handleFailureInMethod:sel_layoutAttributesForItemAtIndexPath_, a1, @"UICollectionViewData.mm", 715, @"no UICollectionViewLayoutAttributes instance for -layoutAttributesForItemAtIndexPath: %@", a2 object file lineNumber description];
      }
      goto LABEL_17;
    }
  }
LABEL_18:
  return v6;
}

- (uint64_t)validatedGlobalIndexForItemAtIndexPath:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    if (-[UICollectionViewData _isIndexPathValid:validateItemCounts:](result, a2, 1))
    {
      uint64_t v5 = 0;
      uint64_t v6 = 0;
      objc_msgSend(a2, "ui_getSectionIndex:itemIndex:", &v6, &v5);
      uint64_t v4 = -[UICollectionViewData numberOfItemsBeforeSection:](v3, v6);
      return v5 + v4;
    }
    else
    {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  return result;
}

- (uint64_t)_isIndexPathValid:(int)a3 validateItemCounts:
{
  if (result)
  {
    uint64_t v4 = result;
    if (a3 && (*(unsigned char *)(result + 96) & 2) == 0) {
      -[UICollectionViewData _updateItemCounts](result);
    }
    if ((unint64_t)[a2 length] >= 2)
    {
      uint64_t v5 = *(void *)(v4 + 112) - *(void *)(v4 + 104);
      uint64_t v7 = 0;
      uint64_t v8 = 0;
      objc_msgSend(a2, "ui_getSectionIndex:itemIndex:", &v8, &v7);
      result = 0;
      if (v8 < v5 >> 3 && (v8 & 0x8000000000000000) == 0) {
        return *(void *)(*(void *)(v4 + 104) + 8 * v8) > v7 && v7 >= 0;
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (void)_cachedLayoutAttributesForGlobalItemIndex:(void *)a1
{
  if (a1)
  {
    a1 = std::__hash_table<std::__hash_value_type<long,UICollectionViewLayoutAttributes * {__strong}>,std::__unordered_map_hasher<long,std::__hash_value_type<long,UICollectionViewLayoutAttributes * {__strong}>,std::hash<long>,std::equal_to<long>,true>,std::__unordered_map_equal<long,std::__hash_value_type<long,UICollectionViewLayoutAttributes * {__strong}>,std::equal_to<long>,std::hash<long>,true>,std::allocator<std::__hash_value_type<long,UICollectionViewLayoutAttributes * {__strong}>>>::find<long>(a1 + 16, a2);
    if (a1) {
      a1 = (id)a1[3];
    }
    uint64_t v2 = vars8;
  }
  return a1;
}

- (uint64_t)_prepareToLoadData
{
  if (result)
  {
    uint64_t v1 = result;
    result = dyld_program_sdk_at_least();
    char v2 = *(unsigned char *)(v1 + 96);
    if (!result || (*(unsigned char *)(v1 + 96) & 4) == 0)
    {
      if ((*(unsigned char *)(v1 + 96) & 8) == 0)
      {
        if (os_variant_has_internal_diagnostics())
        {
          if ((*(unsigned char *)(v1 + 96) & 0x10) != 0)
          {
            uint64_t v3 = __UIFaultDebugAssertLog();
            if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_fault_impl(&dword_1853B0000, v3, OS_LOG_TYPE_FAULT, "trying to load collection view layout data when layout is locked", buf, 2u);
            }
          }
        }
        else if ((*(unsigned char *)(v1 + 96) & 0x10) != 0)
        {
          uint64_t v4 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &-[UICollectionViewData _prepareToLoadData]::__s_category)+ 8);
          if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)uint64_t v5 = 0;
            _os_log_impl(&dword_1853B0000, v4, OS_LOG_TYPE_ERROR, "trying to load collection view layout data when layout is locked", v5, 2u);
          }
        }
        *(unsigned char *)(v1 + 96) |= 4u;
        [*(id *)(v1 + 16) _prepareLayout];
        char v2 = *(unsigned char *)(v1 + 96) & 0xF3 | 8;
        *(unsigned char *)(v1 + 96) = v2;
      }
      if ((v2 & 2) == 0) {
        -[UICollectionViewData _updateItemCounts](v1);
      }
      return -[UICollectionViewData _validateContentSize](v1);
    }
  }
  return result;
}

- (uint64_t)_validateContentSize
{
  if (result)
  {
    uint64_t v1 = result;
    if ((*(unsigned char *)(result + 96) & 1) == 0)
    {
      if (os_variant_has_internal_diagnostics())
      {
        if ((*(unsigned char *)(v1 + 96) & 0x10) != 0)
        {
          uint64_t v4 = __UIFaultDebugAssertLog();
          if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_fault_impl(&dword_1853B0000, v4, OS_LOG_TYPE_FAULT, "trying to load collection view layout data when layout is locked", buf, 2u);
          }
        }
      }
      else if ((*(unsigned char *)(v1 + 96) & 0x10) != 0)
      {
        uint64_t v5 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &-[UICollectionViewData _validateContentSize]::__s_category)+ 8);
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)uint64_t v6 = 0;
          _os_log_impl(&dword_1853B0000, v5, OS_LOG_TYPE_ERROR, "trying to load collection view layout data when layout is locked", v6, 2u);
        }
      }
      result = [*(id *)(v1 + 16) collectionViewContentSize];
      *(void *)(v1 + 80) = v2;
      *(void *)(v1 + 88) = v3;
      *(unsigned char *)(v1 + 96) |= 1u;
    }
  }
  return result;
}

- (uint64_t)_shouldUseReorderingLayoutAttributesForItemAtIndexPath:(uint64_t)a1
{
  if (!a1 || (*(unsigned char *)(a1 + 96) & 0x10) != 0) {
    return 0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
  uint64_t v4 = [WeakRetained _isReorderingItemAtIndexPath:a2 includingDragAndDrop:0];

  return v4;
}

- (void)_setLayoutAttributes:(int64_t)a3 atGlobalItemIndex:
{
  if (a1 && a1[21] > a3)
  {
    if (a2)
    {
      -[_UICollectionViewDataAttributesMap pageInLayoutAttributes:forGlobalItemIndex:](a1[22], a2, a3);
      uint64_t v6 = (void *)[a2 copy];
      -[UICollectionViewData _setCachedLayoutAttributes:forGlobalItemIndex:]((uint64_t)a1, v6, a3);

      uint64_t v8 = (uint16x8_t *)a1[3];
      [(_UIMutableFastIndexSet *)v8 removeIndex:v7];
    }
    else
    {
      unint64_t v9 = a1 + 16;
      std::__hash_table<std::__hash_value_type<long,UICollectionViewLayoutAttributes * {__strong}>,std::__unordered_map_hasher<long,std::__hash_value_type<long,UICollectionViewLayoutAttributes * {__strong}>,std::hash<long>,std::equal_to<long>,true>,std::__unordered_map_equal<long,std::__hash_value_type<long,UICollectionViewLayoutAttributes * {__strong}>,std::equal_to<long>,std::hash<long>,true>,std::allocator<std::__hash_value_type<long,UICollectionViewLayoutAttributes * {__strong}>>>::__erase_unique<long>(v9, a3);
    }
  }
}

- (void)_setCachedLayoutAttributes:(unint64_t)a3 forGlobalItemIndex:
{
  unint64_t v4 = a3;
  uint64_t v5 = (void **)(a1 + 128);
  if (!obj)
  {
    char v10 = (void *)(a1 + 128);
    std::__hash_table<std::__hash_value_type<long,UICollectionViewLayoutAttributes * {__strong}>,std::__unordered_map_hasher<long,std::__hash_value_type<long,UICollectionViewLayoutAttributes * {__strong}>,std::hash<long>,std::equal_to<long>,true>,std::__unordered_map_equal<long,std::__hash_value_type<long,UICollectionViewLayoutAttributes * {__strong}>,std::equal_to<long>,std::hash<long>,true>,std::allocator<std::__hash_value_type<long,UICollectionViewLayoutAttributes * {__strong}>>>::__erase_unique<long>(v10, a3);
    return;
  }
  unint64_t v8 = *(void *)(a1 + 136);
  if (v8)
  {
    uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)v8);
    v9.i16[0] = vaddlv_u8(v9);
    if (v9.u32[0] > 1uLL)
    {
      unint64_t v3 = a3;
      if (v8 <= a3) {
        unint64_t v3 = a3 % v8;
      }
    }
    else
    {
      unint64_t v3 = (v8 - 1) & a3;
    }
    char v11 = (void **)*((void *)*v5 + v3);
    if (v11)
    {
      for (i = *v11; i; i = *(void **)i)
      {
        unint64_t v13 = *((void *)i + 1);
        if (v13 == a3)
        {
          if (*((void *)i + 2) == a3) {
            goto LABEL_78;
          }
        }
        else
        {
          if (v9.u32[0] > 1uLL)
          {
            if (v13 >= v8) {
              v13 %= v8;
            }
          }
          else
          {
            v13 &= v8 - 1;
          }
          if (v13 != v3) {
            break;
          }
        }
      }
    }
  }
  v14 = (void *)(a1 + 144);
  i = operator new(0x20uLL);
  *(void *)i = 0;
  *((void *)i + 1) = v4;
  *((void *)i + 2) = v4;
  *((void *)i + 3) = 0;
  float v15 = (float)(unint64_t)(*(void *)(a1 + 152) + 1);
  float v16 = *(float *)(a1 + 160);
  if (v8 && (float)(v16 * (float)v8) >= v15)
  {
    unint64_t v4 = v3;
    goto LABEL_68;
  }
  BOOL v17 = 1;
  if (v8 >= 3) {
    BOOL v17 = (v8 & (v8 - 1)) != 0;
  }
  unint64_t v18 = v17 | (2 * v8);
  unint64_t v19 = vcvtps_u32_f32(v15 / v16);
  if (v18 <= v19) {
    int8x8_t prime = (int8x8_t)v19;
  }
  else {
    int8x8_t prime = (int8x8_t)v18;
  }
  if (*(void *)&prime == 1)
  {
    int8x8_t prime = (int8x8_t)2;
  }
  else if ((*(void *)&prime & (*(void *)&prime - 1)) != 0)
  {
    int8x8_t prime = (int8x8_t)std::__next_prime(*(void *)&prime);
    unint64_t v8 = *(void *)(a1 + 136);
  }
  if (*(void *)&prime <= v8)
  {
    if (*(void *)&prime >= v8) {
      goto LABEL_64;
    }
    unint64_t v27 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 152) / *(float *)(a1 + 160));
    if (v8 < 3 || (uint8x8_t v28 = (uint8x8_t)vcnt_s8((int8x8_t)v8), v28.i16[0] = vaddlv_u8(v28), v28.u32[0] > 1uLL))
    {
      unint64_t v27 = std::__next_prime(v27);
    }
    else
    {
      uint64_t v29 = 1 << -(char)__clz(v27 - 1);
      if (v27 >= 2) {
        unint64_t v27 = v29;
      }
    }
    if (*(void *)&prime <= v27) {
      int8x8_t prime = (int8x8_t)v27;
    }
    if (*(void *)&prime >= v8)
    {
      unint64_t v8 = *(void *)(a1 + 136);
      goto LABEL_64;
    }
    if (!*(void *)&prime)
    {
      v35 = *v5;
      *uint64_t v5 = 0;
      if (v35) {
        operator delete(v35);
      }
      unint64_t v8 = 0;
      *(void *)(a1 + 136) = 0;
      goto LABEL_64;
    }
  }
  if (*(void *)&prime >> 61) {
    std::__throw_bad_array_new_length[abi:nn180100]();
  }
  v21 = operator new(8 * *(void *)&prime);
  v22 = *v5;
  *uint64_t v5 = v21;
  if (v22) {
    operator delete(v22);
  }
  uint64_t v23 = 0;
  *(int8x8_t *)(a1 + 136) = prime;
  do
    *((void *)*v5 + v23++) = 0;
  while (*(void *)&prime != v23);
  v24 = (void *)*v14;
  if (*v14)
  {
    unint64_t v25 = v24[1];
    uint8x8_t v26 = (uint8x8_t)vcnt_s8(prime);
    v26.i16[0] = vaddlv_u8(v26);
    if (v26.u32[0] > 1uLL)
    {
      if (v25 >= *(void *)&prime) {
        v25 %= *(void *)&prime;
      }
    }
    else
    {
      v25 &= *(void *)&prime - 1;
    }
    *((void *)*v5 + v25) = v14;
    v30 = (void *)*v24;
    if (*v24)
    {
      do
      {
        unint64_t v31 = v30[1];
        if (v26.u32[0] > 1uLL)
        {
          if (v31 >= *(void *)&prime) {
            v31 %= *(void *)&prime;
          }
        }
        else
        {
          v31 &= *(void *)&prime - 1;
        }
        if (v31 != v25)
        {
          if (!*((void *)*v5 + v31))
          {
            *((void *)*v5 + v31) = v24;
            goto LABEL_60;
          }
          void *v24 = *v30;
          void *v30 = **((void **)*v5 + v31);
          **((void **)*v5 + v31) = v30;
          v30 = v24;
        }
        unint64_t v31 = v25;
LABEL_60:
        v24 = v30;
        v30 = (void *)*v30;
        unint64_t v25 = v31;
      }
      while (v30);
    }
  }
  unint64_t v8 = (unint64_t)prime;
LABEL_64:
  if ((v8 & (v8 - 1)) != 0)
  {
    if (v8 <= v4) {
      v4 %= v8;
    }
  }
  else
  {
    v4 &= v8 - 1;
  }
LABEL_68:
  v32 = *v5;
  v33 = (void *)*((void *)*v5 + v4);
  if (v33)
  {
    *(void *)i = *v33;
  }
  else
  {
    *(void *)i = *v14;
    void *v14 = i;
    v32[v4] = v14;
    if (!*(void *)i) {
      goto LABEL_77;
    }
    unint64_t v34 = *(void *)(*(void *)i + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v34 >= v8) {
        v34 %= v8;
      }
    }
    else
    {
      v34 &= v8 - 1;
    }
    v33 = (char *)*v5 + 8 * v34;
  }
  void *v33 = i;
LABEL_77:
  ++*(void *)(a1 + 152);
LABEL_78:
  objc_storeStrong((id *)i + 3, obj);
}

- (uint64_t)numberOfItemsBeforeSection:(uint64_t)result
{
  if (result)
  {
    unint64_t v3 = (void *)result;
    if ((*(unsigned char *)(result + 96) & 2) == 0) {
      -[UICollectionViewData _updateItemCounts](result);
    }
    uint64_t v4 = (uint64_t)(v3[14] - v3[13]) >> 3;
    if (v4 < a2)
    {
      char v10 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", sel_numberOfItemsBeforeSection_, v3, @"UICollectionViewData.mm", 511, @"request for number of items before section %ld when there are only %ld sections in the collection view", a2, v4);
    }
    uint64_t v5 = v3[8];
    if (v5 <= a2)
    {
      result = v3[9];
      uint64_t v6 = (int)v5;
    }
    else
    {
      result = 0;
      uint64_t v6 = 0;
    }
    uint64_t v7 = a2 - v6;
    if (a2 > v6)
    {
      unint64_t v8 = (uint64_t *)(v3[13] + 8 * v6);
      do
      {
        uint64_t v9 = *v8++;
        result += v9;
        --v7;
      }
      while (v7);
    }
    v3[8] = a2;
    v3[9] = result;
  }
  return result;
}

uint64_t __93__UICollectionViewData__layoutAttributesFromMapForElementsInRect_cellsOnly_validateIfNeeded___block_invoke_5(uint64_t a1, uint64_t a2, void *a3)
{
  CGFloat v5 = *(double *)(a1 + 40);
  CGFloat v6 = *(double *)(a1 + 48);
  CGFloat v7 = *(double *)(a1 + 56);
  CGFloat v8 = *(double *)(a1 + 64);
  [a3 frame];
  v17.origin.x = v9;
  v17.origin.y = v10;
  v17.size.width = v11;
  v17.size.height = v12;
  v16.origin.x = v5;
  v16.origin.y = v6;
  v16.size.width = v7;
  v16.size.height = v8;
  uint64_t result = CGRectIntersectsRect(v16, v17);
  if ((result & 1) != 0 || *(unsigned char *)(a1 + 72))
  {
    v14 = *(void **)(a1 + 32);
    return [v14 addObject:a3];
  }
  return result;
}

- (id)layoutAttributesForDecorationViewOfKind:(void *)a3 atIndexPath:
{
  if (a1)
  {
    uint64_t v6 = *(void *)(a1 + 112) - *(void *)(a1 + 104);
    uint64_t v7 = [a3 section];
    if (v7 >= v6 >> 3)
    {
      uint64_t v8 = v7;
      if ([a3 item] != 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v12 = v6 >> 3;
        unint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
        [v13 handleFailureInMethod:sel_layoutAttributesForDecorationViewOfKind_atIndexPath_, a1, @"UICollectionViewData.mm", 1006, @"request for layout attributes for decoration view of kind \"%@\" in section %ld when there are only %ld sections in the collection view", a2, v8, v12 object file lineNumber description];
      }
    }
    id v9 = [*(id *)(a1 + 40) objectForKey:a2];
    CGFloat v10 = [v9 objectForKey:a3];
    if (!v10)
    {
      if ((*(unsigned char *)(a1 + 96) & 0x10) != 0)
      {
        CGFloat v10 = 0;
      }
      else
      {
        CGFloat v10 = [*(id *)(a1 + 16) layoutAttributesForDecorationViewOfKind:a2 atIndexPath:a3];
        if (v10)
        {
          if (!v9)
          {
            id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
            objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:");
          }
          [v9 setObject:v10 forKey:a3];
        }
      }
    }
  }
  else
  {
    CGFloat v10 = 0;
  }
  return v10;
}

- (id)existingSupplementaryLayoutAttributesInSection:(uint64_t)a1
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    uint64_t v25 = a1;
    obuint64_t j = [*(id *)(a1 + 32) objectEnumerator];
    uint64_t v5 = [obj countByEnumeratingWithState:&v42 objects:v49 count:16];
    if (v5)
    {
      uint64_t v28 = *(void *)v43;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v43 != v28) {
            objc_enumerationMutation(obj);
          }
          uint64_t v7 = *(void **)(*((void *)&v42 + 1) + 8 * i);
          long long v38 = 0u;
          long long v39 = 0u;
          long long v40 = 0u;
          long long v41 = 0u;
          uint64_t v8 = [v7 objectEnumerator];
          uint64_t v9 = [v8 countByEnumeratingWithState:&v38 objects:v48 count:16];
          if (v9)
          {
            uint64_t v10 = *(void *)v39;
            do
            {
              for (uint64_t j = 0; j != v9; ++j)
              {
                if (*(void *)v39 != v10) {
                  objc_enumerationMutation(v8);
                }
                uint64_t v12 = *(void **)(*((void *)&v38 + 1) + 8 * j);
                unint64_t v13 = [v12 indexPath];
                if ([v13 section] == a2 && (unint64_t)objc_msgSend(v13, "length") >= 2) {
                  [v4 addObject:v12];
                }
              }
              uint64_t v9 = [v8 countByEnumeratingWithState:&v38 objects:v48 count:16];
            }
            while (v9);
          }
        }
        uint64_t v5 = [obj countByEnumeratingWithState:&v42 objects:v49 count:16];
      }
      while (v5);
    }

    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    v14 = [*(id *)(v25 + 40) objectEnumerator];
    id obja = v14;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v34 objects:v47 count:16];
    if (v15)
    {
      uint64_t v29 = *(void *)v35;
      do
      {
        for (uint64_t k = 0; k != v15; ++k)
        {
          if (*(void *)v35 != v29) {
            objc_enumerationMutation(obja);
          }
          CGRect v17 = *(void **)(*((void *)&v34 + 1) + 8 * k);
          long long v30 = 0u;
          long long v31 = 0u;
          long long v32 = 0u;
          long long v33 = 0u;
          unint64_t v18 = [v17 objectEnumerator];
          uint64_t v19 = [v18 countByEnumeratingWithState:&v30 objects:v46 count:16];
          if (v19)
          {
            uint64_t v20 = *(void *)v31;
            do
            {
              for (uint64_t m = 0; m != v19; ++m)
              {
                if (*(void *)v31 != v20) {
                  objc_enumerationMutation(v18);
                }
                v22 = *(void **)(*((void *)&v30 + 1) + 8 * m);
                uint64_t v23 = [v22 indexPath];
                if ([v23 section] == a2 && (unint64_t)objc_msgSend(v23, "length") >= 2) {
                  [v4 addObject:v22];
                }
              }
              uint64_t v19 = [v18 countByEnumeratingWithState:&v30 objects:v46 count:16];
            }
            while (v19);
          }
        }
        v14 = obja;
        uint64_t v15 = [obja countByEnumeratingWithState:&v34 objects:v47 count:16];
      }
      while (v15);
    }
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (_BYTE)indexPathForItemAtGlobalIndex:(unsigned char *)a1
{
  if (a1)
  {
    uint64_t v3 = (uint64_t)a1;
    if ((a1[96] & 2) == 0) {
      -[UICollectionViewData _updateItemCounts]((uint64_t)a1);
    }
    uint64_t v4 = *(void *)(v3 + 104);
    uint64_t v5 = *(void *)(v3 + 112) - v4;
    if (v5 < 1)
    {
LABEL_10:
      uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
      if ((*(unsigned char *)(v3 + 96) & 2) == 0) {
        -[UICollectionViewData _updateItemCounts](v3);
      }
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", sel_indexPathForItemAtGlobalIndex_, v3, @"UICollectionViewData.mm", 609, @"request for index path for global index %ld when there are only %ld items in the collection view", a2, *(void *)(v3 + 168));

      a1 = 0;
    }
    else
    {
      uint64_t v6 = 0;
      uint64_t v7 = (unint64_t)v5 >> 3;
      if (v7 <= 1) {
        uint64_t v7 = 1;
      }
      uint64_t v8 = a2;
      while (1)
      {
        uint64_t v9 = *(void *)(v4 + 8 * v6);
        BOOL v10 = __OFSUB__(v8, v9);
        uint64_t v11 = v8 - v9;
        if (v11 < 0 != v10) {
          break;
        }
        ++v6;
        uint64_t v8 = v11;
        if (v7 == v6) {
          goto LABEL_10;
        }
      }
      objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForRow:inSection:");
      a1 = (unsigned char *)objc_claimAutoreleasedReturnValue();
    }
  }
  return a1;
}

- (void)_attributesMapDidPageInAttributes:(unint64_t)a3 globalItemIndex:(int8x16_t)a4
{
  if (!a1) {
    return;
  }
  if (!a2)
  {
    id v7 = (id)[0 indexPath];
    uint64_t v8 = 32;
LABEL_6:
    id v15 = *(id *)(a1 + v8);
    uint64_t v9 = -[UIBarButtonItemGroup _items]((id *)a2);
    BOOL v10 = v15;
    if (!v9)
    {
      v14 = [MEMORY[0x1E4F28B00] currentHandler];
      [v14 handleFailureInMethod:sel__attributesMapDidPageInAttributes_globalItemIndex_, a1, @"UICollectionViewData.mm", 115, @"%@ elementKind is nil. This probably means you created the UICollectionViewLayoutAttributes using +alloc/-init instead of one of the class constructors", a2 object file lineNumber description];

      BOOL v10 = v15;
    }
    uint64_t v11 = [v10 objectForKey:v9];
    uint64_t v12 = [v11 objectForKey:v7];
    if (!v12)
    {
      if (v11)
      {
        [v11 setObject:a2 forKey:v7];
      }
      else
      {
        uint64_t v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithObjectsAndKeys:", a2, v7, 0);
        [v15 setObject:v11 forKey:v9];
      }
    }

    return;
  }
  __int16 v6 = *(_WORD *)(a2 + 288);
  if ((v6 & 1) == 0)
  {
    id v7 = (id)[(id)a2 indexPath];
    uint64_t v8 = 40;
    if ((v6 & 2) == 0) {
      uint64_t v8 = 32;
    }
    goto LABEL_6;
  }
  [(_UIMutableFastIndexSet *)*(uint16x8_t **)(a1 + 24) removeIndex:a4];
  -[UICollectionViewData _setCachedLayoutAttributes:forGlobalItemIndex:](a1, (id)a2, a3);
}

- (double)collectionViewContentRect
{
  if (!a1) {
    return 0.0;
  }
  -[UICollectionViewData _prepareToLoadData](a1);
  return *MEMORY[0x1E4F1DAD8];
}

- (id)_layoutAttributesForElementsInRectForMapping:(double)a3
{
  if (a1)
  {
    BOOL v10 = a1;
    if (os_variant_has_internal_diagnostics())
    {
      if ((*((unsigned char *)v10 + 96) & 0x10) != 0)
      {
        uint64_t v12 = __UIFaultDebugAssertLog();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_1853B0000, v12, OS_LOG_TYPE_FAULT, "trying to load collection view layout data when layout is locked", buf, 2u);
        }
      }
    }
    else if ((*((unsigned char *)v10 + 96) & 0x10) != 0)
    {
      unint64_t v13 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &-[UICollectionViewData _layoutAttributesForElementsInRectForMapping:]::__s_category)+ 8);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v14 = 0;
        _os_log_impl(&dword_1853B0000, v13, OS_LOG_TYPE_ERROR, "trying to load collection view layout data when layout is locked", v14, 2u);
      }
    }
    a1 = objc_msgSend(*((id *)v10 + 2), "layoutAttributesForElementsInRect:", a2, a3, a4, a5);
    uint64_t v5 = vars8;
  }
  return a1;
}

- (id).cxx_construct
{
  *((void *)self + 19) = 0;
  *(_OWORD *)((char *)self + 136) = 0u;
  *(_OWORD *)((char *)self + 120) = 0u;
  *(_OWORD *)((char *)self + 104) = 0u;
  *((_DWORD *)self + 40) = 1065353216;
  return self;
}

- (uint64_t)globalIndexForItemAtIndexPath:(uint64_t)result
{
  if (result)
  {
    uint64_t v2 = result;
    uint64_t v4 = 0;
    uint64_t v5 = 0;
    objc_msgSend(a2, "ui_getSectionIndex:itemIndex:", &v5, &v4);
    uint64_t v3 = -[UICollectionViewData numberOfItemsBeforeSection:](v2, v5);
    return v4 + v3;
  }
  return result;
}

- (uint64_t)numberOfSections
{
  if (result)
  {
    uint64_t v1 = result;
    if ((*(unsigned char *)(result + 96) & 2) == 0) {
      -[UICollectionViewData _updateItemCounts](result);
    }
    return (uint64_t)(*(void *)(v1 + 112) - *(void *)(v1 + 104)) >> 3;
  }
  return result;
}

- (uint64_t)numberOfItemsInSection:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    if ((*(unsigned char *)(result + 96) & 2) == 0) {
      -[UICollectionViewData _updateItemCounts](result);
    }
    return -[UICollectionViewData _existingNumberOfItemsInSection:](v3, a2);
  }
  return result;
}

- (uint64_t)_existingNumberOfItemsInSection:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    uint64_t v4 = *(void *)(result + 104);
    uint64_t v5 = (*(void *)(result + 112) - v4) >> 3;
    if (v5 <= a2)
    {
      __int16 v6 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", sel__existingNumberOfItemsInSection_, v3, @"UICollectionViewData.mm", 497, @"request for number of items in section %ld when there are only %ld sections in the collection view", a2, v5);

      uint64_t v4 = *(void *)(v3 + 104);
    }
    return *(void *)(v4 + 8 * a2);
  }
  return result;
}

- (uint64_t)initWithCollectionView:(void *)a3 layout:
{
  if (!a1) {
    return 0;
  }
  v14.receiver = a1;
  v14.super_class = (Class)UICollectionViewData;
  uint64_t v5 = (id *)objc_msgSendSuper2(&v14, sel_init);
  uint64_t v6 = (uint64_t)v5;
  if (v5)
  {
    objc_storeWeak(v5 + 1, a2);
    objc_storeStrong((id *)(v6 + 16), a3);
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v8 = *(void **)(v6 + 32);
    *(void *)(v6 + 32) = v7;

    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    BOOL v10 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v9;

    *(void *)(v6 + 64) = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v11 = -[_UICollectionViewDataAttributesMap initWithCollectionViewData:]([_UICollectionViewDataAttributesMap alloc], v6);
    uint64_t v12 = *(void **)(v6 + 176);
    *(void *)(v6 + 176) = v11;
  }
  return v6;
}

- (uint64_t)validateLayoutInRectImmediatelyValidatingContentSizeIgnoringSpecificInvalidations:(CGFloat)a3
{
  if (result)
  {
    uint64_t v9 = result;
    BOOL v10 = *(void **)(result + 24);
    *(void *)(result + 24) = 0;

    uint64_t v11 = *(void **)(v9 + 48);
    *(void *)(v9 + 48) = 0;

    uint64_t v12 = *(void **)(v9 + 56);
    *(void *)(v9 + 56) = 0;

    -[UICollectionViewData validateLayoutInRect:](v9, a2, a3, a4, a5);
    return -[UICollectionViewData _validateContentSize](v9);
  }
  return result;
}

- (void)invalidate:(uint64_t)a1
{
  if (a1 && (*(unsigned char *)(a1 + 96) & 0x10) == 0)
  {
    if ((a2 & 1) == 0) {
      *(unsigned char *)(a1 + 96) &= ~2u;
    }
    -[_UICollectionViewDataAttributesMap invalidate](*(void *)(a1 + 176));
    *(unsigned char *)(a1 + 96) &= 0xF6u;
    [*(id *)(a1 + 32) removeAllObjects];
    [*(id *)(a1 + 40) removeAllObjects];
    uint64_t v3 = *(void **)(a1 + 24);
    *(void *)(a1 + 24) = 0;

    uint64_t v4 = *(void **)(a1 + 48);
    *(void *)(a1 + 48) = 0;

    uint64_t v5 = *(void **)(a1 + 56);
    *(void *)(a1 + 56) = 0;

    std::__hash_table<std::__hash_value_type<long,UICollectionViewLayoutAttributes * {__strong}>,std::__unordered_map_hasher<long,std::__hash_value_type<long,UICollectionViewLayoutAttributes * {__strong}>,std::hash<long>,std::equal_to<long>,true>,std::__unordered_map_equal<long,std::__hash_value_type<long,UICollectionViewLayoutAttributes * {__strong}>,std::equal_to<long>,std::hash<long>,true>,std::allocator<std::__hash_value_type<long,UICollectionViewLayoutAttributes * {__strong}>>>::clear(a1 + 128);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clonedDecorationAttributes, 0);
  objc_storeStrong((id *)&self->_clonedSupplementaryAttributes, 0);
  objc_storeStrong((id *)&self->_clonedCellAttributes, 0);
  objc_storeStrong((id *)&self->_attributesMap, 0);
  std::__hash_table<std::__hash_value_type<long,UICollectionViewLayoutAttributes * {__strong}>,std::__unordered_map_hasher<long,std::__hash_value_type<long,UICollectionViewLayoutAttributes * {__strong}>,std::hash<long>,std::equal_to<long>,true>,std::__unordered_map_equal<long,std::__hash_value_type<long,UICollectionViewLayoutAttributes * {__strong}>,std::equal_to<long>,std::hash<long>,true>,std::allocator<std::__hash_value_type<long,UICollectionViewLayoutAttributes * {__strong}>>>::__deallocate_node((uint64_t)&self->_globalItemMap, (id *)self->_globalItemMap.__table_.__p1_.__value_.__next_);
  value = self->_globalItemMap.__table_.__bucket_list_.__ptr_.__value_;
  self->_globalItemMap.__table_.__bucket_list_.__ptr_.__value_ = 0;
  if (value) {
    operator delete(value);
  }
  begin = self->_sectionItemCounts.__begin_;
  if (begin)
  {
    self->_sectionItemCounts.__end_ = begin;
    operator delete(begin);
  }
  objc_storeStrong((id *)&self->_invalidatedDecorationIndexPaths, 0);
  objc_storeStrong((id *)&self->_invalidatedSupplementaryIndexPaths, 0);
  objc_storeStrong((id *)&self->_decorationLayoutAttributes, 0);
  objc_storeStrong((id *)&self->_supplementaryLayoutAttributes, 0);
  objc_storeStrong((id *)&self->_globalIndexesOfItemsAwaitingValidation, 0);
  objc_storeStrong((id *)&self->_layout, 0);
  objc_destroyWeak((id *)&self->_collectionView);
}

- (uint64_t)invalidateDecorationIndexPaths:(uint64_t)result
{
  if (result)
  {
    uint64_t v2 = result;
    if ((*(unsigned char *)(result + 96) & 0x10) == 0)
    {
      uint64_t result = [a2 count];
      if (result)
      {
        if (!*(void *)(v2 + 56))
        {
          id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
          uint64_t v5 = *(void **)(v2 + 56);
          *(void *)(v2 + 56) = v4;
        }
        v6[0] = MEMORY[0x1E4F143A8];
        v6[1] = 3221225472;
        v6[2] = __55__UICollectionViewData_invalidateDecorationIndexPaths___block_invoke;
        v6[3] = &unk_1E52E6030;
        v6[4] = v2;
        return [a2 enumerateKeysAndObjectsUsingBlock:v6];
      }
    }
  }
  return result;
}

void __93__UICollectionViewData__layoutAttributesFromMapForElementsInRect_cellsOnly_validateIfNeeded___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __93__UICollectionViewData__layoutAttributesFromMapForElementsInRect_cellsOnly_validateIfNeeded___block_invoke_5;
  v4[3] = &unk_1E52E60D0;
  long long v6 = *(_OWORD *)(a1 + 40);
  long long v7 = *(_OWORD *)(a1 + 56);
  char v8 = *(unsigned char *)(a1 + 72);
  id v5 = *(id *)(a1 + 32);
  [a3 enumerateKeysAndObjectsUsingBlock:v4];
}

- (void)_updateItemCounts
{
  if (a1)
  {
    std::__hash_table<std::__hash_value_type<long,UICollectionViewLayoutAttributes * {__strong}>,std::__unordered_map_hasher<long,std::__hash_value_type<long,UICollectionViewLayoutAttributes * {__strong}>,std::hash<long>,std::equal_to<long>,true>,std::__unordered_map_equal<long,std::__hash_value_type<long,UICollectionViewLayoutAttributes * {__strong}>,std::equal_to<long>,std::hash<long>,true>,std::allocator<std::__hash_value_type<long,UICollectionViewLayoutAttributes * {__strong}>>>::clear(a1 + 128);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    id v24 = [WeakRetained _dataSourceProxy];

    id v3 = objc_loadWeakRetained((id *)(a1 + 8));
    if ([v3 _dataSourceImplementsNumberOfSections])
    {
      id v4 = objc_loadWeakRetained((id *)(a1 + 8));
      uint64_t v5 = [v24 numberOfSectionsInCollectionView:v4];

      unint64_t v6 = v5 & ~(v5 >> 63);
    }
    else
    {
      unint64_t v6 = 1;
    }

    long long v7 = (void **)(a1 + 104);
    *(void *)(a1 + 112) = *(void *)(a1 + 104);
    std::vector<long>::reserve((void **)(a1 + 104), v6);
    if (v6)
    {
      uint64_t v8 = 0;
      uint64_t v9 = 0;
      do
      {
        id v10 = objc_loadWeakRetained((id *)(a1 + 8));
        uint64_t v11 = [v24 collectionView:v10 numberOfItemsInSection:v8];

        uint64_t v12 = v11 & ~(v11 >> 63);
        objc_super v14 = *(uint64_t **)(a1 + 112);
        unint64_t v13 = *(void *)(a1 + 120);
        if ((unint64_t)v14 >= v13)
        {
          CGRect v16 = (uint64_t *)*v7;
          uint64_t v17 = ((char *)v14 - (unsigned char *)*v7) >> 3;
          unint64_t v18 = v17 + 1;
          if ((unint64_t)(v17 + 1) >> 61) {
            abort();
          }
          uint64_t v19 = v13 - (void)v16;
          if (v19 >> 2 > v18) {
            unint64_t v18 = v19 >> 2;
          }
          if ((unint64_t)v19 >= 0x7FFFFFFFFFFFFFF8) {
            unint64_t v20 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v20 = v18;
          }
          if (v20)
          {
            v21 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned long>>(a1 + 120, v20);
            CGRect v16 = *(uint64_t **)(a1 + 104);
            objc_super v14 = *(uint64_t **)(a1 + 112);
          }
          else
          {
            v21 = 0;
          }
          v22 = (uint64_t *)&v21[8 * v17];
          uint64_t *v22 = v12;
          id v15 = v22 + 1;
          while (v14 != v16)
          {
            uint64_t v23 = *--v14;
            *--v22 = v23;
          }
          *(void *)(a1 + 104) = v22;
          *(void *)(a1 + 112) = v15;
          *(void *)(a1 + 120) = &v21[8 * v20];
          if (v16) {
            operator delete(v16);
          }
        }
        else
        {
          uint64_t *v14 = v12;
          id v15 = v14 + 1;
        }
        *(void *)(a1 + 112) = v15;
        v9 += v12;
        ++v8;
      }
      while (v8 != v6);
    }
    else
    {
      uint64_t v9 = 0;
    }
    *(void *)(a1 + 168) = v9;
    *(unsigned char *)(a1 + 96) |= 2u;
    *(void *)(a1 + 64) = 0x7FFFFFFFFFFFFFFFLL;
  }
}

uint64_t __93__UICollectionViewData__layoutAttributesFromMapForElementsInRect_cellsOnly_validateIfNeeded___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  CGFloat v5 = *(double *)(a1 + 40);
  CGFloat v6 = *(double *)(a1 + 48);
  CGFloat v7 = *(double *)(a1 + 56);
  CGFloat v8 = *(double *)(a1 + 64);
  [a3 frame];
  v17.origin.x = v9;
  v17.origin.y = v10;
  v17.size.width = v11;
  v17.size.height = v12;
  v16.origin.x = v5;
  v16.origin.y = v6;
  v16.size.width = v7;
  v16.size.height = v8;
  uint64_t result = CGRectIntersectsRect(v16, v17);
  if ((result & 1) != 0 || *(unsigned char *)(a1 + 72))
  {
    objc_super v14 = *(void **)(a1 + 32);
    return [v14 addObject:a3];
  }
  return result;
}

- (id)layoutAttributesForGlobalItemIndex:(unsigned char *)a1
{
  id v2 = a1;
  if (a1)
  {
    id v3 = -[UICollectionViewData indexPathForItemAtGlobalIndex:](a1, a2);
    -[UICollectionViewData layoutAttributesForItemAtIndexPath:]((uint64_t)v2, v3);
    id v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (id)layoutAttributesForElementsInRect:(double)a3
{
  if (a1)
  {
    a1 = -[UICollectionViewData _layoutAttributesForElementsInRect:cellsOnly:validateIfNeeded:includeIndelibleElements:]((uint64_t)a1, 0, 1, 1, a2, a3, a4, a5);
    uint64_t v5 = vars8;
  }
  return a1;
}

- (id)_layoutAttributesForElementsInRect:(int)a3 cellsOnly:(int)a4 validateIfNeeded:(double)a5 includeIndelibleElements:(double)a6
{
  uint64_t v85 = *MEMORY[0x1E4F143B8];
  if (!a1 || (height = a8, double v12 = a7, y = a6, x = a5, !UIRectIsDiscrete(a5, a6, a7, a8)))
  {
    id v17 = 0;
    goto LABEL_50;
  }
  if ([*(id *)(a1 + 16) _hasOrthogonalScrollingSections])
  {
    objc_msgSend(*(id *)(a1 + 16), "_extendedAttributesQueryIncludingOrthogonalScrollingRegions:", x, y, v12, height);
    id v16 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (_UICollectionViewShouldEnlargeLayoutAttributesQueryForEstimatedSizes()
      && [*(id *)(a1 + 16) _estimatesSizes])
    {
      v87.origin.double x = x;
      v87.origin.double y = y;
      v87.size.width = v12;
      v87.size.double height = height;
      double Width = CGRectGetWidth(v87);
      v88.origin.double x = x;
      v88.origin.double y = y;
      v88.size.width = v12;
      v88.size.double height = height;
      CGFloat v19 = CGRectGetHeight(v88) * -0.1;
      v89.origin.double x = x;
      v89.origin.double y = y;
      v89.size.width = v12;
      v89.size.double height = height;
      CGRect v90 = CGRectInset(v89, Width * -0.1, v19);
      double x = v90.origin.x;
      double y = v90.origin.y;
      double v12 = v90.size.width;
      double height = v90.size.height;
    }
    if (a3) {
      -[UICollectionViewData validateLayoutInRect:](a1, x, y, v12, height);
    }
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    -[UICollectionViewData _prepareToLoadData](a1);
    v92.origin.double x = *(CGFloat *)MEMORY[0x1E4F1DAD8];
    v92.origin.double y = *(CGFloat *)(MEMORY[0x1E4F1DAD8] + 8);
    v92.size.width = *(CGFloat *)(a1 + 80);
    v92.size.double height = *(CGFloat *)(a1 + 88);
    v91.origin.double x = x;
    v91.origin.double y = y;
    v91.size.width = v12;
    v91.size.double height = height;
    if (CGRectContainsRect(v91, v92)) {
      +[_UIFastIndexSet indexSetWithIndexesInRange:*(void *)(a1 + 168)];
    }
    else {
      -[_UICollectionViewDataAttributesMap indexesOfItemsInRect:](*(void **)(a1 + 176), x, y, v12, height);
    }
    v21 = (int8x16_t *)objc_claimAutoreleasedReturnValue();
    v22 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:-[_UIFastIndexSet count](v21)];
    char v23 = isKindOfClass & 1;
    uint64_t v24 = *(void *)(a1 + 168);
    v71 = (void (*)(void, void, void))MEMORY[0x1E4F143A8];
    uint64_t v72 = 3221225472;
    uint64_t v73 = (uint64_t)__93__UICollectionViewData__layoutAttributesFromMapForElementsInRect_cellsOnly_validateIfNeeded___block_invoke;
    v74 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E52E60A8;
    uint64_t v77 = v24;
    v78 = sel__layoutAttributesFromMapForElementsInRect_cellsOnly_validateIfNeeded_;
    v75 = (void (*)(uint64_t))a1;
    double v79 = x;
    double v80 = y;
    double v81 = v12;
    double v82 = height;
    char v83 = isKindOfClass & 1;
    id v16 = v22;
    id v76 = v16;
    -[_UIFastIndexSet enumerateIndexesUsingBlock:]((uint64_t)v21, &v71);
    if (a2)
    {
      id v25 = v16;
    }
    else
    {
      uint8x8_t v26 = *(void **)(a1 + 32);
      uint64_t v61 = MEMORY[0x1E4F143A8];
      uint64_t v62 = 3221225472;
      uint64_t v63 = (uint64_t)__93__UICollectionViewData__layoutAttributesFromMapForElementsInRect_cellsOnly_validateIfNeeded___block_invoke_2;
      v64 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E52E60F8;
      double v66 = x;
      double v67 = y;
      double v68 = v12;
      double v69 = height;
      char v70 = isKindOfClass & 1;
      unint64_t v27 = (void (*)(uint64_t))v16;
      v65 = v27;
      [v26 enumerateKeysAndObjectsUsingBlock:&v61];
      uint64_t v28 = *(void **)(a1 + 40);
      v54[0] = MEMORY[0x1E4F143A8];
      v54[1] = 3221225472;
      v54[2] = __93__UICollectionViewData__layoutAttributesFromMapForElementsInRect_cellsOnly_validateIfNeeded___block_invoke_4;
      v54[3] = &unk_1E52E60F8;
      double v56 = x;
      double v57 = y;
      double v58 = v12;
      double v59 = height;
      char v60 = v23;
      uint64_t v29 = v27;
      v55 = v29;
      [v28 enumerateKeysAndObjectsUsingBlock:v54];
      if ((dyld_program_sdk_at_least() & 1) == 0) {
        [v29 sortUsingComparator:&__block_literal_global_114];
      }
      long long v30 = v29;
    }
  }
  if ([v16 count])
  {
    v71 = 0;
    uint64_t v72 = (uint64_t)&v71;
    uint64_t v73 = 0x3032000000;
    v74 = __Block_byref_object_copy__42;
    v75 = __Block_byref_object_dispose__42;
    id v76 = 0;
    if (a4)
    {
      long long v31 = [*(id *)(a1 + 16) _layoutAttributesForIndelibleElements];
      long long v32 = v31;
      if (v31 && [v31 count])
      {
        if (!*(void *)(v72 + 40))
        {
          uint64_t v33 = [v16 mutableCopy];
          long long v34 = *(void **)(v72 + 40);
          *(void *)(v72 + 40) = v33;

          id v35 = *(id *)(v72 + 40);
          id v16 = v35;
        }
        long long v52 = 0u;
        long long v53 = 0u;
        long long v50 = 0u;
        long long v51 = 0u;
        id v36 = v32;
        uint64_t v37 = [v36 countByEnumeratingWithState:&v50 objects:v84 count:16];
        if (v37)
        {
          uint64_t v38 = *(void *)v51;
          do
          {
            for (uint64_t i = 0; i != v37; ++i)
            {
              if (*(void *)v51 != v38) {
                objc_enumerationMutation(v36);
              }
              uint64_t v40 = *(void *)(*((void *)&v50 + 1) + 8 * i);
              if (([*(id *)(v72 + 40) containsObject:v40] & 1) == 0) {
                [*(id *)(v72 + 40) addObject:v40];
              }
            }
            uint64_t v37 = [v36 countByEnumeratingWithState:&v50 objects:v84 count:16];
          }
          while (v37);
        }
      }
    }
    if ((*(unsigned char *)(a1 + 96) & 0x10) != 0)
    {
      int v42 = 0;
      if (a2) {
        goto LABEL_43;
      }
    }
    else
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
      int v42 = [WeakRetained _isReordering];

      if (a2) {
        goto LABEL_43;
      }
    }
    if (!v42)
    {
LABEL_48:
      id v17 = v16;
      _Block_object_dispose(&v71, 8);

      goto LABEL_49;
    }
LABEL_43:
    if (!*(void *)(v72 + 40))
    {
      uint64_t v43 = [v16 mutableCopy];
      long long v44 = *(void **)(v72 + 40);
      *(void *)(v72 + 40) = v43;

      id v45 = *(id *)(v72 + 40);
      id v16 = v45;
    }
    uint64_t v61 = 0;
    uint64_t v62 = (uint64_t)&v61;
    uint64_t v63 = 0x3032000000;
    v64 = __Block_byref_object_copy__42;
    v65 = __Block_byref_object_dispose__42;
    double v66 = 0.0;
    v47[0] = MEMORY[0x1E4F143A8];
    v47[1] = 3221225472;
    v47[2] = __111__UICollectionViewData__layoutAttributesForElementsInRect_cellsOnly_validateIfNeeded_includeIndelibleElements___block_invoke;
    v47[3] = &unk_1E52E6080;
    char v48 = v42;
    v47[4] = a1;
    v47[5] = &v71;
    char v49 = a2;
    v47[6] = &v61;
    [v16 enumerateObjectsUsingBlock:v47];
    if (*(void *)(v62 + 40)) {
      objc_msgSend(*(id *)(v72 + 40), "removeObjectsAtIndexes:");
    }
    _Block_object_dispose(&v61, 8);

    goto LABEL_48;
  }
  id v17 = v16;
LABEL_49:

LABEL_50:
  return v17;
}

- (void)validateLayoutInRect:(CGFloat)a3
{
  if (a1)
  {
    char v10 = *(unsigned char *)(a1 + 96);
    if ((v10 & 8) != 0)
    {
      if (-[_UIFastIndexSet count](*(int8x16_t **)(a1 + 24)) || *(void *)(a1 + 48)) {
        char v11 = 0;
      }
      else {
        char v11 = 8 * (*(void *)(a1 + 56) == 0);
      }
      *(unsigned char *)(a1 + 96) = v11 | v10 & 0xF7;
    }
    -[UICollectionViewData _prepareToLoadData](a1);
    if (*(void *)(a1 + 48)) {
      -[UICollectionViewData validateSupplementaryViews](a1);
    }
    if (*(void *)(a1 + 56)) {
      -[UICollectionViewData validateDecorationViews](a1);
    }
    uint64_t v12 = *(void *)(a1 + 176);
    if (v12) {
      -[_UICollectionViewDataAttributesMap _validateLayoutInRect:](v12, a2, a3, a4, a5);
    }
    if (-[_UIFastIndexSet count](*(int8x16_t **)(a1 + 24)))
    {
      -[UICollectionViewData validateItems](a1);
    }
  }
}

void __93__UICollectionViewData__layoutAttributesFromMapForElementsInRect_cellsOnly_validateIfNeeded___block_invoke(uint64_t a1, unint64_t a2)
{
  if (*(void *)(a1 + 48) <= a2)
  {
    id v13 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", *(void *)(a1 + 56), *(void *)(a1 + 32), @"UICollectionViewData.mm", 876, @"attempting to access layout attributes at invalid index %ld numItems: %ld", a2, *(void *)(a1 + 48));
  }
  -[UICollectionViewData _cachedLayoutAttributesForGlobalItemIndex:](*(void **)(a1 + 32), a2);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    CGFloat v4 = *(double *)(a1 + 64);
    CGFloat v5 = *(double *)(a1 + 72);
    CGFloat v6 = *(double *)(a1 + 80);
    CGFloat v7 = *(double *)(a1 + 88);
    [v12 frame];
    v16.origin.double x = v8;
    v16.origin.double y = v9;
    v16.size.width = v10;
    v16.size.double height = v11;
    v15.origin.double x = v4;
    v15.origin.double y = v5;
    v15.size.width = v6;
    v15.size.double height = v7;
    if (CGRectIntersectsRect(v15, v16) || *(unsigned char *)(a1 + 96)) {
      [*(id *)(a1 + 40) addObject:v12];
    }
  }
}

void __37__UICollectionViewData_validateItems__block_invoke(uint64_t a1, unint64_t a2)
{
  CGFloat v4 = -[UICollectionViewData _cachedLayoutAttributesForGlobalItemIndex:](*(void **)(a1 + 32), a2);

  if (!v4)
  {
    -[UICollectionViewData indexPathForItemAtGlobalIndex:](*(unsigned char **)(a1 + 32), a2);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    CGFloat v5 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "layoutAttributesForItemAtIndexPath:");
    -[UICollectionViewData _setLayoutAttributes:atGlobalItemIndex:](*(void **)(a1 + 32), v5, a2);
  }
}

- (void)validateSupplementaryViews
{
  if (a1)
  {
    if ((*(unsigned char *)(a1 + 96) & 0x10) == 0)
    {
      id v2 = *(id *)(a1 + 48);
      id v3 = *(void **)(a1 + 48);
      *(void *)(a1 + 48) = 0;

      v4[0] = MEMORY[0x1E4F143A8];
      v4[1] = 3221225472;
      v4[2] = __50__UICollectionViewData_validateSupplementaryViews__block_invoke;
      v4[3] = &unk_1E52E6058;
      void v4[4] = a1;
      [v2 enumerateKeysAndObjectsUsingBlock:v4];
    }
  }
}

- (void)validateDecorationViews
{
  if (a1)
  {
    if ((*(unsigned char *)(a1 + 96) & 0x10) == 0)
    {
      id v2 = *(id *)(a1 + 56);
      id v3 = *(void **)(a1 + 56);
      *(void *)(a1 + 56) = 0;

      v4[0] = MEMORY[0x1E4F143A8];
      v4[1] = 3221225472;
      v4[2] = __47__UICollectionViewData_validateDecorationViews__block_invoke;
      v4[3] = &unk_1E52E6058;
      void v4[4] = a1;
      [v2 enumerateKeysAndObjectsUsingBlock:v4];
    }
  }
}

- (uint64_t)finalizeCollectionViewUpdates
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v1 = result;
    unint64_t v2 = *(void *)(result + 152);
    unint64_t v3 = *(void *)(result + 184);
    if (v3 <= 0x64) {
      unint64_t v3 = 100;
    }
    if (v2 > v3 && v2 / v3 >= 2)
    {
      unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("UICollectionView", &-[UICollectionViewData finalizeCollectionViewUpdates]::__s_category);
      if (*(unsigned char *)CategoryCachedImpl)
      {
        unint64_t v10 = v2;
        CGFloat v5 = *(id *)(CategoryCachedImpl + 8);
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        {
          id WeakRetained = objc_loadWeakRetained((id *)(v1 + 8));
          uint64_t v7 = *(void *)(v1 + 184);
          id v8 = WeakRetained;
          [v8 _currentUpdate];
          *(_DWORD *)buf = 134218754;
          id v12 = v8;
          __int16 v13 = 2048;
          uint64_t v14 = v7;
          __int16 v15 = 2048;
          unint64_t v16 = v10;
          v18 = __int16 v17 = 2112;
          CGFloat v9 = (void *)v18;
          _os_log_impl(&dword_1853B0000, v5, OS_LOG_TYPE_ERROR, "finalizeCollectionViewUpdates: cv == %p; UICollectionViewData clearing caches for large update. Cache size c"
            "hanged from %lu to %lu. Update: %@",
            buf,
            0x2Au);
        }
      }
      -[_UICollectionViewDataAttributesMap invalidate](*(void *)(v1 + 176));
      std::__hash_table<std::__hash_value_type<long,UICollectionViewLayoutAttributes * {__strong}>,std::__unordered_map_hasher<long,std::__hash_value_type<long,UICollectionViewLayoutAttributes * {__strong}>,std::hash<long>,std::equal_to<long>,true>,std::__unordered_map_equal<long,std::__hash_value_type<long,UICollectionViewLayoutAttributes * {__strong}>,std::equal_to<long>,std::hash<long>,true>,std::allocator<std::__hash_value_type<long,UICollectionViewLayoutAttributes * {__strong}>>>::clear(v1 + 128);
      [*(id *)(v1 + 32) removeAllObjects];
      return [*(id *)(v1 + 40) removeAllObjects];
    }
  }
  return result;
}

- (id)layoutAttributesForSupplementaryElementOfKind:(void *)a3 atIndexPath:
{
  if (a1)
  {
    uint64_t v6 = [a3 section];
    uint64_t v7 = *(void *)(a1 + 112) - *(void *)(a1 + 104);
    if (v6 >= v7 >> 3)
    {
      uint64_t v8 = v6;
      if ([a3 item] != 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v16 = v7 >> 3;
        __int16 v17 = [MEMORY[0x1E4F28B00] currentHandler];
        [v17 handleFailureInMethod:sel_layoutAttributesForSupplementaryElementOfKind_atIndexPath_, a1, @"UICollectionViewData.mm", 981, @"request for layout attributes for supplementary view \"%@\" in section %ld when there are only %ld sections in the collection view", a2, v8, v16 object file lineNumber description];
      }
    }
    id v9 = [*(id *)(a1 + 32) objectForKey:a2];
    unint64_t v10 = [v9 objectForKey:a3];
    if (!v10)
    {
      if ((*(unsigned char *)(a1 + 96) & 0x10) != 0
        || ([*(id *)(a1 + 16) layoutAttributesForSupplementaryViewOfKind:a2 atIndexPath:a3],
            (uint64_t v11 = objc_claimAutoreleasedReturnValue()) == 0))
      {
        unint64_t v10 = 0;
      }
      else
      {
        id v12 = (void *)v11;
        if (!v9)
        {
          id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
          objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:");
        }
        [v9 setObject:v12 forKey:a3];
        unint64_t v10 = v12;
      }
    }
    char v13 = dyld_program_sdk_at_least();
    if (v10) {
      char v14 = 1;
    }
    else {
      char v14 = v13;
    }
    if ((v14 & 1) == 0 && (*(unsigned char *)(a1 + 96) & 0x10) == 0)
    {
      uint64_t v18 = [MEMORY[0x1E4F28B00] currentHandler];
      [v18 handleFailureInMethod:sel_layoutAttributesForSupplementaryElementOfKind_atIndexPath_, a1, @"UICollectionViewData.mm", 997, @"no UICollectionViewLayoutAttributes instance for -layoutAttributesForSupplementaryElementOfKind: %@ at path %@", a2, a3 object file lineNumber description];
    }
  }
  else
  {
    unint64_t v10 = 0;
  }
  return v10;
}

- (id)existingSupplementaryLayoutAttributes
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    unint64_t v3 = [*(id *)(a1 + 32) objectEnumerator];
    uint64_t v4 = [v3 countByEnumeratingWithState:&v18 objects:v23 count:16];
    if (v4)
    {
      uint64_t v5 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v19 != v5) {
            objc_enumerationMutation(v3);
          }
          uint64_t v7 = [*(id *)(*((void *)&v18 + 1) + 8 * i) allValues];
          [v2 addObjectsFromArray:v7];
        }
        uint64_t v4 = [v3 countByEnumeratingWithState:&v18 objects:v23 count:16];
      }
      while (v4);
    }

    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v8 = objc_msgSend(*(id *)(a1 + 40), "objectEnumerator", 0);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v22 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v15;
      do
      {
        for (uint64_t j = 0; j != v9; ++j)
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v8);
          }
          id v12 = [*(id *)(*((void *)&v14 + 1) + 8 * j) allValues];
          [v2 addObjectsFromArray:v12];
        }
        uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v22 count:16];
      }
      while (v9);
    }
  }
  else
  {
    id v2 = 0;
  }
  return v2;
}

- (id)knownSupplementaryElementKinds
{
  uint64_t v1 = a1;
  if (a1)
  {
    id v2 = (void *)MEMORY[0x1E4F1CAD0];
    unint64_t v3 = [a1[4] allKeys];
    uint64_t v4 = [v2 setWithArray:v3];

    if (v4)
    {
      uint64_t v5 = [v1[5] allKeys];
      [v4 setByAddingObjectsFromArray:v5];
    }
    else
    {
      uint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v5 = [v1[5] allKeys];
      [v6 setWithArray:v5];
    }
    uint64_t v1 = (id *)objc_claimAutoreleasedReturnValue();
  }
  return v1;
}

void __93__UICollectionViewData__layoutAttributesFromMapForElementsInRect_cellsOnly_validateIfNeeded___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __93__UICollectionViewData__layoutAttributesFromMapForElementsInRect_cellsOnly_validateIfNeeded___block_invoke_3;
  v4[3] = &unk_1E52E60D0;
  long long v6 = *(_OWORD *)(a1 + 40);
  long long v7 = *(_OWORD *)(a1 + 56);
  char v8 = *(unsigned char *)(a1 + 72);
  id v5 = *(id *)(a1 + 32);
  [a3 enumerateKeysAndObjectsUsingBlock:v4];
}

- (void)validateItems
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (a1 && (*(unsigned char *)(a1 + 96) & 0x10) == 0)
  {
    id v2 = *(id *)(a1 + 24);
    unint64_t v3 = *(void **)(a1 + 24);
    *(void *)(a1 + 24) = 0;

    if ((*(unsigned char *)(a1 + 96) & 8) == 0)
    {
      if (os_variant_has_internal_diagnostics())
      {
        log = __UIFaultDebugAssertLog();
        if (os_log_type_enabled(log, OS_LOG_TYPE_FAULT))
        {
          id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
          *(_DWORD *)buf = 138412546;
          id v11 = WeakRetained;
          __int16 v12 = 2112;
          id v13 = v2;
          _os_log_fault_impl(&dword_1853B0000, log, OS_LOG_TYPE_FAULT, "UICollectionView internal error: layoutIsPrepared flag was unexpectedly reset after validating layout. Re-preparing layout before validating individually invalidated items. Collection view: %@; invalidated indexes: %@",
            buf,
            0x16u);
        }
      }
      else
      {
        uint64_t v4 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &-[UICollectionViewData validateItems]::__s_category)
                          + 8);
        if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
        {
          id v5 = v4;
          id v6 = objc_loadWeakRetained((id *)(a1 + 8));
          *(_DWORD *)buf = 138412546;
          id v11 = v6;
          __int16 v12 = 2112;
          id v13 = v2;
          _os_log_impl(&dword_1853B0000, v5, OS_LOG_TYPE_ERROR, "UICollectionView internal error: layoutIsPrepared flag was unexpectedly reset after validating layout. Re-preparing layout before validating individually invalidated items. Collection view: %@; invalidated indexes: %@",
            buf,
            0x16u);
        }
      }
      -[UICollectionViewData _prepareToLoadData](a1);
    }
    v9[0] = (void (*)(void, void, void))MEMORY[0x1E4F143A8];
    v9[1] = (void (*)(void, void, void))3221225472;
    v9[2] = (void (*)(void, void, void))__37__UICollectionViewData_validateItems__block_invoke;
    v9[3] = (void (*)(void, void, void))&unk_1E52DAEF0;
    v9[4] = (void (*)(void, void, void))a1;
    -[_UIFastIndexSet enumerateIndexesUsingBlock:]((uint64_t)v2, v9);
  }
}

- (uint64_t)invalidateSupplementaryIndexPaths:(uint64_t)result
{
  if (result)
  {
    uint64_t v2 = result;
    if ((*(unsigned char *)(result + 96) & 0x10) == 0)
    {
      uint64_t result = [a2 count];
      if (result)
      {
        if (!*(void *)(v2 + 48))
        {
          id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
          id v5 = *(void **)(v2 + 48);
          *(void *)(v2 + 48) = v4;
        }
        v6[0] = MEMORY[0x1E4F143A8];
        v6[1] = 3221225472;
        v6[2] = __58__UICollectionViewData_invalidateSupplementaryIndexPaths___block_invoke;
        v6[3] = &unk_1E52E6030;
        v6[4] = v2;
        return [a2 enumerateKeysAndObjectsUsingBlock:v6];
      }
    }
  }
  return result;
}

- (void)invalidateItemsAtIndexPaths:(uint64_t)a1
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  if (a1 && (*(unsigned char *)(a1 + 96) & 0x10) == 0)
  {
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v3 = a2;
    uint64_t v4 = [v3 countByEnumeratingWithState:&v33 objects:v39 count:16];
    if (v4)
    {
      uint64_t v5 = *(void *)v34;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v34 != v5) {
            objc_enumerationMutation(v3);
          }
          long long v7 = *(void **)(*((void *)&v33 + 1) + 8 * v6);
          uint64_t v37 = 0;
          uint64_t v38 = 0;
          objc_msgSend(v7, "ui_getSectionIndex:itemIndex:", &v38, &v37);
          uint64_t v8 = -[UICollectionViewData numberOfItemsBeforeSection:](a1, v38);
          unint64_t v9 = v37 + v8;
          uint64_t v10 = *(void *)(a1 + 168);
          if (v37 + v8 >= v10)
          {
            [MEMORY[0x1E4F28B00] currentHandler];
            long long v30 = v32 = v7;
            [v30 handleFailureInMethod:sel_invalidateItemsAtIndexPaths_, a1, @"UICollectionViewData.mm", 151, @"attempting to invalidate an item at an invalid indexPath: %@ globalIndex: %ld numItems: %ld", v32, v9, v10 object file lineNumber description];
          }
          if (dyld_program_sdk_at_least())
          {
            uint64_t v12 = *(void *)(a1 + 24);
            if (v12)
            {
              [(_UIMutableFastIndexSet *)v12 addIndex:v11];
            }
            else
            {
              uint8x8_t v26 = -[_UIFastIndexSet initWithIndex:]((unsigned int *)[_UIMutableFastIndexSet alloc], v9);
              unint64_t v27 = *(void **)(a1 + 24);
              *(void *)(a1 + 24) = v26;
            }
            std::__hash_table<std::__hash_value_type<long,UICollectionViewLayoutAttributes * {__strong}>,std::__unordered_map_hasher<long,std::__hash_value_type<long,UICollectionViewLayoutAttributes * {__strong}>,std::hash<long>,std::equal_to<long>,true>,std::__unordered_map_equal<long,std::__hash_value_type<long,UICollectionViewLayoutAttributes * {__strong}>,std::equal_to<long>,std::hash<long>,true>,std::allocator<std::__hash_value_type<long,UICollectionViewLayoutAttributes * {__strong}>>>::__erase_unique<long>((void *)(a1 + 128), v9);
          }
          else
          {
            id v13 = -[UICollectionViewData _cachedLayoutAttributesForGlobalItemIndex:]((void *)a1, v9);
            uint64_t v14 = v13;
            if (v13)
            {
              [v13 frame];
              long long v19 = *(void **)(a1 + 176);
              if (v19)
              {
                uint64_t v20 = v19[6];
                uint64_t v21 = v19[7];
                uint64_t v22 = v19[8];
                uint64_t v23 = v19[9];
              }
              else
              {
                uint64_t v21 = 0;
                uint64_t v22 = 0;
                uint64_t v23 = 0;
                uint64_t v20 = 0;
              }
              if (CGRectIntersectsRect(*(CGRect *)&v15, *(CGRect *)&v20))
              {
                uint64_t v25 = *(void *)(a1 + 24);
                if (v25)
                {
                  [(_UIMutableFastIndexSet *)v25 addIndex:v24];
                }
                else
                {
                  uint64_t v28 = -[_UIFastIndexSet initWithIndex:]((unsigned int *)[_UIMutableFastIndexSet alloc], v9);
                  uint64_t v29 = *(void **)(a1 + 24);
                  *(void *)(a1 + 24) = v28;
                }
              }
              std::__hash_table<std::__hash_value_type<long,UICollectionViewLayoutAttributes * {__strong}>,std::__unordered_map_hasher<long,std::__hash_value_type<long,UICollectionViewLayoutAttributes * {__strong}>,std::hash<long>,std::equal_to<long>,true>,std::__unordered_map_equal<long,std::__hash_value_type<long,UICollectionViewLayoutAttributes * {__strong}>,std::equal_to<long>,std::hash<long>,true>,std::allocator<std::__hash_value_type<long,UICollectionViewLayoutAttributes * {__strong}>>>::__erase_unique<long>((void *)(a1 + 128), v9);
            }
          }
          ++v6;
        }
        while (v4 != v6);
        uint64_t v31 = [v3 countByEnumeratingWithState:&v33 objects:v39 count:16];
        uint64_t v4 = v31;
      }
      while (v31);
    }
  }
}

void __55__UICollectionViewData_invalidateDecorationIndexPaths___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = [*(id *)(*(void *)(a1 + 32) + 56) objectForKeyedSubscript:a2];
  id v8 = v6;
  if (v6)
  {
    [v6 addObjectsFromArray:a3];
  }
  else
  {
    long long v7 = [MEMORY[0x1E4F1CA80] setWithArray:a3];
    [*(id *)(*(void *)(a1 + 32) + 56) setObject:v7 forKeyedSubscript:a2];
  }
}

void __58__UICollectionViewData_invalidateSupplementaryIndexPaths___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = [*(id *)(*(void *)(a1 + 32) + 48) objectForKeyedSubscript:a2];
  id v8 = v6;
  if (v6)
  {
    [v6 addObjectsFromArray:a3];
  }
  else
  {
    long long v7 = [MEMORY[0x1E4F1CA80] setWithArray:a3];
    [*(id *)(*(void *)(a1 + 32) + 48) setObject:v7 forKeyedSubscript:a2];
  }
}

void __50__UICollectionViewData_validateSupplementaryViews__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKeyedSubscript:a2];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v7 = a3;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v7);
        }
        __n128 v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        objc_msgSend(v6, "removeObjectForKey:", v11, (void)v13);
        id v12 = -[UICollectionViewData layoutAttributesForSupplementaryElementOfKind:atIndexPath:](*(void *)(a1 + 32), a2, v11);
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
}

void __47__UICollectionViewData_validateDecorationViews__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = [*(id *)(*(void *)(a1 + 32) + 40) objectForKeyedSubscript:a2];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v7 = a3;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v7);
        }
        __n128 v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        objc_msgSend(v6, "removeObjectForKey:", v11, (void)v13);
        id v12 = -[UICollectionViewData layoutAttributesForDecorationViewOfKind:atIndexPath:](*(void *)(a1 + 32), a2, v11);
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
}

- (BOOL)dataSourceMatchesCurrentCounts
{
  if (!a1) {
    return 0;
  }
  BOOL v2 = 0;
  if ((*(unsigned char *)(a1 + 96) & 2) != 0)
  {
    uint64_t v4 = *(void *)(a1 + 104);
    uint64_t v3 = *(void *)(a1 + 112);
    if (v3 != v4 && *(void *)(a1 + 168) != 0)
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
      id v7 = [WeakRetained _dataSourceProxy];

      if (v7
        && ((id v8 = objc_loadWeakRetained((id *)(a1 + 8)),
             ![v8 _dataSourceImplementsNumberOfSections])
          ? (uint64_t v11 = 1)
          : (id v9 = objc_loadWeakRetained((id *)(a1 + 8)),
             uint64_t v10 = [v7 numberOfSectionsInCollectionView:v9],
             v9,
             uint64_t v11 = v10 & ~(v10 >> 63)),
            uint64_t v12 = v3 - v4,
            v8,
            v11 == v12 >> 3))
      {
        if (v12 < 1)
        {
          BOOL v2 = 1;
        }
        else
        {
          uint64_t v13 = 0;
          if (v12 >> 3 <= 1) {
            uint64_t v14 = 1;
          }
          else {
            uint64_t v14 = v12 >> 3;
          }
          uint64_t v15 = v14 - 1;
          do
          {
            id v16 = objc_loadWeakRetained((id *)(a1 + 8));
            uint64_t v17 = [v7 collectionView:v16 numberOfItemsInSection:v13];

            uint64_t v18 = *(void *)(*(void *)(a1 + 104) + 8 * v13);
            BOOL v2 = v17 == v18;
          }
          while (v17 == v18 && v15 != v13++);
        }
      }
      else
      {
        BOOL v2 = 0;
      }
    }
  }
  return v2;
}

- (id)dataSourceCountsDescription
{
  if (a1)
  {
    a1 = -[UICollectionViewData descriptionIncludingPointer:]((uint64_t)a1, 0);
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)descriptionIncludingPointer:(uint64_t)a1
{
  if (a1)
  {
    uint64_t v3 = (void *)MEMORY[0x1E4F28E78];
    if (a2)
    {
      uint64_t v4 = (objc_class *)objc_opt_class();
      uint64_t v5 = NSStringFromClass(v4);
      uint64_t v6 = [v3 stringWithFormat:@"<%@ - %p:", v5, a1];

      id v7 = (void *)v6;
    }
    else
    {
      id v7 = [MEMORY[0x1E4F28E78] stringWithString:@"["];
    }
    id v8 = *(uint64_t **)(a1 + 104);
    id v9 = *(uint64_t **)(a1 + 112);
    if (v8 != v9)
    {
      uint64_t v10 = 0;
      uint64_t v11 = 0;
      do
      {
        uint64_t v12 = *v8;
        if (v10) {
          [v7 appendString:@","];
        }
        uint64_t v13 = [NSNumber numberWithInteger:v11];
        uint64_t v14 = [NSNumber numberWithInteger:v12];
        [v7 appendFormat:@"(%@:%@)", v13, v14];

        v11 += v12;
        ++v8;
        --v10;
      }
      while (v8 != v9);
    }
    if (a2) {
      uint64_t v15 = @">";
    }
    else {
      uint64_t v15 = @"]";
    }
    [v7 appendString:v15];
  }
  else
  {
    id v7 = 0;
  }
  return v7;
}

- (double)rectForItemAtIndexPath:(uint64_t)a1
{
  if (!a1) {
    return 0.0;
  }
  BOOL v2 = -[UICollectionViewData layoutAttributesForItemAtIndexPath:](a1, a2);
  [v2 frame];
  double v4 = v3;

  return v4;
}

void __111__UICollectionViewData__layoutAttributesForElementsInRect_cellsOnly_validateIfNeeded_includeIndelibleElements___block_invoke(uint64_t a1, _WORD *a2, uint64_t a3)
{
  if (a2 && (a2[144] & 1) != 0)
  {
    if (*(unsigned char *)(a1 + 56))
    {
      id v13 = [a2 indexPath];
      if (-[UICollectionViewData _shouldUseReorderingLayoutAttributesForItemAtIndexPath:](*(void *)(a1 + 32), (uint64_t)v13))
      {
        uint64_t v6 = *(void *)(a1 + 32);
        id v7 = *(void **)(v6 + 16);
        id WeakRetained = objc_loadWeakRetained((id *)(v6 + 8));
        [WeakRetained _reorderingTargetPosition];
        id v9 = objc_msgSend(v7, "_layoutAttributesForReorderedItemAtIndexPath:withTargetPosition:", v13);

        if (v9) {
          [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) replaceObjectAtIndex:a3 withObject:v9];
        }
      }
    }
  }
  else if (*(unsigned char *)(a1 + 57))
  {
    uint64_t v5 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    if (v5)
    {
      objc_msgSend(v5, "addIndex:");
    }
    else
    {
      uint64_t v10 = [MEMORY[0x1E4F28E60] indexSetWithIndex:a3];
      uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
      uint64_t v12 = *(void **)(v11 + 40);
      *(void *)(v11 + 40) = v10;
    }
  }
}

uint64_t __93__UICollectionViewData__layoutAttributesFromMapForElementsInRect_cellsOnly_validateIfNeeded___block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = [a2 zIndex];
  uint64_t v6 = [a3 zIndex];
  if (v5 < v6) {
    return -1;
  }
  if (v6 < v5) {
    return 1;
  }
  id v8 = [a2 indexPath];
  id v9 = [a3 indexPath];
  uint64_t v7 = [v8 compare:v9];

  return v7;
}

- (id)layoutAttributesForCellsInRect:(double)a3 validateLayout:(double)a4
{
  if (a1)
  {
    a1 = -[UICollectionViewData _layoutAttributesForElementsInRect:cellsOnly:validateIfNeeded:includeIndelibleElements:]((uint64_t)a1, 1, a2, 0, a3, a4, a5, a6);
    uint64_t v6 = vars8;
  }
  return a1;
}

- (id)knownDecorationElementKinds
{
  if (a1)
  {
    uint64_t v1 = (void *)MEMORY[0x1E4F1CAD0];
    BOOL v2 = [*(id *)(a1 + 40) allKeys];
    double v3 = [v1 setWithArray:v2];
  }
  else
  {
    double v3 = 0;
  }
  return v3;
}

- (CGRect)_TEST_validLayoutRect
{
  attributesMap = self->_attributesMap;
  if (attributesMap)
  {
    double x = attributesMap->_validLayoutRect.origin.x;
    double y = attributesMap->_validLayoutRect.origin.y;
    double width = attributesMap->_validLayoutRect.size.width;
    double height = attributesMap->_validLayoutRect.size.height;
  }
  else
  {
    double y = 0.0;
    double width = 0.0;
    double height = 0.0;
    double x = 0.0;
  }
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

@end