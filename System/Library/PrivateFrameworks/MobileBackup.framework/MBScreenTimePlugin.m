@interface MBScreenTimePlugin
- (id)_standardizePath:(id)a3 fromDomain:(id)a4;
- (id)startingBackupWithEngine:(id)a3;
- (id)startingRestoreWithPolicy:(id)a3 engine:(id)a4;
- (void)_updatePathsForHomeDomainWithEngine:(id)a3;
@end

@implementation MBScreenTimePlugin

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
      [v14 handleFailureInMethod:a2, self, @"MBScreenTimePlugin.m", 16, @"Absolute path doesn't have domain root %@ as prefix: %@", v15, v8 object file lineNumber description];
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
    [(MBScreenTimePlugin *)self _updatePathsForHomeDomainWithEngine:v4];
  }

  return 0;
}

- (id)startingRestoreWithPolicy:(id)a3 engine:(id)a4
{
  id v5 = a4;
  if ([v5 isDeviceTransferEngine]) {
    [(MBScreenTimePlugin *)self _updatePathsForHomeDomainWithEngine:v5];
  }

  return 0;
}

- (void)_updatePathsForHomeDomainWithEngine:(id)a3
{
  id v4 = a3;
  id v5 = [v4 domainManager];
  v6 = [v5 domainForName:@"HomeDomain"];

  if (!v6) {
    __assert_rtn("-[MBScreenTimePlugin _updatePathsForHomeDomainWithEngine:]", "MBScreenTimePlugin.m", 40, "homeDomain");
  }
  id v7 = [(MBScreenTimePlugin *)self _standardizePath:@"Library/Application Support/com.apple.remotemanagementd" fromDomain:v6];
  v8 = [v6 relativePathsNotToBackup];
  unsigned int v9 = [v8 containsObject:v7];

  if (v9)
  {
    unsigned __int8 v10 = [v6 relativePathsNotToBackup];
    id v11 = [v10 mutableCopy];

    uint64_t v12 = MBGetDefaultLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v24 = v6;
      __int16 v25 = 2114;
      CFStringRef v26 = v7;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: Removing \"%{public}@\" from relativePathsNotToBackup", buf, 0x16u);
      v21 = v6;
      v22 = v7;
      _MBLog();
    }

    [v11 removeObject:v7];
    [v6 setRelativePathsNotToBackup:v11];
  }
  v13 = objc_msgSend(v6, "relativePathsToBackupAndRestore", v21, v22);

  if (v13)
  {
    v14 = [v6 relativePathsToBackupAndRestore];
    id v15 = [v14 mutableCopy];
  }
  else
  {
    id v15 = (id)objc_opt_new();
  }
  v16 = MBGetDefaultLog();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v24 = v6;
    __int16 v25 = 2114;
    CFStringRef v26 = @"Library/Application Support/com.apple.remotemanagementd";
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%{public}@: Adding \"%{public}@\" to relativePathsToBackupAndRestore", buf, 0x16u);
    _MBLog();
  }

  [v15 addObject:@"Library/Application Support/com.apple.remotemanagementd"];
  [v6 setRelativePathsToBackupAndRestore:v15];
  v17 = [v6 relativePathsToIgnoreExclusionsForDrive];

  if (v17)
  {
    v18 = [v6 relativePathsToIgnoreExclusionsForDrive];
    id v19 = [v18 mutableCopy];
  }
  else
  {
    id v19 = (id)objc_opt_new();
  }
  v20 = MBGetDefaultLog();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v24 = v6;
    __int16 v25 = 2114;
    CFStringRef v26 = @"Library/Application Support/com.apple.remotemanagementd";
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%{public}@: Adding \"%{public}@\" to relativePathsToIgnoreExclusionsForDrive", buf, 0x16u);
    _MBLog();
  }

  [v19 addObject:@"Library/Application Support/com.apple.remotemanagementd"];
  [v6 setRelativePathsToIgnoreExclusionsForDrive:v19];
}

@end