@interface WCDClient
+ (id)clientsStorageURL;
- (BOOL)allowMessageSending;
- (BOOL)background;
- (BOOL)clientSupportsActiveDeviceSwitch;
- (BOOL)complicationEnabled;
- (BOOL)counterpartCanEstablishXPCConnection;
- (BOOL)counterpartCanEstablishXPCConnectionCalled;
- (BOOL)foregroundOrPrivileged;
- (BOOL)hasIncreasedPriorityTraffic;
- (BOOL)iOSDeviceNeedsFirstUnlock;
- (BOOL)isAlwaysReachable;
- (BOOL)isEqual:(id)a3;
- (BOOL)isInUse;
- (BOOL)pendingContentDequeued;
- (BOOL)previousReachable;
- (BOOL)privileged;
- (BOOL)privilegedCalled;
- (BOOL)reachable;
- (BOOL)watchAppInstalled;
- (NSMutableArray)outstandingMessagesToSend;
- (NSMutableDictionary)outstandingFileTransfers;
- (NSString)bundleID;
- (NSString)clientCurrentPairingID;
- (NSString)communicationID;
- (NSString)description;
- (NSString)state;
- (NSXPCConnection)connection;
- (OS_os_transaction)transaction;
- (WCDApplicationInfo)applicationInfo;
- (WCDClient)initWithCommunicationID:(id)a3 connection:(id)a4;
- (WCDClientDelegate)delegate;
- (id)clientStorageFileURL;
- (id)newSessionState;
- (id)remoteObjectProxy;
- (int64_t)outstandingMessagesToSendCount;
- (unint64_t)hash;
- (unint64_t)remainingComplicationUserInfoTransfersWithComplicationEnabled:(BOOL)a3;
- (void)acknowledgeFileIndexWithIdentifier:(id)a3 clientPairingID:(id)a4;
- (void)acknowledgeFileResultIndexWithIdentifier:(id)a3 clientPairingID:(id)a4;
- (void)acknowledgeUserInfoIndexWithIdentifier:(id)a3 clientPairingID:(id)a4;
- (void)acknowledgeUserInfoResultIndexWithIdentifier:(id)a3 clientPairingID:(id)a4;
- (void)addOutstandingMessage:(id)a3;
- (void)cancelAllOutstandingMessages;
- (void)cancelSendWithIdentifier:(id)a3;
- (void)clearPersistedClientState;
- (void)connection:(id)a3 handleInvocation:(id)a4 isReply:(BOOL)a5;
- (void)copyProgressUpdatesForFileTransfer:(id)a3 fromClonedFileURL:(id)a4;
- (void)dealloc;
- (void)dequeuePendingContent;
- (void)handleActiveDeviceSwitchStarted;
- (void)handleApplicationContextWithPairingID:(id)a3;
- (void)handleFileResultWithPairingID:(id)a3;
- (void)handleIncomingFileWithPairingID:(id)a3;
- (void)handleIncomingUserInfoWithPairingID:(id)a3;
- (void)handleRequest:(id)a3;
- (void)handleResponse:(id)a3;
- (void)handleSentMessageWithIdentifier:(id)a3 error:(id)a4;
- (void)handleUserInfoResultWithPairingID:(id)a3;
- (void)handleXPCInvalidation;
- (void)loadPersistedClientState;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)persistClientState;
- (void)registerForUpdatesForProgress:(id)a3;
- (void)removeOutstandingMessage:(id)a3;
- (void)removeProgressForFileTransfer:(id)a3;
- (void)sendMessage:(id)a3 clientPairingID:(id)a4 acceptanceHandler:(id)a5;
- (void)sessionReadyForInitialStateForClientPairingID:(id)a3 supportsActiveDeviceSwitch:(BOOL)a4 withErrorHandler:(id)a5;
- (void)setAllowMessageSending:(BOOL)a3;
- (void)setClientCurrentPairingID:(id)a3;
- (void)setClientSupportsActiveDeviceSwitch:(BOOL)a3;
- (void)setCommunicationID:(id)a3;
- (void)setConnection:(id)a3;
- (void)setCounterpartCanEstablishXPCConnection:(BOOL)a3;
- (void)setCounterpartCanEstablishXPCConnectionCalled:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setIsInUse:(BOOL)a3;
- (void)setOutstandingFileTransfers:(id)a3;
- (void)setOutstandingMessagesToSend:(id)a3;
- (void)setPendingContentDequeued:(BOOL)a3;
- (void)setPreviousReachable:(BOOL)a3;
- (void)setPrivileged:(BOOL)a3;
- (void)setPrivilegedCalled:(BOOL)a3;
- (void)setTransaction:(id)a3;
- (void)setupBundleIDMonitoring;
- (void)systemObserverActiveDeviceConnectedChanged;
- (void)systemObserverActiveDeviceSwitchStarted;
- (void)systemObserverAppDidSuspendForBundleID:(id)a3;
- (void)systemObserverInitialSetUpComplete;
- (void)systemObserverProcessStateChangedForBundleID:(id)a3;
- (void)systemObserverRemainingComplicationUserInfoTransfersReset;
- (void)systemObserverRunningIndependentlyWatchApps;
- (void)terminateApplicationDueToSwitchIfEligible;
- (void)transferFile:(id)a3 sandboxToken:(id)a4 clientPairingID:(id)a5 errorHandler:(id)a6;
- (void)transferUserInfo:(id)a3 withURL:(id)a4 clientPairingID:(id)a5 errorHandler:(id)a6;
- (void)updateApplicationContext:(id)a3 clientPairingID:(id)a4 errorHandler:(id)a5;
- (void)updateClientWithSessionState;
- (void)updateMessagesClientIfNeeded;
@end

@implementation WCDClient

- (WCDClient)initWithCommunicationID:(id)a3 connection:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)WCDClient;
  v9 = [(WCDClient *)&v17 init];
  if (v9)
  {
    v9->_increasedPriorityTraffic = [v8 wc_connectionHasEntitlement:WCServiceIncreasedPriorityTrafficEntitlement];
    v9->_alwaysReachable = [v8 wc_connectionHasEntitlement:WCServiceAlwaysReachableEntitlement];
    uint64_t v10 = objc_opt_new();
    outstandingMessagesToSend = v9->_outstandingMessagesToSend;
    v9->_outstandingMessagesToSend = (NSMutableArray *)v10;

    objc_storeStrong((id *)&v9->_communicationID, a3);
    v12 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    outstandingFileTransfers = v9->_outstandingFileTransfers;
    v9->_outstandingFileTransfers = v12;

    objc_storeStrong((id *)&v9->_bundleID, a3);
    [(WCDClient *)v9 setConnection:v8];
    v14 = +[WCDSystemMonitor sharedSystemMonitor];
    [v14 addObserver:v9];

    [(WCDClient *)v9 setupBundleIDMonitoring];
    [(WCDClient *)v9 loadPersistedClientState];
    v15 = wc_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v19 = v9;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Created new client object %{public}@", buf, 0xCu);
    }
  }
  return v9;
}

- (void)dealloc
{
  [(WCDClient *)self clearPersistedClientState];
  v3 = +[WCDSystemMonitor sharedSystemMonitor];
  v4 = [(WCDClient *)self bundleID];
  [v3 stopMonitoringBundleID:v4];

  v5 = +[WCDSystemMonitor sharedSystemMonitor];
  [v5 removeObserver:self];

  v6 = +[NSNotificationCenter defaultCenter];
  [v6 removeObserver:self];

  v7.receiver = self;
  v7.super_class = (Class)WCDClient;
  [(WCDClient *)&v7 dealloc];
}

