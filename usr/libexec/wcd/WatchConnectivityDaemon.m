@interface WatchConnectivityDaemon
+ (id)sharedDaemon;
- (BOOL)cellUsageAllowedForBundleID:(id)a3;
- (BOOL)copyFile:(int)a3 to:(int)a4;
- (BOOL)errorIfPreconditionsNotSatisfiedWithClientPairingID:(id)a3 error:(id *)a4;
- (BOOL)fileTransferExistsForPairingID:(id)a3 identifier:(id)a4 applicationInfo:(id)a5;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)listenerShouldAcceptNewConnection:(id)a3;
- (BOOL)notifyIfFileTransferWithCommunicationID:(id)a3 pairingID:(id)a4 sendID:(id)a5 success:(BOOL)a6 error:(id)a7;
- (BOOL)notifyIfUserInfoTransferWithCommunicationID:(id)a3 pairingID:(id)a4 sendID:(id)a5 success:(BOOL)a6 error:(id)a7;
- (BOOL)privateListenerShouldAcceptNewConnection:(id)a3;
- (BOOL)sendComplicationUserInfo:(id)a3 clientID:(id)a4 clientPairingID:(id)a5 identifier:(id)a6 errorHandler:(id)a7;
- (BOOL)userInfoExistsForPairingID:(id)a3 identifier:(id)a4 applicationInfo:(id)a5;
- (CLManagerInterface)locationManager;
- (IDSDevice)activeIDSDevice;
- (IDSService)idsService;
- (IDSService)insecureIDSService;
- (NSString)idsInsecureServiceIdentifier;
- (NSString)idsServiceIdentifier;
- (NSString)state;
- (WatchConnectivityDaemon)init;
- (const)descriptionFromPayloadSendType:(unsigned __int16)a3;
- (id)WCErrorForIDSError:(id)a3;
- (id)applicationInfoForCommunicationID:(id)a3;
- (id)complicationUserInfoPathInDataContainer:(id)a3 pairingID:(id)a4;
- (id)createBackgroundAssertionTimerForIdentifier:(id)a3;
- (id)createCLInUseTimerForIdentifier:(id)a3;
- (id)createNewClientObjectWithCommunicationID:(id)a3 connection:(id)a4;
- (id)dataFromUUIDString:(id)a3;
- (id)moveFileToClientInbox:(id)a3 applicationInfo:(id)a4 pairingID:(id)a5 fileIdentifier:(id)a6 userInfoData:(id)a7 error:(id *)a8;
- (id)moveUserInfoToClientInbox:(id)a3 applicationInfo:(id)a4 pairingID:(id)a5 userInfoIdentifier:(id)a6;
- (id)pairingIDForIDSUniqueDeviceID:(id)a3;
- (void)acquireBackgroundAssertionForIdentifier:(id)a3;
- (void)addCounterpartClientCommunicationIdentifier:(id)a3;
- (void)cancelSendWithIdentifier:(id)a3;
- (void)cleanUpProcessAssertionForIdentifier:(id)a3;
- (void)clientReachabilityDidChange:(id)a3;
- (void)clientXPCConnectionDidDisconnect:(id)a3;
- (void)dequeueContentForClient:(id)a3;
- (void)dequeuePendingMessagesForCommunicationID:(id)a3;
- (void)duetIdentifiersForCompanionAppID:(id)a3 withCompletionHandler:(id)a4;
- (void)flushReadyBlocks;
- (void)handleAquiredAssertion:(id)a3 identifier:(id)a4;
- (void)handleCounterpartDaemonDidStart;
- (void)handleDaemonClientsInformation:(id)a3;
- (void)handleIncomingFileURL:(id)a3 communicationID:(id)a4 pairingID:(id)a5 sendID:(id)a6 metadata:(id)a7;
- (void)handleIncomingRequest:(id)a3 withCommunicationID:(id)a4 isInUse:(BOOL)a5 coreLocationData:(id)a6;
- (void)handleIncomingUserInfoTransferProto:(id)a3 communicationID:(id)a4 pairingID:(id)a5 sendID:(id)a6;
- (void)handleIncomingUserInfoURL:(id)a3 communicationID:(id)a4 pairingID:(id)a5 sendID:(id)a6;
- (void)handlePairedSyncComplicationsStartedAck:(id)a3 identifier:(id)a4;
- (void)launchCompanionAppID:(id)a3 isInUse:(BOOL)a4 coreLocationData:(id)a5;
- (void)loadPersistedClients;
- (void)performBlockWhenReady:(id)a3;
- (void)persistAppContext:(id)a3 applicationInfo:(id)a4 pairingID:(id)a5;
- (void)persistFileTransferResult:(id)a3 pairingID:(id)a4 applicationInfo:(id)a5 identifier:(id)a6;
- (void)persistUserInfoTransferResult:(id)a3 pairingID:(id)a4 applicationInfo:(id)a5 identifier:(id)a6;
- (void)releaseCLInUseAssertionForIdentifier:(id)a3;
- (void)sendDaemonClientsInformation;
- (void)sendDaemonDidStart;
- (void)sendFirstUnlockAck:(id)a3;
- (void)sendFirstUnlockRequest:(id)a3;
- (void)sendFirstUnlockState:(id)a3;
- (void)sendInstalledAppsChangedMessage;
- (void)sendMessage:(id)a3 withIdentifier:(id)a4 isResponse:(BOOL)a5 clientID:(id)a6 clientPairingID:(id)a7 errorHandler:(id)a8;
- (void)sendPairedSyncForComplicationsStartedAckWithIdentifier:(id)a3 success:(BOOL)a4;
- (void)sendPairedSyncForComplicationsStartedWithIdentifier:(id)a3;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7 context:(id)a8;
- (void)service:(id)a3 account:(id)a4 incomingResourceAtURL:(id)a5 metadata:(id)a6 fromID:(id)a7 context:(id)a8;
- (void)service:(id)a3 account:(id)a4 incomingUnhandledProtobuf:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)service:(id)a3 connectedDevicesChanged:(id)a4;
- (void)service:(id)a3 context:(id)a4 performBlockWhenReady:(id)a5;
- (void)service:(id)a3 devicesChanged:(id)a4;
- (void)service:(id)a3 didSwitchActivePairedDevice:(id)a4 acknowledgementBlock:(id)a5;
- (void)setCLTransientAuthorization:(id)a3 withCoreLocationData:(id)a4;
- (void)setLocationManager:(id)a3;
- (void)storeComplicationUserInfoTransfer:(id)a3 applicationInfo:(id)a4 pairingID:(id)a5;
- (void)systemObserverActiveDeviceSwitchStarted;
- (void)systemObserverAppDidTerminateForBundleID:(id)a3;
- (void)systemObserverInitialSetUpComplete;
- (void)systemObserverInstalledApplicationsChanged;
- (void)systemObserverUpdatingInstalledApps;
- (void)transferFile:(id)a3 withMetadata:(id)a4 identifier:(id)a5 forClient:(id)a6 destFilePath:(id)a7 errorHandler:(id)a8;
- (void)transferUserInfo:(id)a3 withMetadata:(id)a4 identifier:(id)a5 clientID:(id)a6 clientPairingID:(id)a7 errorHandler:(id)a8;
- (void)updateActiveDeviceConnectedForService:(id)a3;
- (void)updateAllClientsWithValues;
- (void)updateApplicationContext:(id)a3 clientID:(id)a4 clientPairingID:(id)a5 errorHandler:(id)a6;
- (void)updateClientWithValues:(id)a3;
@end

@implementation WatchConnectivityDaemon

+ (id)sharedDaemon
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000111AC;
  block[3] = &unk_100044E28;
  block[4] = a1;
  if (qword_1000516E0 != -1) {
    dispatch_once(&qword_1000516E0, block);
  }
  v2 = (void *)qword_1000516D8;

  return v2;
}

- (WatchConnectivityDaemon)init
{
  v42.receiver = self;
  v42.super_class = (Class)WatchConnectivityDaemon;
  v2 = [(WatchConnectivityDaemon *)&v42 init];
  if (v2)
  {
    [(WatchConnectivityDaemon *)v2 setLocationManager:objc_opt_class()];
    uint64_t v3 = objc_opt_new();
    companionAppAssertions = v2->_companionAppAssertions;
    v2->_companionAppAssertions = (NSMutableDictionary *)v3;

    uint64_t v5 = objc_opt_new();
    coreLocationAssertions = v2->_coreLocationAssertions;
    v2->_coreLocationAssertions = (NSMutableDictionary *)v5;

    uint64_t v7 = objc_opt_new();
    communicationIdentifierToClient = v2->_communicationIdentifierToClient;
    v2->_communicationIdentifierToClient = (NSMutableDictionary *)v7;

    uint64_t v9 = objc_opt_new();
    sendIdentifierToHandler = v2->_sendIdentifierToHandler;
    v2->_sendIdentifierToHandler = (NSMutableDictionary *)v9;

    uint64_t v11 = objc_opt_new();
    pendingMessageRequests = v2->_pendingMessageRequests;
    v2->_pendingMessageRequests = (NSMutableDictionary *)v11;

    v13 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    readyBlocks = v2->_readyBlocks;
    v2->_readyBlocks = v13;

    v15 = (NSXPCListener *)[objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.wcd"];
    xpcListener = v2->_xpcListener;
    v2->_xpcListener = v15;

    [(NSXPCListener *)v2->_xpcListener _setQueue:&_dispatch_main_q];
    [(NSXPCListener *)v2->_xpcListener setDelegate:v2];
    v17 = (NSXPCListener *)[objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.wcd.private"];
    xpcPrivateListener = v2->_xpcPrivateListener;
    v2->_xpcPrivateListener = v17;

    [(NSXPCListener *)v2->_xpcPrivateListener _setQueue:&_dispatch_main_q];
    [(NSXPCListener *)v2->_xpcPrivateListener setDelegate:v2];
    [(NSXPCListener *)v2->_xpcPrivateListener resume];
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472;
    v40[2] = sub_100011540;
    v40[3] = &unk_100044A68;
    v19 = v2;
    v41 = v19;
    [(WatchConnectivityDaemon *)v19 performBlockWhenReady:v40];
    idsServiceIdentifier = v19->_idsServiceIdentifier;
    v19->_idsServiceIdentifier = (NSString *)@"com.apple.private.alloy.watchconnectivity";

    v21 = (IDSService *)[objc_alloc((Class)IDSService) initWithService:v19->_idsServiceIdentifier manuallyAckMessages:1];
    idsService = v19->_idsService;
    v19->_idsService = v21;

    [(IDSService *)v19->_idsService addDelegate:v19 queue:&_dispatch_main_q];
    idsInsecureServiceIdentifier = v19->_idsInsecureServiceIdentifier;
    v19->_idsInsecureServiceIdentifier = (NSString *)@"com.apple.private.alloy.watchconnectivity.classd";

    v24 = (IDSService *)[objc_alloc((Class)IDSService) initWithService:v19->_idsInsecureServiceIdentifier manuallyAckMessages:1];
    insecureIDSService = v19->_insecureIDSService;
    v19->_insecureIDSService = v24;

    [v19->_insecureIDSService addDelegate:v19 queue:&_dispatch_main_q];
    uint64_t v26 = objc_opt_new();
    firstUnlockManager = v19->_firstUnlockManager;
    v19->_firstUnlockManager = (WCDFirstUnlockManager *)v26;

    uint64_t v28 = objc_opt_new();
    pairedSyncManager = v19->_pairedSyncManager;
    v19->_pairedSyncManager = (WCDPairedSyncManager *)v28;

    v30 = +[WCDSystemMonitor sharedSystemMonitor];
    [v30 addObserver:v19];

    notify_post((const char *)[WCServiceListenerResumedNotification UTF8String]);
    [(WatchConnectivityDaemon *)v19 sendDaemonDidStart];
    v35 = _NSConcreteStackBlock;
    uint64_t v36 = 3221225472;
    v37 = sub_10001154C;
    v38 = &unk_100044A68;
    v31 = v19;
    v39 = v31;
    [(WatchConnectivityDaemon *)v31 performBlockWhenReady:&v35];
    v32 = v19->_idsService;
    v33 = [(IDSService *)v32 devices];
    [(WatchConnectivityDaemon *)v31 service:v32 connectedDevicesChanged:v33];
  }
  return v2;
}

- (NSString)state
{
  v22 = [(WCDFirstUnlockManager *)self->_firstUnlockManager state];
  NSAppendPrintF();
  id v3 = 0;

  v4 = [(WCDPairedSyncManager *)self->_pairedSyncManager state];
  NSAppendPrintF();
  id v5 = v3;

  v6 = (objc_class *)objc_opt_class();
  v23 = NSStringFromClass(v6);
  NSAppendPrintF();
  id v7 = v5;

  NSAppendPrintF();
  id v8 = v7;

  uint64_t v9 = [(WatchConnectivityDaemon *)self idsService];
  NSAppendPrintF();
  id v10 = v8;

  NSAppendPrintF();
  id v11 = v10;

  NSAppendPrintF();
  id v12 = v11;

  NSAppendPrintF();
  id v13 = v12;

  NSAppendPrintF();
  id v14 = v13;

  NSAppendPrintF();
  id v15 = v14;

  v16 = WCCompactStringFromCollection();
  NSAppendPrintF();
  id v17 = v15;

  coreLocationAssertions = self->_coreLocationAssertions;
  NSAppendPrintF();
  id v18 = v17;

  v19 = [(NSMutableDictionary *)self->_communicationIdentifierToClient allValues];
  v25 = [v19 valueForKeyPath:@"@unionOfObjects.state"];
  NSAppendPrintF();
  id v20 = v18;

  return (NSString *)v20;
}

- (void)loadPersistedClients
{
  id v3 = +[NSFileManager defaultManager];
  v30 = +[WCDClient clientsStorageURL];
  v4 = [v30 path];
  id v40 = 0;
  v31 = v3;
  id v5 = [v3 contentsOfDirectoryAtPath:v4 error:&v40];
  id v6 = v40;

  if (v5)
  {
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    obj = v5;
    id v7 = [obj countByEnumeratingWithState:&v36 objects:v45 count:16];
    if (v7)
    {
      id v8 = v7;
      v34 = v6;
      v29 = v5;
      uint64_t v9 = *(void *)v37;
      id v10 = &selRef_validApplications;
      while (1)
      {
        id v11 = 0;
        id v32 = v8;
        do
        {
          if (*(void *)v37 != v9) {
            objc_enumerationMutation(obj);
          }
          id v12 = *(NSObject **)(*((void *)&v36 + 1) + 8 * (void)v11);
          id v13 = [v12 stringByDeletingPathExtension];
          id v14 = [v10 + 416 sharedSystemMonitor];
          unsigned int v15 = [v14 applicationStateForBundleID:v13];

          if (v15 > 1)
          {
            uint64_t v22 = [(NSMutableDictionary *)self->_communicationIdentifierToClient objectForKeyedSubscript:v13];
            if (v22)
            {
              v23 = v22;
              v24 = wc_log();
              if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543362;
                objc_super v42 = v13;
                _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "client already exists %{public}@", buf, 0xCu);
              }
            }
            else
            {
              uint64_t v25 = [(WatchConnectivityDaemon *)self createNewClientObjectWithCommunicationID:v13 connection:0];
              if (v25)
              {
                v23 = v25;
                [(NSMutableDictionary *)self->_communicationIdentifierToClient setObject:v25 forKeyedSubscript:v13];
                uint64_t v26 = wc_log();
                if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138543362;
                  objc_super v42 = v23;
                  _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "restoring %{public}@", buf, 0xCu);
                }

                [v23 terminateApplicationDueToSwitchIfEligible];
              }
              else
              {
                v23 = wc_log();
                if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138543362;
                  objc_super v42 = v13;
                  _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "failed to restore client for %{public}@", buf, 0xCu);
                }
              }
            }
          }
          else
          {
            uint64_t v16 = v9;
            id v17 = self;
            id v18 = v10;
            v19 = [v30 URLByAppendingPathComponent:v12 isDirectory:0];
            id v35 = v34;
            unsigned __int8 v20 = [v31 removeItemAtURL:v19 error:&v35];
            id v21 = v35;

            if (v20)
            {
              v34 = v21;
              id v10 = v18;
              self = v17;
              uint64_t v9 = v16;
              id v8 = v32;
              goto LABEL_24;
            }
            v23 = wc_log();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            {
              id v28 = v21;
              v27 = NSPrintF();
              *(_DWORD *)buf = 138543618;
              objc_super v42 = v12;
              __int16 v43 = 2114;
              v44 = v27;
              _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "failed to clean up %{public}@ with error %{public}@", buf, 0x16u);
            }
            v34 = v21;
            id v10 = v18;
            self = v17;
            uint64_t v9 = v16;
            id v8 = v32;
          }

