@interface SDPairedDeviceAgent
+ (id)sharedAgent;
- (BOOL)_companionLinkConnected;
- (BOOL)_idsHasDefaultDevice;
- (BOOL)hasLongPasscode;
- (BOOL)shouldAcceptNewConnection:(id)a3;
- (SDPairedDeviceAgent)init;
- (SFPowerSource)powerSource;
- (id)_idsActiveDevice;
- (id)_messageFromPowerSource:(id)a3;
- (id)_queueWithFallbackQOS;
- (id)exportedInterface;
- (id)machServiceName;
- (id)remoteObjectInterface;
- (int)lockState;
- (int64_t)wristState;
- (void)_activate;
- (void)_companionLinkDevicesChanged;
- (void)_companionLinkDisable;
- (void)_companionLinkEnable;
- (void)_disablePowerStateMonitor;
- (void)_idsEnsureCoalescersStarted;
- (void)_idsEnsureCoalescersStopped;
- (void)_idsEnsureSynced;
- (void)_idsSendStateUpdate:(id)a3 asWaking:(BOOL)a4;
- (void)_idsTimerInfoFired;
- (void)_idsTimerInfoInvalidate;
- (void)_idsTimerInfoRestart;
- (void)_idsTriggerSync;
- (void)_idsTriggerSyncForAnimation:(BOOL)a3;
- (void)_idsUpdateConnectedState;
- (void)_invalidate;
- (void)_lockStateChanged:(id)a3;
- (void)_lockStateHandleMessage:(id)a3;
- (void)_lockStateUpdate:(int)a3;
- (void)_lowPowerModeChanged;
- (void)_messageHandleAllUpdate:(id)a3;
- (void)_messageHandleDashboardEntry:(id)a3;
- (void)_messageHandleIncomingData:(id)a3;
- (void)_messageHandlePowerSourceUpdate:(id)a3;
- (void)_messageIDAdd:(id)a3;
- (void)_messageIDRemove:(id)a3;
- (void)_nanoRegistryRegisterChangesForDevice:(id)a3;
- (void)_nanoRegistryUnregisterChanges;
- (void)_postPowerStatusNotificationForPowerSource:(id)a3;
- (void)_powerSourceChanged:(id)a3;
- (void)_powerSourceLost:(id)a3;
- (void)_powerSourceUpdatePairedDeviceInfo:(id)a3;
- (void)_setupLockStateMonitor;
- (void)_setupPowerSourceMonitor;
- (void)_setupWristStateMonitor;
- (void)_systemStateRegisterObservers;
- (void)_systemStateUnregisterObservers;
- (void)_testingOnCharger;
- (void)_testingRegisterNotifications;
- (void)_testingUnregisterNotifications;
- (void)_wristStateChanged;
- (void)_wristStateHandleMessage:(id)a3;
- (void)_wristStateUpdate:(int64_t)a3;
- (void)activate;
- (void)connectionEstablished:(id)a3;
- (void)connectionInvalidated:(id)a3;
- (void)initialViewControllerDidAppear;
- (void)initialViewControllerDidDisappear;
- (void)invalidate;
- (void)lowPowerModeChanged:(id)a3;
- (void)requestAnimationDateWithCompletion:(id)a3;
- (void)sendAnimationDate:(id)a3;
- (void)sendDashboardEntryWithName:(id)a3 dict:(id)a4;
- (void)sendDismissUIWithReason:(int64_t)a3;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7 context:(id)a8;
- (void)service:(id)a3 account:(id)a4 incomingUnhandledProtobuf:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)service:(id)a3 connectedDevicesChanged:(id)a4;
- (void)service:(id)a3 devicesChanged:(id)a4;
- (void)service:(id)a3 nearbyDevicesChanged:(id)a4;
- (void)setPowerSource:(id)a3;
- (void)triggerChargingUIWithDismissHandler:(id)a3;
- (void)wristStateChanged:(id)a3;
@end

@implementation SDPairedDeviceAgent

+ (id)sharedAgent
{
  if (qword_10097FB68 != -1) {
    dispatch_once(&qword_10097FB68, &stru_1008CA800);
  }
  v2 = (void *)qword_10097FB70;

  return v2;
}

- (SDPairedDeviceAgent)init
{
  v10.receiver = self;
  v10.super_class = (Class)SDPairedDeviceAgent;
  v2 = [(SDXPCDaemon *)&v10 init];
  if (v2)
  {
    v3 = +[SDNearbyAgent sharedNearbyAgent];
    uint64_t v4 = [v3 sharedNearbyPipe];
    blePipe = v2->_blePipe;
    v2->_blePipe = (SFBLEPipe *)v4;

    v6 = [(SDPairedDeviceAgent *)v2 _queueWithFallbackQOS];
    [(SDXPCDaemon *)v2 setDispatchQueue:v6];

    v7 = (IDSService *)[objc_alloc((Class)IDSService) initWithService:@"com.apple.private.alloy.sharing.paireddevice"];
    idsService = v2->_idsService;
    v2->_idsService = v7;

    v2->_lockStatePairedDevice = -1;
  }
  return v2;
}

- (void)activate
{
  v3 = [(SDXPCDaemon *)self dispatchQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003C47C;
  block[3] = &unk_1008CA4B8;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)_activate
{
  v3 = [(SDXPCDaemon *)self dispatchQueue];
  dispatch_assert_queue_V2(v3);

  uint64_t v4 = charging_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Activate", buf, 2u);
  }

  if (self->_activateCalled)
  {
    v9 = charging_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      objc_super v10 = "Paired device agent already activated";
LABEL_11:
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, v10, buf, 2u);
    }
LABEL_12:

    return;
  }
  if (self->_invalidateCalled)
  {
    v9 = charging_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      objc_super v10 = "Paired device agent activated after invalidate";
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  self->_activateCalled = 1;
  idsService = self->_idsService;
  v6 = [(SDXPCDaemon *)self dispatchQueue];
  [(IDSService *)idsService addDelegate:self queue:v6];

  [(SDPairedDeviceAgent *)self _systemStateRegisterObservers];
  [(SDPairedDeviceAgent *)self _testingRegisterNotifications];
  v12.receiver = self;
  v12.super_class = (Class)SDPairedDeviceAgent;
  [(SDXPCDaemon *)&v12 onqueue_activate];
  dispatch_time_t v7 = dispatch_time(0, 5000000000);
  v8 = [(SDXPCDaemon *)self dispatchQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003C68C;
  block[3] = &unk_1008CA4B8;
  block[4] = self;
  dispatch_after(v7, v8, block);
}

- (void)invalidate
{
  v3 = [(SDXPCDaemon *)self dispatchQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003C71C;
  block[3] = &unk_1008CA4B8;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)_invalidate
{
  v3 = [(SDXPCDaemon *)self dispatchQueue];
  dispatch_assert_queue_V2(v3);

  uint64_t v4 = charging_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Invalidate", buf, 2u);
  }

  if (self->_invalidateCalled)
  {
    v5 = charging_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v6 = "Paired device agent already invalidated";
LABEL_11:
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, v6, buf, 2u);
    }
LABEL_12:

    return;
  }
  if (!self->_activateCalled)
  {
    v5 = charging_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v6 = "Paired device agent invalidated before activate";
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  self->_invalidateCalled = 1;
  [(SDPairedDeviceAgent *)self _idsEnsureCoalescersStopped];
  [(IDSService *)self->_idsService removeDelegate:self];
  [(SDPairedDeviceAgent *)self _systemStateUnregisterObservers];
  v7.receiver = self;
  v7.super_class = (Class)SDPairedDeviceAgent;
  [(SDXPCDaemon *)&v7 onqueue_invalidate];
}

