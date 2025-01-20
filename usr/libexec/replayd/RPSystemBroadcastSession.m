@interface RPSystemBroadcastSession
- (BOOL)isBroadcastSetup;
- (BOOL)showAlertForBroadcastSessionWithError:(id)a3;
- (NSDictionary)extensionInfo;
- (NSString)broadcastHostBundleId;
- (RPBroadcastConfiguration)broadcastConfiguration;
- (RPSystemBroadcastSession)initWithClientProxy:(id)a3 callingPID:(int)a4 bundleID:(id)a5 delegate:(id)a6;
- (id)dispatchCaptureQueue;
- (id)enableBroadcastWithListenerEndpoint:(id)a3;
- (id)systemBroadcastSessionAudioQueue;
- (id)systemBroadcastSessionVideoQueue;
- (unsigned)orientationFromFigTransform:(unint64_t)a3;
- (void)captureDidFailWithError:(id)a3;
- (void)didCaptureSampleWithType:(int)a3 withSampleBuffer:(opaqueCMSampleBuffer *)a4 withTransformFlags:(unint64_t)a5;
- (void)disableBroadcast;
- (void)enableBroadcastStartCaptureWithListenerEndpoint:(id)a3 withHandler:(id)a4;
- (void)handleBroadcastError:(id)a3;
- (void)handleBroadcastServiceInfo:(id)a3;
- (void)handleBroadcastURL:(id)a3;
- (void)handleDeviceLockedWarning;
- (void)handleDeviceRestrictionWarning;
- (void)handleFrontmostApplicationDidChange:(id)a3;
- (void)handleResumeCaptureWithCompletionHandler:(id)a3;
- (void)handleResumeContextIDFailure;
- (void)handleSystemAlertStop;
- (void)handleTimerDidUpdate:(id)a3;
- (void)loadBroadcastUploadExtensionWithBaseIdentifier:(id)a3 broadcastExtensionBundleID:(id)a4 withHandler:(id)a5;
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
- (void)setCaptureMicrophoneEnabled:(BOOL)a3;
- (void)setExtensionInfo:(id)a3;
- (void)setupSystemBroadcastWithHostBundleID:(id)a3 broadcastExtensionBundleID:(id)a4 broadcastConfigurationData:(id)a5 userInfo:(id)a6 handler:(id)a7;
- (void)startCaptureWithHandler:(id)a3;
- (void)startSystemBroadcastWithMicrophoneEnabled:(BOOL)a3 cameraEnabled:(BOOL)a4 contextID:(id)a5 windowSize:(CGSize)a6 listenerEndpoint:(id)a7 withHandler:(id)a8;
- (void)stopSystemBroadcastWithHandler:(id)a3;
- (void)updateBroadcastURL:(id)a3;
@end

@implementation RPSystemBroadcastSession

- (RPSystemBroadcastSession)initWithClientProxy:(id)a3 callingPID:(int)a4 bundleID:(id)a5 delegate:(id)a6
{
  v10.receiver = self;
  v10.super_class = (Class)RPSystemBroadcastSession;
  v6 = [(RPSession *)&v10 initWithClientProxy:a3 sessionType:6 callingPID:*(void *)&a4 bundleID:a5 delegate:a6];
  v7 = v6;
  if (v6)
  {
    broadcastURL = v6->_broadcastURL;
    v6->_broadcastURL = 0;
  }
  return v7;
}

- (void)startSystemBroadcastWithMicrophoneEnabled:(BOOL)a3 cameraEnabled:(BOOL)a4 contextID:(id)a5 windowSize:(CGSize)a6 listenerEndpoint:(id)a7 withHandler:(id)a8
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
    v21 = "-[RPSystemBroadcastSession startSystemBroadcastWithMicrophoneEnabled:cameraEnabled:contextID:windowSize:listen"
          "erEndpoint:withHandler:]";
    __int16 v22 = 1024;
    int v23 = 69;
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
      v21 = "-[RPSystemBroadcastSession startSystemBroadcastWithMicrophoneEnabled:cameraEnabled:contextID:windowSize:list"
            "enerEndpoint:withHandler:]";
      __int16 v22 = 1024;
      int v23 = 91;
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
  v19.super_class = (Class)RPSystemBroadcastSession;
  -[RPSession startWithContextID:windowSize:](&v19, "startWithContextID:windowSize:", v15, width, height);
  v18 = -[RPSession checkCaptureRequirementsWithMicrophoneEnabled:cameraEnabled:windowSize:](self, "checkCaptureRequirementsWithMicrophoneEnabled:cameraEnabled:windowSize:", v13, v12, width, height);
  if (!v18)
  {
    [(RPSystemBroadcastSession *)self processAcknowledgementSetupBroadcastWithMicrophoneEnabled:v13 cameraEnabled:v12 listenerEndpoint:v16 withHandler:v17];
    goto LABEL_17;
  }
  if (dword_100099BB8 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_1000528D8();
  }
  [(RPSession *)self setSessionState:3];
  if (v17) {
    goto LABEL_15;
  }
