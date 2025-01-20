@interface MRDistantExternalDevice
+ (id)_notificationSerialQueue;
+ (id)clientInterface;
+ (id)serviceInterface;
- (BOOL)hasEverAttemptedToConnect;
- (BOOL)isPaired;
- (BOOL)isUsingSystemPairing;
- (BOOL)isValid;
- (BOOL)wantsEndpointChangeNotifications;
- (BOOL)wantsNowPlayingArtworkNotifications;
- (BOOL)wantsNowPlayingNotifications;
- (BOOL)wantsOutputDeviceNotifications;
- (BOOL)wantsSystemEndpointNotifications;
- (BOOL)wantsVolumeNotifications;
- (MRAVDistantEndpoint)distantEndpoint;
- (MRDeviceInfo)deviceInfo;
- (MRDistantExternalDevice)initWithExternalDeviceListenerEndpoint:(id)a3 endpoint:(id)a4;
- (MRExternalOutputContextDataSource)externalOutputContext;
- (NSString)debugDescription;
- (NSString)description;
- (NSXPCConnection)hostedExternalDeviceConnection;
- (NSXPCListenerEndpoint)listenerEndpoint;
- (OS_dispatch_queue)connectionStateCallbackQueue;
- (OS_dispatch_queue)customDataCallbackQueue;
- (OS_dispatch_queue)volumeCallbackQueue;
- (id)_hostedExternalDeviceConnection;
- (id)_hostedExternalDeviceConnectionWithError:(uint64_t)a1;
- (id)_nullableHostedExternalDeviceConnection;
- (id)_remoteObjectProxyWithErrorHandler:(void *)a1;
- (id)_synchronousObjectProxyWithErrorHandler:(void *)a1;
- (id)connectionStateCallback;
- (id)customDataCallback;
- (id)customOrigin;
- (id)groupSessionToken;
- (id)hostName;
- (id)name;
- (id)personalOutputDevices;
- (id)subscribedPlayerPaths;
- (id)supportedMessages;
- (id)uid;
- (id)volumeCallback;
- (int64_t)port;
- (uint64_t)deviceNotifications;
- (unint64_t)callbacks;
- (unint64_t)notifications;
- (unsigned)connectionState;
- (void)_disconnectWithError:(uint64_t)a1;
- (void)_onSerialQueue_callAllPendingCompletionsWithError:(uint64_t)a1;
- (void)_onSerialQueue_handleConnectionStateDidChange:(void *)a3 withError:;
- (void)_onSerialQueue_prepareToConnectWithOptions:(void *)a3 userInfo:(void *)a4 connectionAttemptDetails:(void *)a5 connectionHandler:;
- (void)_updateHostedDeviceDesiredCallbacks:(uint64_t)a1;
- (void)_updateHostedDeviceDesiredNotifications:(uint64_t)a1;
- (void)adjustOutputDeviceVolume:(int64_t)a3 outputDeviceUID:(id)a4 details:(id)a5 queue:(id)a6 completion:(id)a7;
- (void)connectWithOptions:(unsigned int)a3 userInfo:(id)a4 completion:(id)a5;
- (void)createHostedEndpointWithOutputDeviceUIDs:(id)a3 queue:(id)a4 completion:(id)a5;
- (void)dealloc;
- (void)disconnect:(id)a3;
- (void)discoveryOutputDevicesChanged:(id)a3 forConfiguration:(id)a4;
- (void)hostedExternalDeviceConnectionStateDidChange:(unsigned int)a3 withError:(id)a4;
- (void)hostedExternalDeviceDeviceInfoDidChange:(id)a3;
- (void)hostedExternalDeviceDidAddOutputDevice:(id)a3;
- (void)hostedExternalDeviceDidChangeOutputDevice:(id)a3;
- (void)hostedExternalDeviceDidReceiveCustomData:(id)a3 withName:(id)a4;
- (void)hostedExternalDeviceDidRemoveOutputDevice:(id)a3;
- (void)hostedExternalDeviceEndpointDidChange:(id)a3;
- (void)hostedExternalDeviceIsMutedDidChange:(BOOL)a3 forOutputDevice:(id)a4;
- (void)hostedExternalDeviceVolumeCapabilitiesDidChange:(unsigned int)a3 forOutputDevice:(id)a4;
- (void)hostedExternalDeviceVolumeDidChange:(float)a3 forOutputDevice:(id)a4;
- (void)modifyTopologyWithRequest:(id)a3 withReplyQueue:(id)a4 completion:(id)a5;
- (void)muteOutputDeviceVolume:(BOOL)a3 outputDeviceUID:(id)a4 details:(id)a5 queue:(id)a6 completion:(id)a7;
- (void)outputDeviceVolume:(id)a3 queue:(id)a4 completion:(id)a5;
- (void)outputDeviceVolumeControlCapabilities:(id)a3 queue:(id)a4 completion:(id)a5;
- (void)ping:(double)a3 callback:(id)a4 withQueue:(id)a5;
- (void)removeFromParentGroup:(id)a3 queue:(id)a4 completion:(id)a5;
- (void)requestGroupSessionWithDetails:(id)a3 queue:(id)a4 completion:(id)a5;
- (void)sendButtonEvent:(_MRHIDButtonEvent)a3;
- (void)sendCustomData:(id)a3 withName:(id)a4;
- (void)setConnectionState:(uint64_t)a1;
- (void)setConnectionStateCallback:(id)a3;
- (void)setConnectionStateCallback:(id)a3 withQueue:(id)a4;
- (void)setConnectionStateCallbackQueue:(id)a3;
- (void)setConversationDetectionEnabled:(BOOL)a3 outputDeviceUID:(id)a4 queue:(id)a5 completion:(id)a6;
- (void)setCustomDataCallback:(id)a3;
- (void)setCustomDataCallback:(id)a3 withQueue:(id)a4;
- (void)setCustomDataCallbackQueue:(id)a3;
- (void)setDeviceInfo:(id)a3;
- (void)setDiscoveryMode:(unsigned int)a3 forConfiguration:(id)a4;
- (void)setDistantEndpoint:(id)a3;
- (void)setExternalOutputContext:(id)a3;
- (void)setHostedExternalDeviceConnection:(id)a3;
- (void)setListeningMode:(id)a3 outputDeviceUID:(id)a4 queue:(id)a5 completion:(id)a6;
- (void)setOutputDeviceVolume:(float)a3 outputDeviceUID:(id)a4 details:(id)a5 queue:(id)a6 completion:(id)a7;
- (void)setSubscribedPlayerPaths:(id)a3;
- (void)setVolumeCallback:(id)a3;
- (void)setVolumeCallback:(id)a3 withQueue:(id)a4;
- (void)setVolumeCallbackQueue:(id)a3;
- (void)setWantsEndpointChangeNotifications:(BOOL)a3;
- (void)setWantsNowPlayingNotifications:(BOOL)a3;
- (void)setWantsOutputDeviceNotifications:(BOOL)a3;
- (void)setWantsSystemEndpointNotifications:(BOOL)a3;
- (void)setWantsVolumeNotifications:(BOOL)a3;
@end

@implementation MRDistantExternalDevice

+ (id)serviceInterface
{
  v26[2] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EE6B6978];
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  v26[0] = objc_opt_class();
  v26[1] = objc_opt_class();
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:2];
  v5 = [v3 setWithArray:v4];
  [v2 setClasses:v5 forSelector:sel_getPersonalOutputDevices_ argumentIndex:0 ofReply:1];

  v6 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v25 = objc_opt_class();
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v25 count:1];
  v8 = [v6 setWithArray:v7];
  [v2 setClasses:v8 forSelector:sel_getExternalOutputContextWithCompletion_ argumentIndex:0 ofReply:1];

  v9 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v24 = objc_opt_class();
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v24 count:1];
  v11 = [v9 setWithArray:v10];
  [v2 setClasses:v11 forSelector:sel_getDeviceInfoWithCompletion_ argumentIndex:0 ofReply:1];

  v12 = (void *)MEMORY[0x1E4F1CAD0];
  v23[0] = objc_opt_class();
  v23[1] = objc_opt_class();
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];
  v14 = [v12 setWithArray:v13];
  [v2 setClasses:v14 forSelector:sel_setSubscribedPlayerPaths_ argumentIndex:0 ofReply:0];

  v15 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  [v2 setClasses:v15 forSelector:sel_setListeningMode_outputDeviceUID_completion_ argumentIndex:0 ofReply:1];

  v16 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  [v2 setClasses:v16 forSelector:sel_setOutputDeviceVolume_outputDeviceUID_details_completion_ argumentIndex:2 ofReply:0];

  v17 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  [v2 setClasses:v17 forSelector:sel_adjustOutputDeviceVolume_outputDeviceUID_details_completion_ argumentIndex:2 ofReply:0];

  v18 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  [v2 setClasses:v18 forSelector:sel_muteOutputDeviceVolume_outputDeviceUID_details_completion_ argumentIndex:2 ofReply:0];

  v19 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  [v2 setClasses:v19 forSelector:sel_requestGroupSessionWithDetails_completion_ argumentIndex:0 ofReply:0];

  v20 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  [v2 setClasses:v20 forSelector:sel_requestGroupSessionWithDetails_completion_ argumentIndex:0 ofReply:1];

  v21 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  [v2 setClasses:v21 forSelector:sel_requestGroupSessionWithDetails_completion_ argumentIndex:1 ofReply:1];

  return v2;
}

+ (id)clientInterface
{
  v12[1] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EE67E728];
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  v12[0] = objc_opt_class();
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  v5 = [v3 setWithArray:v4];
  [v2 setClasses:v5 forSelector:sel_hostedExternalDeviceDeviceInfoDidChange_ argumentIndex:0 ofReply:0];

  v6 = (void *)MEMORY[0x1E4F1CAD0];
  v11[0] = objc_opt_class();
  v11[1] = objc_opt_class();
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
  v8 = objc_msgSend(v6, "setWithArray:", v7, v11[0]);
  [v2 setClasses:v8 forSelector:sel_discoveryOutputDevicesChanged_forConfiguration_ argumentIndex:0 ofReply:0];

  v9 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  [v2 setClasses:v9 forSelector:sel_discoveryOutputDevicesChanged_forConfiguration_ argumentIndex:1 ofReply:0];

  return v2;
}

- (MRDistantExternalDevice)initWithExternalDeviceListenerEndpoint:(id)a3 endpoint:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v26.receiver = self;
  v26.super_class = (Class)MRDistantExternalDevice;
  v8 = [(MRExternalDevice *)&v26 _init];
  if (v8)
  {
    id v9 = (id) [[NSString alloc] initWithFormat:@"com.apple.mediaremote.%@.serialQueue", objc_opt_class()];
    v10 = (const char *)[v9 UTF8String];
    v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v12 = dispatch_queue_create(v10, v11);
    serialQueue = v8->_serialQueue;
    v8->_serialQueue = (OS_dispatch_queue *)v12;

    id v14 = (id) [[NSString alloc] initWithFormat:@"com.apple.mediaremote.%@.workerQueue", objc_opt_class()];
    v15 = (const char *)[v14 UTF8String];
    v16 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v17 = dispatch_queue_create(v15, v16);
    workerQueue = v8->_workerQueue;
    v8->_workerQueue = (OS_dispatch_queue *)v17;

    v19 = [MRAVDistantEndpoint alloc];
    v20 = [v7 descriptor];
    uint64_t v21 = [(MRAVDistantEndpoint *)v19 initWithDescriptor:v20];
    onLock_distantEndpoint = v8->_onLock_distantEndpoint;
    v8->_onLock_distantEndpoint = (MRAVDistantEndpoint *)v21;

    v8->_lock._os_unfair_lock_opaque = 0;
    v8->_deviceNotifications = 15;
    v8->_onLock_connectionState = 3;
    v8->_connectionOptions = 0;
    v23 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithListenerEndpoint:v6];
    [(MRDistantExternalDevice *)v8 setHostedExternalDeviceConnection:v23];

    uint64_t v24 = +[MRMediaRemoteServiceClient sharedServiceClient];
    [v24 addDistantExternalDevice:v8];
  }
  return v8;
}

- (void)setHostedExternalDeviceConnection:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_initWeak(&location, self);
  p_hostedExternalDeviceConnection = (id *)&self->_hostedExternalDeviceConnection;
  if (self->_hostedExternalDeviceConnection)
  {
    id v7 = _MRLogForCategory(0);
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    id v8 = *p_hostedExternalDeviceConnection;
    *(_DWORD *)buf = 138544130;
    v28 = self;
    __int16 v29 = 2114;
    v30 = @"HostedExternalDeviceConnection";
    __int16 v31 = 2112;
    id v32 = v8;
    __int16 v33 = 2112;
    id v34 = v5;
    id v9 = "Set: %{public}@ setting %{public}@ from <%@> to <%@>";
    v10 = v7;
    uint32_t v11 = 42;
  }
  else
  {
    id v7 = _MRLogForCategory(0);
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    *(_DWORD *)buf = 138543874;
    v28 = self;
    __int16 v29 = 2114;
    v30 = @"HostedExternalDeviceConnection";
    __int16 v31 = 2112;
    id v32 = v5;
    id v9 = "Set: %{public}@ setting %{public}@ to <%@>";
    v10 = v7;
    uint32_t v11 = 32;
  }
  _os_log_impl(&dword_194F3C000, v10, OS_LOG_TYPE_DEFAULT, v9, buf, v11);
LABEL_7:

  if (v5)
  {
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __61__MRDistantExternalDevice_setHostedExternalDeviceConnection___block_invoke;
    v24[3] = &unk_1E57D12D0;
    objc_copyWeak(&v25, &location);
    dispatch_queue_t v12 = (void *)MEMORY[0x1997190F0](v24);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __61__MRDistantExternalDevice_setHostedExternalDeviceConnection___block_invoke_2;
    v22[3] = &unk_1E57D12D0;
    objc_copyWeak(&v23, &location);
    v13 = (void *)MEMORY[0x1997190F0](v22);
    objc_storeStrong((id *)&self->_hostedExternalDeviceConnection, a3);
    id v14 = [(id)objc_opt_class() serviceInterface];
    [*p_hostedExternalDeviceConnection setRemoteObjectInterface:v14];

    v15 = [(id)objc_opt_class() clientInterface];
    [*p_hostedExternalDeviceConnection setExportedInterface:v15];

    v16 = [*p_hostedExternalDeviceConnection exportedInterface];
    dispatch_queue_t v17 = [v16 protocol];
    v18 = +[MRWeakProxy weakProxyWithObject:self protocol:v17];
    [*p_hostedExternalDeviceConnection setExportedObject:v18];

    [*p_hostedExternalDeviceConnection setInvalidationHandler:v12];
    [*p_hostedExternalDeviceConnection setInterruptionHandler:v13];
    [*p_hostedExternalDeviceConnection resume];
    unint64_t deviceNotifications = self->_deviceNotifications;
    if (deviceNotifications) {
      -[MRDistantExternalDevice _updateHostedDeviceDesiredNotifications:]((uint64_t)self, deviceNotifications);
    }
    unint64_t callbacks = self->_callbacks;
    if (callbacks) {
      -[MRDistantExternalDevice _updateHostedDeviceDesiredCallbacks:]((uint64_t)self, callbacks);
    }
    if (self->_subscribedPlayerPaths) {
      -[MRDistantExternalDevice setSubscribedPlayerPaths:](self, "setSubscribedPlayerPaths:");
    }

    objc_destroyWeak(&v23);
    objc_destroyWeak(&v25);
  }
  else
  {
    [*p_hostedExternalDeviceConnection invalidate];
    id v21 = *p_hostedExternalDeviceConnection;
    id *p_hostedExternalDeviceConnection = 0;
  }
  objc_destroyWeak(&location);
}

void __61__MRDistantExternalDevice_setHostedExternalDeviceConnection___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v1 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithMRError:1 description:@"xpc invalidation"];
    -[MRDistantExternalDevice _disconnectWithError:]((uint64_t)WeakRetained, v1);
  }
}

- (void)_disconnectWithError:(uint64_t)a1
{
  id v3 = a2;
  v4 = v3;
  if (a1)
  {
    id v5 = *(NSObject **)(a1 + 56);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __48__MRDistantExternalDevice__disconnectWithError___block_invoke;
    v6[3] = &unk_1E57D0790;
    v6[4] = a1;
    id v7 = v3;
    dispatch_async(v5, v6);
  }
}

void __61__MRDistantExternalDevice_setHostedExternalDeviceConnection___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v1 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithMRError:1 description:@"xpc interruption"];
    -[MRDistantExternalDevice _disconnectWithError:]((uint64_t)WeakRetained, v1);
  }
}

- (void)_updateHostedDeviceDesiredNotifications:(uint64_t)a1
{
  if (a1)
  {
    v4 = -[MRDistantExternalDevice _nullableHostedExternalDeviceConnection](a1);
    id v5 = v4;
    if (v4)
    {
      id v6 = *(NSObject **)(a1 + 56);
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __67__MRDistantExternalDevice__updateHostedDeviceDesiredNotifications___block_invoke;
      v7[3] = &unk_1E57D2098;
      id v8 = v4;
      uint64_t v9 = a2;
      dispatch_async(v6, v7);
    }
  }
}

- (void)_updateHostedDeviceDesiredCallbacks:(uint64_t)a1
{
  if (a1)
  {
    v4 = -[MRDistantExternalDevice _nullableHostedExternalDeviceConnection](a1);
    id v5 = v4;
    if (v4)
    {
      id v6 = *(NSObject **)(a1 + 56);
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __63__MRDistantExternalDevice__updateHostedDeviceDesiredCallbacks___block_invoke;
      v7[3] = &unk_1E57D2098;
      id v8 = v4;
      uint64_t v9 = a2;
      dispatch_async(v6, v7);
    }
  }
}

