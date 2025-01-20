@interface RCCaptureInputWaveformDataSource
- ($F24F406B2B787EFB06265DBA3D28CBD5)timeRangeToHighlight;
- (BOOL)appendAveragePowerLevelsByDigestingAudioPCMBuffer:(id)a3;
- (BOOL)appendAveragePowerLevelsByDigestingCapturedSampleBuffer:(opaqueCMSampleBuffer *)a3;
- (BOOL)canUpdateCaptureComposition;
- (BOOL)emptyCopy;
- (BOOL)setPaused:(BOOL)a3;
- (BOOL)shouldMergeLiveWaveform;
- (BOOL)waitUntilFinished;
- (BOOL)waitUntilFinishedWithFinalizedDestinationFragmentDuration:(double)a3;
- (NSArray)captureInitialDecomposedFragments;
- (RCCaptureInputWaveformDataSource)initWithDestinationComposition:(id)a3 destinationFragment:(id)a4 trackIndex:(unint64_t)a5;
- (RCComposition)destinationComposition;
- (RCCompositionFragment)destinationFragment;
- (RCCompositionWaveformDataSource)baseWaveformDataSource;
- (RCMutableComposition)capturedComposition;
- (RCMutableCompositionFragment)capturedFragment;
- (RCWaveform)baseWaveform;
- (double)_fragmentDuration;
- (double)captureInsertionDurationInComposition;
- (double)captureInsertionTimeInComposition;
- (double)duration;
- (double)finalCapturedFragmentDuration;
- (double)updatedCapturedFragmentDuration;
- (id)_captureSegmentsInComponentWaveform:(id)a3 captureTimeRange:(id)a4 componentWaveformSegmentOffset:(double)a5;
- (id)copyWithTrackIndex:(unint64_t)a3 emptyCopy:(BOOL)a4;
- (id)segmentsInCompositionByConvertingFromActiveLoadingFragment:(id)a3;
- (id)waveformSegmentsInTimeRange:(id)a3;
- (void)_captureSesionCompletedWithFinalizedDuration:(double)a3;
- (void)_extendAccumulatedWaveformSegmentsToMatchFinalDuration:(double)a3;
- (void)_initializeCaptureComposition;
- (void)_modifyAccumulatedWaveformSegmentsToMatchFinalDuration:(double)a3;
- (void)_truncateAccumulatedWaveformSegmentsToEndTime:(double)a3;
- (void)_updateCapturedComposition:(BOOL)a3;
- (void)appendAveragePowerLevelsByDigestingWaveformSegment:(id)a3;
- (void)cancelLoading;
- (void)finishLoadingWithCompletionTimeout:(unint64_t)a3 completionBlock:(id)a4;
- (void)finishLoadingWithCompletionTimeout:(unint64_t)a3 finalizedFragmentDuration:(double)a4 completionBlock:(id)a5;
- (void)flushPendingCapturedSampleBuffers;
- (void)setEmptyCopy:(BOOL)a3;
- (void)startLoading;
- (void)undoCapture;
- (void)updateCapturedDelta:(double)a3;
- (void)waveformDataSource:(id)a3 didLoadWaveformSegment:(id)a4;
- (void)waveformDataSourceDidFinishLoading:(id)a3;
- (void)waveformDataSourceRequiresUpdate:(id)a3;
@end

@implementation RCCaptureInputWaveformDataSource

- (RCCaptureInputWaveformDataSource)initWithDestinationComposition:(id)a3 destinationFragment:(id)a4 trackIndex:(unint64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v11 = [RCWaveformGenerator alloc];
  +[RCDevice audioInputWaveformFlushInterval];
  v12 = -[RCWaveformGenerator initWithSegmentFlushInterval:trackIndex:](v11, "initWithSegmentFlushInterval:trackIndex:", a5);
  v13 = [v10 waveformURL];
  v16.receiver = self;
  v16.super_class = (Class)RCCaptureInputWaveformDataSource;
  v14 = [(RCWaveformDataSource *)&v16 initWithWaveformGenerator:v12 generatedWaveformOutputURL:v13 trackIndex:a5];

  if (v14)
  {
    v14->_updatedCapturedFragmentDuration = -3.40282347e38;
    v14->_finalCapturedFragmentDuration = -1.0;
    v14->_canUpdateCaptureComposition = 1;
    objc_storeStrong((id *)&v14->_destinationComposition, a3);
    objc_storeStrong((id *)&v14->_destinationFragment, a4);
    [(RCCaptureInputWaveformDataSource *)v14 _initializeCaptureComposition];
  }

  return v14;
}

