@interface PFRWSampleBufferChannel
- (AVAssetReaderOutput)assetReaderOutput;
- (AVAssetWriterInput)assetWriterInput;
- (AVAssetWriterInputPixelBufferAdaptor)adaptor;
- (BOOL)finished;
- (BOOL)useAdaptor;
- (PFRWSampleBufferChannel)init;
- (PFRWSampleBufferChannel)initWithAssetReaderOutput:(id)a3 assetWriterInput:(id)a4 useAdaptor:(BOOL)a5;
- (void)callCompletionHandlerIfNecessary;
- (void)cancel;
- (void)setAdaptor:(id)a3;
- (void)setAssetReaderOutput:(id)a3;
- (void)setAssetWriterInput:(id)a3;
- (void)setFinished:(BOOL)a3;
- (void)setUseAdaptor:(BOOL)a3;
- (void)startWithDelegate:(id)a3 completionHandler:(id)a4;
@end

@implementation PFRWSampleBufferChannel

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_adaptor, 0);
  objc_storeStrong((id *)&self->_assetReaderOutput, 0);
  objc_storeStrong((id *)&self->_assetWriterInput, 0);
  objc_storeStrong((id *)&self->serializationQueue, 0);

  objc_storeStrong(&self->completionHandler, 0);
}

- (void)setAdaptor:(id)a3
{
}

- (AVAssetWriterInputPixelBufferAdaptor)adaptor
{
  return self->_adaptor;
}

- (void)setAssetReaderOutput:(id)a3
{
}

- (AVAssetReaderOutput)assetReaderOutput
{
  return self->_assetReaderOutput;
}

- (void)setAssetWriterInput:(id)a3
{
}

- (AVAssetWriterInput)assetWriterInput
{
  return self->_assetWriterInput;
}

- (void)setFinished:(BOOL)a3
{
  self->_finished = a3;
}

- (BOOL)finished
{
  return self->_finished;
}

- (void)setUseAdaptor:(BOOL)a3
{
  self->_useAdaptor = a3;
}

- (BOOL)useAdaptor
{
  return self->_useAdaptor;
}

- (void)cancel
{
  serializationQueue = self->serializationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__PFRWSampleBufferChannel_cancel__block_invoke;
  block[3] = &unk_1E5B2F5F0;
  block[4] = self;
  dispatch_async(serializationQueue, block);
}

uint64_t __33__PFRWSampleBufferChannel_cancel__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) callCompletionHandlerIfNecessary];
}

- (void)startWithDelegate:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  v7 = (void *)[a4 copy];
  id completionHandler = self->completionHandler;
  self->id completionHandler = v7;

  v9 = [(PFRWSampleBufferChannel *)self assetWriterInput];
  serializationQueue = self->serializationQueue;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __63__PFRWSampleBufferChannel_startWithDelegate_completionHandler___block_invoke;
  v12[3] = &unk_1E5B2F668;
  v12[4] = self;
  id v13 = v6;
  id v11 = v6;
  [v9 requestMediaDataWhenReadyOnQueue:serializationQueue usingBlock:v12];
}

