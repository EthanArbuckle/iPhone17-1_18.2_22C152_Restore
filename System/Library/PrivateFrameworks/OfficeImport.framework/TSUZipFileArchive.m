@interface TSUZipFileArchive
+ (BOOL)isZipArchiveAtFD:(int)a3;
+ (BOOL)isZipArchiveAtURL:(id)a3 error:(id *)a4;
+ (id)zipArchiveFromURL:(id)a3 options:(unint64_t)a4 error:(id *)a5;
+ (void)readArchiveFromURL:(id)a3 options:(unint64_t)a4 queue:(id)a5 completion:(id)a6;
- (BOOL)copyToTemporaryLocationRelativeToURL:(id)a3 error:(id *)a4;
- (BOOL)isValid;
- (BOOL)openWithURL:(id)a3 error:(id *)a4;
- (BOOL)reopenWithTemporaryURL:(id)a3 error:(id *)a4;
- (TSUZipFileArchive)initWithWriter:(id)a3 forReadingFromURL:(id)a4 options:(unint64_t)a5 error:(id *)a6;
- (id)URL;
- (id)debugDescription;
- (id)initForReadingFromURL:(id)a3 options:(unint64_t)a4 error:(id *)a5;
- (id)newArchiveReadChannel;
- (unint64_t)archiveLength;
- (void)createTemporaryDirectoryRelativeToURL:(id)a3;
- (void)dealloc;
- (void)removeTemporaryDirectory;
@end

@implementation TSUZipFileArchive

+ (BOOL)isZipArchiveAtURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [v6 path];
  if ([v7 length])
  {
    id v8 = [v6 path];
    uint64_t v9 = open((const char *)[v8 fileSystemRepresentation], 0, 0);

    if ((v9 & 0x80000000) != 0)
    {
      v11 = objc_msgSend(MEMORY[0x263F087E8], "tsu_fileReadPOSIXErrorWithNumber:userInfo:", *__error(), 0);
      char v10 = 0;
      if (!a4) {
        goto LABEL_12;
      }
      goto LABEL_8;
    }
    char v10 = [a1 isZipArchiveAtFD:v9];
    close(v9);
  }
  else
  {
    char v10 = 0;
  }
  v11 = 0;
  if (!a4) {
    goto LABEL_12;
  }
LABEL_8:
  if ((v10 & 1) == 0)
  {
    if (v11)
    {
      *a4 = v11;
    }
    else
    {
      objc_msgSend(MEMORY[0x263F087E8], "tsu_fileReadUnknownErrorWithUserInfo:", 0);
      id v12 = objc_claimAutoreleasedReturnValue();
      *a4 = v12;
    }
  }
LABEL_12:

  return v10;
}

+ (BOOL)isZipArchiveAtFD:(int)a3
{
  off_t v4 = lseek(a3, 0, 1);
  off_t v5 = v4;
  if ((unint64_t)(v4 - 1) > 0xFFFFFFFFFFFFFFFDLL)
  {
    if (v4 == -1) {
      return 0;
    }
  }
  else if (lseek(a3, 0, 0) == -1)
  {
    goto LABEL_12;
  }
  if (read(a3, &v9, 4uLL) == 4)
  {
    BOOL v7 = v9 == 67324752 || v9 == 101010256;
    return lseek(a3, v5, 0) != -1 && v7;
  }
LABEL_12:
  BOOL v7 = 0;
  return lseek(a3, v5, 0) != -1 && v7;
}

- (id)URL
{
  return self->_URL;
}

+ (void)readArchiveFromURL:(id)a3 options:(unint64_t)a4 queue:(id)a5 completion:(id)a6
{
  id v10 = a6;
  v11 = a5;
  id v12 = a3;
  id v18 = 0;
  v13 = (void *)[objc_alloc((Class)a1) initForReadingFromURL:v12 options:a4 error:&v18];

  id v14 = v18;
  if (v13)
  {
    [v13 readArchiveWithQueue:v11 completion:v10];
  }
  else
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __65__TSUZipFileArchive_readArchiveFromURL_options_queue_completion___block_invoke;
    block[3] = &unk_264D616F8;
    v17 = v10;
    id v16 = v14;
    dispatch_async(v11, block);

    v11 = v17;
  }
}

