@interface CDDCommControl
- (CDD)cdd;
- (CDDCommControl)initWithCommInstance:(id)a3;
- (CDDCommunicator)comm;
- (IDSService)_service;
- (NSDate)lastForecastSent;
- (NSMutableDictionary)sentRequestedTimestamps;
- (id)deviceDescriptionFromDevice:(id)a3;
- (id)deviceFromDeviceDescription:(id)a3;
- (id)identifierFromDeviceDescription:(id)a3;
- (id)requestDataFromDevice:(id)a3 message:(id)a4;
- (id)synchronize:(id)a3 interval:(id)a4 withForecasts:(BOOL)a5;
- (void)addDevice:(id)a3;
- (void)checkDevices:(id)a3;
- (void)checkForecastSync;
- (void)dealloc;
- (void)loadSavedDateIfExist;
- (void)receiveData:(id)a3 context:(id)a4 device:(id)a5;
- (void)removeDevice:(id)a3;
- (void)saveLastDate;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7;
- (void)service:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)service:(id)a3 activeAccountsChanged:(id)a4;
- (void)service:(id)a3 devicesChanged:(id)a4;
- (void)service:(id)a3 didSwitchActivePairedDevice:(id)a4 acknowledgementBlock:(id)a5;
- (void)service:(id)a3 nearbyDevicesChanged:(id)a4;
- (void)setLastForecastSent:(id)a3;
- (void)set_service:(id)a3;
- (void)setupIDSLink;
- (void)setupPairedSyncClient;
- (void)syncCoordinatorDidReceiveStartSyncCommand:(id)a3;
- (void)triggeredExchange:(id)a3 opportunistic:(BOOL)a4 queue:(id)a5 timeout:(id)a6 urgent:(BOOL)a7;
- (void)updateOutgoingVersionNumberAndSyncState:(unint64_t)a3 forIncomingSupportedVersions:(id)a4;
@end

@implementation CDDCommControl

- (CDDCommControl)initWithCommInstance:(id)a3
{
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)CDDCommControl;
  v5 = [(CDDCommControl *)&v29 init];
  v6 = v5;
  if (v5)
  {
    id v7 = objc_storeWeak((id *)&v5->comm, v4);
    v8 = [v4 cdd];
    objc_storeWeak((id *)&v6->cdd, v8);

    v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.coreduetdCommQueue", v9);
    commQueue = v6->commQueue;
    v6->commQueue = (OS_dispatch_queue *)v10;

    uint64_t v12 = +[NSMutableDictionary dictionary];
    identifierCache = v6->identifierCache;
    v6->identifierCache = (NSMutableDictionary *)v12;

    uint64_t v14 = +[NSMutableSet set];
    registeredDevices = v6->registeredDevices;
    v6->registeredDevices = (NSMutableSet *)v14;

    uint64_t v16 = +[NSMutableDictionary dictionary];
    sentRequestedTimestamps = v6->sentRequestedTimestamps;
    v6->sentRequestedTimestamps = (NSMutableDictionary *)v16;

    v18 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    exchangeRecords = v6->exchangeRecords;
    v6->exchangeRecords = v18;

    lastForecastSent = v6->lastForecastSent;
    v6->lastForecastSent = 0;

    if (notify_register_check("com.apple.coreduetd.systemConditionNotification", &v6->_conditionsChangedToken))
    {
      v21 = +[_CDLogging communicatorChannel];
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        sub_100022710(v21);
      }
    }
    [(CDDCommControl *)v6 loadSavedDateIfExist];
    int out_token = 0;
    v22 = v6->commQueue;
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_10000D594;
    v26[3] = &unk_100038C60;
    v23 = v6;
    v27 = v23;
    notify_register_dispatch("com.apple.coreduetd.communication.triggerSync", &out_token, v22, v26);
    v24 = v23;
  }
  return v6;
}

- (void)dealloc
{
  int nearbyDevicesNotifyToken = self->nearbyDevicesNotifyToken;
  if (nearbyDevicesNotifyToken) {
    notify_cancel(nearbyDevicesNotifyToken);
  }
  int conditionsChangedToken = self->_conditionsChangedToken;
  if (conditionsChangedToken) {
    notify_cancel(conditionsChangedToken);
  }
  v5.receiver = self;
  v5.super_class = (Class)CDDCommControl;
  [(CDDCommControl *)&v5 dealloc];
}

- (void)loadSavedDateIfExist
{
  id v3 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.CoreDuet"];
  [v3 synchronize];
  id v4 = +[_CDLogging instrumentationChannel];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_100022754(v4);
  }

  objc_super v5 = [v3 objectForKey:@"deviceExchangeTime"];
  v6 = [v3 objectForKey:@"deviceExchangeRecord"];
  id v7 = v6;
  if (v6)
  {
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10000DA84;
    v18[3] = &unk_100038C88;
    v18[4] = self;
    [v6 enumerateKeysAndObjectsUsingBlock:v18];
  }
  if (!v5)
  {
    uint64_t v14 = +[_CDLogging communicatorChannel];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v15 = "no known last exchange time";
      uint64_t v16 = v14;
      uint32_t v17 = 2;
      goto LABEL_11;
    }
