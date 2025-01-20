@interface NUNICloudCoverFileConverter
- (BOOL)_combineFilesAt:(id)a3 to:(id)a4 error:(id *)a5;
- (BOOL)_convertFileAt:(id)a3 to:(id)a4 error:(id *)a5;
- (BOOL)combineFilesAt:(id)a3 to:(id)a4 error:(id *)a5;
- (BOOL)convertFileAt:(id)a3 to:(id)a4 error:(id *)a5;
- (NUNICloudCoverFileConverter)init;
@end

@implementation NUNICloudCoverFileConverter

- (NUNICloudCoverFileConverter)init
{
  v6.receiver = self;
  v6.super_class = (Class)NUNICloudCoverFileConverter;
  v2 = [(NUNICloudCoverFileConverter *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.NanoUniverse.NUNICloudCoverFileConverter", 0);
    privateQueue = v2->_privateQueue;
    v2->_privateQueue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

- (BOOL)convertFileAt:(id)a3 to:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  privateQueue = self->_privateQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__NUNICloudCoverFileConverter_convertFileAt_to_error___block_invoke;
  block[3] = &unk_2644CD8D0;
  block[4] = self;
  id v15 = v8;
  id v16 = v9;
  v17 = &v19;
  v18 = a5;
  id v11 = v9;
  id v12 = v8;
  dispatch_sync(privateQueue, block);
  LOBYTE(privateQueue) = *((unsigned char *)v20 + 24);

  _Block_object_dispose(&v19, 8);
  return (char)privateQueue;
}

uint64_t __54__NUNICloudCoverFileConverter_convertFileAt_to_error___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _convertFileAt:*(void *)(a1 + 40) to:*(void *)(a1 + 48) error:*(void *)(a1 + 64)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = result;
  return result;
}

- (BOOL)combineFilesAt:(id)a3 to:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  privateQueue = self->_privateQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__NUNICloudCoverFileConverter_combineFilesAt_to_error___block_invoke;
  block[3] = &unk_2644CD8D0;
  block[4] = self;
  id v15 = v8;
  id v16 = v9;
  v17 = &v19;
  v18 = a5;
  id v11 = v9;
  id v12 = v8;
  dispatch_sync(privateQueue, block);
  LOBYTE(privateQueue) = *((unsigned char *)v20 + 24);

  _Block_object_dispose(&v19, 8);
  return (char)privateQueue;
}

uint64_t __55__NUNICloudCoverFileConverter_combineFilesAt_to_error___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _combineFilesAt:*(void *)(a1 + 40) to:*(void *)(a1 + 48) error:*(void *)(a1 + 64)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = result;
  return result;
}

- (BOOL)_convertFileAt:(id)a3 to:(id)a4 error:(id *)a5
{
  id v7 = a4;
  id v8 = _NUNICreateImageFromURL(a3, a5);
  if (v8)
  {
    id v9 = v8;
    int Width = CGImageGetWidth(v8);
    int Height = CGImageGetHeight(v9);
    id v12 = _NUNIRasterizeImageGenericGray(v9, Width, Height);
    CGImageRelease(v9);
    v13 = _NUNIEqualize(v12, Width, Height);

    v14 = _NUNIInitializeImageGenericGray(Width, Height);
    _NUNIAddCloudLayer(v13, v14, Width, Height);
    id v15 = _NUNIConvertEquirectangularToOctahedral(v14, Width, Height);

    id v16 = (id) [objc_alloc(MEMORY[0x263EFF990]) initWithLength:5592413];
    uint64_t v17 = [v16 mutableBytes];
    *(_WORD *)uint64_t v17 = 7;
    *(_DWORD *)(v17 + 2) = 134220809;
    *(_WORD *)(v17 + 6) = 2048;
    v18 = (unsigned __int8 *)(v17 + 8);
    id v19 = v15;
    _NUNIGenerateAllMipmapsR8(v18, (const void *)[v19 bytes]);
    v20 = [v7 path];
    char v21 = [v16 writeToFile:v20 options:268435457 error:a5];
  }
  else
  {
    char v21 = 0;
  }

  return v21;
}

- (BOOL)_combineFilesAt:(id)a3 to:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  if ([v7 count])
  {
    uint64_t v9 = 0;
    v10 = 0;
    id v11 = 0;
    while (1)
    {
      id v12 = [v7 objectAtIndexedSubscript:v9];
      v13 = _NUNICreateImageFromURL(v12, a5);

      if (!v13) {
        break;
      }
      int Width = CGImageGetWidth(v13);
      int Height = CGImageGetHeight(v13);
      if (!v11)
      {
        _NUNIInitializeImageGenericGray(Width, Height);
        id v11 = (id)objc_claimAutoreleasedReturnValue();
      }
      id v16 = _NUNIRasterizeImageGenericGray(v13, Width, Height);

      CGImageRelease(v13);
      v10 = _NUNIEqualize(v16, Width, Height);

      _NUNIAddCloudLayer(v10, v11, Width, Height);
      if ([v7 count] <= (unint64_t)++v9) {
        goto LABEL_9;
      }
    }
    char v22 = 0;
  }
  else
  {
    int Height = 0;
    int Width = 0;
    id v11 = 0;
    v10 = 0;
LABEL_9:
    uint64_t v17 = _NUNIConvertEquirectangularToOctahedral(v11, Width, Height);

    id v18 = (id) [objc_alloc(MEMORY[0x263EFF990]) initWithLength:5592413];
    uint64_t v19 = [v18 mutableBytes];
    *(_WORD *)uint64_t v19 = 7;
    *(_DWORD *)(v19 + 2) = 134220809;
    *(_WORD *)(v19 + 6) = 2048;
    v20 = (unsigned __int8 *)(v19 + 8);
    id v11 = v17;
    _NUNIGenerateAllMipmapsR8(v20, (const void *)[v11 bytes]);
    char v21 = [v8 path];
    char v22 = [v18 writeToFile:v21 options:268435457 error:a5];
  }
  return v22;
}

- (void).cxx_destruct
{
}

@end