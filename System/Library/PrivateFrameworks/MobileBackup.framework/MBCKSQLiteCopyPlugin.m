@interface MBCKSQLiteCopyPlugin
- (id)endedBackupWithEngine:(id)a3 error:(id)a4;
- (id)startingBackupWithEngine:(id)a3;
@end

@implementation MBCKSQLiteCopyPlugin

- (id)startingBackupWithEngine:(id)a3
{
  v3 = [a3 persona];
  v4 = [v3 sqliteCopyDirectory];

  id v5 = v4;
  if (mkdir((const char *)[v5 fileSystemRepresentation], 0x1C0u) && *__error() != 17)
  {
    v6 = MBGetDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v7 = *__error();
      *(_DWORD *)buf = 138543618;
      id v10 = v5;
      __int16 v11 = 1024;
      int v12 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Failed to create the directory at %{public}@: %{errno}d", buf, 0x12u);
      __error();
      _MBLog();
    }
  }
  return 0;
}

- (id)endedBackupWithEngine:(id)a3 error:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  int v7 = [v5 persona];
  v8 = [v7 sqliteCopyDirectory];

  memset(&v36, 0, sizeof(v36));
  id v9 = v8;
  if (lstat((const char *)[v9 fileSystemRepresentation], &v36))
  {
    id v10 = MBGetDefaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v11 = *__error();
      *(_DWORD *)buf = 138543618;
      id v38 = v9;
      __int16 v39 = 1024;
      LODWORD(v40) = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Failed to lstat %{public}@: %{errno}d", buf, 0x12u);
      __error();
      _MBLog();
    }
  }
  else
  {
    id v28 = v5;
    id v10 = +[NSFileManager defaultManager];
    id v35 = v6;
    int v12 = [v10 contentsOfDirectoryAtPath:v9 error:&v35];
    id v27 = v35;

    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v13 = v12;
    id v14 = [v13 countByEnumeratingWithState:&v31 objects:v41 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v32;
      do
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v32 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = *(void *)(*((void *)&v31 + 1) + 8 * i);
          v20 = [v9 stringByAppendingPathComponent:v18];
          char v30 = 0;
          if ([v10 fileExistsAtPath:v20 isDirectory:&v30]) {
            BOOL v21 = v30 == 0;
          }
          else {
            BOOL v21 = 0;
          }
          if (v21)
          {
            v22 = MBGetDefaultLog();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              id v38 = v20;
              _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "MBCKSQLiteCopyPlugin: Removing %@", buf, 0xCu);
              _MBLog();
            }

            id v29 = 0;
            unsigned __int8 v23 = [v10 removeItemAtPath:v20 error:&v29];
            id v24 = v29;
            if ((v23 & 1) == 0)
            {
              v25 = MBGetDefaultLog();
              if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412546;
                id v38 = v20;
                __int16 v39 = 2112;
                id v40 = v24;
                _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "MBCKSQLiteCopyPlugin: Unable to remove %@: %@", buf, 0x16u);
                _MBLog();
              }
            }
          }
        }
        id v15 = [v13 countByEnumeratingWithState:&v31 objects:v41 count:16];
      }
      while (v15);
    }

    id v6 = v27;
    id v5 = v28;
  }

  return 0;
}

@end