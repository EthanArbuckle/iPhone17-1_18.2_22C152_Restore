@interface CAFDCarDataServiceAgent
- (BOOL)_setupCarDataChannel:(id)a3 channelType:(id)a4 qualityOfService:(id)a5 streamPriority:(id)a6 priority:(unint64_t)a7;
- (BOOL)allowPartialConfiguration;
- (BOOL)currentCarIdentifierIsEqual:(id)a3;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)pluginConfigsRequested;
- (CAFASCTree)ascTree;
- (CAFCarConfiguration)currentCar;
- (CAFDCarDataServiceAgent)initWithSessionStatus:(id)a3 config:(id)a4;
- (CAFDStateCaptureManager)stateCaptureManager;
- (CARObserverHashTable)remoteProxies;
- (CARSessionStatus)sessionStatus;
- (NSMutableArray)carDataClients;
- (NSMutableDictionary)carDataChannels;
- (NSMutableDictionary)fastStartupRegistrations;
- (NSMutableSet)connections;
- (OS_dispatch_queue)workQueue;
- (OS_os_transaction)osTransaction;
- (id)_getChannel:(id)a3;
- (id)_getClient:(id)a3;
- (id)registrationsForPluginID:(id)a3;
- (id)valuesForPluginID:(unint64_t)a3 iids:(id)a4;
- (int)carDataAvailableToken;
- (os_unfair_lock_s)assertionCounterLock;
- (os_unfair_lock_s)carLock;
- (os_unfair_lock_s)channelLock;
- (unint64_t)assertionCount;
- (unint64_t)currentCarPluginCount;
- (unint64_t)pluginCount;
- (void)_addRegistration:(id)a3 instanceIDs:(id)a4 priority:(id)a5 withResponse:(id)a6;
- (void)_mainQueue_initVehicleDataSession:(id)a3;
- (void)_observeAssertion:(id)a3;
- (void)_removeConnection:(id)a3;
- (void)_removeRegistration:(id)a3 instanceIDs:(id)a4 priority:(id)a5 withResponse:(id)a6;
- (void)_workQueue_didReceiveConfigFromPluginID:(id)a3 config:(id)a4;
- (void)assertion:(id)a3 didInvalidateWithError:(id)a4;
- (void)carDataChannelDidClose:(id)a3;
- (void)carDataChannelDidOpen:(id)a3;
- (void)carDataChannelDidReceive:(id)a3 pluginID:(id)a4 payload:(id)a5;
- (void)close;
- (void)dealloc;
- (void)didReceiveConfigFromPluginID:(id)a3 config:(id)a4;
- (void)didReceiveErrorFromPluginID:(id)a3 error:(id)a4;
- (void)didReceiveNotificationFromPluginID:(id)a3 instanceID:(id)a4 value:(id)a5;
- (void)didReceiveRequestFromPluginID:(id)a3 instanceID:(id)a4 value:(id)a5 withResponse:(id)a6;
- (void)didReceiveUpdateFromPluginID:(id)a3 values:(id)a4;
- (void)handlePairedVehiclesDidChange:(id)a3;
- (void)processFastStartupRegistrations:(id)a3 config:(id)a4;
- (void)sendToPluginID:(id)a3 payload:(id)a4 priority:(id)a5 completion:(id)a6;
- (void)sessionDidConnect:(id)a3;
- (void)sessionDidDisconnect:(id)a3;
- (void)setAllowPartialConfiguration:(BOOL)a3;
- (void)setAssertionCount:(unint64_t)a3;
- (void)setAssertionCounterLock:(os_unfair_lock_s)a3;
- (void)setCarDataAvailableToken:(int)a3;
- (void)setCarDataChannels:(id)a3;
- (void)setCarDataClients:(id)a3;
- (void)setCarLock:(os_unfair_lock_s)a3;
- (void)setChannelLock:(os_unfair_lock_s)a3;
- (void)setConnections:(id)a3;
- (void)setCurrentCar:(id)a3;
- (void)setFastStartupRegistrations:(id)a3;
- (void)setOsTransaction:(id)a3;
- (void)setPluginConfigsRequested:(BOOL)a3;
- (void)setRemoteProxies:(id)a3;
- (void)setStateCaptureManager:(id)a3;
- (void)setWorkQueue:(id)a3;
@end

@implementation CAFDCarDataServiceAgent

- (CAFDCarDataServiceAgent)initWithSessionStatus:(id)a3 config:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v57.receiver = self;
  v57.super_class = (Class)CAFDCarDataServiceAgent;
  v9 = [(CAFDCarDataServiceAgent *)&v57 init];
  v10 = v9;
  if (v9)
  {
    *(void *)&v9->_carLock._os_unfair_lock_opaque = 0;
    v9->_channelLock._os_unfair_lock_opaque = 0;
    currentCar = v9->_currentCar;
    v9->_currentCar = 0;

    uint64_t v12 = +[NSMutableDictionary dictionary];
    carDataChannels = v10->_carDataChannels;
    v10->_carDataChannels = (NSMutableDictionary *)v12;

    uint64_t v14 = +[NSMutableArray array];
    carDataClients = v10->_carDataClients;
    v10->_carDataClients = (NSMutableArray *)v14;

    uint64_t v16 = +[NSMutableSet set];
    connections = v10->_connections;
    v10->_connections = (NSMutableSet *)v16;

    v18 = (const char *)[@"com.apple.caraccessoryframework.cardata" UTF8String];
    v19 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v20 = dispatch_queue_create(v18, v19);
    workQueue = v10->_workQueue;
    v10->_workQueue = (OS_dispatch_queue *)v20;

    id v22 = objc_alloc((Class)CARObserverHashTable);
    v23 = [(CAFDCarDataServiceAgent *)v10 workQueue];
    v24 = (CARObserverHashTable *)[v22 initWithProtocol:&OBJC_PROTOCOL___CAFCarDataClient callbackQueue:v23];
    remoteProxies = v10->_remoteProxies;
    v10->_remoteProxies = v24;

    v26 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    fastStartupRegistrations = v10->_fastStartupRegistrations;
    v10->_fastStartupRegistrations = v26;

    id v52 = v8;
    uint64_t v28 = [v8 registrations];
    ascTree = v10->_ascTree;
    v10->_ascTree = (CAFASCTree *)v28;

    v10->_allowPartialConfiguration = CAFDefaultsGetBoolean(@"allowPartialConfiguration", (id)1);
    v10->_pluginConfigsRequested = 0;
    notify_register_check("com.apple.private.caraccessoryframework.cardata.available", &v10->_carDataAvailableToken);
    notify_set_state(v10->_carDataAvailableToken, 0);
    notify_post("com.apple.private.caraccessoryframework.cardata.available");
    objc_storeStrong((id *)&v10->_sessionStatus, a3);
    [v7 addSessionObserver:v10];
    v30 = [(CAFDCarDataServiceAgent *)v10 sessionStatus];
    v31 = [v30 currentSession];

    if (v31)
    {
      v32 = [(CAFDCarDataServiceAgent *)v10 sessionStatus];
      v33 = [v32 currentSession];
      [(CAFDCarDataServiceAgent *)v10 sessionDidConnect:v33];
    }
    id v34 = v7;
    v35 = +[NSDistributedNotificationCenter defaultCenter];
    [v35 addObserver:v10 selector:"handlePairedVehiclesDidChange:" name:CRPairedVehiclesDidChangeNotification object:0];

    v36 = CAFDDataLogging();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG)) {
      -[CAFDCarDataServiceAgent initWithSessionStatus:config:]((uint64_t)&v10->_allowPartialConfiguration, v36, v37, v38, v39, v40, v41, v42);
    }

    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    v43 = [(CAFDCarDataServiceAgent *)v10 ascTree];
    v44 = [v43 treeLogLines];

    id v45 = [v44 countByEnumeratingWithState:&v53 objects:v60 count:16];
    if (v45)
    {
      id v46 = v45;
      uint64_t v47 = *(void *)v54;
      do
      {
        v48 = 0;
        do
        {
          if (*(void *)v54 != v47) {
            objc_enumerationMutation(v44);
          }
          uint64_t v49 = *(void *)(*((void *)&v53 + 1) + 8 * (void)v48);
          v50 = CAFDDataLogging();
          if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138543362;
            uint64_t v59 = v49;
            _os_log_debug_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEBUG, "registrations %{public}@", buf, 0xCu);
          }

          v48 = (char *)v48 + 1;
        }
        while (v46 != v48);
        id v46 = [v44 countByEnumeratingWithState:&v53 objects:v60 count:16];
      }
      while (v46);
    }

    id v7 = v34;
    id v8 = v52;
  }

  return v10;
}

- (void)close
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3((void *)&_mh_execute_header, v0, v1, "close connection start", v2, v3, v4, v5, v6);
}

void __32__CAFDCarDataServiceAgent_close__block_invoke(id a1, NSNumber *a2, CarDataChannel *a3, BOOL *a4)
{
  uint64_t v4 = a3;
  if ([(CarDataChannel *)v4 isOpened]) {
    [(CarDataChannel *)v4 invalidate];
  }
}

- (void)dealloc
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3((void *)&_mh_execute_header, v0, v1, "dealloc CarDataServiceAgent", v2, v3, v4, v5, v6);
}