- (WCDApplicationInfo)applicationInfo
{
  v3 = +[WCDSystemMonitor sharedSystemMonitor];
  v4 = [v3 applicationWorkspace];

  v5 = [(WCDClient *)self communicationID];
  v6 = [v4 applicationInfoForBundleIdentifier:v5 type:1 allowPlaceholder:1];

  return (WCDApplicationInfo *)v6;
}

- (NSString)state
{
  v3 = (objc_class *)objc_opt_class();
  v16 = NSStringFromClass(v3);
  NSAppendPrintF();
  id v4 = 0;

  objc_super v17 = [(WCDClient *)self communicationID];
  NSAppendPrintF();
  id v5 = v4;

  v18 = [(WCDClient *)self bundleID];
  NSAppendPrintF();
  id v6 = v5;

  v19 = [(WCDClient *)self clientCurrentPairingID];
  NSAppendPrintF();
  id v7 = v6;

  if ([(WCDClient *)self clientSupportsActiveDeviceSwitch]) {
    id v8 = "YES";
  }
  else {
    id v8 = "NO";
  }
  v20 = v8;
  NSAppendPrintF();
  id v9 = v7;

  if ([(WCDClient *)self watchAppInstalled]) {
    uint64_t v10 = "YES";
  }
  else {
    uint64_t v10 = "NO";
  }
  v21 = v10;
  NSAppendPrintF();
  id v11 = v9;

  if ([(WCDClient *)self complicationEnabled]) {
    v12 = "YES";
  }
  else {
    v12 = "NO";
  }
  v22 = v12;
  NSAppendPrintF();
  id v13 = v11;

  [(WCDClient *)self outstandingMessagesToSendCount];
  NSAppendPrintF();
  id v14 = v13;

  return (NSString *)v14;
}

- (void)setupBundleIDMonitoring
{
  id v4 = +[WCDSystemMonitor sharedSystemMonitor];
  v3 = [(WCDClient *)self bundleID];
  [v4 startMonitoringBundleID:v3];
}

+ (id)clientsStorageURL
{
  if (qword_1000516A8 != -1) {
    dispatch_once(&qword_1000516A8, &stru_100044B70);
  }
  v2 = (void *)qword_1000516A0;

  return v2;
}

- (id)clientStorageFileURL
{
  v2 = [(WCDClient *)self communicationID];
  v3 = +[NSString stringWithFormat:@"%@.plist", v2];
  id v4 = [(id)objc_opt_class() clientsStorageURL];
  id v5 = +[NSURL fileURLWithPath:v3 isDirectory:0 relativeToURL:v4];

  return v5;
}

- (void)loadPersistedClientState
{
  v3 = [(WCDClient *)self clientStorageFileURL];
  id v17 = 0;
  id v4 = +[NSData dataWithContentsOfURL:v3 options:0 error:&v17];
  id v5 = v17;

  if (v4)
  {
    id v16 = 0;
    id v6 = +[NSPropertyListSerialization propertyListWithData:v4 options:0 format:0 error:&v16];
    id v7 = v16;

    if (v6)
    {
      id v8 = [v6 objectForKeyedSubscript:@"pairingID"];
      [(WCDClient *)self setClientCurrentPairingID:v8];

      id v9 = [v6 objectForKeyedSubscript:@"supportsActiveDeviceSwitch"];
      -[WCDClient setClientSupportsActiveDeviceSwitch:](self, "setClientSupportsActiveDeviceSwitch:", [v9 BOOLValue]);

      uint64_t v10 = wc_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        id v11 = [(WCDClient *)self loggingIdentifier];
        v12 = [(WCDClient *)self clientCurrentPairingID];
        unsigned int v13 = [(WCDClient *)self clientSupportsActiveDeviceSwitch];
        id v14 = "NO";
        *(_DWORD *)buf = 138543874;
        v19 = v11;
        if (v13) {
          id v14 = "YES";
        }
        __int16 v20 = 2114;
        v21 = v12;
        __int16 v22 = 2080;
        v23 = v14;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: clientCurrentPairingID: %{public}@, clientSupportsActiveDeviceSwitch: %s", buf, 0x20u);
      }
    }

    id v5 = v7;
  }
  if (v5
    && [v5 code] != (id)-1100
    && [v5 code] != (id)260
    && [v5 code] != (id)4)
  {
    v15 = wc_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_10002A884();
    }
  }
}

- (void)persistClientState
{
  uint64_t v3 = [(WCDClient *)self clientCurrentPairingID];
  if (v3)
  {
    id v4 = (void *)v3;
    unsigned __int8 v5 = [(WCDClient *)self clientSupportsActiveDeviceSwitch];

    if ((v5 & 1) == 0)
    {
      id v6 = wc_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        id v7 = [(WCDClient *)self loggingIdentifier];
        id v8 = [(WCDClient *)self clientCurrentPairingID];
        unsigned int v9 = [(WCDClient *)self clientSupportsActiveDeviceSwitch];
        uint64_t v10 = "NO";
        *(_DWORD *)buf = 138543874;
        v24 = v7;
        if (v9) {
          uint64_t v10 = "YES";
        }
        __int16 v25 = 2114;
        v26 = v8;
        __int16 v27 = 2080;
        v28 = v10;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: clientCurrentPairingID: %{public}@, clientSupportsActiveDeviceSwitch: %s", buf, 0x20u);
      }
      v21[0] = @"pairingID";
      id v11 = [(WCDClient *)self clientCurrentPairingID];
      v21[1] = @"supportsActiveDeviceSwitch";
      v22[0] = v11;
      v12 = +[NSNumber numberWithBool:[(WCDClient *)self clientSupportsActiveDeviceSwitch]];
      v22[1] = v12;
      unsigned int v13 = +[NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:2];

      id v20 = 0;
      id v14 = +[NSPropertyListSerialization dataWithPropertyList:v13 format:200 options:0 error:&v20];
      id v15 = v20;
      if (v14)
      {
        id v16 = [(WCDClient *)self clientStorageFileURL];
        id v19 = v15;
        [v14 writeToURL:v16 options:1073741825 error:&v19];
        id v17 = v19;

        id v15 = v17;
      }
      if (v15
        && [v15 code] != (id)-1100
        && [v15 code] != (id)260
        && [v15 code] != (id)4)
      {
        v18 = wc_log();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
          sub_10002A884();
        }
      }
    }
  }
}

- (void)clearPersistedClientState
{
  uint64_t v3 = wc_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(WCDClient *)self loggingIdentifier];
    *(_DWORD *)buf = 138543362;
    id v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
  }
  unsigned __int8 v5 = +[NSFileManager defaultManager];
  id v6 = [(WCDClient *)self clientStorageFileURL];
  id v9 = 0;
  [v5 removeItemAtURL:v6 error:&v9];
  id v7 = v9;

  if (v7
    && [v7 code] != (id)-1100
    && [v7 code] != (id)260
    && [v7 code] != (id)4)
  {
    id v8 = wc_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10002A884();
    }
  }
}

