@interface MBCameraRollPlugin
- (BOOL)shouldScrubSQLiteFileCopyAtRelativePath:(id)a3 domain:(id)a4;
- (MBCameraRollPlugin)init;
- (NSString)cloudPhotosSyncedMarkerPath;
- (id)scrubSQLiteFileCopyAtRelativePath:(id)a3 copyTemporaryPath:(id)a4 domain:(id)a5;
- (id)startingBackupWithEngine:(id)a3;
- (void)_populatePathsForEngine:(id)a3 domainName:(id)a4;
- (void)_updateCameraRollBackupStateWithEngine:(id)a3 foundiCPLSyncMarker:(BOOL)a4;
- (void)setCloudPhotosSyncedMarkerPath:(id)a3;
@end

@implementation MBCameraRollPlugin

- (MBCameraRollPlugin)init
{
  v5.receiver = self;
  v5.super_class = (Class)MBCameraRollPlugin;
  v2 = [(MBCameraRollPlugin *)&v5 init];
  v3 = v2;
  if (v2) {
    [(MBCameraRollPlugin *)v2 setCloudPhotosSyncedMarkerPath:@"/var/mobile/Media/PhotoData/CPL/initialsync_marker"];
  }
  return v3;
}

- (void)_populatePathsForEngine:(id)a3 domainName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 backupPolicy] == (id)1)
  {
    v8 = MBGetDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Mega backup policy, so backing up photos", buf, 2u);
      _MBLog();
    }

    [(MBCameraRollPlugin *)self _updateCameraRollBackupStateWithEngine:v6 foundiCPLSyncMarker:0];
  }
  else
  {
    v9 = [(MBCameraRollPlugin *)self cloudPhotosSyncedMarkerPath];
    v10 = +[NSFileManager defaultManager];
    unsigned __int8 v11 = [v10 fileExistsAtPath:v9];

    if (v11)
    {
      v12 = +[NSFileManager defaultManager];
      id v44 = 0;
      v13 = [v12 attributesOfItemAtPath:v9 error:&v44];
      id v14 = v44;

      if (!v13)
      {
        v15 = MBGetDefaultLog();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v46 = v9;
          __int16 v47 = 2112;
          id v48 = v14;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Failed to fetch the attributes for %@: %@", buf, 0x16u);
          v38 = v9;
          id v40 = v14;
          _MBLog();
        }
      }
      v16 = objc_msgSend(v13, "objectForKeyedSubscript:", NSFileCreationDate, v38, v40);
      [v16 timeIntervalSince1970];
      v18 = v17;

      v19 = MBGetDefaultLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v46 = v9;
        __int16 v47 = 2048;
        id v48 = v18;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Found %@ (%.3f)", buf, 0x16u);
        v41 = v18;
        v39 = v9;
        _MBLog();
      }
      v43 = v13;

      v20 = MBGetDefaultLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Cloud photos is enabled and fully synced - excluding camera roll from backup", buf, 2u);
        _MBLog();
      }

      [(MBCameraRollPlugin *)self _updateCameraRollBackupStateWithEngine:v6 foundiCPLSyncMarker:1];
      v21 = [v6 domainManager];
      v22 = [v21 domainForName:v7];

      v23 = [v22 relativePathsToBackupAndRestore];
      unsigned int v42 = [v23 containsObject:@"Media/MediaAnalysis/.backup"];

      v24 = [v22 relativePathsToBackupAndRestore];
      unsigned int v25 = [v24 containsObject:@"Media/PhotoData"];

      v26 = [v22 relativePathsToBackupAndRestore];
      unsigned int v27 = [v26 containsObject:@"Media/PhotoData/private"];

      v28 = [v22 relativePathsToBackupAndRestore];
      unsigned int v29 = [v28 containsObject:@"Media/PhotoData/internal/photosuiconfiguration"];

      v30 = [v22 relativePathsToBackupAndRestore];

      if (v30)
      {
        v31 = [v22 relativePathsToBackupAndRestore];
        id v32 = [v31 mutableCopy];
      }
      else
      {
        id v32 = (id)objc_opt_new();
      }
      v34 = objc_opt_new();
      v35 = v34;
      if ((v25 | v27) == 1)
      {
        [v34 addObject:@"Media/PhotoData/private"];
        [v32 removeObject:@"Media/PhotoData/private"];
        [v32 removeObject:@"Media/PhotoData"];
      }
      if ((v25 | v29) == 1)
      {
        [v35 addObject:@"Media/PhotoData/internal/photosuiconfiguration"];
        [v32 removeObject:@"Media/PhotoData/internal/photosuiconfiguration"];
        [v32 removeObject:@"Media/PhotoData"];
      }
      if (v42)
      {
        [v35 addObject:@"Media/MediaAnalysis/.backup"];
        [v32 removeObject:@"Media/MediaAnalysis/.backup"];
      }
      objc_msgSend(v22, "setRelativePathsToBackupAndRestore:", v35, v39, v41);
      v36 = [v22 relativePathsNotToBackup];

      if (v36)
      {
        v37 = [v22 relativePathsNotToBackup];
        [v32 unionSet:v37];
      }
      [v22 setRelativePathsNotToBackup:v32];
    }
    else
    {
      v33 = MBGetDefaultLog();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Cloud photos is not enabled or not fully synced", buf, 2u);
        _MBLog();
      }

      [(MBCameraRollPlugin *)self _updateCameraRollBackupStateWithEngine:v6 foundiCPLSyncMarker:0];
    }
  }
}

