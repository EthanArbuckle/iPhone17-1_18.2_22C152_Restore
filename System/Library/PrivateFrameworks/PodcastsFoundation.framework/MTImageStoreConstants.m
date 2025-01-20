@interface MTImageStoreConstants
+ (id)defaultImageStoreURL;
+ (id)deprecatedImageStoreURL;
+ (id)fileExtension;
+ (id)fileType;
+ (id)imagePathForPodcastUuid:(id)a3 relativeToURL:(id)a4;
@end

@implementation MTImageStoreConstants

+ (id)fileType
{
  return (id)*MEMORY[0x1E4F44460];
}

+ (id)deprecatedImageStoreURL
{
  v2 = +[MTConstants sharedContainerURL];
  v3 = [v2 URLByAppendingPathComponent:@"IMImageStore-Default" isDirectory:1];

  return v3;
}

+ (id)defaultImageStoreURL
{
  v2 = +[MTConstants sharedCacheDirectory];
  v3 = [v2 URLByAppendingPathComponent:@"IMImageStore-Default" isDirectory:1];

  return v3;
}

+ (id)imagePathForPodcastUuid:(id)a3 relativeToURL:(id)a4
{
  id v5 = a4;
  v6 = [a3 stringByAppendingPathComponent:@"jpg"];
  v7 = [v5 URLByAppendingPathComponent:v6 isDirectory:0];

  return v7;
}

+ (id)fileExtension
{
  v3 = [a1 fileType];
  char v4 = [v3 isEqual:*MEMORY[0x1E4F44410]];

  if (v4)
  {
    id v5 = @"jpg";
  }
  else
  {
    v6 = [a1 fileType];
    id v5 = [v6 preferredFilenameExtension];
  }
  return v5;
}

@end