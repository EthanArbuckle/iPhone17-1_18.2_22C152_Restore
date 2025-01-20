@interface RPMicAudioCaptureManager
+ (AudioStreamBasicDescription)audioStreamBasicDescriptionWithStereo:(SEL)a3;
- (RPMicAudioCaptureManager)init;
- (void)captureOutput:(id)a3 didOutputSampleBuffer:(opaqueCMSampleBuffer *)a4 fromConnection:(id)a5;
- (void)checkAndHandleMicInterruption;
- (void)dealloc;
- (void)dispatchedDidStartHandler;
- (void)handleAudioSessionInterruption:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setCaptureSession:(id)a3;
- (void)startCaptureSession;
- (void)startMicrophoneCaptureWithOutput:(id)a3 didStartHandler:(id)a4;
- (void)stopAllCapture;
- (void)stopCaptureSession;
- (void)stopMicrophoneCapture;
@end

@implementation RPMicAudioCaptureManager

+ (AudioStreamBasicDescription)audioStreamBasicDescriptionWithStereo:(SEL)a3
{
  retstr->mSampleRate = 44100.0;
  *(void *)&retstr->mFormatID = 0xE6C70636DLL;
  if (a4) {
    UInt32 v4 = 4;
  }
  else {
    UInt32 v4 = 2;
  }
  if (a4) {
    UInt32 v5 = 2;
  }
  else {
    UInt32 v5 = 1;
  }
  retstr->mBytesPerFrame = v4;
  retstr->mChannelsPerFrame = v5;
  retstr->mBytesPerPacket = v4;
  retstr->mFramesPerPacket = 1;
  *(void *)&retstr->mBitsPerChannel = 16;
  return result;
}

- (void)handleAudioSessionInterruption:(id)a3
{
  UInt32 v4 = [a3 userInfo];
  UInt32 v5 = [v4 objectForKey:AVAudioSessionInterruptionTypeKey];
  id v6 = [v5 unsignedIntegerValue];

  if (v6)
  {
    if (v6 == (id)1)
    {
      if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        int v7 = 136446466;
        v8 = "-[RPMicAudioCaptureManager handleAudioSessionInterruption:]";
        __int16 v9 = 1024;
        int v10 = 83;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d AVAudioSessionInterruptionTypeBegan", (uint8_t *)&v7, 0x12u);
      }
      self->_micInterrupted = 1;
    }
  }
  else if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136446466;
    v8 = "-[RPMicAudioCaptureManager handleAudioSessionInterruption:]";
    __int16 v9 = 1024;
    int v10 = 87;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d AVAudioSessionInterruptionTypeEnded", (uint8_t *)&v7, 0x12u);
  }
}

- (RPMicAudioCaptureManager)init
{
  v13.receiver = self;
  v13.super_class = (Class)RPMicAudioCaptureManager;
  v2 = [(RPMicAudioCaptureManager *)&v13 init];
  if (v2)
  {
    +[RPMicAudioCaptureManager audioStreamBasicDescriptionWithStereo:0];
    uint64_t v3 = v12;
    long long v4 = v11;
    *(_OWORD *)(v2 + 24) = v10;
    *(_OWORD *)(v2 + 40) = v4;
    *((void *)v2 + 7) = v3;
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.ReplayKit.MicAudioCaptureQueue", 0);
    id v6 = (void *)*((void *)v2 + 1);
    *((void *)v2 + 1) = v5;

    int v7 = (void *)*((void *)v2 + 12);
    *((void *)v2 + 12) = 0;

    v8 = +[NSNotificationCenter defaultCenter];
    [v8 addObserver:v2 selector:"handleAudioSessionInterruption:" name:AVAudioSessionInterruptionNotification object:0];
  }
  return (RPMicAudioCaptureManager *)v2;
}

- (void)dealloc
{
  uint64_t v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:AVAudioSessionInterruptionNotification object:0];

  v4.receiver = self;
  v4.super_class = (Class)RPMicAudioCaptureManager;
  [(RPMicAudioCaptureManager *)&v4 dealloc];
}

- (void)startCaptureSession
{
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136446466;
    id v6 = "-[RPMicAudioCaptureManager startCaptureSession]";
    __int16 v7 = 1024;
    int v8 = 109;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v5, 0x12u);
  }
  if (!self->_sessionInProgress)
  {
    self->_sessionInProgress = 1;
    uint64_t v3 = (AVCaptureSession *)objc_alloc_init((Class)AVCaptureSession);
    captureSession = self->_captureSession;
    self->_captureSession = v3;
  }
}

- (void)stopCaptureSession
{
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136446466;
    objc_super v4 = "-[RPMicAudioCaptureManager stopCaptureSession]";
    __int16 v5 = 1024;
    int v6 = 119;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v3, 0x12u);
  }
  if (self->_sessionInProgress)
  {
    self->_sessionInProgress = 0;
    [(AVCaptureSession *)self->_captureSession removeObserver:self forKeyPath:@"running"];
    [(AVCaptureSession *)self->_captureSession stopRunning];
  }
}

- (void)stopAllCapture
{
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136446466;
    int v6 = "-[RPMicAudioCaptureManager stopAllCapture]";
    __int16 v7 = 1024;
    int v8 = 134;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v5, 0x12u);
  }
  [(RPMicAudioCaptureManager *)self stopCaptureSession];
  [(RPMicAudioCaptureManager *)self stopMicrophoneCapture];
  id microphoneOutputHandler = self->_microphoneOutputHandler;
  self->_id microphoneOutputHandler = 0;

  lastMicAudioDate = self->_lastMicAudioDate;
  self->_lastMicAudioDate = 0;
}

