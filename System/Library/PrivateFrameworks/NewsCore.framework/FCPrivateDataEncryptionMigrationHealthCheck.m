@interface FCPrivateDataEncryptionMigrationHealthCheck
+ (id)run;
- (CKContainer)container;
- (CKContainer)containerWithZoneWidePCS;
- (CKContainer)secureContainer;
- (FCCKPrivateDatabaseSchema)schema;
- (FCPrivateDataEncryptionMigrationHealthCheck)init;
- (id)_prepareHistoryAndReturnExpectations;
- (id)_prepareIssueHistoryAndReturnExpectations;
- (id)_preparePersonalizationProfileAndReturnExpectations;
- (id)_prepareReadingListAndReturnExpectations;
- (id)_prepareReferenceToChannelMembershipsAndReturnExpectations;
- (id)_prepareSensitiveSubscriptionsAndReturnExpectations;
- (id)_prepareSentinelsAndReturnExpectations;
- (id)_prepareSubscriptionsAndReturnExpectations;
- (id)_prepareTagSettingsAndReturnExpectations;
- (id)_prepareUserInfoAndReturnExpectations;
- (int64_t)toVersion;
- (void)_eraseAllPrivateData;
- (void)fetchCleanupToVersionForDatabase:(id)a3 completion:(id)a4;
- (void)fetchDesiredVersionForDatabase:(id)a3 completion:(id)a4;
- (void)run;
- (void)setContainer:(id)a3;
- (void)setContainerWithZoneWidePCS:(id)a3;
- (void)setSchema:(id)a3;
- (void)setSecureContainer:(id)a3;
- (void)setToVersion:(int64_t)a3;
@end

@implementation FCPrivateDataEncryptionMigrationHealthCheck

- (FCPrivateDataEncryptionMigrationHealthCheck)init
{
  v16.receiver = self;
  v16.super_class = (Class)FCPrivateDataEncryptionMigrationHealthCheck;
  v2 = [(FCPrivateDataEncryptionMigrationHealthCheck *)&v16 init];
  if (v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F19EE0]);
    [v3 setUseZoneWidePCS:0];
    id v4 = objc_alloc_init(MEMORY[0x1E4F19EE0]);
    [v4 setUseZoneWidePCS:1];
    v5 = (void *)[objc_alloc(MEMORY[0x1E4F19ED8]) initWithContainerIdentifier:@"com.apple.news.private" environment:1];
    uint64_t v6 = [objc_alloc(MEMORY[0x1E4F19EC8]) initWithContainerID:v5 options:v3];
    container = v2->_container;
    v2->_container = (CKContainer *)v6;

    uint64_t v8 = [objc_alloc(MEMORY[0x1E4F19EC8]) initWithContainerID:v5 options:v4];
    containerWithZoneWidePCS = v2->_containerWithZoneWidePCS;
    v2->_containerWithZoneWidePCS = (CKContainer *)v8;

    v10 = (void *)[objc_alloc(MEMORY[0x1E4F19ED8]) initWithContainerIdentifier:@"com.apple.news.private.secure" environment:1];
    uint64_t v11 = [objc_alloc(MEMORY[0x1E4F19EC8]) initWithContainerID:v10 options:v4];
    secureContainer = v2->_secureContainer;
    v2->_secureContainer = (CKContainer *)v11;

    uint64_t v13 = +[FCCKPrivateDatabase privateDatabaseSchema]();
    schema = v2->_schema;
    v2->_schema = (FCCKPrivateDatabaseSchema *)v13;

    v2->_toVersion = 1;
  }
  return v2;
}

+ (id)run
{
  v2 = objc_opt_new();
  [v2 run];

  return 0;
}

- (void)run
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  [(FCPrivateDataEncryptionMigrationHealthCheck *)self _eraseAllPrivateData];
  id v3 = [MEMORY[0x1E4F1CA48] array];
  id v4 = [(FCPrivateDataEncryptionMigrationHealthCheck *)self _prepareHistoryAndReturnExpectations];
  [v3 addObjectsFromArray:v4];

  v5 = [(FCPrivateDataEncryptionMigrationHealthCheck *)self _prepareIssueHistoryAndReturnExpectations];
  [v3 addObjectsFromArray:v5];

  uint64_t v6 = [(FCPrivateDataEncryptionMigrationHealthCheck *)self _prepareReadingListAndReturnExpectations];
  [v3 addObjectsFromArray:v6];

  v7 = [(FCPrivateDataEncryptionMigrationHealthCheck *)self _prepareSubscriptionsAndReturnExpectations];
  [v3 addObjectsFromArray:v7];

  uint64_t v8 = [(FCPrivateDataEncryptionMigrationHealthCheck *)self _prepareSensitiveSubscriptionsAndReturnExpectations];
  [v3 addObjectsFromArray:v8];

  v9 = [(FCPrivateDataEncryptionMigrationHealthCheck *)self _prepareUserInfoAndReturnExpectations];
  [v3 addObjectsFromArray:v9];

  v10 = [(FCPrivateDataEncryptionMigrationHealthCheck *)self _prepareTagSettingsAndReturnExpectations];
  [v3 addObjectsFromArray:v10];

  uint64_t v11 = [(FCPrivateDataEncryptionMigrationHealthCheck *)self _preparePersonalizationProfileAndReturnExpectations];
  [v3 addObjectsFromArray:v11];

  v12 = [(FCPrivateDataEncryptionMigrationHealthCheck *)self _prepareReferenceToChannelMembershipsAndReturnExpectations];
  [v3 addObjectsFromArray:v12];

  uint64_t v13 = [(FCPrivateDataEncryptionMigrationHealthCheck *)self _prepareSentinelsAndReturnExpectations];
  [v3 addObjectsFromArray:v13];

  v14 = [FCCKPrivateDatabase alloc];
  v15 = [(FCPrivateDataEncryptionMigrationHealthCheck *)self container];
  objc_super v16 = [v15 containerIdentifier];
  v17 = [(FCPrivateDataEncryptionMigrationHealthCheck *)self secureContainer];
  v18 = [v17 containerIdentifier];
  v19 = -[FCCKPrivateDatabase initWithContainerIdentifier:secureContainerIdentifier:productionEnvironment:encryptionDelegate:networkBehaviorMonitor:privateDataSyncingEnabled:](v14, v16, v18, 1, self, 0, 1);

  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __50__FCPrivateDataEncryptionMigrationHealthCheck_run__block_invoke;
  v30[3] = &unk_1E5B4CF38;
  v20 = v19;
  v31 = v20;
  FCWaitUntilBlockIsInvoked(v30);
  [MEMORY[0x1E4F29060] isMainThread];
  if (!v20 || v20[5] <= 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3A8] format:@"private database started up with encryption disabled"];
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v21 = v3;
  uint64_t v22 = [v21 countByEnumeratingWithState:&v26 objects:v32 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v27;
    do
    {
      uint64_t v25 = 0;
      do
      {
        if (*(void *)v27 != v24) {
          objc_enumerationMutation(v21);
        }
        objc_msgSend(*(id *)(*((void *)&v26 + 1) + 8 * v25++), "validate", (void)v26);
      }
      while (v23 != v25);
      uint64_t v23 = [v21 countByEnumeratingWithState:&v26 objects:v32 count:16];
    }
    while (v23);
  }
}

void __50__FCPrivateDataEncryptionMigrationHealthCheck_run__block_invoke(uint64_t a1, void *a2)
{
}

- (void)_eraseAllPrivateData
{
  id v3 = [MEMORY[0x1E4F1CA80] set];
  id v4 = [(FCPrivateDataEncryptionMigrationHealthCheck *)self schema];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __67__FCPrivateDataEncryptionMigrationHealthCheck__eraseAllPrivateData__block_invoke;
  v30[3] = &unk_1E5B4CF60;
  id v5 = v3;
  id v31 = v5;
  -[FCCKPrivateDatabaseSchema enumerateZoneSchemasWithBlock:]((uint64_t)v4, v30);

  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000;
  long long v27 = __Block_byref_object_copy__5;
  long long v28 = __Block_byref_object_dispose__5;
  id v29 = 0;
  id v6 = objc_alloc_init(MEMORY[0x1E4F1A180]);
  v7 = [(FCPrivateDataEncryptionMigrationHealthCheck *)self container];
  uint64_t v8 = [v7 privateCloudDatabase];
  [v6 setDatabase:v8];

  v9 = [v5 allObjects];
  [v6 setRecordZoneIDsToDelete:v9];

  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __67__FCPrivateDataEncryptionMigrationHealthCheck__eraseAllPrivateData__block_invoke_20;
  v23[3] = &unk_1E5B4CF88;
  v23[4] = &v24;
  [v6 setModifyRecordZonesCompletionBlock:v23];
  [v6 start];
  [v6 waitUntilFinished];
  [MEMORY[0x1E4F29060] isMainThread];
  v10 = (void *)v25[5];
  if (v10 && (objc_msgSend(v10, "fc_isCKUnknownItemError") & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3A8], @"error deleting private data: %@", v25[5] format];
  }
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__5;
  id v21 = __Block_byref_object_dispose__5;
  id v22 = 0;
  id v11 = objc_alloc_init(MEMORY[0x1E4F1A180]);
  v12 = [(FCPrivateDataEncryptionMigrationHealthCheck *)self secureContainer];
  uint64_t v13 = [v12 privateCloudDatabase];
  [v11 setDatabase:v13];

  v14 = [v5 allObjects];
  [v11 setRecordZoneIDsToDelete:v14];

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __67__FCPrivateDataEncryptionMigrationHealthCheck__eraseAllPrivateData__block_invoke_2;
  v16[3] = &unk_1E5B4CF88;
  v16[4] = &v17;
  [v11 setModifyRecordZonesCompletionBlock:v16];
  [v11 start];
  [v11 waitUntilFinished];
  [MEMORY[0x1E4F29060] isMainThread];
  v15 = (void *)v18[5];
  if (v15 && (objc_msgSend(v15, "fc_isCKUnknownItemError") & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3A8], @"error deleting private data: %@", v18[5] format];
  }

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v24, 8);
}

void __67__FCPrivateDataEncryptionMigrationHealthCheck__eraseAllPrivateData__block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  if (a2) {
    id v3 = *(void **)(a2 + 24);
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;
  [v2 addObject:v4];
}

void __67__FCPrivateDataEncryptionMigrationHealthCheck__eraseAllPrivateData__block_invoke_20(uint64_t a1, int a2, int a3, id obj)
{
}

void __67__FCPrivateDataEncryptionMigrationHealthCheck__eraseAllPrivateData__block_invoke_2(uint64_t a1, int a2, int a3, id obj)
{
}

