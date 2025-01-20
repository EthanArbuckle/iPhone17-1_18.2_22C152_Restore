@interface TSUZipReadChannel
- (BOOL)processData:(id)a3 CRC:(unsigned int *)a4 isDone:(BOOL)a5 queue:(id)a6 handler:(id)a7;
- (BOOL)readFileHeaderFromData:(id)a3 headerLength:(unint64_t *)a4;
- (TSUZipReadChannel)initWithEntry:(id)a3 archiveReadChannel:(id)a4;
- (void)close;
- (void)handleFailureWithQueue:(id)a3 handler:(id)a4 error:(id)a5;
- (void)readWithHeaderLength:(unint64_t)a3 queue:(id)a4 handler:(id)a5;
- (void)readWithQueue:(id)a3 handler:(id)a4;
@end

@implementation TSUZipReadChannel

- (TSUZipReadChannel)initWithEntry:(id)a3 archiveReadChannel:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)TSUZipReadChannel;
  v9 = [(TSUZipReadChannel *)&v15 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_entry, a3);
    objc_storeStrong((id *)&v10->_archiveReadChannel, a4);
    dispatch_queue_t v11 = dispatch_queue_create("TSUZipReadChannel.Read", 0);
    readQueue = v10->_readQueue;
    v10->_readQueue = (OS_dispatch_queue *)v11;

    v13 = v10;
  }

  return v10;
}

- (void)readWithQueue:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->_archiveReadChannel)
  {
    if ([(TSUZipEntry *)self->_entry compressedSize] >= 0xFFFFFFFF)
    {
      id v8 = +[TSUAssertionHandler currentHandler];
      v9 = [NSString stringWithUTF8String:"-[TSUZipReadChannel readWithQueue:handler:]"];
      v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUZipReadChannel.m"];
      [v8 handleFailureInFunction:v9 file:v10 lineNumber:51 description:@"No support for Zip 64"];
    }
    unsigned int v11 = [(TSUZipEntry *)self->_entry nameLength];
    unsigned int v12 = [(TSUZipEntry *)self->_entry extraFieldLength];
    unsigned int v13 = [(TSUZipEntry *)self->_entry compressedSize];
    v35[0] = 0;
    v35[1] = v35;
    v35[2] = 0x2020000000;
    char v36 = 0;
    v33[0] = 0;
    v33[1] = v33;
    v33[2] = 0x2020000000;
    char v34 = 0;
    v31[0] = 0;
    v31[1] = v31;
    v31[2] = 0x2020000000;
    char v32 = 1;
    v29[0] = 0;
    v29[1] = v29;
    v29[2] = 0x2020000000;
    int v30 = 0;
    int v30 = crc32(0, 0, 0);
    archiveReadChannel = self->_archiveReadChannel;
    unint64_t v15 = [(TSUZipEntry *)self->_entry offset];
    unint64_t v16 = v11 + (unint64_t)v12 + 30;
    readQueue = self->_readQueue;
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __43__TSUZipReadChannel_readWithQueue_handler___block_invoke;
    v21[3] = &unk_26462AA20;
    v24 = v31;
    v21[4] = self;
    id v22 = v6;
    id v23 = v7;
    v25 = v35;
    v26 = v33;
    v27 = v29;
    unint64_t v28 = v16;
    [(TSUReadChannel *)archiveReadChannel readFromOffset:v15 length:v16 + v13 queue:readQueue handler:v21];

    _Block_object_dispose(v29, 8);
    _Block_object_dispose(v31, 8);
    _Block_object_dispose(v33, 8);
    _Block_object_dispose(v35, 8);
  }
  else
  {
    v18 = +[TSUAssertionHandler currentHandler];
    v19 = [NSString stringWithUTF8String:"-[TSUZipReadChannel readWithQueue:handler:]"];
    v20 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUZipReadChannel.m"];
    [v18 handleFailureInFunction:v19 file:v20 lineNumber:45 description:@"Already closed"];

    [(TSUZipReadChannel *)self handleFailureWithQueue:v6 handler:v7 error:0];
  }
}

