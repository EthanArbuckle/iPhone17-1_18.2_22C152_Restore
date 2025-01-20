@interface SPKDataDetectorsStoreQuery
+ (unsigned)searchDomain;
- (void)cancel;
- (void)start;
@end

@implementation SPKDataDetectorsStoreQuery

- (void)cancel
{
  v3.receiver = self;
  v3.super_class = (Class)SPKDataDetectorsStoreQuery;
  [(SPKQuery *)&v3 cancel];
  [(SSDataDetectorResultGenerator *)self->_generator cancel];
}

+ (unsigned)searchDomain
{
  return 10;
}

- (void)start
{
  v10.receiver = self;
  v10.super_class = (Class)SPKDataDetectorsStoreQuery;
  [(SPKQuery *)&v10 start];
  if (![(SPKQuery *)self sendEmptyResponseIfNecessary])
  {
    objc_super v3 = [(SPKQuery *)self userQueryString];
    v4 = (void *)[v3 mutableCopy];

    v5 = (SSDataDetectorResultGenerator *)objc_alloc_init(MEMORY[0x263F78DD8]);
    generator = self->_generator;
    self->_generator = v5;

    v7 = self->_generator;
    unint64_t v8 = [(SPKQuery *)self queryId];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __35__SPKDataDetectorsStoreQuery_start__block_invoke;
    v9[3] = &unk_264C77390;
    v9[4] = self;
    [(SSDataDetectorResultGenerator *)v7 getResultSections:v4 queryId:v8 completion:v9];
  }
}

void __35__SPKDataDetectorsStoreQuery_start__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (([*(id *)(a1 + 32) isCanceled] & 1) == 0)
  {
    objc_super v3 = objc_msgSend(objc_alloc(MEMORY[0x263F78D80]), "initWithQueryID:sections:", objc_msgSend(*(id *)(a1 + 32), "queryGroupId"), v5);
    [v3 setTopHitIsIn:1];
    v4 = [*(id *)(a1 + 32) responseHandler];
    ((void (**)(void, void *))v4)[2](v4, v3);
  }
}

- (void).cxx_destruct
{
}

@end