LABEL_12:

    goto LABEL_13;
  }
  p_lastForecastSent = &self->lastForecastSent;
  objc_storeStrong((id *)&self->lastForecastSent, v5);
  v9 = [(CDDCommControl *)self cdd];
  dispatch_queue_t v10 = [v9 config];
  unsigned int v11 = [v10 verbose];

  if (v11)
  {
    [(NSDate *)*p_lastForecastSent timeIntervalSinceNow];
    double v13 = v12;
    uint64_t v14 = +[_CDLogging communicatorChannel];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      double v20 = v13 / -86400.0;
      v15 = "last device exchange time was %0.2f days ago";
      uint64_t v16 = v14;
      uint32_t v17 = 12;
LABEL_11:
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, v15, buf, v17);
      goto LABEL_12;
    }
    goto LABEL_12;
  }
LABEL_13:
}

- (void)saveLastDate
{
  if (self->lastForecastSent)
  {
    id v3 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.CoreDuet"];
    [v3 setObject:self->lastForecastSent forKey:@"deviceExchangeTime"];
    [v3 setObject:self->exchangeRecords forKey:@"deviceExchangeRecord"];
    [v3 synchronize];
    id v4 = +[_CDLogging instrumentationChannel];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)objc_super v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Last date did synchronize.", v5, 2u);
    }
  }
}

- (void)setupIDSLink
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->cdd);
  id v4 = [WeakRetained config];
  unsigned int v5 = [v4 commEnabled];

  v6 = +[_CDLogging communicatorChannel];
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v7)
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "CDDCommunicator: enabled.", (uint8_t *)&buf, 2u);
    }

    v8 = (IDSService *)[objc_alloc((Class)IDSService) initWithService:@"com.apple.private.alloy.coreduet"];
    service = self->_service;
    self->_service = v8;

    if (self->_service)
    {
      dispatch_queue_t v10 = +[_CDLogging communicatorChannel];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        unsigned int v11 = self->_service;
        LODWORD(buf) = 134217984;
        *(void *)((char *)&buf + 4) = v11;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "CDDCommunicator: setup with service %p.", (uint8_t *)&buf, 0xCu);
      }

      id v12 = objc_loadWeakRetained((id *)&self->comm);
      [v12 setInitialized:1];

      commQueue = self->commQueue;
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_10000DEF8;
      v18[3] = &unk_100038A78;
      v18[4] = self;
      uint64_t v14 = v18;
      v15 = commQueue;
      uint64_t v16 = (void *)os_transaction_create();
      *(void *)&long long buf = _NSConcreteStackBlock;
      *((void *)&buf + 1) = 3221225472;
      double v20 = sub_100011794;
      v21 = &unk_100038AA0;
      id v22 = v16;
      id v23 = v14;
      id v17 = v16;
      dispatch_async(v15, &buf);

      [(IDSService *)self->_service addDelegate:self queue:self->commQueue];
      notify_register_check("com.apple.coreduetd.nearbydeviceschanged", &self->nearbyDevicesNotifyToken);
    }
  }
  else
  {
    if (v7)
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "CDDCommunicator: not enabled.", (uint8_t *)&buf, 2u);
    }
  }
}

- (void)setupPairedSyncClient
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->cdd);
  id v4 = [WeakRetained config];
  unsigned int v5 = [v4 commEnabled];

  if (v5)
  {
    v6 = +[_CDLogging communicatorChannel];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      LOWORD(v10[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Setting up pairedSync client", (uint8_t *)v10, 2u);
    }

    uint64_t v11 = 0;
    id v12 = &v11;
    uint64_t v13 = 0x2050000000;
    BOOL v7 = (void *)qword_100040F00;
    uint64_t v14 = qword_100040F00;
    if (!qword_100040F00)
    {
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_1000117A4;
      v10[3] = &unk_100038C00;
      v10[4] = &v11;
      sub_1000117A4((uint64_t)v10);
      BOOL v7 = (void *)v12[3];
    }
    id v8 = v7;
    _Block_object_dispose(&v11, 8);
    v9 = [v8 syncCoordinatorWithServiceName:@"com.apple.pairedsync.coreduet"];
    [v9 setDelegate:self queue:self->commQueue];
  }
}

- (void)syncCoordinatorDidReceiveStartSyncCommand:(id)a3
{
  id v4 = a3;
  unsigned int v5 = +[_CDLogging communicatorChannel];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Received pairedSync sync start notification", v9, 2u);
  }

  p_comm = &self->comm;
  id WeakRetained = objc_loadWeakRetained((id *)p_comm);
  [WeakRetained syncStateWithActiveRemote];

  id v8 = objc_loadWeakRetained((id *)p_comm);
  [v8 requestRemoteDeviceSync];

  [v4 syncDidComplete];
}

- (void)checkForecastSync
{
  commQueue = self->commQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000E28C;
  v7[3] = &unk_100038A78;
  v7[4] = self;
  id v3 = v7;
  id v4 = commQueue;
  unsigned int v5 = (void *)os_transaction_create();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100011794;
  block[3] = &unk_100038AA0;
  id v9 = v5;
  id v10 = v3;
  id v6 = v5;
  dispatch_async(v4, block);
}

