@interface RCCompositionWaveformDataSource
- ($F24F406B2B787EFB06265DBA3D28CBD5)timeRangeToHighlight;
- (BOOL)_synchronouslyAppendSegmentsFromDataSource:(id)a3;
- (BOOL)highlightLastDecomposedFragment;
- (BOOL)preferLoadingFragmentWaveforms;
- (BOOL)saveGeneratedWaveform;
- (BOOL)shouldMergeLiveWaveform;
- (BOOL)supportsLiveInput;
- (OS_dispatch_group)loadingGroup;
- (RCComposition)composition;
- (RCCompositionWaveformDataSource)initWithComposition:(id)a3 trackIndex:(unint64_t)a4;
- (_RCTimeRangeFileInputWaveformDataSource)activeFragmentDataSource;
- (double)duration;
- (float)loadingProgress;
- (id)_dataSourceForAVContentURL:(id)a3 isDecomposedFragment:(BOOL)a4 sourceTimeRange:(id)a5 destinationTime:(double)a6;
- (id)saveableWaveform;
- (id)synchronouslyApproximateWaveformSegmentsByReadingCurrentFileAheadTimeRange:(id)a3;
- (void)cancelLoading;
- (void)dealloc;
- (void)setActiveFragmentDataSource:(id)a3;
- (void)setHighlightLastDecomposedFragment:(BOOL)a3;
- (void)setLoadingGroup:(id)a3;
- (void)setSaveGeneratedWaveform:(BOOL)a3;
- (void)startLoading;
- (void)waitUntilSegmentsFinishLoadingWithTimeout:(unint64_t)a3;
- (void)waveformDataSource:(id)a3 didLoadWaveformSegment:(id)a4;
@end

@implementation RCCompositionWaveformDataSource

- (RCCompositionWaveformDataSource)initWithComposition:(id)a3 trackIndex:(unint64_t)a4
{
  id v7 = a3;
  v8 = [[RCWaveformGenerator alloc] initWithSegmentFlushInterval:a4 trackIndex:30.0];
  v9 = [v7 composedWaveformURLForTrackIndex:a4];
  v16.receiver = self;
  v16.super_class = (Class)RCCompositionWaveformDataSource;
  v10 = [(RCWaveformDataSource *)&v16 initWithWaveformGenerator:v8 generatedWaveformOutputURL:v9 trackIndex:a4];

  if (v10)
  {
    objc_storeStrong((id *)&v10->_composition, a3);
    dispatch_queue_t v11 = dispatch_queue_create("RCCompositionWaveformDataSourceQueue", 0);
    serialQueue = v10->_serialQueue;
    v10->_serialQueue = (OS_dispatch_queue *)v11;

    dispatch_group_t v13 = dispatch_group_create();
    loadingGroup = v10->_loadingGroup;
    v10->_loadingGroup = (OS_dispatch_group *)v13;
  }
  return v10;
}

- (void)cancelLoading
{
  v4.receiver = self;
  v4.super_class = (Class)RCCompositionWaveformDataSource;
  [(RCWaveformDataSource *)&v4 cancelLoading];
  v3 = [(RCCompositionWaveformDataSource *)self activeFragmentDataSource];
  [v3 cancelLoading];
}

- (void)dealloc
{
  v3 = [(RCCompositionWaveformDataSource *)self activeFragmentDataSource];
  objc_super v4 = [v3 waveformGenerator];
  [v4 setCanceled:1];

  [(RCCompositionWaveformDataSource *)self setActiveFragmentDataSource:0];
  v5.receiver = self;
  v5.super_class = (Class)RCCompositionWaveformDataSource;
  [(RCWaveformDataSource *)&v5 dealloc];
}

