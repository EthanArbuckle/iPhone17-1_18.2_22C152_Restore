@interface OITSUZipInflateReadChannel
- (BOOL)processData:(id)a3 inflateResult:(int *)a4 CRC:(unsigned int *)a5 isDone:(BOOL)a6 handler:(id)a7;
- (OITSUZipInflateReadChannel)initWithReadChannel:(id)a3 uncompressedSize:(unint64_t)a4 CRC:(unsigned int)a5 validateCRC:(BOOL)a6;
- (void)close;
- (void)dealloc;
- (void)handleFailureWithHandler:(id)a3 error:(id)a4;
- (void)prepareBuffer;
- (void)readWithHandler:(id)a3;
@end

@implementation OITSUZipInflateReadChannel

- (OITSUZipInflateReadChannel)initWithReadChannel:(id)a3 uncompressedSize:(unint64_t)a4 CRC:(unsigned int)a5 validateCRC:(BOOL)a6
{
  id v11 = a3;
  v15.receiver = self;
  v15.super_class = (Class)OITSUZipInflateReadChannel;
  v12 = [(OITSUZipInflateReadChannel *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_readChannel, a3);
    v13->_stream.next_in = 0;
    v13->_remainingUncompressedSize = a4;
    v13->_CRC = a5;
    v13->_validateCRC = a6;
    v13->_stream.avail_in = 0;
    v13->_stream.avail_out = 0;
    v13->_stream.next_out = 0;
    v13->_stream.zfree = 0;
    v13->_stream.opaque = 0;
    v13->_stream.zalloc = 0;
    if (inflateInit2_(&v13->_stream, -15, "1.2.12", 112))
    {
      if (TSUDefaultCat_init_token != -1) {
        dispatch_once(&TSUDefaultCat_init_token, &__block_literal_global_18);
      }

      v13 = 0;
    }
  }

  return v13;
}

void __83__OITSUZipInflateReadChannel_initWithReadChannel_uncompressedSize_CRC_validateCRC___block_invoke()
{
  uint64_t v0 = TSULogCreateCategory("TSUDefaultCat");
  v1 = (void *)TSUDefaultCat_log_t;
  TSUDefaultCat_log_t = v0;
}

- (void)dealloc
{
  [(OITSUZipInflateReadChannel *)self close];
  inflateEnd(&self->_stream);
  free(self->_outBuffer);
  v3.receiver = self;
  v3.super_class = (Class)OITSUZipInflateReadChannel;
  [(OITSUZipInflateReadChannel *)&v3 dealloc];
}

- (void)prepareBuffer
{
  if (self->_outBuffer)
  {
    objc_super v3 = [NSString stringWithUTF8String:"-[OITSUZipInflateReadChannel prepareBuffer]"];
    v4 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUZipInflateReadChannel.m"];
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v3, v4, 79, 0, "expected nil value for '%{public}s'", "_outBuffer");

    +[OITSUAssertionHandler logBacktraceThrottled];
  }
  unint64_t remainingUncompressedSize = self->_remainingUncompressedSize;
  if (remainingUncompressedSize >= 0x40000) {
    unint64_t v6 = 0x40000;
  }
  else {
    unint64_t v6 = self->_remainingUncompressedSize;
  }
  if (remainingUncompressedSize) {
    unint64_t v7 = v6;
  }
  else {
    unint64_t v7 = 0x40000;
  }
  self->_outBufferSize = v7;
  v8 = (char *)malloc_type_malloc(v7, 0x62401E6EuLL);
  self->_outBuffer = v8;
  self->_stream.avail_out = self->_outBufferSize;
  self->_stream.next_out = (Bytef *)v8;
}

- (void)readWithHandler:(id)a3
{
  id v4 = a3;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x2020000000;
  char v20 = 1;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x2020000000;
  char v18 = 1;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x2020000000;
  int v16 = 0;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2020000000;
  int v14 = 0;
  int v14 = crc32(0, 0, 0);
  readChannel = self->_readChannel;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __46__OITSUZipInflateReadChannel_readWithHandler___block_invoke;
  v7[3] = &unk_264D61228;
  v9 = v19;
  v7[4] = self;
  id v6 = v4;
  id v8 = v6;
  v10 = v15;
  id v11 = v17;
  v12 = v13;
  [(TSUStreamReadChannel *)readChannel readWithHandler:v7];

  _Block_object_dispose(v13, 8);
  _Block_object_dispose(v15, 8);
  _Block_object_dispose(v17, 8);
  _Block_object_dispose(v19, 8);
}

