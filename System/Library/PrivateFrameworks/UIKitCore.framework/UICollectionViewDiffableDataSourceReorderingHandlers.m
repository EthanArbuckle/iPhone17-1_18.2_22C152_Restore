@interface UICollectionViewDiffableDataSourceReorderingHandlers
- (UICollectionViewDiffableDataSourceReorderingHandlers)initWithCanReorderItemHandler:(id)a3 willReorderItemHandler:(id)a4 didReorderItemHandler:(id)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (void)canReorderItemHandler;
- (void)didReorderHandler;
- (void)setCanReorderItemHandler:(void *)canReorderItemHandler;
- (void)setDidReorderHandler:(void *)didReorderHandler;
- (void)setWillReorderHandler:(void *)willReorderHandler;
- (void)willReorderHandler;
@end

@implementation UICollectionViewDiffableDataSourceReorderingHandlers

- (void)setDidReorderHandler:(void *)didReorderHandler
{
}

- (void)setCanReorderItemHandler:(void *)canReorderItemHandler
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  v5 = [(UICollectionViewDiffableDataSourceReorderingHandlers *)self canReorderItemHandler];
  v6 = (void *)[v5 copy];
  v7 = [(UICollectionViewDiffableDataSourceReorderingHandlers *)self willReorderHandler];
  v8 = (void *)[v7 copy];
  v9 = [(UICollectionViewDiffableDataSourceReorderingHandlers *)self didReorderHandler];
  v10 = (void *)[v9 copy];
  v11 = (void *)[v4 initWithCanReorderItemHandler:v6 willReorderItemHandler:v8 didReorderItemHandler:v10];

  return v11;
}

- (void)canReorderItemHandler
{
  return self->_canReorderItemHandler;
}

- (void)willReorderHandler
{
  return self->_willReorderHandler;
}

- (UICollectionViewDiffableDataSourceReorderingHandlers)initWithCanReorderItemHandler:(id)a3 willReorderItemHandler:(id)a4 didReorderItemHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)UICollectionViewDiffableDataSourceReorderingHandlers;
  v11 = [(UICollectionViewDiffableDataSourceReorderingHandlers *)&v19 init];
  if (v11)
  {
    v12 = _Block_copy(v8);
    id canReorderItemHandler = v11->_canReorderItemHandler;
    v11->_id canReorderItemHandler = v12;

    v14 = _Block_copy(v9);
    id willReorderHandler = v11->_willReorderHandler;
    v11->_id willReorderHandler = v14;

    v16 = _Block_copy(v10);
    id didReorderHandler = v11->_didReorderHandler;
    v11->_id didReorderHandler = v16;
  }
  return v11;
}

- (void)didReorderHandler
{
  return self->_didReorderHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_didReorderHandler, 0);
  objc_storeStrong(&self->_willReorderHandler, 0);
  objc_storeStrong(&self->_canReorderItemHandler, 0);
}

- (void)setWillReorderHandler:(void *)willReorderHandler
{
}

@end