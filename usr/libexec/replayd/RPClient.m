@interface RPClient
+ (id)controlCenterManagerClient;
- ($115C4C562B26FF47E01F9F4EA65B5887)clientConnectionAuditToken;
- (NSString)clientBundleID;
- (NSString)clientMainBundleID;
- (RPClient)initWithConnection:(id)a3 clientProxy:(id)a4 bundleIdentifier:(id)a5;
- (RPClientProxy)clientProxy;
- (int)clientPID;
- (void)beginPrivacyAccountingIntervalwithSource:(id)a3 withDestination:(id)a4;
- (void)dealloc;
- (void)discardInAppRecordingWithHandler:(id)a3;
- (void)endPrivacyAccountingInterval;
- (void)exportClipToURL:(id)a3 duration:(double)a4 completionHandler:(id)a5;
- (void)handleMemoryWarningForCurrentActiveSession;
- (void)invalidate;
- (void)notifyClientWithOutputURL:(id)a3 error:(id)a4 withHandler:(id)a5;
- (void)pauseCurrentActiveSession;
- (void)pauseInAppBroadcast;
- (void)pauseInAppCapture;
- (void)pauseInAppClip;
- (void)pauseInAppRecording;
- (void)reportCameraUsage:(int64_t)a3;
- (void)resumeCurrentActiveSessionWithContextID:(id)a3 completionHandler:(id)a4;
- (void)resumeInAppBroadcastWithContextID:(id)a3 completionHandler:(id)a4;
- (void)resumeInAppCaptureWithContextID:(id)a3 completionHandler:(id)a4;
- (void)resumeInAppClipWithContextID:(id)a3 completionHandler:(id)a4;
- (void)resumeInAppRecordingWithContextID:(id)a3 completionHandler:(id)a4;
- (void)resumeSystemBroadcastWithCompletionHandler:(id)a3;
- (void)resumeSystemRecordingWithCompletionHandler:(id)a3;
- (void)sessionDidStop;
- (void)setClientBundleID:(id)a3;
- (void)setClientConnectionAuditToken:(id *)a3;
- (void)setClientMainBundleID:(id)a3;
- (void)setClientPID:(int)a3;
- (void)setClientProxy:(id)a3;
- (void)setCurrentActiveSessionMicrophoneEnabled:(BOOL)a3;
- (void)setupInAppBroadcastExtensionBundleID:(id)a3 broadcastConfigurationData:(id)a4 userInfo:(id)a5 handler:(id)a6;
- (void)setupSystemBroadcastWithHostBundleID:(id)a3 broadcastExtensionBundleID:(id)a4 broadcastConfigurationData:(id)a5 userInfo:(id)a6 handler:(id)a7;
- (void)startInAppBroadcastSessionWithContextID:(id)a3 windowSize:(CGSize)a4 microphoneEnabled:(BOOL)a5 cameraEnabled:(BOOL)a6 listenerEndpoint:(id)a7 withHandler:(id)a8;
- (void)startInAppCaptureSessionWithContextID:(id)a3 windowSize:(CGSize)a4 microphoneEnabled:(BOOL)a5 cameraEnabled:(BOOL)a6 withHandler:(id)a7;
- (void)startInAppClipSessionWithContextID:(id)a3 windowSize:(CGSize)a4 microphoneEnabled:(BOOL)a5 cameraEnabled:(BOOL)a6 withHandler:(id)a7;
- (void)startInAppRecordingSessionWithContextID:(id)a3 windowSize:(CGSize)a4 microphoneEnabled:(BOOL)a5 cameraEnabled:(BOOL)a6 withHandler:(id)a7;
- (void)startSystemBroadcastSessionWithContextID:(id)a3 windowSize:(CGSize)a4 microphoneEnabled:(BOOL)a5 cameraEnabled:(BOOL)a6 listenerEndpoint:(id)a7 withHandler:(id)a8;
- (void)startSystemRecordingSessionWithContextID:(id)a3 windowSize:(CGSize)a4 microphoneEnabled:(BOOL)a5 cameraEnabled:(BOOL)a6 withHandler:(id)a7;
- (void)stopCurrentActiveSessionWithHandler:(id)a3;
- (void)stopInAppBroadcastSessionWithHandler:(id)a3;
- (void)stopInAppCaptureSessionWithHandler:(id)a3;
- (void)stopInAppClipSessionWithHandler:(id)a3;
- (void)stopInAppRecordingSessionWithHandler:(id)a3;
- (void)stopSystemBroadcastSessionWithHandler:(id)a3;
- (void)stopSystemRecordingSessionWithHandler:(id)a3;
- (void)stopSystemRecordingSessionWithURLHandler:(id)a3;
- (void)updateBroadcastURL:(id)a3;
- (void)updateProcessIDForAudioCaptureWithPID:(int)a3;
@end

@implementation RPClient

