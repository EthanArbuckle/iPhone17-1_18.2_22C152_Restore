@interface PGWrapperMusicCatalogMonitor
+ (BOOL)canAccessMediaLibrary;
+ (BOOL)checkMusicCatalogEligibilityWithProgressReporter:(id)a3;
+ (BOOL)clearCatalogMusicFromCacheWithPhotoLibrary:(id)a3 progressReporter:(id)a4 error:(id *)a5;
+ (void)checkMusicCatalogEligibilityWithProgressReporter:(id)a3 completionHandler:(id)a4;
- (PGWrapperMusicCatalogMonitor)init;
@end

@implementation PGWrapperMusicCatalogMonitor

+ (void)checkMusicCatalogEligibilityWithProgressReporter:(id)a3 completionHandler:(id)a4
{
  v5 = _Block_copy(a4);
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v5;
  id v7 = a3;
  sub_1D1AEFED0((uint64_t)sub_1D1AF02B4, v6);

  swift_release();
}

+ (BOOL)checkMusicCatalogEligibilityWithProgressReporter:(id)a3
{
  return _s11PhotosGraph19MusicCatalogMonitorC05checkcD11Eligibility16progressReporterSbSo010MAProgressI0C_tFZ_0() & 1;
}

+ (BOOL)clearCatalogMusicFromCacheWithPhotoLibrary:(id)a3 progressReporter:(id)a4 error:(id *)a5
{
  id v6 = a3;
  id v7 = a4;
  sub_1D1AEFFE0(v6);

  return 1;
}

+ (BOOL)canAccessMediaLibrary
{
  _s11PhotosGraph19MusicCatalogMonitorC21canAccessMediaLibrarySbyFZ_0();
  return v2 & 1;
}

- (PGWrapperMusicCatalogMonitor)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(PGWrapperMusicCatalogMonitor *)&v3 init];
}

@end