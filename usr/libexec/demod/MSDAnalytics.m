@interface MSDAnalytics
+ (id)sharedInstance;
- (BOOL)disableCoreAnalticsTransformSampling;
- (BOOL)rollOverCoreAnalyticsLogs;
- (BOOL)uploadCoreAnalyticsLogs;
- (MSDAnalytics)init;
- (NSFileHandle)testFileHandle;
- (void)sendEvent:(id)a3 withPayload:(id)a4;
- (void)setTestFileHandle:(id)a3;
@end

@implementation MSDAnalytics

+ (id)sharedInstance
{
  if (qword_1001898A8 != -1) {
    dispatch_once(&qword_1001898A8, &stru_100151F08);
  }
  v2 = (void *)qword_1001898A0;

  return v2;
}

- (MSDAnalytics)init
{
  v8.receiver = self;
  v8.super_class = (Class)MSDAnalytics;
  v2 = [(MSDAnalytics *)&v8 init];
  if (v2 && os_variant_has_internal_content())
  {
    v3 = +[NSFileManager defaultManager];
    unsigned __int8 v4 = [v3 fileExistsAtPath:@"/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/Metadata/demodCALogs.log"];

    if ((v4 & 1) == 0)
    {
      v5 = +[NSFileManager defaultManager];
      [v5 createFileAtPath:@"/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/Metadata/demodCALogs.log" contents:0 attributes:0];
    }
    v6 = +[NSFileHandle fileHandleForWritingAtPath:@"/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/Metadata/demodCALogs.log"];
    [(MSDAnalytics *)v2 setTestFileHandle:v6];
  }
  return v2;
}

- (void)sendEvent:(id)a3 withPayload:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (os_variant_has_internal_content())
  {
    objc_super v8 = self;
    objc_sync_enter(v8);
    v9 = +[NSString stringWithFormat:@"Event triggered: %@, Payload: %@\n", v6, v7];
    v10 = [(MSDAnalytics *)v8 testFileHandle];
    [v10 seekToEndOfFile];

    v11 = [(MSDAnalytics *)v8 testFileHandle];
    v12 = [v9 dataUsingEncoding:4];
    [v11 writeData:v12];

    objc_sync_exit(v8);
  }
  if (v6)
  {
    id v13 = v7;
    AnalyticsSendEventLazy();
  }
}

- (BOOL)rollOverCoreAnalyticsLogs
{
  char v2 = AnalyticsRolloverEvents();
  v3 = sub_100068600();
  unsigned __int8 v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Successfully rolled over CA logs.", v13, 2u);
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    sub_1000C7B6C(v4, v6, v7, v8, v9, v10, v11, v12);
  }

  return v2;
}

- (BOOL)uploadCoreAnalyticsLogs
{
  id v2 = objc_alloc_init((Class)OSASubmissionClient);
  unsigned __int8 v3 = [v2 submit];
  unsigned __int8 v4 = sub_100068600();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Successfully uploaded outstanding CA logs to server.", v14, 2u);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    sub_1000C7BA4(v5, v7, v8, v9, v10, v11, v12, v13);
  }

  return v3;
}

- (BOOL)disableCoreAnalticsTransformSampling
{
  char v2 = AnalyticsDisableAllTransformSampling();
  unsigned __int8 v3 = sub_100068600();
  unsigned __int8 v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Successfully disabled sampling for all transforms.", v13, 2u);
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    sub_1000C7BDC(v4, v6, v7, v8, v9, v10, v11, v12);
  }

  return v2;
}

- (NSFileHandle)testFileHandle
{
  return (NSFileHandle *)objc_getProperty(self, a2, 8, 1);
}

- (void)setTestFileHandle:(id)a3
{
}

- (void).cxx_destruct
{
}

@end