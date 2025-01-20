@interface MBPersona
+ (id)_stashFileAtURL:(id)a3 prefetchDirectory:(id)a4 error:(id *)a5;
+ (id)allPersonae;
+ (id)personalPersonaWithError:(id *)a3;
+ (void)removeBackupSnapshotsForAllPersonae;
+ (void)removeBackupSnapshotsForPersonalPersona;
+ (void)removeTemporaryDirectoriesForAllPersonae;
- (BOOL)_fileSystemSupportsSparseFiles:(id)a3;
- (BOOL)_moveRestoreDirectoryFrom:(id)a3 toFinalLocation:(id)a4 error:(id *)a5;
- (BOOL)cleanupRestoreDirectoriesWithError:(id *)a3;
- (BOOL)copyPlaceholderIPAsForAppInstallationExcluding:(id)a3 error:(id *)a4;
- (BOOL)createRestoreDirectoriesWithError:(id *)a3;
- (BOOL)finalizeRestoreDirectoriesWithError:(id *)a3;
- (BOOL)shouldRestoreFilesSparse;
- (id)copyPreferencesValueForKey:(id)a3 class:(Class)a4;
- (id)restorePathForDriveRestorable:(id)a3;
- (id)sharedSystemContainerRestoreRootWithContainerID:(id)a3;
- (id)stashAsset:(id)a3 forDomain:(id)a4 error:(id *)a5;
- (id)systemContainerRestoreRootWithContainerID:(id)a3;
- (unint64_t)_removeRestorePrefetchCacheAtPath:(id)a3 earliestDate:(id)a4;
- (unint64_t)removeRestorePrefetchCachesOlderThanDate:(id)a3;
- (unsigned)getBooleanValueForKey:(id)a3 keyExists:(char *)a4;
- (void)_removeTemporaryDirectories;
- (void)setPreferencesValue:(id)a3 forKey:(id)a4;
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
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "nil personaAttributes for %ld persona", buf, 0xCu);
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
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "nil volumeMountPoint for %ld persona (%{public}@)", buf, 0x16u);

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
    MBRemoveTemporaryDirectory();
  }
  else
  {
    id v3 = [(MBPersona *)self volumeMountPoint];
    if (!v3) {
      __assert_rtn("-[MBPersona(Helpers) _removeTemporaryDirectories]", "MBPersona+Helpers.m", 80, "volumeMountPoint");
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
            _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Removing temporary directory at %{public}@", buf, 0xCu);
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
              _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Failed to remove the temporary directory at %{public}@: %{public}@", buf, 0x16u);
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

- (void)setPreferencesValue:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (__CFString *)a4;
  if (!v7) {
    __assert_rtn("-[MBPersona(Preferences) setPreferencesValue:forKey:]", "MBPersona+Preferences.m", 18, "key");
  }
  v8 = v7;
  if (![(MBPersona *)self isPersonalPersona])
  {
    long long v9 = [(MBPersona *)self preferencesDirectory];
    long long v10 = +[NSFileManager defaultManager];
    id v33 = 0;
    unsigned __int8 v11 = [v10 createDirectoryAtPath:v9 withIntermediateDirectories:1 attributes:0 error:&v33];
    long long v12 = (__CFString *)v33;

    if ((v11 & 1) == 0)
    {
      unsigned __int8 v13 = MBGetDefaultLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        CFStringRef v35 = (const __CFString *)v9;
        __int16 v36 = 2112;
        v37 = v12;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Failed to create the directory at %{public}@: %@", buf, 0x16u);
        v25 = v9;
        v27 = v12;
        _MBLog();
      }
    }
    id v14 = [v9 stringByAppendingPathComponent:@"com.apple.MobileBackup.plist", v25, v27];
    long long v15 = objc_opt_class();
    objc_sync_enter(v15);
    v32 = v12;
    uint64_t v16 = +[NSData dataWithContentsOfFile:v14 options:0 error:&v32];
    long long v17 = v32;

    if (v16)
    {
      id v31 = 0;
      id v18 = +[NSPropertyListSerialization propertyListWithData:v16 options:1 format:0 error:&v31];
      long long v19 = (__CFString *)v31;

      if (v18)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v17 = v19;
          goto LABEL_24;
        }
        long long v20 = MBGetDefaultLog();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          CFStringRef v35 = (const __CFString *)v18;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Found unexpected class: %@", buf, 0xCu);
          v26 = v18;
          _MBLog();
        }
      }
      else
      {
        id v18 = MBGetDefaultLog();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          CFStringRef v35 = v14;
          __int16 v36 = 2112;
          v37 = v19;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Failed to deserialize data for the file at %@: %@", buf, 0x16u);
          v26 = v14;
          v28 = v19;
          _MBLog();
        }
      }

      long long v17 = v19;
    }
    else
    {
      if (!+[MBError isNSFileNotFoundError:v17])
      {
        v24 = MBGetDefaultLog();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          CFStringRef v35 = v14;
          __int16 v36 = 2112;
          v37 = v17;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "Failed to read the file at %@: %@", buf, 0x16u);
          _MBLog();
        }
        __int16 v21 = 0;
        id v18 = 0;
        goto LABEL_37;
      }
      id v18 = objc_opt_new();
      if (v18)
      {
LABEL_24:
        if (v6) {
          [v18 setObject:v6 forKeyedSubscript:v8];
        }
        else {
          [v18 removeObjectForKey:v8];
        }
        id v30 = 0;
        __int16 v21 = +[NSPropertyListSerialization dataWithPropertyList:format:options:error:](NSPropertyListSerialization, "dataWithPropertyList:format:options:error:", v18, 200, 0, &v30, v26, v28);
        id v22 = (__CFString *)v30;

        if (v21)
        {
          v29 = v22;
          unsigned __int8 v23 = [v21 writeToFile:v14 options:268435457 error:&v29];
          long long v17 = v29;

          if (v23)
          {
LABEL_38:

            objc_sync_exit(v15);
LABEL_39:

            goto LABEL_40;
          }
          v24 = MBGetDefaultLog();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            CFStringRef v35 = v14;
            __int16 v36 = 2112;
            v37 = v17;
            _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "Failed to write data at %@: %@", buf, 0x16u);
            _MBLog();
          }
        }
        else
        {
          v24 = MBGetDefaultLog();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            CFStringRef v35 = v22;
            _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "Failed to serialize dictionary: %@", buf, 0xCu);
            _MBLog();
          }
          __int16 v21 = 0;
          long long v17 = v22;
        }
