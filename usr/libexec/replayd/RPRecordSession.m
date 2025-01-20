@interface RPRecordSession
- (id)dispatchCaptureQueue;
- (id)outputPath;
- (void)captureDidFailWithError:(id)a3;
- (void)didCaptureSampleWithType:(int)a3 withSampleBuffer:(opaqueCMSampleBuffer *)a4 withTransformFlags:(unint64_t)a5;
- (void)discardInAppRecordingWithHandler:(id)a3;
- (void)handleClientApplicationDidEnterBackground;
- (void)handleClientApplicationDidEnterForeground;
- (void)handleDeviceLockedWarning;
- (void)handleDeviceRestrictionWarning;
- (void)handleDisplayWarning;
- (void)handleResumeCaptureWithCompletionHandler:(id)a3;
- (void)handleResumeContextIDFailure;
- (void)pauseSession;
- (void)presentAcknowledgmentWithMicrophoneEnabled:(BOOL)a3 cameraEnabled:(BOOL)a4 withHandler:(id)a5;
- (void)startRecordingWithMicrophoneEnabled:(BOOL)a3 cameraEnabled:(BOOL)a4 contextID:(id)a5 windowSize:(CGSize)a6 handler:(id)a7;
- (void)stopRecordingWithHandler:(id)a3;
@end

@implementation RPRecordSession

- (id)outputPath
{
  v3 = +[NSFileManager defaultManager];
  v4 = [(RPSession *)self bundleID];
  v5 = [v3 outputPath:0 bundleID:v4];

  return v5;
}

- (void)startRecordingWithMicrophoneEnabled:(BOOL)a3 cameraEnabled:(BOOL)a4 contextID:(id)a5 windowSize:(CGSize)a6 handler:(id)a7
{
  double height = a6.height;
  double width = a6.width;
  BOOL v10 = a4;
  BOOL v11 = a3;
  id v13 = a5;
  v14 = (void (**)(id, void *))a7;
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446978;
    v18 = "-[RPRecordSession startRecordingWithMicrophoneEnabled:cameraEnabled:contextID:windowSize:handler:]";
    __int16 v19 = 1024;
    int v20 = 45;
    __int16 v21 = 2048;
    v22 = self;
    __int16 v23 = 1024;
    unsigned int v24 = [(RPSession *)self sessionState];
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p starting in session state %d", buf, 0x22u);
  }
  if ([(RPSession *)self sessionState] != 3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RPRecordSession: attempting to start record session when session was not in stopped state", buf, 2u);
    }
    v15 = +[NSError _rpUserErrorForCode:-5830 userInfo:0];
    [(RPSession *)self reportSessionEndReason:v15];
    if (!v14) {
      goto LABEL_16;
    }
LABEL_14:
    v14[2](v14, v15);
    goto LABEL_16;
  }
  v16.receiver = self;
  v16.super_class = (Class)RPRecordSession;
  -[RPSession startWithContextID:windowSize:](&v16, "startWithContextID:windowSize:", v13, width, height);
  v15 = -[RPSession checkCaptureRequirementsWithMicrophoneEnabled:cameraEnabled:windowSize:](self, "checkCaptureRequirementsWithMicrophoneEnabled:cameraEnabled:windowSize:", v11, v10, width, height);
  if (!v15)
  {
    [(RPRecordSession *)self presentAcknowledgmentWithMicrophoneEnabled:v11 cameraEnabled:v10 withHandler:v14];
    goto LABEL_16;
  }
  if (dword_100099BB8 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100055E84((uint64_t)v15);
  }
  [(RPSession *)self setSessionState:3];
  if (v14) {
    goto LABEL_14;
  }
LABEL_16:
}