- (BOOL)_setupCarDataChannel:(id)a3 channelType:(id)a4 qualityOfService:(id)a5 streamPriority:(id)a6 priority:(unint64_t)a7
{
  id v12 = a4;
  v13 = (CarDataChannel *)a5;
  id v14 = a6;
  id v15 = a3;
  uint64_t v16 = CAFDDataLogging();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    int v32 = 138544130;
    id v33 = v12;
    __int16 v34 = 2114;
    v35 = v13;
    __int16 v36 = 2114;
    id v37 = v14;
    __int16 v38 = 2050;
    unint64_t v39 = a7;
    _os_log_debug_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "Init car data channel START type: %{public}@ QoS: %{public}@ stream priority: %{public}@ priority: %{public}lu", (uint8_t *)&v32, 0x2Au);
  }

  v17 = CARSignpostLogForCategory();
  os_signpost_id_t v18 = 0xEEEEB0B5B2B2EEEELL;
  if (!self
    || (CARSignpostLogForCategory(),
        v19 = objc_claimAutoreleasedReturnValue(),
        os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v19, self),
        v19,
        v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL))
  {
    if (os_signpost_enabled(v17))
    {
      int v32 = 138543362;
      id v33 = v12;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v17, OS_SIGNPOST_EVENT, v18, "CAFd-ChannelInit", "Start %{public}@", (uint8_t *)&v32, 0xCu);
    }
  }

  id v20 = [objc_alloc((Class)CARSessionChannel) initWithSession:v15 channelType:v12 channelID:0 withoutReply:1 qualityOfService:v13 streamPriority:v14];
  if (v20)
  {
    v21 = [[CarDataChannel alloc] initWithChannel:v20 priority:a7];
    BOOL v22 = v21 != 0;
    if (v21)
    {
      os_unfair_lock_lock(&self->_channelLock);
      v23 = [(CAFDCarDataServiceAgent *)self carDataChannels];
      v24 = +[NSNumber numberWithUnsignedInteger:a7];
      [v23 setObject:v21 forKeyedSubscript:v24];

      [(CarDataChannel *)v21 setChannelDelegate:self];
      os_unfair_lock_unlock(&self->_channelLock);
      v25 = CAFDLogging();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        int v32 = 138543874;
        id v33 = v20;
        __int16 v34 = 2114;
        v35 = v21;
        __int16 v36 = 2114;
        id v37 = v12;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Open car session channel: %{public}@ data channel: %{public}@ type: %{public}@ START", (uint8_t *)&v32, 0x20u);
      }

      os_signpost_id_t v26 = 0xEEEEB0B5B2B2EEEELL;
      if (![(CarDataChannel *)v21 isOpened]) {
        [(CarDataChannel *)v21 openChannel];
      }
      v27 = CARSignpostLogForCategory();
      if (!self
        || (CARSignpostLogForCategory(),
            uint64_t v28 = objc_claimAutoreleasedReturnValue(),
            os_signpost_id_t v29 = os_signpost_id_make_with_pointer(v28, self),
            v28,
            os_signpost_id_t v26 = v29,
            v29 - 1 <= 0xFFFFFFFFFFFFFFFDLL))
      {
        if (os_signpost_enabled(v27))
        {
          int v32 = 138543362;
          id v33 = v12;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v27, OS_SIGNPOST_EVENT, v26, "CAFd-ChannelInit", "End %{public}@", (uint8_t *)&v32, 0xCu);
        }
      }

      v30 = CAFDDataLogging();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
        -[CAFDCarDataServiceAgent _setupCarDataChannel:channelType:qualityOfService:streamPriority:priority:]();
      }
    }
    else
    {
      v30 = CAFDLogging();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
        -[CAFDCarDataServiceAgent _setupCarDataChannel:channelType:qualityOfService:streamPriority:priority:]();
      }
    }
  }
  else
  {
    CAFDLogging();
    v21 = (CarDataChannel *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v21->super, OS_LOG_TYPE_ERROR)) {
      -[CAFDCarDataServiceAgent _setupCarDataChannel:channelType:qualityOfService:streamPriority:priority:]();
    }
    BOOL v22 = 0;
  }

  return v22;
}

- (void)_mainQueue_initVehicleDataSession:(id)a3
{
  id v4 = a3;
  uint64_t v5 = CAFDLogging();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Init car data session START", buf, 2u);
  }

  uint8_t v6 = [v4 MFiCertificateSerialNumber];
  if (v6)
  {
    id v7 = [objc_alloc((Class)NSUUID) initWithUUIDBytes:[v6 bytes]];
  }
  else
  {
    id v8 = CAFDLogging();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[CAFDCarDataServiceAgent _mainQueue_initVehicleDataSession:].cold.8();
    }

    id v7 = +[NSUUID UUID];
  }
  v9 = v7;
  if ([(CAFDCarDataServiceAgent *)self currentCarIdentifierIsEqual:v7])
  {
    v10 = CAFDLogging();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = [v9 UUIDString];
      *(_DWORD *)buf = 138543362;
      long long v53 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Init car data session END with same car %{public}@", buf, 0xCu);
    }
LABEL_41:

    goto LABEL_42;
  }
  [(CAFDCarDataServiceAgent *)self close];
  id v12 = [v4 configuration];

  if (!v12)
  {
    v10 = CAFDLogging();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[CAFDCarDataServiceAgent _mainQueue_initVehicleDataSession:]();
    }
    goto LABEL_41;
  }
  v13 = [v4 configuration];
  unsigned __int8 v14 = [v13 supportsVehicleData];

  if ((v14 & 1) == 0)
  {
    v10 = CAFDLogging();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "No vehicle data support", buf, 2u);
    }
    goto LABEL_41;
  }
  id v15 = [v4 configuration];
  uint64_t v16 = [v15 vehicleDataProtocolVersion];
  uint64_t v17 = kCarDataProtocolSupportedVersion;
  unsigned __int8 v18 = [v16 isEqualToString:kCarDataProtocolSupportedVersion];

  if ((v18 & 1) == 0)
  {
    v10 = CAFDLogging();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      [(CAFDCarDataServiceAgent *)v4 _mainQueue_initVehicleDataSession:v10];
    }
    goto LABEL_41;
  }
  v19 = [v4 configuration];
  id v20 = [v19 vehicleDataPluginCount];

  if (!v20)
  {
    v10 = CAFDLogging();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[CAFDCarDataServiceAgent _mainQueue_initVehicleDataSession:]();
    }
    goto LABEL_41;
  }
  os_signpost_id_t spid = 0xEEEEB0B5B2B2EEEELL;
  v21 = CARSignpostLogForCategory();
  os_signpost_id_t v22 = 0xEEEEB0B5B2B2EEEELL;
  if (!self
    || (CARSignpostLogForCategory(),
        v23 = objc_claimAutoreleasedReturnValue(),
        os_signpost_id_t v22 = os_signpost_id_make_with_pointer(v23, self),
        v23,
        v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL))
  {
    if (os_signpost_enabled(v21))
    {
      v24 = [v9 UUIDString];
      *(_DWORD *)buf = 138543362;
      long long v53 = v24;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v21, OS_SIGNPOST_EVENT, v22, "CAFd-SessionInit", "Start %{public}@", buf, 0xCu);
    }
  }

  v25 = [v4 configuration];
  id v26 = [v25 vehicleDataPluginCount];

  if (v26)
  {
    unint64_t v27 = 0;
    do
    {
      uint64_t v28 = [CarDataClient alloc];
      os_signpost_id_t v29 = +[NSNumber numberWithUnsignedInteger:v27];
      v30 = [(CarDataClient *)v28 initWithPluginID:v29];

      os_unfair_lock_lock(&self->_channelLock);
      v31 = [(CAFDCarDataServiceAgent *)self carDataClients];
      [v31 addObject:v30];

      [(CarDataClient *)v30 setClientDelegate:self];
      os_unfair_lock_unlock(&self->_channelLock);

      ++v27;
      int v32 = [v4 configuration];
      id v33 = [v32 vehicleDataPluginCount];
    }
    while (v27 < (unint64_t)v33);
  }
  uint64_t v34 = kFigEndpointRemoteControlSessionClientTypeUUIDKey_CarPlayProtocolData;
  v35 = +[NSNumber numberWithInt:0];
  LOBYTE(v34) = [(CAFDCarDataServiceAgent *)self _setupCarDataChannel:v4 channelType:v34 qualityOfService:v35 streamPriority:&off_100035D40 priority:0];

  if ((v34 & 1) == 0)
  {
    v50 = CAFDLogging();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
      -[CAFDCarDataServiceAgent _mainQueue_initVehicleDataSession:].cold.6();
    }
    goto LABEL_47;
  }
  uint64_t v36 = kFigEndpointRemoteControlSessionClientTypeUUIDKey_CarPlayProtocolData2;
  id v37 = +[NSNumber numberWithInt:12];
  LOBYTE(v36) = [(CAFDCarDataServiceAgent *)self _setupCarDataChannel:v4 channelType:v36 qualityOfService:v37 streamPriority:&off_100035D58 priority:1];

  if ((v36 & 1) == 0)
  {
    v50 = CAFDLogging();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
      -[CAFDCarDataServiceAgent _mainQueue_initVehicleDataSession:].cold.5();
    }
