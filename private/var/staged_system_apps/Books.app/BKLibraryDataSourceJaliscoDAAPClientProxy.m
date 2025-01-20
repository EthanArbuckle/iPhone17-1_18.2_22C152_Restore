@interface BKLibraryDataSourceJaliscoDAAPClientProxy
+ (id)sharedproxy;
- (BKLibraryDataSourceJaliscoDAAPClientProxy)init;
- (NSMutableArray)dataSources;
- (void)clientDetectedPredicateChange:(id)a3;
- (void)clientDetectedStoreChange:(id)a3;
- (void)registerDataSource:(id)a3;
- (void)setDataSources:(id)a3;
- (void)unregisterDataSource:(id)a3;
@end

@implementation BKLibraryDataSourceJaliscoDAAPClientProxy

- (void)registerDataSource:(id)a3
{
  id v4 = a3;
  id v5 = [(BKLibraryDataSourceJaliscoDAAPClientProxy *)self dataSources];
  [v5 addObject:v4];
}

- (NSMutableArray)dataSources
{
  return self->_dataSources;
}

+ (id)sharedproxy
{
  if (qword_100B4A698[0] != -1) {
    dispatch_once(qword_100B4A698, &stru_100A4BFE0);
  }
  v2 = (void *)qword_100B4A690;

  return v2;
}

- (BKLibraryDataSourceJaliscoDAAPClientProxy)init
{
  v6.receiver = self;
  v6.super_class = (Class)BKLibraryDataSourceJaliscoDAAPClientProxy;
  v2 = [(BKLibraryDataSourceJaliscoDAAPClientProxy *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    dataSources = v2->_dataSources;
    v2->_dataSources = (NSMutableArray *)v3;
  }
  return v2;
}

- (void)unregisterDataSource:(id)a3
{
  id v4 = a3;
  id v5 = [(BKLibraryDataSourceJaliscoDAAPClientProxy *)self dataSources];
  [v5 removeObject:v4];
}

- (void)clientDetectedStoreChange:(id)a3
{
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = [(BKLibraryDataSourceJaliscoDAAPClientProxy *)self dataSources];
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * (void)v9) clientDetectedStoreChange:v4];
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)clientDetectedPredicateChange:(id)a3
{
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = [(BKLibraryDataSourceJaliscoDAAPClientProxy *)self dataSources];
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * (void)v9) clientDetectedPredicateChange:v4];
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)setDataSources:(id)a3
{
}

- (void).cxx_destruct
{
}

@end