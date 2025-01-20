@interface STUnique
+ (BOOL)_updateScreenTimeSettingsForAppAndWebsiteActivityEnabled:(BOOL)a3 inContext:(id)a4 error:(id *)a5;
+ (BOOL)addHistoryToken:(id)a3 toMetadataForStore:(id)a4 error:(id *)a5;
+ (Class)_internalClassForSerializableClassName:(id)a3;
+ (id)cloudToLocalMapping;
+ (id)historyTokenFromStore:(id)a3;
+ (id)localToCloudMapping;
+ (id)mirroredEntityNames;
- (BOOL)addHistoryToken:(id)a3 toMetadataForStore:(id)a4 error:(id *)a5;
- (BOOL)areLocalChangesInterestingWithError:(id *)a3;
- (BOOL)migrateWithError:(id *)a3;
- (BOOL)migrateWithExportNeeded:(BOOL *)a3 error:(id *)a4;
- (STPersistenceControllerProtocol)persistenceController;
- (STUnique)initWithPersistenceController:(id)a3;
- (id)historyTokenFromStore:(id)a3;
- (void)newResolveConflictsBetweenLocalDeltas:(id)a3 cloudDeltas:(id)a4;
- (void)resolveConflictsBetweenLocalDeltas:(id)a3 cloudDeltas:(id)a4;
- (void)setPersistenceController:(id)a3;
@end

@implementation STUnique

- (STUnique)initWithPersistenceController:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)STUnique;
  v6 = [(STUnique *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_persistenceController, a3);
  }

  return v7;
}

+ (id)localToCloudMapping
{
  if (localToCloudMapping_oneTime != -1) {
    dispatch_once(&localToCloudMapping_oneTime, &__block_literal_global_16);
  }
  v2 = (void *)localToCloudMapping_entityMapping;
  return v2;
}

void __31__STUnique_localToCloudMapping__block_invoke()
{
  v0 = (void *)localToCloudMapping_entityMapping;
  localToCloudMapping_entityMapping = (uint64_t)&unk_1F349EF18;
}

+ (id)cloudToLocalMapping
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31__STUnique_cloudToLocalMapping__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (cloudToLocalMapping_oneTime != -1) {
    dispatch_once(&cloudToLocalMapping_oneTime, block);
  }
  v2 = (void *)cloudToLocalMapping_entityMapping;
  return v2;
}

void __31__STUnique_cloudToLocalMapping__block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v1 = [*(id *)(a1 + 32) localToCloudMapping];
  v2 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v1, "count"));
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v3 = objc_msgSend(v1, "allKeys", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        objc_super v9 = [v1 objectForKeyedSubscript:v8];
        [v2 setObject:v8 forKeyedSubscript:v9];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }

  v10 = (void *)cloudToLocalMapping_entityMapping;
  cloudToLocalMapping_entityMapping = (uint64_t)v2;
}

+ (id)mirroredEntityNames
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31__STUnique_mirroredEntityNames__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (mirroredEntityNames_oneTime != -1) {
    dispatch_once(&mirroredEntityNames_oneTime, block);
  }
  v2 = (void *)mirroredEntityNames_entityNames;
  return v2;
}

void __31__STUnique_mirroredEntityNames__block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v1 = [*(id *)(a1 + 32) localToCloudMapping];
  v2 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", 2 * objc_msgSend(v1, "count"));
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v3 = objc_msgSend(v1, "allKeys", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        [v2 addObject:v8];
        objc_super v9 = [v1 objectForKeyedSubscript:v8];
        [v2 addObject:v9];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }

  v10 = (void *)mirroredEntityNames_entityNames;
  mirroredEntityNames_entityNames = (uint64_t)v2;
}

+ (Class)_internalClassForSerializableClassName:(id)a3
{
  uint64_t v3 = _internalClassForSerializableClassName__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&_internalClassForSerializableClassName__onceToken, &__block_literal_global_11);
  }
  uint64_t v5 = [(id)_internalClassForSerializableClassName__mapping objectForKeyedSubscript:v4];

  uint64_t v6 = NSClassFromString(v5);

  return (Class)v6;
}

void __51__STUnique__internalClassForSerializableClassName___block_invoke()
{
  v12[9] = *MEMORY[0x1E4F143B8];
  v0 = +[STTestSyncableObject serializableClassName];
  v11[0] = v0;
  v12[0] = @"STTestSyncableObject";
  v1 = +[STBlueprint serializableClassName];
  v11[1] = v1;
  v12[1] = @"STBlueprint";
  v2 = +[STFamilyOrganizationSettings serializableClassName];
  v11[2] = v2;
  v12[2] = @"STFamilyOrganizationSettings";
  uint64_t v3 = +[STiCloudOrganizationSettings serializableClassName];
  v11[3] = v3;
  v12[3] = @"STiCloudOrganizationSettings";
  id v4 = +[STUserDeviceState serializableClassName];
  v11[4] = v4;
  v12[4] = @"STUserDeviceState";
  uint64_t v5 = +[STInstalledApp serializableClassName];
  v11[5] = v5;
  v12[5] = @"STInstalledApp";
  uint64_t v6 = +[STLocalOrganization serializableClassName];
  v11[6] = v6;
  v12[6] = @"STLocalOrganization";
  v7 = +[STiCloudOrganization serializableClassName];
  v11[7] = v7;
  v12[7] = @"STiCloudOrganization";
  uint64_t v8 = +[STFamilyOrganization serializableClassName];
  v11[8] = v8;
  v12[8] = @"STFamilyOrganization";
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:9];
  v10 = (void *)_internalClassForSerializableClassName__mapping;
  _internalClassForSerializableClassName__mapping = v9;
}