- (void)dealloc
{
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithMRError:123];
  -[MRDistantExternalDevice _onSerialQueue_callAllPendingCompletionsWithError:]((uint64_t)self, v3);
  [(NSXPCConnection *)self->_hostedExternalDeviceConnection setInvalidationHandler:0];
  [(NSXPCConnection *)self->_hostedExternalDeviceConnection setInterruptionHandler:0];
  [(NSXPCConnection *)self->_hostedExternalDeviceConnection invalidate];
  v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self];

  id v5 = +[MRMediaRemoteServiceClient sharedServiceClient];
  [v5 removeDistantExternalDevice:self];

  v6.receiver = self;
  v6.super_class = (Class)MRDistantExternalDevice;
  [(MRDistantExternalDevice *)&v6 dealloc];
}

- (void)_onSerialQueue_callAllPendingCompletionsWithError:(uint64_t)a1
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    v4 = (void *)[*(id *)(a1 + 144) copy];
    [*(id *)(a1 + 144) removeAllObjects];
    unint64_t v5 = 0x1E4F29000uLL;
    if ((unint64_t)[v4 count] >= 2)
    {
      objc_super v6 = (void *)[[NSString alloc] initWithFormat:@"Calling batched completions %@", v4];
      id v7 = _MRLogForCategory(0xAuLL);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        id v8 = [v4 firstObject];
        uint64_t v9 = [v8 requestID];
        *(_DWORD *)buf = 138543874;
        __int16 v33 = @"DistantExternalDevice.connectWithOptions";
        __int16 v34 = 2114;
        uint64_t v35 = v9;
        __int16 v36 = 2112;
        id v37 = v6;
        _os_log_impl(&dword_194F3C000, v7, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
      }
    }
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id obj = v4;
    uint64_t v10 = [obj countByEnumeratingWithState:&v28 objects:v40 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v29 != v12) {
            objc_enumerationMutation(obj);
          }
          id v14 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          uint64_t v15 = qos_class_self();
          if ([v14 qos] != v15)
          {
            v16 = objc_msgSend(objc_alloc(*(Class *)(v5 + 24)), "initWithFormat:", @"priority degraded from %u -> %u", objc_msgSend(v14, "qos"), v15);
            dispatch_queue_t v17 = _MRLogForCategory(0xAuLL);
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
            {
              v18 = [v14 requestID];
              *(_DWORD *)buf = 138543874;
              __int16 v33 = @"DistantExternalDevice.connectWithOptions";
              __int16 v34 = 2114;
              uint64_t v35 = v18;
              __int16 v36 = 2112;
              id v37 = v16;
              _os_log_impl(&dword_194F3C000, v17, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
            }
          }
          v19 = _MRLogForCategory(0xAuLL);
          v20 = v19;
          if (v3)
          {
            if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
              goto LABEL_21;
            }
            id v21 = [v14 requestID];
            v22 = [MEMORY[0x1E4F1C9C8] date];
            id v23 = [v14 startDate];
            [v22 timeIntervalSinceDate:v23];
            *(_DWORD *)buf = 138544130;
            __int16 v33 = @"DistantExternalDevice.connectWithOptions";
            __int16 v34 = 2114;
            uint64_t v35 = v21;
            __int16 v36 = 2114;
            id v37 = v3;
            __int16 v38 = 2048;
            uint64_t v39 = v24;
            _os_log_error_impl(&dword_194F3C000, v20, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> in %.4lf seconds", buf, 0x2Au);
          }
          else
          {
            if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_21;
            }
            id v21 = [v14 requestID];
            v22 = [MEMORY[0x1E4F1C9C8] date];
            id v23 = [v14 startDate];
            [v22 timeIntervalSinceDate:v23];
            *(_DWORD *)buf = 138543874;
            __int16 v33 = @"DistantExternalDevice.connectWithOptions";
            __int16 v34 = 2114;
            uint64_t v35 = v21;
            __int16 v36 = 2048;
            id v37 = v25;
            _os_log_impl(&dword_194F3C000, v20, OS_LOG_TYPE_DEFAULT, "Response: %{public}@<%{public}@> returned in %.4lf seconds", buf, 0x20u);
          }

          unint64_t v5 = 0x1E4F29000;
LABEL_21:

          objc_super v26 = [v14 completion];
          ((void (**)(void, id))v26)[2](v26, v3);
        }
        uint64_t v11 = [obj countByEnumeratingWithState:&v28 objects:v40 count:16];
      }
      while (v11);
    }
  }
}

- (NSString)description
{
  id v3 = (void *)MEMORY[0x1E4F28E78];
  uint64_t v4 = objc_opt_class();
  unint64_t v5 = [(MRDistantExternalDevice *)self distantEndpoint];
  objc_super v6 = [v5 debugName];
  id v7 = (__CFString *)MRExternalDeviceConnectionStateCopyDescription([(MRDistantExternalDevice *)self connectionState]);
  id v8 = [v3 stringWithFormat:@"<%@:%p %@ (%@)>", v4, self, v6, v7];

  return (NSString *)v8;
}

- (NSString)debugDescription
{
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__5;
  uint64_t v15 = __Block_byref_object_dispose__5;
  id v16 = 0;
  id v3 = [(MRDistantExternalDevice *)self distantEndpoint];
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__MRDistantExternalDevice_debugDescription__block_invoke;
  block[3] = &unk_1E57D1C88;
  id v9 = v3;
  uint64_t v10 = &v11;
  block[4] = self;
  id v5 = v3;
  dispatch_sync(serialQueue, block);
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);

  return (NSString *)v6;
}

uint64_t __43__MRDistantExternalDevice_debugDescription__block_invoke(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x1E4F28E78]);
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(v4 + 248);
  id v6 = [*(id *)(a1 + 40) debugName];
  uint64_t v7 = [v2 initWithFormat:@"<%@:%p {\n hostedExternalDeviceConnection = %@\n endpoint = %@\n", v3, v4, v5, v6];
  uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 72));
  uint64_t v10 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  uint64_t v11 = (__CFString *)MRExternalDeviceConnectionStateCopyDescription(*(_DWORD *)(*(void *)(a1 + 32) + 168));
  [v10 appendFormat:@" %@", v11];

  uint64_t v12 = *(void *)(a1 + 32);
  uint64_t v13 = *(void **)(v12 + 160);
  if (v13)
  {
    id v14 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    [v13 timeIntervalSinceNow];
    [v14 appendFormat:@"(%@ %f seconds ago)\n", v13, -v15];
    uint64_t v12 = *(void *)(a1 + 32);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(v12 + 72));
  uint64_t v16 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v16 + 184))
  {
    dispatch_queue_t v17 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    v18 = *(void **)(v16 + 96);
    [v18 timeIntervalSinceNow];
    [v17 appendFormat:@" attemptedToConnect=YES (%@ %lf seconds ago)\n", v18, -v19];
    uint64_t v16 = *(void *)(a1 + 32);
  }
  if (*(unsigned char *)(v16 + 112))
  {
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) appendString:@" attemptedToConnectWhileInvalid=YES\n"];
    uint64_t v16 = *(void *)(a1 + 32);
  }
  uint64_t v20 = *(void *)(v16 + 104);
  if (v20)
  {
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) appendFormat:@" customOrigin=%@\n", v20];
    uint64_t v16 = *(void *)(a1 + 32);
  }
  id v21 = *(void **)(v16 + 128);
  if (v21)
  {
    v22 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    id v23 = [v21 description];
    uint64_t v24 = objc_msgSend(v23, "mr_formattedDebugDescription");
    [v22 appendFormat:@" externalOutputContext=%@\n", v24];

    uint64_t v16 = *(void *)(a1 + 32);
  }
  if ([*(id *)(v16 + 144) count])
  {
    id v25 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    objc_super v26 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 144), "mr_formattedDebugDescription");
    [v25 appendFormat:@"  pendingCompletions = %@", v26];
  }
  v27 = *(void **)(*(void *)(a1 + 32) + 128);
  if (v27)
  {
    long long v28 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    long long v29 = objc_msgSend(v27, "mr_formattedDebugDescription");
    [v28 appendFormat:@" externalOutputContext debug=%@\n", v29];
  }
  long long v30 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);

  return [v30 appendString:@"}>"];
}

- (MRAVDistantEndpoint)distantEndpoint
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v4 = self->_onLock_distantEndpoint;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)setDistantEndpoint:(id)a3
{
  uint64_t v4 = (MRAVDistantEndpoint *)a3;
  os_unfair_lock_lock(&self->_lock);
  onLock_distantEndpoint = self->_onLock_distantEndpoint;
  self->_onLock_distantEndpoint = v4;
  id v6 = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSXPCListenerEndpoint)listenerEndpoint
{
  id v2 = -[MRDistantExternalDevice _nullableHostedExternalDeviceConnection]((uint64_t)self);
  uint64_t v3 = [v2 endpoint];

  return (NSXPCListenerEndpoint *)v3;
}

- (id)_nullableHostedExternalDeviceConnection
{
  if (a1)
  {
    uint64_t v3 = 0;
    uint64_t v4 = &v3;
    uint64_t v5 = 0x3032000000;
    id v6 = __Block_byref_object_copy__5;
    uint64_t v7 = __Block_byref_object_dispose__5;
    id v8 = 0;
    msv_dispatch_sync_on_queue();
    id v1 = (id)v4[5];
    _Block_object_dispose(&v3, 8);
  }
  else
  {
    id v1 = 0;
  }

  return v1;
}

- (BOOL)isValid
{
  id v2 = -[MRDistantExternalDevice _hostedExternalDeviceConnection](self);
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)_hostedExternalDeviceConnection
{
  if (a1)
  {
    a1 = -[MRDistantExternalDevice _hostedExternalDeviceConnectionWithError:]((uint64_t)a1, 0);
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)name
{
  id v2 = [(MRDistantExternalDevice *)self distantEndpoint];
  BOOL v3 = [v2 localizedName];

  return v3;
}

- (id)hostName
{
  return 0;
}

- (int64_t)port
{
  return 0;
}

- (id)uid
{
  id v2 = [(MRDistantExternalDevice *)self deviceInfo];
  BOOL v3 = [v2 WHAIdentifier];

  return v3;
}

- (BOOL)wantsNowPlayingNotifications
{
  return -[MRDistantExternalDevice deviceNotifications]((uint64_t)self) & 1;
}

- (uint64_t)deviceNotifications
{
  if (!a1) {
    return 0;
  }
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  uint64_t v1 = *(NSObject **)(a1 + 64);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __46__MRDistantExternalDevice_deviceNotifications__block_invoke;
  v4[3] = &unk_1E57D0590;
  v4[4] = a1;
  v4[5] = &v5;
  dispatch_sync(v1, v4);
  uint64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)setWantsNowPlayingNotifications:(BOOL)a3
{
  serialQueue = self->_serialQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __59__MRDistantExternalDevice_setWantsNowPlayingNotifications___block_invoke;
  v4[3] = &unk_1E57D1CB0;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(serialQueue, v4);
}

void __59__MRDistantExternalDevice_setWantsNowPlayingNotifications___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 88) = *(void *)(*(void *)(a1 + 32) + 88) & 0xFFFFFFFFFFFFFFFELL | *(unsigned __int8 *)(a1 + 40);
  -[MRDistantExternalDevice _updateHostedDeviceDesiredNotifications:](*(void *)(a1 + 32), *(void *)(*(void *)(a1 + 32) + 88));
}

- (BOOL)wantsNowPlayingArtworkNotifications
{
  return 0;
}

- (BOOL)wantsVolumeNotifications
{
  return ((unint64_t)-[MRDistantExternalDevice deviceNotifications]((uint64_t)self) >> 1) & 1;
}

- (void)setWantsVolumeNotifications:(BOOL)a3
{
  serialQueue = self->_serialQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __55__MRDistantExternalDevice_setWantsVolumeNotifications___block_invoke;
  v4[3] = &unk_1E57D1CB0;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(serialQueue, v4);
}

void __55__MRDistantExternalDevice_setWantsVolumeNotifications___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 88) = *(void *)(*(void *)(a1 + 32) + 88) & 0xFFFFFFFFFFFFFFFDLL | -*(unsigned __int8 *)(a1 + 40) & 2;
  -[MRDistantExternalDevice _updateHostedDeviceDesiredNotifications:](*(void *)(a1 + 32), *(void *)(*(void *)(a1 + 32) + 88));
}

- (BOOL)wantsOutputDeviceNotifications
{
  return ((unint64_t)-[MRDistantExternalDevice deviceNotifications]((uint64_t)self) >> 2) & 1;
}

- (void)setWantsOutputDeviceNotifications:(BOOL)a3
{
  serialQueue = self->_serialQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __61__MRDistantExternalDevice_setWantsOutputDeviceNotifications___block_invoke;
  v4[3] = &unk_1E57D1CB0;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(serialQueue, v4);
}

void __61__MRDistantExternalDevice_setWantsOutputDeviceNotifications___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 88) = *(void *)(*(void *)(a1 + 32) + 88) & 0xFFFFFFFFFFFFFFFBLL | -*(unsigned __int8 *)(a1 + 40) & 4;
  -[MRDistantExternalDevice _updateHostedDeviceDesiredNotifications:](*(void *)(a1 + 32), *(void *)(*(void *)(a1 + 32) + 88));
}

- (BOOL)wantsEndpointChangeNotifications
{
  return ((unint64_t)-[MRDistantExternalDevice deviceNotifications]((uint64_t)self) >> 3) & 1;
}

- (void)setWantsEndpointChangeNotifications:(BOOL)a3
{
  serialQueue = self->_serialQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __63__MRDistantExternalDevice_setWantsEndpointChangeNotifications___block_invoke;
  v4[3] = &unk_1E57D1CB0;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(serialQueue, v4);
}

void __63__MRDistantExternalDevice_setWantsEndpointChangeNotifications___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 88) = *(void *)(*(void *)(a1 + 32) + 88) & 0xFFFFFFFFFFFFFFF7 | -*(unsigned __int8 *)(a1 + 40) & 8;
  -[MRDistantExternalDevice _updateHostedDeviceDesiredNotifications:](*(void *)(a1 + 32), *(void *)(*(void *)(a1 + 32) + 88));
}

- (BOOL)wantsSystemEndpointNotifications
{
  return ((unint64_t)-[MRDistantExternalDevice deviceNotifications]((uint64_t)self) >> 4) & 1;
}

- (void)setWantsSystemEndpointNotifications:(BOOL)a3
{
  serialQueue = self->_serialQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __63__MRDistantExternalDevice_setWantsSystemEndpointNotifications___block_invoke;
  v4[3] = &unk_1E57D1CB0;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(serialQueue, v4);
}

void __63__MRDistantExternalDevice_setWantsSystemEndpointNotifications___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 88) = *(void *)(*(void *)(a1 + 32) + 88) & 0xFFFFFFFFFFFFFFEFLL | -*(unsigned __int8 *)(a1 + 40) & 0x10;
  -[MRDistantExternalDevice _updateHostedDeviceDesiredNotifications:](*(void *)(a1 + 32), *(void *)(*(void *)(a1 + 32) + 88));
}

- (id)subscribedPlayerPaths
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__5;
  uint64_t v10 = __Block_byref_object_dispose__5;
  id v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __48__MRDistantExternalDevice_subscribedPlayerPaths__block_invoke;
  v5[3] = &unk_1E57D0590;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __48__MRDistantExternalDevice_subscribedPlayerPaths__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 120) copy];

  return MEMORY[0x1F41817F8]();
}

- (void)setSubscribedPlayerPaths:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__MRDistantExternalDevice_setSubscribedPlayerPaths___block_invoke;
  v7[3] = &unk_1E57D0790;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(serialQueue, v7);
}

void __52__MRDistantExternalDevice_setSubscribedPlayerPaths___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 120);
  *(void *)(v3 + 120) = v2;

  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(NSObject **)(v5 + 56);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__MRDistantExternalDevice_setSubscribedPlayerPaths___block_invoke_2;
  v7[3] = &unk_1E57D0790;
  void v7[4] = v5;
  id v8 = *(id *)(a1 + 40);
  dispatch_async(v6, v7);
}

void __52__MRDistantExternalDevice_setSubscribedPlayerPaths___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 248) remoteObjectProxy];
  [v2 setSubscribedPlayerPaths:*(void *)(a1 + 40)];
}

- (unsigned)connectionState
{
  id v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LODWORD(v2) = v2->_onLock_connectionState;
  os_unfair_lock_unlock(p_lock);
  return v2;
}

- (void)setConnectionState:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    *(_DWORD *)(a1 + 168) = a2;
    uint64_t v4 = [MEMORY[0x1E4F1C9C8] now];
    uint64_t v5 = *(void **)(a1 + 160);
    *(void *)(a1 + 160) = v4;

    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (void)setExternalOutputContext:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = (MRExternalOutputContextDataSource *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  p_externalOutputContext = &self->_externalOutputContext;
  externalOutputContext = self->_externalOutputContext;
  if (externalOutputContext != v6)
  {
    if (v6 && externalOutputContext)
    {
      uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
      [v13 handleFailureInMethod:a2, self, @"MRDistantExternalDevice.m", 492, @"Invalid parameter not satisfying: %@", @"!(externalOutputContext && _externalOutputContext)" object file lineNumber description];
    }
    objc_storeStrong((id *)&self->_externalOutputContext, a3);
    if (*p_externalOutputContext)
    {
      id v9 = MRLogCategoryDiscoveryOversize();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = MSVDeviceOSIsInternalInstall();
        id v11 = *p_externalOutputContext;
        if (v10) {
          [(MROutputContextDataSource *)v11 debugDescription];
        }
        else {
        uint64_t v12 = [(MROutputContextDataSource *)v11 description];
        }
        *(_DWORD *)buf = 138543618;
        double v15 = self;
        __int16 v16 = 2114;
        dispatch_queue_t v17 = v12;
        _os_log_impl(&dword_194F3C000, v9, OS_LOG_TYPE_DEFAULT, "[MRDistantExternalDevice] Distant external device %{public}@ initialized externalOutputContext: %{public}@", buf, 0x16u);
      }
    }
  }
}

- (MRExternalOutputContextDataSource)externalOutputContext
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__5;
  int v10 = __Block_byref_object_dispose__5;
  id v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __48__MRDistantExternalDevice_externalOutputContext__block_invoke;
  v5[3] = &unk_1E57D07E0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (MRExternalOutputContextDataSource *)v3;
}

