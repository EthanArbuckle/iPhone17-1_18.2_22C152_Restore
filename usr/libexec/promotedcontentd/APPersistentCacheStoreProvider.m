@interface APPersistentCacheStoreProvider
+ (APPersistentCachedStoreTransactionalProtocol)persistentCacheStore;
+ (void)assignPersistentCacheStore:(id)a3;
@end

@implementation APPersistentCacheStoreProvider

+ (APPersistentCachedStoreTransactionalProtocol)persistentCacheStore
{
  id WeakRetained = objc_loadWeakRetained(&qword_10028D248);

  return (APPersistentCachedStoreTransactionalProtocol *)WeakRetained;
}

+ (void)assignPersistentCacheStore:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained(&qword_10028D248);

  if (!WeakRetained) {
    objc_storeWeak(&qword_10028D248, obj);
  }
}

@end