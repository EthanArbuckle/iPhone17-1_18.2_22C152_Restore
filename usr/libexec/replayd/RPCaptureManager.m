@interface RPCaptureManager
+ (id)sharedInstance;
- (NSString)systemBroadcastHostBundleId;
- (RPCaptureManager)init;
- (void)dealloc;
- (void)enableMicrophone;
- (void)restartAppAudioCaptureForProcessID:(int)a3;
- (void)screenCaptureDidFailWithError:(id)a3;
- (void)setAVAudioSessionCategory;
- (void)setSystemBroadcastHostBundleId:(id)a3;
- (void)startAppAudioCaptureForSystemRecording:(BOOL)a3 processID:(int)a4 contextIDs:(id)a5 outputHandler:(id)a6 didStartHandler:(id)a7;
- (void)startCaptureForDelegate:(id)a3 forProcessID:(int)a4 shouldStartMicrophoneCapture:(BOOL)a5 windowSize:(CGSize)a6 systemRecording:(BOOL)a7 contextIDs:(id)a8 didStartHandler:(id)a9;
- (void)startCaptureForDelegate:(id)a3 forProcessID:(int)a4 shouldStartMicrophoneCapture:(BOOL)a5 windowSize:(CGSize)a6 systemRecording:(BOOL)a7 contextIDs:(id)a8 mixedRealityCamera:(BOOL)a9 didStartHandler:(id)a10;
- (void)startCaptureManagersForProcessID:(int)a3 windowSize:(CGSize)a4 systemRecording:(BOOL)a5 contextIDs:(id)a6 mixedRealityCamera:(BOOL)a7 dispatchGroup:(id)a8;
- (void)startMicrophoneCaptureWithDispatchGroup:(id)a3;
- (void)stopAllCapture;
- (void)stopAppAudioCapture;
- (void)stopCaptureForDelegate:(id)a3;
- (void)updateContextIDs:(id)a3 forProcessID:(int)a4 systemRecording:(BOOL)a5;
@end

@implementation RPCaptureManager

+ (id)sharedInstance
{
  if (qword_100099DC8 != -1) {
    dispatch_once(&qword_100099DC8, &stru_100086200);
  }
  v2 = (void *)qword_100099DC0;

  return v2;
}

- (RPCaptureManager)init
{
  v15.receiver = self;
  v15.super_class = (Class)RPCaptureManager;
  v2 = [(RPDelegateBase *)&v15 init];
  if (v2)
  {
    if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446722;
      v17 = "-[RPCaptureManager init]";
      __int16 v18 = 1024;
      int v19 = 61;
      __int16 v20 = 2048;
      v21 = v2;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p", buf, 0x1Cu);
    }
    v3 = [[RPScreenCaptureManager alloc] initWithDelegate:v2];
    screenCaptureManager = v2->_screenCaptureManager;
    v2->_screenCaptureManager = v3;

    v5 = objc_alloc_init(RPMicAudioCaptureManager);
    micAudioCaptureManager = v2->_micAudioCaptureManager;
    v2->_micAudioCaptureManager = v5;

    v7 = objc_alloc_init(RPAppAudioCaptureManager);
    appAudioCaptureManager = v2->_appAudioCaptureManager;
    v2->_appAudioCaptureManager = v7;

    v2->_captureState = 0;
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.ReplayKit.CaptureProcessQueue", 0);
    captureProcessQueue = v2->_captureProcessQueue;
    v2->_captureProcessQueue = (OS_dispatch_queue *)v9;

    dispatch_queue_t v11 = dispatch_queue_create("com.apple.ReplayKit.CaptureErrorQueue", 0);
    captureErrorQueue = v2->_captureErrorQueue;
    v2->_captureErrorQueue = (OS_dispatch_queue *)v11;

    v2->_currentProcessID = 0;
    currentContextID = v2->_currentContextID;
    v2->_currentContextID = 0;

    v2->_isSystemRecording = 0;
    [(RPDelegateBase *)v2 setProtocol:&OBJC_PROTOCOL___RPCaptureManagerProtocol];
  }
  return v2;
}

