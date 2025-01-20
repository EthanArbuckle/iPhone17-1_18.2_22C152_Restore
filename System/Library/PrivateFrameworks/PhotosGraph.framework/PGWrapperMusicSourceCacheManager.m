@interface PGWrapperMusicSourceCacheManager
+ (void)pruneUnusedSourcesWithPhotoLibrary:(id)a3 graphManager:(id)a4 progressReporter:(id)a5 completionHandler:(id)a6;
- (PGWrapperMusicSourceCacheManager)init;
@end

@implementation PGWrapperMusicSourceCacheManager

+ (void)pruneUnusedSourcesWithPhotoLibrary:(id)a3 graphManager:(id)a4 progressReporter:(id)a5 completionHandler:(id)a6
{
  v9 = (void (**)(void *, uint64_t, void))_Block_copy(a6);
  id v10 = a3;
  id v12 = a4;
  id v11 = a5;
  sub_1D1994164(v10, v12);
  v9[2](v9, 1, 0);
  _Block_release(v9);
}

- (PGWrapperMusicSourceCacheManager)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(PGWrapperMusicSourceCacheManager *)&v3 init];
}

@end