- (RPClient)initWithConnection:(id)a3 clientProxy:(id)a4 bundleIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v25.receiver = self;
  v25.super_class = (Class)RPClient;
  v11 = [(RPClient *)&v25 init];
  if (v11)
  {
    if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446722;
      *(void *)&buf[4] = "-[RPClient initWithConnection:clientProxy:bundleIdentifier:]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 119;
      *(_WORD *)&buf[18] = 2048;
      *(void *)&buf[20] = v11;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p", buf, 0x1Cu);
    }
    [(RPClient *)v11 setClientProxy:v9];
    [(RPClient *)v11 setClientBundleID:v10];
    -[RPClient setClientPID:](v11, "setClientPID:", [v8 processIdentifier]);
    if (v8) {
      [v8 auditToken];
    }
    else {
      memset(v24, 0, sizeof(v24));
    }
    v12 = +[SCProcessUtility hostApplicationWithAuditToken:v24 bundleID:v10];
    [(RPClient *)v11 setClientMainBundleID:v12];

    recordSession = v11->_recordSession;
    v11->_recordSession = 0;

    captureSession = v11->_captureSession;
    v11->_captureSession = 0;

    broadcastSession = v11->_broadcastSession;
    v11->_broadcastSession = 0;

    clipSession = v11->_clipSession;
    v11->_clipSession = 0;

    systemRecordSession = v11->_systemRecordSession;
    v11->_systemRecordSession = 0;

    systemBroadcastSession = v11->_systemBroadcastSession;
    v11->_systemBroadcastSession = 0;

    v11->_currentActiveSession = 0;
    if (v8) {
      [v8 auditToken];
    }
    else {
      memset(buf, 0, 32);
    }
    long long v19 = *(_OWORD *)&buf[16];
    *(_OWORD *)v11->_clientConnectionAuditToken.val = *(_OWORD *)buf;
    *(_OWORD *)&v11->_clientConnectionAuditToken.val[4] = v19;
    accessInterval = v11->_accessInterval;
    v11->_accessInterval = 0;

    dispatch_queue_t v21 = dispatch_queue_create("com.apple.replaykit.AlertDispatchQueue", 0);
    alertQueue = v11->_alertQueue;
    v11->_alertQueue = (OS_dispatch_queue *)v21;
  }
  return v11;
}

- (void)invalidate
{
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136446722;
    v4 = "-[RPClient invalidate]";
    __int16 v5 = 1024;
    int v6 = 158;
    __int16 v7 = 2048;
    id v8 = self;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p", (uint8_t *)&v3, 0x1Cu);
  }
  [(RPSession *)self->_recordSession invalidate];
  [(RPSession *)self->_captureSession invalidate];
  [(RPSession *)self->_broadcastSession invalidate];
  [(RPSession *)self->_clipSession invalidate];
  [(RPSession *)self->_systemRecordSession invalidate];
  [(RPSession *)self->_systemBroadcastSession invalidate];
}

- (void)dealloc
{
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    __int16 v5 = "-[RPClient dealloc]";
    __int16 v6 = 1024;
    int v7 = 178;
    __int16 v8 = 2048;
    id v9 = self;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p", buf, 0x1Cu);
  }
  v3.receiver = self;
  v3.super_class = (Class)RPClient;
  [(RPClient *)&v3 dealloc];
}

- (void)setClientPID:(int)a3
{
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136446466;
    __int16 v6 = "-[RPClient setClientPID:]";
    __int16 v7 = 1024;
    int v8 = 182;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v5, 0x12u);
  }
  self->_clientPID = a3;
}

- (void)pauseCurrentActiveSession
{
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int currentActiveSession = self->_currentActiveSession;
    int v6 = 136446722;
    __int16 v7 = "-[RPClient pauseCurrentActiveSession]";
    __int16 v8 = 1024;
    int v9 = 206;
    __int16 v10 = 1024;
    int v11 = currentActiveSession;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d pausing session type %d", (uint8_t *)&v6, 0x18u);
  }
  uint64_t v4 = 8;
  switch(self->_currentActiveSession)
  {
    case 0:
      if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        int v6 = 136446466;
        __int16 v7 = "-[RPClient pauseCurrentActiveSession]";
        __int16 v8 = 1024;
        int v9 = 237;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d We don't have a current active session to pause, returning", (uint8_t *)&v6, 0x12u);
      }
      return;
    case 1:
      uint64_t v4 = 16;
      goto LABEL_15;
    case 2:
      goto LABEL_15;
    case 3:
      uint64_t v4 = 24;
      goto LABEL_15;
    case 4:
      uint64_t v4 = 32;
      goto LABEL_15;
    case 5:
      uint64_t v4 = 40;
LABEL_15:
      [*(id *)((char *)&self->super.isa + v4) pauseSession];
      int v5 = [(RPClient *)self clientProxy];
      [v5 recordingDidPause];

      break;
    default:
      if (dword_100099BB8 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_100053050(&self->_currentActiveSession);
      }
      break;
  }
}

- (void)reportCameraUsage:(int64_t)a3
{
  switch(self->_currentActiveSession)
  {
    case 0:
      if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        int v4 = 136446466;
        int v5 = "-[RPClient reportCameraUsage:]";
        __int16 v6 = 1024;
        int v7 = 268;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d We don't have a current active session to report camera usage, returning", (uint8_t *)&v4, 0x12u);
      }
      return;
    case 1:
      captureSession = self->_captureSession;
      goto LABEL_12;
    case 2:
      captureSession = self->_recordSession;
      goto LABEL_12;
    case 3:
      captureSession = self->_broadcastSession;
      goto LABEL_12;
    case 4:
      captureSession = self->_clipSession;
      goto LABEL_12;
    case 5:
      captureSession = self->_systemRecordSession;
      goto LABEL_12;
    case 6:
      captureSession = self->_systemBroadcastSession;
LABEL_12:
      [captureSession sessionReportCameraUsage:a3];
      break;
    default:
      return;
  }
}

- (void)resumeCurrentActiveSessionWithContextID:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int currentActiveSession = self->_currentActiveSession;
    int v10 = 136446722;
    int v11 = "-[RPClient resumeCurrentActiveSessionWithContextID:completionHandler:]";
    __int16 v12 = 1024;
    int v13 = 306;
    __int16 v14 = 1024;
    int v15 = currentActiveSession;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d resuming session type %d", (uint8_t *)&v10, 0x18u);
  }
  switch(self->_currentActiveSession)
  {
    case 0:
      if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 136446466;
        int v11 = "-[RPClient resumeCurrentActiveSessionWithContextID:completionHandler:]";
        __int16 v12 = 1024;
        int v13 = 326;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d We don't have a current active session to resume, returning", (uint8_t *)&v10, 0x12u);
      }
      if (v7)
      {
        int v9 = +[NSError _rpUserErrorForCode:-5832 userInfo:0];
        (*((void (**)(id, void *, void, void))v7 + 2))(v7, v9, 0, 0);
      }
      break;
    case 1:
      [(RPClient *)self resumeInAppCaptureWithContextID:v6 completionHandler:v7];
      break;
    case 2:
      [(RPClient *)self resumeInAppRecordingWithContextID:v6 completionHandler:v7];
      break;
    case 3:
      [(RPClient *)self resumeInAppBroadcastWithContextID:v6 completionHandler:v7];
      break;
    case 4:
      [(RPClient *)self resumeInAppClipWithContextID:v6 completionHandler:v7];
      break;
    default:
      break;
  }
}

