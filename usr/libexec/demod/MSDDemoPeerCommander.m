@interface MSDDemoPeerCommander
+ (id)sharedInstance;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (MSDDemoPeerCommander)init;
- (MSDNearbyObjectMonitor)nearbyObjectMonitor;
- (MSDRapportDeviceExplorer)rpDeviceExplorer;
- (MSDRapportMessageHandler)rpMessageHandler;
- (NSMutableDictionary)discoveredPeers;
- (NSMutableDictionary)nearbyObjects;
- (NSMutableDictionary)pairingHandlers;
- (NSXPCConnection)xpcConnection;
- (NSXPCListener)xpcListener;
- (OS_dispatch_queue)queue;
- (id)createXPCEndpoint;
- (id)didReceiveRequestMessage:(id)a3 fromDevice:(id)a4;
- (void)_handleDiscoveryOfNewPeer:(id)a3;
- (void)_handleLossOfExistingPeer:(id)a3;
- (void)_handleUpdateDeviceEventMessage:(id)a3 fromPeer:(id)a4;
- (void)_handleUpdateOfExistingPeer:(id)a3;
- (void)_sendRequestMessageOfID:(id)a3 andPayload:(id)a4 toPeerOfID:(id)a5 withCompletion:(id)a6;
- (void)adjustVolumeOnPeerOfID:(id)a3 toValue:(float)a4 forCategory:(unint64_t)a5 withCompletion:(id)a6;
- (void)attemptPairingWithPeerOfID:(id)a3 withCompletion:(id)a4;
- (void)changeWiFiSettingsOnPeer:(id)a3 newSettings:(id)a4 withCompletion:(id)a5;
- (void)didReceiveEventMessage:(id)a3 fromDevice:(id)a4;
- (void)enumerateTestScriptsOnPeerOfID:(id)a3 withCompletion:(id)a4;
- (void)explorerDidFindDevice:(id)a3;
- (void)explorerDidLoseDevice:(id)a3;
- (void)explorerDidUpdateDevice:(id)a3;
- (void)fetchDeviceInfoFromPeerOfID:(id)a3 withCompletion:(id)a4;
- (void)getAccessibiltiySettingsOnPeer:(id)a3 withCompletion:(id)a4;
- (void)initiateAirPlayAssistedFromPeerOfID:(id)a3 usingParameters:(id)a4 discoveryMode:(unint64_t)a5 withCompletion:(id)a6;
- (void)initiateIPDResetOnPeer:(id)a3 targetIPD:(double)a4 withCompletion:(id)a5;
- (void)invokeInputRecoveryOnPeerOfID:(id)a3 forType:(unint64_t)a4 withCompletion:(id)a5;
- (void)launchAppOnPeerOfID:(id)a3 appIdentifier:(id)a4 withCompletion:(id)a5;
- (void)launchTestScriptOnPeerOfID:(id)a3 ofIdentifier:(id)a4 asRoot:(BOOL)a5 withCompletion:(id)a6;
- (void)listAppsOnPeerOfID:(id)a3 appKind:(unint64_t)a4 withCompletion:(id)a5;
- (void)listAvailableEnvironmentsOnPeerOfID:(id)a3 withCompletion:(id)a4;
- (void)loadLSMeasurementsOnPeerOfID:(id)a3 withCompletion:(id)a4;
- (void)monitorDidUpdateRegionOfNearbyObject:(id)a3;
- (void)obtainGKMetricsOnPeerOfID:(id)a3 withCompletion:(id)a4;
- (void)obtainGKResultsOnPeerOfID:(id)a3 withCompletion:(id)a4;
- (void)queryIPDResetStageOnPeer:(id)a3 withCompletion:(id)a4;
- (void)readIPDStatusFromPeer:(id)a3 withCompletion:(id)a4;
- (void)removePairedPeer:(id)a3 withCompletion:(id)a4;
- (void)resetToPassThroughOnPeerOfID:(id)a3 withCompletion:(id)a4;
- (void)retrieveHSCoachingSuggestionFromPeer:(id)a3 withCompletion:(id)a4;
- (void)seImmersionLevelOnPeerOfID:(id)a3 immersionLevel:(float)a4 animationDuration:(float)a5 withCompletion:(id)a6;
- (void)setAccessibiltiySettingsOnPeer:(id)a3 newSettings:(id)a4 withCompletion:(id)a5;
- (void)setActiveEnvironmentOnPeerOfID:(id)a3 environmentID:(id)a4 withCompletion:(id)a5;
- (void)setDiscoveredPeers:(id)a3;
- (void)setNearbyObjectMonitor:(id)a3;
- (void)setNearbyObjects:(id)a3;
- (void)setPairingHandlers:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRpDeviceExplorer:(id)a3;
- (void)setRpMessageHandler:(id)a3;
- (void)setXpcConnection:(id)a3;
- (void)setXpcListener:(id)a3;
- (void)skipAutoIPDAdjustmentFromPeer:(id)a3 withCompletion:(id)a4;
- (void)startPeerDiscoveryWithCompletion:(id)a3;
- (void)subscribeDeviceInfoFromPeerOfID:(id)a3 withCompletion:(id)a4;
- (void)syncCurrentWiFiSettingsToPeer:(id)a3 withCompletion:(id)a4;
- (void)terminateAppOnPeerOfID:(id)a3 appIdentifier:(id)a4 withCompletion:(id)a5;
- (void)triggerSnapshotRevertOnPeerOfID:(id)a3 rebootDevice:(BOOL)a4 withCompletion:(id)a5;
- (void)triggerSnapshotRevertOnPeerOfID:(id)a3 withCompletion:(id)a4;
- (void)wipeCustomerAssetsOnPeer:(id)a3 withCompletion:(id)a4;
@end

