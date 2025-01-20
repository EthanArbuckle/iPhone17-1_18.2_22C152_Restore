@interface MSVStreamReader
- (BOOL)_shouldHandleEvent;
- (BOOL)shouldCompress;
- (MSVStreamReader)initWithInputStream:(id)a3 queue:(id)a4;
- (NSInputStream)stream;
- (OS_dispatch_queue)queue;
- (double)timestamp;
- (id)_compressedDataForData:(id)a3;
- (id)didEncounterErrorBlock;
- (id)didFinishReadingBlock;
- (id)didReadDataBlock;
- (id)readAllDataWithError:(id *)a3;
- (unint64_t)maximumBufferSize;
- (void)_stop;
- (void)dealloc;
- (void)readAllDataIntoFileHandle:(id)a3 withCompletion:(id)a4;
- (void)readAllDataWithCompletion:(id)a3;
- (void)setCompress:(BOOL)a3;
- (void)setDidEncounterErrorBlock:(id)a3;
- (void)setDidFinishReadingBlock:(id)a3;
- (void)setDidReadDataBlock:(id)a3;
- (void)setMaximumBufferSize:(unint64_t)a3;
- (void)setQueue:(id)a3;
- (void)setStream:(id)a3;
- (void)start;
- (void)stop;
- (void)stopWithCompletion:(id)a3;
- (void)stream:(id)a3 handleEvent:(unint64_t)a4;
@end

@implementation MSVStreamReader

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_stream, 0);
  objc_storeStrong(&self->_didEncounterErrorBlock, 0);
  objc_storeStrong(&self->_didFinishReadingBlock, 0);
  objc_storeStrong(&self->_didReadDataBlock, 0);
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setStream:(id)a3
{
}

- (NSInputStream)stream
{
  return self->_stream;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setCompress:(BOOL)a3
{
  self->_compress = a3;
}

- (BOOL)shouldCompress
{
  return self->_compress;
}

- (void)setMaximumBufferSize:(unint64_t)a3
{
  self->_maximumBufferSize = a3;
}

- (unint64_t)maximumBufferSize
{
  return self->_maximumBufferSize;
}

- (void)setDidEncounterErrorBlock:(id)a3
{
}

- (id)didEncounterErrorBlock
{
  return self->_didEncounterErrorBlock;
}

- (void)setDidFinishReadingBlock:(id)a3
{
}

- (id)didFinishReadingBlock
{
  return self->_didFinishReadingBlock;
}

- (void)setDidReadDataBlock:(id)a3
{
}

- (id)didReadDataBlock
{
  return self->_didReadDataBlock;
}

- (void)_stop
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  BOOL stopped = self->_stopped;
  v4 = os_log_create("com.apple.amp.MediaServices", "StreamReader");
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (stopped)
  {
    if (v5)
    {
      int v6 = 134217984;
      v7 = self;
      _os_log_impl(&dword_1A30CD000, v4, OS_LOG_TYPE_DEFAULT, "Reader=%p stream reader already stopped", (uint8_t *)&v6, 0xCu);
    }
  }
  else
  {
    if (v5)
    {
      int v6 = 134217984;
      v7 = self;
      _os_log_impl(&dword_1A30CD000, v4, OS_LOG_TYPE_DEFAULT, "Reader=%p stopping stream reader", (uint8_t *)&v6, 0xCu);
    }

    self->_BOOL stopped = 1;
    MEMORY[0x1A6241400](self->_stream, 0);
    [(NSInputStream *)self->_stream setDelegate:0];
    [(NSInputStream *)self->_stream close];
  }
}

- (BOOL)_shouldHandleEvent
{
  return !self->_stopped;
}

