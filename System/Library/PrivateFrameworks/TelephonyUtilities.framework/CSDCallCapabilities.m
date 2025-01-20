@interface CSDCallCapabilities
+ (CSDCallCapabilities)sharedInstance;
- (BOOL)_accountsMatchForSecondaryCalling;
- (BOOL)_deviceExistsThatSupportsRelayCallingWithoutLocalRelayCallingEnabled;
- (BOOL)_isAudioAccessoryDevice;
- (BOOL)_isThumperCallingAllowedForCurrentDeviceUsingSenderIdentityCapabilitiesState:(id)a3;
- (BOOL)_isWatchDevice;
- (BOOL)_relayCallingEnabledDefault;
- (BOOL)_supportsBasebandCalling;
- (BOOL)_supportsCellularData;
- (BOOL)_supportsDisplayingFaceTimeAudioCalls;
- (BOOL)_supportsDisplayingFaceTimeVideoCalls;
- (BOOL)_supportsDisplayingTelephonyCalls;
- (BOOL)_supportsPrimaryCalling;
- (BOOL)_supportsRelayCalling;
- (BOOL)_supportsThumperCallingUsingSenderIdentityCapabilitiesState:(id)a3;
- (BOOL)_supportslaunchingInCallApplicationForIncomingCall;
- (BOOL)isThumperCallingSupportedForAccountID:(id)a3;
- (BOOL)isThumperRegisteredDeviceID:(id)a3 forThumperAccountID:(id)a4;
- (CSDAccountsController)accountsController;
- (CSDCallCapabilities)init;
- (CSDCallCapabilities)initWithRelayService:(id)a3 thumperService:(id)a4 featureFlags:(id)a5;
- (CSDClientManager)clientManager;
- (CSDIDSService)relayService;
- (CSDIDSService)thumperService;
- (CSDPinExchangeController)thumperPinExchangeController;
- (CSDProcessObserverProtocol)processObserver;
- (CSDTelephonyCallCapabilities)telephonyCallCapabilities;
- (CSDThumperCapabilitiesMonitor)thumperCapabilitiesMonitor;
- (CSDThumperPushHandler)thumperPushHandler;
- (NSArray)localThumperAccounts;
- (NSArray)secondaryThumperAccounts;
- (NSDictionary)thumperCallingCapabilitiesStateByUUID;
- (NSString)debugDescription;
- (NSXPCListener)xpcListener;
- (OS_dispatch_queue)queue;
- (TUCallCapabilitiesState)callCapabilitiesState;
- (TUCallCapabilitiesState)pairedHostDeviceState;
- (TUCallCapabilitiesState)state;
- (TUFeatureFlags)featureFlags;
- (id)_cloudCallingDevices;
- (id)_outgoingCallerID;
- (id)_primaryThumperAccountRequiringAvailableDeviceSlots;
- (id)_primaryThumperAccountRequiringMatchingCallerID;
- (id)_primaryThumperAccountRequiringMatchingCallerID:(BOOL)a3 requiringAvailableDeviceSlots:(BOOL)a4;
- (id)_relayCallingDisabledForDeviceIDDefault;
- (id)secondaryThumperAccountForAccountID:(id)a3;
- (id)thumperCallingCapabilitiesStateForAccountID:(id)a3;
- (unsigned)_defaultOverrideForDisableDefault:(id)a3 forceDefault:(id)a4;
- (void)_initializePairedHostDeviceState;
- (void)_savePairedHostDeviceState;
- (void)_setRelayCallingEnabled:(BOOL)a3;
- (void)_setRelayCallingEnabled:(BOOL)a3 forDeviceWithID:(id)a4;
- (void)_setRelayCallingEnabledDefault:(BOOL)a3;
- (void)_setRelayCallingEnabledDefault:(BOOL)a3 forDeviceWithID:(id)a4;
- (void)_setThumperCallingAllowed:(BOOL)a3 onSecondaryDeviceWithID:(id)a4 forSenderIdentityWithUUID:(id)a5;
- (void)_setThumperCallingAllowedOnDefaultPairedDevice:(BOOL)a3 forSenderIdentityWithUUID:(id)a4;
- (void)_setThumperCallingEnabled:(BOOL)a3 forSenderIdentityWithUUID:(id)a4;
- (void)_setVoLTECallingEnabled:(BOOL)a3 forSenderIdentityWithUUID:(id)a4;
- (void)_setWiFiCallingEnabled:(BOOL)a3 forSenderIdentityWithUUID:(id)a4;
- (void)_setWiFiCallingRoamingEnabled:(BOOL)a3 forSenderIdentityWithUUID:(id)a4;
- (void)_updateCTCapabilities;
- (void)_updateCallAvailability;
- (void)_updateClientsWithState;
- (void)_updateDefaultAppIfNecessary;
- (void)_updateDynamicCapabilitiesAndUpdateClients;
- (void)_updateHostingAndDisplayingSupport;
- (void)_updateRelayCapabilities;
- (void)_updateState;
- (void)accountsChanged;
- (void)addThumperRegisteredDeviceID:(id)a3 forThumperAccountID:(id)a4;
- (void)callCapabilitiesState:(id)a3;
- (void)cancelPinRequestFromPrimaryDevice;
- (void)dealloc;
- (void)deviceCapabilityChanged:(id)a3;
- (void)deviceListChanged:(id)a3;
- (void)endEmergencyCallbackMode;
- (void)faceTimeAvailabilityChanged;
- (void)invalidateAndRefreshThumperCallingProvisioningURLForSenderIdentityWithUUID:(id)a3;
- (void)invalidateAndRefreshWiFiCallingProvisioningURLForSenderIdentityWithUUID:(id)a3;
- (void)outgoingCallerIDChanged;
- (void)registerClient:(id)a3;
- (void)removeThumperRegisteredDeviceID:(id)a3 forThumperAccountID:(id)a4;
- (void)requestPinFromPrimaryDevice;
- (void)setPairedHostDeviceState:(id)a3;
- (void)setRelayCallingEnabled:(BOOL)a3;
- (void)setRelayCallingEnabled:(BOOL)a3 forDeviceWithID:(id)a4;
- (void)setState:(id)a3;
- (void)setThumperCallingAllowed:(BOOL)a3 onSecondaryDeviceWithID:(id)a4 forSenderIdentityWithUUID:(id)a5;
- (void)setThumperCallingAllowedOnDefaultPairedDevice:(BOOL)a3 forSenderIdentityWithUUID:(id)a4;
- (void)setThumperCallingEnabled:(BOOL)a3 forSenderIdentityWithUUID:(id)a4;
- (void)setVoLTECallingEnabled:(BOOL)a3 forSenderIdentityWithUUID:(id)a4;
- (void)setWiFiCallingEnabled:(BOOL)a3 forSenderIdentityWithUUID:(id)a4;
- (void)setWiFiCallingRoamingEnabled:(BOOL)a3 forSenderIdentityWithUUID:(id)a4;
- (void)telephonyCallCapabilitiesChanged;
- (void)unregisterClient:(id)a3;
- (void)updatePairedHostDeviceCallCapabilitiesState:(id)a3;
- (void)updateState;
@end

@implementation CSDCallCapabilities

- (void)callCapabilitiesState:(id)a3
{
  v4 = (void (**)(id, void))a3;
  v5 = [(CSDCallCapabilities *)self clientManager];
  v6 = [v5 currentClient];

  v7 = sub_100008DCC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = [v6 processName];
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "TUCallCapabilitiesXPCServer - callCapabilitiesState request from %@", (uint8_t *)&buf, 0xCu);
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v12 = 0x3032000000;
  v13 = sub_1000E2C80;
  v14 = sub_1000E2C90;
  id v15 = 0;
  v9[5] = &buf;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000E2E30;
  v10[3] = &unk_100505008;
  v10[4] = self;
  v10[5] = &buf;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100007F30;
  v9[3] = &unk_100505008;
  v9[4] = self;
  sub_1000085AC(v6, @"access-call-capabilities", v10, v9, 0);
  v4[2](v4, *(void *)(*((void *)&buf + 1) + 40));
  _Block_object_dispose(&buf, 8);
}

- (TUCallCapabilitiesState)state
{
  return self->_state;
}

- (CSDClientManager)clientManager
{
  return self->_clientManager;
}

+ (CSDCallCapabilities)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000E1ACC;
  block[3] = &unk_1005057B8;
  block[4] = a1;
  if (qword_10058C3A8 != -1) {
    dispatch_once(&qword_10058C3A8, block);
  }
  v2 = (void *)qword_10058C3A0;

  return (CSDCallCapabilities *)v2;
}

- (CSDCallCapabilities)init
{
  v3 = +[CSDRelayIDSService sharedInstance];
  v4 = +[CSDThumperIDSService sharedInstance];
  id v5 = objc_alloc_init((Class)TUFeatureFlags);
  v6 = [(CSDCallCapabilities *)self initWithRelayService:v3 thumperService:v4 featureFlags:v5];

  return v6;
}

