@interface TSAudioTimeErrorCalculator
- (BOOL)exportTimeErrorToDirectoryURL:(id)a3;
- (BOOL)exportTimeErrorToDirectoryURL:(id)a3 withFilename:(id)a4;
- (BOOL)exportTimeErrorToPath:(id)a3;
- (NSArray)audioTimeErrors;
- (NSArray)timeErrors;
- (TSAudioTimeErrorCalculator)initWithChannelA:(const float *)a3 andChannelB:(const float *)a4 ofLength:(int64_t)a5 withInterval:(int64_t)a6 correlationLength:(int64_t)a7 upscaleFactor:(int64_t)a8 atSamplingRate:(double)a9;
- (TSAudioTimeErrorCalculator)initWithChannelA:(const float *)a3 andChannelB:(const float *)a4 ofLength:(int64_t)a5 withInterval:(int64_t)a6 correlationLength:(int64_t)a7 upscaleFactor:(int64_t)a8 atSamplingRate:(double)a9 correlationType:(int64_t)a10;
- (id)initNoCopyWithChannelA:(const float *)a3 andChannelB:(const float *)a4 ofLength:(int64_t)a5 withInterval:(int64_t)a6 correlationLength:(int64_t)a7 upscaleFactor:(int64_t)a8 atSamplingRate:(double)a9;
- (id)initNoCopyWithChannelA:(const float *)a3 andChannelB:(const float *)a4 ofLength:(int64_t)a5 withInterval:(int64_t)a6 correlationLength:(int64_t)a7 upscaleFactor:(int64_t)a8 atSamplingRate:(double)a9 correlationType:(int64_t)a10;
- (void)_processTimeErrorFromStartOffset:(int64_t)a3 atIndex:(int64_t)a4 withCount:(int64_t)a5;
- (void)calculateTimeError;
- (void)calculateTimeErrorFromStartOffset:(int64_t)a3 toEndOffset:(int64_t)a4;
- (void)calculateTimeErrorFromStartOffset:(int64_t)a3 toEndOffset:(int64_t)a4 withThreadingOption:(int64_t)a5;
- (void)calculateTimeErrorWithThreadingOption:(int64_t)a3;
- (void)dealloc;
@end

@implementation TSAudioTimeErrorCalculator

- (TSAudioTimeErrorCalculator)initWithChannelA:(const float *)a3 andChannelB:(const float *)a4 ofLength:(int64_t)a5 withInterval:(int64_t)a6 correlationLength:(int64_t)a7 upscaleFactor:(int64_t)a8 atSamplingRate:(double)a9
{
  return [(TSAudioTimeErrorCalculator *)self initWithChannelA:a3 andChannelB:a4 ofLength:a5 withInterval:a6 correlationLength:a7 upscaleFactor:a8 atSamplingRate:a9 correlationType:1];
}

- (TSAudioTimeErrorCalculator)initWithChannelA:(const float *)a3 andChannelB:(const float *)a4 ofLength:(int64_t)a5 withInterval:(int64_t)a6 correlationLength:(int64_t)a7 upscaleFactor:(int64_t)a8 atSamplingRate:(double)a9 correlationType:(int64_t)a10
{
  v23.receiver = self;
  v23.super_class = (Class)TSAudioTimeErrorCalculator;
  v17 = [(TSAudioTimeErrorCalculator *)&v23 init];
  v18 = v17;
  if (v17)
  {
    v17->_interval = a6;
    v17->_correlationLength = a7;
    v17->_numberOfSamples = a5;
    v17->_samplingRate = a9;
    v17->_upscaleFactor = a8;
    v17->_correlationType = a10;
    v17->_channelASamples = (const float *)malloc_type_calloc(a5, 4uLL, 0x100004052888210uLL);
    v18->_channelBSamples = (const float *)malloc_type_calloc(v18->_numberOfSamples, 4uLL, 0x100004052888210uLL);
    size_t v19 = (a6 + v18->_numberOfSamples - 1) / a6;
    v18->_maxMeasurements = v19;
    v18->_sampleTimestamps = (double *)malloc_type_calloc(v19, 8uLL, 0x100004000313F17uLL);
    v20 = (double *)malloc_type_calloc(v18->_maxMeasurements, 8uLL, 0x100004000313F17uLL);
    v18->_timeErrors = v20;
    channelASamples = (float *)v18->_channelASamples;
    if (channelASamples && v18->_channelBSamples && v18->_sampleTimestamps && v20)
    {
      memcpy(channelASamples, a3, 4 * v18->_numberOfSamples);
      memcpy((void *)v18->_channelBSamples, a4, 4 * v18->_numberOfSamples);
      bzero(v18->_sampleTimestamps, 8 * v18->_maxMeasurements);
      bzero(v18->_timeErrors, 8 * v18->_maxMeasurements);
    }
    else
    {

      return 0;
    }
  }
  return v18;
}

