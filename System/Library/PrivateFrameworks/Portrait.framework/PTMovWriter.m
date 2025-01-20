@interface PTMovWriter
- (NSURL)fileURL;
- (PTMovWriter)initWithURL:(id)a3 settings:(id)a4;
- (void)addFrame:(__CVBuffer *)a3;
- (void)addFrame:(__CVBuffer *)a3 time:(id *)a4;
- (void)finalize;
- (void)setFileURL:(id)a3;
@end

@implementation PTMovWriter

- (PTMovWriter)initWithURL:(id)a3 settings:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v29.receiver = self;
  v29.super_class = (Class)PTMovWriter;
  v8 = [(PTMovWriter *)&v29 init];
  v9 = v8;
  if (v8)
  {
    [(PTMovWriter *)v8 setFileURL:v6];
    v10 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v10 removeItemAtURL:v6 error:0];

    v9->_frameNo = 0;
    v11 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F16268]];
    v12 = [v11 objectForKeyedSubscript:*MEMORY[0x1E4F16278]];

    if (v12)
    {
      [v12 floatValue];
      v9->_framesPerSecond = v13;
    }
    uint64_t v14 = [MEMORY[0x1E4F163C0] assetWriterInputWithMediaType:*MEMORY[0x1E4F15C18] outputSettings:v7];
    writerInput = v9->_writerInput;
    v9->_writerInput = (AVAssetWriterInput *)v14;

    [(AVAssetWriterInput *)v9->_writerInput setExpectsMediaDataInRealTime:0];
    v16 = v9->_writerInput;
    long long v17 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    v28[0] = *MEMORY[0x1E4F1DAB8];
    v28[1] = v17;
    v28[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    [(AVAssetWriterInput *)v16 setTransform:v28];
    uint64_t v18 = [MEMORY[0x1E4F163D8] assetWriterInputPixelBufferAdaptorWithAssetWriterInput:v9->_writerInput sourcePixelBufferAttributes:0];
    pbAdaptor = v9->_pbAdaptor;
    v9->_pbAdaptor = (AVAssetWriterInputPixelBufferAdaptor *)v18;

    uint64_t v20 = [MEMORY[0x1E4F163B8] assetWriterWithURL:v6 fileType:*MEMORY[0x1E4F15AB0] error:0];
    writer = v9->_writer;
    v9->_writer = (AVAssetWriter *)v20;

    [(AVAssetWriter *)v9->_writer addInput:v9->_writerInput];
    BOOL v22 = [(AVAssetWriter *)v9->_writer startWriting];
    v23 = v9->_writer;
    long long v26 = *MEMORY[0x1E4F1FA48];
    uint64_t v27 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
    [(AVAssetWriter *)v23 startSessionAtSourceTime:&v26];
    if (!v22)
    {
      switch([(AVAssetWriter *)v9->_writer status])
      {
        case AVAssetWriterStatusUnknown:
          NSLog(&cfstr_ExportUnknow.isa);
          goto LABEL_9;
        case AVAssetWriterStatusWriting:
          NSLog(&cfstr_ExportWriting.isa);
          goto LABEL_9;
        case AVAssetWriterStatusCompleted:
          NSLog(&cfstr_ExportComplete.isa);
          break;
        case AVAssetWriterStatusFailed:
        case AVAssetWriterStatusCancelled:
          NSLog(&cfstr_ExportFailed.isa);
LABEL_9:
          v24 = [(AVAssetWriter *)v9->_writer error];
          NSLog(&cfstr_Exportsessione.isa, v24);

          break;
        default:
          break;
      }
    }
  }
  return v9;
}

- (void)addFrame:(__CVBuffer *)a3
{
  CMTimeMake(&v5, self->_frameNo, (int)self->_framesPerSecond);
  [(PTMovWriter *)self addFrame:a3 time:&v5];
}

- (void)addFrame:(__CVBuffer *)a3 time:(id *)a4
{
  if (![(AVAssetWriterInput *)self->_writerInput isReadyForMoreMediaData])
  {
    do
      usleep(0x3E8u);
    while (![(AVAssetWriterInput *)self->_writerInput isReadyForMoreMediaData]);
  }
  if ([(AVAssetWriterInput *)self->_writerInput isReadyForMoreMediaData])
  {
    pbAdaptor = self->_pbAdaptor;
    long long v12 = *(_OWORD *)&a4->var0;
    int64_t var3 = a4->var3;
    if (![(AVAssetWriterInputPixelBufferAdaptor *)pbAdaptor appendPixelBuffer:a3 withPresentationTime:&v12])
    {
      AVAssetWriterStatus v8 = [(AVAssetWriter *)self->_writer status];
      v9 = [(AVAssetWriter *)self->_writer error];
      NSLog(&cfstr_ErrorLd.isa, v8, v9);
    }
    uint64_t v10 = (self->_frameNo + 1);
    self->_frameNo = v10;
    HIDWORD(v11) = -858993459 * v10 + 429496728;
    LODWORD(v11) = HIDWORD(v11);
    if ((v11 >> 1) <= 0x19999998) {
      NSLog(&cfstr_FramesWrittenD.isa, v10);
    }
  }
  else
  {
    NSLog(&cfstr_ErrorDroppedFr.isa);
  }
}

- (void)finalize
{
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  if (self->_frameNo >= 1)
  {
    [(AVAssetWriterInput *)self->_writerInput markAsFinished];
    writer = self->_writer;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __23__PTMovWriter_finalize__block_invoke;
    v7[3] = &unk_1E6884200;
    CMTime v5 = v3;
    AVAssetWriterStatus v8 = v5;
    [(AVAssetWriter *)writer finishWritingWithCompletionHandler:v7];
    dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  }
  if ([(AVAssetWriter *)self->_writer status] == AVAssetWriterStatusFailed)
  {
    id v6 = [(AVAssetWriter *)self->_writer error];
    NSLog(&cfstr_Error.isa, v6);
  }
}

intptr_t __23__PTMovWriter_finalize__block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (void)setFileURL:(id)a3
{
  self->_fileURL = (NSURL *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pbAdaptor, 0);
  objc_storeStrong((id *)&self->_writer, 0);

  objc_storeStrong((id *)&self->_writerInput, 0);
}

@end