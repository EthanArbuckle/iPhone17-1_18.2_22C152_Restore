@interface MRAVEndpointObserver
- (MRAVEndpoint)endpoint;
- (MRAVEndpointObserver)initWithOutputDeviceUID:(id)a3;
- (MRAVEndpointObserver)initWithOutputDeviceUID:(id)a3 label:(id)a4 callback:(id)a5;
- (NSString)label;
- (NSString)outputDeviceUID;
- (id)_initializeDiscoverySession;
- (id)debugDescription;
- (id)description;
- (id)endpointChangedCallback;
- (void)_endpointContainingOutputDevice:(void *)a1;
- (void)_handleEndpointsDidChange:(void *)a1;
- (void)_reevaluateEndpoint;
- (void)begin;
- (void)dealloc;
- (void)end;
- (void)setEndpointChangedCallback:(id)a3;
@end

@implementation MRAVEndpointObserver

- (MRAVEndpointObserver)initWithOutputDeviceUID:(id)a3
{
  return [(MRAVEndpointObserver *)self initWithOutputDeviceUID:a3 label:@"None Specified" callback:0];
}

- (MRAVEndpointObserver)initWithOutputDeviceUID:(id)a3 label:(id)a4 callback:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)MRAVEndpointObserver;
  v12 = [(MRAVEndpointObserver *)&v18 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_outputDeviceUID, a3);
    objc_storeStrong((id *)&v13->_label, a4);
    uint64_t v14 = [v11 copy];
    id endpointChangedCallback = v13->_endpointChangedCallback;
    v13->_id endpointChangedCallback = (id)v14;

    v16 = +[MRMediaRemoteServiceClient sharedServiceClient];
    [v16 addEndpointObserver:v13];
  }
  return v13;
}

- (void)dealloc
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v3 = _MRLogForCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v7 = self;
    _os_log_impl(&dword_194F3C000, v3, OS_LOG_TYPE_DEFAULT, "[MRAVEndpointObserver] Dealloc %@", buf, 0xCu);
  }

  v4 = +[MRMediaRemoteServiceClient sharedServiceClient];
  [v4 removeEndpointObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)MRAVEndpointObserver;
  [(MRAVEndpointObserver *)&v5 dealloc];
}

- (id)description
{
  id v3 = [NSString alloc];
  uint64_t v4 = objc_opt_class();
  if (self->_didBegin) {
    objc_super v5 = &stru_1EE60E7D8;
  }
  else {
    objc_super v5 = @"NOT ";
  }
  v6 = (void *)[v3 initWithFormat:@"<%@ %p %@:%@ %@Observing>", v4, self, self->_outputDeviceUID, self->_label, v5];

  return v6;
}

- (id)debugDescription
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = [NSString alloc];
  uint64_t v4 = objc_opt_class();
  outputDeviceUID = v2->_outputDeviceUID;
  label = v2->_label;
  if (v2->_didBegin) {
    v7 = @"YES";
  }
  else {
    v7 = @"NO";
  }
  uint64_t v8 = (void *)MEMORY[0x1997190F0](v2->_endpointChangedCallback);
  id v9 = [(MRAVEndpoint *)v2->_endpoint debugName];
  id v10 = MRCreateIndentedDebugDescriptionFromObject(v9);
  id v11 = MRCreateIndentedDebugDescriptionFromObject(v2->_discoverySession);
  v12 = (void *)[v3 initWithFormat:@"<%@ %p {\n   outputDevice=%@\n   label=%@\n   observing=%@\n   callback=%@\n   endpoint=%@\n   discoverySession=%@\n}>\n", v4, v2, outputDeviceUID, label, v7, v8, v10, v11];

  objc_sync_exit(v2);

  return v12;
}

- (void)setEndpointChangedCallback:(id)a3
{
  id v7 = a3;
  uint64_t v4 = self;
  objc_sync_enter(v4);
  uint64_t v5 = [v7 copy];
  id endpointChangedCallback = v4->_endpointChangedCallback;
  v4->_id endpointChangedCallback = (id)v5;

  objc_sync_exit(v4);
}

- (id)endpointChangedCallback
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = (void *)[v2->_endpointChangedCallback copy];
  objc_sync_exit(v2);

  uint64_t v4 = (void *)MEMORY[0x1997190F0](v3);

  return v4;
}

- (void)begin
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  obj = self;
  objc_sync_enter(obj);
  if (obj->_didBegin)
  {
    objc_sync_exit(obj);
  }
  else
  {
    v2 = _MRLogForCategory(0);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v10 = obj;
      _os_log_impl(&dword_194F3C000, v2, OS_LOG_TYPE_DEFAULT, "[MRAVEndpointObserver] Begin Observing %@", buf, 0xCu);
    }

    obj->_didBegin = 1;
    if (obj->_outputDeviceUID)
    {
      discoverySession = obj->_discoverySession;
      if (!discoverySession)
      {
        uint64_t v4 = -[MRAVEndpointObserver _initializeDiscoverySession](obj);
        uint64_t v5 = obj->_discoverySession;
        obj->_discoverySession = (MRAVRoutingDiscoverySession *)v4;

        discoverySession = obj->_discoverySession;
      }
      [(MRAVRoutingDiscoverySession *)discoverySession setDiscoveryMode:2];
    }
    v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    id v7 = +[MRAVOutputContext sharedAudioPresentationContext];
    [v6 addObserver:obj selector:sel__handleOutputContextDidChangeNotification name:@"kMRAVOutputContextDevicesDidChangeNotification" object:v7];

    objc_sync_exit(obj);
    -[MRAVEndpointObserver _reevaluateEndpoint](obj);
  }
}

