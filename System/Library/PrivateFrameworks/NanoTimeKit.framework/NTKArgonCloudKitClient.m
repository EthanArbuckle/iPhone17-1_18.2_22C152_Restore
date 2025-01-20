@interface NTKArgonCloudKitClient
+ (id)sharedClientQueue;
- (CKDatabase)database;
- (CKRecordZoneID)recordZoneID;
- (NSError)recordZoneError;
- (NSString)debugDescription;
- (NSString)zoneName;
- (NSURL)temporaryStorageURL;
- (NTKArgonCloudKitClient)initWithCloudKitDatabase:(id)a3 temporaryStorageURL:(id)a4 zoneName:(id)a5;
- (NTKArgonCloudKitClient)initWithCloudKitDatabase:(id)a3 zoneName:(id)a4;
- (OS_dispatch_queue)internalQueue;
- (void)_fetchNewRecordsSinceChangeToken:(id)a3 forReason:(int64_t)a4 attemptNumber:(unint64_t)a5 completion:(id)a6;
- (void)_publishRecord:(id)a3 completion:(id)a4;
- (void)_unpublishRecordsOfType:(id)a3 matchingPredicate:(id)a4 completion:(id)a5;
- (void)_unpublishRecordsWithPartialQueryOperation:(id)a3 accumulatedRecords:(id)a4 completion:(id)a5;
- (void)fetchNewRecordsSinceChangeToken:(id)a3 forReason:(int64_t)a4 completion:(id)a5;
- (void)publishKeyDescriptor:(id)a3 completion:(id)a4;
- (void)requestIdentifierTokenForCurrentUserWithCompletion:(id)a3;
- (void)setInternalQueue:(id)a3;
- (void)setRecordZoneError:(id)a3;
- (void)setRecordZoneID:(id)a3;
- (void)unpublishKeyDescriptor:(id)a3 completion:(id)a4;
@end

@implementation NTKArgonCloudKitClient

+ (id)sharedClientQueue
{
  if (sharedClientQueue_onceToken != -1) {
    dispatch_once(&sharedClientQueue_onceToken, &__block_literal_global_166);
  }
  v2 = (void *)sharedClientQueue_queue;
  return v2;
}

void __43__NTKArgonCloudKitClient_sharedClientQueue__block_invoke()
{
  v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.nanotimekit.facesupport.CloudKitClient.internalQueue", v2);
  v1 = (void *)sharedClientQueue_queue;
  sharedClientQueue_queue = (uint64_t)v0;
}

- (NTKArgonCloudKitClient)initWithCloudKitDatabase:(id)a3 zoneName:(id)a4
{
  v6 = NSString;
  v7 = (void *)MEMORY[0x1E4F29128];
  id v8 = a4;
  id v9 = a3;
  v10 = [v7 UUID];
  v11 = [v10 UUIDString];
  v12 = [v6 stringWithFormat:@"ArgonCloudKitClient-%@", v11];

  v13 = (void *)MEMORY[0x1E4F1CB10];
  v14 = NSTemporaryDirectory();
  v15 = [v13 fileURLWithPath:v14];
  v16 = [v15 URLByAppendingPathComponent:v12];

  v17 = [(NTKArgonCloudKitClient *)self initWithCloudKitDatabase:v9 temporaryStorageURL:v16 zoneName:v8];
  return v17;
}

- (NTKArgonCloudKitClient)initWithCloudKitDatabase:(id)a3 temporaryStorageURL:(id)a4 zoneName:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v23.receiver = self;
  v23.super_class = (Class)NTKArgonCloudKitClient;
  v12 = [(NTKArgonCloudKitClient *)&v23 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_database, a3);
    uint64_t v14 = [v11 copy];
    zoneName = v13->_zoneName;
    v13->_zoneName = (NSString *)v14;

    uint64_t v16 = [v10 copy];
    temporaryStorageURL = v13->_temporaryStorageURL;
    v13->_temporaryStorageURL = (NSURL *)v16;

    uint64_t v18 = +[NTKArgonCloudKitClient sharedClientQueue];
    internalQueue = v13->_internalQueue;
    v13->_internalQueue = (OS_dispatch_queue *)v18;

    uint64_t v20 = [objc_alloc(MEMORY[0x1E4F1A320]) initWithZoneName:v13->_zoneName ownerName:@"_defaultOwner"];
    recordZoneID = v13->_recordZoneID;
    v13->_recordZoneID = (CKRecordZoneID *)v20;
  }
  return v13;
}

- (NSString)debugDescription
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(NTKArgonCloudKitClient *)self zoneName];
  v7 = [v3 stringWithFormat:@"<%@: %p, zoneName=%@>", v5, self, v6];

  return (NSString *)v7;
}

