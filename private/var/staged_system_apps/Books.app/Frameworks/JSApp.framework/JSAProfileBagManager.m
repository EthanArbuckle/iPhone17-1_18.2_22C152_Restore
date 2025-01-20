@interface JSAProfileBagManager
+ (id)getInstance;
+ (id)sharedInstance;
+ (id)valuesFromOfflineCache;
- (BUBag)bag;
- (JSAProfileBagManager)init;
- (JSManagedValue)bagChangeHandler;
- (NSDictionary)values;
- (NSMutableDictionary)keyEntries;
- (NSString)lastBagStorefront;
- (OS_dispatch_queue)updateQueue;
- (id)cachedValueForKey:(id)a3;
- (void)_bagDidUpdate:(id)a3;
- (void)_saveOfflineCache:(id)a3;
- (void)addKeyEntries:(id)a3;
- (void)dealloc;
- (void)registerOnBagChange:(id)a3;
- (void)resetValuesCache;
- (void)setBag:(id)a3;
- (void)setBagChangeHandler:(id)a3;
- (void)setKeyEntries:(id)a3;
- (void)setLastBagStorefront:(id)a3;
- (void)setUpdateQueue:(id)a3;
- (void)unregisterOnBagChange;
- (void)updateValues;
@end

@implementation JSAProfileBagManager

+ (id)getInstance
{
  return +[JSAProfileBagManager sharedInstance];
}

- (JSAProfileBagManager)init
{
  v19.receiver = self;
  v19.super_class = (Class)JSAProfileBagManager;
  v2 = [(JSAProfileBagManager *)&v19 init];
  if (v2)
  {
    if (+[JSAOfflineCache generateCache])
    {
      v3 = +[NSNotificationCenter defaultCenter];
      [v3 addObserver:v2 selector:"_saveOfflineCache:" name:UIApplicationDidEnterBackgroundNotification object:0];
    }
    v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = dispatch_queue_attr_make_with_qos_class(v4, QOS_CLASS_BACKGROUND, 0);
    dispatch_queue_t v6 = dispatch_queue_create("JSAProfileBagManager.updateQueue", v5);
    updateQueue = v2->_updateQueue;
    v2->_updateQueue = (OS_dispatch_queue *)v6;

    v2->_lock._os_unfair_lock_opaque = 0;
    v8 = +[NSNotificationCenter defaultCenter];
    [v8 addObserver:v2 selector:"_bagDidUpdate:" name:AMSBagChangedNotification object:0];

    v9 = +[BUBag defaultBagKeysDictionary];
    v10 = (NSMutableDictionary *)[v9 mutableCopy];
    keyEntries = v2->_keyEntries;
    v2->_keyEntries = v10;

    uint64_t v12 = +[BUBag defaultBag];
    bag = v2->_bag;
    v2->_bag = (BUBag *)v12;

    v14 = v2->_updateQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1143C;
    block[3] = &unk_B2000;
    v15 = v2;
    v18 = v15;
    dispatch_async(v14, block);
    sub_114A8(v15);
  }
  return v2;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)JSAProfileBagManager;
  [(JSAProfileBagManager *)&v4 dealloc];
}

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_117BC;
  block[3] = &unk_B2510;
  void block[4] = a1;
  if (qword_CE350 != -1) {
    dispatch_once(&qword_CE350, block);
  }
  v2 = (void *)qword_CE358;

  return v2;
}

- (NSDictionary)values
{
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = sub_11920;
  v15 = sub_11930;
  id v16 = 0;
  p_lock = &self->_lock;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v7 = sub_11938;
  v8 = &unk_B2430;
  v9 = self;
  v10 = &v11;
  v3 = v6;
  os_unfair_lock_lock(p_lock);
  v7((uint64_t)v3);
  os_unfair_lock_unlock(p_lock);

  id v4 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return (NSDictionary *)v4;
}

