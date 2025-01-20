@interface RPConnectionManager
+ (BOOL)hasUnitTestEntitlement;
+ (RPConnectionManager)sharedInstance;
+ (id)uniqueClientIdentifierWithPID:(int)a3;
- (BOOL)hasBroadcastEntitlements;
- (BOOL)hasSystemRecordingEntitlements;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)releaseSandboxExtensionHandle:(int64_t)a3;
- (NSXPCConnection)currentConnection;
- (RPConnectionManager)init;
- (id)connectionManagerQueue;
- (id)getCurrentConnection;
- (int64_t)consumeSandboxExtensionToken:(id)a3;
- (void)consumeSandboxExtension:(id)a3 processNewConnection:(BOOL)a4;
- (void)discardInAppRecordingWithHandler:(id)a3;
- (void)exportClipToURL:(id)a3 duration:(double)a4 completionHandler:(id)a5;
- (void)exportClipToURL:(id)a3 duration:(double)a4 extensionToken:(id)a5 completionHandler:(id)a6;
- (void)finishStartup;
- (void)getSystemBroadcastExtensionInfo:(id)a3;
- (void)getSystemBroadcastPickerInfo:(id)a3;
- (void)macApplicationDidBecomeActiveWithContextID:(id)a3 completionHandler:(id)a4;
- (void)macApplicationDidResignActive;
- (void)openControlCenterSystemRecordingView;
- (void)pauseInAppBroadcast;
- (void)pauseInAppCapture;
- (void)pauseInAppRecording;
- (void)processNewConnection:(id)a3;
- (void)reportCameraUsage:(int64_t)a3;
- (void)resumeInAppBroadcastWithWindowLayerContextID:(id)a3 completionHandler:(id)a4;
- (void)resumeInAppCaptureWithWindowLayerContextID:(id)a3 completionHandler:(id)a4;
- (void)resumeInAppClipWithWindowLayerContextID:(id)a3 completionHandler:(id)a4;
- (void)resumeInAppRecordingWithWindowLayerContextID:(id)a3 completionHandler:(id)a4;
- (void)resumeSystemBroadcastWithCompletionHandler:(id)a3;
- (void)resumeSystemRecordingWithCompletionHandler:(id)a3;
- (void)saveClipToCameraRoll:(id)a3 extensionToken:(id)a4 handler:(id)a5;
- (void)saveClipToCameraRoll:(id)a3 handler:(id)a4;
- (void)saveVideo:(id)a3 extensionToken:(id)a4 handler:(id)a5;
- (void)saveVideo:(id)a3 handler:(id)a4;
- (void)saveVideoToCameraRoll:(id)a3 handler:(id)a4;
- (void)setBroadcastPickerPreferredExt:(id)a3 showsMicButton:(BOOL)a4;
- (void)setBroadcastURL:(id)a3;
- (void)setCurrentConnection:(id)a3;
- (void)setMicrophoneEnabled:(BOOL)a3;
- (void)setupBroadcastWithHostBundleID:(id)a3 broadcastExtensionBundleID:(id)a4 broadcastConfigurationData:(id)a5 userInfo:(id)a6 handler:(id)a7;
- (void)setupSystemBroadcastWithHostBundleID:(id)a3 broadcastExtensionBundleID:(id)a4 broadcastConfigurationData:(id)a5 userInfo:(id)a6 handler:(id)a7;
- (void)startClipBufferingWithContextID:(id)a3 windowSize:(CGSize)a4 microphoneEnabled:(BOOL)a5 cameraEnabled:(BOOL)a6 withCompletionHandler:(id)a7;
- (void)startInAppBroadcastWithContextID:(id)a3 windowSize:(CGSize)a4 microphoneEnabled:(BOOL)a5 cameraEnabled:(BOOL)a6 listenerEndpoint:(id)a7 withHandler:(id)a8;
- (void)startInAppCaptureWithContextID:(id)a3 windowSize:(CGSize)a4 microphoneEnabled:(BOOL)a5 cameraEnabled:(BOOL)a6 withHandler:(id)a7;
- (void)startInAppRecordingWithContextID:(id)a3 windowSize:(CGSize)a4 microphoneEnabled:(BOOL)a5 cameraEnabled:(BOOL)a6 withHandler:(id)a7;
- (void)startSystemBroadcastWithContextID:(id)a3 windowSize:(CGSize)a4 microphoneEnabled:(BOOL)a5 cameraEnabled:(BOOL)a6 listenerEndpoint:(id)a7 withHandler:(id)a8;
- (void)startSystemRecordingWithContextID:(id)a3 windowSize:(CGSize)a4 microphoneEnabled:(BOOL)a5 cameraEnabled:(BOOL)a6 withHandler:(id)a7;
- (void)stopAllActiveClients;
- (void)stopAndDiscardInAppRecordingFromFilePermissionErrorWithHandler:(id)a3;
- (void)stopClipBufferingWithCompletionHandler:(id)a3;
- (void)stopCurrentActiveSessionWithHandler:(id)a3;
- (void)stopInAppBroadcastWithHandler:(id)a3;
- (void)stopInAppCaptureWithHandler:(id)a3;
- (void)stopInAppRecordingWithHandler:(id)a3;
- (void)stopInAppRecordingWithUrl:(id)a3 extensionToken:(id)a4 handler:(id)a5;
- (void)stopInAppRecordingWithUrl:(id)a3 handler:(id)a4;
- (void)stopSystemBroadcastWithHandler:(id)a3;
- (void)stopSystemRecordingWithHandler:(id)a3;
- (void)stopSystemRecordingWithURLHandler:(id)a3;
- (void)updateProcessIDForAudioCaptureWithPID:(int)a3;
@end

@implementation RPConnectionManager

- (void)finishStartup
{
}

