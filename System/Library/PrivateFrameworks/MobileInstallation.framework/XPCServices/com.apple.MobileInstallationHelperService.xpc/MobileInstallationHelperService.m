@interface MobileInstallationHelperService
- (BOOL)_createDirectoryAndSetToDaemonOwnershipAt:(id)a3 withError:(id *)a4;
- (BOOL)_moveAndUpdateOwnershipFromURL:(id)a3 toURL:(id)a4 withError:(id *)a5;
- (BOOL)_validateArgsForMethodWithName:(const char *)a3 bundleIdentifier:(id)a4 wrapperURL:(id)a5 data:(id)a6 error:(id *)a7;
- (BOOL)_validateArgsForMethodWithName:(const char *)a3 bundleIdentifier:(id)a4 wrapperURL:(id)a5 error:(id *)a6;
- (MILimitedConcurrencyQueue)installAndStagingQueue;
- (NSString)clientName;
- (NSXPCConnection)xpcConnection;
- (id)_verifyBooleanEntitlement:(id)a3;
- (unint64_t)_changeOwnerTo:(unsigned int)a3 atURL:(id)a4;
- (void)_onQueue_createAppSnapshotWithBundleID:(id)a3 snapshotToURL:(id)a4 onlyV1AppIfPresent:(BOOL)a5 placeholderOnly:(BOOL)a6 completion:(id)a7;
- (void)_onQueue_createSafeHarborWithIdentifier:(id)a3 forPersona:(id)a4 containerType:(unint64_t)a5 andMigrateDataFrom:(id)a6 completion:(id)a7;
- (void)_onQueue_makeSymlinkFromAppDataContainerToBundleForIdentifier:(id)a3 forPersona:(id)a4 completion:(id)a5;
- (void)_onQueue_stageItemAtURL:(id)a3 options:(id)a4 completion:(id)a5;
- (void)_writeMigrationFileToDiskAtURL:(id)a3;
- (void)createAppSnapshotWithBundleID:(id)a3 snapshotToURL:(id)a4 onlyV1AppIfPresent:(BOOL)a5 placeholderOnly:(BOOL)a6 completion:(id)a7;
- (void)createSafeHarborWithIdentifier:(id)a3 forPersona:(id)a4 containerType:(unint64_t)a5 andMigrateDataFrom:(id)a6 completion:(id)a7;
- (void)dieForTesting;
- (void)getPidForTestingWithCompletion:(id)a3;
- (void)isDataContainerEmpty:(id)a3 ofContainerType:(unint64_t)a4 completion:(id)a5;
- (void)makeSymlinkFromAppDataContainerToBundleForIdentifier:(id)a3 forPersona:(id)a4 completion:(id)a5;
- (void)migrateMobileContentWithCompletion:(id)a3;
- (void)moveItemInStagingDirectory:(unint64_t)a3 atRelativePath:(id)a4 toDestinationURL:(id)a5 onBehalfOf:(id *)a6 completion:(id)a7;
- (void)setXpcConnection:(id)a3;
- (void)stageItemAtURL:(id)a3 options:(id)a4 completion:(id)a5;
- (void)wipeStagingRootAndSetUpPerUserDataDirWithCompletion:(id)a3;
@end

@implementation MobileInstallationHelperService

- (MILimitedConcurrencyQueue)installAndStagingQueue
{
  if (qword_100025B48 != -1) {
    dispatch_once(&qword_100025B48, &stru_100020C18);
  }
  v2 = (void *)qword_100025B50;
  return (MILimitedConcurrencyQueue *)v2;
}

- (id)_verifyBooleanEntitlement:(id)a3
{
  id v4 = a3;
  v5 = [(MobileInstallationHelperService *)self xpcConnection];
  v7 = v5;
  if (!v5)
  {
    v10 = _CreateAndLogError((uint64_t)"-[MobileInstallationHelperService _verifyBooleanEntitlement:]", 133, MIInstallerErrorDomain, 4, 0, 0, @"Failed to get XPC connection", v6, v17);
    goto LABEL_10;
  }
  v8 = [v5 valueForEntitlement:v4];
  v9 = v8;
  if (!v8)
  {
    v11 = (void *)MIInstallerErrorDomain;
    v12 = [(MobileInstallationHelperService *)self clientName];
    _CreateAndLogError((uint64_t)"-[MobileInstallationHelperService _verifyBooleanEntitlement:]", 138, v11, 2, 0, 0, @"Client %@ does not have the required entitlement '%@'", v13, (uint64_t)v12);
    v10 = LABEL_8:;

    goto LABEL_9;
  }
  if ((MIBooleanValue(v8, 0) & 1) == 0)
  {
    v14 = (void *)MIInstallerErrorDomain;
    v12 = [(MobileInstallationHelperService *)self clientName];
    _CreateAndLogError((uint64_t)"-[MobileInstallationHelperService _verifyBooleanEntitlement:]", 142, v14, 2, 0, 0, @"Client %@ has the entitlement '%@' but its value is FALSE", v15, (uint64_t)v12);
    goto LABEL_8;
  }
  v10 = 0;
LABEL_9:

LABEL_10:
  return v10;
}

- (NSString)clientName
{
  v2 = [(MobileInstallationHelperService *)self xpcConnection];
  v3 = v2;
  if (v2)
  {
    id v4 = [v2 processIdentifier];
    v5 = MICopyProcessNameForPid();
    uint64_t v6 = +[NSString stringWithFormat:@"%@ (pid %d)", v5, v4];
  }
  else
  {
    uint64_t v6 = @"Unknown client";
  }

  return (NSString *)v6;
}

- (unint64_t)_changeOwnerTo:(unsigned int)a3 atURL:(id)a4
{
  id v5 = a4;
  v15[0] = (char *)[v5 fileSystemRepresentation];
  v15[1] = 0;
  uint64_t v6 = fts_open(v15, 84, 0);
  if (v6)
  {
    v7 = v6;
    v8 = fts_read(v6);
    if (v8)
    {
      v9 = v8;
      unint64_t v10 = 0;
      while (1)
      {
        unsigned int fts_info = v9->fts_info;
        if (fts_info > 0xD) {
          break;
        }
        if (((1 << fts_info) & 0x310A) != 0)
        {
          if (lchown(v9->fts_path, a3, a3))
          {
            if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
            {
              v12 = __error();
              strerror(*v12);
              goto LABEL_14;
            }
            goto LABEL_15;
          }
        }
        else if (fts_info != 6)
        {
          break;
        }
LABEL_16:
        v9 = fts_read(v7);
        if (!v9) {
          goto LABEL_23;
        }
      }
      if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
      {
        strerror(v9->fts_errno);
LABEL_14:
        MOLogWrite();
      }
LABEL_15:
      ++v10;
      goto LABEL_16;
    }
    unint64_t v10 = 0;
LABEL_23:
    fts_close(v7);
  }
  else
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      uint64_t v13 = __error();
      strerror(*v13);
      MOLogWrite();
    }
    unint64_t v10 = 1;
  }

  return v10;
}

