@interface MTIDCloudKitStore
+ (BOOL)updateRecord:(id)a3 isSpanRecord:(BOOL)a4 scheme:(id)a5 expectedKey:(id)a6 expiration:(id)a7 reset:(BOOL)a8;
+ (id)keyOfReferenceDate:(id)a3;
+ (id)recordZoneID;
+ (id)referenceDateOfRecord:(id)a3;
+ (id)referenceRecordIDForScheme:(id)a3 dsId:(id)a4;
+ (id)spanRecordIDForScheme:(id)a3 referenceRecordID:(id)a4 serialNumber:(unint64_t)a5;
+ (id)spanRecordKeyWithReferenceRecord:(id)a3 serialNumber:(unint64_t)a4;
- (BOOL)canSyncBetweenDevices;
- (MTIDCloudKitLocalDB)localDB;
- (MTIDCloudKitPromiseManager)promiseManager;
- (MTIDCloudKitStore)initWithContainerIdentifer:(id)a3 enableSync:(BOOL)a4;
- (MTIDSyncEngine)syncEngine;
- (NSMutableDictionary)generatedDates;
- (NSString)containerIdentifier;
- (OS_dispatch_queue)accessQueue;
- (id)debugInfo;
- (id)maintainSchemes:(id)a3 options:(id)a4;
- (id)promiseForRecordWithID:(id)a3 timeout:(double)a4 qualityOfService:(int64_t)a5 existingOnly:(BOOL)a6 updateRecordMaybe:(id)a7;
- (id)recordWithID:(id)a3;
- (id)recordWithID:(id)a3 qualityOfService:(int64_t)a4 updateRecordMaybe:(id)a5 error:(id *)a6;
- (id)referenceRecordForScheme:(id)a3 dsId:(id)a4 date:(id)a5 reset:(BOOL)a6 timeout:(double)a7 existingOnly:(BOOL)a8 qualityOfService:(int64_t)a9;
- (id)resetSchemes:(id)a3 options:(id)a4;
- (id)secretForScheme:(id)a3 options:(id)a4;
- (id)spanRecordForScheme:(id)a3 span:(id)a4 timeout:(double)a5 existingOnly:(BOOL)a6 qualityOfService:(int64_t)a7 referenceRecord:(id)a8;
- (id)syncForSchemes:(id)a3 options:(id)a4;
- (void)_generateFutureRecordsForScheme:(id)a3 referenceRecord:(id)a4;
- (void)accountDidChangeWithUserRecordID:(id)a3;
- (void)clearLocalData;
- (void)cloudKitLocalDB:(id)a3 didChangeRecord:(id)a4;
- (void)fetchChangesIfNeeded;
- (void)generateFutureRecordsForScheme:(id)a3 referenceRecord:(id)a4;
- (void)recordWasDeleted:(id)a3;
- (void)recordWasFailedToSave:(id)a3;
- (void)recordWasFetched:(id)a3;
- (void)recordWasSaved:(id)a3;
- (void)setAccessQueue:(id)a3;
- (void)setCanSyncBetweenDevices:(BOOL)a3;
- (void)setContainerIdentifier:(id)a3;
- (void)setGeneratedDates:(id)a3;
- (void)setLocalDB:(id)a3;
- (void)setPromiseManager:(id)a3;
- (void)setSyncEngine:(id)a3;
- (void)syncEngineDidStartWithError:(id)a3;
@end

@implementation MTIDCloudKitStore

- (MTIDCloudKitStore)initWithContainerIdentifer:(id)a3 enableSync:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v23.receiver = self;
  v23.super_class = (Class)MTIDCloudKitStore;
  v7 = [(MTIDCloudKitStore *)&v23 init];
  v8 = v7;
  if (v7)
  {
    [(MTIDCloudKitStore *)v7 setContainerIdentifier:v6];
    if (v4)
    {
      v9 = +[MTFrameworkEnvironment sharedEnvironment];
      v10 = [v9 valueForEntitlement:@"com.apple.developer.icloud-container-identifiers"];

      -[MTIDCloudKitStore setCanSyncBetweenDevices:](v8, "setCanSyncBetweenDevices:", [v10 containsObject:v6]);
      if (![(MTIDCloudKitStore *)v8 canSyncBetweenDevices])
      {
        v11 = MTMetricsKitOSLog();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          id v25 = v6;
          __int16 v26 = 2112;
          v27 = @"com.apple.developer.icloud-container-identifiers";
          _os_log_impl(&dword_218211000, v11, OS_LOG_TYPE_ERROR, "MetricsKit: The application is missing container %@ in %@ entitlement.", buf, 0x16u);
        }
      }
    }
    else
    {
      [(MTIDCloudKitStore *)v8 setCanSyncBetweenDevices:0];
    }
    id v12 = [v6 stringByAppendingString:@".accessqueue"];
    dispatch_queue_t v13 = dispatch_queue_create((const char *)[v12 UTF8String], 0);
    [(MTIDCloudKitStore *)v8 setAccessQueue:v13];

    v14 = [MTIDCloudKitLocalDB alloc];
    v15 = +[MTIDCloudKitStore recordZoneID];
    v16 = [(MTIDCloudKitLocalDB *)v14 initWithContainerIdentifier:v6 recordType:@"MT_IDSecret" recordZoneID:v15];

    [(MTIDCloudKitLocalDB *)v16 setDelegate:v8];
    [(MTIDCloudKitStore *)v8 setLocalDB:v16];
    v17 = [MEMORY[0x263EFF9A0] dictionary];
    [(MTIDCloudKitStore *)v8 setGeneratedDates:v17];

    if ([(MTIDCloudKitStore *)v8 canSyncBetweenDevices])
    {
      v18 = [(MTIDCloudKitStore *)v8 syncEngine];
      [v18 start];
    }
    v19 = [MTIDCloudKitPromiseManager alloc];
    v20 = [(MTIDCloudKitStore *)v8 accessQueue];
    v21 = [(MTIDCloudKitPromiseManager *)v19 initWithCallbackQueue:v20];
    [(MTIDCloudKitStore *)v8 setPromiseManager:v21];
  }
  return v8;
}

- (MTIDSyncEngine)syncEngine
{
  if (!self->_syncEngine && [(MTIDCloudKitStore *)self canSyncBetweenDevices])
  {
    v3 = [MTIDSyncEngine alloc];
    BOOL v4 = [(MTIDCloudKitStore *)self containerIdentifier];
    v5 = +[MTIDCloudKitStore recordZoneID];
    id v6 = [(MTIDCloudKitStore *)self accessQueue];
    v7 = [(MTIDSyncEngine *)v3 initWithContainerIdentifier:v4 zoneID:v5 queue:v6 delegate:self];
    syncEngine = self->_syncEngine;
    self->_syncEngine = v7;
  }
  v9 = self->_syncEngine;

  return v9;
}

