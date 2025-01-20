@interface RPCaptureSession
- (id)dispatchCaptureQueue;
- (void)captureDidFailWithError:(id)a3;
- (void)didCaptureSampleWithType:(int)a3 withSampleBuffer:(opaqueCMSampleBuffer *)a4 withTransformFlags:(unint64_t)a5;
- (void)handleClientApplicationDidEnterBackground;
- (void)handleClientApplicationDidEnterForeground;
- (void)handleDeviceLockedWarning;
- (void)handleDeviceRestrictionWarning;
- (void)handleDisplayWarning;
- (void)handleResumeCaptureWithCompletionHandler:(id)a3;
- (void)handleResumeContextIDFailure;
- (void)packageAudioSampleBufferForCapture:(opaqueCMSampleBuffer *)a3 withType:(int64_t)a4;
- (void)pauseSession;
- (void)presentAcknowledgmentWithMicrophoneEnabled:(BOOL)a3 cameraEnabled:(BOOL)a4 withHandler:(id)a5;
- (void)processVideoSampleBuffer:(opaqueCMSampleBuffer *)a3;
- (void)startCaptureWithMicrophoneEnabled:(BOOL)a3 cameraEnabled:(BOOL)a4 contextID:(id)a5 windowSize:(CGSize)a6 handler:(id)a7;
- (void)stopCaptureWithHandler:(id)a3;
@end

@implementation RPCaptureSession

- (void)startCaptureWithMicrophoneEnabled:(BOOL)a3 cameraEnabled:(BOOL)a4 contextID:(id)a5 windowSize:(CGSize)a6 handler:(id)a7
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
    v18 = "-[RPCaptureSession startCaptureWithMicrophoneEnabled:cameraEnabled:contextID:windowSize:handler:]";
    __int16 v19 = 1024;
    int v20 = 35;
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
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RPCaptureSession: attempting to start capture session when session was not in stopped state", buf, 2u);
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
  v16.super_class = (Class)RPCaptureSession;
  -[RPSession startWithContextID:windowSize:](&v16, "startWithContextID:windowSize:", v13, width, height);
  v15 = -[RPSession checkCaptureRequirementsWithMicrophoneEnabled:cameraEnabled:windowSize:](self, "checkCaptureRequirementsWithMicrophoneEnabled:cameraEnabled:windowSize:", v11, v10, width, height);
  if (!v15)
  {
    [(RPCaptureSession *)self presentAcknowledgmentWithMicrophoneEnabled:v11 cameraEnabled:v10 withHandler:v14];
    goto LABEL_16;
  }
  if (dword_100099BB8 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_1000553EC((uint64_t)v15);
  }
  [(RPSession *)self setSessionState:3];
  if (v14) {
    goto LABEL_14;
  }
LABEL_16:
}

- (void)presentAcknowledgmentWithMicrophoneEnabled:(BOOL)a3 cameraEnabled:(BOOL)a4 withHandler:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  id v8 = a5;
  if ([(RPSession *)self getAcknowledgementAlertResultsWithMicrophone:v6 cameraEnabled:v5])
  {
    v9 = +[RPCaptureManager sharedInstance];
    uint64_t callingPID = self->super._callingPID;
    BOOL v11 = [(RPSession *)self microphoneEnabled];
    [(RPSession *)self windowSize];
    double v13 = v12;
    double v15 = v14;
    objc_super v16 = [(RPSession *)self contextID];
    v17 = +[NSArray arrayWithObject:v16];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10004756C;
    v19[3] = &unk_1000853B8;
    v19[4] = self;
    id v20 = v8;
    [v9 startCaptureForDelegate:self forProcessID:callingPID shouldStartMicrophoneCapture:v11 windowSize:v17 systemRecording:v19 contextIDs:v13 didStartHandler:v15];
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

- (void)stopCaptureWithHandler:(id)a3
{
  v4 = (void (**)(id, void *))a3;
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136446978;
    id v8 = "-[RPCaptureSession stopCaptureWithHandler:]";
    __int16 v9 = 1024;
    int v10 = 108;
    __int16 v11 = 2048;
    double v12 = self;
    __int16 v13 = 1024;
    unsigned int v14 = [(RPSession *)self sessionState];
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p stopping in session state %d", (uint8_t *)&v7, 0x22u);
  }
  if ([(RPSession *)self sessionState] == 3
    || ![(RPSession *)self sessionState]
    || [(RPSession *)self sessionState] == 2)
  {
    BOOL v5 = +[NSError _rpUserErrorForCode:-5829 userInfo:0];
    [(RPSession *)self reportSessionEndReason:v5];
    if (v4) {
      v4[2](v4, v5);
    }
  }
  else
  {
    [(RPSession *)self setSessionState:2];
    BOOL v6 = +[RPCaptureManager sharedInstance];
    [v6 stopCaptureForDelegate:self];

    [(RPSession *)self setSessionState:3];
    [(RPSession *)self reportSummaryEvent:0 recordedFileSize:0];
    if (v4) {
      v4[2](v4, 0);
    }
  }
}

