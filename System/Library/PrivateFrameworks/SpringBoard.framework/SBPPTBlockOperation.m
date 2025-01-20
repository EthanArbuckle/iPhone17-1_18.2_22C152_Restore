@interface SBPPTBlockOperation
+ (id)keyPathsForValuesAffectingIsExecuting;
+ (id)keyPathsForValuesAffectingIsFinished;
+ (id)operationWithBlock:(id)a3;
+ (id)operationWithName:(id)a3 block:(id)a4;
- (BOOL)isAsynchronous;
- (BOOL)isExecuting;
- (BOOL)isFinished;
- (SBPPTBlockOperation)init;
- (SBPPTBlockOperation)initWithBlock:(id)a3;
- (SBPPTBlockOperation)initWithName:(id)a3 block:(id)a4;
- (double)timeoutInterval;
- (id)block;
- (id)description;
- (id)timeoutBlock;
- (unint64_t)state;
- (void)cancel;
- (void)cancelAndFailTestWithReason:(id)a3;
- (void)finish;
- (void)main;
- (void)setState:(unint64_t)a3;
- (void)setTimeoutBlock:(id)a3;
- (void)setTimeoutInterval:(double)a3;
- (void)start;
@end

@implementation SBPPTBlockOperation

+ (id)operationWithBlock:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithBlock:v4];

  return v5;
}

+ (id)operationWithName:(id)a3 block:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[objc_alloc((Class)a1) initWithName:v7 block:v6];

  return v8;
}

- (SBPPTBlockOperation)initWithBlock:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SBPPTBlockOperation;
  v5 = [(SBPPTOperation *)&v10 init];
  id v6 = v5;
  if (v5)
  {
    v5->_timeoutInterval = 15.0;
    v5->_state = 0;
    uint64_t v7 = [v4 copy];
    id block = v6->_block;
    v6->_id block = (id)v7;
  }
  return v6;
}

- (SBPPTBlockOperation)initWithName:(id)a3 block:(id)a4
{
  id v6 = a3;
  uint64_t v7 = [(SBPPTBlockOperation *)self initWithBlock:a4];
  v8 = v7;
  if (v7) {
    [(SBPPTOperation *)v7 setOperationName:v6];
  }

  return v8;
}

- (SBPPTBlockOperation)init
{
  return [(SBPPTBlockOperation *)self initWithName:@"(anonymous SBPPTBlockOperation)" block:&__block_literal_global_421];
}

uint64_t __27__SBPPTBlockOperation_init__block_invoke(uint64_t a1, void *a2)
{
  return [a2 finish];
}

- (id)description
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  unint64_t v4 = [(SBPPTBlockOperation *)self state];
  v5 = @"Pending";
  if (v4 == 2) {
    v5 = @"Finished";
  }
  if (v4 == 1) {
    id v6 = @"Executing";
  }
  else {
    id v6 = v5;
  }
  [v3 appendString:v6 withName:@"state"];
  id v7 = (id)[v3 appendFloat:@"timeoutInterval" withName:self->_timeoutInterval];
  v8 = [(SBPPTOperation *)self operationName];
  [v3 appendString:v8 withName:@"operationName"];

  v9 = [v3 build];

  return v9;
}

__CFString *__34__SBPPTBlockOperation_description__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) state];
  v2 = @"Pending";
  if (v1 == 2) {
    v2 = @"Finished";
  }
  if (v1 == 1) {
    return @"Executing";
  }
  else {
    return v2;
  }
}

+ (id)keyPathsForValuesAffectingIsExecuting
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"state", 0);
}

+ (id)keyPathsForValuesAffectingIsFinished
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"state", 0);
}

- (void)finish
{
  dispatch_block_t block = [(SBPPTBlockOperation *)self timeoutBlock];
  if (block)
  {
    dispatch_block_cancel(block);
    [(SBPPTBlockOperation *)self setTimeoutBlock:0];
  }
  [(SBPPTBlockOperation *)self setState:2];
  [(SBPPTOperation *)self operationDidFinish];
}

- (void)cancel
{
  v3.receiver = self;
  v3.super_class = (Class)SBPPTBlockOperation;
  [(SBPPTBlockOperation *)&v3 cancel];
  self->_cancelled = 1;
  [(SBPPTBlockOperation *)self finish];
}

- (void)cancelAndFailTestWithReason:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = +[SBApplicationTestingManager sharedInstance];
  id v6 = [v5 currentTestName];

  [(id)*MEMORY[0x1E4F43630] failedTest:v6 withFailure:v4];
  v11.receiver = self;
  v11.super_class = (Class)SBPPTBlockOperation;
  [(SBPPTBlockOperation *)&v11 cancel];
  self->_cancelled = 1;
  id v7 = SBLogPPT();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = [(SBPPTOperation *)self operationName];
    v9 = (void *)v8;
    if (v8) {
      objc_super v10 = (SBPPTBlockOperation *)v8;
    }
    else {
      objc_super v10 = self;
    }
    *(_DWORD *)buf = 138412546;
    v13 = v10;
    __int16 v14 = 2112;
    id v15 = v4;
    _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "PPT Operation '%@' cancelled for reason: %@", buf, 0x16u);
  }
  [(SBPPTBlockOperation *)self finish];
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (BOOL)isExecuting
{
  return [(SBPPTBlockOperation *)self state] == 1;
}

- (BOOL)isFinished
{
  return [(SBPPTBlockOperation *)self state] == 2;
}

- (void)start
{
  uint64_t v1 = [a1 operationName];
  OUTLINED_FUNCTION_10(&dword_1D85BA000, v2, v3, "Skipping '%@' because it's already finished", v4, v5, v6, v7, 2u);
}

- (void)main
{
  [(SBPPTBlockOperation *)self timeoutInterval];
  double v4 = v3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __27__SBPPTBlockOperation_main__block_invoke;
  v8[3] = &unk_1E6AF4A70;
  v8[4] = self;
  *(double *)&v8[5] = v3;
  dispatch_block_t v5 = dispatch_block_create((dispatch_block_flags_t)0, v8);
  [(SBPPTBlockOperation *)self setTimeoutBlock:v5];
  dispatch_time_t v6 = dispatch_time(0, (uint64_t)(v4 * 1000000000.0));
  dispatch_after(v6, MEMORY[0x1E4F14428], v5);
  [(SBPPTOperation *)self operationWillStart];
  uint64_t v7 = [(SBPPTBlockOperation *)self block];
  ((void (**)(void, SBPPTBlockOperation *))v7)[2](v7, self);
}

void __27__SBPPTBlockOperation_main__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  objc_msgSend(NSString, "stringWithFormat:", @"Operation didn't complete within %f seconds", *(void *)(a1 + 40));
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v1 cancelAndFailTestWithReason:v2];
}

- (double)timeoutInterval
{
  return self->_timeoutInterval;
}

- (void)setTimeoutInterval:(double)a3
{
  self->_timeoutInterval = a3;
}

- (id)timeoutBlock
{
  id WeakRetained = objc_loadWeakRetained(&self->_timeoutBlock);
  return WeakRetained;
}

- (void)setTimeoutBlock:(id)a3
{
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (id)block
{
  return self->_block;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
  objc_destroyWeak(&self->_timeoutBlock);
}

@end