- (id)_prepareHistoryAndReturnExpectations
{
  v87[1] = *MEMORY[0x1E4F143B8];
  id v3 = [(FCPrivateDataEncryptionMigrationHealthCheck *)self schema];
  id v4 = -[FCCKPrivateDatabaseSchema mappingFromRecordType:inZoneName:toVersion:](v3, @"ReadingHistoryItem", @"ReadingHistory", [(FCPrivateDataEncryptionMigrationHealthCheck *)self toVersion]);

  [MEMORY[0x1E4F29060] isMainThread];
  uint64_t v5 = [v4 fromZoneSchema];
  id v6 = (void *)v5;
  if (v5) {
    v7 = *(void **)(v5 + 16);
  }
  else {
    v7 = 0;
  }
  id v8 = v7;
  char v9 = [v8 isEqualToString:@"ReadingHistory"];

  if ((v9 & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3A8] format:@"reading history zone schema has wrong zone name"];
  }
  [MEMORY[0x1E4F29060] isMainThread];
  uint64_t v10 = [v4 fromRecordSchema];
  id v11 = (void *)v10;
  if (v10) {
    v12 = *(void **)(v10 + 16);
  }
  else {
    v12 = 0;
  }
  id v13 = v12;
  char v14 = [v13 isEqualToString:@"ReadingHistoryItem"];

  if ((v14 & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3A8] format:@"reading history record schema has wrong record type"];
  }
  [MEMORY[0x1E4F29060] isMainThread];
  v15 = [v4 toRecordSchema];
  objc_super v16 = -[FCCKRecordSchema allEncryptedFieldNames]((uint64_t)v15);
  char v17 = [v16 containsObject:@"articleID"];

  if ((v17 & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3A8] format:@"reading history record should have encrypted articleID"];
  }
  uint64_t v18 = [v4 fromZoneSchema];
  uint64_t v19 = (void *)v18;
  if (v18) {
    v20 = *(void **)(v18 + 24);
  }
  else {
    v20 = 0;
  }
  id v21 = v20;

  uint64_t v22 = [v4 toZoneSchema];
  uint64_t v23 = (void *)v22;
  if (v22) {
    uint64_t v24 = *(void **)(v22 + 24);
  }
  else {
    uint64_t v24 = 0;
  }
  id v66 = v24;

  uint64_t v80 = 0;
  v81 = &v80;
  uint64_t v82 = 0x3032000000;
  v83 = __Block_byref_object_copy__5;
  v84 = __Block_byref_object_dispose__5;
  id v85 = 0;
  v76[0] = MEMORY[0x1E4F143A8];
  v76[1] = 3221225472;
  v76[2] = __83__FCPrivateDataEncryptionMigrationHealthCheck__prepareHistoryAndReturnExpectations__block_invoke;
  v76[3] = &unk_1E5B4CFD8;
  id v25 = v21;
  id v77 = v25;
  v78 = self;
  v79 = &v80;
  FCWaitUntilBlockIsInvoked(v76);
  [MEMORY[0x1E4F29060] isMainThread];
  if (v81[5]) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3A8], @"error saving history zone: %@", v81[5] format];
  }
  v63 = FCRandomTagCloudKitID();
  uint64_t v26 = FCRandomArticleCloudKitID();
  v65 = FCHistoryItemIDFromArticleID((uint64_t)v26);
  v64 = (void *)[objc_alloc(MEMORY[0x1E4F1A2F8]) initWithRecordName:v65 zoneID:v25];
  id v27 = objc_alloc(MEMORY[0x1E4F1A2D8]);
  uint64_t v28 = [v4 fromRecordSchema];
  id v29 = (void *)v28;
  if (v28) {
    v30 = *(void **)(v28 + 16);
  }
  else {
    v30 = 0;
  }
  id v31 = v30;
  v32 = (void *)[v27 initWithRecordType:v31 recordID:v64];

  [v32 setObject:v26 forKeyedSubscript:@"articleID"];
  [v32 setObject:v63 forKeyedSubscript:@"sourceChannelTagID"];
  uint64_t v33 = [MEMORY[0x1E4F29128] UUID];
  v34 = [v33 UUIDString];
  [v32 setObject:v34 forKeyedSubscript:@"deviceID"];

  v35 = [MEMORY[0x1E4F1C9C8] date];
  [v32 setObject:v35 forKeyedSubscript:@"lastVisited"];

  [v32 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"articleRead"];
  [v32 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"articleSeen"];
  [v32 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"completedListening"];
  [v32 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"completedReading"];
  [v32 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"liked"];
  [v32 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"disliked"];
  [v32 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"offensive"];
  [v32 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"articleConsumed"];
  [v32 setObject:&unk_1EF8D75D8 forKeyedSubscript:@"writerVersionHighWatermark"];
  [v32 setObject:&unk_1EF8D75D8 forKeyedSubscript:@"readerMinimumRequiredVersion"];
  [v32 setObject:&unk_1EF8D75F0 forKeyedSubscript:@"listenedCount"];
  [v32 setObject:&unk_1EF8D99F8 forKeyedSubscript:@"listeningProgress"];
  v36 = [MEMORY[0x1E4F1C9C8] date];
  [v32 setObject:v36 forKeyedSubscript:@"listeningProgressLastSaved"];

  v37 = [MEMORY[0x1E4F1C9C8] date];
  [v32 setObject:v37 forKeyedSubscript:@"lastListened"];

  [v32 setObject:&stru_1EF8299B8 forKeyedSubscript:@"readingPosition"];
  v38 = [MEMORY[0x1E4F1C9C8] date];
  [v32 setObject:v38 forKeyedSubscript:@"readingPositionLastSaved"];

  [v32 setObject:&unk_1EF8D75F0 forKeyedSubscript:@"readCount"];
  [v32 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"removedFromAudio"];
  [v32 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"pruningDisabled"];
  uint64_t v70 = 0;
  v71 = &v70;
  uint64_t v72 = 0x3032000000;
  v73 = __Block_byref_object_copy__5;
  v74 = __Block_byref_object_dispose__5;
  id v75 = 0;
  v67[0] = MEMORY[0x1E4F143A8];
  v67[1] = 3221225472;
  v67[2] = __83__FCPrivateDataEncryptionMigrationHealthCheck__prepareHistoryAndReturnExpectations__block_invoke_49;
  v67[3] = &unk_1E5B4CFD8;
  v67[4] = self;
  id v39 = v32;
  id v68 = v39;
  v69 = &v70;
  FCWaitUntilBlockIsInvoked(v67);
  [MEMORY[0x1E4F29060] isMainThread];
  if (v71[5]) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3A8], @"error saving history record: %@", v71[5] format];
  }
  v40 = objc_opt_new();
  v41 = [(FCPrivateDataEncryptionMigrationHealthCheck *)self secureContainer];
  v42 = [v41 privateCloudDatabase];
  [v40 setDatabase:v42];

  [v40 setZoneID:v66];
  [v40 setShouldExist:1];
  v43 = objc_opt_new();
  v44 = [(FCPrivateDataEncryptionMigrationHealthCheck *)self container];
  v45 = [v44 privateCloudDatabase];
  [v43 setDatabase:v45];

  [v43 setZoneID:v25];
  [v43 setShouldExist:0];
  v46 = objc_opt_new();
  uint64_t v47 = [v4 toRecordSchema];
  v48 = (void *)v47;
  if (v47) {
    v49 = *(void **)(v47 + 16);
  }
  else {
    v49 = 0;
  }
  id v50 = v49;
  [v46 setRecordType:v50];

  v51 = [v4 toRecordSchema];
  v52 = -[FCCKRecordSchema allUnencryptedFieldNames]((uint64_t)v51);
  [v46 setUnencryptedFields:v52];

  v53 = [v4 toRecordSchema];
  v54 = -[FCCKRecordSchema allEncryptedFieldNames]((uint64_t)v53);
  [v46 setEncryptedFields:v54];

  v55 = [v39 valueStore];
  v56 = [v55 values];
  [v46 setExpectedValues:v56];

  v57 = objc_opt_new();
  v58 = [(FCPrivateDataEncryptionMigrationHealthCheck *)self secureContainer];
  v59 = [v58 privateCloudDatabase];
  [v57 setDatabase:v59];

  [v57 setZoneID:v66];
  v87[0] = v46;
  v60 = [MEMORY[0x1E4F1C978] arrayWithObjects:v87 count:1];
  [v57 setRecordTests:v60];

  v86[0] = v40;
  v86[1] = v57;
  v86[2] = v43;
  v61 = [MEMORY[0x1E4F1C978] arrayWithObjects:v86 count:3];

  _Block_object_dispose(&v70, 8);
  _Block_object_dispose(&v80, 8);

  return v61;
}

void __83__FCPrivateDataEncryptionMigrationHealthCheck__prepareHistoryAndReturnExpectations__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F1A310]) initWithZoneID:*(void *)(a1 + 32)];
  uint64_t v5 = [*(id *)(a1 + 40) container];
  id v6 = [v5 privateCloudDatabase];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __83__FCPrivateDataEncryptionMigrationHealthCheck__prepareHistoryAndReturnExpectations__block_invoke_2;
  v9[3] = &unk_1E5B4CFB0;
  uint64_t v7 = *(void *)(a1 + 48);
  id v10 = v3;
  uint64_t v11 = v7;
  id v8 = v3;
  [v6 saveRecordZone:v4 completionHandler:v9];
}

void __83__FCPrivateDataEncryptionMigrationHealthCheck__prepareHistoryAndReturnExpectations__block_invoke_2(uint64_t a1, int a2, id obj)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
  id v5 = obj;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __83__FCPrivateDataEncryptionMigrationHealthCheck__prepareHistoryAndReturnExpectations__block_invoke_49(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) container];
  id v5 = [v4 privateCloudDatabase];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __83__FCPrivateDataEncryptionMigrationHealthCheck__prepareHistoryAndReturnExpectations__block_invoke_2_50;
  v9[3] = &unk_1E5B4D000;
  uint64_t v7 = *(void *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  id v10 = v3;
  uint64_t v11 = v6;
  id v8 = v3;
  [v5 saveRecord:v7 completionHandler:v9];
}

void __83__FCPrivateDataEncryptionMigrationHealthCheck__prepareHistoryAndReturnExpectations__block_invoke_2_50(uint64_t a1, int a2, id obj)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
  id v5 = obj;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_prepareIssueHistoryAndReturnExpectations
{
  v83[1] = *MEMORY[0x1E4F143B8];
  id v3 = [(FCPrivateDataEncryptionMigrationHealthCheck *)self schema];
  id v4 = -[FCCKPrivateDatabaseSchema mappingFromRecordType:inZoneName:toVersion:](v3, @"IssueReadingHistoryItem", @"IssueReadingHistory", [(FCPrivateDataEncryptionMigrationHealthCheck *)self toVersion]);

  [MEMORY[0x1E4F29060] isMainThread];
  uint64_t v5 = [v4 fromZoneSchema];
  uint64_t v6 = (void *)v5;
  if (v5) {
    uint64_t v7 = *(void **)(v5 + 16);
  }
  else {
    uint64_t v7 = 0;
  }
  id v8 = v7;
  char v9 = [v8 isEqualToString:@"IssueReadingHistory"];

  if ((v9 & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3A8] format:@"issue reading history zone schema has wrong zone name"];
  }
  [MEMORY[0x1E4F29060] isMainThread];
  uint64_t v10 = [v4 fromRecordSchema];
  uint64_t v11 = (void *)v10;
  if (v10) {
    v12 = *(void **)(v10 + 16);
  }
  else {
    v12 = 0;
  }
  id v13 = v12;
  char v14 = [v13 isEqualToString:@"IssueReadingHistoryItem"];

  if ((v14 & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3A8] format:@"issue reading history record schema has wrong record type"];
  }
  [MEMORY[0x1E4F29060] isMainThread];
  v15 = [v4 toRecordSchema];
  objc_super v16 = -[FCCKRecordSchema allEncryptedFieldNames]((uint64_t)v15);
  char v17 = [v16 containsObject:@"issueID"];

  if ((v17 & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3A8] format:@"issue reading history record should have encrypted issueID"];
  }
  uint64_t v18 = [v4 fromZoneSchema];
  uint64_t v19 = (void *)v18;
  if (v18) {
    v20 = *(void **)(v18 + 24);
  }
  else {
    v20 = 0;
  }
  id v21 = v20;

  uint64_t v22 = [v4 toZoneSchema];
  uint64_t v23 = (void *)v22;
  if (v22) {
    uint64_t v24 = *(void **)(v22 + 24);
  }
  else {
    uint64_t v24 = 0;
  }
  id v62 = v24;

  uint64_t v76 = 0;
  id v77 = &v76;
  uint64_t v78 = 0x3032000000;
  v79 = __Block_byref_object_copy__5;
  uint64_t v80 = __Block_byref_object_dispose__5;
  id v81 = 0;
  v72[0] = MEMORY[0x1E4F143A8];
  v72[1] = 3221225472;
  v72[2] = __88__FCPrivateDataEncryptionMigrationHealthCheck__prepareIssueHistoryAndReturnExpectations__block_invoke;
  v72[3] = &unk_1E5B4CFD8;
  id v25 = v21;
  id v73 = v25;
  v74 = self;
  id v75 = &v76;
  FCWaitUntilBlockIsInvoked(v72);
  [MEMORY[0x1E4F29060] isMainThread];
  if (v77[5]) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3A8], @"error saving issue history zone: %@", v77[5] format];
  }
  uint64_t v26 = FCRandomIssueCloudKitID();
  v61 = FCIssueHistoryItemIDFromIssueID((uint64_t)v26);
  v60 = (void *)[objc_alloc(MEMORY[0x1E4F1A2F8]) initWithRecordName:v61 zoneID:v25];
  id v27 = objc_alloc(MEMORY[0x1E4F1A2D8]);
  uint64_t v28 = [v4 fromRecordSchema];
  id v29 = (void *)v28;
  if (v28) {
    v30 = *(void **)(v28 + 16);
  }
  else {
    v30 = 0;
  }
  id v31 = v30;
  v32 = (void *)[v27 initWithRecordType:v31 recordID:v60];

  [v32 setObject:v26 forKeyedSubscript:@"issueID"];
  uint64_t v33 = [MEMORY[0x1E4F1C9C8] date];
  [v32 setObject:v33 forKeyedSubscript:@"lastVisited"];

  v34 = [MEMORY[0x1E4F1C9C8] date];
  [v32 setObject:v34 forKeyedSubscript:@"lastBadged"];

  v35 = [MEMORY[0x1E4F1C9C8] date];
  [v32 setObject:v35 forKeyedSubscript:@"lastEngaged"];

  uint64_t v66 = 0;
  v67 = &v66;
  uint64_t v68 = 0x3032000000;
  v69 = __Block_byref_object_copy__5;
  uint64_t v70 = __Block_byref_object_dispose__5;
  id v71 = 0;
  v63[0] = MEMORY[0x1E4F143A8];
  v63[1] = 3221225472;
  v63[2] = __88__FCPrivateDataEncryptionMigrationHealthCheck__prepareIssueHistoryAndReturnExpectations__block_invoke_3;
  v63[3] = &unk_1E5B4CFD8;
  v63[4] = self;
  id v36 = v32;
  id v64 = v36;
  v65 = &v66;
  FCWaitUntilBlockIsInvoked(v63);
  [MEMORY[0x1E4F29060] isMainThread];
  if (v67[5]) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3A8], @"error saving issue history record: %@", v67[5] format];
  }
  v37 = objc_opt_new();
  v38 = [(FCPrivateDataEncryptionMigrationHealthCheck *)self secureContainer];
  id v39 = [v38 privateCloudDatabase];
  [v37 setDatabase:v39];

  [v37 setZoneID:v62];
  [v37 setShouldExist:1];
  v40 = objc_opt_new();
  v41 = [(FCPrivateDataEncryptionMigrationHealthCheck *)self container];
  v42 = [v41 privateCloudDatabase];
  [v40 setDatabase:v42];

  [v40 setZoneID:v25];
  [v40 setShouldExist:0];
  v43 = objc_opt_new();
  uint64_t v44 = [v4 toRecordSchema];
  v45 = (void *)v44;
  if (v44) {
    v46 = *(void **)(v44 + 16);
  }
  else {
    v46 = 0;
  }
  id v47 = v46;
  [v43 setRecordType:v47];

  v48 = [v4 toRecordSchema];
  v49 = -[FCCKRecordSchema allUnencryptedFieldNames]((uint64_t)v48);
  [v43 setUnencryptedFields:v49];

  id v50 = [v4 toRecordSchema];
  v51 = -[FCCKRecordSchema allEncryptedFieldNames]((uint64_t)v50);
  [v43 setEncryptedFields:v51];

  v52 = [v36 valueStore];
  v53 = [v52 values];
  [v43 setExpectedValues:v53];

  v54 = objc_opt_new();
  v55 = [(FCPrivateDataEncryptionMigrationHealthCheck *)self secureContainer];
  v56 = [v55 privateCloudDatabase];
  [v54 setDatabase:v56];

  [v54 setZoneID:v62];
  v83[0] = v43;
  v57 = [MEMORY[0x1E4F1C978] arrayWithObjects:v83 count:1];
  [v54 setRecordTests:v57];

  v82[0] = v37;
  v82[1] = v54;
  v82[2] = v40;
  v58 = [MEMORY[0x1E4F1C978] arrayWithObjects:v82 count:3];

  _Block_object_dispose(&v66, 8);
  _Block_object_dispose(&v76, 8);

  return v58;
}

