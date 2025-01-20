@interface PGWrapperMusicForTopicCacher
+ (BOOL)cacheMusicWithCache:(id)a3 progressReporter:(id)a4 error:(id *)a5;
+ (void)prefetchCuratedSongLibraryAssetsWithProgressReporter:(id)a3 completionHandler:(id)a4;
- (PGWrapperMusicForTopicCacher)init;
@end

@implementation PGWrapperMusicForTopicCacher

+ (void)prefetchCuratedSongLibraryAssetsWithProgressReporter:(id)a3 completionHandler:(id)a4
{
  v5 = _Block_copy(a4);
  _Block_copy(v5);
  id v6 = a3;
  sub_1D19D6C28((uint64_t)v6, (void (**)(const void *, void, void *))v5);
  _Block_release(v5);
  _Block_release(v5);
}

+ (BOOL)cacheMusicWithCache:(id)a3 progressReporter:(id)a4 error:(id *)a5
{
  id v6 = a3;
  id v7 = a4;
  sub_1D19D6154((uint64_t)v6, (uint64_t)v7);

  return 1;
}

- (PGWrapperMusicForTopicCacher)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(PGWrapperMusicForTopicCacher *)&v3 init];
}

@end