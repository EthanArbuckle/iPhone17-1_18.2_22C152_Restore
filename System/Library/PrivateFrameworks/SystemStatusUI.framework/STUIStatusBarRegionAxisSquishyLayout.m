@interface STUIStatusBarRegionAxisSquishyLayout
- (BOOL)canOverflowItems;
- (BOOL)compressItems;
- (BOOL)mayFitDisplayItems:(id)a3 inContainerItem:(id)a4 axis:(int64_t)a5;
- (NSSet)dynamicallyHiddenIdentifiers;
- (STUIStatusBarRegionAxisSquishyLayout)init;
- (STUIStatusBarRegionAxisSquishyLayoutDynamicHidingDelegate)dynamicHidingDelegate;
- (double)interspace;
- (double)itemDynamicScale;
- (double)minInterspaceDynamicScale;
- (double)minItemDynamicScale;
- (id)constraintsForDisplayItems:(id)a3 layoutGuides:(id)a4 inContainerItem:(id)a5 axis:(int64_t)a6;
- (int64_t)alignment;
- (int64_t)maxNumberOfItems;
- (int64_t)maxNumberOfVisibleItems;
- (void)setAlignment:(int64_t)a3;
- (void)setCompressItems:(BOOL)a3;
- (void)setDynamicHidingDelegate:(id)a3;
- (void)setDynamicallyHiddenIdentifiers:(id)a3;
- (void)setInterspace:(double)a3;
- (void)setItemDynamicScale:(double)a3;
- (void)setMaxNumberOfItems:(int64_t)a3;
- (void)setMaxNumberOfVisibleItems:(int64_t)a3;
- (void)setMinInterspaceDynamicScale:(double)a3;
- (void)setMinItemDynamicScale:(double)a3;
@end

@implementation STUIStatusBarRegionAxisSquishyLayout

- (void)setMinItemDynamicScale:(double)a3
{
  double v3 = fmax(fmin(a3, 1.0), 0.0);
  if (v3 != self->_minItemDynamicScale) {
    self->_minItemDynamicScale = v3;
  }
}

- (void)setMinInterspaceDynamicScale:(double)a3
{
  double v3 = fmax(fmin(a3, 1.0), 0.0);
  if (v3 != self->_minInterspaceDynamicScale) {
    self->_minInterspaceDynamicScale = v3;
  }
}

- (void)setMaxNumberOfVisibleItems:(int64_t)a3
{
  self->_maxNumberOfVisibleItems = a3;
}

- (void)setMaxNumberOfItems:(int64_t)a3
{
  self->_maxNumberOfItems = a3;
}

- (void)setItemDynamicScale:(double)a3
{
  self->_itemDynamicScale = a3;
}

- (void)setInterspace:(double)a3
{
  self->_interspace = a3;
}

- (void)setDynamicHidingDelegate:(id)a3
{
}

- (void)setAlignment:(int64_t)a3
{
  self->_alignment = a3;
}

- (int64_t)maxNumberOfVisibleItems
{
  return self->_maxNumberOfVisibleItems;
}

