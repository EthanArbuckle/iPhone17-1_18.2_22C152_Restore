@interface NSPServer
- (BOOL)canIgnoreInvalidCertsOnInternalBuild;
- (BOOL)configurationFetchDateIsWithinStart:(id)a3 end:(id)a4;
- (BOOL)isSubscriberUnlimited;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)networkDiscoveredProxyInTrustedProxyList:(id)a3;
- (BOOL)subscriberTierIsProhibited:(id)a3;
- (BOOL)usesDefaultConfigurationServer;
- (NSPServer)init;
- (id)getSavedPrivateCloudComputeEnvironment;
- (void)authInfoChanged:(id)a3;
- (void)badTokenInfoForProxy:(id)a3;
- (void)checkPrivacyProxyConnectivityOnInterface:(id)a3 proxyConnectivityCheckType:(unint64_t)a4 completionHandler:(id)a5;
- (void)cloudSubscriptionChanged:(BOOL)a3 configManager:(id)a4;
- (void)configDisabled:(id)a3;
- (void)configEnabled:(id)a3;
- (void)configEpochChanged:(id)a3;
- (void)configFetched:(id)a3;
- (void)configUpdated:(id)a3;
- (void)configurationRestart:(id)a3;
- (void)didUpdateCountryPlusTimezone:(id)a3;
- (void)didUpdateGeohash:(id)a3;
- (void)didUpdateSignificantLocation;
- (void)disableCellularNetwork:(id)a3;
- (void)disableInterface:(id)a3 displayName:(id)a4 type:(int)a5;
- (void)disableWiFiNetwork:(id)a3;
- (void)effectiveUserTierChanged:(id)a3;
- (void)geohashSettingsChanged:(id)a3;
- (void)handleDNSAgentErrorReport:(id)a3 error:(int)a4;
- (void)multiHopProxyAgentRegistered:(BOOL)a3;
- (void)networkDiscoveredProxyPaths:(id)a3 registeredForAgentUUID:(id)a4;
- (void)networkSignatureChanged;
- (void)obliviousHopAgentRegisteredForHostname:(id)a3 processes:(id)a4 agentUUID:(id)a5;
- (void)obliviousHopAgentUnregisteredForHostname:(id)a3 agentUUID:(id)a4;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)policiesUpdated:(id)a3 policy:(id)a4 resolverInfoChanged:(BOOL)a5;
- (void)preferredProxyAgentRegistered:(id)a3 agentUUID:(id)a4 domainFilter:(id)a5;
- (void)preferredProxyAgentUnregistered:(id)a3;
- (void)privateAccessTokensEnabledChanged:(id)a3;
- (void)proxiedContentMaps:(id)a3 registeredForAgentUUID:(id)a4;
- (void)proxiedContentMapsUnregisteredForAgentUUID:(id)a3;
- (void)proxyConnectivityActive;
- (void)proxyConnectivityNetworkOutage;
- (void)proxyConnectivityOutage;
- (void)proxyInfoChanged:(id)a3;
- (void)proxyTokenFetchDisabled:(id)a3;
- (void)proxyTokenFetchEnabled:(id)a3;
- (void)refreshProxyInfo:(unint64_t)a3;
- (void)reportActivityForApp:(id)a3 path:(id)a4;
- (void)reportPrivacyProxySuccessOnInterface:(id)a3;
- (void)requestAccessTokenWithCompletionHandler:(id)a3;
- (void)resumePrivacyProxy:(id)a3;
- (void)singleHopProxyAgentRegistered:(BOOL)a3;
- (void)suspendPrivacyProxyTemporarily:(id)a3;
- (void)tokenFetchActive;
- (void)tokenFetchOutage;
- (void)tokenIssuanceAllowed;
- (void)tokenIssuanceLimitReached;
- (void)updateSavedPrivateCloudComputeEnvironment:(id)a3;
- (void)userPreferredTierChanged:(id)a3;
- (void)userTierChanged:(id)a3;
@end

@implementation NSPServer

- (NSPServer)init
{
  v46.receiver = self;
  v46.super_class = (Class)NSPServer;
  id v2 = [(NSPServer *)&v46 init];
  if (!v2)
  {
LABEL_21:
    v19 = (NSPServer *)v2;
    goto LABEL_22;
  }
  v3 = objc_alloc_init(NSPServerFlowDivert);
  v4 = (void *)*((void *)v2 + 34);
  *((void *)v2 + 34) = v3;

  if (!*((void *)v2 + 34))
  {
    v36 = nplog_obj();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_FAULT))
    {
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = "-[NSPServer init]";
      _os_log_fault_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_FAULT, "%s called with null _serverFlowDivert", (uint8_t *)&buf, 0xCu);
    }
    goto LABEL_31;
  }
  v5 = objc_alloc_init(NSPDNSProxy);
  v6 = (void *)*((void *)v2 + 47);
  *((void *)v2 + 47) = v5;

  if (!*((void *)v2 + 47))
  {
    v36 = nplog_obj();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_FAULT))
    {
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = "-[NSPServer init]";
      _os_log_fault_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_FAULT, "%s called with null _dnsProxy", (uint8_t *)&buf, 0xCu);
    }
    goto LABEL_31;
  }
  v7 = NPGetInternalQueue();
  dispatch_source_t v8 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0, v7);
  v9 = (void *)*((void *)v2 + 31);
  *((void *)v2 + 31) = v8;

  if (!*((void *)v2 + 31))
  {
    v36 = nplog_obj();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_FAULT))
    {
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = "-[NSPServer init]";
      _os_log_fault_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_FAULT, "%s called with null _termSource", (uint8_t *)&buf, 0xCu);
    }
LABEL_31:

    goto LABEL_8;
  }
  id v10 = objc_alloc_init((Class)NSMutableSet);
  v11 = (void *)*((void *)v2 + 10);
  *((void *)v2 + 10) = v10;

  *((_DWORD *)v2 + 7) = 0;
  v12 = *((void *)v2 + 31);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100067A1C;
  handler[3] = &unk_100105488;
  v13 = v2;
  id v45 = v13;
  dispatch_source_set_event_handler(v12, handler);
  dispatch_resume(*((dispatch_object_t *)v2 + 31));
  xpc_connection_t mach_service = xpc_connection_create_mach_service((const char *)[@"com.apple.networkserviceproxy" UTF8String], 0, 1uLL);
  v15 = (void *)v13[32];
  v13[32] = mach_service;

  xpc_connection_t v16 = xpc_connection_create_mach_service("com.apple.networkserviceproxy.fetch-token", 0, 1uLL);
  v17 = (void *)v13[33];
  v13[33] = v16;

  v18 = (void *)v13[32];
  if (v18)
  {
    if (xpc_get_type(v18) == (xpc_type_t)&_xpc_type_connection)
    {
      v20 = (void *)v13[33];
      if (v20)
      {
        if (xpc_get_type(v20) == (xpc_type_t)&_xpc_type_connection)
        {
          v21 = (_xpc_connection_s *)v13[32];
          v22 = NPGetInternalQueue();
          xpc_connection_set_target_queue(v21, v22);

          v23 = (_xpc_connection_s *)v13[32];
          v42[0] = _NSConcreteStackBlock;
          v42[1] = 3221225472;
          v42[2] = sub_100005394;
          v42[3] = &unk_100106018;
          v24 = v13;
          id v43 = v24;
          xpc_connection_set_event_handler(v23, v42);
          v25 = (_xpc_connection_s *)v13[33];
          v26 = NPGetInternalQueue();
          xpc_connection_set_target_queue(v25, v26);

          v27 = (_xpc_connection_s *)v13[33];
          v37 = _NSConcreteStackBlock;
          uint64_t v38 = 3221225472;
          v39 = sub_100067AB4;
          v40 = &unk_100106018;
          v28 = v24;
          id v41 = v28;
          xpc_connection_set_event_handler(v27, &v37);
          objc_initWeak(&location, v28);
          v29 = NPGetInternalQueue();
          *(void *)&long long buf = _NSConcreteStackBlock;
          *((void *)&buf + 1) = 3221225472;
          v49 = sub_10007ADD0;
          v50 = &unk_100106588;
          objc_copyWeak(&v51, &location);
          os_state_add_handler();

          objc_destroyWeak(&v51);
          objc_destroyWeak(&location);
          self;
          if (os_variant_allows_internal_security_policies())
          {
            v30 = CFPreferencesCopyAppValue(@"NSPOutageIntervalSeconds", kCFPreferencesCurrentApplication);
            if (v30 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            {
              v31 = nplog_obj();
              if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
              {
                LODWORD(buf) = 138543362;
                *(void *)((char *)&buf + 4) = v30;
                _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Detected outage interval in preferences file: %{public}@", (uint8_t *)&buf, 0xCu);
              }

              id v32 = [v30 unsignedIntegerValue:v37, v38, v39, v40];
            }
            else
            {
              id v32 = 0;
            }
          }
          else
          {
            id v32 = 0;
          }
          v28[39] = v32;
          v33 = objc_alloc_init(NSPToggleStats);
          v34 = (void *)v28[42];
          v28[42] = v33;

          goto LABEL_21;
        }
      }
    }
  }

LABEL_8:
  v19 = 0;
LABEL_22:

  return v19;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  v6 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___NSPServerCommands];
  [v5 setExportedInterface:v6];

  [v5 setExportedObject:self];
  [v5 resume];

  return 1;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  v11 = (NWPathEvaluator *)a4;
  id v12 = a5;
  if (self) {
    primaryPhysicalInterfaceEvaluator = self->_primaryPhysicalInterfaceEvaluator;
  }
  else {
    primaryPhysicalInterfaceEvaluator = 0;
  }
  v14 = primaryPhysicalInterfaceEvaluator;
  if (v14 != v11 || ![v10 isEqualToString:@"path"])
  {

    goto LABEL_8;
  }

  if (a6 != self)
  {
LABEL_8:
    v16.receiver = self;
    v16.super_class = (Class)NSPServer;
    [(NSPServer *)&v16 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
    goto LABEL_9;
  }
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3032000000;
  v18[3] = sub_100005D9C;
  v18[4] = sub_10005C1A4;
  id v19 = (id)os_transaction_create();
  v15 = sub_10005C174(self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006B434;
  block[3] = &unk_100105460;
  block[4] = self;
  block[5] = v18;
  dispatch_async(v15, block);

  _Block_object_dispose(v18, 8);
LABEL_9:
}

- (void)configFetched:(id)a3
{
  if (self && self->_configOutage)
  {
    self->_configOutage = 0;
    id v4 = [(NSPConfigurationManager *)self->_configurationManager mergeProxyTrafficStateWithCurrentPolicy];
    [(NSPServer *)self policiesUpdated:self->_configurationManager policy:v4 resolverInfoChanged:1];
    sub_10006C228((uint64_t)self);
  }
}

- (void)configEnabled:(id)a3
{
  id v4 = a3;
  id v5 = nplog_obj();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Privacy proxy configuration enabled", (uint8_t *)&buf, 2u);
  }

  if (self)
  {
    self->_isRunning = 1;
    v6 = [(NSPConfigurationManager *)self->_configurationManager currentConfiguration];
    objc_storeStrong((id *)&self->_configuration, v6);

    id Property = objc_getProperty(self, v7, 272, 1);
  }
  else
  {
    [0 currentConfiguration];

    id Property = 0;
  }
  sub_1000A6720((uint64_t)Property);
  v9 = +[NSPPrivacyProxyPolicyHandler sharedHandler];
  unsigned __int8 v10 = [v9 addPoliciesForProbing];

  if ((v10 & 1) == 0)
  {
    v11 = nplog_obj();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf) = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "failed to add probing policies", (uint8_t *)&buf, 2u);
    }
  }
  id v12 = [NSPServerODoH alloc];
  if (self) {
    primaryPhysicalInterfaceEvaluator = self->_primaryPhysicalInterfaceEvaluator;
  }
  else {
    primaryPhysicalInterfaceEvaluator = 0;
  }
  v14 = primaryPhysicalInterfaceEvaluator;
  v15 = [(NWPathEvaluator *)v14 path];
  if (self) {
    toggleStats = self->_toggleStats;
  }
  else {
    toggleStats = 0;
  }
  v17 = sub_10005224C((id *)&v12->super.isa, self, v15, toggleStats);
  sub_10006D6BC((uint64_t)self, v17);

  v18 = [NSPServiceStatusManager alloc];
  if (self) {
    configuration = self->_configuration;
  }
  else {
    configuration = 0;
  }
  v20 = configuration;
  v21 = [(NSPConfiguration *)v20 userTier];
  uint64_t v22 = [v21 unsignedIntValue];
  if (!self)
  {
    id v82 = -[NSPServiceStatusManager initFromPreferencesWithUserTier:effectiveUserTier:delegate:](v18, "initFromPreferencesWithUserTier:effectiveUserTier:delegate:", v22, [0 effectiveUserTier], 0);
    sub_100027444(0, v82);

    [0 proxyTokenFetchEnabled:v4];
    goto LABEL_51;
  }
  id v23 = [(NSPServiceStatusManager *)v18 initFromPreferencesWithUserTier:v22 effectiveUserTier:[(NSPConfigurationManager *)self->_configurationManager effectiveUserTier] delegate:self];
  sub_100027444((uint64_t)self, v23);

  if (self->_proxyOutage) {
    sub_1000738C0((uint64_t)self, 1);
  }
  if (self->_proxyNetworkOutage) {
    sub_100073978((uint64_t)self, 1);
  }
  if (self->_odohOutageRestoreDate) {
    sub_100072CC0((uint64_t)self, 1);
  }
  if (self->_odohAuthOutageRestoreDate) {
    sub_100072A5C((uint64_t)self, 1);
  }
  if (self->_captiveOutage)
  {
    v24 = self->_primaryInterface;
    if (v24)
    {
      v25 = v24;
      v26 = self->_primaryPhysicalInterfaceEvaluator;
      if (v26)
      {
        v27 = v26;
        int v28 = sub_10006B884((uint64_t)self);

        if (v28)
        {
          v29 = nplog_obj();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            LODWORD(buf) = 138412290;
            *(void *)((char *)&buf + 4) = self;
            _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "%@ Primary interface changed to non Wi-Fi, reporting service active ...", (uint8_t *)&buf, 0xCu);
          }

          sub_10006B930((uint64_t)self, 0);
          goto LABEL_35;
        }
      }
      else
      {
      }
    }
    if (self->_captiveOutage && sub_100078F2C((uint64_t)self))
    {
      sub_100078ED8((uint64_t)self);
      v30 = NPGetInternalQueue();
      *(void *)&long long buf = _NSConcreteStackBlock;
      *((void *)&buf + 1) = 3221225472;
      v96 = sub_10007B578;
      v97 = &unk_100105488;
      v98 = self;
      dispatch_async(v30, &buf);
    }
  }