void __48__MRDistantExternalDevice_externalOutputContext__block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) connectionState];
  id v3 = *(id **)(a1 + 32);
  if (v2 == 2 && !v3[16])
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __48__MRDistantExternalDevice_externalOutputContext__block_invoke_2;
    v7[3] = &unk_1E57D1148;
    void v7[4] = v3;
    uint64_t v4 = -[MRDistantExternalDevice _synchronousObjectProxyWithErrorHandler:](v3, v7);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __48__MRDistantExternalDevice_externalOutputContext__block_invoke_215;
    v6[3] = &unk_1E57D1CD8;
    v6[4] = *(void *)(a1 + 40);
    [v4 getExternalOutputContextWithCompletion:v6];

    uint64_t v5 = +[MRDistantExternalDevice _notificationSerialQueue]();
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setNotificationQueue:v5];

    [*(id *)(a1 + 32) setExternalOutputContext:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
    id v3 = *(id **)(a1 + 32);
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v3[16]);
}

void __48__MRDistantExternalDevice_externalOutputContext__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (v3)
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(NSObject **)(v5 + 64);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __48__MRDistantExternalDevice_externalOutputContext__block_invoke_3;
    v7[3] = &unk_1E57D0790;
    void v7[4] = v5;
    id v8 = v3;
    dispatch_async(v6, v7);
  }
}

void __48__MRDistantExternalDevice_externalOutputContext__block_invoke_3(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v2 = MRLogCategoryConnections();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v5 = 138543618;
    uint64_t v6 = v3;
    __int16 v7 = 2114;
    uint64_t v8 = v4;
    _os_log_impl(&dword_194F3C000, v2, OS_LOG_TYPE_ERROR, "[MRDistantExternalDevice] Distant external device %{public}@ failed to fetch externalOutputContext: %{public}@", (uint8_t *)&v5, 0x16u);
  }
}

- (id)_synchronousObjectProxyWithErrorHandler:(void *)a1
{
  uint64_t v3 = a2;
  if (a1)
  {
    id v10 = 0;
    uint64_t v4 = -[MRDistantExternalDevice _hostedExternalDeviceConnectionWithError:]((uint64_t)a1, &v10);
    id v5 = v10;
    if (v5)
    {
      v3[2](v3, v5);
    }
    else
    {
      if (v4)
      {
        v8[0] = MEMORY[0x1E4F143A8];
        v8[1] = 3221225472;
        v8[2] = __67__MRDistantExternalDevice__synchronousObjectProxyWithErrorHandler___block_invoke;
        v8[3] = &unk_1E57D1DA0;
        v8[4] = a1;
        uint64_t v9 = v3;
        a1 = [v4 synchronousRemoteObjectProxyWithErrorHandler:v8];

        goto LABEL_7;
      }
      __int16 v7 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithMRError:24 format:@"Attempting to query nil distantEndpointConnection"];
      v3[2](v3, v7);
    }
    a1 = 0;
LABEL_7:
  }

  return a1;
}

void __48__MRDistantExternalDevice_externalOutputContext__block_invoke_215(uint64_t a1, void *a2)
{
}

+ (id)_notificationSerialQueue
{
  self;
  if (_notificationSerialQueue___once != -1) {
    dispatch_once(&_notificationSerialQueue___once, &__block_literal_global_21);
  }
  v0 = (void *)_notificationSerialQueue___notificationSerialQueue;

  return v0;
}

- (id)groupSessionToken
{
  int v2 = [(MRDistantExternalDevice *)self deviceInfo];
  uint64_t v3 = [v2 groupSessionToken];

  return v3;
}

- (BOOL)isPaired
{
  return 1;
}

- (BOOL)isUsingSystemPairing
{
  return 1;
}

- (unint64_t)callbacks
{
  uint64_t v6 = 0;
  __int16 v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __36__MRDistantExternalDevice_callbacks__block_invoke;
  v5[3] = &unk_1E57D0590;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __36__MRDistantExternalDevice_callbacks__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 80);
  return result;
}

uint64_t __46__MRDistantExternalDevice_deviceNotifications__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 88);
  return result;
}

- (void)setDeviceInfo:(id)a3
{
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  uint64_t v6 = self->_deviceInfo;
  objc_storeStrong((id *)&self->_deviceInfo, a3);
  if (![(MRDeviceInfo *)v6 isEqual:v5])
  {
    __int16 v7 = objc_opt_new();
    [v7 setObject:v6 forKeyedSubscript:@"MRExternalDevicePreviousDeviceInfoUserInfoKey"];
    [v7 setObject:v5 forKeyedSubscript:@"MRExternalDeviceDeviceInfoUserInfoKey"];
    uint64_t v8 = +[MRDistantExternalDevice _notificationSerialQueue]();
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __41__MRDistantExternalDevice_setDeviceInfo___block_invoke;
    v10[3] = &unk_1E57D0790;
    v10[4] = self;
    id v11 = v7;
    id v9 = v7;
    dispatch_async(v8, v10);
  }
}

void __41__MRDistantExternalDevice_setDeviceInfo___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"MRExternalDeviceDeviceInfoDidChangeNotification" object:*(void *)(a1 + 32) userInfo:*(void *)(a1 + 40)];
}

- (MRDeviceInfo)deviceInfo
{
  uint64_t v6 = 0;
  __int16 v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__5;
  id v10 = __Block_byref_object_dispose__5;
  id v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __37__MRDistantExternalDevice_deviceInfo__block_invoke;
  v5[3] = &unk_1E57D07E0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (MRDeviceInfo *)v3;
}

void __37__MRDistantExternalDevice_deviceInfo__block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = (void *)v2[19];
  if (!v3)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __37__MRDistantExternalDevice_deviceInfo__block_invoke_2;
    v8[3] = &unk_1E57D1148;
    v8[4] = v2;
    uint64_t v4 = -[MRDistantExternalDevice _synchronousObjectProxyWithErrorHandler:](v2, v8);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __37__MRDistantExternalDevice_deviceInfo__block_invoke_219;
    v7[3] = &unk_1E57D1D00;
    void v7[4] = *(void *)(a1 + 32);
    [v4 getDeviceInfoWithCompletion:v7];

    *(void *)(*(void *)(a1 + 32) + 88) |= 0x20uLL;
    if ([*(id *)(*(void *)(a1 + 32) + 152) isCompanion])
    {
      id v5 = +[MRUserSettings currentSettings];
      char v6 = [v5 disablePairedDeviceActiveEndpointSync];

      if ((v6 & 1) == 0) {
        *(void *)(*(void *)(a1 + 32) + 88) |= 0x10uLL;
      }
    }
    -[MRDistantExternalDevice _updateHostedDeviceDesiredNotifications:](*(void *)(a1 + 32), *(void *)(*(void *)(a1 + 32) + 88));
    id v3 = *(void **)(*(void *)(a1 + 32) + 152);
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v3);
}

void __37__MRDistantExternalDevice_deviceInfo__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (v3)
  {
    uint64_t v5 = *(void *)(a1 + 32);
    char v6 = *(NSObject **)(v5 + 64);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __37__MRDistantExternalDevice_deviceInfo__block_invoke_3;
    v7[3] = &unk_1E57D0790;
    void v7[4] = v5;
    id v8 = v3;
    dispatch_async(v6, v7);
  }
}

void __37__MRDistantExternalDevice_deviceInfo__block_invoke_3(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v2 = MRLogCategoryConnections();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v5 = 138543618;
    uint64_t v6 = v3;
    __int16 v7 = 2114;
    uint64_t v8 = v4;
    _os_log_impl(&dword_194F3C000, v2, OS_LOG_TYPE_ERROR, "[MRDistantExternalDevice] Distant external device %{public}@ failed to fetch deviceInfo: %{public}@", (uint8_t *)&v5, 0x16u);
  }
}

void __37__MRDistantExternalDevice_deviceInfo__block_invoke_219(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v5 = *(void *)(a1 + 32);
  if (v4)
  {
    objc_storeStrong((id *)(v5 + 152), a2);
  }
  else
  {
    uint64_t v6 = *(NSObject **)(v5 + 64);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __37__MRDistantExternalDevice_deviceInfo__block_invoke_2_220;
    block[3] = &unk_1E57D0518;
    block[4] = v5;
    dispatch_async(v6, block);
  }
}

void __37__MRDistantExternalDevice_deviceInfo__block_invoke_2_220(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = MRLogCategoryConnections();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 134217984;
    uint64_t v5 = v3;
    _os_log_impl(&dword_194F3C000, v2, OS_LOG_TYPE_ERROR, "[MRDistantExternalDevice] Distant external device %p failed to fetch deviceInfo", (uint8_t *)&v4, 0xCu);
  }
}

- (id)supportedMessages
{
  uint64_t v3 = [MRSupportedProtocolMessages alloc];
  int v4 = [(MRDistantExternalDevice *)self deviceInfo];
  uint64_t v5 = -[MRSupportedProtocolMessages initWithLastSupportedMessageType:](v3, "initWithLastSupportedMessageType:", [v4 lastSupportedProtocolMessageType]);

  return v5;
}

- (id)customOrigin
{
  uint64_t v6 = 0;
  __int16 v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__5;
  id v10 = __Block_byref_object_dispose__5;
  id v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __39__MRDistantExternalDevice_customOrigin__block_invoke;
  v5[3] = &unk_1E57D07E0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __39__MRDistantExternalDevice_customOrigin__block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = (void *)v2[13];
  if (!v3)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __39__MRDistantExternalDevice_customOrigin__block_invoke_2;
    v6[3] = &unk_1E57D1148;
    v6[4] = v2;
    int v4 = -[MRDistantExternalDevice _synchronousObjectProxyWithErrorHandler:](v2, v6);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __39__MRDistantExternalDevice_customOrigin__block_invoke_224;
    v5[3] = &unk_1E57D1D28;
    v5[4] = *(void *)(a1 + 32);
    [v4 getCustomOriginDataWithCompletion:v5];

    id v3 = *(void **)(*(void *)(a1 + 32) + 104);
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v3);
}

void __39__MRDistantExternalDevice_customOrigin__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = v3;
  if (v3)
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(NSObject **)(v5 + 64);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __39__MRDistantExternalDevice_customOrigin__block_invoke_3;
    v7[3] = &unk_1E57D0790;
    void v7[4] = v5;
    id v8 = v3;
    dispatch_async(v6, v7);
  }
}

void __39__MRDistantExternalDevice_customOrigin__block_invoke_3(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v2 = MRLogCategoryConnections();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v5 = 138543618;
    uint64_t v6 = v3;
    __int16 v7 = 2114;
    uint64_t v8 = v4;
    _os_log_impl(&dword_194F3C000, v2, OS_LOG_TYPE_ERROR, "[MRDistantExternalDevice] Distant external device %{public}@ failed to fetch custom origin data: %{public}@", (uint8_t *)&v5, 0x16u);
  }
}

void __39__MRDistantExternalDevice_customOrigin__block_invoke_224(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  __int16 v7 = v6;
  if (v5)
  {
    uint64_t v8 = [[MROrigin alloc] initWithData:v5];
    uint64_t v9 = *(void *)(a1 + 32);
    id v10 = *(void **)(v9 + 104);
    *(void *)(v9 + 104) = v8;
  }
  else
  {
    uint64_t v11 = *(void *)(a1 + 32);
    uint64_t v12 = *(NSObject **)(v11 + 64);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __39__MRDistantExternalDevice_customOrigin__block_invoke_2_226;
    v13[3] = &unk_1E57D0790;
    v13[4] = v11;
    id v14 = v6;
    dispatch_async(v12, v13);
  }
}

void __39__MRDistantExternalDevice_customOrigin__block_invoke_2_226(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v2 = MRLogCategoryConnections();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v5 = 134218242;
    uint64_t v6 = v3;
    __int16 v7 = 2114;
    uint64_t v8 = v4;
    _os_log_impl(&dword_194F3C000, v2, OS_LOG_TYPE_ERROR, "[MRDistantExternalDevice] Distant external device %p failed to fetch custom origin data: %{public}@", (uint8_t *)&v5, 0x16u);
  }
}

- (void)connectWithOptions:(unsigned int)a3 userInfo:(id)a4 completion:(id)a5
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v52 = a5;
  uint64_t v8 = (void *)MEMORY[0x1E4F1C9C8];
  id v9 = a4;
  v51 = [v8 now];
  id v10 = (void *)[v9 mutableCopy];

  if (v10) {
    id v11 = v10;
  }
  else {
    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  uint64_t v12 = v11;

  uint64_t v13 = [v12 objectForKeyedSubscript:@"MRExternalDeviceConnectionCorrelationIDUserInfoKey"];
  if (v13)
  {
    [v12 setObject:v13 forKeyedSubscript:@"MRExternalDeviceConnectionCorrelationIDUserInfoKey"];
  }
  else
  {
    id v14 = [MEMORY[0x1E4F29128] UUID];
    double v15 = [v14 UUIDString];
    [v12 setObject:v15 forKeyedSubscript:@"MRExternalDeviceConnectionCorrelationIDUserInfoKey"];
  }
  __int16 v16 = [v12 objectForKeyedSubscript:@"MRExternalDeviceConnectionReasonUserInfoKey"];
  dispatch_queue_t v17 = [v12 objectForKeyedSubscript:@"MRExternalDeviceConnectionCorrelationIDUserInfoKey"];
  if (v17)
  {
    if (v16) {
      goto LABEL_12;
    }
  }
  else
  {
    v48 = [MEMORY[0x1E4F28B00] currentHandler];
    [v48 handleFailureInMethod:a2, self, @"MRDistantExternalDevice.m", 657, @"Invalid parameter not satisfying: %@", @"uid" object file lineNumber description];

    if (v16) {
      goto LABEL_12;
    }
  }
  uint64_t v18 = _MRLogForCategory(0);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
    -[MRDistantExternalDevice connectWithOptions:userInfo:completion:]((uint64_t)v17, v18);
  }

  __int16 v16 = @"unspecified";
  [v12 setObject:@"unspecified" forKeyedSubscript:@"MRExternalDeviceConnectionReasonUserInfoKey"];
LABEL_12:
  double v19 = [(MRDistantExternalDevice *)self distantEndpoint];
  id v20 = [NSString alloc];
  uint64_t v21 = objc_opt_class();
  v22 = [v19 uniqueIdentifier];
  v50 = v19;
  id v23 = [v19 designatedGroupLeader];
  uint64_t v24 = [v23 name];
  v53 = self;
  id v25 = (void *)[v20 initWithFormat:@"%@:%p<%@(%@)>", v21, self, v22, v24];

  if (a3)
  {
    objc_super v26 = (__CFString *)MRExternalDeviceConnectOptionsCopyDescription(a3);
    uint64_t v27 = [v25 stringByAppendingFormat:@"(%@)", v26];

    id v25 = (void *)v27;
  }
  long long v28 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"%@<%@>", @"DistantExternalDevice.connectWithOptions", v17];
  long long v29 = v28;
  if (v25) {
    [v28 appendFormat:@" for %@", v25];
  }
  if (v16) {
    [v29 appendFormat:@" because %@", v16];
  }
  long long v30 = _MRLogForCategory(0xAuLL);
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v67 = v29;
    _os_log_impl(&dword_194F3C000, v30, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  uint64_t v31 = qos_class_self();
  id v32 = (id) [[NSString alloc] initWithFormat:@"com.apple.mediaremote.distantExternalDevice.connect.%@", v17];
  __int16 v33 = (const char *)[v32 UTF8String];
  __int16 v34 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  uint64_t v35 = dispatch_queue_attr_make_with_qos_class(v34, (dispatch_qos_class_t)v31, 0);
  dispatch_queue_t v36 = dispatch_queue_create(v33, v35);

  v59[0] = MEMORY[0x1E4F143A8];
  v59[1] = 3221225472;
  v59[2] = __66__MRDistantExternalDevice_connectWithOptions_userInfo_completion___block_invoke;
  v59[3] = &unk_1E57D1D50;
  int v65 = v31;
  id v60 = v17;
  id v61 = v25;
  dispatch_queue_t v63 = v36;
  id v64 = v52;
  id v62 = v51;
  v49 = v36;
  id v37 = v52;
  id v38 = v51;
  id v39 = v25;
  id v40 = v17;
  uint64_t v41 = (void *)MEMORY[0x1997190F0](v59);
  v42 = objc_alloc_init(MRExternalDeviceConnectionDetails);
  [(MRExternalDeviceConnectionDetails *)v42 setStartDate:v38];
  [(MRExternalDeviceConnectionDetails *)v42 setRequestID:v40];
  [(MRExternalDeviceConnectionDetails *)v42 setReason:v16];
  [(MRExternalDeviceConnectionDetails *)v42 setQos:v31];
  v43 = (void *)[v41 copy];
  [(MRExternalDeviceConnectionDetails *)v42 setCompletion:v43];

  serialQueue = v53->_serialQueue;
  v55[0] = MEMORY[0x1E4F143A8];
  v55[1] = 3221225472;
  v55[2] = __66__MRDistantExternalDevice_connectWithOptions_userInfo_completion___block_invoke_2;
  v55[3] = &unk_1E57D1D78;
  v55[4] = v53;
  v56 = v42;
  unsigned int v58 = a3;
  id v57 = v12;
  id v45 = v12;
  v46 = v42;
  v47 = MRCreateDonatedQosBlock(v55);
  dispatch_async(serialQueue, v47);
}