- (void)requestIdentifierTokenForCurrentUserWithCompletion:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134349056;
    uint64_t v16 = self;
    _os_log_impl(&dword_1BC5A9000, v5, OS_LOG_TYPE_DEFAULT, "CloudKit Client %{public}p: Fetching user identifier token.", buf, 0xCu);
  }

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __77__NTKArgonCloudKitClient_requestIdentifierTokenForCurrentUserWithCompletion___block_invoke;
  aBlock[3] = &unk_1E62C9978;
  aBlock[4] = self;
  id v14 = v4;
  id v6 = v4;
  v7 = _Block_copy(aBlock);
  id v8 = [MEMORY[0x1E4F1A0A8] fetchCurrentUserRecordOperation];
  [v8 setPerRecordCompletionBlock:&__block_literal_global_30_0];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __77__NTKArgonCloudKitClient_requestIdentifierTokenForCurrentUserWithCompletion___block_invoke_4;
  v11[3] = &unk_1E62C99C0;
  id v12 = v7;
  id v9 = v7;
  [v8 setFetchRecordsCompletionBlock:v11];
  id v10 = [(NTKArgonCloudKitClient *)self database];
  [v10 addOperation:v8];
}

void __77__NTKArgonCloudKitClient_requestIdentifierTokenForCurrentUserWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!v5)
  {
    uint64_t v7 = _NTKArgonCloudKitClientError(100, v6);

    id v6 = (id)v7;
  }
  id v8 = [*(id *)(a1 + 32) internalQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__NTKArgonCloudKitClient_requestIdentifierTokenForCurrentUserWithCompletion___block_invoke_2;
  block[3] = &unk_1E62C22B8;
  id v9 = *(id *)(a1 + 40);
  id v15 = v6;
  id v16 = v9;
  id v14 = v5;
  id v10 = v6;
  id v11 = v5;
  dispatch_block_t v12 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, block);
  dispatch_async(v8, v12);
}

uint64_t __77__NTKArgonCloudKitClient_requestIdentifierTokenForCurrentUserWithCompletion___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __77__NTKArgonCloudKitClient_requestIdentifierTokenForCurrentUserWithCompletion___block_invoke_4(uint64_t a1, void *a2)
{
  if (a2)
  {
    v3 = [a2 allKeys];
    id v6 = [v3 firstObject];

    id v4 = [v6 recordName];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    id v5 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v5();
  }
}

- (void)fetchNewRecordsSinceChangeToken:(id)a3 forReason:(int64_t)a4 completion:(id)a5
{
}

- (void)_fetchNewRecordsSinceChangeToken:(id)a3 forReason:(int64_t)a4 attemptNumber:(unint64_t)a5 completion:(id)a6
{
  v59[1] = *MEMORY[0x1E4F143B8];
  id v10 = (uint64_t (*)(uint64_t, uint64_t))a3;
  id v11 = a6;
  dispatch_block_t v12 = _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v14 = NTKArgonStringForFetchReason(a4, v13);
    *(_DWORD *)buf = 134349570;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v14;
    *(_WORD *)&buf[22] = 2114;
    v54 = v10;
    _os_log_impl(&dword_1BC5A9000, v12, OS_LOG_TYPE_DEFAULT, "CloudKit Client %{public}p: Requesting new records for reason %{public}@ starting with change %{public}@.", buf, 0x20u);
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __94__NTKArgonCloudKitClient__fetchNewRecordsSinceChangeToken_forReason_attemptNumber_completion___block_invoke;
  aBlock[3] = &unk_1E62C9A10;
  unint64_t v51 = a5;
  int64_t v52 = a4;
  aBlock[4] = self;
  id v37 = v11;
  id v50 = v37;
  id v15 = _Block_copy(aBlock);
  id v16 = objc_alloc_init(MEMORY[0x1E4F1A218]);
  uint64_t v18 = NTKArgonStringForFetchReason(a4, v17);
  [v16 setName:v18];

  v19 = [v16 defaultConfiguration];
  [v19 setPreferAnonymousRequests:1];

  uint64_t v20 = [(NTKArgonCloudKitClient *)self recordZoneID];
  LODWORD(v19) = v20 == 0;

  if (v19)
  {
    v24 = _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      -[NTKArgonCloudKitClient _fetchNewRecordsSinceChangeToken:forReason:attemptNumber:completion:](self, v24);
    }

    id v21 = [(NTKArgonCloudKitClient *)self recordZoneError];
    (*((void (**)(void *, void, void, id))v15 + 2))(v15, 0, 0, v21);
  }
  else
  {
    id v21 = objc_alloc_init(MEMORY[0x1E4F1A060]);
    if (v10)
    {
      id v48 = 0;
      v22 = objc_msgSend(MEMORY[0x1E4F28DC0], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v10, &v48, v37);
      id v23 = v48;
      if (v22)
      {
        [v21 setPreviousServerChangeToken:v22];
      }
      else
      {
        v25 = _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
          -[NTKArgonCloudKitClient _fetchNewRecordsSinceChangeToken:forReason:attemptNumber:completion:]((uint64_t)self, v25);
        }
      }
    }
    id v26 = objc_alloc(MEMORY[0x1E4F1A070]);
    v27 = [(NTKArgonCloudKitClient *)self recordZoneID];
    v59[0] = v27;
    v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v59 count:1];
    v29 = [(NTKArgonCloudKitClient *)self recordZoneID];
    v57 = v29;
    id v58 = v21;
    v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v58 forKeys:&v57 count:1];
    v31 = (void *)[v26 initWithRecordZoneIDs:v28 configurationsByRecordZoneID:v30];

    [v31 setGroup:v16];
    v32 = [v31 configuration];
    [v32 setPreferAnonymousRequests:1];

    id v33 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    v46[0] = MEMORY[0x1E4F143A8];
    v46[1] = 3221225472;
    v46[2] = __94__NTKArgonCloudKitClient__fetchNewRecordsSinceChangeToken_forReason_attemptNumber_completion___block_invoke_41;
    v46[3] = &unk_1E62C9A38;
    v46[4] = self;
    id v34 = v33;
    id v47 = v34;
    [v31 setRecordChangedBlock:v46];
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v54 = __Block_byref_object_copy__54;
    v55 = __Block_byref_object_dispose__54;
    id v56 = 0;
    v44[0] = 0;
    v44[1] = v44;
    v44[2] = 0x3032000000;
    v44[3] = __Block_byref_object_copy__54;
    v44[4] = __Block_byref_object_dispose__54;
    id v45 = 0;
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __94__NTKArgonCloudKitClient__fetchNewRecordsSinceChangeToken_forReason_attemptNumber_completion___block_invoke_50;
    v43[3] = &unk_1E62C9A60;
    v43[4] = self;
    v43[5] = v44;
    v43[6] = buf;
    [v31 setRecordZoneFetchCompletionBlock:v43];
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __94__NTKArgonCloudKitClient__fetchNewRecordsSinceChangeToken_forReason_attemptNumber_completion___block_invoke_55;
    v38[3] = &unk_1E62C9A88;
    v41 = buf;
    v38[4] = self;
    id v40 = v15;
    id v35 = v34;
    id v39 = v35;
    v42 = v44;
    [v31 setFetchRecordZoneChangesCompletionBlock:v38];
    v36 = [(NTKArgonCloudKitClient *)self database];
    [v36 addOperation:v31];

    _Block_object_dispose(v44, 8);
    _Block_object_dispose(buf, 8);
  }
}

