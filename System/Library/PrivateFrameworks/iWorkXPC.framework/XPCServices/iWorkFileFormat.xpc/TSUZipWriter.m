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
  v19.receiver = self;
  v19.super_class = (Class)TSUZipWriter;
  v4 = [(TSUZipWriter *)&v19 init];
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

    v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v11 = dispatch_queue_create("TSUZipWriter.Channel", v10);
    channelQueue = v5->_channelQueue;
    v5->_channelQueue = (OS_dispatch_queue *)v11;

    v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v14 = dispatch_queue_create("TSUZipWriter.Write", v13);
    writeQueue = v5->_writeQueue;
    v5->_writeQueue = (OS_dispatch_queue *)v14;

    uint64_t v16 = +[NSDate date];
    newEntryLastModificationDate = v5->_newEntryLastModificationDate;
    v5->_newEntryLastModificationDate = (NSDate *)v16;
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
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000AC5E8;
  v5[3] = &unk_1001C5A18;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(writeQueue, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (unint64_t)entriesCountImpl
{
  return (unint64_t)[(NSMutableDictionary *)self->_entriesMap count];
}

- (id)p_writeChannel
{
  writeChannel = self->_writeChannel;
  if (!writeChannel)
  {
    if (self->_writeChannelCompletionSemaphore)
    {
      +[TSUAssertionHandler _atomicIncrementAssertCount];
      if (TSUAssertCat_init_token != -1) {
        dispatch_once(&TSUAssertCat_init_token, &stru_1001CE2D8);
      }
      if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
        sub_1001699E8();
      }
      TSUSetCrashReporterInfo((uint64_t)"Fatal Assertion failure: %{public}s %{public}s:%d Write channel semaphore should not be initialized.", v9, v10, v11, v12, v13, v14, v15, (char)"-[TSUZipWriter p_writeChannel]");
      uint64_t v16 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSUZipWriter p_writeChannel]");
      v17 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/utility/TSUZipWriter.m"];
      +[TSUAssertionHandler handleFailureInFunction:v16 file:v17 lineNumber:110 isFatal:1 description:"Write channel semaphore should not be initialized."];

      TSUCrashBreakpoint(v18);
      abort();
    }
    v4 = (OS_dispatch_semaphore *)dispatch_semaphore_create(0);
    writeChannelCompletionSemaphore = self->_writeChannelCompletionSemaphore;
    self->_writeChannelCompletionSemaphore = v4;

    objc_initWeak(&location, self);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1000AC864;
    v19[3] = &unk_1001CE300;
    objc_copyWeak(&v20, &location);
    uint64_t v6 = [(TSUZipWriter *)self prepareWriteChannelWithCloseCompletionHandler:v19];
    v7 = self->_writeChannel;
    self->_writeChannel = v6;

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
    writeChannel = self->_writeChannel;
  }
  return writeChannel;
}