void __66__MRDistantExternalDevice_connectWithOptions_userInfo_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = objc_msgSend([NSString alloc], "initWithFormat:", @"qos: %u->%u", *(unsigned int *)(a1 + 72), qos_class_self());
  int v5 = _MRLogForCategory(0xAuLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543874;
    long long v30 = @"DistantExternalDevice.connectWithOptions";
    __int16 v31 = 2114;
    uint64_t v32 = v6;
    __int16 v33 = 2112;
    id v34 = v4;
    _os_log_impl(&dword_194F3C000, v5, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
  }

  uint64_t v7 = *(void *)(a1 + 40);
  uint64_t v8 = _MRLogForCategory(0xAuLL);
  id v9 = v8;
  if (!v3)
  {
    BOOL v15 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (!v15) {
        goto LABEL_16;
      }
      uint64_t v16 = *(void *)(a1 + 32);
      dispatch_queue_t v17 = *(void **)(a1 + 40);
      uint64_t v13 = [MEMORY[0x1E4F1C9C8] date];
      [v13 timeIntervalSinceDate:*(void *)(a1 + 48)];
      *(_DWORD *)buf = 138544130;
      long long v30 = @"DistantExternalDevice.connectWithOptions";
      __int16 v31 = 2114;
      uint64_t v32 = v16;
      __int16 v33 = 2114;
      id v34 = v17;
      __int16 v35 = 2048;
      uint64_t v36 = v18;
      double v19 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
      id v20 = v9;
      uint32_t v21 = 42;
    }
    else
    {
      if (!v15) {
        goto LABEL_16;
      }
      uint64_t v22 = *(void *)(a1 + 32);
      uint64_t v13 = [MEMORY[0x1E4F1C9C8] date];
      [v13 timeIntervalSinceDate:*(void *)(a1 + 48)];
      *(_DWORD *)buf = 138543874;
      long long v30 = @"DistantExternalDevice.connectWithOptions";
      __int16 v31 = 2114;
      uint64_t v32 = v22;
      __int16 v33 = 2048;
      id v34 = v23;
      double v19 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
      id v20 = v9;
      uint32_t v21 = 32;
    }
    _os_log_impl(&dword_194F3C000, v20, OS_LOG_TYPE_DEFAULT, v19, buf, v21);
    goto LABEL_15;
  }
  BOOL v10 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
  if (v7)
  {
    if (!v10) {
      goto LABEL_16;
    }
    uint64_t v11 = *(void *)(a1 + 32);
    uint64_t v12 = *(void *)(a1 + 40);
    uint64_t v13 = [MEMORY[0x1E4F1C9C8] date];
    [v13 timeIntervalSinceDate:*(void *)(a1 + 48)];
    *(_DWORD *)buf = 138544386;
    long long v30 = @"DistantExternalDevice.connectWithOptions";
    __int16 v31 = 2114;
    uint64_t v32 = v11;
    __int16 v33 = 2114;
    id v34 = v3;
    __int16 v35 = 2114;
    uint64_t v36 = v12;
    __int16 v37 = 2048;
    uint64_t v38 = v14;
    _os_log_error_impl(&dword_194F3C000, v9, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", buf, 0x34u);
LABEL_15:

    goto LABEL_16;
  }
  if (v10) {
    __66__MRDistantExternalDevice_connectWithOptions_userInfo_completion___block_invoke_cold_1();
  }
LABEL_16:

  uint64_t v24 = *(void **)(a1 + 64);
  if (v24)
  {
    id v25 = *(NSObject **)(a1 + 56);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __66__MRDistantExternalDevice_connectWithOptions_userInfo_completion___block_invoke_259;
    block[3] = &unk_1E57D0DB8;
    id v28 = v24;
    id v27 = v3;
    dispatch_async(v25, block);
  }
}

uint64_t __66__MRDistantExternalDevice_connectWithOptions_userInfo_completion___block_invoke_259(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __66__MRDistantExternalDevice_connectWithOptions_userInfo_completion___block_invoke_2(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 144);
  if (!v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v4 = *(void *)(a1 + 32);
    int v5 = *(void **)(v4 + 144);
    *(void *)(v4 + 144) = v3;

    id v2 = *(void **)(*(void *)(a1 + 32) + 144);
  }
  [v2 addObject:*(void *)(a1 + 40)];
  uint64_t v6 = *(unsigned int *)(a1 + 56);
  uint64_t v8 = *(void **)(a1 + 40);
  uint64_t v7 = *(void **)(a1 + 48);
  uint64_t v9 = *(void *)(a1 + 32);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __66__MRDistantExternalDevice_connectWithOptions_userInfo_completion___block_invoke_3;
  v10[3] = &unk_1E57D1148;
  v10[4] = v9;
  -[MRDistantExternalDevice _onSerialQueue_prepareToConnectWithOptions:userInfo:connectionAttemptDetails:connectionHandler:](v9, v6, v7, v8, v10);
}

void __66__MRDistantExternalDevice_connectWithOptions_userInfo_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  int v5 = *(NSObject **)(v4 + 56);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __66__MRDistantExternalDevice_connectWithOptions_userInfo_completion___block_invoke_4;
  v8[3] = &unk_1E57D0790;
  v8[4] = v4;
  id v9 = v3;
  id v6 = v3;
  uint64_t v7 = MRCreateDonatedQosBlock(v8);
  dispatch_async(v5, v7);
}

void __66__MRDistantExternalDevice_connectWithOptions_userInfo_completion___block_invoke_4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(NSObject **)(v1 + 64);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __66__MRDistantExternalDevice_connectWithOptions_userInfo_completion___block_invoke_5;
  v4[3] = &unk_1E57D0790;
  v4[4] = v1;
  id v5 = *(id *)(a1 + 40);
  id v3 = MRCreateDonatedQosBlock(v4);
  dispatch_async(v2, v3);
}

void __66__MRDistantExternalDevice_connectWithOptions_userInfo_completion___block_invoke_5(uint64_t a1)
{
  -[MRDistantExternalDevice _onSerialQueue_callAllPendingCompletionsWithError:](*(void *)(a1 + 32), *(void **)(a1 + 40));
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(a1 + 40);
  if (v3) {
    unsigned int v4 = 3;
  }
  else {
    unsigned int v4 = 2;
  }

  -[MRDistantExternalDevice _onSerialQueue_handleConnectionStateDidChange:withError:](v2, v4, v3);
}

- (void)_onSerialQueue_handleConnectionStateDidChange:(void *)a3 withError:
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a1)
  {
    if (a2 == 3 && *(void *)(a1 + 248)) {
      [(id)a1 setHostedExternalDeviceConnection:0];
    }
    if (!*(void *)(a1 + 248)) {
      [(id)a1 setDeviceInfo:0];
    }
    if ([(id)a1 connectionState] != a2)
    {
      id v6 = MRLogCategoryConnections();
      uint64_t v7 = v6;
      if (v5)
      {
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          uint64_t v8 = (__CFString *)MRExternalDeviceConnectionStateCopyDescription(a2);
          *(_DWORD *)buf = 138543874;
          uint64_t v31 = a1;
          __int16 v32 = 2114;
          __int16 v33 = v8;
          __int16 v34 = 2114;
          id v35 = v5;
          id v9 = "[MRDistantExternalDevice] Hosted external device connection for distant device %{public}@ state did chang"
               "e to %{public}@ with error %{public}@";
          BOOL v10 = v7;
          os_log_type_t v11 = OS_LOG_TYPE_ERROR;
          uint32_t v12 = 32;
LABEL_13:
          _os_log_impl(&dword_194F3C000, v10, v11, v9, buf, v12);
        }
      }
      else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v8 = (__CFString *)MRExternalDeviceConnectionStateCopyDescription(a2);
        *(_DWORD *)buf = 138543618;
        uint64_t v31 = a1;
        __int16 v32 = 2114;
        __int16 v33 = v8;
        id v9 = "[MRDistantExternalDevice] Hosted external device connection for distant device %{public}@ state did change to %{public}@";
        BOOL v10 = v7;
        os_log_type_t v11 = OS_LOG_TYPE_DEFAULT;
        uint32_t v12 = 22;
        goto LABEL_13;
      }

      if ((a2 & 0xFFFFFFFE) == 2)
      {
        *(_DWORD *)(a1 + 136) = 0;
        -[MRDistantExternalDevice _onSerialQueue_callAllPendingCompletionsWithError:](a1, 0);
      }
      uint64_t v13 = *(void **)(a1 + 128);
      *(void *)(a1 + 128) = 0;

      uint64_t v14 = *(void **)(a1 + 104);
      *(void *)(a1 + 104) = 0;

      -[MRDistantExternalDevice setConnectionState:](a1, a2);
      BOOL v15 = [(id)a1 connectionStateCallback];
      uint64_t v16 = (void *)[v15 copy];

      dispatch_queue_t v17 = [(id)a1 connectionStateCallbackQueue];
      uint64_t v18 = v17;
      if (v17)
      {
        double v19 = v17;
      }
      else
      {
        double v19 = MEMORY[0x1E4F14428];
        id v20 = MEMORY[0x1E4F14428];
      }

      if (v16)
      {
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __83__MRDistantExternalDevice__onSerialQueue_handleConnectionStateDidChange_withError___block_invoke;
        block[3] = &unk_1E57D1DF0;
        id v28 = v16;
        unsigned int v29 = a2;
        id v27 = v5;
        dispatch_async(v19, block);
      }
      uint32_t v21 = +[MRDistantExternalDevice _notificationSerialQueue]();
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __83__MRDistantExternalDevice__onSerialQueue_handleConnectionStateDidChange_withError___block_invoke_2;
      v22[3] = &unk_1E57D1DC8;
      unsigned int v25 = a2;
      id v23 = v5;
      uint64_t v24 = a1;
      dispatch_async(v21, v22);
    }
  }
}

- (void)_onSerialQueue_prepareToConnectWithOptions:(void *)a3 userInfo:(void *)a4 connectionAttemptDetails:(void *)a5 connectionHandler:
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (a1)
  {
    id v33 = v9;
    uint32_t v12 = [MRBlockGuard alloc];
    id v13 = [NSString alloc];
    uint64_t v14 = [v10 requestID];
    BOOL v15 = [v10 reason];
    uint64_t v16 = (void *)[v13 initWithFormat:@"%@<%@:%@>", @"DistantExternalDevice.connectWithOptions", v14, v15];
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __122__MRDistantExternalDevice__onSerialQueue_prepareToConnectWithOptions_userInfo_connectionAttemptDetails_connectionHandler___block_invoke;
    v42[3] = &unk_1E57D0FE8;
    id v17 = v11;
    id v43 = v17;
    uint64_t v18 = [(MRBlockGuard *)v12 initWithTimeout:v16 reason:v42 handler:30.0];

    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __122__MRDistantExternalDevice__onSerialQueue_prepareToConnectWithOptions_userInfo_connectionAttemptDetails_connectionHandler___block_invoke_2;
    v39[3] = &unk_1E57D1DA0;
    double v19 = v18;
    id v40 = v19;
    id v41 = v17;
    id v20 = (void (**)(void, void))MEMORY[0x1997190F0](v39);
    if ([(id)a1 connectionState] == 2)
    {
      uint32_t v21 = _MRLogForCategory(0xAuLL);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v22 = [v10 requestID];
        *(_DWORD *)buf = 138543874;
        id v45 = @"DistantExternalDevice.connectWithOptions";
        __int16 v46 = 2114;
        v47 = v22;
        __int16 v48 = 2112;
        v49 = @"Already Connected";
        _os_log_impl(&dword_194F3C000, v21, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
      }
      v20[2](v20, 0);
    }
    else
    {
      if ([(id)a1 connectionState] == 1)
      {
        if (a2 & 1) == 0 || (*(_DWORD *)(a1 + 136))
        {
          long long v30 = (__CFString *)[[NSString alloc] initWithFormat:@"Connection already in progress, batching connection attempt %@", *(void *)(a1 + 144)];
          uint64_t v31 = _MRLogForCategory(0xAuLL);
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            __int16 v32 = [v10 requestID];
            *(_DWORD *)buf = 138543874;
            id v45 = @"DistantExternalDevice.connectWithOptions";
            __int16 v46 = 2114;
            v47 = v32;
            __int16 v48 = 2112;
            v49 = v30;
            _os_log_impl(&dword_194F3C000, v31, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
          }
          [(MSVBlockGuard *)v19 disarm];

          goto LABEL_13;
        }
        id v23 = _MRLogForCategory(0xAuLL);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v24 = [v10 requestID];
          *(_DWORD *)buf = 138543874;
          id v45 = @"DistantExternalDevice.connectWithOptions";
          __int16 v46 = 2114;
          v47 = v24;
          __int16 v48 = 2112;
          v49 = @"AuthUpgrade required";
          _os_log_impl(&dword_194F3C000, v23, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
        }
      }
      *(unsigned char *)(a1 + 184) = 1;
      uint64_t v25 = [v10 startDate];
      objc_super v26 = *(void **)(a1 + 96);
      *(void *)(a1 + 96) = v25;

      *(_DWORD *)(a1 + 136) = a2;
      -[MRDistantExternalDevice _onSerialQueue_handleConnectionStateDidChange:withError:](a1, 1u, 0);
      v37[0] = MEMORY[0x1E4F143A8];
      v37[1] = 3221225472;
      v37[2] = __122__MRDistantExternalDevice__onSerialQueue_prepareToConnectWithOptions_userInfo_connectionAttemptDetails_connectionHandler___block_invoke_275;
      v37[3] = &unk_1E57D1DA0;
      v37[4] = a1;
      id v27 = v20;
      id v38 = v27;
      id v28 = -[MRDistantExternalDevice _remoteObjectProxyWithErrorHandler:]((void *)a1, v37);
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __122__MRDistantExternalDevice__onSerialQueue_prepareToConnectWithOptions_userInfo_connectionAttemptDetails_connectionHandler___block_invoke_2_276;
      v34[3] = &unk_1E57D1DA0;
      id v35 = v28;
      uint64_t v36 = v27;
      id v29 = v28;
      id v9 = v33;
      [v29 connectWithOptions:a2 userInfo:v33 completion:v34];
    }
LABEL_13:
  }
}

uint64_t __122__MRDistantExternalDevice__onSerialQueue_prepareToConnectWithOptions_userInfo_connectionAttemptDetails_connectionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __122__MRDistantExternalDevice__onSerialQueue_prepareToConnectWithOptions_userInfo_connectionAttemptDetails_connectionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) disarm]) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __122__MRDistantExternalDevice__onSerialQueue_prepareToConnectWithOptions_userInfo_connectionAttemptDetails_connectionHandler___block_invoke_275(uint64_t a1, void *a2)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 112) = 1;
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  -[MRDistantExternalDevice _disconnectWithError:](v3, v4);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)_remoteObjectProxyWithErrorHandler:(void *)a1
{
  uint64_t v3 = a2;
  if (a1)
  {
    id v10 = 0;
    id v4 = -[MRDistantExternalDevice _hostedExternalDeviceConnectionWithError:]((uint64_t)a1, &v10);
    id v5 = v10;
    if (v5)
    {
      v3[2](v3, v5);
    }
    else
    {
      if (v4)
      {
        v8[0] = MEMORY[0x1E4F143A8];
        v8[1] = 3221225472;
        v8[2] = __62__MRDistantExternalDevice__remoteObjectProxyWithErrorHandler___block_invoke;
        v8[3] = &unk_1E57D1DA0;
        v8[4] = a1;
        id v9 = v3;
        a1 = [v4 remoteObjectProxyWithErrorHandler:v8];

        goto LABEL_7;
      }
      uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithMRError:24 format:@"Attempting to query nil distantEndpointConnection"];
      v3[2](v3, v7);
    }
    a1 = 0;
LABEL_7:
  }

  return a1;
}

void __122__MRDistantExternalDevice__onSerialQueue_prepareToConnectWithOptions_userInfo_connectionAttemptDetails_connectionHandler___block_invoke_2_276(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = *(void (**)(uint64_t, uint64_t))(v3 + 16);
  id v5 = *(id *)(a1 + 32);
  v4(v3, a2);
}

- (void)disconnect:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = MRLogCategoryConnections();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v11 = v4;
    _os_log_impl(&dword_194F3C000, v5, OS_LOG_TYPE_DEBUG, "[MRDistantExternalDevice] Client called disconnect on shared connection with error %@", buf, 0xCu);
  }

  workerQueue = self->_workerQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __38__MRDistantExternalDevice_disconnect___block_invoke;
  v8[3] = &unk_1E57D0790;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(workerQueue, v8);
}

void __38__MRDistantExternalDevice_disconnect___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __38__MRDistantExternalDevice_disconnect___block_invoke_2;
  v4[3] = &unk_1E57D1148;
  v4[4] = v2;
  uint64_t v3 = -[MRDistantExternalDevice _remoteObjectProxyWithErrorHandler:](v2, v4);
  [v3 disconnect:*(void *)(a1 + 40)];
}

void __38__MRDistantExternalDevice_disconnect___block_invoke_2(uint64_t a1, void *a2)
{
}

- (void)setConnectionStateCallback:(id)a3 withQueue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__MRDistantExternalDevice_setConnectionStateCallback_withQueue___block_invoke;
  block[3] = &unk_1E57D13A8;
  id v12 = v7;
  id v13 = v6;
  void block[4] = self;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(serialQueue, block);
}

uint64_t __64__MRDistantExternalDevice_setConnectionStateCallback_withQueue___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) connectionStateCallback];
  if (v2)
  {
    uint64_t v3 = *(void *)(a1 + 48);

    if (v3)
    {
      id v4 = MRLogCategoryConnections();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        uint64_t v5 = *(void *)(a1 + 32);
        int v7 = 138412290;
        uint64_t v8 = v5;
        _os_log_impl(&dword_194F3C000, v4, OS_LOG_TYPE_ERROR, "[MRDistantExternalDevice] Overwriting distant external device ConnectionStateCallback for %@", (uint8_t *)&v7, 0xCu);
      }
    }
  }
  [*(id *)(a1 + 32) setConnectionStateCallback:*(void *)(a1 + 48)];
  return [*(id *)(a1 + 32) setConnectionStateCallbackQueue:*(void *)(a1 + 40)];
}

- (void)setCustomDataCallback:(id)a3 withQueue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__MRDistantExternalDevice_setCustomDataCallback_withQueue___block_invoke;
  block[3] = &unk_1E57D13A8;
  id v12 = v7;
  id v13 = v6;
  void block[4] = self;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(serialQueue, block);
}

