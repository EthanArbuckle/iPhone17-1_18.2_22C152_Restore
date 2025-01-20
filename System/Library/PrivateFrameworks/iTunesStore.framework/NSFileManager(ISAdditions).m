@interface NSFileManager(ISAdditions)
+ (BOOL)_storeMovePath:()ISAdditions toPath:;
+ (uint64_t)cacheDirectoryPathWithName:()ISAdditions;
+ (uint64_t)ensureDirectoryExists:()ISAdditions;
@end

@implementation NSFileManager(ISAdditions)

+ (uint64_t)cacheDirectoryPathWithName:()ISAdditions
{
  uint64_t v4 = objc_msgSend(-[NSArray lastObject](NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1), "lastObject"), "stringByAppendingPathComponent:", a3);
  if ([a1 ensureDirectoryExists:v4]) {
    return v4;
  }
  else {
    return 0;
  }
}

+ (uint64_t)ensureDirectoryExists:()ISAdditions
{
  uint64_t v3 = a3;
  if (a3)
  {
    id v4 = objc_alloc_init(MEMORY[0x263F08850]);
    if ([v4 fileExistsAtPath:v3]) {
      uint64_t v3 = 1;
    }
    else {
      uint64_t v3 = [v4 createDirectoryAtPath:v3 withIntermediateDirectories:1 attributes:0 error:0];
    }
  }
  return v3;
}

+ (BOOL)_storeMovePath:()ISAdditions toPath:
{
  v5 = (const std::__fs::filesystem::path *)[a3 fileSystemRepresentation];
  v6 = (const std::__fs::filesystem::path *)[a4 fileSystemRepresentation];
  rename(v5, v6, v7);
  return v8 == 0;
}

@end