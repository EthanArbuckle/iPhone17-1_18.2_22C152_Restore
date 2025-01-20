@interface TSUZipWriter
- (TSURandomWriteChannel)writeChannel;
- (TSUZipWriter)init;
- (id)centralFileHeaderDataForEntry:(id)a3;
- (id)endOfCentralDirectoryDataWithOffset:(int64_t)a3 size:(int64_t)a4;
- (id)localFileHeaderDataForEntry:(id)a3;
- (unint64_t)archiveLength;
- (void)addData:(id)a3;
- (void)addDataImpl:(id)a3;
- (void)beginEntryWithName:(id)a3;
- (void)beginEntryWithName:(id)a3 size:(unint64_t)a4 CRC:(unsigned int)a5;
- (void)beginEntryWithNameImpl:(id)a3 size:(unint64_t)a4 CRC:(unsigned int)a5;
- (void)closeWithQueue:(id)a3 completion:(id)a4;
- (void)enumerateEntriesUsingBlock:(id)a3;
- (void)finishEntry;
- (void)flushEntryData;
- (void)handleWriteError:(id)a3;
- (void)initEntryTime;
- (void)writeCentralDirectory;
- (void)writeData:(id)a3;
- (void)writeData:(id)a3 offset:(int64_t)a4;
- (void)writeEntryWithName:(id)a3 fromReadChannel:(id)a4 completion:(id)a5;
- (void)writeEntryWithName:(id)a3 size:(unint64_t)a4 CRC:(unsigned int)a5 fromReadChannel:(id)a6 completion:(id)a7;
@end

@implementation TSUZipWriter

- (TSUZipWriter)init
{
  v11.receiver = self;
  v11.super_class = (Class)TSUZipWriter;
  v2 = [(TSUZipWriter *)&v11 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF980] array];
    entries = v2->_entries;
    v2->_entries = (NSMutableArray *)v3;

    uint64_t v5 = [MEMORY[0x263EFF9C0] set];
    entryNames = v2->_entryNames;
    v2->_entryNames = (NSMutableSet *)v5;

    dispatch_queue_t v7 = dispatch_queue_create("TSUZipWriter.Write", 0);
    writeQueue = v2->_writeQueue;
    v2->_writeQueue = (OS_dispatch_queue *)v7;

    [(TSUZipWriter *)v2 initEntryTime];
    v9 = v2;
  }

  return v2;
}

- (void)beginEntryWithName:(id)a3
{
}

- (void)beginEntryWithName:(id)a3 size:(unint64_t)a4 CRC:(unsigned int)a5
{
  id v8 = a3;
  writeQueue = self->_writeQueue;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __44__TSUZipWriter_beginEntryWithName_size_CRC___block_invoke;
  v11[3] = &unk_26462AAB8;
  v11[4] = self;
  id v12 = v8;
  unint64_t v13 = a4;
  unsigned int v14 = a5;
  id v10 = v8;
  dispatch_async(writeQueue, v11);
}

uint64_t __44__TSUZipWriter_beginEntryWithName_size_CRC___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) beginEntryWithNameImpl:*(void *)(a1 + 40) size:*(void *)(a1 + 48) CRC:*(unsigned int *)(a1 + 56)];
}