- (void)beginEntryWithName:(id)a3 force32BitSize:(BOOL)a4 lastModificationDate:(id)a5 size:(unint64_t)a6 CRC:(unsigned int)a7 forceCalculatingSizeAndCRCForPreservingLastModificationDate:(BOOL)a8
{
  id v14 = a3;
  id v15 = a5;
  writeQueue = self->_writeQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000AC99C;
  block[3] = &unk_1001CE328;
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

- (void)beginEntryWithNameImpl:(id)a3 force32BitSize:(BOOL)a4 lastModificationDate:(id)a5 size:(unint64_t)a6 CRC:(unsigned int)a7 forceCalculatingSizeAndCRCForPreservingLastModificationDate:(BOOL)a8
{
  BOOL v8 = a8;
  uLong v9 = *(void *)&a7;
  id v14 = a3;
  id v15 = (NSDate *)a5;
  if (self->_isClosed)
  {
    +[TSUAssertionHandler _atomicIncrementAssertCount];
    if (TSUAssertCat_init_token != -1) {
      dispatch_once(&TSUAssertCat_init_token, &stru_1001CE348);
    }
    if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_100169B2C();
    }
    TSUSetCrashReporterInfo((uint64_t)"Fatal Assertion failure: %{public}s %{public}s:%d Already closed.", v36, v37, v38, v39, v40, v41, v42, (char)"-[TSUZipWriter beginEntryWithNameImpl:force32BitSize:lastModificationDate:size:CRC:forceCalculatingSizeAndCRCForPreservingLastModificationDate:]");
    v43 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSUZipWriter beginEntryWithNameImpl:force32BitSize:lastModificationDate:size:CRC:forceCalculatingSizeAndCRCForPreservingLastModificationDate:]");
    v44 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/utility/TSUZipWriter.m"];
    +[TSUAssertionHandler handleFailureInFunction:v43 file:v44 lineNumber:157 isFatal:1 description:"Already closed."];

    TSUCrashBreakpoint(v45);
    abort();
  }
  uint64_t v16 = v15;
  if (!self->_error)
  {
    [(TSUZipWriter *)self finishEntry];
    id v17 = [(NSMutableDictionary *)self->_entriesMap objectForKeyedSubscript:v14];

    if (v17)
    {
      int v18 = +[TSUAssertionHandler _atomicIncrementAssertCount];
      if (TSUAssertCat_init_token != -1) {
        dispatch_once(&TSUAssertCat_init_token, &stru_1001CE368);
      }
      objc_super v19 = TSUAssertCat_log_t;
      if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
        sub_100169A70((uint64_t)v14, v18, v19);
      }
      id v20 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSUZipWriter beginEntryWithNameImpl:force32BitSize:lastModificationDate:size:CRC:forceCalculatingSizeAndCRCForPreservingLastModificationDate:]");
      id v21 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/utility/TSUZipWriter.m"];
      +[TSUAssertionHandler handleFailureInFunction:v20, v21, 166, 0, "Already have an entry with name: %@", v14 file lineNumber isFatal description];

      +[TSUAssertionHandler logBacktraceThrottled];
    }
    else
    {
      unint64_t v22 = objc_alloc_init(TSUZipWriterEntry);
      currentEntry = self->_currentEntry;
      self->_currentEntry = v22;

      [(TSUZipWriterEntry *)self->_currentEntry setName:v14];
      [(TSUZipWriterEntry *)self->_currentEntry setOffset:self->_currentOffset];
      if (a6) {
        BOOL v24 = v8;
      }
      else {
        BOOL v24 = 1;
      }
      self->_calculateSize = v24;
      if (v24) {
        unint64_t v25 = 0;
      }
      else {
        unint64_t v25 = a6;
      }
      [(TSUZipWriterEntry *)self->_currentEntry setSize:v25];
      BOOL v26 = self->_calculateSize && a4;
      self->_force32BitSize = v26;
      if (v9) {
        BOOL v27 = v8;
      }
      else {
        BOOL v27 = 1;
      }
      self->_calculateCRC = v27;
      uLong v28 = v9;
      if (v27) {
        uLong v28 = crc32(0, 0, 0);
      }
      [(TSUZipWriterEntry *)self->_currentEntry setCRC:v28];
      if (v8)
      {
        [(TSUZipWriterEntry *)self->_currentEntry setLastModificationDate:self->_newEntryLastModificationDate];
        self->_sizeToMatch = a6;
        self->_CRCToMatch = v9;
        v29 = v16;
        lastModificationDateIfSizeAndCRCMatches = self->_lastModificationDateIfSizeAndCRCMatches;
        self->_lastModificationDateIfSizeAndCRCMatches = v29;
      }
      else
      {
        newEntryLastModificationDate = v16;
        if (!v16) {
          newEntryLastModificationDate = self->_newEntryLastModificationDate;
        }
        [(TSUZipWriterEntry *)self->_currentEntry setLastModificationDate:newEntryLastModificationDate];
        self->_sizeToMatch = 0;
        self->_CRCToMatch = 0;
        lastModificationDateIfSizeAndCRCMatches = self->_lastModificationDateIfSizeAndCRCMatches;
        self->_lastModificationDateIfSizeAndCRCMatches = 0;
      }

      v32 = [(TSUZipWriter *)self localFileHeaderDataForEntry:self->_currentEntry];
      if ((self->_calculateSize || self->_calculateCRC) && (self->_options & 8) == 0)
      {
        objc_storeStrong((id *)&self->_localFileHeaderData, v32);
        v33 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
        entryDatas = self->_entryDatas;
        self->_entryDatas = v33;
      }
      else
      {
        [(TSUZipWriter *)self writeData:v32];
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
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000ACEF0;
  v15[3] = &unk_1001CE390;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(writeQueue, v15);
}

- (void)addDataImpl:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (self->_isClosed)
  {
    +[TSUAssertionHandler _atomicIncrementAssertCount];
    if (TSUAssertCat_init_token != -1) {
      dispatch_once(&TSUAssertCat_init_token, &stru_1001CE3B0);
    }
    if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_100169BB4();
    }
    TSUSetCrashReporterInfo((uint64_t)"Fatal Assertion failure: %{public}s %{public}s:%d Already closed.", v17, v18, v19, v20, v21, v22, v23, (char)"-[TSUZipWriter addDataImpl:queue:completion:]");
    BOOL v24 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSUZipWriter addDataImpl:queue:completion:]");
    unint64_t v25 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/utility/TSUZipWriter.m"];
    +[TSUAssertionHandler handleFailureInFunction:v24 file:v25 lineNumber:233 isFatal:1 description:"Already closed."];

    TSUCrashBreakpoint(v26);
    abort();
  }
  uint64_t v11 = (void (**)(void, void))v10;
  id v12 = self->_error;
  if (v12)
  {
    if (v11)
    {
      if (v9)
      {
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_1000AD2CC;
        block[3] = &unk_1001CC350;
        v32 = v11;
        v31 = v12;
        dispatch_async(v9, block);
      }
      else
      {
        ((void (**)(void, NSError *))v11)[2](v11, v12);
      }
    }
    goto LABEL_15;
  }
  size_t size = dispatch_data_get_size(v8);
  entryDatas = self->_entryDatas;
  if (entryDatas)
  {
    localFileHeaderData = self->_localFileHeaderData;
    if (dispatch_data_get_size((dispatch_data_t)localFileHeaderData) + size + self->_entryDataSize < 0x40000)
    {
      [(NSMutableArray *)entryDatas addObject:v8];
      self->_entryDataSize += size;
      if (v11)
      {
        if (v9)
        {
          v28[0] = _NSConcreteStackBlock;
          v28[1] = 3221225472;
          v28[2] = sub_1000AD2E0;
          v28[3] = &unk_1001C6900;
          v29 = v11;
          dispatch_async(v9, v28);
        }
        else
        {
          v11[2](v11, 0);
        }
      }
      goto LABEL_10;
    }
    [(TSUZipWriter *)self writeData:localFileHeaderData];
    id v16 = self->_localFileHeaderData;
    self->_localFileHeaderData = 0;

    [(TSUZipWriter *)self flushEntryData];
  }
  [(TSUZipWriter *)self writeData:v8 queue:v9 completion:v11];