- (id)_queueWithFallbackQOS
{
  v2 = dispatch_queue_attr_make_initially_inactive(0);
  v3 = dispatch_queue_create("com.apple.sharing.PairedDeviceAgent", v2);

  dispatch_set_qos_class_fallback();
  dispatch_activate(v3);

  return v3;
}

- (void)_companionLinkEnable
{
  v3 = (RPCompanionLinkClient *)objc_opt_new();
  companionLinkClient = self->_companionLinkClient;
  self->_companionLinkClient = v3;

  [(RPCompanionLinkClient *)self->_companionLinkClient setControlFlags:32];
  v5 = [(SDXPCDaemon *)self dispatchQueue];
  [(RPCompanionLinkClient *)self->_companionLinkClient setDispatchQueue:v5];

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10003CB08;
  v12[3] = &unk_1008CA828;
  v12[4] = self;
  [(RPCompanionLinkClient *)self->_companionLinkClient setDeviceFoundHandler:v12];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10003CB10;
  v11[3] = &unk_1008CA828;
  v11[4] = self;
  [(RPCompanionLinkClient *)self->_companionLinkClient setDeviceLostHandler:v11];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10003CB18;
  v10[3] = &unk_1008CA850;
  v10[4] = self;
  [(RPCompanionLinkClient *)self->_companionLinkClient setDeviceChangedHandler:v10];
  [(RPCompanionLinkClient *)self->_companionLinkClient setInterruptionHandler:&stru_1008CA870];
  [(RPCompanionLinkClient *)self->_companionLinkClient setInvalidationHandler:&stru_1008CA890];
  v6 = self->_companionLinkClient;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10003CBA8;
  v9[3] = &unk_1008CA5A8;
  v9[4] = self;
  [(RPCompanionLinkClient *)v6 activateWithCompletion:v9];
  objc_super v7 = charging_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Enabling companion link", v8, 2u);
  }
}

- (void)_companionLinkDisable
{
  [(RPCompanionLinkClient *)self->_companionLinkClient invalidate];
  companionLinkClient = self->_companionLinkClient;
  self->_companionLinkClient = 0;
}

- (BOOL)_companionLinkConnected
{
  v3 = charging_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = [(RPCompanionLinkClient *)self->_companionLinkClient activeDevices];
    *(_DWORD *)buf = 138412290;
    v16 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Companion link connected devices %@", buf, 0xCu);
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = [(RPCompanionLinkClient *)self->_companionLinkClient activeDevices];
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v5);
        }
        if ([*(id *)(*((void *)&v10 + 1) + 8 * i) statusFlags])
        {
          LOBYTE(v6) = 1;
          goto LABEL_13;
        }
      }
      id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  return (char)v6;
}

- (void)_companionLinkDevicesChanged
{
  v3 = charging_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Companion link devices changed", v6, 2u);
  }

  if ([(SDPairedDeviceAgent *)self _companionLinkConnected] && self->_chargingUIHandler)
  {
    uint64_t v4 = charging_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100041B60();
    }

    (*((void (**)(void))self->_chargingUIHandler + 2))();
    id chargingUIHandler = self->_chargingUIHandler;
    self->_id chargingUIHandler = 0;
  }
}

- (id)_idsActiveDevice
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = [(IDSService *)self->_idsService devices];
  id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        id v6 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        if ([v6 isActive])
        {
          id v3 = v6;
          goto LABEL_11;
        }
      }
      id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (void)_idsEnsureCoalescersStarted
{
  id v3 = [(SDXPCDaemon *)self dispatchQueue];
  dispatch_assert_queue_V2(v3);

  if (!self->_idsConnectionCoalescer)
  {
    uint64_t v4 = (CUCoalescer *)objc_opt_new();
    idsConnectionCoalescer = self->_idsConnectionCoalescer;
    self->_idsConnectionCoalescer = v4;

    id v6 = [(SDXPCDaemon *)self dispatchQueue];
    [(CUCoalescer *)self->_idsConnectionCoalescer setDispatchQueue:v6];

    [(CUCoalescer *)self->_idsConnectionCoalescer setMinDelay:0.5];
    [(CUCoalescer *)self->_idsConnectionCoalescer setMaxDelay:3.0];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10003D180;
    v11[3] = &unk_1008CA4B8;
    v11[4] = self;
    [(CUCoalescer *)self->_idsConnectionCoalescer setActionHandler:v11];
    [(CUCoalescer *)self->_idsConnectionCoalescer trigger];
  }
  if (!self->_idsSyncCoalescer)
  {
    uint64_t v7 = (CUCoalescer *)objc_opt_new();
    idsSyncCoalescer = self->_idsSyncCoalescer;
    self->_idsSyncCoalescer = v7;

    long long v9 = [(SDXPCDaemon *)self dispatchQueue];
    [(CUCoalescer *)self->_idsSyncCoalescer setDispatchQueue:v9];

    [(CUCoalescer *)self->_idsSyncCoalescer setMinDelay:0.3];
    [(CUCoalescer *)self->_idsSyncCoalescer setMaxDelay:3.0];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10003D1F4;
    v10[3] = &unk_1008CA4B8;
    v10[4] = self;
    [(CUCoalescer *)self->_idsSyncCoalescer setActionHandler:v10];
  }
}

- (void)_idsEnsureCoalescersStopped
{
  [(CUCoalescer *)self->_idsConnectionCoalescer invalidate];
  idsConnectionCoalescer = self->_idsConnectionCoalescer;
  self->_idsConnectionCoalescer = 0;

  [(CUCoalescer *)self->_idsSyncCoalescer invalidate];
  idsSyncCoalescer = self->_idsSyncCoalescer;
  self->_idsSyncCoalescer = 0;
}

- (void)_idsEnsureSynced
{
  id v3 = objc_opt_new();
  uint64_t v4 = [(SDXPCDaemon *)self dispatchQueue];
  dispatch_assert_queue_V2(v4);

  if (!self->_powerSourcePairedDevice || self->_infoRequestForced)
  {
    [v3 setObject:&off_100902640 forKeyedSubscript:@"met"];
    [v3 setObject:&__kCFBooleanTrue forKeyedSubscript:@"rin"];
  }
  if ([v3 count])
  {
    [(SDPairedDeviceAgent *)self _idsSendStateUpdate:v3 asWaking:0];
  }
  else
  {
    v5 = charging_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "No changes skipping sync", v6, 2u);
    }
  }
  self->_infoRequestForced = 0;
}

- (BOOL)_idsHasDefaultDevice
{
  v2 = [(IDSService *)self->_idsService devices];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    id v4 = v3;
    int v5 = 0;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v2);
        }
        v5 |= [*(id *)(*((void *)&v9 + 1) + 8 * i) isDefaultPairedDevice];
      }
      id v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5 & 1;
}

