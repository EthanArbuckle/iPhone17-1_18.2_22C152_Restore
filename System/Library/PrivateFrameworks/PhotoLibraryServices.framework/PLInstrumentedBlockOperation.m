@interface PLInstrumentedBlockOperation
+ (id)blockOperationWithBlock:(id)a3;
- (BOOL)postambleAdded;
- (PLInstrumentedBlockOperation)init;
- (double)creationTime;
- (double)executionEndTime;
- (double)executionStartTime;
- (double)executionTime;
- (double)timeSpentWaitingInQueue;
- (id)description;
- (void)addExecutionBlock:(id)a3;
- (void)setCreationTime:(double)a3;
- (void)setExecutionEndTime:(double)a3;
- (void)setExecutionStartTime:(double)a3;
- (void)setPostambleAdded:(BOOL)a3;
@end

@implementation PLInstrumentedBlockOperation

- (void)setPostambleAdded:(BOOL)a3
{
  self->_postambleAdded = a3;
}

- (BOOL)postambleAdded
{
  return self->_postambleAdded;
}

- (void)setExecutionEndTime:(double)a3
{
  self->_executionEndTime = a3;
}

- (double)executionEndTime
{
  return self->_executionEndTime;
}

- (void)setExecutionStartTime:(double)a3
{
  self->_executionStartTime = a3;
}

- (double)executionStartTime
{
  return self->_executionStartTime;
}

- (void)setCreationTime:(double)a3
{
  self->_creationTime = a3;
}

- (double)creationTime
{
  return self->_creationTime;
}

- (double)timeSpentWaitingInQueue
{
  [(PLInstrumentedBlockOperation *)self creationTime];
  double v4 = v3;
  double result = 0.0;
  if (v4 != 0.0)
  {
    [(PLInstrumentedBlockOperation *)self executionStartTime];
    if (Current == 0.0) {
      double Current = CFAbsoluteTimeGetCurrent();
    }
    return Current - v4;
  }
  return result;
}

- (double)executionTime
{
  [(PLInstrumentedBlockOperation *)self executionStartTime];
  double v4 = v3;
  double result = 0.0;
  if (v4 != 0.0)
  {
    [(PLInstrumentedBlockOperation *)self executionEndTime];
    if (Current == 0.0) {
      double Current = CFAbsoluteTimeGetCurrent();
    }
    return Current - v4;
  }
  return result;
}

- (id)description
{
  double v3 = (void *)MEMORY[0x1E4F28E78];
  v10.receiver = self;
  v10.super_class = (Class)PLInstrumentedBlockOperation;
  double v4 = [(PLInstrumentedBlockOperation *)&v10 description];
  [(PLInstrumentedBlockOperation *)self executionTime];
  uint64_t v6 = v5;
  [(PLInstrumentedBlockOperation *)self timeSpentWaitingInQueue];
  v8 = [v3 stringWithFormat:@"%@ execution time: %.4f, time waiting in queue: %.4f", v4, v6, v7];

  return v8;
}

- (void)addExecutionBlock:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PLInstrumentedBlockOperation;
  [(NSBlockOperation *)&v15 addExecutionBlock:v5];
  if ([(PLInstrumentedBlockOperation *)self postambleAdded])
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    v9 = (objc_class *)objc_opt_class();
    objc_super v10 = NSStringFromClass(v9);
    [v8 handleFailureInMethod:a2, self, @"PLInstrumentedBlockOperation.m", 57, @"adding multiple execution blocks is not supported on %@", v10 object file lineNumber description];
  }
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x3032000000;
  v13[3] = __Block_byref_object_copy__99987;
  v13[4] = __Block_byref_object_dispose__99988;
  uint64_t v6 = self;
  v14 = v6;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __50__PLInstrumentedBlockOperation_addExecutionBlock___block_invoke;
  v12[3] = &unk_1E5875840;
  v12[4] = v13;
  uint64_t v7 = (void *)MEMORY[0x19F38D650](v12);
  v11.receiver = v6;
  v11.super_class = (Class)PLInstrumentedBlockOperation;
  [(NSBlockOperation *)&v11 addExecutionBlock:v7];
  [(PLInstrumentedBlockOperation *)v6 setPostambleAdded:1];

  _Block_object_dispose(v13, 8);
}

void __50__PLInstrumentedBlockOperation_addExecutionBlock___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setExecutionEndTime:CFAbsoluteTimeGetCurrent()];
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8);
  double v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;
}

- (PLInstrumentedBlockOperation)init
{
  v11.receiver = self;
  v11.super_class = (Class)PLInstrumentedBlockOperation;
  uint64_t v2 = [(NSBlockOperation *)&v11 init];
  double v3 = v2;
  if (v2)
  {
    v9[0] = 0;
    v9[1] = v9;
    v9[2] = 0x3032000000;
    v9[3] = __Block_byref_object_copy__99987;
    v9[4] = __Block_byref_object_dispose__99988;
    double v4 = v2;
    objc_super v10 = v4;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __36__PLInstrumentedBlockOperation_init__block_invoke;
    v8[3] = &unk_1E5875840;
    v8[4] = v9;
    id v5 = (void *)MEMORY[0x19F38D650](v8);
    v7.receiver = v4;
    v7.super_class = (Class)PLInstrumentedBlockOperation;
    [(NSBlockOperation *)&v7 addExecutionBlock:v5];

    _Block_object_dispose(v9, 8);
  }
  return v3;
}

void __36__PLInstrumentedBlockOperation_init__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setExecutionStartTime:CFAbsoluteTimeGetCurrent()];
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8);
  double v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;
}

+ (id)blockOperationWithBlock:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)objc_opt_class());
  [v4 addExecutionBlock:v3];

  return v4;
}

@end