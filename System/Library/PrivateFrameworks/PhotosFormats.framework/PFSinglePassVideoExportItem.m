@interface PFSinglePassVideoExportItem
- (AVAsset)inputAsset;
- (AVAssetReader)assetReader;
- (AVAssetReaderTrackOutput)videoReaderTrackOutput;
- (AVAssetTrack)videoTrack;
- (AVAssetWriter)assetWriter;
- (AVAssetWriterInput)videoWriterInput;
- (BOOL)didCancel;
- (BOOL)isAPACAudioTrack:(id)a3;
- (BOOL)maximizePowerEfficiency;
- (BOOL)needsCurrentEncodingBitRateUpdate;
- (BOOL)preflight;
- (BOOL)setupConversionWithError:(id *)a3;
- (BOOL)shouldDeleteDestinationURLOnDeallocation;
- (BOOL)startConversionWithError:(id *)a3 outputAvailableHandler:(id)a4;
- (NSArray)additionalMetadata;
- (NSArray)additionalReaderTrackOutputs;
- (NSArray)additionalTracks;
- (NSArray)additionalWriterInputs;
- (NSFileHandle)conversionOutputFileHandle;
- (NSProgress)progress;
- (NSString)identifier;
- (NSURL)destinationFileURL;
- (OS_dispatch_group)inputReadingCompletionGroup;
- (OS_dispatch_queue)exportItemStateQueue;
- (OS_dispatch_source)outputFileSizeChangeSource;
- (OpaqueVTCompressionSession)compressionSession;
- (PFProportionalIntegralController)bitRateController;
- (PFSinglePassVideoExportItem)init;
- (PFSinglePassVideoExportItemStatistics)statistics;
- (PFVideoExportRangeCoordinator)availableRangeCoordinator;
- (double)inputAssetDuration;
- (id)bitRateControllerForTargetEncodingBitRate:(int64_t)a3;
- (id)outputDataInRange:(_NSRange)a3 waitUntilAvailableWithTimeout:(unint64_t)a4 error:(id *)a5;
- (int64_t)currentEncodingBitRate;
- (int64_t)estimatedOutputBitRate;
- (int64_t)targetOutputMediaDataSize;
- (unint64_t)minimumChunkLength;
- (unint64_t)outputFileLastEndOffset;
- (unint64_t)state;
- (unint64_t)targetOutputFileSize;
- (void)_cancel;
- (void)configureDroppableFrameRateForCompressionSession:(OpaqueVTCompressionSession *)a3 inputWidth:(int)a4 inputHeight:(int)a5;
- (void)configureOutputMetadataForAssetWriter:(id)a3;
- (void)dealloc;
- (void)notifyDataAvailableToHandler:(id)a3 ignoreMinimumChunkLength:(BOOL)a4;
- (void)processCompressedSampleBuffer:(opaqueCMSampleBuffer *)a3 presentationTimeStamp:(id *)a4;
- (void)setAdditionalMetadata:(id)a3;
- (void)setAdditionalReaderTrackOutputs:(id)a3;
- (void)setAdditionalTracks:(id)a3;
- (void)setAdditionalWriterInputs:(id)a3;
- (void)setAssetReader:(id)a3;
- (void)setAssetWriter:(id)a3;
- (void)setAvailableRangeCoordinator:(id)a3;
- (void)setBitRateController:(id)a3;
- (void)setCompressionSession:(OpaqueVTCompressionSession *)a3;
- (void)setConversionOutputFileHandle:(id)a3;
- (void)setCurrentEncodingBitRate:(int64_t)a3;
- (void)setDestinationFileURL:(id)a3;
- (void)setDidCancel:(BOOL)a3;
- (void)setExportItemStateQueue:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setInputAsset:(id)a3;
- (void)setInputReadingCompletionGroup:(id)a3;
- (void)setMaximizePowerEfficiency:(BOOL)a3;
- (void)setMinimumChunkLength:(unint64_t)a3;
- (void)setNeedsCurrentEncodingBitRateUpdate:(BOOL)a3;
- (void)setOutputFileLastEndOffset:(unint64_t)a3;
- (void)setOutputFileSizeChangeSource:(id)a3;
- (void)setProgress:(id)a3;
- (void)setShouldDeleteDestinationURLOnDeallocation:(BOOL)a3;
- (void)setState:(unint64_t)a3;
- (void)setStatistics:(id)a3;
- (void)setTargetOutputFileSize:(unint64_t)a3;
- (void)setTargetOutputMediaDataSize:(int64_t)a3;
- (void)setVideoReaderTrackOutput:(id)a3;
- (void)setVideoTrack:(id)a3;
- (void)setVideoWriterInput:(id)a3;
- (void)setupOutputFileSourceWithOutputAvailableHandler:(id)a3;
- (void)startReadingInputAssetWithOutputAvailableHandler:(id)a3;
@end

@implementation PFSinglePassVideoExportItem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_availableRangeCoordinator, 0);
  objc_storeStrong((id *)&self->_inputReadingCompletionGroup, 0);
  objc_storeStrong((id *)&self->_outputFileSizeChangeSource, 0);
  objc_storeStrong((id *)&self->_additionalWriterInputs, 0);
  objc_storeStrong((id *)&self->_videoWriterInput, 0);
  objc_storeStrong((id *)&self->_assetWriter, 0);
  objc_storeStrong((id *)&self->_additionalReaderTrackOutputs, 0);
  objc_storeStrong((id *)&self->_videoReaderTrackOutput, 0);
  objc_storeStrong((id *)&self->_assetReader, 0);
  objc_storeStrong((id *)&self->_bitRateController, 0);
  objc_storeStrong((id *)&self->_statistics, 0);
  objc_storeStrong((id *)&self->_destinationFileURL, 0);
  objc_storeStrong((id *)&self->_conversionOutputFileHandle, 0);
  objc_storeStrong((id *)&self->_additionalTracks, 0);
  objc_storeStrong((id *)&self->_videoTrack, 0);
  objc_storeStrong((id *)&self->_inputAsset, 0);
  objc_storeStrong((id *)&self->_exportItemStateQueue, 0);
  objc_storeStrong((id *)&self->_additionalMetadata, 0);
  objc_storeStrong((id *)&self->_progress, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)setDidCancel:(BOOL)a3
{
  self->_didCancel = a3;
}

- (BOOL)didCancel
{
  return self->_didCancel;
}

- (void)setMaximizePowerEfficiency:(BOOL)a3
{
  self->_maximizePowerEfficiency = a3;
}

- (BOOL)maximizePowerEfficiency
{
  return self->_maximizePowerEfficiency;
}

- (void)setNeedsCurrentEncodingBitRateUpdate:(BOOL)a3
{
  self->_needsCurrentEncodingBitRateUpdate = a3;
}

- (BOOL)needsCurrentEncodingBitRateUpdate
{
  return self->_needsCurrentEncodingBitRateUpdate;
}

- (void)setCurrentEncodingBitRate:(int64_t)a3
{
  self->_currentEncodingBitRate = a3;
}

- (int64_t)currentEncodingBitRate
{
  return self->_currentEncodingBitRate;
}

- (void)setCompressionSession:(OpaqueVTCompressionSession *)a3
{
  self->_compressionSession = a3;
}

- (OpaqueVTCompressionSession)compressionSession
{
  return self->_compressionSession;
}

- (void)setAvailableRangeCoordinator:(id)a3
{
}

- (PFVideoExportRangeCoordinator)availableRangeCoordinator
{
  return (PFVideoExportRangeCoordinator *)objc_getProperty(self, a2, 208, 1);
}

- (void)setInputReadingCompletionGroup:(id)a3
{
}

- (OS_dispatch_group)inputReadingCompletionGroup
{
  return (OS_dispatch_group *)objc_getProperty(self, a2, 200, 1);
}

- (void)setMinimumChunkLength:(unint64_t)a3
{
  self->_minimumChunkLength = a3;
}

- (unint64_t)minimumChunkLength
{
  return self->_minimumChunkLength;
}

- (void)setOutputFileSizeChangeSource:(id)a3
{
}

- (OS_dispatch_source)outputFileSizeChangeSource
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 184, 1);
}

- (void)setAdditionalWriterInputs:(id)a3
{
}

- (NSArray)additionalWriterInputs
{
  return (NSArray *)objc_getProperty(self, a2, 176, 1);
}

- (void)setVideoWriterInput:(id)a3
{
}

- (AVAssetWriterInput)videoWriterInput
{
  return (AVAssetWriterInput *)objc_getProperty(self, a2, 168, 1);
}

- (void)setAssetWriter:(id)a3
{
}

- (AVAssetWriter)assetWriter
{
  return (AVAssetWriter *)objc_getProperty(self, a2, 160, 1);
}

- (void)setAdditionalReaderTrackOutputs:(id)a3
{
}

- (NSArray)additionalReaderTrackOutputs
{
  return (NSArray *)objc_getProperty(self, a2, 152, 1);
}

- (void)setVideoReaderTrackOutput:(id)a3
{
}

- (AVAssetReaderTrackOutput)videoReaderTrackOutput
{
  return (AVAssetReaderTrackOutput *)objc_getProperty(self, a2, 144, 1);
}

