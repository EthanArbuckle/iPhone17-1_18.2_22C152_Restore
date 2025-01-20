@interface MBCKModel
+ (BOOL)supportsSecureCoding;
+ (double)timeoutIntervalForFetch;
+ (double)timeoutIntervalForModify;
+ (id)privilegedQueryType;
+ (id)recordType;
+ (void)fetchFromServerWithOperationTracker:(id)a3 childrenOfClass:(Class)a4 refs:(id)a5 cache:(id)a6 completion:(id)a7;
- (BOOL)fetchFromServerWithOperationTracker:(id)a3 error:(id *)a4;
- (BOOL)isPersistedToServer;
- (BOOL)saveToCacheWithError:(id *)a3;
- (BOOL)saveWithOperationTracker:(id)a3 error:(id *)a4;
- (BOOL)validateCache;
- (CKRecordID)recordID;
- (MBCKCache)cache;
- (MBCKModel)init;
- (MBCKModel)initWithCoder:(id)a3;
- (MBCKModel)initWithDictionary:(id)a3 cache:(id)a4;
- (MBCKModel)initWithRecord:(id)a3 cache:(id)a4;
- (MBDebugContext)debugContext;
- (MBProgressModel)progressModel;
- (MBRetryStrategy)retryStrategy;
- (NSData)systemFieldData;
- (NSString)recordIDString;
- (NSString)recordType;
- (id)_getRecordIDString;
- (id)handleMergeConflictWithOperationTracker:(id)a3 attemptedRecord:(id)a4 serverRecord:(id)a5 originalRecord:(id)a6;
- (id)mergeRecordsWithOperationTracker:(id)a3 serverRecord:(id)a4 originalRecord:(id)a5;
- (id)recordRepresentation;
- (int64_t)savePolicy;
- (unint64_t)recordZone;
- (void)addSavesWithBatchSave:(id)a3 completion:(id)a4;
- (void)addSavesWithOperationTracker:(id)a3 completion:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)fetchFromServerWithOperationTracker:(id)a3 childrenOfClass:(Class)a4 refs:(id)a5 completion:(id)a6;
- (void)fetchFromServerWithOperationTracker:(id)a3 completion:(id)a4;
- (void)handleSaveComplete:(id)a3 withError:(id)a4 completion:(id)a5;
- (void)prepareForSaveWithOperationTracker:(id)a3 completion:(id)a4;
- (void)refreshWithRecord:(id)a3;
- (void)saveToCacheWithCompletion:(id)a3;
- (void)saveWithBatchSave:(id)a3 completion:(id)a4;
- (void)saveWithOperationTracker:(id)a3 completion:(id)a4;
- (void)setCache:(id)a3;
- (void)setDebugContext:(id)a3;
- (void)setIsPersistedToServer:(BOOL)a3;
- (void)setProgressModel:(id)a3;
- (void)setRecordID:(id)a3;
- (void)setRecordIDString:(id)a3;
- (void)setRetryStrategy:(id)a3;
- (void)setSystemFieldData:(id)a3;
@end

@implementation MBCKModel

- (MBCKModel)init
{
  v4 = +[NSAssertionHandler currentHandler];
  v5 = (objc_class *)objc_opt_class();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"MBCKModel.m", 30, @"You must call -[%s initWithRecord:cache:]", class_getName(v5));

  return 0;
}

- (MBCKModel)initWithRecord:(id)a3 cache:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MBCKModel;
  v8 = [(MBCKModel *)&v12 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_cache, a4);
    if (v6)
    {
      v10 = [v6 creationDate];

      if (v10) {
        [(MBCKModel *)v9 setIsPersistedToServer:1];
      }
      [(MBCKModel *)v9 refreshWithRecord:v6];
    }
  }

  return v9;
}

- (MBCKModel)initWithDictionary:(id)a3 cache:(id)a4
{
  id v6 = a3;
  id v7 = [(MBCKModel *)self initWithRecord:0 cache:a4];
  v8 = v7;
  if (v7) {
    [(MBCKModel *)v7 refreshWithDictionary:v6];
  }

  return v8;
}

