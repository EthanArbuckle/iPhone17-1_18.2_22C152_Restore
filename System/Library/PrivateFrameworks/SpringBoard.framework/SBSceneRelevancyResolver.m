@interface SBSceneRelevancyResolver
+ (id)displayItemsToSceneRelevancyResultForZOrderedAppLayouts:(id)a3 withSettings:(id)a4;
@end

@implementation SBSceneRelevancyResolver

+ (id)displayItemsToSceneRelevancyResultForZOrderedAppLayouts:(id)a3 withSettings:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [MEMORY[0x1E4F1C978] array];
  v8 = objc_msgSend(v5, "bs_reduce:block:", v7, &__block_literal_global_243);

  uint64_t v9 = [v8 count];
  v10 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:v9];
  uint64_t v11 = [v6 topMostUnconstrainedScenesMax];
  v30 = v6;
  int v12 = [v6 prefersProcessTaskSuspensionWhileSceneForegroundAndOccluded];
  v13 = +[SBSceneRelevancyResult defaultResult];
  if (v9 >= 1)
  {
    uint64_t v14 = 0;
    int v31 = v12;
    do
    {
      v15 = [v8 objectAtIndex:v14];
      v16 = v15;
      if (v14 >= v11)
      {
        v32 = v13;
        v33[0] = MEMORY[0x1E4F143A8];
        v33[1] = 3221225472;
        v33[2] = __97__SBSceneRelevancyResolver_displayItemsToSceneRelevancyResultForZOrderedAppLayouts_withSettings___block_invoke_2;
        v33[3] = &unk_1E6AF4B60;
        id v17 = v15;
        id v34 = v17;
        v18 = objc_msgSend(v5, "bs_firstObjectPassingTest:", v33);
        v19 = v18;
        if (!v12) {
          goto LABEL_8;
        }
        v20 = [v18 layoutAttributesForItem:v17];
        uint64_t v21 = v9;
        uint64_t v22 = v11;
        v23 = v8;
        v24 = v10;
        id v25 = v5;
        uint64_t v26 = [v20 occlusionState];

        BOOL v27 = v26 == 3;
        id v5 = v25;
        v10 = v24;
        v8 = v23;
        uint64_t v11 = v22;
        uint64_t v9 = v21;
        int v12 = v31;
        if (v27) {
          uint64_t v28 = 1;
        }
        else {
LABEL_8:
        }
          uint64_t v28 = 0;
        v13 = [[SBSceneRelevancyResult alloc] initWithActivityMode:0xFFFFFFFFLL jetsamMode:1 prefersProcessTaskSuspensionWhileSceneForeground:v28];
      }
      [v10 setObject:v13 forKey:v16];

      ++v14;
    }
    while (v9 != v14);
  }

  return v10;
}

id __97__SBSceneRelevancyResolver_displayItemsToSceneRelevancyResultForZOrderedAppLayouts_withSettings___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = [a3 zOrderedItems];
  id v6 = [v4 arrayByAddingObjectsFromArray:v5];

  return v6;
}

uint64_t __97__SBSceneRelevancyResolver_displayItemsToSceneRelevancyResultForZOrderedAppLayouts_withSettings___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 containsItem:*(void *)(a1 + 32)];
}

@end