- (CSDCallCapabilities)initWithRelayService:(id)a3 thumperService:(id)a4 featureFlags:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v44.receiver = self;
  v44.super_class = (Class)CSDCallCapabilities;
  uint64_t v12 = [(CSDCallCapabilities *)&v44 init];
  if (v12)
  {
    dispatch_queue_t v13 = dispatch_queue_create("com.apple.telephonyutilities.callservicesd.callcapabilities", 0);
    queue = v12->_queue;
    v12->_queue = (OS_dispatch_queue *)v13;

    objc_storeStrong((id *)&v12->_featureFlags, a5);
    id v15 = [[CSDClientManager alloc] initWithSerialQueue:v12->_queue];
    clientManager = v12->_clientManager;
    v12->_clientManager = v15;

    v17 = v12->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000E1FB4;
    block[3] = &unk_100504EC0;
    v18 = v12;
    v43 = v18;
    dispatch_sync(v17, block);
    objc_initWeak(&location, v18);
    v19 = [CSDProcessObserver alloc];
    uint64_t v45 = TUBundleIdentifierInCallServiceApplication;
    v20 = +[NSArray arrayWithObjects:&v45 count:1];
    v21 = [(CSDProcessObserver *)v19 initWithBundleIdentifiers:v20 queue:v12->_queue];
    processObserver = v18->_processObserver;
    v18->_processObserver = (CSDProcessObserverProtocol *)v21;

    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472;
    v39[2] = sub_1000E2270;
    v39[3] = &unk_100507080;
    objc_copyWeak(&v40, &location);
    [(CSDProcessObserverProtocol *)v18->_processObserver setProcessStateChanged:v39];
    objc_storeStrong((id *)&v18->_relayService, a3);
    objc_storeStrong((id *)&v18->_thumperService, a4);
    v23 = objc_alloc_init(CSDAccountsController);
    accountsController = v18->_accountsController;
    v18->_accountsController = v23;

    [(CSDAccountsController *)v18->_accountsController setDelegate:v18];
    v25 = [[CSDTelephonyCallCapabilities alloc] initWithQueue:v12->_queue];
    telephonyCallCapabilities = v18->_telephonyCallCapabilities;
    v18->_telephonyCallCapabilities = v25;

    [(CSDTelephonyCallCapabilities *)v18->_telephonyCallCapabilities setDelegate:v18];
    v27 = objc_alloc_init(CSDThumperPushHandler);
    thumperPushHandler = v18->_thumperPushHandler;
    v18->_thumperPushHandler = v27;

    v29 = [[CSDPinExchangeController alloc] initWithDelegate:v18->_thumperPushHandler];
    thumperPinExchangeController = v18->_thumperPinExchangeController;
    v18->_thumperPinExchangeController = v29;

    v31 = objc_alloc_init(CSDThumperCapabilitiesMonitor);
    thumperCapabilitiesMonitor = v18->_thumperCapabilitiesMonitor;
    v18->_thumperCapabilitiesMonitor = v31;

    [(CSDThumperCapabilitiesMonitor *)v18->_thumperCapabilitiesMonitor setDataSource:v18];
    v33 = +[NSNotificationCenter defaultCenter];
    [v33 addObserver:v18 selector:"deviceListChanged:" name:@"CSDIDSDeviceListChangedNotification" object:v18->_relayService];

    v34 = +[NSNotificationCenter defaultCenter];
    [v34 addObserver:v18 selector:"deviceCapabilityChanged:" name:FaceTimeDeviceCapabilityChangedNotification object:0];

    v35 = v12->_queue;
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_1000E2558;
    v37[3] = &unk_100504EC0;
    v38 = v18;
    dispatch_async(v35, v37);

    objc_destroyWeak(&v40);
    objc_destroyWeak(&location);
  }
  return v12;
}

- (NSString)debugDescription
{
  v3 = +[NSMutableString stringWithFormat:@"%@\n", self];
  v4 = [(CSDCallCapabilities *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000E275C;
  block[3] = &unk_100504F10;
  id v5 = v3;
  id v9 = v5;
  id v10 = self;
  dispatch_sync(v4, block);

  id v6 = v5;
  return (NSString *)v6;
}

- (void)dealloc
{
  v3 = [(CSDCallCapabilities *)self xpcListener];
  [v3 invalidate];

  v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)CSDCallCapabilities;
  [(CSDCallCapabilities *)&v5 dealloc];
}

- (void)_updateClientsWithState
{
  v3 = sub_100008DCC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = [(CSDCallCapabilities *)self state];
    *(_DWORD *)long long buf = 138412290;
    v20 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Updating clients with new call capabilities state: %@", buf, 0xCu);
  }
  objc_super v5 = [(CSDCallCapabilities *)self state];
  id v6 = [v5 copy];

  v7 = [(CSDCallCapabilities *)self state];
  v8 = [v7 publiclyAccessibleCopy];

  id v9 = sub_1001936D0(@"access-call-capabilities");
  id v10 = [(CSDCallCapabilities *)self clientManager];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000E2AD8;
  v15[3] = &unk_100507340;
  id v17 = v8;
  id v18 = v9;
  id v16 = v6;
  id v11 = v8;
  id v12 = v6;
  id v13 = v9;
  v14 = NSStringFromSelector("capabilityStateUpdated:");
  [v10 performBlockOnClients:v15 coalescedByIdentifier:v14];
}

- (TUCallCapabilitiesState)callCapabilitiesState
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = sub_1000E2C80;
  id v11 = sub_1000E2C90;
  id v12 = 0;
  v3 = [(CSDCallCapabilities *)self queue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000E2C98;
  v6[3] = &unk_100505008;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (TUCallCapabilitiesState *)v4;
}

- (void)updatePairedHostDeviceCallCapabilitiesState:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(CSDCallCapabilities *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000E2D98;
  v7[3] = &unk_100504F10;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)setRelayCallingEnabled:(BOOL)a3
{
  objc_super v5 = [(CSDCallCapabilities *)self clientManager];
  id v6 = [v5 currentClient];

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000E2F58;
  v7[3] = &unk_100505030;
  BOOL v8 = a3;
  v7[4] = self;
  sub_1000085AC(v6, @"modify-call-capabilities", v7, 0, (uint64_t)"-[CSDCallCapabilities setRelayCallingEnabled:]");
}

- (void)setRelayCallingEnabled:(BOOL)a3 forDeviceWithID:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(CSDCallCapabilities *)self clientManager];
  BOOL v8 = [v7 currentClient];

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000E30FC;
  v10[3] = &unk_1005050D0;
  BOOL v13 = a3;
  id v11 = v6;
  id v12 = self;
  id v9 = v6;
  sub_1000085AC(v8, @"modify-call-capabilities", v10, 0, (uint64_t)"-[CSDCallCapabilities setRelayCallingEnabled:forDeviceWithID:]");
}

- (void)setWiFiCallingEnabled:(BOOL)a3 forSenderIdentityWithUUID:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(CSDCallCapabilities *)self clientManager];
  BOOL v8 = [v7 currentClient];

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000E32B0;
  v10[3] = &unk_1005050D0;
  BOOL v13 = a3;
  id v11 = v6;
  id v12 = self;
  id v9 = v6;
  sub_1000085AC(v8, @"modify-call-capabilities", v10, 0, (uint64_t)"-[CSDCallCapabilities setWiFiCallingEnabled:forSenderIdentityWithUUID:]");
}

- (void)setWiFiCallingRoamingEnabled:(BOOL)a3 forSenderIdentityWithUUID:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(CSDCallCapabilities *)self clientManager];
  BOOL v8 = [v7 currentClient];

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000E3464;
  v10[3] = &unk_1005050D0;
  BOOL v13 = a3;
  id v11 = v6;
  id v12 = self;
  id v9 = v6;
  sub_1000085AC(v8, @"modify-call-capabilities", v10, 0, (uint64_t)"-[CSDCallCapabilities setWiFiCallingRoamingEnabled:forSenderIdentityWithUUID:]");
}

- (void)setVoLTECallingEnabled:(BOOL)a3 forSenderIdentityWithUUID:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(CSDCallCapabilities *)self clientManager];
  BOOL v8 = [v7 currentClient];

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000E3618;
  v10[3] = &unk_1005050D0;
  BOOL v13 = a3;
  id v11 = v6;
  id v12 = self;
  id v9 = v6;
  sub_1000085AC(v8, @"modify-call-capabilities", v10, 0, (uint64_t)"-[CSDCallCapabilities setVoLTECallingEnabled:forSenderIdentityWithUUID:]");
}

- (void)setThumperCallingEnabled:(BOOL)a3 forSenderIdentityWithUUID:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(CSDCallCapabilities *)self clientManager];
  BOOL v8 = [v7 currentClient];

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000E37CC;
  v10[3] = &unk_1005050D0;
  BOOL v13 = a3;
  id v11 = v6;
  id v12 = self;
  id v9 = v6;
  sub_1000085AC(v8, @"modify-call-capabilities", v10, 0, (uint64_t)"-[CSDCallCapabilities setThumperCallingEnabled:forSenderIdentityWithUUID:]");
}

- (void)setThumperCallingAllowed:(BOOL)a3 onSecondaryDeviceWithID:(id)a4 forSenderIdentityWithUUID:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = [(CSDCallCapabilities *)self clientManager];
  id v11 = [v10 currentClient];

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000E39A4;
  v14[3] = &unk_100506C18;
  BOOL v18 = a3;
  id v15 = v8;
  id v16 = v9;
  id v17 = self;
  id v12 = v9;
  id v13 = v8;
  sub_1000085AC(v11, @"modify-call-capabilities", v14, 0, (uint64_t)"-[CSDCallCapabilities setThumperCallingAllowed:onSecondaryDeviceWithID:forSenderIdentityWithUUID:]");
}

- (void)setThumperCallingAllowedOnDefaultPairedDevice:(BOOL)a3 forSenderIdentityWithUUID:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(CSDCallCapabilities *)self clientManager];
  id v8 = [v7 currentClient];

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000E3B64;
  v10[3] = &unk_1005050D0;
  BOOL v13 = a3;
  id v11 = v6;
  id v12 = self;
  id v9 = v6;
  sub_1000085AC(v8, @"modify-call-capabilities", v10, 0, (uint64_t)"-[CSDCallCapabilities setThumperCallingAllowedOnDefaultPairedDevice:forSenderIdentityWithUUID:]");
}

- (void)endEmergencyCallbackMode
{
  v3 = [(CSDCallCapabilities *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(CSDCallCapabilities *)self clientManager];
  objc_super v5 = [v4 currentClient];

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000E3CFC;
  v6[3] = &unk_100504EC0;
  v6[4] = self;
  sub_1000085AC(v5, @"modify-call-capabilities", v6, 0, (uint64_t)"-[CSDCallCapabilities endEmergencyCallbackMode]");
}

- (void)invalidateAndRefreshWiFiCallingProvisioningURLForSenderIdentityWithUUID:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(CSDCallCapabilities *)self clientManager];
  id v6 = [v5 currentClient];

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000E3E60;
  v8[3] = &unk_100504F10;
  id v9 = v4;
  id v10 = self;
  id v7 = v4;
  sub_1000085AC(v6, @"modify-call-capabilities", v8, 0, (uint64_t)"-[CSDCallCapabilities invalidateAndRefreshWiFiCallingProvisioningURLForSenderIdentityWithUUID:]");
}

