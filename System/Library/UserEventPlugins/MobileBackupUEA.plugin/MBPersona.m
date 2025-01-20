@interface MBPersona
+ (id)allPersonae;
+ (id)personalPersonaWithError:(id *)a3;
+ (void)removeBackupSnapshotsForAllPersonae;
+ (void)removeBackupSnapshotsForPersonalPersona;
+ (void)removeTemporaryDirectoriesForAllPersonae;
- (void)_removeTemporaryDirectories;
@end

@implementation MBPersona

+ (id)personalPersonaWithError:(id *)a3
{
  v4 = +[UMUserPersonaAttributes personaAttributesForPersonaType:0 withError:a3];
  if (v4)
  {
    v5 = +[MBPersona personaWithAttributes:v4 volumeMountPoint:@"/private/var/mobile"];
  }
  else
  {
    v6 = MBGetDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v9 = 0;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_ERROR, "nil personaAttributes for %ld persona", buf, 0xCu);
      _MBLog();
    }

    if (a3)
    {
      +[MBError errorWithCode:1 format:@"nil personaAttributes"];
      v5 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

+ (id)allPersonae
{
  v2 = objc_opt_new();
  id v13 = 0;
  v3 = +[MBPersona personalPersonaWithError:&v13];
  id v4 = v13;
  if (v3) {
    [v2 addObject:v3];
  }
  v5 = +[UMUserPersonaAttributes personaAttributesForPersonaType:2];
  v6 = v5;
  if (v5)
  {
    v7 = [v5 personaLayoutPathURL];
    v8 = [v7 path];

    if (v8)
    {
      uint64_t v9 = +[MBPersona personaWithAttributes:v6 volumeMountPoint:v8];
      [v2 addObject:v9];
    }
    else
    {
      uint64_t v9 = MBGetDefaultLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v10 = [v6 userPersonaUniqueString];
        *(_DWORD *)buf = 134218242;
        uint64_t v15 = 2;
        __int16 v16 = 2114;
        v17 = v10;
        _os_log_impl(&dword_0, v9, OS_LOG_TYPE_ERROR, "nil volumeMountPoint for %ld persona (%{public}@)", buf, 0x16u);

        v12 = [v6 userPersonaUniqueString];
        _MBLog();
      }
    }
  }

  return v2;
}

+ (void)removeBackupSnapshotsForAllPersonae
{
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = +[MBPersona allPersonae];
  id v2 = [obj countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v2)
  {
    id v3 = v2;
    uint64_t v4 = *(void *)v19;
    do
    {
      v5 = 0;
      do
      {
        if (*(void *)v19 != v4) {
          objc_enumerationMutation(obj);
        }
        v6 = *(void **)(*((void *)&v18 + 1) + 8 * (void)v5);
        long long v14 = 0u;
        long long v15 = 0u;
        long long v16 = 0u;
        long long v17 = 0u;
        v8 = [v6 volumesToBackUp];
        id v9 = [v8 countByEnumeratingWithState:&v14 objects:v22 count:16];
        if (v9)
        {
          id v10 = v9;
          uint64_t v11 = *(void *)v15;
          do
          {
            v12 = 0;
            do
            {
              if (*(void *)v15 != v11) {
                objc_enumerationMutation(v8);
              }
              +[MBFileSystemManager deleteAllSnapshotsForVolume:*(void *)(*((void *)&v14 + 1) + 8 * (void)v12) withPrefix:@"com.apple.mobilebackup" error:0];
              v12 = (char *)v12 + 1;
            }
            while (v10 != v12);
            id v10 = [v8 countByEnumeratingWithState:&v14 objects:v22 count:16];
          }
          while (v10);
        }

        v5 = (char *)v5 + 1;
      }
      while (v5 != v3);
      id v3 = [obj countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v3);
  }
}

+ (void)removeBackupSnapshotsForPersonalPersona
{
  +[MBFileSystemManager deleteAllSnapshotsForVolume:@"/private/var/mobile" withPrefix:@"com.apple.mobilebackup" error:0];

  +[MBFileSystemManager deleteAllSnapshotsForVolume:@"/private/var" withPrefix:@"com.apple.mobilebackup" error:0];
}

- (void)_removeTemporaryDirectories
{
  if ([(MBPersona *)self isPersonalPersona])
  {
    _MBRemoveTemporaryDirectory();
  }
  else
  {
    id v3 = [(MBPersona *)self volumeMountPoint];
    if (!v3) {
      sub_8510();
    }
    long long v17 = v3;
    uint64_t v4 = [v3 stringByAppendingPathComponent:@"tmp"];
    v5 = +[NSFileManager defaultManager];
    v6 = [v5 enumeratorAtPath:v4];

    uint64_t v7 = [v6 nextObject];
    if (v7)
    {
      v8 = (void *)v7;
      do
      {
        if ([v8 hasPrefix:@"backupd-"])
        {
          id v10 = [v4 stringByAppendingPathComponent:v8];
          uint64_t v11 = MBGetDefaultLog();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            long long v20 = v10;
            _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "Removing temporary directory at %{public}@", buf, 0xCu);
            _MBLog();
          }

          v12 = +[NSFileManager defaultManager];
          id v18 = 0;
          unsigned __int8 v13 = [v12 removeItemAtPath:v10 error:&v18];
          id v14 = v18;

          if ((v13 & 1) == 0)
          {
            long long v15 = MBGetDefaultLog();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543618;
              long long v20 = v10;
              __int16 v21 = 2114;
              id v22 = v14;
              _os_log_impl(&dword_0, v15, OS_LOG_TYPE_ERROR, "Failed to remove the temporary directory at %{public}@: %{public}@", buf, 0x16u);
              _MBLog();
            }
          }
        }
        uint64_t v16 = [v6 nextObject];

        v8 = (void *)v16;
      }
      while (v16);
    }
  }
}

+ (void)removeTemporaryDirectoriesForAllPersonae
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = +[MBPersona allPersonae];
  id v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v9 + 1) + 8 * (void)v6);
        [v7 _removeTemporaryDirectories];
        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
}

@end