@interface TRIReferenceManagedDir
+ ($A5A652246548B43F8BC05201A1C72A70)_acquireLockOnDir:(id)a3 withLockingMode:(int)a4 andRunBlock:(id)a5;
+ (BOOL)_deleteReferenceManagedDirectory:(id)a3 usingTempDir:(id)a4 managedDirWasDeleted:(BOOL *)a5;
+ (BOOL)_isTargetOfSymlink:(id)a3 containedInManagedDir:(id)a4;
+ (BOOL)_removePaths:(id)a3 withLockWitness:(TRIFlockWitness_ *)a4 numRemoved:(unsigned int *)a5;
+ (BOOL)_testDeletionEligibilityForManagedDir:(id)a3 withExternalReferenceStore:(id)a4 flockWitness:(TRIFlockWitness_ *)a5 logPrefix:(id)a6 isEligible:(BOOL *)a7;
+ (BOOL)collectDeferredDeletionItemsWithManagedDir:(id)a3;
+ (BOOL)collectGarbageForManagedDir:(id)a3 withExternalReferenceStore:(id)a4 usingTempDir:(id)a5 managedDirWasDeleted:(BOOL *)a6;
+ (BOOL)createFromDir:(id)a3;
+ (BOOL)isPathInManagedDir:(id)a3;
+ (BOOL)removeFileInManagedDirWithPath:(id)a3 inUseDeletionBehavior:(unsigned __int8)a4 wasDeleted:(BOOL *)a5;
+ (BOOL)saveFromGarbageCollectionItemWithPath:(id)a3;
+ (BOOL)symlinkFromCurrentPath:(id)a3 withFuturePath:(id)a4 toManagedPath:(id)a5;
+ (BOOL)symlinkFromPath:(id)a3 toManagedPath:(id)a4;
+ (id)_collectDeadSymlinksForManagedDir:(id)a3 withLockWitness:(TRIFlockWitness_ *)a4 liveSymlinkCount:(unsigned int *)a5;
+ (id)_containingManagedDirForPath:(id)a3 resolvedAbsPath:(id *)a4;
+ (id)_metadataDirForManagedDir:(id)a3;
+ (id)_reverseLinksDirForManagedDir:(id)a3;
@end

@implementation TRIReferenceManagedDir

+ (id)_metadataDirForManagedDir:(id)a3
{
  id v3 = a3;
  v4 = (void *)MEMORY[0x1E016E7F0]();
  v5 = [v3 stringByAppendingPathComponent:@"_refs"];

  return v5;
}

+ (id)_reverseLinksDirForManagedDir:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E016E7F0]();
  v6 = [a1 _metadataDirForManagedDir:v4];
  v7 = [v6 stringByAppendingPathComponent:@"revlinks"];

  return v7;
}

+ ($A5A652246548B43F8BC05201A1C72A70)_acquireLockOnDir:(id)a3 withLockingMode:(int)a4 andRunBlock:(id)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v8 = (void (**)(id, int *))a5;
  v9 = (void *)MEMORY[0x1E016E7F0]();
  id v10 = v7;
  int v11 = open((const char *)[v10 fileSystemRepresentation], 0);
  if (v11 < 0)
  {
    v14 = TRILogCategory_Server();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v19 = __error();
      v20 = strerror(*v19);
      int v21 = *__error();
      int v28 = 138543874;
      id v29 = v10;
      __int16 v30 = 2080;
      v31 = v20;
      __int16 v32 = 1024;
      int v33 = v21;
      _os_log_error_impl(&dword_1DA291000, v14, OS_LOG_TYPE_ERROR, "Failed to open lock dir %{public}@: %s (%d)", (uint8_t *)&v28, 0x1Cu);
    }

    v13.var0 = 2;
  }
  else
  {
    int v12 = v11;
    if (flock(v11, a4))
    {
      if (*__error() == 35)
      {
        v13.var0 = 1;
      }
      else
      {
        v17 = TRILogCategory_Server();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          v22 = __error();
          v23 = strerror(*v22);
          int v24 = *__error();
          int v28 = 138543874;
          id v29 = v10;
          __int16 v30 = 2080;
          v31 = v23;
          __int16 v32 = 1024;
          int v33 = v24;
          _os_log_error_impl(&dword_1DA291000, v17, OS_LOG_TYPE_ERROR, "Failed to acquire lock dir %{public}@: %s (%d)", (uint8_t *)&v28, 0x1Cu);
        }

        v13.var0 = 2;
      }
    }
    else
    {
      v15 = (void *)MEMORY[0x1E016E7F0]();
      int v28 = v12;
      v8[2](v8, &v28);
      if (flock(v12, 8))
      {
        v16 = TRILogCategory_Server();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          v25 = __error();
          v26 = strerror(*v25);
          int v27 = *__error();
          int v28 = 138543874;
          id v29 = v10;
          __int16 v30 = 2080;
          v31 = v26;
          __int16 v32 = 1024;
          int v33 = v27;
          _os_log_error_impl(&dword_1DA291000, v16, OS_LOG_TYPE_ERROR, "Failed to unlock lock dir %{public}@: %s (%d)", (uint8_t *)&v28, 0x1Cu);
        }
      }
      v13.var0 = 0;
    }
    close(v12);
  }

  return v13;
}

