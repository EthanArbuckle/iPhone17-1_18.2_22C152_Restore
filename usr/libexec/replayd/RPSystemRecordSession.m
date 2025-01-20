@interface RPSystemRecordSession
- (CGSize)adjustedWindowSizeForSystemRecording;
- (id)dispatchCaptureQueue;
- (id)outputPath;
- (void)captureDidFailWithError:(id)a3;
- (void)didCaptureSampleWithType:(int)a3 withSampleBuffer:(opaqueCMSampleBuffer *)a4 withTransformFlags:(unint64_t)a5;
- (void)handleDeviceLockedWarning;
- (void)handleDeviceRestrictionWarning;
- (void)handleIncomingCallWarning;
- (void)handleMemoryWarning;
- (void)handleResumeCaptureWithCompletionHandler:(id)a3;
- (void)handleResumeContextIDFailure;
- (void)handleSystemAlertStop;
- (void)handleTimerDidUpdate:(id)a3;
- (void)pauseSession;
- (void)setCaptureMicrophoneEnabled:(BOOL)a3;
- (void)startSystemRecordingWithMicrophoneEnabled:(BOOL)a3 cameraEnabled:(BOOL)a4 contextID:(id)a5 windowSize:(CGSize)a6 handler:(id)a7;
- (void)stopSystemRecordingWithHandler:(id)a3;
- (void)stopSystemRecordingWithURLHandler:(id)a3;
@end

@implementation RPSystemRecordSession

- (id)outputPath
{
  v3 = +[NSFileManager defaultManager];
  v4 = [(RPSession *)self bundleID];
  v5 = [v3 outputPath:2 bundleID:v4];

  return v5;
}

- (void)startSystemRecordingWithMicrophoneEnabled:(BOOL)a3 cameraEnabled:(BOOL)a4 contextID:(id)a5 windowSize:(CGSize)a6 handler:(id)a7
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
    v40 = "-[RPSystemRecordSession startSystemRecordingWithMicrophoneEnabled:cameraEnabled:contextID:windowSize:handler:]";
    __int16 v41 = 1024;
    int v42 = 47;
    __int16 v43 = 2048;
    v44 = self;
    __int16 v45 = 1024;
    unsigned int v46 = [(RPSession *)self sessionState];
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p starting in session state %d", buf, 0x22u);
  }
  v15 = -[RPSession checkCaptureRequirementsWithMicrophoneEnabled:cameraEnabled:windowSize:](self, "checkCaptureRequirementsWithMicrophoneEnabled:cameraEnabled:windowSize:", v11, v10, width, height);
  if (v15)
  {
    if (dword_100099BB8 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100054CA4();
    }
    if ([v15 code] == (id)-5805)
    {
      v16 = +[NSError _rpUserErrorForCode:-5805 userInfo:0];
      [(RPSession *)self showAlertRecordingCaptureSessionWithError:v16];
    }
    [(RPSession *)self reportSessionEndReason:v15];
    if (v14) {
      v14[2](v14, v15);
    }
  }
  else
  {
    v38.receiver = self;
    v38.super_class = (Class)RPSystemRecordSession;
    -[RPSession startWithContextID:windowSize:](&v38, "startWithContextID:windowSize:", v13, width, height);
    if ([(RPSession *)self getAcknowledgementAlertResultsWithMicrophone:v11 cameraEnabled:v10])
    {
      v17 = +[RPFeatureFlagUtility sharedInstance];
      unsigned int v18 = [v17 systemBannerEnabled];

      if (v18)
      {
        v19 = +[RPAngelProxy sharedInstance];
        v37[0] = _NSConcreteStackBlock;
        v37[1] = 3221225472;
        v37[2] = sub_1000416F4;
        v37[3] = &unk_100085FF0;
        v37[4] = self;
        [v19 connectToAngelWithCompletionHandler:v37];
      }
      [(RPSystemRecordSession *)self adjustedWindowSizeForSystemRecording];
      double v21 = v20;
      double v23 = v22;
      v24 = +[RPFeatureFlagUtility sharedInstance];
      unsigned int v25 = [v24 replayKitScreenRecordingHEVC];
      v26 = (id *)&AVVideoCodecTypeHEVC;
      if (!v25) {
        v26 = (id *)&AVVideoCodecTypeH264;
      }
      id v27 = *v26;

      v28 = [RPMovieWriter alloc];
      v29 = [(RPSystemRecordSession *)self outputPath];
      v30 = -[RPMovieWriter initWithWindowSize:outputPath:videoCodecType:](v28, "initWithWindowSize:outputPath:videoCodecType:", v29, v27, v21, v23);
      movieWriter = self->_movieWriter;
      self->_movieWriter = v30;

      v32 = self->_movieWriter;
      v35[0] = _NSConcreteStackBlock;
      v35[1] = 3221225472;
      v35[2] = sub_100041858;
      v35[3] = &unk_1000853B8;
      v35[4] = self;
      v33 = v14;

      v36 = v33;
      [(RPMovieWriter *)v32 startWritingHandler:v35];
    }
    else
    {
      [(RPSession *)self setSessionState:3];
      if (v14)
      {
        v34 = +[NSError _rpUserErrorForCode:-5803 userInfo:0];
        v14[2](v14, v34);
      }
    }
  }
}

