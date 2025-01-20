@interface FMCameraSession
+ (BOOL)deviceIsSupported;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)cmTimeForMetrics:(SEL)a3;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)retrieveCmTimeForAbsoluteTimestamp:(SEL)a3;
- (AVCaptureDevice)device;
- (AVCaptureSession)session;
- (BOOL)isPacketWithinRangeForTimestamp:(id *)a3 withSessionStartTime:(id *)a4 andSessionStopTime:(id *)a5;
- (FMCameraSessionDelegate)delegate;
- (FMMessageAppSessionStats)messageAppSessionStats;
- (FMUnlockSessionStats)unlockSessionStats;
- (id)packetFromMetrics:(id)a3;
- (unint64_t)machContinuousTimeForMetrics:(id)a3;
- (unsigned)cameraSessionActiveReason;
- (void)captureOutput:(id)a3 didOutputMetadataObjects:(id)a4 fromConnection:(id)a5;
- (void)generateMessageSessionIdWithSessionStartTimestamp:(double)a3;
- (void)generateUnlockSessionIdWithSessionStartTimestamp:(id *)a3;
- (void)reportCameraSessionLatency;
- (void)resetMessageSessionId;
- (void)resetUnlockSessionId;
- (void)setCameraSessionActiveReason:(unsigned __int8)a3;
- (void)setDelegate:(id)a3;
- (void)setMessageAppSessionStats:(FMMessageAppSessionStats *)a3;
- (void)setSession:(id)a3;
- (void)setUnlockSessionStats:(FMUnlockSessionStats *)a3;
- (void)startCameraSession;
- (void)stop;
- (void)updateMessageSessionWithSessionStopTimestamp:(double)a3;
- (void)updateUnlockSessionWithSessionStopTimestamp:(id *)a3;
@end

@implementation FMCameraSession

+ (BOOL)deviceIsSupported
{
  return _MGGetBoolAnswer(@"+N9mZUAHooNvMiQnjeTJ8g", a2);
}

- (void)startCameraSession
{
  self->_cameraSessionRequestTimestampNanoSeconds = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  v3 = (OS_os_transaction *)os_transaction_create();
  transaction = self->_transaction;
  self->_transaction = v3;

  mach_timebase_info(&self->_timeReference.machTimebase);
  self->_timeReference.continuousTime = mach_continuous_time();
  HostTimeClock = CMClockGetHostTimeClock();
  CMClockGetTime(&__buf, HostTimeClock);
  self->_timeReference.mediaTime = ($95D729B680665BEAEFA1D6FCA8238556)__buf;
  __buf.value = 0;
  arc4random_buf(&__buf, 8uLL);
  self->_cameraSessionId = __buf.value;
  v6 = (AVCaptureSession *)objc_alloc_init((Class)AVCaptureSession);
  session = self->_session;
  self->_session = v6;

  v8 = [(FMCameraSession *)self session];
  [v8 beginConfiguration];

  v9 = [(FMCameraSession *)self device];
  if (v9)
  {
    v10 = [objc_alloc((Class)AVCaptureDeviceInput) initWithDevice:v9 error:0];
    if (v10)
    {
      v11 = [(FMCameraSession *)self session];
      [v11 addInput:v10];

      v12 = [v9 deviceType];
      unsigned int v13 = [v12 isEqualToString:AVCaptureDeviceTypeBuiltInTrueDepthCamera];

      if (v13)
      {
        v14 = sub_100007078();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(__buf.value) = 0;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "device type is true depth: configuring depth format and frame rate", (uint8_t *)&__buf, 2u);
        }

        [v9 lockForConfiguration:0];
        v15 = [v9 activeFormat];
        v16 = [v15 supportedDepthDataFormats];
        v17 = [v16 lastObject];
        [v9 setActiveDepthDataFormat:v17];

        CMTimeMake(&v24, 1, 15);
        CMTime v23 = v24;
        [v9 setActiveDepthDataMinFrameDuration:&v23];
        [v9 unlockForConfiguration];
      }
      v18 = objc_opt_new();
      [v18 setMetadataObjectsDelegate:self queue:&_dispatch_main_q];
      v19 = [(FMCameraSession *)self session];
      [v19 addOutput:v18];

      if ([v18 isFaceTrackingSupported])
      {
        [v18 setFaceTrackingMetadataObjectTypesAvailable:1];
        uint64_t v26 = AVMetadataObjectTypeTrackedFaces;
        v20 = +[NSArray arrayWithObjects:&v26 count:1];
        [v18 setMetadataObjectTypes:v20];

        [v18 setFaceTrackingMaxFaces:1];
        [v18 setFaceTrackingPlusEnabled:1];
        v21 = [(FMCameraSession *)self session];
        [v21 commitConfiguration];

        v22 = [(FMCameraSession *)self session];
        [v22 startRunning];
      }
      else
      {
        v22 = sub_100007078();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT)) {
          sub_100007C0C();
        }
      }
    }
    else
    {
      v18 = sub_100007078();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
        sub_100007BD8();
      }
    }
  }
  else
  {
    v10 = sub_100007078();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      sub_100007BA4();
    }
  }
}

