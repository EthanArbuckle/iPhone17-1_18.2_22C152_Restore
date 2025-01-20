@interface NESMVPNSessionStateIdle
- (BOOL)handleClearConfiguration;
- (BOOL)handleSetConfiguration;
- (NESMVPNSessionStateIdle)init;
- (void)enterWithSession:(id)a3;
- (void)handleClearConfigurationResult:(BOOL)a3;
- (void)handleEstablishIPC;
- (void)handleSetConfigurationResult:(BOOL)a3;
- (void)handleStartMessage:(id)a3;
- (void)handleUpdateConfiguration;
- (void)leave;
@end

@implementation NESMVPNSessionStateIdle

- (void)handleClearConfigurationResult:(BOOL)a3
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
    int v9 = 138412546;
    id v10 = Property;
    __int16 v11 = 2112;
    v12 = v8;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@ in state %@: plugin is idle, ignoring clear configuration result", (uint8_t *)&v9, 0x16u);
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
    v12 = v7;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%@ in state %@: plugin is idle, ignoring clear configuration request", (uint8_t *)&v9, 0x16u);
  }
  return 0;
}

- (void)handleSetConfigurationResult:(BOOL)a3
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
    int v9 = 138412546;
    id v10 = Property;
    __int16 v11 = 2112;
    v12 = v8;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@ in state %@: plugin is idle, ignoring set configuration result", (uint8_t *)&v9, 0x16u);
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
    v12 = v7;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%@ in state %@: plugin is idle, ignoring set configuration request", (uint8_t *)&v9, 0x16u);
  }
  return 0;
}

- (void)handleUpdateConfiguration
{
  v17.receiver = self;
  v17.super_class = (Class)NESMVPNSessionStateIdle;
  [(NESMVPNSessionState *)&v17 handleUpdateConfiguration];
  if (self) {
    id Property = objc_getProperty(self, v3, 16, 1);
  }
  else {
    id Property = 0;
  }
  v5 = [Property configuration];
  v6 = [v5 VPN];
  if ([v6 isEnabled])
  {

    if (!self) {
      return;
    }
  }
  else
  {
    if (self) {
      id v8 = objc_getProperty(self, v7, 16, 1);
    }
    else {
      id v8 = 0;
    }
    int v9 = [v8 configuration];
    id v10 = [v9 appVPN];
    unsigned int v11 = [v10 isEnabled];

    if (!self || !v11) {
      return;
    }
  }
  if (self->_establishIPCWhenEnabled)
  {
    v12 = ne_log_obj();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = objc_getProperty(self, v13, 16, 1);
      v15 = (objc_class *)objc_opt_class();
      v16 = NSStringFromClass(v15);
      *(_DWORD *)buf = 138412546;
      id v19 = v14;
      __int16 v20 = 2112;
      v21 = v16;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%@ in state %@: the configuration is now enabled, establishing IPC", buf, 0x16u);
    }
    self->_establishIPCWhenEnabled = 0;
    [(NESMVPNSessionStateIdle *)self handleEstablishIPC];
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
    v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    int v24 = 138412546;
    id v25 = Property;
    __int16 v26 = 2112;
    v27 = v7;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%@ in state %@: received establish IPC message", (uint8_t *)&v24, 0x16u);
  }
  if (self) {
    id v9 = objc_getProperty(self, v8, 16, 1);
  }
  else {
    id v9 = 0;
  }
  id v10 = [v9 configuration];
  unsigned int v11 = [v10 VPN];
  if ([v11 isEnabled])
  {

LABEL_12:
    if (self) {
      id v18 = objc_getProperty(self, v13, 16, 1);
    }
    else {
      id v18 = 0;
    }
    [v18 setState:10];
    return;
  }
  if (self) {
    id v14 = objc_getProperty(self, v12, 16, 1);
  }
  else {
    id v14 = 0;
  }
  v15 = [v14 configuration];
  v16 = [v15 appVPN];
  unsigned __int8 v17 = [v16 isEnabled];

  if (v17) {
    goto LABEL_12;
  }
  id v19 = ne_log_obj();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    if (self) {
      id v21 = objc_getProperty(self, v20, 16, 1);
    }
    else {
      id v21 = 0;
    }
    v22 = (objc_class *)objc_opt_class();
    v23 = NSStringFromClass(v22);
    int v24 = 138412546;
    id v25 = v21;
    __int16 v26 = 2112;
    v27 = v23;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%@ in state %@: delaying IPC establish until the configuration is enabled", (uint8_t *)&v24, 0x16u);
  }
  if (self) {
    self->_establishIPCWhenEnabled = 1;
  }
}

- (void)handleStartMessage:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)NESMVPNSessionStateIdle;
  [(NESMVPNSessionState *)&v8 handleStartMessage:v4];
  if (self)
  {
    [objc_getProperty(self, v5, 16, 1) createConnectParametersWithStartMessage:v4];
    id Property = objc_getProperty(self, v6, 16, 1);
  }
  else
  {
    [0 createConnectParametersWithStartMessage:v4];
    id Property = 0;
  }
  [Property setState:2];
}

- (void)leave
{
  v2 = self;
  if (self) {
    self = (NESMVPNSessionStateIdle *)objc_getProperty(self, a2, 16, 1);
  }
  sub_10002BA30(self);
  v3.receiver = v2;
  v3.super_class = (Class)NESMVPNSessionStateIdle;
  [(NESMVPNSessionState *)&v3 leave];
}

- (void)enterWithSession:(id)a3
{
  v18.receiver = self;
  v18.super_class = (Class)NESMVPNSessionStateIdle;
  id v4 = a3;
  [(NESMVPNSessionState *)&v18 enterWithSession:v4];
  sub_10002BA30(v4);

  if (self)
  {
    id Property = objc_getProperty(self, v5, 16, 1);
    if (!objc_msgSend(Property, "sleepOnDisconnect", v18.receiver, v18.super_class)) {
      goto LABEL_15;
    }
    id v8 = objc_getProperty(self, v7, 16, 1);
  }
  else
  {
    unsigned __int8 v17 = [0 sleepOnDisconnect:v18.receiver super_class:v18.super_class];
    id v8 = 0;
    id v16 = 0;
    if ((v17 & 1) == 0) {
      goto LABEL_16;
    }
  }
  if ([v8 parentType] == (id)2)
  {
    if (self) {
      id v10 = objc_getProperty(self, v9, 16, 1);
    }
    else {
      id v10 = 0;
    }
    v12 = [v10 parent];
    if (self) {
      objc_getProperty(self, v11, 16, 1);
    }
    sub_10008C1B8(v12);
  }
  else
  {
    if (self) {
      id v13 = objc_getProperty(self, v9, 16, 1);
    }
    else {
      id v13 = 0;
    }
    v12 = [v13 server];
    sub_1000556BC(v12, v14);
  }

  if (!self)
  {
    [0 setSleepOnDisconnect:0];
    id v16 = 0;
    goto LABEL_16;
  }
  [objc_getProperty(self, v15, 16, 1) setSleepOnDisconnect:0];
LABEL_15:
  self->_establishIPCWhenEnabled = 0;
  id v16 = objc_getProperty(self, v7, 16, 1);
LABEL_16:
  [v16 setRestartPending:0];
}

- (NESMVPNSessionStateIdle)init
{
  v3.receiver = self;
  v3.super_class = (Class)NESMVPNSessionStateIdle;
  return [(NESMVPNSessionState *)&v3 initWithType:1 andTimeout:0];
}

@end