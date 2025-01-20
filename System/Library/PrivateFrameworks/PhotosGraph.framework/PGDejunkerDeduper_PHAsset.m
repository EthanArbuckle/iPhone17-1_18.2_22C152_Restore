@interface PGDejunkerDeduper_PHAsset
- (BOOL)isJunkForItem:(id)a3;
- (id)bestItemInItems:(id)a3 options:(id)a4;
- (id)debugPersonStringForItem:(id)a3;
- (id)dejunkedDedupedAssetsInAssets:(id)a3 options:(id)a4 debugInfo:(id)a5 progressBlock:(id)a6;
- (id)faceprintByPersonLocalIdentifierByItemIdentifierWithItems:(id)a3;
- (id)featureWithItem:(id)a3;
- (id)itemsSortedByScoreWithItems:(id)a3 options:(id)a4;
- (void)_buildCachesWithAssets:(id)a3 options:(id)a4;
@end

@implementation PGDejunkerDeduper_PHAsset

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_averageFaceQualityByAssetUUID, 0);
  objc_storeStrong((id *)&self->_peopleScenesByAssetUUID, 0);
  objc_storeStrong((id *)&self->_personLocalIdentifiersByAssetUUID, 0);
}

- (id)itemsSortedByScoreWithItems:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 useOnlyScenesForDeduping]) {
    char v8 = 0;
  }
  else {
    char v8 = [v7 useFaceQualityForElection];
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __65__PGDejunkerDeduper_PHAsset_itemsSortedByScoreWithItems_options___block_invoke;
  v11[3] = &unk_1E68EA9A8;
  char v12 = v8;
  v11[4] = self;
  v9 = [v6 sortedArrayUsingComparator:v11];

  return v9;
}

- (id)featureWithItem:(id)a3
{
  id v4 = a3;
  v5 = [v4 uuid];
  id v6 = [(NSDictionary *)self->_personLocalIdentifiersByAssetUUID objectForKeyedSubscript:v5];
  if (v6)
  {
    id v7 = 0;
  }
  else
  {
    id v7 = [(NSDictionary *)self->_peopleScenesByAssetUUID objectForKeyedSubscript:v5];
  }
  char v8 = [PGDejunkerDeduperFeature alloc];
  uint64_t v9 = [v4 isVideo];

  v10 = [(PGDejunkerDeduperFeature *)v8 initWithPersonLocalIdentifiers:v6 peopleScenes:v7 isVideo:v9];
  return v10;
}

- (id)faceprintByPersonLocalIdentifierByItemIdentifierWithItems:(id)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 count])
  {
    id v4 = [v3 firstObject];
    v5 = [v4 photoLibrary];

    id v6 = [v5 librarySpecificFetchOptions];
    v14[0] = *MEMORY[0x1E4F39608];
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
    [v6 setFetchPropertySets:v7];

    char v8 = [MEMORY[0x1E4F39050] fetchFacesGroupedByAssetLocalIdentifierForAssets:v3 options:v6];
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __87__PGDejunkerDeduper_PHAsset_faceprintByPersonLocalIdentifierByItemIdentifierWithItems___block_invoke;
    v12[3] = &unk_1E68EA980;
    id v10 = v9;
    id v13 = v10;
    [v8 enumerateKeysAndObjectsUsingBlock:v12];
  }
  else
  {
    id v10 = (id)MEMORY[0x1E4F1CC08];
  }

  return v10;
}

