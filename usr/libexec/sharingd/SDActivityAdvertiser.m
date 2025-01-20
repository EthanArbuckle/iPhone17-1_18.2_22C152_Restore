@interface SDActivityAdvertiser
+ (SDActivityAdvertiser)sharedAdvertiser;
- (BOOL)isAdvertising;
- (BOOL)restart;
- (BOOL)shouldAcceptNewConnection:(id)a3;
- (BOOL)updateAdvertiser;
- (NSString)state;
- (SDActivityAdvertiser)init;
- (id)createAdvertisingInformation;
- (id)encryptedAdvertisingInformation;
- (id)exportedInterface;
- (id)machServiceName;
- (id)remoteObjectInterface;
- (void)_enumerateRemoteObjectProxiesUsingBlock:(id)a3;
- (void)_remoteObjectProxyForConnection:(id)a3 usingBlock:(id)a4;
- (void)activityPayloadForAdvertisementPayload:(id)a3 command:(id)a4 requestedByDevice:(id)a5 withCompletionHandler:(id)a6;
- (void)activityServiceDevicesChanged:(id)a3;
- (void)addObservers;
- (void)advertiseAdvertisementPayload:(id)a3 options:(id)a4 withErrorHandler:(id)a5;
- (void)connectionEstablished:(id)a3;
- (void)connectionInvalidated:(id)a3;
- (void)consoleUserChanged:(id)a3;
- (void)continuity:(id)a3 continuityDidStopAdvertisingOfType:(int64_t)a4 withError:(id)a5;
- (void)continuity:(id)a3 didFailToStartAdvertisingOfType:(int64_t)a4 withError:(id)a5;
- (void)continuity:(id)a3 didStartAdvertisingOfType:(int64_t)a4;
- (void)continuity:(id)a3 didStopAdvertisingOfType:(int64_t)a4;
- (void)continuity:(id)a3 didStopAdvertisingOfType:(int64_t)a4 withError:(id)a5;
- (void)continuityDidUpdateState:(id)a3;
- (void)didSendPayloadForActivityIdentifier:(id)a3 toDevice:(id)a4 error:(id)a5;
- (void)goodbyeTimeoutFired:(id)a3;
- (void)invalidateGoodbyeTimer;
- (void)loginIDWithOptions:(id)a3 completionHandler:(id)a4;
- (void)pairedSFPeerDevicesWithOptions:(id)a3 completionHandler:(id)a4;
- (void)peerForUUID:(id)a3 completionHandler:(id)a4;
- (void)preventIdleSleepAssertion;
- (void)releaseIdleSleepAssertion;
- (void)removeObservers;
- (void)resumeForReason:(id)a3;
- (void)startGoodbyeTimer;
- (void)stop;
- (void)stopForReason:(id)a3;
- (void)systemWillSleep:(id)a3;
@end

@implementation SDActivityAdvertiser

+ (SDActivityAdvertiser)sharedAdvertiser
{
  if (qword_10097FD08 != -1) {
    dispatch_once(&qword_10097FD08, &stru_1008CBC58);
  }
  v2 = (void *)qword_10097FD00;

  return (SDActivityAdvertiser *)v2;
}