- (id)initNoCopyWithChannelA:(const float *)a3 andChannelB:(const float *)a4 ofLength:(int64_t)a5 withInterval:(int64_t)a6 correlationLength:(int64_t)a7 upscaleFactor:(int64_t)a8 atSamplingRate:(double)a9
{
  return [(TSAudioTimeErrorCalculator *)self initNoCopyWithChannelA:a3 andChannelB:a4 ofLength:a5 withInterval:a6 correlationLength:a7 upscaleFactor:a8 atSamplingRate:a9 correlationType:1];
}

- (id)initNoCopyWithChannelA:(const float *)a3 andChannelB:(const float *)a4 ofLength:(int64_t)a5 withInterval:(int64_t)a6 correlationLength:(int64_t)a7 upscaleFactor:(int64_t)a8 atSamplingRate:(double)a9 correlationType:(int64_t)a10
{
  v22.receiver = self;
  v22.super_class = (Class)TSAudioTimeErrorCalculator;
  v17 = [(TSAudioTimeErrorCalculator *)&v22 init];
  v18 = v17;
  if (v17)
  {
    v17->_noCopy = 1;
    v17->_interval = a6;
    v17->_correlationLength = a7;
    v17->_samplingRate = a9;
    v17->_upscaleFactor = a8;
    v17->_correlationType = a10;
    v17->_channelASamples = a3;
    v17->_channelBSamples = a4;
    size_t v19 = (a5 + a6 - 1) / a6;
    v18->_numberOfSamples = a5;
    v18->_maxMeasurements = v19;
    v18->_sampleTimestamps = (double *)malloc_type_calloc(v19, 8uLL, 0x100004000313F17uLL);
    v20 = (double *)malloc_type_calloc(v18->_maxMeasurements, 8uLL, 0x100004000313F17uLL);
    v18->_timeErrors = v20;
    if (v18->_channelASamples && v18->_channelBSamples && v18->_sampleTimestamps && v20)
    {
      bzero(v18->_sampleTimestamps, 8 * v18->_maxMeasurements);
      bzero(v18->_timeErrors, 8 * v18->_maxMeasurements);
    }
    else
    {

      return 0;
    }
  }
  return v18;
}

- (void)_processTimeErrorFromStartOffset:(int64_t)a3 atIndex:(int64_t)a4 withCount:(int64_t)a5
{
  unint64_t correlationType = self->_correlationType;
  if (correlationType > 2) {
    v10 = 0;
  }
  else {
    v10 = (void *)[objc_alloc(*off_1E622A9D0[correlationType]) initWithMaxCorrelationLength:self->_correlationLength andUpscaleFactor:self->_upscaleFactor forSamplingRate:self->_samplingRate];
  }
  id v13 = v10;
  v11 = [v10 correlationBlock];
  if (a5 >= 1)
  {
    int64_t v12 = a5 + a4;
    do
    {
      self->_sampleTimestamps[a4] = (double)a3 / self->_samplingRate;
      self->_timeErrors[a4++] = ((double (**)(void, const float *, const float *, int64_t))v11)[2](v11, &self->_channelASamples[a3], &self->_channelBSamples[a3], self->_correlationLength);
      a3 += self->_interval;
    }
    while (a4 < v12);
  }
}

