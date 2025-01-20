@interface NSFileManager(TRIServer)
+ (NSObject)triTargetPathForSymlink:()TRIServer;
+ (TRIDiskUsage)triDiskUsageForDirectory:()TRIServer;
+ (id)triPostOrderDescendantDirectoryPathsAtPath:()TRIServer;
+ (uint64_t)triCompressedSizeForFileAtPath:()TRIServer shouldFault:;
+ (uint64_t)triForceRenameWithSourcePath:()TRIServer destPath:;
+ (uint64_t)triRenameOrFaultWithSourcePath:()TRIServer destPath:;
- (BOOL)triRemoveNestedEmptyDirectoriesAtPath:()TRIServer;
- (uint64_t)triForceRemoveItemAtPath:()TRIServer error:;
- (uint64_t)triRemoveCachedANEBinariesForModelsFromPath:()TRIServer error:;
- (uint64_t)triRemoveDirectoryForPath:()TRIServer isDirectory:error:;
@end

@implementation NSFileManager(TRIServer)

- (uint64_t)triRemoveDirectoryForPath:()TRIServer isDirectory:error:
{
  id v8 = a3;
  v9 = v8;
  if (a4)
  {
    id v10 = v8;
  }
  else
  {
    id v10 = [v8 stringByDeletingLastPathComponent];
  }
  v11 = v10;
  if ([a1 fileExistsAtPath:v10 isDirectory:0]) {
    uint64_t v12 = [a1 removeItemAtPath:v11 error:a5];
  }
  else {
    uint64_t v12 = 1;
  }

  return v12;
}

- (uint64_t)triForceRemoveItemAtPath:()TRIServer error:
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v12 = 0;
  char v7 = [a1 triRemoveCachedANEBinariesForModelsFromPath:v6 error:&v12];
  id v8 = v12;
  if ((v7 & 1) == 0)
  {
    v9 = TRILogCategory_ClientFramework();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v14 = v8;
      _os_log_error_impl(&dword_1DA291000, v9, OS_LOG_TYPE_ERROR, "Failed to purge ANE cache during GC: %{public}@", buf, 0xCu);
    }
  }
  uint64_t v10 = [a1 triRemoveItemAtPath:v6 error:a4];

  return v10;
}

+ (id)triPostOrderDescendantDirectoryPathsAtPath:()TRIServer
{
  v31[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = (void *)MEMORY[0x1E016E7F0]();
  v5 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v3 isDirectory:1];
  id v6 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v7 = *MEMORY[0x1E4F1C628];
  v31[0] = *MEMORY[0x1E4F1C628];
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:1];
  v9 = [v6 enumeratorAtURL:v5 includingPropertiesForKeys:v8 options:8 errorHandler:0];

  uint64_t v10 = objc_opt_new();
  if (v10)
  {
    v23 = v4;
    id v24 = v3;
    v11 = (void *)MEMORY[0x1E016E7F0]();
    uint64_t v12 = [v9 nextObject];
    if (v12)
    {
      v13 = (void *)v12;
      while (1)
      {
        id v25 = 0;
        id v26 = 0;
        char v14 = [v13 getResourceValue:&v26 forKey:v7 error:&v25];
        id v15 = v26;
        id v16 = v25;
        if ((v14 & 1) == 0) {
          break;
        }
        int v17 = [v15 BOOLValue];
        if (!v17 || [v9 isEnumeratingDirectoryPostOrder])
        {
          v18 = [v13 path];
          if (v18) {
            int v19 = v17;
          }
          else {
            int v19 = 0;
          }
          if (v19 == 1 && ![v10 addString:v18])
          {

            goto LABEL_20;
          }
        }
        v11 = (void *)MEMORY[0x1E016E7F0]();
        v13 = [v9 nextObject];
        if (!v13) {
          goto LABEL_14;
        }
      }
      v21 = TRILogCategory_ClientFramework();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v28 = v13;
        __int16 v29 = 2114;
        id v30 = v16;
        _os_log_error_impl(&dword_1DA291000, v21, OS_LOG_TYPE_ERROR, "Failed to determine if url %@ is a directory: %{public}@", buf, 0x16u);
      }

LABEL_20:
      id v20 = 0;
    }
    else
    {
LABEL_14:
      id v20 = v10;
    }
    v4 = v23;
    id v3 = v24;
  }
  else
  {
    id v20 = 0;
  }

  return v20;
}