void __94__NTKArgonCloudKitClient__fetchNewRecordsSinceChangeToken_forReason_attemptNumber_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = [v9 domain];
  int v11 = [v10 isEqualToString:*MEMORY[0x1E4F19C40]];

  if (v11)
  {
    dispatch_block_t v12 = [v9 userInfo];
    uint64_t v13 = [v12 objectForKey:*MEMORY[0x1E4F19CD8]];

    id v14 = [v13 allValues];
    id v15 = [v14 firstObject];
    if ([v15 code] == 21 && !*(void *)(a1 + 48))
    {
      [*(id *)(a1 + 32) _fetchNewRecordsSinceChangeToken:0 forReason:*(void *)(a1 + 56) attemptNumber:1 completion:*(void *)(a1 + 40)];

      goto LABEL_9;
    }
  }
  if (v9)
  {
    id v16 = _NTKArgonCloudKitClientError(103, v9);
  }
  else
  {
    id v16 = 0;
  }
  uint64_t v17 = [*(id *)(a1 + 32) internalQueue];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __94__NTKArgonCloudKitClient__fetchNewRecordsSinceChangeToken_forReason_attemptNumber_completion___block_invoke_2;
  v19[3] = &unk_1E62C99E8;
  id v23 = *(id *)(a1 + 40);
  id v20 = v7;
  id v21 = v8;
  id v9 = v16;
  id v22 = v9;
  dispatch_block_t v18 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, v19);
  dispatch_async(v17, v18);

LABEL_9:
}

uint64_t __94__NTKArgonCloudKitClient__fetchNewRecordsSinceChangeToken_forReason_attemptNumber_completion___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6]);
}

void __94__NTKArgonCloudKitClient__fetchNewRecordsSinceChangeToken_forReason_attemptNumber_completion___block_invoke_41(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 recordType];
  int v5 = [v4 isEqualToString:NTKArgonCloudKitRecordTypeBundleDescriptor];

  if (v5)
  {
    id v6 = [v3 objectForKeyedSubscript:@"fileName"];
    id v7 = _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v11 = 134349314;
      uint64_t v12 = v8;
      __int16 v13 = 2114;
      id v14 = v6;
      _os_log_impl(&dword_1BC5A9000, v7, OS_LOG_TYPE_DEFAULT, "CloudKit Client %{public}p: Found bundle descriptor record for %{public}@.", (uint8_t *)&v11, 0x16u);
    }

    id v9 = [v3 objectForKeyedSubscript:@"key"];
    id v10 = [[NTKArgonKeyDescriptor alloc] initWithKey:v9 fileName:v6];
    [*(id *)(a1 + 40) addObject:v10];
  }
  else
  {
    id v6 = _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __94__NTKArgonCloudKitClient__fetchNewRecordsSinceChangeToken_forReason_attemptNumber_completion___block_invoke_41_cold_1();
    }
  }
}

