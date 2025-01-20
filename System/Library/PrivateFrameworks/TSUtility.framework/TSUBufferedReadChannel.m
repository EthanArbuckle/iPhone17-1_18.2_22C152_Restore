@interface TSUBufferedReadChannel
- (TSUBufferedReadChannel)initWithReadChannel:(id)a3 sourceReadBufferSize:(unint64_t)a4 streamReadChannelBlock:(id)a5;
- (TSUBufferedReadChannel)initWithReadChannel:(id)a3 streamReadChannelBlock:(id)a4;
- (id)_currentDataIntersectionWithOffset:(int64_t)a3 length:(unint64_t)a4 isReadDone:(BOOL *)a5;
- (void)_closeStreamReadChannel;
- (void)_readFromOffset:(int64_t)a3 length:(unint64_t)a4 queue:(id)a5 handler:(id)a6;
- (void)_resetStreamReadChannel;
- (void)addBarrier:(id)a3;
- (void)close;
- (void)dealloc;
- (void)readFromOffset:(int64_t)a3 length:(unint64_t)a4 queue:(id)a5 handler:(id)a6;
- (void)setLowWater:(unint64_t)a3;
- (void)setStreamReadChannelSourceQueue:(id)a3 handler:(id)a4;
@end

@implementation TSUBufferedReadChannel

- (TSUBufferedReadChannel)initWithReadChannel:(id)a3 streamReadChannelBlock:(id)a4
{
  return [(TSUBufferedReadChannel *)self initWithReadChannel:a3 sourceReadBufferSize:0x200000 streamReadChannelBlock:a4];
}

- (TSUBufferedReadChannel)initWithReadChannel:(id)a3 sourceReadBufferSize:(unint64_t)a4 streamReadChannelBlock:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v28.receiver = self;
  v28.super_class = (Class)TSUBufferedReadChannel;
  v11 = [(TSUBufferedReadChannel *)&v28 init];
  if (v11)
  {
    if (v9)
    {
      if (v10) {
        goto LABEL_4;
      }
    }
    else
    {
      v18 = +[TSUAssertionHandler currentHandler];
      v19 = [NSString stringWithUTF8String:"-[TSUBufferedReadChannel initWithReadChannel:sourceReadBufferSize:streamReadChannelBlock:]"];
      v20 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUBufferedReadChannel.m"];
      objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, v20, 60, @"invalid nil value for '%s'", "sourceReadChannel");

      if (v10)
      {
LABEL_4:
        if (a4)
        {
LABEL_5:
          if (v9 && v10)
          {
            dispatch_semaphore_t v12 = dispatch_semaphore_create(1);
            readSemaphore = v11->_readSemaphore;
            v11->_readSemaphore = (OS_dispatch_semaphore *)v12;

            objc_storeStrong((id *)&v11->_sourceReadChannel, a3);
            v11->_sourceReadBufferSize = a4;
            dispatch_queue_t v14 = dispatch_queue_create("com.apple.iwork.TSUBufferedReadChannel.SourceRead", 0);
            sourceReadQueue = v11->_sourceReadQueue;
            v11->_sourceReadQueue = (OS_dispatch_queue *)v14;

            v16 = _Block_copy(v10);
            id streamReadChannelBlock = v11->_streamReadChannelBlock;
            v11->_id streamReadChannelBlock = v16;

            [(TSUBufferedReadChannel *)v11 _resetStreamReadChannel];
            goto LABEL_12;
          }
LABEL_11:

          v11 = 0;
          goto LABEL_12;
        }
LABEL_10:
        v24 = +[TSUAssertionHandler currentHandler];
        v25 = [NSString stringWithUTF8String:"-[TSUBufferedReadChannel initWithReadChannel:sourceReadBufferSize:streamReadChannelBlock:]"];
        v26 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUBufferedReadChannel.m"];
        objc_msgSend(v24, "handleFailureInFunction:file:lineNumber:description:", v25, v26, 62, @"Buffer size too small: %zu", 0);

        goto LABEL_11;
      }
    }
    v21 = +[TSUAssertionHandler currentHandler];
    v22 = [NSString stringWithUTF8String:"-[TSUBufferedReadChannel initWithReadChannel:sourceReadBufferSize:streamReadChannelBlock:]"];
    v23 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUBufferedReadChannel.m"];
    objc_msgSend(v21, "handleFailureInFunction:file:lineNumber:description:", v22, v23, 61, @"invalid nil value for '%s'", "streamReadChannelBlock");

    if (a4) {
      goto LABEL_5;
    }
    goto LABEL_10;
  }