- (void)setAssetReader:(id)a3
{
}

- (AVAssetReader)assetReader
{
  return (AVAssetReader *)objc_getProperty(self, a2, 136, 1);
}

- (void)setBitRateController:(id)a3
{
}

- (PFProportionalIntegralController)bitRateController
{
  return (PFProportionalIntegralController *)objc_getProperty(self, a2, 128, 1);
}

- (void)setStatistics:(id)a3
{
}

- (PFSinglePassVideoExportItemStatistics)statistics
{
  return (PFSinglePassVideoExportItemStatistics *)objc_getProperty(self, a2, 120, 1);
}

- (void)setTargetOutputMediaDataSize:(int64_t)a3
{
  self->_targetOutputMediaDataSize = a3;
}

- (int64_t)targetOutputMediaDataSize
{
  return self->_targetOutputMediaDataSize;
}

- (void)setOutputFileLastEndOffset:(unint64_t)a3
{
  self->_outputFileLastEndOffset = a3;
}

- (unint64_t)outputFileLastEndOffset
{
  return self->_outputFileLastEndOffset;
}

- (void)setShouldDeleteDestinationURLOnDeallocation:(BOOL)a3
{
  self->_shouldDeleteDestinationURLOnDeallocation = a3;
}

- (BOOL)shouldDeleteDestinationURLOnDeallocation
{
  return self->_shouldDeleteDestinationURLOnDeallocation;
}

- (void)setDestinationFileURL:(id)a3
{
}

- (NSURL)destinationFileURL
{
  return (NSURL *)objc_getProperty(self, a2, 96, 1);
}

- (void)setConversionOutputFileHandle:(id)a3
{
}

- (NSFileHandle)conversionOutputFileHandle
{
  return (NSFileHandle *)objc_getProperty(self, a2, 88, 1);
}

- (void)setAdditionalTracks:(id)a3
{
}

- (NSArray)additionalTracks
{
  return (NSArray *)objc_getProperty(self, a2, 80, 1);
}

- (void)setVideoTrack:(id)a3
{
}

- (AVAssetTrack)videoTrack
{
  return (AVAssetTrack *)objc_getProperty(self, a2, 72, 1);
}

- (void)setInputAsset:(id)a3
{
}

- (AVAsset)inputAsset
{
  return (AVAsset *)objc_getProperty(self, a2, 64, 1);
}

- (void)setExportItemStateQueue:(id)a3
{
}

- (OS_dispatch_queue)exportItemStateQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 56, 1);
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setAdditionalMetadata:(id)a3
{
}

- (NSArray)additionalMetadata
{
  return self->_additionalMetadata;
}

- (void)setProgress:(id)a3
{
}

- (NSProgress)progress
{
  return (NSProgress *)objc_getProperty(self, a2, 32, 1);
}

- (unint64_t)targetOutputFileSize
{
  return self->_targetOutputFileSize;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (double)inputAssetDuration
{
  v2 = [(PFSinglePassVideoExportItem *)self inputAsset];
  v3 = v2;
  if (v2) {
    [v2 duration];
  }
  else {
    memset(&time, 0, sizeof(time));
  }
  double Seconds = CMTimeGetSeconds(&time);

  return Seconds;
}

- (void)_cancel
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = self;
  objc_sync_enter(v2);
  unint64_t state = v2->_state;
  BOOL v4 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT);
  if ((state & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    if (v4)
    {
      *(_DWORD *)buf = 138543362;
      v10 = v2;
      _os_log_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Export item %{public}@ cancellation requested", buf, 0xCu);
    }
    v2->_didCancel = 1;
    v2->_unint64_t state = 4;
    objc_sync_exit(v2);

    v5 = [(PFSinglePassVideoExportItem *)v2 assetWriter];
    [v5 cancelWriting];

    v6 = [(PFSinglePassVideoExportItem *)v2 assetReader];
    [v6 cancelReading];

    dispatch_group_leave((dispatch_group_t)v2->_inputReadingCompletionGroup);
    additionalReaderTrackOutputs = v2->_additionalReaderTrackOutputs;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __38__PFSinglePassVideoExportItem__cancel__block_invoke;
    v8[3] = &unk_1E5B2F1F8;
    v8[4] = v2;
    [(NSArray *)additionalReaderTrackOutputs enumerateObjectsUsingBlock:v8];
    [(PFVideoExportRangeCoordinator *)v2->_availableRangeCoordinator cancel];
  }
  else
  {
    if (v4)
    {
      *(_DWORD *)buf = 138543618;
      v10 = v2;
      __int16 v11 = 2048;
      unint64_t v12 = state;
      _os_log_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Ignoring cancellation request of export item %{public}@ in state %ld", buf, 0x16u);
    }
    objc_sync_exit(v2);
  }
}

void __38__PFSinglePassVideoExportItem__cancel__block_invoke(uint64_t a1)
{
}

- (id)bitRateControllerForTargetEncodingBitRate:(int64_t)a3
{
  v3 = [[PFProportionalIntegralController alloc] initWithSetPoint:(uint64_t)((double)a3 * 0.95)];
  [(PFProportionalIntegralController *)v3 setOutputMax:[(PFProportionalIntegralController *)v3 setPoint]];
  [(PFProportionalIntegralController *)v3 setOutputMin:(uint64_t)((double)[(PFProportionalIntegralController *)v3 setPoint] * 0.6)];
  [(PFProportionalIntegralController *)v3 setIntegralErrorMin:-2000000];
  [(PFProportionalIntegralController *)v3 setIntegralErrorMax:2000000];
  [(PFProportionalIntegralController *)v3 setProportionalGain:0.045];
  [(PFProportionalIntegralController *)v3 setIntegralGain:0.002];

  return v3;
}

- (void)notifyDataAvailableToHandler:(id)a3 ignoreMinimumChunkLength:(BOOL)a4
{
  v6 = (void (**)(id, uint64_t, unint64_t, unint64_t, void))a3;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2020000000;
  uint64_t v19 = 0;
  exportItemStateQueue = self->_exportItemStateQueue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __85__PFSinglePassVideoExportItem_notifyDataAvailableToHandler_ignoreMinimumChunkLength___block_invoke;
  v15[3] = &unk_1E5B2F690;
  v15[4] = self;
  v15[5] = &v16;
  dispatch_sync(exportItemStateQueue, v15);
  uint64_t v8 = v17[3];
  if (v8 != [(PFSinglePassVideoExportItem *)self outputFileLastEndOffset])
  {
    uint64_t v9 = v17[3];
    v10 = [(PFSinglePassVideoExportItem *)self progress];
    [v10 setCompletedUnitCount:v9];

    unint64_t v11 = [(PFSinglePassVideoExportItem *)self outputFileLastEndOffset];
    uint64_t v12 = v17[3];
    unint64_t v13 = v12 - [(PFSinglePassVideoExportItem *)self outputFileLastEndOffset];
    if (a4 || v13 >= [(PFSinglePassVideoExportItem *)self minimumChunkLength])
    {
      [(PFSinglePassVideoExportItem *)self setOutputFileLastEndOffset:v17[3]];
      v14 = [(PFSinglePassVideoExportItem *)self statistics];
      [v14 addMeasurementForBytesDelivered:v13];

      v6[2](v6, 2, v11, v13, 0);
    }
  }
  _Block_object_dispose(&v16, 8);
}

void __85__PFSinglePassVideoExportItem_notifyDataAvailableToHandler_ignoreMinimumChunkLength___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) conversionOutputFileHandle];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 seekToEndOfFile];
}

- (void)setupOutputFileSourceWithOutputAvailableHandler:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_state == 2)
  {
    v5 = [MEMORY[0x1E4F28CB8] defaultManager];
    v6 = [(PFSinglePassVideoExportItem *)self destinationFileURL];
    v7 = [v6 path];
    int v8 = [v5 fileExistsAtPath:v7];

    if (v8)
    {
      uint64_t v9 = (void *)MEMORY[0x1E4F28CB0];
      v10 = [(PFSinglePassVideoExportItem *)self destinationFileURL];
      id v24 = 0;
      unint64_t v11 = [v9 fileHandleForReadingFromURL:v10 error:&v24];
      id v12 = v24;

      if (v11)
      {
        [(PFSinglePassVideoExportItem *)self setConversionOutputFileHandle:v11];
        self->_unint64_t state = 3;
        unint64_t v13 = dispatch_queue_create("com.apple.pfvideoexport.output-vnode-source", 0);
        v14 = [(PFSinglePassVideoExportItem *)self conversionOutputFileHandle];
        int v15 = [v14 fileDescriptor];
        uint64_t v16 = dispatch_source_create(MEMORY[0x1E4F144A8], v15, 4uLL, v13);

        handler[0] = MEMORY[0x1E4F143A8];
        handler[1] = 3221225472;
        handler[2] = __79__PFSinglePassVideoExportItem_setupOutputFileSourceWithOutputAvailableHandler___block_invoke;
        handler[3] = &unk_1E5B2F1D0;
        handler[4] = self;
        id v17 = v4;
        id v23 = v17;
        dispatch_source_set_event_handler(v16, handler);
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __79__PFSinglePassVideoExportItem_setupOutputFileSourceWithOutputAvailableHandler___block_invoke_2;
        v20[3] = &unk_1E5B2F1D0;
        v20[4] = self;
        id v21 = v17;
        dispatch_source_set_cancel_handler(v16, v20);
        [(PFSinglePassVideoExportItem *)self setOutputFileSizeChangeSource:v16];
        dispatch_activate(v16);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          identifier = self->_identifier;
          uint64_t v19 = [(NSURL *)self->_destinationFileURL path];
          *(_DWORD *)buf = 138543874;
          v26 = identifier;
          __int16 v27 = 2112;
          v28 = v19;
          __int16 v29 = 2114;
          id v30 = v12;
          _os_log_error_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Unable to open output file handle for %{public}@ %@: %{public}@", buf, 0x20u);
        }
        [(PFSinglePassVideoExportItem *)self _cancel];
      }
    }
  }
}