LABEL_17:
}

- (void)stopSystemBroadcastWithHandler:(id)a3
{
  v4 = (void (**)(id, void *))a3;
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446978;
    v14 = "-[RPSystemBroadcastSession stopSystemBroadcastWithHandler:]";
    __int16 v15 = 1024;
    int v16 = 103;
    __int16 v17 = 2048;
    v18 = self;
    __int16 v19 = 1024;
    unsigned int v20 = [(RPSession *)self sessionState];
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p stopping in session state %d", buf, 0x22u);
  }
  if ([(RPSession *)self cameraEnabled])
  {
    v5 = +[RPAngelProxy sharedInstance];
    [v5 disableCameraPip];
  }
  if ([(RPSession *)self sessionState] == 3
    || ![(RPSession *)self sessionState]
    || [(RPSession *)self sessionState] == 2)
  {
    v6 = +[NSError _rpUserErrorForCode:-5829 userInfo:0];
    [(RPSession *)self reportSessionEndReason:v6];
    if (v4) {
      v4[2](v4, v6);
    }
  }
  else
  {
    [(RPSession *)self setSessionState:2];
    v7 = _NSConcreteStackBlock;
    uint64_t v8 = 3221225472;
    v9 = sub_10002D9E8;
    objc_super v10 = &unk_100084EB8;
    v11 = self;
    BOOL v12 = v4;
    [(RPSystemBroadcastSession *)self notifyExtensionOfAction:4 completion:&v7];
    [(RPSession *)self clearSystemRecordingUI];
    [(RPSession *)self checkAndPlaySystemSessionSound:0];
  }
}

- (void)pauseSession
{
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446978;
    v7 = "-[RPSystemBroadcastSession pauseSession]";
    __int16 v8 = 1024;
    int v9 = 147;
    __int16 v10 = 2048;
    v11 = self;
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
    v5[2] = sub_10002DC24;
    v5[3] = &unk_100084E28;
    v5[4] = self;
    [(RPSystemBroadcastSession *)self notifyExtensionOfAction:2 completion:v5];
    v4.receiver = self;
    v4.super_class = (Class)RPSystemBroadcastSession;
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
    unsigned int v13 = "-[RPSystemBroadcastSession resumeSessionWithWindowLayerContextID:completionHandler:]";
    __int16 v14 = 1024;
    int v15 = 162;
    __int16 v16 = 2048;
    __int16 v17 = self;
    __int16 v18 = 1024;
    unsigned int v19 = [(RPSession *)self sessionState];
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p resuming in session state %d", buf, 0x22u);
  }
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10002DDDC;
  v10[3] = &unk_100084E90;
  id v11 = v7;
  v9.receiver = self;
  v9.super_class = (Class)RPSystemBroadcastSession;
  id v8 = v7;
  [(RPSession *)&v9 resumeSessionWithWindowLayerContextID:v6 completionHandler:v10];
  [(RPSystemBroadcastSession *)self notifyExtensionOfAction:3 completion:&stru_100085BF8];
}

- (void)disableBroadcast
{
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136446466;
    id v7 = "-[RPSystemBroadcastSession disableBroadcast]";
    __int16 v8 = 1024;
    int v9 = 172;
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
  return self->_broadcastExtension && self->_broadcastUserInfo && self->_broadcastConfiguration != 0;
}

- (void)setCaptureMicrophoneEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  -[RPSession setMicrophoneEnabled:](self, "setMicrophoneEnabled:");
  if ([(RPSession *)self sessionState] == 1 && v3)
  {
    id v5 = +[RPCaptureManager sharedInstance];
    [v5 enableMicrophone];
  }
}

