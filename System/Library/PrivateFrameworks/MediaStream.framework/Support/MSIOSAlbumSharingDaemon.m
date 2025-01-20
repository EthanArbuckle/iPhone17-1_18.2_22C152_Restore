@interface MSIOSAlbumSharingDaemon
- (APSConnection)devAPSConnection;
- (APSConnection)prodAPSConnection;
- (BOOL)XPCNSServiceListener:(id)a3 shouldReceiveNewConnection:(id)a4;
- (BOOL)isPersonIDAllowedToDownloadAssets:(id)a3;
- (BOOL)isWaitingForAuth;
- (IDSService)idsService;
- (MSIOSAlbumSharingDaemon)init;
- (NSDictionary)powerBudgetPersistedParameters;
- (NSMutableDictionary)personIDToPowerBudgetMap;
- (NSTimer)busyPingTimer;
- (XPCNSServiceListener)serviceListener;
- (id)MSPowerBudgetDidRequestPersistedValues:(id)a3;
- (id)powerBudgetForPersonID:(id)a3;
- (void)MSPowerBudget:(id)a3 didRequestStorageOfPersistedValues:(id)a4;
- (void)XPCNSServiceListener:(id)a3 didReceiveNewConnection:(id)a4;
- (void)_busyPingTimerDidExpire:(id)a3;
- (void)_readPowerBudgetParametersForPersonID:(id)a3;
- (void)_updatePushNotificationTopicsOutListenToProduction:(BOOL *)a3 outListenToDevelopment:(BOOL *)a4;
- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4;
- (void)connection:(id)a3 didReceivePublicToken:(id)a4;
- (void)didBeginForegroundFocusForPersonID:(id)a3;
- (void)didDestroyStateMachineForPersonID:(id)a3;
- (void)didEndForegroundFocusForPersonID:(id)a3;
- (void)didIdle;
- (void)didReceiveAuthFailureForPersonID:(id)a3;
- (void)didReceiveAuthSuccessForPersonID:(id)a3;
- (void)didReceiveGlobalResetSyncForPersonID:(id)a3;
- (void)didReceivePushNotificationForPersonID:(id)a3;
- (void)didUnidle;
- (void)forgetEverythingAboutPersonID:(id)a3 completionBlock:(id)a4;
- (void)forgetEverythingCompletionBlock:(id)a3;
- (void)sendServerSideConfigurationDidChangeNotificationForPersonID:(id)a3;
- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6;
- (void)setBusyPingTimer:(id)a3;
- (void)setDevAPSConnection:(id)a3;
- (void)setFocusAlbumGUID:(id)a3 forPersonID:(id)a4;
- (void)setFocusAssetCollectionGUID:(id)a3 forPersonID:(id)a4;
- (void)setIdsService:(id)a3;
- (void)setPersonIDToPowerBudgetMap:(id)a3;
- (void)setPowerBudgetPersistedParameters:(id)a3;
- (void)setProdAPSConnection:(id)a3;
- (void)setServiceListener:(id)a3;
- (void)shutDownCompletionBlock:(id)a3;
- (void)stabilizedDidIdle;
- (void)stabilizedDidUnidle;
- (void)start;
@end

@implementation MSIOSAlbumSharingDaemon

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idsService, 0);
  objc_storeStrong((id *)&self->_busyPingTimer, 0);
  objc_storeStrong((id *)&self->_powerBudgetPersistedParameters, 0);
  objc_storeStrong((id *)&self->_personIDToPowerBudgetMap, 0);
  objc_storeStrong((id *)&self->_devAPSConnection, 0);
  objc_storeStrong((id *)&self->_prodAPSConnection, 0);

  objc_storeStrong((id *)&self->_serviceListener, 0);
}

- (void)setIdsService:(id)a3
{
}

- (IDSService)idsService
{
  return self->_idsService;
}

- (void)setBusyPingTimer:(id)a3
{
}

