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
          CFStringRef v27 = @"com.apple.developer.icloud-container-identifiers";
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "MetricsKit: The application is missing container %@ in %@ entitlement.", buf, 0x16u);
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
    v17 = +[NSMutableDictionary dictionary];
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
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10000E748;
    v9[3] = &unk_100020B68;
    objc_copyWeak(&v12, &location);
    id v10 = v6;
    id v11 = v7;
    dispatch_async(v8, v9);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

- (void)_generateFutureRecordsForScheme:(id)a3 referenceRecord:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  p_superclass = MTIDSecret.superclass;
  v9 = +[MTIDCloudKitStore referenceDateOfRecord:v7];
  if (!v9)
  {
    v24 = self;
    v36 = 0;
    v17 = 0;
    v20 = (char *)[v6 storagePoolSize] - 1;
LABEL_10:
    id v25 = 0;
    __int16 v26 = v24;
    do
    {
      CFStringRef v27 = v25;
      v28 = [v7 recordID];
      [p_superclass + 9 spanRecordIDForScheme:v6 referenceRecordID:v28 serialNumber:v17];
      v30 = v29 = p_superclass;

      v38[0] = _NSConcreteStackBlock;
      v38[1] = 3221225472;
      v38[2] = sub_10000EADC;
      v38[3] = &unk_100020B90;
      id v39 = v7;
      v41 = v17;
      id v40 = v6;
      id v37 = v27;
      id v31 = [(MTIDCloudKitStore *)v26 recordWithID:v30 qualityOfService:-1 updateRecordMaybe:v38 error:&v37];
      id v25 = v37;

      p_superclass = v29;
      ++v17;
    }
    while (v17 <= v20);

    v9 = v36;
    goto LABEL_14;
  }
  id v10 = +[MTFrameworkEnvironment sharedEnvironment];
  id v11 = [v10 date];

  [v6 maxFutureTimeInterval];
  id v12 = objc_msgSend(v11, "dateByAddingTimeInterval:");
  dispatch_queue_t v13 = [(MTIDCloudKitStore *)self generatedDates];
  v14 = [v6 idNamespace];
  v15 = [v13 objectForKeyedSubscript:v14];

  if (v15 && [v12 compare:v15] == (id)-1)
  {

    goto LABEL_14;
  }
  v35 = v15;
  v34 = +[MTIDSpan spanForScheme:v6 date:v11 referenceDate:v9];
  v16 = +[MTIDSpan spanForScheme:v6 date:v12 referenceDate:v9];
  v17 = (char *)[v34 serialNumber];
  v18 = (char *)[v16 serialNumber];
  v19 = (char *)[v6 storagePoolSize];
  if (v18 >= &v19[(void)v17 - 2]) {
    v20 = &v19[(void)v17 - 2];
  }
  else {
    v20 = v18;
  }
  v21 = [v16 endDate];
  [(MTIDCloudKitStore *)self generatedDates];
  v22 = v33 = v11;
  [v6 idNamespace];
  objc_super v23 = v32 = self;
  [v22 setObject:v21 forKeyedSubscript:v23];

  if (v17 <= v20)
  {
    v24 = v32;
    v36 = v9;
    p_superclass = (__objc2_class **)(MTIDSecret + 8);
    goto LABEL_10;
  }
LABEL_14:
}

