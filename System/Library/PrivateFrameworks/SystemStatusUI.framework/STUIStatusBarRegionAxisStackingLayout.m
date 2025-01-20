@interface STUIStatusBarRegionAxisStackingLayout
- (BOOL)canOverflowItems;
- (BOOL)hugging;
- (double)interspace;
- (id)constraintsForDisplayItems:(id)a3 layoutGuides:(id)a4 inContainerItem:(id)a5 axis:(int64_t)a6;
- (int64_t)alignment;
- (void)setAlignment:(int64_t)a3;
- (void)setHugging:(BOOL)a3;
- (void)setInterspace:(double)a3;
@end

@implementation STUIStatusBarRegionAxisStackingLayout

- (void)setInterspace:(double)a3
{
  self->_interspace = a3;
}

- (void)setAlignment:(int64_t)a3
{
  self->_alignment = a3;
}

- (id)constraintsForDisplayItems:(id)a3 layoutGuides:(id)a4 inContainerItem:(id)a5 axis:(int64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = [MEMORY[0x1E4F1CA48] array];
  int64_t alignment = self->_alignment;
  v46 = v11;
  if (a6 == 1)
  {
    int v16 = 0;
    double v17 = 1.0;
    uint64_t v19 = 3;
    uint64_t v21 = 4;
    uint64_t v24 = 11;
    int64_t v20 = self->_alignment;
    uint64_t v22 = v20;
    uint64_t v23 = v20;
    switch(alignment)
    {
      case 1:
        int v16 = 1;
        uint64_t v23 = 3;
        uint64_t v22 = 10;
        uint64_t v21 = 4;
        break;
      case 3:
        break;
      case 4:
LABEL_21:
        if ((alignment & 0xFFFFFFFFFFFFFFFDLL) == 4) {
          double v17 = -1.0;
        }
        else {
          double v17 = 1.0;
        }
        uint64_t v21 = v19;
        goto LABEL_25;
      case 5:
        goto LABEL_10;
      default:
        goto LABEL_14;
    }
  }
  else if (a6)
  {
    if (alignment == 1)
    {
      uint64_t v24 = 0;
LABEL_10:
      int v16 = 0;
      if ((alignment & 0xFFFFFFFFFFFFFFFDLL) == 4) {
        double v17 = -1.0;
      }
      else {
        double v17 = 1.0;
      }
      uint64_t v21 = v24;
      uint64_t v22 = v24;
      uint64_t v23 = v24;
    }
    else
    {
LABEL_14:
      uint64_t v21 = 0;
      if ((alignment & 0xFFFFFFFFFFFFFFFDLL) == 4) {
        double v17 = -1.0;
      }
      else {
        double v17 = 1.0;
      }
      if ((alignment | 2) == 6)
      {
        int64_t v20 = 0;
LABEL_25:
        v25 = [v10 reverseObjectEnumerator];
        uint64_t v26 = [v25 allObjects];

        int v16 = 0;
        uint64_t v22 = v20;
        uint64_t v23 = v20;
        id v10 = (id)v26;
      }
      else
      {
        int v16 = 0;
        uint64_t v22 = 0;
        uint64_t v23 = 0;
      }
    }
  }
  else
  {
    int v15 = 0;
    int v16 = 0;
    double v17 = 1.0;
    uint64_t v18 = 5;
    uint64_t v19 = 1;
    int64_t v20 = 2;
    uint64_t v21 = 2;
    uint64_t v22 = 1;
    uint64_t v23 = 1;
    switch(alignment)
    {
      case 1:
        int v15 = 1;
        uint64_t v18 = 9;
        goto LABEL_5;
      case 3:
LABEL_5:
        uint64_t v23 = 5;
        uint64_t v21 = 6;
        uint64_t v22 = v18;
        int v16 = v15;
        break;
      case 4:
        uint64_t v19 = 5;
        int64_t v20 = 6;
        goto LABEL_21;
      case 5:
        break;
      case 6:
        goto LABEL_21;
      default:
        goto LABEL_14;
    }
  }
  uint64_t v45 = v22;
  v47[0] = MEMORY[0x1E4F143A8];
  v47[1] = 3221225472;
  v47[2] = __102__STUIStatusBarRegionAxisStackingLayout_constraintsForDisplayItems_layoutGuides_inContainerItem_axis___block_invoke;
  v47[3] = &unk_1E6AA4528;
  id v27 = v10;
  id v48 = v27;
  id v28 = v13;
  uint64_t v52 = v23;
  uint64_t v53 = v21;
  double v54 = v17;
  id v49 = v28;
  v50 = self;
  char v55 = v16;
  id v29 = v12;
  id v51 = v29;
  [v27 enumerateObjectsUsingBlock:v47];
  v30 = [v27 lastObject];
  v31 = [v30 layoutItem];

  if (v16)
  {
    id v32 = objc_alloc_init(MEMORY[0x1E4FB1940]);
    v33 = [v27 firstObject];
    v34 = [v33 layoutItem];

    v35 = [v27 lastObject];
    v36 = [v35 layoutItem];

    v37 = [MEMORY[0x1E4F28DC8] constraintWithItem:v32 attribute:v23 relatedBy:0 toItem:v34 attribute:v23 multiplier:1.0 constant:0.0];
    [v28 addObject:v37];

    v38 = [MEMORY[0x1E4F28DC8] constraintWithItem:v32 attribute:v21 relatedBy:0 toItem:v36 attribute:v21 multiplier:1.0 constant:0.0];
    [v28 addObject:v38];

    v39 = [MEMORY[0x1E4F28DC8] constraintWithItem:v32 attribute:v45 relatedBy:0 toItem:v29 attribute:v45 multiplier:1.0 constant:0.0];
    [v28 addObject:v39];

    v40 = v46;
    [v46 addObject:v32];
  }
  else
  {
    if (self->_hugging)
    {
      id v32 = [MEMORY[0x1E4F28DC8] constraintWithItem:v31 attribute:v21 relatedBy:0 toItem:v29 attribute:v21 multiplier:1.0 constant:0.0];
    }
    else
    {
      if (v17 == 1.0) {
        uint64_t v41 = -1;
      }
      else {
        uint64_t v41 = 1;
      }
      objc_msgSend(MEMORY[0x1E4F28DC8], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v31, v21, v41, v29, v21);
      id v32 = (id)objc_claimAutoreleasedReturnValue();
      LODWORD(v42) = 1132134400;
      [v32 setPriority:v42];
    }
    [v28 addObject:v32];
    v40 = v46;
  }

  id v43 = v28;
  return v43;
}

