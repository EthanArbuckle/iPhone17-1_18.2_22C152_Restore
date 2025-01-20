@interface OspreyBufferedOutputStream
- (BOOL)_flushBuffer;
- (BOOL)hasBufferedData;
- (BOOL)hasSpaceAvailable;
- (OspreyBufferedOutputStream)initWithBufferSize:(unint64_t)a3 underlyingOutputStream:(id)a4 queue:(id)a5;
- (id)streamError;
- (int64_t)write:(const char *)a3 maxLength:(unint64_t)a4;
- (void)_closeUnderlying;
- (void)close;
- (void)dealloc;
- (void)stream:(id)a3 handleEvent:(unint64_t)a4;
@end

@implementation OspreyBufferedOutputStream

- (OspreyBufferedOutputStream)initWithBufferSize:(unint64_t)a3 underlyingOutputStream:(id)a4 queue:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)OspreyBufferedOutputStream;
  v11 = [(OspreyBufferedOutputStream *)&v15 init];
  if (v11)
  {
    uint64_t v12 = [objc_alloc(MEMORY[0x1E4F1CA58]) initWithCapacity:a3];
    outputBuffer = v11->_outputBuffer;
    v11->_outputBuffer = (NSMutableData *)v12;

    objc_storeStrong((id *)&v11->_outputStream, a4);
    MEMORY[0x1C189CD10](v11->_outputStream, v10);
    [(NSOutputStream *)v11->_outputStream setDelegate:v11];
    objc_storeStrong((id *)&v11->_queue, a5);
  }

  return v11;
}

- (BOOL)hasSpaceAvailable
{
  return [(NSOutputStream *)self->_outputStream streamStatus] != 7
      && [(NSOutputStream *)self->_outputStream streamStatus] != 6;
}

- (int64_t)write:(const char *)a3 maxLength:(unint64_t)a4
{
  if (![(OspreyBufferedOutputStream *)self _flushBuffer]
    || ![(NSOutputStream *)self->_outputStream hasSpaceAvailable])
  {
    goto LABEL_5;
  }
  int64_t v7 = [(NSOutputStream *)self->_outputStream write:a3 maxLength:a4];
  if (v7 > 0) {
    goto LABEL_6;
  }
  if (v7 != -1)
  {
LABEL_5:
    int64_t v7 = 0;
LABEL_6:
    if (a4 <= v7) {
      return v7;
    }
    [(NSMutableData *)self->_outputBuffer appendBytes:&a3[v7] length:a4 - v7];
    return a4;
  }
  OspreyLoggingInit();
  id v9 = (void *)OspreyLogContextGRPC;
  if (os_log_type_enabled((os_log_t)OspreyLogContextGRPC, OS_LOG_TYPE_ERROR)) {
    -[OspreyBufferedOutputStream write:maxLength:]((void **)&self->_outputStream, v9);
  }
  return -1;
}

- (BOOL)hasBufferedData
{
  return [(NSMutableData *)self->_outputBuffer length] != 0;
}

- (id)streamError
{
  return (id)[(NSOutputStream *)self->_outputStream streamError];
}

- (void)close
{
  self->_closed = 1;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__OspreyBufferedOutputStream_close__block_invoke;
  block[3] = &unk_1E63CB9D0;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __35__OspreyBufferedOutputStream_close__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 136) length];
  if (!result)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    v4 = *(void **)(v3 + 136);
    *(void *)(v3 + 136) = 0;

    v5 = *(void **)(a1 + 32);
    return [v5 _closeUnderlying];
  }
  return result;
}

- (void)dealloc
{
  [(OspreyBufferedOutputStream *)self _closeUnderlying];
  v3.receiver = self;
  v3.super_class = (Class)OspreyBufferedOutputStream;
  [(OspreyBufferedOutputStream *)&v3 dealloc];
}

- (void)_closeUnderlying
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_2();
  _os_log_debug_impl(&dword_1BEDB4000, v0, OS_LOG_TYPE_DEBUG, "%s Closing underlying stream: %@", (uint8_t *)v1, 0x16u);
}