void __46__OITSUZipInflateReadChannel_readWithHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v11 = a3;
  id v7 = a4;
  uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
  int v9 = *(unsigned __int8 *)(v8 + 24);
  if (v7 && *(unsigned char *)(v8 + 24))
  {
    *(unsigned char *)(v8 + 24) = 0;
    [*(id *)(a1 + 32) handleFailureWithHandler:*(void *)(a1 + 40) error:v7];
    int v9 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  }
  if (v9)
  {
    uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 8);
    if (!*(_DWORD *)(v10 + 24))
    {
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
      {
        [*(id *)(a1 + 32) prepareBuffer];
        *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
        uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 8);
      }
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(a1 + 32) processData:v11 inflateResult:v10 + 24 CRC:*(void *)(*(void *)(a1 + 72) + 8) + 24 isDone:a2 handler:*(void *)(a1 + 40)];
    }
  }
}

- (BOOL)processData:(id)a3 inflateResult:(int *)a4 CRC:(unsigned int *)a5 isDone:(BOOL)a6 handler:(id)a7
{
  BOOL v8 = a6;
  v12 = a3;
  id v13 = a7;
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 1;
  applier[0] = MEMORY[0x263EF8330];
  applier[1] = 3221225472;
  applier[2] = __75__OITSUZipInflateReadChannel_processData_inflateResult_CRC_isDone_handler___block_invoke;
  applier[3] = &unk_264D61250;
  v21 = &v24;
  v22 = a4;
  applier[4] = self;
  v23 = a5;
  id v14 = v13;
  id v20 = v14;
  dispatch_data_apply(v12, applier);
  int v15 = *((unsigned __int8 *)v25 + 24);
  if (!self->_validateCRC) {
    goto LABEL_10;
  }
  if (!*((unsigned char *)v25 + 24)) {
    goto LABEL_19;
  }
  if (v8)
  {
    if (!a5)
    {
LABEL_9:
      int v15 = 1;
LABEL_10:
      if (v15 && v8)
      {
        if (*a4 != 1)
        {
          if (TSUDefaultCat_init_token == -1) {
            goto LABEL_18;
          }
          char v18 = &__block_literal_global_21;
          goto LABEL_23;
        }
        goto LABEL_16;
      }
      if (v15)
      {
LABEL_16:
        BOOL v16 = 1;
        goto LABEL_20;
      }
LABEL_19:
      [(OITSUZipInflateReadChannel *)self handleFailureWithHandler:v14 error:0];
      BOOL v16 = *((unsigned char *)v25 + 24) != 0;
      goto LABEL_20;
    }
LABEL_8:
    if (self->_CRC != *a5)
    {
      if (TSUDefaultCat_init_token == -1)
      {
LABEL_18:
        *((unsigned char *)v25 + 24) = 0;
        goto LABEL_19;
      }
      char v18 = &__block_literal_global_19;
LABEL_23:
      dispatch_once(&TSUDefaultCat_init_token, v18);
      goto LABEL_18;
    }
    goto LABEL_9;
  }
  BOOL v16 = 1;
  if (a5 && *a4 == 1) {
    goto LABEL_8;
  }
LABEL_20:

  _Block_object_dispose(&v24, 8);
  return v16;
}

