@interface NESMVPNSessionStateStopping
- (BOOL)handleClearConfiguration;
- (BOOL)handleSetConfiguration;
- (NESMVPNSessionStateStopping)init;
- (void)enterWithSession:(id)a3;
- (void)handleClearConfigurationResult:(BOOL)a3;
- (void)handleEstablishIPC;
- (void)handlePlugin:(id)a3 didStartWithPID:(int)a4 error:(id)a5;
- (void)handlePlugin:(id)a3 statusDidChangeToDisconnectedWithReason:(int)a4;
- (void)handleSetConfigurationResult:(BOOL)a3;
- (void)handleTimeout;
@end

@implementation NESMVPNSessionStateStopping

- (void)handlePlugin:(id)a3 didStartWithPID:(int)a4 error:(id)a5
{
  v5.receiver = self;
  v5.super_class = (Class)NESMVPNSessionStateStopping;
  [(NESMVPNSessionState *)&v5 handlePlugin:a3 didStartWithPID:0 error:a5];
}

- (void)handleEstablishIPC
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
    int v10 = 138412546;
    id v11 = Property;
    __int16 v12 = 2112;
    v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%@ in state %@: received establish IPC message", (uint8_t *)&v10, 0x16u);
  }
  if (self) {
    id v9 = objc_getProperty(self, v8, 16, 1);
  }
  else {
    id v9 = 0;
  }
  [v9 sendEstablishIPCReply];
}

- (void)handleTimeout
{
  v5.receiver = self;
  v5.super_class = (Class)NESMVPNSessionStateStopping;
  [(NESMVPNSessionState *)&v5 handleTimeout];
  if (self) {
    id Property = objc_getProperty(self, v3, 16, 1);
  }
  else {
    id Property = 0;
  }
  [Property setState:8];
}

- (void)handlePlugin:(id)a3 statusDidChangeToDisconnectedWithReason:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  v19.receiver = self;
  v19.super_class = (Class)NESMVPNSessionStateStopping;
  -[NESMVPNSessionState handlePlugin:statusDidChangeToDisconnectedWithReason:](&v19, "handlePlugin:statusDidChangeToDisconnectedWithReason:", a3);
  if (self) {
    id Property = objc_getProperty(self, v6, 16, 1);
  }
  else {
    id Property = 0;
  }
  [Property setLastStopReason:v4];
  v8 = ne_log_obj();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    if (self) {
      id v10 = objc_getProperty(self, v9, 16, 1);
    }
    else {
      id v10 = 0;
    }
    id v11 = (objc_class *)objc_opt_class();
    __int16 v12 = NSStringFromClass(v11);
    *(_DWORD *)buf = 138412546;
    id v21 = v10;
    __int16 v22 = 2112;
    v23 = v12;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%@ in state %@: plugin set status to disconnected", buf, 0x16u);
  }
  if (self && self->_isUninstalled)
  {
    v13 = ne_log_obj();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = objc_getProperty(self, v14, 16, 1);
      v16 = (objc_class *)objc_opt_class();
      v17 = NSStringFromClass(v16);
      *(_DWORD *)buf = 138412546;
      id v21 = v15;
      __int16 v22 = 2112;
      v23 = v17;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%@ in state %@: disposing all plugins", buf, 0x16u);
    }
    [objc_getProperty(self, v18, 16, 1) setState:8];
  }
}

