@interface INAppsSyncingToDriveResponse
- (ICQAppsSyncingToDrive)appsSyncingToDrive;
- (INAppsSyncingToDriveResponse)initWithHTTPResponse:(id)a3 data:(id)a4;
@end

@implementation INAppsSyncingToDriveResponse

- (INAppsSyncingToDriveResponse)initWithHTTPResponse:(id)a3 data:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)INAppsSyncingToDriveResponse;
  v4 = [(INAppsSyncingToDriveResponse *)&v11 initWithHTTPResponse:a3 data:a4 bodyIsPlist:0];
  v5 = v4;
  if (v4)
  {
    v6 = (id *)&v4->AAResponse_opaque[OBJC_IVAR___AAResponse__httpResponse];
    if ([*v6 statusCode] == (id)200)
    {
      id v7 = objc_alloc((Class)ICQAppsSyncingToDrive);
      v8 = (ICQAppsSyncingToDrive *)[v7 initFromDictionary:*(void *)&v5->AAResponse_opaque[OBJC_IVAR___AAResponse__responseDictionary]];
      appsSyncingToDrive = v5->_appsSyncingToDrive;
      v5->_appsSyncingToDrive = v8;
    }
    else
    {
      appsSyncingToDrive = _INLogSystem();
      if (os_log_type_enabled(appsSyncingToDrive, OS_LOG_TYPE_ERROR)) {
        sub_10002816C((uint64_t)v5, v6, appsSyncingToDrive);
      }
    }
  }
  return v5;
}

- (ICQAppsSyncingToDrive)appsSyncingToDrive
{
  return self->_appsSyncingToDrive;
}

- (void).cxx_destruct
{
}

@end