@interface NESMIKEv2VPNSession
- (BOOL)initializePlugins;
- (BOOL)prepareConfigurationForStart;
- (NESMIKEv2VPNSession)initWithConfiguration:(id)a3 andServer:(id)a4 andProtocol:(id)a5 andPluginType:(id)a6 andSessionType:(int)a7;
- (int)getVirtualInterfaceMTU:(id)a3;
- (void)checkPluginInstalledWithCompletionHandler:(id)a3;
- (void)createConnectParametersWithStartMessage:(id)a3;
- (void)setStatus:(int)a3;
@end

@implementation NESMIKEv2VPNSession

- (int)getVirtualInterfaceMTU:(id)a3
{
  id v4 = a3;
  v5 = [(NESMVPNSession *)self protocol];
  if ((unint64_t)[v5 mtu] >= 0x3E8 && (unint64_t)objc_msgSend(v5, "mtu") < 0x5DD)
  {
    int v8 = [v5 mtu];
  }
  else
  {
    v6 = ne_log_obj();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v10 = 134217984;
      id v11 = [v5 mtu];
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "requested mtu size out of range %lu", (uint8_t *)&v10, 0xCu);
    }

    v7 = [v4 MTU];
    int v8 = [v7 intValue];
  }
  return v8;
}

- (void)setStatus:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  unsigned int v5 = [(NESMSession *)self status];
  v36.receiver = self;
  v36.super_class = (Class)NESMIKEv2VPNSession;
  [(NESMVPNSession *)&v36 setStatus:v3];
  if (self && v3 == 3) {
    self->_sessionDidConnect = 1;
  }
  if (![(NESMSession *)self isOnDemand]
    && (id)[(NESMVPNSession *)self tunnelKind] == (id)1
    && [(NESMVPNSession *)self sessionType] != 3)
  {
    v6 = [(NESMSession *)self configuration];
    v7 = [v6 applicationIdentifier];
    if (v7)
    {
    }
    else
    {
      if (self) {
        BOOL v25 = !self->_sessionDidConnect;
      }
      else {
        BOOL v25 = 1;
      }

      if (v3 == 1 && v25 && v5 != 1)
      {
        v26 = [(NESMSession *)self lastDisconnectError];
        v27 = [v26 userInfo];
        v28 = [v27 objectForKeyedSubscript:@"LocalizedHeader"];

        v29 = [(NESMSession *)self lastDisconnectError];
        v30 = [v29 userInfo];
        v31 = [v30 objectForKeyedSubscript:NSLocalizedDescriptionKey];

        if (v28 && v31)
        {
          v32 = [(NESMVPNSession *)self notification];
          [v32 cancel];

          id v33 = objc_alloc((Class)NEUserNotification);
          v34 = [(NESMSession *)self queue];
          id v35 = [v33 initAndShowAlertWithHeader:v28 message:v31 alternateMessage:0 defaultMessage:0 noBoldDefault:0 usePrivacyIcon:0 extensionItem:0 callbackQueue:v34 callbackHandler:&stru_1000C64B8];
          [(NESMVPNSession *)self setNotification:v35];
        }
        if (self) {
          goto LABEL_12;
        }
        return;
      }
    }
  }
  if (v3 == 5)
  {
    if (self)
    {
      if (qword_1000D7C40 != -1) {
        dispatch_once(&qword_1000D7C40, &stru_1000C64D8);
      }
      if ([(NESMSession *)self connectTime])
      {
        unint64_t v8 = (unint64_t)(*(double *)&qword_1000D7C48 * (double)mach_absolute_time());
        unint64_t v9 = [(NESMSession *)self connectTime];
        unint64_t v10 = v8 - v9;
        if (v8 != v9)
        {
          id v11 = [(NESMVPNSession *)self copyStatistics];
          v12 = v11;
          if (v11)
          {
            v13 = [v11 objectForKeyedSubscript:@"VPN"];
            v14 = v13;
            if (v13)
            {
              v15 = [v13 objectForKeyedSubscript:@"BytesIn"];
              id v16 = [v15 unsignedLongLongValue];

              v17 = [v14 objectForKeyedSubscript:@"BytesOut"];
              id v18 = [v17 unsignedLongLongValue];

              int64_t v19 = [(NESMVPNSession *)self tunnelKind];
              v20 = @"Fallback Tunnel";
              if (v19 == 1) {
                v20 = @"Primary Tunnel";
              }
              v21 = v20;
              unsigned __int8 v22 = [(NESMSession *)self isOnDemand];
              unsigned __int8 v23 = sub_10007C09C(self);
              v37 = _NSConcreteStackBlock;
              uint64_t v38 = 3221225472;
              v39 = sub_1000718FC;
              v40 = &unk_1000C6500;
              unsigned __int8 v45 = v23;
              unsigned __int8 v46 = v22;
              v41 = v21;
              unint64_t v42 = v10;
              id v43 = v16;
              id v44 = v18;
              v24 = v21;
              AnalyticsSendEventLazy();
            }
          }
        }
      }
    }
  }
  else if (v3 == 1 && self)
  {
LABEL_12:
    self->_sessionDidConnect = 0;
  }
}