void __59__MRDistantExternalDevice_setCustomDataCallback_withQueue___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) customDataCallback];
  if (v2)
  {
    uint64_t v3 = *(void *)(a1 + 48);

    if (v3)
    {
      id v4 = MRLogCategoryConnections();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        uint64_t v5 = *(void *)(a1 + 32);
        int v6 = 138412290;
        uint64_t v7 = v5;
        _os_log_impl(&dword_194F3C000, v4, OS_LOG_TYPE_ERROR, "[MRDistantExternalDevice] Overwriting distant external device CustomDataCallback for %@", (uint8_t *)&v6, 0xCu);
      }
    }
  }
  [*(id *)(a1 + 32) setCustomDataCallback:*(void *)(a1 + 48)];
  [*(id *)(a1 + 32) setCustomDataCallbackQueue:*(void *)(a1 + 40)];
  *(void *)(*(void *)(a1 + 32) + 80) = *(void *)(*(void *)(a1 + 32) + 80) & 0xFFFFFFFFFFFFFFFELL | (*(void *)(a1 + 48) != 0);
  -[MRDistantExternalDevice _updateHostedDeviceDesiredCallbacks:](*(void *)(a1 + 32), *(void *)(*(void *)(a1 + 32) + 80));
}

- (void)setVolumeCallback:(id)a3 withQueue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__MRDistantExternalDevice_setVolumeCallback_withQueue___block_invoke;
  block[3] = &unk_1E57D13A8;
  id v12 = v7;
  id v13 = v6;
  void block[4] = self;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(serialQueue, block);
}

uint64_t __55__MRDistantExternalDevice_setVolumeCallback_withQueue___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) volumeCallback];
  if (v2)
  {
    uint64_t v3 = *(void *)(a1 + 48);

    if (v3)
    {
      id v4 = MRLogCategoryConnections();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        uint64_t v5 = *(void *)(a1 + 32);
        int v7 = 138412290;
        uint64_t v8 = v5;
        _os_log_impl(&dword_194F3C000, v4, OS_LOG_TYPE_ERROR, "[MRDistantExternalDevice] Overwriting distant external device VolumeCallback for %@", (uint8_t *)&v7, 0xCu);
      }
    }
  }
  [*(id *)(a1 + 32) setVolumeCallback:*(void *)(a1 + 48)];
  return [*(id *)(a1 + 32) setVolumeCallbackQueue:*(void *)(a1 + 40)];
}

- (void)setDiscoveryMode:(unsigned int)a3 forConfiguration:(id)a4
{
  id v6 = a4;
  workerQueue = self->_workerQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__MRDistantExternalDevice_setDiscoveryMode_forConfiguration___block_invoke;
  block[3] = &unk_1E57D1DC8;
  unsigned int v11 = a3;
  void block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(workerQueue, block);
}

void __61__MRDistantExternalDevice_setDiscoveryMode_forConfiguration___block_invoke(uint64_t a1)
{
  -[MRDistantExternalDevice _hostedExternalDeviceConnection](*(void **)(a1 + 32));
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [v3 remoteObjectProxy];
  [v2 setDiscoveryMode:*(unsigned int *)(a1 + 48) forConfiguration:*(void *)(a1 + 40)];
}

- (void)requestGroupSessionWithDetails:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __75__MRDistantExternalDevice_requestGroupSessionWithDetails_queue_completion___block_invoke;
  v20[3] = &unk_1E57D18A8;
  id v21 = v9;
  id v22 = v10;
  id v11 = v10;
  id v12 = v9;
  id v13 = (void *)MEMORY[0x1997190F0](v20);
  workerQueue = self->_workerQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __75__MRDistantExternalDevice_requestGroupSessionWithDetails_queue_completion___block_invoke_3;
  block[3] = &unk_1E57D13A8;
  id v18 = v8;
  id v19 = v13;
  void block[4] = self;
  id v15 = v8;
  id v16 = v13;
  dispatch_async(workerQueue, block);
}

void __75__MRDistantExternalDevice_requestGroupSessionWithDetails_queue_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __75__MRDistantExternalDevice_requestGroupSessionWithDetails_queue_completion___block_invoke_2;
  block[3] = &unk_1E57D0EA8;
  int v7 = *(NSObject **)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

uint64_t __75__MRDistantExternalDevice_requestGroupSessionWithDetails_queue_completion___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __75__MRDistantExternalDevice_requestGroupSessionWithDetails_queue_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __75__MRDistantExternalDevice_requestGroupSessionWithDetails_queue_completion___block_invoke_4;
  v4[3] = &unk_1E57D0FE8;
  id v5 = *(id *)(a1 + 48);
  id v3 = -[MRDistantExternalDevice _remoteObjectProxyWithErrorHandler:](v2, v4);
  [v3 requestGroupSessionWithDetails:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

uint64_t __75__MRDistantExternalDevice_requestGroupSessionWithDetails_queue_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)outputDeviceVolumeControlCapabilities:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __82__MRDistantExternalDevice_outputDeviceVolumeControlCapabilities_queue_completion___block_invoke;
  v19[3] = &unk_1E57D1E18;
  id v11 = v9;
  id v20 = v11;
  id v12 = v10;
  id v21 = v12;
  id v13 = (void (**)(void, void, void))MEMORY[0x1997190F0](v19);
  id v14 = [(MRDistantExternalDevice *)self externalOutputContext];
  id v15 = v14;
  if (v14)
  {
    id v18 = 0;
    uint64_t v16 = [v14 volumeControlCapabilitiesForOutputDeviceUID:v8 error:&v18];
    id v17 = v18;
  }
  else
  {
    id v17 = (id)[objc_alloc(MEMORY[0x1E4F28C58]) initWithMRError:121];
    uint64_t v16 = 0;
  }
  ((void (**)(void, uint64_t, id))v13)[2](v13, v16, v17);
}

void __82__MRDistantExternalDevice_outputDeviceVolumeControlCapabilities_queue_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __82__MRDistantExternalDevice_outputDeviceVolumeControlCapabilities_queue_completion___block_invoke_2;
  block[3] = &unk_1E57D1DF0;
  id v6 = *(NSObject **)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  int v12 = a2;
  id v10 = v5;
  id v11 = v7;
  id v8 = v5;
  dispatch_async(v6, block);
}

uint64_t __82__MRDistantExternalDevice_outputDeviceVolumeControlCapabilities_queue_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned int *)(a1 + 48), *(void *)(a1 + 32));
}

- (void)setOutputDeviceVolume:(float)a3 outputDeviceUID:(id)a4 details:(id)a5 queue:(id)a6 completion:(id)a7
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v37 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  id v15 = [MEMORY[0x1E4F1C9C8] now];
  uint64_t v16 = [(MRDistantExternalDevice *)self distantEndpoint];
  id v17 = [NSString alloc];
  uint64_t v18 = objc_opt_class();
  id v19 = [v16 uniqueIdentifier];
  id v38 = v16;
  id v20 = [v16 designatedGroupLeader];
  id v21 = [v20 name];
  id v22 = (void *)[v17 initWithFormat:@"%@:%p<%@(%@)>", v18, self, v19, v21];

  id v23 = objc_alloc(MEMORY[0x1E4F28E78]);
  uint64_t v24 = [v12 requestID];
  uint64_t v25 = (void *)[v23 initWithFormat:@"%@<%@>", @"DistantExternalDevice.setOutputDeviceVolume", v24];

  if (v22) {
    [v25 appendFormat:@" for %@", v22];
  }
  objc_super v26 = _MRLogForCategory(0xAuLL);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v53 = v25;
    _os_log_impl(&dword_194F3C000, v26, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __90__MRDistantExternalDevice_setOutputDeviceVolume_outputDeviceUID_details_queue_completion___block_invoke;
  v44[3] = &unk_1E57D1E40;
  float v51 = a3;
  id v45 = v22;
  __int16 v46 = @"DistantExternalDevice.setOutputDeviceVolume";
  id v27 = v12;
  id v47 = v27;
  id v48 = v15;
  id v49 = v13;
  id v50 = v14;
  id v28 = v14;
  id v29 = v13;
  id v30 = v15;
  id v31 = v22;
  __int16 v32 = (void *)MEMORY[0x1997190F0](v44);
  workerQueue = self->_workerQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __90__MRDistantExternalDevice_setOutputDeviceVolume_outputDeviceUID_details_queue_completion___block_invoke_2;
  block[3] = &unk_1E57D1E68;
  float v43 = a3;
  void block[4] = self;
  id v40 = v37;
  id v41 = v27;
  id v42 = v32;
  id v34 = v27;
  id v35 = v37;
  id v36 = v32;
  dispatch_async(workerQueue, block);
}

void __90__MRDistantExternalDevice_setOutputDeviceVolume_outputDeviceUID_details_queue_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (!v3)
  {
    LODWORD(v4) = *(_DWORD *)(a1 + 80);
    id v13 = [NSNumber numberWithFloat:v4];

    uint64_t v14 = *(void *)(a1 + 32);
    id v6 = _MRLogForCategory(0xAuLL);
    BOOL v15 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if (!v13)
    {
      if (v14)
      {
        if (!v15) {
          goto LABEL_21;
        }
        uint64_t v24 = *(void *)(a1 + 40);
        id v9 = [*(id *)(a1 + 48) requestID];
        uint64_t v25 = *(void **)(a1 + 32);
        id v11 = [MEMORY[0x1E4F1C9C8] date];
        [v11 timeIntervalSinceDate:*(void *)(a1 + 56)];
        *(_DWORD *)buf = 138544130;
        uint64_t v42 = v24;
        __int16 v43 = 2114;
        v44 = v9;
        __int16 v45 = 2114;
        id v46 = v25;
        __int16 v47 = 2048;
        uint64_t v48 = v26;
        id v27 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
        id v28 = v6;
        uint32_t v29 = 42;
      }
      else
      {
        if (!v15) {
          goto LABEL_21;
        }
        uint64_t v33 = *(void *)(a1 + 40);
        id v9 = [*(id *)(a1 + 48) requestID];
        id v11 = [MEMORY[0x1E4F1C9C8] date];
        [v11 timeIntervalSinceDate:*(void *)(a1 + 56)];
        *(_DWORD *)buf = 138543874;
        uint64_t v42 = v33;
        __int16 v43 = 2114;
        v44 = v9;
        __int16 v45 = 2048;
        id v46 = v34;
        id v27 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
        id v28 = v6;
        uint32_t v29 = 32;
      }
      _os_log_impl(&dword_194F3C000, v28, OS_LOG_TYPE_DEFAULT, v27, buf, v29);
      goto LABEL_20;
    }
    if (v14)
    {
      if (!v15) {
        goto LABEL_21;
      }
      uint64_t v16 = *(void *)(a1 + 40);
      id v9 = [*(id *)(a1 + 48) requestID];
      LODWORD(v17) = *(_DWORD *)(a1 + 80);
      id v11 = [NSNumber numberWithFloat:v17];
      uint64_t v18 = *(void *)(a1 + 32);
      id v19 = [MEMORY[0x1E4F1C9C8] date];
      [v19 timeIntervalSinceDate:*(void *)(a1 + 56)];
      *(_DWORD *)buf = 138544386;
      uint64_t v42 = v16;
      __int16 v43 = 2114;
      v44 = v9;
      __int16 v45 = 2112;
      id v46 = v11;
      __int16 v47 = 2114;
      uint64_t v48 = v18;
      __int16 v49 = 2048;
      uint64_t v50 = v20;
      id v21 = "Response: %{public}@<%{public}@> returned <%@> for %{public}@ in %.4lf seconds";
      id v22 = v6;
      uint32_t v23 = 52;
    }
    else
    {
      if (!v15) {
        goto LABEL_21;
      }
      uint64_t v30 = *(void *)(a1 + 40);
      id v9 = [*(id *)(a1 + 48) requestID];
      LODWORD(v31) = *(_DWORD *)(a1 + 80);
      id v11 = [NSNumber numberWithFloat:v31];
      id v19 = [MEMORY[0x1E4F1C9C8] date];
      [v19 timeIntervalSinceDate:*(void *)(a1 + 56)];
      *(_DWORD *)buf = 138544130;
      uint64_t v42 = v30;
      __int16 v43 = 2114;
      v44 = v9;
      __int16 v45 = 2112;
      id v46 = v11;
      __int16 v47 = 2048;
      uint64_t v48 = v32;
      id v21 = "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds";
      id v22 = v6;
      uint32_t v23 = 42;
    }
    _os_log_impl(&dword_194F3C000, v22, OS_LOG_TYPE_DEFAULT, v21, buf, v23);

    goto LABEL_20;
  }
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = _MRLogForCategory(0xAuLL);
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);
  if (v5)
  {
    if (v7)
    {
      uint64_t v8 = *(void *)(a1 + 40);
      id v9 = [*(id *)(a1 + 48) requestID];
      uint64_t v10 = *(void *)(a1 + 32);
      id v11 = [MEMORY[0x1E4F1C9C8] date];
      [v11 timeIntervalSinceDate:*(void *)(a1 + 56)];
      *(_DWORD *)buf = 138544386;
      uint64_t v42 = v8;
      __int16 v43 = 2114;
      v44 = v9;
      __int16 v45 = 2114;
      id v46 = v3;
      __int16 v47 = 2114;
      uint64_t v48 = v10;
      __int16 v49 = 2048;
      uint64_t v50 = v12;
      _os_log_error_impl(&dword_194F3C000, v6, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", buf, 0x34u);
LABEL_20:
    }
  }
  else if (v7)
  {
    __90__MRDistantExternalDevice_setOutputDeviceVolume_outputDeviceUID_details_queue_completion___block_invoke_cold_1();
  }
LABEL_21:

  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __90__MRDistantExternalDevice_setOutputDeviceVolume_outputDeviceUID_details_queue_completion___block_invoke_283;
  v38[3] = &unk_1E57D0DB8;
  id v35 = *(NSObject **)(a1 + 64);
  id v36 = *(id *)(a1 + 72);
  id v39 = v3;
  id v40 = v36;
  id v37 = v3;
  dispatch_async(v35, v38);
}

uint64_t __90__MRDistantExternalDevice_setOutputDeviceVolume_outputDeviceUID_details_queue_completion___block_invoke_283(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __90__MRDistantExternalDevice_setOutputDeviceVolume_outputDeviceUID_details_queue_completion___block_invoke_2(uint64_t a1)
{
  -[MRDistantExternalDevice _remoteObjectProxyWithErrorHandler:](*(void **)(a1 + 32), *(void **)(a1 + 56));
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v2) = *(_DWORD *)(a1 + 64);
  [v3 setOutputDeviceVolume:*(void *)(a1 + 40) outputDeviceUID:*(void *)(a1 + 48) details:*(void *)(a1 + 56) completion:v2];
}

- (void)outputDeviceVolume:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __63__MRDistantExternalDevice_outputDeviceVolume_queue_completion___block_invoke;
  v20[3] = &unk_1E57D1E90;
  id v11 = v9;
  id v21 = v11;
  id v12 = v10;
  id v22 = v12;
  id v13 = (void (**)(void, void, float))MEMORY[0x1997190F0](v20);
  uint64_t v14 = [(MRDistantExternalDevice *)self externalOutputContext];
  BOOL v15 = v14;
  if (v14)
  {
    id v19 = 0;
    [v14 volumeForOutputDeviceUID:v8 error:&v19];
    float v17 = v16;
    id v18 = v19;
  }
  else
  {
    id v18 = (id)[objc_alloc(MEMORY[0x1E4F28C58]) initWithMRError:121];
    float v17 = 0.0;
  }
  ((void (**)(void, id, float))v13)[2](v13, v18, v17);
}

void __63__MRDistantExternalDevice_outputDeviceVolume_queue_completion___block_invoke(uint64_t a1, void *a2, float a3)
{
  id v5 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__MRDistantExternalDevice_outputDeviceVolume_queue_completion___block_invoke_2;
  block[3] = &unk_1E57D1DF0;
  id v6 = *(NSObject **)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  float v12 = a3;
  id v10 = v5;
  id v11 = v7;
  id v8 = v5;
  dispatch_async(v6, block);
}

uint64_t __63__MRDistantExternalDevice_outputDeviceVolume_queue_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, float))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), *(float *)(a1 + 48));
}

- (void)adjustOutputDeviceVolume:(int64_t)a3 outputDeviceUID:(id)a4 details:(id)a5 queue:(id)a6 completion:(id)a7
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v37 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = a7;
  uint64_t v14 = [MEMORY[0x1E4F1C9C8] now];
  BOOL v15 = [(MRDistantExternalDevice *)self distantEndpoint];
  id v16 = [NSString alloc];
  uint64_t v17 = objc_opt_class();
  id v18 = [v15 uniqueIdentifier];
  id v38 = v15;
  id v19 = [v15 designatedGroupLeader];
  uint64_t v20 = [v19 name];
  id v21 = (void *)[v16 initWithFormat:@"%@:%p<%@(%@)>", v17, self, v18, v20];

  id v22 = objc_alloc(MEMORY[0x1E4F28E78]);
  uint32_t v23 = [v11 requestID];
  uint64_t v24 = (void *)[v22 initWithFormat:@"%@<%@>", @"DistantExternalDevice.adjustOutputDeviceVolume", v23];

  if (v21) {
    [v24 appendFormat:@" for %@", v21];
  }
  uint64_t v25 = _MRLogForCategory(0xAuLL);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v53 = v24;
    _os_log_impl(&dword_194F3C000, v25, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __93__MRDistantExternalDevice_adjustOutputDeviceVolume_outputDeviceUID_details_queue_completion___block_invoke;
  v44[3] = &unk_1E57D1EB8;
  int64_t v51 = a3;
  id v45 = v21;
  id v46 = @"DistantExternalDevice.adjustOutputDeviceVolume";
  id v26 = v11;
  id v47 = v26;
  id v48 = v14;
  id v49 = v12;
  id v50 = v13;
  id v27 = v13;
  id v28 = v12;
  id v29 = v14;
  id v30 = v21;
  double v31 = (void *)MEMORY[0x1997190F0](v44);
  workerQueue = self->_workerQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __93__MRDistantExternalDevice_adjustOutputDeviceVolume_outputDeviceUID_details_queue_completion___block_invoke_2;
  block[3] = &unk_1E57D1EE0;
  id v42 = v31;
  int64_t v43 = a3;
  void block[4] = self;
  id v40 = v37;
  id v41 = v26;
  id v33 = v26;
  id v34 = v37;
  id v35 = v31;
  dispatch_async(workerQueue, block);
}