void __94__NTKArgonCloudKitClient__fetchNewRecordsSinceChangeToken_forReason_attemptNumber_completion___block_invoke_50(void *a1, uint64_t a2, void *a3, uint64_t a4, int a5, void *a6)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a6;
  int v11 = _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = "YES";
    uint64_t v13 = a1[4];
    if (!v9) {
      uint64_t v12 = "NO";
    }
    *(_DWORD *)buf = 134349314;
    uint64_t v24 = v13;
    __int16 v25 = 2080;
    id v26 = v12;
    _os_log_impl(&dword_1BC5A9000, v11, OS_LOG_TYPE_DEFAULT, "CloudKit Client %{public}p: Record zone changes query complete. Change token received: %s.", buf, 0x16u);
  }

  if (a5)
  {
    id v14 = _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      __94__NTKArgonCloudKitClient__fetchNewRecordsSinceChangeToken_forReason_attemptNumber_completion___block_invoke_50_cold_2((uint64_t)a1, v14);
    }
  }
  if (v10)
  {
    uint64_t v15 = *(void *)(a1[6] + 8);
    id v16 = v10;
    id v17 = *(id *)(v15 + 40);
    *(void *)(v15 + 40) = v16;
  }
  else
  {
    if (!v9) {
      goto LABEL_12;
    }
    id v22 = 0;
    uint64_t v18 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v9 requiringSecureCoding:1 error:&v22];
    id v17 = v22;
    uint64_t v19 = *(void *)(a1[5] + 8);
    id v20 = *(void **)(v19 + 40);
    *(void *)(v19 + 40) = v18;

    if (!*(void *)(*(void *)(a1[5] + 8) + 40))
    {
      id v21 = _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        __94__NTKArgonCloudKitClient__fetchNewRecordsSinceChangeToken_forReason_attemptNumber_completion___block_invoke_50_cold_1();
      }
    }
  }

LABEL_12:
}

void __94__NTKArgonCloudKitClient__fetchNewRecordsSinceChangeToken_forReason_attemptNumber_completion___block_invoke_55(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
LABEL_4:
    id v6 = _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __94__NTKArgonCloudKitClient__fetchNewRecordsSinceChangeToken_forReason_attemptNumber_completion___block_invoke_55_cold_1();
    }

    id v7 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    goto LABEL_7;
  }
  id v5 = *(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  if (v5) {
    goto LABEL_4;
  }
  uint64_t v8 = _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = [*(id *)(a1 + 40) count];
    int v12 = 134349312;
    uint64_t v13 = v9;
    __int16 v14 = 2048;
    uint64_t v15 = v10;
    _os_log_impl(&dword_1BC5A9000, v8, OS_LOG_TYPE_DEFAULT, "CloudKit Client %{public}p: Final record zone changes callback fired. Found %ld keys. No error detected!", (uint8_t *)&v12, 0x16u);
  }

  uint64_t v11 = *(void *)(a1 + 48);
  id v5 = [MEMORY[0x1E4F1CAD0] setWithSet:*(void *)(a1 + 40)];
  id v7 = *(void (**)(void))(v11 + 16);
LABEL_7:
  v7();
}

- (void)_unpublishRecordsWithPartialQueryOperation:(id)a3 accumulatedRecords:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  uint64_t v11 = [v10 group];
  int v12 = [v10 zoneID];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __99__NTKArgonCloudKitClient__unpublishRecordsWithPartialQueryOperation_accumulatedRecords_completion___block_invoke;
  v28[3] = &unk_1E62C9AB0;
  id v13 = v8;
  id v29 = v13;
  [v10 setRecordFetchedBlock:v28];
  uint64_t v19 = MEMORY[0x1E4F143A8];
  uint64_t v20 = 3221225472;
  id v21 = __99__NTKArgonCloudKitClient__unpublishRecordsWithPartialQueryOperation_accumulatedRecords_completion___block_invoke_2;
  id v22 = &unk_1E62C9B28;
  id v23 = v11;
  id v24 = v12;
  __int16 v25 = self;
  id v26 = v13;
  id v27 = v9;
  id v14 = v9;
  id v15 = v13;
  id v16 = v12;
  id v17 = v11;
  [v10 setQueryCompletionBlock:&v19];
  uint64_t v18 = [(NTKArgonCloudKitClient *)self database];
  [v18 addOperation:v10];
}

uint64_t __99__NTKArgonCloudKitClient__unpublishRecordsWithPartialQueryOperation_accumulatedRecords_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