void __88__FCPrivateDataEncryptionMigrationHealthCheck__prepareIssueHistoryAndReturnExpectations__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F1A310]) initWithZoneID:*(void *)(a1 + 32)];
  uint64_t v5 = [*(id *)(a1 + 40) container];
  uint64_t v6 = [v5 privateCloudDatabase];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __88__FCPrivateDataEncryptionMigrationHealthCheck__prepareIssueHistoryAndReturnExpectations__block_invoke_2;
  v9[3] = &unk_1E5B4CFB0;
  uint64_t v7 = *(void *)(a1 + 48);
  id v10 = v3;
  uint64_t v11 = v7;
  id v8 = v3;
  [v6 saveRecordZone:v4 completionHandler:v9];
}

void __88__FCPrivateDataEncryptionMigrationHealthCheck__prepareIssueHistoryAndReturnExpectations__block_invoke_2(uint64_t a1, int a2, id obj)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
  id v5 = obj;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __88__FCPrivateDataEncryptionMigrationHealthCheck__prepareIssueHistoryAndReturnExpectations__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) container];
  id v5 = [v4 privateCloudDatabase];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __88__FCPrivateDataEncryptionMigrationHealthCheck__prepareIssueHistoryAndReturnExpectations__block_invoke_4;
  v9[3] = &unk_1E5B4D000;
  uint64_t v7 = *(void *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  id v10 = v3;
  uint64_t v11 = v6;
  id v8 = v3;
  [v5 saveRecord:v7 completionHandler:v9];
}

void __88__FCPrivateDataEncryptionMigrationHealthCheck__prepareIssueHistoryAndReturnExpectations__block_invoke_4(uint64_t a1, int a2, id obj)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
  id v5 = obj;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_prepareReadingListAndReturnExpectations
{
  v81[1] = *MEMORY[0x1E4F143B8];
  id v3 = [(FCPrivateDataEncryptionMigrationHealthCheck *)self schema];
  id v4 = -[FCCKPrivateDatabaseSchema mappingFromRecordType:inZoneName:toVersion:](v3, @"ReadingListEntry", @"ReadingList", [(FCPrivateDataEncryptionMigrationHealthCheck *)self toVersion]);

  [MEMORY[0x1E4F29060] isMainThread];
  uint64_t v5 = [v4 fromZoneSchema];
  uint64_t v6 = (void *)v5;
  if (v5) {
    uint64_t v7 = *(void **)(v5 + 16);
  }
  else {
    uint64_t v7 = 0;
  }
  id v8 = v7;
  char v9 = [v8 isEqualToString:@"ReadingList"];

  if ((v9 & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3A8] format:@"reading list zone schema has wrong zone name"];
  }
  [MEMORY[0x1E4F29060] isMainThread];
  uint64_t v10 = [v4 fromRecordSchema];
  uint64_t v11 = (void *)v10;
  if (v10) {
    v12 = *(void **)(v10 + 16);
  }
  else {
    v12 = 0;
  }
  id v13 = v12;
  char v14 = [v13 isEqualToString:@"ReadingListEntry"];

  if ((v14 & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3A8] format:@"reading list record schema has wrong record type"];
  }
  [MEMORY[0x1E4F29060] isMainThread];
  v15 = [v4 toRecordSchema];
  objc_super v16 = -[FCCKRecordSchema allEncryptedFieldNames]((uint64_t)v15);
  char v17 = [v16 containsObject:@"articleID"];

  if ((v17 & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3A8] format:@"reading list record should have encrypted articleID"];
  }
  uint64_t v18 = [v4 fromZoneSchema];
  uint64_t v19 = (void *)v18;
  if (v18) {
    v20 = *(void **)(v18 + 24);
  }
  else {
    v20 = 0;
  }
  id v21 = v20;

  uint64_t v22 = [v4 toZoneSchema];
  uint64_t v23 = (void *)v22;
  if (v22) {
    uint64_t v24 = *(void **)(v22 + 24);
  }
  else {
    uint64_t v24 = 0;
  }
  id v60 = v24;

  uint64_t v74 = 0;
  id v75 = &v74;
  uint64_t v76 = 0x3032000000;
  id v77 = __Block_byref_object_copy__5;
  uint64_t v78 = __Block_byref_object_dispose__5;
  id v79 = 0;
  v70[0] = MEMORY[0x1E4F143A8];
  v70[1] = 3221225472;
  v70[2] = __87__FCPrivateDataEncryptionMigrationHealthCheck__prepareReadingListAndReturnExpectations__block_invoke;
  v70[3] = &unk_1E5B4CFD8;
  id v25 = v21;
  id v71 = v25;
  uint64_t v72 = self;
  id v73 = &v74;
  FCWaitUntilBlockIsInvoked(v70);
  [MEMORY[0x1E4F29060] isMainThread];
  if (v75[5]) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3A8], @"error saving reading list zone: %@", v75[5] format];
  }
  uint64_t v26 = FCRandomArticleCloudKitID();
  v59 = FCReadingListEntryIDFromArticleID((uint64_t)v26);
  v58 = (void *)[objc_alloc(MEMORY[0x1E4F1A2F8]) initWithRecordName:v59 zoneID:v25];
  id v27 = objc_alloc(MEMORY[0x1E4F1A2D8]);
  uint64_t v28 = [v4 fromRecordSchema];
  id v29 = (void *)v28;
  if (v28) {
    v30 = *(void **)(v28 + 16);
  }
  else {
    v30 = 0;
  }
  id v31 = v30;
  v32 = (void *)[v27 initWithRecordType:v31 recordID:v58];

  [v32 setObject:v26 forKeyedSubscript:@"articleID"];
  uint64_t v33 = [MEMORY[0x1E4F1C9C8] date];
  [v32 setObject:v33 forKeyedSubscript:@"dateAdded"];

  [v32 setObject:&unk_1EF8D7608 forKeyedSubscript:@"origin"];
  [v32 setObject:&unk_1EF8D75D8 forKeyedSubscript:@"writerVersionHighWatermark"];
  [v32 setObject:&unk_1EF8D75D8 forKeyedSubscript:@"readerMinimumRequiredVersion"];
  uint64_t v64 = 0;
  v65 = &v64;
  uint64_t v66 = 0x3032000000;
  v67 = __Block_byref_object_copy__5;
  uint64_t v68 = __Block_byref_object_dispose__5;
  id v69 = 0;
  v61[0] = MEMORY[0x1E4F143A8];
  v61[1] = 3221225472;
  v61[2] = __87__FCPrivateDataEncryptionMigrationHealthCheck__prepareReadingListAndReturnExpectations__block_invoke_89;
  v61[3] = &unk_1E5B4CFD8;
  v61[4] = self;
  id v34 = v32;
  id v62 = v34;
  v63 = &v64;
  FCWaitUntilBlockIsInvoked(v61);
  [MEMORY[0x1E4F29060] isMainThread];
  if (v65[5]) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3A8], @"error saving reading list record: %@", v65[5] format];
  }
  v35 = objc_opt_new();
  id v36 = [(FCPrivateDataEncryptionMigrationHealthCheck *)self secureContainer];
  v37 = [v36 privateCloudDatabase];
  [v35 setDatabase:v37];

  [v35 setZoneID:v60];
  [v35 setShouldExist:1];
  v38 = objc_opt_new();
  id v39 = [(FCPrivateDataEncryptionMigrationHealthCheck *)self container];
  v40 = [v39 privateCloudDatabase];
  [v38 setDatabase:v40];

  [v38 setZoneID:v25];
  [v38 setShouldExist:0];
  v41 = objc_opt_new();
  uint64_t v42 = [v4 toRecordSchema];
  v43 = (void *)v42;
  if (v42) {
    uint64_t v44 = *(void **)(v42 + 16);
  }
  else {
    uint64_t v44 = 0;
  }
  id v45 = v44;
  [v41 setRecordType:v45];

  v46 = [v4 toRecordSchema];
  id v47 = -[FCCKRecordSchema allUnencryptedFieldNames]((uint64_t)v46);
  [v41 setUnencryptedFields:v47];

  v48 = [v4 toRecordSchema];
  v49 = -[FCCKRecordSchema allEncryptedFieldNames]((uint64_t)v48);
  [v41 setEncryptedFields:v49];

  id v50 = [v34 valueStore];
  v51 = [v50 values];
  [v41 setExpectedValues:v51];

  v52 = objc_opt_new();
  v53 = [(FCPrivateDataEncryptionMigrationHealthCheck *)self secureContainer];
  v54 = [v53 privateCloudDatabase];
  [v52 setDatabase:v54];

  [v52 setZoneID:v60];
  v81[0] = v41;
  v55 = [MEMORY[0x1E4F1C978] arrayWithObjects:v81 count:1];
  [v52 setRecordTests:v55];

  v80[0] = v35;
  v80[1] = v52;
  v80[2] = v38;
  v56 = [MEMORY[0x1E4F1C978] arrayWithObjects:v80 count:3];

  _Block_object_dispose(&v64, 8);
  _Block_object_dispose(&v74, 8);

  return v56;
}

void __87__FCPrivateDataEncryptionMigrationHealthCheck__prepareReadingListAndReturnExpectations__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F1A310]) initWithZoneID:*(void *)(a1 + 32)];
  uint64_t v5 = [*(id *)(a1 + 40) container];
  uint64_t v6 = [v5 privateCloudDatabase];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __87__FCPrivateDataEncryptionMigrationHealthCheck__prepareReadingListAndReturnExpectations__block_invoke_2;
  v9[3] = &unk_1E5B4CFB0;
  uint64_t v7 = *(void *)(a1 + 48);
  id v10 = v3;
  uint64_t v11 = v7;
  id v8 = v3;
  [v6 saveRecordZone:v4 completionHandler:v9];
}