- (BOOL)showAlertForBroadcastSessionWithError:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4 && ([v4 domain], int v6 = objc_claimAutoreleasedReturnValue(), v6, v6))
  {
    id v7 = [v5 localizedFailureReason];

    if (v7) {
      [v5 localizedFailureReason];
    }
    else {
    int v9 = [v5 localizedDescription];
    }
    __int16 v10 = +[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:@"BROADCAST_FAILED_ALERT_MESSAGE_FORMAT"];
    id v11 = [(NSExtension *)self->_broadcastExtension infoDictionary];
    __int16 v12 = [v11 objectForKey:_kCFBundleDisplayNameKey];
    unsigned int v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v10, v12, v9);

    __int16 v14 = +[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:@"BROADCAST_STATUSBAR_TAPPED_ALERT_TITLE"];
    id v15 = v13;
    __int16 v16 = +[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:@"BROADCAST_FAILED_ALERT_OK_BUTTON"];
    __int16 v17 = +[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:@"BROADCAST_FAILED_ALERT_GO_TO_APP_BUTTON"];
    v52[0] = kCFUserNotificationAlertHeaderKey;
    v52[1] = kCFUserNotificationAlertMessageKey;
    v53[0] = v14;
    v53[1] = v15;
    v52[2] = kCFUserNotificationOtherButtonTitleKey;
    v52[3] = kCFUserNotificationDefaultButtonTitleKey;
    v53[2] = v16;
    v53[3] = v17;
    __int16 v18 = CFUserNotificationCreate(kCFAllocatorDefault, 0.0, 0, 0, (CFDictionaryRef)+[NSDictionary dictionaryWithObjects:v53 forKeys:v52 count:4]);
    if (v18)
    {
      unsigned int v19 = v18;
      *(void *)buf = 0;
      CFUserNotificationReceiveResponse(v18, 0.0, (CFOptionFlags *)buf);
      if (*(void *)buf == 2)
      {
        BOOL v41 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
        if (v41) {
          sub_100052A54(v41, v42, v43, v44, v45, v46, v47, v48);
        }
      }
      else if (!*(void *)buf)
      {
        v50 = v9;
        unsigned int v20 = [(NSExtension *)self->_broadcastExtension identifier];
        v21 = +[LSPlugInKitProxy pluginKitProxyForIdentifier:v20];

        __int16 v22 = [v21 containingBundle];
        int v23 = [v22 bundleIdentifier];

        __int16 v24 = +[LSApplicationWorkspace defaultWorkspace];
        [v24 openApplicationWithBundleID:v23];

        BOOL v25 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
        if (v25) {
          sub_1000529D8(v25, v26, v27, v28, v29, v30, v31, v32);
        }

        int v9 = v50;
      }
      CFRelease(v19);
    }
    else
    {
      BOOL v33 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v33) {
        sub_10005295C(v33, v34, v35, v36, v37, v38, v39, v40);
      }
    }

    BOOL v8 = 0;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Not showing the alert, as there is no error or the error domain is nil", buf, 2u);
    }
    BOOL v8 = 1;
  }

  return v8;
}

- (void)updateBroadcastURL:(id)a3
{
}

- (void)processAcknowledgementSetupBroadcastWithMicrophoneEnabled:(BOOL)a3 cameraEnabled:(BOOL)a4 listenerEndpoint:(id)a5 withHandler:(id)a6
{
  BOOL v7 = a4;
  BOOL v8 = a3;
  id v10 = a5;
  id v11 = (void (**)(id, void *))a6;
  if ([(RPSession *)self getAcknowledgementAlertResultsWithMicrophone:v8 cameraEnabled:v7])
  {
    if ([(RPSystemBroadcastSession *)self isBroadcastSetup])
    {
      [(RPSystemBroadcastSession *)self enableBroadcastStartCaptureWithListenerEndpoint:v10 withHandler:v11];
    }
    else
    {
      if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 136446466;
        id v15 = "-[RPSystemBroadcastSession processAcknowledgementSetupBroadcastWithMicrophoneEnabled:cameraEnabled:listene"
              "rEndpoint:withHandler:]";
        __int16 v16 = 1024;
        int v17 = 279;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d attempted to start broadcast without a session, bailing out", (uint8_t *)&v14, 0x12u);
      }
      [(RPSession *)self setSessionState:3];
      unsigned int v13 = +[NSError _rpUserErrorForCode:-5808 userInfo:0];
      [(RPSession *)self reportSessionEndReason:v13];
      if (v11) {
        v11[2](v11, v13);
      }
    }
  }
  else
  {
    [(RPSystemBroadcastSession *)self disableBroadcast];
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
    unsigned int v13 = "-[RPSystemBroadcastSession enableBroadcastStartCaptureWithListenerEndpoint:withHandler:]";
    __int16 v14 = 1024;
    int v15 = 299;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d found broadcast info, enabling for session", buf, 0x12u);
  }
  BOOL v8 = [(RPSystemBroadcastSession *)self enableBroadcastWithListenerEndpoint:v6];
  if (v8)
  {
    if (dword_100099BB8 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100052AD0();
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
      unsigned int v13 = "-[RPSystemBroadcastSession enableBroadcastStartCaptureWithListenerEndpoint:withHandler:]";
      __int16 v14 = 1024;
      int v15 = 312;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d broadcast started without error", buf, 0x12u);
    }
    if ([(RPSession *)self cameraEnabled])
    {
      int v9 = +[RPAngelProxy sharedInstance];
      [v9 enableCameraPip];
    }
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10002E840;
    v10[3] = &unk_100084EB8;
    void v10[4] = self;
    id v11 = v7;
    [(RPSystemBroadcastSession *)self notifyExtensionOfAction:1 completion:v10];
  }
}