- (NSTimer)busyPingTimer
{
  return self->_busyPingTimer;
}

- (void)setPowerBudgetPersistedParameters:(id)a3
{
}

- (NSDictionary)powerBudgetPersistedParameters
{
  return self->_powerBudgetPersistedParameters;
}

- (void)setPersonIDToPowerBudgetMap:(id)a3
{
}

- (void)setDevAPSConnection:(id)a3
{
}

- (APSConnection)devAPSConnection
{
  return self->_devAPSConnection;
}

- (void)setProdAPSConnection:(id)a3
{
}

- (APSConnection)prodAPSConnection
{
  return self->_prodAPSConnection;
}

- (void)setServiceListener:(id)a3
{
}

- (XPCNSServiceListener)serviceListener
{
  return self->_serviceListener;
}

- (void)forgetEverythingCompletionBlock:(id)a3
{
  id v4 = a3;
  [(MSIOSAlbumSharingDaemon *)self retainBusy];
  v6.receiver = self;
  v6.super_class = (Class)MSIOSAlbumSharingDaemon;
  [(MSIOSAlbumSharingDaemon *)&v6 forgetEverythingCompletionBlock:v4];

  v5 = +[MSAuthenticationManager sharedManager];
  [v5 rearmAuthenticationAlert];

  [(MSIOSAlbumSharingDaemon *)self _updatePushNotificationTopicsOutListenToProduction:0 outListenToDevelopment:0];
  [(MSIOSAlbumSharingDaemon *)self releaseBusy];
}

- (void)forgetEverythingAboutPersonID:(id)a3 completionBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(MSIOSAlbumSharingDaemon *)self retainBusy];
  v9.receiver = self;
  v9.super_class = (Class)MSIOSAlbumSharingDaemon;
  [(MSIOSAlbumSharingDaemon *)&v9 forgetEverythingAboutPersonID:v7 completionBlock:v6];

  v8 = +[MSAuthenticationManager sharedManager];
  [v8 rearmAuthenticationAlert];

  [(MSIOSAlbumSharingDaemon *)self _updatePushNotificationTopicsOutListenToProduction:0 outListenToDevelopment:0];
  [(MSIOSAlbumSharingDaemon *)self releaseBusy];
}

- (BOOL)isWaitingForAuth
{
  v2 = +[MSAuthenticationManager sharedManager];
  unsigned __int8 v3 = [v2 isWaitingForAuth];

  return v3;
}

- (void)didReceiveAuthSuccessForPersonID:(id)a3
{
  id v3 = a3;
  id v4 = +[MSAuthenticationManager sharedManager];
  [v4 didEncounterAuthenticationSuccessForPersonID:v3];
}

- (void)didReceiveAuthFailureForPersonID:(id)a3
{
  id v3 = a3;
  id v4 = +[MSAuthenticationManager sharedManager];
  [v4 didEncounterAuthenticationFailureForPersonID:v3];
}

- (void)stabilizedDidUnidle
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
  {
    int v7 = 138543362;
    v8 = self;
    _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "%{public}@: Daemon in unidled state. Sending notification.", (uint8_t *)&v7, 0xCu);
  }
  id v3 = [(MSIOSAlbumSharingDaemon *)self busyPingTimer];

  if (!v3)
  {
    id v4 = +[NSTimer timerWithTimeInterval:self target:"_busyPingTimerDidExpire:" selector:0 userInfo:1 repeats:3.0];
    [(MSIOSAlbumSharingDaemon *)self setBusyPingTimer:v4];

    v5 = +[NSRunLoop currentRunLoop];
    id v6 = [(MSIOSAlbumSharingDaemon *)self busyPingTimer];
    [v5 addTimer:v6 forMode:NSRunLoopCommonModes];
  }
}

- (void)_busyPingTimerDidExpire:(id)a3
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
  {
    int v4 = 138543362;
    v5 = self;
    _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "%{public}@: Daemon busy ping timer expired. Sending notification.", (uint8_t *)&v4, 0xCu);
  }
}