- (void)_updateCameraRollBackupStateWithEngine:(id)a3 foundiCPLSyncMarker:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v5;
    id v7 = +[MBAppManager appManager];
    v8 = [v6 persona];
    unsigned int v9 = [v7 isDomainNameEnabled:@"CameraRollDomain" forPersona:v8];

    uint64_t v10 = 1;
    if (v4) {
      uint64_t v10 = 2;
    }
    if (v9) {
      uint64_t v11 = v10;
    }
    else {
      uint64_t v11 = 3;
    }
    [v6 setCameraRollBackupState:v11];
    if (![v6 cameraRollBackupState]) {
      __assert_rtn("-[MBCameraRollPlugin _updateCameraRollBackupStateWithEngine:foundiCPLSyncMarker:]", "MBCameraRollPlugin.m", 135, "ckEngine.cameraRollBackupState != MBCameraRollBackupStateUnspecified");
    }
    v12 = MBGetDefaultLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      id v14 = [v6 cameraRollBackupState];
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "MBCameraRollBackupState: %ld", buf, 0xCu);
      [v6 cameraRollBackupState];
      _MBLog();
    }
  }
}

- (id)startingBackupWithEngine:(id)a3
{
  id v4 = a3;
  if ([v4 backsUpPrimaryAccount]) {
    [(MBCameraRollPlugin *)self _populatePathsForEngine:v4 domainName:@"CameraRollDomain"];
  }

  return 0;
}

