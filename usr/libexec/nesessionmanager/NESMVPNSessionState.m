@interface NESMVPNSessionState
+ (NESMVPNSessionState)stateWithType:(int64_t)a3;
- (BOOL)canSleep;
- (BOOL)handleClearConfiguration;
- (BOOL)handleSetConfiguration;
- (BOOL)handleSleep;
- (NESMVPNSessionState)initWithType:(int64_t)a3 andTimeout:(unint64_t)a4;
- (int64_t)type;
- (void)enterWithSession:(id)a3;
- (void)handleClearConfigurationResult:(BOOL)a3;
- (void)handleEstablishIPC;
- (void)handleEstablishIPCReplySent;
- (void)handleInterfaceAvailable:(id)a3 changed:(BOOL)a4;
- (void)handleInterfaceUnavailable:(id)a3;
- (void)handlePlugin:(id)a3 authenticationCompleteWithResults:(id)a4 status:(int)a5 andError:(id)a6;
- (void)handlePlugin:(id)a3 didAttachIPCWithEndpoint:(id)a4;
- (void)handlePlugin:(id)a3 didStartWithPID:(int)a4 error:(id)a5;
- (void)handlePlugin:(id)a3 statusDidChangeToDisconnectedWithReason:(int)a4;
- (void)handlePlugin:(id)a3 statusDidChangeToDisconnectingWithReason:(int)a4;
- (void)handlePluginDidDetachIPC:(id)a3;
- (void)handlePluginDisposeComplete:(id)a3;
- (void)handlePluginStatusDidChangeToAuthenticating:(id)a3;
- (void)handlePluginStatusDidChangeToConnected:(id)a3;
- (void)handlePluginStatusDidChangeToContacting:(id)a3;
- (void)handlePluginStatusDidChangeToNegotiating:(id)a3;
- (void)handlePluginStatusDidChangeToReasserting:(id)a3;
- (void)handlePluginStatusDidChangeToUpdating:(id)a3;
- (void)handleSetConfigurationResult:(BOOL)a3;
- (void)handleStartMessage:(id)a3;
- (void)handleStop;
- (void)handleTimeout;
- (void)handleUpdateConfiguration;
- (void)handleUserLogout;
- (void)handleUserSwitch;
- (void)handleWakeup;
- (void)leave;
@end

@implementation NESMVPNSessionState

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);

  objc_storeStrong((id *)&self->_session, 0);
}

- (int64_t)type
{
  return self->_type;
}

- (void)handlePluginStatusDidChangeToUpdating:(id)a3
{
  id v4 = a3;
  v5 = ne_log_obj();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    if (self) {
      id Property = objc_getProperty(self, v6, 16, 1);
    }
    else {
      id Property = 0;
    }
    v8 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v8);
    int v12 = 138412802;
    id v13 = Property;
    __int16 v14 = 2112;
    v15 = v9;
    __int16 v16 = 2112;
    id v17 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ in state %@: plugin %@ status changed to updating", (uint8_t *)&v12, 0x20u);
  }
  if (self) {
    id v11 = objc_getProperty(self, v10, 16, 1);
  }
  else {
    id v11 = 0;
  }
  [v11 setState:9];
}

- (void)handleUpdateConfiguration
{
  v3 = ne_log_obj();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    if (self) {
      id Property = objc_getProperty(self, v4, 16, 1);
    }
    else {
      id Property = 0;
    }
    v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    int v15 = 138412546;
    id v16 = Property;
    __int16 v17 = 2112;
    v18 = v7;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%@ in state %@: update configuration", (uint8_t *)&v15, 0x16u);
  }
  if (self)
  {
    [objc_getProperty(self, v8, 16, 1) prepareConfigurationForStart];
    id v10 = objc_getProperty(self, v9, 16, 1);
  }
  else
  {
    [0 prepareConfigurationForStart];
    id v10 = 0;
  }
  int v12 = [v10 primaryTunnelPlugin];
  if (self) {
    id v13 = objc_getProperty(self, v11, 16, 1);
  }
  else {
    id v13 = 0;
  }
  __int16 v14 = [v13 configuration];
  sub_100017EFC(v12, v14);
}

