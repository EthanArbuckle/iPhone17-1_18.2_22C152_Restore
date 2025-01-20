@interface MSDCellularHelper
+ (id)sharedInstance;
- (BOOL)cellularCapable;
- (BOOL)embeddedSIMInstalled;
- (BOOL)hasObserver:(id)a3;
- (MSDCellularHelper)init;
- (NSArray)cellularSlotsInfo;
- (NSDictionary)cellularInfo;
- (NSMutableArray)observers;
- (OS_dispatch_queue)cellularQueue;
- (id)getCellularSimInfo;
- (void)_fetchCellularPlanItems;
- (void)_handleCellularPlanInfoDidChange:(id)a3;
- (void)addObserver:(id)a3;
- (void)removeObserver:(id)a3;
- (void)setCellularCapable:(BOOL)a3;
- (void)setCellularQueue:(id)a3;
- (void)setCellularSlotsInfo:(id)a3;
- (void)setObservers:(id)a3;
@end

@implementation MSDCellularHelper

+ (id)sharedInstance
{
  if (qword_100189A18 != -1) {
    dispatch_once(&qword_100189A18, &stru_100152B10);
  }
  v2 = (void *)qword_100189A10;

  return v2;
}

- (MSDCellularHelper)init
{
  v9.receiver = self;
  v9.super_class = (Class)MSDCellularHelper;
  v2 = [(MSDCellularHelper *)&v9 init];
  if (v2)
  {
    v3 = +[NSArray array];
    [(MSDCellularHelper *)v2 setCellularSlotsInfo:v3];

    dispatch_queue_t v4 = dispatch_queue_create("com.apple.msd.cellular", 0);
    [(MSDCellularHelper *)v2 setCellularQueue:v4];

    CFBooleanRef v5 = (const __CFBoolean *)MGCopyAnswer();
    [(MSDCellularHelper *)v2 setCellularCapable:CFBooleanGetValue(v5) != 0];
    v6 = objc_opt_new();
    [(MSDCellularHelper *)v2 setObservers:v6];

    if ([(MSDCellularHelper *)v2 cellularCapable])
    {
      v7 = +[NSNotificationCenter defaultCenter];
      [v7 addObserver:v2 selector:"_handleCellularPlanInfoDidChange:" name:CTCellularPlanInfoDidChangeNotification object:0];

      [(MSDCellularHelper *)v2 _fetchCellularPlanItems];
    }
  }
  return v2;
}

- (NSDictionary)cellularInfo
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = sub_100048268;
  v11 = sub_100048278;
  id v12 = 0;
  if ([(MSDCellularHelper *)self cellularCapable])
  {
    v3 = [(MSDCellularHelper *)self cellularQueue];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100048280;
    v6[3] = &unk_100152798;
    v6[4] = self;
    v6[5] = &v7;
    dispatch_sync(v3, v6);

    id v4 = (id)v8[5];
  }
  else
  {
    id v4 = 0;
  }
  _Block_object_dispose(&v7, 8);

  return (NSDictionary *)v4;
}

- (id)getCellularSimInfo
{
  v2 = [(MSDCellularHelper *)self cellularInfo];
  v3 = [v2 objectForKey:@"Slots"];

  return v3;
}

- (BOOL)embeddedSIMInstalled
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  if ([(MSDCellularHelper *)self cellularCapable])
  {
    v3 = [(MSDCellularHelper *)self cellularQueue];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100048458;
    v6[3] = &unk_100152B38;
    v6[4] = self;
    v6[5] = &v7;
    dispatch_sync(v3, v6);

    BOOL v4 = *((unsigned char *)v8 + 24) != 0;
  }
  else
  {
    BOOL v4 = 0;
  }
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  CFBooleanRef v5 = self;
  objc_sync_enter(v5);
  v6 = [(MSDCellularHelper *)v5 observers];
  unsigned __int8 v7 = [v6 containsObject:v4];

  if ((v7 & 1) == 0)
  {
    v8 = sub_100068600();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138543362;
      id v11 = v4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Adding cellular oberver: %{public}@", (uint8_t *)&v10, 0xCu);
    }

    uint64_t v9 = [(MSDCellularHelper *)v5 observers];
    [v9 addObject:v4];
  }
  objc_sync_exit(v5);
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  CFBooleanRef v5 = self;
  objc_sync_enter(v5);
  v6 = [(MSDCellularHelper *)v5 observers];
  unsigned int v7 = [v6 containsObject:v4];

  if (v7)
  {
    v8 = sub_100068600();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138543362;
      id v11 = v4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Removing cellular oberver: %{public}@", (uint8_t *)&v10, 0xCu);
    }

    uint64_t v9 = [(MSDCellularHelper *)v5 observers];
    [v9 removeObject:v4];
  }
  objc_sync_exit(v5);
}

