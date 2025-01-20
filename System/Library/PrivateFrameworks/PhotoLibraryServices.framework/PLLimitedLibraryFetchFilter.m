@interface PLLimitedLibraryFetchFilter
+ (id)_assetUUIDStringsFromFetchFilterData:(id)a3;
+ (id)_decodeFetchFilterData:(id)a3 withUUIDHandler:(id)a4 resultHandler:(id)a5;
+ (id)_fetchFiltersMatchingPredicate:(id)a3 sortDescriptors:(id)a4 limit:(int64_t)a5 inManagedObjectContext:(id)a6;
+ (id)debugDescriptionOfCurrentLimitedLibraryFetchFiltersInManagedObjectContext:(id)a3;
+ (id)disallowedAlbumKinds;
+ (id)entityName;
+ (id)entityNameToPredicateMapFromFetchFilterData:(id)a3 withApplicationIdentifier:(id)a4;
+ (id)entityNameToPredicateMapWithApplicationIdentifier:(id)a3;
+ (id)fetchFilterIdentifierForApplicationIdentifier:(id)a3;
+ (id)fetchFilterIdentifierForConnectionAuthorization:(id)a3;
+ (id)fetchLimitedLibraryFetchFilterWithApplicationIdentifier:(id)a3 inManagedObjectContext:(id)a4;
+ (id)fetchOrCreateLimitedLibraryFetchFilterWithApplicationIdentifier:(id)a3 auditToken:(id *)a4 inManagedObjectContext:(id)a5;
+ (id)insertIntoManagedObjectContext:(id)a3 forApplicationIdentifier:(id)a4;
+ (void)deleteAllLimitedLibraryFetchFiltersInManagedObjectContext:(id)a3;
+ (void)deleteLimitedLibraryFetchFilterWithApplicationIdentifier:(id)a3 inManagedObjectContext:(id)a4;
- (BOOL)containsAssetWithUUID:(id)a3;
- (id)assetUUIDs;
- (id)debugDescription;
- (id)predicateForEntityName:(id)a3;
- (void)_loadAssetUUIDs;
- (void)addAssetsWithUUIDs:(id)a3;
- (void)removeAllAssets;
@end

@implementation PLLimitedLibraryFetchFilter

- (void).cxx_destruct
{
}

- (id)debugDescription
{
  v3 = objc_opt_class();
  v4 = [(PLLimitedLibraryFetchFilter *)self fetchFilterData];
  v5 = [v3 _assetUUIDStringsFromFetchFilterData:v4];

  v6 = +[PLDescriptionBuilder prettyMultiLineDescriptionBuilderWithObject:self indent:0];
  v7 = [(PLLimitedLibraryFetchFilter *)self applicationIdentifier];
  [v6 appendName:@"applicationIdentifier" object:v7];

  v8 = [(PLLimitedLibraryFetchFilter *)self designatedRequirement];
  [v6 appendName:@"designatedRequirement" object:v8];

  [v6 appendName:@"assetUUIDs" object:v5];
  v9 = [v6 build];

  return v9;
}

- (void)_loadAssetUUIDs
{
  if (!self->_assetUUIDs)
  {
    v3 = objc_opt_class();
    v4 = [(PLLimitedLibraryFetchFilter *)self fetchFilterData];
    v5 = [v3 _decodeFetchFilterData:v4 withUUIDHandler:&__block_literal_global_89 resultHandler:&__block_literal_global_91];
    assetUUIDs = self->_assetUUIDs;
    self->_assetUUIDs = v5;

    if (!self->_assetUUIDs)
    {
      v7 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E4F1CA70]);
      v8 = self->_assetUUIDs;
      self->_assetUUIDs = v7;
    }
  }
}

id __46__PLLimitedLibraryFetchFilter__loadAssetUUIDs__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CA70]) initWithObjects:a2 count:a3];
  return v3;
}

id __46__PLLimitedLibraryFetchFilter__loadAssetUUIDs__block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:a2 length:16];
  return v2;
}