void __87__FCPrivateDataEncryptionMigrationHealthCheck__prepareReadingListAndReturnExpectations__block_invoke_2(uint64_t a1, int a2, id obj)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
  id v5 = obj;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __87__FCPrivateDataEncryptionMigrationHealthCheck__prepareReadingListAndReturnExpectations__block_invoke_89(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) container];
  id v5 = [v4 privateCloudDatabase];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __87__FCPrivateDataEncryptionMigrationHealthCheck__prepareReadingListAndReturnExpectations__block_invoke_2_90;
  v9[3] = &unk_1E5B4D000;
  uint64_t v7 = *(void *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  id v10 = v3;
  uint64_t v11 = v6;
  id v8 = v3;
  [v5 saveRecord:v7 completionHandler:v9];
}

void __87__FCPrivateDataEncryptionMigrationHealthCheck__prepareReadingListAndReturnExpectations__block_invoke_2_90(uint64_t a1, int a2, id obj)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
  id v5 = obj;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_prepareSubscriptionsAndReturnExpectations
{
  v81[1] = *MEMORY[0x1E4F143B8];
  id v3 = [(FCPrivateDataEncryptionMigrationHealthCheck *)self schema];
  id v4 = -[FCCKPrivateDatabaseSchema mappingFromRecordType:inZoneName:toVersion:](v3, @"Subscription", @"Subscriptions", [(FCPrivateDataEncryptionMigrationHealthCheck *)self toVersion]);

  [MEMORY[0x1E4F29060] isMainThread];
  uint64_t v5 = [v4 fromZoneSchema];
  uint64_t v6 = (void *)v5;
  if (v5) {
    uint64_t v7 = *(void **)(v5 + 16);
  }
  else {
    uint64_t v7 = 0;
  }
  id v8 = v7;
  char v9 = [v8 isEqualToString:@"Subscriptions"];

  if ((v9 & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3A8] format:@"subscriptions zone schema has wrong zone name"];
  }
  [MEMORY[0x1E4F29060] isMainThread];
  uint64_t v10 = [v4 fromRecordSchema];
  uint64_t v11 = (void *)v10;
  if (v10) {
    v12 = *(void **)(v10 + 16);
  }
  else {
    v12 = 0;
  }
  id v13 = v12;
  char v14 = [v13 isEqualToString:@"Subscription"];

  if ((v14 & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3A8] format:@"subscriptions record schema has wrong record type"];
  }
  [MEMORY[0x1E4F29060] isMainThread];
  v15 = [v4 toRecordSchema];
  objc_super v16 = -[FCCKRecordSchema allEncryptedFieldNames]((uint64_t)v15);
  char v17 = [v16 containsObject:@"tagID"];

  if ((v17 & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3A8] format:@"subscriptions record should have encrypted tagID"];
  }
  uint64_t v18 = [v4 fromZoneSchema];
  uint64_t v19 = (void *)v18;
  if (v18) {
    v20 = *(void **)(v18 + 24);
  }
  else {
    v20 = 0;
  }
  id v21 = v20;

  uint64_t v22 = [v4 toZoneSchema];
  uint64_t v23 = (void *)v22;
  if (v22) {
    uint64_t v24 = *(void **)(v22 + 24);
  }
  else {
    uint64_t v24 = 0;
  }
  id v60 = v24;

  uint64_t v74 = 0;
  id v75 = &v74;
  uint64_t v76 = 0x3032000000;
  id v77 = __Block_byref_object_copy__5;
  uint64_t v78 = __Block_byref_object_dispose__5;
  id v79 = 0;
  v70[0] = MEMORY[0x1E4F143A8];
  v70[1] = 3221225472;
  v70[2] = __89__FCPrivateDataEncryptionMigrationHealthCheck__prepareSubscriptionsAndReturnExpectations__block_invoke;
  v70[3] = &unk_1E5B4CFD8;
  id v25 = v21;
  id v71 = v25;
  uint64_t v72 = self;
  id v73 = &v74;
  FCWaitUntilBlockIsInvoked(v70);
  [MEMORY[0x1E4F29060] isMainThread];
  if (v75[5]) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3A8], @"error saving subscriptions zone: %@", v75[5] format];
  }
  uint64_t v26 = FCRandomTagCloudKitID();
  v59 = +[FCSubscriptionList subscriptionIDForTagID:v26 type:0];
  v58 = (void *)[objc_alloc(MEMORY[0x1E4F1A2F8]) initWithRecordName:v59 zoneID:v25];
  id v27 = objc_alloc(MEMORY[0x1E4F1A2D8]);
  uint64_t v28 = [v4 fromRecordSchema];
  id v29 = (void *)v28;
  if (v28) {
    v30 = *(void **)(v28 + 16);
  }
  else {
    v30 = 0;
  }
  id v31 = v30;
  v32 = (void *)[v27 initWithRecordType:v31 recordID:v58];

  [v32 setObject:@"tag" forKeyedSubscript:@"subscriptionType"];
  [v32 setObject:&unk_1EF8D7620 forKeyedSubscript:@"subscriptionOrder"];
  [v32 setObject:&unk_1EF8D7638 forKeyedSubscript:@"subscriptionOrigin"];
  uint64_t v33 = [MEMORY[0x1E4F1C9C8] date];
  [v32 setObject:v33 forKeyedSubscript:@"dateAdded"];

  [v32 setObject:v26 forKeyedSubscript:@"tagID"];
  [v32 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"notificationsEnabled"];
  [v32 setObject:&unk_1EF8D75D8 forKeyedSubscript:@"writerVersionHighWatermark"];
  [v32 setObject:&unk_1EF8D75D8 forKeyedSubscript:@"readerMinimumRequiredVersion"];
  uint64_t v64 = 0;
  v65 = &v64;
  uint64_t v66 = 0x3032000000;
  v67 = __Block_byref_object_copy__5;
  uint64_t v68 = __Block_byref_object_dispose__5;
  id v69 = 0;
  v61[0] = MEMORY[0x1E4F143A8];
  v61[1] = 3221225472;
  v61[2] = __89__FCPrivateDataEncryptionMigrationHealthCheck__prepareSubscriptionsAndReturnExpectations__block_invoke_111;
  v61[3] = &unk_1E5B4CFD8;
  v61[4] = self;
  id v34 = v32;
  id v62 = v34;
  v63 = &v64;
  FCWaitUntilBlockIsInvoked(v61);
  [MEMORY[0x1E4F29060] isMainThread];
  if (v65[5]) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3A8], @"error saving subscription record: %@", v65[5] format];
  }
  v35 = objc_opt_new();
  id v36 = [(FCPrivateDataEncryptionMigrationHealthCheck *)self container];
  v37 = [v36 privateCloudDatabase];
  [v35 setDatabase:v37];

  [v35 setZoneID:v60];
  [v35 setShouldExist:1];
  v38 = objc_opt_new();
  id v39 = [(FCPrivateDataEncryptionMigrationHealthCheck *)self container];
  v40 = [v39 privateCloudDatabase];
  [v38 setDatabase:v40];

  [v38 setZoneID:v25];
  [v38 setShouldExist:0];
  v41 = objc_opt_new();
  uint64_t v42 = [v4 toRecordSchema];
  v43 = (void *)v42;
  if (v42) {
    uint64_t v44 = *(void **)(v42 + 16);
  }
  else {
    uint64_t v44 = 0;
  }
  id v45 = v44;
  [v41 setRecordType:v45];

  v46 = [v4 toRecordSchema];
  id v47 = -[FCCKRecordSchema allUnencryptedFieldNames]((uint64_t)v46);
  [v41 setUnencryptedFields:v47];

  v48 = [v4 toRecordSchema];
  v49 = -[FCCKRecordSchema allEncryptedFieldNames]((uint64_t)v48);
  [v41 setEncryptedFields:v49];

  id v50 = [v34 valueStore];
  v51 = [v50 values];
  [v41 setExpectedValues:v51];

  v52 = objc_opt_new();
  v53 = [(FCPrivateDataEncryptionMigrationHealthCheck *)self containerWithZoneWidePCS];
  v54 = [v53 privateCloudDatabase];
  [v52 setDatabase:v54];

  [v52 setZoneID:v60];
  v81[0] = v41;
  v55 = [MEMORY[0x1E4F1C978] arrayWithObjects:v81 count:1];
  [v52 setRecordTests:v55];

  v80[0] = v35;
  v80[1] = v52;
  v80[2] = v38;
  v56 = [MEMORY[0x1E4F1C978] arrayWithObjects:v80 count:3];

  _Block_object_dispose(&v64, 8);
  _Block_object_dispose(&v74, 8);

  return v56;
}

void __89__FCPrivateDataEncryptionMigrationHealthCheck__prepareSubscriptionsAndReturnExpectations__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F1A310]) initWithZoneID:*(void *)(a1 + 32)];
  uint64_t v5 = [*(id *)(a1 + 40) container];
  uint64_t v6 = [v5 privateCloudDatabase];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __89__FCPrivateDataEncryptionMigrationHealthCheck__prepareSubscriptionsAndReturnExpectations__block_invoke_2;
  v9[3] = &unk_1E5B4CFB0;
  uint64_t v7 = *(void *)(a1 + 48);
  id v10 = v3;
  uint64_t v11 = v7;
  id v8 = v3;
  [v6 saveRecordZone:v4 completionHandler:v9];
}

void __89__FCPrivateDataEncryptionMigrationHealthCheck__prepareSubscriptionsAndReturnExpectations__block_invoke_2(uint64_t a1, int a2, id obj)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
  id v5 = obj;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __89__FCPrivateDataEncryptionMigrationHealthCheck__prepareSubscriptionsAndReturnExpectations__block_invoke_111(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) container];
  id v5 = [v4 privateCloudDatabase];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __89__FCPrivateDataEncryptionMigrationHealthCheck__prepareSubscriptionsAndReturnExpectations__block_invoke_2_112;
  v9[3] = &unk_1E5B4D000;
  uint64_t v7 = *(void *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  id v10 = v3;
  uint64_t v11 = v6;
  id v8 = v3;
  [v5 saveRecord:v7 completionHandler:v9];
}

