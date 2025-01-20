@interface ISStoreServicesRequestOperation
- (ISStoreServicesRequestOperation)initWithRequest:(id)a3;
- (SSRequest)request;
- (void)cancel;
- (void)dealloc;
- (void)run;
@end

@implementation ISStoreServicesRequestOperation

- (ISStoreServicesRequestOperation)initWithRequest:(id)a3
{
  if (!a3) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"Invalid request"];
  }
  v7.receiver = self;
  v7.super_class = (Class)ISStoreServicesRequestOperation;
  v5 = [(ISOperation *)&v7 init];
  if (v5) {
    v5->_request = (SSRequest *)a3;
  }
  return v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)ISStoreServicesRequestOperation;
  [(ISStoreServicesRequestOperation *)&v3 dealloc];
}

- (SSRequest)request
{
  [(ISOperation *)self lock];
  objc_super v3 = self->_request;
  [(ISOperation *)self unlock];
  return v3;
}

- (void)cancel
{
  [(SSRequest *)[(ISStoreServicesRequestOperation *)self request] cancel];
  v3.receiver = self;
  v3.super_class = (Class)ISStoreServicesRequestOperation;
  [(ISOperation *)&v3 cancel];
}

- (void)run
{
  objc_super v3 = dispatch_semaphore_create(0);
  request = self->_request;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __38__ISStoreServicesRequestOperation_run__block_invoke;
  v5[3] = &unk_2642616F0;
  v5[4] = self;
  v5[5] = v3;
  [(SSRequest *)request startWithCompletionBlock:v5];
  dispatch_semaphore_wait(v3, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_release(v3);
}

intptr_t __38__ISStoreServicesRequestOperation_run__block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setError:a2];
  [*(id *)(a1 + 32) setSuccess:a2 != 0];
  v4 = *(NSObject **)(a1 + 40);

  return dispatch_semaphore_signal(v4);
}

@end