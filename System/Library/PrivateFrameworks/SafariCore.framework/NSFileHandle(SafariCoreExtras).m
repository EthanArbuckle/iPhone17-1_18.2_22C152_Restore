@interface NSFileHandle(SafariCoreExtras)
+ (id)safari_fileHandleByCreatingFileWithUniqueSubpath:()SafariCoreExtras relativeToFileHandle:options:createMode:error:;
+ (id)safari_fileHandleWithURL:()SafariCoreExtras options:createMode:error:;
+ (void)safari_fileHandleWithSubpath:()SafariCoreExtras relativeToFileHandle:options:createMode:error:;
- (id)safari_fileURL;
@end

@implementation NSFileHandle(SafariCoreExtras)

+ (id)safari_fileHandleWithURL:()SafariCoreExtras options:createMode:error:
{
  id v10 = a3;
  if ([v10 isFileURL])
  {
    id v11 = v10;
    uint64_t v12 = open((const char *)[v11 fileSystemRepresentation], a4, a5);
    if ((v12 & 0x80000000) == 0)
    {
      v13 = (void *)[[a1 alloc] initWithFileDescriptor:v12 closeOnDealloc:1];
      goto LABEL_9;
    }
    if (a6)
    {
      __error();
      v14 = [v11 path];
      _NSErrorWithFilePathAndErrno();
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else if (a6)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F289A0] code:-1000 userInfo:0];
    v13 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  v13 = 0;
LABEL_9:

  return v13;
}

+ (void)safari_fileHandleWithSubpath:()SafariCoreExtras relativeToFileHandle:options:createMode:error:
{
  id v12 = a3;
  id v13 = a4;
  int v14 = [v13 fileDescriptor];
  id v15 = v12;
  uint64_t v16 = openat(v14, (const char *)[v15 fileSystemRepresentation], a5, a6);
  if ((v16 & 0x80000000) != 0)
  {
    if (a7)
    {
      __error();
      v17 = objc_msgSend(v13, "safari_fileURL");
      v18 = [v17 URLByAppendingPathComponent:v15];

      _NSErrorWithFilePathAndErrno();
      *a7 = (id)objc_claimAutoreleasedReturnValue();

      a7 = 0;
    }
  }
  else
  {
    a7 = (void *)[[a1 alloc] initWithFileDescriptor:v16 closeOnDealloc:1];
  }

  return a7;
}

+ (id)safari_fileHandleByCreatingFileWithUniqueSubpath:()SafariCoreExtras relativeToFileHandle:options:createMode:error:
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  int v14 = [[WBSUniqueFilenameEnumerator alloc] initWithFilename:v12];
  uint64_t v15 = [(WBSUniqueFilenameEnumerator *)v14 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    v28 = a7;
    v29 = a1;
    uint64_t v17 = *(void *)v31;
    int v18 = a5 | 0xA00;
    while (2)
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v31 != v17) {
          objc_enumerationMutation(v14);
        }
        v20 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        int v21 = [v13 fileDescriptor];
        id v22 = v20;
        uint64_t v23 = openat(v21, (const char *)[v22 fileSystemRepresentation], v18, a6);
        if ((int)v23 > 0)
        {
          v24 = (void *)[[v29 alloc] initWithFileDescriptor:v23 closeOnDealloc:1];
          goto LABEL_15;
        }
        if (*__error() != 17)
        {
          if (v28)
          {
            v25 = objc_msgSend(v13, "safari_fileURL");
            v26 = [v25 URLByAppendingPathComponent:v22];

            _NSErrorWithFilePathAndErrno();
            void *v28 = (id)objc_claimAutoreleasedReturnValue();
          }
          goto LABEL_14;
        }
      }
      uint64_t v16 = [(WBSUniqueFilenameEnumerator *)v14 countByEnumeratingWithState:&v30 objects:v34 count:16];
      v24 = 0;
      if (v16) {
        continue;
      }
      break;
    }
  }
  else
  {
LABEL_14:
    v24 = 0;
  }
LABEL_15:

  return v24;
}

- (id)safari_fileURL
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v1 = [a1 fileDescriptor];
  bzero(v7, 0x402uLL);
  if (realpath_np())
  {
    v2 = 0;
  }
  else
  {
    memset(&v6, 0, sizeof(v6));
    if (fstat(v1, &v6)) {
      BOOL v3 = 0;
    }
    else {
      BOOL v3 = (v6.st_mode & 0xF000) == 0x4000;
    }
    uint64_t v4 = v3;
    v2 = [MEMORY[0x1E4F1CB10] fileURLWithFileSystemRepresentation:v7 isDirectory:v4 relativeToURL:0];
  }
  return v2;
}

@end