- (void)beginEntryWithNameImpl:(id)a3 size:(unint64_t)a4 CRC:(unsigned int)a5
{
  uLong v5 = *(void *)&a5;
  id v8 = a3;
  if (!self->_error)
  {
    id v17 = v8;
    [(TSUZipWriter *)self finishEntry];
    if ([(NSMutableSet *)self->_entryNames containsObject:v17])
    {
      v9 = +[TSUAssertionHandler currentHandler];
      id v10 = [NSString stringWithUTF8String:"-[TSUZipWriter beginEntryWithNameImpl:size:CRC:]"];
      objc_super v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUZipWriter.m"];
      [v9 handleFailureInFunction:v10, v11, 90, @"Already have an entry with name: %@", v17 file lineNumber description];
    }
    else
    {
      id v12 = objc_alloc_init(TSUZipWriterEntry);
      currentEntry = self->_currentEntry;
      self->_currentEntry = v12;

      [(TSUZipWriterEntry *)self->_currentEntry setName:v17];
      [(TSUZipWriterEntry *)self->_currentEntry setSize:a4];
      [(TSUZipWriterEntry *)self->_currentEntry setOffset:self->_currentOffset];
      self->_calculateSize = a4 == 0;
      self->_calculateCRC = v5 == 0;
      if (!v5) {
        uLong v5 = crc32(0, 0, 0);
      }
      [(TSUZipWriterEntry *)self->_currentEntry setCRC:v5];
      v9 = [(TSUZipWriter *)self localFileHeaderDataForEntry:self->_currentEntry];
      if (self->_calculateSize || self->_calculateCRC)
      {
        objc_storeStrong((id *)&self->_localFileHeaderData, v9);
        unsigned int v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
        entryDatas = self->_entryDatas;
        self->_entryDatas = v14;
      }
      else
      {
        [(TSUZipWriter *)self writeData:v9];
        localFileHeaderData = self->_localFileHeaderData;
        self->_localFileHeaderData = 0;

        entryDatas = self->_entryDatas;
        self->_entryDatas = 0;
      }

      self->_entryDataSize = 0;
    }

    id v8 = v17;
  }
}

- (void)addData:(id)a3
{
  id v4 = a3;
  writeQueue = self->_writeQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __24__TSUZipWriter_addData___block_invoke;
  v7[3] = &unk_26462A930;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(writeQueue, v7);
}

uint64_t __24__TSUZipWriter_addData___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) addDataImpl:*(void *)(a1 + 40)];
}

- (void)addDataImpl:(id)a3
{
  id v4 = a3;
  uLong v5 = v4;
  if (self->_error) {
    goto LABEL_11;
  }
  size_t size = dispatch_data_get_size(v4);
  entryDatas = self->_entryDatas;
  if (entryDatas)
  {
    localFileHeaderData = self->_localFileHeaderData;
    if (dispatch_data_get_size(localFileHeaderData) + size + self->_entryDataSize < 0x40000)
    {
      [(NSMutableArray *)entryDatas addObject:v5];
      self->_entryDataSize += size;
      goto LABEL_7;
    }
    [(TSUZipWriter *)self writeData:localFileHeaderData];
    v9 = self->_localFileHeaderData;
    self->_localFileHeaderData = 0;

    [(TSUZipWriter *)self flushEntryData];
  }
  [(TSUZipWriter *)self writeData:v5];
LABEL_7:
  if (self->_calculateSize) {
    [(TSUZipWriterEntry *)self->_currentEntry setSize:[(TSUZipWriterEntry *)self->_currentEntry size] + size];
  }
  if (self->_calculateCRC)
  {
    applier[0] = MEMORY[0x263EF8330];
    applier[1] = 3221225472;
    applier[2] = __28__TSUZipWriter_addDataImpl___block_invoke;
    applier[3] = &unk_26462AAE0;
    applier[4] = self;
    dispatch_data_apply(v5, applier);
  }
LABEL_11:
}

uint64_t __28__TSUZipWriter_addDataImpl___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, const Bytef *a4, uInt a5)
{
  return 1;
}

- (void)flushEntryData
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v3 = self->_entryDatas;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        -[TSUZipWriter writeData:](self, "writeData:", *(void *)(*((void *)&v9 + 1) + 8 * v7++), (void)v9);
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  entryDatas = self->_entryDatas;
  self->_entryDatas = 0;

  self->_entryDataSize = 0;
}

- (void)finishEntry
{
  currentEntry = self->_currentEntry;
  if (currentEntry)
  {
    if (self->_calculateSize || self->_calculateCRC)
    {
      uint64_t v4 = -[TSUZipWriter localFileHeaderDataForEntry:](self, "localFileHeaderDataForEntry:");
      if (self->_entryDatas)
      {
        [(TSUZipWriter *)self writeData:v4];
        localFileHeaderData = self->_localFileHeaderData;
        self->_localFileHeaderData = 0;

        [(TSUZipWriter *)self flushEntryData];
      }
      else
      {
        [(TSUZipWriter *)self writeData:v4 offset:[(TSUZipWriterEntry *)self->_currentEntry offset]];
      }

      currentEntry = self->_currentEntry;
    }
    [(NSMutableArray *)self->_entries addObject:currentEntry];
    entryNames = self->_entryNames;
    uint64_t v7 = [(TSUZipWriterEntry *)self->_currentEntry name];
    [(NSMutableSet *)entryNames addObject:v7];

    id v8 = self->_currentEntry;
    self->_currentEntry = 0;
  }
}