void __99__NTKArgonCloudKitClient__unpublishRecordsWithPartialQueryOperation_accumulatedRecords_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5)
  {
    id v8 = (void *)[objc_alloc(MEMORY[0x1E4F1A2B8]) initWithCursor:v5];
    [v8 setGroup:*(void *)(a1 + 32)];
    [v8 setZoneID:*(void *)(a1 + 40)];
    [*(id *)(a1 + 48) _unpublishRecordsWithPartialQueryOperation:v8 accumulatedRecords:*(void *)(a1 + 56) completion:*(void *)(a1 + 64)];
  }
  else if (v6)
  {
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
  else
  {
    id v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 56), "count"));
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v10 = *(id *)(a1 + 56);
    uint64_t v11 = [v10 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v24 != v13) {
            objc_enumerationMutation(v10);
          }
          id v15 = [*(id *)(*((void *)&v23 + 1) + 8 * i) recordID];
          [v9 addObject:v15];
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v12);
    }

    id v16 = (void *)[objc_alloc(MEMORY[0x1E4F1A198]) initWithRecordsToSave:0 recordIDsToDelete:v9];
    [v16 setGroup:*(void *)(a1 + 32)];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __99__NTKArgonCloudKitClient__unpublishRecordsWithPartialQueryOperation_accumulatedRecords_completion___block_invoke_3;
    v22[3] = &unk_1E62C9AD8;
    v22[4] = *(void *)(a1 + 48);
    [v16 setPerRecordCompletionBlock:v22];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __99__NTKArgonCloudKitClient__unpublishRecordsWithPartialQueryOperation_accumulatedRecords_completion___block_invoke_62;
    v19[3] = &unk_1E62C9B00;
    id v20 = v9;
    id v21 = *(id *)(a1 + 64);
    id v17 = v9;
    [v16 setModifyRecordsCompletionBlock:v19];
    uint64_t v18 = [*(id *)(a1 + 48) database];
    [v18 addOperation:v16];
  }
}

void __99__NTKArgonCloudKitClient__unpublishRecordsWithPartialQueryOperation_accumulatedRecords_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      int v10 = 134349570;
      uint64_t v11 = v9;
      __int16 v12 = 2114;
      id v13 = v5;
      __int16 v14 = 2114;
      id v15 = v6;
      _os_log_error_impl(&dword_1BC5A9000, v7, OS_LOG_TYPE_ERROR, "CloudKit Client %{public}p: Failed to unpublish record %{public}@: %{public}@.", (uint8_t *)&v10, 0x20u);
    }
  }
  else
  {
    if (!v5) {
      goto LABEL_5;
    }
    id v7 = _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v10 = 134349314;
      uint64_t v11 = v8;
      __int16 v12 = 2114;
      id v13 = v5;
      _os_log_impl(&dword_1BC5A9000, v7, OS_LOG_TYPE_DEFAULT, "CloudKit Client %{public}p: Unpublished record %{public}@.", (uint8_t *)&v10, 0x16u);
    }
  }

LABEL_5:
}

void __99__NTKArgonCloudKitClient__unpublishRecordsWithPartialQueryOperation_accumulatedRecords_completion___block_invoke_62(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v9 = a3;
  id v6 = a4;
  if ([v9 isEqualToArray:*(void *)(a1 + 32)] && objc_msgSend(v9, "count"))
  {
    (*(void (**)(void, BOOL, id))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v6 == 0, v6);
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 40);
    uint64_t v8 = _NTKArgonCloudKitClientError(204, v6);
    (*(void (**)(uint64_t, void, void *))(v7 + 16))(v7, 0, v8);
  }
}

- (void)_unpublishRecordsOfType:(id)a3 matchingPredicate:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  int v10 = (objc_class *)MEMORY[0x1E4F1A218];
  id v11 = a5;
  id v12 = objc_alloc_init(v10);
  [v12 setName:@"UserActionExplicit"];
  id v13 = [(NTKArgonCloudKitClient *)self recordZoneID];

  if (v13)
  {
    id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v15 = (void *)[objc_alloc(MEMORY[0x1E4F1A2A0]) initWithRecordType:v8 predicate:v9];
    uint64_t v16 = (void *)[objc_alloc(MEMORY[0x1E4F1A2B8]) initWithQuery:v15];
    [v16 setGroup:v12];
    id v17 = [(NTKArgonCloudKitClient *)self recordZoneID];
    [v16 setZoneID:v17];

    [(NTKArgonCloudKitClient *)self _unpublishRecordsWithPartialQueryOperation:v16 accumulatedRecords:v14 completion:v11];
  }
  else
  {
    uint64_t v18 = _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[NTKArgonCloudKitClient _unpublishRecordsOfType:matchingPredicate:completion:](self);
    }

    (*((void (**)(id, uint64_t, void))v11 + 2))(v11, 1, 0);
  }
}