- (void)_initializeCaptureComposition
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  [(RCCompositionFragment *)self->_destinationFragment timeRangeInComposition];
  self->_captureInsertionTimeInComposition = v3;
  self->_captureInsertionDurationInComposition = v4 - v3;
  v5 = (RCMutableCompositionFragment *)[(RCCompositionFragment *)self->_destinationFragment mutableCopy];
  capturedFragment = self->_capturedFragment;
  self->_capturedFragment = v5;

  v7.n128_u64[0] = *(void *)&self->_captureInsertionTimeInComposition;
  [(RCCompositionFragment *)self->_capturedFragment setTimeRangeInComposition:RCTimeRangeMake(v7, v7.n128_f64[0])];
  -[RCCompositionFragment setTimeRangeInContentToUse:](self->_capturedFragment, "setTimeRangeInContentToUse:", -1.79769313e308, 1.79769313e308);
  v8 = (RCMutableComposition *)[(RCComposition *)self->_destinationComposition mutableCopy];
  capturedComposition = self->_capturedComposition;
  self->_capturedComposition = v8;

  id v10 = [MEMORY[0x1E4F1CA48] array];
  v11 = [MEMORY[0x1E4F1CA48] array];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  v12 = [(RCComposition *)self->_capturedComposition composedFragments];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v26 objects:v38 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v27 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        v18 = (void *)[v17 copy];
        [v10 addObject:v18];

        v19 = (void *)[v17 mutableCopy];
        [v11 addObject:v19];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v26 objects:v38 count:16];
    }
    while (v14);
  }

  v20 = (void *)[(RCMutableCompositionFragment *)self->_capturedFragment copy];
  [v10 addObject:v20];

  v21 = (void *)[(RCMutableCompositionFragment *)self->_capturedFragment mutableCopy];
  [v11 addObject:v21];

  [(RCComposition *)self->_capturedComposition setDecomposedFragments:v11];
  objc_storeStrong((id *)&self->_captureInitialDecomposedFragments, v10);
  v22 = OSLogForCategory(@"Default");
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    destinationComposition = self->_destinationComposition;
    destinationFragment = self->_destinationFragment;
    v25 = self->_capturedComposition;
    *(_DWORD *)buf = 136315906;
    v31 = "-[RCCaptureInputWaveformDataSource _initializeCaptureComposition]";
    __int16 v32 = 2112;
    v33 = destinationComposition;
    __int16 v34 = 2112;
    v35 = destinationFragment;
    __int16 v36 = 2112;
    v37 = v25;
    _os_log_debug_impl(&dword_1C3964000, v22, OS_LOG_TYPE_DEBUG, "%s -- initializing capture waveform data source.\n  original composition = %@\n  original fragment = %@\n  initial capture composition = %@", buf, 0x2Au);
  }

  [(RCCaptureInputWaveformDataSource *)self _updateCapturedComposition:1];
}

- (void)waveformDataSourceDidFinishLoading:(id)a3
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __71__RCCaptureInputWaveformDataSource_waveformDataSourceDidFinishLoading___block_invoke;
  v6[3] = &unk_1E6496C08;
  v6[4] = self;
  id v4 = a3;
  [(RCWaveformDataSource *)self _performObserversBlock:v6];
  [v4 removeObserver:self];

  baseWaveformDataSource = self->_baseWaveformDataSource;
  self->_baseWaveformDataSource = 0;
}

uint64_t __71__RCCaptureInputWaveformDataSource_waveformDataSourceDidFinishLoading___block_invoke(uint64_t a1, void *a2)
{
  return [a2 waveformDataSourceDidFinishLoading:*(void *)(a1 + 32)];
}

