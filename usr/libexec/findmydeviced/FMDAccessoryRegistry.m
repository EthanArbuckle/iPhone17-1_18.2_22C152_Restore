@interface FMDAccessoryRegistry
+ (id)defaultStorageLocation;
- (BOOL)addAccessoryIfSupported:(id)a3 previouslyPaired:(BOOL)a4;
- (BOOL)respondsToSelector:(SEL)a3;
- (BOOL)supportsAccessory:(id)a3;
- (FMDAccessoryRegistry)initWithSupportDelete:(id)a3;
- (FMDAccessoryRegistrySupportDelegate)supportDelegate;
- (FMDataArchiver)dataArchiver;
- (FMDispatchTimer)dataSourceRetryTimer;
- (NSDictionary)accessoriesByIdentifier;
- (NSMutableArray)dataSources;
- (NSMutableSet)connectedAccessoryIdentifiers;
- (NSPointerArray)delegates;
- (OS_dispatch_queue)accessoryQueue;
- (OS_dispatch_queue)delegateQueue;
- (id)accessoryForIdentifier:(id)a3;
- (id)allAccessories;
- (id)methodSignatureForSelector:(SEL)a3;
- (id)registeredDelegates;
- (unint64_t)dataSourceErrorBackoffCount;
- (void)_addAccessory:(id)a3 previouslyPaired:(BOOL)a4;
- (void)_forceUpdateAccessory:(id)a3;
- (void)_removeAccessory:(id)a3;
- (void)_updateAccessory:(id)a3 previouslyPaired:(BOOL)a4;
- (void)accessories:(id)a3;
- (void)addDataSource:(id)a3;
- (void)addDataSources:(id)a3;
- (void)availabilitydidChangeFor:(id)a3 status:(id)a4 withCompletion:(id)a5;
- (void)clearAccessoryRegistry;
- (void)computeAccessoryRegistry;
- (void)dealloc;
- (void)forceUpdateAccessory:(id)a3;
- (void)forwardInvocation:(id)a3;
- (void)postConnectionStatusChangeNotification;
- (void)readAccessoriesFromDisk;
- (void)refetchBauuids:(id)a3;
- (void)registerDelegate:(id)a3;
- (void)reloadData;
- (void)removeAccessory:(id)a3;
- (void)saveAccessoriesToDisk;
- (void)setAccessoriesByIdentifier:(id)a3;
- (void)setAccessoryQueue:(id)a3;
- (void)setConnectedAccessoryIdentifiers:(id)a3;
- (void)setDataArchiver:(id)a3;
- (void)setDataSourceErrorBackoffCount:(unint64_t)a3;
- (void)setDataSourceRetryTimer:(id)a3;
- (void)setDataSources:(id)a3;
- (void)setDelegateQueue:(id)a3;
- (void)setDelegates:(id)a3;
- (void)setSupportDelegate:(id)a3;
- (void)updateAccessory:(id)a3;
- (void)updateAccessory:(id)a3 assets:(id)a4;
- (void)updateAccessory:(id)a3 playbackChannels:(id)a4;
- (void)updateAccessory:(id)a3 playbackChannels:(id)a4 completion:(id)a5;
@end

@implementation FMDAccessoryRegistry

+ (id)defaultStorageLocation
{
  id v2 = objc_alloc_init((Class)FMInternalFileContainer);
  v3 = [v2 url];
  v4 = [v3 fm_preferencesPathURLForDomain:@"com.apple.icloud.findmydeviced.accessories"];

  return v4;
}

