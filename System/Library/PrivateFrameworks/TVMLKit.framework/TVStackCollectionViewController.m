@interface TVStackCollectionViewController
@end

@implementation TVStackCollectionViewController

void __57___TVStackCollectionViewController_viewDidLayoutSubviews__block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    [WeakRetained[131] evaluateForState:1];
    WeakRetained = v2;
  }
}

void __86___TVStackCollectionViewController_collectionView_willDisplayCell_forItemAtIndexPath___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) view];
  [*(id *)(a1 + 40) bounds];
  objc_msgSend(v2, "setFrame:");
}

uint64_t __90___TVStackCollectionViewController__adjustedContentOffsetForRowIndex_targetContentOffset___block_invoke(uint64_t a1, uint64_t a2, int a3, int a4)
{
  if (a3) {
    uint64_t v7 = -1;
  }
  else {
    uint64_t v7 = 1;
  }
  uint64_t v8 = *(void *)(a2 + 24);
  if ((a3 & 1) == 0) {
    uint64_t v8 = v8 + *(void *)(a2 + 32) - 1;
  }
  v9 = [*(id *)(*(void *)(a1 + 32) + 1032) objectAtIndexedSubscript:v8];
  v10 = v9;
  double v11 = 0.0;
  if ((a4 & 1) == 0)
  {
    if (v9) {
      [v9 rowMetrics];
    }
    double v11 = 0.0 - 0.0;
  }
  char v12 = 0;
  uint64_t v13 = v8 + v7;
  if (v13 >= 0)
  {
    uint64_t v14 = -v13;
    while (v13 < (unint64_t)[*(id *)(*(void *)(a1 + 32) + 1032) count])
    {
      v15 = [*(id *)(*(void *)(a1 + 32) + 1032) objectAtIndexedSubscript:v13];
      v16 = v15;
      if (v15) {
        [v15 rowMetrics];
      }
      uint64_t v17 = *(void *)(a2 + 24);
      if (a3)
      {
        uint64_t v18 = v14 + *(void *)(a2 + 32) + v17;
        *(void *)(a2 + 24) = v13;
      }
      else
      {
        uint64_t v18 = v13 - v17 + 1;
      }
      *(void *)(a2 + 32) = v18;
      if (!a4
        || ![v10 isBounded]
        || (uint64_t v19 = [v10 sectionIndex], v19 != objc_msgSend(v16, "sectionIndex")))
      {
        *(double *)(a2 + 16) = *(double *)(a2 + 16) + v11 + 0.0;
        uint64_t v20 = 8;
        if (a3) {
          uint64_t v20 = 0;
        }
        *(double *)(a2 + v20) = 0.0 - (0.0 + 0.0);

        char v12 = 1;
        break;
      }
      *(double *)(a2 + 16) = *(double *)(a2 + 16) + v11 + 0.0;
      char v12 = 1;
      double v11 = 0.0;

      v13 += v7;
      v14 -= v7;
      if (v13 < 0) {
        break;
      }
    }
  }

  return v12 & 1;
}

void __55___TVStackCollectionViewController__buildStackSections__block_invoke(uint64_t a1, void *a2)
{
  v43[1] = *MEMORY[0x263EF8340];
  v3 = [a2 view];
  uint64_t v41 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v4 = [v3 conformsToProtocol:&unk_26E5D45B8];
  v25 = v3;
  if (v4)
  {
    v5 = [v3 rowMetricsForExpectedWidth:&v41 firstItemRowIndex:*(double *)(a1 + 56)];
    if ((objc_opt_respondsToSelector() & 1) != 0 && [v3 shouldBindRowsTogether])
    {
      BOOL v6 = (unint64_t)[v5 count] > 1;
      goto LABEL_7;
    }
  }
  else
  {
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    objc_msgSend(v3, "tv_sizeThatFits:", *(double *)(a1 + 56), 0.0);
    *(void *)&long long v36 = 0;
    *((void *)&v36 + 1) = v7;
    uint64_t v8 = objc_msgSend(MEMORY[0x263F08D40], "tv_valueWithRowMetrics:", &v36);
    v43[0] = v8;
    v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v43 count:1];
  }
  BOOL v6 = 0;