- (void)startMicrophoneCaptureWithOutput:(id)a3 didStartHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v15 = "-[RPMicAudioCaptureManager startMicrophoneCaptureWithOutput:didStartHandler:]";
    __int16 v16 = 1024;
    int v17 = 142;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  audioDispatchQueue = self->_audioDispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100004A98;
  block[3] = &unk_100084E00;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(audioDispatchQueue, block);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if ([v9 isEqualToString:@"running"])
  {
    [(RPMicAudioCaptureManager *)self dispatchedDidStartHandler];
    [v10 removeObserver:self forKeyPath:@"running"];
  }
}

- (void)stopMicrophoneCapture
{
  audioDispatchQueue = self->_audioDispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100004DD4;
  block[3] = &unk_100084E28;
  block[4] = self;
  dispatch_sync(audioDispatchQueue, block);
}

- (void)setCaptureSession:(id)a3
{
  int v5 = (AVCaptureSession *)a3;
  captureSession = self->_captureSession;
  if (captureSession != v5)
  {
    [(AVCaptureSession *)captureSession removeObserver:self forKeyPath:@"running"];
    objc_storeStrong((id *)&self->_captureSession, a3);
  }
}

- (void)checkAndHandleMicInterruption
{
  if (self->_micInterrupted)
  {
    if (self->_microphoneOutputHandler)
    {
      self->_micInterrupted = 0;
      if (self->_lastMicAudioDate)
      {
        int v3 = +[NSDate date];
        [v3 timeIntervalSinceDate:self->_lastMicAudioDate];
        if (v4 > 0.0)
        {
          Float64 v5 = v4;
          if (dword_100099BB8 <= 1
            && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136446466;
            *(void *)&uint8_t buf[4] = "-[RPMicAudioCaptureManager checkAndHandleMicInterruption]";
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = 245;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d gap since last mic tap, filling with empty sample buffer", buf, 0x12u);
          }
          $95D729B680665BEAEFA1D6FCA8238556 micInterruptionPresentationTimeStamp = self->_micInterruptionPresentationTimeStamp;
          long long v6 = *(_OWORD *)&self->_audioBasicDescription.mBytesPerPacket;
          *(_OWORD *)buf = *(_OWORD *)&self->_audioBasicDescription.mSampleRate;
          *(_OWORD *)&buf[16] = v6;
          uint64_t v10 = *(void *)&self->_audioBasicDescription.mBitsPerChannel;
          CMSampleBufferRef v7 = sub_100049538((CMTime *)&micInterruptionPresentationTimeStamp, (uint64_t)buf, v5);
          (*((void (**)(void))self->_microphoneOutputHandler + 2))();
          if (v7) {
            CFRelease(v7);
          }
        }
      }
    }
  }
}

- (void)captureOutput:(id)a3 didOutputSampleBuffer:(opaqueCMSampleBuffer *)a4 fromConnection:(id)a5
{
  int v8 = (AVCaptureAudioDataOutput *)a3;
  id v9 = a5;
  if (self->_captureSessionAudioDataOutput == v8 && self->_microphoneOutputHandler)
  {
    [(RPMicAudioCaptureManager *)self checkAndHandleMicInterruption];
    if (!self->_lastMicAudioDate)
    {
      double v10 = sub_100049AA8(a4);
      if (dword_100099BB8 <= 1)
      {
        float v11 = *(float *)&v10;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136446722;
          *(void *)&uint8_t buf[4] = "-[RPMicAudioCaptureManager captureOutput:didOutputSampleBuffer:fromConnection:]";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 262;
          *(_WORD *)&buf[18] = 2048;
          *(double *)&buf[20] = v11;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d first sample received at time %.3f", buf, 0x1Cu);
        }
      }
    }
    id v12 = +[NSDate date];
    CMSampleBufferGetDuration(&time, a4);
    id v13 = [v12 dateByAddingTimeInterval:CMTimeGetSeconds(&time)];
    lastMicAudioDate = self->_lastMicAudioDate;
    self->_lastMicAudioDate = v13;

    CMSampleBufferGetPresentationTimeStamp(&lhs, a4);
    CMSampleBufferGetDuration(&rhs, a4);
    CMTimeAdd((CMTime *)buf, &lhs, &rhs);
    *(_OWORD *)&self->_micInterruptionPresentationTimeStamp.value = *(_OWORD *)buf;
    self->_micInterruptionPresentationTimeStamp.epoch = *(void *)&buf[16];
    (*((void (**)(void))self->_microphoneOutputHandler + 2))();
  }
}

- (void)dispatchedDidStartHandler
{
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    long long v6 = "-[RPMicAudioCaptureManager dispatchedDidStartHandler]";
    __int16 v7 = 1024;
    int v8 = 274;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  audioDispatchQueue = self->_audioDispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000053BC;
  block[3] = &unk_100084E28;
  block[4] = self;
  dispatch_async(audioDispatchQueue, block);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_micDidStartHandler, 0);
  objc_storeStrong((id *)&self->_lastMicAudioDate, 0);
  objc_storeStrong((id *)&self->_captureSessionAudioDataOutput, 0);
  objc_storeStrong((id *)&self->_captureDeviceAudioInput, 0);
  objc_storeStrong((id *)&self->_captureSession, 0);
  objc_storeStrong(&self->_microphoneOutputHandler, 0);

  objc_storeStrong((id *)&self->_audioDispatchQueue, 0);
}

@end