- (void)stopSystemRecordingWithHandler:(id)a3
{
  id v4 = a3;
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446978;
    v17 = "-[RPSystemRecordSession stopSystemRecordingWithHandler:]";
    __int16 v18 = 1024;
    int v19 = 154;
    __int16 v20 = 2048;
    double v21 = self;
    __int16 v22 = 1024;
    unsigned int v23 = [(RPSession *)self sessionState];
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p stopping in session state %d", buf, 0x22u);
  }
  v5 = +[RPCaptureManager sharedInstance];
  [v5 stopCaptureForDelegate:self];

  if ([(RPSession *)self cameraEnabled])
  {
    v6 = +[RPAngelProxy sharedInstance];
    [v6 disableCameraPip];
  }
  movieWriter = self->_movieWriter;
  if (movieWriter)
  {
    sessionID = self->_sessionID;
    BOOL mixAudioTracks = self->_mixAudioTracks;
    BOOL v10 = _NSConcreteStackBlock;
    uint64_t v11 = 3221225472;
    v12 = sub_100041E70;
    id v13 = &unk_1000853B8;
    v14 = self;
    id v15 = v4;
    [(RPMovieWriter *)movieWriter finishWritingAndSaveToCameraRollWithSessionID:sessionID mixAudioTracks:mixAudioTracks handler:&v10];
  }
  else
  {
    [(RPSession *)self setSessionState:3];
    [(RPSession *)self reportSummaryEvent:-5824 recordedFileSize:0];
    if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v17 = "-[RPSystemRecordSession stopSystemRecordingWithHandler:]";
      __int16 v18 = 1024;
      int v19 = 190;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d no movie writer instance when attempting to stop", buf, 0x12u);
    }
    if (v4) {
      (*((void (**)(id, void))v4 + 2))(v4, 0);
    }
  }
  [(RPSession *)self clearSystemRecordingUI];
  [(RPSession *)self checkAndPlaySystemSessionSound:0];
}

- (void)stopSystemRecordingWithURLHandler:(id)a3
{
  id v4 = a3;
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446978;
    v14 = "-[RPSystemRecordSession stopSystemRecordingWithURLHandler:]";
    __int16 v15 = 1024;
    int v16 = 206;
    __int16 v17 = 2048;
    __int16 v18 = self;
    __int16 v19 = 1024;
    unsigned int v20 = [(RPSession *)self sessionState];
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p stopping in session state %d", buf, 0x22u);
  }
  v5 = +[RPCaptureManager sharedInstance];
  [v5 stopCaptureForDelegate:self];

  movieWriter = self->_movieWriter;
  if (movieWriter)
  {
    v7 = _NSConcreteStackBlock;
    uint64_t v8 = 3221225472;
    v9 = sub_10004222C;
    BOOL v10 = &unk_1000853E0;
    uint64_t v11 = self;
    id v12 = v4;
    [(RPMovieWriter *)movieWriter finishWritingWithHandler:&v7];
  }
  else
  {
    if (dword_100099BB8 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100054E3C();
    }
    [(RPSession *)self setSessionState:3];
    [(RPSession *)self reportSummaryEvent:-5824 recordedFileSize:0];
    if (v4) {
      (*((void (**)(id, void, void))v4 + 2))(v4, 0, 0);
    }
  }
  [(RPSession *)self clearSystemRecordingUI];
  [(RPSession *)self checkAndPlaySystemSessionSound:0];
}

- (void)pauseSession
{
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446978;
    v6 = "-[RPSystemRecordSession pauseSession]";
    __int16 v7 = 1024;
    int v8 = 248;
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

    [(RPClientProtocol *)self->super._clientProxy recordingDidPause];
    [(RPMovieWriter *)self->_movieWriter notifyRecordingMayBeStopped];
    v4.receiver = self;
    v4.super_class = (Class)RPSystemRecordSession;
    [(RPSession *)&v4 pauseSession];
  }
}