+ (RPConnectionManager)sharedInstance
{
  if (qword_100099C88 != -1) {
    dispatch_once(&qword_100099C88, &stru_100085990);
  }
  v2 = (void *)qword_100099C80;

  return (RPConnectionManager *)v2;
}

- (RPConnectionManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)RPConnectionManager;
  v2 = [(RPConnectionManager *)&v8 init];
  if (v2)
  {
    v3 = (NSXPCListener *)[objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.replayd"];
    publicListener = v2->_publicListener;
    v2->_publicListener = v3;

    [(NSXPCListener *)v2->_publicListener setDelegate:v2];
    v5 = [[RPRecordingManager alloc] initWithConnectionManager:v2];
    recordingManager = v2->_recordingManager;
    v2->_recordingManager = v5;
  }
  return v2;
}

- (BOOL)hasSystemRecordingEntitlements
{
  v2 = +[NSXPCConnection currentConnection];
  v3 = [v2 valueForEntitlement:@"com.apple.private.replay-kit"];
  unsigned __int8 v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)hasBroadcastEntitlements
{
  v3 = +[NSXPCConnection currentConnection];
  unsigned __int8 v4 = [v3 valueForEntitlement:@"com.apple.private.replay-kit.can-setup-broadcast"];
  unsigned __int8 v5 = [v4 BOOLValue];

  LOBYTE(self) = v5 | [(RPConnectionManager *)self hasSystemRecordingEntitlements];
  return (char)self;
}

+ (id)uniqueClientIdentifierWithPID:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  unsigned __int8 v4 = +[NSBundle bundleWithPID:](NSBundle, "bundleWithPID:");
  unsigned __int8 v5 = v4;
  if (v4
    && ([v4 bundleIdentifier], v6 = objc_claimAutoreleasedReturnValue(), v6, v6))
  {
    v7 = [v5 bundleIdentifier];
    objc_super v8 = +[NSMutableString stringWithString:v7];

    if (!dword_100099BB8 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v13 = "+[RPConnectionManager uniqueClientIdentifierWithPID:]";
      __int16 v14 = 1024;
      int v15 = 125;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [DEBUG] %{public}s:%d using identifier from bundle", buf, 0x12u);
    }
  }
  else
  {
    v9 = +[NSBundle executablePathWithPID:v3];
    if ([v9 length])
    {
      if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        v13 = "+[RPConnectionManager uniqueClientIdentifierWithPID:]";
        __int16 v14 = 1024;
        int v15 = 133;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d using identifier from executablePath", buf, 0x12u);
      }
      id v10 = v9;
    }
    else
    {
      if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        v13 = "+[RPConnectionManager uniqueClientIdentifierWithPID:]";
        __int16 v14 = 1024;
        int v15 = 143;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d using identifier from processIdentifier", buf, 0x12u);
      }
      id v10 = +[NSString stringWithFormat:@"com.apple.replaykit.client-with-pid.%d", v3];
    }
    objc_super v8 = v10;
  }

  return v8;
}

+ (BOOL)hasUnitTestEntitlement
{
  uint64_t v3 = +[RPConnectionManager sharedInstance];
  unsigned __int8 v4 = [v3 currentConnection];
  unsigned __int8 v5 = [v4 valueForEntitlement:@"com.apple.internal.test.replaykit"];

  if (!dword_100099BB8 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    int v10 = 136447234;
    v11 = "+[RPConnectionManager hasUnitTestEntitlement]";
    __int16 v12 = 1024;
    int v13 = 153;
    __int16 v14 = 2112;
    int v15 = v7;
    __int16 v16 = 2048;
    id v17 = a1;
    __int16 v18 = 1024;
    unsigned int v19 = [v5 BOOLValue];
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [DEBUG] %{public}s:%d %@ %p %d", (uint8_t *)&v10, 0x2Cu);
  }
  unsigned __int8 v8 = [v5 BOOLValue];

  return v8;
}

- (id)connectionManagerQueue
{
  if (qword_100099C98 != -1) {
    dispatch_once(&qword_100099C98, &stru_1000859B0);
  }
  v2 = (void *)qword_100099C90;

  return v2;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136446466;
    int v13 = "-[RPConnectionManager listener:shouldAcceptNewConnection:]";
    __int16 v14 = 1024;
    int v15 = 169;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v12, 0x12u);
  }
  [v7 setExportedObject:self];
  unsigned __int8 v8 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___RPDaemonProtocol];
  v9 = +[NSSet setWithObject:objc_opt_class()];
  [v8 setClasses:v9 forSelector:"startInAppRecordingWithContextID:windowSize:microphoneEnabled:cameraEnabled:withHandler:" argumentIndex:4 ofReply:0];

  [v7 setExportedInterface:v8];
  int v10 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___RPClientProtocol];
  [v7 setRemoteObjectInterface:v10];

  [(RPConnectionManager *)self processNewConnection:v7];
  [v7 resume];

  return 1;
}

- (void)processNewConnection:(id)a3
{
  id v4 = a3;
  id v5 = [v4 processIdentifier];
  id v6 = +[RPConnectionManager uniqueClientIdentifierWithPID:v5];
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v20 = "-[RPConnectionManager processNewConnection:]";
    __int16 v21 = 1024;
    int v22 = 195;
    __int16 v23 = 1024;
    int v24 = (int)v5;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d accepted client connection PID: %d", buf, 0x18u);
  }
  if (([off_100099968 isEqualToString:v6] & 1) == 0
    && ([off_100099970 isEqualToString:v6] & 1) == 0)
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100025118;
    v16[3] = &unk_1000859D8;
    v16[4] = self;
    id v7 = v6;
    id v17 = v7;
    int v18 = (int)v5;
    [v4 setInterruptionHandler:v16];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10002527C;
    v13[3] = &unk_1000859D8;
    v13[4] = self;
    id v8 = v7;
    id v14 = v8;
    int v15 = (int)v5;
    [v4 setInvalidationHandler:v13];
    v9 = [(RPConnectionManager *)self connectionManagerQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000253E0;
    block[3] = &unk_100085A00;
    block[4] = self;
    id v11 = v4;
    id v12 = v8;
    dispatch_sync(v9, block);
  }
}

