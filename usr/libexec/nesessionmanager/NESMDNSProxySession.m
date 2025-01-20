@interface NESMDNSProxySession
- (BOOL)handleUpdateConfiguration:(id)a3;
- (BOOL)waitForPerApp;
- (NESMDNSProxySession)initWithConfiguration:(id)a3 andServer:(id)a4 andProtocol:(id)a5 andPluginType:(id)a6;
- (id)authenticationPluginBundleIdentifier;
- (id)providerBundleIdentifier;
- (id)providerDesignatedRequirement;
- (int64_t)agentPluginClass;
- (void)createConnectParametersWithStartMessage:(id)a3;
- (void)handleCaptiveNetworkPluginsChanged;
- (void)handleChangeEventForRankedInterfaces;
- (void)handleInstalledAppsChanged;
- (void)handleNetworkConfigurationChange:(int64_t)a3;
- (void)handleNetworkDetectionNotification:(int)a3;
- (void)handleStartMessage:(id)a3;
- (void)handleStopMessageWithReason:(int)a3;
- (void)handleUserLogin;
- (void)install;
- (void)plugin:(id)a3 didStartWithPID:(int)a4 error:(id)a5;
- (void)prepareNetwork;
- (void)resetProviderDesignatedRequirementInConfiguration:(id)a3;
- (void)setProviderDesignatedRequirement:(id)a3;
- (void)setStatus:(int)a3;
- (void)uninstall;
@end

@implementation NESMDNSProxySession

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processToFilter, 0);

  objc_storeStrong((id *)&self->_restartTimer, 0);
}

- (void)handleUserLogin
{
  sub_10002C604(self, a2);

  [(NESMSession *)self startWithCommand:0 isOnDemand:0];
}

- (void)plugin:(id)a3 didStartWithPID:(int)a4 error:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NESMDNSProxySession;
  [(NESMVPNSession *)&v11 plugin:v8 didStartWithPID:v6 error:a5];
  if ((int)v6 >= 1)
  {
    id v9 = [(NESMVPNSession *)self primaryTunnelPlugin];

    if (v9 == v8)
    {
      uint64_t v10 = mach_absolute_time();
      if (self)
      {
        self->_pluginStartTicks = v10;
        sub_10002CA40(self);
      }
    }
  }
}

- (void)uninstall
{
  v5.receiver = self;
  v5.super_class = (Class)NESMDNSProxySession;
  [(NESMFlowDivertSession *)&v5 uninstall];
  if (self)
  {
    if (self->_externallyStopped)
    {
      v3 = [(NESMSession *)self policySession];
      sub_10002E854((uint64_t)v3);

      v4 = [(NESMSession *)self policySession];
      sub_1000319BC((uint64_t)v4);
    }
    self->_installed = 0;
  }
}

- (void)install
{
  v3 = [(NESMSession *)self policySession];
  sub_1000318B0((uint64_t)v3);

  id v5 = sub_10002C604(self, v4);
  if ((v5 & 1) == 0)
  {
    uint64_t v6 = ne_log_obj();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138412290;
      id v9 = self;
      _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%@: failed to set the DNSProxy policies", (uint8_t *)&v8, 0xCu);
    }
  }
  v7 = [(NESMVPNSession *)self stateHandler];
  [v7 handleSetConfigurationResult:v5];

  if (self) {
    self->_installed = 1;
  }
}

- (BOOL)waitForPerApp
{
  v3 = [(NESMSession *)self configuration];
  uint64_t v4 = [v3 externalIdentifier];
  if (!v4) {
    goto LABEL_9;
  }
  id v5 = (void *)v4;
  uint64_t v6 = [(NESMSession *)self configuration];
  v7 = [v6 dnsProxy];
  if (![v7 isEnabled])
  {

LABEL_9:
    return 1;
  }
  int v8 = [(NESMSession *)self configuration];
  id v9 = [v8 dnsProxy];
  uint64_t v10 = [v9 perApp];

  if (v10)
  {
    objc_super v11 = [(NESMSession *)self configuration];
    v12 = [v11 dnsProxy];
    v13 = [v12 perApp];
    v14 = [(NESMSession *)self uid];
    [v13 updateAppRulesForUID:[v14 unsignedIntValue]];

    v15 = [(NESMSession *)self configuration];
    v16 = [v15 dnsProxy];
    v17 = [v16 perApp];
    v18 = [v17 appRules];
    id v19 = [v18 count];

    if (v19)
    {
      v20 = [(NESMSession *)self policySession];
      v21 = [(NESMSession *)self configuration];
      v22 = [v21 dnsProxy];
      v23 = [v22 perApp];
      v24 = [v23 appRules];
      v25 = [(NESMSession *)self uid];
      [v25 intValue];
      sub_10003E240((uint64_t)v20, v24);
    }
    v26 = [(NESMSession *)self configuration];
    v27 = [v26 dnsProxy];
    v28 = [v27 perApp];
    id v29 = [v28 copyCachedMachOUUIDs];

    if (v29) {
      return 0;
    }
  }
  return 1;
}