- (void)updateOutgoingVersionNumberAndSyncState:(unint64_t)a3 forIncomingSupportedVersions:(id)a4
{
  p_comm = &self->comm;
  id v5 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_comm);
  id v7 = [WeakRetained localMaxSupportedVersionNumber];

  id v8 = objc_loadWeakRetained((id *)p_comm);
  id v9 = [v8 remoteVersionNumber];

  id v10 = objc_loadWeakRetained((id *)p_comm);
  id v11 = [v10 getOutgoingVersionForIncomingVersions:v5];

  id v12 = +[_CDLogging communicatorChannel];
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v9 == v11)
  {
    if (v13)
    {
      LOWORD(v15) = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "CDDCommunicator: VersionMismatch: Current outgoing versionis supported by remote device, not resetting the version number", (uint8_t *)&v15, 2u);
    }
  }
  else
  {
    if (v13)
    {
      int v15 = 134218496;
      id v16 = v7;
      __int16 v17 = 2048;
      id v18 = v9;
      __int16 v19 = 2048;
      id v20 = v11;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "CDDCommunicator: VersionMismatch: localMaxSupportedVersionNumber = %llu,currentoutgoingVersionNumber = %llu updating outgoingVersionNumber to %llu", (uint8_t *)&v15, 0x20u);
    }

    id v14 = objc_loadWeakRetained((id *)p_comm);
    [v14 setRemoteVersionNumber:v11];

    id v12 = objc_loadWeakRetained((id *)p_comm);
    [v12 triggerSystemDataExchange:1 wakeRemote:0];
  }
}

- (void)receiveData:(id)a3 context:(id)a4 device:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v97 = v9;
  v98 = v8;
  v96 = v10;
  if (!v10)
  {
    __int16 v19 = +[_CDLogging communicatorChannel];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      id v20 = "CDDCommunicator: receivedData: missing device.";
LABEL_9:
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, v20, buf, 2u);
    }
LABEL_10:

    id v14 = 0;
    int v15 = 0;
    id v16 = 0;
    __int16 v17 = 0;
    v21 = 0;
    id v22 = 0;
    id v23 = 0;
    v24 = 0;
    v25 = 0;
    id v18 = 0;
    goto LABEL_23;
  }
  id v11 = v10;
  uint64_t v12 = [(CDDCommControl *)self deviceDescriptionFromDevice:v10];
  if (!v12)
  {
    __int16 v19 = +[_CDLogging communicatorChannel];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      id v20 = "CDDCommunicator: receivedData: missing device data.";
      goto LABEL_9;
    }
    goto LABEL_10;
  }
  BOOL v13 = (void *)v12;
  [(CDDCommControl *)self checkForecastSync];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v101[0] = _NSConcreteStackBlock;
    v101[1] = 3221225472;
    v101[2] = sub_10000F5A4;
    v101[3] = &unk_100038CB0;
    v101[4] = self;
    id v102 = v9;
    id v103 = v11;
    [v8 enumerateObjectsUsingBlock:v101];

    id v14 = 0;
    int v15 = 0;
    id v16 = 0;
    __int16 v17 = 0;
    id v18 = v13;