void __89__FCPrivateDataEncryptionMigrationHealthCheck__prepareSubscriptionsAndReturnExpectations__block_invoke_2_112(uint64_t a1, int a2, id obj)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
  id v5 = obj;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_prepareSensitiveSubscriptionsAndReturnExpectations
{
  v83[1] = *MEMORY[0x1E4F143B8];
  id v3 = [(FCPrivateDataEncryptionMigrationHealthCheck *)self schema];
  id v4 = -[FCCKPrivateDatabaseSchema mappingFromRecordType:inZoneName:toVersion:](v3, @"Subscription", @"SensitiveSubscriptions", [(FCPrivateDataEncryptionMigrationHealthCheck *)self toVersion]);

  [MEMORY[0x1E4F29060] isMainThread];
  uint64_t v5 = [v4 fromZoneSchema];
  uint64_t v6 = (void *)v5;
  if (v5) {
    uint64_t v7 = *(void **)(v5 + 16);
  }
  else {
    uint64_t v7 = 0;
  }
  id v8 = v7;
  char v9 = [v8 isEqualToString:@"SensitiveSubscriptions"];

  if ((v9 & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3A8] format:@"sensitive subscriptions zone schema has wrong zone name"];
  }
  [MEMORY[0x1E4F29060] isMainThread];
  uint64_t v10 = [v4 fromRecordSchema];
  uint64_t v11 = (void *)v10;
  if (v10) {
    v12 = *(void **)(v10 + 16);
  }
  else {
    v12 = 0;
  }
  id v13 = v12;
  char v14 = [v13 isEqualToString:@"Subscription"];

  if ((v14 & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3A8] format:@"sensitive subscriptions record schema has wrong record type"];
  }
  [MEMORY[0x1E4F29060] isMainThread];
  v15 = [v4 toRecordSchema];
  objc_super v16 = -[FCCKRecordSchema allEncryptedFieldNames]((uint64_t)v15);
  char v17 = [v16 containsObject:@"tagID"];

  if ((v17 & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3A8] format:@"sensitive subscriptions record should have encrypted tagID"];
  }
  uint64_t v18 = [v4 fromZoneSchema];
  uint64_t v19 = (void *)v18;
  if (v18) {
    v20 = *(void **)(v18 + 24);
  }
  else {
    v20 = 0;
  }
  id v21 = v20;

  uint64_t v22 = [v4 toZoneSchema];
  uint64_t v23 = (void *)v22;
  if (v22) {
    uint64_t v24 = *(void **)(v22 + 24);
  }
  else {
    uint64_t v24 = 0;
  }
  id v62 = v24;

  uint64_t v76 = 0;
  id v77 = &v76;
  uint64_t v78 = 0x3032000000;
  id v79 = __Block_byref_object_copy__5;
  uint64_t v80 = __Block_byref_object_dispose__5;
  id v81 = 0;
  v72[0] = MEMORY[0x1E4F143A8];
  v72[1] = 3221225472;
  v72[2] = __98__FCPrivateDataEncryptionMigrationHealthCheck__prepareSensitiveSubscriptionsAndReturnExpectations__block_invoke;
  v72[3] = &unk_1E5B4CFD8;
  id v25 = v21;
  id v73 = v25;
  uint64_t v74 = self;
  id v75 = &v76;
  FCWaitUntilBlockIsInvoked(v72);
  [MEMORY[0x1E4F29060] isMainThread];
  if (v77[5]) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3A8], @"error saving subscriptions zone: %@", v77[5] format];
  }
  uint64_t v26 = FCRandomTagCloudKitID();
  v61 = +[FCSubscriptionList subscriptionIDForTagID:v26 type:0];
  id v60 = (void *)[objc_alloc(MEMORY[0x1E4F1A2F8]) initWithRecordName:v61 zoneID:v25];
  id v27 = objc_alloc(MEMORY[0x1E4F1A2D8]);
  uint64_t v28 = [v4 fromRecordSchema];
  id v29 = (void *)v28;
  if (v28) {
    v30 = *(void **)(v28 + 16);
  }
  else {
    v30 = 0;
  }
  id v31 = v30;
  v32 = (void *)[v27 initWithRecordType:v31 recordID:v60];

  [v32 setObject:@"autoFavoriteTag" forKeyedSubscript:@"subscriptionType"];
  [v32 setObject:&unk_1EF8D7650 forKeyedSubscript:@"subscriptionOrigin"];
  uint64_t v33 = [MEMORY[0x1E4F1C9C8] date];
  [v32 setObject:v33 forKeyedSubscript:@"dateAdded"];

  [v32 setObject:v26 forKeyedSubscript:@"tagID"];
  [v32 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"notificationsEnabled"];
  id v34 = [MEMORY[0x1E4F29128] UUID];
  v35 = [v34 UUIDString];
  [v32 setObject:v35 forKeyedSubscript:@"groupID"];

  [v32 setObject:&unk_1EF8D75D8 forKeyedSubscript:@"writerVersionHighWatermark"];
  [v32 setObject:&unk_1EF8D75D8 forKeyedSubscript:@"readerMinimumRequiredVersion"];
  uint64_t v66 = 0;
  v67 = &v66;
  uint64_t v68 = 0x3032000000;
  id v69 = __Block_byref_object_copy__5;
  uint64_t v70 = __Block_byref_object_dispose__5;
  id v71 = 0;
  v63[0] = MEMORY[0x1E4F143A8];
  v63[1] = 3221225472;
  v63[2] = __98__FCPrivateDataEncryptionMigrationHealthCheck__prepareSensitiveSubscriptionsAndReturnExpectations__block_invoke_127;
  v63[3] = &unk_1E5B4CFD8;
  v63[4] = self;
  id v36 = v32;
  id v64 = v36;
  v65 = &v66;
  FCWaitUntilBlockIsInvoked(v63);
  [MEMORY[0x1E4F29060] isMainThread];
  if (v67[5]) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3A8], @"error saving sensitive subscription record: %@", v67[5] format];
  }
  v37 = objc_opt_new();
  v38 = [(FCPrivateDataEncryptionMigrationHealthCheck *)self secureContainer];
  id v39 = [v38 privateCloudDatabase];
  [v37 setDatabase:v39];

  [v37 setZoneID:v62];
  [v37 setShouldExist:1];
  v40 = objc_opt_new();
  v41 = [(FCPrivateDataEncryptionMigrationHealthCheck *)self container];
  uint64_t v42 = [v41 privateCloudDatabase];
  [v40 setDatabase:v42];

  [v40 setZoneID:v25];
  [v40 setShouldExist:0];
  v43 = objc_opt_new();
  uint64_t v44 = [v4 toRecordSchema];
  id v45 = (void *)v44;
  if (v44) {
    v46 = *(void **)(v44 + 16);
  }
  else {
    v46 = 0;
  }
  id v47 = v46;
  [v43 setRecordType:v47];

  v48 = [v4 toRecordSchema];
  v49 = -[FCCKRecordSchema allUnencryptedFieldNames]((uint64_t)v48);
  [v43 setUnencryptedFields:v49];

  id v50 = [v4 toRecordSchema];
  v51 = -[FCCKRecordSchema allEncryptedFieldNames]((uint64_t)v50);
  [v43 setEncryptedFields:v51];

  v52 = [v36 valueStore];
  v53 = [v52 values];
  [v43 setExpectedValues:v53];

  v54 = objc_opt_new();
  v55 = [(FCPrivateDataEncryptionMigrationHealthCheck *)self secureContainer];
  v56 = [v55 privateCloudDatabase];
  [v54 setDatabase:v56];

  [v54 setZoneID:v62];
  v83[0] = v43;
  v57 = [MEMORY[0x1E4F1C978] arrayWithObjects:v83 count:1];
  [v54 setRecordTests:v57];

  v82[0] = v37;
  v82[1] = v54;
  v82[2] = v40;
  v58 = [MEMORY[0x1E4F1C978] arrayWithObjects:v82 count:3];

  _Block_object_dispose(&v66, 8);
  _Block_object_dispose(&v76, 8);

  return v58;
}

void __98__FCPrivateDataEncryptionMigrationHealthCheck__prepareSensitiveSubscriptionsAndReturnExpectations__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F1A310]) initWithZoneID:*(void *)(a1 + 32)];
  uint64_t v5 = [*(id *)(a1 + 40) container];
  uint64_t v6 = [v5 privateCloudDatabase];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __98__FCPrivateDataEncryptionMigrationHealthCheck__prepareSensitiveSubscriptionsAndReturnExpectations__block_invoke_2;
  v9[3] = &unk_1E5B4CFB0;
  uint64_t v7 = *(void *)(a1 + 48);
  id v10 = v3;
  uint64_t v11 = v7;
  id v8 = v3;
  [v6 saveRecordZone:v4 completionHandler:v9];
}

void __98__FCPrivateDataEncryptionMigrationHealthCheck__prepareSensitiveSubscriptionsAndReturnExpectations__block_invoke_2(uint64_t a1, int a2, id obj)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
  id v5 = obj;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __98__FCPrivateDataEncryptionMigrationHealthCheck__prepareSensitiveSubscriptionsAndReturnExpectations__block_invoke_127(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) container];
  id v5 = [v4 privateCloudDatabase];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __98__FCPrivateDataEncryptionMigrationHealthCheck__prepareSensitiveSubscriptionsAndReturnExpectations__block_invoke_2_128;
  v9[3] = &unk_1E5B4D000;
  uint64_t v7 = *(void *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  id v10 = v3;
  uint64_t v11 = v6;
  id v8 = v3;
  [v5 saveRecord:v7 completionHandler:v9];
}

void __98__FCPrivateDataEncryptionMigrationHealthCheck__prepareSensitiveSubscriptionsAndReturnExpectations__block_invoke_2_128(uint64_t a1, int a2, id obj)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
  id v5 = obj;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_prepareUserInfoAndReturnExpectations
{
  v85[1] = *MEMORY[0x1E4F143B8];
  id v3 = [(FCPrivateDataEncryptionMigrationHealthCheck *)self schema];
  id v4 = -[FCCKPrivateDatabaseSchema mappingFromRecordType:inZoneName:toVersion:](v3, @"UserInfo", @"UserInfo", [(FCPrivateDataEncryptionMigrationHealthCheck *)self toVersion]);

  [MEMORY[0x1E4F29060] isMainThread];
  uint64_t v5 = [v4 fromZoneSchema];
  uint64_t v6 = (void *)v5;
  if (v5) {
    uint64_t v7 = *(void **)(v5 + 16);
  }
  else {
    uint64_t v7 = 0;
  }
  id v8 = v7;
  char v9 = [v8 isEqualToString:@"UserInfo"];

  if ((v9 & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3A8] format:@"user info zone schema has wrong zone name"];
  }
  [MEMORY[0x1E4F29060] isMainThread];
  uint64_t v10 = [v4 fromRecordSchema];
  uint64_t v11 = (void *)v10;
  if (v10) {
    v12 = *(void **)(v10 + 16);
  }
  else {
    v12 = 0;
  }
  id v13 = v12;
  char v14 = [v13 isEqualToString:@"UserInfo"];

  if ((v14 & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3A8] format:@"user info record schema has wrong record type"];
  }
  [MEMORY[0x1E4F29060] isMainThread];
  v15 = [v4 toRecordSchema];
  objc_super v16 = -[FCCKRecordSchema allEncryptedFieldNames]((uint64_t)v15);
  char v17 = [v16 containsObject:@"feldsparID"];

  if ((v17 & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3A8] format:@"user info record should have encrypted feldsparID"];
  }
  uint64_t v18 = [v4 fromZoneSchema];
  uint64_t v19 = (void *)v18;
  if (v18) {
    v20 = *(void **)(v18 + 24);
  }
  else {
    v20 = 0;
  }
  id v21 = v20;

  uint64_t v22 = [v4 toZoneSchema];
  uint64_t v23 = (void *)v22;
  if (v22) {
    uint64_t v24 = *(void **)(v22 + 24);
  }
  else {
    uint64_t v24 = 0;
  }
  id v64 = v24;

  uint64_t v78 = 0;
  id v79 = &v78;
  uint64_t v80 = 0x3032000000;
  id v81 = __Block_byref_object_copy__5;
  uint64_t v82 = __Block_byref_object_dispose__5;
  id v83 = 0;
  v74[0] = MEMORY[0x1E4F143A8];
  v74[1] = 3221225472;
  v74[2] = __84__FCPrivateDataEncryptionMigrationHealthCheck__prepareUserInfoAndReturnExpectations__block_invoke;
  v74[3] = &unk_1E5B4CFD8;
  id v63 = v21;
  id v75 = v63;
  uint64_t v76 = self;
  id v77 = &v78;
  FCWaitUntilBlockIsInvoked(v74);
  [MEMORY[0x1E4F29060] isMainThread];
  if (v79[5]) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3A8], @"error saving user info zone: %@", v79[5] format];
  }
  id v62 = (void *)[objc_alloc(MEMORY[0x1E4F1A2F8]) initWithRecordName:@"user_info_static_record_name" zoneID:v63];
  v61 = (void *)[objc_alloc(MEMORY[0x1E4F1A2F8]) initWithRecordName:@"user_info_static_record_name_secure" zoneID:v64];
  id v25 = objc_alloc(MEMORY[0x1E4F1A2D8]);
  uint64_t v26 = [v4 fromRecordSchema];
  id v27 = (void *)v26;
  if (v26) {
    uint64_t v28 = *(void **)(v26 + 16);
  }
  else {
    uint64_t v28 = 0;
  }
  id v29 = v28;
  v30 = (void *)[v25 initWithRecordType:v29 recordID:v62];

  id v31 = [MEMORY[0x1E4F29128] UUID];
  v32 = [v31 UUIDString];
  [v30 setObject:v32 forKeyedSubscript:@"feldsparID"];

  uint64_t v33 = [MEMORY[0x1E4F1C9C8] date];
  [v30 setObject:v33 forKeyedSubscript:@"lastOpenedDate"];

  [v30 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"topStoriesIntroduced"];
  [v30 setObject:&unk_1EF8D75D8 forKeyedSubscript:@"writerVersionHighWatermark"];
  [v30 setObject:&unk_1EF8D75D8 forKeyedSubscript:@"readerMinimumRequiredVersion"];
  uint64_t v68 = 0;
  id v69 = &v68;
  uint64_t v70 = 0x3032000000;
  id v71 = __Block_byref_object_copy__5;
  uint64_t v72 = __Block_byref_object_dispose__5;
  id v73 = 0;
  v65[0] = MEMORY[0x1E4F143A8];
  v65[1] = 3221225472;
  v65[2] = __84__FCPrivateDataEncryptionMigrationHealthCheck__prepareUserInfoAndReturnExpectations__block_invoke_3;
  v65[3] = &unk_1E5B4CFD8;
  v65[4] = self;
  id v34 = v30;
  id v66 = v34;
  v67 = &v68;
  FCWaitUntilBlockIsInvoked(v65);
  [MEMORY[0x1E4F29060] isMainThread];
  if (v69[5]) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3A8], @"error saving user info record: %@", v69[5] format];
  }
  v35 = objc_opt_new();
  id v36 = [(FCPrivateDataEncryptionMigrationHealthCheck *)self secureContainer];
  v37 = [v36 privateCloudDatabase];
  [v35 setDatabase:v37];

  [v35 setZoneID:v64];
  [v35 setShouldExist:1];
  v38 = objc_opt_new();
  id v39 = [(FCPrivateDataEncryptionMigrationHealthCheck *)self container];
  v40 = [v39 privateCloudDatabase];
  [v38 setDatabase:v40];

  [v38 setZoneID:v63];
  [v38 setShouldExist:0];
  v41 = objc_opt_new();
  uint64_t v42 = [v4 toRecordSchema];
  v43 = (void *)v42;
  if (v42) {
    uint64_t v44 = *(void **)(v42 + 16);
  }
  else {
    uint64_t v44 = 0;
  }
  id v45 = v44;
  [v41 setRecordType:v45];

  v46 = [v4 toRecordSchema];
  id v47 = -[FCCKRecordSchema allUnencryptedFieldNames]((uint64_t)v46);
  [v41 setUnencryptedFields:v47];

  v48 = [v4 toRecordSchema];
  v49 = -[FCCKRecordSchema allEncryptedFieldNames]((uint64_t)v48);
  [v41 setEncryptedFields:v49];

  id v50 = [v34 valueStore];
  v51 = [v50 values];
  [v41 setExpectedValues:v51];

  v52 = objc_opt_new();
  v53 = [(FCPrivateDataEncryptionMigrationHealthCheck *)self secureContainer];
  v54 = [v53 privateCloudDatabase];
  [v52 setDatabase:v54];

  [v52 setZoneID:v64];
  v85[0] = v41;
  v55 = [MEMORY[0x1E4F1C978] arrayWithObjects:v85 count:1];
  [v52 setRecordTests:v55];

  v56 = objc_opt_new();
  v57 = [(FCPrivateDataEncryptionMigrationHealthCheck *)self secureContainer];
  v58 = [v57 privateCloudDatabase];
  [v56 setDatabase:v58];

  [v56 setRecordID:v61];
  [v56 setShouldExist:1];
  v84[0] = v35;
  v84[1] = v52;
  v84[2] = v38;
  v84[3] = v56;
  v59 = [MEMORY[0x1E4F1C978] arrayWithObjects:v84 count:4];

  _Block_object_dispose(&v68, 8);
  _Block_object_dispose(&v78, 8);

  return v59;
}