- (void)invalidateAndRefreshThumperCallingProvisioningURLForSenderIdentityWithUUID:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(CSDCallCapabilities *)self clientManager];
  id v6 = [v5 currentClient];

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000E4004;
  v8[3] = &unk_100504F10;
  id v9 = v4;
  id v10 = self;
  id v7 = v4;
  sub_1000085AC(v6, @"modify-call-capabilities", v8, 0, (uint64_t)"-[CSDCallCapabilities invalidateAndRefreshThumperCallingProvisioningURLForSenderIdentityWithUUID:]");
}

- (void)requestPinFromPrimaryDevice
{
  v3 = [(CSDCallCapabilities *)self clientManager];
  id v4 = [v3 currentClient];

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000E4184;
  v5[3] = &unk_100504EC0;
  v5[4] = self;
  sub_1000085AC(v4, @"modify-call-capabilities", v5, 0, (uint64_t)"-[CSDCallCapabilities requestPinFromPrimaryDevice]");
}

- (void)cancelPinRequestFromPrimaryDevice
{
  v3 = [(CSDCallCapabilities *)self clientManager];
  id v4 = [v3 currentClient];

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000E4458;
  v5[3] = &unk_100504EC0;
  v5[4] = self;
  sub_1000085AC(v4, @"modify-call-capabilities", v5, 0, (uint64_t)"-[CSDCallCapabilities cancelPinRequestFromPrimaryDevice]");
}

- (void)registerClient:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(CSDCallCapabilities *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000E4590;
  v7[3] = &unk_100504F10;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)unregisterClient:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(CSDCallCapabilities *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000E4698;
  v7[3] = &unk_100504F10;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)deviceListChanged:(id)a3
{
  id v4 = a3;
  objc_super v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Received device list changed notification: %@", buf, 0xCu);
  }

  id v6 = [(CSDCallCapabilities *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000E4808;
  block[3] = &unk_100504EC0;
  void block[4] = self;
  dispatch_async(v6, block);
}

- (void)deviceCapabilityChanged:(id)a3
{
  id v4 = a3;
  objc_super v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Received device capability changed notification: %@", buf, 0xCu);
  }

  id v6 = [(CSDCallCapabilities *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000E492C;
  block[3] = &unk_100504EC0;
  void block[4] = self;
  dispatch_async(v6, block);
}

- (void)accountsChanged
{
  v3 = sub_100008DCC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Received accounts changed delegate callback", buf, 2u);
  }

  id v4 = [(CSDCallCapabilities *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000E4A38;
  block[3] = &unk_100504EC0;
  void block[4] = self;
  dispatch_async(v4, block);
}

- (void)faceTimeAvailabilityChanged
{
  v3 = sub_100008DCC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Received FaceTime availability changed delegate callback", buf, 2u);
  }

  id v4 = [(CSDCallCapabilities *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000E4B10;
  block[3] = &unk_100504EC0;
  void block[4] = self;
  dispatch_async(v4, block);
}

- (void)outgoingCallerIDChanged
{
  v3 = sub_100008DCC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Received outgoingCallerIDChanged delegate callback", buf, 2u);
  }

  id v4 = [(CSDCallCapabilities *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000E4BE8;
  block[3] = &unk_100504EC0;
  void block[4] = self;
  dispatch_async(v4, block);
}

- (void)telephonyCallCapabilitiesChanged
{
  v3 = [(CSDCallCapabilities *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = sub_100008DCC();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Received telephonyCallCapabilitiesChanged delegate callback", v5, 2u);
  }

  [(CSDCallCapabilities *)self _updateDynamicCapabilitiesAndUpdateClients];
}

- (BOOL)isThumperRegisteredDeviceID:(id)a3 forThumperAccountID:(id)a4
{
  id v6 = a3;
  id v7 = [(CSDCallCapabilities *)self thumperCallingCapabilitiesStateForAccountID:a4];
  id v8 = v7;
  if (v7)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v15 = 0u;
    id v9 = objc_msgSend(v7, "approvedSecondaryDeviceIDs", 0, 0);
    id v10 = (char *)[v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v15;
      while (2)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(void *)v15 != v11) {
            objc_enumerationMutation(v9);
          }
          if (TUStringsAreCaseInsensitiveEqual())
          {
            LOBYTE(v10) = 1;
            goto LABEL_12;
          }
        }
        id v10 = (char *)[v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    LOBYTE(v10) = 0;
  }

  return (char)v10;
}

- (void)addThumperRegisteredDeviceID:(id)a3 forThumperAccountID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(CSDCallCapabilities *)self thumperCallingCapabilitiesStateByUUID];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v19 = long long v27 = 0u;
  id obj = [v19 allKeys];
  id v8 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v25;
    BOOL v18 = v6;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v25 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v24 + 1) + 8 * i);
        BOOL v13 = [(CSDCallCapabilities *)self thumperCallingCapabilitiesStateByUUID];
        long long v14 = [v13 objectForKeyedSubscript:v12];
        long long v15 = [v14 accountID];
        int v16 = TUStringsAreCaseInsensitiveEqual();

        if (v16)
        {
          long long v17 = [(CSDCallCapabilities *)self queue];
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_1000E51E4;
          block[3] = &unk_100504FE0;
          void block[4] = self;
          id v6 = v18;
          id v22 = v18;
          uint64_t v23 = v12;
          dispatch_async(v17, block);

          goto LABEL_11;
        }
      }
      id v9 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
      id v6 = v18;
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

- (void)removeThumperRegisteredDeviceID:(id)a3 forThumperAccountID:(id)a4
{
  id v19 = a3;
  id v6 = a4;
  [(CSDCallCapabilities *)self thumperCallingCapabilitiesStateByUUID];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  BOOL v18 = v30 = 0u;
  id obj = [v18 allKeys];
  id v7 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v28;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v28 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v27 + 1) + 8 * i);
        if (v6)
        {
          uint64_t v12 = [(CSDCallCapabilities *)self thumperCallingCapabilitiesStateByUUID];
          BOOL v13 = [v12 objectForKeyedSubscript:v11];
          long long v14 = [v13 accountID];
          int v15 = TUStringsAreCaseInsensitiveEqual();

          if (v15)
          {
            long long v17 = [(CSDCallCapabilities *)self queue];
            v24[0] = _NSConcreteStackBlock;
            v24[1] = 3221225472;
            v24[2] = sub_1000E5484;
            v24[3] = &unk_100504FE0;
            v24[4] = self;
            id v25 = v19;
            uint64_t v26 = v11;
            dispatch_async(v17, v24);

            goto LABEL_12;
          }
        }
        else
        {
          int v16 = [(CSDCallCapabilities *)self queue];
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_1000E5498;
          block[3] = &unk_100504FE0;
          void block[4] = self;
          id v22 = v19;
          uint64_t v23 = v11;
          dispatch_async(v16, block);
        }
      }
      id v8 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v8);
  }
LABEL_12:
}

- (NSArray)localThumperAccounts
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = sub_1000E2C80;
  uint64_t v11 = sub_1000E2C90;
  id v12 = 0;
  v3 = [(CSDCallCapabilities *)self queue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000E55C8;
  v6[3] = &unk_100505008;
  v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

- (NSArray)secondaryThumperAccounts
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = sub_1000E2C80;
  uint64_t v11 = sub_1000E2C90;
  id v12 = 0;
  v3 = [(CSDCallCapabilities *)self queue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000E574C;
  v6[3] = &unk_100505008;
  v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

- (id)secondaryThumperAccountForAccountID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  BOOL v13 = &v12;
  uint64_t v14 = 0x3032000000;
  int v15 = sub_1000E2C80;
  int v16 = sub_1000E2C90;
  id v17 = 0;
  objc_super v5 = [(CSDCallCapabilities *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000E58F8;
  block[3] = &unk_100507368;
  id v10 = v4;
  uint64_t v11 = &v12;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (id)thumperCallingCapabilitiesStateForAccountID:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(CSDCallCapabilities *)self thumperCallingCapabilitiesStateByUUID];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = [v5 allKeys];
  id v6 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v6)
  {
    id v7 = v6;
    BOOL v18 = v5;
    uint64_t v8 = *(void *)v21;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v11 = [(CSDCallCapabilities *)self thumperCallingCapabilitiesStateByUUID];
        uint64_t v12 = [v11 objectForKeyedSubscript:v10];
        BOOL v13 = [v12 accountID];
        int v14 = TUStringsAreCaseInsensitiveEqual();

        if (v14)
        {
          int v16 = [(CSDCallCapabilities *)self thumperCallingCapabilitiesStateByUUID];
          int v15 = [v16 objectForKeyedSubscript:v10];

          goto LABEL_11;
        }
      }
      id v7 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v7) {
        continue;
      }
      break;
    }
    int v15 = 0;
LABEL_11:
    objc_super v5 = v18;
  }
  else
  {
    int v15 = 0;
  }

  return v15;
}

- (NSDictionary)thumperCallingCapabilitiesStateByUUID
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = sub_1000E2C80;
  uint64_t v11 = sub_1000E2C90;
  id v12 = +[NSMutableDictionary dictionary];
  v3 = [(CSDCallCapabilities *)self queue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000E5C50;
  v6[3] = &unk_100506E98;
  v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = [(id)v8[5] copy];
  _Block_object_dispose(&v7, 8);

  return (NSDictionary *)v4;
}

