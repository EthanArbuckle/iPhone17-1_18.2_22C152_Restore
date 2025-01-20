@interface VCCKVoiceShortcutFetcher
- (BOOL)completed;
- (CKDatabase)database;
- (OS_dispatch_queue)queue;
- (VCCKVoiceShortcutFetcher)initWithRecordHandler:(id)a3 completionHandler:(id)a4;
- (id)completionHandler;
- (id)recordHandler;
- (int64_t)qualityOfService;
- (void)addOperation:(id)a3;
- (void)fetchRecordZones;
- (void)fetchRecordsFromZone:(id)a3;
- (void)finishWithSuccess:(BOOL)a3 error:(id)a4;
- (void)setCompleted:(BOOL)a3;
- (void)start;
@end

@implementation VCCKVoiceShortcutFetcher

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong(&self->_recordHandler, 0);
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)setCompleted:(BOOL)a3
{
  self->_completed = a3;
}

- (BOOL)completed
{
  return self->_completed;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (id)recordHandler
{
  return self->_recordHandler;
}

- (int64_t)qualityOfService
{
  return self->_qualityOfService;
}

- (CKDatabase)database
{
  return self->_database;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)fetchRecordsFromZone:(id)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"VCCKVoiceShortcutFetcher.m", 93, @"Invalid parameter not satisfying: %@", @"zone" object file lineNumber description];
  }
  id v6 = objc_alloc(MEMORY[0x1E4F1A070]);
  v7 = [v5 zoneID];
  v13[0] = v7;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  v9 = (void *)[v6 initWithRecordZoneIDs:v8 configurationsByRecordZoneID:0];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __49__VCCKVoiceShortcutFetcher_fetchRecordsFromZone___block_invoke;
  v12[3] = &unk_1E6550540;
  v12[4] = self;
  [v9 setRecordChangedBlock:v12];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __49__VCCKVoiceShortcutFetcher_fetchRecordsFromZone___block_invoke_194;
  v11[3] = &unk_1E6557668;
  v11[4] = self;
  [v9 setFetchRecordZoneChangesCompletionBlock:v11];
  [(VCCKVoiceShortcutFetcher *)self addOperation:v9];
}

void __49__VCCKVoiceShortcutFetcher_fetchRecordsFromZone___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = getWFPeaceMigrationLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = [v3 recordID];
    id v6 = [v5 recordName];
    int v8 = 136315394;
    v9 = "-[VCCKVoiceShortcutFetcher fetchRecordsFromZone:]_block_invoke";
    __int16 v10 = 2114;
    v11 = v6;
    _os_log_impl(&dword_1C7F0A000, v4, OS_LOG_TYPE_INFO, "%s Successfully fetched voice shortcut record %{public}@", (uint8_t *)&v8, 0x16u);
  }
  v7 = [*(id *)(a1 + 32) recordHandler];
  ((void (**)(void, id))v7)[2](v7, v3);
}

void __49__VCCKVoiceShortcutFetcher_fetchRecordsFromZone___block_invoke_194(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = getWFPeaceMigrationLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v5 = 136315394;
    id v6 = "-[VCCKVoiceShortcutFetcher fetchRecordsFromZone:]_block_invoke";
    __int16 v7 = 2114;
    id v8 = v3;
    _os_log_impl(&dword_1C7F0A000, v4, OS_LOG_TYPE_INFO, "%s Finished fetching records with error: %{public}@", (uint8_t *)&v5, 0x16u);
  }

  [*(id *)(a1 + 32) finishWithSuccess:v3 == 0 error:v3];
}

- (void)fetchRecordZones
{
  id v3 = [MEMORY[0x1E4F1A090] fetchAllRecordZonesOperation];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __44__VCCKVoiceShortcutFetcher_fetchRecordZones__block_invoke;
  v5[3] = &unk_1E6550518;
  v5[4] = self;
  v4 = +[VCRecordZoneParser activeRecordZone:v5];
  [v3 setFetchRecordZonesCompletionBlock:v4];

  [(VCCKVoiceShortcutFetcher *)self addOperation:v3];
}

