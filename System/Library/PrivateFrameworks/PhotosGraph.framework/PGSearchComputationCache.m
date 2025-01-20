@interface PGSearchComputationCache
+ (id)persistentStoreURLWithManager:(id)a3;
- (BOOL)momentAssetPairs:(id)a3 areValidWithAssociatedMomentUUIDs:(id)a4;
- (NSMutableDictionary)curationInformationByNodeUUID;
- (NSMutableDictionary)locationInformationByNodeUUID;
- (NSMutableDictionary)momentAssetPairsByNodeUUID;
- (NSURL)persistentStoreURL;
- (PGSearchComputationCache)initWithPersistentStoreURL:(id)a3 photoLibrary:(id)a4;
- (PHPhotoLibrary)photoLibrary;
- (id)curationInformationForNode:(id)a3;
- (id)keyAssetLocalIdentifierForNodeIdentifier:(id)a3 withAssociatedMomentUUIDs:(id)a4;
- (id)locationInformationForLocationNode:(id)a3 locationMask:(unint64_t)a4;
- (void)invalidateCache;
- (void)save;
- (void)setCurationInformation:(id)a3 forNode:(id)a4;
- (void)setKeyAssetLocalIdentifier:(id)a3 forNodeIdentifier:(id)a4 withAssociatedMomentUUID:(id)a5;
- (void)setLocationInformation:(id)a3 forLocationNode:(id)a4 locationMask:(unint64_t)a5;
@end

@implementation PGSearchComputationCache

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_locationInformationByNodeUUID, 0);
  objc_storeStrong((id *)&self->_curationInformationByNodeUUID, 0);
  objc_storeStrong((id *)&self->_momentAssetPairsByNodeUUID, 0);
  objc_storeStrong((id *)&self->_persistentStoreURL, 0);
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (NSMutableDictionary)locationInformationByNodeUUID
{
  return self->_locationInformationByNodeUUID;
}

- (NSMutableDictionary)curationInformationByNodeUUID
{
  return self->_curationInformationByNodeUUID;
}

- (NSMutableDictionary)momentAssetPairsByNodeUUID
{
  return self->_momentAssetPairsByNodeUUID;
}

- (NSURL)persistentStoreURL
{
  return self->_persistentStoreURL;
}

- (id)locationInformationForLocationNode:(id)a3 locationMask:(unint64_t)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [v6 UUID];
  if (v7 || ([v6 name], (v7 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v8 = [(NSMutableDictionary *)self->_locationInformationByNodeUUID objectForKeyedSubscript:v7];
    v9 = [NSNumber numberWithUnsignedInteger:a4];
    v10 = [v8 objectForKeyedSubscript:v9];
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      int v12 = 138412290;
      id v13 = v6;
      _os_log_error_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Cannot get unique UUID for node %@", (uint8_t *)&v12, 0xCu);
    }
    v10 = 0;
  }

  return v10;
}

- (void)setLocationInformation:(id)a3 forLocationNode:(id)a4 locationMask:(unint64_t)a5
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v10 = [v9 UUID];
  if (v10 || ([v9 name], (v10 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v11 = [(NSMutableDictionary *)self->_locationInformationByNodeUUID objectForKeyedSubscript:v10];
    if (!v11)
    {
      v11 = [MEMORY[0x1E4F1CA60] dictionary];
      [(NSMutableDictionary *)self->_locationInformationByNodeUUID setObject:v11 forKeyedSubscript:v10];
    }
    int v12 = [NSNumber numberWithUnsignedInteger:a5];
    [v11 setObject:v8 forKeyedSubscript:v12];
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    int v13 = 138412290;
    id v14 = v9;
    _os_log_error_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Cannot get unique UUID for node %@", (uint8_t *)&v13, 0xCu);
  }
}

- (id)curationInformationForNode:(id)a3
{
  id v4 = a3;
  v5 = [v4 UUID];
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = [v4 name];
  }
  id v8 = v7;

  id v9 = [(NSMutableDictionary *)self->_curationInformationByNodeUUID objectForKeyedSubscript:v8];

  return v9;
}

