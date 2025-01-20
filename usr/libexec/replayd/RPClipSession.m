@interface RPClipSession
- (id)dispatchCaptureQueue;
- (void)captureDidFailWithError:(id)a3;
- (void)createEncodingSessionWithWidth:(int)a3 withHeight:(int)a4;
- (void)didCaptureSampleWithType:(int)a3 withSampleBuffer:(opaqueCMSampleBuffer *)a4 withTransformFlags:(unint64_t)a5;
- (void)encodeBuffer:(opaqueCMSampleBuffer *)a3;
- (void)exportClipToURL:(id)a3 duration:(double)a4 completionHandler:(id)a5;
- (void)handleClientApplicationDidEnterBackground;
- (void)handleClientApplicationDidEnterForeground;
- (void)handleDeviceLockedWarning;
- (void)handleDeviceRestrictionWarning;
- (void)handleDisplayWarning;
- (void)handleResumeCaptureWithCompletionHandler:(id)a3;
- (void)handleResumeContextIDFailure;
- (void)pauseSession;
- (void)presentAcknowledgmentWithMicrophoneEnabled:(BOOL)a3 cameraEnabled:(BOOL)a4 withHandler:(id)a5;
- (void)startClipWithMicrophoneEnabled:(BOOL)a3 cameraEnabled:(BOOL)a4 contextID:(id)a5 windowSize:(CGSize)a6 handler:(id)a7;
- (void)stopClipWithHandler:(id)a3;
@end

@implementation RPClipSession

- (void)startClipWithMicrophoneEnabled:(BOOL)a3 cameraEnabled:(BOOL)a4 contextID:(id)a5 windowSize:(CGSize)a6 handler:(id)a7
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
    v18 = "-[RPClipSession startClipWithMicrophoneEnabled:cameraEnabled:contextID:windowSize:handler:]";
    __int16 v19 = 1024;
    int v20 = 50;
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
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RPClipSession: attempting to start clip session when session was not in stopped state", buf, 2u);
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
  v16.super_class = (Class)RPClipSession;
  -[RPSession startWithContextID:windowSize:](&v16, "startWithContextID:windowSize:", v13, width, height);
  v15 = -[RPSession checkCaptureRequirementsWithMicrophoneEnabled:cameraEnabled:windowSize:](self, "checkCaptureRequirementsWithMicrophoneEnabled:cameraEnabled:windowSize:", v11, v10, width, height);
  if (!v15)
  {
    [(RPClipSession *)self presentAcknowledgmentWithMicrophoneEnabled:v11 cameraEnabled:v10 withHandler:v14];
    goto LABEL_16;
  }
  if (dword_100099BB8 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100050F0C();
  }
  [(RPSession *)self setSessionState:3];
  if (v14) {
    goto LABEL_14;
  }
LABEL_16:
}

- (void)stopClipWithHandler:(id)a3
{
  v4 = (void (**)(id, void *))a3;
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v9 = 136446978;
    *(void *)&v9[4] = "-[RPClipSession stopClipWithHandler:]";
    *(_WORD *)&v9[12] = 1024;
    *(_DWORD *)&v9[14] = 91;
    *(_WORD *)&v9[18] = 2048;
    *(void *)&v9[20] = self;
    __int16 v10 = 1024;
    unsigned int v11 = [(RPSession *)self sessionState];
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p stopping in session state %d", v9, 0x22u);
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
    v6 = +[RPCaptureManager sharedInstance];
    [v6 stopCaptureForDelegate:self];

    encodeSession = self->_encodeSession;
    *(_OWORD *)v9 = *(_OWORD *)&kCMTimeInvalid.value;
    *(void *)&v9[16] = kCMTimeInvalid.epoch;
    VTCompressionSessionCompleteFrames(encodeSession, (CMTime *)v9);
    VTCompressionSessionInvalidate(self->_encodeSession);
    v8 = self->_encodeSession;
    if (v8) {
      CFRelease(v8);
    }
    self->_encodeSession = 0;
    [(RPClipWriter *)self->_clipWriter flushClipBuffer];
    [(RPSession *)self reportSummaryEvent:0 recordedFileSize:0];
    [(RPSession *)self setSessionState:3];
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
    v6 = "-[RPClipSession pauseSession]";
    __int16 v7 = 1024;
    int v8 = 125;
    __int16 v9 = 2048;
    __int16 v10 = self;
    __int16 v11 = 1024;
    unsigned int v12 = [(RPSession *)self sessionState];
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p pausing in session state %d", buf, 0x22u);
  }
  if ([(RPSession *)self sessionState] == 1)
  {
    v3 = +[RPCaptureManager sharedInstance];
    [v3 stopCaptureForDelegate:self];

    [(RPClipWriter *)self->_clipWriter flushClipBuffer];
    [(RPClientProtocol *)self->super._clientProxy recordingDidPause];
    v4.receiver = self;
    v4.super_class = (Class)RPClipSession;
    [(RPSession *)&v4 pauseSession];
  }
}