- (void)setConnection:(id)a3
{
  id v5 = a3;
  p_connection = &self->_connection;
  if (([(NSXPCConnection *)self->_connection isEqual:v5] & 1) == 0)
  {
    [(NSXPCConnection *)self->_connection invalidate];
    self->_allowMessageSending = 1;
    objc_storeStrong((id *)&self->_connection, a3);
    [(NSXPCConnection *)self->_connection setDelegate:self];
    id v7 = +[WCXPCManager daemonInterface];
    [(NSXPCConnection *)self->_connection setExportedInterface:v7];

    [(NSXPCConnection *)self->_connection setExportedObject:self];
    id v8 = +[WCXPCManager clientInterface];
    [(NSXPCConnection *)self->_connection setRemoteObjectInterface:v8];

    objc_initWeak(&location, self);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1000061AC;
    v15[3] = &unk_100044B98;
    objc_copyWeak(&v16, &location);
    [(NSXPCConnection *)self->_connection setInterruptionHandler:v15];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10000629C;
    v13[3] = &unk_100044B98;
    objc_copyWeak(&v14, &location);
    [(NSXPCConnection *)*p_connection setInvalidationHandler:v13];
    [(NSXPCConnection *)*p_connection resume];
    transaction = self->_transaction;
    if (v5)
    {
      if (!transaction)
      {
        transaction = [(WCDClient *)self communicationID];
        id v10 = [@"com.apple.wcd.client-" stringByAppendingString:transaction];
        [v10 UTF8String];
        id v11 = (OS_os_transaction *)os_transaction_create();
        v12 = self->_transaction;
        self->_transaction = v11;

LABEL_7:
      }
    }
    else if (transaction)
    {
      self->_transaction = 0;
      goto LABEL_7;
    }
    objc_destroyWeak(&v14);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
}

- (void)handleXPCInvalidation
{
  connection = self->_connection;
  self->_connection = 0;

  transaction = self->_transaction;
  if (transaction)
  {
    self->_transaction = 0;
  }
  unsigned int v5 = [(WCDClient *)self reachable];
  id v6 = wc_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = [(WCDClient *)self loggingIdentifier];
    id v8 = (void *)v7;
    id v9 = "NO";
    if (v5) {
      id v9 = "YES";
    }
    int v11 = 138543618;
    uint64_t v12 = v7;
    __int16 v13 = 2080;
    id v14 = v9;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Reachable changed for connection lost (reachable: %s)", (uint8_t *)&v11, 0x16u);
  }
  id v10 = [(WCDClient *)self delegate];
  [v10 clientXPCConnectionDidDisconnect:self];
}

- (void)setClientCurrentPairingID:(id)a3
{
  p_clientCurrentPairingID = (id *)&self->_clientCurrentPairingID;
  id v6 = a3;
  if ((objc_msgSend(*p_clientCurrentPairingID, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_clientCurrentPairingID, a3);
    if (*p_clientCurrentPairingID) {
      [(WCDClient *)self persistClientState];
    }
    else {
      [(WCDClient *)self clearPersistedClientState];
    }
  }
}

- (void)setPrivileged:(BOOL)a3
{
  if (![(WCDClient *)self privilegedCalled])
  {
    [(WCDClient *)self setPrivilegedCalled:1];
    [(WCDClient *)self updateClientWithSessionState];
  }
}

- (BOOL)watchAppInstalled
{
  v2 = [(WCDClient *)self applicationInfo];
  unsigned __int8 v3 = [v2 isWatchAppInstalled];

  return v3;
}

- (BOOL)complicationEnabled
{
  unsigned __int8 v3 = +[WCDSystemMonitor sharedSystemMonitor];
  id v4 = [v3 iOSApplicationsContainingActiveComplications];

  unsigned int v5 = [(WCDClient *)self bundleID];
  unsigned __int8 v6 = [v4 containsObject:v5];

  LOBYTE(self) = [(WCDClient *)self watchAppInstalled] & v6;
  return (char)self;
}

- (unint64_t)remainingComplicationUserInfoTransfersWithComplicationEnabled:(BOOL)a3
{
  if (!a3) {
    return 0;
  }
  id v4 = [(objc_class *)off_1000510F0() sharedComplication];
  unsigned int v5 = [(WCDClient *)self bundleID];
  signed int v6 = [v4 remainingPushesOnComplicationForiOSApplicationWithBundleID:v5];

  return v6;
}

- (void)setCounterpartCanEstablishXPCConnection:(BOOL)a3
{
  if (self->_counterpartCanEstablishXPCConnection != a3)
  {
    self->_counterpartCanEstablishXPCConnection = a3;
    [(WCDClient *)self updateClientWithSessionState];
  }
  if (![(WCDClient *)self counterpartCanEstablishXPCConnectionCalled])
  {
    [(WCDClient *)self setCounterpartCanEstablishXPCConnectionCalled:1];
    [(WCDClient *)self updateClientWithSessionState];
  }
}

- (NSString)description
{
  unsigned __int8 v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  unsigned int v5 = [(WCDClient *)self loggingIdentifier];
  signed int v6 = [(WCDClient *)self communicationID];
  uint64_t v7 = [(WCDClient *)self connection];
  id v8 = "YES";
  if ([(WCDClient *)self hasIncreasedPriorityTraffic]) {
    id v9 = "YES";
  }
  else {
    id v9 = "NO";
  }
  if (![(WCDClient *)self isAlwaysReachable]) {
    id v8 = "NO";
  }
  id v10 = [(WCDClient *)self clientCurrentPairingID];
  unsigned int v11 = [(WCDClient *)self isInUse];
  CFStringRef v12 = &stru_100045808;
  if (v11) {
    CFStringRef v12 = @", isInUse: YES";
  }
  __int16 v13 = +[NSString stringWithFormat:@"<%@: %p, communicationID: %@, identifier: %@, connection: <%@>(%s,%s), clientCurrentPairingID: %@%@>", v4, self, v5, v6, v7, v9, v8, v10, v12];

  return (NSString *)v13;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (WCDClient *)a3;
  if (v4 == self)
  {
    unsigned __int8 v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unsigned int v5 = v4;
      signed int v6 = [(WCDClient *)self communicationID];
      uint64_t v7 = [(WCDClient *)v5 communicationID];
      if ([v6 isEqual:v7])
      {
        id v8 = [(WCDClient *)self connection];
        id v9 = [(WCDClient *)v5 connection];
        unsigned __int8 v10 = [v8 isEqual:v9];
      }
      else
      {
        unsigned __int8 v10 = 0;
      }
    }
    else
    {
      unsigned __int8 v10 = 0;
    }
  }

  return v10;
}

- (unint64_t)hash
{
  unsigned __int8 v3 = [(WCDClient *)self communicationID];
  unint64_t v4 = (unint64_t)[v3 hash];
  unsigned int v5 = [(WCDClient *)self connection];
  unint64_t v6 = (unint64_t)[v5 hash] ^ v4;

  return v6;
}

- (void)connection:(id)a3 handleInvocation:(id)a4 isReply:(BOOL)a5
{
  id v5 = a4;
  [v5 retainArguments];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100006B98;
  block[3] = &unk_100044A68;
  id v8 = v5;
  id v6 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)systemObserverInitialSetUpComplete
{
  unsigned __int8 v3 = wc_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v4 = [(WCDClient *)self loggingIdentifier];
    int v8 = 138543362;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@", (uint8_t *)&v8, 0xCu);
  }
  id v5 = [(WCDClient *)self clientCurrentPairingID];

  if (!v5)
  {
    id v6 = +[WCDSystemMonitor sharedSystemMonitor];
    uint64_t v7 = [v6 pairingID];
    [(WCDClient *)self setClientCurrentPairingID:v7];
  }
  [(WCDClient *)self updateClientWithSessionState];
}

- (void)systemObserverActiveDeviceSwitchStarted
{
  self->_counterpartCanEstablishXPCConnection = 0;
  self->_counterpartCanEstablishXPCConnectionCalled = 0;
  [(WCDClient *)self handleActiveDeviceSwitchStarted];
}