void __84__FCPrivateDataEncryptionMigrationHealthCheck__prepareUserInfoAndReturnExpectations__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F1A310]) initWithZoneID:*(void *)(a1 + 32)];
  uint64_t v5 = [*(id *)(a1 + 40) container];
  uint64_t v6 = [v5 privateCloudDatabase];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __84__FCPrivateDataEncryptionMigrationHealthCheck__prepareUserInfoAndReturnExpectations__block_invoke_2;
  v9[3] = &unk_1E5B4CFB0;
  uint64_t v7 = *(void *)(a1 + 48);
  id v10 = v3;
  uint64_t v11 = v7;
  id v8 = v3;
  [v6 saveRecordZone:v4 completionHandler:v9];
}

void __84__FCPrivateDataEncryptionMigrationHealthCheck__prepareUserInfoAndReturnExpectations__block_invoke_2(uint64_t a1, int a2, id obj)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
  id v5 = obj;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __84__FCPrivateDataEncryptionMigrationHealthCheck__prepareUserInfoAndReturnExpectations__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) container];
  id v5 = [v4 privateCloudDatabase];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __84__FCPrivateDataEncryptionMigrationHealthCheck__prepareUserInfoAndReturnExpectations__block_invoke_4;
  v9[3] = &unk_1E5B4D000;
  uint64_t v7 = *(void *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  id v10 = v3;
  uint64_t v11 = v6;
  id v8 = v3;
  [v5 saveRecord:v7 completionHandler:v9];
}

void __84__FCPrivateDataEncryptionMigrationHealthCheck__prepareUserInfoAndReturnExpectations__block_invoke_4(uint64_t a1, int a2, id obj)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
  id v5 = obj;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_prepareTagSettingsAndReturnExpectations
{
  v82[1] = *MEMORY[0x1E4F143B8];
  id v3 = [(FCPrivateDataEncryptionMigrationHealthCheck *)self schema];
  id v4 = -[FCCKPrivateDatabaseSchema mappingFromRecordType:inZoneName:toVersion:](v3, @"TagSettings", @"UserInfo", [(FCPrivateDataEncryptionMigrationHealthCheck *)self toVersion]);

  [MEMORY[0x1E4F29060] isMainThread];
  uint64_t v5 = [v4 fromZoneSchema];
  uint64_t v6 = (void *)v5;
  if (v5) {
    uint64_t v7 = *(void **)(v5 + 16);
  }
  else {
    uint64_t v7 = 0;
  }
  id v8 = v7;
  char v9 = [v8 isEqualToString:@"UserInfo"];

  if ((v9 & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3A8] format:@"tag settings zone schema has wrong zone name"];
  }
  [MEMORY[0x1E4F29060] isMainThread];
  uint64_t v10 = [v4 fromRecordSchema];
  uint64_t v11 = (void *)v10;
  if (v10) {
    v12 = *(void **)(v10 + 16);
  }
  else {
    v12 = 0;
  }
  id v13 = v12;
  char v14 = [v13 isEqualToString:@"TagSettings"];

  if ((v14 & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3A8] format:@"tag settings record schema has wrong record type"];
  }
  [MEMORY[0x1E4F29060] isMainThread];
  v15 = [v4 toRecordSchema];
  objc_super v16 = -[FCCKRecordSchema allEncryptedFieldNames]((uint64_t)v15);
  char v17 = [v16 containsObject:@"tagID"];

  if ((v17 & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3A8] format:@"tag settings record should have encrypted tagID"];
  }
  uint64_t v18 = [v4 fromZoneSchema];
  uint64_t v19 = (void *)v18;
  if (v18) {
    v20 = *(void **)(v18 + 24);
  }
  else {
    v20 = 0;
  }
  id v21 = v20;

  uint64_t v22 = [v4 toZoneSchema];
  uint64_t v23 = (void *)v22;
  if (v22) {
    uint64_t v24 = *(void **)(v22 + 24);
  }
  else {
    uint64_t v24 = 0;
  }
  id v61 = v24;

  uint64_t v75 = 0;
  uint64_t v76 = &v75;
  uint64_t v77 = 0x3032000000;
  uint64_t v78 = __Block_byref_object_copy__5;
  id v79 = __Block_byref_object_dispose__5;
  id v80 = 0;
  v71[0] = MEMORY[0x1E4F143A8];
  v71[1] = 3221225472;
  v71[2] = __87__FCPrivateDataEncryptionMigrationHealthCheck__prepareTagSettingsAndReturnExpectations__block_invoke;
  v71[3] = &unk_1E5B4CFD8;
  id v25 = v21;
  id v72 = v25;
  id v73 = self;
  uint64_t v74 = &v75;
  FCWaitUntilBlockIsInvoked(v71);
  [MEMORY[0x1E4F29060] isMainThread];
  if (v76[5]) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3A8], @"error saving user info zone: %@", v76[5] format];
  }
  uint64_t v26 = FCRandomTagCloudKitID();
  id v60 = FCTagSettingsEntryIDFromTagID((uint64_t)v26);
  v59 = (void *)[objc_alloc(MEMORY[0x1E4F1A2F8]) initWithRecordName:v60 zoneID:v25];
  id v27 = objc_alloc(MEMORY[0x1E4F1A2D8]);
  uint64_t v28 = [v4 fromRecordSchema];
  id v29 = (void *)v28;
  if (v28) {
    v30 = *(void **)(v28 + 16);
  }
  else {
    v30 = 0;
  }
  id v31 = v30;
  v32 = (void *)[v27 initWithRecordType:v31 recordID:v59];

  [v32 setObject:v26 forKeyedSubscript:@"tagID"];
  uint64_t v33 = [MEMORY[0x1E4F29128] UUID];
  id v34 = [v33 UUIDString];
  [v32 setObject:v34 forKeyedSubscript:@"accessToken"];

  [v32 setObject:&unk_1EF8D7668 forKeyedSubscript:@"fontMultiplier"];
  [v32 setObject:&unk_1EF8D75D8 forKeyedSubscript:@"writerVersionHighWatermark"];
  [v32 setObject:&unk_1EF8D75D8 forKeyedSubscript:@"readerMinimumRequiredVersion"];
  uint64_t v65 = 0;
  id v66 = &v65;
  uint64_t v67 = 0x3032000000;
  uint64_t v68 = __Block_byref_object_copy__5;
  id v69 = __Block_byref_object_dispose__5;
  id v70 = 0;
  v62[0] = MEMORY[0x1E4F143A8];
  v62[1] = 3221225472;
  v62[2] = __87__FCPrivateDataEncryptionMigrationHealthCheck__prepareTagSettingsAndReturnExpectations__block_invoke_159;
  v62[3] = &unk_1E5B4CFD8;
  v62[4] = self;
  id v35 = v32;
  id v63 = v35;
  id v64 = &v65;
  FCWaitUntilBlockIsInvoked(v62);
  [MEMORY[0x1E4F29060] isMainThread];
  if (v66[5]) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3A8], @"error saving tag settings record: %@", v66[5] format];
  }
  id v36 = objc_opt_new();
  v37 = [(FCPrivateDataEncryptionMigrationHealthCheck *)self secureContainer];
  v38 = [v37 privateCloudDatabase];
  [v36 setDatabase:v38];

  [v36 setZoneID:v61];
  [v36 setShouldExist:1];
  id v39 = objc_opt_new();
  v40 = [(FCPrivateDataEncryptionMigrationHealthCheck *)self container];
  v41 = [v40 privateCloudDatabase];
  [v39 setDatabase:v41];

  [v39 setZoneID:v25];
  [v39 setShouldExist:0];
  uint64_t v42 = objc_opt_new();
  uint64_t v43 = [v4 toRecordSchema];
  uint64_t v44 = (void *)v43;
  if (v43) {
    id v45 = *(void **)(v43 + 16);
  }
  else {
    id v45 = 0;
  }
  id v46 = v45;
  [v42 setRecordType:v46];

  id v47 = [v4 toRecordSchema];
  v48 = -[FCCKRecordSchema allUnencryptedFieldNames]((uint64_t)v47);
  [v42 setUnencryptedFields:v48];

  v49 = [v4 toRecordSchema];
  id v50 = -[FCCKRecordSchema allEncryptedFieldNames]((uint64_t)v49);
  [v42 setEncryptedFields:v50];

  v51 = [v35 valueStore];
  v52 = [v51 values];
  [v42 setExpectedValues:v52];

  v53 = objc_opt_new();
  v54 = [(FCPrivateDataEncryptionMigrationHealthCheck *)self secureContainer];
  v55 = [v54 privateCloudDatabase];
  [v53 setDatabase:v55];

  [v53 setZoneID:v61];
  v82[0] = v42;
  v56 = [MEMORY[0x1E4F1C978] arrayWithObjects:v82 count:1];
  [v53 setRecordTests:v56];

  v81[0] = v36;
  v81[1] = v53;
  v81[2] = v39;
  v57 = [MEMORY[0x1E4F1C978] arrayWithObjects:v81 count:3];

  _Block_object_dispose(&v65, 8);
  _Block_object_dispose(&v75, 8);

  return v57;
}

void __87__FCPrivateDataEncryptionMigrationHealthCheck__prepareTagSettingsAndReturnExpectations__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F1A310]) initWithZoneID:*(void *)(a1 + 32)];
  uint64_t v5 = [*(id *)(a1 + 40) container];
  uint64_t v6 = [v5 privateCloudDatabase];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __87__FCPrivateDataEncryptionMigrationHealthCheck__prepareTagSettingsAndReturnExpectations__block_invoke_2;
  v9[3] = &unk_1E5B4CFB0;
  uint64_t v7 = *(void *)(a1 + 48);
  id v10 = v3;
  uint64_t v11 = v7;
  id v8 = v3;
  [v6 saveRecordZone:v4 completionHandler:v9];
}

void __87__FCPrivateDataEncryptionMigrationHealthCheck__prepareTagSettingsAndReturnExpectations__block_invoke_2(uint64_t a1, int a2, id obj)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
  id v5 = obj;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __87__FCPrivateDataEncryptionMigrationHealthCheck__prepareTagSettingsAndReturnExpectations__block_invoke_159(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) container];
  id v5 = [v4 privateCloudDatabase];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __87__FCPrivateDataEncryptionMigrationHealthCheck__prepareTagSettingsAndReturnExpectations__block_invoke_2_160;
  v9[3] = &unk_1E5B4D000;
  uint64_t v7 = *(void *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  id v10 = v3;
  uint64_t v11 = v6;
  id v8 = v3;
  [v5 saveRecord:v7 completionHandler:v9];
}

