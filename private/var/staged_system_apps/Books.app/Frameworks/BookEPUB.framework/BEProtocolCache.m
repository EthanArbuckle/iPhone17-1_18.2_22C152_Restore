@interface BEProtocolCache
+ (BEProtocolCache)sharedInstance;
- (BEProtocolCacheItemProvider)itemProvider;
- (id)cacheItemForDatabaseKey:(id)a3;
- (void)clearCache;
- (void)clearCacheForDatabaseKey:(id)a3;
- (void)clearCacheForDatabaseKeys:(id)a3;
- (void)dealloc;
- (void)setItemProvider:(id)a3;
@end

@implementation BEProtocolCache

- (void)dealloc
{
  [(BEProtocolCacheItemProvider *)self->_itemProvider clearCache];
  v3.receiver = self;
  v3.super_class = (Class)BEProtocolCache;
  [(BEProtocolCache *)&v3 dealloc];
}

+ (BEProtocolCache)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_302B4;
  block[3] = &unk_3C07E0;
  block[4] = a1;
  if (qword_409C00 != -1) {
    dispatch_once(&qword_409C00, block);
  }
  v2 = (void *)qword_409BF8;

  return (BEProtocolCache *)v2;
}

- (id)cacheItemForDatabaseKey:(id)a3
{
  return [(BEProtocolCacheItemProvider *)self->_itemProvider cacheItemForDatabaseKey:a3];
}

- (void)clearCache
{
}

- (void)clearCacheForDatabaseKey:(id)a3
{
}

- (void)clearCacheForDatabaseKeys:(id)a3
{
}

- (BEProtocolCacheItemProvider)itemProvider
{
  return self->_itemProvider;
}

- (void)setItemProvider:(id)a3
{
}

- (void).cxx_destruct
{
}

@end