- (void)_idsSendStateUpdate:(id)a3 asWaking:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = +[NSSet setWithObject:IDSDefaultPairedDevice];
  unsigned int v8 = [(SDPairedDeviceAgent *)self _idsHasDefaultDevice];
  long long v9 = objc_opt_new();
  int v29 = 0;
  long long v10 = [(SDXPCDaemon *)self dispatchQueue];
  dispatch_assert_queue_V2(v10);

  long long v11 = charging_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    long long v12 = "no";
    if (v8) {
      long long v12 = "yes";
    }
    *(_DWORD *)buf = 136315138;
    v31 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Default paired device: %s", buf, 0xCu);
  }

  if (v8)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      Data = OPACKEncoderCreateData();
      v14 = [v6 objectForKeyedSubscript:@"met"];
      if (v14)
      {
        v15 = v14;
        id v16 = [objc_alloc((Class)IDSProtobuf) initWithProtobufData:Data type:[v14 unsignedIntegerValue] isResponse:0];
        v17 = +[NSNumber numberWithDouble:IDSMaxMessageTimeout];
        [v9 setObject:v17 forKeyedSubscript:IDSSendMessageOptionTimeoutKey];

        [v9 setObject:@"com.apple.sharing.DeviceStateUpdate" forKeyedSubscript:IDSSendMessageOptionQueueOneIdentifierKey];
        v18 = +[NSNumber numberWithInt:!v4];
        [v9 setObject:v18 forKeyedSubscript:IDSSendMessageOptionNonWakingKey];

        v19 = charging_log();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v31 = (const char *)v6;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Sending state update %@", buf, 0xCu);
        }

        idsService = self->_idsService;
        id v27 = 0;
        id v28 = 0;
        unsigned int v21 = [(IDSService *)idsService sendProtobuf:v16 toDestinations:v7 priority:300 options:v9 identifier:&v28 error:&v27];
        v22 = (char *)v28;
        v23 = v27;
        v24 = charging_log();
        v25 = v24;
        if (v21)
        {
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v31 = v22;
            _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "State update IDS message identifier: %@", buf, 0xCu);
          }
        }
        else if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          sub_100041BC8();
        }

        Data = v23;
      }
      else
      {
        v26 = charging_log();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
          sub_100041B94();
        }
      }
    }
    else
    {
      Data = charging_log();
      if (os_log_type_enabled(Data, OS_LOG_TYPE_FAULT)) {
        sub_100041CA0((uint64_t)v6, Data);
      }
    }
  }
}

- (void)_idsTimerInfoRestart
{
  id v3 = charging_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Restarting IDS info timer", buf, 2u);
  }

  BOOL v4 = [(SDXPCDaemon *)self dispatchQueue];
  dispatch_assert_queue_V2(v4);

  if (!self->_idsInfoTimer)
  {
    int v5 = [(SDXPCDaemon *)self dispatchQueue];
    id v6 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v5);
    idsInfoTimer = self->_idsInfoTimer;
    self->_idsInfoTimer = v6;

    unsigned int v8 = self->_idsInfoTimer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10003DA44;
    handler[3] = &unk_1008CA4B8;
    handler[4] = self;
    dispatch_source_set_event_handler(v8, handler);
    SFDispatchTimerSet();
    dispatch_resume((dispatch_object_t)self->_idsInfoTimer);
  }
  SFDispatchTimerSet();
}

- (void)_idsTimerInfoFired
{
  id v3 = charging_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "IDS info timer fired", v5, 2u);
  }

  BOOL v4 = [(SDXPCDaemon *)self dispatchQueue];
  dispatch_assert_queue_V2(v4);

  self->_infoRequestForced = 1;
  [(SDPairedDeviceAgent *)self _idsTriggerSync];
  [(SDPairedDeviceAgent *)self _idsTimerInfoInvalidate];
}

- (void)_idsTimerInfoInvalidate
{
  id v3 = charging_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Invalidating IDS info timer", v7, 2u);
  }

  BOOL v4 = [(SDXPCDaemon *)self dispatchQueue];
  dispatch_assert_queue_V2(v4);

  idsInfoTimer = self->_idsInfoTimer;
  if (idsInfoTimer)
  {
    dispatch_source_cancel(idsInfoTimer);
    id v6 = self->_idsInfoTimer;
    self->_idsInfoTimer = 0;
  }
}

- (void)_idsTriggerSync
{
}

- (void)_idsTriggerSyncForAnimation:(BOOL)a3
{
  if (!a3)
  {
    animationMessageID = self->_animationMessageID;
    if (animationMessageID)
    {
      int v5 = charging_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v6 = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Clearing message ID", v6, 2u);
      }

      animationMessageID = self->_animationMessageID;
    }
    self->_animationMessageID = 0;
  }
  [(CUCoalescer *)self->_idsSyncCoalescer trigger];
}

- (void)_idsUpdateConnectedState
{
  v2 = self;
  id v3 = [(SDXPCDaemon *)self dispatchQueue];
  dispatch_assert_queue_V2(v3);

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id obj = [(IDSService *)v2->_idsService devices];
  id v4 = [obj countByEnumeratingWithState:&v34 objects:v46 count:16];
  if (v4)
  {
    v31 = v2;
    uint64_t v5 = *(void *)v35;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v35 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        unsigned int v8 = charging_log();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          long long v9 = [v7 uniqueIDOverride];
          if ([v7 isActive]) {
            long long v10 = "yes";
          }
          else {
            long long v10 = "no";
          }
          if ([v7 isConnected]) {
            long long v11 = "yes";
          }
          else {
            long long v11 = "no";
          }
          unsigned int v12 = [v7 isNearby];
          *(_DWORD *)buf = 138413058;
          if (v12) {
            long long v13 = "yes";
          }
          else {
            long long v13 = "no";
          }
          v39 = v9;
          __int16 v40 = 2080;
          v41 = v10;
          __int16 v42 = 2080;
          v43 = v11;
          __int16 v44 = 2080;
          v45 = v13;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Checking connection state for device %@, active %s, connected %s, nearby %s", buf, 0x2Au);
        }
        if ([v7 isActive]
          && (([v7 isConnected] & 1) != 0 || objc_msgSend(v7, "isNearby")))
        {
          id v4 = v7;
          goto LABEL_24;
        }
      }
      id v4 = [obj countByEnumeratingWithState:&v34 objects:v46 count:16];
      if (v4) {
        continue;
      }
      break;
    }
