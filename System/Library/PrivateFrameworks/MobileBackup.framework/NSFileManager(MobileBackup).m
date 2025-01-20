@interface NSFileManager(MobileBackup)
- (BOOL)_perform:()MobileBackup times:error:;
- (BOOL)mb_markAsPurgeableItemAtPath:()MobileBackup error:;
- (id)_pathsRootedAt:()MobileBackup subpaths:;
- (id)mb_moveAsideItemAtPath:()MobileBackup error:;
- (uint64_t)_anyPathExists:()MobileBackup;
- (uint64_t)_migratePaths:()MobileBackup to:error:;
- (uint64_t)_moveItemAtPath:()MobileBackup toTempDir:;
- (uint64_t)_removeAllPaths:()MobileBackup error:;
- (uint64_t)_tryMovingThenRemovingItemAtPath:()MobileBackup error:;
- (uint64_t)mb_migrateIfNeededFromSource:()MobileBackup sourceSubPaths:toDestination:destinationSubPaths:error:;
- (uint64_t)mb_moveAsideAndMarkPurgeableDBFilesAtPath:()MobileBackup error:;
- (uint64_t)mb_moveToTmpDirThenRemoveItemAtPath:()MobileBackup error:;
- (uint64_t)mb_savePlistAtPath:()MobileBackup addingItems:removing:error:;
@end

@implementation NSFileManager(MobileBackup)

- (uint64_t)mb_moveToTmpDirThenRemoveItemAtPath:()MobileBackup error:
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6) {
    -[NSFileManager(MobileBackup) mb_moveToTmpDirThenRemoveItemAtPath:error:]();
  }
  v7 = v6;
  if ([a1 fileExistsAtPath:v6])
  {
    id v18 = 0;
    uint64_t v8 = [a1 _tryMovingThenRemovingItemAtPath:v7 error:&v18];
    v9 = v18;
    v10 = v9;
    if (a4 && (v8 & 1) == 0)
    {
      v10 = v9;
      *a4 = v10;
    }
  }
  else
  {
    v10 = MBGetDefaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v20 = v7;
      _os_log_impl(&dword_1DD9AE000, v10, OS_LOG_TYPE_DEFAULT, "=mbfm= rm: Nothing at %{public}@ to remove", buf, 0xCu);
      _MBLog(@"DEFAULT", (uint64_t)"=mbfm= rm: Nothing at %{public}@ to remove", v11, v12, v13, v14, v15, v16, (uint64_t)v7);
    }
    uint64_t v8 = 1;
  }

  return v8;
}

