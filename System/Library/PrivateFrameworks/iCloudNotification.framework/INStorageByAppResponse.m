@interface INStorageByAppResponse
- (ICQAppCloudStorage)appCloudStorage;
- (INStorageByAppResponse)initWithHTTPResponse:(id)a3 data:(id)a4;
- (void)_parseResponseDict;
@end

@implementation INStorageByAppResponse

- (INStorageByAppResponse)initWithHTTPResponse:(id)a3 data:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)INStorageByAppResponse;
  v4 = [(INStorageByAppResponse *)&v9 initWithHTTPResponse:a3 data:a4 bodyIsPlist:0];
  v5 = v4;
  if (v4)
  {
    v6 = (id *)&v4->AAResponse_opaque[OBJC_IVAR___AAResponse__httpResponse];
    if ([*v6 statusCode] == (id)200)
    {
      [(INStorageByAppResponse *)v5 _parseResponseDict];
    }
    else
    {
      v7 = _INLogSystem();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_10002B290(v6, v7);
      }
    }
  }
  return v5;
}

- (void)_parseResponseDict
{
  v3 = (ICQAppCloudStorage *)objc_alloc_init((Class)ICQAppCloudStorage);
  appCloudStorage = self->_appCloudStorage;
  self->_appCloudStorage = v3;

  uint64_t v5 = OBJC_IVAR___AAResponse__responseDictionary;
  id v11 = [*(id *)&self->AAResponse_opaque[OBJC_IVAR___AAResponse__responseDictionary] objectForKeyedSubscript:@"bundleIdentifier"];
  if (v11)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(ICQAppCloudStorage *)self->_appCloudStorage setBundleID:v11];
    }
  }
  v6 = [*(id *)&self->AAResponse_opaque[v5] objectForKeyedSubscript:@"storageUsedBytes"];
  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(ICQAppCloudStorage *)self->_appCloudStorage setStorageUsed:v6];
    }
  }
  v7 = [*(id *)&self->AAResponse_opaque[v5] objectForKeyedSubscript:@"ruiURL"];
  if (v7)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v8 = +[NSURL URLWithString:v7];
      [(ICQAppCloudStorage *)self->_appCloudStorage setRuiURL:v8];
    }
  }
  objc_super v9 = [*(id *)&self->AAResponse_opaque[v5] objectForKeyedSubscript:@"liftUIURL"];
  if (v9)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v10 = +[NSURL URLWithString:v9];
      [(ICQAppCloudStorage *)self->_appCloudStorage setLiftUIURL:v10];
    }
  }
}

- (ICQAppCloudStorage)appCloudStorage
{
  return self->_appCloudStorage;
}

- (void).cxx_destruct
{
}

@end