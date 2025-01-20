@interface OspreyGRPCStreamingContext
- (BOOL)isCompressionEnabled;
- (OspreyGRPCStreamingContext)initWithQueue:(id)a3 responseHandler:(id)a4 completion:(id)a5;
- (void)_writeFrame:(id)a3 compressed:(BOOL)a4 error:(id *)a5;
- (void)bindToUrlRequest:(id)a3;
- (void)completeWithError:(id)a3;
- (void)finishWriting;
- (void)handleResponseData:(id)a3;
- (void)setCompressionEnabled:(BOOL)a3;
- (void)writeFrame:(id)a3;
- (void)writeFrame:(id)a3 compressed:(BOOL)a4;
@end

@implementation OspreyGRPCStreamingContext

- (OspreyGRPCStreamingContext)initWithQueue:(id)a3 responseHandler:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v33.receiver = self;
  v33.super_class = (Class)OspreyGRPCStreamingContext;
  v12 = [(OspreyGRPCStreamingContext *)&v33 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_queue, a3);
    uint64_t v14 = MEMORY[0x1C189D2A0](v11);
    id completion = v13->_completion;
    v13->_id completion = (id)v14;

    v16 = [[OspreyMessageReader alloc] initWithMessageHandler:v10];
    messageReader = v13->_messageReader;
    v13->_messageReader = v16;

    v18 = objc_alloc_init(OspreyMessageWriter);
    messageWriter = v13->_messageWriter;
    v13->_messageWriter = v18;

    id v31 = 0;
    id v32 = 0;
    [MEMORY[0x1E4F1CA10] getBoundStreamsWithBufferSize:2048 inputStream:&v32 outputStream:&v31];
    v20 = (NSInputStream *)v32;
    id v21 = v31;
    inputStream = v13->_inputStream;
    v13->_inputStream = v20;
    v23 = v20;

    queue = v13->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __71__OspreyGRPCStreamingContext_initWithQueue_responseHandler_completion___block_invoke;
    block[3] = &unk_1E63CB9A8;
    v28 = v13;
    id v29 = v21;
    id v30 = v9;
    id v25 = v21;
    dispatch_async(queue, block);
  }
  return v13;
}

uint64_t __71__OspreyGRPCStreamingContext_initWithQueue_responseHandler_completion___block_invoke(void *a1)
{
  v2 = [[OspreyBufferedOutputStream alloc] initWithBufferSize:0x2000 underlyingOutputStream:a1[5] queue:a1[6]];
  uint64_t v3 = a1[4];
  v4 = *(void **)(v3 + 48);
  *(void *)(v3 + 48) = v2;

  v5 = (void *)a1[5];

  return [v5 open];
}

- (void)writeFrame:(id)a3
{
}

- (void)writeFrame:(id)a3 compressed:(BOOL)a4
{
}

- (void)finishWriting
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__OspreyGRPCStreamingContext_finishWriting__block_invoke;
  block[3] = &unk_1E63CB9D0;
  void block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __43__OspreyGRPCStreamingContext_finishWriting__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 48) close];
}

- (void)bindToUrlRequest:(id)a3
{
  if (!self->_closed) {
    [a3 setHTTPBodyStream:self->_inputStream];
  }
}

- (void)completeWithError:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    OspreyLoggingInit();
    v5 = (void *)OspreyLogContextGRPC;
    if (os_log_type_enabled((os_log_t)OspreyLogContextGRPC, OS_LOG_TYPE_DEBUG)) {
      -[OspreyGRPCStreamingContext completeWithError:](v5, v4);
    }
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  inputStream = self->_inputStream;
  self->_inputStream = 0;

  [(OspreyBufferedOutputStream *)self->_outputStream close];
  outputStream = self->_outputStream;
  self->_outputStream = 0;

  messageReader = self->_messageReader;
  self->_messageReader = 0;

  messageWriter = self->_messageWriter;
  self->_messageWriter = 0;

  self->_closed = 1;
  id completion = (void (**)(id, id))self->_completion;
  if (completion)
  {
    completion[2](completion, v4);
    id v11 = self->_completion;
    self->_id completion = 0;
  }
}

- (void)handleResponseData:(id)a3
{
  id v4 = a3;
  messageReader = self->_messageReader;
  OspreyLoggingInit();
  v6 = OspreyLogContextGRPC;
  if (messageReader)
  {
    if (os_log_type_enabled((os_log_t)OspreyLogContextGRPC, OS_LOG_TYPE_DEBUG)) {
      -[OspreyGRPCStreamingContext handleResponseData:]();
    }
    dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
    [(OspreyMessageReader *)self->_messageReader readData:v4];
  }
  else if (os_log_type_enabled((os_log_t)OspreyLogContextGRPC, OS_LOG_TYPE_ERROR))
  {
    -[OspreyGRPCStreamingContext handleResponseData:](v6, v7, v8, v9, v10, v11, v12, v13);
  }
}