LABEL_24:
          id v11 = (char *)v11 + 1;
        }
        while (v8 != v11);
        id v8 = [obj countByEnumeratingWithState:&v36 objects:v45 count:16];
        if (!v8)
        {
          id v5 = v29;
          id v6 = v34;
          break;
        }
      }
    }
  }
  else
  {
    obj = wc_log();
    if (os_log_type_enabled(obj, OS_LOG_TYPE_ERROR)) {
      sub_10002AF00();
    }
  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 isEqual:self->_xpcListener])
  {
    unsigned __int8 v8 = [(WatchConnectivityDaemon *)self listenerShouldAcceptNewConnection:v7];
  }
  else
  {
    if (![v6 isEqual:self->_xpcPrivateListener])
    {
      BOOL v9 = 0;
      goto LABEL_7;
    }
    unsigned __int8 v8 = [(WatchConnectivityDaemon *)self privateListenerShouldAcceptNewConnection:v7];
  }
  BOOL v9 = v8;
LABEL_7:

  return v9;
}

- (BOOL)listenerShouldAcceptNewConnection:(id)a3
{
  id v4 = a3;
  if ((objc_msgSend(v4, "wc_connectionIsiOSExtension") & 1) == 0)
  {
    id v7 = [v4 wc_connectionCommunicationID];
    BOOL v9 = wc_log();
    id v10 = v9;
    if (v7)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        id v11 = [v4 wc_connectionBundleID];
        int v18 = 138543618;
        v19 = v11;
        __int16 v20 = 2114;
        id v21 = v7;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Accepting new connection from client with bundle ID %{public}@ and communicationID %{public}@", (uint8_t *)&v18, 0x16u);
      }
      id v12 = [(NSMutableDictionary *)self->_communicationIdentifierToClient objectForKeyedSubscript:v7];
      if (v12)
      {
        id v10 = v12;
        [v12 setConnection:v4];
      }
      else
      {
        uint64_t v16 = [(WatchConnectivityDaemon *)self createNewClientObjectWithCommunicationID:v7 connection:v4];
        if (!v16)
        {
          unsigned int v15 = 0;
          goto LABEL_17;
        }
        id v10 = v16;
        [(NSMutableDictionary *)self->_communicationIdentifierToClient setObject:v16 forKeyedSubscript:v7];
      }
      unsigned int v15 = v10;
    }
    else
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_10002AFC0(v10, v13, v14);
      }
      unsigned int v15 = 0;
    }

LABEL_17:
    BOOL v8 = v15 != 0;
    goto LABEL_18;
  }
  id v5 = wc_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_10002AF8C();
  }

  id v6 = +[WCXPCManager clientInterface];
  [v4 setRemoteObjectInterface:v6];

  [v4 resume];
  id v7 = [v4 remoteObjectProxy];
  [v7 invalidateConnection];
  BOOL v8 = 0;
LABEL_18:

  return v8;
}

- (id)createNewClientObjectWithCommunicationID:(id)a3 connection:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  BOOL v8 = wc_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v9 = [v6 wc_connectionBundleID];
    int v12 = 138543618;
    uint64_t v13 = v9;
    __int16 v14 = 2114;
    id v15 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Creating new client %{public}@ with connection %{public}@", (uint8_t *)&v12, 0x16u);
  }
  id v10 = [[WCDClient alloc] initWithCommunicationID:v7 connection:v6];

  if (v10)
  {
    [(WCDClient *)v10 setDelegate:self];
    [(WatchConnectivityDaemon *)self updateClientWithValues:v10];
    [(WCDFirstUnlockManager *)self->_firstUnlockManager requestFirstUnlockStateIfNeccessary];
  }

  return v10;
}

- (BOOL)privateListenerShouldAcceptNewConnection:(id)a3
{
  id v4 = a3;
  if ((objc_msgSend(v4, "wc_connectionHasEntitlement:", WCPrivateServiceComplicationsManagerEntitlement) & 1) != 0
    || objc_msgSend(v4, "wc_connectionHasEntitlement:", WCPrivateServiceTestToolEntitlement))
  {
    id v5 = wc_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [v4 wc_connectionBundleID];
      int v13 = 138543362;
      __int16 v14 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Accepting new private connection from client with bundle ID %{public}@", (uint8_t *)&v13, 0xCu);
    }
    id v7 = (WCDPrivateClient *)objc_opt_new();
    [(WCDPrivateClient *)v7 setDelegate:self];
    privateClient = self->_privateClient;
    self->_privateClient = v7;
    BOOL v9 = v7;

    [(WCDPrivateClient *)v9 setConnection:v4];
    [(WatchConnectivityDaemon *)self updateAllClientsWithValues];
    [(WatchConnectivityDaemon *)self dequeuePendingComplicationPings];
    BOOL v10 = 1;
  }
  else
  {
    id v11 = wc_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10002B034(v4);
    }

    BOOL v10 = 0;
  }

  return v10;
}

- (void)dequeueContentForClient:(id)a3
{
  id v4 = a3;
  id v5 = wc_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136446210;
    BOOL v8 = "-[WatchConnectivityDaemon dequeueContentForClient:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v7, 0xCu);
  }

  id v6 = [v4 communicationID];

  [(WatchConnectivityDaemon *)self dequeuePendingMessagesForCommunicationID:v6];
}

- (void)clientXPCConnectionDidDisconnect:(id)a3
{
  id v4 = a3;
  id v5 = wc_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138543362;
    id v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@", (uint8_t *)&v10, 0xCu);
  }

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v4;
    int v7 = [v6 bundleID];
    [(WatchConnectivityDaemon *)self releaseCLInUseAssertionForIdentifier:v7];

    privateClient = +[WCDIndexManager sharedManager];
    BOOL v9 = [v6 applicationInfo];

    [privateClient clearCacheForApplication:v9];
LABEL_7:

    goto LABEL_8;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    privateClient = self->_privateClient;
    self->_privateClient = 0;
    goto LABEL_7;
  }
LABEL_8:
}

- (void)clientReachabilityDidChange:(id)a3
{
  id v3 = wc_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136446210;
    id v5 = "-[WatchConnectivityDaemon clientReachabilityDidChange:]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v4, 0xCu);
  }
}

- (void)systemObserverInitialSetUpComplete
{
  [(WatchConnectivityDaemon *)self flushReadyBlocks];

  [(WatchConnectivityDaemon *)self updateAllClientsWithValues];
}

- (void)systemObserverActiveDeviceSwitchStarted
{
  self->_counterpartClientCommunicationIdentifiers = 0;
  _objc_release_x1();
}

- (void)systemObserverInstalledApplicationsChanged
{
  id v3 = +[WCDSystemMonitor sharedSystemMonitor];
  int v4 = [v3 applicationWorkspace];
  id v5 = [v4 iOSApplicationsContainingWatchApp];
  id v6 = [v5 bs_map:&stru_100044F18];

  int v7 = [(WatchConnectivityDaemon *)self idsService];
  BOOL v8 = [v6 allObjects];
  [v7 updateSubServices:v8];

  BOOL v9 = wc_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138543362;
    id v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "updated IDS with list of services: %{public}@", (uint8_t *)&v10, 0xCu);
  }
}

- (void)systemObserverAppDidTerminateForBundleID:(id)a3
{
  id v4 = a3;
  if (v4) {
    [(NSMutableDictionary *)self->_communicationIdentifierToClient removeObjectForKey:v4];
  }
  id v5 = wc_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = WCCompactStringFromCollection();
    int v7 = 138543618;
    id v8 = v4;
    __int16 v9 = 2114;
    int v10 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "removing client: %{public}@ from list of clients %{public}@", (uint8_t *)&v7, 0x16u);
  }
}

- (void)systemObserverUpdatingInstalledApps
{
  id v3 = wc_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Updating other device that installed apps changed", v4, 2u);
  }

  [(WatchConnectivityDaemon *)self sendInstalledAppsChangedMessage];
}

- (void)sendDaemonDidStart
{
  id v3 = +[WCDSystemMonitor sharedSystemMonitor];
  unsigned int v4 = [v3 watchConnectivityServiceAvailable];

  if (v4)
  {
    id v5 = objc_opt_new();
    [v5 setObject:@"WCDPayloadSendTypeDaemonStarted" forKeyedSubscript:IDSSendMessageOptionQueueOneIdentifierKey];
    [v5 setObject:&__kCFBooleanTrue forKeyedSubscript:IDSSendMessageOptionNonWakingKey];
    id v6 = +[NSNumber numberWithDouble:IDSMaxMessageTimeout];
    [v5 setObject:v6 forKeyedSubscript:IDSSendMessageOptionTimeoutKey];

    int v7 = objc_opt_new();
    [v7 setVersion:1];
    id v8 = objc_alloc((Class)IDSProtobuf);
    __int16 v9 = [v7 data];
    id v10 = [v8 initWithProtobufData:v9 type:4 isResponse:0];

    id v11 = [(WatchConnectivityDaemon *)self idsService];
    int v12 = +[NSSet setWithObject:IDSDefaultPairedDevice];
    id v17 = 0;
    id v18 = 0;
    [v11 sendProtobuf:v10 toDestinations:v12 priority:300 options:v5 identifier:&v18 error:&v17];
    id v13 = v18;
    id v14 = v17;

    id v15 = wc_log();
    uint64_t v16 = v15;
    if (v14)
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_10002B0E4();
      }
    }
    else if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v20 = v13;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
    }
  }
}

- (void)handleCounterpartDaemonDidStart
{
  v2 = wc_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    sub_10002B170();
  }
}

- (void)sendDaemonClientsInformation
{
  v2 = wc_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    sub_10002B1A4();
  }
}

- (void)handleDaemonClientsInformation:(id)a3
{
  id v4 = a3;
  id v5 = [v4 informationData];

  if (v5)
  {
    id v6 = [v4 informationData];
    id v12 = 0;
    int v7 = +[NSPropertyListSerialization propertyListWithData:v6 options:0 format:0 error:&v12];
    id v5 = v12;

    if (v7)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v8 = +[NSSet setWithArray:v7];
        counterpartClientCommunicationIdentifiers = self->_counterpartClientCommunicationIdentifiers;
        self->_counterpartClientCommunicationIdentifiers = v8;

        id v10 = wc_log();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          id v14 = v7;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
        }

        goto LABEL_11;
      }
    }
  }
  id v11 = wc_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    sub_10002B1D8();
  }

  WCDashboardLogJSON();
LABEL_11:
  [(WatchConnectivityDaemon *)self updateAllClientsWithValues];
}

- (void)sendInstalledAppsChangedMessage
{
  id v3 = +[WCDSystemMonitor sharedSystemMonitor];
  unsigned int v4 = [v3 watchConnectivityServiceAvailable];

  if (v4)
  {
    id v5 = wc_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446210;
      id v21 = "-[WatchConnectivityDaemon sendInstalledAppsChangedMessage]";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }

    id v6 = objc_opt_new();
    [v6 setObject:@"WCDPayloadSendTypeInstalledAppsUpdated" forKeyedSubscript:IDSSendMessageOptionQueueOneIdentifierKey];
    int v7 = +[NSNumber numberWithDouble:IDSMaxMessageTimeout];
    [v6 setObject:v7 forKeyedSubscript:IDSSendMessageOptionTimeoutKey];

    id v8 = objc_opt_new();
    [v8 setVersion:1];
    id v9 = objc_alloc((Class)IDSProtobuf);
    id v10 = [v8 data];
    id v11 = [v9 initWithProtobufData:v10 type:17 isResponse:0];

    id v12 = [(WatchConnectivityDaemon *)self idsService];
    id v13 = +[NSSet setWithObject:IDSDefaultPairedDevice];
    id v18 = 0;
    id v19 = 0;
    [v12 sendProtobuf:v11 toDestinations:v13 priority:300 options:v6 identifier:&v19 error:&v18];
    id v14 = (char *)v19;
    id v15 = v18;

    uint64_t v16 = wc_log();
    id v17 = v16;
    if (v15)
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_10002B0E4();
      }
    }
    else if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v21 = v14;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
    }
  }
}

- (void)addCounterpartClientCommunicationIdentifier:(id)a3
{
  id v4 = a3;
  if (![(NSSet *)self->_counterpartClientCommunicationIdentifiers containsObject:v4])
  {
    id v5 = wc_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138543362;
      id v9 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@", (uint8_t *)&v8, 0xCu);
    }

    id v6 = [(NSSet *)self->_counterpartClientCommunicationIdentifiers setByAddingObject:v4];
    counterpartClientCommunicationIdentifiers = self->_counterpartClientCommunicationIdentifiers;
    self->_counterpartClientCommunicationIdentifiers = v6;

    [(WatchConnectivityDaemon *)self updateAllClientsWithValues];
  }
}