- (void)generateUnlockSessionIdWithSessionStartTimestamp:(id *)a3
{
  uint64_t __buf = 0;
  arc4random_buf(&__buf, 8uLL);
  $3CC8671D27C23BF42ADDB32F2B5E48AE v6 = *a3;
  long long v7 = *(_OWORD *)&kCMTimeInvalid.value;
  CMTimeEpoch epoch = kCMTimeInvalid.epoch;
  uint64_t v5 = __buf;
  [(FMCameraSession *)self setUnlockSessionStats:&v5];
}

- (void)updateUnlockSessionWithSessionStopTimestamp:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_unlockSessionStats.unlockSessionStopTime.CMTimeEpoch epoch = a3->var3;
  *(_OWORD *)&self->_unlockSessionStats.unlockSessionStopTime.value = v3;
}

- (void)resetUnlockSessionId
{
  long long v3 = *(_OWORD *)&kCMTimeInvalid.value;
  CMTimeEpoch epoch = kCMTimeInvalid.epoch;
  long long v5 = v3;
  CMTimeEpoch v6 = epoch;
  uint64_t v2 = 0;
  [(FMCameraSession *)self setUnlockSessionStats:&v2];
}

- (void)generateMessageSessionIdWithSessionStartTimestamp:(double)a3
{
  memset(&v7[8], 0, 48);
  *(void *)long long v7 = HAFacialMetricsGenerateHashForTimestamp();
  [(FMCameraSession *)self retrieveCmTimeForAbsoluteTimestamp:a3];
  *(_OWORD *)&v7[32] = *(_OWORD *)&kCMTimeInvalid.value;
  *(void *)&v7[48] = kCMTimeInvalid.epoch;
  v5[0] = *(_OWORD *)v7;
  v5[1] = *(_OWORD *)&v7[16];
  v5[2] = *(_OWORD *)&v7[32];
  uint64_t v6 = *(void *)&v7[48];
  [(FMCameraSession *)self setMessageAppSessionStats:v5];
}

- (void)updateMessageSessionWithSessionStopTimestamp:(double)a3
{
  [(FMCameraSession *)self retrieveCmTimeForAbsoluteTimestamp:a3];
  self->_messageAppSessionStats.messageSessionStopTime = v4;
}

- (void)resetMessageSessionId
{
  long long v3 = *(_OWORD *)&kCMTimeInvalid.value;
  CMTimeEpoch epoch = kCMTimeInvalid.epoch;
  long long v5 = v3;
  CMTimeEpoch v6 = epoch;
  uint64_t v2 = 0;
  [(FMCameraSession *)self setMessageAppSessionStats:&v2];
}

- (AVCaptureDevice)device
{
  uint64_t v2 = +[AVCaptureDevice defaultDeviceWithDeviceType:AVCaptureDeviceTypeBuiltInTrueDepthCamera mediaType:AVMediaTypeVideo position:2];
  if (v2)
  {
    long long v3 = (void *)v2;
    $95D729B680665BEAEFA1D6FCA8238556 v4 = sub_100007078();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v8 = 0;
      long long v5 = "using true depth camera";
      CMTimeEpoch v6 = (uint8_t *)&v8;
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, v5, v6, 2u);
    }
  }
  else
  {
    long long v3 = +[AVCaptureDevice defaultDeviceWithDeviceType:AVCaptureDeviceTypeBuiltInWideAngleCamera mediaType:AVMediaTypeVideo position:2];
    if (!v3) {
      goto LABEL_9;
    }
    $95D729B680665BEAEFA1D6FCA8238556 v4 = sub_100007078();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      long long v5 = "true depth not available: using wide angle camera";
      CMTimeEpoch v6 = buf;
      goto LABEL_7;
    }
  }

