@interface FCTransformedResultsStream
- (BOOL)isFinished;
- (FCStreaming)stream;
- (FCTransformedResultsStream)initWithStream:(id)a3 asyncTransformBlock:(id)a4;
- (id)asyncTransformBlock;
- (id)fetchMoreResultsWithLimit:(unint64_t)a3 qualityOfService:(int64_t)a4 callbackQueue:(id)a5 completionHandler:(id)a6;
- (void)setAsyncTransformBlock:(id)a3;
- (void)setStream:(id)a3;
@end

@implementation FCTransformedResultsStream

- (FCTransformedResultsStream)initWithStream:(id)a3 asyncTransformBlock:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v7 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v14 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "stream != nil");
    *(_DWORD *)buf = 136315906;
    v18 = "-[FCTransformedResultsStream initWithStream:asyncTransformBlock:]";
    __int16 v19 = 2080;
    v20 = "FCTransformedResultsStream.m";
    __int16 v21 = 1024;
    int v22 = 23;
    __int16 v23 = 2114;
    v24 = v14;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v8) {
      goto LABEL_6;
    }
  }
  else if (v8)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v15 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "asyncTransformBlock != nil");
    *(_DWORD *)buf = 136315906;
    v18 = "-[FCTransformedResultsStream initWithStream:asyncTransformBlock:]";
    __int16 v19 = 2080;
    v20 = "FCTransformedResultsStream.m";
    __int16 v21 = 1024;
    int v22 = 24;
    __int16 v23 = 2114;
    v24 = v15;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
LABEL_6:
  v16.receiver = self;
  v16.super_class = (Class)FCTransformedResultsStream;
  v9 = [(FCTransformedResultsStream *)&v16 init];
  v10 = v9;
  if (v9)
  {
    if (v7 && v8)
    {
      objc_storeStrong((id *)&v9->_stream, a3);
      uint64_t v11 = [v8 copy];
      asyncTransformBlock = v10->_asyncTransformBlock;
      v10->_asyncTransformBlock = (id)v11;
    }
    else
    {
      asyncTransformBlock = v9;
      v10 = 0;
    }
  }
  return v10;
}

- (id)fetchMoreResultsWithLimit:(unint64_t)a3 qualityOfService:(int64_t)a4 callbackQueue:(id)a5 completionHandler:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  v12 = [(FCTransformedResultsStream *)self stream];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __105__FCTransformedResultsStream_fetchMoreResultsWithLimit_qualityOfService_callbackQueue_completionHandler___block_invoke;
  v17[3] = &unk_1E5B541E0;
  v17[4] = self;
  id v18 = v10;
  id v19 = v11;
  int64_t v20 = a4;
  id v13 = v11;
  id v14 = v10;
  v15 = [v12 fetchMoreResultsWithLimit:a3 qualityOfService:a4 callbackQueue:v14 completionHandler:v17];

  return v15;
}

void __105__FCTransformedResultsStream_fetchMoreResultsWithLimit_qualityOfService_callbackQueue_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  v6 = *(void **)(a1 + 32);
  id v7 = a2;
  id v8 = [v6 asyncTransformBlock];
  uint64_t v9 = *(void *)(a1 + 56);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __105__FCTransformedResultsStream_fetchMoreResultsWithLimit_qualityOfService_callbackQueue_completionHandler___block_invoke_2;
  v13[3] = &unk_1E5B541B8;
  id v14 = *(id *)(a1 + 40);
  id v10 = *(id *)(a1 + 48);
  id v15 = v5;
  id v16 = v10;
  id v11 = (void (*)(void *, id, uint64_t, void *))v8[2];
  id v12 = v5;
  v11(v8, v7, v9, v13);
}

void __105__FCTransformedResultsStream_fetchMoreResultsWithLimit_qualityOfService_callbackQueue_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(NSObject **)(a1 + 32);
  if (v4)
  {
    id v5 = *(void **)(a1 + 48);
    if (v5)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __105__FCTransformedResultsStream_fetchMoreResultsWithLimit_qualityOfService_callbackQueue_completionHandler___block_invoke_3;
      block[3] = &unk_1E5B4F080;
      id v9 = v5;
      id v7 = v3;
      id v8 = *(id *)(a1 + 40);
      dispatch_async(v4, block);
    }
  }
}

uint64_t __105__FCTransformedResultsStream_fetchMoreResultsWithLimit_qualityOfService_callbackQueue_completionHandler___block_invoke_3(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (BOOL)isFinished
{
  v2 = [(FCTransformedResultsStream *)self stream];
  char v3 = [v2 isFinished];

  return v3;
}

- (FCStreaming)stream
{
  return self->_stream;
}

- (void)setStream:(id)a3
{
}

- (id)asyncTransformBlock
{
  return self->_asyncTransformBlock;
}

- (void)setAsyncTransformBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_asyncTransformBlock, 0);
  objc_storeStrong((id *)&self->_stream, 0);
}

@end