uint64_t __102__STUIStatusBarRegionAxisStackingLayout_constraintsForDisplayItems_layoutGuides_inContainerItem_axis___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = [a2 layoutItem];
  uint64_t v6 = v5;
  if (a3
    && (uint64_t v13 = v5,
        [*(id *)(a1 + 32) objectAtIndexedSubscript:a3 - 1],
        v7 = objc_claimAutoreleasedReturnValue(),
        [v7 layoutItem],
        v8 = objc_claimAutoreleasedReturnValue(),
        v7,
        uint64_t v6 = v13,
        v8))
  {
    v9 = *(void **)(a1 + 40);
    id v10 = [MEMORY[0x1E4F28DC8] constraintWithItem:v13 attribute:*(void *)(a1 + 64) relatedBy:0 toItem:v8 attribute:*(void *)(a1 + 72) multiplier:1.0 constant:*(double *)(a1 + 80) * *(double *)(*(void *)(a1 + 48) + 24)];
    [v9 addObject:v10];
  }
  else
  {
    if (*(unsigned char *)(a1 + 88)) {
      goto LABEL_7;
    }
    id v11 = *(void **)(a1 + 40);
    uint64_t v13 = v6;
    v8 = [MEMORY[0x1E4F28DC8] constraintWithItem:v6 attribute:*(void *)(a1 + 64) relatedBy:0 toItem:*(void *)(a1 + 56) attribute:*(void *)(a1 + 64) multiplier:1.0 constant:0.0];
    [v11 addObject:v8];
  }

  uint64_t v6 = v13;
LABEL_7:
  return MEMORY[0x1F41817F8](v5, v6);
}

- (BOOL)canOverflowItems
{
  return 1;
}

- (int64_t)alignment
{
  return self->_alignment;
}

- (double)interspace
{
  return self->_interspace;
}

- (BOOL)hugging
{
  return self->_hugging;
}

- (void)setHugging:(BOOL)a3
{
  self->_hugging = a3;
}

@end