LABEL_35:
  if (self->_captiveOutageWaitingForUserActivity)
  {
    v31 = self->_primaryInterface;
    if (v31)
    {
      id v32 = v31;
      v33 = self->_primaryPhysicalInterfaceEvaluator;
      if (v33)
      {
        v34 = v33;
        int v35 = sub_10006B884((uint64_t)self);

        if (v35)
        {
          v36 = nplog_obj();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
          {
            LODWORD(handler) = 138412290;
            *(void *)((char *)&handler + 4) = self;
            _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "%@ Primary interface changed to non Wi-Fi, removing the pending outage notification ...", (uint8_t *)&handler, 0xCu);
          }

          self->_captiveOutageWaitingForUserActivity = 0;
          sub_10006C228((uint64_t)self);
          sub_1000783F8((uint64_t)self);
        }
      }
      else
      {
      }
    }
  }
  [(NSPServer *)self proxyTokenFetchEnabled:v4];

  objc_initWeak(&location, self);
  *(void *)&long long buf = _NSConcreteStackBlock;
  *((void *)&buf + 1) = 3221225472;
  v96 = sub_100068838;
  v97 = &unk_1001060D0;
  objc_copyWeak((id *)&v98, &location);
  xpc_activity_register("com.apple.networkserviceproxy.metadata-refresh-12h", XPC_ACTIVITY_CHECK_IN, &buf);
  *(void *)&long long handler = _NSConcreteStackBlock;
  *((void *)&handler + 1) = 3221225472;
  v92 = sub_1000689B4;
  v93 = &unk_1001060D0;
  objc_copyWeak(v94, &location);
  xpc_activity_register("com.apple.networkserviceproxy.metadata-refresh-22h", XPC_ACTIVITY_CHECK_IN, &handler);
  *(void *)v84 = _NSConcreteStackBlock;
  uint64_t v85 = 3221225472;
  v86 = sub_100068B30;
  v87 = &unk_1001060D0;
  objc_copyWeak(v88, &location);
  xpc_activity_register("com.apple.networkserviceproxy.publish-daily-stats", XPC_ACTIVITY_CHECK_IN, v84);
  objc_destroyWeak(v88);
  objc_destroyWeak(v94);
  objc_destroyWeak((id *)&v98);
  objc_destroyWeak(&location);
  v37 = NPGetInternalQueue();
  *(void *)&long long buf = _NSConcreteStackBlock;
  *((void *)&buf + 1) = 3221225472;
  v96 = sub_1000790A4;
  v97 = &unk_100106470;
  v98 = self;
  int v38 = CNPluginMonitorStart();

  v39 = nplog_obj();
  v40 = v39;
  if (v38)
  {
    if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
    {
      LODWORD(handler) = 138412290;
      *(void *)((char *)&handler + 4) = self;
      _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_INFO, "%@: Started CNPluginMonitor", (uint8_t *)&handler, 0xCu);
    }
  }
  else if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
  {
    LODWORD(handler) = 138412290;
    *(void *)((char *)&handler + 4) = self;
    _os_log_error_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, "%@: Failed to start CNPluginMonitor", (uint8_t *)&handler, 0xCu);
  }

  id v41 = NPGetInternalQueue();
  *(void *)&long long buf = _NSConcreteStackBlock;
  *((void *)&buf + 1) = 3221225472;
  v96 = sub_100077EB0;
  v97 = &unk_100106018;
  v98 = self;
  xpc_set_event_stream_handler("com.apple.distnoted.matching", v41, &buf);

  v42 = nplog_obj();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(handler) = 138412290;
    *(void *)((char *)&handler + 4) = self;
    _os_log_debug_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEBUG, "%@ registered for apps installation/uninstallation event", (uint8_t *)&handler, 0xCu);
  }

LABEL_51:
  id v43 = +[NSPPrivacyProxyLocationMonitor sharedMonitor];
  [v43 setDelegate:self];

  v44 = +[NSPPrivacyProxyLocationMonitor sharedMonitor];
  id v45 = v44;
  if (self) {
    lastGeohash = self->_lastGeohash;
  }
  else {
    lastGeohash = 0;
  }
  [v44 setLastGeohash:lastGeohash];

  v47 = +[NSPPrivacyProxyLocationMonitor sharedMonitor];
  v48 = v47;
  if (self)
  {
    [v47 setLastCountryPlusTimezone:self->_lastCountryPlusTimezone];

    v49 = +[NSPPrivacyProxyLocationMonitor sharedMonitor];
    [v49 start];

    objc_initWeak((id *)&handler, self);
    v50 = NPGetInternalQueue();
    *(void *)&long long buf = _NSConcreteStackBlock;
    *((void *)&buf + 1) = 3221225472;
    v96 = sub_10007B5C4;
    v97 = &unk_1001065D8;
    objc_copyWeak((id *)&v98, (id *)&handler);
    self->_userActivityNotificationHandle = IOPMScheduleUserActivityLevelNotification();

    if (!self->_userActivityNotificationHandle)
    {
      id v51 = nplog_obj();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v84 = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_ERROR, "Failed to register for user activity notifications", v84, 2u);
      }
    }
    objc_destroyWeak((id *)&v98);
    objc_destroyWeak((id *)&handler);
  }
  else
  {
    [v47 setLastCountryPlusTimezone:0];

    v83 = +[NSPPrivacyProxyLocationMonitor sharedMonitor];
    [v83 start];
  }
  sub_10006D6CC((id *)&self->super.isa);
  sub_10006D7FC((uint64_t *)self);
  sub_1000683A8((uint64_t)self);
  if (self)
  {
    if (self->_configOutage) {
      [(NSPServer *)self checkPrivacyProxyConnectivityOnInterface:0 proxyConnectivityCheckType:3 completionHandler:0];
    }
    sub_10006AD24((uint64_t)self);
    if (self->_linkQualityMonitoringSocket == -1)
    {
      int v52 = socket(32, 3, 1);
      self->_uintptr_t linkQualityMonitoringSocket = v52;
      if (v52 == -1)
      {
        v54 = nplog_obj();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
        {
          v79 = __error();
          v80 = strerror(*v79);
          LODWORD(buf) = 136315138;
          *(void *)((char *)&buf + 4) = v80;
          _os_log_error_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_ERROR, "failed to create link quality monitoring socket %s", (uint8_t *)&buf, 0xCu);
        }
      }
      else
      {
        int v90 = 1;
        *(void *)v84 = 0x100000001;
        LODWORD(v85) = 2;
        if (ioctl(v52, 0x800C6502uLL, v84) || ioctl(self->_linkQualityMonitoringSocket, 0x8004667EuLL, &v90))
        {
          v53 = nplog_obj();
          if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
          {
            LOWORD(buf) = 0;
            _os_log_error_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_ERROR, "failed to set ioctl on link quality monitoring socket", (uint8_t *)&buf, 2u);
          }

          close(self->_linkQualityMonitoringSocket);
          self->_uintptr_t linkQualityMonitoringSocket = -1;
        }
        else
        {
          uintptr_t linkQualityMonitoringSocket = self->_linkQualityMonitoringSocket;
          v70 = NPGetInternalQueue();
          v71 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_read, linkQualityMonitoringSocket, 0, v70);
          linkQualityMonitoringSource = self->_linkQualityMonitoringSource;
          self->_linkQualityMonitoringSource = v71;

          if (self->_linkQualityMonitoringSource)
          {
            objc_initWeak(&location, self);
            v73 = self->_linkQualityMonitoringSource;
            *(void *)&long long buf = _NSConcreteStackBlock;
            *((void *)&buf + 1) = 3221225472;
            v96 = sub_10007B148;
            v97 = &unk_1001057F8;
            v74 = v73;
            objc_copyWeak((id *)&v98, &location);
            dispatch_source_set_cancel_handler(v74, &buf);

            v75 = self->_linkQualityMonitoringSource;
            *(void *)&long long handler = _NSConcreteStackBlock;
            *((void *)&handler + 1) = 3221225472;
            v92 = sub_10007B198;
            v93 = &unk_1001057F8;
            v76 = v75;
            objc_copyWeak(v94, &location);
            dispatch_source_set_event_handler(v76, &handler);

            objc_destroyWeak(v94);
            objc_destroyWeak((id *)&v98);
            objc_destroyWeak(&location);
            v77 = self->_linkQualityMonitoringSource;
          }
          else
          {
            v77 = 0;
          }
          dispatch_resume(v77);
          v78 = nplog_obj();
          if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(location) = 0;
            _os_log_impl((void *)&_mh_execute_header, v78, OS_LOG_TYPE_DEFAULT, "registered for link quality changes", (uint8_t *)&location, 2u);
          }

          sub_10006BA10((uint64_t)self);
        }
      }
    }
    sub_10006D988((id *)&self->super.isa);
    if (self->_trialClient
      || (+[TRIClient clientWithIdentifier:265],
          v55 = (TRIClient *)objc_claimAutoreleasedReturnValue(),
          trialClient = self->_trialClient,
          self->_trialClient = v55,
          trialClient,
          self->_trialClient))
    {
      if (!self->_trialNotificationToken)
      {
        objc_initWeak((id *)&handler, self);
        v57 = self->_trialClient;
        v58 = NPGetInternalQueue();
        *(void *)&long long buf = _NSConcreteStackBlock;
        *((void *)&buf + 1) = 3221225472;
        v96 = sub_10007B580;
        v97 = &unk_1001065B0;
        objc_copyWeak((id *)&v98, (id *)&handler);
        v59 = [(TRIClient *)v57 addUpdateHandlerForNamespaceName:@"NETWORK_SERVICE_PROXY_CONFIG_UPDATE" queue:v58 usingBlock:&buf];
        trialNotificationToken = self->_trialNotificationToken;
        self->_trialNotificationToken = v59;

        objc_destroyWeak((id *)&v98);
        objc_destroyWeak((id *)&handler);
      }
    }
    else
    {
      v81 = nplog_obj();
      if (os_log_type_enabled(v81, OS_LOG_TYPE_FAULT))
      {
        LODWORD(buf) = 136315138;
        *(void *)((char *)&buf + 4) = "-[NSPServer setupTrialUpdateHandler]";
        _os_log_fault_impl((void *)&_mh_execute_header, v81, OS_LOG_TYPE_FAULT, "%s called with null self.trialClient", (uint8_t *)&buf, 0xCu);
      }
    }
    if (!self->_toggleStatsTimer)
    {
      v61 = NPGetInternalQueue();
      v62 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v61);
      toggleStatsTimer = self->_toggleStatsTimer;
      self->_toggleStatsTimer = v62;

      v64 = self->_toggleStatsTimer;
      if (v64)
      {
        v65 = v64;
        dispatch_time_t v66 = dispatch_time(0, 600000000000);
        dispatch_source_set_timer(v65, v66, 0x8BB2C97000uLL, 0);

        objc_initWeak((id *)&handler, self);
        v67 = self->_toggleStatsTimer;
        *(void *)&long long buf = _NSConcreteStackBlock;
        *((void *)&buf + 1) = 3221225472;
        v96 = sub_100067D18;
        v97 = &unk_1001057F8;
        v68 = v67;
        objc_copyWeak((id *)&v98, (id *)&handler);
        dispatch_source_set_event_handler(v68, &buf);

        dispatch_resume((dispatch_object_t)self->_toggleStatsTimer);
        objc_destroyWeak((id *)&v98);
        objc_destroyWeak((id *)&handler);
      }
    }
  }
  else
  {
    sub_10006AD24(0);
    sub_10006D988(0);
  }
  sub_10006DBA4((id *)&self->super.isa);
}