- (MBDebugContext)debugContext
{
  debugContext = self->_debugContext;
  if (!debugContext)
  {
    v4 = (MBDebugContext *)objc_alloc_init((Class)MBDebugContext);
    v5 = self->_debugContext;
    self->_debugContext = v4;

    debugContext = self->_debugContext;
  }
  return debugContext;
}

- (MBRetryStrategy)retryStrategy
{
  retryStrategy = self->_retryStrategy;
  if (!retryStrategy)
  {
    v4 = [MBRetryStrategy alloc];
    v5 = [(MBCKModel *)self debugContext];
    id v6 = [(MBRetryStrategy *)v4 initWithDebugContext:v5 networkAvailabilityProvider:0 engineMode:0 restoreType:0];
    id v7 = self->_retryStrategy;
    self->_retryStrategy = v6;

    retryStrategy = self->_retryStrategy;
  }
  return retryStrategy;
}

- (void)fetchFromServerWithOperationTracker:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6) {
    __assert_rtn("-[MBCKModel fetchFromServerWithOperationTracker:completion:]", "MBCKModel.m", 64, "tracker");
  }
  v8 = (void (**)(void, void))v7;
  if (!v7) {
    __assert_rtn("-[MBCKModel fetchFromServerWithOperationTracker:completion:]", "MBCKModel.m", 65, "completion");
  }
  [(id)objc_opt_class() timeoutIntervalForFetch];
  double v10 = v9;
  v11 = [v6 ckOperationPolicy];
  if (!v11) {
    __assert_rtn("-[MBCKModel fetchFromServerWithOperationTracker:completion:]", "MBCKModel.m", 69, "policy");
  }
  objc_super v12 = v11;
  if ([v11 fetchAssets])
  {
    [v12 timeoutIntervalForFetch];
    if (v10 == v13)
    {
      id v14 = v12;
      goto LABEL_10;
    }
  }
  id v14 = [v12 copy];

  [v14 setFetchAssets:1];
  [v14 setTimeoutIntervalForFetch:v10];
  id v20 = 0;
  uint64_t v15 = +[MBCKOperationTracker operationTrackerWithParentTracker:v6 policy:v14 error:&v20];
  id v16 = v20;

  if (v15)
  {

    id v6 = (id)v15;
LABEL_10:
    v17 = [(MBCKModel *)self recordID];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1000620AC;
    v18[3] = &unk_1004111B0;
    v18[4] = self;
    v19 = v8;
    [v6 fetchRecordWithID:v17 completion:v18];

    id v16 = v6;
    goto LABEL_11;
  }
  ((void (**)(void, id))v8)[2](v8, v16);
LABEL_11:
}

- (BOOL)fetchFromServerWithOperationTracker:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = sub_100062364;
  v17 = sub_100062374;
  id v18 = 0;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10006237C;
  v10[3] = &unk_100410FC8;
  objc_super v12 = &v13;
  id v7 = dispatch_semaphore_create(0);
  v11 = v7;
  [(MBCKModel *)self fetchFromServerWithOperationTracker:v6 completion:v10];
  MBSemaphoreWaitForever();
  v8 = (void *)v14[5];
  if (a4 && v8) {
    *a4 = v8;
  }

  _Block_object_dispose(&v13, 8);
  return v8 == 0;
}