- (id)_compressedDataForData:(id)a3
{
  uint64_t v3 = MEMORY[0x1F4188790](self, a2, a3);
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = v4;
  if (*(void *)(v3 + 16)
    || (v11 = malloc_type_malloc(0x70uLL, 0x10B0040E8CA615DuLL),
        *(void *)(v3 + 16) = v11,
        v11[8] = 0,
        *(void *)(*(void *)(v3 + 16) + 72) = 0,
        *(void *)(*(void *)(v3 + 16) + 80) = 0,
        !deflateInit_(*(z_streamp *)(v3 + 16), -1, "1.2.12", 112)))
  {
    int v6 = objc_opt_new();
    id v7 = v5;
    **(void **)(v3 + 16) = [v7 bytes];
    int v8 = [v7 length];
    uint64_t v9 = *(void *)(v3 + 16);
    *(_DWORD *)(v9 + 8) = v8;
    int v10 = 4 * (v7 == 0);
    do
    {
      *(_DWORD *)(v9 + 32) = 20480;
      *(void *)(v9 + 24) = v14;
      if (deflate(*(z_streamp *)(v3 + 16), v10) == -2) {
        __assert_rtn("-[MSVStreamReader _compressedDataForData:]", "MSVStreamReader.m", 280, "ret != Z_STREAM_ERROR");
      }
      [v6 appendBytes:v14 length:20480 - *(unsigned int *)(*(void *)(v3 + 16) + 32)];
      uint64_t v9 = *(void *)(v3 + 16);
    }
    while (!*(_DWORD *)(v9 + 32));
    if (*(_DWORD *)(v9 + 8)) {
      __assert_rtn("-[MSVStreamReader _compressedDataForData:]", "MSVStreamReader.m", 284, "_zstreamp->avail_in == 0");
    }
  }
  else
  {
    v12 = os_log_create("com.apple.amp.MediaServices", "StreamReader");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_1A30CD000, v12, OS_LOG_TYPE_ERROR, "deflateInit failed", v14, 2u);
    }

    free(*(void **)(v3 + 16));
    int v6 = 0;
    *(void *)(v3 + 16) = 0;
  }

  return v6;
}

- (void)stream:(id)a3 handleEvent:(unint64_t)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = (NSInputStream *)a3;
  if (self->_stream != v7)
  {
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2 object:self file:@"MSVStreamReader.m" lineNumber:215 description:@"unexpected stream"];
  }
  self->_timestamp = CFAbsoluteTimeGetCurrent();
  if (a4 - 1 <= 1 && [(NSInputStream *)self->_stream hasBytesAvailable])
  {
    int v8 = malloc_type_malloc(self->_maximumBufferSize, 0xAF374A77uLL);
    uint64_t v9 = [(NSInputStream *)self->_stream read:v8 maxLength:self->_maximumBufferSize];
    if (v9 < 1)
    {
      free(v8);
      goto LABEL_33;
    }
    int v10 = [objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytesNoCopy:v8 length:v9 freeWhenDone:1];
    if (![(MSVStreamReader *)self shouldCompress]) {
      goto LABEL_30;
    }
    v11 = [(MSVStreamReader *)self _compressedDataForData:v10];

    if (!v11)
    {
      int v10 = 0;
      goto LABEL_30;
    }
    if ([v11 length])
    {
      int v10 = v11;
LABEL_30:
      didReadDataBlock = (void (**)(id, void *))self->_didReadDataBlock;
      if (didReadDataBlock) {
        didReadDataBlock[2](didReadDataBlock, v10);
      }

      goto LABEL_33;
    }
LABEL_27:

    goto LABEL_33;
  }
  if (a4 == 8)
  {
    v16 = os_log_create("com.apple.amp.MediaServices", "StreamReader");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = 134217984;
      v22 = self;
      _os_log_impl(&dword_1A30CD000, v16, OS_LOG_TYPE_DEFAULT, "Reader=%p Encountered error event", (uint8_t *)&v21, 0xCu);
    }

    [(MSVStreamReader *)self _stop];
    didEncounterErrorBlock = (void (**)(id, void *))self->_didEncounterErrorBlock;
    if (didEncounterErrorBlock)
    {
      v18 = [(NSInputStream *)self->_stream streamError];
      didEncounterErrorBlock[2](didEncounterErrorBlock, v18);
    }
  }
  else
  {
    if (a4 != 16)
    {
      v11 = os_log_create("com.apple.amp.MediaServices", "StreamReader");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        int v21 = 134218240;
        v22 = self;
        __int16 v23 = 2048;
        unint64_t v24 = a4;
        _os_log_impl(&dword_1A30CD000, v11, OS_LOG_TYPE_ERROR, "Reader=%p unexpected stream event %lu", (uint8_t *)&v21, 0x16u);
      }
      goto LABEL_27;
    }
    v12 = os_log_create("com.apple.amp.MediaServices", "StreamReader");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = 134217984;
      v22 = self;
      _os_log_impl(&dword_1A30CD000, v12, OS_LOG_TYPE_DEFAULT, "Reader=%p Encountered end event", (uint8_t *)&v21, 0xCu);
    }

    [(MSVStreamReader *)self _stop];
    if ([(MSVStreamReader *)self shouldCompress])
    {
      v13 = [(MSVStreamReader *)self _compressedDataForData:0];
      if ([v13 length])
      {
        v14 = (void (**)(id, void *))self->_didReadDataBlock;
        if (v14) {
          v14[2](v14, v13);
        }
      }
    }
    didFinishReadingBlock = (void (**)(void))self->_didFinishReadingBlock;
    if (didFinishReadingBlock) {
      didFinishReadingBlock[2]();
    }
  }