- (BOOL)areLocalChangesInterestingWithError:(id *)a3
{
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 0;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__12;
  v21 = __Block_byref_object_dispose__12;
  id v22 = 0;
  uint64_t v5 = [(STUnique *)self persistenceController];
  uint64_t v6 = [v5 localStore];
  if (v6)
  {
    v7 = (void *)[v5 newBackgroundContext];
    [v7 setName:@"Analyze"];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __48__STUnique_areLocalChangesInterestingWithError___block_invoke;
    v12[3] = &unk_1E6BC7D08;
    v12[4] = self;
    id v13 = v6;
    id v8 = v7;
    id v14 = v8;
    v15 = &v17;
    uint64_t v16 = &v23;
    [v8 performBlockAndWait:v12];
    if (a3)
    {
      uint64_t v9 = (void *)v18[5];
      if (v9) {
        *a3 = v9;
      }
    }
    BOOL v10 = *((unsigned char *)v24 + 24) != 0;
  }
  else if (a3)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:@"STErrorDomain" code:6 userInfo:0];
    BOOL v10 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v10 = 0;
  }

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);
  return v10;
}

void __48__STUnique_areLocalChangesInterestingWithError___block_invoke(uint64_t a1)
{
  v2 = objc_opt_new();
  uint64_t v3 = [*(id *)(a1 + 32) historyTokenFromStore:*(void *)(a1 + 40)];
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
  id obj = *(id *)(v6 + 40);
  id v15 = 0;
  v7 = [v2 deltasForStore:v4 inManagedObjectContext:v5 sinceToken:v3 ignoreAuthor:@"STUnique" finalToken:&v15 error:&obj];
  id v8 = v15;
  objc_storeStrong((id *)(v6 + 40), obj);
  if ([v7 count])
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
  }
  else if (v8)
  {
    uint64_t v9 = *(void **)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 40);
    uint64_t v11 = *(void *)(*(void *)(a1 + 56) + 8);
    id v13 = *(id *)(v11 + 40);
    [v9 addHistoryToken:v8 toMetadataForStore:v10 error:&v13];
    objc_storeStrong((id *)(v11 + 40), v13);
    long long v12 = +[STLog mirroring];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      __48__STUnique_areLocalChangesInterestingWithError___block_invoke_cold_1();
    }
  }
}

- (BOOL)migrateWithExportNeeded:(BOOL *)a3 error:(id *)a4
{
  id v10 = 0;
  BOOL v6 = [(STUnique *)self migrateWithError:&v10];
  id v7 = v10;
  id v8 = v7;
  if (a3) {
    *a3 = v6;
  }
  if (a4) {
    *a4 = v7;
  }

  return v8 == 0;
}

- (BOOL)migrateWithError:(id *)a3
{
  uint64_t v5 = +[STLog mirroring];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[STUnique migrateWithError:](v5);
  }

  uint64_t v34 = 0;
  v35 = &v34;
  uint64_t v36 = 0x2020000000;
  char v37 = 0;
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x2020000000;
  char v33 = 1;
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__12;
  v28 = __Block_byref_object_dispose__12;
  id v29 = 0;
  BOOL v6 = [(STUnique *)self persistenceController];
  id v7 = [v6 localStore];
  uint64_t v8 = [v6 cloudStore];
  uint64_t v9 = (void *)v8;
  if (v7 && v8)
  {
    id v10 = (void *)[v6 newBackgroundContext];
    [v10 setTransactionAuthor:@"STUnique"];
    [v10 setName:@"Migrate"];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __29__STUnique_migrateWithError___block_invoke;
    v16[3] = &unk_1E6BC7D30;
    id v11 = v10;
    id v17 = v11;
    id v18 = v9;
    id v19 = v7;
    v20 = self;
    v21 = &v34;
    id v22 = &v30;
    uint64_t v23 = &v24;
    [v11 performBlockAndWait:v16];
    if (a3)
    {
      if (!*((unsigned char *)v31 + 24))
      {
        long long v12 = (void *)v25[5];
        if (v12) {
          *a3 = v12;
        }
      }
    }
    id v13 = +[STLog mirroring];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      -[STUnique migrateWithError:](v13);
    }

    BOOL v14 = *((unsigned char *)v35 + 24) != 0;
  }
  else if (a3)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:@"STErrorDomain" code:6 userInfo:0];
    BOOL v14 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v14 = 0;
  }

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v34, 8);
  return v14;
}

