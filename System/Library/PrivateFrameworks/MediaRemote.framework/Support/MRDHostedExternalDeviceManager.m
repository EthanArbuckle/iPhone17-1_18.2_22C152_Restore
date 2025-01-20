@interface MRDHostedExternalDeviceManager
- (BOOL)isDirectConnectedToOutputDeviceUID:(id)a3;
- (MRDHostedExternalDeviceManager)init;
- (MRDHostedExternalDeviceManagerDelegate)delegate;
- (NSDictionary)availableExternalDevices;
- (id)disconnectUndiscoverableEndpoints:(id)a3;
- (id)hostedExternalDeviceForEndpointIdentifier:(id)a3;
- (void)_handleExternalDeviceConnectionStateDidChangeNotification:(id)a3;
- (void)_removeExternalDeviceWithEndpointIdentifier:(id)a3 error:(id)a4;
- (void)_removeExternalDeviceWithOutputDeviceUID:(id)a3 error:(id)a4;
- (void)_tombstoneHostedExternalDevice:(id)a3 error:(id)a4;
- (void)addHostedExternalDevice:(id)a3 endpoint:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation MRDHostedExternalDeviceManager

- (MRDHostedExternalDeviceManager)init
{
  v9.receiver = self;
  v9.super_class = (Class)MRDHostedExternalDeviceManager;
  v2 = [(MRDHostedExternalDeviceManager *)&v9 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    hostedExternalDeviceMap = v2->_hostedExternalDeviceMap;
    v2->_hostedExternalDeviceMap = v3;

    v5 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    hostedExternalDeviceGraveyard = v2->_hostedExternalDeviceGraveyard;
    v2->_hostedExternalDeviceGraveyard = v5;

    v7 = +[NSNotificationCenter defaultCenter];
    [v7 addObserver:v2 selector:"_handleExternalDeviceConnectionStateDidChangeNotification:" name:kMRExternalDeviceConnectionStateDidChangeNotification object:0];
  }
  return v2;
}

- (NSDictionary)availableExternalDevices
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = [(NSMutableDictionary *)v2->_hostedExternalDeviceMap copy];
  objc_sync_exit(v2);

  return (NSDictionary *)v3;
}

- (void)addHostedExternalDevice:(id)a3 endpoint:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  objc_super v9 = MRLogCategoryDiscovery();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = [v7 uniqueIdentifier];
    v11 = [v6 externalDevice];
    *(_DWORD *)buf = 138543874;
    id v16 = v6;
    __int16 v17 = 2114;
    v18 = v10;
    __int16 v19 = 2112;
    v20 = v11;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[MRDHostedExternalDeviceManager] Created new hostedExternalDevice=%{public}@, endpoint=%{public}@ externalDevice=%@", buf, 0x20u);
  }
  hostedExternalDeviceMap = v8->_hostedExternalDeviceMap;
  v13 = [v7 uniqueIdentifier];
  [(NSMutableDictionary *)hostedExternalDeviceMap setObject:v6 forKeyedSubscript:v13];

  objc_sync_exit(v8);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10014BFCC;
  block[3] = &unk_100415CC8;
  block[4] = v8;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (id)hostedExternalDeviceForEndpointIdentifier:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  id v6 = [(NSMutableDictionary *)v5->_hostedExternalDeviceMap objectForKeyedSubscript:v4];
  objc_sync_exit(v5);

  return v6;
}

- (BOOL)isDirectConnectedToOutputDeviceUID:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  hostedExternalDeviceMap = v5->_hostedExternalDeviceMap;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10014C18C;
  v10[3] = &unk_10041E388;
  id v7 = v4;
  id v11 = v7;
  v8 = [(NSMutableDictionary *)hostedExternalDeviceMap msv_firstWhere:v10];
  LOBYTE(hostedExternalDeviceMap) = v8 != 0;

  objc_sync_exit(v5);
  return (char)hostedExternalDeviceMap;
}

- (id)disconnectUndiscoverableEndpoints:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableArray);
  id v6 = self;
  objc_sync_enter(v6);
  id v7 = objc_alloc_init((Class)NSMutableDictionary);
  hostedExternalDeviceMap = v6->_hostedExternalDeviceMap;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10014C354;
  v15[3] = &unk_10041E7B0;
  id v9 = v4;
  id v16 = v9;
  id v10 = v7;
  id v17 = v10;
  [(NSMutableDictionary *)hostedExternalDeviceMap enumerateKeysAndObjectsUsingBlock:v15];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10014C46C;
  v13[3] = &unk_10041E7B0;
  v13[4] = v6;
  id v11 = v5;
  id v14 = v11;
  [v10 enumerateKeysAndObjectsUsingBlock:v13];

  objc_sync_exit(v6);

  return v11;
}