- (void)sendFirstUnlockState:(id)a3
{
  id v4 = a3;
  id v5 = +[WCDSystemMonitor sharedSystemMonitor];
  unsigned int v6 = [v5 watchConnectivityServiceAvailable];

  if (v6)
  {
    int v7 = objc_opt_new();
    [v7 setObject:@"WCDProtoCompanionFirstUnlockState" forKeyedSubscript:IDSSendMessageOptionQueueOneIdentifierKey];
    int v8 = +[NSNumber numberWithDouble:IDSMaxMessageTimeout];
    [v7 setObject:v8 forKeyedSubscript:IDSSendMessageOptionTimeoutKey];

    id v9 = objc_alloc((Class)IDSProtobuf);
    id v10 = [v4 data];
    id v11 = [v9 initWithProtobufData:v10 type:10 isResponse:0];

    id v12 = [(WatchConnectivityDaemon *)self insecureIDSService];
    id v13 = +[NSSet setWithObject:IDSDefaultPairedDevice];
    id v19 = 0;
    id v20 = 0;
    unsigned __int8 v14 = [v12 sendProtobuf:v11 toDestinations:v13 priority:300 options:v7 identifier:&v20 error:&v19];
    id v15 = v20;
    id v16 = v19;

    id v17 = wc_log();
    id v18 = v17;
    if (v14)
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v22 = v15;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
      }
    }
    else if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      sub_10002B264();
    }
  }
}

- (void)sendFirstUnlockRequest:(id)a3
{
  id v4 = a3;
  id v5 = +[WCDSystemMonitor sharedSystemMonitor];
  unsigned int v6 = [v5 watchConnectivityServiceAvailable];

  if (v6)
  {
    int v7 = objc_opt_new();
    [v7 setObject:@"WCDProtoCompanionFirstUnlockRequest" forKeyedSubscript:IDSSendMessageOptionQueueOneIdentifierKey];
    int v8 = +[NSNumber numberWithDouble:IDSMaxMessageTimeout];
    [v7 setObject:v8 forKeyedSubscript:IDSSendMessageOptionTimeoutKey];

    id v9 = objc_alloc((Class)IDSProtobuf);
    id v10 = [v4 data];
    id v11 = [v9 initWithProtobufData:v10 type:11 isResponse:0];

    id v12 = [(WatchConnectivityDaemon *)self insecureIDSService];
    id v13 = +[NSSet setWithObject:IDSDefaultPairedDevice];
    id v19 = 0;
    id v20 = 0;
    unsigned __int8 v14 = [v12 sendProtobuf:v11 toDestinations:v13 priority:200 options:v7 identifier:&v20 error:&v19];
    id v15 = v20;
    id v16 = v19;

    id v17 = wc_log();
    id v18 = v17;
    if (v14)
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v22 = v15;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
      }
    }
    else if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      sub_10002B264();
    }
  }
}

- (void)sendFirstUnlockAck:(id)a3
{
  id v4 = a3;
  id v5 = +[WCDSystemMonitor sharedSystemMonitor];
  unsigned int v6 = [v5 watchConnectivityServiceAvailable];

  if (v6)
  {
    int v7 = objc_opt_new();
    [v7 setObject:@"WCDProtoCompanionFirstUnlockAck" forKeyedSubscript:IDSSendMessageOptionQueueOneIdentifierKey];
    int v8 = +[NSNumber numberWithDouble:IDSMaxMessageTimeout];
    [v7 setObject:v8 forKeyedSubscript:IDSSendMessageOptionTimeoutKey];

    id v9 = objc_alloc((Class)IDSProtobuf);
    id v10 = [v4 data];
    id v11 = [v9 initWithProtobufData:v10 type:12 isResponse:0];

    id v12 = [(WatchConnectivityDaemon *)self insecureIDSService];
    id v13 = +[NSSet setWithObject:IDSDefaultPairedDevice];
    id v19 = 0;
    id v20 = 0;
    unsigned __int8 v14 = [v12 sendProtobuf:v11 toDestinations:v13 priority:200 options:v7 identifier:&v20 error:&v19];
    id v15 = v20;
    id v16 = v19;

    id v17 = wc_log();
    id v18 = v17;
    if (v14)
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v22 = v15;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
      }
    }
    else if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      sub_10002B264();
    }
  }
}

- (void)sendPairedSyncForComplicationsStartedWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = +[WCDSystemMonitor sharedSystemMonitor];
  unsigned __int8 v6 = [v5 watchConnectivityServiceAvailable];

  if (v6)
  {
    int v7 = objc_opt_new();
    [v7 setObject:@"WCDProtoPairedSyncComplicationsStarted" forKeyedSubscript:IDSSendMessageOptionQueueOneIdentifierKey];
    int v8 = [(WatchConnectivityDaemon *)self dataFromUUIDString:v4];

    [v7 setObject:v8 forKeyedSubscript:IDSSendMessageOptionUUIDKey];
    id v9 = objc_opt_new();
    [v9 setVersion:1];
    id v10 = objc_alloc((Class)IDSProtobuf);
    id v11 = [v9 data];
    id v12 = [v10 initWithProtobufData:v11 type:15 isResponse:0];

    id v13 = [(WatchConnectivityDaemon *)self insecureIDSService];
    unsigned __int8 v14 = +[NSSet setWithObject:IDSDefaultPairedDevice];
    id v22 = 0;
    id v23 = 0;
    unsigned __int8 v15 = [v13 sendProtobuf:v12 toDestinations:v14 priority:200 options:v7 identifier:&v23 error:&v22];
    id v16 = v23;
    id v17 = v22;

    id v18 = wc_log();
    id v19 = v18;
    if (v15)
    {
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v25 = v16;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
      }
    }
    else if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      sub_10002B264();
    }
  }
  else
  {
    pairedSyncManager = self->_pairedSyncManager;
    id v21 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:19 userInfo:0];
    -[WCDPairedSyncManager handlePotentialPairedSyncForComplicationsFailedWithIdentifier:error:](pairedSyncManager, "handlePotentialPairedSyncForComplicationsFailedWithIdentifier:error:", v4);
  }
}

- (void)sendPairedSyncForComplicationsStartedAckWithIdentifier:(id)a3 success:(BOOL)a4
{
  id v4 = +[WCDSystemMonitor sharedSystemMonitor];
  unsigned int v5 = [v4 watchConnectivityServiceAvailable];

  if (v5)
  {
    unsigned __int8 v6 = wc_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10002B1A4();
    }
  }
}

- (void)handlePairedSyncComplicationsStartedAck:(id)a3 identifier:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if ([v8 hasSuccess]) {
    uint64_t v7 = (uint64_t)[v8 success];
  }
  else {
    uint64_t v7 = 1;
  }
  [(WCDPairedSyncManager *)self->_pairedSyncManager handlePairedSyncForComplicationsAckWithIdentifier:v6 success:v7];
}

- (void)sendMessage:(id)a3 withIdentifier:(id)a4 isResponse:(BOOL)a5 clientID:(id)a6 clientPairingID:(id)a7 errorHandler:(id)a8
{
  BOOL v11 = a5;
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = a7;
  id v18 = (void (**)(id, id))a8;
  id v30 = 0;
  unsigned int v19 = [(WatchConnectivityDaemon *)self errorIfPreconditionsNotSatisfiedWithClientPairingID:v17 error:&v30];
  id v20 = v30;
  if (v19)
  {
    v18[2](v18, v20);
  }
  else
  {
    id v21 = wc_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      id v22 = "NO";
      *(_DWORD *)buf = 138544130;
      __int16 v33 = 2080;
      id v32 = v15;
      if (v11) {
        id v22 = "YES";
      }
      v34 = v22;
      __int16 v35 = 2114;
      id v36 = v16;
      __int16 v37 = 2114;
      id v38 = v17;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "identifier: %{public}@, isResponse: %s, clientID: %{public}@, clientPairingID: %{public}@", buf, 0x2Au);
    }

    [(WCDFirstUnlockManager *)self->_firstUnlockManager requestFirstUnlockStateIfNeccessary];
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_100013C7C;
    v23[3] = &unk_100044F40;
    id v24 = v16;
    BOOL v29 = v11;
    id v25 = v15;
    uint64_t v26 = self;
    id v27 = v14;
    id v28 = v18;
    [(WatchConnectivityDaemon *)self duetIdentifiersForCompanionAppID:v24 withCompletionHandler:v23];
  }
}

- (void)handleIncomingRequest:(id)a3 withCommunicationID:(id)a4 isInUse:(BOOL)a5 coreLocationData:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = [(NSMutableDictionary *)self->_communicationIdentifierToClient objectForKeyedSubscript:v11];
  id v14 = wc_log();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v22 = 138543874;
    id v23 = v10;
    __int16 v24 = 2114;
    id v25 = v11;
    __int16 v26 = 2114;
    id v27 = v13;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "request: %{public}@, communicationID: %{public}@, client: %{public}@", (uint8_t *)&v22, 0x20u);
  }

  if (v13)
  {
    id v15 = [v13 clientCurrentPairingID];
    id v16 = +[WCDSystemMonitor sharedSystemMonitor];
    id v17 = [v16 pairingID];
    if ([v15 isEqual:v17])
    {
      id v18 = [v13 connection];

      if (v18)
      {
        [(WatchConnectivityDaemon *)self launchCompanionAppID:v11 isInUse:v7 coreLocationData:v12];
        [v13 handleRequest:v10];
        goto LABEL_12;
      }
    }
    else
    {
    }
  }
  if (v11)
  {
    unsigned int v19 = [(NSMutableDictionary *)self->_pendingMessageRequests objectForKeyedSubscript:v11];

    if (!v19)
    {
      id v20 = objc_opt_new();
      [(NSMutableDictionary *)self->_pendingMessageRequests setObject:v20 forKeyedSubscript:v11];
    }
    id v21 = [(NSMutableDictionary *)self->_pendingMessageRequests objectForKeyedSubscript:v11];
    [v21 addObject:v10];

    [(WatchConnectivityDaemon *)self launchCompanionAppID:v11 isInUse:v7 coreLocationData:v12];
  }
LABEL_12:
}

- (void)dequeuePendingMessagesForCommunicationID:(id)a3
{
  id v4 = a3;
  unsigned int v5 = wc_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    __int16 v26 = "-[WatchConnectivityDaemon dequeuePendingMessagesForCommunicationID:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }

  id v6 = [(NSMutableDictionary *)self->_communicationIdentifierToClient objectForKeyedSubscript:v4];
  BOOL v7 = +[WCDSystemMonitor sharedSystemMonitor];
  id v8 = [v7 pairingID];

  if (v6 && v8)
  {
    id v9 = objc_opt_new();
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v18 = self;
    id v19 = v4;
    id v10 = [(NSMutableDictionary *)self->_pendingMessageRequests objectForKeyedSubscript:v4];
    id v11 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v21;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v21 != v13) {
            objc_enumerationMutation(v10);
          }
          id v15 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          id v16 = [v15 pairingID];
          unsigned int v17 = [v16 isEqual:v8];

          if (v17) {
            [v6 handleRequest:v15];
          }
          else {
            [v9 addObject:v15];
          }
        }
        id v12 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v12);
    }

    id v4 = v19;
    [(NSMutableDictionary *)v18->_pendingMessageRequests setObject:v9 forKeyedSubscript:v19];
  }
}

- (void)updateApplicationContext:(id)a3 clientID:(id)a4 clientPairingID:(id)a5 errorHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = (void (**)(id, id))a6;
  id v33 = 0;
  LODWORD(a6) = [(WatchConnectivityDaemon *)self errorIfPreconditionsNotSatisfiedWithClientPairingID:v12 error:&v33];
  id v14 = v33;
  if (a6)
  {
    v13[2](v13, v14);
    id v15 = v14;
  }
  else
  {
    id v16 = wc_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v35 = v11;
      __int16 v36 = 2114;
      id v37 = v12;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "clientID: %{public}@, clientPairingID: %{public}@", buf, 0x16u);
    }

    unsigned int v17 = objc_opt_new();
    [v17 setObject:v11 forKeyedSubscript:IDSSendMessageOptionQueueOneIdentifierKey];
    id v28 = v11;
    [v17 setObject:v11 forKeyedSubscript:IDSSendMessageOptionSubServiceKey];
    id v18 = +[NSNumber numberWithDouble:IDSMaxMessageTimeout];
    [v17 setObject:v18 forKeyedSubscript:IDSSendMessageOptionTimeoutKey];

    [v17 setObject:&__kCFBooleanTrue forKeyedSubscript:IDSSendMessageOptionNonWakingKey];
    [v17 setObject:&__kCFBooleanTrue forKeyedSubscript:IDSSendMessageOptionBypassDuetKey];
    id v19 = objc_alloc((Class)IDSProtobuf);
    id v30 = v10;
    long long v20 = [v10 data];
    id v21 = [v19 initWithProtobufData:v20 type:3 isResponse:0];

    long long v22 = [(WatchConnectivityDaemon *)self idsService];
    long long v23 = +[NSSet setWithObject:IDSDefaultPairedDevice];
    id v31 = v14;
    id v32 = 0;
    BOOL v29 = v21;
    LODWORD(v21) = [v22 sendProtobuf:v21 toDestinations:v23 priority:200 options:v17 identifier:&v32 error:&v31];
    id v24 = v32;
    id v15 = v31;

    id v25 = wc_log();
    __int16 v26 = v25;
    if (v21)
    {
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v35 = v24;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "sent identifier: %{public}@", buf, 0xCu);
      }

      v13[2](v13, 0);
    }
    else
    {
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        sub_10002B0E4();
      }

      id v27 = [(WatchConnectivityDaemon *)self WCErrorForIDSError:v15];
      v13[2](v13, v27);
    }
    id v10 = v30;

    id v11 = v28;
  }
}

- (void)transferFile:(id)a3 withMetadata:(id)a4 identifier:(id)a5 forClient:(id)a6 destFilePath:(id)a7 errorHandler:(id)a8
{
  id v14 = a3;
  id v34 = a4;
  id v35 = a5;
  id v15 = a6;
  id v16 = a7;
  unsigned int v17 = (void (**)(id, void *))a8;
  id v18 = [v15 communicationID];
  id v19 = [v15 clientCurrentPairingID];
  uint64_t v47 = 0;
  v48 = &v47;
  uint64_t v49 = 0x3032000000;
  v50 = sub_100014D18;
  v51 = sub_100014D28;
  id v52 = 0;
  id obj = 0;
  LODWORD(a8) = [(WatchConnectivityDaemon *)self errorIfPreconditionsNotSatisfiedWithClientPairingID:v19 error:&obj];
  objc_storeStrong(&v52, obj);
  if (!a8)
  {
    int v20 = [v14 fileDescriptor];
    id v21 = v16;
    fclonefileat(v20, -2, (const char *)[v21 fileSystemRepresentation], 0);
    long long v22 = wc_log();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v58 = v21;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "cloning or copying file to: %@", buf, 0xCu);
    }

    if ([v21 checkResourceIsReachableAndReturnError:0]) {
      goto LABEL_10;
    }
    long long v23 = wc_log();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Failed to clone file, trying copying", buf, 2u);
    }

    uint64_t v24 = open((const char *)[v21 fileSystemRepresentation], 1537, 384);
    if (v24 == -1)
    {
      id v27 = wc_log();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        id v28 = __error();
        sub_10002B324(v28, buf, v27);
      }

      id v26 = [objc_alloc((Class)NSError) initWithDomain:NSPOSIXErrorDomain code:*__error() userInfo:0];
      NSErrorUserInfoKey v55 = NSUnderlyingErrorKey;
      id v56 = v26;
      BOOL v29 = +[NSDictionary dictionaryWithObjects:&v56 forKeys:&v55 count:1];
      id v30 = +[NSError wcErrorWithCode:7001 userInfo:v29];

      v17[2](v17, v30);
      goto LABEL_17;
    }
    unsigned __int8 v25 = -[WatchConnectivityDaemon copyFile:to:](self, "copyFile:to:", [v14 fileDescriptor], v24);
    close(v24);
    if (v25)
    {
LABEL_10:
      v36[0] = _NSConcreteStackBlock;
      v36[1] = 3221225472;
      v36[2] = sub_100014D30;
      v36[3] = &unk_100044F68;
      id v37 = v18;
      id v38 = self;
      id v39 = v35;
      id v40 = v15;
      id v41 = v21;
      id v42 = v34;
      v45 = &v47;
      v44 = v17;
      id v43 = v14;
      [(WatchConnectivityDaemon *)self duetIdentifiersForCompanionAppID:v37 withCompletionHandler:v36];

      id v26 = v37;
    }
    else
    {
      id v31 = wc_log();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
        sub_10002B370();
      }

      id v26 = [objc_alloc((Class)NSError) initWithDomain:NSPOSIXErrorDomain code:*__error() userInfo:0];
      NSErrorUserInfoKey v53 = NSUnderlyingErrorKey;
      id v54 = v26;
      id v32 = +[NSDictionary dictionaryWithObjects:&v54 forKeys:&v53 count:1];
      id v33 = +[NSError wcErrorWithCode:7001 userInfo:v32];

      v17[2](v17, v33);
    }
