@interface TSUZipWriter
- (BOOL)isClosed;
- (NSArray)sortedEntries;
- (TSUZipWriter)init;
- (TSUZipWriter)initWithOptions:(unint64_t)a3;
- (id)entryWithName:(id)a3;
- (id)localFileHeaderDataForEntry:(id)a3;
- (id)p_writeChannel;
- (id)prepareWriteChannelWithCloseCompletionHandler:(id)a3;
- (id)sortedEntriesImpl;
- (unint64_t)archiveLength;
- (unint64_t)entriesCount;
- (unint64_t)entriesCountImpl;
- (void)addBarrier:(id)a3;
- (void)addData:(id)a3;
- (void)addData:(id)a3 queue:(id)a4 completion:(id)a5;
- (void)addDataImpl:(id)a3 queue:(id)a4 completion:(id)a5;
- (void)addExistingEntry:(id)a3;
- (void)addExistingEntryImpl:(id)a3;
- (void)beginEntryWithName:(id)a3 force32BitSize:(BOOL)a4 lastModificationDate:(id)a5 size:(unint64_t)a6 CRC:(unsigned int)a7 forceCalculatingSizeAndCRCForPreservingLastModificationDate:(BOOL)a8;
- (void)beginEntryWithNameImpl:(id)a3 force32BitSize:(BOOL)a4 lastModificationDate:(id)a5 size:(unint64_t)a6 CRC:(unsigned int)a7 forceCalculatingSizeAndCRCForPreservingLastModificationDate:(BOOL)a8;
- (void)closeWithQueue:(id)a3 completion:(id)a4;
- (void)enumerateEntriesUsingBlock:(id)a3;
- (void)finishEntry;
- (void)flushCurrentEntryWithQueue:(id)a3 completion:(id)a4;
- (void)flushEntryData;
- (void)handleWriteError:(id)a3;
- (void)p_writeData:(id)a3 offset:(int64_t)a4 completion:(id)a5;
- (void)setEntryInsertionOffset:(int64_t)a3;
- (void)setEntryInsertionOffsetImpl:(int64_t)a3;
- (void)truncateToNumberOfEntries:(unint64_t)a3 completion:(id)a4;
- (void)truncateToNumberOfEntriesImpl:(unint64_t)a3 completion:(id)a4;
- (void)truncateToOffset:(int64_t)a3 completion:(id)a4;
- (void)truncateToOffsetImpl:(int64_t)a3 completion:(id)a4;
- (void)writeCentralDirectory;
- (void)writeCentralFileHeaderDataForEntry:(id)a3;
- (void)writeData:(id)a3;
- (void)writeData:(id)a3 offset:(int64_t)a4;
- (void)writeData:(id)a3 queue:(id)a4 completion:(id)a5;
- (void)writeEndOfCentralDirectoryDataWithOffset:(int64_t)a3 size:(int64_t)a4 entryCount:(unint64_t)a5;
- (void)writeEntryWithName:(id)a3 force32BitSize:(BOOL)a4 fromReadChannel:(id)a5 completion:(id)a6;
- (void)writeEntryWithName:(id)a3 force32BitSize:(BOOL)a4 lastModificationDate:(id)a5 size:(unint64_t)a6 CRC:(unsigned int)a7 fromReadChannel:(id)a8 completion:(id)a9;
- (void)writeEntryWithName:(id)a3 force32BitSize:(BOOL)a4 lastModificationDate:(id)a5 size:(unint64_t)a6 CRC:(unsigned int)a7 fromReadChannel:(id)a8 writeHandler:(id)a9;
- (void)writeZip64EndOfCentralDirectoryLocatorWithOffset:(int64_t)a3;
- (void)writeZip64EndOfCentralDirectoryWithOffset:(int64_t)a3 size:(int64_t)a4 entryCount:(unint64_t)a5;
@end

@implementation TSUZipWriter

- (TSUZipWriter)init
{
  return [(TSUZipWriter *)self initWithOptions:0];
}

- (TSUZipWriter)initWithOptions:(unint64_t)a3
{
  v17.receiver = self;
  v17.super_class = (Class)TSUZipWriter;
  v4 = [(TSUZipWriter *)&v17 init];
  v5 = v4;
  if (v4)
  {
    v4->_options = a3;
    uint64_t v6 = objc_opt_new();
    entries = v5->_entries;
    v5->_entries = (NSMutableArray *)v6;

    uint64_t v8 = objc_opt_new();
    entriesMap = v5->_entriesMap;
    v5->_entriesMap = (NSMutableDictionary *)v8;

    dispatch_queue_t v10 = dispatch_queue_create("TSUZipWriter.Channel", 0);
    channelQueue = v5->_channelQueue;
    v5->_channelQueue = (OS_dispatch_queue *)v10;

    dispatch_queue_t v12 = dispatch_queue_create("TSUZipWriter.Write", 0);
    writeQueue = v5->_writeQueue;
    v5->_writeQueue = (OS_dispatch_queue *)v12;

    uint64_t v14 = [MEMORY[0x263EFF910] date];
    newEntryLastModificationDate = v5->_newEntryLastModificationDate;
    v5->_newEntryLastModificationDate = (NSDate *)v14;
  }
  return v5;
}

- (unint64_t)entriesCount
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  writeQueue = self->_writeQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __28__TSUZipWriter_entriesCount__block_invoke;
  v5[3] = &unk_264D612C0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(writeQueue, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __28__TSUZipWriter_entriesCount__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) entriesCountImpl];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (unint64_t)entriesCountImpl
{
  return [(NSMutableDictionary *)self->_entriesMap count];
}

- (id)p_writeChannel
{
  writeChannel = self->_writeChannel;
  if (!writeChannel)
  {
    if (self->_writeChannelCompletionSemaphore)
    {
      v4 = [NSString stringWithUTF8String:"-[TSUZipWriter p_writeChannel]"];
      v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUZipWriter.m"];
      +[OITSUAssertionHandler handleFailureInFunction:v4 file:v5 lineNumber:105 isFatal:1 description:"Write channel semaphore should not be initialized."];

      TSUCrash((uint64_t)"Fatal Assertion failure: %{public}s %{public}s:%d Write channel semaphore should not be initialized.", v6, v7, v8, v9, v10, v11, v12, (uint64_t)"-[TSUZipWriter p_writeChannel]");
    }
    v13 = (OS_dispatch_semaphore *)dispatch_semaphore_create(0);
    writeChannelCompletionSemaphore = self->_writeChannelCompletionSemaphore;
    self->_writeChannelCompletionSemaphore = v13;

    objc_initWeak(&location, self);
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __30__TSUZipWriter_p_writeChannel__block_invoke;
    v18[3] = &unk_264D61B40;
    objc_copyWeak(&v19, &location);
    v15 = [(TSUZipWriter *)self prepareWriteChannelWithCloseCompletionHandler:v18];
    v16 = self->_writeChannel;
    self->_writeChannel = v15;

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
    writeChannel = self->_writeChannel;
  }
  return writeChannel;
}

void __30__TSUZipWriter_p_writeChannel__block_invoke(uint64_t a1)
{
  WeakRetained = (dispatch_semaphore_t *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    dispatch_semaphore_signal(WeakRetained[4]);
    WeakRetained = v2;
  }
}

- (void)beginEntryWithName:(id)a3 force32BitSize:(BOOL)a4 lastModificationDate:(id)a5 size:(unint64_t)a6 CRC:(unsigned int)a7 forceCalculatingSizeAndCRCForPreservingLastModificationDate:(BOOL)a8
{
  id v14 = a3;
  id v15 = a5;
  writeQueue = self->_writeQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __140__TSUZipWriter_beginEntryWithName_force32BitSize_lastModificationDate_size_CRC_forceCalculatingSizeAndCRCForPreservingLastModificationDate___block_invoke;
  block[3] = &unk_264D61B68;
  block[4] = self;
  id v20 = v14;
  BOOL v24 = a4;
  id v21 = v15;
  unint64_t v22 = a6;
  unsigned int v23 = a7;
  BOOL v25 = a8;
  id v17 = v15;
  id v18 = v14;
  dispatch_async(writeQueue, block);
}

