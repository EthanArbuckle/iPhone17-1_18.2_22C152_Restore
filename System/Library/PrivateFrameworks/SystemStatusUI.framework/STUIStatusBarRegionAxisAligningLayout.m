@interface STUIStatusBarRegionAxisAligningLayout
+ (id)aligningLayoutWithAlignment:(int64_t)a3;
- (BOOL)canOverflowItems;
- (id)constraintsForDisplayItems:(id)a3 layoutGuides:(id)a4 inContainerItem:(id)a5 axis:(int64_t)a6;
- (int64_t)alignment;
- (void)setAlignment:(int64_t)a3;
@end

@implementation STUIStatusBarRegionAxisAligningLayout

- (id)constraintsForDisplayItems:(id)a3 layoutGuides:(id)a4 inContainerItem:(id)a5 axis:(int64_t)a6
{
  id v9 = a5;
  v10 = (void *)MEMORY[0x1E4F1CA48];
  id v11 = a3;
  v12 = [v10 array];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __102__STUIStatusBarRegionAxisAligningLayout_constraintsForDisplayItems_layoutGuides_inContainerItem_axis___block_invoke;
  v18[3] = &unk_1E6AA4358;
  int64_t v21 = a6;
  v18[4] = self;
  id v13 = v12;
  id v19 = v13;
  id v20 = v9;
  id v14 = v9;
  [v11 enumerateObjectsUsingBlock:v18];

  v15 = v20;
  id v16 = v13;

  return v16;
}

+ (id)aligningLayoutWithAlignment:(int64_t)a3
{
  v4 = objc_alloc_init(STUIStatusBarRegionAxisAligningLayout);
  [(STUIStatusBarRegionAxisAligningLayout *)v4 setAlignment:a3];
  return v4;
}

- (void)setAlignment:(int64_t)a3
{
  self->_alignment = a3;
}

