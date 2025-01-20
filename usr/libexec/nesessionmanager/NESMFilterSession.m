@interface NESMFilterSession
- (BOOL)disableDefaultDropAfterBoot;
- (BOOL)handleAgentClientConnection:(id)a3 WithMessage:(id)a4;
- (BOOL)handleSleep;
- (BOOL)handleUpdateConfiguration:(id)a3;
- (BOOL)hasProviderWithBundleIdentifier:(id)a3;
- (BOOL)isStopAllowed:(id)a3;
- (BOOL)pinPlugin:(id)a3 toConfigurationWithProcesses:(id)a4;
- (BOOL)supportsDefaultDrop;
- (BOOL)waitForPerApp;
- (NESMFilterSession)initWithConfiguration:(id)a3 andServer:(id)a4;
- (id)plugin:(id)a3 didApplySettings:(id)a4;
- (id)pluginDidRequestContentFilterSocket:(id)a3;
- (id)pluginDidRequestPacketFilterChannel:(id)a3;
- (id)pluginType;
- (int)type;
- (void)handleInitializeState;
- (void)handleInstalledAppsChanged;
- (void)handleNetworkDetectionNotification:(int)a3;
- (void)handleStartMessage:(id)a3;
- (void)handleStopMessageWithReason:(int)a3;
- (void)handleUserLogin;
- (void)handleWakeup;
- (void)install;
- (void)invalidate;
- (void)plugin:(id)a3 didSetStatus:(int64_t)a4 andError:(int64_t)a5;
- (void)plugin:(id)a3 didStartWithPID:(int)a4 error:(id)a5;
- (void)pluginDidAcknowledgeSleep:(id)a3;
- (void)pluginDidDispose:(id)a3;
- (void)pluginDidRequestAgentClientServer:(id)a3;
- (void)startWithCommand:(id)a3 isOnDemand:(BOOL)a4;
- (void)uninstall;
@end

@implementation NESMFilterSession

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interpose, 0);
  objc_storeStrong((id *)&self->_restartTimer, 0);
  objc_storeStrong((id *)&self->_lastStartMessage, 0);
  objc_storeStrong((id *)&self->_packetPlugin, 0);
  objc_storeStrong((id *)&self->_plugin, 0);
  objc_storeStrong((id *)&self->_cachedStateHandlers, 0);
  objc_storeStrong((id *)&self->_stateHandler, 0);
  objc_storeStrong((id *)&self->_processToFilter, 0);

  objc_storeStrong((id *)&self->_settings, 0);
}

- (BOOL)isStopAllowed:(id)a3
{
  v3 = xpc_dictionary_get_remote_connection(a3);
  if (v3)
  {
    v4 = (void *)xpc_connection_copy_entitlement_value();
    BOOL v5 = v4 != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)supportsDefaultDrop
{
  return [(NESMSession *)self defaultDropType] != 0;
}

- (BOOL)disableDefaultDropAfterBoot
{
  if (![(NESMSession *)self defaultDropType]) {
    return 1;
  }
  v3 = [(NESMSession *)self configuration];
  v4 = [v3 externalIdentifier];

  BOOL result = 0;
  if (self)
  {
    if (v4) {
      return self->_perAppDropPoliciesInstalled;
    }
  }
  return result;
}

- (void)startWithCommand:(id)a3 isOnDemand:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [(NESMSession *)self configuration];
  v8 = [v7 contentFilter];
  unsigned __int8 v9 = [v8 enableManualMode];

  if ((v9 & 1) == 0)
  {
    v10.receiver = self;
    v10.super_class = (Class)NESMFilterSession;
    [(NESMSession *)&v10 startWithCommand:v6 isOnDemand:v4];
  }
}

- (id)plugin:(id)a3 didApplySettings:(id)a4
{
  id v6 = a4;
  objc_storeStrong((id *)&self->_settings, a4);
  if (self->_isInstalled && self->_controlUnit && (sub_10007267C(self) & 1) == 0) {
    id v7 = [objc_alloc((Class)NSError) initWithDomain:NEFilterErrorDomain code:1 userInfo:0];
  }
  else {
    id v7 = 0;
  }

  return v7;
}