void __87__FCPrivateDataEncryptionMigrationHealthCheck__prepareTagSettingsAndReturnExpectations__block_invoke_2_160(uint64_t a1, int a2, id obj)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
  id v5 = obj;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_preparePersonalizationProfileAndReturnExpectations
{
  v62[4] = *MEMORY[0x1E4F143B8];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F1A2F8]) initWithRecordName:@"SharedPersonalizationProfile"];
  id v4 = [(FCPrivateDataEncryptionMigrationHealthCheck *)self schema];
  v52 = -[FCCKPrivateDatabaseSchema mappingFromRecordID:toVersion:]((uint64_t)v4, v3, [(FCPrivateDataEncryptionMigrationHealthCheck *)self toVersion]);

  id v5 = [(FCPrivateDataEncryptionMigrationHealthCheck *)self schema];
  uint64_t v6 = *MEMORY[0x1E4F19D88];
  uint64_t v7 = -[FCCKPrivateDatabaseSchema mappingFromRecordType:inZoneName:toVersion:](v5, @"PersonalizationProfile", (void *)*MEMORY[0x1E4F19D88], [(FCPrivateDataEncryptionMigrationHealthCheck *)self toVersion]);

  [MEMORY[0x1E4F29060] isMainThread];
  uint64_t v8 = [v52 fromZoneSchema];
  char v9 = (void *)v8;
  if (v8) {
    id v10 = *(void **)(v8 + 16);
  }
  else {
    id v10 = 0;
  }
  id v11 = v10;
  char v12 = [v11 isEqualToString:v6];

  if ((v12 & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3A8] format:@"personalization zone schema has wrong zone name"];
  }
  [MEMORY[0x1E4F29060] isMainThread];
  uint64_t v13 = [v7 fromRecordSchema];
  char v14 = (void *)v13;
  if (v13) {
    v15 = *(void **)(v13 + 16);
  }
  else {
    v15 = 0;
  }
  id v16 = v15;
  char v17 = [v16 isEqualToString:@"PersonalizationProfile"];

  if ((v17 & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3A8] format:@"personalization record schema has wrong record type"];
  }
  [MEMORY[0x1E4F29060] isMainThread];
  uint64_t v18 = [v7 toRecordSchema];
  uint64_t v19 = -[FCCKRecordSchema allEncryptedFieldNames]((uint64_t)v18);
  char v20 = [v19 containsObject:@"data"];

  if ((v20 & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3A8] format:@"personalization record should have encrypted data"];
  }
  uint64_t v21 = [v7 fromZoneSchema];
  uint64_t v22 = (void *)v21;
  if (v21) {
    uint64_t v23 = *(void **)(v21 + 24);
  }
  else {
    uint64_t v23 = 0;
  }
  id v51 = v23;

  uint64_t v24 = [v7 toZoneSchema];
  id v25 = (void *)v24;
  if (v24) {
    uint64_t v26 = *(void **)(v24 + 24);
  }
  else {
    uint64_t v26 = 0;
  }
  id v50 = v26;

  id v27 = objc_alloc(MEMORY[0x1E4F1A2D8]);
  uint64_t v28 = [v7 fromRecordSchema];
  id v29 = (void *)v28;
  if (v28) {
    v30 = *(void **)(v28 + 16);
  }
  else {
    v30 = 0;
  }
  id v31 = v30;
  v32 = (void *)[v27 initWithRecordType:v31 recordID:v3];

  uint64_t v33 = objc_msgSend(MEMORY[0x1E4F1C9B8], "fc_randomDataWithLength:", 500000);
  [v32 setObject:v33 forKeyedSubscript:@"data"];

  [v32 setObject:&unk_1EF8D7680 forKeyedSubscript:@"version"];
  [v32 setObject:&unk_1EF8D75D8 forKeyedSubscript:@"writerVersionHighWatermark"];
  [v32 setObject:&unk_1EF8D75D8 forKeyedSubscript:@"readerMinimumRequiredVersion"];
  uint64_t v56 = 0;
  v57 = &v56;
  uint64_t v58 = 0x3032000000;
  v59 = __Block_byref_object_copy__5;
  id v60 = __Block_byref_object_dispose__5;
  id v61 = 0;
  v53[0] = MEMORY[0x1E4F143A8];
  v53[1] = 3221225472;
  v53[2] = __98__FCPrivateDataEncryptionMigrationHealthCheck__preparePersonalizationProfileAndReturnExpectations__block_invoke;
  v53[3] = &unk_1E5B4CFD8;
  v53[4] = self;
  id v34 = v32;
  id v54 = v34;
  v55 = &v56;
  FCWaitUntilBlockIsInvoked(v53);
  [MEMORY[0x1E4F29060] isMainThread];
  if (v57[5]) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3A8], @"error saving personalization profile record: %@", v57[5] format];
  }
  id v35 = objc_opt_new();
  id v36 = [(FCPrivateDataEncryptionMigrationHealthCheck *)self secureContainer];
  v37 = [v36 privateCloudDatabase];
  [v35 setDatabase:v37];

  [v35 setZoneID:v51];
  [v35 setShouldExist:1];
  v38 = objc_opt_new();
  id v39 = [(FCPrivateDataEncryptionMigrationHealthCheck *)self secureContainer];
  v40 = [v39 privateCloudDatabase];
  [v38 setDatabase:v40];

  [v38 setZoneID:v50];
  [v38 setShouldExist:1];
  v41 = objc_opt_new();
  uint64_t v42 = [(FCPrivateDataEncryptionMigrationHealthCheck *)self secureContainer];
  uint64_t v43 = [v42 privateCloudDatabase];
  [v41 setDatabase:v43];

  uint64_t v44 = [v52 toRecordID];
  [v41 setRecordID:v44];

  [v41 setShouldExist:1];
  id v45 = objc_opt_new();
  id v46 = [(FCPrivateDataEncryptionMigrationHealthCheck *)self secureContainer];
  id v47 = [v46 privateCloudDatabase];
  [v45 setDatabase:v47];

  [v45 setRecordID:v3];
  [v45 setShouldExist:0];
  v62[0] = v35;
  v62[1] = v38;
  v62[2] = v41;
  v62[3] = v45;
  v48 = [MEMORY[0x1E4F1C978] arrayWithObjects:v62 count:4];

  _Block_object_dispose(&v56, 8);
  return v48;
}

void __98__FCPrivateDataEncryptionMigrationHealthCheck__preparePersonalizationProfileAndReturnExpectations__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) container];
  id v5 = [v4 privateCloudDatabase];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __98__FCPrivateDataEncryptionMigrationHealthCheck__preparePersonalizationProfileAndReturnExpectations__block_invoke_2;
  v9[3] = &unk_1E5B4D000;
  uint64_t v7 = *(void *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  id v10 = v3;
  uint64_t v11 = v6;
  id v8 = v3;
  [v5 saveRecord:v7 completionHandler:v9];
}

void __98__FCPrivateDataEncryptionMigrationHealthCheck__preparePersonalizationProfileAndReturnExpectations__block_invoke_2(uint64_t a1, int a2, id obj)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
  id v5 = obj;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_prepareReferenceToChannelMembershipsAndReturnExpectations
{
  v94[1] = *MEMORY[0x1E4F143B8];
  id v3 = [(FCPrivateDataEncryptionMigrationHealthCheck *)self schema];
  id v4 = -[FCCKPrivateDatabaseSchema mappingFromRecordType:inZoneName:toVersion:](v3, @"ReferenceToMembership", @"ChannelMemberships", [(FCPrivateDataEncryptionMigrationHealthCheck *)self toVersion]);

  [MEMORY[0x1E4F29060] isMainThread];
  uint64_t v5 = [v4 fromZoneSchema];
  uint64_t v6 = (void *)v5;
  if (v5) {
    uint64_t v7 = *(void **)(v5 + 16);
  }
  else {
    uint64_t v7 = 0;
  }
  id v8 = v7;
  char v9 = [v8 isEqualToString:@"ChannelMemberships"];

  if ((v9 & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3A8] format:@"reference-to-membership zone schema has wrong zone name"];
  }
  [MEMORY[0x1E4F29060] isMainThread];
  uint64_t v10 = [v4 fromZoneSchema];
  uint64_t v11 = (void *)v10;
  if (v10) {
    char v12 = *(void **)(v10 + 16);
  }
  else {
    char v12 = 0;
  }
  id v13 = v12;
  uint64_t v14 = [v4 toZoneSchema];
  v15 = (void *)v14;
  if (v14) {
    id v16 = *(void **)(v14 + 16);
  }
  else {
    id v16 = 0;
  }
  id v17 = v16;
  char v18 = [v13 isEqualToString:v17];

  if ((v18 & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3A8] format:@"reference-to-membership zone name should be the same on client and server"];
  }
  [MEMORY[0x1E4F29060] isMainThread];
  uint64_t v19 = [v4 fromRecordSchema];
  char v20 = (void *)v19;
  if (v19) {
    uint64_t v21 = *(void **)(v19 + 16);
  }
  else {
    uint64_t v21 = 0;
  }
  id v22 = v21;
  char v23 = [v22 isEqualToString:@"ReferenceToMembership"];

  if ((v23 & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3A8] format:@"reference-to-membership record schema has wrong record type"];
  }
  [MEMORY[0x1E4F29060] isMainThread];
  uint64_t v24 = [v4 fromRecordSchema];
  id v25 = (void *)v24;
  if (v24) {
    uint64_t v26 = *(void **)(v24 + 16);
  }
  else {
    uint64_t v26 = 0;
  }
  id v27 = v26;
  uint64_t v28 = [v4 toRecordSchema];
  id v29 = (void *)v28;
  if (v28) {
    v30 = *(void **)(v28 + 16);
  }
  else {
    v30 = 0;
  }
  id v31 = v30;
  char v32 = [v27 isEqualToString:v31];

  if ((v32 & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3A8] format:@"reference-to-membership record type should be the same on client and server"];
  }
  uint64_t v33 = [v4 fromZoneSchema];
  id v34 = (void *)v33;
  if (v33) {
    id v35 = *(void **)(v33 + 24);
  }
  else {
    id v35 = 0;
  }
  id v36 = v35;

  uint64_t v87 = 0;
  v88 = &v87;
  uint64_t v89 = 0x3032000000;
  v90 = __Block_byref_object_copy__5;
  v91 = __Block_byref_object_dispose__5;
  id v92 = 0;
  v83[0] = MEMORY[0x1E4F143A8];
  v83[1] = 3221225472;
  v83[2] = __105__FCPrivateDataEncryptionMigrationHealthCheck__prepareReferenceToChannelMembershipsAndReturnExpectations__block_invoke;
  void v83[3] = &unk_1E5B4CFD8;
  id v37 = v36;
  id v84 = v37;
  id v85 = self;
  v86 = &v87;
  FCWaitUntilBlockIsInvoked(v83);
  [MEMORY[0x1E4F29060] isMainThread];
  if (v88[5]) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3A8], @"error saving reference-to-membership zone: %@", v88[5] format];
  }
  id v38 = objc_alloc(MEMORY[0x1E4F1A2F8]);
  id v39 = [MEMORY[0x1E4F29128] UUID];
  v40 = [v39 UUIDString];
  v41 = (void *)[v38 initWithRecordName:v40 zoneID:v37];

  id v42 = objc_alloc(MEMORY[0x1E4F1A2D8]);
  uint64_t v43 = [v4 fromRecordSchema];
  uint64_t v44 = (void *)v43;
  if (v43) {
    id v45 = *(void **)(v43 + 16);
  }
  else {
    id v45 = 0;
  }
  id v46 = v45;
  id v47 = (void *)[v42 initWithRecordType:v46 recordID:v41];

  v48 = [MEMORY[0x1E4F29128] UUID];
  v49 = [v48 UUIDString];
  [v47 setObject:v49 forKeyedSubscript:@"membershipID"];

  uint64_t v77 = 0;
  uint64_t v78 = &v77;
  uint64_t v79 = 0x3032000000;
  id v80 = __Block_byref_object_copy__5;
  id v81 = __Block_byref_object_dispose__5;
  id v82 = 0;
  v74[0] = MEMORY[0x1E4F143A8];
  v74[1] = 3221225472;
  v74[2] = __105__FCPrivateDataEncryptionMigrationHealthCheck__prepareReferenceToChannelMembershipsAndReturnExpectations__block_invoke_3;
  v74[3] = &unk_1E5B4CFD8;
  void v74[4] = self;
  id v50 = v47;
  id v75 = v50;
  uint64_t v76 = &v77;
  FCWaitUntilBlockIsInvoked(v74);
  [MEMORY[0x1E4F29060] isMainThread];
  if (v78[5]) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3A8], @"error saving reference-to-membership record: %@", v78[5] format];
  }
  id v51 = objc_opt_new();
  v52 = [(FCPrivateDataEncryptionMigrationHealthCheck *)self secureContainer];
  v53 = [v52 privateCloudDatabase];
  [v51 setDatabase:v53];

  [v51 setZoneID:v37];
  [v51 setShouldExist:0];
  id v54 = objc_opt_new();
  v55 = [(FCPrivateDataEncryptionMigrationHealthCheck *)self container];
  uint64_t v56 = [v55 privateCloudDatabase];
  [v54 setDatabase:v56];

  [v54 setZoneID:v37];
  [v54 setShouldExist:1];
  v57 = objc_opt_new();
  uint64_t v58 = [v4 toRecordSchema];
  v59 = (void *)v58;
  if (v58) {
    id v60 = *(void **)(v58 + 16);
  }
  else {
    id v60 = 0;
  }
  id v61 = v60;
  [v57 setRecordType:v61];

  id v62 = [v4 toRecordSchema];
  id v63 = -[FCCKRecordSchema allUnencryptedFieldNames]((uint64_t)v62);
  [v57 setUnencryptedFields:v63];

  id v64 = [v4 toRecordSchema];
  uint64_t v65 = -[FCCKRecordSchema allEncryptedFieldNames]((uint64_t)v64);
  [v57 setEncryptedFields:v65];

  id v66 = [v50 valueStore];
  uint64_t v67 = [v66 values];
  [v57 setExpectedValues:v67];

  uint64_t v68 = objc_opt_new();
  id v69 = [(FCPrivateDataEncryptionMigrationHealthCheck *)self container];
  id v70 = [v69 privateCloudDatabase];
  [v68 setDatabase:v70];

  [v68 setZoneID:v37];
  v94[0] = v57;
  id v71 = [MEMORY[0x1E4F1C978] arrayWithObjects:v94 count:1];
  [v68 setRecordTests:v71];

  v93[0] = v51;
  v93[1] = v54;
  v93[2] = v68;
  id v72 = [MEMORY[0x1E4F1C978] arrayWithObjects:v93 count:3];

  _Block_object_dispose(&v77, 8);
  _Block_object_dispose(&v87, 8);

  return v72;
}

