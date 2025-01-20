@interface PFSinglePassVideoExportItemStatistics
+ (id)statisticsWithTargetPlaybackDuration:(id *)a3 frameRate:(float)a4 targetOutputTotalBytes:(unint64_t)a5;
- (NSMutableArray)outputChunkMeasurements;
- (PFSinglePassVideoExportItemStatistics)init;
- (double)averageOutputChunkTimeInterval;
- (double)conversionDuration;
- (double)lastProcessedInputFramePresentationTime;
- (double)targetPlaybackDuration;
- (float)frameRate;
- (float)processingFramesPerSecond;
- (id)outputChunkMeasurementsDescription;
- (id)summaryDescription;
- (int64_t)effectiveEncodingBitRate;
- (int64_t)processedOutputFrameCount;
- (int64_t)targetEncodingBitRate;
- (unint64_t)averageOutputChunkBytes;
- (unint64_t)lastOutputChunkTimestamp;
- (unint64_t)processedAdditionalSampleBytes;
- (unint64_t)processedOutputBytesPerSecond;
- (unint64_t)processedOutputTotalBytes;
- (unint64_t)processedVideoSampleBytes;
- (unint64_t)targetOutputTotalBytes;
- (void)addMeasurementForBytesDelivered:(unint64_t)a3;
- (void)enumerateOutputChunkMeasurementsWithHandler:(id)a3;
- (void)setConversionDuration:(double)a3;
- (void)setFrameRate:(float)a3;
- (void)setLastOutputChunkTimestamp:(unint64_t)a3;
- (void)setLastProcessedInputFramePresentationTime:(double)a3;
- (void)setOutputChunkMeasurements:(id)a3;
- (void)setProcessedAdditionalSampleBytes:(unint64_t)a3;
- (void)setProcessedOutputFrameCount:(int64_t)a3;
- (void)setProcessedOutputTotalBytes:(unint64_t)a3;
- (void)setProcessedVideoSampleBytes:(unint64_t)a3;
- (void)setTargetOutputTotalBytes:(unint64_t)a3;
- (void)setTargetPlaybackDuration:(double)a3;
@end

@implementation PFSinglePassVideoExportItemStatistics

- (void).cxx_destruct
{
}

- (void)setFrameRate:(float)a3
{
  self->_frameRate = a3;
}

- (float)frameRate
{
  return self->_frameRate;
}

- (void)setTargetPlaybackDuration:(double)a3
{
  self->_targetPlaybackDuration = a3;
}

- (double)targetPlaybackDuration
{
  return self->_targetPlaybackDuration;
}

- (void)setTargetOutputTotalBytes:(unint64_t)a3
{
  self->_targetOutputTotalBytes = a3;
}

- (unint64_t)targetOutputTotalBytes
{
  return self->_targetOutputTotalBytes;
}

- (void)setProcessedOutputFrameCount:(int64_t)a3
{
  self->_processedOutputFrameCount = a3;
}

- (int64_t)processedOutputFrameCount
{
  return self->_processedOutputFrameCount;
}

- (void)setLastProcessedInputFramePresentationTime:(double)a3
{
  self->_lastProcessedInputFramePresentationTime = a3;
}

- (double)lastProcessedInputFramePresentationTime
{
  return self->_lastProcessedInputFramePresentationTime;
}

- (void)setConversionDuration:(double)a3
{
  self->_conversionDuration = a3;
}

- (double)conversionDuration
{
  return self->_conversionDuration;
}

- (void)setProcessedAdditionalSampleBytes:(unint64_t)a3
{
  self->_processedAdditionalSampleBytes = a3;
}

- (unint64_t)processedAdditionalSampleBytes
{
  return self->_processedAdditionalSampleBytes;
}

- (void)setProcessedVideoSampleBytes:(unint64_t)a3
{
  self->_processedVideoSampleBytes = a3;
}

- (unint64_t)processedVideoSampleBytes
{
  return self->_processedVideoSampleBytes;
}

- (void)setProcessedOutputTotalBytes:(unint64_t)a3
{
  self->_processedOutputTotalBytes = a3;
}

- (unint64_t)processedOutputTotalBytes
{
  return self->_processedOutputTotalBytes;
}

- (void)setOutputChunkMeasurements:(id)a3
{
}