- (id)predicateForEntityName:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = +[PLManagedAsset entityName];
  int v6 = [v4 isEqualToString:v5];

  if (v6)
  {
    v7 = [(PLLimitedLibraryFetchFilter *)self assetUUIDs];
    if (v7)
    {
      v8 = (void *)MEMORY[0x1E4F28F60];
      v9 = @"uuid";
LABEL_8:
      [v8 predicateWithFormat:@"%K in %@", v9, v7];
      v14 = LABEL_9:;
LABEL_11:

      goto LABEL_12;
    }
    goto LABEL_10;
  }
  v10 = +[PLInternalResource entityName];
  int v11 = [v4 isEqualToString:v10];

  if (v11
    || (+[PLAdditionalAssetAttributes entityName],
        v12 = objc_claimAutoreleasedReturnValue(),
        int v13 = [v4 isEqualToString:v12],
        v12,
        v13))
  {
    v7 = [(PLLimitedLibraryFetchFilter *)self assetUUIDs];
    if (v7)
    {
      v8 = (void *)MEMORY[0x1E4F28F60];
      v9 = @"asset.uuid";
      goto LABEL_8;
    }
LABEL_10:
    v14 = 0;
    goto LABEL_11;
  }
  v16 = +[PLGenericAlbum entityName];
  int v17 = [v4 isEqualToString:v16];

  if (v17)
  {
LABEL_19:
    v21 = (void *)MEMORY[0x1E4F28F60];
    v7 = +[PLLimitedLibraryFetchFilter disallowedAlbumKinds];
    [v21 predicateWithFormat:@"NOT (%K IN %@)", @"kind", v7];
    goto LABEL_9;
  }
  v18 = +[PLFetchingAlbum entityName];
  if ([v4 isEqualToString:v18])
  {

    goto LABEL_19;
  }
  v19 = +[PLManagedAlbum entityName];
  int v20 = [v4 isEqualToString:v19];

  if (v20) {
    goto LABEL_19;
  }
  v22 = PLBackendGetLog();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v24 = objc_opt_class();
    __int16 v25 = 2112;
    id v26 = v4;
    _os_log_impl(&dword_19B3C7000, v22, OS_LOG_TYPE_ERROR, "invalid enttity name for %@: %@", buf, 0x16u);
  }

  v14 = 0;
LABEL_12:

  return v14;
}