- (SDActivityAdvertiser)init
{
  v17.receiver = self;
  v17.super_class = (Class)SDActivityAdvertiser;
  v2 = [(SDActivityController *)&v17 init];
  v3 = v2;
  if (v2)
  {
    goodbyeTimer = v2->_goodbyeTimer;
    v2->_goodbyeTimer = 0;

    advertisementData = v3->_advertisementData;
    v3->_advertisementData = 0;

    v3->_advertisingEnabled = 0;
    v3->_isAdvertising = 0;
    id currentErrorHandler = v3->_currentErrorHandler;
    v3->_id currentErrorHandler = 0;

    currentAdvertisementPayload = v3->_currentAdvertisementPayload;
    v3->_currentAdvertisementPayload = 0;

    currentAdvertisementOptions = v3->_currentAdvertisementOptions;
    v3->_currentAdvertisementOptions = 0;

    v3->_powerAssertionID = 0;
    v3->_powerAssertionClientPID = 0;
    uint64_t v9 = +[SDStatusMonitor sharedMonitor];
    monitor = v3->_monitor;
    v3->_monitor = (SDStatusMonitor *)v9;

    uint64_t v11 = objc_opt_new();
    shouldNotAdvertiseRequesters = v3->_shouldNotAdvertiseRequesters;
    v3->_shouldNotAdvertiseRequesters = (NSMutableSet *)v11;

    v13 = (IDSContinuity *)[objc_alloc((Class)IDSContinuity) initWithDelegate:v3 queue:&_dispatch_main_q];
    continuity = v3->_continuity;
    v3->_continuity = v13;

    v3->_versionByte = sub_1000D9248(@"BluetoothAdvertiseScanVersionByte", 0);
    v3->_goodbyeTimerInterval = (double)sub_1000D9248(@"BluetoothAdvertiseGoodByeDuration", 2);
    [(SDActivityAdvertiser *)v3 addObservers];
    v16.receiver = v3;
    v16.super_class = (Class)SDActivityAdvertiser;
    [(SDXPCDaemon *)&v16 _activate];
  }
  return v3;
}

- (BOOL)restart
{
  currentAdvertisementPayload = self->_currentAdvertisementPayload;
  if (self->_advertisingEnabled
    && [(SDStatusMonitor *)self->_monitor currentConsoleUser]
    && [(IDSContinuity *)self->_continuity state] == (id)3
    && ![(NSMutableSet *)self->_shouldNotAdvertiseRequesters count]
    && [(SDActivityController *)self shouldStart])
  {
    if (!self->_rawAdvertisementData)
    {
      v4 = [(SDActivityAdvertiser *)self encryptedAdvertisingInformation];
      rawAdvertisementData = self->_rawAdvertisementData;
      self->_rawAdvertisementData = v4;
    }
    if (!currentAdvertisementPayload) {
      [(SDActivityAdvertiser *)self startGoodbyeTimer];
    }
    v6 = (OS_os_transaction *)os_transaction_create();
    advertisingTransaction = self->_advertisingTransaction;
    self->_advertisingTransaction = v6;

    v8 = handoff_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = SFAdvertisementDescriptionFromPayloadData();
      SFHexStringForData();
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      currentAdvertisementOptions = self->_currentAdvertisementOptions;
      *(_DWORD *)v24 = 138412802;
      *(void *)&v24[4] = v9;
      __int16 v25 = 2112;
      CFStringRef v26 = v10;
      __int16 v27 = 2112;
      v28 = currentAdvertisementOptions;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Started advertising %@ as %@ with options %@", v24, 0x20u);
    }
    [(SDActivityAdvertiser *)self preventIdleSleepAssertion];
    [(IDSContinuity *)self->_continuity startAdvertisingOfType:0 withData:self->_rawAdvertisementData withOptions:0];
    return 1;
  }
  else
  {
    if (!currentAdvertisementPayload && self->_goodbyeTimer)
    {
      v13 = handoff_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v24 = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Goodbye packet advertising interrupted", v24, 2u);
      }

      [(SDActivityAdvertiser *)self invalidateGoodbyeTimer];
    }
    if (self->_isAdvertising) {
      v14 = @"Stopped";
    }
    else {
      v14 = @"Skipping request for";
    }
    v15 = v14;
    objc_super v16 = handoff_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      if (self->_advertisingEnabled) {
        CFStringRef v17 = @"YES";
      }
      else {
        CFStringRef v17 = @"NO";
      }
      if ([(SDStatusMonitor *)self->_monitor currentConsoleUser]) {
        CFStringRef v18 = @"YES";
      }
      else {
        CFStringRef v18 = @"NO";
      }
      if (((unint64_t)[(IDSContinuity *)self->_continuity state] & 0x8000000000000000) != 0
        || (uint64_t)[(IDSContinuity *)self->_continuity state] > 3)
      {
        v19 = "UnexpectedState";
      }
      else
      {
        v19 = off_1008CBC78[(void)[(IDSContinuity *)self->_continuity state]];
      }
      id v20 = [(NSMutableSet *)self->_shouldNotAdvertiseRequesters count];
      unsigned int v21 = [(SDActivityController *)self shouldStart];
      *(_DWORD *)v24 = 138413570;
      if (v21) {
        CFStringRef v22 = @"YES";
      }
      else {
        CFStringRef v22 = @"NO";
      }
      *(void *)&v24[4] = v15;
      __int16 v25 = 2112;
      CFStringRef v26 = v17;
      __int16 v27 = 2112;
      v28 = (void *)v18;
      __int16 v29 = 2080;
      v30 = v19;
      __int16 v31 = 2048;
      id v32 = v20;
      __int16 v33 = 2112;
      CFStringRef v34 = v22;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%@ advertising: advertisingEnabled %@, currentConsoleUser %@, state %s, shouldNotAdvertiseRequestersCount %lu, shouldStart %@", v24, 0x3Eu);
    }

    if (self->_isAdvertising) {
      [(IDSContinuity *)self->_continuity stopAdvertisingOfType:0];
    }
    [(SDActivityAdvertiser *)self releaseIdleSleepAssertion];
    v23 = self->_advertisingTransaction;
    self->_advertisingTransaction = 0;

    return 0;
  }
}

