@interface NESMServer
- (BOOL)canSleep;
- (BOOL)handleSleep;
- (BOOL)requestInstallForSession:(id)a3 withParentSession:(id)a4 exclusive:(BOOL)a5;
- (NESMServer)init;
- (NWInterface)primaryCellularInterface;
- (NWInterface)primaryPhysicalInterface;
- (NWInterface)primaryWiFiInterface;
- (void)dealloc;
- (void)deregisterSession:(id)a3;
- (void)handleSleepTime:(double)a3;
- (void)handleWakeup;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)registerSession:(id)a3 withCompletionHandler:(id)a4;
- (void)requestUninstallForSession:(id)a3;
- (void)satisfyCellularPathForSession:(id)a3;
- (void)satisfyPathForSession:(id)a3;
- (void)setPrimaryCellularInterface:(id)a3;
- (void)setPrimaryPhysicalInterface:(id)a3;
- (void)setPrimaryWiFiInterface:(id)a3;
@end

@implementation NESMServer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_primaryCellularInterface, 0);
  objc_storeStrong((id *)&self->_primaryPhysicalInterface, 0);
  objc_storeStrong((id *)&self->_primaryWiFiInterface, 0);
  objc_storeStrong((id *)&self->_controlPolicySession, 0);
  objc_storeStrong((id *)&self->_activeAppPushSessions, 0);
  objc_storeStrong(&self->_stopWithProviderCompletionHandler, 0);
  objc_storeStrong((id *)&self->_fallbackInterfacesDict, 0);
  objc_storeStrong((id *)&self->_handlesTimer, 0);
  objc_storeStrong(&self->_pendingStopCompletion, 0);
  objc_storeStrong((id *)&self->_sessionsWaitingForCellularNetwork, 0);
  objc_storeStrong((id *)&self->_sessionsWaitingForNetwork, 0);
  objc_storeStrong((id *)&self->_wifiInterfaceEvaluator, 0);
  objc_storeStrong((id *)&self->_cellularInterfaceEvaluator, 0);
  objc_storeStrong((id *)&self->_primaryPhysicalInterfaceEvaluator, 0);
  objc_storeStrong((id *)&self->_dnsProxySession, 0);
  objc_storeStrong((id *)&self->_filterSession, 0);
  objc_storeStrong((id *)&self->_personalVPNSession, 0);
  objc_storeStrong((id *)&self->_enterpriseVPNSession, 0);
  objc_storeStrong((id *)&self->_alwaysOnVPNSession, 0);
  objc_storeStrong((id *)&self->_savedPrimaryPhysicalInterfaceName, 0);
  objc_storeStrong((id *)&self->_consoleUserUUID, 0);
  objc_storeStrong((id *)&self->_termSource, 0);
  objc_storeStrong((id *)&self->_powerManager, 0);
  objc_storeStrong((id *)&self->_pendingSessionRequests, 0);
  objc_storeStrong((id *)&self->_sessions, 0);
  objc_storeStrong((id *)&self->_contentFilterClientListener, 0);
  objc_storeStrong((id *)&self->_flowDivertTokenListener, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_currentCaptiveNetworkPlugins, 0);
  objc_storeStrong((id *)&self->_savedInterfaceInfo, 0);

  objc_storeStrong((id *)&self->_primaryPhysicalPath, 0);
}

- (void)setPrimaryCellularInterface:(id)a3
{
}

- (NWInterface)primaryCellularInterface
{
  return (NWInterface *)objc_getProperty(self, a2, 368, 1);
}

- (void)setPrimaryPhysicalInterface:(id)a3
{
}

- (NWInterface)primaryPhysicalInterface
{
  return (NWInterface *)objc_getProperty(self, a2, 360, 1);
}

- (void)setPrimaryWiFiInterface:(id)a3
{
}

- (NWInterface)primaryWiFiInterface
{
  return (NWInterface *)objc_getProperty(self, a2, 352, 1);
}

