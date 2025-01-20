@interface PBFSBSWallpaperServiceHelper
+ (SBSWallpaperService)wallpaperService;
@end

@implementation PBFSBSWallpaperServiceHelper

+ (SBSWallpaperService)wallpaperService
{
  id v2 = objc_alloc_init((Class)getSBSWallpaperServiceClass());
  return (SBSWallpaperService *)v2;
}

@end