- (void)stop
{
  self->_advertisingEnabled = 0;
  [(SDActivityAdvertiser *)self invalidateGoodbyeTimer];
  [(SDActivityAdvertiser *)self restart];
  currentAdvertisementPayload = self->_currentAdvertisementPayload;
  self->_currentAdvertisementPayload = 0;

  currentAdvertisementOptions = self->_currentAdvertisementOptions;
  self->_currentAdvertisementOptions = 0;

  id currentErrorHandler = self->_currentErrorHandler;
  self->_id currentErrorHandler = 0;
}

- (void)stopForReason:(id)a3
{
  id v4 = a3;
  v5 = handoff_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = SFCompactStringFromCollection();
    int v7 = 136315650;
    v8 = "-[SDActivityAdvertiser stopForReason:]";
    __int16 v9 = 2112;
    v10 = v6;
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s %@ + \"%@\"", (uint8_t *)&v7, 0x20u);
  }
  [(NSMutableSet *)self->_shouldNotAdvertiseRequesters addObject:v4];
  if ([(NSMutableSet *)self->_shouldNotAdvertiseRequesters count] == (id)1) {
    [(SDActivityAdvertiser *)self restart];
  }
}

- (void)resumeForReason:(id)a3
{
  id v4 = a3;
  v5 = handoff_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = SFCompactStringFromCollection();
    int v7 = 136315650;
    v8 = "-[SDActivityAdvertiser resumeForReason:]";
    __int16 v9 = 2112;
    v10 = v6;
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s %@ - \"%@\"", (uint8_t *)&v7, 0x20u);
  }
  if ([(NSMutableSet *)self->_shouldNotAdvertiseRequesters containsObject:v4])
  {
    [(NSMutableSet *)self->_shouldNotAdvertiseRequesters removeObject:v4];
    if (![(NSMutableSet *)self->_shouldNotAdvertiseRequesters count]) {
      [(SDActivityAdvertiser *)self restart];
    }
  }
}