LABEL_24:
    v2 = v31;
  }

  v14 = charging_log();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = [v4 uniqueIDOverride];
    id v16 = [(IDSDevice *)v2->_idsConnectedDevice uniqueIDOverride];
    *(_DWORD *)buf = 138412546;
    v39 = v15;
    __int16 v40 = 2112;
    v41 = v16;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "New connected device ID %@, previous connected device ID %@", buf, 0x16u);
  }
  v17 = [v4 uniqueIDOverride];
  v18 = [(IDSDevice *)v2->_idsConnectedDevice uniqueIDOverride];
  id v19 = v17;
  id v20 = v18;
  if (v19 == v20)
  {

    goto LABEL_44;
  }
  unsigned int v21 = v20;
  if ((v19 == 0) == (v20 != 0))
  {
  }
  else
  {
    unsigned __int8 v22 = [v19 isEqual:v20];

    if (v22)
    {
LABEL_44:
      idsConnectedDevice = charging_log();
      if (os_log_type_enabled(idsConnectedDevice, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, idsConnectedDevice, OS_LOG_TYPE_DEFAULT, "No change for connected IDS device", buf, 2u);
      }
      goto LABEL_42;
    }
  }
  v23 = charging_log();
  BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v24)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Paired device connected", buf, 2u);
    }

    dispatch_time_t v25 = dispatch_time(0, 10000000000);
    v26 = [(SDXPCDaemon *)v2 dispatchQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10003E120;
    block[3] = &unk_1008CA4B8;
    block[4] = v2;
    dispatch_after(v25, v26, block);
  }
  else
  {
    if (v24)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Paired device disconnected, clearing device state", buf, 2u);
    }

    [(SDPairedDeviceAgent *)v2 _lockStateUpdate:0xFFFFFFFFLL];
    powerSourcePairedDevice = v2->_powerSourcePairedDevice;
    if (powerSourcePairedDevice)
    {
      [(SFPowerSource *)powerSourcePairedDevice invalidate];
      [(SDPairedDeviceAgent *)v2 _nanoRegistryUnregisterChanges];
      id v28 = v2->_powerSourcePairedDevice;
      v2->_powerSourcePairedDevice = 0;
    }
    [(SDPairedDeviceAgent *)v2 _wristStateUpdate:0];
  }
  int v29 = (IDSDevice *)v4;
  idsConnectedDevice = v2->_idsConnectedDevice;
  v2->_idsConnectedDevice = v29;
LABEL_42:
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7 context:(id)a8
{
  BOOL v10 = a6;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  id v18 = a8;
  id v19 = [(SDXPCDaemon *)self dispatchQueue];
  dispatch_assert_queue_V2(v19);

  id v20 = charging_log();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v21 = "no";
    int v22 = 138413570;
    id v23 = v14;
    __int16 v24 = 2112;
    if (v10) {
      unsigned int v21 = "yes";
    }
    id v25 = v15;
    __int16 v26 = 2112;
    id v27 = v16;
    __int16 v28 = 2080;
    int v29 = v21;
    __int16 v30 = 2112;
    id v31 = v17;
    __int16 v32 = 2112;
    id v33 = v18;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Sent IDS message (service %@, account %@, identifier %@, success %s, error %@, context %@)", (uint8_t *)&v22, 0x3Eu);
  }
}

- (void)service:(id)a3 account:(id)a4 incomingUnhandledProtobuf:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = [(SDXPCDaemon *)self dispatchQueue];
  dispatch_assert_queue_V2(v17);

  id v18 = charging_log();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    id v19 = [v16 outgoingResponseIdentifier];
    int v21 = 138413314;
    id v22 = v12;
    __int16 v23 = 2112;
    id v24 = v13;
    __int16 v25 = 2112;
    id v26 = v14;
    __int16 v27 = 2112;
    id v28 = v15;
    __int16 v29 = 2112;
    __int16 v30 = v19;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Incoming IDS message (service %@, account %@, protobuf %@, fromID %@, identifier %@)", (uint8_t *)&v21, 0x34u);
  }
  id v20 = [v14 data];
  [(SDPairedDeviceAgent *)self _messageHandleIncomingData:v20];
}

- (void)service:(id)a3 connectedDevicesChanged:(id)a4
{
  id v5 = a3;
  id v6 = charging_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "IDS connected devices changed on service %@", (uint8_t *)&v7, 0xCu);
  }

  [(CUCoalescer *)self->_idsConnectionCoalescer trigger];
}

- (void)service:(id)a3 devicesChanged:(id)a4
{
  id v5 = a3;
  id v6 = charging_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "IDS devices changed on service %@", (uint8_t *)&v7, 0xCu);
  }

  [(CUCoalescer *)self->_idsConnectionCoalescer trigger];
}

- (void)service:(id)a3 nearbyDevicesChanged:(id)a4
{
  id v5 = a3;
  id v6 = charging_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "IDS nearby devices changed on service %@", (uint8_t *)&v7, 0xCu);
  }

  [(CUCoalescer *)self->_idsConnectionCoalescer trigger];
}

- (int)lockState
{
  return self->_lockStatePairedDevice;
}

- (void)_lockStateChanged:(id)a3
{
  id v4 = charging_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_100041D38();
  }

  id v5 = [(SDXPCDaemon *)self dispatchQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003E794;
  block[3] = &unk_1008CA4B8;
  block[4] = self;
  dispatch_async(v5, block);
}

- (void)_lockStateHandleMessage:(id)a3
{
  id v4 = a3;
  id v5 = [(SDXPCDaemon *)self dispatchQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [v4 objectForKeyedSubscript:@"lst"];

  if (v6)
  {
    id v7 = [v6 intValue];
    if ((v7 & 0x80000000) != 0)
    {
      id v8 = charging_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long v9 = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Invalid lock state in update", v9, 2u);
      }
    }
    else
    {
      [(SDPairedDeviceAgent *)self _lockStateUpdate:v7];
    }
  }
}

- (void)_lockStateUpdate:(int)a3
{
  id v5 = [(SDXPCDaemon *)self dispatchQueue];
  dispatch_assert_queue_V2(v5);

  int lockStatePairedDevice = self->_lockStatePairedDevice;
  self->_int lockStatePairedDevice = a3;
  if (lockStatePairedDevice != a3)
  {
    id v7 = +[SDStatusMonitor sharedMonitor];
    [v7 updatePairedWatchLockState:self->_lockStatePairedDevice];
  }
}

- (void)_messageHandleIncomingData:(id)a3
{
  id v4 = a3;
  int v12 = 0;
  id v5 = [(SDXPCDaemon *)self dispatchQueue];
  dispatch_assert_queue_V2(v5);

  if (v4)
  {
    id v6 = (__CFString *)OPACKDecodeData();
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = [(__CFString *)v6 objectForKeyedSubscript:@"met"];
      if (v7)
      {
        id v8 = v7;
        id v9 = [v7 integerValue];
        if (v9 == (id)5)
        {
          [(SDPairedDeviceAgent *)self _messageHandleDashboardEntry:v6];
        }
        else if (v9 == (id)4)
        {
          [(SDPairedDeviceAgent *)self _messageHandlePowerSourceUpdate:v6];
        }
        else if (v9 == (id)1)
        {
          [(SDPairedDeviceAgent *)self _messageHandleAllUpdate:v6];
        }
        goto LABEL_10;
      }
      long long v11 = charging_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_100041DA0();
      }
    }
    else
    {
      long long v11 = charging_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
        sub_100041E08(v6, v11);
      }
    }

    id v8 = 0;
    goto LABEL_10;
  }
  BOOL v10 = charging_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    sub_100041D6C();
  }

  id v8 = 0;
  id v6 = 0;
LABEL_10:
}