- (void)configDisabled:(id)a3
{
  id v4 = a3;
  id v5 = nplog_obj();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Privacy proxy configuration disabled", v14, 2u);
  }

  sub_10001089C((uint64_t)self, 0);
  if (self)
  {
    self->_isRunning = 0;
    *(_WORD *)&self->_captiveOutage = 0;
    *(_DWORD *)&self->_systemIncompatible = 0;
    self->_proxyNetworkOutage = 0;
    objc_storeStrong((id *)&self->_proxyOutageRestoreDate, 0);
    proxyOutageRestoreTimer = self->_proxyOutageRestoreTimer;
    if (proxyOutageRestoreTimer)
    {
      dispatch_source_cancel(proxyOutageRestoreTimer);
      objc_storeStrong((id *)&self->_proxyOutageRestoreTimer, 0);
    }
    sub_10006E138((uint64_t)self);
    [(NSPServiceStatusManager *)self->_serviceStatusManager reportServiceDisabledShouldReport:0];
    +[NSPServiceStatusManager removeFromPreferences];
    objc_storeStrong((id *)&self->_serviceStatusManager, 0);
    id Property = objc_getProperty(self, v7, 272, 1);
  }
  else
  {
    sub_10006E138(0);
    [0 reportServiceDisabledShouldReport:0];
    +[NSPServiceStatusManager removeFromPreferences];
    id Property = 0;
  }
  sub_1000A6678((uint64_t)Property, 1);
  sub_100068F00((uint64_t)self);
  [(NSPServer *)self proxyTokenFetchDisabled:v4];

  v9 = +[NSPPrivacyProxyPolicyHandler sharedHandler];
  [v9 remove:1];

  if (self) {
    odohManager = self->_odohManager;
  }
  else {
    odohManager = 0;
  }
  sub_100052A3C(odohManager);
  sub_10006D6BC((uint64_t)self, 0);
  sub_100055C0C();
  v11 = +[NSPPrivacyProxyLocationMonitor sharedMonitor];
  [v11 stop];

  sub_10006E1C4((uint64_t)self);
  sub_10006E268((uint64_t)self);
  +[NSPDeviceIdentityCertificate removeFromPreferences];
  id v12 = +[NSPDeviceIdentityCertificate sharedDeviceIdentity];
  [v12 resetDeviceIdentityInfo];

  if (self)
  {
    CNPluginMonitorStop();
    sub_10006E2C4((uint64_t)self);
    sub_10006E398((uint64_t)self);
    sub_10006E3DC();
    sub_10006E48C((uint64_t)self);
    if (self->_userActivityNotificationHandle) {
      IOPMUnregisterNotification();
    }
    [(NSPToggleStats *)self->_toggleStats resetStats];
    toggleStatsTimer = self->_toggleStatsTimer;
    if (toggleStatsTimer)
    {
      dispatch_source_cancel(toggleStatsTimer);
      objc_storeStrong((id *)&self->_toggleStatsTimer, 0);
    }
  }
  else
  {
    sub_10006E3DC();
    [0 resetStats];
  }
}

- (void)configurationRestart:(id)a3
{
  id v4 = a3;
  id v5 = nplog_obj();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "server configuration reset", v6, 2u);
  }

  [(NSPServer *)self configDisabled:v4];
  [(NSPServer *)self configEnabled:v4];
}

- (BOOL)configurationFetchDateIsWithinStart:(id)a3 end:(id)a4
{
  if (self) {
    self = (NSPServer *)self->_configuration;
  }
  return [(NSPServer *)self fetchDateIsWithinStart:a3 end:a4];
}

- (BOOL)subscriberTierIsProhibited:(id)a3
{
  SEL v3 = NSSelectorFromString(@"isCloudPrivateRelayAllowed");
  id v4 = +[MCProfileConnection sharedConnection];
  if ((objc_opt_respondsToSelector() & 1) != 0 && ![v4 performSelector:v3])
  {
    SEL v7 = nplog_obj();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)dispatch_source_t v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Privacy proxy prohibited by profile", v8, 2u);
    }

    BOOL v5 = 1;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)suspendPrivacyProxyTemporarily:(id)a3
{
  id v4 = a3;
  BOOL v5 = nplog_obj();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)dispatch_source_t v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Privacy proxy suspended temporarily", v8, 2u);
  }

  if (self)
  {
    self->_isRunning = 0;
    id Property = objc_getProperty(self, v6, 272, 1);
  }
  else
  {
    id Property = 0;
  }
  sub_1000A6678((uint64_t)Property, 1);
  sub_100068F00((uint64_t)self);
  [(NSPServer *)self proxyTokenFetchDisabled:v4];
}

- (void)resumePrivacyProxy:(id)a3
{
  id v4 = a3;
  BOOL v5 = nplog_obj();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)dispatch_source_t v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "resume privacy proxy", v8, 2u);
  }

  if (self)
  {
    self->_isRunning = 1;
    id Property = objc_getProperty(self, v6, 272, 1);
  }
  else
  {
    id Property = 0;
  }
  sub_1000A6720((uint64_t)Property);
  [(NSPServer *)self proxyTokenFetchEnabled:v4];
}

- (void)proxyTokenFetchEnabled:(id)a3
{
  id v4 = a3;
  BOOL v5 = nplog_obj();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Proxy token fetch enabled", v6, 2u);
  }

  [(NSPServer *)self authInfoChanged:v4];
  [(NSPServer *)self proxyInfoChanged:v4];
}

- (void)proxyTokenFetchDisabled:(id)a3
{
  id v4 = nplog_obj();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned __int8 v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Proxy token fetch disabled", v10, 2u);
  }

  sub_10000EF6C((uint64_t)self, 0);
  if (self)
  {
    BOOL v5 = self->_serviceStatusManager;
    configuration = self->_configuration;
  }
  else
  {
    BOOL v5 = 0;
    configuration = 0;
  }
  SEL v7 = configuration;
  dispatch_source_t v8 = [(NSPConfiguration *)v7 proxyConfiguration];
  v9 = [v8 regionId];
  [(NSPServiceStatusManager *)v5 reportUnsupportedRegion:v9];
}

- (void)userTierChanged:(id)a3
{
  id v4 = nplog_obj();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "user tier changed", buf, 2u);
  }

  if (self) {
    configuration = self->_configuration;
  }
  else {
    configuration = 0;
  }
  v6 = [(NSPConfiguration *)configuration userTier];
  id v7 = [v6 unsignedIntegerValue];

  if (v7 != (id)2)
  {
    +[NSPServiceStatusManager removeFromPreferences];
    v24 = [NSPServiceStatusManager alloc];
    if (self) {
      configurationManager = self->_configurationManager;
    }
    else {
      configurationManager = 0;
    }
    id v19 = [(NSPServiceStatusManager *)v24 initWithUserTier:1 effectiveUserTier:[(NSPConfigurationManager *)configurationManager effectiveUserTier] delegate:self];
    sub_100027444((uint64_t)self, v19);
    goto LABEL_31;
  }
  if (self)
  {
    if (self->_isMPTCPConverterProxy)
    {
      dispatch_source_t v8 = nplog_obj();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v27 = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "stopping proxying TCP socket flows to MPTCP converter proxy", v27, 2u);
      }

      sub_10006EC20(self, v9);
    }
    unsigned __int8 v10 = [NSPServiceStatusManager alloc];
    v11 = self->_configurationManager;
  }
  else
  {
    unsigned __int8 v10 = [NSPServiceStatusManager alloc];
    v11 = 0;
  }
  id v12 = [(NSPServiceStatusManager *)v10 initWithUserTier:2 effectiveUserTier:[(NSPConfigurationManager *)v11 effectiveUserTier] delegate:self];
  sub_100027444((uint64_t)self, v12);

  if (self) {
    v13 = self->_configuration;
  }
  else {
    v13 = 0;
  }
  v14 = [(NSPConfiguration *)v13 proxyConfiguration];

  if (v14)
  {
    if (self) {
      v15 = self->_configurationManager;
    }
    else {
      v15 = 0;
    }
    if (![(NSPConfigurationManager *)v15 configurationSubscriberPoliciesCount])
    {
      if (self)
      {
        id v19 = self->_serviceStatusManager;
        v26 = self->_configuration;
      }
      else
      {
        id v19 = 0;
        v26 = 0;
      }
      v21 = v26;
      uint64_t v22 = [(NSPConfiguration *)v21 proxyConfiguration];
      id v23 = [v22 regionId];
      [(NSPServiceStatusManager *)v19 reportSubscriberUnsupportedRegion:v23];
      goto LABEL_30;
    }
    if (self) {
      objc_super v16 = self->_configuration;
    }
    else {
      objc_super v16 = 0;
    }
    v17 = [(NSPConfiguration *)v16 proxyConfiguration];
    unsigned __int8 v18 = [v17 enabled];

    if ((v18 & 1) == 0)
    {
      if (self)
      {
        id v19 = self->_serviceStatusManager;
        v20 = self->_configuration;
      }
      else
      {
        id v19 = 0;
        v20 = 0;
      }
      v21 = v20;
      uint64_t v22 = [(NSPConfiguration *)v21 proxyConfiguration];
      id v23 = [v22 regionId];
      [(NSPServiceStatusManager *)v19 reportUnsupportedRegion:v23];
LABEL_30:

LABEL_31:
    }
  }
  sub_10006ECE8((uint64_t)self);
  sub_10006AC58(self);
  sub_10006EE40((uint64_t)self);
}

- (void)userPreferredTierChanged:(id)a3
{
  id v4 = nplog_obj();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned __int8 v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "user preferred tier changed", v10, 2u);
  }

  if (self) {
    configuration = self->_configuration;
  }
  else {
    configuration = 0;
  }
  v6 = [(NSPConfiguration *)configuration userPreferredTier];
  unsigned int v7 = [v6 unsignedIntValue];

  BOOL v8 = v7 == 2;
  if (self)
  {
    [(NSPPrivacyProxyAgentManager *)self->_privacyProxyAgentManager sendRTCReportForPrivacyProxyToggleState:v8];
    toggleStats = self->_toggleStats;
  }
  else
  {
    [0 sendRTCReportForPrivacyProxyToggleState:v8];
    toggleStats = 0;
  }
  if (v7 == 2) {
    [(NSPToggleStats *)toggleStats sendToggleOnStats];
  }
  else {
    [(NSPToggleStats *)toggleStats sendToggleOffStats];
  }
}

- (void)effectiveUserTierChanged:(id)a3
{
  id v4 = nplog_obj();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v25 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "effective user tier changed", v25, 2u);
  }

  if (self)
  {
    BOOL v5 = self->_serviceStatusManager;
    v6 = self->_configurationManager;
    [(NSPServiceStatusManager *)v5 handleEffectiveUserTierChange:[(NSPConfigurationManager *)v6 effectiveUserTier]];

    configuration = self->_configuration;
  }
  else
  {
    [0 handleEffectiveUserTierChange:[0 effectiveUserTier]];

    configuration = 0;
  }
  BOOL v8 = [(NSPConfiguration *)configuration proxyConfiguration];

  if (v8)
  {
    v9 = self ? self->_configurationManager : 0;
    if ((id)[(NSPConfigurationManager *)v9 effectiveUserTier] == (id)1)
    {
      if (self) {
        unsigned __int8 v10 = self->_configuration;
      }
      else {
        unsigned __int8 v10 = 0;
      }
      v11 = v10;
      id v12 = [(NSPServiceStatusManager *)v11 userTier];
      if ([v12 unsignedIntegerValue] != (id)2) {
        goto LABEL_18;
      }
      if (self) {
        configurationManager = self->_configurationManager;
      }
      else {
        configurationManager = 0;
      }
      unint64_t v14 = [(NSPConfigurationManager *)configurationManager configurationSubscriberPoliciesCount];

      if (!v14)
      {
        if (self)
        {
          v11 = self->_serviceStatusManager;
          v15 = self->_configuration;
        }
        else
        {
          v11 = 0;
          v15 = 0;
        }
        objc_super v16 = v15;
        id v12 = [(NSPConfiguration *)v16 proxyConfiguration];
        v17 = [v12 regionId];
        [(NSPServiceStatusManager *)v11 reportSubscriberUnsupportedRegion:v17];

LABEL_18:
      }
    }
  }
  if (self) {
    unsigned __int8 v18 = self->_configurationManager;
  }
  else {
    unsigned __int8 v18 = 0;
  }
  id v19 = [(NSPConfigurationManager *)v18 effectiveUserTier];
  id v20 = v19;
  if (self)
  {
    [(NSPPrivacyProxyAgentManager *)self->_privacyProxyAgentManager handleTierChange:v19 == (id)2];
    if (v20 == (id)2 && self->_captiveOutage)
    {
      objc_storeStrong((id *)&self->_captiveEvaluatedSSID, 0);
      sub_10006F578((uint64_t)self);
      return;
    }
    v21 = self->_configurationManager;
    uint64_t v22 = self->_configurationManager;
  }
  else
  {
    [0 handleTierChange:v19 == (id)2];
    v21 = 0;
    uint64_t v22 = 0;
  }
  id v23 = v22;
  v24 = [(NSPConfigurationManager *)v23 mergeProxyTrafficStateWithCurrentPolicy];
  [(NSPServer *)self policiesUpdated:v21 policy:v24 resolverInfoChanged:1];
}