LABEL_12:

  return v11;
}

- (void)dealloc
{
  [(TSUBufferedReadChannel *)self close];
  v3.receiver = self;
  v3.super_class = (Class)TSUBufferedReadChannel;
  [(TSUBufferedReadChannel *)&v3 dealloc];
}

- (void)close
{
  [(TSUBufferedReadChannel *)self _closeStreamReadChannel];
  [(TSUReadChannel *)self->_sourceReadChannel close];
  sourceReadChannel = self->_sourceReadChannel;
  self->_sourceReadChannel = 0;

  streamReadChannelSourceQueue = self->_streamReadChannelSourceQueue;
  self->_streamReadChannelSourceQueue = 0;

  id streamReadChannelSourceHandler = self->_streamReadChannelSourceHandler;
  self->_id streamReadChannelSourceHandler = 0;
}

- (void)_closeStreamReadChannel
{
  [(TSUStreamReadChannel *)self->_streamReadChannel close];
  streamReadChannel = self->_streamReadChannel;
  self->_streamReadChannel = 0;
}

- (void)_resetStreamReadChannel
{
  [(TSUBufferedReadChannel *)self _closeStreamReadChannel];
  self->_sourceOffset = 0;
  self->_streamOutputOffset = 0;
  self->_streamOutputLength = 0;
  currentStreamOutputData = self->_currentStreamOutputData;
  self->_currentStreamOutputData = 0;

  self->_isStreamOutputDone = 0;
  v4 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.iwork.TSUBufferedReadChannel.StreamOutput", 0);
  streamReadChannelOutputQueue = self->_streamReadChannelOutputQueue;
  self->_streamReadChannelOutputQueue = v4;

  streamReadChannelSourceQueue = self->_streamReadChannelSourceQueue;
  self->_streamReadChannelSourceQueue = 0;

  id streamReadChannelSourceHandler = self->_streamReadChannelSourceHandler;
  self->_id streamReadChannelSourceHandler = 0;

  id streamReadChannelBlock = (void (**)(id, TSUBufferedReadChannelHelper *))self->_streamReadChannelBlock;
  id v9 = [[TSUBufferedReadChannelHelper alloc] initWithBufferedReadChannel:self];
  streamReadChannelBlock[2](streamReadChannelBlock, v9);
  id v10 = (TSUStreamReadChannel *)objc_claimAutoreleasedReturnValue();
  streamReadChannel = self->_streamReadChannel;
  self->_streamReadChannel = v10;

  dispatch_semaphore_t v12 = self->_streamReadChannel;
  v13 = self->_streamReadChannelOutputQueue;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __49__TSUBufferedReadChannel__resetStreamReadChannel__block_invoke;
  v14[3] = &unk_26462AB80;
  v14[4] = self;
  [(TSUStreamReadChannel *)v12 readWithQueue:v13 handler:v14];
}