@implementation MSDDemoPeerCommander

+ (id)sharedInstance
{
  if (qword_100189900 != -1) {
    dispatch_once(&qword_100189900, &stru_100152360);
  }
  v2 = (void *)qword_100189908;

  return v2;
}

- (MSDDemoPeerCommander)init
{
  v16.receiver = self;
  v16.super_class = (Class)MSDDemoPeerCommander;
  v2 = [(MSDDemoPeerCommander *)&v16 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.MobileStoreDemo.DemoPeerCommander", 0);
    [(MSDDemoPeerCommander *)v2 setQueue:v3];

    v4 = +[NSMutableDictionary dictionaryWithCapacity:0];
    [(MSDDemoPeerCommander *)v2 setNearbyObjects:v4];

    v5 = +[NSMutableDictionary dictionaryWithCapacity:0];
    [(MSDDemoPeerCommander *)v2 setDiscoveredPeers:v5];

    v6 = +[NSMutableDictionary dictionaryWithCapacity:0];
    [(MSDDemoPeerCommander *)v2 setPairingHandlers:v6];

    v7 = [[MSDNearbyObjectMonitor alloc] initWithObserver:v2];
    [(MSDDemoPeerCommander *)v2 setNearbyObjectMonitor:v7];

    v8 = [[MSDRapportDeviceExplorer alloc] initWithObserver:v2];
    [(MSDDemoPeerCommander *)v2 setRpDeviceExplorer:v8];

    v9 = [[MSDRapportMessageHandler alloc] initWithObserver:v2];
    [(MSDDemoPeerCommander *)v2 setRpMessageHandler:v9];

    v10 = +[NSXPCListener anonymousListener];
    [(MSDDemoPeerCommander *)v2 setXpcListener:v10];

    v11 = [(MSDDemoPeerCommander *)v2 xpcListener];
    [v11 setDelegate:v2];

    v12 = [(MSDDemoPeerCommander *)v2 xpcListener];
    v13 = [(MSDDemoPeerCommander *)v2 queue];
    [v12 _setQueue:v13];

    v14 = [(MSDDemoPeerCommander *)v2 xpcListener];
    [v14 activate];
  }
  return v2;
}

- (id)createXPCEndpoint
{
  v2 = self;
  objc_sync_enter(v2);
  dispatch_queue_t v3 = [(MSDDemoPeerCommander *)v2 xpcListener];
  v4 = [v3 endpoint];

  objc_sync_exit(v2);

  return v4;
}

- (void)_sendRequestMessageOfID:(id)a3 andPayload:(id)a4 toPeerOfID:(id)a5 withCompletion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = [(MSDDemoPeerCommander *)self queue];
  dispatch_assert_queue_V2(v14);

  v15 = sub_100068600();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v26 = v10;
    __int16 v27 = 2114;
    id v28 = v12;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "MSDDemoPeerCommander: Sending request message of ID: %{public}@ to peer of ID: %{public}@", buf, 0x16u);
  }

  if (v13)
  {
    if ([v10 isEqualToString:@"com.apple.MobileStoreDemo.InitiateIPDReset"]) {
      objc_super v16 = &off_100161FD0;
    }
    else {
      objc_super v16 = &off_100161FE8;
    }
    v17 = +[NSDictionary dictionaryWithObject:v16 forKey:@"Timeout"];
    v18 = [(MSDDemoPeerCommander *)self discoveredPeers];
    v19 = [v18 objectForKey:v12];

    v20 = [[MSDRapportMessage alloc] initWithIdentifier:v10 andPayload:v11 usingOptions:v17];
    v21 = [(MSDDemoPeerCommander *)self rpMessageHandler];
    v22 = [v19 device];
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_10002AEA4;
    v23[3] = &unk_1001523B0;
    v23[4] = self;
    id v24 = v13;
    [v21 sendOutgoingRequestMessage:v20 toDevice:v22 withCompletion:v23];
  }
}

- (void)_handleDiscoveryOfNewPeer:(id)a3
{
  id v4 = a3;
  v5 = [(MSDDemoPeerCommander *)self queue];
  dispatch_assert_queue_V2(v5);

  v6 = sub_100068600();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138543362;
    id v18 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "MSDDemoPeerCommander: Found new peer: %{public}@", (uint8_t *)&v17, 0xCu);
  }

  v7 = [v4 identifier];
  v8 = [(MSDDemoPeerCommander *)self discoveredPeers];
  v9 = [v8 objectForKey:v7];

  if (v9)
  {
    id v10 = sub_100068600();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v17) = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "MSDDemoPeerCommander: Ignore already discovered peer device.", (uint8_t *)&v17, 2u);
    }
  }
  else
  {
    id v11 = [(MSDDemoPeerCommander *)self discoveredPeers];
    [v11 setObject:v4 forKey:v7];

    id v12 = [(MSDDemoPeerCommander *)self nearbyObjects];
    id v10 = [v12 objectForKey:v7];

    if (v10) {
      id v13 = [v10 isInBubble];
    }
    else {
      id v13 = 0;
    }
    [v4 setIsInBubble:v13];
    v14 = [(MSDDemoPeerCommander *)self xpcConnection];

    if (v14)
    {
      v15 = [(MSDDemoPeerCommander *)self xpcConnection];
      objc_super v16 = [v15 remoteObjectProxy];
      [v16 providerDidDiscoverNewPeer:v4];
    }
    if ([v4 authenticated]) {
      [(MSDDemoPeerCommander *)self fetchDeviceInfoFromPeerOfID:v7 withCompletion:&stru_1001523F0];
    }
  }
}