LABEL_22:
    v21 = 0;
    id v22 = 0;
    id v23 = 0;
    v24 = 0;
    v25 = 0;
    goto LABEL_23;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v18 = v13;
    v36 = +[_CDLogging communicatorChannel];
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "CDDCommunicator: receivedData: invalid message type.", buf, 2u);
    }

    id v14 = 0;
    int v15 = 0;
    id v16 = 0;
    __int16 v17 = 0;
    goto LABEL_22;
  }
  v93 = [v9 incomingResponseIdentifier];
  uint64_t v94 = [v9 outgoingResponseIdentifier];
  id v22 = [v8 objectForKey:&off_10003B1E0];
  uint64_t v95 = [v8 objectForKey:&off_10003B1F8];
  unint64_t v26 = [v22 unsignedIntValue];
  id WeakRetained = objc_loadWeakRetained((id *)&self->comm);
  id v28 = [WeakRetained remoteVersionNumber];

  if (v28 != (id)v26)
  {
    objc_super v29 = +[_CDLogging communicatorChannel];
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 134218240;
      id v111 = v28;
      __int16 v112 = 2048;
      unint64_t v113 = v26;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "CDDCommunicator: receivedData: VersionMismatch. OutgoingVersionNumber = %llu IncomingVersionNumber = %llu", buf, 0x16u);
    }

    [(CDDCommControl *)self updateOutgoingVersionNumberAndSyncState:v26 forIncomingSupportedVersions:v95];
  }
  id v30 = objc_loadWeakRetained((id *)&self->comm);
  id v31 = [v30 localMaxSupportedVersionNumber];

  v92 = v22;
  if ((unint64_t)v31 > v26)
  {
    id v32 = objc_loadWeakRetained((id *)&self->comm);
    unsigned int v33 = [v32 isConversionRequiredForMessage:v8 fromVersion:v26 toVersion:v31];

    if (v33)
    {
      id v34 = objc_loadWeakRetained((id *)&self->comm);
      uint64_t v35 = [v34 convertMessage:v8 fromVersion:v26 toVersion:v31];

      id v8 = (id)v35;
    }
LABEL_33:
    v38 = [v8 objectForKey:&off_10003B210];
    __int16 v17 = [v8 objectForKey:&off_10003B228];
    id v16 = [v8 objectForKey:&off_10003B240];
    v98 = v8;
    switch([v38 intValue])
    {
      case 0u:
      case 1u:
      case 7u:
        id v46 = objc_loadWeakRetained((id *)&self->comm);
        [v46 receiveSystemData:v17 device:v13];

        id v47 = objc_loadWeakRetained((id *)&self->cdd);
        v48 = [v47 watchUpdate];
        v90 = v17;
        [v48 receiveWatchfaceInfo:v17 device:v13];

        v49 = +[_CDLogging communicatorChannel];
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
        {
          id v50 = [v11 uniqueIDOverride];
          id v51 = [v50 UTF8String];
          *(_DWORD *)long long buf = 136315138;
          id v111 = v51;
          _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "CDDCommunicator: receivedData: received system data from %s.", buf, 0xCu);
        }
        id v18 = v13;
        v21 = v38;

        v24 = v93;
        v52 = [(NSMutableDictionary *)self->sentRequestedTimestamps objectForKey:v93];

        if (v52) {
          [(NSMutableDictionary *)self->sentRequestedTimestamps removeObjectForKey:v93];
        }
        ADClientAddValueForScalarKey();
        goto LABEL_39;
      case 3u:
        v58 = +[_CDLogging communicatorChannel];
        if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
        {
          id v59 = [v11 uniqueIDOverride];
          id v60 = [v59 UTF8String];
          *(_DWORD *)long long buf = 136315138;
          id v111 = v60;
          _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_INFO, "CDDCommunicator: receivedData: received forecast data from %s.", buf, 0xCu);
        }
        v61 = [(NSMutableDictionary *)self->sentRequestedTimestamps objectForKey:v93];

        id v62 = objc_loadWeakRetained((id *)&self->comm);
        if (v61)
        {
          v63 = v62;
          [v62 receiveRequestedForecast:v17 paramDict:v16 transactionId:[v93 hash] device:v13];

          [(NSMutableDictionary *)self->sentRequestedTimestamps removeObjectForKey:v93];
          id v14 = 0;
          int v15 = 0;
          v24 = v93;
          id v23 = (void *)v94;
          id v22 = v92;
          goto LABEL_53;
        }
        v78 = v62;
        [v62 receiveForecast:v17 paramDict:v16 device:v13];

        id v79 = objc_loadWeakRetained((id *)&self->comm);
        int v15 = [v79 getAckMessage];

        v106[0] = IDSSendMessageOptionPeerResponseIdentifierKey;
        v106[1] = IDSSendMessageOptionEnforceRemoteTimeoutsKey;
        v107[0] = v94;
        v107[1] = &__kCFBooleanFalse;
        v106[2] = IDSSendMessageOptionBypassDuetKey;
        v107[2] = &__kCFBooleanTrue;
        id v14 = +[NSDictionary dictionaryWithObjects:v107 forKeys:v106 count:3];
        id v22 = v92;
        goto LABEL_26;
      case 5u:
        unsigned int v64 = [v17 intValue];
        loga = +[_CDLogging communicatorChannel];
        BOOL v65 = os_log_type_enabled(loga, OS_LOG_TYPE_INFO);
        if (v64 == 2)
        {
          if (v65)
          {
            id v66 = [v11 uniqueIDOverride];
            id v67 = [v66 UTF8String];
            *(_DWORD *)long long buf = 136315138;
            id v111 = v67;
            _os_log_impl((void *)&_mh_execute_header, loga, OS_LOG_TYPE_INFO, "CDDCommunicator: receivedData: received forecast data request from %s.", buf, 0xCu);
          }
          v68 = [(CDDCommControl *)self cdd];
          unsigned int v89 = [v68 classCLocked];

          if (!v89)
          {
            id v80 = objc_loadWeakRetained((id *)&self->comm);
            int v15 = [v80 satisfyForecastDataRequest:v16];

            v104[0] = IDSSendMessageOptionPeerResponseIdentifierKey;
            v104[1] = IDSSendMessageOptionEnforceRemoteTimeoutsKey;
            v105[0] = v94;
            v105[1] = &__kCFBooleanFalse;
            v104[2] = IDSSendMessageOptionBypassDuetKey;
            v105[2] = &__kCFBooleanTrue;
            id v14 = +[NSDictionary dictionaryWithObjects:v105 forKeys:v104 count:3];
            goto LABEL_26;
          }
          v88 = v16;
          v69 = +[_CDLogging communicatorChannel];
          v85 = v13;
          v87 = v38;
          v91 = v17;
          if (!os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_69;
          }
          id v70 = [v11 uniqueIDOverride];
          id v71 = [v70 UTF8String];
          *(_DWORD *)long long buf = 136315138;
          id v111 = v71;
          v72 = "CDDCommunicator: forecast data unavailable before class C unlock form %s.";
          v73 = v69;
          os_log_type_t v74 = OS_LOG_TYPE_DEFAULT;
LABEL_68:
          _os_log_impl((void *)&_mh_execute_header, v73, v74, v72, buf, 0xCu);

LABEL_69:
          v24 = v93;
          id v23 = (void *)v94;
          goto LABEL_77;
        }
        v87 = v38;
        v88 = v16;
        v91 = v17;
        v85 = v13;
        if (v65)
        {
          id v70 = [v11 uniqueIDOverride];
          id v77 = [v70 UTF8String];
          *(_DWORD *)long long buf = 136315138;
          id v111 = v77;
          v72 = "CDDCommunicator: receivedData: Invalid data value request from %s.";
          v69 = loga;
          v73 = loga;
          os_log_type_t v74 = OS_LOG_TYPE_INFO;
          goto LABEL_68;
        }
        v24 = v93;
        id v23 = (void *)v94;
        v69 = loga;
LABEL_77:

        id v14 = 0;
        int v15 = 0;
LABEL_78:
        __int16 v17 = v91;
        v25 = (void *)v95;
        id v18 = v85;
        v21 = v87;
        break;
      case 6u:
        v56 = [(NSMutableDictionary *)self->sentRequestedTimestamps objectForKey:v93];

        v90 = v17;
        if (v56)
        {
          id v18 = v13;
          v21 = v38;
          [(NSMutableDictionary *)self->sentRequestedTimestamps removeObjectForKey:v93];
          v57 = +[_CDLogging communicatorChannel];
          v24 = v93;
          if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)long long buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_INFO, "CDDCommunicator: receivedData: received ack from request.", buf, 2u);
          }