- (FMDAccessoryRegistry)initWithSupportDelete:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)FMDAccessoryRegistry;
  v5 = [(FMDAccessoryRegistry *)&v21 init];
  v6 = v5;
  if (v5)
  {
    [(FMDAccessoryRegistry *)v5 setDataSourceErrorBackoffCount:0];
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.icloud.findmydeviced.accessoryqueue", 0);
    [(FMDAccessoryRegistry *)v6 setAccessoryQueue:v7];

    v8 = objc_opt_new();
    [(FMDAccessoryRegistry *)v6 setAccessoriesByIdentifier:v8];

    v9 = +[NSPointerArray weakObjectsPointerArray];
    [(FMDAccessoryRegistry *)v6 setDelegates:v9];

    v10 = +[NSMutableArray array];
    [(FMDAccessoryRegistry *)v6 setDataSources:v10];

    v11 = +[NSMutableSet set];
    [(FMDAccessoryRegistry *)v6 setConnectedAccessoryIdentifiers:v11];

    dispatch_queue_t v12 = dispatch_queue_create("com.apple.icloud.findmydeviced.delegate", 0);
    [(FMDAccessoryRegistry *)v6 setDelegateQueue:v12];

    id v13 = objc_alloc((Class)FMDataArchiver);
    v14 = [(id)objc_opt_class() defaultStorageLocation];
    id v15 = [v13 initWithFileURL:v14];
    [(FMDAccessoryRegistry *)v6 setDataArchiver:v15];

    v16 = [(FMDAccessoryRegistry *)v6 dataArchiver];
    [v16 setDataProtectionClass:4];

    v17 = [(FMDAccessoryRegistry *)v6 dataArchiver];
    [v17 setBackedUp:0];

    v18 = [(FMDAccessoryRegistry *)v6 dataArchiver];
    [v18 setCreateDirectories:1];

    [(FMDAccessoryRegistry *)v6 setSupportDelegate:v4];
    [(FMDAccessoryRegistry *)v6 readAccessoriesFromDisk];
    v19 = sub_100004238();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
      sub_10023FC58(v19);
    }
  }
  return v6;
}

- (void)dealloc
{
  v3 = [(FMDAccessoryRegistry *)self dataSourceRetryTimer];
  [v3 cancel];

  [(FMDAccessoryRegistry *)self setDataSourceRetryTimer:0];
  v4.receiver = self;
  v4.super_class = (Class)FMDAccessoryRegistry;
  [(FMDAccessoryRegistry *)&v4 dealloc];
}

- (void)registerDelegate:(id)a3
{
  id v4 = a3;
  v5 = [(FMDAccessoryRegistry *)self delegateQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100067B70;
  v7[3] = &unk_1002D93F0;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)clearAccessoryRegistry
{
  v3 = [(FMDAccessoryRegistry *)self accessoryQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100067C60;
  block[3] = &unk_1002D9378;
  block[4] = self;
  dispatch_sync(v3, block);
}

- (void)updateAccessory:(id)a3 assets:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = [(FMDAccessoryRegistry *)self accessoryQueue];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100067E54;
  v11[3] = &unk_1002DA298;
  objc_copyWeak(&v14, &location);
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)updateAccessory:(id)a3 playbackChannels:(id)a4
{
}

- (void)updateAccessory:(id)a3 playbackChannels:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  v11 = [(FMDAccessoryRegistry *)self accessoryQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100068234;
  block[3] = &unk_1002DBB70;
  objc_copyWeak(&v19, &location);
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, block);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

- (void)addDataSources:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5 = [(FMDAccessoryRegistry *)self accessoryQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006851C;
  block[3] = &unk_1002D9238;
  objc_copyWeak(&v9, &location);
  id v6 = v4;
  id v8 = v6;
  dispatch_async(v5, block);

  [(FMDAccessoryRegistry *)self reloadData];
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)addDataSource:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5 = [(FMDAccessoryRegistry *)self accessoryQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100068688;
  block[3] = &unk_1002D9238;
  objc_copyWeak(&v9, &location);
  id v6 = v4;
  id v8 = v6;
  dispatch_async(v5, block);

  [(FMDAccessoryRegistry *)self reloadData];
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)reloadData
{
  objc_initWeak(&location, self);
  v3 = [(FMDAccessoryRegistry *)self accessoryQueue];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000687B4;
  v4[3] = &unk_1002D93C8;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (BOOL)respondsToSelector:(SEL)a3
{
  v15.receiver = self;
  v15.super_class = (Class)FMDAccessoryRegistry;
  if (-[FMDAccessoryRegistry respondsToSelector:](&v15, "respondsToSelector:"))
  {
    LOBYTE(v4) = 1;
  }
  else
  {
    id v5 = [(FMDAccessoryRegistry *)self registeredDelegates];
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v6 = (char *)[v5 countByEnumeratingWithState:&v11 objects:v16 count:16];
    if (v6)
    {
      id v7 = v6;
      int v4 = 0;
      uint64_t v8 = *(void *)v12;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v5);
          }
          v4 |= objc_opt_respondsToSelector();
        }
        id v7 = (char *)[v5 countByEnumeratingWithState:&v11 objects:v16 count:16];
      }
      while (v7);
    }
    else
    {
      LOBYTE(v4) = 0;
    }
  }
  return v4 & 1;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  v18.receiver = self;
  v18.super_class = (Class)FMDAccessoryRegistry;
  id v5 = -[FMDAccessoryRegistry methodSignatureForSelector:](&v18, "methodSignatureForSelector:");
  if (!v5)
  {
    id v6 = [(FMDAccessoryRegistry *)self registeredDelegates];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v7 = [v6 countByEnumeratingWithState:&v14 objects:v19 count:16];
    if (v7)
    {
      id v8 = v7;
      id v5 = 0;
      uint64_t v9 = *(void *)v15;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          long long v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          if (objc_opt_respondsToSelector())
          {
            uint64_t v12 = [v11 methodSignatureForSelector:a3];

            id v5 = (void *)v12;
          }
        }
        id v8 = [v6 countByEnumeratingWithState:&v14 objects:v19 count:16];
      }
      while (v8);
    }
    else
    {
      id v5 = 0;
    }
  }

  return v5;
}