- (void)writeEntryWithName:(id)a3 size:(unint64_t)a4 CRC:(unsigned int)a5 fromReadChannel:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  if (!v13)
  {
    v15 = +[TSUAssertionHandler currentHandler];
    v16 = [NSString stringWithUTF8String:"-[TSUZipWriter writeEntryWithName:size:CRC:fromReadChannel:completion:]"];
    id v17 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUZipWriter.m"];
    objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, v17, 223, @"invalid nil value for '%s'", "readChannel");
  }
  writeQueue = self->_writeQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __71__TSUZipWriter_writeEntryWithName_size_CRC_fromReadChannel_completion___block_invoke;
  block[3] = &unk_26462AB30;
  block[4] = self;
  id v23 = v12;
  id v25 = v14;
  unint64_t v26 = a4;
  unsigned int v27 = a5;
  id v24 = v13;
  id v19 = v14;
  id v20 = v13;
  id v21 = v12;
  dispatch_async(writeQueue, block);
}

void __71__TSUZipWriter_writeEntryWithName_size_CRC_fromReadChannel_completion___block_invoke(uint64_t a1)
{
  dispatch_suspend(*(dispatch_object_t *)(*(void *)(a1 + 32) + 72));
  [*(id *)(a1 + 32) beginEntryWithNameImpl:*(void *)(a1 + 40) size:*(void *)(a1 + 64) CRC:*(unsigned int *)(a1 + 72)];
  dispatch_queue_t v2 = dispatch_queue_create("TSUZipWriter.Copy", 0);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __71__TSUZipWriter_writeEntryWithName_size_CRC_fromReadChannel_completion___block_invoke_2;
  v4[3] = &unk_26462AB08;
  v4[4] = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(a1 + 48);
  id v5 = *(id *)(a1 + 56);
  [v3 readWithQueue:v2 handler:v4];
}

void __71__TSUZipWriter_writeEntryWithName_size_CRC_fromReadChannel_completion___block_invoke_2(uint64_t a1, int a2, void *a3, uint64_t a4)
{
  id v10 = a3;
  [*(id *)(a1 + 32) handleWriteError:a4];
  if (v10 && (uint64_t v7 = *(void **)(a1 + 32), !v7[11]))
  {
    [v7 addDataImpl:v10];
    if (!a2) {
      goto LABEL_9;
    }
  }
  else if (!a2)
  {
    goto LABEL_9;
  }
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  if (v8)
  {
    (*(void (**)(uint64_t, BOOL))(v8 + 16))(v8, *(void *)(v9 + 88) == 0);
    uint64_t v9 = *(void *)(a1 + 32);
  }
  dispatch_resume(*(dispatch_object_t *)(v9 + 72));
LABEL_9:
}

- (void)writeEntryWithName:(id)a3 fromReadChannel:(id)a4 completion:(id)a5
{
}

- (void)closeWithQueue:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  writeQueue = self->_writeQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__TSUZipWriter_closeWithQueue_completion___block_invoke;
  block[3] = &unk_26462A870;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(writeQueue, block);
}

void __42__TSUZipWriter_closeWithQueue_completion___block_invoke(id *a1)
{
  dispatch_queue_t v2 = a1[4];
  if (v2[11])
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __42__TSUZipWriter_closeWithQueue_completion___block_invoke_2;
    block[3] = &unk_26462A6E0;
    uint64_t v3 = &v14;
    uint64_t v4 = a1[5];
    id v5 = a1[6];
    block[4] = a1[4];
    id v14 = v5;
    dispatch_async(v4, block);
  }
  else
  {
    [v2 finishEntry];
    [a1[4] writeCentralDirectory];
    id v6 = [a1[4] writeChannel];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __42__TSUZipWriter_closeWithQueue_completion___block_invoke_3;
    v9[3] = &unk_26462AB58;
    uint64_t v3 = &v12;
    id v12 = a1[6];
    id v7 = a1[5];
    id v8 = a1[4];
    id v10 = v7;
    id v11 = v8;
    [v6 addBarrier:v9];
  }
}

