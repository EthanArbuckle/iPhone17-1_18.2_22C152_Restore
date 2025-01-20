@interface TSUZipReadChannel
- (BOOL)isValid;
- (BOOL)processData:(id)a3 CRC:(unsigned int *)a4 isDone:(BOOL)a5 handler:(id)a6;
- (BOOL)readFileHeaderFromData:(id)a3 headerLength:(unint64_t *)a4;
- (TSUZipReadChannel)initWithEntry:(id)a3 archive:(id)a4 validateCRC:(BOOL)a5;
- (void)addBarrier:(id)a3;
- (void)close;
- (void)dealloc;
- (void)handleFailureWithHandler:(id)a3 error:(id)a4;
- (void)readFromOffset:(int64_t)a3 length:(unint64_t)a4 handler:(id)a5;
- (void)readWithFileHeaderLength:(unint64_t)a3 handler:(id)a4;
- (void)readWithHandler:(id)a3;
- (void)setLowWater:(unint64_t)a3;
@end

@implementation TSUZipReadChannel

- (TSUZipReadChannel)initWithEntry:(id)a3 archive:(id)a4 validateCRC:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v18.receiver = self;
  v18.super_class = (Class)TSUZipReadChannel;
  v11 = [(TSUZipReadChannel *)&v18 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_entry, a3);
    objc_storeStrong((id *)&v12->_archive, a4);
    v12->_validateCRC = a5;
    uint64_t v13 = [v10 newArchiveReadChannel];
    archiveReadChannel = v12->_archiveReadChannel;
    v12->_archiveReadChannel = (TSUReadChannel *)v13;

    if (!v12->_archiveReadChannel)
    {
      v15 = [NSString stringWithUTF8String:"-[TSUZipReadChannel initWithEntry:archive:validateCRC:]"];
      v16 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUZipReadChannel.m"];
      +[OITSUAssertionHandler handleFailureInFunction:v15 file:v16 lineNumber:38 isFatal:0 description:"Archive is closed"];

      +[OITSUAssertionHandler logBacktraceThrottled];
      v12 = 0;
    }
  }

  return v12;
}

- (void)dealloc
{
  [(TSUZipReadChannel *)self close];
  v3.receiver = self;
  v3.super_class = (Class)TSUZipReadChannel;
  [(TSUZipReadChannel *)&v3 dealloc];
}

- (void)readWithHandler:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(TSUZipEntry *)self->_entry compressedSize];
  unint64_t v6 = [(TSUZipEntry *)self->_entry fileHeaderLength];
  if (v6)
  {
    [(TSUZipReadChannel *)self readWithFileHeaderLength:v6 handler:v4];
  }
  else
  {
    unsigned int v7 = [(TSUZipEntry *)self->_entry nameLength];
    unsigned int v8 = [(TSUZipEntry *)self->_entry extraFieldsLength];
    v26[0] = 0;
    v26[1] = v26;
    v26[2] = 0x3032000000;
    v26[3] = __Block_byref_object_copy__16;
    v26[4] = __Block_byref_object_dispose__16;
    id v9 = (void *)MEMORY[0x263EF8388];
    id v10 = MEMORY[0x263EF8388];
    id v27 = v9;
    v24[0] = 0;
    v24[1] = v24;
    v24[2] = 0x2020000000;
    char v25 = 0;
    v22[0] = 0;
    v22[1] = v22;
    v22[2] = 0x2020000000;
    char v23 = 1;
    v20[0] = 0;
    v20[1] = v20;
    v20[2] = 0x2020000000;
    int v21 = 0;
    int v21 = crc32(0, 0, 0);
    archiveReadChannel = self->_archiveReadChannel;
    unint64_t v12 = [(TSUZipEntry *)self->_entry offset];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __37__TSUZipReadChannel_readWithHandler___block_invoke_7;
    v13[3] = &unk_264D61DE0;
    v15 = v22;
    v13[4] = self;
    id v14 = v4;
    v16 = v26;
    v17 = v24;
    objc_super v18 = v20;
    unint64_t v19 = v7 + (unint64_t)v8 + 30;
    [(TSUReadChannel *)archiveReadChannel readFromOffset:v12 length:v19 + v5 handler:v13];

    _Block_object_dispose(v20, 8);
    _Block_object_dispose(v22, 8);
    _Block_object_dispose(v24, 8);
    _Block_object_dispose(v26, 8);
  }
}