- (void)handleClearConfigurationResult:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = ne_log_obj();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    if (self) {
      id Property = objc_getProperty(self, v6, 16, 1);
    }
    else {
      id Property = 0;
    }
    v8 = (objc_class *)objc_opt_class();
    SEL v9 = NSStringFromClass(v8);
    int v12 = 138412802;
    id v13 = Property;
    __int16 v14 = 2112;
    int v15 = v9;
    __int16 v16 = 1024;
    BOOL v17 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ in state %@: clear configuration completed with result %d", (uint8_t *)&v12, 0x1Cu);
  }
  if (self) {
    id v11 = objc_getProperty(self, v10, 16, 1);
  }
  else {
    id v11 = 0;
  }
  [v11 notifyChangedExtendedStatus];
}

- (BOOL)handleClearConfiguration
{
  BOOL v3 = ne_log_obj();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    if (self) {
      id Property = objc_getProperty(self, v4, 16, 1);
    }
    else {
      id Property = 0;
    }
    v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    int v11 = 138412546;
    id v12 = Property;
    __int16 v13 = 2112;
    __int16 v14 = v7;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%@ in state %@: clear configuration started", (uint8_t *)&v11, 0x16u);
  }
  if (self) {
    id v9 = objc_getProperty(self, v8, 16, 1);
  }
  else {
    id v9 = 0;
  }
  [v9 requestUninstall];
  return 1;
}

- (void)handleSetConfigurationResult:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = ne_log_obj();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    if (self) {
      id Property = objc_getProperty(self, v6, 16, 1);
    }
    else {
      id Property = 0;
    }
    v8 = (objc_class *)objc_opt_class();
    id v9 = NSStringFromClass(v8);
    int v12 = 138412802;
    id v13 = Property;
    __int16 v14 = 2112;
    int v15 = v9;
    __int16 v16 = 1024;
    BOOL v17 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ in state %@: set configuration completed with result %d", (uint8_t *)&v12, 0x1Cu);
  }
  if (self) {
    id v11 = objc_getProperty(self, v10, 16, 1);
  }
  else {
    id v11 = 0;
  }
  [v11 notifyChangedExtendedStatus];
}

- (BOOL)handleSetConfiguration
{
  BOOL v3 = ne_log_obj();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    if (self) {
      id Property = objc_getProperty(self, v4, 16, 1);
    }
    else {
      id Property = 0;
    }
    v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    int v11 = 138412546;
    id v12 = Property;
    __int16 v13 = 2112;
    __int16 v14 = v7;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%@ in state %@: set configuration started", (uint8_t *)&v11, 0x16u);
  }
  if (self) {
    id v9 = objc_getProperty(self, v8, 16, 1);
  }
  else {
    id v9 = 0;
  }
  [v9 requestInstall];
  return 1;
}

- (void)handleUserLogout
{
  BOOL v3 = ne_log_obj();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    if (self) {
      id Property = objc_getProperty(self, v4, 16, 1);
    }
    else {
      id Property = 0;
    }
    v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    int v8 = 138412546;
    id v9 = Property;
    __int16 v10 = 2112;
    int v11 = v7;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%@ in state %@: console user logout", (uint8_t *)&v8, 0x16u);
  }
}

- (void)handleUserSwitch
{
  BOOL v3 = ne_log_obj();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    if (self) {
      id Property = objc_getProperty(self, v4, 16, 1);
    }
    else {
      id Property = 0;
    }
    v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    int v8 = 138412546;
    id v9 = Property;
    __int16 v10 = 2112;
    int v11 = v7;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%@ in state %@: console user switch", (uint8_t *)&v8, 0x16u);
  }
}

- (void)handleTimeout
{
  BOOL v3 = ne_log_obj();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    if (self) {
      id Property = objc_getProperty(self, v4, 16, 1);
    }
    else {
      id Property = 0;
    }
    v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    int v8 = 138412546;
    id v9 = Property;
    __int16 v10 = 2112;
    int v11 = v7;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%@ in state %@: timed out", (uint8_t *)&v8, 0x16u);
  }
}

- (void)handleWakeup
{
  BOOL v3 = ne_log_obj();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    if (self) {
      id Property = objc_getProperty(self, v4, 16, 1);
    }
    else {
      id Property = 0;
    }
    v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    int v19 = 138412546;
    id v20 = Property;
    __int16 v21 = 2112;
    v22 = v7;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%@ in state %@: received wake event", (uint8_t *)&v19, 0x16u);
  }
  if (self) {
    id v9 = objc_getProperty(self, v8, 16, 1);
  }
  else {
    id v9 = 0;
  }
  uint64_t v10 = [v9 primaryTunnelPlugin];
  if (v10)
  {
    id v12 = (void *)v10;
    id v13 = self ? objc_getProperty(self, v11, 16, 1) : 0;
    __int16 v14 = [v13 primaryTunnelPlugin];
    unsigned int v15 = sub_100018330(v14);

    if (v15)
    {
      if (self) {
        id v17 = objc_getProperty(self, v16, 16, 1);
      }
      else {
        id v17 = 0;
      }
      v18 = [v17 primaryTunnelPlugin];
      sub_1000182B0(v18);
    }
  }
}