- (uint64_t)_tryMovingThenRemovingItemAtPath:()MobileBackup error:
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6) {
    -[NSFileManager(MobileBackup) _tryMovingThenRemovingItemAtPath:error:]();
  }
  if (!a4) {
    -[NSFileManager(MobileBackup) _tryMovingThenRemovingItemAtPath:error:]();
  }
  v7 = v6;
  uint64_t v8 = +[MBTemporaryDirectory temporaryDirectoryOnSameVolumeAsPath:v6 identifiedBy:@"move-aside-cleanup" error:a4];
  if (v8)
  {
    v9 = MBGetDefaultLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v53 = v8;
      _os_log_impl(&dword_1DD9AE000, v9, OS_LOG_TYPE_INFO, "=mbfm= rm: Created move-aside temp dir: %@", buf, 0xCu);
      _MBLog(@"INFO", (uint64_t)"=mbfm= rm: Created move-aside temp dir: %@", v10, v11, v12, v13, v14, v15, (uint64_t)v8);
    }

    if ([a1 _moveItemAtPath:v7 toTempDir:v8])
    {
      uint64_t v16 = MBGetDefaultLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v17 = [v8 path];
        *(_DWORD *)buf = 138543362;
        v53 = v17;
        _os_log_impl(&dword_1DD9AE000, v16, OS_LOG_TYPE_DEFAULT, "=mbfm= rm: Removing temporary cleanup dir %{public}@", buf, 0xCu);

        id v18 = [v8 path];
        _MBLog(@"DEFAULT", (uint64_t)"=mbfm= rm: Removing temporary cleanup dir %{public}@", v19, v20, v21, v22, v23, v24, (uint64_t)v18);
      }
      uint64_t v25 = [v8 disposeWithError:a4];
    }
    else
    {
      *a4 = +[MBError posixErrorWithPath:v7 format:@"Unable to move to temporary cleanup dir"];
      v26 = MBGetDefaultLog();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        v27 = [v8 path];
        uint64_t v28 = *a4;
        *(_DWORD *)buf = 138543874;
        v53 = v7;
        __int16 v54 = 2114;
        v55 = v27;
        __int16 v56 = 2112;
        uint64_t v57 = v28;
        _os_log_impl(&dword_1DD9AE000, v26, OS_LOG_TYPE_ERROR, "=mbfm= rm: Unable to move %{public}@ to temporary cleanup dir %{public}@: %@", buf, 0x20u);

        v51 = [v8 path];
        _MBLog(@"ERROR", (uint64_t)"=mbfm= rm: Unable to move %{public}@ to temporary cleanup dir %{public}@: %@", v29, v30, v31, v32, v33, v34, (uint64_t)v7);
      }
      [v8 dispose];
      uint64_t v25 = 0;
    }
  }
  else
  {
    if (+[MBError errnoForError:*a4] == 2) {
      goto LABEL_11;
    }
    v35 = MBGetDefaultLog();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      v36 = (void *)*a4;
      *(_DWORD *)buf = 138543618;
      v53 = v7;
      __int16 v54 = 2114;
      v55 = v36;
      _os_log_impl(&dword_1DD9AE000, v35, OS_LOG_TYPE_ERROR, "=mbfm= rm: Unable to create temporary cleanup dir, removing %{public}@ in place: %{public}@", buf, 0x16u);
      _MBLog(@"ERROR", (uint64_t)"=mbfm= rm: Unable to create temporary cleanup dir, removing %{public}@ in place: %{public}@", v37, v38, v39, v40, v41, v42, (uint64_t)v7);
    }

    uint64_t v25 = [a1 removeItemAtPath:v7 error:a4];
    if ((v25 & 1) != 0 || [a1 fileExistsAtPath:v7])
    {
      v43 = MBGetDefaultLog();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v53 = v7;
        _os_log_impl(&dword_1DD9AE000, v43, OS_LOG_TYPE_DEFAULT, "=mbfm= rm: Removed %{public}@ in place", buf, 0xCu);
        _MBLog(@"DEFAULT", (uint64_t)"=mbfm= rm: Removed %{public}@ in place", v44, v45, v46, v47, v48, v49, (uint64_t)v7);
      }
    }
    else
    {
LABEL_11:
      uint64_t v25 = 1;
    }
  }

  return v25;
}