- (void)handleUserLogin
{
  v3 = [(NESMSession *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100072F70;
  block[3] = &unk_1000C6C60;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)invalidate
{
  v4.receiver = self;
  v4.super_class = (Class)NESMFilterSession;
  [(NESMSession *)&v4 invalidate];
  [(NESMFilterSessionState *)self->_stateHandler leave];
  stateHandler = self->_stateHandler;
  self->_stateHandler = 0;
}

- (id)pluginType
{
  v2 = [(NESMSession *)self configuration];
  v3 = [v2 contentFilter];
  objc_super v4 = [v3 provider];
  BOOL v5 = [v4 pluginType];

  return v5;
}

- (BOOL)handleUpdateConfiguration:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    [(NESMSession *)self setConfiguration:0];
    [(NESMSession *)self setConfigurationSignature:0];
    if (!self) {
      goto LABEL_24;
    }
    sub_100073438(self, 0);
LABEL_23:
    LOBYTE(self) = 0;
    goto LABEL_24;
  }
  BOOL v5 = [(NESMSession *)self configuration];
  id v6 = [v5 contentFilter];
  id v7 = [v6 provider];
  unsigned int v8 = [v7 filterBrowsers];
  unsigned __int8 v9 = [v4 contentFilter];
  objc_super v10 = [v9 provider];
  if (v8 == [v10 filterBrowsers])
  {
    v45 = [(NESMSession *)self configuration];
    v44 = [v45 contentFilter];
    [v44 provider];
    v12 = v11 = v4;
    unsigned int v13 = [v12 filterSockets];
    [v11 contentFilter];
    v14 = v46 = v5;
    v15 = [v14 provider];
    unsigned int v47 = v13 ^ [v15 filterSockets];

    BOOL v5 = v46;
    id v4 = v11;
  }
  else
  {
    unsigned int v47 = 1;
  }

  v16 = [v4 contentFilter];
  if ([v16 isEnabled])
  {
    v17 = [(NESMSession *)self configuration];
    v18 = [v17 contentFilter];
    v19 = [v18 perApp];
    v20 = [v19 appRules];
    v21 = [v4 contentFilter];
    v22 = [v21 perApp];
    v23 = [v22 appRules];

    BOOL v24 = v20 == v23;
    int v25 = v47;
    if (!v24) {
      int v25 = 1;
    }
  }
  else
  {
    int v25 = v47;
  }

  v26 = [(NESMSession *)self configuration];
  v27 = [v26 contentFilter];
  v28 = [v27 provider];
  unsigned int v29 = [v28 preserveExistingConnections];
  v30 = [v4 contentFilter];
  v31 = [v30 provider];
  unsigned int v32 = [v31 preserveExistingConnections];

  v48.receiver = self;
  v48.super_class = (Class)NESMFilterSession;
  if (![(NESMSession *)&v48 handleUpdateConfiguration:v4]) {
    goto LABEL_23;
  }
  if (self) {
    sub_100073438(self, 0);
  }
  int v33 = v29 ^ v32 | v25;
  v34 = [(NESMSession *)self configuration];
  v35 = [v34 contentFilter];
  unsigned int v36 = [v35 isEnabled];

  if (v36)
  {
    if (self) {
      id Property = objc_getProperty(self, v37, 376, 1);
    }
    else {
      id Property = 0;
    }
    [Property handleUpdateConfiguration];
  }
  if (v33)
  {
    sub_100073930(self);
    if (self)
    {
      v39 = [(NESMSession *)self configuration];
      v40 = [v39 contentFilter];
      v41 = [v40 provider];
      int v42 = sub_100073F08((uint64_t)NESMFilterSession, v41);

      self->_controlUnit = self->_controlUnit & 0x1FFFFFFF | v42;
    }
    [(NESMSession *)self stopIfNecessaryWithReason:37];
  }
  LOBYTE(self) = 1;
LABEL_24:

  return (char)self;
}

