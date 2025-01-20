@interface PFAVReaderWriter
- ($9E16F6706E08E1DCF37CEDFAE5F41851)timeRange;
- (AVAsset)asset;
- (AVAssetWriterInput)metadataInput;
- (BOOL)setUpReaderAndWriterReturningError:(id *)a3;
- (BOOL)startReadingAndWritingReturningError:(id *)a3;
- (NSURL)outputURL;
- (PFAVReaderWriter)init;
- (PFAVReaderWriter)initWithAsset:(id)a3;
- (PFAVReaderWriter)initWithAsset:(id)a3 stillImageTime:(id *)a4;
- (PFAVReaderWriterAdjustDelegate)delegate;
- (void)_didLoadAVAssetValues;
- (void)cancel;
- (void)readingAndWritingDidFinishSuccessfully:(BOOL)a3 withError:(id)a4;
- (void)sampleBufferChannel:(id)a3 didReadSampleBuffer:(opaqueCMSampleBuffer *)a4;
- (void)sampleBufferChannel:(id)a3 didReadSampleBuffer:(opaqueCMSampleBuffer *)a4 andMadeWriteSampleBuffer:(__CVBuffer *)a5;
- (void)setAsset:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setMetadataInput:(id)a3;
- (void)setOutputURL:(id)a3;
- (void)setTimeRange:(id *)a3;
- (void)writeToURL:(id)a3 progress:(id)a4 completion:(id)a5;
@end

@implementation PFAVReaderWriter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputURL, 0);
  objc_storeStrong((id *)&self->_metadataInput, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong(&self->_progressBlock, 0);
  objc_storeStrong((id *)&self->passthroughChannels, 0);
  objc_storeStrong((id *)&self->videoChannels, 0);
  objc_storeStrong((id *)&self->assetWriter, 0);
  objc_storeStrong((id *)&self->assetReader, 0);
  objc_storeStrong((id *)&self->_isolationQueue, 0);

  objc_storeStrong((id *)&self->_serializationQueue, 0);
}

- (void)setOutputURL:(id)a3
{
}

- (NSURL)outputURL
{
  return self->_outputURL;
}

- (void)setTimeRange:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0.var0;
  long long v4 = *(_OWORD *)&a3->var1.var1;
  *(_OWORD *)&self->_timeRange.start.epoch = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&self->_timeRange.duration.timescale = v4;
  *(_OWORD *)&self->_timeRange.start.value = v3;
}

- ($9E16F6706E08E1DCF37CEDFAE5F41851)timeRange
{
  long long v3 = *(_OWORD *)&self[3].var0.var3;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self[3].var0.var0;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[3].var1.var1;
  return self;
}

- (void)setMetadataInput:(id)a3
{
}

- (AVAssetWriterInput)metadataInput
{
  return self->_metadataInput;
}

- (void)setAsset:(id)a3
{
}

- (AVAsset)asset
{
  return self->_asset;
}

- (void)setDelegate:(id)a3
{
}

- (PFAVReaderWriterAdjustDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PFAVReaderWriterAdjustDelegate *)WeakRetained;
}

- (void)sampleBufferChannel:(id)a3 didReadSampleBuffer:(opaqueCMSampleBuffer *)a4 andMadeWriteSampleBuffer:(__CVBuffer *)a5
{
  [(PFAVReaderWriter *)self timeRange];
  double v8 = progressOfSampleBufferInTimeRange(a4, v18);
  progressBlock = (void (**)(float))self->_progressBlock;
  if (progressBlock)
  {
    float v10 = v8;
    progressBlock[2](v10);
  }
  CVImageBufferRef ImageBuffer = CMSampleBufferGetImageBuffer(a4);
  if (ImageBuffer)
  {
    CVImageBufferRef v12 = ImageBuffer;
    CFTypeID v13 = CFGetTypeID(ImageBuffer);
    CFTypeID TypeID = CVPixelBufferGetTypeID();
    if (a5)
    {
      if (v13 == TypeID)
      {
        v15 = [(PFAVReaderWriter *)self delegate];
        char v16 = objc_opt_respondsToSelector();

        if (v16)
        {
          v17 = [(PFAVReaderWriter *)self delegate];
          [v17 adjustPixelBuffer:v12 toOutputBuffer:a5];
        }
      }
    }
  }
}

