@interface PLLibraryScopeChangeTracker
- (BOOL)hasChangeTrackerToken;
- (BOOL)start;
- (PLLibraryScopeChangeTracker)initWithManagedObjectContext:(id)a3;
- (PLLibraryScopeChangeTrackerDelegate)delegate;
- (id)_allowedPropertyDescriptionsForEntityName:(id)a3;
- (id)_transactionIteratorSinceToken:(id)a3;
- (id)currentToken;
- (id)fetchObjectsNeedingEvaluation;
- (id)fetchResultsSincePersistentHistoryToken:(id)a3;
- (id)lastKnownTokenFromDisk;
- (void)clearToken;
- (void)saveLastKnownChangeTrackerTokenToDisk;
- (void)setDelegate:(id)a3;
- (void)updateLastKnownTokenToResult:(id)a3;
@end

@implementation PLLibraryScopeChangeTracker

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_entityNameToAllowedPropertyDescriptionMap, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_lastKnownToken, 0);
}

- (void)setDelegate:(id)a3
{
}

- (PLLibraryScopeChangeTrackerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PLLibraryScopeChangeTrackerDelegate *)WeakRetained;
}

- (void)updateLastKnownTokenToResult:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v4 = [a3 lastProcessedCoreDataToken];
  v5 = PLBackendSharingGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 138412290;
    v9 = v4;
    _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_DEBUG, "Updating last known tokens from result token: %@", (uint8_t *)&v8, 0xCu);
  }

  if (v4)
  {
    v6 = (NSPersistentHistoryToken *)[v4 copy];
    lastKnownToken = self->_lastKnownToken;
    self->_lastKnownToken = v6;
  }
  [(PLLibraryScopeChangeTracker *)self saveLastKnownChangeTrackerTokenToDisk];
}

- (id)_allowedPropertyDescriptionsForEntityName:(id)a3
{
  v35[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  entityNameToAllowedPropertyDescriptionMap = self->_entityNameToAllowedPropertyDescriptionMap;
  if (!entityNameToAllowedPropertyDescriptionMap)
  {
    v6 = (void *)MEMORY[0x1E4F1C0A8];
    v7 = +[PLManagedAsset entityName];
    int v8 = [v6 entityForName:v7 inManagedObjectContext:self->_context];

    v9 = (void *)MEMORY[0x1E4F1C0A8];
    uint64_t v10 = +[PLDetectedFace entityName];
    v23 = [v9 entityForName:v10 inManagedObjectContext:self->_context];

    v31 = +[PLManagedAsset entityName];
    v34[0] = v31;
    v30 = [v8 propertiesByName];
    v29 = [v30 valueForKey:@"locationData"];
    v33[0] = v29;
    v28 = [v8 propertiesByName];
    v27 = [v28 valueForKey:@"longitude"];
    v33[1] = v27;
    v26 = [v8 propertiesByName];
    v25 = [v26 valueForKey:@"latitude"];
    v33[2] = v25;
    v24 = [v8 propertiesByName];
    v22 = [v24 valueForKey:@"detectedFaces"];
    v33[3] = v22;
    v11 = [v8 propertiesByName];
    v12 = [v11 valueForKey:@"addedDate"];
    v33[4] = v12;
    v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:5];
    v35[0] = v13;
    v14 = +[PLDetectedFace entityName];
    v34[1] = v14;
    v15 = [v23 propertiesByName];
    v16 = [v15 valueForKey:@"personForFace"];
    v32 = v16;
    v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v32 count:1];
    v35[1] = v17;
    v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:v34 count:2];
    v19 = self->_entityNameToAllowedPropertyDescriptionMap;
    self->_entityNameToAllowedPropertyDescriptionMap = v18;

    entityNameToAllowedPropertyDescriptionMap = self->_entityNameToAllowedPropertyDescriptionMap;
  }
  v20 = [(NSDictionary *)entityNameToAllowedPropertyDescriptionMap objectForKeyedSubscript:v4];

  return v20;
}