void __65__TSUZipFileArchive_readArchiveFromURL_options_queue_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  if (*(void *)(a1 + 32))
  {
    v2 = *(void (**)(uint64_t, void))(v1 + 16);
    uint64_t v3 = *(void *)(a1 + 40);
    v2(v3, 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x263F087E8], "tsu_fileReadUnknownErrorWithUserInfo:");
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v4);
  }
}

+ (id)zipArchiveFromURL:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__12;
  v32 = __Block_byref_object_dispose__12;
  id v33 = 0;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__12;
  v26 = __Block_byref_object_dispose__12;
  id v27 = 0;
  id obj = 0;
  int v9 = [a1 isZipArchiveAtURL:v8 error:&obj];
  objc_storeStrong(&v27, obj);
  if (v9)
  {
    dispatch_semaphore_t v10 = dispatch_semaphore_create(0);
    v11 = dispatch_get_global_queue(0, 0);
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __53__TSUZipFileArchive_zipArchiveFromURL_options_error___block_invoke;
    v17[3] = &unk_264D61720;
    v19 = &v28;
    v20 = &v22;
    id v12 = v10;
    id v18 = v12;
    [a1 readArchiveFromURL:v8 options:a4 queue:v11 completion:v17];
    dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
  }
  if (a5 && !v29[5])
  {
    v13 = (void *)v23[5];
    if (v13)
    {
      *a5 = v13;
    }
    else
    {
      objc_msgSend(MEMORY[0x263F087E8], "tsu_fileReadUnknownErrorWithUserInfo:", 0);
      id v14 = objc_claimAutoreleasedReturnValue();
      *a5 = v14;
    }
  }
  id v15 = (id)v29[5];
  _Block_object_dispose(&v22, 8);

  _Block_object_dispose(&v28, 8);
  return v15;
}

void __53__TSUZipFileArchive_zipArchiveFromURL_options_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  dispatch_semaphore_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)initForReadingFromURL:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  if (([v8 isFileURL] & 1) == 0)
  {
    uint64_t v9 = [NSString stringWithUTF8String:"-[TSUZipFileArchive initForReadingFromURL:options:error:]"];
    dispatch_semaphore_t v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUZipFileArchive.m"];
    +[OITSUAssertionHandler handleFailureInFunction:v9 file:v10 lineNumber:154 isFatal:0 description:"Need a file URL"];

    +[OITSUAssertionHandler logBacktraceThrottled];
  }
  v15.receiver = self;
  v15.super_class = (Class)TSUZipFileArchive;
  id v11 = [(TSUZipArchive *)&v15 initWithOptions:a4];
  if (v11)
  {
    dispatch_queue_t v12 = dispatch_queue_create("TSUZipFileArchive.Access", 0);
    accessQueue = v11->_accessQueue;
    v11->_accessQueue = (OS_dispatch_queue *)v12;

    if (![(TSUZipFileArchive *)v11 openWithURL:v8 error:a5])
    {

      id v11 = 0;
    }
  }

  return v11;
}

