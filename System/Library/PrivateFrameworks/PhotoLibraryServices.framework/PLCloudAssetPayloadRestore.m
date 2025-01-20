@interface PLCloudAssetPayloadRestore
+ (id)assetForPayload:(id)a3 inManagedObjectContext:(id)a4;
+ (id)assetsForPayloadIDsWithPayloads:(id)a3 inManagedObjectContext:(id)a4;
+ (id)relationshipKeyPathsForPrefetching;
- (PLCloudAssetPayloadRestore)initWithDelegate:(id)a3 batchSize:(unint64_t)a4;
- (id)_resolveLocalIdentifiersForCloudIdentifiersForPayloadIDs;
- (unint64_t)batchSize;
- (unint64_t)totalRestored;
- (unint64_t)totalSkipped;
- (void)_insertBatchOfUnresolvedCloudIdentifiers;
- (void)_insertBatchToRestore;
- (void)_insertPayload:(id)a3 forAssets:(id)a4 skipMessage:(id)a5;
- (void)addPayload:(id)a3;
- (void)insertRemainingPayloads;
@end

@implementation PLCloudAssetPayloadRestore

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadsWithUnresolvedAssets, 0);
  objc_storeStrong((id *)&self->_batchToRestore, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
}

- (unint64_t)totalSkipped
{
  return self->_totalSkipped;
}

- (unint64_t)totalRestored
{
  return self->_totalRestored;
}

- (unint64_t)batchSize
{
  return self->_batchSize;
}

- (id)_resolveLocalIdentifiersForCloudIdentifiersForPayloadIDs
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  payloadsWithUnresolvedAssets = self->_payloadsWithUnresolvedAssets;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __86__PLCloudAssetPayloadRestore__resolveLocalIdentifiersForCloudIdentifiersForPayloadIDs__block_invoke;
  v25[3] = &unk_1E5875D08;
  id v7 = v3;
  id v26 = v7;
  id v8 = v4;
  id v27 = v8;
  [(NSMutableDictionary *)payloadsWithUnresolvedAssets enumerateKeysAndObjectsUsingBlock:v25];
  delegate = self->_delegate;
  id v24 = 0;
  v10 = [(PLCloudAssetPayloadRestoreDelegate *)delegate resolveLocalIdentifiersForCloudIdentifiers:v7 error:&v24];
  id v11 = v24;
  v12 = v11;
  if (v10)
  {
    v13 = PLMigrationGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v29 = v10;
      _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_INFO, "ComputeCache BatchRestore: Resolved remapped cloud identifiers: %@\n", buf, 0xCu);
    }

    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __86__PLCloudAssetPayloadRestore__resolveLocalIdentifiersForCloudIdentifiersForPayloadIDs__block_invoke_60;
    v19[3] = &unk_1E5875D30;
    v14 = &v20;
    id v20 = v8;
    id v15 = v5;
    id v21 = v15;
    [v10 enumerateKeysAndObjectsUsingBlock:v19];
    id v16 = v15;
  }
  else
  {
    v17 = self->_payloadsWithUnresolvedAssets;
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __86__PLCloudAssetPayloadRestore__resolveLocalIdentifiersForCloudIdentifiersForPayloadIDs__block_invoke_2;
    v22[3] = &unk_1E5875D08;
    v14 = (id *)v23;
    v23[0] = v11;
    v23[1] = self;
    [(NSMutableDictionary *)v17 enumerateKeysAndObjectsUsingBlock:v22];
    id v16 = 0;
  }

  return v16;
}

void __86__PLCloudAssetPayloadRestore__resolveLocalIdentifiersForCloudIdentifiersForPayloadIDs__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v6 = objc_msgSend(a3, "assetIdentifiers", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        [*(id *)(a1 + 32) addObject:v11];
        id v12 = [*(id *)(a1 + 40) objectForKeyedSubscript:v11];
        if (!v12)
        {
          id v12 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
          [*(id *)(a1 + 40) setObject:v12 forKeyedSubscript:v11];
        }
        [v12 addObject:v5];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
}

