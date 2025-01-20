@interface PGSharingSuggestionInput
- (NSArray)momentNodes;
- (PGGraph)graph;
- (PGSharingSuggestionInput)initWithAssetLocalIdentifiers:(id)a3 momentLocalIdentifiers:(id)a4 graph:(id)a5 photoLibrary:(id)a6;
- (PGSharingSuggestionInput)initWithMomentNodes:(id)a3;
- (PHFetchResult)assets;
- (PHFetchResult)moments;
- (id)description;
@end

@implementation PGSharingSuggestionInput

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_graph, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_moments, 0);
  objc_storeStrong((id *)&self->_assets, 0);
  objc_storeStrong((id *)&self->_momentNodes, 0);
  objc_storeStrong((id *)&self->_momentLocalIdentifiers, 0);
  objc_storeStrong((id *)&self->_assetLocalIdentifiers, 0);
}

- (PGGraph)graph
{
  return self->_graph;
}

- (id)description
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)PGSharingSuggestionInput;
  v4 = [(PGSharingSuggestionInput *)&v7 description];
  v5 = [v3 stringWithFormat:@"%@ - Number of moments: %lu (%@) - Number of assets: %lu (%@)", v4, -[NSArray count](self->_momentLocalIdentifiers, "count"), self->_momentLocalIdentifiers, -[NSArray count](self->_assetLocalIdentifiers, "count"), self->_assetLocalIdentifiers];

  return v5;
}

- (PHFetchResult)moments
{
  v17[2] = *MEMORY[0x1E4F143B8];
  v3 = self->_momentLocalIdentifiers;
  objc_sync_enter(v3);
  if (!self->_moments)
  {
    v4 = [(PHPhotoLibrary *)self->_photoLibrary librarySpecificFetchOptions];
    v5 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"startDate" ascending:1];
    v17[0] = v5;
    v6 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"uuid" ascending:1];
    v17[1] = v6;
    objc_super v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
    [v4 setSortDescriptors:v7];

    v8 = [MEMORY[0x1E4F38EE8] fetchAssetCollectionsWithLocalIdentifiers:self->_momentLocalIdentifiers options:v4];
    moments = self->_moments;
    self->_moments = v8;

    if (![(PHFetchResult *)self->_moments count])
    {
      v10 = +[PGLogging sharedLogging];
      v11 = [v10 loggingConnection];

      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        momentLocalIdentifiers = self->_momentLocalIdentifiers;
        int v15 = 138412290;
        v16 = momentLocalIdentifiers;
        _os_log_impl(&dword_1D1805000, v11, OS_LOG_TYPE_INFO, "[Sharing Suggestion] No moments found for %@, photo library might be out-of-date", (uint8_t *)&v15, 0xCu);
      }
    }
  }
  objc_sync_exit(v3);

  v13 = self->_moments;
  return v13;
}

- (PHFetchResult)assets
{
  v17[2] = *MEMORY[0x1E4F143B8];
  v3 = self->_assetLocalIdentifiers;
  objc_sync_enter(v3);
  if (!self->_assets && [(NSArray *)self->_assetLocalIdentifiers count])
  {
    v4 = [(PHPhotoLibrary *)self->_photoLibrary librarySpecificFetchOptions];
    v5 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:1];
    v17[0] = v5;
    v6 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"uuid" ascending:1];
    v17[1] = v6;
    objc_super v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
    [v4 setSortDescriptors:v7];

    [v4 setIncludeGuestAssets:1];
    v8 = [MEMORY[0x1E4F38EB8] fetchAssetsWithLocalIdentifiers:self->_assetLocalIdentifiers options:v4];
    assets = self->_assets;
    self->_assets = v8;

    if (![(PHFetchResult *)self->_assets count])
    {
      v10 = +[PGLogging sharedLogging];
      v11 = [v10 loggingConnection];

      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        v12 = self->_assets;
        int v15 = 138412290;
        v16 = v12;
        _os_log_impl(&dword_1D1805000, v11, OS_LOG_TYPE_INFO, "[Sharing Suggestion] No assets found for %@, photo library might be out-of-date", (uint8_t *)&v15, 0xCu);
      }
    }
  }
  objc_sync_exit(v3);

  v13 = self->_assets;
  return v13;
}