- (BOOL)shouldScrubSQLiteFileCopyAtRelativePath:(id)a3 domain:(id)a4
{
  id v5 = a3;
  if ([a4 isCameraRollDomain]) {
    unsigned __int8 v6 = [v5 isEqualToString:@"Media/PhotoData/Photos.sqlite"];
  }
  else {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (id)scrubSQLiteFileCopyAtRelativePath:(id)a3 copyTemporaryPath:(id)a4 domain:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  if (![(MBCameraRollPlugin *)self shouldScrubSQLiteFileCopyAtRelativePath:v8 domain:a5])
  {
    v12 = 0;
    goto LABEL_22;
  }
  ppDb = 0;
  memset(&v35, 0, sizeof(v35));
  id v10 = v9;
  if (lstat((const char *)[v10 fileSystemRepresentation], &v35))
  {
    int v11 = *__error();
    v12 = +[MBError posixErrorWithPath:v10 format:@"lstat error"];
    v13 = MBGetDefaultLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      id v38 = v10;
      __int16 v39 = 2114;
      id v40 = v8;
      __int16 v41 = 1024;
      LODWORD(v42) = v11;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "lstat failed at %{public}@ (%{public}@): %{errno}d", buf, 0x1Cu);
      _MBLog();
    }
  }
  else
  {
    off_t st_size = v35.st_size;
    v15 = MBGetDefaultLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      id v38 = v10;
      __int16 v39 = 2114;
      id v40 = v8;
      __int16 v41 = 2048;
      double v42 = *(double *)&st_size;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Scrubbing the SQLite database at %{public}@ (%{public}@) (%lld bytes)", buf, 0x20u);
      id v33 = v8;
      off_t v34 = st_size;
      _MBLog();
    }

    +[NSDate timeIntervalSinceReferenceDate];
    double v17 = v16;
    id v18 = v10;
    off_t v19 = sqlite3_open_v2((const char *)[v18 fileSystemRepresentation], &ppDb, 2, 0);
    if (v19)
    {
      off_t v20 = v19;
      v21 = MBGetDefaultLog();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        id v38 = v18;
        __int16 v39 = 2114;
        id v40 = v8;
        __int16 v41 = 1024;
        LODWORD(v42) = v20;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "sqlite3_open_v2 failed at %{public}@ (%{public}@): %d", buf, 0x1Cu);
        id v33 = v8;
        off_t v34 = v20;
        _MBLog();
      }

      +[MBError errorWithCode:1, v18, @"sqlite3_open_v2 failed: %d", v20, v33, v34 path format];
    }
    else
    {
      off_t v22 = sqlite3_exec(ppDb, "update ZDETECTEDFACEPRINT set ZDATA = NULL;", 0, 0, 0);
      if (!v22)
      {
        +[NSDate timeIntervalSinceReferenceDate];
        double v27 = v26;
        id v28 = v18;
        int v29 = lstat((const char *)[v28 fileSystemRepresentation], &v35);
        off_t v30 = v35.st_size;
        v31 = MBGetDefaultLog();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138544130;
          if (v29) {
            uint64_t v32 = -1;
          }
          else {
            uint64_t v32 = v30;
          }
          id v38 = v28;
          __int16 v39 = 2114;
          id v40 = v8;
          __int16 v41 = 2048;
          double v42 = v27 - v17;
          __int16 v43 = 2048;
          uint64_t v44 = v32;
          _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Finished scrubbing the SQLite database at %{public}@ (%{public}@) in %.3fs (%lld bytes)", buf, 0x2Au);
          _MBLog();
        }

        v12 = 0;
        goto LABEL_18;
      }
      off_t v23 = v22;
      v24 = MBGetDefaultLog();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        id v38 = v18;
        __int16 v39 = 2114;
        id v40 = v8;
        __int16 v41 = 1024;
        LODWORD(v42) = v23;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "sqlite3_exec failed at %{public}@ (%{public}@): %d", buf, 0x1Cu);
        off_t v34 = v23;
        _MBLog();
      }

      +[MBError errorWithCode:1, v18, @"sqlite3_exec failed: %s (%d)", sqlite3_errmsg(ppDb), v23, v34 path format];
    v12 = };
  }
LABEL_18:
  if (ppDb) {
    sqlite3_close(ppDb);
  }
  if (v12) {
    +[MBSQLiteFileHandle removeJournalsForSQLiteFileAtPath:v10 error:0];
  }
LABEL_22:

  return v12;
}

- (NSString)cloudPhotosSyncedMarkerPath
{
  return self->_cloudPhotosSyncedMarkerPath;
}

- (void)setCloudPhotosSyncedMarkerPath:(id)a3
{
}

- (void).cxx_destruct
{
}

@end