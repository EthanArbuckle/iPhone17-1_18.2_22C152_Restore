@interface UIStatusBarRegionAxisCenteringLayout
@end

@implementation UIStatusBarRegionAxisCenteringLayout

void __102___UIStatusBarRegionAxisCenteringLayout_constraintsForDisplayItems_layoutGuides_inContainerItem_axis___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v84 = a2;
  uint64_t v6 = [v84 layoutItem];
  v7 = (void *)v6;
  if (!a3)
  {
    v20 = *(void **)(a1 + 32);
    uint64_t v21 = *(void *)(a1 + 96);
    id v22 = *(id *)(a1 + 40);
    v23 = v22;
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
    v49 = v48;
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
    v23 = (void *)v50;
LABEL_40:

    v51 = [v3 constraintEqualToAnchor:v23];
    [v20 addObject:v51];

    v52 = *(void **)(a1 + 32);
    uint64_t v53 = *(void *)(a1 + 96);
    id v54 = *(id *)(a1 + 40);
    v18 = v54;
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
    v23 = (void *)v55;
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
    v18 = (void *)v59;
    goto LABEL_50;
  }
  v83 = (void *)v6;
  v8 = [v84 layoutItem];
  v9 = [*(id *)(a1 + 56) objectAtIndexedSubscript:a3 - 1];
  v10 = [v9 layoutItem];

  id v11 = *(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40);
  v12 = objc_alloc_init(UILayoutGuide);
  uint64_t v13 = *(void *)(*(void *)(a1 + 88) + 8);
  v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v12;

  v15 = *(void **)(a1 + 32);
  v16 = *(void **)(a1 + 96);
  id v17 = v10;
  v18 = v17;
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

  v30 = *(void **)(a1 + 32);
  uint64_t v31 = *(void *)(a1 + 96);
  id v32 = *(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40);
  v33 = v32;
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
  v23 = v36;
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
  v33 = (void *)v37;
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
    v30 = (void *)v42;
LABEL_53:

    uint64_t v60 = *(void *)(a1 + 96);
    id v61 = v11;
    v62 = v61;
    if (v60 == 1)
    {
      uint64_t v63 = [v61 heightAnchor];
    }
    else
    {
      if (v60)
      {
LABEL_61:

        v64 = [v30 constraintEqualToAnchor:v41];
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
    v30 = (void *)v46;
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
  v23 = v67;
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
  v30 = (void *)v68;
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

  v73 = [v30 constraintEqualToAnchor:v10];
  [v65 addObject:v73];

  v74 = *(void **)(a1 + 32);
  uint64_t v75 = *(void *)(a1 + 96);
  id v76 = *(id *)(a1 + 80);
  v77 = v76;
  if (v75 == 1)
  {
    v30 = [v76 bottomAnchor];
    v7 = v83;
  }
  else
  {
    v7 = v83;
    if (!v75)
    {
      v30 = [v76 trailingAnchor];
    }
  }

  uint64_t v78 = *(void *)(a1 + 96);
  id v79 = *(id *)(a1 + 48);
  v80 = v79;
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

@end