- (void)_messageHandleAllUpdate:(id)a3
{
  id v4 = a3;
  id v5 = [v4 objectForKeyedSubscript:@"pad"];
  id v6 = [v4 objectForKeyedSubscript:@"rin"];
  unsigned int v7 = [v6 BOOLValue];

  id v8 = charging_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412290;
    id v14 = v4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Updating all values: %@", (uint8_t *)&v13, 0xCu);
  }

  id v9 = [(SDXPCDaemon *)self dispatchQueue];
  dispatch_assert_queue_V2(v9);

  if (!self->_animationDateReceived || (objc_msgSend(v5, "timeIntervalSinceDate:"), v10 > 0.0))
  {
    long long v11 = charging_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412290;
      id v14 = v5;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Animation date received over IDS: %@", (uint8_t *)&v13, 0xCu);
    }

    objc_storeStrong((id *)&self->_animationDateReceived, v5);
  }
  [(SDPairedDeviceAgent *)self _idsTimerInfoInvalidate];
  [(SDPairedDeviceAgent *)self _lockStateHandleMessage:v4];
  [(SDPairedDeviceAgent *)self _powerSourceUpdatePairedDeviceInfo:v4];
  [(SDPairedDeviceAgent *)self _wristStateHandleMessage:v4];
  if (v7)
  {
    int v12 = charging_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13) = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Sending update for request", (uint8_t *)&v13, 2u);
    }

    [(SDPairedDeviceAgent *)self _idsTriggerSync];
  }
}

- (void)_messageHandlePowerSourceUpdate:(id)a3
{
  id v4 = a3;
  id v5 = charging_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Power source update: %@", (uint8_t *)&v7, 0xCu);
  }

  id v6 = [(SDXPCDaemon *)self dispatchQueue];
  dispatch_assert_queue_V2(v6);

  [(SDPairedDeviceAgent *)self _idsTimerInfoInvalidate];
  [(SDPairedDeviceAgent *)self _powerSourceUpdatePairedDeviceInfo:v4];
}

- (void)_messageHandleDashboardEntry:(id)a3
{
  id v4 = a3;
  id v5 = charging_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = NSPrintF();
    *(_DWORD *)buf = 138412290;
    int v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Dashboard entry: %@", buf, 0xCu);
  }
  int v7 = [(SDXPCDaemon *)self dispatchQueue];
  dispatch_assert_queue_V2(v7);

  id v8 = [v4 objectForKeyedSubscript:@"dae"];
  id v9 = [v8 objectForKeyedSubscript:@"dan"];

  if (v9)
  {
    double v10 = [v4 objectForKeyedSubscript:@"dae"];
    long long v11 = [v10 objectForKeyedSubscript:@"dad"];

    if (v11)
    {
      SFMetricsLog();
    }
    else
    {
      long long v11 = charging_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_100041F88();
      }
    }
  }
  else
  {
    long long v11 = charging_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100041F54();
    }
  }
}

- (id)_messageFromPowerSource:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  [v4 setObject:&__kCFBooleanTrue forKeyedSubscript:@"pis"];
  id v5 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v3 adapterFamilyCode]);
  [v4 setObject:v5 forKeyedSubscript:@"pat"];

  [v3 chargeLevel];
  id v6 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [v4 setObject:v6 forKeyedSubscript:@"pcl"];

  int v7 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 charging]);
  [v4 setObject:v7 forKeyedSubscript:@"pic"];

  id v8 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v3 adapterSourceID]);
  [v4 setObject:v8 forKeyedSubscript:@"pmd"];

  [v3 maxCapacity];
  id v9 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [v4 setObject:v9 forKeyedSubscript:@"pmx"];

  double v10 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 adapterSharedSource]);
  [v4 setObject:v10 forKeyedSubscript:@"pss"];

  id v11 = [v3 temperature];
  int v12 = +[NSNumber numberWithInteger:v11];
  [v4 setObject:v12 forKeyedSubscript:@"ptm"];

  return v4;
}

- (void)_messageIDAdd:(id)a3
{
  id v4 = a3;
  messageIDs = self->_messageIDs;
  if (!messageIDs)
  {
    id v6 = (NSMutableArray *)objc_opt_new();
    int v7 = self->_messageIDs;
    self->_messageIDs = v6;

    messageIDs = self->_messageIDs;
  }
  [(NSMutableArray *)messageIDs addObject:v4];
  id v8 = charging_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v4 unsignedLongValue];
    id v10 = [(NSMutableArray *)self->_messageIDs count];
    int v11 = 134218240;
    id v12 = v9;
    __int16 v13 = 2048;
    id v14 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Added message ID: %lu count: %ld", (uint8_t *)&v11, 0x16u);
  }

  if ((unint64_t)[(NSMutableArray *)self->_messageIDs count] >= 0x15)
  {
    do
      [(NSMutableArray *)self->_messageIDs removeObjectAtIndex:0];
    while ((unint64_t)[(NSMutableArray *)self->_messageIDs count] > 0x14);
  }
}

- (void)_messageIDRemove:(id)a3
{
  id v4 = a3;
  if (([(NSMutableArray *)self->_messageIDs containsObject:v4] & 1) == 0)
  {
    id v5 = charging_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100041FBC(v4, v5);
    }
  }
  [(NSMutableArray *)self->_messageIDs removeObject:v4];
  id v6 = charging_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [v4 unsignedLongValue];
    id v8 = [(NSMutableArray *)self->_messageIDs count];
    int v9 = 134218240;
    id v10 = v7;
    __int16 v11 = 2048;
    id v12 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Removed message ID: %lu, count: %ld", (uint8_t *)&v9, 0x16u);
  }
}

- (void)_nanoRegistryRegisterChangesForDevice:(id)a3
{
  id v4 = a3;
  id v5 = [v4 valueForProperty:NRDevicePropertyPairingID];
  if (!v5)
  {
    id v14 = charging_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_100042044(v14, v15, v16, v17, v18, v19, v20, v21);
    }
    goto LABEL_13;
  }
  nrRegisteredDevices = self->_nrRegisteredDevices;
  if (!nrRegisteredDevices)
  {
    id v7 = (NSMutableDictionary *)objc_opt_new();
    id v8 = self->_nrRegisteredDevices;
    self->_nrRegisteredDevices = v7;

    nrRegisteredDevices = self->_nrRegisteredDevices;
  }
  int v9 = [(NSMutableDictionary *)nrRegisteredDevices allKeys];
  unsigned int v10 = [v9 containsObject:v5];

  if (v10)
  {
    id v14 = charging_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      __int16 v25 = v5;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Already registered %@", buf, 0xCu);
    }
LABEL_13:

    goto LABEL_8;
  }
  [(SDPairedDeviceAgent *)self _nanoRegistryUnregisterChanges];
  __int16 v11 = charging_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    powerSourcePairedDevice = self->_powerSourcePairedDevice;
    *(_DWORD *)buf = 138412290;
    __int16 v25 = powerSourcePairedDevice;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Registered for name change for %@", buf, 0xCu);
  }

  uint64_t v23 = NRDevicePropertyName;
  __int16 v13 = +[NSArray arrayWithObjects:&v23 count:1];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10003F624;
  v22[3] = &unk_1008CA8B8;
  v22[4] = self;
  [v4 registerForPropertyChanges:v13 withBlock:v22];

  [(NSMutableDictionary *)self->_nrRegisteredDevices setObject:v4 forKeyedSubscript:v5];
LABEL_8:
}

- (void)_nanoRegistryUnregisterChanges
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = [(NSMutableDictionary *)self->_nrRegisteredDevices allValues];
  id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * (void)v7) unregisterForPropertyChanges:0 withBlock:0];
        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  [(NSMutableDictionary *)self->_nrRegisteredDevices removeAllObjects];
  id v8 = charging_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Unregistered for name changes", v9, 2u);
  }
}

- (SFPowerSource)powerSource
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = v2->_powerSource;
  objc_sync_exit(v2);

  return v3;
}