- (void)_publishRecord:(id)a3 completion:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [(NTKArgonCloudKitClient *)self zoneName];
    *(_DWORD *)buf = 134349570;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v6;
    __int16 v28 = 2114;
    id v29 = v9;
    _os_log_impl(&dword_1BC5A9000, v8, OS_LOG_TYPE_DEFAULT, "CloudKit Client %{public}p: Publishing record %{public}@ in zone %{public}@.", buf, 0x20u);
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __52__NTKArgonCloudKitClient__publishRecord_completion___block_invoke;
  aBlock[3] = &unk_1E62C9B78;
  aBlock[4] = self;
  id v24 = v6;
  id v25 = v7;
  id v10 = v7;
  id v11 = v6;
  id v12 = _Block_copy(aBlock);
  id v13 = objc_alloc_init(MEMORY[0x1E4F1A218]);
  [v13 setName:@"UserActionExplicit"];
  id v14 = objc_alloc(MEMORY[0x1E4F1A198]);
  id v26 = v11;
  id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v26 count:1];
  uint64_t v16 = (void *)[v14 initWithRecordsToSave:v15 recordIDsToDelete:0];

  [v16 setGroup:v13];
  *(void *)buf = 0;
  *(void *)&buf[8] = 0;
  id v17 = [MEMORY[0x1E4F29128] UUID];
  [v17 getUUIDBytes:buf];

  uint64_t v18 = [MEMORY[0x1E4F1C9B8] dataWithBytes:buf length:16];
  [v16 setClientChangeTokenData:v18];

  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __52__NTKArgonCloudKitClient__publishRecord_completion___block_invoke_2;
  v21[3] = &unk_1E62C9BA0;
  id v22 = v12;
  id v19 = v12;
  [v16 setModifyRecordsCompletionBlock:v21];
  id v20 = [(NTKArgonCloudKitClient *)self database];
  [v20 addOperation:v16];
}

void __52__NTKArgonCloudKitClient__publishRecord_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    id v6 = _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = *(void **)(a1 + 32);
      uint64_t v8 = *(void *)(a1 + 40);
      id v9 = [v7 zoneName];
      *(_DWORD *)buf = 134349570;
      id v20 = v7;
      __int16 v21 = 2114;
      uint64_t v22 = v8;
      __int16 v23 = 2114;
      id v24 = v9;
      _os_log_impl(&dword_1BC5A9000, v6, OS_LOG_TYPE_DEFAULT, "CloudKit Client %{public}p: Published record %{public}@ in zone %{public}@.", buf, 0x20u);
    }
  }
  else
  {
    uint64_t v10 = _NTKArgonCloudKitClientError(202, v5);

    id v6 = _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __52__NTKArgonCloudKitClient__publishRecord_completion___block_invoke_cold_1();
    }
    id v5 = (id)v10;
  }

  id v11 = [*(id *)(a1 + 32) internalQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__NTKArgonCloudKitClient__publishRecord_completion___block_invoke_69;
  block[3] = &unk_1E62C9B50;
  id v12 = *(id *)(a1 + 48);
  char v18 = a2;
  id v16 = v5;
  id v17 = v12;
  id v13 = v5;
  dispatch_block_t v14 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, block);
  dispatch_async(v11, v14);
}

uint64_t __52__NTKArgonCloudKitClient__publishRecord_completion___block_invoke_69(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

uint64_t __52__NTKArgonCloudKitClient__publishRecord_completion___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void, BOOL, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a4 == 0, a4);
}

- (void)publishKeyDescriptor:(id)a3 completion:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [(NTKArgonCloudKitClient *)self zoneName];
    *(_DWORD *)buf = 134349570;
    id v26 = self;
    __int16 v27 = 2114;
    id v28 = v6;
    __int16 v29 = 2114;
    uint64_t v30 = v9;
    _os_log_impl(&dword_1BC5A9000, v8, OS_LOG_TYPE_DEFAULT, "CloudKit Client %{public}p: Publishing key descriptor %{public}@ in zone %{public}@.", buf, 0x20u);
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __58__NTKArgonCloudKitClient_publishKeyDescriptor_completion___block_invoke;
  aBlock[3] = &unk_1E62C9B78;
  aBlock[4] = self;
  id v10 = v6;
  id v23 = v10;
  id v11 = v7;
  id v24 = v11;
  id v12 = (void (**)(void *, void, void *))_Block_copy(aBlock);
  id v13 = objc_alloc_init(MEMORY[0x1E4F1A218]);
  [v13 setName:@"UserActionExplicit"];
  dispatch_block_t v14 = [(NTKArgonCloudKitClient *)self recordZoneID];

  if (v14)
  {
    id v15 = objc_alloc(MEMORY[0x1E4F1A2D8]);
    uint64_t v16 = NTKArgonCloudKitRecordTypeBundleDescriptor;
    id v17 = [(NTKArgonCloudKitClient *)self recordZoneID];
    char v18 = (void *)[v15 initWithRecordType:v16 zoneID:v17];

    id v19 = [v10 fileName];
    [v18 setObject:v19 forKeyedSubscript:@"fileName"];

    id v20 = [v10 key];
    [v18 setObject:v20 forKeyedSubscript:@"key"];

    [(NTKArgonCloudKitClient *)self _publishRecord:v18 completion:v12];
  }
  else
  {
    __int16 v21 = _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[NTKArgonCloudKitClient publishKeyDescriptor:completion:](self);
    }

    char v18 = [(NTKArgonCloudKitClient *)self recordZoneError];
    v12[2](v12, 0, v18);
  }
}