void __102__STUIStatusBarRegionAxisAligningLayout_constraintsForDisplayItems_layoutGuides_inContainerItem_axis___block_invoke(uint64_t a1, void *a2)
{
  id v52 = a2;
  v4 = [v52 layoutItem];
  uint64_t v5 = [v52 overriddenVerticalAlignment];
  uint64_t v6 = v5;
  if (*(void *)(a1 + 56) != 1 || v5 == 0) {
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  }
  if ((v6 & 0xFFFFFFFFFFFFFFFELL) == 6)
  {
    v8 = [v52 displayable];
    if (v6 == 7)
    {
      if (objc_opt_respondsToSelector() & 1) != 0 && ([v8 prefersCenterVerticalAlignment])
      {
LABEL_15:
        uint64_t v6 = 1;
        goto LABEL_16;
      }
    }
    else if ((objc_opt_respondsToSelector() & 1) == 0 || ([v8 prefersBaselineAlignment] & 1) == 0)
    {
      goto LABEL_15;
    }
    uint64_t v6 = 5;
LABEL_16:
  }
  if (v6 == 2)
  {
    id v14 = *(void **)(a1 + 40);
    v15 = *(void **)(a1 + 56);
    id v16 = v4;
    v17 = v16;
    if (v15 == (void *)1)
    {
      uint64_t v18 = [v16 topAnchor];
    }
    else
    {
      if (v15) {
        goto LABEL_36;
      }
      uint64_t v18 = [v16 leadingAnchor];
    }
    v2 = (void *)v18;
LABEL_36:

    uint64_t v25 = *(void *)(a1 + 56);
    id v26 = *(id *)(a1 + 48);
    v27 = v26;
    if (v25 == 1)
    {
      uint64_t v28 = [v26 topAnchor];
    }
    else
    {
      if (v25) {
        goto LABEL_41;
      }
      uint64_t v28 = [v26 leadingAnchor];
    }
    v15 = (void *)v28;
LABEL_41:

    v29 = [v2 constraintEqualToAnchor:v15];
    LODWORD(v30) = 1112276992;
    v31 = objc_msgSend(v29, "_ui_constraintWithPriority:", v30);
    [v14 addObject:v31];

    v32 = *(void **)(a1 + 40);
    v33 = *(void **)(a1 + 56);
    id v34 = v17;
    v12 = v34;
    if (v33 == (void *)1)
    {
      uint64_t v35 = [v34 bottomAnchor];
    }
    else
    {
      if (v33) {
        goto LABEL_46;
      }
      uint64_t v35 = [v34 trailingAnchor];
    }
    v2 = (void *)v35;
LABEL_46:

    uint64_t v36 = *(void *)(a1 + 56);
    id v37 = *(id *)(a1 + 48);
    v38 = v37;
    if (v36 == 1)
    {
      uint64_t v39 = [v37 bottomAnchor];
    }
    else
    {
      if (v36) {
        goto LABEL_51;
      }
      uint64_t v39 = [v37 trailingAnchor];
    }
    v33 = (void *)v39;
LABEL_51:

    v40 = [v2 constraintEqualToAnchor:v33];
    LODWORD(v41) = 1112276992;
    v42 = objc_msgSend(v40, "_ui_constraintWithPriority:", v41);
    [v32 addObject:v42];

    id v11 = *(void **)(a1 + 40);
    uint64_t v43 = *(void *)(a1 + 56);
    id v44 = v12;
    v45 = v44;
    if (v43 == 1)
    {
      uint64_t v46 = [v44 centerYAnchor];
    }
    else
    {
      if (v43) {
        goto LABEL_56;
      }
      uint64_t v46 = [v44 centerXAnchor];
    }
    v12 = (void *)v46;
LABEL_56:

    uint64_t v47 = *(void *)(a1 + 56);
    id v48 = *(id *)(a1 + 48);
    v49 = v48;
    if (v47 == 1)
    {
      uint64_t v50 = [v48 centerYAnchor];
    }
    else
    {
      if (v47)
      {
LABEL_61:

        uint64_t v13 = [v12 constraintEqualToAnchor:a1];
        goto LABEL_62;
      }
      uint64_t v50 = [v48 centerXAnchor];
    }
    a1 = v50;
    goto LABEL_61;
  }
  if (v6 != 5)
  {
    uint64_t v19 = *(void *)(a1 + 56);
    if (v19 == 1)
    {
      [v52 centerOffset];
      uint64_t v19 = *(void *)(a1 + 56);
    }
    else
    {
      double v20 = 0.0;
    }
    unint64_t v21 = v6 - 1;
    if (v19)
    {
      if (v21 < 5)
      {
        v22 = &unk_1D7ED6458;
LABEL_31:
        uint64_t v23 = v22[v21];
LABEL_33:
        v24 = *(void **)(a1 + 40);
        v12 = [MEMORY[0x1E4F28DC8] constraintWithItem:v4 attribute:v23 relatedBy:0 toItem:*(void *)(a1 + 48) attribute:v23 multiplier:1.0 constant:-v20];
        [v24 addObject:v12];
        goto LABEL_63;
      }
    }
    else if (v21 < 6)
    {
      v22 = &unk_1D7ED6428;
      goto LABEL_31;
    }
    uint64_t v23 = 0;
    goto LABEL_33;
  }
  [v52 baselineOffset];
  double v10 = v9;
  id v11 = *(void **)(a1 + 40);
  v12 = [v4 lastBaselineAnchor];
  a1 = [*(id *)(a1 + 48) bottomAnchor];
  uint64_t v13 = [v12 constraintEqualToAnchor:a1 constant:-v10];
LABEL_62:
  v51 = (void *)v13;
  [v11 addObject:v13];

LABEL_63:
}

- (BOOL)canOverflowItems
{
  return 0;
}

- (int64_t)alignment
{
  return self->_alignment;
}

@end