- (void)setCurrentConnection:(id)a3
{
  p_currentConnection = &self->_currentConnection;
  id v7 = a3;
  id v4 = objc_storeWeak((id *)p_currentConnection, v7);
  id v5 = [v7 processIdentifier];

  id v6 = +[RPMultipleClientProxy clientProxy];
  [v6 setCurrentConnectionProcessIdentifier:v5];
}

- (id)getCurrentConnection
{
  uint64_t v3 = +[NSXPCConnection currentConnection];
  id v4 = v3;
  if (v3) {
    id WeakRetained = v3;
  }
  else {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_currentConnection);
  }
  id v6 = WeakRetained;

  return v6;
}

- (void)stopAndDiscardInAppRecordingFromFilePermissionErrorWithHandler:(id)a3
{
  id v4 = a3;
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    int v10 = "-[RPConnectionManager stopAndDiscardInAppRecordingFromFilePermissionErrorWithHandler:]";
    __int16 v11 = 1024;
    int v12 = 234;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  recordingManager = self->_recordingManager;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002562C;
  v7[3] = &unk_1000853E0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(RPRecordingManager *)recordingManager stopInAppRecordingWithHandler:v7];
}

- (void)stopCurrentActiveSessionWithHandler:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RPConnectionManager: stopCurrentActiveSessionWithHandler", buf, 2u);
  }
  id v5 = +[NSXPCConnection currentConnection];
  [(RPConnectionManager *)self setCurrentConnection:v5];

  id v6 = [(RPConnectionManager *)self connectionManagerQueue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000259A4;
  v8[3] = &unk_100084EB8;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_sync(v6, v8);
}

- (void)stopAllActiveClients
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RPConnectionManager: stopAllActiveClients", buf, 2u);
  }
  uint64_t v3 = +[NSXPCConnection currentConnection];
  [(RPConnectionManager *)self setCurrentConnection:v3];

  id v4 = [(RPConnectionManager *)self connectionManagerQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100025AFC;
  block[3] = &unk_100084E28;
  block[4] = self;
  dispatch_sync(v4, block);
}

- (void)getSystemBroadcastExtensionInfo:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RPConnectionManager: getSystemBroadcastExtensionInfo", buf, 2u);
  }
  id v5 = +[NSXPCConnection currentConnection];
  [(RPConnectionManager *)self setCurrentConnection:v5];

  id v6 = [(RPConnectionManager *)self connectionManagerQueue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100025C7C;
  v8[3] = &unk_100084EB8;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_sync(v6, v8);
}

- (void)setBroadcastURL:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RPConnectionManager: setBroadcastURL", buf, 2u);
  }
  id v5 = +[NSXPCConnection currentConnection];
  [(RPConnectionManager *)self setCurrentConnection:v5];

  id v6 = [(RPConnectionManager *)self connectionManagerQueue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100025DFC;
  v8[3] = &unk_100084DD8;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_sync(v6, v8);
}

- (void)updateProcessIDForAudioCaptureWithPID:(int)a3
{
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    int v10 = "-[RPConnectionManager updateProcessIDForAudioCaptureWithPID:]";
    __int16 v11 = 1024;
    int v12 = 284;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  id v5 = +[NSXPCConnection currentConnection];
  [(RPConnectionManager *)self setCurrentConnection:v5];

  id v6 = [(RPConnectionManager *)self connectionManagerQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100025FC8;
  v7[3] = &unk_100085A50;
  v7[4] = self;
  int v8 = a3;
  dispatch_sync(v6, v7);
}

- (void)startInAppRecordingWithContextID:(id)a3 windowSize:(CGSize)a4 microphoneEnabled:(BOOL)a5 cameraEnabled:(BOOL)a6 withHandler:(id)a7
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  id v13 = a3;
  id v14 = a7;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RPConnectionManager: startInAppRecordingWithContextID", buf, 2u);
  }
  int v15 = +[NSXPCConnection currentConnection];
  [(RPConnectionManager *)self setCurrentConnection:v15];

  __int16 v16 = [(RPConnectionManager *)self connectionManagerQueue];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100026204;
  v19[3] = &unk_100085A78;
  v19[4] = self;
  id v20 = v13;
  CGFloat v22 = width;
  CGFloat v23 = height;
  BOOL v24 = a5;
  BOOL v25 = a6;
  id v21 = v14;
  id v17 = v14;
  id v18 = v13;
  dispatch_sync(v16, v19);
}

- (void)resumeInAppRecordingWithWindowLayerContextID:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    __int16 v16 = "-[RPConnectionManager resumeInAppRecordingWithWindowLayerContextID:completionHandler:]";
    __int16 v17 = 1024;
    int v18 = 307;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  int v8 = +[NSXPCConnection currentConnection];
  [(RPConnectionManager *)self setCurrentConnection:v8];

  id v9 = [(RPConnectionManager *)self connectionManagerQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100026504;
  block[3] = &unk_100084D88;
  block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_sync(v9, block);
}

- (void)stopInAppRecordingWithHandler:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RPConnectionManager: stopInAppRecordingWithHandler", buf, 2u);
  }
  id v5 = +[NSXPCConnection currentConnection];
  [(RPConnectionManager *)self setCurrentConnection:v5];

  id v6 = [(RPConnectionManager *)self connectionManagerQueue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000267B8;
  v8[3] = &unk_100084EB8;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_sync(v6, v8);
}

