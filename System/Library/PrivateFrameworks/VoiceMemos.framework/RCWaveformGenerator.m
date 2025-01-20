@interface RCWaveformGenerator
- (BOOL)_appendAveragePowerLevelsByDigestingWaveformSegments:(id)a3;
- (BOOL)_appendPowerMeterValuesFromDataInAudioFile:(id)a3 progressBlock:(id)a4;
- (BOOL)appendAveragePowerLevel:(float)a3;
- (BOOL)appendAveragePowerLevelsByDigestingAudioPCMBuffer:(id)a3;
- (BOOL)appendAveragePowerLevelsByDigestingContentsOfAudioFileURL:(id)a3 progressBlock:(id)a4;
- (BOOL)appendAveragePowerLevelsByDigestingSampleBuffer:(opaqueCMSampleBuffer *)a3;
- (BOOL)appendAveragePowerLevelsByDigestingWaveform:(id)a3;
- (BOOL)appendAveragePowerLevelsByDigestingWaveformSegments:(id)a3;
- (BOOL)canceled;
- (BOOL)finished;
- (BOOL)idle;
- (BOOL)loadable;
- (BOOL)paused;
- (RCWaveformGenerator)init;
- (RCWaveformGenerator)initWithSamplingParametersFromGenerator:(id)a3 trackIndex:(unint64_t)a4;
- (RCWaveformGenerator)initWithSegmentFlushInterval:(double)a3 trackIndex:(unint64_t)a4;
- (double)segmentFlushInterval;
- (id).cxx_construct;
- (id)synchronouslyApproximateWaveformForAVContentURL:(id)a3 byReadingCurrentFileAheadTimeRange:(id)a4;
- (int64_t)overviewUnitsPerSecond;
- (int64_t)state;
- (void)_appendAveragePowerLevel:(float)a3;
- (void)_appendAveragePowerLevelsByDigestingTimeRange:(id)a3 inAudioFile:(id)a4;
- (void)_appendPowerMeterValuesFromAudioPCMBuffer:(id)a3;
- (void)_appendPowerMeterValuesFromSampleBuffer:(opaqueCMSampleBuffer *)a3;
- (void)_onQueue_appendAveragePowerLevelsByDigestingTimeRange:(id)a3 inAudioFile:(id)a4;
- (void)_onQueue_appendPowerMeterValuesFromRawAudioData:(void *)a3 frameCount:(int64_t)a4 format:(const AudioStreamBasicDescription *)a5 isPredigest:(BOOL)a6;
- (void)_onQueue_appendSegment:(id)a3;
- (void)_onQueue_digestAveragePowerLevel:(float)a3;
- (void)_onQueue_flushRemainingData;
- (void)_onQueue_flushWaveformSegment:(id)a3;
- (void)_onQueue_flushWithNextSegmentWithEndTime:(double)a3 isPredigest:(BOOL)a4;
- (void)_onQueue_performInternalFinishedLoadingBlocksAndFinishObservers;
- (void)_onQueue_performLoadingFinishedBlock:(id)a3 internalBlockUUID:(id)a4 isTimeout:(BOOL)a5;
- (void)_onQueue_performObserversBlock:(id)a3;
- (void)_onQueue_pushAveragePowerLevel:(float)a3;
- (void)addSegmentOutputObserver:(id)a3;
- (void)async_finishLoadingByTerminating:(BOOL)a3 loadingFinishedBlockTimeout:(unint64_t)a4 loadingFinishedBlock:(id)a5;
- (void)beginLoading;
- (void)finishLoadingWithCompletionTimeout:(unint64_t)a3 completionBlock:(id)a4;
- (void)flushPendingCapturedSampleBuffers;
- (void)removeSegmentOutputObserver:(id)a3;
- (void)setCanceled:(BOOL)a3;
- (void)setOverviewUnitsPerSecond:(int64_t)a3;
- (void)setPaused:(BOOL)a3;
- (void)terminateLoadingImmediately;
@end

@implementation RCWaveformGenerator

- (RCWaveformGenerator)init
{
  uint64_t v4 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/VoiceMemos_Framework/Framework/Waveform/RCWaveformGenerator.mm"];
  v5 = (void *)v4;
  v6 = @"<Unknown File>";
  if (v4) {
    v6 = (__CFString *)v4;
  }
  v7 = v6;

  v8 = [MEMORY[0x1E4F28B00] currentHandler];
  v9 = (objc_class *)objc_opt_class();
  v10 = NSStringFromClass(v9);
  [v8 handleFailureInMethod:a2, self, v7, 82, @"use the class specific designated initializer for %@", v10, 0, 0, 0, 0 object file lineNumber description];

  return 0;
}

- (RCWaveformGenerator)initWithSegmentFlushInterval:(double)a3 trackIndex:(unint64_t)a4
{
  v19.receiver = self;
  v19.super_class = (Class)RCWaveformGenerator;
  id v6 = [(RCWaveformGenerator *)&v19 init];
  if (v6)
  {
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.VoiceMemos.RCWaveformGenerator.queue", 0);
    v8 = (void *)*((void *)v6 + 3);
    *((void *)v6 + 3) = v7;

    dispatch_queue_set_specific(*((dispatch_queue_t *)v6 + 3), v6, v6, 0);
    dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
    v10 = (void *)*((void *)v6 + 2);
    *((void *)v6 + 2) = v9;

    dispatch_semaphore_signal(*((dispatch_semaphore_t *)v6 + 2));
    uint64_t v11 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    v12 = (void *)*((void *)v6 + 6);
    *((void *)v6 + 6) = v11;

    uint64_t v13 = [MEMORY[0x1E4F1CA48] array];
    v14 = (void *)*((void *)v6 + 7);
    *((void *)v6 + 7) = v13;

    uint64_t v15 = [MEMORY[0x1E4F1CA48] array];
    v16 = (void *)*((void *)v6 + 8);
    *((void *)v6 + 8) = v15;

    *((void *)v6 + 33) = 160;
    double v17 = 0.0333333333;
    if (a3 > 0.0) {
      double v17 = a3;
    }
    *((double *)v6 + 32) = v17;
    *((void *)v6 + 30) = a4;
  }
  return (RCWaveformGenerator *)v6;
}

- (RCWaveformGenerator)initWithSamplingParametersFromGenerator:(id)a3 trackIndex:(unint64_t)a4
{
  id v6 = (double *)a3;
  dispatch_queue_t v7 = [(RCWaveformGenerator *)self initWithSegmentFlushInterval:a4 trackIndex:v6[32]];
  if (v7) {
    -[RCWaveformGenerator setOverviewUnitsPerSecond:](v7, "setOverviewUnitsPerSecond:", [v6 overviewUnitsPerSecond]);
  }

  return v7;
}

- (void)addSegmentOutputObserver:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__RCWaveformGenerator_addSegmentOutputObserver___block_invoke;
  v7[3] = &unk_1E6495FD0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

uint64_t __48__RCWaveformGenerator_addSegmentOutputObserver___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 48) containsObject:*(void *)(a1 + 40)];
  if ((result & 1) == 0)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    id v4 = *(void **)(*(void *)(a1 + 32) + 48);
    return [v4 addObject:v3];
  }
  return result;
}

- (void)removeSegmentOutputObserver:(id)a3
{
  id v4 = a3;
  if (dispatch_get_specific(self) == self)
  {
    [(NSHashTable *)self->_weakObservers removeObject:v4];
  }
  else
  {
    queue = self->_queue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __51__RCWaveformGenerator_removeSegmentOutputObserver___block_invoke;
    v6[3] = &unk_1E6495FD0;
    v6[4] = self;
    id v7 = v4;
    dispatch_sync(queue, v6);
  }
}

uint64_t __51__RCWaveformGenerator_removeSegmentOutputObserver___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 48) removeObject:*(void *)(a1 + 40)];
}

- (void)flushPendingCapturedSampleBuffers
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__RCWaveformGenerator_flushPendingCapturedSampleBuffers__block_invoke;
  block[3] = &unk_1E6495FF8;
  block[4] = self;
  dispatch_sync(queue, block);
}

uint64_t __56__RCWaveformGenerator_flushPendingCapturedSampleBuffers__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onQueue_flushRemainingData");
}

- (BOOL)appendAveragePowerLevelsByDigestingSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  int v5 = _checkCanAppend(self, (objc_selector *)a2);
  if (v5) {
    [(RCWaveformGenerator *)self _appendPowerMeterValuesFromSampleBuffer:a3];
  }
  return v5;
}