- (void)stabilizedDidIdle
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
  {
    int v4 = 138543362;
    v5 = self;
    _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "%{public}@: Daemon stabilized in idle state. Sending notification.", (uint8_t *)&v4, 0xCu);
  }
  id v3 = [(MSIOSAlbumSharingDaemon *)self busyPingTimer];
  [v3 invalidate];

  [(MSIOSAlbumSharingDaemon *)self setBusyPingTimer:0];
}

- (void)didUnidle
{
  id v3 = +[MSPowerAssertionManager sharedManager];
  [v3 retainBusy];

  v4.receiver = self;
  v4.super_class = (Class)MSIOSAlbumSharingDaemon;
  [(MSIOSAlbumSharingDaemon *)&v4 didUnidle];
}

- (void)didIdle
{
  id v3 = +[MSPowerAssertionManager sharedManager];
  [v3 releaseBusy];
  [v3 toggleAssertion];
  v4.receiver = self;
  v4.super_class = (Class)MSIOSAlbumSharingDaemon;
  [(MSIOSAlbumSharingDaemon *)&v4 didIdle];
}

- (void)MSPowerBudget:(id)a3 didRequestStorageOfPersistedValues:(id)a4
{
  id v6 = a3;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000913C;
  block[3] = &unk_100018B20;
  block[4] = self;
  id v10 = a4;
  id v11 = v6;
  id v7 = v6;
  id v8 = v10;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (id)MSPowerBudgetDidRequestPersistedValues:(id)a3
{
  id v4 = a3;
  v5 = [(MSIOSAlbumSharingDaemon *)self powerBudgetPersistedParameters];

  if (v5)
  {
    id v6 = [v4 personID];
    id v7 = [(MSIOSAlbumSharingDaemon *)self persistentObjectForKey:@"MSIOSAlbumSharingDaemon.powerBudgetParams" personID:v6];
    [(MSIOSAlbumSharingDaemon *)self setPowerBudgetPersistedParameters:v7];
  }
  id v8 = [(MSIOSAlbumSharingDaemon *)self powerBudgetPersistedParameters];

  return v8;
}

- (void)_readPowerBudgetParametersForPersonID:(id)a3
{
  id v9 = a3;
  id v4 = -[MSIOSAlbumSharingDaemon powerBudgetForPersonID:](self, "powerBudgetForPersonID:");
  if (v4)
  {
    v5 = [(MSIOSAlbumSharingDaemon *)self serverSideConfigurationForPersonID:v9];
    id v6 = [v5 objectForKey:kMSASServerSideConfigMaxActiveTimeAfterPushKey];
    [v6 doubleValue];
    objc_msgSend(v4, "setMaxActiveTimeAfterPush:");

    id v7 = [v5 objectForKey:kMSASServerSideConfigMaxActiveTimeAfterLossOfForegroundKey];
    [v7 doubleValue];
    objc_msgSend(v4, "setMaxActiveTimeAfterLossOfForeground:");

    id v8 = [v5 objectForKey:kMSASServerSideConfigMaxActiveTimeAfterGlobalResetSyncKey];
    [v8 doubleValue];
    objc_msgSend(v4, "setMaxActiveTimeAfterGlobalResetSync:");
  }
}

- (void)didReceiveGlobalResetSyncForPersonID:(id)a3
{
  id v3 = [(MSIOSAlbumSharingDaemon *)self powerBudgetForPersonID:a3];
  [v3 didReceiveGlobalResetSync];
}

- (BOOL)isPersonIDAllowedToDownloadAssets:(id)a3
{
  id v3 = [(MSIOSAlbumSharingDaemon *)self powerBudgetForPersonID:a3];
  unsigned __int8 v4 = [v3 isFileTransferAllowed];

  return v4;
}

- (void)setFocusAssetCollectionGUID:(id)a3 forPersonID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(MSIOSAlbumSharingDaemon *)self powerBudgetForPersonID:v6];
  [v8 setFocusAssetCollectionGUID:v7];

  v9.receiver = self;
  v9.super_class = (Class)MSIOSAlbumSharingDaemon;
  [(MSIOSAlbumSharingDaemon *)&v9 setFocusAssetCollectionGUID:v7 forPersonID:v6];
}