- (void)_powerSourceChanged:(id)a3
{
  id v5 = a3;
  unsigned int v6 = [(SDPairedDeviceAgent *)self _companionLinkConnected];
  id v7 = [(SDXPCDaemon *)self dispatchQueue];
  dispatch_assert_queue_V2(v7);

  id v8 = [v5 type];
  unsigned int v9 = [v8 isEqualToString:@"InternalBattery"];

  if (v9)
  {
    long long v10 = charging_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = [v5 detailedDescription];
      long long v12 = (void *)v11;
      long long v13 = "no";
      *(_DWORD *)id v26 = 138412802;
      *(void *)&v26[4] = v5;
      if (v6) {
        long long v13 = "yes";
      }
      *(_WORD *)&v26[12] = 2112;
      *(void *)&v26[14] = v11;
      __int16 v27 = 2080;
      id v28 = v13;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Local power source updated %@, IOPS details %@ link connected %s", v26, 0x20u);
    }
    if (([v5 charging] & 1) == 0)
    {
      if (self->_chargingUIHandler)
      {
        id v14 = charging_log();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)id v26 = 0;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Device went off charger while waiting for UI reply", v26, 2u);
        }

        (*((void (**)(void))self->_chargingUIHandler + 2))();
        id chargingUIHandler = self->_chargingUIHandler;
        self->_id chargingUIHandler = 0;
      }
      animationDateToSend = self->_animationDateToSend;
      self->_animationDateToSend = 0;

      animationDateForIDS = self->_animationDateForIDS;
      self->_animationDateForIDS = 0;
    }
    -[SDPairedDeviceAgent _messageFromPowerSource:](self, "_messageFromPowerSource:", v5, *(_OWORD *)v26);
    uint64_t v18 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    powerSourceMessage = self->_powerSourceMessage;
    if (powerSourceMessage && [(NSDictionary *)powerSourceMessage isEqualToDictionary:v18])
    {
      __int16 v25 = charging_log();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v26 = 0;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Power source values we care about didn't change", v26, 2u);
      }
    }
    else
    {
      p_powerSourceLocal = &self->_powerSourceLocal;
      objc_storeStrong((id *)&self->_powerSourceLocal, a3);
      uint64_t v21 = self;
      objc_sync_enter(v21);
      objc_storeStrong((id *)&v21->_powerSource, self->_powerSourceLocal);
      objc_sync_exit(v21);

      id v22 = self->_powerSourceMessage;
      self->_powerSourceMessage = v18;
      uint64_t v23 = v18;

      v21->_powerSourceWasCharging = [v5 charging];
      id v24 = +[SDStatusMonitor sharedMonitor];
      [v24 updateLocalPowerSource:*p_powerSourceLocal];

      [(SDPairedDeviceAgent *)v21 _idsTriggerSyncForAnimation:0];
    }
  }
}

- (void)_powerSourceLost:(id)a3
{
  id v4 = a3;
  id v5 = [(SDXPCDaemon *)self dispatchQueue];
  dispatch_assert_queue_V2(v5);

  unsigned int v6 = [v4 type];

  LODWORD(v4) = [v6 isEqualToString:@"InternalBattery"];
  if (v4)
  {
    id v7 = charging_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Internal power source lost", v10, 2u);
    }

    powerSourceLocal = self->_powerSourceLocal;
    self->_powerSourceLocal = 0;

    powerSourceMessage = self->_powerSourceMessage;
    self->_powerSourceMessage = 0;

    self->_powerSourceWasCharging = 0;
  }
}

- (void)_powerSourceUpdatePairedDeviceInfo:(id)a3
{
  id v4 = a3;
  id v5 = +[NRPairedDeviceRegistry sharedInstance];
  unsigned int v6 = [v5 getActivePairedDevice];

  id v7 = [v4 objectForKeyedSubscript:@"pat"];
  unsigned int v8 = [v7 intValue];

  unsigned int v9 = [v4 objectForKeyedSubscript:@"pcl"];
  [v9 doubleValue];
  double v11 = v10;

  long long v12 = [v4 objectForKeyedSubscript:@"pic"];
  unsigned int v57 = [v12 BOOLValue];

  long long v13 = [v4 objectForKeyedSubscript:@"pmx"];
  [v13 doubleValue];
  double v15 = v14;

  uint64_t v16 = [v4 objectForKeyedSubscript:@"pss"];
  id v17 = [v16 BOOLValue];

  uint64_t v18 = [v4 objectForKeyedSubscript:@"pmd"];
  id v19 = [v18 integerValue];

  uint64_t v20 = [v4 objectForKeyedSubscript:@"ptm"];
  id v21 = [v20 integerValue];

  id v22 = [v4 objectForKeyedSubscript:@"pml"];
  unsigned int v23 = [v22 BOOLValue];

  id v24 = [v4 objectForKeyedSubscript:@"lpm"];
  id v25 = [v24 BOOLValue];

  id v26 = [(SDXPCDaemon *)self dispatchQueue];
  dispatch_assert_queue_V2(v26);

  __int16 v27 = [v4 objectForKeyedSubscript:@"pis"];
  id v28 = v27;
  if (!v27)
  {
    __int16 v29 = charging_log();
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_25;
    }
    *(_WORD *)buf = 0;
    v48 = "Update missing power info set number";
    goto LABEL_30;
  }
  if (([v27 BOOLValue] & 1) == 0)
  {
    __int16 v29 = charging_log();
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_25;
    }
    *(_WORD *)buf = 0;
    v48 = "Power info not set in update";
LABEL_30:
    v49 = v29;
    uint32_t v50 = 2;
    goto LABEL_33;
  }
  signed int v55 = v8;
  if (!sub_1000D9060(@"EnableWatchUI", 1))
  {
    __int16 v29 = charging_log();
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_25;
    }
    *(_DWORD *)buf = 67109120;
    LODWORD(v59) = v55;
    v48 = "Suppressing watch power source %d";
    v49 = v29;
    uint32_t v50 = 8;