- (void)forwardInvocation:(id)a3
{
  id v4 = a3;
  id v5 = [(FMDAccessoryRegistry *)self registeredDelegates];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v20 count:16];
  if (v6)
  {
    id v8 = v6;
    uint64_t v9 = *(void *)v15;
    *(void *)&long long v7 = 138412290;
    long long v13 = v7;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * (void)v10);
        [v4 selector:v13];
        if (objc_opt_respondsToSelector())
        {
          uint64_t v12 = sub_100004238();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v13;
            uint64_t v19 = v11;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "FMDAccessoryRegistry forwardInvocation to delegate %@", buf, 0xCu);
          }

          [v4 invokeWithTarget:v11];
        }
        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v5 countByEnumeratingWithState:&v14 objects:v20 count:16];
    }
    while (v8);
  }
}

- (id)registeredDelegates
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = sub_100068D58;
  uint64_t v11 = sub_100068D68;
  id v12 = &__NSArray0__struct;
  v3 = [(FMDAccessoryRegistry *)self delegateQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100068D70;
  v6[3] = &unk_1002D9210;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (void)accessories:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = [(FMDAccessoryRegistry *)self accessoryQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100068ED8;
  block[3] = &unk_1002D9DD0;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)computeAccessoryRegistry
{
  v3 = [(FMDAccessoryRegistry *)self accessoryQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = +[FMDSystemConfig sharedInstance];
  id v5 = [v4 unlockState];

  id v6 = sub_100004238();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5 == (id)1)
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "FMDAccessoryRegistry skipping computeAccessoryRegistry before first unlock", buf, 2u);
    }
  }
  else
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "FMDAccessoryRegistry computeAccessoryRegistry", buf, 2u);
    }

    id v8 = [(FMDAccessoryRegistry *)self dataSourceRetryTimer];
    [v8 cancel];

    id v9 = +[NSMutableArray array];
    id v10 = +[NSMutableArray array];
    id v11 = [objc_alloc((Class)FMSynchronizer) initWithDescription:@"FMDAccessoryRegistryAllAccessories" andTimeout:5.0];
    *(void *)buf = 0;
    v44[0] = buf;
    v44[1] = 0x3032000000;
    v44[2] = sub_100068D58;
    v44[3] = sub_100068D68;
    id v45 = 0;
    uint64_t v39 = 0;
    v40 = &v39;
    uint64_t v41 = 0x2020000000;
    id v42 = 0;
    id v12 = [(FMDAccessoryRegistry *)self dataSources];
    id v13 = [v12 count];

    id v42 = v13;
    long long v14 = [(FMDAccessoryRegistry *)self dataSources];
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_100069494;
    v32[3] = &unk_1002DBBE8;
    id v6 = v9;
    v33 = v6;
    v34 = self;
    id v15 = v10;
    id v35 = v15;
    v37 = &v39;
    id v16 = v11;
    id v36 = v16;
    v38 = buf;
    [v14 enumerateObjectsUsingBlock:v32];

    [v16 wait];
    if ([v16 timeoutOccurred] && v40[3] || *(void *)(v44[0] + 40))
    {
      double v17 = pow(5.0, (double)[(FMDAccessoryRegistry *)self dataSourceErrorBackoffCount]);
      [(FMDAccessoryRegistry *)self setDataSourceErrorBackoffCount:(char *)[(FMDAccessoryRegistry *)self dataSourceErrorBackoffCount] + 1];
      objc_super v18 = sub_100004238();
      double v19 = v17 + 5.0;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_10023FDB4((uint64_t)v44, v18, v19);
      }

      objc_initWeak(&location, self);
      id v20 = objc_alloc((Class)FMDispatchTimer);
      objc_super v21 = [(FMDAccessoryRegistry *)self accessoryQueue];
      v29[0] = _NSConcreteStackBlock;
      v29[1] = 3221225472;
      v29[2] = sub_1000696E4;
      v29[3] = &unk_1002D93C8;
      objc_copyWeak(&v30, &location);
      id v22 = [v20 initWithQueue:v21 timeout:v29 completion:v19];

      [(FMDAccessoryRegistry *)self setDataSourceRetryTimer:v22];
      [v22 start];

      objc_destroyWeak(&v30);
      objc_destroyWeak(&location);
    }
    else
    {
      [(FMDAccessoryRegistry *)self setDataSourceErrorBackoffCount:0];
      v23 = [(FMDAccessoryRegistry *)self accessoriesByIdentifier];
      id v24 = [v23 copy];

      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_100069780;
      v26[3] = &unk_1002DBC10;
      id v27 = v15;
      v28 = self;
      [v24 enumerateKeysAndObjectsUsingBlock:v26];
    }
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_1000697F4;
    v25[3] = &unk_1002DBC38;
    v25[4] = self;
    [v6 enumerateObjectsUsingBlock:v25];

    _Block_object_dispose(&v39, 8);
    _Block_object_dispose(buf, 8);
  }
}