LABEL_37:

        goto LABEL_38;
      }
    }
    id v18 = objc_opt_new();
    goto LABEL_24;
  }
  CFPreferencesSetValue(v8, v6, @"com.apple.MobileBackup", @"mobile", kCFPreferencesCurrentHost);
  if (!CFPreferencesSynchronize(@"com.apple.MobileBackup", @"mobile", kCFPreferencesCurrentHost))
  {
    long long v9 = MBGetDefaultLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      CFStringRef v35 = @"com.apple.MobileBackup";
      __int16 v36 = 2112;
      v37 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Failed to sync preferences for %{public}@ domain (%@)", buf, 0x16u);
      _MBLog();
    }
    goto LABEL_39;
  }
LABEL_40:
}

- (id)copyPreferencesValueForKey:(id)a3 class:(Class)a4
{
  uint64_t v5 = (__CFString *)a3;
  if (!v5) {
    __assert_rtn("-[MBPersona(Preferences) copyPreferencesValueForKey:class:]", "MBPersona+Preferences.m", 73, "key");
  }
  id v6 = v5;
  if (![(MBPersona *)self isPersonalPersona])
  {
    v8 = [(MBPersona *)self preferencesDirectory];
    long long v9 = [v8 stringByAppendingPathComponent:@"com.apple.MobileBackup.plist"];

    id v20 = 0;
    long long v10 = +[NSData dataWithContentsOfFile:v9 options:0 error:&v20];
    id v11 = v20;
    if (v10)
    {
      id v19 = 0;
      long long v12 = +[NSPropertyListSerialization propertyListWithData:v10 options:0 format:0 error:&v19];
      id v13 = v19;

      if (v12)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
LABEL_19:
          id v11 = v13;
LABEL_20:
          uint64_t v7 = -[NSObject objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", v6, v17, v18);

          if (!v7) {
            goto LABEL_25;
          }
          goto LABEL_21;
        }
        id v14 = MBGetDefaultLog();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v22 = v12;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Found unexpected class: %@", buf, 0xCu);
          long long v17 = v12;
          _MBLog();
        }
      }
      else
      {
        long long v12 = MBGetDefaultLog();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          id v22 = v9;
          __int16 v23 = 2112;
          id v24 = v13;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Failed to deserialize the file at %@: %@", buf, 0x16u);
          long long v17 = v9;
          id v18 = v13;
          _MBLog();
        }
      }
    }
    else
    {
      if (+[MBError isNSFileNotFoundError:v11])
      {
        long long v12 = 0;
        goto LABEL_20;
      }
      long long v12 = MBGetDefaultLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v22 = v9;
        __int16 v23 = 2112;
        id v24 = v11;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Failed to read the file at %@: %@", buf, 0x16u);
        long long v17 = v9;
        id v18 = v11;
        _MBLog();
      }
      id v13 = v11;
    }

    long long v12 = 0;
    goto LABEL_19;
  }
  uint64_t v7 = (void *)CFPreferencesCopyValue(v6, @"com.apple.MobileBackup", @"mobile", kCFPreferencesCurrentHost);
  if (!v7) {
    goto LABEL_25;
  }
LABEL_21:
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    long long v15 = MBGetDefaultLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v22 = v6;
      __int16 v23 = 2112;
      id v24 = v7;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Invalid class for \"%{public}@\" key: %@", buf, 0x16u);
      _MBLog();
    }

    uint64_t v7 = 0;
  }
LABEL_25:

  return v7;
}

- (unsigned)getBooleanValueForKey:(id)a3 keyExists:(char *)a4
{
  id v6 = a3;
  id v7 = [(MBPersona *)self copyPreferencesValueForKey:v6 class:objc_opt_class()];

  if (v7)
  {
    if (a4) {
      *a4 = 1;
    }
    unsigned __int8 v8 = [v7 BOOLValue];
  }
  else
  {
    unsigned __int8 v8 = 0;
    if (a4) {
      *a4 = 0;
    }
  }

  return v8;
}

- (id)systemContainerRestoreRootWithContainerID:(id)a3
{
  id v4 = a3;
  sub_10028D6EC(v4);
  uint64_t v5 = [(MBPersona *)self systemDataContainerRestoreDirectory];
  id v6 = [v5 stringByAppendingPathComponent:v4];

  return v6;
}

- (id)sharedSystemContainerRestoreRootWithContainerID:(id)a3
{
  id v4 = a3;
  sub_10028D6EC(v4);
  uint64_t v5 = [(MBPersona *)self systemSharedDataContainerRestoreDirectory];
  id v6 = [v5 stringByAppendingPathComponent:v4];

  return v6;
}

