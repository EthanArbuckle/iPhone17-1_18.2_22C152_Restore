@interface RMMigrationSystemContainer
- (BOOL)_directoryExistsAtURL:(id)a3;
- (BOOL)_migrateFromURL:(id)a3 toURL:(id)a4 error:(id *)a5;
- (BOOL)_moveDirectory:(id)a3 fromURL:(id)a4 toURL:(id)a5 error:(id *)a6;
- (BOOL)_okToMigrateFromURL:(id)a3 toURL:(id)a4;
- (BOOL)executeReturningError:(id *)a3;
- (NSString)identifier;
@end

@implementation RMMigrationSystemContainer

- (NSString)identifier
{
  return (NSString *)@"RMMigrationSystemContainer";
}

- (BOOL)executeReturningError:(id *)a3
{
  if (+[RMBundle managementScope] == (id)1)
  {
    v5 = +[RMLocations oldBaseDirectoryURLInSystemDomain];
    v6 = +[RMLocations baseDirectoryURLCreateIfNeeded:1];
    if ([(RMMigrationSystemContainer *)self _okToMigrateFromURL:v5 toURL:v6])
    {
      BOOL v7 = [(RMMigrationSystemContainer *)self _migrateFromURL:v5 toURL:v6 error:a3];

      return v7;
    }
  }
  v9 = +[RMLog migrationSystemContainer];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_1000542BC();
  }

  return 1;
}

- (BOOL)_okToMigrateFromURL:(id)a3 toURL:(id)a4
{
  uint64_t v6 = DatabaseDirectoryName;
  id v7 = a4;
  v8 = [a3 URLByAppendingPathComponent:v6];
  v9 = [v7 URLByAppendingPathComponent:v6];

  unsigned __int8 v10 = [(RMMigrationSystemContainer *)self _directoryExistsAtURL:v8];
  unsigned int v11 = [(RMMigrationSystemContainer *)self _directoryExistsAtURL:v9];
  if ((v10 & 1) == 0)
  {
    v12 = +[RMLog migrationSystemContainer];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      sub_100054324();
    }
  }
  if (v11)
  {
    v13 = +[RMLog migrationSystemContainer];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      sub_1000542F0();
    }
  }
  return v10 & ~(_BYTE)v11;
}

- (BOOL)_directoryExistsAtURL:(id)a3
{
  char v8 = 0;
  id v3 = a3;
  v4 = +[NSFileManager defaultManager];
  v5 = [v3 path];

  unsigned __int8 v6 = [v4 fileExistsAtPath:v5 isDirectory:&v8];
  if (v8) {
    return v6;
  }
  else {
    return 0;
  }
}

- (BOOL)_migrateFromURL:(id)a3 toURL:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  unsigned __int8 v10 = +[RMLog migrationSystemContainer];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    sub_100054358();
  }

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v22[0] = DatabaseDirectoryName;
  v22[1] = StatusDirectoryName;
  v22[2] = IdentitiesDirectoryName;
  v22[3] = HTTPLogsDirectoryName;
  unsigned int v11 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v22, 4, 0);
  id v12 = [v11 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v19;
    while (2)
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v11);
        }
        if (![(RMMigrationSystemContainer *)self _moveDirectory:*(void *)(*((void *)&v18 + 1) + 8 * i) fromURL:v8 toURL:v9 error:a5])
        {
          BOOL v16 = 0;
          goto LABEL_13;
        }
      }
      id v13 = [v11 countByEnumeratingWithState:&v18 objects:v23 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }
  BOOL v16 = 1;
LABEL_13:

  return v16;
}

- (BOOL)_moveDirectory:(id)a3 fromURL:(id)a4 toURL:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a5;
  unsigned int v11 = [a4 URLByAppendingPathComponent:v9];
  id v12 = [v10 URLByAppendingPathComponent:v9];

  char v30 = 0;
  id v13 = +[NSFileManager defaultManager];
  uint64_t v14 = [v11 path];
  unsigned __int8 v15 = [v13 fileExistsAtPath:v14 isDirectory:&v30];

  if ((v15 & 1) == 0)
  {
    v26 = +[RMLog migrationSystemContainer];
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
      sub_10005446C((uint64_t)v9, v26);
    }

    id v24 = 0;
    goto LABEL_12;
  }
  BOOL v16 = [v11 path];
  v17 = [v12 path];
  v29[1] = 0;
  int v18 = DMCSafelyCopyItemAtPathToDestinationPath();
  id v19 = 0;

  long long v20 = +[RMLog migrationSystemContainer];
  long long v21 = v20;
  if (v18)
  {
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
      sub_1000543F4((uint64_t)v9, v21);
    }

    v22 = +[NSFileManager defaultManager];
    v29[0] = v19;
    unsigned __int8 v23 = [v22 removeItemAtURL:v11 error:v29];
    id v24 = v29[0];

    if ((v23 & 1) == 0)
    {
      v25 = +[RMLog migrationSystemContainer];
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        sub_10005438C();
      }
    }
LABEL_12:
    BOOL v27 = 1;
    goto LABEL_13;
  }
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
    sub_1000534D0();
  }

  BOOL v27 = 0;
  if (a6 && v19)
  {
    id v24 = v19;
    BOOL v27 = 0;
    *a6 = v24;
  }
  else
  {
    id v24 = v19;
  }
LABEL_13:

  return v27;
}

@end