LABEL_33:
}

- (void)readAllDataIntoFileHandle:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [(MSVStreamReader *)self didFinishReadingBlock];
  objc_initWeak(&location, self);
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __60__MSVStreamReader_readAllDataIntoFileHandle_withCompletion___block_invoke;
  v28[3] = &unk_1E5AD9F00;
  objc_copyWeak(&v31, &location);
  id v9 = v7;
  id v29 = v9;
  id v10 = v8;
  id v30 = v10;
  [(MSVStreamReader *)self setDidFinishReadingBlock:v28];
  v11 = [(MSVStreamReader *)self didEncounterErrorBlock];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __60__MSVStreamReader_readAllDataIntoFileHandle_withCompletion___block_invoke_2;
  v24[3] = &unk_1E5AD9F28;
  objc_copyWeak(&v27, &location);
  id v12 = v9;
  id v25 = v12;
  id v13 = v11;
  id v26 = v13;
  [(MSVStreamReader *)self setDidEncounterErrorBlock:v24];
  v14 = [(MSVStreamReader *)self didReadDataBlock];
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  v19 = __60__MSVStreamReader_readAllDataIntoFileHandle_withCompletion___block_invoke_3;
  v20 = &unk_1E5AD9F50;
  objc_copyWeak(&v23, &location);
  id v15 = v6;
  id v21 = v15;
  id v16 = v14;
  id v22 = v16;
  [(MSVStreamReader *)self setDidReadDataBlock:&v17];
  [(MSVStreamReader *)self start];

  objc_destroyWeak(&v23);
  objc_destroyWeak(&v27);

  objc_destroyWeak(&v31);
  objc_destroyWeak(&location);
}

void __60__MSVStreamReader_readAllDataIntoFileHandle_withCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _stop];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    (*(void (**)(uint64_t, void))(v2 + 16))(v2, 0);
  }
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    (*(void (**)(void))(v3 + 16))();
  }
}

void __60__MSVStreamReader_readAllDataIntoFileHandle_withCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _stop];
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v6);
  }
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v6);
  }
}

void __60__MSVStreamReader_readAllDataIntoFileHandle_withCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  int v5 = [*(id *)(a1 + 32) fileDescriptor];
  if (fcntl(v5, 3) == -1)
  {
    int v8 = *__error();
    id v9 = os_log_create("com.apple.amp.MediaServices", "StreamReader");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218242;
      id v16 = WeakRetained;
      __int16 v17 = 2082;
      uint64_t v18 = strerror(v8);
      _os_log_impl(&dword_1A30CD000, v9, OS_LOG_TYPE_ERROR, "Reader=%p readAllDataIntoFileHandle bad fileHandle err=%{public}s", buf, 0x16u);
    }

    id v7 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MSVStreamReader" code:-1 userInfo:0];
  }
  else
  {
    fcntl(v5, 73, 1);
    id v6 = *(void **)(a1 + 32);
    id v14 = 0;
    [v6 writeData:v3 error:&v14];
    id v7 = (char *)v14;
  }
  id v10 = v7;
  if (v7)
  {
    v11 = os_log_create("com.apple.amp.MediaServices", "StreamReader");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218242;
      id v16 = WeakRetained;
      __int16 v17 = 2114;
      uint64_t v18 = v10;
      _os_log_impl(&dword_1A30CD000, v11, OS_LOG_TYPE_ERROR, "Reader=%p readAllDataIntoFileHandle encountered error. error=%{public}@", buf, 0x16u);
    }

    id v12 = [WeakRetained didEncounterErrorBlock];
    ((void (**)(void, char *))v12)[2](v12, v10);
  }
  else
  {
    uint64_t v13 = *(void *)(a1 + 40);
    if (v13) {
      (*(void (**)(uint64_t, id))(v13 + 16))(v13, v3);
    }
  }
}

