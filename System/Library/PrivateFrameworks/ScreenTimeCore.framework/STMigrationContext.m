@interface STMigrationContext
- (BOOL)deleteLocalObjectWithUniqueIdentifier:(id)a3 managedObjectContext:(id)a4 error:(id *)a5;
- (BOOL)initializeCachesWithManagedObjectContext:(id)a3 withCloudStore:(id)a4 andLocalStore:(id)a5 error:(id *)a6;
- (STMigrationContext)init;
- (id)deleteCloudObjectWithUniqueIdentifier:(id)a3 managedObjectContext:(id)a4 error:(id *)a5;
- (id)updateCloudObjectWithUniqueIdentifier:(id)a3 dictionary:(id)a4 managedObjectContext:(id)a5 error:(id *)a6;
@end

@implementation STMigrationContext

- (STMigrationContext)init
{
  v12.receiver = self;
  v12.super_class = (Class)STMigrationContext;
  v2 = [(STMigrationContext *)&v12 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    uniqueIdentifierToCloudObjectID = v2->_uniqueIdentifierToCloudObjectID;
    v2->_uniqueIdentifierToCloudObjectID = (NSMutableDictionary *)v3;

    uint64_t v5 = objc_opt_new();
    uniqueIdentifierToLocalObjectID = v2->_uniqueIdentifierToLocalObjectID;
    v2->_uniqueIdentifierToLocalObjectID = (NSMutableDictionary *)v5;

    uint64_t v7 = objc_opt_new();
    deletedObjectIDs = v2->_deletedObjectIDs;
    v2->_deletedObjectIDs = (NSMutableSet *)v7;

    uint64_t v9 = objc_opt_new();
    filledObjectIDs = v2->_filledObjectIDs;
    v2->_filledObjectIDs = (NSMutableSet *)v9;
  }
  return v2;
}

- (BOOL)initializeCachesWithManagedObjectContext:(id)a3 withCloudStore:(id)a4 andLocalStore:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v38 = 0;
  v39 = &v38;
  uint64_t v40 = 0x2020000000;
  char v41 = 0;
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__12;
  v36 = __Block_byref_object_dispose__12;
  id v37 = 0;
  v13 = self->_uniqueIdentifierToCloudObjectID;
  v14 = self->_uniqueIdentifierToLocalObjectID;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __98__STMigrationContext_initializeCachesWithManagedObjectContext_withCloudStore_andLocalStore_error___block_invoke;
  v24[3] = &unk_1E6BC7D58;
  v30 = &v38;
  id v15 = v10;
  id v25 = v15;
  v31 = &v32;
  id v16 = v11;
  id v26 = v16;
  v17 = v13;
  v27 = v17;
  id v18 = v12;
  id v28 = v18;
  v19 = v14;
  v29 = v19;
  [v15 performBlockAndWait:v24];
  int v20 = *((unsigned __int8 *)v39 + 24);
  if (a6 && !*((unsigned char *)v39 + 24))
  {
    v21 = (void *)v33[5];
    if (v21)
    {
      *a6 = v21;
      int v20 = *((unsigned __int8 *)v39 + 24);
    }
    else
    {
      int v20 = 0;
    }
  }
  BOOL v22 = v20 != 0;

  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v38, 8);

  return v22;
}

