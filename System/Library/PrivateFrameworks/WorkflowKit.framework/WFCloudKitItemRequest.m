@interface WFCloudKitItemRequest
+ (id)createRecordFromItem:(id)a3 zoneID:(id)a4;
+ (id)createRecordIDWithName:(id)a3 zoneID:(id)a4;
+ (id)desiredKeysFromProperties:(id)a3 itemType:(Class)a4;
+ (id)itemValueForRecordValue:(id)a3 item:(id)a4 property:(id)a5 resolvedReferences:(id)a6;
+ (id)recordFromSystemFieldsData:(id)a3 error:(id *)a4;
+ (id)recordValueForItemValue:(id)a3 item:(id)a4 property:(id)a5 recordKey:(id)a6 zoneID:(id)a7;
+ (id)systemFieldsDataFromRecord:(id)a3 error:(id *)a4;
+ (void)assignRecordValue:(id)a3 toItem:(id)a4 withProperty:(id)a5 resolvedReferences:(id)a6;
+ (void)hydrateItem:(id)a3 withRecord:(id)a4 resolvedReferences:(id)a5 setNilValues:(BOOL)a6;
+ (void)hydrateItem:(id)a3 withRecord:(id)a4 setNilValues:(BOOL)a5;
- (BOOL)performExpensiveFetchOperations;
- (CKContainer)container;
- (CKDatabase)database;
- (OS_dispatch_queue)callbackQueue;
- (OS_dispatch_queue)operationWaitingQueue;
- (OS_xpc_object)xpcActivity;
- (WFCloudKitItemRequest)initWithContainer:(id)a3 database:(id)a4;
- (id)createTaskCancelledError;
- (id)deleteItem:(id)a3 completionHandler:(id)a4;
- (id)fetchConfigurationAssetWithType:(id)a3 completionHandler:(id)a4;
- (id)fetchConfigurationAssetWithType:(id)a3 configuration:(id)a4 completionHandler:(id)a5;
- (id)fetchItemWithID:(id)a3 itemType:(Class)a4 groupName:(id)a5 properties:(id)a6 completionHandler:(id)a7;
- (id)fetchItemsWithPredicate:(id)a3 itemType:(Class)a4 groupName:(id)a5 properties:(id)a6 completionHandler:(id)a7;
- (id)fetchItemsWithPredicate:(id)a3 itemType:(Class)a4 groupName:(id)a5 properties:(id)a6 sortDescriptors:(id)a7 resultsLimit:(unint64_t)a8 completionHandler:(id)a9;
- (id)fetchItemsWithPredicate:(id)a3 itemType:(Class)a4 groupName:(id)a5 properties:(id)a6 sortDescriptors:(id)a7 resultsLimit:(unint64_t)a8 qualityOfService:(int64_t)a9 completionHandler:(id)a10;
- (id)fetchRecordIDs:(id)a3 desiredKeys:(id)a4 operationGroup:(id)a5 completionHandler:(id)a6;
- (id)updateItems:(id)a3 setNilValues:(BOOL)a4 completionHandler:(id)a5;
- (id)updateItems:(id)a3 setNilValues:(BOOL)a4 qualityOfService:(int64_t)a5 timeoutIntervalForRequest:(double)a6 completionHandler:(id)a7;
- (void)setPerformExpensiveFetchOperations:(BOOL)a3;
- (void)setXpcActivity:(id)a3;
@end

@implementation WFCloudKitItemRequest

void __60__WFCloudKitItemRequest_desiredKeysFromProperties_itemType___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  if (([a3 isIgnoredByDefault] & 1) == 0) {
    [*(id *)(a1 + 32) addObject:v5];
  }
}

- (id)fetchConfigurationAssetWithType:(id)a3 completionHandler:(id)a4
{
  return [(WFCloudKitItemRequest *)self fetchConfigurationAssetWithType:a3 configuration:0 completionHandler:a4];
}

- (id)fetchConfigurationAssetWithType:(id)a3 configuration:(id)a4 completionHandler:(id)a5
{
  id v9 = a5;
  v10 = (__CFString *)a4;
  id v11 = a3;
  if (![v11 length])
  {
    v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2, self, @"WFRemoteConfigurationAsset.m", 43, @"Invalid parameter not satisfying: %@", @"assetType.length" object file lineNumber description];
  }
  v12 = [MEMORY[0x1E4F5A7A0] sharedContext];
  v13 = [v12 applicationBundle];

  v14 = [v13 objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
  v15 = [v13 objectForInfoDictionaryKey:*MEMORY[0x1E4F1D020]];
  id v16 = [v13 bundleIdentifier];
  [v16 UTF8String];
  if (((v10 != 0) & os_variant_has_internal_content()) != 0) {
    v17 = v10;
  }
  else {
    v17 = @"default";
  }
  v18 = v17;

  v19 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"assetType = %@ AND shortVersion = %@ AND buildNumber = %@ AND configuration = %@", v11, v14, v15, v18];

  uint64_t v20 = objc_opt_class();
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __115__WFCloudKitItemRequest_RemoteConfigurationAsset__fetchConfigurationAssetWithType_configuration_completionHandler___block_invoke;
  v25[3] = &unk_1E65586C8;
  id v26 = v9;
  id v21 = v9;
  v22 = [(WFCloudKitItemRequest *)self fetchItemsWithPredicate:v19 itemType:v20 groupName:@"ConfigurationAssetQuery" properties:0 sortDescriptors:0 resultsLimit:1 completionHandler:v25];

  return v22;
}

- (id)fetchItemsWithPredicate:(id)a3 itemType:(Class)a4 groupName:(id)a5 properties:(id)a6 sortDescriptors:(id)a7 resultsLimit:(unint64_t)a8 completionHandler:(id)a9
{
  return [(WFCloudKitItemRequest *)self fetchItemsWithPredicate:a3 itemType:a4 groupName:a5 properties:a6 sortDescriptors:a7 resultsLimit:a8 qualityOfService:25 completionHandler:a9];
}