- (void)_handleLossOfExistingPeer:(id)a3
{
  id v4 = a3;
  v5 = [(MSDDemoPeerCommander *)self queue];
  dispatch_assert_queue_V2(v5);

  v6 = sub_100068600();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138543362;
    id v17 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "MSDDemoPeerCommander: Lost existing peer: %{public}@", (uint8_t *)&v16, 0xCu);
  }

  v7 = [v4 identifier];
  v8 = [(MSDDemoPeerCommander *)self discoveredPeers];
  v9 = [v8 objectForKey:v7];

  if (!v9)
  {
    v14 = sub_100068600();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16) = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "MSDDemoPeerCommander: Ignore unknown peer device!", (uint8_t *)&v16, 2u);
    }
    goto LABEL_8;
  }
  id v10 = [(MSDDemoPeerCommander *)self discoveredPeers];
  [v10 removeObjectForKey:v7];

  id v11 = [(MSDDemoPeerCommander *)self rpMessageHandler];
  id v12 = [v4 device];
  [v11 invalidateOutgoingConnectionForDevice:v12];

  id v13 = [(MSDDemoPeerCommander *)self xpcConnection];

  if (v13)
  {
    v14 = [(MSDDemoPeerCommander *)self xpcConnection];
    v15 = [v14 remoteObjectProxy];
    [v15 providerDidLoseExistingPeerOfID:v7];

LABEL_8:
  }
}

- (void)_handleUpdateOfExistingPeer:(id)a3
{
  id v4 = a3;
  v5 = [(MSDDemoPeerCommander *)self queue];
  dispatch_assert_queue_V2(v5);

  v6 = sub_100068600();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543362;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "MSDDemoPeerCommander: Received update of existing peer: %{public}@", (uint8_t *)&v9, 0xCu);
  }

  v7 = [(MSDDemoPeerCommander *)self rpMessageHandler];
  v8 = [v4 device];
  [v7 invalidateOutgoingConnectionForDevice:v8];
}

- (void)_handleUpdateDeviceEventMessage:(id)a3 fromPeer:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(MSDDemoPeerCommander *)self queue];
  dispatch_assert_queue_V2(v8);

  int v9 = [v7 payload];

  id v10 = sub_100068600();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138543618;
    id v16 = v6;
    __int16 v17 = 2114;
    id v18 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "MSDDemoPeerCommander: Received device info update for peer: %{public}@ properties: %{public}@", (uint8_t *)&v15, 0x16u);
  }

  [v6 refreshDevicePropertiesUsingProperties:v9];
  id v11 = [(MSDDemoPeerCommander *)self xpcConnection];

  if (v11)
  {
    id v12 = [(MSDDemoPeerCommander *)self xpcConnection];
    id v13 = [v12 remoteObjectProxy];
    v14 = [v6 identifier];
    [v13 providerDidUpdateDeviceInfoOnPeerOfID:v14 withNewProperties:v9];
  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned int v8 = [v7 processIdentifier];
  int v9 = sub_100068600();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 67109120;
    HIDWORD(buf) = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "MSDDemoPeerCommander: A new XPC connection received from client: %d", (uint8_t *)&buf, 8u);
  }

  id v10 = [v7 valueForEntitlement:@"com.apple.private.mobilestoredemo.enabledemo"];
  if (v10
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && ([v10 containsObject:@"PeerDemoDevice"] & 1) != 0)
  {
    objc_initWeak(&buf, self);
    id v11 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___MSDDemoPeerServiceProviderProtocol];
    [v7 setExportedInterface:v11];

    [v7 setExportedObject:self];
    id v12 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___MSDDemoPeerServiceConsumerProtocol];
    [v7 setRemoteObjectInterface:v12];

    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_10002BBC4;
    v22[3] = &unk_100151AC8;
    objc_copyWeak(&v23, &buf);
    [v7 setInterruptionHandler:v22];
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_10002BC24;
    v20[3] = &unk_100151AC8;
    objc_copyWeak(&v21, &buf);
    [v7 setInvalidationHandler:v20];
    id v13 = [(MSDDemoPeerCommander *)self queue];
    [v7 _setQueue:v13];

    [v7 activate];
    [(MSDDemoPeerCommander *)self setXpcConnection:v7];
    v14 = [(MSDDemoPeerCommander *)self queue];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10002BC84;
    v18[3] = &unk_100152040;
    objc_copyWeak(&v19, &buf);
    v18[4] = self;
    dispatch_async(v14, v18);

    objc_destroyWeak(&v19);
    objc_destroyWeak(&v21);
    objc_destroyWeak(&v23);
    objc_destroyWeak(&buf);
    BOOL v15 = 1;
  }
  else
  {
    id v16 = sub_100068600();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "MSDDemoPeerCommander: Client is not entitled to use peer service.", (uint8_t *)&buf, 2u);
    }

    BOOL v15 = 0;
  }

  return v15;
}

