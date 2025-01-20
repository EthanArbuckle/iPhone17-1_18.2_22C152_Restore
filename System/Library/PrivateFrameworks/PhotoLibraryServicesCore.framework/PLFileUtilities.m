@interface PLFileUtilities
+ (BOOL)changeFileOwnerToMobileAtPath:(id)a3 error:(id *)a4;
+ (BOOL)changeFileOwnerToMobileAtPath:(id)a3 error:(id *)a4 usingFileManager:(id)a5;
+ (BOOL)cloneFileAtPath:(id)a3 toPath:(id)a4 error:(id *)a5;
+ (BOOL)copyItemAtURL:(id)a3 toURL:(id)a4 error:(id *)a5;
+ (BOOL)createDirectoryAtPath:(id)a3 error:(id *)a4;
+ (BOOL)createDirectoryAtPath:(id)a3 error:(id *)a4 usingFileManager:(id)a5;
+ (BOOL)filePath:(id)a3 hasPrefix:(id)a4;
+ (BOOL)filePath:(id)a3 isEqualToFilePath:(id)a4;
+ (BOOL)filePathIsSubpathOfSyncRoot:(id)a3;
+ (BOOL)fileURL:(id)a3 isEqualToFileURL:(id)a4;
+ (BOOL)ingestItemAtURL:(id)a3 toURL:(id)a4 type:(int64_t)a5 options:(unint64_t)a6 capabilities:(id)a7 error:(id *)a8;
+ (BOOL)isFileExistsError:(id)a3;
+ (BOOL)removeDisconnectedSQLiteDatabaseFileWithPath:(id)a3 error:(id *)a4;
+ (BOOL)removeFilesInDirectoryAtURL:(id)a3 withPrefix:(id)a4 error:(id *)a5 progress:(id)a6;
+ (BOOL)removeItemAtPath:(id)a3 error:(id *)a4;
+ (BOOL)removeItemAtURL:(id)a3 error:(id *)a4;
+ (BOOL)secureMoveItemAtURL:(id)a3 toURL:(id)a4 capabilities:(id)a5 error:(id *)a6;
+ (BOOL)setFileCreationDate:(id)a3 forFileURL:(id)a4 error:(id *)a5;
+ (BOOL)stripExtendedAttributesFromFileAtURL:(id)a3 inDomain:(id)a4 error:(id *)a5;
+ (BOOL)stripImmutableFlagIfNecessaryFromFileAtPath:(id)a3;
+ (id)_attributeDetailsForPath:(id)a3 ofFileSystem:(BOOL)a4 error:(id *)a5;
+ (id)_defaultSystemLibraryPath;
+ (id)_diagnosticInfoForPath:(id)a3 includeFileSystemAttributes:(BOOL)a4 resolvedFileSystemAttributes:(BOOL *)a5;
+ (id)_fileListingDetailsForPath:(id)a3 error:(id *)a4;
+ (id)_mobileOwnerAttributes;
+ (id)accessibleURLOrParentForFileURL:(id)a3;
+ (id)defaultSystemLibraryURL;
+ (id)defaultSystemPhotoDCIMDirectory;
+ (id)defaultSystemPhotoDataCPLDirectory;
+ (id)defaultSystemPhotoDataDirectory;
+ (id)defaultSystemPhotoDataMiscDirectory;
+ (id)descriptionForFileIngestionType:(int64_t)a3;
+ (id)embeddedHomeDirectory;
+ (id)fileManager;
+ (id)hasDiskSpaceToCopyFileAtURL:(id)a3 toVolumeAtURL:(id)a4 error:(id *)a5;
+ (id)proxyLockCoordinatingFilePathForDatabaseDirectory:(id)a3 databaseName:(id)a4;
+ (id)proxyLockFilePathForDatabasePath:(id)a3;
+ (id)realPathForPath:(id)a3 error:(id *)a4;
+ (id)realSystemPhotoLibraryPath;
+ (id)realURLForURL:(id)a3 error:(id *)a4;
+ (id)redactedDescriptionForFileURL:(id)a3;
+ (id)redactedDescriptionForPath:(id)a3;
+ (id)standardOutputStringForExecutablePath:(id)a3 arguments:(id)a4 environment:(id)a5 standardErrorOut:(id *)a6 error:(id *)a7;
+ (int64_t)directoryEntryCountAtURL:(id)a3 error:(id *)a4;
+ (int64_t)fileLengthForFilePath:(id)a3;
+ (void)calculateTotalSizeOfFilesAtPath:(id)a3 calculatePurgeable:(BOOL)a4 allocatedSize:(BOOL)a5 result:(id)a6;
+ (void)gatherDiagnosticInfoForURL:(id)a3 handler:(id)a4;
+ (void)logDiagnosticInfoForURL:(id)a3;
@end

@implementation PLFileUtilities

+ (id)defaultSystemLibraryURL
{
  pl_dispatch_once(&_ensureSystemPhotoDataDirectoryPath_onceToken, &__block_literal_global_375_5084);
  v2 = (void *)sDefaultSystemLibraryURL;
  return v2;
}

+ (id)_defaultSystemLibraryPath
{
  os_unfair_lock_lock((os_unfair_lock_t)&sDefaultSystemLibraryPathLock);
  if (!sDefaultSystemLibraryPath)
  {
    if (PLMobileSlideShowPhotoLibraryTestingMode_onceToken != -1) {
      dispatch_once(&PLMobileSlideShowPhotoLibraryTestingMode_onceToken, &__block_literal_global_3810);
    }
    if (PLMobileSlideShowPhotoLibraryTestingMode_sMobileSlideShowPhotoLibraryTestingMode == 2)
    {
      v3 = NSTemporaryDirectory();
      v4 = NSString;
      v5 = [MEMORY[0x1E4F29128] UUID];
      v6 = [v5 UUIDString];
      v7 = [v4 stringWithFormat:@"unit-test-library-%@.photoslibrary", v6];
      uint64_t v8 = [v3 stringByAppendingPathComponent:v7];
      v9 = (void *)sDefaultSystemLibraryPath;
      sDefaultSystemLibraryPath = v8;
    }
    else
    {
      uint64_t v10 = [a1 realSystemPhotoLibraryPath];
      v3 = (void *)sDefaultSystemLibraryPath;
      sDefaultSystemLibraryPath = v10;
    }

    uint64_t v11 = [MEMORY[0x1E4F1CB10] fileURLWithPath:sDefaultSystemLibraryPath isDirectory:1];
    v12 = (void *)sDefaultSystemLibraryURL;
    sDefaultSystemLibraryURL = v11;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&sDefaultSystemLibraryPathLock);
  v13 = (void *)sDefaultSystemLibraryPath;
  return v13;
}

+ (id)realSystemPhotoLibraryPath
{
  v2 = [a1 embeddedHomeDirectory];
  v3 = [v2 stringByAppendingPathComponent:@"Media"];

  return v3;
}

+ (id)embeddedHomeDirectory
{
  if (geteuid())
  {
    CPSharedResourcesDirectory();
    v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = @"/var/mobile";
  }
  return v2;
}

void __41__PLFileUtilities__mobileOwnerAttributes__block_invoke()
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v0 = getpwnam("mobile");
  if (v0)
  {
    uint64_t pw_uid = v0->pw_uid;
    uint64_t pw_gid = v0->pw_gid;
  }
  else
  {
    uint64_t pw_uid = 501;
    uint64_t pw_gid = 501;
  }
  v7[0] = *MEMORY[0x1E4F28318];
  v3 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInt:pw_uid];
  v8[0] = v3;
  v7[1] = *MEMORY[0x1E4F282D8];
  v4 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInt:pw_gid];
  v8[1] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];
  v6 = (void *)_mobileOwnerAttributes_attributes;
  _mobileOwnerAttributes_attributes = v5;
}

uint64_t __30__PLFileUtilities_fileManager__block_invoke()
{
  fileManager__fileManager = (uint64_t)objc_alloc_init(MEMORY[0x1E4F28CB8]);
  return MEMORY[0x1F41817F8]();
}

+ (id)defaultSystemPhotoDataMiscDirectory
{
  v12[1] = *MEMORY[0x1E4F143B8];
  if (!defaultSystemPhotoDataMiscDirectory_path)
  {
    v2 = [a1 defaultSystemPhotoDataDirectory];
    uint64_t v3 = [v2 stringByAppendingPathComponent:@"MISC"];
    v4 = (void *)defaultSystemPhotoDataMiscDirectory_path;
    defaultSystemPhotoDataMiscDirectory_path = v3;

    uint64_t v5 = [MEMORY[0x1E4F28CB8] defaultManager];
    char v6 = [v5 fileExistsAtPath:defaultSystemPhotoDataMiscDirectory_path];

    if ((v6 & 1) == 0)
    {
      uint64_t v11 = *MEMORY[0x1E4F28330];
      v12[0] = &unk_1EEC14890;
      v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
      uint64_t v8 = [MEMORY[0x1E4F28CB8] defaultManager];
      [v8 createDirectoryAtPath:defaultSystemPhotoDataMiscDirectory_path withIntermediateDirectories:1 attributes:v7 error:0];
    }
  }
  v9 = (void *)defaultSystemPhotoDataMiscDirectory_path;
  return v9;
}

