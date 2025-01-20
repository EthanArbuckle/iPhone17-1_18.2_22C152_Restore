@interface PKZipArchiver
- (id)zippedDataForURL:(id)a3;
- (void)unzipStream:(id)a3 toPath:(id)a4 completionHandler:(id)a5;
- (void)unzipStream:(id)a3 toURL:(id)a4 completionHandler:(id)a5;
@end

@implementation PKZipArchiver

- (void)unzipStream:(id)a3 toPath:(id)a4 completionHandler:(id)a5
{
  v8 = (void *)MEMORY[0x1E4F1CB10];
  id v9 = a5;
  id v10 = a3;
  id v11 = [v8 fileURLWithPath:a4];
  [(PKZipArchiver *)self unzipStream:v10 toURL:v11 completionHandler:v9];
}

- (void)unzipStream:(id)a3 toURL:(id)a4 completionHandler:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = v9;
  if (v7)
  {
    id v11 = dispatch_get_global_queue(0, 0);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __53__PKZipArchiver_unzipStream_toURL_completionHandler___block_invoke;
    v13[3] = &unk_1E56D89F0;
    id v14 = v7;
    id v15 = v8;
    id v16 = v10;
    v12 = v13;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __dispatch_async_ar_block_invoke_1;
    block[3] = &unk_1E56D8360;
    id v18 = v12;
    dispatch_async(v11, block);
  }
  else if (v9)
  {
    (*((void (**)(id, void))v9 + 2))(v9, 0);
  }
}

uint64_t __53__PKZipArchiver_unzipStream_toURL_completionHandler___block_invoke(uint64_t a1)
{
  size_t v2 = NSPageSize();
  v3 = malloc_type_malloc(v2, 0xD780132FuLL);
  if (v3)
  {
    v4 = (NSData *)objc_alloc_init(MEMORY[0x1E4F1CA58]);
    if (v4)
    {
      v5 = v4;
      uint64_t v6 = [*(id *)(a1 + 32) read:v3 maxLength:v2];
      if (!v6)
      {
LABEL_7:
        free(v3);
        PKUnarchiverZip(v5, *(NSURL **)(a1 + 40));

        goto LABEL_10;
      }
      uint64_t v7 = v6;
      while ((v7 & 0x8000000000000000) == 0)
      {
        -[NSData appendBytes:length:](v5, "appendBytes:length:", v3);
        uint64_t v7 = [*(id *)(a1 + 32) read:v3 maxLength:v2];
        if (!v7) {
          goto LABEL_7;
        }
      }
    }
    free(v3);
  }
LABEL_10:
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    id v9 = *(uint64_t (**)(void))(result + 16);
    return v9();
  }
  return result;
}

- (id)zippedDataForURL:(id)a3
{
  return PKArchiverZipData((NSURL *)a3);
}

@end