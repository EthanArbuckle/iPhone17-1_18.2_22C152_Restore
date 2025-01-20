@interface OspreyZlibDataDecompressor
- (OspreyZlibDataDecompressor)init;
- (OspreyZlibDataDecompressor)initWithOptions:(int64_t)a3;
- (id)decompressedDataForData:(id)a3 error:(id *)a4;
- (void)dealloc;
@end

@implementation OspreyZlibDataDecompressor

- (OspreyZlibDataDecompressor)init
{
  return [(OspreyZlibDataDecompressor *)self initWithOptions:15];
}

- (OspreyZlibDataDecompressor)initWithOptions:(int64_t)a3
{
  int v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)OspreyZlibDataDecompressor;
  v4 = [(OspreyZlibDataDecompressor *)&v9 init];
  v5 = v4;
  if (!v4
    || (v4->_inflateStream.zalloc = 0,
        v4->_inflateStream.zfree = 0,
        v4->_inflateStream.opaque = 0,
        int v6 = inflateInit2_(&v4->_inflateStream, v3, "1.2.12", 112),
        v7 = 0,
        !v6))
  {
    v7 = v5;
  }

  return v7;
}

- (void)dealloc
{
  inflateEnd(&self->_inflateStream);
  v3.receiver = self;
  v3.super_class = (Class)OspreyZlibDataDecompressor;
  [(OspreyZlibDataDecompressor *)&v3 dealloc];
}

- (id)decompressedDataForData:(id)a3 error:(id *)a4
{
  int v6 = a3;
  v7 = v6;
  if (v6 && dispatch_data_get_size(v6))
  {
    uint64_t v19 = 0;
    v20 = &v19;
    uint64_t v21 = 0x3032000000;
    v22 = __Block_byref_object_copy_;
    v23 = __Block_byref_object_dispose_;
    v8 = (void *)MEMORY[0x1E4F14410];
    id v9 = MEMORY[0x1E4F14410];
    id v24 = v8;
    uint64_t v15 = 0;
    v16 = &v15;
    uint64_t v17 = 0x2020000000;
    int v18 = 0;
    applier[0] = MEMORY[0x1E4F143A8];
    applier[1] = 3221225472;
    applier[2] = __60__OspreyZlibDataDecompressor_decompressedDataForData_error___block_invoke;
    applier[3] = &unk_1E63CBC40;
    applier[4] = self;
    applier[5] = &v15;
    applier[6] = &v19;
    dispatch_data_apply(v7, applier);
    if (a4)
    {
      unsigned int v10 = *((_DWORD *)v16 + 6);
      if (v10 >= 2)
      {
        *a4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"OspreyCompressionErrorDomain" code:(int)v10 userInfo:0];
      }
    }
    id v11 = (id)v20[5];
    _Block_object_dispose(&v15, 8);
    _Block_object_dispose(&v19, 8);
  }
  else
  {
    id v11 = (id)MEMORY[0x1E4F14410];
    id v12 = MEMORY[0x1E4F14410];
  }

  return v11;
}

uint64_t __60__OspreyZlibDataDecompressor_decompressedDataForData_error___block_invoke(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  *(void *)(a1[4] + 8) = a4;
  *(_DWORD *)(a1[4] + 16) = a5;
  uint64_t v6 = a1[4];
  while (1)
  {
    *(void *)(v6 + 32) = v6 + 120;
    *(_DWORD *)(a1[4] + 40) = 0x2000;
    *(_DWORD *)(*(void *)(a1[5] + 8) + 24) = inflate((z_streamp)(a1[4] + 8), 4);
    if (*(_DWORD *)(*(void *)(a1[5] + 8) + 24) > 1u) {
      break;
    }
    v7 = dispatch_data_create((const void *)(a1[4] + 120), 0x2000 - *(unsigned int *)(a1[4] + 40), 0, 0);
    dispatch_data_t concat = dispatch_data_create_concat(*(dispatch_data_t *)(*(void *)(a1[6] + 8) + 40), v7);
    uint64_t v9 = *(void *)(a1[6] + 8);
    unsigned int v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = concat;

    if (*(_DWORD *)(*(void *)(a1[5] + 8) + 24)) {
      break;
    }
    uint64_t v6 = a1[4];
    if (*(_DWORD *)(v6 + 40) || !*(_DWORD *)(v6 + 16)) {
      return 1;
    }
  }
  return 0;
}

@end