- (void)activityServiceDevicesChanged:(id)a3
{
  id v3 = a3;
  id v4 = +[NSMutableSet set];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v19;
    do
    {
      __int16 v9 = 0;
      do
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = sub_1000C9CC4(*(void **)(*((void *)&v18 + 1) + 8 * (void)v9));
        if (v10)
        {
          __int16 v11 = +[SDActivityEncryptionManager sharedEncryptionManager];
          id v12 = [v10 uniqueID];
          v13 = [v11 cachedDecryptionKeyForDeviceIdentifier:v12];

          if (v13)
          {
            [v10 setValidKey:[v13 isValidKey]];
            [v10 setKeyCounter:[v13 lastUsedCounter]];
          }
          [v4 addObject:v10];
        }
        __int16 v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v7);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10008C820;
  block[3] = &unk_1008CA640;
  block[4] = self;
  id v17 = v4;
  id v14 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_remoteObjectProxyForConnection:(id)a3 usingBlock:(id)a4
{
}

- (void)_enumerateRemoteObjectProxiesUsingBlock:(id)a3
{
}

- (id)machServiceName
{
  return @"com.apple.sharing.handoff.advertising";
}

- (id)exportedInterface
{
  v2 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___SFActivityAdvertiserProtocol];
  v9[0] = objc_opt_class();
  v9[1] = objc_opt_class();
  v9[2] = objc_opt_class();
  id v3 = +[NSArray arrayWithObjects:v9 count:3];
  id v4 = +[NSSet setWithArray:v3];
  [v2 setClasses:v4 forSelector:"pairedSFPeerDevicesWithOptions:completionHandler:" argumentIndex:0 ofReply:1];

  v8[0] = objc_opt_class();
  v8[1] = objc_opt_class();
  v8[2] = objc_opt_class();
  id v5 = +[NSArray arrayWithObjects:v8 count:3];
  id v6 = +[NSSet setWithArray:v5];
  [v2 setClasses:v6 forSelector:"advertiseAdvertisementPayload:options:withErrorHandler:" argumentIndex:1 ofReply:0];

  return v2;
}

- (id)remoteObjectInterface
{
  v2 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___SFActivityAdvertiserClient];
  [v2 setClass:objc_opt_class() forSelector:"activityPayloadForAdvertisementPayload:command:requestedByDevice:withCompletionHandler:" argumentIndex:2 ofReply:0];
  [v2 setClass:objc_opt_class() forSelector:"didSendPayloadForActivityIdentifier:toDevice:error:" argumentIndex:1 ofReply:0];
  v6[0] = objc_opt_class();
  v6[1] = objc_opt_class();
  id v3 = +[NSArray arrayWithObjects:v6 count:2];
  id v4 = +[NSSet setWithArray:v3];
  [v2 setClasses:v4 forSelector:"pairedDevicesChanged:" argumentIndex:0 ofReply:0];

  return v2;
}

- (BOOL)shouldAcceptNewConnection:(id)a3
{
  return 1;
}

- (void)connectionEstablished:(id)a3
{
  id v3 = handoff_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_10008F140();
  }
}

- (void)connectionInvalidated:(id)a3
{
  id v4 = handoff_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_10008F174();
  }

  id v5 = [(SDXPCDaemon *)self activeConnections];
  id v6 = [v5 count];

  if (!v6) {
    [(SDActivityAdvertiser *)self stop];
  }
}

- (void)didSendPayloadForActivityIdentifier:(id)a3 toDevice:(id)a4 error:(id)a5
{
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10008CD4C;
  v11[3] = &unk_1008CBCC8;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v8 = v14;
  id v9 = v13;
  id v10 = v12;
  [(SDActivityAdvertiser *)self _enumerateRemoteObjectProxiesUsingBlock:v11];
}

- (void)activityPayloadForAdvertisementPayload:(id)a3 command:(id)a4 requestedByDevice:(id)a5 withCompletionHandler:(id)a6
{
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10008CE64;
  v14[3] = &unk_1008CBCF0;
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v10 = v18;
  id v11 = v17;
  id v12 = v16;
  id v13 = v15;
  [(SDActivityAdvertiser *)self _enumerateRemoteObjectProxiesUsingBlock:v14];
}

