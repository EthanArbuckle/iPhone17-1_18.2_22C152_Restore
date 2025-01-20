@interface PGShareBackSceneprintSource
- (BOOL)isSimilarSuggesterInput:(id)a3 toMomentNode:(id)a4 inGraph:(id)a5 error:(id *)a6;
- (BOOL)prepareSourceWithGraph:(id)a3;
- (PGShareBackSceneprintSource)initWithLoggingConnection:(id)a3 photoLibrary:(id)a4;
- (id)getAssetsInMomentNode:(id)a3 inGraph:(id)a4 error:(id *)a5;
- (id)suggesterResultsForInputs:(id)a3 momentNodes:(id)a4 inGraph:(id)a5 error:(id *)a6;
- (id)validInputsForSource:(id)a3 givenSuggesterResults:(id)a4;
@end

@implementation PGShareBackSceneprintSource

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetsInMomentCache, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
}

- (id)suggesterResultsForInputs:(id)a3 momentNodes:(id)a4 inGraph:(id)a5 error:(id *)a6
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ([v11 count])
  {
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    id v13 = v10;
    uint64_t v38 = [v13 countByEnumeratingWithState:&v49 objects:v58 count:16];
    if (v38)
    {
      uint64_t v14 = *(void *)v50;
      id v40 = v11;
      id v41 = v10;
      v42 = v13;
      v36 = a6;
      uint64_t v37 = *(void *)v50;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v50 != v14) {
            objc_enumerationMutation(v13);
          }
          uint64_t v39 = v15;
          v16 = *(void **)(*((void *)&v49 + 1) + 8 * v15);
          context = (void *)MEMORY[0x1D25FED50]();
          long long v45 = 0u;
          long long v46 = 0u;
          long long v47 = 0u;
          long long v48 = 0u;
          id v17 = v11;
          uint64_t v18 = [v17 countByEnumeratingWithState:&v45 objects:v57 count:16];
          if (!v18) {
            goto LABEL_20;
          }
          uint64_t v19 = v18;
          uint64_t v20 = *(void *)v46;
          while (2)
          {
            for (uint64_t i = 0; i != v19; ++i)
            {
              if (*(void *)v46 != v20) {
                objc_enumerationMutation(v17);
              }
              v22 = *(void **)(*((void *)&v45 + 1) + 8 * i);
              id v44 = 0;
              BOOL v23 = [(PGShareBackSceneprintSource *)self isSimilarSuggesterInput:v16 toMomentNode:v22 inGraph:v12 error:&v44];
              id v24 = v44;
              if (v24) {
                BOOL v25 = 1;
              }
              else {
                BOOL v25 = !v23;
              }
              if (!v25)
              {
                v29 = [(PGShareBackSource *)self loggingConnection];
                if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
                {
                  v31 = [v16 asset];
                  v32 = [v31 uuid];
                  v33 = [v22 uuid];
                  *(_DWORD *)buf = 138412546;
                  v54 = v32;
                  __int16 v55 = 2112;
                  v56 = v33;
                  _os_log_impl(&dword_1D1805000, v29, OS_LOG_TYPE_INFO, "[PGShareBackSceneprintSource] Input asset %@ is identified as having a common staging similarity to moment node %@", buf, 0x16u);
                }
                id v27 = v42;
                v34 = [[PGShareBackSuggesterResult alloc] initWithInputs:v42 processingValue:0x2000 momentNodes:v17];
                v28 = [MEMORY[0x1E4F1C978] arrayWithObject:v34];

                goto LABEL_30;
              }
              v26 = v24;
              if (v24)
              {

                if (v36)
                {
                  id v27 = v26;
                  v28 = 0;
                  id *v36 = v27;
                }
                else
                {
                  v28 = (void *)MEMORY[0x1E4F1CBF0];
                  id v27 = v26;
                }
LABEL_30:
                id v11 = v40;
                id v10 = v41;
                goto LABEL_31;
              }
            }
            uint64_t v19 = [v17 countByEnumeratingWithState:&v45 objects:v57 count:16];
            id v11 = v40;
            id v10 = v41;
            if (v19) {
              continue;
            }
            break;
          }
LABEL_20:

          uint64_t v15 = v39 + 1;
          id v13 = v42;
          uint64_t v14 = v37;
        }
        while (v39 + 1 != v38);
        uint64_t v38 = [v42 countByEnumeratingWithState:&v49 objects:v58 count:16];
      }
      while (v38);
    }

    id v27 = 0;
    v28 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_31:
  }
  else
  {
    v28 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v28;
}

