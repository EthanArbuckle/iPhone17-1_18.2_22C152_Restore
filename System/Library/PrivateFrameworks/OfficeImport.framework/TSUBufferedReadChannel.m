@interface TSUBufferedReadChannel
- (BOOL)isValid;
- (TSUBufferedReadChannel)initWithReadChannel:(id)a3 blockInfos:(id)a4 streamReadChannelBlock:(id)a5;
- (TSUBufferedReadChannel)initWithReadChannel:(id)a3 sourceReadBufferSize:(unint64_t)a4 blockInfos:(id)a5 streamReadChannelBlock:(id)a6;
- (id)_currentDataIntersectionWithOffset:(int64_t)a3 length:(unint64_t)a4 isReadDone:(BOOL *)a5;
- (void)_close;
- (void)_closeStreamReadChannel;
- (void)_readFromOffset:(int64_t)a3 length:(unint64_t)a4 handler:(id)a5;
- (void)_resetStreamReadChannelIfNeededForOffset:(int64_t)a3 length:(unint64_t)a4;
- (void)addBarrier:(id)a3;
- (void)close;
- (void)dealloc;
- (void)readFromOffset:(int64_t)a3 length:(unint64_t)a4 handler:(id)a5;
- (void)readWithHandler:(id)a3;
- (void)setLowWater:(unint64_t)a3;
- (void)setStreamReadChannelSourceHandler:(id)a3;
@end

@implementation TSUBufferedReadChannel

- (TSUBufferedReadChannel)initWithReadChannel:(id)a3 blockInfos:(id)a4 streamReadChannelBlock:(id)a5
{
  return [(TSUBufferedReadChannel *)self initWithReadChannel:a3 sourceReadBufferSize:0x200000 blockInfos:a4 streamReadChannelBlock:a5];
}

- (TSUBufferedReadChannel)initWithReadChannel:(id)a3 sourceReadBufferSize:(unint64_t)a4 blockInfos:(id)a5 streamReadChannelBlock:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  v28.receiver = self;
  v28.super_class = (Class)TSUBufferedReadChannel;
  id v14 = [(TSUBufferedReadChannel *)&v28 init];
  if (v14)
  {
    if (v11)
    {
      if (v13) {
        goto LABEL_4;
      }
    }
    else
    {
      v21 = [NSString stringWithUTF8String:"-[TSUBufferedReadChannel initWithReadChannel:sourceReadBufferSize:blockInfos:streamReadChannelBlock:]"];
      v22 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUBufferedReadChannel.m"];
      +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v21, v22, 60, 0, "invalid nil value for '%{public}s'", "sourceReadChannel");

      +[OITSUAssertionHandler logBacktraceThrottled];
      if (v13)
      {
LABEL_4:
        if (a4)
        {
LABEL_5:
          if (v11 && v13)
          {
            dispatch_queue_t v15 = dispatch_queue_create("TSUBufferedReadChannel.Read", 0);
            v16 = (void *)*((void *)v14 + 1);
            *((void *)v14 + 1) = v15;

            dispatch_queue_set_specific(*((dispatch_queue_t *)v14 + 1), (const void *)TSUBufferedReadChannelReadQueueSpecific, (void *)TSUBufferedReadChannelReadQueueSpecific, 0);
            objc_storeStrong((id *)v14 + 2, a3);
            *((void *)v14 + 3) = a4;
            *((void *)v14 + 4) = 0x7FFFFFFFFFFFFFFFLL;
            uint64_t v17 = [v12 copy];
            v18 = (void *)*((void *)v14 + 7);
            *((void *)v14 + 7) = v17;

            v19 = _Block_copy(v13);
            v20 = (void *)*((void *)v14 + 8);
            *((void *)v14 + 8) = v19;

            *((void *)v14 + 12) = 0x7FFFFFFFFFFFFFFFLL;
            goto LABEL_12;
          }
LABEL_11:

          id v14 = 0;
          goto LABEL_12;
        }
LABEL_10:
        v25 = [NSString stringWithUTF8String:"-[TSUBufferedReadChannel initWithReadChannel:sourceReadBufferSize:blockInfos:streamReadChannelBlock:]"];
        v26 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUBufferedReadChannel.m"];
        +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v25, v26, 62, 0, "Buffer size too small: %zu", 0);

        +[OITSUAssertionHandler logBacktraceThrottled];
        goto LABEL_11;
      }
    }
    v23 = [NSString stringWithUTF8String:"-[TSUBufferedReadChannel initWithReadChannel:sourceReadBufferSize:blockInfos:streamReadChannelBlock:]"];
    v24 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUBufferedReadChannel.m"];
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v23, v24, 61, 0, "invalid nil value for '%{public}s'", "streamReadChannelBlock");

    +[OITSUAssertionHandler logBacktraceThrottled];
    if (a4) {
      goto LABEL_5;
    }
    goto LABEL_10;
  }
