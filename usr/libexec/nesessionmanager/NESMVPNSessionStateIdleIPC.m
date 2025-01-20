@interface NESMVPNSessionStateIdleIPC
- (NESMVPNSessionStateIdleIPC)init;
- (void)enterWithSession:(id)a3;
- (void)handleEstablishIPC;
- (void)handleEstablishIPCReplySent;
- (void)handlePlugin:(id)a3 didAttachIPCWithEndpoint:(id)a4;
- (void)handlePlugin:(id)a3 didStartWithPID:(int)a4 error:(id)a5;
- (void)handlePluginDidDetachIPC:(id)a3;
- (void)handlePluginDisposeComplete:(id)a3;
- (void)handleStartMessage:(id)a3;
- (void)handleStop;
- (void)handleUpdateConfiguration;
@end

@implementation NESMVPNSessionStateIdleIPC

- (void).cxx_destruct
{
}

- (void)handlePluginDisposeComplete:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NESMVPNSessionStateIdleIPC;
  [(NESMVPNSessionState *)&v6 handlePluginDisposeComplete:a3];
  if (self)
  {
    id Property = objc_getProperty(self, v4, 48, 1);
    sub_10006C910(self, Property);
  }
}

- (void)handlePluginDidDetachIPC:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)NESMVPNSessionStateIdleIPC;
  [(NESMVPNSessionState *)&v15 handlePluginDidDetachIPC:v4];
  if (self) {
    id Property = objc_getProperty(self, v5, 16, 1);
  }
  else {
    id Property = 0;
  }
  v7 = [Property primaryTunnelPlugin];

  if (v7)
  {
    if (self)
    {
      [objc_getProperty(self, v8, 16, 1) primaryTunnelPlugin];
      v9 = (unsigned char *)objc_claimAutoreleasedReturnValue();
      sub_100017968(v9, v10);

      id v12 = objc_getProperty(self, v11, 16, 1);
    }
    else
    {
      v13 = [0 primaryTunnelPlugin];
      sub_100017968(v13, v14);

      id v12 = 0;
    }
    [v12 setPrimaryTunnelPlugin:0];
  }
  else
  {
    [(NESMVPNSessionStateIdleIPC *)self handlePluginDisposeComplete:v4];
  }
}

- (void)handleUpdateConfiguration
{
  v19.receiver = self;
  v19.super_class = (Class)NESMVPNSessionStateIdleIPC;
  [(NESMVPNSessionState *)&v19 handleUpdateConfiguration];
  if (self) {
    id Property = objc_getProperty(self, v3, 16, 1);
  }
  else {
    id Property = 0;
  }
  v5 = [Property configuration];
  objc_super v6 = [v5 VPN];
  if ([v6 isEnabled])
  {

LABEL_15:
    return;
  }
  if (self) {
    id v8 = objc_getProperty(self, v7, 16, 1);
  }
  else {
    id v8 = 0;
  }
  v9 = [v8 configuration];
  v10 = [v9 appVPN];
  unsigned __int8 v11 = [v10 isEnabled];

  if ((v11 & 1) == 0)
  {
    id v12 = ne_log_obj();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      if (self) {
        id v14 = objc_getProperty(self, v13, 16, 1);
      }
      else {
        id v14 = 0;
      }
      objc_super v15 = (objc_class *)objc_opt_class();
      v16 = NSStringFromClass(v15);
      *(_DWORD *)buf = 138412546;
      id v21 = v14;
      __int16 v22 = 2112;
      v23 = v16;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%@ in state %@: the configuration is now disabled, tearing down IPC", buf, 0x16u);
    }
    if (self) {
      id v18 = objc_getProperty(self, v17, 16, 1);
    }
    else {
      id v18 = 0;
    }
    v5 = [v18 primaryTunnelPlugin];
    [(NESMVPNSessionStateIdleIPC *)self handlePluginDidDetachIPC:v5];
    goto LABEL_15;
  }
}

- (void)handleEstablishIPCReplySent
{
  v13.receiver = self;
  v13.super_class = (Class)NESMVPNSessionStateIdleIPC;
  [(NESMVPNSessionState *)&v13 handleEstablishIPCReplySent];
  if (!self || !self->_didAttachIPC || objc_getProperty(self, v3, 48, 1))
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
      v7 = (objc_class *)objc_opt_class();
      v9 = NSStringFromClass(v7);
      if (self) {
        id v10 = objc_getProperty(self, v8, 48, 1);
      }
      else {
        id v10 = 0;
      }
      *(_DWORD *)buf = 138412802;
      id v15 = Property;
      __int16 v16 = 2112;
      v17 = v9;
      __int16 v18 = 2048;
      id v19 = v10;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@ in state %@: IPC did not attach or there is a pending start message, moving to idle and handling pending start message (%p)", buf, 0x20u);
    }
    if (self)
    {
      id v12 = objc_getProperty(self, v11, 48, 1);
      sub_10006C910(self, v12);
    }
  }
}

- (void)handlePlugin:(id)a3 didAttachIPCWithEndpoint:(id)a4
{
  if (self && a4) {
    self->_didAttachIPC = 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)NESMVPNSessionStateIdleIPC;
  [(NESMVPNSessionState *)&v4 handlePlugin:a3 didAttachIPCWithEndpoint:a4];
}

