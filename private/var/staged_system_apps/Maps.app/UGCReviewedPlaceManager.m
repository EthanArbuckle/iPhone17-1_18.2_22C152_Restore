@interface UGCReviewedPlaceManager
+ (id)_sharedInstance;
+ (id)locallyCachedReviewedPlaceForMUID:(unint64_t)a3;
+ (void)addOrEditReviewedPlace:(id)a3 completion:(id)a4;
+ (void)clearAllUserData;
+ (void)fetchAllHistoryObjectsFromStorageWithCompletion:(id)a3;
+ (void)fetchAllHistoryObjectsWithPhotosFromStorageWithCompletion:(id)a3;
+ (void)fetchReviewedPlaceForMUID:(unint64_t)a3 withIdentifierHistory:(id)a4 completion:(id)a5;
+ (void)removeReviewedPlaceForMUID:(unint64_t)a3 completion:(id)a4;
+ (void)updateLocalCacheWithReviewedPlace:(id)a3 completion:(id)a4;
- (UGCReviewedPlaceManager)initWithSyncedCache:(id)a3 localCache:(id)a4;
- (id)_locallyCachedReviewedPlaceForMUID:(unint64_t)a3;
- (void)_addOrEditReviewedPlace:(id)a3 completion:(id)a4;
- (void)_clearAllUserData;
- (void)_fetchAllHistoryObjectsFromStorageWithCompletion:(id)a3;
- (void)_fetchAllHistoryObjectsWithPhotosFromStorageWithCompletion:(id)a3;
- (void)_fetchReviewedPlaceForMUID:(unint64_t)a3 withIdentifierHistory:(id)a4 completion:(id)a5;
- (void)_removeReviewedPlaceForMUID:(unint64_t)a3 completion:(id)a4;
- (void)_updateLocalCacheWithReviewedPlace:(id)a3 completion:(id)a4;
@end

@implementation UGCReviewedPlaceManager

+ (void)clearAllUserData
{
  id v2 = [a1 _sharedInstance];
  [v2 _clearAllUserData];
}

+ (void)addOrEditReviewedPlace:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [a1 _sharedInstance];
  [v8 _addOrEditReviewedPlace:v7 completion:v6];
}

+ (void)fetchReviewedPlaceForMUID:(unint64_t)a3 withIdentifierHistory:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = [a1 _sharedInstance];
  [v10 _fetchReviewedPlaceForMUID:a3 withIdentifierHistory:v9 completion:v8];
}

+ (id)locallyCachedReviewedPlaceForMUID:(unint64_t)a3
{
  v4 = [a1 _sharedInstance];
  v5 = [v4 _locallyCachedReviewedPlaceForMUID:a3];

  return v5;
}

+ (void)removeReviewedPlaceForMUID:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = [a1 _sharedInstance];
  [v7 _removeReviewedPlaceForMUID:a3 completion:v6];
}

+ (void)updateLocalCacheWithReviewedPlace:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [a1 _sharedInstance];
  [v8 _updateLocalCacheWithReviewedPlace:v7 completion:v6];
}

+ (void)fetchAllHistoryObjectsFromStorageWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [a1 _sharedInstance];
  [v5 _fetchAllHistoryObjectsFromStorageWithCompletion:v4];
}

+ (void)fetchAllHistoryObjectsWithPhotosFromStorageWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [a1 _sharedInstance];
  [v5 _fetchAllHistoryObjectsWithPhotosFromStorageWithCompletion:v4];
}

+ (id)_sharedInstance
{
  if (qword_10160EF20 != -1) {
    dispatch_once(&qword_10160EF20, &stru_1012ED210);
  }
  id v2 = (void *)qword_10160EF18;

  return v2;
}

- (UGCReviewedPlaceManager)initWithSyncedCache:(id)a3 localCache:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)UGCReviewedPlaceManager;
  id v9 = [(UGCReviewedPlaceManager *)&v12 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_syncedCache, a3);
    objc_storeStrong((id *)&v10->_localCache, a4);
  }

  return v10;
}