- (id)_transactionIteratorSinceToken:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = (objc_class *)MEMORY[0x1E4F1C0D0];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  v7 = [MEMORY[0x1E4F1C158] entityDescriptionWithContext:self->_context];
  [v6 setEntity:v7];
  int v8 = (void *)MEMORY[0x1E4F1C0A8];
  v9 = +[PLManagedAsset entityName];
  uint64_t v10 = [v8 entityForName:v9 inManagedObjectContext:self->_context];

  v11 = (void *)MEMORY[0x1E4F1C0A8];
  v12 = +[PLDetectedFace entityName];
  v13 = [v11 entityForName:v12 inManagedObjectContext:self->_context];

  v14 = [v7 propertiesByName];
  v15 = [v14 valueForKey:@"changedEntity"];

  v16 = (void *)MEMORY[0x1E4F28F60];
  v17 = [v15 name];
  v18 = [v15 name];
  v19 = [v16 predicateWithFormat:@"%K = %@ OR %K = %@", v17, v10, v18, v13];
  [v6 setPredicate:v19];

  v20 = +[PLPersistentHistoryMarker markerWithToken:v5];

  context = self->_context;
  id v26 = 0;
  v22 = +[PLPersistentHistoryTransactionIterator iteratorSinceMarker:v20 withFetchRequest:v6 managedObjectObjectContext:context error:&v26];
  id v23 = v26;
  if (!v22)
  {
    v24 = PLBackendSharingGetLog();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v28 = v23;
      _os_log_impl(&dword_19B3C7000, v24, OS_LOG_TYPE_ERROR, "Failed to fetch rules transaction iterator: %@", buf, 0xCu);
    }
  }
  return v22;
}

- (id)fetchResultsSincePersistentHistoryToken:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v5 = PLBackendSharingGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_ERROR, "Token is nil so fetching ALL transactions", buf, 2u);
    }
  }
  id v6 = [(PLLibraryScopeChangeTracker *)self _transactionIteratorSinceToken:v4];
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __71__PLLibraryScopeChangeTracker_fetchResultsSincePersistentHistoryToken___block_invoke;
  v17[3] = &unk_1E5873498;
  v17[4] = self;
  id v18 = v7;
  id v19 = v8;
  id v9 = v8;
  id v10 = v7;
  [v6 enumerateRemainingTransactionsWithBlock:v17];
  v11 = [PLLibraryScopeTransactionResult alloc];
  v12 = [v6 lastIteratedToken];
  v13 = [v10 allObjects];
  v14 = [v9 allObjects];
  v15 = [(PLLibraryScopeTransactionResult *)v11 initWithToken:v12 assetObjectIDs:v13 detectedFaceObjectIDs:v14];

  return v15;
}

void __71__PLLibraryScopeChangeTracker_fetchResultsSincePersistentHistoryToken___block_invoke(void *a1, void *a2)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  obuint64_t j = [a2 changes];
  uint64_t v2 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v34 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v40 != v34) {
          objc_enumerationMutation(obj);
        }
        id v5 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        uint64_t v6 = [v5 changeType];
        if (v6 == 1)
        {
          id v9 = [v5 updatedProperties];
          id v10 = (void *)a1[4];
          v11 = [v5 changedObjectID];
          v12 = [v11 entity];
          v13 = [v12 name];
          v14 = [v10 _allowedPropertyDescriptionsForEntityName:v13];

          long long v37 = 0u;
          long long v38 = 0u;
          long long v35 = 0u;
          long long v36 = 0u;
          id v15 = v14;
          uint64_t v16 = [v15 countByEnumeratingWithState:&v35 objects:v43 count:16];
          if (v16)
          {
            uint64_t v17 = v16;
            uint64_t v18 = *(void *)v36;
            while (2)
            {
              for (uint64_t j = 0; j != v17; ++j)
              {
                if (*(void *)v36 != v18) {
                  objc_enumerationMutation(v15);
                }
                if ([v9 containsObject:*(void *)(*((void *)&v35 + 1) + 8 * j)])
                {
                  int v7 = 1;
                  goto LABEL_19;
                }
              }
              uint64_t v17 = [v15 countByEnumeratingWithState:&v35 objects:v43 count:16];
              if (v17) {
                continue;
              }
              break;
            }
          }
          int v7 = 0;
LABEL_19:
        }
        else
        {
          int v7 = 0;
          if (!v6)
          {
            int v8 = 1;
            goto LABEL_21;
          }
        }
        int v8 = 0;
