@interface FCTransformedStream
- (BOOL)isFinished;
- (FCStreaming)stream;
- (FCTransformedStream)init;
- (FCTransformedStream)initWithStream:(id)a3 transformBlock:(id)a4;
- (id)fetchMoreResultsWithLimit:(unint64_t)a3 qualityOfService:(int64_t)a4 callbackQueue:(id)a5 completionHandler:(id)a6;
- (id)transformBlock;
- (void)setStream:(id)a3;
- (void)setTransformBlock:(id)a3;
@end

@implementation FCTransformedStream

- (FCTransformedStream)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCTransformedStream init]";
    __int16 v9 = 2080;
    v10 = "FCTransformedStream.m";
    __int16 v11 = 1024;
    int v12 = 23;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCTransformedStream init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (FCTransformedStream)initWithStream:(id)a3 transformBlock:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v7 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    __int16 v13 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "stream != nil");
    *(_DWORD *)buf = 136315906;
    v17 = "-[FCTransformedStream initWithStream:transformBlock:]";
    __int16 v18 = 2080;
    v19 = "FCTransformedStream.m";
    __int16 v20 = 1024;
    int v21 = 28;
    __int16 v22 = 2114;
    v23 = v13;
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
    v14 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "transformBlock != nil");
    *(_DWORD *)buf = 136315906;
    v17 = "-[FCTransformedStream initWithStream:transformBlock:]";
    __int16 v18 = 2080;
    v19 = "FCTransformedStream.m";
    __int16 v20 = 1024;
    int v21 = 29;
    __int16 v22 = 2114;
    v23 = v14;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
LABEL_6:
  v15.receiver = self;
  v15.super_class = (Class)FCTransformedStream;
  __int16 v9 = [(FCTransformedStream *)&v15 init];
  if (v9)
  {
    v10 = _Block_copy(v8);
    id transformBlock = v9->_transformBlock;
    v9->_id transformBlock = v10;

    objc_storeStrong((id *)&v9->_stream, a3);
  }

  return v9;
}

- (id)fetchMoreResultsWithLimit:(unint64_t)a3 qualityOfService:(int64_t)a4 callbackQueue:(id)a5 completionHandler:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  int v12 = [(FCTransformedStream *)self stream];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __98__FCTransformedStream_fetchMoreResultsWithLimit_qualityOfService_callbackQueue_completionHandler___block_invoke;
  v16[3] = &unk_1E5B55940;
  v16[4] = self;
  id v17 = v10;
  id v13 = v10;
  v14 = [v12 fetchMoreResultsWithLimit:a3 qualityOfService:a4 callbackQueue:v11 completionHandler:v16];

  return v14;
}

void __98__FCTransformedStream_fetchMoreResultsWithLimit_qualityOfService_callbackQueue_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a3;
  v5 = *(void **)(a1 + 32);
  id v6 = a2;
  id v7 = [v5 transformBlock];
  id v8 = objc_msgSend(v6, "fc_arrayByTransformingWithBlock:", v7);

  uint64_t v9 = *(void *)(a1 + 40);
  if (v9) {
    (*(void (**)(uint64_t, void *, id))(v9 + 16))(v9, v8, v10);
  }
}

- (BOOL)isFinished
{
  v2 = [(FCTransformedStream *)self stream];
  char v3 = [v2 isFinished];

  return v3;
}

- (id)transformBlock
{
  return self->_transformBlock;
}

- (void)setTransformBlock:(id)a3
{
}

- (FCStreaming)stream
{
  return self->_stream;
}

- (void)setStream:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stream, 0);
  objc_storeStrong(&self->_transformBlock, 0);
}

@end