void __29__STUnique_migrateWithError___block_invoke(uint64_t a1)
{
  uint64_t v167 = *MEMORY[0x1E4F143B8];
  v2 = objc_opt_new();
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  id v155 = 0;
  v125 = v2;
  int v6 = [v2 initializeCachesWithManagedObjectContext:v3 withCloudStore:v4 andLocalStore:v5 error:&v155];
  id v7 = (objc_class *)v155;
  uint64_t v8 = v7;
  unint64_t v9 = 0x1E6BC6000uLL;
  if (!v6)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 0;
    if (!v7) {
      goto LABEL_106;
    }
    goto LABEL_103;
  }
  id v10 = objc_opt_new();
  id v11 = [*(id *)(a1 + 56) historyTokenFromStore:*(void *)(a1 + 48)];
  long long v12 = [*(id *)(a1 + 56) historyTokenFromStore:*(void *)(a1 + 40)];
  id v13 = +[STLog mirroring];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    __29__STUnique_migrateWithError___block_invoke_cold_8();
  }

  BOOL v14 = +[STLog mirroring];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    __29__STUnique_migrateWithError___block_invoke_cold_7();
  }

  uint64_t v15 = *(void *)(a1 + 48);
  uint64_t v16 = *(void *)(a1 + 32);
  id v154 = 0;
  id v17 = v8;
  v153 = v8;
  id v18 = [v10 deltasForStore:v15 inManagedObjectContext:v16 sinceToken:v11 ignoreAuthor:@"STUnique" finalToken:&v154 error:&v153];
  id v117 = v154;
  id v19 = v153;

  uint64_t v21 = *(void *)(a1 + 32);
  uint64_t v20 = *(void *)(a1 + 40);
  v151 = v19;
  id v152 = 0;
  id v22 = [v10 deltasForStore:v20 inManagedObjectContext:v21 sinceToken:v12 ignoreAuthor:@"STUnique" finalToken:&v152 error:&v151];
  id v116 = v152;
  v126 = v151;

  v118 = v18;
  if ([v18 count] && objc_msgSend(v22, "count")) {
    [*(id *)(a1 + 56) newResolveConflictsBetweenLocalDeltas:v18 cloudDeltas:v22];
  }
  uint64_t v121 = a1;
  v113 = v10;
  v115 = v22;
  v109 = v12;
  v111 = v11;
  if ([v22 count])
  {
    v119 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v22, "count"));
    uint64_t v23 = +[STLog mirroring];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v24 = [v22 count];
      *(_DWORD *)buf = 134217984;
      v161 = (objc_class *)v24;
      _os_log_impl(&dword_1DA519000, v23, OS_LOG_TYPE_DEFAULT, "Detected %lu cloud changes", buf, 0xCu);
    }

    long long v149 = 0u;
    long long v150 = 0u;
    long long v147 = 0u;
    long long v148 = 0u;
    uint64_t v25 = [v22 allValues];
    uint64_t v26 = [v25 countByEnumeratingWithState:&v147 objects:v166 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v148;
      v120 = v25;
      uint64_t v122 = *(void *)v148;
      do
      {
        for (uint64_t i = 0; i != v27; ++i)
        {
          if (*(void *)v148 != v28) {
            objc_enumerationMutation(v25);
          }
          uint64_t v30 = *(void **)(*((void *)&v147 + 1) + 8 * i);
          if (objc_msgSend(v30, "changeType", v109, v111, v113) != 2)
          {
            v35 = [v30 dictionary];
            char v33 = [v35 objectForKeyedSubscript:@"class"];

            if (v33)
            {
              uint64_t v36 = +[STUnique _internalClassForSerializableClassName:v33];
              if (v36)
              {
                char v37 = v36;
                v38 = [v30 dictionary];
                uint64_t v39 = *(void *)(a1 + 32);
                v143 = v126;
                v40 = [(objc_class *)v37 fetchOrCreateWithDictionaryRepresentation:v38 inContext:v39 error:&v143];
                v41 = v143;

                if (v38 && v40)
                {
                  v165[0] = v40;
                  v164[0] = @"object";
                  v164[1] = @"dictionary";
                  v42 = [v30 dictionary];
                  v165[1] = v42;
                  v43 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v165 forKeys:v164 count:2];
                  [v119 addObject:v43];

                  uint64_t v25 = v120;
                }
                else
                {
                  v42 = +[STLog mirroring];
                  if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138543362;
                    v161 = v41;
                    _os_log_error_impl(&dword_1DA519000, v42, OS_LOG_TYPE_ERROR, "Could not find/create local object: %{public}@", buf, 0xCu);
                  }
                }

                v44 = +[STLog mirroring];
                if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
                {
                  v45 = [v30 uniqueIdentifier];
                  *(_DWORD *)buf = 138543618;
                  v161 = v37;
                  __int16 v162 = 2114;
                  id v163 = v45;
                  _os_log_impl(&dword_1DA519000, v44, OS_LOG_TYPE_DEFAULT, "Mirroring change: Updated local object (%{public}@) %{public}@", buf, 0x16u);

                  uint64_t v25 = v120;
                }

                unint64_t v9 = 0x1E6BC6000;
                goto LABEL_36;
              }
              v38 = [*(id *)(v9 + 2760) mirroring];
              if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v161 = v33;
                _os_log_error_impl(&dword_1DA519000, v38, OS_LOG_TYPE_ERROR, "External to internal mapping missing for: %@", buf, 0xCu);
              }
            }
            else
            {
              v38 = [*(id *)(v9 + 2760) mirroring];
              if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
                __29__STUnique_migrateWithError___block_invoke_cold_6(&v144, v145, v38);
              }
            }
            v41 = v126;
