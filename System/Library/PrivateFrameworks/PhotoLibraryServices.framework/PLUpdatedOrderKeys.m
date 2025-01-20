@interface PLUpdatedOrderKeys
- (BOOL)_inq_registerForStoreOrderKeyUpdateNotificationFromManagedObjectContext:(id)a3;
- (BOOL)isObservingOrderKeys;
- (BOOL)registerForStoreOrderKeyUpdateNotificationFromManagedObjectContext:(id)a3;
- (PLUpdatedOrderKeys)init;
- (id)_persistentStoresForContext:(id)a3;
- (id)getAndClearUpdatedOrderKeys;
- (void)persistentStoreDidUpdateOrderKeys:(id)a3;
@end

@implementation PLUpdatedOrderKeys

- (BOOL)registerForStoreOrderKeyUpdateNotificationFromManagedObjectContext:(id)a3
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  id v5 = a3;
  PLRunWithUnfairLock();
  char v3 = *((unsigned char *)v7 + 24);

  _Block_object_dispose(&v6, 8);
  return v3;
}

- (PLUpdatedOrderKeys)init
{
  v6.receiver = self;
  v6.super_class = (Class)PLUpdatedOrderKeys;
  v2 = [(PLUpdatedOrderKeys *)&v6 init];
  char v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

void __89__PLUpdatedOrderKeys_registerForStoreOrderKeyUpdateNotificationFromManagedObjectContext___block_invoke(void *a1)
{
  v2 = (void *)MEMORY[0x19F38D3B0]();
  char v3 = (unsigned char *)a1[4];
  if (!v3[12])
  {
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = objc_msgSend(v3, "_inq_registerForStoreOrderKeyUpdateNotificationFromManagedObjectContext:", a1[5]);
    *(unsigned char *)(a1[4] + 12) = 1;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updatedOrderKeyObjectIDs, 0);
  objc_storeStrong((id *)&self->_observedRelationships, 0);
}

- (void)persistentStoreDidUpdateOrderKeys:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  PLRunWithUnfairLock();
}

void __56__PLUpdatedOrderKeys_persistentStoreDidUpdateOrderKeys___block_invoke(uint64_t a1)
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  context = (void *)MEMORY[0x19F38D3B0]();
  v32 = [*(id *)(a1 + 32) userInfo];
  [v32 objectForKey:@"addedOrUpdated"];
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v35 = [obj countByEnumeratingWithState:&v51 objects:v63 count:16];
  if (v35)
  {
    uint64_t v34 = *(void *)v52;
    unint64_t v2 = 0x1E4F28000uLL;
    do
    {
      uint64_t v3 = 0;
      do
      {
        if (*(void *)v52 != v34) {
          objc_enumerationMutation(obj);
        }
        uint64_t v36 = v3;
        v41 = *(void **)(*((void *)&v51 + 1) + 8 * v3);
        id v4 = [v41 entity];
        long long v49 = 0u;
        long long v50 = 0u;
        long long v47 = 0u;
        long long v48 = 0u;
        id v42 = *(id *)(*(void *)(a1 + 40) + 16);
        uint64_t v5 = [v42 countByEnumeratingWithState:&v47 objects:v62 count:16];
        if (v5)
        {
          uint64_t v6 = v5;
          uint64_t v7 = *(void *)v48;
          uint64_t v37 = *(void *)v48;
          v38 = v4;
          do
          {
            uint64_t v8 = 0;
            uint64_t v39 = v6;
            do
            {
              if (*(void *)v48 != v7) {
                objc_enumerationMutation(v42);
              }
              char v9 = *(void **)(*((void *)&v47 + 1) + 8 * v8);
              v10 = [v9 entity];
              int v11 = [v4 isKindOfEntity:v10];

              if (v11)
              {
                v12 = [obj objectForKey:v41];
                v13 = [v9 name];
                v14 = [v12 objectForKey:v13];
                if ([v14 count])
                {
                  v43 = v13;
                  v44 = v12;
                  uint64_t v45 = v8;
                  v15 = [v9 inverseRelationship];
                  v16 = [v15 name];
                  v61 = v16;
                  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v61 count:1];
                  v46 = v15;
                  v18 = [v15 entity];
                  v19 = [v18 name];
                  unint64_t v20 = +[PLPropertyIndexMapping indexValueForRelationshipNames:v17 entity:v19];

                  if ([v14 count])
                  {
                    unint64_t v21 = 0;
                    do
                    {
                      v22 = [v14 objectAtIndexedSubscript:v21];
                      v23 = [*(id *)(*(void *)(a1 + 40) + 24) objectForKey:v22];
                      v24 = v23;
                      uint64_t v25 = v20;
                      if (v23) {
                        uint64_t v25 = objc_msgSend(v23, "unsignedLongLongValue", v20) | v20;
                      }
                      v26 = *(void **)(*(void *)(a1 + 40) + 24);
                      v27 = [*(id *)(v2 + 3792) numberWithUnsignedLongLong:v25];
                      [v26 setObject:v27 forKey:v22];

                      v28 = PLChangeHandlingGetLog();
                      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
                      {
                        v29 = [v14 objectAtIndexedSubscript:v21 + 1];
                        [v46 name];
                        v31 = unint64_t v30 = v2;
                        *(_DWORD *)buf = 138412802;
                        v56 = v29;
                        __int16 v57 = 2112;
                        v58 = v31;
                        __int16 v59 = 2112;
                        v60 = v22;
                        _os_log_impl(&dword_19B3C7000, v28, OS_LOG_TYPE_DEBUG, "Adding updated order key %@ for %@ on %@.", buf, 0x20u);

                        unint64_t v2 = v30;
                      }

                      v21 += 2;
                    }
                    while (v21 < [v14 count]);
                  }

                  uint64_t v7 = v37;
                  id v4 = v38;
                  uint64_t v6 = v39;
                  v12 = v44;
                  uint64_t v8 = v45;
                  v13 = v43;
                }
              }
              ++v8;
            }
            while (v8 != v6);
            uint64_t v6 = [v42 countByEnumeratingWithState:&v47 objects:v62 count:16];
          }
          while (v6);
        }

        uint64_t v3 = v36 + 1;
      }
      while (v36 + 1 != v35);
      uint64_t v35 = [obj countByEnumeratingWithState:&v51 objects:v63 count:16];
    }
    while (v35);
  }
}