- (void)sampleBufferChannel:(id)a3 didReadSampleBuffer:(opaqueCMSampleBuffer *)a4
{
  [(PFAVReaderWriter *)self timeRange];
  double v6 = progressOfSampleBufferInTimeRange(a4, v15);
  progressBlock = (void (**)(float))self->_progressBlock;
  if (progressBlock)
  {
    float v8 = v6;
    progressBlock[2](v8);
  }
  CVImageBufferRef ImageBuffer = CMSampleBufferGetImageBuffer(a4);
  if (ImageBuffer)
  {
    CVImageBufferRef v10 = ImageBuffer;
    CFTypeID v11 = CFGetTypeID(ImageBuffer);
    if (v11 == CVPixelBufferGetTypeID())
    {
      CVImageBufferRef v12 = [(PFAVReaderWriter *)self delegate];
      char v13 = objc_opt_respondsToSelector();

      if (v13)
      {
        v14 = [(PFAVReaderWriter *)self delegate];
        [v14 adjustPixelBuffer:v10];
      }
    }
  }
}

- (void)readingAndWritingDidFinishSuccessfully:(BOOL)a3 withError:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if (!v4)
  {
    [(AVAssetReader *)self->assetReader cancelReading];
    [(AVAssetWriter *)self->assetWriter cancelWriting];
  }
  assetReader = self->assetReader;
  self->assetReader = 0;

  assetWriter = self->assetWriter;
  self->assetWriter = 0;

  videoChannels = self->videoChannels;
  self->videoChannels = 0;

  passthroughChannels = self->passthroughChannels;
  self->passthroughChannels = 0;

  self->cancelled = 0;
  id progressBlock = self->_progressBlock;
  self->_id progressBlock = 0;

  CVImageBufferRef v12 = (void (**)(void, void, void))MEMORY[0x1A6259AE0](self->_completionBlock);
  id completionBlock = self->_completionBlock;
  self->_id completionBlock = 0;

  isolationQueue = self->_isolationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__PFAVReaderWriter_readingAndWritingDidFinishSuccessfully_withError___block_invoke;
  block[3] = &unk_1E5B2F5F0;
  block[4] = self;
  dispatch_sync(isolationQueue, block);
  if (v12) {
    ((void (**)(void, BOOL, id))v12)[2](v12, v4, v6);
  }
}

uint64_t __69__PFAVReaderWriter_readingAndWritingDidFinishSuccessfully_withError___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 80) = 0;
  return result;
}

- (void)cancel
{
  serializationQueue = self->_serializationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __26__PFAVReaderWriter_cancel__block_invoke;
  block[3] = &unk_1E5B2F5F0;
  block[4] = self;
  dispatch_async(serializationQueue, block);
}

uint64_t __26__PFAVReaderWriter_cancel__block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 40);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v18;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v18 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v17 + 1) + 8 * v6++) cancel];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v17 objects:v22 count:16];
    }
    while (v4);
  }

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v7 = *(id *)(*(void *)(a1 + 32) + 48);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v11++), "cancel", (void)v13);
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v21 count:16];
    }
    while (v9);
  }

  *(unsigned char *)(*(void *)(a1 + 32) + 56) = 1;
  return [*(id *)(a1 + 32) readingAndWritingDidFinishSuccessfully:0 withError:0];
}