- (NSMutableArray)outputChunkMeasurements
{
  return (NSMutableArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setLastOutputChunkTimestamp:(unint64_t)a3
{
  self->_lastOutputChunkTimestamp = a3;
}

- (unint64_t)lastOutputChunkTimestamp
{
  return self->_lastOutputChunkTimestamp;
}

- (id)summaryDescription
{
  v3 = NSString;
  unint64_t v4 = [(PFSinglePassVideoExportItemStatistics *)self processedOutputTotalBytes];
  double v5 = (float)((float)[(PFSinglePassVideoExportItemStatistics *)self processedOutputTotalBytes]* 0.00000095367);
  [(PFSinglePassVideoExportItemStatistics *)self conversionDuration];
  uint64_t v7 = v6;
  double v8 = (float)((float)[(PFSinglePassVideoExportItemStatistics *)self processedOutputBytesPerSecond]* 0.00000095367);
  [(PFSinglePassVideoExportItemStatistics *)self processingFramesPerSecond];
  double v10 = v9;
  [(PFSinglePassVideoExportItemStatistics *)self averageOutputChunkTimeInterval];
  return (id)[v3 stringWithFormat:@"Exported %lu bytes (%.2fMB) in %.1fs (%.2fMB/s), %.2fps, average output interval = %.2fs, average output size = %.2fKB", v4, *(void *)&v5, v7, *(void *)&v8, *(void *)&v10, v11, (float)((float)-[PFSinglePassVideoExportItemStatistics averageOutputChunkBytes](self, "averageOutputChunkBytes")* 0.00097656)];
}

- (id)outputChunkMeasurementsDescription
{
  v3 = [MEMORY[0x1E4F28E78] stringWithString:@"Sample Time\tTotal Bytes\tSample Bytes\n"];
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x2020000000;
  v11[3] = 0;
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  v10[3] = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __75__PFSinglePassVideoExportItemStatistics_outputChunkMeasurementsDescription__block_invoke;
  v6[3] = &unk_1E5B2EFA8;
  double v8 = v11;
  float v9 = v10;
  id v4 = v3;
  id v7 = v4;
  [(PFSinglePassVideoExportItemStatistics *)self enumerateOutputChunkMeasurementsWithHandler:v6];

  _Block_object_dispose(v10, 8);
  _Block_object_dispose(v11, 8);

  return v4;
}

uint64_t __75__PFSinglePassVideoExportItemStatistics_outputChunkMeasurementsDescription__block_invoke(uint64_t a1, uint64_t a2, double a3)
{
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *(double *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                          + 24)
                                                              + a3;
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) += a2;
  return objc_msgSend(*(id *)(a1 + 32), "appendFormat:", @"%f\t%lu\t%lu\n", *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24), *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24), a2);
}

- (int64_t)effectiveEncodingBitRate
{
  int64_t processedOutputFrameCount = self->_processedOutputFrameCount;
  if (processedOutputFrameCount) {
    return vcvtd_n_u64_f64(roundf((float)self->_processedVideoSampleBytes / (float)((float)processedOutputFrameCount / self->_frameRate)), 3uLL);
  }
  else {
    return 0;
  }
}

- (int64_t)targetEncodingBitRate
{
  return vcvtd_n_s64_f64((double)self->_targetOutputTotalBytes / self->_targetPlaybackDuration, 3uLL);
}

- (float)processingFramesPerSecond
{
  double conversionDuration = self->_conversionDuration;
  if (conversionDuration == 0.0) {
    return NAN;
  }
  else {
    return (double)self->_processedOutputFrameCount / conversionDuration;
  }
}

- (unint64_t)averageOutputChunkBytes
{
  unint64_t processedOutputTotalBytes = self->_processedOutputTotalBytes;
  return processedOutputTotalBytes / [(NSMutableArray *)self->_outputChunkMeasurements count];
}

- (double)averageOutputChunkTimeInterval
{
  double conversionDuration = self->_conversionDuration;
  return conversionDuration / (double)(unint64_t)[(NSMutableArray *)self->_outputChunkMeasurements count];
}

- (unint64_t)processedOutputBytesPerSecond
{
  return vcvtad_u64_f64((double)self->_processedOutputTotalBytes / self->_conversionDuration);
}

- (void)enumerateOutputChunkMeasurementsWithHandler:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, uint64_t, unsigned char *, double))a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  double v5 = self->_outputChunkMeasurements;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v18;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v18 != v8) {
        objc_enumerationMutation(v5);
      }
      double v10 = *(void **)(*((void *)&v17 + 1) + 8 * v9);
      uint64_t v11 = [v10 objectAtIndexedSubscript:0];
      [v11 doubleValue];
      double v13 = v12;

      v14 = [v10 objectAtIndexedSubscript:1];
      uint64_t v15 = [v14 unsignedIntegerValue];

      char v16 = 0;
      v4[2](v4, v15, &v16, v13);
      if (v16) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (void)addMeasurementForBytesDelivered:(unint64_t)a3
{
  v11[2] = *MEMORY[0x1E4F143B8];
  __uint64_t v5 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  outputChunkMeasurements = self->_outputChunkMeasurements;
  double v7 = (double)(v5 - self->_lastOutputChunkTimestamp) / 1000000000.0;
  self->_lastOutputChunkTimestamp = v5;
  uint64_t v8 = [NSNumber numberWithDouble:v7];
  v11[0] = v8;
  uint64_t v9 = [NSNumber numberWithUnsignedInteger:a3];
  v11[1] = v9;
  double v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
  [(NSMutableArray *)outputChunkMeasurements addObject:v10];

  self->_processedOutputTotalBytes += a3;
  self->_double conversionDuration = v7 + self->_conversionDuration;
}

- (PFSinglePassVideoExportItemStatistics)init
{
  v7.receiver = self;
  v7.super_class = (Class)PFSinglePassVideoExportItemStatistics;
  v2 = [(PFSinglePassVideoExportItemStatistics *)&v7 init];
  if (v2)
  {
    __uint64_t v3 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
    uint64_t v4 = [MEMORY[0x1E4F1CA48] array];
    outputChunkMeasurements = v2->_outputChunkMeasurements;
    v2->_outputChunkMeasurements = (NSMutableArray *)v4;

    v2->_lastOutputChunkTimestamp = v3;
  }
  return v2;
}

+ (id)statisticsWithTargetPlaybackDuration:(id *)a3 frameRate:(float)a4 targetOutputTotalBytes:(unint64_t)a5
{
  uint64_t v8 = objc_opt_new();
  CMTime v11 = *(CMTime *)a3;
  [v8 setTargetPlaybackDuration:CMTimeGetSeconds(&v11)];
  *(float *)&double v9 = a4;
  [v8 setFrameRate:v9];
  [v8 setTargetOutputTotalBytes:a5];

  return v8;
}

@end