uint64_t __140__TSUZipWriter_beginEntryWithName_force32BitSize_lastModificationDate_size_CRC_forceCalculatingSizeAndCRCForPreservingLastModificationDate___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) beginEntryWithNameImpl:*(void *)(a1 + 40) force32BitSize:*(unsigned __int8 *)(a1 + 68) lastModificationDate:*(void *)(a1 + 48) size:*(void *)(a1 + 56) CRC:*(unsigned int *)(a1 + 64) forceCalculatingSizeAndCRCForPreservingLastModificationDate:*(unsigned __int8 *)(a1 + 69)];
}

- (void)beginEntryWithNameImpl:(id)a3 force32BitSize:(BOOL)a4 lastModificationDate:(id)a5 size:(unint64_t)a6 CRC:(unsigned int)a7 forceCalculatingSizeAndCRCForPreservingLastModificationDate:(BOOL)a8
{
  BOOL v8 = a8;
  id v41 = a3;
  uint64_t v12 = (NSDate *)a5;
  if (self->_isClosed)
  {
    v13 = [NSString stringWithUTF8String:"-[TSUZipWriter beginEntryWithNameImpl:force32BitSize:lastModificationDate:size:CRC:forceCalculatingSizeAndCRCForPreservingLastModificationDate:]"];
    id v14 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUZipWriter.m"];
    +[OITSUAssertionHandler handleFailureInFunction:v13 file:v14 lineNumber:130 isFatal:1 description:"Already closed."];

    TSUCrash((uint64_t)"Fatal Assertion failure: %{public}s %{public}s:%d Already closed.", v15, v16, v17, v18, v19, v20, v21, (uint64_t)"-[TSUZipWriter beginEntryWithNameImpl:force32BitSize:lastModificationDate:size:CRC:forceCalculatingSizeAndCRCForPreservingLastModificationDate:]");
  }
  if (!self->_error)
  {
    [(TSUZipWriter *)self finishEntry];
    unint64_t v22 = [(NSMutableDictionary *)self->_entriesMap objectForKeyedSubscript:v41];

    if (v22)
    {
      unsigned int v23 = [NSString stringWithUTF8String:"-[TSUZipWriter beginEntryWithNameImpl:force32BitSize:lastModificationDate:size:CRC:forceCalculatingSizeAndCRCForPreservingLastModificationDate:]"];
      BOOL v24 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUZipWriter.m"];
      +[OITSUAssertionHandler handleFailureInFunction:v23, v24, 139, 0, "Already have an entry with name: %@", v41 file lineNumber isFatal description];

      +[OITSUAssertionHandler logBacktraceThrottled];
    }
    else
    {
      BOOL v25 = objc_alloc_init(TSUZipWriterEntry);
      currentEntry = self->_currentEntry;
      self->_currentEntry = v25;

      [(TSUZipWriterEntry *)self->_currentEntry setName:v41];
      [(TSUZipWriterEntry *)self->_currentEntry setOffset:self->_currentOffset];
      if (a6) {
        BOOL v27 = v8;
      }
      else {
        BOOL v27 = 1;
      }
      self->_calculateSize = v27;
      if (v27) {
        unint64_t v28 = 0;
      }
      else {
        unint64_t v28 = a6;
      }
      [(TSUZipWriterEntry *)self->_currentEntry setSize:v28];
      BOOL v29 = self->_calculateSize && a4;
      self->_force32BitSize = v29;
      if (a7) {
        BOOL v30 = v8;
      }
      else {
        BOOL v30 = 1;
      }
      self->_calculateCRC = v30;
      uLong v31 = a7;
      if (v30) {
        uLong v31 = crc32(0, 0, 0);
      }
      [(TSUZipWriterEntry *)self->_currentEntry setCRC:v31];
      if (v8)
      {
        [(TSUZipWriterEntry *)self->_currentEntry setLastModificationDate:self->_newEntryLastModificationDate];
        self->_sizeToMatch = a6;
        self->_CRCToMatch = a7;
        v32 = v12;
        lastModificationDateIfSizeAndCRCMatches = self->_lastModificationDateIfSizeAndCRCMatches;
        self->_lastModificationDateIfSizeAndCRCMatches = v32;
      }
      else
      {
        newEntryLastModificationDate = v12;
        if (!v12) {
          newEntryLastModificationDate = self->_newEntryLastModificationDate;
        }
        [(TSUZipWriterEntry *)self->_currentEntry setLastModificationDate:newEntryLastModificationDate];
        self->_sizeToMatch = 0;
        self->_CRCToMatch = 0;
        lastModificationDateIfSizeAndCRCMatches = self->_lastModificationDateIfSizeAndCRCMatches;
        self->_lastModificationDateIfSizeAndCRCMatches = 0;
      }

      v35 = [(TSUZipWriter *)self localFileHeaderDataForEntry:self->_currentEntry];
      if ((self->_calculateSize || self->_calculateCRC) && (self->_options & 8) == 0)
      {
        objc_storeStrong((id *)&self->_localFileHeaderData, v35);
        v36 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
        entryDatas = self->_entryDatas;
        self->_entryDatas = v36;
      }
      else
      {
        [(TSUZipWriter *)self writeData:v35];
        localFileHeaderData = self->_localFileHeaderData;
        self->_localFileHeaderData = 0;

        entryDatas = self->_entryDatas;
        self->_entryDatas = 0;
      }

      self->_entryDataSize = 0;
    }
  }
}

- (void)addData:(id)a3
{
}

- (void)addData:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  writeQueue = self->_writeQueue;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __41__TSUZipWriter_addData_queue_completion___block_invoke;
  v15[3] = &unk_264D61B90;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(writeQueue, v15);
}

uint64_t __41__TSUZipWriter_addData_queue_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) addDataImpl:*(void *)(a1 + 40) queue:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
}

- (void)addDataImpl:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (self->_isClosed)
  {
    uint64_t v11 = [NSString stringWithUTF8String:"-[TSUZipWriter addDataImpl:queue:completion:]"];
    id v12 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUZipWriter.m"];
    +[OITSUAssertionHandler handleFailureInFunction:v11 file:v12 lineNumber:196 isFatal:1 description:"Already closed."];

    TSUCrash((uint64_t)"Fatal Assertion failure: %{public}s %{public}s:%d Already closed.", v13, v14, v15, v16, v17, v18, v19, (uint64_t)"-[TSUZipWriter addDataImpl:queue:completion:]");
  }
  uint64_t v20 = self->_error;
  if (v20)
  {
    if (v10)
    {
      if (v9)
      {
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __45__TSUZipWriter_addDataImpl_queue_completion___block_invoke;
        block[3] = &unk_264D616F8;
        id v30 = v10;
        BOOL v29 = v20;
        dispatch_async(v9, block);
      }
      else
      {
        (*((void (**)(id, NSError *))v10 + 2))(v10, v20);
      }
    }
    goto LABEL_16;
  }
  size_t size = dispatch_data_get_size(v8);
  entryDatas = self->_entryDatas;
  if (entryDatas)
  {
    localFileHeaderData = self->_localFileHeaderData;
    if (dispatch_data_get_size(localFileHeaderData) + size + self->_entryDataSize < 0x40000)
    {
      [(NSMutableArray *)entryDatas addObject:v8];
      self->_entryDataSize += size;
      if (v10)
      {
        if (v9)
        {
          v26[0] = MEMORY[0x263EF8330];
          v26[1] = 3221225472;
          v26[2] = __45__TSUZipWriter_addDataImpl_queue_completion___block_invoke_2;
          v26[3] = &unk_264D61428;
          id v27 = v10;
          dispatch_async(v9, v26);
        }
        else
        {
          (*((void (**)(id, void))v10 + 2))(v10, 0);
        }
      }
      goto LABEL_11;
    }
    [(TSUZipWriter *)self writeData:localFileHeaderData];
    BOOL v24 = self->_localFileHeaderData;
    self->_localFileHeaderData = 0;

    [(TSUZipWriter *)self flushEntryData];
  }
  [(TSUZipWriter *)self writeData:v8 queue:v9 completion:v10];