LABEL_39:
          id v14 = 0;
          int v15 = 0;
          id v23 = (void *)v94;
        }
        else if (v17)
        {
          id v14 = 0;
          int v15 = 0;
          v24 = v93;
          id v23 = (void *)v94;
          id v18 = v13;
          v21 = v38;
        }
        else
        {
          id v18 = v13;
          v21 = v38;
          v81 = +[_CDLogging communicatorChannel];
          v24 = v93;
          id v23 = (void *)v94;
          if (os_log_type_enabled(v81, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)long long buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v81, OS_LOG_TYPE_INFO, "CDDCommunicator: receivedData: received ack without timestamp.", buf, 2u);
          }

          id v14 = 0;
          int v15 = 0;
        }
        v25 = (void *)v95;
        __int16 v17 = v90;
        goto LABEL_23;
      case 8u:
        v88 = v16;
        v91 = v17;
        v85 = v13;
        v87 = v38;
        v75 = +[_CDLogging communicatorChannel];
        if (os_log_type_enabled(v75, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v75, OS_LOG_TYPE_INFO, "CDDCommunicator: receivedData: received remote device sync request.", buf, 2u);
        }

        id v76 = objc_loadWeakRetained((id *)&self->comm);
        [v76 syncStateWithActiveRemote];

        [(CDDCommControl *)self setLastForecastSent:0];
        [(CDDCommControl *)self checkForecastSync];
        goto LABEL_63;
      default:
        v88 = v16;
        v91 = v17;
        v85 = v13;
        v87 = v38;
        v53 = +[_CDLogging communicatorChannel];
        if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
        {
          id v54 = [v11 uniqueIDOverride];
          id v55 = [v54 UTF8String];
          *(_DWORD *)long long buf = 136315138;
          id v111 = v55;
          _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "CDDCommunicator: receivedData: Invalid request type from %s.", buf, 0xCu);
        }
LABEL_63:
        id v14 = 0;
        int v15 = 0;
        v24 = v93;
        id v23 = (void *)v94;
        goto LABEL_78;
    }
LABEL_79:
    id v16 = v88;
    goto LABEL_23;
  }
  if ((unint64_t)v31 >= v26) {
    goto LABEL_33;
  }
  id v37 = objc_loadWeakRetained((id *)&self->comm);
  int v15 = [v37 getAckMessage];

  v108[0] = IDSSendMessageOptionPeerResponseIdentifierKey;
  v108[1] = IDSSendMessageOptionEnforceRemoteTimeoutsKey;
  v109[0] = v94;
  v109[1] = &__kCFBooleanFalse;
  v108[2] = IDSSendMessageOptionBypassDuetKey;
  v109[2] = &__kCFBooleanTrue;
  id v14 = +[NSDictionary dictionaryWithObjects:v109 forKeys:v108 count:3];
  id v16 = 0;
  __int16 v17 = 0;
  v38 = 0;
LABEL_26:
  v98 = v8;
  if (v15)
  {
    v86 = v38;
    v39 = (void *)IDSCopyIDForDevice();
    v88 = v16;
    if (v39)
    {
      service = self->_service;
      v41 = +[NSSet setWithObject:v39];
      id v99 = 0;
      id v100 = 0;
      unsigned __int8 logb = [(IDSService *)service sendData:v15 toDestinations:v41 priority:300 options:v14 identifier:&v100 error:&v99];
      id v42 = v100;
      v43 = v99;

      v24 = v93;
      id v23 = (void *)v94;
      if ((logb & 1) == 0)
      {
        log = +[_CDLogging communicatorChannel];
        if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
        {
          id v44 = [v43 description];
          id v45 = [v44 UTF8String];
          *(_DWORD *)long long buf = 136315138;
          id v111 = v45;
          _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "CDDCommunicator: receiveData: send error %s.", buf, 0xCu);

          v24 = v93;
          id v23 = (void *)v94;
        }
      }
      id v18 = v13;
      v21 = v86;
    }
    else
    {
      v43 = +[_CDLogging communicatorChannel];
      id v18 = v13;
      v21 = v86;
      if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_INFO, "CDDCommunicator: receiveRequestData: failed to get idsIdentifier, cannot proceed.", buf, 2u);
      }
      v24 = v93;
      id v23 = (void *)v94;
    }

    id v22 = v92;
    v25 = (void *)v95;
    goto LABEL_79;
  }
  v24 = v93;
  id v23 = (void *)v94;
LABEL_53:
  id v18 = v13;
  v21 = v38;
  v25 = (void *)v95;
LABEL_23:
}

- (id)synchronize:(id)a3 interval:(id)a4 withForecasts:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  p_cdd = &self->cdd;
  id WeakRetained = objc_loadWeakRetained((id *)&self->cdd);
  uint64_t v12 = [WeakRetained privacyMonitor];
  if (([v12 updateAllowed] & 1) == 0)
  {

    goto LABEL_7;
  }
  id v13 = objc_loadWeakRetained((id *)&self->cdd);
  unsigned int v14 = [v13 isClassCLocked];

  if (v14)
  {
LABEL_7:
    id v16 = +[_CDLogging communicatorChannel];
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
LABEL_10:
      id v25 = 0;
      goto LABEL_11;
    }
    *(_WORD *)long long buf = 0;
    unint64_t v26 = "CDDCommunicator: Either Background App refresh is disabled or device locked.";