- (id)recordWithID:(id)a3 qualityOfService:(int64_t)a4 updateRecordMaybe:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = (unsigned int (**)(id, id))a5;
  id v12 = [(MTIDCloudKitStore *)self accessQueue];
  dispatch_assert_queue_V2(v12);

  dispatch_queue_t v13 = [(MTIDCloudKitStore *)self localDB];
  id v25 = 0;
  id v14 = [v13 recordWithID:v10 error:&v25];
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
    id v18 = objc_alloc((Class)CKRecord);
    v19 = [v13 recordType];
    id v14 = [v18 initWithRecordType:v19 recordID:v10];
  }
  if (!v11[2](v11, v14))
  {
    id v16 = 0;
LABEL_11:
    id v17 = v14;
    id v14 = v17;
    goto LABEL_14;
  }
  id v24 = 0;
  unsigned __int8 v20 = [v13 writeRecord:v14 error:&v24];
  id v16 = v24;
  if (v20)
  {
    if ([(MTIDCloudKitStore *)self canSyncBetweenDevices])
    {
      v21 = [(MTIDCloudKitStore *)self syncEngine];
      id v26 = v10;
      v22 = +[NSArray arrayWithObjects:&v26 count:1];
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
  id v14 = objc_alloc_init(MTPromise);
  id v15 = [(MTIDCloudKitStore *)self accessQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000EEBC;
  block[3] = &unk_100020BE0;
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

  v19 = v24;
  unsigned __int8 v20 = v16;

  return v20;
}

+ (id)recordZoneID
{
  id v2 = [objc_alloc((Class)CKRecordZoneID) initWithZoneName:@"MT_IDZone" ownerName:CKCurrentUserDefaultName];

  return v2;
}

+ (id)referenceRecordIDForScheme:(id)a3 dsId:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [v6 idNamespace];
  id v8 = [v6 idType];

  if (v5 && v8 == (id)2)
  {
    uint64_t v9 = objc_msgSend(v7, "stringByAppendingFormat:", @"_%llx", objc_msgSend(v5, "unsignedLongLongValue"));

    id v7 = (void *)v9;
  }
  id v10 = objc_msgSend(v7, "mt_SHA1Base62String");
  id v11 = [@"MT_ID" stringByAppendingString:v10];

  id v12 = objc_alloc((Class)CKRecordID);
  id v13 = +[MTIDCloudKitStore recordZoneID];
  id v14 = [v12 initWithRecordName:v11 zoneID:v13];

  return v14;
}

+ (id)referenceDateOfRecord:(id)a3
{
  v3 = [a3 objectForKeyedSubscript:@"secretKey"];
  BOOL v4 = v3;
  if (v3)
  {
    [v3 doubleValue];
    id v5 = +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:");
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
    [a3 timeIntervalSince1970];
    id v5 = +[NSString stringWithFormat:@"%lld", (uint64_t)v4];
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

+ (id)spanRecordIDForScheme:(id)a3 referenceRecordID:(id)a4 serialNumber:(unint64_t)a5
{
  id v8 = a3;
  uint64_t v9 = [a4 recordName];
  unint64_t v10 = (unint64_t)[v8 storagePoolSize];

  id v11 = +[NSString stringWithFormat:@"%@_%02lx", v9, a5 % v10];

  id v12 = objc_alloc((Class)CKRecordID);
  id v13 = [a1 recordZoneID];
  id v14 = [v12 initWithRecordName:v11 zoneID:v13];

  return v14;
}

+ (id)spanRecordKeyWithReferenceRecord:(id)a3 serialNumber:(unint64_t)a4
{
  return +[NSString stringWithFormat:@"%llx", a4];
}

+ (BOOL)updateRecord:(id)a3 isSpanRecord:(BOOL)a4 scheme:(id)a5 expectedKey:(id)a6 expiration:(id)a7 reset:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v12 = a4;
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  id v32 = a7;
  uint64_t v16 = [v13 objectForKeyedSubscript:@"namespace"];
  id v17 = [v13 objectForKeyedSubscript:@"secretKey"];
  id v18 = [v14 idNamespace];
  id v31 = (void *)v16;
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
            _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "MetricsKit: Updating reference record %@ with current date", buf, 0xCu);
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
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEBUG, "MetricsKit: Updating record %@ for namespace %@ key %@", buf, 0x20u);
  }
  double v27 = [v14 idNamespace];
  [v13 setObject:v27 forKeyedSubscript:@"namespace"];

  [v13 setObject:v15 forKeyedSubscript:@"secretKey"];
  id v23 = v32;
  [v13 setObject:v32 forKeyedSubscript:@"expiration"];
  BOOL v28 = +[NSUUID UUID];
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
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10000F8A4;
  v23[3] = &unk_100020C08;
  BOOL v26 = v10;
  id v24 = v17;
  id v25 = v16;
  BOOL v27 = a6;
  id v19 = v16;
  id v20 = v17;
  int v21 = [(MTIDCloudKitStore *)self promiseForRecordWithID:v18 timeout:a9 qualityOfService:v10 existingOnly:v23 updateRecordMaybe:a7];

  return v21;
}