- (void)systemObserverActiveDeviceConnectedChanged
{
  unsigned __int8 v3 = wc_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v4 = [(WCDClient *)self loggingIdentifier];
    int v5 = 138543362;
    id v6 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@", (uint8_t *)&v5, 0xCu);
  }
  [(WCDClient *)self updateClientWithSessionState];
}

- (void)systemObserverRemainingComplicationUserInfoTransfersReset
{
  unsigned __int8 v3 = wc_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v4 = [(WCDClient *)self loggingIdentifier];
    int v5 = 138543362;
    id v6 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@", (uint8_t *)&v5, 0xCu);
  }
  [(WCDClient *)self updateClientWithSessionState];
}

- (void)systemObserverRunningIndependentlyWatchApps
{
  unsigned __int8 v3 = wc_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v4 = [(WCDClient *)self loggingIdentifier];
    int v5 = 138543362;
    id v6 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@", (uint8_t *)&v5, 0xCu);
  }
  [(WCDClient *)self updateClientWithSessionState];
}

- (void)systemObserverAppDidSuspendForBundleID:(id)a3
{
  id v4 = a3;
  int v5 = [(WCDClient *)self bundleID];
  unsigned int v6 = [v4 isEqual:v5];

  if (v6)
  {
    uint64_t v7 = wc_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = [(WCDClient *)self loggingIdentifier];
      int v10 = 138543362;
      unsigned int v11 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: suspended; invalidating xpc connection",
        (uint8_t *)&v10,
        0xCu);
    }
    id v9 = [(WCDClient *)self connection];
    [v9 invalidate];
  }
}

- (void)systemObserverProcessStateChangedForBundleID:(id)a3
{
  id v4 = a3;
  int v5 = [(WCDClient *)self communicationID];
  unsigned int v6 = [v4 isEqual:v5];

  if (v6)
  {
    [(WCDClient *)self terminateApplicationDueToSwitchIfEligible];
  }
}

- (void)terminateApplicationDueToSwitchIfEligible
{
  uint64_t v3 = [(WCDClient *)self clientCurrentPairingID];
  if (v3)
  {
    id v4 = (void *)v3;
    unsigned __int8 v5 = [(WCDClient *)self clientSupportsActiveDeviceSwitch];

    if ((v5 & 1) == 0)
    {
      unsigned int v6 = +[WCDSystemMonitor sharedSystemMonitor];
      uint64_t v7 = [(WCDClient *)self communicationID];
      unsigned int v8 = [v6 applicationStateForBundleID:v7];
      id v9 = [(WCDClient *)self clientCurrentPairingID];
      int v10 = [v6 pairingID];
      unsigned __int8 v11 = [v9 isEqual:v10];

      if ((v8 == 4 || v8 == 2) && (v11 & 1) == 0)
      {
        CFStringRef v12 = wc_log();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v13 = [(WCDClient *)self loggingIdentifier];
          int v15 = 138543362;
          id v16 = v13;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: being terminated as active device switch has occurred", (uint8_t *)&v15, 0xCu);
        }
        id v14 = +[FBSSystemService sharedService];
        [v14 terminateApplication:v7 forReason:3 andReport:0 withDescription:0];
      }
    }
  }
}

- (void)sessionReadyForInitialStateForClientPairingID:(id)a3 supportsActiveDeviceSwitch:(BOOL)a4 withErrorHandler:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  (*((void (**)(id, void))a5 + 2))(a5, 0);
  [(WCDClient *)self setPendingContentDequeued:0];
  [(WCDClient *)self setClientSupportsActiveDeviceSwitch:v6];
  id v9 = +[WCDSystemMonitor sharedSystemMonitor];
  int v10 = [v9 pairingID];
  unsigned __int8 v11 = wc_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v12 = [(WCDClient *)self loggingIdentifier];
    unsigned int v13 = [(WCDClient *)self clientSupportsActiveDeviceSwitch];
    id v14 = "NO";
    *(_DWORD *)__int16 v27 = 138544130;
    *(_WORD *)&v27[12] = 2080;
    *(void *)&v27[4] = v12;
    if (v13) {
      id v14 = "YES";
    }
    *(void *)&v27[14] = v14;
    __int16 v28 = 2114;
    id v29 = v8;
    __int16 v30 = 2114;
    v31 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: client supports switch: %s, client pairingID: %{public}@, system pairingID: %{public}@", v27, 0x2Au);
  }
  if (v8)
  {
    [(WCDClient *)self setClientCurrentPairingID:v8];
    if ([v9 initialSetUpComplete] && !v10)
    {
      int v15 = wc_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        id v16 = [(WCDClient *)self loggingIdentifier];
        *(_DWORD *)__int16 v27 = 138543362;
        *(void *)&v27[4] = v16;
        id v17 = "%{public}@: unpair occurred";
LABEL_17:
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, v17, v27, 0xCu);

        goto LABEL_18;
      }
      goto LABEL_18;
    }
    __int16 v22 = [(WCDClient *)self clientCurrentPairingID];
    unsigned int v23 = [v22 isEqual:v10];

    int v15 = wc_log();
    BOOL v24 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
    if (v23)
    {
      if (v24)
      {
        id v16 = [(WCDClient *)self loggingIdentifier];
        *(_DWORD *)__int16 v27 = 138543362;
        *(void *)&v27[4] = v16;
        id v17 = "%{public}@: pairingIDs match. activating for currently active counterpart";
        goto LABEL_17;
      }
LABEL_18:

LABEL_19:
      [(WCDClient *)self updateClientWithSessionState];
      goto LABEL_26;
    }
    if (v24)
    {
      v26 = [(WCDClient *)self loggingIdentifier];
      *(_DWORD *)__int16 v27 = 138543362;
      *(void *)&v27[4] = v26;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: switch had started", v27, 0xCu);
    }
    [(WCDClient *)self handleActiveDeviceSwitchStarted];
  }
  else
  {
    unsigned int v18 = [v9 initialSetUpComplete];
    id v19 = wc_log();
    BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
    if (v18)
    {
      if (v20)
      {
        v21 = [(WCDClient *)self loggingIdentifier];
        *(_DWORD *)__int16 v27 = 138543362;
        *(void *)&v27[4] = v21;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%{public}@: activating for currently active counterpart", v27, 0xCu);
      }
      [(WCDClient *)self setClientCurrentPairingID:v10];
      goto LABEL_19;
    }
    if (v20)
    {
      __int16 v25 = [(WCDClient *)self loggingIdentifier];
      *(_DWORD *)__int16 v27 = 138543362;
      *(void *)&v27[4] = v25;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%{public}@: activating for currently active counterpart; awaiting initial set up complete",
        v27,
        0xCu);
    }
    [(WCDClient *)self setClientCurrentPairingID:0];
    [v9 retrySetupInitialStateIfNeeded];
  }
LABEL_26:
}

- (void)handleActiveDeviceSwitchStarted
{
  uint64_t v3 = wc_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(WCDClient *)self loggingIdentifier];
    int v6 = 138543362;
    uint64_t v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@", (uint8_t *)&v6, 0xCu);
  }
  self->_previousReachable = 0;
  self->_pendingContentDequeued = 0;
  unsigned __int8 v5 = [(WCDClient *)self remoteObjectProxy];
  [v5 handleActiveDeviceSwitchStarted];

  [(WCDClient *)self terminateApplicationDueToSwitchIfEligible];
}

