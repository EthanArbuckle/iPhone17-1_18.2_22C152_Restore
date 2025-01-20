@interface MBFileSystemManager
+ (BOOL)_createSnapshotForVolumeFd:(int)a3 volumeMountPoint:(id)a4 name:(id)a5 error:(id *)a6 cancelationHandler:(id)a7;
+ (BOOL)_mountSnapshotForVolumeFd:(int)a3 volumeMountPoint:(id)a4 name:(id)a5 mountPoint:(id)a6 error:(id *)a7;
+ (BOOL)createSnapshotForVolume:(id)a3 name:(id)a4 error:(id *)a5 cancelationHandler:(id)a6;
+ (BOOL)deleteAllSnapshotsForVolume:(id)a3 withPrefix:(id)a4 error:(id *)a5;
+ (BOOL)deleteAllSnapshotsForVolume:(id)a3 withPrefix:(id)a4 latestCreationDate:(id)a5 error:(id *)a6;
+ (BOOL)deleteSnapshotForVolume:(id)a3 name:(id)a4 error:(id *)a5;
+ (BOOL)mountSnapshotForVolume:(id)a3 name:(id)a4 mountPoint:(id)a5 error:(id *)a6;
+ (BOOL)renameSnapshotForVolume:(id)a3 name:(id)a4 newName:(id)a5 error:(id *)a6;
+ (BOOL)startFilesystemKeyRollingWithPath:(id)a3 error:(id *)a4;
+ (BOOL)stopFilesystemKeyRollingWithPath:(id)a3 error:(id *)a4;
+ (BOOL)unmount:(id)a3 error:(id *)a4;
+ (BOOL)unmountAndDeleteSnapshotForVolume:(id)a3 name:(id)a4 mountPoint:(id)a5 error:(id *)a6;
+ (BOOL)unmountAndRenameSnapshotForVolume:(id)a3 name:(id)a4 mountPoint:(id)a5 newName:(id)a6 error:(id *)a7;
+ (BOOL)volumeSupportsLocalSnapshots:(id)a3;
+ (id)_deleteFileSystemSnapshots:(id)a3 block:(id)a4;
+ (id)createAndMountSnapshotForVolume:(id)a3 name:(id)a4 atFirstAvailableMountPoint:(id)a5 error:(id *)a6 cancelationHandler:(id)a7;
+ (id)fetchAllAPFSVolumeMountPoints;
+ (id)listSnapshotsForVolume:(id)a3 error:(id *)a4;
+ (id)volumeMountPointForFile:(id)a3 error:(id *)a4;
+ (id)volumeUUIDWithVolumeMountPoint:(id)a3 error:(id *)a4;
+ (unint64_t)fileSystemCapacity;
+ (void)removeDeviceTransferDirectoryWithEarliestCreationDate:(id)a3;
+ (void)removeDriveBackupSnapshotsWithLatestCreationDate:(id)a3;
@end

@implementation MBFileSystemManager

+ (BOOL)volumeSupportsLocalSnapshots:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  int v4 = open((const char *)[v3 fileSystemRepresentation], 0);
  if (v4 < 0)
  {
    v13 = MBGetDefaultLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v14 = *__error();
      *(_DWORD *)v28 = 138412546;
      *(void *)&v28[4] = v3;
      *(_WORD *)&v28[12] = 1024;
      *(_DWORD *)&v28[14] = v14;
      _os_log_impl(&dword_1DD9AE000, v13, OS_LOG_TYPE_ERROR, "Unable to open %@: %{errno}d while checking if FS supports snapshot", v28, 0x12u);
      __error();
      _MBLog(@"ERROR", (uint64_t)"Unable to open %@: %{errno}d while checking if FS supports snapshot", v15, v16, v17, v18, v19, v20, (uint64_t)v3);
    }
  }
  else
  {
    int v5 = v4;
    uint64_t v25 = 0;
    long long v24 = xmmword_1DD9F1040;
    int v29 = 0;
    memset(v28, 0, sizeof(v28));
    if (!fgetattrlist(v4, &v24, v28, 0x24uLL, 0))
    {
      unsigned int v22 = *(_DWORD *)&v28[8] & *(_DWORD *)&v28[24];
      close(v5);
      BOOL v21 = (v22 >> 17) & 1;
      goto LABEL_11;
    }
    v6 = MBGetDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v27 = v3;
      _os_log_impl(&dword_1DD9AE000, v6, OS_LOG_TYPE_ERROR, "Couldn't get attr list for filesystem path %@", buf, 0xCu);
      _MBLog(@"ERROR", (uint64_t)"Couldn't get attr list for filesystem path %@", v7, v8, v9, v10, v11, v12, (uint64_t)v3);
    }

    close(v5);
  }
  LOBYTE(v21) = 0;
LABEL_11:

  return v21;
}

+ (unint64_t)fileSystemCapacity
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  unint64_t v2 = atomic_load(&fileSystemCapacity_sFSCapacity);
  if (!v2)
  {
    id v3 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v15 = 0;
    int v4 = [v3 attributesOfFileSystemForPath:@"/var/mobile" error:&v15];
    id v5 = v15;

    if (v4)
    {
      v6 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F283B0]];
      unint64_t v2 = [v6 unsignedLongLongValue];

      atomic_store(v2, &fileSystemCapacity_sFSCapacity);
    }
    else
    {
      uint64_t v7 = MBGetDefaultLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v17 = @"/var/mobile";
        __int16 v18 = 2112;
        id v19 = v5;
        _os_log_impl(&dword_1DD9AE000, v7, OS_LOG_TYPE_ERROR, "Failed to get filesystem capacity at \"%@\": %@", buf, 0x16u);
        _MBLog(@"ERROR", (uint64_t)"Failed to get filesystem capacity at \"%@\": %@", v8, v9, v10, v11, v12, v13, @"/var/mobile");
      }

      unint64_t v2 = -1;
    }
  }
  return v2;
}

+ (BOOL)createSnapshotForVolume:(id)a3 name:(id)a4 error:(id *)a5 cancelationHandler:(id)a6
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = v10;
  int v14 = MBGetDefaultLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v47 = v11;
    __int16 v48 = 2114;
    id v49 = v13;
    _os_log_impl(&dword_1DD9AE000, v14, OS_LOG_TYPE_DEFAULT, "Creating filesystem snapshot %{public}@ at %{public}@", buf, 0x16u);
    _MBLog(@"DEFAULT", (uint64_t)"Creating filesystem snapshot %{public}@ at %{public}@", v15, v16, v17, v18, v19, v20, (uint64_t)v11);
  }

  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v22 = v21;
  id v23 = v13;
  uint64_t v24 = open((const char *)[v23 fileSystemRepresentation], 0);
  if ((v24 & 0x80000000) != 0)
  {
    uint64_t v37 = *__error();
    v38 = MBGetDefaultLog();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v47 = v23;
      __int16 v48 = 1024;
      LODWORD(v49) = v37;
      _os_log_impl(&dword_1DD9AE000, v38, OS_LOG_TYPE_ERROR, "Failed to open %{public}@: %{errno}d", buf, 0x12u);
      _MBLog(@"ERROR", (uint64_t)"Failed to open %{public}@: %{errno}d", v39, v40, v41, v42, v43, v44, (uint64_t)v23);
    }

    if (a5)
    {
      +[MBError errorWithErrno:v37 path:v23 format:@"Failed to open snapshot path"];
      BOOL v36 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    }