- (BOOL)_moveAndUpdateOwnershipFromURL:(id)a3 toURL:(id)a4 withError:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = +[MIFileManager defaultManager];
  unsigned int v10 = [v9 itemDoesNotExistAtURL:v8];

  if (v10)
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
    {
      v11 = [v7 path];
      [v8 path];
      v24 = v22 = v11;
      MOLogWrite();
    }
    v12 = +[MIFileManager defaultManager];
    id v26 = 0;
    unsigned __int8 v13 = [v12 moveItemIfExistsAtURL:v7 toURL:v8 error:&v26];
    id v14 = v26;

    if ((v13 & 1) == 0)
    {
      uint64_t v20 = _CreateAndLogError((uint64_t)"-[MobileInstallationHelperService _moveAndUpdateOwnershipFromURL:toURL:withError:]", 225, MIInstallerErrorDomain, 4, v14, 0, @"Failed to move data directory into installd's home directory", v15, v23);
      goto LABEL_10;
    }
    v16 = +[MIDaemonConfiguration sharedInstance];
    uint64_t v17 = -[MobileInstallationHelperService _changeOwnerTo:atURL:](self, "_changeOwnerTo:atURL:", [v16 uid], v8);

    if (v17)
    {
      v18 = (void *)MIInstallerErrorDomain;
      uint64_t v25 = [v8 path];
      uint64_t v20 = _CreateAndLogError((uint64_t)"-[MobileInstallationHelperService _moveAndUpdateOwnershipFromURL:toURL:withError:]", 230, v18, 109, v14, 0, @"%llu errors changing ownership for installd at %@", v19, v17);

      id v14 = (id)v25;
LABEL_10:

      id v14 = (id)v20;
    }
  }
  else
  {
    id v14 = 0;
  }

  return 1;
}

- (void)_writeMigrationFileToDiskAtURL:(id)a3
{
  id v3 = a3;
  id v4 = +[NSDate date];
  id v5 = [v4 description];

  uint64_t v6 = (void *)_CFCopySystemVersionDictionary();
  id v7 = v6;
  if (v6)
  {
    id v8 = [v6 objectForKeyedSubscript:_kCFSystemVersionBuildVersionKey];
    v9 = v8;
    if (v8) {
      unsigned int v10 = v8;
    }
    else {
      unsigned int v10 = @"Unknown";
    }
  }
  else
  {
    unsigned int v10 = @"Unknown";
  }
  v13[0] = @"MIHMigrationVersionNumber";
  v13[1] = @"MIHMigrationTime";
  v14[0] = v10;
  v14[1] = v5;
  v11 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:2];
  if ([v11 writeToURL:v3 atomically:1])
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5) {
      MOLogWrite();
    }
  }
  else if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
  {
    v12 = [v3 path];
    MOLogWrite();
  }
}

- (void)migrateMobileContentWithCompletion:(id)a3
{
  v36 = (void (**)(id, id))a3;
  v39 = self;
  id v4 = [(MobileInstallationHelperService *)self _verifyBooleanEntitlement:@"com.apple.private.MobileInstallationHelperService.InstallDaemonOpsEnabled"];
  if (v4)
  {
    v36[2](v36, v4);
    goto LABEL_23;
  }
  id v5 = +[MIDaemonConfiguration sharedInstance];
  uint64_t v6 = [v5 oldDataDirectoryPath];
  id v7 = +[MIDaemonConfiguration sharedInstance];
  id v8 = [v7 dataDirectory];
  uint64_t v46 = 0;
  unsigned int v9 = [(MobileInstallationHelperService *)v39 _moveAndUpdateOwnershipFromURL:v6 toURL:v8 withError:&v46];

  unsigned int v10 = +[MIFileManager defaultManager];
  v11 = +[MIDaemonConfiguration sharedInstance];
  v12 = [v11 oldLoggingPath];
  id v45 = 0;
  v35 = [v10 urlsForItemsInDirectoryAtURL:v12 ignoringSymlinks:1 error:&v45];
  id v4 = v45;

  if (v35)
  {
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id obj = v35;
    id v13 = [obj countByEnumeratingWithState:&v41 objects:v47 count:16];
    if (v13)
    {
      uint64_t v38 = *(void *)v42;
      do
      {
        id v14 = 0;
        uint64_t v15 = v4;
        do
        {
          if (*(void *)v42 != v38) {
            objc_enumerationMutation(obj);
          }
          v16 = *(void **)(*((void *)&v41 + 1) + 8 * (void)v14);
          uint64_t v17 = +[MIDaemonConfiguration sharedInstance];
          v18 = [v17 logDirectory];
          uint64_t v19 = [v16 lastPathComponent];
          uint64_t v20 = [v18 URLByAppendingPathComponent:v19 isDirectory:0];
          id v40 = v15;
          unsigned __int8 v21 = [(MobileInstallationHelperService *)v39 _moveAndUpdateOwnershipFromURL:v16 toURL:v20 withError:&v40];
          id v4 = v40;

          LOBYTE(v9) = v21 & v9;
          id v14 = (char *)v14 + 1;
          uint64_t v15 = v4;
        }
        while (v13 != v14);
        id v13 = [obj countByEnumeratingWithState:&v41 objects:v47 count:16];
      }
      while (v13);
    }

    if (v9) {
      goto LABEL_12;
    }
    goto LABEL_16;
  }
  id v26 = [v4 domain];
  if (![v26 isEqualToString:NSPOSIXErrorDomain])
  {

    goto LABEL_18;
  }
  BOOL v27 = [v4 code] == (id)2;

  if (!v27)
  {
LABEL_18:
    v22 = +[MIDaemonConfiguration sharedInstance];
    uint64_t v23 = [v22 oldLoggingPath];
    v24 = [v23 path];
    uint64_t v29 = _CreateAndLogError((uint64_t)"-[MobileInstallationHelperService migrateMobileContentWithCompletion:]", 288, MIInstallerErrorDomain, 109, v4, 0, @"Failed to get items for deletion: %@ : %@", v28, (uint64_t)v24);

    int v25 = 0;
    id v4 = (id)v29;
    goto LABEL_19;
  }
  if (v9)
  {
LABEL_12:
    v22 = +[MIFileManager defaultManager];
    uint64_t v23 = +[MIDaemonConfiguration sharedInstance];
    v24 = [v23 oldLoggingPath];
    [v22 removeItemAtURL:v24 error:0];
    int v25 = 1;
LABEL_19:

    goto LABEL_20;
  }
LABEL_16:
  int v25 = 0;
LABEL_20:
  v30 = +[MIFileManager defaultManager];
  v31 = +[MIDaemonConfiguration sharedInstance];
  v32 = [v31 oldArchiveDirectory];
  [v30 removeItemAtURL:v32 error:0];

  if (v25)
  {
    v33 = +[MIDaemonConfiguration sharedInstance];
    v34 = [v33 roleUserMigrationMarkerFilePath];
    [(MobileInstallationHelperService *)v39 _writeMigrationFileToDiskAtURL:v34];
  }
  v36[2](v36, v4);
LABEL_23:
}

- (BOOL)_createDirectoryAndSetToDaemonOwnershipAt:(id)a3 withError:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = +[MIFileManager defaultManager];
  id v7 = +[MIDaemonConfiguration sharedInstance];
  id v8 = [v7 uid];

  unsigned int v9 = +[MIDaemonConfiguration sharedInstance];
  id v10 = [v9 gid];

  id v18 = 0;
  unsigned int v11 = [v6 createDirectoryAtURL:v5 withIntermediateDirectories:0 mode:493 class:4 error:&v18];
  id v12 = v18;
  id v13 = v12;
  if (v11)
  {
    id v17 = v12;
    unsigned __int8 v14 = [v6 setOwnerOfURL:v5 toUID:v8 gid:v10 error:&v17];
    id v15 = v17;

    id v13 = v15;
    if (!a4) {
      goto LABEL_7;
    }
  }
  else
  {
    unsigned __int8 v14 = 0;
    if (!a4) {
      goto LABEL_7;
    }
  }
  if ((v14 & 1) == 0) {
    *a4 = v13;
  }
LABEL_7:

  return v14;
}

