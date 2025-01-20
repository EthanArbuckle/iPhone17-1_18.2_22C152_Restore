@interface VMAudioOutputRenderer
- (BOOL)enhanceEnabled;
- (BOOL)isPlaying;
- (BOOL)isPrepared;
- (BOOL)prepareToRender:(id)a3 inputBlock:(id)a4 error:(id *)a5;
- (BOOL)startAndReturnError:(id *)a3;
- (OpaqueAudioComponentInstance)_createTimeStretch:(AudioStreamBasicDescription *)a3 maxFramesPerRender:(unsigned int)a4 error:(id *)a5;
- (VMAudioOutputRenderer)initWithQueue:(id)a3;
- (VMAudioOutputRendererDelegate)delegate;
- (double)currentSampleTime;
- (double)sampleRate;
- (float)rate;
- (id).cxx_construct;
- (id)_createPollingBlock:(id)a3;
- (id)_createQueue:(BOOL)a3;
- (id)_sourceNodeInputBlock;
- (unsigned)channelCount;
- (void)_handleAVAudioEngineConfigurationChangeNotification:(id)a3;
- (void)_prepareAudioUnits:(AudioStreamBasicDescription *)a3 maxFramesPerRender:(unsigned int)a4;
- (void)_prepareRenderChainIfNeeded;
- (void)_resetRenderTimes;
- (void)_resetTimeStretchAudioUnit;
- (void)_tearDownTimeStretch;
- (void)dealloc;
- (void)pause;
- (void)prepare;
- (void)registerNotifications;
- (void)reset;
- (void)sendEmptyQueueSignal;
- (void)setDelegate:(id)a3;
- (void)setEnhanceEnabled:(BOOL)a3;
- (void)setRate:(float)a3;
- (void)setSampleOffset:(double)a3;
- (void)setShouldRenderSilenceOnEmptyQueue:(BOOL)a3;
- (void)startPollingTimer:(double)a3;
- (void)stopPollingTimer;
- (void)unprepare;
@end

@implementation VMAudioOutputRenderer

- (VMAudioOutputRenderer)initWithQueue:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)VMAudioOutputRenderer;
  v5 = [(VMAudioOutputRenderer *)&v15 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_new();
    audioEngine = v5->_audioEngine;
    v5->_audioEngine = (AVAudioEngine *)v6;

    if (v4)
    {
      v8 = (OS_dispatch_queue *)v4;
    }
    else
    {
      v8 = [(VMAudioOutputRenderer *)v5 _createQueue:1];
    }
    inputPollingQueue = v5->_inputPollingQueue;
    v5->_inputPollingQueue = v8;

    uint64_t v10 = objc_opt_new();
    mixerNode = v5->_mixerNode;
    v5->_mixerNode = (AVAudioMixerNode *)v10;

    v5->_renderLock._os_unfair_lock_opaque = 0;
    [(AVAudioEngine *)v5->_audioEngine attachNode:v5->_mixerNode];
    v5->_timeStretchRate = 1.0;
    v12 = [[VMProcessor alloc] initForRealTime:1];
    enhanceProcessor = v5->_enhanceProcessor;
    v5->_enhanceProcessor = v12;

    [(VMAudioOutputRenderer *)v5 registerNotifications];
  }

  return v5;
}

- (id)_createQueue:(BOOL)a3
{
  if (a3)
  {
    v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, -1);
  }
  else
  {
    v3 = 0;
  }
  dispatch_queue_t v4 = dispatch_queue_create("VMAudioOutputRenderer.pollingQueue", v3);

  return v4;
}

- (void)dealloc
{
  [(VMAudioOutputRenderer *)self unprepare];
  v3.receiver = self;
  v3.super_class = (Class)VMAudioOutputRenderer;
  [(VMAudioOutputRenderer *)&v3 dealloc];
}