- (id)assetUUIDs
{
  v33[1] = *MEMORY[0x1E4F143B8];
  [(PLLimitedLibraryFetchFilter *)self _loadAssetUUIDs];
  uint64_t v3 = [(NSMutableOrderedSet *)self->_assetUUIDs count];
  if (!v3)
  {
    v14 = (void *)MEMORY[0x1E4F1CBF0];
    goto LABEL_22;
  }
  size_t v4 = v3;
  uint64_t v5 = MEMORY[0x19F38D3B0]();
  if ((v4 & 0x8000000000000000) != 0)
  {
    uint64_t v28 = objc_msgSend(NSString, "stringWithFormat:", @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt", v4);
    v29 = (void *)MEMORY[0x1E4F1CA00];
    v30 = (void *)MEMORY[0x1E4F1C3A8];
    goto LABEL_27;
  }
  int v6 = (void *)v5;
  if (v4 >= 0x101) {
    uint64_t v7 = 1;
  }
  else {
    uint64_t v7 = v4;
  }
  size_t v8 = 8 * v7;
  MEMORY[0x1F4188790](v5);
  v10 = (char *)v33 - v9;
  bzero((char *)v33 - v9, v8);
  v33[0] = v33;
  if (v4 < 0x101)
  {
    bzero(v10, 8 * v4);
    MEMORY[0x1F4188790](v11);
    v12 = (char *)v33 - ((8 * v4 + 15) & 0xFFFFFFFFFFFFFFF0);
    bzero(v12, v8);
    bzero(v12, 8 * v4);
    int v13 = v12;
    goto LABEL_12;
  }
  v15 = (char *)malloc_type_calloc(8uLL, v4, 0x35578584uLL);
  if (!v15
    || (v10 = v15,
        MEMORY[0x1F4188790](v15),
        int v13 = (char *)v32,
        bzero(v32, v8),
        (v16 = (char *)malloc_type_calloc(8uLL, v4, 0xDC76D879uLL)) == 0))
  {
    uint64_t v28 = objc_msgSend(NSString, "stringWithFormat:", @"*** attempt to create a temporary id buffer of length (%lu) failed", v4);
    v29 = (void *)MEMORY[0x1E4F1CA00];
    v30 = (void *)MEMORY[0x1E4F1C4A0];
LABEL_27:
    objc_msgSend(v29, "exceptionWithName:reason:userInfo:", *v30, v28, 0, v33[0]);
    id v31 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v31);
  }
  v12 = v16;
LABEL_12:
  -[NSMutableOrderedSet getObjects:range:](self->_assetUUIDs, "getObjects:range:", v10, 0, v4, v33[0]);
  for (uint64_t i = 0; i != v4; ++i)
  {
    v18 = (objc_class *)MEMORY[0x1E4F29128];
    id v19 = *(id *)&v10[8 * i];
    id v20 = [v18 alloc];
    id v21 = v19;
    v22 = objc_msgSend(v20, "initWithUUIDBytes:", objc_msgSend(v21, "bytes"));
    uint64_t v23 = [v22 UUIDString];
    uint64_t v24 = *(void **)&v12[8 * i];
    *(void *)&v12[8 * i] = v23;
  }
  v14 = (void *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithObjects:v12 count:v4];
  if (v4 >= 0x101) {
    free(v10);
  }
  for (uint64_t j = 0; j != v4; ++j)
  {
    id v26 = *(void **)&v12[8 * j];
    *(void *)&v12[8 * j] = 0;
  }
  if (v4 >= 0x101) {
    free(v12);
  }
  do
  {

    v8 -= 8;
  }
  while (v8);
LABEL_22:
  return v14;
}

- (BOOL)containsAssetWithUUID:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v4];
  if (v5)
  {
    [(PLLimitedLibraryFetchFilter *)self _loadAssetUUIDs];
    long long v10 = 0uLL;
    [v5 getUUIDBytes:&v10];
    int v6 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:&v10 length:16 freeWhenDone:0];
    char v7 = [(NSMutableOrderedSet *)self->_assetUUIDs containsObject:v6];
  }
  else
  {
    size_t v8 = PLBackendGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(v10) = 138543362;
      *(void *)((char *)&v10 + 4) = v4;
      _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_DEFAULT, "LimitedLibrary: invalid UUID string: %{public}@", (uint8_t *)&v10, 0xCu);
    }

    char v7 = 0;
  }

  return v7;
}

- (void)addAssetsWithUUIDs:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    [(PLLimitedLibraryFetchFilter *)self _loadAssetUUIDs];
    uint64_t v16 = 0;
    int v17 = &v16;
    uint64_t v18 = 0x2020000000;
    char v19 = 0;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __50__PLLimitedLibraryFetchFilter_addAssetsWithUUIDs___block_invoke;
    v13[3] = &unk_1E586CB80;
    v13[4] = self;
    id v14 = v4;
    v15 = &v16;
    [v14 enumerateObjectsUsingBlock:v13];
    if (!*((unsigned char *)v17 + 24))
    {
      uint64_t v5 = objc_msgSend(MEMORY[0x1E4F1CA58], "dataWithCapacity:", (16 * -[NSMutableOrderedSet count](self->_assetUUIDs, "count")) | 8);
      [v5 appendBytes:"PLUUIDS0" length:8];
      assetUUIDs = self->_assetUUIDs;
      uint64_t v8 = MEMORY[0x1E4F143A8];
      uint64_t v9 = 3221225472;
      long long v10 = __50__PLLimitedLibraryFetchFilter_addAssetsWithUUIDs___block_invoke_75;
      uint64_t v11 = &unk_1E586CBA8;
      id v7 = v5;
      id v12 = v7;
      [(NSMutableOrderedSet *)assetUUIDs enumerateObjectsUsingBlock:&v8];
      -[PLLimitedLibraryFetchFilter setFetchFilterData:](self, "setFetchFilterData:", v7, v8, v9, v10, v11);
    }
    _Block_object_dispose(&v16, 8);
  }
}