- (void)generateFutureRecordsForScheme:(id)a3 referenceRecord:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 lifespan] && -[MTIDCloudKitStore canSyncBetweenDevices](self, "canSyncBetweenDevices"))
  {
    objc_initWeak(&location, self);
    v8 = [(MTIDCloudKitStore *)self accessQueue];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __68__MTIDCloudKitStore_generateFutureRecordsForScheme_referenceRecord___block_invoke;
    v9[3] = &unk_26430FEF8;
    objc_copyWeak(&v12, &location);
    id v10 = v6;
    id v11 = v7;
    dispatch_async(v8, v9);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

void __68__MTIDCloudKitStore_generateFutureRecordsForScheme_referenceRecord___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _generateFutureRecordsForScheme:*(void *)(a1 + 32) referenceRecord:*(void *)(a1 + 40)];
}

- (void)_generateFutureRecordsForScheme:(id)a3 referenceRecord:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = 0x26430E000uLL;
  v9 = +[MTIDCloudKitStore referenceDateOfRecord:v7];
  if (!v9)
  {
    v24 = self;
    v37 = 0;
    unint64_t v17 = 0;
    unint64_t v20 = [v6 storagePoolSize] - 1;
LABEL_10:
    id v25 = 0;
    __int16 v26 = v24;
    do
    {
      v27 = v25;
      uint64_t v28 = *(void **)(v8 + 4048);
      v29 = [v7 recordID];
      [v28 spanRecordIDForScheme:v6 referenceRecordID:v29 serialNumber:v17];
      v31 = unint64_t v30 = v8;

      v39[0] = MEMORY[0x263EF8330];
      v39[1] = 3221225472;
      v39[2] = __69__MTIDCloudKitStore__generateFutureRecordsForScheme_referenceRecord___block_invoke;
      v39[3] = &unk_26430FF20;
      id v40 = v7;
      unint64_t v42 = v17;
      id v41 = v6;
      id v38 = v27;
      id v32 = [(MTIDCloudKitStore *)v26 recordWithID:v31 qualityOfService:-1 updateRecordMaybe:v39 error:&v38];
      id v25 = v38;

      unint64_t v8 = v30;
      ++v17;
    }
    while (v17 <= v20);

    v9 = v37;
    goto LABEL_14;
  }
  id v10 = +[MTFrameworkEnvironment sharedEnvironment];
  id v11 = [v10 date];

  [v6 maxFutureTimeInterval];
  id v12 = objc_msgSend(v11, "dateByAddingTimeInterval:");
  dispatch_queue_t v13 = [(MTIDCloudKitStore *)self generatedDates];
  v14 = [v6 idNamespace];
  v15 = [v13 objectForKeyedSubscript:v14];

  if (v15 && [v12 compare:v15] == -1)
  {

    goto LABEL_14;
  }
  v36 = v15;
  v35 = +[MTIDSpan spanForScheme:v6 date:v11 referenceDate:v9];
  v16 = +[MTIDSpan spanForScheme:v6 date:v12 referenceDate:v9];
  unint64_t v17 = [v35 serialNumber];
  unint64_t v18 = [v16 serialNumber];
  uint64_t v19 = [v6 storagePoolSize];
  if (v18 >= v17 + v19 - 2) {
    unint64_t v20 = v17 + v19 - 2;
  }
  else {
    unint64_t v20 = v18;
  }
  v21 = [v16 endDate];
  [(MTIDCloudKitStore *)self generatedDates];
  v22 = v34 = v11;
  [v6 idNamespace];
  objc_super v23 = v33 = self;
  [v22 setObject:v21 forKeyedSubscript:v23];

  if (v17 <= v20)
  {
    v24 = v33;
    v37 = v9;
    unint64_t v8 = 0x26430E000;
    goto LABEL_10;
  }
LABEL_14:
}

BOOL __69__MTIDCloudKitStore__generateFutureRecordsForScheme_referenceRecord___block_invoke(void *a1, void *a2)
{
  uint64_t v3 = a1[4];
  uint64_t v4 = a1[6];
  id v5 = a2;
  id v6 = +[MTIDCloudKitStore spanRecordKeyWithReferenceRecord:v3 serialNumber:v4];
  BOOL v7 = +[MTIDCloudKitStore updateRecord:v5 isSpanRecord:1 scheme:a1[5] expectedKey:v6 expiration:0 reset:0];

  return v7;
}

- (id)recordWithID:(id)a3 qualityOfService:(int64_t)a4 updateRecordMaybe:(id)a5 error:(id *)a6
{
  v26[1] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = (unsigned int (**)(id, void *))a5;
  id v12 = [(MTIDCloudKitStore *)self accessQueue];
  dispatch_assert_queue_V2(v12);

  dispatch_queue_t v13 = [(MTIDCloudKitStore *)self localDB];
  id v25 = 0;
  v14 = [v13 recordWithID:v10 error:&v25];
  id v15 = v25;
  if (v15)
  {
    id v16 = v15;
    if (a6)
    {
LABEL_3:
      id v16 = v16;
      id v17 = 0;
      *a6 = v16;
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  if (!v14)
  {
    id v18 = objc_alloc(MEMORY[0x263EFD7C8]);
    uint64_t v19 = [v13 recordType];
    v14 = (void *)[v18 initWithRecordType:v19 recordID:v10];
  }
  if (!v11[2](v11, v14))
  {
    id v16 = 0;
LABEL_11:
    id v17 = v14;
    v14 = v17;
    goto LABEL_14;
  }
  id v24 = 0;
  char v20 = [v13 writeRecord:v14 error:&v24];
  id v16 = v24;
  if (v20)
  {
    if ([(MTIDCloudKitStore *)self canSyncBetweenDevices])
    {
      v21 = [(MTIDCloudKitStore *)self syncEngine];
      v26[0] = v10;
      v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:1];
      [v21 saveRecordsWithIDs:v22 qualityOfService:a4];
    }
    goto LABEL_11;
  }
  if (a6) {
    goto LABEL_3;
  }
LABEL_13:
  id v17 = 0;
LABEL_14:

  return v17;
}

- (id)promiseForRecordWithID:(id)a3 timeout:(double)a4 qualityOfService:(int64_t)a5 existingOnly:(BOOL)a6 updateRecordMaybe:(id)a7
{
  id v12 = a3;
  id v13 = a7;
  v14 = objc_alloc_init(MTPromise);
  id v15 = [(MTIDCloudKitStore *)self accessQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __100__MTIDCloudKitStore_promiseForRecordWithID_timeout_qualityOfService_existingOnly_updateRecordMaybe___block_invoke;
  block[3] = &unk_26430FF70;
  block[4] = self;
  id v23 = v12;
  id v25 = v13;
  int64_t v26 = a5;
  id v16 = v14;
  id v24 = v16;
  double v27 = a4;
  BOOL v28 = a6;
  id v17 = v13;
  id v18 = v12;
  dispatch_async(v15, block);

  uint64_t v19 = v24;
  char v20 = v16;

  return v20;
}

void __100__MTIDCloudKitStore_promiseForRecordWithID_timeout_qualityOfService_existingOnly_updateRecordMaybe___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 56);
  uint64_t v4 = *(void *)(a1 + 64);
  id v16 = 0;
  id v6 = [v2 recordWithID:v3 qualityOfService:v4 updateRecordMaybe:v5 error:&v16];
  id v7 = v16;
  if (v7)
  {
    [*(id *)(a1 + 48) finishWithError:v7];
  }
  else if ((objc_msgSend(v6, "mt_isSynchronized") & 1) != 0 {
         || ![*(id *)(a1 + 32) canSyncBetweenDevices]
  }
         || *(double *)(a1 + 72) <= 0.0
         || *(unsigned char *)(a1 + 80))
  {
    [*(id *)(a1 + 48) finishWithResult:v6];
  }
  else
  {
    unint64_t v8 = [v6 objectForKeyedSubscript:@"secretKey"];
    v9 = [*(id *)(a1 + 32) promiseManager];
    id v10 = [v9 waitForRecordToSync:v6 timeout:*(double *)(a1 + 72)];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __100__MTIDCloudKitStore_promiseForRecordWithID_timeout_qualityOfService_existingOnly_updateRecordMaybe___block_invoke_2;
    v12[3] = &unk_26430FF48;
    id v13 = v8;
    id v14 = *(id *)(a1 + 48);
    id v15 = v6;
    id v11 = v8;
    [v10 addFinishBlock:v12];
  }
}