- (id)restorePathForDriveRestorable:(id)a3
{
  id v4 = a3;
  if (!v4) {
    __assert_rtn("-[MBPersona(RestoreLocationAdditions) restorePathForDriveRestorable:]", "MBPersona+RestoreLocations.m", 42, "restorable");
  }
  uint64_t v5 = v4;
  id v6 = [v4 domain];
  if ([v6 shouldRestoreToSharedVolume]) {
    [(MBPersona *)self sharedIncompleteRestoreDirectory];
  }
  else {
  id v7 = [(MBPersona *)self userIncompleteRestoreDirectory];
  }
  unsigned __int8 v8 = [v5 absolutePath];
  long long v9 = [v7 stringByAppendingPathComponent:v8];

  return v9;
}

- (id)stashAsset:(id)a3 forDomain:(id)a4 error:(id *)a5
{
  id v8 = a3;
  long long v9 = [(MBPersona *)self restorePrefetchDirectoryForDomain:a4];
  long long v10 = [(id)objc_opt_class() _stashFileAtURL:v8 prefetchDirectory:v9 error:a5];

  if (v10)
  {
    id v11 = [v10 path];
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

+ (id)_stashFileAtURL:(id)a3 prefetchDirectory:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  if (!v7) {
    __assert_rtn("+[MBPersona(RestoreLocationAdditions) _stashFileAtURL:prefetchDirectory:error:]", "MBPersona+RestoreLocations.m", 58, "srcURL");
  }
  long long v9 = v8;
  if (!v8) {
    __assert_rtn("+[MBPersona(RestoreLocationAdditions) _stashFileAtURL:prefetchDirectory:error:]", "MBPersona+RestoreLocations.m", 59, "prefetchDirectory");
  }
  if (!a5) {
    __assert_rtn("+[MBPersona(RestoreLocationAdditions) _stashFileAtURL:prefetchDirectory:error:]", "MBPersona+RestoreLocations.m", 60, "error");
  }
  long long v10 = +[MBFileOperation createPathInDirectory:v8 fileName:0];
  id v11 = [objc_alloc((Class)NSURL) initFileURLWithPath:v10];
  long long v12 = +[NSFileManager defaultManager];
  id v29 = 0;
  unsigned __int8 v13 = [v12 moveItemAtURL:v7 toURL:v11 error:&v29];
  id v14 = v29;

  if (v13)
  {
    id v15 = v11;
    goto LABEL_21;
  }
  uint64_t v16 = [v7 path];
  long long v17 = MBGetDefaultLog();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    buf.st_dev = 138412802;
    *(void *)&buf.st_mode = v16;
    WORD2(buf.st_ino) = 2112;
    *(__darwin_ino64_t *)((char *)&buf.st_ino + 6) = (__darwin_ino64_t)v10;
    HIWORD(buf.st_gid) = 2112;
    *(void *)&buf.st_rdev = v14;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Failed to move %@ to %@: %@", (uint8_t *)&buf, 0x20u);
    _MBLog();
  }

  *a5 = v14;
  memset(&buf, 0, sizeof(buf));
  id v18 = v16;
  int v19 = lstat((const char *)[v18 fileSystemRepresentation], &buf);
  id v20 = MBGetDefaultLog();
  __int16 v21 = v20;
  if (v19)
  {
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      goto LABEL_14;
    }
    int v22 = *__error();
    *(_DWORD *)id v30 = 138412546;
    id v31 = v18;
    __int16 v32 = 1024;
    int v33 = v22;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "lstat failed at %@: %{errno}d", v30, 0x12u);
    __error();
  }
  else
  {
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_INFO)) {
      goto LABEL_14;
    }
    *(_DWORD *)id v30 = 138412290;
    id v31 = v18;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "Found source file at %@", v30, 0xCu);
  }
  _MBLog();
LABEL_14:

  id v23 = v10;
  int v24 = lstat((const char *)[v23 fileSystemRepresentation], &buf);
  v25 = MBGetDefaultLog();
  v26 = v25;
  if (v24)
  {
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      int v27 = *__error();
      *(_DWORD *)id v30 = 138412546;
      id v31 = v23;
      __int16 v32 = 1024;
      int v33 = v27;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "lstat failed at %@: %{errno}d", v30, 0x12u);
      __error();
LABEL_19:
      _MBLog();
    }
  }
  else if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)id v30 = 138412290;
    id v31 = v23;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "Found destination file at %@", v30, 0xCu);
    goto LABEL_19;
  }

  id v15 = 0;
LABEL_21:

  return v15;
}

- (BOOL)shouldRestoreFilesSparse
{
  id v4 = MBGetDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(a2);
    uint64_t v5 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)stat buf = 138412546;
    __int16 v21 = v5;
    __int16 v22 = 2112;
    id v23 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "%@: persona:%@", buf, 0x16u);

    long long v17 = NSStringFromSelector(a2);
    id v18 = self;
    _MBLog();
  }
  id v6 = [(MBPersona *)self volumeMountPoint];
  if (qword_100482858 != -1) {
    dispatch_once(&qword_100482858, &stru_100417B80);
  }
  os_unfair_lock_lock((os_unfair_lock_t)&dword_100482848);
  id v7 = [(id)qword_100482850 objectForKeyedSubscript:v6];
  if (!v7)
  {
    char v19 = 0;
    unsigned int v8 = [(MBPersona *)self getBooleanValueForKey:@"RestoreFilesSparse" keyExists:&v19];
    unsigned int v9 = [(MBPersona *)self _fileSystemSupportsSparseFiles:v6];
    uint64_t v10 = 0;
    if (v9)
    {
      if (v19) {
        BOOL v11 = v8 == 0;
      }
      else {
        BOOL v11 = 0;
      }
      uint64_t v10 = !v11;
    }
    long long v12 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v10, v17, v18);
    [(id)qword_100482850 setObject:v12 forKeyedSubscript:v6];
    id v7 = v12;
    unsigned __int8 v13 = MBGetDefaultLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      if ([v7 BOOLValue]) {
        id v14 = "YES";
      }
      else {
        id v14 = "NO";
      }
      *(_DWORD *)stat buf = 136315138;
      __int16 v21 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "shouldRestoreFilesSparse=%s", buf, 0xCu);
      [v7 BOOLValue];
      _MBLog();
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&dword_100482848);
  unsigned __int8 v15 = [v7 BOOLValue];

  return v15;
}