- (BOOL)canSleep
{
  BOOL v3 = ne_log_obj();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    if (self) {
      id Property = objc_getProperty(self, v4, 16, 1);
    }
    else {
      id Property = 0;
    }
    v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    int v9 = 138412546;
    id v10 = Property;
    __int16 v11 = 2112;
    id v12 = v7;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%@ in state %@: received can sleep query", (uint8_t *)&v9, 0x16u);
  }
  return 1;
}

- (BOOL)handleSleep
{
  BOOL v3 = ne_log_obj();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    if (self) {
      id Property = objc_getProperty(self, v4, 16, 1);
    }
    else {
      id Property = 0;
    }
    v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    int v25 = 138412546;
    id v26 = Property;
    __int16 v27 = 2112;
    v28 = v7;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%@ in state %@: received sleep event", (uint8_t *)&v25, 0x16u);
  }
  if (self) {
    id v9 = objc_getProperty(self, v8, 16, 1);
  }
  else {
    id v9 = 0;
  }
  uint64_t v10 = [v9 primaryTunnelPlugin];
  if (v10
    && ((id v12 = (void *)v10, !self) ? (v13 = 0) : (v13 = objc_getProperty(self, v11, 16, 1)),
        [v13 primaryTunnelPlugin],
        __int16 v14 = (unsigned int *)objc_claimAutoreleasedReturnValue(),
        unsigned int v15 = sub_100018330(v14),
        v14,
        v12,
        v15))
  {
    if (self) {
      id v16 = objc_getProperty(self, v11, 16, 1);
    }
    else {
      id v16 = 0;
    }
    id v17 = [v16 primaryTunnelPlugin];
    sub_100017F64(v17);
  }
  else
  {
    if (self) {
      id v18 = objc_getProperty(self, v11, 16, 1);
    }
    else {
      id v18 = 0;
    }
    if ([v18 parentType] == (id)2)
    {
      if (self) {
        id v20 = objc_getProperty(self, v19, 16, 1);
      }
      else {
        id v20 = 0;
      }
      id v17 = [v20 parent];
      if (self) {
        objc_getProperty(self, v21, 16, 1);
      }
      sub_10008C1B8(v17);
    }
    else
    {
      if (self) {
        id v22 = objc_getProperty(self, v19, 16, 1);
      }
      else {
        id v22 = 0;
      }
      id v17 = [v22 server];
      sub_1000556BC(v17, v23);
    }
  }

  return 1;
}