- (BOOL)reachable
{
  uint64_t v3 = +[WCDSystemMonitor sharedSystemMonitor];
  if ([(WCDClient *)self counterpartCanEstablishXPCConnection]
    && [v3 isPaired]
    && [v3 activeDeviceConnected])
  {
    unsigned int v4 = [(WCDClient *)self watchAppInstalled];
  }
  else
  {
    unsigned int v4 = 0;
  }
  uint64_t v5 = [(WCDClient *)self isAlwaysReachable] | v4;
  if ([(WCDClient *)self previousReachable] != v5)
  {
    [(WCDClient *)self setPreviousReachable:v5];
    int v6 = [(WCDClient *)self delegate];
    [v6 clientReachabilityDidChange:self];
  }
  return v5;
}

- (BOOL)iOSDeviceNeedsFirstUnlock
{
  return 0;
}

- (BOOL)foregroundOrPrivileged
{
  if (![(WCDClient *)self background]) {
    return 1;
  }

  return [(WCDClient *)self privileged];
}

- (id)newSessionState
{
  uint64_t v3 = +[WCDSystemMonitor sharedSystemMonitor];
  BOOL v4 = [(WCDClient *)self complicationEnabled];
  unint64_t v5 = [(WCDClient *)self remainingComplicationUserInfoTransfersWithComplicationEnabled:v4];
  int v6 = [(WCDClient *)self applicationInfo];
  uint64_t v7 = [v6 uniqueInstallID];

  id v8 = objc_alloc((Class)WCSessionState);
  BOOL v9 = [(WCDClient *)self reachable];
  id v10 = [v3 isPaired];
  BOOL v11 = [(WCDClient *)self watchAppInstalled];
  CFStringRef v12 = [v3 pairingID];
  unsigned int v13 = [v3 pairedDevicesPairingIDs];
  id v14 = [v8 initWithReachable:v9 paired:v10 appInstalled:v11 complicationEnabled:v4 remainingComplicationUserInfoTransfers:v5 activePairingID:v12 pairedDevicesPairingIDs:v13 appInstallationID:v7];

  return v14;
}

- (void)updateClientWithSessionState
{
  id v5 = +[WCDSystemMonitor sharedSystemMonitor];
  if ([(WCDClient *)self counterpartCanEstablishXPCConnectionCalled]
    && [(WCDClient *)self privilegedCalled]
    && [v5 initialSetUpComplete])
  {
    uint64_t v3 = [(WCDClient *)self remoteObjectProxy];
    id v4 = [(WCDClient *)self newSessionState];
    [v3 handleSessionStateChanged:v4];

    [(WCDClient *)self dequeuePendingContent];
  }
}

- (void)dequeuePendingContent
{
  if (![(WCDClient *)self pendingContentDequeued])
  {
    [(WCDClient *)self setPendingContentDequeued:1];
    uint64_t v3 = +[WCDSystemMonitor sharedSystemMonitor];
    id v4 = [(WCDClient *)self clientCurrentPairingID];
    id v5 = [v3 pairingID];
    unsigned int v6 = [v4 isEqual:v5];

    if (v6)
    {
      uint64_t v7 = wc_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        id v8 = [(WCDClient *)self loggingIdentifier];
        int v21 = 138543362;
        __int16 v22 = v8;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ causing client to check to see if there is any pending content awaiting", (uint8_t *)&v21, 0xCu);
      }
      BOOL v9 = +[WatchConnectivityDaemon sharedDaemon];
      [v9 dequeueContentForClient:self];

      id v10 = [(WCDClient *)self clientCurrentPairingID];
      [(WCDClient *)self handleApplicationContextWithPairingID:v10];

      BOOL v11 = [(WCDClient *)self clientCurrentPairingID];
      [(WCDClient *)self handleUserInfoResultWithPairingID:v11];

      CFStringRef v12 = [(WCDClient *)self clientCurrentPairingID];
      [(WCDClient *)self handleIncomingUserInfoWithPairingID:v12];

      unsigned int v13 = [(WCDClient *)self clientCurrentPairingID];
      [(WCDClient *)self handleFileResultWithPairingID:v13];

      id v14 = [(WCDClient *)self clientCurrentPairingID];
      [(WCDClient *)self handleIncomingFileWithPairingID:v14];
    }
    else
    {
      int v15 = [(WCDClient *)self clientCurrentPairingID];

      id v14 = wc_log();
      BOOL v16 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
      if (v15)
      {
        if (v16)
        {
          id v17 = [(WCDClient *)self loggingIdentifier];
          unsigned int v18 = [(WCDClient *)self clientCurrentPairingID];
          id v19 = [v3 pairingID];
          int v21 = 138543874;
          __int16 v22 = v17;
          __int16 v23 = 2114;
          BOOL v24 = v18;
          __int16 v25 = 2114;
          v26 = v19;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ not dequeueing content for client as pairingIDs don't match (%{public}@ vs %{public}@)", (uint8_t *)&v21, 0x20u);
        }
      }
      else if (v16)
      {
        BOOL v20 = [(WCDClient *)self loggingIdentifier];
        int v21 = 138543362;
        __int16 v22 = v20;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ not dequeueing content for client as it has no pairingID", (uint8_t *)&v21, 0xCu);
      }
    }
  }
}

- (void)sendMessage:(id)a3 clientPairingID:(id)a4 acceptanceHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, uint64_t, BOOL))a5;
  if ([(WCDClient *)self outstandingMessagesToSendCount] <= 9)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v11 = v8;
      CFStringRef v12 = objc_opt_new();
      [v12 setVersion:1];
      unsigned int v13 = [v11 data];
      [v12 setClientData:v13];

      [v12 setExpectsResponse:[v11 expectsResponse]];
      [v12 setDictionaryMessage:[v11 isDictionaryMessage]];
      [v12 setIsInUse:-[WCDClient isInUse](self, "isInUse")];
      id v14 = [v11 identifier];
      [(WCDClient *)self addOutstandingMessage:v14];

      uint64_t v39 = +[WatchConnectivityDaemon sharedDaemon];
      int v15 = [v11 identifier];
      BOOL v16 = [(WCDClient *)self communicationID];
      v43[0] = _NSConcreteStackBlock;
      v43[1] = 3221225472;
      v43[2] = sub_100008214;
      v43[3] = &unk_100044BE8;
      v43[4] = self;
      id v17 = &v44;
      id v18 = v11;
      id v19 = &v45;
      BOOL v20 = (void *)v39;
      id v44 = v18;
      id v45 = v18;
      int v21 = v43;
      __int16 v22 = (void *)v39;
      __int16 v23 = v12;
      BOOL v24 = v15;
      uint64_t v25 = 0;
      v26 = v16;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_12:
        [(WCDClient *)self setAllowMessageSending:[(WCDClient *)self outstandingMessagesToSendCount] < 10];
        v35 = wc_log();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          v36 = [(WCDClient *)self loggingIdentifier];
          unsigned int v37 = [(WCDClient *)self allowMessageSending];
          v38 = "NO";
          if (v37) {
            v38 = "YES";
          }
          *(_DWORD *)buf = 138543618;
          v47 = v36;
          __int16 v48 = 2080;
          v49 = v38;
          _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "%{public}@ current YES, next %s", buf, 0x16u);
        }
        v10[2](v10, 1, [(WCDClient *)self allowMessageSending]);
        goto LABEL_17;
      }
      id v29 = v8;
      CFStringRef v12 = objc_opt_new();
      [v12 setVersion:1];
      __int16 v30 = [v29 data];
      [v12 setClientData:v30];

      v31 = [v29 error];

      if (v31)
      {
        v32 = [v29 error];
        [v12 setErrorCode:[v32 code]];
      }
      [v12 setDictionaryMessage:[v29 isDictionaryMessage]];
      v33 = [v29 identifier];
      [(WCDClient *)self addOutstandingMessage:v33];

      BOOL v20 = +[WatchConnectivityDaemon sharedDaemon];
      int v15 = [v29 identifier];
      BOOL v16 = [(WCDClient *)self communicationID];
      v40[0] = _NSConcreteStackBlock;
      v40[1] = 3221225472;
      v40[2] = sub_1000082AC;
      v40[3] = &unk_100044BE8;
      v40[4] = self;
      id v17 = &v41;
      id v34 = v29;
      id v19 = &v42;
      id v41 = v34;
      id v42 = v34;
      int v21 = v40;
      __int16 v22 = v20;
      __int16 v23 = v12;
      BOOL v24 = v15;
      uint64_t v25 = 1;
      v26 = v16;
    }
    [v22 sendMessage:v23 withIdentifier:v24 isResponse:v25 clientID:v26 clientPairingID:v9 errorHandler:v21];

    goto LABEL_12;
  }
  [(WCDClient *)self setAllowMessageSending:0];
  __int16 v27 = wc_log();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v28 = [(WCDClient *)self loggingIdentifier];
    *(_DWORD *)buf = 138543362;
    v47 = v28;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "%{public}@ outstanding messages at maximum", buf, 0xCu);
  }
  v10[2](v10, 0, 0);