LABEL_47:

    [(CAFDCarDataServiceAgent *)self close];
    goto LABEL_42;
  }
  __int16 v38 = CARSignpostLogForCategory();
  if (!self
    || (CARSignpostLogForCategory(),
        unint64_t v39 = objc_claimAutoreleasedReturnValue(),
        os_signpost_id_t v40 = os_signpost_id_make_with_pointer(v39, self),
        v39,
        os_signpost_id_t spid = v40,
        v40 - 1 <= 0xFFFFFFFFFFFFFFFDLL))
  {
    if (os_signpost_enabled(v38))
    {
      uint64_t v41 = [v9 UUIDString];
      *(_DWORD *)buf = 138543362;
      long long v53 = v41;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v38, OS_SIGNPOST_EVENT, spid, "CAFd-SessionInit", "End %{public}@", buf, 0xCu);
    }
  }

  uint64_t v42 = CAFDDataLogging();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG)) {
    [(CAFDCarDataServiceAgent *)v9 _mainQueue_initVehicleDataSession:v42];
  }

  id v43 = [objc_alloc((Class)CAFCarConfiguration) initWithIdentifier:v9 session:v4];
  if (v43)
  {
    [(CAFDCarDataServiceAgent *)self setCurrentCar:v43];
    v44 = objc_opt_new();
    [(CAFDCarDataServiceAgent *)self setStateCaptureManager:v44];

    id v45 = [(CAFDCarDataServiceAgent *)self stateCaptureManager];
    [v45 setDelegate:self];

    id v46 = [(CAFDCarDataServiceAgent *)self stateCaptureManager];
    [v46 setCurrentCarConfiguration:v43];

    uint64_t v47 = [(CAFDCarDataServiceAgent *)self remoteProxies];
    [v47 didUpdateCurrentCarConfig:v43];

    v48 = CAFDLogging();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v49 = [v9 UUIDString];
      *(_DWORD *)buf = 138543362;
      long long v53 = v49;
      _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "Init car data session END UUID: %{public}@", buf, 0xCu);
    }
  }
  else
  {
    v48 = CAFDLogging();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
      -[CAFDCarDataServiceAgent _mainQueue_initVehicleDataSession:](v9);
    }
  }

LABEL_42:
}

- (void)handlePairedVehiclesDidChange:(id)a3
{
  id v4 = [(CAFDCarDataServiceAgent *)self workQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __57__CAFDCarDataServiceAgent_handlePairedVehiclesDidChange___block_invoke;
  block[3] = &unk_100034E68;
  block[4] = self;
  dispatch_async(v4, block);
}

void __57__CAFDCarDataServiceAgent_handlePairedVehiclesDidChange___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) sessionStatus];
  id v4 = [v2 currentSession];

  uint64_t v3 = v4;
  if (v4)
  {
    [*(id *)(a1 + 32) _mainQueue_initVehicleDataSession:v4];
    uint64_t v3 = v4;
  }
}

- (void)processFastStartupRegistrations:(id)a3 config:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CAFDCarDataServiceAgent *)self ascTree];

  if (v8)
  {
    objc_opt_class();
    id v9 = [v7 objectForKeyedSubscript:kCarDataConfigurationAccessoriesKey];
    if (v9 && (objc_opt_isKindOfClass() & 1) != 0) {
      id v10 = v9;
    }
    else {
      id v10 = 0;
    }

    if (!v10) {
      goto LABEL_18;
    }
    +[NSMutableSet set];
    id v20 = _NSConcreteStackBlock;
    uint64_t v21 = 3221225472;
    os_signpost_id_t v22 = __66__CAFDCarDataServiceAgent_processFastStartupRegistrations_config___block_invoke;
    v23 = &unk_100034EB8;
    v24 = self;
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    id v25 = v11;
    [v10 enumerateObjectsUsingBlock:&v20];
    id v12 = [(CAFDCarDataServiceAgent *)self fastStartupRegistrations];
    [v12 setObject:v11 forKeyedSubscript:v6];

    id v13 = [v11 count];
    if (!v13)
    {
LABEL_17:

LABEL_18:
      goto LABEL_19;
    }
    id v14 = v13;
    id v15 = CAFDLogging();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v27 = v6;
      __int16 v28 = 2050;
      id v29 = v14;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Fast Startup Registrations pluginID: %{public}@ instanceIDs count %{public}lu", buf, 0x16u);
    }

    uint64_t v16 = CARSignpostLogForCategory();
    if (self)
    {
      uint64_t v17 = CARSignpostLogForCategory();
      os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v17, self);

      if (v18 - 1 > 0xFFFFFFFFFFFFFFFDLL)
      {
LABEL_16:

        v19 = [v11 allObjects];
        [(CAFDCarDataServiceAgent *)self _addRegistration:v6 instanceIDs:v19 priority:&off_100035D70 withResponse:0];

        goto LABEL_17;
      }
    }
    else
    {
      os_signpost_id_t v18 = 0xEEEEB0B5B2B2EEEELL;
    }
    if (os_signpost_enabled(v16))
    {
      *(_DWORD *)buf = 138543618;
      id v27 = v6;
      __int16 v28 = 2050;
      id v29 = v14;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v16, OS_SIGNPOST_EVENT, v18, "Perform", "Fast Startup Registrations pluginID: %{public}@ count: %{public}lu", buf, 0x16u);
    }
    goto LABEL_16;
  }
LABEL_19:
}

void __66__CAFDCarDataServiceAgent_processFastStartupRegistrations_config___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  id v4 = v3;
  if (v4 && (objc_opt_isKindOfClass() & 1) != 0)
  {
    uint64_t v5 = +[CAFCarConfiguration getType:v4];
    objc_opt_class();
    id v6 = [v4 objectForKeyedSubscript:kCarDataConfigurationServicesKey];
    if (v6 && (objc_opt_isKindOfClass() & 1) != 0) {
      id v7 = v6;
    }
    else {
      id v7 = 0;
    }

    if (v5)
    {
      if (v7)
      {
        id v8 = [*(id *)(a1 + 32) ascTree];
        unsigned int v9 = [v8 hasAccessory:v5];

        if (v9)
        {
          v10[0] = _NSConcreteStackBlock;
          v10[1] = 3221225472;
          v10[2] = __66__CAFDCarDataServiceAgent_processFastStartupRegistrations_config___block_invoke_2;
          v10[3] = &unk_100034C48;
          v10[4] = *(void *)(a1 + 32);
          id v11 = v5;
          id v12 = *(id *)(a1 + 40);
          [v7 enumerateObjectsUsingBlock:v10];
        }
      }
    }
  }
}

void __66__CAFDCarDataServiceAgent_processFastStartupRegistrations_config___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  id v4 = v3;
  if (v4 && (objc_opt_isKindOfClass() & 1) != 0)
  {
    uint64_t v5 = +[CAFCarConfiguration getType:v4];
    if (v5)
    {
      id v6 = [*(id *)(a1 + 32) ascTree];
      unsigned int v7 = [v6 hasAccessory:*(void *)(a1 + 40) service:v5];

      if (v7)
      {
        objc_opt_class();
        id v8 = [v4 objectForKeyedSubscript:kCarDataConfigurationCharacteristicsKey];
        if (v8 && (objc_opt_isKindOfClass() & 1) != 0) {
          id v9 = v8;
        }
        else {
          id v9 = 0;
        }

        v19[0] = _NSConcreteStackBlock;
        v19[1] = 3221225472;
        v19[2] = __66__CAFDCarDataServiceAgent_processFastStartupRegistrations_config___block_invoke_3;
        v19[3] = &unk_100034E90;
        id v10 = *(void **)(a1 + 40);
        v19[4] = *(void *)(a1 + 32);
        id v20 = v10;
        id v11 = v5;
        id v21 = v11;
        id v22 = *(id *)(a1 + 48);
        [v9 enumerateObjectsUsingBlock:v19];
        objc_opt_class();
        id v12 = [v4 objectForKeyedSubscript:kCarDataConfigurationControlsKey];
        if (v12 && (objc_opt_isKindOfClass() & 1) != 0) {
          id v13 = v12;
        }
        else {
          id v13 = 0;
        }

        v15[0] = _NSConcreteStackBlock;
        v15[1] = 3221225472;
        v15[2] = __66__CAFDCarDataServiceAgent_processFastStartupRegistrations_config___block_invoke_4;
        v15[3] = &unk_100034E90;
        id v14 = *(void **)(a1 + 40);
        v15[4] = *(void *)(a1 + 32);
        id v16 = v14;
        id v17 = v11;
        id v18 = *(id *)(a1 + 48);
        [v13 enumerateObjectsUsingBlock:v15];
      }
    }
  }
}

void __66__CAFDCarDataServiceAgent_processFastStartupRegistrations_config___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  id v10 = v3;
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0)
  {
    id v4 = +[CAFCarConfiguration getType:v10];
    objc_opt_class();
    id v5 = [v10 objectForKeyedSubscript:kCarDataConfigurationIIDKey];
    if (v5 && (objc_opt_isKindOfClass() & 1) != 0) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }

    if (v4)
    {
      if (v6)
      {
        unsigned int v7 = [*(id *)(a1 + 32) ascTree];
        unsigned int v8 = [v7 hasAccessory:*(void *)(a1 + 40) service:*(void *)(a1 + 48) characteristic:v4];

        if (v8)
        {
          id v9 = [v10 objectForKey:kCarDataConfigurationInitialValueKey];
          if ((+[CAFCarConfiguration getBoolean:v10 key:kCarDataConfigurationMutableKey] & 1) != 0|| !v9)
          {
            [*(id *)(a1 + 56) addObject:v6];
          }
        }
      }
    }
  }
}