LABEL_12:

  return (TSUBufferedReadChannel *)v14;
}

- (void)dealloc
{
  [(TSUBufferedReadChannel *)self _close];
  v3.receiver = self;
  v3.super_class = (Class)TSUBufferedReadChannel;
  [(TSUBufferedReadChannel *)&v3 dealloc];
}

- (void)close
{
  objc_super v3 = (void *)TSUBufferedReadChannelReadQueueSpecific;
  if (dispatch_get_specific((const void *)TSUBufferedReadChannelReadQueueSpecific) == v3)
  {
    [(TSUBufferedReadChannel *)self _close];
  }
  else
  {
    readQueue = self->_readQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __31__TSUBufferedReadChannel_close__block_invoke;
    block[3] = &unk_264D61310;
    block[4] = self;
    dispatch_sync(readQueue, block);
  }
}

uint64_t __31__TSUBufferedReadChannel_close__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _close];
}

- (void)_close
{
  [(TSUBufferedReadChannel *)self _closeStreamReadChannel];
  [(TSUReadChannel *)self->_sourceReadChannel close];
  sourceReadChannel = self->_sourceReadChannel;
  self->_sourceReadChannel = 0;

  id streamReadChannelSourceHandler = self->_streamReadChannelSourceHandler;
  self->_id streamReadChannelSourceHandler = 0;
}

- (void)_closeStreamReadChannel
{
  [(TSUStreamReadChannel *)self->_streamReadChannel close];
  streamReadChannel = self->_streamReadChannel;
  self->_streamReadChannel = 0;
}