LABEL_17:
}

- (void)addOutstandingMessage:(id)a3
{
  id v4 = a3;
  id v5 = [(WCDClient *)self outstandingMessagesToSend];
  [v5 addObject:v4];
}

- (void)removeOutstandingMessage:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [(WCDClient *)self outstandingMessagesToSend];
    [v5 removeObject:v4];

    [(WCDClient *)self updateMessagesClientIfNeeded];
  }
}

- (int64_t)outstandingMessagesToSendCount
{
  v2 = [(WCDClient *)self outstandingMessagesToSend];
  id v3 = [v2 count];

  return (int64_t)v3;
}

- (void)updateMessagesClientIfNeeded
{
  if (![(WCDClient *)self allowMessageSending]
    && [(WCDClient *)self outstandingMessagesToSendCount] <= 6)
  {
    [(WCDClient *)self setAllowMessageSending:1];
    id v3 = [(WCDClient *)self remoteObjectProxy];
    [v3 handleMessageSendingAllowed];
  }
}

- (void)handleRequest:(id)a3
{
  id v4 = a3;
  id v5 = [(WCDClient *)self remoteObjectProxy];
  [v5 handleRequest:v4];
}

- (void)handleResponse:(id)a3
{
  id v4 = a3;
  id v5 = [(WCDClient *)self remoteObjectProxy];
  [v5 handleResponse:v4];
}

- (void)handleSentMessageWithIdentifier:(id)a3 error:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(WCDClient *)self remoteObjectProxy];
  [v8 handleSentMessageWithIdentifier:v7 error:v6];
}

- (void)cancelAllOutstandingMessages
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = [(WCDClient *)self outstandingMessagesToSend];
  id v4 = [v3 countByEnumeratingWithState:&v12 objects:v20 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        id v9 = wc_log();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          id v10 = [(WCDClient *)self loggingIdentifier];
          *(_DWORD *)buf = 138543618;
          id v17 = v10;
          __int16 v18 = 2114;
          uint64_t v19 = v8;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@", buf, 0x16u);
        }
        [(WCDClient *)self cancelSendWithIdentifier:v8];
      }
      id v5 = [v3 countByEnumeratingWithState:&v12 objects:v20 count:16];
    }
    while (v5);
  }

  id v11 = [(WCDClient *)self outstandingMessagesToSend];
  [v11 removeAllObjects];
}

- (void)handleApplicationContextWithPairingID:(id)a3
{
  id v4 = a3;
  id v5 = wc_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [(WCDClient *)self loggingIdentifier];
    int v8 = 138543618;
    id v9 = v6;
    __int16 v10 = 2114;
    id v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@", (uint8_t *)&v8, 0x16u);
  }
  id v7 = [(WCDClient *)self remoteObjectProxy];
  [v7 handleApplicationContextWithPairingID:v4];
}

- (void)handleIncomingFileWithPairingID:(id)a3
{
  id v4 = a3;
  id v5 = wc_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [(WCDClient *)self loggingIdentifier];
    int v8 = 138543618;
    id v9 = v6;
    __int16 v10 = 2114;
    id v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@", (uint8_t *)&v8, 0x16u);
  }
  id v7 = [(WCDClient *)self remoteObjectProxy];
  [v7 handleIncomingFileWithPairingID:v4];
}

- (void)handleFileResultWithPairingID:(id)a3
{
  id v4 = a3;
  id v5 = wc_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [(WCDClient *)self loggingIdentifier];
    int v8 = 138543618;
    id v9 = v6;
    __int16 v10 = 2114;
    id v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@", (uint8_t *)&v8, 0x16u);
  }
  id v7 = [(WCDClient *)self remoteObjectProxy];
  [v7 handleFileResultWithPairingID:v4];
}

- (void)handleIncomingUserInfoWithPairingID:(id)a3
{
  id v4 = a3;
  id v5 = wc_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [(WCDClient *)self loggingIdentifier];
    int v8 = 138543618;
    id v9 = v6;
    __int16 v10 = 2114;
    id v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@", (uint8_t *)&v8, 0x16u);
  }
  id v7 = [(WCDClient *)self remoteObjectProxy];
  [v7 handleIncomingUserInfoWithPairingID:v4];
}

- (void)handleUserInfoResultWithPairingID:(id)a3
{
  id v4 = a3;
  id v5 = wc_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [(WCDClient *)self loggingIdentifier];
    int v8 = 138543618;
    id v9 = v6;
    __int16 v10 = 2114;
    id v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@", (uint8_t *)&v8, 0x16u);
  }
  id v7 = [(WCDClient *)self remoteObjectProxy];
  [v7 handleUserInfoResultWithPairingID:v4];
}

- (void)updateApplicationContext:(id)a3 clientPairingID:(id)a4 errorHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v13 = (id)objc_opt_new();
  [v13 setVersion:1];
  [v13 setClientData:v10];

  id v11 = +[WatchConnectivityDaemon sharedDaemon];
  long long v12 = [(WCDClient *)self communicationID];
  [v11 updateApplicationContext:v13 clientID:v12 clientPairingID:v9 errorHandler:v8];
}