void __66__CAFDCarDataServiceAgent_processFastStartupRegistrations_config___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  id v9 = v3;
  if (v9 && (objc_opt_isKindOfClass() & 1) != 0)
  {
    id v4 = +[CAFCarConfiguration getType:v9];
    objc_opt_class();
    id v5 = [v9 objectForKeyedSubscript:kCarDataConfigurationIIDKey];
    if (v5 && (objc_opt_isKindOfClass() & 1) != 0) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }

    if (v4)
    {
      if (v6)
      {
        unsigned int v7 = [*(id *)(a1 + 32) ascTree];
        unsigned int v8 = [v7 hasAccessory:*(void *)(a1 + 40) service:*(void *)(a1 + 48) control:v4];

        if (v8) {
          [*(id *)(a1 + 56) addObject:v6];
        }
      }
    }
  }
}

- (CAFCarConfiguration)currentCar
{
  p_carLock = &self->_carLock;
  os_unfair_lock_lock(&self->_carLock);
  id v4 = self->_currentCar;
  os_unfair_lock_unlock(p_carLock);

  return v4;
}

- (void)setCurrentCar:(id)a3
{
  id v4 = (CAFCarConfiguration *)a3;
  os_unfair_lock_lock(&self->_carLock);
  currentCar = self->_currentCar;
  self->_currentCar = v4;

  os_unfair_lock_unlock(&self->_carLock);
}

- (BOOL)currentCarIdentifierIsEqual:(id)a3
{
  id v4 = a3;
  p_carLock = &self->_carLock;
  os_unfair_lock_lock(&self->_carLock);
  currentCar = self->_currentCar;
  if (currentCar)
  {
    unsigned int v7 = [(CAFCarConfiguration *)currentCar uniqueIdentifier];
    unsigned __int8 v8 = [v4 isEqual:v7];
  }
  else
  {
    unsigned __int8 v8 = 0;
  }
  os_unfair_lock_unlock(p_carLock);

  return v8;
}

- (unint64_t)currentCarPluginCount
{
  p_carLock = &self->_carLock;
  os_unfair_lock_lock(&self->_carLock);
  id v4 = [(CAFCarConfiguration *)self->_currentCar pluginCount];
  os_unfair_lock_unlock(p_carLock);
  return (unint64_t)v4;
}

- (void)_observeAssertion:(id)a3
{
  p_assertionCounterLock = &self->_assertionCounterLock;
  id v5 = a3;
  os_unfair_lock_lock(p_assertionCounterLock);
  [v5 addObserver:self];

  [(CAFDCarDataServiceAgent *)self setAssertionCount:(char *)[(CAFDCarDataServiceAgent *)self assertionCount] + 1];
  unint64_t v6 = [(CAFDCarDataServiceAgent *)self assertionCount];
  unsigned int v7 = CAFDAssertionLogging();
  unsigned __int8 v8 = v7;
  if (v6 == 1800)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      -[CAFDCarDataServiceAgent _observeAssertion:](self, v8);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    -[CAFDCarDataServiceAgent _observeAssertion:](self);
  }

  os_unfair_lock_unlock(p_assertionCounterLock);
}

- (void)assertion:(id)a3 didInvalidateWithError:(id)a4
{
  p_assertionCounterLock = &self->_assertionCounterLock;
  id v6 = a3;
  os_unfair_lock_lock(p_assertionCounterLock);
  [v6 removeObserver:self];

  [(CAFDCarDataServiceAgent *)self setAssertionCount:(char *)[(CAFDCarDataServiceAgent *)self assertionCount] - 1];
  unsigned int v7 = CAFDAssertionLogging();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[CAFDCarDataServiceAgent assertion:didInvalidateWithError:](self);
  }

  os_unfair_lock_unlock(p_assertionCounterLock);
}

- (void)sessionDidConnect:(id)a3
{
  id v4 = a3;
  id v5 = CAFDDataLogging();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[CAFDCarDataServiceAgent sessionDidConnect:]();
  }

  id v6 = [(CAFDCarDataServiceAgent *)self workQueue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = __45__CAFDCarDataServiceAgent_sessionDidConnect___block_invoke;
  v8[3] = &unk_100034D60;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

uint64_t __45__CAFDCarDataServiceAgent_sessionDidConnect___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) osTransaction];

  if (!v2)
  {
    id v3 = (void *)os_transaction_create();
    [*(id *)(a1 + 32) setOsTransaction:v3];
  }
  [*(id *)(a1 + 32) _mainQueue_initVehicleDataSession:*(void *)(a1 + 40)];
  notify_set_state((int)[*(id *)(a1 + 32) carDataAvailableToken], 1uLL);

  return notify_post("com.apple.private.caraccessoryframework.cardata.available");
}

- (void)sessionDidDisconnect:(id)a3
{
  id v4 = CAFDDataLogging();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[CAFDCarDataServiceAgent sessionDidDisconnect:]();
  }

  id v5 = [(CAFDCarDataServiceAgent *)self workQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __48__CAFDCarDataServiceAgent_sessionDidDisconnect___block_invoke;
  block[3] = &unk_100034E68;
  block[4] = self;
  dispatch_async(v5, block);
}

void __48__CAFDCarDataServiceAgent_sessionDidDisconnect___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) close];
  dispatch_time_t v2 = dispatch_time(0, 5000000000);
  id v3 = [*(id *)(a1 + 32) workQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __48__CAFDCarDataServiceAgent_sessionDidDisconnect___block_invoke_2;
  block[3] = &unk_100034E68;
  block[4] = *(void *)(a1 + 32);
  dispatch_after(v2, v3, block);
}

void __48__CAFDCarDataServiceAgent_sessionDidDisconnect___block_invoke_2(uint64_t a1)
{
  dispatch_time_t v2 = [*(id *)(a1 + 32) sessionStatus];
  id v3 = [v2 currentSession];

  id v4 = CAFDDataLogging();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
  if (v3)
  {
    if (v5) {
      __48__CAFDCarDataServiceAgent_sessionDidDisconnect___block_invoke_2_cold_2();
    }
  }
  else
  {
    if (v5) {
      __48__CAFDCarDataServiceAgent_sessionDidDisconnect___block_invoke_2_cold_1();
    }

    [*(id *)(a1 + 32) setOsTransaction:0];
    notify_set_state((int)[*(id *)(a1 + 32) carDataAvailableToken], 0);
    notify_post("com.apple.private.caraccessoryframework.cardata.available");
  }
}

- (void)carDataChannelDidOpen:(id)a3
{
  id v4 = a3;
  BOOL v5 = CAFDDataLogging();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[CAFDCarDataServiceAgent carDataChannelDidOpen:].cold.4();
  }

  os_unfair_lock_lock(&self->_channelLock);
  id v6 = [(CAFDCarDataServiceAgent *)self carDataChannels];
  id v7 = [v6 count];

  if (v7 == (id)2)
  {
    uint64_t v15 = 0;
    id v16 = &v15;
    uint64_t v17 = 0x2020000000;
    char v18 = 1;
    unsigned __int8 v8 = [(CAFDCarDataServiceAgent *)self carDataChannels];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = __49__CAFDCarDataServiceAgent_carDataChannelDidOpen___block_invoke;
    v14[3] = &unk_100034EE0;
    v14[4] = &v15;
    [v8 enumerateKeysAndObjectsUsingBlock:v14];

    os_unfair_lock_unlock(&self->_channelLock);
    if (*((unsigned char *)v16 + 24))
    {
      id v9 = CAFDLogging();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        -[CAFDCarDataServiceAgent carDataChannelDidOpen:]();
      }

      id v10 = [(CAFDCarDataServiceAgent *)self workQueue];
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = __49__CAFDCarDataServiceAgent_carDataChannelDidOpen___block_invoke_240;
      v13[3] = &unk_100034E68;
      v13[4] = self;
      dispatch_async(v10, v13);
    }
    else
    {
      id v12 = CAFDLogging();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        -[CAFDCarDataServiceAgent carDataChannelDidOpen:]();
      }
    }
    _Block_object_dispose(&v15, 8);
  }
  else
  {
    os_unfair_lock_unlock(&self->_channelLock);
    id v11 = CAFDLogging();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[CAFDCarDataServiceAgent carDataChannelDidOpen:]();
    }
  }
}

void __49__CAFDCarDataServiceAgent_carDataChannelDidOpen___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v6 = a3;
  if (([v6 isOpened] & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
    id v7 = CAFDLogging();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __49__CAFDCarDataServiceAgent_carDataChannelDidOpen___block_invoke_cold_1();
    }

    *a4 = 1;
  }
}

void __49__CAFDCarDataServiceAgent_carDataChannelDidOpen___block_invoke_240(uint64_t a1)
{
  dispatch_time_t v2 = (char *)[*(id *)(a1 + 32) currentCarPluginCount];
  if (v2)
  {
    id v3 = v2;
    if (([*(id *)(a1 + 32) pluginConfigsRequested] & 1) == 0)
    {
      [*(id *)(a1 + 32) setPluginConfigsRequested:1];
      for (i = 0; i != v3; ++i)
      {
        BOOL v5 = *(void **)(a1 + 32);
        id v6 = +[NSNumber numberWithUnsignedInteger:i];
        id v7 = [v5 _getClient:v6];

        v9[0] = _NSConcreteStackBlock;
        v9[1] = 3221225472;
        v9[2] = __49__CAFDCarDataServiceAgent_carDataChannelDidOpen___block_invoke_241;
        v9[3] = &__block_descriptor_40_e21_v16__0__CAFResponse_8l;
        v9[4] = i;
        [v7 requestConfigurationWithPriority:&off_100035D70 withResponse:v9];
      }
    }
  }
  else
  {
    unsigned __int8 v8 = CAFGeneralLogging();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __49__CAFDCarDataServiceAgent_carDataChannelDidOpen___block_invoke_240_cold_1();
    }
  }
}