+ (id)_containingManagedDirForPath:(id)a3 resolvedAbsPath:(id *)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  bzero(v39, 0x400uLL);
  id v7 = v6;
  v8 = realpath_DARWIN_EXTSN((const char *)[v7 fileSystemRepresentation], (char *)v39);
  if (v8)
  {
    v9 = v8;
    if (a4)
    {
      id v10 = stringForUTF8Path((uint64_t)v8);
      id v11 = *a4;
      *a4 = v10;
    }
    while (1)
    {
      int v12 = stringForUTF8Path((uint64_t)v9);
      unsigned __int8 v26 = 0;
      $A5A652246548B43F8BC05201A1C72A70 v13 = [MEMORY[0x1E4F28CB8] defaultManager];
      v14 = [a1 _metadataDirForManagedDir:v12];
      int v15 = [v13 fileExistsAtPath:v14 isDirectory:&v26];
      int v16 = v26;

      if (v15 && v16 != 0) {
        break;
      }
      if (!dirname_r(v9, (char *)buf))
      {
        int v21 = TRILogCategory_Server();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          v23 = __error();
          int v24 = strerror(*v23);
          int v25 = *__error();
          *(_DWORD *)int v27 = 138543874;
          id v28 = v7;
          __int16 v29 = 2080;
          __int16 v30 = v24;
          __int16 v31 = 1024;
          int v32 = v25;
          _os_log_error_impl(&dword_1DA291000, v21, OS_LOG_TYPE_ERROR, "dirname_r() failure on upward-traversal of path \"%{public}@\": %s (%d)", v27, 0x1Cu);
        }

        goto LABEL_17;
      }
      v9 = (char *)v39;
      __strcpy_chk();

      if (v39[0] == 47) {
        goto LABEL_18;
      }
    }
  }
  else
  {
    int v12 = TRILogCategory_Server();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v18 = __error();
      v19 = strerror(*v18);
      int v20 = *__error();
      *(_DWORD *)buf = 138543874;
      id v34 = v7;
      __int16 v35 = 2080;
      v36 = v19;
      __int16 v37 = 1024;
      int v38 = v20;
      _os_log_error_impl(&dword_1DA291000, v12, OS_LOG_TYPE_ERROR, "Failed to resolve absolute path for possibly-managed path \"%{public}@\": %s (%d)", buf, 0x1Cu);
    }
LABEL_17:

LABEL_18:
    int v12 = 0;
  }

  return v12;
}

+ (BOOL)createFromDir:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v15 = 0;
  v5 = [a1 _containingManagedDirForPath:v4 resolvedAbsPath:&v15];
  if (v5)
  {
    id v6 = v5;
    LODWORD(a1) = [v5 isEqualToString:v15];
    id v7 = TRILogCategory_Server();
    v8 = v7;
    if (a1)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v17 = v6;
        _os_log_impl(&dword_1DA291000, v8, OS_LOG_TYPE_DEFAULT, "Reference-managed directory already exists at %{public}@", buf, 0xCu);
      }
    }
    else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v17 = v4;
      __int16 v18 = 2114;
      id v19 = v6;
      _os_log_error_impl(&dword_1DA291000, v8, OS_LOG_TYPE_ERROR, "Cannot create reference-managed directory \"%{public}@\" because it is nested in reference-managed directory: %{public}@", buf, 0x16u);
    }
  }
  else
  {

    v9 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v10 = [a1 _metadataDirForManagedDir:v4];
    id v14 = 0;
    LOBYTE(a1) = [v9 createDirectoryAtPath:v10 withIntermediateDirectories:0 attributes:0 error:&v14];
    id v11 = v14;

    if ((a1 & 1) == 0)
    {
      int v12 = TRILogCategory_Server();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        id v17 = v4;
        __int16 v18 = 2114;
        id v19 = v11;
        _os_log_error_impl(&dword_1DA291000, v12, OS_LOG_TYPE_ERROR, "Failed to create reference-managed directory from %{public}@: %{public}@", buf, 0x16u);
      }
    }
  }

  return (char)a1;
}

+ (BOOL)symlinkFromPath:(id)a3 toManagedPath:(id)a4
{
  return [a1 symlinkFromCurrentPath:a3 withFuturePath:a3 toManagedPath:a4];
}

+ (BOOL)symlinkFromCurrentPath:(id)a3 withFuturePath:(id)a4 toManagedPath:(id)a5
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
LABEL_52:
    __int16 v37 = [MEMORY[0x1E4F28B00] currentHandler];
    [v37 handleFailureInMethod:a2, a1, @"TRIReferenceManagedDir.m", 185, @"Invalid parameter not satisfying: %@", @"symlinkFuturePath" object file lineNumber description];

    if (v11) {
      goto LABEL_4;
    }
    goto LABEL_53;
  }
  v36 = [MEMORY[0x1E4F28B00] currentHandler];
  [v36 handleFailureInMethod:a2, a1, @"TRIReferenceManagedDir.m", 184, @"Invalid parameter not satisfying: %@", @"symlinkCurrentPath" object file lineNumber description];

  if (!v10) {
    goto LABEL_52;
  }
LABEL_3:
  if (v11) {
    goto LABEL_4;
  }
LABEL_53:
  int v38 = [MEMORY[0x1E4F28B00] currentHandler];
  [v38 handleFailureInMethod:a2, a1, @"TRIReferenceManagedDir.m", 186, @"Invalid parameter not satisfying: %@", @"managedPath" object file lineNumber description];

LABEL_4:
  if (![v9 length])
  {
    id v14 = TRILogCategory_Server();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v54 = "+[TRIReferenceManagedDir symlinkFromCurrentPath:withFuturePath:toManagedPath:]";
      _os_log_error_impl(&dword_1DA291000, v14, OS_LOG_TYPE_ERROR, "%s has empty path arg: symlinkCurrentPath", buf, 0xCu);
    }
    goto LABEL_23;
  }
  if (![v10 length])
  {
    id v14 = TRILogCategory_Server();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v54 = "+[TRIReferenceManagedDir symlinkFromCurrentPath:withFuturePath:toManagedPath:]";
      _os_log_error_impl(&dword_1DA291000, v14, OS_LOG_TYPE_ERROR, "%s has empty path arg: symlinkFuturePath", buf, 0xCu);
    }
    goto LABEL_23;
  }
  if (![v11 length])
  {
    id v14 = TRILogCategory_Server();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v54 = "+[TRIReferenceManagedDir symlinkFromCurrentPath:withFuturePath:toManagedPath:]";
      _os_log_error_impl(&dword_1DA291000, v14, OS_LOG_TYPE_ERROR, "%s has empty path arg: managedPath", buf, 0xCu);
    }
    goto LABEL_23;
  }
  if (([v10 isAbsolutePath] & 1) == 0)
  {
    id v14 = TRILogCategory_Server();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v54 = (const char *)v10;
      _os_log_error_impl(&dword_1DA291000, v14, OS_LOG_TYPE_ERROR, "symlinkFuturePath \"%{public}@\" is not absolute.", buf, 0xCu);
    }
    goto LABEL_23;
  }
  int v12 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v13 = [v12 fileExistsAtPath:v9];

  if (v13)
  {
    id v14 = TRILogCategory_Server();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v54 = (const char *)v9;
      _os_log_error_impl(&dword_1DA291000, v14, OS_LOG_TYPE_ERROR, "Unable to create symlink at \"%{public}@\": file already exists", buf, 0xCu);
    }
