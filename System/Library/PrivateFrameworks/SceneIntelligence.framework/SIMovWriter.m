@interface SIMovWriter
- (id)initWriterWithVideoURL:(id)a3 frameSize:(CGSize)a4;
- (void)dealloc;
- (void)finishRecording;
- (void)startRecording;
- (void)writeFrame:(__CVBuffer *)a3 andTime:(id *)a4;
@end

@implementation SIMovWriter

- (id)initWriterWithVideoURL:(id)a3 frameSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v7 = a3;
  v30.receiver = self;
  v30.super_class = (Class)SIMovWriter;
  v8 = [(SIMovWriter *)&v30 init];
  if (!v8)
  {
LABEL_6:
    v26 = v8;
    goto LABEL_10;
  }
  id v9 = objc_alloc(MEMORY[0x263EFA518]);
  uint64_t v10 = *MEMORY[0x263EF9898];
  id v29 = 0;
  uint64_t v11 = [v9 initWithURL:v7 fileType:v10 error:&v29];
  id v12 = v29;
  writer = v8->_writer;
  v8->_writer = (AVAssetWriter *)v11;

  if (v8->_writer)
  {
    v14 = NSDictionary;
    uint64_t v15 = *MEMORY[0x263EFA368];
    uint64_t v16 = *MEMORY[0x263EFA338];
    v17 = [NSNumber numberWithInt:(int)width];
    uint64_t v18 = *MEMORY[0x263EFA458];
    v19 = [NSNumber numberWithInt:(int)height];
    v20 = objc_msgSend(v14, "dictionaryWithObjectsAndKeys:", v15, v16, v17, v18, v19, *MEMORY[0x263EFA3E8], 0);

    uint64_t v21 = [MEMORY[0x263EFA520] assetWriterInputWithMediaType:*MEMORY[0x263EF9D48] outputSettings:v20];
    writerInput = v8->_writerInput;
    v8->_writerInput = (AVAssetWriterInput *)v21;

    uint64_t v23 = [MEMORY[0x263EFA530] assetWriterInputPixelBufferAdaptorWithAssetWriterInput:v8->_writerInput sourcePixelBufferAttributes:0];
    inputAdaptor = v8->_inputAdaptor;
    v8->_inputAdaptor = (AVAssetWriterInputPixelBufferAdaptor *)v23;

    [(SIMovWriter *)v8 startRecording];
    v25 = __SceneIntelligenceLogSharedInstance();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136380931;
      v32 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIMovWriter.m";
      __int16 v33 = 1025;
      int v34 = 48;
      _os_log_impl(&dword_21B697000, v25, OS_LOG_TYPE_DEFAULT, " %{private}s:%{private}d *** start recording ***", buf, 0x12u);
    }

    goto LABEL_6;
  }
  v27 = __SceneIntelligenceLogSharedInstance();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136381187;
    v32 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIMovWriter.m";
    __int16 v33 = 1025;
    int v34 = 34;
    __int16 v35 = 2113;
    id v36 = v12;
    _os_log_impl(&dword_21B697000, v27, OS_LOG_TYPE_DEFAULT, " %{private}s:%{private}d *** Couldn't instantiate a AVAssetWriter with error %{private}@ ***", buf, 0x1Cu);
  }

  v26 = 0;
LABEL_10:

  return v26;
}

- (void)writeFrame:(__CVBuffer *)a3 andTime:(id *)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if ([(AVAssetWriterInput *)self->_writerInput isReadyForMoreMediaData])
  {
    inputAdaptor = self->_inputAdaptor;
    *(_OWORD *)uint64_t v16 = *(_OWORD *)&a4->var0;
    *(void *)&v16[16] = a4->var3;
    if (![(AVAssetWriterInputPixelBufferAdaptor *)inputAdaptor appendPixelBuffer:a3 withPresentationTime:v16])
    {
      v8 = __SceneIntelligenceLogSharedInstance();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        id v9 = [(AVAssetWriter *)self->_writer error];
        uint64_t v10 = [v9 code];
        uint64_t v11 = [(AVAssetWriter *)self->_writer error];
        id v12 = [v11 localizedDescription];
        uint64_t v13 = [v12 UTF8String];
        *(_DWORD *)uint64_t v16 = 136381443;
        *(void *)&v16[4] = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIMovWriter.m";
        *(_WORD *)&v16[12] = 1025;
        *(_DWORD *)&v16[14] = 59;
        *(_WORD *)&v16[18] = 2048;
        *(void *)&v16[20] = v10;
        __int16 v17 = 2081;
        uint64_t v18 = v13;
        _os_log_impl(&dword_21B697000, v8, OS_LOG_TYPE_DEFAULT, " %{private}s:%{private}d *** assetWriter.error %ld %{private}s \n ***", v16, 0x26u);
      }
      v14 = __SceneIntelligenceLogSharedInstance();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = [(AVAssetWriter *)self->_writer status];
        *(_DWORD *)uint64_t v16 = 136381187;
        *(void *)&v16[4] = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIMovWriter.m";
        *(_WORD *)&v16[12] = 1025;
        *(_DWORD *)&v16[14] = 60;
        *(_WORD *)&v16[18] = 1024;
        *(_DWORD *)&v16[20] = v15;
        _os_log_impl(&dword_21B697000, v14, OS_LOG_TYPE_DEFAULT, " %{private}s:%{private}d *** assetWriter.status = %u\n ***", v16, 0x18u);
      }
    }
  }
}

- (void)dealloc
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  [(SIMovWriter *)self finishRecording];
  v3 = __SceneIntelligenceLogSharedInstance();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136380931;
    v6 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIMovWriter.m";
    __int16 v7 = 1025;
    int v8 = 67;
    _os_log_impl(&dword_21B697000, v3, OS_LOG_TYPE_DEFAULT, " %{private}s:%{private}d *** finish recording ***", buf, 0x12u);
  }

  v4.receiver = self;
  v4.super_class = (Class)SIMovWriter;
  [(SIMovWriter *)&v4 dealloc];
}

- (void)startRecording
{
  [(AVAssetWriter *)self->_writer addInput:self->_writerInput];
  [(AVAssetWriter *)self->_writer startWriting];
  writer = self->_writer;
  long long v4 = *MEMORY[0x263F010E0];
  uint64_t v5 = *(void *)(MEMORY[0x263F010E0] + 16);
  [(AVAssetWriter *)writer startSessionAtSourceTime:&v4];
}

- (void)finishRecording
{
  [(AVAssetWriterInput *)self->_writerInput markAsFinished];
  writer = self->_writer;
  [(AVAssetWriter *)writer finishWritingWithCompletionHandler:&__block_literal_global];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputAdaptor, 0);
  objc_storeStrong((id *)&self->_writerInput, 0);
  objc_storeStrong((id *)&self->_writer, 0);
  objc_storeStrong((id *)&self->_trackName, 0);
}

@end