- (void)setFocusAlbumGUID:(id)a3 forPersonID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(MSIOSAlbumSharingDaemon *)self powerBudgetForPersonID:v6];
  [v8 setFocusAlbumGUID:v7];

  v9.receiver = self;
  v9.super_class = (Class)MSIOSAlbumSharingDaemon;
  [(MSIOSAlbumSharingDaemon *)&v9 setFocusAlbumGUID:v7 forPersonID:v6];
}

- (void)didEndForegroundFocusForPersonID:(id)a3
{
  id v3 = [(MSIOSAlbumSharingDaemon *)self powerBudgetForPersonID:a3];
  [v3 didEndForegroundFocus];
}

- (void)didBeginForegroundFocusForPersonID:(id)a3
{
  unsigned __int8 v4 = [(MSIOSAlbumSharingDaemon *)self powerBudgetForPersonID:a3];
  [v4 didBeginForegroundFocus];

  [(MSIOSAlbumSharingDaemon *)self retryOutstandingActivities];
}

- (void)didReceivePushNotificationForPersonID:(id)a3
{
  id v3 = [(MSIOSAlbumSharingDaemon *)self powerBudgetForPersonID:a3];
  [v3 didReceivePushNotification];
}

- (void)didDestroyStateMachineForPersonID:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v7 = 138543618;
    id v8 = self;
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%{public}@: Destroying power budget object for person ID %@", (uint8_t *)&v7, 0x16u);
  }
  v5 = [(MSIOSAlbumSharingDaemon *)self powerBudgetForPersonID:v4];
  [v5 shutDown];
  id v6 = [(MSIOSAlbumSharingDaemon *)self personIDToPowerBudgetMap];
  [v6 removeObjectForKey:v4];
}

- (id)powerBudgetForPersonID:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
LABEL_11:
    id v6 = 0;
    goto LABEL_12;
  }
  v5 = [(MSIOSAlbumSharingDaemon *)self personIDToPowerBudgetMap];
  id v6 = [v5 objectForKey:v4];

  if (v6) {
    goto LABEL_12;
  }
  if (([v4 isEqualToString:&stru_100019078] & 1) == 0)
  {
    int v7 = MSASPlatform();
    unsigned int v8 = [v7 personIDEnabledForAlbumSharing:v4];

    if (!v8)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        int v12 = 138543618;
        v13 = self;
        __int16 v14 = 2112;
        id v15 = v4;
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%{public}@: Shared Photo Stream is disabled for person ID %@. Not creating power budget.", (uint8_t *)&v12, 0x16u);
      }
      goto LABEL_11;
    }
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v12 = 138543618;
    v13 = self;
    __int16 v14 = 2112;
    id v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%{public}@: Creating power budget object for person ID %@", (uint8_t *)&v12, 0x16u);
  }
  id v6 = objc_alloc_init((Class)MSPowerBudget);
  __int16 v9 = [(MSIOSAlbumSharingDaemon *)self personIDToPowerBudgetMap];
  [v9 setObject:v6 forKey:v4];

  [v6 setPersonID:v4];
  [v6 setDelegate:self];
  [(MSIOSAlbumSharingDaemon *)self _readPowerBudgetParametersForPersonID:v4];
  id v10 = +[MSBatteryPowerMonitor defaultMonitor];
  LODWORD(v9) = [v10 isExternalPowerConnected];

  if (v9) {
    [v6 didBeginExternalPower];
  }
LABEL_12:

  return v6;
}