- (void)uninstall
{
  v3 = [(NESMSession *)self policySession];
  sub_10002E854((uint64_t)v3);

  self->_isInstalled = 0;
  settings = self->_settings;
  self->_settings = 0;
}

- (void)install
{
  if (self && self->_controlUnit) {
    sub_10007267C(self);
  }
  self->_isInstalled = 1;
}

- (BOOL)waitForPerApp
{
  v3 = [(NESMSession *)self configuration];
  uint64_t v4 = [v3 externalIdentifier];
  if (!v4) {
    goto LABEL_9;
  }
  BOOL v5 = (void *)v4;
  id v6 = [(NESMSession *)self configuration];
  id v7 = [v6 contentFilter];
  if (![v7 isEnabled])
  {

LABEL_9:
    return 1;
  }
  unsigned int v8 = [(NESMSession *)self configuration];
  unsigned __int8 v9 = [v8 contentFilter];
  objc_super v10 = [v9 perApp];

  if (v10)
  {
    v11 = [(NESMSession *)self configuration];
    v12 = [v11 contentFilter];
    unsigned int v13 = [v12 perApp];
    v14 = [(NESMSession *)self uid];
    [v13 updateAppRulesForUID:[v14 unsignedIntValue]];

    v15 = [(NESMSession *)self configuration];
    v16 = [v15 contentFilter];
    v17 = [v16 perApp];
    v18 = [v17 appRules];
    id v19 = [v18 count];

    if (v19)
    {
      v20 = [(NESMSession *)self policySession];
      v21 = [(NESMSession *)self configuration];
      v22 = [v21 contentFilter];
      v23 = [v22 perApp];
      BOOL v24 = [v23 appRules];
      int v25 = [(NESMSession *)self uid];
      [v25 intValue];
      sub_10003E240((uint64_t)v20, v24);
    }
    v26 = [(NESMSession *)self configuration];
    v27 = [v26 contentFilter];
    v28 = [v27 perApp];
    id v29 = [v28 copyCachedMachOUUIDs];

    if (v29) {
      return 0;
    }
  }
  return 1;
}

- (BOOL)pinPlugin:(id)a3 toConfigurationWithProcesses:(id)a4
{
  id Property = a3;
  id v7 = Property;
  if (Property) {
    id Property = objc_getProperty(Property, v6, 24, 1);
  }
  id v8 = Property;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    objc_super v10 = ne_log_obj();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v12 = [(NESMSession *)self configuration];
      unsigned int v13 = [v12 name];
      int v14 = 138412802;
      v15 = self;
      __int16 v16 = 2112;
      v17 = v7;
      __int16 v18 = 2112;
      id v19 = v13;
      _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%@: Invalid attempt to pin filter plugin %@ to configuration %@", (uint8_t *)&v14, 0x20u);
    }
  }

  return isKindOfClass & 1;
}

- (BOOL)handleAgentClientConnection:(id)a3 WithMessage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int int64 = xpc_dictionary_get_int64(v7, "command");
  unsigned __int8 v9 = ne_log_obj();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Received a request for a new filter connection", buf, 2u);
  }

  if (int64 != 1) {
    goto LABEL_10;
  }
  uint int64 = xpc_dictionary_get_uint64(v7, "control-unit");
  v11 = self;
  objc_sync_enter(v11);
  unsigned int v12 = v11 ? v11->_controlUnit : 0;
  objc_sync_exit(v11);

  unsigned int v13 = ne_log_obj();
  int v14 = uint64 & 0x1FFFFFFF;
  int v15 = v12 & uint64 & 0x1FFFFFFF;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109376;
    int v24 = v14;
    __int16 v25 = 1024;
    BOOL v26 = v15 != 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Received unit %u, matches %u", buf, 0xEu);
  }

  if (v15)
  {
    __int16 v16 = [(NESMSession *)v11 queue];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10007463C;
    v19[3] = &unk_1000C6550;
    int v22 = 1;
    v19[4] = v11;
    id v20 = v6;
    id v21 = v7;
    dispatch_async(v16, v19);

    BOOL v17 = 1;
  }
  else
  {
LABEL_10:
    BOOL v17 = 0;
  }

  return v17;
}

