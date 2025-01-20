@interface TSUZipFileArchive
+ (void)readArchiveFromURL:(id)a3 queue:(id)a4 completion:(id)a5;
- (BOOL)copyToTemporaryLocationRelativeToURL:(id)a3;
- (BOOL)openWithURL:(id)a3;
- (BOOL)reopenWithTemporaryURL:(id)a3;
- (TSUZipFileArchive)initWithURL:(id)a3;
- (TSUZipFileArchive)initWithWriter:(id)a3 atURL:(id)a4;
- (id)debugDescription;
- (id)readChannel;
- (unint64_t)archiveLength;
- (void)createTemporaryDirectoryRelativeToURL:(id)a3;
- (void)dealloc;
- (void)removeTemporaryDirectory;
@end

@implementation TSUZipFileArchive

+ (void)readArchiveFromURL:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v8 = a5;
  v9 = a4;
  id v10 = a3;
  v11 = (void *)[objc_alloc((Class)a1) initWithURL:v10];

  if (v11)
  {
    [v11 readArchiveWithQueue:v9 completion:v8];
  }
  else
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __57__TSUZipFileArchive_readArchiveFromURL_queue_completion___block_invoke;
    block[3] = &unk_26462A730;
    v13 = v8;
    dispatch_async(v9, block);

    v9 = v13;
  }
}

void __57__TSUZipFileArchive_readArchiveFromURL_queue_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  objc_msgSend(MEMORY[0x263F087E8], "tsu_IOErrorWithCode:", 0);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

- (TSUZipFileArchive)initWithURL:(id)a3
{
  id v4 = a3;
  if (([v4 isFileURL] & 1) == 0)
  {
    v5 = +[TSUAssertionHandler currentHandler];
    v6 = [NSString stringWithUTF8String:"-[TSUZipFileArchive initWithURL:]"];
    v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUZipFileArchive.m"];
    [v5 handleFailureInFunction:v6 file:v7 lineNumber:46 description:@"Need a file URL"];
  }
  v12.receiver = self;
  v12.super_class = (Class)TSUZipFileArchive;
  id v8 = [(TSUZipArchive *)&v12 init];
  if (v8)
  {
    dispatch_queue_t v9 = dispatch_queue_create("TSUZipFileArchive.Access", 0);
    accessQueue = v8->_accessQueue;
    v8->_accessQueue = (OS_dispatch_queue *)v9;

    if (![(TSUZipFileArchive *)v8 openWithURL:v4])
    {

      id v8 = 0;
    }
  }

  return v8;
}

- (BOOL)openWithURL:(id)a3
{
  id v4 = a3;
  if (self->_archiveReadChannel)
  {
    v5 = +[TSUAssertionHandler currentHandler];
    v6 = [NSString stringWithUTF8String:"-[TSUZipFileArchive openWithURL:]"];
    v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUZipFileArchive.m"];
    [v5 handleFailureInFunction:v6 file:v7 lineNumber:67 description:@"Shouldn't open the archive if it's already open."];
  }
  v23 = 0;
  uint64_t v8 = *MEMORY[0x263EFF688];
  id v22 = 0;
  int v9 = [v4 getResourceValue:&v23 forKey:v8 error:&v22];
  id v10 = v23;
  id v11 = v22;
  id v12 = v10;
  v17 = v12;
  if (v9)
  {
    self->_archiveLength = [v12 unsignedLongLongValue];
    v18 = [[TSUFileIOChannel alloc] initForReadingURL:v4];
    archiveReadChannel = self->_archiveReadChannel;
    self->_archiveReadChannel = v18;

    BOOL v20 = self->_archiveReadChannel != 0;
  }
  else
  {
    TSULogErrorInFunction((uint64_t)"-[TSUZipFileArchive openWithURL:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUZipFileArchive.m", 87, @"Couldn't get size for %@: %@", v13, v14, v15, v16, (uint64_t)v4);

    BOOL v20 = 0;
  }

  return v20;
}

- (TSUZipFileArchive)initWithWriter:(id)a3 atURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(TSUZipFileArchive *)self initWithURL:v7];
  int v9 = v8;
  if (v8)
  {
    unint64_t archiveLength = v8->_archiveLength;
    if (archiveLength != [v6 archiveLength])
    {
      id v11 = +[TSUAssertionHandler currentHandler];
      id v12 = [NSString stringWithUTF8String:"-[TSUZipFileArchive initWithWriter:atURL:]"];
      uint64_t v13 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUZipFileArchive.m"];
      uint64_t v14 = [v7 path];
      [v11 handleFailureInFunction:v12, v13, 103, @"Length of archive at %@ doesn't match archive length of writer. %llu != %llu", v14, v9->_archiveLength, objc_msgSend(v6, "archiveLength") file lineNumber description];
    }
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __42__TSUZipFileArchive_initWithWriter_atURL___block_invoke;
    v16[3] = &unk_26462A7A8;
    v17 = v9;
    [v6 enumerateEntriesUsingBlock:v16];
  }
  return v9;
}

