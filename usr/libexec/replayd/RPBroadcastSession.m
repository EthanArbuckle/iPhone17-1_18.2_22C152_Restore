@interface RPBroadcastSession
- (BOOL)isBroadcastSetup;
- (BOOL)showAlertForBroadcastSessionWithError:(id)a3;
- (BOOL)showResumeBroadcastAlert;
- (NSDictionary)extensionInfo;
- (NSString)broadcastHostBundleId;
- (RPBroadcastConfiguration)broadcastConfiguration;
- (RPBroadcastSession)initWithClientProxy:(id)a3 callingPID:(int)a4 bundleID:(id)a5 delegate:(id)a6;
- (id)broadcastSessionAudioQueue;
- (id)broadcastSessionVideoQueue;
- (id)dispatchCaptureQueue;
- (id)enableBroadcastWithListenerEndpoint:(id)a3;
- (unsigned)orientationFromFigTransform:(unint64_t)a3;
- (void)captureDidFailWithError:(id)a3;
- (void)didCaptureSampleWithType:(int)a3 withSampleBuffer:(opaqueCMSampleBuffer *)a4 withTransformFlags:(unint64_t)a5;
- (void)disableBroadcast;
- (void)enableBroadcastStartCaptureWithListenerEndpoint:(id)a3 withHandler:(id)a4;
- (void)handleBroadcastError:(id)a3;
- (void)handleBroadcastServiceInfo:(id)a3;
- (void)handleBroadcastURL:(id)a3;
- (void)handleClientApplicationDidEnterBackground;
- (void)handleClientApplicationDidEnterForeground;
- (void)handleDeviceLockedWarning;
- (void)handleDeviceRestrictionWarning;
- (void)handleDisplayWarning;
- (void)handleResumeCaptureWithCompletionHandler:(id)a3;
- (void)handleResumeContextIDFailure;
- (void)loadBroadcastUploadExtensionWithBaseIdentifier:(id)a3 withHandler:(id)a4;
- (void)notifyExtensionOfAction:(int64_t)a3 completion:(id)a4;
- (void)notifyExtensionOfAudioSampleBuffer:(opaqueCMSampleBuffer *)a3 withType:(int64_t)a4;
- (void)notifyExtensionOfVideoSampleBuffer:(opaqueCMSampleBuffer *)a3 withType:(int64_t)a4 sampleOrientation:(unsigned int)a5;
- (void)pauseSession;
- (void)processAcknowledgementSetupBroadcastWithMicrophoneEnabled:(BOOL)a3 cameraEnabled:(BOOL)a4 listenerEndpoint:(id)a5 withHandler:(id)a6;
- (void)processSampleBuffer:(opaqueCMSampleBuffer *)a3 transformFlags:(unint64_t)a4;
- (void)processSampleBufferForStreaming:(opaqueCMSampleBuffer *)a3 transformFlags:(unint64_t)a4;
- (void)resumeSessionWithWindowLayerContextID:(id)a3 completionHandler:(id)a4;
- (void)setBroadcastConfiguration:(id)a3;
- (void)setBroadcastHostBundleId:(id)a3;
- (void)setExtensionInfo:(id)a3;
- (void)setupBroadcastWithHostBundleID:(id)a3 broadcastExtensionBundleID:(id)a4 broadcastConfigurationData:(id)a5 userInfo:(id)a6 handler:(id)a7;
- (void)startBroadcastWithMicrophoneEnabled:(BOOL)a3 cameraEnabled:(BOOL)a4 contextID:(id)a5 windowSize:(CGSize)a6 listenerEndpoint:(id)a7 handler:(id)a8;
- (void)startCaptureWithHandler:(id)a3;
- (void)stopBroadcastWithHandler:(id)a3;
- (void)updateBroadcastURL:(id)a3;
@end

@implementation RPBroadcastSession

- (RPBroadcastSession)initWithClientProxy:(id)a3 callingPID:(int)a4 bundleID:(id)a5 delegate:(id)a6
{
  v9.receiver = self;
  v9.super_class = (Class)RPBroadcastSession;
  v6 = [(RPSession *)&v9 initWithClientProxy:a3 sessionType:3 callingPID:*(void *)&a4 bundleID:a5 delegate:a6];
  if (v6)
  {
    if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446722;
      v11 = "-[RPBroadcastSession initWithClientProxy:callingPID:bundleID:delegate:]";
      __int16 v12 = 1024;
      int v13 = 66;
      __int16 v14 = 2048;
      v15 = v6;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p", buf, 0x1Cu);
    }
    broadcastURL = v6->_broadcastURL;
    v6->_broadcastURL = 0;
  }
  return v6;
}

