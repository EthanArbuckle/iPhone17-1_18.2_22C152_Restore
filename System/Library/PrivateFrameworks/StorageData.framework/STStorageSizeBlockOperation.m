@interface STStorageSizeBlockOperation
+ (id)operationWithSizeBlock:(id)a3;
- (STStorageApp)app;
- (id)sizeBlock;
- (void)main;
- (void)setApp:(id)a3;
- (void)setSizeBlock:(id)a3;
@end

@implementation STStorageSizeBlockOperation

+ (id)operationWithSizeBlock:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(STStorageSizeBlockOperation);
  [(STStorageSizeBlockOperation *)v4 setSizeBlock:v3];

  return v4;
}

- (void)main
{
  id v3 = [(STStorageSizeBlockOperation *)self app];
  sizeBlock = (uint64_t (**)(void))self->_sizeBlock;
  id v7 = 0;
  uint64_t v5 = sizeBlock[2]();
  id v6 = v7;
  [(STStorageOperation *)self setError:v6];
  [(STStorageSizeOperation *)self setSize:v5];
}

- (STStorageApp)app
{
  return (STStorageApp *)objc_getProperty(self, a2, 264, 1);
}

- (void)setApp:(id)a3
{
}

- (id)sizeBlock
{
  return objc_getProperty(self, a2, 272, 1);
}

- (void)setSizeBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_sizeBlock, 0);

  objc_storeStrong((id *)&self->_app, 0);
}

@end