void __86__PLCloudAssetPayloadRestore__resolveLocalIdentifiersForCloudIdentifiersForPayloadIDs__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = PLMigrationGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412546;
    id v8 = v4;
    __int16 v9 = 2112;
    uint64_t v10 = v6;
    _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_INFO, "ComputeCache BatchRestore: Skipped payload (resolve cloud identifiers failed): %@, %@\n", (uint8_t *)&v7, 0x16u);
  }

  ++*(void *)(*(void *)(a1 + 40) + 48);
}

void __86__PLCloudAssetPayloadRestore__resolveLocalIdentifiersForCloudIdentifiersForPayloadIDs__block_invoke_60(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  int v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:v5];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        id v13 = [*(id *)(a1 + 40) objectForKeyedSubscript:v12];
        if (!v13)
        {
          id v13 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
          [*(id *)(a1 + 40) setObject:v13 forKeyedSubscript:v12];
        }
        [v13 setObject:v6 forKeyedSubscript:v5];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }
}

- (void)_insertPayload:(id)a3 forAssets:(id)a4 skipMessage:(id)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  delegate = self->_delegate;
  id v11 = a4;
  uint64_t v12 = [(PLCloudAssetPayloadRestoreDelegate *)delegate managedObjectContext];
  char v13 = [v8 insertWithAssets:v11 inManagedObjectContext:v12];

  if (v13)
  {
    uint64_t v14 = 40;
  }
  else
  {
    long long v15 = PLMigrationGetLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      int v16 = 138412546;
      id v17 = v9;
      __int16 v18 = 2112;
      id v19 = v8;
      _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_INFO, "ComputeCache BatchRestore: Skipped payload (%@): %@\n", (uint8_t *)&v16, 0x16u);
    }

    uint64_t v14 = 48;
  }
  ++*(Class *)((char *)&self->super.isa + v14);
}

- (void)_insertBatchOfUnresolvedCloudIdentifiers
{
  id v3 = [(PLCloudAssetPayloadRestore *)self _resolveLocalIdentifiersForCloudIdentifiersForPayloadIDs];
  id v4 = v3;
  if (v3)
  {
    delegate = self->_delegate;
    uint64_t v6 = MEMORY[0x1E4F143A8];
    uint64_t v7 = 3221225472;
    id v8 = __70__PLCloudAssetPayloadRestore__insertBatchOfUnresolvedCloudIdentifiers__block_invoke;
    id v9 = &unk_1E5875E18;
    uint64_t v10 = self;
    id v11 = v3;
    [(PLCloudAssetPayloadRestoreDelegate *)delegate performTransactionAndWait:&v6];
    [(NSMutableDictionary *)self->_payloadsWithUnresolvedAssets removeAllObjects];
  }
  else
  {
    [(NSMutableDictionary *)self->_payloadsWithUnresolvedAssets removeAllObjects];
  }
}

void __70__PLCloudAssetPayloadRestore__insertBatchOfUnresolvedCloudIdentifiers__block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 24);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __70__PLCloudAssetPayloadRestore__insertBatchOfUnresolvedCloudIdentifiers__block_invoke_2;
  v15[3] = &unk_1E5875D08;
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 32);
  id v16 = v3;
  uint64_t v17 = v4;
  [v2 enumerateKeysAndObjectsUsingBlock:v15];
  id v5 = objc_opt_class();
  uint64_t v6 = [*(id *)(*(void *)(a1 + 32) + 24) allValues];
  uint64_t v7 = [*(id *)(*(void *)(a1 + 32) + 8) managedObjectContext];
  id v8 = [v5 assetsForPayloadIDsWithPayloads:v6 inManagedObjectContext:v7];

  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = *(void **)(v9 + 24);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __70__PLCloudAssetPayloadRestore__insertBatchOfUnresolvedCloudIdentifiers__block_invoke_56;
  v12[3] = &unk_1E5875D08;
  id v13 = v8;
  uint64_t v14 = v9;
  id v11 = v8;
  [v10 enumerateKeysAndObjectsUsingBlock:v12];
}

void __70__PLCloudAssetPayloadRestore__insertBatchOfUnresolvedCloudIdentifiers__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:a2];
  if ([v6 count])
  {
    [v5 setLocalAssetIdentifierForCloudIdentifiers:v6];
  }
  else
  {
    uint64_t v7 = PLMigrationGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = [v5 payloadID];
      int v9 = 138412290;
      uint64_t v10 = v8;
      _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_INFO, "ComputeCache BatchRestore: Skipped payload (resolved local identifiers not found for unresolved cloud identifiers): %@\n", (uint8_t *)&v9, 0xCu);
    }
    ++*(void *)(*(void *)(a1 + 40) + 48);
  }
}