- (void)requestUninstallForSession:(id)a3
{
  id v4 = a3;
  v5 = ne_log_obj();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v42 = self;
    __int16 v43 = 2112;
    id v44 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@: Request to uninstall session: %@", buf, 0x16u);
  }

  v6 = self;
  objc_sync_enter(v6);
  if ([v4 type] != 1)
  {
    if ([v4 type] == 6)
    {
      if (v6) {
        v6->_dnsProxySessionInstallState = 1;
      }
    }
    else if ([v4 type] == 8)
    {
      v18 = ne_log_obj();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        v19 = [v4 configuration];
        v20 = [v19 appPush];
        v21 = [v20 pluginType];
        *(_DWORD *)buf = 138412546;
        v42 = v6;
        __int16 v43 = 2112;
        id v44 = v21;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%@: Received request to uninstall session for plugin type [%@]", buf, 0x16u);
      }
      if (v6)
      {
        id v23 = objc_getProperty(v6, v22, 336, 1);
        if (v23)
        {
          v25 = v23;
          id v26 = objc_getProperty(v6, v24, 336, 1);
          v27 = [v4 configuration];
          v28 = [v27 appPush];
          v29 = [v28 pluginType];
          unsigned int v30 = [v26 containsObject:v29];

          if (v30)
          {
            id v32 = objc_getProperty(v6, v31, 336, 1);
            v33 = [v4 configuration];
            v34 = [v33 appPush];
            v35 = [v34 pluginType];
            [v32 removeObject:v35];
          }
        }
      }
    }
    goto LABEL_33;
  }
  v7 = [v4 configuration];
  BOOL v8 = [v7 grade] == (id)1;

  if (!v8)
  {
    v36 = [v4 configuration];
    if ([v36 grade] == (id)2 && v6)
    {
      BOOL v38 = objc_getProperty(v6, v37, 208, 1) == v4;

      if (v38) {
        v6->_personalVPNSessionInstallState = 1;
      }
    }
    else
    {
    }
    goto LABEL_33;
  }
  if (v6) {
    id Property = objc_getProperty(v6, v9, 192, 1);
  }
  else {
    id Property = 0;
  }
  if (Property != v4 && ![v4 isDeregisteredEnterpriseVPNSession]) {
    goto LABEL_33;
  }
  if (v6) {
    v6->_enterpriseVPNSessionInstallState = 1;
  }
  [v4 setIsDeregisteredEnterpriseVPNSession:0];
  if (!v6
    || (id v12 = objc_getProperty(v6, v11, 208, 1)) == 0
    || (BOOL v13 = v6->_personalVPNSessionInstallState == 2, v12, !v13)
    || (v6->_personalVPNSessionInstallState = 3, (id v15 = objc_getProperty(v6, v14, 208, 1)) == 0))
  {
LABEL_33:
    [v4 uninstallOnQueue];
    goto LABEL_34;
  }
  v16 = v15;
  v17 = ne_log_obj();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v42 = v6;
    __int16 v43 = 2112;
    id v44 = v16;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%@: Installing personal session because enterprise session is being uninstalled: %@", buf, 0x16u);
  }

  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_10004B32C;
  v39[3] = &unk_1000C6C60;
  id v40 = v4;
  [v16 installWithCompletionHandler:v39];

LABEL_34:
  objc_sync_exit(v6);
}

