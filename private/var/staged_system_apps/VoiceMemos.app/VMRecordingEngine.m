@interface VMRecordingEngine
- (AVAudioTime)startTime;
- (BOOL)configureWithAudioSettings:(id)a3 error:(id *)a4;
- (BOOL)internalRecording;
- (BOOL)sampleRecordingTime:(double *)a3;
- (BOOL)startAndReturnError:(id *)a3;
- (BOOL)stopTimeReached;
- (NSMutableArray)inputBufferQueue;
- (NSMutableDictionary)audioSettings;
- (OS_dispatch_group)group;
- (OS_dispatch_group)stopGroup;
- (RCSAudioFile)assetWriter;
- (VMRecordingController)controller;
- (VMRecordingEngine)init;
- (double)punchInTime;
- (double)punchOutTime;
- (double)stopTime;
- (id)inputNode:(id *)a3;
- (int64_t)frameCount;
- (os_unfair_lock_s)inputWriteLock;
- (void)_scheduleFirstBuffer;
- (void)_signalOverdubPlaybackHasStarted;
- (void)_startRecording;
- (void)dealloc;
- (void)handleConfigurationChangeNotification:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)pause;
- (void)reset;
- (void)setAssetWriter:(id)a3;
- (void)setController:(id)a3;
- (void)setFrameCount:(int64_t)a3;
- (void)setInputBufferQueue:(id)a3;
- (void)setInputWriteLock:(os_unfair_lock_s)a3;
- (void)setInternalRecording:(BOOL)a3;
- (void)setPunchInTime:(double)a3;
- (void)setPunchOutTime:(double)a3;
- (void)setStartTime:(id)a3;
- (void)setStopGroup:(id)a3;
- (void)setStopTime:(double)a3;
- (void)setStopTimeReached:(BOOL)a3;
- (void)stop;
- (void)stopRecordingAtTime:(double)a3 completion:(id)a4;
@end

@implementation VMRecordingEngine

- (VMRecordingEngine)init
{
  v11.receiver = self;
  v11.super_class = (Class)VMRecordingEngine;
  v2 = [(VMRecordingEngine *)&v11 init];
  if (v2)
  {
    dispatch_group_t v3 = dispatch_group_create();
    group = v2->_group;
    v2->_group = (OS_dispatch_group *)v3;

    dispatch_group_t v5 = dispatch_group_create();
    stopGroup = v2->_stopGroup;
    v2->_stopGroup = (OS_dispatch_group *)v5;

    v2->_recordingTime = v2->_recordingTimes;
    uint64_t v7 = objc_opt_new();
    inputBufferQueue = v2->_inputBufferQueue;
    v2->_inputBufferQueue = (NSMutableArray *)v7;

    v2->_inputWriteLock._os_unfair_lock_opaque = 0;
    id recordingBlock = v2->_recordingBlock;
    v2->_id recordingBlock = &stru_100221378;
  }
  return v2;
}

- (void)dealloc
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained removeObserver:self forKeyPath:@"targetState" context:@"targetState"];
  }

  v5.receiver = self;
  v5.super_class = (Class)VMRecordingEngine;
  [(VMRecordingEngine *)&v5 dealloc];
}

- (void)setController:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  objc_super v5 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained removeObserver:self forKeyPath:@"targetState" context:@"targetState"];
  }
  objc_storeWeak((id *)&self->_controller, obj);
  if (obj) {
    [obj addObserver:self forKeyPath:@"targetState" options:0 context:@"targetState"];
  }
  sub_10003D4EC((id *)&self->super.super.isa);
}

- (BOOL)sampleRecordingTime:(double *)a3
{
  startTime = self->_startTime;
  if (startTime)
  {
    objc_super v5 = self;
    recordingTime = self->_recordingTime;
    int64_t hostTime = recordingTime->hostTime;
    double frameCount = (double)recordingTime->frameCount;
    v9 = startTime;
    [(AVAudioTime *)v9 sampleRate];
    double v11 = frameCount / v10 + v5->_punchInTime;
    LODWORD(v5) = [(VMRecordingEngine *)v5 isRunning];

    if (v5)
    {
      +[AVAudioTime secondsForHostTime:mach_absolute_time() - hostTime];
      double v11 = v11 + v12;
    }
    *a3 = v11;
  }
  return startTime != 0;
}