- (void)notifyClientWithOutputURL:(id)a3 error:(id)a4 withHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  int v10 = (void (**)(id, BOOL))a5;
  if (v9)
  {
    if (dword_100099BB8 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000530F4();
    }
  }
  else
  {
    if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 136446466;
      __int16 v14 = "-[RPClient notifyClientWithOutputURL:error:withHandler:]";
      __int16 v15 = 1024;
      int v16 = 343;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d stop session success, notifying client of session stoppped", (uint8_t *)&v13, 0x12u);
    }
    int v11 = [(RPClient *)self clientProxy];
    __int16 v12 = +[NSError _rpUserErrorForCode:-5806 userInfo:0];
    [v11 recordingDidStopWithError:v12 movieURL:v8];

    self->_int currentActiveSession = 0;
  }
  if (v10) {
    v10[2](v10, v9 == 0);
  }
}

- (void)stopCurrentActiveSessionWithHandler:(id)a3
{
  int v4 = (void (**)(id, uint64_t))a3;
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    long long v19 = "-[RPClient stopCurrentActiveSessionWithHandler:]";
    __int16 v20 = 1024;
    int v21 = 357;
    __int16 v22 = 2048;
    v23 = self;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p", buf, 0x1Cu);
  }
  switch(self->_currentActiveSession)
  {
    case 0:
      if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        long long v19 = "-[RPClient stopCurrentActiveSessionWithHandler:]";
        __int16 v20 = 1024;
        int v21 = 410;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d We don't have a current active session to stop", buf, 0x12u);
      }
      if (v4) {
        v4[2](v4, 1);
      }
      break;
    case 1:
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_100032B30;
      v14[3] = &unk_1000853B8;
      v14[4] = self;
      __int16 v15 = v4;
      [(RPClient *)self stopInAppCaptureSessionWithHandler:v14];
      int v5 = v15;
      goto LABEL_19;
    case 2:
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_100032B1C;
      v16[3] = &unk_1000853E0;
      v16[4] = self;
      v17 = v4;
      [(RPClient *)self stopInAppRecordingSessionWithHandler:v16];
      int v5 = v17;
      goto LABEL_19;
    case 3:
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_100032B44;
      v12[3] = &unk_1000853B8;
      v12[4] = self;
      int v13 = v4;
      [(RPClient *)self stopInAppBroadcastSessionWithHandler:v12];
      int v5 = v13;
      goto LABEL_19;
    case 4:
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_100032B58;
      v10[3] = &unk_1000853B8;
      v10[4] = self;
      int v11 = v4;
      [(RPClient *)self stopInAppClipSessionWithHandler:v10];
      int v5 = v11;
      goto LABEL_19;
    case 5:
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_100032B6C;
      v8[3] = &unk_1000853B8;
      v8[4] = self;
      id v9 = v4;
      [(RPClient *)self stopSystemRecordingSessionWithHandler:v8];
      int v5 = v9;
      goto LABEL_19;
    case 6:
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_100032B80;
      v6[3] = &unk_1000853B8;
      v6[4] = self;
      id v7 = v4;
      [(RPClient *)self stopSystemBroadcastSessionWithHandler:v6];
      int v5 = v7;
LABEL_19:

      break;
    default:
      if (dword_100099BB8 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_100053178();
      }
      break;
  }
}

- (void)setCurrentActiveSessionMicrophoneEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136446466;
    id v8 = "-[RPClient setCurrentActiveSessionMicrophoneEnabled:]";
    __int16 v9 = 1024;
    int v10 = 420;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v7, 0x12u);
  }
  int currentActiveSession = self->_currentActiveSession;
  if (currentActiveSession == 5)
  {
    uint64_t v6 = 40;
  }
  else
  {
    if (currentActiveSession != 6) {
      return;
    }
    uint64_t v6 = 48;
  }
  [*(id *)((char *)&self->super.isa + v6) setCaptureMicrophoneEnabled:v3];
}

- (void)startInAppRecordingSessionWithContextID:(id)a3 windowSize:(CGSize)a4 microphoneEnabled:(BOOL)a5 cameraEnabled:(BOOL)a6 withHandler:(id)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  double height = a4.height;
  double width = a4.width;
  id v13 = a3;
  id v14 = a7;
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v28 = "-[RPClient startInAppRecordingSessionWithContextID:windowSize:microphoneEnabled:cameraEnabled:withHandler:]";
    __int16 v29 = 1024;
    int v30 = 442;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Starting in-app recording", buf, 0x12u);
  }
  recordSession = self->_recordSession;
  if (recordSession)
  {
    int v16 = [(RPClient *)self clientProxy];
    uint64_t clientPID = self->_clientPID;
    v18 = [(RPClient *)self clientBundleID];
    [(RPSession *)recordSession updateClientProxy:v16 callingPID:clientPID bundleID:v18];
  }
  else
  {
    if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v28 = "-[RPClient startInAppRecordingSessionWithContextID:windowSize:microphoneEnabled:cameraEnabled:withHandler:]";
      __int16 v29 = 1024;
      int v30 = 445;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d we dont have a record session, creating a new one", buf, 0x12u);
    }
    long long v19 = [RPRecordSession alloc];
    int v16 = [(RPClient *)self clientProxy];
    uint64_t v20 = self->_clientPID;
    v18 = [(RPClient *)self clientBundleID];
    int v21 = [(RPSession *)v19 initWithClientProxy:v16 sessionType:2 callingPID:v20 bundleID:v18 delegate:self];
    __int16 v22 = self->_recordSession;
    self->_recordSession = v21;
  }
  v23 = self->_recordSession;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_100032F44;
  v25[3] = &unk_1000853B8;
  v25[4] = self;
  id v26 = v14;
  id v24 = v14;
  -[RPRecordSession startRecordingWithMicrophoneEnabled:cameraEnabled:contextID:windowSize:handler:](v23, "startRecordingWithMicrophoneEnabled:cameraEnabled:contextID:windowSize:handler:", v9, v8, v13, v25, width, height);
}