- (void)stopInAppRecordingWithUrl:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (dword_100099BB8 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100051FD8();
  }
  int v8 = +[NSXPCConnection currentConnection];
  [(RPConnectionManager *)self setCurrentConnection:v8];

  id v9 = [(RPConnectionManager *)self connectionManagerQueue];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100026A08;
  v11[3] = &unk_100084EB8;
  v11[4] = self;
  id v12 = v7;
  id v10 = v7;
  dispatch_sync(v9, v11);
}

- (void)stopInAppRecordingWithUrl:(id)a3 extensionToken:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    id v21 = "-[RPConnectionManager stopInAppRecordingWithUrl:extensionToken:handler:]";
    __int16 v22 = 1024;
    int v23 = 341;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  id v11 = +[NSXPCConnection currentConnection];
  [(RPConnectionManager *)self setCurrentConnection:v11];

  id v12 = [(RPConnectionManager *)self connectionManagerQueue];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100026BDC;
  v16[3] = &unk_100085AC8;
  v16[4] = self;
  id v17 = v9;
  id v18 = v8;
  id v19 = v10;
  id v13 = v8;
  id v14 = v10;
  id v15 = v9;
  dispatch_sync(v12, v16);
}

- (void)discardInAppRecordingWithHandler:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RPConnectionManager: discardInAppRecordingWithHandler", buf, 2u);
  }
  id v5 = +[NSXPCConnection currentConnection];
  [(RPConnectionManager *)self setCurrentConnection:v5];

  id v6 = [(RPConnectionManager *)self connectionManagerQueue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100026F6C;
  v8[3] = &unk_100084EB8;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_sync(v6, v8);
}

- (void)pauseInAppRecording
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RPConnectionManager: pauseInAppRecording", buf, 2u);
  }
  uint64_t v3 = +[NSXPCConnection currentConnection];
  [(RPConnectionManager *)self setCurrentConnection:v3];

  id v4 = [(RPConnectionManager *)self connectionManagerQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000270C4;
  block[3] = &unk_100084E28;
  block[4] = self;
  dispatch_sync(v4, block);
}

- (void)startInAppCaptureWithContextID:(id)a3 windowSize:(CGSize)a4 microphoneEnabled:(BOOL)a5 cameraEnabled:(BOOL)a6 withHandler:(id)a7
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  id v13 = a3;
  id v14 = a7;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RPConnectionManager: startInAppCaptureWithContextID", buf, 2u);
  }
  id v15 = +[NSXPCConnection currentConnection];
  [(RPConnectionManager *)self setCurrentConnection:v15];

  __int16 v16 = [(RPConnectionManager *)self connectionManagerQueue];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100027294;
  v19[3] = &unk_100085A78;
  v19[4] = self;
  id v20 = v13;
  CGFloat v22 = width;
  CGFloat v23 = height;
  BOOL v24 = a5;
  BOOL v25 = a6;
  id v21 = v14;
  id v17 = v14;
  id v18 = v13;
  dispatch_sync(v16, v19);
}

- (void)stopInAppCaptureWithHandler:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RPConnectionManager: stopInAppCaptureWithHandler", buf, 2u);
  }
  id v5 = +[NSXPCConnection currentConnection];
  [(RPConnectionManager *)self setCurrentConnection:v5];

  id v6 = [(RPConnectionManager *)self connectionManagerQueue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10002750C;
  v8[3] = &unk_100084EB8;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_sync(v6, v8);
}

- (void)pauseInAppCapture
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RPConnectionManager: pauseInAppCapture", buf, 2u);
  }
  uint64_t v3 = +[NSXPCConnection currentConnection];
  [(RPConnectionManager *)self setCurrentConnection:v3];

  id v4 = [(RPConnectionManager *)self connectionManagerQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100027718;
  block[3] = &unk_100084E28;
  block[4] = self;
  dispatch_sync(v4, block);
}

- (void)resumeInAppCaptureWithWindowLayerContextID:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    __int16 v16 = "-[RPConnectionManager resumeInAppCaptureWithWindowLayerContextID:completionHandler:]";
    __int16 v17 = 1024;
    int v18 = 416;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  id v8 = +[NSXPCConnection currentConnection];
  [(RPConnectionManager *)self setCurrentConnection:v8];

  id v9 = [(RPConnectionManager *)self connectionManagerQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100027920;
  block[3] = &unk_100084D88;
  block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_sync(v9, block);
}

- (void)setupBroadcastWithHostBundleID:(id)a3 broadcastExtensionBundleID:(id)a4 broadcastConfigurationData:(id)a5 userInfo:(id)a6 handler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v26 = "-[RPConnectionManager setupBroadcastWithHostBundleID:broadcastExtensionBundleID:broadcastConfigurationData:userInfo:handler:]";
    __int16 v27 = 1024;
    int v28 = 430;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  if ([(RPConnectionManager *)self hasBroadcastEntitlements])
  {
    __int16 v17 = [(RPConnectionManager *)self connectionManagerQueue];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100027D20;
    v19[3] = &unk_100085AF0;
    v19[4] = self;
    id v20 = v12;
    id v21 = v13;
    id v22 = v14;
    id v23 = v15;
    id v24 = v16;
    dispatch_sync(v17, v19);
  }
  else
  {
    if (v16)
    {
      int v18 = +[NSError errorWithDomain:@"com.apple.ReplayKit.RPRecordingErrorDomain" code:-5819 userInfo:0];
      (*((void (**)(id, void *))v16 + 2))(v16, v18);
    }
    if (dword_100099BB8 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100052158();
    }
  }
}

