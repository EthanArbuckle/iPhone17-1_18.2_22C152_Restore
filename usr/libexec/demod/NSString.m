@interface NSString
+ (id)restoreSystemContainerUUIDPathsInDict:(id)a3;
- (BOOL)higherVersionThan:(id)a3;
- (BOOL)isSystemContainerPath;
- (BOOL)isSystemContainerShared;
- (BOOL)lowerVersionThan:(id)a3;
- (NSString)getSystemContainerKeyword;
- (id)_dataUsingHexEncoding;
- (id)_stringForHMAC;
- (id)getSystemContainerRootPath;
- (id)lookupSystemContainerPathUUID;
@end

@implementation NSString

- (BOOL)lowerVersionThan:(id)a3
{
  return [(NSString *)self compare:a3 options:64] == NSOrderedAscending;
}

- (BOOL)higherVersionThan:(id)a3
{
  return (id)[(NSString *)self compare:a3 options:64] == (id)1;
}

- (id)_stringForHMAC
{
  v2 = [(NSString *)self dataUsingEncoding:1];
  v3 = v2;
  if (v2)
  {
    v4 = [v2 base64EncodedStringWithOptions:0];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)_dataUsingHexEncoding
{
  NSUInteger v3 = [(NSString *)self length];
  if (!v3)
  {
    v11 = +[NSData data];
    goto LABEL_11;
  }
  unint64_t v4 = v3;
  if (v3)
  {
    id v8 = [@"0" stringByAppendingString:self];
    id v10 = [v8 _dataUsingHexEncoding];
    goto LABEL_9;
  }
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  CFStringRef theString = (CFStringRef)self;
  uint64_t v46 = 0;
  int64_t v47 = v3;
  CharactersPtr = CFStringGetCharactersPtr((CFStringRef)self);
  CStringPtr = 0;
  v44 = CharactersPtr;
  if (!CharactersPtr) {
    CStringPtr = CFStringGetCStringPtr((CFStringRef)self, 0x600u);
  }
  unint64_t v7 = v4 >> 1;
  uint64_t v48 = 0;
  uint64_t v49 = 0;
  v45 = CStringPtr;
  +[NSMutableData dataWithLength:](NSMutableData, "dataWithLength:", v4 >> 1, v35, v36, v37, v38, v39, v40, v41, v42);
  id v8 = objc_claimAutoreleasedReturnValue();
  v9 = [v8 mutableBytes];
  if (v4 < 2)
  {
LABEL_6:
    id v10 = [v8 copy];
LABEL_9:
    v11 = v10;
    goto LABEL_10;
  }
  v13 = v9;
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = 64;
  while (1)
  {
    uint64_t v17 = (unint64_t)v15 >= 4 ? 4 : v15;
    int64_t v18 = v47;
    if (v47 <= v15) {
      break;
    }
    if (v44)
    {
      UniChar v19 = v44[v15 + v46];
    }
    else if (v45)
    {
      UniChar v19 = v45[v46 + v15];
    }
    else
    {
      uint64_t v20 = v48;
      if (v49 <= v15 || v48 > v15)
      {
        uint64_t v22 = -v17;
        uint64_t v23 = v17 + v14;
        uint64_t v24 = v16 - v17;
        uint64_t v25 = v15 + v22;
        int64_t v26 = v25 + 64;
        if (v25 + 64 >= v47) {
          int64_t v26 = v47;
        }
        uint64_t v48 = v25;
        uint64_t v49 = v26;
        if (v47 >= v24) {
          int64_t v18 = v24;
        }
        v51.length = v18 + v23;
        v51.location = v25 + v46;
        CFStringGetCharacters(theString, v51, (UniChar *)&v35);
        uint64_t v20 = v48;
      }
      UniChar v19 = *((_WORD *)&v35 + v15 - v20);
    }
    if ((unsigned __int16)(v19 - 48) >= 0xAu)
    {
      if ((unsigned __int16)(v19 - 65) >= 6u)
      {
        if ((unsigned __int16)(v19 - 97) > 5u) {
          break;
        }
        char v27 = -87;
      }
      else
      {
        char v27 = -55;
      }
    }
    else
    {
      char v27 = -48;
    }
    int64_t v28 = v15 + 1;
    int64_t v29 = v47;
    if (v47 <= v15 + 1) {
      break;
    }
    if (v44)
    {
      v30 = &v44[v15 + v46];
LABEL_42:
      UniChar v31 = v30[1];
      goto LABEL_45;
    }
    if (!v45)
    {
      if (v49 <= v28 || (uint64_t v33 = v48, v48 > v28))
      {
        if ((unint64_t)v28 >= 4) {
          uint64_t v34 = v15 - 3;
        }
        else {
          uint64_t v34 = 0;
        }
        if (v34 + 64 < v47) {
          int64_t v29 = v34 + 64;
        }
        uint64_t v48 = v34;
        uint64_t v49 = v29;
        v52.location = v46 + v34;
        v52.length = v29 - v34;
        CFStringGetCharacters(theString, v52, (UniChar *)&v35);
        uint64_t v33 = v48;
      }
      v30 = (const UniChar *)&v35 + v15 - v33;
      goto LABEL_42;
    }
    UniChar v31 = v45[v46 + 1 + v15];
LABEL_45:
    char v32 = v31 - 48;
    if ((unsigned __int16)(v31 - 48) >= 0xAu)
    {
      if ((unsigned __int16)(v31 - 65) > 5u)
      {
        if ((unsigned __int16)(v31 - 97) > 5u) {
          break;
        }
        char v32 = v31 - 87;
      }
      else
      {
        char v32 = v31 - 55;
      }
    }
    *v13++ = v32 | (16 * (v19 + v27));
    v14 -= 2;
    v16 += 2;
    v15 += 2;
    if (!--v7) {
      goto LABEL_6;
    }
  }
  v11 = 0;
LABEL_10:

LABEL_11:

  return v11;
}

+ (id)restoreSystemContainerUUIDPathsInDict:(id)a3
{
  id v3 = a3;
  unint64_t v4 = +[NSMutableDictionary dictionary];
  id v27 = +[NSMutableDictionary dictionary];
  int64_t v28 = v3;
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
          uint64_t v14 = sub_100068600();
          BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
          if (v13)
          {
            if (v15)
            {
              uint64_t v16 = [v11 getSystemContainerKeyword];
              *(_DWORD *)buf = v26;
              uint64_t v34 = v16;
              __int16 v35 = 2114;
              long long v36 = v13;
              _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "System container path mapping created: %{public}@ -> %{public}@", buf, 0x16u);
            }
            uint64_t v17 = [v11 getSystemContainerKeyword];
            [v4 setObject:v13 forKey:v17];

LABEL_12:
            int64_t v18 = [v11 getSystemContainerKeyword];
            id v19 = [v11 rangeOfString:v18];
            uint64_t v21 = v20;

            if (v19 == (id)0x7FFFFFFFFFFFFFFFLL)
            {
              uint64_t v22 = sub_100068600();
              if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543362;
                uint64_t v34 = v11;
                _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Cannot locate system container path identifier in path '%{public}@'. Skipping...", buf, 0xCu);
              }
            }
            else
            {
              uint64_t v23 = [v11 stringByReplacingCharactersInRange:v19 withString:v21];
              uint64_t v24 = [v28 objectForKey:v11];
              [v27 setObject:v24 forKey:v23];

              v13 = (void *)v23;
            }
          }
          else
          {
            if (v15)
            {
              *(_DWORD *)buf = 138543362;
              uint64_t v34 = v11;
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