- (NSString)state
{
  id v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  NSAppendPrintF();
  id v5 = 0;

  NSAppendPrintF();
  id v6 = v5;

  NSAppendPrintF();
  id v7 = v6;

  NSAppendPrintF();
  id v8 = v7;

  if (self->_advertisingEnabled) {
    CFStringRef v9 = @"YES";
  }
  else {
    CFStringRef v9 = @"NO";
  }
  CFStringRef v20 = v9;
  NSAppendPrintF();
  id v10 = v8;

  [(SDActivityController *)self shouldStart];
  NSAppendPrintF();
  id v11 = v10;

  long long v21 = SFCompactStringFromCollection();
  NSAppendPrintF();
  id v12 = v11;

  NSAppendPrintF();
  id v13 = v12;

  NSAppendPrintF();
  id v14 = v13;

  if (self->_powerAssertionClientPID)
  {
    NSAppendPrintF();
    id v15 = v14;

    id v14 = v15;
  }
  id v16 = SFAdvertisementDescriptionFromPayloadData();
  NSAppendPrintF();
  id v17 = v14;

  CFStringRef v22 = SFCompactStringFromCollection();
  NSAppendPrintF();
  id v18 = v17;

  return (NSString *)v18;
}

- (void)addObservers
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"resetStateRequested:" name:@"com.apple.sharingd.ResetState" object:0];
  [v3 addObserver:self selector:"systemWillSleep:" name:@"com.apple.sharingd.SystemWillSleep" object:0];
}

- (void)removeObservers
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];
}

- (void)systemWillSleep:(id)a3
{
  id v4 = handoff_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 67109120;
    v5[1] = getuid();
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Stopping for user %d on sleep", (uint8_t *)v5, 8u);
  }

  [(SDActivityAdvertiser *)self stop];
}

- (void)consoleUserChanged:(id)a3
{
  if (![(SDStatusMonitor *)self->_monitor currentConsoleUser])
  {
    id v4 = handoff_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5[0] = 67109120;
      v5[1] = getuid();
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Stopping for user %d on logout", (uint8_t *)v5, 8u);
    }

    [(SDActivityAdvertiser *)self stop];
  }
}

- (void)preventIdleSleepAssertion
{
  p_IOPMAssertionID powerAssertionID = &self->_powerAssertionID;
  IOPMAssertionID powerAssertionID = self->_powerAssertionID;
  if (powerAssertionID)
  {
    id v5 = IOPMAssertionCopyProperties(powerAssertionID);
    int powerAssertionClientPID = self->_powerAssertionClientPID;
    id v7 = [v5 objectForKeyedSubscript:@"AssertionOnBehalfOfPID"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unsigned int v8 = [v7 intValue];
      if (v8 == powerAssertionClientPID)
      {
        CFStringRef v9 = handoff_log();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          sub_10008F1A8();
        }

LABEL_19:
        goto LABEL_20;
      }
    }
    else
    {
      unsigned int v8 = 0;
    }
    id v17 = handoff_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 67109376;
      unsigned int v19 = v8;
      __int16 v20 = 1024;
      int v21 = powerAssertionClientPID;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Creating new power assertion for PID change (%d -> %d)", (uint8_t *)&v18, 0xEu);
    }

    [(SDActivityAdvertiser *)self releaseIdleSleepAssertion];
    self->_int powerAssertionClientPID = powerAssertionClientPID;
    [(SDActivityAdvertiser *)self preventIdleSleepAssertion];
    goto LABEL_19;
  }
  id v10 = handoff_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = self->_powerAssertionClientPID;
    int v18 = 67109120;
    unsigned int v19 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Grabbing power assertion to keep advertising until told to stop (client PID: %d)", (uint8_t *)&v18, 8u);
  }

  v22[0] = @"FrameworkBundleID";
  v22[1] = @"AssertType";
  v23[0] = @"com.apple.Sharing";
  v23[1] = @"PreventUserIdleSystemSleep";
  v22[2] = @"AssertName";
  v23[2] = @"Handoff";
  id v12 = +[NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:3];
  id v5 = +[NSMutableDictionary dictionaryWithDictionary:v12];

  if (self->_powerAssertionClientPID)
  {
    id v13 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:");
    [v5 setObject:v13 forKeyedSubscript:@"AssertionOnBehalfOfPID"];
  }
  IOReturn v14 = IOPMAssertionCreateWithProperties((CFDictionaryRef)v5, p_powerAssertionID);
  if (v14)
  {
    int v15 = v14;
    id v16 = handoff_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_10008583C(v15, v16);
    }

    unsigned int *p_powerAssertionID = 0;
  }