- (void)startPeerDiscoveryWithCompletion:(id)a3
{
  unsigned int v8 = (void (**)(id, void))a3;
  id v4 = [(MSDDemoPeerCommander *)self queue];
  dispatch_assert_queue_V2(v4);

  v5 = [(MSDDemoPeerCommander *)self nearbyObjectMonitor];
  [v5 start];

  id v6 = [(MSDDemoPeerCommander *)self rpDeviceExplorer];
  [v6 activate];

  id v7 = [(MSDDemoPeerCommander *)self rpMessageHandler];
  [v7 listenForIncomingEventMessageOfID:@"com.apple.MobileStoreDemo.UpdateDeviceInfo"];

  v8[2](v8, 0);
}

- (void)attemptPairingWithPeerOfID:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  unsigned int v8 = [(MSDDemoPeerCommander *)self queue];
  dispatch_assert_queue_V2(v8);

  int v9 = [(MSDDemoPeerCommander *)self discoveredPeers];
  id v10 = [v9 objectForKey:v6];

  if (!v10)
  {
    CFStringRef v11 = @"Cannot find specified demo peer.";
    uint64_t v12 = 3727741104;
LABEL_9:
    BOOL v15 = +[NSError errorDomainMSDWithCode:v12 message:v11];
    v7[2](v7, v15);

    goto LABEL_10;
  }
  if (![v10 authenticated])
  {
    if ([v10 pairingMode])
    {
      id v13 = [(MSDDemoPeerCommander *)self pairingHandlers];
      v14 = [v13 objectForKey:v6];

      if (!v14)
      {
        id v16 = [MSDRapportPairingHandler alloc];
        __int16 v17 = [v10 device];
        id v21 = _NSConcreteStackBlock;
        uint64_t v22 = 3221225472;
        id v23 = sub_10002C120;
        id v24 = &unk_100152418;
        id v25 = v10;
        id v28 = v7;
        id v26 = self;
        id v18 = v6;
        id v27 = v18;
        id v19 = [(MSDRapportPairingHandler *)v16 initWithDevice:v17 andCompletion:&v21];

        v20 = [(MSDDemoPeerCommander *)self pairingHandlers];
        [v20 setObject:v19 forKey:v18];

        [(MSDRapportPairingHandler *)v19 activate];
        goto LABEL_10;
      }
      uint64_t v12 = 3727744771;
      CFStringRef v11 = @"Operation already in progress.";
    }
    else
    {
      uint64_t v12 = 3727741105;
      CFStringRef v11 = @"Cannot operate on demo peer not in pairing mode.";
    }
    goto LABEL_9;
  }
  v7[2](v7, 0);
LABEL_10:
}

- (void)subscribeDeviceInfoFromPeerOfID:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  unsigned int v8 = [(MSDDemoPeerCommander *)self queue];
  dispatch_assert_queue_V2(v8);

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10002C314;
  v10[3] = &unk_100152440;
  id v11 = v6;
  id v9 = v6;
  [(MSDDemoPeerCommander *)self _sendRequestMessageOfID:@"com.apple.MobileStoreDemo.SubscribeDeviceInfo" andPayload:0 toPeerOfID:v7 withCompletion:v10];
}

- (void)fetchDeviceInfoFromPeerOfID:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned int v8 = [(MSDDemoPeerCommander *)self queue];
  dispatch_assert_queue_V2(v8);

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10002C41C;
  v11[3] = &unk_100152468;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [(MSDDemoPeerCommander *)self _sendRequestMessageOfID:@"com.apple.MobileStoreDemo.FetchDeviceInfo" andPayload:0 toPeerOfID:v10 withCompletion:v11];
}

- (void)initiateAirPlayAssistedFromPeerOfID:(id)a3 usingParameters:(id)a4 discoveryMode:(unint64_t)a5 withCompletion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = [(MSDDemoPeerCommander *)self queue];
  dispatch_assert_queue_V2(v13);

  if (v11 && a5 < 3)
  {
    v19[0] = @"APParameters";
    v19[1] = @"APDiscoveryMode";
    v20[0] = v11;
    v14 = +[NSNumber numberWithUnsignedInteger:a5];
    v20[1] = v14;
    BOOL v15 = +[NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:2];

    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10002C844;
    v17[3] = &unk_100152440;
    id v18 = v12;
    [(MSDDemoPeerCommander *)self _sendRequestMessageOfID:@"com.apple.MobileStoreDemo.InitiateAirPlayAssisted" andPayload:v15 toPeerOfID:v10 withCompletion:v17];
  }
  else
  {
    id v16 = +[NSError errorDomainMSDWithCode:3727744769 message:@"Input is invalid"];
    (*((void (**)(id, void *))v12 + 2))(v12, v16);
  }
}

- (void)triggerSnapshotRevertOnPeerOfID:(id)a3 rebootDevice:(BOOL)a4 withCompletion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  id v10 = [(MSDDemoPeerCommander *)self queue];
  dispatch_assert_queue_V2(v10);

  CFStringRef v16 = @"RebootAfterRevert";
  id v11 = +[NSNumber numberWithBool:v5];
  __int16 v17 = v11;
  id v12 = +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10002C9C4;
  v14[3] = &unk_100152440;
  id v15 = v8;
  id v13 = v8;
  [(MSDDemoPeerCommander *)self _sendRequestMessageOfID:@"com.apple.MobileStoreDemo.TriggerSnapshotRevert" andPayload:v12 toPeerOfID:v9 withCompletion:v14];
}

- (void)triggerSnapshotRevertOnPeerOfID:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(MSDDemoPeerCommander *)self queue];
  dispatch_assert_queue_V2(v8);

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10002CAB8;
  v10[3] = &unk_100152440;
  id v11 = v6;
  id v9 = v6;
  [(MSDDemoPeerCommander *)self _sendRequestMessageOfID:@"com.apple.MobileStoreDemo.TriggerSnapshotRevert" andPayload:0 toPeerOfID:v7 withCompletion:v10];
}