- (void)startBroadcastWithMicrophoneEnabled:(BOOL)a3 cameraEnabled:(BOOL)a4 contextID:(id)a5 windowSize:(CGSize)a6 listenerEndpoint:(id)a7 handler:(id)a8
{
  double height = a6.height;
  double width = a6.width;
  BOOL v12 = a4;
  BOOL v13 = a3;
  id v15 = a5;
  id v16 = a7;
  v17 = (void (**)(id, void *))a8;
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446978;
    v21 = "-[RPBroadcastSession startBroadcastWithMicrophoneEnabled:cameraEnabled:contextID:windowSize:listenerEndpoint:handler:]";
    __int16 v22 = 1024;
    int v23 = 74;
    __int16 v24 = 2048;
    v25 = self;
    __int16 v26 = 1024;
    unsigned int v27 = [(RPSession *)self sessionState];
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p starting in session state %d", buf, 0x22u);
  }
  if ([(RPSession *)self sessionState] != 3)
  {
    if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v21 = "-[RPBroadcastSession startBroadcastWithMicrophoneEnabled:cameraEnabled:contextID:windowSize:listenerEndpoint:handler:]";
      __int16 v22 = 1024;
      int v23 = 97;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d attempting to start broadcast session when session was not in stopped state", buf, 0x12u);
    }
    v18 = +[NSError _rpUserErrorForCode:-5830 userInfo:0];
    [(RPSession *)self reportSessionEndReason:v18];
    if (!v17) {
      goto LABEL_17;
    }
LABEL_15:
    v17[2](v17, v18);
    goto LABEL_17;
  }
  v19.receiver = self;
  v19.super_class = (Class)RPBroadcastSession;
  -[RPSession startWithContextID:windowSize:](&v19, "startWithContextID:windowSize:", v15, width, height);
  v18 = -[RPSession checkCaptureRequirementsWithMicrophoneEnabled:cameraEnabled:windowSize:](self, "checkCaptureRequirementsWithMicrophoneEnabled:cameraEnabled:windowSize:", v13, v12, width, height);
  if (!v18)
  {
    [(RPBroadcastSession *)self processAcknowledgementSetupBroadcastWithMicrophoneEnabled:v13 cameraEnabled:v12 listenerEndpoint:v16 withHandler:v17];
    goto LABEL_17;
  }
  if (dword_100099BB8 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100054538();
  }
  [(RPSession *)self setSessionState:3];
  if (v17) {
    goto LABEL_15;
  }
LABEL_17:
}

- (void)stopBroadcastWithHandler:(id)a3
{
  v4 = (void (**)(id, void *))a3;
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446978;
    objc_super v9 = "-[RPBroadcastSession stopBroadcastWithHandler:]";
    __int16 v10 = 1024;
    int v11 = 109;
    __int16 v12 = 2048;
    BOOL v13 = self;
    __int16 v14 = 1024;
    unsigned int v15 = [(RPSession *)self sessionState];
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p stopping in session state %d", buf, 0x22u);
  }
  if ([(RPSession *)self sessionState] == 3
    || ![(RPSession *)self sessionState]
    || [(RPSession *)self sessionState] == 2)
  {
    v5 = +[NSError _rpUserErrorForCode:-5829 userInfo:0];
    [(RPSession *)self reportSessionEndReason:v5];
    if (v4) {
      v4[2](v4, v5);
    }
  }
  else
  {
    [(RPSession *)self setSessionState:2];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10003CB84;
    v6[3] = &unk_100084EB8;
    v6[4] = self;
    v7 = v4;
    [(RPBroadcastSession *)self notifyExtensionOfAction:4 completion:v6];
  }
}

- (void)disableBroadcast
{
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136446466;
    v7 = "-[RPBroadcastSession disableBroadcast]";
    __int16 v8 = 1024;
    int v9 = 142;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d disableBroadcast", (uint8_t *)&v6, 0x12u);
  }
  [(RPSession *)self setSessionState:3];
  broadcastExtension = self->_broadcastExtension;
  self->_broadcastExtension = 0;

  broadcastUserInfo = self->_broadcastUserInfo;
  self->_broadcastUserInfo = 0;

  broadcastConfiguration = self->_broadcastConfiguration;
  self->_broadcastConfiguration = 0;
}

- (BOOL)isBroadcastSetup
{
  return self->_broadcastExtension && self->_broadcastUserInfo != 0;
}

- (void)updateBroadcastURL:(id)a3
{
  v4 = (NSURL *)a3;
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136446466;
    v7 = "-[RPBroadcastSession updateBroadcastURL:]";
    __int16 v8 = 1024;
    int v9 = 158;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v6, 0x12u);
  }
  broadcastURL = self->_broadcastURL;
  self->_broadcastURL = v4;
}

- (void)processAcknowledgementSetupBroadcastWithMicrophoneEnabled:(BOOL)a3 cameraEnabled:(BOOL)a4 listenerEndpoint:(id)a5 withHandler:(id)a6
{
  BOOL v7 = a4;
  BOOL v8 = a3;
  id v10 = a5;
  int v11 = (void (**)(id, void *))a6;
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 136446466;
    unsigned int v15 = "-[RPBroadcastSession processAcknowledgementSetupBroadcastWithMicrophoneEnabled:cameraEnabled:listenerEndpoint:withHandler:]";
    __int16 v16 = 1024;
    int v17 = 163;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v14, 0x12u);
  }
  if ([(RPSession *)self getAcknowledgementAlertResultsWithMicrophone:v8 cameraEnabled:v7])
  {
    if ([(RPBroadcastSession *)self isBroadcastSetup])
    {
      [(RPBroadcastSession *)self enableBroadcastStartCaptureWithListenerEndpoint:v10 withHandler:v11];
    }
    else
    {
      if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 136446466;
        unsigned int v15 = "-[RPBroadcastSession processAcknowledgementSetupBroadcastWithMicrophoneEnabled:cameraEnabled:listenerEndpo"
              "int:withHandler:]";
        __int16 v16 = 1024;
        int v17 = 177;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d attempted to start broadcast without a session, bailing out", (uint8_t *)&v14, 0x12u);
      }
      [(RPSession *)self setSessionState:3];
      BOOL v13 = +[NSError _rpUserErrorForCode:-5808 userInfo:0];
      [(RPSession *)self reportSessionEndReason:v13];
      if (v11) {
        v11[2](v11, v13);
      }
    }
  }
  else
  {
    [(RPBroadcastSession *)self disableBroadcast];
    if (v11)
    {
      __int16 v12 = +[NSError _rpUserErrorForCode:-5801 userInfo:0];
      v11[2](v11, v12);
    }
  }
}