- (void)dealloc
{
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v5 = "-[RPCaptureManager dealloc]";
    __int16 v6 = 1024;
    int v7 = 79;
    __int16 v8 = 2048;
    dispatch_queue_t v9 = self;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p", buf, 0x1Cu);
  }
  v3.receiver = self;
  v3.super_class = (Class)RPCaptureManager;
  [(RPDelegateBase *)&v3 dealloc];
}

- (void)setSystemBroadcastHostBundleId:(id)a3
{
  objc_storeStrong((id *)&self->_systemBroadcastHostBundleId, a3);
  id v5 = a3;
  [(RPScreenCaptureManager *)self->_screenCaptureManager setSystemBroadcastHostBundleId:v5];
}

- (void)startMicrophoneCaptureWithDispatchGroup:(id)a3
{
  v4 = a3;
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    dispatch_queue_t v11 = "-[RPCaptureManager startMicrophoneCaptureWithDispatchGroup:]";
    __int16 v12 = 1024;
    int v13 = 89;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  dispatch_group_enter(v4);
  micAudioCaptureManager = self->_micAudioCaptureManager;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10004B174;
  v9[3] = &unk_100086248;
  v9[4] = self;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10004B208;
  v7[3] = &unk_100084E28;
  __int16 v8 = v4;
  __int16 v6 = v4;
  [(RPMicAudioCaptureManager *)micAudioCaptureManager startMicrophoneCaptureWithOutput:v9 didStartHandler:v7];
}

- (void)startAppAudioCaptureForSystemRecording:(BOOL)a3 processID:(int)a4 contextIDs:(id)a5 outputHandler:(id)a6 didStartHandler:(id)a7
{
  uint64_t v9 = *(void *)&a4;
  BOOL v10 = a3;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v22 = 136446722;
    v23 = "-[RPCaptureManager startAppAudioCaptureForSystemRecording:processID:contextIDs:outputHandler:didStartHandler:]";
    __int16 v24 = 1024;
    int v25 = 106;
    __int16 v26 = 1024;
    int v27 = v9;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d pid %d", (uint8_t *)&v22, 0x18u);
  }
  objc_super v15 = [v12 firstObject];
  id v16 = +[RPAppAudioCaptureManager audioCaptureConfigForSystemRecording:v10 processID:v9 contextID:v15];
  __int16 v18 = v17;

  appAudioCaptureManager = self->_appAudioCaptureManager;
  id v20 = v18;
  v21 = v20;
  if (appAudioCaptureManager) {
    -[RPAppAudioCaptureManager startWithConfig:outputHandler:didStartHandler:](appAudioCaptureManager, "startWithConfig:outputHandler:didStartHandler:", v16, v18, v13, v14);
  }
  else {
}
  }

- (void)restartAppAudioCaptureForProcessID:(int)a3
{
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    uint64_t v9 = "-[RPCaptureManager restartAppAudioCaptureForProcessID:]";
    __int16 v10 = 1024;
    int v11 = 120;
    __int16 v12 = 1024;
    int v13 = a3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d pid %d", buf, 0x18u);
  }
  captureProcessQueue = self->_captureProcessQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10004B5C0;
  v6[3] = &unk_100085A50;
  v6[4] = self;
  int v7 = a3;
  dispatch_async(captureProcessQueue, v6);
}

- (void)stopAppAudioCapture
{
}

- (void)stopAllCapture
{
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136446466;
    __int16 v6 = "-[RPCaptureManager stopAllCapture]";
    __int16 v7 = 1024;
    int v8 = 165;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v5, 0x12u);
  }
  transaction = self->_transaction;
  self->_transaction = 0;

  self->_captureState = 0;
  self->_currentProcessID = 0;
  currentContextID = self->_currentContextID;
  self->_currentContextID = 0;

  self->_isSystemRecording = 0;
  [(RPScreenCaptureManager *)self->_screenCaptureManager stop];
  [(RPMicAudioCaptureManager *)self->_micAudioCaptureManager stopAllCapture];
  [(RPCaptureManager *)self stopAppAudioCapture];
  [(RPDelegateBase *)self removeAllDelegates];
}

