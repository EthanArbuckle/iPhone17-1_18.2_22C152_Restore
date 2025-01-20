@interface MSDS3Server
- (MSDS3Server)initWithCellularAccess:(BOOL)a3;
- (void)launchTaskWithRequest:(id)a3;
- (void)uploadMobileStoreDemoLogs:(id)a3;
@end

@implementation MSDS3Server

- (MSDS3Server)initWithCellularAccess:(BOOL)a3
{
  BOOL v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MSDS3Server;
  v4 = [(MSDS3Server *)&v8 init];
  if (v4)
  {
    v5 = [[MSDSession alloc] initWithCellularAccess:v3];
    [(MSDServer *)v4 setSession:v5];

    v6 = v4;
  }

  return v4;
}

- (void)uploadMobileStoreDemoLogs:(id)a3
{
  id v4 = a3;
  v5 = sub_100068600();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "About to send request to S3 server to upload logs.", buf, 2u);
  }

  v6 = objc_alloc_init(MSDServerResponse);
  if ([v4 isValid])
  {
    [(MSDS3Server *)self launchTaskWithRequest:v4];
    id v7 = 0;
  }
  else
  {
    objc_super v8 = sub_100068600();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1000D1474(v4, v8);
    }

    id v11 = 0;
    sub_1000C3140(&v11, 3727744769, @"Input is invalid");
    id v7 = v11;
    [(MSDServerResponse *)v6 setError:v7];
    v9 = [v4 completion];

    if (v9)
    {
      v10 = [v4 completion];
      ((void (**)(void, MSDServerResponse *))v10)[2](v10, v6);
    }
  }
}

- (void)launchTaskWithRequest:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(MSDS3SessionTaskInfo);
  v6 = [v4 s3url];
  [(MSDS3SessionTaskInfo *)v5 setS3url:v6];

  id v7 = [v4 httpHeaders];
  [(MSDS3SessionTaskInfo *)v5 setHttpHeaders:v7];

  -[MSDSessionTaskInfo setMaxRetry:](v5, "setMaxRetry:", [v4 retryAttempts]);
  objc_super v8 = [v4 logFilePath];
  [(MSDSessionTaskInfo *)v5 setPostFile:v8];

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000C3FDC;
  v12[3] = &unk_100153500;
  id v13 = v4;
  id v9 = v4;
  v10 = objc_retainBlock(v12);
  [(MSDSessionTaskInfo *)v5 setHandler:v10];
  id v11 = [(MSDServer *)self session];
  [v11 launchTaskWithInfo:v5];
}

@end