LABEL_33:
    _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, v48, buf, v50);
    goto LABEL_25;
  }
  __int16 v29 = [v4 objectForKeyedSubscript:@"pai"];
  if ([(NSMutableArray *)self->_messageIDs containsObject:v29])
  {
    [(SDPairedDeviceAgent *)self _messageIDRemove:v29];
    __int16 v30 = charging_log();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      CFStringRef v59 = (const __CFString *)[v29 unsignedLongValue];
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Duping messages, not updating: %lu", buf, 0xCu);
    }
  }
  else
  {
    id v52 = v21;
    id v31 = v17;
    v54 = v28;
    if (v29) {
      [(SDPairedDeviceAgent *)self _messageIDAdd:v29];
    }
    __int16 v32 = [v6 valueForProperty:_NRDevicePropertyBluetoothIdentifier];
    unsigned int v51 = [(SFPowerSource *)self->_powerSourcePairedDevice charging];
    id v33 = v6;
    powerSourcePairedDevice = self->_powerSourcePairedDevice;
    long long v35 = powerSourcePairedDevice;
    if (!powerSourcePairedDevice)
    {
      long long v36 = (SFPowerSource *)objc_opt_new();
      long long v37 = self->_powerSourcePairedDevice;
      self->_powerSourcePairedDevice = v36;

      long long v35 = self->_powerSourcePairedDevice;
    }
    [(SFPowerSource *)v35 setAccessoryCategory:@"Watch"];
    [(SFPowerSource *)self->_powerSourcePairedDevice setLowWarnLevel:10.0];
    [(SFPowerSource *)self->_powerSourcePairedDevice setLowPowerModeEnabled:v25];
    v53 = v32;
    v38 = [v32 UUIDString];
    [(SFPowerSource *)self->_powerSourcePairedDevice setAccessoryID:v38];

    [(SFPowerSource *)self->_powerSourcePairedDevice setAdapterFamilyCode:v55];
    [(SFPowerSource *)self->_powerSourcePairedDevice setAdapterSharedSource:v31];
    [(SFPowerSource *)self->_powerSourcePairedDevice setAdapterSourceID:v19];
    [(SFPowerSource *)self->_powerSourcePairedDevice setCharging:v57];
    [(SFPowerSource *)self->_powerSourcePairedDevice setChargeLevel:v11];
    [(SFPowerSource *)self->_powerSourcePairedDevice setMaxCapacity:v15];
    [(SFPowerSource *)self->_powerSourcePairedDevice setTemperature:v52];
    [(SFPowerSource *)self->_powerSourcePairedDevice setType:@"Accessory Source"];
    if (v57) {
      CFStringRef v39 = @"AC Power";
    }
    else {
      CFStringRef v39 = @"Battery Power";
    }
    [(SFPowerSource *)self->_powerSourcePairedDevice setState:v39];
    [(SFPowerSource *)self->_powerSourcePairedDevice setTransportType:@"Bluetooth"];
    [(SFPowerSource *)self->_powerSourcePairedDevice setVendorID:76];
    v56 = v33;
    __int16 v40 = [v33 valueForProperty:NRDevicePropertyName];
    [(SFPowerSource *)self->_powerSourcePairedDevice setName:v40];

    kdebug_trace();
    unsigned int v41 = [(SFPowerSource *)self->_powerSourcePairedDevice publish];
    __int16 v42 = charging_log();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      if (powerSourcePairedDevice) {
        CFStringRef v43 = @"Updated";
      }
      else {
        CFStringRef v43 = @"Created";
      }
      __int16 v44 = self->_powerSourcePairedDevice;
      uint64_t v45 = [(SFPowerSource *)v44 detailedDescription];
      v46 = (void *)v45;
      *(_DWORD *)buf = 138413314;
      v47 = "no";
      CFStringRef v59 = v43;
      __int16 v60 = 2112;
      if (v57 != v51) {
        v47 = "yes";
      }
      v61 = v44;
      __int16 v62 = 2112;
      uint64_t v63 = v45;
      __int16 v64 = 2080;
      v65 = v47;
      __int16 v66 = 1024;
      unsigned int v67 = v41;
      _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "%@ paired device power source %@\n%@charging changed %s, status %x", buf, 0x30u);
    }
    if (v23) {
      [(SDPairedDeviceAgent *)self _postPowerStatusNotificationForPowerSource:self->_powerSourcePairedDevice];
    }
    unsigned int v6 = v56;
    [(SDPairedDeviceAgent *)self _nanoRegistryRegisterChangesForDevice:v56];

    id v28 = v54;
  }
LABEL_25:
}

- (void)_systemStateRegisterObservers
{
  id v3 = [(SDXPCDaemon *)self dispatchQueue];
  dispatch_assert_queue_V2(v3);

  [(SDPairedDeviceAgent *)self _setupPowerSourceMonitor];
}

- (void)_systemStateUnregisterObservers
{
  id v3 = [(SDXPCDaemon *)self dispatchQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self];

  [(SDPairedDeviceAgent *)self _disablePowerStateMonitor];
}

- (void)_setupLockStateMonitor
{
  id v3 = [(SDXPCDaemon *)self dispatchQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 addObserver:self selector:"_lockStateChanged:" name:@"com.apple.sharingd.KeyBagLockStatusChanged" object:0];
}

- (void)_setupPowerSourceMonitor
{
  id v3 = (SFPowerSourceMonitor *)objc_opt_new();
  powerSourceMonitor = self->_powerSourceMonitor;
  self->_powerSourceMonitor = v3;

  [(SFPowerSourceMonitor *)self->_powerSourceMonitor setChangeFlags:0xFFFFFFFFLL];
  id v5 = [(SDXPCDaemon *)self dispatchQueue];
  [(SFPowerSourceMonitor *)self->_powerSourceMonitor setDispatchQueue:v5];

  [(SFPowerSourceMonitor *)self->_powerSourceMonitor setInvalidationHandler:&stru_1008CA8D8];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10004071C;
  v8[3] = &unk_1008CA900;
  v8[4] = self;
  [(SFPowerSourceMonitor *)self->_powerSourceMonitor setPowerSourcesFoundHandler:v8];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10004080C;
  v7[3] = &unk_1008CA928;
  v7[4] = self;
  [(SFPowerSourceMonitor *)self->_powerSourceMonitor setPowerSourcesChangedHandler:v7];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000408FC;
  v6[3] = &unk_1008CA900;
  v6[4] = self;
  [(SFPowerSourceMonitor *)self->_powerSourceMonitor setPowerSourcesLostHandler:v6];
  [(SFPowerSourceMonitor *)self->_powerSourceMonitor activateWithCompletion:&stru_1008CA968];
}

- (void)_setupWristStateMonitor
{
  id v3 = [(SDXPCDaemon *)self dispatchQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 addObserver:self selector:"wristStateChanged:" name:@"com.apple.sharingd.WristStateChanged" object:0];
}

- (void)_disablePowerStateMonitor
{
  id v3 = [(SDXPCDaemon *)self dispatchQueue];
  dispatch_assert_queue_V2(v3);

  [(SFPowerSourceMonitor *)self->_powerSourceMonitor invalidate];
  powerSourceMonitor = self->_powerSourceMonitor;
  self->_powerSourceMonitor = 0;
}

- (void)_testingRegisterNotifications
{
  v2 = [(SDXPCDaemon *)self dispatchQueue];
  dispatch_assert_queue_V2(v2);
}

- (void)_testingUnregisterNotifications
{
  self->_testingChargingToken = 0;
}

- (void)_testingOnCharger
{
  id v3 = charging_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Faking on charger", v5, 2u);
  }

  id v4 = [(SDXPCDaemon *)self dispatchQueue];
  dispatch_assert_queue_V2(v4);
}

- (int64_t)wristState
{
  return self->_wristStatePairedDevice;
}

- (void)wristStateChanged:(id)a3
{
  id v4 = charging_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Wrist state changed", buf, 2u);
  }

  id v5 = [(SDXPCDaemon *)self dispatchQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100040D50;
  block[3] = &unk_1008CA4B8;
  block[4] = self;
  dispatch_async(v5, block);
}

- (void)_wristStateChanged
{
  id v3 = +[SDStatusMonitor sharedMonitor];
  int64_t v4 = (int64_t)[v3 watchWristState];

  int64_t v5 = 2;
  if ((v4 & 0xFFFFFFFFFFFFFFFDLL) != 0) {
    int64_t v5 = v4;
  }
  if (self->_wristStateLocal == v5)
  {
    unsigned int v6 = charging_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Not updating for wrist state change", v7, 2u);
    }
  }
  else
  {
    self->_wristStateLocal = v5;
    [(SDPairedDeviceAgent *)self _idsTriggerSync];
  }
}

