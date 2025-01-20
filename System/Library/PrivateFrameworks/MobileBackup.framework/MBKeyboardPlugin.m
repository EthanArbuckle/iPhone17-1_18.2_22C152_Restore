@interface MBKeyboardPlugin
- (id)_standardizePath:(id)a3 fromDomain:(id)a4;
- (id)startingBackupWithEngine:(id)a3;
- (id)startingRestoreWithPolicy:(id)a3 engine:(id)a4;
- (void)_addRelativePathsToPathsToBackupAndRestore:(id)a3 forDomain:(id)a4;
- (void)_removeRelativePathsFromPathsNotToBackup:(id)a3 forDomain:(id)a4;
- (void)_removeRelativePathsFromPathsNotToRestore:(id)a3 forDomain:(id)a4;
- (void)_updatePathsForKeyboardDomainWithEngine:(id)a3;
@end

@implementation MBKeyboardPlugin

- (id)_standardizePath:(id)a3 fromDomain:(id)a4
{
  id v7 = a4;
  v8 = [a3 stringByStandardizingPath];
  if ([v8 isAbsolutePath])
  {
    v9 = [v7 rootPath];
    unsigned __int8 v10 = [v8 hasPrefix:v9];

    if ((v10 & 1) == 0)
    {
      v14 = +[NSAssertionHandler currentHandler];
      v15 = [v7 rootPath];
      [v14 handleFailureInMethod:a2, self, @"MBKeyboardPlugin.m", 21, @"Absolute path doesn't have domain root %@ as prefix: %@", v15, v8 object file lineNumber description];
    }
    v11 = [v7 rootPath];
    uint64_t v12 = objc_msgSend(v8, "substringFromIndex:", (char *)objc_msgSend(v11, "length") + 1);

    v8 = (void *)v12;
  }

  return v8;
}

- (id)startingBackupWithEngine:(id)a3
{
  id v4 = a3;
  if ([v4 isDeviceTransferEngine]) {
    [(MBKeyboardPlugin *)self _updatePathsForKeyboardDomainWithEngine:v4];
  }

  return 0;
}

- (id)startingRestoreWithPolicy:(id)a3 engine:(id)a4
{
  id v5 = a4;
  if ([v5 isDeviceTransferEngine]) {
    [(MBKeyboardPlugin *)self _updatePathsForKeyboardDomainWithEngine:v5];
  }

  return 0;
}

- (void)_removeRelativePathsFromPathsNotToBackup:(id)a3 forDomain:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v8 = [v6 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v22;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        v13 = -[MBKeyboardPlugin _standardizePath:fromDomain:](self, "_standardizePath:fromDomain:", v12, v7, v19, v20);
        v14 = [v7 relativePathsNotToBackup];
        unsigned int v15 = [v14 containsObject:v13];

        if (v15)
        {
          v16 = [v7 relativePathsNotToBackup];
          id v17 = [v16 mutableCopy];

          v18 = MBGetDefaultLog();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            id v26 = v7;
            __int16 v27 = 2114;
            uint64_t v28 = v12;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%{public}@: Removing \"%{public}@\" from relativePathsNotToBackup", buf, 0x16u);
            id v19 = v7;
            uint64_t v20 = v12;
            _MBLog();
          }

          [v17 removeObject:v13];
          [v7 setRelativePathsNotToBackup:v17];
        }
      }
      id v9 = [v6 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v9);
  }
}

- (void)_removeRelativePathsFromPathsNotToRestore:(id)a3 forDomain:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v8 = [v6 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v22;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        v13 = -[MBKeyboardPlugin _standardizePath:fromDomain:](self, "_standardizePath:fromDomain:", v12, v7, v19, v20);
        v14 = [v7 relativePathsNotToRestore];
        unsigned int v15 = [v14 containsObject:v13];

        if (v15)
        {
          v16 = [v7 relativePathsNotToRestore];
          id v17 = [v16 mutableCopy];

          v18 = MBGetDefaultLog();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            id v26 = v7;
            __int16 v27 = 2114;
            uint64_t v28 = v12;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%{public}@: Removing \"%{public}@\" from relativePathsNotToRestore", buf, 0x16u);
            id v19 = v7;
            uint64_t v20 = v12;
            _MBLog();
          }

          [v17 removeObject:v13];
          [v7 setRelativePathsNotToRestore:v17];
        }
      }
      id v9 = [v6 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v9);
  }
}