- (void)startCaptureWithHandler:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(RPBroadcastExtensionProxy *)self->_broadcastUploadExtensionProxy enableMixedRealityCamera];
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    __int16 v18 = "-[RPSystemBroadcastSession startCaptureWithHandler:]";
    __int16 v19 = 1024;
    int v20 = 335;
    __int16 v21 = 1024;
    BOOL v22 = v5;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d enableMixedRealityCamera=%d", buf, 0x18u);
  }
  id v6 = +[RPCaptureManager sharedInstance];
  BOOL v7 = [(RPSession *)self microphoneEnabled];
  [(RPSession *)self windowSize];
  double v9 = v8;
  double v11 = v10;
  __int16 v12 = [(RPSession *)self contextID];
  unsigned int v13 = +[NSArray arrayWithObject:v12];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10002EA4C;
  v15[3] = &unk_1000853B8;
  v15[4] = self;
  id v16 = v4;
  id v14 = v4;
  [v6 startCaptureForDelegate:self forProcessID:0xFFFFFFFFLL shouldStartMicrophoneCapture:v7 windowSize:1 systemRecording:v13 contextIDs:v5 mixedRealityCamera:v9 didStartHandler:v11];
}

- (id)enableBroadcastWithListenerEndpoint:(id)a3
{
  id v4 = a3;
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    int v23 = "-[RPSystemBroadcastSession enableBroadcastWithListenerEndpoint:]";
    __int16 v24 = 1024;
    int v25 = 369;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d enableBroadcastWithExtension", buf, 0x12u);
  }
  objc_initWeak(&location, self);
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    int v23 = "-[RPSystemBroadcastSession enableBroadcastWithListenerEndpoint:]";
    __int16 v24 = 1024;
    int v25 = 376;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d setting up extension proxy", buf, 0x12u);
  }
  if (v4)
  {
    BOOL v5 = [[RPBroadcastExtensionProxy alloc] initWithBroadcastUploadListenerEndpoint:v4];
    broadcastUploadExtensionProxy = self->_broadcastUploadExtensionProxy;
    self->_broadcastUploadExtensionProxy = v5;
  }
  else
  {
    BOOL v7 = [[RPBroadcastExtensionProxy alloc] initWithBroadcastUploadExtension:self->_broadcastExtension];
    double v8 = self->_broadcastUploadExtensionProxy;
    self->_broadcastUploadExtensionProxy = v7;

    dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
    double v10 = self->_broadcastUploadExtensionProxy;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10002EFD4;
    v18[3] = &unk_100085018;
    broadcastUploadExtensionProxy = v9;
    __int16 v19 = broadcastUploadExtensionProxy;
    int v20 = self;
    [(RPBroadcastExtensionProxy *)v10 establishConnectionWithHandler:v18];
    dispatch_semaphore_wait(&broadcastUploadExtensionProxy->super, 0xFFFFFFFFFFFFFFFFLL);
  }
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10002F0C4;
  v16[3] = &unk_100085628;
  objc_copyWeak(&v17, &location);
  [(RPBroadcastExtensionProxy *)self->_broadcastUploadExtensionProxy setServiceInfoHandler:v16];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10002F120;
  v14[3] = &unk_100085C20;
  objc_copyWeak(&v15, &location);
  [(RPBroadcastExtensionProxy *)self->_broadcastUploadExtensionProxy setBroadcastURLHandler:v14];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10002F17C;
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
    double v8 = "-[RPSystemBroadcastSession handleBroadcastError:]";
    __int16 v9 = 1024;
    int v10 = 423;
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d error %@", buf, 0x1Cu);
  }
  if ([(RPSession *)self sessionState] == 1 || [(RPSession *)self sessionState] == 4)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_10002F368;
    v5[3] = &unk_100085018;
    v5[4] = self;
    id v6 = v4;
    [(RPSystemBroadcastSession *)self stopSystemBroadcastWithHandler:v5];
  }
}