- (void)unprepare
{
  if ([(AVAudioEngine *)self->_audioEngine isRunning]) {
    [(AVAudioEngine *)self->_audioEngine stop];
  }
  if (self->_sourceNode)
  {
    -[AVAudioEngine detachNode:](self->_audioEngine, "detachNode:");
    sourceNode = self->_sourceNode;
    self->_sourceNode = 0;
  }
  processingFormat = self->_processingFormat;
  self->_processingFormat = 0;

  id inputPollingBlock = self->_inputPollingBlock;
  self->_id inputPollingBlock = 0;

  double v6 = sub_100049BC0((uint64_t)&self->_ringBuffer);

  [(VMAudioOutputRenderer *)self _tearDownTimeStretch];
}

- (void)_tearDownTimeStretch
{
  timeStretchAudiounit = self->_timeStretchAudiounit;
  if (timeStretchAudiounit)
  {
    AudioUnitUninitialize(timeStretchAudiounit);
    AudioComponentInstanceDispose(self->_timeStretchAudiounit);
    self->_timeStretchAudiounit = 0;
  }
}

- (BOOL)prepareToRender:(id)a3 inputBlock:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  [(VMAudioOutputRenderer *)self unprepare];
  unsigned __int8 v11 = [v9 isStandard];
  if (v11)
  {
    objc_storeStrong((id *)&self->_processingFormat, a3);
    self->_maxBufferFill = 12288;
    v12 = [(VMAudioOutputRenderer *)self _createPollingBlock:v10];
    id inputPollingBlock = self->_inputPollingBlock;
    self->_id inputPollingBlock = v12;

    sub_10005C1EC((uint64_t)&self->_ringBuffer, 2 * self->_maxBufferFill, (int)[v9 channelCount], 0);
  }
  else if (a5)
  {
    NSErrorUserInfoKey v16 = NSLocalizedDescriptionKey;
    CFStringRef v17 = @"VMAudioOutputRenderer must use deinterleaved float PCM format";
    v14 = +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
    *a5 = +[NSError errorWithDomain:RCVoiceMemosErrorDomain code:1 userInfo:v14];
  }
  return v11;
}

- (void)_prepareRenderChainIfNeeded
{
  if (!self->_processingFormat)
  {
    uint64_t v4 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/VoiceMemos/Application/AudioServices/AudioPlayer/VMAudioOutputRenderer.mm"];
    v5 = (void *)v4;
    double v6 = @"<Unknown File>";
    if (v4) {
      double v6 = (__CFString *)v4;
    }
    v7 = v6;

    v8 = +[NSAssertionHandler currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:v7 lineNumber:144 description:@"prepareToRender must be called before _prepareRenderChainIfNeeded" 0 0 0 0 0];
  }
  if (!self->_sourceNode)
  {
    id v9 = objc_alloc((Class)AVAudioSourceNode);
    processingFormat = self->_processingFormat;
    unsigned __int8 v11 = [(VMAudioOutputRenderer *)self _sourceNodeInputBlock];
    v12 = (AVAudioSourceNode *)[v9 initWithFormat:processingFormat renderBlock:v11];
    sourceNode = self->_sourceNode;
    self->_sourceNode = v12;

    [(AVAudioEngine *)self->_audioEngine attachNode:self->_sourceNode];
    [(AVAudioEngine *)self->_audioEngine connect:self->_sourceNode to:self->_mixerNode format:self->_processingFormat];
    v14 = [(VMAudioOutputRenderer *)self delegate];
    objc_super v15 = [v14 audioEngineOutputNodeAccessQueue];

    if (v15)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10005C4C8;
      block[3] = &unk_100221CD8;
      block[4] = self;
      dispatch_sync(v15, block);
    }
    else
    {
      audioEngine = self->_audioEngine;
      mixerNode = self->_mixerNode;
      v18 = [(AVAudioEngine *)audioEngine outputNode];
      [(AVAudioEngine *)audioEngine connect:mixerNode to:v18 format:0];
    }
    [(AVAudioEngine *)self->_audioEngine prepare];
    v19 = [(AVAudioSourceNode *)self->_sourceNode AUAudioUnit];
    unsigned int v20 = [v19 maximumFramesToRender];

    v21 = [(AVAudioFormat *)self->_processingFormat streamDescription];
    if (v20 <= 0x1000) {
      uint64_t v22 = 4096;
    }
    else {
      uint64_t v22 = v20;
    }
    long long v23 = *(_OWORD *)&v21->mSampleRate;
    long long v24 = *(_OWORD *)&v21->mBytesPerPacket;
    uint64_t v26 = *(void *)&v21->mBitsPerChannel;
    v25[0] = v23;
    v25[1] = v24;
    [(VMAudioOutputRenderer *)self _prepareAudioUnits:v25 maxFramesPerRender:v22];
  }
}