+ (id)proxyLockFilePathForDatabasePath:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = a3;
  if (!v5)
  {
    v28 = [MEMORY[0x1E4F28B00] currentHandler];
    [v28 handleFailureInMethod:a2, a1, @"PLFileUtilities.m", 215, @"Invalid parameter not satisfying: %@", @"path" object file lineNumber description];
  }
  char v31 = 0;
  bzero(&v36, 0x878uLL);
  char v6 = [v5 stringByDeletingLastPathComponent];
  v7 = [MEMORY[0x1E4F28CB8] defaultManager];
  if ([v7 fileExistsAtPath:v6 isDirectory:&v31]) {
    BOOL v8 = v31 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {

LABEL_10:
    uint64_t v10 = PLBackendGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = __error();
      v12 = strerror(*v11);
      *(_DWORD *)buf = 138412546;
      v33 = v5;
      __int16 v34 = 2082;
      v35 = v12;
      _os_log_impl(&dword_19BCFB000, v10, OS_LOG_TYPE_DEFAULT, "error finding volume info for proxy lock path on %@: %{public}s:", buf, 0x16u);
    }
    v13 = 0;
LABEL_13:

    goto LABEL_14;
  }
  int v9 = statfs((const char *)[v6 fileSystemRepresentation], &v36);

  if (v9) {
    goto LABEL_10;
  }
  if ((v36.f_flags & 0x1000) == 0)
  {
    pl_dispatch_once(&PLIsReallyAssetsd_didCheckReadOnly, &__block_literal_global_54_3819);
    if (PLIsReallyAssetsd_isAssetsd)
    {
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __52__PLFileUtilities_proxyLockFilePathForDatabasePath___block_invoke;
      v29[3] = &__block_descriptor_48_e5_v8__0l;
      v29[4] = a2;
      v29[5] = a1;
      pl_dispatch_once(&proxyLockFilePathForDatabasePath__onceToken, v29);
      uint64_t v15 = [v5 length];
      if ((unint64_t)(v15 + [(id)proxyLockFilePathForDatabasePath__lockPath length] - 1024) > 0xFFFFFFFFFFFFFBFELL)
      {
        uint64_t v10 = [v5 stringByReplacingOccurrencesOfString:@"/" withString:@"_"];
      }
      else
      {
        v16 = [MEMORY[0x1E4F1CA58] dataWithLength:32];
        v17 = v5;
        v18 = (const void *)[v17 UTF8String];
        CC_LONG v19 = [v17 lengthOfBytesUsingEncoding:4];
        id v20 = v16;
        CC_SHA256(v18, v19, (unsigned __int8 *)[v20 mutableBytes]);
        v21 = [v20 base64EncodedStringWithOptions:0];
        v22 = [v17 lastPathComponent];
        uint64_t v10 = [v21 stringByAppendingPathComponent:v22];
      }
      v13 = [(id)proxyLockFilePathForDatabasePath__lockPath stringByAppendingPathComponent:v10];
    }
    else
    {
      v23 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v5 isDirectory:1];
      v24 = +[PLPhotoLibraryPathManager libraryURLFromDatabaseURL:v23];

      v25 = [[PLAssetsdClient alloc] initWithPhotoLibraryURL:v24];
      v26 = [(PLAssetsdClient *)v25 libraryClient];
      id v30 = 0;
      v13 = [v26 proxyLockFileWithDatabasePath:v5 error:&v30];
      uint64_t v10 = v30;

      if (!v13)
      {
        v27 = PLBackendGetLog();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v33 = v10;
          _os_log_impl(&dword_19BCFB000, v27, OS_LOG_TYPE_ERROR, "Client failed to access the proxy lock file path. Error: %@", buf, 0xCu);
        }
      }
    }
    goto LABEL_13;
  }
  v13 = 0;
LABEL_14:

  return v13;
}

+ (id)defaultSystemPhotoDataDirectory
{
  pl_dispatch_once(&_ensureSystemPhotoDataDirectoryPath_onceToken, &__block_literal_global_375_5084);
  v2 = (void *)sPhotoDataDirectoryPath;
  return v2;
}

+ (BOOL)createDirectoryAtPath:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = objc_opt_class();
  BOOL v8 = [a1 fileManager];
  LOBYTE(a4) = [v7 createDirectoryAtPath:v6 error:a4 usingFileManager:v8];

  return (char)a4;
}

+ (id)fileManager
{
  pl_dispatch_once(&fileManager_onceToken, &__block_literal_global_5072);
  v2 = (void *)fileManager__fileManager;
  return v2;
}

+ (BOOL)createDirectoryAtPath:(id)a3 error:(id *)a4 usingFileManager:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  uint64_t v10 = [(id)objc_opt_class() _mobileOwnerAttributes];
  id v15 = 0;
  BOOL v11 = 1;
  char v12 = [v8 createDirectoryAtPath:v9 withIntermediateDirectories:1 attributes:v10 error:&v15];

  id v13 = v15;
  if ((v12 & 1) == 0 && ([a1 isFileExistsError:v13] & 1) == 0)
  {
    BOOL v11 = 0;
    if (a4) {
      *a4 = v13;
    }
  }

  return v11;
}

+ (id)_mobileOwnerAttributes
{
  pl_dispatch_once(&_mobileOwnerAttributes_onceToken, &__block_literal_global_159_4965);
  v2 = (void *)_mobileOwnerAttributes_attributes;
  return v2;
}

+ (id)realPathForPath:(id)a3 error:(id *)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = v5;
  if (v5)
  {
    if (realpath_DARWIN_EXTSN((const char *)[v5 fileSystemRepresentation], buffer))
    {
      v7 = (__CFString *)CFStringCreateWithFileSystemRepresentation(0, buffer);
      uint64_t v8 = 0;
      if (!a4) {
        goto LABEL_10;
      }
    }
    else
    {
      v7 = 0;
      uint64_t v8 = *__error();
      if (!a4) {
        goto LABEL_10;
      }
    }
  }
  else
  {
    uint64_t v8 = 0;
    v7 = 0;
    if (!a4) {
      goto LABEL_10;
    }
  }
  if (!v7)
  {
    *a4 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:v8 userInfo:0];
  }
LABEL_10:

  return v7;
}

+ (id)redactedDescriptionForFileURL:(id)a3
{
  v4 = [a3 path];
  id v5 = [a1 redactedDescriptionForPath:v4];

  return v5;
}

+ (id)redactedDescriptionForPath:(id)a3
{
  id v3 = a3;
  if (![v3 fileSystemRepresentation]
    || (memset(&v6, 0, sizeof(v6)),
        lstat((const char *)[v3 fileSystemRepresentation], &v6))
    || (objc_msgSend(NSString, "stringWithFormat:", @"fs=%d/file=%llu", v6.st_dev, v6.st_ino), (v4 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    v4 = objc_msgSend(NSString, "stringWithFormat:", @"hash=%lu", objc_msgSend(v3, "hash"));
  }

  return v4;
}

+ (id)defaultSystemPhotoDCIMDirectory
{
  pl_dispatch_once(&_ensureSystemDCIMDirectoryPath_onceToken, &__block_literal_global_380);
  v2 = (void *)sDCIMDirectoryPath;
  return v2;
}

+ (void)calculateTotalSizeOfFilesAtPath:(id)a3 calculatePurgeable:(BOOL)a4 allocatedSize:(BOOL)a5 result:(id)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  v68[2] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  uint64_t v10 = (void (**)(id, uint64_t, uint64_t, uint64_t, uint64_t, void))a6;
  uint64_t v57 = 0;
  v58 = &v57;
  uint64_t v59 = 0x2020000000;
  uint64_t v60 = 0;
  uint64_t v53 = 0;
  v54 = &v53;
  uint64_t v55 = 0x2020000000;
  uint64_t v56 = 0;
  uint64_t v49 = 0;
  v50 = &v49;
  uint64_t v51 = 0x2020000000;
  uint64_t v52 = 0;
  uint64_t v45 = 0;
  v46 = &v45;
  uint64_t v47 = 0x2020000000;
  uint64_t v48 = 0;
  uint64_t v39 = 0;
  v40 = &v39;
  uint64_t v41 = 0x3032000000;
  v42 = __Block_byref_object_copy__4887;
  v43 = __Block_byref_object_dispose__4888;
  id v44 = 0;
  uint64_t v11 = [MEMORY[0x1E4F1C9C8] now];
  id v12 = (id)*MEMORY[0x1E4F1C5F8];
  if (v7)
  {
    id v13 = (id)*MEMORY[0x1E4F1C718];

    id v12 = v13;
  }
  if (v8)
  {
    uint64_t v14 = *MEMORY[0x1E4F1C660];
    v68[0] = v12;
    v68[1] = v14;
    id v15 = (id *)v68;
    uint64_t v16 = 2;
  }
  else
  {
    id v67 = v12;
    id v15 = &v67;
    uint64_t v16 = 1;
  }
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:v16];
  v18 = [[PLFilesystemIterator alloc] initWithFilePath:v9];
  uint64_t v27 = MEMORY[0x1E4F143A8];
  uint64_t v28 = 3221225472;
  v29 = __91__PLFileUtilities_calculateTotalSizeOfFilesAtPath_calculatePurgeable_allocatedSize_result___block_invoke;
  id v30 = &unk_1E589FC00;
  id v19 = v17;
  id v31 = v19;
  v33 = &v39;
  __int16 v34 = &v57;
  id v20 = v12;
  id v32 = v20;
  v35 = &v53;
  BOOL v38 = v8;
  statfs v36 = &v45;
  uint64_t v37 = &v49;
  [(PLFilesystemIterator *)v18 visitURLsLoadingPropertiesForKeys:v19 withBlock:&v27];
  v21 = PLBackendGetLog();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    uint64_t v22 = v58[3];
    objc_msgSend(v11, "timeIntervalSinceNow", v27, v28, v29, v30, v31);
    *(_DWORD *)buf = 138412802;
    id v62 = v9;
    __int16 v63 = 2048;
    uint64_t v64 = v22;
    __int16 v65 = 2048;
    double v66 = 0.0 - v23;
    _os_log_impl(&dword_19BCFB000, v21, OS_LOG_TYPE_INFO, "calculateTotalSizeOfFilesAtPath:%@ %llu files took %.3f sec", buf, 0x20u);
  }

  v24 = [(PLFilesystemIterator *)v18 error];
  if (v24)
  {
  }
  else if (!v40[5])
  {
    v10[2](v10, v58[3], v54[3], v50[3], v46[3], 0);
    goto LABEL_14;
  }
  v25 = [(PLFilesystemIterator *)v18 error];
  uint64_t v26 = (uint64_t)v25;
  if (!v25) {
    uint64_t v26 = v40[5];
  }
  v10[2](v10, 0, 0, 0, 0, v26);

LABEL_14:
  _Block_object_dispose(&v39, 8);

  _Block_object_dispose(&v45, 8);
  _Block_object_dispose(&v49, 8);
  _Block_object_dispose(&v53, 8);
  _Block_object_dispose(&v57, 8);
}

BOOL __91__PLFileUtilities_calculateTotalSizeOfFilesAtPath_calculatePurgeable_allocatedSize_result___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v12 = 0;
  v4 = [a2 resourceValuesForKeys:v3 error:&v12];
  id v5 = v12;
  id v6 = v12;
  if (v4)
  {
    ++*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
    BOOL v7 = [v4 objectForKeyedSubscript:*(void *)(a1 + 40)];
    uint64_t v8 = [v7 unsignedLongLongValue];

    *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) += v8;
    if (*(unsigned char *)(a1 + 88))
    {
      id v9 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F1C660]];
      int v10 = [v9 BOOLValue];

      if (v10)
      {
        *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) += v8;
        ++*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
      }
    }
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v5);
  }

  return v4 != 0;
}

+ (BOOL)filePathIsSubpathOfSyncRoot:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v21 = 0;
  id v4 = a3;
  id v5 = (const char *)[v4 fileSystemRepresentation];
  if (!v5) {
    goto LABEL_17;
  }
  id v6 = v5;
  if (fsctl(v5, 0x40084A4AuLL, &v21, 0))
  {
    BOOL v7 = __error();
    int v8 = *v7;
    if (*v7 != 25)
    {
      if (v8 == 2)
      {
        id v9 = [v4 stringByDeletingLastPathComponent];
        unint64_t v10 = [v9 length];
        if (v10 < [v4 length] && (unint64_t)-[NSObject length](v9, "length") > 1)
        {
          char v11 = [a1 filePathIsSubpathOfSyncRoot:v9];

          goto LABEL_18;
        }
      }
      else
      {
        v17 = strerror(*v7);
        id v9 = PLBackendGetLog();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          v18 = [a1 redactedDescriptionForPath:v4];
          *(_DWORD *)buf = 138543874;
          double v23 = v18;
          __int16 v24 = 1024;
          int v25 = v8;
          __int16 v26 = 2082;
          uint64_t v27 = v17;
          _os_log_impl(&dword_19BCFB000, v9, OS_LOG_TYPE_ERROR, "Get parent sync root failed for %{public}@ error %d %{public}s", buf, 0x1Cu);
        }
      }
    }