- (uint64_t)_moveItemAtPath:()MobileBackup toTempDir:
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = [v6 makeTemporaryFilePath];
  id v8 = v5;
  v9 = (const std::__fs::filesystem::path *)[v8 fileSystemRepresentation];
  id v10 = v7;
  uint64_t v11 = (const std::__fs::filesystem::path *)[v10 fileSystemRepresentation];
  rename(v9, v11, v12);
  if (v13)
  {
    if (*__error() != 2)
    {
      uint64_t v30 = 0;
      goto LABEL_10;
    }
    uint64_t v14 = MBGetDefaultLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = [v6 path];
      *(_DWORD *)buf = 138543618;
      id v33 = v8;
      __int16 v34 = 2114;
      v35 = v15;
      _os_log_impl(&dword_1DD9AE000, v14, OS_LOG_TYPE_DEFAULT, "=mbfm= rm: Nothing at %{public}@ to move to temporary cleanup dir %{public}@", buf, 0x16u);

      uint64_t v16 = [v6 path];
      _MBLog(@"DEFAULT", (uint64_t)"=mbfm= rm: Nothing at %{public}@ to move to temporary cleanup dir %{public}@", v17, v18, v19, v20, v21, v22, (uint64_t)v8);
LABEL_7:
    }
  }
  else
  {
    uint64_t v14 = MBGetDefaultLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v23 = [v6 path];
      *(_DWORD *)buf = 138543618;
      id v33 = v8;
      __int16 v34 = 2114;
      v35 = v23;
      _os_log_impl(&dword_1DD9AE000, v14, OS_LOG_TYPE_DEFAULT, "=mbfm= rm: moved item at %{public}@ to temp cleanup dir %{public}@", buf, 0x16u);

      uint64_t v16 = [v6 path];
      _MBLog(@"DEFAULT", (uint64_t)"=mbfm= rm: moved item at %{public}@ to temp cleanup dir %{public}@", v24, v25, v26, v27, v28, v29, (uint64_t)v8);
      goto LABEL_7;
    }
  }

  uint64_t v30 = 1;
LABEL_10:

  return v30;
}

- (id)mb_moveAsideItemAtPath:()MobileBackup error:
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6) {
    -[NSFileManager(MobileBackup) mb_moveAsideItemAtPath:error:]();
  }
  v7 = v6;
  id v8 = [v6 pathExtension];
  v9 = [v7 stringByDeletingPathExtension];
  uint64_t v10 = [v9 stringByAppendingString:@"_"];
  uint64_t v11 = [MEMORY[0x1E4F1C9C8] now];
  uint64_t v12 = [v11 iso8601String];
  int v13 = [(id)v10 stringByAppendingString:v12];
  uint64_t v14 = [v13 stringByAppendingPathExtension:v8];

  id v32 = 0;
  LOBYTE(v10) = [a1 moveItemAtPath:v7 toPath:v14 error:&v32];
  id v15 = v32;
  uint64_t v16 = MBGetDefaultLog();
  uint64_t v17 = v16;
  if (v10)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543618;
      __int16 v34 = v7;
      __int16 v35 = 2114;
      uint64_t v36 = v14;
      _os_log_impl(&dword_1DD9AE000, v17, OS_LOG_TYPE_INFO, "=mbfm= ma: Moved aside %{public}@ to %{public}@", buf, 0x16u);
      _MBLog(@"INFO", (uint64_t)"=mbfm= ma: Moved aside %{public}@ to %{public}@", v18, v19, v20, v21, v22, v23, (uint64_t)v7);
    }

    id v24 = v14;
  }
  else
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      __int16 v34 = v7;
      __int16 v35 = 2114;
      uint64_t v36 = v14;
      __int16 v37 = 2112;
      id v38 = v15;
      _os_log_impl(&dword_1DD9AE000, v17, OS_LOG_TYPE_ERROR, "=mbfm= ma: Unable to move aside %{public}@ to %{public}@: %@", buf, 0x20u);
      _MBLog(@"ERROR", (uint64_t)"=mbfm= ma: Unable to move aside %{public}@ to %{public}@: %@", v25, v26, v27, v28, v29, v30, (uint64_t)v7);
    }

    id v24 = 0;
    if (a4) {
      *a4 = v15;
    }
  }

  return v24;
}

