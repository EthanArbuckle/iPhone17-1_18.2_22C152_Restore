@interface MRRapportTransport
+ (NSUserDefaults)userDefaults;
+ (id)_readConnectionRecordsFromDisk;
+ (void)_writeConnectionRecordsToDisk:(id)a3;
+ (void)resetPersistedConnections;
- (BOOL)shouldUseSystemAuthenticationPrompt;
- (MRExternalDeviceTransportConnection)connection;
- (MRRapportTransport)initWithOutputDevice:(id)a3;
- (MRRapportTransport)initWithOutputDevice:(id)a3 proxyOutputDevice:(id)a4;
- (NSString)sessionUID;
- (RPCompanionLinkDevice)targetDevice;
- (id)_generateSessionUID;
- (id)createConnectionWithUserInfo:(id)a3;
- (id)deviceInfo;
- (id)error;
- (id)hostname;
- (id)name;
- (id)uid;
- (int64_t)port;
- (void)_persistConnectionRecordToDisk;
- (void)_removeConnectionRecordFromDisk;
- (void)dealloc;
- (void)resetWithError:(id)a3;
- (void)setConnection:(id)a3;
- (void)setError:(id)a3;
- (void)setSessionUID:(id)a3;
- (void)setTargetDevice:(id)a3;
@end

@implementation MRRapportTransport

- (MRRapportTransport)initWithOutputDevice:(id)a3
{
  return [(MRRapportTransport *)self initWithOutputDevice:a3 proxyOutputDevice:a3];
}

- (MRRapportTransport)initWithOutputDevice:(id)a3 proxyOutputDevice:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v22.receiver = self;
  v22.super_class = (Class)MRRapportTransport;
  v9 = [(MRRapportTransport *)&v22 init];
  if (v9)
  {
    v10 = MRLogCategoryConnections();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v24 = v7;
      _os_log_impl(&dword_194F3C000, v10, OS_LOG_TYPE_DEFAULT, "[MRRapportTransport] Create for %@", buf, 0xCu);
    }

    objc_storeStrong((id *)&v9->_outputDevice, a3);
    objc_storeStrong((id *)&v9->_proxyOutputDevice, a4);
    v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v12 = dispatch_queue_create("com.apple.mediaremote.externalDeviceRapportTransport/workerQueue", v11);
    workerQueue = v9->_workerQueue;
    v9->_workerQueue = (OS_dispatch_queue *)v12;

    uint64_t v14 = +[MRCompanionLinkClient sharedCompanionLinkClient];
    client = v9->_client;
    v9->_client = (MRCompanionLinkClient *)v14;

    objc_initWeak((id *)buf, v9);
    v16 = v9->_client;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __61__MRRapportTransport_initWithOutputDevice_proxyOutputDevice___block_invoke;
    v20[3] = &unk_1E57D0740;
    objc_copyWeak(&v21, (id *)buf);
    uint64_t v17 = [(MRCompanionLinkClient *)v16 registerEvent:@"com.apple.mediaremote.remotecontrol.reset" callback:v20];
    id resetToken = v9->_resetToken;
    v9->_id resetToken = (id)v17;

    objc_destroyWeak(&v21);
    objc_destroyWeak((id *)buf);
  }

  return v9;
}

void __61__MRRapportTransport_initWithOutputDevice_proxyOutputDevice___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v9 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v5 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4F947A0]];
    v6 = [WeakRetained[15] effectiveIdentifier];
    int v7 = [v5 isEqualToString:v6];

    if (v7)
    {
      id v8 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithMRError:105 description:@"MRRapportTransport received reset event"];
      [WeakRetained resetWithError:v8];
    }
  }
}

- (void)dealloc
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithMRError:104 description:@"MRRapportTransport.dealloc"];
  [(MRRapportTransport *)self resetWithError:v3];
  v4 = +[MRCompanionLinkClient sharedCompanionLinkClient];
  [v4 removeCallback:self->_resetToken];

  v5.receiver = self;
  v5.super_class = (Class)MRRapportTransport;
  [(MRRapportTransport *)&v5 dealloc];
}

+ (NSUserDefaults)userDefaults
{
  if (userDefaults_onceToken != -1) {
    dispatch_once(&userDefaults_onceToken, &__block_literal_global_5);
  }
  v2 = (void *)userDefaults___userDefaults;

  return (NSUserDefaults *)v2;
}