- (id)debugPersonStringForItem:(id)a3
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(PGDejunkerDeduper_PHAsset *)self featureWithItem:v4];
  id v6 = [v5 personLocalIdentifiers];
  id v7 = [v5 peopleScenes];
  if ([v6 count])
  {
    v36 = v7;
    v38 = v5;
    id v39 = v4;
    char v8 = [v4 photoLibrary];
    uint64_t v9 = [v8 librarySpecificFetchOptions];

    id v10 = (void *)MEMORY[0x1E4F391F0];
    v11 = [v6 allObjects];
    v35 = (void *)v9;
    char v12 = [v10 fetchPersonsWithLocalIdentifiers:v11 options:v9];

    id v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v12, "count"));
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    id v14 = v12;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v44 objects:v49 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v45;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v45 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = *(void **)(*((void *)&v44 + 1) + 8 * i);
          v20 = [v19 localIdentifier];
          [v13 setObject:v19 forKeyedSubscript:v20];
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v44 objects:v49 count:16];
      }
      while (v16);
    }

    id v21 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    v37 = v6;
    id v22 = v6;
    uint64_t v23 = [v22 countByEnumeratingWithState:&v40 objects:v48 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v41;
      do
      {
        for (uint64_t j = 0; j != v24; ++j)
        {
          if (*(void *)v41 != v25) {
            objc_enumerationMutation(v22);
          }
          v27 = *(void **)(*((void *)&v40 + 1) + 8 * j);
          v28 = [v13 objectForKeyedSubscript:v27];
          v29 = [v28 displayName];
          if (![v29 length])
          {
            uint64_t v30 = [v27 substringToIndex:8];

            v29 = (void *)v30;
          }
          [v21 addObject:v29];
        }
        uint64_t v24 = [v22 countByEnumeratingWithState:&v40 objects:v48 count:16];
      }
      while (v24);
    }

    [v21 sortUsingSelector:sel_compare_];
    v31 = [v21 componentsJoinedByString:@", "];

    v5 = v38;
    id v4 = v39;
    id v7 = v36;
    id v6 = v37;
  }
  else if ([v7 count])
  {
    v32 = [v7 allObjects];
    v33 = [v32 sortedArrayUsingSelector:sel_compare_];
    v31 = [v33 componentsJoinedByString:@", "];
  }
  else
  {
    v31 = @"nobody";
  }

  return v31;
}

- (BOOL)isJunkForItem:(id)a3
{
  [a3 clsContentScore];
  return v3 == *MEMORY[0x1E4F8E750];
}

- (id)bestItemInItems:(id)a3 options:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v7 useOnlyScenesForDeduping]) {
    int v8 = 0;
  }
  else {
    int v8 = [v7 useFaceQualityForElection];
  }
  v29 = v7;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (!v10)
  {
    char v12 = 0;
    goto LABEL_26;
  }
  uint64_t v11 = v10;
  char v12 = 0;
  uint64_t v13 = *(void *)v31;
  double v14 = -1.79769313e308;
  double v15 = -1.79769313e308;
  do
  {
    uint64_t v16 = 0;
    double v17 = v15;
    do
    {
      if (*(void *)v31 != v13) {
        objc_enumerationMutation(v9);
      }
      v18 = *(void **)(*((void *)&v30 + 1) + 8 * v16);
      [v18 clsContentScore];
      double v20 = v19;
      if (v8
        && (averageFaceQualityByAssetUUID = self->_averageFaceQualityByAssetUUID,
            [v18 uuid],
            id v22 = objc_claimAutoreleasedReturnValue(),
            [(NSDictionary *)averageFaceQualityByAssetUUID objectForKeyedSubscript:v22],
            uint64_t v23 = objc_claimAutoreleasedReturnValue(),
            v22,
            v23))
      {
        [v23 doubleValue];
        double v15 = v24;
        if (!v12) {
          goto LABEL_21;
        }
      }
      else
      {
        [v18 overallAestheticScore];
        uint64_t v23 = 0;
        double v15 = v25;
        if (!v12) {
          goto LABEL_21;
        }
      }
      if (v20 <= v14 && (v20 != v14 || v15 <= v17))
      {
        double v15 = v17;
        goto LABEL_22;
      }
LABEL_21:
      id v27 = v18;

      double v14 = v20;
      char v12 = v27;
      double v17 = v15;
LABEL_22:

      ++v16;
    }
    while (v11 != v16);
    uint64_t v11 = [v9 countByEnumeratingWithState:&v30 objects:v34 count:16];
  }
  while (v11);
LABEL_26:

  return v12;
}