LABEL_11:
  if (self->_calculateSize) {
    [(TSUZipWriterEntry *)self->_currentEntry setSize:[(TSUZipWriterEntry *)self->_currentEntry size] + size];
  }
  if (self->_calculateCRC)
  {
    applier[0] = MEMORY[0x263EF8330];
    applier[1] = 3221225472;
    applier[2] = __45__TSUZipWriter_addDataImpl_queue_completion___block_invoke_3;
    applier[3] = &unk_264D61BB8;
    applier[4] = self;
    dispatch_data_apply(v8, applier);
  }
LABEL_16:
}

uint64_t __45__TSUZipWriter_addDataImpl_queue_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __45__TSUZipWriter_addDataImpl_queue_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __45__TSUZipWriter_addDataImpl_queue_completion___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, const Bytef *a4, unint64_t a5)
{
  unsigned int v8 = [*(id *)(*(void *)(a1 + 32) + 64) CRC];
  if (HIDWORD(a5))
  {
    id v10 = [NSString stringWithUTF8String:"-[TSUZipWriter addDataImpl:queue:completion:]_block_invoke_3"];
    uint64_t v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUZipWriter.m"];
    +[OITSUAssertionHandler handleFailureInFunction:v10 file:v11 lineNumber:237 isFatal:0 description:"Out-of-bounds type assignment was clamped to max"];

    +[OITSUAssertionHandler logBacktraceThrottled];
    LODWORD(a5) = -1;
  }
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 64), "setCRC:", crc32(v8, a4, a5));
  return 1;
}

- (void)flushEntryData
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  unint64_t v3 = self->_entryDatas;
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

- (void)flushCurrentEntryWithQueue:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  writeQueue = self->_writeQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__TSUZipWriter_flushCurrentEntryWithQueue_completion___block_invoke;
  block[3] = &unk_264D61C30;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(writeQueue, block);
}

void __54__TSUZipWriter_flushCurrentEntryWithQueue_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 72))
  {
    unint64_t v3 = [NSString stringWithUTF8String:"-[TSUZipWriter flushCurrentEntryWithQueue:completion:]_block_invoke"];
    uint64_t v4 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUZipWriter.m"];
    +[OITSUAssertionHandler handleFailureInFunction:v3 file:v4 lineNumber:255 isFatal:1 description:"Trying to flush while closed."];

    TSUCrash((uint64_t)"Fatal Assertion failure: %{public}s %{public}s:%d Trying to flush while closed.", v5, v6, v7, v8, v9, v10, v11, (uint64_t)"-[TSUZipWriter flushCurrentEntryWithQueue:completion:]_block_invoke");
  }
  id v12 = *(void **)(v2 + 160);
  if (v12)
  {
    id v13 = v12;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __54__TSUZipWriter_flushCurrentEntryWithQueue_completion___block_invoke_2;
    block[3] = &unk_264D616F8;
    uint64_t v14 = *(NSObject **)(a1 + 40);
    id v15 = *(id *)(a1 + 48);
    id v23 = v13;
    id v24 = v15;
    id v16 = v13;
    dispatch_async(v14, block);
  }
  else
  {
    [(id)v2 finishEntry];
    uint64_t v17 = *(void *)(a1 + 32);
    uint64_t v18 = *(NSObject **)(v17 + 16);
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __54__TSUZipWriter_flushCurrentEntryWithQueue_completion___block_invoke_3;
    v19[3] = &unk_264D61C08;
    v19[4] = v17;
    id v21 = *(id *)(a1 + 48);
    id v20 = *(id *)(a1 + 40);
    dispatch_async(v18, v19);
  }
}

uint64_t __54__TSUZipWriter_flushCurrentEntryWithQueue_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __54__TSUZipWriter_flushCurrentEntryWithQueue_completion___block_invoke_3(uint64_t a1)
{
  dispatch_suspend(*(dispatch_object_t *)(*(void *)(a1 + 32) + 16));
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "p_writeChannel");
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __54__TSUZipWriter_flushCurrentEntryWithQueue_completion___block_invoke_4;
  v6[3] = &unk_264D61BE0;
  id v3 = *(id *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(a1 + 40);
  id v8 = v3;
  v6[4] = v4;
  id v7 = v5;
  [v2 flushWithCompletion:v6];
}

void __54__TSUZipWriter_flushCurrentEntryWithQueue_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (*(void *)(a1 + 48))
  {
    uint64_t v5 = v3;
    if (!v3) {
      uint64_t v5 = *(void **)(*(void *)(a1 + 32) + 160);
    }
    id v6 = v5;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __54__TSUZipWriter_flushCurrentEntryWithQueue_completion___block_invoke_5;
    v10[3] = &unk_264D616F8;
    id v7 = *(NSObject **)(a1 + 40);
    id v8 = *(id *)(a1 + 48);
    id v11 = v6;
    id v12 = v8;
    id v9 = v6;
    dispatch_async(v7, v10);
  }
  dispatch_resume(*(dispatch_object_t *)(*(void *)(a1 + 32) + 16));
}

uint64_t __54__TSUZipWriter_flushCurrentEntryWithQueue_completion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)finishEntry
{
  currentEntry = self->_currentEntry;
  if (!currentEntry) {
    return;
  }
  if (self->_calculateSize || self->_calculateCRC)
  {
    if (self->_force32BitSize)
    {
      if ([(TSUZipWriterEntry *)self->_currentEntry size] >> 32)
      {
        if (TSUDefaultCat_init_token != -1) {
          dispatch_once(&TSUDefaultCat_init_token, &__block_literal_global_31);
        }
        uint64_t v13 = objc_msgSend(MEMORY[0x263F087E8], "tsu_fileWriteUnknownErrorWithUserInfo:", 0);
        [(TSUZipWriter *)self handleWriteError:v13];
        uint64_t v4 = (TSUZipWriterEntry *)v13;
        goto LABEL_20;
      }
      currentEntry = self->_currentEntry;
    }
    if (self->_lastModificationDateIfSizeAndCRCMatches)
    {
      uint64_t v5 = [(TSUZipWriterEntry *)currentEntry size];
      currentEntry = self->_currentEntry;
      if (v5 == self->_sizeToMatch)
      {
        unsigned int v6 = [(TSUZipWriterEntry *)self->_currentEntry CRC];
        currentEntry = self->_currentEntry;
        if (v6 == self->_CRCToMatch)
        {
          [(TSUZipWriterEntry *)self->_currentEntry setLastModificationDate:self->_lastModificationDateIfSizeAndCRCMatches];
          currentEntry = self->_currentEntry;
        }
      }
    }
    id v7 = [(TSUZipWriter *)self localFileHeaderDataForEntry:currentEntry];
    if (self->_entryDatas)
    {
      [(TSUZipWriter *)self writeData:v7];
      localFileHeaderData = self->_localFileHeaderData;
      self->_localFileHeaderData = 0;

      [(TSUZipWriter *)self flushEntryData];
    }
    else
    {
      [(TSUZipWriter *)self writeData:v7 offset:[(TSUZipWriterEntry *)self->_currentEntry offset]];
    }

    currentEntry = self->_currentEntry;
  }
  [(NSMutableArray *)self->_entries addObject:currentEntry];
  entriesMap = self->_entriesMap;
  id v9 = self->_currentEntry;
  id v11 = [(TSUZipWriterEntry *)v9 name];
  [(NSMutableDictionary *)entriesMap setObject:v9 forKeyedSubscript:v11];

  sortedEntries = self->_sortedEntries;
  self->_sortedEntries = 0;

  uint64_t v4 = self->_currentEntry;
  self->_currentEntry = 0;
LABEL_20:
}