- (STUIStatusBarRegionAxisSquishyLayout)init
{
  v8.receiver = self;
  v8.super_class = (Class)STUIStatusBarRegionAxisSquishyLayout;
  result = [(STUIStatusBarRegionAxisSquishyLayout *)&v8 init];
  __asm { FMOV            V0.2D, #1.0 }
  *(_OWORD *)&result->_itemDynamicScale = _Q0;
  result->_minInterspaceDynamicScale = 0.0;
  result->_interspace = -1.0;
  return result;
}

- (void)setCompressItems:(BOOL)a3
{
  self->_compressItems = a3;
}

- (id)constraintsForDisplayItems:(id)a3 layoutGuides:(id)a4 inContainerItem:(id)a5 axis:(int64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = [MEMORY[0x1E4F1CA48] array];
  int64_t alignment = self->_alignment;
  v53 = v11;
  v55 = v12;
  v52 = (void *)v13;
  if (a6 == 1)
  {
    uint64_t v15 = 0;
    int64_t v57 = self->_alignment;
    uint64_t v58 = 4;
    uint64_t v16 = 8;
    switch(alignment)
    {
      case 1:
        uint64_t v15 = 10;
        goto LABEL_9;
      case 3:
        break;
      case 4:
        goto LABEL_7;
      case 5:
        uint64_t v15 = 11;
        goto LABEL_9;
      default:
LABEL_9:
        if (a6) {
          uint64_t v16 = 8 * (a6 == 1);
        }
        else {
          uint64_t v16 = 7;
        }
        int64_t v57 = v15;
        uint64_t v58 = v15;
        break;
    }
  }
  else if (a6)
  {
LABEL_7:
    uint64_t v16 = 8 * (a6 == 1);
    uint64_t v58 = 3;
    int64_t v57 = 4;
  }
  else
  {
    uint64_t v15 = 0;
    uint64_t v58 = 2;
    int64_t v57 = 1;
    uint64_t v16 = 7;
    switch(alignment)
    {
      case 1:
        uint64_t v15 = 9;
        goto LABEL_9;
      case 3:
        uint64_t v58 = 6;
        uint64_t v17 = 5;
        goto LABEL_16;
      case 4:
        uint64_t v58 = 5;
        uint64_t v17 = 6;
        goto LABEL_16;
      case 5:
        break;
      case 6:
        uint64_t v58 = 1;
        uint64_t v17 = 2;
LABEL_16:
        int64_t v57 = v17;
        uint64_t v16 = 7;
        break;
      default:
        goto LABEL_9;
    }
  }
  double v18 = 1.0;
  if ((alignment & 0xFFFFFFFFFFFFFFFDLL) == 4) {
    double v19 = -1.0;
  }
  else {
    double v19 = 1.0;
  }
  double minItemDynamicScale = self->_minItemDynamicScale;
  if (self->_itemDynamicScale >= minItemDynamicScale) {
    double itemDynamicScale = self->_itemDynamicScale;
  }
  else {
    double itemDynamicScale = self->_minItemDynamicScale;
  }
  if (minItemDynamicScale < 1.0) {
    double v18 = self->_minInterspaceDynamicScale
  }
        + (1.0 - self->_minInterspaceDynamicScale)
        * ((itemDynamicScale - minItemDynamicScale)
         / (1.0 - minItemDynamicScale));
  if ((alignment | 2) == 6)
  {
    v22 = [v10 reverseObjectEnumerator];
    uint64_t v23 = [v22 allObjects];

    id v10 = (id)v23;
  }
  id v24 = v10;
  if ([(NSSet *)self->_dynamicallyHiddenIdentifiers count])
  {
    v78[0] = MEMORY[0x1E4F143A8];
    v78[1] = 3221225472;
    v78[2] = __101__STUIStatusBarRegionAxisSquishyLayout_constraintsForDisplayItems_layoutGuides_inContainerItem_axis___block_invoke;
    v78[3] = &unk_1E6AA3B30;
    v78[4] = self;
    v25 = [v24 indexesOfObjectsPassingTest:v78];
    v26 = [v24 objectsAtIndexes:v25];
    v27 = [v24 arrayByExcludingObjectsInArray:v26];
  }
  else
  {
    v26 = (void *)MEMORY[0x1E4F1CBF0];
    v27 = v24;
  }
  unint64_t maxNumberOfVisibleItems = self->_maxNumberOfVisibleItems;
  if (maxNumberOfVisibleItems >= [v27 count])
  {
    v51 = v26;
  }
  else
  {
    v29 = STUIStatusBarGetPriorityComparator();
    v30 = [v27 sortedArrayUsingComparator:v29];

    uint64_t v31 = objc_msgSend(v30, "subarrayWithRange:", self->_maxNumberOfVisibleItems, objc_msgSend(v30, "count") - self->_maxNumberOfVisibleItems);

    uint64_t v32 = [v27 arrayByExcludingObjectsInArray:v31];

    v51 = (void *)v31;
    v27 = (void *)v32;
  }
  v76[0] = 0;
  v76[1] = v76;
  v76[2] = 0x3032000000;
  v76[3] = __Block_byref_object_copy_;
  v76[4] = __Block_byref_object_dispose_;
  id v77 = 0;
  v75[0] = 0;
  v75[1] = v75;
  v75[2] = 0x2020000000;
  v75[3] = 0;
  v74[0] = 0;
  v74[1] = v74;
  v74[2] = 0x2020000000;
  v74[3] = 0;
  v59[0] = MEMORY[0x1E4F143A8];
  v59[1] = 3221225472;
  v59[2] = __101__STUIStatusBarRegionAxisSquishyLayout_constraintsForDisplayItems_layoutGuides_inContainerItem_axis___block_invoke_1;
  v59[3] = &unk_1E6AA3B58;
  id v33 = v27;
  double v68 = v19;
  id v60 = v33;
  v61 = self;
  v65 = v75;
  v66 = v74;
  id v34 = v52;
  int64_t v69 = v57;
  uint64_t v70 = v58;
  double v71 = v18;
  uint64_t v72 = v16;
  id v62 = v34;
  v67 = v76;
  id v35 = v53;
  id v63 = v35;
  id v36 = v55;
  id v64 = v36;
  double v73 = itemDynamicScale;
  [v24 enumerateObjectsUsingBlock:v59];
  if ([v33 count])
  {
    v37 = objc_msgSend(v33, "firstObject", v51);
    v56 = [v37 layoutItem];
    v54 = v35;

    v38 = [v33 lastObject];
    v39 = [v38 layoutItem];

    if (a6 == 1) {
      uint64_t v40 = 10;
    }
    else {
      uint64_t v40 = 9;
    }
    id v41 = objc_alloc_init(MEMORY[0x1E4FB1940]);
    v42 = [MEMORY[0x1E4F28DC8] constraintWithItem:v41 attribute:v57 relatedBy:0 toItem:v56 attribute:v57 multiplier:1.0 constant:0.0];
    [v34 addObject:v42];

    v43 = [MEMORY[0x1E4F28DC8] constraintWithItem:v41 attribute:v58 relatedBy:0 toItem:v39 attribute:v58 multiplier:1.0 constant:0.0];
    [v34 addObject:v43];

    v44 = [MEMORY[0x1E4F28DC8] constraintWithItem:v41 attribute:v40 relatedBy:0 toItem:v36 attribute:v40 multiplier:1.0 constant:(1.0 - v18) * (v19 * self->_interspace)];
    [v34 addObject:v44];

    [v54 addObject:v41];
    if (v19 == 1.0) {
      uint64_t v45 = -1;
    }
    else {
      uint64_t v45 = 1;
    }
    v46 = objc_msgSend(MEMORY[0x1E4F28DC8], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v39, v58, v45, v36, v58);
    LODWORD(v47) = 1111752704;
    [v46 setPriority:v47];
    [v34 addObject:v46];

    id v35 = v54;
  }
  v48 = v64;
  id v49 = v34;

  _Block_object_dispose(v74, 8);
  _Block_object_dispose(v75, 8);
  _Block_object_dispose(v76, 8);

  return v49;
}

void __101__STUIStatusBarRegionAxisSquishyLayout_constraintsForDisplayItems_layoutGuides_inContainerItem_axis___block_invoke_1(uint64_t a1, void *a2)
{
  id v44 = a2;
  double v3 = [v44 layoutItem];
  int v4 = [*(id *)(a1 + 32) containsObject:v44];
  uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
  if (v5
    && ([*(id *)(a1 + 32) objectAtIndexedSubscript:v5 - 1],
        v6 = objc_claimAutoreleasedReturnValue(),
        [v6 layoutItem],
        v7 = objc_claimAutoreleasedReturnValue(),
        v6,
        v7))
  {
    double v8 = *(double *)(*(void *)(a1 + 40) + 24);
    if (v8 == -1.0) {
      goto LABEL_20;
    }
    [v44 additionalDynamicPadding];
    uint64_t v10 = *(void *)(*(void *)(a1 + 80) + 8);
    if (v9 == 0.0)
    {
      double v11 = *(double *)(v10 + 24);
      *(void *)(v10 + 24) = 0;
    }
    else
    {
      *(double *)(v10 + 24) = v9;
      double v11 = *(double *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
    }
    double v17 = v8 + v11;
    id v18 = objc_alloc_init(MEMORY[0x1E4FB1940]);
    double v19 = *(void **)(a1 + 48);
    v20 = (void *)MEMORY[0x1E4F28DC8];
    uint64_t v21 = *(void *)(a1 + 104);
    uint64_t v22 = *(void *)(a1 + 112);
    double v23 = 0.0;
    if ((v4 & 1) == 0)
    {
      double v24 = *(double *)(a1 + 96);
      objc_msgSend(v3, "_ui_bounds");
      double v23 = v17 * 0.5 * *(double *)(a1 + 120) - v24 * (v25 * 0.5);
    }
    v26 = [v20 constraintWithItem:v3 attribute:v21 relatedBy:0 toItem:v18 attribute:v22 multiplier:1.0 constant:v23];
    [v19 addObject:v26];

    v27 = *(void **)(a1 + 48);
    v28 = [MEMORY[0x1E4F28DC8] constraintWithItem:v18 attribute:*(void *)(a1 + 104) relatedBy:0 toItem:v7 attribute:*(void *)(a1 + 112) multiplier:1.0 constant:0.0];
    [v27 addObject:v28];

    v29 = *(void **)(a1 + 48);
    v30 = [MEMORY[0x1E4F28DC8] constraintWithItem:v18 attribute:*(void *)(a1 + 128) relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:v17 * *(double *)(a1 + 120)];
    [v29 addObject:v30];

    uint64_t v31 = *(void *)(*(void *)(a1 + 88) + 8);
    uint64_t v32 = *(void *)(v31 + 40);
    if (v32)
    {
      id v33 = *(void **)(a1 + 48);
      id v34 = [MEMORY[0x1E4F28DC8] constraintWithItem:v18 attribute:*(void *)(a1 + 128) relatedBy:0 toItem:v32 attribute:*(void *)(a1 + 128) multiplier:1.0 constant:0.0];
      [v33 addObject:v34];

      uint64_t v31 = *(void *)(*(void *)(a1 + 88) + 8);
      id v35 = *(void **)(v31 + 40);
    }
    else
    {
      id v35 = 0;
    }
    *(void *)(v31 + 40) = v18;
    id v14 = v18;

    [*(id *)(a1 + 56) addObject:v14];
  }
  else
  {
    if (*(double *)(a1 + 96) == 1.0) {
      uint64_t v12 = 1;
    }
    else {
      uint64_t v12 = -1;
    }
    uint64_t v13 = [MEMORY[0x1E4F28DC8] constraintWithItem:v3 attribute:*(void *)(a1 + 104) relatedBy:v12 toItem:*(void *)(a1 + 64) attribute:*(void *)(a1 + 104) multiplier:1.0 constant:0.0];
    id v14 = v13;
    LODWORD(v15) = 1144733696;
    if (!*(unsigned char *)(*(void *)(a1 + 40) + 8)) {
      *(float *)&double v15 = 49.0;
    }
    [v13 setPriority:v15];
    [*(id *)(a1 + 48) addObject:v14];
    [v44 additionalDynamicPadding];
    v7 = 0;
    *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = v16;
  }

LABEL_20:
  if (v4)
  {
    ++*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
    if (![v44 dynamicallyHidden])
    {
      id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 80));

      if (!WeakRetained) {
        goto LABEL_31;
      }
      id v38 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 80));
      [v38 updateDisplayItem:v44 toScale:*(double *)(a1 + 136)];
      goto LABEL_30;
    }
    [v44 setDynamicallyHidden:0];
    id v36 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 80));

    if (!v36) {
      goto LABEL_31;
    }
    id v37 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 80));
    id v38 = v37;
    double v39 = *(double *)(a1 + 136);
    id v40 = v44;
    uint64_t v41 = 0;
