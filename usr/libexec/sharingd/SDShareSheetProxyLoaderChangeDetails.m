@interface SDShareSheetProxyLoaderChangeDetails
- (NSArray)changedProxySections;
- (NSMutableArray)proxySections;
- (NSMutableDictionary)resultsBySectionType;
- (SDShareSheetProxyLoaderChangeDetails)init;
- (id)failedIndexesForProxySection:(id)a3;
- (id)loadedIndexesForProxySection:(id)a3;
- (void)addResult:(id)a3 forProxySection:(id)a4;
- (void)setProxySections:(id)a3;
- (void)setResultsBySectionType:(id)a3;
@end

@implementation SDShareSheetProxyLoaderChangeDetails

- (SDShareSheetProxyLoaderChangeDetails)init
{
  v8.receiver = self;
  v8.super_class = (Class)SDShareSheetProxyLoaderChangeDetails;
  v2 = [(SDShareSheetProxyLoaderChangeDetails *)&v8 init];
  if (v2)
  {
    uint64_t v3 = +[NSMutableArray array];
    proxySections = v2->_proxySections;
    v2->_proxySections = (NSMutableArray *)v3;

    uint64_t v5 = +[NSMutableDictionary dictionary];
    resultsBySectionType = v2->_resultsBySectionType;
    v2->_resultsBySectionType = (NSMutableDictionary *)v5;
  }
  return v2;
}

- (NSArray)changedProxySections
{
  v2 = [(SDShareSheetProxyLoaderChangeDetails *)self proxySections];
  id v3 = [v2 copy];

  return (NSArray *)v3;
}

- (void)addResult:(id)a3 forProxySection:(id)a4
{
  id v13 = a3;
  id v7 = a4;
  if (v13)
  {
    if (v7) {
      goto LABEL_3;
    }
  }
  else
  {
    v11 = +[NSAssertionHandler currentHandler];
    [v11 handleFailureInMethod:a2, self, @"SDShareSheetProxyLoaderManager.m", 37, @"Invalid parameter not satisfying: %@", @"result" object file lineNumber description];

    if (v7) {
      goto LABEL_3;
    }
  }
  v12 = +[NSAssertionHandler currentHandler];
  [v12 handleFailureInMethod:a2, self, @"SDShareSheetProxyLoaderManager.m", 38, @"Invalid parameter not satisfying: %@", @"proxySection" object file lineNumber description];

LABEL_3:
  objc_super v8 = [(SDShareSheetProxyLoaderChangeDetails *)self resultsBySectionType];
  v9 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v7 type]);
  [v8 setObject:v13 forKeyedSubscript:v9];

  v10 = [(SDShareSheetProxyLoaderChangeDetails *)self proxySections];
  [v10 addObject:v7];
}

- (id)loadedIndexesForProxySection:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SDShareSheetProxyLoaderChangeDetails *)self resultsBySectionType];
  id v6 = [v4 type];

  id v7 = +[NSNumber numberWithInteger:v6];
  objc_super v8 = [v5 objectForKeyedSubscript:v7];

  v9 = [v8 loadedIndexes];

  return v9;
}

- (id)failedIndexesForProxySection:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SDShareSheetProxyLoaderChangeDetails *)self resultsBySectionType];
  id v6 = [v4 type];

  id v7 = +[NSNumber numberWithInteger:v6];
  objc_super v8 = [v5 objectForKeyedSubscript:v7];

  v9 = [v8 failedIndexes];

  return v9;
}

- (NSMutableArray)proxySections
{
  return self->_proxySections;
}

- (void)setProxySections:(id)a3
{
}

- (NSMutableDictionary)resultsBySectionType
{
  return self->_resultsBySectionType;
}

- (void)setResultsBySectionType:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultsBySectionType, 0);

  objc_storeStrong((id *)&self->_proxySections, 0);
}

@end