- (void)startLoading
{
  dispatch_group_enter((dispatch_group_t)self->_loadingGroup);
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x3032000000;
  v29[3] = __Block_byref_object_copy__12;
  v29[4] = __Block_byref_object_dispose__12;
  objc_super v4 = self;
  v30 = v4;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__12;
  v27 = __Block_byref_object_dispose__12;
  id v28 = 0;
  objc_super v5 = [(RCComposition *)v4->_composition composedFragments];
  if ([v5 count] || v4->_preferLoadingFragmentWaveforms)
  {
    v4->_progressWeightPerFragment = 1.0 / (float)(unint64_t)[v5 count];
    v6 = [(RCCompositionWaveformDataSource *)v4 activeFragmentDataSource];
    id v7 = [v6 waveformGenerator];
    [v7 setCanceled:1];

    serialQueue = v4->_serialQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __47__RCCompositionWaveformDataSource_startLoading__block_invoke_3;
    block[3] = &unk_1E64979E0;
    v20 = v29;
    SEL v21 = a2;
    block[4] = v4;
    id v19 = v5;
    dispatch_async(serialQueue, block);
  }
  else
  {
    v9 = [MEMORY[0x1E4F28CB8] defaultManager];
    v10 = [(RCComposition *)v4->_composition composedAVURL];
    dispatch_queue_t v11 = [v10 path];
    int v12 = [v9 fileExistsAtPath:v11 isDirectory:0];

    if (v12)
    {
      v4->_progressWeightPerFragment = 1.0;
      dispatch_group_t v13 = [(RCCompositionWaveformDataSource *)v4 activeFragmentDataSource];
      [v13 cancelLoading];

      v14 = [(RCComposition *)v4->_composition composedAVURL];
      uint64_t v15 = -[RCCompositionWaveformDataSource _dataSourceForAVContentURL:isDecomposedFragment:sourceTimeRange:destinationTime:](v4, "_dataSourceForAVContentURL:isDecomposedFragment:sourceTimeRange:destinationTime:", v14, 0, -1.79769313e308, 1.79769313e308, 0.0);
      objc_super v16 = (void *)v24[5];
      v24[5] = v15;

      [(RCCompositionWaveformDataSource *)v4 setActiveFragmentDataSource:v24[5]];
      v17 = v4->_serialQueue;
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __47__RCCompositionWaveformDataSource_startLoading__block_invoke;
      v22[3] = &unk_1E64979B8;
      v22[5] = &v23;
      v22[6] = v29;
      v22[4] = v4;
      dispatch_async(v17, v22);
    }
    else
    {
      dispatch_group_leave((dispatch_group_t)self->_loadingGroup);
    }
  }

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(v29, 8);
}

void __47__RCCompositionWaveformDataSource_startLoading__block_invoke(uint64_t a1)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __47__RCCompositionWaveformDataSource_startLoading__block_invoke_2;
  v5[3] = &unk_1E6497990;
  long long v6 = *(_OWORD *)(a1 + 40);
  v2 = (uint64_t (**)(void))MEMORY[0x1C8778060](v5);
  if ((v2[2]() & 1) == 0)
  {
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) _synchronouslyAppendSegmentsFromDataSource:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
    v3 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) activeFragmentDataSource];
    objc_super v4 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);

    if (v3 == v4) {
      [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setActiveFragmentDataSource:0];
    }
  }
  if ((((uint64_t (*)(uint64_t (**)(void)))v2[2])(v2) & 1) == 0) {
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) finishLoadingWithCompletionTimeout:-1 completionBlock:0];
  }
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 120));
}

uint64_t __47__RCCompositionWaveformDataSource_startLoading__block_invoke_2(uint64_t a1)
{
  if (([*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) canceled] & 1) != 0
    || ([*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) canceled] & 1) != 0)
  {
    return 1;
  }
  v3 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  return [v3 finished];
}

