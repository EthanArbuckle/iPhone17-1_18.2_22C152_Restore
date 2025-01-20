@interface STUIStatusBarRegionAxisCenteringLayout
- (BOOL)canOverflowItems;
- (BOOL)mayFitDisplayItems:(id)a3 inContainerItem:(id)a4 axis:(int64_t)a5;
- (STUIStatusBarRegionAxisCenteringLayout)init;
- (double)interspace;
- (double)margin;
- (id)constraintsForDisplayItems:(id)a3 layoutGuides:(id)a4 inContainerItem:(id)a5 axis:(int64_t)a6;
- (int64_t)maxNumberOfItems;
- (void)setInterspace:(double)a3;
- (void)setMargin:(double)a3;
- (void)setMaxNumberOfItems:(int64_t)a3;
@end

@implementation STUIStatusBarRegionAxisCenteringLayout

- (void)setMaxNumberOfItems:(int64_t)a3
{
  self->_maxNumberOfItems = a3;
}

- (STUIStatusBarRegionAxisCenteringLayout)init
{
  v8.receiver = self;
  v8.super_class = (Class)STUIStatusBarRegionAxisCenteringLayout;
  result = [(STUIStatusBarRegionAxisCenteringLayout *)&v8 init];
  __asm { FMOV            V0.2D, #-1.0 }
  *(_OWORD *)&result->_interspace = _Q0;
  result->_maxNumberOfItems = 0x7FFFFFFFFFFFFFFFLL;
  return result;
}

- (id)constraintsForDisplayItems:(id)a3 layoutGuides:(id)a4 inContainerItem:(id)a5 axis:(int64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v14 = (void *)[v11 count];
  v15 = [MEMORY[0x1E4F1CA48] array];
  if (v14 == (void *)1)
  {
    v16 = [v11 firstObject];
    v17 = [v16 layoutItem];

    id v18 = v17;
    v19 = v18;
    if (a6 == 1)
    {
      uint64_t v20 = [v18 centerYAnchor];
    }
    else
    {
      if (a6) {
        goto LABEL_14;
      }
      uint64_t v20 = [v18 centerXAnchor];
    }
    v6 = (void *)v20;
LABEL_14:

    v32 = v13;
    id v33 = v13;
    v34 = v33;
    if (a6 == 1)
    {
      uint64_t v35 = [v33 centerYAnchor];
    }
    else
    {
      if (a6) {
        goto LABEL_19;
      }
      uint64_t v35 = [v33 centerXAnchor];
    }
    v16 = (void *)v35;
LABEL_19:

    v36 = [v6 constraintEqualToAnchor:v16];
    [v15 addObject:v36];

    id v37 = v19;
    v38 = v37;
    if (a6 == 1)
    {
      uint64_t v39 = [v37 topAnchor];
    }
    else
    {
      if (a6) {
        goto LABEL_24;
      }
      uint64_t v39 = [v37 leadingAnchor];
    }
    v6 = (void *)v39;
LABEL_24:

    id v40 = v34;
    v41 = v40;
    if (a6 == 1)
    {
      uint64_t v42 = [v40 topAnchor];
    }
    else
    {
      if (a6) {
        goto LABEL_29;
      }
      uint64_t v42 = [v40 leadingAnchor];
    }
    v16 = (void *)v42;
LABEL_29:

    v43 = [v6 constraintGreaterThanOrEqualToAnchor:v16];
    [v15 addObject:v43];

    id v44 = v38;
    v45 = v44;
    if (a6 == 1)
    {
      uint64_t v46 = [v44 bottomAnchor];
    }
    else
    {
      if (a6) {
        goto LABEL_34;
      }
      uint64_t v46 = [v44 trailingAnchor];
    }
    v6 = (void *)v46;
LABEL_34:

    id v47 = v41;
    v48 = v47;
    if (a6 == 1)
    {
      uint64_t v49 = [v47 bottomAnchor];
    }
    else
    {
      if (a6)
      {
LABEL_39:

        v50 = [v6 constraintLessThanOrEqualToAnchor:v16];
        [v15 addObject:v50];

        goto LABEL_69;
      }
      uint64_t v49 = [v47 trailingAnchor];
    }
    v16 = (void *)v49;
    goto LABEL_39;
  }
  id v21 = objc_alloc_init(MEMORY[0x1E4FB1940]);
  id v70 = objc_alloc_init(MEMORY[0x1E4FB1940]);
  v22 = v82;
  v82[0] = 0;
  v82[1] = v82;
  v82[2] = 0x3032000000;
  v82[3] = __Block_byref_object_copy__5;
  v82[4] = __Block_byref_object_dispose__5;
  id v83 = 0;
  v71[0] = MEMORY[0x1E4F143A8];
  v71[1] = 3221225472;
  v71[2] = __103__STUIStatusBarRegionAxisCenteringLayout_constraintsForDisplayItems_layoutGuides_inContainerItem_axis___block_invoke;
  v71[3] = &unk_1E6AA4940;
  v66 = v15;
  id v23 = v15;
  id v72 = v23;
  id v24 = v21;
  id v73 = v24;
  int64_t v80 = a6;
  id v68 = v13;
  id v74 = v13;
  id v69 = v11;
  v79 = v82;
  id v75 = v11;
  v76 = self;
  id v25 = v12;
  id v77 = v25;
  v81 = v14;
  id v26 = v70;
  id v78 = v26;
  [v75 enumerateObjectsUsingBlock:v71];
  double margin = self->_margin;
  id v28 = v24;
  v29 = v28;
  if (margin != -1.0)
  {
    if (a6 == 1)
    {
      uint64_t v31 = [v28 heightAnchor];
    }
    else
    {
      if (a6) {
        goto LABEL_61;
      }
      uint64_t v31 = [v28 widthAnchor];
    }
    v14 = (void *)v31;
LABEL_61:

    v61 = [v14 constraintEqualToConstant:self->_margin];
    [v23 addObject:v61];

    id v62 = v26;
    v63 = v62;
    if (a6 == 1)
    {
      uint64_t v64 = [v62 heightAnchor];
    }
    else
    {
      if (a6)
      {
LABEL_66:

        self = [v14 constraintEqualToConstant:self->_margin];
        [v23 addObject:self];
        goto LABEL_67;
      }
      uint64_t v64 = [v62 widthAnchor];
    }
    v14 = (void *)v64;
    goto LABEL_66;
  }
  if (a6 == 1)
  {
    uint64_t v30 = [v28 heightAnchor];
  }
  else
  {
    if (a6) {
      goto LABEL_42;
    }
    uint64_t v30 = [v28 widthAnchor];
  }
  v14 = (void *)v30;
LABEL_42:

  id v51 = v26;
  v52 = v51;
  if (a6 == 1)
  {
    uint64_t v53 = [v51 heightAnchor];
  }
  else
  {
    if (a6) {
      goto LABEL_47;
    }
    uint64_t v53 = [v51 widthAnchor];
  }
  v22 = (void *)v53;
LABEL_47:

  v54 = [v14 constraintEqualToAnchor:v22];
  [v23 addObject:v54];

  if (self->_interspace == -1.0)
  {
    id v55 = [v25 lastObject];
    v14 = v55;
    if (a6 == 1)
    {
      v56 = [v55 heightAnchor];
    }
    else
    {
      if (a6) {
        goto LABEL_53;
      }
      v56 = [v55 widthAnchor];
    }
    self = v56;
LABEL_53:

    id v57 = v29;
    v58 = v57;
    if (a6 == 1)
    {
      uint64_t v59 = [v57 heightAnchor];
    }
    else
    {
      if (a6)
      {
LABEL_58:

        v60 = [(STUIStatusBarRegionAxisCenteringLayout *)self constraintEqualToAnchor:v22];
        [v23 addObject:v60];

LABEL_67:
        goto LABEL_68;
      }
      uint64_t v59 = [v57 widthAnchor];
    }
    v22 = (void *)v59;
    goto LABEL_58;
  }
LABEL_68:
  objc_msgSend(v25, "addObject:", v29, v66);
  [v25 addObject:v26];

  _Block_object_dispose(v82, 8);
  id v11 = v69;
  v15 = v67;
  v32 = v68;
LABEL_69:

  return v15;
}

void __103__STUIStatusBarRegionAxisCenteringLayout_constraintsForDisplayItems_layoutGuides_inContainerItem_axis___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v84 = a2;
  uint64_t v6 = [v84 layoutItem];
  v7 = (void *)v6;
  if (!a3)
  {
    uint64_t v20 = *(void **)(a1 + 32);
    uint64_t v21 = *(void *)(a1 + 96);
    id v22 = *(id *)(a1 + 40);
    id v23 = v22;
    if (v21 == 1)
    {
      uint64_t v24 = [v22 topAnchor];
    }
    else
    {
      if (v21) {
        goto LABEL_35;
      }
      uint64_t v24 = [v22 leadingAnchor];
    }
    v3 = (void *)v24;
LABEL_35:

    uint64_t v47 = *(void *)(a1 + 96);
    id v48 = *(id *)(a1 + 48);
    uint64_t v49 = v48;
    if (v47 == 1)
    {
      uint64_t v50 = [v48 topAnchor];
    }
    else
    {
      if (v47) {
        goto LABEL_40;
      }
      uint64_t v50 = [v48 leadingAnchor];
    }
    id v23 = (void *)v50;
LABEL_40:

    id v51 = [v3 constraintEqualToAnchor:v23];
    [v20 addObject:v51];

    v52 = *(void **)(a1 + 32);
    uint64_t v53 = *(void *)(a1 + 96);
    id v54 = *(id *)(a1 + 40);
    id v18 = v54;
    if (v53 == 1)
    {
      uint64_t v55 = [v54 bottomAnchor];
    }
    else
    {
      if (v53) {
        goto LABEL_45;
      }
      uint64_t v55 = [v54 trailingAnchor];
    }
    id v23 = (void *)v55;
LABEL_45:

    uint64_t v56 = *(void *)(a1 + 96);
    id v57 = v7;
    v58 = v57;
    if (v56 == 1)
    {
      uint64_t v59 = [v57 topAnchor];
    }
    else
    {
      if (v56)
      {
LABEL_50:

        id v11 = [v23 constraintEqualToAnchor:v18];
        [v52 addObject:v11];
        goto LABEL_85;
      }
      uint64_t v59 = [v57 leadingAnchor];
    }
    id v18 = (void *)v59;
    goto LABEL_50;
  }
  id v83 = (void *)v6;
  objc_super v8 = [v84 layoutItem];
  v9 = [*(id *)(a1 + 56) objectAtIndexedSubscript:a3 - 1];
  v10 = [v9 layoutItem];

  id v11 = *(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40);
  id v12 = objc_alloc_init(MEMORY[0x1E4FB1940]);
  uint64_t v13 = *(void *)(*(void *)(a1 + 88) + 8);
  v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v12;

  v15 = *(void **)(a1 + 32);
  v16 = *(void **)(a1 + 96);
  id v17 = v10;
  id v18 = v17;
  if (v16 == (void *)1)
  {
    uint64_t v19 = [v17 bottomAnchor];
  }
  else
  {
    if (v16) {
      goto LABEL_10;
    }
    uint64_t v19 = [v17 trailingAnchor];
  }
  v10 = (void *)v19;
LABEL_10:

  uint64_t v25 = *(void *)(a1 + 96);
  id v26 = *(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40);
  v27 = v26;
  if (v25 == 1)
  {
    uint64_t v28 = [v26 topAnchor];
  }
  else
  {
    if (v25) {
      goto LABEL_15;
    }
    uint64_t v28 = [v26 leadingAnchor];
  }
  v16 = (void *)v28;
LABEL_15:

  v29 = [v10 constraintEqualToAnchor:v16];
  [v15 addObject:v29];

  uint64_t v30 = *(void **)(a1 + 32);
  uint64_t v31 = *(void *)(a1 + 96);
  id v32 = *(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40);
  id v33 = v32;
  if (v31 == 1)
  {
    uint64_t v34 = [v32 bottomAnchor];
  }
  else
  {
    if (v31) {
      goto LABEL_20;
    }
    uint64_t v34 = [v32 trailingAnchor];
  }
  v10 = (void *)v34;
LABEL_20:

  uint64_t v35 = *(void *)(a1 + 96);
  id v36 = v8;
  id v23 = v36;
  if (v35 == 1)
  {
    uint64_t v37 = [v36 topAnchor];
  }
  else
  {
    if (v35) {
      goto LABEL_25;
    }
    uint64_t v37 = [v36 leadingAnchor];
  }
  id v33 = (void *)v37;
LABEL_25:

  v38 = [v10 constraintEqualToAnchor:v33];
  [v30 addObject:v38];

  if (*(double *)(*(void *)(a1 + 64) + 8) == -1.0)
  {
    if (!v11) {
      goto LABEL_63;
    }
    v10 = *(void **)(a1 + 32);
    uint64_t v39 = *(void *)(a1 + 96);
    id v40 = *(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40);
    v41 = v40;
    if (v39 == 1)
    {
      uint64_t v42 = [v40 heightAnchor];
    }
    else
    {
      if (v39) {
        goto LABEL_53;
      }
      uint64_t v42 = [v40 widthAnchor];
    }
    uint64_t v30 = (void *)v42;
LABEL_53:

    uint64_t v60 = *(void *)(a1 + 96);
    id v61 = v11;
    id v62 = v61;
    if (v60 == 1)
    {
      uint64_t v63 = [v61 heightAnchor];
    }
    else
    {
      if (v60)
      {
LABEL_61:

        uint64_t v64 = [v30 constraintEqualToAnchor:v41];
        [v10 addObject:v64];

        goto LABEL_62;
      }
      uint64_t v63 = [v61 widthAnchor];
    }
    v41 = (void *)v63;
    goto LABEL_61;
  }
  v10 = *(void **)(a1 + 32);
  uint64_t v43 = *(void *)(a1 + 96);
  id v44 = *(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40);
  v45 = v44;
  if (v43 == 1)
  {
    uint64_t v46 = [v44 heightAnchor];
    goto LABEL_57;
  }
  if (!v43)
  {
    uint64_t v46 = [v44 widthAnchor];
LABEL_57:
    uint64_t v30 = (void *)v46;
  }

  v41 = [v30 constraintEqualToConstant:*(double *)(*(void *)(a1 + 64) + 8)];
  [v10 addObject:v41];
LABEL_62:

LABEL_63:
  [*(id *)(a1 + 72) addObject:*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40)];
  if (*(void *)(a1 + 104) - 1 != a3)
  {
    v7 = v83;
    goto LABEL_85;
  }
  v65 = *(void **)(a1 + 32);
  uint64_t v66 = *(void *)(a1 + 96);
  id v67 = v23;
  id v23 = v67;
  if (v66 == 1)
  {
    uint64_t v68 = [v67 bottomAnchor];
  }
  else
  {
    if (v66) {
      goto LABEL_70;
    }
    uint64_t v68 = [v67 trailingAnchor];
  }
  uint64_t v30 = (void *)v68;