void __37__TSUZipReadChannel_readWithHandler___block_invoke_7(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  unsigned int v7 = a3;
  id v8 = a4;
  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  int v10 = *(unsigned __int8 *)(v9 + 24);
  if (v8 && *(unsigned char *)(v9 + 24))
  {
    *(unsigned char *)(v9 + 24) = 0;
    [*(id *)(a1 + 32) handleFailureWithHandler:*(void *)(a1 + 40) error:v8];
    int v10 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  }
  if (v10 && (v11 = *(NSObject **)(*(void *)(*(void *)(a1 + 56) + 8) + 40)) != 0)
  {
    if (v7)
    {
      dispatch_data_t concat = dispatch_data_create_concat(v11, v7);
      uint64_t v13 = *(void *)(*(void *)(a1 + 56) + 8);
      id v14 = *(void **)(v13 + 40);
      *(void *)(v13 + 40) = concat;

      v11 = *(NSObject **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    }
    v15 = v11;

    size_t size = dispatch_data_get_size(v15);
    if ((a2 & 1) != 0 || size >= 0x1E)
    {
      uint64_t v17 = *(void *)(*(void *)(a1 + 56) + 8);
      objc_super v18 = *(void **)(v17 + 40);
      *(void *)(v17 + 40) = 0;

      size_t v22 = 0;
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(a1 + 32) readFileHeaderFromData:v15 headerLength:&v22];
      size_t v19 = v22;
      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v22 != *(void *)(a1 + 80);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
      {
        if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
        {
          [*(id *)(a1 + 32) readWithFileHeaderLength:v19 handler:*(void *)(a1 + 40)];
        }
        else
        {
          size_t v20 = dispatch_data_get_size(v15);
          if (v20 >= v19)
          {
            dispatch_data_t subrange = dispatch_data_create_subrange(v15, v19, v20 - v19);

            v15 = subrange;
          }
          else
          {
            if (TSUDefaultCat_init_token != -1) {
              dispatch_once(&TSUDefaultCat_init_token, &__block_literal_global_9);
            }
            *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
          }
        }
      }
      if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        [*(id *)(a1 + 32) handleFailureWithHandler:*(void *)(a1 + 40) error:0];
      }
    }
    else
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
    }
  }
  else
  {
    v15 = v7;
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)
    && !*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(a1 + 32) processData:v15 CRC:*(void *)(*(void *)(a1 + 72) + 8) + 24 isDone:a2 handler:*(void *)(a1 + 40)];
  }
}

void __37__TSUZipReadChannel_readWithHandler___block_invoke_2()
{
  uint64_t v0 = TSULogCreateCategory("TSUDefaultCat");
  v1 = (void *)TSUDefaultCat_log_t;
  TSUDefaultCat_log_t = v0;
}