- (void)startInAppBroadcastWithContextID:(id)a3 windowSize:(CGSize)a4 microphoneEnabled:(BOOL)a5 cameraEnabled:(BOOL)a6 listenerEndpoint:(id)a7 withHandler:(id)a8
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  id v15 = a3;
  id v16 = a7;
  id v17 = a8;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RPConnectionManager: startInAppBroadcastWithContextID", buf, 2u);
  }
  int v18 = +[NSXPCConnection currentConnection];
  [(RPConnectionManager *)self setCurrentConnection:v18];

  id v19 = [(RPConnectionManager *)self connectionManagerQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100027F88;
  block[3] = &unk_100085B18;
  block[4] = self;
  id v24 = v15;
  CGFloat v27 = width;
  CGFloat v28 = height;
  BOOL v29 = a5;
  BOOL v30 = a6;
  id v25 = v16;
  id v26 = v17;
  id v20 = v17;
  id v21 = v16;
  id v22 = v15;
  dispatch_sync(v19, block);
}

- (void)stopInAppBroadcastWithHandler:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RPConnectionManager: stopInAppBroadcastWithHandler", buf, 2u);
  }
  id v5 = +[NSXPCConnection currentConnection];
  [(RPConnectionManager *)self setCurrentConnection:v5];

  id v6 = [(RPConnectionManager *)self connectionManagerQueue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100028204;
  v8[3] = &unk_100084EB8;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_sync(v6, v8);
}

- (void)pauseInAppBroadcast
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RPConnectionManager: pauseInAppBroadcast", buf, 2u);
  }
  uint64_t v3 = +[NSXPCConnection currentConnection];
  [(RPConnectionManager *)self setCurrentConnection:v3];

  id v4 = [(RPConnectionManager *)self connectionManagerQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100028410;
  block[3] = &unk_100084E28;
  block[4] = self;
  dispatch_sync(v4, block);
}

- (void)resumeInAppBroadcastWithWindowLayerContextID:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    id v16 = "-[RPConnectionManager resumeInAppBroadcastWithWindowLayerContextID:completionHandler:]";
    __int16 v17 = 1024;
    int v18 = 481;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  id v8 = +[NSXPCConnection currentConnection];
  [(RPConnectionManager *)self setCurrentConnection:v8];

  id v9 = [(RPConnectionManager *)self connectionManagerQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100028618;
  block[3] = &unk_100084D88;
  block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_sync(v9, block);
}

- (void)startSystemRecordingWithContextID:(id)a3 windowSize:(CGSize)a4 microphoneEnabled:(BOOL)a5 cameraEnabled:(BOOL)a6 withHandler:(id)a7
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  id v13 = a3;
  id v14 = a7;
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    id v26 = "-[RPConnectionManager startSystemRecordingWithContextID:windowSize:microphoneEnabled:cameraEnabled:withHandler:]";
    __int16 v27 = 1024;
    int v28 = 496;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  if ([(RPConnectionManager *)self hasSystemRecordingEntitlements])
  {
    id v15 = +[NSXPCConnection currentConnection];
    [(RPConnectionManager *)self setCurrentConnection:v15];

    id v16 = [(RPConnectionManager *)self connectionManagerQueue];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1000289F8;
    v18[3] = &unk_100085A78;
    v18[4] = self;
    id v19 = v13;
    CGFloat v21 = width;
    CGFloat v22 = height;
    BOOL v23 = a5;
    BOOL v24 = a6;
    id v20 = v14;
    dispatch_sync(v16, v18);
  }
  else
  {
    if (v14)
    {
      __int16 v17 = +[NSError errorWithDomain:@"com.apple.ReplayKit.RPRecordingErrorDomain" code:-5810 userInfo:0];
      (*((void (**)(id, void *))v14 + 2))(v14, v17);
    }
    if (dword_100099BB8 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000521D8();
    }
  }
}

- (void)stopSystemRecordingWithHandler:(id)a3
{
  id v4 = a3;
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    id v11 = "-[RPConnectionManager stopSystemRecordingWithHandler:]";
    __int16 v12 = 1024;
    int v13 = 516;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  if ([(RPConnectionManager *)self hasSystemRecordingEntitlements])
  {
    id v5 = +[NSXPCConnection currentConnection];
    [(RPConnectionManager *)self setCurrentConnection:v5];

    id v6 = [(RPConnectionManager *)self connectionManagerQueue];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100028D38;
    v8[3] = &unk_100084EB8;
    v8[4] = self;
    id v9 = v4;
    dispatch_sync(v6, v8);
  }
  else
  {
    if (v4)
    {
      id v7 = +[NSError errorWithDomain:@"com.apple.ReplayKit.RPRecordingErrorDomain" code:-5810 userInfo:0];
      (*((void (**)(id, void *))v4 + 2))(v4, v7);
    }
    if (dword_100099BB8 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100052258();
    }
  }
}

- (void)stopSystemRecordingWithURLHandler:(id)a3
{
  id v4 = a3;
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    id v11 = "-[RPConnectionManager stopSystemRecordingWithURLHandler:]";
    __int16 v12 = 1024;
    int v13 = 536;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  if ([(RPConnectionManager *)self hasSystemRecordingEntitlements])
  {
    id v5 = +[NSXPCConnection currentConnection];
    [(RPConnectionManager *)self setCurrentConnection:v5];

    id v6 = [(RPConnectionManager *)self connectionManagerQueue];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100029050;
    v8[3] = &unk_100084EB8;
    v8[4] = self;
    id v9 = v4;
    dispatch_sync(v6, v8);
  }
  else
  {
    if (v4)
    {
      id v7 = +[NSError errorWithDomain:@"com.apple.ReplayKit.RPRecordingErrorDomain" code:-5810 userInfo:0];
      (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v7);
    }
    if (dword_100099BB8 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000522D8();
    }
  }
}