- (id)fetchItemsWithPredicate:(id)a3 itemType:(Class)a4 groupName:(id)a5 properties:(id)a6 sortDescriptors:(id)a7 resultsLimit:(unint64_t)a8 qualityOfService:(int64_t)a9 completionHandler:(id)a10
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v54 = a3;
  id v52 = a6;
  id v51 = a10;
  id v16 = a7;
  id v17 = a5;
  if (([(objc_class *)a4 conformsToProtocol:&unk_1F232DED0] & 1) == 0)
  {
    v49 = [MEMORY[0x1E4F28B00] currentHandler];
    [v49 handleFailureInMethod:a2 object:self file:@"WFCloudKitItemRequest.m" lineNumber:150 description:@"Item type must conform to WFCloudKitItem protocol"];
  }
  v18 = [MEMORY[0x1E4F29128] UUID];
  v19 = getWFGalleryLogObject();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v68 = "-[WFCloudKitItemRequest fetchItemsWithPredicate:itemType:groupName:properties:sortDescriptors:resultsLimit:qua"
          "lityOfService:completionHandler:]";
    __int16 v69 = 2114;
    v70 = v18;
    _os_log_impl(&dword_1C7F0A000, v19, OS_LOG_TYPE_INFO, "%s Starting task with debugging UUID: %{public}@", buf, 0x16u);
  }

  uint64_t v20 = objc_opt_new();
  id v21 = objc_alloc(MEMORY[0x1E4F1A2A0]);
  v22 = [(objc_class *)a4 recordType];
  v23 = (void *)[v21 initWithRecordType:v22 predicate:v54];

  v53 = v23;
  [v23 setSortDescriptors:v16];

  v24 = getWFCloudKitLogObject();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    v25 = [(objc_class *)a4 recordType];
    *(_DWORD *)buf = 136315906;
    v68 = "-[WFCloudKitItemRequest fetchItemsWithPredicate:itemType:groupName:properties:sortDescriptors:resultsLimit:qua"
          "lityOfService:completionHandler:]";
    __int16 v69 = 2114;
    v70 = v18;
    __int16 v71 = 2114;
    v72 = v25;
    __int16 v73 = 2112;
    id v74 = v54;
    _os_log_impl(&dword_1C7F0A000, v24, OS_LOG_TYPE_INFO, "%s Debugging UUID: %{public}@ Searching records of type %{public}@ with predicate: %@", buf, 0x2Au);
  }
  id v26 = objc_alloc_init(MEMORY[0x1E4F1A218]);
  [v26 setName:v17];

  v27 = [v26 defaultConfiguration];
  [v27 setQualityOfService:a9];

  v28 = [(WFCloudKitItemRequest *)self xpcActivity];
  v29 = [v26 defaultConfiguration];
  [v29 setXpcActivity:v28];

  v30 = objc_opt_new();
  v31 = objc_opt_new();
  v32 = (void *)[objc_alloc(MEMORY[0x1E4F1A2B8]) initWithQuery:v53];
  v33 = v32;
  if (a8) {
    objc_msgSend(v32, "setResultsLimit:");
  }
  if (![(WFCloudKitItemRequest *)self performExpensiveFetchOperations])
  {
    v34 = [(id)objc_opt_class() desiredKeysFromProperties:v52 itemType:a4];
    [v33 setDesiredKeys:v34];
  }
  [v33 setGroup:v26];
  id v35 = objc_alloc(MEMORY[0x1E4F1A320]);
  v36 = (void *)[v35 initWithZoneName:*MEMORY[0x1E4F19D88] ownerName:*MEMORY[0x1E4F19C08]];
  [v33 setZoneID:v36];

  [v20 setCloudOperation:v33];
  v63[0] = MEMORY[0x1E4F143A8];
  v63[1] = 3221225472;
  v63[2] = __143__WFCloudKitItemRequest_fetchItemsWithPredicate_itemType_groupName_properties_sortDescriptors_resultsLimit_qualityOfService_completionHandler___block_invoke;
  v63[3] = &unk_1E6552B38;
  Class v66 = a4;
  id v37 = v30;
  id v64 = v37;
  id v38 = v31;
  id v65 = v38;
  [v33 setRecordFetchedBlock:v63];
  v55[0] = MEMORY[0x1E4F143A8];
  v55[1] = 3221225472;
  v55[2] = __143__WFCloudKitItemRequest_fetchItemsWithPredicate_itemType_groupName_properties_sortDescriptors_resultsLimit_qualityOfService_completionHandler___block_invoke_2;
  v55[3] = &unk_1E6552B88;
  id v39 = v20;
  id v56 = v39;
  id v57 = v18;
  id v61 = v38;
  id v62 = v51;
  v58 = self;
  id v59 = v37;
  id v60 = v26;
  id v40 = v38;
  id v41 = v26;
  id v42 = v37;
  id v43 = v51;
  id v44 = v18;
  [v33 setQueryCompletionBlock:v55];
  v45 = [(WFCloudKitItemRequest *)self database];
  [v45 addOperation:v33];

  v46 = v61;
  id v47 = v39;

  return v47;
}

void __143__WFCloudKitItemRequest_fetchItemsWithPredicate_itemType_groupName_properties_sortDescriptors_resultsLimit_qualityOfService_completionHandler___block_invoke_277(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) operationQueue];
  v3 = [[WFCloudKitResolveReferencesOperation alloc] initWithRequest:*(void *)(a1 + 40) records:*(void *)(a1 + 48) operationGroup:*(void *)(a1 + 56) task:*(void *)(a1 + 32)];
  [v2 addOperation:v3];

  v4 = [*(id *)(a1 + 32) operationQueue];
  [v4 waitUntilAllOperationsAreFinished];

  id v5 = [*(id *)(a1 + 40) callbackQueue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __143__WFCloudKitItemRequest_fetchItemsWithPredicate_itemType_groupName_properties_sortDescriptors_resultsLimit_qualityOfService_completionHandler___block_invoke_2_279;
  v8[3] = &unk_1E65586A0;
  id v9 = *(id *)(a1 + 32);
  id v6 = *(id *)(a1 + 72);
  uint64_t v7 = *(void *)(a1 + 40);
  id v12 = v6;
  uint64_t v10 = v7;
  id v11 = *(id *)(a1 + 64);
  dispatch_async(v5, v8);
}

- (OS_xpc_object)xpcActivity
{
  return self->_xpcActivity;
}

- (BOOL)performExpensiveFetchOperations
{
  return self->_performExpensiveFetchOperations;
}

