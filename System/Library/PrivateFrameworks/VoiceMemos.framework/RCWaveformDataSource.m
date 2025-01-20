@interface RCWaveformDataSource
- ($F24F406B2B787EFB06265DBA3D28CBD5)timeRangeToHighlight;
- (BOOL)canceled;
- (BOOL)finished;
- (BOOL)hasSavedGeneratedWaveform;
- (BOOL)hasStartedLoading;
- (BOOL)setPaused:(BOOL)a3;
- (BOOL)shouldMergeLiveWaveform;
- (BOOL)supportsLiveInput;
- (BOOL)waitUntilFinished;
- (NSHashTable)weakObservers;
- (NSURL)generatedWaveformOutputURL;
- (OS_dispatch_queue)queue;
- (RCWaveform)accumulatorWaveform;
- (RCWaveformDataSource)initWithWaveformGenerator:(id)a3 generatedWaveformOutputURL:(id)a4 trackIndex:(unint64_t)a5;
- (RCWaveformGenerator)waveformGenerator;
- (double)averagePowerLevelsRate;
- (double)duration;
- (double)durationPerWaveformSlice;
- (float)loadingProgress;
- (id)copyWithTrackIndex:(unint64_t)a3 emptyCopy:(BOOL)a4;
- (id)segmentsInCompositionByConvertingFromActiveLoadingFragment:(id)a3;
- (id)synchronouslyApproximateWaveformSegmentsByReadingCurrentFileAheadTimeRange:(id)a3;
- (id)waveformSegmentsInTimeRange:(id)a3;
- (id)waveformSegmentsIntersectingTimeRange:(id)a3;
- (unint64_t)trackIndex;
- (void)_performObserversBlock:(id)a3;
- (void)_performOnObserversBlock:(id)a3;
- (void)addObserver:(id)a3;
- (void)beginLoading;
- (void)cancelLoading;
- (void)dealloc;
- (void)finishLoadingWithCompletionTimeout:(unint64_t)a3 completionBlock:(id)a4;
- (void)mergeGeneratedWaveformIfNecessary;
- (void)removeObserver:(id)a3;
- (void)saveGeneratedWaveformIfNecessary;
- (void)setDurationPerWaveformSlice:(double)a3;
- (void)setHasSavedGeneratedWaveform:(BOOL)a3;
- (void)setTrackIndex:(unint64_t)a3;
- (void)updateAccumulatorWaveformSegmentsWithBlock:(id)a3;
- (void)waveformGenerator:(id)a3 didLoadWaveformSegment:(id)a4;
- (void)waveformGeneratorDidFinishLoading:(id)a3 error:(id)a4;
@end

@implementation RCWaveformDataSource

- (RCWaveformDataSource)initWithWaveformGenerator:(id)a3 generatedWaveformOutputURL:(id)a4 trackIndex:(unint64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v20.receiver = self;
  v20.super_class = (Class)RCWaveformDataSource;
  v11 = [(RCWaveformDataSource *)&v20 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_waveformGenerator, a3);
    v13 = objc_alloc_init(RCMutableWaveform);
    accumulatorWaveform = v12->_accumulatorWaveform;
    v12->_accumulatorWaveform = v13;

    v12->_liveRecordingMergeTime = 0.0;
    objc_storeStrong((id *)&v12->_generatedWaveformOutputURL, a4);
    uint64_t v15 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    weakObservers = v12->_weakObservers;
    v12->_weakObservers = (NSHashTable *)v15;

    dispatch_queue_t v17 = dispatch_queue_create("com.apple.waveformDataSourceProcessing", 0);
    queue = v12->_queue;
    v12->_queue = (OS_dispatch_queue *)v17;

    v12->_trackIndex = a5;
  }

  return v12;
}

- (void)dealloc
{
  [(RCWaveformGenerator *)self->_waveformGenerator terminateLoadingImmediately];
  v3.receiver = self;
  v3.super_class = (Class)RCWaveformDataSource;
  [(RCWaveformDataSource *)&v3 dealloc];
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __36__RCWaveformDataSource_addObserver___block_invoke;
  v7[3] = &unk_1E6496350;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

uint64_t __36__RCWaveformDataSource_addObserver___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 72) containsObject:*(void *)(a1 + 40)];
  if ((result & 1) == 0)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    id v4 = *(void **)(*(void *)(a1 + 32) + 72);
    return [v4 addObject:v3];
  }
  return result;
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __39__RCWaveformDataSource_removeObserver___block_invoke;
  v7[3] = &unk_1E6496350;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

