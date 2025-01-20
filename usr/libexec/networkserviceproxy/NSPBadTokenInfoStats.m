@interface NSPBadTokenInfoStats
- (NSString)configTag;
- (NSString)tierType;
- (NSString)tokenProxy;
- (id)analyticsDict;
- (id)eventName;
- (unint64_t)configAgeHours;
- (void)setConfigAgeHours:(unint64_t)a3;
- (void)setConfigTag:(id)a3;
- (void)setTierType:(id)a3;
- (void)setTokenProxy:(id)a3;
@end

@implementation NSPBadTokenInfoStats

- (id)eventName
{
  return @"com.apple.nsp.badTokenInfoStats";
}

- (id)analyticsDict
{
  v3 = [(NSPBadTokenInfoStats *)self tierType];

  if (!v3)
  {
    v11 = nplog_obj();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      goto LABEL_10;
    }
    int v13 = 136315138;
    v14 = "-[NSPBadTokenInfoStats analyticsDict]";
    v12 = "%s called with null self.tierType";
LABEL_12:
    _os_log_fault_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_FAULT, v12, (uint8_t *)&v13, 0xCu);
    goto LABEL_10;
  }
  v4 = [(NSPBadTokenInfoStats *)self tokenProxy];

  if (v4)
  {
    id v5 = objc_alloc_init((Class)NSMutableDictionary);
    v6 = [(NSPBadTokenInfoStats *)self tierType];
    [v5 setObject:v6 forKeyedSubscript:@"TierType"];

    v7 = [(NSPBadTokenInfoStats *)self tokenProxy];
    [v5 setObject:v7 forKeyedSubscript:@"TokenProxy"];

    v8 = +[NSNumber numberWithUnsignedInteger:[(NSPBadTokenInfoStats *)self configAgeHours]];
    [v5 setObject:v8 forKeyedSubscript:@"ConfigAge"];

    v9 = [(NSPBadTokenInfoStats *)self configTag];
    [v5 setObject:v9 forKeyedSubscript:@"ConfigTag"];

    goto LABEL_4;
  }
  v11 = nplog_obj();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
  {
    int v13 = 136315138;
    v14 = "-[NSPBadTokenInfoStats analyticsDict]";
    v12 = "%s called with null self.tokenProxy";
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

- (NSString)tokenProxy
{
  return self->_tokenProxy;
}

- (void)setTokenProxy:(id)a3
{
}

- (unint64_t)configAgeHours
{
  return self->_configAgeHours;
}

- (void)setConfigAgeHours:(unint64_t)a3
{
  self->_configAgeHours = a3;
}

- (NSString)configTag
{
  return self->_configTag;
}

- (void)setConfigTag:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configTag, 0);
  objc_storeStrong((id *)&self->_tokenProxy, 0);

  objc_storeStrong((id *)&self->_tierType, 0);
}

@end