LABEL_9:

  return (AVCaptureDevice *)v3;
}

- (void)captureOutput:(id)a3 didOutputMetadataObjects:(id)a4 fromConnection:(id)a5
{
  id v22 = a3;
  id v8 = a4;
  id v9 = a5;
  if (!self->_firstPacketReceived)
  {
    self->_cameraSessionFirstPacketTimestampNanoSeconds = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
    self->_firstPacketReceived = 1;
    [(FMCameraSession *)self reportCameraSessionLatency];
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v10 = v8;
  id v11 = [v10 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v24;
    uint64_t v14 = AVMetadataObjectTypeTrackedFaces;
LABEL_5:
    uint64_t v15 = 0;
    while (1)
    {
      if (*(void *)v24 != v13) {
        objc_enumerationMutation(v10);
      }
      v16 = *(void **)(*((void *)&v23 + 1) + 8 * v15);
      v17 = [v16 type];
      unsigned __int8 v18 = [v17 isEqualToString:v14];

      if (v18) {
        break;
      }
      if (v12 == (id)++v15)
      {
        id v12 = [v10 countByEnumeratingWithState:&v23 objects:v27 count:16];
        if (v12) {
          goto LABEL_5;
        }
        goto LABEL_11;
      }
    }
    v19 = [v16 payload];

    if (!v19) {
      goto LABEL_16;
    }
    v20 = [(FMCameraSession *)self packetFromMetrics:v19];
    if (v20)
    {
      v21 = [(FMCameraSession *)self delegate];
      [v21 handleFacialMetricsPacket:v20 withTimestamp:-[FMCameraSession machContinuousTimeForMetrics:](self, "machContinuousTimeForMetrics:", v19)];
    }
  }
  else
  {
LABEL_11:

LABEL_16:
    v19 = sub_100007078();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_100007C40();
    }
  }
}

- (id)packetFromMetrics:(id)a3
{
  id v4 = a3;
  memset(&v52, 0, sizeof(v52));
  [(FMCameraSession *)self cmTimeForMetrics:v4];
  long long v5 = sub_100007078();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_100007D90();
  }

  [(FMCameraSession *)self unlockSessionStats];
  if (v51
    && ([(FMCameraSession *)self unlockSessionStats],
        long long v49 = v47,
        uint64_t v50 = v48,
        [(FMCameraSession *)self unlockSessionStats],
        long long v45 = v43,
        uint64_t v46 = v44,
        CMTime lhs = v52,
        [(FMCameraSession *)self isPacketWithinRangeForTimestamp:&lhs withSessionStartTime:&v49 andSessionStopTime:&v45]))
  {
    [(FMCameraSession *)self unlockSessionStats];
    CMTime rhs = v39;
    CMTime lhs = v52;
    CMTimeSubtract(&time, &lhs, &rhs);
    double Seconds = CMTimeGetSeconds(&time);
    [(FMCameraSession *)self unlockSessionStats];
    uint64_t v7 = v38;
  }
  else
  {
    [(FMCameraSession *)self unlockSessionStats];
    double Seconds = -1.0;
    if (v37)
    {
      [(FMCameraSession *)self unlockSessionStats];
      CMTime time1 = v35;
      CMTime lhs = v52;
      if (CMTimeCompare(&time1, &lhs) < 0)
      {
        id v8 = sub_100007078();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
          sub_100007D5C();
        }

        [(FMCameraSession *)self resetUnlockSessionId];
      }
    }
    uint64_t v7 = 0;
  }
  id v9 = sub_100007078();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_100007D28();
  }

  [(FMCameraSession *)self messageAppSessionStats];
  if (v34
    && ([(FMCameraSession *)self messageAppSessionStats],
        long long v32 = v30,
        uint64_t v33 = v31,
        [(FMCameraSession *)self messageAppSessionStats],
        long long v28 = v26,
        uint64_t v29 = v27,
        CMTime lhs = v52,
        [(FMCameraSession *)self isPacketWithinRangeForTimestamp:&lhs withSessionStartTime:&v32 andSessionStopTime:&v28]))
  {
    [(FMCameraSession *)self messageAppSessionStats];
    CMTime v24 = v23;
    CMTime lhs = v52;
    CMTimeSubtract(&v25, &lhs, &v24);
    double v10 = CMTimeGetSeconds(&v25);
    [(FMCameraSession *)self messageAppSessionStats];
    uint64_t v11 = v22;
  }
  else
  {
    [(FMCameraSession *)self messageAppSessionStats];
    double v10 = -1.0;
    if (v21)
    {
      [(FMCameraSession *)self messageAppSessionStats];
      CMTime v20 = v19;
      CMTime lhs = v52;
      if (CMTimeCompare(&v20, &lhs) < 0)
      {
        id v12 = sub_100007078();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
          sub_100007CF4();
        }

        [(FMCameraSession *)self resetMessageSessionId];
      }
    }
    uint64_t v11 = 0;
  }
  if (v11 | v7)
  {
    uint64_t v13 = +[FMMetricsDistiller packetFromMetrics:withSessionId:andUnlockSessionId:withSecondsFromStart:andMessageSessionId:withSecondsFromStart:](FMMetricsDistiller, "packetFromMetrics:withSessionId:andUnlockSessionId:withSecondsFromStart:andMessageSessionId:withSecondsFromStart:", v4, self->_cameraSessionId, v7, Seconds, v10);
    if (v13)
    {
      if (!self->_metricsArePublishable)
      {
        self->_metricsArePublishable = 1;
        uint64_t v14 = sub_100007078();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(lhs.value) = 0;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "metrics are now publishable", (uint8_t *)&lhs, 2u);
        }
      }
      uint64_t v13 = v13;
      uint64_t v15 = v13;
    }
    else
    {
      v16 = sub_100007078();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
        sub_100007C80();
      }

      if (self->_metricsArePublishable)
      {
        self->_metricsArePublishable = 0;
        v17 = sub_100007078();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(lhs.value) = 0;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "metrics are no longer publishable", (uint8_t *)&lhs, 2u);
        }
      }
      uint64_t v15 = 0;
    }
  }
  else
  {
    uint64_t v13 = sub_100007078();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100007CB4();
    }
    uint64_t v15 = 0;
  }

  return v15;
}

