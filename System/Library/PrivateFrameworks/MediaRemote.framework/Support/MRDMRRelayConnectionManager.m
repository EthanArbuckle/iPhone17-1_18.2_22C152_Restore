@interface MRDMRRelayConnectionManager
+ (id)sharedManager;
- (NSHashTable)observers;
- (NSMutableDictionary)connections;
- (NSMutableDictionary)pendingCompletionsPerOutputDeviceUID;
- (NSString)debugDescription;
- (id)connectionForOutputDeviceUID:(id)a3;
- (void)_callPendingCompletions;
- (void)addObserver:(id)a3;
- (void)ingestConnection:(id)a3;
- (void)removeObserver:(id)a3;
- (void)setConnections:(id)a3;
- (void)setObservers:(id)a3;
- (void)setPendingCompletionsPerOutputDeviceUID:(id)a3;
- (void)transportDidClose:(id)a3 error:(id)a4;
- (void)waitForConnectionWithOutputDeviceUID:(id)a3 timeout:(double)a4 completion:(id)a5;
@end

@implementation MRDMRRelayConnectionManager

+ (id)sharedManager
{
  if (qword_10047DFC0 != -1) {
    dispatch_once(&qword_10047DFC0, &stru_1004184A0);
  }
  v2 = (void *)qword_10047DFB8;

  return v2;
}

- (NSString)debugDescription
{
  id v3 = objc_alloc((Class)NSString);
  uint64_t v4 = objc_opt_class();
  v5 = [(MRDMRRelayConnectionManager *)self connections];
  v6 = objc_msgSend(v5, "mr_formattedDebugDescription");
  v7 = [(MRDMRRelayConnectionManager *)self pendingCompletionsPerOutputDeviceUID];
  id v8 = [v3 initWithFormat:@"<%@:%p {\n   connections=%@\n   completions=%@\n>", v4, self, v6, v7];

  return (NSString *)v8;
}

- (void)ingestConnection:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = [(MRDMRRelayConnectionManager *)v5 connections];

  if (!v6)
  {
    id v7 = objc_alloc_init((Class)NSMutableDictionary);
    [(MRDMRRelayConnectionManager *)v5 setConnections:v7];
  }
  id v8 = [v4 connection];
  [v8 addObserver:v5];

  v9 = [v4 connection];
  unsigned int v10 = [v9 isValid];

  if (v10)
  {
    v11 = [v4 deviceInfo];
    v12 = [v11 deviceUID];

    v13 = [(MRDMRRelayConnectionManager *)v5 connections];
    v14 = [v13 objectForKeyedSubscript:v12];

    if (v14)
    {
      v15 = _MRLogForCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v28 = v14;
        __int16 v29 = 2114;
        v30 = v12;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "[MRDMRRelayConnectionManager] Pre-exisiting connection will be dropped: %{public}@, outputDeviceUID: %{public}@", buf, 0x16u);
      }
    }
    v16 = _MRLogForCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = [v4 connection];
      *(_DWORD *)buf = 138543618;
      v28 = v17;
      __int16 v29 = 2114;
      v30 = v12;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "[MRDMRRelayConnectionManager] Ingesting connection: %{public}@, outputDeviceUID: %{public}@", buf, 0x16u);
    }
    v18 = [(MRDMRRelayConnectionManager *)v5 connections];
    [v18 setObject:v4 forKeyedSubscript:v12];

    v19 = [(MRDMRRelayConnectionManager *)v5 observers];
    v20 = [v19 allObjects];

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100066A64;
    block[3] = &unk_1004159B8;
    id v24 = v20;
    v25 = v5;
    id v26 = v4;
    id v21 = v20;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
  else
  {
    v22 = [v4 connection];
    [v22 removeObserver:v5];
  }
  [(MRDMRRelayConnectionManager *)v5 _callPendingCompletions];
  objc_sync_exit(v5);
}

- (id)connectionForOutputDeviceUID:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = [(MRDMRRelayConnectionManager *)v5 connections];
  id v7 = [v6 objectForKeyedSubscript:v4];

  objc_sync_exit(v5);

  return v7;
}