- (void)enableBroadcastStartCaptureWithListenerEndpoint:(id)a3 withHandler:(id)a4
{
  id v6 = a3;
  BOOL v7 = (void (**)(id, void *))a4;
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    __int16 v12 = "-[RPBroadcastSession enableBroadcastStartCaptureWithListenerEndpoint:withHandler:]";
    __int16 v13 = 1024;
    int v14 = 203;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d found broadcast info, enabling for session", buf, 0x12u);
  }
  BOOL v8 = [(RPBroadcastSession *)self enableBroadcastWithListenerEndpoint:v6];
  if (v8)
  {
    if (dword_100099BB8 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000545BC();
    }
    [(RPSession *)self setSessionState:3];
    if (v7) {
      v7[2](v7, v8);
    }
  }
  else
  {
    if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      __int16 v12 = "-[RPBroadcastSession enableBroadcastStartCaptureWithListenerEndpoint:withHandler:]";
      __int16 v13 = 1024;
      int v14 = 216;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d broadcast started without error", buf, 0x12u);
    }
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10003D2D4;
    v9[3] = &unk_100084EB8;
    v9[4] = self;
    id v10 = v7;
    [(RPBroadcastSession *)self notifyExtensionOfAction:1 completion:v9];
  }
}

- (void)startCaptureWithHandler:(id)a3
{
  id v4 = a3;
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v18 = "-[RPBroadcastSession startCaptureWithHandler:]";
    __int16 v19 = 1024;
    int v20 = 233;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  v5 = +[RPCaptureManager sharedInstance];
  uint64_t callingPID = self->super._callingPID;
  BOOL v7 = [(RPSession *)self microphoneEnabled];
  [(RPSession *)self windowSize];
  double v9 = v8;
  double v11 = v10;
  __int16 v12 = [(RPSession *)self contextID];
  __int16 v13 = +[NSArray arrayWithObject:v12];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10003D4D0;
  v15[3] = &unk_1000853B8;
  v15[4] = self;
  id v16 = v4;
  id v14 = v4;
  [v5 startCaptureForDelegate:self forProcessID:callingPID shouldStartMicrophoneCapture:v7 windowSize:v13 systemRecording:v15 contextIDs:v9 didStartHandler:v11];
}

- (void)pauseSession
{
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446978;
    BOOL v7 = "-[RPBroadcastSession pauseSession]";
    __int16 v8 = 1024;
    int v9 = 255;
    __int16 v10 = 2048;
    double v11 = self;
    __int16 v12 = 1024;
    unsigned int v13 = [(RPSession *)self sessionState];
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p pausing in session state %d", buf, 0x22u);
  }
  if ([(RPSession *)self sessionState] == 1)
  {
    v3 = +[RPCaptureManager sharedInstance];
    [v3 stopCaptureForDelegate:self];

    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_10003D7A8;
    v5[3] = &unk_100084E28;
    v5[4] = self;
    [(RPBroadcastSession *)self notifyExtensionOfAction:2 completion:v5];
    v4.receiver = self;
    v4.super_class = (Class)RPBroadcastSession;
    [(RPSession *)&v4 pauseSession];
  }
}

- (void)resumeSessionWithWindowLayerContextID:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446978;
    unsigned int v13 = "-[RPBroadcastSession resumeSessionWithWindowLayerContextID:completionHandler:]";
    __int16 v14 = 1024;
    int v15 = 270;
    __int16 v16 = 2048;
    int v17 = self;
    __int16 v18 = 1024;
    unsigned int v19 = [(RPSession *)self sessionState];
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p resuming in session state %d", buf, 0x22u);
  }
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10003D960;
  v10[3] = &unk_100084E90;
  id v11 = v7;
  v9.receiver = self;
  v9.super_class = (Class)RPBroadcastSession;
  id v8 = v7;
  [(RPSession *)&v9 resumeSessionWithWindowLayerContextID:v6 completionHandler:v10];
  [(RPBroadcastSession *)self notifyExtensionOfAction:3 completion:&stru_100085F40];
}

