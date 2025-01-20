@interface PLJournalFile
+ (BOOL)copyURL:(id)a3 toURL:(id)a4 error:(id *)a5;
+ (BOOL)createEmptyURL:(id)a3 error:(id *)a4;
+ (BOOL)fileExistsAtURL:(id)a3;
+ (BOOL)moveURL:(id)a3 toURL:(id)a4 error:(id *)a5;
+ (BOOL)removeURL:(id)a3 error:(id *)a4;
+ (BOOL)writeData:(id)a3 toURL:(id)a4 atomically:(BOOL)a5 error:(id *)a6;
- (BOOL)_fileSize:(unint64_t *)a3 forKey:(id)a4 error:(id *)a5;
- (BOOL)allocatedFileSize:(unint64_t *)a3 error:(id *)a4;
- (BOOL)appendEntries:(id)a3 error:(id *)a4;
- (BOOL)copyToURL:(id)a3 error:(id *)a4;
- (BOOL)createEmptyFileWithError:(id *)a3;
- (BOOL)enumerateEntriesUsingBlock:(id)a3 decodePayload:(BOOL)a4 error:(id *)a5;
- (BOOL)fileExists;
- (BOOL)fileSize:(unint64_t *)a3 error:(id *)a4;
- (BOOL)moveToURL:(id)a3 error:(id *)a4;
- (BOOL)openForReadingUsingBlock:(id)a3 error:(id *)a4;
- (BOOL)openForWritingUsingBlock:(id)a3 error:(id *)a4;
- (BOOL)removeFileWithError:(id *)a3;
- (NSURL)url;
- (PLJournalFile)initWithURL:(id)a3 payloadClass:(Class)a4;
- (id)fileHandleForWritingWithError:(id *)a3;
@end

@implementation PLJournalFile

- (void).cxx_destruct
{
}

- (NSURL)url
{
  return self->_url;
}

- (BOOL)fileExists
{
  v3 = objc_opt_class();
  url = self->_url;
  return [v3 fileExistsAtURL:url];
}

- (BOOL)_fileSize:(unint64_t *)a3 forKey:(id)a4 error:(id *)a5
{
  v6 = self;
  *a3 = 0;
  url = self->_url;
  id v8 = a4;
  [(NSURL *)url removeCachedResourceValueForKey:v8];
  v9 = v6->_url;
  id v16 = 0;
  v17 = 0;
  LODWORD(v6) = [(NSURL *)v9 getResourceValue:&v17 forKey:v8 error:&v16];

  id v10 = v16;
  if (v6)
  {
    v11 = v17;
    id v12 = v16;
    *a3 = [v11 unsignedLongLongValue];
    char v13 = 1;
  }
  else
  {
    id v14 = v16;
    char v13 = PLIsErrorEqualToCode();
  }

  return v13;
}

- (BOOL)allocatedFileSize:(unint64_t *)a3 error:(id *)a4
{
  return [(PLJournalFile *)self _fileSize:a3 forKey:*MEMORY[0x1E4F1C558] error:a4];
}

- (BOOL)fileSize:(unint64_t *)a3 error:(id *)a4
{
  return [(PLJournalFile *)self _fileSize:a3 forKey:*MEMORY[0x1E4F1C5F8] error:a4];
}

- (BOOL)copyToURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  LOBYTE(a4) = [(id)objc_opt_class() copyURL:self->_url toURL:v6 error:a4];

  return (char)a4;
}

- (BOOL)moveToURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  LOBYTE(a4) = [(id)objc_opt_class() moveURL:self->_url toURL:v6 error:a4];

  return (char)a4;
}

- (BOOL)createEmptyFileWithError:(id *)a3
{
  v5 = objc_opt_class();
  url = self->_url;
  return [v5 createEmptyURL:url error:a3];
}

- (BOOL)removeFileWithError:(id *)a3
{
  v5 = objc_opt_class();
  url = self->_url;
  return [v5 removeURL:url error:a3];
}