void __58__NTKArgonCloudKitClient_publishKeyDescriptor_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    id v6 = _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = *(void **)(a1 + 32);
      uint64_t v8 = *(void *)(a1 + 40);
      id v9 = [v7 zoneName];
      *(_DWORD *)buf = 134349570;
      id v20 = v7;
      __int16 v21 = 2114;
      uint64_t v22 = v8;
      __int16 v23 = 2114;
      id v24 = v9;
      _os_log_impl(&dword_1BC5A9000, v6, OS_LOG_TYPE_DEFAULT, "CloudKit Client %{public}p: Published key descriptor %{public}@ in zone %{public}@.", buf, 0x20u);
    }
  }
  else
  {
    uint64_t v10 = _NTKArgonCloudKitClientError(202, v5);

    id v6 = _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __58__NTKArgonCloudKitClient_publishKeyDescriptor_completion___block_invoke_cold_1();
    }
    id v5 = (id)v10;
  }

  id v11 = [*(id *)(a1 + 32) internalQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__NTKArgonCloudKitClient_publishKeyDescriptor_completion___block_invoke_72;
  block[3] = &unk_1E62C9B50;
  id v12 = *(id *)(a1 + 48);
  char v18 = a2;
  id v16 = v5;
  id v17 = v12;
  id v13 = v5;
  dispatch_block_t v14 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, block);
  dispatch_async(v11, v14);
}

uint64_t __58__NTKArgonCloudKitClient_publishKeyDescriptor_completion___block_invoke_72(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

- (void)unpublishKeyDescriptor:(id)a3 completion:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [(NTKArgonCloudKitClient *)self zoneName];
    *(_DWORD *)buf = 134349570;
    uint64_t v22 = self;
    __int16 v23 = 2114;
    id v24 = v6;
    __int16 v25 = 2114;
    id v26 = v9;
    _os_log_impl(&dword_1BC5A9000, v8, OS_LOG_TYPE_DEFAULT, "CloudKit Client %{public}p: Unpublishing key descriptor %{public}@ in zone %{public}@.", buf, 0x20u);
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __60__NTKArgonCloudKitClient_unpublishKeyDescriptor_completion___block_invoke;
  aBlock[3] = &unk_1E62C9B78;
  aBlock[4] = self;
  id v19 = v6;
  id v20 = v7;
  id v10 = v7;
  id v11 = v6;
  id v12 = _Block_copy(aBlock);
  id v13 = objc_alloc_init(MEMORY[0x1E4F1A218]);
  [v13 setName:@"UserActionExplicit"];
  dispatch_block_t v14 = (void *)MEMORY[0x1E4F28F60];
  id v15 = [v11 key];
  id v16 = [v11 fileName];
  id v17 = [v14 predicateWithFormat:@"%K = %@ AND %K = %@", @"key", v15, @"fileName", v16];

  [(NTKArgonCloudKitClient *)self _unpublishRecordsOfType:NTKArgonCloudKitRecordTypeBundleDescriptor matchingPredicate:v17 completion:v12];
}

void __60__NTKArgonCloudKitClient_unpublishKeyDescriptor_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    id v6 = _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = *(void **)(a1 + 32);
      uint64_t v8 = *(void *)(a1 + 40);
      id v9 = [v7 zoneName];
      *(_DWORD *)buf = 134349570;
      id v20 = v7;
      __int16 v21 = 2114;
      uint64_t v22 = v8;
      __int16 v23 = 2114;
      id v24 = v9;
      _os_log_impl(&dword_1BC5A9000, v6, OS_LOG_TYPE_DEFAULT, "CloudKit Client %{public}p: Unpublished key descriptor %{public}@ in zone %{public}@.", buf, 0x20u);
    }
  }
  else
  {
    uint64_t v10 = _NTKArgonCloudKitClientError(202, v5);

    id v6 = _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __60__NTKArgonCloudKitClient_unpublishKeyDescriptor_completion___block_invoke_cold_1();
    }
    id v5 = (id)v10;
  }

  id v11 = [*(id *)(a1 + 32) internalQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__NTKArgonCloudKitClient_unpublishKeyDescriptor_completion___block_invoke_74;
  block[3] = &unk_1E62C9B50;
  id v12 = *(id *)(a1 + 48);
  char v18 = a2;
  id v16 = v5;
  id v17 = v12;
  id v13 = v5;
  dispatch_block_t v14 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, block);
  dispatch_async(v11, v14);
}

uint64_t __60__NTKArgonCloudKitClient_unpublishKeyDescriptor_completion___block_invoke_74(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

- (CKDatabase)database
{
  return self->_database;
}

- (NSURL)temporaryStorageURL
{
  return self->_temporaryStorageURL;
}

- (NSString)zoneName
{
  return self->_zoneName;
}

- (OS_dispatch_queue)internalQueue
{
  return self->_internalQueue;
}

- (void)setInternalQueue:(id)a3
{
}

- (CKRecordZoneID)recordZoneID
{
  return self->_recordZoneID;
}

- (void)setRecordZoneID:(id)a3
{
}

- (NSError)recordZoneError
{
  return self->_recordZoneError;
}

- (void)setRecordZoneError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordZoneError, 0);
  objc_storeStrong((id *)&self->_recordZoneID, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_zoneName, 0);
  objc_storeStrong((id *)&self->_temporaryStorageURL, 0);
  objc_storeStrong((id *)&self->_database, 0);
}