- (void)authInfoChanged:(id)a3
{
  unsigned int v7 = nplog_obj();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Auth info updated", buf, 2u);
  }

  if (self) {
    configuration = self->_configuration;
  }
  else {
    configuration = 0;
  }
  v9 = configuration;
  unsigned __int8 v10 = [(NSPConfiguration *)v9 proxyConfiguration];
  v11 = [v10 authInfo];
  unsigned int v12 = [v11 authType];
  if (v12)
  {
    v13 = self ? self->_configuration : 0;
    SEL v3 = v13;
    id v4 = [(NSPConfiguration *)v3 proxyConfiguration];
    BOOL v5 = [v4 authInfo];
    unint64_t v14 = [v5 authURL];
    if (v14)
    {

LABEL_15:
      if (self) {
        id v19 = self->_configuration;
      }
      else {
        id v19 = 0;
      }
      id v20 = [(NSPConfiguration *)v19 proxyConfiguration];
      v21 = [v20 authInfo];
      uint64_t v22 = (char *)[v21 accessTokenTypesCount];

      if (v22)
      {
        id v23 = objc_alloc_init((Class)NSMutableArray);
        for (i = 0; i != v22; ++i)
        {
          if (self) {
            v25 = self->_configuration;
          }
          else {
            v25 = 0;
          }
          v26 = [(NSPConfiguration *)v25 proxyConfiguration];
          v27 = [v26 authInfo];
          id v28 = [v27 accessTokenTypesAtIndex:i];

          v29 = +[NSNumber numberWithUnsignedInt:v28];
          [v23 addObject:v29];
        }
      }
      else
      {
        id v23 = 0;
      }
      int v52 = +[NSPPrivacyTokenManager sharedTokenManager];
      if (self) {
        v30 = self->_configuration;
      }
      else {
        v30 = 0;
      }
      v50 = v30;
      v49 = [(NSPConfiguration *)v50 proxyConfiguration];
      v48 = [v49 authInfo];
      v47 = [v48 authURL];
      if (self) {
        v31 = self->_configuration;
      }
      else {
        v31 = 0;
      }
      objc_super v46 = v31;
      id v45 = [(NSPConfiguration *)v46 proxyConfiguration];
      v44 = [v45 authInfo];
      id v43 = [v44 accessTokenURL];
      if (self) {
        id v32 = self->_configuration;
      }
      else {
        id v32 = 0;
      }
      v42 = v32;
      id v41 = [(NSPConfiguration *)v42 proxyConfiguration];
      v33 = [v41 authInfo];
      v34 = [v33 accessTokenBlockedIssuers];
      if (self) {
        int v35 = self->_configuration;
      }
      else {
        int v35 = 0;
      }
      v36 = v35;
      v37 = [(NSPConfiguration *)v36 proxyConfiguration];
      int v38 = [v37 authInfo];
      id v39 = [v38 authType];
      if (self) {
        v40 = self->_configuration;
      }
      else {
        v40 = 0;
      }
      [v52 updateTokenFetchURL:v47 accessTokenURL:v43 accessTokenTypes:v23 accessTokenBlockedIssuers:v34 authenticationType:v39 ignoreInvalidCerts:[v40 ignoreInvalidCerts]];

      return;
    }
  }
  id v51 = v9;
  if (self) {
    v15 = self->_configuration;
  }
  else {
    v15 = 0;
  }
  objc_super v16 = [(NSPConfiguration *)v15 proxyConfiguration];
  v17 = [v16 authInfo];
  unsigned __int8 v18 = [v17 accessTokenURL];

  if (v12)
  {
  }
  if (v18) {
    goto LABEL_15;
  }
}

- (void)proxyInfoChanged:(id)a3
{
  id v4 = nplog_obj();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Proxy info updated", buf, 2u);
  }

  if (self) {
    configuration = self->_configuration;
  }
  else {
    configuration = 0;
  }
  v6 = [(NSPConfiguration *)configuration proxyConfiguration];
  unsigned int v7 = [v6 proxies];
  id v8 = [v7 count];

  if (!v8)
  {
    sub_10000EF6C((uint64_t)self, 0);
    return;
  }
  if (self)
  {
    privacyProxyAgentManager = self->_privacyProxyAgentManager;
    if (privacyProxyAgentManager) {
      goto LABEL_23;
    }
    configurationManager = self->_configurationManager;
  }
  else
  {
    configurationManager = 0;
  }
  id v11 = [(NSPConfigurationManager *)configurationManager effectiveUserTier];
  unsigned int v12 = [NSPPrivacyProxyAgentManager alloc];
  if (self)
  {
    v13 = [(NSPPrivacyProxyAgentManager *)v12 initWithDelegate:self toggleStats:self->_toggleStats];
    objc_storeStrong((id *)&self->_privacyProxyAgentManager, v13);

    v57 = self->_privacyProxyAgentManager;
    primaryPhysicalInterfaceEvaluator = self->_primaryPhysicalInterfaceEvaluator;
  }
  else
  {

    v57 = 0;
    primaryPhysicalInterfaceEvaluator = 0;
  }
  v55 = primaryPhysicalInterfaceEvaluator;
  v53 = [(NWPathEvaluator *)v55 path];
  if (self) {
    v15 = self->_configurationManager;
  }
  else {
    v15 = 0;
  }
  id v51 = v15;
  unsigned int v49 = [(NSPConfigurationManager *)v51 policyIncludesUnlimited];
  if (self) {
    objc_super v16 = self->_configuration;
  }
  else {
    objc_super v16 = 0;
  }
  v17 = v16;
  unsigned __int8 v18 = [(NSPConfiguration *)v17 geohashSharingEnabledStatus];
  id v19 = [v18 BOOLValue];
  if (self) {
    id v20 = self->_configuration;
  }
  else {
    id v20 = 0;
  }
  v21 = v20;
  uint64_t v22 = [(NSPConfiguration *)v21 geohashOverride];
  if (self) {
    id v23 = self->_configuration;
  }
  else {
    id v23 = 0;
  }
  v24 = v23;
  v25 = [(NSPConfiguration *)v24 epoch];
  if (self) {
    int primaryInterfaceLinkQuality = self->_primaryInterfaceLinkQuality;
  }
  else {
    int primaryInterfaceLinkQuality = 0;
  }
  LODWORD(v40) = primaryInterfaceLinkQuality;
  [(NSPPrivacyProxyAgentManager *)v57 setupWithPath:v53 subscriber:v11 == (id)2 unlimited:v49 geohashSharingEnabled:v19 geohashOverride:v22 configEpoch:v25 linkQuality:v40];

  if (!self)
  {
    [0 useDefaultNetworkInterface:[0 usesDefaultConfigurationServer] ^ 1];
    v58 = 0;
    id v28 = 0;
    goto LABEL_24;
  }
  v27 = self->_privacyProxyAgentManager;
  [(NSPPrivacyProxyAgentManager *)v27 useDefaultNetworkInterface:[(NSPServer *)self usesDefaultConfigurationServer] ^ 1];

  privacyProxyAgentManager = self->_privacyProxyAgentManager;
LABEL_23:
  v58 = privacyProxyAgentManager;
  id v28 = self->_configuration;
LABEL_24:
  v56 = v28;
  v54 = [(NSPConfiguration *)v56 proxyConfiguration];
  int v52 = [v54 proxies];
  if (self) {
    v29 = self->_configuration;
  }
  else {
    v29 = 0;
  }
  v50 = v29;
  v48 = [(NSPConfiguration *)v50 proxyConfiguration];
  v47 = [v48 resolvers];
  if (self) {
    v30 = self->_configuration;
  }
  else {
    v30 = 0;
  }
  objc_super v46 = v30;
  id v45 = [(NSPConfiguration *)v46 proxyConfiguration];
  v44 = [v45 pathWeights];
  if (self) {
    v31 = self->_configuration;
  }
  else {
    v31 = 0;
  }
  id v43 = v31;
  v42 = [(NSPConfiguration *)v43 proxyConfiguration];
  id v41 = [v42 fallbackPathWeights];
  if (self) {
    id v32 = self->_configuration;
  }
  else {
    id v32 = 0;
  }
  v33 = v32;
  v34 = [(NSPConfiguration *)v33 proxyConfiguration];
  int v35 = [v34 obliviousConfigs];
  if (self) {
    v36 = self->_configuration;
  }
  else {
    v36 = 0;
  }
  v37 = v36;
  int v38 = [(NSPConfiguration *)v37 proxyConfiguration];
  id v39 = [v38 proxiedContentMaps];
  [(NSPPrivacyProxyAgentManager *)v58 updateProxyInfo:v52 resolverInfo:v47 proxyPathList:v44 fallbackProxyPathList:v41 obliviousConfigs:v35 proxiedContentMaps:v39];
}

- (void)policiesUpdated:(id)a3 policy:(id)a4 resolverInfoChanged:(BOOL)a5
{
  BOOL v5 = a5;
  unsigned int v7 = (NSPServer *)a4;
  id v8 = nplog_obj();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    v71 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "privacy proxy policies updated - %@", buf, 0xCu);
  }

  if (v7)
  {
    v9 = v7;
    if (!self)
    {
LABEL_13:

      goto LABEL_14;
    }
    if (![(NSPPrivacyProxyAgentManager *)self->_privacyProxyAgentManager isMultiHopProxyAgentRegistered])
    {
      unsigned __int8 v10 = nplog_obj();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)long long buf = 0;
        id v11 = "defer policy installation until multiHop agents are ready";
        goto LABEL_11;
      }
LABEL_12:

      goto LABEL_13;
    }
    if (self->_systemIncompatible)
    {
      unsigned __int8 v10 = nplog_obj();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)long long buf = 0;
        id v11 = "defer policy installation until system compatible";
LABEL_11:
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, v11, buf, 2u);
        goto LABEL_12;
      }
      goto LABEL_12;
    }
    if (self->_fraudAlert)
    {
      unsigned __int8 v10 = nplog_obj();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO)) {
        goto LABEL_12;
      }
      *(_WORD *)long long buf = 0;
      id v11 = "defer policy installation, token limit reached";
      goto LABEL_11;
    }
    if (self->_configOutage)
    {
      unsigned __int8 v10 = nplog_obj();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO)) {
        goto LABEL_12;
      }
      *(_WORD *)long long buf = 0;
      id v11 = "defer policy installation until config outage is resolved";
      goto LABEL_11;
    }
    if (self->_tokenOutage)
    {
      unsigned __int8 v10 = nplog_obj();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO)) {
        goto LABEL_12;
      }
      *(_WORD *)long long buf = 0;
      id v11 = "defer policy installtion until token outage is resolved";
      goto LABEL_11;
    }
    if (self->_proxyOutage)
    {
      unsigned __int8 v10 = nplog_obj();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO)) {
        goto LABEL_12;
      }
      *(_WORD *)long long buf = 0;
      id v11 = "defer policy installation until proxy outage is resolved";
      goto LABEL_11;
    }
    if (self->_proxyNetworkOutage)
    {
      unsigned __int8 v10 = nplog_obj();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO)) {
        goto LABEL_12;
      }
      *(_WORD *)long long buf = 0;
      id v11 = "defer policy installation until proxy network outage is resolved";
      goto LABEL_11;
    }
    if (sub_10006C10C((uint64_t)self, v9))
    {
      if (self->_odohOutage)
      {
        unsigned __int8 v10 = nplog_obj();
        if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO)) {
          goto LABEL_12;
        }
        *(_WORD *)long long buf = 0;
        id v11 = "defer policy installation until odoh outage is resolved";
        goto LABEL_11;
      }
      if (self->_odohAuthOutage)
      {
        unsigned __int8 v10 = nplog_obj();
        if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO)) {
          goto LABEL_12;
        }
        *(_WORD *)long long buf = 0;
        id v11 = "defer policy installation until odoh auth outage is resolved";
        goto LABEL_11;
      }
    }
    if (self->_captiveOutage)
    {
      unsigned __int8 v10 = nplog_obj();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO)) {
        goto LABEL_12;
      }
      *(_WORD *)long long buf = 0;
      id v11 = "defer policy installation until captive outage is resolved";
      goto LABEL_11;
    }

    v30 = self->_privacyProxyAgentManager;
    [(NSPPrivacyProxyAgentManager *)v30 handleUnlimitedChange:sub_100070F04((BOOL)self, v9)];

    if ([(NSPPrivacyProxyAgentManager *)self->_privacyProxyAgentManager isSingleHopProxyAgentRegistered])
    {
      v31 = [(NSPConfiguration *)self->_configuration proxyConfiguration];
      id v32 = [v31 bootstrapResolver];

      if ((sub_100052E60((uint64_t)self->_odohManager, v32) & 1) == 0)
      {
        v33 = nplog_obj();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 138412290;
          v71 = self;
          _os_log_error_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "%@ failed to register bootstrap DNS network agent", buf, 0xCu);
        }
      }
    }
    if (sub_10006C10C((uint64_t)self, v9))
    {
      if (v5)
      {
        v34 = nplog_obj();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          int v35 = self->_configuration;
          v36 = [(NSPConfiguration *)v35 proxyConfiguration];
          v37 = [v36 resolvers];
          *(_DWORD *)long long buf = 138412290;
          v71 = v37;
          _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "privacy proxy resolver info updated %@", buf, 0xCu);
        }
        if (![(NSPPrivacyProxyAgentManager *)self->_privacyProxyAgentManager isSingleHopProxyAgentRegistered])
        {
          id v28 = nplog_obj();
          if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
            goto LABEL_122;
          }
          *(_DWORD *)long long buf = 138412290;
          v71 = self;
          id v43 = "%@ single hop proxy agent is not active, unable to set DNS policies";
          goto LABEL_116;
        }
        odohManager = self->_odohManager;
        id v39 = self->_configuration;
        uint64_t v40 = odohManager;
        id v41 = [(NSPConfiguration *)v39 proxyConfiguration];
        v42 = [v41 resolvers];
        sub_1000529D0((uint64_t)v40, v42);
      }
      if ((sub_100053AC0((uint64_t)self->_odohManager) & 1) == 0)
      {
        id v28 = nplog_obj();
        if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
          goto LABEL_122;
        }
        *(_DWORD *)long long buf = 138412290;
        v71 = self;
        id v43 = "%@ failed to register DNS network agent";
