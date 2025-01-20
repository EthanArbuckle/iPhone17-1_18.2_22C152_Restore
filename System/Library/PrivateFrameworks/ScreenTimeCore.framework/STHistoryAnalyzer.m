@interface STHistoryAnalyzer
+ (BOOL)_changedObjectBelongsToFamily:(id)a3 context:(id)a4;
- (BOOL)_isChangeInteresting:(id)a3;
- (NSPersistentHistoryToken)finalToken;
- (id)deltasForStore:(id)a3 inManagedObjectContext:(id)a4 sinceToken:(id)a5 ignoreAuthor:(id)a6 finalToken:(id *)a7 error:(id *)a8;
@end

@implementation STHistoryAnalyzer

- (id)deltasForStore:(id)a3 inManagedObjectContext:(id)a4 sinceToken:(id)a5 ignoreAuthor:(id)a6 finalToken:(id *)a7 error:(id *)a8
{
  v88 = a7;
  v132[1] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v94 = a6;
  uint64_t v14 = objc_opt_new();
  v15 = +[STLog mirroring];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    -[STHistoryAnalyzer deltasForStore:inManagedObjectContext:sinceToken:ignoreAuthor:finalToken:error:].cold.8(v11, (uint64_t)v13, v15);
  }

  v16 = [MEMORY[0x1E4F1C160] fetchHistoryAfterToken:v13];
  v132[0] = v11;
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v132 count:1];
  [v16 setAffectedStores:v17];

  [v16 setResultType:5];
  id v120 = 0;
  v91 = v16;
  v18 = [v12 executeRequest:v16 error:&v120];
  id v19 = v120;
  id v101 = (id)v14;
  v100 = v11;
  v102 = v12;
  v92 = v13;
  v89 = v19;
  v90 = v18;
  if (v18)
  {
    v20 = [v18 result];
    v21 = +[STLog mirroring];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
      -[STHistoryAnalyzer deltasForStore:inManagedObjectContext:sinceToken:ignoreAuthor:finalToken:error:].cold.7(v20, v21);
    }

    long long v118 = 0u;
    long long v119 = 0u;
    long long v116 = 0u;
    long long v117 = 0u;
    id obj = v20;
    uint64_t v97 = [obj countByEnumeratingWithState:&v116 objects:v131 count:16];
    id v22 = 0;
    id v23 = 0;
    if (v97)
    {
      uint64_t v96 = *(void *)v117;
      v24 = v94;
      while (1)
      {
        for (uint64_t i = 0; i != v97; ++i)
        {
          if (*(void *)v117 != v96) {
            objc_enumerationMutation(obj);
          }
          v106 = *(void **)(*((void *)&v116 + 1) + 8 * i);
          v26 = (void *)MEMORY[0x1E01715C0]();
          v27 = +[STLog mirroring];
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
          {
            v82 = [v106 author];
            v83 = [v106 token];
            *(_DWORD *)buf = 138543618;
            v123 = v82;
            __int16 v124 = 2114;
            v125 = v83;
            _os_log_debug_impl(&dword_1DA519000, v27, OS_LOG_TYPE_DEBUG, "Transaction author: %{public}@, token: %{public}@", buf, 0x16u);
          }
          if (!v24
            || ([v106 author],
                v28 = objc_claimAutoreleasedReturnValue(),
                int v29 = [v28 isEqualToString:v24],
                v28,
                !v29))
          {
            v98 = v26;
            uint64_t v99 = i;
            v30 = +[STLog mirroring];
            if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
              -[STHistoryAnalyzer deltasForStore:inManagedObjectContext:sinceToken:ignoreAuthor:finalToken:error:].cold.5((uint64_t)v130, (uint64_t)v106);
            }

            long long v112 = 0u;
            long long v113 = 0u;
            long long v110 = 0u;
            long long v111 = 0u;
            v104 = [v106 changes];
            uint64_t v31 = [v104 countByEnumeratingWithState:&v110 objects:v129 count:16];
            if (!v31)
            {
LABEL_87:
              v26 = v98;
              uint64_t i = v99;
              goto LABEL_88;
            }
            uint64_t v32 = v31;
            uint64_t v33 = *(void *)v111;
            while (2)
            {
              uint64_t v34 = 0;
              uint64_t v103 = v32;
LABEL_22:
              v35 = v23;
              v36 = v22;
              if (*(void *)v111 != v33) {
                objc_enumerationMutation(v104);
              }
              v37 = *(NSObject **)(*((void *)&v110 + 1) + 8 * v34);
              id v23 = [v106 token];

              if (![(STHistoryAnalyzer *)self _isChangeInteresting:v37])
              {
                v46 = +[STLog mirroring];
                if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138543362;
                  v123 = v37;
                  _os_log_debug_impl(&dword_1DA519000, v46, OS_LOG_TYPE_DEBUG, "Skipping uninteresting change: %{public}@", buf, 0xCu);
                }
                goto LABEL_36;
              }
              uint64_t v38 = [v37 changeType];
              v39 = [v37 changedObjectID];
              v40 = v39;
              if (v38 == 2)
              {
                v41 = [v39 entity];
                v42 = [v41 userInfo];
                v43 = [v42 objectForKeyedSubscript:@"isMirrored"];
                char v44 = [v43 isEqualToString:@"YES"];

                if (v44)
                {
                  v45 = [v37 tombstone];
                  v46 = [v45 objectForKeyedSubscript:@"uniqueIdentifier"];

                  if (v46)
                  {
                    v47 = +[STLog mirroring];
                    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
                    {
                      v76 = [v100 configurationName];
                      *(_DWORD *)buf = 138543618;
                      v123 = v76;
                      __int16 v124 = 2114;
                      v125 = v46;
                      _os_log_debug_impl(&dword_1DA519000, v47, OS_LOG_TYPE_DEBUG, "Detected change for store: %{public}@, Delete: %{public}@", buf, 0x16u);
                    }
                    v48 = [v101 objectForKeyedSubscript:v46];

                    if (!v48)
                    {
                      v49 = [[STDelta alloc] initWithUniqueIdentifier:v46];
                      [v101 setObject:v49 forKeyedSubscript:v46];
                    }
                    v50 = [v101 objectForKeyedSubscript:v46];
                    [v50 deleted];
                  }
                  id v22 = v36;
LABEL_50:
                  uint64_t v32 = v103;
LABEL_81:

                  if (v32 == ++v34)
                  {
                    uint64_t v81 = [v104 countByEnumeratingWithState:&v110 objects:v129 count:16];
                    uint64_t v32 = v81;
                    if (!v81)
                    {
                      v24 = v94;
                      goto LABEL_87;
                    }
                    continue;
                  }
                  goto LABEL_22;
                }
                v46 = +[STLog mirroring];
                uint64_t v32 = v103;
                if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG)) {
                  -[STHistoryAnalyzer deltasForStore:inManagedObjectContext:sinceToken:ignoreAuthor:finalToken:error:]((uint64_t)v128, (uint64_t)v37);
                }
LABEL_36:
                id v22 = v36;
                goto LABEL_81;
              }
              break;
            }
            id v109 = v22;
            v46 = [v102 existingObjectWithID:v39 error:&v109];
            id v22 = v109;

            v51 = [v46 entity];
            v52 = [v51 name];
            int v53 = [v52 isEqualToString:@"RMCloudActivation"];

            if (v53)
            {
              v54 = v46;
              if ([v54 activationType])
              {

                goto LABEL_40;
              }
              v65 = +[STLog mirroring];
              if (os_log_type_enabled(v65, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138543362;
                v123 = v54;
                _os_log_debug_impl(&dword_1DA519000, v65, OS_LOG_TYPE_DEBUG, "Skipping legacy STCloudActivation: %{public}@", buf, 0xCu);
              }

LABEL_78:
              v46 = v54;
LABEL_79:
              uint64_t v32 = v103;
LABEL_80:

              goto LABEL_81;
            }
LABEL_40:
            if ([v46 conformsToProtocol:&unk_1F34A3BC0])
            {
              v55 = v46;
              if (!v55)
              {
                v54 = +[STLog mirroring];
                if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG)) {
                  -[STHistoryAnalyzer deltasForStore:inManagedObjectContext:sinceToken:ignoreAuthor:finalToken:error:](&v107, v108, v54);
                }
                v46 = 0;
                goto LABEL_79;
              }
              v56 = v55;
              v57 = [v37 updatedProperties];
              v58 = [v57 valueForKey:@"name"];

              v59 = +[STLog mirroring];
              if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG))
              {
                v79 = [v100 configurationName];
                v80 = [v37 changedObjectID];
                *(_DWORD *)buf = 138543874;
                v123 = v79;
                __int16 v124 = 2114;
                v125 = v80;
                __int16 v126 = 2114;
                v127 = v58;
                _os_log_debug_impl(&dword_1DA519000, v59, OS_LOG_TYPE_DEBUG, "Detected change (subobject) for store: %{public}@, Changed subobject id: %{public}@, Properties: %{public}@", buf, 0x20u);
              }
              v46 = [v56 syncableRootObject];
            }
            if (![v46 conformsToProtocol:&unk_1F34A3188]) {
              goto LABEL_50;
            }
            v60 = [v46 entity];
            v61 = [v60 userInfo];
            v62 = [v61 objectForKeyedSubscript:@"isMirrored"];
            char v63 = [v62 isEqualToString:@"YES"];

            if ((v63 & 1) == 0)
            {
              v54 = +[STLog mirroring];
              if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG)) {
                -[STHistoryAnalyzer deltasForStore:inManagedObjectContext:sinceToken:ignoreAuthor:finalToken:error:]((uint64_t)v121, (uint64_t)v37);
              }
              goto LABEL_79;
            }
            if (+[STHistoryAnalyzer _changedObjectBelongsToFamily:v46 context:v102])
            {
              v54 = +[STLog mirroring];
              uint64_t v32 = v103;
              if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
              {
                v64 = [v46 objectID];
                *(_DWORD *)buf = 138543362;
                v123 = v64;
                _os_log_impl(&dword_1DA519000, v54, OS_LOG_TYPE_DEFAULT, "Ignoring changed object belonging to family: %{public}@", buf, 0xCu);
              }
              goto LABEL_80;
            }
            v54 = v46;
            [v54 updateUniqueIdentifier];
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
LABEL_67:
              v66 = [v54 dictionaryRepresentation];
              v68 = [v54 valueForKey:@"uniqueIdentifier"];
              if (v68)
              {
                v72 = [v101 objectForKeyedSubscript:v68];

                if (!v72)
                {
                  v73 = [[STDelta alloc] initWithUniqueIdentifier:v68];
                  [v101 setObject:v73 forKeyedSubscript:v68];
                }
                v74 = [v101 objectForKeyedSubscript:v68];
                [v74 changedWithDictionary:v66];

                v71 = +[STLog mirroring];
                if (os_log_type_enabled(v71, OS_LOG_TYPE_DEBUG))
                {
                  v75 = [v100 configurationName];
                  *(_DWORD *)buf = 138543618;
                  v123 = v75;
                  __int16 v124 = 2114;
                  v125 = v68;
                  _os_log_debug_impl(&dword_1DA519000, v71, OS_LOG_TYPE_DEBUG, "Detected change for store: %{public}@, Change: %{public}@", buf, 0x16u);
                }
              }
              else
              {
                v71 = +[STLog mirroring];
                if (os_log_type_enabled(v71, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138543362;
                  v123 = v54;
                  _os_log_debug_impl(&dword_1DA519000, v71, OS_LOG_TYPE_DEBUG, "Skipping change because object has no uniqueIdentifier: %{public}@", buf, 0xCu);
                }
              }
              goto LABEL_77;
            }
            v66 = v54;
            v67 = [v66 device];
            v68 = v67;
            if (v67)
            {
              v69 = [v67 identifier];

              v70 = +[STLog mirroring];
              v71 = v70;
              if (v69)
              {
                if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138543362;
                  v123 = v66;
                  _os_log_impl(&dword_1DA519000, v71, OS_LOG_TYPE_DEFAULT, "Found valid STUserDeviceState: %{public}@", buf, 0xCu);
                }

                goto LABEL_67;
              }
              if (!os_log_type_enabled(v70, OS_LOG_TYPE_FAULT))
              {
LABEL_77:

                goto LABEL_78;
              }
              *(_DWORD *)buf = 138543362;
              v123 = v66;
              v77 = v71;
              v78 = "Skipping STUserDeviceState with device.identifier = nil : %{public}@";
            }
            else
            {
              v71 = +[STLog mirroring];
              if (!os_log_type_enabled(v71, OS_LOG_TYPE_FAULT)) {
                goto LABEL_77;
              }
              *(_DWORD *)buf = 138543362;
              v123 = v66;
              v77 = v71;
              v78 = "Skipping STUserDeviceState with device = nil : %{public}@";
            }
            _os_log_fault_impl(&dword_1DA519000, v77, OS_LOG_TYPE_FAULT, v78, buf, 0xCu);
            goto LABEL_77;
          }
          v104 = +[STLog mirroring];
          if (os_log_type_enabled(v104, OS_LOG_TYPE_DEBUG)) {
            -[STHistoryAnalyzer deltasForStore:inManagedObjectContext:sinceToken:ignoreAuthor:finalToken:error:].cold.6(&v114, v115, v104);
          }