void __39__RCWaveformDataSource_removeObserver___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 72) removeObject:*(void *)(a1 + 40)];
  dispatch_time_t v2 = dispatch_time(0, 500000000);
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(NSObject **)(v3 + 48);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__RCWaveformDataSource_removeObserver___block_invoke_2;
  block[3] = &unk_1E64963A0;
  block[4] = v3;
  dispatch_after(v2, v4, block);
}

uint64_t __39__RCWaveformDataSource_removeObserver___block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 72) count];
  if (!result)
  {
    uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 32);
    return [v3 terminateLoadingImmediately];
  }
  return result;
}

- (void)beginLoading
{
  if (!self->_hasStartedLoading)
  {
    self->_hasStartedLoading = 1;
    uint64_t v3 = [(RCWaveformDataSource *)self waveformGenerator];
    [v3 beginLoading];

    id v4 = [(RCWaveformDataSource *)self waveformGenerator];
    [v4 addSegmentOutputObserver:self];

    [(RCWaveformDataSource *)self startLoading];
  }
}

- (void)finishLoadingWithCompletionTimeout:(unint64_t)a3 completionBlock:(id)a4
{
  id v6 = a4;
  objc_initWeak(&location, self);
  v7 = [(RCWaveformDataSource *)self waveformGenerator];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __75__RCWaveformDataSource_finishLoadingWithCompletionTimeout_completionBlock___block_invoke;
  v9[3] = &unk_1E6496B90;
  objc_copyWeak(&v11, &location);
  id v8 = v6;
  id v10 = v8;
  [v7 finishLoadingWithCompletionTimeout:a3 completionBlock:v9];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __75__RCWaveformDataSource_finishLoadingWithCompletionTimeout_completionBlock___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained saveGeneratedWaveformIfNecessary];

  id v7 = objc_loadWeakRetained((id *)(a1 + 40));
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __75__RCWaveformDataSource_finishLoadingWithCompletionTimeout_completionBlock___block_invoke_2;
  v10[3] = &unk_1E6496B68;
  id v8 = *(id *)(a1 + 32);
  char v13 = a2;
  id v11 = v5;
  id v12 = v8;
  id v9 = v5;
  [v7 _performOnObserversBlock:v10];
}

uint64_t __75__RCWaveformDataSource_finishLoadingWithCompletionTimeout_completionBlock___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
  }
  return result;
}

- (void)cancelLoading
{
}

- (BOOL)waitUntilFinished
{
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __41__RCWaveformDataSource_waitUntilFinished__block_invoke;
  v6[3] = &unk_1E6496BB8;
  dispatch_semaphore_t v7 = v3;
  id v4 = v3;
  [(RCWaveformDataSource *)self finishLoadingWithCompletionTimeout:-1 completionBlock:v6];
  dispatch_semaphore_wait(v4, 0xFFFFFFFFFFFFFFFFLL);
  LODWORD(self) = ![(RCWaveformGenerator *)self->_waveformGenerator canceled];

  return (char)self;
}

intptr_t __41__RCWaveformDataSource_waitUntilFinished__block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)setPaused:(BOOL)a3
{
  return 1;
}

- (BOOL)finished
{
  return [(RCWaveformGenerator *)self->_waveformGenerator finished];
}

- (BOOL)canceled
{
  return [(RCWaveformGenerator *)self->_waveformGenerator canceled];
}

- (float)loadingProgress
{
  return -1.0;
}

- (double)duration
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = __Block_byref_object_copy__2;
  id v12 = __Block_byref_object_dispose__2;
  id v13 = 0;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __32__RCWaveformDataSource_duration__block_invoke;
  v7[3] = &unk_1E64963F0;
  v7[4] = self;
  void v7[5] = &v8;
  dispatch_sync(queue, v7);
  dispatch_semaphore_t v3 = (void *)v9[5];
  if (v3)
  {
    [v3 timeRange];
    double v5 = v4;
  }
  else
  {
    double v5 = 0.0;
  }
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __32__RCWaveformDataSource_duration__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(*(void *)(a1 + 32) + 8) segments];
  uint64_t v2 = [v5 lastObject];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  double v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)timeRangeToHighlight
{
  [(RCWaveformDataSource *)self duration];
  double v2 = v3.n128_f64[0];
  v3.n128_u64[0] = 0;
  double v4 = RCTimeRangeMake(v3, v2);
  result.var1 = v5;
  result.var0 = v4;
  return result;
}

