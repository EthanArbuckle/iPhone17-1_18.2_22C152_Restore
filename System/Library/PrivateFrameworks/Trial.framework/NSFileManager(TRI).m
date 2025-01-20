@interface NSFileManager(TRI)
+ (id)triArbitraryFileInDirWithPath:()TRI;
+ (uint64_t)triHasFileProtection:()TRI;
+ (uint64_t)triIdempotentCreateDirectoryOrFaultWithPath:()TRI;
+ (uint64_t)triRemoveFileProtectionIfPresentForPath:()TRI;
- (__CFString)triPath:()TRI relativeToParentPath:;
- (id)triCreateDirectoryForPath:()TRI isDirectory:error:;
- (uint64_t)triRemoveItemAtPath:()TRI error:;
- (uint64_t)triSafeCopyItemAtPath:()TRI toPath:error:;
@end

@implementation NSFileManager(TRI)

- (uint64_t)triSafeCopyItemAtPath:()TRI toPath:error:
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if ([v8 length] && objc_msgSend(v9, "length"))
  {
    uint64_t v10 = [a1 copyItemAtPath:v8 toPath:v9 error:a5];
    uint64_t v11 = v10;
    if (a5 && v10)
    {
      *a5 = 0;
      uint64_t v11 = 1;
    }
  }
  else
  {
    if (a5)
    {
      *a5 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:-22 userInfo:0];
    }
    v12 = TRILogCategory_ClientFramework();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v14 = 138412546;
      id v15 = v8;
      __int16 v16 = 2112;
      id v17 = v9;
      _os_log_error_impl(&dword_19D909000, v12, OS_LOG_TYPE_ERROR, "attempted to copy with invalid paths src:%@ dst:%@", (uint8_t *)&v14, 0x16u);
    }

    uint64_t v11 = 0;
  }

  return v11;
}

- (__CFString)triPath:()TRI relativeToParentPath:
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  v6 = [a3 stringByStandardizingPath];
  v7 = [v5 stringByStandardizingPath];

  if (([v6 hasPrefix:v7] & 1) == 0)
  {
    uint64_t v8 = [v6 triStringByResolvingSymlinksInPath];

    uint64_t v9 = [v7 triStringByResolvingSymlinksInPath];

    v7 = (void *)v9;
    v6 = (void *)v8;
  }
  if ([v6 hasPrefix:v7])
  {
    uint64_t v10 = [v6 pathComponents];
    uint64_t v11 = [v7 pathComponents];
    uint64_t v12 = [v10 count];
    if (v12 == [v11 count])
    {
      v13 = @".";
    }
    else
    {
      id v15 = objc_msgSend(v10, "subarrayWithRange:", objc_msgSend(v11, "count"), objc_msgSend(v10, "count") - objc_msgSend(v11, "count"));
      v13 = [NSString pathWithComponents:v15];
    }
  }
  else
  {
    int v14 = TRILogCategory_ClientFramework();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      int v17 = 138412546;
      uint64_t v18 = v6;
      __int16 v19 = 2112;
      v20 = v7;
      _os_log_error_impl(&dword_19D909000, v14, OS_LOG_TYPE_ERROR, "expected path to be a prefix of parent path: path=%@, parent=%@", (uint8_t *)&v17, 0x16u);
    }

    v13 = v6;
  }

  return v13;
}

- (id)triCreateDirectoryForPath:()TRI isDirectory:error:
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  uint64_t v9 = v8;
  if (a4)
  {
    id v10 = v8;
  }
  else
  {
    id v10 = [v8 stringByDeletingLastPathComponent];
  }
  uint64_t v11 = v10;
  char v20 = 0;
  if (([a1 fileExistsAtPath:v10 isDirectory:&v20] & 1) == 0)
  {
    id v19 = 0;
    char v13 = [a1 createDirectoryAtPath:v11 withIntermediateDirectories:1 attributes:0 error:&v19];
    id v14 = v19;
    id v15 = v14;
    if ((v13 & 1) == 0)
    {
      int v17 = TRILogCategory_ClientFramework();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        v22 = v11;
        __int16 v23 = 2112;
        v24 = v9;
        __int16 v25 = 2112;
        v26 = v15;
        _os_log_error_impl(&dword_19D909000, v17, OS_LOG_TYPE_ERROR, "could not create directory %@ for path %@ -- %@", buf, 0x20u);
      }

      if (a5) {
        *a5 = v15;
      }

      goto LABEL_17;
    }