LABEL_10:
  if (self->_calculateSize) {
    [(TSUZipWriterEntry *)self->_currentEntry setSize:(char *)[(TSUZipWriterEntry *)self->_currentEntry size] + size];
  }
  if (self->_calculateCRC)
  {
    applier[0] = _NSConcreteStackBlock;
    applier[1] = 3221225472;
    applier[2] = sub_1000AD2F4;
    applier[3] = &unk_1001C92A8;
    applier[4] = self;
    dispatch_data_apply(v8, applier);
  }
LABEL_15:
}

- (void)flushEntryData
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  unint64_t v3 = self->_entryDatas;
  id v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        -[TSUZipWriter writeData:](self, "writeData:", *(void *)(*((void *)&v9 + 1) + 8 * (void)v7), (void)v9);
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
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
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000AD654;
  block[3] = &unk_1001CE468;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(writeQueue, block);
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
          dispatch_once(&TSUDefaultCat_init_token, &stru_1001CE488);
        }
        id v4 = TSUDefaultCat_log_t;
        if (os_log_type_enabled((os_log_t)TSUDefaultCat_log_t, OS_LOG_TYPE_ERROR)) {
          sub_100169D4C(v4, v5, v6, v7, v8, v9, v10, v11);
        }
        id v12 = +[NSError tsu_fileWriteUnknownErrorWithUserInfo:0];
        [(TSUZipWriter *)self handleWriteError:v12];

        return;
      }
      currentEntry = self->_currentEntry;
    }
    if (self->_lastModificationDateIfSizeAndCRCMatches)
    {
      id v13 = [(TSUZipWriterEntry *)currentEntry size];
      currentEntry = self->_currentEntry;
      if (v13 == self->_sizeToMatch)
      {
        unsigned int v14 = [(TSUZipWriterEntry *)self->_currentEntry CRC];
        currentEntry = self->_currentEntry;
        if (v14 == self->_CRCToMatch)
        {
          [(TSUZipWriterEntry *)self->_currentEntry setLastModificationDate:self->_lastModificationDateIfSizeAndCRCMatches];
          currentEntry = self->_currentEntry;
        }
      }
    }
    id v15 = [(TSUZipWriter *)self localFileHeaderDataForEntry:currentEntry];
    if (self->_entryDatas)
    {
      [(TSUZipWriter *)self writeData:v15];
      localFileHeaderData = self->_localFileHeaderData;
      self->_localFileHeaderData = 0;

      [(TSUZipWriter *)self flushEntryData];
    }
    else
    {
      [(TSUZipWriter *)self writeData:v15 offset:[(TSUZipWriterEntry *)self->_currentEntry offset]];
    }

    currentEntry = self->_currentEntry;
  }
  [(NSMutableArray *)self->_entries addObject:currentEntry];
  entriesMap = self->_entriesMap;
  uint64_t v17 = self->_currentEntry;
  uint64_t v19 = [(TSUZipWriterEntry *)v17 name];
  [(NSMutableDictionary *)entriesMap setObject:v17 forKeyedSubscript:v19];

  sortedEntries = self->_sortedEntries;
  self->_sortedEntries = 0;

  uint64_t v21 = self->_currentEntry;
  self->_currentEntry = 0;
}

