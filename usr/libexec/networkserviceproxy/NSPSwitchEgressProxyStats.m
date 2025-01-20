@interface NSPSwitchEgressProxyStats
- (BOOL)fallbackProxy;
- (BOOL)primaryProxy;
- (NSString)tierType;
- (NSString)vendor;
- (id)analyticsDict;
- (id)eventName;
- (void)setFallbackProxy:(BOOL)a3;
- (void)setPrimaryProxy:(BOOL)a3;
- (void)setTierType:(id)a3;
- (void)setVendor:(id)a3;
@end

@implementation NSPSwitchEgressProxyStats

- (id)eventName
{
  return @"com.apple.nsp.SwitchEgressProxyStats";
}

- (id)analyticsDict
{
  v3 = [(NSPSwitchEgressProxyStats *)self tierType];

  if (!v3)
  {
    v11 = nplog_obj();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      goto LABEL_10;
    }
    int v13 = 136315138;
    v14 = "-[NSPSwitchEgressProxyStats analyticsDict]";
    v12 = "%s called with null self.tierType";
LABEL_12:
    _os_log_fault_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_FAULT, v12, (uint8_t *)&v13, 0xCu);
    goto LABEL_10;
  }
  v4 = [(NSPSwitchEgressProxyStats *)self vendor];

  if (v4)
  {
    id v5 = objc_alloc_init((Class)NSMutableDictionary);
    v6 = [(NSPSwitchEgressProxyStats *)self tierType];
    [v5 setObject:v6 forKeyedSubscript:@"TierType"];

    v7 = [(NSPSwitchEgressProxyStats *)self vendor];
    [v5 setObject:v7 forKeyedSubscript:@"Vendor"];

    v8 = +[NSNumber numberWithBool:[(NSPSwitchEgressProxyStats *)self primaryProxy]];
    [v5 setObject:v8 forKeyedSubscript:@"PrimaryProxy"];

    v9 = +[NSNumber numberWithBool:[(NSPSwitchEgressProxyStats *)self fallbackProxy]];
    [v5 setObject:v9 forKeyedSubscript:@"FallbackProxy"];

    goto LABEL_4;
  }
  v11 = nplog_obj();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
  {
    int v13 = 136315138;
    v14 = "-[NSPSwitchEgressProxyStats analyticsDict]";
    v12 = "%s called with null self.vendor";
    goto LABEL_12;
  }
LABEL_10:

  id v5 = 0;
LABEL_4:

  return v5;
}

- (NSString)tierType
{
  return self->_tierType;
}

- (void)setTierType:(id)a3
{
}

- (NSString)vendor
{
  return self->_vendor;
}

- (void)setVendor:(id)a3
{
}

- (BOOL)primaryProxy
{
  return self->_primaryProxy;
}

- (void)setPrimaryProxy:(BOOL)a3
{
  self->_primaryProxy = a3;
}

- (BOOL)fallbackProxy
{
  return self->_fallbackProxy;
}

- (void)setFallbackProxy:(BOOL)a3
{
  self->_fallbackProxy = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vendor, 0);

  objc_storeStrong((id *)&self->_tierType, 0);
}

@end