@interface RPAngelProxy
+ (id)sharedInstance;
- (RPAngelProxy)init;
- (id)connectionManagerQueue;
- (id)getBSServiceInterface;
- (void)connectToAngelWithCompletionHandler:(id)a3;
- (void)disableCameraPip;
- (void)enableCameraPip;
- (void)hideAndStopRecordingBanner;
- (void)pauseCurrentSystemSession;
- (void)resumeCurrentSystemSession;
- (void)setupConnection;
- (void)showSavedToPhotosBannerWithPhotosURL:(id)a3 identifier:(id)a4 sessionID:(id)a5 completionHandler:(id)a6;
- (void)updateTimer:(id)a3;
@end

@implementation RPAngelProxy

+ (id)sharedInstance
{
  if (qword_100099CE8 != -1) {
    dispatch_once(&qword_100099CE8, &stru_100085DB0);
  }
  v2 = (void *)qword_100099CE0;

  return v2;
}

- (id)connectionManagerQueue
{
  if (qword_100099CF8 != -1) {
    dispatch_once(&qword_100099CF8, &stru_100085DD0);
  }
  v2 = (void *)qword_100099CF0;

  return v2;
}

- (id)getBSServiceInterface
{
  if (qword_100099D08 != -1) {
    dispatch_once(&qword_100099D08, &stru_100085DF0);
  }
  v2 = (void *)qword_100099D00;

  return v2;
}

- (RPAngelProxy)init
{
  v5.receiver = self;
  v5.super_class = (Class)RPAngelProxy;
  v2 = [(RPAngelProxy *)&v5 init];
  v3 = v2;
  if (v2) {
    [(RPAngelProxy *)v2 setupConnection];
  }
  return v3;
}

- (void)setupConnection
{
  v3 = +[BSServiceConnectionEndpoint endpointForMachName:@"com.apple.ReplayKitAngel.mach" service:@"com.apple.ReplayKitAngel.session" instance:0];
  if (v3)
  {
    v4 = +[BSServiceConnection connectionWithEndpoint:v3];
    connection = self->_connection;
    self->_connection = v4;

    v6 = self->_connection;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100038E38;
    v7[3] = &unk_100085EA0;
    v7[4] = self;
    [(BSServiceConnectionClient *)v6 configureConnection:v7];
    [(BSServiceConnectionClient *)self->_connection activate];
  }
  else if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v9 = "-[RPAngelProxy setupConnection]";
    __int16 v10 = 1024;
    int v11 = 99;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d RPAngel endpoint nil", buf, 0x12u);
  }
}

- (void)hideAndStopRecordingBanner
{
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v9 = "-[RPAngelProxy hideAndStopRecordingBanner]";
    __int16 v10 = 1024;
    int v11 = 106;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  connection = self->_connection;
  v4 = +[RBSDomainAttribute attributeWithDomain:@"com.apple.common" name:@"BasicAngelIPC"];
  v7 = v4;
  objc_super v5 = +[NSArray arrayWithObjects:&v7 count:1];
  v6 = [(BSServiceConnectionClient *)connection remoteTargetWithLaunchingAssertionAttributes:v5];

  if (v6)
  {
    [v6 hideAndStopRecordingBanner];
  }
  else if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v9 = "-[RPAngelProxy hideAndStopRecordingBanner]";
    __int16 v10 = 1024;
    int v11 = 113;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d RPAngelServerProtocol nil", buf, 0x12u);
  }
}

- (void)showSavedToPhotosBannerWithPhotosURL:(id)a3 identifier:(id)a4 sessionID:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = (void (**)(id, void *))a6;
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v21 = "-[RPAngelProxy showSavedToPhotosBannerWithPhotosURL:identifier:sessionID:completionHandler:]";
    __int16 v22 = 1024;
    int v23 = 118;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  connection = self->_connection;
  v15 = +[RBSDomainAttribute attributeWithDomain:@"com.apple.common" name:@"BasicAngelIPC"];
  v19 = v15;
  v16 = +[NSArray arrayWithObjects:&v19 count:1];
  v17 = [(BSServiceConnectionClient *)connection remoteTargetWithLaunchingAssertionAttributes:v16];

  if (v17)
  {
    [v17 showSavedToPhotosBannerWithPhotosURL:v10 identifier:v11 sessionID:v12 completionHandler:v13];
  }
  else
  {
    if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v21 = "-[RPAngelProxy showSavedToPhotosBannerWithPhotosURL:identifier:sessionID:completionHandler:]";
      __int16 v22 = 1024;
      int v23 = 125;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d RPAngelServerProtocol nil", buf, 0x12u);
    }
    v18 = +[NSError _rpUserErrorForCode:-5800 userInfo:0];
    v13[2](v13, v18);
  }
}