- (void)waveformDataSource:(id)a3 didLoadWaveformSegment:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (!self->_emptyCopy)
  {
    id v12 = v7;
    goto LABEL_5;
  }
  [v7 timeRange];
  double captureInsertionTimeInComposition = self->_captureInsertionTimeInComposition;
  if (v10 >= captureInsertionTimeInComposition)
  {
    v11 = (void *)[v8 copyEmptiedWithTimeRangeOffsetByTimeOffset:-captureInsertionTimeInComposition];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __78__RCCaptureInputWaveformDataSource_waveformDataSource_didLoadWaveformSegment___block_invoke;
    v16[3] = &unk_1E6497A48;
    id v12 = v11;
    id v17 = v12;
    [(RCWaveformDataSource *)self updateAccumulatorWaveformSegmentsWithBlock:v16];

LABEL_5:
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __78__RCCaptureInputWaveformDataSource_waveformDataSource_didLoadWaveformSegment___block_invoke_2;
    v14[3] = &unk_1E6496C80;
    v14[4] = self;
    id v15 = v12;
    id v13 = v12;
    [(RCWaveformDataSource *)self _performObserversBlock:v14];
  }
}

id __78__RCCaptureInputWaveformDataSource_waveformDataSource_didLoadWaveformSegment___block_invoke(uint64_t a1, void *a2)
{
  double v3 = [a2 segmentsCopy];
  id v4 = (void *)[v3 mutableCopy];

  [v4 addObject:*(void *)(a1 + 32)];
  return v4;
}

uint64_t __78__RCCaptureInputWaveformDataSource_waveformDataSource_didLoadWaveformSegment___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 waveformDataSource:*(void *)(a1 + 32) didLoadWaveformSegment:*(void *)(a1 + 40)];
}

- (void)waveformDataSourceRequiresUpdate:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __69__RCCaptureInputWaveformDataSource_waveformDataSourceRequiresUpdate___block_invoke;
  v3[3] = &unk_1E6496C08;
  v3[4] = self;
  [(RCWaveformDataSource *)self _performObserversBlock:v3];
}

void __69__RCCaptureInputWaveformDataSource_waveformDataSourceRequiresUpdate___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 waveformDataSourceRequiresUpdate:*(void *)(a1 + 32)];
  }
}

- (void)cancelLoading
{
  v3.receiver = self;
  v3.super_class = (Class)RCCaptureInputWaveformDataSource;
  [(RCWaveformDataSource *)&v3 cancelLoading];
  [(RCCompositionWaveformDataSource *)self->_baseWaveformDataSource cancelLoading];
}

- (void)startLoading
{
  objc_super v3 = [(RCComposition *)self->_destinationComposition composedWaveformURLForTrackIndex:[(RCWaveformDataSource *)self trackIndex]];
  +[RCWaveform waveformWithContentsOfURL:minimumRequiredVersion:](RCMutableWaveform, "waveformWithContentsOfURL:minimumRequiredVersion:", v3, +[RCWaveform version]);
  id v11 = (id)objc_claimAutoreleasedReturnValue();

  id v4 = [v11 segments];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    id v6 = (RCWaveform *)v11;
    baseWaveform = self->_baseWaveform;
    self->_baseWaveform = v6;
  }
  else
  {
    v8 = [[RCCompositionWaveformDataSource alloc] initWithComposition:self->_destinationComposition trackIndex:[(RCWaveformDataSource *)self trackIndex]];
    [(RCWaveformDataSource *)v8 addObserver:self];
    [(RCWaveformDataSource *)v8 beginLoading];
    id v9 = [(RCWaveformDataSource *)v8 accumulatorWaveform];
    double v10 = self->_baseWaveform;
    self->_baseWaveform = v9;

    baseWaveform = self->_baseWaveformDataSource;
    self->_baseWaveformDataSource = v8;
  }
}

- (void)finishLoadingWithCompletionTimeout:(unint64_t)a3 completionBlock:(id)a4
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v6 handleFailureInMethod:a2 object:self file:@"RCCaptureInputWaveformDataSource.m" lineNumber:160 description:@"ERROR: use -finishLoadingWithCompletionTimeout:finalizedFragmentDuration:completionBlock: instead"];
}

- (BOOL)waitUntilFinished
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"RCCaptureInputWaveformDataSource.m" lineNumber:165 description:@"ERROR: use -waitUntilFinishedWithFinalizedDestinationFragmentDuration: instead"];

  return 0;
}