void __49__TSUBufferedReadChannel__resetStreamReadChannel__block_invoke(uint64_t a1, char a2, void *a3, void *a4)
{
  data = a3;
  id v7 = a4;
  v8 = v7;
  uint64_t v9 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v9 + 96))
  {
    if (v7)
    {
      id v10 = +[TSUAssertionHandler currentHandler];
      v11 = [NSString stringWithUTF8String:"-[TSUBufferedReadChannel _resetStreamReadChannel]_block_invoke"];
      dispatch_semaphore_t v12 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUBufferedReadChannel.m"];
      [v10 handleFailureInFunction:v11, v12, 129, @"Error reading from filter TSUStreamReadChannel: %@", v8 file lineNumber description];

      a2 = 1;
    }
    else
    {
      if (!data) {
        goto LABEL_5;
      }
      *(void *)(v9 + 112) += dispatch_data_get_size(data);
      uint64_t v13 = *(void *)(a1 + 32);
      dispatch_queue_t v14 = *(NSObject **)(v13 + 120);
      if (v14)
      {
        dispatch_data_t concat = dispatch_data_create_concat(v14, data);
        uint64_t v16 = *(void *)(a1 + 32);
        id v10 = *(void **)(v16 + 120);
        *(void *)(v16 + 120) = concat;
      }
      else
      {
        v17 = data;
        id v10 = *(void **)(v13 + 120);
        *(void *)(v13 + 120) = v17;
      }
    }

LABEL_5:
    *(unsigned char *)(*(void *)(a1 + 32) + 96) = a2;
  }
}

- (void)setStreamReadChannelSourceQueue:(id)a3 handler:(id)a4
{
  objc_storeStrong((id *)&self->_streamReadChannelSourceQueue, a3);
  id v10 = a3;
  id v7 = a4;
  v8 = _Block_copy(v7);

  id streamReadChannelSourceHandler = self->_streamReadChannelSourceHandler;
  self->_id streamReadChannelSourceHandler = v8;
}

- (void)readFromOffset:(int64_t)a3 length:(unint64_t)a4 queue:(id)a5 handler:(id)a6
{
  id v10 = a6;
  v11 = v10;
  if (self->_sourceReadChannelError)
  {
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __62__TSUBufferedReadChannel_readFromOffset_length_queue_handler___block_invoke;
    v15[3] = &unk_26462A6E0;
    v15[4] = self;
    id v16 = v10;
    dispatch_semaphore_t v12 = a5;
    dispatch_async(v12, v15);

    id v13 = v16;
  }
  else
  {
    readSemaphore = self->_readSemaphore;
    id v13 = a5;
    dispatch_semaphore_wait(readSemaphore, 0xFFFFFFFFFFFFFFFFLL);
    [(TSUBufferedReadChannel *)self _readFromOffset:a3 length:a4 queue:v13 handler:v11];
  }
}

uint64_t __62__TSUBufferedReadChannel_readFromOffset_length_queue_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, uint64_t, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 1, 0, *(void *)(*(void *)(a1 + 32) + 48));
}

- (void)_readFromOffset:(int64_t)a3 length:(unint64_t)a4 queue:(id)a5 handler:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  unint64_t v12 = (a3 & (a3 >> 63)) + a4;
  int64_t v13 = a3 & ~(a3 >> 63);
  if (v13 < self->_streamOutputOffset) {
    [(TSUBufferedReadChannel *)self _resetStreamReadChannel];
  }
  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x2020000000;
  v36[0] = 0;
  dispatch_queue_t v14 = [(TSUBufferedReadChannel *)self _currentDataIntersectionWithOffset:v13 length:v12 isReadDone:v36];
  v15 = v14;
  if (v14)
  {
    size_t size = dispatch_data_get_size(v14);
    v13 += size;
    v12 -= size;
  }
  else if (!*((unsigned char *)v34 + 24))
  {
LABEL_8:
    currentStreamOutputData = self->_currentStreamOutputData;
    self->_currentStreamOutputData = 0;

    self->_streamOutputOffset += self->_streamOutputLength;
    self->_streamOutputLength = 0;
    v28[0] = 0;
    v28[1] = v28;
    v28[2] = 0x2020000000;
    v28[3] = 0;
    sourceReadChannel = self->_sourceReadChannel;
    unint64_t sourceReadBufferSize = self->_sourceReadBufferSize;
    sourceReadQueue = self->_sourceReadQueue;
    int64_t sourceOffset = self->_sourceOffset;
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __63__TSUBufferedReadChannel__readFromOffset_length_queue_handler___block_invoke_2;
    v22[3] = &unk_26462ADD0;
    v22[4] = self;
    v23 = v10;
    id v24 = v11;
    v25 = v28;
    int64_t v26 = v13;
    unint64_t v27 = v12;
    [(TSUReadChannel *)sourceReadChannel readFromOffset:sourceOffset length:sourceReadBufferSize queue:sourceReadQueue handler:v22];

    _Block_object_dispose(v28, 8);
    goto LABEL_9;
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __63__TSUBufferedReadChannel__readFromOffset_length_queue_handler___block_invoke;
  block[3] = &unk_26462AD58;
  id v31 = v11;
  v32 = &v33;
  v30 = v15;
  dispatch_async(v10, block);

  if (!*((unsigned char *)v34 + 24)) {
    goto LABEL_8;
  }
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_readSemaphore);
LABEL_9:

  _Block_object_dispose(&v33, 8);
}