LABEL_17:
    char v11 = 0;
    goto LABEL_18;
  }
  uint64_t v12 = v21;
  if (!v21)
  {
    uint64_t v20 = 0;
    if (!fsctl(v6, 0x40044A48uLL, &v20, 0))
    {
      char v11 = v20 == 1;
      goto LABEL_18;
    }
    int v13 = *__error();
    uint64_t v14 = strerror(v13);
    id v15 = PLBackendGetLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = [a1 redactedDescriptionForPath:v4];
      *(_DWORD *)buf = 138543874;
      double v23 = v16;
      __int16 v24 = 1024;
      int v25 = v13;
      __int16 v26 = 2082;
      uint64_t v27 = v14;
      _os_log_impl(&dword_19BCFB000, v15, OS_LOG_TYPE_ERROR, "Get sync root flag failed for %{public}@ error %d %{public}s", buf, 0x1Cu);
    }
    uint64_t v12 = v21;
  }
  char v11 = v12 != 0;
LABEL_18:

  return v11;
}

+ (void)logDiagnosticInfoForURL:(id)a3
{
  v55[5] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = PLBackendGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    id v6 = [a1 redactedDescriptionForFileURL:v4];
    *(_DWORD *)buf = 138543362;
    id v52 = v6;
    _os_log_impl(&dword_19BCFB000, v5, OS_LOG_TYPE_ERROR, "--- BEGIN File diagnostics for %{public}@ ---", buf, 0xCu);
  }
  BOOL v7 = PLBackendGetLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    int v8 = [v4 path];
    *(_DWORD *)buf = 138412290;
    id v52 = v8;
    _os_log_impl(&dword_19BCFB000, v7, OS_LOG_TYPE_ERROR, "path: %@", buf, 0xCu);
  }
  uint64_t v9 = *MEMORY[0x1E4F1C960];
  uint64_t v10 = *MEMORY[0x1E4F1C838];
  v55[0] = *MEMORY[0x1E4F1C960];
  v55[1] = v10;
  uint64_t v11 = *MEMORY[0x1E4F1C848];
  v55[2] = *MEMORY[0x1E4F1C868];
  v55[3] = v11;
  v55[4] = *MEMORY[0x1E4F1C858];
  uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v55 count:5];
  id v49 = 0;
  v43 = [v4 resourceValuesForKeys:v12 error:&v49];
  id v13 = v49;
  if (v13)
  {
    uint64_t v14 = PLBackendGetLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v52 = v4;
      __int16 v53 = 2112;
      id v54 = v13;
      _os_log_impl(&dword_19BCFB000, v14, OS_LOG_TYPE_ERROR, "Error getting resource values for %@: %@", buf, 0x16u);
    }
  }
  id v15 = [a1 defaultSystemLibraryURL];

  id v48 = 0;
  uint64_t v16 = [v15 resourceValuesForKeys:v12 error:&v48];
  id v17 = v48;
  if (v17)
  {
    v18 = PLBackendGetLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v52 = v15;
      __int16 v53 = 2112;
      id v54 = v17;
      _os_log_impl(&dword_19BCFB000, v18, OS_LOG_TYPE_ERROR, "Error getting resource values for default SPL URL %@: %@", buf, 0x16u);
    }
  }
  id v19 = [v43 objectForKeyedSubscript:v9];
  uint64_t v20 = [v16 objectForKeyedSubscript:v9];
  id v41 = a1;
  v42 = v4;
  uint64_t v37 = (void *)v20;
  BOOL v38 = v19;
  if (v19)
  {
    if (v20)
    {
      int v21 = [v19 isEqual:v20];
      uint64_t v22 = PLBackendGetLog();
      BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
      if (v21)
      {
        if (!v23) {
          goto LABEL_25;
        }
        *(_WORD *)buf = 0;
        __int16 v24 = "URL is on the same volume as the default SPL URL";
      }
      else
      {
        if (!v23) {
          goto LABEL_25;
        }
        *(_WORD *)buf = 0;
        __int16 v24 = "URL is NOT on the same volume as the default SPL URL";
      }
    }
    else
    {
      uint64_t v22 = PLBackendGetLog();
      if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        goto LABEL_25;
      }
      *(_WORD *)buf = 0;
      __int16 v24 = "defaultSPLVolumeURL is nil";
    }
  }
  else
  {
    uint64_t v22 = PLBackendGetLog();
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      goto LABEL_25;
    }
    *(_WORD *)buf = 0;
    __int16 v24 = "volumeURL is nil";
  }
  _os_log_impl(&dword_19BCFB000, v22, OS_LOG_TYPE_ERROR, v24, buf, 2u);
LABEL_25:
  uint64_t v39 = v16;
  v40 = v15;

  int v25 = PLBackendGetLog();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19BCFB000, v25, OS_LOG_TYPE_ERROR, "{", buf, 2u);
  }

  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v26 = v12;
  uint64_t v27 = [v26 countByEnumeratingWithState:&v44 objects:v50 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v45;
    do
    {
      for (uint64_t i = 0; i != v28; ++i)
      {
        if (*(void *)v45 != v29) {
          objc_enumerationMutation(v26);
        }
        id v31 = *(void **)(*((void *)&v44 + 1) + 8 * i);
        if (([v31 isEqual:v9] & 1) == 0)
        {
          id v32 = PLBackendGetLog();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          {
            v33 = [v43 objectForKeyedSubscript:v31];
            *(_DWORD *)buf = 138543618;
            id v52 = v31;
            __int16 v53 = 2114;
            id v54 = v33;
            _os_log_impl(&dword_19BCFB000, v32, OS_LOG_TYPE_ERROR, "  %{public}@ = %{public}@", buf, 0x16u);
          }
        }
      }
      uint64_t v28 = [v26 countByEnumeratingWithState:&v44 objects:v50 count:16];
    }
    while (v28);
  }

  __int16 v34 = PLBackendGetLog();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19BCFB000, v34, OS_LOG_TYPE_ERROR, "}", buf, 2u);
  }

  [v41 gatherDiagnosticInfoForURL:v42 handler:&__block_literal_global_214];
  v35 = PLBackendGetLog();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
  {
    statfs v36 = [v41 redactedDescriptionForFileURL:v42];
    *(_DWORD *)buf = 138543362;
    id v52 = v36;
    _os_log_impl(&dword_19BCFB000, v35, OS_LOG_TYPE_ERROR, "--- END File diagnostics for %{public}@ ---", buf, 0xCu);
  }
}

void __43__PLFileUtilities_logDiagnosticInfoForURL___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a3 componentsSeparatedByString:@"\n"];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v10 + 1) + 8 * i);
        uint64_t v9 = PLBackendGetLog();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v15 = v8;
          _os_log_impl(&dword_19BCFB000, v9, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v16 count:16];
    }
    while (v5);
  }
}

+ (void)gatherDiagnosticInfoForURL:(id)a3 handler:(id)a4
{
  id v6 = a3;
  BOOL v7 = (void (**)(id, void *, void *))a4;
  if (PFOSVariantHasInternalDiagnostics())
  {
    char v22 = 0;
    uint64_t v8 = [v6 path];
    uint64_t v9 = [a1 _diagnosticInfoForPath:v8 includeFileSystemAttributes:1 resolvedFileSystemAttributes:&v22];

    long long v10 = [v6 path];
    v7[2](v7, v10, v9);

    long long v11 = [v6 path];
    if ([v11 length])
    {
      long long v12 = [MEMORY[0x1E4F28CB8] defaultManager];
      char v13 = [v12 fileExistsAtPath:v11];

      if ((v13 & 1) == 0)
      {
        uint64_t v14 = *MEMORY[0x1E4F8CEE0] + 1;
        LOBYTE(v15) = 1;
        while (1)
        {
          uint64_t v16 = [v11 stringByDeletingLastPathComponent];
          if (![v16 length] || (objc_msgSend(v16, "isEqualToString:", v11) & 1) != 0)
          {
            [NSString stringWithFormat:@"File does not exist! No parent directory (%@)", v16];
            goto LABEL_12;
          }
          uint64_t v17 = [NSString stringWithFormat:@"\nFile does not exist! Will attempt parent directory (%@)", v16];
          v7[2](v7, v11, v17);

          uint64_t v15 = v15 & (v22 == 0);
          v18 = [a1 _diagnosticInfoForPath:v16 includeFileSystemAttributes:v15 resolvedFileSystemAttributes:&v22];
          v7[2](v7, v16, v18);

          if (--v14 <= 0) {
            break;
          }

          id v19 = [MEMORY[0x1E4F28CB8] defaultManager];
          int v20 = [v19 fileExistsAtPath:v16];

          long long v11 = v16;
          if (v20) {
            goto LABEL_14;
          }
        }
        [NSString stringWithFormat:@"Gave up after exceeding maximum parent directory attempts (%@)", v16];
        int v21 = LABEL_12:;
        v7[2](v7, v11, v21);
      }
    }
    uint64_t v16 = v11;
LABEL_14:
  }
}

+ (id)accessibleURLOrParentForFileURL:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [v3 path];
  if ([v4 length])
  {
    uint64_t v5 = *MEMORY[0x1E4F8CEE0];
    while (1)
    {
      if (+[PLSandboxHelper processCanReadSandboxForPath:v4])
      {
        id v6 = [MEMORY[0x1E4F28CB8] defaultManager];
        int v7 = [v6 fileExistsAtPath:v4];

        if (v7)
        {
          long long v11 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v4];
          goto LABEL_16;
        }
      }
      uint64_t v8 = [v4 stringByDeletingLastPathComponent];
      if (![v8 length]) {
        break;
      }
      int v9 = [v8 isEqualToString:v4];
      if (v5 <= 0) {
        goto LABEL_12;
      }
      int v10 = v9;
      --v5;

      uint64_t v4 = v8;
      if (v10) {
        goto LABEL_11;
      }
    }
    if (v5 >= 1)
    {

LABEL_11:
      long long v11 = 0;
      uint64_t v4 = v8;
      goto LABEL_16;
    }
LABEL_12:
    long long v12 = PLBackendGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      char v13 = [v3 path];
      int v15 = 136446722;
      uint64_t v16 = "+[PLFileUtilities accessibleURLOrParentForFileURL:]";
      __int16 v17 = 2112;
      v18 = v13;
      __int16 v19 = 2112;
      int v20 = v4;
      _os_log_impl(&dword_19BCFB000, v12, OS_LOG_TYPE_ERROR, "%{public}s failed after exceeding maximum parent directory attempts on %@ [at path %@]", (uint8_t *)&v15, 0x20u);
    }
  }
  long long v11 = 0;
