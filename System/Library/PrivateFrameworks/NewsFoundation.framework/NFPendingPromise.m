@interface NFPendingPromise
- (NFPendingPromise)init;
- (NFPromise)promise;
- (id)reject;
- (id)resolve;
- (void)setPromise:(id)a3;
- (void)setReject:(id)a3;
- (void)setResolve:(id)a3;
@end

@implementation NFPendingPromise

- (NFPendingPromise)init
{
  v10.receiver = self;
  v10.super_class = (Class)NFPendingPromise;
  v2 = [(NFPendingPromise *)&v10 init];
  if (v2)
  {
    v3 = [NFPromise alloc];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __24__NFPendingPromise_init__block_invoke;
    v8[3] = &unk_264485960;
    v4 = v2;
    v9 = v4;
    uint64_t v5 = [(NFPromise *)v3 initWithResolver:v8];
    promise = v4->_promise;
    v4->_promise = (NFPromise *)v5;
  }
  return v2;
}

void __24__NFPendingPromise_init__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = MEMORY[0x223C1A400](a2);
  uint64_t v7 = *(void *)(a1 + 32);
  v8 = *(void **)(v7 + 16);
  *(void *)(v7 + 16) = v6;

  uint64_t v9 = MEMORY[0x223C1A400](v5);
  uint64_t v10 = *(void *)(a1 + 32);
  v11 = *(void **)(v10 + 24);
  *(void *)(v10 + 24) = v9;
}

- (NFPromise)promise
{
  return self->_promise;
}

- (void)setPromise:(id)a3
{
}

- (id)resolve
{
  return self->_resolve;
}

- (void)setResolve:(id)a3
{
}

- (id)reject
{
  return self->_reject;
}

- (void)setReject:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_reject, 0);
  objc_storeStrong(&self->_resolve, 0);
  objc_storeStrong((id *)&self->_promise, 0);
}

@end