void __27__TSUZipWriter_finishEntry__block_invoke()
{
  uint64_t v0 = TSULogCreateCategory("TSUDefaultCat");
  v1 = (void *)TSUDefaultCat_log_t;
  TSUDefaultCat_log_t = v0;
}

- (void)writeEntryWithName:(id)a3 force32BitSize:(BOOL)a4 lastModificationDate:(id)a5 size:(unint64_t)a6 CRC:(unsigned int)a7 fromReadChannel:(id)a8 completion:(id)a9
{
  uint64_t v10 = *(void *)&a7;
  BOOL v13 = a4;
  id v16 = a9;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __107__TSUZipWriter_writeEntryWithName_force32BitSize_lastModificationDate_size_CRC_fromReadChannel_completion___block_invoke;
  v18[3] = &unk_264D61C58;
  id v19 = v16;
  id v17 = v16;
  [(TSUZipWriter *)self writeEntryWithName:a3 force32BitSize:v13 lastModificationDate:a5 size:a6 CRC:v10 fromReadChannel:a8 writeHandler:v18];
}

void __107__TSUZipWriter_writeEntryWithName_force32BitSize_lastModificationDate_size_CRC_fromReadChannel_completion___block_invoke(uint64_t a1, int a2, void *a3, void *a4)
{
  id v9 = a3;
  id v7 = a4;
  if (a2)
  {
    uint64_t v8 = *(void *)(a1 + 32);
    if (v8) {
      (*(void (**)(uint64_t, BOOL))(v8 + 16))(v8, v7 == 0);
    }
  }
}

- (void)writeEntryWithName:(id)a3 force32BitSize:(BOOL)a4 lastModificationDate:(id)a5 size:(unint64_t)a6 CRC:(unsigned int)a7 fromReadChannel:(id)a8 writeHandler:(id)a9
{
  id v15 = a3;
  id v16 = a5;
  id v17 = a8;
  id v18 = a9;
  if (!v17)
  {
    id v19 = [NSString stringWithUTF8String:"-[TSUZipWriter writeEntryWithName:force32BitSize:lastModificationDate:size:CRC:fromReadChannel:writeHandler:]"];
    id v20 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUZipWriter.m"];
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v19, v20, 330, 0, "invalid nil value for '%{public}s'", "readChannel");

    +[OITSUAssertionHandler logBacktraceThrottled];
  }
  writeQueue = self->_writeQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __109__TSUZipWriter_writeEntryWithName_force32BitSize_lastModificationDate_size_CRC_fromReadChannel_writeHandler___block_invoke;
  block[3] = &unk_264D61CA8;
  void block[4] = self;
  id v27 = v15;
  BOOL v33 = a4;
  unsigned int v32 = a7;
  id v28 = v16;
  id v29 = v17;
  id v30 = v18;
  unint64_t v31 = a6;
  id v22 = v18;
  id v23 = v17;
  id v24 = v16;
  id v25 = v15;
  dispatch_async(writeQueue, block);
}

void __109__TSUZipWriter_writeEntryWithName_force32BitSize_lastModificationDate_size_CRC_fromReadChannel_writeHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 72))
  {
    id v3 = [NSString stringWithUTF8String:"-[TSUZipWriter writeEntryWithName:force32BitSize:lastModificationDate:size:CRC:fromReadChannel:writeHandler:]_block_invoke"];
    uint64_t v4 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUZipWriter.m"];
    +[OITSUAssertionHandler handleFailureInFunction:v3 file:v4 lineNumber:333 isFatal:1 description:"Already closed."];

    TSUCrash((uint64_t)"Fatal Assertion failure: %{public}s %{public}s:%d Already closed.", v5, v6, v7, v8, v9, v10, v11, (uint64_t)"-[TSUZipWriter writeEntryWithName:force32BitSize:lastModificationDate:size:CRC:fromReadChannel:writeHandler:]_block_invoke");
  }
  dispatch_suspend(*(dispatch_object_t *)(v2 + 144));
  [*(id *)(a1 + 32) beginEntryWithNameImpl:*(void *)(a1 + 40) force32BitSize:*(unsigned __int8 *)(a1 + 84) lastModificationDate:*(void *)(a1 + 48) size:*(void *)(a1 + 72) CRC:*(unsigned int *)(a1 + 80) forceCalculatingSizeAndCRCForPreservingLastModificationDate:0];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __109__TSUZipWriter_writeEntryWithName_force32BitSize_lastModificationDate_size_CRC_fromReadChannel_writeHandler___block_invoke_2;
  v13[3] = &unk_264D61C80;
  v13[4] = *(void *)(a1 + 32);
  id v12 = *(void **)(a1 + 56);
  id v14 = *(id *)(a1 + 64);
  [v12 readWithHandler:v13];
}

void __109__TSUZipWriter_writeEntryWithName_force32BitSize_lastModificationDate_size_CRC_fromReadChannel_writeHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v7 = a3;
  [*(id *)(a1 + 32) handleWriteError:a4];
  if (v7)
  {
    uint64_t v8 = *(void **)(a1 + 32);
    if (!v8[20]) {
      [v8 addDataImpl:v7 queue:0 completion:0];
    }
  }
  uint64_t v9 = *(void *)(a1 + 40);
  if (v9)
  {
    char v12 = 0;
    (*(void (**)(uint64_t, uint64_t, id, void, char *))(v9 + 16))(v9, a2, v7, *(void *)(*(void *)(a1 + 32) + 160), &v12);
    if (v12)
    {
      uint64_t v10 = *(void **)(a1 + 32);
      uint64_t v11 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F07F70] code:3072 userInfo:0];
      [v10 handleWriteError:v11];
    }
  }
  if (a2) {
    dispatch_resume(*(dispatch_object_t *)(*(void *)(a1 + 32) + 144));
  }
}

- (void)writeEntryWithName:(id)a3 force32BitSize:(BOOL)a4 fromReadChannel:(id)a5 completion:(id)a6
{
}

- (void)addExistingEntry:(id)a3
{
  id v4 = a3;
  writeQueue = self->_writeQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __33__TSUZipWriter_addExistingEntry___block_invoke;
  v7[3] = &unk_264D612E8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(writeQueue, v7);
}

uint64_t __33__TSUZipWriter_addExistingEntry___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) addExistingEntryImpl:*(void *)(a1 + 40)];
}

- (void)addExistingEntryImpl:(id)a3
{
  id v11 = a3;
  id v4 = objc_alloc_init(TSUZipWriterEntry);
  uint64_t v5 = [v11 name];
  [(TSUZipWriterEntry *)v4 setName:v5];

  id v6 = [v11 lastModificationDate];
  [(TSUZipWriterEntry *)v4 setLastModificationDate:v6];

  if ([v11 isCompressed]) {
    uint64_t v7 = [v11 compressedSize];
  }
  else {
    uint64_t v7 = [v11 size];
  }
  [(TSUZipWriterEntry *)v4 setSize:v7];
  -[TSUZipWriterEntry setOffset:](v4, "setOffset:", [v11 offset]);
  -[TSUZipWriterEntry setCRC:](v4, "setCRC:", [v11 CRC]);
  [(NSMutableArray *)self->_entries addObject:v4];
  entriesMap = self->_entriesMap;
  uint64_t v9 = [v11 name];
  [(NSMutableDictionary *)entriesMap setObject:v4 forKeyedSubscript:v9];

  sortedEntries = self->_sortedEntries;
  self->_sortedEntries = 0;
}

- (void)setEntryInsertionOffset:(int64_t)a3
{
  writeQueue = self->_writeQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __40__TSUZipWriter_setEntryInsertionOffset___block_invoke;
  v4[3] = &unk_264D61CD0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(writeQueue, v4);
}

