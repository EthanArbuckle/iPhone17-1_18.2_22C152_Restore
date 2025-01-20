@interface SUUILoadResourceOperation
- (SUUIClientContext)clientContext;
- (SUUILoadResourceOperation)initWithResourceRequest:(id)a3;
- (SUUIResourceRequest)resourceRequest;
- (id)_initSUUILoadResourceOperation;
- (id)outputBlock;
- (int64_t)_loadReason;
- (void)_setLoadReason:(int64_t)a3;
- (void)cancel;
- (void)main;
- (void)setClientContext:(id)a3;
- (void)setOutputBlock:(id)a3;
@end

@implementation SUUILoadResourceOperation

- (id)_initSUUILoadResourceOperation
{
  v6.receiver = self;
  v6.super_class = (Class)SUUILoadResourceOperation;
  v2 = [(SUUILoadResourceOperation *)&v6 init];
  if (v2)
  {
    v3 = (NSLock *)objc_alloc_init(MEMORY[0x263F08958]);
    lock = v2->_lock;
    v2->_lock = v3;
  }
  return v2;
}

- (SUUILoadResourceOperation)initWithResourceRequest:(id)a3
{
  id v4 = a3;
  v5 = [(SUUILoadResourceOperation *)self _initSUUILoadResourceOperation];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    request = v5->_request;
    v5->_request = (SUUIResourceRequest *)v6;
  }
  return v5;
}

- (SUUIClientContext)clientContext
{
  [(NSLock *)self->_lock lock];
  v3 = self->_clientContext;
  [(NSLock *)self->_lock unlock];
  return v3;
}

- (id)outputBlock
{
  [(NSLock *)self->_lock lock];
  v3 = (void *)[self->_outputBlock copy];
  [(NSLock *)self->_lock unlock];
  id v4 = _Block_copy(v3);

  return v4;
}

- (SUUIResourceRequest)resourceRequest
{
  return self->_request;
}

- (void)setClientContext:(id)a3
{
  v5 = (SUUIClientContext *)a3;
  [(NSLock *)self->_lock lock];
  if (self->_clientContext != v5) {
    objc_storeStrong((id *)&self->_clientContext, a3);
  }
  [(NSLock *)self->_lock unlock];
}

- (void)setOutputBlock:(id)a3
{
  id v6 = a3;
  [(NSLock *)self->_lock lock];
  if (self->_outputBlock != v6)
  {
    id v4 = (void *)[v6 copy];
    id outputBlock = self->_outputBlock;
    self->_id outputBlock = v4;
  }
  [(NSLock *)self->_lock unlock];
}

- (void)main
{
  v2 = [(SUUILoadResourceOperation *)self outputBlock];
  if (v2)
  {
    id v3 = v2;
    v2[2](v2, 0, 0);
    v2 = (void (**)(void, void, void))v3;
  }
}

- (void)cancel
{
  v2.receiver = self;
  v2.super_class = (Class)SUUILoadResourceOperation;
  [(SUUILoadResourceOperation *)&v2 cancel];
}

- (int64_t)_loadReason
{
  return self->__loadReason;
}

- (void)_setLoadReason:(int64_t)a3
{
  self->__loadReason = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong(&self->_outputBlock, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);
}

@end