void __49__CAFDCarDataServiceAgent_carDataChannelDidOpen___block_invoke_241(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 error];

  if (v4)
  {
    BOOL v5 = CAFDLogging();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __49__CAFDCarDataServiceAgent_carDataChannelDidOpen___block_invoke_241_cold_1(a1, v3, v5);
    }
  }
}

- (void)carDataChannelDidClose:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    BOOL v5 = CAFDDataLogging();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[CAFDCarDataServiceAgent carDataChannelDidClose:]();
    }

    os_unfair_lock_lock(&self->_channelLock);
    id v6 = [(CAFDCarDataServiceAgent *)self carDataChannels];
    id v7 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v4 priority]);
    [v6 removeObjectForKey:v7];

    unsigned __int8 v8 = [(CAFDCarDataServiceAgent *)self carDataChannels];
    [v8 count];

    os_unfair_lock_unlock(&self->_channelLock);
    id v9 = CAFDDataLogging();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[CAFDCarDataServiceAgent carDataChannelDidClose:]();
    }
  }
}

- (void)carDataChannelDidReceive:(id)a3 pluginID:(id)a4 payload:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(CAFDCarDataServiceAgent *)self _getClient:v9];
  if (v11)
  {
    [v11 receiveData:v10 priority:[v8 priority]];
  }
  else
  {
    id v12 = CAFDChannelLogging();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[CAFDCarDataServiceAgent carDataChannelDidReceive:pluginID:payload:]();
    }
  }
}

- (void)didReceiveConfigFromPluginID:(id)a3 config:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = CAFDDataLogging();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[CAFDCarDataServiceAgent didReceiveConfigFromPluginID:config:]();
  }

  objc_initWeak(&location, self);
  id v9 = [(CAFDCarDataServiceAgent *)self workQueue];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = __63__CAFDCarDataServiceAgent_didReceiveConfigFromPluginID_config___block_invoke;
  v12[3] = &unk_100034F28;
  objc_copyWeak(&v15, &location);
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(v9, v12);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __63__CAFDCarDataServiceAgent_didReceiveConfigFromPluginID_config___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _workQueue_didReceiveConfigFromPluginID:*(void *)(a1 + 32) config:*(void *)(a1 + 40)];
}

- (void)_workQueue_didReceiveConfigFromPluginID:(id)a3 config:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CAFDCarDataServiceAgent *)self workQueue];
  dispatch_assert_queue_V2(v8);

  p_carLock = &self->_carLock;
  os_unfair_lock_lock(&self->_carLock);
  if (self->_currentCar)
  {
    id v10 = CAFDDataLogging();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[CAFDCarDataServiceAgent _workQueue_didReceiveConfigFromPluginID:config:]();
    }

    [(CAFCarConfiguration *)self->_currentCar updateConfiguration:v6 pluginConfig:v7];
    [(CAFDCarDataServiceAgent *)self processFastStartupRegistrations:v6 config:v7];
    unsigned int v11 = [(CAFCarConfiguration *)self->_currentCar isConfigured];
    id v12 = CAFDLogging();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
    if (v11)
    {
      if (v13)
      {
        id v14 = [(CAFCarConfiguration *)self->_currentCar uniqueIdentifier];
        id v15 = [v14 UUIDString];
        int v29 = 138543362;
        id v30 = v15;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Configuration complete UUID: %{public}@", (uint8_t *)&v29, 0xCu);
      }
      CAFSignpostEmit_InstantOn();
    }
    else
    {
      if (v13)
      {
        char v18 = [(CAFCarConfiguration *)self->_currentCar pluginConfigs];
        id v19 = [v18 count];
        id v20 = [(CAFCarConfiguration *)self->_currentCar pluginCount];
        id v21 = [(CAFCarConfiguration *)self->_currentCar uniqueIdentifier];
        id v22 = [v21 UUIDString];
        int v29 = 134349570;
        id v30 = v19;
        __int16 v31 = 2050;
        id v32 = v20;
        __int16 v33 = 2114;
        uint64_t v34 = v22;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Configuration incomplete with %{public}ld of %{public}ld plugins configured UUID: %{public}@", (uint8_t *)&v29, 0x20u);
      }
      if (![(CAFDCarDataServiceAgent *)self allowPartialConfiguration])
      {
        uint64_t v17 = 0;
        goto LABEL_16;
      }
    }
    uint64_t v17 = [(CAFCarConfiguration *)self->_currentCar pluginConfigs];
LABEL_16:
    v23 = CAFDDataLogging();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
      -[CAFDCarDataServiceAgent _workQueue_didReceiveConfigFromPluginID:config:]();
    }

    os_unfair_lock_unlock(&self->_carLock);
    v24 = [(CAFDCarDataServiceAgent *)self stateCaptureManager];
    [v24 carConfigDidUpdate];

    if ([v17 count])
    {
      id v25 = CAFDLogging();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        id v26 = [v17 allKeys];
        id v27 = [v26 componentsJoinedByString:@", "];
        int v29 = 138543362;
        id v30 = v27;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Updating remoteProxies configs [%{public}@]", (uint8_t *)&v29, 0xCu);
      }
      __int16 v28 = [(CAFDCarDataServiceAgent *)self remoteProxies];
      [v28 didUpdateConfig:v17];
    }
    goto LABEL_22;
  }
  id v16 = CAFGeneralLogging();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
    -[CAFDCarDataServiceAgent _workQueue_didReceiveConfigFromPluginID:config:]();
  }

  os_unfair_lock_unlock(p_carLock);
  uint64_t v17 = 0;
LABEL_22:
}

- (void)didReceiveUpdateFromPluginID:(id)a3 values:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CAFDCarDataServiceAgent *)self workQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __63__CAFDCarDataServiceAgent_didReceiveUpdateFromPluginID_values___block_invoke;
  block[3] = &unk_100034DB0;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __63__CAFDCarDataServiceAgent_didReceiveUpdateFromPluginID_values___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) remoteProxies];
  [v2 didUpdatePluginID:*(void *)(a1 + 40) values:*(void *)(a1 + 48)];
}

- (void)didReceiveNotificationFromPluginID:(id)a3 instanceID:(id)a4 value:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  unsigned int v11 = [(CAFDCarDataServiceAgent *)self workQueue];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = __79__CAFDCarDataServiceAgent_didReceiveNotificationFromPluginID_instanceID_value___block_invoke;
  v15[3] = &unk_100034E00;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

void __79__CAFDCarDataServiceAgent_didReceiveNotificationFromPluginID_instanceID_value___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) remoteProxies];
  [v2 didNotifyPluginID:*(void *)(a1 + 40) instanceID:*(void *)(a1 + 48) value:*(void *)(a1 + 56)];
}

- (void)didReceiveRequestFromPluginID:(id)a3 instanceID:(id)a4 value:(id)a5 withResponse:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [(CAFDCarDataServiceAgent *)self workQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __87__CAFDCarDataServiceAgent_didReceiveRequestFromPluginID_instanceID_value_withResponse___block_invoke;
  block[3] = &unk_100034DD8;
  block[4] = self;
  id v20 = v10;
  id v21 = v11;
  id v22 = v12;
  id v23 = v13;
  id v15 = v13;
  id v16 = v12;
  id v17 = v11;
  id v18 = v10;
  dispatch_async(v14, block);
}

void __87__CAFDCarDataServiceAgent_didReceiveRequestFromPluginID_instanceID_value_withResponse___block_invoke(id *a1)
{
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2810000000;
  v16[3] = &unk_1000310ED;
  int v17 = 0;
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  char v15 = 0;
  id v2 = [a1[4] connections];
  id v3 = [v2 mutableCopy];

  id v4 = [a1[4] connections];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __87__CAFDCarDataServiceAgent_didReceiveRequestFromPluginID_instanceID_value_withResponse___block_invoke_2;
  v6[3] = &unk_100034F78;
  id v7 = a1[5];
  id v8 = a1[6];
  id v9 = a1[7];
  id v12 = v16;
  id v5 = v3;
  id v10 = v5;
  id v13 = v14;
  id v11 = a1[8];
  [v4 enumerateObjectsUsingBlock:v6];

  _Block_object_dispose(v14, 8);
  _Block_object_dispose(v16, 8);
}

void __87__CAFDCarDataServiceAgent_didReceiveRequestFromPluginID_instanceID_value_withResponse___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = __87__CAFDCarDataServiceAgent_didReceiveRequestFromPluginID_instanceID_value_withResponse___block_invoke_3;
  v8[3] = &unk_100034F50;
  uint64_t v14 = *(void *)(a1 + 72);
  uint64_t v6 = *(void *)(a1 + 48);
  id v9 = *(id *)(a1 + 56);
  id v10 = v3;
  uint64_t v15 = *(void *)(a1 + 80);
  id v11 = *(id *)(a1 + 32);
  id v12 = *(id *)(a1 + 40);
  id v13 = *(id *)(a1 + 64);
  id v7 = v3;
  [v7 didRequestPluginID:v4 instanceID:v5 value:v6 withResponse:v8];
}

