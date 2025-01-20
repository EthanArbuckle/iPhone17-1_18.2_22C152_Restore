@interface TVStackTemplateController
@end

@implementation TVStackTemplateController

void __51___TVStackTemplateController_viewDidLayoutSubviews__block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v10 = WeakRetained;
    [WeakRetained[155] evaluateForState:1];
    v2 = [v10 stackWrappingView];
    v3 = [v2 stackView];

    [v3 frame];
    double v5 = v4;
    [v3 contentInset];
    double v8 = v5 - (v6 + v7);
    [v3 contentSize];
    if (v9 <= v8) {
      [v10[155] evaluateForState:2];
    }

    WeakRetained = v10;
  }
}

void __76___TVStackTemplateController_updateCollectionViewControllersAndForceReload___block_invoke(uint64_t a1)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  id v2 = *(id *)(*(void *)(a1 + 32) + 1176);
  [*(id *)(a1 + 32) _buildStackSections];
  v3 = [*(id *)(a1 + 40) changeSetByConvertingOldIndexesUsingChangeSet:v2 andNewIndexesUsingChangeSet:*(void *)(*(void *)(a1 + 32) + 1176)];
  double v4 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  if (v4)
  {
    uint64_t v5 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1176), "newIndexForOldIndex:", objc_msgSend(v4, "section"));
    if (v5 == 0x7FFFFFFFFFFFFFFFLL)
    {
      double v6 = 0;
    }
    else
    {
      double v6 = [MEMORY[0x263F088C8] indexPathForItem:0 inSection:v5];
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), v6);
    if (v5 != 0x7FFFFFFFFFFFFFFFLL) {
  }
    }
  double v7 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  double v8 = (id *)(*(void *)(a1 + 32) + 1232);
  if (v7)
  {
    objc_storeStrong(v8, v7);
    double v9 = (void *)TVMLKitLogObject;
    if (!os_log_type_enabled((os_log_t)TVMLKitLogObject, OS_LOG_TYPE_INFO)) {
      goto LABEL_28;
    }
    v10 = *(void **)(*(void *)(a1 + 32) + 1232);
    v11 = v9;
    *(_DWORD *)buf = 134217984;
    uint64_t v37 = [v10 section];
    _os_log_impl(&dword_230B4C000, v11, OS_LOG_TYPE_INFO, "LFIP: from auto highlight w/ changeset: %ld", buf, 0xCu);
  }
  else
  {
    id v12 = *v8;
    if (!v12) {
      goto LABEL_28;
    }
    uint64_t v13 = [v12 section];
    uint64_t v14 = [v3 newIndexForOldIndex:v13];
    if (v14 == 0x7FFFFFFFFFFFFFFFLL
      && ((uint64_t v14 = [v3 newIndexByShiftingOldIndex:v13 grouped:0],
           uint64_t v15 = [*(id *)(*(void *)(a1 + 32) + 1184) count],
           v14 != 0x7FFFFFFFFFFFFFFFLL)
        ? (BOOL v16 = v14 == v15)
        : (BOOL v16 = 1),
          v16))
    {
      v17 = 0;
      char v18 = 1;
    }
    else
    {
      v17 = [MEMORY[0x263F088C8] indexPathForItem:0 inSection:v14];
      char v18 = 0;
    }
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 1232), v17);
    if ((v18 & 1) == 0) {

    }
    v11 = (id)TVMLKitLogObject;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v19 = *(void **)(*(void *)(a1 + 32) + 1232);
      if (v19)
      {
        objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v19, "section"));
        v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v20 = @"-";
      }
      *(_DWORD *)buf = 138412290;
      uint64_t v37 = (uint64_t)v20;
      _os_log_impl(&dword_230B4C000, v11, OS_LOG_TYPE_INFO, "LFIP: from update w/ changeset: %@", buf, 0xCu);
      if (v19) {
    }
      }
  }