- (void)pauseSession
{
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446978;
    BOOL v6 = "-[RPCaptureSession pauseSession]";
    __int16 v7 = 1024;
    int v8 = 136;
    __int16 v9 = 2048;
    int v10 = self;
    __int16 v11 = 1024;
    unsigned int v12 = [(RPSession *)self sessionState];
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p pausing in session state %d", buf, 0x22u);
  }
  if ([(RPSession *)self sessionState] == 1)
  {
    v3 = +[RPCaptureManager sharedInstance];
    [v3 stopCaptureForDelegate:self];

    [(RPClientProtocol *)self->super._clientProxy recordingDidPause];
    v4.receiver = self;
    v4.super_class = (Class)RPCaptureSession;
    [(RPSession *)&v4 pauseSession];
  }
}

- (id)dispatchCaptureQueue
{
  if (qword_100099DA0 != -1) {
    dispatch_once(&qword_100099DA0, &stru_1000861C0);
  }
  v2 = (void *)qword_100099D98;

  return v2;
}

- (void)didCaptureSampleWithType:(int)a3 withSampleBuffer:(opaqueCMSampleBuffer *)a4 withTransformFlags:(unint64_t)a5
{
  uint64_t v6 = *(void *)&a3;
  if ([(RPSession *)self sessionState] != 1) {
    return;
  }
  [(RPSession *)self updateReportingSampleCount:v6];
  if (v6 == 2)
  {
    if (![(RPSession *)self microphoneEnabled])
    {
      DataBuffer = CMSampleBufferGetDataBuffer(a4);
      size_t DataLength = CMBlockBufferGetDataLength(DataBuffer);
      CMBlockBufferFillDataBytes(0, DataBuffer, 0, DataLength);
    }
    __int16 v9 = self;
    int v10 = a4;
    uint64_t v11 = 3;
  }
  else
  {
    if (v6 != 1)
    {
      if (!v6)
      {
        -[RPCaptureSession processVideoSampleBuffer:](self, "processVideoSampleBuffer:", a4, v8);
      }
      return;
    }
    __int16 v9 = self;
    int v10 = a4;
    uint64_t v11 = 2;
  }

  [(RPCaptureSession *)v9 packageAudioSampleBufferForCapture:v10 withType:v11];
}

- (void)captureDidFailWithError:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100047BC4;
  v5[3] = &unk_100085018;
  id v6 = a3;
  __int16 v7 = self;
  id v4 = v6;
  [(RPCaptureSession *)self stopCaptureWithHandler:v5];
}

- (void)processVideoSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  if ([(RPSession *)self sessionState] == 4)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v9.duration.value) = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "session is paused discard sample", (uint8_t *)&v9, 2u);
    }
  }
  else
  {
    CVImageBufferRef ImageBuffer = CMSampleBufferGetImageBuffer(a3);
    CFRetain(ImageBuffer);
    IOSurfaceRef IOSurface = CVPixelBufferGetIOSurface(ImageBuffer);
    __int16 v7 = objc_alloc_init(RPIOSurfaceObject);
    [(RPIOSurfaceObject *)v7 setIOSurface:IOSurface];
    memset(&v9, 0, sizeof(v9));
    CMSampleBufferGetSampleTimingInfo(a3, 0, &v9);
    uint64_t v8 = +[NSData dataWithBytes:&v9 length:72];
    [(RPClientProtocol *)self->super._clientProxy captureHandlerWithSample:v7 timingData:v8];
    CFRelease(ImageBuffer);
  }
}