- (void)handlePluginDidDetachIPC:(id)a3
{
  id v4 = a3;
  v5 = ne_log_obj();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    if (self) {
      id Property = objc_getProperty(self, v6, 16, 1);
    }
    else {
      id Property = 0;
    }
    int v8 = (objc_class *)objc_opt_class();
    id v9 = NSStringFromClass(v8);
    int v14 = 138412802;
    id v15 = Property;
    __int16 v16 = 2112;
    id v17 = v9;
    __int16 v18 = 2112;
    id v19 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ in state %@: plugin %@ did detach from IPC", (uint8_t *)&v14, 0x20u);
  }
  if (!self)
  {
    unsigned __int8 v13 = [0 establishIPCPending];
    id v12 = 0;
    if ((v13 & 1) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  if (objc_msgSend(objc_getProperty(self, v10, 16, 1), "establishIPCPending"))
  {
    id v12 = objc_getProperty(self, v11, 16, 1);
LABEL_8:
    [v12 sendEstablishIPCReply];
  }
LABEL_9:
}

- (void)handlePluginDisposeComplete:(id)a3
{
  id v4 = a3;
  v5 = ne_log_obj();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    if (self) {
      id Property = objc_getProperty(self, v6, 16, 1);
    }
    else {
      id Property = 0;
    }
    int v8 = (objc_class *)objc_opt_class();
    id v9 = NSStringFromClass(v8);
    int v14 = 138412802;
    id v15 = Property;
    __int16 v16 = 2112;
    id v17 = v9;
    __int16 v18 = 2112;
    id v19 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ in state %@: plugin %@ dispose complete", (uint8_t *)&v14, 0x20u);
  }
  if (!self)
  {
    unsigned __int8 v13 = [0 establishIPCPending];
    id v12 = 0;
    if ((v13 & 1) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  if (objc_msgSend(objc_getProperty(self, v10, 16, 1), "establishIPCPending"))
  {
    id v12 = objc_getProperty(self, v11, 16, 1);
LABEL_8:
    [v12 sendEstablishIPCReply];
  }
LABEL_9:
}

- (void)handlePlugin:(id)a3 authenticationCompleteWithResults:(id)a4 status:(int)a5 andError:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  unsigned __int8 v13 = ne_log_obj();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    if (self) {
      id Property = objc_getProperty(self, v14, 16, 1);
    }
    else {
      id Property = 0;
    }
    __int16 v16 = (objc_class *)objc_opt_class();
    id v17 = NSStringFromClass(v16);
    int v18 = 138413570;
    id v19 = Property;
    __int16 v20 = 2112;
    __int16 v21 = v17;
    __int16 v22 = 2112;
    id v23 = v10;
    __int16 v24 = 2048;
    id v25 = v11;
    __int16 v26 = 1024;
    int v27 = a5;
    __int16 v28 = 2112;
    id v29 = v12;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%@ in state %@: plugin %@ authentication is complete with results %p, status %d, error %@", (uint8_t *)&v18, 0x3Au);
  }
}

- (void)handlePlugin:(id)a3 statusDidChangeToDisconnectingWithReason:(int)a4
{
  id v5 = a3;
  v6 = ne_log_obj();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    if (self) {
      id Property = objc_getProperty(self, v7, 16, 1);
    }
    else {
      id Property = 0;
    }
    id v9 = (objc_class *)objc_opt_class();
    id v10 = NSStringFromClass(v9);
    int v13 = 138413058;
    id v14 = Property;
    __int16 v15 = 2112;
    __int16 v16 = v10;
    __int16 v17 = 2112;
    id v18 = v5;
    __int16 v19 = 2080;
    uint64_t v20 = ne_session_stop_reason_to_string();
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@ in state %@: plugin %@ status changed to disconnecting with reason %s", (uint8_t *)&v13, 0x2Au);
  }
  if (self) {
    id v12 = objc_getProperty(self, v11, 16, 1);
  }
  else {
    id v12 = 0;
  }
  [v12 setState:5];
}

- (void)handlePluginStatusDidChangeToReasserting:(id)a3
{
  id v4 = a3;
  id v5 = ne_log_obj();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    if (self) {
      id Property = objc_getProperty(self, v6, 16, 1);
    }
    else {
      id Property = 0;
    }
    int v8 = (objc_class *)objc_opt_class();
    id v9 = NSStringFromClass(v8);
    int v12 = 138412802;
    id v13 = Property;
    __int16 v14 = 2112;
    __int16 v15 = v9;
    __int16 v16 = 2112;
    id v17 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ in state %@: plugin %@ status changed to reasserting", (uint8_t *)&v12, 0x20u);
  }
  if (self) {
    id v11 = objc_getProperty(self, v10, 16, 1);
  }
  else {
    id v11 = 0;
  }
  [v11 setReassertedByPlugin:1];
}

- (void)handlePluginStatusDidChangeToConnected:(id)a3
{
  id v4 = a3;
  id v5 = ne_log_obj();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    if (self) {
      id Property = objc_getProperty(self, v6, 16, 1);
    }
    else {
      id Property = 0;
    }
    int v8 = (objc_class *)objc_opt_class();
    id v9 = NSStringFromClass(v8);
    int v12 = 138412802;
    id v13 = Property;
    __int16 v14 = 2112;
    __int16 v15 = v9;
    __int16 v16 = 2112;
    id v17 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ in state %@: plugin %@ status changed to connected", (uint8_t *)&v12, 0x20u);
  }
  if (self) {
    id v11 = objc_getProperty(self, v10, 16, 1);
  }
  else {
    id v11 = 0;
  }
  [v11 setReassertedByPlugin:0];
}

