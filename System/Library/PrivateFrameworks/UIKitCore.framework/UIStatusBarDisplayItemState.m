@interface UIStatusBarDisplayItemState
@end

@implementation UIStatusBarDisplayItemState

BOOL __54___UIStatusBarDisplayItemState_addPlacement_inRegion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 priority];
  return v3 <= [*(id *)(a1 + 32) priority];
}

void __86___UIStatusBarDisplayItemState_setupRelationsBetweenDisplayItemStates_visualProvider___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v98 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v88 = 0u;
  long long v89 = 0u;
  long long v90 = 0u;
  long long v91 = 0u;
  obuint64_t j = [v3 placementStates];
  uint64_t v60 = [obj countByEnumeratingWithState:&v88 objects:v97 count:16];
  if (v60)
  {
    uint64_t v59 = *(void *)v89;
    id v61 = v3;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v89 != v59) {
          objc_enumerationMutation(obj);
        }
        uint64_t v62 = v4;
        v65 = *(void **)(*((void *)&v88 + 1) + 8 * v4);
        v5 = [v65 placement];
        v6 = [MEMORY[0x1E4F1CA80] set];
        v7 = [v5 excludedPlacements];
        v8 = [v7 allObjects];
        [v6 addObjectsFromArray:v8];

        long long v86 = 0u;
        long long v87 = 0u;
        long long v84 = 0u;
        long long v85 = 0u;
        id v63 = [v5 excludedRegionIdentifiers];
        uint64_t v66 = [v63 countByEnumeratingWithState:&v84 objects:v96 count:16];
        if (v66)
        {
          uint64_t v64 = *(void *)v85;
          do
          {
            for (uint64_t i = 0; i != v66; ++i)
            {
              if (*(void *)v85 != v64) {
                objc_enumerationMutation(v63);
              }
              v10 = [*(id *)(a1 + 32) orderedDisplayItemPlacementsInRegionWithIdentifier:*(void *)(*((void *)&v84 + 1) + 8 * i)];
              long long v80 = 0u;
              long long v81 = 0u;
              long long v82 = 0u;
              long long v83 = 0u;
              uint64_t v11 = [v10 countByEnumeratingWithState:&v80 objects:v95 count:16];
              if (v11)
              {
                uint64_t v12 = v11;
                uint64_t v13 = *(void *)v81;
                do
                {
                  for (uint64_t j = 0; j != v12; ++j)
                  {
                    if (*(void *)v81 != v13) {
                      objc_enumerationMutation(v10);
                    }
                    uint64_t v15 = *(void *)(*((void *)&v80 + 1) + 8 * j);
                    v16 = [v5 includedPlacements];
                    char v17 = [v16 containsObject:v15];

                    if ((v17 & 1) == 0) {
                      [v6 addObject:v15];
                    }
                  }
                  uint64_t v12 = [v10 countByEnumeratingWithState:&v80 objects:v95 count:16];
                }
                while (v12);
              }
            }
            uint64_t v66 = [v63 countByEnumeratingWithState:&v84 objects:v96 count:16];
          }
          while (v66);
        }

        long long v78 = 0u;
        long long v79 = 0u;
        long long v76 = 0u;
        long long v77 = 0u;
        id v18 = v6;
        uint64_t v19 = [v18 countByEnumeratingWithState:&v76 objects:v94 count:16];
        id v3 = v61;
        if (v19)
        {
          uint64_t v20 = v19;
          uint64_t v21 = *(void *)v77;
          do
          {
            for (uint64_t k = 0; k != v20; ++k)
            {
              if (*(void *)v77 != v21) {
                objc_enumerationMutation(v18);
              }
              v23 = *(void **)(*((void *)&v76 + 1) + 8 * k);
              uint64_t v24 = [v23 priority];
              if (v24 >= [v5 priority])
              {
                v31 = [MEMORY[0x1E4F28B00] currentHandler];
                [v31 handleFailureInMethod:*(void *)(a1 + 48), *(void *)(a1 + 56), @"_UIStatusBarDisplayItemState.m", 296, @"Item placement %@ can't exclude item placement with higher priority %@", v5, v23 object file lineNumber description];
              }
              v25 = +[_UIStatusBarDisplayItemRelation exclusionWithDisplayItemState:v61 placement:v5];
              v26 = *(void **)(a1 + 40);
              v27 = [v23 identifier];
              v28 = [v26 objectForKeyedSubscript:v27];

              v29 = [v28 placementStateForPlacement:v23];
              v30 = [v29 relations];
              [v30 addObject:v25];
            }
            uint64_t v20 = [v18 countByEnumeratingWithState:&v76 objects:v94 count:16];
          }
          while (v20);
        }

        long long v74 = 0u;
        long long v75 = 0u;
        long long v72 = 0u;
        long long v73 = 0u;
        v32 = [v5 allRequiredPlacements];
        uint64_t v33 = [v32 countByEnumeratingWithState:&v72 objects:v93 count:16];
        if (v33)
        {
          uint64_t v34 = v33;
          uint64_t v35 = *(void *)v73;
          do
          {
            for (uint64_t m = 0; m != v34; ++m)
            {
              if (*(void *)v73 != v35) {
                objc_enumerationMutation(v32);
              }
              v37 = *(void **)(*((void *)&v72 + 1) + 8 * m);
              v38 = *(void **)(a1 + 40);
              v39 = [v37 identifier];
              v40 = [v38 objectForKeyedSubscript:v39];

              v41 = +[_UIStatusBarDisplayItemRelation requirementWithDisplayItemState:v40 placement:v37];
              v42 = [v65 relations];
              [v42 addObject:v41];
            }
            uint64_t v34 = [v32 countByEnumeratingWithState:&v72 objects:v93 count:16];
          }
          while (v34);
        }

        v43 = [v5 anyRequiredPlacements];
        uint64_t v44 = [v43 count];

        if (v44)
        {
          v45 = [MEMORY[0x1E4F1CA48] array];
          long long v68 = 0u;
          long long v69 = 0u;
          long long v70 = 0u;
          long long v71 = 0u;
          v46 = [v5 anyRequiredPlacements];
          uint64_t v47 = [v46 countByEnumeratingWithState:&v68 objects:v92 count:16];
          if (v47)
          {
            uint64_t v48 = v47;
            uint64_t v49 = *(void *)v69;
            do
            {
              for (uint64_t n = 0; n != v48; ++n)
              {
                if (*(void *)v69 != v49) {
                  objc_enumerationMutation(v46);
                }
                v51 = *(void **)(*((void *)&v68 + 1) + 8 * n);
                v52 = *(void **)(a1 + 40);
                v53 = [v51 identifier];
                v54 = [v52 objectForKeyedSubscript:v53];

                v55 = +[_UIStatusBarDisplayItemRelation requirementWithDisplayItemState:v54 placement:v51];
                [v45 addObject:v55];
              }
              uint64_t v48 = [v46 countByEnumeratingWithState:&v68 objects:v92 count:16];
            }
            while (v48);
          }

          v56 = [v65 relations];
          v57 = +[_UIStatusBarDisplayItemRelation anyRelationWithRelations:v45];
          [v56 addObject:v57];

          id v3 = v61;
        }

        uint64_t v4 = v62 + 1;
      }
      while (v62 + 1 != v60);
      uint64_t v60 = [obj countByEnumeratingWithState:&v88 objects:v97 count:16];
    }
    while (v60);
  }
}