- (void)_removeExternalDeviceWithEndpointIdentifier:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(NSMutableDictionary *)self->_hostedExternalDeviceMap objectForKeyedSubscript:v6];
  id v9 = MRLogCategoryDiscovery();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = [v8 externalDevice];
    *(_DWORD *)buf = 138544130;
    v13 = v8;
    __int16 v14 = 2114;
    id v15 = v6;
    __int16 v16 = 2114;
    id v17 = v7;
    __int16 v18 = 2112;
    __int16 v19 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[MRDHostedExternalDeviceManager] Removing hostedExternalDevice=%{public}@, endpointIdentifier=%{public}@ reason=%{public}@ externalDevice=%@", buf, 0x2Au);
  }
  [(MRDHostedExternalDeviceManager *)self _tombstoneHostedExternalDevice:v8 error:v7];
  [(NSMutableDictionary *)self->_hostedExternalDeviceMap setObject:0 forKeyedSubscript:v6];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10014C760;
  block[3] = &unk_100415CC8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_removeExternalDeviceWithOutputDeviceUID:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = objc_opt_new();
  hostedExternalDeviceMap = self->_hostedExternalDeviceMap;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10014C970;
  v22[3] = &unk_10041E7D8;
  id v10 = v6;
  id v23 = v10;
  id v11 = v7;
  id v24 = v11;
  id v12 = v8;
  id v25 = v12;
  [(NSMutableDictionary *)hostedExternalDeviceMap enumerateKeysAndObjectsUsingBlock:v22];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v13 = v12;
  id v14 = [v13 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v19;
    do
    {
      id v17 = 0;
      do
      {
        if (*(void *)v19 != v16) {
          objc_enumerationMutation(v13);
        }
        -[MRDHostedExternalDeviceManager _removeExternalDeviceWithEndpointIdentifier:error:](self, "_removeExternalDeviceWithEndpointIdentifier:error:", *(void *)(*((void *)&v18 + 1) + 8 * (void)v17), v11, (void)v18);
        id v17 = (char *)v17 + 1;
      }
      while (v15 != v17);
      id v15 = [v13 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v15);
  }
}

- (void)_tombstoneHostedExternalDevice:(id)a3 error:(id)a4
{
  id v6 = a3;
  [v6 tombstoneWithError:a4];
  [(NSMutableArray *)self->_hostedExternalDeviceGraveyard addObject:v6];
  if (qword_10047E388 != -1) {
    dispatch_once(&qword_10047E388, &stru_10041E7F8);
  }
  dispatch_time_t v7 = dispatch_time(0, 5000000000);
  v8 = qword_10047E380;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10014CC0C;
  v10[3] = &unk_1004158D8;
  void v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  dispatch_after(v7, v8, v10);
}

- (void)_handleExternalDeviceConnectionStateDidChangeNotification:(id)a3
{
  id v4 = a3;
  id v5 = [v4 userInfo];
  id v6 = [v5 objectForKey:kMRExternalDeviceConnectionStateUserInfoKey];
  unsigned int v7 = [v6 unsignedIntValue];

  v8 = [v4 object];
  if (v7 == 3)
  {
    id v9 = self;
    objc_sync_enter(v9);
    uint64_t v19 = 0;
    long long v20 = &v19;
    uint64_t v21 = 0x3032000000;
    v22 = sub_10014CE54;
    id v23 = sub_10014CE64;
    id v24 = 0;
    hostedExternalDeviceMap = v9->_hostedExternalDeviceMap;
    id v13 = _NSConcreteStackBlock;
    uint64_t v14 = 3221225472;
    id v15 = sub_10014CE6C;
    uint64_t v16 = &unk_10041E820;
    id v17 = v8;
    long long v18 = &v19;
    [(NSMutableDictionary *)hostedExternalDeviceMap enumerateKeysAndObjectsUsingBlock:&v13];
    if (v20[5])
    {
      id v11 = objc_msgSend(v4, "userInfo", v13, v14, v15, v16);
      id v12 = [v11 objectForKey:NSUnderlyingErrorKey];

      [(MRDHostedExternalDeviceManager *)v9 _removeExternalDeviceWithEndpointIdentifier:v20[5] error:v12];
    }

    _Block_object_dispose(&v19, 8);
    objc_sync_exit(v9);
  }
}

- (MRDHostedExternalDeviceManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MRDHostedExternalDeviceManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_hostedExternalDeviceMap, 0);

  objc_storeStrong((id *)&self->_hostedExternalDeviceGraveyard, 0);
}

@end