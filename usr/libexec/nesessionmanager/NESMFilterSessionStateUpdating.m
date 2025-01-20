@interface NESMFilterSessionStateUpdating
- (NESMFilterSessionStateUpdating)init;
- (void)enterWithSession:(id)a3;
- (void)handleStop;
@end

@implementation NESMFilterSessionStateUpdating

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
    v11 = v7;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%@ ignoring stop message in state %@", (uint8_t *)&v8, 0x16u);
  }
}

- (void)enterWithSession:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)NESMFilterSessionStateUpdating;
  [(NESMFilterSessionState *)&v8 enterWithSession:a3];
  if (self)
  {
    id Property = objc_getProperty(self, v4, 16, 1);
    if (Property)
    {
      v6 = Property;
      sub_100073438(Property, 0);
      v7 = [v6 server];
      [v7 requestUninstallForSession:v6];
    }
  }
}

- (NESMFilterSessionStateUpdating)init
{
  v3.receiver = self;
  v3.super_class = (Class)NESMFilterSessionStateUpdating;
  return [(NESMFilterSessionState *)&v3 initWithType:5 andTimeout:300];
}

@end