- (BOOL)appendAveragePowerLevelsByDigestingAudioPCMBuffer:(id)a3
{
  id v5 = a3;
  char v6 = _checkCanAppend(self, (objc_selector *)a2);
  if (v6) {
    [(RCWaveformGenerator *)self _appendPowerMeterValuesFromAudioPCMBuffer:v5];
  }

  return v6;
}

- (BOOL)appendAveragePowerLevelsByDigestingContentsOfAudioFileURL:(id)a3 progressBlock:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (_checkCanAppend(self, (objc_selector *)a2))
  {
    dispatch_semaphore_t v9 = OSLogForCategory(@"Default");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v10 = [v7 path];
      -[RCWaveformGenerator appendAveragePowerLevelsByDigestingContentsOfAudioFileURL:progressBlock:](v10, v13, v9);
    }

    BOOL v11 = [(RCWaveformGenerator *)self _appendPowerMeterValuesFromDataInAudioFile:v7 progressBlock:v8];
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (BOOL)appendAveragePowerLevelsByDigestingWaveformSegments:(id)a3
{
  id v5 = a3;
  BOOL v6 = (_checkCanAppend(self, (objc_selector *)a2) & 1) != 0
    && [(RCWaveformGenerator *)self _appendAveragePowerLevelsByDigestingWaveformSegments:v5];

  return v6;
}

- (BOOL)appendAveragePowerLevel:(float)a3
{
  int v5 = _checkCanAppend(self, (objc_selector *)a2);
  if (v5)
  {
    *(float *)&double v6 = a3;
    [(RCWaveformGenerator *)self _appendAveragePowerLevel:v6];
  }
  return v5;
}

- (BOOL)appendAveragePowerLevelsByDigestingWaveform:(id)a3
{
  id v5 = a3;
  char v6 = _checkCanAppend(self, (objc_selector *)a2);
  if (v6)
  {
    id v7 = OSLogForCategory(@"Default");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[RCWaveformGenerator appendAveragePowerLevelsByDigestingWaveform:]((uint64_t)v5, v7);
    }

    id v8 = [v5 segmentsCopy];
    [(RCWaveformGenerator *)self _appendAveragePowerLevelsByDigestingWaveformSegments:v8];
  }
  return v6;
}

- (BOOL)loadable
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __31__RCWaveformGenerator_loadable__block_invoke;
  v5[3] = &unk_1E6496020;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __31__RCWaveformGenerator_loadable__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 8) == 0;
  return result;
}

- (BOOL)finished
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __31__RCWaveformGenerator_finished__block_invoke;
  v5[3] = &unk_1E6496020;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __31__RCWaveformGenerator_finished__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 8) == 3;
  return result;
}

- (BOOL)idle
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __27__RCWaveformGenerator_idle__block_invoke;
  v5[3] = &unk_1E6496020;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __27__RCWaveformGenerator_idle__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(*(void *)(result + 32) + 8);
  if (v1) {
    BOOL v2 = v1 == 3;
  }
  else {
    BOOL v2 = 1;
  }
  char v3 = v2;
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = v3;
  return result;
}

- (void)beginLoading
{
  v4[0] = 0;
  v4[1] = v4;
  v4[2] = 0x2020000000;
  char v5 = 1;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__RCWaveformGenerator_beginLoading__block_invoke;
  block[3] = &unk_1E6496070;
  block[4] = self;
  void block[5] = v4;
  block[6] = a2;
  dispatch_sync(queue, block);
  _Block_object_dispose(v4, 8);
}

void __35__RCWaveformGenerator_beginLoading__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 8))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    int64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
    if (v3 >= 2) {
      _assertInvalidStateMessage(&cfstr_BeginLoading.isa, v3, *(objc_selector **)(a1 + 48));
    }
  }
  else
  {
    *(void *)(v2 + 8) = 1;
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    char v5 = *(void **)(v4 + 224);
    *(void *)(v4 + 224) = 0;

    uint64_t v6 = *(void **)(a1 + 32);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __35__RCWaveformGenerator_beginLoading__block_invoke_2;
    v7[3] = &unk_1E6496048;
    v7[4] = v6;
    objc_msgSend(v6, "_onQueue_performObserversBlock:", v7);
  }
}

void __35__RCWaveformGenerator_beginLoading__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 waveformGeneratorWillBeginLoading:*(void *)(a1 + 32)];
  }
}

- (void)setPaused:(BOOL)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __33__RCWaveformGenerator_setPaused___block_invoke;
  void v4[3] = &unk_1E6496098;
  BOOL v5 = a3;
  v4[4] = self;
  dispatch_sync(queue, v4);
}

void __33__RCWaveformGenerator_setPaused___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(v1 + 232);
  if (*(unsigned char *)(a1 + 40))
  {
    *(void *)(v1 + 232) = v2 + 1;
    uint64_t v3 = *(void *)(a1 + 32);
    if (*(void *)(v3 + 232) == 1)
    {
      uint64_t v4 = *(NSObject **)(v3 + 16);
      dispatch_semaphore_wait(v4, 0xFFFFFFFFFFFFFFFFLL);
    }
  }
  else if (v2)
  {
    *(void *)(v1 + 232) = v2 - 1;
    BOOL v5 = *(NSObject **)(*(void *)(a1 + 32) + 16);
    dispatch_semaphore_signal(v5);
  }
  else
  {
    uint64_t v6 = OSLogForCategory(@"Default");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v7 = 136315138;
      uint64_t v8 = "-[RCWaveformGenerator setPaused:]_block_invoke";
      _os_log_impl(&dword_1C3964000, v6, OS_LOG_TYPE_INFO, "%s -- WARNING: Unbalanced setPaused: detected", (uint8_t *)&v7, 0xCu);
    }
  }
}

- (BOOL)paused
{
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __29__RCWaveformGenerator_paused__block_invoke;
  v5[3] = &unk_1E6496020;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __29__RCWaveformGenerator_paused__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 232) == 0;
  return result;
}

- (void)terminateLoadingImmediately
{
}

- (void)finishLoadingWithCompletionTimeout:(unint64_t)a3 completionBlock:(id)a4
{
}

- (void)async_finishLoadingByTerminating:(BOOL)a3 loadingFinishedBlockTimeout:(unint64_t)a4 loadingFinishedBlock:(id)a5
{
  char v9 = (void *)[a5 copy];
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __105__RCWaveformGenerator_async_finishLoadingByTerminating_loadingFinishedBlockTimeout_loadingFinishedBlock___block_invoke;
  block[3] = &unk_1E6496110;
  block[4] = self;
  id v13 = v9;
  BOOL v16 = a3;
  SEL v14 = a2;
  unint64_t v15 = a4;
  id v11 = v9;
  dispatch_async(queue, block);
}

void __105__RCWaveformGenerator_async_finishLoadingByTerminating_loadingFinishedBlockTimeout_loadingFinishedBlock___block_invoke(uint64_t a1)
{
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x3032000000;
  v27[3] = __Block_byref_object_copy_;
  v27[4] = __Block_byref_object_dispose_;
  id v28 = *(id *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 8) == 3)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    if (v3) {
      (*(void (**)(uint64_t, BOOL, void))(v3 + 16))(v3, *(unsigned char *)(v2 + 248) == 0, *(void *)(v2 + 224));
    }
  }
  else
  {
    dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
    BOOL v5 = [MEMORY[0x1E4F29128] UUID];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __105__RCWaveformGenerator_async_finishLoadingByTerminating_loadingFinishedBlockTimeout_loadingFinishedBlock___block_invoke_23;
    v22[3] = &unk_1E64960C0;
    v26 = v27;
    id v25 = *(id *)(a1 + 40);
    id v6 = v5;
    id v23 = v6;
    int v7 = v4;
    v24 = v7;
    uint64_t v8 = (void *)[v22 copy];
    [*(id *)(*(void *)(a1 + 32) + 56) addObject:v6];
    char v9 = *(void **)(*(void *)(a1 + 32) + 64);
    v10 = (void *)MEMORY[0x1C8778060](v8);
    [v9 addObject:v10];

    uint64_t v11 = *(void *)(a1 + 32);
    if (*(unsigned char *)(v11 + 248)) {
      BOOL v12 = 1;
    }
    else {
      BOOL v12 = *(unsigned char *)(a1 + 64) != 0;
    }
    *(unsigned char *)(v11 + 248) = v12;
    uint64_t v13 = *(void *)(a1 + 32);
    if (*(void *)(v13 + 8) != 2)
    {
      *(void *)(v13 + 8) = 2;
      if (_checkCanAppend(*(RCWaveformGenerator **)(a1 + 32), *(objc_selector **)(a1 + 48)))
      {
        objc_msgSend(*(id *)(a1 + 32), "_onQueue_flushRemainingData");
        objc_msgSend(*(id *)(a1 + 32), "_onQueue_performInternalFinishedLoadingBlocksAndFinishObservers");
      }
    }
    SEL v14 = dispatch_get_global_queue(0, 0);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __105__RCWaveformGenerator_async_finishLoadingByTerminating_loadingFinishedBlockTimeout_loadingFinishedBlock___block_invoke_2;
    v17[3] = &unk_1E64960E8;
    char v21 = *(unsigned char *)(a1 + 64);
    v18 = v7;
    id v19 = v8;
    uint64_t v20 = *(void *)(a1 + 56);
    unint64_t v15 = v7;
    id v16 = v8;
    dispatch_async(v14, v17);
  }
  _Block_object_dispose(v27, 8);
}

