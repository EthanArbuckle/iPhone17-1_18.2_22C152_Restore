@interface PGMemoryController
+ (BOOL)anyBlockedFeatureIn:(id)a3 isHitByEvent:(id)a4;
+ (id)_localIdentifierOfMainPersonInEvent:(id)a3 prominentOnly:(BOOL)a4;
- (BOOL)anyBlockedFeatureIsHitByEvent:(id)a3;
- (BOOL)libraryHasEnoughProcessedScenes:(BOOL)a3 andProcessedFaces:(BOOL)a4;
- (BOOL)libraryHasEnoughScenesProcessed:(BOOL)a3 haveFacesProcessed:(BOOL)a4 forYear:(id)a5 withGraph:(id)a6;
- (BOOL)momentNodesHaveScenesProcessed:(id)a3 inGraph:(id)a4;
- (OS_os_log)loggingConnection;
- (PGCurationManager)curationManager;
- (PGMemoryController)initWithGraph:(id)a3 photoLibrary:(id)a4 loggingConnection:(id)a5;
- (PGMemoryController)initWithPhotoLibrary:(id)a3 loggingConnection:(id)a4;
- (PGMemoryGenerationContext)memoryGenerationContext;
- (PHPhotoLibrary)photoLibrary;
- (id)assetCollectionWithAssetLocalIdentifiers:(id)a3;
- (id)momentForMomentID:(id)a3;
- (id)progressBlock;
- (void)setMemoryGenerationContext:(id)a3;
- (void)setProgressBlock:(id)a3;
@end

@implementation PGMemoryController

- (void).cxx_destruct
{
  objc_storeStrong(&self->_progressBlock, 0);
  objc_storeStrong((id *)&self->_loggingConnection, 0);
  objc_storeStrong((id *)&self->_memoryGenerationContext, 0);
  objc_storeStrong((id *)&self->_curationManager, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_momentsByMomentIDs, 0);
  objc_storeStrong((id *)&self->_graph, 0);
}

- (void)setProgressBlock:(id)a3
{
}

- (id)progressBlock
{
  return objc_getProperty(self, a2, 56, 1);
}

- (OS_os_log)loggingConnection
{
  return (OS_os_log *)objc_getProperty(self, a2, 48, 1);
}

- (void)setMemoryGenerationContext:(id)a3
{
}

- (PGMemoryGenerationContext)memoryGenerationContext
{
  return self->_memoryGenerationContext;
}

- (PGCurationManager)curationManager
{
  return (PGCurationManager *)objc_getProperty(self, a2, 32, 1);
}

- (PHPhotoLibrary)photoLibrary
{
  return (PHPhotoLibrary *)objc_getProperty(self, a2, 24, 1);
}

- (BOOL)momentNodesHaveScenesProcessed:(id)a3 inGraph:(id)a4
{
  memoryGenerationContext = self->_memoryGenerationContext;
  id v6 = a4;
  id v7 = a3;
  v8 = [(PGMemoryGenerationContext *)memoryGenerationContext processedScenesAndFacesCache];
  char v9 = [v8 allMomentNodesHaveScenesProcessed:v7 inGraph:v6];

  return v9;
}

- (BOOL)libraryHasEnoughScenesProcessed:(BOOL)a3 haveFacesProcessed:(BOOL)a4 forYear:(id)a5 withGraph:(id)a6
{
  BOOL v7 = a4;
  BOOL v8 = a3;
  memoryGenerationContext = self->_memoryGenerationContext;
  id v10 = a6;
  id v11 = a5;
  v12 = [(PGMemoryGenerationContext *)memoryGenerationContext processedScenesAndFacesCache];
  uint64_t v13 = [v11 integerValue];

  LOBYTE(v11) = [v12 libraryHasEnoughScenesProcessed:v8 andProcessedFaces:v7 forYear:v13 inGraph:v10];
  return (char)v11;
}

- (BOOL)libraryHasEnoughProcessedScenes:(BOOL)a3 andProcessedFaces:(BOOL)a4
{
  uint64_t v4 = a4;
  BOOL v5 = a3;
  id v6 = [(PGMemoryGenerationContext *)self->_memoryGenerationContext processedScenesAndFacesCache];
  LOBYTE(v4) = [v6 libraryHasEnoughScenesProcessed:v5 andProcessedFaces:v4];

  return v4;
}