LABEL_11:
    id v16 = v11;
    goto LABEL_18;
  }
  if (v20) {
    goto LABEL_11;
  }
  uint64_t v12 = TRILogCategory_ClientFramework();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    v22 = v11;
    __int16 v23 = 2112;
    v24 = v9;
    _os_log_error_impl(&dword_19D909000, v12, OS_LOG_TYPE_ERROR, "could not create directory %@ for path %@ -- file exists", buf, 0x16u);
  }

LABEL_17:
  id v16 = 0;
LABEL_18:

  return v16;
}

- (uint64_t)triRemoveItemAtPath:()TRI error:
{
  v40[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (!v7)
  {
    v33 = [MEMORY[0x1E4F28B00] currentHandler];
    [v33 handleFailureInMethod:a2, a1, @"NSFileManager+TRI.m", 82, @"Invalid parameter not satisfying: %@", @"path" object file lineNumber description];
  }
  char v38 = 0;
  if (![a1 fileExistsAtPath:v7 isDirectory:&v38])
  {
    uint64_t v16 = 1;
    goto LABEL_19;
  }
  if (!v38)
  {
LABEL_18:
    uint64_t v16 = [a1 removeItemAtPath:v7 error:a4];
    goto LABEL_19;
  }
  memset(&v37, 0, sizeof(v37));
  id v8 = v7;
  if (!stat((const char *)[v8 fileSystemRepresentation], &v37))
  {
    v34 = a4;
    __int16 v17 = v37.st_mode & 0x1FF;
    id v18 = v8;
    chmod((const char *)[v18 fileSystemRepresentation], v17 | 0x90);
    v35 = v18;
    id v19 = [a1 enumeratorAtPath:v18];
    char v20 = (void *)MEMORY[0x19F3AD060]();
    uint64_t v21 = [v19 nextObject];
    if (v21)
    {
      v22 = (void *)v21;
      uint64_t v23 = *MEMORY[0x1E4F283B8];
      v24 = (void *)*MEMORY[0x1E4F283C0];
      uint64_t v36 = *MEMORY[0x1E4F28330];
      do
      {
        __int16 v25 = [v19 fileAttributes];
        v26 = [v25 objectForKeyedSubscript:v23];

        if (v26 == v24)
        {
          uint64_t v27 = [v19 fileAttributes];
          v28 = [v27 objectForKeyedSubscript:v36];

          if (v28)
          {
            v29 = [v35 stringByAppendingPathComponent:v22];
            __int16 v30 = [v28 unsignedShortValue];
            id v31 = v29;
            chmod((const char *)[v31 fileSystemRepresentation], v30 | 0x90);
          }
        }

        char v20 = (void *)MEMORY[0x19F3AD060]();
        v22 = [v19 nextObject];
      }
      while (v22);
    }

    a4 = v34;
    goto LABEL_18;
  }
  if (a4)
  {
    id v9 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v10 = *MEMORY[0x1E4F28798];
    uint64_t v11 = *__error();
    uint64_t v39 = *MEMORY[0x1E4F28568];
    id v12 = [NSString alloc];
    char v13 = __error();
    id v14 = (void *)[v12 initWithFormat:@"Could not stat %@: %s", v8, strerror(*v13)];
    v40[0] = v14;
    id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:&v39 count:1];
    *a4 = (id)[v9 initWithDomain:v10 code:v11 userInfo:v15];
  }
  uint64_t v16 = 0;
LABEL_19:

  return v16;
}

+ (uint64_t)triHasFileProtection:()TRI
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  int v4 = open((const char *)[v3 fileSystemRepresentation], 0);
  if (v4 < 0)
  {
    id v9 = TRILogCategory_Server();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = __error();
      id v12 = strerror(*v11);
      int v13 = *__error();
      int v16 = 138543874;
      id v17 = v3;
      __int16 v18 = 2080;
      id v19 = v12;
      __int16 v20 = 1024;
      int v21 = v13;
      uint64_t v10 = "Unable to open %{public}@ to get file protection: %s (%d)";
      goto LABEL_8;
    }
