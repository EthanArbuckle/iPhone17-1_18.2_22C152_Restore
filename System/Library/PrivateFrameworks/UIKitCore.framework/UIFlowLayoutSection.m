@interface UIFlowLayoutSection
@end

@implementation UIFlowLayoutSection

void __61___UIFlowLayoutSection_sizeChangedForItem_atIndexPath_inRow___block_invoke(uint64_t a1, void *a2)
{
  v3 = a2;
  if (v3 && (v3[8] & 5) == 1)
  {
    v17 = v3;
    uint64_t v4 = *(void *)(a1 + 32);
    if (v4)
    {
      WeakRetained = (double *)objc_loadWeakRetained((id *)(v4 + 144));
      double v6 = *MEMORY[0x1E4F1DB30];
      double v7 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
      if (WeakRetained)
      {
        uint64_t v8 = *((void *)WeakRetained + 11);
        if (v8 < 1)
        {
          double v10 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
          double v9 = *MEMORY[0x1E4F1DB30];
        }
        else
        {
          double v9 = WeakRetained[9] / (double)v8;
          double v10 = WeakRetained[10] / (double)v8;
        }
        goto LABEL_8;
      }
    }
    else
    {
      WeakRetained = 0;
      double v6 = *MEMORY[0x1E4F1DB30];
      double v7 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    }
    double v10 = 0.0;
    double v9 = 0.0;
LABEL_8:

    BOOL v11 = v9 == v6 && v10 == v7;
    v3 = v17;
    if (v11) {
      goto LABEL_18;
    }
    long long v16 = *((_OWORD *)v17 + 2);
    uint64_t v12 = *(void *)(a1 + 32);
    double v13 = 0.0;
    if (v12)
    {
      v14 = (double *)objc_loadWeakRetained((id *)(v12 + 144));
      if (v14)
      {
        uint64_t v15 = *((void *)v14 + 11);
        if (v15 < 1)
        {
          double v13 = v7;
        }
        else
        {
          double v6 = v14[9] / (double)v15;
          double v13 = v14[10] / (double)v15;
        }
        goto LABEL_17;
      }
    }
    else
    {
      v14 = 0;
    }
    double v6 = 0.0;
LABEL_17:

    v3 = v17;
    *((_OWORD *)v17 + 2) = v16;
    *((double *)v17 + 6) = v6;
    *((double *)v17 + 7) = v13;
  }
LABEL_18:
}

uint64_t __52___UIFlowLayoutSection_estimatedIndexOfItemAtPoint___block_invoke(uint64_t a1)
{
  uint64_t v10 = 0;
  BOOL v11 = &v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 104);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52___UIFlowLayoutSection_estimatedIndexOfItemAtPoint___block_invoke_2;
  v7[3] = &unk_1E52E6518;
  long long v8 = *(_OWORD *)(a1 + 40);
  char v9 = *(unsigned char *)(a1 + 56);
  v7[4] = v2;
  v7[5] = &v10;
  [v3 enumerateObjectsUsingBlock:v7];
  uint64_t v4 = v11[3];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = [*(id *)(*(void *)(a1 + 32) + 104) lastObject];
    uint64_t v4 = [(_UIFlowLayoutRow *)(uint64_t)v5 indexOfNearestItemAtPoint:*(double *)(a1 + 48)];
  }
  _Block_object_dispose(&v10, 8);
  return v4;
}

void __52___UIFlowLayoutSection_estimatedIndexOfItemAtPoint___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  double v7 = a2;
  long long v16 = v7;
  if (v7)
  {
    CGFloat v9 = v7[9];
    CGFloat v8 = v7[10];
    CGFloat v10 = v7[11];
    CGFloat v11 = v7[12];
  }
  else
  {
    CGFloat v8 = 0.0;
    CGFloat v10 = 0.0;
    CGFloat v11 = 0.0;
    CGFloat v9 = 0.0;
  }
  v18.origin.x = v9;
  v18.origin.y = v8;
  v18.size.width = v10;
  v18.size.height = v11;
  if (!CGRectContainsPoint(v18, *(CGPoint *)(a1 + 48)))
  {
    if (*(unsigned char *)(a1 + 64))
    {
      double v12 = *(double *)(a1 + 48);
      v19.origin.x = v9;
      v19.origin.y = v8;
      v19.size.width = v10;
      v19.size.height = v11;
      if (v12 < CGRectGetMinX(v19))
      {
LABEL_9:
        if (a3) {
          uint64_t v14 = a3 - 1;
        }
        else {
          uint64_t v14 = 0;
        }
        uint64_t v15 = [*(id *)(*(void *)(a1 + 32) + 104) objectAtIndex:v14];
        *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [(_UIFlowLayoutRow *)(uint64_t)v15 indexOfNearestItemAtPoint:*(double *)(a1 + 56)];

        goto LABEL_13;
      }
      if (*(unsigned char *)(a1 + 64)) {
        goto LABEL_14;
      }
    }
    double v13 = *(double *)(a1 + 56);
    v20.origin.x = v9;
    v20.origin.y = v8;
    v20.size.width = v10;
    v20.size.height = v11;
    if (v13 >= CGRectGetMinY(v20)) {
      goto LABEL_14;
    }
    goto LABEL_9;
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [(_UIFlowLayoutRow *)(uint64_t)v16 indexOfNearestItemAtPoint:*(double *)(a1 + 56)];
LABEL_13:
  *a4 = 1;
LABEL_14:
}

void __71___UIFlowLayoutSection_setSize_forItemAtIndexPath_invalidationContext___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(id *)(__UILogGetCategoryCachedImpl("Warning", &_block_invoke___s_category_1) + 8);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    v3 = [NSNumber numberWithInteger:*(void *)(a1 + 40)];
    WeakRetained = (id *)objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 144));
    v5 = WeakRetained;
    if (WeakRetained) {
      id v6 = objc_loadWeakRetained(WeakRetained + 15);
    }
    else {
      id v6 = 0;
    }
    double v7 = (id *)objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 144));
    CGFloat v8 = v7;
    if (v7) {
      id v9 = objc_loadWeakRetained(v7 + 15);
    }
    else {
      id v9 = 0;
    }
    CGFloat v10 = [v9 collectionView];
    int v11 = 138412802;
    double v12 = v3;
    __int16 v13 = 2112;
    id v14 = v6;
    __int16 v15 = 2112;
    long long v16 = v10;
    _os_log_impl(&dword_1853B0000, v2, OS_LOG_TYPE_ERROR, "Warning: sizing information will be ignored since the item referenced %@ does not currently exist. layout=%@; collectionView=%@",
      (uint8_t *)&v11,
      0x20u);
  }
}

@end