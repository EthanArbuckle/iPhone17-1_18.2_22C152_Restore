@interface _PASSimpleCoalescingTimer
- (_PASSimpleCoalescingTimer)initWithQueue:(id)a3 leewaySeconds:(double)a4 operation:(id)a5;
- (_PASSimpleCoalescingTimer)initWithQueue:(id)a3 operation:(id)a4;
- (void)cancelPendingOperations;
- (void)runAfterDelaySeconds:(double)a3 coalescingBehavior:(unsigned __int8)a4;
- (void)runAfterStrictDelaySeconds:(double)a3;
- (void)runImmediately;
@end

@implementation _PASSimpleCoalescingTimer

- (_PASSimpleCoalescingTimer)initWithQueue:(id)a3 leewaySeconds:(double)a4 operation:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)_PASSimpleCoalescingTimer;
  v10 = [(_PASSimpleCoalescingTimer *)&v17 init];
  if (v10)
  {
    v11 = [_PASCoalescingTimer alloc];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __67___PASSimpleCoalescingTimer_initWithQueue_leewaySeconds_operation___block_invoke_2;
    v15[3] = &unk_1E5AEB188;
    id v16 = v9;
    uint64_t v12 = [(_PASCoalescingTimer *)v11 initWithQueue:v8 leewaySeconds:&__block_literal_global_59 coalesceData:v15 operation:a4];
    timer = v10->_timer;
    v10->_timer = (_PASCoalescingTimer *)v12;
  }
  return v10;
}

- (void)runAfterDelaySeconds:(double)a3 coalescingBehavior:(unsigned __int8)a4
{
}

- (void).cxx_destruct
{
}

- (void)cancelPendingOperations
{
}

- (void)runAfterStrictDelaySeconds:(double)a3
{
}

- (void)runImmediately
{
}

- (_PASSimpleCoalescingTimer)initWithQueue:(id)a3 operation:(id)a4
{
  return [(_PASSimpleCoalescingTimer *)self initWithQueue:a3 leewaySeconds:a4 operation:0.02];
}

@end