- (void)setCaptureMicrophoneEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  -[RPSession setMicrophoneEnabled:](self, "setMicrophoneEnabled:");
  if (v3)
  {
    self->_BOOL mixAudioTracks = 1;
    if ([(RPSession *)self sessionState] == 1 && v3)
    {
      id v5 = +[RPCaptureManager sharedInstance];
      [v5 enableMicrophone];
    }
  }
  else
  {
    [(RPSession *)self sessionState];
  }
}

- (CGSize)adjustedWindowSizeForSystemRecording
{
  [(RPSession *)self windowSize];
  double v3 = v2;
  double v5 = v4;
  if (((v2 > v4) ^ +[RPHardwareUtility isNativeScreenOrientationPortrait]))
  {
    double v6 = v5;
    double v5 = v3;
    double v3 = v6;
  }
  else if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136446978;
    BOOL v10 = "-[RPSystemRecordSession adjustedWindowSizeForSystemRecording]";
    __int16 v11 = 1024;
    int v12 = 275;
    __int16 v13 = 2048;
    double v14 = v5;
    __int16 v15 = 2048;
    double v16 = v3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d rotating to window size width %.1f x height:%.1f", (uint8_t *)&v9, 0x26u);
  }
  double v7 = v5;
  double v8 = v3;
  result.double height = v8;
  result.double width = v7;
  return result;
}

- (void)didCaptureSampleWithType:(int)a3 withSampleBuffer:(opaqueCMSampleBuffer *)a4 withTransformFlags:(unint64_t)a5
{
  uint64_t v7 = *(void *)&a3;
  if ([(RPSession *)self sessionState] == 1)
  {
    [(RPSession *)self updateReportingSampleCount:v7];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000427E8;
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
  v5[2] = sub_10004298C;
  v5[3] = &unk_100085018;
  id v6 = a3;
  uint64_t v7 = self;
  id v4 = v6;
  [(RPSystemRecordSession *)self stopSystemRecordingWithHandler:v5];
}

- (id)dispatchCaptureQueue
{
  if (qword_100099D80 != -1) {
    dispatch_once(&qword_100099D80, &stru_100086038);
  }
  double v2 = (void *)qword_100099D78;

  return v2;
}

- (void)handleSystemAlertStop
{
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    double v5 = "-[RPSystemRecordSession handleSystemAlertStop]";
    __int16 v6 = 1024;
    int v7 = 332;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  if ([(RPSession *)self sessionState] == 1 || [(RPSession *)self sessionState] == 4)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_100042BE8;
    v3[3] = &unk_1000856C0;
    v3[4] = self;
    [(RPSystemRecordSession *)self stopSystemRecordingWithHandler:v3];
  }
}

- (void)handleMemoryWarning
{
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    int v12 = "-[RPSystemRecordSession handleMemoryWarning]";
    __int16 v13 = 1024;
    int v14 = 344;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  if ([(RPSession *)self sessionState] == 1 || [(RPSession *)self sessionState] == 4)
  {
    double v3 = +[NSFileManager defaultManager];
    unsigned int v4 = [v3 _srDeviceHasSufficientFreeSpaceForRecording];

    double v5 = +[NSFileManager defaultManager];
    unsigned int v6 = [v5 _srDeviceHasSufficientSpaceForCurrentRecording];

    if (v4)
    {
      if (v6)
      {
        if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136446466;
          int v12 = "-[RPSystemRecordSession handleMemoryWarning]";
          __int16 v13 = 1024;
          int v14 = 352;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Disk space can still support current recording", buf, 0x12u);
        }
        return;
      }
      if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        int v12 = "-[RPSystemRecordSession handleMemoryWarning]";
        __int16 v13 = 1024;
        int v14 = 355;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Disk space cannot support current continued recording, Stopping and discarding current recording", buf, 0x12u);
      }
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_1000430A4;
      v10[3] = &unk_1000856C0;
      v10[4] = self;
      int v7 = v10;
    }
    else if (v6)
    {
      if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        int v12 = "-[RPSystemRecordSession handleMemoryWarning]";
        __int16 v13 = 1024;
        int v14 = 367;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Crossed disk threshold: Disk space can support saving current recording", buf, 0x12u);
      }
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_1000431B0;
      v9[3] = &unk_1000856C0;
      v9[4] = self;
      int v7 = v9;
    }
    else
    {
      if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        int v12 = "-[RPSystemRecordSession handleMemoryWarning]";
        __int16 v13 = 1024;
        int v14 = 376;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Crossed disk threshold: Disk space cannot support saving current recording", buf, 0x12u);
      }
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_1000432BC;
      v8[3] = &unk_1000856C0;
      v8[4] = self;
      int v7 = v8;
    }
    [(RPSystemRecordSession *)self stopSystemRecordingWithHandler:v7];
  }
}