- (void)transferFile:(id)a3 sandboxToken:(id)a4 clientPairingID:(id)a5 errorHandler:(id)a6
{
  id v9 = a3;
  id v10 = (void (**)(id, void *))a6;
  long long v55 = 0u;
  long long v56 = 0u;
  id v11 = a4;
  long long v12 = [(WCDClient *)self connection];
  id v13 = v12;
  if (v12)
  {
    [v12 auditToken];
  }
  else
  {
    long long v55 = 0u;
    long long v56 = 0u;
  }

  long long v14 = [v9 file];
  long long v15 = [v14 fileURL];
  *(_OWORD *)buf = v55;
  *(_OWORD *)&buf[16] = v56;
  uint64_t v16 = WCCheckFileAndConsumeSandboxTokenForAuditToken();

  if (v16 <= 0)
  {
    int v21 = +[NSError wcErrorWithCode:7013];
    v10[2](v10, v21);
  }
  else
  {
    id v17 = NSTemporaryDirectory();
    uint64_t v18 = +[NSURL fileURLWithPath:v17 isDirectory:1];

    uint64_t v19 = +[NSUUID UUID];
    BOOL v20 = [v19 UUIDString];
    int v21 = [(id)v18 URLByAppendingPathComponent:v20 isDirectory:1];

    __int16 v22 = +[NSFileManager defaultManager];
    id v54 = 0;
    LOBYTE(v18) = [v22 createDirectoryAtURL:v21 withIntermediateDirectories:1 attributes:0 error:&v54];
    id v23 = v54;

    if (v18)
    {
      id v49 = v23;
      BOOL v24 = [v9 file];
      uint64_t v25 = [v24 fileURL];
      v26 = [v25 standardizedURL];
      uint64_t v27 = [v26 lastPathComponent];

      __int16 v48 = (void *)v27;
      __int16 v28 = [v21 URLByAppendingPathComponent:v27];
      id v29 = objc_opt_new();
      [v29 setObject:&off_100046B18 forKeyedSubscript:@"t"];
      __int16 v30 = [v9 file];
      v31 = [v30 userInfoData];

      if (v31)
      {
        v32 = [v9 file];
        v33 = [v32 userInfoData];
        [v29 setObject:v33 forKeyedSubscript:@"u"];
      }
      id v34 = wc_log();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        [(WCDClient *)self loggingIdentifier];
        v35 = v47 = v28;
        v36 = [v9 file];
        unsigned int v37 = [v36 fileURL];
        v38 = [v37 path];
        *(_DWORD *)buf = 138543874;
        *(void *)&uint8_t buf[4] = v35;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v38;
        *(_WORD *)&buf[22] = 2114;
        *(void *)&buf[24] = v29;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "%{public}@ Client sending file %{public}@ with metadata %{public}@, ", buf, 0x20u);

        __int16 v28 = v47;
      }

      uint64_t v39 = +[WatchConnectivityDaemon sharedDaemon];
      v40 = [v9 file];
      id v41 = [v40 fileDescriptor];
      id v42 = [v9 transferIdentifier];
      v50[0] = _NSConcreteStackBlock;
      v50[1] = 3221225472;
      v50[2] = sub_100009294;
      v50[3] = &unk_100044C10;
      v50[4] = self;
      id v51 = v9;
      id v52 = v28;
      v53 = v10;
      id v43 = v28;
      [v39 transferFile:v41 withMetadata:v29 identifier:v42 forClient:self destFilePath:v43 errorHandler:v50];

      id v44 = v48;
      id v23 = v49;
    }
    else
    {
      id v45 = wc_log();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
        sub_10002A928((uint64_t)v23, v45);
      }

      NSErrorUserInfoKey v57 = NSUnderlyingErrorKey;
      id v58 = v23;
      v46 = +[NSDictionary dictionaryWithObjects:&v58 forKeys:&v57 count:1];
      id v44 = +[NSError wcErrorWithCode:7001 userInfo:v46];

      v10[2](v10, v44);
    }
  }
}

- (void)copyProgressUpdatesForFileTransfer:(id)a3 fromClonedFileURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = wc_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v6 file];
    id v10 = [v9 fileURL];
    id v11 = [v6 transferIdentifier];
    *(_DWORD *)buf = 138412802;
    id v23 = v10;
    __int16 v24 = 2112;
    id v25 = v7;
    __int16 v26 = 2112;
    uint64_t v27 = v11;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Creating progress copy for originalFile: %@, clonedFile: %@, transferID: %@", buf, 0x20u);
  }
  long long v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472;
  uint64_t v16 = sub_100009524;
  id v17 = &unk_100044C60;
  id v12 = v6;
  id v18 = v12;
  uint64_t v19 = self;
  objc_copyWeak(&v20, &location);
  id v13 = +[NSProgress addSubscriberForFileURL:v7 withPublishingHandler:&v14];
  [v12 setProgressToken:v13, v14, v15, v16, v17];

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

- (void)registerForUpdatesForProgress:(id)a3
{
  id v4 = a3;
  [v4 addObserver:self forKeyPath:@"userInfo.NSProgressByteCompletedCountKey" options:1 context:0];
  [v4 addObserver:self forKeyPath:@"totalUnitCount" options:1 context:0];
  [v4 addObserver:self forKeyPath:@"completedUnitCount" options:1 context:0];
  [v4 addObserver:self forKeyPath:@"finished" options:1 context:0];
  [v4 addObserver:self forKeyPath:@"cancelled" options:1 context:0];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v8 = a3;
  id v9 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v10 = v9;
  }
  else {
    id v10 = 0;
  }
  id v11 = v10;
  id v12 = [v11 userInfo];
  id v13 = [v12 objectForKeyedSubscript:IDSSendResourceProgressIdentifier];

  long long v14 = [(NSMutableDictionary *)self->_outstandingFileTransfers objectForKeyedSubscript:v13];
  if ([v8 isEqual:@"completedUnitCount"])
  {
    [v14 setCompletedUnitCount:[v11 completedUnitCount]];
    goto LABEL_11;
  }
  if ([v8 isEqual:@"totalUnitCount"])
  {
    [v14 setTotalUnitCount:[v11 totalUnitCount]];
    goto LABEL_11;
  }
  if ([v8 isEqual:@"userInfo.NSProgressByteCompletedCountKey"])
  {
    uint64_t v15 = [v11 byteCompletedCount];
    [v14 setByteCompletedCount:v15];
LABEL_10:

    goto LABEL_11;
  }
  if (![v8 isEqual:@"finished"])
  {
    if (![v8 isEqual:@"cancelled"]) {
      goto LABEL_11;
    }
    uint64_t v15 = wc_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 136446466;
      id v18 = "-[WCDClient observeValueForKeyPath:ofObject:change:context:]";
      __int16 v19 = 2112;
      id v20 = v13;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%{public}s Progress cancelled for identifier %@", (uint8_t *)&v17, 0x16u);
    }
    goto LABEL_10;
  }
  if (v11
    && ([v11 isFinished] & 1) == 0
    && ([v11 isCancelled] & 1) == 0)
  {
    uint64_t v16 = wc_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 136446466;
      id v18 = "-[WCDClient observeValueForKeyPath:ofObject:change:context:]";
      __int16 v19 = 2114;
      id v20 = v14;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%{public}s Forcing progress to finished for %{public}@", (uint8_t *)&v17, 0x16u);
    }

    [v14 setCompletedUnitCount:[v14 totalUnitCount]];
    [v14 unpublish];
    [(NSMutableDictionary *)self->_outstandingFileTransfers setObject:0 forKeyedSubscript:v13];
  }
LABEL_11:
}

- (void)removeProgressForFileTransfer:(id)a3
{
  id v3 = a3;
  id v4 = [v3 progress];
  unsigned int v5 = [v4 isFinished];

  if (v5)
  {
    id v6 = [v3 progressToken];

    id v7 = wc_log();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (v6)
    {
      if (v8)
      {
        int v10 = 136446466;
        id v11 = "-[WCDClient removeProgressForFileTransfer:]";
        __int16 v12 = 2114;
        id v13 = v3;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}s Removing progress for transfer %{public}@", (uint8_t *)&v10, 0x16u);
      }

      id v9 = [v3 progressToken];
      +[NSProgress _removeSubscriber:v9];

      [v3 setProgressToken:0];
    }
    else
    {
      if (v8)
      {
        int v10 = 136446466;
        id v11 = "-[WCDClient removeProgressForFileTransfer:]";
        __int16 v12 = 2114;
        id v13 = v3;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}s Missing item to remove (identifier: %{public}@)", (uint8_t *)&v10, 0x16u);
      }
    }
  }
}