- (void)pluginDidAcknowledgeSleep:(id)a3
{
  id v4 = [(NESMSession *)self server];
  sub_1000556BC(v4, v3);
}

- (id)pluginDidRequestPacketFilterChannel:(id)a3
{
  id v4 = (unsigned int *)a3;
  BOOL v5 = ne_log_obj();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138412546;
    __int16 v16 = self;
    __int16 v17 = 2112;
    __int16 v18 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@: Plugin %@ requested a packet filter channel", (uint8_t *)&v15, 0x16u);
  }

  sub_100018330(v4);
  id v6 = (void *)nw_interpose_client_register();
  id v8 = v6;
  if (self)
  {
    objc_setProperty_atomic(self, v7, v6, 448);

    if (objc_getProperty(self, v9, 448, 1))
    {
      uint64_t v21 = 0;
      uint64_t v22 = 0;
LABEL_10:
      objc_getProperty(self, v10, 448, 1);
      goto LABEL_11;
    }
  }
  else
  {
  }
  v11 = ne_log_obj();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    int v15 = 138412546;
    __int16 v16 = self;
    __int16 v17 = 2112;
    __int16 v18 = v4;
    _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%@: Plugin %@ failed to register for necp interpose client", (uint8_t *)&v15, 0x16u);
  }

  uint64_t v21 = 0;
  uint64_t v22 = 0;
  if (self) {
    goto LABEL_10;
  }
LABEL_11:
  if (nw_interpose_get_client_uuid())
  {
    id v12 = [objc_alloc((Class)NSUUID) initWithUUIDBytes:&v21];
    unsigned int v13 = ne_log_obj();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      int v15 = 138412802;
      __int16 v16 = self;
      __int16 v17 = 2112;
      __int16 v18 = v4;
      __int16 v19 = 2112;
      id v20 = v12;
      _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "%@: Plugin %@ registered for necp interpose client %@", (uint8_t *)&v15, 0x20u);
    }
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (void)plugin:(id)a3 didSetStatus:(int64_t)a4 andError:(int64_t)a5
{
  id v8 = a3;
  id v15 = v8;
  switch(a4)
  {
    case 0:
      if (self) {
        id Property = objc_getProperty(self, v9, 376, 1);
      }
      else {
        id Property = 0;
      }
      [Property handlePlugin:v15 statusDidChangeToIdleWithError:a5];
      goto LABEL_17;
    case 1:
      if (self) {
        id v14 = objc_getProperty(self, v9, 376, 1);
      }
      else {
        id v14 = 0;
      }
      [v14 handlePluginStatusDidChangeToStarting:v15];
      goto LABEL_17;
    case 2:
      if (self) {
        id v11 = objc_getProperty(self, v9, 376, 1);
      }
      else {
        id v11 = 0;
      }
      [v11 handlePluginStatusDidChangeToRunning:v15];
      goto LABEL_17;
    case 3:
      if (self) {
        id v12 = objc_getProperty(self, v9, 376, 1);
      }
      else {
        id v12 = 0;
      }
      [v12 handlePlugin:v15 statusDidChangeToStoppingWithError:a5];
      goto LABEL_17;
    case 4:
      if (self) {
        id v13 = objc_getProperty(self, v9, 376, 1);
      }
      else {
        id v13 = 0;
      }
      [v13 handlePluginStatusDidChangeToUpdating:v15];
LABEL_17:
      id v8 = v15;
      break;
    default:
      break;
  }
}