- (BOOL)mb_markAsPurgeableItemAtPath:()MobileBackup error:
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v22 = 73733;
  id v5 = a3;
  int v6 = fsctl((const char *)[v5 fileSystemRepresentation], 0xC0084A44uLL, &v22, 0);
  if (v6)
  {
    v7 = +[MBError errorWithErrno:*__error() path:v5 format:@"Failed to mark item purgeable"];
    id v8 = MBGetDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v24 = v5;
      __int16 v25 = 2112;
      uint64_t v26 = v7;
      _os_log_impl(&dword_1DD9AE000, v8, OS_LOG_TYPE_ERROR, "=mbfm= =purge= Failed to mark %{public}@ as purgeable: %@", buf, 0x16u);
      _MBLog(@"ERROR", (uint64_t)"=mbfm= =purge= Failed to mark %{public}@ as purgeable: %@", v9, v10, v11, v12, v13, v14, (uint64_t)v5);
    }

    if (a4)
    {
      v7 = v7;
      *a4 = v7;
    }
  }
  else
  {
    v7 = MBGetDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      id v24 = v5;
      _os_log_impl(&dword_1DD9AE000, v7, OS_LOG_TYPE_INFO, "=mbfm= =purge= Marked %{public}@ as purgeable", buf, 0xCu);
      _MBLog(@"INFO", (uint64_t)"=mbfm= =purge= Marked %{public}@ as purgeable", v15, v16, v17, v18, v19, v20, (uint64_t)v5);
    }
  }

  return v6 == 0;
}

- (uint64_t)mb_moveAsideAndMarkPurgeableDBFilesAtPath:()MobileBackup error:
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6) {
    -[NSFileManager(MobileBackup) mb_moveAsideAndMarkPurgeableDBFilesAtPath:error:]();
  }
  v7 = v6;
  if ([a1 fileExistsAtPath:v6])
  {
    id v8 = MBSQLiteJournalSuffixes();
    uint64_t v9 = [v8 setByAddingObject:&stru_1F394E128];

    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    id obj = v9;
    uint64_t v10 = [obj countByEnumeratingWithState:&v47 objects:v55 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v48;
      uint64_t v44 = v7;
LABEL_5:
      uint64_t v13 = 0;
      while (1)
      {
        if (*(void *)v48 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = [v7 stringByAppendingString:*(void *)(*((void *)&v47 + 1) + 8 * v13)];
        if ([a1 fileExistsAtPath:v14])
        {
          uint64_t v15 = objc_msgSend(a1, "mb_moveAsideItemAtPath:error:", v14, a4);
          if (!v15)
          {
            uint64_t v29 = MBGetDefaultLog();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              v52 = v14;
              __int16 v53 = 2112;
              id v54 = 0;
              _os_log_impl(&dword_1DD9AE000, v29, OS_LOG_TYPE_ERROR, "=mbfm= Failed to move aside DB file %@: %@", buf, 0x16u);
              _MBLog(@"ERROR", (uint64_t)"=mbfm= Failed to move aside DB file %@: %@", v30, v31, v32, v33, v34, v35, (uint64_t)v14);
            }

            id v36 = 0;
            id v19 = 0;
            if (a4)
            {
LABEL_26:
              *a4 = v36;
              id v19 = v36;
            }
LABEL_28:

            uint64_t v28 = 0;
            goto LABEL_29;
          }
          uint64_t v16 = a4;
          id v46 = 0;
          uint64_t v17 = a1;
          char v18 = objc_msgSend(a1, "mb_markAsPurgeableItemAtPath:error:", v15, &v46);
          id v19 = v46;
          uint64_t v20 = MBGetDefaultLog();
          uint64_t v21 = v20;
          if ((v18 & 1) == 0)
          {
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              v52 = v15;
              __int16 v53 = 2112;
              id v54 = v19;
              _os_log_impl(&dword_1DD9AE000, v21, OS_LOG_TYPE_ERROR, "=mbfm= Failed to mark DB %@ as purgeable: %@", buf, 0x16u);
              _MBLog(@"ERROR", (uint64_t)"=mbfm= Failed to mark DB %@ as purgeable: %@", v37, v38, v39, v40, v41, v42, (uint64_t)v15);
            }

            if (v16)
            {
              a4 = v16;
              id v36 = v19;
              v7 = v44;
              goto LABEL_26;
            }
            v7 = v44;
            goto LABEL_28;
          }
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v52 = v14;
            __int16 v53 = 2112;
            id v54 = v15;
            _os_log_impl(&dword_1DD9AE000, v21, OS_LOG_TYPE_DEFAULT, "=mbfm= Moved aside DB file %@ to %@", buf, 0x16u);
            _MBLog(@"DEFAULT", (uint64_t)"=mbfm= Moved aside DB file %@ to %@", v22, v23, v24, v25, v26, v27, (uint64_t)v14);
          }

          a4 = v16;
          v7 = v44;
          a1 = v17;
        }

        if (v11 == ++v13)
        {
          uint64_t v11 = [obj countByEnumeratingWithState:&v47 objects:v55 count:16];
          if (v11) {
            goto LABEL_5;
          }
          break;
        }
      }
    }
    uint64_t v28 = 1;