- (BOOL)requestInstallForSession:(id)a3 withParentSession:(id)a4 exclusive:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v10 = ne_log_obj();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v11 = &stru_1000C7428;
    *(_DWORD *)buf = 138412802;
    v75 = self;
    __int16 v76 = 2112;
    if (v5) {
      CFStringRef v11 = @"(exclusive)";
    }
    id v77 = v8;
    __int16 v78 = 2112;
    id v79 = (id)v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%@: Request to install session: %@ %@", buf, 0x20u);
  }

  id v12 = self;
  objc_sync_enter(v12);
  if (v9)
  {
    BOOL v14 = 0;
    if ([v9 type] != 3 || !v12) {
      goto LABEL_10;
    }
    if (objc_getProperty(v12, v13, 176, 1) != v9) {
      goto LABEL_9;
    }
    id v20 = 0;
    v12->_alwaysOnVPNSessionInstallState = 3;
LABEL_43:
    v72[0] = _NSConcreteStackBlock;
    v72[1] = 3221225472;
    v72[2] = sub_10004BBFC;
    v72[3] = &unk_1000C6C60;
    id v39 = v20;
    id v73 = v39;
    [v8 installWithCompletionHandler:v72];

    BOOL v16 = 1;
    goto LABEL_44;
  }
  if ([v8 type] == 4)
  {
    v17 = [v8 configuration];
    v18 = [v17 externalIdentifier];
    if (v18)
    {

      goto LABEL_42;
    }
    if (v12) {
      id Property = objc_getProperty(v12, v19, 224, 1);
    }
    else {
      id Property = 0;
    }
    BOOL v22 = Property == v8;

    if (v22) {
      goto LABEL_42;
    }
  }
  if ([v8 type] != 1)
  {
    if ([v8 type] == 2 || objc_msgSend(v8, "type") == 5) {
      goto LABEL_42;
    }
    if ([v8 type] == 6)
    {
      if (v12)
      {
        id v20 = 0;
        v12->_dnsProxySessionInstallState = 3;
        goto LABEL_43;
      }
      goto LABEL_42;
    }
    if ([v8 type] == 7)
    {
LABEL_42:
      id v20 = 0;
      goto LABEL_43;
    }
    if ([v8 type] != 8)
    {
      if ([v8 type] == 9) {
        goto LABEL_42;
      }
      goto LABEL_9;
    }
    v51 = ne_log_obj();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
    {
      v52 = [v8 configuration];
      v53 = [v52 appPush];
      v54 = [v53 pluginType];
      *(_DWORD *)buf = 138412546;
      v75 = v12;
      __int16 v76 = 2112;
      id v77 = v54;
      _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "%@ Received request to install for NESessionTypeAppPush session type, plugin type [%@]", buf, 0x16u);
    }
    if (!v12 || !objc_getProperty(v12, v55, 336, 1))
    {
      id v57 = [objc_alloc((Class)NSMutableArray) initWithCapacity:0];
      v59 = v57;
      if (!v12)
      {

        id v60 = 0;
        goto LABEL_72;
      }
      objc_setProperty_atomic(v12, v58, v57, 336);
    }
    id v60 = objc_getProperty(v12, v56, 336, 1);