- (BOOL)triRemoveNestedEmptyDirectoriesAtPath:()TRIServer
{
  id v3 = a3;
  v4 = [(id)objc_opt_class() triPostOrderDescendantDirectoryPathsAtPath:v3];
  v5 = v4;
  if (v4)
  {
    uint64_t v9 = 0;
    uint64_t v10 = &v9;
    uint64_t v11 = 0x2020000000;
    char v12 = 1;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __66__NSFileManager_TRIServer__triRemoveNestedEmptyDirectoriesAtPath___block_invoke;
    v8[3] = &unk_1E6BBE4E8;
    v8[4] = &v9;
    if ([v4 enumerateStringsWithBlock:v8]) {
      BOOL v6 = *((unsigned char *)v10 + 24) != 0;
    }
    else {
      BOOL v6 = 0;
    }
    _Block_object_dispose(&v9, 8);
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (uint64_t)triRemoveCachedANEBinariesForModelsFromPath:()TRIServer error:
{
  id v5 = a3;
  uint64_t v6 = MEMORY[0x1E016E7F0]();
  uint64_t v7 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v5];
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithServiceName:@"com.apple.trial.TrialArchivingService"];
  uint64_t v9 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F34A4248];
  [v8 setRemoteObjectInterface:v9];

  [v8 resume];
  v73[0] = MEMORY[0x1E4F143A8];
  v73[1] = 3221225472;
  v73[2] = __78__NSFileManager_TRIServer__triRemoveCachedANEBinariesForModelsFromPath_error___block_invoke;
  v73[3] = &unk_1E6BB82F8;
  id v10 = v8;
  id v74 = v10;
  v52 = (void (**)(void))MEMORY[0x1E016EA80](v73);
  uint64_t v67 = 0;
  v68 = &v67;
  uint64_t v69 = 0x3032000000;
  v70 = __Block_byref_object_copy__55;
  v71 = __Block_byref_object_dispose__55;
  id v72 = 0;
  v66[0] = MEMORY[0x1E4F143A8];
  v66[1] = 3221225472;
  v66[2] = __78__NSFileManager_TRIServer__triRemoveCachedANEBinariesForModelsFromPath_error___block_invoke_24;
  v66[3] = &unk_1E6BBBB50;
  v66[4] = &v67;
  uint64_t v11 = MEMORY[0x1E016EA80](v66);
  v54 = [v10 synchronousRemoteObjectProxyWithErrorHandler:v11];
  v49 = (void *)v11;
  v50 = v10;
  context = (void *)v6;
  v47 = a4;
  id v48 = v5;
  char v12 = [MEMORY[0x1E4F28CB8] defaultManager];
  v13 = [v12 enumeratorAtURL:v7 includingPropertiesForKeys:0 options:16 errorHandler:0];

  char v14 = 0;
  uint64_t v15 = *MEMORY[0x1E4F1C628];
  v53 = v7;
  do
  {
    id v16 = (void *)MEMORY[0x1E016E7F0]();
    int v17 = [v13 nextObject];
    v18 = v17;
    if (!v17)
    {
      int v29 = 2;
      goto LABEL_19;
    }
    id v64 = 0;
    id v65 = 0;
    char v19 = [v17 getResourceValue:&v65 forKey:v15 error:&v64];
    id v20 = v65;
    id v21 = v64;

    if ((v19 & 1) != 0 && ([v20 BOOLValue] & 1) == 0)
    {
      v22 = [v18 lastPathComponent];
      int v23 = [v22 hasSuffix:@".espresso.net"];

      if (v23)
      {
        uint64_t v24 = [v18 relativePath];
        if (!v24)
        {
          v39 = [MEMORY[0x1E4F28B00] currentHandler];
          [v39 handleFailureInMethod:a2, a1, @"NSFileManager+Server.m", 153, @"Expression was unexpectedly nil/false: %@", @"currentURL.relativePath" object file lineNumber description];
        }
        id v25 = [v7 URLByAppendingPathComponent:v24 isDirectory:0];
        if (!v25)
        {
          v40 = [MEMORY[0x1E4F28B00] currentHandler];
          [v40 handleFailureInMethod:a2, a1, @"NSFileManager+Server.m", 155, @"Expression was unexpectedly nil/false: %@", @"[topLevelURL URLByAppendingPathComponent:currentRelativePath isDirectory:NO]" object file lineNumber description];
        }
        id v26 = [v7 path];
        if (!v26)
        {
          v41 = [MEMORY[0x1E4F28B00] currentHandler];
          [v41 handleFailureInMethod:a2, a1, @"NSFileManager+Server.m", 157, @"Expression was unexpectedly nil/false: %@", @"topLevelURL.path" object file lineNumber description];
        }
        v27 = +[TRISandboxExtensionFactory extensionTokenForPath:v26 extensionClass:0];
        if (!v27)
        {
          v56 = [MEMORY[0x1E4F28B00] currentHandler];
          [v56 handleFailureInMethod:a2, a1, @"NSFileManager+Server.m", 159, @"Expression was unexpectedly nil/false: %@", @"[TRISandboxExtensionFactory extensionTokenForPath:pathToExtend extensionClass:TRISandboxExtensionClassRead]" object file lineNumber description];
        }
        uint64_t v58 = 0;
        v59 = &v58;
        uint64_t v60 = 0x3032000000;
        v61 = __Block_byref_object_copy__55;
        v62 = __Block_byref_object_dispose__55;
        id v63 = 0;
        v57[0] = MEMORY[0x1E4F143A8];
        v57[1] = 3221225472;
        v57[2] = __78__NSFileManager_TRIServer__triRemoveCachedANEBinariesForModelsFromPath_error___block_invoke_2;
        v57[3] = &unk_1E6BBBB50;
        v57[4] = &v58;
        [v54 removeCachedANESegmentsForModelAtURL:v25 pathExtension:v27 completion:v57];
        v55 = (void *)v24;
        v28 = (void *)v68[5];
        if (v28)
        {
          int v29 = 1;
        }
        else
        {
          int v29 = 0;
          v28 = (void *)v59[5];
          if (!v28)
          {
LABEL_24:
            _Block_object_dispose(&v58, 8);

            uint64_t v7 = v53;
            goto LABEL_17;
          }
        }
        id v30 = v28;
        v31 = v21;
        v32 = v27;
        v33 = v26;
        v34 = v13;
        v35 = v25;
        uint64_t v36 = v15;
        id v37 = v30;

        id v38 = v37;
        uint64_t v15 = v36;
        id v25 = v35;
        v13 = v34;
        id v26 = v33;
        v27 = v32;
        id v21 = v38;
        goto LABEL_24;
      }
    }
    int v29 = 3;
LABEL_17:

    char v14 = v21;
LABEL_19:
  }
  while (!v29 || v29 == 3);
  if (v29 == 2) {
    int v29 = 0;
  }

  _Block_object_dispose(&v67, 8);
  if (v52) {
    v52[2](v52);
  }

  if (v29)
  {
    uint64_t v42 = 0;
    goto LABEL_31;
  }
  if (v14)
  {
    v43 = v48;
    uint64_t v42 = 0;
    if (v47) {
      void *v47 = v14;
    }
  }
  else
  {
    uint64_t v42 = 1;
LABEL_31:
    v43 = v48;
  }

  return v42;
}