LABEL_27:
    [v37 updateDisplayItem:v40 toDynamicallyHidden:v41 scale:v39];
LABEL_30:

    goto LABEL_31;
  }
  if (([v44 dynamicallyHidden] & 1) == 0)
  {
    [v44 setDynamicallyHidden:1];
    id v42 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 80));

    if (v42)
    {
      id v37 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 80));
      id v38 = v37;
      double v39 = *(double *)(a1 + 136);
      id v40 = v44;
      uint64_t v41 = 1;
      goto LABEL_27;
    }
  }
LABEL_31:
}

- (BOOL)mayFitDisplayItems:(id)a3 inContainerItem:(id)a4 axis:(int64_t)a5
{
  return (unint64_t)[a3 count] <= self->_maxNumberOfItems;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dynamicHidingDelegate);
  objc_storeStrong((id *)&self->_dynamicallyHiddenIdentifiers, 0);
}

uint64_t __101__STUIStatusBarRegionAxisSquishyLayout_constraintsForDisplayItems_layoutGuides_inContainerItem_axis___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 48);
  double v3 = [a2 identifier];
  uint64_t v4 = [v2 containsObject:v3];

  return v4;
}

- (BOOL)canOverflowItems
{
  return 1;
}

- (int64_t)alignment
{
  return self->_alignment;
}

- (BOOL)compressItems
{
  return self->_compressItems;
}

- (double)interspace
{
  return self->_interspace;
}

- (int64_t)maxNumberOfItems
{
  return self->_maxNumberOfItems;
}

- (NSSet)dynamicallyHiddenIdentifiers
{
  return self->_dynamicallyHiddenIdentifiers;
}

- (void)setDynamicallyHiddenIdentifiers:(id)a3
{
}

- (double)itemDynamicScale
{
  return self->_itemDynamicScale;
}

- (double)minItemDynamicScale
{
  return self->_minItemDynamicScale;
}

- (double)minInterspaceDynamicScale
{
  return self->_minInterspaceDynamicScale;
}

- (STUIStatusBarRegionAxisSquishyLayoutDynamicHidingDelegate)dynamicHidingDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dynamicHidingDelegate);
  return (STUIStatusBarRegionAxisSquishyLayoutDynamicHidingDelegate *)WeakRetained;
}

@end