LABEL_20:
}

- (void)releaseIdleSleepAssertion
{
  if (self->_powerAssertionID)
  {
    id v3 = handoff_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Releasing power assertion", v4, 2u);
    }

    IOPMAssertionRelease(self->_powerAssertionID);
    self->_IOPMAssertionID powerAssertionID = 0;
    self->_int powerAssertionClientPID = 0;
  }
}

- (void)startGoodbyeTimer
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10008D7E4;
  block[3] = &unk_1008CA4B8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)invalidateGoodbyeTimer
{
  if (self->_goodbyeTimer)
  {
    id v3 = handoff_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      sub_10008F2B8((uint64_t)self, v3);
    }

    [(NSTimer *)self->_goodbyeTimer invalidate];
    goodbyeTimer = self->_goodbyeTimer;
    self->_goodbyeTimer = 0;
  }
}

- (void)goodbyeTimeoutFired:(id)a3
{
  [(SDActivityAdvertiser *)self invalidateGoodbyeTimer];
  if (!self->_currentAdvertisementPayload)
  {
    id v4 = handoff_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      sub_10008F34C((uint64_t)self, v4);
    }

    [(SDActivityAdvertiser *)self stop];
  }
}

- (BOOL)updateAdvertiser
{
  id v3 = [(SDActivityAdvertiser *)self createAdvertisingInformation];
  advertisementData = self->_advertisementData;
  self->_advertisementData = v3;

  rawAdvertisementData = self->_rawAdvertisementData;
  self->_rawAdvertisementData = 0;

  return [(SDActivityAdvertiser *)self restart];
}

- (id)createAdvertisingInformation
{
  id v3 = +[NSMutableData dataWithCapacity:14];
  [v3 setLength:14];
  id v4 = v3;
  id v5 = (char *)[v4 mutableBytes];
  id v6 = [(NSDictionary *)self->_currentAdvertisementOptions objectForKeyedSubscript:SFActivityAdvertiserOptionFlagCopyPasteKey];
  unsigned int v7 = [v6 BOOLValue];

  if (v7) {
    char v8 = 8;
  }
  else {
    char v8 = 0;
  }
  char *v5 = v8;
  currentAdvertisementOptions = self->_currentAdvertisementOptions;
  id v10 = off_100966CF0();
  int v11 = [(NSDictionary *)currentAdvertisementOptions objectForKeyedSubscript:v10];
  unsigned __int8 v12 = [v11 BOOLValue];

  v5[4] = v12;
  p_currentAdvertisementPayload = &self->_currentAdvertisementPayload;
  id v14 = [(NSData *)*p_currentAdvertisementPayload length];
  int v15 = *p_currentAdvertisementPayload;
  if (v14 == (id)9)
  {
    id v16 = [(NSData *)v15 bytes];
    char v17 = v16[8];
    *(void *)(v5 + 5) = *(void *)v16;
    v5[13] = v17;
  }
  else if (v15)
  {
    int v18 = handoff_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_10008F3E0((id *)p_currentAdvertisementPayload, v18);
    }
  }

  return v4;
}

- (id)encryptedAdvertisingInformation
{
  id v2 = [(NSData *)self->_advertisementData mutableCopy];
  id v3 = (unsigned __int8 *)[v2 mutableBytes];
  id v4 = v3 + 4;
  id v5 = +[NSData dataWithBytes:v3 + 4 length:10];
  id v6 = +[SDActivityEncryptionManager sharedEncryptionManager];
  uint64_t v7 = *v3;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10008DC3C;
  v10[3] = &unk_1008CBD18;
  id v11 = v5;
  unsigned __int8 v12 = v3;
  id v8 = v5;
  [v6 getTagAndCounterWhileEncryptingBytesInPlace:v4 forAdvertisementWithVersion:v7 handler:v10];

  return v2;
}