uint64_t __40__TSUZipWriter_setEntryInsertionOffset___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setEntryInsertionOffsetImpl:*(void *)(a1 + 40)];
}

- (void)setEntryInsertionOffsetImpl:(int64_t)a3
{
  self->_currentOffset = a3;
  self->_writtenOffset = a3;
}

- (void)addBarrier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    writeQueue = self->_writeQueue;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __27__TSUZipWriter_addBarrier___block_invoke;
    v7[3] = &unk_264D618F8;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(writeQueue, v7);
  }
}

void __27__TSUZipWriter_addBarrier___block_invoke(uint64_t a1)
{
  dispatch_suspend(*(dispatch_object_t *)(*(void *)(a1 + 32) + 144));
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(NSObject **)(v2 + 16);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __27__TSUZipWriter_addBarrier___block_invoke_2;
  v4[3] = &unk_264D618F8;
  v4[4] = v2;
  id v5 = *(id *)(a1 + 40);
  dispatch_async(v3, v4);
}

void __27__TSUZipWriter_addBarrier___block_invoke_2(uint64_t a1)
{
  dispatch_suspend(*(dispatch_object_t *)(*(void *)(a1 + 32) + 16));
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "p_writeChannel");
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __27__TSUZipWriter_addBarrier___block_invoke_3;
  v4[3] = &unk_264D616F8;
  id v3 = *(id *)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  [v2 addBarrier:v4];
}

void __27__TSUZipWriter_addBarrier___block_invoke_3(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  dispatch_resume(*(dispatch_object_t *)(*(void *)(a1 + 32) + 16));
  uint64_t v2 = *(NSObject **)(*(void *)(a1 + 32) + 144);
  dispatch_resume(v2);
}

- (void)closeWithQueue:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  writeQueue = self->_writeQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__TSUZipWriter_closeWithQueue_completion___block_invoke;
  block[3] = &unk_264D61C30;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(writeQueue, block);
}

void __42__TSUZipWriter_closeWithQueue_completion___block_invoke(id *a1)
{
  uint64_t v2 = a1[4];
  if (v2[72])
  {
    id v3 = [NSString stringWithUTF8String:"-[TSUZipWriter closeWithQueue:completion:]_block_invoke"];
    id v4 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUZipWriter.m"];
    +[OITSUAssertionHandler handleFailureInFunction:v3 file:v4 lineNumber:426 isFatal:1 description:"Shouldn't have closed twice."];

    TSUCrash((uint64_t)"Fatal Assertion failure: %{public}s %{public}s:%d Shouldn't have closed twice.", v5, v6, v7, v8, v9, v10, v11, (uint64_t)"-[TSUZipWriter closeWithQueue:completion:]_block_invoke");
  }
  if (*((void *)v2 + 20))
  {
    v2[72] = 1;
    id v12 = *((id *)a1[4] + 20);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __42__TSUZipWriter_closeWithQueue_completion___block_invoke_2;
    block[3] = &unk_264D616F8;
    id v13 = a1[5];
    id v14 = a1[6];
    id v22 = v12;
    id v23 = v14;
    id v15 = v12;
    dispatch_async(v13, block);
  }
  else
  {
    [v2 finishEntry];
    [a1[4] writeCentralDirectory];
    *((unsigned char *)a1[4] + 72) = 1;
    id v16 = a1[4];
    id v17 = *((void *)v16 + 2);
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __42__TSUZipWriter_closeWithQueue_completion___block_invoke_3;
    v18[3] = &unk_264D61C08;
    void v18[4] = v16;
    id v20 = a1[6];
    id v19 = a1[5];
    dispatch_async(v17, v18);
  }
}

uint64_t __42__TSUZipWriter_closeWithQueue_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __42__TSUZipWriter_closeWithQueue_completion___block_invoke_3(id *a1)
{
  dispatch_suspend(*((dispatch_object_t *)a1[4] + 2));
  uint64_t v2 = objc_msgSend(a1[4], "p_writeChannel");
  objc_initWeak(&location, v2);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __42__TSUZipWriter_closeWithQueue_completion___block_invoke_4;
  v3[3] = &unk_264D61CF8;
  objc_copyWeak(&v6, &location);
  v3[4] = a1[4];
  id v5 = a1[6];
  id v4 = a1[5];
  [v2 addBarrier:v3];

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __42__TSUZipWriter_closeWithQueue_completion___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (!WeakRetained)
  {
    id v3 = [NSString stringWithUTF8String:"-[TSUZipWriter closeWithQueue:completion:]_block_invoke_4"];
    id v4 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUZipWriter.m"];
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v3, v4, 456, 0, "invalid nil value for '%{public}s'", "strongWriteChannel");

    +[OITSUAssertionHandler logBacktraceThrottled];
  }
  [WeakRetained close];
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(NSObject **)(v5 + 144);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__TSUZipWriter_closeWithQueue_completion___block_invoke_5;
  block[3] = &unk_264D61C08;
  void block[4] = v5;
  id v9 = *(id *)(a1 + 48);
  id v8 = *(id *)(a1 + 40);
  dispatch_async(v6, block);
}

void __42__TSUZipWriter_closeWithQueue_completion___block_invoke_5(uint64_t a1)
{
  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 32), 0xFFFFFFFFFFFFFFFFLL);
  if (*(void *)(a1 + 48))
  {
    id v2 = *(id *)(*(void *)(a1 + 32) + 160);
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __42__TSUZipWriter_closeWithQueue_completion___block_invoke_6;
    v6[3] = &unk_264D616F8;
    id v3 = *(NSObject **)(a1 + 40);
    id v4 = *(id *)(a1 + 48);
    id v7 = v2;
    id v8 = v4;
    id v5 = v2;
    dispatch_async(v3, v6);
  }
  dispatch_resume(*(dispatch_object_t *)(*(void *)(a1 + 32) + 16));
}

uint64_t __42__TSUZipWriter_closeWithQueue_completion___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)writeCentralDirectory
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  int64_t currentOffset = self->_currentOffset;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = self->_entries;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        -[TSUZipWriter writeCentralFileHeaderDataForEntry:](self, "writeCentralFileHeaderDataForEntry:", *(void *)(*((void *)&v9 + 1) + 8 * v8++), (void)v9);
      }
      while (v6 != v8);
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }

  [(TSUZipWriter *)self writeEndOfCentralDirectoryDataWithOffset:currentOffset size:self->_currentOffset - currentOffset entryCount:[(NSMutableArray *)self->_entries count]];
}