LABEL_72:
    id v61 = v60;
    v62 = [v8 configuration];
    v63 = [v62 appPush];
    v64 = [v63 pluginType];
    unsigned __int8 v65 = [v61 containsObject:v64];

    if (v65)
    {
      BOOL v14 = 1;
      goto LABEL_10;
    }
    if (v12) {
      id v67 = objc_getProperty(v12, v66, 336, 1);
    }
    else {
      id v67 = 0;
    }
    id v68 = v67;
    v69 = [v8 configuration];
    v70 = [v69 appPush];
    v71 = [v70 pluginType];
    [v68 addObject:v71];

    goto LABEL_42;
  }
  id v23 = [v8 configuration];
  v24 = [v23 VPN];
  v25 = [v24 protocol];
  unsigned int v26 = [v25 includeAllNetworks];

  v27 = [v8 configuration];
  LODWORD(v25) = [v27 grade] == (id)1;

  int v28 = v26 | v5;
  if (!v25)
  {
    v41 = [v8 configuration];
    id v42 = [v41 grade];
    BOOL v14 = v42 == (id)2;
    if (v42 == (id)2)
    {
      if (v12) {
        id v44 = objc_getProperty(v12, v43, 208, 1);
      }
      else {
        id v44 = 0;
      }
      BOOL v45 = v44 == v8;

      if (!v45) {
        goto LABEL_9;
      }
      v46 = ne_log_obj();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
      {
        v47 = "";
        v48 = " Exclusive";
        if (!v28) {
          v48 = "";
        }
        *(_DWORD *)buf = 138413058;
        __int16 v76 = 2112;
        v75 = v12;
        id v77 = v8;
        __int16 v78 = 2080;
        if (v26) {
          v47 = " IncludeAllNetworks";
        }
        id v79 = (id)v48;
        __int16 v80 = 2080;
        v81 = v47;
        _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "%@: Request to install Session %@ is Personal -%s%s", buf, 0x2Au);
      }

      if (!v12) {
        goto LABEL_42;
      }
      if (v12->_enterpriseVPNSessionInstallState != 4)
      {
        id v20 = 0;
        v12->_personalVPNSessionInstallState = 3;
        goto LABEL_43;
      }
      v12->_personalVPNSessionInstallState = 2;
      v41 = ne_log_obj();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        id v50 = objc_getProperty(v12, v49, 192, 1);
        *(_DWORD *)buf = 138412802;
        v75 = v12;
        __int16 v76 = 2112;
        id v77 = v8;
        __int16 v78 = 2112;
        id v79 = v50;
        _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "%@: Request to install personal session (%@) delayed due to exclusive enterprise session (%@)", buf, 0x20u);
      }
    }

    goto LABEL_10;
  }
  v29 = ne_log_obj();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v30 = "";
    v31 = " Exclusive";
    if (!v28) {
      v31 = "";
    }
    *(_DWORD *)buf = 138413058;
    __int16 v76 = 2112;
    v75 = v12;
    id v77 = v8;
    __int16 v78 = 2080;
    if (v26) {
      unsigned int v30 = " IncludeAllNetworks";
    }
    id v79 = (id)v31;
    __int16 v80 = 2080;
    v81 = v30;
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "%@: Request to install Session %@ is Enterprise -%s%s", buf, 0x2Au);
  }

  if (v12) {
    id v33 = objc_getProperty(v12, v32, 192, 1);
  }
  else {
    id v33 = 0;
  }
  if (v33 == v8)
  {
    if (v28)
    {
      if (v12)
      {
        v12->_enterpriseVPNSessionInstallState = 4;
        id v20 = objc_getProperty(v12, v32, 208, 1);
        if (!v20) {
          goto LABEL_43;
        }
        BOOL v34 = v12->_personalVPNSessionInstallState == 3;

        if (v34)
        {
          v12->_personalVPNSessionInstallState = 2;
          v35 = ne_log_obj();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
          {
            id v37 = objc_getProperty(v12, v36, 208, 1);
            *(_DWORD *)buf = 138412802;
            v75 = v12;
            __int16 v76 = 2112;
            id v77 = v37;
            __int16 v78 = 2112;
            id v79 = v8;
            _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "%@: Personal session %@ superceded by exclusive enterprise session %@, will uninstall personal session", buf, 0x20u);
          }

          id v20 = objc_getProperty(v12, v38, 208, 1);
          goto LABEL_43;
        }
      }
    }
    else if (v12)
    {
      id v20 = 0;
      v12->_enterpriseVPNSessionInstallState = 3;
      goto LABEL_43;
    }
    goto LABEL_42;
  }
LABEL_9:
  BOOL v14 = 0;
LABEL_10:
  id v15 = ne_log_obj();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v75 = v12;
    __int16 v76 = 2112;
    id v77 = v8;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%@: Request to install session is superceded by registered sessions: %@", buf, 0x16u);
  }

  if (v14) {
    [v8 installPendedOnQueue];
  }
  BOOL v16 = 0;
LABEL_44:
  objc_sync_exit(v12);

  return v16;
}