- (id)getAndClearUpdatedOrderKeys
{
  unint64_t v2 = PLResultWithUnfairLock();
  if (!v2) {
    unint64_t v2 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v2;
}

id __49__PLUpdatedOrderKeys_getAndClearUpdatedOrderKeys__block_invoke(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 24) count])
  {
    unint64_t v2 = (void *)[*(id *)(*(void *)(a1 + 32) + 24) copy];
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void **)(v4 + 24);
    *(void *)(v4 + 24) = v3;
  }
  else
  {
    unint64_t v2 = 0;
  }
  return v2;
}

- (id)_persistentStoresForContext:(id)a3
{
  id v3 = [a3 persistentStoreCoordinator];
  uint64_t v4 = [v3 persistentStores];

  return v4;
}

- (BOOL)_inq_registerForStoreOrderKeyUpdateNotificationFromManagedObjectContext:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v34 = a3;
  v31 = [v34 persistentStoreCoordinator];
  [v31 persistentStores];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v35 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
  char v4 = 0;
  if (v35)
  {
    uint64_t v33 = *(void *)v38;
    uint64_t v30 = *MEMORY[0x1E4F1BEE0];
    do
    {
      for (uint64_t i = 0; i != v35; ++i)
      {
        if (*(void *)v38 != v33) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        uint64_t v7 = [v6 URL];
        uint64_t v8 = [v7 path];
        char v9 = [v34 photoLibrary];
        v10 = [v9 pathManager];
        int v11 = [v10 photosDatabasePath];
        int v12 = [v8 isEqualToString:v11];

        if (v12)
        {
          v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
          updatedOrderKeyObjectIDs = self->_updatedOrderKeyObjectIDs;
          self->_updatedOrderKeyObjectIDs = v13;

          v15 = [MEMORY[0x1E4F1CA80] set];
          v16 = [v31 managedObjectModel];
          v17 = [v16 entitiesByName];
          v18 = [v17 objectForKey:@"Album"];
          v19 = [v18 relationshipsByName];
          unint64_t v20 = [v19 objectForKey:@"assets"];

          [v15 addObject:v20];
          unint64_t v21 = [v16 entitiesByName];
          v22 = [v21 objectForKey:@"Folder"];
          v23 = [v22 relationshipsByName];
          v24 = [v23 objectForKey:@"childCollections"];

          [v15 addObject:v24];
          uint64_t v25 = (NSSet *)[v15 copy];
          observedRelationships = self->_observedRelationships;
          self->_observedRelationships = v25;

          v27 = PLChangeHandlingGetLog();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_19B3C7000, v27, OS_LOG_TYPE_DEBUG, "PLChangeNode registering for order key change notifications.", buf, 2u);
          }

          v28 = [MEMORY[0x1E4F28EB8] defaultCenter];
          [v28 addObserver:self selector:sel_persistentStoreDidUpdateOrderKeys_ name:v30 object:v6];

          char v4 = 1;
        }
      }
      uint64_t v35 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
    }
    while (v35);
  }

  return v4 & 1;
}

- (BOOL)isObservingOrderKeys
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2020000000;
  char v7 = 0;
  PLRunWithUnfairLock();
  char v2 = *((unsigned char *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v2;
}

uint64_t __42__PLUpdatedOrderKeys_isObservingOrderKeys__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 12);
  return result;
}

@end