LABEL_23:

LABEL_24:
    char v15 = 0;
    goto LABEL_25;
  }
  bzero(buf, 0x400uLL);
  id v17 = [v9 stringByDeletingLastPathComponent];
  __int16 v18 = realpath_DARWIN_EXTSN((const char *)[v17 fileSystemRepresentation], (char *)buf);

  if (!v18)
  {
    unsigned __int8 v26 = TRILogCategory_Server();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      int v32 = __error();
      int v33 = strerror(*v32);
      int v34 = *__error();
      *(_DWORD *)v51 = 138543874;
      *(void *)&v51[4] = v9;
      *(_WORD *)&v51[12] = 2080;
      *(void *)&v51[14] = v33;
      *(_WORD *)&v51[22] = 1024;
      int v52 = v34;
      _os_log_error_impl(&dword_1DA291000, v26, OS_LOG_TYPE_ERROR, "Unable to resolve parent dir for \"%{public}@\": %s (%d)", v51, 0x1Cu);
    }

    goto LABEL_24;
  }
  id v19 = stringForUTF8Path((uint64_t)v18);
  uint64_t v20 = [v9 lastPathComponent];
  int v21 = [v19 stringByAppendingPathComponent:v20];

  if (!v21)
  {
    v43 = [MEMORY[0x1E4F28B00] currentHandler];
    [v43 handleFailureInMethod:a2, a1, @"TRIReferenceManagedDir.m", 219, @"Invalid parameter not satisfying: %@", @"absSymlinkCurrentPath" object file lineNumber description];
  }
  id v50 = 0;
  v22 = [a1 _containingManagedDirForPath:v11 resolvedAbsPath:&v50];
  if (v22)
  {
    if (!v50)
    {
      v44 = [MEMORY[0x1E4F28B00] currentHandler];
      [v44 handleFailureInMethod:a2, a1, @"TRIReferenceManagedDir.m", 228, @"Invalid parameter not satisfying: %@", @"absLinkTarget" object file lineNumber description];
    }
    *(void *)v51 = 0;
    *(void *)&v51[8] = v51;
    *(void *)&v51[16] = 0x2020000000;
    LOBYTE(v52) = 1;
    v23 = [a1 _metadataDirForManagedDir:v22];
    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    v45[2] = __78__TRIReferenceManagedDir_symlinkFromCurrentPath_withFuturePath_toManagedPath___block_invoke;
    v45[3] = &unk_1E6BBD310;
    id v49 = a1;
    id v24 = v22;
    id v46 = v24;
    id v47 = v10;
    v48 = v51;
    char v25 = [a1 _acquireLockOnDir:v23 withLockingMode:2 andRunBlock:v45];

    if (v25 || !*(unsigned char *)(*(void *)&v51[8] + 24))
    {
      char v15 = 0;
    }
    else
    {
      id v28 = (const char *)[v50 fileSystemRepresentation];
      __int16 v29 = v21;
      if (symlink(v28, (const char *)[v29 fileSystemRepresentation]))
      {
        __int16 v30 = TRILogCategory_Server();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          id v39 = v50;
          uint64_t v40 = __error();
          v41 = strerror(*v40);
          int v42 = *__error();
          *(_DWORD *)buf = 138544130;
          v54 = v29;
          __int16 v55 = 2114;
          id v56 = v39;
          __int16 v57 = 2080;
          v58 = v41;
          __int16 v59 = 1024;
          int v60 = v42;
          _os_log_error_impl(&dword_1DA291000, v30, OS_LOG_TYPE_ERROR, "Failed to create symlink %{public}@ --> %{public}@: %s (%d)", buf, 0x26u);
        }
        char v15 = 0;
      }
      else
      {
        __int16 v31 = [MEMORY[0x1E4F28CB8] defaultManager];
        __int16 v30 = [v31 triPath:v11 relativeToParentPath:v24];

        if ([v30 isEqualToString:@"."])
        {
          char v15 = 1;
        }
        else
        {
          id v35 = [[TRIDeferredDeleter alloc] initForRootDir:v24];
          char v15 = [v35 unmarkItemAtRelativePath:v30];
        }
      }
    }
    _Block_object_dispose(v51, 8);
  }
  else
  {
    int v27 = TRILogCategory_Server();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v54 = (const char *)v11;
      _os_log_error_impl(&dword_1DA291000, v27, OS_LOG_TYPE_ERROR, "Attempting to symlink to a non-managed path: %{public}@", buf, 0xCu);
    }

    char v15 = 0;
  }

LABEL_25:
  return v15;
}

void __78__TRIReferenceManagedDir_symlinkFromCurrentPath_withFuturePath_toManagedPath___block_invoke(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v3 = [*(id *)(a1 + 56) _reverseLinksDirForManagedDir:*(void *)(a1 + 32)];
  id v21 = 0;
  char v4 = [v2 createDirectoryAtPath:v3 withIntermediateDirectories:1 attributes:0 error:&v21];
  id v5 = v21;

  if ((v4 & 1) == 0)
  {
    id v6 = TRILogCategory_Server();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v23 = v5;
      _os_log_error_impl(&dword_1DA291000, v6, OS_LOG_TYPE_ERROR, "Failed to create reverse link dir: %{public}@", buf, 0xCu);
    }
  }
  id v7 = (void *)MEMORY[0x1E016E7F0]();
  v8 = [*(id *)(a1 + 56) _reverseLinksDirForManagedDir:*(void *)(a1 + 32)];
  id v9 = [NSString alloc];
  id v10 = objc_opt_new();
  id v11 = [v10 UUIDString];
  int v12 = (void *)[v9 initWithFormat:@"link-%@", v11];
  int v13 = [v8 stringByAppendingPathComponent:v12];

  id v14 = (const char *)[*(id *)(a1 + 40) fileSystemRepresentation];
  id v15 = v13;
  if (symlink(v14, (const char *)[v15 fileSystemRepresentation]))
  {
    int v16 = TRILogCategory_Server();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = *(void *)(a1 + 40);
      __int16 v18 = __error();
      id v19 = strerror(*v18);
      int v20 = *__error();
      *(_DWORD *)buf = 138544130;
      id v23 = v15;
      __int16 v24 = 2114;
      uint64_t v25 = v17;
      __int16 v26 = 2080;
      int v27 = v19;
      __int16 v28 = 1024;
      int v29 = v20;
      _os_log_error_impl(&dword_1DA291000, v16, OS_LOG_TYPE_ERROR, "Failed to create symlink %{public}@ --> %{public}@: %s (%d)", buf, 0x26u);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
  }
}