- (void)deregisterSession:(id)a3
{
  id v4 = a3;
  BOOL v5 = self;
  objc_sync_enter(v5);
  if ([v4 type] == 3)
  {
    if (!v5)
    {
      if (v4) {
        goto LABEL_52;
      }
LABEL_5:
      id v8 = ne_log_obj();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v24 = 138412546;
        v25 = v5;
        __int16 v26 = 2112;
        id v27 = v4;
        id v9 = "%@: Deregister Always-On VPN Session: %@";
LABEL_50:
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v24, 0x16u);
        goto LABEL_51;
      }
      goto LABEL_51;
    }
    if (objc_getProperty(v5, v6, 176, 1) == v4)
    {
      objc_setProperty_atomic(v5, v7, 0, 176);
      goto LABEL_5;
    }
    goto LABEL_52;
  }
  if ([v4 type] == 4)
  {
    if (v5)
    {
      if (objc_getProperty(v5, v10, 224, 1) != v4) {
        goto LABEL_14;
      }
      objc_setProperty_atomic(v5, v11, 0, 224);
    }
    else if (v4)
    {
      id v23 = v4;
      goto LABEL_15;
    }
    id v12 = ne_log_obj();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v24 = 138412546;
      v25 = v5;
      __int16 v26 = 2112;
      id v27 = v4;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%@: Deregister Filter Session: %@", (uint8_t *)&v24, 0x16u);
    }

LABEL_14:
    if (!v4)
    {
      id v8 = 0;
      goto LABEL_51;
    }
LABEL_15:
    id v8 = v4;
    objc_sync_enter(v8);
    if (HIDWORD(v8[44].isa))
    {
      BOOL v13 = ne_log_obj();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        int isa_high = HIDWORD(v8[44].isa);
        int v24 = 67109120;
        LODWORD(v25) = isa_high;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "De-allocating control unit %u", (uint8_t *)&v24, 8u);
      }

      int v15 = HIDWORD(v8[44].isa);
      self;
      os_unfair_lock_lock(&stru_1000D7C50);
      dword_1000D7C54 &= ~v15 | 0xE0000000;
      os_unfair_lock_unlock(&stru_1000D7C50);
      HIDWORD(v8[44].isa) = 0;
    }
    objc_sync_exit(v8);

    goto LABEL_51;
  }
  if ([v4 type] == 1)
  {
    BOOL v16 = [v4 configuration];
    id v17 = [v16 grade];

    if (v17 != (id)1)
    {
      if (v5)
      {
        if (objc_getProperty(v5, v18, 208, 1) != v4) {
          goto LABEL_52;
        }
        objc_setProperty_atomic(v5, v20, 0, 208);
      }
      else if (v4)
      {
        goto LABEL_52;
      }
      id v8 = ne_log_obj();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v24 = 138412546;
        v25 = v5;
        __int16 v26 = 2112;
        id v27 = v4;
        id v9 = "%@: Deregister Personal VPN Session: %@";
        goto LABEL_50;
      }
      goto LABEL_51;
    }
    if (v5)
    {
      if (objc_getProperty(v5, v18, 192, 1) != v4) {
        goto LABEL_52;
      }
      objc_setProperty_atomic(v5, v19, 0, 192);
    }
    else if (v4)
    {
      goto LABEL_52;
    }
    [v4 setIsDeregisteredEnterpriseVPNSession:1];
    id v8 = ne_log_obj();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      int v24 = 138412546;
      v25 = v5;
      __int16 v26 = 2112;
      id v27 = v4;
      _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%@: Deregister Enterprise VPN Session: %@", (uint8_t *)&v24, 0x16u);
    }
    goto LABEL_51;
  }
  if ([v4 type] == 2)
  {
    [v4 setIsDeregisteredAppVPNSession:1];
    id v8 = ne_log_obj();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v24 = 138412546;
      v25 = v5;
      __int16 v26 = 2112;
      id v27 = v4;
      id v9 = "%@: Deregister App VPN Session: %@";
      goto LABEL_50;
    }