LABEL_16:

  return v11;
}

+ (id)_diagnosticInfoForPath:(id)a3 includeFileSystemAttributes:(BOOL)a4 resolvedFileSystemAttributes:(BOOL *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  int v9 = [MEMORY[0x1E4F28E78] string];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __99__PLFileUtilities__diagnosticInfoForPath_includeFileSystemAttributes_resolvedFileSystemAttributes___block_invoke;
  v23[3] = &unk_1E589FBB8;
  id v10 = v9;
  id v24 = v10;
  long long v11 = (void (**)(void, void, void, void))MEMORY[0x19F38F770](v23);
  id v22 = 0;
  long long v12 = [a1 _fileListingDetailsForPath:v8 error:&v22];
  id v13 = v22;
  ((void (**)(void, __CFString *, void *, id))v11)[2](v11, @"FILE LISTING DETAILS", v12, v13);

  id v21 = v13;
  uint64_t v14 = [a1 _attributeDetailsForPath:v8 ofFileSystem:0 error:&v21];
  id v15 = v21;

  ((void (**)(void, __CFString *, void *, id))v11)[2](v11, @"FILE ATTRIBUTE DETAILS", v14, v15);
  if (v6)
  {
    id v20 = v15;
    uint64_t v16 = [a1 _attributeDetailsForPath:v8 ofFileSystem:1 error:&v20];
    id v17 = v20;

    ((void (**)(void, __CFString *, void *, id))v11)[2](v11, @"FILE SYSTEM ATTRIBUTE DETAILS", v16, v17);
    if (a5 && v16) {
      *a5 = 1;
    }

    id v15 = v17;
  }
  id v18 = v10;

  return v18;
}

uint64_t __99__PLFileUtilities__diagnosticInfoForPath_includeFileSystemAttributes_resolvedFileSystemAttributes___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = *(void **)(a1 + 32);
  if (a3) {
    return [v4 appendFormat:@"%@:\n%@\n", a2, a3];
  }
  else {
    return [v4 appendFormat:@"%@: failed with error\n%@\n", a2, a4];
  }
}

+ (id)_attributeDetailsForPath:(id)a3 ofFileSystem:(BOOL)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v9 = v8;
  if (a4)
  {
    uint64_t v21 = 0;
    id v10 = (id *)&v21;
    uint64_t v11 = [v8 attributesOfFileSystemForPath:v7 error:&v21];
  }
  else
  {
    uint64_t v20 = 0;
    id v10 = (id *)&v20;
    uint64_t v11 = [v8 attributesOfItemAtPath:v7 error:&v20];
  }
  long long v12 = (void *)v11;
  id v13 = *v10;

  if (v12)
  {
    if ([v12 count])
    {
      uint64_t v14 = (void *)[@"empty" mutableCopy];
    }
    else
    {
      uint64_t v14 = [MEMORY[0x1E4F28E78] string];
    }
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __63__PLFileUtilities__attributeDetailsForPath_ofFileSystem_error___block_invoke;
    v18[3] = &unk_1E589FB90;
    id v15 = v14;
    id v19 = v15;
    [v12 enumerateKeysAndObjectsUsingBlock:v18];
  }
  else
  {
    id v15 = 0;
    if (a5) {
      *a5 = v13;
    }
  }
  id v16 = v15;

  return v16;
}

uint64_t __63__PLFileUtilities__attributeDetailsForPath_ofFileSystem_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) appendFormat:@"[%@] -> %@\n", a2, a3];
}

+ (id)_fileListingDetailsForPath:(id)a3 error:(id *)a4
{
  v15[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v15[0] = @"-l@a";
  v15[1] = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];
  id v13 = 0;
  id v14 = 0;
  id v8 = [a1 standardOutputStringForExecutablePath:@"/bin/ls" arguments:v7 environment:0 standardErrorOut:&v14 error:&v13];
  id v9 = v14;
  id v10 = v13;

  if (v8)
  {
    if ([v9 length])
    {
      uint64_t v11 = [NSString stringWithFormat:@"[stdout]:\n%@\n[stderr]:\n%@", v8, v9];

      id v8 = (void *)v11;
    }
  }
  else
  {
    id v8 = 0;
    if (a4) {
      *a4 = v10;
    }
  }

  return v8;
}

+ (id)standardOutputStringForExecutablePath:(id)a3 arguments:(id)a4 environment:(id)a5 standardErrorOut:(id *)a6 error:(id *)a7
{
  id v11 = a4;
  id v12 = a5;
  id v13 = (objc_class *)MEMORY[0x1E4F29038];
  id v14 = a3;
  id v15 = objc_alloc_init(v13);
  id v16 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v14];

  [v15 setExecutableURL:v16];
  id v17 = [MEMORY[0x1E4F28F48] pipe];
  [v15 setStandardOutput:v17];

  if (a6)
  {
    id v18 = [MEMORY[0x1E4F28F48] pipe];
    [v15 setStandardError:v18];
  }
  if (v11) {
    [v15 setArguments:v11];
  }
  if (v12) {
    [v15 setEnvironment:v12];
  }
  id v30 = 0;
  int v19 = [v15 launchAndReturnError:&v30];
  id v20 = v30;
  uint64_t v21 = v20;
  if (v19)
  {
    [v15 waitUntilExit];
    id v22 = [v15 standardOutput];
    BOOL v23 = [v22 fileHandleForReading];
    id v24 = [v23 readDataToEndOfFile];

    int v25 = (void *)[[NSString alloc] initWithData:v24 encoding:4];
    if (a6)
    {
      id v26 = [v15 standardError];
      uint64_t v27 = [v26 fileHandleForReading];
      uint64_t v28 = [v27 readDataToEndOfFile];

      *a6 = (id)[[NSString alloc] initWithData:v28 encoding:4];
    }
  }
  else
  {
    int v25 = 0;
    if (a7) {
      *a7 = v20;
    }
  }

  return v25;
}

+ (BOOL)filePath:(id)a3 isEqualToFilePath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 isEqualToString:v7])
  {
    char v8 = 1;
  }
  else
  {
    id v9 = [a1 realPathForPath:v7 error:0];
    if (v9)
    {
      id v10 = [a1 realPathForPath:v6 error:0];
      char v8 = [v10 isEqualToString:v9];
    }
    else
    {
      char v8 = 0;
    }
  }
  return v8;
}

+ (BOOL)filePath:(id)a3 hasPrefix:(id)a4
{
  id v6 = a3;
  id v7 = [a1 realPathForPath:a4 error:0];
  if (v7)
  {
    char v8 = [a1 realPathForPath:v6 error:0];
    char v9 = [v8 hasPrefix:v7];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

+ (id)realURLForURL:(id)a3 error:(id *)a4
{
  id v6 = [a3 path];
  id v7 = [a1 realPathForPath:v6 error:a4];

  if (v7)
  {
    char v8 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v7];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

+ (BOOL)fileURL:(id)a3 isEqualToFileURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  char v8 = v7;
  if (v6 == v7)
  {
    char v9 = 1;
  }
  else
  {
    char v9 = 0;
    if (v6 && v7)
    {
      id v10 = [v6 path];
      id v11 = [v8 path];
      if ([v10 isEqualToString:v11]) {
        char v9 = 1;
      }
      else {
        char v9 = [a1 filePath:v10 isEqualToFilePath:v11];
      }
    }
  }

  return v9;
}

+ (BOOL)stripImmutableFlagIfNecessaryFromFileAtPath:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    id v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, a1, @"PLFileUtilities.m", 969, @"Invalid parameter not satisfying: %@", @"path" object file lineNumber description];
  }
  id v6 = v5;
  id v7 = (const char *)[v6 fileSystemRepresentation];
  memset(&v19, 0, sizeof(v19));
  if (stat(v7, &v19))
  {
    char v8 = PLBackendGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      char v9 = __error();
      id v10 = strerror(*v9);
      *(_DWORD *)buf = 138412546;
      id v21 = v6;
      __int16 v22 = 2082;
      BOOL v23 = v10;
      id v11 = "Failed to stat %@ (%{public}s).";
LABEL_6:
      _os_log_impl(&dword_19BCFB000, v8, OS_LOG_TYPE_ERROR, v11, buf, 0x16u);
    }
  }
  else
  {
    if ((v19.st_flags & 2) == 0)
    {
      BOOL v12 = 0;
      goto LABEL_9;
    }
    int v14 = chflags(v7, v19.st_flags & 0xFFFFFFFD);
    id v15 = PLBackendGetLog();
    char v8 = v15;
    if (!v14)
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v21 = v6;
        _os_log_impl(&dword_19BCFB000, v8, OS_LOG_TYPE_DEFAULT, "Cleared IMMUTABLE flag from %@", buf, 0xCu);
      }
      BOOL v12 = 1;
      goto LABEL_8;
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      id v16 = __error();
      id v17 = strerror(*v16);
      *(_DWORD *)buf = 138412546;
      id v21 = v6;
      __int16 v22 = 2082;
      BOOL v23 = v17;
      id v11 = "Failed to clear IMMUTABLE flag on %@ (%{public}s).";
      goto LABEL_6;
    }
  }
  BOOL v12 = 0;
LABEL_8:

LABEL_9:
  return v12;
}

+ (int64_t)fileLengthForFilePath:(id)a3
{
  if (!a3) {
    return 0;
  }
  memset(&v4, 0, sizeof(v4));
  if (stat((const char *)objc_msgSend(a3, "fileSystemRepresentation", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0), &v4))
  {
    return 0;
  }
  else
  {
    return v4.st_size;
  }
}

+ (BOOL)changeFileOwnerToMobileAtPath:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = objc_opt_class();
  id v7 = [MEMORY[0x1E4F28CB8] defaultManager];
  LOBYTE(a4) = [v6 changeFileOwnerToMobileAtPath:v5 error:a4 usingFileManager:v7];

  return (char)a4;
}

+ (BOOL)changeFileOwnerToMobileAtPath:(id)a3 error:(id *)a4 usingFileManager:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  if (getuid() && geteuid())
  {
    char v9 = 1;
  }
  else
  {
    id v10 = [(id)objc_opt_class() _mobileOwnerAttributes];
    id v13 = 0;
    char v9 = [v8 setAttributes:v10 ofItemAtPath:v7 error:&v13];
    id v11 = v13;

    if (a4 && (v9 & 1) == 0) {
      *a4 = v11;
    }
  }
  return v9;
}

+ (BOOL)isFileExistsError:(id)a3
{
  id v3 = a3;
  stat v4 = [v3 domain];
  if ([v4 isEqualToString:*MEMORY[0x1E4F281F8]])
  {
    uint64_t v5 = [v3 code];

    if (v5 == 516)
    {
      BOOL v6 = 1;
      goto LABEL_9;
    }
  }
  else
  {
  }
  id v7 = PLUnderlyingPOSIXError(v3);
  id v8 = v7;
  if (v7) {
    BOOL v6 = [v7 code] == 17;
  }
  else {
    BOOL v6 = 0;
  }

LABEL_9:
  return v6;
}