- (void)stopRecordingAtTime:(double)a3 completion:(id)a4
{
  v6 = (void (**)(void))a4;
  dispatch_block_t block = v6;
  if (self->_startTime && (self->_stopTime = a3, (stopGroup = self->_stopGroup) != 0)) {
    dispatch_group_notify(stopGroup, (dispatch_queue_t)&_dispatch_main_q, v6);
  }
  else {
    v6[2](v6);
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (a6 == @"targetState")
  {
    p_controller = &self->_controller;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
    id v9 = [WeakRetained targetState];

    if (v9) {
      BOOL v10 = v9 == 3;
    }
    else {
      BOOL v10 = 1;
    }
    if (v10)
    {
      double v11 = +[VMAudioService sharedInstance];
      id v12 = objc_loadWeakRetained((id *)p_controller);
      [v11 stopRecordingWithController:v12 error:0];
    }
    else if (v9 == 2)
    {
      [(VMRecordingEngine *)self startAndReturnError:0];
    }
    id v13 = objc_loadWeakRetained((id *)p_controller);
    [v13 setCurrentState:v9];
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)VMRecordingEngine;
    -[VMRecordingEngine observeValueForKeyPath:ofObject:change:context:](&v14, "observeValueForKeyPath:ofObject:change:context:", a3, a4, a5);
  }
}

- (void)handleConfigurationChangeNotification:(id)a3
{
  if (([(VMRecordingEngine *)self isRunning] & 1) == 0)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10003DC64;
    block[3] = &unk_100221278;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (id)inputNode:(id *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)VMRecordingEngine;
  dispatch_group_t v3 = [(VMRecordingEngine *)&v5 inputNode];

  return v3;
}

- (void)_startRecording
{
  id recordingBlock = self->_recordingBlock;
  self->_id recordingBlock = &stru_1002213D8;
}