void __105__FCPrivateDataEncryptionMigrationHealthCheck__prepareReferenceToChannelMembershipsAndReturnExpectations__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F1A310]) initWithZoneID:*(void *)(a1 + 32)];
  uint64_t v5 = [*(id *)(a1 + 40) container];
  uint64_t v6 = [v5 privateCloudDatabase];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __105__FCPrivateDataEncryptionMigrationHealthCheck__prepareReferenceToChannelMembershipsAndReturnExpectations__block_invoke_2;
  v9[3] = &unk_1E5B4CFB0;
  uint64_t v7 = *(void *)(a1 + 48);
  id v10 = v3;
  uint64_t v11 = v7;
  id v8 = v3;
  [v6 saveRecordZone:v4 completionHandler:v9];
}

void __105__FCPrivateDataEncryptionMigrationHealthCheck__prepareReferenceToChannelMembershipsAndReturnExpectations__block_invoke_2(uint64_t a1, int a2, id obj)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
  id v5 = obj;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __105__FCPrivateDataEncryptionMigrationHealthCheck__prepareReferenceToChannelMembershipsAndReturnExpectations__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) container];
  id v5 = [v4 privateCloudDatabase];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __105__FCPrivateDataEncryptionMigrationHealthCheck__prepareReferenceToChannelMembershipsAndReturnExpectations__block_invoke_4;
  v9[3] = &unk_1E5B4D000;
  uint64_t v7 = *(void *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  id v10 = v3;
  uint64_t v11 = v6;
  id v8 = v3;
  [v5 saveRecord:v7 completionHandler:v9];
}

void __105__FCPrivateDataEncryptionMigrationHealthCheck__prepareReferenceToChannelMembershipsAndReturnExpectations__block_invoke_4(uint64_t a1, int a2, id obj)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
  id v5 = obj;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_prepareSentinelsAndReturnExpectations
{
  v21[3] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F1A320]);
  id v4 = (void *)[v3 initWithZoneName:*MEMORY[0x1E4F19D88] ownerName:*MEMORY[0x1E4F19C08]];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F1A2F8]) initWithRecordName:@"static_sentinel" zoneID:v4];
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F1A2F8]) initWithRecordName:@"static_sentinel_secure" zoneID:v4];
  uint64_t v7 = objc_opt_new();
  id v8 = [(FCPrivateDataEncryptionMigrationHealthCheck *)self container];
  char v9 = [v8 privateCloudDatabase];
  [v7 setDatabase:v9];

  [v7 setRecordID:v5];
  [v7 setShouldExist:1];
  id v10 = objc_opt_new();
  uint64_t v11 = [(FCPrivateDataEncryptionMigrationHealthCheck *)self secureContainer];
  char v12 = [v11 privateCloudDatabase];
  [v10 setDatabase:v12];

  [v10 setRecordID:v6];
  [v10 setShouldExist:1];
  id v13 = objc_opt_new();
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __85__FCPrivateDataEncryptionMigrationHealthCheck__prepareSentinelsAndReturnExpectations__block_invoke;
  v18[3] = &unk_1E5B4C738;
  v18[4] = self;
  id v19 = v5;
  id v20 = v6;
  id v14 = v6;
  id v15 = v5;
  [v13 setBlock:v18];
  v21[0] = v7;
  v21[1] = v10;
  v21[2] = v13;
  id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:3];

  return v16;
}

void __85__FCPrivateDataEncryptionMigrationHealthCheck__prepareSentinelsAndReturnExpectations__block_invoke(uint64_t a1)
{
  uint64_t v33 = 0;
  id v34 = &v33;
  uint64_t v35 = 0x3032000000;
  id v36 = __Block_byref_object_copy__5;
  id v37 = __Block_byref_object_dispose__5;
  id v38 = 0;
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __85__FCPrivateDataEncryptionMigrationHealthCheck__prepareSentinelsAndReturnExpectations__block_invoke_2;
  v30[3] = &unk_1E5B4CFD8;
  v2 = *(void **)(a1 + 40);
  void v30[4] = *(void *)(a1 + 32);
  id v31 = v2;
  char v32 = &v33;
  FCWaitUntilBlockIsInvoked(v30);
  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x3032000000;
  id v27 = __Block_byref_object_copy__5;
  uint64_t v28 = __Block_byref_object_dispose__5;
  id v29 = 0;
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  id v19 = __85__FCPrivateDataEncryptionMigrationHealthCheck__prepareSentinelsAndReturnExpectations__block_invoke_4;
  id v20 = &unk_1E5B4CFD8;
  uint64_t v21 = *(void *)(a1 + 32);
  id v22 = *(id *)(a1 + 48);
  char v23 = &v24;
  FCWaitUntilBlockIsInvoked(&v17);
  id v3 = objc_msgSend((id)v34[5], "encryptedValuesByKey", v17, v18, v19, v20, v21);
  id v4 = [v3 objectForKeyedSubscript:@"encryptionKey"];

  [MEMORY[0x1E4F29060] isMainThread];
  if (![v4 length]) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3A8] format:@"sentinel is missing encryption key"];
  }
  [MEMORY[0x1E4F29060] isMainThread];
  id v5 = [(id)v34[5] valuesByKey];
  uint64_t v6 = [v5 objectForKeyedSubscript:@"version"];

  if (!v6) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3A8] format:@"sentinel is missing version"];
  }
  [MEMORY[0x1E4F29060] isMainThread];
  uint64_t v7 = [(id)v34[5] valuesByKey];
  id v8 = [v7 objectForKeyedSubscript:@"migratedUnencryptedData"];
  char v9 = [v8 isEqual:MEMORY[0x1E4F1CC38]];

  if ((v9 & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3A8] format:@"sentinel is missing migration completion flag"];
  }
  [MEMORY[0x1E4F29060] isMainThread];
  id v10 = [(id)v34[5] valuesByKey];
  uint64_t v11 = [v10 objectForKeyedSubscript:@"deletedUnencryptedData"];
  char v12 = [v11 isEqual:MEMORY[0x1E4F1CC38]];

  if ((v12 & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3A8] format:@"sentinel is missing deletion completion flag"];
  }
  id v13 = [(id)v25[5] encryptedValuesByKey];
  id v14 = [v13 objectForKeyedSubscript:@"encryptionKey"];

  [MEMORY[0x1E4F29060] isMainThread];
  if (![v14 length]) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3A8] format:@"secure sentinel is missing encryption key"];
  }
  [MEMORY[0x1E4F29060] isMainThread];
  id v15 = [(id)v25[5] valuesByKey];
  id v16 = [v15 objectForKeyedSubscript:@"version"];

  if (!v16) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3A8] format:@"secure sentinel is missing version"];
  }
  [MEMORY[0x1E4F29060] isMainThread];
  if ([v4 isEqualToData:v14]) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3A8] format:@"regular sentinel and secure sentinel should have different encryption keys"];
  }

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v33, 8);
}

void __85__FCPrivateDataEncryptionMigrationHealthCheck__prepareSentinelsAndReturnExpectations__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) container];
  id v5 = [v4 privateCloudDatabase];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __85__FCPrivateDataEncryptionMigrationHealthCheck__prepareSentinelsAndReturnExpectations__block_invoke_3;
  v9[3] = &unk_1E5B4D000;
  uint64_t v7 = *(void *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  id v10 = v3;
  uint64_t v11 = v6;
  id v8 = v3;
  [v5 fetchRecordWithID:v7 completionHandler:v9];
}

void __85__FCPrivateDataEncryptionMigrationHealthCheck__prepareSentinelsAndReturnExpectations__block_invoke_3(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __85__FCPrivateDataEncryptionMigrationHealthCheck__prepareSentinelsAndReturnExpectations__block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) secureContainer];
  id v5 = [v4 privateCloudDatabase];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __85__FCPrivateDataEncryptionMigrationHealthCheck__prepareSentinelsAndReturnExpectations__block_invoke_5;
  v9[3] = &unk_1E5B4D000;
  uint64_t v7 = *(void *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  id v10 = v3;
  uint64_t v11 = v6;
  id v8 = v3;
  [v5 fetchRecordWithID:v7 completionHandler:v9];
}

void __85__FCPrivateDataEncryptionMigrationHealthCheck__prepareSentinelsAndReturnExpectations__block_invoke_5(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchDesiredVersionForDatabase:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __89__FCPrivateDataEncryptionMigrationHealthCheck_fetchDesiredVersionForDatabase_completion___block_invoke;
  v8[3] = &unk_1E5B4D028;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  -[FCCKPrivateDatabase fetchSecureDatabaseSupportedWithCompletionHandler:]((uint64_t)a3, v8);
}

void __89__FCPrivateDataEncryptionMigrationHealthCheck_fetchDesiredVersionForDatabase_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v7 = a3;
  uint64_t v5 = *(void *)(a1 + 40);
  if (a2) {
    uint64_t v6 = [*(id *)(a1 + 32) toVersion];
  }
  else {
    uint64_t v6 = 0;
  }
  (*(void (**)(uint64_t, uint64_t, id))(v5 + 16))(v5, v6, v7);
}

- (void)fetchCleanupToVersionForDatabase:(id)a3 completion:(id)a4
{
  id v6 = a4;
  (*((void (**)(id, int64_t, void))a4 + 2))(v6, [(FCPrivateDataEncryptionMigrationHealthCheck *)self toVersion], 0);
}

- (FCCKPrivateDatabaseSchema)schema
{
  return self->_schema;
}

- (void)setSchema:(id)a3
{
}

- (int64_t)toVersion
{
  return self->_toVersion;
}

- (void)setToVersion:(int64_t)a3
{
  self->_toVersion = a3;
}

- (CKContainer)container
{
  return self->_container;
}

- (void)setContainer:(id)a3
{
}

- (CKContainer)containerWithZoneWidePCS
{
  return self->_containerWithZoneWidePCS;
}

- (void)setContainerWithZoneWidePCS:(id)a3
{
}

- (CKContainer)secureContainer
{
  return self->_secureContainer;
}

- (void)setSecureContainer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secureContainer, 0);
  objc_storeStrong((id *)&self->_containerWithZoneWidePCS, 0);
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_schema, 0);
}

@end