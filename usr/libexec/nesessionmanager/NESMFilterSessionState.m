@interface NESMFilterSessionState
+ (id)stateWithType:(int64_t)a3;
- (BOOL)canSleep;
- (BOOL)handleSleep;
- (NESMFilterSessionState)initWithType:(int64_t)a3 andTimeout:(int64_t)a4;
- (int64_t)type;
- (void)enterWithSession:(id)a3;
- (void)handlePlugin:(id)a3 statusDidChangeToIdleWithError:(int64_t)a4;
- (void)handlePlugin:(id)a3 statusDidChangeToStoppingWithError:(int64_t)a4;
- (void)handlePluginDisposeComplete:(id)a3;
- (void)handlePluginStatusDidChangeToRunning:(id)a3;
- (void)handlePluginStatusDidChangeToStarting:(id)a3;
- (void)handlePluginStatusDidChangeToUpdating:(id)a3;
- (void)handleStartMessage:(id)a3;
- (void)handleStop;
- (void)handleTimeout;
- (void)handleUpdateConfiguration;
- (void)handleWakeup;
- (void)leave;
@end

@implementation NESMFilterSessionState

- (void).cxx_destruct
{
}

- (int64_t)type
{
  return self->_type;
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
    v11 = v7;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%@ in state %@: configuration changed", (uint8_t *)&v8, 0x16u);
  }
}

- (void)handleTimeout
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
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%@ in state %@: timed out", (uint8_t *)&v10, 0x16u);
  }
  if (self) {
    id v9 = (id *)objc_getProperty(self, v8, 16, 1);
  }
  else {
    id v9 = 0;
  }
  sub_100075D24(v9, (const char *)4);
}

- (void)handleWakeup
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
    id v11 = v7;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%@ in state %@: handle wake up", (uint8_t *)&v8, 0x16u);
  }
}

- (BOOL)canSleep
{
  return 1;
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
    __int16 v12 = v7;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%@ in state %@: handle sleep", (uint8_t *)&v9, 0x16u);
  }
  return 0;
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
    int v9 = NSStringFromClass(v8);
    int v10 = 138412802;
    id v11 = Property;
    __int16 v12 = 2112;
    v13 = v9;
    __int16 v14 = 2112;
    id v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ in state %@: plugin %@ disposed", (uint8_t *)&v10, 0x20u);
  }
}

- (void)handlePlugin:(id)a3 statusDidChangeToStoppingWithError:(int64_t)a4
{
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
    int v15 = 138413058;
    id v16 = Property;
    __int16 v17 = 2112;
    v18 = v11;
    __int16 v19 = 2112;
    id v20 = v6;
    __int16 v21 = 2048;
    int64_t v22 = a4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@ in state %@: plugin %@ status changed to stopping with error %ld", (uint8_t *)&v15, 0x2Au);
  }
  if (a4 == 1)
  {
    if (self) {
      id v13 = objc_getProperty(self, v12, 16, 1);
    }
    else {
      id v13 = 0;
    }
    [v13 setLastStopReason:7];
  }
  if (self) {
    __int16 v14 = (id *)objc_getProperty(self, v12, 16, 1);
  }
  else {
    __int16 v14 = 0;
  }
  sub_100075D24(v14, (const char *)4);
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
    int v8 = (objc_class *)objc_opt_class();
    int v9 = NSStringFromClass(v8);
    int v12 = 138412802;
    id v13 = Property;
    __int16 v14 = 2112;
    int v15 = v9;
    __int16 v16 = 2112;
    id v17 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ in state %@: plugin %@ status changed to updating", (uint8_t *)&v12, 0x20u);
  }
  if (self) {
    id v11 = (id *)objc_getProperty(self, v10, 16, 1);
  }
  else {
    id v11 = 0;
  }
  sub_100075D24(v11, (const char *)5);
}

- (void)handlePluginStatusDidChangeToRunning:(id)a3
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
    int v9 = NSStringFromClass(v8);
    int v10 = 138412802;
    id v11 = Property;
    __int16 v12 = 2112;
    id v13 = v9;
    __int16 v14 = 2112;
    id v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ in state %@: plugin %@ status changed to running", (uint8_t *)&v10, 0x20u);
  }
}