- (BOOL)appendEntries:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([v6 count])
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __37__PLJournalFile_appendEntries_error___block_invoke;
    v9[3] = &unk_1E586E3C0;
    id v10 = v6;
    v11 = self;
    id v12 = a4;
    BOOL v7 = [(PLJournalFile *)self openForWritingUsingBlock:v9 error:a4];
  }
  else
  {
    BOOL v7 = 1;
  }

  return v7;
}

uint64_t __37__PLJournalFile_appendEntries_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    id v7 = 0;
    uint64_t v8 = *(void *)v21;
    while (2)
    {
      uint64_t v9 = 0;
      id v10 = v7;
      do
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v4);
        }
        v11 = *(void **)(*((void *)&v20 + 1) + 8 * v9);
        id v12 = (void *)MEMORY[0x19F38D3B0]();
        if ([v11 payloadClass] != *(void *)(*(void *)(a1 + 40) + 8))
        {
          id v16 = (void *)MEMORY[0x1E4F1CA00];
          v17 = [NSString stringWithFormat:@"Payload classes don't match: %@, %@", objc_msgSend(v11, "payloadClass"), *(void *)(*(void *)(a1 + 40) + 8)];
          id v18 = [v16 exceptionWithName:@"PLJournalException" reason:v17 userInfo:0];

          objc_exception_throw(v18);
        }
        id v19 = v10;
        int v13 = [v11 writeToFileHandle:v3 checksumContext:0 error:&v19];
        id v7 = v19;

        if (!v13)
        {

          if (*(void *)(a1 + 48))
          {
            id v7 = v7;
            uint64_t v14 = 0;
            **(void **)(a1 + 48) = v7;
          }
          else
          {
            uint64_t v14 = 0;
          }
          goto LABEL_16;
        }
        ++v9;
        id v10 = v7;
      }
      while (v6 != v9);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v7 = 0;
  }

  uint64_t v14 = 1;
LABEL_16:

  return v14;
}

- (BOOL)openForWritingUsingBlock:(id)a3 error:(id *)a4
{
  uint64_t v6 = (uint64_t (**)(id, uint64_t))a3;
  uint64_t v7 = [(PLJournalFile *)self fileHandleForWritingWithError:a4];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    char v9 = v6[2](v6, v7);
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (id)fileHandleForWritingWithError:(id *)a3
{
  v19[1] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v6 = [(NSURL *)self->_url path];
  uint64_t v7 = [v6 stringByDeletingLastPathComponent];
  [v5 createDirectoryAtPath:v7 withIntermediateDirectories:1 attributes:0 error:0];

  id v8 = [(NSURL *)self->_url path];
  uint64_t v9 = open((const char *)[v8 fileSystemRepresentation], 513, 438);

  if (v9 == -1)
  {
    if (a3)
    {
      id v10 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v11 = *MEMORY[0x1E4F28798];
      uint64_t v12 = *__error();
      uint64_t v18 = *MEMORY[0x1E4F28568];
      int v13 = NSString;
      uint64_t v14 = __error();
      v15 = [v13 stringWithUTF8String:strerror(*v14)];
      v19[0] = v15;
      id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
      *a3 = [v10 errorWithDomain:v11 code:v12 userInfo:v16];

      a3 = 0;
    }
  }
  else
  {
    a3 = (id *)[objc_alloc(MEMORY[0x1E4F28CB0]) initWithFileDescriptor:v9 closeOnDealloc:1];
    [a3 seekToEndOfFile];
  }
  return a3;
}

- (BOOL)enumerateEntriesUsingBlock:(id)a3 decodePayload:(BOOL)a4 error:(id *)a5
{
  id v8 = a3;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __64__PLJournalFile_enumerateEntriesUsingBlock_decodePayload_error___block_invoke;
  v11[3] = &unk_1E586E398;
  BOOL v14 = a4;
  v11[4] = self;
  id v12 = v8;
  int v13 = a5;
  id v9 = v8;
  LOBYTE(a5) = [(PLJournalFile *)self openForReadingUsingBlock:v11 error:a5];

  return (char)a5;
}

uint64_t __64__PLJournalFile_enumerateEntriesUsingBlock_decodePayload_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = 0;
    while (1)
    {
      uint64_t v5 = v4;
      uint64_t v6 = (void *)MEMORY[0x19F38D3B0]();
      uint64_t v7 = objc_alloc_init(PLJournalEntry);
      id v11 = v4;
      uint64_t v12 = 0;
      uint64_t v8 = [(PLJournalEntry *)v7 readFromFileHandle:v3 decodePayload:*(unsigned __int8 *)(a1 + 56) payloadClass:*(void *)(*(void *)(a1 + 32) + 8) entryOffset:&v12 error:&v11];
      id v4 = v11;

      if (!v8) {
        break;
      }
      id v9 = [(PLJournalEntry *)v7 payloadID];

      if (v9) {
        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      }
    }

    if ([v4 code] == 51005)
    {
      uint64_t v8 = 1;
    }
    else if (*(void *)(a1 + 48))
    {
      **(void **)(a1 + 48) = v4;
    }
  }
  else
  {
    uint64_t v8 = 1;
  }

  return v8;
}