- (void)finishLoadingWithCompletionTimeout:(unint64_t)a3 finalizedFragmentDuration:(double)a4 completionBlock:(id)a5
{
  id v8 = a5;
  [(RCCompositionWaveformDataSource *)self->_baseWaveformDataSource waitUntilSegmentsFinishLoadingWithTimeout:a3];
  id v9 = [(RCWaveformDataSource *)self waveformGenerator];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __113__RCCaptureInputWaveformDataSource_finishLoadingWithCompletionTimeout_finalizedFragmentDuration_completionBlock___block_invoke;
  v11[3] = &unk_1E6497A70;
  double v13 = a4;
  v11[4] = self;
  id v12 = v8;
  id v10 = v8;
  [v9 finishLoadingWithCompletionTimeout:a3 completionBlock:v11];
}

void __113__RCCaptureInputWaveformDataSource_finishLoadingWithCompletionTimeout_finalizedFragmentDuration_completionBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  [*(id *)(a1 + 32) _captureSesionCompletedWithFinalizedDuration:*(double *)(a1 + 48)];
  [*(id *)(a1 + 32) saveGeneratedWaveformIfNecessary];
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(uint64_t, uint64_t, id))(v5 + 16))(v5, a2, v6);
  }
}

- (BOOL)waitUntilFinishedWithFinalizedDestinationFragmentDuration:(double)a3
{
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __94__RCCaptureInputWaveformDataSource_waitUntilFinishedWithFinalizedDestinationFragmentDuration___block_invoke;
  v10[3] = &unk_1E6496BB8;
  dispatch_semaphore_t v11 = v5;
  id v6 = v5;
  [(RCCaptureInputWaveformDataSource *)self finishLoadingWithCompletionTimeout:-1 finalizedFragmentDuration:v10 completionBlock:a3];
  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  id v7 = [(RCWaveformDataSource *)self waveformGenerator];
  int v8 = [v7 canceled] ^ 1;

  return v8;
}

intptr_t __94__RCCaptureInputWaveformDataSource_waitUntilFinishedWithFinalizedDestinationFragmentDuration___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)setPaused:(BOOL)a3
{
  return 0;
}

- (id)_captureSegmentsInComponentWaveform:(id)a3 captureTimeRange:(id)a4 componentWaveformSegmentOffset:(double)a5
{
  double var1 = a4.var1;
  double var0 = a4.var0;
  if (a5 == 0.0)
  {
    id v7 = a3;
    objc_msgSend(v7, "segmentsByClippingToTimeRange:", var0, var1);
  }
  else
  {
    double v9 = -a5;
    id v10 = a3;
    objc_msgSend(v10, "segmentsByClippingToTimeRange:", RCTimeRangeShift(var0, var1, v9));
    id v7 = (id)objc_claimAutoreleasedReturnValue();

    +[RCWaveformSegment segmentsByShiftingSegments:v7 byTimeOffset:a5];
  dispatch_semaphore_t v11 = };

  return v11;
}

- (void)updateCapturedDelta:(double)a3
{
  self->captureDelta = a3;
}