- (void)handlePluginStatusDidChangeToNegotiating:(id)a3
{
  id v4 = a3;
  id v5 = ne_log_obj();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    if (self) {
      id Property = objc_getProperty(self, v6, 16, 1);
    }
    else {
      id Property = 0;
    }
    int v8 = (objc_class *)objc_opt_class();
    id v9 = NSStringFromClass(v8);
    int v10 = 138412802;
    id v11 = Property;
    __int16 v12 = 2112;
    id v13 = v9;
    __int16 v14 = 2112;
    id v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ in state %@: plugin %@ status changed to negotiating", (uint8_t *)&v10, 0x20u);
  }
}

- (void)handlePluginStatusDidChangeToAuthenticating:(id)a3
{
  id v4 = a3;
  id v5 = ne_log_obj();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    if (self) {
      id Property = objc_getProperty(self, v6, 16, 1);
    }
    else {
      id Property = 0;
    }
    int v8 = (objc_class *)objc_opt_class();
    id v9 = NSStringFromClass(v8);
    int v10 = 138412802;
    id v11 = Property;
    __int16 v12 = 2112;
    id v13 = v9;
    __int16 v14 = 2112;
    id v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ in state %@: plugin %@ status changed to authenticating", (uint8_t *)&v10, 0x20u);
  }
}

- (void)handlePluginStatusDidChangeToContacting:(id)a3
{
  id v4 = a3;
  id v5 = ne_log_obj();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    if (self) {
      id Property = objc_getProperty(self, v6, 16, 1);
    }
    else {
      id Property = 0;
    }
    int v8 = (objc_class *)objc_opt_class();
    id v9 = NSStringFromClass(v8);
    int v10 = 138412802;
    id v11 = Property;
    __int16 v12 = 2112;
    id v13 = v9;
    __int16 v14 = 2112;
    id v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ in state %@: plugin %@ status changed to contacting", (uint8_t *)&v10, 0x20u);
  }
}

- (void)handlePlugin:(id)a3 statusDidChangeToDisconnectedWithReason:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  v7 = ne_log_obj();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    if (self) {
      id Property = objc_getProperty(self, v8, 16, 1);
    }
    else {
      id Property = 0;
    }
    int v10 = (objc_class *)objc_opt_class();
    id v11 = NSStringFromClass(v10);
    int v21 = 138413058;
    id v22 = Property;
    __int16 v23 = 2112;
    __int16 v24 = v11;
    __int16 v25 = 2112;
    id v26 = v6;
    __int16 v27 = 2080;
    uint64_t v28 = ne_session_stop_reason_to_string();
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@ in state %@: plugin %@ disconnected with reason %s", (uint8_t *)&v21, 0x2Au);
  }
  if (self) {
    id v13 = objc_getProperty(self, v12, 16, 1);
  }
  else {
    id v13 = 0;
  }
  [v13 setLastStopReason:v4];
  if (v4 == 6)
  {
    id v15 = ne_log_obj();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      if (self) {
        id v17 = objc_getProperty(self, v16, 16, 1);
      }
      else {
        id v17 = 0;
      }
      int v21 = 138412290;
      id v22 = v17;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%@ re-setting on demand configuration because the plugin was disabled", (uint8_t *)&v21, 0xCu);
    }

    if (self) {
      id v19 = objc_getProperty(self, v18, 16, 1);
    }
    else {
      id v19 = 0;
    }
    sub_10008088C((uint64_t)v19, 1);
  }
  if (self) {
    id v20 = objc_getProperty(self, v14, 16, 1);
  }
  else {
    id v20 = 0;
  }
  [v20 setState:5];
}

- (void)handlePlugin:(id)a3 didAttachIPCWithEndpoint:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = ne_log_obj();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    if (self) {
      id Property = objc_getProperty(self, v9, 16, 1);
    }
    else {
      id Property = 0;
    }
    id v11 = (objc_class *)objc_opt_class();
    __int16 v12 = NSStringFromClass(v11);
    int v21 = 138413058;
    id v22 = Property;
    __int16 v23 = 2112;
    __int16 v24 = v12;
    __int16 v25 = 2112;
    id v26 = v6;
    __int16 v27 = 2048;
    id v28 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%@ in state %@: plugin %@ attached IPC with endpoint %p", (uint8_t *)&v21, 0x2Au);
  }
  if (self)
  {
    if (!objc_msgSend(objc_getProperty(self, v13, 16, 1), "establishIPCPending")) {
      goto LABEL_16;
    }
    id v15 = objc_getProperty(self, v14, 16, 1);
  }
  else
  {
    unsigned __int8 v20 = [0 establishIPCPending];
    id v15 = 0;
    if ((v20 & 1) == 0) {
      goto LABEL_16;
    }
  }
  id v16 = [v15 primaryTunnelPlugin];

  if (v16 == v6)
  {
    if (v7)
    {
      if (self) {
        id v18 = objc_getProperty(self, v17, 16, 1);
      }
      else {
        id v18 = 0;
      }
      [v18 setEndpointInEstablishIPCReply:v7 forPlugin:v6];
    }
    else
    {
      if (self) {
        id v19 = objc_getProperty(self, v17, 16, 1);
      }
      else {
        id v19 = 0;
      }
      [v19 sendEstablishIPCReply];
    }
  }
