@interface SKUILoadResourceOperation
- (SKUIClientContext)clientContext;
- (SKUILoadResourceOperation)initWithResourceRequest:(id)a3;
- (SKUIResourceRequest)resourceRequest;
- (id)_initSKUILoadResourceOperation;
- (id)outputBlock;
- (int64_t)_loadReason;
- (void)_initSKUILoadResourceOperation;
- (void)_setLoadReason:(int64_t)a3;
- (void)cancel;
- (void)main;
- (void)setClientContext:(id)a3;
- (void)setOutputBlock:(id)a3;
@end

@implementation SKUILoadResourceOperation

- (id)_initSKUILoadResourceOperation
{
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    -[SKUILoadResourceOperation _initSKUILoadResourceOperation]();
  }
  v7.receiver = self;
  v7.super_class = (Class)SKUILoadResourceOperation;
  v3 = [(SKUILoadResourceOperation *)&v7 init];
  if (v3)
  {
    v4 = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
    lock = v3->_lock;
    v3->_lock = v4;
  }
  return v3;
}

- (SKUILoadResourceOperation)initWithResourceRequest:(id)a3
{
  id v4 = a3;
  v5 = [(SKUILoadResourceOperation *)self _initSKUILoadResourceOperation];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    request = v5->_request;
    v5->_request = (SKUIResourceRequest *)v6;
  }
  return v5;
}

- (SKUIClientContext)clientContext
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

- (SKUIResourceRequest)resourceRequest
{
  return self->_request;
}

- (void)setClientContext:(id)a3
{
  v5 = (SKUIClientContext *)a3;
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
  v2 = [(SKUILoadResourceOperation *)self outputBlock];
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
  v2.super_class = (Class)SKUILoadResourceOperation;
  [(SKUILoadResourceOperation *)&v2 cancel];
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

- (void)_initSKUILoadResourceOperation
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUILoadResourceOperation _initSKUILoadResourceOperation]";
}

@end