void __63__PFRWSampleBufferChannel_startWithDelegate_completionHandler___block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) finished] & 1) == 0)
  {
    v2 = [*(id *)(a1 + 32) assetWriterInput];
    int v3 = [v2 isReadyForMoreMediaData];

    if (v3)
    {
      do
      {
        v4 = (void *)MEMORY[0x1A6259880]();
        v5 = [*(id *)(a1 + 32) assetReaderOutput];
        id v6 = (opaqueCMSampleBuffer *)[v5 copyNextSampleBuffer];

        if (v6)
        {
          uint64_t v7 = [*(id *)(a1 + 32) adaptor];
          if (v7 && (v8 = (void *)v7, char v9 = objc_opt_respondsToSelector(), v8, (v9 & 1) != 0))
          {
            CVPixelBufferRef pixelBufferOut = 0;
            v10 = [*(id *)(a1 + 32) adaptor];
            id v11 = (__CVPixelBufferPool *)[v10 pixelBufferPool];

            CVPixelBufferPoolCreatePixelBuffer(0, v11, &pixelBufferOut);
            memset(&v19, 0, sizeof(v19));
            CMSampleBufferGetPresentationTimeStamp(&v19, v6);
            [*(id *)(a1 + 40) sampleBufferChannel:*(void *)(a1 + 32) didReadSampleBuffer:v6 andMadeWriteSampleBuffer:pixelBufferOut];
            v12 = [*(id *)(a1 + 32) adaptor];
            CMTime v18 = v19;
            int v13 = [v12 appendPixelBuffer:pixelBufferOut withPresentationTime:&v18];

            CFRelease(pixelBufferOut);
          }
          else
          {
            if (objc_opt_respondsToSelector()) {
              [*(id *)(a1 + 40) sampleBufferChannel:*(void *)(a1 + 32) didReadSampleBuffer:v6];
            }
            v14 = [*(id *)(a1 + 32) assetWriterInput];
            int v13 = [v14 appendSampleBuffer:v6];
          }
          CFRelease(v6);
          int v15 = v13 ^ 1;
        }
        else
        {
          int v15 = 1;
        }
        v16 = [*(id *)(a1 + 32) assetWriterInput];
        int v17 = [v16 isReadyForMoreMediaData];
      }
      while (v17 && !v15);
      if (v15) {
        [*(id *)(a1 + 32) callCompletionHandlerIfNecessary];
      }
    }
  }
}

- (void)callCompletionHandlerIfNecessary
{
  BOOL v3 = [(PFRWSampleBufferChannel *)self finished];
  [(PFRWSampleBufferChannel *)self setFinished:1];
  if (!v3)
  {
    v4 = [(PFRWSampleBufferChannel *)self assetWriterInput];
    [v4 markAsFinished];

    uint64_t v7 = MEMORY[0x1A6259AE0](self->completionHandler);
    id completionHandler = self->completionHandler;
    self->id completionHandler = 0;

    id v6 = (void *)v7;
    if (v7)
    {
      (*(void (**)(uint64_t))(v7 + 16))(v7);
      id v6 = (void *)v7;
    }
  }
}

- (PFRWSampleBufferChannel)initWithAssetReaderOutput:(id)a3 assetWriterInput:(id)a4 useAdaptor:(BOOL)a5
{
  BOOL v5 = a5;
  v21[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  v19.receiver = self;
  v19.super_class = (Class)PFRWSampleBufferChannel;
  id v11 = [(PFRWSampleBufferChannel *)&v19 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_assetReaderOutput, a3);
    objc_storeStrong((id *)&v12->_assetWriterInput, a4);
    v12->_finished = 0;
    v12->_useAdaptor = v5;
    if (v5)
    {
      uint64_t v20 = *MEMORY[0x1E4F24D70];
      v21[0] = &unk_1EF7CA3D0;
      int v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
      uint64_t v14 = [MEMORY[0x1E4F163D8] assetWriterInputPixelBufferAdaptorWithAssetWriterInput:v10 sourcePixelBufferAttributes:v13];
      adaptor = v12->_adaptor;
      v12->_adaptor = (AVAssetWriterInputPixelBufferAdaptor *)v14;
    }
    dispatch_queue_t v16 = dispatch_queue_create("com.apple.PFRWSampleBufferChannel.serializationQueue", 0);
    serializationQueue = v12->serializationQueue;
    v12->serializationQueue = (OS_dispatch_queue *)v16;
  }
  return v12;
}

- (PFRWSampleBufferChannel)init
{
  return [(PFRWSampleBufferChannel *)self initWithAssetReaderOutput:0 assetWriterInput:0 useAdaptor:0];
}

@end