uint64_t __42__TSUZipWriter_closeWithQueue_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(*(void *)(a1 + 32) + 88));
}

void __42__TSUZipWriter_closeWithQueue_completion___block_invoke_3(uint64_t a1)
{
  dispatch_queue_t v2 = *(void **)(a1 + 48);
  if (v2)
  {
    uint64_t v3 = *(NSObject **)(a1 + 32);
    uint64_t v6 = MEMORY[0x263EF8330];
    uint64_t v7 = 3221225472;
    id v8 = __42__TSUZipWriter_closeWithQueue_completion___block_invoke_4;
    id v9 = &unk_26462A6E0;
    id v4 = v2;
    uint64_t v10 = *(void *)(a1 + 40);
    id v11 = v4;
    dispatch_async(v3, &v6);
  }
  id v5 = objc_msgSend(*(id *)(a1 + 40), "writeChannel", v6, v7, v8, v9);
  [v5 close];
}

uint64_t __42__TSUZipWriter_closeWithQueue_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(*(void *)(a1 + 32) + 88));
}

- (void)writeCentralDirectory
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  int64_t currentOffset = self->_currentOffset;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = self->_entries;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = -[TSUZipWriter centralFileHeaderDataForEntry:](self, "centralFileHeaderDataForEntry:", *(void *)(*((void *)&v11 + 1) + 8 * v8), (void)v11);
        [(TSUZipWriter *)self writeData:v9];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  uint64_t v10 = [(TSUZipWriter *)self endOfCentralDirectoryDataWithOffset:currentOffset size:self->_currentOffset - currentOffset];
  [(TSUZipWriter *)self writeData:v10];
}

- (id)localFileHeaderDataForEntry:(id)a3
{
  id v4 = a3;
  id v5 = [v4 name];
  uint64_t v6 = (const char *)[v5 UTF8String];

  size_t v7 = strlen(v6);
  if (v7 >= 0x10000)
  {
    uint64_t v8 = +[TSUAssertionHandler currentHandler];
    id v9 = [NSString stringWithUTF8String:"-[TSUZipWriter localFileHeaderDataForEntry:]"];
    uint64_t v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUZipWriter.m"];
    [v8 handleFailureInFunction:v9 file:v10 lineNumber:312 description:@"Zip entry name is too long"];
  }
  long long v11 = malloc_type_malloc(v7 + 30, 0xEFD316C8uLL);
  *long long v11 = 67324752;
  v11[1] = 20;
  *((_WORD *)v11 + 4) = 0;
  *((_WORD *)v11 + 5) = self->_entryTime;
  *((_WORD *)v11 + 6) = self->_entryDate;
  *(_DWORD *)((char *)v11 + 14) = [v4 CRC];
  *(_DWORD *)((char *)v11 + 18) = [v4 size];
  int v12 = [v4 size];

  *(_DWORD *)((char *)v11 + 22) = v12;
  *((_WORD *)v11 + 13) = v7;
  *((_WORD *)v11 + 14) = 0;
  memcpy((char *)v11 + 30, v6, v7);
  dispatch_data_t v13 = dispatch_data_create(v11, v7 + 30, 0, (dispatch_block_t)*MEMORY[0x263EF8378]);
  return v13;
}

- (id)centralFileHeaderDataForEntry:(id)a3
{
  id v4 = a3;
  id v5 = [v4 name];
  uint64_t v6 = (const char *)[v5 UTF8String];

  size_t v7 = strlen(v6);
  if (v7 >= 0x10000)
  {
    uint64_t v8 = +[TSUAssertionHandler currentHandler];
    id v9 = [NSString stringWithUTF8String:"-[TSUZipWriter centralFileHeaderDataForEntry:]"];
    uint64_t v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUZipWriter.m"];
    [v8 handleFailureInFunction:v9 file:v10 lineNumber:341 description:@"Zip entry name is too long"];
  }
  long long v11 = (char *)malloc_type_malloc(v7 + 46, 0x273A9A0uLL);
  *(_DWORD *)long long v11 = 33639248;
  *(void *)(v11 + 4) = 1310782;
  *((_WORD *)v11 + 6) = self->_entryTime;
  *((_WORD *)v11 + 7) = self->_entryDate;
  *((_DWORD *)v11 + 4) = [v4 CRC];
  *((_DWORD *)v11 + 5) = [v4 size];
  *((_DWORD *)v11 + 6) = [v4 size];
  *((_WORD *)v11 + 14) = v7;
  *(void *)(v11 + 30) = 0;
  *(_DWORD *)(v11 + 38) = 0;
  int v12 = [v4 offset];

  *(_DWORD *)(v11 + 42) = v12;
  memcpy(v11 + 46, v6, v7);
  dispatch_data_t v13 = dispatch_data_create(v11, v7 + 46, 0, (dispatch_block_t)*MEMORY[0x263EF8378]);
  return v13;
}