- (void)handlePlugin:(id)a3 didStartWithPID:(int)a4 error:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  v31.receiver = self;
  v31.super_class = (Class)NESMVPNSessionStateIdleIPC;
  [(NESMVPNSessionState *)&v31 handlePlugin:v8 didStartWithPID:v6 error:a5];
  if ((int)v6 < 1)
  {
    if (self) {
      id Property = objc_getProperty(self, v9, 16, 1);
    }
    else {
      id Property = 0;
    }
    if ([Property establishIPCPending])
    {
      id v19 = ne_log_obj();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        if (self) {
          id v21 = objc_getProperty(self, v20, 16, 1);
        }
        else {
          id v21 = 0;
        }
        __int16 v22 = (objc_class *)objc_opt_class();
        v23 = NSStringFromClass(v22);
        *(_DWORD *)buf = 138412546;
        id v33 = v21;
        __int16 v34 = 2112;
        v35 = v23;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%@ in state %@: plugin failed to start, cannot attach IPC", buf, 0x16u);
      }
      if (self) {
        id v25 = objc_getProperty(self, v24, 16, 1);
      }
      else {
        id v25 = 0;
      }
      [v25 sendEstablishIPCReply];
    }
  }
  else
  {
    if (self) {
      id v10 = objc_getProperty(self, v9, 16, 1);
    }
    else {
      id v10 = 0;
    }
    unsigned int v11 = [v10 shouldSendIPCAttachForPlugin:v8];
    id v12 = ne_log_obj();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
    if (v11)
    {
      if (v13)
      {
        if (self) {
          id v15 = objc_getProperty(self, v14, 16, 1);
        }
        else {
          id v15 = 0;
        }
        __int16 v16 = (objc_class *)objc_opt_class();
        v17 = NSStringFromClass(v16);
        *(_DWORD *)buf = 138412546;
        id v33 = v15;
        __int16 v34 = 2112;
        v35 = v17;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%@ in state %@: attaching IPC", buf, 0x16u);
      }
      sub_100018644(v8);
    }
    else
    {
      if (v13)
      {
        if (self) {
          id v26 = objc_getProperty(self, v14, 16, 1);
        }
        else {
          id v26 = 0;
        }
        v27 = (objc_class *)objc_opt_class();
        v28 = NSStringFromClass(v27);
        *(_DWORD *)buf = 138412546;
        id v33 = v26;
        __int16 v34 = 2112;
        v35 = v28;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%@ in state %@: IPC is no longer needed, going back to idle", buf, 0x16u);
      }
      if (self)
      {
        id v30 = objc_getProperty(self, v29, 48, 1);
        sub_10006C910(self, v30);
      }
    }
  }
}

- (void)handleStop
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
    uint64_t v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    int v9 = 138412546;
    id v10 = Property;
    __int16 v11 = 2112;
    id v12 = v7;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%@ in state %@: received stop message", (uint8_t *)&v9, 0x16u);
  }
  if (self) {
    objc_setProperty_atomic(self, v8, 0, 48);
  }
}

- (void)handleStartMessage:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)NESMVPNSessionStateIdleIPC;
  [(NESMVPNSessionState *)&v19 handleStartMessage:v4];
  if (self) {
    id Property = objc_getProperty(self, v5, 16, 1);
  }
  else {
    id Property = 0;
  }
  v7 = [Property primaryTunnelPlugin];
  if (v7) {
    int v8 = v7[16] & 1;
  }
  else {
    int v8 = 0;
  }

  int v9 = ne_log_obj();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v10)
    {
      if (self) {
        id v12 = objc_getProperty(self, v11, 16, 1);
      }
      else {
        id v12 = 0;
      }
      BOOL v13 = (objc_class *)objc_opt_class();
      id v14 = NSStringFromClass(v13);
      *(_DWORD *)buf = 138412546;
      id v21 = v12;
      __int16 v22 = 2112;
      v23 = v14;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%@ in state %@: plugin previously started, going back to the idle state to handle the start message", buf, 0x16u);
    }
    sub_10006C910(self, v4);
  }
  else
  {
    if (v10)
    {
      if (self) {
        id v15 = objc_getProperty(self, v11, 16, 1);
      }
      else {
        id v15 = 0;
      }
      __int16 v16 = (objc_class *)objc_opt_class();
      v17 = NSStringFromClass(v16);
      *(_DWORD *)buf = 138412546;
      id v21 = v15;
      __int16 v22 = 2112;
      v23 = v17;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%@ in state %@: plugin has not yet started, saving the start message", buf, 0x16u);
    }
    if (self) {
      objc_setProperty_atomic(self, v18, v4, 48);
    }
  }
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
    uint64_t v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    int v8 = 138412546;
    id v9 = Property;
    __int16 v10 = 2112;
    __int16 v11 = v7;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%@ in state %@: ignoring duplicate request to establish IPC", (uint8_t *)&v8, 0x16u);
  }
}

- (void)enterWithSession:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NESMVPNSessionStateIdleIPC;
  [(NESMVPNSessionState *)&v10 enterWithSession:v4];
  if (self) {
    self->_didAttachIPC = 0;
  }
  if (![v4 initializePlugins]
    || ![v4 prepareConfigurationForStart])
  {
    goto LABEL_8;
  }
  uint64_t v6 = [v4 primaryTunnelPlugin];
  id v7 = self ? objc_getProperty(self, v5, 16, 1) : 0;
  int v8 = [v7 configuration];
  BOOL v9 = sub_10001689C(v6, v8);

  if (!v9) {
LABEL_8:
  }
    [v4 sendEstablishIPCReply];
}

- (NESMVPNSessionStateIdleIPC)init
{
  v3.receiver = self;
  v3.super_class = (Class)NESMVPNSessionStateIdleIPC;
  return [(NESMVPNSessionState *)&v3 initWithType:10 andTimeout:0];
}

@end