LABEL_17:

    goto LABEL_18;
  }
  v17[2](v17, (void *)v48[5]);
LABEL_18:
  _Block_object_dispose(&v47, 8);
}

- (BOOL)copyFile:(int)a3 to:(int)a4
{
  do
  {
    ssize_t v6 = read(a3, __buf, 0x1000uLL);
    if (v6 < 1) {
      return v6 == 0;
    }
  }
  while (write(a4, __buf, v6) == v6);
  BOOL v7 = wc_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Warning: missing bytes", v9, 2u);
  }

  return 0;
}

- (void)cancelSendWithIdentifier:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(WatchConnectivityDaemon *)self idsService];
  id v10 = 0;
  unsigned __int8 v6 = [v5 cancelIdentifier:v4 error:&v10];
  id v7 = v10;

  id v8 = wc_log();
  id v9 = v8;
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v12 = v4;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    sub_10002B440();
  }
}

- (void)handleIncomingFileURL:(id)a3 communicationID:(id)a4 pairingID:(id)a5 sendID:(id)a6 metadata:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  unsigned int v17 = wc_log();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    id v18 = [v12 path];
    *(_DWORD *)buf = 138544386;
    id v19 = "YES";
    id v31 = v18;
    if (!v16) {
      id v19 = "NO";
    }
    __int16 v32 = 2114;
    id v33 = v13;
    __int16 v34 = 2114;
    id v35 = v14;
    __int16 v36 = 2114;
    id v37 = v15;
    __int16 v38 = 2080;
    id v39 = v19;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "fileURL: %{public}@, communicationID: %{public}@, pairingID: %{public}@, sendID: %{public}@, hasMetadata: %s", buf, 0x34u);
  }
  uint64_t v20 = [(WatchConnectivityDaemon *)self applicationInfoForCommunicationID:v13];
  id v21 = (void *)v20;
  if (v14 && v13 && v20)
  {
    long long v22 = [v16 objectForKeyedSubscript:@"u"];
    id v29 = 0;
    long long v23 = [(WatchConnectivityDaemon *)self moveFileToClientInbox:v12 applicationInfo:v21 pairingID:v14 fileIdentifier:v15 userInfoData:v22 error:&v29];
    uint64_t v24 = v29;

    if (v23)
    {
      id v28 = v15;
      id v25 = v12;
      id v26 = [(NSMutableDictionary *)self->_communicationIdentifierToClient objectForKeyedSubscript:v13];
      [v26 handleIncomingFileWithPairingID:v14];
      id v27 = [v26 connection];

      if (!v27) {
        [(WatchConnectivityDaemon *)self notifyDuetOfPendingContentForCompanionAppID:v13 forComplication:0];
      }
      id v12 = v25;
      id v15 = v28;
    }
    else
    {
      id v26 = wc_log();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        sub_10002B4CC();
      }
    }
  }
  else
  {
    uint64_t v24 = wc_log();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      id v31 = v13;
      __int16 v32 = 2114;
      id v33 = v21;
      __int16 v34 = 2114;
      id v35 = v14;
      _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "missing required values. communicationID: %{public}@, applicationInfo: %{public}@, pairingID: %{public}@", buf, 0x20u);
    }
  }
}

- (BOOL)fileTransferExistsForPairingID:(id)a3 identifier:(id)a4 applicationInfo:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = +[WCDSystemMonitor sharedSystemMonitor];
  id v11 = [v10 dataContainerURLForApplicationInfo:v9];

  if (v7 && v11)
  {
    id v12 = WCFileTransfersURLInContainer();
    id v13 = [v12 URLByAppendingPathComponent:v8 isDirectory:1];

    id v14 = [v13 URLByAppendingPathComponent:WCFileTransferDataFileName isDirectory:0];

    unsigned __int8 v15 = [v14 checkResourceIsReachableAndReturnError:0];
  }
  else
  {
    id v16 = wc_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_10002B568();
    }

    unsigned __int8 v15 = 0;
  }

  return v15;
}

- (void)persistFileTransferResult:(id)a3 pairingID:(id)a4 applicationInfo:(id)a5 identifier:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = +[WCDSystemMonitor sharedSystemMonitor];
  id v14 = [v13 dataContainerURLForApplicationInfo:v11];

  if (v10 && v14)
  {
    unsigned __int8 v15 = WCFileTransfersURLInContainer();
    id v16 = +[WCDIndexManager sharedManager];
    unsigned int v17 = [v16 fileResultsIndexForApplication:v11 pairingID:v10];

    id v18 = [v15 URLByAppendingPathComponent:v12 isDirectory:1];

    id v19 = +[NSFileManager defaultManager];
    id v36 = 0;
    unsigned int v20 = [v19 createDirectoryAtURL:v18 withIntermediateDirectories:1 attributes:0 error:&v36];
    id v21 = v36;

    if (v20)
    {
      uint64_t v22 = [v17 addContentIdentifier:v12];
      long long v23 = objc_opt_new();
      uint64_t v24 = v23;
      if ((unint64_t)v9 | v22)
      {
        if (v9) {
          id v25 = v9;
        }
        else {
          id v25 = (id)v22;
        }
        [v23 setObject:v25 forKeyedSubscript:WCFileTransferResultErrorKey];
      }

      id v35 = 0;
      __int16 v34 = v24;
      id v26 = +[NSKeyedArchiver archivedDataWithRootObject:v24 requiringSecureCoding:1 error:&v35];
      id v27 = v35;
      id v33 = v26;
      if (v26)
      {
        id v31 = v17;
        __int16 v32 = [v18 URLByAppendingPathComponent:WCFileTransferResultsFileName isDirectory:0];
        unsigned int v28 = [v26 writeToURL:x0 options:x1 error:x2];
        id v21 = v27;

        if (v28)
        {
          id v29 = wc_log();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            CFStringRef v30 = @"SUCCESS";
            *(_DWORD *)buf = 138543874;
            if (v9) {
              CFStringRef v30 = (const __CFString *)v9;
            }
            id v38 = v12;
            __int16 v39 = 2114;
            id v40 = v11;
            __int16 v41 = 2114;
            CFStringRef v42 = v30;
            _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "id %{public}@: applicatio: %{public}@ result: %{public}@", buf, 0x20u);
          }
          unsigned int v17 = v31;
        }
        else
        {
          unsigned int v17 = v31;
          [v31 removeContentIdentifier:v12];
          id v29 = wc_log();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
            sub_10002B66C();
          }
        }
      }
      else
      {
        __int16 v32 = wc_log();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
          sub_10002B5D0();
        }
        id v21 = v27;
      }
    }
    else
    {
      uint64_t v22 = wc_log();
      if (os_log_type_enabled((os_log_t)v22, OS_LOG_TYPE_ERROR)) {
        sub_10002B708();
      }
    }
  }
  else
  {
    id v21 = wc_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_10002B568();
    }
  }
}

- (BOOL)notifyIfFileTransferWithCommunicationID:(id)a3 pairingID:(id)a4 sendID:(id)a5 success:(BOOL)a6 error:(id)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  id v16 = [(WatchConnectivityDaemon *)self applicationInfoForCommunicationID:v12];
  BOOL v17 = [(WatchConnectivityDaemon *)self fileTransferExistsForPairingID:v13 identifier:v14 applicationInfo:v16];
  if (v17)
  {
    id v18 = wc_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = 138543618;
      id v23 = v14;
      __int16 v24 = 2114;
      id v25 = v12;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "sendID: %{public}@, communicationID: %{public}@ found valid file transfer", (uint8_t *)&v22, 0x16u);
    }

    if (v8) {
      id v19 = 0;
    }
    else {
      id v19 = v15;
    }
    [(WatchConnectivityDaemon *)self persistFileTransferResult:v19 pairingID:v13 applicationInfo:v16 identifier:v14];
    unsigned int v20 = [(NSMutableDictionary *)self->_communicationIdentifierToClient objectForKeyedSubscript:v12];
    [v20 handleFileResultWithPairingID:v13];
  }
  return v17;
}

- (BOOL)sendComplicationUserInfo:(id)a3 clientID:(id)a4 clientPairingID:(id)a5 identifier:(id)a6 errorHandler:(id)a7
{
  id v12 = a3;
  id v13 = (__CFString *)a4;
  id v14 = a5;
  id v15 = (__CFString *)a6;
  id v16 = (void (**)(id, NSObject *))a7;
  BOOL v17 = +[WCDPushKitManager sharedPushKitManager];
  [v17 releaseAssertionForBundleID:v13];

  id v49 = 0;
  LODWORD(v17) = [(WatchConnectivityDaemon *)self errorIfPreconditionsNotSatisfiedWithClientPairingID:v14 error:&v49];
  id v18 = v49;
  if (v17)
  {
    v16[2](v16, v18);
    BOOL v19 = 0;
  }
  else
  {
    v45 = v12;
    unsigned int v20 = wc_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      CFStringRef v51 = v13;
      __int16 v52 = 2114;
      NSErrorUserInfoKey v53 = v15;
      __int16 v54 = 2114;
      id v55 = v14;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "clientID: %{public}@, identifier: %{public}@, clientPairingID: %{public}@", buf, 0x20u);
    }

    id v21 = +[WCDSystemMonitor sharedSystemMonitor];
    int v22 = [v21 duetComplications];
    v48 = v18;
    unsigned __int8 v23 = [v22 admissionCheckOnComplication:v13 forRemote:1 error:&v48];
    __int16 v24 = v48;

    if (v23)
    {
      unsigned int v25 = [(WatchConnectivityDaemon *)self cellUsageAllowedForBundleID:v13];
      id v26 = wc_log();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        CFStringRef v27 = @"not ";
        if (v25) {
          CFStringRef v27 = &stru_100045808;
        }
        *(_DWORD *)buf = 138412546;
        CFStringRef v51 = v27;
        __int16 v52 = 2112;
        NSErrorUserInfoKey v53 = v13;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Cell %@allowed for complication push for %@", buf, 0x16u);
      }

      uint64_t v28 = [(__CFString *)v13 stringByAppendingString:@"-current-complication"];
      id v29 = objc_opt_new();
      id v43 = (void *)v28;
      [v29 setObject:v28 forKeyedSubscript:IDSSendMessageOptionQueueOneIdentifierKey];
      [v29 setObject:v13 forKeyedSubscript:IDSSendMessageOptionSubServiceKey];
      CFStringRef v30 = +[NSNumber numberWithDouble:IDSMaxMessageTimeout];
      [v29 setObject:v30 forKeyedSubscript:IDSSendMessageOptionTimeoutKey];

      [v29 setObject:&__kCFBooleanTrue forKeyedSubscript:IDSSendMessageOptionBypassDuetKey];
      if (v25)
      {
        [v29 setObject:&__kCFBooleanTrue forKeyedSubscript:IDSSendMessageOptionAllowCloudDeliveryKey];
        [v29 setObject:&__kCFBooleanTrue forKeyedSubscript:IDSSendMessageOptionNonCloudWakingKey];
      }
      v44 = v15;
      id v31 = [(WatchConnectivityDaemon *)self dataFromUUIDString:v15];
      [v29 setObject:v31 forKeyedSubscript:IDSSendMessageOptionUUIDKey];

      id v32 = objc_alloc((Class)IDSProtobuf);
      id v33 = [v45 data];
      id v34 = [v32 initWithProtobufData:v33 type:9 isResponse:0];

      id v35 = [(WatchConnectivityDaemon *)self idsService];
      id v36 = +[NSSet setWithObject:IDSDefaultPairedDevice];
      v46 = v24;
      id v47 = 0;
      CFStringRef v42 = v34;
      [v35 sendProtobuf:v34 toDestinations:v36 priority:200 options:v29 identifier:&v47 error:&v46];
      id v37 = (__CFString *)v47;
      id v18 = v46;

      id v38 = wc_log();
      __int16 v39 = v38;
      if (v18)
      {
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
          sub_10002B0E4();
        }

        __int16 v39 = [(WatchConnectivityDaemon *)self WCErrorForIDSError:v18];
        v16[2](v16, v39);
      }
      else if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        CFStringRef v51 = v37;
        _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
      }
      id v15 = v44;

      BOOL v19 = 1;
    }
    else
    {
      id v40 = wc_log();
      id v18 = v40;
      if (v24)
      {
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
          sub_10002B7B4();
        }

        BOOL v19 = 0;
        id v18 = v24;
      }
      else
      {
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          CFStringRef v51 = v13;
          __int16 v52 = 2114;
          NSErrorUserInfoKey v53 = v15;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "clientID: %{public}@, identifier: %{public}@, rejected by admissions check", buf, 0x16u);
        }
        BOOL v19 = 0;
      }
    }
    id v12 = v45;
  }

  return v19;
}

