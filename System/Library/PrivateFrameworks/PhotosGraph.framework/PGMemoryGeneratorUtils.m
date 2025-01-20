@interface PGMemoryGeneratorUtils
+ (BOOL)isImportedAsset:(id)a3;
+ (id)_outdoorROITypes;
+ (id)babyAndChildPersonNodesAtHomeOrFrequentLocationInGraph:(id)a3;
+ (id)filterImportedAssets:(id)a3 byOverlapWithRelevantAssets:(id)a4 withGraph:(id)a5;
+ (id)filterImportedAssetsWithoutLocationAndWithoutSceneOrPersonOverlapFromAllAssets:(id)a3 withGraph:(id)a4;
+ (id)momentNodesAtHomeOrWorkOrFrequentLocationInGraph:(id)a3;
+ (id)outdoorROIMomentNodesNotAtHomeOrFrequentLocationInGraph:(id)a3 useMomentFeatureEdges:(BOOL)a4;
+ (id)outdoorROINodesInGraph:(id)a3;
+ (id)personAndPetLocalIdentifiersInAssets:(id)a3;
@end

@implementation PGMemoryGeneratorUtils

+ (BOOL)isImportedAsset:(id)a3
{
  v3 = [a3 importProperties];
  unint64_t v4 = [v3 importedBy];

  return (v4 < 0xF) & (0x2FF8u >> v4);
}

+ (id)personAndPetLocalIdentifiersInAssets:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "clsPersonAndPetLocalIdentifiers", (void)v12);
        [v4 addObjectsFromArray:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

+ (id)filterImportedAssets:(id)a3 byOverlapWithRelevantAssets:(id)a4 withGraph:(id)a5
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = objc_alloc(MEMORY[0x1E4F1CA80]);
  v38 = v9;
  long long v12 = [a1 personAndPetLocalIdentifiersInAssets:v9];
  long long v13 = (void *)[v11 initWithSet:v12];

  v35 = v10;
  long long v14 = [v10 meNode];
  uint64_t v15 = [v14 localIdentifier];

  if (v15) {
    [v13 addObject:v15];
  }
  v34 = (void *)v15;
  v37 = v13;
  v16 = (void *)[objc_alloc(MEMORY[0x1E4F76DA0]) initWithSimilarityModelClass:objc_opt_class()];
  id v39 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  obuint64_t j = v8;
  uint64_t v17 = [obj countByEnumeratingWithState:&v45 objects:v50 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v40 = *(void *)v46;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v46 != v40) {
          objc_enumerationMutation(obj);
        }
        v20 = *(void **)(*((void *)&v45 + 1) + 8 * i);
        id v21 = objc_alloc(MEMORY[0x1E4F1CAD0]);
        v22 = [v20 clsPersonAndPetLocalIdentifiers];
        v23 = (void *)[v21 initWithArray:v22];

        if ([v23 count] && objc_msgSend(v23, "isSubsetOfSet:", v37))
        {
          [v39 addObject:v20];
        }
        else
        {
          uint64_t v24 = [v20 clsSimilarityModelVersion];
          long long v41 = 0u;
          long long v42 = 0u;
          long long v43 = 0u;
          long long v44 = 0u;
          id v25 = v38;
          uint64_t v26 = [v25 countByEnumeratingWithState:&v41 objects:v49 count:16];
          if (v26)
          {
            uint64_t v27 = v26;
            uint64_t v28 = *(void *)v42;
            while (2)
            {
              for (uint64_t j = 0; j != v27; ++j)
              {
                if (*(void *)v42 != v28) {
                  objc_enumerationMutation(v25);
                }
                [v16 distanceBetweenItem:v20 andItem:*(void *)(*((void *)&v41 + 1) + 8 * j)];
                double v31 = v30;
                [v16 distanceThresholdForSimilarity:2 withSimilarityModelVersion:v24];
                if (v31 < v32)
                {
                  [v39 addObject:v20];
                  goto LABEL_21;
                }
              }
              uint64_t v27 = [v25 countByEnumeratingWithState:&v41 objects:v49 count:16];
              if (v27) {
                continue;
              }
              break;
            }
          }
LABEL_21:
        }
      }
      uint64_t v18 = [obj countByEnumeratingWithState:&v45 objects:v50 count:16];
    }
    while (v18);
  }

  return v39;
}