- (void)setCurationInformation:(id)a3 forNode:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 UUID];
  if (v8 || ([v7 name], (id v8 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    [(NSMutableDictionary *)self->_curationInformationByNodeUUID setObject:v6 forKeyedSubscript:v8];
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    int v9 = 138412290;
    id v10 = v7;
    _os_log_error_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Cannot get unique UUID for node %@", (uint8_t *)&v9, 0xCu);
  }
}

- (BOOL)momentAssetPairs:(id)a3 areValidWithAssociatedMomentUUIDs:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v6 count] && objc_msgSend(v7, "count"))
  {
    v25 = self;
    id v8 = [MEMORY[0x1E4F1CA80] set];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v9 = v6;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v27 != v12) {
            objc_enumerationMutation(v9);
          }
          id v14 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          uint64_t v15 = [v14 momentUUID];
          int v16 = [v7 containsObject:v15];

          if (v16)
          {
            v17 = [v14 assetUUID];
            [v8 addObject:v17];
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v26 objects:v31 count:16];
      }
      while (v11);
    }

    if ([v8 count])
    {
      v18 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"uuid IN %@", v8];
      v19 = [(PHPhotoLibrary *)v25->_photoLibrary librarySpecificFetchOptions];
      [v19 setInternalPredicate:v18];
      uint64_t v30 = *MEMORY[0x1E4F394A8];
      v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v30 count:1];
      [v19 setFetchPropertySets:v20];

      [v19 setShouldPrefetchCount:1];
      [v19 setIncludeAssetSourceTypes:5];
      v21 = [MEMORY[0x1E4F38EB8] fetchAssetsWithOptions:v19];
      uint64_t v22 = [v21 count];
      BOOL v23 = v22 == [v8 count];
    }
    else
    {
      BOOL v23 = 0;
    }
  }
  else
  {
    BOOL v23 = 0;
  }

  return v23;
}

- (id)keyAssetLocalIdentifierForNodeIdentifier:(id)a3 withAssociatedMomentUUIDs:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v8 = [(NSMutableDictionary *)self->_momentAssetPairsByNodeUUID objectForKeyedSubscript:v6];
    if (v8)
    {
      if ([(PGSearchComputationCache *)self momentAssetPairs:v8 areValidWithAssociatedMomentUUIDs:v7])
      {
        id v9 = [v8 firstObject];
        uint64_t v10 = [v9 assetUUID];

        uint64_t v11 = [MEMORY[0x1E4F38EB8] localIdentifierWithUUID:v10];

LABEL_10:
        goto LABEL_11;
      }
      [(NSMutableDictionary *)self->_momentAssetPairsByNodeUUID removeObjectForKey:v6];
    }
    uint64_t v11 = 0;
    goto LABEL_10;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)int v13 = 0;
    _os_log_error_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Got nil uniqueNodeUUID to register key asset", v13, 2u);
  }
  uint64_t v11 = 0;
LABEL_11:

  return v11;
}

- (void)setKeyAssetLocalIdentifier:(id)a3 forNodeIdentifier:(id)a4 withAssociatedMomentUUID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v9)
  {
    id v11 = [(NSMutableDictionary *)self->_momentAssetPairsByNodeUUID objectForKeyedSubscript:v9];
    if (!v11)
    {
      id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      [(NSMutableDictionary *)self->_momentAssetPairsByNodeUUID setObject:v11 forKeyedSubscript:v9];
    }
    uint64_t v12 = [MEMORY[0x1E4F38EB8] uuidFromLocalIdentifier:v8];
    int v13 = [[PGSearchThumbnailMomentAssetPairUUID alloc] initWithAssetUUID:v12 momentUUID:v10];
    [v11 addObject:v13];
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)id v14 = 0;
    _os_log_error_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Got nil uniqueNodeUUID to register key asset", v14, 2u);
  }
}

- (void)invalidateCache
{
  [(NSMutableDictionary *)self->_momentAssetPairsByNodeUUID removeAllObjects];
  [(NSMutableDictionary *)self->_curationInformationByNodeUUID removeAllObjects];
  locationInformationByNodeUUID = self->_locationInformationByNodeUUID;
  [(NSMutableDictionary *)locationInformationByNodeUUID removeAllObjects];
}