LABEL_36:

            v126 = v41;
            a1 = v121;
            uint64_t v28 = v122;
            goto LABEL_37;
          }
          v31 = [*(id *)(v9 + 2760) mirroring];
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v32 = [v30 uniqueIdentifier];
            *(_DWORD *)buf = 138543362;
            v161 = v32;
            _os_log_impl(&dword_1DA519000, v31, OS_LOG_TYPE_DEFAULT, "Mirroring change: Deleted local copy of %{public}@", buf, 0xCu);
          }
          char v33 = [v30 uniqueIdentifier];
          uint64_t v34 = *(void *)(a1 + 32);
          uint64_t v146 = 0;
          [v125 deleteLocalObjectWithUniqueIdentifier:v33 managedObjectContext:v34 error:&v146];
LABEL_37:
        }
        uint64_t v27 = [v25 countByEnumeratingWithState:&v147 objects:v166 count:16];
      }
      while (v27);
    }

    long long v141 = 0u;
    long long v142 = 0u;
    long long v139 = 0u;
    long long v140 = 0u;
    id v46 = v119;
    uint64_t v47 = [v46 countByEnumeratingWithState:&v139 objects:v159 count:16];
    if (v47)
    {
      uint64_t v48 = v47;
      uint64_t v49 = *(void *)v140;
      v50 = @"dictionary";
      do
      {
        uint64_t v51 = 0;
        uint64_t v123 = v48;
        do
        {
          if (*(void *)v140 != v49) {
            objc_enumerationMutation(v46);
          }
          v52 = *(void **)(*((void *)&v139 + 1) + 8 * v51);
          v53 = objc_msgSend(v52, "objectForKeyedSubscript:", @"object", v109, v111, v113);
          v54 = [v52 objectForKeyedSubscript:v50];
          [v53 updateWithDictionaryRepresentation:v54];
          if (_os_feature_enabled_impl())
          {
            v55 = v50;
            v56 = [v54 objectForKeyedSubscript:@"class"];
            if ([(objc_class *)+[STUnique _internalClassForSerializableClassName:v56] isEqual:objc_opt_class()])
            {
              v57 = [v54 objectForKeyedSubscript:@"isAppAndWebsiteActivityEnabled"];
              v58 = v57;
              if (v57)
              {
                id v59 = v46;
                uint64_t v60 = [v57 BOOLValue];
                uint64_t v61 = *(void *)(v121 + 32);
                id v138 = 0;
                BOOL v62 = +[STUnique _updateScreenTimeSettingsForAppAndWebsiteActivityEnabled:v60 inContext:v61 error:&v138];
                v63 = (objc_class *)v138;
                if (!v62)
                {
                  v64 = +[STLog mirroring];
                  if (os_log_type_enabled(v64, OS_LOG_TYPE_FAULT))
                  {
                    *(_DWORD *)buf = 138543362;
                    v161 = v63;
                    _os_log_fault_impl(&dword_1DA519000, v64, OS_LOG_TYPE_FAULT, "Failed to update Screen Time settings: %{public}@", buf, 0xCu);
                  }
                }
                id v46 = v59;
              }
            }
            v50 = v55;
            uint64_t v48 = v123;
          }

          ++v51;
        }
        while (v48 != v51);
        uint64_t v48 = [v46 countByEnumeratingWithState:&v139 objects:v159 count:16];
      }
      while (v48);
    }

    a1 = v121;
    id v11 = v111;
    id v10 = v113;
    long long v12 = v109;
  }
  if (objc_msgSend(v118, "count", v109, v111, v113))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
    v65 = +[STLog mirroring];
    if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v66 = [v118 count];
      *(_DWORD *)buf = 134217984;
      v161 = (objc_class *)v66;
      _os_log_impl(&dword_1DA519000, v65, OS_LOG_TYPE_DEFAULT, "Detected %lu local changes", buf, 0xCu);
    }

    long long v136 = 0u;
    long long v137 = 0u;
    long long v134 = 0u;
    long long v135 = 0u;
    v67 = [v118 allValues];
    uint64_t v124 = [v67 countByEnumeratingWithState:&v134 objects:v158 count:16];
    if (v124)
    {
      uint64_t v68 = *(void *)v135;
      do
      {
        uint64_t v69 = 0;
        do
        {
          if (*(void *)v135 != v68) {
            objc_enumerationMutation(v67);
          }
          v70 = *(void **)(*((void *)&v134 + 1) + 8 * v69);
          if ([v70 changeType] == 2)
          {
            v71 = [v70 uniqueIdentifier];
            uint64_t v72 = *(void *)(a1 + 32);
            id v133 = 0;
            v73 = [v125 deleteCloudObjectWithUniqueIdentifier:v71 managedObjectContext:v72 error:&v133];
            id v74 = v133;

            if (v73)
            {
              int v75 = [v73 BOOLValue];
              v76 = +[STLog mirroring];
              v77 = v76;
              if (v75)
              {
                if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
                {
                  v78 = [v70 uniqueIdentifier];
                  *(_DWORD *)buf = 138543362;
                  v161 = v78;
                  _os_log_impl(&dword_1DA519000, v77, OS_LOG_TYPE_DEFAULT, "Mirroring change: Deleted cloud copy of %{public}@", buf, 0xCu);
                  goto LABEL_70;
                }
              }
              else if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
              {
                __29__STUnique_migrateWithError___block_invoke_cold_4(v156, v70, &v157, v77);
              }
            }
            else
            {
              v77 = +[STLog mirroring];
              if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
              {
                v78 = [v70 uniqueIdentifier];
                *(_DWORD *)buf = 138543618;
                v161 = v78;
                __int16 v162 = 2114;
                id v163 = v74;
                _os_log_error_impl(&dword_1DA519000, v77, OS_LOG_TYPE_ERROR, "Mirroring change: Failed to delete cloud copy of %{public}@: %{public}@", buf, 0x16u);
LABEL_70:
              }
            }

            goto LABEL_83;
          }
          v79 = [v70 dictionary];
          id v74 = [v79 objectForKeyedSubscript:@"class"];

          if (v74)
          {
            v80 = +[STUnique _internalClassForSerializableClassName:v74];
            if (v80)
            {
              v81 = v80;
              v82 = [v70 uniqueIdentifier];
              uint64_t v83 = [v70 dictionary];
              uint64_t v84 = a1;
              v85 = (void *)v83;
              uint64_t v86 = *(void *)(v84 + 32);
              v130 = v126;
              id v87 = (id)[v125 updateCloudObjectWithUniqueIdentifier:v82 dictionary:v83 managedObjectContext:v86 error:&v130];
              v88 = v130;

              v73 = +[STLog mirroring];
              if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
              {
                v89 = [v70 uniqueIdentifier];
                *(_DWORD *)buf = 138543618;
                v161 = v81;
                __int16 v162 = 2114;
                id v163 = v89;
                _os_log_impl(&dword_1DA519000, v73, OS_LOG_TYPE_DEFAULT, "Mirroring change: Updated cloud object (%{public}@) %{public}@", buf, 0x16u);
              }
              v126 = v88;
              a1 = v121;
            }
            else
            {
              v73 = +[STLog mirroring];
              if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v161 = (objc_class *)v74;
                _os_log_error_impl(&dword_1DA519000, v73, OS_LOG_TYPE_ERROR, "External to internal mapping missing for: %@", buf, 0xCu);
              }
            }
          }
          else
          {
            v73 = +[STLog mirroring];
            if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR)) {
              __29__STUnique_migrateWithError___block_invoke_cold_5(&v131, v132, v73);
            }
          }
