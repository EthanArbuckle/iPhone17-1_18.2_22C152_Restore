@interface SAAppSizeBreakdownList
- (NSMutableDictionary)appSizeBreakdownList;
- (SAAppSizeBreakdownList)init;
- (id)generateDictionary;
- (void)addPath:(id)a3 fixedPath:(BOOL)a4 size:(unint64_t)a5 bundleId:(id)a6;
- (void)addPluginSize:(unint64_t)a3 bundleId:(id)a4;
- (void)addTagSize:(unint64_t)a3 bundleId:(id)a4;
- (void)mergeBundleId:(id)a3 withBundleId:(id)a4 newBundleId:(id)a5;
- (void)removeBundleId:(id)a3;
- (void)setAppSizeBreakdownList:(id)a3;
- (void)updateBundleId:(id)a3 newId:(id)a4;
- (void)updatePath:(id)a3 cacheSize:(unint64_t)a4 bundleId:(id)a5;
- (void)updatePath:(id)a3 cloneSize:(unint64_t)a4 bundleId:(id)a5;
- (void)updateTagsWithCloneSize:(unint64_t)a3 bundleId:(id)a4;
@end

@implementation SAAppSizeBreakdownList

- (SAAppSizeBreakdownList)init
{
  v6.receiver = self;
  v6.super_class = (Class)SAAppSizeBreakdownList;
  v2 = [(SAAppSizeBreakdownList *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    appSizeBreakdownList = v2->_appSizeBreakdownList;
    v2->_appSizeBreakdownList = (NSMutableDictionary *)v3;
  }
  return v2;
}

- (void)addPath:(id)a3 fixedPath:(BOOL)a4 size:(unint64_t)a5 bundleId:(id)a6
{
  BOOL v8 = a4;
  id v12 = a3;
  id v10 = a6;
  v11 = [(NSMutableDictionary *)self->_appSizeBreakdownList objectForKeyedSubscript:v10];
  if (!v11)
  {
    v11 = objc_opt_new();
    [(NSMutableDictionary *)self->_appSizeBreakdownList setObject:v11 forKeyedSubscript:v10];
  }
  [v11 addPath:v12 fixedPath:v8 size:a5];
}

- (void)addTagSize:(unint64_t)a3 bundleId:(id)a4
{
  id v7 = a4;
  objc_super v6 = -[NSMutableDictionary objectForKeyedSubscript:](self->_appSizeBreakdownList, "objectForKeyedSubscript:");
  if (!v6)
  {
    objc_super v6 = objc_opt_new();
    [(NSMutableDictionary *)self->_appSizeBreakdownList setObject:v6 forKeyedSubscript:v7];
  }
  [v6 addTagSize:a3];
}

- (void)updatePath:(id)a3 cacheSize:(unint64_t)a4 bundleId:(id)a5
{
  id v10 = a3;
  id v8 = a5;
  v9 = [(NSMutableDictionary *)self->_appSizeBreakdownList objectForKeyedSubscript:v8];
  if (!v9)
  {
    v9 = objc_opt_new();
    [(NSMutableDictionary *)self->_appSizeBreakdownList setObject:v9 forKeyedSubscript:v8];
  }
  [v9 updatePath:v10 cacheSize:a4];
}

- (void)addPluginSize:(unint64_t)a3 bundleId:(id)a4
{
  id v7 = a4;
  objc_super v6 = -[NSMutableDictionary objectForKeyedSubscript:](self->_appSizeBreakdownList, "objectForKeyedSubscript:");
  if (!v6)
  {
    objc_super v6 = objc_opt_new();
    [(NSMutableDictionary *)self->_appSizeBreakdownList setObject:v6 forKeyedSubscript:v7];
  }
  [v6 addPluginCacheSize:a3];
}

- (void)updateBundleId:(id)a3 newId:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id v7 = [(NSMutableDictionary *)self->_appSizeBreakdownList objectForKeyedSubscript:v10];
  if (v7)
  {
    id v8 = [(NSMutableDictionary *)self->_appSizeBreakdownList objectForKeyedSubscript:v6];
    v9 = v8;
    if (v8) {
      [v8 mergeWithAppSizeBreakdown:v7];
    }
    else {
      [(NSMutableDictionary *)self->_appSizeBreakdownList setObject:v7 forKeyedSubscript:v6];
    }
    [(NSMutableDictionary *)self->_appSizeBreakdownList removeObjectForKey:v10];
  }
}

- (void)mergeBundleId:(id)a3 withBundleId:(id)a4 newBundleId:(id)a5
{
  appSizeBreakdownList = self->_appSizeBreakdownList;
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v13 = [(NSMutableDictionary *)appSizeBreakdownList objectForKeyedSubscript:v11];
  id v12 = [(NSMutableDictionary *)self->_appSizeBreakdownList objectForKeyedSubscript:v10];
  [v13 mergeWithAppSizeBreakdown:v12];
  [(NSMutableDictionary *)self->_appSizeBreakdownList removeObjectForKey:v10];

  [(SAAppSizeBreakdownList *)self updateBundleId:v11 newId:v9];
}

- (void)updatePath:(id)a3 cloneSize:(unint64_t)a4 bundleId:(id)a5
{
  id v10 = a3;
  id v8 = [(NSMutableDictionary *)self->_appSizeBreakdownList objectForKeyedSubscript:a5];
  id v9 = v8;
  if (v8) {
    [v8 updatePath:v10 cloneSize:a4];
  }
}

- (void)updateTagsWithCloneSize:(unint64_t)a3 bundleId:(id)a4
{
  v5 = [(NSMutableDictionary *)self->_appSizeBreakdownList objectForKeyedSubscript:a4];
  if (v5)
  {
    id v6 = v5;
    [v5 addTagSize:a3];
    v5 = v6;
  }
}

- (id)generateDictionary
{
  uint64_t v3 = objc_opt_new();
  appSizeBreakdownList = self->_appSizeBreakdownList;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000F524;
  v7[3] = &unk_10004CAA0;
  id v5 = v3;
  id v8 = v5;
  [(NSMutableDictionary *)appSizeBreakdownList enumerateKeysAndObjectsUsingBlock:v7];

  return v5;
}

- (void)removeBundleId:(id)a3
{
}

- (NSMutableDictionary)appSizeBreakdownList
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setAppSizeBreakdownList:(id)a3
{
}

- (void).cxx_destruct
{
}

@end