LABEL_88:
        }
        uint64_t v97 = [obj countByEnumeratingWithState:&v116 objects:v131 count:16];
        if (!v97) {
          goto LABEL_95;
        }
      }
    }
    v24 = v94;
LABEL_95:

    if (v88 && v23)
    {
      id v23 = v23;
      id *v88 = v23;
    }
  }
  else
  {
    v84 = v19;
    v85 = +[STLog mirroring];
    if (os_log_type_enabled(v85, OS_LOG_TYPE_FAULT)) {
      -[STHistoryAnalyzer deltasForStore:inManagedObjectContext:sinceToken:ignoreAuthor:finalToken:error:]();
    }

    id v22 = v84;
    id v23 = 0;
    v24 = v94;
  }
  if (a8 && v22) {
    *a8 = v22;
  }
  id v86 = v101;

  return v86;
}

- (BOOL)_isChangeInteresting:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 changeType] == 1)
  {
    v4 = [v3 updatedProperties];
    v5 = (void *)[v4 count];

    if (v5)
    {
      id v6 = objc_alloc(MEMORY[0x1E4F1CA80]);
      v7 = [v3 updatedProperties];
      v8 = objc_msgSend(v6, "initWithCapacity:", objc_msgSend(v7, "count"));

      long long v20 = 0u;
      long long v21 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      v5 = objc_msgSend(v3, "updatedProperties", 0);
      uint64_t v9 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v19;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v19 != v11) {
              objc_enumerationMutation(v5);
            }
            id v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
            uint64_t v14 = [v13 name];
            char v15 = [v14 hasPrefix:@"ck"];

            if ((v15 & 1) == 0)
            {
              v16 = [v13 name];
              [v8 addObject:v16];
            }
          }
          uint64_t v10 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
        }
        while (v10);
      }

      LOBYTE(v5) = [v8 count] != 0;
    }
  }
  else
  {
    LOBYTE(v5) = 1;
  }

  return (char)v5;
}