- (BOOL)configureWithAudioSettings:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [(VMRecordingEngine *)self inputNode:a4];
  v8 = v7;
  if (v7)
  {
    id v9 = [v7 inputFormatForBus:0];
    [v9 sampleRate];
    double v11 = v10;
    self->_inputSampleRate = v10;
    id v12 = OSLogForCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&buf[4] = "-[VMRecordingEngine configureWithAudioSettings:error:]";
      *(_WORD *)&buf[12] = 2048;
      *(double *)&buf[14] = v11;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s -- inputSampleRate = %g Hz", buf, 0x16u);
    }

    if (v11 == 0.0 || ![v9 channelCount])
    {
      if (!a4)
      {
        BOOL v15 = 0;
LABEL_35:

        goto LABEL_36;
      }
      *a4 = +[NSError errorWithDomain:@"VMAudioServiceErrorDomain" code:5 userInfo:0];
      id v13 = OSLogForCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        id v14 = *a4;
        *(_DWORD *)buf = 136315394;
        *(void *)&buf[4] = "-[VMRecordingEngine configureWithAudioSettings:error:]";
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v14;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s -- serviceError = %@", buf, 0x16u);
      }
      BOOL v15 = 0;
    }
    else
    {
      unsigned int v16 = [v9 channelCount];
      v17 = [v6 objectForKeyedSubscript:AVSampleRateKey];
      [v17 doubleValue];
      double v19 = v18;
      self->_outputSampleRate = v18;

      v20 = OSLogForCategory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        *(void *)&buf[4] = "-[VMRecordingEngine configureWithAudioSettings:error:]";
        *(_WORD *)&buf[12] = 2048;
        *(double *)&buf[14] = v19;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%s -- outputSampleRate = %g Hz", buf, 0x16u);
      }

      v21 = [v6 objectForKeyedSubscript:AVNumberOfChannelsKey];
      id v22 = [v21 intValue];

      if (v11 != v19 || v16 != v22)
      {
        id v23 = [objc_alloc((Class)AVAudioFormat) initStandardFormatWithSampleRate:v22 channels:v19];
        v24 = (AVAudioConverter *)[objc_alloc((Class)AVAudioConverter) initFromFormat:v9 toFormat:v23];
        audioConverter = self->_audioConverter;
        self->_audioConverter = v24;

        [(AVAudioConverter *)self->_audioConverter setSampleRateConverterQuality:127];
        if ([v9 channelCount] > v22)
        {
          v26 = +[VMAudioDevice defaultInputAndReturnError:0];
          v27 = [v26 stereoChannels];
          [(AVAudioConverter *)self->_audioConverter setChannelMap:v27];
        }
        id v28 = objc_alloc((Class)AVAudioPCMBuffer);
        LODWORD(v29) = vcvtpd_u64_f64(v19 / 10.0);
        v30 = (AVAudioPCMBuffer *)[v28 initWithPCMFormat:v23 frameCapacity:v29];
        conversionBuffer = self->_conversionBuffer;
        self->_conversionBuffer = v30;
      }
      id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
      v33 = [WeakRetained waveformDataSource];
      v34 = [v33 waveformGenerator];
      waveformGenerator = self->_waveformGenerator;
      self->_waveformGenerator = v34;

      id v13 = objc_loadWeakRetained((id *)&self->_controller);
      unsigned int v36 = [v13 overdubbing];
      if (v36)
      {
        v37 = [(RCSAudioFile *)self->_assetWriter processingFormat];
        v61 = [v13 recordingComposition];
        [v13 targetTime];
        double v39 = v38;
        [v61 composedDuration];
        if (v39 >= v40)
        {
          id v41 = [objc_alloc((Class)AVAudioPCMBuffer) initWithPCMFormat:v37 frameCapacity:1024];
          [v41 setFrameLength:1024];
          v65[0] = v41;
          v65[1] = v41;
          v43 = +[NSArray arrayWithObjects:v65 count:2];
          v42 = [v43 objectEnumerator];
        }
        else
        {
          id v41 = [v13 recordingComposition];
          [v13 targetTime];
          uint64_t v64 = 0;
          v42 = [v41 bufferEnumerator:v37 startTime:&v64];
        }

        if (v42)
        {
          v44 = (AVAudioPlayerNode *)objc_opt_new();
          [(VMRecordingEngine *)self attachNode:v44];
          v45 = [(VMRecordingEngine *)self outputNode];
          [(VMRecordingEngine *)self connect:v44 to:v45 format:v37];

          playerNode = self->_playerNode;
          self->_playerNode = v44;
          v47 = v44;

          objc_storeStrong((id *)&self->_playerBuffers, v42);
          v48 = (NSMutableArray *)objc_opt_new();
          overdubBuffers = self->_overdubBuffers;
          self->_overdubBuffers = v48;

          id recordingBlock = self->_recordingBlock;
          self->_id recordingBlock = &stru_100221420;
        }
      }
      else
      {
        v37 = self->_recordingBlock;
        self->_id recordingBlock = &stru_100221440;
      }

      v51 = v8;
      v52 = +[NSUserDefaults standardUserDefaults];
      v53 = [v52 objectForKey:@"RCOverdubVoiceIsolationEnabled"];

      if (v53) {
        char v54 = [v53 BOOLValue] ^ 1;
      }
      else {
        char v54 = 0;
      }
      v55 = v51;
      if (v36)
      {
        v55 = v51;
        if ((v54 & 1) == 0)
        {
          id v56 = objc_alloc((Class)AVAudioUnitEffect);
          *(_OWORD *)buf = xmmword_1001EFDD0;
          *(_DWORD *)&buf[16] = 0;
          id v57 = [v56 initWithAudioComponentDescription:buf];
          [(VMRecordingEngine *)self attachNode:v57];
          [(VMRecordingEngine *)self connect:v51 to:v57 format:v9];
          AudioUnitSetParameter((AudioUnit)[v57 audioUnit], 0, 0, 0, 90.0, 0);
          AudioUnitSetParameter((AudioUnit)[v57 audioUnit], 1u, 0, 0, 0.0, 0);
          v55 = (AVAudioUnitEffect *)v57;

          voiceIsolationNode = self->_voiceIsolationNode;
          self->_voiceIsolationNode = v55;
        }
      }
      objc_initWeak((id *)buf, self);
      v62[0] = _NSConcreteStackBlock;
      v62[1] = 3221225472;
      v62[2] = sub_10003F558;
      v62[3] = &unk_100221468;
      objc_copyWeak(&v63, (id *)buf);
      LODWORD(v59) = vcvtpd_u64_f64(v11 / 10.0);
      [(AVAudioUnitEffect *)v55 installTapOnBus:0 bufferSize:v59 format:v9 block:v62];
      dispatch_group_enter((dispatch_group_t)self->_stopGroup);
      AudioUnitAddPropertyListener((AudioUnit)[(AVAudioUnitEffect *)v51 audioUnit], 0x7D1u, (AudioUnitPropertyListenerProc)sub_10003F5E4, self);
      objc_destroyWeak(&v63);
      objc_destroyWeak((id *)buf);

      BOOL v15 = 1;
    }

    goto LABEL_35;
  }
  BOOL v15 = 0;
