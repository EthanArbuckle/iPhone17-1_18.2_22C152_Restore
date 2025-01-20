@interface PGWrapperMusicCacheMusicKitReconciler
+ (void)runWithPhotoLibrary:(id)a3 progressReporter:(id)a4 completionHandler:(id)a5;
- (PGWrapperMusicCacheMusicKitReconciler)init;
@end

@implementation PGWrapperMusicCacheMusicKitReconciler

+ (void)runWithPhotoLibrary:(id)a3 progressReporter:(id)a4 completionHandler:(id)a5
{
  v7 = _Block_copy(a5);
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v7;
  swift_getObjCClassMetadata();
  id v9 = a3;
  id v10 = a4;
  static MusicCacheMusicKitReconciler.run(photoLibrary:progressReporter:completionHandler:)(v9, (uint64_t)v10, (void (*)(void, void *))sub_1D18E8458, v8);

  swift_release();
}

- (PGWrapperMusicCacheMusicKitReconciler)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(PGWrapperMusicCacheMusicKitReconciler *)&v3 init];
}

@end