void __50__PLLimitedLibraryFetchFilter_addAssetsWithUUIDs___block_invoke(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  unint64_t v7 = [v6 length];
  if (v7 < 0x25)
  {
    if (v7 != 36) {
      goto LABEL_15;
    }
    id v8 = v6;
    if (!v8) {
      goto LABEL_15;
    }
  }
  else
  {
    id v8 = [v6 substringToIndex:36];
    if (!v8) {
      goto LABEL_15;
    }
  }
  uint64_t v9 = (objc_class *)MEMORY[0x1E4F29128];
  id v10 = v8;
  uint64_t v11 = (void *)[[v9 alloc] initWithUUIDString:v10];

  if (v11)
  {
    long long v15 = 0uLL;
    [v11 getUUIDBytes:&v15];
    id v12 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&v15 length:16];
  }
  else
  {
    id v12 = 0;
  }

  if ([v12 length] == 16)
  {
    [*(id *)(a1[4] + 72) addObject:v12];
  }
  else
  {
    int v13 = PLBackendGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = a1[5];
      LODWORD(v15) = 138543362;
      *(void *)((char *)&v15 + 4) = v14;
      _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_ERROR, "LimitedLibrary: uuids contains non-UUIDs: %{public}@", (uint8_t *)&v15, 0xCu);
    }

    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
    *a4 = 1;
  }

LABEL_15:
}

uint64_t __50__PLLimitedLibraryFetchFilter_addAssetsWithUUIDs___block_invoke_75(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) appendData:a2];
}

- (void)removeAllAssets
{
  assetUUIDs = self->_assetUUIDs;
  if (assetUUIDs)
  {
    [(NSMutableOrderedSet *)assetUUIDs removeAllObjects];
  }
  else
  {
    id v4 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E4F1CA70]);
    uint64_t v5 = self->_assetUUIDs;
    self->_assetUUIDs = v4;
  }
  id v6 = [MEMORY[0x1E4F1C9B8] data];
  [(PLLimitedLibraryFetchFilter *)self setFetchFilterData:v6];
}

+ (id)debugDescriptionOfCurrentLimitedLibraryFetchFiltersInManagedObjectContext:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [a1 fetchRequest];
  id v14 = 0;
  id v6 = [v4 executeFetchRequest:v5 error:&v14];
  id v7 = v14;
  id v8 = [MEMORY[0x1E4F1CA48] array];
  if (!v6 || v7)
  {
    uint64_t v9 = PLBackendGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v16 = v7;
      _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_ERROR, "LimitedLibrary: fetch request for fetch filters failed with error: %@", buf, 0xCu);
    }
  }
  else
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __105__PLLimitedLibraryFetchFilter_debugDescriptionOfCurrentLimitedLibraryFetchFiltersInManagedObjectContext___block_invoke;
    v11[3] = &unk_1E5875E18;
    id v12 = v6;
    id v13 = v8;
    [v4 performBlockAndWait:v11];

    uint64_t v9 = v12;
  }

  return v8;
}

void __105__PLLimitedLibraryFetchFilter_debugDescriptionOfCurrentLimitedLibraryFetchFiltersInManagedObjectContext___block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __105__PLLimitedLibraryFetchFilter_debugDescriptionOfCurrentLimitedLibraryFetchFiltersInManagedObjectContext___block_invoke_2;
  v2[3] = &unk_1E586CBD0;
  v1 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  [v1 enumerateObjectsUsingBlock:v2];
}

void __105__PLLimitedLibraryFetchFilter_debugDescriptionOfCurrentLimitedLibraryFetchFiltersInManagedObjectContext___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 debugDescription];
  [v2 addObject:v3];
}