- (id)spanRecordForScheme:(id)a3 span:(id)a4 timeout:(double)a5 existingOnly:(BOOL)a6 qualityOfService:(int64_t)a7 referenceRecord:(id)a8
{
  BOOL v10 = a6;
  id v14 = a3;
  id v15 = a4;
  id v16 = a8;
  id v17 = [v16 recordID];
  id v18 = +[MTIDCloudKitStore spanRecordIDForScheme:referenceRecordID:serialNumber:](MTIDCloudKitStore, "spanRecordIDForScheme:referenceRecordID:serialNumber:", v14, v17, [v15 serialNumber]);

  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10000FAB4;
  v24[3] = &unk_100020C30;
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

- (void)fetchChangesIfNeeded
{
  uint64_t v3 = [(MTIDCloudKitStore *)self localDB];
  unsigned int v4 = [v3 needsFetchRecords];

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
  id v6 = a3;
  id v7 = [a4 objectForKeyedSubscript:@"dsId"];
  id v8 = objc_alloc_init((Class)NSMutableArray);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v9 = v6;
  id v10 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v23;
    do
    {
      id v13 = 0;
      id v14 = v8;
      do
      {
        if (*(void *)v23 != v12) {
          objc_enumerationMutation(v9);
        }
        id v15 = +[MTIDCloudKitStore referenceRecordIDForScheme:*(void *)(*((void *)&v22 + 1) + 8 * (void)v13) dsId:v7];
        id v8 = [v14 arrayByAddingObject:v15];

        id v13 = (char *)v13 + 1;
        id v14 = v8;
      }
      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v11);
  }

  id v16 = [(MTIDCloudKitStore *)self syncEngine];

  if (v16)
  {
    id v17 = [(MTIDCloudKitStore *)self syncEngine];
    id v18 = [v17 fetchRecordWithIDs:v8];

    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_10000FE44;
    v21[3] = &unk_100020C58;
    v21[4] = self;
    id v19 = [v18 thenWithBlock:v21];
  }
  else
  {
    id v19 = 0;
  }

  return v19;
}

- (void)accountDidChangeWithUserRecordID:(id)a3
{
  id v4 = a3;
  id v5 = [(MTIDCloudKitStore *)self accessQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(MTIDCloudKitStore *)self localDB];
  id v7 = [v4 recordName];
  unsigned int v8 = [v6 setUserRecordIDName:v7];

  if (v8)
  {
    id v9 = MTMetricsKitOSLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      id v10 = [v4 recordName];
      int v11 = 138412290;
      uint64_t v12 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "MetricsKit: Updated user record with ID %@", (uint8_t *)&v11, 0xCu);
    }
    +[MTInterprocessChangeNotifier notify:@"MTCloudKitAccountDidChangeNotification"];
  }
}

- (void)syncEngineDidStartWithError:(id)a3
{
  id v4 = a3;
  id v5 = [(MTIDCloudKitStore *)self accessQueue];
  dispatch_assert_queue_V2(v5);

  if (v4)
  {
    id v6 = [v4 domain];
    id v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@-%ld", v6, [v4 code]);

    unsigned int v8 = [(MTIDCloudKitStore *)self localDB];
    [v8 setSyncStatusCode:v7];

    id v9 = MTMetricsKitOSLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v4;
      id v10 = "MetricsKit: Error starting sync engine: %@";
      int v11 = v9;
      os_log_type_t v12 = OS_LOG_TYPE_ERROR;
      uint32_t v13 = 12;
LABEL_9:
      _os_log_impl((void *)&_mh_execute_header, v11, v12, v10, buf, v13);
    }
  }
  else
  {
    id v14 = [(MTIDCloudKitStore *)self localDB];
    [v14 setSyncStatusCode:@"Ready"];

    [(MTIDCloudKitStore *)self fetchChangesIfNeeded];
    id v15 = [(MTIDCloudKitStore *)self localDB];
    id v7 = [v15 pendingRecordIDs];

    if ([v7 count])
    {
      id v16 = [(MTIDCloudKitStore *)self syncEngine];
      [v16 saveRecordsWithIDs:v7 qualityOfService:25];

      id v9 = MTMetricsKitOSLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v18) = [v7 count];
        id v10 = "MetricsKit: Started sync engine with %d unsynchronized records";
        int v11 = v9;
        os_log_type_t v12 = OS_LOG_TYPE_DEBUG;
        uint32_t v13 = 8;
        goto LABEL_9;
      }
    }
    else
    {
      id v9 = MTMetricsKitOSLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        id v10 = "MetricsKit: Started sync engine with all records synchronized";
        int v11 = v9;
        os_log_type_t v12 = OS_LOG_TYPE_DEBUG;
        uint32_t v13 = 2;
        goto LABEL_9;
      }
    }
  }
}

- (id)recordWithID:(id)a3
{
  id v4 = a3;
  id v5 = [(MTIDCloudKitStore *)self localDB];
  id v11 = 0;
  id v6 = [v5 recordWithID:v4 error:&v11];
  id v7 = v11;

  if (!v6)
  {
    unsigned int v8 = MTMetricsKitOSLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v9 = [v4 recordName];
      *(_DWORD *)buf = 138412546;
      uint32_t v13 = v9;
      __int16 v14 = 2112;
      id v15 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "MetricsKit: Failed to read local record data with ID %@ error %@", buf, 0x16u);
    }
  }

  return v6;
}