- (void)stopCaptureForDelegate:(id)a3
{
  id v4 = a3;
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    int v11 = "-[RPCaptureManager stopCaptureForDelegate:]";
    __int16 v12 = 1024;
    int v13 = 179;
    __int16 v14 = 2048;
    id v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d delegate %p", buf, 0x1Cu);
  }
  systemBroadcastHostBundleId = self->_systemBroadcastHostBundleId;
  self->_systemBroadcastHostBundleId = 0;

  captureProcessQueue = self->_captureProcessQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10004B968;
  v8[3] = &unk_100084DD8;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_sync(captureProcessQueue, v8);
}

- (void)startCaptureForDelegate:(id)a3 forProcessID:(int)a4 shouldStartMicrophoneCapture:(BOOL)a5 windowSize:(CGSize)a6 systemRecording:(BOOL)a7 contextIDs:(id)a8 didStartHandler:(id)a9
{
}

- (void)startCaptureForDelegate:(id)a3 forProcessID:(int)a4 shouldStartMicrophoneCapture:(BOOL)a5 windowSize:(CGSize)a6 systemRecording:(BOOL)a7 contextIDs:(id)a8 mixedRealityCamera:(BOOL)a9 didStartHandler:(id)a10
{
  CGFloat height = a6.height;
  CGFloat width = a6.width;
  id v17 = a3;
  id v18 = a8;
  int v19 = (void (**)(id, void))a10;
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    *(void *)&uint8_t buf[4] = "-[RPCaptureManager startCaptureForDelegate:forProcessID:shouldStartMicrophoneCapture:windowSize"
                         ":systemRecording:contextIDs:mixedRealityCamera:didStartHandler:]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 204;
    *(_WORD *)&buf[18] = 2048;
    *(void *)&buf[20] = v17;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d delegate %p", buf, 0x1Cu);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  buf[24] = 0;
  failedToStartError = self->_failedToStartError;
  self->_failedToStartError = 0;

  captureProcessQueue = self->_captureProcessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004BDE8;
  block[3] = &unk_100086270;
  block[4] = self;
  id v22 = v18;
  id v27 = v22;
  int v32 = a4;
  BOOL v33 = a7;
  id v23 = v17;
  CGFloat v30 = width;
  CGFloat v31 = height;
  BOOL v34 = a9;
  BOOL v35 = a5;
  id v28 = v23;
  v29 = buf;
  dispatch_sync(captureProcessQueue, block);
  if (v19)
  {
    if (*(unsigned char *)(*(void *)&buf[8] + 24))
    {
      v19[2](v19, 0);
    }
    else if (self->_failedToStartError)
    {
      ((void (*)(void (**)(id, void)))v19[2])(v19);
    }
    else
    {
      __int16 v24 = +[NSError _rpUserErrorForCode:-5833 userInfo:0];
      ((void (**)(id, void *))v19)[2](v19, v24);
    }
  }

  _Block_object_dispose(buf, 8);
}

- (void)startCaptureManagersForProcessID:(int)a3 windowSize:(CGSize)a4 systemRecording:(BOOL)a5 contextIDs:(id)a6 mixedRealityCamera:(BOOL)a7 dispatchGroup:(id)a8
{
  BOOL v8 = a7;
  BOOL v10 = a5;
  double height = a4.height;
  double width = a4.width;
  uint64_t v13 = *(void *)&a3;
  id v15 = a8;
  id v16 = a6;
  dispatch_group_enter(v15);
  self->_mixedRealityCamera = v8;
  screenCaptureManager = self->_screenCaptureManager;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_10004C358;
  v25[3] = &unk_1000862B8;
  v25[4] = self;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10004C3E8;
  v23[3] = &unk_1000856C0;
  id v18 = v15;
  __int16 v24 = v18;
  -[RPScreenCaptureManager startSessionWithPID:windowSize:systemRecording:contextIDs:mixedRealityCamera:outputHandler:didStartHandler:](screenCaptureManager, "startSessionWithPID:windowSize:systemRecording:contextIDs:mixedRealityCamera:outputHandler:didStartHandler:", v13, v10, v16, v8, v25, v23, width, height);
  [(RPCaptureManager *)self setAVAudioSessionCategory];
  dispatch_group_enter(v18);
  v21 = v18;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10004C4C8;
  v22[3] = &unk_100086248;
  v22[4] = self;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10004C55C;
  v20[3] = &unk_1000856C0;
  int v19 = v18;
  [(RPCaptureManager *)self startAppAudioCaptureForSystemRecording:v10 processID:v13 contextIDs:v16 outputHandler:v22 didStartHandler:v20];
}