- (NSMutableDictionary)personIDToPowerBudgetMap
{
  personIDToPowerBudgetMap = self->_personIDToPowerBudgetMap;
  if (!personIDToPowerBudgetMap)
  {
    id v4 = +[NSMutableDictionary dictionary];
    v5 = self->_personIDToPowerBudgetMap;
    self->_personIDToPowerBudgetMap = v4;

    personIDToPowerBudgetMap = self->_personIDToPowerBudgetMap;
  }

  return personIDToPowerBudgetMap;
}

- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4
{
  id v5 = a4;
  [(MSIOSAlbumSharingDaemon *)self retainBusy];
  id v6 = [v5 topic];
  int v7 = [v5 userInfo];

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412546;
    v13 = v6;
    __int16 v14 = 2112;
    id v15 = v7;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Received new push notification topic: %@ userInfo: %@", (uint8_t *)&v12, 0x16u);
  }
  if ([(MSIOSAlbumSharingDaemon *)v6 isEqualToString:@"com.apple.sharedstreams"])
  {
    uint64_t v8 = [v7 objectForKey:@"r"];
LABEL_7:
    id v11 = (void *)v8;
    [(MSIOSAlbumSharingDaemon *)self pollForSubscriptionUpdatesTriggeredByPushNotificationForPersonID:v8];

    goto LABEL_10;
  }
  __int16 v9 = [@"com.apple.icloud-container." stringByAppendingString:@"com.apple.sharedstreams"];
  unsigned int v10 = [(MSIOSAlbumSharingDaemon *)v6 isEqualToString:v9];

  if (v10)
  {
    uint64_t v8 = [(MSIOSAlbumSharingDaemon *)self personIDListeningToPushNotification];
    goto LABEL_7;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    int v12 = 138543362;
    v13 = self;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%{public}@: Received unknown push notification, ignoring", (uint8_t *)&v12, 0xCu);
  }
LABEL_10:
  [(MSIOSAlbumSharingDaemon *)self releaseBusy];
}

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  id v5 = a4;
  [(MSIOSAlbumSharingDaemon *)self retainBusy];
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)int v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Received new push token.", v7, 2u);
  }
  id v6 = +[MSMSPlatform thePlatform];
  [v6 setPushToken:v5];

  [(MSIOSAlbumSharingDaemon *)self releaseBusy];
}

- (void)_updatePushNotificationTopicsOutListenToProduction:(BOOL *)a3 outListenToDevelopment:(BOOL *)a4
{
  int v7 = [(MSIOSAlbumSharingDaemon *)self personIDListeningToPushNotification];
  if ([v7 length])
  {
    uint64_t v8 = MSASPlatform();
    unsigned __int8 v9 = [v8 personIDUsesProductionPushEnvironment:v7];

    char v10 = v9 ^ 1;
    if (!a4) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v11 = 138543362;
    int v12 = self;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%{public}@: Not listening to push notifications.", (uint8_t *)&v11, 0xCu);
  }
  [self->_prodAPSConnection _setEnabledTopics:0];
  [self->_devAPSConnection _setEnabledTopics:0];
  char v10 = 0;
  unsigned __int8 v9 = 0;
  if (a4) {
LABEL_3:
  }
    *a4 = v10;
LABEL_4:
  if (a3) {
    *a3 = v9;
  }
}

- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  __int16 v14 = (void *)IDSCopyRawAddressForDestination();
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138544642;
    v22 = self;
    __int16 v23 = 2112;
    id v24 = v12;
    __int16 v25 = 2114;
    id v26 = v10;
    __int16 v27 = 2112;
    id v28 = v11;
    __int16 v29 = 2112;
    id v30 = v13;
    __int16 v31 = 2112;
    v32 = v14;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%{public}@: Received incoming message %@ for service %{public}@ account %@ from %@ (%@)", buf, 0x3Eu);
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100009EE0;
  block[3] = &unk_100018B20;
  id v18 = v12;
  id v19 = v14;
  v20 = self;
  id v15 = v14;
  id v16 = v12;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)XPCNSServiceListener:(id)a3 didReceiveNewConnection:(id)a4
{
  id v5 = a4;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v7 = 138543618;
    uint64_t v8 = self;
    __int16 v9 = 2114;
    id v10 = v5;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%{public}@ Client connected: %{public}@", (uint8_t *)&v7, 0x16u);
  }
  id v6 = objc_alloc_init(MSMSASServiceConnection);
  [v5 setDelegate:v6];
  [v5 setContext:v6];
}

- (BOOL)XPCNSServiceListener:(id)a3 shouldReceiveNewConnection:(id)a4
{
  id v5 = (_xpc_connection_s *)a4;
  long long v19 = 0u;
  long long v20 = 0u;
  xpc_connection_get_audit_token();
  memset(&token, 0, sizeof(token));
  id v6 = SecTaskCreateWithAuditToken(0, &token);
  if (!v6)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      pid_t pid = xpc_connection_get_pid(v5);
      token.val[0] = 138543618;
      *(void *)&token.val[1] = self;
      LOWORD(token.val[3]) = 1024;
      *(unsigned int *)((char *)&token.val[3] + 2) = pid;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%{public}@: Failed to create security task from audit token for pid %d", (uint8_t *)&token, 0x12u);
    }
    goto LABEL_15;
  }
  int v7 = v6;
  CFErrorRef error = 0;
  CFTypeRef v8 = SecTaskCopyValueForEntitlement(v6, @"com.apple.mediastream.mstreamd-access", &error);
  __int16 v9 = v8;
  CFErrorRef v10 = error;
  if (error)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      pid_t v17 = xpc_connection_get_pid(v5);
      token.val[0] = 138543618;
      *(void *)&token.val[1] = self;
      LOWORD(token.val[3]) = 1024;
      *(unsigned int *)((char *)&token.val[3] + 2) = v17;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%{public}@: Failed to get entitlement for pid %d", (uint8_t *)&token, 0x12u);
      CFErrorRef v10 = error;
    }
    CFRelease(v10);
    if (!v9) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  if (!v8)
  {
LABEL_14:
    CFRelease(v7);
    goto LABEL_15;
  }
  CFTypeID v12 = CFGetTypeID(v8);
  if (v12 != CFBooleanGetTypeID())
  {
LABEL_13:
    CFRelease(v9);
    goto LABEL_14;
  }
  int Value = CFBooleanGetValue((CFBooleanRef)v9);
  CFRelease(v9);
  CFRelease(v7);
  if (Value)
  {
    BOOL v14 = 1;
    goto LABEL_18;
  }
LABEL_15:
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    pid_t v16 = xpc_connection_get_pid(v5);
    token.val[0] = 138543618;
    *(void *)&token.val[1] = self;
    LOWORD(token.val[3]) = 1024;
    *(unsigned int *)((char *)&token.val[3] + 2) = v16;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%{public}@: Rejecting incoming connection from pid %d lacking of the correct entitlement.", (uint8_t *)&token, 0x12u);
  }
  BOOL v14 = 0;
LABEL_18:

  return v14;
}

- (void)shutDownCompletionBlock:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000E6B4;
  v4[3] = &unk_100018AF8;
  v4[4] = self;
  id v5 = a3;
  id v3 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
}

- (void)sendServerSideConfigurationDidChangeNotificationForPersonID:(id)a3
{
  id v4 = (void *)kMSASServerSideConfigDidChangeNotification;
  id v5 = a3;
  notify_post((const char *)[v4 UTF8String]);
  v6.receiver = self;
  v6.super_class = (Class)MSIOSAlbumSharingDaemon;
  [(MSIOSAlbumSharingDaemon *)&v6 sendServerSideConfigurationDidChangeNotificationForPersonID:v5];
}