- (id)momentForMomentID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    BOOL v5 = self->_momentsByMomentIDs;
    objc_sync_enter(v5);
    id v6 = [(NSMutableDictionary *)self->_momentsByMomentIDs objectForKeyedSubscript:v4];
    if (!v6)
    {
      BOOL v7 = [(PHPhotoLibrary *)self->_photoLibrary librarySpecificFetchOptions];
      [v7 setFetchLimit:1];
      BOOL v8 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"localIdentifier == %@", v4];
      [v7 setPredicate:v8];

      char v9 = [MEMORY[0x1E4F38EE8] fetchMomentsWithOptions:v7];
      id v6 = [v9 firstObject];
      if (v6) {
        [(NSMutableDictionary *)self->_momentsByMomentIDs setObject:v6 forKeyedSubscript:v4];
      }
    }
    objc_sync_exit(v5);
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (PGMemoryController)initWithPhotoLibrary:(id)a3 loggingConnection:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PGMemoryController;
  char v9 = [(PGMemoryController *)&v13 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_photoLibrary, a3);
    objc_storeStrong((id *)&v10->_loggingConnection, a4);
    id progressBlock = v10->_progressBlock;
    v10->_id progressBlock = &__block_literal_global_8414;
  }
  return v10;
}

- (PGMemoryController)initWithGraph:(id)a3 photoLibrary:(id)a4 loggingConnection:(id)a5
{
  id v9 = a3;
  id v10 = [(PGMemoryController *)self initWithPhotoLibrary:a4 loggingConnection:a5];
  id v11 = v10;
  if (v10) {
    objc_storeStrong((id *)&v10->_graph, a3);
  }

  return v11;
}

- (id)assetCollectionWithAssetLocalIdentifiers:(id)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [(PGMemoryController *)self photoLibrary];
  id v6 = [v5 librarySpecificFetchOptions];

  v12[0] = *MEMORY[0x1E4F394A8];
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  [v6 setFetchPropertySets:v7];

  id v8 = +[PGCurationManager defaultAssetSortDescriptors];
  [v6 setSortDescriptors:v8];

  [v6 setIncludeGuestAssets:1];
  id v9 = [MEMORY[0x1E4F38EB8] fetchAssetsWithLocalIdentifiers:v4 options:v6];

  id v10 = [MEMORY[0x1E4F38EE8] transientAssetCollectionWithAssetFetchResult:v9 title:0];

  return v10;
}

- (BOOL)anyBlockedFeatureIsHitByEvent:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(PGMemoryController *)self memoryGenerationContext];
  id v6 = [v5 momentNodesWithBlockedFeatureCache];
  id v7 = [v6 momentNodesWithBlockedFeature];

  LOBYTE(v5) = [v7 containsNode:v4];
  return (char)v5;
}