intptr_t __105__RCWaveformGenerator_async_finishLoadingByTerminating_loadingFinishedBlockTimeout_loadingFinishedBlock___block_invoke_23(void *a1, uint64_t a2)
{
  objc_msgSend(*(id *)(*(void *)(a1[7] + 8) + 40), "_onQueue_performLoadingFinishedBlock:internalBlockUUID:isTimeout:", a1[6], a1[4], a2);
  uint64_t v3 = a1[5];
  return dispatch_semaphore_signal(v3);
}

intptr_t __105__RCWaveformGenerator_async_finishLoadingByTerminating_loadingFinishedBlockTimeout_loadingFinishedBlock___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 56))
  {
    uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    intptr_t result = dispatch_semaphore_wait(*(dispatch_semaphore_t *)(a1 + 32), *(void *)(a1 + 48));
    if (!result) {
      return result;
    }
    uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  }
  return v2();
}

- (void)_onQueue_performLoadingFinishedBlock:(id)a3 internalBlockUUID:(id)a4 isTimeout:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = (void (**)(id, uint64_t, NSError *))a3;
  id v9 = a4;
  uint64_t v10 = [(NSMutableArray *)self->_internalFinishedLoadingBlockUUIDs indexOfObject:v9];
  if (v10 != 0x7FFFFFFFFFFFFFFFLL)
  {
    [(NSMutableArray *)self->_internalFinishedLoadingBlockUUIDs removeObjectAtIndex:v10];
    [(NSMutableArray *)self->_internalFinishedLoadingBlocks removeObjectAtIndex:v10];
  }
  if (v5)
  {
    uint64_t v11 = OSLogForCategory(@"Default");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v17 = 136315394;
      v18 = "-[RCWaveformGenerator _onQueue_performLoadingFinishedBlock:internalBlockUUID:isTimeout:]";
      __int16 v19 = 2112;
      uint64_t v20 = self;
      _os_log_impl(&dword_1C3964000, v11, OS_LOG_TYPE_INFO, "%s -- [FinishLoading] %@ WARNING: Encountered time out while trying to finish loading", (uint8_t *)&v17, 0x16u);
    }

    if (!self->_canceled && ![(NSMutableArray *)self->_internalFinishedLoadingBlockUUIDs count]) {
      [(RCWaveformGenerator *)self async_finishLoadingByTerminating:1 loadingFinishedBlockTimeout:0 loadingFinishedBlock:0];
    }
  }
  BOOL canceled = self->_canceled;
  uint64_t v13 = self->_loadingError;
  SEL v14 = v13;
  if (v8)
  {
    uint64_t v16 = !canceled && v13 == 0;
    v8[2](v8, v16, v13);
  }
}

- (void)_onQueue_performInternalFinishedLoadingBlocksAndFinishObservers
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)[(NSMutableArray *)self->_internalFinishedLoadingBlocks copy];
  dispatch_semaphore_t v4 = [(NSHashTable *)self->_weakObservers allObjects];
  [(NSMutableArray *)self->_internalFinishedLoadingBlocks removeAllObjects];
  [(NSMutableArray *)self->_internalFinishedLoadingBlockUUIDs removeAllObjects];
  self->_state = 3;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", &__block_literal_global, PowerMeter::Reset(&self->_samplePowerMeter));
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v10 + 1) + 8 * v8);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v9, "waveformGeneratorDidFinishLoading:error:", self, self->_loadingError, (void)v10);
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

uint64_t __86__RCWaveformGenerator__onQueue_performInternalFinishedLoadingBlocksAndFinishObservers__block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, void))(a2 + 16))(a2, 0);
}

- (void)_onQueue_performObserversBlock:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  dispatch_semaphore_t v4 = (void (**)(id, void))a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = self->_weakObservers;
  uint64_t v6 = [(NSHashTable *)v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v5);
        }
        v4[2](v4, *(void *)(*((void *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      uint64_t v6 = [(NSHashTable *)v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)_appendAveragePowerLevel:(float)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __48__RCWaveformGenerator__appendAveragePowerLevel___block_invoke;
  void v4[3] = &unk_1E6496158;
  v4[4] = self;
  float v5 = a3;
  dispatch_sync(queue, v4);
}

uint64_t __48__RCWaveformGenerator__appendAveragePowerLevel___block_invoke(uint64_t a1, double a2)
{
  LODWORD(a2) = *(_DWORD *)(a1 + 40);
  return objc_msgSend(*(id *)(a1 + 32), "_onQueue_pushAveragePowerLevel:", a2);
}

- (void)_appendPowerMeterValuesFromSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  FormatDescription = CMSampleBufferGetFormatDescription(a3);
  StreamBasicDescription = CMAudioFormatDescriptionGetStreamBasicDescription(FormatDescription);
  if (StreamBasicDescription)
  {
    uint64_t v7 = StreamBasicDescription;
    size_t bufferListSizeNeededOut = 0;
    if (!CMSampleBufferGetAudioBufferListWithRetainedBlockBuffer(a3, &bufferListSizeNeededOut, 0, 0, 0, 0, 0, 0))
    {
      id v8 = objc_alloc(MEMORY[0x1E4F1CA58]);
      long long v9 = (void *)[v8 initWithLength:bufferListSizeNeededOut];
      if (v9)
      {
        size_t bufferListSizeNeededOut = 0;
        id v10 = v9;
        long long v11 = (AudioBufferList *)[v10 mutableBytes];
        OSStatus AudioBufferListWithRetainedBlockBuffer = CMSampleBufferGetAudioBufferListWithRetainedBlockBuffer(a3, 0, v11, [v10 length], 0, 0, 0, (CMBlockBufferRef *)&bufferListSizeNeededOut);
        if (AudioBufferListWithRetainedBlockBuffer)
        {
          long long v13 = OSLogForCategory(@"Default");
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
            -[RCWaveformGenerator _appendPowerMeterValuesFromSampleBuffer:](AudioBufferListWithRetainedBlockBuffer, v13);
          }
        }
        else
        {
          queue = self->_queue;
          v15[0] = MEMORY[0x1E4F143A8];
          v15[1] = 3221225472;
          v15[2] = __63__RCWaveformGenerator__appendPowerMeterValuesFromSampleBuffer___block_invoke;
          v15[3] = &unk_1E6496180;
          v15[5] = v11;
          v15[6] = v7;
          v15[4] = self;
          dispatch_sync(queue, v15);
          CFRelease((CFTypeRef)bufferListSizeNeededOut);
        }
      }
    }
  }
}

uint64_t __63__RCWaveformGenerator__appendPowerMeterValuesFromSampleBuffer___block_invoke(uint64_t result)
{
  uint64_t v1 = *(_DWORD **)(result + 40);
  if (*v1)
  {
    uint64_t v2 = result;
    uint64_t v3 = 0;
    unint64_t v4 = 0;
    do
    {
      intptr_t result = objc_msgSend(*(id *)(v2 + 32), "_onQueue_appendPowerMeterValuesFromRawAudioData:frameCount:format:isPredigest:", *(void *)&v1[v3 + 4], v1[v3 + 2]* (v1[v3 + 3]/ (*(_DWORD *)(*(void *)(v2 + 48) + 16) / *(_DWORD *)(*(void *)(v2 + 48) + 20))));
      ++v4;
      uint64_t v1 = *(_DWORD **)(v2 + 40);
      v3 += 4;
    }
    while (v4 < *v1);
  }
  return result;
}

- (void)_appendPowerMeterValuesFromAudioPCMBuffer:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __65__RCWaveformGenerator__appendPowerMeterValuesFromAudioPCMBuffer___block_invoke;
  v7[3] = &unk_1E6495FD0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

void __65__RCWaveformGenerator__appendPowerMeterValuesFromAudioPCMBuffer___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)[*(id *)(a1 + 40) floatChannelData];
  unsigned int v4 = [*(id *)(a1 + 40) frameLength];
  id v5 = [*(id *)(a1 + 40) format];
  objc_msgSend(v2, "_onQueue_appendPowerMeterValuesFromRawAudioData:frameCount:format:isPredigest:", v3, v4, objc_msgSend(v5, "streamDescription"), 0);
}