- (void)recordWasSaved:(id)a3
{
  id v4 = a3;
  id v5 = [v4 recordType];
  unsigned int v6 = [v5 isEqualToString:@"MT_IDSecret"];

  if (v6)
  {
    objc_msgSend(v4, "mt_setSynchronized:", 1);
    id v7 = [(MTIDCloudKitStore *)self localDB];
    id v13 = 0;
    unsigned __int8 v8 = [v7 writeRecord:v4 error:&v13];
    id v9 = v13;

    if ((v8 & 1) == 0)
    {
      id v10 = MTMetricsKitOSLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        id v11 = [v4 recordID];
        os_log_type_t v12 = [v11 recordName];
        *(_DWORD *)buf = 138412546;
        id v15 = v12;
        __int16 v16 = 2112;
        id v17 = v9;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "MetricsKit: Failed to save local record data with ID %@ error %@", buf, 0x16u);
      }
    }
  }
}

- (void)recordWasFailedToSave:(id)a3
{
  id v7 = a3;
  id v4 = [v7 recordType];
  unsigned int v5 = [v4 isEqualToString:@"MT_IDSecret"];

  if (v5)
  {
    unsigned int v6 = [(MTIDCloudKitStore *)self promiseManager];
    [v6 finishPromisesOfRecord:v7];
  }
}

- (void)recordWasFetched:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [v4 recordType];
  unsigned int v6 = [v5 isEqualToString:@"MT_IDSecret"];

  if (v6)
  {
    id v7 = [v4 recordID];
    unsigned __int8 v8 = [v7 recordName];
    unsigned int v9 = [v8 hasPrefix:@"MT_ID"];

    if (v9)
    {
      objc_msgSend(v4, "mt_setSynchronized:", 1);
      id v10 = [(MTIDCloudKitStore *)self localDB];
      id v16 = 0;
      unsigned __int8 v11 = [v10 writeRecord:v4 error:&v16];
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
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "MetricsKit: Failed to save local record data with ID %@ error %@", buf, 0x16u);
    }
    else
    {
      id v12 = [(MTIDCloudKitStore *)self syncEngine];
      id v13 = [v4 recordID];
      id v17 = v13;
      __int16 v14 = +[NSArray arrayWithObjects:&v17 count:1];
      [v12 deleteRecordsWithIDs:v14];
    }

    goto LABEL_8;
  }
LABEL_10:
}

- (void)recordWasDeleted:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(MTIDCloudKitStore *)self localDB];
  id v10 = 0;
  unsigned __int8 v6 = [v5 deleteRecordWithID:v4 error:&v10];
  id v7 = v10;

  if ((v6 & 1) == 0)
  {
    unsigned __int8 v8 = MTMetricsKitOSLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      unsigned int v9 = [v4 recordName];
      *(_DWORD *)buf = 138412546;
      id v12 = v9;
      __int16 v13 = 2112;
      id v14 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "MetricsKit: Failed to delete local record data with ID %@ error %@", buf, 0x16u);
    }
  }
}

- (void)cloudKitLocalDB:(id)a3 didChangeRecord:(id)a4
{
  id v7 = a4;
  if (objc_msgSend(v7, "mt_isSynchronized"))
  {
    unsigned int v5 = [(MTIDCloudKitStore *)self promiseManager];
    [v5 finishPromisesOfRecord:v7];

    unsigned __int8 v6 = [v7 objectForKeyedSubscript:@"namespace"];
    +[MTInterprocessChangeNotifier notify:v6];
  }
}