- (id)_initializeDiscoverySession
{
  if (a1)
  {
    v2 = +[MRAVRoutingDiscoverySession discoverySessionWithEndpointFeatures:8];
    objc_initWeak(&location, a1);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __51__MRAVEndpointObserver__initializeDiscoverySession__block_invoke;
    v5[3] = &unk_1E57D1860;
    objc_copyWeak(&v6, &location);
    id v3 = (id)[v2 addEndpointsChangedCallback:v5];
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (void)_reevaluateEndpoint
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return;
  }
  v1 = a1;
  objc_sync_enter(v1);
  v2 = -[MRAVEndpointObserver _endpointContainingOutputDevice:](v1, v1[5]);
  id v3 = [v2 uniqueIdentifier];
  uint64_t v4 = [v1[6] uniqueIdentifier];
  id v5 = v3;
  id v6 = v4;
  if (v5 == v6)
  {
  }
  else
  {
    id v7 = v6;
    char v8 = [v5 isEqual:v6];

    if ((v8 & 1) == 0)
    {
      id v9 = _MRLogForCategory(0);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        id v10 = [v1[6] uniqueIdentifier];
        uint64_t v11 = [v1[6] localizedName];
        v12 = [v2 uniqueIdentifier];
        v13 = [v2 localizedName];
        int v17 = 138413314;
        objc_super v18 = v1;
        __int16 v19 = 2112;
        v20 = v10;
        __int16 v21 = 2114;
        v22 = v11;
        __int16 v23 = 2112;
        v24 = v12;
        __int16 v25 = 2114;
        v26 = v13;
        _os_log_impl(&dword_194F3C000, v9, OS_LOG_TYPE_DEFAULT, "[MRAVEndpointObserver] %@ endpoint changed from <%@> (<%{public}@>) to <%@> (<%{public}@>)", (uint8_t *)&v17, 0x34u);
      }
      if ([v2 isLocalEndpoint])
      {
        id v14 = +[MRAVLocalEndpoint sharedLocalEndpoint];
      }
      else
      {
        id v14 = v2;
      }
      id v16 = v1[6];
      v1[6] = v14;

      v15 = (void (**)(void, void))[v1[3] copy];
      goto LABEL_12;
    }
  }
  v15 = 0;
LABEL_12:
  objc_sync_exit(v1);

  if (v15) {
    ((void (**)(void, void *))v15)[2](v15, v2);
  }
}

void __51__MRAVEndpointObserver__initializeDiscoverySession__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v4 = WeakRetained;
  if (WeakRetained) {
    -[MRAVEndpointObserver _handleEndpointsDidChange:](WeakRetained, v5);
  }
}

- (void)_handleEndpointsDidChange:(void *)a1
{
  id v6 = a2;
  if (a1)
  {
    id v3 = a1;
    objc_sync_enter(v3);
    uint64_t v4 = [v6 copy];
    id v5 = (void *)v3[2];
    v3[2] = v4;

    objc_sync_exit(v3);
    -[MRAVEndpointObserver _reevaluateEndpoint](v3);
  }
}

- (void)end
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v2 = self;
  objc_sync_enter(v2);
  if (v2->_didBegin)
  {
    id v3 = _MRLogForCategory(0);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138412290;
      id v7 = v2;
      _os_log_impl(&dword_194F3C000, v3, OS_LOG_TYPE_DEFAULT, "[MRAVEndpointObserver] End Observing %@", (uint8_t *)&v6, 0xCu);
    }

    v2->_didBegin = 0;
    if (v2->_outputDeviceUID) {
      [(MRAVRoutingDiscoverySession *)v2->_discoverySession setDiscoveryMode:0];
    }
    uint64_t v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    id v5 = +[MRAVOutputContext sharedAudioPresentationContext];
    [v4 removeObserver:v2 name:@"kMRAVOutputContextDevicesDidChangeNotification" object:v5];
  }
  objc_sync_exit(v2);
}

- (void)_endpointContainingOutputDevice:(void *)a1
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    objc_msgSend(v4, "addObjectsFromArray:", a1[2], 0);
    a1 = (void *)[v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (a1)
    {
      uint64_t v5 = *(void *)v10;
      while (2)
      {
        int v6 = 0;
        do
        {
          if (*(void *)v10 != v5) {
            objc_enumerationMutation(v4);
          }
          id v7 = *(void **)(*((void *)&v9 + 1) + 8 * (void)v6);
          if ([v7 containsOutputDeviceWithUID:v3])
          {
            a1 = v7;
            goto LABEL_12;
          }
          int v6 = (void *)((char *)v6 + 1);
        }
        while (a1 != v6);
        a1 = (void *)[v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
        if (a1) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }

  return a1;
}

- (NSString)outputDeviceUID
{
  return self->_outputDeviceUID;
}

- (MRAVEndpoint)endpoint
{
  return self->_endpoint;
}

- (NSString)label
{
  return self->_label;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_endpoint, 0);
  objc_storeStrong((id *)&self->_outputDeviceUID, 0);
  objc_storeStrong(&self->_endpointChangedCallback, 0);
  objc_storeStrong((id *)&self->_endpoints, 0);

  objc_storeStrong((id *)&self->_discoverySession, 0);
}

@end