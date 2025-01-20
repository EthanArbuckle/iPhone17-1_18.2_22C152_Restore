@interface NESMVPNSessionStateRunning
- (BOOL)handleSleep;
- (NESMVPNSessionStateRunning)init;
- (void)handleInterfaceUnavailable:(id)a3;
- (void)handlePluginStatusDidChangeToReasserting:(id)a3;
- (void)handleUserLogout;
- (void)handleUserSwitch;
@end

@implementation NESMVPNSessionStateRunning

- (void)handleInterfaceUnavailable:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NESMVPNSessionStateRunning;
  [(NESMVPNSessionState *)&v6 handleInterfaceUnavailable:a3];
  if (self) {
    id Property = objc_getProperty(self, v4, 16, 1);
  }
  else {
    id Property = 0;
  }
  [Property setState:6];
}

- (void)handlePluginStatusDidChangeToReasserting:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NESMVPNSessionStateRunning;
  [(NESMVPNSessionState *)&v6 handlePluginStatusDidChangeToReasserting:a3];
  if (self) {
    id Property = objc_getProperty(self, v4, 16, 1);
  }
  else {
    id Property = 0;
  }
  [Property setState:6];
}

- (void)handleUserLogout
{
  v2.receiver = self;
  v2.super_class = (Class)NESMVPNSessionStateRunning;
  [(NESMVPNSessionState *)&v2 handleUserLogout];
}

- (void)handleUserSwitch
{
  v2.receiver = self;
  v2.super_class = (Class)NESMVPNSessionStateRunning;
  [(NESMVPNSessionState *)&v2 handleUserSwitch];
}

- (BOOL)handleSleep
{
  objc_super v2 = self;
  if (self) {
    self = (NESMVPNSessionStateRunning *)objc_getProperty(self, a2, 16, 1);
  }
  v3 = [(NESMVPNSessionStateRunning *)self protocol];
  unsigned int v4 = [v3 disconnectOnSleep];

  if (v4)
  {
    v5 = ne_log_obj();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      if (v2) {
        id Property = objc_getProperty(v2, v6, 16, 1);
      }
      else {
        id Property = 0;
      }
      v8 = (objc_class *)objc_opt_class();
      v9 = NSStringFromClass(v8);
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
    v15.super_class = (Class)NESMVPNSessionStateRunning;
    [(NESMVPNSessionState *)&v15 handleSleep];
  }
  return 1;
}

- (NESMVPNSessionStateRunning)init
{
  v3.receiver = self;
  v3.super_class = (Class)NESMVPNSessionStateRunning;
  return [(NESMVPNSessionState *)&v3 initWithType:4 andTimeout:0];
}

@end