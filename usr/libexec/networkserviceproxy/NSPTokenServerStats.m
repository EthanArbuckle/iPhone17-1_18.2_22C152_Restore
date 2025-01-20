@interface NSPTokenServerStats
- (NSString)tierType;
- (NSString)tokenServerAddress;
- (id)analyticsDict;
- (id)eventName;
- (void)setTierType:(id)a3;
- (void)setTokenServerAddress:(id)a3;
@end

@implementation NSPTokenServerStats

- (id)eventName
{
  return @"com.apple.nsp.tokenServerStats";
}

- (id)analyticsDict
{
  v3 = [(NSPTokenServerStats *)self tierType];

  if (!v3)
  {
    v9 = nplog_obj();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      goto LABEL_10;
    }
    int v11 = 136315138;
    v12 = "-[NSPTokenServerStats analyticsDict]";
    v10 = "%s called with null self.tierType";
LABEL_12:
    _os_log_fault_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_FAULT, v10, (uint8_t *)&v11, 0xCu);
    goto LABEL_10;
  }
  v4 = [(NSPTokenServerStats *)self tokenServerAddress];

  if (v4)
  {
    id v5 = objc_alloc_init((Class)NSMutableDictionary);
    v6 = [(NSPTokenServerStats *)self tierType];
    [v5 setObject:v6 forKeyedSubscript:@"TierType"];

    v7 = [(NSPTokenServerStats *)self tokenServerAddress];
    [v5 setObject:v7 forKeyedSubscript:@"TokenServerAddress"];

    goto LABEL_4;
  }
  v9 = nplog_obj();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
  {
    int v11 = 136315138;
    v12 = "-[NSPTokenServerStats analyticsDict]";
    v10 = "%s called with null self.tokenServerAddress";
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

- (NSString)tokenServerAddress
{
  return self->_tokenServerAddress;
}

- (void)setTokenServerAddress:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenServerAddress, 0);

  objc_storeStrong((id *)&self->_tierType, 0);
}

@end