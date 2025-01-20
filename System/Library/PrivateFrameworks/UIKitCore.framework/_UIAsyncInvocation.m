@interface _UIAsyncInvocation
+ (_UIAsyncInvocation)invocationWithBlock:(id)a3;
+ (id)emptyInvocation;
- (id)invoke;
- (void)dealloc;
@end

@implementation _UIAsyncInvocation

+ (_UIAsyncInvocation)invocationWithBlock:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(_UIAsyncInvocation);
  v5 = v4;
  if (v4)
  {
    atomic_store(0, (unint64_t *)&v4->_invokeCallCount);
    atomic_store(0, (unsigned __int8 *)&v4->_invocationBlockHasBeenCalled);
    atomic_store(0, (unint64_t *)&v4->_observer);
    uint64_t v6 = [v3 copy];
    id invocationBlock = v5->_invocationBlock;
    v5->_id invocationBlock = (id)v6;

    v8 = v5;
  }

  return v5;
}

- (id)invoke
{
  atomic_fetch_add(&self->_invokeCallCount, 1uLL);
  p_observer = &self->_observer;
  if (!atomic_load((unint64_t *)&self->_observer))
  {
    v5 = objc_alloc_init(_UIAsyncInvocationObserver);
    uint64_t v6 = 0;
    atomic_compare_exchange_strong((atomic_ullong *volatile)p_observer, (unint64_t *)&v6, (unint64_t)v5);
    if (v6) {
      CFRelease(v5);
    }
  }
  if ((atomic_exchange((atomic_uchar *volatile)&self->_invocationBlockHasBeenCalled, 1u) & 1) == 0)
  {
    v7 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __28___UIAsyncInvocation_invoke__block_invoke;
    block[3] = &unk_1E52D9F70;
    block[4] = self;
    dispatch_async(v7, block);
  }
  v8 = (void *)atomic_load((unint64_t *)&self->_observer);
  id v9 = v8;
  atomic_fetch_add(&self->_invokeCallCount, 0xFFFFFFFFFFFFFFFFLL);
  return v9;
}

- (void)dealloc
{
  id v3 = (const void *)atomic_load((unint64_t *)&self->_observer);
  if (v3)
  {
    unint64_t v5 = atomic_load((unint64_t *)&self->_invokeCallCount);
    CFRelease(v3);
    if (v5)
    {
      uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"UIAsyncInvocation.m", 77, @"Attempting to deallocate _UIAsyncInvocation<%p> while still invoking!  invoke count: %li", self, v5);
    }
  }
  v7.receiver = self;
  v7.super_class = (Class)_UIAsyncInvocation;
  [(_UIAsyncInvocation *)&v7 dealloc];
}

+ (id)emptyInvocation
{
  v2 = objc_opt_class();
  return (id)[v2 invocationWithBlock:&__block_literal_global_623];
}

- (void).cxx_destruct
{
}

@end