- (void)invokeInputRecoveryOnPeerOfID:(id)a3 forType:(unint64_t)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [(MSDDemoPeerCommander *)self queue];
  dispatch_assert_queue_V2(v10);

  if (a4 < 4)
  {
    CFStringRef v16 = @"IREnrollmentType";
    id v12 = +[NSNumber numberWithUnsignedInteger:a4];
    __int16 v17 = v12;
    id v13 = +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];

    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10002CC7C;
    v14[3] = &unk_100152440;
    id v15 = v9;
    [(MSDDemoPeerCommander *)self _sendRequestMessageOfID:@"com.apple.MobileStoreDemo.InvokeInputRecovery" andPayload:v13 toPeerOfID:v8 withCompletion:v14];
  }
  else
  {
    id v11 = +[NSError errorDomainMSDWithCode:3727744769 message:@"Input is invalid"];
    (*((void (**)(id, void *))v9 + 2))(v9, v11);
  }
}

- (void)adjustVolumeOnPeerOfID:(id)a3 toValue:(float)a4 forCategory:(unint64_t)a5 withCompletion:(id)a6
{
  id v10 = a3;
  id v11 = (void (**)(id, void *))a6;
  id v12 = [(MSDDemoPeerCommander *)self queue];
  dispatch_assert_queue_V2(v12);

  if (a4 < 0.0 || (a4 <= 1.0 ? (BOOL v14 = a5 >= 4) : (BOOL v14 = 1), v14))
  {
    id v15 = +[NSError errorDomainMSDWithCode:3727744769 message:@"Input is invalid"];
    v11[2](v11, v15);
  }
  else
  {
    v21[0] = @"VolumeValue";
    *(float *)&double v13 = a4;
    CFStringRef v16 = +[NSNumber numberWithFloat:v13];
    v22[0] = v16;
    v21[1] = @"VolumeCategory";
    __int16 v17 = +[NSNumber numberWithUnsignedInteger:a5];
    v22[1] = v17;
    id v18 = +[NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:2];

    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    void v19[2] = sub_10002CE88;
    v19[3] = &unk_100152440;
    v20 = v11;
    [(MSDDemoPeerCommander *)self _sendRequestMessageOfID:@"com.apple.MobileStoreDemo.AdjustVolume" andPayload:v18 toPeerOfID:v10 withCompletion:v19];
  }
}

- (void)listAppsOnPeerOfID:(id)a3 appKind:(unint64_t)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [(MSDDemoPeerCommander *)self queue];
  dispatch_assert_queue_V2(v10);

  if (a4 < 2)
  {
    CFStringRef v16 = @"AppListKind";
    id v12 = +[NSNumber numberWithUnsignedInteger:a4];
    __int16 v17 = v12;
    double v13 = +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];

    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10002D050;
    v14[3] = &unk_100152440;
    id v15 = v9;
    [(MSDDemoPeerCommander *)self _sendRequestMessageOfID:@"com.apple.MobileStoreDemo.ListApps" andPayload:v13 toPeerOfID:v8 withCompletion:v14];
  }
  else
  {
    id v11 = +[NSError errorDomainMSDWithCode:3727744769 message:@"Input is invalid"];
    (*((void (**)(id, void, void *))v9 + 2))(v9, 0, v11);
  }
}

- (void)launchAppOnPeerOfID:(id)a3 appIdentifier:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(MSDDemoPeerCommander *)self queue];
  dispatch_assert_queue_V2(v11);

  if (v9)
  {
    CFStringRef v16 = @"AppIdentifier";
    id v17 = v9;
    id v12 = +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10002D474;
    v14[3] = &unk_100152440;
    id v15 = v10;
    [(MSDDemoPeerCommander *)self _sendRequestMessageOfID:@"com.apple.MobileStoreDemo.LaunchApp" andPayload:v12 toPeerOfID:v8 withCompletion:v14];
  }
  else
  {
    double v13 = +[NSError errorDomainMSDWithCode:3727744769 message:@"Input is invalid"];
    (*((void (**)(id, void *))v10 + 2))(v10, v13);
  }
}

- (void)terminateAppOnPeerOfID:(id)a3 appIdentifier:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(MSDDemoPeerCommander *)self queue];
  dispatch_assert_queue_V2(v11);

  if (v9)
  {
    CFStringRef v16 = @"AppIdentifier";
    id v17 = v9;
    id v12 = +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10002D620;
    v14[3] = &unk_100152440;
    id v15 = v10;
    [(MSDDemoPeerCommander *)self _sendRequestMessageOfID:@"com.apple.MobileStoreDemo.TerminateApp" andPayload:v12 toPeerOfID:v8 withCompletion:v14];
  }
  else
  {
    double v13 = +[NSError errorDomainMSDWithCode:3727744769 message:@"Input is invalid"];
    (*((void (**)(id, void *))v10 + 2))(v10, v13);
  }
}

- (void)listAvailableEnvironmentsOnPeerOfID:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(MSDDemoPeerCommander *)self queue];
  dispatch_assert_queue_V2(v8);

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10002D714;
  v10[3] = &unk_100152440;
  id v11 = v6;
  id v9 = v6;
  [(MSDDemoPeerCommander *)self _sendRequestMessageOfID:@"com.apple.MobileStoreDemo.ListAvailableEnvironments" andPayload:0 toPeerOfID:v7 withCompletion:v10];
}