- (void)wipeStagingRootAndSetUpPerUserDataDirWithCompletion:(id)a3
{
  id v4 = (void (**)(id, id))a3;
  id v5 = +[MIFileManager defaultManager];
  id v6 = [(MobileInstallationHelperService *)self _verifyBooleanEntitlement:@"com.apple.private.MobileInstallationHelperService.InstallDaemonOpsEnabled"];
  if (v6)
  {
    v4[2](v4, v6);
    goto LABEL_39;
  }
  uint64_t v7 = +[MIDaemonConfiguration sharedInstance];
  v60 = [(id)v7 stagingRootForSystemContent];

  id v70 = 0;
  LOBYTE(v7) = [v5 removeItemAtURL:v60 keepParent:1 error:&v70];
  id v8 = v70;
  if ((v7 & 1) == 0)
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      v50 = [v60 path];
      id v52 = v8;
      MOLogWrite();
    }
    id v8 = 0;
  }
  unsigned int v9 = +[MIDaemonConfiguration sharedInstance];
  unsigned int v57 = [v9 uid];

  id v10 = +[MIDaemonConfiguration sharedInstance];
  gid_t v11 = [v10 gid];

  id v12 = +[MIDaemonConfiguration sharedInstance];
  id v59 = [v12 currentUserDataDirectory];

  if (!v59)
  {
    v35 = @"Failed to get current user data directory";
    uint64_t v36 = 381;
LABEL_31:
    uint64_t v37 = _CreateAndLogError((uint64_t)"-[MobileInstallationHelperService wipeStagingRootAndSetUpPerUserDataDirWithCompletion:]", v36, MIInstallerErrorDomain, 4, 0, 0, v35, v13, (uint64_t)v51);
    id v17 = 0;
    id v15 = 0;
LABEL_32:
    id v23 = v8;
LABEL_33:
    id v6 = (id)v37;
LABEL_34:

    goto LABEL_35;
  }
  unsigned __int8 v14 = +[MIDaemonConfiguration sharedInstance];
  id v15 = [v14 currentUserCachesDirectory];

  if (!v15)
  {
    v35 = @"Failed to get user caches directory";
    uint64_t v36 = 387;
    goto LABEL_31;
  }
  v16 = +[MIDaemonConfiguration sharedInstance];
  id v17 = [v16 stagingRootForUserContent];

  if (!v17)
  {
    uint64_t v37 = _CreateAndLogError((uint64_t)"-[MobileInstallationHelperService wipeStagingRootAndSetUpPerUserDataDirWithCompletion:]", 393, MIInstallerErrorDomain, 4, 0, 0, @"Failed to get user content staging directory", v18, (uint64_t)v51);
    id v17 = 0;
    goto LABEL_32;
  }
  id v69 = v8;
  unsigned __int8 v19 = [v5 removeItemAtURL:v17 keepParent:1 error:&v69];
  id v20 = v69;

  unsigned __int8 v21 = v20;
  if ((v19 & 1) == 0 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
  {
    v51 = [v17 path];
    id v53 = v20;
    MOLogWrite();
  }
  id v68 = v20;
  unsigned __int8 v22 = -[MobileInstallationHelperService _createDirectoryAndSetToDaemonOwnershipAt:withError:](self, "_createDirectoryAndSetToDaemonOwnershipAt:withError:", v15, &v68, v51, v53);
  id v23 = v68;

  if ((v22 & 1) == 0)
  {
    uint64_t v37 = _CreateAndLogError((uint64_t)"-[MobileInstallationHelperService wipeStagingRootAndSetUpPerUserDataDirWithCompletion:]", 404, MIInstallerErrorDomain, 4, v23, 0, @"Failed to create user caches directory at %@ : %@", v24, (uint64_t)v15);
    goto LABEL_33;
  }
  id v67 = v23;
  unsigned __int8 v25 = [(MobileInstallationHelperService *)self _createDirectoryAndSetToDaemonOwnershipAt:v17 withError:&v67];
  id v8 = v67;

  if ((v25 & 1) == 0)
  {
    uint64_t v37 = _CreateAndLogError((uint64_t)"-[MobileInstallationHelperService wipeStagingRootAndSetUpPerUserDataDirWithCompletion:]", 409, MIInstallerErrorDomain, 4, v8, 0, @"Failed to create user content staging directory at %@ : %@", v26, (uint64_t)v17);
    goto LABEL_32;
  }
  id v66 = v8;
  unsigned __int8 v27 = [(MobileInstallationHelperService *)self _createDirectoryAndSetToDaemonOwnershipAt:v59 withError:&v66];
  id v23 = v66;

  if ((v27 & 1) == 0)
  {
    uint64_t v37 = _CreateAndLogError((uint64_t)"-[MobileInstallationHelperService wipeStagingRootAndSetUpPerUserDataDirWithCompletion:]", 415, MIInstallerErrorDomain, 4, v23, 0, @"Failed to create user data directory at %@ : %@", v28, (uint64_t)v59);
    goto LABEL_33;
  }
  id v65 = v23;
  char v29 = MIAssumeIdentity(v57, v11, &v65);
  id v6 = v65;

  if (v29)
  {
    id v56 = v59;
    if (!access((const char *)[v56 fileSystemRepresentation], 7))
    {
      char v38 = 1;
      goto LABEL_36;
    }
    int __errnum = *__error();
    objc_msgSend(v56, "MI_allAccessURLs");
    long long v63 = 0u;
    long long v64 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    id v23 = (id)objc_claimAutoreleasedReturnValue();
    id v30 = 0;
    id v31 = [v23 countByEnumeratingWithState:&v61 objects:v73 count:16];
    if (v31)
    {
      uint64_t v58 = *(void *)v62;
      while (2)
      {
        v32 = 0;
        v33 = v30;
        do
        {
          if (*(void *)v62 != v58) {
            objc_enumerationMutation(v23);
          }
          id v34 = *(id *)(*((void *)&v61 + 1) + 8 * (void)v32);
          if (!access((const char *)[v34 fileSystemRepresentation], 1))
          {
            id v30 = v33;
            goto LABEL_48;
          }
          id v30 = v34;

          v32 = (char *)v32 + 1;
          v33 = v30;
        }
        while (v31 != v32);
        id v31 = [v23 countByEnumeratingWithState:&v61 objects:v73 count:16];
        if (v31) {
          continue;
        }
        break;
      }
    }
LABEL_48:

    MIRestoreIdentity();
    [v5 logAccessPermissionsForURL:v56];
    if (!v30)
    {
      id v45 = &_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
      {
        uint64_t v46 = [v56 path];
        v47 = strerror(__errnum);
        sub_1000140F0(v46, (uint64_t)v47, (uint64_t)&v72);
      }

      if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
      {
        v54 = [v56 path];
        strerror(__errnum);
        MOLogWrite();
      }
      goto LABEL_67;
    }
    memset(&v72, 0, sizeof(v72));
    id v39 = v30;
    if (lstat((const char *)[v39 fileSystemRepresentation], &v72))
    {
      int v40 = *__error();
      id v41 = &_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
      {
        long long v42 = [v39 path];
        long long v43 = strerror(v40);
        sub_100014204(v42, (uint64_t)v43, (uint64_t)buf);
      }

      if (gLogHandle && *(int *)(gLogHandle + 44) < 3) {
        goto LABEL_67;
      }
      long long v44 = [v39 path];
      strerror(v40);
      MOLogWrite();
    }
    else
    {
      id v48 = &_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
      {
        v49 = [v39 path];
        sub_10001415C(v49, (uint64_t)&v72, buf);
      }

      if (gLogHandle && *(int *)(gLogHandle + 44) < 3) {
        goto LABEL_67;
      }
      long long v44 = [v39 path];
      MOLogWrite();
    }

LABEL_67:
    goto LABEL_34;
  }
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
  {
    MOLogWrite();
    char v38 = 0;
    goto LABEL_36;
  }
LABEL_35:
  char v38 = 0;
LABEL_36:

  if (v38) {
    MIRestoreIdentity();
  }
  v4[2](v4, v6);
LABEL_39:
}

