@interface FCArrayStream
- (BOOL)isFinished;
- (FCArrayStream)init;
- (FCArrayStream)initWithArray:(id)a3;
- (id)fetchMoreResultsWithLimit:(unint64_t)a3 qualityOfService:(int64_t)a4 callbackQueue:(id)a5 completionHandler:(id)a6;
@end

@implementation FCArrayStream

- (FCArrayStream)initWithArray:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FCArrayStream;
  v5 = [(FCArrayStream *)&v9 init];
  if (v5)
  {
    if (v4)
    {
      uint64_t v6 = [v4 copy];
    }
    else
    {
      uint64_t v6 = [MEMORY[0x1E4F1C978] array];
    }
    array = v5->_array;
    v5->_array = (NSArray *)v6;
  }
  return v5;
}

- (FCArrayStream)init
{
  return [(FCArrayStream *)self initWithArray:0];
}

- (id)fetchMoreResultsWithLimit:(unint64_t)a3 qualityOfService:(int64_t)a4 callbackQueue:(id)a5 completionHandler:(id)a6
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  objc_super v9 = a5;
  id v10 = a6;
  v11 = v10;
  if (v9)
  {
    if (v10)
    {
      if (a3) {
        unint64_t v12 = a3;
      }
      else {
        unint64_t v12 = 0xFFFFFFFFLL;
      }
      unint64_t index = self->_index;
      NSUInteger v14 = [(NSArray *)self->_array count];
      if (v12 >= v14 - self->_index) {
        unint64_t v12 = v14 - self->_index;
      }
      v15 = -[NSArray subarrayWithRange:](self->_array, "subarrayWithRange:", index, v12);
      self->_unint64_t index = v12 + index;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __92__FCArrayStream_fetchMoreResultsWithLimit_qualityOfService_callbackQueue_completionHandler___block_invoke;
      block[3] = &unk_1E5B4C7C0;
      id v20 = v15;
      id v21 = v11;
      id v16 = v15;
      dispatch_async(v9, block);

LABEL_9:
      goto LABEL_14;
    }
LABEL_13:
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      goto LABEL_14;
    }
    id v16 = (id)objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "completionHandler != nil");
    *(_DWORD *)buf = 136315906;
    v23 = "-[FCArrayStream fetchMoreResultsWithLimit:qualityOfService:callbackQueue:completionHandler:]";
    __int16 v24 = 2080;
    v25 = "FCArrayStream.m";
    __int16 v26 = 1024;
    int v27 = 35;
    __int16 v28 = 2114;
    id v29 = v16;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
    goto LABEL_9;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v18 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "callbackQueue != nil");
    *(_DWORD *)buf = 136315906;
    v23 = "-[FCArrayStream fetchMoreResultsWithLimit:qualityOfService:callbackQueue:completionHandler:]";
    __int16 v24 = 2080;
    v25 = "FCArrayStream.m";
    __int16 v26 = 1024;
    int v27 = 34;
    __int16 v28 = 2114;
    id v29 = v18;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  if (!v11) {
    goto LABEL_13;
  }
LABEL_14:

  return 0;
}

uint64_t __92__FCArrayStream_fetchMoreResultsWithLimit_qualityOfService_callbackQueue_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

- (BOOL)isFinished
{
  unint64_t index = self->_index;
  return index == [(NSArray *)self->_array count];
}

- (void).cxx_destruct
{
}

@end