- (void)stopRecordingWithHandler:(id)a3
{
  v4 = (void (**)(id, void, void *))a3;
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446978;
    BOOL v11 = "-[RPRecordSession stopRecordingWithHandler:]";
    __int16 v12 = 1024;
    int v13 = 85;
    __int16 v14 = 2048;
    v15 = self;
    __int16 v16 = 1024;
    unsigned int v17 = [(RPSession *)self sessionState];
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p stopping in session state %d", buf, 0x22u);
  }
  if ([(RPSession *)self sessionState] == 3
    || ![(RPSession *)self sessionState]
    || [(RPSession *)self sessionState] == 2)
  {
    v5 = +[NSError _rpUserErrorForCode:-5829 userInfo:0];
    [(RPSession *)self reportSessionEndReason:v5];
    if (v4) {
      v4[2](v4, 0, v5);
    }
  }
  else
  {
    [(RPSession *)self setSessionState:2];
    v6 = +[RPCaptureManager sharedInstance];
    [v6 stopCaptureForDelegate:self];

    movieWriter = self->_movieWriter;
    if (movieWriter)
    {
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_10004D3D4;
      v8[3] = &unk_1000853E0;
      v8[4] = self;
      v9 = v4;
      [(RPMovieWriter *)movieWriter finishWritingWithHandler:v8];
    }
    else
    {
      [(RPSession *)self setSessionState:3];
      [(RPSession *)self reportSummaryEvent:-5824 recordedFileSize:0];
      if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        BOOL v11 = "-[RPRecordSession stopRecordingWithHandler:]";
        __int16 v12 = 1024;
        int v13 = 122;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d no movie writer instance when attempting to stop", buf, 0x12u);
      }
      if (v4) {
        v4[2](v4, 0, 0);
      }
    }
  }
}

- (void)pauseSession
{
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446978;
    v6 = "-[RPRecordSession pauseSession]";
    __int16 v7 = 1024;
    int v8 = 131;
    __int16 v9 = 2048;
    BOOL v10 = self;
    __int16 v11 = 1024;
    unsigned int v12 = [(RPSession *)self sessionState];
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p pausing in session state %d", buf, 0x22u);
  }
  if ([(RPSession *)self sessionState] == 1)
  {
    v3 = +[RPCaptureManager sharedInstance];
    [v3 stopCaptureForDelegate:self];

    [(RPMovieWriter *)self->_movieWriter notifyRecordingMayBeStopped];
    [(RPClientProtocol *)self->super._clientProxy recordingDidPause];
    v4.receiver = self;
    v4.super_class = (Class)RPRecordSession;
    [(RPSession *)&v4 pauseSession];
  }
}

- (void)discardInAppRecordingWithHandler:(id)a3
{
  id v4 = a3;
  if ([(RPSession *)self sessionState] == 3 && self->_currentRecordingURL)
  {
    v5 = +[NSFileManager defaultManager];
    currentRecordingURL = self->_currentRecordingURL;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10004D7B8;
    v7[3] = &unk_1000853B8;
    v7[4] = self;
    id v8 = v4;
    [v5 _srRemoveFile:currentRecordingURL completion:v7];
  }
}

- (id)dispatchCaptureQueue
{
  if (qword_100099DD8 != -1) {
    dispatch_once(&qword_100099DD8, &stru_100086300);
  }
  v2 = (void *)qword_100099DD0;

  return v2;
}

- (void)presentAcknowledgmentWithMicrophoneEnabled:(BOOL)a3 cameraEnabled:(BOOL)a4 withHandler:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  id v8 = a5;
  if ([(RPSession *)self getAcknowledgementAlertResultsWithMicrophone:v6 cameraEnabled:v5])
  {
    __int16 v9 = [RPMovieWriter alloc];
    [(RPSession *)self windowSize];
    double v11 = v10;
    double v13 = v12;
    __int16 v14 = [(RPRecordSession *)self outputPath];
    v15 = -[RPMovieWriter initWithWindowSize:outputPath:](v9, "initWithWindowSize:outputPath:", v14, v11, v13);
    movieWriter = self->_movieWriter;
    self->_movieWriter = v15;

    unsigned int v17 = self->_movieWriter;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10004DA44;
    v19[3] = &unk_1000853B8;
    v19[4] = self;
    id v20 = v8;
    [(RPMovieWriter *)v17 startWritingHandler:v19];
  }
  else
  {
    [(RPSession *)self setSessionState:3];
    if (v8)
    {
      v18 = +[NSError _rpUserErrorForCode:-5801 userInfo:0];
      (*((void (**)(id, void *))v8 + 2))(v8, v18);
    }
  }
}

- (void)didCaptureSampleWithType:(int)a3 withSampleBuffer:(opaqueCMSampleBuffer *)a4 withTransformFlags:(unint64_t)a5
{
  uint64_t v7 = *(void *)&a3;
  if ([(RPSession *)self sessionState] == 1)
  {
    [(RPSession *)self updateReportingSampleCount:v7];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10004DE30;
    v9[3] = &unk_100086018;
    int v10 = v7;
    v9[4] = self;
    v9[5] = a5;
    [(RPSession *)self updatePauseOffsetForSampleBuffer:a4 withSampleType:v7 handler:v9];
  }
}

- (void)captureDidFailWithError:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10004DFD4;
  v5[3] = &unk_100086328;
  id v6 = a3;
  uint64_t v7 = self;
  id v4 = v6;
  [(RPRecordSession *)self stopRecordingWithHandler:v5];
}