- (BOOL)isPacketWithinRangeForTimestamp:(id *)a3 withSessionStartTime:(id *)a4 andSessionStopTime:(id *)a5
{
  if ((a4->var2 & 1) == 0 || (a3->var2 & 1) == 0)
  {
    CMTimeEpoch v6 = sub_100007078();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      sub_100007DC4();
    }
    goto LABEL_5;
  }
  CMTime time1 = *(CMTime *)a4;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v10 = *a3;
  if (CMTimeCompare(&time1, (CMTime *)&v10) >= 1)
  {
    CMTimeEpoch v6 = sub_100007078();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
LABEL_5:

      return 0;
    }
    LOWORD(time1.value) = 0;
    id v9 = "packet timestamp is before sessionStartTime";
LABEL_9:
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&time1, 2u);
    goto LABEL_5;
  }
  if (a5->var2)
  {
    CMTime time1 = (CMTime)*a3;
    $3CC8671D27C23BF42ADDB32F2B5E48AE v10 = *a5;
    if (CMTimeCompare(&time1, (CMTime *)&v10) >= 1)
    {
      CMTimeEpoch v6 = sub_100007078();
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_5;
      }
      LOWORD(time1.value) = 0;
      id v9 = "packet timestamp is after sessionStopTime";
      goto LABEL_9;
    }
  }
  return 1;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)cmTimeForMetrics:(SEL)a3
{
  id v5 = a4;
  memset(&v10, 0, sizeof(v10));
  CFDictionaryRef v6 = [v5 objectForKeyedSubscript:@"timestamp"];
  CMTimeMakeFromDictionary(&v10, v6);

  if (v10.flags)
  {
    *(CMTime *)retstr = v10;
  }
  else
  {
    uint64_t v7 = sub_100007078();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100007DF8(v5);
    }

    HostTimeClock = CMClockGetHostTimeClock();
    CMClockGetTime((CMTime *)retstr, HostTimeClock);
  }

  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)retrieveCmTimeForAbsoluteTimestamp:(SEL)a3
{
  memset(&v19, 0, sizeof(v19));
  do
  {
    HostTimeClock = CMClockGetHostTimeClock();
    CMClockGetTime(&lhs, HostTimeClock);
    CMTimeValue value = lhs.value;
    CMTimeScale timescale = lhs.timescale;
    uint64_t v20 = *(void *)&lhs.flags;
    int epoch_high = HIDWORD(lhs.epoch);
    id v9 = CMClockGetHostTimeClock();
    CMClockGetTime(&v19, v9);
    double Current = CFAbsoluteTimeGetCurrent();
    CMTime lhs = v19;
    rhs.CMTimeValue value = value;
    rhs.CMTimeScale timescale = timescale;
    *(void *)&rhs.flags = v20;
    HIDWORD(rhs.epoch) = epoch_high;
    CMTimeSubtract(&time, &lhs, &rhs);
  }
  while (CMTimeGetSeconds(&time) > 0.125);
  CMTime lhs = v19;
  rhs.CMTimeValue value = value;
  rhs.CMTimeScale timescale = timescale;
  *(void *)&rhs.flags = v20;
  HIDWORD(rhs.epoch) = epoch_high;
  CMTimeSubtract(&v15, &lhs, &rhs);
  Float64 Seconds = CMTimeGetSeconds(&v15);
  memset(&lhs, 0, sizeof(lhs));
  CMTimeMakeWithSeconds(&v14, Seconds * 0.5, timescale);
  rhs.CMTimeValue value = value;
  rhs.CMTimeScale timescale = timescale;
  *(void *)&rhs.flags = v20;
  HIDWORD(rhs.epoch) = epoch_high;
  CMTimeAdd(&lhs, &rhs, &v14);
  CMTimeMakeWithSeconds(&v13, Current - a4, timescale);
  CMTime rhs = lhs;
  return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeSubtract((CMTime *)retstr, &rhs, &v13);
}

