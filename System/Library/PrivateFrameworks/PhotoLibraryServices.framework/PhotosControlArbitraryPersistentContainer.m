@interface PhotosControlArbitraryPersistentContainer
+ (id)defaultDirectoryURL;
+ (void)setDefaultDirectoryURL:(id)a3;
@end

@implementation PhotosControlArbitraryPersistentContainer

+ (void)setDefaultDirectoryURL:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, a1, @"PhotosControlPhotoLibraryCommand.m", 42, @"Invalid parameter not satisfying: %@", @"url" object file lineNumber description];
  }
  v6 = (void *)s_directoryURL;
  s_directoryURL = (uint64_t)v5;
}

+ (id)defaultDirectoryURL
{
  return (id)s_directoryURL;
}

@end