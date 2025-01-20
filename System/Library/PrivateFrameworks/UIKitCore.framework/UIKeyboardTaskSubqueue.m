@interface UIKeyboardTaskSubqueue
+ (UIKeyboardTaskSubqueue)subqueueWithExecutionContext:(id)a3;
- (UIKeyboardTaskSubqueue)initWithExecutionContext:(id)a3;
- (void)dispatchAsync:(id)a3;
- (void)dispatchAsync:(id)a3 breadcrumb:(id)a4;
- (void)returnExecutionToParentQueue;
@end

@implementation UIKeyboardTaskSubqueue

+ (UIKeyboardTaskSubqueue)subqueueWithExecutionContext:(id)a3
{
  id v3 = a3;
  v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithExecutionContext:v3];

  return (UIKeyboardTaskSubqueue *)v4;
}

- (UIKeyboardTaskSubqueue)initWithExecutionContext:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)UIKeyboardTaskSubqueue;
  v6 = [(UIKeyboardTaskSubqueue *)&v11 init];
  if (v6)
  {
    v7 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.UIKit.UIKeyboardTaskSubqueue.Internal", v7);
    internalQueue = v6->_internalQueue;
    v6->_internalQueue = (OS_dispatch_queue *)v8;

    objc_storeStrong((id *)&v6->_context, a3);
  }

  return v6;
}

- (void)dispatchAsync:(id)a3
{
  id v4 = a3;
  _UIKeyboardTaskBreadcrumbEmpty();
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [(UIKeyboardTaskSubqueue *)self dispatchAsync:v4 breadcrumb:v5];
}

- (void)dispatchAsync:(id)a3 breadcrumb:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    internalQueue = self->_internalQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __51__UIKeyboardTaskSubqueue_dispatchAsync_breadcrumb___block_invoke;
    block[3] = &unk_1E52E45C8;
    block[4] = self;
    id v10 = v6;
    id v11 = v7;
    dispatch_async(internalQueue, block);
  }
}

void __51__UIKeyboardTaskSubqueue_dispatchAsync_breadcrumb___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(void **)(v1 + 16);
  if (v2)
  {
    id v4 = *(NSObject **)(v1 + 8);
    id v5 = v2;
    dispatch_suspend(v4);
    id v6 = *(void **)(*(void *)(a1 + 32) + 16);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __51__UIKeyboardTaskSubqueue_dispatchAsync_breadcrumb___block_invoke_2;
    v8[3] = &unk_1E52E3B88;
    id v7 = *(id *)(a1 + 40);
    v8[4] = *(void *)(a1 + 32);
    id v9 = v7;
    [v6 transferExecutionToMainThreadWithTask:v8 breadcrumb:*(void *)(a1 + 48)];
  }
}

void __51__UIKeyboardTaskSubqueue_dispatchAsync_breadcrumb___block_invoke_2(uint64_t a1)
{
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  v2 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  dispatch_resume(v2);
}

- (void)returnExecutionToParentQueue
{
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__UIKeyboardTaskSubqueue_returnExecutionToParentQueue__block_invoke;
  block[3] = &unk_1E52D9F70;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

void __54__UIKeyboardTaskSubqueue_returnExecutionToParentQueue__block_invoke(uint64_t a1)
{
  id v2 = *(id *)(*(void *)(a1 + 32) + 16);
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 16);
  *(void *)(v3 + 16) = 0;

  if (v2)
  {
    dispatch_suspend(*(dispatch_object_t *)(*(void *)(a1 + 32) + 8));
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __54__UIKeyboardTaskSubqueue_returnExecutionToParentQueue__block_invoke_2;
    v5[3] = &unk_1E52E34C8;
    v5[4] = *(void *)(a1 + 32);
    [v2 transferExecutionToMainThreadWithTask:v5];
  }
}

void __54__UIKeyboardTaskSubqueue_returnExecutionToParentQueue__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  [v3 returnExecutionToParent];

  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  dispatch_resume(v4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
}

@end