- (id)enableBroadcastWithListenerEndpoint:(id)a3
{
  id v4 = a3;
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    int v23 = "-[RPBroadcastSession enableBroadcastWithListenerEndpoint:]";
    __int16 v24 = 1024;
    int v25 = 281;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d enableBroadcastWithExtension", buf, 0x12u);
  }
  objc_initWeak(&location, self);
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    int v23 = "-[RPBroadcastSession enableBroadcastWithListenerEndpoint:]";
    __int16 v24 = 1024;
    int v25 = 288;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d setting up extension proxy", buf, 0x12u);
  }
  if (v4)
  {
    v5 = [[RPBroadcastExtensionProxy alloc] initWithBroadcastUploadListenerEndpoint:v4];
    broadcastUploadExtensionProxy = self->_broadcastUploadExtensionProxy;
    self->_broadcastUploadExtensionProxy = v5;
  }
  else
  {
    id v7 = [[RPBroadcastExtensionProxy alloc] initWithBroadcastUploadExtension:self->_broadcastExtension];
    id v8 = self->_broadcastUploadExtensionProxy;
    self->_broadcastUploadExtensionProxy = v7;

    dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
    __int16 v10 = self->_broadcastUploadExtensionProxy;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10003DE08;
    v18[3] = &unk_100085018;
    broadcastUploadExtensionProxy = v9;
    unsigned int v19 = broadcastUploadExtensionProxy;
    int v20 = self;
    [(RPBroadcastExtensionProxy *)v10 establishConnectionWithHandler:v18];
    dispatch_semaphore_wait(&broadcastUploadExtensionProxy->super, 0xFFFFFFFFFFFFFFFFLL);
  }
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10003DEF8;
  v16[3] = &unk_100085628;
  objc_copyWeak(&v17, &location);
  [(RPBroadcastExtensionProxy *)self->_broadcastUploadExtensionProxy setServiceInfoHandler:v16];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10003DF54;
  v14[3] = &unk_100085C20;
  objc_copyWeak(&v15, &location);
  [(RPBroadcastExtensionProxy *)self->_broadcastUploadExtensionProxy setBroadcastURLHandler:v14];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10003DFB0;
  v12[3] = &unk_1000851F8;
  objc_copyWeak(&v13, &location);
  [(RPBroadcastExtensionProxy *)self->_broadcastUploadExtensionProxy setErrorHandler:v12];
  objc_destroyWeak(&v13);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

  return 0;
}

- (void)handleBroadcastServiceInfo:(id)a3
{
}

- (void)handleBroadcastURL:(id)a3
{
}

- (void)handleBroadcastError:(id)a3
{
  id v4 = a3;
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    id v8 = "-[RPBroadcastSession handleBroadcastError:]";
    __int16 v9 = 1024;
    int v10 = 335;
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d error %@", buf, 0x1Cu);
  }
  if ([(RPSession *)self sessionState] == 1 || [(RPSession *)self sessionState] == 4)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_10003E19C;
    v5[3] = &unk_100085018;
    v5[4] = self;
    id v6 = v4;
    [(RPBroadcastSession *)self stopBroadcastWithHandler:v5];
  }
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
    unsigned int v27 = "-[RPBroadcastSession setupBroadcastWithHostBundleID:broadcastExtensionBundleID:broadcastConfigurationData:userInfo:handler:]";
    __int16 v28 = 1024;
    int v29 = 346;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  id v17 = +[NSBundle baseIdentifier:v13];
  [(RPBroadcastSession *)self setBroadcastHostBundleId:v17];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10003E3CC;
  v21[3] = &unk_100085C48;
  id v22 = v14;
  int v23 = self;
  id v24 = v15;
  id v25 = v16;
  id v18 = v16;
  id v19 = v15;
  id v20 = v14;
  [(RPBroadcastSession *)self loadBroadcastUploadExtensionWithBaseIdentifier:v17 withHandler:v21];
}

- (void)loadBroadcastUploadExtensionWithBaseIdentifier:(id)a3 withHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    id v13 = "-[RPBroadcastSession loadBroadcastUploadExtensionWithBaseIdentifier:withHandler:]";
    __int16 v14 = 1024;
    int v15 = 378;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d looking for upload extension", buf, 0x12u);
  }
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10003E694;
  v9[3] = &unk_100085F68;
  id v10 = v5;
  id v11 = v6;
  id v7 = v5;
  id v8 = v6;
  +[NSExtension extensionsWithMatchingPointName:@"com.apple.broadcast-services-upload" baseIdentifier:v7 completion:v9];
}

- (id)dispatchCaptureQueue
{
  if (qword_100099D50 != -1) {
    dispatch_once(&qword_100099D50, &stru_100085F88);
  }
  v2 = (void *)qword_100099D48;

  return v2;
}

- (void)didCaptureSampleWithType:(int)a3 withSampleBuffer:(opaqueCMSampleBuffer *)a4 withTransformFlags:(unint64_t)a5
{
  uint64_t v7 = *(void *)&a3;
  if ([(RPSession *)self sessionState] != 1) {
    return;
  }
  [(RPSession *)self updateReportingSampleCount:v7];
  if (v7 == 2)
  {
    if (![(RPSession *)self microphoneEnabled])
    {
      DataBuffer = CMSampleBufferGetDataBuffer(a4);
      size_t DataLength = CMBlockBufferGetDataLength(DataBuffer);
      CMBlockBufferFillDataBytes(0, DataBuffer, 0, DataLength);
    }
    __int16 v9 = self;
    id v10 = a4;
    uint64_t v11 = 3;
  }
  else
  {
    if (v7 != 1)
    {
      if (!v7)
      {
        [(RPBroadcastSession *)self processSampleBuffer:a4 transformFlags:a5];
      }
      return;
    }
    __int16 v9 = self;
    id v10 = a4;
    uint64_t v11 = 2;
  }

  [(RPBroadcastSession *)v9 notifyExtensionOfAudioSampleBuffer:v10 withType:v11];
}

- (void)captureDidFailWithError:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10003EA54;
  v5[3] = &unk_100085018;
  id v6 = a3;
  uint64_t v7 = self;
  id v4 = v6;
  [(RPBroadcastSession *)self stopBroadcastWithHandler:v5];
}