- (void)_wristStateHandleMessage:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(SDXPCDaemon *)self dispatchQueue];
  dispatch_assert_queue_V2(v5);

  unsigned int v6 = [v4 objectForKeyedSubscript:@"wst"];

  if (v6)
  {
    unint64_t v7 = (unint64_t)[v6 integerValue];
    if ((v7 & 0x8000000000000000) != 0)
    {
      unsigned int v8 = charging_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)unsigned int v9 = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Invalid wrist state in update", v9, 2u);
      }
    }
    else
    {
      [(SDPairedDeviceAgent *)self _wristStateUpdate:v7];
    }
  }
}

- (void)_wristStateUpdate:(int64_t)a3
{
  int64_t v5 = [(SDXPCDaemon *)self dispatchQueue];
  dispatch_assert_queue_V2(v5);

  int64_t wristStatePairedDevice = self->_wristStatePairedDevice;
  self->_int64_t wristStatePairedDevice = a3;
  if (wristStatePairedDevice != a3)
  {
    id v7 = +[SDStatusMonitor sharedMonitor];
    [v7 updatePairedWatchWristState:self->_wristStatePairedDevice];
  }
}

- (void)lowPowerModeChanged:(id)a3
{
  id v4 = charging_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Low power mode changed", buf, 2u);
  }

  int64_t v5 = [(SDXPCDaemon *)self dispatchQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100041080;
  block[3] = &unk_1008CA4B8;
  block[4] = self;
  dispatch_async(v5, block);
}

- (void)_lowPowerModeChanged
{
  id v3 = +[SDStatusMonitor sharedMonitor];
  unsigned int v4 = [v3 lowPowerModeEnabled];

  if (self->_lowPowerModeLocal == v4)
  {
    int64_t v5 = charging_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unsigned int v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Not updating for low power mode change", v6, 2u);
    }
  }
  else
  {
    self->_lowPowerModeLocal = v4;
    [(SDPairedDeviceAgent *)self _idsTriggerSync];
  }
}

- (id)machServiceName
{
  return @"com.apple.sharingd.paireddevice";
}

- (id)exportedInterface
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___SFPairedDeviceDaemonInterface];
}

- (id)remoteObjectInterface
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___SFPairedDeviceClientInterface];
}

- (BOOL)shouldAcceptNewConnection:(id)a3
{
  return 1;
}

- (void)connectionEstablished:(id)a3
{
  id v3 = a3;
  unsigned int v4 = charging_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int64_t v5 = [v3 sd_description];
    int v6 = 138412290;
    id v7 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Paired device connection established %@", (uint8_t *)&v6, 0xCu);
  }
}

- (void)connectionInvalidated:(id)a3
{
  id v3 = a3;
  unsigned int v4 = charging_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int64_t v5 = [v3 sd_description];
    int v6 = 138412290;
    id v7 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Paired device connection invalidated %@", (uint8_t *)&v6, 0xCu);
  }
}

- (void)initialViewControllerDidAppear
{
  id v3 = [(SDXPCDaemon *)self dispatchQueue];
  dispatch_assert_queue_V2(v3);

  unsigned int v4 = charging_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Initial view controller appeared", v5, 2u);
  }

  self->_uiShowing = 1;
}

- (void)initialViewControllerDidDisappear
{
  id v3 = [(SDXPCDaemon *)self dispatchQueue];
  dispatch_assert_queue_V2(v3);

  unsigned int v4 = charging_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Initial view controller disappeared", v5, 2u);
  }

  self->_uiShowing = 0;
}

- (void)requestAnimationDateWithCompletion:(id)a3
{
}

- (void)sendAnimationDate:(id)a3
{
  id v3 = [(SDXPCDaemon *)self dispatchQueue];
  dispatch_assert_queue_V2(v3);
}

- (void)triggerChargingUIWithDismissHandler:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(SDXPCDaemon *)self dispatchQueue];
  dispatch_assert_queue_V2(v5);

  if ([(SDPairedDeviceAgent *)self _companionLinkConnected])
  {
    id v6 = objc_retainBlock(v4);
    id chargingUIHandler = self->_chargingUIHandler;
    self->_id chargingUIHandler = v6;

    dispatch_time_t v8 = dispatch_time(0, 10000000000);
    unsigned int v9 = [(SDXPCDaemon *)self dispatchQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100041600;
    block[3] = &unk_1008CA4B8;
    block[4] = self;
    dispatch_after(v8, v9, block);
  }
  else
  {
    double v10 = charging_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Companion Link disconnected, dismiss charging UI immediately", buf, 2u);
    }

    (*((void (**)(id, void))v4 + 2))(v4, 0);
  }
}

- (void)sendDismissUIWithReason:(int64_t)a3
{
  id v3 = [(SDXPCDaemon *)self dispatchQueue];
  dispatch_assert_queue_V2(v3);
}

- (void)sendDashboardEntryWithName:(id)a3 dict:(id)a4
{
  v12[0] = @"dan";
  v12[1] = @"dad";
  v13[0] = a3;
  v13[1] = a4;
  id v6 = a4;
  id v7 = a3;
  dispatch_time_t v8 = +[NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2];
  v10[0] = @"met";
  v10[1] = @"dae";
  v11[0] = &off_100902658;
  v11[1] = v8;
  unsigned int v9 = +[NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:2];

  [(SDPairedDeviceAgent *)self _idsSendDashboardEntryToCompanion:v9];
}

- (void)_postPowerStatusNotificationForPowerSource:(id)a3
{
  id v3 = a3;
  id v4 = charging_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Sending response for reason %@", (uint8_t *)&v6, 0xCu);
  }

  int64_t v5 = +[SDPowerChargingStatusNotifier sharedNotifier];
  [v5 notifyBatteryStatus];
}

- (BOOL)hasLongPasscode
{
  return self->_hasLongPasscode;
}

- (void)setPowerSource:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_powerSource, 0);
  objc_storeStrong((id *)&self->_powerSourcePairedDevice, 0);
  objc_storeStrong((id *)&self->_powerSourceMonitor, 0);
  objc_storeStrong((id *)&self->_powerSourceMessage, 0);
  objc_storeStrong((id *)&self->_powerSourceLocal, 0);
  objc_storeStrong((id *)&self->_nrRegisteredDevices, 0);
  objc_storeStrong((id *)&self->_messageIDs, 0);
  objc_storeStrong((id *)&self->_idsInfoTimer, 0);
  objc_storeStrong((id *)&self->_idsSyncCoalescer, 0);
  objc_storeStrong((id *)&self->_idsService, 0);
  objc_storeStrong((id *)&self->_idsConnectedDevice, 0);
  objc_storeStrong((id *)&self->_idsConnectionCoalescer, 0);
  objc_storeStrong(&self->_chargingUIHandler, 0);
  objc_storeStrong((id *)&self->_companionLinkClient, 0);
  objc_storeStrong((id *)&self->_blePipe, 0);
  objc_storeStrong((id *)&self->_animationMessageID, 0);
  objc_storeStrong((id *)&self->_animationDateToSend, 0);
  objc_storeStrong((id *)&self->_animationDateForIDS, 0);

  objc_storeStrong((id *)&self->_animationDateReceived, 0);
}

@end