LABEL_83:

          ++v69;
        }
        while (v124 != v69);
        uint64_t v90 = [v67 countByEnumeratingWithState:&v134 objects:v158 count:16];
        uint64_t v124 = v90;
      }
      while (v90);
    }

    id v11 = v112;
    id v10 = v114;
    long long v12 = v110;
  }
  v91 = v115;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24))
  {
    if (v117)
    {
      uint64_t v93 = *(void *)(a1 + 48);
      v92 = *(void **)(a1 + 56);
      v129 = v126;
      [v92 addHistoryToken:v117 toMetadataForStore:v93 error:&v129];
      v94 = v129;

      v95 = +[STLog mirroring];
      if (os_log_type_enabled(v95, OS_LOG_TYPE_DEBUG)) {
        __48__STUnique_areLocalChangesInterestingWithError___block_invoke_cold_1();
      }

      v126 = v94;
    }
    if (v116)
    {
      v96 = *(void **)(a1 + 56);
      uint64_t v97 = *(void *)(a1 + 40);
      v128 = v126;
      [v96 addHistoryToken:v116 toMetadataForStore:v97 error:&v128];
      v98 = v128;

      v99 = +[STLog mirroring];
      if (os_log_type_enabled(v99, OS_LOG_TYPE_DEBUG)) {
        __29__STUnique_migrateWithError___block_invoke_cold_2();
      }

      v100 = v98;
    }
    else
    {
      v100 = v126;
    }
    v101 = [*(id *)(a1 + 56) persistenceController];
    uint64_t v102 = *(void *)(a1 + 32);
    v127 = v100;
    char v103 = [v101 saveContext:v102 error:&v127];
    v104 = v127;

    *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = v103;
    v126 = v104;
    v91 = v115;
  }

  uint64_t v8 = v126;
  if (v126)
  {
LABEL_103:
    v105 = +[STLog mirroring];
    if (os_log_type_enabled(v105, OS_LOG_TYPE_FAULT)) {
      __29__STUnique_migrateWithError___block_invoke_cold_1();
    }

    uint64_t v106 = STXPCSafeErrorFromCoreDataError(v8, 6);
    uint64_t v107 = *(void *)(*(void *)(a1 + 80) + 8);
    v108 = *(void **)(v107 + 40);
    *(void *)(v107 + 40) = v106;
  }
