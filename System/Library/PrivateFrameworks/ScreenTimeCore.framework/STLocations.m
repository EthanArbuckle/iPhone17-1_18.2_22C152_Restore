@interface STLocations
+ (NSURL)applicationSupportDirectory;
+ (NSURL)cachesDirectory;
+ (NSURL)familyPhotosCacheDirectory;
+ (void)applicationSupportDirectory;
+ (void)cachesDirectory;
@end

@implementation STLocations

+ (NSURL)applicationSupportDirectory
{
  v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v11 = 0;
  v5 = [v4 URLForDirectory:14 inDomain:1 appropriateForURL:0 create:0 error:&v11];
  id v6 = v11;

  if (v5)
  {
    v7 = [v5 URLByAppendingPathComponent:@"com.apple.remotemanagementd" isDirectory:1];
  }
  else
  {
    v8 = +[STLog persistence];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      +[STLocations applicationSupportDirectory];
    }

    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:a1 file:@"STLocations.m" lineNumber:28 description:@"applicationSupportDirectory must not be nil"];

    v7 = 0;
  }

  return (NSURL *)v7;
}

+ (NSURL)cachesDirectory
{
  v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v11 = 0;
  v5 = [v4 URLForDirectory:13 inDomain:1 appropriateForURL:0 create:0 error:&v11];
  id v6 = v11;

  if (v5)
  {
    v7 = [v5 URLByAppendingPathComponent:@"com.apple.ScreenTimeAgent" isDirectory:1];
  }
  else
  {
    v8 = +[STLog persistence];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      +[STLocations cachesDirectory];
    }

    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:a1 file:@"STLocations.m" lineNumber:41 description:@"cachesDirectory must not be nil"];

    v7 = 0;
  }

  return (NSURL *)v7;
}

+ (NSURL)familyPhotosCacheDirectory
{
  v2 = [a1 cachesDirectory];
  v3 = [v2 URLByAppendingPathComponent:@"FamilyPhotos" isDirectory:1];

  return (NSURL *)v3;
}

+ (void)applicationSupportDirectory
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1DA519000, a2, OS_LOG_TYPE_ERROR, "Unable to determine data directory: %@", (uint8_t *)&v2, 0xCu);
}

+ (void)cachesDirectory
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1DA519000, a2, OS_LOG_TYPE_ERROR, "Unable to determine caches directory: %@", (uint8_t *)&v2, 0xCu);
}

@end