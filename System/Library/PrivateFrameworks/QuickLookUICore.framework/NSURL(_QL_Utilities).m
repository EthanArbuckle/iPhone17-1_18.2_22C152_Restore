@interface NSURL(_QL_Utilities)
+ (id)_QLCreateTemporaryDirectory:()_QL_Utilities;
+ (id)_QLCreateTemporaryDirectoryForOriginalFileAtURL:()_QL_Utilities error:;
+ (id)_QLTemporaryFileURLWithType:()_QL_Utilities filename:;
+ (id)_QLTemporaryFileURLWithType:()_QL_Utilities uuid:;
+ (void)_QLTemporaryFileURLWithType:()_QL_Utilities forOriginalFileAtURL:temporaryFileURL:temporaryDirectoryURL:fallbackUUID:;
- (id)_QLSingleFileSizeForURL:()_QL_Utilities;
- (id)_QLUrlFileSize;
- (uint64_t)_QLDownloadingStatusIsNotCurrent;
- (uint64_t)_QLIsHiddenFile;
- (uint64_t)_QLIsPackageURL;
@end

@implementation NSURL(_QL_Utilities)

- (uint64_t)_QLIsPackageURL
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v11 = 0;
  uint64_t v2 = *MEMORY[0x1E4F1C658];
  id v10 = 0;
  char v3 = [a1 getResourceValue:&v11 forKey:v2 error:&v10];
  id v4 = v11;
  id v5 = v10;
  if ((v3 & 1) == 0)
  {
    v6 = (NSObject **)MEMORY[0x1E4F945F0];
    v7 = *MEMORY[0x1E4F945F0];
    if (!*MEMORY[0x1E4F945F0])
    {
      QLSInitLogging();
      v7 = *v6;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v13 = a1;
      __int16 v14 = 2112;
      id v15 = v5;
      _os_log_impl(&dword_1E2805000, v7, OS_LOG_TYPE_ERROR, "Failed to determine if url is package: %@ (%@) #Generic", buf, 0x16u);
    }
  }
  uint64_t v8 = [v4 BOOLValue];

  return v8;
}

- (uint64_t)_QLDownloadingStatusIsNotCurrent
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v11 = 0;
  uint64_t v2 = *MEMORY[0x1E4F1C758];
  id v10 = 0;
  char v3 = [a1 getPromisedItemResourceValue:&v11 forKey:v2 error:&v10];
  id v4 = v11;
  id v5 = v10;
  if ((v3 & 1) == 0)
  {
    v7 = (NSObject **)MEMORY[0x1E4F945F0];
    uint64_t v8 = *MEMORY[0x1E4F945F0];
    if (!*MEMORY[0x1E4F945F0])
    {
      QLSInitLogging();
      uint64_t v8 = *v7;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v13 = a1;
      __int16 v14 = 2112;
      id v15 = v5;
      _os_log_impl(&dword_1E2805000, v8, OS_LOG_TYPE_ERROR, "Failed to get download status for url:%@ error:%@ #Generic", buf, 0x16u);
    }
    goto LABEL_9;
  }
  if (!v4 || [v4 isEqualToString:*MEMORY[0x1E4F1C748]])
  {
LABEL_9:
    uint64_t v6 = 0;
    goto LABEL_10;
  }
  uint64_t v6 = 1;
LABEL_10:

  return v6;
}

- (uint64_t)_QLIsHiddenFile
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v11 = 0;
  uint64_t v2 = *MEMORY[0x1E4F1C648];
  id v10 = 0;
  char v3 = [a1 getPromisedItemResourceValue:&v11 forKey:v2 error:&v10];
  id v4 = v11;
  id v5 = v10;
  if (v3)
  {
    uint64_t v6 = [v4 BOOLValue];
  }
  else
  {
    v7 = (NSObject **)MEMORY[0x1E4F945F0];
    uint64_t v8 = *MEMORY[0x1E4F945F0];
    if (!*MEMORY[0x1E4F945F0])
    {
      QLSInitLogging();
      uint64_t v8 = *v7;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v13 = a1;
      __int16 v14 = 2112;
      id v15 = v5;
      _os_log_impl(&dword_1E2805000, v8, OS_LOG_TYPE_ERROR, "Failed to determine if file is hidden for url: %@ error: %@ #Generic", buf, 0x16u);
    }
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)_QLSingleFileSizeForURL:()_QL_Utilities
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v12 = 0;
  uint64_t v4 = *MEMORY[0x1E4F1C5F8];
  id v11 = 0;
  char v5 = [v3 getPromisedItemResourceValue:&v12 forKey:v4 error:&v11];
  id v6 = v12;
  id v7 = v11;
  if ((v5 & 1) == 0)
  {
    uint64_t v8 = (NSObject **)MEMORY[0x1E4F945F0];
    v9 = *MEMORY[0x1E4F945F0];
    if (!*MEMORY[0x1E4F945F0])
    {
      QLSInitLogging();
      v9 = *v8;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v14 = v3;
      __int16 v15 = 2112;
      id v16 = v7;
      _os_log_impl(&dword_1E2805000, v9, OS_LOG_TYPE_ERROR, "Error getting the size of file(%@) with error (%@) #Generic", buf, 0x16u);
    }
  }

  return v6;
}