- (BOOL)_flushBuffer
{
  if (![(NSMutableData *)self->_outputBuffer length]) {
    return 1;
  }
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0;
  outputBuffer = self->_outputBuffer;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __42__OspreyBufferedOutputStream__flushBuffer__block_invoke;
  v7[3] = &unk_1E63CBA20;
  v7[4] = self;
  v7[5] = &v8;
  [(NSMutableData *)outputBuffer enumerateByteRangesUsingBlock:v7];
  uint64_t v4 = v9[3];
  if (v4) {
    -[NSMutableData replaceBytesInRange:withBytes:length:](self->_outputBuffer, "replaceBytesInRange:withBytes:length:", 0, v4, 0, 0);
  }
  BOOL v5 = [(NSMutableData *)self->_outputBuffer length] == 0;
  _Block_object_dispose(&v8, 8);
  return v5;
}

void __42__OspreyBufferedOutputStream__flushBuffer__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  id v9 = (void *)(a1 + 32);
  if ([*(id *)(*(void *)(a1 + 32) + 144) hasSpaceAvailable])
  {
    uint64_t v10 = [*(id *)(*v9 + 144) write:a2 maxLength:a4];
    if (v10 < 1)
    {
      *a5 = 1;
      if (v10 == -1)
      {
        OspreyLoggingInit();
        uint64_t v11 = (void *)OspreyLogContextGRPC;
        if (os_log_type_enabled((os_log_t)OspreyLogContextGRPC, OS_LOG_TYPE_ERROR)) {
          __42__OspreyBufferedOutputStream__flushBuffer__block_invoke_cold_1(v9, 144, v11);
        }
      }
    }
    else
    {
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += v10;
    }
  }
  else
  {
    *a5 = 1;
  }
}

- (void)stream:(id)a3 handleEvent:(unint64_t)a4
{
  v6 = (NSOutputStream *)a3;
  if (self->_outputStream != v6) {
    goto LABEL_13;
  }
  switch(a4)
  {
    case 0x10uLL:
      goto LABEL_12;
    case 8uLL:
      OspreyLoggingInit();
      int64_t v7 = (void *)OspreyLogContextGRPC;
      if (os_log_type_enabled((os_log_t)OspreyLogContextGRPC, OS_LOG_TYPE_ERROR)) {
        -[OspreyBufferedOutputStream stream:handleEvent:]((void **)&self->_outputStream, v7);
      }
      goto LABEL_12;
    case 4uLL:
      OspreyLoggingInit();
      if (os_log_type_enabled((os_log_t)OspreyLogContextGRPC, OS_LOG_TYPE_DEBUG)) {
        -[OspreyBufferedOutputStream stream:handleEvent:]();
      }
      if ([(OspreyBufferedOutputStream *)self _flushBuffer] && self->_closed) {
LABEL_12:
      }
        [(OspreyBufferedOutputStream *)self _closeUnderlying];
      break;
  }
LABEL_13:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_outputStream, 0);

  objc_storeStrong((id *)&self->_outputBuffer, 0);
}

- (void)write:(void *)a1 maxLength:(void *)a2 .cold.1(void **a1, void *a2)
{
  uint64_t v2 = *a1;
  id v3 = a2;
  uint64_t v4 = [v2 streamError];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1BEDB4000, v5, v6, "%s Error writing bytes to %@ with: %@", v7, v8, v9, v10, 2u);
}

void __42__OspreyBufferedOutputStream__flushBuffer__block_invoke_cold_1(void *a1, uint64_t a2, void *a3)
{
  id v3 = *(void **)(*a1 + a2);
  id v4 = a3;
  uint64_t v5 = [v3 streamError];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1BEDB4000, v6, v7, "%s Error writing bytes to %@ with: %@", v8, v9, v10, v11, 2u);
}

- (void)stream:handleEvent:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_2();
  _os_log_debug_impl(&dword_1BEDB4000, v0, OS_LOG_TYPE_DEBUG, "%s OutputStream %@ has space available.", (uint8_t *)v1, 0x16u);
}

- (void)stream:(void *)a1 handleEvent:(void *)a2 .cold.2(void **a1, void *a2)
{
  uint64_t v2 = *a1;
  id v3 = a2;
  id v4 = [v2 streamError];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1BEDB4000, v5, v6, "%s OutputStream %@ error occurred: %@.", v7, v8, v9, v10, 2u);
}

@end