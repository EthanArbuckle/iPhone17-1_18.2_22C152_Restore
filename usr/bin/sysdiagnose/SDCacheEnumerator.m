@interface SDCacheEnumerator
+ (id)sysdiagnoseDirectory;
+ (id)sysdiagnoseEnumerator:(id)a3 WithVolume:(id)a4 WithFlags:(unint64_t)a5;
+ (id)sysdiagnoseInternalDirectory;
+ (id)validFileSubstrings;
- (BOOL)isSysdiagnoseFile:(id)a3;
- (NSArray)enumerators;
- (id)initCacheEnumerator;
- (id)initCacheEnumeratorWithVolume:(id)a3;
- (id)initCacheEnumeratorWithVolume:(id)a3 WithFlags:(unint64_t)a4;
- (id)nextSysdiagnoseFile;
- (id)nextValidURL;
- (void)setEnumerators:(id)a3;
@end

@implementation SDCacheEnumerator

+ (id)sysdiagnoseDirectory
{
  v2 = +[OSASystemConfiguration sharedInstance];
  v3 = [v2 pathSubmission];
  v4 = [v3 stringByAppendingPathComponent:@"DiagnosticLogs/sysdiagnose"];

  return v4;
}

+ (id)sysdiagnoseInternalDirectory
{
  return @"/private/var/db/sysdiagnose/com.apple.sysdiagnose";
}

+ (id)validFileSubstrings
{
  if (qword_100010418 != -1) {
    dispatch_once(&qword_100010418, &stru_10000C6F8);
  }
  v2 = (void *)qword_100010410;

  return v2;
}

+ (id)sysdiagnoseEnumerator:(id)a3 WithVolume:(id)a4 WithFlags:(unint64_t)a5
{
  id v7 = a3;
  v8 = +[NSURL fileURLWithPath:a4 isDirectory:1];
  v9 = [v8 path];
  if ([v7 hasPrefix:v9])
  {
    uint64_t v10 = [v7 substringFromIndex:[v9 length]];

    id v7 = (id)v10;
  }
  v11 = +[SDCacheEnumerator sysdiagnoseInternalDirectory];
  unsigned int v12 = [v7 isEqualToString:v11];

  if (v12)
  {
    v13 = +[NSURL URLWithString:v7];
  }
  else
  {
    v14 = [v8 path];
    v23[0] = v14;
    v23[1] = v7;
    v15 = +[NSArray arrayWithObjects:v23 count:2];
    v13 = +[NSURL fileURLWithPathComponents:v15];
  }
  v16 = sub_100006D2C();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    id v22 = [v13 fileSystemRepresentation];
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Creating an enumerator at %{public}s", buf, 0xCu);
  }

  if (v13)
  {
    v17 = +[NSFileManager defaultManager];
    v18 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", NSURLIsDirectoryKey, NSURLNameKey, NSURLPathKey, NSURLCreationDateKey, 0);
    v19 = [v17 enumeratorAtURL:v13 includingPropertiesForKeys:v18 options:a5 errorHandler:&stru_10000C738];
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (id)initCacheEnumeratorWithVolume:(id)a3
{
  return [(SDCacheEnumerator *)self initCacheEnumeratorWithVolume:a3 WithFlags:5];
}

- (id)initCacheEnumeratorWithVolume:(id)a3 WithFlags:(unint64_t)a4
{
  v6 = (__CFString *)a3;
  v29.receiver = self;
  v29.super_class = (Class)SDCacheEnumerator;
  id v7 = [(SDCacheEnumerator *)&v29 init];
  if (v7)
  {
    if (!v6) {
      v6 = @"/";
    }
    v8 = +[SDCacheEnumerator sysdiagnoseDirectory];
    v33[0] = v8;
    v9 = +[SDCacheEnumerator sysdiagnoseInternalDirectory];
    v33[1] = v9;
    uint64_t v10 = +[NSArray arrayWithObjects:v33 count:2];

    id v11 = objc_alloc_init((Class)NSMutableArray);
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id obj = v10;
    id v12 = [obj countByEnumeratingWithState:&v25 objects:v32 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v26;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v26 != v14) {
            objc_enumerationMutation(obj);
          }
          v16 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          v17 = [(id)objc_opt_class() sysdiagnoseEnumerator:v16 WithVolume:v6 WithFlags:a4];
          if (v17)
          {
            [v11 addObject:v17];
          }
          else
          {
            v18 = sub_100006D2C();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              id v19 = [v16 UTF8String];
              *(_DWORD *)buf = 136446210;
              id v31 = v19;
              _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "CacheEnumerator: got nil enumerator for dir '%{public}s'", buf, 0xCu);
            }
          }
        }
        id v13 = [obj countByEnumeratingWithState:&v25 objects:v32 count:16];
      }
      while (v13);
    }

    v20 = (NSArray *)[v11 copy];
    enumerators = v7->_enumerators;
    v7->_enumerators = v20;

    id v22 = v7;
  }

  return v7;
}

