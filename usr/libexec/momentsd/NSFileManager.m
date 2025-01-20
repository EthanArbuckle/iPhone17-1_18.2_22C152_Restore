@interface NSFileManager
+ (id)systemCacheDirectoryPath;
+ (id)userCacheDirectoryPath;
+ (id)userLibraryPath;
@end

@implementation NSFileManager

+ (id)systemCacheDirectoryPath
{
  v2 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 8uLL, 1);
  if ([v2 count])
  {
    v3 = [v2 firstObject];
    v4 = [v3 stringByAppendingPathComponent:@"com.apple.momentsd"];

    v5 = +[NSFileManager defaultManager];
    unsigned __int8 v6 = [v5 fileExistsAtPath:v4];

    if ((v6 & 1) != 0
      || (+[NSFileManager defaultManager],
          v7 = objc_claimAutoreleasedReturnValue(),
          uint64_t v12 = 0,
          unsigned int v8 = [v7 createDirectoryAtPath:v4 withIntermediateDirectories:1 attributes:0 error:&v12], v9 = v12, v7, v10 = 0, v8)&& !v9)
    {
      id v10 = v4;
    }
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

+ (id)userCacheDirectoryPath
{
  v2 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  if ([v2 count])
  {
    v3 = [v2 firstObject];
    v4 = [v3 stringByAppendingPathComponent:@"com.apple.momentsd"];

    v5 = +[NSFileManager defaultManager];
    unsigned __int8 v6 = [v5 fileExistsAtPath:v4];

    if ((v6 & 1) != 0
      || (+[NSFileManager defaultManager],
          v7 = objc_claimAutoreleasedReturnValue(),
          uint64_t v12 = 0,
          unsigned int v8 = [v7 createDirectoryAtPath:v4 withIntermediateDirectories:1 attributes:0 error:&v12], v9 = v12, v7, v10 = 0, v8)&& !v9)
    {
      id v10 = v4;
    }
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

+ (id)userLibraryPath
{
  v2 = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 1uLL, 1);
  if ([v2 count])
  {
    v3 = [v2 firstObject];
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

@end