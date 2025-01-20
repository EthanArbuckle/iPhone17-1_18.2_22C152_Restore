@interface APCacheStoreTransaction
- (APCacheStore)cacheStore;
- (APCacheStoreTransaction)initWithCacheStore:(id)a3;
- (BOOL)_commit;
- (BOOL)commit;
- (NSMutableArray)operations;
- (unint64_t)count;
- (void)addOperation:(id)a3;
@end

@implementation APCacheStoreTransaction

- (APCacheStoreTransaction)initWithCacheStore:(id)a3
{
  id v4 = a3;
  v5 = [(APCacheStoreTransaction *)self init];
  if (v5)
  {
    uint64_t v6 = +[NSMutableArray array];
    operations = v5->_operations;
    v5->_operations = (NSMutableArray *)v6;

    objc_storeWeak((id *)&v5->_cacheStore, v4);
  }

  return v5;
}

- (unint64_t)count
{
  v2 = [(APCacheStoreTransaction *)self operations];
  id v3 = [v2 count];

  return (unint64_t)v3;
}

- (void)addOperation:(id)a3
{
  id v4 = a3;
  id v5 = [(APCacheStoreTransaction *)self operations];
  [v5 addObject:v4];
}

- (BOOL)commit
{
  v2 = self;
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  id v3 = [(APCacheStoreTransaction *)self cacheStore];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100173118;
  v5[3] = &unk_1002387B8;
  v5[4] = v2;
  v5[5] = &v6;
  [v3 executeBlock:v5];

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (BOOL)_commit
{
  id v3 = [(APCacheStoreTransaction *)self operations];
  id v4 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v3 count]);

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = [(APCacheStoreTransaction *)self operations];
  id v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v17;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        unsigned int v11 = [v10 execute];
        [v4 addObject:v10];
        if (!v11)
        {
          BOOL v12 = 0;
          goto LABEL_11;
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v12 = 1;
LABEL_11:

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100173314;
  v14[3] = &unk_1002387D8;
  BOOL v15 = v12;
  [v4 enumerateObjectsUsingBlock:v14];

  return v12;
}

- (APCacheStore)cacheStore
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cacheStore);

  return (APCacheStore *)WeakRetained;
}

- (NSMutableArray)operations
{
  return self->_operations;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operations, 0);

  objc_destroyWeak((id *)&self->_cacheStore);
}

@end