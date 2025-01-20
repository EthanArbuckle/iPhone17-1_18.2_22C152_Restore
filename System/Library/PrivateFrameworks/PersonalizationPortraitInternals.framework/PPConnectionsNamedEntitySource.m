@interface PPConnectionsNamedEntitySource
+ (PPConnectionsNamedEntitySource)sharedInstance;
- (PPConnectionsNamedEntitySource)initWithNamedEntityStore:(id)a3 contactStore:(id)a4;
- (id)identifier;
- (id)locationItemsWithCriteria:(id)a3 earliest:(id)a4 latest:(id)a5 limit:(unint64_t)a6 consumer:(unint64_t)a7 explanationSet:(id)a8;
@end

@implementation PPConnectionsNamedEntitySource

- (id)identifier
{
  return @"namedentity";
}

- (id)locationItemsWithCriteria:(id)a3 earliest:(id)a4 latest:(id)a5 limit:(unint64_t)a6 consumer:(unint64_t)a7 explanationSet:(id)a8
{
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a8;
  if ([v12 locationField] == 1)
  {
    id v57 = v15;
    uint64_t v16 = objc_opt_new();
    v17 = objc_opt_new();
    v18 = objc_opt_new();
    v19 = (void *)MEMORY[0x1CB79D060]();
    id v20 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    v21 = objc_msgSend(v20, "initWithObjects:", *MEMORY[0x1E4F8A0A8], 0);
    [v18 setMatchingSourceBundleIds:v21];

    v22 = (void *)MEMORY[0x1CB79D060]();
    v23 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", &unk_1F25698D8, &unk_1F25698F0, 0);
    [v18 setMatchingCategories:v23];

    [v18 setFromDate:v13];
    namedEntityStore = self->_namedEntityStore;
    id v77 = 0;
    v72[0] = MEMORY[0x1E4F143A8];
    v72[1] = 3221225472;
    v72[2] = __106__PPConnectionsNamedEntitySource_locationItemsWithCriteria_earliest_latest_limit_consumer_explanationSet___block_invoke;
    v72[3] = &unk_1E65DAB90;
    id v73 = v12;
    id v61 = v17;
    id v74 = v61;
    v75 = self;
    v25 = (id)v16;
    v76 = v25;
    v56 = v18;
    LOBYTE(v16) = [(PPLocalNamedEntityStore *)namedEntityStore iterNamedEntityRecordsWithQuery:v18 error:&v77 block:v72];
    id v26 = v77;
    v58 = v25;
    v55 = v26;
    if (v16)
    {
      id v52 = v14;
      id v53 = v13;
      id v54 = v12;
      long long v70 = 0u;
      long long v71 = 0u;
      long long v68 = 0u;
      long long v69 = 0u;
      v27 = v25;
      uint64_t v28 = [v27 countByEnumeratingWithState:&v68 objects:v79 count:16];
      v29 = v61;
      if (v28)
      {
        uint64_t v30 = v28;
        uint64_t v31 = *(void *)v69;
        uint64_t v59 = *(void *)v69;
        v60 = v27;
        do
        {
          uint64_t v32 = 0;
          uint64_t v62 = v30;
          do
          {
            if (*(void *)v69 != v31) {
              objc_enumerationMutation(v27);
            }
            v33 = *(void **)(*((void *)&v68 + 1) + 8 * v32);
            v34 = (void *)MEMORY[0x1CB79D060]();
            v35 = [v33 documentID];

            if (v35)
            {
              v36 = [v33 documentID];
              v37 = [v29 objectForKeyedSubscript:v36];

              if (v37)
              {
                long long v66 = 0u;
                long long v67 = 0u;
                long long v64 = 0u;
                long long v65 = 0u;
                v38 = v37;
                uint64_t v39 = [v38 countByEnumeratingWithState:&v64 objects:v78 count:16];
                if (v39)
                {
                  uint64_t v40 = v39;
                  v63 = v34;
                  uint64_t v41 = *(void *)v65;
                  while (2)
                  {
                    for (uint64_t i = 0; i != v40; ++i)
                    {
                      if (*(void *)v65 != v41) {
                        objc_enumerationMutation(v38);
                      }
                      uint64_t v43 = *(void *)(*((void *)&v64 + 1) + 8 * i);
                      v44 = [v33 value];
                      int v45 = [v44 containsString:v43];

                      if (v45)
                      {
                        [v33 setName:v43];
                        [v33 setLabel:v43];
                        goto LABEL_20;
                      }
                    }
                    uint64_t v40 = [v38 countByEnumeratingWithState:&v64 objects:v78 count:16];
                    if (v40) {
                      continue;
                    }
                    break;
                  }
LABEL_20:
                  v27 = v60;
                  v29 = v61;
                  uint64_t v31 = v59;
                  uint64_t v30 = v62;
                  v34 = v63;
                }
              }
              else
              {
                v38 = pp_connections_log_handle();
                if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
                {
                  v46 = [v33 originatingBundleID];
                  *(_DWORD *)buf = 138412290;
                  v81 = v46;
                  _os_log_impl(&dword_1CA9A8000, v38, OS_LOG_TYPE_DEFAULT, "PPConnectionsNamedEntitySource found a full address from %@ with no corresponding street value", buf, 0xCu);
                }
              }
            }
            ++v32;
          }
          while (v32 != v30);
          uint64_t v30 = [v27 countByEnumeratingWithState:&v68 objects:v79 count:16];
        }
        while (v30);
      }

      v47 = [v27 sortedArrayUsingComparator:&__block_literal_global_22305];
      id v13 = v53;
      id v12 = v54;
      id v14 = v52;
      id v15 = v57;
    }
    else
    {
      id v49 = v26;
      v50 = pp_connections_log_handle();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v81 = v49;
        _os_log_error_impl(&dword_1CA9A8000, v50, OS_LOG_TYPE_ERROR, "PPConnectionsNamedEntitySource failed to load named entity records: %@", buf, 0xCu);
      }

      v47 = 0;
      id v15 = v57;
      v29 = v61;
    }
  }
  else
  {
    v48 = pp_connections_log_handle();
    v58 = v48;
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v81) = [v12 locationField];
      _os_log_impl(&dword_1CA9A8000, v48, OS_LOG_TYPE_DEFAULT, "PPConnectionsNamedEntitySource: ignoring query for %hhu", buf, 8u);
    }
    v47 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v47;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_namedEntityStore, 0);
}

