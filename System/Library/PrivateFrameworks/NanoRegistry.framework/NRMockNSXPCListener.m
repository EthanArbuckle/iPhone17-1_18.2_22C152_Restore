@interface NRMockNSXPCListener
- (NRMockNSXPCListener)initWithMachServiceName:(id)a3;
- (NRNSXPCListenerDelegate)delegate;
- (void)dealloc;
- (void)invalidate;
- (void)resume;
- (void)setDelegate:(id)a3;
- (void)suspend;
@end

@implementation NRMockNSXPCListener

- (NRMockNSXPCListener)initWithMachServiceName:(id)a3
{
  id v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)NRMockNSXPCListener;
  v6 = [(NRMockNSXPCListener *)&v20 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_name, a3);
    id v8 = [NSString stringWithFormat:@"com.apple.nanoregistry.mockxpclistener.%@", v5];
    dispatch_queue_t v9 = dispatch_queue_create((const char *)[v8 UTF8String], 0);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v9;

    [(NRMockNSXPCListener *)v7 suspend];
    v11 = +[NRMockXPCStuff sharedInstance];
    v12 = v11;
    if (v11) {
      v13 = v11[2];
    }
    else {
      v13 = 0;
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __47__NRMockNSXPCListener_initWithMachServiceName___block_invoke;
    block[3] = &unk_1E5B00280;
    id v17 = v11;
    id v18 = v5;
    v19 = v7;
    id v14 = v12;
    dispatch_sync(v13, block);
  }
  return v7;
}

uint64_t __47__NRMockNSXPCListener_initWithMachServiceName___block_invoke(void *a1)
{
  v1 = (void *)a1[4];
  if (v1) {
    v1 = (void *)v1[1];
  }
  return [v1 setObject:a1[6] forKeyedSubscript:a1[5]];
}

- (void)resume
{
  isa = +[NRMockXPCStuff sharedInstance];
  v4 = isa;
  if (isa) {
    isa = isa[2].isa;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __29__NRMockNSXPCListener_resume__block_invoke;
  block[3] = &unk_1E5B00230;
  void block[4] = self;
  dispatch_sync(isa, block);
}

void __29__NRMockNSXPCListener_resume__block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 8) = 0;
}

- (void)suspend
{
  isa = +[NRMockXPCStuff sharedInstance];
  v4 = isa;
  if (isa) {
    isa = isa[2].isa;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __30__NRMockNSXPCListener_suspend__block_invoke;
  block[3] = &unk_1E5B00230;
  void block[4] = self;
  dispatch_sync(isa, block);
}

void __30__NRMockNSXPCListener_suspend__block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 8) = 1;
  dispatch_suspend(*(dispatch_object_t *)(*(void *)(a1 + 32) + 32));
}

- (void)invalidate
{
  v3 = +[NRMockXPCStuff sharedInstance];
  if (v3) {
    v4 = v3[2];
  }
  else {
    v4 = 0;
  }
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __33__NRMockNSXPCListener_invalidate__block_invoke;
  v6[3] = &unk_1E5B002A8;
  v6[4] = self;
  id v7 = v3;
  id v5 = v3;
  dispatch_sync(v4, v6);
}

uint64_t __33__NRMockNSXPCListener_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v2 + 8))
  {
    *(unsigned char *)(v2 + 8) = 1;
    dispatch_suspend(*(dispatch_object_t *)(*(void *)(a1 + 32) + 32));
  }
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    v4 = *(void **)(v3 + 8);
  }
  else {
    v4 = 0;
  }
  uint64_t result = [v4 removeObjectForKey:*(void *)(*(void *)(a1 + 32) + 24)];
  *(unsigned char *)(*(void *)(a1 + 32) + 9) = 1;
  return result;
}

- (void)dealloc
{
  isa = +[NRMockXPCStuff sharedInstance];
  v4 = isa;
  if (isa) {
    isa = isa[2].isa;
  }
  dispatch_sync(isa, &__block_literal_global_237);

  v5.receiver = self;
  v5.super_class = (Class)NRMockNSXPCListener;
  [(NRMockNSXPCListener *)&v5 dealloc];
}

void __60__NRMockNSXPCListener_serverConnectionWithClientConnection___block_invoke(void *a1)
{
  obj = [[NRMockServerNSXPCConnection alloc] initWithListener:a1[4] clientConnection:a1[5]];
  if (objc_msgSend(*(id *)(a1[4] + 16), "listener:shouldAcceptNewConnection:")) {
    objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), obj);
  }
}

- (NRNSXPCListenerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_delegate, 0);
}

@end