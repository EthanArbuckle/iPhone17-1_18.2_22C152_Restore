@interface MBiCloudDrivePlugin
+ (id)_backupManagerForSnapshotURL:(id)a3 liveFSURL:(id)a4;
+ (id)_restoreManagerForRestoreDirURL:(id)a3;
+ (id)backUpFPFSDatabaseManifestForUserVolume:(id)a3 snapshotMountPoint:(id)a4;
+ (id)backUpiCloudDriveDatabaseManifestForUserVolume:(id)a3 snapshotMountPoint:(id)a4;
- (id)_standardizePath:(id)a3 fromDomain:(id)a4;
- (id)endingRestoreWithPolicy:(id)a3 engine:(id)a4;
@end

@implementation MBiCloudDrivePlugin

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
      [v14 handleFailureInMethod:a2, self, @"MBiCloudDrivePlugin.m", 33, @"Absolute path doesn't have domain root %@ as prefix: %@", v15, v8 object file lineNumber description];
    }
    v11 = [v7 rootPath];
    uint64_t v12 = objc_msgSend(v8, "substringFromIndex:", (char *)objc_msgSend(v11, "length") + 1);

    v8 = (void *)v12;
  }

  return v8;
}

- (id)endingRestoreWithPolicy:(id)a3 engine:(id)a4
{
  v4 = objc_msgSend(a4, "persona", a3);
  v5 = [v4 userIncompleteRestoreDirectory];
  v6 = +[NSURL fileURLWithPath:v5 isDirectory:1];

  id v7 = [v6 URLByAppendingPathComponent:@"var/mobile" isDirectory:1];
  v8 = MBGetDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v15 = v6;
    __int16 v16 = 2112;
    v17 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "=iCloudDrive= restoreDirectoryURL:%@, userURL:%@", buf, 0x16u);
    _MBLog();
  }

  v9 = [(id)objc_opt_class() _restoreManagerForRestoreDirURL:v7];
  if (v9)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1001C59D8;
    v12[3] = &unk_100415C20;
    dispatch_semaphore_t v13 = dispatch_semaphore_create(0);
    unsigned __int8 v10 = v13;
    [v9 restoreWithCompletionBlock:v12];
    dispatch_semaphore_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
  }
  return 0;
}

+ (id)backUpiCloudDriveDatabaseManifestForUserVolume:(id)a3 snapshotMountPoint:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (FPIsCloudDocsWithFPFSEnabled())
  {
    v8 = MBGetDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "=iCloudDrive= FPFS is enabled for iCloud Drive, no need to do legacy backup.", buf, 2u);
      _MBLog();
    }
LABEL_18:
    id v16 = 0;
    goto LABEL_19;
  }
  if (!v6)
  {
    v8 = MBGetDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_FAULT, "=iCloudDrive= Missing userVolumeMountPoint for iCloud Drive Database", buf, 2u);
      _MBLog();
    }
    goto LABEL_18;
  }
  if (!v7)
  {
    v8 = MBGetDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_FAULT, "=iCloudDrive= Missing snapshotMountPoint for iCloud Drive Database", buf, 2u);
      _MBLog();
    }
    goto LABEL_18;
  }
  v8 = +[NSURL fileURLWithPath:v7 isDirectory:1];
  v9 = +[NSURL fileURLWithPath:v6 isDirectory:1];
  unsigned __int8 v10 = MBGetDefaultLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v8;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "=iCloudDrive= userFolderURLInSnapshot:%@, userFolderURLInLiveFS:%@", buf, 0x16u);
    _MBLog();
  }

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v27 = sub_1001C5F34;
  v28 = sub_1001C5F44;
  id v29 = 0;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = sub_1001C5F34;
  v22[4] = sub_1001C5F44;
  id v23 = 0;
  dispatch_semaphore_t v11 = dispatch_semaphore_create(0);
  uint64_t v12 = [a1 _backupManagerForSnapshotURL:v8 liveFSURL:v9];
  if (v12)
  {
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1001C5F4C;
    v18[3] = &unk_100415C48;
    v20 = v22;
    v21 = buf;
    dispatch_semaphore_t v13 = v11;
    v19 = v13;
    [v12 backUpWithCompletionBlock:v18];
    dispatch_semaphore_wait(v13, 0xFFFFFFFFFFFFFFFFLL);
  }
  if (*(void *)(*(void *)&buf[8] + 40))
  {
    v14 = MBGetDefaultLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = *(void *)(*(void *)&buf[8] + 40);
      *(_DWORD *)v24 = 138412290;
      uint64_t v25 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "=iCloudDrive= BRCDatabaseBackupManager failed: %@", v24, 0xCu);
      _MBLog();
    }

    id v16 = *(id *)(*(void *)&buf[8] + 40);
  }
  else
  {
    id v16 = 0;
  }

  _Block_object_dispose(v22, 8);
  _Block_object_dispose(buf, 8);

