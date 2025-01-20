@interface APLogSysEventRequester
- (BOOL)isAllowedEmptyResponse;
- (Class)responseClass;
- (id)protoBuffer;
- (int)eventType;
- (void)makeDelayedRequest:(double)a3 requestSentHandler:(id)a4 responseCallback:(id)a5;
- (void)setEventType:(int)a3;
@end

@implementation APLogSysEventRequester

- (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAllowedEmptyResponse
{
  return 1;
}

- (id)protoBuffer
{
  v3 = objc_alloc_init(APPBLogSysEventRequest);
  v4 = [(APLegacyMetricRequester *)self logMetadata];
  [(APPBLogSysEventRequest *)v3 setMetaData:v4];

  [(APPBLogSysEventRequest *)v3 setEventType:[(APLogSysEventRequester *)self eventType]];
  v5 = objc_alloc_init(APPBClickLocation);
  [(APPBLogSysEventRequest *)v3 setClickLocation:v5];

  v6 = [(APLegacyMetricRequester *)self internalContent];
  v7 = [v6 transientContent];
  [v7 clickLocation];
  uint64_t v9 = (int)v8;
  v10 = [(APPBLogSysEventRequest *)v3 clickLocation];
  [v10 setX:v9];

  v11 = [(APLegacyMetricRequester *)self internalContent];
  v12 = [v11 transientContent];
  [v12 clickLocation];
  uint64_t v14 = (int)v13;
  v15 = [(APPBLogSysEventRequest *)v3 clickLocation];
  [v15 setY:v14];

  return v3;
}

- (void)makeDelayedRequest:(double)a3 requestSentHandler:(id)a4 responseCallback:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (+[APSystemInternal isAppleInternalInstall])
  {
    id v10 = objc_alloc((Class)NSUserDefaults);
    id v11 = [v10 initWithSuiteName:APDefaultsBundleID];
    if ([v11 BOOLForKey:@"disableDelayForRequests"])
    {
      v12 = APLogForCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136446210;
        v15 = "-[APLogSysEventRequester makeDelayedRequest:requestSentHandler:responseCallback:]";
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%{public}s Overriding delay to 0 seconds", buf, 0xCu);
      }

      a3 = 0.0;
    }
  }
  v13.receiver = self;
  v13.super_class = (Class)APLogSysEventRequester;
  [(APServerRequester *)&v13 makeDelayedRequest:v8 requestSentHandler:v9 responseCallback:a3];
}

- (int)eventType
{
  return self->_eventType;
}

- (void)setEventType:(int)a3
{
  self->_eventType = a3;
}

@end