- (BOOL)supportsLiveInput
{
  return 1;
}

- (id)waveformSegmentsInTimeRange:(id)a3
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = __Block_byref_object_copy__2;
  id v12 = __Block_byref_object_dispose__2;
  id v13 = 0;
  queue = self->_queue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __52__RCWaveformDataSource_waveformSegmentsInTimeRange___block_invoke;
  v6[3] = &unk_1E6496BE0;
  void v6[4] = self;
  v6[5] = &v8;
  $F24F406B2B787EFB06265DBA3D28CBD5 v7 = a3;
  dispatch_sync(queue, v6);
  id v4 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v4;
}

void __52__RCWaveformDataSource_waveformSegmentsInTimeRange___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) accumulatorWaveform];
  uint64_t v2 = objc_msgSend(v5, "segmentsByClippingToTimeRange:", *(double *)(a1 + 48), *(double *)(a1 + 56));
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)waveformSegmentsIntersectingTimeRange:(id)a3
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = __Block_byref_object_copy__2;
  id v12 = __Block_byref_object_dispose__2;
  id v13 = 0;
  queue = self->_queue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __62__RCWaveformDataSource_waveformSegmentsIntersectingTimeRange___block_invoke;
  v6[3] = &unk_1E6496BE0;
  void v6[4] = self;
  v6[5] = &v8;
  $F24F406B2B787EFB06265DBA3D28CBD5 v7 = a3;
  dispatch_sync(queue, v6);
  id v4 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v4;
}

void __62__RCWaveformDataSource_waveformSegmentsIntersectingTimeRange___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) accumulatorWaveform];
  uint64_t v2 = objc_msgSend(v5, "segmentsIntersectingTimeRange:", *(double *)(a1 + 48), *(double *)(a1 + 56));
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)segmentsInCompositionByConvertingFromActiveLoadingFragment:(id)a3
{
  id v3 = a3;
  return v3;
}

- (double)averagePowerLevelsRate
{
  uint64_t v6 = 0;
  $F24F406B2B787EFB06265DBA3D28CBD5 v7 = (double *)&v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __46__RCWaveformDataSource_averagePowerLevelsRate__block_invoke;
  v5[3] = &unk_1E64963F0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  double v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

double __46__RCWaveformDataSource_averagePowerLevelsRate__block_invoke(uint64_t a1)
{
  double result = (double)(unint64_t)[*(id *)(*(void *)(a1 + 32) + 8) averagePowerLevelsRate];
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (id)synchronouslyApproximateWaveformSegmentsByReadingCurrentFileAheadTimeRange:(id)a3
{
  return 0;
}

- (void)saveGeneratedWaveformIfNecessary
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v2 = 136315650;
  double v3 = "-[RCWaveformDataSource saveGeneratedWaveformIfNecessary]";
  __int16 v4 = 2112;
  id v5 = @"saved";
  __int16 v6 = 2112;
  uint64_t v7 = a1;
  _os_log_debug_impl(&dword_1C3964000, a2, OS_LOG_TYPE_DEBUG, "%s -- %@ waveform to %@", (uint8_t *)&v2, 0x20u);
}

void __56__RCWaveformDataSource_saveGeneratedWaveformIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 waveformDataSourceRequiresUpdate:*(void *)(a1 + 32)];
  }
}

- (BOOL)shouldMergeLiveWaveform
{
  return 1;
}

