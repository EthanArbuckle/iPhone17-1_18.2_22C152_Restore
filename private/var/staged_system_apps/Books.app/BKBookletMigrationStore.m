@interface BKBookletMigrationStore
- (BKBookletMigrationStore)init;
- (BLBookletMigrationStore)store;
- (BOOL)removeAllMigrationInfosExcludingStates:(id)a3 error:(id *)a4;
- (BOOL)setMigrationState:(int64_t)a3 forStoreIDStrings:(id)a4 error:(id *)a5;
- (id)_convertToStoreIDs:(id)a3;
- (void)migrationItemsWithState:(int64_t)a3 completion:(id)a4;
- (void)migrationItemsWithStoreIDStrings:(id)a3 completion:(id)a4;
- (void)setStore:(id)a3;
@end

@implementation BKBookletMigrationStore

- (BKBookletMigrationStore)init
{
  v6.receiver = self;
  v6.super_class = (Class)BKBookletMigrationStore;
  v2 = [(BKBookletMigrationStore *)&v6 init];
  if (v2)
  {
    v3 = (BLBookletMigrationStore *)objc_alloc_init((Class)BLBookletMigrationStore);
    store = v2->_store;
    v2->_store = v3;
  }
  return v2;
}

- (id)_convertToStoreIDs:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)NSMutableSet) initWithCapacity:[v3 count]];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  objc_super v6 = (char *)[v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", BUStoreIdFromObject(), v12);
        [v4 addObject:v10];
      }
      v7 = (char *)[v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

- (BOOL)setMigrationState:(int64_t)a3 forStoreIDStrings:(id)a4 error:(id *)a5
{
  uint64_t v8 = [(BKBookletMigrationStore *)self _convertToStoreIDs:a4];
  v9 = [(BKBookletMigrationStore *)self store];
  LOBYTE(a5) = [v9 setMigrationState:a3 forStoreIDs:v8 error:a5];

  return (char)a5;
}

- (void)migrationItemsWithStoreIDStrings:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v8 = [(BKBookletMigrationStore *)self _convertToStoreIDs:a3];
  v7 = [(BKBookletMigrationStore *)self store];
  [v7 migrationInfosWithStoreIDs:v8 completion:v6];
}

- (void)migrationItemsWithState:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = [(BKBookletMigrationStore *)self store];
  [v7 migrationInfosWithState:a3 completion:v6];
}

- (BOOL)removeAllMigrationInfosExcludingStates:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(BKBookletMigrationStore *)self store];
  LOBYTE(a4) = [v7 removeAllMigrationInfosExcludingStates:v6 error:a4];

  return (char)a4;
}

- (BLBookletMigrationStore)store
{
  return self->_store;
}

- (void)setStore:(id)a3
{
}

- (void).cxx_destruct
{
}

@end