- (void)packageAudioSampleBufferForCapture:(opaqueCMSampleBuffer *)a3 withType:(int64_t)a4
{
  sub_100049040(a3, a4);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [(RPClientProtocol *)self->super._clientProxy captureHandlerWithAudioSample:v6 bufferType:a4];
}

- (void)handleDisplayWarning
{
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    BOOL v5 = "-[RPCaptureSession handleDisplayWarning]";
    __int16 v6 = 1024;
    int v7 = 246;
    __int16 v8 = 1024;
    unsigned int v9 = [(RPSession *)self sessionState];
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d session state %d", buf, 0x18u);
  }
  if ([(RPSession *)self sessionState] == 1 || [(RPSession *)self sessionState] == 4)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_100047F34;
    v3[3] = &unk_1000856C0;
    v3[4] = self;
    [(RPCaptureSession *)self stopCaptureWithHandler:v3];
  }
}

- (void)handleDeviceLockedWarning
{
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136446722;
    id v4 = "-[RPCaptureSession handleDeviceLockedWarning]";
    __int16 v5 = 1024;
    int v6 = 257;
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
    __int16 v5 = "-[RPCaptureSession handleDeviceRestrictionWarning]";
    __int16 v6 = 1024;
    int v7 = 275;
    __int16 v8 = 1024;
    unsigned int v9 = [(RPSession *)self sessionState];
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d session state %d", buf, 0x18u);
  }
  if ([(RPSession *)self sessionState] == 1 || [(RPSession *)self sessionState] == 4)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_100048234;
    v3[3] = &unk_1000856C0;
    v3[4] = self;
    [(RPCaptureSession *)self stopCaptureWithHandler:v3];
  }
}

- (void)handleResumeContextIDFailure
{
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    __int16 v5 = "-[RPCaptureSession handleResumeContextIDFailure]";
    __int16 v6 = 1024;
    int v7 = 287;
    __int16 v8 = 1024;
    unsigned int v9 = [(RPSession *)self sessionState];
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d session state %d", buf, 0x18u);
  }
  if ([(RPSession *)self sessionState] == 1 || [(RPSession *)self sessionState] == 4)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_100048458;
    v3[3] = &unk_1000856C0;
    v3[4] = self;
    [(RPCaptureSession *)self stopCaptureWithHandler:v3];
  }
}

- (void)handleResumeCaptureWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446978;
    v18 = "-[RPCaptureSession handleResumeCaptureWithCompletionHandler:]";
    __int16 v19 = 1024;
    int v20 = 297;
    __int16 v21 = 2048;
    v22 = self;
    __int16 v23 = 1024;
    unsigned int v24 = [(RPSession *)self sessionState];
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p resuming in session state %d", buf, 0x22u);
  }
  self->super._sessionIsResuming = 1;
  __int16 v5 = +[RPCaptureManager sharedInstance];
  uint64_t callingPID = self->super._callingPID;
  BOOL v7 = [(RPSession *)self microphoneEnabled];
  [(RPSession *)self windowSize];
  double v9 = v8;
  double v11 = v10;
  unsigned int v12 = [(RPSession *)self contextID];
  __int16 v13 = +[NSArray arrayWithObject:v12];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10004874C;
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
    id v4 = "-[RPCaptureSession handleClientApplicationDidEnterBackground]";
    __int16 v5 = 1024;
    int v6 = 318;
    __int16 v7 = 1024;
    unsigned int v8 = [(RPSession *)self sessionState];
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d session state %d", (uint8_t *)&v3, 0x18u);
  }
  [(RPCaptureSession *)self pauseSession];
}

- (void)handleClientApplicationDidEnterForeground
{
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136446722;
    id v4 = "-[RPCaptureSession handleClientApplicationDidEnterForeground]";
    __int16 v5 = 1024;
    int v6 = 325;
    __int16 v7 = 1024;
    unsigned int v8 = [(RPSession *)self sessionState];
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d session state %d", (uint8_t *)&v3, 0x18u);
  }
  if ([(RPSession *)self sessionState] == 4) {
    [(RPClientProtocol *)self->super._clientProxy shouldResumeSessionType:@"RPInAppCapture"];
  }
}

@end