@interface UIStatusBarRegionAxisFillingLayout
@end

@implementation UIStatusBarRegionAxisFillingLayout

void __52___UIStatusBarRegionAxisFillingLayout_fillingLayout__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)qword_1EB262EB8;
  qword_1EB262EB8 = (uint64_t)v1;
}

void __100___UIStatusBarRegionAxisFillingLayout_constraintsForDisplayItems_layoutGuides_inContainerItem_axis___block_invoke(uint64_t a1, void *a2)
{
  v4 = [a2 layoutItem];
  v5 = *(void **)(a1 + 32);
  v6 = *(void **)(a1 + 48);
  id v7 = v4;
  v8 = v7;
  if (v6 == (void *)1)
  {
    uint64_t v9 = [v7 topAnchor];
  }
  else
  {
    if (v6) {
      goto LABEL_6;
    }
    uint64_t v9 = [v7 leftAnchor];
  }
  v2 = (void *)v9;
LABEL_6:

  uint64_t v10 = *(void *)(a1 + 48);
  id v11 = *(id *)(a1 + 40);
  v12 = v11;
  if (v10 == 1)
  {
    uint64_t v13 = [v11 topAnchor];
  }
  else
  {
    if (v10) {
      goto LABEL_11;
    }
    uint64_t v13 = [v11 leftAnchor];
  }
  v6 = (void *)v13;
LABEL_11:

  v14 = [v2 constraintEqualToAnchor:v6];
  LODWORD(v15) = 1112276992;
  v16 = objc_msgSend(v14, "_ui_constraintWithPriority:", v15);
  [v5 addObject:v16];

  v17 = *(void **)(a1 + 32);
  v18 = *(void **)(a1 + 48);
  id v19 = v8;
  v20 = v19;
  if (v18 == (void *)1)
  {
    uint64_t v21 = [v19 bottomAnchor];
  }
  else
  {
    if (v18) {
      goto LABEL_16;
    }
    uint64_t v21 = [v19 rightAnchor];
  }
  v2 = (void *)v21;
LABEL_16:

  uint64_t v22 = *(void *)(a1 + 48);
  id v23 = *(id *)(a1 + 40);
  v24 = v23;
  if (v22 == 1)
  {
    uint64_t v25 = [v23 bottomAnchor];
  }
  else
  {
    if (v22) {
      goto LABEL_21;
    }
    uint64_t v25 = [v23 rightAnchor];
  }
  v18 = (void *)v25;
LABEL_21:

  v26 = [v2 constraintEqualToAnchor:v18];
  LODWORD(v27) = 1112276992;
  v28 = objc_msgSend(v26, "_ui_constraintWithPriority:", v27);
  [v17 addObject:v28];

  v29 = *(void **)(a1 + 32);
  uint64_t v30 = *(void *)(a1 + 48);
  id v31 = v20;
  id v38 = v31;
  if (v30 == 1)
  {
    uint64_t v32 = [v31 centerYAnchor];
  }
  else
  {
    if (v30) {
      goto LABEL_26;
    }
    uint64_t v32 = [v31 centerXAnchor];
  }
  v20 = (void *)v32;
  id v31 = v38;
LABEL_26:

  uint64_t v33 = *(void *)(a1 + 48);
  id v34 = *(id *)(a1 + 40);
  v35 = v34;
  if (v33 == 1)
  {
    uint64_t v36 = [v34 centerYAnchor];
  }
  else
  {
    if (v33) {
      goto LABEL_31;
    }
    uint64_t v36 = [v34 centerXAnchor];
  }
  a1 = v36;
LABEL_31:

  v37 = [v20 constraintEqualToAnchor:a1];
  [v29 addObject:v37];
}

@end