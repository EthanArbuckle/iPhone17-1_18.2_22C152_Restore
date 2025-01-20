@interface PGWrapperMusicForMomentCacher
+ (void)cacheMusicForMomentsInPhotoLibrary:(id)a3 progressReporter:(id)a4 completionHandler:(id)a5;
- (PGWrapperMusicForMomentCacher)init;
@end

@implementation PGWrapperMusicForMomentCacher

+ (void)cacheMusicForMomentsInPhotoLibrary:(id)a3 progressReporter:(id)a4 completionHandler:(id)a5
{
  v7 = _Block_copy(a5);
  uint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
  _Block_copy(v7);
  id v9 = a3;
  id v10 = a4;
  sub_1D1B32334(v9, (uint64_t)v10, ObjCClassMetadata, v7);
  _Block_release(v7);
  _Block_release(v7);
}

- (PGWrapperMusicForMomentCacher)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(PGWrapperMusicForMomentCacher *)&v3 init];
}

@end