- (void)calculateTimeError
{
}

- (void)calculateTimeErrorWithThreadingOption:(int64_t)a3
{
}

- (void)calculateTimeErrorFromStartOffset:(int64_t)a3 toEndOffset:(int64_t)a4
{
}

- (void)calculateTimeErrorFromStartOffset:(int64_t)a3 toEndOffset:(int64_t)a4 withThreadingOption:(int64_t)a5
{
  uint64_t v9 = mach_absolute_time();
  int64_t v10 = a3 & ~(a3 >> 63);
  int64_t numberOfSamples = self->_numberOfSamples;
  if (numberOfSamples <= a4) {
    int64_t v12 = numberOfSamples - 1;
  }
  else {
    int64_t v12 = a4;
  }
  uint64_t v13 = (v12 - v10 + 1) / self->_interval;
  if (a5 != 1 && (a5 || v13 <= 10000 / self->_upscaleFactor)
    || ([MEMORY[0x1E4F28F80] processInfo],
        v14 = objc_claimAutoreleasedReturnValue(),
        intptr_t v15 = [v14 activeProcessorCount],
        v14,
        v15 == 1))
  {
    [(TSAudioTimeErrorCalculator *)self _processTimeErrorFromStartOffset:v10 atIndex:0 withCount:v13];
  }
  else
  {
    uint64_t v23 = v9;
    dispatch_queue_t v25 = dispatch_queue_create("com.apple.timesync.TSAudioTimeErrorCalculator.parallel", MEMORY[0x1E4F14430]);
    queue = dispatch_queue_create("com.apple.timesync.TSAudioTimeErrorCalculator.sequence", 0);
    dispatch_semaphore_t v16 = dispatch_semaphore_create(v15);
    dispatch_group_t v17 = dispatch_group_create();
    if (v13 >= 1)
    {
      uint64_t v18 = 0;
      uint64_t v19 = MEMORY[0x1E4F143A8];
      uint64_t v20 = v13 / v15;
      do
      {
        block[0] = v19;
        block[1] = 3221225472;
        if (v18 + v20 > v13) {
          uint64_t v20 = v13 - v18;
        }
        block[2] = __96__TSAudioTimeErrorCalculator_calculateTimeErrorFromStartOffset_toEndOffset_withThreadingOption___block_invoke;
        block[3] = &unk_1E622A9B0;
        v27 = v16;
        v21 = v17;
        v28 = v21;
        v29 = v25;
        v30 = self;
        int64_t v31 = v10;
        uint64_t v32 = v18;
        uint64_t v33 = v20;
        dispatch_group_async(v21, queue, block);
        v18 += v20;
        v10 += self->_interval * v20;
      }
      while (v18 < v13);
    }
    dispatch_group_wait(v17, 0xFFFFFFFFFFFFFFFFLL);

    uint64_t v9 = v23;
  }
  uint64_t v22 = mach_absolute_time();
  self->_calculatedTimeError = 1;
  self->_measurementsInBuffer = v13;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
    -[TSAudioTimeErrorCalculator calculateTimeErrorFromStartOffset:toEndOffset:withThreadingOption:](v22, v9);
  }
}

intptr_t __96__TSAudioTimeErrorCalculator_calculateTimeErrorFromStartOffset_toEndOffset_withThreadingOption___block_invoke(uint64_t a1)
{
  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(a1 + 32), 0xFFFFFFFFFFFFFFFFLL);
  v2 = *(NSObject **)(a1 + 40);
  v3 = *(NSObject **)(a1 + 48);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __96__TSAudioTimeErrorCalculator_calculateTimeErrorFromStartOffset_toEndOffset_withThreadingOption___block_invoke_2;
  v5[3] = &unk_1E622A988;
  v5[4] = *(void *)(a1 + 56);
  long long v6 = *(_OWORD *)(a1 + 64);
  uint64_t v7 = *(void *)(a1 + 80);
  dispatch_group_async(v2, v3, v5);
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t __96__TSAudioTimeErrorCalculator_calculateTimeErrorFromStartOffset_toEndOffset_withThreadingOption___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _processTimeErrorFromStartOffset:*(void *)(a1 + 40) atIndex:*(void *)(a1 + 48) withCount:*(void *)(a1 + 56)];
}