- (id)initCacheEnumerator
{
  id v3 = [[SDCacheEnumerator alloc] initCacheEnumeratorWithVolume:0];

  return v3;
}

- (BOOL)isSysdiagnoseFile:(id)a3
{
  id v3 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v4 = +[SDCacheEnumerator validFileSubstrings];
  id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v10;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v4);
        }
        if ([v3 rangeOfString:*(void *)(*((void *)&v9 + 1) + 8 * i)] != (id)0x7FFFFFFFFFFFFFFFLL)
        {
          LOBYTE(v5) = 1;
          goto LABEL_11;
        }
      }
      id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (char)v5;
}

- (id)nextSysdiagnoseFile
{
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v3 = [(SDCacheEnumerator *)self enumerators];
  id v16 = [v3 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v22;
    v18 = v3;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v22 != v17) {
          objc_enumerationMutation(v3);
        }
        id v5 = 0;
        uint64_t v6 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        while (1)
        {
          id v7 = v5;
          id v5 = [v6 nextObject];

          if (!v5) {
            break;
          }
          id v20 = 0;
          [v5 getResourceValue:&v20 forKey:NSURLIsDirectoryKey error:0];
          id v9 = v20;
          if ([v9 BOOLValue])
          {
            int v10 = 4;
          }
          else
          {
            long long v11 = [v5 relativePath];
            long long v12 = [v11 pathComponents];
            id v13 = [v12 firstObject];

            if ([(SDCacheEnumerator *)self isSysdiagnoseFile:v13])
            {
              id v19 = v5;
              int v10 = 1;
            }
            else
            {
              [v6 skipDescendants];
              int v10 = 4;
            }
          }
          if (v10 != 4)
          {

            id v3 = v18;
            uint64_t v14 = v19;
            goto LABEL_20;
          }
        }
        id v3 = v18;
      }
      uint64_t v14 = 0;
      id v16 = [v18 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v16);
  }
  else
  {
    uint64_t v14 = 0;
  }
LABEL_20:

  return v14;
}

- (id)nextValidURL
{
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v3 = [(SDCacheEnumerator *)self enumerators];
  id v4 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v16;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = 0;
        id v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        while (1)
        {
          int v10 = [v9 nextObject];

          if (!v10) {
            break;
          }
          long long v11 = [v10 path];
          long long v12 = [v11 lastPathComponent];
          unsigned __int8 v13 = [(SDCacheEnumerator *)self isSysdiagnoseFile:v12];

          v8 = v10;
          if (v13) {
            goto LABEL_14;
          }
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
      int v10 = 0;
    }
    while (v5);
  }
  else
  {
    int v10 = 0;
  }
LABEL_14:

  return v10;
}

- (NSArray)enumerators
{
  return self->_enumerators;
}

- (void)setEnumerators:(id)a3
{
}

- (void).cxx_destruct
{
}

@end