- (BOOL)_fileSystemSupportsSparseFiles:(id)a3
{
  id v3 = a3;
  int v4 = open((const char *)[v3 fileSystemRepresentation], 0);
  if (v4 < 0)
  {
    id v7 = MBGetDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = *__error();
      *(_DWORD *)uint64_t v16 = 138412546;
      *(void *)&v16[4] = v3;
      *(_WORD *)&v16[12] = 1024;
      *(_DWORD *)&v16[14] = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Unable to open %@: %{errno}d while checking if FS supports sparse files", v16, 0x12u);
      __error();
      _MBLog();
    }
  }
  else
  {
    int v5 = v4;
    uint64_t v13 = 0;
    long long v12 = xmmword_1003B3950;
    int v17 = 0;
    memset(v16, 0, sizeof(v16));
    if (!fgetattrlist(v4, &v12, v16, 0x24uLL, 0))
    {
      unsigned int v10 = *(_DWORD *)&v16[4] & *(_DWORD *)&v16[20];
      close(v5);
      BOOL v9 = (v10 >> 6) & 1;
      goto LABEL_11;
    }
    id v6 = MBGetDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)stat buf = 138412290;
      id v15 = v3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Couldn't get attr list for filesystem path %@ while checking if it can support sparse files", buf, 0xCu);
      _MBLog();
    }

    close(v5);
  }
  LOBYTE(v9) = 0;
LABEL_11:

  return v9;
}

- (BOOL)createRestoreDirectoriesWithError:(id *)a3
{
  id v6 = MBGetDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    id v7 = NSStringFromSelector(a2);
    *(_DWORD *)stat buf = 138412546;
    id v30 = v7;
    __int16 v31 = 2112;
    __int16 v32 = self;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "%@: persona:%@", buf, 0x16u);

    id v23 = NSStringFromSelector(a2);
    _MBLog();
  }
  int v8 = MBGetDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    BOOL v9 = [(MBPersona *)self userIncompleteRestoreDirectory];
    *(_DWORD *)stat buf = 138412290;
    id v30 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Creating user incomplete restore directory: %@", buf, 0xCu);

    int v24 = [(MBPersona *)self userIncompleteRestoreDirectory];
    _MBLog();
  }
  unsigned int v10 = [(MBPersona *)self userIncompleteRestoreDirectory];
  id v28 = 0;
  char v11 = sub_10028E7E0(v10, 2, (uint64_t)&v28);
  id v12 = v28;

  if (v11)
  {
    unsigned int v13 = [(MBPersona *)self shouldRestoreToSharedVolume];
    id v14 = MBGetDefaultLog();
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_INFO);
    if (v13)
    {
      if (v15)
      {
        uint64_t v16 = [(MBPersona *)self sharedIncompleteRestoreDirectory];
        *(_DWORD *)stat buf = 138412290;
        id v30 = v16;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Creating shared incomplete restore directory: %@", buf, 0xCu);

        v25 = [(MBPersona *)self sharedIncompleteRestoreDirectory];
        _MBLog();
      }
      int v17 = [(MBPersona *)self sharedIncompleteRestoreDirectory];
      id v27 = v12;
      BOOL v18 = 1;
      char v19 = sub_10028E7E0(v17, 1, (uint64_t)&v27);
      id v20 = v27;

      if ((v19 & 1) == 0)
      {
        if (a3)
        {
          +[MBError errorWithCode:102 error:v20 format:@"Error creating incomplete shared restore directory"];
          BOOL v18 = 0;
          *a3 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          BOOL v18 = 0;
        }
      }
      id v12 = v20;
    }
    else
    {
      if (v15)
      {
        __int16 v21 = [(MBPersona *)self sharedIncompleteRestoreDirectory];
        *(_DWORD *)stat buf = 138412290;
        id v30 = v21;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Skipping shared creating incomplete restore directory: %@", buf, 0xCu);

        v26 = [(MBPersona *)self sharedIncompleteRestoreDirectory];
        _MBLog();
      }
      BOOL v18 = 1;
    }
  }
  else if (a3)
  {
    +[MBError errorWithCode:102 error:v12 format:@"Error creating incomplete user restore directory"];
    BOOL v18 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v18 = 0;
  }

  return v18;
}

- (BOOL)cleanupRestoreDirectoriesWithError:(id *)a3
{
  id v6 = MBGetDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    id v7 = NSStringFromSelector(a2);
    *(_DWORD *)stat buf = 138412546;
    uint64_t v16 = v7;
    __int16 v17 = 2112;
    BOOL v18 = self;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "%@: persona:%@", buf, 0x16u);

    id v14 = NSStringFromSelector(a2);
    _MBLog();
  }
  int v8 = +[NSFileManager defaultManager];
  BOOL v9 = [(MBPersona *)self userRestoreDirectory];
  unsigned int v10 = objc_msgSend(v8, "mb_moveToTmpDirThenRemoveItemAtPath:error:", v9, a3);

  if (v10)
  {
    if ([(MBPersona *)self shouldRestoreToSharedVolume])
    {
      char v11 = [(MBPersona *)self sharedRestoreDirectory];
      unsigned __int8 v12 = objc_msgSend(v8, "mb_moveToTmpDirThenRemoveItemAtPath:error:", v11, a3);
    }
    else
    {
      unsigned __int8 v12 = 1;
    }
  }
  else
  {
    unsigned __int8 v12 = 0;
  }

  return v12;
}