void __47__RCCompositionWaveformDataSource_startLoading__block_invoke_3(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) accumulatorWaveform];
  uint64_t v3 = [v2 segmentCount];

  if (v3)
  {
    uint64_t v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:*(void *)(a1 + 56), *(void *)(a1 + 32), @"RCCompositionWaveformDataSource.m", 92, @"Invalid parameter not satisfying: %@", @"weakSelf.accumulatorWaveform.segmentCount == 0" object file lineNumber description];
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v27;
LABEL_5:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v27 != v7) {
        objc_enumerationMutation(v4);
      }
      v9 = *(void **)(*((void *)&v26 + 1) + 8 * v8);
      v10 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) activeFragmentDataSource];
      if ([v10 canceled])
      {

LABEL_26:
        goto LABEL_27;
      }
      char v11 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) canceled];

      if (v11) {
        goto LABEL_26;
      }
      if ([*(id *)(a1 + 32) trackIndex] == -1) {
        break;
      }
      if ([*(id *)(a1 + 32) trackIndex] != -1)
      {
        uint64_t v12 = [v9 trackIndex];
        BOOL v13 = v12 == [*(id *)(a1 + 32) trackIndex];
        goto LABEL_14;
      }
      [v9 contentDuration];
LABEL_22:
      if (v6 == ++v8)
      {
        uint64_t v6 = [v4 countByEnumeratingWithState:&v26 objects:v30 count:16];
        if (v6) {
          goto LABEL_5;
        }
        goto LABEL_24;
      }
    }
    BOOL v13 = 1;
LABEL_14:
    [v9 contentDuration];
    if (v14 > 0.0 && v13)
    {
      objc_super v16 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      v17 = [v9 AVOutputURL];
      [v9 timeRangeInContentToUse];
      double v19 = v18;
      double v21 = v20;
      [v9 timeRangeInComposition];
      uint64_t v23 = objc_msgSend(v16, "_dataSourceForAVContentURL:isDecomposedFragment:sourceTimeRange:destinationTime:", v17, 1, v19, v21, v22);

      [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setActiveFragmentDataSource:v23];
      [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) _synchronouslyAppendSegmentsFromDataSource:v23];
      v24 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) activeFragmentDataSource];

      if (v24 == v23) {
        [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setActiveFragmentDataSource:0];
      }
    }
    goto LABEL_22;
  }
LABEL_24:

  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) finishLoadingWithCompletionTimeout:-1 completionBlock:0];
LABEL_27:
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 120));
}

- (void)waitUntilSegmentsFinishLoadingWithTimeout:(unint64_t)a3
{
}

- (float)loadingProgress
{
  activeFragmentDataSource = self->_activeFragmentDataSource;
  if (activeFragmentDataSource) {
    [(RCFileInputWaveformDataSource *)activeFragmentDataSource loadingProgress];
  }
  else {
    float v4 = 0.0;
  }
  return v4 + self->_progressOfFinishedFragments;
}

- (id)_dataSourceForAVContentURL:(id)a3 isDecomposedFragment:(BOOL)a4 sourceTimeRange:(id)a5 destinationTime:(double)a6
{
  double var1 = a5.var1;
  double var0 = a5.var0;
  BOOL v9 = a4;
  id v11 = a3;
  if (RCTimeRangeEqualToTimeRange(-1.79769313e308, 1.79769313e308, var0, var1))
  {
    v12.n128_u64[0] = 0;
    double var0 = RCTimeRangeMake(v12, 1.79769313e308);
    double var1 = v13;
  }
  double v14 = [(RCFileInputWaveformDataSource *)[_RCTimeRangeFileInputWaveformDataSource alloc] initWithAVFileURL:v11 trackIndex:[(RCWaveformDataSource *)self trackIndex]];

  -[RCFileInputWaveformDataSource setSourceTimeRange:](v14, "setSourceTimeRange:", var0, var1);
  [(RCFileInputWaveformDataSource *)v14 setDestinationBeginTime:a6];
  [(_RCTimeRangeFileInputWaveformDataSource *)v14 setIsDecomposedFragment:v9];
  [(RCWaveformDataSource *)v14 addObserver:self];
  return v14;
}

- (BOOL)_synchronouslyAppendSegmentsFromDataSource:(id)a3
{
  id v4 = a3;
  [v4 beginLoading];
  int v5 = [v4 waitUntilFinished];

  if (v5) {
    self->_progressOfFinishedFragments = self->_progressWeightPerFragment + self->_progressOfFinishedFragments;
  }
  return v5;
}