LABEL_11:
    uint64_t v14 = 0;
    goto LABEL_12;
  }
  int v5 = v4;
  int v6 = fcntl(v4, 63);
  close(v5);
  id v7 = __error();
  if (v6 == 4)
  {
    id v9 = TRILogCategory_Server();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v16 = 138543362;
      id v17 = v3;
      _os_log_impl(&dword_19D909000, v9, OS_LOG_TYPE_INFO, "File %{public}@ has no file protection already", (uint8_t *)&v16, 0xCu);
    }
    goto LABEL_11;
  }
  if (v6 == -1)
  {
    int v8 = *v7;
    id v9 = TRILogCategory_Server();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v16 = 138543874;
      id v17 = v3;
      __int16 v18 = 2080;
      id v19 = strerror(v8);
      __int16 v20 = 1024;
      int v21 = v8;
      uint64_t v10 = "Failed to get protection class for file %{public}@: %s (%d)";
LABEL_8:
      _os_log_error_impl(&dword_19D909000, v9, OS_LOG_TYPE_ERROR, v10, (uint8_t *)&v16, 0x1Cu);
      goto LABEL_11;
    }
    goto LABEL_11;
  }
  id v9 = TRILogCategory_Server();
  uint64_t v14 = 1;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v16 = 138543618;
    id v17 = v3;
    __int16 v18 = 1024;
    LODWORD(v19) = v6;
    _os_log_impl(&dword_19D909000, v9, OS_LOG_TYPE_INFO, "File %{public}@ has file protection class %d", (uint8_t *)&v16, 0x12u);
  }
LABEL_12:

  return v14;
}

+ (uint64_t)triRemoveFileProtectionIfPresentForPath:()TRI
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([a1 triHasFileProtection:v4])
  {
    id v5 = v4;
    int v6 = open((const char *)[v5 fileSystemRepresentation], 2);
    if (v6 < 0)
    {
      if (*__error() != 21
        || (int v6 = open((const char *)[v5 fileSystemRepresentation], 0), v6 < 0))
      {
        uint64_t v10 = TRILogCategory_Server();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          uint64_t v11 = __error();
          id v12 = strerror(*v11);
          int v13 = *__error();
          *(_DWORD *)buf = 138543874;
          id v17 = v5;
          __int16 v18 = 2080;
          id v19 = v12;
          __int16 v20 = 1024;
          int v21 = v13;
          uint64_t v14 = "Unable to open %{public}@ to set file protection: %s (%d)";
LABEL_13:
          _os_log_error_impl(&dword_19D909000, v10, OS_LOG_TYPE_ERROR, v14, buf, 0x1Cu);
          goto LABEL_10;
        }
        goto LABEL_10;
      }
    }
    int v7 = fcntl(v6, 64, 4);
    int v8 = *__error();
    close(v6);
    if (v7 == -1)
    {
      uint64_t v10 = TRILogCategory_Server();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        id v17 = v5;
        __int16 v18 = 2080;
        id v19 = strerror(v8);
        __int16 v20 = 1024;
        int v21 = v8;
        uint64_t v14 = "Unable to disable file protection on %{public}@: %s (%d)";
        goto LABEL_13;
      }
LABEL_10:

      uint64_t v9 = 0;
      goto LABEL_11;
    }
  }
  uint64_t v9 = 1;
LABEL_11:

  return v9;
}

+ (uint64_t)triIdempotentCreateDirectoryOrFaultWithPath:()TRI
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4F28CB8];
  id v4 = a3;
  id v5 = [v3 defaultManager];
  id v10 = 0;
  uint64_t v6 = [v5 createDirectoryAtPath:v4 withIntermediateDirectories:1 attributes:0 error:&v10];

  id v7 = v10;
  if ((v6 & 1) == 0)
  {
    int v8 = TRILogCategory_ClientFramework();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v7;
      _os_log_error_impl(&dword_19D909000, v8, OS_LOG_TYPE_ERROR, "Failed to create directory: %@", buf, 0xCu);
    }
  }
  return v6;
}

+ (id)triArbitraryFileInDirWithPath:()TRI
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v5 = [v4 enumeratorAtPath:v3];

  uint64_t v6 = (void *)MEMORY[0x19F3AD060]();
  uint64_t v7 = [v5 nextObject];
  if (v7)
  {
    int v8 = (void *)v7;
    uint64_t v9 = (void *)*MEMORY[0x1E4F283C8];
    while (1)
    {
      id v10 = [v5 fileAttributes];
      uint64_t v11 = [v10 fileType];

      if (v11 == v9) {
        break;
      }

      uint64_t v6 = (void *)MEMORY[0x19F3AD060]();
      int v8 = [v5 nextObject];
      if (!v8) {
        goto LABEL_5;
      }
    }
    id v12 = [v3 stringByAppendingPathComponent:v8];
  }
  else
  {
LABEL_5:
    id v12 = 0;
  }

  return v12;
}

@end