- (id)allAccessories
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = sub_100068D58;
  id v11 = sub_100068D68;
  id v12 = &__NSArray0__struct;
  v3 = [(FMDAccessoryRegistry *)self accessoryQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100069928;
  v6[3] = &unk_1002D9210;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (BOOL)supportsAccessory:(id)a3
{
  id v4 = a3;
  id v5 = [v4 accessoryIdentifier];
  unsigned int v6 = [v5 isValid];

  if (v6)
  {
    uint64_t v7 = [(FMDAccessoryRegistry *)self supportDelegate];
    if (objc_opt_respondsToSelector()) {
      unsigned __int8 v8 = [v7 supportsAccessory:v4];
    }
    else {
      unsigned __int8 v8 = 0;
    }
  }
  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (id)accessoryForIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v10 = 0;
    id v11 = &v10;
    uint64_t v12 = 0x3032000000;
    id v13 = sub_100068D58;
    long long v14 = sub_100068D68;
    id v15 = &__NSDictionary0__struct;
    id v5 = [(FMDAccessoryRegistry *)self accessoryQueue];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100069B98;
    v9[3] = &unk_1002D9210;
    v9[4] = self;
    v9[5] = &v10;
    dispatch_sync(v5, v9);

    unsigned int v6 = [(id)v11[5] objectForKeyedSubscript:v4];
    _Block_object_dispose(&v10, 8);
  }
  else
  {
    uint64_t v7 = sub_100004238();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10023FE40(v7);
    }

    unsigned int v6 = 0;
  }

  return v6;
}