uint64_t __42__TSUZipFileArchive_initWithWriter_atURL___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addEntry:a2];
}

- (void)dealloc
{
  self->_unint64_t archiveLength = 0;
  archiveReadChannel = self->_archiveReadChannel;
  self->_archiveReadChannel = 0;

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
    v5 = [MEMORY[0x263F08850] defaultManager];
    id v6 = [v5 URLForDirectory:99 inDomain:1 appropriateForURL:v11 create:1 error:0];
    temporaryDirectoryURL = self->_temporaryDirectoryURL;
    self->_temporaryDirectoryURL = v6;

    id v4 = v11;
    if (!self->_temporaryDirectoryURL)
    {
LABEL_4:
      uint64_t v8 = [[TSUTemporaryDirectory alloc] initWithSignature:@"ZipFile"];
      [(TSUTemporaryDirectory *)v8 leakTemporaryDirectory];
      int v9 = [(TSUTemporaryDirectory *)v8 URL];
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
    v3 = [MEMORY[0x263F08850] defaultManager];
    temporaryDirectoryURL = self->_temporaryDirectoryURL;
    id v12 = 0;
    char v5 = [v3 removeItemAtURL:temporaryDirectoryURL error:&v12];
    id v6 = v12;

    if ((v5 & 1) == 0) {
      TSULogErrorInFunction((uint64_t)"-[TSUZipFileArchive removeTemporaryDirectory]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUZipFileArchive.m", 153, @"Failed to remove temporary directory with error: %@", v7, v8, v9, v10, (uint64_t)v6);
    }
    id v11 = self->_temporaryDirectoryURL;
    self->_temporaryDirectoryURL = 0;
  }
}

- (BOOL)reopenWithTemporaryURL:(id)a3
{
  unint64_t archiveLength = self->_archiveLength;
  p_archiveReadChannel = (id *)&self->_archiveReadChannel;
  archiveReadChannel = self->_archiveReadChannel;
  uint64_t v8 = archiveReadChannel;
  self->_unint64_t archiveLength = 0;
  id v9 = *p_archiveReadChannel;
  id *p_archiveReadChannel = 0;
  id v10 = a3;

  BOOL v11 = [(TSUZipFileArchive *)self openWithURL:v10];
  if (!v11)
  {
    self->_unint64_t archiveLength = archiveLength;
    objc_storeStrong(p_archiveReadChannel, archiveReadChannel);
  }

  return v11;
}

- (BOOL)copyToTemporaryLocationRelativeToURL:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  accessQueue = self->_accessQueue;
  char v14 = 0;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __58__TSUZipFileArchive_copyToTemporaryLocationRelativeToURL___block_invoke;
  block[3] = &unk_26462A820;
  void block[4] = self;
  id v9 = v4;
  id v10 = &v11;
  id v6 = v4;
  dispatch_sync(accessQueue, block);
  LOBYTE(accessQueue) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)accessQueue;
}