- (void)handleIncomingCallWarning
{
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    double v5 = "-[RPSystemRecordSession handleIncomingCallWarning]";
    __int16 v6 = 1024;
    int v7 = 389;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  if ([(RPSession *)self sessionState] == 1 || [(RPSession *)self sessionState] == 4)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_100043508;
    v3[3] = &unk_1000856C0;
    v3[4] = self;
    [(RPSystemRecordSession *)self stopSystemRecordingWithHandler:v3];
  }
}

- (void)handleDeviceLockedWarning
{
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    double v5 = "-[RPSystemRecordSession handleDeviceLockedWarning]";
    __int16 v6 = 1024;
    int v7 = 401;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  if ([(RPSession *)self sessionState] == 1 || [(RPSession *)self sessionState] == 4)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_10004371C;
    v3[3] = &unk_1000856C0;
    v3[4] = self;
    [(RPSystemRecordSession *)self stopSystemRecordingWithHandler:v3];
  }
}

- (void)handleDeviceRestrictionWarning
{
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    double v5 = "-[RPSystemRecordSession handleDeviceRestrictionWarning]";
    __int16 v6 = 1024;
    int v7 = 413;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  if ([(RPSession *)self sessionState] == 1 || [(RPSession *)self sessionState] == 4)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_100043930;
    v3[3] = &unk_1000856C0;
    v3[4] = self;
    [(RPSystemRecordSession *)self stopSystemRecordingWithHandler:v3];
  }
}

- (void)handleTimerDidUpdate:(id)a3
{
  id v4 = a3;
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136446466;
    int v9 = "-[RPSystemRecordSession handleTimerDidUpdate:]";
    __int16 v10 = 1024;
    int v11 = 425;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v8, 0x12u);
  }
  if ([(RPSession *)self sessionState] == 1 || [(RPSession *)self sessionState] == 4)
  {
    double v5 = +[RPFeatureFlagUtility sharedInstance];
    unsigned int v6 = [v5 systemBannerEnabled];

    if (v6)
    {
      int v7 = +[RPAngelProxy sharedInstance];
      [v7 updateTimer:v4];
    }
    [(RPClientProtocol *)self->super._clientProxy recordingTimerDidUpdate:v4];
  }
}

- (void)handleResumeCaptureWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446978;
    __int16 v17 = "-[RPSystemRecordSession handleResumeCaptureWithCompletionHandler:]";
    __int16 v18 = 1024;
    int v19 = 439;
    __int16 v20 = 2048;
    double v21 = self;
    __int16 v22 = 1024;
    unsigned int v23 = [(RPSession *)self sessionState];
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p resuming in session state %d", buf, 0x22u);
  }
  self->super._sessionIsResuming = 1;
  [(RPMovieWriter *)self->_movieWriter notifyRecordingResumed];
  double v5 = +[RPCaptureManager sharedInstance];
  BOOL v6 = [(RPSession *)self microphoneEnabled];
  [(RPSession *)self windowSize];
  double v8 = v7;
  double v10 = v9;
  int v11 = [(RPSession *)self contextID];
  int v12 = +[NSArray arrayWithObject:v11];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100043D84;
  v14[3] = &unk_1000853B8;
  v14[4] = self;
  id v15 = v4;
  id v13 = v4;
  [v5 startCaptureForDelegate:self forProcessID:0xFFFFFFFFLL shouldStartMicrophoneCapture:v6 windowSize:1 systemRecording:v12 contextIDs:v8 mixedRealityCamera:v10 didStartHandler:v14];
}

- (void)handleResumeContextIDFailure
{
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    double v5 = "-[RPSystemRecordSession handleResumeContextIDFailure]";
    __int16 v6 = 1024;
    int v7 = 460;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  if ([(RPSession *)self sessionState] == 1 || [(RPSession *)self sessionState] == 4)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_100043FD4;
    v3[3] = &unk_1000856C0;
    v3[4] = self;
    [(RPSystemRecordSession *)self stopSystemRecordingWithHandler:v3];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionID, 0);

  objc_storeStrong((id *)&self->_movieWriter, 0);
}

@end