- (unint64_t)machContinuousTimeForMetrics:(id)a3
{
  id v4 = a3;
  memset(&v17, 0, sizeof(v17));
  CFDictionaryRef v5 = [v4 objectForKeyedSubscript:@"timestamp"];
  CMTimeMakeFromDictionary(&v17, v5);

  if ((v17.flags & 1) == 0)
  {
    CFDictionaryRef v6 = sub_100007078();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100007DF8(v4);
    }
LABEL_11:

    uint64_t v11 = mach_continuous_time();
    goto LABEL_12;
  }
  CMTime start = (CMTime)self->_timeReference.mediaTime;
  CMTime v13 = v17;
  CMTimeRangeFromTimeToTime(&v15, &start, &v13);
  CMTime time = v15.duration;
  double Seconds = CMTimeGetSeconds(&time);
  id v8 = sub_100007078();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_100007F04(v8, Seconds);
  }

  if (Seconds < 0.0 || Seconds > 35.0)
  {
    CFDictionaryRef v6 = sub_100007078();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100007E88(v6, Seconds);
    }
    goto LABEL_11;
  }
  LODWORD(v9) = self->_timeReference.machTimebase.numer;
  LODWORD(v10) = self->_timeReference.machTimebase.denom;
  uint64_t v11 = self->_timeReference.continuousTime + (unint64_t)(Seconds * 1000000000.0 / (double)v9 * (double)v10);
LABEL_12:

  return v11;
}

- (void)stop
{
  id v2 = [(FMCameraSession *)self session];
  [v2 stopRunning];
}

- (void)reportCameraSessionLatency
{
  CFStringRef v4 = @"timeToFirstPacketLatency";
  id v2 = +[NSNumber numberWithDouble:(double)(self->_cameraSessionFirstPacketTimestampNanoSeconds - self->_cameraSessionRequestTimestampNanoSeconds)/ 1000000.0];
  CFDictionaryRef v5 = v2;
  long long v3 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];

  AnalyticsSendEvent();
}

- (FMCameraSessionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (FMCameraSessionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (unsigned)cameraSessionActiveReason
{
  return self->_cameraSessionActiveReason;
}

- (void)setCameraSessionActiveReason:(unsigned __int8)a3
{
  self->_cameraSessionActiveReason = a3;
}

- (AVCaptureSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
}

- (FMUnlockSessionStats)unlockSessionStats
{
  objc_copyStruct(retstr, &self->_unlockSessionStats, 56, 1, 0);
  return result;
}

- (void)setUnlockSessionStats:(FMUnlockSessionStats *)a3
{
}

- (FMMessageAppSessionStats)messageAppSessionStats
{
  objc_copyStruct(retstr, &self->_messageAppSessionStats, 56, 1, 0);
  return result;
}

- (void)setMessageAppSessionStats:(FMMessageAppSessionStats *)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_session, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_transaction, 0);
}

@end