- (void)start
{
  [(MSIOSAlbumSharingDaemon *)self retainBusy];
  if (!self->_serviceListener)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Shared Streams daemon starting.", buf, 2u);
    }
    id v3 = objc_alloc((Class)XPCNSServiceListener);
    id v4 = (XPCNSServiceListener *)[v3 initWithServiceName:kMSASServiceName queue:&_dispatch_main_q delegate:self];
    serviceListener = self->_serviceListener;
    self->_serviceListener = v4;

    [(XPCNSServiceListener *)self->_serviceListener start];
  }
  id v6 = objc_alloc((Class)APSConnection);
  int v7 = (APSConnection *)[v6 initWithEnvironmentName:APSEnvironmentProduction namedDelegatePort:@"com.apple.mediastream.mstreamd.sharing.push-prod" queue:&_dispatch_main_q];
  prodAPSConnection = self->_prodAPSConnection;
  self->_prodAPSConnection = v7;

  id v9 = objc_alloc((Class)APSConnection);
  CFErrorRef v10 = (APSConnection *)[v9 initWithEnvironmentName:APSEnvironmentDevelopment namedDelegatePort:@"com.apple.mediastream.mstreamd.sharing.push-dev" queue:&_dispatch_main_q];
  devAPSConnection = self->_devAPSConnection;
  self->_devAPSConnection = v10;

  __int16 v49 = 0;
  [(MSIOSAlbumSharingDaemon *)self _updatePushNotificationTopicsOutListenToProduction:(char *)&v49 + 1 outListenToDevelopment:&v49];
  if (HIBYTE(v49))
  {
    CFTypeID v12 = self->_prodAPSConnection;
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO)) {
      goto LABEL_12;
    }
    *(_DWORD *)buf = 138543362;
    v51 = self;
    id v13 = "%{public}@: Listening to prod push notifications.";
    goto LABEL_11;
  }
  if ((_BYTE)v49)
  {
    CFTypeID v12 = self->_devAPSConnection;
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO)) {
      goto LABEL_12;
    }
    *(_DWORD *)buf = 138543362;
    v51 = self;
    id v13 = "%{public}@: Listening to dev push notifications.";
LABEL_11:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, v13, buf, 0xCu);
LABEL_12:
    if (v12)
    {
      [(APSConnection *)v12 setDelegate:self];
      v54[0] = @"com.apple.sharedstreams";
      BOOL v14 = objc_msgSend(@"com.apple.icloud-container.", "stringByAppendingString:");
      v54[1] = v14;
      id v15 = +[NSArray arrayWithObjects:v54 count:2];
      [(APSConnection *)v12 _setEnabledTopics:v15];

      pid_t v16 = [(APSConnection *)v12 publicToken];
      pid_t v17 = +[MSMSPlatform thePlatform];
      [v17 setPushToken:v16];

      if (v16)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
        {
          CFStringRef v18 = @"Prod";
          if (!HIBYTE(v49)) {
            CFStringRef v18 = @"Dev";
          }
          *(_DWORD *)buf = 138543618;
          v51 = self;
          __int16 v52 = 2114;
          CFStringRef v53 = v18;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%{public}@: Retrieved push tokens. %{public}@", buf, 0x16u);
        }
      }
      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          CFStringRef v19 = @"Prod";
          if (!HIBYTE(v49)) {
            CFStringRef v19 = @"Dev";
          }
          *(_DWORD *)buf = 138543618;
          v51 = self;
          __int16 v52 = 2112;
          CFStringRef v53 = v19;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%{public}@: Push tokens not available. %@. Waiting...", buf, 0x16u);
        }
        long long v20 = +[NSDate dateWithTimeIntervalSinceNow:5.0];
        do
        {
          v21 = +[NSDate date];
          [v21 timeIntervalSinceDate:v20];
          BOOL v23 = v22 < 0.0;

          if (!v23) {
            break;
          }
          id v24 = +[NSRunLoop currentRunLoop];
          unsigned __int8 v25 = [v24 runMode:NSDefaultRunLoopMode beforeDate:v20];
        }
        while ((v25 & 1) != 0);
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v51 = self;
          _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%{public}@: Could not retrieve push token even after waiting for it.", buf, 0xCu);
        }
      }
    }
    goto LABEL_32;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Shared stream not enabled, not listening to any push notifications.", buf, 2u);
  }
  CFTypeID v12 = 0;