- (void)_writeFrame:(id)a3 compressed:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  if (self->_closed)
  {
    OspreyLoggingInit();
    uint64_t v9 = OspreyLogContextGRPC;
    if (os_log_type_enabled((os_log_t)OspreyLogContextGRPC, OS_LOG_TYPE_ERROR)) {
      -[OspreyGRPCStreamingContext _writeFrame:compressed:error:](v9, v10, v11, v12, v13, v14, v15, v16);
    }
  }
  else
  {
    if (!self->_compressionEnabled && v6)
    {
      OspreyLoggingInit();
      v18 = OspreyLogContextGRPC;
      if (os_log_type_enabled((os_log_t)OspreyLogContextGRPC, OS_LOG_TYPE_ERROR)) {
        -[OspreyGRPCStreamingContext _writeFrame:compressed:error:](v18, v19, v20, v21, v22, v23, v24, v25);
      }
      LOBYTE(v6) = 0;
    }
    queue = self->_queue;
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __59__OspreyGRPCStreamingContext__writeFrame_compressed_error___block_invoke;
    v27[3] = &unk_1E63CB9F8;
    id v28 = v8;
    id v29 = self;
    BOOL v31 = v6;
    id v30 = a5;
    dispatch_async(queue, v27);
  }
}

uint64_t __59__OspreyGRPCStreamingContext__writeFrame_compressed_error___block_invoke(uint64_t a1)
{
  OspreyLoggingInit();
  v2 = (void *)OspreyLogContextGRPC;
  if (os_log_type_enabled((os_log_t)OspreyLogContextGRPC, OS_LOG_TYPE_DEBUG)) {
    __59__OspreyGRPCStreamingContext__writeFrame_compressed_error___block_invoke_cold_1(a1, v2);
  }
  return [*(id *)(*(void *)(a1 + 40) + 32) writeMessageData:*(void *)(a1 + 32) toStream:*(void *)(*(void *)(a1 + 40) + 48) compressionEnabled:*(unsigned __int8 *)(a1 + 56) error:*(void *)(a1 + 48)];
}

- (BOOL)isCompressionEnabled
{
  return self->_compressionEnabled;
}

- (void)setCompressionEnabled:(BOOL)a3
{
  self->_compressionEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputStream, 0);
  objc_storeStrong((id *)&self->_inputStream, 0);
  objc_storeStrong((id *)&self->_messageWriter, 0);
  objc_storeStrong((id *)&self->_messageReader, 0);
  objc_storeStrong(&self->_completion, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)completeWithError:(void *)a1 .cold.1(void *a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a1;
  id v4 = [a2 localizedDescription];
  v5[0] = 136315394;
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_1BEDB4000, v3, OS_LOG_TYPE_DEBUG, "%s Completed with error: %@", (uint8_t *)v5, 0x16u);
}

- (void)handleResponseData:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)handleResponseData:.cold.2()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 136315650;
  OUTLINED_FUNCTION_1();
  __int16 v4 = v0;
  uint64_t v5 = v1;
  _os_log_debug_impl(&dword_1BEDB4000, v2, OS_LOG_TYPE_DEBUG, "%s %@ handling %@", (uint8_t *)v3, 0x20u);
}

- (void)_writeFrame:(uint64_t)a3 compressed:(uint64_t)a4 error:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_writeFrame:(uint64_t)a3 compressed:(uint64_t)a4 error:(uint64_t)a5 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __59__OspreyGRPCStreamingContext__writeFrame_compressed_error___block_invoke_cold_1(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void **)(a1 + 32);
  __int16 v4 = a2;
  uint64_t v5 = [v3 length];
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 48);
  int v7 = 136315650;
  id v8 = "-[OspreyGRPCStreamingContext _writeFrame:compressed:error:]_block_invoke";
  __int16 v9 = 2048;
  uint64_t v10 = v5;
  __int16 v11 = 2112;
  uint64_t v12 = v6;
  _os_log_debug_impl(&dword_1BEDB4000, v4, OS_LOG_TYPE_DEBUG, "%s Writing frame of length %lu to outputStream: %@", (uint8_t *)&v7, 0x20u);
}

@end