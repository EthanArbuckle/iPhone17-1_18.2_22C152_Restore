@interface RTEntityDeletionRequestMO
+ (id)fetchRequest;
+ (id)managedObjectWithCloudManagedObjects:(id)a3 context:(id)a4;
- (id)identifiersByTypeInSubgraphOfEntity:(id)a3 shouldTombstone:(BOOL)a4;
- (void)buildDeleteRequestFromCloudManagedObject:(id)a3 context:(id)a4;
- (void)buildDeleteRequestFromCloudManagedObjects:(id)a3 context:(id)a4;
- (void)mergeEntriesFromDictionary:(id)a3 intoDictionary:(id)a4;
@end

@implementation RTEntityDeletionRequestMO

+ (id)fetchRequest
{
  return (id)[MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:@"RTEntityDeletionRequestMO"];
}

+ (id)managedObjectWithCloudManagedObjects:(id)a3 context:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = v6;
  if (v6)
  {
    *(void *)buf = 0;
    v16 = buf;
    uint64_t v17 = 0x3032000000;
    v18 = __Block_byref_object_copy__129;
    v19 = __Block_byref_object_dispose__129;
    id v20 = 0;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __74__RTEntityDeletionRequestMO_managedObjectWithCloudManagedObjects_context___block_invoke;
    v11[3] = &unk_1E6B970D0;
    v14 = buf;
    id v12 = v6;
    id v13 = v5;
    [v12 performBlockAndWait:v11];
    id v8 = *((id *)v16 + 5);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: context", buf, 2u);
    }

    id v8 = 0;
  }

  return v8;
}

uint64_t __74__RTEntityDeletionRequestMO_managedObjectWithCloudManagedObjects_context___block_invoke(void *a1)
{
  v2 = [[RTEntityDeletionRequestMO alloc] initWithContext:a1[4]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  id v5 = [MEMORY[0x1E4F1C9E8] dictionary];
  [*(id *)(*(void *)(a1[6] + 8) + 40) setRecordIDs:v5];

  uint64_t v6 = a1[5];
  v7 = *(void **)(*(void *)(a1[6] + 8) + 40);
  uint64_t v8 = a1[4];

  return [v7 buildDeleteRequestFromCloudManagedObjects:v6 context:v8];
}

- (void)buildDeleteRequestFromCloudManagedObject:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (!v6)
  {
    v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
LABEL_7:

      goto LABEL_8;
    }
    *(_WORD *)buf = 0;
    v10 = "Invalid parameter not satisfying: cloudManagedObject";
LABEL_10:
    _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, v10, buf, 2u);
    goto LABEL_7;
  }
  if (!v7)
  {
    v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    *(_WORD *)buf = 0;
    v10 = "Invalid parameter not satisfying: context";
    goto LABEL_10;
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __78__RTEntityDeletionRequestMO_buildDeleteRequestFromCloudManagedObject_context___block_invoke;
  v11[3] = &unk_1E6B92F80;
  void v11[4] = self;
  id v12 = v6;
  id v13 = v8;
  [v13 performBlockAndWait:v11];

LABEL_8:
}

void __78__RTEntityDeletionRequestMO_buildDeleteRequestFromCloudManagedObject_context___block_invoke(id *a1)
{
  v2 = [a1[4] identifier];

  if (!v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F29128] UUID];
    [a1[4] setIdentifier:v3];
  }
  v4 = [a1[4] creationDate];

  if (!v4)
  {
    id v5 = [MEMORY[0x1E4F1C9C8] date];
    [a1[4] setCreationDate:v5];
  }
  id v6 = [a1[4] expirationDate];

  if (!v6)
  {
    id v7 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:4838400.0];
    [a1[4] setExpirationDate:v7];
  }
  uint64_t v8 = [a1[4] recordIDs];

  if (!v8)
  {
    v9 = [MEMORY[0x1E4F1C9E8] dictionary];
    [a1[4] setRecordIDs:v9];
  }
  v10 = [a1[5] device];
  v11 = [v10 identifier];
  id v12 = [a1[6] currentDevice];
  id v13 = [v12 identifier];
  uint64_t v14 = [v11 isEqual:v13] ^ 1;

  v15 = [a1[4] identifiersByTypeInSubgraphOfEntity:a1[5] shouldTombstone:v14];
  uint64_t v19 = MEMORY[0x1E4F143A8];
  uint64_t v20 = 3221225472;
  v21 = __78__RTEntityDeletionRequestMO_buildDeleteRequestFromCloudManagedObject_context___block_invoke_2;
  v22 = &unk_1E6B989F8;
  id v23 = a1[4];
  id v24 = v15;
  id v16 = v15;
  [v16 enumerateKeysAndObjectsUsingBlock:&v19];
  uint64_t v17 = [a1[5] device:v19, v20, v21, v22, v23];
  v18 = [v17 identifier];
  [a1[4] setTargetDeviceIdentifier:v18];
}