uint64_t __79__PFSinglePassVideoExportItem_setupOutputFileSourceWithOutputAvailableHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) notifyDataAvailableToHandler:*(void *)(a1 + 40) ignoreMinimumChunkLength:0];
}

void __79__PFSinglePassVideoExportItem_setupOutputFileSourceWithOutputAvailableHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v2 = (id *)(a1 + 32);
  [*(id *)(a1 + 32) notifyDataAvailableToHandler:*(void *)(a1 + 40) ignoreMinimumChunkLength:1];
  v3 = [*v2 assetWriter];
  uint64_t v4 = [v3 status];

  id v5 = *v2;
  objc_sync_enter(v5);
  if (*((unsigned char *)*v2 + 11))
  {
    v6 = MEMORY[0x1E4F14500];
    id v7 = MEMORY[0x1E4F14500];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      uint64_t v9 = *(void *)(v8 + 16);
      v10 = [*(id *)(v8 + 96) path];
      *(_DWORD *)buf = 138543618;
      uint64_t v28 = v9;
      __int16 v29 = 2112;
      uint64_t v30 = (uint64_t)v10;
      _os_log_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Completion for %{public}@ %@, item was cancelled", buf, 0x16u);
    }
    objc_sync_exit(v5);
  }
  else
  {
    objc_sync_exit(v5);

    uint64_t v11 = *(void *)(a1 + 32);
    if (v4 == 2)
    {
      *(void *)(v11 + 48) = 5;
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        uint64_t v12 = *(void *)(a1 + 32);
        uint64_t v13 = *(void *)(v12 + 16);
        v14 = [*(id *)(v12 + 96) path];
        *(_DWORD *)buf = 138543618;
        uint64_t v28 = v13;
        __int16 v29 = 2112;
        uint64_t v30 = (uint64_t)v14;
        _os_log_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Completion for %{public}@ %@", buf, 0x16u);
      }
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
    else
    {
      *(void *)(v11 + 48) = 4;
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        uint64_t v22 = *(void *)(a1 + 32);
        uint64_t v23 = *(void *)(v22 + 16);
        id v24 = [*(id *)(v22 + 160) error];
        *(_DWORD *)buf = 138543874;
        uint64_t v28 = v23;
        __int16 v29 = 2048;
        uint64_t v30 = v4;
        __int16 v31 = 2114;
        v32 = v24;
        _os_log_error_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Unsuccessful writer completion for %{public}@, status: %ld, error: %{public}@", buf, 0x20u);
      }
      if (v4 == 4) {
        uint64_t v15 = 5;
      }
      else {
        uint64_t v15 = 0;
      }
      uint64_t v16 = [*(id *)(a1 + 32) assetWriter];
      id v17 = [v16 error];
      if (v17)
      {
        uint64_t v18 = objc_msgSend(*(id *)(a1 + 32), "assetWriter", *MEMORY[0x1E4F28A50]);
        uint64_t v19 = [v18 error];
        v26 = v19;
        v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v26 forKeys:&v25 count:1];
      }
      else
      {
        v20 = 0;
      }

      id v21 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PFVideoExportErrorDomain" code:v15 userInfo:v20];
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
}

- (void)processCompressedSampleBuffer:(opaqueCMSampleBuffer *)a3 presentationTimeStamp:(id *)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  -[AVAssetWriterInput appendSampleBuffer:](self->_videoWriterInput, "appendSampleBuffer:");
  [(PFSinglePassVideoExportItemStatistics *)self->_statistics setProcessedOutputFrameCount:[(PFSinglePassVideoExportItemStatistics *)self->_statistics processedOutputFrameCount]+ 1];
  [(PFSinglePassVideoExportItemStatistics *)self->_statistics setProcessedVideoSampleBytes:[(PFSinglePassVideoExportItemStatistics *)self->_statistics processedVideoSampleBytes]+ CMSampleBufferGetTotalSampleSize(a3)];
  CMTime v27 = *(CMTime *)a4;
  [(PFSinglePassVideoExportItemStatistics *)self->_statistics setLastProcessedInputFramePresentationTime:CMTimeGetSeconds(&v27)];
  int64_t v7 = [(PFSinglePassVideoExportItemStatistics *)self->_statistics effectiveEncodingBitRate];
  uint64_t v8 = v7 - [(PFProportionalIntegralController *)self->_bitRateController setPoint];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    double v19 = (double)[(PFSinglePassVideoExportItemStatistics *)self->_statistics effectiveEncodingBitRate]/ 1000000.0;
    double v20 = (double)self->_currentEncodingBitRate / 1000000.0;
    double v21 = (double)[(PFSinglePassVideoExportItem *)self estimatedOutputBitRate] / 1000000.0;
    int64_t v22 = [(PFSinglePassVideoExportItemStatistics *)self->_statistics processedOutputFrameCount];
    unint64_t v23 = [(PFSinglePassVideoExportItemStatistics *)self->_statistics processedVideoSampleBytes];
    unint64_t v24 = [(PFSinglePassVideoExportItemStatistics *)self->_statistics processedAdditionalSampleBytes]+ v23;
    unint64_t v25 = [(PFSinglePassVideoExportItemStatistics *)self->_statistics processedVideoSampleBytes];
    unint64_t v26 = [(PFSinglePassVideoExportItemStatistics *)self->_statistics processedAdditionalSampleBytes];
    LODWORD(v27.value) = 134219776;
    *(double *)((char *)&v27.value + 4) = v19;
    LOWORD(v27.flags) = 2048;
    *(double *)((char *)&v27.flags + 2) = v20;
    HIWORD(v27.epoch) = 2048;
    double v28 = v21;
    __int16 v29 = 2048;
    double v30 = (double)v8 / 1000000.0;
    __int16 v31 = 2048;
    int64_t v32 = v22;
    __int16 v33 = 2048;
    unint64_t v34 = v24;
    __int16 v35 = 2048;
    unint64_t v36 = v25;
    __int16 v37 = 2048;
    unint64_t v38 = v26;
    _os_log_debug_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "Effective/selected/target bit rate: %.2fmbit/s / %.2fmbit/s / %.2fmbit/s , error = %.2fmbit/s, output frame count = %ld, sample bytes = %lu, video bytes = %lu, additional bytes = %lu", (uint8_t *)&v27, 0x52u);
  }
  float v9 = (float)[(PFSinglePassVideoExportItemStatistics *)self->_statistics processedOutputFrameCount];
  [(PFSinglePassVideoExportItemStatistics *)self->_statistics frameRate];
  double v11 = (float)(v9 / v10);
  uint64_t v12 = [(PFSinglePassVideoExportItem *)self bitRateController];
  objc_msgSend(v12, "updateWithTimestamp:error:feedback:", v8, -[PFSinglePassVideoExportItemStatistics effectiveEncodingBitRate](self->_statistics, "effectiveEncodingBitRate"), v11);

  if ([(PFSinglePassVideoExportItemStatistics *)self->_statistics processedOutputFrameCount] >= 11&& [(PFProportionalIntegralController *)self->_bitRateController outputReady])
  {
    int64_t v13 = [(PFProportionalIntegralController *)self->_bitRateController output];
    int64_t v14 = [(PFProportionalIntegralController *)self->_bitRateController setPoint];
    bitRateController = self->_bitRateController;
    uint64_t v16 = v13 >= v14
        ? [(PFProportionalIntegralController *)bitRateController setPoint]
        : [(PFProportionalIntegralController *)bitRateController output];
    int64_t v17 = v16;
    int64_t currentEncodingBitRate = self->_currentEncodingBitRate;
    if (v16 != currentEncodingBitRate)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
      {
        LODWORD(v27.value) = 134218240;
        *(double *)((char *)&v27.value + 4) = (double)currentEncodingBitRate / 1000000.0;
        LOWORD(v27.flags) = 2048;
        *(double *)((char *)&v27.flags + 2) = (double)v17 / 1000000.0;
        _os_log_debug_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "Adjusting encoding bit rate from %.2fmbit/s to %.2fmbit/s", (uint8_t *)&v27, 0x16u);
      }
      self->_int64_t currentEncodingBitRate = v17;
      self->_needsCurrentEncodingBitRateUpdate = 1;
    }
  }
}