LABEL_36:

  return v15;
}

- (void)_signalOverdubPlaybackHasStarted
{
  dispatch_group_t v3 = [(AVAudioPlayerNode *)self->_playerNode lastRenderTime];
  [v3 sampleRate];
  v4 = +[AVAudioTime timeWithSampleTime:atRate:](AVAudioTime, "timeWithSampleTime:atRate:", 0);
  objc_super v5 = [(AVAudioPlayerNode *)self->_playerNode nodeTimeForPlayerTime:v4];
  id v6 = +[AVAudioSession sharedInstance];
  [v6 inputLatency];
  double v8 = v7;
  voiceIsolationNode = self->_voiceIsolationNode;
  if (voiceIsolationNode)
  {
    [(AVAudioUnitEffect *)voiceIsolationNode latency];
    double v11 = v10;
    id v12 = OSLogForCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      sub_10016AEF4();
    }

    double v8 = v8 + v11;
  }
  [v6 outputLatency];
  double v14 = v13;
  p_inputWriteLock = &self->_inputWriteLock;
  os_unfair_lock_lock(&self->_inputWriteLock);
  uint64_t v16 = [v5 rc_adjustedBySeconds:v8 + v14];
  p_playerStartTime = &self->_playerStartTime;
  double v18 = *p_playerStartTime;
  *p_playerStartTime = (AVAudioTime *)v16;

  os_unfair_lock_unlock(p_inputWriteLock);
  double v19 = OSLogForCategory();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
    sub_10016AE7C();
  }

  v20 = OSLogForCategory();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
    sub_10016AE04();
  }

  v21 = OSLogForCategory();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
    sub_10016AD8C();
  }
}