+ (BOOL)_isTargetOfSymlink:(id)a3 containedInManagedDir:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = (void *)MEMORY[0x1E016E7F0]();
  bzero(v38, 0x400uLL);
  *__error() = 0;
  id v10 = v7;
  unint64_t v11 = readlink((const char *)[v10 fileSystemRepresentation], v38, 0x400uLL);
  if ((v11 & 0x8000000000000000) != 0)
  {
    if (*__error() == 2)
    {
      int v16 = 0;
LABEL_20:
      char v20 = 0;
      goto LABEL_21;
    }
    int v12 = TRILogCategory_Server();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      goto LABEL_16;
    }
    __int16 v24 = __error();
    uint64_t v25 = strerror(*v24);
    int v26 = *__error();
    *(_DWORD *)buf = 138543874;
    id v33 = v10;
    __int16 v34 = 2080;
    id v35 = v25;
    __int16 v36 = 1024;
    int v37 = v26;
    int v13 = "Failed to resolve symlink \"%{public}@\": %s (%d)";
    id v14 = v12;
    uint32_t v15 = 28;
    goto LABEL_28;
  }
  if (v11 >= 0x400)
  {
    int v12 = TRILogCategory_Server();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
LABEL_16:
      int v16 = 0;
LABEL_19:

      goto LABEL_20;
    }
    *(_DWORD *)buf = 138543362;
    id v33 = v10;
    int v13 = "Target of symlink \"%{public}@\" exceeds maximum length.";
    id v14 = v12;
    uint32_t v15 = 12;
LABEL_28:
    _os_log_error_impl(&dword_1DA291000, v14, OS_LOG_TYPE_ERROR, v13, buf, v15);
    goto LABEL_16;
  }
  v38[v11] = 0;
  stringForUTF8Path((uint64_t)v38);
  int v16 = (char *)objc_claimAutoreleasedReturnValue();
  if (([v16 hasPrefix:@"/"] & 1) == 0)
  {
    int v12 = TRILogCategory_Server();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v33 = v10;
      __int16 v34 = 2114;
      id v35 = v16;
      _os_log_error_impl(&dword_1DA291000, v12, OS_LOG_TYPE_ERROR, "Symlink into managed directory is expected to be absolute: %{public}@ --> %{public}@", buf, 0x16u);
    }
    goto LABEL_19;
  }
  if (!v16)
  {
    uint64_t v30 = [MEMORY[0x1E4F28B00] currentHandler];
    [v30 handleFailureInMethod:a2, a1, @"TRIReferenceManagedDir.m", 314, @"Invalid parameter not satisfying: %@", @"absLinkTarget" object file lineNumber description];
  }
  bzero(v38, 0x400uLL);
  id v17 = v8;
  __int16 v18 = realpath_DARWIN_EXTSN((const char *)[v17 fileSystemRepresentation], v38);
  if (v18)
  {
    id v19 = stringForUTF8Path((uint64_t)v18);
    if (!v19)
    {
      __int16 v31 = [MEMORY[0x1E4F28B00] currentHandler];
      [v31 handleFailureInMethod:a2, a1, @"TRIReferenceManagedDir.m", 329, @"Invalid parameter not satisfying: %@", @"absManagedDir" object file lineNumber description];
    }
    if ([v16 isEqualToString:v19])
    {
      char v20 = 1;
    }
    else
    {
      uint64_t v23 = [v19 stringByAppendingString:@"/"];

      char v20 = [v16 hasPrefix:v23];
      id v19 = (void *)v23;
    }
  }
  else
  {
    v22 = TRILogCategory_Server();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      int v27 = __error();
      __int16 v28 = strerror(*v27);
      int v29 = *__error();
      *(_DWORD *)buf = 138543874;
      id v33 = v17;
      __int16 v34 = 2080;
      id v35 = v28;
      __int16 v36 = 1024;
      int v37 = v29;
      _os_log_error_impl(&dword_1DA291000, v22, OS_LOG_TYPE_ERROR, "Failed to canonicalize reference-managed directory \"%{public}@\": %s (%d)", buf, 0x1Cu);
    }

    id v19 = 0;
    char v20 = 0;
  }

LABEL_21:

  return v20;
}

+ (id)_collectDeadSymlinksForManagedDir:(id)a3 withLockWitness:(TRIFlockWitness_ *)a4 liveSymlinkCount:(unsigned int *)a5
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = (void *)MEMORY[0x1E016E7F0]();
  *a5 = 0;
  id v10 = objc_opt_new();
  if (!v10)
  {
    id v31 = 0;
    goto LABEL_22;
  }
  SEL v34 = a2;
  unint64_t v11 = (void *)MEMORY[0x1E4F1CB10];
  int v12 = [a1 _reverseLinksDirForManagedDir:v8];
  uint64_t v13 = [v11 fileURLWithPath:v12 isDirectory:1];

  id v14 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v35 = (void *)v13;
  uint32_t v15 = [v14 enumeratorAtURL:v13 includingPropertiesForKeys:0 options:1 errorHandler:0];

  int v16 = (void *)MEMORY[0x1E016E7F0]();
  uint64_t v17 = [v15 nextObject];
  if (!v17)
  {
LABEL_19:
    id v31 = v10;
    goto LABEL_20;
  }
  __int16 v18 = (void *)v17;
  while (1)
  {
    ++*a5;
    id v19 = [v18 path];
    if (!v19)
    {
      uint64_t v30 = [MEMORY[0x1E4F28B00] currentHandler];
      [v30 handleFailureInMethod:v34, a1, @"TRIReferenceManagedDir.m", 372, @"Invalid parameter not satisfying: %@", @"reverseLinkPath" object file lineNumber description];
    }
    bzero(v42, 0x400uLL);
    id v20 = v19;
    unint64_t v21 = readlink((const char *)[v20 fileSystemRepresentation], v42, 0x400uLL);
    if ((v21 & 0x8000000000000000) == 0) {
      break;
    }
    v22 = TRILogCategory_Server();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      int v27 = __error();
      id v33 = v9;
      __int16 v28 = strerror(*v27);
      int v29 = *__error();
      *(_DWORD *)buf = 138543874;
      id v37 = v20;
      __int16 v38 = 2080;
      uint64_t v39 = v28;
      id v9 = v33;
      __int16 v40 = 1024;
      int v41 = v29;
      uint64_t v23 = v22;
      __int16 v24 = "Failed to resolve reverse-link \"%{public}@\": %s (%d)";
      uint32_t v25 = 28;
      goto LABEL_18;
    }