- (id)synchronouslyApproximateWaveformSegmentsByReadingCurrentFileAheadTimeRange:(id)a3
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  uint64_t v6 = [(RCCompositionWaveformDataSource *)self activeFragmentDataSource];
  uint64_t v7 = [v6 waveformGenerator];
  uint64_t v8 = [(RCComposition *)self->_composition composedAVURL];
  BOOL v9 = objc_msgSend(v7, "synchronouslyApproximateWaveformForAVContentURL:byReadingCurrentFileAheadTimeRange:", v8, var0, var1);

  return v9;
}

- (double)duration
{
  [(RCComposition *)self->_composition composedDuration];
  return result;
}

- (id)saveableWaveform
{
  if (self->_saveGeneratedWaveform || (RCIsVoiceMemosApplication() & 1) == 0)
  {
    v5.receiver = self;
    v5.super_class = (Class)RCCompositionWaveformDataSource;
    uint64_t v3 = [(RCWaveformDataSource *)&v5 saveableWaveform];
  }
  else
  {
    uint64_t v3 = 0;
  }
  return v3;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)timeRangeToHighlight
{
  if (self->_highlightLastDecomposedFragment
    && ([(RCComposition *)self->_composition decomposedFragments],
        uint64_t v3 = objc_claimAutoreleasedReturnValue(),
        [v3 lastObject],
        id v4 = objc_claimAutoreleasedReturnValue(),
        v3,
        v4))
  {
    [v4 timeRangeInComposition];
    double v6 = v5;
    double v8 = v7;

    double v9 = v6;
    double v10 = v8;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)RCCompositionWaveformDataSource;
    [(RCWaveformDataSource *)&v11 timeRangeToHighlight];
  }
  result.double var1 = v10;
  result.double var0 = v9;
  return result;
}

- (BOOL)supportsLiveInput
{
  return 0;
}

- (BOOL)shouldMergeLiveWaveform
{
  return 0;
}

- (void)waveformDataSource:(id)a3 didLoadWaveformSegment:(id)a4
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([(RCWaveformDataSource *)self canceled])
  {
    id v8 = [v6 waveformGenerator];
    [v8 terminateLoadingImmediately];
  }
  else
  {
    id v8 = v6;
    [v8 sourceTimeRange];
    double v10 = v9;
    double v12 = v11;
    [v7 timeRange];
    if (RCTimeRangeIntersectsRange(v10, v12, v13, v14))
    {
      uint64_t v15 = objc_msgSend(v7, "segmentByClippingToTimeRange:", v10, v12);
      if (v15)
      {
        [v8 destinationBeginTime];
        v17 = (void *)[v15 copyWithTimeRangeOffsetByTimeOffset:v16 - v10];
        double v18 = [(RCWaveformDataSource *)self waveformGenerator];
        v20[0] = v17;
        double v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
        [v18 appendAveragePowerLevelsByDigestingWaveformSegments:v19];
      }
    }
  }
}

- (RCComposition)composition
{
  return self->_composition;
}

- (BOOL)preferLoadingFragmentWaveforms
{
  return self->_preferLoadingFragmentWaveforms;
}

- (BOOL)saveGeneratedWaveform
{
  return self->_saveGeneratedWaveform;
}

- (void)setSaveGeneratedWaveform:(BOOL)a3
{
  self->_saveGeneratedWaveform = a3;
}

- (BOOL)highlightLastDecomposedFragment
{
  return self->_highlightLastDecomposedFragment;
}

- (void)setHighlightLastDecomposedFragment:(BOOL)a3
{
  self->_highlightLastDecomposedFragment = a3;
}

- (_RCTimeRangeFileInputWaveformDataSource)activeFragmentDataSource
{
  return (_RCTimeRangeFileInputWaveformDataSource *)objc_getProperty(self, a2, 112, 1);
}

- (void)setActiveFragmentDataSource:(id)a3
{
}

- (OS_dispatch_group)loadingGroup
{
  return (OS_dispatch_group *)objc_getProperty(self, a2, 120, 1);
}

- (void)setLoadingGroup:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadingGroup, 0);
  objc_storeStrong((id *)&self->_activeFragmentDataSource, 0);
  objc_storeStrong((id *)&self->_composition, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
}

@end