- (void)writeEntryWithName:(id)a3 force32BitSize:(BOOL)a4 lastModificationDate:(id)a5 size:(unint64_t)a6 CRC:(unsigned int)a7 fromReadChannel:(id)a8 completion:(id)a9
{
  uint64_t v10 = *(void *)&a7;
  BOOL v13 = a4;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000ADDD0;
  v17[3] = &unk_1001CE4B0;
  id v18 = a9;
  id v16 = v18;
  [(TSUZipWriter *)self writeEntryWithName:a3 force32BitSize:v13 lastModificationDate:a5 size:a6 CRC:v10 fromReadChannel:a8 writeHandler:v17];
}

- (void)writeEntryWithName:(id)a3 force32BitSize:(BOOL)a4 lastModificationDate:(id)a5 size:(unint64_t)a6 CRC:(unsigned int)a7 fromReadChannel:(id)a8 writeHandler:(id)a9
{
  id v15 = a3;
  id v16 = a5;
  id v17 = a8;
  id v18 = a9;
  if (!v17)
  {
    +[TSUAssertionHandler _atomicIncrementAssertCount];
    if (TSUAssertCat_init_token != -1) {
      dispatch_once(&TSUAssertCat_init_token, &stru_1001CE4D0);
    }
    if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_100169D84();
    }
    uint64_t v19 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSUZipWriter writeEntryWithName:force32BitSize:lastModificationDate:size:CRC:fromReadChannel:writeHandler:]");
    uint64_t v20 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/utility/TSUZipWriter.m"];
    +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v19, v20, 365, 0, "invalid nil value for '%{public}s'", "readChannel");

    +[TSUAssertionHandler logBacktraceThrottled];
  }
  writeQueue = self->_writeQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000AE0BC;
  block[3] = &unk_1001CE540;
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

- (void)writeEntryWithName:(id)a3 force32BitSize:(BOOL)a4 fromReadChannel:(id)a5 completion:(id)a6
{
}

- (void)addExistingEntry:(id)a3
{
  id v4 = a3;
  writeQueue = self->_writeQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000AE47C;
  v7[3] = &unk_1001C92D0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(writeQueue, v7);
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
    id v7 = [v11 compressedSize];
  }
  else {
    id v7 = [v11 size];
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
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000AE630;
  v4[3] = &unk_1001CD1A0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(writeQueue, v4);
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
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000AE6F0;
    v7[3] = &unk_1001C59F0;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(writeQueue, v7);
  }
}

- (void)closeWithQueue:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  writeQueue = self->_writeQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000AE95C;
  block[3] = &unk_1001CE468;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(writeQueue, block);
}

