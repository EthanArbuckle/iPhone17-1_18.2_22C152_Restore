@interface UGCReviewedPlaceMapsSync
+ (UGCReviewedPlaceMapsSync)sharedInstance;
- (GEOObserverHashTable)observers;
- (NSArray)storeSubscriptionTypes;
- (UGCReviewedPlaceMapsSync)init;
- (id)_fetchMSReviewedPlaceWithMuids:(id)a3 error:(id)a4;
- (void)_buildMapsSyncReviewedPlace:(id)a3 communityID:(id)a4 completion:(id)a5;
- (void)_dispatchToWorkQueueWithCompletion:(id)a3;
- (void)_usingOfflineMapsDidChange:(id)a3;
- (void)addOrEditReviewedPlace:(id)a3 completion:(id)a4;
- (void)clearAllUserData;
- (void)fetchAllHistoryObjectsFromStorageWithCompletion:(id)a3;
- (void)fetchReviewedPlaceForMUID:(unint64_t)a3 completion:(id)a4;
- (void)fetchReviewedPlaceForMUID:(unint64_t)a3 muidHistory:(id)a4 completion:(id)a5;
- (void)registerObserver:(id)a3;
- (void)removeReviewedPlaceWithMUID:(unint64_t)a3 completion:(id)a4;
- (void)setObservers:(id)a3;
- (void)setStoreSubscriptionTypes:(id)a3;
- (void)storeDidChangeWithTypes:(id)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation UGCReviewedPlaceMapsSync

+ (UGCReviewedPlaceMapsSync)sharedInstance
{
  if (qword_10160FB60 != -1) {
    dispatch_once(&qword_10160FB60, &stru_1012FA080);
  }
  v2 = (void *)qword_10160FB58;

  return (UGCReviewedPlaceMapsSync *)v2;
}

- (UGCReviewedPlaceMapsSync)init
{
  v12.receiver = self;
  v12.super_class = (Class)UGCReviewedPlaceMapsSync;
  v2 = [(UGCReviewedPlaceMapsSync *)&v12 init];
  if (v2)
  {
    v3 = (GEOObserverHashTable *)[objc_alloc((Class)GEOObserverHashTable) initWithProtocol:&OBJC_PROTOCOL___UGCReviewedPlaceMapsSyncObserver queue:0];
    observers = v2->_observers;
    v2->_observers = v3;

    uint64_t v5 = +[CommunityIDMapsSync shared];
    communityIDMapsSync = v2->_communityIDMapsSync;
    v2->_communityIDMapsSync = (_TtC4Maps19CommunityIDMapsSync *)v5;

    v7 = +[MapsSyncStore sharedStore];
    [v7 subscribe:v2];

    uint64_t v13 = objc_opt_class();
    uint64_t v8 = +[NSArray arrayWithObjects:&v13 count:1];
    storeSubscriptionTypes = v2->storeSubscriptionTypes;
    v2->storeSubscriptionTypes = (NSArray *)v8;

    v10 = +[NSNotificationCenter defaultCenter];
    [v10 addObserver:v2 selector:"_usingOfflineMapsDidChange:" name:@"UsingOfflineMapsStateChangedNotification" object:0];
  }
  return v2;
}

- (void)_usingOfflineMapsDidChange:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100827EB4;
  block[3] = &unk_1012E5D08;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)registerObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(UGCReviewedPlaceMapsSync *)self observers];
  [v5 registerObserver:v4];
}

- (void)unregisterObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(UGCReviewedPlaceMapsSync *)self observers];
  [v5 unregisterObserver:v4];
}

- (void)fetchReviewedPlaceForMUID:(unint64_t)a3 completion:(id)a4
{
}

- (void)fetchReviewedPlaceForMUID:(unint64_t)a3 muidHistory:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v10 = v9;
  if (a3 && v9)
  {
    id v11 = objc_alloc_init((Class)NSMutableArray);
    objc_super v12 = +[NSNumber numberWithUnsignedLongLong:a3];
    [v11 addObject:v12];

    [v11 addObjectsFromArray:v8];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1008280F0;
    v14[3] = &unk_1012FA0A8;
    v14[4] = self;
    id v15 = v11;
    id v16 = v10;
    unint64_t v17 = a3;
    id v13 = v11;
    [(UGCReviewedPlaceMapsSync *)self _dispatchToWorkQueueWithCompletion:v14];
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Assertion failed: completion != ((void *)0) && muid != 0", buf, 2u);
  }
}

- (id)_fetchMSReviewedPlaceWithMuids:(id)a3 error:(id)a4
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)_TtC8MapsSync13MapsSyncRange) initWithOffset:0 limit:1];
  id v15 = v4;
  v6 = +[NSArray arrayWithObjects:&v15 count:1];
  v7 = +[MapsSyncQueryPredicate queryPredicateWithFormat:@"muid IN %@" argumentArray:v6];

  id v8 = [objc_alloc((Class)_TtC8MapsSync20MapsSyncQueryOptions) initWithPredicate:v7 sortDescriptors:0 range:v5];
  id v9 = objc_alloc_init((Class)MSReviewedPlaceRequest);
  id v14 = 0;
  v10 = [v9 fetchSyncWithOptions:v8 error:&v14];
  id v11 = v14;
  objc_super v12 = [v10 firstObject];

  if (v11) {
    NSLog(@"%@", v11);
  }

  return v12;
}