void __106__PPConnectionsNamedEntitySource_locationItemsWithCriteria_earliest_latest_limit_consumer_explanationSet___block_invoke(uint64_t a1, void *a2)
{
  v80[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = [v3 source];
  v5 = [v4 bundleId];
  v6 = [*(id *)(a1 + 32) bundleIdentifier];
  int v7 = [v5 isEqualToString:v6];

  if (v7)
  {
    v8 = pp_connections_log_handle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1CA9A8000, v8, OS_LOG_TYPE_DEFAULT, "PPConnectionsNamedEntitySource ignoring extraction from the client", (uint8_t *)&buf, 2u);
    }
LABEL_4:

    goto LABEL_20;
  }
  v9 = [v3 source];
  v10 = [v9 metadata];
  char v11 = [v10 flags];

  if (v11)
  {
    v8 = pp_connections_log_handle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1CA9A8000, v8, OS_LOG_TYPE_DEFAULT, "PPConnectionsNamedEntitySource ignoring extraction from outgoing message", (uint8_t *)&buf, 2u);
    }
    goto LABEL_4;
  }
  id v12 = [v3 entity];
  uint64_t v13 = [v12 category];

  if (v13 == 8)
  {
    id v14 = *(void **)(a1 + 40);
    id v15 = [v3 source];
    uint64_t v16 = [v15 documentId];
    v17 = [v14 objectForKeyedSubscript:v16];

    if (!v17)
    {
      v18 = objc_opt_new();
      v19 = *(void **)(a1 + 40);
      id v20 = [v3 source];
      v21 = [v20 documentId];
      [v19 setObject:v18 forKeyedSubscript:v21];
    }
    v22 = *(void **)(a1 + 40);
    v23 = [v3 source];
    v24 = [v23 documentId];
    v25 = [v22 objectForKeyedSubscript:v24];
    id v26 = [v3 entity];
    v27 = [v26 name];
    [v25 addObject:v27];
  }
  else
  {
    id v28 = objc_alloc(MEMORY[0x1E4F89DC0]);
    v29 = [v3 source];
    uint64_t v30 = [v29 bundleId];
    uint64_t v31 = (void *)[v28 initWithOriginatingBundleID:v30];

    uint64_t v32 = [v3 entity];
    v33 = [v32 name];
    [v31 setName:v33];

    v34 = [v3 entity];
    v35 = [v34 name];
    [v31 setLabel:v35];

    v36 = [v3 entity];
    v37 = [v36 name];
    [v31 setValue:v37];

    v38 = [v3 entity];
    uint64_t v39 = [v38 name];
    [v31 setShortValue:v39];

    uint64_t v40 = [v3 source];
    uint64_t v41 = [v40 documentId];
    [v31 setDocumentID:v41];

    [v31 setSource:@"namedentity"];
    v42 = [v3 source];
    uint64_t v43 = [v42 date];
    [v31 setCreatedAt:v43];

    v44 = NSNumber;
    int v45 = +[PPConnectionsParameters sharedInstance];
    [v45 namedEntitySourceExpirySeconds];
    v46 = objc_msgSend(v44, "numberWithDouble:");
    [v31 setLifetime:v46];

    uint64_t v47 = *(void *)(a1 + 48);
    long long v65 = [v3 source];
    v48 = [v65 documentId];
    id v49 = [v3 source];
    v50 = [v49 bundleId];
    id v51 = v48;
    id v52 = v50;
    if (v47)
    {
      uint64_t v67 = 0;
      long long v68 = &v67;
      uint64_t v69 = 0x3032000000;
      long long v70 = __Block_byref_object_copy__22314;
      long long v71 = __Block_byref_object_dispose__22315;
      id v72 = 0;
      dispatch_semaphore_t v53 = dispatch_semaphore_create(0);
      id v54 = [MEMORY[0x1E4F23838] defaultSearchableIndex];
      v80[0] = *MEMORY[0x1E4F22B00];
      v55 = [MEMORY[0x1E4F1C978] arrayWithObjects:v80 count:1];
      id v79 = v51;
      v56 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v79 count:1];
      *(void *)&long long buf = MEMORY[0x1E4F143A8];
      *((void *)&buf + 1) = 3221225472;
      id v74 = __96__PPConnectionsNamedEntitySource__authorHandleForDocumentWithUniqueIdentifier_bundleIdentifier___block_invoke;
      v75 = &unk_1E65DAEF8;
      id v76 = v51;
      v78 = &v67;
      id v57 = v53;
      id v77 = v57;
      [v54 slowFetchAttributes:v55 protectionClass:0 bundleID:v52 identifiers:v56 completionHandler:&buf];

      dispatch_semaphore_wait(v57, 0xFFFFFFFFFFFFFFFFLL);
      id v58 = (id)v68[5];

      _Block_object_dispose(&v67, 8);
    }
    else
    {
      id v58 = 0;
    }

    [v31 setAuthorHandle:v58];
    uint64_t v59 = *(void **)(*(void *)(a1 + 48) + 24);
    v60 = [v3 source];
    id v66 = 0;
    id v61 = [v59 contactHandlesForSource:v60 error:&v66];
    id v62 = v66;
    [v31 setContactHandles:v61];

    v63 = [v31 contactHandles];
    LODWORD(v60) = v63 == 0;

    if (v60)
    {
      long long v64 = pp_connections_log_handle();
      if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v62;
        _os_log_impl(&dword_1CA9A8000, v64, OS_LOG_TYPE_DEFAULT, "PPConnectionsNamedEntitySource: contactHandlesForSource failed: %@", (uint8_t *)&buf, 0xCu);
      }
    }
    [*(id *)(a1 + 56) addObject:v31];
  }