- (void)continuityDidUpdateState:(id)a3
{
  id v4 = a3;
  id v5 = _os_activity_create((void *)&_mh_execute_header, "Sharing/SDActivityAdvertiser/continuityDidUpdateState", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  v10.opaque[0] = 0;
  v10.opaque[1] = 0;
  os_activity_scope_enter(v5, &v10);
  id v6 = handoff_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    if (((unint64_t)[v4 state] & 0x8000000000000000) != 0
      || (uint64_t)[v4 state] > 3)
    {
      uint64_t v7 = "UnexpectedState";
    }
    else
    {
      uint64_t v7 = off_1008CBC78[(void)[v4 state]];
    }
    sub_10008F55C((uint64_t)v7, (uint64_t)v11, v6);
  }

  switch((unint64_t)[v4 state])
  {
    case 0uLL:
      id v8 = handoff_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_10008F4E8();
      }
      goto LABEL_17;
    case 1uLL:
      id v8 = handoff_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        sub_10008F528();
      }
      goto LABEL_17;
    case 2uLL:
      id v8 = handoff_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        sub_10008F4B4();
      }
LABEL_17:

      break;
    case 3uLL:
      CFStringRef v9 = handoff_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        sub_10008F480();
      }

      [(SDActivityAdvertiser *)self restart];
      break;
    default:
      break;
  }
  os_activity_scope_leave(&v10);
}

- (void)continuity:(id)a3 didStartAdvertisingOfType:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = _os_activity_create((void *)&_mh_execute_header, "Sharing/SDActivityAdvertiser/continuityDidStartAdvertisingOfType", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  v11.opaque[0] = 0;
  v11.opaque[1] = 0;
  os_activity_scope_enter(v7, &v11);
  if (!a4) {
    self->_isAdvertising = 1;
  }
  id v8 = handoff_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_10008F59C(a4, v8, v9);
  }

  if (self->_isAdvertising)
  {
    os_activity_scope_state_s v10 = +[SDNearbyAgent sharedNearbyAgent];
    [v10 update];
  }
  os_activity_scope_leave(&v11);
}

- (void)continuity:(id)a3 didStopAdvertisingOfType:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = _os_activity_create((void *)&_mh_execute_header, "Sharing/SDActivityAdvertiser/continuityDidStopAdvertisingOfType", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  v11.opaque[0] = 0;
  v11.opaque[1] = 0;
  os_activity_scope_enter(v7, &v11);
  if (!a4) {
    self->_isAdvertising = 0;
  }
  id v8 = handoff_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_10008F62C(a4, v8, v9);
  }

  if (!self->_isAdvertising)
  {
    os_activity_scope_state_s v10 = +[SDNearbyAgent sharedNearbyAgent];
    [v10 update];
  }
  os_activity_scope_leave(&v11);
}

- (void)continuity:(id)a3 continuityDidStopAdvertisingOfType:(int64_t)a4 withError:(id)a5
{
}