- (BOOL)openForReadingUsingBlock:(id)a3 error:(id *)a4
{
  v19[1] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (uint64_t (**)(id, void))a3;
  id v7 = [(NSURL *)self->_url path];
  uint64_t v8 = open((const char *)[v7 fileSystemRepresentation], 0);

  if (v8 == -1)
  {
    if (*__error() == 2)
    {
      LOBYTE(a4) = v6[2](v6, 0);
    }
    else if (a4)
    {
      id v10 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v11 = *MEMORY[0x1E4F28798];
      uint64_t v12 = *__error();
      uint64_t v18 = *MEMORY[0x1E4F28568];
      int v13 = NSString;
      BOOL v14 = __error();
      v15 = [v13 stringWithUTF8String:strerror(*v14)];
      v19[0] = v15;
      id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
      *a4 = [v10 errorWithDomain:v11 code:v12 userInfo:v16];

      LOBYTE(a4) = 0;
    }
  }
  else
  {
    id v9 = (void *)[objc_alloc(MEMORY[0x1E4F28CB0]) initWithFileDescriptor:v8 closeOnDealloc:0];
    LOBYTE(a4) = ((uint64_t (**)(id, void *))v6)[2](v6, v9);
    close(v8);
  }
  return (char)a4;
}

- (PLJournalFile)initWithURL:(id)a3 payloadClass:(Class)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PLJournalFile;
  uint64_t v8 = [(PLJournalFile *)&v11 init];
  id v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_url, a3);
    v9->_payloadClass = a4;
  }

  return v9;
}

+ (BOOL)fileExistsAtURL:(id)a3
{
  return [a3 checkResourceIsReachableAndReturnError:0];
}

+ (BOOL)writeData:(id)a3 toURL:(id)a4 atomically:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  id v9 = a4;
  id v10 = a3;
  objc_super v11 = v10;
  if (v7)
  {
    uint64_t v12 = [v9 lastPathComponent];
    uint64_t v13 = [v12 stringByDeletingPathExtension];

    BOOL v14 = [v9 lastPathComponent];
    v15 = [v14 pathExtension];

    id v16 = [v9 URLByDeletingLastPathComponent];
    v17 = [NSString stringWithFormat:@"%@-tmp", v13];
    uint64_t v18 = [v17 stringByAppendingPathExtension:v15];
    id v19 = [v16 URLByAppendingPathComponent:v18];

    LODWORD(v16) = [v11 writeToURL:v19 options:0 error:a6];
    if (v16) {
      char v20 = [(id)objc_opt_class() moveURL:v19 toURL:v9 error:a6];
    }
    else {
      char v20 = 0;
    }

    objc_super v11 = (void *)v13;
  }
  else
  {
    char v20 = [v10 writeToURL:v9 options:0 error:a6];
  }

  return v20;
}