- (NSArray)audioTimeErrors
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  if (!self->_calculatedTimeError) {
    [(TSAudioTimeErrorCalculator *)self calculateTimeError];
  }
  if (self->_measurementsInBuffer >= 1)
  {
    int64_t v4 = 0;
    do
    {
      v5 = [[TSAudioTimeErrorValue alloc] initWithSampleTimestamp:self->_sampleTimestamps[v4] andTimeError:self->_timeErrors[v4]];
      [v3 addObject:v5];

      ++v4;
    }
    while (v4 < self->_measurementsInBuffer);
  }
  return (NSArray *)v3;
}

- (NSArray)timeErrors
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  if (!self->_calculatedTimeError) {
    [(TSAudioTimeErrorCalculator *)self calculateTimeError];
  }
  if (self->_measurementsInBuffer >= 1)
  {
    int64_t v4 = 0;
    do
    {
      v5 = [[TSTimeErrorValue alloc] initWithTimestamp:(unint64_t)(self->_sampleTimestamps[v4] * 1000000000.0) andError:(uint64_t)(self->_timeErrors[v4] * 1000000000.0)];
      [v3 addObject:v5];

      ++v4;
    }
    while (v4 < self->_measurementsInBuffer);
  }
  return (NSArray *)v3;
}

- (BOOL)exportTimeErrorToDirectoryURL:(id)a3
{
  return [(TSAudioTimeErrorCalculator *)self exportTimeErrorToDirectoryURL:a3 withFilename:@"time_error.csv"];
}

- (BOOL)exportTimeErrorToDirectoryURL:(id)a3 withFilename:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 isFileURL])
  {
    v8 = [v6 path];
    uint64_t v9 = [v8 stringByAppendingPathComponent:v7];

    BOOL v10 = [(TSAudioTimeErrorCalculator *)self exportTimeErrorToPath:v9];
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (BOOL)exportTimeErrorToPath:(id)a3
{
  int64_t v4 = fopen((const char *)[a3 UTF8String], "w");
  if (v4)
  {
    if (!self->_calculatedTimeError) {
      [(TSAudioTimeErrorCalculator *)self calculateTimeError];
    }
    fwrite("index,time,time error\n", 0x16uLL, 1uLL, v4);
    if (self->_measurementsInBuffer >= 1)
    {
      int64_t v5 = 0;
      do
      {
        fprintf(v4, "%ld,%.9f,%.9f\n", v5, self->_sampleTimestamps[v5], self->_timeErrors[v5]);
        ++v5;
      }
      while (v5 < self->_measurementsInBuffer);
    }
    fclose(v4);
  }
  return v4 != 0;
}

- (void)dealloc
{
  if (!self->_noCopy)
  {
    free((void *)self->_channelASamples);
    free((void *)self->_channelBSamples);
  }
  free(self->_sampleTimestamps);
  free(self->_timeErrors);
  v3.receiver = self;
  v3.super_class = (Class)TSAudioTimeErrorCalculator;
  [(TSAudioTimeErrorCalculator *)&v3 dealloc];
}

- (void)calculateTimeErrorFromStartOffset:(uint64_t)a1 toEndOffset:(uint64_t)a2 withThreadingOption:.cold.1(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 134218240;
  uint64_t v3 = a1 - a2;
  __int16 v4 = 2048;
  double v5 = (double)(unint64_t)(a1 - a2) / 1000000000.0;
  _os_log_debug_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "Elapsed time %llu, %f\n", (uint8_t *)&v2, 0x16u);
}

@end