- (id)waveformSegmentsInTimeRange:(id)a3
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v6 = [MEMORY[0x1E4F1CA48] array];
  v42.receiver = self;
  v42.super_class = (Class)RCCaptureInputWaveformDataSource;
  [(RCWaveformDataSource *)&v42 duration];
  if (v7.n128_f64[0] < self->captureDelta) {
    v7.n128_u64[0] = *(void *)&self->captureDelta;
  }
  double v8 = self->_captureInsertionTimeInComposition + v7.n128_f64[0];
  v7.n128_u64[0] = *(void *)&self->_captureInsertionTimeInComposition;
  double v10 = RCTimeRangeMake(v7, v8);
  double v12 = v11;
  if (var0 < self->_captureInsertionTimeInComposition)
  {
    if (var1 >= v10) {
      double v13 = v10;
    }
    else {
      double v13 = var1;
    }
    v9.n128_f64[0] = var0;
    uint64_t v14 = -[RCCaptureInputWaveformDataSource _captureSegmentsInComponentWaveform:captureTimeRange:componentWaveformSegmentOffset:](self, "_captureSegmentsInComponentWaveform:captureTimeRange:componentWaveformSegmentOffset:", self->_baseWaveform, RCTimeRangeMake(v9, v13));
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v38 objects:v44 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v39;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v39 != v16) {
            objc_enumerationMutation(v14);
          }
          [*(id *)(*((void *)&v38 + 1) + 8 * i) setIsRendered:1];
        }
        uint64_t v15 = [v14 countByEnumeratingWithState:&v38 objects:v44 count:16];
      }
      while (v15);
    }
    [v6 addObjectsFromArray:v14];
  }
  if (var1 > v10)
  {
    double v18 = RCTimeRangeIntersectTimeRange(var0, var1, v10, v12);
    uint64_t v20 = v19;
    uint64_t v32 = 0;
    v33 = &v32;
    uint64_t v34 = 0x3032000000;
    v35 = __Block_byref_object_copy__13;
    __int16 v36 = __Block_byref_object_dispose__13;
    id v37 = 0;
    v21 = [(RCWaveformDataSource *)self queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __64__RCCaptureInputWaveformDataSource_waveformSegmentsInTimeRange___block_invoke;
    block[3] = &unk_1E6497A98;
    block[4] = self;
    block[5] = &v32;
    *(double *)&block[6] = v18;
    block[7] = v20;
    *(double *)&block[8] = v10;
    *(double *)&block[9] = v12;
    dispatch_sync(v21, block);

    if (v33[5]) {
      objc_msgSend(v6, "addObjectsFromArray:");
    }
    _Block_object_dispose(&v32, 8);
  }
  if (var1 > v12)
  {
    if (v12 >= var0) {
      v9.n128_f64[0] = v12;
    }
    else {
      v9.n128_f64[0] = var0;
    }
    v22 = -[RCCaptureInputWaveformDataSource _captureSegmentsInComponentWaveform:captureTimeRange:componentWaveformSegmentOffset:](self, "_captureSegmentsInComponentWaveform:captureTimeRange:componentWaveformSegmentOffset:", self->_baseWaveform, RCTimeRangeMake(v9, var1));
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    uint64_t v23 = [v22 countByEnumeratingWithState:&v27 objects:v43 count:16];
    if (v23)
    {
      uint64_t v24 = *(void *)v28;
      do
      {
        for (uint64_t j = 0; j != v23; ++j)
        {
          if (*(void *)v28 != v24) {
            objc_enumerationMutation(v22);
          }
          [*(id *)(*((void *)&v27 + 1) + 8 * j) setIsRendered:1];
        }
        uint64_t v23 = [v22 countByEnumeratingWithState:&v27 objects:v43 count:16];
      }
      while (v23);
    }
    [v6 addObjectsFromArray:v22];
  }
  return v6;
}

void __64__RCCaptureInputWaveformDataSource_waveformSegmentsInTimeRange___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v6 = [v2 accumulatorWaveform];
  uint64_t v3 = objc_msgSend(v2, "_captureSegmentsInComponentWaveform:captureTimeRange:componentWaveformSegmentOffset:", v6, *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  dispatch_semaphore_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)timeRangeToHighlight
{
  [(RCCaptureInputWaveformDataSource *)self _fragmentDuration];
  double v3 = v4.n128_f64[0] + self->_captureInsertionTimeInComposition;
  v4.n128_u64[0] = *(void *)&self->_captureInsertionTimeInComposition;
  double v5 = RCTimeRangeMake(v4, v3);
  result.double var1 = v6;
  result.double var0 = v5;
  return result;
}

- (id)segmentsInCompositionByConvertingFromActiveLoadingFragment:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  __n128 v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a3;
  double v6 = [v4 arrayWithObjects:&v10 count:1];
  __n128 v7 = +[RCWaveformSegment segmentsByShiftingSegments:byTimeOffset:](RCWaveformSegment, "segmentsByShiftingSegments:byTimeOffset:", v6, self->_captureInsertionTimeInComposition, v10, v11);

  double v8 = [v7 firstObject];

  return v8;
}

- (RCMutableComposition)capturedComposition
{
  [(RCCaptureInputWaveformDataSource *)self _updateCapturedComposition:0];
  capturedComposition = self->_capturedComposition;
  return capturedComposition;
}

- (RCMutableCompositionFragment)capturedFragment
{
  [(RCCaptureInputWaveformDataSource *)self _updateCapturedComposition:0];
  capturedFragment = self->_capturedFragment;
  return capturedFragment;
}

- (double)duration
{
  [(RCCaptureInputWaveformDataSource *)self _updateCapturedComposition:0];
  capturedComposition = self->_capturedComposition;
  [(RCComposition *)capturedComposition composedDuration];
  return result;
}