LABEL_9:
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, v26, buf, 2u);
    goto LABEL_10;
  }
  id v15 = objc_loadWeakRetained((id *)&self->comm);
  id v16 = [v15 getScheduledMessage:v9 withForecasts:v5];

  if (!v16)
  {
    id v16 = +[_CDLogging communicatorChannel];
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_10;
    }
    *(_WORD *)long long buf = 0;
    unint64_t v26 = "CDDCommunicator: no blob, cannot continue.";
    goto LABEL_9;
  }
  service = self->_service;
  v35[0] = IDSSendMessageOptionExpectsPeerResponseKey;
  v35[1] = IDSSendMessageOptionEnforceRemoteTimeoutsKey;
  v36[0] = &__kCFBooleanTrue;
  v36[1] = &__kCFBooleanFalse;
  v35[2] = IDSSendMessageOptionTimeoutKey;
  id v18 = objc_loadWeakRetained((id *)p_cdd);
  __int16 v19 = [v18 config];
  id v20 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v19 commSyncBoundarySeconds]);
  v36[2] = v20;
  v36[3] = &__kCFBooleanTrue;
  v35[3] = IDSSendMessageOptionBypassDuetKey;
  v35[4] = IDSSendMessageOptionOpportunisticDuetKey;
  v36[4] = &__kCFBooleanTrue;
  v36[5] = @"DuetForecastExchange";
  v35[5] = IDSSendMessageOptionQueueOneIdentifierKey;
  v35[6] = IDSSendMessageOptionForceLocalDeliveryKey;
  v36[6] = &__kCFBooleanTrue;
  v21 = +[NSDictionary dictionaryWithObjects:v36 forKeys:v35 count:7];
  id v31 = 0;
  id v32 = 0;
  unsigned __int8 v22 = [(IDSService *)service sendData:v16 toDestinations:v8 priority:200 options:v21 identifier:&v32 error:&v31];
  id v23 = v32;
  id v24 = v31;

  if (v22)
  {
    id v25 = v23;
  }
  else
  {
    id v28 = +[_CDLogging communicatorChannel];
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      id v29 = [v24 description];
      id v30 = [v29 UTF8String];
      *(_DWORD *)long long buf = 136315138;
      id v34 = v30;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "CDDCommunicator: synchronize: send error %s.", buf, 0xCu);
    }
    id v25 = 0;
  }

LABEL_11:

  return v25;
}

- (void)triggeredExchange:(id)a3 opportunistic:(BOOL)a4 queue:(id)a5 timeout:(id)a6 urgent:(BOOL)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  commQueue = self->commQueue;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10000FAB8;
  v23[3] = &unk_100038CD8;
  v23[4] = self;
  id v24 = v12;
  BOOL v27 = a4;
  BOOL v28 = a7;
  id v25 = v14;
  id v26 = v13;
  id v16 = v23;
  __int16 v17 = commQueue;
  id v18 = v13;
  id v19 = v14;
  id v20 = v12;
  v21 = (void *)os_transaction_create();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100011794;
  block[3] = &unk_100038AA0;
  id v30 = v21;
  id v31 = v16;
  id v22 = v21;
  dispatch_async(v17, block);
}

- (id)requestDataFromDevice:(id)a3 message:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 objectForKey:&off_10003B1E0];
  if (v8)
  {
    id v9 = self;
    objc_sync_enter(v9);
    id v10 = [(NSMutableDictionary *)v9->identifierCache objectForKey:v8];
    objc_sync_exit(v9);

    if (v10)
    {
      service = v9->_service;
      id v12 = +[NSSet setWithObject:v10];
      uint64_t v28 = IDSSendMessageOptionExpectsPeerResponseKey;
      id v29 = &__kCFBooleanTrue;
      id v13 = +[NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
      id v26 = 0;
      id v27 = 0;
      unsigned __int8 v14 = [(IDSService *)service sendData:v7 toDestinations:v12 priority:300 options:v13 identifier:&v27 error:&v26];
      id v15 = v27;
      id v16 = v26;

      if (v15) {
        unsigned __int8 v17 = v14;
      }
      else {
        unsigned __int8 v17 = 0;
      }
      if (v17)
      {
        sentRequestedTimestamps = v9->sentRequestedTimestamps;
        id v19 = +[NSDate date];
        [(NSMutableDictionary *)sentRequestedTimestamps setObject:v19 forKey:v15];

        id v20 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v15 hash]);
      }
      else
      {
        id v22 = +[_CDLogging communicatorChannel];
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          id v23 = [v16 description];
          id v24 = [v23 UTF8String];
          *(_DWORD *)long long buf = 136315138;
          id v31 = v24;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "CDDCommunicator: requestDataFromDevice: send error %s.", buf, 0xCu);
        }
        id v20 = 0;
      }
    }
    else
    {
      id v16 = +[_CDLogging communicatorChannel];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "CDDCommunicator: requestDataFromDevice: missing idsIdentifier, cannot proceed.", buf, 2u);
      }
      id v20 = 0;
    }
  }
  else
  {
    id v10 = +[_CDLogging communicatorChannel];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id v21 = [v6 description];
      *(_DWORD *)long long buf = 136315138;
      id v31 = [v21 UTF8String];
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "CDDCommunicator: requestDataFromDevice: bad description %s.", buf, 0xCu);
    }
    id v20 = 0;
  }

  return v20;
}