- (BOOL)_appendPowerMeterValuesFromDataInAudioFile:(id)a3 progressBlock:(id)a4
{
  v104[4] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (_checkCanAppend(self, (objc_selector *)a2))
  {
    p_activeAsset = &self->_activeAsset;
    if (self->_activeAsset)
    {
      uint64_t v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/VoiceMemos_Framework/Framework/Waveform/RCWaveformGenerator.mm"];
      long long v11 = (void *)v10;
      long long v12 = @"<Unknown File>";
      if (v10) {
        long long v12 = (__CFString *)v10;
      }
      long long v13 = v12;

      uint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v13, 452, @"already loading", 0, 0, 0, 0, 0);
    }
    uint64_t v15 = [MEMORY[0x1E4F16330] assetWithURL:v7];
    uint64_t v16 = v15;
    if (v15)
    {
      int v17 = objc_msgSend(v15, "rc_audioTracks");
      uint64_t v18 = [v17 count];
      if (v18)
      {
        queue = self->_queue;
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __80__RCWaveformGenerator__appendPowerMeterValuesFromDataInAudioFile_progressBlock___block_invoke;
        block[3] = &unk_1E6495FD0;
        block[4] = self;
        id v20 = v16;
        id v101 = v20;
        dispatch_sync(queue, block);
        v98[0] = 0;
        v98[1] = v98;
        v98[2] = 0x2020000000;
        int v99 = 0;
        v97[0] = 0;
        v97[1] = v97;
        v97[2] = 0x2020000000;
        v97[3] = 0;
        v95[0] = 0;
        v95[1] = v95;
        v95[2] = 0x2020000000;
        Float64 Seconds = 0.0;
        [v20 duration];
        Float64 Seconds = CMTimeGetSeconds(&time);
        uint64_t v91 = 0;
        v92[0] = &v91;
        v92[1] = 0x3032000000;
        v92[2] = __Block_byref_object_copy_;
        v92[3] = __Block_byref_object_dispose_;
        id v93 = 0;
        uint64_t v85 = 0;
        v86 = &v85;
        uint64_t v87 = 0x3032000000;
        v88 = __Block_byref_object_copy_;
        v89 = __Block_byref_object_dispose_;
        id v21 = objc_alloc(MEMORY[0x1E4F16378]);
        v22 = (id *)(v92[0] + 40);
        id obj = *(id *)(v92[0] + 40);
        id v23 = (void *)[v21 initWithAsset:v20 error:&obj];
        objc_storeStrong(v22, obj);
        id v90 = v23;
        v24 = (void *)v86[5];
        if (!v24)
        {
          v27 = OSLogForCategory(@"Default");
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
            -[RCWaveformGenerator _appendPowerMeterValuesFromDataInAudioFile:progressBlock:]((uint64_t)v92, v27);
          }
          BOOL v35 = 0;
          goto LABEL_37;
        }
        CMTime start = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
        CMTime duration = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA10];
        CMTimeRangeMake(&v83, &start, &duration);
        [v24 setTimeRange:&v83];
        uint64_t v25 = *MEMORY[0x1E4F15208];
        v103[0] = *MEMORY[0x1E4F151E0];
        v103[1] = v25;
        v104[0] = &unk_1F1F0D800;
        v104[1] = MEMORY[0x1E4F1CC38];
        uint64_t v26 = *MEMORY[0x1E4F15270];
        v103[2] = *MEMORY[0x1E4F151F0];
        v103[3] = v26;
        v104[2] = &unk_1F1F0D818;
        v104[3] = &unk_1F1F0D830;
        v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v104 forKeys:v103 count:4];
        if (self->_trackIndex <= v18 - 1)
        {
          id v28 = -[NSObject objectAtIndexedSubscript:](v17, "objectAtIndexedSubscript:");
          v102 = v28;
          uint64_t v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v102 count:1];

          int v17 = v29;
        }
        uint64_t v75 = 0;
        v76 = &v75;
        uint64_t v77 = 0x3032000000;
        v78 = __Block_byref_object_copy_;
        v79 = __Block_byref_object_dispose_;
        id v80 = [MEMORY[0x1E4F16380] assetReaderAudioMixOutputWithAudioTracks:v17 audioSettings:v27];
        v30 = (void *)v76[5];
        if (v30)
        {
          [v30 setAlwaysCopiesSampleData:0];
          [(id)v76[5] markConfigurationAsFinal];
          if ([(id)v86[5] canAddOutput:v76[5]])
          {
            [(id)v86[5] addOutput:v76[5]];
            v31 = self->_queue;
            v67[0] = MEMORY[0x1E4F143A8];
            v67[1] = 3221225472;
            v67[2] = __80__RCWaveformGenerator__appendPowerMeterValuesFromDataInAudioFile_progressBlock___block_invoke_42;
            v67[3] = &unk_1E64961A8;
            v70 = &v75;
            v71 = &v91;
            v69 = &v85;
            v67[4] = self;
            v72 = v97;
            v32 = (void (**)(void, float))v8;
            id v68 = v32;
            v73 = v95;
            v74 = v98;
            dispatch_sync(v31, v67);
            if (*(void *)(v92[0] + 40))
            {
              v33 = OSLogForCategory(@"Default");
              if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
                -[RCWaveformGenerator _appendPowerMeterValuesFromDataInAudioFile:progressBlock:].cold.5((uint64_t *)&self->_activeAsset, (uint64_t)v92, v33);
              }

              [(RCWaveformGenerator *)self terminateLoadingImmediately];
            }
            v34 = *p_activeAsset;
            *p_activeAsset = 0;

            if (v32) {
              v32[2](v32, 1.0);
            }

            BOOL v35 = 1;
            goto LABEL_36;
          }
          v51 = OSLogForCategory(@"Default");
          if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR)) {
            -[RCWaveformGenerator _appendPowerMeterValuesFromDataInAudioFile:progressBlock:].cold.6(v51, v59, v60, v61, v62, v63, v64, v65);
          }
        }
        else
        {
          v51 = OSLogForCategory(@"Default");
          if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR)) {
            -[RCWaveformGenerator _appendPowerMeterValuesFromDataInAudioFile:progressBlock:].cold.4(v51, v52, v53, v54, v55, v56, v57, v58);
          }
        }

        BOOL v35 = 0;
LABEL_36:
        _Block_object_dispose(&v75, 8);

LABEL_37:
        _Block_object_dispose(&v85, 8);

        _Block_object_dispose(&v91, 8);
        _Block_object_dispose(v95, 8);
        _Block_object_dispose(v97, 8);
        _Block_object_dispose(v98, 8);

        goto LABEL_38;
      }
      v43 = OSLogForCategory(@"Default");
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
        -[RCWaveformGenerator _appendPowerMeterValuesFromDataInAudioFile:progressBlock:](v43, v44, v45, v46, v47, v48, v49, v50);
      }
    }
    else
    {
      int v17 = OSLogForCategory(@"Default");
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        -[RCWaveformGenerator _appendPowerMeterValuesFromDataInAudioFile:progressBlock:](v17, v36, v37, v38, v39, v40, v41, v42);
      }
    }
    BOOL v35 = 0;
LABEL_38:

    goto LABEL_39;
  }
  BOOL v35 = 0;
LABEL_39:

  return v35;
}

void __80__RCWaveformGenerator__appendPowerMeterValuesFromDataInAudioFile_progressBlock___block_invoke(uint64_t a1)
{
}