- (id)localFileHeaderDataForEntry:(id)a3
{
  id v4 = a3;
  id v5 = [v4 name];
  uint64_t v6 = (const char *)[v5 UTF8String];

  __src = v6;
  size_t v7 = strlen(v6);
  if (v7 >= 0x10000)
  {
    if (TSUDefaultCat_init_token != -1) {
      dispatch_once(&TSUDefaultCat_init_token, &__block_literal_global_30_0);
    }
    size_t v7 = 0xFFFFLL;
  }
  unint64_t v8 = self->_options & 1;
  unint64_t v9 = v8 | ((unint64_t)[v4 size] >> 32);
  BOOL v10 = v9 != 0;
  if (v9 || self->_calculateSize)
  {
    BOOL v22 = !self->_force32BitSize;
    if (self->_force32BitSize) {
      unsigned int v11 = 0;
    }
    else {
      unsigned int v11 = 20;
    }
  }
  else
  {
    BOOL v22 = 0;
    unsigned int v11 = 0;
  }
  long long v12 = malloc_type_malloc(v7 + v11 + 30, 0x52B7EA04uLL);
  id v13 = (char *)v12 + 30;
  *long long v12 = 67324752;
  v12[1] = 20;
  *((_WORD *)v12 + 4) = 0;
  uint64_t v14 = [v4 lastModificationDate];
  int v15 = objc_msgSend(v14, "tsu_DOSTime");

  HIDWORD(v16) = v15;
  LODWORD(v16) = v15;
  *(_DWORD *)((char *)v12 + 10) = v16 >> 16;
  *(_DWORD *)((char *)v12 + 14) = [v4 CRC];
  if (!v10)
  {
    *(_DWORD *)((char *)v12 + 18) = [v4 size];
LABEL_17:
    int v18 = [v4 size];
    goto LABEL_18;
  }
  if (self->_force32BitSize) {
    int v17 = [v4 size];
  }
  else {
    int v17 = -1;
  }
  *(_DWORD *)((char *)v12 + 18) = v17;
  if (self->_force32BitSize) {
    goto LABEL_17;
  }
  int v18 = -1;
LABEL_18:
  *(_DWORD *)((char *)v12 + 22) = v18;
  *((_WORD *)v12 + 13) = v7;
  *((_WORD *)v12 + 14) = v11;
  memcpy(v13, __src, v7);
  if (v22)
  {
    id v19 = &v13[v7];
    *(_WORD *)id v19 = TSUZip64ExtraFieldSignature;
    *((_WORD *)v19 + 1) = 16;
    *(void *)(v19 + 4) = [v4 size];
    *(void *)(v19 + 12) = [v4 size];
  }
  dispatch_data_t v20 = dispatch_data_create(v12, v7 + v11 + 30, 0, (dispatch_block_t)*MEMORY[0x263EF8378]);

  return v20;
}

void __44__TSUZipWriter_localFileHeaderDataForEntry___block_invoke()
{
  uint64_t v0 = TSULogCreateCategory("TSUDefaultCat");
  v1 = (void *)TSUDefaultCat_log_t;
  TSUDefaultCat_log_t = v0;
}

- (void)writeCentralFileHeaderDataForEntry:(id)a3
{
  id v25 = a3;
  id v4 = [v25 name];
  id v5 = (const char *)[v4 UTF8String];

  size_t v6 = strlen(v5);
  if (v6 >= 0x10000)
  {
    if (TSUDefaultCat_init_token != -1) {
      dispatch_once(&TSUDefaultCat_init_token, &__block_literal_global_32);
    }
    size_t v6 = 0xFFFFLL;
  }
  id v24 = self;
  unint64_t v7 = self->_options & 2;
  unint64_t v8 = v7 | ((unint64_t)[v25 size] >> 32);
  unint64_t v9 = v7 | ((unint64_t)[v25 offset] >> 32);
  unsigned int v10 = 4 * ((v8 | v9) != 0);
  if (v8) {
    unsigned int v10 = 20;
  }
  BOOL v11 = v9 != 0;
  if (v9) {
    uint64_t v12 = v10 | 8;
  }
  else {
    uint64_t v12 = v10;
  }
  size_t v13 = v6 + v12 + 46;
  uint64_t v14 = (char *)malloc_type_malloc(v13, 0x6460FC59uLL);
  int v15 = v14 + 46;
  *(_DWORD *)uint64_t v14 = 33639248;
  *(void *)(v14 + 4) = 1310782;
  unint64_t v16 = [v25 lastModificationDate];
  int v17 = objc_msgSend(v16, "tsu_DOSTime");

  HIDWORD(v18) = v17;
  LODWORD(v18) = v17;
  *((_DWORD *)v14 + 3) = v18 >> 16;
  *((_DWORD *)v14 + 4) = [v25 CRC];
  if (v8)
  {
    int v19 = -1;
    *((_DWORD *)v14 + 5) = -1;
  }
  else
  {
    *((_DWORD *)v14 + 5) = [v25 size];
    int v19 = [v25 size];
  }
  *((_DWORD *)v14 + 6) = v19;
  *((_WORD *)v14 + 14) = v6;
  *((_WORD *)v14 + 15) = v12;
  *((void *)v14 + 4) = 0;
  *((_WORD *)v14 + 20) = 0;
  if (v11)
  {
    *(_DWORD *)(v14 + 42) = -1;
    memcpy(v15, v5, v6);
    *(_WORD *)&v15[v6] = TSUZip64ExtraFieldSignature;
    dispatch_data_t v20 = &v15[v6 + 4];
    *(_WORD *)&v15[v6 + 2] = 0;
    id v21 = &v15[v6 + 2];
    if (!v8) {
      goto LABEL_20;
    }
  }
  else
  {
    *(_DWORD *)(v14 + 42) = [v25 offset];
    memcpy(v15, v5, v6);
    if (!v8) {
      goto LABEL_21;
    }
    dispatch_data_t v20 = &v15[v6 + 4];
    *(_WORD *)&v15[v6] = TSUZip64ExtraFieldSignature;
    id v21 = &v15[v6 + 2];
  }
  BOOL v22 = &v15[v6];
  *(_WORD *)id v21 = 16;
  *(void *)dispatch_data_t v20 = [v25 size];
  *(void *)(v22 + 12) = [v25 size];
  if (!v11) {
    goto LABEL_21;
  }
  dispatch_data_t v20 = v22 + 20;
LABEL_20:
  *(_WORD *)v21 += 8;
  *(void *)dispatch_data_t v20 = [v25 offset];
LABEL_21:
  dispatch_data_t v23 = dispatch_data_create(v14, v13, 0, (dispatch_block_t)*MEMORY[0x263EF8378]);
  [(TSUZipWriter *)v24 writeData:v23];
}

void __51__TSUZipWriter_writeCentralFileHeaderDataForEntry___block_invoke()
{
  uint64_t v0 = TSULogCreateCategory("TSUDefaultCat");
  v1 = (void *)TSUDefaultCat_log_t;
  TSUDefaultCat_log_t = v0;
}

- (void)writeEndOfCentralDirectoryDataWithOffset:(int64_t)a3 size:(int64_t)a4 entryCount:(unint64_t)a5
{
  __int16 v5 = a5;
  int v6 = a4;
  int v7 = a3;
  if (a5 > 0xFFFE) {
    int v9 = 1;
  }
  else {
    int v9 = (LOBYTE(self->_options) >> 2) & 1;
  }
  if (a4 > 4294967294) {
    int v10 = 1;
  }
  else {
    int v10 = (LOBYTE(self->_options) >> 2) & 1;
  }
  if (a3 > 4294967294) {
    int v11 = 1;
  }
  else {
    int v11 = (LOBYTE(self->_options) >> 2) & 1;
  }
  if ((v9 & 1) != 0 || (v10 & 1) != 0 || v11)
  {
    int64_t currentOffset = self->_currentOffset;
    [(TSUZipWriter *)self writeZip64EndOfCentralDirectoryWithOffset:a3 size:a4 entryCount:a5];
    [(TSUZipWriter *)self writeZip64EndOfCentralDirectoryLocatorWithOffset:currentOffset];
  }
  size_t v13 = malloc_type_malloc(0x16uLL, 0x3578717FuLL);
  *(void *)size_t v13 = 101010256;
  if (v9) {
    __int16 v14 = -1;
  }
  else {
    __int16 v14 = v5;
  }
  v13[4] = v14;
  void v13[5] = v14;
  if (v10) {
    int v15 = -1;
  }
  else {
    int v15 = v6;
  }
  if (v11) {
    int v16 = -1;
  }
  else {
    int v16 = v7;
  }
  *((_DWORD *)v13 + 3) = v15;
  *((_DWORD *)v13 + 4) = v16;
  v13[10] = 0;
  dispatch_data_t v17 = dispatch_data_create(v13, 0x16uLL, 0, (dispatch_block_t)*MEMORY[0x263EF8378]);
  [(TSUZipWriter *)self writeData:v17];
}