- (void)_onQueue_stageItemAtURL:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *, void, id))a5;
  unsigned __int8 v63 = 0;
  uint64_t v11 = [(MobileInstallationHelperService *)self _verifyBooleanEntitlement:@"com.apple.private.MobileInstallationHelperService.InstallDaemonOpsEnabled"];
  if (!v11)
  {
    if (v9)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        char v38 = (void *)MIInstallerErrorDomain;
        id v39 = (objc_class *)objc_opt_class();
        int v40 = NSStringFromClass(v39);
        _CreateAndLogError((uint64_t)"-[MobileInstallationHelperService _onQueue_stageItemAtURL:options:completion:]", 498, v38, 104, 0, 0, @"Options parameter is not an instance of MIInstallOptions; found %@",
          v41,
          (uint64_t)v40);
        id v12 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_3;
      }
    }
    unsigned int v14 = [v9 performAPFSClone];
    if (!v8)
    {
      long long v42 = 0;
      _CreateAndLogError((uint64_t)"-[MobileInstallationHelperService _onQueue_stageItemAtURL:options:completion:]", 508, MIInstallerErrorDomain, 104, 0, 0, @"Input Path cannot be nil", v15, v52);
      id v12 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v13 = 0;
LABEL_30:

      v10[2](v10, v13, v63, v12);
      goto LABEL_31;
    }
    unsigned int v55 = v14;
    v16 = +[MIFileManager defaultManager];
    id v62 = 0;
    unsigned __int8 v17 = [v16 itemExistsAtURL:v8 error:&v62];
    id v18 = v62;

    if ((v17 & 1) == 0)
    {
      id v43 = [v8 fileSystemRepresentation];
      _CreateAndLogError((uint64_t)"-[MobileInstallationHelperService _onQueue_stageItemAtURL:options:completion:]", 514, MIInstallerErrorDomain, 3, v18, &off_100023D18, @"Could not access item to be installed at %s", v44, (uint64_t)v43);
      id v12 = (id)objc_claimAutoreleasedReturnValue();
      unsigned __int8 v22 = 0;
      uint64_t v13 = 0;
LABEL_28:

      goto LABEL_29;
    }
    unsigned __int8 v19 = +[MIFileManager defaultManager];
    id v20 = +[MIDaemonConfiguration sharedInstance];
    unsigned __int8 v21 = [v20 stagingRootForSystemContent];
    id v61 = v18;
    unsigned __int8 v22 = [v19 createTemporaryDirectoryInDirectoryURL:v21 error:&v61];
    id v23 = v61;

    if (!v22)
    {
      id v45 = +[MIDaemonConfiguration sharedInstance];
      uint64_t v46 = [v45 stagingRootForSystemContent];
      v47 = [v46 path];
      _CreateAndLogError((uint64_t)"-[MobileInstallationHelperService _onQueue_stageItemAtURL:options:completion:]", 521, MIInstallerErrorDomain, 105, v23, 0, @"Failed to create temporary staging dir in %@", v48, (uint64_t)v47);
      id v12 = (id)objc_claimAutoreleasedReturnValue();

      unsigned __int8 v22 = 0;
      uint64_t v13 = 0;
      goto LABEL_26;
    }
    uint64_t v24 = +[MIFileManager defaultManager];
    unsigned __int8 v25 = +[MIDaemonConfiguration sharedInstance];
    id v26 = [v25 uid];
    unsigned __int8 v27 = +[MIDaemonConfiguration sharedInstance];
    id v60 = v23;
    LOBYTE(v26) = objc_msgSend(v24, "setOwnerOfURL:toUID:gid:error:", v22, v26, objc_msgSend(v27, "gid"), &v60);
    id v28 = v60;

    if (v26)
    {
      char v29 = [v8 lastPathComponent];
      uint64_t v13 = [v22 URLByAppendingPathComponent:v29];

      if (v55) {
        uint64_t v30 = 2;
      }
      else {
        uint64_t v30 = 0;
      }
      id v56 = +[MIFileManager defaultManager];
      v54 = [v8 lastPathComponent];
      id v31 = +[MIDaemonConfiguration sharedInstance];
      id v32 = [v31 uid];
      v33 = +[MIDaemonConfiguration sharedInstance];
      id v59 = v28;
      unsigned __int8 v34 = objc_msgSend(v56, "stageURL:toItemName:inStagingDir:stagingMode:settingUID:gid:hasSymlink:error:", v8, v54, v22, v30, v32, objc_msgSend(v33, "gid"), &v63, &v59);
      id v12 = v59;

      if (v34) {
        goto LABEL_21;
      }
      v35 = [v8 lastPathComponent];
      unsigned int v57 = [v22 URLByAppendingPathComponent:v35 isDirectory:0];
      id v53 = [v57 path];
      uint64_t v37 = _CreateAndLogError((uint64_t)"-[MobileInstallationHelperService _onQueue_stageItemAtURL:options:completion:]", 552, MIInstallerErrorDomain, 107, v12, 0, @"Failed to stage %@ to %@", v36, (uint64_t)v8);

      id v28 = v57;
      id v12 = (id)v37;
    }
    else
    {
      v35 = [v22 path];
      _CreateAndLogError((uint64_t)"-[MobileInstallationHelperService _onQueue_stageItemAtURL:options:completion:]", 527, MIInstallerErrorDomain, 105, v28, 0, @"Failed to chown temporary staging directory %@ to _installd/_installd", v49, (uint64_t)v35);
      id v12 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v13 = 0;
    }

LABEL_21:
    if (!v12)
    {
LABEL_29:
      long long v42 = v22;
      goto LABEL_30;
    }
    v50 = +[MIFileManager defaultManager];
    id v58 = 0;
    unsigned __int8 v51 = [v50 removeItemAtURL:v22 error:&v58];
    id v45 = v58;

    if ((v51 & 1) != 0 || gLogHandle && *(int *)(gLogHandle + 44) < 3) {
      goto LABEL_27;
    }
    uint64_t v46 = [v22 path];
    MOLogWrite();
LABEL_26:

LABEL_27:
    id v18 = v45;
    goto LABEL_28;
  }
  id v12 = (id)v11;
LABEL_3:
  v10[2](v10, 0, 0, v12);
  uint64_t v13 = 0;
LABEL_31:
}

- (void)stageItemAtURL:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_opt_class();
  id v11 = v8;
  if (objc_opt_isKindOfClass()) {
    id v12 = v11;
  }
  else {
    id v12 = 0;
  }

  if (v12)
  {
    unsigned int v14 = [(MobileInstallationHelperService *)self installAndStagingQueue];
    uint64_t v15 = [v11 path];
    v16 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[MobileInstallationHelperService stageItemAtURL:options:completion:]");
    v18[0] = (uint64_t)_NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = (uint64_t)sub_100011024;
    v18[3] = (uint64_t)&unk_100020AE8;
    v18[4] = (uint64_t)self;
    id v19 = v11;
    id v20 = v9;
    id v21 = v10;
    [v14 runAsyncForIdentifier:v15 description:v16 operation:v18];
  }
  else
  {
    unsigned __int8 v17 = _CreateAndLogError((uint64_t)"-[MobileInstallationHelperService stageItemAtURL:options:completion:]", 579, MIInstallerErrorDomain, 104, 0, 0, @"url parameter is not a valid url", v13, v18[0]);
    (*((void (**)(id, void, void, void *))v10 + 2))(v10, 0, 0, v17);
  }
}