LABEL_51:

    goto LABEL_52;
  }
  if ([v4 type] == 5)
  {
    id v8 = ne_log_obj();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v24 = 138412546;
      v25 = v5;
      __int16 v26 = 2112;
      id v27 = v4;
      id v9 = "%@: Deregister Path Controller Session: %@";
      goto LABEL_50;
    }
    goto LABEL_51;
  }
  if ([v4 type] == 6)
  {
    if (v5)
    {
      if (objc_getProperty(v5, v21, 232, 1) != v4) {
        goto LABEL_52;
      }
      objc_setProperty_atomic(v5, v22, 0, 232);
    }
    else if (v4)
    {
      goto LABEL_52;
    }
    id v8 = ne_log_obj();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v24 = 138412546;
      v25 = v5;
      __int16 v26 = 2112;
      id v27 = v4;
      id v9 = "%@: Deregister DNS Proxy Session: %@";
      goto LABEL_50;
    }
    goto LABEL_51;
  }
  if ([v4 type] == 7)
  {
    id v8 = ne_log_obj();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v24 = 138412546;
      v25 = v5;
      __int16 v26 = 2112;
      id v27 = v4;
      id v9 = "%@: Deregister DNS Settings Session: %@";
      goto LABEL_50;
    }
    goto LABEL_51;
  }
  if ([v4 type] == 9)
  {
    id v8 = ne_log_obj();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v24 = 138412546;
      v25 = v5;
      __int16 v26 = 2112;
      id v27 = v4;
      id v9 = "%@: Deregister Relay Session: %@";
      goto LABEL_50;
    }
    goto LABEL_51;
  }
LABEL_52:
  objc_sync_exit(v5);
}

- (void)registerSession:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = ne_log_obj();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v24 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Registering session %@", buf, 0xCu);
  }

  id v9 = [v6 configuration];
  v10 = [v9 identifier];

  CFStringRef v11 = +[NEConfigurationManager sharedManagerForAllUsers];
  id v12 = [v6 configuration];
  BOOL v14 = [v12 identifier];
  if (self) {
    id Property = objc_getProperty(self, v13, 88, 1);
  }
  else {
    id Property = 0;
  }
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10004C430;
  v19[3] = &unk_1000C6240;
  v19[4] = self;
  id v20 = v10;
  id v21 = v6;
  id v22 = v7;
  id v16 = v7;
  id v17 = v6;
  id v18 = v10;
  [v11 loadConfigurationWithID:v14 withCompletionQueue:Property handler:v19];
}