- (void)updateState
{
  v3 = [(CSDCallCapabilities *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000E5E3C;
  block[3] = &unk_100504EC0;
  void block[4] = self;
  dispatch_async(v3, block);
}

- (void)_updateState
{
  [(CSDCallCapabilities *)self _updateHostingAndDisplayingSupport];
  [(CSDCallCapabilities *)self _updateCallAvailability];
  [(CSDCallCapabilities *)self _updateRelayCapabilities];

  [(CSDCallCapabilities *)self _updateCTCapabilities];
}

- (void)_updateHostingAndDisplayingSupport
{
  BOOL v3 = [(CSDCallCapabilities *)self _supportsPrimaryCalling];
  id v4 = [(CSDCallCapabilities *)self state];
  [v4 setSupportsPrimaryCalling:v3];

  BOOL v5 = [(CSDCallCapabilities *)self _supportsBasebandCalling];
  id v6 = [(CSDCallCapabilities *)self state];
  [v6 setSupportsBasebandCalling:v5];

  BOOL v7 = [(CSDCallCapabilities *)self _supportsCellularData];
  uint64_t v8 = [(CSDCallCapabilities *)self state];
  [v8 setSupportsCellularData:v7];

  BOOL v9 = [(CSDCallCapabilities *)self _supportsDisplayingTelephonyCalls];
  uint64_t v10 = [(CSDCallCapabilities *)self state];
  [v10 setSupportsDisplayingTelephonyCalls:v9];

  BOOL v11 = [(CSDCallCapabilities *)self _supportsDisplayingFaceTimeAudioCalls];
  id v12 = [(CSDCallCapabilities *)self state];
  [v12 setSupportsDisplayingFaceTimeAudioCalls:v11];

  BOOL v13 = [(CSDCallCapabilities *)self _supportsDisplayingFaceTimeVideoCalls];
  id v14 = [(CSDCallCapabilities *)self state];
  [v14 setSupportsDisplayingFaceTimeVideoCalls:v13];
}

- (unsigned)_defaultOverrideForDisableDefault:(id)a3 forceDefault:(id)a4
{
  BOOL v5 = (__CFString *)a3;
  id v6 = (__CFString *)a4;
  Boolean keyExistsAndHasValidFormat = 0;
  CFStringRef v7 = (const __CFString *)TUBundleIdentifierTelephonyUtilitiesFramework;
  unsigned __int8 v8 = 0;
  if (CFPreferencesGetAppBooleanValue(v5, TUBundleIdentifierTelephonyUtilitiesFramework, &keyExistsAndHasValidFormat)) {
    BOOL v9 = keyExistsAndHasValidFormat == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9)
  {
    uint64_t v10 = sub_100008DCC();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      int v16 = v5;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[WARN] Disabling support because %@ was set to YES", buf, 0xCu);
    }

    unsigned __int8 v8 = 2;
  }
  if (CFPreferencesGetAppBooleanValue(v6, v7, &keyExistsAndHasValidFormat)) {
    BOOL v11 = keyExistsAndHasValidFormat == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (!v11)
  {
    id v12 = sub_100008DCC();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      int v16 = v6;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "[WARN] Enabling support because %@ was set to YES", buf, 0xCu);
    }

    unsigned __int8 v8 = 1;
  }

  return v8;
}

- (BOOL)_supportsPrimaryCalling
{
  BOOL v3 = +[FTDeviceSupport sharedInstance];
  unsigned __int8 v4 = [v3 isTelephonyDevice];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000E62C4;
  block[3] = &unk_100504EC0;
  void block[4] = self;
  if (qword_10058C3B8 != -1) {
    dispatch_once(&qword_10058C3B8, block);
  }
  if (byte_10058C3B0 == 2) {
    return 0;
  }
  if (byte_10058C3B0 == 1) {
    return 1;
  }
  return v4;
}

- (BOOL)_supportsBasebandCalling
{
  char v3 = MGGetBoolAnswer();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000E63B8;
  block[3] = &unk_100504EC0;
  void block[4] = self;
  if (qword_10058C3C8 != -1) {
    dispatch_once(&qword_10058C3C8, block);
  }
  if (byte_10058C3C0 == 1) {
    BOOL v4 = 1;
  }
  else {
    BOOL v4 = v3;
  }
  return byte_10058C3C0 != 2 && v4;
}

- (BOOL)_supportsCellularData
{
  char v3 = +[FTDeviceSupport sharedInstance];
  unsigned __int8 v4 = [v3 supportsCellularData];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000E64CC;
  block[3] = &unk_100504EC0;
  void block[4] = self;
  if (qword_10058C3D8 != -1) {
    dispatch_once(&qword_10058C3D8, block);
  }
  if (byte_10058C3D0 == 2) {
    return 0;
  }
  if (byte_10058C3D0 == 1) {
    return 1;
  }
  return v4;
}

- (BOOL)_supportsDisplayingTelephonyCalls
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000E6598;
  block[3] = &unk_100504EC0;
  void block[4] = self;
  if (qword_10058C3E8 != -1) {
    dispatch_once(&qword_10058C3E8, block);
  }
  return byte_10058C3E0 != 2;
}

- (BOOL)_supportsDisplayingFaceTimeAudioCalls
{
  char v3 = +[FTDeviceSupport sharedInstance];
  unsigned __int8 v4 = objc_msgSend(v3, "inProcess_isCallingSupported");

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000E66AC;
  block[3] = &unk_100504EC0;
  void block[4] = self;
  if (qword_10058C3F8 != -1) {
    dispatch_once(&qword_10058C3F8, block);
  }
  if (byte_10058C3F0 == 2) {
    return 0;
  }
  if (byte_10058C3F0 == 1) {
    return 1;
  }
  return v4;
}

- (BOOL)_supportsDisplayingFaceTimeVideoCalls
{
  char v3 = +[FTDeviceSupport sharedInstance];
  unsigned __int8 v4 = [v3 faceTimeSupported];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000E67C0;
  block[3] = &unk_100504EC0;
  void block[4] = self;
  if (qword_10058C408 != -1) {
    dispatch_once(&qword_10058C408, block);
  }
  if (byte_10058C400 == 2) {
    return 0;
  }
  if (byte_10058C400 == 1) {
    return 1;
  }
  return v4;
}

- (void)_updateCallAvailability
{
  char v3 = [(CSDCallCapabilities *)self accountsController];
  id v4 = [v3 isFaceTimeAudioAvailable];
  BOOL v5 = [(CSDCallCapabilities *)self state];
  [v5 setFaceTimeAudioAvailable:v4];

  id v8 = [(CSDCallCapabilities *)self accountsController];
  id v6 = [v8 isFaceTimeVideoAvailable];
  CFStringRef v7 = [(CSDCallCapabilities *)self state];
  [v7 setFaceTimeVideoAvailable:v6];
}

- (void)_updateDynamicCapabilitiesAndUpdateClients
{
  [(CSDCallCapabilities *)self _updateCallAvailability];
  [(CSDCallCapabilities *)self _updateRelayCapabilities];
  [(CSDCallCapabilities *)self _updateCTCapabilities];
  [(CSDCallCapabilities *)self _updateClientsWithState];

  [(CSDCallCapabilities *)self _updateDefaultAppIfNecessary];
}

- (void)_updateCTCapabilities
{
  BOOL v5 = [(CSDCallCapabilities *)self telephonyCallCapabilities];
  id v6 = [v5 areCapabilitiesValid];
  CFStringRef v7 = [(CSDCallCapabilities *)self state];
  [v7 setCtCapabilitiesValid:v6];

  id v8 = [(CSDCallCapabilities *)self telephonyCallCapabilities];
  id v9 = [v8 isEmergencyCallbackModeEnabled];
  uint64_t v10 = [(CSDCallCapabilities *)self state];
  [v10 setEmergencyCallbackModeEnabled:v9];

  BOOL v11 = [(CSDCallCapabilities *)self telephonyCallCapabilities];
  id v12 = [v11 isEmergencyCallbackPossible];
  BOOL v13 = [(CSDCallCapabilities *)self state];
  [v13 setEmergencyCallbackPossible:v12];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000E6F00;
  block[3] = &unk_100504EC0;
  void block[4] = self;
  if (qword_10058C418 != -1) {
    dispatch_once(&qword_10058C418, block);
  }
  id v14 = [(CSDCallCapabilities *)self telephonyCallCapabilities];
  int v15 = [v14 senderIdentityCapabilitiesStateByUUID];

  +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v15 count]);
  v49 = v48 = v15;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id obj = [v15 allKeys];
  id v16 = [obj countByEnumeratingWithState:&v50 objects:v57 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v47 = *(void *)v51;
    do
    {
      for (i = 0; i != v17; i = (char *)i + 1)
      {
        if (*(void *)v51 != v47) {
          objc_enumerationMutation(obj);
        }
        uint64_t v19 = *(void *)(*((void *)&v50 + 1) + 8 * i);
        long long v20 = [v48 objectForKeyedSubscript:v19];
        id v21 = [v20 copy];

        if (byte_10058C410 == 1)
        {
          long long v22 = [v21 wiFiCallingCapabilitiesState];
          long long v23 = v22;
          uint64_t v24 = 1;
        }
        else
        {
          if (byte_10058C410 != 2) {
            goto LABEL_13;
          }
          long long v22 = [v21 wiFiCallingCapabilitiesState];
          long long v23 = v22;
          uint64_t v24 = 0;
        }
        [v22 setSupported:v24];

LABEL_13:
        if (byte_10058C411 == 1)
        {
          id v25 = [v21 voLTECallingCapabilitiesState];
          uint64_t v26 = v25;
          uint64_t v27 = 1;
        }
        else
        {
          if (byte_10058C411 != 2) {
            goto LABEL_18;
          }
          id v25 = [v21 voLTECallingCapabilitiesState];
          uint64_t v26 = v25;
          uint64_t v27 = 0;
        }
        [v25 setSupported:v27];

LABEL_18:
        long long v28 = [v21 thumperCallingCapabilitiesState];
        long long v29 = v28;
        if (byte_10058C412 == 2)
        {
          uint64_t v30 = 0;
          goto LABEL_22;
        }
        if (byte_10058C412 == 1)
        {
          uint64_t v30 = 1;
LABEL_22:
          [v28 setSupported:v30];
        }
        objc_msgSend(v29, "setSupported:", -[CSDCallCapabilities _supportsThumperCallingUsingSenderIdentityCapabilitiesState:](self, "_supportsThumperCallingUsingSenderIdentityCapabilitiesState:", v21));
        objc_msgSend(v29, "setApproved:", -[CSDCallCapabilities _isThumperCallingAllowedForCurrentDeviceUsingSenderIdentityCapabilitiesState:](self, "_isThumperCallingAllowedForCurrentDeviceUsingSenderIdentityCapabilitiesState:", v21));
        v31 = [(CSDCallCapabilities *)self state];
        unsigned __int8 v32 = [v31 isRelayCallingEnabled];
        if ((v32 & 1) == 0)
        {
          v2 = [(CSDCallCapabilities *)self state];
          char v3 = [v2 defaultPairedDevice];
          if (!v3)
          {
            [v29 setEnabled:0];
LABEL_32:

            goto LABEL_33;
          }
        }
        if ([v29 isSupported] && objc_msgSend(v29, "isApproved"))
        {
          id v33 = [v29 isEnabled];
          v34 = v29;
        }
        else
        {
          v34 = v29;
          id v33 = 0;
        }
        [v34 setEnabled:v33];
        if ((v32 & 1) == 0) {
          goto LABEL_32;
        }
LABEL_33:

        v35 = [(CSDCallCapabilities *)self state];
        unsigned __int8 v36 = [v35 supportsBasebandCalling];

        if ((v36 & 1) == 0) {
          [v21 setSupportsSimultaneousVoiceAndData:1];
        }
        [v49 setObject:v21 forKeyedSubscript:v19];
      }
      id v17 = [obj countByEnumeratingWithState:&v50 objects:v57 count:16];
    }
    while (v17);
  }

  v37 = [(CSDCallCapabilities *)self state];
  [v37 setSenderIdentityCapabilitiesStateByUUID:v49];

  v38 = [(CSDCallCapabilities *)self state];
  if ([v38 supportsPrimaryCalling]) {
    goto LABEL_49;
  }
  v39 = [(CSDCallCapabilities *)self state];
  unsigned int v40 = [v39 accountsSupportSecondaryCalling];

  if (v40)
  {
    v41 = [(CSDCallCapabilities *)self _primaryThumperAccountRequiringMatchingCallerID];
    v38 = [v41 accountID];

    v42 = sub_100008DCC();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      v56 = v38;
      _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "Found primary Thumper account ID %@", buf, 0xCu);
    }

    if (v38
      && ![(CSDCallCapabilities *)self isThumperCallingSupportedForAccountID:v38])
    {
      v43 = sub_100008DCC();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        v56 = v38;
        _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "Thumper calling is not supported for account ID %@", buf, 0xCu);
      }

      v38 = 0;
    }
    objc_super v44 = sub_100008DCC();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      v56 = v38;
      _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "Setting associated Thumper account ID %@", buf, 0xCu);
    }

    uint64_t v45 = [(CSDCallCapabilities *)self telephonyCallCapabilities];
    [v45 setThumperCallingAssociatedAccountID:v38];