- (void)fetchAllHistoryObjectsFromStorageWithCompletion:(id)a3
{
  id v3 = a3;
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x3032000000;
  v9[3] = sub_100104034;
  v9[4] = sub_100104898;
  id v10 = objc_alloc_init((Class)NSMutableArray);
  id v4 = objc_alloc_init((Class)MSReviewedPlaceRequest);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1008288AC;
  v6[3] = &unk_1012F2908;
  id v8 = v9;
  id v5 = v3;
  id v7 = v5;
  [v4 fetchWithCompletionHandler:v6];

  _Block_object_dispose(v9, 8);
}

- (void)removeReviewedPlaceWithMUID:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = v6;
  if (a3 && v6)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100828A3C;
    v8[3] = &unk_1012EB5B8;
    v8[4] = self;
    unint64_t v10 = a3;
    id v9 = v6;
    [(UGCReviewedPlaceMapsSync *)self _dispatchToWorkQueueWithCompletion:v8];
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Assertion failed: completion != ((void *)0) && muid != 0", buf, 2u);
  }
}

- (void)addOrEditReviewedPlace:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [v6 communityIdentifier];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100828EDC;
  v11[3] = &unk_1012ED778;
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  id v13 = self;
  id v14 = v6;
  id v15 = v7;
  id v8 = v7;
  id v9 = v6;
  id v10 = v12;
  [(UGCReviewedPlaceMapsSync *)self _dispatchToWorkQueueWithCompletion:v11];
}

- (void)_buildMapsSyncReviewedPlace:(id)a3 communityID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = objc_alloc_init((Class)NSMutableArray);
  id v12 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v8 muid]);
  v32 = v12;
  id v13 = +[NSArray arrayWithObjects:&v32 count:1];
  id v14 = [(UGCReviewedPlaceMapsSync *)self _fetchMSReviewedPlaceWithMuids:v13 error:0];

  id v15 = sub_100577844();
  BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_INFO);
  if (v14)
  {
    if (v16)
    {
      *(_DWORD *)buf = 138412546;
      id v29 = v8;
      __int16 v30 = 2048;
      id v31 = [v8 muid];
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "We found a synced reviewed place %@ with muid %llu", buf, 0x16u);
    }
  }
  else
  {
    if (v16)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "We cannot find a synced reviewed place, so adding one", buf, 2u);
    }

    id v14 = objc_alloc_init((Class)MSReviewedPlace);
    id v15 = objc_alloc_init((Class)MSAnonymousCredential);
    [v14 setAnonymousCredential:v15];
    [v11 addObject:v15];
  }

  [v14 setMuid:[v8 muid]];
  [v14 setHasUserReviewed:1];
  unint64_t v17 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v8 recommendState]);
  [v14 setRating:v17];

  [v14 setUploadedPhotosCount:[v8 numberOfPhotosAdded]];
  [v14 setVersion:([v8 version])];
  id v18 = objc_msgSend(objc_alloc((Class)GEOMapItemIdentifier), "initWithMUID:resultProviderID:coordinate:", objc_msgSend(v8, "muid"), 0, -180.0, -180.0);
  [v14 setMuid:[v18 muid]];
  v19 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v18 resultProviderID]);
  [v14 setResultProviderIdentifier:v19];

  [v18 coordinate];
  v20 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [v14 setLatitude:v20];

  [v18 coordinate];
  v22 = +[NSNumber numberWithDouble:v21];
  [v14 setLongitude:v22];

  v23 = [v18 comparableRepresentation];
  [v14 setMapItemIdComparableRepresentation:v23];

  [v14 setCommunityID:v9];
  if (v14) {
    [v11 addObject:v14];
  }
  if (v9) {
    [v11 addObject:v9];
  }
  v24 = +[MapsSyncStore sharedStore];
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_10082955C;
  v26[3] = &unk_1012E76C0;
  id v27 = v10;
  id v25 = v10;
  [v24 saveWithObjects:v11 completionHandler:v26];
}

- (void)_dispatchToWorkQueueWithCompletion:(id)a3
{
  id v3 = a3;
  if (qword_10160FB70 != -1) {
    dispatch_once(&qword_10160FB70, &stru_1012FA0F0);
  }
  id v4 = qword_10160FB68;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1008297A8;
  block[3] = &unk_1012E6EA8;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, block);
}

- (void)clearAllUserData
{
  v2 = +[NSDate date];
  id v11 = v2;
  id v3 = +[NSArray arrayWithObjects:&v11 count:1];
  id v4 = +[MapsSyncQueryPredicate queryPredicateWithFormat:@"createTime < %@" argumentArray:v3];

  id v5 = objc_alloc((Class)_TtC8MapsSync20MapsSyncQueryOptions);
  id v6 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"modificationTime" ascending:0];
  id v10 = v6;
  id v7 = +[NSArray arrayWithObjects:&v10 count:1];
  id v8 = [v5 initWithPredicate:v4 sortDescriptors:v7 range:0];

  id v9 = objc_alloc_init((Class)MSReviewedPlaceRequest);
  [v9 fetchWithOptions:v8 completionHandler:&stru_1012FA110];
}

- (void)storeDidChangeWithTypes:(id)a3
{
}

- (NSArray)storeSubscriptionTypes
{
  return self->storeSubscriptionTypes;
}

- (void)setStoreSubscriptionTypes:(id)a3
{
}

- (GEOObserverHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->storeSubscriptionTypes, 0);

  objc_storeStrong((id *)&self->_communityIDMapsSync, 0);
}

@end