LABEL_116:
        _os_log_error_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, v43, buf, 0xCu);
        goto LABEL_122;
      }
    }
    else
    {
      sub_100052B24((uint64_t)self->_odohManager);
      sub_10006E138((uint64_t)self);
    }
    v44 = [(NSPConfiguration *)self->_configuration inProcessFlowDivert];

    if (v44)
    {
      objc_super v46 = [(NSPConfiguration *)self->_configuration inProcessFlowDivert];
      unsigned int v47 = [v46 BOOLValue];
    }
    else
    {
      unsigned int v47 = 1;
    }
    v15 = (NSPOutageReasonStats *)objc_getProperty(self, v45, 48, 1);
    v48 = [(NSPServiceStatusManager *)self->_serviceStatusManager pausedBundleIDs];
    unsigned int v68 = v47;
    v67 = v48;
    if (v48)
    {
      if (v15)
      {
        uint64_t v49 = [(NSPOutageReasonStats *)v15 arrayByAddingObjectsFromArray:v48];

        v15 = (NSPOutageReasonStats *)v49;
      }
      else
      {
        v15 = v48;
      }
    }
    v69 = [(NSPServiceStatusManager *)self->_serviceStatusManager pausedProcessPaths];
    v50 = +[NSPPrivacyProxyPolicyHandler sharedHandler];
    id Property = objc_getProperty(self, v51, 272, 1);
    if (Property) {
      v53 = (void *)Property[2];
    }
    else {
      v53 = 0;
    }
    id v54 = v53;
    v55 = self->_privacyProxyAgentManager;
    v56 = [(NSPPrivacyProxyAgentManager *)v55 ingressProxyURL];
    v57 = self->_privacyProxyAgentManager;
    v58 = [(NSPPrivacyProxyAgentManager *)v57 ingressFallbackProxyURL];
    unsigned __int8 v59 = [v50 set:v9 flowDivertHandle:v54 inProcessFlowDivert:v68 ingressProxyURL:v56 ingressFallbackProxyURL:v58 exceptionBundleIDs:v15 exceptionProcessPaths:v69];

    if (v59)
    {
      unint64_t v60 = [(NSPConfigurationManager *)self->_configurationManager configurationSubscriberPoliciesCount];
      v61 = self->_serviceStatusManager;
      p_super = &v61->super;
      if (v60)
      {
        [(NSPServiceStatusManager *)v61 reportServiceActiveShouldReport:self->_userTierChangedFromNonSettingsApp];
      }
      else
      {
        v63 = self->_configuration;
        v64 = [(NSPConfiguration *)v63 proxyConfiguration];
        v65 = [v64 regionId];
        [p_super reportSubscriberUnsupportedRegion:v65];
      }
    }
    else
    {
      p_super = nplog_obj();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412290;
        v71 = self;
        _os_log_error_impl((void *)&_mh_execute_header, p_super, OS_LOG_TYPE_ERROR, "%@ failed to set privacy proxy policies", buf, 0xCu);
      }
    }

    goto LABEL_113;
  }
LABEL_14:
  if (!self)
  {
    unsigned __int8 v12 = [0 isNetworkOutage];
    unsigned __int8 v66 = [0 isServiceOutage];
    if (v7) {
      goto LABEL_118;
    }
    unsigned __int8 v13 = v66;
    v15 = 0;
    goto LABEL_95;
  }
  unsigned __int8 v12 = [(NSPServiceStatusManager *)self->_serviceStatusManager isNetworkOutage];
  unsigned __int8 v13 = [(NSPServiceStatusManager *)self->_serviceStatusManager isServiceOutage];
  if (self->_systemIncompatible)
  {
    [(NSPServiceStatusManager *)self->_serviceStatusManager reportSystemIncompatibility];
    unint64_t v14 = self->_toggleStats;
    [(NSPToggleStats *)v14 setSystemIncompatibleCount:(char *)[(NSPToggleStats *)v14 systemIncompatibleCount] + 1];
LABEL_19:
    v15 = 0;
LABEL_20:
    int v16 = 1;
LABEL_21:

    goto LABEL_22;
  }
  if (self->_fraudAlert)
  {
    [(NSPServiceStatusManager *)self->_serviceStatusManager reportFraudAlert];
    unint64_t v14 = self->_toggleStats;
    [(NSPToggleStats *)v14 setFraudAlertCount:(char *)[(NSPToggleStats *)v14 fraudAlertCount] + 1];
    goto LABEL_19;
  }
  if (self->_captiveOutage)
  {
    v29 = self->_lastCaptiveOutageReasonStats;
LABEL_42:
    v15 = v29;
    [(NSPServiceStatusManager *)self->_serviceStatusManager reportServiceOutageWithType:2 outageReasonStats:v29];
    unint64_t v14 = self->_toggleStats;
    [(NSPToggleStats *)v14 setNetworkOutageCount:(char *)[(NSPToggleStats *)v14 networkOutageCount] + 1];
    int v16 = 0;
    goto LABEL_21;
  }
  if (self->_proxyOutage)
  {
    v15 = [(NSPPrivacyProxyAgentManager *)self->_privacyProxyAgentManager lastProxyOutageReason];
    [(NSPServiceStatusManager *)self->_serviceStatusManager reportServiceOutageWithType:5 outageReasonStats:v15];
    unint64_t v14 = self->_toggleStats;
    [(NSPToggleStats *)v14 setProxyOutageCount:(char *)[(NSPToggleStats *)v14 proxyOutageCount] + 1];
    goto LABEL_20;
  }
  if (self->_proxyNetworkOutage)
  {
    v29 = [(NSPPrivacyProxyAgentManager *)self->_privacyProxyAgentManager lastProxyOutageReason];
    goto LABEL_42;
  }
  if (self->_odohOutage || self->_odohAuthOutage)
  {
    sub_1000553D0((id *)&self->_odohManager->super.isa);
    v15 = (NSPOutageReasonStats *)objc_claimAutoreleasedReturnValue();
    [(NSPServiceStatusManager *)self->_serviceStatusManager reportServiceOutageWithType:4 outageReasonStats:v15];
    unint64_t v14 = self->_toggleStats;
    [(NSPToggleStats *)v14 setOdohOutageCount:(char *)[(NSPToggleStats *)v14 odohOutageCount] + 1];
    goto LABEL_20;
  }
  if (self->_tokenOutage)
  {
    v15 = [(NSPPrivacyProxyAgentManager *)self->_privacyProxyAgentManager lastTokenOutageReason];
    [(NSPServiceStatusManager *)self->_serviceStatusManager reportServiceOutageWithType:3 outageReasonStats:v15];
    unint64_t v14 = self->_toggleStats;
    [(NSPToggleStats *)v14 setTokenOutageCount:(char *)[(NSPToggleStats *)v14 tokenOutageCount] + 1];
    goto LABEL_20;
  }
  if (self->_configOutage)
  {
    v15 = self->_lastConfigOutageReasonStats;
    int v16 = 1;
    [(NSPServiceStatusManager *)self->_serviceStatusManager reportServiceOutageWithType:1 outageReasonStats:v15];
    unint64_t v14 = self->_toggleStats;
    [(NSPToggleStats *)v14 setConfigOutageCount:(char *)[(NSPToggleStats *)v14 configOutageCount] + 1];
    goto LABEL_21;
  }
  v15 = 0;
  if (v7)
  {
LABEL_113:

    goto LABEL_35;
  }
LABEL_95:
  int v16 = 1;
LABEL_22:
  v17 = nplog_obj();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "remove policies", buf, 2u);
  }

  unsigned __int8 v18 = +[NSPPrivacyProxyPolicyHandler sharedHandler];
  [v18 remove:0];

  if (self) {
    id v19 = self->_odohManager;
  }
  else {
    id v19 = 0;
  }
  sub_100052B24((uint64_t)v19);
  if (v16) {
    unsigned __int8 v20 = v13;
  }
  else {
    unsigned __int8 v20 = v12;
  }
  if (v15 && (v20 & 1) == 0)
  {
    if (self) {
      privacyProxyAgentManager = self->_privacyProxyAgentManager;
    }
    else {
      privacyProxyAgentManager = 0;
    }
    [(NSPPrivacyProxyAgentManager *)privacyProxyAgentManager sendRTCReportForServiceOutage:v15];
  }

  if (self)
  {
LABEL_35:
    id v23 = objc_getProperty(self, v22, 376, 1);
    if (sub_100048144((uint64_t)v23))
    {
      id v25 = objc_getProperty(self, v24, 376, 1);
      sub_100047E70((uint64_t)v25, [(NSPServer *)self isSubscriberUnlimited]);

      id v27 = objc_getProperty(self, v26, 272, 1);
LABEL_37:
      id v28 = v27;
      [(NSPServer *)self isSubscriberUnlimited];
      if (v28 && v28[3].isa) {
        NEFlowDirectorRedirectDNSToLoopback();
      }
      goto LABEL_122;
    }
    goto LABEL_120;
  }
LABEL_118:
  if (sub_100048144(0))
  {
    sub_100047E70(0, (int)[0 isSubscriberUnlimited]);
    id v27 = 0;
    goto LABEL_37;
  }
LABEL_120:
  id v28 = nplog_obj();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "DNS proxy not supported on this platform", buf, 2u);
  }
LABEL_122:
}

- (void)configUpdated:(id)a3
{
  id v4 = nplog_obj();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned int v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Configuration updated", v7, 2u);
  }

  sub_10006AE90((uint64_t)self);
  sub_10006DBA4((id *)&self->super.isa);
  if (self)
  {
    BOOL v5 = self->_privacyProxyAgentManager;
    [(NSPPrivacyProxyAgentManager *)v5 useDefaultNetworkInterface:[(NSPServer *)self usesDefaultConfigurationServer] ^ 1];

    sub_100054BEC((id *)&self->_odohManager->super.isa);
    privacyProxyAgentManager = self->_privacyProxyAgentManager;
  }
  else
  {
    [0 useDefaultNetworkInterface:[0 usesDefaultConfigurationServer] ^ 1];
    sub_100054BEC(0);
    privacyProxyAgentManager = 0;
  }
  [(NSPPrivacyProxyAgentManager *)privacyProxyAgentManager handleConfigChange];
}

- (void)geohashSettingsChanged:(id)a3
{
  id v4 = nplog_obj();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned __int8 v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Geohash settings changed", v13, 2u);
  }

  if (self)
  {
    BOOL v5 = self->_privacyProxyAgentManager;
    configuration = self->_configuration;
  }
  else
  {
    BOOL v5 = 0;
    configuration = 0;
  }
  unsigned int v7 = configuration;
  id v8 = [(NSPConfiguration *)v7 geohashSharingEnabledStatus];
  id v9 = [v8 BOOLValue];
  if (self) {
    unsigned __int8 v10 = self->_configuration;
  }
  else {
    unsigned __int8 v10 = 0;
  }
  id v11 = v10;
  unsigned __int8 v12 = [(NSPConfiguration *)v11 geohashOverride];
  [(NSPPrivacyProxyAgentManager *)v5 updateGeohashSharingPreference:v9 geohashOverride:v12];
}

- (void)configEpochChanged:(id)a3
{
  id v4 = nplog_obj();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Config epoch changed", v9, 2u);
  }

  if (self)
  {
    BOOL v5 = self->_privacyProxyAgentManager;
    configuration = self->_configuration;
  }
  else
  {
    BOOL v5 = 0;
    configuration = 0;
  }
  unsigned int v7 = configuration;
  id v8 = [(NSPConfiguration *)v7 epoch];
  [(NSPPrivacyProxyAgentManager *)v5 updateConfigEpoch:v8];
}

- (void)privateAccessTokensEnabledChanged:(id)a3
{
  SEL v3 = nplog_obj();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Private Access Tokens settings changed", v4, 2u);
  }
}

- (void)cloudSubscriptionChanged:(BOOL)a3 configManager:(id)a4
{
  if (a3)
  {
    sub_10006D6CC((id *)&self->super.isa);
    sub_10006D7FC((uint64_t *)self);
  }
  else
  {
    sub_10006E268((uint64_t)self);
  }
}