- (void)mergeGeneratedWaveformIfNecessary
{
  if ([(RCWaveformDataSource *)self shouldMergeLiveWaveform])
  {
    id v3 = [(RCWaveform *)self->_accumulatorWaveform segments];
    __int16 v4 = [v3 lastObject];

    if (v4)
    {
      [v4 timeRange];
      double v6 = v5 + -15.0;
    }
    else
    {
      double v6 = -15.0;
    }
    uint64_t v7 = [(RCWaveform *)self->_accumulatorWaveform segments];
    uint64_t v8 = [v7 count];

    if (v8)
    {
      CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
      if (Current - self->_liveRecordingMergeTime > 0.0333333333)
      {
        [(RCWaveformDataSource *)self durationPerWaveformSlice];
        double v11 = fmin(v10, 1.79769313e308);
        queue = self->_queue;
        v13[1] = 3221225472;
        v13[0] = MEMORY[0x1E4F143A8];
        v13[2] = __57__RCWaveformDataSource_mergeGeneratedWaveformIfNecessary__block_invoke;
        v13[3] = &unk_1E6496C30;
        if (v11 < 0.001) {
          double v11 = 0.001;
        }
        v13[4] = self;
        v13[5] = 0x403E000000000000;
        *(double *)&v13[6] = v6;
        *(double *)&v13[7] = v11;
        dispatch_sync(queue, v13);
        self->_liveRecordingMergeTime = Current;
      }
    }
  }
}

void __57__RCWaveformDataSource_mergeGeneratedWaveformIfNecessary__block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(*(void *)(a1 + 32) + 8) segments];
  id v3 = +[RCWaveformSegment segmentsByMergingSegments:v2 preferredSegmentDuration:*(double *)(a1 + 40) beforeTime:*(double *)(a1 + 48) andThenUsePreferredSegmentDuration:*(double *)(a1 + 56)];

  if ([v3 count]) {
    [*(id *)(*(void *)(a1 + 32) + 8) setSegments:v3];
  }
}

- (void)updateAccumulatorWaveformSegmentsWithBlock:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"RCWaveformDataSource.m" lineNumber:281 description:@"Invalid parameter"];
  }
  queue = self->_queue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __67__RCWaveformDataSource_updateAccumulatorWaveformSegmentsWithBlock___block_invoke;
  v9[3] = &unk_1E6496C58;
  void v9[4] = self;
  id v10 = v5;
  id v7 = v5;
  dispatch_sync(queue, v9);
}

void __67__RCWaveformDataSource_updateAccumulatorWaveformSegmentsWithBlock___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(*(void *)(a1 + 32) + 8) setSegments:v2];
}

- (void)waveformGeneratorDidFinishLoading:(id)a3 error:(id)a4
{
  id v5 = a4;
  double v6 = [(RCWaveformDataSource *)self generatedWaveformOutputURL];
  if (v5)
  {
    id v7 = OSLogForCategory(@"Default");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[RCWaveformDataSource waveformGeneratorDidFinishLoading:error:]((uint64_t)v5, v7);
    }

    if (self->_hasStartedLoading)
    {
      queue = self->_queue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __64__RCWaveformDataSource_waveformGeneratorDidFinishLoading_error___block_invoke;
      block[3] = &unk_1E64963A0;
      block[4] = self;
      dispatch_sync(queue, block);
      self->_hasStartedLoading = 0;
      uint64_t v9 = [MEMORY[0x1E4F28CB8] defaultManager];
      id v10 = [v6 path];
      int v11 = [v9 fileExistsAtPath:v10];

      if (v11)
      {
        id v12 = [MEMORY[0x1E4F28CB8] defaultManager];
        [v12 removeItemAtURL:v6 error:0];

        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        v14[2] = __64__RCWaveformDataSource_waveformGeneratorDidFinishLoading_error___block_invoke_2;
        v14[3] = &unk_1E64963A0;
        v14[4] = self;
        dispatch_async(MEMORY[0x1E4F14428], v14);
      }
    }
  }
  else
  {
    [(RCWaveformDataSource *)self saveGeneratedWaveformIfNecessary];
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __64__RCWaveformDataSource_waveformGeneratorDidFinishLoading_error___block_invoke_3;
  v13[3] = &unk_1E6496C08;
  v13[4] = self;
  [(RCWaveformDataSource *)self _performObserversBlock:v13];
}

uint64_t __64__RCWaveformDataSource_waveformGeneratorDidFinishLoading_error___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) removeAllSegments];
}

uint64_t __64__RCWaveformDataSource_waveformGeneratorDidFinishLoading_error___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) beginLoading];
}

uint64_t __64__RCWaveformDataSource_waveformGeneratorDidFinishLoading_error___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 waveformDataSourceDidFinishLoading:*(void *)(a1 + 32)];
}