LABEL_7:
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v36 = 0u;
  TVRowMetricsMakeWithList(v5, &v36);
  v9 = *(void **)(a1 + 32);
  long long v33 = v38;
  long long v34 = v39;
  long long v35 = v40;
  long long v31 = v36;
  long long v32 = v37;
  v10 = objc_msgSend(MEMORY[0x263F08D40], "tv_valueWithRowMetrics:", &v31);
  [v9 addObject:v10];

  double v11 = objc_alloc_init(_TVStackRow);
  long long v12 = *(_OWORD *)(a1 + 112);
  long long v33 = *(_OWORD *)(a1 + 96);
  long long v34 = v12;
  long long v35 = *(_OWORD *)(a1 + 128);
  long long v13 = *(_OWORD *)(a1 + 80);
  long long v31 = *(_OWORD *)(a1 + 64);
  long long v32 = v13;
  [(_TVStackRow *)v11 setRowMetrics:&v31];
  v24 = v11;
  [*(id *)(a1 + 40) addObject:v11];
  uint64_t v23 = [*(id *)(a1 + 40) count];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v14 = v5;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v27 objects:v42 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v28 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        uint64_t v20 = objc_alloc_init(_TVStackRow);
        if (v19) {
          objc_msgSend(v19, "tv_rowMetricsValue");
        }
        else {
          memset(v26, 0, sizeof(v26));
        }
        [(_TVStackRow *)v20 setRowMetrics:v26];
        -[_TVStackRow setSectionIndex:](v20, "setSectionIndex:", [*(id *)(a1 + 48) count]);
        [(_TVStackRow *)v20 setHosted:v4];
        [(_TVStackRow *)v20 setBounded:v6];
        [*(id *)(a1 + 40) addObject:v20];
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v27 objects:v42 count:16];
    }
    while (v16);
  }

  v21 = objc_alloc_init(_TVStackSection);
  [(_TVStackSection *)v21 setFirstRowIndex:v23];
  -[_TVStackSection setRowCount:](v21, "setRowCount:", [v14 count]);
  uint64_t v22 = v41;
  if (v41 == 0x7FFFFFFFFFFFFFFFLL) {
    uint64_t v22 = 0;
  }
  [(_TVStackSection *)v21 setFirstItemRowIndex:v22 + v23];
  [(_TVStackSection *)v21 setSectionHeight:*((double *)&v36 + 1)];
  long long v33 = v38;
  long long v34 = v39;
  long long v35 = v40;
  long long v31 = v36;
  long long v32 = v37;
  [(_TVStackSection *)v21 setCompoundRowMetrics:&v31];
  [*(id *)(a1 + 48) addObject:v21];
}

void __55___TVStackCollectionViewController__buildStackSections__block_invoke_2(uint64_t a1, void *a2, unint64_t a3)
{
  v5 = *(void **)(a1 + 32);
  id v6 = a2;
  uint64_t v7 = [v5 objectAtIndexedSubscript:a3];
  uint64_t v8 = objc_msgSend(v6, "tv_associatedIKViewElement");

  v9 = [v8 style];
  objc_msgSend(v9, "tv_margin");
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;

  double v18 = 0.0;
  if (!a3)
  {
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v38 = 0u;
    uint64_t v19 = [*(id *)(a1 + 40) objectAtIndexedSubscript:0];
    uint64_t v20 = v19;
    if (v19)
    {
      [v19 rowMetrics];
    }
    else
    {
      long long v41 = 0u;
      long long v42 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      long long v38 = 0u;
    }

    *((double *)&v38 + 1) = v11;
    v21 = [*(id *)(a1 + 40) objectAtIndexedSubscript:0];
    long long v35 = v40;
    long long v36 = v41;
    long long v37 = v42;
    long long v33 = v38;
    long long v34 = v39;
    [v21 setRowMetrics:&v33];

    double v18 = v11;
  }
  if ([*(id *)(*(void *)(a1 + 48) + 1016) count] - 1 > a3)
  {
    uint64_t v22 = [*(id *)(*(void *)(a1 + 48) + 1016) objectAtIndex:a3 + 1];
    uint64_t v23 = objc_msgSend(v22, "tv_associatedIKViewElement");

    v24 = [v23 style];
    objc_msgSend(v24, "tv_margin");
    double v26 = v25;

    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v38 = 0u;
    long long v27 = [*(id *)(a1 + 56) objectAtIndex:a3];
    long long v28 = v27;
    if (v27)
    {
      objc_msgSend(v27, "tv_rowMetricsValue");
    }
    else
    {
      long long v41 = 0u;
      long long v42 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      long long v38 = 0u;
    }

    long long v29 = [v23 style];
    if (objc_msgSend(v29, "tv_edgeFlagForStyle:", @"margin"))
    {
    }
    else
    {
      long long v30 = [v8 style];
      char v31 = objc_msgSend(v30, "tv_edgeFlagForStyle:", @"margin");

      if ((v31 & 4) == 0)
      {
        double v15 = *((double *)&v38 + 1);
LABEL_16:
        long long v32 = objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", objc_msgSend(v7, "rowCount") + objc_msgSend(v7, "firstRowIndex"));
        long long v35 = v40;
        long long v36 = v41;
        long long v37 = v42;
        long long v33 = v38;
        long long v34 = v39;
        [v32 setRowMetrics:&v33];

        goto LABEL_17;
      }
    }
    double v15 = fmax(v15, v26);
    *((double *)&v38 + 1) = v15;
    goto LABEL_16;
  }
  uint64_t v23 = objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", objc_msgSend(*(id *)(a1 + 40), "count") - 1);
  *(void *)&long long v38 = 1;
  *((double *)&v38 + 1) = v15;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  [v23 setRowMetrics:&v38];
LABEL_17:

  objc_msgSend(v7, "setSectionSpacing:", v18, v13, v15, v17);
}

void __62___TVStackCollectionViewController__updateFirstItemRowIndexes__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v5 = [a2 view];
  if ([v5 conformsToProtocol:&unk_26E5D45B8])
  {
    uint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
    id v6 = (id)[v5 rowMetricsForExpectedWidth:&v10 firstItemRowIndex:*(double *)(a1 + 40)];
    uint64_t v7 = [*(id *)(*(void *)(a1 + 32) + 1024) objectAtIndexedSubscript:a3];
    uint64_t v8 = [v7 firstRowIndex];
    uint64_t v9 = v10;
    if (v10 == 0x7FFFFFFFFFFFFFFFLL) {
      uint64_t v9 = 0;
    }
    [v7 setFirstItemRowIndex:v9 + v8];
  }
}

@end