void __80__RCWaveformGenerator__appendPowerMeterValuesFromDataInAudioFile_progressBlock___block_invoke_42(uint64_t a1)
{
  v30[1] = *MEMORY[0x1E4F143B8];
  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) startReading];
  uint64_t v2 = (opaqueCMSampleBuffer *)[*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) copyNextSampleBuffer];
  CMItemCount NumSamples = CMSampleBufferGetNumSamples(v2);
  if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
  {
LABEL_2:
    if (v2) {
      CFRelease(v2);
    }
  }
  else
  {
    CMItemCount v8 = NumSamples;
    uint64_t v9 = *MEMORY[0x1E4F281F8];
    uint64_t v10 = *MEMORY[0x1E4F28568];
    while (1)
    {
      dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 16), 0xFFFFFFFFFFFFFFFFLL);
      dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 16));
      long long v11 = *(unsigned char **)(a1 + 32);
      if (v11[248])
      {
        uint64_t v18 = [MEMORY[0x1E4F28C58] errorWithDomain:v9 code:3072 userInfo:0];
        uint64_t v19 = *(void *)(*(void *)(a1 + 64) + 8);
        id v20 = *(void **)(v19 + 40);
        *(void *)(v19 + 40) = v18;

        goto LABEL_2;
      }
      if (v8 < 1)
      {
        objc_msgSend(v11, "_onQueue_flushRemainingData");
        goto LABEL_2;
      }
      FormatDescription = CMSampleBufferGetFormatDescription(v2);
      StreamBasicDescription = CMAudioFormatDescriptionGetStreamBasicDescription(FormatDescription);
      CMBlockBufferRef blockBufferOut = 0;
      CMSampleBufferGetAudioBufferListWithRetainedBlockBuffer(v2, 0, &bufferListOut, 0x18uLL, 0, 0, 0, &blockBufferOut);
      if (bufferListOut.mNumberBuffers)
      {
        unint64_t v14 = 0;
        p_mData = &bufferListOut.mBuffers[0].mData;
        do
        {
          objc_msgSend(*(id *)(a1 + 32), "_onQueue_appendPowerMeterValuesFromRawAudioData:frameCount:format:isPredigest:", *p_mData, *((_DWORD *)p_mData - 1) / StreamBasicDescription->mBytesPerFrame, StreamBasicDescription, 0);
          ++v14;
          p_mData += 2;
        }
        while (v14 < bufferListOut.mNumberBuffers);
      }
      CMSampleBufferGetDuration(&v26, v2);
      *(Float64 *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = CMTimeGetSeconds(&v26)
                                                                   + *(double *)(*(void *)(*(void *)(a1 + 72) + 8)
                                                                               + 24);
      if (*(void *)(a1 + 40))
      {
        float v16 = *(double *)(*(void *)(*(void *)(a1 + 72) + 8) + 24)
            / *(double *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
        uint64_t v17 = *(void *)(*(void *)(a1 + 88) + 8);
        if (*(float *)(v17 + 24) != v16)
        {
          *(float *)(v17 + 24) = v16;
          (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
        }
      }
      CFRelease(blockBufferOut);
      CFRelease(v2);
      uint64_t v2 = (opaqueCMSampleBuffer *)[*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) copyNextSampleBuffer];
      CMItemCount v8 = CMSampleBufferGetNumSamples(v2);
      if (!v2 && !*(unsigned char *)(*(void *)(a1 + 32) + 248)) {
        break;
      }
      if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)) {
        goto LABEL_2;
      }
    }
    if ([*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) status] != 2)
    {
      id v21 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v29 = v10;
      v30[0] = @"AVAsset reader failed to read audio track samples.";
      v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:&v29 count:1];
      uint64_t v23 = [v21 errorWithDomain:v9 code:3072 userInfo:v22];
      uint64_t v24 = *(void *)(*(void *)(a1 + 64) + 8);
      uint64_t v25 = *(void **)(v24 + 40);
      *(void *)(v24 + 40) = v23;
    }
  }
  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) cancelReading];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = 0;

  uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = 0;
}

- (void)_appendAveragePowerLevelsByDigestingTimeRange:(id)a3 inAudioFile:(id)a4
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  id v7 = a4;
  queue = self->_queue;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __81__RCWaveformGenerator__appendAveragePowerLevelsByDigestingTimeRange_inAudioFile___block_invoke;
  v10[3] = &unk_1E64961D0;
  double v12 = var0;
  double v13 = var1;
  v10[4] = self;
  id v11 = v7;
  id v9 = v7;
  dispatch_sync(queue, v10);
}

uint64_t __81__RCWaveformGenerator__appendAveragePowerLevelsByDigestingTimeRange_inAudioFile___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onQueue_appendAveragePowerLevelsByDigestingTimeRange:inAudioFile:", *(void *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56));
}

- (void)_onQueue_appendAveragePowerLevelsByDigestingTimeRange:(id)a3 inAudioFile:(id)a4
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  id v8 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __89__RCWaveformGenerator__onQueue_appendAveragePowerLevelsByDigestingTimeRange_inAudioFile___block_invoke;
  block[3] = &unk_1E64961F8;
  id v12 = v8;
  SEL v13 = a2;
  block[4] = self;
  double v14 = var0;
  double v15 = var1;
  id v10 = v8;
  dispatch_sync(queue, block);
}

void __89__RCWaveformGenerator__onQueue_appendAveragePowerLevelsByDigestingTimeRange_inAudioFile___block_invoke(uint64_t a1)
{
  if (_checkCanAppend(*(RCWaveformGenerator **)(a1 + 32), *(objc_selector **)(a1 + 48)))
  {
    uint64_t v2 = [*(id *)(a1 + 40) framePosition];
    if ((v2 & 0x8000000000000000) == 0)
    {
      uint64_t v3 = v2;
      v27 = [*(id *)(a1 + 40) processingFormat];
      [v27 sampleRate];
      double v5 = v4;
      double v6 = *(double *)(a1 + 56);
      double v7 = v6 + -10.0;
      if (v6 + -10.0 < 0.0) {
        double v7 = 0.0;
      }
      uint64_t v8 = (uint64_t)(v5 * v7);
      int v9 = vcvtd_n_s64_f64(fmod((double)v8 * 0.000244140625, 1.0), 0xCuLL);
      objc_msgSend(*(id *)(a1 + 40), "setFramePosition:", (uint64_t)fmaxf((float)(v8 - v9), 0.0));
      id v10 = (void *)[objc_alloc(MEMORY[0x1E4F153B0]) initWithPCMFormat:v27 frameCapacity:4096];
      if (v9 >= 1)
      {
        do
        {
          dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 16), 0xFFFFFFFFFFFFFFFFLL);
          dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 16));
          if (*(unsigned char *)(*(void *)(a1 + 32) + 248)) {
            break;
          }
          id v11 = *(void **)(a1 + 40);
          if (v9 >= 0x1000) {
            uint64_t v12 = 4096;
          }
          else {
            uint64_t v12 = v9;
          }
          id v29 = 0;
          int v13 = [v11 readIntoBuffer:v10 frameCount:v12 error:&v29];
          id v14 = v29;
          if (!v13 || (unsigned int v15 = [v10 frameLength]) == 0)
          {

            break;
          }
          float v16 = *(void **)(a1 + 32);
          uint64_t v17 = *(void *)[v10 floatChannelData];
          uint64_t v18 = [v10 format];
          objc_msgSend(v16, "_onQueue_appendPowerMeterValuesFromRawAudioData:frameCount:format:isPredigest:", v17, v15, objc_msgSend(v18, "streamDescription"), 1);
          v9 -= v15;
        }
        while (v9 > 0);
      }
      [*(id *)(a1 + 40) setFramePosition:(uint64_t)(v5 * v6)];
      *(void *)(*(void *)(a1 + 32) + 32) = 0;
      *(void *)(*(void *)(a1 + 32) + 200) = 0;
      while (1)
      {
        double v19 = *(double *)(*(void *)(a1 + 32) + 40);
        if (v19 >= RCTimeRangeDeltaWithExactPrecision(*(double *)(a1 + 56), *(double *)(a1 + 64))) {
          break;
        }
        dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 16), 0xFFFFFFFFFFFFFFFFLL);
        dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 16));
        if (*(unsigned char *)(*(void *)(a1 + 32) + 248)) {
          break;
        }
        id v20 = *(void **)(a1 + 40);
        id v28 = 0;
        int v21 = [v20 readIntoBuffer:v10 frameCount:4096 error:&v28];
        id v22 = v28;
        if (!v21 || (unsigned int v23 = [v10 frameLength]) == 0)
        {
          objc_msgSend(*(id *)(a1 + 32), "_onQueue_flushRemainingData");

          break;
        }
        uint64_t v24 = *(void **)(a1 + 32);
        uint64_t v25 = *(void *)[v10 floatChannelData];
        CMTime v26 = [v10 format];
        objc_msgSend(v24, "_onQueue_appendPowerMeterValuesFromRawAudioData:frameCount:format:isPredigest:", v25, v23, objc_msgSend(v26, "streamDescription"), 0);
      }
      [*(id *)(a1 + 40) setFramePosition:v3];
    }
  }
}