void __93__MRDistantExternalDevice_adjustOutputDeviceVolume_outputDeviceUID_details_queue_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (!v3)
  {
    id v12 = MRMediaRemoteVolumeControlAdjustmentDescription(*(void *)(a1 + 80));

    uint64_t v13 = *(void *)(a1 + 32);
    id v5 = _MRLogForCategory(0xAuLL);
    BOOL v14 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if (!v12)
    {
      if (v13)
      {
        if (!v14) {
          goto LABEL_21;
        }
        uint64_t v24 = *(void *)(a1 + 40);
        id v8 = [*(id *)(a1 + 48) requestID];
        uint64_t v25 = *(void **)(a1 + 32);
        id v10 = [MEMORY[0x1E4F1C9C8] date];
        [v10 timeIntervalSinceDate:*(void *)(a1 + 56)];
        *(_DWORD *)buf = 138544130;
        uint64_t v41 = v24;
        __int16 v42 = 2114;
        int64_t v43 = v8;
        __int16 v44 = 2114;
        id v45 = v25;
        __int16 v46 = 2048;
        uint64_t v47 = v26;
        id v27 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
        id v28 = v5;
        uint32_t v29 = 42;
      }
      else
      {
        if (!v14) {
          goto LABEL_21;
        }
        uint64_t v32 = *(void *)(a1 + 40);
        id v8 = [*(id *)(a1 + 48) requestID];
        id v10 = [MEMORY[0x1E4F1C9C8] date];
        [v10 timeIntervalSinceDate:*(void *)(a1 + 56)];
        *(_DWORD *)buf = 138543874;
        uint64_t v41 = v32;
        __int16 v42 = 2114;
        int64_t v43 = v8;
        __int16 v44 = 2048;
        id v45 = v33;
        id v27 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
        id v28 = v5;
        uint32_t v29 = 32;
      }
      _os_log_impl(&dword_194F3C000, v28, OS_LOG_TYPE_DEFAULT, v27, buf, v29);
      goto LABEL_20;
    }
    if (v13)
    {
      if (!v14) {
        goto LABEL_21;
      }
      uint64_t v15 = *(void *)(a1 + 40);
      id v16 = [*(id *)(a1 + 48) requestID];
      uint64_t v17 = MRMediaRemoteVolumeControlAdjustmentDescription(*(void *)(a1 + 80));
      uint64_t v18 = *(void *)(a1 + 32);
      id v19 = [MEMORY[0x1E4F1C9C8] date];
      [v19 timeIntervalSinceDate:*(void *)(a1 + 56)];
      *(_DWORD *)buf = 138544386;
      uint64_t v41 = v15;
      __int16 v42 = 2114;
      int64_t v43 = v16;
      __int16 v44 = 2112;
      id v45 = v17;
      __int16 v46 = 2114;
      uint64_t v47 = v18;
      __int16 v48 = 2048;
      uint64_t v49 = v20;
      id v21 = "Response: %{public}@<%{public}@> returned <%@> for %{public}@ in %.4lf seconds";
      id v22 = v5;
      uint32_t v23 = 52;
    }
    else
    {
      if (!v14) {
        goto LABEL_21;
      }
      uint64_t v30 = *(void *)(a1 + 40);
      id v16 = [*(id *)(a1 + 48) requestID];
      uint64_t v17 = MRMediaRemoteVolumeControlAdjustmentDescription(*(void *)(a1 + 80));
      id v19 = [MEMORY[0x1E4F1C9C8] date];
      [v19 timeIntervalSinceDate:*(void *)(a1 + 56)];
      *(_DWORD *)buf = 138544130;
      uint64_t v41 = v30;
      __int16 v42 = 2114;
      int64_t v43 = v16;
      __int16 v44 = 2112;
      id v45 = v17;
      __int16 v46 = 2048;
      uint64_t v47 = v31;
      id v21 = "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds";
      id v22 = v5;
      uint32_t v23 = 42;
    }
    _os_log_impl(&dword_194F3C000, v22, OS_LOG_TYPE_DEFAULT, v21, buf, v23);

    goto LABEL_21;
  }
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = _MRLogForCategory(0xAuLL);
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);
  if (v4)
  {
    if (v6)
    {
      uint64_t v7 = *(void *)(a1 + 40);
      id v8 = [*(id *)(a1 + 48) requestID];
      uint64_t v9 = *(void *)(a1 + 32);
      id v10 = [MEMORY[0x1E4F1C9C8] date];
      [v10 timeIntervalSinceDate:*(void *)(a1 + 56)];
      *(_DWORD *)buf = 138544386;
      uint64_t v41 = v7;
      __int16 v42 = 2114;
      int64_t v43 = v8;
      __int16 v44 = 2114;
      id v45 = v3;
      __int16 v46 = 2114;
      uint64_t v47 = v9;
      __int16 v48 = 2048;
      uint64_t v49 = v11;
      _os_log_error_impl(&dword_194F3C000, v5, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", buf, 0x34u);
LABEL_20:
    }
  }
  else if (v6)
  {
    __90__MRDistantExternalDevice_setOutputDeviceVolume_outputDeviceUID_details_queue_completion___block_invoke_cold_1();
  }
LABEL_21:

  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __93__MRDistantExternalDevice_adjustOutputDeviceVolume_outputDeviceUID_details_queue_completion___block_invoke_288;
  v37[3] = &unk_1E57D0DB8;
  id v34 = *(NSObject **)(a1 + 64);
  id v35 = *(id *)(a1 + 72);
  id v38 = v3;
  id v39 = v35;
  id v36 = v3;
  dispatch_async(v34, v37);
}

uint64_t __93__MRDistantExternalDevice_adjustOutputDeviceVolume_outputDeviceUID_details_queue_completion___block_invoke_288(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __93__MRDistantExternalDevice_adjustOutputDeviceVolume_outputDeviceUID_details_queue_completion___block_invoke_2(uint64_t a1)
{
  -[MRDistantExternalDevice _remoteObjectProxyWithErrorHandler:](*(void **)(a1 + 32), *(void **)(a1 + 56));
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 adjustOutputDeviceVolume:*(void *)(a1 + 64) outputDeviceUID:*(void *)(a1 + 40) details:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
}

- (void)muteOutputDeviceVolume:(BOOL)a3 outputDeviceUID:(id)a4 details:(id)a5 queue:(id)a6 completion:(id)a7
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v37 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = a7;
  BOOL v14 = [MEMORY[0x1E4F1C9C8] now];
  uint64_t v15 = [(MRDistantExternalDevice *)self distantEndpoint];
  id v16 = [NSString alloc];
  uint64_t v17 = objc_opt_class();
  uint64_t v18 = [v15 uniqueIdentifier];
  id v38 = v15;
  id v19 = [v15 designatedGroupLeader];
  uint64_t v20 = [v19 name];
  id v21 = (void *)[v16 initWithFormat:@"%@:%p<%@(%@)>", v17, self, v18, v20];

  id v22 = objc_alloc(MEMORY[0x1E4F28E78]);
  uint32_t v23 = [v11 requestID];
  uint64_t v24 = (void *)[v22 initWithFormat:@"%@<%@>", @"DistantExternalDevice.muteOutputDeviceVolume", v23];

  if (v21) {
    [v24 appendFormat:@" for %@", v21];
  }
  uint64_t v25 = _MRLogForCategory(0xAuLL);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v53 = v24;
    _os_log_impl(&dword_194F3C000, v25, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __91__MRDistantExternalDevice_muteOutputDeviceVolume_outputDeviceUID_details_queue_completion___block_invoke;
  v44[3] = &unk_1E57D1F08;
  BOOL v51 = a3;
  id v45 = v21;
  __int16 v46 = @"DistantExternalDevice.muteOutputDeviceVolume";
  id v26 = v11;
  id v47 = v26;
  id v48 = v14;
  id v49 = v12;
  id v50 = v13;
  id v27 = v13;
  id v28 = v12;
  id v29 = v14;
  id v30 = v21;
  uint64_t v31 = (void *)MEMORY[0x1997190F0](v44);
  workerQueue = self->_workerQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __91__MRDistantExternalDevice_muteOutputDeviceVolume_outputDeviceUID_details_queue_completion___block_invoke_2;
  block[3] = &unk_1E57D1F30;
  BOOL v43 = a3;
  void block[4] = self;
  id v40 = v37;
  id v41 = v26;
  id v42 = v31;
  id v33 = v26;
  id v34 = v37;
  id v35 = v31;
  dispatch_async(workerQueue, block);
}

void __91__MRDistantExternalDevice_muteOutputDeviceVolume_outputDeviceUID_details_queue_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (!v3)
  {
    id v12 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 80)];

    uint64_t v13 = *(void *)(a1 + 32);
    id v5 = _MRLogForCategory(0xAuLL);
    BOOL v14 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if (!v12)
    {
      if (v13)
      {
        if (!v14) {
          goto LABEL_21;
        }
        uint64_t v22 = *(void *)(a1 + 40);
        id v8 = [*(id *)(a1 + 48) requestID];
        uint32_t v23 = *(void **)(a1 + 32);
        id v10 = [MEMORY[0x1E4F1C9C8] date];
        [v10 timeIntervalSinceDate:*(void *)(a1 + 56)];
        *(_DWORD *)buf = 138544130;
        uint64_t v39 = v22;
        __int16 v40 = 2114;
        id v41 = v8;
        __int16 v42 = 2114;
        id v43 = v23;
        __int16 v44 = 2048;
        uint64_t v45 = v24;
        uint64_t v25 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
        id v26 = v5;
        uint32_t v27 = 42;
      }
      else
      {
        if (!v14) {
          goto LABEL_21;
        }
        uint64_t v30 = *(void *)(a1 + 40);
        id v8 = [*(id *)(a1 + 48) requestID];
        id v10 = [MEMORY[0x1E4F1C9C8] date];
        [v10 timeIntervalSinceDate:*(void *)(a1 + 56)];
        *(_DWORD *)buf = 138543874;
        uint64_t v39 = v30;
        __int16 v40 = 2114;
        id v41 = v8;
        __int16 v42 = 2048;
        id v43 = v31;
        uint64_t v25 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
        id v26 = v5;
        uint32_t v27 = 32;
      }
      _os_log_impl(&dword_194F3C000, v26, OS_LOG_TYPE_DEFAULT, v25, buf, v27);
      goto LABEL_20;
    }
    if (v13)
    {
      if (!v14) {
        goto LABEL_21;
      }
      uint64_t v15 = *(void *)(a1 + 40);
      id v8 = [*(id *)(a1 + 48) requestID];
      id v10 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 80)];
      uint64_t v16 = *(void *)(a1 + 32);
      uint64_t v17 = [MEMORY[0x1E4F1C9C8] date];
      [v17 timeIntervalSinceDate:*(void *)(a1 + 56)];
      *(_DWORD *)buf = 138544386;
      uint64_t v39 = v15;
      __int16 v40 = 2114;
      id v41 = v8;
      __int16 v42 = 2112;
      id v43 = v10;
      __int16 v44 = 2114;
      uint64_t v45 = v16;
      __int16 v46 = 2048;
      uint64_t v47 = v18;
      id v19 = "Response: %{public}@<%{public}@> returned <%@> for %{public}@ in %.4lf seconds";
      uint64_t v20 = v5;
      uint32_t v21 = 52;
    }
    else
    {
      if (!v14) {
        goto LABEL_21;
      }
      uint64_t v28 = *(void *)(a1 + 40);
      id v8 = [*(id *)(a1 + 48) requestID];
      id v10 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 80)];
      uint64_t v17 = [MEMORY[0x1E4F1C9C8] date];
      [v17 timeIntervalSinceDate:*(void *)(a1 + 56)];
      *(_DWORD *)buf = 138544130;
      uint64_t v39 = v28;
      __int16 v40 = 2114;
      id v41 = v8;
      __int16 v42 = 2112;
      id v43 = v10;
      __int16 v44 = 2048;
      uint64_t v45 = v29;
      id v19 = "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds";
      uint64_t v20 = v5;
      uint32_t v21 = 42;
    }
    _os_log_impl(&dword_194F3C000, v20, OS_LOG_TYPE_DEFAULT, v19, buf, v21);

    goto LABEL_20;
  }
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = _MRLogForCategory(0xAuLL);
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);
  if (v4)
  {
    if (v6)
    {
      uint64_t v7 = *(void *)(a1 + 40);
      id v8 = [*(id *)(a1 + 48) requestID];
      uint64_t v9 = *(void *)(a1 + 32);
      id v10 = [MEMORY[0x1E4F1C9C8] date];
      [v10 timeIntervalSinceDate:*(void *)(a1 + 56)];
      *(_DWORD *)buf = 138544386;
      uint64_t v39 = v7;
      __int16 v40 = 2114;
      id v41 = v8;
      __int16 v42 = 2114;
      id v43 = v3;
      __int16 v44 = 2114;
      uint64_t v45 = v9;
      __int16 v46 = 2048;
      uint64_t v47 = v11;
      _os_log_error_impl(&dword_194F3C000, v5, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", buf, 0x34u);
LABEL_20:
    }
  }
  else if (v6)
  {
    __90__MRDistantExternalDevice_setOutputDeviceVolume_outputDeviceUID_details_queue_completion___block_invoke_cold_1();
  }
LABEL_21:

  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __91__MRDistantExternalDevice_muteOutputDeviceVolume_outputDeviceUID_details_queue_completion___block_invoke_292;
  v35[3] = &unk_1E57D0DB8;
  uint64_t v32 = *(NSObject **)(a1 + 64);
  id v33 = *(id *)(a1 + 72);
  id v36 = v3;
  id v37 = v33;
  id v34 = v3;
  dispatch_async(v32, v35);
}

uint64_t __91__MRDistantExternalDevice_muteOutputDeviceVolume_outputDeviceUID_details_queue_completion___block_invoke_292(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __91__MRDistantExternalDevice_muteOutputDeviceVolume_outputDeviceUID_details_queue_completion___block_invoke_2(uint64_t a1)
{
  -[MRDistantExternalDevice _remoteObjectProxyWithErrorHandler:](*(void **)(a1 + 32), *(void **)(a1 + 56));
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 muteOutputDeviceVolume:*(unsigned __int8 *)(a1 + 64) outputDeviceUID:*(void *)(a1 + 40) details:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
}

- (void)setListeningMode:(id)a3 outputDeviceUID:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __77__MRDistantExternalDevice_setListeningMode_outputDeviceUID_queue_completion___block_invoke;
  v25[3] = &unk_1E57D1DA0;
  id v26 = v12;
  id v27 = v13;
  id v14 = v13;
  id v15 = v12;
  uint64_t v16 = (void *)MEMORY[0x1997190F0](v25);
  workerQueue = self->_workerQueue;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __77__MRDistantExternalDevice_setListeningMode_outputDeviceUID_queue_completion___block_invoke_3;
  v21[3] = &unk_1E57D1F58;
  v21[4] = self;
  id v22 = v10;
  id v23 = v11;
  id v24 = v16;
  id v18 = v11;
  id v19 = v10;
  id v20 = v16;
  dispatch_async(workerQueue, v21);
}

void __77__MRDistantExternalDevice_setListeningMode_outputDeviceUID_queue_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __77__MRDistantExternalDevice_setListeningMode_outputDeviceUID_queue_completion___block_invoke_2;
  v7[3] = &unk_1E57D0DB8;
  uint64_t v4 = *(NSObject **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __77__MRDistantExternalDevice_setListeningMode_outputDeviceUID_queue_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __77__MRDistantExternalDevice_setListeningMode_outputDeviceUID_queue_completion___block_invoke_3(uint64_t a1)
{
  -[MRDistantExternalDevice _remoteObjectProxyWithErrorHandler:](*(void **)(a1 + 32), *(void **)(a1 + 56));
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 setListeningMode:*(void *)(a1 + 40) outputDeviceUID:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
}

- (void)setConversationDetectionEnabled:(BOOL)a3 outputDeviceUID:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  void v23[2] = __92__MRDistantExternalDevice_setConversationDetectionEnabled_outputDeviceUID_queue_completion___block_invoke;
  v23[3] = &unk_1E57D1DA0;
  id v24 = v11;
  id v25 = v12;
  id v13 = v12;
  id v14 = v11;
  id v15 = (void *)MEMORY[0x1997190F0](v23);
  workerQueue = self->_workerQueue;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __92__MRDistantExternalDevice_setConversationDetectionEnabled_outputDeviceUID_queue_completion___block_invoke_3;
  v19[3] = &unk_1E57D1F80;
  id v20 = v10;
  id v21 = v15;
  BOOL v22 = a3;
  void v19[4] = self;
  id v17 = v10;
  id v18 = v15;
  dispatch_async(workerQueue, v19);
}