- (void)setupSystemBroadcastWithHostBundleID:(id)a3 broadcastExtensionBundleID:(id)a4 broadcastConfigurationData:(id)a5 userInfo:(id)a6 handler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    uint64_t v27 = "-[RPSystemBroadcastSession setupSystemBroadcastWithHostBundleID:broadcastExtensionBundleID:broadcastConfigurat"
          "ionData:userInfo:handler:]";
    __int16 v28 = 1024;
    int v29 = 434;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  id v17 = +[NSBundle baseIdentifier:v13];
  [(RPSystemBroadcastSession *)self setBroadcastHostBundleId:v17];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10002F59C;
  v21[3] = &unk_100085C48;
  id v22 = v14;
  int v23 = self;
  id v24 = v15;
  id v25 = v16;
  id v18 = v16;
  id v19 = v15;
  id v20 = v14;
  [(RPSystemBroadcastSession *)self loadBroadcastUploadExtensionWithBaseIdentifier:v17 broadcastExtensionBundleID:v13 withHandler:v21];
}

- (void)loadBroadcastUploadExtensionWithBaseIdentifier:(id)a3 broadcastExtensionBundleID:(id)a4 withHandler:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    id v18 = "-[RPSystemBroadcastSession loadBroadcastUploadExtensionWithBaseIdentifier:broadcastExtensionBundleID:withHandler:]";
    __int16 v19 = 1024;
    int v20 = 465;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d looking for upload extension", buf, 0x12u);
  }
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10002F888;
  v13[3] = &unk_100085C98;
  id v15 = v7;
  id v16 = v9;
  id v14 = v8;
  id v10 = v7;
  id v11 = v9;
  id v12 = v8;
  +[NSExtension extensionsWithMatchingPointName:@"com.apple.broadcast-services-upload" baseIdentifier:v10 completion:v13];
}

- (id)dispatchCaptureQueue
{
  if (qword_100099CB8 != -1) {
    dispatch_once(&qword_100099CB8, &stru_100085CB8);
  }
  v2 = (void *)qword_100099CB0;

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
    id v9 = self;
    id v10 = a4;
    uint64_t v11 = 3;
  }
  else
  {
    if (v7 != 1)
    {
      if (!v7)
      {
        [(RPSystemBroadcastSession *)self processSampleBuffer:a4 transformFlags:a5];
      }
      return;
    }
    id v9 = self;
    id v10 = a4;
    uint64_t v11 = 2;
  }

  [(RPSystemBroadcastSession *)v9 notifyExtensionOfAudioSampleBuffer:v10 withType:v11];
}

- (void)captureDidFailWithError:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10002FF88;
  v5[3] = &unk_100085018;
  id v6 = a3;
  uint64_t v7 = self;
  id v4 = v6;
  [(RPSystemBroadcastSession *)self stopSystemBroadcastWithHandler:v5];
}

- (void)processSampleBufferForStreaming:(opaqueCMSampleBuffer *)a3 transformFlags:(unint64_t)a4
{
}