- (BOOL)showAlertForBroadcastSessionWithError:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4 && ([v4 domain], id v6 = objc_claimAutoreleasedReturnValue(), v6, v6))
  {
    uint64_t v7 = [v5 localizedFailureReason];

    if (v7) {
      [v5 localizedFailureReason];
    }
    else {
    __int16 v9 = [v5 localizedDescription];
    }
    id v10 = +[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:@"BROADCAST_FAILED_ALERT_MESSAGE_FORMAT"];
    uint64_t v11 = [(NSExtension *)self->_broadcastExtension infoDictionary];
    id v12 = [v11 objectForKey:_kCFBundleDisplayNameKey];
    id v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v10, v12, v9);

    __int16 v14 = +[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:@"BROADCAST_STATUSBAR_TAPPED_ALERT_TITLE"];
    id v15 = v13;
    id v16 = +[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:@"BROADCAST_FAILED_ALERT_OK_BUTTON"];
    id v17 = +[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:@"BROADCAST_FAILED_ALERT_GO_TO_APP_BUTTON"];
    v51[0] = kCFUserNotificationAlertHeaderKey;
    v51[1] = kCFUserNotificationAlertMessageKey;
    v52[0] = v14;
    v52[1] = v15;
    v51[2] = kCFUserNotificationOtherButtonTitleKey;
    v51[3] = kCFUserNotificationDefaultButtonTitleKey;
    v52[2] = v16;
    v52[3] = v17;
    id v18 = CFUserNotificationCreate(kCFAllocatorDefault, 0.0, 0, 0, (CFDictionaryRef)+[NSDictionary dictionaryWithObjects:v52 forKeys:v51 count:4]);
    if (v18)
    {
      id v19 = v18;
      *(void *)buf = 0;
      CFUserNotificationReceiveResponse(v18, 0.0, (CFOptionFlags *)buf);
      if (*(void *)buf == 2)
      {
        BOOL v41 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
        if (v41) {
          sub_10005486C(v41, v42, v43, v44, v45, v46, v47, v48);
        }
      }
      else if (!*(void *)buf)
      {
        v50 = v9;
        id v20 = [(NSExtension *)self->_broadcastExtension identifier];
        v21 = +[LSPlugInKitProxy pluginKitProxyForIdentifier:v20];

        id v22 = [v21 containingBundle];
        int v23 = [v22 bundleIdentifier];

        id v24 = +[LSApplicationWorkspace defaultWorkspace];
        [v24 openApplicationWithBundleID:v23];

        BOOL v25 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
        if (v25) {
          sub_1000547F0(v25, v26, v27, v28, v29, v30, v31, v32);
        }

        __int16 v9 = v50;
      }
      CFRelease(v19);
    }
    else
    {
      BOOL v33 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v33) {
        sub_100054774(v33, v34, v35, v36, v37, v38, v39, v40);
      }
    }

    BOOL v8 = 0;
  }
  else
  {
    if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      *(void *)&uint8_t buf[4] = "-[RPBroadcastSession showAlertForBroadcastSessionWithError:]";
      __int16 v54 = 1024;
      int v55 = 456;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Not showing the alert, as there is no error or the error domain is nil", buf, 0x12u);
    }
    BOOL v8 = 1;
  }

  return v8;
}

- (BOOL)showResumeBroadcastAlert
{
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    id v20 = "-[RPBroadcastSession showResumeBroadcastAlert]";
    __int16 v21 = 1024;
    int v22 = 521;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  if (![(RPSession *)self shouldBypassAlertForTest])
  {
    if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      id v20 = "-[RPBroadcastSession showResumeBroadcastAlert]";
      __int16 v21 = 1024;
      int v22 = 527;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
    }
    id v4 = +[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:@"BROADCAST_RESUME_ALERT_MESSAGE_FORMAT"];
    id v5 = [(NSExtension *)self->_broadcastExtension infoDictionary];
    id v6 = [v5 objectForKey:_kCFBundleDisplayNameKey];
    uint64_t v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v4, v6);

    BOOL v8 = +[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:@"BROADCAST_STATUSBAR_TAPPED_ALERT_TITLE"];
    id v9 = v7;
    id v10 = +[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:@"RECORDING_STATUSBAR_TAPPED_ALERT_DECLINE_BUTTON"];
    uint64_t v11 = +[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:@"BROADCAST_ACTIVITIES_PREFERRED_ACCEPT_BUTTON"];
    v17[0] = kCFUserNotificationAlertHeaderKey;
    v17[1] = kCFUserNotificationAlertMessageKey;
    v18[0] = v8;
    v18[1] = v9;
    v17[2] = kCFUserNotificationOtherButtonTitleKey;
    v17[3] = kCFUserNotificationDefaultButtonTitleKey;
    v18[2] = v10;
    v18[3] = v11;
    id v12 = CFUserNotificationCreate(kCFAllocatorDefault, 0.0, 0, 0, (CFDictionaryRef)+[NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:4]);
    if (!v12)
    {
      if (dword_100099BB8 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_1000548E8();
      }
      BOOL v3 = 0;
      goto LABEL_24;
    }
    id v13 = v12;
    CFOptionFlags responseFlags = 0;
    CFUserNotificationReceiveResponse(v12, 0.0, &responseFlags);
    BOOL v3 = responseFlags == 0;
    if (responseFlags)
    {
      if (responseFlags != 2
        || dword_100099BB8 > 1
        || !os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        goto LABEL_23;
      }
      *(_DWORD *)buf = 136446466;
      id v20 = "-[RPBroadcastSession showResumeBroadcastAlert]";
      __int16 v21 = 1024;
      int v22 = 560;
      __int16 v14 = " [INFO] %{public}s:%d declined resume broadcast";
    }
    else
    {
      if (dword_100099BB8 > 1 || !os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_23;
      }
      *(_DWORD *)buf = 136446466;
      id v20 = "-[RPBroadcastSession showResumeBroadcastAlert]";
      __int16 v21 = 1024;
      int v22 = 558;
      __int16 v14 = " [INFO] %{public}s:%d accepted resume broadcast";
    }
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v14, buf, 0x12u);
LABEL_23:
    CFRelease(v13);
