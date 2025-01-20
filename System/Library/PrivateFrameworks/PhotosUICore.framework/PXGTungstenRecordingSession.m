@interface PXGTungstenRecordingSession
- (BOOL)isStopped;
- (NSOutputStream)outputStream;
- (NSURL)recordingURL;
- (OS_dispatch_queue)outputQueue;
- (PXGTungstenRecordingFrameState)frameState;
- (PXGTungstenRecordingSerializer)serializer;
- (PXGTungstenRecordingSession)initWithSerializer:(id)a3 directoryURL:(id)a4;
- (int64_t)frameNumber;
- (void)dealloc;
- (void)recordEvent:(id)a3;
- (void)setOutputQueue:(id)a3;
- (void)setOutputStream:(id)a3;
- (void)setSerializer:(id)a3;
- (void)startNextFrame;
- (void)stop;
@end

@implementation PXGTungstenRecordingSession

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputQueue, 0);
  objc_storeStrong((id *)&self->_outputStream, 0);
  objc_storeStrong((id *)&self->_serializer, 0);
  objc_storeStrong((id *)&self->_recordingURL, 0);
  objc_storeStrong((id *)&self->_frameState, 0);
}

- (void)setOutputQueue:(id)a3
{
}

- (OS_dispatch_queue)outputQueue
{
  return self->_outputQueue;
}

- (void)setOutputStream:(id)a3
{
}

- (NSOutputStream)outputStream
{
  return self->_outputStream;
}

- (void)setSerializer:(id)a3
{
}

- (PXGTungstenRecordingSerializer)serializer
{
  return self->_serializer;
}

- (int64_t)frameNumber
{
  return self->_frameNumber;
}

- (NSURL)recordingURL
{
  return self->_recordingURL;
}

- (PXGTungstenRecordingFrameState)frameState
{
  return self->_frameState;
}

- (void)startNextFrame
{
  ++self->_frameNumber;
  v3 = objc_alloc_init(PXGTungstenRecordingFrameState);
  frameState = self->_frameState;
  self->_frameState = v3;
}

- (BOOL)isStopped
{
  return self->_outputStream == 0;
}

- (void)stop
{
  if ([(PXGTungstenRecordingSession *)self isStopped]) {
    PXAssertGetLog();
  }
  outputQueue = self->_outputQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__PXGTungstenRecordingSession_stop__block_invoke;
  block[3] = &unk_1E5DD36F8;
  block[4] = self;
  dispatch_sync(outputQueue, block);
  [(NSOutputStream *)self->_outputStream close];
  serializer = self->_serializer;
  self->_serializer = 0;

  outputStream = self->_outputStream;
  self->_outputStream = 0;

  v6 = self->_outputQueue;
  self->_outputQueue = 0;
}

void __35__PXGTungstenRecordingSession_stop__block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) serializer];
  v2 = [*(id *)(a1 + 32) outputStream];
  [v3 recordingSessionWillEndToStream:v2];
}

- (void)recordEvent:(id)a3
{
  id v4 = a3;
  v5 = [(PXGTungstenRecordingSession *)self outputQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __43__PXGTungstenRecordingSession_recordEvent___block_invoke;
  v7[3] = &unk_1E5DD32A8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __43__PXGTungstenRecordingSession_recordEvent___block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) serializer];
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = [*(id *)(a1 + 32) outputStream];
  [v4 serializeEvent:v2 toStream:v3];
}

- (void)dealloc
{
  if (![(PXGTungstenRecordingSession *)self isStopped]) {
    [(PXGTungstenRecordingSession *)self stop];
  }
  v3.receiver = self;
  v3.super_class = (Class)PXGTungstenRecordingSession;
  [(PXGTungstenRecordingSession *)&v3 dealloc];
}

- (PXGTungstenRecordingSession)initWithSerializer:(id)a3 directoryURL:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v30.receiver = self;
  v30.super_class = (Class)PXGTungstenRecordingSession;
  v9 = [(PXGTungstenRecordingSession *)&v30 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_serializer, a3);
    v11 = [MEMORY[0x1E4F1C9C8] date];
    id v12 = objc_alloc_init(MEMORY[0x1E4F28C10]);
    [v12 setDateFormat:@"YYYY.MM.dd_HH-mm-ss-SSSS"];
    v13 = [v12 stringFromDate:v11];
    v14 = [NSString stringWithFormat:@"TungstenRecording_%@.json", v13];
    uint64_t v15 = [v8 URLByAppendingPathComponent:v14];
    recordingURL = v10->_recordingURL;
    v10->_recordingURL = (NSURL *)v15;

    v17 = (void *)MEMORY[0x1E4F1CAA8];
    v18 = [(PXGTungstenRecordingSession *)v10 recordingURL];
    uint64_t v19 = [v17 outputStreamWithURL:v18 append:0];
    outputStream = v10->_outputStream;
    v10->_outputStream = (NSOutputStream *)v19;

    v21 = [(PXGTungstenRecordingSession *)v10 outputStream];
    [v21 open];

    v22 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v23 = dispatch_queue_attr_make_with_qos_class(v22, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v24 = dispatch_queue_create("com.apple.photos.tungsten-recording", v23);
    outputQueue = v10->_outputQueue;
    v10->_outputQueue = (OS_dispatch_queue *)v24;

    v26 = [(PXGTungstenRecordingSession *)v10 outputQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __63__PXGTungstenRecordingSession_initWithSerializer_directoryURL___block_invoke;
    block[3] = &unk_1E5DD36F8;
    v29 = v10;
    dispatch_async(v26, block);
  }
  return v10;
}

void __63__PXGTungstenRecordingSession_initWithSerializer_directoryURL___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) serializer];
  uint64_t v2 = [*(id *)(a1 + 32) outputStream];
  [v3 recordingSessionWillStartToStream:v2];
}

@end