- (void)resumeSystemRecordingWithCompletionHandler:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    id v10 = "-[RPConnectionManager resumeSystemRecordingWithCompletionHandler:]";
    __int16 v11 = 1024;
    int v12 = 558;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  if (![(RPConnectionManager *)self hasSystemRecordingEntitlements])
  {
    if (dword_100099BB8 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_100052358();
      if (!v4) {
        goto LABEL_10;
      }
    }
    else if (!v4)
    {
      goto LABEL_10;
    }
    v4[2](v4, 0);
    goto LABEL_10;
  }
  id v5 = +[NSXPCConnection currentConnection];
  [(RPConnectionManager *)self setCurrentConnection:v5];

  id v6 = [(RPConnectionManager *)self connectionManagerQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100029358;
  v7[3] = &unk_100084EB8;
  v7[4] = self;
  id v8 = v4;
  dispatch_sync(v6, v7);

LABEL_10:
}

- (void)setupSystemBroadcastWithHostBundleID:(id)a3 broadcastExtensionBundleID:(id)a4 broadcastConfigurationData:(id)a5 userInfo:(id)a6 handler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RPConnectionManager: setupSystemBroadcastWithHostBundleID", buf, 2u);
  }
  __int16 v17 = +[NSXPCConnection currentConnection];
  int v18 = [v17 valueForEntitlement:@"com.apple.private.replay-kit.can-setup-broadcast"];
  unsigned __int8 v19 = [v18 BOOLValue];

  id v20 = [v17 valueForEntitlement:@"com.apple.private.replay-kit"];
  unsigned int v21 = [v20 BOOLValue];

  if ((v19 & 1) != 0 || v21)
  {
    BOOL v23 = [(RPConnectionManager *)self connectionManagerQueue];
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_100029750;
    v24[3] = &unk_100085AF0;
    v24[4] = self;
    id v25 = v12;
    id v26 = v13;
    id v27 = v14;
    id v28 = v15;
    id v29 = v16;
    dispatch_sync(v23, v24);
  }
  else
  {
    if (v16)
    {
      CGFloat v22 = +[NSError errorWithDomain:@"com.apple.ReplayKit.RPRecordingErrorDomain" code:-5819 userInfo:0];
      (*((void (**)(id, void *))v16 + 2))(v16, v22);
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RPConnectionManager: setupBroadcastWithHostBundleID failed because client doesn't have entitlements to setup broadcast", buf, 2u);
    }
  }
}

- (void)startSystemBroadcastWithContextID:(id)a3 windowSize:(CGSize)a4 microphoneEnabled:(BOOL)a5 cameraEnabled:(BOOL)a6 listenerEndpoint:(id)a7 withHandler:(id)a8
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  id v15 = a3;
  id v16 = a7;
  id v17 = a8;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RPConnectionManager: startSystemBroadcastWithContextID", buf, 2u);
  }
  int v18 = +[NSXPCConnection currentConnection];
  [(RPConnectionManager *)self setCurrentConnection:v18];

  unsigned __int8 v19 = [(RPConnectionManager *)self connectionManagerQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100029A20;
  block[3] = &unk_100085B18;
  block[4] = self;
  id v24 = v15;
  CGFloat v27 = width;
  CGFloat v28 = height;
  BOOL v29 = a5;
  BOOL v30 = a6;
  id v25 = v16;
  id v26 = v17;
  id v20 = v17;
  id v21 = v16;
  id v22 = v15;
  dispatch_sync(v19, block);
}

- (void)stopSystemBroadcastWithHandler:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RPConnectionManager: stopSystemBroadcastWithHandler", buf, 2u);
  }
  id v5 = +[NSXPCConnection currentConnection];
  [(RPConnectionManager *)self setCurrentConnection:v5];

  id v6 = [(RPConnectionManager *)self connectionManagerQueue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100029C84;
  v8[3] = &unk_100084EB8;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_sync(v6, v8);
}

- (void)resumeSystemBroadcastWithCompletionHandler:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    id v10 = "-[RPConnectionManager resumeSystemBroadcastWithCompletionHandler:]";
    __int16 v11 = 1024;
    int v12 = 627;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  if (![(RPConnectionManager *)self hasBroadcastEntitlements])
  {
    if (dword_100099BB8 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_1000523D8();
      if (!v4) {
        goto LABEL_10;
      }
    }
    else if (!v4)
    {
      goto LABEL_10;
    }
    v4[2](v4, 0);
    goto LABEL_10;
  }
  id v5 = +[NSXPCConnection currentConnection];
  [(RPConnectionManager *)self setCurrentConnection:v5];

  id v6 = [(RPConnectionManager *)self connectionManagerQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100029F70;
  v7[3] = &unk_100084EB8;
  v7[4] = self;
  id v8 = v4;
  dispatch_sync(v6, v7);

LABEL_10:
}

- (void)startClipBufferingWithContextID:(id)a3 windowSize:(CGSize)a4 microphoneEnabled:(BOOL)a5 cameraEnabled:(BOOL)a6 withCompletionHandler:(id)a7
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  id v13 = a3;
  id v14 = a7;
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    CGFloat v27 = "-[RPConnectionManager startClipBufferingWithContextID:windowSize:microphoneEnabled:cameraEnabled:withCompletionHandler:]";
    __int16 v28 = 1024;
    int v29 = 649;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  id v15 = +[NSXPCConnection currentConnection];
  [(RPConnectionManager *)self setCurrentConnection:v15];

  id v16 = [(RPConnectionManager *)self connectionManagerQueue];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10002A2BC;
  v19[3] = &unk_100085A78;
  v19[4] = self;
  id v20 = v13;
  CGFloat v22 = width;
  CGFloat v23 = height;
  BOOL v24 = a5;
  BOOL v25 = a6;
  id v21 = v14;
  id v17 = v14;
  id v18 = v13;
  dispatch_sync(v16, v19);
}

