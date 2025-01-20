@interface NSPPrivateRelayIncompatibleNetworkStats
- (NSString)interfaceType;
- (NSString)tierType;
- (id)analyticsDict;
- (id)eventName;
- (void)setInterfaceType:(id)a3;
- (void)setTierType:(id)a3;
@end

@implementation NSPPrivateRelayIncompatibleNetworkStats

- (id)eventName
{
  return @"com.apple.nsp.privateRelayIncompatibleNetworkStats";
}

- (id)analyticsDict
{
  v3 = [(NSPPrivateRelayIncompatibleNetworkStats *)self tierType];

  if (!v3)
  {
    v9 = nplog_obj();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      goto LABEL_10;
    }
    int v11 = 136315138;
    v12 = "-[NSPPrivateRelayIncompatibleNetworkStats analyticsDict]";
    v10 = "%s called with null self.tierType";
LABEL_12:
    _os_log_fault_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_FAULT, v10, (uint8_t *)&v11, 0xCu);
    goto LABEL_10;
  }
  v4 = [(NSPPrivateRelayIncompatibleNetworkStats *)self interfaceType];

  if (v4)
  {
    id v5 = objc_alloc_init((Class)NSMutableDictionary);
    v6 = [(NSPPrivateRelayIncompatibleNetworkStats *)self tierType];
    [v5 setObject:v6 forKeyedSubscript:@"TierType"];

    v7 = [(NSPPrivateRelayIncompatibleNetworkStats *)self interfaceType];
    [v5 setObject:v7 forKeyedSubscript:@"InterfaceType"];

    goto LABEL_4;
  }
  v9 = nplog_obj();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
  {
    int v11 = 136315138;
    v12 = "-[NSPPrivateRelayIncompatibleNetworkStats analyticsDict]";
    v10 = "%s called with null self.interfaceType";
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

- (NSString)interfaceType
{
  return self->_interfaceType;
}

- (void)setInterfaceType:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interfaceType, 0);

  objc_storeStrong((id *)&self->_tierType, 0);
}

@end