- (BOOL)openWithURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (self->_fdWrapper)
  {
    uint64_t v7 = [NSString stringWithUTF8String:"-[TSUZipFileArchive openWithURL:error:]"];
    id v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUZipFileArchive.m"];
    +[OITSUAssertionHandler handleFailureInFunction:v7 file:v8 lineNumber:172 isFatal:0 description:"Shouldn't open the archive if it's already open."];

    +[OITSUAssertionHandler logBacktraceThrottled];
  }
  uint64_t v9 = (NSURL *)[v6 copy];
  URL = self->_URL;
  self->_URL = v9;

  uint64_t v11 = *MEMORY[0x263EFF688];
  [v6 removeCachedResourceValueForKey:*MEMORY[0x263EFF688]];
  id v24 = 0;
  id v25 = 0;
  int v12 = [v6 getResourceValue:&v25 forKey:v11 error:&v24];
  id v13 = v25;
  id v14 = v24;
  if (v12)
  {
    self->_archiveLength = [v13 unsignedLongLongValue];
    id v15 = [v6 path];
    uint64_t v16 = open((const char *)[v15 fileSystemRepresentation], 0, 0);

    if ((v16 & 0x80000000) != 0)
    {
      uint64_t v20 = objc_msgSend(MEMORY[0x263F087E8], "tsu_fileReadPOSIXErrorWithNumber:userInfo:", *__error(), 0);
    }
    else
    {
      v17 = [[TSUZipFileDescriptorWrapper alloc] initWithFileDescriptor:v16 queue:self->_accessQueue];
      fdWrapper = self->_fdWrapper;
      self->_fdWrapper = v17;

      if (self->_fdWrapper)
      {
        if ([(id)objc_opt_class() isZipArchiveAtFD:v16])
        {
          BOOL v19 = 1;
          if (!a4) {
            goto LABEL_18;
          }
          goto LABEL_16;
        }
        v21 = self->_fdWrapper;
        self->_fdWrapper = 0;

        uint64_t v20 = objc_msgSend(MEMORY[0x263F087E8], "tsu_fileReadCorruptedFileErrorWithUserInfo:", 0);
      }
      else
      {
        uint64_t v20 = objc_msgSend(MEMORY[0x263F087E8], "tsu_fileReadUnknownErrorWithUserInfo:", 0);
      }
    }
    uint64_t v22 = (void *)v20;

    BOOL v19 = 0;
    id v14 = v22;
    if (!a4) {
      goto LABEL_18;
    }
    goto LABEL_16;
  }
  if (TSUDefaultCat_init_token == -1)
  {
    BOOL v19 = 0;
    if (!a4) {
      goto LABEL_18;
    }
  }
  else
  {
    dispatch_once(&TSUDefaultCat_init_token, &__block_literal_global_24);
    BOOL v19 = 0;
    if (!a4) {
      goto LABEL_18;
    }
  }
LABEL_16:
  if (v14) {
    *a4 = v14;
  }
LABEL_18:

  return v19;
}

void __39__TSUZipFileArchive_openWithURL_error___block_invoke()
{
  uint64_t v0 = TSULogCreateCategory("TSUDefaultCat");
  uint64_t v1 = (void *)TSUDefaultCat_log_t;
  TSUDefaultCat_log_t = v0;
}

- (TSUZipFileArchive)initWithWriter:(id)a3 forReadingFromURL:(id)a4 options:(unint64_t)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  int v12 = [(TSUZipFileArchive *)self initForReadingFromURL:v11 options:a5 error:a6];
  id v13 = v12;
  if (v12)
  {
    unint64_t archiveLength = v12->_archiveLength;
    if (archiveLength == [v10 archiveLength])
    {
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = __68__TSUZipFileArchive_initWithWriter_forReadingFromURL_options_error___block_invoke;
      v19[3] = &unk_264D61748;
      id v13 = v13;
      uint64_t v20 = v13;
      [v10 enumerateEntriesUsingBlock:v19];
    }
    else
    {
      id v15 = [NSString stringWithUTF8String:"-[TSUZipFileArchive initWithWriter:forReadingFromURL:options:error:]"];
      uint64_t v16 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUZipFileArchive.m"];
      v17 = [v11 path];
      +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v15, v16, 228, 0, "Length of archive at %@ doesn't match archive length of writer. %llu != %llu", v17, v13->_archiveLength, [v10 archiveLength]);

      +[OITSUAssertionHandler logBacktraceThrottled];
      id v13 = 0;
    }
  }

  return v13;
}

uint64_t __68__TSUZipFileArchive_initWithWriter_forReadingFromURL_options_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addEntry:a2];
}

- (void)dealloc
{
  self->_unint64_t archiveLength = 0;
  fdWrapper = self->_fdWrapper;
  self->_fdWrapper = 0;

  [(TSUZipFileArchive *)self removeTemporaryDirectory];
  v4.receiver = self;
  v4.super_class = (Class)TSUZipFileArchive;
  [(TSUZipFileArchive *)&v4 dealloc];
}

- (void)createTemporaryDirectoryRelativeToURL:(id)a3
{
  id v4 = a3;
  if (!self->_temporaryDirectoryURL)
  {
    id v11 = v4;
    if (!v4) {
      goto LABEL_4;
    }
    id v5 = [MEMORY[0x263F08850] defaultManager];
    id v6 = [v5 URLForDirectory:99 inDomain:1 appropriateForURL:v11 create:1 error:0];
    temporaryDirectoryURL = self->_temporaryDirectoryURL;
    self->_temporaryDirectoryURL = v6;

    id v4 = v11;
    if (!self->_temporaryDirectoryURL)
    {
LABEL_4:
      id v8 = [[OITSUTemporaryDirectory alloc] initWithSignature:@"ZipFile" error:0];
      [(OITSUTemporaryDirectory *)v8 leakTemporaryDirectory];
      uint64_t v9 = [(OITSUTemporaryDirectory *)v8 URL];
      id v10 = self->_temporaryDirectoryURL;
      self->_temporaryDirectoryURL = v9;

      id v4 = v11;
    }
  }
}