- (void)dealloc
{
  sub_10004DF0C(self);
  sub_10004E090(self);
  sub_10004E178(self);
  v3.receiver = self;
  v3.super_class = (Class)NESMServer;
  [(NESMServer *)&v3 dealloc];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v8 = a3;
  id v10 = a4;
  if (self) {
    id Property = objc_getProperty(self, v9, 88, 1);
  }
  else {
    id Property = 0;
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004E324;
  block[3] = &unk_1000C6958;
  id v15 = v8;
  id v16 = v10;
  id v17 = self;
  id v12 = v10;
  id v13 = v8;
  dispatch_async(Property, block);
}

- (void)satisfyCellularPathForSession:(id)a3
{
  id v5 = a3;
  if (self) {
    id Property = objc_getProperty(self, v4, 88, 1);
  }
  else {
    id Property = 0;
  }
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10004FAB0;
  v8[3] = &unk_1000C6C38;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(Property, v8);
}

- (void)satisfyPathForSession:(id)a3
{
  id v5 = a3;
  if (self) {
    id Property = objc_getProperty(self, v4, 88, 1);
  }
  else {
    id Property = 0;
  }
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10004FCE8;
  v8[3] = &unk_1000C6C38;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(Property, v8);
}

- (void)handleWakeup
{
  v2 = self;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  if (self) {
    self = (NESMServer *)objc_getProperty(self, a2, 120, 1);
  }
  obj = self;
  id v3 = [(NESMServer *)obj countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v3)
  {
    id v5 = v3;
    uint64_t v22 = *(void *)v28;
    do
    {
      id v6 = 0;
      do
      {
        if (*(void *)v28 != v22) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void *)(*((void *)&v27 + 1) + 8 * (void)v6);
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        if (v2) {
          id Property = objc_getProperty(v2, v4, 120, 1);
        }
        else {
          id Property = 0;
        }
        id v9 = [Property objectForKeyedSubscript:v7];
        id v10 = [v9 countByEnumeratingWithState:&v23 objects:v31 count:16];
        if (v10)
        {
          id v12 = v10;
          uint64_t v13 = *(void *)v24;
          do
          {
            BOOL v14 = 0;
            do
            {
              if (*(void *)v24 != v13) {
                objc_enumerationMutation(v9);
              }
              uint64_t v15 = *(void *)(*((void *)&v23 + 1) + 8 * (void)v14);
              if (v2) {
                id v16 = objc_getProperty(v2, v11, 120, 1);
              }
              else {
                id v16 = 0;
              }
              id v17 = [v16 objectForKeyedSubscript:v7];
              id v18 = [v17 objectForKeyedSubscript:v15];
              [v18 handleWakeup];

              BOOL v14 = (char *)v14 + 1;
            }
            while (v12 != v14);
            id v19 = [v9 countByEnumeratingWithState:&v23 objects:v31 count:16];
            id v12 = v19;
          }
          while (v19);
        }

        id v6 = (char *)v6 + 1;
      }
      while (v6 != v5);
      id v20 = [(NESMServer *)obj countByEnumeratingWithState:&v27 objects:v32 count:16];
      id v5 = v20;
    }
    while (v20);
  }
}

- (void)handleSleepTime:(double)a3
{
  id v4 = self;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  if (self) {
    self = (NESMServer *)objc_getProperty(self, a2, 120, 1);
  }
  obj = self;
  id v5 = [(NESMServer *)obj countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v5)
  {
    id v7 = v5;
    uint64_t v24 = *(void *)v30;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v30 != v24) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v29 + 1) + 8 * (void)v8);
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        if (v4) {
          id Property = objc_getProperty(v4, v6, 120, 1);
        }
        else {
          id Property = 0;
        }
        CFStringRef v11 = [Property objectForKeyedSubscript:v9];
        id v12 = [v11 countByEnumeratingWithState:&v25 objects:v33 count:16];
        if (v12)
        {
          id v14 = v12;
          uint64_t v15 = *(void *)v26;
          do
          {
            id v16 = 0;
            do
            {
              if (*(void *)v26 != v15) {
                objc_enumerationMutation(v11);
              }
              uint64_t v17 = *(void *)(*((void *)&v25 + 1) + 8 * (void)v16);
              if (v4) {
                id v18 = objc_getProperty(v4, v13, 120, 1);
              }
              else {
                id v18 = 0;
              }
              id v19 = [v18 objectForKeyedSubscript:v9];
              id v20 = [v19 objectForKeyedSubscript:v17];
              [v20 handleSleepTime:a3];

              id v16 = (char *)v16 + 1;
            }
            while (v14 != v16);
            id v21 = [v11 countByEnumeratingWithState:&v25 objects:v33 count:16];
            id v14 = v21;
          }
          while (v21);
        }

        id v8 = (char *)v8 + 1;
      }
      while (v8 != v7);
      id v22 = [(NESMServer *)obj countByEnumeratingWithState:&v29 objects:v34 count:16];
      id v7 = v22;
    }
    while (v22);
  }
}