- (void)_prepareAudioUnits:(AudioStreamBasicDescription *)a3 maxFramesPerRender:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  [(VMAudioOutputRenderer *)self _tearDownTimeStretch];
  long long v7 = *(_OWORD *)&a3->mBytesPerPacket;
  v16[0] = *(_OWORD *)&a3->mSampleRate;
  v16[1] = v7;
  uint64_t v17 = *(void *)&a3->mBitsPerChannel;
  id v15 = 0;
  v8 = [(VMAudioOutputRenderer *)self _createTimeStretch:v16 maxFramesPerRender:v4 error:&v15];
  id v9 = v15;
  self->_timeStretchAudiounit = v8;
  if (!v8)
  {
    id v10 = OSLogForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      sub_10016B3AC((uint64_t)v9, v10);
    }
  }
  if (self->_timeStretchRate != 1.0) {
    -[VMAudioOutputRenderer setRate:](self, "setRate:");
  }
  enhanceProcessor = self->_enhanceProcessor;
  long long v12 = *(_OWORD *)&a3->mBytesPerPacket;
  v13[0] = *(_OWORD *)&a3->mSampleRate;
  v13[1] = v12;
  uint64_t v14 = *(void *)&a3->mBitsPerChannel;
  [(VMProcessor *)enhanceProcessor prepareWithFormat:v13 maxFramesPerRender:v4];
}

- (void)sendEmptyQueueSignal
{
  dispatch_time_t v3 = dispatch_time(0, 100000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005C6E8;
  block[3] = &unk_100221CD8;
  block[4] = self;
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)registerNotifications
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"_handleAVAudioEngineConfigurationChangeNotification:" name:AVAudioEngineConfigurationChangeNotification object:self->_audioEngine];
}

- (void)_handleAVAudioEngineConfigurationChangeNotification:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005C848;
  block[3] = &unk_100221CD8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (BOOL)startAndReturnError:(id *)a3
{
  if (self->_processingFormat)
  {
    [(VMAudioOutputRenderer *)self _prepareRenderChainIfNeeded];
    if ([(AVAudioEngine *)self->_audioEngine isRunning])
    {
LABEL_5:
      LOBYTE(v6) = 1;
      return v6;
    }
    [(VMAudioOutputRenderer *)self currentSampleTime];
    self->_playbackSampleIndexAtSeek = (unint64_t)v5;
    self->_playbackSampleIndexAtStart = (unint64_t)v5;
    [(VMAudioOutputRenderer *)self _resetRenderTimes];
    [(VMAudioOutputRenderer *)self _resetTimeStretchAudioUnit];
    BOOL v6 = [(AVAudioEngine *)self->_audioEngine startAndReturnError:a3];
    if (v6)
    {
      long long v7 = +[AVAudioSession sharedInstance];
      [v7 IOBufferDuration];
      -[VMAudioOutputRenderer startPollingTimer:](self, "startPollingTimer:");

      goto LABEL_5;
    }
  }
  else
  {
    if (a3)
    {
      NSErrorUserInfoKey v10 = NSLocalizedDescriptionKey;
      CFStringRef v11 = @"VMAudioOutputRenderer - prepareToRender must be called before starting render";
      v8 = +[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];
      *a3 = +[NSError errorWithDomain:RCVoiceMemosErrorDomain code:1 userInfo:v8];
    }
    LOBYTE(v6) = 0;
  }
  return v6;
}