- (void)stopInAppRecordingSessionWithHandler:(id)a3
{
  id v4 = a3;
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    int v10 = "-[RPClient stopInAppRecordingSessionWithHandler:]";
    __int16 v11 = 1024;
    int v12 = 473;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Stopping in-app recording", buf, 0x12u);
  }
  recordSession = self->_recordSession;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100033188;
  v7[3] = &unk_1000853E0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(RPRecordSession *)recordSession stopRecordingWithHandler:v7];
}

- (void)pauseInAppRecording
{
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136446466;
    id v4 = "-[RPClient pauseInAppRecording]";
    __int16 v5 = 1024;
    int v6 = 489;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Pausing in-app recording", (uint8_t *)&v3, 0x12u);
  }
  [(RPRecordSession *)self->_recordSession pauseSession];
}

- (void)resumeInAppRecordingWithContextID:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    id v13 = "-[RPClient resumeInAppRecordingWithContextID:completionHandler:]";
    __int16 v14 = 1024;
    int v15 = 494;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Resuming in-app recording", buf, 0x12u);
  }
  recordSession = self->_recordSession;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100033460;
  v10[3] = &unk_1000853B8;
  v10[4] = self;
  id v11 = v7;
  id v9 = v7;
  [(RPSession *)recordSession resumeSessionWithWindowLayerContextID:v6 completionHandler:v10];
}

- (void)discardInAppRecordingWithHandler:(id)a3
{
  id v4 = a3;
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    int v10 = "-[RPClient discardInAppRecordingWithHandler:]";
    __int16 v11 = 1024;
    int v12 = 512;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Disarding in-app recording", buf, 0x12u);
  }
  recordSession = self->_recordSession;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100033760;
  v7[3] = &unk_100085A28;
  id v8 = v4;
  id v6 = v4;
  [(RPRecordSession *)recordSession discardInAppRecordingWithHandler:v7];
}

- (void)startInAppCaptureSessionWithContextID:(id)a3 windowSize:(CGSize)a4 microphoneEnabled:(BOOL)a5 cameraEnabled:(BOOL)a6 withHandler:(id)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  double height = a4.height;
  double width = a4.width;
  id v13 = a3;
  id v14 = a7;
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v28 = "-[RPClient startInAppCaptureSessionWithContextID:windowSize:microphoneEnabled:cameraEnabled:withHandler:]";
    __int16 v29 = 1024;
    int v30 = 523;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Starting in-app capture", buf, 0x12u);
  }
  captureSession = self->_captureSession;
  if (captureSession)
  {
    int v16 = [(RPClient *)self clientProxy];
    uint64_t clientPID = self->_clientPID;
    v18 = [(RPClient *)self clientBundleID];
    [(RPSession *)captureSession updateClientProxy:v16 callingPID:clientPID bundleID:v18];
  }
  else
  {
    if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v28 = "-[RPClient startInAppCaptureSessionWithContextID:windowSize:microphoneEnabled:cameraEnabled:withHandler:]";
      __int16 v29 = 1024;
      int v30 = 526;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d we dont have a capture session, creating a new one", buf, 0x12u);
    }
    long long v19 = [RPCaptureSession alloc];
    int v16 = [(RPClient *)self clientProxy];
    uint64_t v20 = self->_clientPID;
    v18 = [(RPClient *)self clientBundleID];
    int v21 = [(RPSession *)v19 initWithClientProxy:v16 sessionType:1 callingPID:v20 bundleID:v18 delegate:self];
    __int16 v22 = self->_captureSession;
    self->_captureSession = v21;
  }
  v23 = self->_captureSession;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_100033AF4;
  v25[3] = &unk_1000853B8;
  v25[4] = self;
  id v26 = v14;
  id v24 = v14;
  -[RPCaptureSession startCaptureWithMicrophoneEnabled:cameraEnabled:contextID:windowSize:handler:](v23, "startCaptureWithMicrophoneEnabled:cameraEnabled:contextID:windowSize:handler:", v9, v8, v13, v25, width, height);
}

- (void)stopInAppCaptureSessionWithHandler:(id)a3
{
  id v4 = a3;
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    int v10 = "-[RPClient stopInAppCaptureSessionWithHandler:]";
    __int16 v11 = 1024;
    int v12 = 555;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Stopping in-app capture", buf, 0x12u);
  }
  captureSession = self->_captureSession;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100033D38;
  v7[3] = &unk_1000853B8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(RPCaptureSession *)captureSession stopCaptureWithHandler:v7];
}

- (void)pauseInAppCapture
{
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136446466;
    id v4 = "-[RPClient pauseInAppCapture]";
    __int16 v5 = 1024;
    int v6 = 571;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Pausing in-app capture", (uint8_t *)&v3, 0x12u);
  }
  [(RPCaptureSession *)self->_captureSession pauseSession];
}

- (void)resumeInAppCaptureWithContextID:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    id v13 = "-[RPClient resumeInAppCaptureWithContextID:completionHandler:]";
    __int16 v14 = 1024;
    int v15 = 576;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Resuming in-app capture", buf, 0x12u);
  }
  captureSession = self->_captureSession;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100033FF4;
  v10[3] = &unk_1000853B8;
  v10[4] = self;
  id v11 = v7;
  id v9 = v7;
  [(RPSession *)captureSession resumeSessionWithWindowLayerContextID:v6 completionHandler:v10];
}