void __87__CAFDCarDataServiceAgent_didReceiveRequestFromPluginID_instanceID_value_withResponse___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(*(void *)(a1 + 72) + 8) + 32));
  [*(id *)(a1 + 32) removeObject:*(void *)(a1 + 40)];
  id v7 = [*(id *)(a1 + 32) count];
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24))
  {
    if (!v6)
    {
      id v13 = CAFDDataLogging();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        __87__CAFDCarDataServiceAgent_didReceiveRequestFromPluginID_instanceID_value_withResponse___block_invoke_3_cold_1();
      }

      (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
      goto LABEL_14;
    }
    id v8 = v7;
    id v9 = [v6 code];
    if (v9 != (id)9)
    {
      id v14 = v9;
      uint64_t v15 = CAFDDataLogging();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        __87__CAFDCarDataServiceAgent_didReceiveRequestFromPluginID_instanceID_value_withResponse___block_invoke_3_cold_3();
      }

      uint64_t v16 = *(void *)(a1 + 64);
      int v17 = +[NSError errorWithDomain:@"com.apple.caraccessoryframework.cardata" code:v14 userInfo:0];
      (*(void (**)(uint64_t, void, void *))(v16 + 16))(v16, 0, v17);

      goto LABEL_14;
    }
    if (!v8)
    {
      id v10 = CAFDDataLogging();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        __87__CAFDCarDataServiceAgent_didReceiveRequestFromPluginID_instanceID_value_withResponse___block_invoke_3_cold_2();
      }

      uint64_t v11 = *(void *)(a1 + 64);
      id v12 = +[NSError errorWithDomain:@"com.apple.caraccessoryframework.cardata" code:9 userInfo:0];
      (*(void (**)(uint64_t, void, void *))(v11 + 16))(v11, 0, v12);

LABEL_14:
      *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 1;
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(*(void *)(a1 + 72) + 8) + 32));
}

- (void)didReceiveErrorFromPluginID:(id)a3 error:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = CAFDDataLogging();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    -[CAFDCarDataServiceAgent didReceiveErrorFromPluginID:error:]();
  }
}

- (void)sendToPluginID:(id)a3 payload:(id)a4 priority:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void (**)(id, void *))a6;
  id v14 = [(CAFDCarDataServiceAgent *)self _getChannel:v12];
  uint64_t v15 = v14;
  if (v14)
  {
    [v14 sendToPluginID:v10 payload:v11 withCompletion:v13];
  }
  else
  {
    uint64_t v16 = CAFDLogging();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      int v18 = 138543874;
      id v19 = self;
      __int16 v20 = 2114;
      id v21 = v10;
      __int16 v22 = 2114;
      id v23 = v12;
      _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%{public}@: Send vehicle data pluginID: %{public}@ with priority: %{public}@ failed due to missing channel", (uint8_t *)&v18, 0x20u);
    }

    if (v13)
    {
      int v17 = +[NSError errorWithDomain:@"com.apple.caraccessoryframework.cardata" code:1 userInfo:0];
      v13[2](v13, v17);
    }
  }
}

- (unint64_t)pluginCount
{
  id v2 = [(CAFDCarDataServiceAgent *)self carDataClients];
  id v3 = [v2 count];

  return (unint64_t)v3;
}

- (id)registrationsForPluginID:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  id v6 = [(CAFDCarDataServiceAgent *)self workQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __52__CAFDCarDataServiceAgent_registrationsForPluginID___block_invoke;
  block[3] = &unk_100034DB0;
  block[4] = self;
  id v13 = v4;
  id v7 = v5;
  id v14 = v7;
  id v8 = v4;
  dispatch_sync(v6, block);

  id v9 = v14;
  id v10 = v7;

  return v10;
}

void __52__CAFDCarDataServiceAgent_registrationsForPluginID___block_invoke(uint64_t a1)
{
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = [*(id *)(a1 + 32) connections];
  id v17 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v17)
  {
    uint64_t v16 = *(void *)v24;
    do
    {
      uint64_t v2 = 0;
      do
      {
        if (*(void *)v24 != v16) {
          objc_enumerationMutation(obj);
        }
        uint64_t v18 = v2;
        id v3 = *(void **)(*((void *)&v23 + 1) + 8 * v2);
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        id v4 = [v3 registrationsForPluginID:*(void *)(a1 + 40)];
        id v5 = [v4 countByEnumeratingWithState:&v19 objects:v27 count:16];
        if (v5)
        {
          id v6 = v5;
          uint64_t v7 = *(void *)v20;
          do
          {
            for (i = 0; i != v6; i = (char *)i + 1)
            {
              if (*(void *)v20 != v7) {
                objc_enumerationMutation(v4);
              }
              uint64_t v9 = *(void *)(*((void *)&v19 + 1) + 8 * i);
              id v10 = [*(id *)(a1 + 48) objectForKeyedSubscript:v9];

              if (!v10)
              {
                id v11 = objc_opt_new();
                [*(id *)(a1 + 48) setObject:v11 forKeyedSubscript:v9];
              }
              id v12 = [*(id *)(a1 + 48) objectForKeyedSubscript:v9];
              id v13 = [v3 connection];
              id v14 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v13 processIdentifier]);
              [v12 addObject:v14];
            }
            id v6 = [v4 countByEnumeratingWithState:&v19 objects:v27 count:16];
          }
          while (v6);
        }

        uint64_t v2 = v18 + 1;
      }
      while ((id)(v18 + 1) != v17);
      id v17 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v17);
  }
}

- (id)valuesForPluginID:(unint64_t)a3 iids:(id)a4
{
  id v6 = a4;
  uint64_t v7 = objc_opt_new();
  id v8 = [(CAFDCarDataServiceAgent *)self carDataClients];
  id v9 = [v8 count];

  if ((unint64_t)v9 <= a3)
  {
    id v11 = CAFDDataLogging();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[CAFDCarDataServiceAgent valuesForPluginID:iids:](a3);
    }
  }
  else
  {
    id v10 = [(CAFDCarDataServiceAgent *)self carDataClients];
    id v11 = [v10 objectAtIndexedSubscript:a3];

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v12 = v6;
    id v13 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v21;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v21 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void *)(*((void *)&v20 + 1) + 8 * i);
          uint64_t v18 = -[NSObject cachedValueForInstanceID:](v11, "cachedValueForInstanceID:", v17, (void)v20);
          [v7 setObject:v18 forKeyedSubscript:v17];
        }
        id v14 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v14);
    }
  }

  return v7;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  id v6 = CAFDLogging();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v19 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "shouldAcceptNewConnection: %{public}@", buf, 0xCu);
  }

  uint64_t v7 = [v5 serviceName];
  if ([v7 isEqualToString:@"com.apple.caraccessoryframework.cardata"])
  {
    id v8 = [v5 valueForEntitlement:@"com.apple.private.carp"];
    unsigned int v9 = [v8 BOOLValue];

    if (v9)
    {
      id v10 = CAFDLogging();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v19 = v5;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Receiving Connection Service: %{public}@", buf, 0xCu);
      }

      id v11 = [(CAFDCarDataServiceAgent *)self workQueue];
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = __62__CAFDCarDataServiceAgent_listener_shouldAcceptNewConnection___block_invoke;
      v15[3] = &unk_100034D60;
      uint64_t v16 = v5;
      uint64_t v17 = self;
      dispatch_async(v11, v15);

      BOOL v12 = 1;
      id v13 = v16;
      goto LABEL_12;
    }
  }
  else
  {
  }
  id v13 = CAFDLogging();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v19 = v5;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Receiving unknown connection: %{public}@", buf, 0xCu);
  }
  BOOL v12 = 0;
LABEL_12:

  return v12;
}

void __62__CAFDCarDataServiceAgent_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  uint64_t v2 = [[_CAFdConnectionProxy alloc] initWithConnection:*(void *)(a1 + 32) agent:*(void *)(a1 + 40)];
  id v3 = CAFDDataLogging();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __62__CAFDCarDataServiceAgent_listener_shouldAcceptNewConnection___block_invoke_cold_1();
  }

  id v4 = [*(id *)(a1 + 40) connections];
  [v4 addObject:v2];

  id v5 = [*(id *)(a1 + 40) remoteProxies];
  [v5 addObserver:v2];
}

- (void)_removeConnection:(id)a3
{
  id v4 = a3;
  id v5 = [(CAFDCarDataServiceAgent *)self workQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __45__CAFDCarDataServiceAgent__removeConnection___block_invoke;
  v7[3] = &unk_100034D60;
  id v8 = v4;
  unsigned int v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __45__CAFDCarDataServiceAgent__removeConnection___block_invoke(uint64_t a1)
{
  uint64_t v2 = CAFDDataLogging();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __45__CAFDCarDataServiceAgent__removeConnection___block_invoke_cold_1(a1, v2, v3, v4, v5, v6, v7, v8);
  }

  unsigned int v9 = [*(id *)(a1 + 40) connections];
  [v9 removeObject:*(void *)(a1 + 32)];

  id v10 = [*(id *)(a1 + 40) remoteProxies];
  [v10 unregisterObserver:*(void *)(a1 + 32)];
}

- (void)_addRegistration:(id)a3 instanceIDs:(id)a4 priority:(id)a5 withResponse:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [(CAFDCarDataServiceAgent *)self _getClient:v10];
  uint64_t v15 = CAFDDataLogging();
  uint64_t v16 = v15;
  if (v14)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543874;
      id v21 = v10;
      __int16 v22 = 2050;
      id v23 = [v11 count];
      __int16 v24 = 2114;
      id v25 = v12;
      _os_log_debug_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "Add registartion pluginID: %{public}@ instanceIDs count %{public}lu with priority: %{public}@", buf, 0x20u);
    }

    [v14 registerInstanceIDs:v11 priority:v12 withResponse:v13];
  }
  else
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[CAFDCarDataServiceAgent _addRegistration:instanceIDs:priority:withResponse:]();
    }

    if (v13)
    {
      uint64_t v17 = [(CAFDCarDataServiceAgent *)self workQueue];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = __78__CAFDCarDataServiceAgent__addRegistration_instanceIDs_priority_withResponse___block_invoke;
      block[3] = &unk_100034D38;
      id v19 = v13;
      dispatch_async(v17, block);
    }
  }
}