- (void)undoCapture
{
  __n128 v4 = [(RCWaveformDataSource *)self waveformGenerator];
  char v5 = [v4 idle];

  if ((v5 & 1) == 0)
  {
    double v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"RCCaptureInputWaveformDataSource.m", 290, @"Invalid state to perform capture undo, generator has not finished yet." object file lineNumber description];
  }
  [(RCCompositionFragment *)self->_capturedFragment deleteFromFilesystem];
  [(RCCompositionFragment *)self->_capturedFragment setContentDuration:0.0];
  double v6 = (RCMutableComposition *)[(RCComposition *)self->_destinationComposition mutableCopy];
  capturedComposition = self->_capturedComposition;
  self->_capturedComposition = v6;

  self->_canUpdateCaptureComposition = 0;
}

- (BOOL)appendAveragePowerLevelsByDigestingCapturedSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  __n128 v4 = [(RCWaveformDataSource *)self waveformGenerator];
  LOBYTE(a3) = [v4 appendAveragePowerLevelsByDigestingSampleBuffer:a3];

  return (char)a3;
}

- (BOOL)appendAveragePowerLevelsByDigestingAudioPCMBuffer:(id)a3
{
  id v4 = a3;
  char v5 = [(RCWaveformDataSource *)self waveformGenerator];
  char v6 = [v5 appendAveragePowerLevelsByDigestingAudioPCMBuffer:v4];

  return v6;
}

- (void)flushPendingCapturedSampleBuffers
{
  id v2 = [(RCWaveformDataSource *)self waveformGenerator];
  [v2 flushPendingCapturedSampleBuffers];
}

- (void)appendAveragePowerLevelsByDigestingWaveformSegment:(id)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = [(RCWaveformDataSource *)self waveformGenerator];
  v7[0] = v4;
  char v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];

  [v5 appendAveragePowerLevelsByDigestingWaveformSegments:v6];
}

- (void)_captureSesionCompletedWithFinalizedDuration:(double)a3
{
  self->_finalCapturedFragmentDuration = a3;
  [(RCCaptureInputWaveformDataSource *)self _updateCapturedComposition:1];
  self->_canUpdateCaptureComposition = 0;
}

- (double)_fragmentDuration
{
  double result = self->_finalCapturedFragmentDuration;
  if (result < 0.0)
  {
    v3.receiver = self;
    v3.super_class = (Class)RCCaptureInputWaveformDataSource;
    [(RCWaveformDataSource *)&v3 duration];
  }
  return result;
}

- (void)_updateCapturedComposition:(BOOL)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  [(RCCaptureInputWaveformDataSource *)self _fragmentDuration];
  double v7 = v6;
  if (a3 || vabdd_f64(v6, self->_updatedCapturedFragmentDuration) >= 0.01)
  {
    self->_updatedCapturedFragmentDuration = v6;
    [(RCCompositionFragment *)self->_capturedFragment setContentDuration:v6];
    v8.n128_u64[0] = *(void *)&self->_captureInsertionTimeInComposition;
    [(RCCompositionFragment *)self->_capturedFragment setTimeRangeInComposition:RCTimeRangeMake(v8, v7 + v8.n128_f64[0])];
    __n128 v9 = [(RCComposition *)self->_capturedComposition decomposedFragments];
    id v10 = (void *)[v9 mutableCopy];

    [v10 removeLastObject];
    [v10 addObject:self->_capturedFragment];
    [(RCComposition *)self->_capturedComposition setDecomposedFragments:v10];
    if (self->_finalCapturedFragmentDuration > 0.0)
    {
      uint64_t v11 = [(RCWaveformDataSource *)self accumulatorWaveform];
      double v12 = [v11 segmentsCopy];
      double v13 = [v12 lastObject];

      if (v13)
      {
        [v13 timeRange];
        double finalCapturedFragmentDuration = self->_finalCapturedFragmentDuration;
        if (vabdd_f64(v15, finalCapturedFragmentDuration) > 0.00000011920929)
        {
          [v13 timeRange];
          if (finalCapturedFragmentDuration - v16 >= 1.0)
          {
            uint64_t v24 = [MEMORY[0x1E4F28B00] currentHandler];
            [v24 handleFailureInMethod:a2, self, @"RCCaptureInputWaveformDataSource.m", 368, @"significant mismatch between waveform and m4a durations detected, saved duration is > accumulated waveform duration" object file lineNumber description];
          }
          [v13 timeRange];
          double v18 = self->_finalCapturedFragmentDuration;
          if (v18 > 0.00000011920929)
          {
            double v19 = v17;
            if (vabdd_f64(v18, v17) >= 0.07)
            {
              [v13 timeRange];
              uint64_t v21 = v20;
              double v22 = self->_finalCapturedFragmentDuration;
              uint64_t v23 = OSLogForCategory(@"Default");
              if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
              {
                int v25 = 136315906;
                long long v26 = "-[RCCaptureInputWaveformDataSource _updateCapturedComposition:]";
                __int16 v27 = 2048;
                double v28 = v22;
                __int16 v29 = 2048;
                uint64_t v30 = v21;
                __int16 v31 = 2048;
                double v32 = v18 - v19;
                _os_log_impl(&dword_1C3964000, v23, OS_LOG_TYPE_INFO, "%s -- DURATION MISMATCH: AVAsset.duration = %.3f, duration derived from samples = %.3f (delta = %.6f)!", (uint8_t *)&v25, 0x2Au);
              }

              double v18 = self->_finalCapturedFragmentDuration;
            }
          }
          [(RCCaptureInputWaveformDataSource *)self _modifyAccumulatedWaveformSegmentsToMatchFinalDuration:v18];
        }
      }
    }
  }
}