- (BOOL)startReadingAndWritingReturningError:(id *)a3
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  if (![(AVAssetReader *)self->assetReader startReading])
  {
    if (a3)
    {
      assetReader = self->assetReader;
LABEL_27:
      id v27 = [assetReader error];
      BOOL result = 0;
      *a3 = v27;
      return result;
    }
    return 0;
  }
  if (![(AVAssetWriter *)self->assetWriter startWriting])
  {
    if (a3)
    {
      assetReader = self->assetWriter;
      goto LABEL_27;
    }
    return 0;
  }
  uint64_t v5 = dispatch_group_create();
  assetWriter = self->assetWriter;
  [(PFAVReaderWriter *)self timeRange];
  long long v46 = v44;
  uint64_t v47 = v45;
  [(AVAssetWriter *)assetWriter startSessionAtSourceTime:&v46];
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  obuint64_t j = self->videoChannels;
  uint64_t v7 = [(NSArray *)obj countByEnumeratingWithState:&v40 objects:v49 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v41 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        dispatch_group_enter(v5);
        CVImageBufferRef v12 = [(PFAVReaderWriter *)self delegate];
        if (v12) {
          long long v13 = self;
        }
        else {
          long long v13 = 0;
        }
        long long v14 = v13;

        v38[0] = MEMORY[0x1E4F143A8];
        v38[1] = 3221225472;
        v38[2] = __57__PFAVReaderWriter_startReadingAndWritingReturningError___block_invoke;
        v38[3] = &unk_1E5B2F5F0;
        v39 = v5;
        [v11 startWithDelegate:v14 completionHandler:v38];
      }
      uint64_t v8 = [(NSArray *)obj countByEnumeratingWithState:&v40 objects:v49 count:16];
    }
    while (v8);
  }

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v15 = self->passthroughChannels;
  uint64_t v16 = [(NSArray *)v15 countByEnumeratingWithState:&v34 objects:v48 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v35;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v35 != v18) {
          objc_enumerationMutation(v15);
        }
        long long v20 = *(void **)(*((void *)&v34 + 1) + 8 * j);
        dispatch_group_enter(v5);
        v32[0] = MEMORY[0x1E4F143A8];
        v32[1] = 3221225472;
        v32[2] = __57__PFAVReaderWriter_startReadingAndWritingReturningError___block_invoke_2;
        v32[3] = &unk_1E5B2F5F0;
        v33 = v5;
        [v20 startWithDelegate:0 completionHandler:v32];
      }
      uint64_t v17 = [(NSArray *)v15 countByEnumeratingWithState:&v34 objects:v48 count:16];
    }
    while (v17);
  }

  v21 = [(PFAVReaderWriter *)self metadataInput];

  if (v21)
  {
    dispatch_group_enter(v5);
    metadataInput = self->_metadataInput;
    isolationQueue = self->_isolationQueue;
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __57__PFAVReaderWriter_startReadingAndWritingReturningError___block_invoke_3;
    v30[3] = &unk_1E5B2F668;
    v30[4] = self;
    v31 = v5;
    [(AVAssetWriterInput *)metadataInput requestMediaDataWhenReadyOnQueue:isolationQueue usingBlock:v30];
  }
  serializationQueue = self->_serializationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__PFAVReaderWriter_startReadingAndWritingReturningError___block_invoke_4;
  block[3] = &unk_1E5B2F5F0;
  block[4] = self;
  dispatch_group_notify(v5, serializationQueue, block);

  return 1;
}

void __57__PFAVReaderWriter_startReadingAndWritingReturningError___block_invoke(uint64_t a1)
{
}

void __57__PFAVReaderWriter_startReadingAndWritingReturningError___block_invoke_2(uint64_t a1)
{
}

void __57__PFAVReaderWriter_startReadingAndWritingReturningError___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  long long v6 = *(_OWORD *)(v2 + 84);
  uint64_t v7 = *(void *)(v2 + 100);
  CMSampleBufferRef QuickTimeMovieStillImageTimeSampleBuffer = StolenFigCaptureMetadataUtilitiesCreateQuickTimeMovieStillImageTimeSampleBuffer((uint64_t)&v6, 0);
  if (QuickTimeMovieStillImageTimeSampleBuffer)
  {
    CMSampleBufferRef v4 = QuickTimeMovieStillImageTimeSampleBuffer;
    [*(id *)(*(void *)(a1 + 32) + 128) appendSampleBuffer:QuickTimeMovieStillImageTimeSampleBuffer];
    CFRelease(v4);
  }
  [*(id *)(*(void *)(a1 + 32) + 128) markAsFinished];
  uint64_t v5 = *(NSObject **)(a1 + 40);

  dispatch_group_leave(v5);
}