- (void)setupInAppBroadcastExtensionBundleID:(id)a3 broadcastConfigurationData:(id)a4 userInfo:(id)a5 handler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v24 = 136446466;
    objc_super v25 = "-[RPClient setupInAppBroadcastExtensionBundleID:broadcastConfigurationData:userInfo:handler:]";
    __int16 v26 = 1024;
    int v27 = 595;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v24, 0x12u);
  }
  broadcastSession = self->_broadcastSession;
  if (broadcastSession)
  {
    int v15 = [(RPClient *)self clientProxy];
    uint64_t clientPID = self->_clientPID;
    v17 = [(RPClient *)self clientBundleID];
    [(RPSession *)broadcastSession updateClientProxy:v15 callingPID:clientPID bundleID:v17];
  }
  else
  {
    if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v24 = 136446466;
      objc_super v25 = "-[RPClient setupInAppBroadcastExtensionBundleID:broadcastConfigurationData:userInfo:handler:]";
      __int16 v26 = 1024;
      int v27 = 598;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d we dont have a broadcast session, creating a new one", (uint8_t *)&v24, 0x12u);
    }
    v18 = [RPBroadcastSession alloc];
    int v15 = [(RPClient *)self clientProxy];
    uint64_t v19 = self->_clientPID;
    v17 = [(RPClient *)self clientBundleID];
    uint64_t v20 = [(RPBroadcastSession *)v18 initWithClientProxy:v15 callingPID:v19 bundleID:v17 delegate:self];
    int v21 = self->_broadcastSession;
    self->_broadcastSession = v20;
  }
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v24 = 136446466;
    objc_super v25 = "-[RPClient setupInAppBroadcastExtensionBundleID:broadcastConfigurationData:userInfo:handler:]";
    __int16 v26 = 1024;
    int v27 = 605;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d setting up broadcast session", (uint8_t *)&v24, 0x12u);
  }
  __int16 v22 = self->_broadcastSession;
  v23 = [(RPClient *)self clientBundleID];
  [(RPBroadcastSession *)v22 setupBroadcastWithHostBundleID:v23 broadcastExtensionBundleID:v10 broadcastConfigurationData:v11 userInfo:v12 handler:v13];
}

- (void)startInAppBroadcastSessionWithContextID:(id)a3 windowSize:(CGSize)a4 microphoneEnabled:(BOOL)a5 cameraEnabled:(BOOL)a6 listenerEndpoint:(id)a7 withHandler:(id)a8
{
  BOOL v10 = a6;
  BOOL v11 = a5;
  double height = a4.height;
  double width = a4.width;
  id v15 = a3;
  id v16 = a7;
  id v17 = a8;
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    __int16 v26 = "-[RPClient startInAppBroadcastSessionWithContextID:windowSize:microphoneEnabled:cameraEnabled:listenerEndpoint:withHandler:]";
    __int16 v27 = 1024;
    int v28 = 610;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Starting in-app broadcast", buf, 0x12u);
  }
  broadcastSession = self->_broadcastSession;
  if (broadcastSession)
  {
    uint64_t v19 = [(RPClient *)self clientProxy];
    uint64_t clientPID = self->_clientPID;
    int v21 = [(RPClient *)self clientBundleID];
    [(RPSession *)broadcastSession updateClientProxy:v19 callingPID:clientPID bundleID:v21];

    __int16 v22 = self->_broadcastSession;
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_1000346B8;
    v23[3] = &unk_1000853B8;
    v23[4] = self;
    id v24 = v17;
    -[RPBroadcastSession startBroadcastWithMicrophoneEnabled:cameraEnabled:contextID:windowSize:listenerEndpoint:handler:](v22, "startBroadcastWithMicrophoneEnabled:cameraEnabled:contextID:windowSize:listenerEndpoint:handler:", v11, v10, v15, v16, v23, width, height);
  }
  else if (dword_100099BB8 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10005340C();
  }
}

- (void)stopInAppBroadcastSessionWithHandler:(id)a3
{
  id v4 = a3;
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    BOOL v10 = "-[RPClient stopInAppBroadcastSessionWithHandler:]";
    __int16 v11 = 1024;
    int v12 = 638;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Stopping in-app broadcast", buf, 0x12u);
  }
  broadcastSession = self->_broadcastSession;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000348FC;
  v7[3] = &unk_1000853B8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(RPBroadcastSession *)broadcastSession stopBroadcastWithHandler:v7];
}

- (void)pauseInAppBroadcast
{
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136446466;
    id v4 = "-[RPClient pauseInAppBroadcast]";
    __int16 v5 = 1024;
    int v6 = 654;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Pausing in-app broadcast", (uint8_t *)&v3, 0x12u);
  }
  [(RPBroadcastSession *)self->_broadcastSession pauseSession];
}

- (void)updateBroadcastURL:(id)a3
{
  id v4 = a3;
  broadcastSession = self->_broadcastSession;
  if (broadcastSession || (broadcastSession = self->_systemBroadcastSession) != 0) {
    [broadcastSession updateBroadcastURL:v4];
  }

  _objc_release_x1();
}

- (void)resumeInAppBroadcastWithContextID:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    id v13 = "-[RPClient resumeInAppBroadcastWithContextID:completionHandler:]";
    __int16 v14 = 1024;
    int v15 = 669;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Resuming in-app broadcast", buf, 0x12u);
  }
  broadcastSession = self->_broadcastSession;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100034C18;
  v10[3] = &unk_1000853B8;
  v10[4] = self;
  id v11 = v7;
  id v9 = v7;
  [(RPBroadcastSession *)broadcastSession resumeSessionWithWindowLayerContextID:v6 completionHandler:v10];
}