- (void)processSampleBuffer:(opaqueCMSampleBuffer *)a3 transformFlags:(unint64_t)a4
{
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136446466;
    id v8 = "-[RPSystemBroadcastSession processSampleBuffer:transformFlags:]";
    __int16 v9 = 1024;
    int v10 = 581;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d processing sample buffer for streaming", (uint8_t *)&v7, 0x12u);
  }
  if ([(RPSession *)self sessionState] == 4)
  {
    if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136446466;
      id v8 = "-[RPSystemBroadcastSession processSampleBuffer:transformFlags:]";
      __int16 v9 = 1024;
      int v10 = 584;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d session is paused discard sample", (uint8_t *)&v7, 0x12u);
    }
  }
  else
  {
    [(RPSystemBroadcastSession *)self notifyExtensionOfVideoSampleBuffer:a3 withType:1 sampleOrientation:[(RPSystemBroadcastSession *)self orientationFromFigTransform:a4]];
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
        id v8 = [(RPSystemBroadcastSession *)self systemBroadcastSessionAudioQueue];
        v10[0] = _NSConcreteStackBlock;
        v10[1] = 3221225472;
        v10[2] = sub_100030308;
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
      sub_100052E14();
    }
  }
  else if (dword_100099BB8 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100052D90();
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
    *(CMTimeValue *)((char *)&timingInfoOut.duration.value + 4) = (CMTimeValue)"-[RPSystemBroadcastSession notifyExtensio"
                                                                               "nOfVideoSampleBuffer:withType:sampleOrientation:]";
    LOWORD(timingInfoOut.duration.flags) = 1024;
    *(CMTimeFlags *)((char *)&timingInfoOut.duration.flags + 2) = 632;
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
    *(CMTimeValue *)((char *)&timingInfoOut.duration.value + 4) = (CMTimeValue)"-[RPSystemBroadcastSession notifyExtensio"
                                                                               "nOfVideoSampleBuffer:withType:sampleOrientation:]";
    LOWORD(timingInfoOut.duration.flags) = 1024;
    *(CMTimeFlags *)((char *)&timingInfoOut.duration.flags + 2) = 637;
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
    id v14 = objc_alloc_init(RPIOSurfaceObject);
    [(RPIOSurfaceObject *)v14 setIOSurface:IOSurface];
    [v9 setObject:v14 forKeyedSubscript:@"RPBroadcastProcessExtensionPayloadKeyIOSurface"];
    memset(&timingInfoOut, 0, sizeof(timingInfoOut));
    CMSampleBufferGetSampleTimingInfo(a3, 0, &timingInfoOut);
    id v15 = +[NSData dataWithBytes:&timingInfoOut length:72];
    [v9 setObject:v15 forKeyedSubscript:@"RPBroadcastProcessExtensionPayloadKeyTimingInfo"];
    id v16 = [(RPSystemBroadcastSession *)self systemBroadcastSessionVideoQueue];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1000307B4;
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
    id v20 = "-[RPSystemBroadcastSession notifyExtensionOfAction:completion:]";
    __int16 v21 = 1024;
    int v22 = 683;
    id v13 = " [INFO] %{public}s:%d no broadcast extension found!";
    goto LABEL_15;
  }
  if (!self->_broadcastUploadExtensionProxy)
  {
    if (dword_100099BB8 > 1 || !os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_16;
    }
    *(_DWORD *)buf = 136446466;
    id v20 = "-[RPSystemBroadcastSession notifyExtensionOfAction:completion:]";
    __int16 v21 = 1024;
    int v22 = 689;
    id v13 = " [INFO] %{public}s:%d broadcast extension not ready";
LABEL_15:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v13, buf, 0x12u);
LABEL_16:
    v6[2](v6);
    goto LABEL_19;
  }
  int v7 = +[NSMutableDictionary dictionary];
  id v8 = +[NSNumber numberWithInteger:a3];
  [v7 setObject:v8 forKeyedSubscript:@"RPBroadcastProcessExtensionPayloadKeyActionType"];

  [v7 setObject:self->_broadcastUserInfo forKeyedSubscript:@"RPBroadcastExtensionKeyExtensionUserInfo"];
  if (a3 == 4)
  {
    dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
    broadcastUploadExtensionProxy = self->_broadcastUploadExtensionProxy;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100030C6C;
    v15[3] = &unk_100084E28;
    id v11 = v9;
    id v16 = v11;
    [(RPBroadcastExtensionProxy *)broadcastUploadExtensionProxy processPayload:v7 completion:v15];
    dispatch_time_t v12 = dispatch_time(0, 5000000000);
    if (dispatch_semaphore_wait(v11, v12)
      && dword_100099BB8 <= 2
      && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_100052E98();
    }
    v6[2](v6);
  }
  else
  {
    id v14 = self->_broadcastUploadExtensionProxy;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100030C5C;
    v17[3] = &unk_100085A28;
    id v18 = v6;
    [(RPBroadcastExtensionProxy *)v14 processPayload:v7 completion:v17];
    id v11 = v18;
  }

LABEL_19:
}