- (void)badTokenInfoForProxy:(id)a3
{
  if (self) {
    configuration = self->_configuration;
  }
  else {
    configuration = 0;
  }
  v6 = configuration;
  id v7 = a3;
  id v8 = [(NSPConfiguration *)v6 configurationFetchDate];
  id v9 = +[NSDateFormatter localizedStringFromDate:v8 dateStyle:1 timeStyle:2];

  unsigned __int8 v10 = nplog_obj();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    if (self) {
      id v11 = self->_configuration;
    }
    else {
      id v11 = 0;
    }
    unsigned __int8 v12 = v11;
    unsigned __int8 v13 = [(NSPConfiguration *)v12 etag];
    *(_DWORD *)long long buf = 138412546;
    id v28 = v13;
    __int16 v29 = 2112;
    v30 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Received bad token info for configuration tag[%@] with fetch date %@", buf, 0x16u);
  }
  [(NSPServer *)self refreshProxyInfo:6];
  unint64_t v14 = +[NSDate now];
  if (self) {
    v15 = self->_configuration;
  }
  else {
    v15 = 0;
  }
  int v16 = [(NSPConfiguration *)v15 configurationFetchDate];
  [v14 timeIntervalSinceDate:v16];
  double v18 = v17;

  id v19 = objc_alloc_init(NSPBadTokenInfoStats);
  if (self) {
    unsigned __int8 v20 = self->_configuration;
  }
  else {
    unsigned __int8 v20 = 0;
  }
  v21 = [(NSPConfiguration *)v20 userTier];
  id v22 = [v21 intValue];
  if (v22 >= 3)
  {
    id v23 = +[NSString stringWithFormat:@"(unknown: %i)", v22];
  }
  else
  {
    id v23 = *(&off_1001065F8 + (int)v22);
  }
  [(NSPBadTokenInfoStats *)v19 setTierType:v23];

  v24 = [v7 vendor];

  [(NSPBadTokenInfoStats *)v19 setTokenProxy:v24];
  if (self) {
    id v25 = self->_configuration;
  }
  else {
    id v25 = 0;
  }
  SEL v26 = [(NSPConfiguration *)v25 etag];
  [(NSPBadTokenInfoStats *)v19 setConfigTag:v26];

  [(NSPBadTokenInfoStats *)v19 setConfigAgeHours:(unint64_t)(v18 / 3600.0)];
  [(NSPProxyAnalytics *)v19 sendAnalytics];
}

- (void)refreshProxyInfo:(unint64_t)a3
{
  BOOL v5 = nplog_obj();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ received refresh proxy information", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v10 = 0x3032000000;
  id v11 = sub_100005D9C;
  unsigned __int8 v12 = sub_10005C1A4;
  id v13 = (id)os_transaction_create();
  if (self) {
    configurationManager = self->_configurationManager;
  }
  else {
    configurationManager = 0;
  }
  id v7 = configurationManager;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100071734;
  v8[3] = &unk_1001061A8;
  v8[4] = &buf;
  [(NSPConfigurationManager *)v7 refreshConfigurationWithReason:a3 completionHandler:v8];

  _Block_object_dispose(&buf, 8);
}

- (void)multiHopProxyAgentRegistered:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = nplog_obj();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = "is not";
    if (v3) {
      v6 = "is";
    }
    int v11 = 136315138;
    unsigned __int8 v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "multiHop proxy agent %s registered", (uint8_t *)&v11, 0xCu);
  }

  if (v3)
  {
    if (self) {
      configurationManager = self->_configurationManager;
    }
    else {
      configurationManager = 0;
    }
    id v8 = [(NSPConfigurationManager *)configurationManager mergeProxyTrafficStateWithCurrentPolicy];
    if (self) {
      id v9 = self->_configurationManager;
    }
    else {
      id v9 = 0;
    }
    [(NSPServer *)self policiesUpdated:v9 policy:v8 resolverInfoChanged:1];
  }
  else
  {
    if (self) {
      uint64_t v10 = self->_configurationManager;
    }
    else {
      uint64_t v10 = 0;
    }
    [(NSPServer *)self policiesUpdated:v10 policy:0 resolverInfoChanged:0];
  }
}

- (void)singleHopProxyAgentRegistered:(BOOL)a3
{
  if (a3)
  {
    if (self)
    {
      sub_100052B24((uint64_t)self->_odohManager);
      odohManager = self->_odohManager;
    }
    else
    {
      sub_100052B24(0);
      odohManager = 0;
    }
    sub_100053AC0((uint64_t)odohManager);
  }
}

- (void)obliviousHopAgentRegisteredForHostname:(id)a3 processes:(id)a4 agentUUID:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [v8 count];
  int v11 = nplog_obj();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v10)
  {
    if (v12)
    {
      int v17 = 138412802;
      id v18 = v7;
      __int16 v19 = 2112;
      id v20 = v9;
      __int16 v21 = 2112;
      id v22 = v8;
      id v13 = "Adding policies for oblivious agent for %@ (%@), limited to %@";
      unint64_t v14 = v11;
      uint32_t v15 = 32;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v17, v15);
    }
  }
  else if (v12)
  {
    int v17 = 138412546;
    id v18 = v7;
    __int16 v19 = 2112;
    id v20 = v9;
    id v13 = "Adding policies for oblivious agent for %@ (%@)";
    unint64_t v14 = v11;
    uint32_t v15 = 22;
    goto LABEL_6;
  }

  int v16 = +[NSPPrivacyProxyPolicyHandler sharedHandler];
  [v16 addObliviousProxyAgent:v9 processes:v8 hostname:v7];
}

- (void)obliviousHopAgentUnregisteredForHostname:(id)a3 agentUUID:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = nplog_obj();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412546;
    id v10 = v5;
    __int16 v11 = 2112;
    id v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Removing policies for oblivious agent for %@ (%@)", (uint8_t *)&v9, 0x16u);
  }

  id v8 = +[NSPPrivacyProxyPolicyHandler sharedHandler];
  [v8 removeObliviousProxyAgent:v6 forHostname:v5 apply:1];
}

- (void)proxiedContentMaps:(id)a3 registeredForAgentUUID:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = nplog_obj();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Adding policies for proxied content for %@", (uint8_t *)&v9, 0xCu);
  }

  id v8 = +[NSPPrivacyProxyPolicyHandler sharedHandler];
  [v8 addProxiedContentAgent:v5 maps:v6];
}

- (void)networkDiscoveredProxyPaths:(id)a3 registeredForAgentUUID:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = nplog_obj();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Adding policy for network discovered agent for %@", (uint8_t *)&v9, 0xCu);
  }

  id v8 = +[NSPPrivacyProxyPolicyHandler sharedHandler];
  [v8 addNetworkDiscoveryProxyAgent:v5 with:v6];
}

- (void)proxiedContentMapsUnregisteredForAgentUUID:(id)a3
{
  id v3 = a3;
  id v4 = nplog_obj();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Removing policies for proxied content for %@", (uint8_t *)&v6, 0xCu);
  }

  id v5 = +[NSPPrivacyProxyPolicyHandler sharedHandler];
  [v5 removeProxiedContentAgent:v3 apply:1];
}

- (void)tokenIssuanceLimitReached
{
  if (!self || !self->_fraudAlert)
  {
    id v3 = nplog_obj();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Reporting fraud alert", v5, 2u);
    }

    if (self)
    {
      self->_fraudAlert = 1;
      configurationManager = self->_configurationManager;
    }
    else
    {
      configurationManager = 0;
    }
    [(NSPServer *)self policiesUpdated:configurationManager policy:0 resolverInfoChanged:0];
    sub_10006C228((uint64_t)self);
  }
  sub_10006AE90((uint64_t)self);
}

- (void)tokenIssuanceAllowed
{
  if (self && self->_fraudAlert)
  {
    id v3 = nplog_obj();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Reporting token issuance allowed", v5, 2u);
    }

    self->_fraudAlert = 0;
    id v4 = [(NSPConfigurationManager *)self->_configurationManager mergeProxyTrafficStateWithCurrentPolicy];
    [(NSPServer *)self policiesUpdated:self->_configurationManager policy:v4 resolverInfoChanged:1];
    sub_10006C228((uint64_t)self);
  }
}

- (void)checkPrivacyProxyConnectivityOnInterface:(id)a3 proxyConnectivityCheckType:(unint64_t)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [v8 interfaceName];
  __int16 v11 = nplog_obj();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 138412546;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%@ received check proxy connectivity for interface %@", buf, 0x16u);
  }

  id v12 = 0;
  uint64_t v13 = 4;
  uint64_t v14 = 5;
  switch(a4)
  {
    case 1uLL:
      goto LABEL_15;
    case 2uLL:
      if (self) {
        privacyProxyAgentManager = self->_privacyProxyAgentManager;
      }
      else {
        privacyProxyAgentManager = 0;
      }
      id v18 = privacyProxyAgentManager;
      id v12 = [(NSPPrivacyProxyAgentManager *)v18 lastProxyOutageReason];

      uint64_t v14 = 3;
      if (!v10) {
        goto LABEL_24;
      }
      goto LABEL_16;
    case 3uLL:
      id v12 = 0;
      uint64_t v14 = 10;
      goto LABEL_15;
    case 4uLL:
    case 5uLL:
      goto LABEL_4;
    case 6uLL:
      id v12 = 0;
      uint64_t v14 = 12;
      if (!v10) {
        goto LABEL_24;
      }
      goto LABEL_16;
    default:
      uint64_t v13 = 0;
      uint64_t v14 = 0;
      id v12 = 0;
      if ((a4 & 0xFFFFFFFFFFFFFFFELL) == 4)
      {
LABEL_4:
        if (self) {
          odohManager = self->_odohManager;
        }
        else {
          odohManager = 0;
        }
        int v16 = odohManager;
        id v12 = sub_1000553D0(v16);

        uint64_t v14 = v13;
        if (!v10) {
          goto LABEL_24;
        }
      }
      else
      {
LABEL_15:
        if (!v10)
        {
LABEL_24:
          if (self) {
            configuration = self->_configuration;
          }
          else {
            configuration = 0;
          }
          id v22 = configuration;
          id v23 = [(NSPConfiguration *)v22 etag];

          *(void *)long long buf = 0;
          *(void *)&buf[8] = buf;
          *(void *)&uint8_t buf[16] = 0x3032000000;
          int v38 = sub_100005D9C;
          id v39 = sub_10005C1A4;
          id v40 = (id)os_transaction_create();
          objc_initWeak(&location, self);
          if (self) {
            configurationManager = self->_configurationManager;
          }
          else {
            configurationManager = 0;
          }
          id v25 = configurationManager;
          v27[0] = _NSConcreteStackBlock;
          v27[1] = 3221225472;
          v27[2] = sub_100072464;
          v27[3] = &unk_1001061D0;
          objc_copyWeak(v35, &location);
          id v28 = v10;
          id v26 = v23;
          v35[1] = (id)a4;
          id v29 = v26;
          v30 = self;
          id v31 = v8;
          id v32 = v12;
          id v33 = v9;
          v34 = buf;
          [(NSPConfigurationManager *)v25 refreshConfigurationWithReason:v14 completionHandler:v27];

          objc_destroyWeak(v35);
          objc_destroyWeak(&location);
          _Block_object_dispose(buf, 8);

          goto LABEL_29;
        }
      }
LABEL_16:
      if (!self)
      {
        if ([0 containsObject:v10]) {
          goto LABEL_18;
        }
        interfacesBeingChecked = 0;
        goto LABEL_23;
      }
      if (![(NSMutableSet *)self->_interfacesBeingChecked containsObject:v10])
      {
        interfacesBeingChecked = self->_interfacesBeingChecked;
LABEL_23:
        [(NSMutableSet *)interfacesBeingChecked addObject:v10];
        goto LABEL_24;
      }
LABEL_18:
      __int16 v19 = nplog_obj();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138412546;
        *(void *)&uint8_t buf[4] = self;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v10;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "%@ already checking connectivity for interface %@", buf, 0x16u);
      }

      if (v9) {
        (*((void (**)(id, void))v9 + 2))(v9, 0);
      }
LABEL_29:

      return;
  }
}

- (void)handleDNSAgentErrorReport:(id)a3 error:(int)a4
{
  if (self) {
    self = (NSPServer *)self->_privacyProxyAgentManager;
  }
  [(NSPServer *)self sendRTCReportWithFailureType:1002 errorCode:*(void *)&a4 url:a3 ingressProxy:0 egressProxy:0 tokenServer:0];
}

- (void)reportPrivacyProxySuccessOnInterface:(id)a3
{
  id v4 = a3;
  id v5 = [v4 interfaceName];
  int v6 = nplog_obj();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 138412546;
    SEL v51 = self;
    __int16 v52 = 2112;
    v53 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%@ reported proxy success on interface %@", buf, 0x16u);
  }

  if (v5)
  {
    if (self)
    {
      if (![(NSMutableSet *)self->_interfacesBeingChecked containsObject:v5]) {
        goto LABEL_8;
      }
      interfacesBeingChecked = self->_interfacesBeingChecked;
    }
    else
    {
      unsigned __int8 v41 = [0 containsObject:v5];
      interfacesBeingChecked = 0;
      if ((v41 & 1) == 0)
      {
        if ([v4 type] == (id)1 || objc_msgSend(v4, "type") == (id)2) {
          goto LABEL_60;
        }
        id v42 = v4;
LABEL_59:

        goto LABEL_60;
      }
    }
    [(NSMutableSet *)interfacesBeingChecked removeObject:v5];
  }