LABEL_106:
}

- (void)newResolveConflictsBetweenLocalDeltas:(id)a3 cloudDeltas:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v7 = [v5 allKeys];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v27 count:16];
  if (v8)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(void *)v22;
    *(void *)&long long v9 = 138543362;
    long long v20 = v9;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v7);
        }
        uint64_t v13 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        BOOL v14 = objc_msgSend(v5, "objectForKeyedSubscript:", v13, v20);
        uint64_t v15 = [v6 objectForKeyedSubscript:v13];
        uint64_t v16 = v15;
        if (v15)
        {
          if ([v15 changeType] == 1)
          {
            if ([v14 changeType] == 1)
            {
              [v5 removeObjectForKey:v13];
              id v17 = +[STLog mirroring];
              if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = v20;
                uint64_t v26 = v13;
                id v18 = v17;
                id v19 = "Conflict: remote change and local change: %{public}@";
                goto LABEL_15;
              }
LABEL_16:

              goto LABEL_17;
            }
            [v6 removeObjectForKey:v13];
            id v17 = +[STLog mirroring];
            if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_16;
            }
            *(_DWORD *)buf = v20;
            uint64_t v26 = v13;
            id v18 = v17;
            id v19 = "Conflict: remote change and local delete: %{public}@";
          }
          else
          {
            [v5 removeObjectForKey:v13];
            id v17 = +[STLog mirroring];
            if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_16;
            }
            *(_DWORD *)buf = v20;
            uint64_t v26 = v13;
            id v18 = v17;
            id v19 = "Conflict: remote delete: %{public}@";
          }
LABEL_15:
          _os_log_impl(&dword_1DA519000, v18, OS_LOG_TYPE_DEFAULT, v19, buf, 0xCu);
          goto LABEL_16;
        }
LABEL_17:
      }
      uint64_t v10 = [v7 countByEnumeratingWithState:&v21 objects:v27 count:16];
    }
    while (v10);
  }
}

