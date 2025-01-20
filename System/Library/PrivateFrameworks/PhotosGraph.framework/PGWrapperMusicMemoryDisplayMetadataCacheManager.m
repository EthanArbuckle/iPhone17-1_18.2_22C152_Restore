@interface PGWrapperMusicMemoryDisplayMetadataCacheManager
+ (void)evictExpiredSongsWithPhotoLibrary:(id)a3 progressReporter:(id)a4 completionHandler:(id)a5;
- (PGWrapperMusicMemoryDisplayMetadataCacheManager)init;
@end

@implementation PGWrapperMusicMemoryDisplayMetadataCacheManager

+ (void)evictExpiredSongsWithPhotoLibrary:(id)a3 progressReporter:(id)a4 completionHandler:(id)a5
{
  v7 = _Block_copy(a5);
  _Block_copy(v7);
  _Block_copy(v7);
  id v8 = a3;
  id v10 = a4;
  v9 = sub_1D18AC63C(v8);
  _Block_copy(v7);
  sub_1D18E7FC4(v9, (uint64_t)v10, v7);
  _Block_release(v7);

  _Block_release(v7);
  _Block_release(v7);
  _Block_release(v7);
}

- (PGWrapperMusicMemoryDisplayMetadataCacheManager)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(PGWrapperMusicMemoryDisplayMetadataCacheManager *)&v3 init];
}

@end