- (void)writeCentralDirectory
{
  int64_t currentOffset = self->_currentOffset;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = self->_entries;
  id v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        -[TSUZipWriter writeCentralFileHeaderDataForEntry:](self, "writeCentralFileHeaderDataForEntry:", *(void *)(*((void *)&v9 + 1) + 8 * (void)v8), (void)v9);
        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }

  [(TSUZipWriter *)self writeEndOfCentralDirectoryDataWithOffset:currentOffset size:self->_currentOffset - currentOffset entryCount:[(NSMutableArray *)self->_entries count]];
}

- (id)localFileHeaderDataForEntry:(id)a3
{
  id v4 = a3;
  id v5 = [v4 name];
  id v6 = (const char *)[v5 UTF8String];

  __src = v6;
  size_t v7 = strlen(v6);
  if (v7 >= 0x10000)
  {
    if (TSUDefaultCat_init_token != -1) {
      dispatch_once(&TSUDefaultCat_init_token, &stru_1001CE5F0);
    }
    id v8 = TSUDefaultCat_log_t;
    if (os_log_type_enabled((os_log_t)TSUDefaultCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_100169FF4(v8, v9, v10, v11, v12, v13, v14, v15);
    }
    size_t v7 = 0xFFFFLL;
  }
  unint64_t v16 = self->_options & 1;
  unint64_t v17 = v16 | ((unint64_t)[v4 size] >> 32);
  BOOL v18 = v17 != 0;
  if (v17 || self->_calculateSize)
  {
    BOOL v32 = !self->_force32BitSize;
    if (self->_force32BitSize) {
      unsigned int v19 = 0;
    }
    else {
      unsigned int v19 = 20;
    }
  }
  else
  {
    BOOL v32 = 0;
    unsigned int v19 = 0;
  }
  size_t v20 = v7 + v19 + 30;
  uint64_t v21 = malloc_type_malloc(v20, 0xC0E2D7D1uLL);
  id v22 = (char *)v21 + 30;
  *uint64_t v21 = 67324752;
  v21[1] = 20;
  *((_WORD *)v21 + 4) = 0;
  id v23 = [v4 lastModificationDate];
  unsigned int v24 = objc_msgSend(v23, "tsu_DOSTime");

  HIDWORD(v25) = v24;
  LODWORD(v25) = v24;
  *(_DWORD *)((char *)v21 + 10) = v25 >> 16;
  *(_DWORD *)((char *)v21 + 14) = [v4 CRC];
  if (!v18)
  {
    *(_DWORD *)((char *)v21 + 18) = [v4 size];
LABEL_19:
    unsigned int v27 = [v4 size];
    goto LABEL_20;
  }
  if (self->_force32BitSize) {
    unsigned int v26 = [v4 size];
  }
  else {
    unsigned int v26 = -1;
  }
  *(_DWORD *)((char *)v21 + 18) = v26;
  if (self->_force32BitSize) {
    goto LABEL_19;
  }
  unsigned int v27 = -1;
LABEL_20:
  *(_DWORD *)((char *)v21 + 22) = v27;
  *((_WORD *)v21 + 13) = v7;
  *((_WORD *)v21 + 14) = v19;
  memcpy(v22, __src, v7);
  if (v32)
  {
    id v28 = &v22[v7];
    *(_WORD *)id v28 = TSUZip64ExtraFieldSignature;
    *((_WORD *)v28 + 1) = 16;
    id v29 = [v4 size];
    *(void *)(v28 + 4) = v29;
    *(void *)(v28 + 12) = v29;
  }
  dispatch_data_t v30 = dispatch_data_create(v21, v20, 0, _dispatch_data_destructor_free);

  return v30;
}

- (void)writeCentralFileHeaderDataForEntry:(id)a3
{
  id v4 = a3;
  id v5 = [v4 name];
  id v6 = (const char *)[v5 UTF8String];

  __src = v6;
  size_t v7 = strlen(v6);
  if (v7 >= 0x10000)
  {
    if (TSUDefaultCat_init_token != -1) {
      dispatch_once(&TSUDefaultCat_init_token, &stru_1001CE610);
    }
    id v8 = TSUDefaultCat_log_t;
    if (os_log_type_enabled((os_log_t)TSUDefaultCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_100169FF4(v8, v9, v10, v11, v12, v13, v14, v15);
    }
    size_t v7 = 0xFFFFLL;
  }
  v35 = self;
  unint64_t v16 = self->_options & 2;
  unint64_t v17 = v16 | ((unint64_t)[v4 size] >> 32);
  unint64_t v18 = v16 | ((unint64_t)[v4 offset] >> 32);
  unsigned int v19 = 4 * ((v17 | v18) != 0);
  if (v17) {
    unsigned int v19 = 20;
  }
  BOOL v20 = v18 != 0;
  if (v18) {
    uint64_t v21 = v19 | 8;
  }
  else {
    uint64_t v21 = v19;
  }
  size_t v22 = v7 + v21 + 46;
  id v23 = (char *)malloc_type_malloc(v22, 0xB4837524uLL);
  unsigned int v24 = v23 + 46;
  *(_DWORD *)id v23 = 33639248;
  *(void *)(v23 + 4) = 1310782;
  unint64_t v25 = [v4 lastModificationDate];
  unsigned int v26 = objc_msgSend(v25, "tsu_DOSTime");

  HIDWORD(v27) = v26;
  LODWORD(v27) = v26;
  *((_DWORD *)v23 + 3) = v27 >> 16;
  *((_DWORD *)v23 + 4) = [v4 CRC];
  if (v17)
  {
    unsigned int v28 = -1;
    *((_DWORD *)v23 + 5) = -1;
  }
  else
  {
    *((_DWORD *)v23 + 5) = [v4 size];
    unsigned int v28 = [v4 size];
  }
  *((_DWORD *)v23 + 6) = v28;
  *((_WORD *)v23 + 14) = v7;
  *((_WORD *)v23 + 15) = v21;
  *((void *)v23 + 4) = 0;
  *((_WORD *)v23 + 20) = 0;
  BOOL v29 = v20;
  if (v20)
  {
    *(_DWORD *)(v23 + 42) = -1;
    memcpy(v24, __src, v7);
    *(_WORD *)&v24[v7] = TSUZip64ExtraFieldSignature;
    dispatch_data_t v30 = &v24[v7 + 4];
    *(_WORD *)&v24[v7 + 2] = 0;
    unint64_t v31 = &v24[v7 + 2];
    if (!v17) {
      goto LABEL_22;
    }
  }
  else
  {
    *(_DWORD *)(v23 + 42) = [v4 offset];
    memcpy(v24, __src, v7);
    if (!v17) {
      goto LABEL_23;
    }
    dispatch_data_t v30 = &v24[v7 + 4];
    *(_WORD *)&v24[v7] = TSUZip64ExtraFieldSignature;
    unint64_t v31 = &v24[v7 + 2];
  }
  BOOL v32 = &v24[v7];
  *(_WORD *)unint64_t v31 = 16;
  *(void *)dispatch_data_t v30 = [v4 size];
  *(void *)(v32 + 12) = [v4 size];
  if (v29)
  {
    dispatch_data_t v30 = v32 + 20;
LABEL_22:
    *(_WORD *)v31 += 8;
    *(void *)dispatch_data_t v30 = [v4 offset];
  }
LABEL_23:
  dispatch_data_t v33 = dispatch_data_create(v23, v22, 0, _dispatch_data_destructor_free);
  [(TSUZipWriter *)v35 writeData:v33];
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
  uint64_t v13 = malloc_type_malloc(0x16uLL, 0x8C36F3DuLL);
  *(void *)uint64_t v13 = 101010256;
  if (v9) {
    __int16 v14 = -1;
  }
  else {
    __int16 v14 = v5;
  }
  v13[4] = v14;
  v13[5] = v14;
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
  dispatch_data_t v17 = dispatch_data_create(v13, 0x16uLL, 0, _dispatch_data_destructor_free);
  [(TSUZipWriter *)self writeData:v17];
}

- (void)writeZip64EndOfCentralDirectoryWithOffset:(int64_t)a3 size:(int64_t)a4 entryCount:(unint64_t)a5
{
  int v9 = malloc_type_malloc(0x38uLL, 0xF650BC62uLL);
  *(_DWORD *)int v9 = 101075792;
  *(void *)((char *)v9 + 4) = 44;
  v9[2] = 0;
  v9[3] = a5;
  *((_DWORD *)v9 + 3) = 1310782;
  v9[4] = a5;
  v9[5] = a4;
  v9[6] = a3;
  dispatch_data_t v10 = dispatch_data_create(v9, 0x38uLL, 0, _dispatch_data_destructor_free);
  [(TSUZipWriter *)self writeData:v10];
}

- (void)writeZip64EndOfCentralDirectoryLocatorWithOffset:(int64_t)a3
{
  __int16 v5 = malloc_type_malloc(0x14uLL, 0xCBC617B6uLL);
  _DWORD *v5 = 117853008;
  v5[1] = 0;
  *((void *)v5 + 1) = a3;
  v5[4] = 1;
  dispatch_data_t v6 = dispatch_data_create(v5, 0x14uLL, 0, _dispatch_data_destructor_free);
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
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000AFA98;
  v14[3] = &unk_1001CE638;
  id v15 = v8;
  id v16 = v9;
  id v12 = v8;
  id v13 = v9;
  [(TSUZipWriter *)self p_writeData:a3 offset:writtenOffset completion:v14];
  self->_writtenOffset += size;
}

- (void)writeData:(id)a3 offset:(int64_t)a4
{
}

- (void)p_writeData:(id)a3 offset:(int64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  channelQueue = self->_channelQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000AFC44;
  v13[3] = &unk_1001CE688;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  int64_t v16 = a4;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(channelQueue, v13);
}

- (id)prepareWriteChannelWithCloseCompletionHandler:(id)a3
{
  id v3 = a3;
  unsigned int v4 = +[TSUAssertionHandler _atomicIncrementAssertCount];
  if (TSUAssertCat_init_token != -1) {
    dispatch_once(&TSUAssertCat_init_token, &stru_1001CE6A8);
  }
  __int16 v5 = TSUAssertCat_log_t;
  if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR))
  {
    dispatch_data_t v6 = v5;
    int v7 = (objc_class *)objc_opt_class();
    id v8 = NSStringFromClass(v7);
    *(_DWORD *)buf = 67110146;
    unsigned int v18 = v4;
    __int16 v19 = 2082;
    BOOL v20 = "-[TSUZipWriter prepareWriteChannelWithCloseCompletionHandler:]";
    __int16 v21 = 2082;
    size_t v22 = "/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/utility/TSUZipWriter.m";
    __int16 v23 = 1024;
    int v24 = 783;
    __int16 v25 = 2114;
    unsigned int v26 = v8;
    _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Abstract method not overridden by %{public}@", buf, 0x2Cu);
  }
  id v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSUZipWriter prepareWriteChannelWithCloseCompletionHandler:]");
  dispatch_data_t v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/utility/TSUZipWriter.m"];
  id v11 = (objc_class *)objc_opt_class();
  id v12 = NSStringFromClass(v11);
  +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 783, 0, "Abstract method not overridden by %{public}@", v12);

  +[TSUAssertionHandler logBacktraceThrottled];
  id v13 = (objc_class *)objc_opt_class();
  id v14 = NSStringFromClass(v13);
  id v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Abstract method not overridden by %@: %s", v14, "-[TSUZipWriter prepareWriteChannelWithCloseCompletionHandler:]");
  id v16 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v15 userInfo:0];

  objc_exception_throw(v16);
}