void __78__CAFDCarDataServiceAgent__addRegistration_instanceIDs_priority_withResponse___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = objc_alloc((Class)CAFResponse);
  id v4 = +[NSError errorWithDomain:@"com.apple.caraccessoryframework.cardata" code:2 userInfo:0];
  id v3 = [v2 initWithError:v4];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v3);
}

- (void)_removeRegistration:(id)a3 instanceIDs:(id)a4 priority:(id)a5 withResponse:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = (_UNKNOWN **)a5;
  id v13 = a6;
  id v14 = [objc_alloc((Class)NSMutableArray) initWithArray:v11];
  if ([v12 isEqual:CAFRequestForcedPriority])
  {

    uint64_t v15 = CAFDDataLogging();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      -[CAFDCarDataServiceAgent _removeRegistration:instanceIDs:priority:withResponse:]((uint64_t)v10, v14, v15);
    }
    id v12 = &off_100035D40;
  }
  else
  {
    uint64_t v16 = [(CAFDCarDataServiceAgent *)self connections];
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = __81__CAFDCarDataServiceAgent__removeRegistration_instanceIDs_priority_withResponse___block_invoke;
    v33[3] = &unk_100034FA0;
    uint64_t v17 = v10;
    uint64_t v34 = v17;
    id v18 = v14;
    id v35 = v18;
    [v16 enumerateObjectsUsingBlock:v33];

    id v19 = [(CAFDCarDataServiceAgent *)self fastStartupRegistrations];
    long long v20 = [v19 objectForKeyedSubscript:v17];

    if (v20)
    {
      id v21 = [v20 allObjects];
      [v18 removeObjectsInArray:v21];
    }
    __int16 v22 = CAFDDataLogging();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      id v28 = [v18 count];
      *(_DWORD *)buf = 138543874;
      id v37 = v17;
      __int16 v38 = 2050;
      id v39 = v28;
      __int16 v40 = 2114;
      uint64_t v41 = v12;
      _os_log_debug_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "Remove registration pluginID: %{public}@ instanceIDs count %{public}lu with priority: %{public}@", buf, 0x20u);
    }

    uint64_t v15 = v34;
  }

  if ([v14 count])
  {
    id v23 = [(CAFDCarDataServiceAgent *)self _getClient:v10];
    __int16 v24 = v23;
    if (v23)
    {
      [v23 unregisterInstanceIDs:v11 priority:v12 withResponse:v13];
    }
    else
    {
      long long v26 = CAFDDataLogging();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        -[CAFDCarDataServiceAgent _removeRegistration:instanceIDs:priority:withResponse:]();
      }

      if (v13)
      {
        id v27 = [(CAFDCarDataServiceAgent *)self workQueue];
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = __81__CAFDCarDataServiceAgent__removeRegistration_instanceIDs_priority_withResponse___block_invoke_251;
        block[3] = &unk_100034D38;
        id v32 = v13;
        dispatch_async(v27, block);
      }
    }
    goto LABEL_19;
  }
  if (v13)
  {
    id v25 = [(CAFDCarDataServiceAgent *)self workQueue];
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = __81__CAFDCarDataServiceAgent__removeRegistration_instanceIDs_priority_withResponse___block_invoke_2;
    v29[3] = &unk_100034D38;
    id v30 = v13;
    dispatch_async(v25, v29);

    __int16 v24 = v30;
LABEL_19:
  }
}

uint64_t __81__CAFDCarDataServiceAgent__removeRegistration_instanceIDs_priority_withResponse___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v5 = [a2 registrationsForPluginID:*(void *)(a1 + 32)];
  if (v5)
  {
    uint64_t v6 = *(void **)(a1 + 40);
    uint64_t v7 = [v5 allObjects];
    [v6 removeObjectsInArray:v7];

    if (![*(id *)(a1 + 40) count]) {
      *a3 = 1;
    }
  }

  return _objc_release_x1();
}

void __81__CAFDCarDataServiceAgent__removeRegistration_instanceIDs_priority_withResponse___block_invoke_251(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = objc_alloc((Class)CAFResponse);
  id v4 = +[NSError errorWithDomain:@"com.apple.caraccessoryframework.cardata" code:2 userInfo:0];
  id v3 = [v2 initWithError:v4];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v3);
}

void __81__CAFDCarDataServiceAgent__removeRegistration_instanceIDs_priority_withResponse___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [objc_alloc((Class)CAFResponse) initWithValuesAndError:0 error:0];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (id)_getClient:(id)a3
{
  if (a3)
  {
    id v4 = [a3 unsignedIntegerValue];
    p_channelLock = &self->_channelLock;
    os_unfair_lock_lock(&self->_channelLock);
    uint64_t v6 = [(CAFDCarDataServiceAgent *)self carDataClients];
    id v7 = [v6 count];

    if (v4 >= v7)
    {
      unsigned int v9 = 0;
    }
    else
    {
      uint64_t v8 = [(CAFDCarDataServiceAgent *)self carDataClients];
      unsigned int v9 = [v8 objectAtIndex:v4];
    }
    os_unfair_lock_unlock(p_channelLock);
  }
  else
  {
    unsigned int v9 = 0;
  }

  return v9;
}

- (id)_getChannel:(id)a3
{
  uint64_t v5 = &off_100035D88;
  if (a3) {
    uint64_t v5 = (_UNKNOWN **)a3;
  }
  p_channelLock = &self->_channelLock;
  id v7 = v5;
  id v8 = a3;
  os_unfair_lock_lock(p_channelLock);
  unsigned int v9 = [(CAFDCarDataServiceAgent *)self carDataChannels];
  id v10 = [v9 objectForKeyedSubscript:v7];

  os_unfair_lock_unlock(p_channelLock);

  return v10;
}

- (os_unfair_lock_s)channelLock
{
  return self->_channelLock;
}

- (void)setChannelLock:(os_unfair_lock_s)a3
{
  self->_channelLock = a3;
}

- (os_unfair_lock_s)carLock
{
  return self->_carLock;
}

- (void)setCarLock:(os_unfair_lock_s)a3
{
  self->_carLock = a3;
}

- (os_unfair_lock_s)assertionCounterLock
{
  return self->_assertionCounterLock;
}

- (void)setAssertionCounterLock:(os_unfair_lock_s)a3
{
  self->_assertionCounterLock = a3;
}

- (OS_os_transaction)osTransaction
{
  return self->_osTransaction;
}

- (void)setOsTransaction:(id)a3
{
}

- (NSMutableDictionary)carDataChannels
{
  return self->_carDataChannels;
}

- (void)setCarDataChannels:(id)a3
{
}

- (NSMutableArray)carDataClients
{
  return self->_carDataClients;
}

- (void)setCarDataClients:(id)a3
{
}

- (CARSessionStatus)sessionStatus
{
  return self->_sessionStatus;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
}

- (int)carDataAvailableToken
{
  return self->_carDataAvailableToken;
}

- (void)setCarDataAvailableToken:(int)a3
{
  self->_carDataAvailableToken = a3;
}

- (NSMutableSet)connections
{
  return self->_connections;
}

- (void)setConnections:(id)a3
{
}

- (CARObserverHashTable)remoteProxies
{
  return self->_remoteProxies;
}

- (void)setRemoteProxies:(id)a3
{
}

- (unint64_t)assertionCount
{
  return self->_assertionCount;
}

- (void)setAssertionCount:(unint64_t)a3
{
  self->_assertionCount = a3;
}

- (NSMutableDictionary)fastStartupRegistrations
{
  return self->_fastStartupRegistrations;
}

- (void)setFastStartupRegistrations:(id)a3
{
}

- (CAFASCTree)ascTree
{
  return self->_ascTree;
}

- (BOOL)allowPartialConfiguration
{
  return self->_allowPartialConfiguration;
}

- (void)setAllowPartialConfiguration:(BOOL)a3
{
  self->_allowPartialConfiguration = a3;
}

- (BOOL)pluginConfigsRequested
{
  return self->_pluginConfigsRequested;
}

- (void)setPluginConfigsRequested:(BOOL)a3
{
  self->_pluginConfigsRequested = a3;
}

- (CAFDStateCaptureManager)stateCaptureManager
{
  return self->_stateCaptureManager;
}

- (void)setStateCaptureManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateCaptureManager, 0);
  objc_storeStrong((id *)&self->_ascTree, 0);
  objc_storeStrong((id *)&self->_fastStartupRegistrations, 0);
  objc_storeStrong((id *)&self->_remoteProxies, 0);
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_sessionStatus, 0);
  objc_storeStrong((id *)&self->_carDataClients, 0);
  objc_storeStrong((id *)&self->_carDataChannels, 0);
  objc_storeStrong((id *)&self->_osTransaction, 0);

  objc_storeStrong((id *)&self->_currentCar, 0);
}

- (void)initWithSessionStatus:(uint64_t)a3 config:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_setupCarDataChannel:channelType:qualityOfService:streamPriority:priority:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_7((void *)&_mh_execute_header, v0, v1, "Session channel setup failed type: %{public}@", v2, v3, v4, v5, v6);
}

- (void)_setupCarDataChannel:channelType:qualityOfService:streamPriority:priority:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "Init car data channel END type: %{public}@", v2, v3, v4, v5, v6);
}

