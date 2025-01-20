@interface NESMVPNSessionStateDisposing
- (NESMVPNSessionStateDisposing)init;
- (void)enterWithSession:(id)a3;
- (void)handleEstablishIPC;
- (void)handlePluginDisposeComplete:(id)a3;
- (void)handleTimeout;
@end

@implementation NESMVPNSessionStateDisposing

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
  v25.receiver = self;
  v25.super_class = (Class)NESMVPNSessionStateDisposing;
  [(NESMVPNSessionState *)&v25 handleTimeout];
  if (self) {
    id Property = objc_getProperty(self, v3, 16, 1);
  }
  else {
    id Property = 0;
  }
  v5 = [Property authenticationPlugin];

  if (v5)
  {
    if (self)
    {
      v7 = [objc_getProperty(self, v6, 16, 1) authenticationPlugin];
      sub_1000182F8(v7, v8);

      id v10 = objc_getProperty(self, v9, 16, 1);
    }
    else
    {
      v21 = [0 authenticationPlugin];
      sub_1000182F8(v21, v22);

      id v10 = 0;
    }
    id v11 = [v10 authenticationPlugin];
    [(NESMVPNSessionStateDisposing *)self handlePluginDisposeComplete:v11];
  }
  if (self) {
    id v12 = objc_getProperty(self, v6, 16, 1);
  }
  else {
    id v12 = 0;
  }
  v13 = [v12 primaryTunnelPlugin];

  if (v13)
  {
    if (self)
    {
      v15 = [objc_getProperty(self, v14, 16, 1) primaryTunnelPlugin];
      sub_1000182F8(v15, v16);

      id v18 = objc_getProperty(self, v17, 16, 1);
    }
    else
    {
      v23 = [0 primaryTunnelPlugin];
      sub_1000182F8(v23, v24);

      id v18 = 0;
    }
    v19 = [v18 primaryTunnelPlugin];
    [(NESMVPNSessionStateDisposing *)self handlePluginDisposeComplete:v19];
  }
  else
  {
    if (self) {
      id v20 = objc_getProperty(self, v14, 16, 1);
    }
    else {
      id v20 = 0;
    }
    [v20 setState:1];
  }
}

- (void)handlePluginDisposeComplete:(id)a3
{
  v18.receiver = self;
  v18.super_class = (Class)NESMVPNSessionStateDisposing;
  [(NESMVPNSessionState *)&v18 handlePluginDisposeComplete:a3];
  if (!self || (--self->_pendingDisposeCount, !self->_pendingDisposeCount))
  {
    v4 = ne_log_obj();
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
      *(_DWORD *)buf = 138412546;
      id v20 = Property;
      __int16 v21 = 2112;
      v22 = v8;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@ in state %@: all plugins have disposed", buf, 0x16u);
    }
    if (self)
    {
      [objc_getProperty(self, v9, 16, 1) setAuthenticationPlugin:0];
      [objc_getProperty(self, v10, 16, 1) setPrimaryTunnelPlugin:0];
      id v12 = [objc_getProperty(self, v11, 16, 1) policySession];
      sub_10002E8D4((uint64_t)v12);

      if (objc_msgSend(objc_getProperty(self, v13, 16, 1), "restartPending"))
      {
LABEL_9:
        sub_10006E660(self);
        return;
      }
      id v15 = objc_getProperty(self, v14, 16, 1);
    }
    else
    {
      [0 setAuthenticationPlugin:0];
      [0 setPrimaryTunnelPlugin:0];
      v16 = [0 policySession];
      sub_10002E8D4((uint64_t)v16);

      unsigned __int8 v17 = [0 restartPending];
      id v15 = 0;
      if (v17) {
        goto LABEL_9;
      }
    }
    [v15 setState:1];
  }
}

- (void)enterWithSession:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)NESMVPNSessionStateDisposing;
  [(NESMVPNSessionState *)&v25 enterWithSession:v4];
  if (self)
  {
    self->_pendingDisposeCount = 0;
    id Property = objc_getProperty(self, v5, 16, 1);
  }
  else
  {
    id Property = 0;
  }
  v7 = [Property authenticationPlugin];

  if (v7)
  {
    if (self)
    {
      ++self->_pendingDisposeCount;
      id v9 = objc_getProperty(self, v8, 16, 1);
    }
    else
    {
      id v9 = 0;
    }
    SEL v10 = [v9 authenticationPlugin];
    sub_100017968(v10, v11);
  }
  if (self) {
    id v12 = objc_getProperty(self, v8, 16, 1);
  }
  else {
    id v12 = 0;
  }
  SEL v13 = [v12 primaryTunnelPlugin];

  if (v13)
  {
    if (self)
    {
      ++self->_pendingDisposeCount;
      id v15 = objc_getProperty(self, v14, 16, 1);
    }
    else
    {
      id v15 = 0;
    }
    v16 = [v15 primaryTunnelPlugin];
    sub_100017968(v16, v17);
  }
  if (!self || !self->_pendingDisposeCount)
  {
    objc_super v18 = ne_log_obj();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      if (self) {
        id v20 = objc_getProperty(self, v19, 16, 1);
      }
      else {
        id v20 = 0;
      }
      __int16 v21 = (objc_class *)objc_opt_class();
      v22 = NSStringFromClass(v21);
      *(_DWORD *)buf = 138412546;
      id v27 = v20;
      __int16 v28 = 2112;
      v29 = v22;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%@ in state %@: no plugins to dispose", buf, 0x16u);
    }
    v23 = [v4 queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10006EC04;
    block[3] = &unk_1000C6C60;
    block[4] = self;
    dispatch_async(v23, block);
  }
}

- (NESMVPNSessionStateDisposing)init
{
  v3.receiver = self;
  v3.super_class = (Class)NESMVPNSessionStateDisposing;
  return [(NESMVPNSessionState *)&v3 initWithType:8 andTimeout:5];
}

@end