LABEL_24:

    return v3;
  }
  return 1;
}

- (void)processSampleBufferForStreaming:(opaqueCMSampleBuffer *)a3 transformFlags:(unint64_t)a4
{
}

- (void)processSampleBuffer:(opaqueCMSampleBuffer *)a3 transformFlags:(unint64_t)a4
{
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136446466;
    BOOL v8 = "-[RPBroadcastSession processSampleBuffer:transformFlags:]";
    __int16 v9 = 1024;
    int v10 = 590;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d processing sample buffer for streaming", (uint8_t *)&v7, 0x12u);
  }
  if ([(RPSession *)self sessionState] == 4)
  {
    if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136446466;
      BOOL v8 = "-[RPBroadcastSession processSampleBuffer:transformFlags:]";
      __int16 v9 = 1024;
      int v10 = 593;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d session is paused discard sample", (uint8_t *)&v7, 0x12u);
    }
  }
  else
  {
    [(RPBroadcastSession *)self notifyExtensionOfVideoSampleBuffer:a3 withType:1 sampleOrientation:[(RPBroadcastSession *)self orientationFromFigTransform:a4]];
  }
}

- (void)notifyExtensionOfAudioSampleBuffer:(opaqueCMSampleBuffer *)a3 withType:(int64_t)a4
{
  if (self->_broadcastExtension)
  {
    if (self->_broadcastUploadExtensionProxy)
    {
      if (![(RPSession *)self dispatchLimitReached:a4])
      {
        if (a3) {
          CFRetain(a3);
        }
        int v7 = sub_100049040(a3, a4);
        BOOL v8 = [(RPBroadcastSession *)self broadcastSessionAudioQueue];
        v10[0] = _NSConcreteStackBlock;
        v10[1] = 3221225472;
        v10[2] = sub_10003F588;
        v10[3] = &unk_100085D08;
        void v10[4] = self;
        id v11 = v7;
        int64_t v12 = a4;
        id v13 = a3;
        id v9 = v7;
        dispatch_async(v8, v10);
      }
    }
    else if (dword_100099BB8 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_1000549F0();
    }
  }
  else if (dword_100099BB8 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10005496C();
  }
}