- (void)resolveConflictsBetweenLocalDeltas:(id)a3 cloudDeltas:(id)a4
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  id v7 = [v5 allKeys];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v54 objects:v62 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v55;
    id v36 = v6;
    id v37 = v5;
    uint64_t v34 = *(void *)v55;
    v35 = v7;
    do
    {
      uint64_t v11 = 0;
      uint64_t v38 = v9;
      do
      {
        if (*(void *)v55 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v54 + 1) + 8 * v11);
        uint64_t v13 = [v5 objectForKeyedSubscript:v12];
        BOOL v14 = [v6 objectForKeyedSubscript:v12];
        if (v14)
        {
          v45 = v13;
          uint64_t v15 = v12;
          uint64_t v16 = v14;
          uint64_t v39 = v11;
          v40 = v14;
          if ([v14 changeType] == 1)
          {
            if ([v13 changeType] == 1)
            {
              id v17 = +[STLog mirroring];
              if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543362;
                uint64_t v61 = v15;
                id v18 = v17;
                id v19 = "Conflict: remote insert and local insert: %{public}@";
                goto LABEL_44;
              }
LABEL_45:
              uint64_t v13 = v45;
LABEL_46:

              uint64_t v11 = v39;
              BOOL v14 = v40;
              goto LABEL_47;
            }
            if ([v13 changeType] == 2)
            {
              [v13 inserted];
              id v17 = +[STLog mirroring];
              if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543362;
                uint64_t v61 = v15;
                _os_log_impl(&dword_1DA519000, v17, OS_LOG_TYPE_DEFAULT, "Conflict: remote insert and local update: %{public}@", buf, 0xCu);
              }
              goto LABEL_46;
            }
            [v6 removeObjectForKey:v15];
            id v17 = +[STLog mirroring];
            if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_45;
            }
            *(_DWORD *)buf = 138543362;
            uint64_t v61 = v15;
            id v18 = v17;
            id v19 = "Conflict: remote insert and local delete: %{public}@";
          }
          else if ([v16 changeType] == 2)
          {
            uint64_t v20 = v15;
            if ([v13 changeType] == 1)
            {
              id v17 = +[STLog mirroring];
              if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_45;
              }
              *(_DWORD *)buf = 138543362;
              uint64_t v61 = v15;
              id v18 = v17;
              id v19 = "Conflict: remote update and local insert: %{public}@";
            }
            else
            {
              if ([v13 changeType] == 2)
              {
                long long v52 = 0u;
                long long v53 = 0u;
                long long v50 = 0u;
                long long v51 = 0u;
                id obj = [v40 updatedProperties];
                uint64_t v43 = [obj countByEnumeratingWithState:&v50 objects:v59 count:16];
                if (v43)
                {
                  uint64_t v42 = *(void *)v51;
                  do
                  {
                    uint64_t v21 = 0;
                    do
                    {
                      if (*(void *)v51 != v42) {
                        objc_enumerationMutation(obj);
                      }
                      uint64_t v44 = v21;
                      long long v22 = *(void **)(*((void *)&v50 + 1) + 8 * v21);
                      long long v46 = 0u;
                      long long v47 = 0u;
                      long long v48 = 0u;
                      long long v49 = 0u;
                      long long v23 = [v45 updatedProperties];
                      long long v24 = (void *)[v23 copy];

                      uint64_t v25 = [v24 countByEnumeratingWithState:&v46 objects:v58 count:16];
                      if (v25)
                      {
                        uint64_t v26 = v25;
                        uint64_t v27 = *(void *)v47;
                        do
                        {
                          for (uint64_t i = 0; i != v26; ++i)
                          {
                            if (*(void *)v47 != v27) {
                              objc_enumerationMutation(v24);
                            }
                            id v29 = *(void **)(*((void *)&v46 + 1) + 8 * i);
                            uint64_t v30 = [v22 name];
                            v31 = [v29 name];
                            int v32 = [v30 isEqualToString:v31];

                            if (v32)
                            {
                              char v33 = [v29 name];
                              [v45 removePropertyWithName:v33];
                            }
                          }
                          uint64_t v20 = v15;
                          uint64_t v26 = [v24 countByEnumeratingWithState:&v46 objects:v58 count:16];
                        }
                        while (v26);
                      }

                      uint64_t v21 = v44 + 1;
                    }
                    while (v44 + 1 != v43);
                    uint64_t v43 = [obj countByEnumeratingWithState:&v50 objects:v59 count:16];
                  }
                  while (v43);
                }

                id v17 = +[STLog mirroring];
                if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138543362;
                  uint64_t v61 = v20;
                  _os_log_impl(&dword_1DA519000, v17, OS_LOG_TYPE_DEFAULT, "Conflict: remote update and local update: %{public}@", buf, 0xCu);
                }
                id v6 = v36;
                id v5 = v37;
                uint64_t v10 = v34;
                id v7 = v35;
                uint64_t v9 = v38;
                goto LABEL_45;
              }
              [v6 removeObjectForKey:v15];
              id v17 = +[STLog mirroring];
              if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_45;
              }
              *(_DWORD *)buf = 138543362;
              uint64_t v61 = v15;
              id v18 = v17;
              id v19 = "Conflict: remote update and local delete: %{public}@";
            }
          }
          else
          {
            [v5 removeObjectForKey:v15];
            id v17 = +[STLog mirroring];
            if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_45;
            }
            *(_DWORD *)buf = 138543362;
            uint64_t v61 = v15;
            id v18 = v17;
            id v19 = "Conflict: remote delete: %{public}@";
          }
LABEL_44:
          _os_log_impl(&dword_1DA519000, v18, OS_LOG_TYPE_DEFAULT, v19, buf, 0xCu);
          goto LABEL_45;
        }
LABEL_47:

        ++v11;
      }
      while (v11 != v9);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v54 objects:v62 count:16];
    }
    while (v9);
  }
}

- (id)historyTokenFromStore:(id)a3
{
  return +[STUnique historyTokenFromStore:a3];
}

+ (id)historyTokenFromStore:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 metadata];
  id v5 = [v4 objectForKeyedSubscript:@"STUnique"];

  if (v5)
  {
    id v10 = 0;
    id v6 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v5 error:&v10];
    id v7 = v10;
    if (!v6)
    {
      uint64_t v8 = +[STLog mirroring];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        +[STUnique historyTokenFromStore:v8];
      }
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (BOOL)addHistoryToken:(id)a3 toMetadataForStore:(id)a4 error:(id *)a5
{
  return +[STUnique addHistoryToken:a3 toMetadataForStore:a4 error:a5];
}

+ (BOOL)addHistoryToken:(id)a3 toMetadataForStore:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [v8 metadata];
  id v10 = (void *)[v9 mutableCopy];

  if (!v7)
  {
    [v10 removeObjectForKey:@"STUnique"];
    goto LABEL_5;
  }
  uint64_t v11 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v7 requiringSecureCoding:1 error:a5];
  if (v11)
  {
    [v10 setObject:v11 forKeyedSubscript:@"STUnique"];

LABEL_5:
    [v8 setMetadata:v10];
    LOBYTE(v11) = 1;
  }

  return (char)v11;
}

