@interface JSAOfflineCache
+ (BOOL)generateCache;
+ (BOOL)runFromCache;
+ (NSString)cachePath;
+ (id)cacheDirCandidatesForHTTPPostLaunch;
+ (id)cacheDirCandidatesForTUIPostLaunch;
+ (id)cacheFileCandidatesForBag;
+ (id)cacheFileCandidatesForHTTPPreLaunch;
+ (id)cacheFileCandidatesForTUIPreLaunch;
+ (void)setGenerateCache:(BOOL)a3;
+ (void)setRunFromCache:(BOOL)a3;
- (JSAOfflineCache)init;
@end

@implementation JSAOfflineCache

+ (NSString)cachePath
{
  NSString v2 = sub_86830();

  return (NSString *)v2;
}

+ (BOOL)generateCache
{
  return sub_64090((uint64_t)a1, (uint64_t)a2, &qword_CC4D8, (unsigned __int8 *)&byte_CD5A0);
}

+ (void)setGenerateCache:(BOOL)a3
{
}

+ (BOOL)runFromCache
{
  return sub_64090((uint64_t)a1, (uint64_t)a2, &qword_CC4E0, (unsigned __int8 *)&byte_CD5A1);
}

+ (void)setRunFromCache:(BOOL)a3
{
}

+ (id)cacheFileCandidatesForHTTPPreLaunch
{
  return sub_64B38((uint64_t)a1, (uint64_t)a2, (void (*)(void))static OfflineCache.cacheFileCandidatesForHTTPPreLaunch());
}

+ (id)cacheDirCandidatesForHTTPPostLaunch
{
  return sub_64BD4((uint64_t)a1, (uint64_t)a2, (void *)0x800000000009E010);
}

+ (id)cacheFileCandidatesForBag
{
  _s5JSApp12OfflineCacheC25cacheFileCandidatesForBagSaySSGyFZ_0();
  v2.super.isa = sub_86A10().super.isa;
  swift_bridgeObjectRelease();

  return v2.super.isa;
}

+ (id)cacheFileCandidatesForTUIPreLaunch
{
  return sub_64B38((uint64_t)a1, (uint64_t)a2, (void (*)(void))static OfflineCache.cacheFileCandidatesForTUIPreLaunch());
}

+ (id)cacheDirCandidatesForTUIPostLaunch
{
  return sub_64BD4((uint64_t)a1, (uint64_t)a2, (void *)0x800000000009DF90);
}

- (JSAOfflineCache)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for OfflineCache();
  return [(JSAOfflineCache *)&v3 init];
}

@end