- (id)systemBroadcastSessionAudioQueue
{
  if (qword_100099CC8 != -1) {
    dispatch_once(&qword_100099CC8, &stru_100085D28);
  }
  v2 = (void *)qword_100099CC0;

  return v2;
}

- (id)systemBroadcastSessionVideoQueue
{
  if (qword_100099CD8 != -1) {
    dispatch_once(&qword_100099CD8, &stru_100085D48);
  }
  v2 = (void *)qword_100099CD0;

  return v2;
}

- (unsigned)orientationFromFigTransform:(unint64_t)a3
{
  if (a3 - 1 > 6) {
    return 1;
  }
  else {
    return dword_100061DB8[a3 - 1];
  }
}

- (void)handleTimerDidUpdate:(id)a3
{
  id v4 = a3;
  if ([(RPSession *)self sessionState] == 1 || [(RPSession *)self sessionState] == 4) {
    [(RPClientProtocol *)self->super._clientProxy recordingTimerDidUpdate:v4];
  }
}

- (void)handleSystemAlertStop
{
  if ([(RPSession *)self sessionState] == 1 || [(RPSession *)self sessionState] == 4)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_100030F24;
    v3[3] = &unk_1000856C0;
    v3[4] = self;
    [(RPSystemBroadcastSession *)self stopSystemBroadcastWithHandler:v3];
  }
}

- (void)handleDeviceLockedWarning
{
  if ([(RPSession *)self sessionState] == 1 || [(RPSession *)self sessionState] == 4)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_100031090;
    v3[3] = &unk_1000856C0;
    v3[4] = self;
    [(RPSystemBroadcastSession *)self stopSystemBroadcastWithHandler:v3];
  }
}

- (void)handleDeviceRestrictionWarning
{
  if ([(RPSession *)self sessionState] == 1 || [(RPSession *)self sessionState] == 4)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_1000311FC;
    v3[3] = &unk_1000856C0;
    v3[4] = self;
    [(RPSystemBroadcastSession *)self stopSystemBroadcastWithHandler:v3];
  }
}

- (void)handleResumeCaptureWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446978;
    id v18 = "-[RPSystemBroadcastSession handleResumeCaptureWithCompletionHandler:]";
    __int16 v19 = 1024;
    int v20 = 821;
    __int16 v21 = 2048;
    int v22 = self;
    __int16 v23 = 1024;
    unsigned int v24 = [(RPSession *)self sessionState];
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p resuming in session state %d", buf, 0x22u);
  }
  self->super._sessionIsResuming = 1;
  BOOL v5 = +[RPCaptureManager sharedInstance];
  BOOL v6 = [(RPSession *)self microphoneEnabled];
  [(RPSession *)self windowSize];
  double v8 = v7;
  double v10 = v9;
  id v11 = [(RPSession *)self contextID];
  dispatch_time_t v12 = +[NSArray arrayWithObject:v11];
  BOOL v13 = [(RPBroadcastExtensionProxy *)self->_broadcastUploadExtensionProxy enableMixedRealityCamera];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000314F8;
  v15[3] = &unk_1000853B8;
  void v15[4] = self;
  id v16 = v4;
  id v14 = v4;
  [v5 startCaptureForDelegate:self forProcessID:0xFFFFFFFFLL shouldStartMicrophoneCapture:v6 windowSize:1 systemRecording:v12 contextIDs:v13 mixedRealityCamera:v8 didStartHandler:v10];
}

- (void)handleResumeContextIDFailure
{
  if ([(RPSession *)self sessionState] == 1 || [(RPSession *)self sessionState] == 4)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_1000316A0;
    v3[3] = &unk_1000856C0;
    v3[4] = self;
    [(RPSystemBroadcastSession *)self stopSystemBroadcastWithHandler:v3];
  }
}

- (void)handleFrontmostApplicationDidChange:(id)a3
{
  id v4 = a3;
  if (self->_broadcastExtension)
  {
    if (self->_broadcastUploadExtensionProxy)
    {
      BOOL v5 = +[NSMutableDictionary dictionary];
      [v5 setObject:v4 forKeyedSubscript:@"RPBroadcastProcessExtensionPayloadKeyFrontmostAppBundleID"];
      [(RPBroadcastExtensionProxy *)self->_broadcastUploadExtensionProxy processPayload:v5 completion:&stru_100085D68];
    }
    else if (dword_100099BB8 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_100052FCC();
    }
  }
  else if (dword_100099BB8 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100052F48();
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