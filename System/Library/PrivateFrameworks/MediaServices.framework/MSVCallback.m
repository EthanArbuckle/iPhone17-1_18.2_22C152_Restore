@interface MSVCallback
+ (id)callbackWithQueue:(id)a3 block:(id)a4;
- (OS_dispatch_queue)queue;
- (id)block;
- (void)invoke;
- (void)invokeWithObject:(id)a3;
- (void)setBlock:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation MSVCallback

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (id)block
{
  return self->_block;
}

+ (id)callbackWithQueue:(id)a3 block:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = objc_alloc_init(MSVCallback);
  [(MSVCallback *)v7 setBlock:v6];

  if (v5)
  {
    [(MSVCallback *)v7 setQueue:v5];
  }
  else
  {
    v8 = dispatch_get_global_queue(0, 0);
    [(MSVCallback *)v7 setQueue:v8];
  }
  return v7;
}

- (void)setQueue:(id)a3
{
}

- (void)setBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_block, 0);
}

- (void)invokeWithObject:(id)a3
{
  id v4 = a3;
  if (self->_block)
  {
    id v5 = (void *)MEMORY[0x1A62426F0]();
    queue = self->_queue;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __32__MSVCallback_invokeWithObject___block_invoke;
    v8[3] = &unk_1E5ADAA50;
    id v10 = v5;
    id v9 = v4;
    id v7 = v5;
    dispatch_async(queue, v8);
  }
}

uint64_t __32__MSVCallback_invokeWithObject___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)invoke
{
  id v3 = self->_block;
  if (v3)
  {
    id v4 = (void *)MEMORY[0x1A62426F0](v3, a2);
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __21__MSVCallback_invoke__block_invoke;
    block[3] = &unk_1E5ADAA28;
    id v8 = v4;
    id v6 = v4;
    dispatch_async(queue, block);
  }
}

uint64_t __21__MSVCallback_invoke__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end