LABEL_12:
    BOOL v36 = 0;
    goto LABEL_13;
  }
  int v25 = v24;
  int v26 = [a1 _createSnapshotForVolumeFd:v24 volumeMountPoint:v23 name:v11 error:a5 cancelationHandler:v12];
  close(v25);
  if (!v26) {
    goto LABEL_12;
  }
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v28 = v27;
  int v29 = MBGetDefaultLog();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    id v47 = v11;
    __int16 v48 = 2114;
    id v49 = v23;
    __int16 v50 = 2048;
    double v51 = v28 - v22;
    _os_log_impl(&dword_1DD9AE000, v29, OS_LOG_TYPE_DEFAULT, "Created filesystem snapshot %{public}@ at %{public}@ in %.3fs", buf, 0x20u);
    _MBLog(@"DEFAULT", (uint64_t)"Created filesystem snapshot %{public}@ at %{public}@ in %.3fs", v30, v31, v32, v33, v34, v35, (uint64_t)v11);
  }

  BOOL v36 = 1;
LABEL_13:

  return v36;
}

+ (BOOL)_createSnapshotForVolumeFd:(int)a3 volumeMountPoint:(id)a4 name:(id)a5 error:(id *)a6 cancelationHandler:(id)a7
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a5;
  id v11 = (unsigned int (**)(void))a7;
  id v12 = 0;
  int v13 = 0;
  while (1)
  {
    int v14 = (void *)MEMORY[0x1E01C2AA0]();
    if (v11)
    {
      if (v11[2](v11)) {
        break;
      }
    }
    id v15 = v10;
    int v16 = fs_snapshot_create(a3, (const char *)[v15 fileSystemRepresentation], 0);
    BOOL v17 = v16 == 0;
    if (!v16) {
      goto LABEL_12;
    }
    uint64_t v18 = *__error();
    uint64_t v19 = +[MBError errorWithErrno:v18, v9, @"Failed to create snapshot: %d", v18 path format];

    uint64_t v20 = MBGetDefaultLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138544130;
      id v40 = v10;
      __int16 v41 = 2114;
      id v42 = v9;
      __int16 v43 = 1024;
      int v44 = v13;
      __int16 v45 = 1024;
      int v46 = v18;
      _os_log_impl(&dword_1DD9AE000, v20, OS_LOG_TYPE_ERROR, "Failed to create filesystem snapshot %{public}@ at %{public}@ (%d): %{errno}d", buf, 0x22u);
      _MBLog(@"ERROR", (uint64_t)"Failed to create filesystem snapshot %{public}@ at %{public}@ (%d): %{errno}d", v21, v22, v23, v24, v25, v26, (uint64_t)v15);
    }

    if (v18 != 36)
    {
      id v12 = v19;
LABEL_12:
      double v27 = a6;
      goto LABEL_16;
    }
    sleep(0xAu);
    ++v13;
    id v12 = v19;
    if (v13 == 30)
    {
      BOOL v17 = 0;
      double v27 = a6;
      if (!a6) {
        goto LABEL_18;
      }
      goto LABEL_17;
    }
  }
  double v28 = MBGetDefaultLog();
  double v27 = a6;
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    id v40 = v10;
    __int16 v41 = 2114;
    id v42 = v9;
    _os_log_impl(&dword_1DD9AE000, v28, OS_LOG_TYPE_ERROR, "Failed to create filesystem snapshot %{public}@ at %{public}@ (canceled)", buf, 0x16u);
    _MBLog(@"ERROR", (uint64_t)"Failed to create filesystem snapshot %{public}@ at %{public}@ (canceled)", v29, v30, v31, v32, v33, v34, (uint64_t)v10);
  }

  uint64_t v35 = +[MBError errorWithCode:202 format:@"Failed to create snapshot"];

  BOOL v17 = 0;
  id v12 = (void *)v35;
LABEL_16:
  uint64_t v19 = v12;
  if (!v27) {
    goto LABEL_18;
  }
LABEL_17:
  *double v27 = v19;
LABEL_18:

  return v17;
}

+ (BOOL)mountSnapshotForVolume:(id)a3 name:(id)a4 mountPoint:(id)a5 error:(id *)a6
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (!v12)
  {
    if (a6)
    {
      BOOL v17 = +[MBError errorWithCode:5 description:@"No mountpoint specified at which to mount the snapshot"];
LABEL_10:
      char v16 = 0;
      *a6 = v17;
      goto LABEL_12;
    }
LABEL_11:
    char v16 = 0;
    goto LABEL_12;
  }
  id v13 = v10;
  uint64_t v14 = open((const char *)[v13 fileSystemRepresentation], 0x100000);
  if ((v14 & 0x80000000) != 0)
  {
    uint64_t v18 = *__error();
    uint64_t v19 = MBGetDefaultLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v28 = v13;
      __int16 v29 = 1024;
      int v30 = v18;
      _os_log_impl(&dword_1DD9AE000, v19, OS_LOG_TYPE_ERROR, "Unable to open %@: %{errno}d", buf, 0x12u);
      _MBLog(@"ERROR", (uint64_t)"Unable to open %@: %{errno}d", v20, v21, v22, v23, v24, v25, (uint64_t)v13);
    }

    if (a6)
    {
      BOOL v17 = +[MBError errorWithErrno:v18 path:v13 format:@"Unable to open snapshot path"];
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  int v15 = v14;
  char v16 = [a1 _mountSnapshotForVolumeFd:v14 volumeMountPoint:v13 name:v11 mountPoint:v12 error:a6];
  close(v15);
LABEL_12:

  return v16;
}

