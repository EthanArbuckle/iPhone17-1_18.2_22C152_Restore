@interface PGMusicCatalogMonitor
+ (BOOL)canAccessMediaLibrary;
+ (BOOL)checkMusicCatalogEligibilityWithProgressReporter:(id)a3;
+ (void)checkMusicCatalogEligibilityWithProgressReporter:(id)a3 completionHandler:(id)a4;
+ (void)clearCatalogMusicFromCacheWithPhotoLibrary:(id)a3 progressReporter:(id)a4 completionHandler:(id)a5;
@end

@implementation PGMusicCatalogMonitor

+ (BOOL)canAccessMediaLibrary
{
  return +[PGWrapperMusicCatalogMonitor canAccessMediaLibrary];
}

+ (void)clearCatalogMusicFromCacheWithPhotoLibrary:(id)a3 progressReporter:(id)a4 completionHandler:(id)a5
{
  id v10 = 0;
  v7 = (void (**)(id, BOOL, id))a5;
  BOOL v8 = +[PGWrapperMusicCatalogMonitor clearCatalogMusicFromCacheWithPhotoLibrary:a3 progressReporter:a4 error:&v10];
  id v9 = v10;
  v7[2](v7, v8, v9);
}

+ (BOOL)checkMusicCatalogEligibilityWithProgressReporter:(id)a3
{
  return +[PGWrapperMusicCatalogMonitor checkMusicCatalogEligibilityWithProgressReporter:a3];
}

+ (void)checkMusicCatalogEligibilityWithProgressReporter:(id)a3 completionHandler:(id)a4
{
}

@end