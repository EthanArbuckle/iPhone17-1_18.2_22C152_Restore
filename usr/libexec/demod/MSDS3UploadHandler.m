@interface MSDS3UploadHandler
+ (id)sharedInstance;
- (BOOL)uploadInProgress;
- (MSDS3UploadHandler)init;
- (id)demoLogUploadRequest;
- (id)getDefaultLogFolderName;
- (void)clearDemoLogUploadRequest;
- (void)demoLogUploadCompleted:(id)a3;
- (void)saveDemoLogUploadRequest:(id)a3;
- (void)setUploadInProgress:(BOOL)a3;
- (void)uploadDemoLogsIfNeeded;
- (void)uploadDemoLogsTo:(id)a3 HttpHeaders:(id)a4 andMaxAttempts:(int64_t)a5;
@end

@implementation MSDS3UploadHandler

+ (id)sharedInstance
{
  if (qword_100189898 != -1) {
    dispatch_once(&qword_100189898, &stru_100151C40);
  }
  v2 = (void *)qword_100189890;

  return v2;
}

- (MSDS3UploadHandler)init
{
  v5.receiver = self;
  v5.super_class = (Class)MSDS3UploadHandler;
  v2 = [(MSDS3UploadHandler *)&v5 init];
  v3 = v2;
  if (v2) {
    [(MSDS3UploadHandler *)v2 setUploadInProgress:0];
  }
  return v3;
}

- (void)uploadDemoLogsTo:(id)a3 HttpHeaders:(id)a4 andMaxAttempts:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x3032000000;
  v29 = sub_10000DBAC;
  v30 = sub_10000DBBC;
  id v31 = 0;
  if ([(MSDS3UploadHandler *)self uploadInProgress])
  {
    v16 = sub_100068600();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_1000C6F4C(v16);
    }
    goto LABEL_13;
  }
  if (!v8)
  {
    v16 = sub_100068600();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_1000C6F90(v16);
    }
LABEL_13:

    v17 = (id *)(v27 + 5);
    id obj = (id)v27[5];
    sub_1000C3140(&obj, 3727744742, @"Failed to upload MobileStoreDemo logs to S3.");
    objc_storeStrong(v17, obj);
    [(MSDS3UploadHandler *)self demoLogUploadCompleted:v27[5]];
    goto LABEL_8;
  }
  [(MSDS3UploadHandler *)self setUploadInProgress:1];
  v10 = [(MSDS3UploadHandler *)self getDefaultLogFolderName];
  v11 = [(MSDS3UploadHandler *)self demoLogUploadRequest];

  if (!v11)
  {
    id v12 = objc_alloc_init((Class)NSMutableDictionary);
    [v12 setObject:v8 forKey:@"s3URL"];
    v13 = +[NSNumber numberWithInteger:a5];
    [v12 setObject:v13 forKey:@"maxRetry"];

    [v12 setObject:v10 forKey:@"folderName"];
    if (v9) {
      [v12 setObject:v9 forKey:@"httpHeaders"];
    }
    [(MSDS3UploadHandler *)self saveDemoLogUploadRequest:v12];
  }
  v14 = dispatch_get_global_queue(9, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000DBC4;
  block[3] = &unk_100151C68;
  id v20 = v10;
  id v21 = v8;
  int64_t v25 = a5;
  v23 = self;
  v24 = &v26;
  id v22 = v9;
  id v15 = v10;
  dispatch_async(v14, block);

LABEL_8:
  _Block_object_dispose(&v26, 8);
}

- (void)uploadDemoLogsIfNeeded
{
  v3 = [(MSDS3UploadHandler *)self demoLogUploadRequest];
  v4 = v3;
  if (v3)
  {
    objc_super v5 = [v3 objectForKey:@"s3URL"];
    v6 = [v4 objectForKey:@"folderName"];
    v7 = [v4 objectForKey:@"httpHeaders"];
    id v8 = [v4 objectForKey:@"maxRetry"];
    id v9 = [v8 integerValue];

    v10 = sub_100068600();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Demod was interrupted in between demo log upload to S3! Lets try again..", v11, 2u);
    }

    [(MSDS3UploadHandler *)self uploadDemoLogsTo:v5 HttpHeaders:v7 andMaxAttempts:v9];
  }
}

- (BOOL)uploadInProgress
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL uploadInProgress = v2->_uploadInProgress;
  objc_sync_exit(v2);

  return uploadInProgress;
}

- (void)setUploadInProgress:(BOOL)a3
{
  id obj = self;
  objc_sync_enter(obj);
  obj->_BOOL uploadInProgress = a3;
  objc_sync_exit(obj);
}

- (void)saveDemoLogUploadRequest:(id)a3
{
  id v3 = a3;
  id v4 = +[MSDPreferencesFile sharedInstance];
  [v4 setObject:v3 forKey:@"DemoLogUploadRequest"];
}

- (void)clearDemoLogUploadRequest
{
  id v2 = +[MSDPreferencesFile sharedInstance];
  [v2 removeObjectForKey:@"DemoLogUploadRequest"];
}

- (id)demoLogUploadRequest
{
  id v2 = +[MSDPreferencesFile sharedInstance];
  id v3 = [v2 objectForKey:@"DemoLogUploadRequest"];

  return v3;
}

- (id)getDefaultLogFolderName
{
  id v2 = objc_alloc_init((Class)NSDateFormatter);
  [v2 setDateFormat:@"yyyyMMddhhmmss"];
  id v3 = +[NSDate date];
  id v4 = [v2 stringFromDate:v3];
  objc_super v5 = +[MSDTargetDevice sharedInstance];
  v6 = [v5 serialNumber];

  v7 = +[NSString stringWithFormat:@"%@-log-%@", v6, v4];

  return v7;
}

- (void)demoLogUploadCompleted:(id)a3
{
  id v8 = a3;
  if (![(MSDS3UploadHandler *)self uploadInProgress]) {
    [(MSDS3UploadHandler *)self clearDemoLogUploadRequest];
  }
  id v4 = v8;
  if (v8)
  {
    objc_super v5 = [v8 localizedDescription];
    v6 = +[MSDTargetDevice sharedInstance];
    [v6 setS3ServerFailureReason:v5];

    v7 = +[MSDMailProcessor sharedInstance];
    [v7 reportS3ServerFailed];

    id v4 = v8;
  }
}

@end