- (void)updateTimer:(id)a3
{
  id v4 = a3;
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    id v11 = "-[RPAngelProxy updateTimer:]";
    __int16 v12 = 1024;
    int v13 = 132;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  if (v4)
  {
    connection = self->_connection;
    v6 = +[RBSDomainAttribute attributeWithDomain:@"com.apple.common" name:@"BasicAngelIPC"];
    v9 = v6;
    v7 = +[NSArray arrayWithObjects:&v9 count:1];
    v8 = [(BSServiceConnectionClient *)connection remoteTargetWithLaunchingAssertionAttributes:v7];

    if (v8)
    {
      [v8 updateTimer:v4];
    }
    else if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      id v11 = "-[RPAngelProxy updateTimer:]";
      __int16 v12 = 1024;
      int v13 = 144;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d RPAngelServerProtocol nil", buf, 0x12u);
    }
  }
  else if (dword_100099BB8 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100053BE8();
  }
}

- (void)connectToAngelWithCompletionHandler:(id)a3
{
  id v4 = (void (**)(id, void, void *))a3;
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    __int16 v12 = "-[RPAngelProxy connectToAngelWithCompletionHandler:]";
    __int16 v13 = 1024;
    int v14 = 149;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  connection = self->_connection;
  v6 = +[RBSDomainAttribute attributeWithDomain:@"com.apple.common" name:@"BasicAngelIPC"];
  id v10 = v6;
  v7 = +[NSArray arrayWithObjects:&v10 count:1];
  v8 = [(BSServiceConnectionClient *)connection remoteTargetWithLaunchingAssertionAttributes:v7];

  if (v8)
  {
    [v8 connectToAngelWithCompletionHandler:v4];
  }
  else
  {
    if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      __int16 v12 = "-[RPAngelProxy connectToAngelWithCompletionHandler:]";
      __int16 v13 = 1024;
      int v14 = 156;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d RPAngelServerProtocol nil", buf, 0x12u);
    }
    v9 = +[NSError _rpUserErrorForCode:-5800 userInfo:0];
    v4[2](v4, 0, v9);
  }
}

- (void)enableCameraPip
{
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v9 = "-[RPAngelProxy enableCameraPip]";
    __int16 v10 = 1024;
    int v11 = 163;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  connection = self->_connection;
  id v4 = +[RBSDomainAttribute attributeWithDomain:@"com.apple.common" name:@"BasicAngelIPC"];
  v7 = v4;
  objc_super v5 = +[NSArray arrayWithObjects:&v7 count:1];
  v6 = [(BSServiceConnectionClient *)connection remoteTargetWithLaunchingAssertionAttributes:v5];

  if (v6)
  {
    [v6 enableCameraPip];
  }
  else if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v9 = "-[RPAngelProxy enableCameraPip]";
    __int16 v10 = 1024;
    int v11 = 168;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d RPAngelServerProtocol nil", buf, 0x12u);
  }
}

- (void)disableCameraPip
{
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v9 = "-[RPAngelProxy disableCameraPip]";
    __int16 v10 = 1024;
    int v11 = 173;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  connection = self->_connection;
  id v4 = +[RBSDomainAttribute attributeWithDomain:@"com.apple.common" name:@"BasicAngelIPC"];
  v7 = v4;
  objc_super v5 = +[NSArray arrayWithObjects:&v7 count:1];
  v6 = [(BSServiceConnectionClient *)connection remoteTargetWithLaunchingAssertionAttributes:v5];

  if (v6)
  {
    [v6 disableCameraPip];
  }
  else if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v9 = "-[RPAngelProxy disableCameraPip]";
    __int16 v10 = 1024;
    int v11 = 178;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d RPAngelServerProtocol nil", buf, 0x12u);
  }
}

- (void)pauseCurrentSystemSession
{
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136446466;
    objc_super v5 = "-[RPAngelProxy pauseCurrentSystemSession]";
    __int16 v6 = 1024;
    int v7 = 184;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v4, 0x12u);
  }
  v2 = +[RPClientManager sharedInstance];
  v3 = [v2 getClientWithBundleID:@"com.apple.springboard"];

  [v3 pauseCurrentActiveSession];
}

- (void)resumeCurrentSystemSession
{
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    int v7 = "-[RPAngelProxy resumeCurrentSystemSession]";
    __int16 v8 = 1024;
    int v9 = 192;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  v3 = +[RPClientManager sharedInstance];
  int v4 = [v3 getClientWithBundleID:@"com.apple.springboard"];

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100039FDC;
  v5[3] = &unk_100085318;
  v5[4] = self;
  [v4 resumeSystemRecordingWithCompletionHandler:v5];
}

- (void).cxx_destruct
{
}

@end