+ (BOOL)setFileCreationDate:(id)a3 forFileURL:(id)a4 error:(id *)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = (__CFString *)a4;
  id v9 = (id)*MEMORY[0x1E4F28310];
  id v10 = PLBackendGetLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v11 = v9 == (id)*MEMORY[0x1E4F282C0];
    *(_DWORD *)buf = 138543874;
    if (v11) {
      BOOL v12 = @"creation";
    }
    else {
      BOOL v12 = @"modification";
    }
    uint64_t v24 = v12;
    __int16 v25 = 2112;
    id v26 = v7;
    __int16 v27 = 2112;
    uint64_t v28 = v8;
    _os_log_impl(&dword_19BCFB000, v10, OS_LOG_TYPE_DEFAULT, "Setting file %{public}@ date to %@ on %@", buf, 0x20u);
  }

  id v21 = v9;
  id v22 = v7;
  id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v22 forKeys:&v21 count:1];
  int v14 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v15 = [(__CFString *)v8 path];
  id v20 = 0;
  char v16 = [v14 setAttributes:v13 ofItemAtPath:v15 error:&v20];
  id v17 = v20;

  if ((v16 & 1) == 0)
  {
    id v18 = PLBackendGetLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v24 = v8;
      __int16 v25 = 2112;
      id v26 = v17;
      _os_log_impl(&dword_19BCFB000, v18, OS_LOG_TYPE_ERROR, "Could not set file creation date on %@, error: %@", buf, 0x16u);
    }
  }
  if (a5) {
    *a5 = v17;
  }

  return v16;
}

+ (id)hasDiskSpaceToCopyFileAtURL:(id)a3 toVolumeAtURL:(id)a4 error:(id *)a5
{
  v50[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  BOOL v11 = v10;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
  }
  else
  {
    id v41 = [MEMORY[0x1E4F28B00] currentHandler];
    [v41 handleFailureInMethod:a2, a1, @"PLFileUtilities.m", 818, @"Invalid parameter not satisfying: %@", @"fileURL" object file lineNumber description];

    if (v11) {
      goto LABEL_3;
    }
  }
  v42 = [MEMORY[0x1E4F28B00] currentHandler];
  [v42 handleFailureInMethod:a2, a1, @"PLFileUtilities.m", 819, @"Invalid parameter not satisfying: %@", @"destinationURL" object file lineNumber description];

LABEL_3:
  BOOL v12 = [a1 fileManager];
  id v13 = [v9 path];
  id v45 = 0;
  int v14 = [v12 attributesOfItemAtPath:v13 error:&v45];
  id v15 = v45;

  char v16 = (void *)MGCopyAnswer();
  id v17 = [v16 objectForKey:*MEMORY[0x1E4FBA0D8]];
  unint64_t v18 = [v17 longLongValue];

  uint64_t v19 = *MEMORY[0x1E4F28390];
  id v20 = [v14 objectForKeyedSubscript:*MEMORY[0x1E4F28390]];
  unint64_t v21 = [v20 unsignedLongLongValue];

  if (v18 > v21)
  {
    id v22 = (id)MEMORY[0x1E4F1CC38];
    goto LABEL_22;
  }
  BOOL v23 = [a1 accessibleURLOrParentForFileURL:v11];
  if (!v23)
  {
    id v27 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:256 userInfo:0];
LABEL_11:
    __int16 v34 = PLBackendGetLog();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      [v11 path];
      statfs v36 = v35 = a5;
      *(_DWORD *)buf = 138412546;
      long long v47 = v36;
      __int16 v48 = 2112;
      id v49 = v27;
      _os_log_impl(&dword_19BCFB000, v34, OS_LOG_TYPE_ERROR, "Failed to retrieve volume attributes for %@, %@", buf, 0x16u);

      a5 = v35;
    }

    if (a5)
    {
      id v27 = v27;
      uint64_t v28 = 0;
      v33 = 0;
      *a5 = v27;
      goto LABEL_21;
    }
    uint64_t v28 = 0;
LABEL_16:
    v33 = 0;
    goto LABEL_21;
  }
  v43 = a5;
  v50[0] = *MEMORY[0x1E4F1C800];
  uint64_t v24 = v50[0];
  __int16 v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v50 count:1];
  id v44 = 0;
  id v26 = [v23 resourceValuesForKeys:v25 error:&v44];
  id v27 = v44;

  uint64_t v28 = [v26 objectForKeyedSubscript:v24];

  if (!v28)
  {
    a5 = v43;
    goto LABEL_11;
  }
  uint64_t v29 = v43;
  if (!v14)
  {
    uint64_t v37 = PLBackendGetLog();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      BOOL v38 = [v9 path];
      *(_DWORD *)buf = 138412546;
      long long v47 = v38;
      __int16 v48 = 2112;
      id v49 = v15;
      _os_log_impl(&dword_19BCFB000, v37, OS_LOG_TYPE_ERROR, "Failed to retrieve file attributes for %@, %@", buf, 0x16u);

      uint64_t v29 = v43;
    }

    if (v29)
    {
      id v39 = v15;
      v33 = 0;
      *uint64_t v29 = v39;
      goto LABEL_21;
    }
    goto LABEL_16;
  }
  unint64_t v30 = [v28 unsignedLongLongValue];
  id v31 = [v14 objectForKeyedSubscript:v19];
  BOOL v32 = v30 > [v31 unsignedLongLongValue];

  v33 = [MEMORY[0x1E4F28ED0] numberWithBool:v32];
LABEL_21:
  id v22 = v33;

LABEL_22:
  return v22;
}

+ (BOOL)stripExtendedAttributesFromFileAtURL:(id)a3 inDomain:(id)a4 error:(id *)a5
{
  v95[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  if (!v9)
  {
    v71 = [MEMORY[0x1E4F28B00] currentHandler];
    [v71 handleFailureInMethod:a2, a1, @"PLFileUtilities.m", 717, @"Invalid parameter not satisfying: %@", @"fileURL" object file lineNumber description];
  }
  BOOL v11 = (void *)MEMORY[0x19F38F510]();
  id v12 = [v9 path];
  id v13 = (const char *)[v12 fileSystemRepresentation];

  int v14 = open(v13, 2097154);
  int v15 = v14;
  if ((v14 & 0x80000000) == 0)
  {
    ssize_t v16 = flistxattr(v14, 0, 0, 0);
    if (v16 < 0)
    {
      v76 = v11;
      id v77 = v10;
      id v31 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v32 = *MEMORY[0x1E4F28798];
      uint64_t v33 = *__error();
      v92[0] = @"path";
      __int16 v34 = [v9 path];
      v92[1] = @"description";
      v93[0] = v34;
      v93[1] = @"Unable to get extended attributes";
      v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v93 forKeys:v92 count:2];
      id v17 = [v31 errorWithDomain:v32 code:v33 userInfo:v35];

      statfs v36 = PLBackendGetLog();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        uint64_t v37 = [v9 path];
        BOOL v38 = __error();
        id v39 = strerror(*v38);
        *(_DWORD *)buf = 138412802;
        v81 = @"Unable to get extended attributes";
        __int16 v82 = 2112;
        v83 = v37;
        __int16 v84 = 2080;
        v85 = v39;
        _os_log_impl(&dword_19BCFB000, v36, OS_LOG_TYPE_ERROR, "%@ for '%@' (%s).", buf, 0x20u);
      }
      close(v15);
      BOOL v30 = 0;
    }
    else
    {
      id v17 = (void *)v16;
      if (!v16)
      {
        BOOL v30 = 1;
        goto LABEL_43;
      }
      v76 = v11;
      id v18 = [MEMORY[0x1E4F1CA58] dataWithLength:v16];
      v75 = a5;
      id v77 = v10;
      if ((void *)flistxattr(v15, (char *)[v18 mutableBytes], objc_msgSend(v18, "length"), 0) == v17)
      {
        v72 = v9;
        int fd = v15;
        if (v10 && [v10 length])
        {
          uint64_t v19 = (const char *)[v10 UTF8String];
          id v20 = v19;
          if (v19)
          {
            size_t v21 = strlen(v19);
            goto LABEL_24;
          }
        }
        else
        {
          id v20 = 0;
        }
        size_t v21 = 0;
LABEL_24:
        v74 = [MEMORY[0x1E4F1CA48] array];
        uint64_t v49 = 0;
        int v50 = 0;
        char v73 = 1;
        do
        {
          id v51 = v18;
          uint64_t v52 = [v51 bytes];
          __int16 v53 = (const char *)(v52 + v49);
          size_t v54 = strnlen((const char *)(v52 + v49), (size_t)v17 - v49);
          if (!v54) {
            break;
          }
          size_t v55 = v54;
          if (!v21 || !strncmp(v53, v20, v21))
          {
            id v56 = v18;
            uint64_t v57 = v20;
            v58 = [NSString stringWithUTF8String:v53];
            uint64_t v59 = v58;
            if (v58)
            {
              if ([v58 length])
              {
                id v60 = v59;
                if (fremovexattr(fd, (const char *)[v60 UTF8String], 0) < 0)
                {
                  int v61 = *__error();
                  if (v61 != 93)
                  {
                    if (!v50) {
                      int v50 = v61;
                    }
                    [v74 addObject:v60];
                    char v73 = 0;
                  }
                }
              }
            }

            id v20 = v57;
            id v18 = v56;
          }
          v49 += v55 + 1;
        }
        while (v49 < (uint64_t)v17);
        if (v73)
        {
          id v17 = 0;
          BOOL v30 = 1;
          id v9 = v72;
        }
        else
        {
          id v62 = (void *)MEMORY[0x1E4F28C58];
          int v63 = v50;
          uint64_t v64 = *MEMORY[0x1E4F28798];
          uint64_t v65 = v50;
          v88[0] = @"path";
          id v9 = v72;
          double v66 = [v72 path];
          v89[0] = v66;
          v89[1] = @"Failed to remove extended attributes";
          v88[1] = @"description";
          v88[2] = @"keys";
          v89[2] = v74;
          id v67 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v89 forKeys:v88 count:3];
          id v17 = [v62 errorWithDomain:v64 code:v65 userInfo:v67];

          v68 = PLBackendGetLog();
          if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
          {
            v69 = [v72 path];
            *(_DWORD *)buf = 138413058;
            v81 = @"Failed to remove extended attributes";
            __int16 v82 = 2112;
            v83 = v69;
            __int16 v84 = 2080;
            v85 = strerror(v63);
            __int16 v86 = 2112;
            v87 = v74;
            _os_log_impl(&dword_19BCFB000, v68, OS_LOG_TYPE_ERROR, "%@ for '%@' (%s): %@.", buf, 0x2Au);
          }
          BOOL v30 = 0;
        }
        BOOL v11 = v76;
        int v15 = fd;

        a5 = v75;
        id v10 = v77;
        goto LABEL_43;
      }
      v40 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v41 = *MEMORY[0x1E4F28798];
      uint64_t v42 = *__error();
      v90[0] = @"path";
      v43 = [v9 path];
      v90[1] = @"description";
      v91[0] = v43;
      v91[1] = @"Failed to read extended attributes";
      id v44 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v91 forKeys:v90 count:2];
      id v17 = [v40 errorWithDomain:v41 code:v42 userInfo:v44];

      id v45 = PLBackendGetLog();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      {
        long long v46 = [v9 path];
        long long v47 = __error();
        __int16 v48 = strerror(*v47);
        *(_DWORD *)buf = 138412802;
        v81 = @"Failed to read extended attributes";
        __int16 v82 = 2112;
        v83 = v46;
        __int16 v84 = 2080;
        v85 = v48;
        _os_log_impl(&dword_19BCFB000, v45, OS_LOG_TYPE_ERROR, "%@ for '%@' (%s).", buf, 0x20u);
      }
      close(v15);

      BOOL v30 = 0;
      a5 = v75;
    }
    BOOL v11 = v76;
    id v10 = v77;
    goto LABEL_43;
  }
  int fda = v14;
  id v22 = v11;
  BOOL v23 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v24 = *MEMORY[0x1E4F28798];
  uint64_t v25 = *__error();
  v94 = @"path";
  id v26 = [v9 path];
  v95[0] = v26;
  id v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v95 forKeys:&v94 count:1];
  id v17 = [v23 errorWithDomain:v24 code:v25 userInfo:v27];

  uint64_t v28 = PLBackendGetLog();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
  {
    uint64_t v29 = [v9 path];
    *(_DWORD *)buf = 138412546;
    v81 = v29;
    __int16 v82 = 2112;
    v83 = v17;
    _os_log_impl(&dword_19BCFB000, v28, OS_LOG_TYPE_ERROR, "Unable to open file '%@' %@", buf, 0x16u);
  }
  BOOL v30 = 0;
  BOOL v11 = v22;
  int v15 = fda;