- (void)plugin:(id)a3 didStartWithPID:(int)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  objc_super v10 = ne_log_obj();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (!a4 || v9)
  {
    if (v11)
    {
      int v22 = 138412546;
      v23 = self;
      __int16 v24 = 2112;
      id v25 = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%@: Failed to start with error: %@", (uint8_t *)&v22, 0x16u);
    }

    if (v9)
    {
      __int16 v16 = [v9 domain];
      if ([v16 isEqualToString:@"NEAgentErrorDomain"])
      {
        id v17 = [v9 code];

        if (v17 == (id)2)
        {
          [(NESMSession *)self setLastStopReason:6];
          if (self) {
            id Property = objc_getProperty(self, v18, 376, 1);
          }
          else {
            id Property = 0;
          }
          id v20 = v8;
          uint64_t v21 = 0;
LABEL_21:
          [Property handlePlugin:v20 statusDidChangeToIdleWithError:v21];
          goto LABEL_22;
        }
      }
      else
      {
      }
    }
    if (self) {
      id Property = objc_getProperty(self, v15, 376, 1);
    }
    else {
      id Property = 0;
    }
    id v20 = v8;
    uint64_t v21 = 1;
    goto LABEL_21;
  }
  if (v11)
  {
    int v22 = 138412802;
    v23 = self;
    __int16 v24 = 2112;
    id v25 = v8;
    __int16 v26 = 1024;
    int v27 = a4;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%@: Plugin %@ started with pid %d", (uint8_t *)&v22, 0x1Cu);
  }

  id v12 = v8;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (v12 && (isKindOfClass & 1) != 0)
  {
    [v12 setStatus:1 error:0];
    id v14 = [v12 remotePluginObject];
    [v14 startFilter];
  }
LABEL_22:
}

- (void)pluginDidRequestAgentClientServer:(id)a3
{
  if (self) {
    self->_acceptAgentClients = 1;
  }
}

- (id)pluginDidRequestContentFilterSocket:(id)a3
{
  id v4 = a3;
  if (!self || !self->_controlUnit) {
    goto LABEL_17;
  }
  BOOL v5 = [(NESMSession *)self configuration];
  uint64_t v6 = [v5 externalIdentifier];
  if (v6)
  {
    id v7 = (void *)v6;
    id v8 = [(NESMSession *)self configuration];
    id v9 = [v8 contentFilter];
    objc_super v10 = [v9 perApp];
    BOOL v11 = [v10 appRules];
    id v12 = [v11 count];

    if (!v12) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  uint64_t KernelControlSocket = NEHelperGetKernelControlSocket();
  if (KernelControlSocket == -1)
  {
    __int16 v19 = ne_log_obj();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Failed to create the content filter control socket", buf, 2u);
    }

    goto LABEL_17;
  }
  uint64_t v14 = KernelControlSocket;
  int v15 = NEHelperInterfaceSetOption();
  if (v15)
  {
    int v16 = v15;
    id v17 = ne_log_obj();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v28 = strerror(v16);
      __int16 v18 = "Error setting CFIL_OPT_NECP_CONTROL_UNIT on socket: %s\n";
LABEL_24:
      _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, v18, buf, 0xCu);
      goto LABEL_16;
    }
    goto LABEL_16;
  }
  id v20 = [(NESMSession *)self configuration];
  uint64_t v21 = [v20 contentFilter];
  int v22 = [v21 provider];
  [v22 preserveExistingConnections];

  int v23 = NEHelperInterfaceSetOption();
  if (v23)
  {
    int v24 = v23;
    id v17 = ne_log_obj();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v28 = strerror(v24);
      __int16 v18 = "Error setting CFIL_OPT_PRESERVE_CONNECTIONS on socket: %s\n";
      goto LABEL_24;
    }
LABEL_16:

    close(v14);
LABEL_17:
    id v25 = 0;
    goto LABEL_18;
  }
  if ((v14 & 0x80000000) != 0) {
    goto LABEL_17;
  }
  id v25 = [objc_alloc((Class)NSFileHandle) initWithFileDescriptor:v14 closeOnDealloc:1];
LABEL_18:

  return v25;
}

- (void)pluginDidDispose:(id)a3
{
  id v6 = a3;
  if (self) {
    id Property = objc_getProperty(self, v4, 376, 1);
  }
  else {
    id Property = 0;
  }
  [Property handlePluginDisposeComplete:v6];
}