void __57__PFAVReaderWriter_startReadingAndWritingReturningError___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 24);
  if (*(unsigned char *)(v2 + 56))
  {
    [v3 cancelReading];
    CMSampleBufferRef v4 = *(void **)(*(void *)(a1 + 32) + 32);
    [v4 cancelWriting];
  }
  else
  {
    uint64_t v5 = [v3 status];
    uint64_t v6 = *(void *)(a1 + 32);
    if (v5 == 3)
    {
      id v8 = [*(id *)(v6 + 24) error];
      [*(id *)(a1 + 32) readingAndWritingDidFinishSuccessfully:0 withError:v8];
    }
    else
    {
      uint64_t v7 = *(void **)(v6 + 32);
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __57__PFAVReaderWriter_startReadingAndWritingReturningError___block_invoke_5;
      v9[3] = &unk_1E5B2F5F0;
      v9[4] = v6;
      [v7 finishWritingWithCompletionHandler:v9];
    }
  }
}

void __57__PFAVReaderWriter_startReadingAndWritingReturningError___block_invoke_5(uint64_t a1)
{
  BOOL v2 = [*(id *)(*(void *)(a1 + 32) + 32) status] == 2;
  uint64_t v3 = *(id **)(a1 + 32);
  id v4 = [v3[4] error];
  [v3 readingAndWritingDidFinishSuccessfully:v2 withError:v4];
}