LABEL_21:
        v20 = [v5 changedObjectID];
        v21 = [v20 entity];
        v22 = [v21 name];
        id v23 = +[PLManagedAsset entityName];
        int v24 = [v22 isEqualToString:v23];

        if (v24)
        {
          if ((v7 | v8) != 1) {
            continue;
          }
          v25 = (void *)a1[5];
        }
        else
        {
          id v26 = [v5 changedObjectID];
          v27 = [v26 entity];
          id v28 = [v27 name];
          uint64_t v29 = +[PLDetectedFace entityName];
          int v30 = [v28 isEqualToString:v29];

          if ((v7 & v30) != 1) {
            continue;
          }
          v25 = (void *)a1[6];
        }
        v31 = [v5 changedObjectID];
        [v25 addObject:v31];
      }
      uint64_t v3 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
    }
    while (v3);
  }
}

- (id)fetchObjectsNeedingEvaluation
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = PLBackendSharingGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    lastKnownToken = self->_lastKnownToken;
    int v7 = 138412290;
    int v8 = lastKnownToken;
    _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_DEBUG, "Fetch all events since token: %@", (uint8_t *)&v7, 0xCu);
  }

  id v5 = [(PLLibraryScopeChangeTracker *)self fetchResultsSincePersistentHistoryToken:self->_lastKnownToken];
  return v5;
}

- (void)saveLastKnownChangeTrackerTokenToDisk
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = PLBackendSharingGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    lastKnownToken = self->_lastKnownToken;
    int v6 = 138412290;
    int v7 = lastKnownToken;
    _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_DEBUG, "Saving last known token to disk: %@", (uint8_t *)&v6, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained saveRulesTrackerToken:self->_lastKnownToken];
}

- (id)lastKnownTokenFromDisk
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  uint64_t v3 = [WeakRetained readRulesTrackerToken];

  id v4 = PLBackendSharingGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 138412290;
    int v7 = v3;
    _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_DEBUG, "Last known token from disk: %@", (uint8_t *)&v6, 0xCu);
  }

  return v3;
}

- (id)currentToken
{
  uint64_t v2 = [(NSManagedObjectContext *)self->_context persistentStoreCoordinator];
  uint64_t v3 = [v2 currentPersistentHistoryTokenFromStores:0];

  return v3;
}

- (BOOL)start
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  [(PLLibraryScopeChangeTracker *)self clearToken];
  uint64_t v3 = [(PLLibraryScopeChangeTracker *)self lastKnownTokenFromDisk];
  if (!v3)
  {
    uint64_t v3 = [(PLLibraryScopeChangeTracker *)self currentToken];
  }
  id v4 = (NSPersistentHistoryToken *)[v3 copy];
  lastKnownToken = self->_lastKnownToken;
  self->_lastKnownToken = v4;

  int v6 = PLBackendSharingGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v7 = self->_lastKnownToken;
    int v9 = 138412290;
    id v10 = v7;
    _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_DEBUG, "Set initial last known tokens to: %@", (uint8_t *)&v9, 0xCu);
  }

  [(PLLibraryScopeChangeTracker *)self saveLastKnownChangeTrackerTokenToDisk];
  return 1;
}

- (void)clearToken
{
  lastKnownToken = self->_lastKnownToken;
  self->_lastKnownToken = 0;
}

- (BOOL)hasChangeTrackerToken
{
  return self->_lastKnownToken != 0;
}

- (PLLibraryScopeChangeTracker)initWithManagedObjectContext:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PLLibraryScopeChangeTracker;
  int v6 = [(PLLibraryScopeChangeTracker *)&v9 init];
  int v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_context, a3);
  }

  return v7;
}

@end