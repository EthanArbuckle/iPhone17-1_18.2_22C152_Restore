@interface WFRuntimeRunnableDataSource
+ (id)sharedDataSource;
- (WFRuntimeRunnableDataSource)init;
- (WFRuntimeRunnableDataSourceImpl)impl;
- (void)loadEntriesFor:(Class)a3 parameterKey:(id)a4 limit:(int64_t)a5 collectionIdentifier:(id)a6 completionHandler:(id)a7;
- (void)setImpl:(id)a3;
@end

@implementation WFRuntimeRunnableDataSource

- (void).cxx_destruct
{
}

- (void)setImpl:(id)a3
{
}

- (WFRuntimeRunnableDataSourceImpl)impl
{
  return self->_impl;
}

- (void)loadEntriesFor:(Class)a3 parameterKey:(id)a4 limit:(int64_t)a5 collectionIdentifier:(id)a6 completionHandler:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a4;
  id v15 = [(WFRuntimeRunnableDataSource *)self impl];
  [v15 loadEntriesFor:a3 parameterKey:v14 collectionIdentifier:v13 limit:a5 completionHandler:v12];
}

- (WFRuntimeRunnableDataSource)init
{
  v7.receiver = self;
  v7.super_class = (Class)WFRuntimeRunnableDataSource;
  v2 = [(WFRuntimeRunnableDataSource *)&v7 init];
  if (v2)
  {
    v3 = objc_alloc_init(WFRuntimeRunnableDataSourceImpl);
    impl = v2->_impl;
    v2->_impl = v3;

    v5 = v2;
  }

  return v2;
}

+ (id)sharedDataSource
{
  if (sharedDataSource_onceToken != -1) {
    dispatch_once(&sharedDataSource_onceToken, &__block_literal_global_45698);
  }
  v2 = (void *)sharedDataSource_dataSource;
  return v2;
}

void __47__WFRuntimeRunnableDataSource_sharedDataSource__block_invoke()
{
  v0 = objc_alloc_init(WFRuntimeRunnableDataSource);
  v1 = (void *)sharedDataSource_dataSource;
  sharedDataSource_dataSource = (uint64_t)v0;
}

@end