- (CKDatabase)database
{
  return self->_database;
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

+ (id)desiredKeysFromProperties:(id)a3 itemType:(Class)a4
{
  id v5 = a3;
  id v6 = objc_opt_new();
  uint64_t v7 = v6;
  if (v5)
  {
    [v6 setArray:v5];
  }
  else
  {
    v8 = [(objc_class *)a4 properties];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __60__WFCloudKitItemRequest_desiredKeysFromProperties_itemType___block_invoke;
    v10[3] = &unk_1E6552CC8;
    id v11 = v7;
    [v8 enumerateKeysAndObjectsUsingBlock:v10];
  }
  return v7;
}

void __115__WFCloudKitItemRequest_RemoteConfigurationAsset__fetchConfigurationAssetWithType_configuration_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = [a2 firstObject];
  id v7 = [v6 assetDataFile];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __143__WFCloudKitItemRequest_fetchItemsWithPredicate_itemType_groupName_properties_sortDescriptors_resultsLimit_qualityOfService_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([*(id *)(a1 + 32) isCancelled]) {
    goto LABEL_4;
  }
  id v5 = [v4 domain];
  if ([v5 isEqualToString:*MEMORY[0x1E4F19C40]])
  {
    uint64_t v6 = [v4 code];

    if (v6 == 20)
    {
LABEL_4:
      id v7 = getWFCloudKitLogObject();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        uint64_t v8 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 136315394;
        v25 = "-[WFCloudKitItemRequest fetchItemsWithPredicate:itemType:groupName:properties:sortDescriptors:resultsLimit"
              ":qualityOfService:completionHandler:]_block_invoke_2";
        __int16 v26 = 2114;
        uint64_t v27 = v8;
        _os_log_impl(&dword_1C7F0A000, v7, OS_LOG_TYPE_INFO, "%s Debugging UUID: %{public}@ cancelled task", buf, 0x16u);
      }

      uint64_t v9 = *(void *)(a1 + 80);
      uint64_t v10 = [*(id *)(a1 + 48) createTaskCancelledError];
      (*(void (**)(uint64_t, void, void *))(v9 + 16))(v9, 0, v10);

      goto LABEL_13;
    }
  }
  else
  {
  }
  if (v4)
  {
    id v11 = getWFCloudKitLogObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 136315650;
      v25 = "-[WFCloudKitItemRequest fetchItemsWithPredicate:itemType:groupName:properties:sortDescriptors:resultsLimit:q"
            "ualityOfService:completionHandler:]_block_invoke";
      __int16 v26 = 2114;
      uint64_t v27 = v12;
      __int16 v28 = 2114;
      id v29 = v4;
      _os_log_impl(&dword_1C7F0A000, v11, OS_LOG_TYPE_ERROR, "%s Debugging UUID: %{public}@ Unable to complete predicate query: %{public}@", buf, 0x20u);
    }

    (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
  }
  else
  {
    v13 = [*(id *)(a1 + 48) operationWaitingQueue];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __143__WFCloudKitItemRequest_fetchItemsWithPredicate_itemType_groupName_properties_sortDescriptors_resultsLimit_qualityOfService_completionHandler___block_invoke_277;
    v17[3] = &unk_1E6552B60;
    id v14 = *(id *)(a1 + 32);
    uint64_t v15 = *(void *)(a1 + 48);
    id v16 = *(void **)(a1 + 56);
    id v18 = v14;
    uint64_t v19 = v15;
    id v20 = v16;
    id v21 = *(id *)(a1 + 64);
    id v23 = *(id *)(a1 + 80);
    id v22 = *(id *)(a1 + 72);
    dispatch_async(v13, v17);
  }
LABEL_13:
}

void __143__WFCloudKitItemRequest_fetchItemsWithPredicate_itemType_groupName_properties_sortDescriptors_resultsLimit_qualityOfService_completionHandler___block_invoke_2_279(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isCancelled])
  {
    uint64_t v2 = *(void *)(a1 + 56);
    uint64_t v10 = [*(id *)(a1 + 40) createTaskCancelledError];
    (*(void (**)(uint64_t, void, uint64_t))(v2 + 16))(v2, 0, v10);
    v3 = (void *)v10;
LABEL_5:

    return;
  }
  id v4 = [*(id *)(a1 + 32) error];

  uint64_t v5 = *(void *)(a1 + 56);
  if (v4)
  {
    id v9 = [*(id *)(a1 + 32) error];
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v9);
    v3 = v9;
    goto LABEL_5;
  }
  uint64_t v6 = *(void *)(a1 + 48);
  id v7 = *(void (**)(uint64_t, uint64_t, void))(v5 + 16);
  uint64_t v8 = *(void *)(a1 + 56);
  v7(v8, v6, 0);
}

- (OS_dispatch_queue)operationWaitingQueue
{
  return self->_operationWaitingQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_operationWaitingQueue, 0);
  objc_storeStrong((id *)&self->_xpcActivity, 0);
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_container, 0);
}

- (WFCloudKitItemRequest)initWithContainer:(id)a3 database:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)WFCloudKitItemRequest;
  id v9 = [(WFCloudKitItemRequest *)&v19 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_container, a3);
    objc_storeStrong((id *)&v10->_database, a4);
    id v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v12 = dispatch_queue_create("com.apple.shortcuts.WFCloutKitItemRequest-operation", v11);
    operationWaitingQueue = v10->_operationWaitingQueue;
    v10->_operationWaitingQueue = (OS_dispatch_queue *)v12;

    id v14 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v15 = dispatch_queue_create("com.apple.shortcuts.WFCloudKitItemRequest-callback", v14);
    callbackQueue = v10->_callbackQueue;
    v10->_callbackQueue = (OS_dispatch_queue *)v15;

    id v17 = v10;
  }

  return v10;
}

- (void)setXpcActivity:(id)a3
{
}

- (void)setPerformExpensiveFetchOperations:(BOOL)a3
{
  self->_performExpensiveFetchOperations = a3;
}

- (CKContainer)container
{
  return self->_container;
}

- (id)fetchRecordIDs:(id)a3 desiredKeys:(id)a4 operationGroup:(id)a5 completionHandler:(id)a6
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = (__CFString *)a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = getWFCloudKitLogObject();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    uint64_t v15 = [v10 count];
    BOOL v16 = [(WFCloudKitItemRequest *)self performExpensiveFetchOperations];
    v32 = "-[WFCloudKitItemRequest fetchRecordIDs:desiredKeys:operationGroup:completionHandler:]";
    id v17 = @"all";
    *(_DWORD *)buf = 136315650;
    if (!v16) {
      id v17 = v11;
    }
    __int16 v33 = 2048;
    uint64_t v34 = v15;
    __int16 v35 = 2112;
    v36 = v17;
    _os_log_impl(&dword_1C7F0A000, v14, OS_LOG_TYPE_INFO, "%s Fetching %lu records by ID. Desired keys: %@", buf, 0x20u);
  }

  id v18 = (void *)[objc_alloc(MEMORY[0x1E4F1A0A8]) initWithRecordIDs:v10];
  if (![(WFCloudKitItemRequest *)self performExpensiveFetchOperations]) {
    [v18 setDesiredKeys:v11];
  }
  [v18 setGroup:v12];
  objc_super v19 = [(WFCloudKitItemRequest *)self xpcActivity];
  id v20 = [v18 configuration];
  [v20 setXpcActivity:v19];

  uint64_t v25 = MEMORY[0x1E4F143A8];
  uint64_t v26 = 3221225472;
  uint64_t v27 = __85__WFCloudKitItemRequest_fetchRecordIDs_desiredKeys_operationGroup_completionHandler___block_invoke;
  __int16 v28 = &unk_1E6552CA0;
  id v29 = v10;
  id v30 = v13;
  id v21 = v13;
  id v22 = v10;
  [v18 setFetchRecordsCompletionBlock:&v25];
  id v23 = [(WFCloudKitItemRequest *)self database];
  [v23 addOperation:v18];

  return v18;
}