- (void)stopClipBufferingWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    __int16 v11 = "-[RPConnectionManager stopClipBufferingWithCompletionHandler:]";
    __int16 v12 = 1024;
    int v13 = 662;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  id v5 = +[NSXPCConnection currentConnection];
  [(RPConnectionManager *)self setCurrentConnection:v5];

  id v6 = [(RPConnectionManager *)self connectionManagerQueue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10002A5FC;
  v8[3] = &unk_100084EB8;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_sync(v6, v8);
}

- (void)exportClipToURL:(id)a3 duration:(double)a4 completionHandler:(id)a5
{
  id v6 = a3;
  id v7 = (void (**)(id, void *))a5;
  if (dword_100099BB8 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100052458();
    if (!v7) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  if (v7)
  {
LABEL_4:
    id v8 = +[NSError _rpUserErrorForCode:-5835 userInfo:0];
    v7[2](v7, v8);
  }
LABEL_5:
}

- (void)exportClipToURL:(id)a3 duration:(double)a4 extensionToken:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    BOOL v24 = "-[RPConnectionManager exportClipToURL:duration:extensionToken:completionHandler:]";
    __int16 v25 = 1024;
    int v26 = 682;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  int v13 = +[NSXPCConnection currentConnection];
  [(RPConnectionManager *)self setCurrentConnection:v13];

  id v14 = [(RPConnectionManager *)self connectionManagerQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002AA00;
  block[3] = &unk_100085B40;
  block[4] = self;
  id v19 = v11;
  id v20 = v10;
  id v21 = v12;
  double v22 = a4;
  id v15 = v10;
  id v16 = v12;
  id v17 = v11;
  dispatch_sync(v14, block);
}

- (void)resumeInAppClipWithWindowLayerContextID:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    id v16 = "-[RPConnectionManager resumeInAppClipWithWindowLayerContextID:completionHandler:]";
    __int16 v17 = 1024;
    int v18 = 707;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  id v8 = +[NSXPCConnection currentConnection];
  [(RPConnectionManager *)self setCurrentConnection:v8];

  id v9 = [(RPConnectionManager *)self connectionManagerQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002AE5C;
  block[3] = &unk_100084D88;
  block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_sync(v9, block);
}

- (void)macApplicationDidResignActive
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RPConnectionManager: macApplicationDidResignActive", buf, 2u);
  }
  uint64_t v3 = +[NSXPCConnection currentConnection];
  [(RPConnectionManager *)self setCurrentConnection:v3];

  id v4 = [(RPConnectionManager *)self connectionManagerQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002B0E8;
  block[3] = &unk_100084E28;
  block[4] = self;
  dispatch_sync(v4, block);
}

- (void)macApplicationDidBecomeActiveWithContextID:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    id v16 = "-[RPConnectionManager macApplicationDidBecomeActiveWithContextID:completionHandler:]";
    __int16 v17 = 1024;
    int v18 = 730;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  id v8 = +[NSXPCConnection currentConnection];
  [(RPConnectionManager *)self setCurrentConnection:v8];

  id v9 = [(RPConnectionManager *)self connectionManagerQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002B2F0;
  block[3] = &unk_100084D88;
  block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_sync(v9, block);
}

- (void)saveVideo:(id)a3 handler:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, void *))a4;
  if (dword_100099BB8 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_1000525D8();
  }
  id v7 = +[NSError _rpUserErrorForCode:-5835 userInfo:0];
  v6[2](v6, v7);
}

- (void)saveVideo:(id)a3 extensionToken:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *))a5;
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    *(void *)&uint8_t buf[4] = "-[RPConnectionManager saveVideo:extensionToken:handler:]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 745;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  id v11 = +[NSXPCConnection currentConnection];
  [(RPConnectionManager *)self setCurrentConnection:v11];

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x2020000000;
  int64_t v19 = 0;
  int64_t v19 = [(RPConnectionManager *)self consumeSandboxExtensionToken:v9];
  if (*(void *)(*(void *)&buf[8] + 24) == -1)
  {
    if (dword_100099BB8 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100052658();
    }
    id v13 = +[NSError _rpUserErrorForCode:-5835 userInfo:0];
    v10[2](v10, v13);
  }
  else
  {
    id v12 = [(RPConnectionManager *)self connectionManagerQueue];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10002B6F4;
    v14[3] = &unk_100085B68;
    v14[4] = self;
    id v15 = v8;
    __int16 v17 = buf;
    id v16 = v10;
    dispatch_sync(v12, v14);
  }
  _Block_object_dispose(buf, 8);
}

- (void)saveVideoToCameraRoll:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RPConnectionManager: saveVideoToCameraRoll", buf, 2u);
  }
  id v8 = +[NSXPCConnection currentConnection];
  [(RPConnectionManager *)self setCurrentConnection:v8];

  id v9 = [(RPConnectionManager *)self connectionManagerQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002BA08;
  block[3] = &unk_100084D88;
  block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_sync(v9, block);
}

- (void)saveClipToCameraRoll:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RPConnectionManager: saveClipToCameraRoll", buf, 2u);
  }
  id v8 = +[NSXPCConnection currentConnection];
  [(RPConnectionManager *)self setCurrentConnection:v8];

  id v9 = [(RPConnectionManager *)self connectionManagerQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002BBB4;
  block[3] = &unk_100084D88;
  block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_sync(v9, block);
}

