@interface TSPFileManager
+ (BOOL)linkFileAtPath:(id)a3 toPath:(id)a4;
+ (BOOL)linkFileAtURL:(id)a3 toURL:(id)a4;
+ (BOOL)linkOrCopyURL:(id)a3 decryptionKey:(id)a4 toURL:(id)a5 encryptionKey:(id)a6;
+ (BOOL)linkOrCopyURL:(id)a3 toURL:(id)a4;
@end

@implementation TSPFileManager

+ (BOOL)linkFileAtURL:(id)a3 toURL:(id)a4
{
  id v6 = a4;
  v7 = [a3 path];
  v8 = [v6 path];

  LOBYTE(a1) = [a1 linkFileAtPath:v7 toPath:v8];
  return (char)a1;
}

+ (BOOL)linkFileAtPath:(id)a3 toPath:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = UnsafePointer();
  v8 = [v7 bundlePath];
  v9 = [v8 stringByStandardizingPath];

  v10 = [v5 stringByStandardizingPath];
  v11 = [v9 stringByAppendingString:@"/"];
  char v12 = [v10 hasPrefix:v11];

  BOOL v13 = (v12 & 1) == 0 && TSULink() == 0;
  return v13;
}

+ (BOOL)linkOrCopyURL:(id)a3 toURL:(id)a4
{
  return [a1 linkOrCopyURL:a3 decryptionKey:0 toURL:a4 encryptionKey:0];
}

+ (BOOL)linkOrCopyURL:(id)a3 decryptionKey:(id)a4 toURL:(id)a5 encryptionKey:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  BOOL v14 = 0;
  if (v10 && v12)
  {
    uint64_t v33 = 0;
    v34 = &v33;
    uint64_t v35 = 0x2020000000;
    char v36 = 0;
    if (SFUEqualCryptoKeys())
    {
      char v15 = [a1 linkFileAtURL:v10 toURL:v12];
      *((unsigned char *)v34 + 24) = v15;
      if (v15)
      {
LABEL_11:
        BOOL v14 = *((unsigned char *)v34 + 24) != 0;
        _Block_object_dispose(&v33, 8);
        goto LABEL_12;
      }
      v16 = [MEMORY[0x263F08850] defaultManager];
      id v32 = 0;
      char v17 = [v16 copyItemAtURL:v10 toURL:v12 error:&v32];
      id v18 = v32;
      *((unsigned char *)v34 + 24) = v17;

      if (!*((unsigned char *)v34 + 24)) {
        TSULogErrorInFunction();
      }
    }
    else
    {
      id v18 = (id)[objc_alloc(MEMORY[0x263F7C830]) initForReadingURL:v10];
      v19 = (void *)[objc_alloc(MEMORY[0x263F7C830]) initForStreamWritingURL:v12];
      v20 = [[TSPCryptoTranscodeReadChannel alloc] initWithReadChannel:v18 decryptionKey:v11 encryptionKey:v13];
      if (v20)
      {
        dispatch_queue_t v21 = dispatch_queue_create("com.apple.iWork.CRYPTOREADCHANNEL", 0);
        dispatch_queue_t v22 = dispatch_queue_create("com.apple.iWork.FILEIOWRITECHANNEL", 0);
        *((unsigned char *)v34 + 24) = 1;
        dispatch_semaphore_t v23 = dispatch_semaphore_create(0);
        v27[0] = MEMORY[0x263EF8330];
        v27[1] = 3221225472;
        v27[2] = __66__TSPFileManager_linkOrCopyURL_decryptionKey_toURL_encryptionKey___block_invoke;
        v27[3] = &unk_2646B03A8;
        id v28 = v19;
        v24 = v22;
        v29 = v24;
        v31 = &v33;
        v25 = v23;
        v30 = v25;
        [(TSPCryptoTranscodeReadChannel *)v20 readWithQueue:v21 handler:v27];
        dispatch_semaphore_wait(v25, 0xFFFFFFFFFFFFFFFFLL);
        [(TSPCryptoTranscodeReadChannel *)v20 close];
      }
    }

    goto LABEL_11;
  }
LABEL_12:

  return v14;
}

void __66__TSPFileManager_linkOrCopyURL_decryptionKey_toURL_encryptionKey___block_invoke(uint64_t a1, int a2, void *a3, uint64_t a4)
{
  id v7 = a3;
  dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
  dispatch_semaphore_t v9 = v8;
  if (!v7 || a4)
  {
    if (a4)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
      [*(id *)(a1 + 32) close];
      dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
    }
  }
  else
  {
    id v10 = *(void **)(a1 + 32);
    uint64_t v11 = *(void *)(a1 + 40);
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __66__TSPFileManager_linkOrCopyURL_decryptionKey_toURL_encryptionKey___block_invoke_2;
    v13[3] = &unk_2646B0380;
    uint64_t v15 = *(void *)(a1 + 56);
    id v12 = v8;
    BOOL v14 = v12;
    [v10 writeData:v7 queue:v11 handler:v13];
    dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
  }
  if (a2) {
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
  }
}

void __66__TSPFileManager_linkOrCopyURL_decryptionKey_toURL_encryptionKey___block_invoke_2(uint64_t a1, int a2, void *a3, void *a4)
{
  id v8 = a3;
  id v7 = a4;
  if (v7)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  }
  if (a2) {
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  }
}

@end