- (void)_fetchNewRecordsSinceChangeToken:(void *)a1 forReason:(NSObject *)a2 attemptNumber:completion:.cold.1(void *a1, NSObject *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = [a1 zoneName];
  id v5 = [a1 recordZoneError];
  int v8 = 134349570;
  id v9 = a1;
  OUTLINED_FUNCTION_6_0();
  uint64_t v10 = v4;
  __int16 v11 = v6;
  uint64_t v12 = v7;
  _os_log_error_impl(&dword_1BC5A9000, a2, OS_LOG_TYPE_ERROR, "CloudKit Client %{public}p: Failed to find new records for zone %{public}@ because the record zone did not exist in the database: %{public}@.", (uint8_t *)&v8, 0x20u);
}

- (void)_fetchNewRecordsSinceChangeToken:(uint64_t)a1 forReason:(NSObject *)a2 attemptNumber:completion:.cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134349056;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1BC5A9000, a2, OS_LOG_TYPE_ERROR, "CloudKit Client %{public}p: Failed to decode change token. Falling back to requesting all changes.", (uint8_t *)&v2, 0xCu);
}

void __94__NTKArgonCloudKitClient__fetchNewRecordsSinceChangeToken_forReason_attemptNumber_completion___block_invoke_41_cold_1()
{
  OUTLINED_FUNCTION_9();
  v1 = [v0 recordType];
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1_11(&dword_1BC5A9000, v2, v3, "CloudKit Client %{public}p: Unknown record type %{public}@ for record %{public}@. Ignoring.", v4, v5, v6, v7, 2u);
}

void __94__NTKArgonCloudKitClient__fetchNewRecordsSinceChangeToken_forReason_attemptNumber_completion___block_invoke_50_cold_1()
{
  OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_3(&dword_1BC5A9000, v0, v1, "CloudKit Client %{public}p: Failed to serialize server change token: %{public}@. Ignoring.");
}

void __94__NTKArgonCloudKitClient__fetchNewRecordsSinceChangeToken_forReason_attemptNumber_completion___block_invoke_50_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 134349056;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1BC5A9000, a2, OS_LOG_TYPE_ERROR, "CloudKit Client %{public}p: Fetch result indicates more records are coming, but we specified fetchAllChanges!", (uint8_t *)&v3, 0xCu);
}

void __94__NTKArgonCloudKitClient__fetchNewRecordsSinceChangeToken_forReason_attemptNumber_completion___block_invoke_55_cold_1()
{
  OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_3(&dword_1BC5A9000, v0, v1, "CloudKit Client %{public}p: Final record zone changes callback fired. Error occurred: %{public}@.");
}

- (void)_unpublishRecordsOfType:(void *)a1 matchingPredicate:completion:.cold.1(void *a1)
{
  uint64_t v2 = [a1 zoneName];
  int v3 = [a1 recordZoneError];
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_4_0(&dword_1BC5A9000, v4, v5, "CloudKit Client %{public}p: Record zone %{public}@ not found, so treating records matching %{public}@ as unpublished. Possible error: %{public}@.", v6, v7, v8, v9, 2u);
}

void __52__NTKArgonCloudKitClient__publishRecord_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_9();
  os_log_t v1 = [(id)OUTLINED_FUNCTION_2_6(v0) zoneName];
  OUTLINED_FUNCTION_0_9();
  OUTLINED_FUNCTION_4_0(&dword_1BC5A9000, v2, v3, "CloudKit Client %{public}p: Failed to publish record descriptor %{public}@ in zone %{public}@: %{public}@.", v4, v5, v6, v7, v8);
}

- (void)publishKeyDescriptor:(void *)a1 completion:.cold.1(void *a1)
{
  os_log_t v1 = [a1 recordZoneError];
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1_11(&dword_1BC5A9000, v2, v3, "CloudKit Client %{public}p: Failed to publish key descriptor %{public}@ because the record zone did not exist in the database: %{public}@.", v4, v5, v6, v7, 2u);
}

void __58__NTKArgonCloudKitClient_publishKeyDescriptor_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_9();
  os_log_t v1 = [(id)OUTLINED_FUNCTION_2_6(v0) zoneName];
  OUTLINED_FUNCTION_0_9();
  OUTLINED_FUNCTION_4_0(&dword_1BC5A9000, v2, v3, "CloudKit Client %{public}p: Failed to publish key descriptor %{public}@ in zone %{public}@: %{public}@.", v4, v5, v6, v7, v8);
}

void __60__NTKArgonCloudKitClient_unpublishKeyDescriptor_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_9();
  os_log_t v1 = [(id)OUTLINED_FUNCTION_2_6(v0) zoneName];
  OUTLINED_FUNCTION_0_9();
  OUTLINED_FUNCTION_4_0(&dword_1BC5A9000, v2, v3, "CloudKit Client %{public}p: Failed to unpublish key descriptor %{public}@ in zone %{public}@: %{public}@.", v4, v5, v6, v7, v8);
}

@end