LABEL_43:
  close(v15);
  if (a5 && v17) {
    *a5 = v17;
  }

  return v30;
}

+ (BOOL)ingestItemAtURL:(id)a3 toURL:(id)a4 type:(int64_t)a5 options:(unint64_t)a6 capabilities:(id)a7 error:(id *)a8
{
  uint64_t v87 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v64 = a7;
  int v15 = PLAssetImportGetLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    ssize_t v16 = +[PLFileUtilities descriptionForFileIngestionType:a5];
    *(_DWORD *)buf = 138413058;
    id v80 = v13;
    __int16 v81 = 2112;
    id v82 = v14;
    __int16 v83 = 2112;
    __int16 v84 = v16;
    __int16 v85 = 2048;
    unint64_t v86 = a6;
    _os_log_impl(&dword_19BCFB000, v15, OS_LOG_TYPE_DEFAULT, "Ingesting %@ to %@ with ingestion type %@ option %lu", buf, 0x2Au);
  }
  uint64_t v65 = v13;

  if (!a5 || (a6 & 4) == 0)
  {
LABEL_7:
    id v20 = 0;
    id v21 = 0;
    if ((a6 & 8) == 0) {
      goto LABEL_21;
    }
    goto LABEL_17;
  }
  id v17 = [a1 fileManager];
  id v74 = 0;
  char v18 = [v17 removeItemAtURL:v14 error:&v74];
  id v19 = v74;

  if (v18)
  {

    goto LABEL_7;
  }
  id v22 = [v19 userInfo];
  BOOL v23 = [v22 objectForKey:*MEMORY[0x1E4F28A50]];

  uint64_t v24 = [v23 domain];
  if ([v24 isEqualToString:*MEMORY[0x1E4F28798]])
  {
    uint64_t v25 = [v23 code];

    if (v25 == 2)
    {
      id v21 = 0;
      int v26 = 1;
      goto LABEL_14;
    }
  }
  else
  {
  }
  id v21 = v19;
  int v26 = 0;
LABEL_14:

  if ((a6 & 8) == 0 || (v26 & 1) == 0)
  {
    if (v26) {
      goto LABEL_21;
    }
    goto LABEL_50;
  }
  id v20 = v21;
LABEL_17:
  id v27 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v28 = [v14 path];
  uint64_t v29 = [v28 stringByDeletingLastPathComponent];
  id v73 = 0;
  char v30 = [v27 createDirectoryAtPath:v29 withIntermediateDirectories:1 attributes:0 error:&v73];
  id v21 = v73;

  if (v30)
  {

    id v21 = v20;
LABEL_21:
    id v31 = v65;
    switch(a5)
    {
      case 0:
        uint64_t v32 = [v65 path];
        id v72 = 0;
        id v62 = [a1 realPathForPath:v32 error:&v72];
        id v33 = v72;

        __int16 v34 = [v14 path];
        id v71 = v33;
        v35 = [a1 realPathForPath:v34 error:&v71];
        id v36 = v71;

        uint64_t v37 = v62;
        if (v62 && v35)
        {
          if ([v62 isEqual:v35])
          {
            int v38 = 1;
LABEL_36:

            goto LABEL_37;
          }
          id v60 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v44 = *MEMORY[0x1E4F281F8];
          id v77 = @"reason";
          uint64_t v61 = [NSString stringWithFormat:@"Invalid file names are not equal"];
          uint64_t v78 = v61;
          id v45 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v78 forKeys:&v77 count:1];
          id v43 = [v60 errorWithDomain:v44 code:258 userInfo:v45];

          id v21 = (id)v61;
        }
        else
        {
          id v43 = v36;
        }

        int v38 = 0;
        id v21 = v43;
        uint64_t v37 = v62;
        goto LABEL_36;
      case 1:
        id v70 = v21;
        int v38 = [a1 copyItemAtURL:v65 toURL:v14 error:&v70];
        id v39 = v70;
        goto LABEL_32;
      case 2:
        id v36 = [v65 path];
        v40 = [v14 path];
        id v69 = v21;
        int v38 = [a1 cloneFileAtPath:v36 toPath:v40 error:&v69];
        id v41 = v69;

        id v21 = v41;
        goto LABEL_37;
      case 3:
        id v36 = [a1 fileManager];
        id v68 = v21;
        int v38 = [v36 moveItemAtURL:v65 toURL:v14 error:&v68];
        id v42 = v68;

        id v21 = v42;
        goto LABEL_37;
      case 4:
        id v67 = v21;
        int v38 = [a1 secureMoveItemAtURL:v65 toURL:v14 capabilities:v64 error:&v67];
        id v39 = v67;
LABEL_32:
        id v36 = v21;
        id v21 = v39;
LABEL_37:

        if (a6) {
          goto LABEL_38;
        }
        goto LABEL_40;
      default:
        int v38 = 1;
        if ((a6 & 1) == 0) {
          goto LABEL_40;
        }
LABEL_38:
        if (v38) {
          [a1 stripExtendedAttributesFromFileAtURL:v14 inDomain:@"com.apple.assetsd" error:0];
        }
LABEL_40:
        char v46 = v38 ^ 1;
        if ((a6 & 2) == 0) {
          char v46 = 1;
        }
        if (v46)
        {
          if ((v38 & 1) == 0) {
            goto LABEL_50;
          }
        }
        else
        {
          long long v47 = [a1 fileManager];
          uint64_t v75 = *MEMORY[0x1E4F28370];
          uint64_t v76 = *MEMORY[0x1E4F28358];
          __int16 v48 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v76 forKeys:&v75 count:1];
          uint64_t v49 = [v14 path];
          id v66 = 0;
          char v50 = [v47 setAttributes:v48 ofItemAtPath:v49 error:&v66];
          id v51 = v66;

          if ((v50 & 1) == 0)
          {
            uint64_t v52 = PLBackendGetLog();
            if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
            {
              __int16 v53 = [v14 path];
              *(_DWORD *)buf = 138412546;
              id v80 = v53;
              __int16 v81 = 2112;
              id v82 = v51;
              _os_log_impl(&dword_19BCFB000, v52, OS_LOG_TYPE_ERROR, "Failed to assign data protection to %@, %@", buf, 0x16u);
            }
          }
        }
        BOOL v54 = 1;
        goto LABEL_55;
    }
  }

LABEL_50:
  id v31 = v65;
  if (a8)
  {
    id v21 = v21;
    BOOL v54 = 0;
    *a8 = v21;
  }
  else
  {
    size_t v55 = PLBackendGetLog();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
    {
      id v56 = +[PLFileUtilities descriptionForFileIngestionType:a5];
      uint64_t v57 = [v65 path];
      v58 = [v14 path];
      *(_DWORD *)buf = 138413058;
      id v80 = v56;
      __int16 v81 = 2112;
      id v82 = v57;
      __int16 v83 = 2112;
      __int16 v84 = v58;
      __int16 v85 = 2112;
      unint64_t v86 = (unint64_t)v21;
      _os_log_impl(&dword_19BCFB000, v55, OS_LOG_TYPE_ERROR, "Failed to %@ %@ to %@: %@", buf, 0x2Au);
    }
    BOOL v54 = 0;
  }
LABEL_55:

  return v54;
}

+ (id)descriptionForFileIngestionType:(int64_t)a3
{
  if ((unint64_t)a3 > 4) {
    return @"unknown";
  }
  else {
    return off_1E589FC20[a3];
  }
}

+ (BOOL)removeDisconnectedSQLiteDatabaseFileWithPath:(id)a3 error:(id *)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [a1 fileManager];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v8 = [&unk_1EEC14FB0 countByEnumeratingWithState:&v24 objects:v34 count:16];
  if (v8)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(void *)v25;
    char v12 = 1;
    *(void *)&long long v9 = 136446722;
    long long v22 = v9;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v25 != v11) {
          objc_enumerationMutation(&unk_1EEC14FB0);
        }
        id v14 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        id v15 = v6;
        if ([v14 length])
        {
          uint64_t v16 = [v15 stringByAppendingString:v14];

          id v15 = (id)v16;
        }
        id v23 = 0;
        char v17 = objc_msgSend(v7, "removeItemAtPath:error:", v15, &v23, v22);
        id v18 = v23;
        id v19 = v18;
        if ((v17 & 1) == 0 && [v18 code] != 4)
        {
          if (a4 != 0 && (v12 & 1) != 0) {
            *a4 = v19;
          }
          id v20 = PLBackendGetLog();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v22;
            uint64_t v29 = "+[PLFileUtilities removeDisconnectedSQLiteDatabaseFileWithPath:error:]";
            __int16 v30 = 2112;
            id v31 = v15;
            __int16 v32 = 2114;
            id v33 = v19;
            _os_log_impl(&dword_19BCFB000, v20, OS_LOG_TYPE_ERROR, "%{public}s failed to remove %@ [%{public}@]", buf, 0x20u);
          }

          char v12 = 0;
        }
      }
      uint64_t v10 = [&unk_1EEC14FB0 countByEnumeratingWithState:&v24 objects:v34 count:16];
    }
    while (v10);
  }
  else
  {
    char v12 = 1;
  }

  return v12 & 1;
}