LABEL_28:
  v21 = [v3 addedIndexes];

  if (v21)
  {
    v22 = [MEMORY[0x263EFF980] array];
    v23 = [v3 addedIndexes];
    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3221225472;
    v34[2] = __76___TVStackTemplateController_updateCollectionViewControllersAndForceReload___block_invoke_100;
    v34[3] = &unk_264BA9800;
    id v35 = v22;
    id v24 = v22;
    [v23 enumerateIndexesUsingBlock:v34];

    v25 = *(void **)(a1 + 48);
    v26 = [v3 addedIndexes];
    [v25 insertSections:v26];

    [*(id *)(a1 + 48) insertItemsAtIndexPaths:v24];
  }
  v27 = [v3 removedIndexes];

  if (v27)
  {
    v28 = *(void **)(a1 + 48);
    v29 = [v3 removedIndexes];
    [v28 deleteSections:v29];
  }
  v30 = [v3 movedIndexesByNewIndex];

  if (v30)
  {
    v31 = [v3 movedIndexesByNewIndex];
    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v32[2] = __76___TVStackTemplateController_updateCollectionViewControllersAndForceReload___block_invoke_2;
    v32[3] = &unk_264BA8B58;
    id v33 = *(id *)(a1 + 48);
    [v31 enumerateKeysAndObjectsUsingBlock:v32];
  }
}

void __76___TVStackTemplateController_updateCollectionViewControllersAndForceReload___block_invoke_100(uint64_t a1, uint64_t a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [MEMORY[0x263F088C8] indexPathForItem:0 inSection:a2];
  [v2 addObject:v3];
}

uint64_t __76___TVStackTemplateController_updateCollectionViewControllersAndForceReload___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  double v4 = *(void **)(a1 + 32);
  id v5 = a2;
  uint64_t v6 = [a3 integerValue];
  uint64_t v7 = [v5 integerValue];

  return [v4 moveSection:v6 toSection:v7];
}

void __76___TVStackTemplateController_updateCollectionViewControllersAndForceReload___block_invoke_3(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) view];
  [v1 setNeedsLayout];
}

void __80___TVStackTemplateController_collectionView_willDisplayCell_forItemAtIndexPath___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) view];
  [*(id *)(a1 + 40) bounds];
  objc_msgSend(v2, "setFrame:");
}

id __94___TVStackTemplateController__updateWithCollectionListElement_commits_autoHighlightIndexPath___block_invoke(uint64_t a1, void *a2)
{
  if (objc_msgSend(a2, "tv_elementType") == 9)
  {
    id v2 = objc_opt_new();
    [v2 setLayoutType:0];
  }
  else
  {
    id v2 = 0;
  }
  return v2;
}

void __94___TVStackTemplateController__updateWithCollectionListElement_commits_autoHighlightIndexPath___block_invoke_2(uint64_t a1, uint64_t a2)
{
  double v4 = [*(id *)(a1 + 32) unfilteredChildren];
  id v12 = [v4 objectAtIndexedSubscript:a2];

  uint64_t v5 = [*(id *)(a1 + 40) oldIndexForNewIndex:a2];
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v6 = (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
    uint64_t v7 = [*(id *)(a1 + 64) viewControllerWithElement:v12 layout:v6 existingController:0];
    double v8 = v7;
    if (v7) {
      id v9 = v7;
    }
    else {
      id v9 = (id)objc_opt_new();
    }
    v11 = v9;

    [*(id *)(a1 + 48) addObject:v11];
    [*(id *)(a1 + 72) addObject:v11];
  }
  else
  {
    v10 = *(void **)(a1 + 48);
    uint64_t v6 = [*(id *)(a1 + 56) objectAtIndexedSubscript:v5];
    [v10 addObject:v6];
  }
}

uint64_t __94___TVStackTemplateController__updateWithCollectionListElement_commits_autoHighlightIndexPath___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 conformsToProtocol:&unk_26E5C8FC8];
}

void __94___TVStackTemplateController__updateWithCollectionListElement_commits_autoHighlightIndexPath___block_invoke_4(uint64_t a1, void *a2, uint64_t a3)
{
  id v7 = a2;
  uint64_t v5 = [v7 autoHighlightIdentifier];

  if (v5)
  {
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
    if (*(void *)(v6 + 24) == 0x7FFFFFFFFFFFFFFFLL) {
      *(void *)(v6 + 24) = a3;
    }
    [v7 resetProperty:2];
  }
}