void __58__TSUZipFileArchive_copyToTemporaryLocationRelativeToURL___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  if (v2[5])
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
  else
  {
    if (!v2[4])
    {
      v3 = +[TSUAssertionHandler currentHandler];
      id v4 = [NSString stringWithUTF8String:"-[TSUZipFileArchive copyToTemporaryLocationRelativeToURL:]_block_invoke"];
      char v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUZipFileArchive.m"];
      [v3 handleFailureInFunction:v4 file:v5 lineNumber:187 description:@"Read channel should be initialized."];

      id v2 = *(void **)(a1 + 32);
    }
    [v2 createTemporaryDirectoryRelativeToURL:*(void *)(a1 + 40)];
    id v6 = [*(id *)(*(void *)(a1 + 32) + 40) URLByAppendingPathComponent:@"Temp.zip"];
    if (v6) {
      id v7 = [[TSUFileIOChannel alloc] initForStreamWritingURL:v6];
    }
    else {
      id v7 = 0;
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v7 != 0;
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
    {
      uint64_t v32 = 0;
      v33 = &v32;
      uint64_t v34 = 0x3032000000;
      v35 = __Block_byref_object_copy__3;
      v36 = __Block_byref_object_dispose__3;
      id v37 = 0;
      uint64_t v8 = dispatch_group_create();
      dispatch_queue_t v9 = dispatch_queue_create("TSUZipFileArchive.Copy", 0);
      dispatch_group_enter(v8);
      id v10 = *(void **)(*(void *)(a1 + 32) + 32);
      v27[0] = MEMORY[0x263EF8330];
      v27[1] = 3221225472;
      v27[2] = __58__TSUZipFileArchive_copyToTemporaryLocationRelativeToURL___block_invoke_34;
      v27[3] = &unk_26462A7F8;
      v31 = &v32;
      uint64_t v11 = v8;
      v28 = v11;
      id v12 = v7;
      id v29 = v12;
      uint64_t v13 = v9;
      v30 = v13;
      [v10 readFromOffset:0 length:-1 queue:v13 handler:v27];
      dispatch_group_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
      [v12 close];

      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v33[5] == 0;
      if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
      {
        char v14 = [*(id *)(a1 + 40) path];
        v26 = [v6 path];
        TSULogErrorInFunction((uint64_t)"-[TSUZipFileArchive copyToTemporaryLocationRelativeToURL:]_block_invoke_3", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUZipFileArchive.m", 238, @"Failed to copy zip file from %@ to %@ with error: %@", v15, v16, v17, v18, (uint64_t)v14);
      }
      _Block_object_dispose(&v32, 8);

      id v7 = 0;
    }
    else
    {
      v19 = [v6 path];
      TSULogErrorInFunction((uint64_t)"-[TSUZipFileArchive copyToTemporaryLocationRelativeToURL:]_block_invoke_3", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUZipFileArchive.m", 243, @"Failed to write to temporary zip file: %@", v20, v21, v22, v23, (uint64_t)v19);
    }
    uint64_t v24 = *(void *)(*(void *)(a1 + 48) + 8);
    if (*(unsigned char *)(v24 + 24))
    {
      char v25 = [*(id *)(a1 + 32) reopenWithTemporaryURL:v6];
      uint64_t v24 = *(void *)(*(void *)(a1 + 48) + 8);
    }
    else
    {
      char v25 = 0;
    }
    *(unsigned char *)(v24 + 24) = v25;
    if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
      [*(id *)(a1 + 32) removeTemporaryDirectory];
    }
  }
}

void __58__TSUZipFileArchive_copyToTemporaryLocationRelativeToURL___block_invoke_34(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7 = a3;
  unint64_t v8 = a4;
  dispatch_queue_t v9 = (void *)v8;
  if (v7 && !(v8 | *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)))
  {
    dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
    id v10 = *(void **)(a1 + 40);
    uint64_t v11 = *(void *)(a1 + 48);
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __58__TSUZipFileArchive_copyToTemporaryLocationRelativeToURL___block_invoke_2;
    v15[3] = &unk_26462A7D0;
    uint64_t v17 = *(void *)(a1 + 56);
    id v16 = *(id *)(a1 + 32);
    [v10 writeData:v7 queue:v11 handler:v15];
  }
  if (a2)
  {
    if (v9)
    {
      uint64_t v12 = *(void *)(*(void *)(a1 + 56) + 8);
      uint64_t v14 = *(void *)(v12 + 40);
      uint64_t v13 = (id *)(v12 + 40);
      if (!v14) {
        objc_storeStrong(v13, a4);
      }
    }
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }
}

void __58__TSUZipFileArchive_copyToTemporaryLocationRelativeToURL___block_invoke_2(uint64_t a1, int a2, void *a3, void *a4)
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
  v5[3] = &unk_26462A848;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __34__TSUZipFileArchive_archiveLength__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 24);
  return result;
}

- (id)readChannel
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__3;
  id v10 = __Block_byref_object_dispose__3;
  id v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __32__TSUZipFileArchive_readChannel__block_invoke;
  v5[3] = &unk_26462A848;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __32__TSUZipFileArchive_readChannel__block_invoke(uint64_t a1)
{
}

- (id)debugDescription
{
  id v3 = +[TSUDescription descriptionWithObject:self class:objc_opt_class()];
  id v4 = objc_msgSend(NSString, "stringWithFormat:", @"%qu", self->_archiveLength);
  [v3 addField:@"archiveLength" value:v4];

  v8.receiver = self;
  v8.super_class = (Class)TSUZipFileArchive;
  char v5 = [(TSUZipArchive *)&v8 debugDescription];
  [v3 addFieldValue:v5];

  uint64_t v6 = [v3 descriptionString];

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_temporaryDirectoryURL, 0);
  objc_storeStrong((id *)&self->_archiveReadChannel, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

@end