+ (BOOL)removeItemAtURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [a1 fileManager];
  id v14 = 0;
  char v8 = [v7 removeItemAtURL:v6 error:&v14];

  id v9 = v14;
  if (v8) {
    goto LABEL_4;
  }
  if (PLIsErrorFileNotFound(v9))
  {

    id v9 = 0;
LABEL_4:
    id v10 = v9;
    BOOL v11 = 1;
    goto LABEL_5;
  }
  id v13 = v9;
  id v10 = v13;
  if (a4)
  {
    id v10 = v13;
    BOOL v11 = 0;
    *a4 = v10;
  }
  else
  {
    BOOL v11 = 0;
  }
LABEL_5:

  return v11;
}

+ (BOOL)removeItemAtPath:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [a1 fileManager];
  id v14 = 0;
  char v8 = [v7 removeItemAtPath:v6 error:&v14];

  id v9 = v14;
  if (v8) {
    goto LABEL_4;
  }
  if (PLIsErrorFileNotFound(v9))
  {

    id v9 = 0;
LABEL_4:
    id v10 = v9;
    BOOL v11 = 1;
    goto LABEL_5;
  }
  id v13 = v9;
  id v10 = v13;
  if (a4)
  {
    id v10 = v13;
    BOOL v11 = 0;
    *a4 = v10;
  }
  else
  {
    BOOL v11 = 0;
  }
LABEL_5:

  return v11;
}

+ (BOOL)removeFilesInDirectoryAtURL:(id)a3 withPrefix:(id)a4 error:(id *)a5 progress:(id)a6
{
  v62[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  id v12 = v9;
  id v13 = (const char *)[v12 fileSystemRepresentation];
  id v14 = v10;
  uint64_t v15 = [v14 UTF8String];
  if (!v14 || (uint64_t v16 = (const char *)v15, ![v14 length]))
  {
    uint64_t v28 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v29 = *MEMORY[0x1E4F28798];
    uint64_t v61 = *MEMORY[0x1E4F28228];
    v62[0] = @"nil or empty prefix not supported";
    __int16 v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v62 forKeys:&v61 count:1];
    id v31 = v28;
    uint64_t v32 = v29;
    uint64_t v33 = 22;
    goto LABEL_23;
  }
  char v17 = opendir(v13);
  if (!v17)
  {
    char v46 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v47 = *MEMORY[0x1E4F28798];
    uint64_t v48 = *__error();
    uint64_t v49 = *MEMORY[0x1E4F289D0];
    v59[0] = *MEMORY[0x1E4F28228];
    v59[1] = v49;
    v60[0] = @"error opening directory";
    v60[1] = v12;
    __int16 v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v60 forKeys:v59 count:2];
    id v31 = v46;
    uint64_t v32 = v47;
    uint64_t v33 = v48;
LABEL_23:
    id v34 = [v31 errorWithDomain:v32 code:v33 userInfo:v30];
    if (a5) {
      *a5 = v34;
    }
    goto LABEL_32;
  }
  id v18 = v17;
  uint64_t v52 = a5;
  id v19 = [v12 path];
  char v20 = [v19 hasSuffix:@"/"];

  if ((v20 & 1) == 0)
  {
    __strlcpy_chk();
    __strlcat_chk();
  }
  unsigned int v21 = 0;
  unsigned int v22 = 0;
  unsigned int v23 = 0;
LABEL_7:
  unsigned int v51 = v23;
  unsigned int v53 = v21;
  while (1)
  {
    long long v24 = readdir(v18);
    if (!v24) {
      break;
    }
    d_name = v24->d_name;
    int d_type = v24->d_type;
    if (d_type == 4)
    {
      if (strcmp(v24->d_name, ".") && strcmp(d_name, "..")) {
        goto LABEL_15;
      }
    }
    else
    {
      if (d_type == 8)
      {
        size_t v27 = strlen(v16);
        if (!strncmp(d_name, v16, v27))
        {
          __strlcpy_chk();
          __strlcat_chk();
          if (unlink(v58))
          {
            closedir(v18);
            uint64_t v35 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v36 = *MEMORY[0x1E4F28798];
            uint64_t v37 = *__error();
            uint64_t v50 = *MEMORY[0x1E4F28328];
            v56[0] = *MEMORY[0x1E4F28228];
            v56[1] = v50;
            v57[0] = @"error unlinking path";
            __int16 v30 = [NSString stringWithUTF8String:v58];
            v57[1] = v30;
            id v39 = (void *)MEMORY[0x1E4F1C9E8];
            v40 = v57;
            id v41 = v56;
            goto LABEL_29;
          }
          unsigned int v23 = v51;
          if (v53 + 1 - v51 >= 0x2711) {
            unsigned int v23 = v53 + 1;
          }
          unsigned int v21 = v53 + 1;
          if (v53 + 1 - v51 >= 0x2711)
          {
            unsigned int v21 = v53 + 1;
            if (v11)
            {
              (*((void (**)(id, void, void))v11 + 2))(v11, v53 + 1, v22);
              unsigned int v21 = v53 + 1;
              unsigned int v23 = v53 + 1;
            }
          }
          goto LABEL_7;
        }
      }
LABEL_15:
      ++v22;
    }
  }
  closedir(v18);
  if (v11) {
    (*((void (**)(id, void, void))v11 + 2))(v11, v53, v22);
  }
  if (!rmdir(v13))
  {
    BOOL v44 = 1;
    goto LABEL_33;
  }
  uint64_t v35 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v36 = *MEMORY[0x1E4F28798];
  uint64_t v37 = *__error();
  uint64_t v38 = *MEMORY[0x1E4F28328];
  v54[0] = *MEMORY[0x1E4F28228];
  v54[1] = v38;
  v55[0] = @"error removing directory";
  __int16 v30 = [NSString stringWithUTF8String:v13];
  v55[1] = v30;
  id v39 = (void *)MEMORY[0x1E4F1C9E8];
  v40 = v55;
  id v41 = v54;
LABEL_29:
  id v42 = [v39 dictionaryWithObjects:v40 forKeys:v41 count:2];
  id v43 = [v35 errorWithDomain:v36 code:v37 userInfo:v42];
  if (v52) {
    *uint64_t v52 = v43;
  }

LABEL_32:
  BOOL v44 = 0;
LABEL_33:

  return v44;
}

+ (int64_t)directoryEntryCountAtURL:(id)a3 error:(id *)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  memset(&v45, 0, 512);
  id v5 = a3;
  id v6 = (const char *)[v5 fileSystemRepresentation];
  if (!statfs(v6, &v45))
  {
    memset(v36, 0, 44);
    long long v34 = xmmword_19BDC7320;
    uint64_t v35 = 0;
    if (getattrlist(v45.f_mntonname, &v34, v36, 0x2CuLL, 0))
    {
      uint64_t v16 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v17 = *MEMORY[0x1E4F28798];
      uint64_t v18 = *__error();
      uint64_t v19 = *MEMORY[0x1E4F28328];
      v41[0] = *MEMORY[0x1E4F28228];
      v41[1] = v19;
      v42[0] = @"error finding volume capabilities";
      id v14 = [NSString stringWithUTF8String:v45.f_mntonname];
      v42[1] = v14;
      char v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v42 forKeys:v41 count:2];
      unsigned int v21 = v16;
      uint64_t v22 = v17;
      uint64_t v23 = v18;
    }
    else
    {
      if ((v36[2] & 2) != 0)
      {
        uint64_t v33 = 0;
        long long v32 = xmmword_19BDC7338;
        uint64_t v31 = 0;
        if (!getattrlist(v6, &v32, &v31, 8uLL, 0))
        {
          int64_t v28 = HIDWORD(v31);
          goto LABEL_13;
        }
        id v7 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v8 = *MEMORY[0x1E4F28798];
        uint64_t v9 = *__error();
        uint64_t v30 = *MEMORY[0x1E4F289D0];
        v37[0] = *MEMORY[0x1E4F28228];
        v37[1] = v30;
        v38[0] = @"error finding directory entry count";
        v38[1] = v5;
        id v11 = (void *)MEMORY[0x1E4F1C9E8];
        id v12 = v38;
        id v13 = v37;
        goto LABEL_3;
      }
      long long v24 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v25 = *MEMORY[0x1E4F28798];
      uint64_t v26 = *MEMORY[0x1E4F28328];
      v39[0] = *MEMORY[0x1E4F28228];
      v39[1] = v26;
      v40[0] = @"volume does not support ATTR_DIR_ENTRYCOUNT";
      id v14 = [NSString stringWithUTF8String:v45.f_mntonname];
      v40[1] = v14;
      char v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:v39 count:2];
      unsigned int v21 = v24;
      uint64_t v22 = v25;
      uint64_t v23 = 45;
    }
    id v27 = [v21 errorWithDomain:v22 code:v23 userInfo:v20];
    if (a4) {
      *a4 = v27;
    }

    goto LABEL_12;
  }
  id v7 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v8 = *MEMORY[0x1E4F28798];
  uint64_t v9 = *__error();
  uint64_t v10 = *MEMORY[0x1E4F289D0];
  v43[0] = *MEMORY[0x1E4F28228];
  v43[1] = v10;
  v44[0] = @"error finding volume info";
  v44[1] = v5;
  id v11 = (void *)MEMORY[0x1E4F1C9E8];
  id v12 = v44;
  id v13 = v43;
LABEL_3:
  id v14 = [v11 dictionaryWithObjects:v12 forKeys:v13 count:2];
  id v15 = [v7 errorWithDomain:v8 code:v9 userInfo:v14];
  if (a4) {
    *a4 = v15;
  }
LABEL_12:

  int64_t v28 = -1;
LABEL_13:

  return v28;
}

+ (BOOL)copyItemAtURL:(id)a3 toURL:(id)a4 error:(id *)a5
{
  v29[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = v10;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
  }
  else
  {
    unsigned int v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, a1, @"PLFileUtilities.m", 414, @"Invalid parameter not satisfying: %@", @"fromURL" object file lineNumber description];

    if (v11) {
      goto LABEL_3;
    }
  }
  uint64_t v22 = [MEMORY[0x1E4F28B00] currentHandler];
  [v22 handleFailureInMethod:a2, a1, @"PLFileUtilities.m", 415, @"Invalid parameter not satisfying: %@", @"toURL" object file lineNumber description];