void __100__MTIDCloudKitStore_promiseForRecordWithID_timeout_qualityOfService_existingOnly_updateRecordMaybe___block_invoke_2(void *a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  id v6 = (void *)a1[4];
  id v7 = [v9 objectForKeyedSubscript:@"secretKey"];
  LODWORD(v6) = [v6 isEqualToString:v7];

  unint64_t v8 = (void *)a1[5];
  if (v6) {
    [v8 finishWithResult:v9 error:v5];
  }
  else {
    [v8 finishWithResult:a1[6]];
  }
}

+ (id)recordZoneID
{
  id v2 = objc_alloc(MEMORY[0x263EFD808]);
  uint64_t v3 = (void *)[v2 initWithZoneName:@"MT_IDZone" ownerName:*MEMORY[0x263EFD488]];

  return v3;
}

+ (id)referenceRecordIDForScheme:(id)a3 dsId:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [v6 idNamespace];
  uint64_t v8 = [v6 idType];

  if (v5 && v8 == 2)
  {
    uint64_t v9 = objc_msgSend(v7, "stringByAppendingFormat:", @"_%llx", objc_msgSend(v5, "unsignedLongLongValue"));

    id v7 = (void *)v9;
  }
  id v10 = objc_msgSend(v7, "mt_SHA1Base62String");
  id v11 = [@"MT_ID" stringByAppendingString:v10];

  id v12 = objc_alloc(MEMORY[0x263EFD7E8]);
  id v13 = +[MTIDCloudKitStore recordZoneID];
  id v14 = (void *)[v12 initWithRecordName:v11 zoneID:v13];

  return v14;
}

+ (id)referenceDateOfRecord:(id)a3
{
  uint64_t v3 = [a3 objectForKeyedSubscript:@"secretKey"];
  uint64_t v4 = v3;
  if (v3)
  {
    [v3 doubleValue];
    id v5 = objc_msgSend(MEMORY[0x263EFF910], "dateWithTimeIntervalSince1970:");
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

+ (id)keyOfReferenceDate:(id)a3
{
  if (a3)
  {
    uint64_t v4 = NSString;
    [a3 timeIntervalSince1970];
    id v6 = objc_msgSend(v4, "stringWithFormat:", @"%lld", (uint64_t)v5);
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

+ (id)spanRecordIDForScheme:(id)a3 referenceRecordID:(id)a4 serialNumber:(unint64_t)a5
{
  uint64_t v8 = NSString;
  id v9 = a3;
  id v10 = [a4 recordName];
  unint64_t v11 = [v9 storagePoolSize];

  id v12 = [v8 stringWithFormat:@"%@_%02lx", v10, a5 % v11];

  id v13 = objc_alloc(MEMORY[0x263EFD7E8]);
  id v14 = [a1 recordZoneID];
  id v15 = (void *)[v13 initWithRecordName:v12 zoneID:v14];

  return v15;
}

+ (id)spanRecordKeyWithReferenceRecord:(id)a3 serialNumber:(unint64_t)a4
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"%llx", a4);
}

+ (BOOL)updateRecord:(id)a3 isSpanRecord:(BOOL)a4 scheme:(id)a5 expectedKey:(id)a6 expiration:(id)a7 reset:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v12 = a4;
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  id v32 = a7;
  uint64_t v16 = [v13 objectForKeyedSubscript:@"namespace"];
  id v17 = [v13 objectForKeyedSubscript:@"secretKey"];
  id v18 = [v14 idNamespace];
  v31 = (void *)v16;
  LODWORD(v16) = [(id)v16 isEqualToString:v18];

  int v19 = v16 ^ 1;
  if (!v12 || (v19 & 1) != 0)
  {
    if ((v19 | v8) != 1)
    {
LABEL_5:
      BOOL v20 = 0;
      if (v17) {
        int v21 = 0;
      }
      else {
        int v21 = !v12;
      }
      if (v15)
      {
        v22 = v31;
        id v23 = v32;
        if (v21)
        {
          [v13 setObject:v15 forKeyedSubscript:@"secretKey"];
          id v24 = MTMetricsKitOSLog();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            id v34 = v13;
            _os_log_impl(&dword_218211000, v24, OS_LOG_TYPE_DEBUG, "MetricsKit: Updating reference record %@ with current date", buf, 0xCu);
          }

          BOOL v20 = 1;
        }
      }
      else
      {
        v22 = v31;
        id v23 = v32;
      }
      goto LABEL_17;
    }
  }
  else if ([v17 isEqualToString:v15] && !v8)
  {
    goto LABEL_5;
  }
  id v25 = MTMetricsKitOSLog();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
  {
    int64_t v26 = [v14 idNamespace];
    *(_DWORD *)buf = 138412802;
    id v34 = v13;
    __int16 v35 = 2112;
    v36 = v26;
    __int16 v37 = 2112;
    id v38 = v15;
    _os_log_impl(&dword_218211000, v25, OS_LOG_TYPE_DEBUG, "MetricsKit: Updating record %@ for namespace %@ key %@", buf, 0x20u);
  }
  double v27 = [v14 idNamespace];
  [v13 setObject:v27 forKeyedSubscript:@"namespace"];

  [v13 setObject:v15 forKeyedSubscript:@"secretKey"];
  id v23 = v32;
  [v13 setObject:v32 forKeyedSubscript:@"expiration"];
  BOOL v28 = [MEMORY[0x263F08C38] UUID];
  v29 = [v28 UUIDString];
  objc_msgSend(v13, "mt_setSecretValue:", v29);

  objc_msgSend(v13, "mt_setSynchronized:", 0);
  BOOL v20 = 1;
  v22 = v31;
LABEL_17:

  return v20;
}