LABEL_16:
}

- (void)handlePlugin:(id)a3 didStartWithPID:(int)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  int v10 = ne_log_obj();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    if (self) {
      id Property = objc_getProperty(self, v11, 16, 1);
    }
    else {
      id Property = 0;
    }
    id v13 = (objc_class *)objc_opt_class();
    __int16 v14 = NSStringFromClass(v13);
    int v15 = 138413314;
    id v16 = Property;
    __int16 v17 = 2112;
    id v18 = v14;
    __int16 v19 = 2112;
    id v20 = v8;
    __int16 v21 = 1024;
    int v22 = a4;
    __int16 v23 = 2112;
    id v24 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%@ in state %@: plugin %@ started with PID %d error %@", (uint8_t *)&v15, 0x30u);
  }
}

- (void)handleInterfaceAvailable:(id)a3 changed:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = ne_log_obj();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    if (self) {
      id Property = objc_getProperty(self, v8, 16, 1);
    }
    else {
      id Property = 0;
    }
    int v10 = (objc_class *)objc_opt_class();
    uint64_t v11 = NSStringFromClass(v10);
    __int16 v12 = (void *)v11;
    id v13 = "did not change";
    int v14 = 138413058;
    id v15 = Property;
    __int16 v16 = 2112;
    if (v4) {
      id v13 = "changed";
    }
    uint64_t v17 = v11;
    __int16 v18 = 2112;
    id v19 = v6;
    __int16 v20 = 2080;
    __int16 v21 = v13;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@ in state %@: interface %@ is now available, address %s", (uint8_t *)&v14, 0x2Au);
  }
}

- (void)handleInterfaceUnavailable:(id)a3
{
  id v4 = a3;
  id v5 = ne_log_obj();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    if (self) {
      id Property = objc_getProperty(self, v6, 16, 1);
    }
    else {
      id Property = 0;
    }
    id v8 = (objc_class *)objc_opt_class();
    id v9 = NSStringFromClass(v8);
    int v10 = 138412802;
    id v11 = Property;
    __int16 v12 = 2112;
    id v13 = v9;
    __int16 v14 = 2112;
    id v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ in state %@: interface %@ is now unavailable", (uint8_t *)&v10, 0x20u);
  }
}

- (void)handleStop
{
  BOOL v3 = ne_log_obj();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    if (self) {
      id Property = objc_getProperty(self, v4, 16, 1);
    }
    else {
      id Property = 0;
    }
    id v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    int v10 = 138412546;
    id v11 = Property;
    __int16 v12 = 2112;
    id v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%@ in state %@: received stop message", (uint8_t *)&v10, 0x16u);
  }
  if (self) {
    id v9 = objc_getProperty(self, v8, 16, 1);
  }
  else {
    id v9 = 0;
  }
  [v9 setState:5];
}

- (void)handleEstablishIPCReplySent
{
  BOOL v3 = ne_log_obj();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    if (self) {
      id Property = objc_getProperty(self, v4, 16, 1);
    }
    else {
      id Property = 0;
    }
    id v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    int v8 = 138412546;
    id v9 = Property;
    __int16 v10 = 2112;
    id v11 = v7;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%@ in state %@: sent establish IPC reply", (uint8_t *)&v8, 0x16u);
  }
}