+ (id)fetchFilterIdentifierForConnectionAuthorization:(id)a3
{
  id v3 = a3;
  id v4 = [v3 trustedCallerContainingBundleRecord];

  if (v4)
  {
    uint64_t v5 = [v3 trustedCallerContainingBundleRecord];

    id v6 = [v5 bundleIdentifier];
    id v3 = v5;
  }
  else
  {
    id v6 = [v3 trustedCallerBundleID];
  }

  return v6;
}

+ (id)fetchFilterIdentifierForApplicationIdentifier:(id)a3
{
  id v3 = a3;
  uint64_t v11 = 0;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F223A0]) initWithBundleIdentifier:v3 error:&v11];
  uint64_t v5 = v4;
  if (v4
    && ([v4 containingBundleRecord],
        id v6 = objc_claimAutoreleasedReturnValue(),
        [v6 bundleIdentifier],
        id v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        v6,
        v7))
  {
    id v8 = [v5 containingBundleRecord];
    id v9 = [v8 bundleIdentifier];
  }
  else
  {
    id v9 = v3;
  }

  return v9;
}

+ (id)disallowedAlbumKinds
{
  return &unk_1EEBF1FA0;
}

+ (void)deleteAllLimitedLibraryFetchFiltersInManagedObjectContext:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [a1 _fetchFiltersMatchingPredicate:0 sortDescriptors:0 limit:0 inManagedObjectContext:v4];
  uint64_t v6 = [v5 count];
  id v7 = PLBackendGetLog();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v23 = [v5 count];
      _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_DEFAULT, "LimitedLibrary: batch deleting %lu LimitedLibraryFetchFilters", buf, 0xCu);
    }

    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v7 = v5;
    uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      id v16 = v5;
      uint64_t v11 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v18 != v11) {
            objc_enumerationMutation(v7);
          }
          id v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          id v14 = PLBackendGetLog();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            long long v15 = [v13 applicationIdentifier];
            *(_DWORD *)buf = 138412290;
            uint64_t v23 = (uint64_t)v15;
            _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_DEFAULT, "LimitedLibrary: deleting LimitedLibraryFetchFilter for applicationIdentifier: %@", buf, 0xCu);
          }
          [v4 deleteObject:v13];
        }
        uint64_t v10 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v10);
      uint64_t v5 = v16;
    }
  }
  else if (v8)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_DEFAULT, "LimitedLibrary: no LimitedLibraryFetchFilters to delete", buf, 2u);
  }
}

+ (void)deleteLimitedLibraryFetchFilterWithApplicationIdentifier:(id)a3 inManagedObjectContext:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = +[PLLimitedLibraryFetchFilter fetchLimitedLibraryFetchFilterWithApplicationIdentifier:v5 inManagedObjectContext:v6];
  if (v7)
  {
    BOOL v8 = PLBackendGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = v5;
      _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_DEFAULT, "LimitedLibrary: deleting LimitedLibraryFetchFilter for applicationIdentifier: %@", buf, 0xCu);
    }

    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __111__PLLimitedLibraryFetchFilter_deleteLimitedLibraryFetchFilterWithApplicationIdentifier_inManagedObjectContext___block_invoke;
    v9[3] = &unk_1E5875E18;
    id v10 = v6;
    id v11 = v7;
    [v10 performBlockAndWait:v9];
  }
}

uint64_t __111__PLLimitedLibraryFetchFilter_deleteLimitedLibraryFetchFilterWithApplicationIdentifier_inManagedObjectContext___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) deleteObject:*(void *)(a1 + 40)];
}