- (NSArray)momentNodes
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  v3 = self->_momentLocalIdentifiers;
  objc_sync_enter(v3);
  if (!self->_momentNodes)
  {
    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSArray count](self->_momentLocalIdentifiers, "count"));
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    v5 = self->_momentLocalIdentifiers;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v28;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v28 != v7) {
            objc_enumerationMutation(v5);
          }
          v9 = objc_msgSend(MEMORY[0x1E4F38EE8], "uuidFromLocalIdentifier:", *(void *)(*((void *)&v27 + 1) + 8 * v8), (void)v27);
          [v4 addObject:v9];

          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v27 objects:v31 count:16];
      }
      while (v6);
    }

    v10 = +[PGGraphMomentNodeCollection momentNodesForArrayOfUUIDs:v4 inGraph:self->_graph];
    unint64_t v11 = [v10 count];
    if (v11 < [v4 count])
    {
      v12 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithArray:v4];
      v13 = [v10 uuids];
      [v12 minusSet:v13];

      v14 = +[PGLogging sharedLogging];
      int v15 = [v14 loggingConnection];

      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v12;
        _os_log_impl(&dword_1D1805000, v15, OS_LOG_TYPE_INFO, "[Sharing Suggestion] No moment nodes found for moment UUIDs %@", (uint8_t *)&buf, 0xCu);
      }
    }
    if (!objc_msgSend(v10, "count", (void)v27))
    {
      v16 = +[PGLogging sharedLogging];
      v17 = [v16 loggingConnection];

      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        momentLocalIdentifiers = self->_momentLocalIdentifiers;
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = momentLocalIdentifiers;
        _os_log_impl(&dword_1D1805000, v17, OS_LOG_TYPE_INFO, "[Sharing Suggestion] No moment nodes found for %@, graph might be out-of-date", (uint8_t *)&buf, 0xCu);
      }
    }
    v19 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"universalStartDate" ascending:1];
    *(void *)&long long buf = v19;
    v20 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"universalEndDate" ascending:1];
    *((void *)&buf + 1) = v20;
    v21 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"UUID" ascending:1];
    v33 = v21;
    v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&buf count:3];

    v23 = [v10 sortedArrayUsingDescriptors:v22];
    momentNodes = self->_momentNodes;
    self->_momentNodes = v23;
  }
  objc_sync_exit(v3);

  v25 = self->_momentNodes;
  return v25;
}

- (PGSharingSuggestionInput)initWithMomentNodes:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)PGSharingSuggestionInput;
  v5 = [(PGSharingSuggestionInput *)&v24 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    momentNodes = v5->_momentNodes;
    v5->_momentNodes = (NSArray *)v6;

    uint64_t v8 = [v4 firstObject];
    uint64_t v9 = [v8 graph];
    graph = v5->_graph;
    v5->_graph = (PGGraph *)v9;

    objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
    unint64_t v11 = (NSArray *)objc_claimAutoreleasedReturnValue();
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v12 = v4;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v21;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v21 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * v16), "localIdentifier", (void)v20);
          [(NSArray *)v11 addObject:v17];

          ++v16;
        }
        while (v14 != v16);
        uint64_t v14 = [v12 countByEnumeratingWithState:&v20 objects:v25 count:16];
      }
      while (v14);
    }

    momentLocalIdentifiers = v5->_momentLocalIdentifiers;
    v5->_momentLocalIdentifiers = v11;
  }
  return v5;
}

- (PGSharingSuggestionInput)initWithAssetLocalIdentifiers:(id)a3 momentLocalIdentifiers:(id)a4 graph:(id)a5 photoLibrary:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)PGSharingSuggestionInput;
  uint64_t v15 = [(PGSharingSuggestionInput *)&v18 init];
  uint64_t v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_assetLocalIdentifiers, a3);
    objc_storeStrong((id *)&v16->_momentLocalIdentifiers, a4);
    objc_storeStrong((id *)&v16->_graph, a5);
    objc_storeStrong((id *)&v16->_photoLibrary, a6);
  }

  return v16;
}

@end