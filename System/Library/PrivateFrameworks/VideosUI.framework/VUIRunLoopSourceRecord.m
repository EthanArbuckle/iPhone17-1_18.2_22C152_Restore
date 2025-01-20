@interface VUIRunLoopSourceRecord
- (OS_dispatch_queue)completionQueue;
- (VUIRunLoopSourceRecord)initWithEvaluateBlock:(id)a3 completionBlock:(id)a4;
- (VUIRunLoopSourceRecord)initWithEvaluateBlock:(id)a3 completionBlock:(id)a4 completionQueue:(id)a5;
- (id)completionBlock;
- (id)evaluateBlock;
- (void)setCompletionBlock:(id)a3;
- (void)setCompletionQueue:(id)a3;
- (void)setEvaluateBlock:(id)a3;
@end

@implementation VUIRunLoopSourceRecord

- (id)evaluateBlock
{
  return self->_evaluateBlock;
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (VUIRunLoopSourceRecord)initWithEvaluateBlock:(id)a3 completionBlock:(id)a4 completionQueue:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)VUIRunLoopSourceRecord;
  v11 = [(VUIRunLoopSourceRecord *)&v17 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    id evaluateBlock = v11->_evaluateBlock;
    v11->_id evaluateBlock = (id)v12;

    uint64_t v14 = [v9 copy];
    id completionBlock = v11->_completionBlock;
    v11->_id completionBlock = (id)v14;

    objc_storeStrong((id *)&v11->_completionQueue, a5);
  }

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completionQueue, 0);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong(&self->_evaluateBlock, 0);
}

- (VUIRunLoopSourceRecord)initWithEvaluateBlock:(id)a3 completionBlock:(id)a4
{
  return [(VUIRunLoopSourceRecord *)self initWithEvaluateBlock:a3 completionBlock:a4 completionQueue:0];
}

- (void)setEvaluateBlock:(id)a3
{
}

- (void)setCompletionBlock:(id)a3
{
}

- (OS_dispatch_queue)completionQueue
{
  return self->_completionQueue;
}

- (void)setCompletionQueue:(id)a3
{
}

@end