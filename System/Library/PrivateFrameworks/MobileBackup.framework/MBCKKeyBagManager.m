@interface MBCKKeyBagManager
- (BOOL)fetchKeybagsWithOperationTracker:(id)a3 error:(id *)a4;
- (BOOL)hasFetchedKeybags;
- (BOOL)hasKeybagWithUUID:(id)a3;
- (BOOL)hasKeybags;
- (BOOL)setupKeybagWithOperationTracker:(id)a3 passcode:(id)a4 error:(id *)a5;
- (MBCKDevice)device;
- (MBCKKeyBagManager)initWithDevice:(id)a3 keybagRefs:(id)a4;
- (NSDictionary)keybagsByUUIDString;
- (NSMutableDictionary)keybagRefsByUUID;
- (NSMutableDictionary)keybagsByUUID;
- (id)keybagRefs;
- (id)keybagWithUUID:(id)a3;
- (void)addKeybag:(id)a3;
- (void)fetchAllKeybagsWithOperationTracker:(id)a3 completion:(id)a4;
- (void)mergeKeybagRefs:(id)a3;
- (void)removeKeybagWithUUID:(id)a3;
- (void)setDevice:(id)a3;
- (void)setHasFetchedKeybags:(BOOL)a3;
- (void)setKeybagRefsByUUID:(id)a3;
- (void)setKeybagsByUUID:(id)a3;
@end

@implementation MBCKKeyBagManager

- (MBCKKeyBagManager)initWithDevice:(id)a3 keybagRefs:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v27.receiver = self;
  v27.super_class = (Class)MBCKKeyBagManager;
  v8 = [(MBCKKeyBagManager *)&v27 init];
  v9 = v8;
  if (v8)
  {
    id v22 = v6;
    [(MBCKKeyBagManager *)v8 setDevice:v6];
    v10 = +[NSMutableDictionary dictionary];
    [(MBCKKeyBagManager *)v9 setKeybagRefsByUUID:v10];

    v11 = +[NSMutableDictionary dictionary];
    [(MBCKKeyBagManager *)v9 setKeybagsByUUID:v11];

    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v12 = v7;
    id v13 = [v12 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v24;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v24 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          v18 = [v17 recordID];
          v19 = +[MBCKKeyBag UUIDStringFromRecordID:v18];

          v20 = [(MBCKKeyBagManager *)v9 keybagRefsByUUID];
          [v20 setObject:v17 forKeyedSubscript:v19];
        }
        id v14 = [v12 countByEnumeratingWithState:&v23 objects:v28 count:16];
      }
      while (v14);
    }

    id v6 = v22;
  }

  return v9;
}

- (void)fetchAllKeybagsWithOperationTracker:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6) {
    __assert_rtn("-[MBCKKeyBagManager fetchAllKeybagsWithOperationTracker:completion:]", "MBCKKeyBagManager.m", 40, "tracker");
  }
  v8 = (void (**)(void, void))v7;
  v9 = [(MBCKKeyBagManager *)self device];
  v10 = MBGetDefaultLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = [v9 deviceUUID];
    *(_DWORD *)buf = 138543362;
    v32 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Fetching all keybags from server for device %{public}@", buf, 0xCu);

    long long v23 = [v9 deviceUUID];
    _MBLog();
  }
  if ([(MBCKKeyBagManager *)self hasFetchedKeybags])
  {
    v8[2](v8, 0);
  }
  else
  {
    id v12 = [(MBCKKeyBagManager *)self keybagRefs];
    BOOL v13 = [v12 count] == 0;

    if (v13)
    {
      id v22 = MBGetDefaultLog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "No keybags references stored with device record", buf, 2u);
        _MBLog();
      }

      [(MBCKKeyBagManager *)self setHasFetchedKeybags:1];
      v8[2](v8, 0);
    }
    else
    {
      id v14 = [(MBCKKeyBagManager *)self keybagRefs];
      uint64_t v15 = +[NSPredicate predicateWithFormat:@"recordID IN %@", v14];

      id v16 = objc_alloc((Class)CKQuery);
      v17 = +[MBCKModel privilegedQueryType];
      id v18 = [v16 initWithRecordType:v17 predicate:v15];

      id v19 = [objc_alloc((Class)CKQueryOperation) initWithQuery:v18];
      v20 = [v6 syncZoneID];
      [v19 setZoneID:v20];

      objc_initWeak((id *)buf, v19);
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = sub_1001FB33C;
      v28[3] = &unk_1004165F8;
      id v21 = v9;
      id v29 = v21;
      v30 = self;
      [v19 setRecordFetchedBlock:v28];
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_1001FB488;
      v24[3] = &unk_100416620;
      objc_copyWeak(&v27, (id *)buf);
      v24[4] = self;
      id v25 = v21;
      long long v26 = v8;
      [v19 setQueryCompletionBlock:v24];
      [v6 addDatabaseOperation:v19];

      objc_destroyWeak(&v27);
      objc_destroyWeak((id *)buf);
    }
  }
}