LABEL_20:
}

uint64_t __106__PPConnectionsNamedEntitySource_locationItemsWithCriteria_earliest_latest_limit_consumer_explanationSet___block_invoke_14(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  v5 = [a3 createdAt];
  v6 = [v4 createdAt];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

void __96__PPConnectionsNamedEntitySource__authorHandleForDocumentWithUniqueIdentifier_bundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = pp_connections_log_handle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = [v3 count];
    uint64_t v6 = *(void *)(a1 + 32);
    int v19 = 134218242;
    uint64_t v20 = v5;
    __int16 v21 = 2112;
    uint64_t v22 = v6;
    _os_log_impl(&dword_1CA9A8000, v4, OS_LOG_TYPE_DEFAULT, "PPConnectionsNamedEntitySource: Spotlight returned %tu attribute values for %@", (uint8_t *)&v19, 0x16u);
  }

  uint64_t v7 = [v3 firstObject];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v8 = [v7 firstObject];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v9 = pp_connections_log_handle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v17 = *(void *)(a1 + 32);
        int v19 = 138412290;
        uint64_t v20 = v17;
        _os_log_impl(&dword_1CA9A8000, v9, OS_LOG_TYPE_DEFAULT, "PPConnectionsNamedEntitySource: Spotlight returned unexpected data for %@", (uint8_t *)&v19, 0xCu);
      }
      goto LABEL_16;
    }
    v9 = [v8 firstObject];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v9);
      v10 = pp_connections_log_handle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) length];
        uint64_t v12 = *(void *)(a1 + 32);
        int v19 = 134218242;
        uint64_t v20 = v11;
        __int16 v21 = 2112;
        uint64_t v22 = v12;
        uint64_t v13 = "PPConnectionsNamedEntitySource: found author handle length %tu for %@";
        id v14 = v10;
        uint32_t v15 = 22;