LABEL_11:

    int v26 = 0;
LABEL_12:

    int v16 = (void *)MEMORY[0x1E016E7F0]();
    __int16 v18 = [v15 nextObject];
    if (!v18) {
      goto LABEL_19;
    }
  }
  if (v21 >= 0x400)
  {
    v22 = TRILogCategory_Server();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v37 = v20;
      uint64_t v23 = v22;
      __int16 v24 = "Target of reverse-link \"%{public}@\" exceeds max path length.";
      uint32_t v25 = 12;
LABEL_18:
      _os_log_error_impl(&dword_1DA291000, v23, OS_LOG_TYPE_ERROR, v24, buf, v25);
      goto LABEL_11;
    }
    goto LABEL_11;
  }
  v42[v21] = 0;
  int v26 = stringForUTF8Path((uint64_t)v42);
  if ([a1 _isTargetOfSymlink:v26 containedInManagedDir:v8]) {
    goto LABEL_12;
  }
  if ([v10 addString:v20])
  {
    --*a5;
    goto LABEL_12;
  }

  id v31 = 0;
LABEL_20:

LABEL_22:

  return v31;
}

+ (BOOL)_removePaths:(id)a3 withLockWitness:(TRIFlockWitness_ *)a4 numRemoved:(unsigned int *)a5
{
  id v6 = a3;
  id v7 = v6;
  if (a5) {
    *a5 = 0;
  }
  uint64_t v11 = 0;
  int v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 1;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __66__TRIReferenceManagedDir__removePaths_withLockWitness_numRemoved___block_invoke;
  v10[3] = &unk_1E6BBD338;
  v10[4] = &v11;
  v10[5] = a5;
  if ([v6 enumerateStringsWithBlock:v10]) {
    BOOL v8 = *((unsigned char *)v12 + 24) != 0;
  }
  else {
    BOOL v8 = 0;
  }
  _Block_object_dispose(&v11, 8);

  return v8;
}

void __66__TRIReferenceManagedDir__removePaths_withLockWitness_numRemoved___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([v3 length])
  {
    id v4 = v3;
    if (unlink((const char *)[v4 fileSystemRepresentation]))
    {
      id v5 = TRILogCategory_Server();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        id v7 = __error();
        BOOL v8 = strerror(*v7);
        int v9 = *__error();
        int v10 = 138543874;
        id v11 = v4;
        __int16 v12 = 2080;
        uint64_t v13 = v8;
        __int16 v14 = 1024;
        int v15 = v9;
        _os_log_error_impl(&dword_1DA291000, v5, OS_LOG_TYPE_ERROR, "Failed to unlink %{public}@: %s (%d)", (uint8_t *)&v10, 0x1Cu);
      }

      *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
    }
    else
    {
      id v6 = *(_DWORD **)(a1 + 40);
      if (v6) {
        ++*v6;
      }
    }
  }
}

+ (BOOL)_deleteReferenceManagedDirectory:(id)a3 usingTempDir:(id)a4 managedDirWasDeleted:(BOOL *)a5
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  int v9 = (void *)MEMORY[0x1E016E7F0]();
  int v10 = TRILogCategory_Server();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v50 = v7;
    _os_log_impl(&dword_1DA291000, v10, OS_LOG_TYPE_DEFAULT, "GC is deleting reference-managed directory: %{public}@", buf, 0xCu);
  }

  id v11 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v48 = 0;
  char v12 = [v11 triRemoveCachedANEBinariesForModelsFromPath:v7 error:&v48];
  uint64_t v13 = v48;
  if ((v12 & 1) == 0)
  {
    __int16 v14 = TRILogCategory_Server();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v50 = v13;
      _os_log_error_impl(&dword_1DA291000, v14, OS_LOG_TYPE_ERROR, "Failed to purge ANE cache during GC: %{public}@", buf, 0xCu);
    }
  }
  v45 = v8;
  if (v8)
  {
    int v15 = v11;
    uint64_t v16 = a5;
    uint64_t v17 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v47 = 0;
    char v18 = [v17 createDirectoryAtPath:v8 withIntermediateDirectories:1 attributes:0 error:&v47];
    id v19 = v47;

    if ((v18 & 1) == 0)
    {
      id v20 = TRILogCategory_Server();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v50 = v19;
        _os_log_error_impl(&dword_1DA291000, v20, OS_LOG_TYPE_ERROR, "Failed to create local temp directory: %{public}@", buf, 0xCu);
      }
    }
    id v21 = [NSString alloc];
    v22 = objc_opt_new();
    [v22 UUIDString];
    uint64_t v23 = v13;
    v25 = __int16 v24 = v9;
    int v26 = (void *)[v21 initWithFormat:@"delete-%@", v25];
    int v27 = [v45 stringByAppendingPathComponent:v26];

    int v9 = v24;
    uint64_t v13 = v23;
    a5 = v16;
    id v11 = v15;
  }
  else
  {
    id v28 = [NSString alloc];
    id v19 = objc_opt_new();
    v22 = [v19 UUIDString];
    int v27 = (void *)[v28 initWithFormat:@"%@-delete-%@", v7, v22];
  }

  int v29 = v7;
  uint64_t v30 = (const std::__fs::filesystem::path *)[v29 fileSystemRepresentation];
  id v31 = v27;
  int v32 = (const std::__fs::filesystem::path *)[v31 fileSystemRepresentation];
  rename(v30, v32, v33);
  if (v34)
  {
    id v35 = TRILogCategory_Server();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      int v42 = __error();
      uint64_t v43 = strerror(*v42);
      int v44 = *__error();
      *(_DWORD *)buf = 138544130;
      id v50 = v29;
      __int16 v51 = 2114;
      id v52 = v31;
      __int16 v53 = 2080;
      v54 = v43;
      __int16 v55 = 1024;
      int v56 = v44;
      _os_log_error_impl(&dword_1DA291000, v35, OS_LOG_TYPE_ERROR, "Failed to rename %{public}@ --> %{public}@: %s (%d)", buf, 0x26u);
    }
    BOOL v36 = 0;
    goto LABEL_22;
  }
  if (a5) {
    *a5 = 1;
  }
  id v37 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v46 = 0;
  char v38 = [v37 triForceRemoveItemAtPath:v31 error:&v46];
  id v35 = v46;

  if (v38)
  {
    BOOL v36 = 1;
LABEL_22:
    uint64_t v39 = v45;
    goto LABEL_23;
  }
  int v41 = TRILogCategory_Server();
  uint64_t v39 = v45;
  if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    id v50 = v35;
    _os_log_error_impl(&dword_1DA291000, v41, OS_LOG_TYPE_ERROR, "Failed to remove GC'd reference-managed directory: %{public}@", buf, 0xCu);
  }

  BOOL v36 = 0;
