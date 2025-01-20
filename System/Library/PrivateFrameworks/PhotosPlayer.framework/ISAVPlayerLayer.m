@interface ISAVPlayerLayer
- (ISAVPlayerLayer)init;
- (id)readyForDisplayChangeHandler;
- (void)dealloc;
- (void)deferredDealloc;
- (void)didChangeValueForKey:(id)a3;
- (void)setBounds:(CGRect)a3;
- (void)setPlayer:(id)a3;
- (void)setReadyForDisplayChangeHandler:(id)a3;
- (void)setWrappedPlayer:(id)a3;
@end

@implementation ISAVPlayerLayer

- (void)setReadyForDisplayChangeHandler:(id)a3
{
}

- (void)didChangeValueForKey:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)ISAVPlayerLayer;
  id v4 = a3;
  [(ISAVPlayerLayer *)&v8 didChangeValueForKey:v4];
  int v5 = objc_msgSend(v4, "isEqualToString:", @"readyForDisplay", v8.receiver, v8.super_class);

  if (v5)
  {
    v6 = [(ISAVPlayerLayer *)self readyForDisplayChangeHandler];

    if (v6)
    {
      v7 = [(ISAVPlayerLayer *)self readyForDisplayChangeHandler];
      v7[2]();
    }
  }
}

- (void)dealloc
{
  v3 = [(ISAVPlayerLayer *)self player];
  id v4 = +[ISDeferredDealloc sharedInstance];
  [v4 _performDeferredDealloc:v3];

  v5.receiver = self;
  v5.super_class = (Class)ISAVPlayerLayer;
  [(ISAVPlayerLayer *)&v5 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_readyForDisplayChangeHandler, 0);

  objc_storeStrong((id *)&self->_isolationQueue, 0);
}

- (ISAVPlayerLayer)init
{
  v6.receiver = self;
  v6.super_class = (Class)ISAVPlayerLayer;
  v2 = [(ISAVPlayerLayer *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.photosplayer.avplayerlayer.isolation", 0);
    isolationQueue = v2->_isolationQueue;
    v2->_isolationQueue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

- (id)readyForDisplayChangeHandler
{
  return self->_readyForDisplayChangeHandler;
}

- (void)setPlayer:(id)a3
{
  id v4 = a3;
  isolationQueue = self->_isolationQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __29__ISAVPlayerLayer_setPlayer___block_invoke;
  v7[3] = &unk_1E6BECF48;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(isolationQueue, v7);
}

void __29__ISAVPlayerLayer_setPlayer___block_invoke(uint64_t a1)
{
  v12.receiver = *(id *)(a1 + 32);
  v12.super_class = (Class)ISAVPlayerLayer;
  v2 = objc_msgSendSuper2(&v12, sel_player);
  dispatch_queue_t v3 = v2;
  if (v2)
  {
    id v4 = [v2 dispatchQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __29__ISAVPlayerLayer_setPlayer___block_invoke_2;
    block[3] = &unk_1E6BECD80;
    block[4] = *(void *)(a1 + 32);
    dispatch_sync(v4, block);

    dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
    id v6 = [v3 dispatchQueue];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __29__ISAVPlayerLayer_setPlayer___block_invoke_3;
    v9[3] = &unk_1E6BECD80;
    dispatch_semaphore_t v10 = v5;
    v7 = v5;
    dispatch_async(v6, v9);

    dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  }
  id v8 = *(void **)(a1 + 40);
  if (v8) {
    [v8 attachToPlayerLayerIfNeeded:*(void *)(a1 + 32)];
  }
}

id __29__ISAVPlayerLayer_setPlayer___block_invoke_2(uint64_t a1)
{
  v2.receiver = *(id *)(a1 + 32);
  v2.super_class = (Class)ISAVPlayerLayer;
  return objc_msgSendSuper2(&v2, sel_setPlayer_, 0);
}

intptr_t __29__ISAVPlayerLayer_setPlayer___block_invoke_3(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)setWrappedPlayer:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)ISAVPlayerLayer;
  [(ISAVPlayerLayer *)&v3 setPlayer:a3];
}

- (void)deferredDealloc
{
  id v3 = +[ISDeferredDealloc sharedInstance];
  [v3 _performDeferredDealloc:self];
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(ISAVPlayerLayer *)self bounds];
  v14.origin.double x = v8;
  v14.origin.double y = v9;
  v14.size.double width = v10;
  v14.size.double height = v11;
  v13.origin.double x = x;
  v13.origin.double y = y;
  v13.size.double width = width;
  v13.size.double height = height;
  if (!CGRectEqualToRect(v13, v14))
  {
    v12.receiver = self;
    v12.super_class = (Class)ISAVPlayerLayer;
    -[ISAVPlayerLayer setBounds:](&v12, sel_setBounds_, x, y, width, height);
  }
}

@end