void __98__STMigrationContext_initializeCachesWithManagedObjectContext_withCloudStore_andLocalStore_error___block_invoke(uint64_t a1)
{
  v59[6] = *MEMORY[0x1E4F143B8];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
  v2 = +[STCloudActivation entity];
  v59[0] = v2;
  uint64_t v3 = +[STBlueprint entity];
  v59[1] = v3;
  v4 = +[STFamilyOrganizationSettings entity];
  v59[2] = v4;
  uint64_t v5 = +[STiCloudOrganizationSettings entity];
  v59[3] = v5;
  v6 = +[STInstalledApp entity];
  v59[4] = v6;
  uint64_t v7 = +[STTestSyncableObject entity];
  v59[5] = v7;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v59 count:6];

  uint64_t v9 = a1;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id obj = v8;
  uint64_t v40 = [obj countByEnumeratingWithState:&v49 objects:v58 count:16];
  if (v40)
  {
    uint64_t v39 = *(void *)v50;
LABEL_3:
    uint64_t v10 = 0;
LABEL_4:
    if (*(void *)v50 != v39) {
      objc_enumerationMutation(obj);
    }
    id v11 = *(void **)(v9 + 32);
    id v12 = (void *)MEMORY[0x1E4F1C0D0];
    v13 = [*(id *)(*((void *)&v49 + 1) + 8 * v10) name];
    v14 = [v12 fetchRequestWithEntityName:v13];
    uint64_t v15 = *(void *)(*(void *)(v9 + 80) + 8);
    id v48 = *(id *)(v15 + 40);
    id v16 = [v11 executeFetchRequest:v14 error:&v48];
    objc_storeStrong((id *)(v15 + 40), v48);

    if (v16)
    {
      uint64_t v41 = v10;
      long long v46 = 0u;
      long long v47 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      id v42 = v16;
      uint64_t v17 = [v42 countByEnumeratingWithState:&v44 objects:v57 count:16];
      if (!v17) {
        goto LABEL_23;
      }
      uint64_t v18 = v17;
      uint64_t v43 = *(void *)v45;
      while (1)
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v45 != v43) {
            objc_enumerationMutation(v42);
          }
          int v20 = *(void **)(*((void *)&v44 + 1) + 8 * i);
          v21 = [v20 valueForKey:@"uniqueIdentifier"];
          if (v21)
          {
            BOOL v22 = [v20 objectID];
            v23 = [v22 persistentStore];
            v24 = [v23 identifier];
            [*(id *)(v9 + 40) identifier];
            v26 = uint64_t v25 = v9;
            int v27 = [v24 isEqualToString:v26];

            id v28 = [v20 objectID];
            v29 = v28;
            if (v27)
            {
              v30 = *(void **)(v25 + 48);
              goto LABEL_17;
            }
            v31 = [v28 persistentStore];
            uint64_t v32 = [v31 identifier];
            v33 = [*(id *)(v25 + 56) identifier];
            int v34 = [v32 isEqualToString:v33];

            if (v34)
            {
              v29 = [v20 objectID];
              v30 = *(void **)(v25 + 64);
LABEL_17:
              [v30 setObject:v29 forKeyedSubscript:v21];
            }
            else
            {
              v29 = +[STLog mirroring];
              if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
              {
                v35 = [v20 objectID];
                v36 = [v35 persistentStore];
                id v37 = [v36 identifier];
                *(_DWORD *)buf = 138543618;
                v54 = v37;
                __int16 v55 = 2114;
                v56 = v20;
                _os_log_error_impl(&dword_1DA519000, v29, OS_LOG_TYPE_ERROR, "Asked to cache object from an unknown store: %{public}@\n%{public}@", buf, 0x16u);
              }
            }
            uint64_t v9 = v25;
          }
        }
        uint64_t v18 = [v42 countByEnumeratingWithState:&v44 objects:v57 count:16];
        if (!v18)
        {
LABEL_23:

          uint64_t v10 = v41 + 1;
          if (v41 + 1 == v40)
          {
            uint64_t v40 = [obj countByEnumeratingWithState:&v49 objects:v58 count:16];
            if (!v40) {
              goto LABEL_27;
            }
            goto LABEL_3;
          }
          goto LABEL_4;
        }
      }
    }
    *(unsigned char *)(*(void *)(*(void *)(v9 + 72) + 8) + 24) = 0;
  }
LABEL_27:
}

- (id)updateCloudObjectWithUniqueIdentifier:(id)a3 dictionary:(id)a4 managedObjectContext:(id)a5 error:(id *)a6
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v27 = 0;
  v13 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v11 format:200 options:0 error:&v27];
  id v14 = v27;
  if (v13)
  {
    uint64_t v25 = [v11 objectForKeyedSubscript:@"class"];
    uint64_t v15 = +[STLog mirroring];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v29 = v25;
      __int16 v30 = 2114;
      id v31 = v10;
      _os_log_impl(&dword_1DA519000, v15, OS_LOG_TYPE_DEFAULT, "Looking up cloud object (%{public}@) matching ID: %{public}@", buf, 0x16u);
    }

    id v16 = [(NSMutableDictionary *)self->_uniqueIdentifierToCloudObjectID objectForKeyedSubscript:v10];
    uint64_t v17 = +[STLog mirroring];
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
    if (!v16)
    {
      if (v18)
      {
        *(_DWORD *)buf = 138543618;
        v29 = v25;
        __int16 v30 = 2114;
        id v31 = v10;
        _os_log_impl(&dword_1DA519000, v17, OS_LOG_TYPE_DEFAULT, "Corresponding cloud object (%{public}@) now being created: %{public}@", buf, 0x16u);
      }

      v19 = [[STCloudActivation alloc] initWithContext:v12];
      BOOL v22 = [(STCloudActivation *)v19 objectID];
      [(NSMutableDictionary *)self->_uniqueIdentifierToCloudObjectID setObject:v22 forKeyedSubscript:v10];

      goto LABEL_20;
    }
    if (v18)
    {
      *(_DWORD *)buf = 138543618;
      v29 = v25;
      __int16 v30 = 2114;
      id v31 = v10;
      _os_log_impl(&dword_1DA519000, v17, OS_LOG_TYPE_DEFAULT, "Corresponding cloud object (%{public}@) already exists: %{public}@", buf, 0x16u);
    }

    id v26 = v14;
    v19 = [v12 existingObjectWithID:v16 error:&v26];
    id v20 = v26;

    if (!v19)
    {
      v23 = +[STLog mirroring];
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        -[STMigrationContext updateCloudObjectWithUniqueIdentifier:dictionary:managedObjectContext:error:]((uint64_t)v20, v23);
      }

      if (a6)
      {
        id v14 = v20;
        v19 = 0;
        *a6 = v14;
        goto LABEL_20;
      }
      v19 = 0;
    }
    id v14 = v20;