- (void)startInAppClipSessionWithContextID:(id)a3 windowSize:(CGSize)a4 microphoneEnabled:(BOOL)a5 cameraEnabled:(BOOL)a6 withHandler:(id)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  double height = a4.height;
  double width = a4.width;
  id v13 = a3;
  id v14 = a7;
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    int v28 = "-[RPClient startInAppClipSessionWithContextID:windowSize:microphoneEnabled:cameraEnabled:withHandler:]";
    __int16 v29 = 1024;
    int v30 = 688;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Starting in-app clip buffering", buf, 0x12u);
  }
  clipSession = self->_clipSession;
  if (clipSession)
  {
    id v16 = [(RPClient *)self clientProxy];
    uint64_t clientPID = self->_clientPID;
    v18 = [(RPClient *)self clientBundleID];
    [(RPSession *)clipSession updateClientProxy:v16 callingPID:clientPID bundleID:v18];
  }
  else
  {
    if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      int v28 = "-[RPClient startInAppClipSessionWithContextID:windowSize:microphoneEnabled:cameraEnabled:withHandler:]";
      __int16 v29 = 1024;
      int v30 = 691;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d we dont have a clip session, creating a new one", buf, 0x12u);
    }
    uint64_t v19 = [RPClipSession alloc];
    id v16 = [(RPClient *)self clientProxy];
    uint64_t v20 = self->_clientPID;
    v18 = [(RPClient *)self clientBundleID];
    int v21 = [(RPSession *)v19 initWithClientProxy:v16 sessionType:4 callingPID:v20 bundleID:v18 delegate:self];
    __int16 v22 = self->_clipSession;
    self->_clipSession = v21;
  }
  v23 = self->_clipSession;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_10003508C;
  v25[3] = &unk_1000853B8;
  v25[4] = self;
  id v26 = v14;
  id v24 = v14;
  -[RPClipSession startClipWithMicrophoneEnabled:cameraEnabled:contextID:windowSize:handler:](v23, "startClipWithMicrophoneEnabled:cameraEnabled:contextID:windowSize:handler:", v9, v8, v13, v25, width, height);
}

- (void)stopInAppClipSessionWithHandler:(id)a3
{
  id v4 = a3;
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    BOOL v10 = "-[RPClient stopInAppClipSessionWithHandler:]";
    __int16 v11 = 1024;
    int v12 = 719;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Stopping in-app clip buffering", buf, 0x12u);
  }
  clipSession = self->_clipSession;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000352D0;
  v7[3] = &unk_1000853B8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(RPClipSession *)clipSession stopClipWithHandler:v7];
}

- (void)pauseInAppClip
{
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136446466;
    id v4 = "-[RPClient pauseInAppClip]";
    __int16 v5 = 1024;
    int v6 = 735;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Pausing in-app clip buffering", (uint8_t *)&v3, 0x12u);
  }
  [(RPClipSession *)self->_clipSession pauseSession];
}

- (void)resumeInAppClipWithContextID:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    id v13 = "-[RPClient resumeInAppClipWithContextID:completionHandler:]";
    __int16 v14 = 1024;
    int v15 = 740;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Resuming in-app clip buffering", buf, 0x12u);
  }
  clipSession = self->_clipSession;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10003558C;
  v10[3] = &unk_1000853B8;
  v10[4] = self;
  id v11 = v7;
  id v9 = v7;
  [(RPSession *)clipSession resumeSessionWithWindowLayerContextID:v6 completionHandler:v10];
}

- (void)exportClipToURL:(id)a3 duration:(double)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    int v15 = "-[RPClient exportClipToURL:duration:completionHandler:]";
    __int16 v16 = 1024;
    int v17 = 758;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  clipSession = self->_clipSession;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000358B8;
  v12[3] = &unk_100084E90;
  id v13 = v9;
  id v11 = v9;
  [(RPClipSession *)clipSession exportClipToURL:v8 duration:v12 completionHandler:a4];
}

- (void)sessionDidStop
{
  self->_int currentActiveSession = 0;
}

- (void)startSystemRecordingSessionWithContextID:(id)a3 windowSize:(CGSize)a4 microphoneEnabled:(BOOL)a5 cameraEnabled:(BOOL)a6 withHandler:(id)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  double height = a4.height;
  double width = a4.width;
  id v13 = a3;
  id v14 = a7;
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    int v28 = "-[RPClient startSystemRecordingSessionWithContextID:windowSize:microphoneEnabled:cameraEnabled:withHandler:]";
    __int16 v29 = 1024;
    int v30 = 783;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Starting system recording", buf, 0x12u);
  }
  systemRecordSession = self->_systemRecordSession;
  if (systemRecordSession)
  {
    __int16 v16 = [(RPClient *)self clientProxy];
    uint64_t clientPID = self->_clientPID;
    v18 = [(RPClient *)self clientBundleID];
    [(RPSession *)systemRecordSession updateClientProxy:v16 callingPID:clientPID bundleID:v18];
  }
  else
  {
    if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      int v28 = "-[RPClient startSystemRecordingSessionWithContextID:windowSize:microphoneEnabled:cameraEnabled:withHandler:]";
      __int16 v29 = 1024;
      int v30 = 786;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d we dont have a system record session, creating a new one", buf, 0x12u);
    }
    uint64_t v19 = [RPSystemRecordSession alloc];
    __int16 v16 = [(RPClient *)self clientProxy];
    uint64_t v20 = self->_clientPID;
    v18 = [(RPClient *)self clientBundleID];
    int v21 = [(RPSession *)v19 initWithClientProxy:v16 sessionType:5 callingPID:v20 bundleID:v18 delegate:self];
    __int16 v22 = self->_systemRecordSession;
    self->_systemRecordSession = v21;
  }
  v23 = self->_systemRecordSession;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_100035CF4;
  v25[3] = &unk_1000853B8;
  v25[4] = self;
  id v26 = v14;
  id v24 = v14;
  -[RPSystemRecordSession startSystemRecordingWithMicrophoneEnabled:cameraEnabled:contextID:windowSize:handler:](v23, "startSystemRecordingWithMicrophoneEnabled:cameraEnabled:contextID:windowSize:handler:", v9, v8, v13, v25, width, height);
}