- (BOOL)prepareConfigurationForStart
{
  if ((id)[(NESMVPNSession *)self parentType] != (id)1) {
    return 1;
  }
  uint64_t v3 = [(NESMVPNSession *)self parent];
  id v4 = [(NESMVPNSession *)self interfaceName];
  unsigned int v5 = sub_100008E68((uint64_t)v3, v4);
  v6 = [(NESMSession *)self configuration];
  v7 = [v6 alwaysOnVPN];
  [v7 setActiveInterfaceProtocolKey:v5];

  unint64_t v8 = ne_log_obj();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v14 = [(NESMSession *)self configuration];
    v15 = [v14 alwaysOnVPN];
    id v16 = [v15 activeInterfaceProtocolKey];
    int v17 = 138412546;
    id v18 = self;
    __int16 v19 = 2112;
    v20 = v16;
    _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%@: prepareConfigurationForStart: activeInterfaceProtocolKey %@", (uint8_t *)&v17, 0x16u);
  }
  unint64_t v9 = [(NESMSession *)self configuration];
  unint64_t v10 = [v9 alwaysOnVPN];
  id v11 = [v10 activeInterfaceProtocolKey];
  BOOL v12 = v11 != 0;

  return v12;
}

- (void)createConnectParametersWithStartMessage:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(NESMVPNSession *)self protocol];
  if ([(NESMVPNSession *)self sessionType] == 3)
  {
    if (![v5 natKeepAliveOffloadEnable]) {
      [v5 setNatKeepAliveOffloadEnable:2];
    }
    buf[0] = 0;
    char v29 = 0;
    id v6 = [(NESMVPNSession *)self interfaceName];
    [v6 UTF8String];
    NEGetInterfaceType();

    if (![v5 natKeepAliveOffloadInterval]
      || [v5 natKeepAliveOffloadInterval] == 110)
    {
      uint64_t v7 = [(NESMVPNSession *)self parent];
      unint64_t v8 = (void *)v7;
      if (v7) {
        unsigned int v9 = *(_DWORD *)(v7 + 356);
      }
      else {
        unsigned int v9 = 0;
      }
      if (v9 <= 0x6E) {
        uint64_t v10 = 110;
      }
      else {
        uint64_t v10 = v9;
      }
      [v5 setNatKeepAliveOffloadInterval:v10];
    }
    [v5 setDisableMOBIKERetryOnWake:1];
  }
  if ((id)[(NESMVPNSession *)self parentType] == (id)2)
  {
    id v11 = [(NESMVPNSession *)self parent];
    BOOL v12 = self;
    v14 = v12;
    if (v11)
    {
      if (v12)
      {
        v15 = [objc_getProperty(v11, v13, 360, 1) objectAtIndexedSubscript:0];
        int v17 = v15;
        if (v15) {
          Property = (NESMIKEv2VPNSession *)objc_getProperty(v15, v16, 24, 1);
        }
        else {
          Property = 0;
        }

        id v20 = objc_getProperty(v11, v19, 360, 1);
        if (Property == v14)
        {
          BOOL v25 = [v20 objectAtIndexedSubscript:1];
          if (v25) {
            unsigned int v22 = v25[2];
          }
          else {
            unsigned int v22 = 0;
          }

          unsigned __int8 v23 = ne_log_obj();
          if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_28;
          }
          *(_DWORD *)buf = 67109120;
          LODWORD(v31) = v22;
          v24 = "shouldDisableInitialContactForSession fallback session status %d";
        }
        else
        {
          v21 = [v20 objectAtIndexedSubscript:0];
          if (v21) {
            unsigned int v22 = v21[2];
          }
          else {
            unsigned int v22 = 0;
          }

          unsigned __int8 v23 = ne_log_obj();
          if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_28;
          }
          *(_DWORD *)buf = 67109120;
          LODWORD(v31) = v22;
          v24 = "shouldDisableInitialContactForSession primary session status %d";
        }
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, v24, buf, 8u);
LABEL_28:

        BOOL v26 = v22 > 1;