- (void)removeTemporaryDirectory
{
  if (self->_temporaryDirectoryURL)
  {
    uint64_t v3 = [MEMORY[0x263F08850] defaultManager];
    temporaryDirectoryURL = self->_temporaryDirectoryURL;
    id v8 = 0;
    char v5 = [v3 removeItemAtURL:temporaryDirectoryURL error:&v8];
    id v6 = v8;

    if ((v5 & 1) == 0 && TSUDefaultCat_init_token != -1) {
      dispatch_once(&TSUDefaultCat_init_token, &__block_literal_global_18);
    }
    uint64_t v7 = self->_temporaryDirectoryURL;
    self->_temporaryDirectoryURL = 0;
  }
}

void __45__TSUZipFileArchive_removeTemporaryDirectory__block_invoke()
{
  uint64_t v0 = TSULogCreateCategory("TSUDefaultCat");
  uint64_t v1 = (void *)TSUDefaultCat_log_t;
  TSUDefaultCat_log_t = v0;
}

- (BOOL)reopenWithTemporaryURL:(id)a3 error:(id *)a4
{
  unint64_t archiveLength = self->_archiveLength;
  p_fdWrapper = (id *)&self->_fdWrapper;
  fdWrapper = self->_fdWrapper;
  id v10 = fdWrapper;
  self->_unint64_t archiveLength = 0;
  id v11 = *p_fdWrapper;
  id *p_fdWrapper = 0;
  id v12 = a3;

  BOOL v13 = [(TSUZipFileArchive *)self openWithURL:v12 error:a4];
  if (!v13)
  {
    self->_unint64_t archiveLength = archiveLength;
    objc_storeStrong(p_fdWrapper, fdWrapper);
  }

  return v13;
}

- (BOOL)copyToTemporaryLocationRelativeToURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x2020000000;
  char v30 = 0;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000;
  id v24 = __Block_byref_object_copy__12;
  id v25 = __Block_byref_object_dispose__12;
  id v26 = 0;
  accessQueue = self->_accessQueue;
  uint64_t v13 = MEMORY[0x263EF8330];
  uint64_t v14 = 3221225472;
  id v15 = __64__TSUZipFileArchive_copyToTemporaryLocationRelativeToURL_error___block_invoke;
  uint64_t v16 = &unk_264D617C0;
  v17 = self;
  id v8 = v6;
  id v18 = v8;
  BOOL v19 = &v21;
  uint64_t v20 = &v27;
  dispatch_sync(accessQueue, &v13);
  if (a4 && !*((unsigned char *)v28 + 24))
  {
    uint64_t v9 = (void *)v22[5];
    if (v9)
    {
      *a4 = v9;
    }
    else
    {
      objc_msgSend(MEMORY[0x263F087E8], "tsu_fileReadUnknownErrorWithUserInfo:", 0, v13, v14, v15, v16, v17);
      id v10 = objc_claimAutoreleasedReturnValue();
      *a4 = v10;
    }
  }
  char v11 = *((unsigned char *)v28 + 24);

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

  return v11;
}