- (unint64_t)removeRestorePrefetchCachesOlderThanDate:(id)a3
{
  id v5 = a3;
  id v6 = MBGetDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    id v7 = NSStringFromSelector(a2);
    *(_DWORD *)stat buf = 138412546;
    id v23 = v7;
    __int16 v24 = 2112;
    v25 = self;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "%@: persona:%@", buf, 0x16u);

    BOOL v15 = NSStringFromSelector(a2);
    uint64_t v16 = self;
    _MBLog();
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  int v8 = [(MBPersona *)self restorePrefetchDirectories];
  id v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    id v10 = v9;
    unint64_t v11 = 0;
    uint64_t v12 = *(void *)v18;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v8);
        }
        v11 += -[MBPersona _removeRestorePrefetchCacheAtPath:earliestDate:](self, "_removeRestorePrefetchCacheAtPath:earliestDate:", *(void *)(*((void *)&v17 + 1) + 8 * i), v5, v15, v16);
      }
      id v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v10);
  }
  else
  {
    unint64_t v11 = 0;
  }

  return v11;
}

- (unint64_t)_removeRestorePrefetchCacheAtPath:(id)a3 earliestDate:(id)a4
{
  id v5 = a3;
  id v38 = a4;
  id v6 = MBGetDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)stat buf = 138543362;
    id v45 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Removing the prefetch directory at %{public}@", buf, 0xCu);
    id v34 = v5;
    _MBLog();
  }

  id v7 = +[NSFileManager defaultManager];
  if (([v7 fileExistsAtPath:v5] & 1) == 0)
  {
    int v8 = MBGetDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)stat buf = 138543362;
      id v45 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "No prefetch directory found at %{public}@", buf, 0xCu);
      _MBLog();
    }
    goto LABEL_23;
  }
  v37 = v7;
  if (v38)
  {
    int v8 = [v7 enumeratorAtPath:v5];
    uint64_t v10 = [v8 nextObject];
    if (v10)
    {
      unint64_t v11 = (void *)v10;
      unint64_t v36 = 0;
      do
      {
        uint64_t v12 = objc_msgSend(v5, "stringByAppendingPathComponent:", v11, v34, v35);
        id v40 = 0;
        unsigned int v13 = [v7 attributesOfItemAtPath:v12 error:&v40];
        id v14 = v40;
        if (v13)
        {
          BOOL v15 = [v13 objectForKeyedSubscript:NSFileCreationDate];
          if (v15 && [v38 compare:v15] == (id)-1)
          {
            id v17 = v14;
          }
          else
          {
            id v39 = v14;
            unsigned __int8 v16 = [v7 removeItemAtPath:v12 error:&v39];
            id v17 = v39;

            if (v16)
            {
              long long v18 = [v13 objectForKeyedSubscript:NSFileSize];
              unint64_t v19 = (unint64_t)[v18 unsignedLongLongValue];

              long long v20 = MBGetDefaultLog();
              if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)stat buf = 138412546;
                id v45 = v12;
                __int16 v46 = 2048;
                unint64_t v47 = v19;
                _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "Removed %@: %llu bytes", buf, 0x16u);
                id v34 = v12;
                id v35 = (id)v19;
                _MBLog();
              }

              v36 += v19;
            }
            else
            {
              __int16 v21 = MBGetDefaultLog();
              if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)stat buf = 138412546;
                id v45 = v12;
                __int16 v46 = 2112;
                unint64_t v47 = (unint64_t)v17;
                _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "Failed to remove %@: %@", buf, 0x16u);
                id v34 = v12;
                id v35 = v17;
                _MBLog();
              }
            }
          }

          id v14 = v17;
          id v7 = v37;
        }

        unint64_t v11 = [v8 nextObject];
      }
      while (v11);
    }
    else
    {
      unint64_t v36 = 0;
    }
    unint64_t v22 = v36;
LABEL_33:

    int v8 = MBGetDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)stat buf = 138543618;
      id v45 = v5;
      __int16 v46 = 2048;
      unint64_t v47 = v22;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Removed %{public}@ (%llu bytes)", buf, 0x16u);
      _MBLog();
    }
    goto LABEL_48;
  }
  id v43 = 0;
  id v23 = +[MBTemporaryDirectory temporaryDirectoryOnSameVolumeAsPath:v5 identifiedBy:@"prefetch-dir-cleanup" error:&v43];
  id v24 = v43;
  if (!v23)
  {
    id v7 = v37;
    if (MBIsInternalInstall())
    {
      id v29 = MBGetDefaultLog();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)stat buf = 138412290;
        id v45 = v24;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_FAULT, "Failed to create temporary directory %@", buf, 0xCu);
        id v34 = v24;
        _MBLog();
      }
    }
    id v42 = v24;
    unsigned __int8 v30 = objc_msgSend(v37, "removeItemAtPath:error:", v5, &v42, v34);
    int v8 = v42;

    if ((v30 & 1) == 0)
    {
      __int16 v31 = MBGetDefaultLog();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)stat buf = 138543618;
        id v45 = v5;
        __int16 v46 = 2112;
        unint64_t v47 = (unint64_t)v8;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "Failed to remove %{public}@: %@", buf, 0x16u);
        _MBLog();
      }
    }