- (void)writeZip64EndOfCentralDirectoryWithOffset:(int64_t)a3 size:(int64_t)a4 entryCount:(unint64_t)a5
{
  int v9 = malloc_type_malloc(0x38uLL, 0xF4555416uLL);
  *(_DWORD *)int v9 = 101075792;
  *(void *)((char *)v9 + 4) = 44;
  v9[2] = 0;
  v9[3] = a5;
  *((_DWORD *)v9 + 3) = 1310782;
  v9[4] = a5;
  v9[5] = a4;
  v9[6] = a3;
  dispatch_data_t v10 = dispatch_data_create(v9, 0x38uLL, 0, (dispatch_block_t)*MEMORY[0x263EF8378]);
  [(TSUZipWriter *)self writeData:v10];
}

- (void)writeZip64EndOfCentralDirectoryLocatorWithOffset:(int64_t)a3
{
  __int16 v5 = malloc_type_malloc(0x14uLL, 0x292E44B8uLL);
  _DWORD *v5 = 117853008;
  v5[1] = 0;
  *((void *)v5 + 1) = a3;
  v5[4] = 1;
  dispatch_data_t v6 = dispatch_data_create(v5, 0x14uLL, 0, (dispatch_block_t)*MEMORY[0x263EF8378]);
  [(TSUZipWriter *)self writeData:v6];
}

- (void)writeData:(id)a3
{
}

- (void)writeData:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  size_t size = dispatch_data_get_size((dispatch_data_t)a3);
  self->_currentOffset += size;
  int64_t writtenOffset = self->_writtenOffset;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __43__TSUZipWriter_writeData_queue_completion___block_invoke;
  v14[3] = &unk_264D61D20;
  id v15 = v8;
  id v16 = v9;
  id v12 = v8;
  id v13 = v9;
  [(TSUZipWriter *)self p_writeData:a3 offset:writtenOffset completion:v14];
  self->_writtenOffset += size;
}

void __43__TSUZipWriter_writeData_queue_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void (***)(void, void))(a1 + 40);
  if (v4)
  {
    __int16 v5 = *(NSObject **)(a1 + 32);
    if (v5)
    {
      v6[0] = MEMORY[0x263EF8330];
      v6[1] = 3221225472;
      v6[2] = __43__TSUZipWriter_writeData_queue_completion___block_invoke_2;
      v6[3] = &unk_264D616F8;
      id v8 = v4;
      id v7 = v3;
      dispatch_async(v5, v6);
    }
    else
    {
      ((void (**)(void, id))v4)[2](v4, v3);
    }
  }
}

uint64_t __43__TSUZipWriter_writeData_queue_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)writeData:(id)a3 offset:(int64_t)a4
{
}

- (void)p_writeData:(id)a3 offset:(int64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  channelQueue = self->_channelQueue;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __46__TSUZipWriter_p_writeData_offset_completion___block_invoke;
  v13[3] = &unk_264D61D70;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  int64_t v16 = a4;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(channelQueue, v13);
}

void __46__TSUZipWriter_p_writeData_offset_completion___block_invoke(uint64_t a1)
{
  dispatch_suspend(*(dispatch_object_t *)(*(void *)(a1 + 32) + 16));
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x3032000000;
  v9[3] = __Block_byref_object_copy__14;
  v9[4] = __Block_byref_object_dispose__14;
  id v10 = 0;
  id v2 = objc_msgSend(*(id *)(a1 + 32), "p_writeChannel");
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __46__TSUZipWriter_p_writeData_offset_completion___block_invoke_33;
  v6[3] = &unk_264D61D48;
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v8 = v9;
  void v6[4] = v3;
  uint64_t v5 = *(void *)(a1 + 56);
  id v7 = *(id *)(a1 + 48);
  [v2 writeData:v4 offset:v5 handler:v6];

  _Block_object_dispose(v9, 8);
}

void __46__TSUZipWriter_p_writeData_offset_completion___block_invoke_33(void *a1, int a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  if (v8 && (v9 = *(void *)(a1[6] + 8), v11 = *(void *)(v9 + 40), id v10 = (id *)(v9 + 40), !v11))
  {
    objc_storeStrong(v10, a4);
    if (!a2) {
      goto LABEL_11;
    }
  }
  else if (!a2)
  {
    goto LABEL_11;
  }
  uint64_t v12 = a1[6];
  if (*(void *)(*(void *)(v12 + 8) + 40))
  {
    uint64_t v13 = a1[4];
    id v14 = *(NSObject **)(v13 + 144);
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __46__TSUZipWriter_p_writeData_offset_completion___block_invoke_2;
    v16[3] = &unk_264D615E0;
    v16[4] = v13;
    v16[5] = v12;
    dispatch_async(v14, v16);
  }
  uint64_t v15 = a1[5];
  if (v15) {
    (*(void (**)(uint64_t, void))(v15 + 16))(v15, *(void *)(*(void *)(a1[6] + 8) + 40));
  }
  dispatch_resume(*(dispatch_object_t *)(a1[4] + 16));
LABEL_11:
}

uint64_t __46__TSUZipWriter_p_writeData_offset_completion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleWriteError:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
}

- (id)prepareWriteChannelWithCloseCompletionHandler:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [NSString stringWithUTF8String:"-[TSUZipWriter prepareWriteChannelWithCloseCompletionHandler:]"];
  uint64_t v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUZipWriter.m"];
  dispatch_data_t v6 = (objc_class *)objc_opt_class();
  id v7 = NSStringFromClass(v6);
  +[OITSUAssertionHandler handleFailureInFunction:v4, v5, 748, 0, "Abstract method not overridden by %@", v7 file lineNumber isFatal description];

  +[OITSUAssertionHandler logBacktraceThrottled];
  id v8 = (void *)MEMORY[0x263EFF940];
  uint64_t v9 = *MEMORY[0x263EFF498];
  id v10 = NSString;
  uint64_t v11 = (objc_class *)objc_opt_class();
  uint64_t v12 = NSStringFromClass(v11);
  uint64_t v13 = [v10 stringWithFormat:@"Abstract method not overridden by %@: %s", v12, "-[TSUZipWriter prepareWriteChannelWithCloseCompletionHandler:]"];
  id v14 = [v8 exceptionWithName:v9 reason:v13 userInfo:0];

  objc_exception_throw(v14);
}

- (unint64_t)archiveLength
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  writeQueue = self->_writeQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __29__TSUZipWriter_archiveLength__block_invoke;
  v5[3] = &unk_264D612C0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(writeQueue, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __29__TSUZipWriter_archiveLength__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 112);
  return result;
}

- (void)handleWriteError:(id)a3
{
  id v5 = a3;
  uint64_t v6 = v5;
  if (v5)
  {
    if ([v5 code] != 3072
      || ([v6 domain],
          id v7 = objc_claimAutoreleasedReturnValue(),
          char v8 = [v7 isEqualToString:*MEMORY[0x263F07F70]],
          v7,
          (v8 & 1) == 0))
    {
      if (TSUDefaultCat_init_token != -1) {
        dispatch_once(&TSUDefaultCat_init_token, &__block_literal_global_38);
      }
    }
    if (!self->_error)
    {
      channelQueue = self->_channelQueue;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __33__TSUZipWriter_handleWriteError___block_invoke_2;
      block[3] = &unk_264D61310;
      void block[4] = self;
      dispatch_async(channelQueue, block);
      objc_storeStrong((id *)&self->_error, a3);
    }
  }
}

void __33__TSUZipWriter_handleWriteError___block_invoke()
{
  uint64_t v0 = TSULogCreateCategory("TSUDefaultCat");
  v1 = (void *)TSUDefaultCat_log_t;
  TSUDefaultCat_log_t = v0;
}

void __33__TSUZipWriter_handleWriteError___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "p_writeChannel");
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  [v1 close];
}

- (void)enumerateEntriesUsingBlock:(id)a3
{
  id v4 = a3;
  writeQueue = self->_writeQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __43__TSUZipWriter_enumerateEntriesUsingBlock___block_invoke;
  v7[3] = &unk_264D618F8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(writeQueue, v7);
}