- (void)_onQueue_makeSymlinkFromAppDataContainerToBundleForIdentifier:(id)a3 forPersona:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, id))a5;
  uint64_t v11 = [(MobileInstallationHelperService *)self _verifyBooleanEntitlement:@"com.apple.private.MobileInstallationHelperService.InstallDaemonOpsEnabled"];
  if (v11) {
    goto LABEL_2;
  }
  objc_opt_class();
  id v13 = v8;
  if (objc_opt_isKindOfClass()) {
    id v14 = v13;
  }
  else {
    id v14 = 0;
  }

  if (v14)
  {
    id v28 = 0;
    char v16 = MIAssumeMobileIdentity(&v28);
    id v12 = v28;
    if ((v16 & 1) == 0) {
      goto LABEL_21;
    }
    id v27 = v12;
    unsigned __int8 v17 = +[MIDataContainer containerWithIdentifier:v13 forPersona:v9 ofContentClass:2 createIfNeeded:0 created:0 error:&v27];
    id v18 = v27;

    if (v17)
    {
      id v26 = v18;
      id v20 = +[MIBundleContainer appBundleContainerWithIdentifier:v13 createIfNeeded:0 created:0 error:&v26];
      id v12 = v26;

      if (v20)
      {
        unsigned __int8 v22 = [v20 bundle];
        id v23 = v22;
        if (v22
          && [v22 bundleType] == 4
          && ([v23 isPlaceholder] & 1) == 0)
        {
          [v17 makeSymlinkToBundleInContainerIfNeeded:v20];
        }

        goto LABEL_20;
      }
      uint64_t v24 = _CreateAndLogError((uint64_t)"-[MobileInstallationHelperService _onQueue_makeSymlinkFromAppDataContainerToBundleForIdentifier:forPersona:completion:]", 628, MIInstallerErrorDomain, 26, v12, 0, @"Failed to find app bundle container with identifier %@", v21, (uint64_t)v13);
      id v20 = v12;
    }
    else
    {
      uint64_t v24 = _CreateAndLogError((uint64_t)"-[MobileInstallationHelperService _onQueue_makeSymlinkFromAppDataContainerToBundleForIdentifier:forPersona:completion:]", 622, MIInstallerErrorDomain, 26, v18, 0, @"Failed to get app data container with identifier %@", v19, (uint64_t)v13);
      id v20 = v18;
    }
    id v12 = (id)v24;
LABEL_20:

    MIRestoreIdentity();
LABEL_21:
    v10[2](v10, v12);
    goto LABEL_22;
  }
  uint64_t v11 = _CreateAndLogError((uint64_t)"-[MobileInstallationHelperService _onQueue_makeSymlinkFromAppDataContainerToBundleForIdentifier:forPersona:completion:]", 603, MIInstallerErrorDomain, 104, 0, 0, @"identifier parameter is not a string", v15, v25);
LABEL_2:
  id v12 = (id)v11;
  v10[2](v10, (id)v11);
LABEL_22:
}

- (void)makeSymlinkFromAppDataContainerToBundleForIdentifier:(id)a3 forPersona:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (qword_100025B58 != -1) {
    dispatch_once(&qword_100025B58, &stru_100020C38);
  }
  uint64_t v11 = qword_100025B60;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100011560;
  v15[3] = &unk_100020AE8;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

- (void)_onQueue_createSafeHarborWithIdentifier:(id)a3 forPersona:(id)a4 containerType:(unint64_t)a5 andMigrateDataFrom:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  uint64_t v15 = (void (**)(id, uint64_t))a7;
  id v16 = +[MIFileManager defaultManager];
  uint64_t v17 = [(MobileInstallationHelperService *)self _verifyBooleanEntitlement:@"com.apple.private.MobileInstallationHelperService.InstallDaemonOpsEnabled"];
  if (v17) {
    goto LABEL_10;
  }
  objc_opt_class();
  id v18 = v12;
  if (objc_opt_isKindOfClass()) {
    id v19 = v18;
  }
  else {
    id v19 = 0;
  }

  if (!v19)
  {
    uint64_t v21 = (void *)MIInstallerErrorDomain;
    unsigned __int8 v22 = @"Identifier parameter was not a string";
    uint64_t v23 = 686;
    goto LABEL_9;
  }
  if (a5 - 15 <= 0xFFFFFFFFFFFFFFF1)
  {
    uint64_t v21 = (void *)MIInstallerErrorDomain;
    unsigned __int8 v22 = @"Container type parameter did not correspond to a defined container content class.";
    uint64_t v23 = 692;
LABEL_9:
    uint64_t v17 = _CreateAndLogError((uint64_t)"-[MobileInstallationHelperService _onQueue_createSafeHarborWithIdentifier:forPersona:containerType:andMigrateDataFrom:completion:]", v23, v21, 104, 0, 0, v22, v20, v44);
LABEL_10:
    id v24 = (id)v17;
    v15[2](v15, v17);
    uint64_t v25 = 0;
    goto LABEL_11;
  }
  objc_opt_class();
  id v26 = v14;
  id v54 = v13;
  if (objc_opt_isKindOfClass()) {
    id v27 = v26;
  }
  else {
    id v27 = 0;
  }

  if (!v27)
  {
    _CreateAndLogError((uint64_t)"-[MobileInstallationHelperService _onQueue_createSafeHarborWithIdentifier:forPersona:containerType:andMigrateDataFrom:completion:]", 698, MIInstallerErrorDomain, 104, 0, 0, @"incomingURL parameter is not a valid url", v28, v44);
    id v24 = (id)objc_claimAutoreleasedReturnValue();
    v15[2](v15, (uint64_t)v24);
    uint64_t v25 = 0;
    goto LABEL_11;
  }
  id v53 = v26;
  uint64_t v63 = 0;
  MIGetCurrentMobileUserInfo((_DWORD *)&v63 + 1, &v63);
  char v29 = +[MIDaemonConfiguration sharedInstance];
  uint64_t v30 = [v29 stagingRootForUserContent];
  id v62 = 0;
  uint64_t v25 = [v16 createTemporaryDirectoryInDirectoryURL:v30 error:&v62];
  id v24 = v62;

  if (!v25)
  {
    int v40 = 0;
LABEL_33:
    id v13 = v54;
    goto LABEL_34;
  }
  id v61 = v24;
  unsigned __int8 v31 = [v16 setOwnerOfURL:v25 toUID:HIDWORD(v63) gid:v63 error:&v61];
  id v55 = v61;

  if ((v31 & 1) == 0)
  {
    uint64_t v41 = [v25 path];
    _CreateAndLogError((uint64_t)"-[MobileInstallationHelperService _onQueue_createSafeHarborWithIdentifier:forPersona:containerType:andMigrateDataFrom:completion:]", 725, MIInstallerErrorDomain, 105, v55, 0, @"Failed to chown temporary staging directory %@ to mobile/mobile", v42, (uint64_t)v41);
    id v24 = (id)objc_claimAutoreleasedReturnValue();
    int v40 = 0;
LABEL_32:

    goto LABEL_33;
  }
  id v32 = [v53 lastPathComponent];
  uint64_t v52 = [v25 URLByAppendingPathComponent:v32 isDirectory:1];

  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
  {
    v33 = [v53 path];
    [v52 path];
    v50 = uint64_t v49 = v33;
    id v46 = v54;
    unint64_t v48 = a5;
    uint64_t v44 = (uint64_t)v18;
    MOLogWrite();
  }
  unsigned __int8 v60 = 0;
  unsigned __int8 v34 = objc_msgSend(v52, "lastPathComponent", v44, v46, v48, v49, v50);
  v35 = [v52 URLByDeletingLastPathComponent];
  id v59 = v55;
  LOBYTE(v45) = 0;
  unsigned __int8 v36 = [v16 stageURLByMoving:v53 toItemName:v34 inStagingDir:v35 settingUID:HIDWORD(v63) gid:v63 dataProtectionClass:0xFFFFFFFFLL breakHardlinks:v45 hasSymlink:&v60 error:&v59];
  id v51 = v59;

  if ((v36 & 1) == 0)
  {
    uint64_t v41 = [v53 path];
    uint64_t v47 = [v25 path];
    _CreateAndLogError((uint64_t)"-[MobileInstallationHelperService _onQueue_createSafeHarborWithIdentifier:forPersona:containerType:andMigrateDataFrom:completion:]", 736, MIInstallerErrorDomain, 4, v51, 0, @"Failed to stage safe harbor content at %@ to %@", v43, (uint64_t)v41);
    id v24 = (id)objc_claimAutoreleasedReturnValue();

    id v55 = (id)v47;
    int v40 = v52;
    goto LABEL_32;
  }
  id v58 = v51;
  int v37 = MIAssumeMobileIdentity(&v58);
  id v24 = v58;

  if (v37)
  {
    char v38 = +[MISafeHarborManager defaultManager];
    id v57 = v24;
    unsigned __int8 v39 = objc_msgSend(v38, "fromMIH_createSafeHarborWithIdentifier:forPersona:containerType:andMigrateDataFrom:containsOneOrMoreSymlinks:withError:", v18, v54, a5, v52, v60, &v57);
    id v56 = v57;

    if ((v39 & 1) == 0 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)) {
      MOLogWrite();
    }

    id v13 = v54;
    MIRestoreIdentity();
    id v24 = v56;
    goto LABEL_35;
  }
  id v13 = v54;
  int v40 = v52;