+ (id)_decodeFetchFilterData:(id)a3 withUUIDHandler:(id)a4 resultHandler:(id)a5
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  BOOL v8 = (void (**)(id, void))a4;
  uint64_t v9 = (void (**)(id, char *, size_t))a5;
  if (!v7) {
    goto LABEL_10;
  }
  id v10 = [MEMORY[0x1E4F1C9B8] data];

  if (v10 == v7) {
    goto LABEL_10;
  }
  unint64_t v11 = [v7 length];
  id v12 = v7;
  uint64_t v13 = [v12 bytes];
  BOOL v14 = v11 >= 8;
  unint64_t v15 = v11 - 8;
  if (!v14
    || (uint64_t v16 = v13, *(void *)[v12 bytes] != 0x3053444955554C50)
    || (v15 & 0xF) != 0)
  {
    long long v17 = PLBackendGetLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B3C7000, v17, OS_LOG_TYPE_ERROR, "LimitedLibrary: data does not contain current valid PLLimitedLibraryFetchFilterData", buf, 2u);
    }

    goto LABEL_10;
  }
  if (v15 < 0x10)
  {
LABEL_10:
    long long v18 = 0;
    goto LABEL_11;
  }
  size_t v20 = v15 >> 4;
  v36 = &v34;
  v37 = (void *)MEMORY[0x19F38D3B0]();
  if (v15 >> 4 >= 0x101) {
    uint64_t v21 = 1;
  }
  else {
    uint64_t v21 = v15 >> 4;
  }
  uint64_t v35 = v21;
  uint64_t v22 = 8 * v21;
  uint64_t v23 = (char *)&v34 - ((8 * v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  bzero(v23, 8 * v21);
  v34 = v23;
  if (v20 > 0x100)
  {
    uint64_t v23 = (char *)malloc_type_calloc(8uLL, v20, 0xA80686CBuLL);
    if (!v23)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"*** attempt to create a temporary id buffer of length (%lu) failed", v20);
      id v33 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C4A0] reason:objc_claimAutoreleasedReturnValue() userInfo:0];
      objc_exception_throw(v33);
    }
  }
  else
  {
    bzero(v23, 8 * v20);
  }
  uint64_t v24 = 0;
  uint64_t v25 = v16 + 8;
  if (v20 <= 1) {
    uint64_t v26 = 1;
  }
  else {
    uint64_t v26 = v20;
  }
  uint64_t v27 = 8 * v26;
  do
  {
    uint64_t v28 = v8[2](v8, v25);
    v29 = *(void **)&v23[v24];
    *(void *)&v23[v24] = v28;

    v25 += 16;
    v24 += 8;
  }
  while (v27 != v24);
  long long v18 = v9[2](v9, v23, v20);
  uint64_t v30 = 0;
  do
  {
    id v31 = *(void **)&v23[v30];
    *(void *)&v23[v30] = 0;

    v30 += 8;
  }
  while (v27 != v30);
  if (v20 >= 0x101) {
    free(v23);
  }
  if (v35)
  {
    v32 = v34 - 8;
    do
    {

      v22 -= 8;
    }
    while (v22);
  }
LABEL_11:

  return v18;
}

+ (id)entityNameToPredicateMapFromFetchFilterData:(id)a3 withApplicationIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = (void *)MEMORY[0x1E4F1CA60];
  id v8 = a4;
  uint64_t v9 = [v7 dictionary];
  id v10 = [a1 entityNameToPredicateMapWithApplicationIdentifier:v8];

  [v9 addEntriesFromDictionary:v10];
  if (v6)
  {
    unint64_t v11 = [a1 _assetUUIDStringsFromFetchFilterData:v6];
    id v12 = v11;
    if (v11 && [v11 count])
    {
      uint64_t v13 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K in %@", @"uuid", v12];
      BOOL v14 = +[PLManagedAsset entityName];
      [v9 setObject:v13 forKeyedSubscript:v14];

      unint64_t v15 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K in %@", @"asset.uuid", v12];
      uint64_t v16 = +[PLInternalResource entityName];
      [v9 setObject:v15 forKeyedSubscript:v16];

      long long v17 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K in %@", @"asset.uuid", v12];
      long long v18 = +[PLAdditionalAssetAttributes entityName];
      [v9 setObject:v17 forKeyedSubscript:v18];
    }
  }

  return v9;
}