- (void)setActiveEnvironmentOnPeerOfID:(id)a3 environmentID:(id)a4 withCompletion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(MSDDemoPeerCommander *)self queue];
  dispatch_assert_queue_V2(v11);

  CFStringRef v16 = @"EnvIdentifier";
  id v17 = v9;
  id v12 = +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10002DAF8;
  v14[3] = &unk_100152440;
  id v15 = v8;
  id v13 = v8;
  [(MSDDemoPeerCommander *)self _sendRequestMessageOfID:@"com.apple.MobileStoreDemo.SetActiveEnvironment" andPayload:v12 toPeerOfID:v10 withCompletion:v14];
}

- (void)seImmersionLevelOnPeerOfID:(id)a3 immersionLevel:(float)a4 animationDuration:(float)a5 withCompletion:(id)a6
{
  id v10 = a3;
  id v11 = (void (**)(id, void *))a6;
  id v12 = [(MSDDemoPeerCommander *)self queue];
  dispatch_assert_queue_V2(v12);

  if (a4 < 0.0 || a4 > 1.0 || a5 < 0.0)
  {
    id v18 = +[NSError errorDomainMSDWithCode:3727744769 message:@"Input is invalid"];
    v11[2](v11, v18);
  }
  else
  {
    v21[0] = @"ImmersionLevel";
    *(float *)&double v13 = a4;
    BOOL v14 = +[NSNumber numberWithFloat:v13];
    v22[0] = v14;
    v21[1] = @"AnimationDuration";
    *(float *)&double v15 = a5;
    CFStringRef v16 = +[NSNumber numberWithFloat:v15];
    v22[1] = v16;
    id v17 = +[NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:2];

    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    void v19[2] = sub_10002DD08;
    v19[3] = &unk_100152440;
    v20 = v11;
    [(MSDDemoPeerCommander *)self _sendRequestMessageOfID:@"com.apple.MobileStoreDemo.SetImmersionLevel" andPayload:v17 toPeerOfID:v10 withCompletion:v19];
  }
}

- (void)resetToPassThroughOnPeerOfID:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(MSDDemoPeerCommander *)self queue];
  dispatch_assert_queue_V2(v8);

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10002DDFC;
  v10[3] = &unk_100152440;
  id v11 = v6;
  id v9 = v6;
  [(MSDDemoPeerCommander *)self _sendRequestMessageOfID:@"com.apple.MobileStoreDemo.ResetToPassThrough" andPayload:0 toPeerOfID:v7 withCompletion:v10];
}

- (void)enumerateTestScriptsOnPeerOfID:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(MSDDemoPeerCommander *)self queue];
  dispatch_assert_queue_V2(v8);

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10002DEF0;
  v10[3] = &unk_100152440;
  id v11 = v6;
  id v9 = v6;
  [(MSDDemoPeerCommander *)self _sendRequestMessageOfID:@"com.apple.MobileStoreDemo.EnumerateScripts" andPayload:0 toPeerOfID:v7 withCompletion:v10];
}

- (void)launchTestScriptOnPeerOfID:(id)a3 ofIdentifier:(id)a4 asRoot:(BOOL)a5 withCompletion:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  double v13 = [(MSDDemoPeerCommander *)self queue];
  dispatch_assert_queue_V2(v13);

  if (v11)
  {
    v19[0] = @"TestIdentifier";
    v19[1] = @"RunAsRoot";
    v20[0] = v11;
    BOOL v14 = +[NSNumber numberWithBool:v7];
    v20[1] = v14;
    double v15 = +[NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:2];

    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10002E34C;
    v17[3] = &unk_100152440;
    id v18 = v12;
    [(MSDDemoPeerCommander *)self _sendRequestMessageOfID:@"com.apple.MobileStoreDemo.LaunchScript" andPayload:v15 toPeerOfID:v10 withCompletion:v17];
  }
  else
  {
    CFStringRef v16 = +[NSError errorDomainMSDWithCode:3727744769 message:@"Input is invalid"];
    (*((void (**)(id, void *))v12 + 2))(v12, v16);
  }
}

- (void)obtainGKResultsOnPeerOfID:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(MSDDemoPeerCommander *)self queue];
  dispatch_assert_queue_V2(v8);

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10002E440;
  v10[3] = &unk_100152440;
  id v11 = v6;
  id v9 = v6;
  [(MSDDemoPeerCommander *)self _sendRequestMessageOfID:@"com.apple.MobileStoreDemo.ObtainGKResults" andPayload:0 toPeerOfID:v7 withCompletion:v10];
}

- (void)obtainGKMetricsOnPeerOfID:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(MSDDemoPeerCommander *)self queue];
  dispatch_assert_queue_V2(v8);

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10002E680;
  v10[3] = &unk_100152440;
  id v11 = v6;
  id v9 = v6;
  [(MSDDemoPeerCommander *)self _sendRequestMessageOfID:@"com.apple.MobileStoreDemo.ObtainGKMetrics" andPayload:0 toPeerOfID:v7 withCompletion:v10];
}

- (void)loadLSMeasurementsOnPeerOfID:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(MSDDemoPeerCommander *)self queue];
  dispatch_assert_queue_V2(v8);

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10002E8C0;
  v10[3] = &unk_100152440;
  id v11 = v6;
  id v9 = v6;
  [(MSDDemoPeerCommander *)self _sendRequestMessageOfID:@"com.apple.MobileStoreDemo.LoadLSMeasurements" andPayload:0 toPeerOfID:v7 withCompletion:v10];
}