- (void)_scheduleFirstBuffer
{
  dispatch_group_t v3 = self->_playerNode;
  uint64_t v4 = [(NSEnumerator *)self->_playerBuffers nextObject];
  objc_super v5 = (void *)v4;
  if (v3) {
    BOOL v6 = v4 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (!v6)
  {
    objc_initWeak(&location, self);
    double v7 = _NSConcreteStackBlock;
    uint64_t v8 = 3221225472;
    id v9 = sub_10003FB30;
    double v10 = &unk_1002214D0;
    objc_copyWeak(&v11, &location);
    [(AVAudioPlayerNode *)v3 scheduleBuffer:v5 completionCallbackType:1 completionHandler:&v7];
    -[v3 prepareWithFrameCount:[v5 frameLength:v7, v8, v9, v10]];
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

- (BOOL)startAndReturnError:(id *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)VMRecordingEngine;
  BOOL v4 = [(VMRecordingEngine *)&v9 startAndReturnError:a3];
  if (v4)
  {
    objc_super v5 = OSLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v11 = "-[VMRecordingEngine startAndReturnError:]";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s -- Recording engine started", buf, 0xCu);
    }

    playerNode = self->_playerNode;
    if (playerNode)
    {
      double v7 = playerNode;
      [(VMRecordingEngine *)self _scheduleFirstBuffer];
      sub_10003FB7C((id *)&self->super.super.isa);
    }
  }
  sub_10003D4EC((id *)&self->super.super.isa);
  return v4;
}

- (void)pause
{
  v3.receiver = self;
  v3.super_class = (Class)VMRecordingEngine;
  [(VMRecordingEngine *)&v3 pause];
  sub_10003D4EC((id *)&self->super.super.isa);
}

- (void)reset
{
  v3.receiver = self;
  v3.super_class = (Class)VMRecordingEngine;
  [(VMRecordingEngine *)&v3 reset];
  sub_10003D4EC((id *)&self->super.super.isa);
}

- (void)stop
{
  v3.receiver = self;
  v3.super_class = (Class)VMRecordingEngine;
  [(VMRecordingEngine *)&v3 stop];
  sub_10003D4EC((id *)&self->super.super.isa);
}

- (OS_dispatch_group)group
{
  return self->_group;
}

- (RCSAudioFile)assetWriter
{
  return self->_assetWriter;
}

- (void)setAssetWriter:(id)a3
{
}

- (NSMutableDictionary)audioSettings
{
  return self->_audioSettings;
}

- (int64_t)frameCount
{
  return self->_frameCount;
}

- (void)setFrameCount:(int64_t)a3
{
  self->_double frameCount = a3;
}

- (double)punchInTime
{
  return self->_punchInTime;
}

- (void)setPunchInTime:(double)a3
{
  self->_punchInTime = a3;
}

- (double)punchOutTime
{
  return self->_punchOutTime;
}

- (void)setPunchOutTime:(double)a3
{
  self->_punchOutTime = a3;
}

- (VMRecordingController)controller
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);

  return (VMRecordingController *)WeakRetained;
}

- (BOOL)internalRecording
{
  return self->_internalRecording;
}

- (void)setInternalRecording:(BOOL)a3
{
  self->_internalRecording = a3;
}

- (AVAudioTime)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(id)a3
{
}

- (double)stopTime
{
  return self->_stopTime;
}

- (void)setStopTime:(double)a3
{
  self->_stopTime = a3;
}

- (OS_dispatch_group)stopGroup
{
  return self->_stopGroup;
}

- (void)setStopGroup:(id)a3
{
}

- (NSMutableArray)inputBufferQueue
{
  return self->_inputBufferQueue;
}

- (void)setInputBufferQueue:(id)a3
{
}

- (os_unfair_lock_s)inputWriteLock
{
  return self->_inputWriteLock;
}

- (void)setInputWriteLock:(os_unfair_lock_s)a3
{
  self->_inputWriteLock = a3;
}

- (BOOL)stopTimeReached
{
  return self->_stopTimeReached;
}

- (void)setStopTimeReached:(BOOL)a3
{
  self->_stopTimeReached = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputBufferQueue, 0);
  objc_storeStrong((id *)&self->_stopGroup, 0);
  objc_storeStrong((id *)&self->_startTime, 0);
  objc_destroyWeak((id *)&self->_controller);
  objc_storeStrong((id *)&self->_audioSettings, 0);
  objc_storeStrong((id *)&self->_assetWriter, 0);
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong(&self->_recordingBlock, 0);
  objc_storeStrong((id *)&self->_voiceIsolationNode, 0);
  objc_storeStrong((id *)&self->_overdubBuffers, 0);
  objc_storeStrong((id *)&self->_playerStartTime, 0);
  objc_storeStrong((id *)&self->_playerBuffers, 0);
  objc_storeStrong((id *)&self->_playerNode, 0);
  objc_storeStrong((id *)&self->_conversionBuffer, 0);
  objc_storeStrong((id *)&self->_audioConverter, 0);

  objc_storeStrong((id *)&self->_waveformGenerator, 0);
}

@end