- (void)_addRelativePathsToPathsToBackupAndRestore:(id)a3 forDomain:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v7 = [v5 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v19;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v12 = objc_msgSend(v6, "relativePathsToBackupAndRestore", v16, v17);

        if (v12)
        {
          v13 = [v6 relativePathsToBackupAndRestore];
          id v14 = [v13 mutableCopy];
        }
        else
        {
          id v14 = (id)objc_opt_new();
        }
        unsigned int v15 = MBGetDefaultLog();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          id v23 = v6;
          __int16 v24 = 2114;
          uint64_t v25 = v11;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: Adding \"%{public}@\" to relativePathsToBackupAndRestore", buf, 0x16u);
          id v16 = v6;
          uint64_t v17 = v11;
          _MBLog();
        }

        [v14 addObject:@"Library/Keyboard"];
        [v6 setRelativePathsToBackupAndRestore:v14];
      }
      id v8 = [v5 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v8);
  }
}

- (void)_updatePathsForKeyboardDomainWithEngine:(id)a3
{
  id v4 = a3;
  id v5 = [v4 domainManager];
  id v6 = [v5 domainForName:@"KeyboardDomain"];

  if (!v6) {
    __assert_rtn("-[MBKeyboardPlugin _updatePathsForKeyboardDomainWithEngine:]", "MBKeyboardPlugin.m", 81, "keyboardDomain");
  }
  id v7 = MBGetDefaultLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v16 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: Removing all paths from relativePathsNotToBackupToDrive", buf, 0xCu);
    _MBLog();
  }

  id v8 = objc_opt_new();
  [v6 setRelativePathsNotToBackupToDrive:v8];

  uint64_t v9 = +[NSMutableArray arrayWithObjects:@"Library/Keyboard", @"Library/KeyboardServices/TextReplacements.db", @"Library/KeyboardServices/TextReplacements.db-wal", @"Library/KeyboardServices/TextReplacements.db-shm", @"Library/Keyboard/CoreDataUbiquitySupport", 0];
  [(MBKeyboardPlugin *)self _removeRelativePathsFromPathsNotToBackup:v9 forDomain:v6];
  [(MBKeyboardPlugin *)self _removeRelativePathsFromPathsNotToRestore:v9 forDomain:v6];
  [v9 removeObject:@"Library/Keyboard/CoreDataUbiquitySupport"];
  [(MBKeyboardPlugin *)self _addRelativePathsToPathsToBackupAndRestore:v9 forDomain:v6];
  uint64_t v10 = [v6 relativePathsToIgnoreExclusionsForDrive];

  if (v10)
  {
    uint64_t v11 = [v6 relativePathsToIgnoreExclusionsForDrive];
    id v12 = [v11 mutableCopy];
  }
  else
  {
    id v12 = (id)objc_opt_new();
  }
  v13 = MBGetDefaultLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v16 = v6;
    __int16 v17 = 2114;
    CFStringRef v18 = @"Library/Keyboard";
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: Adding \"%{public}@\" to relativePathsToIgnoreExclusionsForDrive", buf, 0x16u);
    _MBLog();
  }

  [v12 addObject:@"Library/Keyboard"];
  id v14 = MBGetDefaultLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v16 = v6;
    __int16 v17 = 2114;
    CFStringRef v18 = @"Library/KeyboardServices";
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: Adding \"%{public}@\" to relativePathsToIgnoreExclusionsForDrive", buf, 0x16u);
    _MBLog();
  }

  [v12 addObject:@"Library/KeyboardServices"];
  [v6 setRelativePathsToIgnoreExclusionsForDrive:v12];
}

@end