LABEL_14:
        _os_log_impl(&dword_1CA9A8000, v14, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v19, v15);
      }
    }
    else
    {
      v10 = pp_connections_log_handle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v18 = *(void *)(a1 + 32);
        int v19 = 138412290;
        uint64_t v20 = v18;
        uint64_t v13 = "PPConnectionsNamedEntitySource: Spotlight returned unexpected data for %@";
        id v14 = v10;
        uint32_t v15 = 12;
        goto LABEL_14;
      }
    }

LABEL_16:
    goto LABEL_17;
  }
  v8 = pp_connections_log_handle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = *(void *)(a1 + 32);
    int v19 = 138412290;
    uint64_t v20 = v16;
    _os_log_impl(&dword_1CA9A8000, v8, OS_LOG_TYPE_DEFAULT, "PPConnectionsNamedEntitySource: Spotlight returned unexpected data for %@", (uint8_t *)&v19, 0xCu);
  }
LABEL_17:

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (PPConnectionsNamedEntitySource)initWithNamedEntityStore:(id)a3 contactStore:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PPConnectionsNamedEntitySource;
  v9 = [(PPConnectionsNamedEntitySource *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_namedEntityStore, a3);
    objc_storeStrong((id *)&v10->_contactStore, a4);
  }

  return v10;
}

+ (PPConnectionsNamedEntitySource)sharedInstance
{
  pthread_mutex_lock(&sharedInstance_lock_22337);
  if (!sharedInstance_instance_22338)
  {
    v2 = +[PPLocalNamedEntityStore defaultStore];
    uint64_t v3 = +[PPLocalContactStore defaultStore];
    id v4 = (void *)v3;
    if (v2) {
      BOOL v5 = v3 == 0;
    }
    else {
      BOOL v5 = 1;
    }
    if (v5)
    {
      uint64_t v6 = pp_connections_log_handle();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v11 = 0;
        _os_log_impl(&dword_1CA9A8000, v6, OS_LOG_TYPE_INFO, "PPConnectionsNamedEntitySource failed to get named entity and/or contact store instances. Device may be Class C locked.", v11, 2u);
      }
    }
    else
    {
      id v7 = [[PPConnectionsNamedEntitySource alloc] initWithNamedEntityStore:v2 contactStore:v3];
      id v8 = (void *)sharedInstance_instance_22338;
      sharedInstance_instance_22338 = (uint64_t)v7;
    }
  }
  id v9 = (id)sharedInstance_instance_22338;
  pthread_mutex_unlock(&sharedInstance_lock_22337);
  return (PPConnectionsNamedEntitySource *)v9;
}

@end