void __64__TSUZipFileArchive_copyToTemporaryLocationRelativeToURL_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 64))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  }
  else
  {
    id v3 = *(id *)(v2 + 56);
    id v4 = (void *)MEMORY[0x23EC9A170]();
    if (!v3)
    {
      char v5 = [NSString stringWithUTF8String:"-[TSUZipFileArchive copyToTemporaryLocationRelativeToURL:error:]_block_invoke"];
      id v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUZipFileArchive.m"];
      +[OITSUAssertionHandler handleFailureInFunction:v5 file:v6 lineNumber:301 isFatal:0 description:"File should be opened."];

      +[OITSUAssertionHandler logBacktraceThrottled];
    }
    [*(id *)(a1 + 32) createTemporaryDirectoryRelativeToURL:*(void *)(a1 + 40)];
    uint64_t v7 = [*(id *)(*(void *)(a1 + 32) + 64) URLByAppendingPathComponent:@"Temp.zip"];
    if (v7)
    {
      id v8 = [TSUFileIOChannel alloc];
      uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
      id v31 = *(id *)(v9 + 40);
      id v10 = [(TSUFileIOChannel *)v8 initForStreamWritingURL:v7 error:&v31];
      objc_storeStrong((id *)(v9 + 40), v31);
    }
    else
    {
      id v10 = 0;
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v10 != 0;
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
    {
      uint64_t v25 = 0;
      id v26 = &v25;
      uint64_t v27 = 0x3032000000;
      uint64_t v28 = __Block_byref_object_copy__12;
      uint64_t v29 = __Block_byref_object_dispose__12;
      id v30 = 0;
      char v11 = dispatch_group_create();
      dispatch_group_enter(v11);
      id v12 = [v3 readChannel];
      v21[0] = MEMORY[0x263EF8330];
      v21[1] = 3221225472;
      v21[2] = __64__TSUZipFileArchive_copyToTemporaryLocationRelativeToURL_error___block_invoke_2;
      v21[3] = &unk_264D61798;
      id v24 = &v25;
      uint64_t v13 = v11;
      uint64_t v22 = v13;
      id v14 = v10;
      id v23 = v14;
      [v12 readFromOffset:0 length:-1 handler:v21];

      dispatch_group_wait(v13, 0xFFFFFFFFFFFFFFFFLL);
      [v14 close];

      id v15 = v26;
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v26[5] == 0;
      if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
      {
        objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), (id)v15[5]);
        if (TSUDefaultCat_init_token != -1) {
          dispatch_once(&TSUDefaultCat_init_token, &__block_literal_global_26_0);
        }
      }

      _Block_object_dispose(&v25, 8);
      id v10 = 0;
    }
    else if (TSUDefaultCat_init_token != -1)
    {
      dispatch_once(&TSUDefaultCat_init_token, &__block_literal_global_28);
    }
    uint64_t v16 = *(void *)(*(void *)(a1 + 56) + 8);
    if (*(unsigned char *)(v16 + 24))
    {
      v17 = *(void **)(a1 + 32);
      uint64_t v18 = *(void *)(*(void *)(a1 + 48) + 8);
      id obj = *(id *)(v18 + 40);
      char v19 = [v17 reopenWithTemporaryURL:v7 error:&obj];
      objc_storeStrong((id *)(v18 + 40), obj);
      uint64_t v16 = *(void *)(*(void *)(a1 + 56) + 8);
    }
    else
    {
      char v19 = 0;
    }
    *(unsigned char *)(v16 + 24) = v19;
    if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)) {
      [*(id *)(a1 + 32) removeTemporaryDirectory];
    }

    [v3 waitForAccessToEnd];
  }
}

void __64__TSUZipFileArchive_copyToTemporaryLocationRelativeToURL_error___block_invoke_2(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7 = a3;
  unint64_t v8 = a4;
  uint64_t v9 = (void *)v8;
  if (v7 && !(v8 | *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)))
  {
    dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __64__TSUZipFileArchive_copyToTemporaryLocationRelativeToURL_error___block_invoke_3;
    v14[3] = &unk_264D61770;
    id v10 = *(void **)(a1 + 40);
    uint64_t v16 = *(void *)(a1 + 48);
    id v15 = *(id *)(a1 + 32);
    [v10 writeData:v7 handler:v14];
  }
  if (a2)
  {
    if (v9)
    {
      uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
      uint64_t v13 = *(void *)(v11 + 40);
      id v12 = (id *)(v11 + 40);
      if (!v13) {
        objc_storeStrong(v12, a4);
      }
    }
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }
}

void __64__TSUZipFileArchive_copyToTemporaryLocationRelativeToURL_error___block_invoke_3(uint64_t a1, int a2, void *a3, void *a4)
{
  id v12 = a3;
  id v7 = a4;
  unint64_t v8 = v7;
  if (a2)
  {
    if (v7)
    {
      uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
      uint64_t v11 = *(void *)(v9 + 40);
      id v10 = (id *)(v9 + 40);
      if (!v11) {
        objc_storeStrong(v10, a4);
      }
    }
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }
}