LABEL_32:
  objc_initWeak((id *)buf, self);
  id v26 = +[NSNotificationCenter defaultCenter];
  __int16 v27 = +[NSOperationQueue mainQueue];
  v47[0] = _NSConcreteStackBlock;
  v47[1] = 3221225472;
  v47[2] = sub_10000F3C0;
  v47[3] = &unk_100018AA8;
  objc_copyWeak(&v48, (id *)buf);
  id v28 = [v26 addObserverForName:kMSASServerSideConfigDidChangeNotification object:self queue:v27 usingBlock:v47];

  __int16 v29 = +[NSNotificationCenter defaultCenter];
  id v30 = +[NSOperationQueue mainQueue];
  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472;
  v46[2] = sub_10000F440;
  v46[3] = &unk_100018AD0;
  v46[4] = self;
  id v31 = [v29 addObserverForName:kMSBatteryPowerMonitorExternalPowerSourceChangedNotification object:0 queue:v30 usingBlock:v46];

  v32 = +[NSNotificationCenter defaultCenter];
  v33 = +[NSOperationQueue mainQueue];
  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472;
  v45[2] = sub_10000F60C;
  v45[3] = &unk_100018AD0;
  v45[4] = self;
  id v34 = [v32 addObserverForName:kMSPowerBudgetDidBeginAllowingFileTransferNotification object:0 queue:v33 usingBlock:v45];

  v35 = +[NSNotificationCenter defaultCenter];
  v36 = +[NSOperationQueue mainQueue];
  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472;
  v44[2] = sub_10000F614;
  v44[3] = &unk_100018AD0;
  v44[4] = self;
  id v37 = [v35 addObserverForName:kMSPowerBudgetDidEndAllowingFileTransferNotification object:0 queue:v36 usingBlock:v44];

  v38 = +[NSNotificationCenter defaultCenter];
  v39 = +[MSAuthenticationManager sharedManager];
  v40 = +[NSOperationQueue mainQueue];
  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472;
  v43[2] = sub_10000F680;
  v43[3] = &unk_100018AD0;
  v43[4] = self;
  id v41 = [v38 addObserverForName:kMSAuthenticationManagerDidReceiveAuthenticationChangeNotification object:v39 queue:v40 usingBlock:v43];

  [(MSIOSAlbumSharingDaemon *)self releaseBusy];
  v42.receiver = self;
  v42.super_class = (Class)MSIOSAlbumSharingDaemon;
  [(MSIOSAlbumSharingDaemon *)&v42 start];
  objc_destroyWeak(&v48);
  objc_destroyWeak((id *)buf);
}

- (MSIOSAlbumSharingDaemon)init
{
  v7.receiver = self;
  v7.super_class = (Class)MSIOSAlbumSharingDaemon;
  v2 = [(MSIOSAlbumSharingDaemon *)&v7 init];
  if (v2)
  {
    id v3 = (IDSService *)[objc_alloc((Class)IDSService) initWithService:@"com.apple.private.alloy.photostream"];
    idsService = v2->_idsService;
    v2->_idsService = v3;

    [(IDSService *)v2->_idsService addDelegate:v2 queue:&_dispatch_main_q];
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      id v5 = [(IDSService *)v2->_idsService accounts];
      *(_DWORD *)buf = 138412290;
      id v9 = v5;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Registered IDS service for %@", buf, 0xCu);
    }
  }
  return v2;
}

@end