+ (id)createAndMountSnapshotForVolume:(id)a3 name:(id)a4 atFirstAvailableMountPoint:(id)a5 error:(id *)a6 cancelationHandler:(id)a7
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  if (![v13 count]) {
    +[MBFileSystemManager createAndMountSnapshotForVolume:name:atFirstAvailableMountPoint:error:cancelationHandler:]();
  }
  id v15 = v11;
  uint64_t v16 = open((const char *)[v15 fileSystemRepresentation], 0x100000);
  if ((v16 & 0x80000000) != 0)
  {
    uint64_t v35 = *__error();
    BOOL v36 = MBGetDefaultLog();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v63 = (uint64_t)v15;
      __int16 v64 = 1024;
      LODWORD(v65) = v35;
      _os_log_impl(&dword_1DD9AE000, v36, OS_LOG_TYPE_ERROR, "Unable to open %@: %{errno}d", buf, 0x12u);
      _MBLog(@"ERROR", (uint64_t)"Unable to open %@: %{errno}d", v37, v38, v39, v40, v41, v42, (uint64_t)v15);
    }

    if (a6)
    {
      +[MBError errorWithErrno:v35 path:v15 format:@"Unable to open snapshot path"];
      id v34 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v34 = 0;
    }
    goto LABEL_36;
  }
  int v17 = v16;
  if (![(id)objc_opt_class() _createSnapshotForVolumeFd:v16 volumeMountPoint:v15 name:v12 error:a6 cancelationHandler:v14])
  {
    id v34 = 0;
    goto LABEL_34;
  }
  id v56 = v14;
  id v18 = v12;
  v53 = (char *)[v18 fileSystemRepresentation];
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  id obj = v13;
  uint64_t v19 = [obj countByEnumeratingWithState:&v58 objects:v68 count:16];
  if (!v19) {
    goto LABEL_15;
  }
  uint64_t v20 = v19;
  uint64_t v21 = *(void *)v59;
  id v54 = v13;
  id v55 = v12;
  uint64_t v52 = (uint64_t)v18;
  while (2)
  {
    for (uint64_t i = 0; i != v20; ++i)
    {
      if (*(void *)v59 != v21) {
        objc_enumerationMutation(obj);
      }
      id v23 = *(id *)(*((void *)&v58 + 1) + 8 * i);
      uint64_t v24 = (const char *)[v23 fileSystemRepresentation];
      uint64_t v25 = [(id)objc_opt_class() volumeMountPointForFile:v23 error:a6];
      uint64_t v26 = v25;
      if (!v15)
      {
        id v34 = 0;
        id v12 = v55;
LABEL_33:
        id v14 = v56;

        id v13 = v54;
        goto LABEL_34;
      }
      if (![v25 isEqualToString:v23])
      {
        id v12 = v55;
        if (fs_snapshot_mount(v17, v24, v53, 0))
        {
          uint64_t v43 = *__error();
          int v44 = MBGetDefaultLog();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412802;
            uint64_t v63 = v52;
            __int16 v64 = 2080;
            v65 = v24;
            __int16 v66 = 1024;
            int v67 = v43;
            _os_log_impl(&dword_1DD9AE000, v44, OS_LOG_TYPE_ERROR, "Unable to mount snapshot %@ at mount point %s: %{errno}d", buf, 0x1Cu);
            _MBLog(@"ERROR", (uint64_t)"Unable to mount snapshot %@ at mount point %s: %{errno}d", v45, v46, v47, v48, v49, v50, v52);
          }

          if (a6)
          {
            +[MBError errorWithErrno:v43 path:v23 format:@"Unable to mount snapshot"];
            id v34 = 0;
            *a6 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            id v34 = 0;
          }
        }
        else
        {
          id v34 = v23;
        }
        goto LABEL_33;
      }
      double v27 = MBGetDefaultLog();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v63 = (uint64_t)v26;
        _os_log_impl(&dword_1DD9AE000, v27, OS_LOG_TYPE_INFO, "Mount point %@ is already in use", buf, 0xCu);
        _MBLog(@"INFO", (uint64_t)"Mount point %@ is already in use", v28, v29, v30, v31, v32, v33, (uint64_t)v26);
      }
    }
    uint64_t v20 = [obj countByEnumeratingWithState:&v58 objects:v68 count:16];
    id v13 = v54;
    id v12 = v55;
    id v18 = (id)v52;
    if (v20) {
      continue;
    }
    break;
  }
LABEL_15:

  [(id)objc_opt_class() deleteSnapshotForVolume:v15 name:v18 error:0];
  if (a6)
  {
    +[MBError errorWithCode:14 format:@"No free mount points for APFS snapshot"];
    id v34 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v34 = 0;
  }
  id v14 = v56;
LABEL_34:
  if (v17 >= 1) {
    close(v17);
  }
LABEL_36:

  return v34;
}

+ (BOOL)_mountSnapshotForVolumeFd:(int)a3 volumeMountPoint:(id)a4 name:(id)a5 mountPoint:(id)a6 error:(id *)a7
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v10 = a5;
  id v11 = a6;
  realpath_DARWIN_EXTSN((const char *)[v11 fileSystemRepresentation], v29);
  id v12 = v10;
  int v13 = fs_snapshot_mount(a3, v29, (const char *)[v12 fileSystemRepresentation], 0);
  if (v13)
  {
    uint64_t v14 = *__error();
    id v15 = MBGetDefaultLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      id v24 = v12;
      __int16 v25 = 2080;
      uint64_t v26 = v29;
      __int16 v27 = 1024;
      int v28 = v14;
      _os_log_impl(&dword_1DD9AE000, v15, OS_LOG_TYPE_ERROR, "Unable to mount snapshot %@ at mount point %s: %{errno}d", buf, 0x1Cu);
      _MBLog(@"ERROR", (uint64_t)"Unable to mount snapshot %@ at mount point %s: %{errno}d", v16, v17, v18, v19, v20, v21, (uint64_t)v12);
    }

    if (a7)
    {
      *a7 = +[MBError errorWithErrno:v14 path:v11 format:@"Unable to mount snapshot"];
    }
  }

  return v13 == 0;
}

+ (BOOL)unmount:(id)a3 error:(id *)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = v5;
  if (!v5)
  {
    if (a4)
    {
      uint64_t v17 = +[MBError errorWithCode:5 description:@"No mountpoint specified from which to unmount the current snapshot"];
      goto LABEL_17;
    }
LABEL_18:
    BOOL v25 = 0;
    goto LABEL_19;
  }
  id v7 = v5;
  if (unmount((const char *)[v7 fileSystemRepresentation], 0))
  {
    uint64_t v8 = *__error();
    id v9 = MBGetDefaultLog();
    id v10 = v9;
    if (v8 == 22)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v34 = v7;
        _os_log_impl(&dword_1DD9AE000, v10, OS_LOG_TYPE_DEFAULT, "Nothing to unmount at %{public}@", buf, 0xCu);
        _MBLog(@"DEFAULT", (uint64_t)"Nothing to unmount at %{public}@", v11, v12, v13, v14, v15, v16, (uint64_t)v7);
      }

      if (a4)
      {
        uint64_t v17 = +[MBError errorWithCode:4 path:v7 format:@"Nothing to unmount"];
LABEL_17:
        BOOL v25 = 0;
        *a4 = v17;
        goto LABEL_19;
      }
    }
    else
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        id v34 = v7;
        __int16 v35 = 1024;
        int v36 = v8;
        _os_log_impl(&dword_1DD9AE000, v10, OS_LOG_TYPE_ERROR, "unmount failed at %{public}@: %{errno}d", buf, 0x12u);
        _MBLog(@"ERROR", (uint64_t)"unmount failed at %{public}@: %{errno}d", v26, v27, v28, v29, v30, v31, (uint64_t)v7);
      }

      if (a4)
      {
        uint64_t v17 = +[MBError errorWithErrno:v8 path:v7 format:@"Unable to unmount snapshot"];
        goto LABEL_17;
      }
    }
    goto LABEL_18;
  }
  uint64_t v18 = MBGetDefaultLog();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v34 = v7;
    _os_log_impl(&dword_1DD9AE000, v18, OS_LOG_TYPE_DEFAULT, "Unmounted snapshot at %{public}@", buf, 0xCu);
    _MBLog(@"DEFAULT", (uint64_t)"Unmounted snapshot at %{public}@", v19, v20, v21, v22, v23, v24, (uint64_t)v7);
  }

  BOOL v25 = 1;
LABEL_19:

  return v25;
}