- (id)_QLUrlFileSize
{
  v1 = a1;
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  if ([a1 _QLDownloadingStatusIsNotCurrent]) {
    goto LABEL_15;
  }
  id v40 = 0;
  uint64_t v2 = *MEMORY[0x1E4F1C628];
  id v39 = 0;
  char v3 = [v1 getResourceValue:&v40 forKey:v2 error:&v39];
  id v4 = v40;
  id v5 = v39;
  if ((v3 & 1) == 0)
  {
    v13 = (NSObject **)MEMORY[0x1E4F945F0];
    id v14 = *MEMORY[0x1E4F945F0];
    if (!*MEMORY[0x1E4F945F0])
    {
      QLSInitLogging();
      id v14 = *v13;
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v43 = v1;
      __int16 v44 = 2112;
      id v45 = v5;
      _os_log_impl(&dword_1E2805000, v14, OS_LOG_TYPE_ERROR, "Failed to determine if the URL (%@) is a directory error: %@ #Generic", buf, 0x16u);
    }
    goto LABEL_14;
  }
  if (![v4 BOOLValue])
  {
LABEL_14:

LABEL_15:
    id v12 = objc_msgSend(v1, "_QLSingleFileSizeForURL:", v1, v28, v29, v30, v31, v32);
    goto LABEL_16;
  }
  id v6 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v7 = [v1 path];
  id v38 = 0;
  uint64_t v8 = [v6 contentsOfDirectoryAtPath:v7 error:&v38];
  id v9 = v38;

  if (v9)
  {
    id v10 = (NSObject **)MEMORY[0x1E4F945F0];
    id v11 = *MEMORY[0x1E4F945F0];
    if (!*MEMORY[0x1E4F945F0])
    {
      QLSInitLogging();
      id v11 = *v10;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v43 = v1;
      __int16 v44 = 2112;
      id v45 = v9;
      _os_log_impl(&dword_1E2805000, v11, OS_LOG_TYPE_ERROR, "Failed to get the contents of folder at URL (%@) with error: %@ #Generic", buf, 0x16u);
    }
    id v12 = 0;
  }
  else
  {
    v28 = 0;
    v29 = v8;
    v30 = v6;
    id v31 = v5;
    id v32 = v4;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id obj = v8;
    uint64_t v16 = [obj countByEnumeratingWithState:&v34 objects:v41 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = 0;
      uint64_t v19 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v35 != v19) {
            objc_enumerationMutation(obj);
          }
          uint64_t v21 = *(void *)(*((void *)&v34 + 1) + 8 * i);
          v22 = (void *)MEMORY[0x1E4F1CB10];
          v23 = objc_msgSend(v1, "path", v28, v29, v30, v31, v32);
          v24 = [v23 stringByAppendingPathComponent:v21];
          v25 = [v22 fileURLWithPath:v24];
          [v25 _QLUrlFileSize];
          v27 = v26 = v1;
          v18 += [v27 unsignedLongLongValue];

          v1 = v26;
        }
        uint64_t v17 = [obj countByEnumeratingWithState:&v34 objects:v41 count:16];
      }
      while (v17);
    }
    else
    {
      uint64_t v18 = 0;
    }

    id v12 = [MEMORY[0x1E4F28ED0] numberWithLong:v18];
    id v5 = v31;
    id v4 = v32;
    uint64_t v8 = v29;
    id v6 = v30;
    id v9 = v28;
  }

  if (!v12) {
    goto LABEL_15;
  }
LABEL_16:
  return v12;
}

+ (id)_QLCreateTemporaryDirectory:()_QL_Utilities
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = (void *)MEMORY[0x1E4F1CB10];
  id v5 = NSTemporaryDirectory();
  id v6 = [v4 fileURLWithPath:v5];
  uint64_t v7 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v8 = [(id)v7 UUIDString];
  id v9 = [v6 URLByAppendingPathComponent:v8 isDirectory:1];

  id v10 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v16 = 0;
  LOBYTE(v7) = [v10 createDirectoryAtURL:v9 withIntermediateDirectories:1 attributes:0 error:&v16];
  id v11 = v16;

  if (v7)
  {
    id v12 = v9;
  }
  else
  {
    v13 = (NSObject **)MEMORY[0x1E4F945F0];
    id v14 = *MEMORY[0x1E4F945F0];
    if (!*MEMORY[0x1E4F945F0])
    {
      QLSInitLogging();
      id v14 = *v13;
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v18 = v9;
      __int16 v19 = 2112;
      id v20 = v11;
      _os_log_impl(&dword_1E2805000, v14, OS_LOG_TYPE_ERROR, "Failed to create a temporary directory URL for URL: %@. Error: %@ #Generic", buf, 0x16u);
    }
    id v12 = 0;
    if (a3) {
      *a3 = v11;
    }
  }

  return v12;
}