void __43__TSUZipWriter_enumerateEntriesUsingBlock___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  unsigned __int8 v16 = 0;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 40);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v17 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v13;
LABEL_3:
    uint64_t v6 = 0;
    while (1)
    {
      if (*(void *)v13 != v5) {
        objc_enumerationMutation(v2);
      }
      id v7 = *(void **)(*((void *)&v12 + 1) + 8 * v6);
      id v8 = objc_alloc_init(TSUZipEntry);
      uint64_t v9 = objc_msgSend(v7, "name", (void)v12);
      [(TSUZipEntry *)v8 setName:v9];

      id v10 = [(TSUZipEntry *)v8 name];
      -[TSUZipEntry setNameLength:](v8, "setNameLength:", (unsigned __int16)strlen((const char *)[v10 UTF8String]));

      uint64_t v11 = [v7 lastModificationDate];
      [(TSUZipEntry *)v8 setLastModificationDate:v11];

      -[TSUZipEntry setSize:](v8, "setSize:", [v7 size]);
      -[TSUZipEntry setCompressedSize:](v8, "setCompressedSize:", [v7 size]);
      -[TSUZipEntry setOffset:](v8, "setOffset:", [v7 offset]);
      -[TSUZipEntry setCRC:](v8, "setCRC:", [v7 CRC]);
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      LODWORD(v7) = v16;

      if (v7) {
        break;
      }
      if (v4 == ++v6)
      {
        uint64_t v4 = [v2 countByEnumeratingWithState:&v12 objects:v17 count:16];
        if (v4) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (id)sortedEntriesImpl
{
  sortedEntries = self->_sortedEntries;
  if (!sortedEntries)
  {
    uint64_t v4 = [(NSMutableArray *)self->_entries sortedArrayUsingComparator:&__block_literal_global_42];
    uint64_t v5 = self->_sortedEntries;
    self->_sortedEntries = v4;

    sortedEntries = self->_sortedEntries;
  }
  return sortedEntries;
}

uint64_t __33__TSUZipWriter_sortedEntriesImpl__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  unint64_t v5 = [a2 offset];
  unint64_t v6 = [v4 offset];

  if (v5 < v6) {
    return -1;
  }
  else {
    return v5 > v6;
  }
}

- (NSArray)sortedEntries
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__14;
  id v10 = __Block_byref_object_dispose__14;
  id v11 = 0;
  writeQueue = self->_writeQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __29__TSUZipWriter_sortedEntries__block_invoke;
  v5[3] = &unk_264D612C0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(writeQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

void __29__TSUZipWriter_sortedEntries__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) sortedEntriesImpl];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (BOOL)isClosed
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  writeQueue = self->_writeQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __24__TSUZipWriter_isClosed__block_invoke;
  v5[3] = &unk_264D612C0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(writeQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __24__TSUZipWriter_isClosed__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 72);
  return result;
}

- (id)entryWithName:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  long long v13 = &v12;
  uint64_t v14 = 0x3032000000;
  long long v15 = __Block_byref_object_copy__14;
  unsigned __int8 v16 = __Block_byref_object_dispose__14;
  id v17 = 0;
  writeQueue = self->_writeQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __30__TSUZipWriter_entryWithName___block_invoke;
  block[3] = &unk_264D61298;
  id v10 = v4;
  id v11 = &v12;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(writeQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __30__TSUZipWriter_entryWithName___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 56) objectForKeyedSubscript:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)truncateToNumberOfEntries:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  writeQueue = self->_writeQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53__TSUZipWriter_truncateToNumberOfEntries_completion___block_invoke;
  block[3] = &unk_264D61920;
  id v10 = v6;
  unint64_t v11 = a3;
  void block[4] = self;
  id v8 = v6;
  dispatch_async(writeQueue, block);
}

uint64_t __53__TSUZipWriter_truncateToNumberOfEntries_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) truncateToNumberOfEntriesImpl:*(void *)(a1 + 48) completion:*(void *)(a1 + 40)];
}

- (void)truncateToNumberOfEntriesImpl:(unint64_t)a3 completion:(id)a4
{
  id v13 = a4;
  if ([(TSUZipWriter *)self entriesCountImpl] <= a3)
  {
    uint64_t v12 = v13;
    if (!v13) {
      goto LABEL_9;
    }
    (*((void (**)(id, void))v13 + 2))(v13, 0);
  }
  else
  {
    id v6 = [(TSUZipWriter *)self sortedEntriesImpl];
    if ([v6 count] > a3)
    {
      unint64_t v7 = a3;
      do
      {
        id v8 = [v6 objectAtIndexedSubscript:v7];
        [(NSMutableArray *)self->_entries removeObject:v8];
        entriesMap = self->_entriesMap;
        id v10 = [v8 name];
        [(NSMutableDictionary *)entriesMap removeObjectForKey:v10];

        ++v7;
      }
      while (v7 < [v6 count]);
    }
    unint64_t v11 = [v6 objectAtIndexedSubscript:a3];
    -[TSUZipWriter setEntryInsertionOffsetImpl:](self, "setEntryInsertionOffsetImpl:", [v11 offset]);
    -[TSUZipWriter truncateToOffsetImpl:completion:](self, "truncateToOffsetImpl:completion:", [v11 offset], v13);
  }
  uint64_t v12 = v13;
LABEL_9:
}

- (void)truncateToOffset:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  writeQueue = self->_writeQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __44__TSUZipWriter_truncateToOffset_completion___block_invoke;
  block[3] = &unk_264D61920;
  id v10 = v6;
  int64_t v11 = a3;
  void block[4] = self;
  id v8 = v6;
  dispatch_async(writeQueue, block);
}

uint64_t __44__TSUZipWriter_truncateToOffset_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) truncateToOffsetImpl:*(void *)(a1 + 48) completion:*(void *)(a1 + 40)];
}

- (void)truncateToOffsetImpl:(int64_t)a3 completion:(id)a4
{
  id v4 = a4;
  unint64_t v5 = [NSString stringWithUTF8String:"-[TSUZipWriter truncateToOffsetImpl:completion:]"];
  id v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUZipWriter.m"];
  unint64_t v7 = (objc_class *)objc_opt_class();
  id v8 = NSStringFromClass(v7);
  +[OITSUAssertionHandler handleFailureInFunction:v5, v6, 885, 0, "Abstract method not overridden by %@", v8 file lineNumber isFatal description];

  +[OITSUAssertionHandler logBacktraceThrottled];
  char v9 = (void *)MEMORY[0x263EFF940];
  uint64_t v10 = *MEMORY[0x263EFF498];
  int64_t v11 = NSString;
  uint64_t v12 = (objc_class *)objc_opt_class();
  id v13 = NSStringFromClass(v12);
  uint64_t v14 = [v11 stringWithFormat:@"Abstract method not overridden by %@: %s", v13, "-[TSUZipWriter truncateToOffsetImpl:completion:]"];
  id v15 = [v9 exceptionWithName:v10 reason:v14 userInfo:0];

  objc_exception_throw(v15);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_writeQueue, 0);
  objc_storeStrong((id *)&self->_entryDatas, 0);
  objc_storeStrong((id *)&self->_localFileHeaderData, 0);
  objc_storeStrong((id *)&self->_newEntryLastModificationDate, 0);
  objc_storeStrong((id *)&self->_lastModificationDateIfSizeAndCRCMatches, 0);
  objc_storeStrong((id *)&self->_currentEntry, 0);
  objc_storeStrong((id *)&self->_entriesMap, 0);
  objc_storeStrong((id *)&self->_sortedEntries, 0);
  objc_storeStrong((id *)&self->_entries, 0);
  objc_storeStrong((id *)&self->_writeChannelCompletionSemaphore, 0);
  objc_storeStrong((id *)&self->_writeChannel, 0);
  objc_storeStrong((id *)&self->_channelQueue, 0);
}

@end