- (void)continuity:(id)a3 didStopAdvertisingOfType:(int64_t)a4 withError:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  os_activity_scope_state_s v10 = _os_activity_create((void *)&_mh_execute_header, "Sharing/SDActivityAdvertiser/continuityDidStopAdvertisingOfTypeWithError", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v10, &state);
  if (!a4) {
    self->_isAdvertising = 0;
  }
  os_activity_scope_state_s v11 = handoff_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    sub_10008F6BC(a4, (uint64_t)v9, v11);
  }

  unsigned __int8 v12 = [v9 domain];
  id v13 = (void *)WPErrorDomain;
  id v14 = v12;
  id v15 = v13;
  if (v14 == v15)
  {
  }
  else
  {
    id v16 = v15;
    if ((v14 == 0) == (v15 != 0))
    {

LABEL_15:
      goto LABEL_16;
    }
    unsigned int v17 = [v14 isEqual:v15];

    if (!v17) {
      goto LABEL_15;
    }
  }
  id v18 = [v9 code];

  if (v18 == (id)28)
  {
    unsigned int v19 = handoff_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)CFStringRef v22 = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Advertising stopped due to address rotation, updating counter and restarting advertising", v22, 2u);
    }

    rawAdvertisementData = self->_rawAdvertisementData;
    self->_rawAdvertisementData = 0;

    int v21 = +[SDActivityEncryptionManager sharedEncryptionManager];
    [v21 bumpEncryptionKeyCounterValue];

    [(SDActivityAdvertiser *)self restart];
  }
LABEL_16:
  os_activity_scope_leave(&state);
}

- (void)continuity:(id)a3 didFailToStartAdvertisingOfType:(int64_t)a4 withError:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  os_activity_scope_state_s v10 = _os_activity_create((void *)&_mh_execute_header, "Sharing/SDActivityAdvertiser/continuityDidFailToStartAdvertisingOfType", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  v15.opaque[0] = 0;
  v15.opaque[1] = 0;
  os_activity_scope_enter(v10, &v15);
  if (!a4) {
    self->_isAdvertising = 0;
  }
  os_activity_scope_state_s v11 = handoff_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    if ((unint64_t)a4 > 3) {
      unsigned __int8 v12 = "UnexpectedType";
    }
    else {
      unsigned __int8 v12 = off_1008CBD38[a4];
    }
    id v13 = [v9 localizedDescription];
    sub_10008F764((uint64_t)v12, v13, buf, v11);
  }

  id currentErrorHandler = (void (**)(id, id))self->_currentErrorHandler;
  if (currentErrorHandler) {
    currentErrorHandler[2](currentErrorHandler, v9);
  }
  os_activity_scope_leave(&v15);
}

- (void)advertiseAdvertisementPayload:(id)a3 options:(id)a4 withErrorHandler:(id)a5
{
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10008E5F4;
  v11[3] = &unk_1008CBD88;
  id v12 = a3;
  id v13 = a4;
  id v14 = self;
  id v15 = a5;
  id v8 = v15;
  id v9 = v13;
  id v10 = v12;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v11);
}

- (void)loginIDWithOptions:(id)a3 completionHandler:(id)a4
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  _DWORD v5[2] = sub_10008EA78;
  v5[3] = &unk_1008CB7D8;
  v5[4] = self;
  id v6 = a4;
  id v4 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);
}

- (void)peerForUUID:(id)a3 completionHandler:(id)a4
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10008EB9C;
  block[3] = &unk_1008CAD48;
  block[4] = self;
  id v8 = a3;
  id v9 = a4;
  id v5 = v9;
  id v6 = v8;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)pairedSFPeerDevicesWithOptions:(id)a3 completionHandler:(id)a4
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  _DWORD v5[2] = sub_10008ED48;
  v5[3] = &unk_1008CAD20;
  v5[4] = self;
  id v6 = a4;
  id v4 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);
}

- (BOOL)isAdvertising
{
  return self->_isAdvertising;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_currentErrorHandler, 0);
  objc_storeStrong((id *)&self->_currentAdvertisementOptions, 0);
  objc_storeStrong((id *)&self->_currentAdvertisementPayload, 0);
  objc_storeStrong((id *)&self->_advertisementData, 0);
  objc_storeStrong((id *)&self->_rawAdvertisementData, 0);
  objc_storeStrong((id *)&self->_advertisingTransaction, 0);
  objc_storeStrong((id *)&self->_shouldNotAdvertiseRequesters, 0);
  objc_storeStrong((id *)&self->_goodbyeTimer, 0);
  objc_storeStrong((id *)&self->_continuity, 0);

  objc_storeStrong((id *)&self->_monitor, 0);
}

@end