+ (uint64_t)triRenameOrFaultWithSourcePath:()TRIServer destPath:
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = v5;
  id v8 = (const std::__fs::filesystem::path *)[v7 fileSystemRepresentation];
  id v9 = v6;
  id v10 = (const std::__fs::filesystem::path *)[v9 fileSystemRepresentation];
  rename(v8, v10, v11);
  if (v12)
  {
    v13 = TRILogCategory_ClientFramework();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      char v14 = __error();
      uint64_t v15 = strerror(*v14);
      int v16 = *__error();
      *(_DWORD *)buf = 138544130;
      id v25 = v7;
      __int16 v26 = 2114;
      id v27 = v9;
      __int16 v28 = 2080;
      int v29 = v15;
      __int16 v30 = 1024;
      int v31 = v16;
      _os_log_impl(&dword_1DA291000, v13, OS_LOG_TYPE_INFO, "Failed to rename %{public}@ --> %{public}@: %s (%d), attempting moveItemAtPath", buf, 0x26u);
    }

    if (v7)
    {
      int v17 = [MEMORY[0x1E4F28CB8] defaultManager];
      id v23 = 0;
      char v18 = [v17 moveItemAtPath:v7 toPath:v9 error:&v23];
      id v19 = v23;

      if (v18)
      {
        uint64_t v20 = 1;
LABEL_14:

        goto LABEL_15;
      }
      id v21 = TRILogCategory_ClientFramework();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138543874;
        id v25 = v7;
        __int16 v26 = 2114;
        id v27 = v9;
        __int16 v28 = 2112;
        int v29 = (char *)v19;
        _os_log_fault_impl(&dword_1DA291000, v21, OS_LOG_TYPE_FAULT, "Failed to move item: %{public}@ --> %{public}@: %@", buf, 0x20u);
      }
    }
    else
    {
      id v21 = TRILogCategory_ClientFramework();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        id v25 = 0;
        __int16 v26 = 2114;
        id v27 = v9;
        _os_log_error_impl(&dword_1DA291000, v21, OS_LOG_TYPE_ERROR, "Skipping moveItemAtPath request for %{public}@ --> %{public}@, source path does not exist", buf, 0x16u);
      }
      id v19 = 0;
    }

    uint64_t v20 = 0;
    goto LABEL_14;
  }
  uint64_t v20 = 1;