- (void)_resetRenderTimes
{
  self->_hostTimeAtRenderStart = 0;
  self->_sampleTimeAtRenderStart = 0.0;
  self->_framesOfSilenceOffset = 0;
  *(_WORD *)&self->_shouldSignalQueueEmpty = 0;
  p_renderLock = &self->_renderLock;
  os_unfair_lock_lock(&self->_renderLock);
  self->_framesOfSilenceRendered = 0;
  self->_renderSampleTime = 0.0;
  self->_renderRateScalar = 0.0;
  self->_renderHostTime = 0;

  os_unfair_lock_unlock(p_renderLock);
}

- (void)_resetTimeStretchAudioUnit
{
  timeStretchAudiounit = self->_timeStretchAudiounit;
  if (timeStretchAudiounit) {
    AudioUnitReset(timeStretchAudiounit, 0, 0);
  }
}

- (void)startPollingTimer:(double)a3
{
  if (self->_inputPollingBlock)
  {
    uint64_t v4 = [[VMDispatchTimer alloc] init:self->_inputPollingQueue leeway:self->_inputPollingBlock queue:a3 block:a3 * 0.5];
    inputPollingTimer = self->_inputPollingTimer;
    self->_inputPollingTimer = v4;
  }
}

- (void)stopPollingTimer
{
  inputPollingTimer = self->_inputPollingTimer;
  self->_inputPollingTimer = 0;
}

- (unsigned)channelCount
{
  return [(AVAudioFormat *)self->_processingFormat channelCount];
}

- (double)sampleRate
{
  [(AVAudioFormat *)self->_processingFormat sampleRate];
  return result;
}

- (BOOL)isPlaying
{
  return [(AVAudioEngine *)self->_audioEngine isRunning];
}

- (BOOL)isPrepared
{
  signed int v2 = atomic_load((unsigned int *)&self->_ringBuffer.mFill);
  return v2 > 0;
}

- (double)currentSampleTime
{
  p_renderLock = &self->_renderLock;
  os_unfair_lock_lock(&self->_renderLock);
  unint64_t renderHostTime = self->_renderHostTime;
  double renderSampleTime = self->_renderSampleTime;
  double renderRateScalar = self->_renderRateScalar;
  unint64_t framesOfSilenceOffset = self->_framesOfSilenceOffset;
  os_unfair_lock_unlock(p_renderLock);
  if (!renderHostTime || renderRateScalar == 0.0) {
    return (double)self->_playbackSampleIndexAtSeek;
  }
  uint64_t v8 = mach_absolute_time();
  if (qword_10026A780 != -1) {
    dispatch_once(&qword_10026A780, &stru_100221D40);
  }
  double v9 = *(double *)&qword_10026A778 * (double)(uint64_t)(v8 - renderHostTime);
  double v10 = renderSampleTime
      - self->_sampleTimeAtRenderStart
      + (double)self->_playbackSampleIndexAtStart
      - (double)framesOfSilenceOffset;
  [(AVAudioFormat *)self->_processingFormat sampleRate];
  double result = v10 + v9 * v11 / renderRateScalar;
  if (result <= (double)self->_playbackSampleIndexAtSeek) {
    return (double)self->_playbackSampleIndexAtSeek;
  }
  return result;
}

- (void)setSampleOffset:(double)a3
{
  self->_playbackSampleIndexAtSeek = (unint64_t)a3;
}

- (void)setShouldRenderSilenceOnEmptyQueue:(BOOL)a3
{
  self->_shouldRenderSilenceOnEmptyQueue = a3;
}

- (void)reset
{
  [(VMAudioOutputRenderer *)self pause];
  int v3 = atomic_load((unsigned int *)&self->_ringBuffer.mFill);

  sub_10004A1D0((uint64_t)&self->_ringBuffer, v3);
}

- (void)pause
{
  [(VMAudioOutputRenderer *)self currentSampleTime];
  self->_playbackSampleIndexAtSeek = (unint64_t)v3;
  [(AVAudioEngine *)self->_audioEngine pause];
  [(VMAudioOutputRenderer *)self stopPollingTimer];

  [(VMAudioOutputRenderer *)self _resetRenderTimes];
}