- (id)referenceRecordForScheme:(id)a3 dsId:(id)a4 date:(id)a5 reset:(BOOL)a6 timeout:(double)a7 existingOnly:(BOOL)a8 qualityOfService:(int64_t)a9
{
  BOOL v10 = a8;
  id v16 = a3;
  id v17 = a5;
  id v18 = +[MTIDCloudKitStore referenceRecordIDForScheme:v16 dsId:a4];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __100__MTIDCloudKitStore_referenceRecordForScheme_dsId_date_reset_timeout_existingOnly_qualityOfService___block_invoke;
  v23[3] = &unk_26430FF98;
  BOOL v26 = v10;
  id v24 = v17;
  id v25 = v16;
  BOOL v27 = a6;
  id v19 = v16;
  id v20 = v17;
  int v21 = [(MTIDCloudKitStore *)self promiseForRecordWithID:v18 timeout:a9 qualityOfService:v10 existingOnly:v23 updateRecordMaybe:a7];

  return v21;
}

BOOL __100__MTIDCloudKitStore_referenceRecordForScheme_dsId_date_reset_timeout_existingOnly_qualityOfService___block_invoke(uint64_t a1, void *a2)
{
  if (*(unsigned char *)(a1 + 48)) {
    return 0;
  }
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a2;
  id v6 = +[MTIDCloudKitStore keyOfReferenceDate:v4];
  BOOL v7 = +[MTIDCloudKitStore updateRecord:v5 isSpanRecord:0 scheme:*(void *)(a1 + 40) expectedKey:v6 expiration:0 reset:*(unsigned __int8 *)(a1 + 49)];

  return v7;
}

- (id)spanRecordForScheme:(id)a3 span:(id)a4 timeout:(double)a5 existingOnly:(BOOL)a6 qualityOfService:(int64_t)a7 referenceRecord:(id)a8
{
  BOOL v10 = a6;
  id v14 = a3;
  id v15 = a4;
  id v16 = a8;
  id v17 = [v16 recordID];
  id v18 = +[MTIDCloudKitStore spanRecordIDForScheme:referenceRecordID:serialNumber:](MTIDCloudKitStore, "spanRecordIDForScheme:referenceRecordID:serialNumber:", v14, v17, [v15 serialNumber]);

  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __100__MTIDCloudKitStore_spanRecordForScheme_span_timeout_existingOnly_qualityOfService_referenceRecord___block_invoke;
  v24[3] = &unk_26430FFC0;
  BOOL v28 = v10;
  id v25 = v16;
  id v26 = v15;
  id v27 = v14;
  id v19 = v14;
  id v20 = v15;
  id v21 = v16;
  v22 = [(MTIDCloudKitStore *)self promiseForRecordWithID:v18 timeout:a7 qualityOfService:v10 existingOnly:v24 updateRecordMaybe:a5];

  return v22;
}

BOOL __100__MTIDCloudKitStore_spanRecordForScheme_span_timeout_existingOnly_qualityOfService_referenceRecord___block_invoke(uint64_t a1, void *a2)
{
  if (*(unsigned char *)(a1 + 56)) {
    return 0;
  }
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(a1 + 40);
  id v6 = a2;
  BOOL v7 = +[MTIDCloudKitStore spanRecordKeyWithReferenceRecord:serialNumber:](MTIDCloudKitStore, "spanRecordKeyWithReferenceRecord:serialNumber:", v4, [v5 serialNumber]);
  uint64_t v8 = *(void *)(a1 + 48);
  id v9 = [*(id *)(a1 + 40) endDate];
  BOOL v10 = +[MTIDCloudKitStore updateRecord:v6 isSpanRecord:1 scheme:v8 expectedKey:v7 expiration:v9 reset:0];

  return v10;
}

- (void)fetchChangesIfNeeded
{
  uint64_t v3 = [(MTIDCloudKitStore *)self localDB];
  int v4 = [v3 needsFetchRecords];

  if (v4)
  {
    id v5 = [(MTIDCloudKitStore *)self localDB];
    [v5 setNeedsFetchRecords:0];

    id v6 = [(MTIDCloudKitStore *)self syncEngine];
    [v6 fetchAllRecords];
  }
}

- (id)syncForSchemes:(id)a3 options:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = a3;
  BOOL v7 = [a4 objectForKeyedSubscript:@"dsId"];
  id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v23;
    do
    {
      uint64_t v13 = 0;
      id v14 = v8;
      do
      {
        if (*(void *)v23 != v12) {
          objc_enumerationMutation(v9);
        }
        id v15 = +[MTIDCloudKitStore referenceRecordIDForScheme:*(void *)(*((void *)&v22 + 1) + 8 * v13) dsId:v7];
        id v8 = [v14 arrayByAddingObject:v15];

        ++v13;
        id v14 = v8;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v11);
  }

  id v16 = [(MTIDCloudKitStore *)self syncEngine];

  if (v16)
  {
    id v17 = [(MTIDCloudKitStore *)self syncEngine];
    id v18 = [v17 fetchRecordWithIDs:v8];

    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __44__MTIDCloudKitStore_syncForSchemes_options___block_invoke;
    v21[3] = &unk_26430F898;
    v21[4] = self;
    id v19 = [v18 thenWithBlock:v21];
  }
  else
  {
    id v19 = 0;
  }

  return v19;
}

