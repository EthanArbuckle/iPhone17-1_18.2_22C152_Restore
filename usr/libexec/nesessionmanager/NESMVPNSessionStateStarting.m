@interface NESMVPNSessionStateStarting
- (BOOL)handleSetConfiguration;
- (NESMVPNSessionStateStarting)init;
- (void)enterWithSession:(id)a3;
- (void)handlePlugin:(id)a3 didStartWithPID:(int)a4 error:(id)a5;
- (void)handlePluginStatusDidChangeToConnected:(id)a3;
- (void)handleSetConfigurationResult:(BOOL)a3;
- (void)handleTimeout;
@end

@implementation NESMVPNSessionStateStarting

- (void)handleTimeout
{
  v6.receiver = self;
  v6.super_class = (Class)NESMVPNSessionStateStarting;
  [(NESMVPNSessionState *)&v6 handleTimeout];
  if (self)
  {
    [objc_getProperty(self, v3, 16, 1) setLastStopReason:12];
    id Property = objc_getProperty(self, v4, 16, 1);
  }
  else
  {
    [0 setLastStopReason:12];
    id Property = 0;
  }
  [Property setState:5];
}

- (void)handleSetConfigurationResult:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)NESMVPNSessionStateStarting;
  [(NESMVPNSessionState *)&v8 handleSetConfigurationResult:a3];
  kdebug_trace();
  if (self)
  {
    self->_tunnelConfigurationInstallState = 3;
    [objc_getProperty(self, v4, 16, 1) primaryTunnelPlugin];
    v5 = (_DWORD *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      int v6 = v5[16];

      if (v6 == 4) {
        [objc_getProperty(self, v7, 16, 1) setState:4];
      }
    }
  }
}

- (BOOL)handleSetConfiguration
{
  kdebug_trace();
  if (self) {
    self->_tunnelConfigurationInstallState = 2;
  }
  v4.receiver = self;
  v4.super_class = (Class)NESMVPNSessionStateStarting;
  return [(NESMVPNSessionState *)&v4 handleSetConfiguration];
}

- (void)handlePluginStatusDidChangeToConnected:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NESMVPNSessionStateStarting;
  [(NESMVPNSessionState *)&v6 handlePluginStatusDidChangeToConnected:a3];
  if (self)
  {
    int64_t tunnelConfigurationInstallState = self->_tunnelConfigurationInstallState;
    if (tunnelConfigurationInstallState == 3)
    {
      [objc_getProperty(self, v4, 16, 1) setState:4];
    }
    else if (tunnelConfigurationInstallState == 1)
    {
      [objc_getProperty(self, v4, 16, 1) requestInstall];
    }
  }
}

- (void)handlePlugin:(id)a3 didStartWithPID:(int)a4 error:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  id v9 = a5;
  kdebug_trace();
  v32.receiver = self;
  v32.super_class = (Class)NESMVPNSessionStateStarting;
  [(NESMVPNSessionState *)&v32 handlePlugin:v8 didStartWithPID:v6 error:v9];
  if ((int)v6 < 1)
  {
    if (v9)
    {
      v26 = [v9 domain];
      if ([v26 isEqualToString:@"NEAgentErrorDomain"])
      {
        id v27 = [v9 code];

        if (v27 == (id)2)
        {
          if (self) {
            id Property = objc_getProperty(self, v10, 16, 1);
          }
          else {
            id Property = 0;
          }
          uint64_t v29 = 6;
LABEL_27:
          [Property setLastStopReason:v29];
          if (self) {
            id v31 = objc_getProperty(self, v30, 16, 1);
          }
          else {
            id v31 = 0;
          }
          [v31 setState:5];
          goto LABEL_30;
        }
      }
      else
      {
      }
    }
    if (self) {
      id Property = objc_getProperty(self, v10, 16, 1);
    }
    else {
      id Property = 0;
    }
    uint64_t v29 = 7;
    goto LABEL_27;
  }
  if (self) {
    id v11 = objc_getProperty(self, v10, 16, 1);
  }
  else {
    id v11 = 0;
  }
  if ([v11 shouldSendIPCAttachForPlugin:v8])
  {
    v12 = ne_log_obj();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      if (self) {
        id v14 = objc_getProperty(self, v13, 16, 1);
      }
      else {
        id v14 = 0;
      }
      v15 = (objc_class *)objc_opt_class();
      v16 = NSStringFromClass(v15);
      *(_DWORD *)buf = 138412546;
      id v34 = v14;
      __int16 v35 = 2112;
      v36 = v16;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%@ in state %@: attaching IPC", buf, 0x16u);
    }
    sub_100018644(v8);
  }
  kdebug_trace();
  if (self) {
    id v18 = objc_getProperty(self, v17, 16, 1);
  }
  else {
    id v18 = 0;
  }
  v20 = [v18 primaryTunnelPlugin];
  if (self) {
    id v21 = objc_getProperty(self, v19, 16, 1);
  }
  else {
    id v21 = 0;
  }
  v22 = [v21 connectParameters];
  v23 = v22;
  if (v20)
  {
    v20[16] = 1;
    id v24 = v22;
    v25 = [v20 remotePluginObject];
    [v25 connectWithParameters:v24];
  }
LABEL_30:
}

- (void)enterWithSession:(id)a3
{
  id v4 = a3;
  kdebug_trace();
  v16.receiver = self;
  v16.super_class = (Class)NESMVPNSessionStateStarting;
  [(NESMVPNSessionState *)&v16 enterWithSession:v4];

  if (self)
  {
    self->_int64_t tunnelConfigurationInstallState = 1;
    if (!objc_msgSend(objc_getProperty(self, v5, 16, 1), "prepareConfigurationForStart"))
    {
LABEL_8:
      [objc_getProperty(self, v6, 16, 1) setLastStopReason:7];
      id Property = objc_getProperty(self, v13, 16, 1);
LABEL_9:
      [Property setState:5];
      return;
    }
    id v7 = objc_getProperty(self, v6, 16, 1);
  }
  else
  {
    unsigned __int8 v15 = [0 prepareConfigurationForStart];
    id v7 = 0;
    if ((v15 & 1) == 0) {
      goto LABEL_12;
    }
  }
  id v9 = [v7 primaryTunnelPlugin];
  if (self) {
    id v10 = objc_getProperty(self, v8, 16, 1);
  }
  else {
    id v10 = 0;
  }
  id v11 = [v10 configuration];
  BOOL v12 = sub_10001689C(v9, v11);

  if (!v12)
  {
    if (self) {
      goto LABEL_8;
    }
LABEL_12:
    [0 setLastStopReason:7];
    id Property = 0;
    goto LABEL_9;
  }
}

- (NESMVPNSessionStateStarting)init
{
  v3.receiver = self;
  v3.super_class = (Class)NESMVPNSessionStateStarting;
  return [(NESMVPNSessionState *)&v3 initWithType:3 andTimeout:0];
}

@end