- (void)retrieveHSCoachingSuggestionFromPeer:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(MSDDemoPeerCommander *)self queue];
  dispatch_assert_queue_V2(v8);

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10002EA7C;
  v10[3] = &unk_100152440;
  id v11 = v6;
  id v9 = v6;
  [(MSDDemoPeerCommander *)self _sendRequestMessageOfID:@"com.apple.MobileStoreDemo.RetrieveHSCoachingSuggestion" andPayload:0 toPeerOfID:v7 withCompletion:v10];
}

- (void)readIPDStatusFromPeer:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(MSDDemoPeerCommander *)self queue];
  dispatch_assert_queue_V2(v8);

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10002EBE8;
  v10[3] = &unk_100152440;
  id v11 = v6;
  id v9 = v6;
  [(MSDDemoPeerCommander *)self _sendRequestMessageOfID:@"com.apple.MobileStoreDemo.ReadIPDStatus" andPayload:0 toPeerOfID:v7 withCompletion:v10];
}

- (void)skipAutoIPDAdjustmentFromPeer:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(MSDDemoPeerCommander *)self queue];
  dispatch_assert_queue_V2(v8);

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10002EE28;
  v10[3] = &unk_100152440;
  id v11 = v6;
  id v9 = v6;
  [(MSDDemoPeerCommander *)self _sendRequestMessageOfID:@"com.apple.MobileStoreDemo.SkipAutoIPDAdjustment" andPayload:0 toPeerOfID:v7 withCompletion:v10];
}

- (void)initiateIPDResetOnPeer:(id)a3 targetIPD:(double)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = (void (**)(id, void *, double))a5;
  id v10 = [(MSDDemoPeerCommander *)self queue];
  dispatch_assert_queue_V2(v10);

  if (a4 < 45.0 || a4 > 85.0)
  {
    double v13 = +[NSError errorDomainMSDWithCode:3727744769 message:@"Input is invalid"];
    v9[2](v9, v13, 0.0);
  }
  else
  {
    CFStringRef v16 = @"TargetIPD";
    id v11 = +[NSNumber numberWithDouble:a4];
    id v17 = v11;
    id v12 = +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];

    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10002F010;
    v14[3] = &unk_100152440;
    double v15 = v9;
    [(MSDDemoPeerCommander *)self _sendRequestMessageOfID:@"com.apple.MobileStoreDemo.InitiateIPDReset" andPayload:v12 toPeerOfID:v8 withCompletion:v14];
  }
}

- (void)queryIPDResetStageOnPeer:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(MSDDemoPeerCommander *)self queue];
  dispatch_assert_queue_V2(v8);

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10002F214;
  v10[3] = &unk_100152440;
  id v11 = v6;
  id v9 = v6;
  [(MSDDemoPeerCommander *)self _sendRequestMessageOfID:@"com.apple.MobileStoreDemo.QueryIPDResetStage" andPayload:0 toPeerOfID:v7 withCompletion:v10];
}

- (void)getAccessibiltiySettingsOnPeer:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(MSDDemoPeerCommander *)self queue];
  dispatch_assert_queue_V2(v8);

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10002F41C;
  v10[3] = &unk_100152440;
  id v11 = v6;
  id v9 = v6;
  [(MSDDemoPeerCommander *)self _sendRequestMessageOfID:@"com.apple.MobileStoreDemo.GetAXSettings" andPayload:0 toPeerOfID:v7 withCompletion:v10];
}

- (void)setAccessibiltiySettingsOnPeer:(id)a3 newSettings:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  id v11 = [(MSDDemoPeerCommander *)self queue];
  dispatch_assert_queue_V2(v11);

  id v18 = 0;
  id v12 = +[NSKeyedArchiver archivedDataWithRootObject:v10 requiringSecureCoding:1 error:&v18];

  id v13 = v18;
  if (v12)
  {
    CFStringRef v19 = @"AXSettingsArchive";
    v20 = v12;
    BOOL v14 = +[NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10002F77C;
    v16[3] = &unk_100152440;
    id v17 = v9;
    [(MSDDemoPeerCommander *)self _sendRequestMessageOfID:@"com.apple.MobileStoreDemo.SetAXSettings" andPayload:v14 toPeerOfID:v8 withCompletion:v16];
  }
  else
  {
    double v15 = sub_100068600();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_1000CABF8(v13);
    }

    BOOL v14 = +[NSError errorDomainMSDWithCode:3727744769 message:@"Input is invalid"];
    (*((void (**)(id, void *))v9 + 2))(v9, v14);
  }
}

- (void)wipeCustomerAssetsOnPeer:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(MSDDemoPeerCommander *)self queue];
  dispatch_assert_queue_V2(v8);

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10002F870;
  v10[3] = &unk_100152440;
  id v11 = v6;
  id v9 = v6;
  [(MSDDemoPeerCommander *)self _sendRequestMessageOfID:@"com.apple.MobileStoreDemo.WipeCustomerAssets" andPayload:0 toPeerOfID:v7 withCompletion:v10];
}

