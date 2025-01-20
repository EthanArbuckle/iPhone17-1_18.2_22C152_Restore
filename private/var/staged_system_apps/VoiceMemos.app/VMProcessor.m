@interface VMProcessor
- (AudioStreamBasicDescription)debounceASBD;
- (BOOL)_configureDSPGraphsWithFormat:(id *)a3;
- (BOOL)_prepareWithFormat:(AudioStreamBasicDescription *)a3 maxFramesPerRender:(unsigned int)a4 error:(id *)a5;
- (BOOL)enabled;
- (OS_dispatch_queue)preparationQueue;
- (VMProcessor)init;
- (id)initForRealTime:(BOOL)a3;
- (unsigned)debounceMaxFrames;
- (void)_performAsynchronousRenderSensitiveAction:(id)a3;
- (void)_registerInternalAudioUnits;
- (void)_setDSPGraphParameter:(float)a3 address:(unsigned int)a4;
- (void)_unprepare;
- (void)_updateParameterForAddress:(id)a3;
- (void)dealloc;
- (void)prepareWithFormat:(AudioStreamBasicDescription *)a3 maxFramesPerRender:(unsigned int)a4;
- (void)setDebounceASBD:(AudioStreamBasicDescription *)a3;
- (void)setDebounceMaxFrames:(unsigned int)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setPreparationQueue:(id)a3;
- (void)unprepare;
@end

@implementation VMProcessor

- (VMProcessor)init
{
  return (VMProcessor *)[(VMProcessor *)self initForRealTime:1];
}

- (id)initForRealTime:(BOOL)a3
{
  BOOL v3 = a3;
  v12.receiver = self;
  v12.super_class = (Class)VMProcessor;
  v4 = [(VMProcessor *)&v12 init];
  v5 = v4;
  if (v4)
  {
    v4->_realTime = v3;
    if (v3)
    {
      pthread_mutex_init(&v4->_renderLock, 0);
      dispatch_queue_t v6 = dispatch_queue_create("com.apple.VoiceMemos.VMProcessorQueue", 0);
      preparationQueue = v5->_preparationQueue;
      v5->_preparationQueue = (OS_dispatch_queue *)v6;

      v8 = v5->_preparationQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100050C80;
      block[3] = &unk_100221278;
      v11 = v5;
      dispatch_async(v8, block);
    }
    else
    {
      [(VMProcessor *)v4 _registerInternalAudioUnits];
    }
  }
  return v5;
}

- (void)dealloc
{
  [(VMProcessor *)self _unprepare];
  if (self->_realTime) {
    pthread_mutex_destroy(&self->_renderLock);
  }
  v3.receiver = self;
  v3.super_class = (Class)VMProcessor;
  [(VMProcessor *)&v3 dealloc];
}

- (void)prepareWithFormat:(AudioStreamBasicDescription *)a3 maxFramesPerRender:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  if ([(VMProcessor *)self debounceMaxFrames] != a4
    || ([(VMProcessor *)self debounceASBD],
        long long v7 = *(_OWORD *)&a3->mBytesPerPacket,
        v17[0] = *(_OWORD *)&a3->mSampleRate,
        v17[1] = v7,
        uint64_t v18 = *(void *)&a3->mBitsPerChannel,
        !sub_10009D778((uint64_t)v17, (uint64_t)v19)))
  {
    [(VMProcessor *)self setDebounceMaxFrames:v4];
    long long v8 = *(_OWORD *)&a3->mBytesPerPacket;
    v15[0] = *(_OWORD *)&a3->mSampleRate;
    v15[1] = v8;
    uint64_t v16 = *(void *)&a3->mBitsPerChannel;
    [(VMProcessor *)self setDebounceASBD:v15];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    long long v9 = *(_OWORD *)&a3->mBytesPerPacket;
    long long v11 = *(_OWORD *)&a3->mSampleRate;
    long long v12 = v9;
    v10[2] = sub_100050DEC;
    v10[3] = &unk_100221988;
    v10[4] = self;
    uint64_t v13 = *(void *)&a3->mBitsPerChannel;
    int v14 = v4;
    [(VMProcessor *)self _performAsynchronousRenderSensitiveAction:v10];
  }
}

- (void)unprepare
{
  *(void *)&self->_debounceASBD.mBitsPerChannel = 0;
  *(_OWORD *)&self->_debounceASBD.mSampleRate = 0u;
  *(_OWORD *)&self->_debounceASBD.mBytesPerPacket = 0u;
  self->_debounceMaxFrames = 0;
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100050FD4;
  v2[3] = &unk_100221278;
  v2[4] = self;
  [(VMProcessor *)self _performAsynchronousRenderSensitiveAction:v2];
}