- (void)_resetStreamReadChannelIfNeededForOffset:(int64_t)a3 length:(unint64_t)a4
{
  int64_t v5 = a3;
  uint64_t v43 = *MEMORY[0x263EF8340];
  int64_t streamOutputOffset = self->_streamOutputOffset;
  if (streamOutputOffset <= a3)
  {
    unint64_t streamOutputOutstandingLength = self->_streamOutputOutstandingLength;
    unint64_t v9 = streamOutputOutstandingLength + streamOutputOffset;
    if (streamOutputOutstandingLength == -1 || v9 > a3) {
      return;
    }
  }
  [(TSUBufferedReadChannel *)self _closeStreamReadChannel];
  *(_OWORD *)&self->_sourceOffset = xmmword_238EDB320;
  *(_OWORD *)&self->_int64_t streamOutputOffset = xmmword_238EDB320;
  self->_streamOutputLength = 0;
  NSUInteger v11 = [(NSArray *)self->_blockInfos count];
  if (!v11)
  {
    v16 = 0;
    goto LABEL_29;
  }
  NSUInteger v12 = v11;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v13 = self->_blockInfos;
  uint64_t v36 = [(NSArray *)v13 countByEnumeratingWithState:&v38 objects:v42 count:16];
  if (!v36)
  {
    v16 = 0;
    goto LABEL_28;
  }
  int64_t v14 = 0;
  unint64_t v15 = 0;
  v16 = 0;
  uint64_t v35 = *(void *)v39;
  v33 = v13;
  do
  {
    uint64_t v17 = 0;
    do
    {
      if (*(void *)v39 != v35) {
        objc_enumerationMutation(v13);
      }
      v18 = *(void **)(*((void *)&v38 + 1) + 8 * v17);
      v14 += [v18 decodedLength];
      if (v15)
      {
        [v16 addObject:v18];
        self->_sourceLength += [v18 encodedLength];
        v15 += [v18 decodedLength];
        unint64_t v19 = self->_streamOutputOutstandingLength + [v18 decodedLength];
      }
      else
      {
        if (v14 <= v5)
        {
          self->_sourceOffset += [v18 encodedLength];
          unint64_t v15 = 0;
          self->_streamOutputOffset += [v18 decodedLength];
          goto LABEL_19;
        }
        if (v16)
        {
          [NSString stringWithUTF8String:"-[TSUBufferedReadChannel _resetStreamReadChannelIfNeededForOffset:length:]"];
          v34 = v16;
          int64_t v20 = v5;
          v22 = unint64_t v21 = a4;
          v23 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUBufferedReadChannel.m"];
          +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v22, v23, 138, 0, "expected nil value for '%{public}s'", "blockInfos");

          a4 = v21;
          int64_t v5 = v20;
          v16 = v34;
          +[OITSUAssertionHandler logBacktraceThrottled];
        }
        v24 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:v12];

        [v24 addObject:v18];
        self->_sourceLength = [v18 encodedLength];
        unint64_t v15 = [v18 decodedLength];
        unint64_t v19 = [v18 decodedLength];
        v16 = v24;
        id v13 = v33;
      }
      self->_unint64_t streamOutputOutstandingLength = v19;
      if (v15 > a4) {
        goto LABEL_28;
      }
LABEL_19:
      if (!--v12)
      {
        self->_sourceLength = -1;
        self->_unint64_t streamOutputOutstandingLength = -1;
      }
      ++v17;
    }
    while (v36 != v17);
    uint64_t v25 = [(NSArray *)v13 countByEnumeratingWithState:&v38 objects:v42 count:16];
    uint64_t v36 = v25;
  }
  while (v25);
LABEL_28:

LABEL_29:
  currentStreamOutputData = self->_currentStreamOutputData;
  self->_currentStreamOutputData = 0;

  self->_isStreamOutputDone = 0;
  id streamReadChannelSourceHandler = self->_streamReadChannelSourceHandler;
  self->_id streamReadChannelSourceHandler = 0;

  streamReadChannelBlock = (void (**)(id, TSUBufferedReadChannelHelper *, void *))self->_streamReadChannelBlock;
  v29 = [[TSUBufferedReadChannelHelper alloc] initWithBufferedReadChannel:self];
  streamReadChannelBlock[2](streamReadChannelBlock, v29, v16);
  v30 = (TSUStreamReadChannel *)objc_claimAutoreleasedReturnValue();
  streamReadChannel = self->_streamReadChannel;
  self->_streamReadChannel = v30;

  v32 = self->_streamReadChannel;
  v37[0] = MEMORY[0x263EF8330];
  v37[1] = 3221225472;
  v37[2] = __74__TSUBufferedReadChannel__resetStreamReadChannelIfNeededForOffset_length___block_invoke;
  v37[3] = &unk_264D61968;
  v37[4] = self;
  [(TSUStreamReadChannel *)v32 readWithHandler:v37];
}