- (BOOL)hasObserver:(id)a3
{
  id v4 = a3;
  CFBooleanRef v5 = self;
  objc_sync_enter(v5);
  v6 = [(MSDCellularHelper *)v5 observers];
  unsigned __int8 v7 = [v6 containsObject:v4];

  objc_sync_exit(v5);
  return v7;
}

- (void)_fetchCellularPlanItems
{
  v2 = +[NSMutableArray arrayWithCapacity:0];
  v3 = sub_100068600();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Fetching cellular plan items...", buf, 2u);
  }

  id v4 = +[CTCellularPlanManager sharedManager];
  v23 = [v4 planItemsShouldUpdate:0];

  if (v23 && [v23 count])
  {
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v5 = v23;
    id v6 = [v5 countByEnumeratingWithState:&v28 objects:v35 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v29;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v29 != v7) {
            objc_enumerationMutation(v5);
          }
          uint64_t v9 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          int v10 = sub_100068600();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v34 = v9;
            _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Found cellular plan item: %{public}@", buf, 0xCu);
          }

          if (![v9 type] || objc_msgSend(v9, "type") == (id)2)
          {
            id v11 = objc_alloc_init((Class)NSMutableDictionary);
            if ([v9 type]) {
              id v12 = &off_1001620A8;
            }
            else {
              id v12 = &off_1001620C0;
            }
            [v11 setObject:v12 forKey:@"SimType"];
            v13 = [v9 carrierName];
            v14 = v13;
            if (v13 && [v13 length])
            {
              [v11 setObject:v14 forKey:@"Provider"];
            }
            else
            {
              v15 = +[NSNull null];
              [v11 setObject:v15 forKey:@"Provider"];
            }
            [v2 addObject:v11];
          }
        }
        id v6 = [v5 countByEnumeratingWithState:&v28 objects:v35 count:16];
      }
      while (v6);
    }

    v16 = self;
    objc_sync_enter(v16);
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    v17 = [(MSDCellularHelper *)v16 observers];
    id v18 = [v17 countByEnumeratingWithState:&v24 objects:v32 count:16];
    if (v18)
    {
      uint64_t v19 = *(void *)v25;
      do
      {
        for (j = 0; j != v18; j = (char *)j + 1)
        {
          if (*(void *)v25 != v19) {
            objc_enumerationMutation(v17);
          }
          [*(id *)(*((void *)&v24 + 1) + 8 * (void)j) cellularPlanDidChange:v2];
        }
        id v18 = [v17 countByEnumeratingWithState:&v24 objects:v32 count:16];
      }
      while (v18);
    }

    objc_sync_exit(v16);
  }
  else
  {
    sub_100068600();
    v16 = (MSDCellularHelper *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v16->super, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, &v16->super, OS_LOG_TYPE_DEFAULT, "No cellular plan items found.", buf, 2u);
    }
  }

  v21 = +[NSArray arrayWithArray:v2];
  [(MSDCellularHelper *)self setCellularSlotsInfo:v21];
}

- (void)_handleCellularPlanInfoDidChange:(id)a3
{
  id v4 = sub_100068600();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Received notification for cellular plan info change!", buf, 2u);
  }

  id v5 = [(MSDCellularHelper *)self cellularQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100048D84;
  block[3] = &unk_100151AF0;
  block[4] = self;
  dispatch_async(v5, block);
}

- (NSArray)cellularSlotsInfo
{
  return self->_cellularSlotsInfo;
}

- (void)setCellularSlotsInfo:(id)a3
{
}

- (OS_dispatch_queue)cellularQueue
{
  return self->_cellularQueue;
}

- (void)setCellularQueue:(id)a3
{
}

- (BOOL)cellularCapable
{
  return self->_cellularCapable;
}

- (void)setCellularCapable:(BOOL)a3
{
  self->_cellularCapable = a3;
}

- (NSMutableArray)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_cellularQueue, 0);

  objc_storeStrong((id *)&self->_cellularSlotsInfo, 0);
}

@end