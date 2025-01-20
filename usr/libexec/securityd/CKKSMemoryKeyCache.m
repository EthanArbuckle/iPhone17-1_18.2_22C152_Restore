@interface CKKSMemoryKeyCache
- (CKKSMemoryKeyCache)init;
- (NSMutableDictionary)keyCache;
- (id)currentKeyForClass:(id)a3 contextID:(id)a4 zoneID:(id)a5 error:(id *)a6;
- (id)loadKeyForItem:(id)a3 error:(id *)a4;
- (id)loadKeyForUUID:(id)a3 contextID:(id)a4 zoneID:(id)a5 error:(id *)a6;
- (void)addKeyToCache:(id)a3 key:(id)a4;
- (void)populateWithRecords:(id)a3 contextID:(id)a4;
- (void)setKeyCache:(id)a3;
@end

@implementation CKKSMemoryKeyCache

- (void).cxx_destruct
{
}

- (void)setKeyCache:(id)a3
{
}

- (NSMutableDictionary)keyCache
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)populateWithRecords:(id)a3 contextID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      v11 = 0;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v6);
        }
        v12 = [(CKKSCKRecordHolder *)[CKKSKey alloc] initWithCKRecord:*(void *)(*((void *)&v14 + 1) + 8 * (void)v11) contextID:v7];
        v13 = [(CKKSKey *)v12 uuid];
        [(CKKSMemoryKeyCache *)self addKeyToCache:v13 key:v12];

        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }
}

- (void)addKeyToCache:(id)a3 key:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CKKSMemoryKeyCache *)self keyCache];
  [v8 setObject:v6 forKeyedSubscript:v7];
}

- (id)currentKeyForClass:(id)a3 contextID:(id)a4 zoneID:(id)a5 error:(id *)a6
{
  id v10 = a4;
  id v11 = a5;
  v12 = +[CKKSCurrentKeyPointer fromDatabase:a3 contextID:v10 zoneID:v11 error:a6];
  v13 = v12;
  if (v12)
  {
    long long v14 = [v12 currentKeyUUID];
    long long v15 = [(CKKSMemoryKeyCache *)self loadKeyForUUID:v14 contextID:v10 zoneID:v11 error:a6];
  }
  else
  {
    long long v15 = 0;
  }

  return v15;
}

- (id)loadKeyForItem:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [v6 parentKeyUUID];
  id v8 = [v6 contextID];
  id v9 = [v6 zoneID];

  id v10 = [(CKKSMemoryKeyCache *)self loadKeyForUUID:v7 contextID:v8 zoneID:v9 error:a4];

  return v10;
}

- (id)loadKeyForUUID:(id)a3 contextID:(id)a4 zoneID:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = [(CKKSMemoryKeyCache *)self keyCache];
  long long v14 = [v13 objectForKeyedSubscript:v10];

  if (!v14)
  {
    long long v14 = +[CKKSKey loadKeyWithUUID:v10 contextID:v11 zoneID:v12 error:a6];
    long long v15 = [(CKKSMemoryKeyCache *)self keyCache];
    [v15 setObject:v14 forKeyedSubscript:v10];
  }
  id v16 = v14;

  return v16;
}

- (CKKSMemoryKeyCache)init
{
  v6.receiver = self;
  v6.super_class = (Class)CKKSMemoryKeyCache;
  v2 = [(CKKSMemoryKeyCache *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[NSMutableDictionary dictionary];
    keyCache = v2->_keyCache;
    v2->_keyCache = (NSMutableDictionary *)v3;
  }
  return v2;
}

@end