void __85__WFCloudKitItemRequest_fetchRecordIDs_desiredKeys_operationGroup_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a2;
  id v7 = getWFCloudKitLogObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = [*(id *)(a1 + 32) count];
    int v9 = 136315394;
    id v10 = "-[WFCloudKitItemRequest fetchRecordIDs:desiredKeys:operationGroup:completionHandler:]_block_invoke";
    __int16 v11 = 2048;
    uint64_t v12 = v8;
    _os_log_impl(&dword_1C7F0A000, v7, OS_LOG_TYPE_INFO, "%s Fetching %lu records by ID completed", (uint8_t *)&v9, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)createTaskCancelledError
{
  return (id)[MEMORY[0x1E4F28C58] errorWithDomain:@"WFCloudKitErrorDomain" code:0 userInfo:0];
}

- (id)deleteItem:(id)a3 completionHandler:(id)a4
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = objc_opt_new();
  id v9 = objc_alloc(MEMORY[0x1E4F1A198]);
  id v10 = [v7 identifier];

  v24[0] = v10;
  __int16 v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
  uint64_t v12 = (void *)[v9 initWithRecordsToSave:0 recordIDsToDelete:v11];

  uint64_t v13 = [(WFCloudKitItemRequest *)self xpcActivity];
  id v14 = [v12 configuration];
  [v14 setXpcActivity:v13];

  [v8 setCloudOperation:v12];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __54__WFCloudKitItemRequest_deleteItem_completionHandler___block_invoke;
  v20[3] = &unk_1E6553B10;
  id v15 = v8;
  id v22 = self;
  id v23 = v6;
  id v21 = v15;
  id v16 = v6;
  [v12 setModifyRecordsCompletionBlock:v20];
  id v17 = [(WFCloudKitItemRequest *)self database];
  [v17 addOperation:v12];

  id v18 = v15;
  return v18;
}

void __54__WFCloudKitItemRequest_deleteItem_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v8 = a4;
  int v5 = [*(id *)(a1 + 32) isCancelled];
  uint64_t v6 = *(void *)(a1 + 48);
  if (v5)
  {
    id v7 = [*(id *)(a1 + 40) createTaskCancelledError];
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);
  }
  else
  {
    (*(void (**)(void, id))(v6 + 16))(*(void *)(a1 + 48), v8);
  }
}

- (id)updateItems:(id)a3 setNilValues:(BOOL)a4 qualityOfService:(int64_t)a5 timeoutIntervalForRequest:(double)a6 completionHandler:(id)a7
{
  id v13 = a3;
  id v14 = a7;
  id v15 = objc_opt_new();
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __111__WFCloudKitItemRequest_updateItems_setNilValues_qualityOfService_timeoutIntervalForRequest_completionHandler___block_invoke;
  v34[3] = &unk_1E6552BD8;
  v34[4] = self;
  v34[5] = a2;
  id v16 = objc_msgSend(v13, "if_map:", v34);
  id v17 = [(WFCloudKitItemRequest *)self container];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __111__WFCloudKitItemRequest_updateItems_setNilValues_qualityOfService_timeoutIntervalForRequest_completionHandler___block_invoke_2;
  v25[3] = &unk_1E6552C78;
  id v30 = v14;
  int64_t v31 = a5;
  id v26 = v16;
  uint64_t v27 = self;
  double v32 = a6;
  id v18 = v15;
  id v28 = v18;
  id v29 = v13;
  BOOL v33 = a4;
  id v19 = v13;
  id v20 = v16;
  id v21 = v14;
  [v17 accountStatusWithCompletionHandler:v25];

  id v22 = v29;
  id v23 = v18;

  return v23;
}

id __111__WFCloudKitItemRequest_updateItems_setNilValues_qualityOfService_timeoutIntervalForRequest_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([v3 conformsToProtocol:&unk_1F232DED0] & 1) == 0)
  {
    uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:*(void *)(a1 + 40), *(void *)(a1 + 32), @"WFCloudKitItemRequest.m", 293, @"Item must conform to WFCloudKitItem protocol: %@", v3 object file lineNumber description];
  }
  id v4 = [(id)objc_opt_class() createRecordFromItem:v3 zoneID:0];

  return v4;
}

void __111__WFCloudKitItemRequest_updateItems_setNilValues_qualityOfService_timeoutIntervalForRequest_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  v22[1] = *MEMORY[0x1E4F143B8];
  if (a2 != 1)
  {
    id v8 = WFLocalizedString(@"In order to do this, you must be signed into iCloud.");
    id v9 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v21 = *MEMORY[0x1E4F28568];
    v22[0] = v8;
    id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
    __int16 v11 = [v9 errorWithDomain:@"WFCloudKitErrorDomain" code:2 userInfo:v10];

    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    goto LABEL_6;
  }
  intptr_t v3 = *(void *)(a1 + 72);
  if ((unint64_t)(v3 + 1) > 0x22) {
    goto LABEL_9;
  }
  if (((1 << (v3 + 1)) & 0x404040400) == 0)
  {
    if (v3 == -1)
    {
      intptr_t v3 = 21;
      goto LABEL_4;
    }
LABEL_9:
    intptr_t v3 = 0;
  }
LABEL_4:
  id v4 = dispatch_get_global_queue(v3, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __111__WFCloudKitItemRequest_updateItems_setNilValues_qualityOfService_timeoutIntervalForRequest_completionHandler___block_invoke_3;
  block[3] = &unk_1E6552C50;
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = *(void **)(a1 + 48);
  id v13 = v5;
  uint64_t v14 = v6;
  uint64_t v18 = *(void *)(a1 + 72);
  uint64_t v19 = *(void *)(a1 + 80);
  id v15 = v7;
  id v17 = *(id *)(a1 + 64);
  id v16 = *(id *)(a1 + 56);
  char v20 = *(unsigned char *)(a1 + 88);
  dispatch_async(v4, block);

  id v8 = v13;
LABEL_6:
}