id __44__MTIDCloudKitStore_syncForSchemes_options___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v3 = a2;
  int v4 = v3;
  if (v3)
  {
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    uint64_t v5 = [v3 countByEnumeratingWithState:&v29 objects:v38 count:16];
    if (!v5) {
      goto LABEL_19;
    }
    uint64_t v7 = v5;
    uint64_t v8 = *(void *)v30;
    *(void *)&long long v6 = 138412546;
    long long v27 = v6;
    while (1)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v30 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = objc_msgSend(v4, "objectForKeyedSubscript:", *(void *)(*((void *)&v29 + 1) + 8 * i), v27);
        uint64_t v11 = v10;
        if (v10)
        {
          uint64_t v12 = [v10 recordType];
          int v13 = [v12 isEqualToString:@"MT_IDSecret"];

          if (v13)
          {
            id v14 = [v11 recordID];
            id v15 = [v14 recordName];
            int v16 = [v15 hasPrefix:@"MT_ID"];

            if (v16)
            {
              objc_msgSend(v11, "mt_setSynchronized:", 1);
              id v17 = [*(id *)(a1 + 32) localDB];
              id v28 = 0;
              char v18 = [v17 writeRecord:v11 error:&v28];
              id v19 = v28;

              if ((v18 & 1) == 0)
              {
                id v20 = MTMetricsKitOSLog();
                if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
                {
                  id v21 = [v11 recordID];
                  [v21 recordName];
                  long long v23 = v22 = a1;
                  *(_DWORD *)buf = v27;
                  __int16 v35 = v23;
                  __int16 v36 = 2112;
                  id v37 = v19;
                  _os_log_impl(&dword_218211000, v20, OS_LOG_TYPE_ERROR, "MetricsKit: Failed to save local record data with ID %@ error %@", buf, 0x16u);

                  a1 = v22;
                  goto LABEL_14;
                }
                goto LABEL_15;
              }
            }
            else
            {
              id v19 = [*(id *)(a1 + 32) syncEngine];
              id v20 = [v11 recordID];
              v33 = v20;
              id v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v33 count:1];
              [v19 deleteRecordsWithIDs:v21];
LABEL_14:

LABEL_15:
            }
          }
        }
      }
      uint64_t v7 = [v4 countByEnumeratingWithState:&v29 objects:v38 count:16];
      if (!v7)
      {
LABEL_19:
        uint64_t v24 = MEMORY[0x263EFFA88];
        goto LABEL_21;
      }
    }
  }
  uint64_t v24 = MEMORY[0x263EFFA80];
LABEL_21:
  long long v25 = +[MTPromise promiseWithResult:v24];

  return v25;
}

- (void)accountDidChangeWithUserRecordID:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(MTIDCloudKitStore *)self accessQueue];
  dispatch_assert_queue_V2(v5);

  long long v6 = [(MTIDCloudKitStore *)self localDB];
  uint64_t v7 = [v4 recordName];
  int v8 = [v6 setUserRecordIDName:v7];

  if (v8)
  {
    id v9 = MTMetricsKitOSLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v10 = [v4 recordName];
      int v11 = 138412290;
      uint64_t v12 = v10;
      _os_log_impl(&dword_218211000, v9, OS_LOG_TYPE_DEBUG, "MetricsKit: Updated user record with ID %@", (uint8_t *)&v11, 0xCu);
    }
    +[MTInterprocessChangeNotifier notify:@"MTCloudKitAccountDidChangeNotification"];
  }
}

- (void)syncEngineDidStartWithError:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(MTIDCloudKitStore *)self accessQueue];
  dispatch_assert_queue_V2(v5);

  if (v4)
  {
    long long v6 = NSString;
    uint64_t v7 = [v4 domain];
    int v8 = [v6 stringWithFormat:@"%@-%ld", v7, objc_msgSend(v4, "code")];

    id v9 = [(MTIDCloudKitStore *)self localDB];
    [v9 setSyncStatusCode:v8];

    uint64_t v10 = MTMetricsKitOSLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v19 = v4;
      int v11 = "MetricsKit: Error starting sync engine: %@";
      uint64_t v12 = v10;
      os_log_type_t v13 = OS_LOG_TYPE_ERROR;
      uint32_t v14 = 12;
LABEL_9:
      _os_log_impl(&dword_218211000, v12, v13, v11, buf, v14);
    }
  }
  else
  {
    id v15 = [(MTIDCloudKitStore *)self localDB];
    [v15 setSyncStatusCode:@"Ready"];

    [(MTIDCloudKitStore *)self fetchChangesIfNeeded];
    int v16 = [(MTIDCloudKitStore *)self localDB];
    int v8 = [v16 pendingRecordIDs];

    if ([v8 count])
    {
      id v17 = [(MTIDCloudKitStore *)self syncEngine];
      [v17 saveRecordsWithIDs:v8 qualityOfService:25];

      uint64_t v10 = MTMetricsKitOSLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v19) = [v8 count];
        int v11 = "MetricsKit: Started sync engine with %d unsynchronized records";
        uint64_t v12 = v10;
        os_log_type_t v13 = OS_LOG_TYPE_DEBUG;
        uint32_t v14 = 8;
        goto LABEL_9;
      }
    }
    else
    {
      uint64_t v10 = MTMetricsKitOSLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        int v11 = "MetricsKit: Started sync engine with all records synchronized";
        uint64_t v12 = v10;
        os_log_type_t v13 = OS_LOG_TYPE_DEBUG;
        uint32_t v14 = 2;
        goto LABEL_9;
      }
    }
  }
}

- (id)recordWithID:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(MTIDCloudKitStore *)self localDB];
  id v11 = 0;
  long long v6 = [v5 recordWithID:v4 error:&v11];
  id v7 = v11;

  if (!v6)
  {
    int v8 = MTMetricsKitOSLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v9 = [v4 recordName];
      *(_DWORD *)buf = 138412546;
      os_log_type_t v13 = v9;
      __int16 v14 = 2112;
      id v15 = v7;
      _os_log_impl(&dword_218211000, v8, OS_LOG_TYPE_ERROR, "MetricsKit: Failed to read local record data with ID %@ error %@", buf, 0x16u);
    }
  }

  return v6;
}

- (void)recordWasSaved:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 recordType];
  int v6 = [v5 isEqualToString:@"MT_IDSecret"];

  if (v6)
  {
    objc_msgSend(v4, "mt_setSynchronized:", 1);
    id v7 = [(MTIDCloudKitStore *)self localDB];
    id v13 = 0;
    char v8 = [v7 writeRecord:v4 error:&v13];
    id v9 = v13;

    if ((v8 & 1) == 0)
    {
      uint64_t v10 = MTMetricsKitOSLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        id v11 = [v4 recordID];
        uint64_t v12 = [v11 recordName];
        *(_DWORD *)buf = 138412546;
        id v15 = v12;
        __int16 v16 = 2112;
        id v17 = v9;
        _os_log_impl(&dword_218211000, v10, OS_LOG_TYPE_ERROR, "MetricsKit: Failed to save local record data with ID %@ error %@", buf, 0x16u);
      }
    }
  }
}

- (void)recordWasFailedToSave:(id)a3
{
  id v7 = a3;
  id v4 = [v7 recordType];
  int v5 = [v4 isEqualToString:@"MT_IDSecret"];

  if (v5)
  {
    int v6 = [(MTIDCloudKitStore *)self promiseManager];
    [v6 finishPromisesOfRecord:v7];
  }
}