- (void)handleIncomingUserInfoTransferProto:(id)a3 communicationID:(id)a4 pairingID:(id)a5 sendID:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = wc_log();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    id v15 = [v10 transferIdentifier];
    *(_DWORD *)buf = 138544130;
    id v27 = v11;
    __int16 v28 = 2114;
    id v29 = v12;
    __int16 v30 = 2114;
    id v31 = v13;
    __int16 v32 = 2114;
    id v33 = v15;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "communicationID: %{public}@, pairingID: %{public}@, sendID: %{public}@, userInfoID: %{public}@", buf, 0x2Au);
  }
  id v16 = objc_alloc((Class)WCSessionUserInfoTransfer);
  BOOL v17 = [v10 transferIdentifier];
  id v18 = [v16 initWithTranferIdentifier:v17 complicationTransferIdentifier:v13 currentComplication:1];

  BOOL v19 = [v10 clientData];
  id v25 = 0;
  unsigned __int8 v20 = [v18 updateUserInfoData:v19 error:&v25];
  id v21 = v25;

  if ((v20 & 1) == 0)
  {
    int v22 = wc_log();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_10002B840();
    }
  }
  unsigned __int8 v23 = [(WatchConnectivityDaemon *)self applicationInfoForCommunicationID:v11];
  [(WatchConnectivityDaemon *)self storeComplicationUserInfoTransfer:v18 applicationInfo:v23 pairingID:v12];
  __int16 v24 = [(NSMutableDictionary *)self->_communicationIdentifierToClient objectForKeyedSubscript:v11];
  [v24 handleIncomingUserInfoWithPairingID:v12];
  [(WatchConnectivityDaemon *)self handleComplicationPingForCommunicationIdentifier:v11];
}

- (BOOL)errorIfPreconditionsNotSatisfiedWithClientPairingID:(id)a3 error:(id *)a4
{
  id v5 = a3;
  unsigned __int8 v6 = +[WCDSystemMonitor sharedSystemMonitor];
  unsigned __int8 v7 = [v6 watchConnectivityServiceAvailable];

  if (v7)
  {
    BOOL v8 = 0;
  }
  else
  {
    BOOL v8 = +[NSError wcErrorWithCode:7001];
  }
  id v9 = +[WCDSystemMonitor sharedSystemMonitor];
  id v10 = [v9 pairingID];
  unsigned __int8 v11 = [v5 isEqual:v10];

  if ((v11 & 1) == 0)
  {
    uint64_t v12 = +[NSError wcErrorWithCode:7014];

    BOOL v8 = (void *)v12;
  }
  if (a4) {
    *a4 = v8;
  }

  return v8 != 0;
}

- (void)transferUserInfo:(id)a3 withMetadata:(id)a4 identifier:(id)a5 clientID:(id)a6 clientPairingID:(id)a7 errorHandler:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  BOOL v19 = (void (**)(id, id))a8;
  id v30 = 0;
  unsigned int v20 = [(WatchConnectivityDaemon *)self errorIfPreconditionsNotSatisfiedWithClientPairingID:v18 error:&v30];
  id v21 = v30;
  if (v20)
  {
    v19[2](v19, v21);
  }
  else
  {
    int v22 = wc_log();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      id v32 = v16;
      __int16 v33 = 2114;
      id v34 = v17;
      __int16 v35 = 2114;
      id v36 = v18;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "identifier: %{public}@, clientID: %{public}@, pairingID: %{public}@", buf, 0x20u);
    }

    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_1000166A4;
    v23[3] = &unk_100044F90;
    id v24 = v17;
    id v25 = self;
    id v26 = v16;
    id v27 = v14;
    id v28 = v15;
    id v29 = v19;
    [(WatchConnectivityDaemon *)self duetIdentifiersForCompanionAppID:v24 withCompletionHandler:v23];
  }
}

- (void)handleIncomingUserInfoURL:(id)a3 communicationID:(id)a4 pairingID:(id)a5 sendID:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = wc_log();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    id v15 = [v10 path];
    int v21 = 138544130;
    id v22 = v15;
    __int16 v23 = 2114;
    id v24 = v11;
    __int16 v25 = 2114;
    id v26 = v12;
    __int16 v27 = 2114;
    id v28 = v13;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "userInfoURL: %{public}@, communicationID: %{public}@, pairingID: %{public}@, sendID: %{public}@", (uint8_t *)&v21, 0x2Au);
  }
  uint64_t v16 = [(WatchConnectivityDaemon *)self applicationInfoForCommunicationID:v11];
  id v17 = (void *)v16;
  if (v11 && v16)
  {
    id v18 = [(WatchConnectivityDaemon *)self moveUserInfoToClientInbox:v10 applicationInfo:v16 pairingID:v12 userInfoIdentifier:v13];
    if (v18)
    {
      BOOL v19 = [(NSMutableDictionary *)self->_communicationIdentifierToClient objectForKeyedSubscript:v11];
      [v19 handleIncomingUserInfoWithPairingID:v12];
      unsigned int v20 = [v19 connection];

      if (!v20) {
        [(WatchConnectivityDaemon *)self notifyDuetOfPendingContentForCompanionAppID:v11 forComplication:0];
      }
    }
  }
  else
  {
    id v18 = wc_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      int v21 = 138543874;
      id v22 = v11;
      __int16 v23 = 2114;
      id v24 = v17;
      __int16 v25 = 2114;
      id v26 = v12;
      _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "missing required values. communicationID: %{public}@, application: %{public}@, pairingID: %{public}@", (uint8_t *)&v21, 0x20u);
    }
  }
}

- (id)complicationUserInfoPathInDataContainer:(id)a3 pairingID:(id)a4
{
  id v4 = WCTransferredUserInfoInboxURLInContainer();
  id v5 = [v4 URLByAppendingPathComponent:WCComplicationUserInfoIDFileName isDirectory:0];
  id v14 = 0;
  unsigned __int8 v6 = +[NSData dataWithContentsOfURL:v5 options:0 error:&v14];
  id v7 = v14;
  if (v6)
  {
    id v8 = [objc_alloc((Class)NSString) initWithData:v6 encoding:4];
    id v9 = [v4 URLByAppendingPathComponent:v8 isDirectory:1];
    id v10 = [v9 URLByAppendingPathComponent:WCUserInfoTransferObjectFileName isDirectory:0];
    id v11 = [v10 path];

    id v12 = wc_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v16 = v11;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "loaded complication user info path %{public}@", buf, 0xCu);
    }
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (BOOL)notifyIfUserInfoTransferWithCommunicationID:(id)a3 pairingID:(id)a4 sendID:(id)a5 success:(BOOL)a6 error:(id)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  uint64_t v16 = [(WatchConnectivityDaemon *)self applicationInfoForCommunicationID:v12];
  if (v8)
  {
    id v17 = WCTransferIdentifierFromComplicationIdentifier();
    if ([(WatchConnectivityDaemon *)self userInfoExistsForPairingID:v13 identifier:v17 applicationInfo:v16])
    {
      id v18 = wc_log();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        int v24 = 138543618;
        id v25 = v14;
        __int16 v26 = 2114;
        id v27 = v12;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "sendID: %{public}@, communicationID: %{public}@ found valid complication user info", (uint8_t *)&v24, 0x16u);
      }

      [(WatchConnectivityDaemon *)self cancelSendWithIdentifier:v17];
      goto LABEL_9;
    }
  }
  if (![(WatchConnectivityDaemon *)self userInfoExistsForPairingID:v13 identifier:v14 applicationInfo:v16])
  {
    BOOL v22 = 0;
    id v17 = v14;
    goto LABEL_16;
  }
  id v17 = v14;
LABEL_9:
  BOOL v19 = wc_log();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    int v24 = 138543618;
    id v25 = v17;
    __int16 v26 = 2114;
    id v27 = v12;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "sendID: %{public}@, communicationID: %{public}@ found valid user info", (uint8_t *)&v24, 0x16u);
  }

  if (v8) {
    id v20 = 0;
  }
  else {
    id v20 = v15;
  }
  [(WatchConnectivityDaemon *)self persistUserInfoTransferResult:v20 pairingID:v13 applicationInfo:v16 identifier:v17];
  int v21 = [(NSMutableDictionary *)self->_communicationIdentifierToClient objectForKeyedSubscript:v12];
  [v21 handleUserInfoResultWithPairingID:v13];

  BOOL v22 = 1;
LABEL_16:

  return v22;
}

- (BOOL)userInfoExistsForPairingID:(id)a3 identifier:(id)a4 applicationInfo:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = +[WCDSystemMonitor sharedSystemMonitor];
  id v11 = [v10 dataContainerURLForApplicationInfo:v9];

  if (v7 && v11)
  {
    id v12 = WCUserInfoTransfersInContainer();
    id v13 = [v12 URLByAppendingPathComponent:v8 isDirectory:1];

    id v14 = [v13 URLByAppendingPathComponent:WCUserInfoTransferObjectFileName isDirectory:0];

    unsigned __int8 v15 = [v14 checkResourceIsReachableAndReturnError:0];
  }
  else
  {
    uint64_t v16 = wc_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_10002B568();
    }

    unsigned __int8 v15 = 0;
  }

  return v15;
}

- (void)persistUserInfoTransferResult:(id)a3 pairingID:(id)a4 applicationInfo:(id)a5 identifier:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = +[WCDSystemMonitor sharedSystemMonitor];
  id v14 = [v13 dataContainerURLForApplicationInfo:v11];

  if (v10 && v14)
  {
    unsigned __int8 v15 = WCUserInfoTransfersInContainer();
    uint64_t v16 = +[WCDIndexManager sharedManager];
    id v17 = [v16 userInfoResultsIndexForApplication:v11 pairingID:v10];

    id v18 = [v15 URLByAppendingPathComponent:v12 isDirectory:1];

    BOOL v19 = +[NSFileManager defaultManager];
    id v36 = 0;
    unsigned int v20 = [v19 createDirectoryAtURL:v18 withIntermediateDirectories:1 attributes:0 error:&v36];
    int v21 = v36;

    if (v20)
    {
      uint64_t v22 = [v17 addContentIdentifier:v12];
      __int16 v23 = objc_opt_new();
      int v24 = v23;
      if ((unint64_t)v9 | v22)
      {
        if (v9) {
          id v25 = v9;
        }
        else {
          id v25 = (id)v22;
        }
        [v23 setObject:v25 forKeyedSubscript:WCUserInfoTransferResultErrorKey];
      }

      id v35 = 0;
      id v34 = v24;
      __int16 v26 = +[NSKeyedArchiver archivedDataWithRootObject:v24 requiringSecureCoding:1 error:&v35];
      id v27 = v35;
      __int16 v33 = v26;
      if (v26)
      {
        id v31 = v17;
        id v32 = [v18 URLByAppendingPathComponent:WCUserInfoTransferResultsFileName isDirectory:0];
        unsigned int v28 = [v26 writeToURL:x0 options:x1 error:x2];
        int v21 = v27;

        if (v28)
        {
          id v29 = wc_log();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            CFStringRef v30 = @"SUCCESS";
            *(_DWORD *)buf = 138543874;
            if (v9) {
              CFStringRef v30 = (const __CFString *)v9;
            }
            id v38 = v12;
            __int16 v39 = 2114;
            id v40 = v11;
            __int16 v41 = 2114;
            CFStringRef v42 = v30;
            _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "id %{public}@: application: %{public}@ result: %{public}@", buf, 0x20u);
          }
          id v17 = v31;
        }
        else
        {
          id v17 = v31;
          [v31 removeContentIdentifier:v12];
          id v29 = wc_log();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
            sub_10002B9D4();
          }
        }
      }
      else
      {
        id v32 = wc_log();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
          sub_10002B938();
        }
        int v21 = v27;
      }
    }
    else
    {
      uint64_t v22 = wc_log();
      if (os_log_type_enabled((os_log_t)v22, OS_LOG_TYPE_ERROR)) {
        sub_10002BA70();
      }
    }
  }
  else
  {
    int v21 = wc_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_10002B568();
    }
  }
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7 context:(id)a8
{
  BOOL v10 = a6;
  id v12 = a5;
  id v13 = a7;
  id v14 = a8;
  unsigned __int8 v15 = [v14 serviceIdentifier];
  uint64_t v16 = wc_log();
  id v17 = v16;
  if (v10)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v36 = v12;
      __int16 v37 = 2114;
      id v38 = v15;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "identifier: %{public}@, communicationID: %{public}@", buf, 0x16u);
    }
  }
  else
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      id v28 = v13;
      id v27 = NSPrintF();
      *(_DWORD *)buf = 138543874;
      id v36 = v12;
      __int16 v37 = 2114;
      id v38 = v15;
      __int16 v39 = 2114;
      id v40 = v27;
      _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "failed. identifier: %{public}@, communicationID: %{public}@ due to %{public}@", buf, 0x20u);
    }
    id v18 = [(WatchConnectivityDaemon *)self idsInsecureServiceIdentifier];
    unsigned int v19 = [v15 isEqual:v18];

    if (v19) {
      [(WCDPairedSyncManager *)self->_pairedSyncManager handlePotentialPairedSyncForComplicationsFailedWithIdentifier:v12 error:v13];
    }
  }
  unsigned int v20 = [(WatchConnectivityDaemon *)self idsServiceIdentifier];
  if ([v15 isEqual:v20]) {
    goto LABEL_18;
  }
  int v21 = [(WatchConnectivityDaemon *)self idsInsecureServiceIdentifier];
  unsigned __int8 v22 = [v15 isEqual:v21];

  if ((v22 & 1) == 0)
  {
    __int16 v23 = [v14 originalDestinationDevice];
    unsigned int v20 = [(WatchConnectivityDaemon *)self pairingIDForIDSUniqueDeviceID:v23];

    int v24 = [(WatchConnectivityDaemon *)self WCErrorForIDSError:v13];
    id v25 = [(NSMutableDictionary *)self->_sendIdentifierToHandler objectForKeyedSubscript:v12];
    if (v25)
    {
      __int16 v26 = wc_log();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        id v36 = v12;
        __int16 v37 = 2114;
        id v38 = v15;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "identifier: %{public}@, communicationID: %{public}@ has a completion handler, invoking it", buf, 0x16u);
      }

      ((void (**)(void, void *))v25)[2](v25, v24);
      [(NSMutableDictionary *)self->_sendIdentifierToHandler removeObjectForKey:v12];
    }
    else if (v15)
    {
      v29[0] = _NSConcreteStackBlock;
      v29[1] = 3221225472;
      v29[2] = sub_100017828;
      v29[3] = &unk_100044FB8;
      v29[4] = self;
      id v30 = v15;
      id v31 = v20;
      id v32 = v12;
      BOOL v34 = v10;
      id v33 = v24;
      [(WatchConnectivityDaemon *)self performBlockWhenReady:v29];
    }
LABEL_18:
  }
}