LABEL_70:

  uint64_t v69 = *(void *)(a1 + 96);
  id v70 = *(id *)(a1 + 80);
  v71 = v70;
  if (v69 == 1)
  {
    uint64_t v72 = [v70 topAnchor];
  }
  else
  {
    if (v69) {
      goto LABEL_75;
    }
    uint64_t v72 = [v70 leadingAnchor];
  }
  v10 = (void *)v72;
LABEL_75:

  id v73 = [v30 constraintEqualToAnchor:v10];
  [v65 addObject:v73];

  id v74 = *(void **)(a1 + 32);
  uint64_t v75 = *(void *)(a1 + 96);
  id v76 = *(id *)(a1 + 80);
  id v77 = v76;
  if (v75 == 1)
  {
    uint64_t v30 = [v76 bottomAnchor];
    v7 = v83;
  }
  else
  {
    v7 = v83;
    if (!v75)
    {
      uint64_t v30 = [v76 trailingAnchor];
    }
  }

  uint64_t v78 = *(void *)(a1 + 96);
  id v79 = *(id *)(a1 + 48);
  int64_t v80 = v79;
  if (v78 == 1)
  {
    uint64_t v81 = [v79 bottomAnchor];
    goto LABEL_83;
  }
  if (!v78)
  {
    uint64_t v81 = [v79 trailingAnchor];
LABEL_83:
    a1 = v81;
  }

  v82 = [v30 constraintEqualToAnchor:a1];
  [v74 addObject:v82];

LABEL_85:
}

- (BOOL)canOverflowItems
{
  return 1;
}

- (BOOL)mayFitDisplayItems:(id)a3 inContainerItem:(id)a4 axis:(int64_t)a5
{
  return (unint64_t)[a3 count] <= self->_maxNumberOfItems;
}

- (double)interspace
{
  return self->_interspace;
}

- (void)setInterspace:(double)a3
{
  self->_interspace = a3;
}

- (double)margin
{
  return self->_margin;
}

- (void)setMargin:(double)a3
{
  self->_double margin = a3;
}

- (int64_t)maxNumberOfItems
{
  return self->_maxNumberOfItems;
}

@end