- (BOOL)addAccessoryIfSupported:(id)a3 previouslyPaired:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  BOOL v7 = [(FMDAccessoryRegistry *)self supportsAccessory:v6];
  unsigned __int8 v8 = sub_100004238();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v9)
    {
      int v11 = 138412290;
      id v12 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "FMDAccessoryRegistry accessory supported %@", (uint8_t *)&v11, 0xCu);
    }

    [(FMDAccessoryRegistry *)self _addAccessory:v6 previouslyPaired:v4];
  }
  else
  {
    if (v9)
    {
      int v11 = 138412290;
      id v12 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "FMDAccessoryRegistry accessory not supported %@", (uint8_t *)&v11, 0xCu);
    }
  }
  return v7;
}

- (void)_addAccessory:(id)a3 previouslyPaired:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  BOOL v7 = [(FMDAccessoryRegistry *)self accessoryQueue];
  dispatch_assert_queue_V2(v7);

  unsigned __int8 v8 = [(FMDAccessoryRegistry *)self accessoriesByIdentifier];
  id v9 = [v8 mutableCopy];

  uint64_t v10 = [v6 accessoryIdentifier];
  int v11 = [v9 objectForKeyedSubscript:v10];

  id v12 = sub_100004238();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v19 = v6;
    __int16 v20 = 1024;
    BOOL v21 = v11 == 0;
    __int16 v22 = 1024;
    BOOL v23 = v4;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "FMDAccessoryRegistry addAccessory %@ New? %i %i", buf, 0x18u);
  }

  id v13 = [v6 accessoryIdentifier];
  [v9 setObject:v6 forKeyedSubscript:v13];

  [(FMDAccessoryRegistry *)self setAccessoriesByIdentifier:v9];
  [(FMDAccessoryRegistry *)self saveAccessoriesToDisk];
  if (!v11 && !v4)
  {
    objc_initWeak((id *)buf, self);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100069F24;
    block[3] = &unk_1002DA298;
    objc_copyWeak(&v17, (id *)buf);
    id v15 = v6;
    id v16 = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

    objc_destroyWeak(&v17);
    objc_destroyWeak((id *)buf);
  }
}

- (void)_removeAccessory:(id)a3
{
  id v4 = a3;
  id v5 = [(FMDAccessoryRegistry *)self accessoryQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [v4 accessoryIdentifier];
  if (v6)
  {
    BOOL v7 = sub_100004238();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "FMDAccessoryRegistry removing accessory %@", buf, 0xCu);
    }

    unsigned __int8 v8 = [(FMDAccessoryRegistry *)self accessoriesByIdentifier];
    id v9 = [v8 mutableCopy];

    [v9 removeObjectForKey:v6];
    [(FMDAccessoryRegistry *)self setAccessoriesByIdentifier:v9];
    [(FMDAccessoryRegistry *)self saveAccessoriesToDisk];
    objc_initWeak((id *)buf, self);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10006A13C;
    block[3] = &unk_1002DA298;
    objc_copyWeak(&v13, (id *)buf);
    id v11 = v4;
    id v12 = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

    objc_destroyWeak(&v13);
    objc_destroyWeak((id *)buf);
  }
}