+ (id)entityNameToPredicateMapWithApplicationIdentifier:(id)a3
{
  v12[3] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = +[PLLimitedLibraryFetchFilter disallowedAlbumKinds];
  id v5 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == %@ OR NOT (%K IN %@)", @"importedByBundleIdentifier", v3, @"kind", v4];

  id v6 = +[PLGenericAlbum entityName];
  v11[0] = v6;
  v12[0] = v5;
  id v7 = +[PLManagedAlbum entityName];
  v11[1] = v7;
  v12[1] = v5;
  id v8 = +[PLFetchingAlbum entityName];
  v11[2] = v8;
  v12[2] = v5;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:3];

  return v9;
}

+ (id)_assetUUIDStringsFromFetchFilterData:(id)a3
{
  return (id)[a1 _decodeFetchFilterData:a3 withUUIDHandler:&__block_literal_global_63663 resultHandler:&__block_literal_global_45];
}

id __68__PLLimitedLibraryFetchFilter__assetUUIDStringsFromFetchFilterData___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithObjects:a2 count:a3];
  return v3;
}

id __68__PLLimitedLibraryFetchFilter__assetUUIDStringsFromFetchFilterData___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:a2];
  id v3 = [v2 UUIDString];

  return v3;
}

+ (id)_fetchFiltersMatchingPredicate:(id)a3 sortDescriptors:(id)a4 limit:(int64_t)a5 inManagedObjectContext:(id)a6
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a6;
  id v12 = (void *)MEMORY[0x1E4F1C0D0];
  id v13 = a3;
  BOOL v14 = [a1 entityName];
  unint64_t v15 = [v12 fetchRequestWithEntityName:v14];

  [v15 setFetchBatchSize:100];
  [v15 setPredicate:v13];

  if (v10) {
    [v15 setSortDescriptors:v10];
  }
  if (a5 >= 1) {
    [v15 setFetchLimit:a5];
  }
  id v22 = 0;
  uint64_t v16 = [v11 executeFetchRequest:v15 error:&v22];
  id v17 = v22;
  if (v16)
  {
    id v19 = v16;
  }
  else
  {
    long long v18 = PLBackendGetLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v24 = v17;
      _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_ERROR, "LimitedLibrary: failed to fetch suggestions: %@", buf, 0xCu);
    }

    id v19 = [MEMORY[0x1E4F1C978] array];
  }
  size_t v20 = v19;

  return v20;
}

+ (id)fetchLimitedLibraryFetchFilterWithApplicationIdentifier:(id)a3 inManagedObjectContext:(id)a4
{
  id v6 = (void *)MEMORY[0x1E4F28F60];
  id v7 = a4;
  id v8 = [v6 predicateWithFormat:@"applicationIdentifier == %@", a3];
  uint64_t v9 = [a1 _fetchFiltersMatchingPredicate:v8 sortDescriptors:0 limit:1 inManagedObjectContext:v7];

  id v10 = [v9 firstObject];

  return v10;
}

+ (id)fetchOrCreateLimitedLibraryFetchFilterWithApplicationIdentifier:(id)a3 auditToken:(id *)a4 inManagedObjectContext:(id)a5
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a5;
  id v8 = +[PLLimitedLibraryFetchFilter fetchLimitedLibraryFetchFilterWithApplicationIdentifier:v6 inManagedObjectContext:v7];
  if (!v8)
  {
    uint64_t v9 = PLBackendGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412290;
      id v12 = v6;
      _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_DEFAULT, "Creating limited library fetch filter for %@ since one does not exist", (uint8_t *)&v11, 0xCu);
    }

    id v8 = +[PLLimitedLibraryFetchFilter insertIntoManagedObjectContext:v7 forApplicationIdentifier:v6];
  }

  return v8;
}

+ (id)insertIntoManagedObjectContext:(id)a3 forApplicationIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [a1 entityName];
  uint64_t v9 = PLSafeInsertNewObjectForEntityForNameInManagedObjectContext((uint64_t)v8, (uint64_t)v7, 0);

  if (v9)
  {
    [v9 setApplicationIdentifier:v6];
    id v10 = [MEMORY[0x1E4F1C9B8] data];
    [v9 setFetchFilterData:v10];
  }
  return v9;
}

+ (id)entityName
{
  return @"LimitedLibraryFetchFilter";
}

@end