+ (BOOL)_changedObjectBelongsToFamily:(id)a3 context:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v5;
    v8 = +[STFamilyOrganization fetchRequest];
    id v16 = 0;
    uint64_t v9 = [v8 execute:&v16];
    uint64_t v10 = v16;
    if (!v9)
    {
      uint64_t v11 = +[STLog mirroring];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        +[STHistoryAnalyzer _changedObjectBelongsToFamily:context:]();
      }
      LOBYTE(v13) = 0;
      goto LABEL_11;
    }
    uint64_t v11 = [v9 firstObject];
    id v12 = [v7 organization];
    LOBYTE(v13) = [v12 isEqual:v11];
  }
  else
  {
    id v15 = 0;
    v8 = +[STCoreUser fetchLocalUserInContext:v6 error:&v15];
    id v7 = v15;
    if (!v8)
    {
      uint64_t v10 = +[STLog mirroring];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        +[STHistoryAnalyzer _changedObjectBelongsToFamily:context:]();
      }
      LOBYTE(v13) = 0;
      goto LABEL_15;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v10 = [v5 user];
      uint64_t v9 = [v10 dsid];
      uint64_t v11 = [v8 dsid];
      int v13 = [v9 isEqualToNumber:v11] ^ 1;
      goto LABEL_11;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      LOBYTE(v13) = 0;
      goto LABEL_16;
    }
    uint64_t v10 = [v5 userDeviceState];
    uint64_t v9 = [v10 user];
    uint64_t v11 = [v9 dsid];
    id v12 = [v8 dsid];
    int v13 = [v11 isEqualToNumber:v12] ^ 1;
  }