- (id)deviceDescriptionFromDevice:(id)a3
{
  id v3 = a3;
  id v4 = [v3 uniqueIDOverride];
  uint64_t v5 = [v3 modelIdentifier];
  id v6 = (void *)v5;
  if (v5) {
    id v7 = (__CFString *)v5;
  }
  else {
    id v7 = @"UNKNOWN";
  }
  id v8 = v7;

  uint64_t v9 = [v3 name];
  id v10 = (void *)v9;
  if (v9) {
    id v11 = (__CFString *)v9;
  }
  else {
    id v11 = @"UNKNOWN";
  }
  id v12 = v11;

  id v13 = [v3 productName];

  if (v13) {
    unsigned __int8 v14 = v13;
  }
  else {
    unsigned __int8 v14 = @"UNKNOWN";
  }
  id v15 = v14;

  if (v4)
  {
    v20[0] = &off_10003B1E0;
    v20[1] = &off_10003B228;
    v21[0] = v4;
    v21[1] = v8;
    v20[2] = &off_10003B210;
    v20[3] = &off_10003B240;
    v21[2] = v12;
    v21[3] = v15;
    id v16 = +[NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:4];
  }
  else
  {
    unsigned __int8 v17 = +[_CDLogging communicatorChannel];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v19 = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "CDDCommunicator: deviceDescriptionFromDevice: missing unique identifier.", v19, 2u);
    }

    id v16 = 0;
  }

  return v16;
}

- (id)deviceFromDeviceDescription:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 objectForKey:&off_10003B1E0];
  id v6 = [v4 objectForKey:&off_10003B228];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v7 = [(IDSService *)self->_service devices];
  id v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    id v16 = v4;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v7);
        }
        id v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        id v12 = [v11 uniqueIDOverride];
        if ([v12 isEqualToString:v5])
        {
          id v13 = [v11 modelIdentifier];
          unsigned __int8 v14 = [v13 isEqualToString:v6];

          if (v14)
          {
            id v8 = v11;
            goto LABEL_12;
          }
        }
        else
        {
        }
      }
      id v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
LABEL_12:
    id v4 = v16;
  }

  return v8;
}

- (id)identifierFromDeviceDescription:(id)a3
{
  id v3 = [a3 objectForKeyedSubscript:&off_10003B1E0];
  id v4 = v3;
  if (v3) {
    uint64_t v5 = v3;
  }
  else {
    uint64_t v5 = &stru_100039CF8;
  }

  return v5;
}

- (void)addDevice:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[_CDLogging communicatorChannel];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "addDevice: %@", (uint8_t *)&buf, 0xCu);
  }

  commQueue = self->commQueue;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100010774;
  v12[3] = &unk_100038B38;
  v12[4] = self;
  id v13 = v4;
  id v7 = v12;
  id v8 = commQueue;
  id v9 = v4;
  id v10 = (void *)os_transaction_create();
  *(void *)&long long buf = _NSConcreteStackBlock;
  *((void *)&buf + 1) = 3221225472;
  id v15 = sub_100011794;
  id v16 = &unk_100038AA0;
  id v17 = v10;
  id v18 = v7;
  id v11 = v10;
  dispatch_async(v8, &buf);
}

- (void)removeDevice:(id)a3
{
  id v3 = a3;
  id v4 = +[_CDLogging communicatorChannel];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = [v3 description];
    int v6 = 136315138;
    id v7 = [v5 UTF8String];
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "removeDevice: %s.", (uint8_t *)&v6, 0xCu);
  }
}

- (void)checkDevices:(id)a3
{
  id v3 = a3;
  id v29 = (void *)os_transaction_create();
  id v30 = +[NSMutableArray array];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id obj = v3;
  id v4 = [obj countByEnumeratingWithState:&v38 objects:v45 count:16];
  if (v4)
  {
    uint64_t state64 = 0;
    id v5 = 0;
    int v6 = 0;
    uint64_t v7 = *(void *)v39;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v39 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        uint64_t v10 = IDSCopyIDForDevice();

        int v6 = (void *)v10;
        if (v10)
        {
          id v11 = [(CDDCommControl *)self deviceDescriptionFromDevice:v9];

          if (v11)
          {
            if ([v9 isDefaultPairedDevice])
            {
              [v30 addObject:v11];
              id v12 = self;
              objc_sync_enter(v12);
              identifierCache = self->identifierCache;
              unsigned __int8 v14 = [v11 objectForKey:&off_10003B1E0];
              [(NSMutableDictionary *)identifierCache setObject:v6 forKey:v14];

              objc_sync_exit(v12);
              id v15 = +[_CDLogging communicatorChannel];
              if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)long long buf = 138412290;
                id v44 = v11;
                _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Default Paired Device Changed: %@", buf, 0xCu);
              }
            }
            if ([v9 isConnected]) {
              state64 += [v9 isNearby];
            }
            id v5 = v11;
          }
          else
          {
            id v17 = +[_CDLogging communicatorChannel];
            if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)long long buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "CDDCommunicator: checkDevices: missing device description, pass.", buf, 2u);
            }

            id v5 = 0;
          }
        }
        else
        {
          id v16 = +[_CDLogging communicatorChannel];
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)long long buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "CDDCommunicator: checkDevices: missing idsIdentifier, pass.", buf, 2u);
          }
        }
      }
      id v4 = [obj countByEnumeratingWithState:&v38 objects:v45 count:16];
    }
    while (v4);
  }
  else
  {
    uint64_t state64 = 0;
    id v5 = 0;
    int v6 = 0;
  }

  notify_set_state(self->nearbyDevicesNotifyToken, state64);
  notify_post("com.apple.coreduetd.nearbydeviceschanged");
  id v18 = +[_CDLogging communicatorChannel];
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Device Set Changed! Signaling Conditions have changed", buf, 2u);
  }

  notify_post("com.apple.coreduetd.systemConditionNotification");
  id WeakRetained = objc_loadWeakRetained((id *)&self->comm);
  [WeakRetained checkDevices:v30];

  long long v20 = +[NSSet setWithArray:v30];
  if ([(NSMutableSet *)self->registeredDevices isEqualToSet:v20])
  {
    id v21 = +[_CDLogging communicatorChannel];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "CDDCommunicator: device set hasn't changed.", buf, 2u);
    }
  }
  else
  {
    id v22 = [(NSMutableSet *)self->registeredDevices mutableCopy];
    [v22 minusSet:v20];
    id v23 = [v20 mutableCopy];
    [v23 minusSet:self->registeredDevices];
    id v24 = (NSMutableSet *)[v20 mutableCopy];
    registeredDevices = self->registeredDevices;
    self->registeredDevices = v24;

    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v21 = v22;
    id v26 = [v21 countByEnumeratingWithState:&v34 objects:v42 count:16];
    if (v26)
    {
      uint64_t v27 = *(void *)v35;
      do
      {
        for (j = 0; j != v26; j = (char *)j + 1)
        {
          if (*(void *)v35 != v27) {
            objc_enumerationMutation(v21);
          }
          [(CDDCommControl *)self removeDevice:*(void *)(*((void *)&v34 + 1) + 8 * (void)j)];
        }
        id v26 = [v21 countByEnumeratingWithState:&v34 objects:v42 count:16];
      }
      while (v26);
    }

    [(CDDCommControl *)self addDevice:v23];
  }
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  BOOL v7 = a6;
  id v9 = a5;
  uint64_t v10 = +[_CDLogging communicatorChannel];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = [v9 UTF8String];
    id v12 = "NO";
    if (v7) {
      id v12 = "YES";
    }
    int v14 = 136315394;
    id v15 = v11;
    __int16 v16 = 2080;
    id v17 = v12;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "CDDCommunicator: Message Sent to %s with success %s.", (uint8_t *)&v14, 0x16u);
  }

  if (!v7)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->comm);
    [WeakRetained informCommunicationError];
  }
}