- (BOOL)_prepareWithFormat:(AudioStreamBasicDescription *)a3 maxFramesPerRender:(unsigned int)a4 error:(id *)a5
{
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_1000512C0;
  v28[3] = &unk_1002219B0;
  v28[4] = self;
  long long v9 = objc_retainBlock(v28);
  p_ioFormat = &self->_ioFormat;
  long long v11 = *(_OWORD *)&a3->mSampleRate;
  long long v12 = *(_OWORD *)&a3->mBytesPerPacket;
  *(void *)&self->_ioFormat.mBitsPerChannel = *(void *)&a3->mBitsPerChannel;
  *(_OWORD *)&self->_ioFormat.mBytesPerPacket = v12;
  *(_OWORD *)&self->_ioFormat.double mSampleRate = v11;
  self->_maxFramesPerRender = a4;
  self->_timestamp.mFlags |= 1u;
  int v13 = 2;
  do
  {
    unsigned int v14 = v13;
    v13 *= 2;
  }
  while (v14 < ((double)a3->mSampleRate * 0.01));
  self->_preferredBufferSize = v14;
  self->_utilityBuffer = (AudioBufferList *)sub_10009D8E4(a3->mChannelsPerFrame, a4);
  float v15 = 1.0;
  if (!self->_enabled) {
    float v15 = 0.0;
  }
  float v16 = 1.0 / (a3->mSampleRate * 0.0500000007);
  self->_processedToCleanRatio = v15;
  self->_crossfadeIncrement = v16;
  if ([(VMProcessor *)self _configureDSPGraphsWithFormat:a5])
  {
    sub_10009D804(&self->_utilityBuffer->mNumberBuffers, self->_ioFormat.mChannelsPerFrame, self->_maxFramesPerRender, 1);
    sub_1000512E0((uint64_t)self, self->_maxFramesPerRender, (uint64_t)self->_utilityBuffer);
    [(VMProcessor *)self _updateParameterForAddress:0];
    objc_initWeak(&location, self);
    v17 = (const char *)[@"com.apple.VoiceMemos.audioParameterUpdate" UTF8String];
    id v18 = &_dispatch_main_q;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1000513F4;
    handler[3] = &unk_1002219D8;
    objc_copyWeak(&v26, &location);
    notify_register_dispatch(v17, &self->_notifyToken, (dispatch_queue_t)&_dispatch_main_q, handler);

    double outData = 0.0;
    UInt32 ioDataSize = 8;
    if (AudioUnitGetProperty(*self->_dspGraphs, 0xCu, 0, 0, &outData, &ioDataSize))
    {
      unsigned int v19 = 3 * self->_preferredBufferSize;
      double mSampleRate = self->_ioFormat.mSampleRate;
    }
    else
    {
      double mSampleRate = p_ioFormat->mSampleRate;
      unsigned int v19 = vcvtad_u64_f64(outData * p_ioFormat->mSampleRate);
    }
    self->_graphLatencyInFrames = v19;
    self->_primingFadeInDurationFrames = (mSampleRate * 0.200000003);
    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
    char v21 = 1;
  }
  else
  {
    char v21 = ((uint64_t (*)(void *))v9[2])(v9);
  }

  return v21;
}

- (void)_updateParameterForAddress:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (qword_10026A760 == -1)
  {
    if (v4) {
      goto LABEL_3;
    }
  }
  else
  {
    dispatch_once(&qword_10026A760, &stru_1002219F8);
    if (v5)
    {
LABEL_3:
      dispatch_queue_t v6 = [(id)qword_10026A758 objectForKeyedSubscript:v5];
      long long v7 = v6;
      if (v6)
      {
        [v6 currentValue];
        int v9 = v8;
        id v10 = [v7 address];
        LODWORD(v11) = v9;
        [(VMProcessor *)self _setDSPGraphParameter:v10 address:v11];
      }
      goto LABEL_13;
    }
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v7 = [qword_10026A758 allValues];
  id v12 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v22;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v22 != v14) {
          objc_enumerationMutation(v7);
        }
        float v16 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        [v16 currentValue];
        int v18 = v17;
        id v19 = [v16 address];
        LODWORD(v20) = v18;
        [(VMProcessor *)self _setDSPGraphParameter:v19 address:v20];
      }
      id v13 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v13);
  }
LABEL_13:
}