LABEL_11:
LABEL_15:

LABEL_16:
  return v13;
}

- (NSPersistentHistoryToken)finalToken
{
  return self->_finalToken;
}

- (void).cxx_destruct
{
}

- (void)deltasForStore:inManagedObjectContext:sinceToken:ignoreAuthor:finalToken:error:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_0();
  _os_log_fault_impl(&dword_1DA519000, v0, OS_LOG_TYPE_FAULT, "fetchHistoryAfterToken failed: %@", v1, 0xCu);
}

- (void)deltasForStore:(uint64_t)a1 inManagedObjectContext:(uint64_t)a2 sinceToken:ignoreAuthor:finalToken:error:.cold.2(uint64_t a1, uint64_t a2)
{
  v4 = objc_msgSend((id)OUTLINED_FUNCTION_3(a1, a2), "changedObjectID");
  id v5 = [v4 entity];
  id v6 = [v5 name];
  *id v3 = 138543362;
  *uint64_t v2 = v6;
  OUTLINED_FUNCTION_4(&dword_1DA519000, v7, v8, "Skipping unmirrored entity change: %{public}@");
}

- (void)deltasForStore:(os_log_t)log inManagedObjectContext:sinceToken:ignoreAuthor:finalToken:error:.cold.3(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_debug_impl(&dword_1DA519000, log, OS_LOG_TYPE_DEBUG, "Change is a subobject but has no root, skipping", buf, 2u);
}

