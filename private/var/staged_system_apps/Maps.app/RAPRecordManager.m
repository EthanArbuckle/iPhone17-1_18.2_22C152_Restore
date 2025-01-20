@interface RAPRecordManager
+ (id)_sharedInstance;
+ (void)addRAPRecord:(id)a3 completion:(id)a4;
+ (void)addTrafficIncidentReport:(id)a3 completion:(id)a4;
+ (void)editStatusOfRAPRecordWithReportID:(id)a3 status:(signed __int16)a4 completion:(id)a5;
+ (void)fetchAllRAPRecordsWithCompletion:(id)a3;
+ (void)fetchAllTrafficIncidentReportsWithCompletion:(id)a3;
+ (void)fetchRAPRecordsMatchingProblemId:(id)a3 completion:(id)a4;
- (RAPRecordManager)initWithSyncedCache:(id)a3;
- (void)_addRAPRecord:(id)a3 completion:(id)a4;
- (void)_addTrafficIncidentReport:(id)a3 completion:(id)a4;
- (void)_editStatusOfRAPRecordWithReportID:(id)a3 status:(signed __int16)a4 completion:(id)a5;
- (void)_fetchAllRAPRecordsWithCompletion:(id)a3;
- (void)_fetchAllTrafficIncidentReportsWithCompletion:(id)a3;
- (void)_fetchRAPRecordsMatchingProblemId:(id)a3 completion:(id)a4;
- (void)_fetchRAPRecordsMatchingProblemIdV2:(id)a3 completion:(id)a4;
@end

@implementation RAPRecordManager

+ (void)addRAPRecord:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [a1 _sharedInstance];
  [v8 _addRAPRecord:v7 completion:v6];
}

+ (void)fetchAllRAPRecordsWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [a1 _sharedInstance];
  [v5 _fetchAllRAPRecordsWithCompletion:v4];
}

+ (void)fetchRAPRecordsMatchingProblemId:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [a1 _sharedInstance];
  [v8 _fetchRAPRecordsMatchingProblemId:v7 completion:v6];
}

+ (void)editStatusOfRAPRecordWithReportID:(id)a3 status:(signed __int16)a4 completion:(id)a5
{
  uint64_t v5 = a4;
  id v8 = a5;
  id v9 = a3;
  id v10 = [a1 _sharedInstance];
  [v10 _editStatusOfRAPRecordWithReportID:v9 status:v5 completion:v8];
}

+ (void)addTrafficIncidentReport:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [a1 _sharedInstance];
  [v8 _addTrafficIncidentReport:v7 completion:v6];
}

+ (void)fetchAllTrafficIncidentReportsWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [a1 _sharedInstance];
  [v5 _fetchAllTrafficIncidentReportsWithCompletion:v4];
}

+ (id)_sharedInstance
{
  if (qword_10160FA70 != -1) {
    dispatch_once(&qword_10160FA70, &stru_1012F9A48);
  }
  v2 = (void *)qword_10160FA68;

  return v2;
}

- (RAPRecordManager)initWithSyncedCache:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)RAPRecordManager;
  id v6 = [(RAPRecordManager *)&v12 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_syncedCache, a3);
    id v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.Maps.RAPRecordManager.mapsSyncQueue", v8);
    mapsSyncQueue = v7->_mapsSyncQueue;
    v7->_mapsSyncQueue = (OS_dispatch_queue *)v9;
  }
  return v7;
}

- (void)_addRAPRecord:(id)a3 completion:(id)a4
{
  id v6 = a4;
  syncedCache = self->_syncedCache;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1007FB5AC;
  v9[3] = &unk_1012E76C0;
  id v10 = v6;
  id v8 = v6;
  [(RAPRecordMapsSync *)syncedCache addRAPRecord:a3 completion:v9];
}

- (void)_fetchAllRAPRecordsWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = sub_100103FE8;
  v16 = sub_100104880;
  id v17 = 0;
  id v5 = objc_alloc_init((Class)NSMutableArray);
  id v6 = (void *)v13[5];
  v13[5] = (uint64_t)v5;

  syncedCache = self->_syncedCache;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1007FB820;
  v9[3] = &unk_1012ED340;
  v11 = &v12;
  id v8 = v4;
  id v10 = v8;
  [(RAPRecordMapsSync *)syncedCache fetchAllRAPHistoryObjectsWithCompletion:v9];

  _Block_object_dispose(&v12, 8);
}

- (void)_fetchRAPRecordsMatchingProblemId:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x3032000000;
  v13[3] = sub_100103FE8;
  v13[4] = sub_100104880;
  id v14 = objc_alloc_init((Class)NSMutableArray);
  syncedCache = self->_syncedCache;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1007FBCE4;
  v10[3] = &unk_1012ED340;
  uint64_t v12 = v13;
  id v9 = v7;
  id v11 = v9;
  [(RAPRecordMapsSync *)syncedCache fetchRAPHistoryWithReportId:v6 completion:v10];

  _Block_object_dispose(v13, 8);
}

- (void)_fetchRAPRecordsMatchingProblemIdV2:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x3032000000;
  v15[3] = sub_100103FE8;
  v15[4] = sub_100104880;
  id v16 = objc_alloc_init((Class)NSMutableArray);
  mapsSyncQueue = self->_mapsSyncQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1007FC19C;
  block[3] = &unk_1012F9A70;
  id v13 = v7;
  id v14 = v15;
  id v12 = v6;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(mapsSyncQueue, block);

  _Block_object_dispose(v15, 8);
}

- (void)_editStatusOfRAPRecordWithReportID:(id)a3 status:(signed __int16)a4 completion:(id)a5
{
  uint64_t v5 = a4;
  id v8 = a5;
  syncedCache = self->_syncedCache;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1007FC6F0;
  v11[3] = &unk_1012E76C0;
  id v12 = v8;
  id v10 = v8;
  [(RAPRecordMapsSync *)syncedCache editStatusOfRAPRecordWithReportID:a3 toStatus:v5 completion:v11];
}

- (void)_addTrafficIncidentReport:(id)a3 completion:(id)a4
{
  id v6 = a4;
  syncedCache = self->_syncedCache;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1007FC860;
  v9[3] = &unk_1012E76C0;
  id v10 = v6;
  id v8 = v6;
  [(RAPRecordMapsSync *)syncedCache addTrafficIncidentReport:a3 completion:v9];
}

- (void)_fetchAllTrafficIncidentReportsWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = sub_100103FE8;
  id v16 = sub_100104880;
  id v17 = 0;
  id v5 = objc_alloc_init((Class)NSMutableArray);
  id v6 = (void *)v13[5];
  void v13[5] = (uint64_t)v5;

  syncedCache = self->_syncedCache;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1007FCAD4;
  v9[3] = &unk_1012ED340;
  id v11 = &v12;
  id v8 = v4;
  id v10 = v8;
  [(RAPRecordMapsSync *)syncedCache fetchAllTrafficIncidentReportsWithCompletion:v9];

  _Block_object_dispose(&v12, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapsSyncQueue, 0);

  objc_storeStrong((id *)&self->_syncedCache, 0);
}

@end