- (id)endOfCentralDirectoryDataWithOffset:(int64_t)a3 size:(int64_t)a4
{
  int v5 = a3;
  if (a3 >= 0x100000000)
  {
    size_t v7 = +[TSUAssertionHandler currentHandler];
    uint64_t v8 = [NSString stringWithUTF8String:"-[TSUZipWriter endOfCentralDirectoryDataWithOffset:size:]"];
    id v9 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUZipWriter.m"];
    [v7 handleFailureInFunction:v8 file:v9 lineNumber:374 description:@"Offset is too large"];
  }
  if (a4 >= 0x100000000)
  {
    uint64_t v10 = +[TSUAssertionHandler currentHandler];
    long long v11 = [NSString stringWithUTF8String:"-[TSUZipWriter endOfCentralDirectoryDataWithOffset:size:]"];
    int v12 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUZipWriter.m"];
    [v10 handleFailureInFunction:v11 file:v12 lineNumber:375 description:@"Size is too large"];
  }
  dispatch_data_t v13 = malloc_type_malloc(0x16uLL, 0x776CEA2CuLL);
  unint64_t v14 = [(NSMutableArray *)self->_entries count];
  __int16 v15 = v14;
  if (v14 >= 0x10000)
  {
    uint64_t v16 = +[TSUAssertionHandler currentHandler];
    id v17 = [NSString stringWithUTF8String:"-[TSUZipWriter endOfCentralDirectoryDataWithOffset:size:]"];
    v18 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUZipWriter.m"];
    [v16 handleFailureInFunction:v17 file:v18 lineNumber:382 description:@"Too many entries"];
  }
  *dispatch_data_t v13 = 101010256;
  v13[1] = 0;
  *((_WORD *)v13 + 4) = v15;
  *((_WORD *)v13 + 5) = v15;
  v13[3] = a4;
  v13[4] = v5;
  *((_WORD *)v13 + 10) = 0;
  dispatch_data_t v19 = dispatch_data_create(v13, 0x16uLL, 0, (dispatch_block_t)*MEMORY[0x263EF8378]);
  return v19;
}

- (void)writeData:(id)a3
{
  size_t size = dispatch_data_get_size((dispatch_data_t)a3);
  self->_currentOffset += size;
  id v6 = a3;
  size_t v7 = [(TSUZipWriter *)self writeChannel];
  writeQueue = self->_writeQueue;
  int64_t writtenOffset = self->_writtenOffset;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __26__TSUZipWriter_writeData___block_invoke;
  v10[3] = &unk_26462AB80;
  v10[4] = self;
  [v7 writeData:v6 offset:writtenOffset queue:writeQueue handler:v10];

  self->_writtenOffset += size;
}

uint64_t __26__TSUZipWriter_writeData___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [*(id *)(a1 + 32) handleWriteError:a4];
}

- (void)writeData:(id)a3 offset:(int64_t)a4
{
  id v6 = a3;
  dispatch_suspend((dispatch_object_t)self->_writeQueue);
  size_t v7 = [(TSUZipWriter *)self writeChannel];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __33__TSUZipWriter_writeData_offset___block_invoke;
  v9[3] = &unk_26462ABA8;
  void v9[4] = self;
  id v10 = v6;
  int64_t v11 = a4;
  id v8 = v6;
  [v7 addBarrier:v9];
}

void __33__TSUZipWriter_writeData_offset___block_invoke(uint64_t a1)
{
  dispatch_queue_t v2 = [*(id *)(a1 + 32) writeChannel];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(v5 + 72);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __33__TSUZipWriter_writeData_offset___block_invoke_2;
  v7[3] = &unk_26462AB80;
  v7[4] = v5;
  [v2 writeData:v3 offset:v4 queue:v6 handler:v7];

  dispatch_resume(*(dispatch_object_t *)(*(void *)(a1 + 32) + 72));
}