LABEL_19:
  return v16;
}

+ (id)backUpFPFSDatabaseManifestForUserVolume:(id)a3 snapshotMountPoint:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  id v23 = sub_1001C5F34;
  v24 = sub_1001C5F44;
  id v25 = 0;
  id v7 = +[NSURL fileURLWithPath:v6 isDirectory:1];
  v8 = +[NSURL fileURLWithPath:v5 isDirectory:1];
  v9 = MBGetDefaultLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v27 = v7;
    __int16 v28 = 2112;
    id v29 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "=iCloudDrive= FPFS: userFolderURLInSnapshot:%@, userFolderURLInLiveFS:%@", buf, 0x16u);
    _MBLog();
  }

  dispatch_semaphore_t v10 = dispatch_semaphore_create(0);
  dispatch_semaphore_t v11 = +[FPDaemonConnection sharedConnection];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1001C62F4;
  v17[3] = &unk_100415C70;
  v19 = &v20;
  uint64_t v12 = v10;
  v18 = v12;
  [v11 backUpUserURL:v7 outputUserURL:v8 completionHandler:v17];

  dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
  if (v21[5])
  {
    dispatch_semaphore_t v13 = MBGetDefaultLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = (void *)v21[5];
      *(_DWORD *)buf = 138412290;
      v27 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "=iCloudDrive= FPFSSQLBackupManager failed: %@", buf, 0xCu);
      _MBLog();
    }

    id v15 = (id)v21[5];
  }
  else
  {
    id v15 = 0;
  }

  _Block_object_dispose(&v20, 8);
  return v15;
}

+ (id)_backupManagerForSnapshotURL:(id)a3 liveFSURL:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (void (*)(id, id))MBWeakLinkSymbol();
  if (v7)
  {
    v7(v5, v6);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
LABEL_5:
    dispatch_semaphore_t v10 = v8;
    goto LABEL_6;
  }
  v9 = (objc_class *)MBWeakLinkClass();
  if (v9)
  {
    id v8 = [[v9 alloc] initWithUserURL:v5 outputUserURL:v6];
    goto LABEL_5;
  }
  uint64_t v12 = MBGetDefaultLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)dispatch_semaphore_t v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "=iCloudDrive= Failed to create CloudDocs database backup manager", v13, 2u);
    _MBLog();
  }

  dispatch_semaphore_t v10 = 0;
LABEL_6:

  return v10;
}

+ (id)_restoreManagerForRestoreDirURL:(id)a3
{
  id v3 = a3;
  v4 = (void (*)(id))MBWeakLinkSymbol();
  if (v4)
  {
    v4(v3);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_5:
    id v7 = v5;
    goto LABEL_6;
  }
  id v6 = (objc_class *)MBWeakLinkClass();
  if (v6)
  {
    id v5 = [[v6 alloc] initWithUserURL:v3];
    goto LABEL_5;
  }
  v9 = MBGetDefaultLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)dispatch_semaphore_t v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "=iCloudDrive= Failed to create CloudDocs database restore manager", v10, 2u);
    _MBLog();
  }

  id v7 = 0;
LABEL_6:

  return v7;
}

@end