+ (BOOL)anyBlockedFeatureIn:(id)a3 isHitByEvent:(id)a4
{
  uint64_t v99 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v57 = v5;
  if ([v5 count])
  {
    long long v90 = 0u;
    long long v91 = 0u;
    long long v88 = 0u;
    long long v89 = 0u;
    v55 = v6;
    id v7 = [v6 celebratedHolidayNodes];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v88 objects:v98 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v89;
      uint64_t v56 = *(void *)v89;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v89 != v9) {
            objc_enumerationMutation(v7);
          }
          id v11 = *(void **)(*((void *)&v88 + 1) + 8 * i);
          long long v84 = 0u;
          long long v85 = 0u;
          long long v86 = 0u;
          long long v87 = 0u;
          id v12 = v57;
          uint64_t v13 = [v12 countByEnumeratingWithState:&v84 objects:v97 count:16];
          if (v13)
          {
            uint64_t v14 = *(void *)v85;
            while (2)
            {
              for (uint64_t j = 0; j != v13; ++j)
              {
                if (*(void *)v85 != v14) {
                  objc_enumerationMutation(v12);
                }
                v16 = *(void **)(*((void *)&v84 + 1) + 8 * j);
                v17 = [v11 name];
                LOBYTE(v16) = [v16 collidesWithHolidayWithName:v17];

                if (v16)
                {
LABEL_59:
                  BOOL v46 = 1;
                  goto LABEL_60;
                }
              }
              uint64_t v13 = [v12 countByEnumeratingWithState:&v84 objects:v97 count:16];
              if (v13) {
                continue;
              }
              break;
            }
          }

          uint64_t v9 = v56;
        }
        uint64_t v8 = [v7 countByEnumeratingWithState:&v88 objects:v98 count:16];
        uint64_t v9 = v56;
      }
      while (v8);
    }

    long long v82 = 0u;
    long long v83 = 0u;
    long long v80 = 0u;
    long long v81 = 0u;
    id v7 = [v55 dateNodes];
    uint64_t v52 = [v7 countByEnumeratingWithState:&v80 objects:v96 count:16];
    if (v52)
    {
      uint64_t v18 = *(void *)v81;
      uint64_t v48 = *(void *)v81;
      do
      {
        uint64_t v19 = 0;
        do
        {
          if (*(void *)v81 != v18)
          {
            uint64_t v20 = v19;
            objc_enumerationMutation(v7);
            uint64_t v19 = v20;
          }
          uint64_t v50 = v19;
          v21 = *(void **)(*((void *)&v80 + 1) + 8 * v19);
          long long v76 = 0u;
          long long v77 = 0u;
          long long v78 = 0u;
          long long v79 = 0u;
          id v22 = v57;
          uint64_t v23 = [v22 countByEnumeratingWithState:&v76 objects:v95 count:16];
          if (v23)
          {
            uint64_t v24 = *(void *)v77;
            while (2)
            {
              for (uint64_t k = 0; k != v23; ++k)
              {
                if (*(void *)v77 != v24) {
                  objc_enumerationMutation(v22);
                }
                v26 = *(void **)(*((void *)&v76 + 1) + 8 * k);
                v27 = [v21 localDate];
                char v28 = [v26 collidesWithDate:v27];

                uint64_t v72 = 0;
                v73 = &v72;
                uint64_t v74 = 0x2020000000;
                char v75 = 0;
                if ((v28 & 1) != 0
                  || (v71[0] = MEMORY[0x1E4F143A8],
                      v71[1] = 3221225472,
                      v71[2] = __72__PGMemoryController_FeatureBlocking__anyBlockedFeatureIn_isHitByEvent___block_invoke,
                      v71[3] = &unk_1E68F09B0,
                      v71[4] = v26,
                      v71[5] = &v72,
                      [v21 enumerateHolidayNodesUsingBlock:v71],
                      *((unsigned char *)v73 + 24)))
                {
LABEL_58:
                  _Block_object_dispose(&v72, 8);
                  goto LABEL_59;
                }
                _Block_object_dispose(&v72, 8);
              }
              uint64_t v23 = [v22 countByEnumeratingWithState:&v76 objects:v95 count:16];
              if (v23) {
                continue;
              }
              break;
            }
          }

          uint64_t v19 = v50 + 1;
          uint64_t v18 = v48;
        }
        while (v50 + 1 != v52);
        uint64_t v52 = [v7 countByEnumeratingWithState:&v80 objects:v96 count:16];
        uint64_t v18 = v48;
      }
      while (v52);
    }

    long long v69 = 0u;
    long long v70 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    id v7 = [v55 addressNodes];
    uint64_t v53 = [v7 countByEnumeratingWithState:&v67 objects:v94 count:16];
    if (v53)
    {
      uint64_t v29 = *(void *)v68;
      uint64_t v49 = *(void *)v68;
      while (2)
      {
        uint64_t v30 = 0;
        do
        {
          if (*(void *)v68 != v29)
          {
            uint64_t v31 = v30;
            objc_enumerationMutation(v7);
            uint64_t v30 = v31;
          }
          uint64_t v51 = v30;
          v32 = *(void **)(*((void *)&v67 + 1) + 8 * v30);
          long long v63 = 0u;
          long long v64 = 0u;
          long long v65 = 0u;
          long long v66 = 0u;
          id v33 = v57;
          uint64_t v34 = [v33 countByEnumeratingWithState:&v63 objects:v93 count:16];
          if (v34)
          {
            uint64_t v35 = *(void *)v64;
LABEL_40:
            uint64_t v36 = 0;
            while (1)
            {
              if (*(void *)v64 != v35) {
                objc_enumerationMutation(v33);
              }
              v37 = *(void **)(*((void *)&v63 + 1) + 8 * v36);
              [v32 coordinate];
              char v38 = objc_msgSend(v37, "collidesWithLocationAtCoordinates:");
              uint64_t v72 = 0;
              v73 = &v72;
              uint64_t v74 = 0x2020000000;
              char v75 = 0;
              if (v38) {
                goto LABEL_58;
              }
              v39 = [v32 collection];
              v40 = [v39 areaNodes];
              v62[0] = MEMORY[0x1E4F143A8];
              v62[1] = 3221225472;
              v62[2] = __72__PGMemoryController_FeatureBlocking__anyBlockedFeatureIn_isHitByEvent___block_invoke_2;
              v62[3] = &unk_1E68EE470;
              v62[4] = v37;
              v62[5] = &v72;
              [v40 enumerateNodesUsingBlock:v62];

              if (*((unsigned char *)v73 + 24)) {
                goto LABEL_58;
              }
              _Block_object_dispose(&v72, 8);
              if (v34 == ++v36)
              {
                uint64_t v34 = [v33 countByEnumeratingWithState:&v63 objects:v93 count:16];
                if (v34) {
                  goto LABEL_40;
                }
                break;
              }
            }
          }

          uint64_t v30 = v51 + 1;
          uint64_t v29 = v49;
        }
        while (v51 + 1 != v53);
        uint64_t v53 = [v7 countByEnumeratingWithState:&v67 objects:v94 count:16];
        uint64_t v29 = v49;
        if (v53) {
          continue;
        }
        break;
      }
    }

    id v7 = [a1 _localIdentifierOfMainPersonInEvent:v55 prominentOnly:0];
    long long v60 = 0u;
    long long v61 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    id v41 = v57;
    uint64_t v42 = [v41 countByEnumeratingWithState:&v58 objects:v92 count:16];
    if (v42)
    {
      uint64_t v43 = *(void *)v59;
      do
      {
        for (uint64_t m = 0; m != v42; ++m)
        {
          if (*(void *)v59 != v43) {
            objc_enumerationMutation(v41);
          }
          char v45 = [*(id *)(*((void *)&v58 + 1) + 8 * m) collidesWithPersonWithLocalIdentifier:v7];
        }
        BOOL v46 = v45;
        uint64_t v42 = [v41 countByEnumeratingWithState:&v58 objects:v92 count:16];
      }
      while (v42);
    }
    else
    {
      BOOL v46 = 0;
    }