- (void)prepare
{
  signed int v2 = (void (**)(void))objc_retainBlock(self->_inputPollingBlock);
  if (v2) {
    v2[2]();
  }
}

- (id)_createPollingBlock:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10005CE28;
  v8[3] = &unk_100221D00;
  objc_copyWeak(&v10, &location);
  id v9 = v4;
  id v5 = v4;
  BOOL v6 = objc_retainBlock(v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

  return v6;
}

- (id)_sourceNodeInputBlock
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10005CFA4;
  v4[3] = &unk_100221D20;
  v4[4] = self;
  signed int v2 = objc_retainBlock(v4);

  return v2;
}

- (void)setRate:(float)a3
{
  self->_timeStretchRate = a3;
  timeStretchAudiounit = self->_timeStretchAudiounit;
  if (timeStretchAudiounit) {
    AudioUnitSetParameter(timeStretchAudiounit, 0, 0, 0, a3, 0);
  }
}

- (float)rate
{
  float result = self->_timeStretchRate;
  AudioUnitParameterValue outValue = result;
  timeStretchAudiounit = self->_timeStretchAudiounit;
  if (timeStretchAudiounit)
  {
    AudioUnitGetParameter(timeStretchAudiounit, 0, 0, 0, &outValue);
    return outValue;
  }
  return result;
}

- (void)setEnhanceEnabled:(BOOL)a3
{
}

- (BOOL)enhanceEnabled
{
  return [(VMProcessor *)self->_enhanceProcessor enabled];
}

- (OpaqueAudioComponentInstance)_createTimeStretch:(AudioStreamBasicDescription *)a3 maxFramesPerRender:(unsigned int)a4 error:(id *)a5
{
  inData[1] = self;
  AudioComponentInstance v23 = 0;
  inData[0] = sub_10005D010;
  signed int v8 = sub_10009D708(0x61756663u, 0x6970746Fu, &v23);
  BOOL v9 = sub_10009D604(v8, a5);
  float result = v23;
  if (v9)
  {
    signed int v11 = sub_10009DB34(v23, a4);
    if (!sub_10009D604(v11, a5)) {
      goto LABEL_8;
    }
    long long v12 = *(_OWORD *)&a3->mBytesPerPacket;
    v20[0] = *(_OWORD *)&a3->mSampleRate;
    v20[1] = v12;
    uint64_t v21 = *(void *)&a3->mBitsPerChannel;
    signed int v13 = sub_10009D758(v23, v20, 1);
    if (!sub_10009D604(v13, a5)) {
      goto LABEL_8;
    }
    long long v14 = *(_OWORD *)&a3->mBytesPerPacket;
    v18[0] = *(_OWORD *)&a3->mSampleRate;
    v18[1] = v14;
    uint64_t v19 = *(void *)&a3->mBitsPerChannel;
    signed int v15 = sub_10009D758(v23, v18, 0);
    if (sub_10009D604(v15, a5)
      && (OSStatus v16 = AudioUnitSetProperty(v23, 0x17u, 1u, 0, inData, 0x10u), sub_10009D604(v16, a5))
      && (OSStatus v17 = AudioUnitInitialize(v23), sub_10009D604(v17, a5)))
    {
      return v23;
    }
    else
    {
LABEL_8:
      AudioComponentInstanceDispose(v23);
      return 0;
    }
  }
  return result;
}

- (VMAudioOutputRendererDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (VMAudioOutputRendererDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_enhanceProcessor, 0);
  objc_storeStrong((id *)&self->_inputPollingTimer, 0);
  objc_storeStrong((id *)&self->_inputPollingQueue, 0);
  objc_storeStrong(&self->_inputPollingBlock, 0);
  objc_storeStrong((id *)&self->_processingFormat, 0);
  objc_storeStrong((id *)&self->_mixerNode, 0);
  objc_storeStrong((id *)&self->_sourceNode, 0);

  objc_storeStrong((id *)&self->_audioEngine, 0);
}

- (id).cxx_construct
{
  *((_DWORD *)self + 20) = 0;
  return self;
}

@end