+ (id)filterImportedAssetsWithoutLocationAndWithoutSceneOrPersonOverlapFromAllAssets:(id)a3 withGraph:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v23 != v12) {
          objc_enumerationMutation(v9);
        }
        long long v14 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        uint64_t v15 = (void *)MEMORY[0x1E4F8A930];
        objc_msgSend(v14, "locationCoordinate", (void)v22);
        if ((objc_msgSend(v15, "canUseCoordinate:") & 1) == 0
          && [a1 isImportedAsset:v14])
        {
          [v8 addObject:v14];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v11);
  }

  if ([v8 count] && objc_msgSend(v9, "count"))
  {
    double v16 = (double)(unint64_t)[v8 count];
    double v17 = v16 / (double)(unint64_t)[v9 count];
    uint64_t v18 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithArray:v9];
    [v18 minusSet:v8];
    if (v17 >= 0.25 || (unint64_t)[v18 count] <= 0xD)
    {
      id v20 = (id)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v9];
    }
    else
    {
      v19 = [a1 filterImportedAssets:v8 byOverlapWithRelevantAssets:v18 withGraph:v7];
      [v18 unionSet:v19];
      id v20 = v18;
    }
  }
  else
  {
    id v20 = (id)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v9];
  }

  return v20;
}

+ (id)momentNodesAtHomeOrWorkOrFrequentLocationInGraph:(id)a3
{
  id v3 = a3;
  id v4 = +[PGGraphNodeCollection nodesInGraph:v3];
  id v5 = [v4 momentNodes];
  id v6 = +[PGGraphNodeCollection nodesInGraph:v3];

  id v7 = [v6 addressNodes];
  id v8 = [v7 momentNodes];

  id v9 = [v5 collectionByFormingUnionWith:v8];

  return v9;
}

+ (id)_outdoorROITypes
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  [v2 addIndex:2];
  [v2 addIndex:3];
  [v2 addIndex:4];
  [v2 addIndex:5];
  return v2;
}

+ (id)outdoorROIMomentNodesNotAtHomeOrFrequentLocationInGraph:(id)a3 useMomentFeatureEdges:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = +[PGGraphNodeCollection nodesInGraph:v6];
  id v8 = [v7 addressNodes];
  id v9 = [v8 momentNodes];

  uint64_t v10 = +[PGGraphNodeCollection nodesInGraph:v6];
  uint64_t v11 = [v10 momentNodes];
  uint64_t v12 = [v9 collectionByFormingUnionWith:v11];
  long long v13 = [a1 outdoorROINodesInGraph:v6];

  if (v4)
  {
    long long v14 = [v13 featureNodeCollection];
    uint64_t v15 = [v14 momentNodes];
  }
  else
  {
    uint64_t v15 = [v13 momentNodes];
  }
  double v16 = [v15 collectionBySubtracting:v12];

  return v16;
}

+ (id)outdoorROINodesInGraph:(id)a3
{
  id v4 = a3;
  id v5 = [a1 _outdoorROITypes];
  id v6 = +[PGGraphROINodeCollection roiNodesOfTypes:v5 inGraph:v4];

  return v6;
}

+ (id)babyAndChildPersonNodesAtHomeOrFrequentLocationInGraph:(id)a3
{
  id v3 = a3;
  id v4 = +[PGGraphPersonNodeCollection personNodesInAgeCategories:&unk_1F28D4068 includingMe:0 inGraph:v3];
  if ([v4 count])
  {
    id v5 = [v3 meNodeCollection];
    id v6 = [v5 homeNodes];
    id v7 = [v6 addressNodes];
    id v8 = [v7 momentNodes];
    id v9 = [v8 personNodes];

    uint64_t v10 = +[PGGraphNodeCollection nodesInGraph:v3];

    uint64_t v11 = [v10 momentNodes];
    uint64_t v12 = [v11 personNodes];

    long long v13 = [v9 collectionByFormingUnionWith:v12];
    long long v14 = [v13 collectionByIntersecting:v4];

    id v3 = v9;
  }
  else
  {
    long long v14 = [(MAElementCollection *)[PGGraphPersonNodeCollection alloc] initWithGraph:v3];
  }

  return v14;
}

@end