LABEL_29:
  }
  else
  {
    uint64_t v28 = 1;
  }

  return v28;
}

- (uint64_t)mb_migrateIfNeededFromSource:()MobileBackup sourceSubPaths:toDestination:destinationSubPaths:error:
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if (([v12 isAbsolutePath] & 1) == 0) {
    -[NSFileManager(MobileBackup) mb_migrateIfNeededFromSource:sourceSubPaths:toDestination:destinationSubPaths:error:]();
  }
  if (([v14 isAbsolutePath] & 1) == 0) {
    -[NSFileManager(MobileBackup) mb_migrateIfNeededFromSource:sourceSubPaths:toDestination:destinationSubPaths:error:]();
  }
  uint64_t v16 = [v13 count];
  if (v16 != [v15 count]) {
    -[NSFileManager(MobileBackup) mb_migrateIfNeededFromSource:sourceSubPaths:toDestination:destinationSubPaths:error:]();
  }
  uint64_t v55 = a7;
  uint64_t v17 = [a1 _pathsRootedAt:v12 subpaths:v13];
  int v18 = [a1 _anyPathExists:v17];
  id v19 = [a1 _pathsRootedAt:v14 subpaths:v15];
  int v20 = [a1 _anyPathExists:v19];
  uint64_t v21 = MBGetDefaultLog();
  uint64_t v22 = v21;
  if (!v20)
  {
    BOOL v32 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
    if (v18)
    {
      if (v32)
      {
        uint64_t v33 = [v15 componentsJoinedByString:@", "];
        *(_DWORD *)buf = 138543874;
        id v57 = v33;
        __int16 v58 = 2114;
        id v59 = v12;
        __int16 v60 = 2114;
        id v61 = v14;
        _os_log_impl(&dword_1DD9AE000, v22, OS_LOG_TYPE_DEFAULT, "=mbfm= mg: Migrating (%{public}@) from %{public}@ to %{public}@", buf, 0x20u);

        uint64_t v34 = [v15 componentsJoinedByString:@", "];
        _MBLog(@"DEFAULT", (uint64_t)"=mbfm= mg: Migrating (%{public}@) from %{public}@ to %{public}@", v35, v36, v37, v38, v39, v40, (uint64_t)v34);
      }
      uint64_t v31 = [a1 _migratePaths:v17 to:v19 error:v55];
      goto LABEL_13;
    }
    if (v32)
    {
      *(_DWORD *)buf = 138543618;
      id v57 = v12;
      __int16 v58 = 2114;
      id v59 = v14;
      _os_log_impl(&dword_1DD9AE000, v22, OS_LOG_TYPE_DEFAULT, "=mbfm= mg: Nothing to migrate from %{public}@ to %{public}@", buf, 0x16u);
      _MBLog(@"DEFAULT", (uint64_t)"=mbfm= mg: Nothing to migrate from %{public}@ to %{public}@", v48, v49, v50, v51, v52, v53, (uint64_t)v12);
    }
LABEL_18:

    uint64_t v41 = 1;
    goto LABEL_19;
  }
  if (!v18)
  {
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543618;
      id v57 = v12;
      __int16 v58 = 2114;
      id v59 = v14;
      _os_log_impl(&dword_1DD9AE000, v22, OS_LOG_TYPE_INFO, "=mbfm= mg: Nothing to migrate from %{public}@, already present in %{public}@", buf, 0x16u);
      _MBLog(@"INFO", (uint64_t)"=mbfm= mg: Nothing to migrate from %{public}@, already present in %{public}@", v42, v43, v44, v45, v46, v47, (uint64_t)v12);
    }
    goto LABEL_18;
  }
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v23 = [v13 componentsJoinedByString:@", "];
    *(_DWORD *)buf = 138543874;
    id v57 = v23;
    __int16 v58 = 2114;
    id v59 = v12;
    __int16 v60 = 2114;
    id v61 = v14;
    _os_log_impl(&dword_1DD9AE000, v22, OS_LOG_TYPE_DEFAULT, "=mbfm= mg: Cleaning up un-migrated (%{public}@) from %{public}@, already present in %{public}@", buf, 0x20u);

    uint64_t v24 = [v13 componentsJoinedByString:@", "];
    _MBLog(@"DEFAULT", (uint64_t)"=mbfm= mg: Cleaning up un-migrated (%{public}@) from %{public}@, already present in %{public}@", v25, v26, v27, v28, v29, v30, (uint64_t)v24);
  }
  uint64_t v31 = [a1 _removeAllPaths:v17 error:v55];