- (void)readAllDataWithCompletion:(id)a3
{
  id v4 = a3;
  int v5 = objc_opt_new();
  id v6 = [(MSVStreamReader *)self didFinishReadingBlock];
  objc_initWeak(&location, self);
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __45__MSVStreamReader_readAllDataWithCompletion___block_invoke;
  v25[3] = &unk_1E5AD9EB0;
  objc_copyWeak(&v29, &location);
  id v7 = v4;
  id v27 = v7;
  id v8 = v5;
  id v26 = v8;
  id v9 = v6;
  id v28 = v9;
  [(MSVStreamReader *)self setDidFinishReadingBlock:v25];
  id v10 = [(MSVStreamReader *)self didEncounterErrorBlock];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __45__MSVStreamReader_readAllDataWithCompletion___block_invoke_2;
  v20[3] = &unk_1E5AD9ED8;
  objc_copyWeak(&v24, &location);
  id v11 = v7;
  id v22 = v11;
  id v12 = v8;
  id v21 = v12;
  id v13 = v10;
  id v23 = v13;
  [(MSVStreamReader *)self setDidEncounterErrorBlock:v20];
  id v14 = [(MSVStreamReader *)self didReadDataBlock];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __45__MSVStreamReader_readAllDataWithCompletion___block_invoke_3;
  v17[3] = &unk_1E5ADA020;
  id v15 = v12;
  id v18 = v15;
  id v16 = v14;
  id v19 = v16;
  [(MSVStreamReader *)self setDidReadDataBlock:v17];
  [(MSVStreamReader *)self start];

  objc_destroyWeak(&v24);
  objc_destroyWeak(&v29);
  objc_destroyWeak(&location);
}

void __45__MSVStreamReader_readAllDataWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [WeakRetained _stop];
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(uint64_t, void, void))(v2 + 16))(v2, *(void *)(a1 + 32), 0);
  }
  uint64_t v3 = *(void *)(a1 + 48);
  if (v3) {
    (*(void (**)(void))(v3 + 16))();
  }
}

void __45__MSVStreamReader_readAllDataWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [WeakRetained _stop];
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4) {
    (*(void (**)(uint64_t, void, id))(v4 + 16))(v4, *(void *)(a1 + 32), v6);
  }
  uint64_t v5 = *(void *)(a1 + 48);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v6);
  }
}

void __45__MSVStreamReader_readAllDataWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  id v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "appendData:");
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);
  }
}

- (id)readAllDataWithError:(id *)a3
{
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = __Block_byref_object_copy__2808;
  id v23 = __Block_byref_object_dispose__2809;
  id v24 = 0;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy__2808;
  __int16 v17 = __Block_byref_object_dispose__2809;
  id v18 = 0;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __40__MSVStreamReader_readAllDataWithError___block_invoke;
  v9[3] = &unk_1E5AD9E88;
  id v11 = &v19;
  id v12 = &v13;
  id v6 = v5;
  id v10 = v6;
  [(MSVStreamReader *)self readAllDataWithCompletion:v9];
  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  if (a3) {
    *a3 = (id) v14[5];
  }
  id v7 = (id)v20[5];

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);

  return v7;
}

void __40__MSVStreamReader_readAllDataWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)stopWithCompletion:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __38__MSVStreamReader_stopWithCompletion___block_invoke;
  v7[3] = &unk_1E5ADAA50;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __38__MSVStreamReader_stopWithCompletion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _stop];
  uint64_t v2 = *(void **)(a1 + 40);
  if (v2)
  {
    uint64_t v3 = *(NSObject **)(*(void *)(a1 + 32) + 80);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __38__MSVStreamReader_stopWithCompletion___block_invoke_2;
    block[3] = &unk_1E5ADAA28;
    id v5 = v2;
    dispatch_async(v3, block);
  }
}

uint64_t __38__MSVStreamReader_stopWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)stop
{
}

- (void)dealloc
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = os_log_create("com.apple.amp.MediaServices", "StreamReader");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v7 = self;
    _os_log_impl(&dword_1A30CD000, v3, OS_LOG_TYPE_DEFAULT, "Reader=%p stream reader dealloced", buf, 0xCu);
  }

  zstreamp = self->_zstreamp;
  if (zstreamp)
  {
    deflateEnd(zstreamp);
    free(self->_zstreamp);
    self->_zstreamp = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)MSVStreamReader;
  [(MSVStreamReader *)&v5 dealloc];
}