void __111__WFCloudKitItemRequest_updateItems_setNilValues_qualityOfService_timeoutIntervalForRequest_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = (void *)[objc_alloc(MEMORY[0x1E4F1A198]) initWithRecordsToSave:*(void *)(a1 + 32) recordIDsToDelete:0];
  [v2 setSavePolicy:2];
  intptr_t v3 = [*(id *)(a1 + 40) xpcActivity];
  id v4 = [v2 configuration];
  [v4 setXpcActivity:v3];

  if (*(void *)(a1 + 72) != -1 || *(double *)(a1 + 80) != 0.0)
  {
    id v5 = [v2 configuration];
    [v5 setQualityOfService:*(void *)(a1 + 72)];
    [v5 setTimeoutIntervalForRequest:*(double *)(a1 + 80)];
  }
  [*(id *)(a1 + 48) setCloudOperation:v2];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __111__WFCloudKitItemRequest_updateItems_setNilValues_qualityOfService_timeoutIntervalForRequest_completionHandler___block_invoke_4;
  v9[3] = &unk_1E6552C28;
  id v10 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 64);
  uint64_t v7 = *(void *)(a1 + 40);
  id v13 = v6;
  uint64_t v11 = v7;
  id v12 = *(id *)(a1 + 56);
  char v14 = *(unsigned char *)(a1 + 88);
  [v2 setModifyRecordsCompletionBlock:v9];
  id v8 = [*(id *)(a1 + 40) database];
  [v8 addOperation:v2];
}

void __111__WFCloudKitItemRequest_updateItems_setNilValues_qualityOfService_timeoutIntervalForRequest_completionHandler___block_invoke_4(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a4;
  if ([*(id *)(a1 + 32) isCancelled])
  {
    uint64_t v8 = *(void *)(a1 + 56);
    id v9 = [*(id *)(a1 + 40) createTaskCancelledError];
    (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);
  }
  else if (v7)
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    char v14 = __111__WFCloudKitItemRequest_updateItems_setNilValues_qualityOfService_timeoutIntervalForRequest_completionHandler___block_invoke_5;
    id v15 = &unk_1E6552C00;
    id v16 = *(id *)(a1 + 48);
    char v17 = *(unsigned char *)(a1 + 64);
    [v6 enumerateObjectsUsingBlock:&v12];
    id v10 = getWFCloudKitLogObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = objc_msgSend(v6, "count", v12, v13, v14, v15);
      *(_DWORD *)buf = 136315394;
      uint64_t v19 = "-[WFCloudKitItemRequest updateItems:setNilValues:qualityOfService:timeoutIntervalForRequest:completionHandle"
            "r:]_block_invoke_4";
      __int16 v20 = 2048;
      uint64_t v21 = v11;
      _os_log_impl(&dword_1C7F0A000, v10, OS_LOG_TYPE_INFO, "%s Updated %lu items", buf, 0x16u);
    }

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void __111__WFCloudKitItemRequest_updateItems_setNilValues_qualityOfService_timeoutIntervalForRequest_completionHandler___block_invoke_5(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  id v7 = [v5 objectAtIndexedSubscript:a3];
  +[WFCloudKitItemRequest hydrateItem:v7 withRecord:v6 setNilValues:*(unsigned __int8 *)(a1 + 40)];
}

- (id)updateItems:(id)a3 setNilValues:(BOOL)a4 completionHandler:(id)a5
{
  return [(WFCloudKitItemRequest *)self updateItems:a3 setNilValues:a4 qualityOfService:-1 timeoutIntervalForRequest:a5 completionHandler:0.0];
}

- (id)fetchItemWithID:(id)a3 itemType:(Class)a4 groupName:(id)a5 properties:(id)a6 completionHandler:(id)a7
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  if (([(objc_class *)a4 conformsToProtocol:&unk_1F232DED0] & 1) == 0)
  {
    v36 = [MEMORY[0x1E4F28B00] currentHandler];
    [v36 handleFailureInMethod:a2 object:self file:@"WFCloudKitItemRequest.m" lineNumber:221 description:@"Item type must conform to WFCloudKitItem protocol"];
  }
  id v15 = getWFCloudKitLogObject();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    id v16 = [v12 recordName];
    *(_DWORD *)buf = 136315394;
    v46 = "-[WFCloudKitItemRequest fetchItemWithID:itemType:groupName:properties:completionHandler:]";
    __int16 v47 = 2112;
    v48 = v16;
    _os_log_impl(&dword_1C7F0A000, v15, OS_LOG_TYPE_INFO, "%s Fetching record with ID: %@", buf, 0x16u);
  }
  id v17 = objc_alloc_init(MEMORY[0x1E4F1A218]);
  uint64_t v18 = NSString;
  uint64_t v19 = [v12 recordName];
  __int16 v20 = [v18 stringWithFormat:@"Fetch record and recursive references with ID: %@", v19];
  [v17 setName:v20];

  uint64_t v21 = objc_opt_new();
  id v22 = objc_alloc(MEMORY[0x1E4F1A0A8]);
  id v44 = v12;
  id v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v44 count:1];
  v24 = (void *)[v22 initWithRecordIDs:v23];

  uint64_t v25 = [(WFCloudKitItemRequest *)self xpcActivity];
  id v26 = [v24 configuration];
  [v26 setXpcActivity:v25];

  if (![(WFCloudKitItemRequest *)self performExpensiveFetchOperations])
  {
    uint64_t v27 = [(id)objc_opt_class() desiredKeysFromProperties:v13 itemType:a4];
    [v24 setDesiredKeys:v27];
  }
  [v24 setGroup:v17];
  [v21 setCloudOperation:v24];
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __89__WFCloudKitItemRequest_fetchItemWithID_itemType_groupName_properties_completionHandler___block_invoke;
  v37[3] = &unk_1E6552BB0;
  id v28 = v21;
  id v38 = v28;
  id v39 = self;
  id v42 = v14;
  Class v43 = a4;
  id v40 = v12;
  id v41 = v17;
  id v29 = v17;
  id v30 = v12;
  id v31 = v14;
  [v24 setFetchRecordsCompletionBlock:v37];
  double v32 = [(WFCloudKitItemRequest *)self database];
  [v32 addOperation:v24];

  BOOL v33 = v41;
  id v34 = v28;

  return v34;
}