- (void)prepareNetwork
{
  id v2 = [(NESMVPNSession *)self stateHandler];
  [v2 handleNetworkPrepareResult:&stru_1000C7428];
}

- (void)handleStopMessageWithReason:(int)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NESMDNSProxySession;
  [(NESMVPNSession *)&v4 handleStopMessageWithReason:*(void *)&a3];
  sub_10002D128((uint64_t)self, 0);
  if (self)
  {
    self->_externallyStopped = 1;
    self->_restartIntervalSecs = 1;
  }
}

- (void)handleStartMessage:(id)a3
{
  id v5 = a3;
  if (self) {
    objc_setProperty_atomic(self, v4, 0, 728);
  }
  uint64_t v6 = xpc_dictionary_get_value(v5, "SessionOptions");
  v7 = v6;
  if (!v6 || xpc_get_type(v6) != (xpc_type_t)&_xpc_type_dictionary || !xpc_dictionary_get_BOOL(v7, "test-agent")) {
    goto LABEL_26;
  }
  int v8 = xpc_dictionary_get_remote_connection(v5);
  if (!v8)
  {
LABEL_10:
    objc_super v11 = ne_log_obj();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
LABEL_11:

      v12 = [(NESMVPNSession *)self stateHandler];
      [v12 handleStartMessage:v5];

      goto LABEL_28;
    }
    *(_DWORD *)buf = 136315138;
    v33 = "com.apple.private.networkextension.test-control";
    v27 = "Test provider does not have the %s entitlement";
    v28 = v11;
    uint32_t v29 = 12;
LABEL_20:
    _os_log_error_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, v27, buf, v29);
    goto LABEL_11;
  }
  id v9 = (void *)xpc_connection_copy_entitlement_value();
  uint64_t v10 = v9;
  if (!v9 || xpc_get_type(v9) != (xpc_type_t)&_xpc_type_BOOL)
  {

    goto LABEL_10;
  }
  BOOL value = xpc_BOOL_get_value(v10);

  if (!value) {
    goto LABEL_10;
  }
  id v14 = [objc_alloc((Class)NEProcessIdentity) initFromXPCConnection:v8];
  v16 = v14;
  if (!self)
  {

    goto LABEL_30;
  }
  objc_setProperty_atomic(self, v15, v14, 728);

  if (!objc_getProperty(self, v17, 728, 1))
  {
LABEL_30:
    objc_super v11 = ne_log_obj();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      goto LABEL_11;
    }
    *(_WORD *)buf = 0;
    v27 = "Failed to create a process identity from the session connection";
    v28 = v11;
    uint32_t v29 = 2;
    goto LABEL_20;
  }
  v18 = xpc_dictionary_get_value(v7, "listener-endpoint");
  id v19 = v18;
  if (v18 && xpc_get_type(v18) == (xpc_type_t)&_xpc_type_endpoint)
  {
    v20 = [NETestAgent alloc];
    v21 = [(NESMSession *)self configuration];
    v22 = [v21 pluginType];
    v23 = sub_100068368((id *)&v20->super.super.isa, v22, 3, v5);

    if (v23)
    {
      v24 = [NEDNSProxyPlugin alloc];
      v25 = [(NESMSession *)self queue];
      v26 = [(NEVPNTunnelPlugin *)v24 initWithAgent:v23 delegateQueue:v25 andDelegate:self];
      [(NESMVPNSession *)self setPrimaryTunnelPlugin:v26];
    }
    else
    {
      v30 = ne_log_obj();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "Failed to create a test agent", buf, 2u);
      }
    }
  }

LABEL_26:
  v31.receiver = self;
  v31.super_class = (Class)NESMDNSProxySession;
  [(NESMVPNSession *)&v31 handleStartMessage:v5];
  sub_10002D128((uint64_t)self, 0);
  if (self) {
    self->_externallyStopped = 0;
  }