void __64__TSUZipFileArchive_copyToTemporaryLocationRelativeToURL_error___block_invoke_4()
{
  uint64_t v0 = TSULogCreateCategory("TSUDefaultCat");
  uint64_t v1 = (void *)TSUDefaultCat_log_t;
  TSUDefaultCat_log_t = v0;
}

void __64__TSUZipFileArchive_copyToTemporaryLocationRelativeToURL_error___block_invoke_5()
{
  uint64_t v0 = TSULogCreateCategory("TSUDefaultCat");
  uint64_t v1 = (void *)TSUDefaultCat_log_t;
  TSUDefaultCat_log_t = v0;
}

- (unint64_t)archiveLength
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __34__TSUZipFileArchive_archiveLength__block_invoke;
  v5[3] = &unk_264D612C0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __34__TSUZipFileArchive_archiveLength__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 48);
  return result;
}

- (id)newArchiveReadChannel
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__12;
  id v10 = __Block_byref_object_dispose__12;
  id v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __42__TSUZipFileArchive_newArchiveReadChannel__block_invoke;
  v5[3] = &unk_264D615E0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __42__TSUZipFileArchive_newArchiveReadChannel__block_invoke(uint64_t a1)
{
  id v2 = *(id *)(*(void *)(a1 + 32) + 56);
  id v3 = v2;
  if (!v2)
  {
    if (TSUDefaultCat_init_token == -1) {
      goto LABEL_7;
    }
    id v11 = &__block_literal_global_33;
    goto LABEL_10;
  }
  uint64_t v4 = dup([v2 fileDescriptor]);
  if ((v4 & 0x80000000) != 0)
  {
    if (TSUDefaultCat_init_token == -1) {
      goto LABEL_7;
    }
    id v11 = &__block_literal_global_31;
LABEL_10:
    dispatch_once(&TSUDefaultCat_init_token, v11);
    goto LABEL_7;
  }
  uint64_t v5 = v4;
  [v3 beginAccess];
  uint64_t v6 = [TSUFileIOChannel alloc];
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 40);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __42__TSUZipFileArchive_newArchiveReadChannel__block_invoke_2;
  v12[3] = &unk_264D617E8;
  int v14 = v5;
  id v13 = v3;
  uint64_t v8 = [(TSUFileIOChannel *)v6 initForReadingDescriptor:v5 queue:v7 cleanupHandler:v12];
  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

LABEL_7:
}

uint64_t __42__TSUZipFileArchive_newArchiveReadChannel__block_invoke_2(uint64_t a1)
{
  close(*(_DWORD *)(a1 + 40));
  id v2 = *(void **)(a1 + 32);
  return [v2 endAccess];
}

void __42__TSUZipFileArchive_newArchiveReadChannel__block_invoke_3()
{
  uint64_t v0 = TSULogCreateCategory("TSUDefaultCat");
  uint64_t v1 = (void *)TSUDefaultCat_log_t;
  TSUDefaultCat_log_t = v0;
}

void __42__TSUZipFileArchive_newArchiveReadChannel__block_invoke_4()
{
  uint64_t v0 = TSULogCreateCategory("TSUDefaultCat");
  uint64_t v1 = (void *)TSUDefaultCat_log_t;
  TSUDefaultCat_log_t = v0;
}

- (BOOL)isValid
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __28__TSUZipFileArchive_isValid__block_invoke;
  v5[3] = &unk_264D615E0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

ssize_t __28__TSUZipFileArchive_isValid__block_invoke(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 56);
  if (v2) {
    ssize_t result = [v2 fileDescriptor];
  }
  else {
    ssize_t result = 0xFFFFFFFFLL;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = (int)result >= 0;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    char v4 = 0;
    ssize_t result = read(result, &v4, 0);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result == 0;
  }
  return result;
}

- (id)debugDescription
{
  char v3 = +[OITSUDescription descriptionWithObject:self class:objc_opt_class()];
  char v4 = objc_msgSend(NSString, "stringWithFormat:", @"%qu", self->_archiveLength);
  [v3 addField:@"archiveLength" value:v4];

  v8.receiver = self;
  v8.super_class = (Class)TSUZipFileArchive;
  uint64_t v5 = [(TSUZipArchive *)&v8 debugDescription];
  [v3 addFieldValue:v5];

  uint64_t v6 = [v3 descriptionString];

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_temporaryDirectoryURL, 0);
  objc_storeStrong((id *)&self->_fdWrapper, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

@end