- (void)_modifyAccumulatedWaveformSegmentsToMatchFinalDuration:(double)a3
{
  char v5 = [(RCWaveformDataSource *)self accumulatorWaveform];
  double v6 = [v5 segmentsCopy];
  id v9 = [v6 lastObject];

  double v7 = v9;
  if (v9)
  {
    [v9 timeRange];
    if (v8 >= a3) {
      [(RCCaptureInputWaveformDataSource *)self _truncateAccumulatedWaveformSegmentsToEndTime:a3];
    }
    else {
      [(RCCaptureInputWaveformDataSource *)self _extendAccumulatedWaveformSegmentsToMatchFinalDuration:a3];
    }
    double v7 = v9;
  }
}

- (void)_extendAccumulatedWaveformSegmentsToMatchFinalDuration:(double)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __91__RCCaptureInputWaveformDataSource__extendAccumulatedWaveformSegmentsToMatchFinalDuration___block_invoke;
  v3[3] = &unk_1E6497AC0;
  *(double *)&void v3[5] = a3;
  v3[4] = self;
  [(RCWaveformDataSource *)self updateAccumulatorWaveformSegmentsWithBlock:v3];
}

id __91__RCCaptureInputWaveformDataSource__extendAccumulatedWaveformSegmentsToMatchFinalDuration___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  objc_super v3 = [a2 segmentsCopy];
  id v4 = [v3 lastObject];
  char v5 = (void *)[v3 mutableCopy];
  [v5 removeLastObject];
  [v4 timeRange];
  double v7 = objc_msgSend(v4, "copyWithAdjustedTimeRange:", RCTimeRangeMake(v6, *(double *)(a1 + 40)));
  [v5 addObject:v7];
  double v8 = OSLogForCategory(@"Default");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    id v10 = [*(id *)(*(void *)(a1 + 32) + 104) AVOutputURL];
    uint64_t v11 = [v10 path];
    uint64_t v12 = *(void *)(a1 + 40);
    int v13 = 136316162;
    uint64_t v14 = "-[RCCaptureInputWaveformDataSource _extendAccumulatedWaveformSegmentsToMatchFinalDuration:]_block_invoke";
    __int16 v15 = 2112;
    double v16 = v11;
    __int16 v17 = 2048;
    uint64_t v18 = v12;
    __int16 v19 = 2112;
    uint64_t v20 = v4;
    __int16 v21 = 2112;
    double v22 = v7;
    _os_log_debug_impl(&dword_1C3964000, v8, OS_LOG_TYPE_DEBUG, "%s -- Modifying waveform segments of %@ to match asset final duration (%.2f) by extending last segment.  Last segment was %@, now %@", (uint8_t *)&v13, 0x34u);
  }
  return v5;
}