+ (id)_QLTemporaryFileURLWithType:()_QL_Utilities filename:
{
  id v5 = a4;
  id v6 = [a3 preferredFilenameExtension];
  uint64_t v7 = [v5 stringByDeletingPathExtension];

  uint64_t v8 = (void *)MEMORY[0x1E4F1CB10];
  id v9 = NSTemporaryDirectory();
  id v10 = [v8 fileURLWithPath:v9];
  id v11 = [v10 URLByAppendingPathComponent:v7];
  id v12 = [v11 URLByAppendingPathExtension:v6];

  return v12;
}

+ (id)_QLTemporaryFileURLWithType:()_QL_Utilities uuid:
{
  id v5 = (void *)MEMORY[0x1E4F1CB10];
  id v6 = a3;
  uint64_t v7 = [a4 UUIDString];
  uint64_t v8 = [v5 _QLTemporaryFileURLWithType:v6 filename:v7];

  return v8;
}

+ (void)_QLTemporaryFileURLWithType:()_QL_Utilities forOriginalFileAtURL:temporaryFileURL:temporaryDirectoryURL:fallbackUUID:
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a7;
  id v14 = [v11 preferredFilenameExtension];
  __int16 v15 = *a6;
  if (*a6) {
    goto LABEL_9;
  }
  id v16 = (NSObject **)MEMORY[0x1E4F945F0];
  uint64_t v17 = *MEMORY[0x1E4F945F0];
  if (!*MEMORY[0x1E4F945F0])
  {
    QLSInitLogging();
    uint64_t v17 = *v16;
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E2805000, v17, OS_LOG_TYPE_INFO, "No temporary directory passed from host #Generic", buf, 2u);
  }
  uint64_t v18 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v24 = 0;
  __int16 v19 = [v18 URLForDirectory:99 inDomain:1 appropriateForURL:v12 create:1 error:&v24];
  id v20 = v24;

  if (v19 && !v20)
  {
    id v21 = v19;
    *a6 = v21;

    __int16 v15 = *a6;
LABEL_9:
    id v20 = [v12 URLByDeletingPathExtension];
    __int16 v19 = [v20 lastPathComponent];
    v22 = [v15 URLByAppendingPathComponent:v19];
    *a5 = [v22 URLByAppendingPathExtension:v14];

    goto LABEL_10;
  }
  v23 = *v16;
  if (!*v16)
  {
    QLSInitLogging();
    v23 = *v16;
  }
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    id v26 = v12;
    __int16 v27 = 2112;
    id v28 = v20;
    _os_log_impl(&dword_1E2805000, v23, OS_LOG_TYPE_ERROR, "Failed to create a temporary directory URL for URL: %@. Error: %@ #Generic", buf, 0x16u);
  }
  if (a5)
  {
    *a5 = [MEMORY[0x1E4F1CB10] _QLTemporaryFileURLWithType:v11 uuid:v13];
  }
LABEL_10:
}

+ (id)_QLCreateTemporaryDirectoryForOriginalFileAtURL:()_QL_Utilities error:
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v15 = 0;
  uint64_t v7 = [v6 URLForDirectory:99 inDomain:1 appropriateForURL:v5 create:1 error:&v15];
  id v8 = v15;

  if (v7) {
    BOOL v9 = v8 == 0;
  }
  else {
    BOOL v9 = 0;
  }
  if (v9)
  {
    id v12 = v7;
  }
  else
  {
    id v10 = (NSObject **)MEMORY[0x1E4F945F0];
    id v11 = *MEMORY[0x1E4F945F0];
    if (!*MEMORY[0x1E4F945F0])
    {
      QLSInitLogging();
      id v11 = *v10;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v17 = v5;
      __int16 v18 = 2112;
      id v19 = v8;
      _os_log_impl(&dword_1E2805000, v11, OS_LOG_TYPE_ERROR, "Failed to create a temporary directory URL for URL: %@. Error: %@ #Generic", buf, 0x16u);
    }
    id v12 = [MEMORY[0x1E4F1CB10] _QLCreateTemporaryDirectory:a4];
  }
  id v13 = v12;

  return v13;
}

@end