- (void)service:(id)a3 account:(id)a4 incomingUnhandledProtobuf:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a7;
  id v14 = a6;
  unsigned __int8 v15 = [v13 serviceIdentifier];
  uint64_t v16 = [v11 deviceForFromID:v14];

  id v17 = [v16 uniqueIDOverride];

  id v18 = [(WatchConnectivityDaemon *)self pairingIDForIDSUniqueDeviceID:v17];
  unsigned int v19 = wc_log();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v20 = &stru_100045808;
    if (v15) {
      CFStringRef v20 = v15;
    }
    CFStringRef v60 = v20;
    v63 = v17;
    int v21 = v18;
    unsigned __int8 v22 = -[WatchConnectivityDaemon descriptionFromPayloadSendType:](self, "descriptionFromPayloadSendType:", [v12 type]);
    unsigned int v23 = [v12 type];
    int v24 = [v12 data];
    *(_DWORD *)buf = 138544130;
    CFStringRef v86 = v60;
    __int16 v87 = 2080;
    v88 = v22;
    id v18 = v21;
    __int16 v89 = 1024;
    unsigned int v90 = v23;
    __int16 v91 = 2048;
    id v92 = [v24 length];
    id v17 = v63;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "communicationID: %{public}@, WCDPayloadSendType: %s (%d), protobufSize: %ld", buf, 0x26u);
  }
  switch([v12 type])
  {
    case 1u:
      v61 = self;
      id v25 = [WCDProtoMessageRequest alloc];
      __int16 v26 = v18;
      id v64 = v12;
      id v27 = [v12 data];
      id v28 = [(WCDProtoMessageRequest *)v25 initWithData:v27];

      id v29 = objc_alloc((Class)WCMessageRequest);
      id v30 = [v13 outgoingResponseIdentifier];
      id v31 = [(WCDProtoMessageRequest *)v28 clientData];
      BOOL v32 = [(WCDProtoMessageRequest *)v28 dictionaryMessage];
      BOOL v33 = [(WCDProtoMessageRequest *)v28 expectsResponse];
      BOOL v34 = v29;
      id v18 = v26;
      id v35 = [v34 initWithPairingID:v26 identifier:v30 data:v31 dictionaryMessage:v32 expectsResponse:v33];

      if ([(WCDProtoMessageRequest *)v28 hasIsInUse]) {
        unsigned __int8 v36 = [(WCDProtoMessageRequest *)v28 isInUse];
      }
      else {
        unsigned __int8 v36 = 1;
      }
      if ([(WCDProtoMessageRequest *)v28 hasCoreLocationData])
      {
        v57 = [(WCDProtoMessageRequest *)v28 coreLocationData];
      }
      else
      {
        v57 = 0;
      }
      v80[0] = _NSConcreteStackBlock;
      v80[1] = 3221225472;
      v80[2] = sub_1000181A8;
      v80[3] = &unk_100044FE0;
      v80[4] = v61;
      id v81 = v35;
      unsigned __int8 v84 = v36;
      v82 = v15;
      id v83 = v57;
      id v58 = v57;
      id v59 = v35;
      [(WatchConnectivityDaemon *)v61 service:v11 context:v13 performBlockWhenReady:v80];

      id v12 = v64;
      goto LABEL_27;
    case 2u:
      v62 = self;
      __int16 v37 = [WCDProtoMessageResponse alloc];
      id v65 = v12;
      id v38 = [v12 data];
      __int16 v39 = [(WCDProtoMessageResponse *)v37 initWithData:v38];

      id v40 = objc_alloc((Class)WCMessageResponse);
      __int16 v41 = [v13 incomingResponseIdentifier];
      CFStringRef v42 = [(WCDProtoMessageResponse *)v39 clientData];
      id v43 = [v40 initWithPairingID:v18 identifier:v41 data:v42 dictionaryMessage:-[WCDProtoMessageResponse dictionaryMessage](v39, "dictionaryMessage")];

      if ([(WCDProtoMessageResponse *)v39 errorCode])
      {
        v44 = +[NSError wcErrorFromReceivedCode:[(WCDProtoMessageResponse *)v39 errorCode]];
        [v43 setError:v44];
      }
      v77[0] = _NSConcreteStackBlock;
      v77[1] = 3221225472;
      v77[2] = sub_1000181BC;
      v77[3] = &unk_100045008;
      v77[4] = v62;
      v78 = v15;
      id v79 = v43;
      id v45 = v43;
      [(WatchConnectivityDaemon *)v62 service:v11 context:v13 performBlockWhenReady:v77];

      id v12 = v65;
      goto LABEL_27;
    case 3u:
      v72[0] = _NSConcreteStackBlock;
      v72[1] = 3221225472;
      v72[2] = sub_100018214;
      v72[3] = &unk_100045030;
      id v73 = v12;
      v74 = self;
      v75 = v15;
      id v76 = v18;
      [(WatchConnectivityDaemon *)self service:v11 context:v13 performBlockWhenReady:v72];

      v46 = v73;
      goto LABEL_17;
    case 4u:
      [(WatchConnectivityDaemon *)self handleCounterpartDaemonDidStart];
      break;
    case 5u:
      id v47 = [WCDProtoDaemonClientsInformation alloc];
      v48 = [v12 data];
      id v49 = [(WCDProtoDaemonClientsInformation *)v47 initWithData:v48];

      [(WatchConnectivityDaemon *)self handleDaemonClientsInformation:v49];
      goto LABEL_24;
    case 9u:
      v66[0] = _NSConcreteStackBlock;
      v66[1] = 3221225472;
      v66[2] = sub_100018310;
      v66[3] = &unk_100045058;
      id v67 = v12;
      v68 = self;
      v69 = v15;
      id v70 = v18;
      id v71 = v13;
      [(WatchConnectivityDaemon *)self service:v11 context:v71 performBlockWhenReady:v66];

      v46 = v67;
LABEL_17:

      goto LABEL_27;
    case 0xAu:
      firstUnlockManager = self->_firstUnlockManager;
      v50 = [v12 data];
      [(WCDFirstUnlockManager *)firstUnlockManager handleFirstUnlockState:v50];
      goto LABEL_21;
    case 0xBu:
      __int16 v52 = self->_firstUnlockManager;
      v50 = [v12 data];
      [(WCDFirstUnlockManager *)v52 handleFirstUnlockRequest:v50];
      goto LABEL_21;
    case 0xCu:
      NSErrorUserInfoKey v53 = self->_firstUnlockManager;
      v50 = [v12 data];
      [(WCDFirstUnlockManager *)v53 handleFirstUnlockAck:v50];
      goto LABEL_21;
    case 0xFu:
      id v49 = [v13 outgoingResponseIdentifier];
      [(WatchConnectivityDaemon *)self handlePairedSyncComplicationsStartedWithIdentifier:v49];
      goto LABEL_24;
    case 0x10u:
      __int16 v54 = [WCDProtoPairedSyncComplicationsStartedAck alloc];
      id v55 = [v12 data];
      id v49 = [(WCDProtoPairedSyncComplicationsStartedAck *)v54 initWithData:v55];

      id v56 = [v13 incomingResponseIdentifier];
      [(WatchConnectivityDaemon *)self handlePairedSyncComplicationsStartedAck:v49 identifier:v56];

LABEL_24:
      break;
    case 0x11u:
      [(WatchConnectivityDaemon *)self handleInstalledAppsChangedMessage];
      break;
    default:
      v50 = wc_log();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
        sub_10002BB9C(v12);
      }
LABEL_21:

      break;
  }
  [v11 sendAckForMessageWithContext:v13];
LABEL_27:
}

- (void)service:(id)a3 account:(id)a4 incomingResourceAtURL:(id)a5 metadata:(id)a6 fromID:(id)a7 context:(id)a8
{
  id v13 = a3;
  id v32 = a5;
  id v14 = a6;
  id v15 = a8;
  id v16 = a7;
  id v17 = wc_log();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    BOOL v34 = "-[WatchConnectivityDaemon service:account:incomingResourceAtURL:metadata:fromID:context:]";
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }

  id v18 = [v15 serviceIdentifier];
  unsigned int v19 = [v15 outgoingResponseIdentifier];
  CFStringRef v20 = [v13 deviceForFromID:v16];

  int v21 = [v20 uniqueIDOverride];

  unsigned __int8 v22 = [(WatchConnectivityDaemon *)self pairingIDForIDSUniqueDeviceID:v21];
  if (v14
    && ([v14 objectForKeyedSubscript:@"t"],
        unsigned int v23 = objc_claimAutoreleasedReturnValue(),
        v23,
        v23))
  {
    id v31 = v19;
    int v24 = v18;
    id v25 = [v14 objectForKeyedSubscript:@"t"];
    id v26 = [v25 integerValue];

    if (v26 == (id)2)
    {
      id v27 = v32;
      id v18 = v24;
      id v29 = v24;
      unsigned int v19 = v31;
      [(WatchConnectivityDaemon *)self handleIncomingUserInfoURL:v32 communicationID:v29 pairingID:v22 sendID:v31];
    }
    else
    {
      id v18 = v24;
      if (v26 == (id)1)
      {
        unsigned int v19 = v31;
        id v27 = v32;
        [(WatchConnectivityDaemon *)self handleIncomingFileURL:v32 communicationID:v18 pairingID:v22 sendID:v31 metadata:v14];
      }
      else
      {
        id v30 = wc_log();
        unsigned int v19 = v31;
        id v27 = v32;
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
          sub_10002BC54(v14, @"t", v30);
        }
      }
    }
  }
  else
  {
    id v28 = wc_log();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      sub_10002BC20();
    }

    id v27 = v32;
  }
  [v13 sendAckForMessageWithContext:v15];
}

- (void)service:(id)a3 connectedDevicesChanged:(id)a4
{
  id v5 = a3;
  unsigned __int8 v6 = wc_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136446210;
    id v8 = "-[WatchConnectivityDaemon service:connectedDevicesChanged:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v7, 0xCu);
  }

  [(WatchConnectivityDaemon *)self updateActiveDeviceConnectedForService:v5];
}

- (void)service:(id)a3 devicesChanged:(id)a4
{
  id v5 = a3;
  unsigned __int8 v6 = wc_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136446210;
    id v8 = "-[WatchConnectivityDaemon service:devicesChanged:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v7, 0xCu);
  }

  [(WatchConnectivityDaemon *)self updateActiveDeviceConnectedForService:v5];
}

- (void)updateActiveDeviceConnectedForService:(id)a3
{
  id v3 = a3;
  id v5 = +[WCDSystemMonitor sharedSystemMonitor];
  id v4 = [v3 isActiveDeviceConnected];

  [v5 setActiveDeviceConnected:v4];
}

- (void)service:(id)a3 didSwitchActivePairedDevice:(id)a4 acknowledgementBlock:(id)a5
{
  id v8 = a4;
  id v9 = (void (**)(void))a5;
  id v10 = a3;
  id v11 = [(WatchConnectivityDaemon *)self idsService];
  unsigned int v12 = [v10 isEqual:v11];

  if (v12)
  {
    id v13 = [(WatchConnectivityDaemon *)self idsServiceIdentifier];
    id v14 = +[WCDSystemMonitor sharedSystemMonitor];
    [v14 handleSwitchStartedByIDS];
  }
  else
  {
    id v13 = [(WatchConnectivityDaemon *)self idsInsecureServiceIdentifier];
  }
  id v15 = wc_log();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    id v16 = [v8 name];
    int v17 = 138543618;
    id v18 = v13;
    __int16 v19 = 2114;
    CFStringRef v20 = v16;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ \"%{public}@\". Acknowledging switch with IDS", (uint8_t *)&v17, 0x16u);
  }
  v9[2](v9);
}

- (IDSDevice)activeIDSDevice
{
  v2 = [(WatchConnectivityDaemon *)self idsService];
  id v3 = [v2 activeIDSDevice];

  return (IDSDevice *)v3;
}

- (void)launchCompanionAppID:(id)a3 isInUse:(BOOL)a4 coreLocationData:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  id v10 = wc_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = "NO";
    if (v6) {
      id v11 = "YES";
    }
    *(_DWORD *)buf = 138543618;
    id v22 = v8;
    __int16 v23 = 2080;
    int v24 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "companionAppIdentifier: %{public}@, isInUse: %s", buf, 0x16u);
  }

  unsigned int v12 = +[AVSystemController sharedAVSystemController];
  [v12 setAttribute:v8 forKey:AVSystemController_AllowAppToInitiatePlaybackTemporarilyAttribute error:0];

  if (v6) {
    [(WatchConnectivityDaemon *)self setCLTransientAuthorization:v8 withCoreLocationData:v9];
  }
  id v13 = +[FBSSystemService sharedService];
  uint64_t v19 = FBSOpenApplicationOptionKeyActivateSuspended;
  CFStringRef v20 = &__kCFBooleanTrue;
  id v14 = +[NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100018C30;
  v16[3] = &unk_1000450D0;
  id v17 = v8;
  id v18 = self;
  id v15 = v8;
  [v13 openApplication:v15 options:v14 withResult:v16];
}

- (void)acquireBackgroundAssertionForIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v19 = 0;
  CFStringRef v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  BOOL v6 = [(NSMutableDictionary *)self->_companionAppAssertions objectForKeyedSubscript:v4];

  if (!v6)
  {
    id v7 = objc_alloc((Class)BKSProcessAssertion);
    id v13 = _NSConcreteStackBlock;
    uint64_t v14 = 3221225472;
    id v15 = sub_100019068;
    id v16 = &unk_1000450F8;
    id v18 = &v19;
    id v8 = v5;
    id v17 = v8;
    id v9 = [v7 initWithBundleIdentifier:v4 flags:1 reason:16 name:@"WatchConnectivity Background Launch" withHandler:&v13];
    dispatch_time_t v10 = dispatch_time(0, 3000000000);
    if (dispatch_semaphore_wait(v8, v10))
    {
      id v11 = wc_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_10002BDC4();
      }
    }
    if (*((unsigned char *)v20 + 24))
    {
      -[WatchConnectivityDaemon handleAquiredAssertion:identifier:](self, "handleAquiredAssertion:identifier:", v9, v4, v13, v14, v15, v16);
    }
    else
    {
      unsigned int v12 = wc_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_10002BD58();
      }
    }
  }

  _Block_object_dispose(&v19, 8);
}

- (void)cleanUpProcessAssertionForIdentifier:(id)a3
{
  id v4 = a3;
  dispatch_semaphore_t v5 = [(NSMutableDictionary *)self->_companionAppAssertions objectForKeyedSubscript:v4];
  BOOL v6 = v5;
  if (v5)
  {
    uint64_t v7 = [v5 objectForKeyedSubscript:@"process-assertion"];
    if (v7)
    {
      id v8 = (void *)v7;
      id v9 = wc_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 138543362;
        id v14 = v4;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "companionAppIdentifier: %{public}@ removing old process assertion", (uint8_t *)&v13, 0xCu);
      }

      [v8 invalidate];
    }
    uint64_t v10 = [v6 objectForKeyedSubscript:@"process-assertion-timer"];
    if (v10)
    {
      id v11 = v10;
      unsigned int v12 = wc_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 138543362;
        id v14 = v4;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "companionAppIdentifier: %{public}@ canceling old timer", (uint8_t *)&v13, 0xCu);
      }

      dispatch_source_cancel(v11);
    }
    [(NSMutableDictionary *)self->_companionAppAssertions removeObjectForKey:v4];
  }
}

- (void)handleAquiredAssertion:(id)a3 identifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = wc_log();
  id v9 = v8;
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v19 = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "companionAppIdentifier: %{public}@, acquired process assertion", buf, 0xCu);
    }

    uint64_t v10 = [(WatchConnectivityDaemon *)self createBackgroundAssertionTimerForIdentifier:v7];
    id v9 = v10;
    if (v10)
    {
      v16[0] = @"process-assertion";
      v16[1] = @"process-assertion-timer";
      v17[0] = v6;
      v17[1] = v10;
      id v11 = +[NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:2];
      [(NSMutableDictionary *)self->_companionAppAssertions setObject:v11 forKeyedSubscript:v7];

      dispatch_resume(v9);
      objc_initWeak((id *)buf, self->_companionAppAssertions);
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_100019448;
      v13[3] = &unk_100044D20;
      objc_copyWeak(&v15, (id *)buf);
      id v14 = v7;
      [v6 setInvalidationHandler:v13];

      objc_destroyWeak(&v15);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      unsigned int v12 = wc_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_10002BE6C();
      }
    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
  {
    sub_10002BDF8();
  }
}