LABEL_23:

  return v36;
}

+ (BOOL)_testDeletionEligibilityForManagedDir:(id)a3 withExternalReferenceStore:(id)a4 flockWitness:(TRIFlockWitness_ *)a5 logPrefix:(id)a6 isEligible:(BOOL *)a7
{
  *(void *)&v34[13] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  LOBYTE(v30) = 0;
  int v15 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v16 = [a1 _metadataDirForManagedDir:v12];
  int v17 = [v15 fileExistsAtPath:v16 isDirectory:&v30];

  if (v17) {
    BOOL v18 = v30 == 0;
  }
  else {
    BOOL v18 = 1;
  }
  if (v18)
  {
    id v19 = TRILogCategory_Server();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v32 = v14;
      __int16 v33 = 2114;
      *(void *)int v34 = v12;
      _os_log_error_impl(&dword_1DA291000, v19, OS_LOG_TYPE_ERROR, "%{public}@Attempted to garbage-collect directory which is not reference-managed: %{public}@", buf, 0x16u);
    }

    goto LABEL_21;
  }
  int v30 = 0;
  uint64_t v20 = [a1 _collectDeadSymlinksForManagedDir:v12 withLockWitness:a5 liveSymlinkCount:&v30];
  if (!v20)
  {
LABEL_21:
    BOOL v26 = 0;
    goto LABEL_22;
  }
  id v21 = (void *)v20;
  v22 = TRILogCategory_Server();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    id v32 = v14;
    __int16 v33 = 1024;
    *(_DWORD *)int v34 = v30;
    v34[2] = 2114;
    *(void *)&v34[3] = v12;
    _os_log_impl(&dword_1DA291000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@GC scan found %u live symlinks into reference-managed directory: %{public}@", buf, 0x1Cu);
  }

  int v29 = 0;
  if (![a1 _removePaths:v21 withLockWitness:a5 numRemoved:&v29])
  {

    goto LABEL_21;
  }
  uint64_t v23 = TRILogCategory_Server();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    id v32 = v14;
    __int16 v33 = 1024;
    *(_DWORD *)int v34 = v29;
    v34[2] = 2114;
    *(void *)&v34[3] = v12;
    _os_log_impl(&dword_1DA291000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@Removed %u dead symlinks from reference-managed directory: %{public}@", buf, 0x1Cu);
  }

  if (v13 && [v13 hasReferenceToPath:v12])
  {
    __int16 v24 = TRILogCategory_Server();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v32 = v14;
      __int16 v33 = 2114;
      *(void *)int v34 = v12;
      _os_log_impl(&dword_1DA291000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@GC scan found a nonzero external reference count for reference-managed directory: %{public}@", buf, 0x16u);
    }
    char v25 = 0;
  }
  else
  {
    __int16 v24 = TRILogCategory_Server();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v32 = v14;
      __int16 v33 = 2114;
      *(void *)int v34 = v12;
      _os_log_impl(&dword_1DA291000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@GC scan found no external references for reference-managed directory: %{public}@", buf, 0x16u);
    }
    char v25 = 1;
  }

  if (v30) {
    BOOL v28 = 0;
  }
  else {
    BOOL v28 = v25;
  }
  *a7 = v28;
  BOOL v26 = 1;
LABEL_22:

  return v26;
}