LABEL_49:
  }
}

- (BOOL)isThumperCallingSupportedForAccountID:(id)a3
{
  id v4 = a3;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  BOOL v5 = [(CSDCallCapabilities *)self state];
  id v6 = [v5 senderIdentityCapabilitiesStateByUUID];
  CFStringRef v7 = [v6 allKeys];

  id v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v21;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        BOOL v13 = [(CSDCallCapabilities *)self state];
        id v14 = [v13 senderIdentityCapabilitiesStateByUUID];
        int v15 = [v14 objectForKeyedSubscript:v12];
        id v16 = [v15 thumperCallingCapabilitiesState];

        id v17 = [v16 accountID];
        LODWORD(v14) = TUStringsAreCaseInsensitiveEqual();

        if (v14)
        {
          unsigned __int8 v18 = [v16 isSupported];

          goto LABEL_11;
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  unsigned __int8 v18 = 0;
LABEL_11:

  return v18;
}

- (void)_setWiFiCallingEnabled:(BOOL)a3 forSenderIdentityWithUUID:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  CFStringRef v7 = [(CSDCallCapabilities *)self state];
  id v8 = [v7 senderIdentityCapabilitiesStateByUUID];
  id v9 = [v8 objectForKeyedSubscript:v6];
  uint64_t v10 = [v9 wiFiCallingCapabilitiesState];
  unsigned int v11 = [v10 isEnabled];

  uint64_t v12 = sub_100008DCC();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v11 == v4)
  {
    if (v13)
    {
      int v14 = 67109376;
      unsigned int v15 = v11;
      __int16 v16 = 1024;
      BOOL v17 = v4;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "_setWiFiCallingEnabled: not updating value. Is currently %d and asked to set to %d", (uint8_t *)&v14, 0xEu);
    }
  }
  else
  {
    if (v13)
    {
      int v14 = 67109376;
      unsigned int v15 = v11;
      __int16 v16 = 1024;
      BOOL v17 = v4;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "_setWiFiCallingEnabled: asking to change value from %d to %d", (uint8_t *)&v14, 0xEu);
    }

    uint64_t v12 = [(CSDCallCapabilities *)self telephonyCallCapabilities];
    [v12 setWiFiCallingEnabled:v4 forSenderIdentityWithUUID:v6];
  }
}

- (void)_setVoLTECallingEnabled:(BOOL)a3 forSenderIdentityWithUUID:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  CFStringRef v7 = [(CSDCallCapabilities *)self state];
  id v8 = [v7 senderIdentityCapabilitiesStateByUUID];
  id v9 = [v8 objectForKeyedSubscript:v6];
  uint64_t v10 = [v9 voLTECallingCapabilitiesState];
  unsigned int v11 = [v10 isEnabled];

  uint64_t v12 = sub_100008DCC();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v11 == v4)
  {
    if (v13)
    {
      int v14 = 67109376;
      unsigned int v15 = v11;
      __int16 v16 = 1024;
      BOOL v17 = v4;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "_setVoLTECallingEnabled: not updating value. Is currently %d and asked to set to %d", (uint8_t *)&v14, 0xEu);
    }
  }
  else
  {
    if (v13)
    {
      int v14 = 67109376;
      unsigned int v15 = v11;
      __int16 v16 = 1024;
      BOOL v17 = v4;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "_setVoLTECallingEnabled: asking to change value from %d to %d", (uint8_t *)&v14, 0xEu);
    }

    uint64_t v12 = [(CSDCallCapabilities *)self telephonyCallCapabilities];
    [v12 setVoLTECallingEnabled:v4 forSenderIdentityWithUUID:v6];
  }
}

- (void)_setWiFiCallingRoamingEnabled:(BOOL)a3 forSenderIdentityWithUUID:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  CFStringRef v7 = [(CSDCallCapabilities *)self state];
  id v8 = [v7 senderIdentityCapabilitiesStateByUUID];
  id v9 = [v8 objectForKeyedSubscript:v6];
  uint64_t v10 = [v9 wiFiCallingCapabilitiesState];
  unsigned int v11 = [v10 isRoamingEnabled];

  uint64_t v12 = sub_100008DCC();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v11 == v4)
  {
    if (v13)
    {
      int v14 = 67109376;
      unsigned int v15 = v11;
      __int16 v16 = 1024;
      BOOL v17 = v4;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "_setWiFiCallingRoamingEnabled: not updating value. Is currently %d and asked to set to %d", (uint8_t *)&v14, 0xEu);
    }
  }
  else
  {
    if (v13)
    {
      int v14 = 67109376;
      unsigned int v15 = v11;
      __int16 v16 = 1024;
      BOOL v17 = v4;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "_setWiFiCallingRoamingEnabled: asking to change value from %d to %d", (uint8_t *)&v14, 0xEu);
    }

    uint64_t v12 = [(CSDCallCapabilities *)self telephonyCallCapabilities];
    [v12 setWiFiCallingRoamingEnabled:v4 forSenderIdentityWithUUID:v6];
  }
}

- (void)_setThumperCallingEnabled:(BOOL)a3 forSenderIdentityWithUUID:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  CFStringRef v7 = [(CSDCallCapabilities *)self state];
  id v8 = [v7 senderIdentityCapabilitiesStateByUUID];
  id v9 = [v8 objectForKeyedSubscript:v6];
  uint64_t v10 = [v9 thumperCallingCapabilitiesState];
  unsigned int v11 = [v10 isEnabled];

  uint64_t v12 = sub_100008DCC();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v11 == v4)
  {
    if (v13)
    {
      int v14 = 67109376;
      unsigned int v15 = v11;
      __int16 v16 = 1024;
      BOOL v17 = v4;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "_setThumperCallingEnabled: not updating value. Is currently %d and asked to set to %d", (uint8_t *)&v14, 0xEu);
    }
  }
  else
  {
    if (v13)
    {
      int v14 = 67109376;
      unsigned int v15 = v11;
      __int16 v16 = 1024;
      BOOL v17 = v4;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "_setThumperCallingEnabled: asking to change value from %d to %d", (uint8_t *)&v14, 0xEu);
    }

    uint64_t v12 = [(CSDCallCapabilities *)self telephonyCallCapabilities];
    [v12 setThumperCallingEnabled:v4 forSenderIdentityWithUUID:v6];
  }
}