LABEL_28:
}

- (void)setStatus:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  unsigned int v5 = [(NESMSession *)self status];
  v19.receiver = self;
  v19.super_class = (Class)NESMDNSProxySession;
  [(NESMVPNSession *)&v19 setStatus:v3];
  if ([(NESMSession *)self status] == 1
    && v5 != 1
    && (!self || !self->_externallyStopped)
    && [(NESMSession *)self lastStopReason] != 3
    && [(NESMSession *)self lastStopReason] != 6
    && (id)[(NESMVPNSession *)self state] != (id)9)
  {
    if (qword_1000D7BF8 != -1) {
      dispatch_once(&qword_1000D7BF8, &stru_1000C5A60);
    }
    uint64_t v6 = mach_absolute_time();
    if (self && (v6 - self->_pluginStartTicks) / qword_1000D7790 >= 0x3C) {
      self->_unint64_t restartIntervalSecs = 1;
    }
    v7 = ne_log_obj();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      [(NESMSession *)self lastStopReason];
      uint64_t v8 = ne_session_stop_reason_to_string();
      if (self) {
        unint64_t restartIntervalSecs = self->_restartIntervalSecs;
      }
      else {
        unint64_t restartIntervalSecs = 0;
      }
      *(_DWORD *)buf = 138412802;
      v21 = self;
      __int16 v22 = 2080;
      uint64_t v23 = v8;
      __int16 v24 = 2048;
      unint64_t v25 = restartIntervalSecs;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@: unexpected disconnect (%s), restarting in ~%lu seconds", buf, 0x20u);
    }

    sub_10002D128((uint64_t)self, 0);
    if (self) {
      int64_t v10 = 1000000000 * self->_restartIntervalSecs;
    }
    else {
      int64_t v10 = 0;
    }
    dispatch_time_t v11 = dispatch_time(0, v10);
    v12 = [(NESMSession *)self queue];
    v13 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v12);

    if (self) {
      uint64_t v14 = 100000000 * self->_restartIntervalSecs;
    }
    else {
      uint64_t v14 = 0;
    }
    dispatch_source_set_timer(v13, v11, 0xFFFFFFFFFFFFFFFFLL, v14);
    objc_initWeak((id *)buf, self);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10002D8AC;
    handler[3] = &unk_1000C5A88;
    objc_copyWeak(&v18, (id *)buf);
    dispatch_source_set_event_handler(v13, handler);
    dispatch_activate(v13);
    sub_10002D128((uint64_t)self, v13);
    if (self)
    {
      unint64_t v15 = self->_restartIntervalSecs;
      if (v15 != 60)
      {
        unint64_t v16 = 3 * v15;
        self->_unint64_t restartIntervalSecs = v16;
        if (v16 >= 0x3D) {
          self->_unint64_t restartIntervalSecs = 60;
        }
      }
    }
    objc_destroyWeak(&v18);
    objc_destroyWeak((id *)buf);
  }
}

- (void)handleNetworkDetectionNotification:(int)a3
{
  if (a3 <= 5 && ((1 << a3) & 0x26) != 0)
  {
    unsigned int v5 = ne_log_obj();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = inputNotification2String();
      v7 = [(NESMSession *)self configuration];
      uint64_t v8 = [v7 name];
      *(_DWORD *)buf = 138412802;
      v12 = self;
      __int16 v13 = 2080;
      uint64_t v14 = v6;
      __int16 v15 = 2112;
      unint64_t v16 = v8;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@: received a %s notification <%@>", buf, 0x20u);
    }
    if ((a3 - 1) <= 1)
    {
      id v9 = [(NESMSession *)self queue];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10002DB60;
      block[3] = &unk_1000C6C60;
      block[4] = self;
      dispatch_async(v9, block);
    }
    [(NESMSession *)self restartSession];
  }
}

- (void)handleChangeEventForRankedInterfaces
{
}

- (void)handleCaptiveNetworkPluginsChanged
{
  uint64_t v3 = ne_log_obj();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v4 = [(NESMSession *)self configuration];
    unsigned int v5 = [v4 name];
    int v6 = 138412546;
    v7 = self;
    __int16 v8 = 2112;
    id v9 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%@: Handling installed captive plugins change (%@>", (uint8_t *)&v6, 0x16u);
  }
  [(NESMDNSProxySession *)self handleNetworkDetectionNotification:2];
}