- (void)save
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v3 = *(_OWORD *)&self->_momentAssetPairsByNodeUUID;
  v12[0] = @"thumbnails";
  v12[1] = @"curations";
  long long v13 = v3;
  v12[2] = @"locations";
  locationInformationByNodeUUID = self->_locationInformationByNodeUUID;
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v13 forKeys:v12 count:3];
  id v9 = 0;
  v5 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v4 requiringSecureCoding:1 error:&v9];
  id v6 = v9;
  if (v5)
  {
    [v5 writeToURL:self->_persistentStoreURL atomically:1];
  }
  else
  {
    id v7 = +[PGLogging sharedLogging];
    id v8 = [v7 loggingConnection];

    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v11 = v6;
      _os_log_error_impl(&dword_1D1805000, v8, OS_LOG_TYPE_ERROR, "Error writing zero keyword cache error: %@", buf, 0xCu);
    }
  }
}

- (PGSearchComputationCache)initWithPersistentStoreURL:(id)a3 photoLibrary:(id)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v43.receiver = self;
  v43.super_class = (Class)PGSearchComputationCache;
  id v9 = [(PGSearchComputationCache *)&v43 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_photoLibrary, a4);
    objc_storeStrong((id *)&v10->_persistentStoreURL, a3);
    id v11 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v10->_persistentStoreURL];
    unint64_t v12 = 0x1E4F1C000uLL;
    if (v11)
    {
      id v40 = v8;
      id v41 = v7;
      v39 = (void *)MEMORY[0x1E4F28DC0];
      long long v13 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v14 = objc_opt_class();
      uint64_t v15 = objc_opt_class();
      uint64_t v16 = objc_opt_class();
      uint64_t v17 = objc_opt_class();
      uint64_t v18 = objc_opt_class();
      uint64_t v19 = objc_opt_class();
      uint64_t v38 = objc_opt_class();
      v20 = objc_msgSend(v13, "setWithObjects:", v14, v15, v16, v17, v18, v19, v38, objc_opt_class(), 0);
      id v42 = 0;
      v21 = [v39 unarchivedObjectOfClasses:v20 fromData:v11 error:&v42];
      id v22 = v42;

      if (v22)
      {
        BOOL v23 = +[PGLogging sharedLogging];
        v24 = [v23 loggingConnection];

        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v45 = v22;
          _os_log_error_impl(&dword_1D1805000, v24, OS_LOG_TYPE_ERROR, "Error loading the search computation cache error: %@", buf, 0xCu);
        }
      }
      id v8 = v40;
      id v7 = v41;
      unint64_t v12 = 0x1E4F1C000;
    }
    else
    {
      v21 = 0;
    }
    v25 = [v21 objectForKeyedSubscript:@"thumbnails"];
    long long v26 = v25;
    if (v25)
    {
      long long v27 = v25;
    }
    else
    {
      long long v27 = [*(id *)(v12 + 2656) dictionary];
    }
    momentAssetPairsByNodeUUID = v10->_momentAssetPairsByNodeUUID;
    v10->_momentAssetPairsByNodeUUID = v27;

    long long v29 = [v21 objectForKeyedSubscript:@"curations"];
    uint64_t v30 = v29;
    if (v29)
    {
      v31 = v29;
    }
    else
    {
      v31 = [*(id *)(v12 + 2656) dictionary];
    }
    curationInformationByNodeUUID = v10->_curationInformationByNodeUUID;
    v10->_curationInformationByNodeUUID = v31;

    v33 = [v21 objectForKeyedSubscript:@"locations"];
    v34 = v33;
    if (v33)
    {
      v35 = v33;
    }
    else
    {
      v35 = [*(id *)(v12 + 2656) dictionary];
    }
    locationInformationByNodeUUID = v10->_locationInformationByNodeUUID;
    v10->_locationInformationByNodeUUID = v35;
  }
  return v10;
}

+ (id)persistentStoreURLWithManager:(id)a3
{
  long long v3 = [a3 graphPersistenceParentDirectoryURL];
  id v4 = [v3 URLByAppendingPathComponent:@"PGSearchComputationCache.plist"];

  return v4;
}

@end