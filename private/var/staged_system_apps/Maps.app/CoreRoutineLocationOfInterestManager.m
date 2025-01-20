@interface CoreRoutineLocationOfInterestManager
+ (id)sharedManager;
- (BOOL)monitoringLOIsOfType:(int64_t)a3;
- (CoreRoutineLocationOfInterestManager)init;
- (NSArray)gymLOIs;
- (NSArray)homeLOIs;
- (NSArray)schoolLOIs;
- (NSArray)workLOIs;
- (NSMutableDictionary)loisByType;
- (NSMutableSet)invalidatedLOIsOfTypes;
- (NSMutableSet)retrievingLOIsOfTypes;
- (NSObject)notificationObserver;
- (OS_dispatch_group)initialRetrievalDispatchGroup;
- (OS_dispatch_queue)dispatchQueue;
- (id)locationsOfInterestWithType:(int64_t)a3;
- (id)monitoredLOITypes;
- (void)addNotificationObserverIfNeeded;
- (void)afterInitialRetrievalOfLOIsOfTypes:(id)a3 perform:(id)a4;
- (void)dealloc;
- (void)invalidateLOIs;
- (void)invalidateLOIsOfType:(int64_t)a3;
- (void)locationsOfInterestWithType:(int64_t)a3 completion:(id)a4;
- (void)monitorLOIsOfTypes:(id)a3;
- (void)monitorLOIsOfTypes:(id)a3 initialRetrievalComplete:(id)a4;
- (void)retrieveLOIsOfType:(int64_t)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setInitialRetrievalDispatchGroup:(id)a3;
- (void)setNotificationObserver:(id)a3;
@end

@implementation CoreRoutineLocationOfInterestManager

- (CoreRoutineLocationOfInterestManager)init
{
  v15.receiver = self;
  v15.super_class = (Class)CoreRoutineLocationOfInterestManager;
  v2 = [(CoreRoutineLocationOfInterestManager *)&v15 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    loisByType = v2->_loisByType;
    v2->_loisByType = v3;

    v5 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    retrievingLOIsOfTypes = v2->_retrievingLOIsOfTypes;
    v2->_retrievingLOIsOfTypes = v5;

    v7 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    invalidatedLOIsOfTypes = v2->_invalidatedLOIsOfTypes;
    v2->_invalidatedLOIsOfTypes = v7;

    v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v10 = dispatch_queue_create("CoreRoutineLocationOfInterestManager", v9);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v10;

    dispatch_group_t v12 = dispatch_group_create();
    initialRetrievalDispatchGroup = v2->_initialRetrievalDispatchGroup;
    v2->_initialRetrievalDispatchGroup = (OS_dispatch_group *)v12;
  }
  return v2;
}

- (void)retrieveLOIsOfType:(int64_t)a3
{
  v5 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:");
  v6 = [(CoreRoutineLocationOfInterestManager *)self retrievingLOIsOfTypes];
  unsigned __int8 v7 = [v6 containsObject:v5];

  if ((v7 & 1) == 0)
  {
    v8 = [(CoreRoutineLocationOfInterestManager *)self retrievingLOIsOfTypes];
    [v8 addObject:v5];

    v9 = [(CoreRoutineLocationOfInterestManager *)self invalidatedLOIsOfTypes];
    [v9 removeObject:v5];

    dispatch_queue_t v10 = [(CoreRoutineLocationOfInterestManager *)self loisByType];
    v11 = [v10 objectForKey:v5];

    if (!v11)
    {
      dispatch_group_t v12 = [(CoreRoutineLocationOfInterestManager *)self initialRetrievalDispatchGroup];
      dispatch_group_enter(v12);
    }
    v13 = +[RTRoutineManager defaultManager];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10009C5AC;
    v14[3] = &unk_1012F97F0;
    v14[4] = self;
    BOOL v17 = v11 == 0;
    id v15 = v5;
    int64_t v16 = a3;
    [v13 fetchLocationsOfInterestOfType:a3 withHandler:v14];
  }
}

- (NSMutableSet)retrievingLOIsOfTypes
{
  return self->_retrievingLOIsOfTypes;
}

- (OS_dispatch_group)initialRetrievalDispatchGroup
{
  return self->_initialRetrievalDispatchGroup;
}

- (NSMutableSet)invalidatedLOIsOfTypes
{
  return self->_invalidatedLOIsOfTypes;
}

- (id)locationsOfInterestWithType:(int64_t)a3
{
  v4 = [(CoreRoutineLocationOfInterestManager *)self loisByType];
  v5 = +[NSNumber numberWithInteger:a3];
  v6 = [v4 objectForKey:v5];

  return v6;
}

- (NSArray)workLOIs
{
  return (NSArray *)[(CoreRoutineLocationOfInterestManager *)self locationsOfInterestWithType:1];
}

- (NSArray)schoolLOIs
{
  return (NSArray *)[(CoreRoutineLocationOfInterestManager *)self locationsOfInterestWithType:2];
}

- (NSMutableDictionary)loisByType
{
  return self->_loisByType;
}