LABEL_13:
  uint64_t v41 = v31;
LABEL_19:

  return v41;
}

- (id)_pathsRootedAt:()MobileBackup subpaths:
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (!v5) {
    -[NSFileManager(MobileBackup) _pathsRootedAt:subpaths:]();
  }
  v7 = v6;
  if (!v6) {
    -[NSFileManager(MobileBackup) _pathsRootedAt:subpaths:]();
  }
  id v8 = [MEMORY[0x1E4F1CA48] array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = objc_msgSend(v5, "stringByAppendingPathComponent:", *(void *)(*((void *)&v16 + 1) + 8 * i), (void)v16);
        [v8 addObject:v14];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }

  return v8;
}

- (uint64_t)_anyPathExists:()MobileBackup
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        if (objc_msgSend(a1, "fileExistsAtPath:", *(void *)(*((void *)&v11 + 1) + 8 * v8), (void)v11))
        {
          uint64_t v9 = 1;
          goto LABEL_11;
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  uint64_t v9 = 0;
LABEL_11:

  return v9;
}

- (uint64_t)_removeAllPaths:()MobileBackup error:
{
  id v6 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __53__NSFileManager_MobileBackup___removeAllPaths_error___block_invoke;
  v10[3] = &unk_1E6D00F00;
  v10[4] = a1;
  id v11 = v6;
  id v7 = v6;
  uint64_t v8 = objc_msgSend(a1, "_perform:times:error:", v10, objc_msgSend(v7, "count", v10[0], 3221225472, __53__NSFileManager_MobileBackup___removeAllPaths_error___block_invoke, &unk_1E6D00F00, a1), a4);

  return v8;
}

- (uint64_t)_migratePaths:()MobileBackup to:error:
{
  id v8 = a3;
  id v9 = a4;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __54__NSFileManager_MobileBackup___migratePaths_to_error___block_invoke;
  v14[3] = &unk_1E6D00F28;
  v14[4] = a1;
  id v15 = v8;
  id v16 = v9;
  id v10 = v9;
  id v11 = v8;
  uint64_t v12 = objc_msgSend(a1, "_perform:times:error:", v14, objc_msgSend(v11, "count"), a5);

  return v12;
}