- (void)readFromOffset:(int64_t)a3 length:(unint64_t)a4 handler:(id)a5
{
  id v8 = a5;
  unint64_t v9 = [(TSUZipEntry *)self->_entry compressedSize];
  if (a3 < 0 || v9 < a3)
  {
    if (TSUDefaultCat_init_token != -1) {
      dispatch_once(&TSUDefaultCat_init_token, &__block_literal_global_14_2);
    }
    (*((void (**)(id, uint64_t, void, void))v8 + 2))(v8, 1, MEMORY[0x263EF8388], 0);
  }
  else
  {
    if (v9 - a3 < a4) {
      a4 = v9 - a3;
    }
    if (a3 || a4 != v9)
    {
      unint64_t v10 = [(TSUZipEntry *)self->_entry fileHeaderLength];
      if (v10)
      {
        [(TSUReadChannel *)self->_archiveReadChannel readFromOffset:v10 + a3 + [(TSUZipEntry *)self->_entry offset] length:a4 handler:v8];
      }
      else
      {
        archiveReadChannel = self->_archiveReadChannel;
        unint64_t v12 = [(TSUZipEntry *)self->_entry offset];
        v13[0] = MEMORY[0x263EF8330];
        v13[1] = 3221225472;
        v13[2] = __51__TSUZipReadChannel_readFromOffset_length_handler___block_invoke_3;
        v13[3] = &unk_264D61E08;
        v13[4] = self;
        int64_t v15 = a3;
        unint64_t v16 = a4;
        id v14 = v8;
        +[TSUIOUtils readAllFromChannel:archiveReadChannel offset:v12 length:30 completion:v13];
      }
    }
    else
    {
      [(TSUZipReadChannel *)self readWithHandler:v8];
    }
  }
}

void __51__TSUZipReadChannel_readFromOffset_length_handler___block_invoke_2()
{
  uint64_t v0 = TSULogCreateCategory("TSUDefaultCat");
  v1 = (void *)TSUDefaultCat_log_t;
  TSUDefaultCat_log_t = v0;
}

void __51__TSUZipReadChannel_readFromOffset_length_handler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v10 = 0;
  if (v6 || ![*(id *)(a1 + 32) readFileHeaderFromData:v5 headerLength:&v10])
  {
    [*(id *)(a1 + 32) handleFailureWithHandler:*(void *)(a1 + 40) error:v6];
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = *(void **)(v7 + 32);
    uint64_t v9 = [*(id *)(v7 + 8) offset];
    [v8 readFromOffset:v10 + *(void *)(a1 + 48) + v9 length:*(void *)(a1 + 56) handler:*(void *)(a1 + 40)];
  }
}

- (BOOL)readFileHeaderFromData:(id)a3 headerLength:(unint64_t *)a4
{
  id v6 = a3;
  size_t size = dispatch_data_get_size(v6);
  if (size == 30)
  {
    dispatch_data_t subrange = v6;
    goto LABEL_5;
  }
  if (size >= 0x1F)
  {
    dispatch_data_t subrange = dispatch_data_create_subrange(v6, 0, 0x1EuLL);
LABEL_5:
    uint64_t v9 = subrange;
    size_t v17 = 0;
    buffer_ptr = 0;
    dispatch_data_t v10 = dispatch_data_create_map(subrange, (const void **)&buffer_ptr, &v17);
    v11 = (unsigned __int16 *)buffer_ptr;
    if (*(_DWORD *)buffer_ptr == 67324752)
    {
      int v12 = *((unsigned __int16 *)buffer_ptr + 4);
      if (*((_WORD *)buffer_ptr + 4)) {
        BOOL v13 = v12 == (unsigned __int16)TSUZipDeflateCompressionMethod;
      }
      else {
        BOOL v13 = 1;
      }
      if (v13
        && (((v12 != (unsigned __int16)TSUZipDeflateCompressionMethod) ^ [(TSUZipEntry *)self->_entry isCompressed]) & 1) != 0)
      {
        *a4 = v11[13] + (unint64_t)v11[14] + 30;
        -[TSUZipEntry setFileHeaderLength:](self->_entry, "setFileHeaderLength:");
        BOOL v14 = 1;
LABEL_17:

        goto LABEL_21;
      }
      if (TSUDefaultCat_init_token == -1)
      {
        BOOL v14 = 0;
        goto LABEL_17;
      }
      unint64_t v16 = &__block_literal_global_22_0;
    }
    else
    {
      if (TSUDefaultCat_init_token == -1)
      {
        BOOL v14 = 0;
        goto LABEL_17;
      }
      unint64_t v16 = &__block_literal_global_20_0;
    }
    dispatch_once(&TSUDefaultCat_init_token, v16);
    BOOL v14 = 0;
    goto LABEL_17;
  }
  if (TSUDefaultCat_init_token != -1) {
    dispatch_once(&TSUDefaultCat_init_token, &__block_literal_global_18_0);
  }
  BOOL v14 = 0;
LABEL_21:

  return v14;
}