+ (BOOL)copyURL:(id)a3 toURL:(id)a4 error:(id *)a5
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = (const char *)[v7 fileSystemRepresentation];
  id v10 = v8;
  objc_super v11 = (const char *)[v10 fileSystemRepresentation];

  if (!copyfile(v9, v11, 0, 0x1000000u) || *__error() == 2) {
    return 1;
  }
  if (a5)
  {
    uint64_t v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v14 = *MEMORY[0x1E4F28798];
    uint64_t v15 = *__error();
    uint64_t v20 = *MEMORY[0x1E4F28568];
    id v16 = NSString;
    v17 = __error();
    uint64_t v18 = [v16 stringWithUTF8String:strerror(*v17)];
    v21[0] = v18;
    id v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
    *a5 = [v13 errorWithDomain:v14 code:v15 userInfo:v19];
  }
  return 0;
}

+ (BOOL)moveURL:(id)a3 toURL:(id)a4 error:(id *)a5
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = (const std::__fs::filesystem::path *)[v7 fileSystemRepresentation];
  id v10 = v8;
  objc_super v11 = (const std::__fs::filesystem::path *)[v10 fileSystemRepresentation];

  rename(v9, v11, v12);
  int v14 = v13;
  if (a5 && v13)
  {
    uint64_t v15 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v16 = *MEMORY[0x1E4F28798];
    uint64_t v17 = *__error();
    uint64_t v23 = *MEMORY[0x1E4F28568];
    uint64_t v18 = NSString;
    id v19 = __error();
    uint64_t v20 = [v18 stringWithUTF8String:strerror(*v19)];
    v24[0] = v20;
    long long v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];
    *a5 = [v15 errorWithDomain:v16 code:v17 userInfo:v21];
  }
  return v14 == 0;
}

+ (BOOL)createEmptyURL:(id)a3 error:(id *)a4
{
  v22[1] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (void *)MEMORY[0x1E4F28CB8];
  id v6 = a3;
  id v7 = [v5 defaultManager];
  id v8 = [v6 path];
  id v9 = [v8 stringByDeletingLastPathComponent];
  [v7 createDirectoryAtPath:v9 withIntermediateDirectories:1 attributes:0 error:0];

  id v10 = [v6 path];

  id v11 = v10;
  int v12 = open((const char *)[v11 fileSystemRepresentation], 1537, 438);

  if (v12 == -1)
  {
    if (a4)
    {
      int v13 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v14 = *MEMORY[0x1E4F28798];
      uint64_t v15 = *__error();
      uint64_t v21 = *MEMORY[0x1E4F28568];
      uint64_t v16 = NSString;
      uint64_t v17 = __error();
      uint64_t v18 = [v16 stringWithUTF8String:strerror(*v17)];
      v22[0] = v18;
      id v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
      *a4 = [v13 errorWithDomain:v14 code:v15 userInfo:v19];
    }
  }
  else
  {
    close(v12);
  }
  return v12 != -1;
}

+ (BOOL)removeURL:(id)a3 error:(id *)a4
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v5 = [a3 path];
  int v6 = unlink((const char *)[v5 fileSystemRepresentation]);

  if (!v6 || *__error() == 2) {
    return 1;
  }
  if (a4)
  {
    id v8 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v9 = *MEMORY[0x1E4F28798];
    uint64_t v10 = *__error();
    uint64_t v15 = *MEMORY[0x1E4F28568];
    id v11 = NSString;
    int v12 = __error();
    int v13 = [v11 stringWithUTF8String:strerror(*v12)];
    v16[0] = v13;
    uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
    *a4 = [v8 errorWithDomain:v9 code:v10 userInfo:v14];
  }
  return 0;
}

@end