- (void)_setThumperCallingAllowed:(BOOL)a3 onSecondaryDeviceWithID:(id)a4 forSenderIdentityWithUUID:(id)a5
{
  int v6 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [(CSDCallCapabilities *)self state];
  unsigned int v11 = [v10 senderIdentityCapabilitiesStateByUUID];
  uint64_t v12 = [v11 objectForKeyedSubscript:v9];
  BOOL v13 = [v12 thumperCallingCapabilitiesState];

  if (!v13)
  {
    BOOL v17 = sub_100008DCC();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_35;
    }
    *(_DWORD *)long long buf = 138412290;
    *(void *)uint64_t v45 = v9;
    long long v28 = "[WARN] Could not find Thumper capabilities for sender identity UUID %@";
    long long v29 = v17;
    uint32_t v30 = 12;
LABEL_19:
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, v28, buf, v30);
    goto LABEL_35;
  }
  int v14 = [v13 approvedSecondaryDeviceIDs];
  unsigned int v15 = [v14 containsObject:v8];

  if (v15 == v6)
  {
    BOOL v17 = sub_100008DCC();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_35;
    }
    *(_DWORD *)long long buf = 67109634;
    *(_DWORD *)uint64_t v45 = v15;
    *(_WORD *)&v45[4] = 1024;
    *(_DWORD *)&v45[6] = v6;
    LOWORD(v46[0]) = 2112;
    *(void *)((char *)v46 + 2) = v8;
    long long v28 = "_setThumperCallingAllowed: not updating value. Is currently %d and asked to set to %d on secondary device ID %@";
    long long v29 = v17;
    uint32_t v30 = 24;
    goto LABEL_19;
  }
  __int16 v16 = [(CSDCallCapabilities *)self telephonyCallCapabilities];
  BOOL v17 = v16;
  if (v6)
  {
    v39 = [v13 accountID];
    if ([v39 length])
    {
      [v17 localThumperAccounts];
      long long v40 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      unsigned __int8 v18 = (id)objc_claimAutoreleasedReturnValue();
      id v19 = [v18 countByEnumeratingWithState:&v40 objects:v47 count:16];
      if (v19)
      {
        id v20 = v19;
        unsigned int v35 = v15;
        int v36 = v6;
        id v37 = v9;
        id v38 = v8;
        long long v21 = 0;
        uint64_t v22 = *(void *)v41;
LABEL_7:
        long long v23 = v18;
        uint64_t v24 = 0;
        id v25 = v21;
        while (1)
        {
          if (*(void *)v41 != v22) {
            objc_enumerationMutation(v23);
          }
          long long v21 = *(id *)(*((void *)&v40 + 1) + 8 * (void)v24);

          uint64_t v26 = [v21 accountID];
          char v27 = TUStringsAreCaseInsensitiveEqual();

          if (v27) {
            break;
          }
          uint64_t v24 = (char *)v24 + 1;
          id v25 = v21;
          if (v20 == v24)
          {
            unsigned __int8 v18 = v23;
            id v20 = [v23 countByEnumeratingWithState:&v40 objects:v47 count:16];
            if (v20) {
              goto LABEL_7;
            }

            id v9 = v37;
            id v8 = v38;
            goto LABEL_14;
          }
        }
        unsigned __int8 v18 = v23;

        id v9 = v37;
        id v8 = v38;
        if (!v21) {
          goto LABEL_26;
        }
        uint64_t v31 = (uint64_t)[v21 availableDeviceSlots];
        unsigned __int8 v32 = sub_100008DCC();
        BOOL v33 = os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT);
        if (v31 < 1)
        {
          if (v33)
          {
            *(_WORD *)long long buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "[WARN] Not changing Thumper calling allowed value. No device slots remain for this device. Displaying notification to the user", buf, 2u);
          }

          v34 = [(CSDCallCapabilities *)self thumperPinExchangeController];
          [v34 displaySlotsFullNotification];
        }
        else
        {
          if (v33)
          {
            *(_DWORD *)long long buf = 67109634;
            *(_DWORD *)uint64_t v45 = v35;
            *(_WORD *)&v45[4] = 1024;
            *(_DWORD *)&v45[6] = v36;
            LOWORD(v46[0]) = 2112;
            *(void *)((char *)v46 + 2) = v38;
            _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Changing Thumper calling allowed value from %d to %d on secondary device ID %@", buf, 0x18u);
          }

          [v17 setThumperCallingAllowed:1 onSecondaryDeviceWithID:v38 forSenderIdentityWithUUID:v37];
        }
      }
      else
      {
LABEL_14:

LABEL_26:
        long long v21 = sub_100008DCC();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 138412546;
          *(void *)uint64_t v45 = v8;
          *(_WORD *)&v45[8] = 2112;
          v46[0] = v17;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "[WARN] Could not set Thumper calling allowed for secondary device with identifier %@; unable to retrieve loc"
            "al Thumper account from call capabilities %@",
            buf,
            0x16u);
        }
      }
    }
    else
    {
      unsigned __int8 v18 = sub_100008DCC();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        *(void *)uint64_t v45 = v13;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "[WARN] Could not retrieve account ID from Thumper capabilities %@", buf, 0xCu);
      }
    }
  }
  else
  {
    [v16 setThumperCallingAllowed:0 onSecondaryDeviceWithID:v8 forSenderIdentityWithUUID:v9];
  }
LABEL_35:
}

- (void)_setThumperCallingAllowedOnDefaultPairedDevice:(BOOL)a3 forSenderIdentityWithUUID:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  CFStringRef v7 = [(CSDCallCapabilities *)self state];
  id v8 = [v7 defaultPairedDevice];

  if (v8)
  {
    id v9 = [(CSDCallCapabilities *)self state];
    uint64_t v10 = [v9 defaultPairedDevice];
    unsigned int v11 = [v10 uniqueID];
    [(CSDCallCapabilities *)self _setThumperCallingAllowed:v4 onSecondaryDeviceWithID:v11 forSenderIdentityWithUUID:v6];
  }
  else
  {
    uint64_t v12 = sub_100008DCC();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v13 = [(CSDCallCapabilities *)self state];
      int v14 = [v13 cloudCallingDevices];
      int v15 = 138412290;
      __int16 v16 = v14;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "[WARN] No cloud calling device appears to be a default paired device: %@. Ignoring setThumperCallingAllowedOnDefaultPairedDevice request", (uint8_t *)&v15, 0xCu);
    }
  }
}

- (BOOL)_supportsThumperCallingUsingSenderIdentityCapabilitiesState:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CSDCallCapabilities *)self state];
  unsigned int v6 = [v5 supportsPrimaryCalling];

  if (v6)
  {
    CFStringRef v7 = [v4 senderIdentityUUID];
    if (v7)
    {
      id v8 = [(CSDCallCapabilities *)self telephonyCallCapabilities];
      id v9 = [v8 telephonySubscriptionLabelIdentifierForSenderIdentityUUID:v7];

      if ([v9 length])
      {
        uint64_t v10 = [v4 thumperCallingCapabilitiesState];
        if ([v10 isSupported])
        {
          unsigned int v11 = [(CSDCallCapabilities *)self thumperService];
          LOBYTE(v12) = [v11 isServiceEnabledForTelephonySubscriptionLabelIdentifier:v9];
        }
        else
        {
          LOBYTE(v12) = 0;
        }
      }
      else
      {
        LOBYTE(v12) = 0;
      }
    }
    else
    {
      uint64_t v12 = sub_100008DCC();
      if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_DEFAULT))
      {
        int v17 = 138412290;
        id v18 = v4;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)v12, OS_LOG_TYPE_DEFAULT, "[WARN] Could not obtain UUID from sender identity capabilities state %@", (uint8_t *)&v17, 0xCu);
      }

      LOBYTE(v12) = 0;
    }
  }
  else
  {
    BOOL v13 = [(CSDCallCapabilities *)self _primaryThumperAccountRequiringMatchingCallerID];
    LODWORD(v12) = v13 != 0;
  }
  int v14 = [(CSDCallCapabilities *)self state];
  unsigned __int8 v15 = [v14 supportsRelayCalling];

  return v15 & v12;
}

- (BOOL)_isThumperCallingAllowedForCurrentDeviceUsingSenderIdentityCapabilitiesState:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 thumperCallingCapabilitiesState];
  unsigned __int8 v6 = [v5 isSupported];

  CFStringRef v7 = [(CSDCallCapabilities *)self state];
  unsigned __int8 v8 = [v7 supportsPrimaryCalling];

  if ((v8 & 1) == 0)
  {
    id v9 = [(CSDCallCapabilities *)self _primaryThumperAccountRequiringMatchingCallerID];
    uint64_t v10 = [v9 allowedSecondaryDeviceIDs];
    unsigned int v11 = [v4 thumperCallingCapabilitiesState];
    uint64_t v12 = [v11 localDeviceID];
    unsigned __int8 v6 = [v10 containsObject:v12];
  }
  return v6;
}

- (id)_primaryThumperAccountRequiringMatchingCallerID
{
  return [(CSDCallCapabilities *)self _primaryThumperAccountRequiringMatchingCallerID:1 requiringAvailableDeviceSlots:0];
}

- (id)_primaryThumperAccountRequiringAvailableDeviceSlots
{
  return [(CSDCallCapabilities *)self _primaryThumperAccountRequiringMatchingCallerID:0 requiringAvailableDeviceSlots:1];
}

- (id)_primaryThumperAccountRequiringMatchingCallerID:(BOOL)a3 requiringAvailableDeviceSlots:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  CFStringRef v7 = [(CSDCallCapabilities *)self telephonyCallCapabilities];
  unsigned __int8 v8 = [(CSDCallCapabilities *)self thumperService];
  id v9 = [v8 devices];
  uint64_t v10 = [(CSDCallCapabilities *)self state];
  unsigned int v11 = [v10 outgoingRelayCallerID];
  uint64_t v12 = TUCopyIDSCanonicalAddressForDestinationID();
  BOOL v13 = [v7 primaryThumperAccountUsingDevices:v9 outgoingCallerIDURI:v12 requireMatchingCallerIDURI:v5 requireAvailableDeviceSlots:v4];

  return v13;
}

