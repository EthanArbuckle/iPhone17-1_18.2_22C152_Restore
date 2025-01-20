@interface NESMVPNSessionStateUpdating
- (BOOL)handleClearConfiguration;
- (BOOL)handleSetConfiguration;
- (BOOL)handleSleep;
- (NESMVPNSessionStateUpdating)init;
- (void)enterWithSession:(id)a3;
- (void)handleEstablishIPC;
- (void)handlePlugin:(id)a3 statusDidChangeToDisconnectedWithReason:(int)a4;
- (void)handlePlugin:(id)a3 statusDidChangeToDisconnectingWithReason:(int)a4;
- (void)handleStop;
- (void)handleTimeout;
- (void)handleUpdateConfiguration;
- (void)leave;
@end

@implementation NESMVPNSessionStateUpdating

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
    v12 = v7;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%@ in state %@: rejecting clear configuration", (uint8_t *)&v9, 0x16u);
  }
  return 0;
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
    v12 = v7;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%@ in state %@: rejecting set configuration", (uint8_t *)&v9, 0x16u);
  }
  return 0;
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
    int v9 = (objc_class *)objc_opt_class();
    id v10 = NSStringFromClass(v9);
    int v11 = 138413058;
    id v12 = Property;
    __int16 v13 = 2112;
    v14 = v10;
    __int16 v15 = 2112;
    id v16 = v5;
    __int16 v17 = 2080;
    uint64_t v18 = ne_session_stop_reason_to_string();
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@ in state %@: plugin %@ status changed to disconnecting with reason %s", (uint8_t *)&v11, 0x2Au);
  }
}

- (void)handlePlugin:(id)a3 statusDidChangeToDisconnectedWithReason:(int)a4
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
    int v9 = (objc_class *)objc_opt_class();
    id v10 = NSStringFromClass(v9);
    int v13 = 138413058;
    id v14 = Property;
    __int16 v15 = 2112;
    id v16 = v10;
    __int16 v17 = 2112;
    id v18 = v5;
    __int16 v19 = 2080;
    uint64_t v20 = ne_session_stop_reason_to_string();
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@ in state %@: plugin %@ disconnected with reason %s", (uint8_t *)&v13, 0x2Au);
  }
  if (self) {
    id v12 = objc_getProperty(self, v11, 16, 1);
  }
  else {
    id v12 = 0;
  }
  [v12 setState:8];
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
    int v8 = 138412546;
    id v9 = Property;
    __int16 v10 = 2112;
    int v11 = v7;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%@ in state %@: update configuration", (uint8_t *)&v8, 0x16u);
  }
}

- (BOOL)handleSleep
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
    id v12 = v7;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%@ in state %@: received sleep event", (uint8_t *)&v9, 0x16u);
  }
  return 0;
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
    v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    int v8 = 138412546;
    id v9 = Property;
    __int16 v10 = 2112;
    __int16 v11 = v7;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%@ in state %@: received stop message", (uint8_t *)&v8, 0x16u);
  }
}

- (void)handleTimeout
{
  v5.receiver = self;
  v5.super_class = (Class)NESMVPNSessionStateUpdating;
  [(NESMVPNSessionState *)&v5 handleTimeout];
  if (self) {
    id Property = objc_getProperty(self, v3, 16, 1);
  }
  else {
    id Property = 0;
  }
  [Property setState:8];
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
    int v13 = v7;
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

- (void)leave
{
  v2 = self;
  if (self) {
    self = (NESMVPNSessionStateUpdating *)objc_getProperty(self, a2, 16, 1);
  }
  v3 = self;
  v4 = [(NESMVPNSessionStateUpdating *)v3 queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006E0C0;
  block[3] = &unk_1000C6C60;
  int v8 = v3;
  objc_super v5 = v3;
  dispatch_async(v4, block);

  v6.receiver = v2;
  v6.super_class = (Class)NESMVPNSessionStateUpdating;
  [(NESMVPNSessionState *)&v6 leave];
}

- (void)enterWithSession:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)NESMVPNSessionStateUpdating;
  [(NESMVPNSessionState *)&v7 enterWithSession:a3];
  if (self)
  {
    [objc_getProperty(self, v4, 16, 1) requestUninstall];
    id Property = objc_getProperty(self, v5, 16, 1);
  }
  else
  {
    [0 requestUninstall];
    id Property = 0;
  }
  sub_10008088C((uint64_t)Property, 1);
}

- (NESMVPNSessionStateUpdating)init
{
  v3.receiver = self;
  v3.super_class = (Class)NESMVPNSessionStateUpdating;
  return [(NESMVPNSessionState *)&v3 initWithType:9 andTimeout:300];
}

@end