void __78__RTEntityDeletionRequestMO_buildDeleteRequestFromCloudManagedObject_context___block_invoke_2(uint64_t a1, void *a2)
{
  id v13 = a2;
  uint64_t v3 = [*(id *)(a1 + 32) recordIDs];
  v4 = [v3 objectForKey:v13];

  if (!v4) {
    v4 = objc_opt_new();
  }
  id v5 = [*(id *)(a1 + 40) objectForKey:v13];
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = [MEMORY[0x1E4F1CAD0] set];
  }
  uint64_t v8 = v7;

  v9 = [v4 setByAddingObjectsFromSet:v8];

  v10 = [*(id *)(a1 + 32) recordIDs];
  v11 = (void *)[v10 mutableCopy];

  [v11 setObject:v9 forKey:v13];
  id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:v11];
  [*(id *)(a1 + 32) setRecordIDs:v12];
}

- (void)buildDeleteRequestFromCloudManagedObjects:(id)a3 context:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v6);
        }
        [(RTEntityDeletionRequestMO *)self buildDeleteRequestFromCloudManagedObject:*(void *)(*((void *)&v12 + 1) + 8 * v11++) context:v7];
      }
      while (v9 != v11);
      uint64_t v9 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (id)identifiersByTypeInSubgraphOfEntity:(id)a3 shouldTombstone:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6)
  {
    id v7 = (void *)MEMORY[0x1E4F1CC08];
LABEL_21:

    return v7;
  }
  id v7 = objc_opt_new();
  if (v4) {
    [v6 setFlags:[v6 flags] | 1];
  }
  uint64_t v8 = (objc_class *)objc_opt_class();
  uint64_t v9 = NSStringFromClass(v8);
  uint64_t v10 = (void *)MEMORY[0x1E4F1CA80];
  uint64_t v11 = [v6 identifier];
  long long v12 = [v10 setWithObjects:v11];

  [v7 setValue:v12 forKey:v9];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v13 = [v6 inbound];
    long long v14 = [(RTEntityDeletionRequestMO *)self identifiersByTypeInSubgraphOfEntity:v13 shouldTombstone:v4];

    long long v15 = [v6 outbound];
    id v16 = [(RTEntityDeletionRequestMO *)self identifiersByTypeInSubgraphOfEntity:v15 shouldTombstone:v4];

    [(RTEntityDeletionRequestMO *)self mergeEntriesFromDictionary:v14 intoDictionary:v7];
    [(RTEntityDeletionRequestMO *)self mergeEntriesFromDictionary:v16 intoDictionary:v7];

LABEL_20:
    goto LABEL_21;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v31 = v9;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    uint64_t v17 = [v6 visits];
    uint64_t v18 = [v17 countByEnumeratingWithState:&v32 objects:v38 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v33 != v20) {
            objc_enumerationMutation(v17);
          }
          v22 = [(RTEntityDeletionRequestMO *)self identifiersByTypeInSubgraphOfEntity:*(void *)(*((void *)&v32 + 1) + 8 * i) shouldTombstone:v4];
          [(RTEntityDeletionRequestMO *)self mergeEntriesFromDictionary:v22 intoDictionary:v7];
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v32 objects:v38 count:16];
      }
      while (v19);
    }

    id v23 = [v6 mapItem];
    id v24 = [(RTEntityDeletionRequestMO *)self identifiersByTypeInSubgraphOfEntity:v23 shouldTombstone:v4];

    [(RTEntityDeletionRequestMO *)self mergeEntriesFromDictionary:v24 intoDictionary:v7];
    uint64_t v9 = v31;
    goto LABEL_20;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v25 = [v6 address];
    v26 = [(RTEntityDeletionRequestMO *)self identifiersByTypeInSubgraphOfEntity:v25 shouldTombstone:v4];

    [(RTEntityDeletionRequestMO *)self mergeEntriesFromDictionary:v26 intoDictionary:v7];
    goto LABEL_20;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_20;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_20;
  }
  v28 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
  {
    v29 = (objc_class *)objc_opt_class();
    v30 = NSStringFromClass(v29);
    *(_DWORD *)buf = 138412290;
    v37 = v30;
    _os_log_error_impl(&dword_1D9BFA000, v28, OS_LOG_TYPE_ERROR, "Unhandled entity type, %@", buf, 0xCu);
  }
  __break(1u);
  return result;
}

- (void)mergeEntriesFromDictionary:(id)a3 intoDictionary:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __71__RTEntityDeletionRequestMO_mergeEntriesFromDictionary_intoDictionary___block_invoke;
  v7[3] = &unk_1E6B989A8;
  id v8 = v5;
  id v6 = v5;
  [a3 enumerateKeysAndObjectsUsingBlock:v7];
}

void __71__RTEntityDeletionRequestMO_mergeEntriesFromDictionary_intoDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = [v5 objectForKey:v9];
  if (v7)
  {
    uint64_t v8 = [v6 allObjects];

    [v7 addObjectsFromArray:v8];
    id v6 = (id)v8;
  }
  else
  {
    [*(id *)(a1 + 32) setObject:v6 forKey:v9];
  }
}

@end