- (void)_updateRelayCapabilities
{
  BOOL v4 = [(CSDCallCapabilities *)self _supportsRelayCalling];
  BOOL v5 = [(CSDCallCapabilities *)self state];
  [v5 setSupportsRelayCalling:v4];

  BOOL v6 = [(CSDCallCapabilities *)self _accountsMatchForSecondaryCalling];
  CFStringRef v7 = [(CSDCallCapabilities *)self state];
  [v7 setAccountsMatchForSecondaryCalling:v6];

  if ([(CSDCallCapabilities *)self _isWatchDevice])
  {
    unsigned __int8 v8 = [(CSDCallCapabilities *)self relayService];
    id v9 = [v8 defaultPairedDevice];

    unsigned int v10 = [v9 isConnected];
    unsigned int v11 = [(CSDCallCapabilities *)self state];
    uint64_t v12 = v11;
    if (v10)
    {
      [v11 setRelayCallingEnabled:1];

      BOOL v13 = [(CSDCallCapabilities *)self state];
      [v13 setRelayCallingFeaturesEnabled:1];

      unsigned int v14 = [v9 isNearby];
      unsigned __int8 v15 = [(CSDCallCapabilities *)self state];
      __int16 v16 = v15;
      if (v14) {
        uint64_t v17 = 2;
      }
      else {
        uint64_t v17 = 1;
      }
    }
    else
    {
      [v11 setRelayCallingEnabled:0];

      uint64_t v24 = [(CSDCallCapabilities *)self state];
      [v24 setRelayCallingFeaturesEnabled:0];

      unsigned __int8 v15 = [(CSDCallCapabilities *)self state];
      __int16 v16 = v15;
      uint64_t v17 = 0;
    }
    [v15 setRelayCallingAvailability:v17];

    v34 = [(CSDCallCapabilities *)self pairedHostDeviceState];
    id v35 = [v34 isFaceTimeAudioAvailable];
    int v36 = [(CSDCallCapabilities *)self state];
    [v36 setSupportsFaceTimeAudioRelayCalling:v35];

    id v37 = [(CSDCallCapabilities *)self pairedHostDeviceState];
    id v38 = [v37 isFaceTimeVideoAvailable];
    v39 = [(CSDCallCapabilities *)self state];
    [v39 setSupportsFaceTimeVideoRelayCalling:v38];

    long long v40 = [(CSDCallCapabilities *)self state];
    [v40 setAccountsSupportSecondaryCalling:1];

    goto LABEL_22;
  }
  if (![(CSDCallCapabilities *)self _isAudioAccessoryDevice])
  {
    BOOL v25 = [(CSDCallCapabilities *)self _relayCallingEnabledDefault];
    uint64_t v26 = [(CSDCallCapabilities *)self state];
    [v26 setRelayCallingEnabled:v25];

    char v27 = [(CSDCallCapabilities *)self state];
    [v27 setSupportsFaceTimeAudioRelayCalling:0];

    long long v28 = [(CSDCallCapabilities *)self state];
    id v29 = [v28 accountsMatchForSecondaryCalling];
    uint32_t v30 = [(CSDCallCapabilities *)self state];
    [v30 setAccountsSupportSecondaryCalling:v29];

    long long v23 = [(CSDCallCapabilities *)self state];
    unsigned int v31 = [v23 supportsRelayCalling];
    if (v31)
    {
      uint32_t v30 = [(CSDCallCapabilities *)self state];
      if ([v30 accountsSupportSecondaryCalling])
      {
        v2 = [(CSDCallCapabilities *)self state];
        int v32 = 1;
        BOOL v33 = 1;
        if ([v2 isRelayCallingEnabled]) {
          goto LABEL_17;
        }
      }
      else
      {
        int v32 = 0;
      }
    }
    else
    {
      int v32 = 0;
    }
    BOOL v33 = [(CSDCallCapabilities *)self _deviceExistsThatSupportsRelayCallingWithoutLocalRelayCallingEnabled];
LABEL_17:
    long long v41 = [(CSDCallCapabilities *)self state];
    [v41 setRelayCallingFeaturesEnabled:v33];

    if (v32) {
    if (v31)
    }

    goto LABEL_21;
  }
  id v18 = [(CSDCallCapabilities *)self state];
  id v19 = [v18 supportsRelayCalling];
  id v20 = [(CSDCallCapabilities *)self state];
  [v20 setRelayCallingEnabled:v19];

  long long v21 = [(CSDCallCapabilities *)self state];
  [v21 setSupportsFaceTimeAudioRelayCalling:1];

  uint64_t v22 = [(CSDCallCapabilities *)self state];
  [v22 setAccountsSupportSecondaryCalling:1];

  long long v23 = [(CSDCallCapabilities *)self state];
  [v23 setRelayCallingFeaturesEnabled:1];
LABEL_21:

  long long v42 = [(CSDCallCapabilities *)self state];
  id v43 = [v42 isRelayCallingEnabled];
  objc_super v44 = [(CSDCallCapabilities *)self state];
  [v44 setRelayCallingAvailability:v43];

  id v9 = [(CSDCallCapabilities *)self state];
  [v9 setSupportsFaceTimeVideoRelayCalling:0];
LABEL_22:

  uint64_t v45 = [(CSDCallCapabilities *)self state];
  [v45 setSupportsTelephonyRelayCalling:1];

  v46 = [(CSDCallCapabilities *)self _relayCallingDisabledForDeviceIDDefault];
  uint64_t v47 = [(CSDCallCapabilities *)self state];
  [v47 setRelayCallingDisabledForDeviceID:v46];

  v48 = [(CSDCallCapabilities *)self _outgoingCallerID];
  v49 = [(CSDCallCapabilities *)self state];
  [v49 setOutgoingRelayCallerID:v48];

  id v51 = [(CSDCallCapabilities *)self _cloudCallingDevices];
  long long v50 = [(CSDCallCapabilities *)self state];
  [v50 setCloudCallingDevices:v51];
}

- (BOOL)_supportsRelayCalling
{
  char v3 = [(CSDCallCapabilities *)self relayService];
  unsigned int v4 = [v3 defaultPairedDeviceExists];

  if ([(CSDCallCapabilities *)self _isWatchDevice])
  {
    BOOL v5 = sub_100008DCC();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 67109120;
      unsigned int v14 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "defaultPairedDeviceExists: %d", (uint8_t *)&v13, 8u);
    }
  }
  else
  {
    BOOL v6 = [(CSDCallCapabilities *)self state];
    if ([v6 supportsPrimaryCalling])
    {
      unsigned int v7 = 1;
    }
    else
    {
      unsigned __int8 v8 = [(CSDCallCapabilities *)self relayService];
      unsigned int v7 = [v8 telephonyCapableDeviceExists];
    }
    id v9 = [(CSDCallCapabilities *)self relayService];
    unsigned int v10 = [v9 relayCapableDeviceExists];

    unsigned int v11 = sub_100008DCC();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 67109632;
      unsigned int v14 = v7;
      __int16 v15 = 1024;
      unsigned int v16 = v10;
      __int16 v17 = 1024;
      unsigned int v18 = v4;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "telephonyDeviceExists: %d, relayCapableDeviceExists: %d, defaultPairedDeviceExists: %d", (uint8_t *)&v13, 0x14u);
    }

    LOBYTE(v4) = v7 & v10 | v4;
  }
  return v4;
}

- (BOOL)_accountsMatchForSecondaryCalling
{
  v2 = [(CSDCallCapabilities *)self accountsController];
  unsigned __int8 v3 = [v2 faceTimeIDMatchesAppleID];

  return v3;
}

- (id)_outgoingCallerID
{
  v2 = [(CSDCallCapabilities *)self accountsController];
  unsigned __int8 v3 = [v2 outgoingCallerID];

  return v3;
}

- (id)_cloudCallingDevices
{
  v2 = [(CSDCallCapabilities *)self relayService];
  unsigned __int8 v3 = [v2 devices];

  unsigned int v4 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v3 count]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        id v11 = objc_alloc((Class)TUCloudCallingDevice);
        id v12 = objc_msgSend(v11, "initWithIDSDevice:", v10, (void)v15);
        [v4 addObject:v12];
      }
      id v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  int v13 = [v4 sortedArrayUsingComparator:&stru_1005073A8];

  return v13;
}

- (BOOL)_deviceExistsThatSupportsRelayCallingWithoutLocalRelayCallingEnabled
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = [(CSDCallCapabilities *)self relayService];
  unsigned __int8 v3 = [v2 devices];

  id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v3);
        }
        if ([*(id *)(*((void *)&v8 + 1) + 8 * i) supportsRelayCallingWithoutLocalRelayCallingEnabled])
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (char)v4;
}

- (BOOL)_relayCallingEnabledDefault
{
  Boolean keyExistsAndHasValidFormat = 0;
  return !CFPreferencesGetAppBooleanValue(@"relayCallingDisabled", TUBundleIdentifierTelephonyUtilitiesFramework, &keyExistsAndHasValidFormat)|| keyExistsAndHasValidFormat == 0;
}

- (void)_setRelayCallingEnabledDefault:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = sub_100008DCC();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "_setRelayCallingEnabledDefault: changing value to %d", (uint8_t *)v7, 8u);
  }

  uint64_t v5 = (CFPropertyListRef *)&kCFBooleanFalse;
  if (!v3) {
    uint64_t v5 = (CFPropertyListRef *)&kCFBooleanTrue;
  }
  CFStringRef v6 = (const __CFString *)TUBundleIdentifierTelephonyUtilitiesFramework;
  CFPreferencesSetAppValue(@"relayCallingDisabled", *v5, TUBundleIdentifierTelephonyUtilitiesFramework);
  CFPreferencesAppSynchronize(v6);
}

- (void)_setRelayCallingEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(CSDCallCapabilities *)self state];
  unsigned int v6 = [v5 isRelayCallingEnabled];

  id v7 = sub_100008DCC();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6 == v3)
  {
    if (v8)
    {
      *(_DWORD *)long long buf = 67109376;
      unsigned int v23 = v6;
      __int16 v24 = 1024;
      BOOL v25 = v3;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "_setRelayCallingEnabled: Not updating value. Is currently %d and asked to set to %d", buf, 0xEu);
    }
  }
  else
  {
    if (v8)
    {
      *(_DWORD *)long long buf = 67109376;
      unsigned int v23 = v6;
      __int16 v24 = 1024;
      BOOL v25 = v3;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "_setRelayCallingEnabled: Changing value from %d to %d", buf, 0xEu);
    }

    [(CSDCallCapabilities *)self _setRelayCallingEnabledDefault:v3];
    if (!v3)
    {
      long long v9 = [(CSDCallCapabilities *)self state];
      long long v10 = [v9 senderIdentityCapabilitiesStateByUUID];
      long long v11 = [v10 allKeys];

      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      id v12 = v11;
      id v13 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v13)
      {
        id v14 = v13;
        uint64_t v15 = *(void *)v18;
        do
        {
          long long v16 = 0;
          do
          {
            if (*(void *)v18 != v15) {
              objc_enumerationMutation(v12);
            }
            -[CSDCallCapabilities _setThumperCallingEnabled:forSenderIdentityWithUUID:](self, "_setThumperCallingEnabled:forSenderIdentityWithUUID:", 0, *(void *)(*((void *)&v17 + 1) + 8 * (void)v16), (void)v17);
            long long v16 = (char *)v16 + 1;
          }
          while (v14 != v16);
          id v14 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
        }
        while (v14);
      }
    }
    [(CSDCallCapabilities *)self _updateDynamicCapabilitiesAndUpdateClients];
  }
}

- (id)_relayCallingDisabledForDeviceIDDefault
{
  v2 = (void *)CFPreferencesCopyAppValue(@"relayCallingDisabledForDeviceID", TUBundleIdentifierTelephonyUtilitiesFramework);

  return v2;
}

- (void)_setRelayCallingEnabledDefault:(BOOL)a3 forDeviceWithID:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = sub_100008DCC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v15[0] = 67109378;
    v15[1] = v4;
    __int16 v16 = 2112;
    id v17 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "setRelayCallingEnabledDefault:forDeviceWithID: changing value to %d for %@", (uint8_t *)v15, 0x12u);
  }

  BOOL v8 = [(CSDCallCapabilities *)self _relayCallingDisabledForDeviceIDDefault];
  id v9 = [v8 mutableCopy];
  long long v10 = v9;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    id v11 = +[NSMutableDictionary dictionary];
  }
  id v12 = v11;

  id v13 = +[NSNumber numberWithInt:!v4];
  [v12 setObject:v13 forKeyedSubscript:v6];

  CFStringRef v14 = (const __CFString *)TUBundleIdentifierTelephonyUtilitiesFramework;
  CFPreferencesSetAppValue(@"relayCallingDisabledForDeviceID", v12, TUBundleIdentifierTelephonyUtilitiesFramework);
  CFPreferencesAppSynchronize(v14);
}