void __92__MRDistantExternalDevice_setConversationDetectionEnabled_outputDeviceUID_queue_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __92__MRDistantExternalDevice_setConversationDetectionEnabled_outputDeviceUID_queue_completion___block_invoke_2;
  v7[3] = &unk_1E57D0DB8;
  uint64_t v4 = *(NSObject **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __92__MRDistantExternalDevice_setConversationDetectionEnabled_outputDeviceUID_queue_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __92__MRDistantExternalDevice_setConversationDetectionEnabled_outputDeviceUID_queue_completion___block_invoke_3(uint64_t a1)
{
  -[MRDistantExternalDevice _remoteObjectProxyWithErrorHandler:](*(void **)(a1 + 32), *(void **)(a1 + 48));
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 setConversationDetectionEnabled:*(unsigned __int8 *)(a1 + 56) outputDeviceUID:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

- (void)modifyTopologyWithRequest:(id)a3 withReplyQueue:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __79__MRDistantExternalDevice_modifyTopologyWithRequest_withReplyQueue_completion___block_invoke;
  v20[3] = &unk_1E57D1DA0;
  id v21 = v9;
  id v22 = v10;
  id v11 = v10;
  id v12 = v9;
  id v13 = (void *)MEMORY[0x1997190F0](v20);
  workerQueue = self->_workerQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __79__MRDistantExternalDevice_modifyTopologyWithRequest_withReplyQueue_completion___block_invoke_3;
  block[3] = &unk_1E57D13A8;
  id v18 = v8;
  id v19 = v13;
  void block[4] = self;
  id v15 = v8;
  id v16 = v13;
  dispatch_async(workerQueue, block);
}

void __79__MRDistantExternalDevice_modifyTopologyWithRequest_withReplyQueue_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __79__MRDistantExternalDevice_modifyTopologyWithRequest_withReplyQueue_completion___block_invoke_2;
  v7[3] = &unk_1E57D0DB8;
  uint64_t v4 = *(NSObject **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __79__MRDistantExternalDevice_modifyTopologyWithRequest_withReplyQueue_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __79__MRDistantExternalDevice_modifyTopologyWithRequest_withReplyQueue_completion___block_invoke_3(uint64_t a1)
{
  -[MRDistantExternalDevice _remoteObjectProxyWithErrorHandler:](*(void **)(a1 + 32), *(void **)(a1 + 48));
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 modifyTopologyWithRequest:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

- (void)createHostedEndpointWithOutputDeviceUIDs:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __85__MRDistantExternalDevice_createHostedEndpointWithOutputDeviceUIDs_queue_completion___block_invoke;
  v20[3] = &unk_1E57D18A8;
  id v21 = v9;
  id v22 = v10;
  id v11 = v10;
  id v12 = v9;
  id v13 = (void *)MEMORY[0x1997190F0](v20);
  workerQueue = self->_workerQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __85__MRDistantExternalDevice_createHostedEndpointWithOutputDeviceUIDs_queue_completion___block_invoke_3;
  block[3] = &unk_1E57D13A8;
  id v18 = v8;
  id v19 = v13;
  void block[4] = self;
  id v15 = v8;
  id v16 = v13;
  dispatch_async(workerQueue, block);
}

void __85__MRDistantExternalDevice_createHostedEndpointWithOutputDeviceUIDs_queue_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __85__MRDistantExternalDevice_createHostedEndpointWithOutputDeviceUIDs_queue_completion___block_invoke_2;
  block[3] = &unk_1E57D0EA8;
  uint64_t v7 = *(NSObject **)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

uint64_t __85__MRDistantExternalDevice_createHostedEndpointWithOutputDeviceUIDs_queue_completion___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __85__MRDistantExternalDevice_createHostedEndpointWithOutputDeviceUIDs_queue_completion___block_invoke_3(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __85__MRDistantExternalDevice_createHostedEndpointWithOutputDeviceUIDs_queue_completion___block_invoke_4;
  v4[3] = &unk_1E57D0FE8;
  id v5 = *(id *)(a1 + 48);
  id v3 = -[MRDistantExternalDevice _remoteObjectProxyWithErrorHandler:](v2, v4);
  [v3 createHostedEndpointWithOutputDeviceUIDs:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

uint64_t __85__MRDistantExternalDevice_createHostedEndpointWithOutputDeviceUIDs_queue_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)sendCustomData:(id)a3 withName:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  -[MRDistantExternalDevice _hostedExternalDeviceConnection](self);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  id v8 = [v9 remoteObjectProxy];
  [v8 sendCustomData:v7 withName:v6];
}

- (void)ping:(double)a3 callback:(id)a4 withQueue:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __51__MRDistantExternalDevice_ping_callback_withQueue___block_invoke;
  v18[3] = &unk_1E57D1DA0;
  id v19 = v9;
  id v20 = v8;
  id v10 = v8;
  id v11 = v9;
  id v12 = (void *)MEMORY[0x1997190F0](v18);
  workerQueue = self->_workerQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__MRDistantExternalDevice_ping_callback_withQueue___block_invoke_3;
  block[3] = &unk_1E57D1FA8;
  void block[4] = self;
  id v16 = v12;
  double v17 = a3;
  id v14 = v12;
  dispatch_async(workerQueue, block);
}

void __51__MRDistantExternalDevice_ping_callback_withQueue___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__MRDistantExternalDevice_ping_callback_withQueue___block_invoke_2;
  v7[3] = &unk_1E57D0DB8;
  uint64_t v4 = *(NSObject **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __51__MRDistantExternalDevice_ping_callback_withQueue___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __51__MRDistantExternalDevice_ping_callback_withQueue___block_invoke_3(uint64_t a1)
{
  -[MRDistantExternalDevice _remoteObjectProxyWithErrorHandler:](*(void **)(a1 + 32), *(void **)(a1 + 40));
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 pingWithTimeout:*(void *)(a1 + 40) callback:*(double *)(a1 + 48)];
}

- (void)sendButtonEvent:(_MRHIDButtonEvent)a3
{
  workerQueue = self->_workerQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__MRDistantExternalDevice_sendButtonEvent___block_invoke;
  block[3] = &unk_1E57D1FD0;
  void block[4] = self;
  _MRHIDButtonEvent v5 = a3;
  dispatch_async(workerQueue, block);
}

void __43__MRDistantExternalDevice_sendButtonEvent___block_invoke(uint64_t a1)
{
  -[MRDistantExternalDevice _hostedExternalDeviceConnection](*(void **)(a1 + 32));
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id v2 = [v3 remoteObjectProxy];
  [v2 sendButtonEventWithUsagePage:*(unsigned int *)(a1 + 40) usage:*(unsigned int *)(a1 + 44) down:*(unsigned __int8 *)(a1 + 48)];
}

- (id)personalOutputDevices
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__5;
  id v11 = __Block_byref_object_dispose__5;
  id v12 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __48__MRDistantExternalDevice_personalOutputDevices__block_invoke;
  v6[3] = &unk_1E57D1148;
  v6[4] = self;
  id v2 = -[MRDistantExternalDevice _synchronousObjectProxyWithErrorHandler:](self, v6);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __48__MRDistantExternalDevice_personalOutputDevices__block_invoke_293;
  v5[3] = &unk_1E57D1FF8;
  v5[4] = &v7;
  [v2 getPersonalOutputDevices:v5];

  id v3 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v3;
}

void __48__MRDistantExternalDevice_personalOutputDevices__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  _MRHIDButtonEvent v5 = *(NSObject **)(v4 + 64);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__MRDistantExternalDevice_personalOutputDevices__block_invoke_2;
  v7[3] = &unk_1E57D0790;
  void v7[4] = v4;
  id v8 = v3;
  id v6 = v3;
  dispatch_async(v5, v7);
}

void __48__MRDistantExternalDevice_personalOutputDevices__block_invoke_2(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v2 = MRLogCategoryConnections();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v5 = 138543618;
    uint64_t v6 = v3;
    __int16 v7 = 2114;
    uint64_t v8 = v4;
    _os_log_impl(&dword_194F3C000, v2, OS_LOG_TYPE_ERROR, "[MRDistantExternalDevice] Distant external device %{public}@ failed to fetch personalOutputDevices: %{public}@", (uint8_t *)&v5, 0x16u);
  }
}

void __48__MRDistantExternalDevice_personalOutputDevices__block_invoke_293(uint64_t a1, void *a2)
{
}

- (void)removeFromParentGroup:(id)a3 queue:(id)a4 completion:(id)a5
{
  uint64_t v6 = (objc_class *)MEMORY[0x1E4F28C58];
  id v7 = a5;
  id v8 = (id)[[v6 alloc] initWithMRError:3];
  (*((void (**)(id, id))a5 + 2))(v7, v8);
}

- (void)hostedExternalDeviceConnectionStateDidChange:(unsigned int)a3 withError:(id)a4
{
  id v6 = a4;
  workerQueue = self->_workerQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __82__MRDistantExternalDevice_hostedExternalDeviceConnectionStateDidChange_withError___block_invoke;
  block[3] = &unk_1E57D1DC8;
  unsigned int v11 = a3;
  void block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(workerQueue, block);
}

void __82__MRDistantExternalDevice_hostedExternalDeviceConnectionStateDidChange_withError___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(NSObject **)(v1 + 64);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __82__MRDistantExternalDevice_hostedExternalDeviceConnectionStateDidChange_withError___block_invoke_2;
  block[3] = &unk_1E57D1DC8;
  void block[4] = v1;
  int v5 = *(_DWORD *)(a1 + 48);
  id v4 = *(id *)(a1 + 40);
  dispatch_async(v2, block);
}

void __82__MRDistantExternalDevice_hostedExternalDeviceConnectionStateDidChange_withError___block_invoke_2(uint64_t a1)
{
}

- (void)hostedExternalDeviceDeviceInfoDidChange:(id)a3
{
  id v4 = a3;
  workerQueue = self->_workerQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __67__MRDistantExternalDevice_hostedExternalDeviceDeviceInfoDidChange___block_invoke;
  v7[3] = &unk_1E57D0790;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(workerQueue, v7);
}

void __67__MRDistantExternalDevice_hostedExternalDeviceDeviceInfoDidChange___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = MRLogCategoryConnections();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    uint64_t v10 = v3;
    __int16 v11 = 2114;
    uint64_t v12 = v4;
    _os_log_impl(&dword_194F3C000, v2, OS_LOG_TYPE_DEBUG, "[MRDistantExternalDevice] Hosted external device connection for distant device %{public}@ deviceInfo did change to \"%{public}@\"", buf, 0x16u);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(NSObject **)(v5 + 64);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __67__MRDistantExternalDevice_hostedExternalDeviceDeviceInfoDidChange___block_invoke_295;
  v7[3] = &unk_1E57D0790;
  void v7[4] = v5;
  id v8 = *(id *)(a1 + 40);
  dispatch_async(v6, v7);
}

uint64_t __67__MRDistantExternalDevice_hostedExternalDeviceDeviceInfoDidChange___block_invoke_295(uint64_t a1)
{
  return [*(id *)(a1 + 32) setDeviceInfo:*(void *)(a1 + 40)];
}

- (void)hostedExternalDeviceDidReceiveCustomData:(id)a3 withName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  workerQueue = self->_workerQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__MRDistantExternalDevice_hostedExternalDeviceDidReceiveCustomData_withName___block_invoke;
  block[3] = &unk_1E57D1B18;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(workerQueue, block);
}

void __77__MRDistantExternalDevice_hostedExternalDeviceDidReceiveCustomData_withName___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v2 = MRLogCategoryConnections();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = [*(id *)(a1 + 40) length];
    uint64_t v5 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 138543874;
    uint64_t v12 = v3;
    __int16 v13 = 2048;
    uint64_t v14 = v4;
    __int16 v15 = 2114;
    uint64_t v16 = v5;
    _os_log_impl(&dword_194F3C000, v2, OS_LOG_TYPE_DEBUG, "[MRDistantExternalDevice] Hosted external device connection for distant device %{public}@ did receive %llu bytes of custom data for name %{public}@", buf, 0x20u);
  }

  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(NSObject **)(v6 + 64);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__MRDistantExternalDevice_hostedExternalDeviceDidReceiveCustomData_withName___block_invoke_296;
  block[3] = &unk_1E57D1B18;
  void block[4] = v6;
  id v9 = *(id *)(a1 + 48);
  id v10 = *(id *)(a1 + 40);
  dispatch_async(v7, block);
}

void __77__MRDistantExternalDevice_hostedExternalDeviceDidReceiveCustomData_withName___block_invoke_296(id *a1)
{
  id v2 = [a1[4] customDataCallbackQueue];
  uint64_t v3 = v2;
  if (v2)
  {
    uint64_t v4 = v2;
  }
  else
  {
    uint64_t v4 = MEMORY[0x1E4F14428];
    id v5 = MEMORY[0x1E4F14428];
  }

  uint64_t v6 = [a1[4] customDataCallback];
  id v7 = (void *)[v6 copy];

  if (v7)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __77__MRDistantExternalDevice_hostedExternalDeviceDidReceiveCustomData_withName___block_invoke_2;
    block[3] = &unk_1E57D0EA8;
    id v11 = v7;
    id v9 = a1[5];
    id v10 = a1[6];
    dispatch_async(v4, block);
  }
}

uint64_t __77__MRDistantExternalDevice_hostedExternalDeviceDidReceiveCustomData_withName___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)hostedExternalDeviceEndpointDidChange:(id)a3
{
  id v4 = a3;
  workerQueue = self->_workerQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __65__MRDistantExternalDevice_hostedExternalDeviceEndpointDidChange___block_invoke;
  v7[3] = &unk_1E57D0790;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(workerQueue, v7);
}

void __65__MRDistantExternalDevice_hostedExternalDeviceEndpointDidChange___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v2 = MRLogCategoryConnections();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 134218242;
    uint64_t v13 = v3;
    __int16 v14 = 2114;
    uint64_t v15 = v4;
    _os_log_impl(&dword_194F3C000, v2, OS_LOG_TYPE_DEBUG, "[MRDistantExternalDevice] Hosted external device connection for distant device %p endpoint did change to %{public}@", buf, 0x16u);
  }

  [*(id *)(a1 + 40) setDistantExternalDevice:*(void *)(a1 + 32)];
  id v5 = [MRAVDistantEndpoint alloc];
  id v6 = [*(id *)(a1 + 40) descriptor];
  id v7 = [(MRAVDistantEndpoint *)v5 initWithDescriptor:v6];
  [*(id *)(a1 + 32) setDistantEndpoint:v7];

  id v8 = +[MRDistantExternalDevice _notificationSerialQueue]();
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __65__MRDistantExternalDevice_hostedExternalDeviceEndpointDidChange___block_invoke_297;
  v10[3] = &unk_1E57D0790;
  id v9 = *(void **)(a1 + 40);
  v10[4] = *(void *)(a1 + 32);
  id v11 = v9;
  dispatch_async(v8, v10);
}

void __65__MRDistantExternalDevice_hostedExternalDeviceEndpointDidChange___block_invoke_297(uint64_t a1)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v6 = @"kMRExternalDeviceEndpointUserInfoKeyEndpoint";
  v7[0] = v3;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  [v2 postNotificationName:@"kMRExternalDeviceEndpointDidChangeNotification" object:v4 userInfo:v5];
}

- (void)hostedExternalDeviceVolumeCapabilitiesDidChange:(unsigned int)a3 forOutputDevice:(id)a4
{
  id v6 = a4;
  workerQueue = self->_workerQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __91__MRDistantExternalDevice_hostedExternalDeviceVolumeCapabilitiesDidChange_forOutputDevice___block_invoke;
  block[3] = &unk_1E57D1DC8;
  unsigned int v11 = a3;
  void block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(workerQueue, block);
}

void __91__MRDistantExternalDevice_hostedExternalDeviceVolumeCapabilitiesDidChange_forOutputDevice___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v2 = MRLogCategoryConnections();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = (void *)MRMediaRemotePickedRouteVolumeControlCapabilitiesCopyDescription(*(_DWORD *)(a1 + 48));
    id v5 = *(void **)(a1 + 32);
    id v6 = v4;
    id v7 = [v5 distantEndpoint];
    uint64_t v8 = *(void *)(a1 + 40);

    *(_DWORD *)buf = 134218754;
    uint64_t v15 = v3;
    __int16 v16 = 2114;
    uint64_t v17 = v4;
    __int16 v18 = 2114;
    id v19 = v7;
    __int16 v20 = 2114;
    uint64_t v21 = v8;
    _os_log_impl(&dword_194F3C000, v2, OS_LOG_TYPE_DEBUG, "[MRDistantExternalDevice] Hosted external device connection for distant device %p volume capabilities did change to %{public}@ for endpoint %{public}@ for output device %{public}@", buf, 0x2Au);
  }
  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = *(NSObject **)(v9 + 64);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __91__MRDistantExternalDevice_hostedExternalDeviceVolumeCapabilitiesDidChange_forOutputDevice___block_invoke_299;
  block[3] = &unk_1E57D1DC8;
  void block[4] = v9;
  int v13 = *(_DWORD *)(a1 + 48);
  id v12 = *(id *)(a1 + 40);
  dispatch_async(v10, block);
}

void __91__MRDistantExternalDevice_hostedExternalDeviceVolumeCapabilitiesDidChange_forOutputDevice___block_invoke_299(uint64_t a1)
{
  uint64_t v1 = *(void **)(*(void *)(a1 + 32) + 128);
  uint64_t v2 = *(unsigned int *)(a1 + 48);
  id v3 = [*(id *)(a1 + 40) uid];
  [v1 updateVolumeControlCapabilities:v2 outputDeviceUID:v3];
}

- (void)hostedExternalDeviceVolumeDidChange:(float)a3 forOutputDevice:(id)a4
{
  id v6 = a4;
  workerQueue = self->_workerQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __79__MRDistantExternalDevice_hostedExternalDeviceVolumeDidChange_forOutputDevice___block_invoke;
  block[3] = &unk_1E57D1DC8;
  float v11 = a3;
  void block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(workerQueue, block);
}

void __79__MRDistantExternalDevice_hostedExternalDeviceVolumeDidChange_forOutputDevice___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = MRLogCategoryConnections();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    id v3 = *(void **)(a1 + 32);
    double v4 = *(float *)(a1 + 48);
    id v5 = [v3 distantEndpoint];
    uint64_t v6 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 134218754;
    int v13 = v3;
    __int16 v14 = 2048;
    double v15 = v4;
    __int16 v16 = 2114;
    uint64_t v17 = v5;
    __int16 v18 = 2114;
    uint64_t v19 = v6;
    _os_log_impl(&dword_194F3C000, v2, OS_LOG_TYPE_DEBUG, "[MRDistantExternalDevice] Hosted external device connection for distant device %p volume did change to %f for endpoint %{public}@ for output device  %{public}@", buf, 0x2Au);
  }
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(NSObject **)(v7 + 64);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __79__MRDistantExternalDevice_hostedExternalDeviceVolumeDidChange_forOutputDevice___block_invoke_300;
  block[3] = &unk_1E57D1DC8;
  void block[4] = v7;
  int v11 = *(_DWORD *)(a1 + 48);
  id v10 = *(id *)(a1 + 40);
  dispatch_async(v8, block);
}