+ (void)fetchFromServerWithOperationTracker:(id)a3 childrenOfClass:(Class)a4 refs:(id)a5 cache:(id)a6 completion:(id)a7
{
  id v11 = a3;
  id v32 = a5;
  id v35 = a6;
  id v12 = a7;
  if (!v11) {
    __assert_rtn("+[MBCKModel fetchFromServerWithOperationTracker:childrenOfClass:refs:cache:completion:]", "MBCKModel.m", 111, "tracker");
  }
  if (!a4) {
    __assert_rtn("+[MBCKModel fetchFromServerWithOperationTracker:childrenOfClass:refs:cache:completion:]", "MBCKModel.m", 112, "childClass");
  }
  if (!v32) {
    __assert_rtn("+[MBCKModel fetchFromServerWithOperationTracker:childrenOfClass:refs:cache:completion:]", "MBCKModel.m", 113, "refs");
  }
  if (!v12) {
    __assert_rtn("+[MBCKModel fetchFromServerWithOperationTracker:childrenOfClass:refs:cache:completion:]", "MBCKModel.m", 114, "completion");
  }
  v30 = (void (**)(void, void, void, void))v12;
  Class v34 = a4;
  [(objc_class *)a4 timeoutIntervalForFetch];
  double v14 = v13;
  uint64_t v15 = [v11 ckOperationPolicy];
  id v16 = v15;
  if (!v15) {
    __assert_rtn("+[MBCKModel fetchFromServerWithOperationTracker:childrenOfClass:refs:cache:completion:]", "MBCKModel.m", 118, "policy");
  }
  if ([v15 fetchAssets] && (objc_msgSend(v16, "timeoutIntervalForFetch"), v14 == v17))
  {
    v29 = v16;
    v31 = v11;
  }
  else
  {
    id v18 = [v16 copy];

    [v18 setFetchAssets:1];
    [v18 setTimeoutIntervalForFetch:v14];
    id v54 = 0;
    v29 = v18;
    v31 = +[MBCKOperationTracker operationTrackerWithParentTracker:v11 policy:v18 error:&v54];
    id v19 = v54;

    if (!v31)
    {
      ((void (**)(void, void, void, id))v30)[2](v30, 0, 0, v19);
      goto LABEL_20;
    }
  }
  v52[0] = 0;
  v52[1] = v52;
  v52[2] = 0x3032000000;
  v52[3] = sub_100062364;
  v52[4] = sub_100062374;
  id v53 = 0;
  id v20 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v32, "count"));
  v21 = objc_opt_new();
  v22 = [v31 startBatchFetch];
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id obj = v32;
  id v23 = [obj countByEnumeratingWithState:&v48 objects:v55 count:16];
  if (v23)
  {
    uint64_t v24 = *(void *)v49;
    do
    {
      for (i = 0; i != v23; i = (char *)i + 1)
      {
        if (*(void *)v49 != v24) {
          objc_enumerationMutation(obj);
        }
        v26 = [*(id *)(*((void *)&v48 + 1) + 8 * i) recordID];
        v42[0] = _NSConcreteStackBlock;
        v42[1] = 3221225472;
        v42[2] = sub_1000628EC;
        v42[3] = &unk_1004111D8;
        id v43 = v21;
        v46 = v52;
        Class v47 = v34;
        id v44 = v35;
        id v45 = v20;
        [v22 fetchRecordWithID:v26 completion:v42];
      }
      id v23 = [obj countByEnumeratingWithState:&v48 objects:v55 count:16];
    }
    while (v23);
  }

  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_100062A64;
  v36[3] = &unk_100411200;
  v41 = v52;
  id v27 = v20;
  id v37 = v27;
  id v28 = v21;
  id v38 = v28;
  id v39 = obj;
  v40 = v30;
  [v31 finishBatchFetch:v22 completion:v36];

  _Block_object_dispose(v52, 8);
  id v19 = v31;
LABEL_20:
}

- (void)fetchFromServerWithOperationTracker:(id)a3 childrenOfClass:(Class)a4 refs:(id)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  double v13 = objc_opt_class();
  id v14 = [(MBCKModel *)self cache];
  [v13 fetchFromServerWithOperationTracker:v12 childrenOfClass:a4 refs:v11 cache:v14 completion:v10];
}

- (id)handleMergeConflictWithOperationTracker:(id)a3 attemptedRecord:(id)a4 serverRecord:(id)a5 originalRecord:(id)a6
{
  return -[MBCKModel mergeRecordsWithOperationTracker:serverRecord:originalRecord:](self, "mergeRecordsWithOperationTracker:serverRecord:originalRecord:", a3, a5, a4, a6);
}