- (void)_updateAccessory:(id)a3 previouslyPaired:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  BOOL v7 = [(FMDAccessoryRegistry *)self accessoryQueue];
  dispatch_assert_queue_V2(v7);

  unsigned __int8 v8 = [v6 accessoryIdentifier];
  id v9 = v8;
  if (v8 && ([v8 isValid] & 1) != 0)
  {
    uint64_t v10 = [(FMDAccessoryRegistry *)self accessoriesByIdentifier];
    id v11 = [v10 objectForKeyedSubscript:v9];

    [v6 updateWithAccessory:v11];
    if (v11) {
      char v12 = [v6 isEqual:v11] ^ 1;
    }
    else {
      char v12 = 0;
    }
    if ([(FMDAccessoryRegistry *)self addAccessoryIfSupported:v6 previouslyPaired:v4])
    {
      id v13 = sub_100004238();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v30 = v9;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "FMDAccessoryRegistry updateAccessory %@", buf, 0xCu);
      }

      long long v14 = [(FMDAccessoryRegistry *)self connectedAccessoryIdentifiers];
      if ([v14 containsObject:v9]) {
        BOOL v15 = [v6 connectionState] != (id)1;
      }
      else {
        BOOL v15 = 0;
      }

      id v16 = [(FMDAccessoryRegistry *)self connectedAccessoryIdentifiers];
      BOOL v17 = ([v16 containsObject:v9] & 1) == 0
         && [v6 connectionState] == (id)1;

      id v18 = [v6 connectionState];
      id v19 = [(FMDAccessoryRegistry *)self connectedAccessoryIdentifiers];
      __int16 v20 = v19;
      if (v18 == (id)1) {
        [v19 addObject:v9];
      }
      else {
        [v19 removeObject:v9];
      }

      objc_initWeak((id *)buf, self);
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_10006A478;
      v22[3] = &unk_1002DBC60;
      objc_copyWeak(&v25, (id *)buf);
      char v26 = v12;
      id v21 = v6;
      BOOL v27 = v15;
      BOOL v28 = v17;
      id v23 = v21;
      id v24 = self;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v22);

      objc_destroyWeak(&v25);
      objc_destroyWeak((id *)buf);
    }
  }
  else
  {
    id v11 = sub_100004238();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10023FE84();
    }
  }
}

- (void)postConnectionStatusChangeNotification
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();

  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.icloud.FindMy.accesoriesConnectionStateChanged", 0, 0, 1u);
}

- (void)forceUpdateAccessory:(id)a3
{
  id v4 = a3;
  id v5 = [(FMDAccessoryRegistry *)self accessoryQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10006A71C;
  v7[3] = &unk_1002D93F0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

- (void)_forceUpdateAccessory:(id)a3
{
  id v4 = a3;
  id v5 = [(FMDAccessoryRegistry *)self accessoryQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [v4 accessoryIdentifier];
  BOOL v7 = v6;
  if (v6 && ([v6 isValid] & 1) != 0)
  {
    id v8 = [(FMDAccessoryRegistry *)self accessoriesByIdentifier];
    id v9 = [v8 objectForKeyedSubscript:v7];

    [v4 updateWithAccessory:v9];
    uint64_t v10 = sub_100004238();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412290;
      id v12 = v4;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "FMDAccessoryRegistry : force updating accessory: %@", (uint8_t *)&v11, 0xCu);
    }

    [(FMDAccessoryRegistry *)self accessoryDidUpdate:v4];
  }
  else
  {
    id v9 = sub_100004238();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10023FE84();
    }
  }
}

- (void)updateAccessory:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = [(FMDAccessoryRegistry *)self accessoryQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006A984;
  block[3] = &unk_1002D9238;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)removeAccessory:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = [(FMDAccessoryRegistry *)self accessoryQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006AACC;
  block[3] = &unk_1002D9238;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)refetchBauuids:(id)a3
{
  id v4 = sub_100004238();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "refetchBauuid", buf, 2u);
  }

  id v5 = [(FMDAccessoryRegistry *)self accessoryQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006ABEC;
  block[3] = &unk_1002D9378;
  void block[4] = self;
  dispatch_async(v5, block);
}