- (void)_setDSPGraphParameter:(float)a3 address:(unsigned int)a4
{
  if (self->_dspGraphs && self->_ioFormat.mChannelsPerFrame)
  {
    unint64_t v7 = 0;
    do
      AudioUnitSetParameter(self->_dspGraphs[v7++], a4, 0, 0, a3, 0);
    while (v7 < self->_ioFormat.mChannelsPerFrame);
  }
}

- (void)_unprepare
{
  dspGraphs = self->_dspGraphs;
  if (dspGraphs)
  {
    unint64_t mChannelsPerFrame = self->_ioFormat.mChannelsPerFrame;
    if (!mChannelsPerFrame) {
      goto LABEL_8;
    }
    for (unint64_t i = 0; i < mChannelsPerFrame; ++i)
    {
      dispatch_queue_t v6 = self->_dspGraphs[i];
      if (v6)
      {
        AudioUnitUninitialize(v6);
        AudioComponentInstanceDispose(self->_dspGraphs[i]);
        unint64_t mChannelsPerFrame = self->_ioFormat.mChannelsPerFrame;
      }
    }
    dspGraphs = self->_dspGraphs;
    if (dspGraphs) {
LABEL_8:
    }
      free(dspGraphs);
  }
  utilityBuffer = (void **)self->_utilityBuffer;
  if (utilityBuffer) {
    sub_10009D964(utilityBuffer, self->_ioFormat.mChannelsPerFrame);
  }
  int notifyToken = self->_notifyToken;
  if (notifyToken) {
    notify_cancel(notifyToken);
  }
  self->_int notifyToken = 0;
  self->_dspGraphs = 0;
  self->_maxFramesPerRender = 0;
  self->_utilityBuffer = 0;
  *(_OWORD *)&self->_ioFormat.double mSampleRate = 0u;
  *(_OWORD *)&self->_ioFormat.mBytesPerPacket = 0u;
  *(void *)&self->_ioFormat.mBitsPerChannel = 0;
  *(_OWORD *)&self->_timestamp.mSampleTime = 0u;
  *(_OWORD *)&self->_timestamp.mRateScalar = 0u;
  *(_OWORD *)&self->_timestamp.mSMPTETime.mSubframes = 0u;
  *(_OWORD *)&self->_timestamp.mSMPTETime.mHours = 0u;
}

- (void)_performAsynchronousRenderSensitiveAction:(id)a3
{
  id v4 = (void (**)(void))a3;
  v5 = v4;
  if (self->_realTime)
  {
    preparationQueue = self->_preparationQueue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100051954;
    v7[3] = &unk_100221A20;
    v7[4] = self;
    int v8 = v4;
    dispatch_async(preparationQueue, v7);
  }
  else
  {
    v4[2](v4);
  }
}