void __70__PLCloudAssetPayloadRestore__insertBatchOfUnresolvedCloudIdentifiers__block_invoke_56(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:a2];
  unint64_t v7 = [v6 count];
  if (v7 >= [v5 assetIdentifierCount])
  {
    [*(id *)(a1 + 40) _insertPayload:v5 forAssets:v6 skipMessage:@"after resolve remapped identifiers"];
  }
  else
  {
    id v8 = PLMigrationGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v9 = [v5 payloadID];
      int v10 = 138412290;
      uint64_t v11 = v9;
      _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_INFO, "ComputeCache BatchRestore: Skipped payload (missing assets after resolving local identifiers): %@\n", (uint8_t *)&v10, 0xCu);
    }
    ++*(void *)(*(void *)(a1 + 40) + 48);
  }
}

- (void)_insertBatchToRestore
{
  delegate = self->_delegate;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __51__PLCloudAssetPayloadRestore__insertBatchToRestore__block_invoke;
  v3[3] = &unk_1E5875CE0;
  v3[4] = self;
  [(PLCloudAssetPayloadRestoreDelegate *)delegate performTransactionAndWait:v3];
}

void __51__PLCloudAssetPayloadRestore__insertBatchToRestore__block_invoke(uint64_t a1)
{
  v2 = objc_opt_class();
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v3 + 16);
  id v5 = [*(id *)(v3 + 8) managedObjectContext];
  uint64_t v6 = [v2 assetsForPayloadIDsWithPayloads:v4 inManagedObjectContext:v5];

  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(void **)(v7 + 16);
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  uint64_t v12 = __51__PLCloudAssetPayloadRestore__insertBatchToRestore__block_invoke_2;
  id v13 = &unk_1E5875C90;
  id v14 = v6;
  uint64_t v15 = v7;
  id v9 = v6;
  [v8 enumerateObjectsUsingBlock:&v10];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "removeAllObjects", v10, v11, v12, v13);
}

void __51__PLCloudAssetPayloadRestore__insertBatchToRestore__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = [v3 payloadID];
  uint64_t v6 = [v4 objectForKeyedSubscript:v5];

  unint64_t v7 = [v6 count];
  if (v7 >= [v3 assetIdentifierCount])
  {
    [*(id *)(a1 + 40) _insertPayload:v3 forAssets:v6 skipMessage:@"existing asset"];
  }
  else if ([v3 assetIdentifierType] == 1)
  {
    id v8 = *(void **)(*(void *)(a1 + 40) + 24);
    id v9 = [v3 payloadID];
    [v8 setObject:v3 forKeyedSubscript:v9];
  }
  else
  {
    uint64_t v10 = PLMigrationGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = [v3 payloadID];
      int v12 = 138412290;
      id v13 = v11;
      _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_INFO, "ComputeCache BatchRestore: Skipped payload (missing asset): %@\n", (uint8_t *)&v12, 0xCu);
    }
    ++*(void *)(*(void *)(a1 + 40) + 48);
  }
}

- (void)insertRemainingPayloads
{
  if ([(NSMutableArray *)self->_batchToRestore count]) {
    [(PLCloudAssetPayloadRestore *)self _insertBatchToRestore];
  }
  if ([(NSMutableDictionary *)self->_payloadsWithUnresolvedAssets count])
  {
    [(PLCloudAssetPayloadRestore *)self _insertBatchOfUnresolvedCloudIdentifiers];
  }
}

- (void)addPayload:(id)a3
{
  [(NSMutableArray *)self->_batchToRestore addObject:a3];
  if ([(NSMutableArray *)self->_batchToRestore count] >= self->_batchSize) {
    [(PLCloudAssetPayloadRestore *)self _insertBatchToRestore];
  }
  if ([(NSMutableDictionary *)self->_payloadsWithUnresolvedAssets count] >= self->_batchSize)
  {
    [(PLCloudAssetPayloadRestore *)self _insertBatchOfUnresolvedCloudIdentifiers];
  }
}