- (void)addSavesWithOperationTracker:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6) {
    __assert_rtn("-[MBCKModel addSavesWithOperationTracker:completion:]", "MBCKModel.m", 173, "tracker");
  }
  v8 = (void (**)(void, void))v7;
  if (!v7) {
    __assert_rtn("-[MBCKModel addSavesWithOperationTracker:completion:]", "MBCKModel.m", 174, "completion");
  }
  double v9 = [(MBCKModel *)self recordRepresentation];
  id v10 = MBGetDefaultLog();
  id v11 = v10;
  if (v9)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      id v12 = [v9 recordID];
      *(_DWORD *)buf = 138543362;
      id v18 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "Saving record %{public}@ to server", buf, 0xCu);

      id v14 = [v9 recordID];
      _MBLog();
    }
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100062E58;
    v15[3] = &unk_100411228;
    v15[4] = self;
    id v16 = v8;
    [v6 saveRecord:v9 delegate:self completion:v15];
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = self;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Failed to fetch the record representation for %@", buf, 0xCu);
      _MBLog();
    }

    double v13 = +[MBError errorWithCode:10, @"CloudKit record representation is nil for %@", self format];
    ((void (**)(void, void *))v8)[2](v8, v13);
  }
}

- (void)saveWithOperationTracker:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6) {
    __assert_rtn("-[MBCKModel saveWithOperationTracker:completion:]", "MBCKModel.m", 190, "tracker");
  }
  v8 = v7;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100062F58;
  v11[3] = &unk_100411250;
  id v12 = v6;
  id v13 = v7;
  v11[4] = self;
  id v9 = v6;
  id v10 = v8;
  [(MBCKModel *)self prepareForSaveWithOperationTracker:v9 completion:v11];
}

- (BOOL)saveWithOperationTracker:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = sub_100062364;
  double v17 = sub_100062374;
  id v18 = 0;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000631B4;
  v10[3] = &unk_100410FC8;
  id v12 = &v13;
  id v7 = dispatch_semaphore_create(0);
  id v11 = v7;
  [(MBCKModel *)self saveWithOperationTracker:v6 completion:v10];
  MBSemaphoreWaitForever();
  v8 = (void *)v14[5];
  if (a4 && v8) {
    *a4 = v8;
  }

  _Block_object_dispose(&v13, 8);
  return v8 == 0;
}

- (void)addSavesWithBatchSave:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6) {
    __assert_rtn("-[MBCKModel addSavesWithBatchSave:completion:]", "MBCKModel.m", 217, "batchSave");
  }
  v8 = (void (**)(void, void))v7;
  if (!v7) {
    __assert_rtn("-[MBCKModel addSavesWithBatchSave:completion:]", "MBCKModel.m", 218, "completion");
  }
  id v9 = [(MBCKModel *)self recordRepresentation];
  if (v9)
  {
    id v10 = MBGetDefaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      id v11 = [v9 recordID];
      *(_DWORD *)buf = 138543362;
      double v17 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "Saving record %{public}@ to server", buf, 0xCu);

      uint64_t v13 = [v9 recordID];
      _MBLog();
    }
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100063430;
    v14[3] = &unk_100411228;
    v14[4] = self;
    uint64_t v15 = v8;
    [v6 saveRecord:v9 delegate:self completion:v14];
  }
  else
  {
    id v12 = +[MBError errorWithCode:10, @"CloudKit record representation is nil for %@", self format];
    ((void (**)(void, void *))v8)[2](v8, v12);
  }
}

- (void)saveWithBatchSave:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6) {
    __assert_rtn("-[MBCKModel saveWithBatchSave:completion:]", "MBCKModel.m", 234, "batchedSave");
  }
  v8 = v7;
  uint64_t v9 = [v6 ckOperationTracker];
  if (!v9) {
    __assert_rtn("-[MBCKModel saveWithBatchSave:completion:]", "MBCKModel.m", 236, "tracker");
  }
  id v10 = (void *)v9;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100063568;
  v13[3] = &unk_100411250;
  id v14 = v6;
  id v15 = v8;
  v13[4] = self;
  id v11 = v6;
  id v12 = v8;
  [(MBCKModel *)self prepareForSaveWithOperationTracker:v10 completion:v13];
}