LABEL_60:

    id v6 = v55;
  }
  else
  {
    BOOL v46 = 0;
  }

  return v46;
}

void __72__PGMemoryController_FeatureBlocking__anyBlockedFeatureIn_isHitByEvent___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = [a2 name];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v5 collidesWithHolidayWithName:v6];

  *a3 = *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
}

void __72__PGMemoryController_FeatureBlocking__anyBlockedFeatureIn_isHitByEvent___block_invoke_2(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = [a2 name];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v5 collidesWithAreaWithName:v6];

  *a3 = *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
}

+ (id)_localIdentifierOfMainPersonInEvent:(id)a3 prominentOnly:(BOOL)a4
{
  BOOL v26 = a4;
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v24 = a3;
  id v4 = [v24 eventCollection];
  uint64_t v29 = [v4 eventMomentNodes];

  unint64_t v5 = [v29 numberOfAssets];
  uint64_t v6 = 3;
  if (v26) {
    double v7 = 0.8;
  }
  else {
    double v7 = 0.45;
  }
  if (v26) {
    double v8 = 0.2;
  }
  else {
    double v8 = 0.15;
  }
  long long v37 = 0u;
  long long v38 = 0u;
  if (!v26) {
    uint64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
  }
  unint64_t v28 = v6;
  long long v39 = 0uLL;
  long long v40 = 0uLL;
  obuint64_t j = [v24 personNodes];
  uint64_t v9 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
  if (!v9)
  {
LABEL_32:
    id v11 = 0;
    goto LABEL_33;
  }
  uint64_t v10 = 0;
  id v11 = 0;
  unint64_t v12 = vcvtpd_u64_f64(v7 * (double)v5);
  unint64_t v25 = vcvtmd_u64_f64(v8 * (double)v5);
  uint64_t v13 = *(void *)v38;
  while (2)
  {
    uint64_t v14 = 0;
    uint64_t v15 = v10 + 1;
    uint64_t v23 = v10 + v9;
    do
    {
      if (*(void *)v38 != v13) {
        objc_enumerationMutation(obj);
      }
      if (v15 + v14 > v28)
      {

        goto LABEL_32;
      }
      v16 = *(void **)(*((void *)&v37 + 1) + 8 * v14);
      v17 = [v16 collection];
      uint64_t v33 = 0;
      uint64_t v34 = &v33;
      uint64_t v35 = 0x2020000000;
      uint64_t v36 = 0;
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __89__PGMemoryController_FeatureBlocking___localIdentifierOfMainPersonInEvent_prominentOnly___block_invoke;
      v30[3] = &unk_1E68EF7D8;
      id v18 = v17;
      id v31 = v18;
      v32 = &v33;
      [v29 enumerateIdentifiersAsCollectionsWithBlock:v30];
      unint64_t v19 = v34[3];
      if (v19 >= v12)
      {
        if (v11 || ([v16 isMeNode] & 1) != 0)
        {
          if (![v16 isMeNode] || v26)
          {
LABEL_24:

            int v20 = 0;
            id v11 = 0;
            goto LABEL_27;
          }
        }
        else
        {
          id v11 = v16;
        }
      }
      else if (v19 > v25 && (![v16 isMeNode] || v26))
      {
        goto LABEL_24;
      }
      int v20 = 1;
LABEL_27:

      _Block_object_dispose(&v33, 8);
      if (!v20) {
        goto LABEL_33;
      }
      ++v14;
    }
    while (v9 != v14);
    uint64_t v9 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
    uint64_t v10 = v23;
    if (v9) {
      continue;
    }
    break;
  }
LABEL_33:

  v21 = [v11 localIdentifier];

  return v21;
}

void __89__PGMemoryController_FeatureBlocking___localIdentifierOfMainPersonInEvent_prominentOnly___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4 = +[PGGraphEdgeCollection edgesFromNodes:*(void *)(a1 + 32) toNodes:a3];
  id v5 = [v4 anyEdge];

  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += [v5 numberOfAssets];
}

@end