- (void)handleResumeCaptureWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446978;
    v18 = "-[RPRecordSession handleResumeCaptureWithCompletionHandler:]";
    __int16 v19 = 1024;
    int v20 = 277;
    __int16 v21 = 2048;
    v22 = self;
    __int16 v23 = 1024;
    unsigned int v24 = [(RPSession *)self sessionState];
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p resuming in session state %d", buf, 0x22u);
  }
  self->super._sessionIsResuming = 1;
  [(RPMovieWriter *)self->_movieWriter notifyRecordingResumed];
  BOOL v5 = +[RPCaptureManager sharedInstance];
  uint64_t callingPID = self->super._callingPID;
  BOOL v7 = [(RPSession *)self microphoneEnabled];
  [(RPSession *)self windowSize];
  double v9 = v8;
  double v11 = v10;
  double v12 = [(RPSession *)self contextID];
  double v13 = +[NSArray arrayWithObject:v12];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10004E29C;
  v15[3] = &unk_1000853B8;
  v15[4] = self;
  id v16 = v4;
  id v14 = v4;
  [v5 startCaptureForDelegate:self forProcessID:callingPID shouldStartMicrophoneCapture:v7 windowSize:v13 systemRecording:v15 contextIDs:v9 didStartHandler:v11];
}

- (void)handleClientApplicationDidEnterBackground
{
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136446722;
    id v4 = "-[RPRecordSession handleClientApplicationDidEnterBackground]";
    __int16 v5 = 1024;
    int v6 = 300;
    __int16 v7 = 1024;
    unsigned int v8 = [(RPSession *)self sessionState];
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d session state %d", (uint8_t *)&v3, 0x18u);
  }
  [(RPRecordSession *)self pauseSession];
}

- (void)handleClientApplicationDidEnterForeground
{
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136446722;
    id v4 = "-[RPRecordSession handleClientApplicationDidEnterForeground]";
    __int16 v5 = 1024;
    int v6 = 307;
    __int16 v7 = 1024;
    unsigned int v8 = [(RPSession *)self sessionState];
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d session state %d", (uint8_t *)&v3, 0x18u);
  }
  if ([(RPSession *)self sessionState] == 4) {
    [(RPClientProtocol *)self->super._clientProxy shouldResumeSessionType:@"RPInAppRecording"];
  }
}

- (void)handleDisplayWarning
{
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    __int16 v5 = "-[RPRecordSession handleDisplayWarning]";
    __int16 v6 = 1024;
    int v7 = 317;
    __int16 v8 = 1024;
    unsigned int v9 = [(RPSession *)self sessionState];
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d session state %d", buf, 0x18u);
  }
  if ([(RPSession *)self sessionState] == 1 || [(RPSession *)self sessionState] == 4)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_10004E6E8;
    v3[3] = &unk_100086350;
    v3[4] = self;
    [(RPRecordSession *)self stopRecordingWithHandler:v3];
  }
}

- (void)handleDeviceLockedWarning
{
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136446722;
    id v4 = "-[RPRecordSession handleDeviceLockedWarning]";
    __int16 v5 = 1024;
    int v6 = 328;
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
    __int16 v5 = "-[RPRecordSession handleDeviceRestrictionWarning]";
    __int16 v6 = 1024;
    int v7 = 346;
    __int16 v8 = 1024;
    unsigned int v9 = [(RPSession *)self sessionState];
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d session state %d", buf, 0x18u);
  }
  if ([(RPSession *)self sessionState] == 1 || [(RPSession *)self sessionState] == 4)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_10004E9E8;
    v3[3] = &unk_100086350;
    v3[4] = self;
    [(RPRecordSession *)self stopRecordingWithHandler:v3];
  }
}

- (void)handleResumeContextIDFailure
{
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    __int16 v5 = "-[RPRecordSession handleResumeContextIDFailure]";
    __int16 v6 = 1024;
    int v7 = 358;
    __int16 v8 = 1024;
    unsigned int v9 = [(RPSession *)self sessionState];
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d session state %d", buf, 0x18u);
  }
  if ([(RPSession *)self sessionState] == 1 || [(RPSession *)self sessionState] == 4)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_10004EC0C;
    v3[3] = &unk_100086350;
    v3[4] = self;
    [(RPRecordSession *)self stopRecordingWithHandler:v3];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentRecordingURL, 0);

  objc_storeStrong((id *)&self->_movieWriter, 0);
}

@end