- (void)updateValues
{
  v3 = JSALog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "JSAProfileBagManager: updateValues", v4, 2u);
  }

  sub_114A8((os_unfair_lock_s *)self);
}

- (void)resetValuesCache
{
  v3 = +[BUAccountsProvider sharedProvider];
  id v4 = [v3 currentStorefront];

  updateQueue = self->_updateQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_11A80;
  v7[3] = &unk_B2050;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_sync(updateQueue, v7);
}

- (id)cachedValueForKey:(id)a3
{
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = sub_11920;
  v18 = sub_11930;
  id v19 = 0;
  p_lock = &self->_lock;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v9 = sub_1206C;
  v10 = &unk_B2768;
  uint64_t v13 = &v14;
  uint64_t v11 = self;
  id v4 = a3;
  id v12 = v4;
  v5 = v8;
  os_unfair_lock_lock(p_lock);
  v9(v5);
  os_unfair_lock_unlock(p_lock);

  id v6 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v6;
}

- (void)addKeyEntries:(id)a3
{
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v9 = sub_1221C;
  v10 = &unk_B26D0;
  uint64_t v11 = self;
  id v4 = a3;
  id v12 = v4;
  uint64_t v13 = &v14;
  v5 = v8;
  os_unfair_lock_lock(&self->_lock);
  v9((uint64_t)v5);
  os_unfair_lock_unlock(&self->_lock);

  if (*((unsigned char *)v15 + 24))
  {
    id v6 = JSALog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "JSAProfileBagManager: scheduling to update values as new keys are registered", v7, 2u);
    }

    sub_114A8((os_unfair_lock_s *)self);
  }

  _Block_object_dispose(&v14, 8);
}

- (void)registerOnBagChange:(id)a3
{
  id v4 = a3;
  v5 = JSALog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136446210;
    v9 = "-[JSAProfileBagManager registerOnBagChange:]";
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v8, 0xCu);
  }

  id v6 = +[JSManagedValue managedValueWithValue:v4];

  bagChangeHandler = self->_bagChangeHandler;
  self->_bagChangeHandler = v6;
}

- (void)unregisterOnBagChange
{
  self->_bagChangeHandler = 0;
  _objc_release_x1();
}

- (void)_bagDidUpdate:(id)a3
{
  id v4 = JSALog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "JSAProfileBagManager: _bagDidUpdate", buf, 2u);
  }

  updateQueue = self->_updateQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_125F0;
  block[3] = &unk_B2000;
  void block[4] = self;
  dispatch_sync(updateQueue, block);
  sub_114A8((os_unfair_lock_s *)self);
}