- (id)synchronouslyApproximateWaveformForAVContentURL:(id)a3 byReadingCurrentFileAheadTimeRange:(id)a4
{
  double var1 = a4.var1;
  double var0 = a4.var0;
  id v7 = a3;
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x3032000000;
  id v29 = __Block_byref_object_copy_;
  v30 = __Block_byref_object_dispose_;
  id v31 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __106__RCWaveformGenerator_synchronouslyApproximateWaveformForAVContentURL_byReadingCurrentFileAheadTimeRange___block_invoke;
  block[3] = &unk_1E6496020;
  block[4] = self;
  void block[5] = &v26;
  dispatch_sync(queue, block);
  int v9 = (void *)v27[5];
  if (v9
    && ([v9 url],
        id v10 = objc_claimAutoreleasedReturnValue(),
        char v11 = [v10 isEqual:v7],
        v10,
        (v11 & 1) != 0)
    && ![(RCWaveformGenerator *)self finished])
  {
    BOOL v14 = [(RCWaveformGenerator *)self paused];
    if (!v14) {
      [(RCWaveformGenerator *)self setPaused:1];
    }
    unsigned int v15 = [[RCWaveformGenerator alloc] initWithSamplingParametersFromGenerator:self trackIndex:self->_trackIndex];
    float v16 = [[RCWaveformSegmentAccumulator alloc] initWithWaveformGenerator:v15];
    -[RCWaveformGenerator _appendAveragePowerLevelsByDigestingTimeRange:inAudioFile:](v15, "_appendAveragePowerLevelsByDigestingTimeRange:inAudioFile:", v27[5], var0, var1);
    [(RCWaveformSegmentAccumulator *)v16 waitUntilFinished];
    uint64_t v17 = (void *)MEMORY[0x1E4F1CA48];
    uint64_t v18 = [(RCWaveformSegmentAccumulator *)v16 segments];
    double v19 = objc_msgSend(v17, "arrayWithCapacity:", objc_msgSend(v18, "count"));

    id v20 = [(RCWaveformSegmentAccumulator *)v16 segments];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __106__RCWaveformGenerator_synchronouslyApproximateWaveformForAVContentURL_byReadingCurrentFileAheadTimeRange___block_invoke_2;
    v21[3] = &unk_1E6496220;
    double v23 = var0;
    double v24 = var1;
    id v12 = v19;
    id v22 = v12;
    [v20 enumerateObjectsUsingBlock:v21];

    if (!v14) {
      [(RCWaveformGenerator *)self setPaused:0];
    }
  }
  else
  {
    id v12 = 0;
  }
  _Block_object_dispose(&v26, 8);

  return v12;
}

void __106__RCWaveformGenerator_synchronouslyApproximateWaveformForAVContentURL_byReadingCurrentFileAheadTimeRange___block_invoke(uint64_t a1)
{
}

void __106__RCWaveformGenerator_synchronouslyApproximateWaveformForAVContentURL_byReadingCurrentFileAheadTimeRange___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (id)[v3 copyWithTimeRangeOffsetByTimeOffset:*(double *)(a1 + 40)];

  objc_msgSend(*(id *)(a1 + 32), "addObject:");
}

- (BOOL)_appendAveragePowerLevelsByDigestingWaveformSegments:(id)a3
{
  id v5 = a3;
  if (_checkCanAppend(self, (objc_selector *)a2))
  {
    uint64_t v13 = 0;
    BOOL v14 = &v13;
    uint64_t v15 = 0x2020000000;
    char v16 = 0;
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __76__RCWaveformGenerator__appendAveragePowerLevelsByDigestingWaveformSegments___block_invoke;
    block[3] = &unk_1E6496248;
    id v10 = v5;
    char v11 = self;
    id v12 = &v13;
    dispatch_sync(queue, block);
    BOOL v7 = *((unsigned char *)v14 + 24) != 0;

    _Block_object_dispose(&v13, 8);
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

uint64_t __76__RCWaveformGenerator__appendAveragePowerLevelsByDigestingWaveformSegments___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
LABEL_3:
    uint64_t v5 = 0;
    while (1)
    {
      if (*(void *)v9 != v4) {
        objc_enumerationMutation(v2);
      }
      double v6 = *(unsigned char **)(a1 + 40);
      if (v6[248]) {
        break;
      }
      objc_msgSend(v6, "_onQueue_appendSegment:", *(void *)(*((void *)&v8 + 1) + 8 * v5++), (void)v8);
      if (v3 == v5)
      {
        uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
        if (v3) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  uint64_t result = objc_msgSend(*(id *)(a1 + 40), "_onQueue_flushRemainingData");
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  return result;
}

- (void)_onQueue_flushWaveformSegment:(id)a3
{
  id v5 = a3;
  if (_checkCanAppend(self, (objc_selector *)a2))
  {
    dispatch_semaphore_wait((dispatch_semaphore_t)self->_digestPausedSemaphore, 0xFFFFFFFFFFFFFFFFLL);
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_digestPausedSemaphore);
    if (!self->_canceled)
    {
      [v5 timeRange];
      if (v6 >= self->_totalFlushedTime)
      {
        [(RCWaveformGenerator *)self _onQueue_flushRemainingData];
      }
      else
      {
        BOOL v7 = (void *)MEMORY[0x1E4F1CA00];
        [v5 timeRange];
        objc_msgSend(v7, "raise:format:", *MEMORY[0x1E4F1C3A8], @"Invalid endTime (segment end time %f is less than total flushed time %f. Will regenerate waveform."), v8, *(void *)&self->_totalFlushedTime;
      }
      self->_framesConsumedSinceLastFlush = 0;
      [v5 timeRange];
      self->_totalFlushedTime = v9;
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __53__RCWaveformGenerator__onQueue_flushWaveformSegment___block_invoke;
      v10[3] = &unk_1E6496270;
      v10[4] = self;
      id v11 = v5;
      [(RCWaveformGenerator *)self _onQueue_performObserversBlock:v10];
      self->_powerLevelBuffer.__end_ = self->_powerLevelBuffer.__begin_;
    }
  }
}

uint64_t __53__RCWaveformGenerator__onQueue_flushWaveformSegment___block_invoke(uint64_t a1, void *a2)
{
  return [a2 waveformGenerator:*(void *)(a1 + 32) didLoadWaveformSegment:*(void *)(a1 + 40)];
}

- (void)_onQueue_flushWithNextSegmentWithEndTime:(double)a3 isPredigest:(BOOL)a4
{
  if (_checkCanAppend(self, (objc_selector *)a2))
  {
    dispatch_semaphore_wait((dispatch_semaphore_t)self->_digestPausedSemaphore, 0xFFFFFFFFFFFFFFFFLL);
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_digestPausedSemaphore);
    if (!self->_canceled)
    {
      v7.n128_u64[0] = *(void *)&self->_totalFlushedTime;
      if (v7.n128_f64[0] > a3)
      {
        uint64_t v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/VoiceMemos_Framework/Framework/Waveform/RCWaveformGenerator.mm"];
        double v9 = (void *)v8;
        long long v10 = @"<Unknown File>";
        if (v8) {
          long long v10 = (__CFString *)v8;
        }
        id v11 = v10;

        id v12 = [MEMORY[0x1E4F28B00] currentHandler];
        objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v11, 780, @"Invalid endTime", 0, 0, 0, 0, 0);

        v7.n128_u64[0] = *(void *)&self->_totalFlushedTime;
      }
      double v13 = RCTimeRangeMake(v7, a3);
      double v15 = v14;
      begin = self->_powerLevelBuffer.__begin_;
      end = self->_powerLevelBuffer.__end_;
      uint64_t v18 = (char *)end - (char *)begin;
      if (end == begin)
      {
        value = self->_powerLevelBuffer.__end_cap_.__value_;
        if (end >= value)
        {
          uint64_t v21 = v18 >> 2;
          uint64_t v22 = (char *)value - (char *)begin;
          if (v22 >> 1 <= (unint64_t)((v18 >> 2) + 1)) {
            uint64_t v23 = v21 + 1;
          }
          else {
            uint64_t v23 = v22 >> 1;
          }
          if ((unint64_t)v22 >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v24 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v24 = v23;
          }
          uint64_t v25 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)&self->_powerLevelBuffer.__end_cap_, v24);
          uint64_t v26 = self->_powerLevelBuffer.__begin_;
          v27 = self->_powerLevelBuffer.__end_;
          uint64_t v28 = (float *)&v25[4 * v21];
          v30 = (float *)&v25[4 * v29];
          *uint64_t v28 = self->_powerLevelBufferLastPushedValue;
          id v20 = v28 + 1;
          while (v27 != v26)
          {
            int v31 = *((_DWORD *)v27-- - 1);
            *((_DWORD *)v28-- - 1) = v31;
          }
          self->_powerLevelBuffer.__begin_ = v28;
          self->_powerLevelBuffer.__end_ = v20;
          self->_powerLevelBuffer.__end_cap_.__value_ = v30;
          if (v26) {
            operator delete(v26);
          }
        }
        else
        {
          float *end = self->_powerLevelBufferLastPushedValue;
          id v20 = end + 1;
        }
        self->_powerLevelBuffer.__end_ = v20;
      }
      v32 = -[RCWaveformSegment initWithTimeRange:averagePowerLevelVector:]([RCWaveformSegment alloc], "initWithTimeRange:averagePowerLevelVector:", &self->_powerLevelBuffer, v13, v15);
      self->_totalFlushedTime = a3;
      uint64_t v33 = MEMORY[0x1E4F143A8];
      self->_powerLevelsConsumedSinceLastFlush = 0;
      self->_framesConsumedSinceLastFlush = 0;
      v35[0] = v33;
      v35[1] = 3221225472;
      v35[2] = __76__RCWaveformGenerator__onQueue_flushWithNextSegmentWithEndTime_isPredigest___block_invoke;
      v35[3] = &unk_1E6496270;
      v35[4] = self;
      uint64_t v36 = v32;
      v34 = v32;
      [(RCWaveformGenerator *)self _onQueue_performObserversBlock:v35];
      self->_powerLevelBuffer.__end_ = self->_powerLevelBuffer.__begin_;
    }
  }
}