- (void)startReadingInputAssetWithOutputAvailableHandler:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    int64_t v17 = [(PFSinglePassVideoExportItem *)self inputAsset];
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v17;
    _os_log_debug_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "Start reading input asset %@", (uint8_t *)&buf, 0xCu);
  }
  id v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v6 = dispatch_queue_create("com.apple.pfvideoexport.conversion", v5);

  int64_t v7 = [MEMORY[0x1E4F1CA48] array];
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v35 = 0x2020000000;
  char v36 = 0;
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __80__PFSinglePassVideoExportItem_startReadingInputAssetWithOutputAvailableHandler___block_invoke;
  v33[3] = &unk_1E5B2F690;
  v33[4] = self;
  v33[5] = &buf;
  uint64_t v8 = (void *)MEMORY[0x1A6259AE0](v33);
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x2020000000;
  char v32 = 0;
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x2020000000;
  char v30 = 0;
  videoWriterInput = self->_videoWriterInput;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __80__PFSinglePassVideoExportItem_startReadingInputAssetWithOutputAvailableHandler___block_invoke_289;
  v22[3] = &unk_1E5B2F158;
  v22[4] = self;
  CMTime v27 = v29;
  id v10 = v8;
  id v25 = v10;
  id v11 = v4;
  id v26 = v11;
  id v12 = v7;
  id v23 = v12;
  double v28 = v31;
  int64_t v13 = v6;
  unint64_t v24 = v13;
  [(AVAssetWriterInput *)videoWriterInput requestMediaDataWhenReadyOnQueue:v13 usingBlock:v22];
  additionalReaderTrackOutputs = self->_additionalReaderTrackOutputs;
  if (additionalReaderTrackOutputs)
  {
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __80__PFSinglePassVideoExportItem_startReadingInputAssetWithOutputAvailableHandler___block_invoke_293;
    v20[3] = &unk_1E5B2F1A8;
    v20[4] = self;
    double v21 = v13;
    [(NSArray *)additionalReaderTrackOutputs enumerateObjectsUsingBlock:v20];
  }
  inputReadingCompletionGroup = self->_inputReadingCompletionGroup;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __80__PFSinglePassVideoExportItem_startReadingInputAssetWithOutputAvailableHandler___block_invoke_295;
  block[3] = &unk_1E5B2F1D0;
  block[4] = self;
  id v19 = v11;
  id v16 = v11;
  dispatch_group_notify(inputReadingCompletionGroup, v13, block);

  _Block_object_dispose(v29, 8);
  _Block_object_dispose(v31, 8);

  _Block_object_dispose(&buf, 8);
}

void __80__PFSinglePassVideoExportItem_startReadingInputAssetWithOutputAvailableHandler___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v3 + 24))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      uint64_t v8 = *(void **)(v7 + 16);
      uint64_t v9 = *(void *)(v7 + 64);
      int v11 = 138543618;
      id v12 = v8;
      __int16 v13 = 2112;
      uint64_t v14 = v9;
      _os_log_debug_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "leave group - did finish already set, ID %{public}@ for %@", (uint8_t *)&v11, 0x16u);
    }
LABEL_4:
    objc_sync_exit(v2);

    return;
  }
  *(unsigned char *)(v3 + 24) = 1;
  uint64_t v4 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v4 + 11))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      id v5 = *(void **)(v4 + 16);
      uint64_t v6 = *(void *)(v4 + 64);
      int v11 = 138543618;
      id v12 = v5;
      __int16 v13 = 2112;
      uint64_t v14 = v6;
      _os_log_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "leave group - item already in failed state, ID %{public}@ for %@", (uint8_t *)&v11, 0x16u);
    }
    goto LABEL_4;
  }
  objc_sync_exit(v2);

  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    id v10 = [*(id *)(a1 + 32) inputAsset];
    int v11 = 138412290;
    id v12 = v10;
    _os_log_debug_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "leave group %@", (uint8_t *)&v11, 0xCu);
  }
  [*(id *)(*(void *)(a1 + 32) + 168) markAsFinished];
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 200));
}

void __80__PFSinglePassVideoExportItem_startReadingInputAssetWithOutputAvailableHandler___block_invoke_289(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if (![*(id *)(*(void *)(a1 + 32) + 168) isReadyForMoreMediaData]) {
    return;
  }
  CFStringRef v3 = (const __CFString *)*MEMORY[0x1E4F44810];
  uint64_t v4 = MEMORY[0x1E4F14500];
  *(void *)&long long v2 = 67109120;
  long long v22 = v2;
  while (1)
  {
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24))
    {
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
      return;
    }
    [*(id *)(a1 + 32) setupOutputFileSourceWithOutputAvailableHandler:*(void *)(a1 + 64)];
    if ([*(id *)(a1 + 40) count])
    {
      id v5 = [*(id *)(a1 + 40) firstObject];
      uint64_t v6 = [v5 firstObject];
      memset(&completeUntilPresentationTimeStamp, 0, sizeof(completeUntilPresentationTimeStamp));
      uint64_t v7 = [v5 lastObject];
      uint64_t v8 = v7;
      if (v7) {
        [v7 CMTimeValue];
      }
      else {
        memset(&completeUntilPresentationTimeStamp, 0, sizeof(completeUntilPresentationTimeStamp));
      }

      uint64_t v15 = *(void **)(a1 + 32);
      CMTime v31 = completeUntilPresentationTimeStamp;
      [v15 processCompressedSampleBuffer:v6 presentationTimeStamp:&v31];
      [*(id *)(a1 + 40) removeObjectAtIndex:0];
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) && ![*(id *)(a1 + 40) count])
      {
        (*(void (**)(void))(*(void *)(a1 + 56) + 16))();

        return;
      }

      goto LABEL_19;
    }
    uint64_t v9 = (opaqueCMSampleBuffer *)[*(id *)(*(void *)(a1 + 32) + 144) copyNextSampleBuffer];
    if (!v9) {
      break;
    }
    id v10 = v9;
    memset(&completeUntilPresentationTimeStamp, 0, sizeof(completeUntilPresentationTimeStamp));
    CMSampleBufferGetPresentationTimeStamp(&completeUntilPresentationTimeStamp, v9);
    memset(&v31, 0, sizeof(v31));
    CMSampleBufferGetDuration(&v31, v10);
    ImageBuffer = CMSampleBufferGetImageBuffer(v10);
    uint64_t v12 = *(void *)(a1 + 32);
    if (!*(unsigned char *)(v12 + 9)) {
      goto LABEL_26;
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      CMTimeValue v16 = *(void *)(v12 + 224);
      LODWORD(buf.value) = 134217984;
      *(CMTimeValue *)((char *)&buf.value + 4) = v16;
      _os_log_debug_impl(&dword_1A41FE000, v4, OS_LOG_TYPE_DEBUG, "Bit rate update to %ld", (uint8_t *)&buf, 0xCu);
      uint64_t v12 = *(void *)(a1 + 32);
    }
    OSStatus v13 = VTSessionSetProperty(*(VTSessionRef *)(v12 + 216), v3, (CFTypeRef)objc_msgSend(NSNumber, "numberWithInteger:", *(void *)(v12 + 224), v22));
    *(unsigned char *)(*(void *)(a1 + 32) + 9) = 0;
    if (!v13)
    {
      uint64_t v12 = *(void *)(a1 + 32);
LABEL_26:
      id v19 = *(OpaqueVTCompressionSession **)(v12 + 216);
      outputHandler[0] = MEMORY[0x1E4F143A8];
      outputHandler[1] = 3221225472;
      outputHandler[2] = __80__PFSinglePassVideoExportItem_startReadingInputAssetWithOutputAvailableHandler___block_invoke_290;
      outputHandler[3] = &unk_1E5B2F130;
      __int16 v29 = v10;
      CMTime v30 = completeUntilPresentationTimeStamp;
      id v25 = *(id *)(a1 + 48);
      id v20 = *(id *)(a1 + 40);
      uint64_t v21 = *(void *)(a1 + 32);
      id v26 = v20;
      uint64_t v27 = v21;
      uint64_t v28 = *(void *)(a1 + 72);
      CMTime buf = completeUntilPresentationTimeStamp;
      CMTime duration = v31;
      VTCompressionSessionEncodeFrameWithOutputHandler(v19, ImageBuffer, &buf, &duration, 0, 0, outputHandler);

      return;
    }
    OSStatus v14 = v13;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      buf.value = __PAIR64__(v14, v22);
      _os_log_error_impl(&dword_1A41FE000, v4, OS_LOG_TYPE_ERROR, "Unable to adjust bit rate, status = %d", (uint8_t *)&buf, 8u);
    }
    CFRelease(v10);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
LABEL_19:
    if ((objc_msgSend(*(id *)(*(void *)(a1 + 32) + 168), "isReadyForMoreMediaData", v22) & 1) == 0) {
      return;
    }
  }
  uint64_t v17 = *(void *)(*(void *)(a1 + 80) + 8);
  if (!*(unsigned char *)(v17 + 24))
  {
    *(unsigned char *)(v17 + 24) = 1;
    uint64_t v18 = *(OpaqueVTCompressionSession **)(*(void *)(a1 + 32) + 216);
    CMTime completeUntilPresentationTimeStamp = *(CMTime *)*(void *)&MEMORY[0x1E4F1F9F0];
    VTCompressionSessionCompleteFrames(v18, &completeUntilPresentationTimeStamp);
  }
}