+ (BOOL)_updateScreenTimeSettingsForAppAndWebsiteActivityEnabled:(BOOL)a3 inContext:(id)a4 error:(id *)a5
{
  BOOL v6 = a3;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v24 = 0;
  id v8 = +[STScreenTimeSettings fetchScreenTimeSettingsInContext:v7 error:&v24];
  id v9 = v24;
  id v10 = v9;
  if (v8)
  {
    id v23 = v9;
    uint64_t v11 = +[STCoreUser fetchLocalUserInContext:v7 error:&v23];
    id v12 = v23;

    BOOL v13 = v11 != 0;
    if (v11)
    {
      BOOL v14 = [v11 unmodeledManagingOrganizationSettings];
      uint64_t v15 = [v11 cloudSettings];

      if (v14 == v15)
      {
        if ([v8 screenTimeEnabled] != v6)
        {
          id v19 = +[STLog mirroring];
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v20 = @"NO";
            if (v6) {
              uint64_t v20 = @"YES";
            }
            uint64_t v21 = v20;
            *(_DWORD *)buf = 138543362;
            uint64_t v26 = v21;
            _os_log_impl(&dword_1DA519000, v19, OS_LOG_TYPE_DEFAULT, "Updating ScreenTimeEnabled setting to: %{public}@", buf, 0xCu);
          }
          [v8 setScreenTimeEnabled:v6];
        }
      }
      else
      {
        uint64_t v16 = +[STLog mirroring];
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1DA519000, v16, OS_LOG_TYPE_DEFAULT, "User is not using iCloud organization settings. Will not update Screen Time Settings based on iCloud organization settings.", buf, 2u);
        }
      }
    }
    else if (a5)
    {
      id v18 = +[STLog mirroring];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        +[STUnique _updateScreenTimeSettingsForAppAndWebsiteActivityEnabled:inContext:error:]();
      }

      *a5 = v12;
    }
  }
  else if (a5)
  {
    id v17 = +[STLog mirroring];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      +[STUnique _updateScreenTimeSettingsForAppAndWebsiteActivityEnabled:inContext:error:]();
    }

    id v12 = v10;
    BOOL v13 = 0;
    *a5 = v12;
  }
  else
  {
    BOOL v13 = 0;
    id v12 = v9;
  }

  return v13;
}

- (STPersistenceControllerProtocol)persistenceController
{
  return self->_persistenceController;
}

- (void)setPersistenceController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistenceController, 0);
  objc_storeStrong((id *)&self->_migratedToken, 0);
}

void __48__STUnique_areLocalChangesInterestingWithError___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3_0(&dword_1DA519000, v0, v1, "Saved token - local: %{public}@", v2, v3, v4, v5, v6);
}

- (void)migrateWithError:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_1DA519000, log, OS_LOG_TYPE_DEBUG, "Mirroring migration end", v1, 2u);
}

- (void)migrateWithError:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_1DA519000, log, OS_LOG_TYPE_DEBUG, "Mirroring migration start", v1, 2u);
}

void __29__STUnique_migrateWithError___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_0();
  _os_log_fault_impl(&dword_1DA519000, v0, OS_LOG_TYPE_FAULT, "Error occurred during mirroring migration: %{public}@", v1, 0xCu);
}

void __29__STUnique_migrateWithError___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3_0(&dword_1DA519000, v0, v1, "Saved token - cloud: %{public}@", v2, v3, v4, v5, v6);
}

void __29__STUnique_migrateWithError___block_invoke_cold_4(uint8_t *a1, void *a2, void *a3, NSObject *a4)
{
  id v7 = [a2 uniqueIdentifier];
  *(_DWORD *)a1 = 138543362;
  *a3 = v7;
  _os_log_error_impl(&dword_1DA519000, a4, OS_LOG_TYPE_ERROR, "Mirroring change: Unable to delete cloud copy of %{public}@ : Missing cloud object", a1, 0xCu);
}

void __29__STUnique_migrateWithError___block_invoke_cold_5(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_1DA519000, log, OS_LOG_TYPE_ERROR, "Local delta missing class key", buf, 2u);
}

void __29__STUnique_migrateWithError___block_invoke_cold_6(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_1DA519000, log, OS_LOG_TYPE_ERROR, "Cloud delta missing class key", buf, 2u);
}

void __29__STUnique_migrateWithError___block_invoke_cold_7()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3_0(&dword_1DA519000, v0, v1, "Previous token - cloud: %@", v2, v3, v4, v5, v6);
}

void __29__STUnique_migrateWithError___block_invoke_cold_8()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3_0(&dword_1DA519000, v0, v1, "Previous token - local: %@", v2, v3, v4, v5, v6);
}

+ (void)historyTokenFromStore:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v3 = 138543874;
  uint64_t v4 = @"STUnique";
  __int16 v5 = 2114;
  uint64_t v6 = a1;
  __int16 v7 = 2114;
  uint64_t v8 = a2;
  _os_log_error_impl(&dword_1DA519000, log, OS_LOG_TYPE_ERROR, "Failed to deserialize history token for '%{public}@' in store: %{public}@\n%{public}@", (uint8_t *)&v3, 0x20u);
}

+ (void)_updateScreenTimeSettingsForAppAndWebsiteActivityEnabled:inContext:error:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_1DA519000, v0, OS_LOG_TYPE_ERROR, "Failed to find Screen Time Settings: %{public}@", v1, 0xCu);
}

+ (void)_updateScreenTimeSettingsForAppAndWebsiteActivityEnabled:inContext:error:.cold.2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_1DA519000, v0, OS_LOG_TYPE_ERROR, "Failed to fetch local user: %{public}@", v1, 0xCu);
}

@end