uint64_t __76__RCWaveformGenerator__onQueue_flushWithNextSegmentWithEndTime_isPredigest___block_invoke(uint64_t a1, void *a2)
{
  return [a2 waveformGenerator:*(void *)(a1 + 32) didLoadWaveformSegment:*(void *)(a1 + 40)];
}

- (void)_onQueue_flushRemainingData
{
  if (_checkCanAppend(self, (objc_selector *)a2))
  {
    double totalFlushedTime = self->_totalFlushedTime;
    double v4 = self->_totalDigestedTime - totalFlushedTime;
    if (v4 > 0.0)
    {
      double v5 = totalFlushedTime + v4;
      [(RCWaveformGenerator *)self _onQueue_flushWithNextSegmentWithEndTime:0 isPredigest:v5];
    }
  }
}

- (void)_onQueue_digestAveragePowerLevel:(float)a3
{
  if (_checkCanAppend(self, (objc_selector *)a2))
  {
    dispatch_semaphore_wait((dispatch_semaphore_t)self->_digestPausedSemaphore, 0xFFFFFFFFFFFFFFFFLL);
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_digestPausedSemaphore);
    if (!self->_canceled)
    {
      value = self->_powerLevelBuffer.__end_cap_.__value_;
      self->_powerLevelBufferLastPushedValue = a3;
      end = self->_powerLevelBuffer.__end_;
      if (end >= value)
      {
        begin = self->_powerLevelBuffer.__begin_;
        uint64_t v9 = end - begin;
        if ((unint64_t)(v9 + 1) >> 62) {
          std::vector<float>::__throw_length_error[abi:ne180100]();
        }
        unint64_t v10 = (char *)value - (char *)begin;
        unint64_t v11 = ((char *)value - (char *)begin) >> 1;
        if (v11 <= v9 + 1) {
          unint64_t v11 = v9 + 1;
        }
        if (v10 >= 0x7FFFFFFFFFFFFFFCLL) {
          unint64_t v12 = 0x3FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v12 = v11;
        }
        if (v12)
        {
          double v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)&self->_powerLevelBuffer.__end_cap_, v12);
          begin = self->_powerLevelBuffer.__begin_;
          end = self->_powerLevelBuffer.__end_;
        }
        else
        {
          double v13 = 0;
        }
        double v14 = (float *)&v13[4 * v9];
        double v15 = (float *)&v13[4 * v12];
        float *v14 = a3;
        __n128 v7 = v14 + 1;
        while (end != begin)
        {
          int v16 = *((_DWORD *)end-- - 1);
          *((_DWORD *)v14-- - 1) = v16;
        }
        self->_powerLevelBuffer.__begin_ = v14;
        self->_powerLevelBuffer.__end_ = v7;
        self->_powerLevelBuffer.__end_cap_.__value_ = v15;
        if (begin) {
          operator delete(begin);
        }
      }
      else
      {
        float *end = a3;
        __n128 v7 = end + 1;
      }
      self->_powerLevelBuffer.__end_ = v7;
    }
  }
}

- (void)_onQueue_pushAveragePowerLevel:(float)a3
{
  if (_checkCanAppend(self, (objc_selector *)a2))
  {
    dispatch_semaphore_wait((dispatch_semaphore_t)self->_digestPausedSemaphore, 0xFFFFFFFFFFFFFFFFLL);
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_digestPausedSemaphore);
    if (!self->_canceled)
    {
      unint64_t v5 = self->_powerLevelsConsumedSinceLastFlush + 1;
      self->_powerLevelsConsumedSinceLastFlush = v5;
      double totalFlushedTime = self->_totalFlushedTime;
      double segmentFlushInterval = self->_segmentFlushInterval;
      double v8 = totalFlushedTime + (double)v5 / (double)self->_overviewUnitsPerSecond;
      self->_totalDigestedTime = v8;
      BOOL v9 = v8 - totalFlushedTime < segmentFlushInterval + 4.4408921e-16;
      double v10 = -1.0;
      double v11 = v9 ? -1.0 : v8;
      *(float *)&double v10 = a3;
      [(RCWaveformGenerator *)self _onQueue_digestAveragePowerLevel:v10];
      if (v11 > 0.0)
      {
        [(RCWaveformGenerator *)self _onQueue_flushWithNextSegmentWithEndTime:0 isPredigest:v11];
      }
    }
  }
}

- (void)_onQueue_appendSegment:(id)a3
{
  id v5 = a3;
  if (_checkCanAppend(self, (objc_selector *)a2)) {
    [(RCWaveformGenerator *)self _onQueue_flushWaveformSegment:v5];
  }
}