void __80__PFSinglePassVideoExportItem_startReadingInputAssetWithOutputAvailableHandler___block_invoke_293(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = [v5 objectAtIndexedSubscript:0];
  uint64_t v7 = [*(id *)(*(void *)(a1 + 32) + 176) objectAtIndexedSubscript:a3];
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x2020000000;
  char v18 = 0;
  uint64_t v8 = *(void *)(a1 + 40);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __80__PFSinglePassVideoExportItem_startReadingInputAssetWithOutputAvailableHandler___block_invoke_2_294;
  v12[3] = &unk_1E5B2F180;
  id v9 = v7;
  uint64_t v10 = *(void *)(a1 + 32);
  id v13 = v9;
  uint64_t v14 = v10;
  id v11 = v6;
  id v15 = v11;
  CMTimeValue v16 = v17;
  [v9 requestMediaDataWhenReadyOnQueue:v8 usingBlock:v12];

  _Block_object_dispose(v17, 8);
}

void __80__PFSinglePassVideoExportItem_startReadingInputAssetWithOutputAvailableHandler___block_invoke_295(uint64_t a1)
{
  uint64_t v5 = MEMORY[0x1E4F143A8];
  uint64_t v6 = 3221225472;
  uint64_t v7 = __80__PFSinglePassVideoExportItem_startReadingInputAssetWithOutputAvailableHandler___block_invoke_2_296;
  uint64_t v8 = &unk_1E5B2F1D0;
  long long v2 = *(void **)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = v2;
  CFStringRef v3 = (void (**)(void))MEMORY[0x1A6259AE0](&v5);
  id v4 = *(id *)(a1 + 32);
  objc_sync_enter(v4);
  if (*(unsigned char *)(*(void *)(a1 + 32) + 11))
  {
    v3[2](v3);
    objc_sync_exit(v4);
  }
  else
  {
    objc_sync_exit(v4);

    objc_msgSend(*(id *)(a1 + 32), "assetWriter", v5, v6, v7, v8, v9);
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    [v4 finishWritingWithCompletionHandler:v3];
  }
}

void __80__PFSinglePassVideoExportItem_startReadingInputAssetWithOutputAvailableHandler___block_invoke_2_296(uint64_t a1)
{
  CFRelease(*(CFTypeRef *)(*(void *)(a1 + 32) + 216));
  *(void *)(*(void *)(a1 + 32) + 216) = 0;
  long long v2 = [*(id *)(a1 + 32) outputFileSizeChangeSource];

  if (v2)
  {
    id v4 = [*(id *)(a1 + 32) outputFileSizeChangeSource];
    dispatch_source_cancel(v4);
  }
  else
  {
    CFStringRef v3 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v3();
  }
}

void __80__PFSinglePassVideoExportItem_startReadingInputAssetWithOutputAvailableHandler___block_invoke_2_294(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) isReadyForMoreMediaData])
  {
    while (1)
    {
      id v2 = *(id *)(a1 + 40);
      objc_sync_enter(v2);
      uint64_t v3 = *(void *)(a1 + 40);
      if (*(unsigned char *)(v3 + 11)) {
        break;
      }
      objc_sync_exit(v2);

      id v4 = (opaqueCMSampleBuffer *)[*(id *)(a1 + 48) copyNextSampleBuffer];
      if (!v4)
      {
        uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8);
        if (!*(unsigned char *)(v8 + 24))
        {
          *(unsigned char *)(v8 + 24) = 1;
          [*(id *)(a1 + 32) markAsFinished];
          uint64_t v9 = *(NSObject **)(*(void *)(a1 + 40) + 200);
          dispatch_group_leave(v9);
        }
        return;
      }
      uint64_t v5 = v4;
      objc_msgSend(*(id *)(*(void *)(a1 + 40) + 120), "setProcessedAdditionalSampleBytes:", objc_msgSend(*(id *)(*(void *)(a1 + 40) + 120), "processedAdditionalSampleBytes")+ CMSampleBufferGetTotalSampleSize(v4));
      [*(id *)(a1 + 32) appendSampleBuffer:v5];
      CFRelease(v5);
      if (([*(id *)(a1 + 32) isReadyForMoreMediaData] & 1) == 0) {
        return;
      }
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(v3 + 16);
      uint64_t v7 = *(void *)(v3 + 64);
      int v10 = 138543618;
      uint64_t v11 = v6;
      __int16 v12 = 2112;
      uint64_t v13 = v7;
      _os_log_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "additional track processing - item was cancelled, ID %{public}@ for %@", (uint8_t *)&v10, 0x16u);
    }
    objc_sync_exit(v2);
  }
}

void __80__PFSinglePassVideoExportItem_startReadingInputAssetWithOutputAvailableHandler___block_invoke_290(uint64_t a1, CMTimeFlags a2, uint64_t a3, uint64_t a4)
{
  v17[2] = *MEMORY[0x1E4F143B8];
  CFRelease(*(CFTypeRef *)(a1 + 64));
  if (a2)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      CMTimeValue v12 = *(void *)(*(void *)(a1 + 48) + 16);
      LODWORD(time.value) = 138543618;
      *(CMTimeValue *)((char *)&time.value + 4) = v12;
      LOWORD(time.flags) = 1024;
      *(CMTimeFlags *)((char *)&time.flags + 2) = a2;
      _os_log_error_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Unable to encode frame for %{public}@, status = %d", (uint8_t *)&time, 0x12u);
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  }
  else if (a4)
  {
    v17[0] = a4;
    CMTime time = *(CMTime *)(a1 + 72);
    uint64_t v7 = [MEMORY[0x1E4F29238] valueWithCMTime:&time];
    v17[1] = v7;
    uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];

    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __80__PFSinglePassVideoExportItem_startReadingInputAssetWithOutputAvailableHandler___block_invoke_2;
    v13[3] = &unk_1E5B2F668;
    uint64_t v9 = *(NSObject **)(a1 + 32);
    id v14 = *(id *)(a1 + 40);
    id v15 = v8;
    id v10 = v8;
    dispatch_async(v9, v13);
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    CMTime time = *(CMTime *)(a1 + 72);
    Float64 Seconds = CMTimeGetSeconds(&time);
    LODWORD(time.value) = 134217984;
    *(Float64 *)((char *)&time.value + 4) = Seconds;
    _os_log_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Frame drop at presentation time %f", (uint8_t *)&time, 0xCu);
  }
}

uint64_t __80__PFSinglePassVideoExportItem_startReadingInputAssetWithOutputAvailableHandler___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) addObject:*(void *)(a1 + 40)];
}

- (int64_t)estimatedOutputBitRate
{
  inputAsset = self->_inputAsset;
  if (inputAsset) {
    [(AVAsset *)inputAsset duration];
  }
  else {
    memset(&time, 0, sizeof(time));
  }
  if (CMTimeGetSeconds(&time) >= 1.0) {
    return [(PFSinglePassVideoExportItemStatistics *)self->_statistics targetEncodingBitRate];
  }
  [(AVAssetTrack *)self->_videoTrack naturalSize];
  double v6 = v4 * v5 * 1.5;
  [(AVAssetTrack *)self->_videoTrack nominalFrameRate];
  return (uint64_t)(v6 * v7 * 0.1);
}

- (void)configureDroppableFrameRateForCompressionSession:(OpaqueVTCompressionSession *)a3 inputWidth:(int)a4 inputHeight:(int)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  CFDictionaryRef supportedPropertyDictionaryOut = 0;
  OSStatus v8 = VTSessionCopySupportedPropertyDictionary(a3, &supportedPropertyDictionaryOut);
  if (v8)
  {
    OSStatus v9 = v8;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)CMTime buf = 67109120;
      LODWORD(v17) = v9;
      _os_log_error_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Unable to query compression session for supported properties, status = %d", buf, 8u);
    }
  }
  else
  {
    CFStringRef v10 = (const __CFString *)*MEMORY[0x1E4F44828];
    int v11 = CFDictionaryContainsKey(supportedPropertyDictionaryOut, (const void *)*MEMORY[0x1E4F44828]);
    CFRelease(supportedPropertyDictionaryOut);
    if (!v11) {
      CFStringRef v10 = (const __CFString *)*MEMORY[0x1E4F44818];
    }
    CMTimeValue v12 = &unk_1EF7CAA78;
    if (a5 * a4 > 2073600) {
      CMTimeValue v12 = &unk_1EF7CAA60;
    }
    id v13 = v12;
    OSStatus v14 = VTSessionSetProperty(a3, v10, v13);
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)CMTime buf = 138543874;
      CFStringRef v17 = v10;
      __int16 v18 = 2114;
      id v19 = v13;
      __int16 v20 = 1024;
      OSStatus v21 = v14;
      _os_log_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Configuring droppable frame rate: setting %{public}@ to %{public}@, status = %d", buf, 0x1Cu);
    }
  }
}

- (BOOL)isAPACAudioTrack:(id)a3
{
  id v3 = a3;
  double v4 = [v3 mediaType];
  int v5 = [v4 isEqual:*MEMORY[0x1E4F15BA8]];

  BOOL v9 = 0;
  if (v5)
  {
    double v6 = [v3 formatDescriptions];
    float v7 = (const opaqueCMFormatDescription *)[v6 firstObject];

    FourCharCode MediaSubType = CMFormatDescriptionGetMediaSubType(v7);
    if (MediaSubType == 1634754915 || MediaSubType == 1902211171 || MediaSubType == 1667330147) {
      BOOL v9 = 1;
    }
  }

  return v9;
}

