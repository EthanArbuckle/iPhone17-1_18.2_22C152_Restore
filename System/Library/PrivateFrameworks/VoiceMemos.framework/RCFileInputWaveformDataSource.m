@interface RCFileInputWaveformDataSource
- ($F24F406B2B787EFB06265DBA3D28CBD5)sourceTimeRange;
- (BOOL)savesGeneratedWaveform;
- (BOOL)setPaused:(BOOL)a3;
- (BOOL)shouldMergeLiveWaveform;
- (BOOL)supportsLiveInput;
- (NSURL)AVFileURL;
- (RCFileInputWaveformDataSource)initWithAVFileURL:(id)a3 savesGeneratedWaveform:(BOOL)a4 segmentFlushInterval:(double)a5 trackIndex:(unint64_t)a6;
- (RCFileInputWaveformDataSource)initWithAVFileURL:(id)a3 trackIndex:(unint64_t)a4;
- (double)destinationBeginTime;
- (double)duration;
- (float)loadingProgress;
- (id)synchronouslyApproximateWaveformSegmentsByReadingCurrentFileAheadTimeRange:(id)a3;
- (void)finishLoadingWithCompletionTimeout:(unint64_t)a3 completionBlock:(id)a4;
- (void)saveGeneratedWaveformIfNecessary;
- (void)setDestinationBeginTime:(double)a3;
- (void)setLoadingProgress:(float)a3;
- (void)setSourceTimeRange:(id)a3;
- (void)startLoading;
@end

@implementation RCFileInputWaveformDataSource

- (RCFileInputWaveformDataSource)initWithAVFileURL:(id)a3 trackIndex:(unint64_t)a4
{
  return [(RCFileInputWaveformDataSource *)self initWithAVFileURL:a3 savesGeneratedWaveform:1 segmentFlushInterval:a4 trackIndex:30.0];
}

- (RCFileInputWaveformDataSource)initWithAVFileURL:(id)a3 savesGeneratedWaveform:(BOOL)a4 segmentFlushInterval:(double)a5 trackIndex:(unint64_t)a6
{
  BOOL v8 = a4;
  id v12 = a3;
  v13 = [v12 path];

  if (!v13)
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2 object:self file:@"RCFileInputWaveformDataSource.m" lineNumber:35 description:@"Invalid parameter"];
  }
  v14 = [[RCWaveformGenerator alloc] initWithSegmentFlushInterval:a6 trackIndex:a5];
  if (v8)
  {
    v15 = +[RCWaveform waveformURLForAVURL:v12 trackIndex:a6];
  }
  else
  {
    v15 = 0;
  }
  v22.receiver = self;
  v22.super_class = (Class)RCFileInputWaveformDataSource;
  v16 = [(RCWaveformDataSource *)&v22 initWithWaveformGenerator:v14 generatedWaveformOutputURL:v15 trackIndex:a6];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_AVFileURL, a3);
    v17->_cachedDuration = -1.0;
    dispatch_queue_t v18 = dispatch_queue_create(0, 0);
    serialQueue = v17->_serialQueue;
    v17->_serialQueue = (OS_dispatch_queue *)v18;

    v17->_trackIndex = a6;
  }

  return v17;
}

- (BOOL)savesGeneratedWaveform
{
  v2 = [(RCWaveformDataSource *)self generatedWaveformOutputURL];
  BOOL v3 = v2 != 0;

  return v3;
}

- (float)loadingProgress
{
  uint64_t v6 = 0;
  v7 = (float *)&v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __48__RCFileInputWaveformDataSource_loadingProgress__block_invoke;
  v5[3] = &unk_1E64963F0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  float v3 = v7[6];
  _Block_object_dispose(&v6, 8);
  return v3;
}

float __48__RCFileInputWaveformDataSource_loadingProgress__block_invoke(uint64_t a1)
{
  float result = *(float *)(*(void *)(a1 + 32) + 96);
  *(float *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setLoadingProgress:(float)a3
{
  serialQueue = self->_serialQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __52__RCFileInputWaveformDataSource_setLoadingProgress___block_invoke;
  v4[3] = &unk_1E6497CA0;
  v4[4] = self;
  float v5 = a3;
  dispatch_sync(serialQueue, v4);
}

float __52__RCFileInputWaveformDataSource_setLoadingProgress___block_invoke(uint64_t a1)
{
  float result = *(float *)(a1 + 40);
  *(float *)(*(void *)(a1 + 32) + 96) = result;
  return result;
}

- (void)startLoading
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  float v5 = [a1 path];
  uint64_t v6 = [a2 path];
  int v7 = 136315650;
  uint64_t v8 = "-[RCFileInputWaveformDataSource startLoading]";
  __int16 v9 = 2112;
  v10 = v5;
  __int16 v11 = 2112;
  id v12 = v6;
  _os_log_debug_impl(&dword_1C3964000, a3, OS_LOG_TYPE_DEBUG, "%s -- copying existing loadable waveform from %@ to %@ to avoid re-generating waveform", (uint8_t *)&v7, 0x20u);
}

uint64_t __45__RCFileInputWaveformDataSource_startLoading__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setLoadingProgress:");
}