uint64_t __34__MRRapportTransport_userDefaults__block_invoke()
{
  userDefaults___userDefaults = [objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.mediaremote"];

  return MEMORY[0x1F41817F8]();
}

- (id)deviceInfo
{
  v3 = objc_alloc_init(MRDeviceInfo);
  v4 = [(MRAVOutputDevice *)self->_outputDevice name];
  [(MRDeviceInfo *)v3 setName:v4];

  objc_super v5 = [(MRAVOutputDevice *)self->_outputDevice primaryID];
  [(MRDeviceInfo *)v3 setDeviceUID:v5];

  return v3;
}

- (id)uid
{
  v2 = [(MRRapportTransport *)self deviceInfo];
  v3 = [v2 deviceUID];

  return v3;
}

- (id)name
{
  v2 = [(MRRapportTransport *)self deviceInfo];
  v3 = [v2 name];

  return v3;
}

- (id)hostname
{
  return 0;
}

- (int64_t)port
{
  return 0;
}

- (BOOL)shouldUseSystemAuthenticationPrompt
{
  return 0;
}

- (void)setError:(id)a3
{
  v4 = (NSError *)a3;
  obj = self;
  objc_sync_enter(obj);
  error = obj->_error;
  obj->_error = v4;

  objc_sync_exit(obj);
}

- (id)error
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)[(NSError *)v2->_error copy];
  objc_sync_exit(v2);

  return v3;
}

- (id)createConnectionWithUserInfo:(id)a3
{
  workerQueue = self->_workerQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__MRRapportTransport_createConnectionWithUserInfo___block_invoke;
  block[3] = &unk_1E57D0518;
  block[4] = self;
  dispatch_sync(workerQueue, block);
  return self->_connection;
}

void __51__MRRapportTransport_createConnectionWithUserInfo___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) sessionUID];

  if (!v2)
  {
    v3 = [*(id *)(a1 + 32) _generateSessionUID];
    uint64_t v31 = 0;
    v32 = &v31;
    uint64_t v33 = 0x3032000000;
    v34 = __Block_byref_object_copy__0;
    v35 = __Block_byref_object_dispose__0;
    id v36 = 0;
    v4 = [MRRapportTransportConnection alloc];
    objc_super v5 = [*(id *)(*(void *)(a1 + 32) + 72) primaryID];
    v6 = (id *)(v32 + 5);
    id obj = (id)v32[5];
    id v30 = 0;
    int v7 = [(MRRapportTransportConnection *)v4 initWithDeviceUID:v5 sessionUID:v3 targetDevice:&v30 error:&obj];
    id v8 = v30;
    id v9 = v30;
    objc_storeStrong(v6, obj);

    if (v7)
    {
      dispatch_semaphore_t v10 = dispatch_semaphore_create(0);
      id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      [v11 setObject:v3 forKeyedSubscript:@"session"];
      dispatch_queue_t v12 = [*(id *)(*(void *)(a1 + 32) + 64) primaryID];
      [v11 setObject:v12 forKeyedSubscript:@"destination"];

      v13 = [*(id *)(*(void *)(a1 + 32) + 64) groupID];
      [v11 setObject:v13 forKeyedSubscript:@"destinationGroupUID"];

      uint64_t v14 = *(void **)(*(void *)(a1 + 32) + 96);
      v15 = [v9 effectiveIdentifier];
      uint64_t v23 = MEMORY[0x1E4F143A8];
      uint64_t v24 = 3221225472;
      uint64_t v25 = __51__MRRapportTransport_createConnectionWithUserInfo___block_invoke_39;
      v26 = &unk_1E57D0768;
      v28 = &v31;
      v16 = v10;
      v27 = v16;
      [v14 sendRequest:@"com.apple.mediaremote.remotecontrol.connect" destination:v15 userInfo:v11 timeout:&v23 response:7.0];

      dispatch_time_t v17 = dispatch_time(0, 8000000000);
      if (dispatch_semaphore_wait(v16, v17) >= 1)
      {
        id v18 = objc_alloc(MEMORY[0x1E4F28C58]);
        v19 = [*(id *)(a1 + 32) uid];
        uint64_t v20 = [v18 initWithMRError:26, @"Failed to receive request from companionLinkDevice for %@ in %d seconds", v19, 7, v23, v24, v25, v26 format];
        id v21 = (void *)v32[5];
        v32[5] = v20;
      }
    }
    objc_super v22 = *(id **)(a1 + 32);
    if (v32[5])
    {
      objc_msgSend(v22, "setError:");
    }
    else
    {
      objc_storeStrong(v22 + 14, v7);
      [*(id *)(a1 + 32) setSessionUID:v3];
      objc_storeStrong((id *)(*(void *)(a1 + 32) + 120), v8);
      [*(id *)(a1 + 32) _persistConnectionRecordToDisk];
    }

    _Block_object_dispose(&v31, 8);
  }
}