- (void)notifyExtensionOfVideoSampleBuffer:(opaqueCMSampleBuffer *)a3 withType:(int64_t)a4 sampleOrientation:(unsigned int)a5
{
  if (!self->_broadcastExtension)
  {
    if (dword_100099BB8 > 1 || !os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    LODWORD(timingInfoOut.duration.value) = 136446466;
    *(CMTimeValue *)((char *)&timingInfoOut.duration.value + 4) = (CMTimeValue)"-[RPBroadcastSession notifyExtensionOfVid"
                                                                               "eoSampleBuffer:withType:sampleOrientation:]";
    LOWORD(timingInfoOut.duration.flags) = 1024;
    *(CMTimeFlags *)((char *)&timingInfoOut.duration.flags + 2) = 640;
    id v18 = " [INFO] %{public}s:%d no broadcast extension found!";
LABEL_13:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v18, (uint8_t *)&timingInfoOut, 0x12u);
    return;
  }
  if (!self->_broadcastUploadExtensionProxy)
  {
    if (dword_100099BB8 > 1 || !os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    LODWORD(timingInfoOut.duration.value) = 136446466;
    *(CMTimeValue *)((char *)&timingInfoOut.duration.value + 4) = (CMTimeValue)"-[RPBroadcastSession notifyExtensionOfVid"
                                                                               "eoSampleBuffer:withType:sampleOrientation:]";
    LOWORD(timingInfoOut.duration.flags) = 1024;
    *(CMTimeFlags *)((char *)&timingInfoOut.duration.flags + 2) = 645;
    id v18 = " [INFO] %{public}s:%d broadcast extension not ready";
    goto LABEL_13;
  }
  uint64_t v6 = *(void *)&a5;
  if (![(RPSession *)self dispatchLimitReached:a4])
  {
    if (a3) {
      CFRetain(a3);
    }
    id v9 = +[NSMutableDictionary dictionary];
    int v10 = +[NSNumber numberWithUnsignedInt:v6];
    [v9 setObject:v10 forKeyedSubscript:@"RPSampleBufferVideoOrientation"];

    id v11 = +[NSNumber numberWithInteger:a4];
    [v9 setObject:v11 forKeyedSubscript:@"RPBroadcastProcessExtensionPayloadKeySampleType"];

    CVImageBufferRef ImageBuffer = CMSampleBufferGetImageBuffer(a3);
    CFRetain(ImageBuffer);
    IOSurfaceRef IOSurface = CVPixelBufferGetIOSurface(ImageBuffer);
    __int16 v14 = objc_alloc_init(RPIOSurfaceObject);
    [(RPIOSurfaceObject *)v14 setIOSurface:IOSurface];
    [v9 setObject:v14 forKeyedSubscript:@"RPBroadcastProcessExtensionPayloadKeyIOSurface"];
    memset(&timingInfoOut, 0, sizeof(timingInfoOut));
    CMSampleBufferGetSampleTimingInfo(a3, 0, &timingInfoOut);
    id v15 = +[NSData dataWithBytes:&timingInfoOut length:72];
    [v9 setObject:v15 forKeyedSubscript:@"RPBroadcastProcessExtensionPayloadKeyTimingInfo"];
    id v16 = [(RPBroadcastSession *)self broadcastSessionVideoQueue];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10003FA34;
    v19[3] = &unk_100085D08;
    v19[4] = self;
    id v20 = v9;
    __int16 v21 = a3;
    int64_t v22 = a4;
    id v17 = v9;
    dispatch_async(v16, v19);

    CFRelease(ImageBuffer);
  }
}

- (void)notifyExtensionOfAction:(int64_t)a3 completion:(id)a4
{
  uint64_t v6 = (void (**)(void))a4;
  if (!self->_broadcastExtension)
  {
    if (dword_100099BB8 > 1 || !os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_16;
    }
    *(_DWORD *)buf = 136446466;
    id v20 = "-[RPBroadcastSession notifyExtensionOfAction:completion:]";
    __int16 v21 = 1024;
    int v22 = 691;
    id v13 = " [INFO] %{public}s:%d no broadcast extension found!";
    goto LABEL_15;
  }
  if (!self->_broadcastUploadExtensionProxy)
  {
    if (dword_100099BB8 > 1 || !os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_16;
    }
    *(_DWORD *)buf = 136446466;
    id v20 = "-[RPBroadcastSession notifyExtensionOfAction:completion:]";
    __int16 v21 = 1024;
    int v22 = 697;
    id v13 = " [INFO] %{public}s:%d broadcast extension not ready";
LABEL_15:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v13, buf, 0x12u);
LABEL_16:
    v6[2](v6);
    goto LABEL_19;
  }
  int v7 = +[NSMutableDictionary dictionary];
  BOOL v8 = +[NSNumber numberWithInteger:a3];
  [v7 setObject:v8 forKeyedSubscript:@"RPBroadcastProcessExtensionPayloadKeyActionType"];

  [v7 setObject:self->_broadcastUserInfo forKeyedSubscript:@"RPBroadcastExtensionKeyExtensionUserInfo"];
  if (a3 == 4)
  {
    dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
    broadcastUploadExtensionProxy = self->_broadcastUploadExtensionProxy;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10003FEEC;
    v15[3] = &unk_100084E28;
    id v11 = v9;
    id v16 = v11;
    [(RPBroadcastExtensionProxy *)broadcastUploadExtensionProxy processPayload:v7 completion:v15];
    dispatch_time_t v12 = dispatch_time(0, 5000000000);
    if (dispatch_semaphore_wait(v11, v12)
      && dword_100099BB8 <= 2
      && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_100054A74();
    }
    v6[2](v6);
  }
  else
  {
    __int16 v14 = self->_broadcastUploadExtensionProxy;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10003FEDC;
    v17[3] = &unk_100085A28;
    id v18 = v6;
    [(RPBroadcastExtensionProxy *)v14 processPayload:v7 completion:v17];
    id v11 = v18;
  }

LABEL_19:
}

- (id)broadcastSessionAudioQueue
{
  if (qword_100099D60 != -1) {
    dispatch_once(&qword_100099D60, &stru_100085FA8);
  }
  v2 = (void *)qword_100099D58;

  return v2;
}

- (id)broadcastSessionVideoQueue
{
  if (qword_100099D70 != -1) {
    dispatch_once(&qword_100099D70, &stru_100085FC8);
  }
  v2 = (void *)qword_100099D68;

  return v2;
}

- (unsigned)orientationFromFigTransform:(unint64_t)a3
{
  if (a3 - 1 > 6) {
    return 1;
  }
  else {
    return dword_100061DE0[a3 - 1];
  }
}

- (void)handleResumeCaptureWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446978;
    id v18 = "-[RPBroadcastSession handleResumeCaptureWithCompletionHandler:]";
    __int16 v19 = 1024;
    int v20 = 804;
    __int16 v21 = 2048;
    int v22 = self;
    __int16 v23 = 1024;
    unsigned int v24 = [(RPSession *)self sessionState];
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p resuming in session state %d", buf, 0x22u);
  }
  self->super._sessionIsResuming = 1;
  id v5 = +[RPCaptureManager sharedInstance];
  uint64_t callingPID = self->super._callingPID;
  BOOL v7 = [(RPSession *)self microphoneEnabled];
  [(RPSession *)self windowSize];
  double v9 = v8;
  double v11 = v10;
  dispatch_time_t v12 = [(RPSession *)self contextID];
  id v13 = +[NSArray arrayWithObject:v12];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000402B0;
  v15[3] = &unk_1000853B8;
  void v15[4] = self;
  id v16 = v4;
  id v14 = v4;
  [v5 startCaptureForDelegate:self forProcessID:callingPID shouldStartMicrophoneCapture:v7 windowSize:v13 systemRecording:v15 contextIDs:v9 didStartHandler:v11];
}