+ (BOOL)deleteSnapshotForVolume:(id)a3 name:(id)a4 error:(id *)a5
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = v7;
  int v10 = open((const char *)[v9 fileSystemRepresentation], 0);
  if (v10 < 0)
  {
    uint64_t v23 = *__error();
    uint64_t v24 = MBGetDefaultLog();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v47 = v9;
      __int16 v48 = 1024;
      LODWORD(v49) = v23;
      _os_log_impl(&dword_1DD9AE000, v24, OS_LOG_TYPE_ERROR, "Failed to open %{public}@: %{errno}d", buf, 0x12u);
      _MBLog(@"ERROR", (uint64_t)"Failed to open %{public}@: %{errno}d", v25, v26, v27, v28, v29, v30, (uint64_t)v9);
    }

    uint64_t v31 = +[MBError errorWithErrno:v23 path:v9 format:@"Unable to open snapshot path"];
    if (a5) {
      goto LABEL_19;
    }
  }
  else
  {
    int v11 = v10;
    id v12 = v8;
    if (fs_snapshot_delete(v11, (const char *)[v12 fileSystemRepresentation], 0))
    {
      uint64_t v13 = *__error();
      uint64_t v14 = MBGetDefaultLog();
      uint64_t v15 = v14;
      if (v13 == 2)
      {
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          id v47 = v12;
          __int16 v48 = 2114;
          id v49 = v9;
          _os_log_impl(&dword_1DD9AE000, v15, OS_LOG_TYPE_DEFAULT, "Snapshot %{public}@ not found at %{public}@", buf, 0x16u);
          _MBLog(@"DEFAULT", (uint64_t)"Snapshot %{public}@ not found at %{public}@", v16, v17, v18, v19, v20, v21, (uint64_t)v12);
        }

        uint64_t v22 = +[MBError errorWithCode:4 path:v9 format:@"Snapshot not found"];
      }
      else
      {
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543874;
          id v47 = v12;
          __int16 v48 = 2114;
          id v49 = v9;
          __int16 v50 = 1024;
          int v51 = v13;
          _os_log_impl(&dword_1DD9AE000, v15, OS_LOG_TYPE_ERROR, "Failed to delete snapshot %{public}@ at %{public}@: %{errno}d", buf, 0x1Cu);
          _MBLog(@"ERROR", (uint64_t)"Failed to delete snapshot %{public}@ at %{public}@: %{errno}d", v39, v40, v41, v42, v43, v44, (uint64_t)v12);
        }

        uint64_t v22 = +[MBError errorWithErrno:v13 path:v9 format:@"Unable to delete snapshot"];
      }
      uint64_t v31 = (void *)v22;
    }
    else
    {
      uint64_t v32 = MBGetDefaultLog();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        id v47 = v12;
        __int16 v48 = 2114;
        id v49 = v9;
        _os_log_impl(&dword_1DD9AE000, v32, OS_LOG_TYPE_DEFAULT, "Deleted snapshot %{public}@ at %{public}@", buf, 0x16u);
        _MBLog(@"DEFAULT", (uint64_t)"Deleted snapshot %{public}@ at %{public}@", v33, v34, v35, v36, v37, v38, (uint64_t)v12);
      }

      uint64_t v31 = 0;
    }
    close(v11);
    if (a5)
    {
LABEL_19:
      if (v31) {
        *a5 = v31;
      }
    }
  }

  return v31 == 0;
}

+ (BOOL)renameSnapshotForVolume:(id)a3 name:(id)a4 newName:(id)a5 error:(id *)a6
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = v9;
  int v13 = open((const char *)[v12 fileSystemRepresentation], 0x100000);
  if (v13 < 0)
  {
    uint64_t v27 = *__error();
    uint64_t v28 = MBGetDefaultLog();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v38 = v12;
      __int16 v39 = 1024;
      LODWORD(v40) = v27;
      _os_log_impl(&dword_1DD9AE000, v28, OS_LOG_TYPE_ERROR, "Unable to open %@: %{errno}d", buf, 0x12u);
      _MBLog(@"ERROR", (uint64_t)"Unable to open %@: %{errno}d", v29, v30, v31, v32, v33, v34, (uint64_t)v12);
    }

    if (a6)
    {
      +[MBError errorWithErrno:v27 path:v12 format:@"Unable to open snapshot path"];
      BOOL v35 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v35 = 0;
    }
  }
  else
  {
    int v14 = v13;
    id v15 = v10;
    uint64_t v16 = (const char *)[v15 fileSystemRepresentation];
    id v17 = v11;
    if (fs_snapshot_rename(v14, v16, (const char *)[v17 fileSystemRepresentation], 0))
    {
      uint64_t v18 = *__error();
      uint64_t v19 = MBGetDefaultLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        id v38 = v15;
        __int16 v39 = 2112;
        id v40 = v17;
        __int16 v41 = 1024;
        int v42 = v18;
        _os_log_impl(&dword_1DD9AE000, v19, OS_LOG_TYPE_ERROR, "Unable to rename snapshot: %@ -> %@: %{errno}d", buf, 0x1Cu);
        _MBLog(@"ERROR", (uint64_t)"Unable to rename snapshot: %@ -> %@: %{errno}d", v20, v21, v22, v23, v24, v25, (uint64_t)v15);
      }

      uint64_t v26 = +[MBError errorWithErrno:v18 path:v12 format:@"Unable to rename snapshot"];
    }
    else
    {
      uint64_t v26 = 0;
    }
    close(v14);
    BOOL v35 = v26 == 0;
    if (a6 && v26) {
      *a6 = v26;
    }
  }
  return v35;
}

+ (BOOL)unmountAndDeleteSnapshotForVolume:(id)a3 name:(id)a4 mountPoint:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v16 = 0;
  char v12 = [(id)objc_opt_class() unmount:v11 error:&v16];

  id v13 = v16;
  if (v12) {
    goto LABEL_4;
  }
  if (+[MBError isError:v13 withCode:4])
  {

    id v13 = 0;
LABEL_4:
    char v14 = [(id)objc_opt_class() deleteSnapshotForVolume:v9 name:v10 error:a6];
    goto LABEL_5;
  }
  if (a6)
  {
    id v13 = v13;
    char v14 = 0;
    *a6 = v13;
  }
  else
  {
    char v14 = 0;
  }
LABEL_5:

  return v14;
}

+ (BOOL)unmountAndRenameSnapshotForVolume:(id)a3 name:(id)a4 mountPoint:(id)a5 newName:(id)a6 error:(id *)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  id v14 = a5;
  int v15 = [(id)objc_opt_class() unmount:v14 error:a7];

  if (v15) {
    char v16 = [(id)objc_opt_class() renameSnapshotForVolume:v11 name:v12 newName:v13 error:a7];
  }
  else {
    char v16 = 0;
  }

  return v16;
}

+ (id)_deleteFileSystemSnapshots:(id)a3 block:(id)a4
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (uint64_t (**)(id, void *))a4;
  id v46 = a1;
  id v55 = 0;
  id v47 = v6;
  id v8 = [(id)objc_opt_class() listSnapshotsForVolume:v6 error:&v55];
  id v9 = v55;
  id v10 = v9;
  if (v8)
  {
    if ([v8 count])
    {
      id v49 = v10;
      long long v53 = 0u;
      long long v54 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      uint64_t v44 = v8;
      id obj = v8;
      uint64_t v11 = [obj countByEnumeratingWithState:&v51 objects:v56 count:16];
      if (!v11) {
        goto LABEL_19;
      }
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v52;
      uint64_t v45 = v7;
      while (1)
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v52 != v13) {
            objc_enumerationMutation(obj);
          }
          int v15 = *(void **)(*((void *)&v51 + 1) + 8 * i);
          char v16 = (void *)MEMORY[0x1E01C2AA0]();
          if ((v7[2](v7, v15) & 1) == 0)
          {
            uint64_t v22 = MBGetDefaultLog();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138543362;
              id v58 = v15;
              _os_log_impl(&dword_1DD9AE000, v22, OS_LOG_TYPE_DEBUG, "Ignoring snapshot: %{public}@", buf, 0xCu);
              _MBLog(@"DEBUG", (uint64_t)"Ignoring snapshot: %{public}@", v29, v30, v31, v32, v33, v34, (uint64_t)v15);
            }
            goto LABEL_15;
          }
          uint64_t v17 = v12;
          uint64_t v18 = v13;
          uint64_t v19 = [v15 name];
          id v50 = v49;
          int v20 = [v46 deleteSnapshotForVolume:v47 name:v19 error:&v50];
          id v21 = v50;

          if (v20)
          {
            uint64_t v22 = MBGetDefaultLog();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              id v58 = v15;
              _os_log_impl(&dword_1DD9AE000, v22, OS_LOG_TYPE_DEFAULT, "Deleted snapshot: %{public}@", buf, 0xCu);
              _MBLog(@"DEFAULT", (uint64_t)"Deleted snapshot: %{public}@", v23, v24, v25, v26, v27, v28, (uint64_t)v15);
            }
            id v49 = v21;
            uint64_t v13 = v18;
            uint64_t v12 = v17;
            id v7 = v45;