- (void)waveformGenerator:(id)a3 didLoadWaveformSegment:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__RCWaveformDataSource_waveformGenerator_didLoadWaveformSegment___block_invoke;
  block[3] = &unk_1E6496350;
  block[4] = self;
  id v13 = v5;
  id v7 = v5;
  dispatch_sync(queue, block);
  [(RCWaveformDataSource *)self mergeGeneratedWaveformIfNecessary];
  uint64_t v8 = [(RCWaveformDataSource *)self segmentsInCompositionByConvertingFromActiveLoadingFragment:v7];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __65__RCWaveformDataSource_waveformGenerator_didLoadWaveformSegment___block_invoke_2;
  v10[3] = &unk_1E6496C80;
  void v10[4] = self;
  id v11 = v8;
  id v9 = v8;
  [(RCWaveformDataSource *)self _performObserversBlock:v10];
}

uint64_t __65__RCWaveformDataSource_waveformGenerator_didLoadWaveformSegment___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) addSegment:*(void *)(a1 + 40)];
}

uint64_t __65__RCWaveformDataSource_waveformGenerator_didLoadWaveformSegment___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 waveformDataSource:*(void *)(a1 + 32) didLoadWaveformSegment:*(void *)(a1 + 40)];
}

- (void)_performOnObserversBlock:(id)a3
{
}

- (void)_performObserversBlock:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  __int16 v4 = (void (**)(id, void))a3;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__2;
  v19 = __Block_byref_object_dispose__2;
  id v20 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__RCWaveformDataSource__performObserversBlock___block_invoke;
  block[3] = &unk_1E64963F0;
  block[4] = self;
  void block[5] = &v15;
  dispatch_sync(queue, block);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v6 = (id)v16[5];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v10 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v6);
        }
        v4[2](v4, *(void *)(*((void *)&v10 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v10 objects:v21 count:16];
    }
    while (v7);
  }

  _Block_object_dispose(&v15, 8);
}

uint64_t __47__RCWaveformDataSource__performObserversBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 72) allObjects];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;
  return MEMORY[0x1F41817F8](v2, v4);
}

- (id)copyWithTrackIndex:(unint64_t)a3 emptyCopy:(BOOL)a4
{
  id v6 = [RCWaveformDataSource alloc];
  waveformGenerator = self->_waveformGenerator;
  generatedWaveformOutputURL = self->_generatedWaveformOutputURL;
  return [(RCWaveformDataSource *)v6 initWithWaveformGenerator:waveformGenerator generatedWaveformOutputURL:generatedWaveformOutputURL trackIndex:a3];
}

- (RCWaveformGenerator)waveformGenerator
{
  return self->_waveformGenerator;
}

- (RCWaveform)accumulatorWaveform
{
  return &self->_accumulatorWaveform->super;
}

- (double)durationPerWaveformSlice
{
  return self->_durationPerWaveformSlice;
}

- (void)setDurationPerWaveformSlice:(double)a3
{
  self->_durationPerWaveformSlice = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (BOOL)hasSavedGeneratedWaveform
{
  return self->_hasSavedGeneratedWaveform;
}

- (void)setHasSavedGeneratedWaveform:(BOOL)a3
{
  self->_hasSavedGeneratedWaveform = a3;
}

- (unint64_t)trackIndex
{
  return self->_trackIndex;
}

- (void)setTrackIndex:(unint64_t)a3
{
  self->_trackIndex = a3;
}

- (NSURL)generatedWaveformOutputURL
{
  return self->_generatedWaveformOutputURL;
}

- (NSHashTable)weakObservers
{
  return self->_weakObservers;
}

- (BOOL)hasStartedLoading
{
  return self->_hasStartedLoading;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_weakObservers, 0);
  objc_storeStrong((id *)&self->_generatedWaveformOutputURL, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_waveformGenerator, 0);
  objc_storeStrong((id *)&self->_accumulatorWaveform, 0);
}

- (void)waveformGeneratorDidFinishLoading:(uint64_t)a1 error:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 136315394;
  uint64_t v3 = "-[RCWaveformDataSource waveformGeneratorDidFinishLoading:error:]";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_1C3964000, a2, OS_LOG_TYPE_ERROR, "%s -- Waveform generator reported loading error! %@", (uint8_t *)&v2, 0x16u);
}

@end