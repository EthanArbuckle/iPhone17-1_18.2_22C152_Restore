@interface DMDPersonalHotspotManager
+ (DMDPersonalHotspotManager)sharedManager;
- (BOOL)enabled;
- (DMDPersonalHotspotManager)init;
- (NETRBClient)netrbClient;
- (__SCDynamicStore)scDynamicStore;
- (void)dealloc;
- (void)setEnabled:(BOOL)a3;
- (void)setNetrbClient:(NETRBClient *)a3;
- (void)setScDynamicStore:(__SCDynamicStore *)a3;
@end

@implementation DMDPersonalHotspotManager

+ (DMDPersonalHotspotManager)sharedManager
{
  if (qword_1000FBC88 != -1) {
    dispatch_once(&qword_1000FBC88, &stru_1000CBB00);
  }
  v2 = (void *)qword_1000FBC80;

  return (DMDPersonalHotspotManager *)v2;
}

- (DMDPersonalHotspotManager)init
{
  v4.receiver = self;
  v4.super_class = (Class)DMDPersonalHotspotManager;
  v2 = [(DMDPersonalHotspotManager *)&v4 init];
  if (v2)
  {
    v2->_scDynamicStore = SCDynamicStoreCreate(0, @"com.apple.managedconfiguration.DMDPersonalHotspotManager", 0, 0);
    v2->_netrbClient = (NETRBClient *)_NETRBClientCreate();
  }
  return v2;
}

- (void)dealloc
{
  _NETRBClientDestroy();
  CFRelease(self->_scDynamicStore);
  v3.receiver = self;
  v3.super_class = (Class)DMDPersonalHotspotManager;
  [(DMDPersonalHotspotManager *)&v3 dealloc];
}

- (BOOL)enabled
{
  if ([(DMDPersonalHotspotManager *)self scDynamicStore])
  {
    objc_super v3 = SCDynamicStoreCopyValue([(DMDPersonalHotspotManager *)self scDynamicStore], @"com.apple.MobileInternetSharing");
    objc_super v4 = v3;
    if (v3)
    {
      v5 = [v3 objectForKeyedSubscript:@"State"];
      unsigned int v6 = [v5 intValue];

      BOOL v7 = v6 == 1023;
      v8 = DMFPersonalHotspotLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = MCStringForBool();
        int v11 = 138543362;
        v12 = v9;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Personal hotspot enabled: %{public}@", (uint8_t *)&v11, 0xCu);
      }
    }
    else
    {
      v8 = DMFPersonalHotspotLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_100086B78();
      }
      BOOL v7 = 0;
    }
  }
  else
  {
    objc_super v4 = DMFPersonalHotspotLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100086B44();
    }
    BOOL v7 = 0;
  }

  return v7;
}

- (void)setEnabled:(BOOL)a3
{
  objc_super v3 = [(DMDPersonalHotspotManager *)self netrbClient];
  objc_super v4 = DMFPersonalHotspotLog();
  v5 = v4;
  if (!v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100086BAC();
    }
    goto LABEL_9;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v6 = MCStringForBool();
    int v7 = 138543362;
    v8 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Setting personal hotspot enabled to %{public}@", (uint8_t *)&v7, 0xCu);
  }
  if ((_NETRBClientSetGlobalServiceState() & 1) == 0)
  {
    v5 = DMFPersonalHotspotLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100086BE0();
    }
LABEL_9:
  }
}

- (NETRBClient)netrbClient
{
  return self->_netrbClient;
}

- (void)setNetrbClient:(NETRBClient *)a3
{
  self->_netrbClient = a3;
}

- (__SCDynamicStore)scDynamicStore
{
  return self->_scDynamicStore;
}

- (void)setScDynamicStore:(__SCDynamicStore *)a3
{
  self->_scDynamicStore = a3;
}

@end