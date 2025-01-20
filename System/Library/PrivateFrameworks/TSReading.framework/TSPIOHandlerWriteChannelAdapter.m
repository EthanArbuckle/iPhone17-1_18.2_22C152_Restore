@interface TSPIOHandlerWriteChannelAdapter
- (TSPIOHandlerWriteChannelAdapter)initWithQueue:(id)a3 handler:(id)a4;
- (void)close;
- (void)setError:(id)a3;
- (void)writeData:(id)a3;
@end

@implementation TSPIOHandlerWriteChannelAdapter

- (TSPIOHandlerWriteChannelAdapter)initWithQueue:(id)a3 handler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)TSPIOHandlerWriteChannelAdapter;
  v9 = [(TSPIOHandlerWriteChannelAdapter *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_queue, a3);
    v11 = _Block_copy(v8);
    id handler = v10->_handler;
    v10->_id handler = v11;
  }
  return v10;
}

- (void)writeData:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __45__TSPIOHandlerWriteChannelAdapter_writeData___block_invoke;
  v7[3] = &unk_2646AFAA0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __45__TSPIOHandlerWriteChannelAdapter_writeData___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 16) + 16))();
}

- (void)setError:(id)a3
{
}

- (void)close
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __40__TSPIOHandlerWriteChannelAdapter_close__block_invoke;
  block[3] = &unk_2646AFA00;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __40__TSPIOHandlerWriteChannelAdapter_close__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 16) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong(&self->_handler, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end