- (void)stopSystemRecordingSessionWithHandler:(id)a3
{
  id v4 = a3;
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    BOOL v10 = "-[RPClient stopSystemRecordingSessionWithHandler:]";
    __int16 v11 = 1024;
    int v12 = 815;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Stopping System Recording", buf, 0x12u);
  }
  systemRecordSession = self->_systemRecordSession;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100035F10;
  v7[3] = &unk_1000853B8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(RPSystemRecordSession *)systemRecordSession stopSystemRecordingWithHandler:v7];
}

- (void)stopSystemRecordingSessionWithURLHandler:(id)a3
{
  id v4 = a3;
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    BOOL v10 = "-[RPClient stopSystemRecordingSessionWithURLHandler:]";
    __int16 v11 = 1024;
    int v12 = 831;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Stopping System Recording with URL handler", buf, 0x12u);
  }
  systemRecordSession = self->_systemRecordSession;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000360E4;
  v7[3] = &unk_1000853E0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(RPSystemRecordSession *)systemRecordSession stopSystemRecordingWithURLHandler:v7];
}

- (void)resumeSystemRecordingWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    BOOL v10 = "-[RPClient resumeSystemRecordingWithCompletionHandler:]";
    __int16 v11 = 1024;
    int v12 = 849;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  systemRecordSession = self->_systemRecordSession;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000362DC;
  v7[3] = &unk_1000853B8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(RPSession *)systemRecordSession resumeSessionWithWindowLayerContextID:@"-1" completionHandler:v7];
}

- (void)setupSystemBroadcastWithHostBundleID:(id)a3 broadcastExtensionBundleID:(id)a4 broadcastConfigurationData:(id)a5 userInfo:(id)a6 handler:(id)a7
{
  id v26 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    int v28 = "-[RPClient setupSystemBroadcastWithHostBundleID:broadcastExtensionBundleID:broadcastConfigurationData:userInfo:handler:]";
    __int16 v29 = 1024;
    int v30 = 866;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  systemBroadcastSession = self->_systemBroadcastSession;
  if (systemBroadcastSession)
  {
    int v17 = [(RPClient *)self clientProxy];
    uint64_t clientPID = self->_clientPID;
    uint64_t v19 = [(RPClient *)self clientBundleID];
    [(RPSession *)systemBroadcastSession updateClientProxy:v17 callingPID:clientPID bundleID:v19];
  }
  else
  {
    if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      int v28 = "-[RPClient setupSystemBroadcastWithHostBundleID:broadcastExtensionBundleID:broadcastConfigurationData:userInfo:handler:]";
      __int16 v29 = 1024;
      int v30 = 869;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d we dont have a system broadcast session, creating a new one", buf, 0x12u);
    }
    uint64_t v20 = [RPSystemBroadcastSession alloc];
    int v17 = [(RPClient *)self clientProxy];
    uint64_t v21 = self->_clientPID;
    uint64_t v19 = [(RPClient *)self clientBundleID];
    __int16 v22 = [(RPSystemBroadcastSession *)v20 initWithClientProxy:v17 callingPID:v21 bundleID:v19 delegate:self];
    v23 = self->_systemBroadcastSession;
    self->_systemBroadcastSession = v22;
  }
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    int v28 = "-[RPClient setupSystemBroadcastWithHostBundleID:broadcastExtensionBundleID:broadcastConfigurationData:userInfo:handler:]";
    __int16 v29 = 1024;
    int v30 = 876;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d setting up system broadcast session", buf, 0x12u);
  }
  id v24 = self->_systemBroadcastSession;
  objc_super v25 = [(RPClient *)self clientBundleID];
  [(RPSystemBroadcastSession *)v24 setupSystemBroadcastWithHostBundleID:v25 broadcastExtensionBundleID:v12 broadcastConfigurationData:v13 userInfo:v14 handler:v15];
}

- (void)startSystemBroadcastSessionWithContextID:(id)a3 windowSize:(CGSize)a4 microphoneEnabled:(BOOL)a5 cameraEnabled:(BOOL)a6 listenerEndpoint:(id)a7 withHandler:(id)a8
{
  BOOL v10 = a6;
  BOOL v11 = a5;
  double height = a4.height;
  double width = a4.width;
  id v15 = a3;
  id v16 = a7;
  id v17 = a8;
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    id v26 = "-[RPClient startSystemBroadcastSessionWithContextID:windowSize:microphoneEnabled:cameraEnabled:listenerEndpoint:withHandler:]";
    __int16 v27 = 1024;
    int v28 = 881;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Starting system broadcast", buf, 0x12u);
  }
  systemBroadcastSession = self->_systemBroadcastSession;
  if (systemBroadcastSession)
  {
    uint64_t v19 = [(RPClient *)self clientProxy];
    uint64_t clientPID = self->_clientPID;
    uint64_t v21 = [(RPClient *)self clientBundleID];
    [(RPSession *)systemBroadcastSession updateClientProxy:v19 callingPID:clientPID bundleID:v21];

    __int16 v22 = self->_systemBroadcastSession;
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_1000368F4;
    v23[3] = &unk_1000853B8;
    v23[4] = self;
    id v24 = v17;
    -[RPSystemBroadcastSession startSystemBroadcastWithMicrophoneEnabled:cameraEnabled:contextID:windowSize:listenerEndpoint:withHandler:](v22, "startSystemBroadcastWithMicrophoneEnabled:cameraEnabled:contextID:windowSize:listenerEndpoint:withHandler:", v11, v10, v15, v16, v23, width, height);
  }
}