- (void)recordWasFetched:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = [v4 recordType];
  int v6 = [v5 isEqualToString:@"MT_IDSecret"];

  if (v6)
  {
    id v7 = [v4 recordID];
    char v8 = [v7 recordName];
    int v9 = [v8 hasPrefix:@"MT_ID"];

    if (v9)
    {
      objc_msgSend(v4, "mt_setSynchronized:", 1);
      uint64_t v10 = [(MTIDCloudKitStore *)self localDB];
      id v16 = 0;
      char v11 = [v10 writeRecord:v4 error:&v16];
      id v12 = v16;

      if (v11)
      {
LABEL_9:

        goto LABEL_10;
      }
      id v13 = MTMetricsKitOSLog();
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
LABEL_8:

        goto LABEL_9;
      }
      __int16 v14 = [v4 recordID];
      id v15 = [v14 recordName];
      *(_DWORD *)buf = 138412546;
      id v19 = v15;
      __int16 v20 = 2112;
      id v21 = v12;
      _os_log_impl(&dword_218211000, v13, OS_LOG_TYPE_ERROR, "MetricsKit: Failed to save local record data with ID %@ error %@", buf, 0x16u);
    }
    else
    {
      id v12 = [(MTIDCloudKitStore *)self syncEngine];
      id v13 = [v4 recordID];
      id v17 = v13;
      __int16 v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v17 count:1];
      [v12 deleteRecordsWithIDs:v14];
    }

    goto LABEL_8;
  }
LABEL_10:
}

- (void)recordWasDeleted:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = [(MTIDCloudKitStore *)self localDB];
  id v10 = 0;
  char v6 = [v5 deleteRecordWithID:v4 error:&v10];
  id v7 = v10;

  if ((v6 & 1) == 0)
  {
    char v8 = MTMetricsKitOSLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v9 = [v4 recordName];
      *(_DWORD *)buf = 138412546;
      id v12 = v9;
      __int16 v13 = 2112;
      id v14 = v7;
      _os_log_impl(&dword_218211000, v8, OS_LOG_TYPE_ERROR, "MetricsKit: Failed to delete local record data with ID %@ error %@", buf, 0x16u);
    }
  }
}

- (void)cloudKitLocalDB:(id)a3 didChangeRecord:(id)a4
{
  id v7 = a4;
  if (objc_msgSend(v7, "mt_isSynchronized"))
  {
    int v5 = [(MTIDCloudKitStore *)self promiseManager];
    [v5 finishPromisesOfRecord:v7];

    char v6 = [v7 objectForKeyedSubscript:@"namespace"];
    +[MTInterprocessChangeNotifier notify:v6];
  }
}

- (id)secretForScheme:(id)a3 options:(id)a4
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  char v8 = [v7 objectForKeyedSubscript:@"appBundleID"];
  int v9 = [(MTIDCloudKitStore *)self syncEngine];
  [v9 setApplicationBundleIdentifierOverrideForNetworkAttribution:v8];

  id v10 = [v7 objectForKeyedSubscript:@"date"];
  char v11 = v10;
  if (v10)
  {
    id v12 = v10;
  }
  else
  {
    __int16 v13 = +[MTFrameworkEnvironment sharedEnvironment];
    id v12 = [v13 date];
  }
  id v34 = [v7 objectForKeyedSubscript:@"dsId"];
  id v14 = [v7 objectForKeyedSubscript:@"reset"];
  uint64_t v15 = [v14 BOOLValue];

  id v16 = [v7 objectForKeyedSubscript:@"syncWaitTime"];
  id v17 = [v7 objectForKeyedSubscript:@"existingOnly"];
  uint64_t v18 = [v17 BOOLValue];

  if (v16) {
    [v16 doubleValue];
  }
  else {
    +[MTIDSyncEngine transactionTimeout];
  }
  double v20 = v19;
  id v21 = MTMetricsKitOSLog();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    uint64_t v22 = [v6 idNamespace];
    long long v23 = @"NO";
    *(_DWORD *)buf = 138413058;
    *(void *)&uint8_t buf[4] = v22;
    if (v18) {
      long long v23 = @"YES";
    }
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v12;
    *(_WORD *)&buf[22] = 2112;
    v44 = (uint64_t (*)(uint64_t, uint64_t))v23;
    LOWORD(v45) = 2048;
    *(double *)((char *)&v45 + 2) = v20;
    _os_log_impl(&dword_218211000, v21, OS_LOG_TYPE_INFO, "MetricsKit: Secret requested for scheme %@, date: %@, existingOnly: %@, timeout: %f", buf, 0x2Au);
  }
  if (!v18) {
    goto LABEL_14;
  }
  uint64_t v24 = +[MTIDCloudKitStore referenceRecordIDForScheme:v6 dsId:v34];
  long long v25 = [(MTIDCloudKitStore *)self localDB];
  id v42 = 0;
  id v26 = [v25 recordWithID:v24 error:&v42];
  id v33 = v42;

  if (v26)
  {

LABEL_14:
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v44 = __Block_byref_object_copy_;
    *(void *)&long long v45 = __Block_byref_object_dispose_;
    *((void *)&v45 + 1) = 0;
    long long v27 = [(MTIDCloudKitStore *)self referenceRecordForScheme:v6 dsId:v34 date:v12 reset:v15 timeout:v18 existingOnly:25 qualityOfService:v20];
    v35[0] = MEMORY[0x263EF8330];
    v35[1] = 3221225472;
    v35[2] = __45__MTIDCloudKitStore_secretForScheme_options___block_invoke;
    v35[3] = &unk_264310010;
    id v36 = v6;
    id v38 = self;
    uint64_t v39 = buf;
    id v37 = v12;
    double v40 = v20;
    char v41 = v18;
    id v28 = [v27 thenWithBlock:v35];

    _Block_object_dispose(buf, 8);
    goto LABEL_15;
  }
  long long v30 = [[MTIDSecret alloc] initWithValue:&stru_26C95D008 effectiveDate:0 expirationDate:0 isSynchronize:0];
  long long v31 = MTMetricsKitOSLog();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
  {
    long long v32 = [v6 idNamespace];
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v32;
    _os_log_impl(&dword_218211000, v31, OS_LOG_TYPE_INFO, "MetricsKit: Secret doesn't exist, returning empty secret for scheme %@", buf, 0xCu);
  }
  id v28 = +[MTPromise promiseWithResult:v30];

LABEL_15:

  return v28;
}