- (void)saveClipToCameraRoll:(id)a3 extensionToken:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *))a5;
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    *(void *)&uint8_t buf[4] = "-[RPConnectionManager saveClipToCameraRoll:extensionToken:handler:]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 785;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  id v11 = +[NSXPCConnection currentConnection];
  [(RPConnectionManager *)self setCurrentConnection:v11];

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x2020000000;
  int64_t v19 = 0;
  int64_t v19 = [(RPConnectionManager *)self consumeSandboxExtensionToken:v9];
  if (*(void *)(*(void *)&buf[8] + 24) == -1)
  {
    if (dword_100099BB8 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100052758();
    }
    id v13 = +[NSError _rpUserErrorForCode:-5835 userInfo:0];
    v10[2](v10, v13);
  }
  else
  {
    id v12 = [(RPConnectionManager *)self connectionManagerQueue];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10002BEB0;
    v14[3] = &unk_100085B68;
    v14[4] = self;
    id v15 = v8;
    __int16 v17 = buf;
    id v16 = v10;
    dispatch_sync(v12, v14);
  }
  _Block_object_dispose(buf, 8);
}

- (void)reportCameraUsage:(int64_t)a3
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RPConnectionManager: reportCameraUsage", buf, 2u);
  }
  id v5 = +[NSXPCConnection currentConnection];
  [(RPConnectionManager *)self setCurrentConnection:v5];

  id v6 = [(RPConnectionManager *)self connectionManagerQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002C184;
  v7[3] = &unk_100084F08;
  v7[4] = self;
  void v7[5] = a3;
  dispatch_sync(v6, v7);
}

- (int64_t)consumeSandboxExtensionToken:(id)a3
{
  id v3 = [a3 UTF8String];

  return _sandbox_extension_consume(v3);
}

- (BOOL)releaseSandboxExtensionHandle:(int64_t)a3
{
  return sandbox_extension_release() != -1;
}

- (void)consumeSandboxExtension:(id)a3 processNewConnection:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136446466;
    id v11 = "-[RPConnectionManager consumeSandboxExtension:processNewConnection:]";
    __int16 v12 = 1024;
    int v13 = 837;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v10, 0x12u);
  }
  if (!v6)
  {
    if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136446466;
      id v11 = "-[RPConnectionManager consumeSandboxExtension:processNewConnection:]";
      __int16 v12 = 1024;
      int v13 = 839;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Not consuming extension token", (uint8_t *)&v10, 0x12u);
    }
    uint64_t v8 = -1;
    if (!v4) {
      goto LABEL_11;
    }
LABEL_10:
    id v9 = +[NSXPCConnection currentConnection];
    [(RPConnectionManager *)self processNewConnection:v9];

LABEL_11:
    [(RPConnectionManager *)self releaseSandboxExtensionHandle:v8];
    goto LABEL_15;
  }
  int64_t v7 = [(RPConnectionManager *)self consumeSandboxExtensionToken:v6];
  if (v7 != -1)
  {
    uint64_t v8 = v7;
    if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136446466;
      id v11 = "-[RPConnectionManager consumeSandboxExtension:processNewConnection:]";
      __int16 v12 = 1024;
      int v13 = 846;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Did consume extension token", (uint8_t *)&v10, 0x12u);
    }
    if (!v4) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  if (dword_100099BB8 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100052858();
  }
LABEL_15:
}

- (void)setMicrophoneEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    int v10 = "-[RPConnectionManager setMicrophoneEnabled:]";
    __int16 v11 = 1024;
    int v12 = 862;
    __int16 v13 = 1024;
    BOOL v14 = v3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d microphone set:%d ", buf, 0x18u);
  }
  id v5 = +[NSXPCConnection currentConnection];
  [(RPConnectionManager *)self setCurrentConnection:v5];

  id v6 = [(RPConnectionManager *)self connectionManagerQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002C5FC;
  v7[3] = &unk_100085B90;
  v7[4] = self;
  BOOL v8 = v3;
  dispatch_sync(v6, v7);
}

- (void)getSystemBroadcastPickerInfo:(id)a3
{
  id v4 = a3;
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    __int16 v11 = "-[RPConnectionManager getSystemBroadcastPickerInfo:]";
    __int16 v12 = 1024;
    int v13 = 870;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  id v5 = +[NSXPCConnection currentConnection];
  [(RPConnectionManager *)self setCurrentConnection:v5];

  id v6 = [(RPConnectionManager *)self connectionManagerQueue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10002C78C;
  v8[3] = &unk_100084EB8;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_sync(v6, v8);
}

- (void)setBroadcastPickerPreferredExt:(id)a3 showsMicButton:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446978;
    BOOL v14 = "-[RPConnectionManager setBroadcastPickerPreferredExt:showsMicButton:]";
    __int16 v15 = 1024;
    int v16 = 879;
    __int16 v17 = 2112;
    id v18 = v6;
    __int16 v19 = 1024;
    BOOL v20 = v4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d preferred ext:%@  shows mic button:%i", buf, 0x22u);
  }
  id v7 = +[NSXPCConnection currentConnection];
  [(RPConnectionManager *)self setCurrentConnection:v7];

  BOOL v8 = [(RPConnectionManager *)self connectionManagerQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002C9CC;
  block[3] = &unk_100085BB8;
  block[4] = self;
  id v11 = v6;
  BOOL v12 = v4;
  id v9 = v6;
  dispatch_sync(v8, block);
}

- (void)openControlCenterSystemRecordingView
{
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    id v7 = "-[RPConnectionManager openControlCenterSystemRecordingView]";
    __int16 v8 = 1024;
    int v9 = 888;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  BOOL v3 = +[NSXPCConnection currentConnection];
  [(RPConnectionManager *)self setCurrentConnection:v3];

  BOOL v4 = [(RPConnectionManager *)self connectionManagerQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002CBD0;
  block[3] = &unk_100084E28;
  block[4] = self;
  dispatch_sync(v4, block);
}

- (NSXPCConnection)currentConnection
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_currentConnection);

  return (NSXPCConnection *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_currentConnection);
  objc_storeStrong((id *)&self->_recordingManager, 0);

  objc_storeStrong((id *)&self->_publicListener, 0);
}

@end