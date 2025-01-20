@interface TLOperation
+ (unint64_t)relativePriority;
- (NSError)error;
- (TLOperation)init;
- (TLTimelineDataSource)dataSource;
- (id)operationCompletionBlock;
- (void)setDataSource:(id)a3;
- (void)setOperationCompletionBlock:(id)a3;
@end

@implementation TLOperation

+ (unint64_t)relativePriority
{
  return 0;
}

- (TLOperation)init
{
  v8.receiver = self;
  v8.super_class = (Class)TLOperation;
  v2 = [(TLOperation *)&v8 init];
  if (v2)
  {
    objc_initWeak(&location, v2);
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __19__TLOperation_init__block_invoke;
    v5[3] = &unk_264477F68;
    objc_copyWeak(&v6, &location);
    v4.receiver = v2;
    v4.super_class = (Class)TLOperation;
    [(TLOperation *)&v4 setCompletionBlock:v5];
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __19__TLOperation_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained error];
  if ([WeakRetained isCancelled])
  {
    uint64_t v2 = [MEMORY[0x263F087E8] errorWithDomain:@"TLOperationDomain" code:400 userInfo:&unk_26CE8DD38];

    v1 = (void *)v2;
  }
  v3 = [WeakRetained operationCompletionBlock];

  if (v3)
  {
    objc_super v4 = [WeakRetained operationCompletionBlock];
    ((void (**)(void, id, void *))v4)[2](v4, WeakRetained, v1);
  }
  [WeakRetained setOperationCompletionBlock:0];
}

- (TLTimelineDataSource)dataSource
{
  return (TLTimelineDataSource *)objc_getProperty(self, a2, 248, 1);
}

- (void)setDataSource:(id)a3
{
}

- (id)operationCompletionBlock
{
  return objc_getProperty(self, a2, 256, 1);
}

- (void)setOperationCompletionBlock:(id)a3
{
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 264, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong(&self->_operationCompletionBlock, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
}

@end