- (id)createBackgroundAssertionTimerForIdentifier:(id)a3
{
  id v4 = a3;
  dispatch_semaphore_t v5 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)&_dispatch_main_q);
  dispatch_time_t v6 = dispatch_time(0, 10000000000);
  dispatch_source_set_timer(v5, v6, 0xFFFFFFFFFFFFFFFFLL, 0);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100019594;
  v9[3] = &unk_100044B08;
  v9[4] = self;
  id v10 = v4;
  id v7 = v4;
  dispatch_source_set_event_handler(v5, v9);

  return v5;
}

- (void)updateAllClientsWithValues
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = [(NSMutableDictionary *)self->_communicationIdentifierToClient allValues];
  id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [(WatchConnectivityDaemon *)self updateClientWithValues:*(void *)(*((void *)&v8 + 1) + 8 * (void)v7)];
        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)updateClientWithValues:(id)a3
{
  id v8 = a3;
  id v4 = +[WCDSystemMonitor sharedSystemMonitor];
  unsigned int v5 = [v4 initialSetUpComplete];

  if (v5)
  {
    counterpartClientCommunicationIdentifiers = self->_counterpartClientCommunicationIdentifiers;
    id v7 = [v8 communicationID];
    [v8 setCounterpartCanEstablishXPCConnection:[counterpartClientCommunicationIdentifiers containsObject:v7]];

    [v8 setPrivileged:0];
  }
}

- (const)descriptionFromPayloadSendType:(unsigned __int16)a3
{
  if ((a3 - 1) > 0x10) {
    return "UNKNOWN";
  }
  else {
    return off_100045140[(__int16)(a3 - 1)];
  }
}

- (id)dataFromUUIDString:(id)a3
{
  v7[0] = 0;
  v7[1] = 0;
  id v3 = a3;
  id v4 = [objc_alloc((Class)NSUUID) initWithUUIDString:v3];

  [v4 getUUIDBytes:v7];
  unsigned int v5 = +[NSData dataWithBytes:v7 length:16];

  return v5;
}

- (id)pairingIDForIDSUniqueDeviceID:(id)a3
{
  id v4 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  unsigned int v5 = [(WatchConnectivityDaemon *)self idsService];
  uint64_t v6 = [v5 devices];

  id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v17;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v6);
        }
        long long v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        long long v11 = [v10 uniqueIDOverride];
        unsigned int v12 = [v11 isEqual:v4];

        if (v12)
        {
          int v13 = +[WCDSystemMonitor sharedSystemMonitor];
          id v14 = [v10 nsuuid];
          id v7 = [v13 pairingIDForBTUUID:v14];

          goto LABEL_11;
        }
      }
      id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v7;
}

- (id)WCErrorForIDSError:(id)a3
{
  id v3 = a3;
  id v4 = [v3 domain];
  unsigned int v5 = [v4 isEqual:IDSErrorDomain];

  id v6 = v3;
  id v7 = v6;
  uint64_t v8 = v6;
  if (!v5) {
    goto LABEL_26;
  }
  if (!v6)
  {
    long long v9 = 0;
    goto LABEL_24;
  }
  long long v9 = v6;
  do
  {
    uint64_t v10 = (uint64_t)[v9 code];
    if (v10 <= 26)
    {
      if (v10 == 18)
      {
        NSErrorUserInfoKey v26 = NSUnderlyingErrorKey;
        id v27 = v7;
        long long v11 = +[NSDictionary dictionaryWithObjects:&v27 forKeys:&v26 count:1];
        uint64_t v12 = 7009;
        goto LABEL_14;
      }
      if (v10 != 23) {
        goto LABEL_12;
      }
LABEL_11:
      NSErrorUserInfoKey v24 = NSUnderlyingErrorKey;
      id v25 = v7;
      long long v11 = +[NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
      uint64_t v12 = 7017;
      goto LABEL_14;
    }
    if (v10 == 38) {
      goto LABEL_11;
    }
    if (v10 != 27)
    {
LABEL_12:
      long long v11 = [v9 userInfo];
      uint64_t v13 = [v11 objectForKeyedSubscript:NSUnderlyingErrorKey];

      uint64_t v8 = 0;
      long long v9 = (void *)v13;
      goto LABEL_15;
    }
    NSErrorUserInfoKey v28 = NSUnderlyingErrorKey;
    id v29 = v7;
    long long v11 = +[NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
    uint64_t v12 = 7015;
LABEL_14:
    uint64_t v8 = +[NSError wcErrorWithCode:v12 userInfo:v11];
LABEL_15:

    if (v8) {
      BOOL v14 = 1;
    }
    else {
      BOOL v14 = v9 == 0;
    }
  }
  while (!v14);
  if (!v8)
  {
LABEL_24:
    NSErrorUserInfoKey v18 = NSUnderlyingErrorKey;
    long long v19 = v7;
    id v15 = +[NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
    uint64_t v8 = +[NSError wcErrorWithCode:7001 userInfo:v15];
    goto LABEL_25;
  }
  id v15 = wc_log();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    long long v16 = [v7 description];
    *(_DWORD *)buf = 138543618;
    uint64_t v21 = v16;
    __int16 v22 = 2114;
    __int16 v23 = v8;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "error: (%{public}@) converted to (%{public}@)", buf, 0x16u);
  }
LABEL_25:

LABEL_26:

  return v8;
}

- (id)applicationInfoForCommunicationID:(id)a3
{
  id v3 = a3;
  id v4 = +[WCDSystemMonitor sharedSystemMonitor];
  unsigned int v5 = [v4 applicationWorkspace];
  id v6 = [v5 applicationInfoForBundleIdentifier:v3 type:1 allowPlaceholder:1];

  return v6;
}

- (void)duetIdentifiersForCompanionAppID:(id)a3 withCompletionHandler:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, id))a4;
  id v7 = +[WCDSystemMonitor sharedSystemMonitor];
  uint64_t v8 = [v7 applicationWorkspace];
  long long v9 = [v8 applicationInfoForBundleIdentifier:v5 type:1];

  if (v9)
  {
    uint64_t v10 = objc_opt_new();
    [v10 addObject:v5];
    long long v11 = [v9 watchAppBundleIdentifier];
    [v10 addObject:v11];

    uint64_t v12 = [v9 watchExtensionBundleIdentifier];
    if (v12) {
      [v10 addObject:v12];
    }
    uint64_t v13 = wc_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138543362;
      long long v17 = v10;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "gathered duet identifiers %{public}@", (uint8_t *)&v16, 0xCu);
    }

    id v14 = [v10 copy];
    v6[2](v6, v14);
  }
  else
  {
    id v15 = wc_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_10002BED8();
    }

    v6[2](v6, 0);
    uint64_t v10 = v6;
  }
}

- (BOOL)cellUsageAllowedForBundleID:(id)a3
{
  id v3 = a3;
  id v4 = (const void *)_CTServerConnectionCreateOnTargetQueue();
  if (v4)
  {
    _CTServerConnectionCopyCellularUsagePolicy();
    CFRelease(v4);
    LOBYTE(v4) = 0;
  }

  return (char)v4;
}

- (id)moveFileToClientInbox:(id)a3 applicationInfo:(id)a4 pairingID:(id)a5 fileIdentifier:(id)a6 userInfoData:(id)a7 error:(id *)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  NSErrorUserInfoKey v18 = wc_log();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    long long v19 = [v13 path];
    CFStringRef v20 = "YES";
    *(_DWORD *)buf = 138544130;
    id v74 = v19;
    if (!v17) {
      CFStringRef v20 = "NO";
    }
    __int16 v75 = 2114;
    id v76 = v14;
    __int16 v77 = 2114;
    id v78 = v16;
    __int16 v79 = 2080;
    v80 = v20;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "incomingFileURL: %{public}@, application: %{public}@, fileIdentifier: %{public}@, hasUserInfoData: %s", buf, 0x2Au);
  }
  uint64_t v21 = +[WCDSystemMonitor sharedSystemMonitor];
  __int16 v22 = [v21 dataContainerURLForApplicationInfo:v14];

  v66 = v17;
  if (v15 && v22)
  {
    __int16 v23 = WCTransferredFilesURLInContainer();
    NSErrorUserInfoKey v24 = [v23 URLByAppendingPathComponent:v16 isDirectory:1];

    id v25 = [v13 lastPathComponent];
    NSErrorUserInfoKey v26 = [v24 URLByAppendingPathComponent:v25 isDirectory:0];

    id v27 = WCSessionFilesURLInContainer();
    [v27 URLByAppendingPathComponent:v16 isDirectory:1];
    v65 = id v64 = v26;
    v63 = v27;
    if ([v26 checkResourceIsReachableAndReturnError:0])
    {
      NSErrorUserInfoKey v28 = wc_log();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
        sub_10002BF44();
      }

      id v29 = 0;
      id v30 = 0;
    }
    else
    {
      id v31 = +[NSFileManager defaultManager];
      id v72 = 0;
      unsigned int v32 = [v31 createDirectoryAtURL:v24 withIntermediateDirectories:1 attributes:0 error:&v72];
      id v30 = v72;

      if (v32)
      {
        id v62 = v13;
        BOOL v33 = +[NSFileManager defaultManager];
        id v71 = v30;
        unsigned int v34 = [v33 createDirectoryAtURL:v65 withIntermediateDirectories:1 attributes:0 error:&v71];
        id v35 = v71;

        if (!v34)
        {
          id v43 = wc_log();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_FAULT)) {
            sub_10002C154();
          }

          WCDeleteItemAtURL();
          id v29 = 0;
          id v30 = v35;
          id v13 = v62;
          goto LABEL_44;
        }
        unsigned __int8 v36 = +[NSFileManager defaultManager];
        id v70 = v35;
        unsigned int v37 = [v36 moveItemAtURL:v62 toURL:v64 error:&v70];
        id v30 = v70;

        if (!v37)
        {
          v44 = wc_log();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_FAULT)) {
            sub_10002C0C8();
          }

          WCDeleteItemAtURL();
          id v29 = 0;
          id v13 = v62;
          goto LABEL_44;
        }
        id v38 = objc_alloc((Class)WCSessionFile);
        __int16 v39 = [v64 relativePath];
        id v29 = [v38 initWithIdentifier:v16 relativePath:v39];

        if (v66)
        {
          id v69 = v30;
          [v29 updateUserInfoData:v66 error:&v69];
          id v40 = v69;

          id v30 = v40;
        }
        id v13 = v62;
        if (!v30)
        {
          id v45 = +[WCDIndexManager sharedManager];
          v46 = [v45 fileIndexForApplication:v14 pairingID:v15];

          id v47 = [v29 fileIdentifier];
          id v30 = [v46 addContentIdentifier:v47];

          if (v30)
          {
            CFStringRef v60 = v46;
            v48 = wc_log();
            id v13 = v62;
            if (os_log_type_enabled(v48, OS_LOG_TYPE_FAULT)) {
              sub_10002BFB0();
            }

            WCDeleteItemAtURL();
            id v49 = v29;
            id v29 = 0;
            v46 = v60;
          }
          else
          {
            uint64_t v50 = [v65 URLByAppendingPathComponent:WCSessionFilePersistentFileName isDirectory:0];
            id v68 = 0;
            id v30 = +[NSKeyedArchiver archivedDataWithRootObject:v29 requiringSecureCoding:1 error:&v68];
            id v58 = v68;
            id v59 = (void *)v50;
            v57 = v30;
            if (!v30
              || (id v67 = 0,
                  unsigned __int8 v51 = [v30 writeToURL:v50 options:1073741825 error:&v67],
                  id v30 = v67,
                  (v51 & 1) == 0))
            {
              v61 = v46;
              __int16 v52 = wc_log();
              if (os_log_type_enabled(v52, OS_LOG_TYPE_FAULT))
              {
                id v55 = [v59 path];
                id v56 = NSPrintF();
                *(_DWORD *)buf = 138543874;
                id v74 = v29;
                __int16 v75 = 2114;
                id v76 = v55;
                __int16 v77 = 2114;
                id v78 = v56;
                _os_log_fault_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_FAULT, "error archiving session file to path %{public}@ %{public}@ due to %{public}@", buf, 0x20u);
              }
              WCDeleteItemAtURL();
              WCDeleteItemAtURL();
              NSErrorUserInfoKey v53 = [v29 fileIdentifier];
              v46 = v61;
              [v61 removeContentIdentifier:v53];

              id v29 = 0;
            }

            id v13 = v62;
            id v49 = v59;
          }

          goto LABEL_44;
        }
        __int16 v41 = wc_log();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_FAULT)) {
          sub_10002C03C();
        }

        WCDeleteItemAtURL();
      }
      else
      {
        CFStringRef v42 = wc_log();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_FAULT)) {
          sub_10002C1E0();
        }
      }
      id v29 = 0;
    }
LABEL_44:

    goto LABEL_45;
  }
  NSErrorUserInfoKey v24 = wc_log();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
    sub_10002C26C();
  }
  id v29 = 0;
  id v30 = 0;
LABEL_45:

  if (a8) {
    *a8 = v30;
  }

  return v29;
}