- (BOOL)_configureDSPGraphsWithFormat:(id *)a3
{
  double mSampleRate = self->_ioFormat.mSampleRate;
  long long v51 = *(_OWORD *)&self->_ioFormat.mFormatID;
  size_t mChannelsPerFrame = self->_ioFormat.mChannelsPerFrame;
  UInt32 mBitsPerChannel = self->_ioFormat.mBitsPerChannel;
  UInt32 mReserved = self->_ioFormat.mReserved;
  int v8 = +[NSFileManager defaultManager];
  int v9 = NSTemporaryDirectory();
  id v10 = +[NSURL fileURLWithPath:v9];
  double v11 = [v8 URLForDirectory:99 inDomain:1 appropriateForURL:v10 create:1 error:a3];

  id v12 = [v11 path];
  id v13 = [v12 stringByAppendingPathComponent:@"tmp.dspg"];

  v49[0] = _NSConcreteStackBlock;
  v49[1] = 3221225472;
  v49[2] = sub_1000520A8;
  v49[3] = &unk_100221278;
  id v14 = v11;
  id v50 = v14;
  float v15 = objc_retainBlock(v49);
  inData = v13;
  if (+[VMDSPGraph writeGraphTextToFile:v13 samplerate:(int)mSampleRate bufferSize:self->_preferredBufferSize error:a3])
  {
    v35 = v13;
    float v16 = +[VMDSPGraph propertyStrip];
    v47 = v16;
    uint64_t v17 = +[VMDSPGraph auStrip];
    uint64_t v46 = v17;
    unsigned int outData = self->_preferredBufferSize;
    self->_dspGraphs = (OpaqueAudioComponentInstance **)malloc_type_calloc(mChannelsPerFrame, 8uLL, 0x2004093837F09uLL);
    v44[0] = sub_100052104;
    v44[1] = self;
    v36 = (void *)v17;
    if (mChannelsPerFrame)
    {
      signed int v18 = sub_10009D708(0x61756678u, 0x64737067u, self->_dspGraphs);
      BOOL v19 = 0;
      if (sub_10009D604(v18, a3))
      {
        id v34 = v14;
        uint64_t v20 = 1;
        unint64_t v21 = 1;
        do
        {
          OSStatus v22 = AudioUnitSetProperty(self->_dspGraphs[v20 - 1], 0x64737067u, 0, 0, &inData, 8u);
          if (!sub_10009D604(v22, a3)) {
            break;
          }
          OSStatus v23 = AudioUnitSetProperty(self->_dspGraphs[v20 - 1], 0x70727370u, 0, 0, &v47, 8u);
          if (!sub_10009D604(v23, a3)) {
            break;
          }
          OSStatus v24 = AudioUnitSetProperty(self->_dspGraphs[v20 - 1], 0x61757370u, 0, 0, &v46, 8u);
          if (!sub_10009D604(v24, a3)) {
            break;
          }
          signed int v25 = sub_10009DAF8(self->_dspGraphs[v20 - 1], &outData);
          if (!sub_10009D604(v25, a3)) {
            break;
          }
          id v26 = self->_dspGraphs[v20 - 1];
          double v38 = mSampleRate;
          long long v39 = v51;
          UInt32 v40 = mBitsPerChannel >> 3;
          int v41 = 1;
          UInt32 v42 = mBitsPerChannel;
          UInt32 v43 = mReserved;
          signed int v27 = sub_10009D758(v26, &v38, 1);
          if (!sub_10009D604(v27, a3)) {
            break;
          }
          v28 = self->_dspGraphs[v20 - 1];
          double v38 = mSampleRate;
          long long v39 = v51;
          UInt32 v40 = mBitsPerChannel >> 3;
          int v41 = 1;
          UInt32 v42 = mBitsPerChannel;
          UInt32 v43 = mReserved;
          signed int v29 = sub_10009D758(v28, &v38, 0);
          if (!sub_10009D604(v29, a3)
            || (OSStatus v30 = AudioUnitSetProperty(self->_dspGraphs[v20 - 1], 0x17u, 1u, 0, v44, 0x10u), !sub_10009D604(v30, a3)))
          {
            id v14 = v34;
            break;
          }
          OSStatus v31 = AudioUnitInitialize(self->_dspGraphs[v20 - 1]);
          id v14 = v34;
          if (!sub_10009D604(v31, a3)) {
            break;
          }
          if (mChannelsPerFrame == v20) {
            goto LABEL_17;
          }
          BOOL v19 = v21 >= mChannelsPerFrame;
          signed int v32 = sub_10009D708(0x61756678u, 0x64737067u, &self->_dspGraphs[v20++]);
          ++v21;
        }
        while (sub_10009D604(v32, a3));
      }
    }
    else
    {
LABEL_17:
      BOOL v19 = 1;
    }
    ((void (*)(void *))v15[2])(v15);

    id v13 = v35;
  }
  else
  {
    ((void (*)(void *))v15[2])(v15);
    BOOL v19 = 0;
  }

  return v19;
}

- (void)_registerInternalAudioUnits
{
  if (qword_10026A768 != -1) {
    dispatch_once(&qword_10026A768, &stru_100221A40);
  }
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (OS_dispatch_queue)preparationQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 256, 1);
}

- (void)setPreparationQueue:(id)a3
{
}

- (AudioStreamBasicDescription)debounceASBD
{
  *(void *)&retstr->UInt32 mBitsPerChannel = *(void *)&self[7].mBytesPerPacket;
  long long v3 = *(_OWORD *)&self[7].mSampleRate;
  *(_OWORD *)&retstr->double mSampleRate = *(_OWORD *)&self[6].mBytesPerFrame;
  *(_OWORD *)&retstr->mBytesPerPacket = v3;
  return self;
}

- (void)setDebounceASBD:(AudioStreamBasicDescription *)a3
{
  long long v3 = *(_OWORD *)&a3->mSampleRate;
  long long v4 = *(_OWORD *)&a3->mBytesPerPacket;
  *(void *)&self->_debounceASBD.UInt32 mBitsPerChannel = *(void *)&a3->mBitsPerChannel;
  *(_OWORD *)&self->_debounceASBD.double mSampleRate = v3;
  *(_OWORD *)&self->_debounceASBD.mBytesPerPacket = v4;
}

- (unsigned)debounceMaxFrames
{
  return self->_debounceMaxFrames;
}

- (void)setDebounceMaxFrames:(unsigned int)a3
{
  self->_debounceMaxFrames = a3;
}

- (void).cxx_destruct
{
}

@end