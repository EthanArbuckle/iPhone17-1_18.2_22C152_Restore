@interface FitnessWorkoutsCache
- (BOOL)_queue_workoutsExistForCacheKey:(int64_t)a3;
- (BOOL)existsWorkoutOnCacheIndex:(int64_t)a3;
- (CHWorkoutDataProvider)dataProvider;
- (FitnessWorkoutsCache)initWithDataProvider:(id)a3;
- (NSDictionary)numberOfWorkoutsForCacheKey;
- (void)_queue_refreshCacheWithCompletion:(id)a3;
- (void)_refreshCache;
- (void)setDataProvider:(id)a3;
- (void)setNumberOfWorkoutsForCacheKey:(id)a3;
@end

@implementation FitnessWorkoutsCache

- (FitnessWorkoutsCache)initWithDataProvider:(id)a3
{
  id v5 = a3;
  v21.receiver = self;
  v21.super_class = (Class)FitnessWorkoutsCache;
  v6 = [(FitnessWorkoutsCache *)&v21 init];
  if (v6)
  {
    uint64_t v7 = +[NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
    gregorianCalendar = v6->_gregorianCalendar;
    v6->_gregorianCalendar = (NSCalendar *)v7;

    uint64_t v9 = +[NSCalendar autoupdatingCurrentCalendar];
    currentCalendar = v6->_currentCalendar;
    v6->_currentCalendar = (NSCalendar *)v9;

    objc_storeStrong((id *)&v6->_dataProvider, a3);
    uint64_t v11 = HKCreateSerialDispatchQueue();
    cacheQueue = v6->_cacheQueue;
    v6->_cacheQueue = (OS_dispatch_queue *)v11;

    objc_initWeak(&location, v6);
    v15 = _NSConcreteStackBlock;
    uint64_t v16 = 3221225472;
    v17 = sub_100177E54;
    v18 = &unk_1008AB8D8;
    objc_copyWeak(&v19, &location);
    v13 = objc_retainBlock(&v15);
    -[CHWorkoutDataProvider addUpdateHandler:](v6->_dataProvider, "addUpdateHandler:", v13, v15, v16, v17, v18);
    [(CHWorkoutDataProvider *)v6->_dataProvider addAnimatedUpdateHandler:v13];
    if ([(CHWorkoutDataProvider *)v6->_dataProvider dataAvailable]) {
      [(FitnessWorkoutsCache *)v6 _refreshCache];
    }

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }

  return v6;
}

- (void)_refreshCache
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100177F00;
  v2[3] = &unk_1008ABA78;
  v2[4] = self;
  [(FitnessWorkoutsCache *)self _queue_refreshCacheWithCompletion:v2];
}

- (void)_queue_refreshCacheWithCompletion:(id)a3
{
  id v4 = a3;
  cacheQueue = self->_cacheQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100177FFC;
  v7[3] = &unk_1008AD938;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(cacheQueue, v7);
}

- (BOOL)_queue_workoutsExistForCacheKey:(int64_t)a3
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  cacheQueue = self->_cacheQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100178388;
  block[3] = &unk_1008ADA60;
  block[4] = self;
  block[5] = &v7;
  block[6] = a3;
  dispatch_sync(cacheQueue, block);
  char v4 = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (BOOL)existsWorkoutOnCacheIndex:(int64_t)a3
{
  return [(FitnessWorkoutsCache *)self _queue_workoutsExistForCacheKey:a3];
}

- (NSDictionary)numberOfWorkoutsForCacheKey
{
  return self->_numberOfWorkoutsForCacheKey;
}

- (void)setNumberOfWorkoutsForCacheKey:(id)a3
{
}

- (CHWorkoutDataProvider)dataProvider
{
  return self->_dataProvider;
}

- (void)setDataProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataProvider, 0);
  objc_storeStrong((id *)&self->_numberOfWorkoutsForCacheKey, 0);
  objc_storeStrong((id *)&self->_currentCalendar, 0);
  objc_storeStrong((id *)&self->_gregorianCalendar, 0);

  objc_storeStrong((id *)&self->_cacheQueue, 0);
}

@end