LABEL_8:
  if ([v4 type] == (id)1)
  {
    if (self)
    {
      long long v48 = 0u;
      long long v49 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      id v8 = [(NSPServiceStatusManager *)self->_serviceStatusManager serviceStatus];
      id v9 = [v8 networkStatuses];

      id v10 = [v9 countByEnumeratingWithState:&v46 objects:buf count:16];
      if (v10)
      {
        id v11 = v10;
        id v12 = v5;
        uint64_t v13 = 0;
        char v14 = 0;
        uint64_t v15 = *(void *)v47;
        do
        {
          for (i = 0; i != v11; i = (char *)i + 1)
          {
            if (*(void *)v47 != v15) {
              objc_enumerationMutation(v9);
            }
            int v17 = *(void **)(*((void *)&v46 + 1) + 8 * i);
            if ([v17 networkType] == 1)
            {
              if (![v17 networkStatus]) {
                goto LABEL_38;
              }
              if ([v17 networkStatus] == (id)2)
              {
                uint64_t v18 = [v17 networkName];

                char v14 = 1;
                uint64_t v13 = (void *)v18;
              }
            }
          }
          id v11 = [v9 countByEnumeratingWithState:&v46 objects:buf count:16];
        }
        while (v11);

        if (v14)
        {
          [(NSPServiceStatusManager *)self->_serviceStatusManager reportActiveOnWiFiName:v13];
          id v9 = +[NSPPrivacyProxyPolicyHandler sharedHandler];
          [v9 wifiDisabled:0];
LABEL_38:
          id v5 = v12;
LABEL_40:

LABEL_41:
          goto LABEL_60;
        }
        goto LABEL_61;
      }
      goto LABEL_39;
    }
    goto LABEL_60;
  }
  if ([v4 type] != (id)2)
  {
    id v27 = v4;
    if (self)
    {
      id v28 = v27;
      if ([v27 type] == (id)3)
      {
        v44 = v5;
        id v45 = v4;
        id v29 = [v28 interfaceName];
        uint64_t v43 = sub_10007A5BC(v29);
        long long v46 = 0u;
        long long v47 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        v30 = [(NSPServiceStatusManager *)self->_serviceStatusManager serviceStatus];
        id v31 = [v30 networkStatuses];

        id v32 = [v31 countByEnumeratingWithState:&v46 objects:buf count:16];
        if (v32)
        {
          id v33 = v32;
          char v34 = 0;
          uint64_t v35 = *(void *)v47;
          do
          {
            for (j = 0; j != v33; j = (char *)j + 1)
            {
              if (*(void *)v47 != v35) {
                objc_enumerationMutation(v31);
              }
              v37 = *(void **)(*((void *)&v46 + 1) + 8 * (void)j);
              if ([v37 networkType] == 3)
              {
                int v38 = [v37 networkName];
                unsigned int v39 = [v38 isEqualToString:v29];

                if (v39)
                {
                  if (![v37 networkStatus]) {
                    goto LABEL_57;
                  }
                  v34 |= [v37 networkStatus] == (id)2;
                }
              }
            }
            id v33 = [v31 countByEnumeratingWithState:&v46 objects:buf count:16];
          }
          while (v33);

          id v40 = (void *)v43;
          if (v34)
          {
            [(NSPServiceStatusManager *)self->_serviceStatusManager reportActiveOnInterfaceName:v29 displayName:v43 type:3];
            sub_10006EE40((uint64_t)self);
          }
        }
        else
        {
LABEL_57:

          id v40 = (void *)v43;
        }

        id v5 = v44;
        id v4 = v45;
      }
    }
    goto LABEL_59;
  }
  if (self)
  {
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    __int16 v19 = [(NSPServiceStatusManager *)self->_serviceStatusManager serviceStatus];
    id v9 = [v19 networkStatuses];

    id v20 = [v9 countByEnumeratingWithState:&v46 objects:buf count:16];
    if (v20)
    {
      id v21 = v20;
      id v12 = v5;
      uint64_t v13 = 0;
      char v22 = 0;
      uint64_t v23 = *(void *)v47;
      do
      {
        for (k = 0; k != v21; k = (char *)k + 1)
        {
          if (*(void *)v47 != v23) {
            objc_enumerationMutation(v9);
          }
          id v25 = *(void **)(*((void *)&v46 + 1) + 8 * (void)k);
          if ([v25 networkType] == 2)
          {
            if (![v25 networkStatus]) {
              goto LABEL_38;
            }
            if ([v25 networkStatus] == (id)2)
            {
              uint64_t v26 = [v25 networkName];

              char v22 = 1;
              uint64_t v13 = (void *)v26;
            }
          }
        }
        id v21 = [v9 countByEnumeratingWithState:&v46 objects:buf count:16];
      }
      while (v21);

      if (v22)
      {
        [(NSPServiceStatusManager *)self->_serviceStatusManager reportActiveOnCellularName:v13];
        id v9 = +[NSPPrivacyProxyPolicyHandler sharedHandler];
        [v9 cellularDisabled:0];
        goto LABEL_38;
      }
LABEL_61:
      id v5 = v12;
      goto LABEL_41;
    }
LABEL_39:
    uint64_t v13 = 0;
    goto LABEL_40;
  }
LABEL_60:
}

- (void)reportActivityForApp:(id)a3 path:(id)a4
{
  if (self) {
    self = (NSPServer *)self->_serviceStatusManager;
  }
  [(NSPServer *)self reportActivityForApp:a3 path:a4];
}

- (void)tokenFetchOutage
{
  if (!self || !self->_tokenOutage)
  {
    id v3 = nplog_obj();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Reporting token fetch outage", v5, 2u);
    }

    if (self)
    {
      self->_tokenOutage = 1;
      configurationManager = self->_configurationManager;
    }
    else
    {
      configurationManager = 0;
    }
    [(NSPServer *)self policiesUpdated:configurationManager policy:0 resolverInfoChanged:0];
    sub_10006C228((uint64_t)self);
  }
}

- (void)tokenFetchActive
{
  if (self && self->_tokenOutage)
  {
    id v3 = nplog_obj();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Reporting token fetch active", v5, 2u);
    }

    self->_tokenOutage = 0;
    id v4 = [(NSPConfigurationManager *)self->_configurationManager mergeProxyTrafficStateWithCurrentPolicy];
    [(NSPServer *)self policiesUpdated:self->_configurationManager policy:v4 resolverInfoChanged:1];
    sub_10006C228((uint64_t)self);
  }
}

- (void)proxyConnectivityOutage
{
}

- (void)proxyConnectivityNetworkOutage
{
}

- (void)proxyConnectivityActive
{
  if (self && (self->_proxyOutage || self->_proxyNetworkOutage))
  {
    id v3 = nplog_obj();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "restore proxy connectivity", v6, 2u);
    }

    proxyOutageRestoreTimer = self->_proxyOutageRestoreTimer;
    *(_WORD *)&self->_proxyOutage = 0;
    if (proxyOutageRestoreTimer)
    {
      dispatch_source_cancel(proxyOutageRestoreTimer);
      objc_storeStrong((id *)&self->_proxyOutageRestoreTimer, 0);
    }
    objc_storeStrong((id *)&self->_proxyOutageRestoreDate, 0);
    id v5 = [(NSPConfigurationManager *)self->_configurationManager mergeProxyTrafficStateWithCurrentPolicy];
    [(NSPServer *)self policiesUpdated:self->_configurationManager policy:v5 resolverInfoChanged:1];
    sub_10006AE90((uint64_t)self);
    [(NSPPrivacyProxyAgentManager *)self->_privacyProxyAgentManager resetProxyErrors];
    sub_10006C228((uint64_t)self);
  }
}

- (void)preferredProxyAgentRegistered:(id)a3 agentUUID:(id)a4 domainFilter:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (self) {
    configuration = self->_configuration;
  }
  else {
    configuration = 0;
  }
  id v12 = [(NSPConfiguration *)configuration preferredPathRoutingEnabledStatus];
  unsigned __int8 v13 = [v12 BOOLValue];

  char v14 = nplog_obj();
  BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
  if (v13)
  {
    if (v15)
    {
      int v16 = 138412546;
      id v17 = v8;
      __int16 v18 = 2112;
      id v19 = v9;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Adding policies for preferred agent %@ / %@", (uint8_t *)&v16, 0x16u);
    }

    char v14 = +[NSPPrivacyProxyPolicyHandler sharedHandler];
    [v14 addPreferredProxy:v8 agentUUID:v9 withDomainFilter:v10];
  }
  else if (v15)
  {
    int v16 = 138412546;
    id v17 = v8;
    __int16 v18 = 2112;
    id v19 = v9;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Skipping adding policies preferred agent %@ / %@, feature disabled", (uint8_t *)&v16, 0x16u);
  }
}

- (void)preferredProxyAgentUnregistered:(id)a3
{
  id v3 = a3;
  id v4 = nplog_obj();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Removing policies for preferred agent %@", (uint8_t *)&v6, 0xCu);
  }

  id v5 = +[NSPPrivacyProxyPolicyHandler sharedHandler];
  [v5 removePreferredProxy:v3 apply:1];
}

- (BOOL)networkDiscoveredProxyInTrustedProxyList:(id)a3
{
  id v4 = a3;
  id v5 = [v4 host];
  if (v5)
  {
    int v6 = [v4 port];

    if (v6)
    {
      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      if (self) {
        configuration = self->_configuration;
      }
      else {
        configuration = 0;
      }
      id v8 = [(NSPConfiguration *)configuration proxyConfiguration];
      id v9 = [v8 trustedNetworkDiscoveredProxies];

      id v10 = [v9 countByEnumeratingWithState:&v30 objects:v34 count:16];
      if (v10)
      {
        id v11 = v10;
        uint64_t v12 = *(void *)v31;
        CFStringRef v13 = @":";
        do
        {
          char v14 = 0;
          id v29 = v11;
          do
          {
            if (*(void *)v31 != v12) {
              objc_enumerationMutation(v9);
            }
            BOOL v15 = [*(id *)(*((void *)&v30 + 1) + 8 * (void)v14) componentsSeparatedByString:v13];
            if ((unint64_t)[v15 count] >= 2)
            {
              int v16 = [v15 objectAtIndex:0];
              objc_opt_class();
              char isKindOfClass = objc_opt_isKindOfClass();

              if (isKindOfClass)
              {
                __int16 v18 = [v15 objectAtIndex:0];
                id v19 = [v15 objectAtIndex:1];
                id v20 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v19 integerValue]);

                id v21 = [v4 host];
                if ([v21 isEqualToString:v18])
                {
                  [v4 port];
                  uint64_t v22 = v12;
                  CFStringRef v23 = v13;
                  v24 = v9;
                  v26 = id v25 = v4;

                  BOOL v27 = v26 == v20;
                  id v4 = v25;
                  id v9 = v24;
                  CFStringRef v13 = v23;
                  uint64_t v12 = v22;
                  id v11 = v29;
                  if (v27)
                  {

                    LOBYTE(v5) = 1;
                    goto LABEL_22;
                  }
                }
                else
                {
                }
              }
            }

            char v14 = (char *)v14 + 1;
          }
          while (v11 != v14);
          id v11 = [v9 countByEnumeratingWithState:&v30 objects:v34 count:16];
        }
        while (v11);
      }
      LOBYTE(v5) = 0;
LABEL_22:
    }
    else
    {
      LOBYTE(v5) = 0;
    }
  }

  return (char)v5;
}

- (BOOL)canIgnoreInvalidCertsOnInternalBuild
{
  id v2 = [objc_alloc((Class)NSPConfiguration) initFromPreferences];
  if (v2 && os_variant_allows_internal_security_policies()) {
    unsigned __int8 v3 = [v2 ignoreInvalidCerts];
  }
  else {
    unsigned __int8 v3 = 0;
  }

  return v3;
}

- (BOOL)usesDefaultConfigurationServer
{
  if (self) {
    configuration = self->_configuration;
  }
  else {
    configuration = 0;
  }
  id v4 = configuration;
  id v5 = [(NSPConfiguration *)v4 configServerHost];
  if ([v5 isEqualToString:@"mask-api.icloud.com"])
  {
    if (self) {
      configurationManager = self->_configurationManager;
    }
    else {
      configurationManager = 0;
    }
    unsigned int v7 = ![(NSPConfigurationManager *)configurationManager environmentUsesNonDefaultServer];
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (void)didUpdateSignificantLocation
{
  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x3032000000;
  v6[3] = sub_100005D9C;
  v6[4] = sub_10005C1A4;
  id v7 = (id)os_transaction_create();
  if (self) {
    configurationManager = self->_configurationManager;
  }
  else {
    configurationManager = 0;
  }
  id v4 = configurationManager;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100076F60;
  v5[3] = &unk_1001061A8;
  v5[4] = v6;
  [(NSPConfigurationManager *)v4 refreshConfigurationWithReason:7 completionHandler:v5];

  _Block_object_dispose(v6, 8);
}

- (void)didUpdateCountryPlusTimezone:(id)a3
{
  id v5 = a3;
  int v6 = nplog_obj();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v7 = 138412546;
    id v8 = self;
    __int16 v9 = 2112;
    id v10 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%@ country+timezone updated to [%@]", (uint8_t *)&v7, 0x16u);
  }

  if (self) {
    objc_storeStrong((id *)&self->_lastCountryPlusTimezone, a3);
  }
  sub_10006C228((uint64_t)self);
}

- (void)didUpdateGeohash:(id)a3
{
  id v5 = a3;
  int v6 = nplog_obj();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v7 = 138412546;
    id v8 = self;
    __int16 v9 = 2112;
    id v10 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%@ Geohash updated to [%@]", (uint8_t *)&v7, 0x16u);
  }

  if (self) {
    objc_storeStrong((id *)&self->_lastGeohash, a3);
  }
  sub_10006C228((uint64_t)self);
}