void __89__WFCloudKitItemRequest_fetchItemWithID_itemType_groupName_properties_completionHandler___block_invoke(id *a1, void *a2, void *a3)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if ([a1[4] isCancelled])
  {
    id v7 = (void (**)(id, void, void *))a1[8];
    uint64_t v8 = [a1[5] createTaskCancelledError];
    v7[2](v7, 0, v8);
  }
  else
  {
    id v9 = [v5 allValues];
    id v10 = [v9 firstObject];

    if (v10)
    {
      uint64_t v11 = [v10 recordType];
      id v12 = [a1[9] recordType];
      char v13 = [v11 isEqualToString:v12];

      if (v13)
      {
        id v14 = objc_alloc_init((Class)a1[9]);
        id v15 = [[WFCloudKitItemRecord alloc] initWithRecord:v10 item:v14];
        id v16 = [a1[5] operationWaitingQueue];
        v26[0] = MEMORY[0x1E4F143A8];
        v26[1] = 3221225472;
        v26[2] = __89__WFCloudKitItemRequest_fetchItemWithID_itemType_groupName_properties_completionHandler___block_invoke_288;
        v26[3] = &unk_1E6552B60;
        id v17 = a1[4];
        id v18 = a1[5];
        id v27 = v17;
        id v28 = v18;
        id v29 = v15;
        id v30 = a1[7];
        id v19 = a1[8];
        id v31 = v14;
        id v32 = v19;
        id v20 = v14;
        uint64_t v21 = v15;
        dispatch_async(v16, v26);
      }
      else
      {
        id v22 = getWFCloudKitLogObject();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
        {
          id v23 = [a1[6] recordName];
          v24 = [v10 recordType];
          uint64_t v25 = [a1[9] recordType];
          *(_DWORD *)buf = 136315906;
          id v34 = "-[WFCloudKitItemRequest fetchItemWithID:itemType:groupName:properties:completionHandler:]_block_invoke";
          __int16 v35 = 2114;
          v36 = v23;
          __int16 v37 = 2114;
          id v38 = v24;
          __int16 v39 = 2114;
          id v40 = v25;
          _os_log_impl(&dword_1C7F0A000, v22, OS_LOG_TYPE_FAULT, "%s Record with identifier %{public}@ is type %{public}@, instead of %{public}@", buf, 0x2Au);
        }
        uint64_t v21 = [MEMORY[0x1E4F28C58] errorWithDomain:@"WFCloudKitErrorDomain" code:1 userInfo:0];
        (*((void (**)(void))a1[8] + 2))();
      }
    }
    else
    {
      (*((void (**)(void))a1[8] + 2))();
    }
  }
}

void __89__WFCloudKitItemRequest_fetchItemWithID_itemType_groupName_properties_completionHandler___block_invoke_288(uint64_t a1)
{
  v16[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) operationQueue];
  intptr_t v3 = [WFCloudKitResolveReferencesOperation alloc];
  uint64_t v4 = *(void *)(a1 + 40);
  v16[0] = *(void *)(a1 + 48);
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  id v6 = [(WFCloudKitResolveReferencesOperation *)v3 initWithRequest:v4 records:v5 operationGroup:*(void *)(a1 + 56) task:*(void *)(a1 + 32)];
  [v2 addOperation:v6];

  id v7 = [*(id *)(a1 + 32) operationQueue];
  [v7 waitUntilAllOperationsAreFinished];

  uint64_t v8 = [*(id *)(a1 + 40) callbackQueue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __89__WFCloudKitItemRequest_fetchItemWithID_itemType_groupName_properties_completionHandler___block_invoke_2;
  v11[3] = &unk_1E65586A0;
  id v12 = *(id *)(a1 + 32);
  id v9 = *(id *)(a1 + 72);
  uint64_t v10 = *(void *)(a1 + 40);
  id v15 = v9;
  uint64_t v13 = v10;
  id v14 = *(id *)(a1 + 64);
  dispatch_async(v8, v11);
}

void __89__WFCloudKitItemRequest_fetchItemWithID_itemType_groupName_properties_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) isCancelled])
  {
    uint64_t v2 = *(void *)(a1 + 56);
    id v10 = [*(id *)(a1 + 40) createTaskCancelledError];
    (*(void (**)(uint64_t, void))(v2 + 16))(v2, 0);
  }
  else
  {
    intptr_t v3 = [*(id *)(a1 + 32) error];

    uint64_t v4 = getWFCloudKitLogObject();
    id v5 = v4;
    if (v3)
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        id v6 = [*(id *)(a1 + 32) error];
        *(_DWORD *)buf = 136315394;
        id v12 = "-[WFCloudKitItemRequest fetchItemWithID:itemType:groupName:properties:completionHandler:]_block_invoke_2";
        __int16 v13 = 2114;
        id v14 = v6;
        _os_log_impl(&dword_1C7F0A000, v5, OS_LOG_TYPE_ERROR, "%s Record fetch and resolve operations encountered error: %{public}@", buf, 0x16u);
      }
      uint64_t v7 = *(void *)(a1 + 56);
      uint64_t v8 = [*(id *)(a1 + 32) error];
      (*(void (**)(uint64_t, void, void *))(v7 + 16))(v7, 0, v8);
    }
    else
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        id v9 = *(void **)(a1 + 48);
        *(_DWORD *)buf = 136315394;
        id v12 = "-[WFCloudKitItemRequest fetchItemWithID:itemType:groupName:properties:completionHandler:]_block_invoke";
        __int16 v13 = 2112;
        id v14 = v9;
        _os_log_impl(&dword_1C7F0A000, v5, OS_LOG_TYPE_INFO, "%s Record fetch and resolve operations completed. Item: %@", buf, 0x16u);
      }

      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
  }
}

void __143__WFCloudKitItemRequest_fetchItemsWithPredicate_itemType_groupName_properties_sortDescriptors_resultsLimit_qualityOfService_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  intptr_t v3 = *(objc_class **)(a1 + 48);
  id v4 = a2;
  id v6 = objc_alloc_init(v3);
  id v5 = [[WFCloudKitItemRecord alloc] initWithRecord:v4 item:v6];

  [*(id *)(a1 + 32) addObject:v5];
  [*(id *)(a1 + 40) addObject:v6];
}

- (id)fetchItemsWithPredicate:(id)a3 itemType:(Class)a4 groupName:(id)a5 properties:(id)a6 completionHandler:(id)a7
{
  return [(WFCloudKitItemRequest *)self fetchItemsWithPredicate:a3 itemType:a4 groupName:a5 properties:a6 sortDescriptors:0 resultsLimit:0 completionHandler:a7];
}