- (void)configureOutputMetadataForAssetWriter:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v21 = a3;
  double v4 = [MEMORY[0x1E4F1CA80] set];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  int v5 = [(PFSinglePassVideoExportItem *)self additionalMetadata];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v27 != v8) {
          objc_enumerationMutation(v5);
        }
        CFStringRef v10 = [*(id *)(*((void *)&v26 + 1) + 8 * i) identifier];
        [v4 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v7);
  }

  int v11 = [MEMORY[0x1E4F1CA48] array];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  CMTimeValue v12 = [(AVAsset *)self->_inputAsset metadata];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v23;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v23 != v15) {
          objc_enumerationMutation(v12);
        }
        CFStringRef v17 = *(void **)(*((void *)&v22 + 1) + 8 * j);
        __int16 v18 = [v17 identifier];
        char v19 = [v4 containsObject:v18];

        if ((v19 & 1) == 0) {
          [v11 addObject:v17];
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v14);
  }

  if ([v4 count])
  {
    __int16 v20 = [(PFSinglePassVideoExportItem *)self additionalMetadata];
    [v11 addObjectsFromArray:v20];
  }
  [v21 setMetadata:v11];
}

- (BOOL)setupConversionWithError:(id *)a3
{
  id v3 = self;
  v122[1] = *MEMORY[0x1E4F143B8];
  double v4 = [(PFSinglePassVideoExportItem *)self videoTrack];
  [v4 naturalSize];
  double v6 = v5;
  double v8 = v7;

  inputAsset = v3->_inputAsset;
  id v114 = 0;
  CFStringRef v10 = [MEMORY[0x1E4F16378] assetReaderWithAsset:inputAsset error:&v114];
  id v11 = v114;
  if (v10)
  {
    [(PFSinglePassVideoExportItem *)v3 setAssetReader:v10];
    CMTimeValue v12 = [(PFSinglePassVideoExportItem *)v3 videoTrack];
    uint64_t v13 = [v12 formatDescriptions];
    uint64_t v14 = (const opaqueCMFormatDescription *)[v13 firstObject];

    v93 = CMFormatDescriptionGetExtensions(v14);
    uint64_t v15 = [v93 objectForKeyedSubscript:@"BitsPerComponent"];
    uint64_t v16 = [v15 integerValue];

    if (v16 <= 8) {
      uint64_t v17 = 875704438;
    }
    else {
      uint64_t v17 = 2016686640;
    }
    uint64_t v121 = *MEMORY[0x1E4F24D70];
    __int16 v18 = [NSNumber numberWithUnsignedInt:v17];
    v122[0] = v18;
    char v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v122 forKeys:&v121 count:1];

    __int16 v20 = (void *)MEMORY[0x1E4F163A0];
    id v21 = [(PFSinglePassVideoExportItem *)v3 videoTrack];
    long long v22 = [v20 assetReaderTrackOutputWithTrack:v21 outputSettings:v19];

    [(PFSinglePassVideoExportItem *)v3 setVideoReaderTrackOutput:v22];
    [v22 setAlwaysCopiesSampleData:0];
    [v10 addOutput:v22];
    v92 = v22;
    objc_msgSend(v22, "setMaximizePowerEfficiency:", -[PFSinglePassVideoExportItem maximizePowerEfficiency](v3, "maximizePowerEfficiency"));
    v91 = v19;
    if ([(NSArray *)v3->_additionalTracks count])
    {
      id v89 = v11;
      long long v23 = v10;
      long long v24 = [MEMORY[0x1E4F1CA48] array];
      [(PFSinglePassVideoExportItem *)v3 setAdditionalReaderTrackOutputs:v24];
      long long v112 = 0u;
      long long v113 = 0u;
      long long v110 = 0u;
      long long v111 = 0u;
      long long v25 = v3->_additionalTracks;
      uint64_t v26 = [(NSArray *)v25 countByEnumeratingWithState:&v110 objects:v120 count:16];
      if (v26)
      {
        uint64_t v27 = v26;
        uint64_t v28 = *(void *)v111;
        do
        {
          for (uint64_t i = 0; i != v27; ++i)
          {
            if (*(void *)v111 != v28) {
              objc_enumerationMutation(v25);
            }
            CMTime v30 = *(void **)(*((void *)&v110 + 1) + 8 * i);
            if (![(PFSinglePassVideoExportItem *)v3 isAPACAudioTrack:v30])
            {
              CMTime v31 = [MEMORY[0x1E4F163A0] assetReaderTrackOutputWithTrack:v30 outputSettings:0];
              [v31 setAlwaysCopiesSampleData:0];
              [v23 addOutput:v31];
              v119[0] = v31;
              uint64_t v32 = v3;
              __int16 v33 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v30, "isEnabled"));
              v119[1] = v33;
              uint64_t v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:v119 count:2];
              [v24 addObject:v34];

              id v3 = v32;
              objc_msgSend(v31, "setMaximizePowerEfficiency:", -[PFSinglePassVideoExportItem maximizePowerEfficiency](v32, "maximizePowerEfficiency"));
            }
          }
          uint64_t v27 = [(NSArray *)v25 countByEnumeratingWithState:&v110 objects:v120 count:16];
        }
        while (v27);
      }

      CFStringRef v10 = v23;
      id v11 = v89;
      char v19 = v91;
    }
    if ([v10 startReading])
    {
      uint64_t v35 = (int)v6;
      uint64_t v36 = (int)v8;
      v90 = v3;
      uint64_t v37 = [(PFSinglePassVideoExportItem *)v3 destinationFileURL];

      if (!v37)
      {
        unint64_t v38 = (void *)MEMORY[0x1E4F1CB10];
        v87 = NSTemporaryDirectory();
        uint64_t v39 = NSString;
        v40 = (objc_class *)objc_opt_class();
        v41 = NSStringFromClass(v40);
        v42 = [(PFSinglePassVideoExportItem *)v90 identifier];
        v43 = [v39 stringWithFormat:@"%@-%@.mov", v41, v42];
        [v87 stringByAppendingPathComponent:v43];
        v45 = id v44 = v11;
        v46 = [v38 fileURLWithPath:v45];
        [(PFSinglePassVideoExportItem *)v90 setDestinationFileURL:v46];

        id v11 = v44;
        uint64_t v36 = (int)v8;

        char v19 = v91;
        [(PFSinglePassVideoExportItem *)v90 setShouldDeleteDestinationURLOnDeallocation:1];
      }
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
      {
        identifier = v90->_identifier;
        destinationFileURL = v90->_destinationFileURL;
        *(_DWORD *)CMTime buf = 138543618;
        *(void *)&uint8_t buf[4] = identifier;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = destinationFileURL;
        _os_log_debug_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "Setting up asset writer for %{public}@ with destination URL %@", buf, 0x16u);
      }
      VTSessionRef session = 0;
      OSStatus v47 = VTCompressionSessionCreate(0, (int)v6, v36, 0x61766331u, 0, 0, 0, 0, 0, (VTCompressionSessionRef *)&session);
      if (v47)
      {
        OSStatus v48 = v47;
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)CMTime buf = 67109120;
          *(_DWORD *)&uint8_t buf[4] = v48;
          _os_log_error_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Unable to create compression session, result = %d", buf, 8u);
        }
        v90->_unint64_t state = 4;
        if (a3)
        {
          [MEMORY[0x1E4F28C58] errorWithDomain:@"PFVideoExportErrorDomain" code:6 userInfo:0];
          char v49 = 0;
          *a3 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          char v49 = 0;
        }
        id v53 = v11;
      }
      else
      {
        v90->_compressionSession = (OpaqueVTCompressionSession *)session;
        [(AVAssetTrack *)v90->_videoTrack nominalFrameRate];
        float v51 = *(float *)&v50;
        v52 = v90->_inputAsset;
        if (v52) {
          [(AVAsset *)v52 duration];
        }
        else {
          memset(v108, 0, sizeof(v108));
        }
        *(float *)&double v50 = v51;
        v88 = +[PFSinglePassVideoExportItemStatistics statisticsWithTargetPlaybackDuration:v108 frameRate:v90->_targetOutputFileSize targetOutputTotalBytes:v50];
        -[PFSinglePassVideoExportItem setStatistics:](v90, "setStatistics:");
        uint64_t v54 = [(PFSinglePassVideoExportItem *)v90 estimatedOutputBitRate];
        v90->_int64_t currentEncodingBitRate = v54;
        v55 = [(PFSinglePassVideoExportItem *)v90 bitRateControllerForTargetEncodingBitRate:v54];
        [(PFSinglePassVideoExportItem *)v90 setBitRateController:v55];

        VTSessionSetProperty(session, (CFStringRef)*MEMORY[0x1E4F44810], (CFTypeRef)[NSNumber numberWithInteger:v90->_currentEncodingBitRate]);
        VTSessionSetProperty(session, (CFStringRef)*MEMORY[0x1E4F44868], (CFTypeRef)*MEMORY[0x1E4F24AB0]);
        VTSessionSetProperty(session, (CFStringRef)*MEMORY[0x1E4F44B58], (CFTypeRef)*MEMORY[0x1E4F24BE0]);
        VTSessionSetProperty(session, (CFStringRef)*MEMORY[0x1E4F44BB0], (CFTypeRef)*MEMORY[0x1E4F24C48]);
        if (v51 > 30.0) {
          [(PFSinglePassVideoExportItem *)v90 configureDroppableFrameRateForCompressionSession:session inputWidth:v35 inputHeight:v36];
        }
        VTCompressionSessionPrepareToEncodeFrames((VTCompressionSessionRef)session);
        v56 = (void *)MEMORY[0x1E4F163B8];
        v57 = [(PFSinglePassVideoExportItem *)v90 destinationFileURL];
        uint64_t v58 = *MEMORY[0x1E4F15AB0];
        id v107 = v11;
        [v56 assetWriterWithURL:v57 fileType:v58 error:&v107];
        v60 = v59 = v11;
        id v53 = v107;

        if (v60)
        {
          [(PFSinglePassVideoExportItem *)v90 setAssetWriter:v60];
          [(PFSinglePassVideoExportItem *)v90 configureOutputMetadataForAssetWriter:v60];
          objc_msgSend(v60, "setWritesSinglePassUsingPredeterminedFileSize:mediaDataSize:", -[PFSinglePassVideoExportItem targetOutputFileSize](v90, "targetOutputFileSize"), -[PFSinglePassVideoExportItem targetOutputMediaDataSize](v90, "targetOutputMediaDataSize"));
          dispatch_group_t v61 = dispatch_group_create();
          inputReadingCompletionGroup = v90->_inputReadingCompletionGroup;
          v90->_inputReadingCompletionGroup = (OS_dispatch_group *)v61;

          v63 = [MEMORY[0x1E4F163C0] assetWriterInputWithMediaType:*MEMORY[0x1E4F15C18] outputSettings:0];
          [(PFSinglePassVideoExportItem *)v90 setVideoWriterInput:v63];
          videoTrack = v90->_videoTrack;
          if (videoTrack)
          {
            [(AVAssetTrack *)videoTrack preferredTransform];
          }
          else
          {
            long long v105 = 0u;
            long long v106 = 0u;
            long long v104 = 0u;
          }
          v103[0] = v104;
          v103[1] = v105;
          v103[2] = v106;
          [v63 setTransform:v103];
          v65 = [(AVAssetTrack *)v90->_videoTrack metadata];
          [v63 setMetadata:v65];

          v66 = v90;
          objc_msgSend(v63, "setMaximizePowerEfficiency:", -[PFSinglePassVideoExportItem maximizePowerEfficiency](v90, "maximizePowerEfficiency"));
          [v60 addInput:v63];
          dispatch_group_enter((dispatch_group_t)v90->_inputReadingCompletionGroup);
          if (v90->_additionalReaderTrackOutputs)
          {
            v67 = [MEMORY[0x1E4F1CA48] array];
            [(PFSinglePassVideoExportItem *)v90 setAdditionalWriterInputs:v67];
            additionalReaderTrackOutputs = v90->_additionalReaderTrackOutputs;
            v99[0] = MEMORY[0x1E4F143A8];
            v99[1] = 3221225472;
            v99[2] = __56__PFSinglePassVideoExportItem_setupConversionWithError___block_invoke;
            v99[3] = &unk_1E5B2F108;
            id v100 = v60;
            v101 = v90;
            id v102 = v67;
            id v69 = v67;
            [(NSArray *)additionalReaderTrackOutputs enumerateObjectsUsingBlock:v99];

            v66 = v90;
          }
          v70 = v66->_inputAsset;
          if (v70)
          {
            [(AVAsset *)v70 duration];
          }
          else
          {
            long long v97 = 0uLL;
            uint64_t v98 = 0;
          }
          long long v95 = v97;
          uint64_t v96 = v98;
          [v60 setOverallDurationHint:&v95];
          char v49 = [v60 startWriting];
          if (v49)
          {
            v66->_unint64_t state = 2;
            *(_OWORD *)CMTime buf = *MEMORY[0x1E4F1FA48];
            *(void *)&buf[16] = *(void *)(MEMORY[0x1E4F1FA48] + 16);
            [v60 startSessionAtSourceTime:buf];
          }
          else
          {
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
            {
              v84 = [(PFSinglePassVideoExportItem *)v66 destinationFileURL];
              uint64_t v85 = [v60 status];
              v86 = [v60 error];
              *(_DWORD *)CMTime buf = 138412802;
              *(void *)&uint8_t buf[4] = v84;
              *(_WORD *)&buf[12] = 2048;
              *(void *)&buf[14] = v85;
              *(_WORD *)&buf[22] = 2112;
              uint64_t v116 = (uint64_t)v86;
              _os_log_error_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Unable to start writing to %@: status: %ld, error: %@", buf, 0x20u);

              v66 = v90;
            }
            v66->_unint64_t state = 4;
            if (a3)
            {
              *a3 = [v60 error];
            }
          }

          char v19 = v91;
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            v82 = v90->_identifier;
            v83 = v90->_destinationFileURL;
            *(_DWORD *)CMTime buf = 138543874;
            *(void *)&uint8_t buf[4] = v82;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v83;
            *(_WORD *)&buf[22] = 2114;
            uint64_t v116 = (uint64_t)v53;
            _os_log_error_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Unable to create writer for %{public}@ for output URL %@: %{public}@", buf, 0x20u);
          }
          v90->_unint64_t state = 4;
          char v49 = 0;
          if (a3) {
            *a3 = v53;
          }
        }
      }
      id v11 = v53;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        v76 = v10;
        v77 = v3->_identifier;
        v78 = v3->_inputAsset;
        v79 = v3;
        uint64_t v80 = [v76 status];
        v81 = [v76 error];
        *(_DWORD *)CMTime buf = 138544130;
        *(void *)&uint8_t buf[4] = v77;
        CFStringRef v10 = v76;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v78;
        *(_WORD *)&buf[22] = 2048;
        uint64_t v116 = v80;
        id v3 = v79;
        __int16 v117 = 2114;
        v118 = v81;
        _os_log_error_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Unable to start reading from asset %{public}@ %@: status: %ld, error: %{public}@", buf, 0x2Au);
      }
      v3->_unint64_t state = 4;
      if (a3)
      {
        [v10 error];
        char v49 = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        char v49 = 0;
      }
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v72 = v3->_identifier;
      v73 = v3->_inputAsset;
      *(_DWORD *)CMTime buf = 138543874;
      *(void *)&uint8_t buf[4] = v72;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v73;
      *(_WORD *)&buf[22] = 2114;
      uint64_t v116 = (uint64_t)v11;
      _os_log_error_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Unable to create asset reader for %{public}@ %@: %{public}@", buf, 0x20u);
    }
    v3->_unint64_t state = 4;
    if (a3)
    {
      id v11 = v11;
      char v49 = 0;
      *a3 = v11;
    }
    else
    {
      char v49 = 0;
    }
  }

  return v49;
}