- (void)handleInstalledAppsChanged
{
  v3 = [(NESMSession *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000754A0;
  block[3] = &unk_1000C6C60;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)handleNetworkDetectionNotification:(int)a3
{
  if ((a3 & 0xFFFFFFFB) == 1)
  {
    block[7] = v3;
    block[8] = v4;
    id v6 = [(NESMSession *)self queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100075600;
    block[3] = &unk_1000C6C60;
    block[4] = self;
    dispatch_async(v6, block);
  }
}

- (void)handleWakeup
{
  if (self)
  {
    self = (NESMFilterSession *)objc_getProperty(self, a2, 376, 1);
    uint64_t v2 = vars8;
  }
  [(NESMFilterSession *)self handleWakeup];
}

- (BOOL)handleSleep
{
  if (self)
  {
    self = (NESMFilterSession *)objc_getProperty(self, a2, 376, 1);
    uint64_t v2 = vars8;
  }
  return [(NESMFilterSession *)self handleSleep];
}

- (void)handleStopMessageWithReason:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (self && a3 != 37)
  {
    self->_externallyStopped = 1;
    objc_setProperty_atomic(self, a2, 0, 416);
  }
  sub_10007576C(self, (const char *)(v3 != 37));
  v7.receiver = self;
  v7.super_class = (Class)NESMFilterSession;
  [(NESMSession *)&v7 handleStopMessageWithReason:v3];
  if (self) {
    id Property = objc_getProperty(self, v5, 376, 1);
  }
  else {
    id Property = 0;
  }
  [Property handleStop];
}

- (void)handleStartMessage:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(NESMSession *)self configuration];
  uint64_t v6 = [v5 externalIdentifier];
  if (!v6)
  {

LABEL_9:
    if (self)
    {
      self->_externallyStopped = 0;
      objc_setProperty_atomic(self, v9, v4, 416);
      sub_10007576C(self, 0);
    }
    v44.receiver = self;
    v44.super_class = (Class)NESMFilterSession;
    [(NESMSession *)&v44 handleStartMessage:v4];
    id v13 = ne_log_obj();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int controlUnit = self->_controlUnit;
      *(_DWORD *)buf = 138412546;
      v46 = self;
      __int16 v47 = 1024;
      unsigned int v48 = controlUnit;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%@: Starting with control unit %u", buf, 0x12u);
    }
    else
    {

      if (!self)
      {
LABEL_15:
        int v16 = xpc_dictionary_get_value(v4, "SessionOptions");
        __int16 v18 = v16;
        if (v16 && xpc_get_type(v16) == (xpc_type_t)&_xpc_type_dictionary && xpc_dictionary_get_BOOL(v18, "test-agent"))
        {
          __int16 v19 = xpc_dictionary_get_remote_connection(v4);
          if (!v19)
          {
LABEL_22:
            int v22 = ne_log_obj();
            if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            {
LABEL_23:

              if (self) {
                id Property = objc_getProperty(self, v23, 376, 1);
              }
              else {
                id Property = 0;
              }
              [Property handleStartMessage:v4];

              goto LABEL_29;
            }
            *(_DWORD *)buf = 136315138;
            v46 = (NESMFilterSession *)"com.apple.private.networkextension.test-control";
            v41 = "Test provider does not have the %s entitlement";
            int v42 = v22;
            uint32_t v43 = 12;
LABEL_39:
            _os_log_error_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_ERROR, v41, buf, v43);
            goto LABEL_23;
          }
          id v20 = (void *)xpc_connection_copy_entitlement_value();
          uint64_t v21 = v20;
          if (!v20 || xpc_get_type(v20) != (xpc_type_t)&_xpc_type_BOOL)
          {

            goto LABEL_22;
          }
          BOOL value = xpc_BOOL_get_value(v21);

          if (!value) {
            goto LABEL_22;
          }
          id v27 = [objc_alloc((Class)NEProcessIdentity) initFromXPCConnection:v19];
          id v29 = v27;
          if (self)
          {
            objc_setProperty_atomic(self, v28, v27, 368);

            if (objc_getProperty(self, v30, 368, 1))
            {
              v31 = xpc_dictionary_get_value(v18, "listener-endpoint");
              unsigned int v32 = v31;
              if (v31 && xpc_get_type(v31) == (xpc_type_t)&_xpc_type_endpoint)
              {
                int v33 = [NETestAgent alloc];
                v34 = [(NESMSession *)self configuration];
                v35 = [v34 pluginType];
                unsigned int v36 = sub_100068368((id *)&v33->super.super.isa, v35, 4, v4);

                if (v36)
                {
                  v37 = [NEFilterPlugin alloc];
                  v38 = [(NESMSession *)self queue];
                  v39 = [(NEPlugin *)v37 initWithAgent:v36 delegateQueue:v38 andDelegate:self];
                  objc_setProperty_atomic(self, v40, v39, 400);
                }
                else
                {
                  v38 = ne_log_obj();
                  if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_error_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "Failed to create a test agent", buf, 2u);
                  }
                }
              }
              goto LABEL_27;
            }
          }
          else
          {
          }
          int v22 = ne_log_obj();
          if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
            goto LABEL_23;
          }
          *(_WORD *)buf = 0;
          v41 = "Failed to create a process identity from the session connection";
          int v42 = v22;
          uint32_t v43 = 2;
          goto LABEL_39;
        }
        if (!self)
        {
          id v25 = 0;
          goto LABEL_28;
        }