- (CKRecordID)recordID
{
  v2 = self;
  objc_sync_enter(v2);
  if (v2->_recordID)
  {
    v3 = [(MBCKModel *)v2 _getRecordIDString];
    v4 = [(CKRecordID *)v2->_recordID recordName];
    unsigned __int8 v5 = [v4 isEqualToString:v3];

    if ((v5 & 1) == 0)
    {
      id v6 = MBGetDefaultLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        id v7 = v6;
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          v8 = [(CKRecordID *)v2->_recordID recordName];
          *(_DWORD *)buf = 138543618;
          uint64_t v24 = v8;
          __int16 v25 = 2114;
          v26 = v3;
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "RecordID string has changed: %{public}@ -> %{public}@", buf, 0x16u);
        }
        v22 = [(CKRecordID *)v2->_recordID recordName];
        _MBLog();
      }
      objc_storeStrong((id *)&v2->_recordIDString, v3);
      id v9 = objc_alloc((Class)CKRecordID);
      id v10 = +[MBCKDatabaseManager zoneIDOfType:[(MBCKModel *)v2 recordZone]];
      id v11 = (CKRecordID *)[v9 initWithRecordName:v3 zoneID:v10];
      recordID = v2->_recordID;
      v2->_recordID = v11;
    }
  }
  else
  {
    uint64_t v13 = v2->_recordIDString;
    if (!v13)
    {
      id v14 = [(MBCKModel *)v2 _getRecordIDString];
      recordIDString = v2->_recordIDString;
      v2->_recordIDString = v14;

      uint64_t v13 = v14;
    }
    id v16 = objc_alloc((Class)CKRecordID);
    double v17 = +[MBCKDatabaseManager zoneIDOfType:[(MBCKModel *)v2 recordZone]];
    id v18 = (CKRecordID *)[v16 initWithRecordName:v13 zoneID:v17];
    id v19 = v2->_recordID;
    v2->_recordID = v18;
  }
  id v20 = v2->_recordID;
  objc_sync_exit(v2);

  return v20;
}

- (NSString)recordIDString
{
  v2 = self;
  objc_sync_enter(v2);
  recordIDString = v2->_recordIDString;
  if (!recordIDString)
  {
    uint64_t v4 = [(MBCKModel *)v2 _getRecordIDString];
    unsigned __int8 v5 = v2->_recordIDString;
    v2->_recordIDString = (NSString *)v4;

    recordIDString = v2->_recordIDString;
  }
  id v6 = recordIDString;
  objc_sync_exit(v2);

  return v6;
}

- (void)prepareForSaveWithOperationTracker:(id)a3 completion:(id)a4
{
}

- (id)recordRepresentation
{
  v3 = [(MBCKModel *)self systemFieldData];

  if (v3)
  {
    id v4 = objc_alloc((Class)NSKeyedUnarchiver);
    unsigned __int8 v5 = [(MBCKModel *)self systemFieldData];
    id v6 = [v4 initForReadingFromData:v5 error:0];

    id v7 = [objc_alloc((Class)CKRecord) initWithCoder:v6];
  }
  else
  {
    id v8 = objc_alloc((Class)CKRecord);
    id v6 = [(MBCKModel *)self recordType];
    id v9 = [(MBCKModel *)self recordID];
    id v7 = [v8 initWithRecordType:v6 recordID:v9];
  }
  return v7;
}

+ (double)timeoutIntervalForFetch
{
  return -1.0;
}

+ (double)timeoutIntervalForModify
{
  return -1.0;
}

- (void)handleSaveComplete:(id)a3 withError:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, id))a5;
  id v11 = MBGetDefaultLog();
  id v12 = v11;
  if (v9)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v20 = objc_opt_class();
      __int16 v21 = 2112;
      id v22 = v9;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Failed to save a record for %{public}@: %@", buf, 0x16u);
      objc_opt_class();
      _MBLog();
    }

    v10[2](v10, v9);
  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      uint64_t v13 = [v8 recordType];
      id v14 = [v8 recordID];
      id v15 = [v14 recordName];
      *(_DWORD *)buf = 138543618;
      uint64_t v20 = (uint64_t)v13;
      __int16 v21 = 2114;
      id v22 = v15;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%{public}@ record %{public}@ saved to server successfully", buf, 0x16u);

      id v16 = [v8 recordType];
      double v17 = [v8 recordID];
      id v18 = [v17 recordName];
      _MBLog();
    }
    [(MBCKModel *)self refreshWithRecord:v8];
    [(MBCKModel *)self saveToCacheWithCompletion:v10];
  }
}