- (void)monitorLOIsOfTypes:(id)a3 initialRetrievalComplete:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(CoreRoutineLocationOfInterestManager *)self addNotificationObserverIfNeeded];
  uint64_t v16 = 0;
  BOOL v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 1;
  v8 = [(CoreRoutineLocationOfInterestManager *)self dispatchQueue];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10009C200;
  v11[3] = &unk_1012F97A0;
  id v9 = v6;
  id v12 = v9;
  v13 = self;
  dispatch_queue_t v10 = (void (**)(void))v7;
  id v14 = v10;
  id v15 = &v16;
  dispatch_sync(v8, v11);

  if (*((unsigned char *)v17 + 24)) {
    v10[2](v10);
  }

  _Block_object_dispose(&v16, 8);
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)monitorLOIsOfTypes:(id)a3
{
}

- (void)afterInitialRetrievalOfLOIsOfTypes:(id)a3 perform:(id)a4
{
}

- (void)addNotificationObserverIfNeeded
{
  if (!self->_notificationObserver)
  {
    objc_initWeak(&location, self);
    v3 = +[NSNotificationCenter defaultCenter];
    uint64_t v4 = RTLocationsOfInterestDidChangeNotification;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1007F2F44;
    v7[3] = &unk_1012E6730;
    objc_copyWeak(&v8, &location);
    v5 = [v3 addObserverForName:v4 object:0 queue:0 usingBlock:v7];
    notificationObserver = self->_notificationObserver;
    self->_notificationObserver = v5;

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

+ (id)sharedManager
{
  if (qword_10160FA40 != -1) {
    dispatch_once(&qword_10160FA40, &stru_1012F9758);
  }
  v2 = (void *)qword_10160FA38;

  return v2;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self->_notificationObserver];

  v4.receiver = self;
  v4.super_class = (Class)CoreRoutineLocationOfInterestManager;
  [(CoreRoutineLocationOfInterestManager *)&v4 dealloc];
}

- (NSArray)homeLOIs
{
  return (NSArray *)[(CoreRoutineLocationOfInterestManager *)self locationsOfInterestWithType:0];
}

- (NSArray)gymLOIs
{
  return (NSArray *)[(CoreRoutineLocationOfInterestManager *)self locationsOfInterestWithType:3];
}

- (void)locationsOfInterestWithType:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = +[NSNumber numberWithInteger:a3];
  id v14 = v7;
  id v8 = +[NSArray arrayWithObjects:&v14 count:1];
  id v9 = +[NSSet setWithArray:v8];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1007F2BE0;
  v11[3] = &unk_1012E7738;
  void v11[4] = self;
  id v12 = v6;
  int64_t v13 = a3;
  id v10 = v6;
  [(CoreRoutineLocationOfInterestManager *)self afterInitialRetrievalOfLOIsOfTypes:v9 perform:v11];
}

- (void)invalidateLOIs
{
  v3 = [(CoreRoutineLocationOfInterestManager *)self dispatchQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1007F2CD8;
  block[3] = &unk_1012E5D08;
  block[4] = self;
  dispatch_sync(v3, block);
}

- (void)invalidateLOIsOfType:(int64_t)a3
{
  v5 = [(CoreRoutineLocationOfInterestManager *)self dispatchQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1007F2EAC;
  v6[3] = &unk_1012E69C0;
  v6[4] = self;
  v6[5] = a3;
  dispatch_sync(v5, v6);
}

- (BOOL)monitoringLOIsOfType:(int64_t)a3
{
  v5 = [(CoreRoutineLocationOfInterestManager *)self loisByType];
  id v6 = +[NSNumber numberWithInteger:a3];
  id v7 = [v5 objectForKey:v6];
  if (v7)
  {
    unsigned __int8 v8 = 1;
  }
  else
  {
    id v9 = [(CoreRoutineLocationOfInterestManager *)self retrievingLOIsOfTypes];
    id v10 = +[NSNumber numberWithInteger:a3];
    unsigned __int8 v8 = [v9 containsObject:v10];
  }
  return v8;
}

- (id)monitoredLOITypes
{
  v3 = [(CoreRoutineLocationOfInterestManager *)self retrievingLOIsOfTypes];
  objc_super v4 = [(CoreRoutineLocationOfInterestManager *)self loisByType];
  v5 = [v4 allKeys];
  id v6 = [v3 setByAddingObjectsFromArray:v5];

  return v6;
}

- (void)setDispatchQueue:(id)a3
{
}

- (void)setInitialRetrievalDispatchGroup:(id)a3
{
}

- (NSObject)notificationObserver
{
  return self->_notificationObserver;
}

- (void)setNotificationObserver:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationObserver, 0);
  objc_storeStrong((id *)&self->_initialRetrievalDispatchGroup, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_invalidatedLOIsOfTypes, 0);
  objc_storeStrong((id *)&self->_retrievingLOIsOfTypes, 0);

  objc_storeStrong((id *)&self->_loisByType, 0);
}

@end