- (void)finishLoadingWithCompletionTimeout:(unint64_t)a3 completionBlock:(id)a4
{
  id v6 = a4;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x3032000000;
  v13[3] = __Block_byref_object_copy__14;
  v13[4] = __Block_byref_object_dispose__14;
  int v7 = self;
  v14 = v7;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __84__RCFileInputWaveformDataSource_finishLoadingWithCompletionTimeout_completionBlock___block_invoke;
  v10[3] = &unk_1E6497CF0;
  id v12 = v13;
  id v8 = v6;
  id v11 = v8;
  v9.receiver = v7;
  v9.super_class = (Class)RCFileInputWaveformDataSource;
  [(RCWaveformDataSource *)&v9 finishLoadingWithCompletionTimeout:a3 completionBlock:v10];

  _Block_object_dispose(v13, 8);
}

uint64_t __84__RCFileInputWaveformDataSource_finishLoadingWithCompletionTimeout_completionBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = a3;
  if (!v7 && a2) {
    objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "saveGeneratedWaveformIfNecessary", 0);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, uint64_t, id))(v5 + 16))(v5, a2, v7);
  }
  return MEMORY[0x1F4181820]();
}

- (BOOL)setPaused:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = [(RCWaveformDataSource *)self waveformGenerator];
  [v4 setPaused:v3];

  return 1;
}

- (id)synchronouslyApproximateWaveformSegmentsByReadingCurrentFileAheadTimeRange:(id)a3
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  id v6 = [(RCWaveformDataSource *)self waveformGenerator];
  id v7 = objc_msgSend(v6, "synchronouslyApproximateWaveformForAVContentURL:byReadingCurrentFileAheadTimeRange:", self->_AVFileURL, var0, var1);

  return v7;
}

- (void)saveGeneratedWaveformIfNecessary
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __65__RCFileInputWaveformDataSource_saveGeneratedWaveformIfNecessary__block_invoke;
  v4[3] = &unk_1E6497A48;
  v4[4] = self;
  [(RCWaveformDataSource *)self updateAccumulatorWaveformSegmentsWithBlock:v4];
  v3.receiver = self;
  v3.super_class = (Class)RCFileInputWaveformDataSource;
  [(RCWaveformDataSource *)&v3 saveGeneratedWaveformIfNecessary];
}

id __65__RCFileInputWaveformDataSource_saveGeneratedWaveformIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  objc_super v3 = [a2 segmentsCopy];
  uint64_t v4 = [v3 lastObject];
  if (v4)
  {
    uint64_t v5 = (void *)v4;
    [*(id *)(a1 + 32) duration];
    if (v6 <= 0.0)
    {
      id v7 = v3;
    }
    else
    {
      id v7 = (id)[v3 mutableCopy];
      [v5 timeRange];
      unint64_t v9 = v8;
      [*(id *)(a1 + 32) duration];
      double v11 = v10;
      v12.n128_u64[0] = v9;
      uint64_t v13 = objc_msgSend(v5, "copyWithAdjustedTimeRange:", RCTimeRangeMake(v12, v11));

      objc_msgSend(v7, "replaceObjectAtIndex:withObject:", objc_msgSend(v3, "count") - 1, v13);
    }
  }
  else
  {
    id v7 = v3;
  }

  return v7;
}

- (double)duration
{
  double result = self->_cachedDuration;
  if (result < 0.0)
  {
    uint64_t v4 = [MEMORY[0x1E4F166C8] assetWithURL:self->_AVFileURL];
    uint64_t v5 = v4;
    if (self->_trackIndex == -1)
    {
      if (v4) {
        [v4 duration];
      }
      else {
        memset(&time, 0, sizeof(time));
      }
      self->_cachedDuration = CMTimeGetSeconds(&time);
    }
    else
    {
      double v6 = objc_msgSend(v4, "rc_audioTracks");
      unint64_t v7 = [v6 count];
      if (!v7 || self->_trackIndex >= v7)
      {

        return 0.0;
      }
      unint64_t v8 = objc_msgSend(v6, "objectAtIndexedSubscript:");
      unint64_t v9 = v8;
      if (v8) {
        [v8 timeRange];
      }
      else {
        memset(v10, 0, sizeof(v10));
      }
      CMTime v11 = *(CMTime *)&v10[1];
      self->_cachedDuration = CMTimeGetSeconds(&v11);
    }
    return self->_cachedDuration;
  }
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

- (NSURL)AVFileURL
{
  return self->_AVFileURL;
}

- (double)destinationBeginTime
{
  return self->_destinationBeginTime;
}

- (void)setDestinationBeginTime:(double)a3
{
  self->_destinationBeginTime = a3;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)sourceTimeRange
{
  double beginTime = self->_sourceTimeRange.beginTime;
  double endTime = self->_sourceTimeRange.endTime;
  result.double var1 = endTime;
  result.double var0 = beginTime;
  return result;
}

- (void)setSourceTimeRange:(id)a3
{
  self->_sourceTimeRange = ($93AB83F55FD8EAABF5C634313E89AB95)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_AVFileURL, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
}

@end