- (id)moveUserInfoToClientInbox:(id)a3 applicationInfo:(id)a4 pairingID:(id)a5 userInfoIdentifier:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = wc_log();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    id v15 = [v10 path];
    *(_DWORD *)buf = 138544130;
    uint64_t v50 = v15;
    __int16 v51 = 2114;
    id v52 = v11;
    __int16 v53 = 2114;
    id v54 = v12;
    __int16 v55 = 2114;
    id v56 = v13;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "incomingUserInfoURL: %{public}@, application: %{public}@, pairingID: %{public}@, userInfoIdentifier: %{public}@", buf, 0x2Au);
  }
  id v16 = +[WCDSystemMonitor sharedSystemMonitor];
  id v17 = [v16 dataContainerURLForApplicationInfo:v11];

  if (v12 && v17)
  {
    NSErrorUserInfoKey v18 = WCTransferredUserInfoInboxURLInContainer();
    long long v19 = +[WCDIndexManager sharedManager];
    id v45 = [v19 userInfoIndexForApplication:v11 pairingID:v12];

    CFStringRef v20 = [v18 URLByAppendingPathComponent:v13 isDirectory:1];

    uint64_t v21 = [v20 URLByAppendingPathComponent:WCUserInfoTransferObjectFileName isDirectory:0];
    __int16 v22 = [(WatchConnectivityDaemon *)self complicationUserInfoPathInDataContainer:v17 pairingID:v12];
    if (v22)
    {
      __int16 v23 = [v21 path];
      unsigned __int8 v24 = [v23 isEqual:v22];

      if (v24)
      {
        id v25 = wc_log();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "user info is duplicate of complication user info", buf, 2u);
        }

        id v26 = 0;
        id v27 = v21;
        uint64_t v21 = 0;
        goto LABEL_28;
      }
    }
    if ([v21 checkResourceIsReachableAndReturnError:0])
    {
      id v27 = wc_log();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        sub_10002BF44();
      }
      id v26 = 0;
      goto LABEL_28;
    }
    id v44 = v10;
    NSErrorUserInfoKey v28 = +[NSFileManager defaultManager];
    id v48 = 0;
    unsigned int v29 = [v28 createDirectoryAtURL:v20 withIntermediateDirectories:1 attributes:0 error:&v48];
    id v26 = v48;

    if (!v29)
    {
      id v31 = wc_log();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
        sub_10002C410();
      }

      id v27 = v21;
      uint64_t v21 = 0;
      id v10 = v44;
      goto LABEL_28;
    }
    id v10 = v44;
    id v27 = [objc_alloc((Class)WCSessionUserInfoTransfer) initWithProtoBufFileURL:v44];
    if (v27)
    {
      uint64_t v39 = [v45 addContentIdentifier:v13];

      id v26 = (id)v39;
      if (!v39)
      {
        id v47 = 0;
        BOOL v33 = +[NSKeyedArchiver archivedDataWithRootObject:v27 requiringSecureCoding:1 error:&v47];
        unsigned int v34 = v47;
        id v30 = v33;
        id v43 = v34;
        if (v33)
        {
          id v46 = 0;
          id v35 = v33;
          unsigned __int8 v36 = [v33 writeToURL:v21 options:1073741825 error:&v46];
          id v37 = v46;
          id v30 = v35;
          uint64_t v40 = (uint64_t)v37;
          if (v36)
          {
            id v10 = v44;
            id v26 = v37;
            goto LABEL_27;
          }
        }
        else
        {
          uint64_t v40 = 0;
        }
        CFStringRef v42 = v30;
        id v38 = wc_log();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
          sub_10002C344((uint64_t)v43, v40);
        }

        [v45 removeContentIdentifier:v13];
        uint64_t v21 = 0;
        id v10 = v44;
        id v26 = (id)v40;
        id v30 = v42;
        goto LABEL_27;
      }
      __int16 v41 = wc_log();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      {
        sub_10002C3DC();
        id v30 = v41;
        id v43 = v21;
LABEL_40:
        uint64_t v21 = 0;
        goto LABEL_27;
      }
    }
    else
    {
      __int16 v41 = wc_log();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      {
        sub_10002C310();
        id v43 = v21;
        id v30 = v41;
        goto LABEL_40;
      }
    }
    id v43 = v21;
    uint64_t v21 = 0;
    id v30 = v41;
LABEL_27:

LABEL_28:
    goto LABEL_29;
  }
  CFStringRef v20 = wc_log();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
    sub_10002B568();
  }
  uint64_t v21 = 0;
  id v26 = 0;
LABEL_29:

  return v21;
}

- (void)storeComplicationUserInfoTransfer:(id)a3 applicationInfo:(id)a4 pairingID:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = wc_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    id v49 = v7;
    __int16 v50 = 2114;
    uint64_t v51 = (uint64_t)v8;
    __int16 v52 = 2114;
    id v53 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "userInfoTransfer: %{public}@, application: %{public}@, pairingID: %{public}@", buf, 0x20u);
  }

  id v11 = +[WCDSystemMonitor sharedSystemMonitor];
  id v12 = [v11 dataContainerURLForApplicationInfo:v8];

  if (!MGGetBoolAnswer()
    || ([v7 transferIdentifier], id v13 = objc_claimAutoreleasedReturnValue(),
                                                v13,
                                                v13))
  {
    id v14 = wc_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      sub_10002C6A0();
    }
    goto LABEL_7;
  }
  WCDashboardLogJSON();
  +[WCDRadarUserNotification showTapToRadarAlertWithMessage:@"You have hit <rdar://problem/33601638>. Please file a new WatchConnectivity bug with a co-sysdiagnose and relate the radar." forRadarIdentifier:@"33601638" oncePerBuild:1];
  if (v9 && v12)
  {
    id v15 = WCTransferredUserInfoInboxURLInContainer();
    id v43 = [v15 URLByAppendingPathComponent:WCComplicationUserInfoIDFileName isDirectory:0];
    id v16 = +[WCDIndexManager sharedManager];
    id v17 = [v16 userInfoIndexForApplication:v8 pairingID:v9];

    NSErrorUserInfoKey v18 = [v7 transferIdentifier];
    long long v19 = [v15 URLByAppendingPathComponent:v18 isDirectory:1];

    CFStringRef v20 = [v19 URLByAppendingPathComponent:WCUserInfoTransferObjectFileName isDirectory:0];
    uint64_t v21 = +[NSFileManager defaultManager];
    id v47 = 0;
    unsigned int v22 = [v21 createDirectoryAtURL:v19 withIntermediateDirectories:1 attributes:0 error:&v47];
    __int16 v23 = v47;

    if (!v22)
    {
      id v25 = wc_log();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        sub_10002C5F4();
      }
      id v14 = v23;
      goto LABEL_32;
    }
    unsigned __int8 v24 = [v7 transferIdentifier];
    id v14 = [v17 addContentIdentifier:v24];

    if (v14)
    {
      id v25 = wc_log();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        sub_10002C548();
      }
      goto LABEL_32;
    }
    id v46 = 0;
    id v26 = +[NSKeyedArchiver archivedDataWithRootObject:v7 requiringSecureCoding:1 error:&v46];
    id v25 = v46;
    CFStringRef v42 = v26;
    if (v26)
    {
      id v45 = 0;
      unsigned int v27 = [v26 writeToURL:v20 options:1073741825 error:&v45];
      NSErrorUserInfoKey v28 = v45;
      if (v27)
      {
        os_log_t loga = v28;
        WCDeleteItemAtURL();
        unsigned int v29 = [v7 transferIdentifier];
        uint64_t v30 = [v29 dataUsingEncoding:4];

        os_log_t v44 = loga;
        id v38 = v30;
        LOBYTE(v30) = [(id)v30 writeToURL:v43 options:1073741825 error:&v44];
        id v14 = v44;

        id v31 = wc_log();
        log = v31;
        if (v30)
        {
          unsigned int v32 = v38;
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            unsigned __int8 v36 = [v7 transferIdentifier];
            uint64_t v33 = [v7 complicationTransferIdentifier];
            *(_DWORD *)buf = 138543618;
            id v49 = v36;
            __int16 v50 = 2114;
            uint64_t v51 = v33;
            unsigned int v34 = (void *)v33;
            _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "persisted complication user info transfer id %{public}@ with complication/send ID %{public}@", buf, 0x16u);

            unsigned int v32 = v38;
          }
        }
        else
        {
          unsigned int v32 = v38;
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
            sub_10002C49C();
          }
        }

LABEL_31:
LABEL_32:

        goto LABEL_7;
      }
      id v14 = v28;
    }
    else
    {
      id v14 = 0;
    }
    id v35 = [v7 transferIdentifier];
    [v17 removeContentIdentifier:v35];

    unsigned int v32 = wc_log();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      id v37 = [v20 path];
      NSPrintF();
      os_log_t logb = (os_log_t)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      id v49 = v37;
      __int16 v50 = 2114;
      uint64_t v51 = (uint64_t)logb;
      _os_log_error_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "error moving user info file to inbox %{public}@ due to %{public}@", buf, 0x16u);
    }
    goto LABEL_31;
  }
  id v14 = wc_log();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
    sub_10002B568();
  }
LABEL_7:
}

- (void)persistAppContext:(id)a3 applicationInfo:(id)a4 pairingID:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = wc_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    id v24 = [v7 length];
    __int16 v25 = 2114;
    id v26 = v8;
    __int16 v27 = 2114;
    id v28 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "appContextDataSize: %ld, application: %{public}@, pairingID: %{public}@", buf, 0x20u);
  }

  id v11 = +[WCDSystemMonitor sharedSystemMonitor];
  id v12 = [v11 dataContainerURLForApplicationInfo:v8];

  if (v9 && v12)
  {
    id v13 = WCInboxAppContextFolderURLInContainer();
    id v14 = [v13 URLByAppendingPathComponent:WCApplicationContextFileName isDirectory:0];
    id v15 = +[NSFileManager defaultManager];
    id v22 = 0;
    unsigned int v16 = [v15 createDirectoryAtURL:v13 withIntermediateDirectories:1 attributes:0 error:&v22];
    id v17 = v22;

    if (v16)
    {
      uint64_t v21 = v17;
      unsigned __int8 v18 = [v7 writeToURL:v14 options:1073741825 error:&v21];
      long long v19 = v21;

      if (v18)
      {
LABEL_15:

        goto LABEL_16;
      }
      CFStringRef v20 = wc_log();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
        sub_10002C6D4();
      }
    }
    else
    {
      CFStringRef v20 = wc_log();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
        sub_10002C760();
      }
      long long v19 = v17;
    }

    goto LABEL_15;
  }
  long long v19 = wc_log();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
    sub_10002B568();
  }
LABEL_16:
}

- (void)performBlockWhenReady:(id)a3
{
  id v9 = (void (**)(void))a3;
  id v4 = +[WCDSystemMonitor sharedSystemMonitor];
  unsigned int v5 = [v4 initialSetUpComplete];

  if (v5)
  {
    v9[2]();
  }
  else
  {
    readyBlocks = self->_readyBlocks;
    id v7 = [v9 copy];

    id v8 = objc_retainBlock(v7);
    [(NSMutableArray *)readyBlocks addObject:v8];

    id v9 = (void (**)(void))v7;
  }
}

- (void)service:(id)a3 context:(id)a4 performBlockWhenReady:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10001B714;
  v13[3] = &unk_100045120;
  id v15 = v8;
  id v16 = a5;
  id v14 = v9;
  id v10 = v8;
  id v11 = v9;
  id v12 = v16;
  [(WatchConnectivityDaemon *)self performBlockWhenReady:v13];
}

- (void)flushReadyBlocks
{
  id v3 = [(NSMutableArray *)self->_readyBlocks copy];
  [(NSMutableArray *)self->_readyBlocks removeAllObjects];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v4 = v3;
  id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v9 + 1) + 8 * (void)v8) + 16))(*(void *)(*((void *)&v9 + 1) + 8 * (void)v8));
        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)setCLTransientAuthorization:(id)a3 withCoreLocationData:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v6 && v7)
  {
    long long v9 = [(WatchConnectivityDaemon *)self locationManager];
    id v10 = [v9 _setClientTransientAuthorizationInfoForBundleId:v6 data:v8];

    if (!v10)
    {
LABEL_7:

      goto LABEL_10;
    }
    long long v11 = wc_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10002C7EC();
    }
LABEL_6:

    goto LABEL_7;
  }
  if (v6)
  {
    long long v12 = [(NSMutableDictionary *)self->_coreLocationAssertions objectForKeyedSubscript:v6];

    if (!v12)
    {
      id v10 = +[CLInUseAssertion newAssertionForBundleIdentifier:v6 withReason:@"Location in use on paired watch by 3rd party app"];
      if (v10)
      {
        uint64_t v13 = [(WatchConnectivityDaemon *)self createCLInUseTimerForIdentifier:v6];
        long long v11 = v13;
        if (v13)
        {
          v19[0] = @"inuse-assertion";
          v19[1] = @"inuse-assertion-timer";
          v20[0] = v10;
          v20[1] = v13;
          id v14 = +[NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:2];
          [(NSMutableDictionary *)self->_coreLocationAssertions setObject:v14 forKeyedSubscript:v6];

          dispatch_resume(v11);
          id v15 = wc_log();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            int v17 = 138543362;
            id v18 = v6;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%{public}@", (uint8_t *)&v17, 0xCu);
          }
        }
        else
        {
          id v16 = wc_log();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
            sub_10002C88C();
          }

          [v10 invalidate];
        }
      }
      else
      {
        long long v11 = wc_log();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
          sub_10002C858();
        }
      }
      goto LABEL_6;
    }
  }
LABEL_10:
}

- (void)releaseCLInUseAssertionForIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(NSMutableDictionary *)self->_coreLocationAssertions objectForKeyedSubscript:v4];
  id v6 = v5;
  if (v5)
  {
    id v7 = [v5 objectForKeyedSubscript:@"inuse-assertion"];
    if (v7)
    {
      id v8 = v7;
      [v7 invalidate];

      long long v9 = wc_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 138543362;
        id v13 = v4;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}@", (uint8_t *)&v12, 0xCu);
      }
    }
    id v10 = [v6 objectForKeyedSubscript:@"inuse-assertion-timer"];
    if (v10)
    {
      long long v11 = v10;
      dispatch_source_cancel(v10);
    }
    [(NSMutableDictionary *)self->_coreLocationAssertions removeObjectForKey:v4];
  }
}

- (id)createCLInUseTimerForIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)&_dispatch_main_q);
  dispatch_time_t v6 = dispatch_time(0, 40000000000);
  dispatch_source_set_timer(v5, v6, 0xFFFFFFFFFFFFFFFFLL, 0);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10001BCDC;
  v9[3] = &unk_100044B08;
  v9[4] = self;
  id v10 = v4;
  id v7 = v4;
  dispatch_source_set_event_handler(v5, v9);

  return v5;
}

- (CLManagerInterface)locationManager
{
  return self->_locationManager;
}

- (void)setLocationManager:(id)a3
{
}

- (NSString)idsServiceIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 112, 1);
}

- (NSString)idsInsecureServiceIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 120, 1);
}

- (IDSService)idsService
{
  return (IDSService *)objc_getProperty(self, a2, 128, 1);
}

- (IDSService)insecureIDSService
{
  return (IDSService *)objc_getProperty(self, a2, 136, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_insecureIDSService, 0);
  objc_storeStrong((id *)&self->_idsService, 0);
  objc_storeStrong((id *)&self->_idsInsecureServiceIdentifier, 0);
  objc_storeStrong((id *)&self->_idsServiceIdentifier, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_counterpartClientCommunicationIdentifiers, 0);
  objc_storeStrong((id *)&self->_companionAppAssertions, 0);
  objc_storeStrong((id *)&self->_coreLocationAssertions, 0);
  objc_storeStrong((id *)&self->_readyBlocks, 0);
  objc_storeStrong((id *)&self->_pendingMessageRequests, 0);
  objc_storeStrong((id *)&self->_sendIdentifierToHandler, 0);
  objc_storeStrong((id *)&self->_communicationIdentifierToClient, 0);
  objc_storeStrong((id *)&self->_xpcListener, 0);
  objc_storeStrong((id *)&self->_pairedSyncManager, 0);
  objc_storeStrong((id *)&self->_firstUnlockManager, 0);
  objc_storeStrong((id *)&self->_privateClient, 0);

  objc_storeStrong((id *)&self->_xpcPrivateListener, 0);
}

@end