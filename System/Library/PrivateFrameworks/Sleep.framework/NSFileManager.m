@interface NSFileManager
@end

@implementation NSFileManager

void __55__NSFileManager_HKSPFileManager___bundleCacheDirectory__block_invoke()
{
  NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  v0 = [v5 firstObject];
  v1 = [MEMORY[0x1E4F28B50] mainBundle];
  v2 = [v1 bundleIdentifier];
  uint64_t v3 = [v0 stringByAppendingPathComponent:v2];
  v4 = (void *)_MergedGlobals_13;
  _MergedGlobals_13 = v3;
}

@end