- (BOOL)_perform:()MobileBackup times:error:
{
  id v7 = a3;
  if (a4)
  {
    uint64_t v8 = 0;
    id v9 = 0;
    do
    {
      id v14 = 0;
      char v10 = v7[2](v7, v8, &v14);
      id v11 = v14;
      if ((v10 & 1) == 0 && +[MBError codeForNSError:v11] != 4)
      {
        if (!v9)
        {
          id v9 = [MEMORY[0x1E4F1CA48] array];
        }
        [v9 addObject:v11];
      }

      ++v8;
    }
    while (a4 != v8);
    BOOL v12 = v9 == 0;
    if (a5 && v9)
    {
      +[MBError errorWithErrors:v9];
      BOOL v12 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    id v9 = 0;
    BOOL v12 = 1;
  }

  return v12;
}

- (uint64_t)mb_savePlistAtPath:()MobileBackup addingItems:removing:error:
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  long long v13 = [MEMORY[0x1E4F1CA60] dictionaryWithContentsOfFile:v10];
  id v14 = v13;
  if (v13)
  {
    id v15 = v13;
  }
  else
  {
    id v15 = [MEMORY[0x1E4F1CA60] dictionary];
  }
  id v16 = v15;

  if (v11) {
    [v16 addEntriesFromDictionary:v11];
  }
  if (v12) {
    [v16 removeObjectsForKeys:v12];
  }
  long long v17 = MBGetDefaultLog();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v31 = v10;
    __int16 v32 = 2112;
    uint64_t v33 = v16;
    _os_log_impl(&dword_1DD9AE000, v17, OS_LOG_TYPE_DEFAULT, "=mbfm= Updating plist at %@ to %@", buf, 0x16u);
    _MBLog(@"DEFAULT", (uint64_t)"=mbfm= Updating plist at %@ to %@", v18, v19, v20, v21, v22, v23, (uint64_t)v10);
  }

  uint64_t v24 = [v10 stringByDeletingLastPathComponent];
  int v25 = [a1 createDirectoryAtPath:v24 withIntermediateDirectories:1 attributes:0 error:a6];

  if (v25)
  {
    uint64_t v26 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v16 format:200 options:0 error:a6];
    uint64_t v27 = v26;
    if (v26) {
      uint64_t v28 = [v26 writeToFile:v10 options:268435457 error:a6];
    }
    else {
      uint64_t v28 = 0;
    }
  }
  else
  {
    uint64_t v28 = 0;
  }

  return v28;
}

- (void)mb_moveToTmpDirThenRemoveItemAtPath:()MobileBackup error:.cold.1()
{
}

- (void)_tryMovingThenRemovingItemAtPath:()MobileBackup error:.cold.1()
{
}

- (void)_tryMovingThenRemovingItemAtPath:()MobileBackup error:.cold.2()
{
}

- (void)mb_moveAsideItemAtPath:()MobileBackup error:.cold.1()
{
}

- (void)mb_moveAsideAndMarkPurgeableDBFilesAtPath:()MobileBackup error:.cold.1()
{
}

- (void)mb_migrateIfNeededFromSource:()MobileBackup sourceSubPaths:toDestination:destinationSubPaths:error:.cold.1()
{
  __assert_rtn("-[NSFileManager(MobileBackup) mb_migrateIfNeededFromSource:sourceSubPaths:toDestination:destinationSubPaths:error:]", "NSFileManager+MobileBackup.m", 167, "sourceSubPaths.count == destinationSubPaths.count");
}

- (void)mb_migrateIfNeededFromSource:()MobileBackup sourceSubPaths:toDestination:destinationSubPaths:error:.cold.2()
{
}

- (void)mb_migrateIfNeededFromSource:()MobileBackup sourceSubPaths:toDestination:destinationSubPaths:error:.cold.3()
{
}

- (void)_pathsRootedAt:()MobileBackup subpaths:.cold.1()
{
}

- (void)_pathsRootedAt:()MobileBackup subpaths:.cold.2()
{
}

@end