+ (BOOL)collectGarbageForManagedDir:(id)a3 withExternalReferenceStore:(id)a4 usingTempDir:(id)a5 managedDirWasDeleted:(BOOL *)a6
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  if (!v11)
  {
    __int16 v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2, a1, @"TRIReferenceManagedDir.m", 543, @"Invalid parameter not satisfying: %@", @"managedDir" object file lineNumber description];
  }
  if ([v11 length])
  {
    if (!v13 || [v13 length])
    {
      *(void *)&long long v45 = 0;
      *((void *)&v45 + 1) = &v45;
      uint64_t v46 = 0x2020000000;
      char v47 = 1;
      if (a6) {
        *a6 = 0;
      }
      uint64_t v39 = 0;
      __int16 v40 = &v39;
      uint64_t v41 = 0x2020000000;
      char v42 = 0;
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = __115__TRIReferenceManagedDir_collectGarbageForManagedDir_withExternalReferenceStore_usingTempDir_managedDirWasDeleted___block_invoke;
      v33[3] = &unk_1E6BBD360;
      BOOL v36 = &v45;
      id v38 = a1;
      id v14 = v11;
      int v34 = v14;
      id v15 = v12;
      id v35 = v15;
      id v37 = &v39;
      int v16 = [a1 _acquireLockOnDir:v14 withLockingMode:5 andRunBlock:v33];
      if (v16 != 1)
      {
        if (v16 == 2 || !*(unsigned char *)(*((void *)&v45 + 1) + 24))
        {
          BOOL v20 = 0;
        }
        else
        {
          if (*((unsigned char *)v40 + 24))
          {
            v25[0] = MEMORY[0x1E4F143A8];
            v25[1] = 3221225472;
            v25[2] = __115__TRIReferenceManagedDir_collectGarbageForManagedDir_withExternalReferenceStore_usingTempDir_managedDirWasDeleted___block_invoke_61;
            v25[3] = &unk_1E6BBD388;
            int v29 = &v39;
            int v30 = &v45;
            id v31 = a1;
            int v17 = v14;
            BOOL v26 = v17;
            id v27 = v15;
            id v28 = v13;
            id v32 = a6;
            int v18 = [a1 _acquireLockOnDir:v17 withLockingMode:6 andRunBlock:v25];
            if (v18 == 2)
            {
              BOOL v20 = 0;
            }
            else
            {
              if (v18 == 1)
              {
                id v19 = TRILogCategory_Server();
                if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138543362;
                  int v44 = v17;
                  _os_log_impl(&dword_1DA291000, v19, OS_LOG_TYPE_DEFAULT, "[LOCK_EX] GC scan found active usage of reference-managed directory: %{public}@", buf, 0xCu);
                }
              }
              BOOL v20 = *(unsigned char *)(*((void *)&v45 + 1) + 24) != 0;
            }

            v22 = v26;
LABEL_31:

            goto LABEL_32;
          }
          BOOL v20 = 1;
        }
LABEL_32:

        _Block_object_dispose(&v39, 8);
        _Block_object_dispose(&v45, 8);
        goto LABEL_33;
      }
      v22 = TRILogCategory_Server();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        int v44 = v14;
        _os_log_impl(&dword_1DA291000, v22, OS_LOG_TYPE_DEFAULT, "[LOCK_SH] GC scan found active usage of reference-managed directory: %{public}@", buf, 0xCu);
      }
      BOOL v20 = 1;
      goto LABEL_31;
    }
    id v21 = TRILogCategory_Server();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      LODWORD(v45) = 136315138;
      *(void *)((char *)&v45 + 4) = "+[TRIReferenceManagedDir collectGarbageForManagedDir:withExternalReferenceStore:us"
                                      "ingTempDir:managedDirWasDeleted:]";
      _os_log_error_impl(&dword_1DA291000, v21, OS_LOG_TYPE_ERROR, "%s has empty path arg: tempDir", (uint8_t *)&v45, 0xCu);
    }
  }
  else
  {
    id v21 = TRILogCategory_Server();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      LODWORD(v45) = 136315138;
      *(void *)((char *)&v45 + 4) = "+[TRIReferenceManagedDir collectGarbageForManagedDir:withExternalReferenceStore:us"
                                      "ingTempDir:managedDirWasDeleted:]";
      _os_log_error_impl(&dword_1DA291000, v21, OS_LOG_TYPE_ERROR, "%s has empty path arg: managedDir", (uint8_t *)&v45, 0xCu);
    }
  }

  BOOL v20 = 0;
LABEL_33:

  return v20;
}

void __115__TRIReferenceManagedDir_collectGarbageForManagedDir_withExternalReferenceStore_usingTempDir_managedDirWasDeleted___block_invoke(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(a1 + 64) _testDeletionEligibilityForManagedDir:*(void *)(a1 + 32) withExternalReferenceStore:*(void *)(a1 + 40) flockWitness:a2 logPrefix:@"[LOCK_SH] " isEligible:*(void *)(*(void *)(a1 + 56) + 8) + 24];
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)
    && !*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    id v4 = [[TRIDeferredDeleter alloc] initForRootDir:*(void *)(a1 + 32)];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v4 collectGarbageWithRootDirLockWitness:a2 externalReferenceStore:*(void *)(a1 + 40)];
  }
}

uint64_t __115__TRIReferenceManagedDir_collectGarbageForManagedDir_withExternalReferenceStore_usingTempDir_managedDirWasDeleted___block_invoke_61(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
  uint64_t result = [*(id *)(a1 + 72) _testDeletionEligibilityForManagedDir:*(void *)(a1 + 32) withExternalReferenceStore:*(void *)(a1 + 40) flockWitness:a2 logPrefix:@"[LOCK_EX] " isEligible:*(void *)(*(void *)(a1 + 56) + 8) + 24];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = result;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
  {
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
    {
      uint64_t result = [*(id *)(a1 + 72) _deleteReferenceManagedDirectory:*(void *)(a1 + 32) usingTempDir:*(void *)(a1 + 48) managedDirWasDeleted:*(void *)(a1 + 80)];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = result;
    }
  }
  return result;
}

+ (BOOL)collectDeferredDeletionItemsWithManagedDir:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, a1, @"TRIReferenceManagedDir.m", 634, @"Invalid parameter not satisfying: %@", @"managedDir" object file lineNumber description];
  }
  uint64_t v15 = 0;
  int v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 1;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __69__TRIReferenceManagedDir_collectDeferredDeletionItemsWithManagedDir___block_invoke;
  v12[3] = &unk_1E6BBD3B0;
  id v6 = v5;
  id v13 = v6;
  id v14 = &v15;
  int v7 = [a1 _acquireLockOnDir:v6 withLockingMode:5 andRunBlock:v12];
  if (v7 == 1)
  {
    int v9 = TRILogCategory_Server();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v20 = v6;
      _os_log_impl(&dword_1DA291000, v9, OS_LOG_TYPE_DEFAULT, "[LOCK_SH] GC scan found active usage of reference-managed directory: %{public}@", buf, 0xCu);
    }

    BOOL v8 = 1;
  }
  else
  {
    BOOL v8 = v7 != 2 && *((unsigned char *)v16 + 24) != 0;
  }

  _Block_object_dispose(&v15, 8);
  return v8;
}

void __69__TRIReferenceManagedDir_collectDeferredDeletionItemsWithManagedDir___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = [[TRIDeferredDeleter alloc] initForRootDir:*(void *)(a1 + 32)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v4 collectGarbageWithRootDirLockWitness:a2 externalReferenceStore:0];
}

+ (BOOL)isPathInManagedDir:(id)a3
{
  id v3 = [a1 _containingManagedDirForPath:a3 resolvedAbsPath:0];
  BOOL v4 = v3 != 0;

  return v4;
}