void __57__TSUZipReadChannel_readFileHeaderFromData_headerLength___block_invoke()
{
  uint64_t v0 = TSULogCreateCategory("TSUDefaultCat");
  v1 = (void *)TSUDefaultCat_log_t;
  TSUDefaultCat_log_t = v0;
}

void __57__TSUZipReadChannel_readFileHeaderFromData_headerLength___block_invoke_2()
{
  uint64_t v0 = TSULogCreateCategory("TSUDefaultCat");
  v1 = (void *)TSUDefaultCat_log_t;
  TSUDefaultCat_log_t = v0;
}

void __57__TSUZipReadChannel_readFileHeaderFromData_headerLength___block_invoke_3()
{
  uint64_t v0 = TSULogCreateCategory("TSUDefaultCat");
  v1 = (void *)TSUDefaultCat_log_t;
  TSUDefaultCat_log_t = v0;
}

- (void)readWithFileHeaderLength:(unint64_t)a3 handler:(id)a4
{
  id v6 = a4;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x2020000000;
  char v18 = 1;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x2020000000;
  int v16 = 0;
  int v16 = crc32(0, 0, 0);
  archiveReadChannel = self->_archiveReadChannel;
  unint64_t v8 = [(TSUZipEntry *)self->_entry offset];
  unint64_t v9 = [(TSUZipEntry *)self->_entry compressedSize];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __54__TSUZipReadChannel_readWithFileHeaderLength_handler___block_invoke;
  v11[3] = &unk_264D61E30;
  BOOL v13 = v17;
  v11[4] = self;
  id v10 = v6;
  id v12 = v10;
  BOOL v14 = v15;
  [(TSUReadChannel *)archiveReadChannel readFromOffset:v8 + a3 length:v9 handler:v11];

  _Block_object_dispose(v15, 8);
  _Block_object_dispose(v17, 8);
}

void __54__TSUZipReadChannel_readWithFileHeaderLength_handler___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v10 = a3;
  id v7 = a4;
  uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
  int v9 = *(unsigned __int8 *)(v8 + 24);
  if (v7 && *(unsigned char *)(v8 + 24))
  {
    *(unsigned char *)(v8 + 24) = 0;
    [*(id *)(a1 + 32) handleFailureWithHandler:*(void *)(a1 + 40) error:v7];
    int v9 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  }
  if (v9) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(a1 + 32) processData:v10 CRC:*(void *)(*(void *)(a1 + 56) + 8) + 24 isDone:a2 handler:*(void *)(a1 + 40)];
  }
}

- (BOOL)processData:(id)a3 CRC:(unsigned int *)a4 isDone:(BOOL)a5 handler:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  v11 = (void (**)(id, BOOL, NSObject *, void))a6;
  if (a4
    && self->_validateCRC
    && (applier[0] = MEMORY[0x263EF8330],
        applier[1] = 3221225472,
        applier[2] = __52__TSUZipReadChannel_processData_CRC_isDone_handler___block_invoke,
        applier[3] = &__block_descriptor_40_e47_B40__0__NSObject_OS_dispatch_data__8Q16r_v24Q32l,
        applier[4] = a4,
        dispatch_data_apply(v10, applier),
        v7)
    && [(TSUZipEntry *)self->_entry CRC] != *a4)
  {
    if (TSUDefaultCat_init_token != -1) {
      dispatch_once(&TSUDefaultCat_init_token, &__block_literal_global_27);
    }
    [(TSUZipReadChannel *)self handleFailureWithHandler:v11 error:0];
    BOOL v12 = 0;
  }
  else
  {
    v11[2](v11, v7, v10, 0);
    BOOL v12 = 1;
  }

  return v12;
}