uint64_t __75__OITSUZipInflateReadChannel_processData_inflateResult_CRC_isDone_handler___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  id v8 = a2;
  if (HIDWORD(a5))
  {
    if (TSUDefaultCat_init_token == -1) {
      goto LABEL_31;
    }
    v33 = &__block_literal_global_11;
    goto LABEL_37;
  }
  uint64_t v9 = *(void *)(a1 + 32);
  if (!*(_DWORD *)(v9 + 64))
  {
    v30 = [NSString stringWithUTF8String:"-[OITSUZipInflateReadChannel processData:inflateResult:CRC:isDone:handler:]_block_invoke"];
    v31 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUZipInflateReadChannel.m"];
    +[OITSUAssertionHandler handleFailureInFunction:v30 file:v31 lineNumber:127 isFatal:0 description:"Buffer should have been initialized."];

    +[OITSUAssertionHandler logBacktraceThrottled];
LABEL_31:
    uint64_t v11 = 0;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    goto LABEL_32;
  }
  *(_DWORD *)(v9 + 40) = a5;
  *(void *)(*(void *)(a1 + 32) + 32) = a4;
  uint64_t v10 = *(void *)(a1 + 32);
  uint64_t v11 = 1;
  if (*(_DWORD *)(v10 + 40))
  {
    v12 = (void *)*MEMORY[0x263EF8378];
    while (1)
    {
      if (**(_DWORD **)(a1 + 56))
      {
LABEL_33:
        uint64_t v11 = 1;
        goto LABEL_32;
      }
      int v13 = inflate((z_streamp)(v10 + 32), 0);
      **(_DWORD **)(a1 + 56) = v13;
      if ((v13 + 5) > 6 || ((1 << (v13 + 5)) & 0x61) == 0) {
        break;
      }
      int v15 = v13;
      uint64_t v10 = *(void *)(a1 + 32);
      if (v13 == 1 || !*(_DWORD *)(v10 + 64))
      {
        size_t v16 = *(void *)(v10 + 144);
        size_t v17 = v16 - *(unsigned int *)(v10 + 64);
        if (*(unsigned char *)(v10 + 28))
        {
          char v18 = *(unsigned int **)(a1 + 64);
          if (v18)
          {
            uLong v19 = *v18;
            id v20 = *(const Bytef **)(v10 + 152);
            if (HIDWORD(v17))
            {
              v35 = [NSString stringWithUTF8String:"-[OITSUZipInflateReadChannel processData:inflateResult:CRC:isDone:handler:]_block_invoke"];
              v34 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUZipInflateReadChannel.m"];
              +[OITSUAssertionHandler handleFailureInFunction:v35 file:v34 lineNumber:151 isFatal:0 description:"Out-of-bounds type assignment was clamped to max"];

              +[OITSUAssertionHandler logBacktraceThrottled];
              uInt v21 = -1;
            }
            else
            {
              uInt v21 = v16 - *(_DWORD *)(v10 + 64);
            }
            **(_DWORD **)(a1 + 64) = crc32(v19, v20, v21);
            uint64_t v10 = *(void *)(a1 + 32);
            size_t v16 = *(void *)(v10 + 144);
          }
        }
        dispatch_data_t v22 = dispatch_data_create(*(const void **)(v10 + 152), v16, 0, v12);
        dispatch_data_t v23 = v22;
        if (*(void *)(*(void *)(a1 + 32) + 144) == v17) {
          dispatch_data_t subrange = v22;
        }
        else {
          dispatch_data_t subrange = dispatch_data_create_subrange(v22, 0, v17);
        }
        dispatch_data_t v25 = subrange;
        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
        *(void *)(*(void *)(a1 + 32) + 144) = 0;
        *(void *)(*(void *)(a1 + 32) + 152) = 0;
        uint64_t v26 = *(void *)(a1 + 32);
        size_t v27 = *(void *)(v26 + 16);
        BOOL v28 = v27 >= v17;
        size_t v29 = v27 - v17;
        if (!v28) {
          size_t v29 = 0;
        }
        *(void *)(v26 + 16) = v29;
        if (v15 != 1) {
          [*(id *)(a1 + 32) prepareBuffer];
        }

        uint64_t v10 = *(void *)(a1 + 32);
      }
      if (!*(_DWORD *)(v10 + 40)) {
        goto LABEL_33;
      }
    }
    if (TSUDefaultCat_init_token == -1) {
      goto LABEL_31;
    }
    v33 = &__block_literal_global_14_1;
LABEL_37:
    dispatch_once(&TSUDefaultCat_init_token, v33);
    goto LABEL_31;
  }
LABEL_32:

  return v11;
}

void __75__OITSUZipInflateReadChannel_processData_inflateResult_CRC_isDone_handler___block_invoke_2()
{
  uint64_t v0 = TSULogCreateCategory("TSUDefaultCat");
  v1 = (void *)TSUDefaultCat_log_t;
  TSUDefaultCat_log_t = v0;
}

void __75__OITSUZipInflateReadChannel_processData_inflateResult_CRC_isDone_handler___block_invoke_3()
{
  uint64_t v0 = TSULogCreateCategory("TSUDefaultCat");
  v1 = (void *)TSUDefaultCat_log_t;
  TSUDefaultCat_log_t = v0;
}

void __75__OITSUZipInflateReadChannel_processData_inflateResult_CRC_isDone_handler___block_invoke_4()
{
  uint64_t v0 = TSULogCreateCategory("TSUDefaultCat");
  v1 = (void *)TSUDefaultCat_log_t;
  TSUDefaultCat_log_t = v0;
}

void __75__OITSUZipInflateReadChannel_processData_inflateResult_CRC_isDone_handler___block_invoke_5()
{
  uint64_t v0 = TSULogCreateCategory("TSUDefaultCat");
  v1 = (void *)TSUDefaultCat_log_t;
  TSUDefaultCat_log_t = v0;
}

- (void)handleFailureWithHandler:(id)a3 error:(id)a4
{
  if (a4)
  {
    v5 = (void (*)(void))*((void *)a3 + 2);
    id v8 = a3;
    v5();
  }
  else
  {
    id v6 = (void *)MEMORY[0x263F087E8];
    id v7 = a3;
    objc_msgSend(v6, "tsu_fileReadUnknownErrorWithUserInfo:", 0);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, uint64_t, void))a3 + 2))(v7, 1, 0);
  }
}

- (void)close
{
  [(TSUStreamReadChannel *)self->_readChannel close];
  readChannel = self->_readChannel;
  self->_readChannel = 0;
}

- (void).cxx_destruct
{
}

@end