- (void)handleClientApplicationDidEnterBackground
{
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136446722;
    id v4 = "-[RPBroadcastSession handleClientApplicationDidEnterBackground]";
    __int16 v5 = 1024;
    int v6 = 824;
    __int16 v7 = 1024;
    unsigned int v8 = [(RPSession *)self sessionState];
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d session state %d", (uint8_t *)&v3, 0x18u);
  }
  [(RPBroadcastSession *)self pauseSession];
}

- (void)handleClientApplicationDidEnterForeground
{
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    __int16 v5 = "-[RPBroadcastSession handleClientApplicationDidEnterForeground]";
    __int16 v6 = 1024;
    int v7 = 831;
    __int16 v8 = 1024;
    unsigned int v9 = [(RPSession *)self sessionState];
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d session state %d", buf, 0x18u);
  }
  if ([(RPSession *)self sessionState] == 4)
  {
    if ([(RPBroadcastSession *)self showResumeBroadcastAlert])
    {
      if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        __int16 v5 = "-[RPBroadcastSession handleClientApplicationDidEnterForeground]";
        __int16 v6 = 1024;
        int v7 = 835;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d resume", buf, 0x12u);
      }
      [(RPClientProtocol *)self->super._clientProxy shouldResumeSessionType:@"RPInAppBroadcast"];
    }
    else
    {
      if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        __int16 v5 = "-[RPBroadcastSession handleClientApplicationDidEnterForeground]";
        __int16 v6 = 1024;
        int v7 = 838;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d stop", buf, 0x12u);
      }
      v3[0] = _NSConcreteStackBlock;
      v3[1] = 3221225472;
      v3[2] = sub_1000406E8;
      v3[3] = &unk_1000856C0;
      v3[4] = self;
      [(RPBroadcastSession *)self stopBroadcastWithHandler:v3];
    }
  }
}

- (void)handleDisplayWarning
{
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    __int16 v5 = "-[RPBroadcastSession handleDisplayWarning]";
    __int16 v6 = 1024;
    int v7 = 850;
    __int16 v8 = 1024;
    unsigned int v9 = [(RPSession *)self sessionState];
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d session state %d", buf, 0x18u);
  }
  if ([(RPSession *)self sessionState] == 1 || [(RPSession *)self sessionState] == 4)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_10004090C;
    v3[3] = &unk_1000856C0;
    v3[4] = self;
    [(RPBroadcastSession *)self stopBroadcastWithHandler:v3];
  }
}

- (void)handleDeviceLockedWarning
{
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136446722;
    id v4 = "-[RPBroadcastSession handleDeviceLockedWarning]";
    __int16 v5 = 1024;
    int v6 = 861;
    __int16 v7 = 1024;
    unsigned int v8 = [(RPSession *)self sessionState];
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d session state %d", (uint8_t *)&v3, 0x18u);
  }
}

- (void)handleDeviceRestrictionWarning
{
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    __int16 v5 = "-[RPBroadcastSession handleDeviceRestrictionWarning]";
    __int16 v6 = 1024;
    int v7 = 879;
    __int16 v8 = 1024;
    unsigned int v9 = [(RPSession *)self sessionState];
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d session state %d", buf, 0x18u);
  }
  if ([(RPSession *)self sessionState] == 1 || [(RPSession *)self sessionState] == 4)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_100040C0C;
    v3[3] = &unk_1000856C0;
    v3[4] = self;
    [(RPBroadcastSession *)self stopBroadcastWithHandler:v3];
  }
}

- (void)handleResumeContextIDFailure
{
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    __int16 v5 = "-[RPBroadcastSession handleResumeContextIDFailure]";
    __int16 v6 = 1024;
    int v7 = 891;
    __int16 v8 = 1024;
    unsigned int v9 = [(RPSession *)self sessionState];
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d session state %d", buf, 0x18u);
  }
  if ([(RPSession *)self sessionState] == 1 || [(RPSession *)self sessionState] == 4)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_100040E30;
    v3[3] = &unk_1000856C0;
    v3[4] = self;
    [(RPBroadcastSession *)self stopBroadcastWithHandler:v3];
  }
}

- (NSDictionary)extensionInfo
{
  return self->_extensionInfo;
}

- (void)setExtensionInfo:(id)a3
{
}

- (RPBroadcastConfiguration)broadcastConfiguration
{
  return self->_broadcastConfiguration;
}

- (void)setBroadcastConfiguration:(id)a3
{
}

- (NSString)broadcastHostBundleId
{
  return self->_broadcastHostBundleId;
}

- (void)setBroadcastHostBundleId:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_broadcastHostBundleId, 0);
  objc_storeStrong((id *)&self->_broadcastConfiguration, 0);
  objc_storeStrong((id *)&self->_extensionInfo, 0);
  objc_storeStrong((id *)&self->_broadcastUploadExtensionProxy, 0);
  objc_storeStrong((id *)&self->_broadcastUserInfo, 0);
  objc_storeStrong((id *)&self->_broadcastExtension, 0);

  objc_storeStrong((id *)&self->_broadcastURL, 0);
}

@end