- (void)transferUserInfo:(id)a3 withURL:(id)a4 clientPairingID:(id)a5 errorHandler:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = a4;
  if ([v10 isCurrentComplicationInfo])
  {
    long long v14 = objc_opt_new();
    [v14 setVersion:1];
    uint64_t v15 = [v10 userInfoData];
    [v14 setClientData:v15];

    uint64_t v16 = [v10 transferIdentifier];
    [v14 setTransferIdentifier:v16];

    int v17 = +[WatchConnectivityDaemon sharedDaemon];
    id v18 = [(WCDClient *)self communicationID];
    __int16 v19 = [v10 complicationTransferIdentifier];
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_10000A104;
    v25[3] = &unk_100044C88;
    v25[4] = self;
    unsigned int v20 = [v17 sendComplicationUserInfo:v14 clientID:v18 clientPairingID:v11 identifier:v19 errorHandler:v25];

    if (v20) {
      [(WCDClient *)self updateClientWithSessionState];
    }
  }
  CFStringRef v26 = @"t";
  uint64_t v27 = &off_100046B30;
  int v21 = +[NSDictionary dictionaryWithObjects:&v27 forKeys:&v26 count:1];
  __int16 v22 = +[WatchConnectivityDaemon sharedDaemon];
  id v23 = [v10 transferIdentifier];
  __int16 v24 = [(WCDClient *)self communicationID];
  [v22 transferUserInfo:v13 withMetadata:v21 identifier:v23 clientID:v24 clientPairingID:v11 errorHandler:v12];
}

- (void)cancelSendWithIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = +[WatchConnectivityDaemon sharedDaemon];
  [v4 cancelSendWithIdentifier:v3];
}

- (void)acknowledgeFileIndexWithIdentifier:(id)a3 clientPairingID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = wc_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [(WCDClient *)self loggingIdentifier];
    int v13 = 138543874;
    long long v14 = v9;
    __int16 v15 = 2114;
    id v16 = v6;
    __int16 v17 = 2114;
    id v18 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ identifier: %{public}@, clientPairingID: %{public}@", (uint8_t *)&v13, 0x20u);
  }
  id v10 = +[WCDIndexManager sharedManager];
  id v11 = [(WCDClient *)self applicationInfo];
  id v12 = [v10 fileIndexForApplication:v11 pairingID:v7];

  [v12 removeContentIdentifier:v6];
}

- (void)acknowledgeFileResultIndexWithIdentifier:(id)a3 clientPairingID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = wc_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [(WCDClient *)self loggingIdentifier];
    int v13 = 138543874;
    long long v14 = v9;
    __int16 v15 = 2114;
    id v16 = v6;
    __int16 v17 = 2114;
    id v18 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ identifier: %{public}@, clientPairingID: %{public}@", (uint8_t *)&v13, 0x20u);
  }
  id v10 = +[WCDIndexManager sharedManager];
  id v11 = [(WCDClient *)self applicationInfo];
  id v12 = [v10 fileResultsIndexForApplication:v11 pairingID:v7];

  [v12 removeContentIdentifier:v6];
}

- (void)acknowledgeUserInfoIndexWithIdentifier:(id)a3 clientPairingID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = wc_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [(WCDClient *)self loggingIdentifier];
    int v13 = 138543874;
    long long v14 = v9;
    __int16 v15 = 2114;
    id v16 = v6;
    __int16 v17 = 2114;
    id v18 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ identifier: %{public}@, clientPairingID: %{public}@", (uint8_t *)&v13, 0x20u);
  }
  id v10 = +[WCDIndexManager sharedManager];
  id v11 = [(WCDClient *)self applicationInfo];
  id v12 = [v10 userInfoIndexForApplication:v11 pairingID:v7];

  [v12 removeContentIdentifier:v6];
}

- (void)acknowledgeUserInfoResultIndexWithIdentifier:(id)a3 clientPairingID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = wc_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [(WCDClient *)self loggingIdentifier];
    int v13 = 138543874;
    long long v14 = v9;
    __int16 v15 = 2114;
    id v16 = v6;
    __int16 v17 = 2114;
    id v18 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ identifier: %{public}@, clientPairingID: %{public}@", (uint8_t *)&v13, 0x20u);
  }
  id v10 = +[WCDIndexManager sharedManager];
  id v11 = [(WCDClient *)self applicationInfo];
  id v12 = [v10 userInfoResultsIndexForApplication:v11 pairingID:v7];

  [v12 removeContentIdentifier:v6];
}

- (id)remoteObjectProxy
{
  connection = self->_connection;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000A784;
  v5[3] = &unk_100044C88;
  v5[4] = self;
  id v3 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v5];

  return v3;
}

- (BOOL)hasIncreasedPriorityTraffic
{
  return self->_increasedPriorityTraffic;
}

- (BOOL)isAlwaysReachable
{
  return self->_alwaysReachable;
}

- (NSString)bundleID
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)communicationID
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setCommunicationID:(id)a3
{
}

- (BOOL)counterpartCanEstablishXPCConnection
{
  return self->_counterpartCanEstablishXPCConnection;
}

- (BOOL)previousReachable
{
  return self->_previousReachable;
}

- (void)setPreviousReachable:(BOOL)a3
{
  self->_previousReachable = a3;
}

- (NSString)clientCurrentPairingID
{
  return self->_clientCurrentPairingID;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (WCDClientDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (WCDClientDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)privileged
{
  return self->_privileged;
}

- (BOOL)clientSupportsActiveDeviceSwitch
{
  return self->_clientSupportsActiveDeviceSwitch;
}

- (void)setClientSupportsActiveDeviceSwitch:(BOOL)a3
{
  self->_clientSupportsActiveDeviceSwitch = a3;
}

- (BOOL)counterpartCanEstablishXPCConnectionCalled
{
  return self->_counterpartCanEstablishXPCConnectionCalled;
}

- (void)setCounterpartCanEstablishXPCConnectionCalled:(BOOL)a3
{
  self->_counterpartCanEstablishXPCConnectionCalled = a3;
}

- (BOOL)privilegedCalled
{
  return self->_privilegedCalled;
}

- (void)setPrivilegedCalled:(BOOL)a3
{
  self->_privilegedCalled = a3;
}

- (BOOL)pendingContentDequeued
{
  return self->_pendingContentDequeued;
}

- (void)setPendingContentDequeued:(BOOL)a3
{
  self->_pendingContentDequeued = a3;
}

- (OS_os_transaction)transaction
{
  return (OS_os_transaction *)objc_getProperty(self, a2, 64, 1);
}

- (void)setTransaction:(id)a3
{
}

- (BOOL)background
{
  return self->_background;
}

- (BOOL)allowMessageSending
{
  return self->_allowMessageSending;
}

- (void)setAllowMessageSending:(BOOL)a3
{
  self->_allowMessageSending = a3;
}

- (NSMutableArray)outstandingMessagesToSend
{
  return (NSMutableArray *)objc_getProperty(self, a2, 72, 1);
}

- (void)setOutstandingMessagesToSend:(id)a3
{
}

- (BOOL)isInUse
{
  return self->_isInUse;
}

- (void)setIsInUse:(BOOL)a3
{
  self->_isInUse = a3;
}

- (NSMutableDictionary)outstandingFileTransfers
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 80, 1);
}

- (void)setOutstandingFileTransfers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outstandingFileTransfers, 0);
  objc_storeStrong((id *)&self->_outstandingMessagesToSend, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_clientCurrentPairingID, 0);
  objc_storeStrong((id *)&self->_communicationID, 0);

  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end