- (void)handleEstablishIPC
{
  BOOL v3 = ne_log_obj();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    if (self) {
      id Property = objc_getProperty(self, v4, 16, 1);
    }
    else {
      id Property = 0;
    }
    id v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    int v18 = 138412546;
    id v19 = Property;
    __int16 v20 = 2112;
    __int16 v21 = v7;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%@ in state %@: received establish IPC message", (uint8_t *)&v18, 0x16u);
  }
  if (self) {
    id v9 = objc_getProperty(self, v8, 16, 1);
  }
  else {
    id v9 = 0;
  }
  uint64_t v10 = [v9 primaryTunnelPlugin];
  if (v10)
  {
    __int16 v12 = (void *)v10;
    if (self) {
      id v13 = objc_getProperty(self, v11, 16, 1);
    }
    else {
      id v13 = 0;
    }
    __int16 v14 = [v13 primaryTunnelPlugin];
    if (v14)
    {
      char v15 = v14[16];

      if ((v15 & 1) == 0) {
        return;
      }
      if (self) {
        id v17 = objc_getProperty(self, v16, 16, 1);
      }
      else {
        id v17 = 0;
      }
      __int16 v12 = [v17 primaryTunnelPlugin];
      sub_100018644(v12);
    }
  }
}

- (void)handleStartMessage:(id)a3
{
  id v4 = ne_log_obj();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    if (self) {
      id Property = objc_getProperty(self, v5, 16, 1);
    }
    else {
      id Property = 0;
    }
    id v7 = (objc_class *)objc_opt_class();
    int v8 = NSStringFromClass(v7);
    int v9 = 138412546;
    id v10 = Property;
    __int16 v11 = 2112;
    __int16 v12 = v8;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@ in state %@: received start message", (uint8_t *)&v9, 0x16u);
  }
}

- (void)leave
{
  BOOL v3 = ne_log_obj();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    if (self) {
      id Property = objc_getProperty(self, v4, 16, 1);
    }
    else {
      id Property = 0;
    }
    id v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    int v12 = 138412546;
    id v13 = Property;
    __int16 v14 = 2112;
    char v15 = v7;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%@: Leaving state %@", (uint8_t *)&v12, 0x16u);
  }
  if (self)
  {
    if (objc_getProperty(self, v8, 32, 1))
    {
      id v10 = objc_getProperty(self, v9, 32, 1);
      dispatch_source_cancel(v10);
      objc_setProperty_atomic(self, v11, 0, 32);
    }
    objc_setProperty_atomic(self, v9, 0, 16);
  }
}

- (void)enterWithSession:(id)a3
{
  id v5 = a3;
  if (self)
  {
    objc_setProperty_atomic(self, v4, v5, 16);
    if (self->_timeout)
    {
      id v6 = ne_log_obj();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        id v7 = (objc_class *)objc_opt_class();
        int v8 = NSStringFromClass(v7);
        unint64_t timeout = self->_timeout;
        *(_DWORD *)buf = 138412802;
        id v18 = v5;
        __int16 v19 = 2112;
        __int16 v20 = v8;
        __int16 v21 = 2048;
        unint64_t v22 = timeout;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@: Entering state %@, timeout %llu seconds", buf, 0x20u);
      }
LABEL_9:
      if (self->_timeout && (objc_opt_respondsToSelector() & 1) != 0)
      {
        id v13 = [v5 queue];
        id v16 = v5;
        __int16 v14 = NECreateTimerSource();
        objc_setProperty_atomic(self, v15, v14, 32);
      }
      goto LABEL_12;
    }
  }
  id v10 = ne_log_obj();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    SEL v11 = (objc_class *)objc_opt_class();
    int v12 = NSStringFromClass(v11);
    *(_DWORD *)buf = 138412546;
    id v18 = v5;
    __int16 v19 = 2112;
    __int16 v20 = v12;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%@: Entering state %@", buf, 0x16u);
  }
  if (self) {
    goto LABEL_9;
  }
LABEL_12:
}

- (NESMVPNSessionState)initWithType:(int64_t)a3 andTimeout:(unint64_t)a4
{
  v10.receiver = self;
  v10.super_class = (Class)NESMVPNSessionState;
  id v6 = [(NESMVPNSessionState *)&v10 init];
  id v7 = v6;
  if (v6)
  {
    session = v6->_session;
    v6->_type = a3;
    v6->_session = 0;
    v6->_unint64_t timeout = a4;
  }
  return v7;
}

+ (NESMVPNSessionState)stateWithType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 9)
  {
    id v4 = 0;
  }
  else
  {
    id v4 = objc_alloc_init(*(&off_1000C6448)[a3 - 1]);
  }
  return (NESMVPNSessionState *)v4;
}

@end