- (void)updateContextIDs:(id)a3 forProcessID:(int)a4 systemRecording:(BOOL)a5
{
  id v8 = a3;
  id v9 = v8;
  if (v8)
  {
    BOOL v10 = [v8 firstObject];
  }
  else
  {
    if (dword_100099BB8 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100055D28();
    }
    BOOL v10 = 0;
  }
  int currentProcessID = self->_currentProcessID;
  if (currentProcessID) {
    BOOL v12 = currentProcessID == a4;
  }
  else {
    BOOL v12 = 1;
  }
  if (!v12 || self->_currentContextID && (objc_msgSend(v10, "isEqualToString:") & 1) == 0)
  {
    if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = self->_currentProcessID;
      currentContextID = self->_currentContextID;
      *(_DWORD *)buf = 136447490;
      id v18 = "-[RPCaptureManager updateContextIDs:forProcessID:systemRecording:]";
      __int16 v19 = 1024;
      int v20 = 328;
      __int16 v21 = 1024;
      int v22 = v13;
      __int16 v23 = 1024;
      int v24 = a4;
      __int16 v25 = 2112;
      __int16 v26 = currentContextID;
      __int16 v27 = 2112;
      id v28 = v10;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d current capture stopped by interruption process changed %d to %d context changed %@ to %@", buf, 0x32u);
    }
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10004C860;
    v16[3] = &unk_1000862E0;
    v16[4] = self;
    [(RPDelegateBase *)self callDelegate:v16];
    [(RPCaptureManager *)self stopAllCapture];
  }
  self->_int currentProcessID = a4;
  id v15 = self->_currentContextID;
  self->_currentContextID = (NSString *)v10;

  self->_isSystemRecording = a5;
}

- (void)enableMicrophone
{
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    __int16 v6 = "-[RPCaptureManager enableMicrophone]";
    __int16 v7 = 1024;
    int v8 = 344;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  captureProcessQueue = self->_captureProcessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004CA90;
  block[3] = &unk_100084E28;
  block[4] = self;
  dispatch_async(captureProcessQueue, block);
}

- (void)setAVAudioSessionCategory
{
  v2 = +[AVAudioSession sharedInstance];
  id v5 = 0;
  [v2 setCategory:AVAudioSessionCategoryPlayAndRecord withOptions:5 error:&v5];
  id v3 = v5;

  if (v3) {
    BOOL v4 = dword_100099BB8 > 2;
  }
  else {
    BOOL v4 = 1;
  }
  if (!v4 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100055DC0(v3);
  }
}

- (void)screenCaptureDidFailWithError:(id)a3
{
  id v4 = a3;
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    int v11 = "-[RPCaptureManager screenCaptureDidFailWithError:]";
    __int16 v12 = 1024;
    int v13 = 364;
    __int16 v14 = 2112;
    id v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d error %@", buf, 0x1Cu);
  }
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10004CD24;
  v8[3] = &unk_1000862E0;
  id v9 = v4;
  id v5 = v4;
  [(RPDelegateBase *)self callDelegate:v8];
  captureProcessQueue = self->_captureProcessQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10004CD30;
  v7[3] = &unk_100084E28;
  void v7[4] = self;
  dispatch_async(captureProcessQueue, v7);
}

- (NSString)systemBroadcastHostBundleId
{
  return self->_systemBroadcastHostBundleId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemBroadcastHostBundleId, 0);
  objc_storeStrong((id *)&self->_failedToStartError, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_currentContextID, 0);
  objc_storeStrong((id *)&self->_captureErrorQueue, 0);
  objc_storeStrong((id *)&self->_captureProcessQueue, 0);
  objc_storeStrong((id *)&self->_appAudioCaptureManager, 0);
  objc_storeStrong((id *)&self->_micAudioCaptureManager, 0);

  objc_storeStrong((id *)&self->_screenCaptureManager, 0);
}

@end