void __94___TVStackTemplateController__updateWithCollectionListElement_commits_autoHighlightIndexPath___block_invoke_5(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v15 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        double v8 = objc_msgSend(v7, "parentViewController", (void)v14);
        id v9 = *(void **)(a1 + 40);

        if (v8 == v9) {
          [v7 willMoveToParentViewController:0];
        }
        v10 = [v7 view];
        [v10 removeFromSuperview];

        [v7 removeFromParentViewController];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v4);
  }

  uint64_t v11 = [*(id *)(a1 + 48) copy];
  uint64_t v12 = *(void *)(a1 + 40);
  uint64_t v13 = *(void **)(v12 + 1168);
  *(void *)(v12 + 1168) = v11;
}

void __61___TVStackTemplateController__scheduleNextPreloadConditional__block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    WeakRetained[1266] = 0;
    id v2 = WeakRetained;
    [WeakRetained _preloadNext];
    WeakRetained = v2;
  }
}

void __49___TVStackTemplateController__buildStackSections__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v70[1] = *MEMORY[0x263EF8340];
  id v4 = a2;
  v46 = objc_msgSend(v4, "tv_associatedIKViewElement");
  uint64_t v5 = [v46 style];
  uint64_t v6 = objc_msgSend(v5, "tv_transition");

  v45 = v6;
  if (v6) {
    unsigned int v7 = [v6 isEqualToString:@"collapse"];
  }
  else {
    unsigned int v7 = 1;
  }
  [*(id *)(a1 + 32) showcaseInset];
  *(void *)&long long v62 = 1;
  *((void *)&v62 + 1) = v7;
  *(void *)&long long v63 = v8;
  objc_msgSend(v4, "tv_setShowcaseConfig:", &v62);
  id v9 = [v4 view];
  uint64_t v67 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v10 = [v9 conformsToProtocol:&unk_26E5D45B8];
  double v11 = *(double *)(a1 + 88);
  if (!v10)
  {
    objc_msgSend(v9, "tv_sizeThatFits:", v11, 0.0);
    *(void *)&long long v62 = 0;
    *((void *)&v62 + 1) = v14;
    long long v63 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    long long v15 = objc_msgSend(MEMORY[0x263F08D40], "tv_valueWithRowMetrics:", &v62);
    v70[0] = v15;
    uint64_t v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v70 count:1];

    if (v7)
    {
      long long v65 = 0u;
      long long v66 = 0u;
      long long v63 = 0u;
      long long v64 = 0u;
      long long v62 = 0u;
      long long v16 = objc_msgSend(MEMORY[0x263F08D40], "tv_valueWithRowMetrics:", &v62);
      v69 = v16;
      uint64_t v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v69 count:1];

      BOOL v13 = 0;
      id v18 = (id)v17;
      goto LABEL_17;
    }
    id v20 = v12;
    BOOL v13 = 0;
    uint64_t v12 = v20;
    goto LABEL_15;
  }
  uint64_t v12 = [v9 rowMetricsForExpectedWidth:&v67 firstItemRowIndex:v11];
  BOOL v13 = (objc_opt_respondsToSelector() & 1) != 0
     && [v9 shouldBindRowsTogether]
     && (unint64_t)[v12 count] > 1;
  char v19 = objc_opt_respondsToSelector();
  if (*(unsigned char *)(a1 + 176) && (v19 & 1) != 0)
  {
    id v20 = [v9 showcaseRowMetricsForExpectedWidth:*(double *)(a1 + 88)];
LABEL_15:
    id v18 = v20;
    goto LABEL_17;
  }
  id v18 = v12;
  uint64_t v12 = v18;