LABEL_15:

  return v20;
}

+ (uint64_t)triForceRenameWithSourcePath:()TRIServer destPath:
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v14 = 0;
  char v9 = [v8 triForceRemoveItemAtPath:v7 error:&v14];
  id v10 = v14;

  if (v9)
  {
    uint64_t v11 = [a1 triRenameOrFaultWithSourcePath:v6 destPath:v7];
  }
  else
  {
    int v12 = TRILogCategory_Server();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v16 = v7;
      __int16 v17 = 2114;
      id v18 = v10;
      _os_log_error_impl(&dword_1DA291000, v12, OS_LOG_TYPE_ERROR, "Failed to remove item at destination %{public}@: %{public}@", buf, 0x16u);
    }

    uint64_t v11 = 0;
  }

  return v11;
}

+ (NSObject)triTargetPathForSymlink:()TRIServer
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  bzero(v23, 0x400uLL);
  id v4 = v3;
  unint64_t v5 = readlink((const char *)[v4 fileSystemRepresentation], v23, 0x400uLL);
  if ((v5 & 0x8000000000000000) != 0)
  {
    id v6 = TRILogCategory_ClientFramework();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v10 = __error();
      uint64_t v11 = strerror(*v10);
      int v12 = *__error();
      int v17 = 138543874;
      id v18 = v4;
      __int16 v19 = 2080;
      uint64_t v20 = v11;
      __int16 v21 = 1024;
      int v22 = v12;
      id v7 = "Failed to resolve symlink %{public}@: %s (%d)";
      id v8 = v6;
      uint32_t v9 = 28;
      goto LABEL_7;
    }
  }
  else if (v5 < 0x400)
  {
    v23[v5] = 0;
    v13 = (void *)[[NSString alloc] initWithUTF8String:v23];
    if (v13)
    {
      id v6 = v13;
      id v14 = v6;
      goto LABEL_14;
    }
    uint64_t v15 = TRILogCategory_ClientFramework();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      int v17 = 138543362;
      id v18 = v4;
      _os_log_error_impl(&dword_1DA291000, v15, OS_LOG_TYPE_ERROR, "Target of symlink %{public}@ contains non-UTF-8 content.", (uint8_t *)&v17, 0xCu);
    }

    id v6 = 0;
  }
  else
  {
    id v6 = TRILogCategory_ClientFramework();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v17 = 138543362;
      id v18 = v4;
      id v7 = "Target of symlink %{public}@ exceeds maximum length.";
      id v8 = v6;
      uint32_t v9 = 12;
LABEL_7:
      _os_log_error_impl(&dword_1DA291000, v8, OS_LOG_TYPE_ERROR, v7, (uint8_t *)&v17, v9);
    }
  }
  id v14 = 0;
