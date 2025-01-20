@interface NSString
+ (id)restoreSystemContainerUUIDPathsInDict:(id)a3;
- (BOOL)isSystemContainerPath;
- (BOOL)isSystemContainerShared;
- (NSString)getSystemContainerKeyword;
- (id)getSystemContainerRootPath;
- (id)lookupSystemContainerPathUUID;
@end

@implementation NSString

+ (id)restoreSystemContainerUUIDPathsInDict:(id)a3
{
  id v3 = a3;
  v4 = +[NSMutableDictionary dictionary];
  id v27 = +[NSMutableDictionary dictionary];
  v28 = v3;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  v5 = [v3 allKeys];
  id v6 = [v5 countByEnumeratingWithState:&v29 objects:v37 count:16];
  if (v6)
  {
    id v8 = v6;
    uint64_t v9 = *(void *)v30;
    *(void *)&long long v7 = 138543618;
    long long v26 = v7;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v30 != v9) {
          objc_enumerationMutation(v5);
        }
        v11 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        if (objc_msgSend(v11, "isSystemContainerPath", v26))
        {
          v12 = [v11 getSystemContainerKeyword];
          v13 = [v4 objectForKey:v12];

          if (v13) {
            goto LABEL_12;
          }
          v13 = [v11 lookupSystemContainerPathUUID];
          v14 = sub_100027250();
          BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
          if (v13)
          {
            if (v15)
            {
              v16 = [v11 getSystemContainerKeyword];
              *(_DWORD *)buf = v26;
              v34 = v16;
              __int16 v35 = 2114;
              v36 = v13;
              _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "System container path mapping created: %{public}@ -> %{public}@", buf, 0x16u);
            }
            v17 = [v11 getSystemContainerKeyword];
            [v4 setObject:v13 forKey:v17];

LABEL_12:
            v18 = [v11 getSystemContainerKeyword];
            id v19 = [v11 rangeOfString:v18];
            uint64_t v21 = v20;

            if (v19 == (id)0x7FFFFFFFFFFFFFFFLL)
            {
              v22 = sub_100027250();
              if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543362;
                v34 = v11;
                _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Cannot locate system container path identifier in path '%{public}@'. Skipping...", buf, 0xCu);
              }
            }
            else
            {
              uint64_t v23 = [v11 stringByReplacingCharactersInRange:v19 withString:v21];
              v24 = [v28 objectForKey:v11];
              [v27 setObject:v24 forKey:v23];

              v13 = (void *)v23;
            }
          }
          else
          {
            if (v15)
            {
              *(_DWORD *)buf = 138543362;
              v34 = v11;
              _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Cannot lookup system container path UUID from path '%{public}@'. Skipping...", buf, 0xCu);
            }
            v13 = v14;
          }

          continue;
        }
      }
      id v8 = [v5 countByEnumeratingWithState:&v29 objects:v37 count:16];
    }
    while (v8);
  }

  return v27;
}

- (NSString)getSystemContainerKeyword
{
  v2 = [(NSString *)self pathComponents];
  id v3 = [v2 objectAtIndex:5];

  return (NSString *)v3;
}

- (BOOL)isSystemContainerPath
{
  v2 = [(NSString *)self stringByStandardizingPath];
  BOOL v5 = 0;
  if (([v2 hasPrefix:@"/var/containers/Data/System"] & 1) != 0
    || [v2 hasPrefix:@"/var/containers/Shared/SystemGroup"])
  {
    id v3 = [v2 pathComponents];
    id v4 = [v3 count];

    if ((unint64_t)v4 > 5) {
      BOOL v5 = 1;
    }
  }

  return v5;
}

- (BOOL)isSystemContainerShared
{
  v2 = [(NSString *)self pathComponents];
  id v3 = [v2 objectAtIndex:3];

  LOBYTE(v2) = [v3 isEqualToString:@"Shared"];
  return (char)v2;
}

- (id)getSystemContainerRootPath
{
  v2 = [(NSString *)self pathComponents];
  id v3 = [v2 subarrayWithRange:0, 6];

  id v4 = +[NSString pathWithComponents:v3];

  return v4;
}

- (id)lookupSystemContainerPathUUID
{
  [(NSString *)self isSystemContainerShared];
  id v3 = [(NSString *)self getSystemContainerKeyword];
  [v3 UTF8String];
  container_create_or_lookup_path_for_current_user();

  return 0;
}

@end