- (BOOL)handleSleep
{
  v2 = self;
  if (self)
  {
    self->_sleepAckCount = 0;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    self = (NESMServer *)objc_getProperty(self, a2, 120, 1);
  }
  else
  {
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
  }
  obj = self;
  id v23 = [(NESMServer *)obj countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v23)
  {
    uint64_t v22 = *(void *)v29;
    do
    {
      id v4 = 0;
      do
      {
        if (*(void *)v29 != v22) {
          objc_enumerationMutation(obj);
        }
        uint64_t v5 = *(void *)(*((void *)&v28 + 1) + 8 * (void)v4);
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        if (v2) {
          id Property = objc_getProperty(v2, v3, 120, 1);
        }
        else {
          id Property = 0;
        }
        id v7 = [Property objectForKeyedSubscript:v5];
        id v8 = [v7 countByEnumeratingWithState:&v24 objects:v32 count:16];
        if (v8)
        {
          id v10 = v8;
          uint64_t v11 = *(void *)v25;
          do
          {
            id v12 = 0;
            do
            {
              if (*(void *)v25 != v11) {
                objc_enumerationMutation(v7);
              }
              uint64_t v13 = *(void *)(*((void *)&v24 + 1) + 8 * (void)v12);
              if (v2) {
                id v14 = objc_getProperty(v2, v9, 120, 1);
              }
              else {
                id v14 = 0;
              }
              uint64_t v15 = [v14 objectForKeyedSubscript:v5];
              id v16 = [v15 objectForKeyedSubscript:v13];
              unsigned int v17 = [v16 handleSleep];

              if (v2 && v17) {
                ++v2->_sleepAckCount;
              }
              id v12 = (char *)v12 + 1;
            }
            while (v10 != v12);
            id v18 = [v7 countByEnumeratingWithState:&v24 objects:v32 count:16];
            id v10 = v18;
          }
          while (v18);
        }

        id v4 = (char *)v4 + 1;
      }
      while (v4 != v23);
      id v19 = [(NESMServer *)obj countByEnumeratingWithState:&v28 objects:v33 count:16];
      id v23 = v19;
    }
    while (v19);
  }

  return v2 && v2->_sleepAckCount > 0;
}

- (BOOL)canSleep
{
  v2 = self;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  if (self) {
    self = (NESMServer *)objc_getProperty(self, a2, 120, 1);
  }
  obj = self;
  id v24 = [(NESMServer *)obj countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v24)
  {
    uint64_t v23 = *(void *)v31;
    char v4 = 1;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v31 != v23) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void *)(*((void *)&v30 + 1) + 8 * v5);
        long long v26 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        if (v2) {
          id Property = objc_getProperty(v2, v3, 120, 1);
        }
        else {
          id Property = 0;
        }
        uint64_t v25 = v5;
        id v8 = [Property objectForKeyedSubscript:v6];
        id v9 = [v8 countByEnumeratingWithState:&v26 objects:v34 count:16];
        if (v9)
        {
          id v11 = v9;
          uint64_t v12 = *(void *)v27;
          do
          {
            uint64_t v13 = 0;
            do
            {
              if (*(void *)v27 != v12) {
                objc_enumerationMutation(v8);
              }
              uint64_t v14 = *(void *)(*((void *)&v26 + 1) + 8 * (void)v13);
              if (v2) {
                id v15 = objc_getProperty(v2, v10, 120, 1);
              }
              else {
                id v15 = 0;
              }
              id v16 = [v15 objectForKeyedSubscript:v6];
              unsigned int v17 = [v16 objectForKeyedSubscript:v14];
              unsigned __int8 v18 = [v17 canSleep];

              v4 &= v18;
              uint64_t v13 = (char *)v13 + 1;
            }
            while (v11 != v13);
            id v19 = [v8 countByEnumeratingWithState:&v26 objects:v34 count:16];
            id v11 = v19;
          }
          while (v19);
        }

        uint64_t v5 = v25 + 1;
      }
      while ((id)(v25 + 1) != v24);
      id v20 = [(NESMServer *)obj countByEnumeratingWithState:&v30 objects:v35 count:16];
      id v24 = v20;
    }
    while (v20);
  }
  else
  {
    char v4 = 1;
  }

  return v4 & 1;
}

- (NESMServer)init
{
}

@end