void __56__PFSinglePassVideoExportItem_setupConversionWithError___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  id v9 = [v3 objectAtIndexedSubscript:0];
  double v4 = [v3 objectAtIndexedSubscript:1];

  uint64_t v5 = [v4 BOOLValue];
  double v6 = (void *)MEMORY[0x1E4F163C0];
  double v7 = [v9 mediaType];
  double v8 = [v6 assetWriterInputWithMediaType:v7 outputSettings:0];

  [v8 setMarksOutputTrackAsEnabled:v5];
  [a1[4] addInput:v8];
  objc_msgSend(v8, "setMaximizePowerEfficiency:", objc_msgSend(a1[5], "maximizePowerEfficiency"));
  [a1[6] addObject:v8];
  dispatch_group_enter(*((dispatch_group_t *)a1[5] + 25));
}

- (id)outputDataInRange:(_NSRange)a3 waitUntilAvailableWithTimeout:(unint64_t)a4 error:(id *)a5
{
  NSUInteger location = a3.location;
  v30[1] = *MEMORY[0x1E4F143B8];
  unint64_t state = self->_state;
  if (state <= 4 && ((1 << state) & 0x13) != 0)
  {
    if (a5)
    {
      id v9 = (void *)MEMORY[0x1E4F28C58];
      long long v29 = @"PFVideoExportErrorStateKey";
      CFStringRef v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
      v30[0] = v10;
      id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:&v29 count:1];
      *a5 = [v9 errorWithDomain:@"PFVideoExportErrorDomain" code:1 userInfo:v11];
    }
    goto LABEL_7;
  }
  NSUInteger length = a3.length;
  unint64_t v17 = [(PFSinglePassVideoExportItem *)self targetOutputFileSize];
  if (length > 0x500000 || location + length > v17)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v32.NSUInteger location = location;
      v32.NSUInteger length = length;
      long long v22 = NSStringFromRange(v32);
      *(_DWORD *)CMTime buf = 138543618;
      *(void *)&uint8_t buf[4] = v22;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = [(PFSinglePassVideoExportItem *)self targetOutputFileSize];
      _os_log_error_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Invalid range %{public}@ requested, available NSUInteger length = %llu", buf, 0x16u);

      if (a5) {
        goto LABEL_17;
      }
    }
    else if (a5)
    {
LABEL_17:
      [MEMORY[0x1E4F28C58] errorWithDomain:@"PFVideoExportErrorDomain" code:3 userInfo:0];
      id v12 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
LABEL_7:
    id v12 = 0;
    goto LABEL_8;
  }
  __int16 v18 = [(PFSinglePassVideoExportItem *)self availableRangeCoordinator];
  id v24 = 0;
  char v19 = objc_msgSend(v18, "waitForAvailabilityOfRange:timeout:error:", location, length, a4, &v24);
  id v20 = v24;

  if (v19)
  {
    *(void *)CMTime buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    uint64_t v26 = __Block_byref_object_copy__11503;
    uint64_t v27 = __Block_byref_object_dispose__11504;
    id v28 = 0;
    exportItemStateQueue = self->_exportItemStateQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __85__PFSinglePassVideoExportItem_outputDataInRange_waitUntilAvailableWithTimeout_error___block_invoke;
    block[3] = &unk_1E5B2F0E0;
    block[6] = location;
    block[7] = length;
    block[4] = self;
    void block[5] = buf;
    dispatch_sync(exportItemStateQueue, block);
    id v12 = *(id *)(*(void *)&buf[8] + 40);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    id v12 = 0;
    if (a5) {
      *a5 = v20;
    }
  }