+ (id)recordValueForItemValue:(id)a3 item:(id)a4 property:(id)a5 recordKey:(id)a6 zoneID:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  switch([a5 type])
  {
    case 0:
    case 1:
      id v7 = v11;
      break;
    case 2:
      uint64_t v14 = objc_opt_class();
      uint64_t v15 = WFEnforceClass(v11, v14);
      if (!v15) {
        goto LABEL_12;
      }
      id v16 = objc_alloc(MEMORY[0x1E4F19E50]);
      id v17 = [v15 fileURL];
      id v7 = (id)[v16 initWithFileURL:v17];

      goto LABEL_17;
    case 3:
      id v18 = v11;
      uint64_t v15 = v18;
      if (!v18 || ![v18 conformsToProtocol:&unk_1F232DED0]) {
        goto LABEL_12;
      }
      if (objc_opt_respondsToSelector()) {
        uint64_t v19 = [v12 referenceActionForKey:v13];
      }
      else {
        uint64_t v19 = 0;
      }
      id v22 = objc_alloc(MEMORY[0x1E4F1A348]);
      id v23 = [v15 identifier];
      id v7 = (id)[v22 initWithRecordID:v23 action:v19];

      goto LABEL_17;
    case 4:
      uint64_t v20 = objc_opt_class();
      uint64_t v15 = WFEnforceClass(v11, v20);
      if (v15)
      {
        if (objc_opt_respondsToSelector()) {
          uint64_t v21 = [v12 referenceActionForKey:v13];
        }
        else {
          uint64_t v21 = 0;
        }
        id v7 = (id)[objc_alloc(MEMORY[0x1E4F1A348]) initWithRecordID:v15 action:v21];
      }
      else
      {
LABEL_12:
        id v7 = 0;
      }
LABEL_17:

      break;
    default:
      break;
  }

  return v7;
}

+ (id)itemValueForRecordValue:(id)a3 item:(id)a4 property:(id)a5 resolvedReferences:(id)a6
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  switch([v10 type])
  {
    case 0:
      if (v9) {
        goto LABEL_3;
      }
      id v12 = [v10 nilValue];
      goto LABEL_14;
    case 1:
LABEL_3:
      id v12 = v9;
LABEL_14:
      id v6 = v12;
      break;
    case 2:
      uint64_t v13 = objc_opt_class();
      uint64_t v14 = WFEnforceClass(v9, v13);
      uint64_t v15 = v14;
      if (!v14) {
        goto LABEL_11;
      }
      id v16 = (void *)MEMORY[0x1E4F5A900];
      id v17 = [v14 fileURL];
      id v18 = [v10 fileType];
      uint64_t v19 = [v16 fileWithURL:v17 options:5 ofType:v18];
      goto LABEL_8;
    case 3:
      uint64_t v20 = objc_opt_class();
      uint64_t v21 = WFEnforceClass(v9, v20);
      uint64_t v15 = v21;
      if (!v21) {
        goto LABEL_11;
      }
      id v17 = [v21 recordID];
      id v18 = [v11 objectForKeyedSubscript:v17];
      uint64_t v19 = [v18 item];
LABEL_8:
      id v6 = (void *)v19;

      goto LABEL_12;
    case 4:
      uint64_t v22 = objc_opt_class();
      id v23 = WFEnforceClass(v9, v22);
      uint64_t v15 = v23;
      if (v23)
      {
        id v6 = [v23 recordID];
      }
      else
      {
LABEL_11:
        id v6 = 0;
      }
LABEL_12:

      break;
    default:
      break;
  }

  return v6;
}

+ (id)createRecordFromItem:(id)a3 zoneID:(id)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_opt_class();
  id v9 = [v8 recordType];
  id v10 = [v8 properties];
  if (objc_opt_respondsToSelector()) {
    id v11 = (id)[v6 ensureFileAssets];
  }
  if (objc_opt_respondsToSelector())
  {
    id v12 = [v6 recordSystemFieldsData];

    if (v12)
    {
      uint64_t v13 = [v6 recordSystemFieldsData];
      uint64_t v14 = +[WFCloudKitItemRequest recordFromSystemFieldsData:v13 error:0];

      if (v14)
      {
        uint64_t v15 = [v14 recordID];
        id v16 = [v6 identifier];
        char v17 = [v15 isEqual:v16];

        if (v17) {
          goto LABEL_16;
        }
        id v18 = getWFCloudKitLogObject();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
        {
          uint64_t v19 = [v6 identifier];
          uint64_t v20 = [v14 recordID];
          *(_DWORD *)buf = 136315650;
          id v38 = "+[WFCloudKitItemRequest createRecordFromItem:zoneID:]";
          __int16 v39 = 2114;
          id v40 = v19;
          __int16 v41 = 2114;
          id v42 = v20;
          _os_log_impl(&dword_1C7F0A000, v18, OS_LOG_TYPE_FAULT, "%s CKRecord created from serialized data has different identifier than the WFCloudKitItem it was created for: WFCloudKitItem's is %{public}@, CKRecord's is %{public}@. Creating CKRecord from scratch", buf, 0x20u);
        }
      }
    }
  }
  uint64_t v21 = [v6 identifier];

  if (v21)
  {
    id v22 = objc_alloc(MEMORY[0x1E4F1A2D8]);
    id v23 = [v6 identifier];
    uint64_t v14 = (void *)[v22 initWithRecordType:v9 recordID:v23];
  }
  else
  {
    id v24 = objc_alloc(MEMORY[0x1E4F1A2D8]);
    if (v7) {
      uint64_t v25 = [v24 initWithRecordType:v9 zoneID:v7];
    }
    else {
      uint64_t v25 = [v24 initWithRecordType:v9];
    }
    uint64_t v14 = (void *)v25;
  }
LABEL_16:
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __53__WFCloudKitItemRequest_createRecordFromItem_zoneID___block_invoke;
  v32[3] = &unk_1E6552D68;
  id v36 = a1;
  id v33 = v6;
  id v34 = v7;
  id v26 = v14;
  id v35 = v26;
  id v27 = v7;
  id v28 = v6;
  [v10 enumerateKeysAndObjectsUsingBlock:v32];
  id v29 = v35;
  id v30 = v26;

  return v30;
}

void __53__WFCloudKitItemRequest_createRecordFromItem_zoneID___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([v6 hasConstantValue])
  {
    id v7 = [v6 constantValue];
  }
  else
  {
    uint64_t v8 = *(void **)(a1 + 32);
    id v9 = [v6 name];
    id v7 = [v8 valueForKey:v9];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __53__WFCloudKitItemRequest_createRecordFromItem_zoneID___block_invoke_2;
    v14[3] = &unk_1E6552D40;
    uint64_t v19 = *(void *)(a1 + 56);
    id v15 = *(id *)(a1 + 32);
    id v16 = v6;
    id v17 = v5;
    id v18 = *(id *)(a1 + 40);
    id v10 = objc_msgSend(v7, "if_compactMap:", v14);
  }
  else if (v7)
  {
    id v10 = [*(id *)(a1 + 56) recordValueForItemValue:v7 item:*(void *)(a1 + 32) property:v6 recordKey:v5 zoneID:*(void *)(a1 + 40)];
  }
  else
  {
    id v10 = 0;
  }
  int v11 = [v6 isEncrypted];
  id v12 = *(void **)(a1 + 48);
  if (v11)
  {
    uint64_t v13 = [v12 encryptedValues];
    [v13 setObject:v10 forKey:v5];
  }
  else
  {
    [v12 setObject:v10 forKey:v5];
  }
}