uint64_t __47___UIStatusBarDisplayItemState_updatePlacement__block_invoke(uint64_t a1, void *a2)
{
  return [a2 updatePlacement];
}

uint64_t __63___UIStatusBarDisplayItemState_updateWithData_styleAttributes___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 dataUpdateStatus];
  if (v4 != 2)
  {
    if (v4)
    {
      uint64_t v6 = 0;
      goto LABEL_6;
    }
    v5 = [v3 updateWithData:*(void *)(a1 + 32) styleAttributes:*(void *)(a1 + 40)];
    [*(id *)(a1 + 48) addObjectsFromArray:v5];
  }
  uint64_t v6 = 1;
LABEL_6:

  return v6;
}

void __105___UIStatusBarDisplayItemState__effectiveStyleAttributesFromStyleAttributes_data_styleAttributesChanged___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
    v5 = *(void **)(v4 + 40);
    id v10 = v3;
    if (v5)
    {
      uint64_t v6 = [v5 styleAttributesWithOverrides:v3];
      uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
      v8 = *(void **)(v7 + 40);
      *(void *)(v7 + 40) = v6;
    }
    else
    {
      id v9 = v3;
      v8 = *(void **)(v4 + 40);
      *(void *)(v4 + 40) = v9;
    }

    id v3 = v10;
  }
}

uint64_t __49___UIStatusBarDisplayItemState_prepareAnimation___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAddingAnimation:0];
}

void __49___UIStatusBarDisplayItemState_prepareAnimation___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 32));
  int v5 = [WeakRetained animationContextId];

  if (a2 != 1 || !v5)
  {
    [*(id *)(a1 + 32) setRemovingAnimation:0];
    id v8 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
    [v8 setFloating:0];

    goto LABEL_6;
  }
  int v6 = *(_DWORD *)(a1 + 40);
  [*(id *)(a1 + 32) setRemovingAnimation:0];
  id v7 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  [v7 setFloating:0];

  if (v5 != v6)
  {
LABEL_6:
    id v9 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
    [v9 setContainerView:0];

    id v10 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
    [v10 setAlpha:1.0];

    id v11 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
    long long v12 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    v13[0] = *MEMORY[0x1E4F1DAB8];
    v13[1] = v12;
    v13[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    [v11 setTransform:v13];
  }
}

void __49___UIStatusBarDisplayItemState_prepareAnimation___block_invoke_3(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) animations];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [v3 removeObject:WeakRetained];
}

@end