- (BOOL)setUpReaderAndWriterReturningError:(id *)a3
{
  uint64_t v132 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(PFAVReaderWriter *)self asset];
  uint64_t v6 = [(PFAVReaderWriter *)self outputURL];
  id v120 = 0;
  uint64_t v7 = (AVAssetReader *)[objc_alloc(MEMORY[0x1E4F16378]) initWithAsset:v5 error:&v120];
  id v8 = v120;
  assetReader = self->assetReader;
  self->assetReader = v7;

  if (self->assetReader)
  {
    id v10 = objc_alloc(MEMORY[0x1E4F163B8]);
    uint64_t v11 = *MEMORY[0x1E4F15AB0];
    id v119 = v8;
    CVImageBufferRef v12 = (AVAssetWriter *)[v10 initWithURL:v6 fileType:v11 error:&v119];
    id v13 = v119;

    assetWriter = self->assetWriter;
    self->assetWriter = v12;

    v108 = self;
    if (self->assetWriter)
    {
      uint64_t v15 = [v5 metadata];
      if (v15) {
        [(AVAssetWriter *)self->assetWriter setMetadata:v15];
      }
      v77 = (void *)v15;
      id v74 = v13;
      v75 = v6;
      uint64_t v16 = +[PFMediaUtilities tracksWithMediaType:*MEMORY[0x1E4F15C18] forAsset:v5];
      id v93 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v76 = v5;
      v78 = [v5 tracks];
      id v96 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v115 = 0u;
      long long v116 = 0u;
      long long v117 = 0u;
      long long v118 = 0u;
      id v17 = v16;
      uint64_t v106 = [v17 countByEnumeratingWithState:&v115 objects:v131 count:16];
      v107 = v17;
      if (v106)
      {
        uint64_t v105 = *(void *)v116;
        uint64_t v104 = *MEMORY[0x1E4F24D70];
        uint64_t v103 = *MEMORY[0x1E4F24D20];
        CFStringRef extensionKey = (const __CFString *)*MEMORY[0x1E4F24A78];
        uint64_t v92 = *MEMORY[0x1E4F16208];
        v91 = (const void *)*MEMORY[0x1E4F24A88];
        uint64_t v90 = *MEMORY[0x1E4F161E8];
        v89 = (const void *)*MEMORY[0x1E4F24A68];
        uint64_t v88 = *MEMORY[0x1E4F161F0];
        v87 = (const void *)*MEMORY[0x1E4F24A70];
        uint64_t v86 = *MEMORY[0x1E4F16200];
        v85 = (const void *)*MEMORY[0x1E4F24A80];
        CFStringRef v94 = (const __CFString *)*MEMORY[0x1E4F24B98];
        uint64_t v84 = *MEMORY[0x1E4F162B0];
        v83 = (const void *)*MEMORY[0x1E4F24B90];
        uint64_t v82 = *MEMORY[0x1E4F162C0];
        v81 = (const void *)*MEMORY[0x1E4F24BA0];
        uint64_t v80 = *MEMORY[0x1E4F161F8];
        uint64_t v79 = *MEMORY[0x1E4F162B8];
        uint64_t v102 = *MEMORY[0x1E4F16228];
        uint64_t v101 = *MEMORY[0x1E4F16220];
        uint64_t v100 = *MEMORY[0x1E4F16300];
        char v98 = 1;
        uint64_t v99 = *MEMORY[0x1E4F162A0];
        uint64_t v97 = *MEMORY[0x1E4F16268];
LABEL_7:
        uint64_t v18 = 0;
        while (1)
        {
          if (*(void *)v116 != v105) {
            objc_enumerationMutation(v17);
          }
          long long v19 = *(void **)(*((void *)&v115 + 1) + 8 * v18);
          v129[0] = v104;
          v129[1] = v103;
          v130[0] = &unk_1EF7CA3D0;
          v130[1] = MEMORY[0x1E4F1CC08];
          long long v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v130 forKeys:v129 count:2];
          v21 = [MEMORY[0x1E4F163A0] assetReaderTrackOutputWithTrack:v19 outputSettings:v20];
          v22 = [v19 formatDescriptions];
          if (![v22 count]) {
            goto LABEL_21;
          }
          uint64_t v23 = [v22 objectAtIndexedSubscript:0];

          if (v23)
          {
            CGSize PresentationDimensions = CMVideoFormatDescriptionGetPresentationDimensions((CMVideoFormatDescriptionRef)v23, 0, 0);
            double width = PresentationDimensions.width;
            double height = PresentationDimensions.height;
            CFDictionaryRef Extension = (const __CFDictionary *)CMFormatDescriptionGetExtension((CMFormatDescriptionRef)v23, extensionKey);
            uint64_t v28 = (uint64_t)Extension;
            if (Extension)
            {
              v127[0] = v92;
              v128[0] = CFDictionaryGetValue(Extension, v91);
              v127[1] = v90;
              v128[1] = CFDictionaryGetValue((CFDictionaryRef)v28, v89);
              v127[2] = v88;
              v128[2] = CFDictionaryGetValue((CFDictionaryRef)v28, v87);
              v127[3] = v86;
              v128[3] = CFDictionaryGetValue((CFDictionaryRef)v28, v85);
              uint64_t v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v128 forKeys:v127 count:4];
            }
            CFDictionaryRef v29 = (const __CFDictionary *)CMFormatDescriptionGetExtension((CMFormatDescriptionRef)v23, v94);
            uint64_t v30 = (uint64_t)v29;
            if (v29)
            {
              v125[0] = v84;
              v126[0] = CFDictionaryGetValue(v29, v83);
              v125[1] = v82;
              v126[1] = CFDictionaryGetValue((CFDictionaryRef)v30, v81);
              uint64_t v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v126 forKeys:v125 count:2];
            }
            if (v28 | v30)
            {
              v31 = [MEMORY[0x1E4F1CA60] dictionary];
              v32 = v31;
              if (v28) {
                [v31 setObject:v28 forKeyedSubscript:v80];
              }
              if (v30) {
                [v32 setObject:v30 forKeyedSubscript:v79];
              }
            }
            else
            {
              v32 = 0;
            }
          }
          else
          {
LABEL_21:
            [v19 naturalSize];
            double width = v33;
            double height = v34;
            v32 = 0;
          }
          long long v35 = (void *)MEMORY[0x1E4F1CA60];
          long long v36 = [NSNumber numberWithDouble:width];
          long long v37 = [NSNumber numberWithDouble:height];
          v38 = objc_msgSend(v35, "dictionaryWithObjectsAndKeys:", v102, v101, v36, v100, v37, v99, 0);

          if (v32) {
            [v38 setObject:v32 forKeyedSubscript:v97];
          }
          v39 = (void *)MEMORY[0x1E4F163C0];
          long long v40 = [v19 mediaType];
          long long v41 = [v39 assetWriterInputWithMediaType:v40 outputSettings:v38];

          if (v19) {
            [v19 preferredTransform];
          }
          else {
            memset(v114, 0, sizeof(v114));
          }
          [v41 setTransform:v114];
          if ([(AVAssetReader *)v108->assetReader canAddOutput:v21]
            && [(AVAssetWriter *)v108->assetWriter canAddInput:v41])
          {
            [(AVAssetReader *)v108->assetReader addOutput:v21];
            [(AVAssetWriter *)v108->assetWriter addInput:v41];
            int v42 = 1;
            long long v43 = [[PFRWSampleBufferChannel alloc] initWithAssetReaderOutput:v21 assetWriterInput:v41 useAdaptor:1];
            [v93 addObject:v43];
          }
          else
          {
            char v98 = 0;
            int v42 = 0;
          }

          id v17 = v107;
          if (!v42) {
            break;
          }
          if (v106 == ++v18)
          {
            uint64_t v106 = [v107 countByEnumeratingWithState:&v115 objects:v131 count:16];
            if (v106) {
              goto LABEL_7;
            }
            break;
          }
        }

        if ((v98 & 1) == 0)
        {
          BOOL v44 = 0;
          uint64_t v6 = v75;
          uint64_t v5 = v76;
          id v13 = v74;
          goto LABEL_62;
        }
      }
      else
      {
      }
      int timescale = v108->_stillImagetime.timescale;
      long long v110 = 0u;
      long long v111 = 0u;
      long long v112 = 0u;
      long long v113 = 0u;
      id v47 = v78;
      uint64_t v48 = [v47 countByEnumeratingWithState:&v110 objects:v124 count:16];
      if (v48)
      {
        uint64_t v49 = v48;
        uint64_t v50 = *(void *)v111;
        uint64_t v51 = *MEMORY[0x1E4F15BE0];
        while (2)
        {
          for (uint64_t i = 0; i != v49; ++i)
          {
            if (*(void *)v111 != v50) {
              objc_enumerationMutation(v47);
            }
            v53 = *(void **)(*((void *)&v110 + 1) + 8 * i);
            if (([v17 containsObject:v53] & 1) == 0)
            {
              if ((timescale & 1) == 0
                || ([v53 mediaType],
                    v54 = objc_claimAutoreleasedReturnValue(),
                    char v55 = [v54 isEqualToString:v51],
                    v54,
                    (v55 & 1) == 0))
              {
                v56 = [MEMORY[0x1E4F163A0] assetReaderTrackOutputWithTrack:v53 outputSettings:0];
                v57 = (void *)MEMORY[0x1E4F163C0];
                v58 = [v53 mediaType];
                v59 = [v57 assetWriterInputWithMediaType:v58 outputSettings:0];

                if (![(AVAssetReader *)v108->assetReader canAddOutput:v56]
                  || ![(AVAssetWriter *)v108->assetWriter canAddInput:v59])
                {

                  BOOL v44 = 0;
                  uint64_t v6 = v75;
                  uint64_t v5 = v76;
                  id v13 = v74;
                  id v17 = v107;
                  goto LABEL_62;
                }
                [(AVAssetReader *)v108->assetReader addOutput:v56];
                [(AVAssetWriter *)v108->assetWriter addInput:v59];
                v60 = [[PFRWSampleBufferChannel alloc] initWithAssetReaderOutput:v56 assetWriterInput:v59 useAdaptor:0];
                [v96 addObject:v60];

                id v17 = v107;
              }
            }
          }
          uint64_t v49 = [v47 countByEnumeratingWithState:&v110 objects:v124 count:16];
          if (v49) {
            continue;
          }
          break;
        }
      }

      uint64_t v6 = v75;
      uint64_t v5 = v76;
      id v13 = v74;
      if (timescale)
      {
        CMMetadataFormatDescriptionRef formatDescriptionOut = 0;
        uint64_t v61 = *MEMORY[0x1E4F1F0F8];
        v121[0] = *MEMORY[0x1E4F1F108];
        v121[1] = v61;
        uint64_t v62 = *MEMORY[0x1E4F1F048];
        v122[0] = *MEMORY[0x1E4F218A0];
        v122[1] = v62;
        v63 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v122 forKeys:v121 count:2];
        v123 = v63;
        CFArrayRef v64 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v123 count:1];

        CMMetadataFormatDescriptionCreateWithMetadataSpecifications((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0x6D656278u, v64, &formatDescriptionOut);
        id v65 = objc_alloc(MEMORY[0x1E4F163C0]);
        uint64_t v66 = [v65 initWithMediaType:*MEMORY[0x1E4F15BE0] outputSettings:0 sourceFormatHint:formatDescriptionOut];
        if (![(AVAssetWriter *)v108->assetWriter canAddInput:v66])
        {
          metadataInput = v108->_metadataInput;
          v108->_metadataInput = (AVAssetWriterInput *)v66;

          BOOL v44 = 0;
          goto LABEL_62;
        }
        [(AVAssetWriter *)v108->assetWriter addInput:v66];
        v67 = v108->_metadataInput;
        v108->_metadataInput = (AVAssetWriterInput *)v66;
      }
      uint64_t v68 = [v93 copy];
      videoChannels = v108->videoChannels;
      v108->videoChannels = (NSArray *)v68;

      uint64_t v70 = [v96 copy];
      passthroughChannels = v108->passthroughChannels;
      v108->passthroughChannels = (NSArray *)v70;

      BOOL v44 = 1;
