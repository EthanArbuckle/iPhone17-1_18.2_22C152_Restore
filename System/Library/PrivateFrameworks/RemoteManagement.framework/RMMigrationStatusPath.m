@interface RMMigrationStatusPath
- (BOOL)_migrateStatusDirectory:(id)a3 error:(id *)a4;
- (BOOL)_moveDirectoryFromURL:(id)a3 toURL:(id)a4 error:(id *)a5;
- (BOOL)executeReturningError:(id *)a3;
- (NSString)identifier;
- (id)_configurationTypePrefixes;
- (id)_transformName:(id)a3;
- (void)_migrateURL:(id)a3;
@end

@implementation RMMigrationStatusPath

- (NSString)identifier
{
  return (NSString *)@"RMMigrationStatusPath";
}

- (BOOL)executeReturningError:(id *)a3
{
  v5 = +[RMLocations statusDirectoryURLCreateIfNeeded:0];
  v6 = +[NSFileManager defaultManager];
  v7 = [v5 path];
  unsigned __int8 v8 = [v6 fileExistsAtPath:v7 isDirectory:0];

  if (v8)
  {
    BOOL v9 = [(RMMigrationStatusPath *)self _migrateStatusDirectory:v5 error:a3];
  }
  else
  {
    v10 = +[RMLog migrationStatusPath];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      sub_1000533AC(v10);
    }

    BOOL v9 = 1;
  }

  return v9;
}

- (BOOL)_migrateStatusDirectory:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = +[NSFileManager defaultManager];
  unsigned __int8 v8 = [v6 path];
  id v23 = 0;
  BOOL v9 = [v7 contentsOfDirectoryAtPath:v8 error:&v23];
  id v10 = v23;

  if (v9)
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v11 = v9;
    id v12 = [v11 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v20;
      do
      {
        v15 = 0;
        do
        {
          if (*(void *)v20 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = objc_msgSend(v6, "URLByAppendingPathComponent:", *(void *)(*((void *)&v19 + 1) + 8 * (void)v15), (void)v19);
          [(RMMigrationStatusPath *)self _migrateURL:v16];

          v15 = (char *)v15 + 1;
        }
        while (v13 != v15);
        id v13 = [v11 countByEnumeratingWithState:&v19 objects:v24 count:16];
      }
      while (v13);
    }
  }
  else
  {
    v17 = +[RMLog migrationStatusPath];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_1000533F0();
    }

    if (a4 && v10) {
      *a4 = v10;
    }
  }

  return v9 != 0;
}

- (void)_migrateURL:(id)a3
{
  id v4 = a3;
  v5 = +[NSFileManager defaultManager];
  id v6 = [v4 path];
  id v26 = 0;
  v7 = [v5 contentsOfDirectoryAtPath:v6 error:&v26];
  id v8 = v26;

  if (v7)
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    obj = v7;
    id v9 = [obj countByEnumeratingWithState:&v22 objects:v29 count:16];
    if (v9)
    {
      id v10 = v9;
      id v19 = v8;
      long long v20 = v7;
      uint64_t v11 = *(void *)v23;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v23 != v11) {
            objc_enumerationMutation(obj);
          }
          id v13 = objc_msgSend(v4, "URLByAppendingPathComponent:", *(void *)(*((void *)&v22 + 1) + 8 * i), v19, v20);
          uint64_t v14 = [v13 pathComponents];
          id v15 = [v14 mutableCopy];

          v16 = [v15 lastObject];
          [v15 removeLastObject];
          v17 = [(RMMigrationStatusPath *)self _transformName:v16];
          if (v17)
          {
            [v15 addObject:v17];
            v18 = +[NSURL fileURLWithPathComponents:v15];
            [(RMMigrationStatusPath *)self _moveDirectoryFromURL:v13 toURL:v18 error:0];
          }
          else
          {
            v18 = +[RMLog migrationStatusPath];
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138543362;
              v28 = v13;
              _os_log_debug_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "Ignoring status directory %{public}@", buf, 0xCu);
            }
          }
        }
        id v10 = [obj countByEnumeratingWithState:&v22 objects:v29 count:16];
      }
      while (v10);
      id v8 = v19;
      v7 = v20;
    }
  }
  else
  {
    obj = +[RMLog migrationStatusPath];
    if (os_log_type_enabled(obj, OS_LOG_TYPE_ERROR)) {
      sub_1000533F0();
    }
  }
}

- (id)_configurationTypePrefixes
{
  if (qword_1000DB280 != -1) {
    dispatch_once(&qword_1000DB280, &stru_1000C6390);
  }
  v2 = off_1000DAD38;

  return v2;
}

- (id)_transformName:(id)a3
{
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v5 = [(RMMigrationStatusPath *)self _configurationTypePrefixes];
  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if ([v4 hasPrefix:v9])
        {
          objc_msgSend(v4, "substringFromIndex:", objc_msgSend(v9, "length"));
          id v6 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_11;
        }
      }
      id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (BOOL)_moveDirectoryFromURL:(id)a3 toURL:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = +[NSFileManager defaultManager];
  id v15 = 0;
  unsigned int v10 = [v9 moveItemAtURL:v7 toURL:v8 error:&v15];
  id v11 = v15;

  long long v12 = +[RMLog migrationStatusPath];
  long long v13 = v12;
  if (v10)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      sub_100053458();
    }
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_1000534D0();
    }

    if (a5 && v11) {
      *a5 = v11;
    }
  }

  return v10;
}

@end