LABEL_15:

            goto LABEL_17;
          }
          id v49 = v21;
          uint64_t v13 = v18;
          uint64_t v12 = v17;
          id v7 = v45;
LABEL_17:
        }
        uint64_t v12 = [obj countByEnumeratingWithState:&v51 objects:v56 count:16];
        if (!v12)
        {
LABEL_19:

          BOOL v35 = 0;
          id v8 = v44;
          id v10 = v49;
          goto LABEL_24;
        }
      }
    }
    uint64_t v36 = MBGetDefaultLog();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      id v58 = v6;
      _os_log_impl(&dword_1DD9AE000, v36, OS_LOG_TYPE_INFO, "No snapshots to delete for %{public}@", buf, 0xCu);
      _MBLog(@"INFO", (uint64_t)"No snapshots to delete for %{public}@", v37, v38, v39, v40, v41, v42, (uint64_t)v6);
    }

    BOOL v35 = 0;
  }
  else
  {
    id v10 = v9;
    BOOL v35 = v10;
  }
LABEL_24:

  return v35;
}

+ (BOOL)deleteAllSnapshotsForVolume:(id)a3 withPrefix:(id)a4 error:(id *)a5
{
  id v7 = a4;
  id v8 = a3;
  id v9 = objc_opt_class();
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __68__MBFileSystemManager_deleteAllSnapshotsForVolume_withPrefix_error___block_invoke;
  v13[3] = &unk_1E6D01150;
  id v14 = v7;
  id v10 = v7;
  uint64_t v11 = [v9 _deleteFileSystemSnapshots:v8 block:v13];

  if (a5 && v11) {
    *a5 = v11;
  }

  return v11 == 0;
}

uint64_t __68__MBFileSystemManager_deleteAllSnapshotsForVolume_withPrefix_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 name];
  uint64_t v4 = [v3 hasPrefix:*(void *)(a1 + 32)];

  return v4;
}

+ (BOOL)deleteAllSnapshotsForVolume:(id)a3 withPrefix:(id)a4 latestCreationDate:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v11) {
    +[MBFileSystemManager deleteAllSnapshotsForVolume:withPrefix:latestCreationDate:error:]();
  }
  uint64_t v12 = v11;
  uint64_t v13 = objc_opt_class();
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __87__MBFileSystemManager_deleteAllSnapshotsForVolume_withPrefix_latestCreationDate_error___block_invoke;
  v19[3] = &unk_1E6D01178;
  id v20 = v12;
  id v21 = v10;
  id v14 = v10;
  id v15 = v12;
  char v16 = [v13 _deleteFileSystemSnapshots:v9 block:v19];
  uint64_t v17 = v16;
  if (a6 && v16) {
    *a6 = v16;
  }

  return v17 == 0;
}

uint64_t __87__MBFileSystemManager_deleteAllSnapshotsForVolume_withPrefix_latestCreationDate_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 creationDate];
  id v5 = v4;
  if (v4 && [v4 compare:*(void *)(a1 + 32)] == -1)
  {
    id v7 = [v3 name];
    uint64_t v6 = [v7 hasPrefix:*(void *)(a1 + 40)];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

+ (void)removeDriveBackupSnapshotsWithLatestCreationDate:(id)a3
{
  v79[2] = *MEMORY[0x1E4F143B8];
  id v58 = a3;
  uint64_t v3 = [MEMORY[0x1E4F1CB10] fileURLWithPath:@"/var/mobile/Library/Caches/Backup" isDirectory:1];
  uint64_t v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v5 = *MEMORY[0x1E4F1C628];
  uint64_t v6 = *MEMORY[0x1E4F1C540];
  v79[0] = *MEMORY[0x1E4F1C628];
  v79[1] = v6;
  uint64_t v62 = v6;
  [MEMORY[0x1E4F1C978] arrayWithObjects:v79 count:2];
  id v56 = v60 = v4;
  v57 = (void *)v3;
  objc_msgSend(v4, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v3);
  long long v70 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v64 = [v7 countByEnumeratingWithState:&v70 objects:v78 count:16];
  if (v64)
  {
    uint64_t v63 = *(void *)v71;
    uint64_t v59 = v5;
    id v61 = v7;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v71 != v63) {
          objc_enumerationMutation(v7);
        }
        id v9 = *(void **)(*((void *)&v70 + 1) + 8 * v8);
        id v10 = (void *)MEMORY[0x1E01C2AA0]();
        id v11 = objc_alloc(MEMORY[0x1E4F29128]);
        uint64_t v12 = [v9 lastPathComponent];
        uint64_t v13 = (void *)[v11 initWithUUIDString:v12];

        if (v13)
        {
          id v68 = 0;
          id v69 = 0;
          char v14 = [v9 getResourceValue:&v69 forKey:v5 error:&v68];
          id v15 = v69;
          id v16 = v68;
          if (v14)
          {
            if ([v15 BOOLValue])
            {
              id v66 = 0;
              id v67 = 0;
              char v17 = [v9 getResourceValue:&v67 forKey:v62 error:&v66];
              uint64_t v18 = v67;
              id v19 = v66;

              if (v17)
              {
                if (v18 && [v58 compare:v18] == -1)
                {
                  uint64_t v23 = MBGetDefaultLog();
                  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
                  {
                    [v18 timeIntervalSince1970];
                    *(_DWORD *)buf = 138412546;
                    v75 = v9;
                    __int16 v76 = 2048;
                    id v77 = v48;
                    _os_log_impl(&dword_1DD9AE000, v23, OS_LOG_TYPE_INFO, "Ignoring %@ since it was created at %.3f", buf, 0x16u);
                    [v18 timeIntervalSince1970];
                    _MBLog(@"INFO", (uint64_t)"Ignoring %@ since it was created at %.3f", v49, v50, v51, v52, v53, v54, (uint64_t)v9);
                  }
                }
                else
                {
                  id v65 = v19;
                  int v20 = [v60 removeItemAtURL:v9 error:&v65];
                  id v21 = v65;

                  uint64_t v22 = MBGetDefaultLog();
                  uint64_t v23 = v22;
                  if (v20)
                  {
                    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138412290;
                      v75 = v9;
                      _os_log_impl(&dword_1DD9AE000, v23, OS_LOG_TYPE_DEFAULT, "Removed drive backup snapshot directory: %@", buf, 0xCu);
                      _MBLog(@"DEFAULT", (uint64_t)"Removed drive backup snapshot directory: %@", v24, v25, v26, v27, v28, v29, (uint64_t)v9);
                    }
                  }
                  else if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412546;
                    v75 = v9;
                    __int16 v76 = 2112;
                    id v77 = v21;
                    _os_log_impl(&dword_1DD9AE000, v23, OS_LOG_TYPE_ERROR, "Failed to remove drive backup snapshot directory %@: %@", buf, 0x16u);
                    _MBLog(@"ERROR", (uint64_t)"Failed to remove drive backup snapshot directory %@: %@", v42, v43, v44, v45, v46, v47, (uint64_t)v9);
                  }
                  id v19 = v21;
                  uint64_t v5 = v59;
                }
              }
              else
              {
                uint64_t v23 = MBGetDefaultLog();
                if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412546;
                  v75 = v9;
                  __int16 v76 = 2112;
                  id v77 = v19;
                  _os_log_impl(&dword_1DD9AE000, v23, OS_LOG_TYPE_ERROR, "Failed to get NSURLCreationDateKey for %@: %@", buf, 0x16u);
                  _MBLog(@"ERROR", (uint64_t)"Failed to get NSURLCreationDateKey for %@: %@", v36, v37, v38, v39, v40, v41, (uint64_t)v9);
                }
              }
              id v7 = v61;

              id v16 = v19;
              goto LABEL_24;
            }
          }
          else
          {
            uint64_t v18 = MBGetDefaultLog();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              v75 = v9;
              __int16 v76 = 2112;
              id v77 = v16;
              _os_log_impl(&dword_1DD9AE000, v18, OS_LOG_TYPE_ERROR, "Failed to get NSURLIsDirectoryKey for %@: %@", buf, 0x16u);
              _MBLog(@"ERROR", (uint64_t)"Failed to get NSURLIsDirectoryKey for %@: %@", v30, v31, v32, v33, v34, v35, (uint64_t)v9);
            }