void __43__TSUZipReadChannel_readWithQueue_handler___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
  int v10 = *(unsigned __int8 *)(v9 + 24);
  if (v8 && *(unsigned char *)(v9 + 24))
  {
    *(unsigned char *)(v9 + 24) = 0;
    [*(id *)(a1 + 32) handleFailureWithQueue:*(void *)(a1 + 40) handler:*(void *)(a1 + 48) error:v8];
    int v10 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  }
  if (v10)
  {
    uint64_t v11 = *(void *)(*(void *)(a1 + 64) + 8);
    if (*(unsigned char *)(v11 + 24)) {
      goto LABEL_19;
    }
    *(unsigned char *)(v11 + 24) = 1;
    size_t v21 = 0;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [*(id *)(a1 + 32) readFileHeaderFromData:v7 headerLength:&v21];
    size_t v12 = v21;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = v21 != *(void *)(a1 + 88);
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
    {
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24))
      {
        [*(id *)(a1 + 32) readWithHeaderLength:v12 queue:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
      }
      else
      {
        size_t size = dispatch_data_get_size(v7);
        size_t v14 = size - v12;
        if (size >= v12)
        {
          dispatch_data_t subrange = dispatch_data_create_subrange(v7, v12, v14);

          id v7 = subrange;
        }
        else
        {
          unint64_t v15 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "name", v14);
          TSULogErrorInFunction((uint64_t)"-[TSUZipReadChannel readWithQueue:handler:]_block_invoke", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUZipReadChannel.m", 100, @"Read was less than file header size for entry %@", v16, v17, v18, v19, (uint64_t)v15);

          *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
        }
      }
    }
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)
      || ([*(id *)(a1 + 32) handleFailureWithQueue:*(void *)(a1 + 40) handler:*(void *)(a1 + 48) error:0], *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)))
    {
LABEL_19:
      if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24)) {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [*(id *)(a1 + 32) processData:v7 CRC:*(void *)(*(void *)(a1 + 80) + 8) + 24 isDone:a2 queue:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
      }
    }
  }
}

- (BOOL)readFileHeaderFromData:(id)a3 headerLength:(unint64_t *)a4
{
  if (dispatch_data_get_size((dispatch_data_t)a3) > 0x1D)
  {
    dispatch_data_t subrange = dispatch_data_create_subrange((dispatch_data_t)a3, 0, 0x1EuLL);
    size_t size_ptr = 0;
    buffer_ptr = 0;
    dispatch_data_t v14 = dispatch_data_create_map(subrange, (const void **)&buffer_ptr, &size_ptr);
    unint64_t v15 = (char *)buffer_ptr;
    if (*(_DWORD *)buffer_ptr == 67324752)
    {
      int v16 = *(_DWORD *)((char *)buffer_ptr + 14);
      if (v16 == [(TSUZipEntry *)self->_entry CRC])
      {
        uint64_t v17 = *(unsigned int *)(v15 + 18);
        if ([(TSUZipEntry *)self->_entry compressedSize] == v17)
        {
          uint64_t v18 = *(unsigned int *)(v15 + 22);
          if ([(TSUZipEntry *)self->_entry size] == v18)
          {
            *a4 = *((unsigned __int16 *)v15 + 13) + (unint64_t)*((unsigned __int16 *)v15 + 14) + 30;
            BOOL v12 = 1;
LABEL_11:

            return v12;
          }
        }
      }
      uint64_t v19 = [(TSUZipEntry *)self->_entry name];
      TSULogErrorInFunction((uint64_t)"-[TSUZipReadChannel readFileHeaderFromData:headerLength:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUZipReadChannel.m", 153, @"Local file header doesn't match central directory file header for entry %@", v24, v25, v26, v27, (uint64_t)v19);
    }
    else
    {
      uint64_t v19 = [(TSUZipEntry *)self->_entry name];
      TSULogErrorInFunction((uint64_t)"-[TSUZipReadChannel readFileHeaderFromData:headerLength:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUZipReadChannel.m", 147, @"Local file header has bad signature for entry %@", v20, v21, v22, v23, (uint64_t)v19);
    }

    BOOL v12 = 0;
    goto LABEL_11;
  }
  id v7 = [(TSUZipEntry *)self->_entry name];
  TSULogErrorInFunction((uint64_t)"-[TSUZipReadChannel readFileHeaderFromData:headerLength:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUZipReadChannel.m", 124, @"Read was less than record size for entry %@", v8, v9, v10, v11, (uint64_t)v7);

  return 0;
}

- (void)readWithHeaderLength:(unint64_t)a3 queue:(id)a4 handler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (!self->_archiveReadChannel)
  {
    uint64_t v10 = +[TSUAssertionHandler currentHandler];
    uint64_t v11 = [NSString stringWithUTF8String:"-[TSUZipReadChannel readWithHeaderLength:queue:handler:]"];
    BOOL v12 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUZipReadChannel.m"];
    [v10 handleFailureInFunction:v11 file:v12 lineNumber:171 description:@"Already closed"];
  }
  if ([(TSUZipEntry *)self->_entry compressedSize] >= 0xFFFFFFFF)
  {
    unsigned int v13 = +[TSUAssertionHandler currentHandler];
    dispatch_data_t v14 = [NSString stringWithUTF8String:"-[TSUZipReadChannel readWithHeaderLength:queue:handler:]"];
    unint64_t v15 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUZipReadChannel.m"];
    [v13 handleFailureInFunction:v14 file:v15 lineNumber:174 description:@"No support for Zip 64"];
  }
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x2020000000;
  char v30 = 1;
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x2020000000;
  int v28 = 0;
  int v28 = crc32(0, 0, 0);
  archiveReadChannel = self->_archiveReadChannel;
  unint64_t v17 = [(TSUZipEntry *)self->_entry offset] + a3;
  uint64_t v18 = [(TSUZipEntry *)self->_entry compressedSize];
  readQueue = self->_readQueue;
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __56__TSUZipReadChannel_readWithHeaderLength_queue_handler___block_invoke;
  v22[3] = &unk_26462AA48;
  uint64_t v25 = v29;
  v22[4] = self;
  id v20 = v8;
  id v23 = v20;
  id v21 = v9;
  id v24 = v21;
  uint64_t v26 = v27;
  [(TSUReadChannel *)archiveReadChannel readFromOffset:v17 length:v18 queue:readQueue handler:v22];

  _Block_object_dispose(v27, 8);
  _Block_object_dispose(v29, 8);
}