LABEL_14:

  return v14;
}

+ (uint64_t)triCompressedSizeForFileAtPath:()TRIServer shouldFault:
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  MEMORY[0x1E016E270]();
  uint64_t v17 = 0;
  unsigned int v15 = 0;
  int v16 = -1;
  id v6 = v5;
  [v6 fileSystemRepresentation];
  int v7 = ParallelCompressionAFSCGetMetadata();
  id v14 = 0;
  MEMORY[0x1E016E280](&v14, 0, 0);
  id v8 = v14;
  if (v7)
  {
    int v9 = *a4;
    id v10 = TRILogCategory_Server();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
    if (v9)
    {
      if (v11) {
        goto LABEL_11;
      }
    }
    else if (v11)
    {
LABEL_11:
      *(_DWORD *)buf = 138543618;
      id v19 = v6;
      __int16 v20 = 2114;
      __int16 v21 = v8;
      _os_log_error_impl(&dword_1DA291000, v10, OS_LOG_TYPE_ERROR, "Unable to query compressed size for \"%{public}@\": %{public}@", buf, 0x16u);
    }

    *a4 = 0;
    goto LABEL_9;
  }
  if (v16 == -1)
  {
LABEL_9:
    uint64_t v12 = -1;
    goto LABEL_10;
  }
  uint64_t v12 = v15;
LABEL_10:

  return v12;
}