- (void)handleClearConfigurationResult:(BOOL)a3
{
  uint64_t v4 = ne_log_obj();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    if (self) {
      id Property = objc_getProperty(self, v5, 16, 1);
    }
    else {
      id Property = 0;
    }
    v7 = (objc_class *)objc_opt_class();
    v8 = NSStringFromClass(v7);
    int v47 = 138412546;
    id v48 = Property;
    __int16 v49 = 2112;
    v50 = v8;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@ in state %@: session is now uninstalled", (uint8_t *)&v47, 0x16u);
  }
  if (self)
  {
    [objc_getProperty(self, v9, 16, 1) setPluginConfigurationEntities:];
    self->_isUninstalled = 1;
    id v11 = objc_getProperty(self, v10, 16, 1);
  }
  else
  {
    [0 setPluginConfigurationEntities:0];
    id v11 = 0;
  }
  if ([v11 virtualInterface])
  {
    if (self)
    {
      [objc_getProperty(self, v12, 16, 1) virtualInterface];
      NEVirtualInterfaceInvalidate();
      id v14 = objc_getProperty(self, v13, 16, 1);
    }
    else
    {
      [0 virtualInterface];
      NEVirtualInterfaceInvalidate();
      id v14 = 0;
    }
    CFRelease([v14 virtualInterface]);
    if (self) {
      id v16 = objc_getProperty(self, v15, 16, 1);
    }
    else {
      id v16 = 0;
    }
    [v16 setVirtualInterface:0];
  }
  if (self) {
    id v17 = objc_getProperty(self, v12, 16, 1);
  }
  else {
    id v17 = 0;
  }
  uint64_t v18 = [v17 primaryTunnelPlugin];
  v20 = (void *)v18;
  if (v18 && *(_DWORD *)(v18 + 64) == 6) {
    goto LABEL_32;
  }
  if (self) {
    id v21 = objc_getProperty(self, v19, 16, 1);
  }
  else {
    id v21 = 0;
  }
  __int16 v22 = [v21 primaryTunnelPlugin];
  if (!v22)
  {
    v36 = 0;
    goto LABEL_31;
  }
  int v23 = v22[16];

  if (!v23) {
    goto LABEL_33;
  }
  v25 = ne_log_obj();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    if (self) {
      id v27 = objc_getProperty(self, v26, 16, 1);
    }
    else {
      id v27 = 0;
    }
    v28 = (objc_class *)objc_opt_class();
    v29 = NSStringFromClass(v28);
    int v47 = 138412546;
    id v48 = v27;
    __int16 v49 = 2112;
    v50 = v29;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%@ in state %@: disconnecting the plugin", (uint8_t *)&v47, 0x16u);
  }
  if (self) {
    id v31 = objc_getProperty(self, v30, 16, 1);
  }
  else {
    id v31 = 0;
  }
  v20 = [v31 primaryTunnelPlugin];
  if (self) {
    id v33 = objc_getProperty(self, v32, 16, 1);
  }
  else {
    id v33 = 0;
  }
  id v34 = [v33 lastStopReason];
  if (v20)
  {
    id v35 = v34;
    v36 = [v20 remotePluginObject];
    [v36 disconnectWithReason:v35];
LABEL_31:
  }
LABEL_32:

LABEL_33:
  if (self) {
    id v37 = objc_getProperty(self, v24, 16, 1);
  }
  else {
    id v37 = 0;
  }
  v38 = [v37 primaryTunnelPlugin];
  if (!v38 || (int v39 = v38[16], v38, !v39))
  {
    v40 = ne_log_obj();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      if (self) {
        id v42 = objc_getProperty(self, v41, 16, 1);
      }
      else {
        id v42 = 0;
      }
      v43 = (objc_class *)objc_opt_class();
      v44 = NSStringFromClass(v43);
      int v47 = 138412546;
      id v48 = v42;
      __int16 v49 = 2112;
      v50 = v44;
      _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "%@ in state %@: plugin already disconnected, disposing all plugins", (uint8_t *)&v47, 0x16u);
    }
    if (self) {
      id v46 = objc_getProperty(self, v45, 16, 1);
    }
    else {
      id v46 = 0;
    }
    [v46 setState:8];
  }
}

- (BOOL)handleClearConfiguration
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
    int v9 = 138412546;
    id v10 = Property;
    __int16 v11 = 2112;
    __int16 v12 = v7;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%@ in state %@: plugin disconnecting, ignoring clear configuration request", (uint8_t *)&v9, 0x16u);
  }
  return 0;
}

- (void)handleSetConfigurationResult:(BOOL)a3
{
  uint64_t v4 = ne_log_obj();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    if (self) {
      id Property = objc_getProperty(self, v5, 16, 1);
    }
    else {
      id Property = 0;
    }
    v7 = (objc_class *)objc_opt_class();
    v8 = NSStringFromClass(v7);
    int v9 = 138412546;
    id v10 = Property;
    __int16 v11 = 2112;
    __int16 v12 = v8;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@ in state %@: plugin disconnecting, ignoring set configuration result", (uint8_t *)&v9, 0x16u);
  }
}

- (BOOL)handleSetConfiguration
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
    int v9 = 138412546;
    id v10 = Property;
    __int16 v11 = 2112;
    __int16 v12 = v7;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%@ in state %@: plugin disconnecting, ignoring set configuration request", (uint8_t *)&v9, 0x16u);
  }
  return 0;
}

- (void)enterWithSession:(id)a3
{
  if (self)
  {
    self->_isUninstalled = 0;
    v6.receiver = self;
    v6.super_class = (Class)NESMVPNSessionStateStopping;
    [(NESMVPNSessionState *)&v6 enterWithSession:a3];
    id Property = objc_getProperty(self, v4, 16, 1);
  }
  else
  {
    v6.receiver = 0;
    v6.super_class = (Class)NESMVPNSessionStateStopping;
    [(NESMVPNSessionState *)&v6 enterWithSession:a3];
    id Property = 0;
  }
  [Property requestUninstall];
}

- (NESMVPNSessionStateStopping)init
{
  v3.receiver = self;
  v3.super_class = (Class)NESMVPNSessionStateStopping;
  return [(NESMVPNSessionState *)&v3 initWithType:5 andTimeout:20];
}

@end