LABEL_62:

      goto LABEL_65;
    }
    if (!a3)
    {
      BOOL v44 = 0;
      goto LABEL_65;
    }
    uint64_t v45 = v13;
  }
  else
  {
    if (!a3)
    {
      BOOL v44 = 0;
      id v13 = v8;
      goto LABEL_65;
    }
    uint64_t v45 = v8;
  }
  id v13 = v45;
  BOOL v44 = 0;
  *a3 = v13;
LABEL_65:

  return v44;
}

- (void)_didLoadAVAssetValues
{
  if (!self->cancelled)
  {
    uint64_t v3 = [(PFAVReaderWriter *)self asset];
    id v4 = [(PFAVReaderWriter *)self outputURL];
    id v27 = 0;
    uint64_t v5 = [v3 statusOfValueForKey:@"tracks" error:&v27];
    id v6 = v27;
    id v7 = v6;
    if (v5 == 2)
    {
      id v26 = v6;
      uint64_t v8 = [v3 statusOfValueForKey:@"duration" error:&v26];
      id v9 = v26;

      if (v8 == 2)
      {
        id v25 = v9;
        uint64_t v10 = [v3 statusOfValueForKey:@"metadata" error:&v25];
        id v7 = v25;

        if (v10 == 2)
        {
          if (v3) {
            [v3 duration];
          }
          else {
            memset(&duration, 0, sizeof(duration));
          }
          CMTime start = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
          CMTimeRangeMake(&v24, &start, &duration);
          [(PFAVReaderWriter *)self setTimeRange:&v24];
          uint64_t v11 = [MEMORY[0x1E4F28CB8] defaultManager];
          CVImageBufferRef v12 = [v4 path];
          if (([v11 fileExistsAtPath:v12] & 1) == 0)
          {

LABEL_16:
            uint64_t v15 = v7;
            id v20 = v7;
            BOOL v16 = [(PFAVReaderWriter *)self setUpReaderAndWriterReturningError:&v20];
            id v7 = v20;

            if (v16)
            {
              id v19 = v7;
              BOOL v17 = [(PFAVReaderWriter *)self startReadingAndWritingReturningError:&v19];
              id v18 = v19;

              id v7 = v18;
              if (v17) {
                goto LABEL_9;
              }
            }
            goto LABEL_8;
          }
          id v21 = v7;
          int v13 = [v11 removeItemAtPath:v12 error:&v21];
          id v14 = v21;

          id v7 = v14;
          if (v13) {
            goto LABEL_16;
          }
        }
      }
      else
      {
        id v7 = v9;
      }
    }
LABEL_8:
    [(PFAVReaderWriter *)self readingAndWritingDidFinishSuccessfully:0 withError:v7];
LABEL_9:
  }
}

