@interface NSPProbeHTTPErrorCodeStats
- (BOOL)directPath;
- (NSNumber)HTTPErrorCode;
- (NSString)interfaceType;
- (id)analyticsDict;
- (id)eventName;
- (void)setDirectPath:(BOOL)a3;
- (void)setHTTPErrorCode:(id)a3;
- (void)setInterfaceType:(id)a3;
@end

@implementation NSPProbeHTTPErrorCodeStats

- (id)eventName
{
  return @"com.apple.nsp.ProbeHTTPErrorStats";
}

- (id)analyticsDict
{
  v3 = [(NSPProbeHTTPErrorCodeStats *)self HTTPErrorCode];

  if (v3)
  {
    id v4 = objc_alloc_init((Class)NSMutableDictionary);
    v5 = [(NSPProbeHTTPErrorCodeStats *)self interfaceType];
    [v4 setObject:v5 forKeyedSubscript:@"InterfaceType"];

    v6 = +[NSNumber numberWithBool:[(NSPProbeHTTPErrorCodeStats *)self directPath]];
    [v4 setObject:v6 forKeyedSubscript:@"DirectPath"];

    v7 = [(NSPProbeHTTPErrorCodeStats *)self HTTPErrorCode];
    [v4 setObject:v7 forKeyedSubscript:@"HTTPCode"];
  }
  else
  {
    v9 = nplog_obj();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      int v10 = 136315138;
      v11 = "-[NSPProbeHTTPErrorCodeStats analyticsDict]";
      _os_log_fault_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_FAULT, "%s called with null self.HTTPErrorCode", (uint8_t *)&v10, 0xCu);
    }

    id v4 = 0;
  }

  return v4;
}

- (NSString)interfaceType
{
  return self->_interfaceType;
}

- (void)setInterfaceType:(id)a3
{
}

- (BOOL)directPath
{
  return self->_directPath;
}

- (void)setDirectPath:(BOOL)a3
{
  self->_directPath = a3;
}

- (NSNumber)HTTPErrorCode
{
  return self->_HTTPErrorCode;
}

- (void)setHTTPErrorCode:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_HTTPErrorCode, 0);

  objc_storeStrong((id *)&self->_interfaceType, 0);
}

@end