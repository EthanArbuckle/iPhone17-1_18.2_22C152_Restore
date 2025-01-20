@interface PGWrapperMusicForArtistCacher
+ (void)cacheMusicForMomentsInPhotoLibrary:(id)a3 graphManager:(id)a4 forceCaching:(BOOL)a5 progressReporter:(id)a6 completionHandler:(id)a7;
- (PGWrapperMusicForArtistCacher)init;
@end

@implementation PGWrapperMusicForArtistCacher

+ (void)cacheMusicForMomentsInPhotoLibrary:(id)a3 graphManager:(id)a4 forceCaching:(BOOL)a5 progressReporter:(id)a6 completionHandler:(id)a7
{
  BOOL v8 = a5;
  v11 = _Block_copy(a7);
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = v11;
  ObjCClassMetadata = (void *)swift_getObjCClassMetadata();
  v14 = (char *)a3;
  id v15 = a4;
  id v16 = a6;
  _Block_copy(v11);
  sub_1D1B06788(v14, v15, v8, 100, v16, ObjCClassMetadata, (void (*)(uint64_t, void))sub_1D18E8458, v12);
  swift_release();
  _Block_release(v11);
}

- (PGWrapperMusicForArtistCacher)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(PGWrapperMusicForArtistCacher *)&v3 init];
}

@end