- (PLCloudAssetPayloadRestore)initWithDelegate:(id)a3 batchSize:(unint64_t)a4
{
  id v7 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PLCloudAssetPayloadRestore;
  id v8 = [(PLCloudAssetPayloadRestore *)&v16 init];
  id v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_delegate, a3);
    unint64_t v10 = 50;
    if (a4) {
      unint64_t v10 = a4;
    }
    v9->_batchSize = v10;
    uint64_t v11 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v9->_batchSize];
    batchToRestore = v9->_batchToRestore;
    v9->_batchToRestore = (NSMutableArray *)v11;

    id v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    payloadsWithUnresolvedAssets = v9->_payloadsWithUnresolvedAssets;
    v9->_payloadsWithUnresolvedAssets = v13;
  }
  return v9;
}

+ (id)relationshipKeyPathsForPrefetching
{
  v4[2] = *MEMORY[0x1E4F143B8];
  v4[0] = @"additionalAttributes";
  v4[1] = @"detectedFaces";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:2];
  return v2;
}

+ (id)assetsForPayloadIDsWithPayloads:(id)a3 inManagedObjectContext:(id)a4
{
  id v6 = a4;
  id v7 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v8 = a3;
  id v9 = objc_alloc_init(v7);
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __85__PLCloudAssetPayloadRestore_assetsForPayloadIDsWithPayloads_inManagedObjectContext___block_invoke;
  v40[3] = &unk_1E5875C90;
  id v12 = v10;
  id v41 = v12;
  id v13 = v11;
  id v42 = v13;
  [v8 enumerateObjectsUsingBlock:v40];

  unint64_t v14 = 0x1E4F1C000;
  if ([v13 count])
  {
    uint64_t v15 = (void *)MEMORY[0x1E4F1C0D0];
    objc_super v16 = +[PLManagedAsset entityName];
    uint64_t v17 = [v15 fetchRequestWithEntityName:v16];

    __int16 v18 = (void *)MEMORY[0x1E4F28F60];
    id v19 = [v13 allKeys];
    uint64_t v20 = [v18 predicateWithFormat:@"%K IN %@", @"cloudAssetGUID", v19];
    [v17 setPredicate:v20];

    id v21 = [a1 relationshipKeyPathsForPrefetching];
    [v17 setRelationshipKeyPathsForPrefetching:v21];

    v22 = [v6 executeFetchRequest:v17 error:0];
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __85__PLCloudAssetPayloadRestore_assetsForPayloadIDsWithPayloads_inManagedObjectContext___block_invoke_2;
    v37[3] = &unk_1E5875CB8;
    id v38 = v13;
    id v39 = v9;
    [v22 enumerateObjectsUsingBlock:v37];

    unint64_t v14 = 0x1E4F1C000uLL;
  }
  if ([v12 count])
  {
    v23 = *(void **)(v14 + 208);
    id v24 = +[PLManagedAsset entityName];
    v25 = [v23 fetchRequestWithEntityName:v24];

    id v26 = (void *)MEMORY[0x1E4F28F60];
    id v27 = [v12 allKeys];
    v28 = [v26 predicateWithFormat:@"%K IN %@", @"uuid", v27];
    [v25 setPredicate:v28];

    v29 = [a1 relationshipKeyPathsForPrefetching];
    [v25 setRelationshipKeyPathsForPrefetching:v29];

    uint64_t v30 = [v6 executeFetchRequest:v25 error:0];
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __85__PLCloudAssetPayloadRestore_assetsForPayloadIDsWithPayloads_inManagedObjectContext___block_invoke_3;
    v34[3] = &unk_1E5875CB8;
    id v35 = v12;
    id v36 = v9;
    [v30 enumerateObjectsUsingBlock:v34];
  }
  v31 = v42;
  id v32 = v9;

  return v32;
}