LABEL_17:
  long long v65 = 0u;
  long long v66 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v62 = 0u;
  TVRowMetricsMakeWithList(v12, &v62);
  v21 = *(void **)(a1 + 40);
  long long v59 = v64;
  long long v60 = v65;
  long long v61 = v66;
  long long v57 = v62;
  long long v58 = v63;
  v22 = objc_msgSend(MEMORY[0x263F08D40], "tv_valueWithRowMetrics:", &v57);
  [v21 addObject:v22];

  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v57 = 0u;
  TVRowMetricsMakeWithList(v18, &v57);
  v23 = *(void **)(a1 + 48);
  long long v54 = v59;
  long long v55 = v60;
  long long v56 = v61;
  long long v52 = v57;
  long long v53 = v58;
  id v24 = objc_msgSend(MEMORY[0x263F08D40], "tv_valueWithRowMetrics:", &v52);
  [v23 addObject:v24];

  if (*((double *)&v62 + 1) <= 0.0)
  {
    objc_msgSend(*(id *)(a1 + 80), "addIndex:", a3, *((double *)&v62 + 1));
    uint64_t v37 = v46;
  }
  else
  {
    id v40 = v18;
    v42 = v9;
    id v44 = v4;
    objc_msgSend(*(id *)(a1 + 56), "addObject:", v4, *((double *)&v62 + 1));
    v25 = objc_alloc_init(_TVStackRow);
    long long v26 = *(_OWORD *)(a1 + 144);
    long long v54 = *(_OWORD *)(a1 + 128);
    long long v55 = v26;
    long long v56 = *(_OWORD *)(a1 + 160);
    long long v27 = *(_OWORD *)(a1 + 112);
    long long v52 = *(_OWORD *)(a1 + 96);
    long long v53 = v27;
    [(_TVStackRow *)v25 setRowMetrics:&v52];
    v39 = v25;
    [*(id *)(a1 + 64) addObject:v25];
    uint64_t v38 = [*(id *)(a1 + 64) count];
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    v41 = v12;
    id v28 = v12;
    uint64_t v29 = [v28 countByEnumeratingWithState:&v48 objects:v68 count:16];
    if (v29)
    {
      uint64_t v30 = v29;
      uint64_t v31 = *(void *)v49;
      do
      {
        for (uint64_t i = 0; i != v30; ++i)
        {
          if (*(void *)v49 != v31) {
            objc_enumerationMutation(v28);
          }
          id v33 = *(void **)(*((void *)&v48 + 1) + 8 * i);
          v34 = objc_alloc_init(_TVStackRow);
          if (v33) {
            objc_msgSend(v33, "tv_rowMetricsValue");
          }
          else {
            memset(v47, 0, sizeof(v47));
          }
          -[_TVStackRow setRowMetrics:](v34, "setRowMetrics:", v47, v38);
          -[_TVStackRow setSectionIndex:](v34, "setSectionIndex:", [*(id *)(a1 + 72) count]);
          [(_TVStackRow *)v34 setHosted:v10];
          [(_TVStackRow *)v34 setBounded:v13];
          [*(id *)(a1 + 64) addObject:v34];
        }
        uint64_t v30 = [v28 countByEnumeratingWithState:&v48 objects:v68 count:16];
      }
      while (v30);
    }

    id v35 = objc_alloc_init(_TVStackSection);
    [(_TVStackSection *)v35 setFirstRowIndex:v38];
    -[_TVStackSection setRowCount:](v35, "setRowCount:", [v28 count]);
    uint64_t v36 = v67;
    if (v67 == 0x7FFFFFFFFFFFFFFFLL) {
      uint64_t v36 = 0;
    }
    -[_TVStackSection setFirstItemRowIndex:](v35, "setFirstItemRowIndex:", v36 + v38, v38);
    [(_TVStackSection *)v35 setSectionHeight:*((double *)&v62 + 1)];
    [(_TVStackSection *)v35 setShowcaseSectionHeight:*((double *)&v57 + 1)];
    long long v54 = v64;
    long long v55 = v65;
    long long v56 = v66;
    long long v52 = v62;
    long long v53 = v63;
    [(_TVStackSection *)v35 setCompoundRowMetrics:&v52];
    [*(id *)(a1 + 72) addObject:v35];

    id v9 = v42;
    id v4 = v44;
    uint64_t v37 = v46;
    id v18 = v40;
    uint64_t v12 = v41;
  }
}