- (id)secretForScheme:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned __int8 v8 = [v7 objectForKeyedSubscript:@"appBundleID"];
  unsigned int v9 = [(MTIDCloudKitStore *)self syncEngine];
  [v9 setApplicationBundleIdentifierOverrideForNetworkAttribution:v8];

  id v10 = [v7 objectForKeyedSubscript:@"date"];
  unsigned __int8 v11 = v10;
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
  id v15 = [v14 BOOLValue];

  id v16 = [v7 objectForKeyedSubscript:@"syncWaitTime"];
  id v17 = [v7 objectForKeyedSubscript:@"existingOnly"];
  id v18 = [v17 BOOLValue];

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
    long long v22 = [v6 idNamespace];
    CFStringRef v23 = @"NO";
    *(_DWORD *)buf = 138413058;
    *(void *)&uint8_t buf[4] = v22;
    if (v18) {
      CFStringRef v23 = @"YES";
    }
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v12;
    *(_WORD *)&buf[22] = 2112;
    v44 = (uint64_t (*)(uint64_t, uint64_t))v23;
    LOWORD(v45) = 2048;
    *(double *)((char *)&v45 + 2) = v20;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "MetricsKit: Secret requested for scheme %@, date: %@, existingOnly: %@, timeout: %f", buf, 0x2Au);
  }
  if (!v18) {
    goto LABEL_14;
  }
  long long v24 = +[MTIDCloudKitStore referenceRecordIDForScheme:v6 dsId:v34];
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
    v44 = sub_100011020;
    *(void *)&long long v45 = sub_100011030;
    *((void *)&v45 + 1) = 0;
    id v27 = [(MTIDCloudKitStore *)self referenceRecordForScheme:v6 dsId:v34 date:v12 reset:v15 timeout:v18 existingOnly:25 qualityOfService:v20];
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_100011038;
    v35[3] = &unk_100020CA8;
    id v36 = v6;
    id v38 = self;
    id v39 = buf;
    id v37 = v12;
    double v40 = v20;
    char v41 = (char)v18;
    BOOL v28 = [v27 thenWithBlock:v35];

    _Block_object_dispose(buf, 8);
    goto LABEL_15;
  }
  v30 = [[MTIDSecret alloc] initWithValue:&stru_100021530 effectiveDate:0 expirationDate:0 isSynchronize:0];
  id v31 = MTMetricsKitOSLog();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
  {
    id v32 = [v6 idNamespace];
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v32;
    _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "MetricsKit: Secret doesn't exist, returning empty secret for scheme %@", buf, 0xCu);
  }
  BOOL v28 = +[MTPromise promiseWithResult:v30];

LABEL_15:

  return v28;
}

- (id)resetSchemes:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned __int8 v8 = [v7 objectForKeyedSubscript:@"appBundleID"];
  unsigned int v9 = [(MTIDCloudKitStore *)self syncEngine];
  [v9 setApplicationBundleIdentifierOverrideForNetworkAttribution:v8];

  id v10 = [v7 objectForKeyedSubscript:@"dsId"];
  unsigned __int8 v11 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v6 count]);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v12 = v6;
  id v13 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v22;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v22 != v15) {
          objc_enumerationMutation(v12);
        }
        id v17 = -[MTIDCloudKitStore referenceRecordForScheme:dsId:date:reset:timeout:existingOnly:qualityOfService:](self, "referenceRecordForScheme:dsId:date:reset:timeout:existingOnly:qualityOfService:", *(void *)(*((void *)&v21 + 1) + 8 * i), v10, 0, 1, 0, 25, 0.0, (void)v21);
        [v11 addObject:v17];
      }
      id v14 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v14);
  }

  id v18 = +[MTPromise promiseWithAll:v11];
  double v19 = [v18 thenWithBlock:&stru_100020CE8];

  return v19;
}

- (id)maintainSchemes:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned __int8 v8 = [v7 objectForKeyedSubscript:@"appBundleID"];
  unsigned int v9 = [(MTIDCloudKitStore *)self syncEngine];
  [v9 setApplicationBundleIdentifierOverrideForNetworkAttribution:v8];

  if ([(MTIDCloudKitStore *)self canSyncBetweenDevices])
  {
    id v10 = MTMetricsKitOSLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109120;
      unsigned int v22 = [v6 count];
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "MetricsKit: Performing maintenance on %d ID schemes", buf, 8u);
    }

    unsigned __int8 v11 = objc_alloc_init(MTPromise);
    id v12 = [(MTIDCloudKitStore *)self accessQueue];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100011AD8;
    v17[3] = &unk_100020D60;
    v17[4] = self;
    id v18 = v7;
    id v19 = v6;
    id v13 = v11;
    double v20 = v13;
    dispatch_async(v12, v17);

    id v14 = v20;
    uint64_t v15 = v13;
  }
  else
  {
    uint64_t v15 = +[MTPromise promiseWithResult:&__kCFBooleanTrue];
  }

  return v15;
}

- (void)clearLocalData
{
  id v2 = [(MTIDCloudKitStore *)self localDB];
  [v2 clearData];
}

- (id)debugInfo
{
  uint64_t v3 = [(MTIDCloudKitStore *)self localDB];
  id v4 = [v3 allRecords];

  v11[0] = @"container";
  uint64_t v5 = [(MTIDCloudKitStore *)self containerIdentifier];
  id v6 = (void *)v5;
  if (v5) {
    CFStringRef v7 = (const __CFString *)v5;
  }
  else {
    CFStringRef v7 = &stru_100021530;
  }
  v11[1] = @"secrets";
  v12[0] = v7;
  unsigned __int8 v8 = objc_msgSend(v4, "mt_map:", &stru_100020DA0);
  v12[1] = v8;
  unsigned int v9 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:2];

  return v9;
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