void __51__MRRapportTransport_createConnectionWithUserInfo___block_invoke_39(uint64_t a1, int a2, id obj)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
  id v5 = obj;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)resetWithError:(id)a3
{
  id v8 = a3;
  if (self->_sessionUID)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v4 setObject:self->_sessionUID forKeyedSubscript:@"session"];
    client = self->_client;
    v6 = [(RPCompanionLinkDevice *)self->_targetDevice effectiveIdentifier];
    [(MRCompanionLinkClient *)client sendEvent:@"com.apple.mediaremote.remotecontrol.disconnect" destination:v6 userInfo:v4];
  }
  [(MRRapportTransport *)self setSessionUID:0];
  [(MRRapportTransport *)self _removeConnectionRecordFromDisk];
  [(MRExternalDeviceTransportConnection *)self->_connection closeWithError:v8];
  connection = self->_connection;
  self->_connection = 0;
}

- (void)setSessionUID:(id)a3
{
  id v5 = a3;
  v6 = self;
  objc_sync_enter(v6);
  if (v6->_disconnectToken)
  {
    -[MRCompanionLinkClient removeCallback:](v6->_client, "removeCallback:");
    id disconnectToken = v6->_disconnectToken;
    v6->_id disconnectToken = 0;
  }
  objc_storeStrong((id *)&v6->_sessionUID, a3);
  if (v6->_sessionUID)
  {
    objc_initWeak(&location, v6);
    client = v6->_client;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __36__MRRapportTransport_setSessionUID___block_invoke;
    v11[3] = &unk_1E57D0740;
    objc_copyWeak(&v12, &location);
    uint64_t v9 = [(MRCompanionLinkClient *)client registerEvent:@"com.apple.mediaremote.remotecontrol.disconnect" callback:v11];
    id v10 = v6->_disconnectToken;
    v6->_id disconnectToken = (id)v9;

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  objc_sync_exit(v6);
}

void __36__MRRapportTransport_setSessionUID___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v10 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v5 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F947A0]];
    v6 = [WeakRetained[15] effectiveIdentifier];
    int v7 = [v5 isEqualToString:v6];

    if (v7)
    {
      id v8 = [v10 objectForKeyedSubscript:@"session"];
      if ([v8 isEqualToString:WeakRetained[13]])
      {
        uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithMRError:105 description:@"MRRapportTransport received disconect event"];
        [WeakRetained resetWithError:v9];
      }
    }
  }
}

+ (void)resetPersistedConnections
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id obj = [(id)objc_opt_class() userDefaults];
  objc_sync_enter(obj);
  v2 = [(id)objc_opt_class() _readConnectionRecordsFromDisk];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v23 != v6) {
          objc_enumerationMutation(v4);
        }
        id v8 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        uint64_t v9 = [v8 deviceUID];

        if (v9)
        {
          id v10 = [v8 deviceUID];
          [v3 addObject:v10];
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v5);
  }

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v11 = v3;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v19;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v11);
        }
        uint64_t v15 = *(void *)(*((void *)&v18 + 1) + 8 * j);
        v16 = +[MRCompanionLinkClient sharedCompanionLinkClient];
        [v16 sendEvent:@"com.apple.mediaremote.remotecontrol.reset" destination:v15 userInfo:0];
      }
      uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v12);
  }

  [(id)objc_opt_class() _writeConnectionRecordsToDisk:0];
  objc_sync_exit(obj);
}