void __74__TSUBufferedReadChannel__resetStreamReadChannelIfNeededForOffset_length___block_invoke(uint64_t a1, char a2, void *a3, void *a4)
{
  data = a3;
  id v7 = a4;
  v8 = v7;
  uint64_t v9 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v9 + 88))
  {
    if (v7)
    {
      v10 = [NSString stringWithUTF8String:"-[TSUBufferedReadChannel _resetStreamReadChannelIfNeededForOffset:length:]_block_invoke"];
      NSUInteger v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUBufferedReadChannel.m"];
      uint64_t v12 = [v8 code];
      id v13 = [v8 domain];
      +[OITSUAssertionHandler handleFailureInFunction:v10, v11, 185, 0, "Error reading from filter TSUStreamReadChannel: %zd %{public}@ %@", v12, v13, v8 file lineNumber isFatal description];

      +[OITSUAssertionHandler logBacktraceThrottled];
      a2 = 1;
    }
    else if (data)
    {
      *(void *)(v9 + 112) += dispatch_data_get_size(data);
      uint64_t v14 = *(void *)(a1 + 32);
      unint64_t v15 = *(NSObject **)(v14 + 120);
      if (v15)
      {
        dispatch_data_t concat = dispatch_data_create_concat(v15, data);
        uint64_t v17 = *(void *)(a1 + 32);
        v18 = *(void **)(v17 + 120);
        *(void *)(v17 + 120) = concat;
      }
      else
      {
        unint64_t v19 = data;
        v18 = *(void **)(v14 + 120);
        *(void *)(v14 + 120) = v19;
      }
    }
    *(unsigned char *)(*(void *)(a1 + 32) + 88) = a2;
  }
}

- (void)setStreamReadChannelSourceHandler:(id)a3
{
  v4 = _Block_copy(a3);
  id streamReadChannelSourceHandler = self->_streamReadChannelSourceHandler;
  self->_id streamReadChannelSourceHandler = v4;
}

- (void)readFromOffset:(int64_t)a3 length:(unint64_t)a4 handler:(id)a5
{
  id v8 = a5;
  readQueue = self->_readQueue;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __56__TSUBufferedReadChannel_readFromOffset_length_handler___block_invoke;
  v11[3] = &unk_264D61990;
  int64_t v13 = a3;
  unint64_t v14 = a4;
  v11[4] = self;
  id v12 = v8;
  id v10 = v8;
  dispatch_async(readQueue, v11);
}

uint64_t __56__TSUBufferedReadChannel_readFromOffset_length_handler___block_invoke(void *a1)
{
  uint64_t v2 = a1[4];
  if (*(void *)(v2 + 48))
  {
    objc_super v3 = *(uint64_t (**)(void))(a1[5] + 16);
    return v3();
  }
  else
  {
    dispatch_suspend(*(dispatch_object_t *)(v2 + 8));
    uint64_t v5 = a1[6];
    uint64_t v6 = a1[7];
    id v7 = (void *)a1[4];
    uint64_t v8 = a1[5];
    return [v7 _readFromOffset:v5 length:v6 handler:v8];
  }
}

- (void)readWithHandler:(id)a3
{
}