LABEL_23:
    unint64_t v22 = 0;
    goto LABEL_48;
  }
  v25 = [v23 makeTemporaryFilePath];
  id v41 = v24;
  unsigned __int8 v26 = [v37 moveItemAtPath:v5 toPath:v25 error:&v41];
  int v8 = v41;

  if (v26)
  {
    id v27 = MBGetDefaultLog();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)stat buf = 138543618;
      id v45 = v5;
      __int16 v46 = 2114;
      unint64_t v47 = (unint64_t)v25;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "Moved prefetch directory from %{public}@ -> %{public}@", buf, 0x16u);
      _MBLog();
    }

    [v23 dispose];
    id v28 = MBGetDefaultLog();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)stat buf = 138543362;
      id v45 = v5;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Removed prefetch directory at %{public}@", buf, 0xCu);
      _MBLog();
    }

    unint64_t v22 = 0;
    id v7 = v37;
    goto LABEL_33;
  }
  if (MBIsInternalInstall())
  {
    __int16 v32 = MBGetDefaultLog();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)stat buf = 138543874;
      id v45 = v5;
      __int16 v46 = 2114;
      unint64_t v47 = (unint64_t)v25;
      __int16 v48 = 2112;
      v49 = v8;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_FAULT, "Failed to move prefetch directory from %{public}@ -> %{public}@: %@", buf, 0x20u);
      _MBLog();
    }
  }
  unint64_t v22 = 0;
  id v7 = v37;
LABEL_48:

  return v22;
}

- (BOOL)finalizeRestoreDirectoriesWithError:(id *)a3
{
  if (!a3) {
    __assert_rtn("-[MBPersona(RestoreLocationAdditions) finalizeRestoreDirectoriesWithError:]", "MBPersona+RestoreLocations.m", 294, "error");
  }
  id v6 = MBGetDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(a2);
    id v7 = (MBPersona *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)stat buf = 138412546;
    __int16 v46 = v7;
    __int16 v47 = 2112;
    __int16 v48 = self;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "%@: persona:%@", buf, 0x16u);

    id v41 = NSStringFromSelector(a2);
    id v42 = self;
    _MBLog();
  }
  int v8 = MBGetDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = [(MBPersona *)self userIncompleteRestoreDirectory];
    uint64_t v10 = [(MBPersona *)self userRestoreDirectory];
    *(_DWORD *)stat buf = 138412546;
    __int16 v46 = v9;
    __int16 v47 = 2112;
    __int16 v48 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Moving user restore directory into place: %@ -> %@", buf, 0x16u);

    unint64_t v11 = [(MBPersona *)self userIncompleteRestoreDirectory];
    [(MBPersona *)self userRestoreDirectory];
    v42 = id v41 = v11;
    _MBLog();
  }
  uint64_t v12 = [(MBPersona *)self userIncompleteRestoreDirectory];
  unsigned int v13 = [(MBPersona *)self userRestoreDirectory];
  unsigned int v14 = [(MBPersona *)self _moveRestoreDirectoryFrom:v12 toFinalLocation:v13 error:a3];

  if (!v14) {
    return 0;
  }
  if ([(MBPersona *)self shouldRestoreToSharedVolume])
  {
    BOOL v15 = MBGetDefaultLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      unsigned __int8 v16 = [(MBPersona *)self sharedIncompleteRestoreDirectory];
      id v17 = [(MBPersona *)self sharedRestoreDirectory];
      *(_DWORD *)stat buf = 138412546;
      __int16 v46 = v16;
      __int16 v47 = 2112;
      __int16 v48 = v17;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Moving shared restore directory into place: %@ -> %@", buf, 0x16u);

      long long v18 = [(MBPersona *)self sharedIncompleteRestoreDirectory];
      [(MBPersona *)self sharedRestoreDirectory];
      v42 = id v41 = v18;
      _MBLog();
    }
    unint64_t v19 = [(MBPersona *)self sharedIncompleteRestoreDirectory];
    long long v20 = [(MBPersona *)self sharedRestoreDirectory];
    unsigned int v21 = [(MBPersona *)self _moveRestoreDirectoryFrom:v19 toFinalLocation:v20 error:a3];

    if (!v21) {
      return 0;
    }
  }
  unint64_t v22 = +[MBBehaviorOptions sharedOptions];
  id v23 = [v22 plistPath];

  if (MBIsInternalInstall())
  {
    id v24 = +[NSFileManager defaultManager];
    unsigned int v25 = [v24 fileExistsAtPath:v23];

    if (v25)
    {
      unsigned __int8 v26 = [(MBPersona *)self userRestoreDirectory];
      id v27 = [v26 stringByAppendingPathComponent:v23];

      id v28 = +[NSFileManager defaultManager];
      unsigned int v29 = [v28 fileExistsAtPath:v27];

      if (v29)
      {
        unsigned __int8 v30 = MBGetDefaultLog();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)stat buf = 138412290;
          __int16 v46 = v27;
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Removing existing MBBehaviorOptions plist in backup %@", buf, 0xCu);
          _MBLog();
        }

        __int16 v31 = +[NSFileManager defaultManager];
        id v44 = 0;
        unsigned __int8 v32 = [v31 removeItemAtPath:v27 error:&v44];
        int v33 = (MBPersona *)v44;

        if ((v32 & 1) == 0)
        {
          id v34 = MBGetDefaultLog();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)stat buf = 138412290;
            __int16 v46 = v33;
            _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "Failed to remove existing MBBehaviorOptions plist: %@", buf, 0xCu);
            _MBLog();
          }
        }
      }
      else
      {
        int v33 = 0;
      }
      unint64_t v36 = MBGetDefaultLog();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)stat buf = 138412546;
        __int16 v46 = v23;
        __int16 v47 = 2112;
        __int16 v48 = v27;
        _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "Moving local MBBehaviorOptions plist from %@ -> %@", buf, 0x16u);
        _MBLog();
      }

      v37 = +[NSFileManager defaultManager];
      id v43 = v33;
      unsigned __int8 v38 = [v37 moveItemAtPath:v23 toPath:v27 error:&v43];
      id v39 = v43;

      if ((v38 & 1) == 0)
      {
        id v40 = MBGetDefaultLog();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)stat buf = 138412290;
          __int16 v46 = v39;
          _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, "Failed to move MBBehaviorOptions plist: %@", buf, 0xCu);
          _MBLog();
        }
      }
    }
  }

  return 1;
}