- (void)handlePluginStatusDidChangeToStarting:(id)a3
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
    int v9 = NSStringFromClass(v8);
    int v10 = 138412802;
    id v11 = Property;
    __int16 v12 = 2112;
    id v13 = v9;
    __int16 v14 = 2112;
    id v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ in state %@: plugin %@ status changed to starting", (uint8_t *)&v10, 0x20u);
  }
}

- (void)handlePlugin:(id)a3 statusDidChangeToIdleWithError:(int64_t)a4
{
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
    int v16 = 138413058;
    id v17 = Property;
    __int16 v18 = 2112;
    __int16 v19 = v11;
    __int16 v20 = 2112;
    id v21 = v6;
    __int16 v22 = 2048;
    int64_t v23 = a4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@ in state %@: plugin %@ status changed to idle with error: %ld", (uint8_t *)&v16, 0x2Au);
  }
  if (a4 == 2)
  {
    if (self) {
      id v13 = objc_getProperty(self, v12, 16, 1);
    }
    else {
      id v13 = 0;
    }
    uint64_t v14 = 6;
  }
  else
  {
    if (a4 != 1) {
      goto LABEL_14;
    }
    if (self) {
      id v13 = objc_getProperty(self, v12, 16, 1);
    }
    else {
      id v13 = 0;
    }
    uint64_t v14 = 7;
  }
  [v13 setLastStopReason:v14];
LABEL_14:
  if (self) {
    id v15 = (id *)objc_getProperty(self, v12, 16, 1);
  }
  else {
    id v15 = 0;
  }
  sub_100075D24(v15, (const char *)4);
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
    id v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    int v10 = 138412546;
    id v11 = Property;
    __int16 v12 = 2112;
    id v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%@ in state %@: received stop message", (uint8_t *)&v10, 0x16u);
  }
  if (self) {
    int v9 = (id *)objc_getProperty(self, v8, 16, 1);
  }
  else {
    int v9 = 0;
  }
  sub_100075D24(v9, (const char *)4);
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
    v7 = (objc_class *)objc_opt_class();
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
  v3 = ne_log_obj();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    if (self) {
      id Property = objc_getProperty(self, v4, 16, 1);
    }
    else {
      id Property = 0;
    }
    id v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    int v9 = 138412546;
    id v10 = Property;
    __int16 v11 = 2112;
    __int16 v12 = v7;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%@: Leaving state %@", (uint8_t *)&v9, 0x16u);
  }
  if (self) {
    objc_setProperty_atomic(self, v8, 0, 16);
  }
}

- (void)enterWithSession:(id)a3
{
  id v5 = a3;
  if (self) {
    objc_setProperty_atomic(self, v4, v5, 16);
  }
  id v6 = ne_log_obj();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = (objc_class *)objc_opt_class();
    int v8 = NSStringFromClass(v7);
    *(_DWORD *)buf = 138412546;
    id v13 = v5;
    __int16 v14 = 2112;
    id v15 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%@: Entering state %@", buf, 0x16u);
  }
  if (self && self->_timeout >= 1 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    dispatch_time_t v9 = dispatch_time(0, 1000000000 * self->_timeout);
    id v10 = [v5 queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100060868;
    block[3] = &unk_1000C6C60;
    block[4] = self;
    dispatch_after(v9, v10, block);
  }
}

- (NESMFilterSessionState)initWithType:(int64_t)a3 andTimeout:(int64_t)a4
{
  v10.receiver = self;
  v10.super_class = (Class)NESMFilterSessionState;
  id v6 = [(NESMFilterSessionState *)&v10 init];
  v7 = v6;
  if (v6)
  {
    session = v6->_session;
    v6->_type = a3;
    v6->_session = 0;
    v6->_timeout = a4;
  }
  return v7;
}

+ (id)stateWithType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 4)
  {
    id v4 = 0;
  }
  else
  {
    id v4 = objc_alloc_init(*off_1000C6350[a3 - 1]);
  }
  return v4;
}

@end