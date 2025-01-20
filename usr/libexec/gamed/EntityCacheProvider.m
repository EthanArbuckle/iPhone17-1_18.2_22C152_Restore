@interface EntityCacheProvider
- (void)deleteAllCachesWithCompletionHandler:(id)a3;
- (void)deleteCacheWithPlayerID:(NSString *)a3 language:(NSString *)a4 completionHandler:(id)a5;
- (void)getCacheWithPlayerID:(NSString *)a3 language:(NSString *)a4 completionHandler:(id)a5;
@end

@implementation EntityCacheProvider

- (void)getCacheWithPlayerID:(NSString *)a3 language:(NSString *)a4 completionHandler:(id)a5
{
}

- (void)deleteCacheWithPlayerID:(NSString *)a3 language:(NSString *)a4 completionHandler:(id)a5
{
}

- (void)deleteAllCachesWithCompletionHandler:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  *(void *)(v5 + 24) = self;
  swift_retain();

  sub_10000D83C((uint64_t)&unk_100327108, v5);
}

@end