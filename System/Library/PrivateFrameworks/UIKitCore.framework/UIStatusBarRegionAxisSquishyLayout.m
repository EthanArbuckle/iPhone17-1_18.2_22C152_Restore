@interface UIStatusBarRegionAxisSquishyLayout
@end

@implementation UIStatusBarRegionAxisSquishyLayout

void __100___UIStatusBarRegionAxisSquishyLayout_constraintsForDisplayItems_layoutGuides_inContainerItem_axis___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v42 = a2;
  v5 = [v42 layoutItem];
  int v6 = [*(id *)(a1 + 32) containsObject:v42];
  if (a3)
  {
    v7 = [*(id *)(a1 + 40) objectAtIndexedSubscript:a3 - 1];
    v8 = [v7 layoutItem];
  }
  uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
  if (v9
    && ([*(id *)(a1 + 32) objectAtIndexedSubscript:v9 - 1],
        v10 = objc_claimAutoreleasedReturnValue(),
        [v10 layoutItem],
        v11 = objc_claimAutoreleasedReturnValue(),
        v10,
        v11))
  {
    if (*(double *)(*(void *)(a1 + 48) + 24) == -1.0) {
      goto LABEL_19;
    }
    v12 = objc_alloc_init(UILayoutGuide);
    v13 = *(void **)(a1 + 56);
    v14 = (void *)MEMORY[0x1E4F5B268];
    uint64_t v15 = *(void *)(a1 + 104);
    uint64_t v16 = *(void *)(a1 + 112);
    double v17 = 0.0;
    if ((v6 & 1) == 0)
    {
      objc_msgSend(v5, "_ui_bounds");
      double v17 = v18 * 0.5 + *(double *)(*(void *)(a1 + 48) + 24) * 0.5 * *(double *)(a1 + 120);
    }
    v19 = [v14 constraintWithItem:v5 attribute:v15 relatedBy:0 toItem:v12 attribute:v16 multiplier:1.0 constant:v17];
    [v13 addObject:v19];

    v20 = *(void **)(a1 + 56);
    v21 = [MEMORY[0x1E4F5B268] constraintWithItem:v12 attribute:*(void *)(a1 + 104) relatedBy:0 toItem:v11 attribute:*(void *)(a1 + 112) multiplier:1.0 constant:0.0];
    [v20 addObject:v21];

    v22 = *(void **)(a1 + 56);
    v23 = [MEMORY[0x1E4F5B268] constraintWithItem:v12 attribute:*(void *)(a1 + 128) relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:*(double *)(*(void *)(a1 + 48) + 24) * *(double *)(a1 + 120)];
    [v22 addObject:v23];

    uint64_t v24 = *(void *)(*(void *)(a1 + 88) + 8);
    uint64_t v25 = *(void *)(v24 + 40);
    if (v25)
    {
      v26 = *(void **)(a1 + 56);
      v27 = [MEMORY[0x1E4F5B268] constraintWithItem:v12 attribute:*(void *)(a1 + 128) relatedBy:0 toItem:v25 attribute:*(void *)(a1 + 128) multiplier:1.0 constant:0.0];
      [v26 addObject:v27];

      uint64_t v24 = *(void *)(*(void *)(a1 + 88) + 8);
      v28 = *(void **)(v24 + 40);
    }
    else
    {
      v28 = 0;
    }
    *(void *)(v24 + 40) = v12;
    v31 = v12;

    v33 = (id *)(a1 + 64);
  }
  else
  {
    if (*(double *)(a1 + 96) == 1.0) {
      uint64_t v29 = 1;
    }
    else {
      uint64_t v29 = -1;
    }
    v30 = [MEMORY[0x1E4F5B268] constraintWithItem:v5 attribute:*(void *)(a1 + 104) relatedBy:v29 toItem:*(void *)(a1 + 72) attribute:*(void *)(a1 + 104) multiplier:1.0 constant:0.0];
    v31 = v30;
    LODWORD(v32) = 1144733696;
    if (!*(unsigned char *)(*(void *)(a1 + 48) + 8)) {
      *(float *)&double v32 = 49.0;
    }
    [(UILayoutGuide *)v30 setPriority:v32];
    v11 = 0;
    v33 = (id *)(a1 + 56);
  }
  [*v33 addObject:v31];

LABEL_19:
  if (v6)
  {
    ++*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
    if (![v42 dynamicallyHidden])
    {
      id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 48) + 72));

      if (!WeakRetained) {
        goto LABEL_30;
      }
      id v36 = objc_loadWeakRetained((id *)(*(void *)(a1 + 48) + 72));
      [v36 updateDisplayItem:v42 toScale:*(double *)(a1 + 136)];
      goto LABEL_29;
    }
    [v42 setDynamicallyHidden:0];
    id v34 = objc_loadWeakRetained((id *)(*(void *)(a1 + 48) + 72));

    if (!v34) {
      goto LABEL_30;
    }
    id v35 = objc_loadWeakRetained((id *)(*(void *)(a1 + 48) + 72));
    id v36 = v35;
    double v37 = *(double *)(a1 + 136);
    id v38 = v42;
    uint64_t v39 = 0;
LABEL_26:
    [v35 updateDisplayItem:v38 toDynamicallyHidden:v39 scale:v37];
LABEL_29:

    goto LABEL_30;
  }
  if (([v42 dynamicallyHidden] & 1) == 0)
  {
    [v42 setDynamicallyHidden:1];
    id v40 = objc_loadWeakRetained((id *)(*(void *)(a1 + 48) + 72));

    if (v40)
    {
      id v35 = objc_loadWeakRetained((id *)(*(void *)(a1 + 48) + 72));
      id v36 = v35;
      double v37 = *(double *)(a1 + 136);
      id v38 = v42;
      uint64_t v39 = 1;
      goto LABEL_26;
    }
  }
LABEL_30:
}

@end