- (BOOL)fetchKeybagsWithOperationTracker:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = sub_1001FB93C;
  v17 = sub_1001FB94C;
  id v18 = 0;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1001FB954;
  v10[3] = &unk_100410FC8;
  id v12 = &v13;
  id v7 = dispatch_semaphore_create(0);
  v11 = v7;
  [(MBCKKeyBagManager *)self fetchAllKeybagsWithOperationTracker:v6 completion:v10];
  MBSemaphoreWaitForever();
  if (a4) {
    *a4 = (id) v14[5];
  }
  BOOL v8 = v14[5] == 0;

  _Block_object_dispose(&v13, 8);
  return v8;
}

- (BOOL)setupKeybagWithOperationTracker:(id)a3 passcode:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  v10 = [(MBCKKeyBagManager *)self device];
  LOBYTE(a5) = +[MBCKKeyBag setupKeybagForDevice:v10 operationTracker:v9 passcode:v8 error:a5];

  return (char)a5;
}

- (BOOL)hasKeybagWithUUID:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  id v6 = [(MBCKKeyBagManager *)v5 keybagsByUUID];
  id v7 = [v6 objectForKeyedSubscript:v4];
  if (v7)
  {
    BOOL v8 = 1;
  }
  else
  {
    id v9 = [(MBCKKeyBagManager *)v5 keybagRefsByUUID];
    v10 = [v9 objectForKeyedSubscript:v4];
    BOOL v8 = v10 != 0;
  }
  objc_sync_exit(v5);

  return v8;
}

- (BOOL)hasKeybags
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = [(MBCKKeyBagManager *)v2 keybagsByUUID];
  if ([v3 count])
  {
    BOOL v4 = 1;
  }
  else
  {
    v5 = [(MBCKKeyBagManager *)v2 keybagRefsByUUID];
    BOOL v4 = [v5 count] != 0;
  }
  objc_sync_exit(v2);

  return v4;
}

- (void)addKeybag:(id)a3
{
  id v7 = a3;
  BOOL v4 = [v7 keybagUUIDString];
  v5 = self;
  objc_sync_enter(v5);
  id v6 = [(MBCKKeyBagManager *)v5 keybagsByUUID];
  [v6 setObject:v7 forKeyedSubscript:v4];

  objc_sync_exit(v5);
}

- (void)removeKeybagWithUUID:(id)a3
{
  id v4 = a3;
  if (!v4) {
    __assert_rtn("-[MBCKKeyBagManager removeKeybagWithUUID:]", "MBCKKeyBagManager.m", 118, "keybagUUIDString");
  }
  id v7 = v4;
  v5 = self;
  objc_sync_enter(v5);
  id v6 = [(MBCKKeyBagManager *)v5 keybagsByUUID];
  [v6 setObject:0 forKeyedSubscript:v7];

  objc_sync_exit(v5);
}

