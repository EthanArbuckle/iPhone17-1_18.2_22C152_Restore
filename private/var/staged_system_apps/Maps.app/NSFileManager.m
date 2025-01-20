@interface NSFileManager
+ (BOOL)emptyContentsOfDirectoryAtURL:(id)a3 error:(id *)a4;
+ (id)_maps_globalCachesURL;
@end

@implementation NSFileManager

+ (BOOL)emptyContentsOfDirectoryAtURL:(id)a3 error:(id *)a4
{
  v18 = a4;
  id v4 = a3;
  v5 = +[NSFileManager defaultManager];
  v6 = [v5 enumeratorAtURL:v4 includingPropertiesForKeys:0 options:0 errorHandler:0];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v7 = [v6 countByEnumeratingWithState:&v20 objects:v26 count:16];
  if (v7)
  {
    id v8 = v7;
    v9 = 0;
    uint64_t v10 = *(void *)v21;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        id v19 = 0;
        [v5 removeItemAtURL:v12 error:&v19 v18];
        id v13 = v19;
        if (v13)
        {
          if (!v9) {
            v9 = objc_opt_new();
          }
          [v9 setObject:v13 forKeyedSubscript:v12];
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v20 objects:v26 count:16];
    }
    while (v8);
  }
  else
  {
    v9 = 0;
  }
  if (v18 && [v9 count])
  {
    v24[0] = @"mapsPartialErrorsByFileURL";
    id v14 = [v9 copy];
    v24[1] = NSLocalizedDescriptionKey;
    v25[0] = v14;
    v25[1] = @"Could not successfully delete all the files in the directory";
    v15 = +[NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:2];
    id *v18 = +[NSError errorWithDomain:NSCocoaErrorDomain code:512 userInfo:v15];
  }
  BOOL v16 = [v9 count] == 0;

  return v16;
}

+ (id)_maps_globalCachesURL
{
  v2 = +[NSFileManager defaultManager];
  v3 = +[NSURL fileURLWithPath:@"/private/var/mobile/Library/Caches/com.apple.Maps/"];
  if (([v2 fileExistsAtPath:@"/private/var/mobile/Library/Caches/com.apple.Maps/"] & 1) == 0)
  {
    id v12 = 0;
    unsigned int v4 = [v2 createDirectoryAtURL:v3 withIntermediateDirectories:1 attributes:0 error:&v12];
    v5 = (__CFString *)v12;
    if (v4)
    {
      byte_10160FFF0 = 0;
      v6 = sub_10057637C();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        CFStringRef v14 = @"/private/var/mobile/Library/Caches/com.apple.Maps/";
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Created global caches directory at path %{public}@", buf, 0xCu);
      }

      v11 = v5;
      unsigned __int8 v7 = [v3 setResourceValue:&__kCFBooleanTrue forKey:NSURLIsPurgeableKey error:&v11];
      CFStringRef v8 = v11;

      if (v7) {
        goto LABEL_13;
      }
      v9 = sub_10057637C();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138543362;
        CFStringRef v14 = v8;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_FAULT, "Failed to set Purgeable resource value on caches directory: %{public}@", buf, 0xCu);
      }
    }
    else
    {
      if (byte_10160FFF0)
      {
LABEL_14:

        goto LABEL_15;
      }
      byte_10160FFF0 = 1;
      v9 = sub_10057637C();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138543618;
        CFStringRef v14 = @"/private/var/mobile/Library/Caches/com.apple.Maps/";
        __int16 v15 = 2114;
        BOOL v16 = v5;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_FAULT, "Failed to create global caches directory at path '%{public}@': %{public}@", buf, 0x16u);
      }
      CFStringRef v8 = v5;
    }

LABEL_13:
    v5 = (__CFString *)v8;
    goto LABEL_14;
  }
LABEL_15:

  return v3;
}

@end