- (void)_setupCarDataChannel:channelType:qualityOfService:streamPriority:priority:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_7((void *)&_mh_execute_header, v0, v1, "Data channel setup failed type: %{public}@", v2, v3, v4, v5, v6);
}

- (void)_mainQueue_initVehicleDataSession:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5((void *)&_mh_execute_header, v0, v1, "No session configuration", v2, v3, v4, v5, v6);
}

- (void)_mainQueue_initVehicleDataSession:.cold.2()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5((void *)&_mh_execute_header, v0, v1, "No vehicle data plugin count provided", v2, v3, v4, v5, v6);
}

- (void)_mainQueue_initVehicleDataSession:(void *)a1 .cold.3(void *a1)
{
  uint64_t v1 = [a1 UUIDString];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_13((void *)&_mh_execute_header, v2, v3, "Car setup failed UUID: %{public}@", v4, v5, v6, v7, v8);
}

- (void)_mainQueue_initVehicleDataSession:(NSObject *)a3 .cold.4(void *a1, void *a2, NSObject *a3)
{
  uint64_t v5 = [a1 UUIDString];
  uint64_t v6 = [a2 configuration];
  uint64_t v7 = [v6 name];
  int v9 = 138543618;
  id v10 = v5;
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_9((void *)&_mh_execute_header, a3, v8, "Init car UUID: %{public}@ name: %{public}@", (uint8_t *)&v9);
}

- (void)_mainQueue_initVehicleDataSession:.cold.5()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5((void *)&_mh_execute_header, v0, v1, "Car data channel high setup failed", v2, v3, v4, v5, v6);
}

- (void)_mainQueue_initVehicleDataSession:.cold.6()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5((void *)&_mh_execute_header, v0, v1, "Car data channel low setup failed", v2, v3, v4, v5, v6);
}

- (void)_mainQueue_initVehicleDataSession:(NSObject *)a3 .cold.7(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v5 = [a1 configuration];
  uint8_t v6 = [v5 vehicleDataProtocolVersion];
  int v8 = 138543618;
  int v9 = v6;
  __int16 v10 = 2114;
  uint64_t v11 = a2;
  OUTLINED_FUNCTION_12((void *)&_mh_execute_header, a3, v7, "The accessory's protocol version: %{public}@ does not match with supported protocol version: %{public}@", (uint8_t *)&v8);
}

- (void)_mainQueue_initVehicleDataSession:.cold.8()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5((void *)&_mh_execute_header, v0, v1, "No available certificate serial for session.", v2, v3, v4, v5, v6);
}

- (void)_observeAssertion:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  [a1 assertionCount];
  OUTLINED_FUNCTION_1();
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "Assertion counter incremented to %lu (crossed 1800)", v3, 0xCu);
}

- (void)_observeAssertion:(void *)a1 .cold.2(void *a1)
{
  [a1 assertionCount];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_10((void *)&_mh_execute_header, v1, v2, "Assertion counter incremented to %lu", v3, v4, v5, v6, v7);
}

- (void)assertion:(void *)a1 didInvalidateWithError:.cold.1(void *a1)
{
  [a1 assertionCount];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_10((void *)&_mh_execute_header, v1, v2, "Assertion counter decremented to %lu", v3, v4, v5, v6, v7);
}

- (void)sessionDidConnect:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3((void *)&_mh_execute_header, v0, v1, "Session connect", v2, v3, v4, v5, v6);
}

- (void)sessionDidDisconnect:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3((void *)&_mh_execute_header, v0, v1, "Session disconnect", v2, v3, v4, v5, v6);
}

void __48__CAFDCarDataServiceAgent_sessionDidDisconnect___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3((void *)&_mh_execute_header, v0, v1, "No connected session, finalize tear down", v2, v3, v4, v5, v6);
}

void __48__CAFDCarDataServiceAgent_sessionDidDisconnect___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3((void *)&_mh_execute_header, v0, v1, "Session connected, no tear down needed", v2, v3, v4, v5, v6);
}

- (void)carDataChannelDidOpen:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3((void *)&_mh_execute_header, v0, v1, "Not all channels are open yet", v2, v3, v4, v5, v6);
}

- (void)carDataChannelDidOpen:.cold.2()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3((void *)&_mh_execute_header, v0, v1, "All channels are open", v2, v3, v4, v5, v6);
}

- (void)carDataChannelDidOpen:.cold.3()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3((void *)&_mh_execute_header, v0, v1, "Not all channels are initialized yet", v2, v3, v4, v5, v6);
}

- (void)carDataChannelDidOpen:.cold.4()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "carDataChannelDidOpen: %{public}@", v2, v3, v4, v5, v6);
}

void __49__CAFDCarDataServiceAgent_carDataChannelDidOpen___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "Channel not open: %{public}@", v2, v3, v4, v5, v6);
}

void __49__CAFDCarDataServiceAgent_carDataChannelDidOpen___block_invoke_240_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5((void *)&_mh_execute_header, v0, v1, "Car data channels opened, but current car does not exist or has no plugins", v2, v3, v4, v5, v6);
}

void __49__CAFDCarDataServiceAgent_carDataChannelDidOpen___block_invoke_241_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v5 = +[NSNumber numberWithUnsignedInteger:*(void *)(a1 + 32)];
  uint8_t v6 = [a2 error];
  int v8 = 138543618;
  int v9 = v5;
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_12((void *)&_mh_execute_header, a3, v7, "Request config for pluginID: %{public}@ failed with error: %{public}@", (uint8_t *)&v8);
}

- (void)carDataChannelDidClose:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, v0, v1, "carDataChannelDidClose (done): %{public}@ remaining=%lu");
}

- (void)carDataChannelDidClose:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "carDataChannelDidClose (start): %{public}@", v2, v3, v4, v5, v6);
}

- (void)carDataChannelDidReceive:pluginID:payload:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_7((void *)&_mh_execute_header, v0, v1, "Received data message without client for pluginID: %{public}@", v2, v3, v4, v5, v6);
}

- (void)didReceiveConfigFromPluginID:config:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "Did receive config from pluginID: %{public}@", v2, v3, v4, v5, v6);
}

- (void)_workQueue_didReceiveConfigFromPluginID:config:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_7((void *)&_mh_execute_header, v0, v1, "Received plugin configuration from pluginID: %{public}@, but current car does not exist", v2, v3, v4, v5, v6);
}

- (void)_workQueue_didReceiveConfigFromPluginID:config:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "Processed config from pluginID: %{public}@", v2, v3, v4, v5, v6);
}

- (void)_workQueue_didReceiveConfigFromPluginID:config:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "Processing config from pluginID: %{public}@", v2, v3, v4, v5, v6);
}

void __87__CAFDCarDataServiceAgent_didReceiveRequestFromPluginID_instanceID_value_withResponse___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_12((void *)&_mh_execute_header, v0, v1, "Did receive response from pluginID: %{public}@ instanceID: %{public}@ with value", v2);
}

void __87__CAFDCarDataServiceAgent_didReceiveRequestFromPluginID_instanceID_value_withResponse___block_invoke_3_cold_2()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_9((void *)&_mh_execute_header, v0, v1, "Did receive response from pluginID: %{public}@ instanceID: %{public}@ with last not handled error", v2);
}

void __87__CAFDCarDataServiceAgent_didReceiveRequestFromPluginID_instanceID_value_withResponse___block_invoke_3_cold_3()
{
  OUTLINED_FUNCTION_8();
  __int16 v4 = v0;
  uint64_t v5 = v1;
  _os_log_error_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "Did receive response from pluginID: %{public}@ instanceID: %{public}@ with error: %{public}@", v3, 0x20u);
}

- (void)didReceiveErrorFromPluginID:error:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_12((void *)&_mh_execute_header, v0, (uint64_t)v0, "Did receive error from pluginID: %{public}@ error: %{public}@", v1);
}

- (void)valuesForPluginID:(uint64_t)a1 iids:.cold.1(uint64_t a1)
{
  uint64_t v1 = +[NSNumber numberWithUnsignedInteger:a1];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_13((void *)&_mh_execute_header, v2, v3, "No available car data client for pluginID %{public}@", v4, v5, v6, v7, v8);
}

void __62__CAFDCarDataServiceAgent_listener_shouldAcceptNewConnection___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "Add connection %{public}@", v2, v3, v4, v5, v6);
}

void __45__CAFDCarDataServiceAgent__removeConnection___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_addRegistration:instanceIDs:priority:withResponse:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_7((void *)&_mh_execute_header, v0, v1, "Add registration pluginID: %{public}@ failed due to missing plugin", v2, v3, v4, v5, v6);
}

- (void)_removeRegistration:instanceIDs:priority:withResponse:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_12((void *)&_mh_execute_header, v0, (uint64_t)v0, "Remove registration pluginID: %{public}@ with priority: %{public}@ failed due to missing plugin", v1);
}

- (void)_removeRegistration:(NSObject *)a3 instanceIDs:priority:withResponse:.cold.2(uint64_t a1, void *a2, NSObject *a3)
{
  [a2 count];
  int v5 = 138543874;
  uint64_t v6 = a1;
  OUTLINED_FUNCTION_11();
  __int16 v7 = 2114;
  uint8_t v8 = &off_100035D40;
  _os_log_debug_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_DEBUG, "Force Remove registration pluginID: %{public}@ instanceIDs count %{public}lu with priority: %{public}@", (uint8_t *)&v5, 0x20u);
}

@end