void __44__VCCKVoiceShortcutFetcher_fetchRecordZones__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    __int16 v7 = [*(id *)(a1 + 32) queue];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __44__VCCKVoiceShortcutFetcher_fetchRecordZones__block_invoke_186;
    v9[3] = &unk_1E6558938;
    v9[4] = *(void *)(a1 + 32);
    id v10 = v5;
    dispatch_async(v7, v9);
  }
  else
  {
    id v8 = getWFPeaceMigrationLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v12 = "-[VCCKVoiceShortcutFetcher fetchRecordZones]_block_invoke";
      __int16 v13 = 2114;
      id v14 = v6;
      _os_log_impl(&dword_1C7F0A000, v8, OS_LOG_TYPE_ERROR, "%s Did not find an active record zone: %{public}@", buf, 0x16u);
    }

    [*(id *)(a1 + 32) finishWithSuccess:0 error:v6];
  }
}

uint64_t __44__VCCKVoiceShortcutFetcher_fetchRecordZones__block_invoke_186(uint64_t a1)
{
  return [*(id *)(a1 + 32) fetchRecordsFromZone:*(void *)(a1 + 40)];
}

- (void)start
{
  id v3 = [(VCCKVoiceShortcutFetcher *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__VCCKVoiceShortcutFetcher_start__block_invoke;
  block[3] = &unk_1E6558B28;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __33__VCCKVoiceShortcutFetcher_start__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) fetchRecordZones];
}

- (void)addOperation:(id)a3
{
  id v4 = a3;
  [v4 setQualityOfService:25];
  id v5 = [v4 configuration];
  [v5 setDiscretionaryNetworkBehavior:0];

  id v6 = [(VCCKVoiceShortcutFetcher *)self database];
  [v6 addOperation:v4];
}

- (void)finishWithSuccess:(BOOL)a3 error:(id)a4
{
  id v6 = a4;
  __int16 v7 = [(VCCKVoiceShortcutFetcher *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__VCCKVoiceShortcutFetcher_finishWithSuccess_error___block_invoke;
  block[3] = &unk_1E6552EF0;
  BOOL v11 = a3;
  block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(v7, block);
}

void __52__VCCKVoiceShortcutFetcher_finishWithSuccess_error___block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) completed] & 1) == 0)
  {
    [*(id *)(a1 + 32) setCompleted:1];
    id v2 = [*(id *)(a1 + 32) completionHandler];
    (*((void (**)(id, void, void))v2 + 2))(v2, *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 40));
  }
}

- (VCCKVoiceShortcutFetcher)initWithRecordHandler:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2, self, @"VCCKVoiceShortcutFetcher.m", 34, @"Invalid parameter not satisfying: %@", @"recordHandler" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  v24 = [MEMORY[0x1E4F28B00] currentHandler];
  [v24 handleFailureInMethod:a2, self, @"VCCKVoiceShortcutFetcher.m", 35, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];

LABEL_3:
  v25.receiver = self;
  v25.super_class = (Class)VCCKVoiceShortcutFetcher;
  id v10 = [(VCCKVoiceShortcutFetcher *)&v25 init];
  if (v10)
  {
    BOOL v11 = [MEMORY[0x1E4F19EC8] containerWithIdentifier:@"com.apple.siriactions"];
    objc_msgSend(v11, "wf_setShortcutsAppAttribution");
    uint64_t v12 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v13 = dispatch_queue_create("com.apple.shortcuts.VCCKVoiceShortcutFetcher", v12);
    queue = v10->_queue;
    v10->_queue = (OS_dispatch_queue *)v13;

    uint64_t v15 = [v11 privateCloudDatabase];
    database = v10->_database;
    v10->_database = (CKDatabase *)v15;

    uint64_t v17 = [v7 copy];
    id recordHandler = v10->_recordHandler;
    v10->_id recordHandler = (id)v17;

    uint64_t v19 = [v9 copy];
    id completionHandler = v10->_completionHandler;
    v10->_id completionHandler = (id)v19;

    v21 = v10;
  }

  return v10;
}

@end