- (void)_setRelayCallingEnabled:(BOOL)a3 forDeviceWithID:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [(CSDCallCapabilities *)self state];
  BOOL v8 = [v7 relayCallingDisabledForDeviceID];
  id v9 = [v8 objectForKeyedSubscript:v6];
  unsigned int v10 = [v9 BOOLValue];

  id v11 = sub_100008DCC();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v10 == v4)
  {
    if (v12)
    {
      *(_DWORD *)long long buf = 67109634;
      int v27 = v10 ^ 1;
      __int16 v28 = 1024;
      BOOL v29 = v4;
      __int16 v30 = 2112;
      id v31 = v6;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "_setRelayCallingEnabled:forDeviceWithID: Changing value from %d to %d for %@", buf, 0x18u);
    }

    [(CSDCallCapabilities *)self _setRelayCallingEnabledDefault:v4 forDeviceWithID:v6];
    if (!v4)
    {
      id v13 = [(CSDCallCapabilities *)self state];
      CFStringRef v14 = [v13 senderIdentityCapabilitiesStateByUUID];
      uint64_t v15 = [v14 allKeys];

      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      id v16 = v15;
      id v17 = [v16 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v17)
      {
        id v18 = v17;
        uint64_t v19 = *(void *)v22;
        do
        {
          for (i = 0; i != v18; i = (char *)i + 1)
          {
            if (*(void *)v22 != v19) {
              objc_enumerationMutation(v16);
            }
            -[CSDCallCapabilities _setThumperCallingAllowed:onSecondaryDeviceWithID:forSenderIdentityWithUUID:](self, "_setThumperCallingAllowed:onSecondaryDeviceWithID:forSenderIdentityWithUUID:", 0, v6, *(void *)(*((void *)&v21 + 1) + 8 * i), (void)v21);
          }
          id v18 = [v16 countByEnumeratingWithState:&v21 objects:v25 count:16];
        }
        while (v18);
      }
    }
    [(CSDCallCapabilities *)self _updateDynamicCapabilitiesAndUpdateClients];
  }
  else
  {
    if (v12)
    {
      *(_DWORD *)long long buf = 67109634;
      int v27 = v10 ^ 1;
      __int16 v28 = 1024;
      BOOL v29 = v4;
      __int16 v30 = 2112;
      id v31 = v6;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "_setRelayCallingEnabled:forDeviceWithID: Not updating value. Is currently %d and asked to set to %d for %@", buf, 0x18u);
    }
  }
}

- (BOOL)_isWatchDevice
{
  v2 = +[FTDeviceSupport sharedInstance];
  BOOL v3 = [v2 deviceType] == (id)6;

  return v3;
}

- (BOOL)_isAudioAccessoryDevice
{
  v2 = +[FTDeviceSupport sharedInstance];
  BOOL v3 = [v2 deviceType] == (id)7;

  return v3;
}

- (void)_updateDefaultAppIfNecessary
{
  if (supportsDefaultAppRelayTelephonySetting())
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    BOOL v3 = [(CSDCallCapabilities *)self state];
    BOOL v4 = [v3 senderIdentityCapabilitiesStateByUUID];
    uint64_t v5 = [v4 allKeys];

    id v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v19;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v19 != v7) {
            objc_enumerationMutation(v5);
          }
          uint64_t v9 = *(void *)(*((void *)&v18 + 1) + 8 * i);
          unsigned int v10 = [(CSDCallCapabilities *)self state];
          id v11 = [v10 senderIdentityCapabilitiesStateByUUID];
          BOOL v12 = [v11 objectForKeyedSubscript:v9];
          id v13 = [v12 thumperCallingCapabilitiesState];
          unsigned __int8 v14 = [v13 isEnabled];

          if (v14)
          {
            LOBYTE(v6) = 1;
            goto LABEL_12;
          }
        }
        id v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_12:

    uint64_t v15 = [(CSDCallCapabilities *)self state];
    unsigned __int8 v16 = [v15 isRelayCallingEnabled];
    if (v6 & 1) != 0 || (v16)
    {
    }
    else
    {
      uint64_t v17 = defaultAppRelayTelephonySettingUserDefault();

      if (v17 == 2) {
        removeDefaultAppRelayTelephonySetting();
      }
    }
  }
}

- (void)_initializePairedHostDeviceState
{
  if (![(CSDCallCapabilities *)self _isWatchDevice]) {
    return;
  }
  BOOL v3 = (void *)CFPreferencesCopyAppValue(@"pairedHostDeviceState", TUBundleIdentifierTelephonyUtilitiesFramework);
  if (!v3)
  {
    BOOL v4 = sub_100008DCC();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16) = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "No saved paired host device state found", (uint8_t *)&v16, 2u);
    }
    goto LABEL_15;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v4 = [[CSDMessagingCallCapabilitiesState alloc] initWithData:v3];
    uint64_t v5 = [v4 state];
    [(CSDCallCapabilities *)self setPairedHostDeviceState:v5];

    id v6 = [(CSDCallCapabilities *)self pairedHostDeviceState];

    uint64_t v7 = sub_100008DCC();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (v6)
    {
      if (v8)
      {
        uint64_t v9 = [(CSDCallCapabilities *)self pairedHostDeviceState];
        int v16 = 138412290;
        id v17 = v9;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Initialized pairedHostDeviceState: %@", (uint8_t *)&v16, 0xCu);
      }
      goto LABEL_14;
    }
    if (!v8)
    {
LABEL_14:

      goto LABEL_15;
    }
    int v16 = 138412290;
    id v17 = v3;
    unsigned int v10 = "[WARN] Could not de-serialize pairedHostDeviceStateData %@";
    id v11 = v7;
    uint32_t v12 = 12;
LABEL_13:
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v16, v12);
    goto LABEL_14;
  }
  BOOL v4 = sub_100008DCC();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138412546;
    id v17 = (id)objc_opt_class();
    __int16 v18 = 2112;
    long long v19 = v3;
    uint64_t v7 = v17;
    unsigned int v10 = "[WARN] Saved pairedHostDeviceStateData was not an NSData type (class=%@): %@";
    id v11 = v4;
    uint32_t v12 = 22;
    goto LABEL_13;
  }
LABEL_15:

  id v13 = [(CSDCallCapabilities *)self pairedHostDeviceState];

  if (!v13)
  {
    unsigned __int8 v14 = sub_100008DCC();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16) = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Initializing new paired host device state with all values set to NO", (uint8_t *)&v16, 2u);
    }

    id v15 = objc_alloc_init((Class)TUCallCapabilitiesState);
    [(CSDCallCapabilities *)self setPairedHostDeviceState:v15];

    [(CSDCallCapabilities *)self _savePairedHostDeviceState];
  }
}

- (void)_savePairedHostDeviceState
{
  if ([(CSDCallCapabilities *)self _isWatchDevice])
  {
    BOOL v3 = [CSDMessagingCallCapabilitiesState alloc];
    BOOL v4 = [(CSDCallCapabilities *)self pairedHostDeviceState];
    uint64_t v7 = [(CSDMessagingCallCapabilitiesState *)v3 initWithCallCapabilitiesState:v4];

    uint64_t v5 = [(CSDMessagingCallCapabilitiesState *)v7 data];
    CFStringRef v6 = (const __CFString *)TUBundleIdentifierTelephonyUtilitiesFramework;
    CFPreferencesSetAppValue(@"pairedHostDeviceState", v5, TUBundleIdentifierTelephonyUtilitiesFramework);
    CFPreferencesAppSynchronize(v6);
  }
}

- (BOOL)_supportslaunchingInCallApplicationForIncomingCall
{
  BOOL v3 = ![(CSDCallCapabilities *)self _isAudioAccessoryDevice]
    && ![(CSDCallCapabilities *)self _isWatchDevice];
  BOOL v4 = sub_100008DCC();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "_supportslaunchingInCallApplicationForIncomingCall: %d", (uint8_t *)v6, 8u);
  }

  return v3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSXPCListener)xpcListener
{
  return self->_xpcListener;
}

- (CSDProcessObserverProtocol)processObserver
{
  return self->_processObserver;
}

- (CSDAccountsController)accountsController
{
  return self->_accountsController;
}

- (CSDTelephonyCallCapabilities)telephonyCallCapabilities
{
  return self->_telephonyCallCapabilities;
}

- (CSDThumperPushHandler)thumperPushHandler
{
  return self->_thumperPushHandler;
}

- (CSDPinExchangeController)thumperPinExchangeController
{
  return self->_thumperPinExchangeController;
}

- (CSDThumperCapabilitiesMonitor)thumperCapabilitiesMonitor
{
  return self->_thumperCapabilitiesMonitor;
}

- (CSDIDSService)relayService
{
  return self->_relayService;
}

- (CSDIDSService)thumperService
{
  return self->_thumperService;
}

- (void)setState:(id)a3
{
}

- (TUCallCapabilitiesState)pairedHostDeviceState
{
  return self->_pairedHostDeviceState;
}

- (void)setPairedHostDeviceState:(id)a3
{
}

- (TUFeatureFlags)featureFlags
{
  return self->_featureFlags;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureFlags, 0);
  objc_storeStrong((id *)&self->_pairedHostDeviceState, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_thumperService, 0);
  objc_storeStrong((id *)&self->_relayService, 0);
  objc_storeStrong((id *)&self->_thumperCapabilitiesMonitor, 0);
  objc_storeStrong((id *)&self->_thumperPinExchangeController, 0);
  objc_storeStrong((id *)&self->_thumperPushHandler, 0);
  objc_storeStrong((id *)&self->_telephonyCallCapabilities, 0);
  objc_storeStrong((id *)&self->_accountsController, 0);
  objc_storeStrong((id *)&self->_processObserver, 0);
  objc_storeStrong((id *)&self->_clientManager, 0);
  objc_storeStrong((id *)&self->_xpcListener, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end