LABEL_3:
  id v12 = [a1 fileManager];
  int v13 = [v12 copyItemAtURL:v9 toURL:v11 error:a5];
  if (v13)
  {
    uint64_t v28 = *MEMORY[0x1E4F28370];
    v29[0] = *MEMORY[0x1E4F28358];
    id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:&v28 count:1];
    id v15 = [v11 path];
    id v23 = 0;
    char v16 = [v12 setAttributes:v14 ofItemAtPath:v15 error:&v23];
    id v17 = v23;

    if ((v16 & 1) == 0)
    {
      uint64_t v18 = PLBackendGetLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        uint64_t v19 = [v11 path];
        *(_DWORD *)buf = 138412546;
        uint64_t v25 = v19;
        __int16 v26 = 2112;
        id v27 = v17;
        _os_log_impl(&dword_19BCFB000, v18, OS_LOG_TYPE_ERROR, "Unable to assign data protection after move to %@: %@", buf, 0x16u);
      }
    }
  }
  return v13;
}

+ (BOOL)cloneFileAtPath:(id)a3 toPath:(id)a4 error:(id *)a5
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = (const char *)[v7 fileSystemRepresentation];
  id v10 = v8;
  id v11 = (const char *)[v10 fileSystemRepresentation];

  int v12 = clonefile(v9, v11, 0);
  int v13 = v12;
  if (a5 && v12)
  {
    id v14 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v15 = *MEMORY[0x1E4F28798];
    uint64_t v16 = *__error();
    uint64_t v22 = @"reason";
    id v17 = NSString;
    uint64_t v18 = __error();
    uint64_t v19 = [v17 stringWithUTF8String:strerror(*v18)];
    v23[0] = v19;
    char v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];
    *a5 = [v14 errorWithDomain:v15 code:v16 userInfo:v20];
  }
  return v13 == 0;
}

+ (BOOL)secureMoveItemAtURL:(id)a3 toURL:(id)a4 capabilities:(id)a5 error:(id *)a6
{
  v70[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (v10)
  {
    if (v11) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v48 = [MEMORY[0x1E4F28B00] currentHandler];
    [v48 handleFailureInMethod:a2, a1, @"PLFileUtilities.m", 349, @"Invalid parameter not satisfying: %@", @"fromURL" object file lineNumber description];

    if (v11) {
      goto LABEL_3;
    }
  }
  uint64_t v49 = [MEMORY[0x1E4F28B00] currentHandler];
  [v49 handleFailureInMethod:a2, a1, @"PLFileUtilities.m", 350, @"Invalid parameter not satisfying: %@", @"toURL" object file lineNumber description];

LABEL_3:
  id v50 = a1;
  int v13 = [a1 fileManager];
  uint64_t v51 = *MEMORY[0x1E4F28370];
  uint64_t v69 = *MEMORY[0x1E4F28370];
  uint64_t v14 = *MEMORY[0x1E4F28358];
  v70[0] = *MEMORY[0x1E4F28358];
  uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v70 forKeys:&v69 count:1];
  uint64_t v16 = [v10 path];
  id v58 = 0;
  BOOL v54 = v13;
  int v17 = [v13 setAttributes:v15 ofItemAtPath:v16 error:&v58];
  id v18 = v58;

  if ((v17 & 1) == 0)
  {
    uint64_t v19 = PLBackendGetLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      char v20 = [v10 path];
      unsigned int v21 = [v11 path];
      *(_DWORD *)buf = 138412802;
      id v64 = v20;
      __int16 v65 = 2112;
      id v66 = v21;
      __int16 v67 = 2112;
      id v68 = v18;
      _os_log_impl(&dword_19BCFB000, v19, OS_LOG_TYPE_ERROR, "Unable to assign data protection to %@ before moving to %@: %@", buf, 0x20u);
    }
  }
  id v22 = v10;
  id v23 = (const char *)[v22 fileSystemRepresentation];
  id v24 = v11;
  uint64_t v25 = (const char *)[v24 fileSystemRepresentation];
  unsigned int v26 = [v12 isSecludeRenameCapable];
  size_t v55 = v12;
  if (([v12 isCloneCapable] & 1) == 0)
  {
    unsigned int v31 = 1;
    useconds_t v32 = 10;
    while (renamex_np(v23, v25, v26))
    {
      int v33 = *__error();
      if (v31 > 1 && v33 != 16 || v31 > 0xE) {
        goto LABEL_9;
      }
      usleep(v32);
      v32 *= 2;
      ++v31;
    }
    goto LABEL_21;
  }
  if (!renamex_np(v23, v25, v26))
  {
LABEL_21:
    id v30 = 0;
    LODWORD(v29) = 1;
    goto LABEL_22;
  }
LABEL_9:
  uint64_t v27 = *__error();
  if (v27 != 18)
  {
    BOOL v44 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v29 = *MEMORY[0x1E4F28798];
    uint64_t v61 = @"reason";
    id v42 = [NSString stringWithUTF8String:strerror(v27)];
    id v62 = v42;
    statfs v45 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v62 forKeys:&v61 count:1];
    id v30 = [v44 errorWithDomain:v29 code:v27 userInfo:v45];

    LOBYTE(v29) = 0;
    uint64_t v36 = a6;
    uint64_t v37 = v54;
    goto LABEL_33;
  }
  uint64_t v28 = [v50 fileManager];
  id v57 = 0;
  LODWORD(v29) = [v28 moveItemAtURL:v22 toURL:v24 error:&v57];
  id v30 = v57;

LABEL_22:
  if (((v29 ^ 1 | v17) & 1) == 0)
  {
    uint64_t v59 = v51;
    uint64_t v60 = v14;
    uint64_t v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v60 forKeys:&v59 count:1];
    id v39 = [v24 path];
    id v56 = v18;
    uint64_t v37 = v54;
    int v40 = [v54 setAttributes:v38 ofItemAtPath:v39 error:&v56];
    id v52 = v56;

    id v41 = PLBackendGetLog();
    id v42 = v41;
    if (v40)
    {
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        id v43 = [v24 path];
        *(_DWORD *)buf = 138412290;
        id v64 = v43;
        _os_log_impl(&dword_19BCFB000, v42, OS_LOG_TYPE_DEFAULT, "Assigned data protection after move to %@", buf, 0xCu);
      }
    }
    else if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      uint64_t v46 = [v24 path];
      *(_DWORD *)buf = 138412546;
      id v64 = v46;
      __int16 v65 = 2112;
      id v18 = v52;
      id v66 = v52;
      _os_log_impl(&dword_19BCFB000, v42, OS_LOG_TYPE_ERROR, "Unable to assign data protection after move to %@: %@", buf, 0x16u);

LABEL_32:
      uint64_t v36 = a6;
LABEL_33:

      if (!v36) {
        goto LABEL_36;
      }
      goto LABEL_34;
    }
    id v18 = v52;
    goto LABEL_32;
  }
  uint64_t v36 = a6;
  uint64_t v37 = v54;
  if (!a6) {
    goto LABEL_36;
  }
LABEL_34:
  if ((v29 & 1) == 0) {
    *uint64_t v36 = v30;
  }
LABEL_36:

  return v29;
}

+ (id)proxyLockCoordinatingFilePathForDatabaseDirectory:(id)a3 databaseName:(id)a4
{
  id v5 = NSString;
  id v6 = a3;
  id v7 = [v5 stringWithFormat:@".%@-conch", a4];
  id v8 = [v6 stringByAppendingPathComponent:v7];

  return v8;
}

void __52__PLFileUtilities_proxyLockFilePathForDatabasePath___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = NSTemporaryDirectory();
  id v3 = (void *)proxyLockFilePathForDatabasePath__lockPath;
  proxyLockFilePathForDatabasePath__lockPath = v2;

  pl_dispatch_once(&PLIsReallyAssetsd_didCheckReadOnly, &__block_literal_global_54_3819);
  if (!PLIsReallyAssetsd_isAssetsd)
  {
    id v10 = (void *)proxyLockFilePathForDatabasePath__lockPath;
    proxyLockFilePathForDatabasePath__lockPath = 0;

    id v6 = PLBackendGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      id v7 = "Unexpected process attempting to generate the  proxy lock file path";
      id v8 = v6;
      uint32_t v9 = 2;
      goto LABEL_9;
    }
LABEL_10:

    goto LABEL_11;
  }
  if ((_xpc_runtime_is_app_sandboxed() & 1) == 0)
  {
    uint64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", *(void *)(a1 + 32), *(void *)(a1 + 40), @"PLFileUtilities.m", 253, @"%s is always expected to be sandboxed", "assetsd");
  }
  stat v4 = [(id)proxyLockFilePathForDatabasePath__lockPath pathComponents];
  uint64_t v5 = [v4 indexOfObject:@"com.apple.assetsd"];

  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v6 = PLBackendGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v19 = @"com.apple.assetsd";
      __int16 v20 = 2114;
      uint64_t v21 = proxyLockFilePathForDatabasePath__lockPath;
      id v7 = "assetsd does not have expected sandbox identifier %{public}@: %{public}@";
      id v8 = v6;
      uint32_t v9 = 22;
LABEL_9:
      _os_log_impl(&dword_19BCFB000, v8, OS_LOG_TYPE_ERROR, v7, buf, v9);
      goto LABEL_10;
    }
    goto LABEL_10;
  }
LABEL_11:
  uint64_t v11 = [(id)proxyLockFilePathForDatabasePath__lockPath stringByAppendingPathComponent:@"sqliteplocks"];
  id v12 = (void *)proxyLockFilePathForDatabasePath__lockPath;
  proxyLockFilePathForDatabasePath__lockPath = v11;

  uint64_t v16 = *MEMORY[0x1E4F28330];
  int v17 = &unk_1EEC14890;
  int v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v17 forKeys:&v16 count:1];
  uint64_t v14 = [MEMORY[0x1E4F28CB8] defaultManager];
  [v14 createDirectoryAtPath:proxyLockFilePathForDatabasePath__lockPath withIntermediateDirectories:1 attributes:v13 error:0];
}

+ (id)defaultSystemPhotoDataCPLDirectory
{
  v12[1] = *MEMORY[0x1E4F143B8];
  if (!defaultSystemPhotoDataCPLDirectory_path)
  {
    uint64_t v2 = [a1 defaultSystemPhotoDataDirectory];
    uint64_t v3 = [v2 stringByAppendingPathComponent:@"CPL"];
    stat v4 = (void *)defaultSystemPhotoDataCPLDirectory_path;
    defaultSystemPhotoDataCPLDirectory_path = v3;

    uint64_t v5 = [MEMORY[0x1E4F28CB8] defaultManager];
    char v6 = [v5 fileExistsAtPath:defaultSystemPhotoDataCPLDirectory_path];

    if ((v6 & 1) == 0)
    {
      uint64_t v11 = *MEMORY[0x1E4F28330];
      v12[0] = &unk_1EEC14890;
      id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
      id v8 = [MEMORY[0x1E4F28CB8] defaultManager];
      [v8 createDirectoryAtPath:defaultSystemPhotoDataCPLDirectory_path withIntermediateDirectories:1 attributes:v7 error:0];
    }
  }
  uint32_t v9 = (void *)defaultSystemPhotoDataCPLDirectory_path;
  return v9;
}

@end