- (void)start
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = os_log_create("com.apple.amp.MediaServices", "StreamReader");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    id v22 = self;
    _os_log_impl(&dword_1A30CD000, v3, OS_LOG_TYPE_DEFAULT, "Reader=%p starting stream reader", buf, 0xCu);
  }

  double Current = CFAbsoluteTimeGetCurrent();
  stream = self->_stream;
  self->_timestamp = Current;
  MEMORY[0x1A6241400](stream, self->_queue);
  [(NSInputStream *)self->_stream setDelegate:self];
  uint64_t v6 = [(NSInputStream *)self->_stream streamStatus];
  uint64_t v7 = os_log_create("com.apple.amp.MediaServices", "StreamReader");
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      uint64_t v9 = [(NSInputStream *)self->_stream streamStatus];
      *(_DWORD *)buf = 134218240;
      id v22 = self;
      __int16 v23 = 2048;
      uint64_t v24 = v9;
      _os_log_impl(&dword_1A30CD000, v7, OS_LOG_TYPE_DEFAULT, "Reader=%p InputStream status %lu - streamreader will not open stream", buf, 0x16u);
    }

    objc_initWeak((id *)buf, self);
    if ([(NSInputStream *)self->_stream hasBytesAvailable])
    {
      queue = self->_queue;
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __24__MSVStreamReader_start__block_invoke_8;
      v18[3] = &unk_1E5AD9E60;
      id v11 = &v19;
      objc_copyWeak(&v19, (id *)buf);
      v18[4] = self;
      id v12 = v18;
    }
    else if ([(NSInputStream *)self->_stream streamStatus] == 5 {
           || [(NSInputStream *)self->_stream streamStatus] == 6)
    }
    {
      queue = self->_queue;
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __24__MSVStreamReader_start__block_invoke_2;
      v16[3] = &unk_1E5AD9E60;
      id v11 = &v17;
      objc_copyWeak(&v17, (id *)buf);
      v16[4] = self;
      id v12 = v16;
    }
    else
    {
      if ([(NSInputStream *)self->_stream streamStatus] != 7) {
        goto LABEL_15;
      }
      queue = self->_queue;
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __24__MSVStreamReader_start__block_invoke_3;
      v14[3] = &unk_1E5AD9E60;
      id v11 = &v15;
      objc_copyWeak(&v15, (id *)buf);
      v14[4] = self;
      id v12 = v14;
    }
    dispatch_async(queue, v12);
    objc_destroyWeak(v11);
LABEL_15:
    objc_destroyWeak((id *)buf);
    return;
  }
  if (v8)
  {
    *(_DWORD *)buf = 134217984;
    id v22 = self;
    _os_log_impl(&dword_1A30CD000, v7, OS_LOG_TYPE_DEFAULT, "Reader=%p InputStream status is NSStreamStatusNotOpen - streamreader will open stream", buf, 0xCu);
  }

  uint64_t v13 = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __24__MSVStreamReader_start__block_invoke;
  block[3] = &unk_1E5ADA860;
  void block[4] = self;
  dispatch_async(v13, block);
}

uint64_t __24__MSVStreamReader_start__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 72) open];
  *(unsigned char *)(*(void *)(a1 + 32) + 8) = 1;
  return result;
}

uint64_t __24__MSVStreamReader_start__block_invoke_8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    if ([WeakRetained _shouldHandleEvent]) {
      [v4 stream:*(void *)(*(void *)(a1 + 32) + 72) handleEvent:2];
    }
  }
  return MEMORY[0x1F41817F8]();
}

uint64_t __24__MSVStreamReader_start__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    if ([WeakRetained _shouldHandleEvent]) {
      [v4 stream:*(void *)(*(void *)(a1 + 32) + 72) handleEvent:16];
    }
  }
  return MEMORY[0x1F41817F8]();
}

uint64_t __24__MSVStreamReader_start__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    if ([WeakRetained _shouldHandleEvent]) {
      [v4 stream:*(void *)(*(void *)(a1 + 32) + 72) handleEvent:8];
    }
  }
  return MEMORY[0x1F41817F8]();
}

- (MSVStreamReader)initWithInputStream:(id)a3 queue:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  if (!v8)
  {
    id v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2 object:self file:@"MSVStreamReader.m" lineNumber:31 description:@"inputStream cannot be nil"];
  }
  v18.receiver = self;
  v18.super_class = (Class)MSVStreamReader;
  id v10 = [(MSVStreamReader *)&v18 init];
  id v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_stream, a3);
    if (v9)
    {
      dispatch_queue_t v12 = (dispatch_queue_t)v9;
    }
    else
    {
      uint64_t v13 = (objc_class *)objc_opt_class();
      Name = class_getName(v13);
      dispatch_queue_t v12 = dispatch_queue_create(Name, 0);
    }
    queue = v11->_queue;
    v11->_queue = (OS_dispatch_queue *)v12;

    v11->_maximumBufferSize = 10240;
    *(_WORD *)&v11->_closeOnStop = 0;
  }

  return v11;
}

@end