void __49___TVStackTemplateController__buildStackSections__block_invoke_2(uint64_t a1, void *a2, unint64_t a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a2;
  unsigned int v7 = [v5 objectAtIndexedSubscript:a3];
  uint64_t v8 = objc_msgSend(v6, "tv_associatedIKViewElement");

  id v9 = [v8 style];
  objc_msgSend(v9, "tv_margin");
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;

  double v18 = 0.0;
  if (!a3)
  {
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v43 = 0u;
    char v19 = [*(id *)(a1 + 40) objectAtIndexedSubscript:0];
    id v20 = v19;
    if (v19)
    {
      [v19 rowMetrics];
    }
    else
    {
      long long v46 = 0u;
      long long v47 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      long long v43 = 0u;
    }

    *((double *)&v43 + 1) = v11;
    v21 = [*(id *)(a1 + 40) objectAtIndexedSubscript:0];
    long long v40 = v45;
    long long v41 = v46;
    long long v42 = v47;
    long long v38 = v43;
    long long v39 = v44;
    [v21 setRowMetrics:&v38];

    double v18 = v11;
  }
  if ([*(id *)(*(void *)(a1 + 48) + 1184) count] - 1 > a3)
  {
    v22 = [*(id *)(*(void *)(a1 + 48) + 1184) objectAtIndex:a3 + 1];
    v23 = objc_msgSend(v22, "tv_associatedIKViewElement");

    id v24 = [v23 style];
    objc_msgSend(v24, "tv_margin");
    double v26 = v25;

    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v43 = 0u;
    long long v27 = [*(id *)(a1 + 56) objectAtIndex:a3];
    id v28 = v27;
    if (v27)
    {
      objc_msgSend(v27, "tv_rowMetricsValue");
    }
    else
    {
      long long v46 = 0u;
      long long v47 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      long long v43 = 0u;
    }

    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v38 = 0u;
    uint64_t v30 = [*(id *)(a1 + 64) objectAtIndex:a3];
    uint64_t v31 = v30;
    if (v30)
    {
      objc_msgSend(v30, "tv_rowMetricsValue");
    }
    else
    {
      long long v41 = 0u;
      long long v42 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      long long v38 = 0u;
    }

    v32 = [v23 style];
    if (objc_msgSend(v32, "tv_edgeFlagForStyle:", @"margin"))
    {
    }
    else
    {
      id v33 = [v8 style];
      char v34 = objc_msgSend(v33, "tv_edgeFlagForStyle:", @"margin");

      if ((v34 & 4) == 0)
      {
        double v35 = *((double *)&v43 + 1);
        double v15 = *((double *)&v38 + 1);
LABEL_19:
        double v29 = v15;
        uint64_t v36 = objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", objc_msgSend(v7, "rowCount") + objc_msgSend(v7, "firstRowIndex"));
        v37[2] = v45;
        v37[3] = v46;
        v37[4] = v47;
        v37[0] = v43;
        v37[1] = v44;
        [v36 setRowMetrics:v37];

        double v15 = v35;
        goto LABEL_20;
      }
    }
    double v35 = fmax(v15, v26);
    *((double *)&v43 + 1) = v35;
    *((double *)&v38 + 1) = v35;
    goto LABEL_19;
  }
  v23 = objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", objc_msgSend(*(id *)(a1 + 40), "count") - 1);
  *(void *)&long long v43 = 1;
  *((double *)&v43 + 1) = v15;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  [v23 setRowMetrics:&v43];
  double v29 = v15;
LABEL_20:

  objc_msgSend(v7, "setSectionSpacing:", v18, v13, v15, v17);
  objc_msgSend(v7, "setShowcaseSectionSpacing:", v11, v13, v29, v17);
}

void __56___TVStackTemplateController__updateFirstItemRowIndexes__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = [a2 view];
  if ([v5 conformsToProtocol:&unk_26E5D45B8])
  {
    uint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
    id v6 = (id)[v5 rowMetricsForExpectedWidth:&v10 firstItemRowIndex:*(double *)(a1 + 40)];
    unsigned int v7 = [*(id *)(*(void *)(a1 + 32) + 1200) objectAtIndexedSubscript:a3];
    uint64_t v8 = [v7 firstRowIndex];
    uint64_t v9 = v10;
    if (v10 == 0x7FFFFFFFFFFFFFFFLL) {
      uint64_t v9 = 0;
    }
    [v7 setFirstItemRowIndex:v9 + v8];
  }
}

@end