void __79__MRDistantExternalDevice_hostedExternalDeviceVolumeDidChange_forOutputDevice___block_invoke_300(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 128);
  int v3 = *(_DWORD *)(a1 + 48);
  double v4 = [*(id *)(a1 + 40) uid];
  LODWORD(v5) = v3;
  [v2 updateVolume:v4 outputDeviceUID:v5];

  uint64_t v6 = [*(id *)(a1 + 32) volumeCallbackQueue];
  uint64_t v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v8 = MEMORY[0x1E4F14428];
    id v9 = MEMORY[0x1E4F14428];
  }

  id v10 = [*(id *)(a1 + 32) volumeCallback];
  int v11 = (void *)[v10 copy];

  if (v11)
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __79__MRDistantExternalDevice_hostedExternalDeviceVolumeDidChange_forOutputDevice___block_invoke_2;
    v15[3] = &unk_1E57D2020;
    id v12 = v11;
    int v18 = *(_DWORD *)(a1 + 48);
    uint64_t v13 = *(void *)(a1 + 32);
    __int16 v14 = *(void **)(a1 + 40);
    id v17 = v12;
    v15[4] = v13;
    id v16 = v14;
    dispatch_async(v8, v15);
  }
}

void __79__MRDistantExternalDevice_hostedExternalDeviceVolumeDidChange_forOutputDevice___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  float v3 = *(float *)(a1 + 56);
  id v6 = [*(id *)(a1 + 32) distantEndpoint];
  double v4 = [v6 uniqueIdentifier];
  double v5 = [*(id *)(a1 + 40) uid];
  (*(void (**)(uint64_t, void *, void *, float))(v2 + 16))(v2, v4, v5, v3);
}

- (void)hostedExternalDeviceIsMutedDidChange:(BOOL)a3 forOutputDevice:(id)a4
{
  id v6 = a4;
  workerQueue = self->_workerQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __80__MRDistantExternalDevice_hostedExternalDeviceIsMutedDidChange_forOutputDevice___block_invoke;
  block[3] = &unk_1E57D2048;
  BOOL v11 = a3;
  void block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(workerQueue, block);
}

void __80__MRDistantExternalDevice_hostedExternalDeviceIsMutedDidChange_forOutputDevice___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = MRLogCategoryConnections();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    float v3 = *(void **)(a1 + 32);
    int v4 = *(unsigned __int8 *)(a1 + 48);
    double v5 = [v3 distantEndpoint];
    uint64_t v6 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 134218754;
    uint64_t v13 = v3;
    __int16 v14 = 1024;
    int v15 = v4;
    __int16 v16 = 2114;
    id v17 = v5;
    __int16 v18 = 2114;
    uint64_t v19 = v6;
    _os_log_impl(&dword_194F3C000, v2, OS_LOG_TYPE_DEBUG, "[MRDistantExternalDevice] Hosted external device connection for distant device %p volume isMuted did change to %{BOOL}u for endpoint %{public}@ for output device %{public}@", buf, 0x26u);
  }
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(NSObject **)(v7 + 64);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __80__MRDistantExternalDevice_hostedExternalDeviceIsMutedDidChange_forOutputDevice___block_invoke_301;
  block[3] = &unk_1E57D2048;
  void block[4] = v7;
  char v11 = *(unsigned char *)(a1 + 48);
  id v10 = *(id *)(a1 + 40);
  dispatch_async(v8, block);
}

void __80__MRDistantExternalDevice_hostedExternalDeviceIsMutedDidChange_forOutputDevice___block_invoke_301(uint64_t a1)
{
  uint64_t v1 = *(void **)(*(void *)(a1 + 32) + 128);
  uint64_t v2 = *(unsigned __int8 *)(a1 + 48);
  id v3 = [*(id *)(a1 + 40) uid];
  [v1 updateVolumeMuted:v2 outputDeviceUID:v3];
}

- (void)hostedExternalDeviceDidAddOutputDevice:(id)a3
{
  id v4 = a3;
  workerQueue = self->_workerQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __66__MRDistantExternalDevice_hostedExternalDeviceDidAddOutputDevice___block_invoke;
  v7[3] = &unk_1E57D0790;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(workerQueue, v7);
}

void __66__MRDistantExternalDevice_hostedExternalDeviceDidAddOutputDevice___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = MRLogCategoryConnections();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    id v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    double v5 = [v3 distantEndpoint];
    *(_DWORD *)buf = 134218498;
    char v11 = v3;
    __int16 v12 = 2114;
    uint64_t v13 = v4;
    __int16 v14 = 2114;
    int v15 = v5;
    _os_log_impl(&dword_194F3C000, v2, OS_LOG_TYPE_DEBUG, "[MRDistantExternalDevice] Hosted external device connection for distant device %p did add outputDevice %{public}@ for endpoint %{public}@", buf, 0x20u);
  }
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(NSObject **)(v6 + 64);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __66__MRDistantExternalDevice_hostedExternalDeviceDidAddOutputDevice___block_invoke_302;
  v8[3] = &unk_1E57D0790;
  v8[4] = v6;
  id v9 = *(id *)(a1 + 40);
  dispatch_async(v7, v8);
}

void __66__MRDistantExternalDevice_hostedExternalDeviceDidAddOutputDevice___block_invoke_302(uint64_t a1)
{
  v3[1] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void **)(*(void *)(a1 + 32) + 128);
  v3[0] = *(void *)(a1 + 40);
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:1];
  [v1 updateOutputDevices:v2];
}

- (void)hostedExternalDeviceDidChangeOutputDevice:(id)a3
{
  id v4 = a3;
  workerQueue = self->_workerQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __69__MRDistantExternalDevice_hostedExternalDeviceDidChangeOutputDevice___block_invoke;
  v7[3] = &unk_1E57D0790;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(workerQueue, v7);
}

void __69__MRDistantExternalDevice_hostedExternalDeviceDidChangeOutputDevice___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = MRLogCategoryConnections();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    id v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    double v5 = [v3 distantEndpoint];
    *(_DWORD *)buf = 134218498;
    char v11 = v3;
    __int16 v12 = 2114;
    uint64_t v13 = v4;
    __int16 v14 = 2114;
    int v15 = v5;
    _os_log_impl(&dword_194F3C000, v2, OS_LOG_TYPE_DEBUG, "[MRDistantExternalDevice] Hosted external device connection for distant device %p did change outputDevice %{public}@ for endpoint %{public}@", buf, 0x20u);
  }
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(NSObject **)(v6 + 64);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __69__MRDistantExternalDevice_hostedExternalDeviceDidChangeOutputDevice___block_invoke_303;
  v8[3] = &unk_1E57D0790;
  v8[4] = v6;
  id v9 = *(id *)(a1 + 40);
  dispatch_async(v7, v8);
}

void __69__MRDistantExternalDevice_hostedExternalDeviceDidChangeOutputDevice___block_invoke_303(uint64_t a1)
{
  v3[1] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void **)(*(void *)(a1 + 32) + 128);
  v3[0] = *(void *)(a1 + 40);
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:1];
  [v1 updateOutputDevices:v2];
}

- (void)hostedExternalDeviceDidRemoveOutputDevice:(id)a3
{
  id v4 = a3;
  workerQueue = self->_workerQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __69__MRDistantExternalDevice_hostedExternalDeviceDidRemoveOutputDevice___block_invoke;
  v7[3] = &unk_1E57D0790;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(workerQueue, v7);
}

void __69__MRDistantExternalDevice_hostedExternalDeviceDidRemoveOutputDevice___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = MRLogCategoryConnections();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = [*(id *)(a1 + 40) uid];
    double v5 = [*(id *)(a1 + 32) distantEndpoint];
    *(_DWORD *)buf = 134218498;
    uint64_t v11 = v3;
    __int16 v12 = 2114;
    uint64_t v13 = v4;
    __int16 v14 = 2114;
    int v15 = v5;
    _os_log_impl(&dword_194F3C000, v2, OS_LOG_TYPE_DEBUG, "[MRDistantExternalDevice] Hosted external device connection for distant device %p did remove outputDevice %{public}@ for endpoint %{public}@", buf, 0x20u);
  }
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(NSObject **)(v6 + 64);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __69__MRDistantExternalDevice_hostedExternalDeviceDidRemoveOutputDevice___block_invoke_304;
  v8[3] = &unk_1E57D0790;
  v8[4] = v6;
  id v9 = *(id *)(a1 + 40);
  dispatch_async(v7, v8);
}

void __69__MRDistantExternalDevice_hostedExternalDeviceDidRemoveOutputDevice___block_invoke_304(uint64_t a1)
{
  v4[1] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void **)(*(void *)(a1 + 32) + 128);
  uint64_t v2 = [*(id *)(a1 + 40) uid];
  v4[0] = v2;
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  [v1 removeOutputDevices:v3];
}

- (void)discoveryOutputDevicesChanged:(id)a3 forConfiguration:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  id v8 = MRLogCategoryConnections();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    id v9 = [(MRDistantExternalDevice *)self distantEndpoint];
    int v10 = 134218498;
    uint64_t v11 = self;
    __int16 v12 = 2114;
    id v13 = v6;
    __int16 v14 = 2114;
    int v15 = v9;
    _os_log_impl(&dword_194F3C000, v8, OS_LOG_TYPE_DEBUG, "[MRDistantExternalDevice] Hosted external device connection for distant device %p discoveryOutputDevicesChanged for configuration %{public}@ for endpoint %{public}@", (uint8_t *)&v10, 0x20u);
  }
  [(MRExternalDevice *)self notifyDiscoveryOutputDevicesChanged:v7 forConfiguration:v6];
}

void __51__MRDistantExternalDevice__notificationSerialQueue__block_invoke()
{
  uint64_t v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.MediaRemote.MRDistantExternalDevice.NotificationQueue", v2);
  uint64_t v1 = (void *)_notificationSerialQueue___notificationSerialQueue;
  _notificationSerialQueue___notificationSerialQueue = (uint64_t)v0;
}

void __66__MRDistantExternalDevice__nullableHostedExternalDeviceConnection__block_invoke(uint64_t a1)
{
}

- (id)_hostedExternalDeviceConnectionWithError:(uint64_t)a1
{
  if (a1)
  {
    uint64_t v11 = 0;
    __int16 v12 = &v11;
    uint64_t v13 = 0x3032000000;
    __int16 v14 = __Block_byref_object_copy__5;
    int v15 = __Block_byref_object_dispose__5;
    id v16 = 0;
    uint64_t v5 = 0;
    id v6 = &v5;
    uint64_t v7 = 0x3032000000;
    id v8 = __Block_byref_object_copy__5;
    id v9 = __Block_byref_object_dispose__5;
    id v10 = 0;
    msv_dispatch_sync_on_queue();
    if (a2) {
      *a2 = (id) v12[5];
    }
    id v3 = (id)v6[5];
    _Block_object_dispose(&v5, 8);

    _Block_object_dispose(&v11, 8);
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

void __68__MRDistantExternalDevice__hostedExternalDeviceConnectionWithError___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 248);
  if (!v2)
  {
    id v3 = (void *)MRGetSharedService();
    id v4 = [*(id *)(a1 + 32) distantEndpoint];
    uint64_t v5 = [v4 uniqueIdentifier];
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    id obj = *(id *)(v6 + 40);
    uint64_t v7 = MRMediaRemoteServiceGetExternalDevice(v3, v5, &obj);
    objc_storeStrong((id *)(v6 + 40), obj);

    if (v7)
    {
      id v8 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithListenerEndpoint:v7];
      [*(id *)(a1 + 32) setHostedExternalDeviceConnection:v8];
    }
    uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 248);
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v2);
}

void __62__MRDistantExternalDevice__remoteObjectProxyWithErrorHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 domain];
  if (![v4 isEqualToString:*MEMORY[0x1E4F281F8]])
  {
LABEL_5:

    goto LABEL_6;
  }
  uint64_t v5 = [v3 code];

  if (v5 == 4099)
  {
    id v4 = _MRLogForCategory(0);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      __62__MRDistantExternalDevice__remoteObjectProxyWithErrorHandler___block_invoke_cold_1();
    }
    goto LABEL_5;
  }
LABEL_6:
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __67__MRDistantExternalDevice__synchronousObjectProxyWithErrorHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 domain];
  if (![v4 isEqualToString:*MEMORY[0x1E4F281F8]])
  {
LABEL_5:

    goto LABEL_6;
  }
  uint64_t v5 = [v3 code];

  if (v5 == 4099)
  {
    id v4 = _MRLogForCategory(0);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      __62__MRDistantExternalDevice__remoteObjectProxyWithErrorHandler___block_invoke_cold_1();
    }
    goto LABEL_5;
  }
LABEL_6:
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __48__MRDistantExternalDevice__disconnectWithError___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(NSObject **)(v1 + 64);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  void v3[2] = __48__MRDistantExternalDevice__disconnectWithError___block_invoke_2;
  v3[3] = &unk_1E57D0790;
  v3[4] = v1;
  id v4 = *(id *)(a1 + 40);
  dispatch_async(v2, v3);
}

void __48__MRDistantExternalDevice__disconnectWithError___block_invoke_2(uint64_t a1)
{
}

uint64_t __83__MRDistantExternalDevice__onSerialQueue_handleConnectionStateDidChange_withError___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned int *)(a1 + 48), *(void *)(a1 + 32));
}

void __83__MRDistantExternalDevice__onSerialQueue_handleConnectionStateDidChange_withError___block_invoke_2(uint64_t a1)
{
  id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v2 = [MEMORY[0x1E4F1CA60] dictionary];
  id v3 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 48)];
  [v2 setObject:v3 forKey:@"kMRExternalDeviceConnectionStateUserInfoKey"];

  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    [v2 setObject:v4 forKey:*MEMORY[0x1E4F28A50]];
  }
  [v5 postNotificationName:@"kMRExternalDeviceConnectionStateDidChangeNotification" object:*(void *)(a1 + 40) userInfo:v2];
}

void __63__MRDistantExternalDevice__updateHostedDeviceDesiredCallbacks___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) remoteObjectProxy];
  [v2 setRegisteredCallbacks:*(void *)(a1 + 40)];
}

void __67__MRDistantExternalDevice__updateHostedDeviceDesiredNotifications___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) remoteObjectProxy];
  [v2 setNotifications:*(void *)(a1 + 40)];
}

- (BOOL)hasEverAttemptedToConnect
{
  return self->_hasEverAttemptedToConnect;
}

- (unint64_t)notifications
{
  return self->_notifications;
}

- (id)connectionStateCallback
{
  return self->_connectionStateCallback;
}

- (void)setConnectionStateCallback:(id)a3
{
}

- (OS_dispatch_queue)connectionStateCallbackQueue
{
  return self->_connectionStateCallbackQueue;
}

- (void)setConnectionStateCallbackQueue:(id)a3
{
}

- (id)customDataCallback
{
  return self->_customDataCallback;
}

- (void)setCustomDataCallback:(id)a3
{
}

- (OS_dispatch_queue)customDataCallbackQueue
{
  return self->_customDataCallbackQueue;
}

- (void)setCustomDataCallbackQueue:(id)a3
{
}

- (id)volumeCallback
{
  return self->_volumeCallback;
}

- (void)setVolumeCallback:(id)a3
{
}

- (OS_dispatch_queue)volumeCallbackQueue
{
  return self->_volumeCallbackQueue;
}

- (void)setVolumeCallbackQueue:(id)a3
{
}

- (NSXPCConnection)hostedExternalDeviceConnection
{
  return self->_hostedExternalDeviceConnection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostedExternalDeviceConnection, 0);
  objc_storeStrong((id *)&self->_volumeCallbackQueue, 0);
  objc_storeStrong(&self->_volumeCallback, 0);
  objc_storeStrong((id *)&self->_customDataCallbackQueue, 0);
  objc_storeStrong(&self->_customDataCallback, 0);
  objc_storeStrong((id *)&self->_connectionStateCallbackQueue, 0);
  objc_storeStrong(&self->_connectionStateCallback, 0);
  objc_storeStrong((id *)&self->_onLock_distantEndpoint, 0);
  objc_storeStrong((id *)&self->_onLock_connectionStateDate, 0);
  objc_storeStrong((id *)&self->_deviceInfo, 0);
  objc_storeStrong((id *)&self->_pendingConnectionAttempts, 0);
  objc_storeStrong((id *)&self->_externalOutputContext, 0);
  objc_storeStrong((id *)&self->_subscribedPlayerPaths, 0);
  objc_storeStrong((id *)&self->_customOrigin, 0);
  objc_storeStrong((id *)&self->_hasEverAttemptedToConnectDate, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);

  objc_storeStrong((id *)&self->_workerQueue, 0);
}

- (void)connectWithOptions:(uint64_t)a1 userInfo:(NSObject *)a2 completion:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 138412546;
  id v3 = @"DistantExternalDevice.connectWithOptions";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_fault_impl(&dword_194F3C000, a2, OS_LOG_TYPE_FAULT, "No reason provided for %@<%@>", (uint8_t *)&v2, 0x16u);
}

void __66__MRDistantExternalDevice_connectWithOptions_userInfo_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  uint64_t v1 = [MEMORY[0x1E4F1C9C8] date];
  [v1 timeIntervalSinceDate:*(void *)(v0 + 48)];
  OUTLINED_FUNCTION_1(&dword_194F3C000, v2, v3, "Response: %{public}@<%{public}@> returned with error <%{public}@> in %.4lf seconds", v4, v5, v6, v7, 2u);
}

void __90__MRDistantExternalDevice_setOutputDeviceVolume_outputDeviceUID_details_queue_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  uint64_t v2 = [*(id *)(v1 + 48) requestID];
  uint64_t v3 = [MEMORY[0x1E4F1C9C8] date];
  [v3 timeIntervalSinceDate:*(void *)(v0 + 56)];
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1(&dword_194F3C000, v4, v5, "Response: %{public}@<%{public}@> returned with error <%{public}@> in %.4lf seconds", v6, v7, v8, v9, v10);
}

void __62__MRDistantExternalDevice__remoteObjectProxyWithErrorHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_4(&dword_194F3C000, v0, v1, "%@ %@ in distantExternalDevice");
}

@end