- (void)_onQueue_appendPowerMeterValuesFromRawAudioData:(void *)a3 frameCount:(int64_t)a4 format:(const AudioStreamBasicDescription *)a5 isPredigest:(BOOL)a6
{
  BOOL v42 = a6;
  v43 = (float *)a3;
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  if (_checkCanAppend(self, (objc_selector *)a2))
  {
    dispatch_semaphore_wait((dispatch_semaphore_t)self->_digestPausedSemaphore, 0xFFFFFFFFFFFFFFFFLL);
    intptr_t v9 = dispatch_semaphore_signal((dispatch_semaphore_t)self->_digestPausedSemaphore);
    if (!self->_canceled)
    {
      BOOL v10 = a5->mChannelsPerFrame >= 2 && a5->mBytesPerFrame > a5->mBytesPerPacket;
      double mSampleRate = self->_samplePowerMeter.mSampleRate;
      if (!self->_isSampleRateKnown)
      {
        self->_isSampleRateKnown = 1;
        double mSampleRate = a5->mSampleRate;
        PowerMeter::SetSampleRate(&self->_samplePowerMeter, a5->mSampleRate);
        double v12 = mSampleRate * self->_segmentFlushInterval;
        self->_int64_t framesNeededForNextDB = (uint64_t)(mSampleRate / (double)self->_overviewUnitsPerSecond);
        self->_int64_t framesNeededForNextFlush = (uint64_t)v12;
      }
      if (a4 >= 1)
      {
        uint64_t v40 = &v43[a4];
        int64_t v41 = 2 * a4;
        for (uint64_t i = a4; i > 0; i -= v17 >> 32)
        {
          int64_t framesNeededForNextDB = i;
          if (self->_overviewUnitsPerSecond)
          {
            if (self->_framesNeededForNextDB >= i) {
              int64_t framesNeededForNextDB = i;
            }
            else {
              int64_t framesNeededForNextDB = self->_framesNeededForNextDB;
            }
          }
          if ((int)framesNeededForNextDB >= 1 && self->_canceled) {
            break;
          }
          UInt32 mBitsPerChannel = a5->mBitsPerChannel;
          if (mBitsPerChannel == 16)
          {
            uint64_t v18 = (char *)v43 + 2 * (a4 - i);
            uint64_t v17 = framesNeededForNextDB << 32;
            MEMORY[0x1F4188790](v9);
            int v16 = (float *)((char *)&v39 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0));
            bzero(v16, v19);
            if (v10 || a5->mChannelsPerFrame < 2)
            {
              if ((int)framesNeededForNextDB >= 1)
              {
                uint64_t v23 = 0;
                do
                {
                  v16[v23] = (float)*(__int16 *)&v18[2 * v23] / 32767.0;
                  ++v23;
                }
                while (framesNeededForNextDB != v23);
              }
            }
            else if ((int)framesNeededForNextDB >= 1)
            {
              uint64_t v20 = 0;
              uint64_t v21 = (char *)v40 - 2 * i;
              do
              {
                int v22 = *(__int16 *)&v18[2 * v20];
                if (v22 <= *(__int16 *)&v21[2 * v20]) {
                  int v22 = *(__int16 *)&v21[2 * v20];
                }
                v16[v20++] = (float)v22 / 32767.0;
              }
              while (framesNeededForNextDB != v20);
            }
          }
          else
          {
            if (mBitsPerChannel != 32)
            {
              int v31 = OSLogForCategory(@"Default");
              if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
                -[RCWaveformGenerator _onQueue_appendPowerMeterValuesFromRawAudioData:frameCount:format:isPredigest:](v31, v32, v33, v34, v35, v36, v37, v38);
              }

              return;
            }
            if (!v10 && a5->mChannelsPerFrame >= 2) {
              PowerMeter::Process(&self->_samplePowerMeter, &v43[v41 - i], 1, framesNeededForNextDB);
            }
            int v16 = &v43[a4 - i];
            uint64_t v17 = framesNeededForNextDB << 32;
          }
          UInt32 mChannelsPerFrame = 1;
          PowerMeter::Process(&self->_samplePowerMeter, v16, 1, framesNeededForNextDB);
          unint64_t framesConsumedSinceLastFlush = self->_framesConsumedSinceLastFlush;
          int64_t v26 = self->_framesNeededForNextDB - (v17 >> 32);
          int64_t framesNeededForNextFlush = self->_framesNeededForNextFlush - (v17 >> 32);
          self->_int64_t framesNeededForNextDB = v26;
          self->_int64_t framesNeededForNextFlush = framesNeededForNextFlush;
          unint64_t v28 = framesConsumedSinceLastFlush + (v17 >> 32);
          self->_unint64_t framesConsumedSinceLastFlush = v28;
          if (v10) {
            UInt32 mChannelsPerFrame = a5->mChannelsPerFrame;
          }
          self->_totalDigestedTime = self->_totalFlushedTime + (double)v28 / mSampleRate / (double)mChannelsPerFrame;
          if (v26 <= 0)
          {
            long double mMaxPeak = self->_samplePowerMeter.mMaxPeak;
            if (mMaxPeak <= 0.000001) {
              long double v30 = -120.0;
            }
            else {
              long double v30 = log10(mMaxPeak) * 20.0;
            }
            if (!v42)
            {
              *(float *)&long double v30 = v30;
              [(RCWaveformGenerator *)self _onQueue_digestAveragePowerLevel:(double)v30];
            }
            PowerMeter::Reset(&self->_samplePowerMeter);
            self->_int64_t framesNeededForNextDB = (uint64_t)(mSampleRate / (double)self->_overviewUnitsPerSecond);
            int64_t framesNeededForNextFlush = self->_framesNeededForNextFlush;
          }
          if (framesNeededForNextFlush <= 0)
          {
            intptr_t v9 = [(RCWaveformGenerator *)self _onQueue_flushWithNextSegmentWithEndTime:v42 isPredigest:self->_totalDigestedTime];
            self->_int64_t framesNeededForNextFlush = (uint64_t)(mSampleRate * self->_segmentFlushInterval);
          }
        }
      }
    }
  }
}

- (double)segmentFlushInterval
{
  return self->_segmentFlushInterval;
}

- (int64_t)overviewUnitsPerSecond
{
  return self->_overviewUnitsPerSecond;
}

- (void)setOverviewUnitsPerSecond:(int64_t)a3
{
  self->_overviewUnitsPerSecond = a3;
}

- (int64_t)state
{
  return self->_state;
}

- (BOOL)canceled
{
  return self->_canceled;
}

- (void)setCanceled:(BOOL)a3
{
  self->_BOOL canceled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadingError, 0);
  begin = self->_powerLevelBuffer.__begin_;
  if (begin)
  {
    self->_powerLevelBuffer.__end_ = begin;
    operator delete(begin);
  }
  objc_storeStrong((id *)&self->_activeAsset, 0);
  objc_storeStrong((id *)&self->_activeAudioFile, 0);
  objc_storeStrong((id *)&self->_internalFinishedLoadingBlocks, 0);
  objc_storeStrong((id *)&self->_internalFinishedLoadingBlockUUIDs, 0);
  objc_storeStrong((id *)&self->_weakObservers, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_digestPausedSemaphore, 0);
}

- (id).cxx_construct
{
  self->_powerLevelBuffer.__begin_ = 0;
  self->_powerLevelBuffer.__end_ = 0;
  self->_powerLevelBuffer.__end_cap_.__value_ = 0;
  return self;
}

- (void)appendAveragePowerLevelsByDigestingContentsOfAudioFileURL:(os_log_t)log progressBlock:.cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 136315394;
  *(void *)(buf + 4) = "-[RCWaveformGenerator appendAveragePowerLevelsByDigestingContentsOfAudioFileURL:progressBlock:]";
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a1;
  _os_log_debug_impl(&dword_1C3964000, log, OS_LOG_TYPE_DEBUG, "%s -- loading waveform data from audioFile %@", buf, 0x16u);
}

- (void)appendAveragePowerLevelsByDigestingWaveform:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 136315394;
  uint64_t v3 = "-[RCWaveformGenerator appendAveragePowerLevelsByDigestingWaveform:]";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_debug_impl(&dword_1C3964000, a2, OS_LOG_TYPE_DEBUG, "%s -- loading waveform data from %@", (uint8_t *)&v2, 0x16u);
}

- (void)_appendPowerMeterValuesFromSampleBuffer:(int)a1 .cold.1(int a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 136315394;
  uint64_t v3 = "-[RCWaveformGenerator _appendPowerMeterValuesFromSampleBuffer:]";
  __int16 v4 = 1024;
  int v5 = a1;
  _os_log_error_impl(&dword_1C3964000, a2, OS_LOG_TYPE_ERROR, "%s -- ERROR:  CMSampleBufferGetAudioBufferListWithRetainedBlockBuffer failed:  rv = %d", (uint8_t *)&v2, 0x12u);
}

- (void)_appendPowerMeterValuesFromDataInAudioFile:(uint64_t)a3 progressBlock:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C3964000, a1, a3, "%s -- audioAsset = nil", a5, a6, a7, a8, 2u);
}

- (void)_appendPowerMeterValuesFromDataInAudioFile:(uint64_t)a3 progressBlock:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C3964000, a1, a3, "%s -- audioTracks.count == 0", a5, a6, a7, a8, 2u);
}

- (void)_appendPowerMeterValuesFromDataInAudioFile:(uint64_t)a1 progressBlock:(NSObject *)a2 .cold.3(uint64_t a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(*(void *)a1 + 40);
  int v3 = 136315394;
  __int16 v4 = "-[RCWaveformGenerator _appendPowerMeterValuesFromDataInAudioFile:progressBlock:]";
  __int16 v5 = 2112;
  uint64_t v6 = v2;
  _os_log_error_impl(&dword_1C3964000, a2, OS_LOG_TYPE_ERROR, "%s -- AVAssetReader Error = %@", (uint8_t *)&v3, 0x16u);
}

- (void)_appendPowerMeterValuesFromDataInAudioFile:(uint64_t)a3 progressBlock:(uint64_t)a4 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C3964000, a1, a3, "%s -- readerOutput = nil", a5, a6, a7, a8, 2u);
}

- (void)_appendPowerMeterValuesFromDataInAudioFile:(os_log_t)log progressBlock:.cold.5(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *a1;
  uint64_t v4 = *(void *)(*(void *)a2 + 40);
  int v5 = 136315650;
  uint64_t v6 = "-[RCWaveformGenerator _appendPowerMeterValuesFromDataInAudioFile:progressBlock:]";
  __int16 v7 = 2112;
  uint64_t v8 = v3;
  __int16 v9 = 2112;
  uint64_t v10 = v4;
  _os_log_debug_impl(&dword_1C3964000, log, OS_LOG_TYPE_DEBUG, "%s -- ERROR: encountered error while attempting to read from audio file %@, error = %@ canceling further operations..", (uint8_t *)&v5, 0x20u);
}

- (void)_appendPowerMeterValuesFromDataInAudioFile:(uint64_t)a3 progressBlock:(uint64_t)a4 .cold.6(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_onQueue_appendPowerMeterValuesFromRawAudioData:(uint64_t)a3 frameCount:(uint64_t)a4 format:(uint64_t)a5 isPredigest:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end