- (void)handleInstalledAppsChanged
{
  uint64_t v3 = ne_log_obj();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v4 = [(NESMSession *)self configuration];
    unsigned int v5 = [v4 name];
    int v6 = 138412546;
    v7 = self;
    __int16 v8 = 2112;
    id v9 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%@: Handling installed apps change <%@>", (uint8_t *)&v6, 0x16u);
  }
  [(NESMDNSProxySession *)self handleNetworkDetectionNotification:2];
}

- (BOOL)handleUpdateConfiguration:(id)a3
{
  id v4 = a3;
  unsigned int v5 = v4;
  if (v4)
  {
    int v6 = [v4 dnsProxy];
    if ([v6 isEnabled])
    {
      v7 = [(NESMSession *)self configuration];
      __int16 v8 = [v7 dnsProxy];
      id v9 = [v8 perApp];
      int64_t v10 = [v9 appRules];
      dispatch_time_t v11 = [v5 dnsProxy];
      v12 = [v11 perApp];
      __int16 v13 = [v12 appRules];
      BOOL v14 = v10 != v13;
    }
    else
    {
      BOOL v14 = 0;
    }
  }
  else
  {
    BOOL v14 = 0;
  }
  v21.receiver = self;
  v21.super_class = (Class)NESMDNSProxySession;
  BOOL v15 = [(NESMFlowDivertSession *)&v21 handleUpdateConfiguration:v5];
  if (v15 && v14)
  {
    SEL v17 = ne_log_obj();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      id v18 = [(NESMSession *)self configuration];
      objc_super v19 = [v18 name];
      *(_DWORD *)buf = 138412546;
      uint64_t v23 = self;
      __int16 v24 = 2112;
      unint64_t v25 = v19;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%@: Handling Update Configuration - updating policies <%@>", buf, 0x16u);
    }
    [(NESMDNSProxySession *)self handleNetworkDetectionNotification:1];
  }

  return v15;
}

- (void)handleNetworkConfigurationChange:(int64_t)a3
{
  char v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)NESMDNSProxySession;
  -[NESMVPNSession handleNetworkConfigurationChange:](&v7, "handleNetworkConfigurationChange:");
  if ((v3 & 2) != 0)
  {
    unsigned int v5 = [(NESMSession *)self queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10002E180;
    block[3] = &unk_1000C6C60;
    block[4] = self;
    dispatch_async(v5, block);
  }
}

- (void)createConnectParametersWithStartMessage:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)NESMDNSProxySession;
  [(NESMVPNSession *)&v10 createConnectParametersWithStartMessage:a3];
  id v4 = [(NESMSession *)self configuration];
  unsigned int v5 = [v4 dnsProxy];
  int v6 = [v5 protocol];

  objc_super v7 = [v6 providerConfiguration];

  if (v7)
  {
    __int16 v8 = [v6 providerConfiguration];
    id v9 = [(NESMVPNSession *)self connectParameters];
    [v9 setObject:v8 forKeyedSubscript:@"VendorData"];
  }
}

- (void)resetProviderDesignatedRequirementInConfiguration:(id)a3
{
  id v4 = [a3 dnsProxy];
  id v6 = [v4 protocol];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unsigned int v5 = [(NESMDNSProxySession *)self providerDesignatedRequirement];
    [v6 setDesignatedRequirement:v5];
  }
}

- (void)setProviderDesignatedRequirement:(id)a3
{
  id v4 = a3;
  id v5 = [(NESMVPNSession *)self protocol];
  [v5 setDesignatedRequirement:v4];
}

- (id)providerDesignatedRequirement
{
  id v2 = [(NESMVPNSession *)self protocol];
  char v3 = [v2 designatedRequirement];

  return v3;
}

- (id)authenticationPluginBundleIdentifier
{
  return 0;
}

- (id)providerBundleIdentifier
{
  id v2 = [(NESMVPNSession *)self protocol];
  char v3 = [v2 providerBundleIdentifier];

  return v3;
}

- (int64_t)agentPluginClass
{
  return 3;
}

- (NESMDNSProxySession)initWithConfiguration:(id)a3 andServer:(id)a4 andProtocol:(id)a5 andPluginType:(id)a6
{
  v7.receiver = self;
  v7.super_class = (Class)NESMDNSProxySession;
  result = [(NESMVPNSession *)&v7 initWithConfiguration:a3 andServer:a4 andProtocol:a5 andPluginType:a6 andSessionType:6];
  if (result) {
    result->_unint64_t restartIntervalSecs = 1;
  }
  return result;
}

@end