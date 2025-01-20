@interface PXDiscoveryFeedGenerationSession
- (PXDiscoveryFeedGenerationSession)initWithPhotoLibrary:(id)a3 options:(id)a4;
- (id)_assetCollectionWithAsset:(id)a3;
- (id)additionaItemsWithTargetCount:(unint64_t)a3;
@end

@implementation PXDiscoveryFeedGenerationSession

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionState, 0);
  objc_storeStrong((id *)&self->_photoAnalysisServiceClient, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
}

- (id)_assetCollectionWithAsset:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F38EE8];
  id v9 = a3;
  v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a3;
  v6 = [v4 arrayWithObjects:&v9 count:1];
  v7 = objc_msgSend(v3, "transientAssetCollectionWithAssets:title:", v6, 0, v9, v10);

  return v7;
}

- (id)additionaItemsWithTargetCount:(unint64_t)a3
{
  v89[3] = *MEMORY[0x1E4F143B8];
  if (self->_photoAnalysisServiceClient)
  {
    v88[0] = *MEMORY[0x1E4F8AE90];
    id v5 = [(PXDiscoveryFeedGenerationOptions *)self->_options dictionaryRepresentation];
    v89[0] = v5;
    v88[1] = *MEMORY[0x1E4F8AE88];
    uint64_t v6 = [NSNumber numberWithUnsignedInteger:a3];
    v7 = (void *)v6;
    v88[2] = *MEMORY[0x1E4F8AE98];
    v63 = self;
    sessionState = self->_sessionState;
    p_sessionState = &self->_sessionState;
    v8 = sessionState;
    if (!sessionState) {
      v8 = (NSDictionary *)MEMORY[0x1E4F1CC08];
    }
    v89[1] = v6;
    v89[2] = v8;
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v89 forKeys:v88 count:3];

    v12 = *(p_sessionState - 1);
    id v81 = 0;
    id v82 = 0;
    v61 = (void *)v11;
    v13 = [v12 requestDiscoveryFeedItemsWithOptions:v11 generationSessionState:&v82 error:&v81];
    id v14 = v82;
    id v58 = v82;
    id v60 = v81;
    objc_storeStrong((id *)p_sessionState, v14);
    id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v77 = 0u;
    long long v78 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    obuint64_t j = v13;
    uint64_t v17 = [obj countByEnumeratingWithState:&v77 objects:v87 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v78;
      uint64_t v20 = *MEMORY[0x1E4F8AE78];
      uint64_t v21 = *MEMORY[0x1E4F8AE70];
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v78 != v19) {
            objc_enumerationMutation(obj);
          }
          v23 = *(void **)(*((void *)&v77 + 1) + 8 * i);
          v24 = objc_msgSend(v23, "objectForKeyedSubscript:", v20, v58, v60);
          v25 = [v23 objectForKeyedSubscript:v21];
          int v26 = [v25 BOOLValue];

          if (v26) {
            v27 = v15;
          }
          else {
            v27 = v16;
          }
          [v27 addObject:v24];
        }
        uint64_t v18 = [obj countByEnumeratingWithState:&v77 objects:v87 count:16];
      }
      while (v18);
    }

    id v28 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v62 = v15;
    if ([v15 count])
    {
      v29 = [(PHPhotoLibrary *)v63->_photoLibrary librarySpecificFetchOptions];
      v30 = [MEMORY[0x1E4F38EE8] fetchAssetCollectionsWithLocalIdentifiers:v15 options:v29];
      long long v73 = 0u;
      long long v74 = 0u;
      long long v75 = 0u;
      long long v76 = 0u;
      uint64_t v31 = [v30 countByEnumeratingWithState:&v73 objects:v86 count:16];
      if (v31)
      {
        uint64_t v32 = v31;
        uint64_t v33 = *(void *)v74;
        do
        {
          for (uint64_t j = 0; j != v32; ++j)
          {
            if (*(void *)v74 != v33) {
              objc_enumerationMutation(v30);
            }
            v35 = *(void **)(*((void *)&v73 + 1) + 8 * j);
            v36 = objc_msgSend(v35, "localIdentifier", v58);
            [v28 setObject:v35 forKeyedSubscript:v36];
          }
          uint64_t v32 = [v30 countByEnumeratingWithState:&v73 objects:v86 count:16];
        }
        while (v32);
      }
    }
    if (objc_msgSend(v16, "count", v58))
    {
      v37 = [(PHPhotoLibrary *)v63->_photoLibrary librarySpecificFetchOptions];
      v38 = [MEMORY[0x1E4F38EB8] fetchAssetsWithLocalIdentifiers:v16 options:v37];
      long long v69 = 0u;
      long long v70 = 0u;
      long long v71 = 0u;
      long long v72 = 0u;
      uint64_t v39 = [v38 countByEnumeratingWithState:&v69 objects:v85 count:16];
      if (v39)
      {
        uint64_t v40 = v39;
        uint64_t v41 = *(void *)v70;
        do
        {
          for (uint64_t k = 0; k != v40; ++k)
          {
            if (*(void *)v70 != v41) {
              objc_enumerationMutation(v38);
            }
            v43 = *(void **)(*((void *)&v69 + 1) + 8 * k);
            v44 = [(PXDiscoveryFeedGenerationSession *)v63 _assetCollectionWithAsset:v43];
            v45 = [v43 localIdentifier];
            [v28 setObject:v44 forKeyedSubscript:v45];
          }
          uint64_t v40 = [v38 countByEnumeratingWithState:&v69 objects:v85 count:16];
        }
        while (v40);
      }
    }
    v46 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v28, "count"));
    long long v65 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    id v47 = obj;
    uint64_t v48 = [v47 countByEnumeratingWithState:&v65 objects:v84 count:16];
    if (v48)
    {
      uint64_t v49 = v48;
      uint64_t v50 = *(void *)v66;
      uint64_t v51 = *MEMORY[0x1E4F8AE78];
      do
      {
        for (uint64_t m = 0; m != v49; ++m)
        {
          if (*(void *)v66 != v50) {
            objc_enumerationMutation(v47);
          }
          v53 = [*(id *)(*((void *)&v65 + 1) + 8 * m) objectForKeyedSubscript:v51];
          v54 = [v28 objectForKeyedSubscript:v53];
          [v46 addObject:v54];
        }
        uint64_t v49 = [v47 countByEnumeratingWithState:&v65 objects:v84 count:16];
      }
      while (v49);
    }

    id v55 = objc_alloc(MEMORY[0x1E4F39150]);
    v56 = (void *)[v55 initWithObjects:v46 photoLibrary:v63->_photoLibrary fetchType:*MEMORY[0x1E4F39668] fetchPropertySets:0 identifier:0 registerIfNeeded:1];
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A9AE7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Not implemented yet, requires client-side PhotosGraph", buf, 2u);
    }
    v56 = 0;
  }
  return v56;
}

- (PXDiscoveryFeedGenerationSession)initWithPhotoLibrary:(id)a3 options:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PXDiscoveryFeedGenerationSession;
  id v9 = [(PXDiscoveryFeedGenerationSession *)&v16 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_photoLibrary, a3);
    uint64_t v11 = [v8 copy];
    options = v10->_options;
    v10->_options = (PXDiscoveryFeedGenerationOptions *)v11;

    if ([(PXDiscoveryFeedGenerationOptions *)v10->_options usePhotoAnalysisdThroughXPC])
    {
      uint64_t v13 = [v7 photoAnalysisClient];
      photoAnalysisServiceClient = v10->_photoAnalysisServiceClient;
      v10->_photoAnalysisServiceClient = (PLPhotoAnalysisServiceClient *)v13;
    }
  }

  return v10;
}

@end