LABEL_20:
    [(STCloudActivation *)v19 setIdentifier:v10];
    [(STCloudActivation *)v19 setActivationType:1];
    [(STCloudActivation *)v19 setActivationPlist:v13];

    goto LABEL_21;
  }
  v21 = +[STLog mirroring];
  if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
    -[STMigrationContext updateCloudObjectWithUniqueIdentifier:dictionary:managedObjectContext:error:]();
  }

  if (a6)
  {
    id v14 = v14;
    v19 = 0;
    *a6 = v14;
  }
  else
  {
    v19 = 0;
  }
LABEL_21:

  return v19;
}

- (BOOL)deleteLocalObjectWithUniqueIdentifier:(id)a3 managedObjectContext:(id)a4 error:(id *)a5
{
  id v8 = a4;
  uint64_t v9 = [(NSMutableDictionary *)self->_uniqueIdentifierToLocalObjectID objectForKeyedSubscript:a3];
  if (v9)
  {
    id v15 = 0;
    id v10 = [v8 existingObjectWithID:v9 error:&v15];
    id v11 = v15;
    id v12 = v11;
    BOOL v13 = v10 != 0;
    if (v10)
    {
      [v8 deleteObject:v10];
    }
    else if (a5 && v11)
    {
      *a5 = v11;
    }
  }
  else
  {
    BOOL v13 = 1;
  }

  return v13;
}

- (id)deleteCloudObjectWithUniqueIdentifier:(id)a3 managedObjectContext:(id)a4 error:(id *)a5
{
  id v8 = a4;
  uint64_t v9 = [(NSMutableDictionary *)self->_uniqueIdentifierToCloudObjectID objectForKeyedSubscript:a3];
  if (v9)
  {
    id v15 = 0;
    id v10 = [v8 existingObjectWithID:v9 error:&v15];
    id v11 = v15;
    id v12 = v11;
    if (v10)
    {
      [v8 deleteObject:v10];
      BOOL v13 = (void *)MEMORY[0x1E4F1CC38];
    }
    else
    {
      BOOL v13 = 0;
      if (a5 && v11)
      {
        BOOL v13 = 0;
        *a5 = v11;
      }
    }
  }
  else
  {
    BOOL v13 = (void *)MEMORY[0x1E4F1CC28];
  }

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filledObjectIDs, 0);
  objc_storeStrong((id *)&self->_deletedObjectIDs, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifierToLocalObjectID, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifierToCloudObjectID, 0);
}

- (void)updateCloudObjectWithUniqueIdentifier:dictionary:managedObjectContext:error:.cold.1()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_0();
  __int16 v3 = 2114;
  uint64_t v4 = v0;
  _os_log_fault_impl(&dword_1DA519000, v1, OS_LOG_TYPE_FAULT, "Unable to update cloud object with dictionary: %{public}@\n%{public}@", v2, 0x16u);
}

- (void)updateCloudObjectWithUniqueIdentifier:(uint64_t)a1 dictionary:(NSObject *)a2 managedObjectContext:error:.cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 138543618;
  uint64_t v3 = 0;
  __int16 v4 = 2114;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_1DA519000, a2, OS_LOG_TYPE_ERROR, "Unable to retrieve existing cloud object with id (%{public}@): %{public}@", (uint8_t *)&v2, 0x16u);
}

@end