- (void)_buildCachesWithAssets:(id)a3 options:(id)a4
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v33 = a4;
  uint64_t v35 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v31 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v30 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v32 = [MEMORY[0x1E4F1CAD0] setWithObject:@"#people#"];
  if ([v33 useOnlyScenesForDeduping]) {
    int v6 = 0;
  }
  else {
    int v6 = [v33 useAllPersonsForDeduping];
  }
  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  obuint64_t j = v5;
  uint64_t v7 = [obj countByEnumeratingWithState:&v58 objects:v62 count:16];
  if (v7)
  {
    char v8 = 0;
    uint64_t v9 = *(void *)v59;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v59 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v58 + 1) + 8 * i);
        char v12 = [v11 uuid];
        if (v6)
        {
          uint64_t v13 = [v11 clsFaceInformationSummary];
          double v14 = v13;
          if (!((v13 != 0) | v8 & 1))
          {
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_fault_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Face information expected but not prefetched.", buf, 2u);
            }
            double v14 = 0;
            id v20 = 0;
            char v8 = 1;
            goto LABEL_28;
          }
          if ([v13 numberOfFaces])
          {
            id v15 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
            *(void *)buf = 0;
            v55 = buf;
            uint64_t v56 = 0x2020000000;
            uint64_t v57 = 0;
            uint64_t v50 = 0;
            v51 = &v50;
            uint64_t v52 = 0x2020000000;
            uint64_t v53 = 0;
            uint64_t v46 = 0;
            long long v47 = (double *)&v46;
            uint64_t v48 = 0x2020000000;
            uint64_t v49 = 0;
            uint64_t v16 = [v14 faceInformationByPersonLocalIdentifier];
            v41[0] = MEMORY[0x1E4F143A8];
            v41[1] = 3221225472;
            v41[2] = __60__PGDejunkerDeduper_PHAsset__buildCachesWithAssets_options___block_invoke;
            v41[3] = &unk_1E68EA930;
            id v17 = v15;
            id v42 = v17;
            long long v43 = buf;
            long long v44 = &v50;
            long long v45 = &v46;
            [v16 enumerateKeysAndObjectsUsingBlock:v41];

            if ((unint64_t)[v17 count] <= 2)
            {
              double v18 = v47[3];
              double v19 = [v14 faceInformationByPersonLocalIdentifier];
              v36[0] = MEMORY[0x1E4F143A8];
              v36[1] = 3221225472;
              v36[2] = __60__PGDejunkerDeduper_PHAsset__buildCachesWithAssets_options___block_invoke_2;
              v36[3] = &unk_1E68EA958;
              double v40 = fmax(v18 * 0.5, 0.05);
              id v37 = v17;
              v38 = buf;
              id v39 = &v50;
              [v19 enumerateKeysAndObjectsUsingBlock:v36];
            }
            id v20 = v17;
            if ([v20 count])
            {
              unint64_t v21 = v51[3];
              if (v21) {
                double v22 = *((double *)v55 + 3) / (double)v21;
              }
              else {
                double v22 = 0.0;
              }
              *((double *)v55 + 3) = v22;
              uint64_t v23 = objc_msgSend(NSNumber, "numberWithDouble:");
              [(NSDictionary *)v30 setObject:v23 forKeyedSubscript:v12];
            }
            _Block_object_dispose(&v46, 8);
            _Block_object_dispose(&v50, 8);
            _Block_object_dispose(buf, 8);

            goto LABEL_28;
          }
LABEL_24:
          id v20 = 0;
          goto LABEL_28;
        }
        if ([v33 useOnlyScenesForDeduping])
        {
          id v20 = 0;
          goto LABEL_29;
        }
        double v14 = [v11 clsPersonLocalIdentifiers];
        if (![v14 count]) {
          goto LABEL_24;
        }
        id v20 = [MEMORY[0x1E4F1CAD0] setWithArray:v14];
LABEL_28:

LABEL_29:
        if ([v20 count]) {
          [(NSDictionary *)v35 setObject:v20 forKeyedSubscript:v12];
        }
        if ([v11 clsIsInhabited]) {
          [(NSDictionary *)v31 setObject:v32 forKeyedSubscript:v12];
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v58 objects:v62 count:16];
    }
    while (v7);
  }

  personLocalIdentifiersByAssetUUID = self->_personLocalIdentifiersByAssetUUID;
  self->_personLocalIdentifiersByAssetUUID = v35;
  float v25 = v35;

  peopleScenesByAssetUUID = self->_peopleScenesByAssetUUID;
  self->_peopleScenesByAssetUUID = v31;
  id v27 = v31;

  averageFaceQualityByAssetUUID = self->_averageFaceQualityByAssetUUID;
  self->_averageFaceQualityByAssetUUID = v30;
}

- (id)dejunkedDedupedAssetsInAssets:(id)a3 options:(id)a4 debugInfo:(id)a5 progressBlock:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  [(PGDejunkerDeduper_PHAsset *)self _buildCachesWithAssets:v13 options:v12];
  v16.receiver = self;
  v16.super_class = (Class)PGDejunkerDeduper_PHAsset;
  double v14 = [(PGDejunkerDeduper_CLSCurationItem *)&v16 dejunkedDedupedItemsInItems:v13 options:v12 debugInfo:v11 progressBlock:v10];

  return v14;
}

@end