LABEL_34:

LABEL_35:
  if (v25) {
    [v16 removeItemAtURL:v25 error:0];
  }
  v15[2](v15, (uint64_t)v24);
LABEL_11:
}

- (void)createSafeHarborWithIdentifier:(id)a3 forPersona:(id)a4 containerType:(unint64_t)a5 andMigrateDataFrom:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  if (qword_100025B68 != -1) {
    dispatch_once(&qword_100025B68, &stru_100020C58);
  }
  id v16 = qword_100025B70;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100011E2C;
  v21[3] = &unk_100020C80;
  v21[4] = self;
  id v22 = v12;
  id v23 = v13;
  id v24 = v14;
  id v25 = v15;
  unint64_t v26 = a5;
  id v17 = v15;
  id v18 = v14;
  id v19 = v13;
  id v20 = v12;
  dispatch_async(v16, v21);
}

- (void)isDataContainerEmpty:(id)a3 ofContainerType:(unint64_t)a4 completion:(id)a5
{
  id v7 = a3;
  id v22 = (void (**)(id, uint64_t, id))a5;
  id v24 = [v7 path];
  id v8 = (char *)[v24 length];
  id v40 = 0;
  id v23 = +[MIMCMContainer defaultDirectoriesForContainerType:a4 error:&v40];
  id v9 = v40;
  if (!v23)
  {
    uint64_t v21 = 0;
    goto LABEL_18;
  }
  uint64_t v36 = 0;
  int v37 = &v36;
  uint64_t v38 = 0x2020000000;
  char v39 = 0;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v10 = v23;
  id v11 = [v10 countByEnumeratingWithState:&v32 objects:v41 count:16];
  if (!v11)
  {
    uint64_t v21 = 1;
    goto LABEL_17;
  }
  id v25 = v8 + 1;
  uint64_t v26 = *(void *)v33;
  id v12 = v9;
  while (2)
  {
    for (i = 0; i != v11; i = (char *)i + 1)
    {
      if (*(void *)v33 != v26) {
        objc_enumerationMutation(v10);
      }
      uint64_t v14 = *(void *)(*((void *)&v32 + 1) + 8 * i);
      id v15 = +[MIFileManager defaultManager];
      id v16 = [v7 URLByAppendingPathComponent:v14 isDirectory:1];
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472;
      v27[2] = sub_10001219C;
      v27[3] = &unk_100020CA8;
      unsigned __int8 v31 = v25;
      id v17 = v10;
      id v28 = v17;
      id v29 = v7;
      uint64_t v30 = &v36;
      id v18 = [v15 traverseDirectoryAtURL:v16 withBlock:v27];

      if (v18)
      {
        _CreateAndLogError((uint64_t)"-[MobileInstallationHelperService isDataContainerEmpty:ofContainerType:completion:]", 817, MIInstallerErrorDomain, 4, v18, 0, @"Failed to traverse container: %@", v19, (uint64_t)v24);
        id v9 = (id)objc_claimAutoreleasedReturnValue();

LABEL_16:
        uint64_t v21 = 0;
        goto LABEL_17;
      }
      BOOL v20 = *((unsigned char *)v37 + 24) == 0;

      if (!v20)
      {
        id v9 = 0;
        goto LABEL_16;
      }
      id v12 = 0;
    }
    id v11 = [v17 countByEnumeratingWithState:&v32 objects:v41 count:16];
    id v12 = 0;
    id v9 = 0;
    uint64_t v21 = 1;
    if (v11) {
      continue;
    }
    break;
  }
LABEL_17:

  _Block_object_dispose(&v36, 8);
LABEL_18:
  v22[2](v22, v21, v9);
}

- (void)_onQueue_createAppSnapshotWithBundleID:(id)a3 snapshotToURL:(id)a4 onlyV1AppIfPresent:(BOOL)a5 placeholderOnly:(BOOL)a6 completion:(id)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  id v12 = a3;
  id v13 = a4;
  uint64_t v14 = (void (**)(id, void, uint64_t))a7;
  uint64_t v15 = [(MobileInstallationHelperService *)self _verifyBooleanEntitlement:@"com.apple.private.MobileInstallationHelperService.InstallDaemonOpsEnabled"];
  if (v15) {
    goto LABEL_19;
  }
  objc_opt_class();
  id v16 = v12;
  if (objc_opt_isKindOfClass()) {
    id v17 = v16;
  }
  else {
    id v17 = 0;
  }

  if (!v17)
  {
    uint64_t v21 = (void *)MIInstallerErrorDomain;
    id v22 = @"bundleID parameter was not a string";
    uint64_t v23 = 850;
LABEL_18:
    uint64_t v15 = _CreateAndLogError((uint64_t)"-[MobileInstallationHelperService _onQueue_createAppSnapshotWithBundleID:snapshotToURL:onlyV1AppIfPresent:placeholderOnly:completion:]", v23, v21, 104, 0, 0, v22, v18, v31);
LABEL_19:
    id v25 = (id)v15;
    v14[2](v14, 0, v15);
    uint64_t v30 = 0;
    goto LABEL_20;
  }
  objc_opt_class();
  id v19 = v13;
  if (objc_opt_isKindOfClass()) {
    id v20 = v19;
  }
  else {
    id v20 = 0;
  }

  if (!v20)
  {
    uint64_t v21 = (void *)MIInstallerErrorDomain;
    id v22 = @"destURL parameter is not a valid url";
    uint64_t v23 = 856;
    goto LABEL_18;
  }
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
  {
    long long v32 = [v19 path];
    MOLogWrite();
  }
  id v34 = 0;
  int v24 = MIAssumeMobileIdentity(&v34);
  id v25 = v34;
  if (v24)
  {
    uint64_t v26 = [[MIWatchKitAppSnapshot alloc] initWithBundleID:v16 snapshotTo:v19 onlyV1AppIfPresent:v9 placeholderOnly:v8];
    id v33 = v25;
    unsigned int v27 = [(MIWatchKitAppSnapshot *)v26 createSnapshotWithError:&v33];
    id v28 = v33;

    if (v27)
    {
      uint64_t v29 = [(MIWatchKitAppSnapshot *)v26 resultDict];
    }
    else
    {
      uint64_t v29 = 0;
    }

    id v25 = v28;
    MIRestoreIdentity();
    uint64_t v30 = (void *)v29;
  }
  else
  {
    uint64_t v30 = 0;
  }
  ((void (**)(id, void *, uint64_t))v14)[2](v14, v30, (uint64_t)v25);