- (void)syncCurrentWiFiSettingsToPeer:(id)a3 withCompletion:(id)a4
{
  id v18 = a3;
  id v6 = (void (**)(id, void *))a4;
  id v7 = [(MSDDemoPeerCommander *)self queue];
  dispatch_assert_queue_V2(v7);

  id v8 = +[MSDWiFiHelper sharedInstance];
  id v9 = [v8 getCurrentWiFiSettings:1];

  if (v9)
  {
    id v10 = [v9 objectForKey:@"SSID"];
    uint64_t v11 = [v9 objectForKey:@"Password"];
    id v12 = (void *)v11;
    if (v10) {
      BOOL v13 = v11 == 0;
    }
    else {
      BOOL v13 = 1;
    }
    if (v13
      || (id v14 = [objc_alloc((Class)NSString) initWithData:v11 encoding:4]) == 0)
    {
      id v17 = +[NSError errorDomainMSDWithCode:3727741073 message:@"Failed to read current WiFi settings."];
      v6[2](v6, v17);
    }
    else
    {
      double v15 = v14;
      id v16 = [objc_alloc((Class)MSDKPeerDemoWiFiSettings) initWithSSID:v10 password:v14];
      [(MSDDemoPeerCommander *)self changeWiFiSettingsOnPeer:v18 newSettings:v16 withCompletion:v6];

      id v10 = v16;
    }
  }
  else
  {
    id v10 = +[NSError errorDomainMSDWithCode:3727741073 message:@"Failed to read current WiFi settings."];
    v6[2](v6, v10);
  }
}

- (void)changeWiFiSettingsOnPeer:(id)a3 newSettings:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  uint64_t v11 = [(MSDDemoPeerCommander *)self queue];
  dispatch_assert_queue_V2(v11);

  id v18 = 0;
  id v12 = +[NSKeyedArchiver archivedDataWithRootObject:v10 requiringSecureCoding:1 error:&v18];

  id v13 = v18;
  if (v12)
  {
    CFStringRef v19 = @"WiFiSettingsArchive";
    v20 = v12;
    id v14 = +[NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10002FC58;
    v16[3] = &unk_100152440;
    id v17 = v9;
    [(MSDDemoPeerCommander *)self _sendRequestMessageOfID:@"com.apple.MobileStoreDemo.ChangeWiFiSettings" andPayload:v14 toPeerOfID:v8 withCompletion:v16];
  }
  else
  {
    double v15 = sub_100068600();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_1000CAC7C(v13);
    }

    id v14 = +[NSError errorDomainMSDWithCode:3727744769 message:@"Input is invalid"];
    (*((void (**)(id, void *))v9 + 2))(v9, v14);
  }
}

- (void)removePairedPeer:(id)a3 withCompletion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[MSDDemoPeerPairingManager sharedInstance];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10002FD38;
  v9[3] = &unk_100151DF8;
  id v10 = v5;
  id v8 = v5;
  [v7 removePairedPeer:v6 withCompletion:v9];
}

- (void)monitorDidUpdateRegionOfNearbyObject:(id)a3
{
  id v4 = a3;
  id v5 = [(MSDDemoPeerCommander *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002FDFC;
  v7[3] = &unk_1001520B0;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)explorerDidFindDevice:(id)a3
{
  id v4 = a3;
  id v5 = [(MSDDemoPeerCommander *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000300B0;
  v7[3] = &unk_1001520B0;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)explorerDidLoseDevice:(id)a3
{
  id v4 = a3;
  id v5 = [(MSDDemoPeerCommander *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000301C4;
  v7[3] = &unk_1001520B0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)explorerDidUpdateDevice:(id)a3
{
  id v4 = a3;
  id v5 = [(MSDDemoPeerCommander *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10003030C;
  v7[3] = &unk_1001520B0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (id)didReceiveRequestMessage:(id)a3 fromDevice:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = sub_100068600();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543618;
    id v10 = v5;
    __int16 v11 = 2114;
    id v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "MSDDemoPeerCommander: Received request message: %{public}@ from device: %{public}@", (uint8_t *)&v9, 0x16u);
  }

  return 0;
}

- (void)didReceiveEventMessage:(id)a3 fromDevice:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MSDDemoPeerCommander *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003054C;
  block[3] = &unk_100152490;
  id v12 = v6;
  id v13 = v7;
  id v14 = self;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSXPCListener)xpcListener
{
  return self->_xpcListener;
}

- (void)setXpcListener:(id)a3
{
}

- (NSXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (void)setXpcConnection:(id)a3
{
}

- (MSDNearbyObjectMonitor)nearbyObjectMonitor
{
  return self->_nearbyObjectMonitor;
}

- (void)setNearbyObjectMonitor:(id)a3
{
}

- (MSDRapportDeviceExplorer)rpDeviceExplorer
{
  return self->_rpDeviceExplorer;
}

- (void)setRpDeviceExplorer:(id)a3
{
}

- (MSDRapportMessageHandler)rpMessageHandler
{
  return self->_rpMessageHandler;
}

- (void)setRpMessageHandler:(id)a3
{
}

- (NSMutableDictionary)nearbyObjects
{
  return self->_nearbyObjects;
}

- (void)setNearbyObjects:(id)a3
{
}

- (NSMutableDictionary)discoveredPeers
{
  return self->_discoveredPeers;
}

- (void)setDiscoveredPeers:(id)a3
{
}

- (NSMutableDictionary)pairingHandlers
{
  return self->_pairingHandlers;
}

- (void)setPairingHandlers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pairingHandlers, 0);
  objc_storeStrong((id *)&self->_discoveredPeers, 0);
  objc_storeStrong((id *)&self->_nearbyObjects, 0);
  objc_storeStrong((id *)&self->_rpMessageHandler, 0);
  objc_storeStrong((id *)&self->_rpDeviceExplorer, 0);
  objc_storeStrong((id *)&self->_nearbyObjectMonitor, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_xpcListener, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end