- (void)service:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v30 = a3;
  id v29 = a6;
  id v28 = a7;
  id v10 = a5;
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  uint64_t v15 = objc_opt_class();
  uint64_t v16 = objc_opt_class();
  uint64_t v17 = objc_opt_class();
  uint64_t v18 = objc_opt_class();
  uint64_t v19 = objc_opt_class();
  long long v20 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v11, v12, v13, v14, v15, v16, v17, v18, v19, objc_opt_class(), 0);
  id v32 = 0;
  id v21 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v20 fromData:v10 error:&v32];

  id v22 = v32;
  if (v22)
  {
    id v23 = +[_CDLogging communicatorChannel];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      sub_100022798((uint64_t)v22, v23);
    }
  }
  id v24 = [v30 deviceForFromID:v29];
  if (v21)
  {
    id v25 = v28;
    [(CDDCommControl *)self receiveData:v21 context:v28 device:v24];
  }
  else
  {
    id v26 = +[_CDLogging communicatorChannel];
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "CDDCommunicator: NIL object received from IDS.", buf, 2u);
    }

    id v25 = v28;
  }
}

- (void)service:(id)a3 devicesChanged:(id)a4
{
}

- (void)service:(id)a3 nearbyDevicesChanged:(id)a4
{
  id v6 = a4;
  BOOL v7 = v6;
  if (self->_service == a3)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = 0;
      uint64_t v11 = *(void *)v15;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v15 != v11) {
            objc_enumerationMutation(v7);
          }
          uint64_t v13 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          if ([v13 isNearby]) {
            v10 += [v13 isDefaultPairedDevice];
          }
        }
        id v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v9);
    }
    else
    {
      uint64_t v10 = 0;
    }
    notify_set_state(self->nearbyDevicesNotifyToken, v10);
    notify_post("com.apple.coreduetd.nearbydeviceschanged");
  }
}

- (void)service:(id)a3 didSwitchActivePairedDevice:(id)a4 acknowledgementBlock:(id)a5
{
  id v6 = (void (**)(void))a5;
  [(CDDCommControl *)self setLastForecastSent:0];
  v6[2]();
}

- (void)service:(id)a3 activeAccountsChanged:(id)a4
{
  id v4 = a4;
  id v5 = +[_CDLogging communicatorChannel];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = [v4 description];
    int v7 = 136315138;
    id v8 = [v6 UTF8String];
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "checkAccounts: accounts changed to %s.", (uint8_t *)&v7, 0xCu);
  }
}

- (CDD)cdd
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->cdd);

  return (CDD *)WeakRetained;
}

- (CDDCommunicator)comm
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->comm);

  return (CDDCommunicator *)WeakRetained;
}

- (IDSService)_service
{
  return (IDSService *)objc_getProperty(self, a2, 64, 1);
}

- (void)set_service:(id)a3
{
}

- (NSDate)lastForecastSent
{
  return self->lastForecastSent;
}

- (void)setLastForecastSent:(id)a3
{
}

- (NSMutableDictionary)sentRequestedTimestamps
{
  return self->sentRequestedTimestamps;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->sentRequestedTimestamps, 0);
  objc_storeStrong((id *)&self->lastForecastSent, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_destroyWeak((id *)&self->comm);
  objc_destroyWeak((id *)&self->cdd);
  objc_storeStrong((id *)&self->commQueue, 0);
  objc_storeStrong((id *)&self->exchangeRecords, 0);
  objc_storeStrong((id *)&self->registeredDevices, 0);

  objc_storeStrong((id *)&self->identifierCache, 0);
}

@end