- (id)keybagWithUUID:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  id v6 = [(MBCKKeyBagManager *)v5 keybagsByUUID];
  id v7 = [v6 objectForKeyedSubscript:v4];

  objc_sync_exit(v5);
  return v7;
}

- (NSDictionary)keybagsByUUIDString
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = [(MBCKKeyBagManager *)v2 keybagsByUUID];
  objc_sync_exit(v2);

  return (NSDictionary *)v3;
}

- (id)keybagRefs
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = +[NSMutableArray array];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v4 = [(MBCKKeyBagManager *)v2 keybagRefsByUUID];
  v5 = [v4 allValues];

  id v6 = [v5 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v28;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v28 != v7) {
          objc_enumerationMutation(v5);
        }
        [v3 addObject:*(void *)(*((void *)&v27 + 1) + 8 * i)];
      }
      id v6 = [v5 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v6);
  }

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v9 = [(MBCKKeyBagManager *)v2 keybagsByUUID];
  id v10 = [v9 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v24;
    do
    {
      for (j = 0; j != v10; j = (char *)j + 1)
      {
        if (*(void *)v24 != v11) {
          objc_enumerationMutation(v9);
        }
        uint64_t v13 = *(void *)(*((void *)&v23 + 1) + 8 * (void)j);
        id v14 = [(MBCKKeyBagManager *)v2 keybagRefsByUUID];
        uint64_t v15 = [v14 objectForKeyedSubscript:v13];
        BOOL v16 = v15 == 0;

        if (v16)
        {
          v17 = [(MBCKKeyBagManager *)v2 keybagsByUUID];
          id v18 = [v17 objectForKeyedSubscript:v13];

          id v19 = objc_alloc((Class)CKReference);
          v20 = [v18 recordID];
          id v21 = [v19 initWithRecordID:v20 action:0];

          [v3 addObject:v21];
        }
      }
      id v10 = [v9 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v10);
  }

  objc_sync_exit(v2);
  return v3;
}

- (void)mergeKeybagRefs:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = v4;
  id v6 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v20;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        id v10 = [v9 recordID];
        uint64_t v11 = +[MBCKKeyBag UUIDStringFromRecordID:v10];

        id v12 = [(MBCKKeyBagManager *)v5 keybagRefsByUUID];
        uint64_t v13 = [v12 objectForKeyedSubscript:v11];
        if (v13)
        {
        }
        else
        {
          id v14 = [(MBCKKeyBagManager *)v5 keybagsByUUID];
          uint64_t v15 = [v14 objectForKeyedSubscript:v11];
          BOOL v16 = v15 == 0;

          if (v16)
          {
            v17 = [(MBCKKeyBagManager *)v5 keybagRefsByUUID];
            [v17 setObject:v9 forKeyedSubscript:v11];

            [(MBCKKeyBagManager *)v5 setHasFetchedKeybags:0];
          }
        }
      }
      id v6 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v6);
  }

  objc_sync_exit(v5);
}

- (BOOL)hasFetchedKeybags
{
  return self->_hasFetchedKeybags;
}

- (void)setHasFetchedKeybags:(BOOL)a3
{
  self->_hasFetchedKeybags = a3;
}

- (MBCKDevice)device
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_device);
  return (MBCKDevice *)WeakRetained;
}

- (void)setDevice:(id)a3
{
}

- (NSMutableDictionary)keybagRefsByUUID
{
  return self->_keybagRefsByUUID;
}

- (void)setKeybagRefsByUUID:(id)a3
{
}

- (NSMutableDictionary)keybagsByUUID
{
  return self->_keybagsByUUID;
}

- (void)setKeybagsByUUID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keybagsByUUID, 0);
  objc_storeStrong((id *)&self->_keybagRefsByUUID, 0);
  objc_destroyWeak((id *)&self->_device);
}

@end