- (unint64_t)archiveLength
{
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  writeQueue = self->_writeQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000B01B8;
  v5[3] = &unk_1001C5A18;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(writeQueue, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)handleWriteError:(id)a3
{
  id v5 = a3;
  uint64_t v6 = v5;
  if (v5)
  {
    if ([v5 code] != (id)3072
      || ([v6 domain],
          int v7 = objc_claimAutoreleasedReturnValue(),
          unsigned __int8 v8 = [v7 isEqualToString:NSCocoaErrorDomain],
          v7,
          (v8 & 1) == 0))
    {
      if (TSUDefaultCat_init_token != -1) {
        dispatch_once(&TSUDefaultCat_init_token, &stru_1001CE6C8);
      }
      uint64_t v9 = TSUDefaultCat_log_t;
      if (os_log_type_enabled((os_log_t)TSUDefaultCat_log_t, OS_LOG_TYPE_ERROR)) {
        sub_10016A02C(v9, v6);
      }
    }
    if (!self->_error)
    {
      objc_storeStrong((id *)&self->_error, a3);
      channelQueue = self->_channelQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000B0358;
      block[3] = &unk_1001C5A40;
      void block[4] = self;
      dispatch_async(channelQueue, block);
    }
  }
}

- (void)enumerateEntriesUsingBlock:(id)a3
{
  id v4 = a3;
  writeQueue = self->_writeQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000B0434;
  v7[3] = &unk_1001C59F0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(writeQueue, v7);
}

- (id)sortedEntriesImpl
{
  sortedEntries = self->_sortedEntries;
  if (!sortedEntries)
  {
    id v4 = [(NSMutableArray *)self->_entries sortedArrayUsingComparator:&stru_1001CE708];
    id v5 = self->_sortedEntries;
    self->_sortedEntries = v4;

    sortedEntries = self->_sortedEntries;
  }
  return sortedEntries;
}

- (NSArray)sortedEntries
{
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = sub_1000AFD7C;
  dispatch_data_t v10 = sub_1000AFD8C;
  id v11 = 0;
  writeQueue = self->_writeQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000B07CC;
  v5[3] = &unk_1001C5A18;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(writeQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

- (BOOL)isClosed
{
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  writeQueue = self->_writeQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000B08C4;
  v5[3] = &unk_1001C5A18;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(writeQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)entryWithName:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = sub_1000AFD7C;
  id v16 = sub_1000AFD8C;
  id v17 = 0;
  writeQueue = self->_writeQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000B09E8;
  block[3] = &unk_1001CD178;
  id v10 = v4;
  id v11 = &v12;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(writeQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (void)truncateToNumberOfEntries:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  writeQueue = self->_writeQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000B0AE0;
  block[3] = &unk_1001CE1D0;
  id v10 = v6;
  unint64_t v11 = a3;
  void block[4] = self;
  id v8 = v6;
  dispatch_async(writeQueue, block);
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
    if ((unint64_t)[v6 count] > a3)
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
      while (v7 < (unint64_t)[v6 count]);
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
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000B0CE4;
  block[3] = &unk_1001CE1D0;
  id v10 = v6;
  int64_t v11 = a3;
  void block[4] = self;
  id v8 = v6;
  dispatch_async(writeQueue, block);
}

- (void)truncateToOffsetImpl:(int64_t)a3 completion:(id)a4
{
  id v4 = a4;
  unsigned int v5 = +[TSUAssertionHandler _atomicIncrementAssertCount];
  if (TSUAssertCat_init_token != -1) {
    dispatch_once(&TSUAssertCat_init_token, &stru_1001CE728);
  }
  id v6 = TSUAssertCat_log_t;
  if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR))
  {
    unint64_t v7 = v6;
    id v8 = (objc_class *)objc_opt_class();
    char v9 = NSStringFromClass(v8);
    *(_DWORD *)buf = 67110146;
    unsigned int v19 = v5;
    __int16 v20 = 2082;
    __int16 v21 = "-[TSUZipWriter truncateToOffsetImpl:completion:]";
    __int16 v22 = 2082;
    __int16 v23 = "/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/utility/TSUZipWriter.m";
    __int16 v24 = 1024;
    int v25 = 920;
    __int16 v26 = 2114;
    unint64_t v27 = v9;
    _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Abstract method not overridden by %{public}@", buf, 0x2Cu);
  }
  id v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSUZipWriter truncateToOffsetImpl:completion:]");
  int64_t v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/utility/TSUZipWriter.m"];
  uint64_t v12 = (objc_class *)objc_opt_class();
  id v13 = NSStringFromClass(v12);
  +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 920, 0, "Abstract method not overridden by %{public}@", v13);

  +[TSUAssertionHandler logBacktraceThrottled];
  uint64_t v14 = (objc_class *)objc_opt_class();
  id v15 = NSStringFromClass(v14);
  id v16 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Abstract method not overridden by %@: %s", v15, "-[TSUZipWriter truncateToOffsetImpl:completion:]");
  id v17 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v16 userInfo:0];

  objc_exception_throw(v17);
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