- (void)waitForConnectionWithOutputDeviceUID:(id)a3 timeout:(double)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  unsigned int v10 = +[NSDate date];
  v11 = +[NSUUID UUID];
  v12 = [v11 UUIDString];

  id v13 = [objc_alloc((Class)NSMutableString) initWithFormat:@"%@<%@>", @"MRDMRRelayConnectionManager.waitForConnection", v12];
  v14 = v13;
  if (v8) {
    [v13 appendFormat:@" for %@", v8];
  }
  v15 = _MRLogForCategory();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v43 = v14;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_100066FEC;
  v37[3] = &unk_1004184C8;
  id v16 = v8;
  id v38 = v16;
  id v17 = v12;
  id v39 = v17;
  id v18 = v10;
  id v40 = v18;
  id v19 = v9;
  id v41 = v19;
  v20 = objc_retainBlock(v37);
  id v21 = self;
  objc_sync_enter(v21);
  v22 = [(MRDMRRelayConnectionManager *)v21 pendingCompletionsPerOutputDeviceUID];
  BOOL v23 = v22 == 0;

  if (v23)
  {
    id v24 = objc_alloc_init((Class)NSMutableDictionary);
    [(MRDMRRelayConnectionManager *)v21 setPendingCompletionsPerOutputDeviceUID:v24];
  }
  v25 = [(MRDMRRelayConnectionManager *)v21 pendingCompletionsPerOutputDeviceUID];
  id v26 = [v25 objectForKeyedSubscript:v16];

  if (!v26)
  {
    id v26 = objc_alloc_init((Class)NSMutableArray);
    v27 = [(MRDMRRelayConnectionManager *)v21 pendingCompletionsPerOutputDeviceUID];
    [v27 setObject:v26 forKeyedSubscript:v16];
  }
  v28 = objc_retainBlock(v20);
  [v26 addObject:v28];

  [(MRDMRRelayConnectionManager *)v21 _callPendingCompletions];
  dispatch_time_t v29 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100067380;
  block[3] = &unk_1004184F0;
  void block[4] = v21;
  id v34 = v26;
  id v35 = v19;
  id v36 = v20;
  v30 = v20;
  id v31 = v19;
  id v32 = v26;
  dispatch_after(v29, (dispatch_queue_t)&_dispatch_main_q, block);

  objc_sync_exit(v21);
}

- (void)transportDidClose:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  objc_sync_enter(v8);
  id v9 = [(MRDMRRelayConnectionManager *)v8 connections];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100067648;
  v15[3] = &unk_100418518;
  id v10 = v6;
  id v16 = v10;
  v11 = objc_msgSend(v9, "msv_firstWhere:", v15);

  if (v11)
  {
    v12 = _MRLogForCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v18 = v10;
      __int16 v19 = 2114;
      uint64_t v20 = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "[MRDMRRelayConnectionManager] Removing connection: %{public}@ outputDeviceUID: %{public}@", buf, 0x16u);
    }

    id v13 = [(MRDMRRelayConnectionManager *)v8 connections];
    v14 = [v11 first];
    [v13 removeObjectForKey:v14];
  }
  objc_sync_exit(v8);
}

- (void)addObserver:(id)a3
{
  id v8 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  v5 = [(MRDMRRelayConnectionManager *)v4 observers];

  if (!v5)
  {
    id v6 = +[NSHashTable weakObjectsHashTable];
    [(MRDMRRelayConnectionManager *)v4 setObservers:v6];
  }
  id v7 = [(MRDMRRelayConnectionManager *)v4 observers];
  [v7 addObject:v8];

  objc_sync_exit(v4);
}

- (void)removeObserver:(id)a3
{
  id v6 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  v5 = [(MRDMRRelayConnectionManager *)v4 observers];
  [v5 removeObject:v6];

  objc_sync_exit(v4);
}

- (void)_callPendingCompletions
{
  id v3 = [(MRDMRRelayConnectionManager *)self pendingCompletionsPerOutputDeviceUID];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100067864;
  v4[3] = &unk_100418540;
  v4[4] = self;
  [v3 enumerateKeysAndObjectsUsingBlock:v4];
}

- (NSMutableDictionary)connections
{
  return self->_connections;
}

- (void)setConnections:(id)a3
{
}

- (NSMutableDictionary)pendingCompletionsPerOutputDeviceUID
{
  return self->_pendingCompletionsPerOutputDeviceUID;
}

- (void)setPendingCompletionsPerOutputDeviceUID:(id)a3
{
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_pendingCompletionsPerOutputDeviceUID, 0);

  objc_storeStrong((id *)&self->_connections, 0);
}

@end