- (BOOL)_moveRestoreDirectoryFrom:(id)a3 toFinalLocation:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  if (!a5) {
    __assert_rtn("-[MBPersona(RestoreLocationAdditions) _moveRestoreDirectoryFrom:toFinalLocation:error:]", "MBPersona+RestoreLocations.m", 330, "outError");
  }
  id v9 = v8;
  uint64_t v10 = +[NSFileManager defaultManager];
  if ([v10 fileExistsAtPath:v7 isDirectory:0])
  {
    if ([v10 fileExistsAtPath:v9 isDirectory:0])
    {
      id v22 = 0;
      unsigned __int8 v11 = objc_msgSend(v10, "mb_moveToTmpDirThenRemoveItemAtPath:error:", v9, &v22);
      id v12 = v22;
      if ((v11 & 1) == 0)
      {
        unsigned int v13 = MBGetDefaultLog();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)stat buf = 138543618;
          id v24 = v9;
          __int16 v25 = 2114;
          id v26 = v12;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Failed to remove existing restore directory at %{public}@: %{public}@", buf, 0x16u);
          unint64_t v19 = v9;
          id v20 = v12;
          _MBLog();
        }

        *a5 = +[MBError errorWithCode:102 error:v12 path:v9 format:@"Failed to remove existing restore directory"];
      }
    }
    id v21 = 0;
    unsigned __int8 v14 = objc_msgSend(v10, "moveItemAtPath:toPath:error:", v7, v9, &v21, v19, v20);
    BOOL v15 = v21;
    if (v14)
    {
      BOOL v16 = 1;
    }
    else
    {
      id v17 = MBGetDefaultLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)stat buf = 138543874;
        id v24 = v7;
        __int16 v25 = 2114;
        id v26 = v9;
        __int16 v27 = 2114;
        id v28 = v15;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Failed to move restore sandbox from %{public}@ into place %{public}@: %{public}@", buf, 0x20u);
        _MBLog();
      }

      +[MBError errorWithCode:101 path:v9 format:@"Failed to move restore sandbox into place"];
      BOOL v16 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    BOOL v15 = MBGetDefaultLog();
    BOOL v16 = 1;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)stat buf = 138543362;
      id v24 = v7;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "No restore sandbox at %{public}@", buf, 0xCu);
      _MBLog();
    }
  }

  return v16;
}

