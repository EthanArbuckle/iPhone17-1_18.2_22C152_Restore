@interface RPScreenCaptureManager
+ (id)newInstance;
- (NSString)systemBroadcastHostBundleId;
- (RPScreenCaptureManager)initWithDelegate:(id)a3;
- (void)setSystemBroadcastHostBundleId:(id)a3;
- (void)startSessionWithPID:(int)a3 windowSize:(CGSize)a4 systemRecording:(BOOL)a5 contextIDs:(id)a6 mixedRealityCamera:(BOOL)a7 outputHandler:(id)a8 didStartHandler:(id)a9;
- (void)stop;
@end

@implementation RPScreenCaptureManager

+ (id)newInstance
{
  return objc_alloc_init(RPScreenCaptureManagerIOS);
}

- (RPScreenCaptureManager)initWithDelegate:(id)a3
{
  id v5 = a3;
  v6 = +[RPScreenCaptureManager newInstance];

  if (v6)
  {
    if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136446722;
      v11 = "-[RPScreenCaptureManager initWithDelegate:]";
      __int16 v12 = 1024;
      int v13 = 29;
      __int16 v14 = 2048;
      v15 = v6;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p", (uint8_t *)&v10, 0x1Cu);
    }
    id screenCaptureOutputHandler = v6->_screenCaptureOutputHandler;
    v6->_id screenCaptureOutputHandler = 0;

    id didStartScreenCaptureHandler = v6->_didStartScreenCaptureHandler;
    v6->_id didStartScreenCaptureHandler = 0;

    objc_storeStrong((id *)&v6->_delegate, a3);
    v6->_screenCaptureDidStart = 0;
  }

  return v6;
}

- (void)startSessionWithPID:(int)a3 windowSize:(CGSize)a4 systemRecording:(BOOL)a5 contextIDs:(id)a6 mixedRealityCamera:(BOOL)a7 outputHandler:(id)a8 didStartHandler:(id)a9
{
  id v12 = a6;
  id v13 = a8;
  id v14 = a9;
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 136446722;
    v16 = "-[RPScreenCaptureManager startSessionWithPID:windowSize:systemRecording:contextIDs:mixedRealityCamera:outputHa"
          "ndler:didStartHandler:]";
    __int16 v17 = 1024;
    int v18 = 39;
    __int16 v19 = 2048;
    v20 = self;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p", (uint8_t *)&v15, 0x1Cu);
  }
}

- (void)stop
{
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136446722;
    v4 = "-[RPScreenCaptureManager stop]";
    __int16 v5 = 1024;
    int v6 = 43;
    __int16 v7 = 2048;
    v8 = self;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p", (uint8_t *)&v3, 0x1Cu);
  }
}

- (NSString)systemBroadcastHostBundleId
{
  return self->_systemBroadcastHostBundleId;
}

- (void)setSystemBroadcastHostBundleId:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemBroadcastHostBundleId, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong(&self->_didStartScreenCaptureHandler, 0);

  objc_storeStrong(&self->_screenCaptureOutputHandler, 0);
}

@end