+ (id)valuesFromOfflineCache
{
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  obj = +[JSAOfflineCache cacheFileCandidatesForBag];
  id v2 = [obj countByEnumeratingWithState:&v31 objects:v39 count:16];
  if (v2)
  {
    id v3 = v2;
    uint64_t v4 = *(void *)v32;
    v5 = &swift_arrayDestroy_ptr;
    while (2)
    {
      id v6 = 0;
      id v27 = v3;
      do
      {
        if (*(void *)v32 != v4) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void *)(*((void *)&v31 + 1) + 8 * (void)v6);
        int v8 = [v5[270] defaultManager];
        unsigned int v9 = [v8 fileExistsAtPath:v7];

        if (v9)
        {
          id v30 = 0;
          v10 = +[NSData dataWithContentsOfFile:v7 options:0 error:&v30];
          id v11 = v30;
          if (v10)
          {
            uint64_t v12 = v4;
            uint64_t v13 = objc_opt_class();
            uint64_t v14 = objc_opt_class();
            uint64_t v15 = objc_opt_class();
            uint64_t v16 = objc_opt_class();
            uint64_t v17 = objc_opt_class();
            v18 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v13, v14, v15, v16, v17, objc_opt_class(), 0);
            id v29 = v11;
            id v19 = v10;
            v20 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v18 fromData:v10 error:&v29];
            id v21 = v29;

            v22 = JSALog();
            v23 = v22;
            if (v20)
            {
              if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543362;
                uint64_t v36 = v7;
                _os_log_impl(&dword_0, v23, OS_LOG_TYPE_DEFAULT, "Using offline cache for bag from %{public}@", buf, 0xCu);
              }

              goto LABEL_25;
            }
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543618;
              uint64_t v36 = v7;
              __int16 v37 = 2114;
              id v38 = v21;
              _os_log_error_impl(&dword_0, v23, OS_LOG_TYPE_ERROR, "Could not unarchive bag cache at %{public}@ (error): %{public}@", buf, 0x16u);
            }

            v5 = &swift_arrayDestroy_ptr;
            id v3 = v27;
            v10 = v19;
            uint64_t v4 = v12;
          }
          else
          {
            v18 = JSALog();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              uint64_t v36 = v7;
              _os_log_error_impl(&dword_0, v18, OS_LOG_TYPE_ERROR, "Could not read bag cache file from disk: %{public}@", buf, 0xCu);
            }
            id v21 = v11;
          }
        }
        id v6 = (char *)v6 + 1;
      }
      while (v3 != v6);
      id v3 = [obj countByEnumeratingWithState:&v31 objects:v39 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }

  v25 = +[JSAOfflineCache cacheFileCandidatesForBag];
  BUReportAssertionFailureWithMessage();

  BUCrashBreakpoint();
  id result = (id)BUIsRunningTests();
  if (result)
  {
    v26 = +[JSAOfflineCache cacheFileCandidatesForBag];
    BUCrashFinalThrow();

    obj = JSALog();
    if (os_log_type_enabled(obj, OS_LOG_TYPE_FAULT)) {
      sub_84F6C(obj);
    }
    v20 = &off_B9A38;
LABEL_25:

    return v20;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (void)_saveOfflineCache:(id)a3
{
  uint64_t v4 = JSALog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Saving bag to offline cache", buf, 2u);
  }

  v5 = +[NSFileManager defaultManager];
  id v6 = +[JSAOfflineCache cachePath];
  [v5 createDirectoryAtPath:v6 withIntermediateDirectories:1 attributes:0 error:0];

  values = self->_values;
  id v16 = 0;
  int v8 = +[NSKeyedArchiver archivedDataWithRootObject:values requiringSecureCoding:1 error:&v16];
  id v9 = v16;
  v10 = +[JSAOfflineCache cacheFileCandidatesForBag];
  id v11 = [v10 objectAtIndexedSubscript:0];

  if (!v8 || !v11)
  {
    uint64_t v14 = JSALog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_85018();
    }
    id v13 = v9;
    goto LABEL_11;
  }
  id v15 = v9;
  unsigned __int8 v12 = [v8 writeToFile:v11 options:1 error:&v15];
  id v13 = v15;

  if ((v12 & 1) == 0)
  {
    uint64_t v14 = JSALog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_84FB0();
    }
LABEL_11:
  }
}

- (OS_dispatch_queue)updateQueue
{
  return self->_updateQueue;
}

- (void)setUpdateQueue:(id)a3
{
}

- (BUBag)bag
{
  return self->_bag;
}

- (void)setBag:(id)a3
{
}

- (JSManagedValue)bagChangeHandler
{
  return self->_bagChangeHandler;
}

- (void)setBagChangeHandler:(id)a3
{
}

- (NSMutableDictionary)keyEntries
{
  return self->_keyEntries;
}

- (void)setKeyEntries:(id)a3
{
}

- (NSString)lastBagStorefront
{
  return self->_lastBagStorefront;
}

- (void)setLastBagStorefront:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastBagStorefront, 0);
  objc_storeStrong((id *)&self->_keyEntries, 0);
  objc_storeStrong((id *)&self->_bagChangeHandler, 0);
  objc_storeStrong((id *)&self->_bag, 0);
  objc_storeStrong((id *)&self->_updateQueue, 0);

  objc_storeStrong((id *)&self->_values, 0);
}

@end