- (BOOL)copyPlaceholderIPAsForAppInstallationExcluding:(id)a3 error:(id *)a4
{
  id v46 = a3;
  __int16 v47 = self;
  v50 = [(MBPersona *)self userIncompleteRestoreDirectory];
  unsigned __int8 v5 = [(MBPersona *)self isPersonalPersona];
  id v6 = [(MBPersona *)self appPlaceholderArchiveDirectory];
  id v7 = v6;
  if ((v5 & 1) == 0 && [v6 hasPrefix:@"/private"])
  {
    uint64_t v8 = [v7 substringFromIndex:objc_msgSend(@"/private", "length")];

    id v7 = (void *)v8;
  }
  v49 = [v50 stringByAppendingPathComponent:v7];

  id v9 = [(MBPersona *)v47 placeholderRestoreDirectory];
  __int16 v48 = [v50 stringByAppendingPathComponent:v9];

  uint64_t v10 = MBGetDefaultLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)stat buf = 138412546;
    *(void *)&uint8_t buf[4] = v49;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v48;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "=restore-placeholder= Moving placeholders from %@ to %@", buf, 0x16u);
    id v41 = v49;
    id v42 = v48;
    _MBLog();
  }

  v52 = +[NSFileManager defaultManager];
  if ([v52 fileExistsAtPath:v49])
  {
    if ([v52 fileExistsAtPath:v48])
    {
      *(void *)stat buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000;
      v68 = sub_100290A00;
      v69 = sub_100290A10;
      id v70 = 0;
      id v43 = +[NSURL fileURLWithPath:v49];
      NSURLResourceKey v66 = NSURLIsRegularFileKey;
      unsigned __int8 v11 = +[NSArray arrayWithObjects:&v66 count:1];
      v60[0] = _NSConcreteStackBlock;
      v60[1] = 3221225472;
      v60[2] = sub_100290A18;
      v60[3] = &unk_100417918;
      v60[4] = buf;
      id v12 = [v52 enumeratorAtURL:v43 includingPropertiesForKeys:v11 options:1 errorHandler:v60];

      long long v58 = 0u;
      long long v59 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      id obj = v12;
      id v13 = [obj countByEnumeratingWithState:&v56 objects:v65 count:16];
      if (v13)
      {
        uint64_t v51 = *(void *)v57;
        while (2)
        {
          for (i = 0; i != v13; i = (char *)i + 1)
          {
            if (*(void *)v57 != v51) {
              objc_enumerationMutation(obj);
            }
            BOOL v15 = *(NSObject **)(*((void *)&v56 + 1) + 8 * i);
            id v54 = 0;
            id v55 = 0;
            uint64_t v16 = *(void *)&buf[8];
            unsigned __int8 v17 = -[NSObject getResourceValue:forKey:error:](v15, "getResourceValue:forKey:error:", &v55, NSURLIsRegularFileKey, &v54, v41, v42);
            id v18 = v55;
            objc_storeStrong((id *)(v16 + 40), v54);
            if ((v17 & 1) == 0)
            {
              unsigned __int8 v30 = MBGetDefaultLog();
              if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
              {
                __int16 v31 = *(NSObject **)(*(void *)&buf[8] + 40);
                *(_DWORD *)v61 = 138412546;
                v62 = v15;
                __int16 v63 = 2112;
                v64 = v31;
                _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "=restore-placeholder= Failed to get NSURLIsDirectoryKey for %@: %@", v61, 0x16u);
                _MBLog();
              }

              goto LABEL_41;
            }
            unint64_t v19 = [v15 path];
            if ([v18 BOOLValue])
            {
              id v20 = [v19 lastPathComponent];
              id v21 = [v20 pathExtension];
              if ([v21 isEqualToString:@"ipa"])
              {
                id v22 = [v20 stringByDeletingPathExtension];
                if ([v46 containsObject:v22])
                {
                  id v23 = MBGetDefaultLog();
                  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)v61 = 138412546;
                    v62 = v19;
                    __int16 v63 = 2112;
                    v64 = v22;
                    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "=restore-placeholder= Not moving restored placeholder .ipa at %@ corresponding to excluded bundleID %@", v61, 0x16u);
                    id v41 = v19;
                    id v42 = v22;
                    _MBLog();
                  }
                }
                else
                {
                  id v23 = [v48 stringByAppendingPathComponent:v22];
                  id v24 = MBMobileFileAttributes();
                  unsigned __int8 v25 = [v52 createDirectoryAtPath:v23 withIntermediateDirectories:1 attributes:v24 error:a4];

                  if ((v25 & 1) == 0)
                  {

                    goto LABEL_60;
                  }
                  id v26 = [v23 stringByAppendingPathComponent:v20];
                  if (([v52 copyItemAtPath:v19 toPath:v26 error:a4] & 1) == 0)
                  {

                    goto LABEL_60;
                  }
                  __int16 v27 = MBGetDefaultLog();
                  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)v61 = 138412546;
                    v62 = v19;
                    __int16 v63 = 2112;
                    v64 = v26;
                    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "=restore-placeholder= Moved restored placeholder .ipa from %@ to %@", v61, 0x16u);
                    id v41 = v19;
                    id v42 = v26;
                    _MBLog();
                  }
                }
              }
              else
              {
                id v22 = MBGetDefaultLog();
                if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
                {
                  *(_DWORD *)v61 = 138412290;
                  v62 = v19;
                  _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_FAULT, "=restore-placeholder= Not moving non-ipa file at %@ for RestorePostProcess", v61, 0xCu);
                  id v41 = v19;
                  _MBLog();
                }
              }
            }
            else
            {
              id v20 = MBGetDefaultLog();
              if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)v61 = 138412290;
                v62 = v19;
                _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "=restore-placeholder= Not moving non-regular file at %@", v61, 0xCu);
                id v41 = v19;
                _MBLog();
              }
            }
          }
          id v13 = [obj countByEnumeratingWithState:&v56 objects:v65 count:16];
          if (v13) {
            continue;
          }
          break;
        }
      }
LABEL_41:

      unsigned __int8 v32 = *(void **)(*(void *)&buf[8] + 40);
      if (v32)
      {
        if (a4)
        {
          BOOL v29 = 0;
          *a4 = v32;
LABEL_61:

          _Block_object_dispose(buf, 8);
          goto LABEL_62;
        }
LABEL_60:
        BOOL v29 = 0;
        goto LABEL_61;
      }
      if ([(MBPersona *)v47 isEnterprisePersona])
      {
        int v33 = v48;
        id v34 = [(MBPersona *)v47 placeholderRestoreDirectory];
        if ((objc_msgSend(v52, "mb_moveToTmpDirThenRemoveItemAtPath:error:", v34, a4) & 1) == 0)
        {

          goto LABEL_60;
        }
        id v35 = MBGetDefaultLog();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v61 = 138412546;
          v62 = v33;
          __int16 v63 = 2112;
          v64 = v34;
          _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "=restore-placeholders= Moving EDS placeholders from %@ to %@", v61, 0x16u);
          _MBLog();
        }

        id v53 = 0;
        unsigned __int8 v36 = [v52 moveItemAtPath:v33 toPath:v34 error:&v53];
        id v37 = v53;
        unsigned __int8 v38 = v37;
        if ((v36 & 1) == 0)
        {
          if (a4) {
            *a4 = v37;
          }
          id v39 = MBGetDefaultLog();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v61 = 138412546;
            v62 = v33;
            __int16 v63 = 2112;
            v64 = v34;
            _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "=restore-placeholders= Failed to move EDS placeholders from %@ to %@", v61, 0x16u);
            _MBLog();
          }

          goto LABEL_60;
        }
      }
      BOOL v29 = 1;
      goto LABEL_61;
    }
    if (a4)
    {
      +[MBError errorWithCode:4 path:v48 format:@"Restore placeholders not found"];
      BOOL v29 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v29 = 0;
    }
  }
  else
  {
    id v28 = MBGetDefaultLog();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)stat buf = 138412290;
      *(void *)&uint8_t buf[4] = v49;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "=restore-placeholder= No placeholder dir found at: %@", buf, 0xCu);
      _MBLog();
    }

    BOOL v29 = 1;
  }
LABEL_62:

  return v29;
}

@end