uint64_t __53__WFCloudKitItemRequest_createRecordFromItem_zoneID___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 64) recordValueForItemValue:a2 item:*(void *)(a1 + 32) property:*(void *)(a1 + 40) recordKey:*(void *)(a1 + 48) zoneID:*(void *)(a1 + 56)];
}

+ (id)createRecordIDWithName:(id)a3 zoneID:(id)a4
{
  id v5 = a4;
  id v6 = (objc_class *)MEMORY[0x1E4F1A2F8];
  id v7 = a3;
  id v8 = [v6 alloc];
  if (v5) {
    uint64_t v9 = [v8 initWithRecordName:v7 zoneID:v5];
  }
  else {
    uint64_t v9 = [v8 initWithRecordName:v7];
  }
  id v10 = (void *)v9;

  return v10;
}

+ (void)assignRecordValue:(id)a3 toItem:(id)a4 withProperty:(id)a5 resolvedReferences:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __82__WFCloudKitItemRequest_assignRecordValue_toItem_withProperty_resolvedReferences___block_invoke;
    v19[3] = &unk_1E6552D18;
    id v23 = a1;
    id v20 = v10;
    id v21 = v11;
    id v22 = v12;
    uint64_t v14 = objc_msgSend(v13, "if_compactMap:", v19);

    if (!v14) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  uint64_t v14 = [a1 itemValueForRecordValue:v13 item:v10 property:v11 resolvedReferences:v12];

  if (v14)
  {
LABEL_5:
    id v15 = v10;
    id v16 = [v11 name];
    [v15 willChangeValueForKey:v16];

    id v17 = [v11 name];
    [v15 setValue:v14 forKey:v17];

    id v18 = [v11 name];
    [v15 didChangeValueForKey:v18];
  }
LABEL_6:
}

uint64_t __82__WFCloudKitItemRequest_assignRecordValue_toItem_withProperty_resolvedReferences___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 56) itemValueForRecordValue:a2 item:*(void *)(a1 + 32) property:*(void *)(a1 + 40) resolvedReferences:*(void *)(a1 + 48)];
}

+ (void)hydrateItem:(id)a3 withRecord:(id)a4 resolvedReferences:(id)a5 setNilValues:(BOOL)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = [(id)objc_opt_class() properties];
  uint64_t v14 = [v11 recordID];
  [v10 setValue:v14 forKey:@"identifier"];

  if (objc_opt_respondsToSelector())
  {
    id v15 = [v11 creationDate];
    id v16 = [v11 modificationDate];
    id v17 = [v11 creatorUserRecordID];
    id v18 = [v17 recordName];
    [v10 setCreatedAt:v15 modifiedAt:v16 createdBy:v18];
  }
  if (objc_opt_respondsToSelector())
  {
    uint64_t v19 = +[WFCloudKitItemRequest systemFieldsDataFromRecord:v11 error:0];
    [v10 setRecordSystemFieldsData:v19];
  }
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __80__WFCloudKitItemRequest_hydrateItem_withRecord_resolvedReferences_setNilValues___block_invoke;
  v23[3] = &unk_1E6552CF0;
  BOOL v28 = a6;
  id v24 = v11;
  id v25 = v10;
  id v26 = v12;
  id v27 = a1;
  id v20 = v12;
  id v21 = v10;
  id v22 = v11;
  [v13 enumerateKeysAndObjectsUsingBlock:v23];
}

void __80__WFCloudKitItemRequest_hydrateItem_withRecord_resolvedReferences_setNilValues___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  int v6 = [v5 isEncrypted];
  id v7 = *(void **)(a1 + 32);
  if (v6)
  {
    id v8 = [v7 encryptedValues];
    uint64_t v9 = [v8 objectForKey:v10];

    if (!v9)
    {
LABEL_5:
      if (!*(unsigned char *)(a1 + 64)) {
        goto LABEL_7;
      }
    }
  }
  else
  {
    uint64_t v9 = [v7 objectForKey:v10];
    if (!v9) {
      goto LABEL_5;
    }
  }
  [*(id *)(a1 + 56) assignRecordValue:v9 toItem:*(void *)(a1 + 40) withProperty:v5 resolvedReferences:*(void *)(a1 + 48)];
LABEL_7:
}

+ (id)recordFromSystemFieldsData:(id)a3 error:(id *)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = (objc_class *)MEMORY[0x1E4F28DC0];
  id v6 = a3;
  id v12 = 0;
  id v7 = (void *)[[v5 alloc] initForReadingFromData:v6 error:&v12];

  id v8 = v12;
  [v7 setRequiresSecureCoding:1];
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F1A2D8]) initWithCoder:v7];
  [v7 finishDecoding];
  if (!v9)
  {
    id v10 = getWFCloudKitLogObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v14 = "+[WFCloudKitItemRequest recordFromSystemFieldsData:error:]";
      __int16 v15 = 2114;
      id v16 = v8;
      _os_log_impl(&dword_1C7F0A000, v10, OS_LOG_TYPE_ERROR, "%s Failed to decode record from system fields data: %{public}@", buf, 0x16u);
    }

    if (a4) {
      *a4 = v8;
    }
  }

  return v9;
}

+ (id)systemFieldsDataFromRecord:(id)a3 error:(id *)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = (objc_class *)MEMORY[0x1E4F28DB0];
  id v6 = a3;
  id v7 = (void *)[[v5 alloc] initRequiringSecureCoding:1];
  [v6 encodeSystemFieldsWithCoder:v7];

  [v7 finishEncoding];
  id v8 = [v7 encodedData];
  uint64_t v9 = [v7 error];
  if (!v8)
  {
    id v10 = getWFCloudKitLogObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v12 = 136315394;
      id v13 = "+[WFCloudKitItemRequest systemFieldsDataFromRecord:error:]";
      __int16 v14 = 2114;
      __int16 v15 = v9;
      _os_log_impl(&dword_1C7F0A000, v10, OS_LOG_TYPE_ERROR, "%s Failed to encode system fields data from record: %{public}@", (uint8_t *)&v12, 0x16u);
    }

    if (a4) {
      *a4 = v9;
    }
  }

  return v8;
}

+ (void)hydrateItem:(id)a3 withRecord:(id)a4 setNilValues:(BOOL)a5
{
}

@end