uint64_t __33__TSUZipWriter_writeData_offset___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [*(id *)(a1 + 32) handleWriteError:a4];
}

- (TSURandomWriteChannel)writeChannel
{
  dispatch_queue_t v2 = +[TSUAssertionHandler currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"-[TSUZipWriter writeChannel]"];
  uint64_t v4 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUZipWriter.m"];
  [v2 handleFailureInFunction:v3 file:v4 lineNumber:430 description:@"Abstract method"];

  uint64_t v5 = (void *)MEMORY[0x263EFF940];
  uint64_t v6 = *MEMORY[0x263EFF498];
  size_t v7 = [NSString stringWithFormat:@"%@: %s", @"Abstract method", "-[TSUZipWriter writeChannel]"];
  id v8 = [v5 exceptionWithName:v6 reason:v7 userInfo:0];

  objc_exception_throw(v8);
}

- (unint64_t)archiveLength
{
  return self->_currentOffset;
}

- (void)handleWriteError:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    id v12 = v5;
    TSULogErrorInFunction((uint64_t)"-[TSUZipWriter handleWriteError:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUZipWriter.m", 446, @"Couldn't write Zip: %@", v6, v7, v8, v9, (uint64_t)v5);
    id v5 = v12;
    p_error = &self->_error;
    if (!self->_error)
    {
      int64_t v11 = [(TSUZipWriter *)self writeChannel];
      [v11 close];

      objc_storeStrong((id *)p_error, a3);
      id v5 = v12;
    }
  }
}

- (void)initEntryTime
{
  time_t v7 = time(0);
  uint64_t v3 = localtime(&v7);
  int tm_year = v3->tm_year;
  if (tm_year <= 81) {
    __int16 v5 = 512;
  }
  else {
    __int16 v5 = ((_WORD)tm_year << 9) + 24576;
  }
  int tm_hour = v3->tm_hour;
  self->_entryDate = (32 * v3->tm_mon + 32) | v3->tm_mday | v5;
  self->_entryTime = (32 * LOWORD(v3->tm_min)) | ((_WORD)tm_hour << 11) | ((unsigned __int16)v3->tm_sec >> 1);
}

- (void)enumerateEntriesUsingBlock:(id)a3
{
  id v4 = a3;
  writeQueue = self->_writeQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __43__TSUZipWriter_enumerateEntriesUsingBlock___block_invoke;
  v7[3] = &unk_26462A898;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(writeQueue, v7);
}

void __43__TSUZipWriter_enumerateEntriesUsingBlock___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  unsigned __int8 v15 = 0;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 8);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
LABEL_3:
    uint64_t v6 = 0;
    while (1)
    {
      if (*(void *)v12 != v5) {
        objc_enumerationMutation(v2);
      }
      time_t v7 = *(void **)(*((void *)&v11 + 1) + 8 * v6);
      id v8 = objc_alloc_init(TSUZipEntry);
      uint64_t v9 = objc_msgSend(v7, "name", (void)v11);
      [(TSUZipEntry *)v8 setName:v9];

      id v10 = [(TSUZipEntry *)v8 name];
      -[TSUZipEntry setNameLength:](v8, "setNameLength:", (unsigned __int16)strlen((const char *)[v10 UTF8String]));

      -[TSUZipEntry setSize:](v8, "setSize:", [v7 size]);
      -[TSUZipEntry setCompressedSize:](v8, "setCompressedSize:", [v7 size]);
      -[TSUZipEntry setOffset:](v8, "setOffset:", [v7 offset]);
      -[TSUZipEntry setCRC:](v8, "setCRC:", [v7 CRC]);
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      LODWORD(v7) = v15;

      if (v7) {
        break;
      }
      if (v4 == ++v6)
      {
        uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v16 count:16];
        if (v4) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_writeQueue, 0);
  objc_storeStrong((id *)&self->_entryDatas, 0);
  objc_storeStrong((id *)&self->_localFileHeaderData, 0);
  objc_storeStrong((id *)&self->_currentEntry, 0);
  objc_storeStrong((id *)&self->_entryNames, 0);
  objc_storeStrong((id *)&self->_entries, 0);
}

@end