LABEL_29:

        [v5 setDisableInitialContact:v26];
        goto LABEL_30;
      }
      v27 = ne_log_obj();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        v31 = "-[NESMIKEv2VPNFallbackSession shouldDisableInitialContactForSession:]";
        _os_log_fault_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_FAULT, "%s called with null session", buf, 0xCu);
      }
    }
    BOOL v26 = 0;
    goto LABEL_29;
  }
LABEL_30:
  v28.receiver = self;
  v28.super_class = (Class)NESMIKEv2VPNSession;
  [(NESMVPNSession *)&v28 createConnectParametersWithStartMessage:v4];
}

- (void)checkPluginInstalledWithCompletionHandler:(id)a3
{
}

- (BOOL)initializePlugins
{
  uint64_t v3 = [(NESMVPNSession *)self primaryTunnelPlugin];

  if (v3) {
    return 1;
  }
  unsigned int v5 = [(NESMSession *)self uid];

  if (v5)
  {
    id v6 = [NEAgent alloc];
    uint64_t v7 = [(NESMSession *)self uid];
    unint64_t v8 = [(NEAgent *)v6 initWithPluginType:@"com.apple.NetworkExtension.IKEv2Provider" pluginVersion:1 pluginClass:5 pluginInfo:&off_1000C9A40 userID:v7];

    if (v8)
    {
      unsigned int v9 = [NEVPNTunnelPlugin alloc];
      uint64_t v10 = [(NESMSession *)self queue];
      id v11 = [(NEVPNTunnelPlugin *)v9 initWithAgent:v8 delegateQueue:v10 andDelegate:self];
      [(NESMVPNSession *)self setPrimaryTunnelPlugin:v11];
    }
    BOOL v12 = [(NESMVPNSession *)self extensibleSSOProvider];

    if (v12)
    {
      v13 = [(NESMVPNSession *)self extensibleSSOProvider];
      BOOL v25 = v13;
      v14 = +[NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];

      v15 = [NEAgent alloc];
      id v16 = [(NESMVPNSession *)self pluginType];
      int v17 = [(NESMSession *)self uid];
      id v18 = [(NEAgent *)v15 initWithPluginType:v16 pluginVersion:0 pluginClass:8 pluginInfo:v14 userID:v17];

      SEL v19 = [NEVPNAuthenticationPlugin alloc];
      id v20 = [(NESMSession *)self queue];
      v21 = [(NEPlugin *)v19 initWithAgent:v18 delegateQueue:v20 andDelegate:self];
      [(NESMVPNSession *)self setAuthenticationPlugin:v21];
    }
    unsigned int v22 = [(NESMVPNSession *)self primaryTunnelPlugin];
    BOOL v4 = v22 != 0;
  }
  else
  {
    unint64_t v8 = ne_log_obj();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v27 = self;
      _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%@: No UID available, cannot create plugin", buf, 0xCu);
    }
    BOOL v4 = 0;
  }

  return v4;
}

- (NESMIKEv2VPNSession)initWithConfiguration:(id)a3 andServer:(id)a4 andProtocol:(id)a5 andPluginType:(id)a6 andSessionType:(int)a7
{
  return 0;
}

@end