- (void)writeToURL:(id)a3 progress:(id)a4 completion:(id)a5
{
  v36[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v29 = 0;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x2020000000;
  char v32 = 0;
  isolationQueue = self->_isolationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__PFAVReaderWriter_writeToURL_progress_completion___block_invoke;
  block[3] = &unk_1E5B2F690;
  block[4] = self;
  void block[5] = &v29;
  dispatch_sync(isolationQueue, block);
  if (*((unsigned char *)v30 + 24))
  {
    if (v8 && ([v8 isFileURL] & 1) != 0)
    {
      CVImageBufferRef v12 = self->_isolationQueue;
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __51__PFAVReaderWriter_writeToURL_progress_completion___block_invoke_2;
      v27[3] = &unk_1E5B2F5F0;
      v27[4] = self;
      dispatch_sync(v12, v27);
      [(PFAVReaderWriter *)self setOutputURL:v8];
      int v13 = [(PFAVReaderWriter *)self asset];
      id v14 = (void *)[v10 copy];
      id completionBlock = self->_completionBlock;
      self->_id completionBlock = v14;

      BOOL v16 = (void *)[v9 copy];
      id progressBlock = self->_progressBlock;
      self->_id progressBlock = v16;

      objc_initWeak(&location, self);
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __51__PFAVReaderWriter_writeToURL_progress_completion___block_invoke_3;
      v24[3] = &unk_1E5B2F090;
      v24[4] = self;
      objc_copyWeak(&v25, &location);
      [v13 loadValuesAsynchronouslyForKeys:&unk_1EF7CACD0 completionHandler:v24];
      objc_destroyWeak(&v25);
      objc_destroyWeak(&location);
    }
    else if (v10)
    {
      id v18 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v33 = *MEMORY[0x1E4F28568];
      double v34 = @"PFAVReaderWriter: output file URL must be provided";
      id v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v34 forKeys:&v33 count:1];
      id v20 = [v18 errorWithDomain:@"PFAVReaderWriterErrorDomain" code:2 userInfo:v19];

      (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v20);
    }
  }
  else if (v10)
  {
    id v21 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v35 = *MEMORY[0x1E4F28568];
    v36[0] = @"PFAVReaderWriter: multiple simultaneous writes not supported";
    v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:&v35 count:1];
    uint64_t v23 = [v21 errorWithDomain:@"PFAVReaderWriterErrorDomain" code:1 userInfo:v22];

    (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v23);
  }
  _Block_object_dispose(&v29, 8);
}