+ (TRIDiskUsage)triDiskUsageForDirectory:()TRIServer
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v39 = a3;
  context = (void *)MEMORY[0x1E016E7F0]();
  v60[0] = 0;
  id v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v4 = [v3 fileExistsAtPath:v39 isDirectory:v60];

  if (v4)
  {
    if (v60[0])
    {
      uint64_t v32 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initFileURLWithPath:v39 isDirectory:1];
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v66 = 0x3032000000;
      uint64_t v67 = __Block_byref_object_copy__55;
      v68 = __Block_byref_object_dispose__55;
      id v69 = 0;
      uint64_t v43 = *MEMORY[0x1E4F1C5F8];
      uint64_t v5 = *MEMORY[0x1E4F1C5F8];
      uint64_t v44 = *MEMORY[0x1E4F1C628];
      v64[0] = *MEMORY[0x1E4F1C628];
      v64[1] = v5;
      uint64_t v6 = *MEMORY[0x1E4F1C670];
      v64[2] = *MEMORY[0x1E4F1C718];
      v64[3] = v6;
      uint64_t v42 = v6;
      v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:v64 count:4];
      int v7 = [MEMORY[0x1E4F28CB8] defaultManager];
      v59[0] = MEMORY[0x1E4F143A8];
      v59[1] = 3221225472;
      v59[2] = __53__NSFileManager_TRIServer__triDiskUsageForDirectory___block_invoke;
      v59[3] = &unk_1E6BBB998;
      v59[4] = &buf;
      id v48 = [v7 enumeratorAtURL:v32 includingPropertiesForKeys:v33 options:24 errorHandler:v59];

      if (v48)
      {
        os_log_t log = (os_log_t)objc_opt_new();
        uint64_t v46 = 0;
        uint64_t v47 = 0;
        uint64_t v45 = 0;
        v60[0] = 1;
        uint64_t v41 = *MEMORY[0x1E4F1C6B8];
        uint64_t v40 = *MEMORY[0x1E4F1C5A0];
        while (1)
        {
          id v8 = (void *)MEMORY[0x1E016E7F0]();
          int v9 = [v48 nextObject];
          id v10 = v9;
          if (v9) {
            break;
          }
          int v21 = 2;
LABEL_17:

          if (v21 == 2)
          {
            __int16 v28 = [[TRIDiskUsage alloc] initWithNaiveSum:v47 deduplicatedSum:v45 compressedSum:v46];
            goto LABEL_35;
          }
        }
        id v57 = 0;
        id v58 = 0;
        [v9 getResourceValue:&v58 forKey:v44 error:&v57];
        id v11 = v58;
        id v12 = v57;
        id v55 = 0;
        id v56 = 0;
        [v10 getResourceValue:&v56 forKey:v43 error:&v55];
        id v13 = v56;
        id v14 = v55;

        id v53 = 0;
        id v54 = 0;
        [v10 getResourceValue:&v54 forKey:v42 error:&v53];
        id v15 = v54;
        id v16 = v53;

        id v51 = 0;
        id v52 = 0;
        [v10 getResourceValue:&v52 forKey:v41 error:&v51];
        id v17 = v52;
        id v18 = v51;

        id v49 = 0;
        id v50 = 0;
        [v10 getResourceValue:&v50 forKey:v40 error:&v49];
        id v19 = v50;
        id v20 = v49;

        if ([v11 BOOLValue])
        {
          v47 += [v13 unsignedLongValue];
          v45 += [v13 unsignedLongValue];
          v46 += [v13 unsignedLongValue];
LABEL_15:
          int v21 = 3;
LABEL_16:

          goto LABEL_17;
        }
        if (![v15 BOOLValue]) {
          goto LABEL_15;
        }
        if ((unint64_t)[v17 unsignedLongValue] >= 2)
        {
          if (!v19)
          {
            __int16 v26 = [MEMORY[0x1E4F28B00] currentHandler];
            [v26 handleFailureInMethod:a2 object:a1 file:@"NSFileManager+Server.m" lineNumber:373 description:@"no resource identifier for regular file"];
          }
          if ([log containsObject:v19])
          {
            int v22 = 0;
            goto LABEL_21;
          }
          [log addObject:v19];
        }
        int v22 = 1;
LABEL_21:
        v47 += [v13 unsignedLongValue];
        if (v22)
        {
          uint64_t v34 = [v13 unsignedLongValue];
          id v23 = [v10 relativePath];
          if (!v23)
          {
            id v27 = [MEMORY[0x1E4F28B00] currentHandler];
            [v27 handleFailureInMethod:a2, a1, @"NSFileManager+Server.m", 386, @"Expression was unexpectedly nil/false: %@", @"relURL.relativePath" object file lineNumber description];
          }
          uint64_t v24 = [v39 stringByAppendingPathComponent:v23];

          uint64_t v25 = [a1 triCompressedSizeForFileAtPath:v24 shouldFault:v60];
          if (v25 == -1) {
            uint64_t v25 = [v13 unsignedLongValue];
          }

          int v21 = 0;
          v45 += v34;
          v46 += v25;
        }
        else
        {
          int v21 = 0;
        }
        goto LABEL_16;
      }
      TRILogCategory_Server();
      os_log_t log = (os_log_t)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
      {
        uint64_t v31 = *(void *)(*((void *)&buf + 1) + 40);
        *(_DWORD *)uint64_t v60 = 138543618;
        id v61 = v39;
        __int16 v62 = 2114;
        uint64_t v63 = v31;
        _os_log_error_impl(&dword_1DA291000, log, OS_LOG_TYPE_ERROR, "Failed to create enumerator at path: %{public}@ w/ error: %{public}@", v60, 0x16u);
      }
      __int16 v28 = 0;
LABEL_35:

      _Block_object_dispose(&buf, 8);
    }
    else
    {
      int v29 = TRILogCategory_Server();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138543362;
        *(void *)((char *)&buf + 4) = v39;
        _os_log_error_impl(&dword_1DA291000, v29, OS_LOG_TYPE_ERROR, "Can't compute disk usage for \"%{public}@\": not a directory", (uint8_t *)&buf, 0xCu);
      }

      __int16 v28 = 0;
    }
  }
  else
  {
    __int16 v28 = [[TRIDiskUsage alloc] initWithNaiveSum:0 deduplicatedSum:0 compressedSum:0];
  }

  return v28;
}

@end