- (void)exportClipToURL:(id)a3 duration:(double)a4 completionHandler:(id)a5
{
  id v8 = a3;
  __int16 v9 = (void (**)(id, void *))a5;
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    __int16 v19 = "-[RPClipSession exportClipToURL:duration:completionHandler:]";
    __int16 v20 = 1024;
    int v21 = 136;
    __int16 v22 = 2048;
    uint64_t v23 = (uint64_t)self;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p", buf, 0x1Cu);
  }
  double v10 = 15.0;
  if (a4 <= 15.0)
  {
    if (a4 > 0.0)
    {
LABEL_13:
      double v10 = a4;
      goto LABEL_14;
    }
    if (dword_100099BB8 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_100050FA8();
      if (v9) {
        goto LABEL_12;
      }
    }
    else if (v9)
    {
LABEL_12:
      __int16 v11 = +[NSError _rpUserErrorForCode:-5834 userInfo:0];
      v9[2](v9, v11);

      goto LABEL_13;
    }
    if ([(RPSession *)self sessionState] != 1) {
      goto LABEL_18;
    }
    goto LABEL_15;
  }
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    __int16 v19 = "-[RPClipSession exportClipToURL:duration:completionHandler:]";
    __int16 v20 = 1024;
    int v21 = 138;
    __int16 v22 = 2048;
    uint64_t v23 = 0x402E000000000000;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d clipping to maximum length %f seconds", buf, 0x1Cu);
  }
LABEL_14:
  a4 = v10;
  if ([(RPSession *)self sessionState] == 1)
  {
LABEL_15:
    unsigned int v12 = [(RPClipSession *)self dispatchCaptureQueue];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10001A82C;
    v14[3] = &unk_100085678;
    v14[4] = self;
    id v15 = v8;
    double v17 = a4;
    objc_super v16 = v9;
    dispatch_async(v12, v14);

    goto LABEL_18;
  }
  if (v9)
  {
    id v13 = +[NSError _rpUserErrorForCode:-5829 userInfo:0];
    v9[2](v9, v13);
  }
LABEL_18:
}

- (void)encodeBuffer:(opaqueCMSampleBuffer *)a3
{
  CFRetain(a3);
  v5 = [(RPClipSession *)self dispatchCaptureQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10001AADC;
  v6[3] = &unk_100084F08;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async(v5, v6);
}

- (void)createEncodingSessionWithWidth:(int)a3 withHeight:(int)a4
{
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446978;
    __int16 v11 = "-[RPClipSession createEncodingSessionWithWidth:withHeight:]";
    __int16 v12 = 1024;
    int v13 = 202;
    __int16 v14 = 1024;
    int v15 = a3;
    __int16 v16 = 1024;
    int v17 = a4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d VTCompressionSessionCreate w:%d h:%d", buf, 0x1Eu);
  }
  outputCallbackRefCon = self->_clipWriter;
  p_encodeSession = &self->_encodeSession;
  if (VTCompressionSessionCreate(kCFAllocatorDefault, a3, a4, 0x61766331u, 0, 0, kCFAllocatorDefault, (VTCompressionOutputCallback)sub_10001AE24, outputCallbackRefCon, p_encodeSession))
  {
    if (dword_100099BB8 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10005114C();
    }
  }
  else
  {
    VTSessionSetProperty(*p_encodeSession, kVTCompressionPropertyKey_RealTime, kCFBooleanTrue);
    *(_DWORD *)buf = 1056964608;
    CFNumberRef v9 = CFNumberCreate(kCFAllocatorDefault, kCFNumberFloat32Type, buf);
    VTSessionSetProperty(*p_encodeSession, kVTCompressionPropertyKey_MaxKeyFrameIntervalDuration, v9);
    CFRelease(v9);
  }
}

