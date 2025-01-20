@interface WAGeoServicesMessageSubmitter
- (WAGeoServicesMessageSubmitter)initWithMessageGroupType:(int64_t)a3;
- (id)submitMessage:(id)a3;
- (int64_t)groupTypeForThisSubmitter;
- (void)setGroupTypeForThisSubmitter:(int64_t)a3;
@end

@implementation WAGeoServicesMessageSubmitter

- (WAGeoServicesMessageSubmitter)initWithMessageGroupType:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)WAGeoServicesMessageSubmitter;
  result = [(WAGeoServicesMessageSubmitter *)&v5 init];
  result->_groupTypeForThisSubmitter = a3;
  return result;
}

- (id)submitMessage:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WAGeoServicesMessageSubmitter;
  objc_super v5 = [(WAProtobufMessageSubmitter *)&v12 instantiateAWDProtobufAndPopulateValues:v4];
  if (v5)
  {
    if (objc_opt_class())
    {
      +[GEOWiFiConnectionQualityReporter reportWiFiConnectionQuality:v5];
      v6 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        v7 = [v4 key];
        *(_DWORD *)buf = 136446722;
        v14 = "-[WAGeoServicesMessageSubmitter submitMessage:]";
        __int16 v15 = 1024;
        int v16 = 48;
        __int16 v17 = 2112;
        v18 = v7;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Successfully submitted GeoServices message with key: %@", buf, 0x1Cu);
      }
    }
    else
    {
      v6 = WALogCategoryDefaultHandle();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446466;
        v14 = "-[WAGeoServicesMessageSubmitter submitMessage:]";
        __int16 v15 = 1024;
        int v16 = 45;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%{public}s::%d:No GEOWiFiConnectionQualityReporter to report WiFiConnectionQuality with", buf, 0x12u);
      }
    }
    v8 = 0;
  }
  else
  {
    NSErrorUserInfoKey v19 = NSLocalizedFailureReasonErrorKey;
    CFStringRef v20 = @"WAErrorCodeSubmissionModelFailure";
    v6 = +[NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
    v8 = +[NSError errorWithDomain:@"com.apple.wifi.analytics.errordomain" code:9007 userInfo:v6];
  }

  v9 = [(WAMessageAWDSubmitter *)self submissionDelegate];
  v10 = [v4 uuid];
  [v9 messsageWasSubmittedWithUUID:v10];

  return v8;
}

- (int64_t)groupTypeForThisSubmitter
{
  return self->_groupTypeForThisSubmitter;
}

- (void)setGroupTypeForThisSubmitter:(int64_t)a3
{
  self->_groupTypeForThisSubmitter = a3;
}

@end