uint64_t __51__PFAVReaderWriter_writeToURL_progress_completion___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 80) ^ 1;
  return result;
}

uint64_t __51__PFAVReaderWriter_writeToURL_progress_completion___block_invoke_2(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 80) = 1;
  return result;
}

void __51__PFAVReaderWriter_writeToURL_progress_completion___block_invoke_3(uint64_t a1)
{
  v1 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__PFAVReaderWriter_writeToURL_progress_completion___block_invoke_4;
  block[3] = &unk_1E5B2DF48;
  objc_copyWeak(&v3, (id *)(a1 + 40));
  dispatch_async(v1, block);
  objc_destroyWeak(&v3);
}

void __51__PFAVReaderWriter_writeToURL_progress_completion___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _didLoadAVAssetValues];
}

- (PFAVReaderWriter)initWithAsset:(id)a3 stillImageTime:(id *)a4
{
  id v6 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PFAVReaderWriter;
  id v7 = [(PFAVReaderWriter *)&v16 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    id v9 = (void *)*((void *)v7 + 15);
    *((void *)v7 + 15) = v8;

    long long v10 = *(_OWORD *)&a4->var0;
    *(void *)(v7 + 100) = a4->var3;
    *(_OWORD *)(v7 + 84) = v10;
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.PFAVReaderWriter.serializationQueue", 0);
    CVImageBufferRef v12 = (void *)*((void *)v7 + 1);
    *((void *)v7 + 1) = v11;

    dispatch_queue_t v13 = dispatch_queue_create("com.apple.PFAVReaderWriter.isolationQueue", 0);
    id v14 = (void *)*((void *)v7 + 2);
    *((void *)v7 + 2) = v13;
  }
  return (PFAVReaderWriter *)v7;
}

- (PFAVReaderWriter)initWithAsset:(id)a3
{
  long long v4 = *MEMORY[0x1E4F1F9F8];
  uint64_t v5 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
  return [(PFAVReaderWriter *)self initWithAsset:0 stillImageTime:&v4];
}

- (PFAVReaderWriter)init
{
  return [(PFAVReaderWriter *)self initWithAsset:0];
}

@end