- (void)_readFromOffset:(int64_t)a3 length:(unint64_t)a4 handler:(id)a5
{
  uint64_t v8 = (void (**)(id, BOOL, void *, void))a5;
  unint64_t v9 = (a3 & (a3 >> 63)) + a4;
  int64_t v10 = a3 & ~(a3 >> 63);
  [(TSUBufferedReadChannel *)self _resetStreamReadChannelIfNeededForOffset:v10 length:v9];
  char v28 = 0;
  NSUInteger v11 = [(TSUBufferedReadChannel *)self _currentDataIntersectionWithOffset:v10 length:v9 isReadDone:&v28];
  id v12 = v11;
  if (v11)
  {
    size_t size = dispatch_data_get_size(v11);
    v10 += size;
    v9 -= size;
    BOOL v14 = v28 != 0;
  }
  else
  {
    if (!v28) {
      goto LABEL_7;
    }
    BOOL v14 = 1;
  }
  v8[2](v8, v14, v12, 0);
  if (v28)
  {
    dispatch_resume((dispatch_object_t)self->_readQueue);
    goto LABEL_13;
  }
LABEL_7:
  [(TSUBufferedReadChannel *)self _resetStreamReadChannelIfNeededForOffset:v10 length:v9];
  currentStreamOutputData = self->_currentStreamOutputData;
  self->_currentStreamOutputData = 0;

  unint64_t streamOutputOutstandingLength = self->_streamOutputOutstandingLength;
  unint64_t streamOutputLength = self->_streamOutputLength;
  self->_streamOutputOffset += streamOutputLength;
  if (streamOutputOutstandingLength != -1) {
    self->_unint64_t streamOutputOutstandingLength = streamOutputOutstandingLength - streamOutputLength;
  }
  self->_unint64_t streamOutputLength = 0;
  sourceReadChannel = self->_sourceReadChannel;
  int64_t sourceOffset = self->_sourceOffset;
  if (self->_sourceLength >= self->_sourceReadBufferSize) {
    unint64_t sourceReadBufferSize = self->_sourceReadBufferSize;
  }
  else {
    unint64_t sourceReadBufferSize = self->_sourceLength;
  }
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x2020000000;
  v27[3] = 0;
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __57__TSUBufferedReadChannel__readFromOffset_length_handler___block_invoke;
  v21[3] = &unk_264D619B8;
  v21[4] = self;
  v22 = v8;
  v23 = v27;
  unint64_t v24 = sourceReadBufferSize;
  int64_t v25 = v10;
  unint64_t v26 = v9;
  [(TSUReadChannel *)sourceReadChannel readFromOffset:sourceOffset length:sourceReadBufferSize handler:v21];

  _Block_object_dispose(v27, 8);
LABEL_13:
}

void __57__TSUBufferedReadChannel__readFromOffset_length_handler___block_invoke(void *a1, int a2, void *a3, void *a4)
{
  data = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  uint64_t v9 = a1[4];
  if (*(void *)(v9 + 48)) {
    goto LABEL_22;
  }
  if (!*(void *)(v9 + 80))
  {
    BOOL v14 = [NSString stringWithUTF8String:"-[TSUBufferedReadChannel _readFromOffset:length:handler:]_block_invoke"];
    unint64_t v15 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUBufferedReadChannel.m"];
    +[OITSUAssertionHandler handleFailureInFunction:v14 file:v15 lineNumber:264 isFatal:0 description:"The source handler for the stream read channel should not be nil"];

    +[OITSUAssertionHandler logBacktraceThrottled];
    if (!v8)
    {
      uint64_t v8 = objc_msgSend(MEMORY[0x263F087E8], "tsu_fileReadUnknownErrorWithUserInfo:", 0);
      if (!v8) {
        goto LABEL_4;
      }
    }
LABEL_12:
    v16 = [NSString stringWithUTF8String:"-[TSUBufferedReadChannel _readFromOffset:length:handler:]_block_invoke"];
    uint64_t v17 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUBufferedReadChannel.m"];
    uint64_t v18 = [v8 code];
    unint64_t v19 = [v8 domain];
    +[OITSUAssertionHandler handleFailureInFunction:v16, v17, 272, 0, "Error reading from source TSUReadChannel: %zd %{public}@ %@", v18, v19, v8 file lineNumber isFatal description];

    +[OITSUAssertionHandler logBacktraceThrottled];
    (*(void (**)(void))(a1[5] + 16))();
    objc_storeStrong((id *)(a1[4] + 48), v8);
    dispatch_resume(*(dispatch_object_t *)(a1[4] + 8));
    goto LABEL_22;
  }
  if (v7) {
    goto LABEL_12;
  }
LABEL_4:
  size_t size = (size_t)data;
  if (data) {
    size_t size = dispatch_data_get_size(data);
  }
  *(void *)(*(void *)(a1[6] + 8) + 24) += size;
  if (*(void *)(*(void *)(a1[6] + 8) + 24) > a1[7])
  {
    NSUInteger v11 = [NSString stringWithUTF8String:"-[TSUBufferedReadChannel _readFromOffset:length:handler:]_block_invoke"];
    id v12 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUBufferedReadChannel.m"];
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v11, v12, 281, 0, "Received more data than requested: %zu instead of %zu", *(void *)(*(void *)(a1[6] + 8) + 24), a1[7]);

    +[OITSUAssertionHandler logBacktraceThrottled];
  }
  if (a2) {
    BOOL v13 = *(void *)(*(void *)(a1[6] + 8) + 24) < a1[7];
  }
  else {
    BOOL v13 = 0;
  }
  if (data || v13) {
    (*(void (**)(void))(*(void *)(a1[4] + 80) + 16))();
  }
  if (a2)
  {
    *(void *)(a1[4] + 32) += *(void *)(*(void *)(a1[6] + 8) + 24);
    int64_t v20 = (void *)a1[4];
    uint64_t v21 = v20[5];
    if (v21 != -1)
    {
      v20[5] = v21 - *(void *)(*(void *)(a1[6] + 8) + 24);
      int64_t v20 = (void *)a1[4];
    }
    [v20 _readFromOffset:a1[8] length:a1[9] handler:a1[5]];
  }
  uint64_t v8 = 0;