void __56__TSUZipReadChannel_readWithHeaderLength_queue_handler___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v10 = a3;
  id v7 = a4;
  uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8);
  int v9 = *(unsigned __int8 *)(v8 + 24);
  if (v7 && *(unsigned char *)(v8 + 24))
  {
    *(unsigned char *)(v8 + 24) = 0;
    [*(id *)(a1 + 32) handleFailureWithQueue:*(void *)(a1 + 40) handler:*(void *)(a1 + 48) error:v7];
    int v9 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  }
  if (v9) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [*(id *)(a1 + 32) processData:v10 CRC:*(void *)(*(void *)(a1 + 64) + 8) + 24 isDone:a2 queue:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
  }
}

- (BOOL)processData:(id)a3 CRC:(unsigned int *)a4 isDone:(BOOL)a5 queue:(id)a6 handler:(id)a7
{
  BOOL v9 = a5;
  BOOL v12 = a3;
  unsigned int v13 = a6;
  id v14 = a7;
  if (a4
    && (applier[0] = MEMORY[0x263EF8330],
        applier[1] = 3221225472,
        applier[2] = __58__TSUZipReadChannel_processData_CRC_isDone_queue_handler___block_invoke,
        applier[3] = &__block_descriptor_40_e47_B40__0__NSObject_OS_dispatch_data__8Q16r_v24Q32l,
        applier[4] = a4,
        dispatch_data_apply(v12, applier),
        v9)
    && [(TSUZipEntry *)self->_entry CRC] != *a4)
  {
    unint64_t v17 = [(TSUZipEntry *)self->_entry name];
    TSULogErrorInFunction((uint64_t)"-[TSUZipReadChannel processData:CRC:isDone:queue:handler:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUZipReadChannel.m", 208, @"CRC does not match for entry %@", v18, v19, v20, v21, (uint64_t)v17);

    [(TSUZipReadChannel *)self handleFailureWithQueue:v13 handler:v14 error:0];
    BOOL v15 = 0;
  }
  else
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __58__TSUZipReadChannel_processData_CRC_isDone_queue_handler___block_invoke_2;
    block[3] = &unk_26462AA90;
    id v24 = v14;
    BOOL v25 = v9;
    id v23 = v12;
    dispatch_async(v13, block);

    BOOL v15 = 1;
  }

  return v15;
}

uint64_t __58__TSUZipReadChannel_processData_CRC_isDone_queue_handler___block_invoke(uint64_t a1, int a2, int a3, Bytef *buf, unint64_t len)
{
  uLong v7 = **(unsigned int **)(a1 + 32);
  if (HIDWORD(len))
  {
    id v10 = +[TSUAssertionHandler currentHandler];
    uint64_t v11 = [NSString stringWithUTF8String:"-[TSUZipReadChannel processData:CRC:isDone:queue:handler:]_block_invoke"];
    BOOL v12 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUZipReadChannel.m"];
    [v10 handleFailureInFunction:v11 file:v12 lineNumber:202 description:@"Out-of-bounds type assignment was clamped to max"];

    uInt v8 = -1;
  }
  else
  {
    uInt v8 = len;
  }
  **(_DWORD **)(a1 + 32) = crc32(v7, buf, v8);
  return 1;
}

uint64_t __58__TSUZipReadChannel_processData_CRC_isDone_queue_handler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32), 0);
}

- (void)handleFailureWithQueue:(id)a3 handler:(id)a4 error:(id)a5
{
  uLong v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x263F087E8], "tsu_IOErrorWithCode:", 0);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __58__TSUZipReadChannel_handleFailureWithQueue_handler_error___block_invoke;
  v12[3] = &unk_26462A6E0;
  id v13 = v9;
  id v14 = v8;
  id v10 = v9;
  id v11 = v8;
  dispatch_async(v7, v12);
}

uint64_t __58__TSUZipReadChannel_handleFailureWithQueue_handler_error___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, uint64_t, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 1, 0, *(void *)(a1 + 32));
}

- (void)close
{
  self->_archiveReadChannel = 0;
  MEMORY[0x270F9A758]();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_readQueue, 0);
  objc_storeStrong((id *)&self->_archiveReadChannel, 0);
  objc_storeStrong((id *)&self->_entry, 0);
}

@end