- (void)stopSystemBroadcastSessionWithHandler:(id)a3
{
  id v4 = a3;
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    BOOL v10 = "-[RPClient stopSystemBroadcastSessionWithHandler:]";
    __int16 v11 = 1024;
    int v12 = 909;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Stopping system broadcast", buf, 0x12u);
  }
  systemBroadcastSession = self->_systemBroadcastSession;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100036B2C;
  v7[3] = &unk_1000853B8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(RPSystemBroadcastSession *)systemBroadcastSession stopSystemBroadcastWithHandler:v7];
}

- (void)resumeSystemBroadcastWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    BOOL v10 = "-[RPClient resumeSystemBroadcastWithCompletionHandler:]";
    __int16 v11 = 1024;
    int v12 = 925;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  systemBroadcastSession = self->_systemBroadcastSession;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100036D08;
  v7[3] = &unk_1000853B8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(RPSystemBroadcastSession *)systemBroadcastSession resumeSessionWithWindowLayerContextID:@"-1" completionHandler:v7];
}

- (void)handleMemoryWarningForCurrentActiveSession
{
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136446466;
    __int16 v5 = "-[RPClient handleMemoryWarningForCurrentActiveSession]";
    __int16 v6 = 1024;
    int v7 = 943;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v4, 0x12u);
  }
  switch(self->_currentActiveSession)
  {
    case 0:
      if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        int v4 = 136446466;
        __int16 v5 = "-[RPClient handleMemoryWarningForCurrentActiveSession]";
        __int16 v6 = 1024;
        int v7 = 968;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d We don't have a current active session.", (uint8_t *)&v4, 0x12u);
      }
      return;
    case 1:
      captureSession = self->_captureSession;
      goto LABEL_13;
    case 2:
      captureSession = self->_recordSession;
      goto LABEL_13;
    case 3:
      captureSession = self->_broadcastSession;
      goto LABEL_13;
    case 5:
      captureSession = self->_systemRecordSession;
      goto LABEL_13;
    case 6:
      captureSession = self->_systemBroadcastSession;
LABEL_13:
      [captureSession handleMemoryWarning];
      break;
    default:
      return;
  }
}

- (void)updateProcessIDForAudioCaptureWithPID:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136446722;
    int v7 = "-[RPClient updateProcessIDForAudioCaptureWithPID:]";
    __int16 v8 = 1024;
    int v9 = 973;
    __int16 v10 = 1024;
    int v11 = v3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d pid: %d", (uint8_t *)&v6, 0x18u);
  }
  switch(self->_currentActiveSession)
  {
    case 0:
      return;
    case 1:
      captureSession = self->_captureSession;
      goto LABEL_11;
    case 2:
      captureSession = self->_recordSession;
      goto LABEL_11;
    case 3:
      captureSession = self->_broadcastSession;
LABEL_11:
      [captureSession updateProcessIDForAudioCaptureWithPID:v3];
      break;
    default:
      if (dword_100099BB8 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_100053A3C();
      }
      break;
  }
}

- (void)beginPrivacyAccountingIntervalwithSource:(id)a3 withDestination:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    __int16 v8 = +[PAApplication applicationWithType:0 identifier:v7];
    if (v6)
    {
LABEL_3:
      int v9 = +[PAApplication applicationWithType:0 identifier:v6];
      __int16 v10 = +[PAAccessLogger sharedInstance];
      int v11 = +[PAReplayKitAccess accessWithAccessor:v9 fromBroadcaster:v8];
      int v12 = [v10 beginIntervalForAccess:v11];
      accessInterval = self->_accessInterval;
      self->_accessInterval = v12;

      goto LABEL_8;
    }
  }
  else
  {
    __int16 v8 = 0;
    if (v6) {
      goto LABEL_3;
    }
  }
  if (dword_100099BB8 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100053AC0();
  }
LABEL_8:
}

- (void)endPrivacyAccountingInterval
{
  accessInterval = self->_accessInterval;
  if (accessInterval)
  {
    [(PAAccessInterval *)accessInterval end];
    int v4 = self->_accessInterval;
    self->_accessInterval = 0;
  }
}

+ (id)controlCenterManagerClient
{
  return 0;
}

- (NSString)clientBundleID
{
  return self->_clientBundleID;
}

- (void)setClientBundleID:(id)a3
{
}

- (NSString)clientMainBundleID
{
  return self->_clientMainBundleID;
}

- (void)setClientMainBundleID:(id)a3
{
}

- (RPClientProxy)clientProxy
{
  return self->_clientProxy;
}

- (void)setClientProxy:(id)a3
{
}

- (int)clientPID
{
  return self->_clientPID;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)clientConnectionAuditToken
{
  long long v3 = *(_OWORD *)self[4].var0;
  *(_OWORD *)retstr->var0 = *(_OWORD *)&self[3].var0[4];
  *(_OWORD *)&retstr->var0[4] = v3;
  return self;
}

- (void)setClientConnectionAuditToken:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)self->_clientConnectionAuditToken.val = *(_OWORD *)a3->var0;
  *(_OWORD *)&self->_clientConnectionAuditToken.val[4] = v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientProxy, 0);
  objc_storeStrong((id *)&self->_clientMainBundleID, 0);
  objc_storeStrong((id *)&self->_clientBundleID, 0);
  objc_storeStrong((id *)&self->_alertQueue, 0);
  objc_storeStrong((id *)&self->_accessInterval, 0);
  objc_storeStrong((id *)&self->_systemBroadcastSession, 0);
  objc_storeStrong((id *)&self->_systemRecordSession, 0);
  objc_storeStrong((id *)&self->_clipSession, 0);
  objc_storeStrong((id *)&self->_broadcastSession, 0);
  objc_storeStrong((id *)&self->_captureSession, 0);

  objc_storeStrong((id *)&self->_recordSession, 0);
}

@end