- (void)_persistConnectionRecordToDisk
{
  id v3 = [(MRRapportTransport *)self targetDevice];
  id v13 = [v3 effectiveIdentifier];

  if (v13)
  {
    id v4 = [(id)objc_opt_class() userDefaults];
    objc_sync_enter(v4);
    uint64_t v5 = [(id)objc_opt_class() _readConnectionRecordsFromDisk];
    uint64_t v6 = v5;
    if (v5) {
      id v7 = (id)[v5 mutableCopy];
    }
    else {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    id v8 = v7;
    uint64_t v9 = objc_alloc_init(MRRapportTransportConfiguration);
    id v10 = [(MRRapportTransport *)self sessionUID];
    [(MRRapportTransportConfiguration *)v9 setSessionUID:v10];

    [(MRRapportTransportConfiguration *)v9 setDeviceUID:v13];
    id v11 = [(MRRapportTransport *)self targetDevice];
    uint64_t v12 = [v11 name];
    [(MRRapportTransportConfiguration *)v9 setName:v12];

    [v8 addObject:v9];
    [(id)objc_opt_class() _writeConnectionRecordsToDisk:v8];

    objc_sync_exit(v4);
  }
}

- (void)_removeConnectionRecordFromDisk
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id obj = [(id)objc_opt_class() userDefaults];
  objc_sync_enter(obj);
  id v3 = [(id)objc_opt_class() _readConnectionRecordsFromDisk];
  id v4 = (void *)[v3 mutableCopy];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v10 = [v9 sessionUID];
        id v11 = [(MRRapportTransport *)self sessionUID];
        int v12 = [v10 isEqualToString:v11];

        if (v12) {
          [v4 removeObject:v9];
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  [(id)objc_opt_class() _writeConnectionRecordsToDisk:v4];
  objc_sync_exit(obj);
}

+ (id)_readConnectionRecordsFromDisk
{
  v9[2] = *MEMORY[0x1E4F143B8];
  v2 = [(id)objc_opt_class() userDefaults];
  id v3 = [v2 objectForKey:@"outgoingRapportConnections"];
  id v4 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  v9[0] = objc_opt_class();
  v9[1] = objc_opt_class();
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
  uint64_t v6 = (void *)[v4 initWithArray:v5];
  uint64_t v7 = MRCreateFromData(v3, v6);

  return v7;
}

+ (void)_writeConnectionRecordsToDisk:(id)a3
{
  id v10 = a3;
  uint64_t v3 = [v10 count];
  id v4 = [(id)objc_opt_class() userDefaults];
  id v5 = v4;
  if (v3)
  {
    uint64_t v6 = MRCreateDataFromObject(v10);
    [v5 setObject:v6 forKey:@"outgoingRapportConnections"];

    if (!MSVDeviceOSIsInternalInstall()) {
      goto LABEL_7;
    }
    uint64_t v7 = [(id)objc_opt_class() userDefaults];
    id v8 = [v10 description];
    [v7 setObject:v8 forKey:@"outgoingRapportConnectionsDescription"];
  }
  else
  {
    [v4 removeObjectForKey:@"outgoingRapportConnections"];

    if (!MSVDeviceOSIsInternalInstall()) {
      goto LABEL_7;
    }
    uint64_t v7 = [(id)objc_opt_class() userDefaults];
    [v7 removeObjectForKey:@"outgoingRapportConnectionsDescription"];
  }

LABEL_7:
  uint64_t v9 = [(id)objc_opt_class() userDefaults];
  [v9 synchronize];
}

- (id)_generateSessionUID
{
  id v2 = [NSString alloc];
  uint64_t v3 = [MEMORY[0x1E4F29128] UUID];
  id v4 = [v3 UUIDString];
  id v5 = (void *)[v2 initWithFormat:@"%@-%d", v4, ++_generateSessionUID_sessionUID];

  return v5;
}

- (NSString)sessionUID
{
  return self->_sessionUID;
}

- (MRExternalDeviceTransportConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (RPCompanionLinkDevice)targetDevice
{
  return self->_targetDevice;
}

- (void)setTargetDevice:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetDevice, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_sessionUID, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong(&self->_disconnectToken, 0);
  objc_storeStrong(&self->_resetToken, 0);
  objc_storeStrong((id *)&self->_proxyOutputDevice, 0);
  objc_storeStrong((id *)&self->_outputDevice, 0);
  objc_storeStrong((id *)&self->_workerQueue, 0);

  objc_storeStrong((id *)&self->_error, 0);
}

@end