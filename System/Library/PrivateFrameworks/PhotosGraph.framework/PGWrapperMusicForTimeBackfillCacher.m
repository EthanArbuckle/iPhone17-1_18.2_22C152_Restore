@interface PGWrapperMusicForTimeBackfillCacher
+ (void)cacheMusicForMomentsInPhotoLibrary:(id)a3 forceCaching:(BOOL)a4 progressReporter:(id)a5 completionHandler:(id)a6;
- (PGWrapperMusicForTimeBackfillCacher)init;
@end

@implementation PGWrapperMusicForTimeBackfillCacher

+ (void)cacheMusicForMomentsInPhotoLibrary:(id)a3 forceCaching:(BOOL)a4 progressReporter:(id)a5 completionHandler:(id)a6
{
  BOOL v7 = a4;
  v9 = _Block_copy(a6);
  uint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
  _Block_copy(v9);
  id v11 = a3;
  id v12 = a5;
  sub_1D19DD2B8(v11, v7, v12, ObjCClassMetadata, v9);
  _Block_release(v9);
  _Block_release(v9);
}

- (PGWrapperMusicForTimeBackfillCacher)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(PGWrapperMusicForTimeBackfillCacher *)&v3 init];
}

@end