uint64_t __63__TSUBufferedReadChannel__readFromOffset_length_queue_handler___block_invoke(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[5] + 16))(a1[5], *(unsigned __int8 *)(*(void *)(a1[6] + 8) + 24), a1[4], 0);
}

void __63__TSUBufferedReadChannel__readFromOffset_length_queue_handler___block_invoke_2(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = v8;
  if (*(void *)(*(void *)(a1 + 32) + 48)) {
    goto LABEL_18;
  }
  if (v8)
  {
    id v10 = +[TSUAssertionHandler currentHandler];
    id v11 = [NSString stringWithUTF8String:"-[TSUBufferedReadChannel _readFromOffset:length:queue:handler:]_block_invoke_2"];
    unint64_t v12 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUBufferedReadChannel.m"];
    [v10 handleFailureInFunction:v11, v12, 211, @"Error reading from source TSUReadChannel: %@", v9 file lineNumber description];

    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __63__TSUBufferedReadChannel__readFromOffset_length_queue_handler___block_invoke_3;
    block[3] = &unk_26462A6E0;
    int64_t v13 = *(NSObject **)(a1 + 40);
    id v33 = *(id *)(a1 + 48);
    id v32 = v9;
    dispatch_async(v13, block);
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 48), a4);
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 8));

    dispatch_queue_t v14 = v33;
LABEL_17:

    goto LABEL_18;
  }
  if (v7) {
    size_t size = dispatch_data_get_size(v7);
  }
  else {
    size_t size = 0;
  }
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) += size;
  if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) > *(void *)(*(void *)(a1 + 32) + 24))
  {
    id v16 = +[TSUAssertionHandler currentHandler];
    v17 = [NSString stringWithUTF8String:"-[TSUBufferedReadChannel _readFromOffset:length:queue:handler:]_block_invoke_2"];
    v18 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUBufferedReadChannel.m"];
    objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, v18, 221, @"Received more data than requested: %zu instead of %zu", *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24), *(void *)(*(void *)(a1 + 32) + 24));
  }
  if (a2)
  {
    BOOL v19 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) < *(void *)(*(void *)(a1 + 32) + 24);
    if (v7) {
      goto LABEL_14;
    }
LABEL_13:
    if (!v19) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  BOOL v19 = 0;
  if (!v7) {
    goto LABEL_13;
  }
LABEL_14:
  uint64_t v20 = *(void *)(a1 + 32);
  v21 = *(NSObject **)(v20 + 72);
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __63__TSUBufferedReadChannel__readFromOffset_length_queue_handler___block_invoke_4;
  v28[3] = &unk_26462AD80;
  void v28[4] = v20;
  BOOL v30 = v19;
  v29 = v7;
  dispatch_async(v21, v28);