LABEL_22:
}

- (id)_currentDataIntersectionWithOffset:(int64_t)a3 length:(unint64_t)a4 isReadDone:(BOOL *)a5
{
  if (__CFADD__(a3, a4)) {
    unint64_t v8 = -1;
  }
  else {
    unint64_t v8 = a3 + a4;
  }
  int64_t streamOutputOffset = self->_streamOutputOffset;
  unint64_t streamOutputLength = self->_streamOutputLength;
  if (streamOutputLength >= ~streamOutputOffset)
  {
    NSUInteger v11 = [NSString stringWithUTF8String:"-[TSUBufferedReadChannel _currentDataIntersectionWithOffset:length:isReadDone:]"];
    id v12 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUBufferedReadChannel.m"];
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v11, v12, 312, 0, "Overflow in the output stream: data offset %lli data length %zu", self->_streamOutputOffset, self->_streamOutputLength);

    +[OITSUAssertionHandler logBacktraceThrottled];
    int64_t streamOutputOffset = self->_streamOutputOffset;
    unint64_t streamOutputLength = self->_streamOutputLength;
  }
  if (streamOutputOffset <= a3) {
    unint64_t v13 = a3;
  }
  else {
    unint64_t v13 = streamOutputOffset;
  }
  unint64_t v14 = streamOutputLength + streamOutputOffset;
  if (v8 >= streamOutputLength + streamOutputOffset) {
    unint64_t v15 = streamOutputLength + streamOutputOffset;
  }
  else {
    unint64_t v15 = v8;
  }
  if (v15 <= v13)
  {
    dispatch_data_t subrange = 0;
    if (!a5) {
      goto LABEL_23;
    }
LABEL_16:
    BOOL v18 = self->_isStreamOutputDone || v8 <= v14;
    *a5 = v18;
    goto LABEL_23;
  }
  dispatch_data_t subrange = dispatch_data_create_subrange((dispatch_data_t)self->_currentStreamOutputData, v13 - streamOutputOffset, v15 - v13);
  if (a5) {
    goto LABEL_16;
  }
LABEL_23:
  return subrange;
}

- (void)setLowWater:(unint64_t)a3
{
}

- (void)addBarrier:(id)a3
{
}

- (BOOL)isValid
{
  return [(TSUReadChannel *)self->_sourceReadChannel isValid];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentStreamOutputData, 0);
  objc_storeStrong(&self->_streamReadChannelSourceHandler, 0);
  objc_storeStrong((id *)&self->_streamReadChannel, 0);
  objc_storeStrong(&self->_streamReadChannelBlock, 0);
  objc_storeStrong((id *)&self->_blockInfos, 0);
  objc_storeStrong((id *)&self->_sourceReadChannelError, 0);
  objc_storeStrong((id *)&self->_sourceReadChannel, 0);
  objc_storeStrong((id *)&self->_readQueue, 0);
}

@end