+ (BOOL)removeFileInManagedDirWithPath:(id)a3 inUseDeletionBehavior:(unsigned __int8)a4 wasDeleted:(BOOL *)a5
{
  int v6 = a4;
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  int v10 = (void *)MEMORY[0x1E016E7F0]();
  *a5 = 0;
  if (!v9)
  {
    int v29 = [MEMORY[0x1E4F28B00] currentHandler];
    [v29 handleFailureInMethod:a2, a1, @"TRIReferenceManagedDir.m", 669, @"Invalid parameter not satisfying: %@", @"pathToRemove" object file lineNumber description];
  }
  if ([v9 length])
  {
    *(void *)&long long v37 = 0;
    *((void *)&v37 + 1) = &v37;
    uint64_t v38 = 0x2020000000;
    char v39 = 0;
    id v11 = [(id)objc_opt_class() _containingManagedDirForPath:v9 resolvedAbsPath:0];
    if (v11)
    {
      id v12 = [MEMORY[0x1E4F28CB8] defaultManager];
      id v13 = [v12 triPath:v9 relativeToParentPath:v11];

      if (![v13 isEqualToString:@"."])
      {
        char v18 = [MEMORY[0x1E4F28CB8] defaultManager];
        char v19 = [v18 fileExistsAtPath:v9];

        if (v19)
        {
          if (v6 == 3)
          {
            id v20 = [MEMORY[0x1E4F28CB8] defaultManager];
            id v34 = 0;
            char v16 = [v20 triForceRemoveItemAtPath:v9 error:&v34];
            id v21 = v34;

            if (v16)
            {
              v22 = TRILogCategory_Server();
              if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                id v36 = v9;
                _os_log_impl(&dword_1DA291000, v22, OS_LOG_TYPE_DEFAULT, "Successfully removed asset immediately: %@", buf, 0xCu);
              }

              *a5 = 1;
            }
            else
            {
              id v28 = TRILogCategory_Server();
              if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                id v36 = v21;
                _os_log_error_impl(&dword_1DA291000, v28, OS_LOG_TYPE_ERROR, "Failed to remove path: %@", buf, 0xCu);
              }
            }
          }
          else
          {
            v30[0] = MEMORY[0x1E4F143A8];
            v30[1] = 3221225472;
            v30[2] = __90__TRIReferenceManagedDir_removeFileInManagedDirWithPath_inUseDeletionBehavior_wasDeleted___block_invoke;
            v30[3] = &unk_1E6BBD3D8;
            id v23 = v9;
            id v31 = v23;
            id v32 = &v37;
            __int16 v33 = a5;
            if ([a1 _acquireLockOnDir:v11 withLockingMode:6 andRunBlock:v30] == 1)
            {
              __int16 v24 = TRILogCategory_Server();
              if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543362;
                id v36 = v11;
                _os_log_impl(&dword_1DA291000, v24, OS_LOG_TYPE_DEFAULT, "File removal attempt found active usage of reference-managed directory: %{public}@", buf, 0xCu);
              }

              if (v6 == 1)
              {
                char v25 = TRILogCategory_Server();
                if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138543362;
                  id v36 = v23;
                  _os_log_impl(&dword_1DA291000, v25, OS_LOG_TYPE_DEFAULT, "Marking file %{public}@ for deferred deletion", buf, 0xCu);
                }

                id v26 = [[TRIDeferredDeleter alloc] initForRootDir:v11];
                char v27 = [v26 markItemAtRelativePath:v13];
                *(unsigned char *)(*((void *)&v37 + 1) + 24) = v27;
              }
              else
              {
                *(unsigned char *)(*((void *)&v37 + 1) + 24) = 1;
              }
            }
            char v16 = *(unsigned char *)(*((void *)&v37 + 1) + 24) != 0;
          }
        }
        else
        {
          char v16 = 1;
          *a5 = 1;
        }
        goto LABEL_15;
      }
      id v14 = TRILogCategory_Server();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v36 = v11;
        _os_log_error_impl(&dword_1DA291000, v14, OS_LOG_TYPE_ERROR, "Managed directory file found to be same as root managed directory: %{public}@", buf, 0xCu);
      }
    }
    else
    {
      id v13 = TRILogCategory_Server();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v36 = v9;
        _os_log_error_impl(&dword_1DA291000, v13, OS_LOG_TYPE_ERROR, "Managed directory file at path %{public}@ was not found inside a valid managed directory", buf, 0xCu);
      }
    }
    char v16 = 0;
LABEL_15:

    _Block_object_dispose(&v37, 8);
    goto LABEL_16;
  }
  uint64_t v15 = TRILogCategory_Server();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    LODWORD(v37) = 136315138;
    *(void *)((char *)&v37 + 4) = "+[TRIReferenceManagedDir removeFileInManagedDirWithPath:inUseDeletionBehavior:wasDeleted:]";
    _os_log_error_impl(&dword_1DA291000, v15, OS_LOG_TYPE_ERROR, "%s has empty path arg: pathToRemove", (uint8_t *)&v37, 0xCu);
  }

  char v16 = 0;
LABEL_16:

  return v16;
}

void __90__TRIReferenceManagedDir_removeFileInManagedDirWithPath_inUseDeletionBehavior_wasDeleted___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v3 = *(void *)(a1 + 32);
  id v7 = 0;
  char v4 = [v2 triForceRemoveItemAtPath:v3 error:&v7];
  id v5 = v7;

  if (v4)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    **(unsigned char **)(a1 + 48) = 1;
  }
  else
  {
    int v6 = TRILogCategory_Server();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v9 = v5;
      _os_log_error_impl(&dword_1DA291000, v6, OS_LOG_TYPE_ERROR, "Failed to remove path: %{public}@", buf, 0xCu);
    }
  }
}

+ (BOOL)saveFromGarbageCollectionItemWithPath:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  char v4 = [(id)objc_opt_class() _containingManagedDirForPath:v3 resolvedAbsPath:0];
  if (v4)
  {
    id v5 = [[TRIDeferredDeleter alloc] initForRootDir:v4];
    int v6 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v7 = [v6 triPath:v3 relativeToParentPath:v4];

    char v8 = [v5 unmarkItemAtRelativePath:v7];
  }
  else
  {
    id v9 = TRILogCategory_Server();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v11 = 138543362;
      id v12 = v3;
      _os_log_error_impl(&dword_1DA291000, v9, OS_LOG_TYPE_ERROR, "Managed directory file at path %{public}@ was not found inside a valid managed directory", (uint8_t *)&v11, 0xCu);
    }

    char v8 = 0;
  }

  return v8;
}

@end