LABEL_8:

  return v12;
}

void __85__PFSinglePassVideoExportItem_outputDataInRange_waitUntilAvailableWithTimeout_error___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) conversionOutputFileHandle];
  [v5 seekToFileOffset:*(void *)(a1 + 48)];
  uint64_t v2 = [v5 readDataOfLength:*(void *)(a1 + 56)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  double v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (BOOL)startConversionWithError:(id *)a3 outputAvailableHandler:(id)a4
{
  id v6 = a4;
  BOOL v7 = [(PFSinglePassVideoExportItem *)self setupConversionWithError:a3];
  if (v7)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __79__PFSinglePassVideoExportItem_startConversionWithError_outputAvailableHandler___block_invoke;
    v9[3] = &unk_1E5B2F0B8;
    v9[4] = self;
    id v10 = v6;
    [(PFSinglePassVideoExportItem *)self startReadingInputAssetWithOutputAvailableHandler:v9];
  }
  return v7;
}

void __79__PFSinglePassVideoExportItem_startConversionWithError_outputAvailableHandler___block_invoke(uint64_t a1, void *a2, NSUInteger a3, NSUInteger a4, void *a5)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v9 = a5;
  if (a2 == (void *)3)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
      goto LABEL_9;
    }
    id v12 = *(void **)(*(void *)(a1 + 32) + 16);
    int v20 = 138543362;
    id v21 = v12;
    uint64_t v13 = MEMORY[0x1E4F14500];
    uint64_t v14 = "Finished converting asset %{public}@";
    uint32_t v15 = 12;
LABEL_13:
    _os_log_debug_impl(&dword_1A41FE000, v13, OS_LOG_TYPE_DEBUG, v14, (uint8_t *)&v20, v15);
    goto LABEL_9;
  }
  if (a2 != (void *)2)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
      goto LABEL_9;
    }
    char v19 = *(void **)(*(void *)(a1 + 32) + 16);
    int v20 = 138543874;
    id v21 = v19;
    __int16 v22 = 2048;
    long long v23 = a2;
    __int16 v24 = 2112;
    id v25 = v9;
    uint64_t v13 = MEMORY[0x1E4F14500];
    uint64_t v14 = "Error reading converting video %{public}@, status = %ld, error = %@";
    uint32_t v15 = 32;
    goto LABEL_13;
  }
  v27.NSUInteger location = [*(id *)(*(void *)(a1 + 32) + 208) availableRange];
  v29.NSUInteger location = a3;
  v29.NSUInteger length = a4;
  NSRange v10 = NSUnionRange(v27, v29);
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    v28.NSUInteger location = a3;
    v28.NSUInteger length = a4;
    unint64_t v17 = NSStringFromRange(v28);
    __int16 v18 = NSStringFromRange(v10);
    int v20 = 138543618;
    id v21 = v17;
    __int16 v22 = 2114;
    long long v23 = v18;
    _os_log_debug_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "New data range available: %{public}@, setting available total range to %{public}@", (uint8_t *)&v20, 0x16u);
  }
  id v11 = [*(id *)(a1 + 32) availableRangeCoordinator];
  objc_msgSend(v11, "updateAvailableRange:", v10.location, v10.length);

LABEL_9:
  uint64_t v16 = *(void *)(a1 + 40);
  if (v16) {
    (*(void (**)(uint64_t, void *, NSUInteger, NSUInteger, id))(v16 + 16))(v16, a2, a3, a4, v9);
  }
}

- (void)setTargetOutputFileSize:(unint64_t)a3
{
  self->_targetOutputFileSize = a3;
  id v4 = [(PFSinglePassVideoExportItem *)self progress];
  [v4 setTotalUnitCount:a3];
}

- (BOOL)preflight
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v4 = [(AVAsset *)self->_inputAsset tracks];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
    uint64_t v8 = *MEMORY[0x1E4F15C18];
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void *)(*((void *)&v16 + 1) + 8 * v9);
        if (self->_videoTrack
          || ([*(id *)(*((void *)&v16 + 1) + 8 * v9) mediaType],
              id v11 = objc_claimAutoreleasedReturnValue(),
              int v12 = [v11 isEqual:v8],
              v11,
              !v12))
        {
          [v3 addObject:v10];
        }
        else
        {
          [(PFSinglePassVideoExportItem *)self setVideoTrack:v10];
        }
        ++v9;
      }
      while (v6 != v9);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }

  uint64_t v13 = [(PFSinglePassVideoExportItem *)self videoTrack];

  if (v13)
  {
    if ([v3 count]) {
      [(PFSinglePassVideoExportItem *)self setAdditionalTracks:v3];
    }
    unint64_t v14 = 1;
  }
  else
  {
    unint64_t v14 = 4;
  }
  self->_unint64_t state = v14;

  return v13 != 0;
}

- (void)dealloc
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  compressionSession = self->_compressionSession;
  if (compressionSession)
  {
    CFRelease(compressionSession);
    self->_compressionSession = 0;
  }
  id v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  if (self->_shouldDeleteDestinationURLOnDeallocation)
  {
    destinationFileURL = self->_destinationFileURL;
    if (destinationFileURL)
    {
      uint64_t v6 = [(NSURL *)destinationFileURL path];
      int v7 = [v4 fileExistsAtPath:v6];

      if (v7)
      {
        uint64_t v8 = [(NSURL *)self->_destinationFileURL path];
        id v13 = 0;
        char v9 = [v4 removeItemAtPath:v8 error:&v13];
        id v10 = v13;

        if ((v9 & 1) == 0 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          id v11 = [(NSURL *)self->_destinationFileURL path];
          *(_DWORD *)CMTime buf = 138543618;
          uint32_t v15 = v11;
          __int16 v16 = 2112;
          id v17 = v10;
          _os_log_error_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Unable to remove temp file %{public}@: %@", buf, 0x16u);
        }
      }
    }
  }

  v12.receiver = self;
  v12.super_class = (Class)PFSinglePassVideoExportItem;
  [(PFSinglePassVideoExportItem *)&v12 dealloc];
}

- (PFSinglePassVideoExportItem)init
{
  v18.receiver = self;
  v18.super_class = (Class)PFSinglePassVideoExportItem;
  uint64_t v2 = [(PFSinglePassVideoExportItem *)&v18 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F29128] UUID];
    id v4 = [v3 UUIDString];

    objc_storeStrong((id *)&v2->_identifier, v4);
    v2->_unint64_t state = 0;
    uint64_t v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.pfvideoexport.state", v5);
    exportItemStateQueue = v2->_exportItemStateQueue;
    v2->_exportItemStateQueue = (OS_dispatch_queue *)v6;

    v2->_minimumChunkLength = 102400;
    uint64_t v8 = [MEMORY[0x1E4F28F90] discreteProgressWithTotalUnitCount:0];
    progress = v2->_progress;
    v2->_progress = (NSProgress *)v8;

    objc_initWeak(&location, v2);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __35__PFSinglePassVideoExportItem_init__block_invoke;
    v14[3] = &unk_1E5B2F090;
    id v10 = v4;
    id v15 = v10;
    objc_copyWeak(&v16, &location);
    [(NSProgress *)v2->_progress setCancellationHandler:v14];
    uint64_t v11 = objc_opt_new();
    availableRangeCoordinator = v2->_availableRangeCoordinator;
    v2->_availableRangeCoordinator = (PFVideoExportRangeCoordinator *)v11;

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __35__PFSinglePassVideoExportItem_init__block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    uint64_t v2 = *(void *)(a1 + 32);
    int v4 = 138543362;
    uint64_t v5 = v2;
    _os_log_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "PFSinglePassVideoExportItem item %{public}@ cancelled", (uint8_t *)&v4, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _cancel];
}

@end