- (BOOL)isSimilarSuggesterInput:(id)a3 toMomentNode:(id)a4 inGraph:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = [(PGShareBackSceneprintSource *)self getAssetsInMomentNode:a4 inGraph:a5 error:a6];
  id v12 = v11;
  if (v11)
  {
    id v13 = (void *)[v11 mutableCopy];
    uint64_t v14 = [v10 asset];
    [v13 removeObject:v14];

    if ([v13 count])
    {
      uint64_t v15 = (void *)MEMORY[0x1E4F8E878];
      v16 = [v10 asset];
      char v17 = [v15 isAsset:v16 similarToAnyAssets:v13 withinThresholdType:2];
    }
    else
    {
      char v17 = 0;
    }
  }
  else
  {
    char v17 = 0;
  }

  return v17;
}

- (id)getAssetsInMomentNode:(id)a3 inGraph:(id)a4 error:(id *)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  assetsInMomentCache = self->_assetsInMomentCache;
  id v11 = [v8 localIdentifier];
  id v12 = [(NSCache *)assetsInMomentCache objectForKey:v11];

  if (!v12)
  {
    id v13 = [(PHPhotoLibrary *)self->_photoLibrary librarySpecificFetchOptions];
    uint64_t v14 = [MEMORY[0x1E4F8E878] requiredFetchPropertySets];
    [v13 setFetchPropertySets:v14];

    uint64_t v15 = [v9 momentForMomentNode:v8 inPhotoLibrary:self->_photoLibrary];
    if (v15)
    {
      v16 = (void *)v15;
      char v17 = [MEMORY[0x1E4F38EB8] fetchAssetsInAssetCollection:v15 options:v13];
      id v18 = objc_alloc(MEMORY[0x1E4F1C978]);
      uint64_t v19 = [v17 fetchedObjects];
      id v12 = (void *)[v18 initWithArray:v19 copyItems:0];

      uint64_t v20 = self->_assetsInMomentCache;
      v21 = [v8 localIdentifier];
      [(NSCache *)v20 setObject:v12 forKey:v21];
    }
    else
    {
      v22 = (void *)MEMORY[0x1E4F28C58];
      BOOL v23 = NSString;
      id v24 = [v8 uuid];
      BOOL v25 = [v23 stringWithFormat:@"Error while getting the PHMoment associated to moment node %@", v24];
      v26 = [v22 errorWithDescription:v25];

      if (a5) {
        *a5 = v26;
      }
      id v27 = [(PGShareBackSource *)self loggingConnection];
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        v28 = [v26 description];
        *(_DWORD *)buf = 138412290;
        v31 = v28;
        _os_log_impl(&dword_1D1805000, v27, OS_LOG_TYPE_INFO, "[PGShareBackSceneprintSource] %@", buf, 0xCu);
      }
      id v12 = 0;
    }
  }

  return v12;
}

- (id)validInputsForSource:(id)a3 givenSuggesterResults:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  v6 = (void *)[a3 mutableCopy];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if ((objc_msgSend(v12, "processingValue", (void)v15) & 8) != 0)
        {
          id v13 = [v12 suggesterInputs];
          [v6 removeObjectsInArray:v13];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }

  return v6;
}

- (BOOL)prepareSourceWithGraph:(id)a3
{
  return 1;
}

- (PGShareBackSceneprintSource)initWithLoggingConnection:(id)a3 photoLibrary:(id)a4
{
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PGShareBackSceneprintSource;
  uint64_t v8 = [(PGShareBackSource *)&v13 initWithLoggingConnection:a3];
  uint64_t v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_photoLibrary, a4);
    uint64_t v10 = (NSCache *)objc_alloc_init(MEMORY[0x1E4F1C998]);
    assetsInMomentCache = v9->_assetsInMomentCache;
    v9->_assetsInMomentCache = v10;

    [(NSCache *)v9->_assetsInMomentCache setCountLimit:50];
  }

  return v9;
}

@end