- (void)deltasForStore:(uint64_t)a1 inManagedObjectContext:(uint64_t)a2 sinceToken:ignoreAuthor:finalToken:error:.cold.5(uint64_t a1, uint64_t a2)
{
  v4 = objc_msgSend((id)OUTLINED_FUNCTION_3(a1, a2), "changes");
  uint64_t v5 = [v4 count];
  *id v3 = 134217984;
  *uint64_t v2 = v5;
  OUTLINED_FUNCTION_4(&dword_1DA519000, v6, v7, "Transaction changes to process: %lu");
}

- (void)deltasForStore:(os_log_t)log inManagedObjectContext:sinceToken:ignoreAuthor:finalToken:error:.cold.6(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_debug_impl(&dword_1DA519000, log, OS_LOG_TYPE_DEBUG, "Skipping transaction due to author", buf, 2u);
}

- (void)deltasForStore:(void *)a1 inManagedObjectContext:(NSObject *)a2 sinceToken:ignoreAuthor:finalToken:error:.cold.7(void *a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  [a1 count];
  OUTLINED_FUNCTION_1_0();
  _os_log_debug_impl(&dword_1DA519000, a2, OS_LOG_TYPE_DEBUG, "Transactions to process: %lu", v3, 0xCu);
}

- (void)deltasForStore:(NSObject *)a3 inManagedObjectContext:sinceToken:ignoreAuthor:finalToken:error:.cold.8(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a1 configurationName];
  OUTLINED_FUNCTION_1_0();
  __int16 v7 = 2114;
  uint64_t v8 = a2;
  _os_log_debug_impl(&dword_1DA519000, a3, OS_LOG_TYPE_DEBUG, "deltasForStore: %{public}@, token passed in: %{public}@", v6, 0x16u);
}

+ (void)_changedObjectBelongsToFamily:context:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_1DA519000, v0, OS_LOG_TYPE_ERROR, "Failed to fetch family organizations: %{public}@", v1, 0xCu);
}

+ (void)_changedObjectBelongsToFamily:context:.cold.2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_1DA519000, v0, OS_LOG_TYPE_ERROR, "Failed to fetch the local user: %{public}@", v1, 0xCu);
}

@end