LABEL_15:
  if (a2)
  {
    *(void *)(*(void *)(a1 + 32) + 40) += *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
    uint64_t v22 = *(void *)(a1 + 32);
    v23 = *(NSObject **)(v22 + 72);
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __63__TSUBufferedReadChannel__readFromOffset_length_queue_handler___block_invoke_5;
    v24[3] = &unk_26462ADA8;
    v24[4] = v22;
    long long v27 = *(_OWORD *)(a1 + 64);
    id v25 = *(id *)(a1 + 40);
    id v26 = *(id *)(a1 + 48);
    dispatch_async(v23, v24);

    dispatch_queue_t v14 = v25;
    goto LABEL_17;
  }
LABEL_18:
}

uint64_t __63__TSUBufferedReadChannel__readFromOffset_length_queue_handler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, uint64_t, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 1, 0, *(void *)(a1 + 32));
}

uint64_t __63__TSUBufferedReadChannel__readFromOffset_length_queue_handler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(*(void *)(a1 + 32) + 80) + 16))(*(void *)(*(void *)(a1 + 32) + 80), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 40), 0);
}

void __63__TSUBufferedReadChannel__readFromOffset_length_queue_handler___block_invoke_5(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  objc_super v3 = *(NSObject **)(v2 + 88);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __63__TSUBufferedReadChannel__readFromOffset_length_queue_handler___block_invoke_6;
  block[3] = &unk_26462ADA8;
  void block[4] = v2;
  long long v7 = *(_OWORD *)(a1 + 56);
  id v5 = *(id *)(a1 + 40);
  id v6 = *(id *)(a1 + 48);
  dispatch_async(v3, block);
}

uint64_t __63__TSUBufferedReadChannel__readFromOffset_length_queue_handler___block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) _readFromOffset:*(void *)(a1 + 56) length:*(void *)(a1 + 64) queue:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
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
    id v11 = +[TSUAssertionHandler currentHandler];
    unint64_t v12 = [NSString stringWithUTF8String:"-[TSUBufferedReadChannel _currentDataIntersectionWithOffset:length:isReadDone:]"];
    int64_t v13 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUBufferedReadChannel.m"];
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, v13, 258, @"Overflow in the output stream: data offset %lli data length %zu", self->_streamOutputOffset, self->_streamOutputLength);

    int64_t streamOutputOffset = self->_streamOutputOffset;
    unint64_t streamOutputLength = self->_streamOutputLength;
  }
  if (streamOutputOffset <= a3) {
    unint64_t v14 = a3;
  }
  else {
    unint64_t v14 = streamOutputOffset;
  }
  unint64_t v15 = streamOutputLength + streamOutputOffset;
  if (v8 >= streamOutputLength + streamOutputOffset) {
    unint64_t v16 = streamOutputLength + streamOutputOffset;
  }
  else {
    unint64_t v16 = v8;
  }
  if (v16 <= v14)
  {
    dispatch_data_t subrange = 0;
    if (!a5) {
      goto LABEL_23;
    }
LABEL_16:
    BOOL v19 = v8 <= v15 || self->_isStreamOutputDone;
    *a5 = v19;
    goto LABEL_23;
  }
  dispatch_data_t subrange = dispatch_data_create_subrange((dispatch_data_t)self->_currentStreamOutputData, v14 - streamOutputOffset, v16 - v14);
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentStreamOutputData, 0);
  objc_storeStrong((id *)&self->_streamReadChannelOutputQueue, 0);
  objc_storeStrong(&self->_streamReadChannelSourceHandler, 0);
  objc_storeStrong((id *)&self->_streamReadChannelSourceQueue, 0);
  objc_storeStrong((id *)&self->_streamReadChannel, 0);
  objc_storeStrong(&self->_streamReadChannelBlock, 0);
  objc_storeStrong((id *)&self->_sourceReadChannelError, 0);
  objc_storeStrong((id *)&self->_sourceReadQueue, 0);
  objc_storeStrong((id *)&self->_sourceReadChannel, 0);
  objc_storeStrong((id *)&self->_readSemaphore, 0);
}

@end