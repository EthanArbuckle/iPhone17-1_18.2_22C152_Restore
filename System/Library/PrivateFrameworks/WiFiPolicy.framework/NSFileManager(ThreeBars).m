@interface NSFileManager(ThreeBars)
+ (__CFString)defaultsDomain;
+ (id)userCacheDirectoryPath;
+ (id)wifiCacheDirectoryPath;
@end

@implementation NSFileManager(ThreeBars)

+ (id)wifiCacheDirectoryPath
{
  v1 = [a1 userCacheDirectoryPath];
  if (v1)
  {
    uint64_t v2 = [MEMORY[0x1E4F28CB8] defaultsDomain];
    id v3 = [v1 stringByAppendingPathComponent:v2];

    v4 = [MEMORY[0x1E4F28CB8] defaultManager];
    LOBYTE(v2) = [v4 fileExistsAtPath:v3];

    if ((v2 & 1) != 0
      || ([MEMORY[0x1E4F28CB8] defaultManager],
          v5 = objc_claimAutoreleasedReturnValue(),
          uint64_t v9 = 0,
          int v6 = [v5 createDirectoryAtPath:v3 withIntermediateDirectories:1 attributes:0 error:&v9], v7 = v9, v5, v1 = 0, v6)&& !v7)
    {
      id v3 = v3;
      v1 = v3;
    }
  }
  else
  {
    id v3 = 0;
  }

  return v1;
}

+ (id)userCacheDirectoryPath
{
  v0 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  if ([v0 count])
  {
    v1 = [v0 firstObject];
  }
  else
  {
    v1 = 0;
  }

  return v1;
}

+ (__CFString)defaultsDomain
{
  return @"com.apple.wifid";
}

@end