LABEL_20:
}

- (void)createAppSnapshotWithBundleID:(id)a3 snapshotToURL:(id)a4 onlyV1AppIfPresent:(BOOL)a5 placeholderOnly:(BOOL)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  if (qword_100025B78 != -1) {
    dispatch_once(&qword_100025B78, &stru_100020CC8);
  }
  uint64_t v15 = qword_100025B80;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000127E4;
  block[3] = &unk_100020CF0;
  block[4] = self;
  id v20 = v12;
  BOOL v23 = a5;
  BOOL v24 = a6;
  id v21 = v13;
  id v22 = v14;
  id v16 = v14;
  id v17 = v13;
  id v18 = v12;
  dispatch_async(v15, block);
}

- (BOOL)_validateArgsForMethodWithName:(const char *)a3 bundleIdentifier:(id)a4 wrapperURL:(id)a5 error:(id *)a6
{
  id v9 = a4;
  id v10 = a5;
  objc_opt_class();
  id v11 = v9;
  if (objc_opt_isKindOfClass()) {
    id v12 = v11;
  }
  else {
    id v12 = 0;
  }

  if (v12)
  {
    objc_opt_class();
    id v14 = v10;
    if (objc_opt_isKindOfClass()) {
      id v15 = v14;
    }
    else {
      id v15 = 0;
    }

    if (v15)
    {
      id v17 = 0;
      goto LABEL_15;
    }
    _CreateAndLogError((uint64_t)"-[MobileInstallationHelperService _validateArgsForMethodWithName:bundleIdentifier:wrapperURL:error:]", 1520, MIInstallerErrorDomain, 104, 0, 0, @"Parameter validation failed for: %s, wrapperURL parameter was not a valid url", v16, (uint64_t)a3);
  }
  else
  {
    _CreateAndLogError((uint64_t)"-[MobileInstallationHelperService _validateArgsForMethodWithName:bundleIdentifier:wrapperURL:error:]", 1515, MIInstallerErrorDomain, 104, 0, 0, @"Parameter validation failed for: %s, bundleIdentifier parameter was not a string", v13, (uint64_t)a3);
  }
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  if (a6 && v17)
  {
    id v17 = v17;
    *a6 = v17;
  }
LABEL_15:
  BOOL v18 = v17 == 0;

  return v18;
}

- (BOOL)_validateArgsForMethodWithName:(const char *)a3 bundleIdentifier:(id)a4 wrapperURL:(id)a5 data:(id)a6 error:(id *)a7
{
  id v12 = a6;
  id v19 = 0;
  LODWORD(a4) = [(MobileInstallationHelperService *)self _validateArgsForMethodWithName:a3 bundleIdentifier:a4 wrapperURL:a5 error:&v19];
  id v13 = v19;
  if (a4)
  {
    objc_opt_class();
    id v14 = v12;
    id v15 = (objc_opt_isKindOfClass() & 1) != 0 ? v14 : 0;

    if (!v15)
    {
      uint64_t v17 = _CreateAndLogError((uint64_t)"-[MobileInstallationHelperService _validateArgsForMethodWithName:bundleIdentifier:wrapperURL:data:error:]", 1541, MIInstallerErrorDomain, 104, 0, 0, @"Parameter validation failed for: %s, data parameter was not a data object", v16, (uint64_t)a3);

      id v13 = (id)v17;
    }
  }
  if (a7 && v13) {
    *a7 = v13;
  }

  return v13 == 0;
}

- (void)moveItemInStagingDirectory:(unint64_t)a3 atRelativePath:(id)a4 toDestinationURL:(id)a5 onBehalfOf:(id *)a6 completion:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = (void (**)(id, id))a7;
  id v15 = +[MIFileManager defaultManager];
  uint64_t v16 = +[MIDaemonConfiguration sharedInstance];
  uint64_t v17 = [v16 stagingRootForIdentifier:a3];

  if (!v17)
  {
    _CreateAndLogError((uint64_t)"-[MobileInstallationHelperService moveItemInStagingDirectory:atRelativePath:toDestinationURL:onBehalfOf:completion:]", 2041, MIInstallerErrorDomain, 104, 0, 0, @"Failed to get the staging root for identifier %lu", v18, a3);
    id v21 = (char *)objc_claimAutoreleasedReturnValue();
    id v22 = 0;
    BOOL v23 = 0;
    id v20 = 0;
    goto LABEL_17;
  }
  objc_opt_class();
  id v19 = v12;
  if (objc_opt_isKindOfClass()) {
    id v20 = v19;
  }
  else {
    id v20 = 0;
  }

  if (!v20)
  {
    _CreateAndLogError((uint64_t)"-[MobileInstallationHelperService moveItemInStagingDirectory:atRelativePath:toDestinationURL:onBehalfOf:completion:]", 2046, MIInstallerErrorDomain, 104, 0, 0, @"Parameter validation failed, pathRelativeToStagingURL %@ parameter was not a valid string", v24, (uint64_t)v19);
    id v21 = (char *)objc_claimAutoreleasedReturnValue();
    id v22 = 0;
    BOOL v23 = 0;
    goto LABEL_17;
  }
  v74 = v15;
  objc_opt_class();
  id v25 = v13;
  if (objc_opt_isKindOfClass()) {
    id v20 = v25;
  }
  else {
    id v20 = 0;
  }

  if (!v20)
  {
    _CreateAndLogError((uint64_t)"-[MobileInstallationHelperService moveItemInStagingDirectory:atRelativePath:toDestinationURL:onBehalfOf:completion:]", 2051, MIInstallerErrorDomain, 104, 0, 0, @"Parameter validation failed, destinationURL %@ parameter was not a valid url", v26, (uint64_t)v25);
    goto LABEL_15;
  }
  id v20 = [v19 pathComponents];
  if ([v20 containsObject:@".."])
  {
    _CreateAndLogError((uint64_t)"-[MobileInstallationHelperService moveItemInStagingDirectory:atRelativePath:toDestinationURL:onBehalfOf:completion:]", 2057, MIInstallerErrorDomain, 104, 0, 0, @"Relative path string %@ contains '..', which isn't allowed", v27, (uint64_t)v19);
LABEL_15:
    id v21 = (char *)objc_claimAutoreleasedReturnValue();
    id v22 = 0;
    BOOL v23 = 0;
LABEL_16:
    id v15 = v74;
    goto LABEL_17;
  }
  BOOL v23 = [v17 URLByAppendingPathComponent:v19 isDirectory:0];
  uint64_t v28 = [v74 realPathForURL:v23 ifChildOfURL:v17];
  if (!v28)
  {
    uint64_t v30 = (void *)MIInstallerErrorDomain;
    uint64_t v31 = [v23 path];
    id v56 = [v17 path];
    _CreateAndLogError((uint64_t)"-[MobileInstallationHelperService moveItemInStagingDirectory:atRelativePath:toDestinationURL:onBehalfOf:completion:]", 2064, v30, 104, 0, 0, @"Path %@ isn't a child of %@", v32, (uint64_t)v31);
    id v21 = (char *)objc_claimAutoreleasedReturnValue();

    id v22 = 0;
    goto LABEL_16;
  }
  id v22 = (void *)v28;
  uint64_t v29 = [(MobileInstallationHelperService *)self _verifyBooleanEntitlement:@"com.apple.private.MobileInstallationHelperService.InstallDaemonOpsEnabled"];
  if (v29)
  {
    id v21 = (char *)v29;
    goto LABEL_16;
  }
  id v33 = [v25 URLByDeletingLastPathComponent];
  long long v34 = *(_OWORD *)&a6->var0[4];
  long long v81 = *(_OWORD *)a6->var0;
  long long v82 = v34;
  id v62 = v33;
  id v67 = (char *)[v62 fileSystemRepresentation];
  *(_OWORD *)&atoken.st_dev = v81;
  *(_OWORD *)&atoken.st_uid = v82;
  uint64_t v63 = audit_token_to_euid((audit_token_t *)&atoken);
  *(_OWORD *)&atoken.st_dev = v81;
  *(_OWORD *)&atoken.st_uid = v82;
  gid_t v59 = audit_token_to_egid((audit_token_t *)&atoken);
  memset(&atoken, 0, sizeof(atoken));
  if (lstat(v67, &atoken))
  {
    int v35 = *__error();
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
    {
      strerror(v35);
LABEL_28:
      MOLogWrite();
    }
  }
  else if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
  {
    goto LABEL_28;
  }
  if (!v63)
  {
    id v36 = 0;
    if (!access(v67, 2))
    {
      char v68 = 1;
      goto LABEL_38;
    }
    goto LABEL_34;
  }
  id v79 = 0;
  char v60 = MIAssumeIdentity(v63, v59, &v79);
  id v36 = v79;
  if ((v60 & 1) == 0)
  {
LABEL_36:
    id v36 = v36;
    char v68 = 0;
    id v64 = v36;
    goto LABEL_37;
  }
  if (access(v67, 2))
  {
LABEL_34:
    id v61 = v36;
    int v37 = __error();
    _CreateError((uint64_t)"_VerifyWriteAccessToURLWithToken", 1092, NSPOSIXErrorDomain, *v37, 0, 0, @"access failed for uid %u path %s", v38, v63);
    id v36 = (id)objc_claimAutoreleasedReturnValue();

    if (v63) {
      MIRestoreIdentity();
    }
    goto LABEL_36;
  }
  MIRestoreIdentity();
  id v64 = 0;
  char v68 = 1;
