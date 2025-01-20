@interface INStorageAppsResponse
- (ICQCloudStorageApps)cloudStorageApps;
- (INStorageAppsResponse)initWithHTTPResponse:(id)a3 data:(id)a4;
@end

@implementation INStorageAppsResponse

- (INStorageAppsResponse)initWithHTTPResponse:(id)a3 data:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)INStorageAppsResponse;
  v4 = [(INStorageAppsResponse *)&v11 initWithHTTPResponse:a3 data:a4 bodyIsPlist:0];
  v5 = v4;
  if (v4)
  {
    v6 = (id *)&v4->AAResponse_opaque[OBJC_IVAR___AAResponse__httpResponse];
    if ([*v6 statusCode] == (id)200)
    {
      id v7 = objc_alloc((Class)ICQCloudStorageApps);
      v8 = (ICQCloudStorageApps *)[v7 initFromDictionary:*(void *)&v5->AAResponse_opaque[OBJC_IVAR___AAResponse__responseDictionary]];
      cloudStorageApps = v5->_cloudStorageApps;
      v5->_cloudStorageApps = v8;
    }
    else
    {
      cloudStorageApps = _INLogSystem();
      if (os_log_type_enabled(cloudStorageApps, OS_LOG_TYPE_ERROR)) {
        sub_1000266A8(v6, cloudStorageApps);
      }
    }
  }
  return v5;
}

- (ICQCloudStorageApps)cloudStorageApps
{
  return self->_cloudStorageApps;
}

- (void).cxx_destruct
{
}

@end