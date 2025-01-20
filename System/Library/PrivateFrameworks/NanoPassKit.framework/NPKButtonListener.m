@interface NPKButtonListener
- (NPKButtonListener)initWithHandlerQueue:(id)a3;
- (OS_dispatch_queue)handlerQueue;
- (id)_handlerQueue_buttonHandler;
- (id)buttonHandler;
- (void)setButtonHandler:(id)a3;
- (void)setHandlerQueue:(id)a3;
@end

@implementation NPKButtonListener

- (NPKButtonListener)initWithHandlerQueue:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NPKButtonListener;
  v6 = [(NPKButtonListener *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_handlerQueue, a3);
  }

  return v7;
}

- (void)setButtonHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(NPKButtonListener *)self handlerQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __38__NPKButtonListener_setButtonHandler___block_invoke;
  v7[3] = &unk_2644D2E58;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __38__NPKButtonListener_setButtonHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 8);
  *(void *)(v3 + 8) = v2;
}

- (id)_handlerQueue_buttonHandler
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_handlerQueue);
  uint64_t v3 = (void *)MEMORY[0x223C37380](self->_buttonHandler);
  return v3;
}

- (id)buttonHandler
{
  return self->_buttonHandler;
}

- (OS_dispatch_queue)handlerQueue
{
  return self->_handlerQueue;
}

- (void)setHandlerQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handlerQueue, 0);
  objc_storeStrong(&self->_buttonHandler, 0);
}

@end