- (void)refreshWithRecord:(id)a3
{
  id v8 = a3;
  if (v8)
  {
    id v4 = [objc_alloc((Class)NSKeyedArchiver) initRequiringSecureCoding:1];
    [v8 encodeSystemFieldsWithCoder:v4];
    unsigned __int8 v5 = [v8 creationDate];

    if (v5) {
      [(MBCKModel *)self setIsPersistedToServer:1];
    }
    if (v4)
    {
      id v6 = [v4 encodedData];

      if (v6)
      {
        id v7 = [v4 encodedData];
        [(MBCKModel *)self setSystemFieldData:v7];
      }
    }
  }
  else
  {
    id v4 = 0;
  }
}

- (id)mergeRecordsWithOperationTracker:(id)a3 serverRecord:(id)a4 originalRecord:(id)a5
{
  return 0;
}

- (id)_getRecordIDString
{
  return 0;
}

- (NSString)recordType
{
  return 0;
}

- (unint64_t)recordZone
{
  return 1;
}

- (int64_t)savePolicy
{
  return 0;
}

- (BOOL)saveToCacheWithError:(id *)a3
{
  unsigned __int8 v5 = [(MBCKModel *)self cache];

  if (v5)
  {
    uint64_t v13 = 0;
    id v14 = &v13;
    uint64_t v15 = 0x3032000000;
    id v16 = sub_100062364;
    double v17 = sub_100062374;
    id v18 = 0;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100063FA4;
    v10[3] = &unk_100410FC8;
    id v12 = &v13;
    id v6 = dispatch_semaphore_create(0);
    id v11 = v6;
    [(MBCKModel *)self saveToCacheWithCompletion:v10];
    MBSemaphoreWaitForever();
    id v7 = (void *)v14[5];
    BOOL v8 = v7 == 0;
    if (a3 && v7) {
      *a3 = v7;
    }

    _Block_object_dispose(&v13, 8);
  }
  else if (a3)
  {
    +[MBError errorWithCode:100 format:@"Attempting to save to cache without a cache"];
    BOOL v8 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    return 0;
  }
  return v8;
}

- (void)saveToCacheWithCompletion:(id)a3
{
}

- (BOOL)validateCache
{
  return 0;
}

+ (id)recordType
{
  return 0;
}

+ (id)privilegedQueryType
{
  return @"PrivilegedBatchRecordFetch";
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  unsigned __int8 v5 = [(MBCKModel *)self systemFieldData];
  [v6 encodeObject:v5 forKey:@"SystemFields"];
}

- (MBCKModel)initWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(MBCKModel *)self initWithRecord:0 cache:0];
  if (v6)
  {
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SystemFields"];
    systemFieldData = v6->_systemFieldData;
    v6->_systemFieldData = (NSData *)v7;
  }
  id v9 = v6;

  return v9;
}

- (MBCKCache)cache
{
  return self->_cache;
}

- (void)setCache:(id)a3
{
}

- (MBProgressModel)progressModel
{
  return self->_progressModel;
}

- (void)setProgressModel:(id)a3
{
}

- (BOOL)isPersistedToServer
{
  return self->_isPersistedToServer;
}

- (void)setIsPersistedToServer:(BOOL)a3
{
  self->_isPersistedToServer = a3;
}

- (void)setDebugContext:(id)a3
{
}

- (void)setRetryStrategy:(id)a3
{
}

- (NSData)systemFieldData
{
  return self->_systemFieldData;
}

- (void)setSystemFieldData:(id)a3
{
}

- (void)setRecordID:(id)a3
{
}

- (void)setRecordIDString:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordIDString, 0);
  objc_storeStrong((id *)&self->_recordID, 0);
  objc_storeStrong((id *)&self->_systemFieldData, 0);
  objc_storeStrong((id *)&self->_retryStrategy, 0);
  objc_storeStrong((id *)&self->_debugContext, 0);
  objc_storeStrong((id *)&self->_progressModel, 0);
  objc_storeStrong((id *)&self->_cache, 0);
}

@end