id __45__MTIDCloudKitStore_secretForScheme_options___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = MTMetricsKitOSLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v5 = [*(id *)(a1 + 32) idNamespace];
    id v6 = [v3 recordID];
    int v7 = objc_msgSend(v3, "mt_isSynchronized");
    char v8 = @"unsynchronized";
    *(_DWORD *)buf = 138412802;
    id v33 = v5;
    __int16 v34 = 2112;
    if (v7) {
      char v8 = @"synchronized";
    }
    __int16 v35 = v6;
    __int16 v36 = 2112;
    id v37 = v8;
    _os_log_impl(&dword_218211000, v4, OS_LOG_TYPE_INFO, "MetricsKit: Loaded reference record for scheme %@ with id %@, synchronized: %@", buf, 0x20u);
  }
  if ([*(id *)(a1 + 32) lifespan] < 1)
  {
    objc_msgSend(v3, "mt_secretValue");
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    __int16 v13 = -[MTIDSecret initWithValue:effectiveDate:expirationDate:isSynchronize:]([MTIDSecret alloc], "initWithValue:effectiveDate:expirationDate:isSynchronize:", v9, 0, 0, objc_msgSend(v3, "mt_isSynchronized"));
    if ([*(id *)(a1 + 48) canSyncBetweenDevices])
    {
      uint64_t v15 = [*(id *)(a1 + 48) localDB];
      id v16 = [v15 syncStatusCode];
      [(MTIDSecret *)v13 setSyncStatusCode:v16];
    }
    id v17 = MTMetricsKitOSLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      uint64_t v18 = [*(id *)(a1 + 32) idNamespace];
      *(_DWORD *)buf = 138412290;
      id v33 = v18;
      _os_log_impl(&dword_218211000, v17, OS_LOG_TYPE_INFO, "MetricsKit: Returning secret for scheme %@", buf, 0xCu);
    }
    id v14 = +[MTPromise promiseWithResult:v13];
    goto LABEL_14;
  }
  id v9 = +[MTIDCloudKitStore referenceDateOfRecord:v3];
  if (v9 || (id v9 = *(id *)(a1 + 40)) != 0)
  {
    uint64_t v10 = +[MTIDSpan spanForScheme:*(void *)(a1 + 32) date:*(void *)(a1 + 40) referenceDate:v9];
    uint64_t v11 = *(void *)(*(void *)(a1 + 56) + 8);
    id v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;

    [*(id *)(a1 + 48) generateFutureRecordsForScheme:*(void *)(a1 + 32) referenceRecord:v3];
    __int16 v13 = [*(id *)(a1 + 48) spanRecordForScheme:*(void *)(a1 + 32) span:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) timeout:*(unsigned __int8 *)(a1 + 72) existingOnly:25 qualityOfService:v3 referenceRecord:*(double *)(a1 + 64)];
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = (uint64_t)__45__MTIDCloudKitStore_secretForScheme_options___block_invoke_70;
    v28[3] = (uint64_t)&unk_26430FFE8;
    id v29 = *(id *)(a1 + 32);
    id v30 = v3;
    long long v31 = *(_OWORD *)(a1 + 48);
    id v14 = [(MTIDSecret *)v13 thenWithBlock:v28];

LABEL_14:
    goto LABEL_15;
  }
  double v20 = MTMetricsKitOSLog();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    id v21 = [*(id *)(a1 + 32) idNamespace];
    *(_DWORD *)buf = 138412290;
    id v33 = v21;
    _os_log_impl(&dword_218211000, v20, OS_LOG_TYPE_ERROR, "MetricsKit: Reference date is null, returning error. Scheme: %@", buf, 0xCu);
  }
  MTError(703, @"Namespace date is null, are you sending multiple reset requests too quickly?", v22, v23, v24, v25, v26, v27, v28[0]);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  id v14 = +[MTPromise promiseWithError:v9];
LABEL_15:

  return v14;
}

id __45__MTIDCloudKitStore_secretForScheme_options___block_invoke_70(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = MTMetricsKitOSLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v5 = [*(id *)(a1 + 32) idNamespace];
    *(_DWORD *)buf = 138412290;
    uint64_t v22 = v5;
    _os_log_impl(&dword_218211000, v4, OS_LOG_TYPE_INFO, "MetricsKit: Span record obtained for scheme %@", buf, 0xCu);
  }
  id v6 = NSString;
  int v7 = objc_msgSend(*(id *)(a1 + 40), "mt_secretValue");
  char v8 = objc_msgSend(v3, "mt_secretValue");
  id v9 = [v6 stringWithFormat:@"%@%@", v7, v8];

  uint64_t v10 = [MTIDSecret alloc];
  uint64_t v11 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) startDate];
  id v12 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) endDate];
  if (objc_msgSend(*(id *)(a1 + 40), "mt_isSynchronized")) {
    uint64_t v13 = objc_msgSend(v3, "mt_isSynchronized");
  }
  else {
    uint64_t v13 = 0;
  }
  id v14 = [(MTIDSecret *)v10 initWithValue:v9 effectiveDate:v11 expirationDate:v12 isSynchronize:v13];

  if ([*(id *)(a1 + 48) canSyncBetweenDevices])
  {
    uint64_t v15 = [*(id *)(a1 + 48) localDB];
    id v16 = [v15 syncStatusCode];
    [(MTIDSecret *)v14 setSyncStatusCode:v16];
  }
  id v17 = MTMetricsKitOSLog();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    uint64_t v18 = [*(id *)(a1 + 32) idNamespace];
    *(_DWORD *)buf = 138412290;
    uint64_t v22 = v18;
    _os_log_impl(&dword_218211000, v17, OS_LOG_TYPE_INFO, "MetricsKit: Returning secret for scheme %@", buf, 0xCu);
  }
  double v19 = +[MTPromise promiseWithResult:v14];

  return v19;
}

- (id)resetSchemes:(id)a3 options:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  char v8 = [v7 objectForKeyedSubscript:@"appBundleID"];
  id v9 = [(MTIDCloudKitStore *)self syncEngine];
  [v9 setApplicationBundleIdentifierOverrideForNetworkAttribution:v8];

  uint64_t v10 = [v7 objectForKeyedSubscript:@"dsId"];
  uint64_t v11 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v12 = v6;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v22 != v15) {
          objc_enumerationMutation(v12);
        }
        id v17 = -[MTIDCloudKitStore referenceRecordForScheme:dsId:date:reset:timeout:existingOnly:qualityOfService:](self, "referenceRecordForScheme:dsId:date:reset:timeout:existingOnly:qualityOfService:", *(void *)(*((void *)&v21 + 1) + 8 * i), v10, 0, 1, 0, 25, 0.0, (void)v21);
        [v11 addObject:v17];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v14);
  }

  uint64_t v18 = +[MTPromise promiseWithAll:v11];
  double v19 = [v18 thenWithBlock:&__block_literal_global_5];

  return v19;
}