LABEL_24:
          }
        }

        ++v8;
      }
      while (v64 != v8);
      uint64_t v55 = [v7 countByEnumeratingWithState:&v70 objects:v78 count:16];
      uint64_t v64 = v55;
    }
    while (v55);
  }
}

uint64_t __72__MBFileSystemManager_removeDriveBackupSnapshotsWithLatestCreationDate___block_invoke()
{
  return 1;
}

+ (id)listSnapshotsForVolume:(id)a3 error:(id *)a4
{
  uint64_t v87 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = MBGetDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    id v84 = v4;
    _os_log_impl(&dword_1DD9AE000, v5, OS_LOG_TYPE_DEBUG, "Listing all snapshots at %{public}@", buf, 0xCu);
    _MBLog(@"DEBUG", (uint64_t)"Listing all snapshots at %{public}@", v6, v7, v8, v9, v10, v11, (uint64_t)v4);
  }

  id v78 = v4;
  int v77 = open((const char *)[v78 fileSystemRepresentation], 0);
  if (v77 == -1)
  {
    uint64_t v51 = *__error();
    uint64_t v52 = MBGetDefaultLog();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v84 = v78;
      __int16 v85 = 1024;
      LODWORD(v86) = v51;
      _os_log_impl(&dword_1DD9AE000, v52, OS_LOG_TYPE_ERROR, "Failed to open %{public}@: %{errno}d", buf, 0x12u);
      _MBLog(@"ERROR", (uint64_t)"Failed to open %{public}@: %{errno}d", v53, v54, v55, v56, v57, v58, (uint64_t)v78);
    }

    if (a4)
    {
      +[MBError errorWithErrno:v51 path:v78 format:@"Unable to open snapshot path"];
      id v59 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v59 = 0;
    }
    goto LABEL_49;
  }
  uint64_t v12 = objc_opt_new();
  double v13 = *MEMORY[0x1E4F1CF78];
LABEL_5:
  *(_OWORD *)&v81.bitmapcount = xmmword_1DD9F1058;
  *(void *)&v81.fileattr = 0;
  int v14 = fs_snapshot_list(v77, &v81, buf, 0x400uLL, 0);
  if ((v14 & 0x80000000) == 0)
  {
    if (!v14)
    {
      uint64_t v50 = 0;
      goto LABEL_41;
    }
    int v80 = v14;
    v79 = 0;
    uint64_t v15 = 0;
    int v16 = 1;
    while (1)
    {
      char v17 = &buf[v15];
      uint64_t v18 = v15 + 24;
      uint64_t v20 = *(unsigned int *)&buf[v15];
      int v19 = *(_DWORD *)&buf[v15 + 4];
      if ((v19 & 0x20000000) == 0) {
        goto LABEL_14;
      }
      uint64_t v21 = *(unsigned int *)&buf[v18];
      if (!v21) {
        break;
      }
      uint64_t v22 = MBGetDefaultLog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v82 = 67109120;
        *(_DWORD *)&v82[4] = v21;
        _os_log_impl(&dword_1DD9AE000, v22, OS_LOG_TYPE_ERROR, "Failed to read attributes for directory entry: %{errno}d\n", v82, 8u);
        _MBLog(@"ERROR", (uint64_t)"Failed to read attributes for directory entry: %{errno}d\n", v23, v24, v25, v26, v27, v28, v21);
      }

      uint64_t v29 = +[MBError errorWithErrno:v21 path:v78 format:@"Failed to read snapshot attributes"];

      uint64_t v30 = 0;
      uint64_t v31 = 0;
      uint64_t v32 = 0;
      int v33 = 0;
      v79 = (void *)v29;
LABEL_29:

      if (v33)
      {
        v15 += v20;
        if (v16++ < v80) {
          continue;
        }
      }
      uint64_t v50 = v79;
      if (v79) {
        goto LABEL_41;
      }
      goto LABEL_5;
    }
    uint64_t v18 = v15 + 28;
LABEL_14:
    if ((v19 & 1) != 0 && (uint64_t v34 = &buf[v18], v18 += 8, (v35 = *((_DWORD *)v34 + 1)) != 0))
    {
      uint64_t v36 = &v34[*(int *)v34];
      uint64_t v37 = (v35 - 1);
      if (v36[v37]) {
        +[MBFileSystemManager listSnapshotsForVolume:error:]();
      }
      uint64_t v30 = (void *)[[NSString alloc] initWithBytes:v36 length:v37 encoding:4];
      int v19 = *((_DWORD *)v17 + 1);
      if ((v19 & 0x200) != 0)
      {
LABEL_18:
        uint64_t v38 = (uint64_t *)&buf[v18];
        v18 += 16;
        uint64_t v32 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceReferenceDate:(double)*v38 - v13 + (double)v38[1] * 0.000000001];
        if ((*((_DWORD *)v17 + 1) & 0x800000) != 0) {
          goto LABEL_19;
        }
        goto LABEL_23;
      }
    }
    else
    {
      uint64_t v30 = 0;
      if ((v19 & 0x200) != 0) {
        goto LABEL_18;
      }
    }
    uint64_t v32 = 0;
    if ((v19 & 0x800000) != 0)
    {
LABEL_19:
      *(_OWORD *)v82 = *(_OWORD *)&buf[v18];
      v18 += 16;
      uint64_t v39 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:v82];
      uint64_t v31 = [v39 UUIDString];

      if (!v30) {
        goto LABEL_27;
      }
      goto LABEL_24;
    }
LABEL_23:
    uint64_t v31 = 0;
    if (!v30)
    {
LABEL_27:
      if (v18 >= 1025) {
        +[MBFileSystemManager listSnapshotsForVolume:error:]();
      }
      int v33 = 1;
      goto LABEL_29;
    }
