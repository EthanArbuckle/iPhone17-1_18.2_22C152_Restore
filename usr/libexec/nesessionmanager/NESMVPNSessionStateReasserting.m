@interface NESMVPNSessionStateReasserting
- (BOOL)handleSetConfiguration;
- (BOOL)handleSleep;
- (NESMVPNSessionStateReasserting)init;
- (void)enterWithSession:(id)a3;
- (void)handleInterfaceAvailable:(id)a3 changed:(BOOL)a4;
- (void)handlePluginStatusDidChangeToConnected:(id)a3;
- (void)handleSetConfigurationResult:(BOOL)a3;
- (void)handleTimeout;
- (void)handleUserLogout;
- (void)handleUserSwitch;
@end

@implementation NESMVPNSessionStateReasserting

- (void)handleSetConfigurationResult:(BOOL)a3
{
  v10.receiver = self;
  v10.super_class = (Class)NESMVPNSessionStateReasserting;
  [(NESMVPNSessionState *)&v10 handleSetConfigurationResult:a3];
  if (self)
  {
    self->_setConfigurationInProgress = 0;
    id Property = objc_getProperty(self, v4, 16, 1);
  }
  else
  {
    id Property = 0;
  }
  v6 = [Property primaryTunnelPlugin];
  if (v6)
  {
    int v7 = v6[16];

    if (v7 == 4)
    {
      if (self) {
        id v9 = objc_getProperty(self, v8, 16, 1);
      }
      else {
        id v9 = 0;
      }
      [v9 setState:4];
    }
  }
}

- (BOOL)handleSetConfiguration
{
  v5.receiver = self;
  v5.super_class = (Class)NESMVPNSessionStateReasserting;
  BOOL v3 = [(NESMVPNSessionState *)&v5 handleSetConfiguration];
  if (self && v3) {
    self->_setConfigurationInProgress = 1;
  }
  return v3;
}

- (void)handleUserLogout
{
  v2.receiver = self;
  v2.super_class = (Class)NESMVPNSessionStateReasserting;
  [(NESMVPNSessionState *)&v2 handleUserLogout];
}

- (void)handleUserSwitch
{
  v2.receiver = self;
  v2.super_class = (Class)NESMVPNSessionStateReasserting;
  [(NESMVPNSessionState *)&v2 handleUserSwitch];
}

- (BOOL)handleSleep
{
  objc_super v2 = self;
  if (self) {
    self = (NESMVPNSessionStateReasserting *)objc_getProperty(self, a2, 16, 1);
  }
  BOOL v3 = [(NESMVPNSessionStateReasserting *)self protocol];
  unsigned int v4 = [v3 disconnectOnSleep];

  if (v4)
  {
    objc_super v5 = ne_log_obj();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      if (v2) {
        id Property = objc_getProperty(v2, v6, 16, 1);
      }
      else {
        id Property = 0;
      }
      v8 = (objc_class *)objc_opt_class();
      id v9 = NSStringFromClass(v8);
      *(_DWORD *)buf = 138412546;
      id v17 = Property;
      __int16 v18 = 2112;
      v19 = v9;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ in state %@: delaying sleep until disconnected", buf, 0x16u);
    }
    if (v2)
    {
      [objc_getProperty(v2, v10, 16, 1) setSleepOnDisconnect:1];
      [objc_getProperty(v2, v11, 16, 1) setLastStopReason:9];
      id v13 = objc_getProperty(v2, v12, 16, 1);
    }
    else
    {
      [0 setSleepOnDisconnect:1];
      [0 setLastStopReason:9];
      id v13 = 0;
    }
    [v13 setState:5];
  }
  else
  {
    v15.receiver = v2;
    v15.super_class = (Class)NESMVPNSessionStateReasserting;
    [(NESMVPNSessionState *)&v15 handleSleep];
  }
  return 1;
}

- (void)handlePluginStatusDidChangeToConnected:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NESMVPNSessionStateReasserting;
  [(NESMVPNSessionState *)&v6 handlePluginStatusDidChangeToConnected:a3];
  if (self)
  {
    if (self->_setConfigurationInProgress) {
      return;
    }
    id Property = objc_getProperty(self, v4, 16, 1);
  }
  else
  {
    id Property = 0;
  }
  [Property setState:4];
}

- (void)handleTimeout
{
  v6.receiver = self;
  v6.super_class = (Class)NESMVPNSessionStateReasserting;
  [(NESMVPNSessionState *)&v6 handleTimeout];
  if (self)
  {
    [objc_getProperty(self, v3, 16, 1) setLastStopReason:13];
    id Property = objc_getProperty(self, v4, 16, 1);
  }
  else
  {
    [0 setLastStopReason:13];
    id Property = 0;
  }
  [Property setState:5];
}

- (void)handleInterfaceAvailable:(id)a3 changed:(BOOL)a4
{
  v18.receiver = self;
  v18.super_class = (Class)NESMVPNSessionStateReasserting;
  [(NESMVPNSessionState *)&v18 handleInterfaceAvailable:a3 changed:a4];
  if (self) {
    id Property = objc_getProperty(self, v5, 16, 1);
  }
  else {
    id Property = 0;
  }
  int v7 = [Property primaryTunnelPlugin];
  if (v7)
  {
    int v9 = v7[16];

    if (v9 == 5) {
      return;
    }
  }
  if (!self)
  {
    unsigned __int8 v17 = [0 reassertedByPlugin];
    id v16 = 0;
    if (v17) {
      goto LABEL_7;
    }
LABEL_13:
    [v16 setState:4];
    return;
  }
  if (!objc_msgSend(objc_getProperty(self, v8, 16, 1), "reassertedByPlugin"))
  {
    id v16 = objc_getProperty(self, v10, 16, 1);
    goto LABEL_13;
  }
LABEL_7:
  SEL v11 = ne_log_obj();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    if (self) {
      id v13 = objc_getProperty(self, v12, 16, 1);
    }
    else {
      id v13 = 0;
    }
    v14 = (objc_class *)objc_opt_class();
    objc_super v15 = NSStringFromClass(v14);
    *(_DWORD *)buf = 138412546;
    id v20 = v13;
    __int16 v21 = 2112;
    v22 = v15;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%@ in state %@: skipping a transition to running, because the plugin reasserted us", buf, 0x16u);
  }
}

- (void)enterWithSession:(id)a3
{
  if (self) {
    self->_setConfigurationInProgress = 0;
  }
  v3.receiver = self;
  v3.super_class = (Class)NESMVPNSessionStateReasserting;
  [(NESMVPNSessionState *)&v3 enterWithSession:a3];
}

- (NESMVPNSessionStateReasserting)init
{
  v3.receiver = self;
  v3.super_class = (Class)NESMVPNSessionStateReasserting;
  return [(NESMVPNSessionState *)&v3 initWithType:6 andTimeout:0];
}

@end