void __85__PLCloudAssetPayloadRestore_assetsForPayloadIDsWithPayloads_inManagedObjectContext___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 assetIdentifierType];
  if (v4 == 1)
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v5 = objc_msgSend(v3, "assetIdentifiers", 0);
    uint64_t v15 = [v5 countByEnumeratingWithState:&v24 objects:v32 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v25 != v17) {
            objc_enumerationMutation(v5);
          }
          uint64_t v19 = *(void *)(*((void *)&v24 + 1) + 8 * i);
          uint64_t v20 = *(void **)(a1 + 40);
          uint64_t v21 = [v3 payloadID];
          v22 = (void *)v21;
          if (v19) {
            BOOL v23 = v21 == 0;
          }
          else {
            BOOL v23 = 1;
          }
          if (!v23) {
            [v20 setObject:v21 forKey:v19];
          }
        }
        uint64_t v16 = [v5 countByEnumeratingWithState:&v24 objects:v32 count:16];
      }
      while (v16);
    }
    goto LABEL_28;
  }
  if (!v4)
  {
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v5 = [v3 assetIdentifiers];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v29;
      do
      {
        for (uint64_t j = 0; j != v7; ++j)
        {
          if (*(void *)v29 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v28 + 1) + 8 * j);
          id v11 = *(void **)(a1 + 32);
          uint64_t v12 = [v3 payloadID];
          id v13 = (void *)v12;
          if (v10) {
            BOOL v14 = v12 == 0;
          }
          else {
            BOOL v14 = 1;
          }
          if (!v14) {
            [v11 setObject:v12 forKey:v10];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v28 objects:v33 count:16];
      }
      while (v7);
    }
LABEL_28:
  }
}

void __85__PLCloudAssetPayloadRestore_assetsForPayloadIDsWithPayloads_inManagedObjectContext___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  id v9 = v3;
  uint64_t v5 = [v3 cloudAssetGUID];
  if (v5)
  {
    uint64_t v6 = (void *)v5;
    uint64_t v7 = [v4 objectForKeyedSubscript:v5];

    if (v7)
    {
      id v8 = [*(id *)(a1 + 40) objectForKeyedSubscript:v7];
      if (!v8)
      {
        id v8 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
        [*(id *)(a1 + 40) setObject:v8 forKeyedSubscript:v7];
      }
      [v8 addObject:v9];
    }
  }
}

void __85__PLCloudAssetPayloadRestore_assetsForPayloadIDsWithPayloads_inManagedObjectContext___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  id v9 = v3;
  uint64_t v5 = [v3 uuid];
  if (v5)
  {
    uint64_t v6 = (void *)v5;
    uint64_t v7 = [v4 objectForKeyedSubscript:v5];

    if (v7)
    {
      id v8 = [*(id *)(a1 + 40) objectForKeyedSubscript:v7];
      if (!v8)
      {
        id v8 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
        [*(id *)(a1 + 40) setObject:v8 forKeyedSubscript:v7];
      }
      [v8 addObject:v9];
    }
  }
}

+ (id)assetForPayload:(id)a3 inManagedObjectContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 assetIdentifiers];
  uint64_t v9 = [v8 count];

  if (!v9)
  {
    uint64_t v19 = 0;
    goto LABEL_9;
  }
  uint64_t v10 = (void *)MEMORY[0x1E4F1C0D0];
  id v11 = +[PLManagedAsset entityName];
  uint64_t v12 = [v10 fetchRequestWithEntityName:v11];

  uint64_t v13 = [v6 assetIdentifierType];
  if (v13 == 1)
  {
    BOOL v14 = (void *)MEMORY[0x1E4F28F60];
    uint64_t v15 = [v6 assetIdentifiers];
    uint64_t v16 = [v15 anyObject];
    uint64_t v17 = (void *)v16;
    __int16 v18 = @"cloudAssetGUID";
    goto LABEL_7;
  }
  if (!v13)
  {
    BOOL v14 = (void *)MEMORY[0x1E4F28F60];
    uint64_t v15 = [v6 assetIdentifiers];
    uint64_t v16 = [v15 anyObject];
    uint64_t v17 = (void *)v16;
    __int16 v18 = @"uuid";
LABEL_7:
    uint64_t v20 = [v14 predicateWithFormat:@"%K == %@", v18, v16];
    [v12 setPredicate:v20];
  }
  uint64_t v21 = [a1 relationshipKeyPathsForPrefetching];
  [v12 setRelationshipKeyPathsForPrefetching:v21];

  v22 = [v7 executeFetchRequest:v12 error:0];
  uint64_t v19 = [v22 firstObject];

LABEL_9:
  return v19;
}

@end