LABEL_37:

  id v36 = v64;
LABEL_38:
  id v39 = v36;

  if ((v68 & 1) == 0)
  {
    long long v43 = *(_OWORD *)&a6->var0[4];
    *(_OWORD *)&atoken.st_dev = *(_OWORD *)a6->var0;
    *(_OWORD *)&atoken.st_uid = v43;
    uint64_t v44 = v39;
    uint64_t v45 = audit_token_to_euid((audit_token_t *)&atoken);
    id v70 = (char *)MIInstallerErrorDomain;
    id v58 = [v25 path];
    _CreateAndLogError((uint64_t)"-[MobileInstallationHelperService moveItemInStagingDirectory:atRelativePath:toDestinationURL:onBehalfOf:completion:]", 2075, v70, 3, v44, 0, @"Unable to confirm write access for user %u to %@", v46, v45);
    id v21 = (char *)objc_claimAutoreleasedReturnValue();

    goto LABEL_16;
  }
  id v69 = (char *)v39;
  if ([v74 itemExistsAtURL:v25])
  {
    id v40 = (void *)MIInstallerErrorDomain;
    uint64_t v41 = [v22 path];
    id v57 = [v25 path];
    _CreateAndLogError((uint64_t)"-[MobileInstallationHelperService moveItemInStagingDirectory:atRelativePath:toDestinationURL:onBehalfOf:completion:]", 2081, v40, 2, 0, 0, @"Failed to move item from %@ to %@ because destination already exists", v42, (uint64_t)v41);
    id v21 = (char *)objc_claimAutoreleasedReturnValue();

LABEL_41:
    goto LABEL_16;
  }
  long long v47 = *(_OWORD *)&a6->var0[4];
  *(_OWORD *)&atoken.st_dev = *(_OWORD *)a6->var0;
  *(_OWORD *)&atoken.st_uid = v47;
  uint64_t v48 = audit_token_to_euid((audit_token_t *)&atoken);
  long long v49 = *(_OWORD *)&a6->var0[4];
  *(_OWORD *)&atoken.st_dev = *(_OWORD *)a6->var0;
  *(_OWORD *)&atoken.st_uid = v49;
  v78 = v69;
  unsigned int v65 = [v74 standardizeOwnershipAtURL:v22 toUID:v48 GID:audit_token_to_egid((audit_token_t *)&atoken) removeACLs:0 setProtectionClass:0 foundSymlink:0 error:&v78];
  id v21 = v78;

  if (!v65) {
    goto LABEL_16;
  }
  v50 = v21;
  v77 = v21;
  unsigned __int8 v71 = [v74 secureRenameFromSourceURL:v22 toDestinationURL:v25 destinationStatus:2 error:&v77];
  id v21 = v77;

  if (v71)
  {

    id v21 = 0;
    goto LABEL_16;
  }
  uint64_t v41 = [v21 domain];
  if (![v41 isEqualToString:NSPOSIXErrorDomain]) {
    goto LABEL_41;
  }
  stat v72 = (char *)[v21 code];

  if (v72 != (char *)18) {
    goto LABEL_16;
  }
  id v51 = [v25 path];
  if (([v51 hasPrefix:@"/private/var/PersonaVolumes/"] & 1) != 0
    || [v51 hasPrefix:@"/var/PersonaVolumes/"])
  {
    v73 = v51;
    v76 = v21;
    unsigned int v66 = [v74 copyItemAtURL:v22 toURL:v25 error:&v76];
    uint64_t v52 = v76;

    if (v66)
    {
      v75 = v52;
      unsigned __int8 v53 = [v74 removeItemAtURL:v22 error:&v75];
      id v54 = v75;

      if ((v53 & 1) == 0 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
      {
        id v55 = [v22 path];
        MOLogWrite();
      }
      id v21 = 0;
      id v15 = v74;
    }
    else
    {
      id v21 = v52;
      id v15 = v74;
    }
    id v51 = v73;
  }
  else
  {
    id v15 = v74;
  }

LABEL_17:
  v14[2](v14, v21);
}

- (void)getPidForTestingWithCompletion:(id)a3
{
  id v5 = a3;
  uint64_t v4 = getpid();
  (*((void (**)(id, uint64_t))a3 + 2))(v5, v4);
}

- (void)dieForTesting
{
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
  {
    v2 = [(MobileInstallationHelperService *)self clientName];
    MOLogWrite();
  }
  exit(1);
}

- (NSXPCConnection)xpcConnection
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_xpcConnection);
  return (NSXPCConnection *)WeakRetained;
}

- (void)setXpcConnection:(id)a3
{
}

- (void).cxx_destruct
{
}

@end