- (void)_clearAllUserData
{
  [(UGCReviewedPlaceMapsSync *)self->_syncedCache clearAllUserData];
  localCache = self->_localCache;

  [(UGCReviewedPlaceCache *)localCache clearAllUserData];
}

- (void)_addOrEditReviewedPlace:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  syncedCache = self->_syncedCache;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1004E9BAC;
  v11[3] = &unk_1012ED238;
  id v9 = v7;
  id v13 = v9;
  objc_copyWeak(&v14, &location);
  id v10 = v6;
  id v12 = v10;
  [(UGCReviewedPlaceMapsSync *)syncedCache addOrEditReviewedPlace:v10 completion:v11];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)_fetchReviewedPlaceForMUID:(unint64_t)a3 withIdentifierHistory:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = sub_100099700(v8, &stru_1012ED278);
  objc_initWeak(&location, self);
  syncedCache = self->_syncedCache;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1004E9F18;
  v13[3] = &unk_1012ED2F0;
  id v12 = v9;
  id v14 = v12;
  objc_copyWeak(&v15, &location);
  [(UGCReviewedPlaceMapsSync *)syncedCache fetchReviewedPlaceForMUID:a3 muidHistory:v10 completion:v13];
  objc_destroyWeak(&v15);

  objc_destroyWeak(&location);
}

- (id)_locallyCachedReviewedPlaceForMUID:(unint64_t)a3
{
  return [(UGCReviewedPlaceCache *)self->_localCache locallyCachedReviewedPlaceForMUID:a3];
}

- (void)_removeReviewedPlaceForMUID:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  objc_initWeak(&location, self);
  syncedCache = self->_syncedCache;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1004EA2BC;
  v9[3] = &unk_1012ED318;
  id v8 = v6;
  id v10 = v8;
  objc_copyWeak(v11, &location);
  v11[1] = (id)a3;
  [(UGCReviewedPlaceMapsSync *)syncedCache removeReviewedPlaceWithMUID:a3 completion:v9];
  objc_destroyWeak(v11);

  objc_destroyWeak(&location);
}

- (void)_updateLocalCacheWithReviewedPlace:(id)a3 completion:(id)a4
{
  id v6 = a4;
  localCache = self->_localCache;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1004EA55C;
  v9[3] = &unk_1012E76C0;
  id v10 = v6;
  id v8 = v6;
  [(UGCReviewedPlaceCache *)localCache addOrEditReviewedPlace:a3 completion:v9];
}

- (void)_fetchAllHistoryObjectsFromStorageWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = sub_100103C8C;
  v16 = sub_1001046D0;
  id v17 = 0;
  id v5 = objc_alloc_init((Class)NSMutableArray);
  id v6 = (void *)v13[5];
  v13[5] = (uint64_t)v5;

  syncedCache = self->_syncedCache;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1004EA74C;
  v9[3] = &unk_1012ED340;
  v11 = &v12;
  id v8 = v4;
  id v10 = v8;
  [(UGCReviewedPlaceMapsSync *)syncedCache fetchAllHistoryObjectsFromStorageWithCompletion:v9];

  _Block_object_dispose(&v12, 8);
}

- (void)_fetchAllHistoryObjectsWithPhotosFromStorageWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = sub_100103C8C;
  v16 = sub_1001046D0;
  id v17 = 0;
  id v5 = objc_alloc_init((Class)NSMutableArray);
  id v6 = (void *)v13[5];
  v13[5] = (uint64_t)v5;

  syncedCache = self->_syncedCache;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1004EAB74;
  v9[3] = &unk_1012ED340;
  v11 = &v12;
  id v8 = v4;
  id v10 = v8;
  [(UGCReviewedPlaceMapsSync *)syncedCache fetchAllHistoryObjectsFromStorageWithCompletion:v9];

  _Block_object_dispose(&v12, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncedCache, 0);

  objc_storeStrong((id *)&self->_localCache, 0);
}

@end