- (void)readAccessoriesFromDisk
{
  objc_initWeak(&location, self);
  v3 = [(FMDAccessoryRegistry *)self accessoryQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006B0B0;
  block[3] = &unk_1002D9238;
  objc_copyWeak(&v5, &location);
  void block[4] = self;
  dispatch_async(v3, block);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)saveAccessoriesToDisk
{
  v3 = [(FMDAccessoryRegistry *)self accessoryQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = sub_100004238();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [(FMDAccessoryRegistry *)self accessoriesByIdentifier];
    int v10 = 138412290;
    int v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "FMDAccessoryRegistry saveAccessoriesToDisk %@", (uint8_t *)&v10, 0xCu);
  }
  id v6 = [(FMDAccessoryRegistry *)self dataArchiver];
  BOOL v7 = [(FMDAccessoryRegistry *)self accessoriesByIdentifier];
  id v8 = [v6 saveDictionary:v7];

  if (v8)
  {
    id v9 = sub_100004238();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10023EA80();
    }
  }
}

- (void)availabilitydidChangeFor:(id)a3 status:(id)a4 withCompletion:(id)a5
{
  id v8 = a4;
  id v9 = (void (**)(id, void))a5;
  id v10 = a3;
  int v11 = sub_100059878();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v23 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "availabilitydidChangeFor status = %@", buf, 0xCu);
  }

  id v12 = [v8 objectForKeyedSubscript:@"components"];
  v9[2](v9, 0);

  id v13 = [objc_alloc((Class)FMDAccessoryIdentifier) initWithString:v10];
  long long v14 = [(FMDAccessoryRegistry *)self accessoriesByIdentifier];
  BOOL v15 = [v14 objectForKeyedSubscript:v13];

  if (v15)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v16 = v15;
      BOOL v17 = [v8 objectForKeyedSubscript:@"statusUpdateTime"];
      if (v17)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v18 = sub_100059878();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
            sub_10023FF54();
          }

          [v16 setLastStatusUpdateTime:v17];
        }
      }
      if ([v16 updateComponnentsAvailability:v12])
      {
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_10006B688;
        block[3] = &unk_1002DBCB0;
        char v21 = 1;
        void block[4] = self;
        id v20 = v16;
        dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
      }
    }
  }
}

- (FMDAccessoryRegistrySupportDelegate)supportDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_supportDelegate);

  return (FMDAccessoryRegistrySupportDelegate *)WeakRetained;
}

- (void)setSupportDelegate:(id)a3
{
}

- (NSDictionary)accessoriesByIdentifier
{
  return self->_accessoriesByIdentifier;
}

- (void)setAccessoriesByIdentifier:(id)a3
{
}

- (OS_dispatch_queue)accessoryQueue
{
  return self->_accessoryQueue;
}

- (void)setAccessoryQueue:(id)a3
{
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (void)setDelegateQueue:(id)a3
{
}

- (NSPointerArray)delegates
{
  return self->_delegates;
}

- (void)setDelegates:(id)a3
{
}

- (FMDataArchiver)dataArchiver
{
  return self->_dataArchiver;
}

- (void)setDataArchiver:(id)a3
{
}

- (NSMutableArray)dataSources
{
  return self->_dataSources;
}

- (void)setDataSources:(id)a3
{
}

- (NSMutableSet)connectedAccessoryIdentifiers
{
  return self->_connectedAccessoryIdentifiers;
}

- (void)setConnectedAccessoryIdentifiers:(id)a3
{
}

- (unint64_t)dataSourceErrorBackoffCount
{
  return self->_dataSourceErrorBackoffCount;
}

- (void)setDataSourceErrorBackoffCount:(unint64_t)a3
{
  self->_dataSourceErrorBackoffCount = a3;
}

- (FMDispatchTimer)dataSourceRetryTimer
{
  return self->_dataSourceRetryTimer;
}

- (void)setDataSourceRetryTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSourceRetryTimer, 0);
  objc_storeStrong((id *)&self->_connectedAccessoryIdentifiers, 0);
  objc_storeStrong((id *)&self->_dataSources, 0);
  objc_storeStrong((id *)&self->_dataArchiver, 0);
  objc_storeStrong((id *)&self->_delegates, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_accessoryQueue, 0);
  objc_storeStrong((id *)&self->_accessoriesByIdentifier, 0);

  objc_destroyWeak((id *)&self->_supportDelegate);
}

@end