- (BOOL)isSubscriberUnlimited
{
  if (self) {
    self = (NSPServer *)self->_configurationManager;
  }
  return [(NSPServer *)self policyIncludesUnlimited];
}

- (void)requestAccessTokenWithCompletionHandler:(id)a3
{
}

- (void)networkSignatureChanged
{
  if (self)
  {
    sub_1000794BC((uint64_t)self);
    unsigned __int8 v3 = [(NSPConfiguration *)self->_configuration proxyConfiguration];
    id v4 = [v3 dnsProbe];

    if (v4)
    {
      id v5 = [(NWPathEvaluator *)self->_primaryPhysicalInterfaceEvaluator path];
      int v6 = [v5 interface];

      int v7 = [v6 cInterface];
      id v8 = [(NWPathEvaluator *)self->_primaryPhysicalInterfaceEvaluator path];
      id v9 = [v8 status];

      if (v9 == (id)1)
      {
        if (v7)
        {
          nw_endpoint_t host = nw_endpoint_create_host((const char *)[v4 UTF8String], "443");
          id v11 = nw_parameters_create();
          nw_parameters_require_interface(v11, v7);
          uint64_t v12 = (OS_nw_resolver *)nw_resolver_create_with_endpoint();
          dnsProbeResolver = self->_dnsProbeResolver;
          self->_dnsProbeResolver = v12;

          objc_initWeak(&location, self);
          char v14 = self->_dnsProbeResolver;
          BOOL v15 = NPGetInternalQueue();
          v16[0] = _NSConcreteStackBlock;
          v16[1] = 3221225472;
          v16[2] = sub_100079510;
          v16[3] = &unk_100106498;
          objc_copyWeak(v18, &location);
          id v17 = v7;
          nw_resolver_set_update_handler();

          objc_destroyWeak(v18);
          objc_destroyWeak(&location);
        }
      }
    }
    else
    {
      int v6 = nplog_obj();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v16[0]) = 0;
        _os_log_debug_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "No DNS probe configured, ignoring", (uint8_t *)v16, 2u);
      }
    }
  }
}

- (void)disableWiFiNetwork:(id)a3
{
  id v4 = a3;
  id v5 = nplog_obj();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v16 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Saving preference to disable on Wi-Fi network: %@", buf, 0xCu);
  }

  if (self) {
    wifiInterface = self->_wifiInterface;
  }
  else {
    wifiInterface = 0;
  }
  int v7 = [(CWFInterface *)wifiInterface currentKnownNetworkProfile];
  [v7 setPrivacyProxyEnabled:0];
  if (self) {
    id v8 = self->_wifiInterface;
  }
  else {
    id v8 = 0;
  }
  id v14 = 0;
  id v9 = v8;
  [(CWFInterface *)v9 updateKnownNetworkProfile:v7 properties:0 error:&v14];
  id v10 = v14;

  if (v10)
  {
    id v11 = nplog_obj();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412546;
      id v16 = v4;
      __int16 v17 = 2112;
      id v18 = v10;
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Failed to save preference to disable on Wi-Fi network %@: %@", buf, 0x16u);
    }
  }
  if (self) {
    serviceStatusManager = self->_serviceStatusManager;
  }
  else {
    serviceStatusManager = 0;
  }
  [(NSPServiceStatusManager *)serviceStatusManager reportDisabledOnWiFiName:v4];
  CFStringRef v13 = +[NSPPrivacyProxyPolicyHandler sharedHandler];
  [v13 wifiDisabled:1];
}

- (void)disableCellularNetwork:(id)a3
{
  id v4 = a3;
  id v5 = nplog_obj();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Saving preference to disable on cellular network: %@", buf, 0xCu);
  }

  if (!self || (cellularClient = self->_cellularClient) == 0)
  {
    id v7 = objc_alloc((Class)CoreTelephonyClient);
    id v8 = sub_10005C174(self);
    id v9 = [v7 initWithQueue:v8];
    id v10 = v9;
    if (self)
    {
      objc_storeStrong((id *)&self->_cellularClient, v9);

      cellularClient = self->_cellularClient;
    }
    else
    {

      cellularClient = 0;
    }
  }
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10007A3CC;
  v12[3] = &unk_100106560;
  v12[4] = self;
  id v13 = v4;
  id v11 = v4;
  [(CoreTelephonyClient *)cellularClient getCurrentDataSubscriptionContext:v12];
}

- (void)disableInterface:(id)a3 displayName:(id)a4 type:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = (__CFError *)a3;
  id v9 = a4;
  id v10 = nplog_obj();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    CFErrorRef v46 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Saving preference to disable on interface %@", buf, 0xCu);
  }

  id v11 = v8;
  uint64_t v12 = v11;
  if (!self)
  {

    serviceStatusManager = 0;
    goto LABEL_32;
  }
  SCPreferencesRef v13 = SCPreferencesCreateWithAuthorization(kCFAllocatorDefault, @"networkserviceproxy", 0, kSCPreferencesUseEntitlementAuthorization);
  if (!v13)
  {
    BOOL v27 = nplog_obj();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      id v37 = v9;
      CFErrorRef Error = SCCopyLastError();
      *(_DWORD *)long long buf = 138412290;
      CFErrorRef v46 = Error;
      _os_log_error_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "Failed to create SCPreferences: %@", buf, 0xCu);

      id v9 = v37;
    }

    goto LABEL_31;
  }
  id v14 = v13;
  id v15 = v12;
  id v16 = SCNetworkSetCopyCurrent(v14);
  if (!v16)
  {
    id v28 = nplog_obj();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      id v39 = v9;
      CFErrorRef v40 = SCCopyLastError();
      *(_DWORD *)long long buf = 138412290;
      CFErrorRef v46 = v40;
      _os_log_error_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "Failed to get current set: %@", buf, 0xCu);

      id v9 = v39;
    }

    goto LABEL_26;
  }
  __int16 v17 = v16;
  CFArrayRef v18 = SCNetworkSetCopyServices(v16);
  if (!v18)
  {
    id v29 = nplog_obj();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      id v41 = v9;
      CFErrorRef v42 = SCCopyLastError();
      *(_DWORD *)long long buf = 138412290;
      CFErrorRef v46 = v42;
      _os_log_error_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "Failed to copy services: %@", buf, 0xCu);

      id v9 = v41;
    }

    CFRelease(v17);
LABEL_26:

    goto LABEL_27;
  }
  CFArrayRef v19 = v18;
  unsigned int v44 = v5;
  CFIndex Count = CFArrayGetCount(v18);
  if (Count < 1)
  {
    id v25 = 0;
    goto LABEL_34;
  }
  CFIndex v21 = Count;
  id v43 = v9;
  CFIndex v22 = 0;
  while (1)
  {
    ValueAtIndex = (const __SCNetworkService *)CFArrayGetValueAtIndex(v19, v22);
    if (!SCNetworkServiceGetEnabled(ValueAtIndex)) {
      goto LABEL_14;
    }
    Interface = SCNetworkServiceGetInterface(ValueAtIndex);
    if (!Interface) {
      goto LABEL_14;
    }
    id v25 = Interface;
    uint64_t v26 = SCNetworkInterfaceGetBSDName(Interface);
    if (v26)
    {
      if ([(__CFError *)v15 isEqualToString:v26]) {
        break;
      }
    }

LABEL_14:
    if (v21 == ++v22)
    {
      id v25 = 0;
      goto LABEL_16;
    }
  }
  CFRetain(v25);

LABEL_16:
  id v9 = v43;
LABEL_34:
  CFRelease(v17);
  CFRelease(v19);

  uint64_t v5 = v44;
  if (!v25)
  {
LABEL_27:
    long long v30 = nplog_obj();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "Failed to get interface from preferences", buf, 2u);
    }
    goto LABEL_29;
  }
  if (SCNetworkInterfaceSetDisablePrivateRelay())
  {
    CFRelease(v25);
    if (SCPreferencesCommitChanges(v14))
    {
      if (!SCPreferencesApplyChanges(v14))
      {
        long long v30 = nplog_obj();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          id v33 = v9;
          CFErrorRef v34 = SCCopyLastError();
          *(_DWORD *)long long buf = 138412290;
          CFErrorRef v46 = v34;
          uint64_t v35 = "Failed to apply SCPreferences: %@";
          goto LABEL_45;
        }
        goto LABEL_29;
      }
    }
    else
    {
      long long v30 = nplog_obj();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        id v33 = v9;
        CFErrorRef v34 = SCCopyLastError();
        *(_DWORD *)long long buf = 138412290;
        CFErrorRef v46 = v34;
        uint64_t v35 = "Failed to commit SCPreferences: %@";
LABEL_45:
        _os_log_error_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, v35, buf, 0xCu);

        id v9 = v33;
      }
LABEL_29:
    }
  }
  else
  {
    v36 = nplog_obj();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138543362;
      CFErrorRef v46 = v15;
      _os_log_error_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "Failed to disable private relay on %{public}@", buf, 0xCu);
    }

    CFRelease(v25);
  }
  CFRelease(v14);
LABEL_31:

  serviceStatusManager = self->_serviceStatusManager;
LABEL_32:
  -[NSPServiceStatusManager reportDisabledOnInterfaceName:displayName:type:](serviceStatusManager, "reportDisabledOnInterfaceName:displayName:type:", v12, v9, v5, v43);

  long long v32 = +[NSPPrivacyProxyPolicyHandler sharedHandler];
  [v32 interface:v12 disabled:1];
}

- (id)getSavedPrivateCloudComputeEnvironment
{
  if (self) {
    self = (NSPServer *)self->_privateCloudComputeEnvironment;
  }
  return self;
}

- (void)updateSavedPrivateCloudComputeEnvironment:(id)a3
{
  id v5 = a3;
  if (self) {
    privateCloudComputeEnvironment = self->_privateCloudComputeEnvironment;
  }
  else {
    privateCloudComputeEnvironment = 0;
  }
  id v7 = privateCloudComputeEnvironment;
  unint64_t v10 = (unint64_t)v5;
  unint64_t v8 = v7;
  id v9 = (void *)v8;
  if (!(v10 | v8) || v10 && v8 && [(id)v10 isEqual:v8])
  {
  }
  else
  {

    if (self) {
      objc_storeStrong((id *)&self->_privateCloudComputeEnvironment, a3);
    }
    sub_10006C228((uint64_t)self);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dnsProxy, 0);
  objc_storeStrong((id *)&self->_privateCloudComputeEnvironment, 0);
  objc_storeStrong((id *)&self->_lastCountryPlusTimezone, 0);
  objc_storeStrong((id *)&self->_lastGeohash, 0);
  objc_storeStrong((id *)&self->_toggleStatsTimer, 0);
  objc_storeStrong((id *)&self->_toggleStats, 0);
  objc_storeStrong((id *)&self->_linkQualityMonitoringSource, 0);
  objc_storeStrong((id *)&self->_lastConfigOutageReasonStats, 0);
  objc_storeStrong((id *)&self->_lastCaptiveOutageReasonStats, 0);
  objc_storeStrong((id *)&self->_captiveEvaluationRetryTimer, 0);
  objc_storeStrong((id *)&self->_serverFlowDivert, 0);
  objc_storeStrong((id *)&self->_tokenFetchListener, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_termSource, 0);
  objc_storeStrong((id *)&self->_odohAuthOutageRestoreDate, 0);
  objc_storeStrong((id *)&self->_trialNotificationToken, 0);
  objc_storeStrong((id *)&self->_trialClient, 0);
  objc_storeStrong((id *)&self->_odohOutageRestoreDate, 0);
  objc_storeStrong((id *)&self->_proxyOutageRestoreDate, 0);
  objc_storeStrong((id *)&self->_odohManager, 0);
  objc_storeStrong((id *)&self->_odohAuthOutageRestoreTimer, 0);
  objc_storeStrong((id *)&self->_odohOutageRestoreTimer, 0);
  objc_storeStrong((id *)&self->_proxyOutageRestoreTimer, 0);
  objc_storeStrong((id *)&self->_subscriptionCheckRetryDate, 0);
  objc_storeStrong((id *)&self->_subscriptionCheckRetryTimer, 0);
  objc_storeStrong((id *)&self->_featureChangeToken, 0);
  objc_storeStrong((id *)&self->_cellularClient, 0);
  objc_storeStrong((id *)&self->_wifiInterface, 0);
  objc_storeStrong((id *)&self->_dnsProbeResolver, 0);
  objc_storeStrong((id *)&self->_primaryPhysicalInterfaceEvaluator, 0);
  objc_storeStrong((id *)&self->_captiveEvaluatedSSID, 0);
  objc_storeStrong((id *)&self->_primaryInterface, 0);
  objc_storeStrong((id *)&self->_interfacesBeingChecked, 0);
  objc_storeStrong((id *)&self->_serviceStatusManager, 0);
  objc_storeStrong((id *)&self->_privacyProxyAgentManager, 0);
  objc_storeStrong((id *)&self->_configurationManager, 0);
  objc_storeStrong((id *)&self->_currentCaptiveNetworkPlugins, 0);

  objc_storeStrong((id *)&self->_configuration, 0);
}

@end