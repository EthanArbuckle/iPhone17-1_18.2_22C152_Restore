@interface NTKSnapshotCachePathProvider
- (NSURL)cachesPath;
- (NSURL)defaultPath;
- (NSURL)libraryPath;
@end

@implementation NTKSnapshotCachePathProvider

- (NSURL)defaultPath
{
  v2 = (void *)MEMORY[0x1E4F1CB10];
  v3 = BSCurrentUserDirectory();
  v4 = [v2 fileURLWithPath:v3];

  return (NSURL *)v4;
}

- (NSURL)libraryPath
{
  v2 = [(NTKSnapshotCachePathProvider *)self defaultPath];
  v3 = [v2 URLByAppendingPathComponent:@"Library"];

  return (NSURL *)v3;
}

- (NSURL)cachesPath
{
  v2 = [(NTKSnapshotCachePathProvider *)self libraryPath];
  v3 = [v2 URLByAppendingPathComponent:@"Caches"];

  return (NSURL *)v3;
}

@end