uint64_t __52__TSUZipReadChannel_processData_CRC_isDone_handler___block_invoke(uint64_t a1, int a2, int a3, Bytef *buf, unint64_t len)
{
  uLong v7 = **(unsigned int **)(a1 + 32);
  if (HIDWORD(len))
  {
    id v10 = [NSString stringWithUTF8String:"-[TSUZipReadChannel processData:CRC:isDone:handler:]_block_invoke"];
    v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUZipReadChannel.m"];
    +[OITSUAssertionHandler handleFailureInFunction:v10 file:v11 lineNumber:241 isFatal:0 description:"Out-of-bounds type assignment was clamped to max"];

    +[OITSUAssertionHandler logBacktraceThrottled];
    uInt v8 = -1;
  }
  else
  {
    uInt v8 = len;
  }
  **(_DWORD **)(a1 + 32) = crc32(v7, buf, v8);
  return 1;
}

void __52__TSUZipReadChannel_processData_CRC_isDone_handler___block_invoke_2()
{
  uint64_t v0 = TSULogCreateCategory("TSUDefaultCat");
  v1 = (void *)TSUDefaultCat_log_t;
  TSUDefaultCat_log_t = v0;
}

- (void)handleFailureWithHandler:(id)a3 error:(id)a4
{
  if (a4)
  {
    id v5 = (void (*)(void))*((void *)a3 + 2);
    id v8 = a3;
    v5();
  }
  else
  {
    id v6 = (void *)MEMORY[0x263F087E8];
    id v7 = a3;
    objc_msgSend(v6, "tsu_fileReadCorruptedFileErrorWithUserInfo:", 0);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, uint64_t, void))a3 + 2))(v7, 1, 0);
  }
}

- (void)close
{
  [(TSUReadChannel *)self->_archiveReadChannel close];
  archiveReadChannel = self->_archiveReadChannel;
  self->_archiveReadChannel = 0;

  entry = self->_entry;
  self->_entry = 0;

  archive = self->_archive;
  self->_archive = 0;
}

- (void)setLowWater:(unint64_t)a3
{
  if (!self->_archiveReadChannel)
  {
    id v5 = [NSString stringWithUTF8String:"-[TSUZipReadChannel setLowWater:]"];
    id v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUZipReadChannel.m"];
    +[OITSUAssertionHandler handleFailureInFunction:v5 file:v6 lineNumber:274 isFatal:0 description:"Already closed"];

    +[OITSUAssertionHandler logBacktraceThrottled];
  }
  if (a3 <= 0x1D)
  {
    id v7 = [NSString stringWithUTF8String:"-[TSUZipReadChannel setLowWater:]"];
    id v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUZipReadChannel.m"];
    +[OITSUAssertionHandler handleFailureInFunction:v7 file:v8 lineNumber:275 isFatal:0 description:"Low water is too small"];

    +[OITSUAssertionHandler logBacktraceThrottled];
  }
  archiveReadChannel = self->_archiveReadChannel;
  [(TSUReadChannel *)archiveReadChannel setLowWater:a3];
}

- (void)addBarrier:(id)a3
{
  id v4 = a3;
  archiveReadChannel = self->_archiveReadChannel;
  id v8 = v4;
  if (!archiveReadChannel)
  {
    id v6 = [NSString stringWithUTF8String:"-[TSUZipReadChannel addBarrier:]"];
    id v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUZipReadChannel.m"];
    +[OITSUAssertionHandler handleFailureInFunction:v6 file:v7 lineNumber:281 isFatal:0 description:"Already closed"];

    +[OITSUAssertionHandler logBacktraceThrottled];
    id v4 = v8;
    archiveReadChannel = self->_archiveReadChannel;
  }
  [(TSUReadChannel *)archiveReadChannel addBarrier:v4];
}

- (BOOL)isValid
{
  return [(TSUReadChannel *)self->_archiveReadChannel isValid];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_archiveReadChannel, 0);
  objc_storeStrong((id *)&self->_archive, 0);
  objc_storeStrong((id *)&self->_entry, 0);
}

@end