LABEL_24:
    uint64_t v40 = [[MBFileSystemSnapshot alloc] initWithName:v30 uuid:v31 creationDate:v32];
    uint64_t v41 = v12;
    [v12 addObject:v40];
    uint64_t v42 = MBGetDefaultLog();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v82 = 138543362;
      *(void *)&v82[4] = v40;
      _os_log_impl(&dword_1DD9AE000, v42, OS_LOG_TYPE_INFO, "Found file system snapshot: %{public}@", v82, 0xCu);
      _MBLog(@"INFO", (uint64_t)"Found file system snapshot: %{public}@", v43, v44, v45, v46, v47, v48, (uint64_t)v40);
    }

    uint64_t v12 = v41;
    goto LABEL_27;
  }
  uint64_t v60 = *__error();
  id v61 = MBGetDefaultLog();
  if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)v82 = 138543618;
    *(void *)&v82[4] = v78;
    *(_WORD *)&v82[12] = 1024;
    *(_DWORD *)&v82[14] = v60;
    _os_log_impl(&dword_1DD9AE000, v61, OS_LOG_TYPE_ERROR, "fs_snapshot_list failed at %{public}@: %{errno}d", v82, 0x12u);
    _MBLog(@"ERROR", (uint64_t)"fs_snapshot_list failed at %{public}@: %{errno}d", v62, v63, v64, v65, v66, v67, (uint64_t)v78);
  }

  uint64_t v50 = +[MBError errorWithErrno:v60 path:v78 format:@"fs_snapshot_list failed"];
LABEL_41:
  close(v77);
  if (v50)
  {
    id v68 = MBGetDefaultLog();
    if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v84 = v78;
      __int16 v85 = 2114;
      v86 = v50;
      _os_log_impl(&dword_1DD9AE000, v68, OS_LOG_TYPE_ERROR, "Failed to list file system snapshots at %{public}@: %{public}@", buf, 0x16u);
      _MBLog(@"ERROR", (uint64_t)"Failed to list file system snapshots at %{public}@: %{public}@", v69, v70, v71, v72, v73, v74, (uint64_t)v78);
    }

    id v59 = 0;
    if (a4) {
      *a4 = v50;
    }
  }
  else
  {
    id v59 = v12;
  }

LABEL_49:
  return v59;
}

+ (id)volumeMountPointForFile:(id)a3 error:(id *)a4
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  memset(&v9, 0, 512);
  id v5 = a3;
  if (statfs((const char *)objc_msgSend(v5, "fileSystemRepresentation", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                         0,
                         0,
                         0,
                         0,
                         0,
                         0,
                         0,
                         0,
                         0,
                         0,
                         0,
                         0,
                         0,
                         0,
                         0,
                         0,
                         0,
                         0,
                         0,
                         0,
                         0,
                         0,
                         0,
                         0,
                         0,
                         0,
                         0,
                         0,
                         0,
                         0,
                         0,
                         0,
                         0,
                         0,
                         0,
                         0,
                         0,
                         0,
                         0,
                         0,
                         0,
                         0,
                         0,
                         0,
                         0),
         &v9))
  {
    uint64_t v6 = __error();
    if (a4)
    {
      +[MBError errorWithErrno:*v6 path:v5 format:@"statfs failed"];
      uint64_t v7 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v7 = 0;
    }
  }
  else
  {
    uint64_t v7 = objc_msgSend(NSString, "mb_stringWithFileSystemRepresentation:", v9.f_mntonname);
  }

  return v7;
}

+ (id)fetchAllAPFSVolumeMountPoints
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v2 = getfsstat(&v8, 43360, 1);
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v2 & ~(v2 >> 31)];
  if (v2 >= 1)
  {
    uint64_t v4 = v2;
    f_mntonname = v8.f_mntonname;
    do
    {
      if (!strcmp("apfs", f_mntonname - 16) && (*(f_mntonname - 22) & 0x10) == 0)
      {
        uint64_t v6 = objc_msgSend(NSString, "mb_stringWithFileSystemRepresentation:", f_mntonname);
        [v3 addObject:v6];
      }
      f_mntonname += 2168;
      --v4;
    }
    while (v4);
  }
  return v3;
}

+ (BOOL)startFilesystemKeyRollingWithPath:(id)a3 error:(id *)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5) {
    +[MBFileSystemManager startFilesystemKeyRollingWithPath:error:]();
  }
  long long v24 = xmmword_1DD9F1090;
  id v6 = v5;
  int v7 = fsctl((const char *)[v6 fileSystemRepresentation], 0xC0104A3DuLL, &v24, 0);
  if (v7 == -1)
  {
    uint64_t v15 = *__error();
    int v16 = MBGetDefaultLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v26) = v15;
      _os_log_impl(&dword_1DD9AE000, v16, OS_LOG_TYPE_ERROR, "fsctl(APFS_KEY_ROLLING_START) failed: %{errno}d", buf, 8u);
      _MBLog(@"ERROR", (uint64_t)"fsctl(APFS_KEY_ROLLING_START) failed: %{errno}d", v17, v18, v19, v20, v21, v22, v15);
    }

    if (a4)
    {
      *a4 = +[MBError errorWithErrno:v15 format:@"Failed to start APFS key rolling"];
    }
  }
  else
  {
    statfs v8 = MBGetDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v26 = v6;
      _os_log_impl(&dword_1DD9AE000, v8, OS_LOG_TYPE_DEFAULT, "Started APFS key rolling for %{public}@", buf, 0xCu);
      _MBLog(@"DEFAULT", (uint64_t)"Started APFS key rolling for %{public}@", v9, v10, v11, v12, v13, v14, (uint64_t)v6);
    }
  }
  return v7 != -1;
}

+ (BOOL)stopFilesystemKeyRollingWithPath:(id)a3 error:(id *)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5) {
    +[MBFileSystemManager stopFilesystemKeyRollingWithPath:error:]();
  }
  long long v24 = xmmword_1DD9F10A0;
  id v6 = v5;
  int v7 = fsctl((const char *)[v6 fileSystemRepresentation], 0xC0104A3DuLL, &v24, 0);
  if (v7 == -1)
  {
    uint64_t v15 = *__error();
    int v16 = MBGetDefaultLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v26) = v15;
      _os_log_impl(&dword_1DD9AE000, v16, OS_LOG_TYPE_ERROR, "fsctl(APFS_KEY_ROLLING_STOP) failed: %{errno}d", buf, 8u);
      _MBLog(@"ERROR", (uint64_t)"fsctl(APFS_KEY_ROLLING_STOP) failed: %{errno}d", v17, v18, v19, v20, v21, v22, v15);
    }

    if (a4)
    {
      *a4 = +[MBError errorWithErrno:v15 format:@"Failed to stop APFS key rolling"];
    }
  }
  else
  {
    statfs v8 = MBGetDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v26 = v6;
      _os_log_impl(&dword_1DD9AE000, v8, OS_LOG_TYPE_DEFAULT, "Stopped APFS key rolling for %{public}@", buf, 0xCu);
      _MBLog(@"DEFAULT", (uint64_t)"Stopped APFS key rolling for %{public}@", v9, v10, v11, v12, v13, v14, (uint64_t)v6);
    }
  }
  return v7 != -1;
}