LABEL_27:
        id v25 = objc_getProperty(self, v17, 376, 1);
LABEL_28:
        [v25 handleStartMessage:v4];
LABEL_29:

        goto LABEL_30;
      }
    }
    objc_setProperty_atomic(self, v15, 0, 368);
    goto LABEL_15;
  }
  objc_super v7 = (void *)v6;
  unsigned int v8 = [(NESMFilterSession *)self waitForPerApp];

  if (!v8) {
    goto LABEL_9;
  }
  objc_super v10 = ne_log_obj();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v46 = self;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%@: Ignore Start for perApp Content Filter - no appRule or app not installed", buf, 0xCu);
  }

  if (self) {
    id v12 = objc_getProperty(self, v11, 376, 1);
  }
  else {
    id v12 = 0;
  }
  [v12 handleStop];
LABEL_30:
}

- (void)handleInitializeState
{
}

- (BOOL)hasProviderWithBundleIdentifier:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(NESMSession *)self configuration];
  uint64_t v6 = [v5 contentFilter];
  objc_super v7 = [v6 provider];
  unsigned int v8 = [v7 filterDataProviderBundleIdentifier];

  id v9 = [(NESMSession *)self configuration];
  objc_super v10 = [v9 contentFilter];
  BOOL v11 = [v10 provider];
  id v12 = [v11 filterPacketProviderBundleIdentifier];

  if (v8 && ([v4 isEqualToString:v8] & 1) != 0)
  {
    unsigned __int8 v13 = 1;
  }
  else if (v12)
  {
    unsigned __int8 v13 = [v4 isEqualToString:v12];
  }
  else
  {
    unsigned __int8 v13 = 0;
  }

  return v13;
}

- (int)type
{
  return 4;
}

- (NESMFilterSession)initWithConfiguration:(id)a3 andServer:(id)a4
{
  id v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NESMFilterSession;
  objc_super v7 = [(NESMSession *)&v13 initWithConfiguration:v6 andServer:a4];
  unsigned int v8 = v7;
  if (v7)
  {
    v7->_state = 0;
    v7->_externallyStopped = 0;
    v7->_restartIntervalMsecs = 500;
    v7->_restartIntervalAttempts = 0;
    id v9 = [NESMPolicySession alloc];
    objc_super v10 = [v6 identifier];
    id v11 = [v6 grade];
    if (v9) {
      id v9 = (NESMPolicySession *)sub_100031564((id *)&v9->super.isa, v10, 4, v11, (void *)1, (void *)1);
    }
    [(NESMSession *)v8 setPolicySession:v9];

    sub_10007FEB0(v8);
  }

  return v8;
}

@end