MTPromise *__42__MTIDCloudKitStore_resetSchemes_options___block_invoke()
{
  return +[MTPromise promiseWithResult:MEMORY[0x263EFFA88]];
}

- (id)maintainSchemes:(id)a3 options:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  char v8 = [v7 objectForKeyedSubscript:@"appBundleID"];
  id v9 = [(MTIDCloudKitStore *)self syncEngine];
  [v9 setApplicationBundleIdentifierOverrideForNetworkAttribution:v8];

  if ([(MTIDCloudKitStore *)self canSyncBetweenDevices])
  {
    uint64_t v10 = MTMetricsKitOSLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109120;
      int v22 = [v6 count];
      _os_log_impl(&dword_218211000, v10, OS_LOG_TYPE_DEBUG, "MetricsKit: Performing maintenance on %d ID schemes", buf, 8u);
    }

    uint64_t v11 = objc_alloc_init(MTPromise);
    id v12 = [(MTIDCloudKitStore *)self accessQueue];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __45__MTIDCloudKitStore_maintainSchemes_options___block_invoke;
    v17[3] = &unk_2643100A8;
    v17[4] = self;
    id v18 = v7;
    id v19 = v6;
    uint64_t v13 = v11;
    double v20 = v13;
    dispatch_async(v12, v17);

    uint64_t v14 = v20;
    uint64_t v15 = v13;
  }
  else
  {
    uint64_t v15 = +[MTPromise promiseWithResult:MEMORY[0x263EFFA88]];
  }

  return v15;
}

void __45__MTIDCloudKitStore_maintainSchemes_options___block_invoke(id *a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v2 = [a1[4] generatedDates];
  [v2 removeAllObjects];

  id v3 = [MEMORY[0x263EFF980] array];
  uint64_t v15 = [a1[5] objectForKeyedSubscript:@"dsId"];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = a1[6];
  uint64_t v4 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v20 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        id v9 = [a1[4] referenceRecordForScheme:v8 dsId:v15 date:0 reset:0 timeout:0 existingOnly:-1 qualityOfService:0.0];
        v18[0] = MEMORY[0x263EF8330];
        v18[1] = 3221225472;
        v18[2] = __45__MTIDCloudKitStore_maintainSchemes_options___block_invoke_2;
        v18[3] = &unk_264310058;
        v18[4] = a1[4];
        v18[5] = v8;
        [v9 addSuccessBlock:v18];
        [v3 addObject:v9];
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v5);
  }

  uint64_t v10 = [a1[4] syncEngine];
  uint64_t v11 = [a1[4] localDB];
  id v12 = [v11 pendingRecordIDs];
  [v10 saveRecordsWithIDs:v12 qualityOfService:-1];

  if ([v3 count])
  {
    uint64_t v13 = +[MTPromise promiseWithAll:v3];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __45__MTIDCloudKitStore_maintainSchemes_options___block_invoke_3;
    v16[3] = &unk_264310080;
    id v17 = a1[7];
    [v13 addFinishBlock:v16];
  }
  else
  {
    [a1[7] finishWithResult:MEMORY[0x263EFFA88]];
  }
}

void __45__MTIDCloudKitStore_maintainSchemes_options___block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (objc_msgSend(v5, "mt_isSynchronized"))
  {
    id v3 = [*(id *)(a1 + 32) syncEngine];
    uint64_t v4 = [v5 recordID];
    [v3 fetchRecordWithID:v4];
  }
  [*(id *)(a1 + 32) generateFutureRecordsForScheme:*(void *)(a1 + 40) referenceRecord:v5];
}

uint64_t __45__MTIDCloudKitStore_maintainSchemes_options___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void **)(a1 + 32);
  if (a3) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = MEMORY[0x263EFFA88];
  }
  return [v4 finishWithResult:v5 error:a3];
}

- (void)clearLocalData
{
  id v2 = [(MTIDCloudKitStore *)self localDB];
  [v2 clearData];
}

- (id)debugInfo
{
  v12[2] = *MEMORY[0x263EF8340];
  id v3 = [(MTIDCloudKitStore *)self localDB];
  uint64_t v4 = [v3 allRecords];

  v11[0] = @"container";
  uint64_t v5 = [(MTIDCloudKitStore *)self containerIdentifier];
  uint64_t v6 = (void *)v5;
  if (v5) {
    id v7 = (__CFString *)v5;
  }
  else {
    id v7 = &stru_26C95D008;
  }
  v11[1] = @"secrets";
  v12[0] = v7;
  uint64_t v8 = objc_msgSend(v4, "mt_map:", &__block_literal_global_86);
  v12[1] = v8;
  id v9 = [NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:2];

  return v9;
}

id __30__MTIDCloudKitStore_debugInfo__block_invoke(uint64_t a1, void *a2)
{
  id v2 = (void *)MEMORY[0x263EFF9A0];
  id v3 = a2;
  uint64_t v4 = [v2 dictionary];
  uint64_t v5 = [v3 objectForKeyedSubscript:@"secretKey"];
  [v4 setObject:v5 forKeyedSubscript:@"key"];

  uint64_t v6 = objc_msgSend(v3, "mt_secretValue");
  [v4 setObject:v6 forKeyedSubscript:@"value"];

  id v7 = NSNumber;
  uint64_t v8 = objc_msgSend(v3, "mt_isSynchronized");

  id v9 = [v7 numberWithBool:v8];
  [v4 setObject:v9 forKeyedSubscript:@"isSynchronized"];

  uint64_t v10 = (void *)[v4 copy];

  return v10;
}

- (NSString)containerIdentifier
{
  return self->_containerIdentifier;
}

- (void)setContainerIdentifier:(id)a3
{
}

- (BOOL)canSyncBetweenDevices
{
  return self->_canSyncBetweenDevices;
}

- (void)setCanSyncBetweenDevices:(BOOL)a3
{
  self->_canSyncBetweenDevices = a3;
}

- (void)setSyncEngine:(id)a3
{
}

- (MTIDCloudKitLocalDB)localDB
{
  return self->_localDB;
}

- (void)setLocalDB:(id)a3
{
}

- (OS_dispatch_queue)accessQueue
{
  return self->_accessQueue;
}

- (void)setAccessQueue:(id)a3
{
}

- (NSMutableDictionary)generatedDates
{
  return self->_generatedDates;
}

- (void)setGeneratedDates:(id)a3
{
}

- (MTIDCloudKitPromiseManager)promiseManager
{
  return self->_promiseManager;
}

- (void)setPromiseManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_promiseManager, 0);
  objc_storeStrong((id *)&self->_generatedDates, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
  objc_storeStrong((id *)&self->_localDB, 0);
  objc_storeStrong((id *)&self->_syncEngine, 0);

  objc_storeStrong((id *)&self->_containerIdentifier, 0);
}

@end