+ (void)removeDeviceTransferDirectoryWithEarliestCreationDate:(id)a3
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  if ([v4 fileExistsAtPath:@"/var/mobile/Library/Caches/Backup/DT"])
  {
    id v49 = 0;
    id v5 = [v4 attributesOfItemAtPath:@"/var/mobile/Library/Caches/Backup/DT" error:&v49];
    double v6 = COERCE_DOUBLE(v49);
    if (v5)
    {
      int v7 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F282C0]];
      if (v7)
      {
        if (v3 && [v3 compare:v7] == -1)
        {
          uint64_t v22 = MBGetDefaultLog();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
          {
            [v7 timeIntervalSince1970];
            *(_DWORD *)buf = 138412546;
            uint64_t v51 = @"/var/mobile/Library/Caches/Backup/DT";
            __int16 v52 = 2048;
            double v53 = v41;
            _os_log_impl(&dword_1DD9AE000, v22, OS_LOG_TYPE_INFO, "Ignoring %@ since it was created at %.3f", buf, 0x16u);
            [v7 timeIntervalSince1970];
            _MBLog(@"INFO", (uint64_t)"Ignoring %@ since it was created at %.3f", v42, v43, v44, v45, v46, v47, @"/var/mobile/Library/Caches/Backup/DT");
          }
        }
        else
        {
          statfs v8 = MBGetDefaultLog();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
          {
            [v7 timeIntervalSince1970];
            *(_DWORD *)buf = 138412546;
            uint64_t v51 = @"/var/mobile/Library/Caches/Backup/DT";
            __int16 v52 = 2048;
            double v53 = v9;
            _os_log_impl(&dword_1DD9AE000, v8, OS_LOG_TYPE_DEFAULT, "Removing %@ created at %.3f", buf, 0x16u);
            [v7 timeIntervalSince1970];
            _MBLog(@"DEFAULT", (uint64_t)"Removing %@ created at %.3f", v10, v11, v12, v13, v14, v15, @"/var/mobile/Library/Caches/Backup/DT");
          }

          [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
          double v17 = v16;
          double v48 = v6;
          char v18 = [v4 removeItemAtPath:@"/var/mobile/Library/Caches/Backup/DT" error:&v48];
          double v19 = COERCE_DOUBLE(*(id *)&v48);

          if (v18)
          {
            [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
            double v21 = v20;
            uint64_t v22 = MBGetDefaultLog();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              uint64_t v51 = @"/var/mobile/Library/Caches/Backup/DT";
              __int16 v52 = 2048;
              double v53 = v21 - v17;
              _os_log_impl(&dword_1DD9AE000, v22, OS_LOG_TYPE_DEFAULT, "Removed %@ in %.3fs", buf, 0x16u);
              _MBLog(@"DEFAULT", (uint64_t)"Removed %@ in %.3fs", v23, v24, v25, v26, v27, v28, @"/var/mobile/Library/Caches/Backup/DT");
            }
          }
          else
          {
            uint64_t v22 = MBGetDefaultLog();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              uint64_t v51 = @"/var/mobile/Library/Caches/Backup/DT";
              __int16 v52 = 2112;
              double v53 = v19;
              _os_log_impl(&dword_1DD9AE000, v22, OS_LOG_TYPE_ERROR, "Failed to remove %@: %@", buf, 0x16u);
              _MBLog(@"ERROR", (uint64_t)"Failed to remove %@: %@", v35, v36, v37, v38, v39, v40, @"/var/mobile/Library/Caches/Backup/DT");
            }
          }
          double v6 = v19;
        }
      }
    }
    else
    {
      int v7 = MBGetDefaultLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v51 = @"/var/mobile/Library/Caches/Backup/DT";
        __int16 v52 = 2112;
        double v53 = v6;
        _os_log_impl(&dword_1DD9AE000, v7, OS_LOG_TYPE_ERROR, "Failed to fetch attributes at %@: %@", buf, 0x16u);
        _MBLog(@"ERROR", (uint64_t)"Failed to fetch attributes at %@: %@", v29, v30, v31, v32, v33, v34, @"/var/mobile/Library/Caches/Backup/DT");
      }
    }
  }
}

+ (id)volumeUUIDWithVolumeMountPoint:(id)a3 error:(id *)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5) {
    +[MBFileSystemManager volumeUUIDWithVolumeMountPoint:error:]();
  }
  if (!a4) {
    +[MBFileSystemManager volumeUUIDWithVolumeMountPoint:error:]();
  }
  id v6 = v5;
  int v7 = open((const char *)[v6 fileSystemRepresentation], 0);
  if (v7 < 0)
  {
    uint64_t v10 = *__error();
    uint64_t v11 = MBGetDefaultLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)uint64_t v32 = 138543618;
      *(void *)&v32[4] = v6;
      *(_WORD *)&v32[12] = 1024;
      *(_DWORD *)&v32[14] = v10;
      _os_log_impl(&dword_1DD9AE000, v11, OS_LOG_TYPE_ERROR, "open failed at %{public}@: %{errno}d", v32, 0x12u);
      _MBLog(@"ERROR", (uint64_t)"open failed at %{public}@: %{errno}d", v18, v19, v20, v21, v22, v23, (uint64_t)v6);
    }
    goto LABEL_9;
  }
  int v8 = v7;
  *(void *)&v32[16] = 0;
  *(_OWORD *)uint64_t v32 = xmmword_1DD9F1070;
  v30[0] = 0;
  v30[1] = 0;
  int v31 = 0;
  int v9 = fgetattrlist(v7, v32, v30, 0x14uLL, 0);
  uint64_t v10 = *__error();
  close(v8);
  if (v9)
  {
    uint64_t v11 = MBGetDefaultLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v27 = v6;
      __int16 v28 = 1024;
      int v29 = v10;
      _os_log_impl(&dword_1DD9AE000, v11, OS_LOG_TYPE_ERROR, "fgetattrlist failed at %{public}@: %{errno}d", buf, 0x12u);
      _MBLog(@"ERROR", (uint64_t)"fgetattrlist failed at %{public}@: %{errno}d", v12, v13, v14, v15, v16, v17, (uint64_t)v6);
    }
LABEL_9:

    +[MBError errorWithErrno:v10 path:v6 format:@"open error"];
    uint64_t v24 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  uint64_t v24 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:(char *)v30 + 4];
  if (!v24) {
    +[MBFileSystemManager volumeUUIDWithVolumeMountPoint:error:]();
  }
LABEL_11:

  return v24;
}

+ (void)createAndMountSnapshotForVolume:name:atFirstAvailableMountPoint:error:cancelationHandler:.cold.1()
{
}

+ (void)deleteAllSnapshotsForVolume:withPrefix:latestCreationDate:error:.cold.1()
{
}

+ (void)listSnapshotsForVolume:error:.cold.1()
{
  __assert_rtn("+[MBFileSystemManager listSnapshotsForVolume:error:]", "MBFileSystemManager.m", 505, "p <= attrBuf + sizeof(attrBuf)");
}

+ (void)listSnapshotsForVolume:error:.cold.2()
{
  __assert_rtn("+[MBFileSystemManager listSnapshotsForVolume:error:]", "MBFileSystemManager.m", 484, "namePtr[nameLength - 1] == '\\0'");
}

+ (void)startFilesystemKeyRollingWithPath:error:.cold.1()
{
}

+ (void)stopFilesystemKeyRollingWithPath:error:.cold.1()
{
}

+ (void)volumeUUIDWithVolumeMountPoint:error:.cold.1()
{
}

+ (void)volumeUUIDWithVolumeMountPoint:error:.cold.2()
{
}

+ (void)volumeUUIDWithVolumeMountPoint:error:.cold.3()
{
}

@end