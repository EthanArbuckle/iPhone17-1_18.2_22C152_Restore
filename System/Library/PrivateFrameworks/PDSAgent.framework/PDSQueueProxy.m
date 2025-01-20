@interface PDSQueueProxy
- (BOOL)conformsToProtocol:(id)a3;
- (BOOL)respondsToSelector:(SEL)a3;
- (OS_dispatch_queue)queue;
- (PDSQueueProxy)initWithTarget:(id)a3 queue:(id)a4 mode:(unint64_t)a5;
- (id)methodSignatureForSelector:(SEL)a3;
- (id)target;
- (unint64_t)mode;
- (void)forwardInvocation:(id)a3;
- (void)setMode:(unint64_t)a3;
- (void)setQueue:(id)a3;
- (void)setTarget:(id)a3;
@end

@implementation PDSQueueProxy

- (PDSQueueProxy)initWithTarget:(id)a3 queue:(id)a4 mode:(unint64_t)a5
{
  id v10 = a3;
  id v11 = a4;
  v12 = v11;
  if (v10)
  {
    if (v11) {
      goto LABEL_3;
    }
LABEL_7:
    v15 = [MEMORY[0x263F08690] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"PDSDaemonRemoteVendor.m", 28, @"Invalid parameter not satisfying: %@", @"queue" object file lineNumber description];

    if (!self) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  v14 = [MEMORY[0x263F08690] currentHandler];
  [v14 handleFailureInMethod:a2, self, @"PDSDaemonRemoteVendor.m", 27, @"Invalid parameter not satisfying: %@", @"target" object file lineNumber description];

  if (!v12) {
    goto LABEL_7;
  }
LABEL_3:
  if (self)
  {
LABEL_4:
    objc_storeStrong(&self->_target, a3);
    objc_storeStrong((id *)&self->_queue, a4);
    self->_mode = a5;
  }
LABEL_5:

  return self;
}

- (BOOL)conformsToProtocol:(id)a3
{
  id v4 = a3;
  v5 = [(PDSQueueProxy *)self target];
  char v6 = [v5 conformsToProtocol:v4];

  return v6;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  v3 = [(PDSQueueProxy *)self target];
  char v4 = objc_opt_respondsToSelector();

  return v4 & 1;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  char v4 = [(PDSQueueProxy *)self target];
  v5 = [v4 methodSignatureForSelector:a3];

  return v5;
}

- (void)forwardInvocation:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(PDSQueueProxy *)self mode];
  if (!v5)
  {
    char v6 = [(PDSQueueProxy *)self queue];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __35__PDSQueueProxy_forwardInvocation___block_invoke_2;
    v8[3] = &unk_2645C8C50;
    v7 = (id *)v9;
    v9[0] = v4;
    v9[1] = self;
    dispatch_sync(v6, v8);
    goto LABEL_5;
  }
  if (v5 == 1)
  {
    [v4 retainArguments];
    char v6 = [(PDSQueueProxy *)self queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __35__PDSQueueProxy_forwardInvocation___block_invoke;
    block[3] = &unk_2645C8C50;
    v7 = (id *)v11;
    v11[0] = v4;
    v11[1] = self;
    dispatch_async(v6, block);
LABEL_5:
  }
}

void __35__PDSQueueProxy_forwardInvocation___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [*(id *)(a1 + 40) target];
  [v1 invokeWithTarget:v2];
}

void __35__PDSQueueProxy_forwardInvocation___block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [*(id *)(a1 + 40) target];
  [v1 invokeWithTarget:v2];
}

- (id)target
{
  return self->_target;
}

- (void)setTarget:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (unint64_t)mode
{
  return self->_mode;
}

- (void)setMode:(unint64_t)a3
{
  self->_mode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_target, 0);
}

@end