- (void)presentAcknowledgmentWithMicrophoneEnabled:(BOOL)a3 cameraEnabled:(BOOL)a4 withHandler:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  id v8 = a5;
  if ([(RPSession *)self getAcknowledgementAlertResultsWithMicrophone:v6 cameraEnabled:v5])
  {
    CFNumberRef v9 = +[RPCaptureManager sharedInstance];
    uint64_t callingPID = self->super._callingPID;
    BOOL v11 = [(RPSession *)self microphoneEnabled];
    [(RPSession *)self windowSize];
    double v13 = v12;
    double v15 = v14;
    __int16 v16 = [(RPSession *)self contextID];
    int v17 = +[NSArray arrayWithObject:v16];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10001B088;
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

- (void)didCaptureSampleWithType:(int)a3 withSampleBuffer:(opaqueCMSampleBuffer *)a4 withTransformFlags:(unint64_t)a5
{
  if (a4)
  {
    -[RPSession updateReportingSampleCount:](self, "updateReportingSampleCount:", *(void *)&a3, a4, a5);
    if (a3)
    {
      id v8 = sub_100049040(a4, 0);
      CMSampleBufferRef v9 = sub_100049274(v8);
      if (v9)
      {
        CMSampleBufferRef v10 = v9;
        if (a3 == 2)
        {
          [(RPClipWriter *)self->_clipWriter appendAudio2SampleBuffer:v9];
        }
        else if (a3 == 1)
        {
          [(RPClipWriter *)self->_clipWriter appendAudio1SampleBuffer:v9];
        }
        CFRelease(v10);
      }
      else if (dword_100099BB8 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        sub_10005135C();
      }
    }
    else
    {
      [(RPClipSession *)self encodeBuffer:a4];
    }
  }
  else if (dword_100099BB8 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_1000512D8();
  }
}

- (void)captureDidFailWithError:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10001B3D0;
  v5[3] = &unk_100085018;
  id v6 = a3;
  __int16 v7 = self;
  id v4 = v6;
  [(RPClipSession *)self stopClipWithHandler:v5];
}

- (id)dispatchCaptureQueue
{
  if (qword_100099C28 != -1) {
    dispatch_once(&qword_100099C28, &stru_100085698);
  }
  v2 = (void *)qword_100099C20;

  return v2;
}

- (void)handleResumeCaptureWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446978;
    v18 = "-[RPClipSession handleResumeCaptureWithCompletionHandler:]";
    __int16 v19 = 1024;
    int v20 = 342;
    __int16 v21 = 2048;
    __int16 v22 = self;
    __int16 v23 = 1024;
    unsigned int v24 = [(RPSession *)self sessionState];
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p resuming in session state %d", buf, 0x22u);
  }
  self->super._sessionIsResuming = 1;
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
  v15[2] = sub_10001B70C;
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
    id v4 = "-[RPClipSession handleClientApplicationDidEnterBackground]";
    __int16 v5 = 1024;
    int v6 = 364;
    __int16 v7 = 1024;
    unsigned int v8 = [(RPSession *)self sessionState];
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d session state %d", (uint8_t *)&v3, 0x18u);
  }
  [(RPClipSession *)self pauseSession];
}

- (void)handleClientApplicationDidEnterForeground
{
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136446722;
    id v4 = "-[RPClipSession handleClientApplicationDidEnterForeground]";
    __int16 v5 = 1024;
    int v6 = 371;
    __int16 v7 = 1024;
    unsigned int v8 = [(RPSession *)self sessionState];
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d session state %d", (uint8_t *)&v3, 0x18u);
  }
  if ([(RPSession *)self sessionState] == 4) {
    [(RPClientProtocol *)self->super._clientProxy shouldResumeSessionType:@"RPInAppClip"];
  }
}

- (void)handleDisplayWarning
{
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    __int16 v5 = "-[RPClipSession handleDisplayWarning]";
    __int16 v6 = 1024;
    int v7 = 381;
    __int16 v8 = 1024;
    unsigned int v9 = [(RPSession *)self sessionState];
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d session state %d", buf, 0x18u);
  }
  if ([(RPSession *)self sessionState] == 1 || [(RPSession *)self sessionState] == 4)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_10001BB58;
    v3[3] = &unk_1000856C0;
    v3[4] = self;
    [(RPClipSession *)self stopClipWithHandler:v3];
  }
}

- (void)handleDeviceLockedWarning
{
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136446722;
    id v4 = "-[RPClipSession handleDeviceLockedWarning]";
    __int16 v5 = 1024;
    int v6 = 392;
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
    __int16 v5 = "-[RPClipSession handleDeviceRestrictionWarning]";
    __int16 v6 = 1024;
    int v7 = 410;
    __int16 v8 = 1024;
    unsigned int v9 = [(RPSession *)self sessionState];
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d session state %d", buf, 0x18u);
  }
  if ([(RPSession *)self sessionState] == 1 || [(RPSession *)self sessionState] == 4)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_10001BE58;
    v3[3] = &unk_1000856C0;
    v3[4] = self;
    [(RPClipSession *)self stopClipWithHandler:v3];
  }
}

- (void)handleResumeContextIDFailure
{
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    __int16 v5 = "-[RPClipSession handleResumeContextIDFailure]";
    __int16 v6 = 1024;
    int v7 = 422;
    __int16 v8 = 1024;
    unsigned int v9 = [(RPSession *)self sessionState];
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d session state %d", buf, 0x18u);
  }
  if ([(RPSession *)self sessionState] == 1 || [(RPSession *)self sessionState] == 4)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_10001C07C;
    v3[3] = &unk_1000856C0;
    v3[4] = self;
    [(RPClipSession *)self stopClipWithHandler:v3];
  }
}

- (void).cxx_destruct
{
}

@end