- (void)_truncateAccumulatedWaveformSegmentsToEndTime:(double)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __82__RCCaptureInputWaveformDataSource__truncateAccumulatedWaveformSegmentsToEndTime___block_invoke;
  v3[3] = &unk_1E6497AC0;
  *(double *)&void v3[5] = a3;
  v3[4] = self;
  [(RCWaveformDataSource *)self updateAccumulatorWaveformSegmentsWithBlock:v3];
}

id __82__RCCaptureInputWaveformDataSource__truncateAccumulatedWaveformSegmentsToEndTime___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 segmentsCopy];
  char v5 = [v4 firstObject];
  __n128 v6 = [v4 lastObject];
  if (v6)
  {
    [v5 timeRange];
    double v8 = objc_msgSend(v3, "segmentsByClippingToTimeRange:", RCTimeRangeMake(v7, *(double *)(a1 + 40)));
    id v9 = v4;
    if (v8)
    {
      id v10 = OSLogForCategory(@"Default");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        int v13 = [*(id *)(*(void *)(a1 + 32) + 104) AVOutputURL];
        uint64_t v14 = [v13 path];
        uint64_t v15 = *(void *)(a1 + 40);
        double v16 = [v8 lastObject];
        int v17 = 136316162;
        uint64_t v18 = "-[RCCaptureInputWaveformDataSource _truncateAccumulatedWaveformSegmentsToEndTime:]_block_invoke";
        __int16 v19 = 2112;
        uint64_t v20 = v14;
        __int16 v21 = 2048;
        uint64_t v22 = v15;
        __int16 v23 = 2112;
        uint64_t v24 = v6;
        __int16 v25 = 2112;
        long long v26 = v16;
        _os_log_debug_impl(&dword_1C3964000, v10, OS_LOG_TYPE_DEBUG, "%s -- Modifying waveform segments of %@ to match asset final duration (%.2f) by truncating waveform.  Last segment was %@, now %@", (uint8_t *)&v17, 0x34u);
      }
      id v9 = v8;
    }
    id v11 = v9;
  }
  else
  {
    id v11 = v4;
  }

  return v11;
}

- (BOOL)shouldMergeLiveWaveform
{
  return 1;
}

- (id)copyWithTrackIndex:(unint64_t)a3 emptyCopy:(BOOL)a4
{
  BOOL v4 = a4;
  __n128 v6 = [[RCCaptureInputWaveformDataSource alloc] initWithDestinationComposition:self->_destinationComposition destinationFragment:self->_destinationFragment trackIndex:a3];
  __n128 v7 = v6;
  if (v4)
  {
    [(RCCaptureInputWaveformDataSource *)v6 setEmptyCopy:1];
    [(RCWaveformDataSource *)self addObserver:v7];
  }
  return v7;
}

- (RCComposition)destinationComposition
{
  return self->_destinationComposition;
}

- (RCCompositionFragment)destinationFragment
{
  return self->_destinationFragment;
}

- (RCWaveform)baseWaveform
{
  return self->_baseWaveform;
}

- (RCCompositionWaveformDataSource)baseWaveformDataSource
{
  return self->_baseWaveformDataSource;
}

- (double)updatedCapturedFragmentDuration
{
  return self->_updatedCapturedFragmentDuration;
}

- (double)finalCapturedFragmentDuration
{
  return self->_finalCapturedFragmentDuration;
}

- (BOOL)canUpdateCaptureComposition
{
  return self->_canUpdateCaptureComposition;
}

- (double)captureInsertionTimeInComposition
{
  return self->_captureInsertionTimeInComposition;
}

- (double)captureInsertionDurationInComposition
{
  return self->_captureInsertionDurationInComposition;
}

- (NSArray)captureInitialDecomposedFragments
{
  return self->_captureInitialDecomposedFragments;
}

- (BOOL)emptyCopy
{
  return self->_emptyCopy;
}

- (void)setEmptyCopy:(BOOL)a3
{
  self->_emptyCopy = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_captureInitialDecomposedFragments, 0);
  objc_storeStrong((id *)&self->_baseWaveformDataSource, 0);
  objc_storeStrong((id *)&self->_baseWaveform, 0);
  objc_storeStrong((id *)&self->_destinationFragment, 0);
  objc_storeStrong((id *)&self->_destinationComposition, 0);
  objc_storeStrong((id *)&self->_capturedFragment, 0);
  objc_storeStrong((id *)&self->_capturedComposition, 0);
}

@end