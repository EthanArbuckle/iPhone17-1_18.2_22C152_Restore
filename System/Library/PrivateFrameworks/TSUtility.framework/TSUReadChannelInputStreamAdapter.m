@interface TSUReadChannelInputStreamAdapter
- (BOOL)canSeek;
- (TSUReadChannelInputStreamAdapter)initWithReadChannel:(id)a3;
- (TSUReadChannelInputStreamAdapter)initWithStreamReadChannel:(id)a3;
- (id)_initWithReadChannel:(id)a3 streamReadChannel:(id)a4;
- (id)closeLocalStream;
- (int64_t)offset;
- (unint64_t)readToBuffer:(char *)a3 size:(unint64_t)a4;
- (void)close;
- (void)dealloc;
- (void)seekToOffset:(int64_t)a3;
@end

@implementation TSUReadChannelInputStreamAdapter

- (TSUReadChannelInputStreamAdapter)initWithReadChannel:(id)a3
{
  v3 = self;
  if (a3)
  {
    v3 = [(TSUReadChannelInputStreamAdapter *)self _initWithReadChannel:a3 streamReadChannel:0];
    v4 = v3;
  }
  else
  {
    v4 = 0;
  }
  v5 = v4;

  return v5;
}

- (TSUReadChannelInputStreamAdapter)initWithStreamReadChannel:(id)a3
{
  v3 = self;
  if (a3)
  {
    v3 = [(TSUReadChannelInputStreamAdapter *)self _initWithReadChannel:0 streamReadChannel:a3];
    v4 = v3;
  }
  else
  {
    v4 = 0;
  }
  v5 = v4;

  return v5;
}

- (id)_initWithReadChannel:(id)a3 streamReadChannel:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (v7 && v8)
  {
    v10 = +[TSUAssertionHandler currentHandler];
    v11 = [NSString stringWithUTF8String:"-[TSUReadChannelInputStreamAdapter _initWithReadChannel:streamReadChannel:]"];
    v12 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUReadChannelInputStreamAdapter.m"];
    [v10 handleFailureInFunction:v11 file:v12 lineNumber:33 description:@"Can't have both a TSUReadChannel and a TSUStreamReadChannel be provided"];

    v13 = +[TSUAssertionHandler currentHandler];
    v14 = [NSString stringWithUTF8String:"-[TSUReadChannelInputStreamAdapter _initWithReadChannel:streamReadChannel:]"];
    v15 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUReadChannelInputStreamAdapter.m"];
    [v13 handleFailureInFunction:v14 file:v15 lineNumber:35 description:@"Can't have both a TSUReadChannel and a TSUStreamReadChannel be provided"];
  }
  v21.receiver = self;
  v21.super_class = (Class)TSUReadChannelInputStreamAdapter;
  v16 = [(TSUReadChannelInputStreamAdapter *)&v21 init];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_streamReadChannel, a4);
    objc_storeStrong((id *)&v17->_readChannel, a3);
    dispatch_queue_t v18 = dispatch_queue_create("TSUReadChannelInputStreamAdapter.Read", 0);
    readQueue = v17->_readQueue;
    v17->_readQueue = (OS_dispatch_queue *)v18;

    objc_storeStrong((id *)&v17->_leftoverData, MEMORY[0x263EF8388]);
  }

  return v17;
}

- (void)dealloc
{
  [(TSUReadChannelInputStreamAdapter *)self close];
  v3.receiver = self;
  v3.super_class = (Class)TSUReadChannelInputStreamAdapter;
  [(TSUReadChannelInputStreamAdapter *)&v3 dealloc];
}

- (int64_t)offset
{
  return self->_offset;
}

- (unint64_t)readToBuffer:(char *)a3 size:(unint64_t)a4
{
  uint64_t v41 = 0;
  v42 = &v41;
  uint64_t v43 = 0x2020000000;
  unint64_t v44 = a4;
  v40[0] = 0;
  v40[1] = v40;
  v40[2] = 0x2020000000;
  v40[3] = a3;
  leftoverData = self->_leftoverData;
  size_t size = dispatch_data_get_size(leftoverData);
  unint64_t v8 = a4;
  if (size)
  {
    applier[0] = MEMORY[0x263EF8330];
    applier[1] = 3221225472;
    applier[2] = __54__TSUReadChannelInputStreamAdapter_readToBuffer_size___block_invoke;
    applier[3] = &unk_26462ACE0;
    applier[5] = &v41;
    applier[6] = v40;
    applier[4] = self;
    dispatch_data_apply(leftoverData, applier);
    if (v42[3])
    {
      subrange = (OS_dispatch_data *)MEMORY[0x263EF8388];
      id v10 = MEMORY[0x263EF8388];
    }
    else
    {
      v11 = self->_leftoverData;
      size_t v12 = dispatch_data_get_size(v11);
      subrange = (OS_dispatch_data *)dispatch_data_create_subrange(v11, a4, v12 - a4);
    }
    v13 = self->_leftoverData;
    self->_leftoverData = subrange;

    unint64_t v8 = v42[3];
  }
  if (v8 && self->_readChannel)
  {
    uint64_t v33 = 0;
    v34 = &v33;
    uint64_t v35 = 0x3032000000;
    v36 = __Block_byref_object_copy__5;
    v37 = __Block_byref_object_dispose__5;
    id v38 = 0;
    dispatch_semaphore_t v14 = dispatch_semaphore_create(0);
    uint64_t v24 = MEMORY[0x263EF8330];
    uint64_t v25 = 3221225472;
    v26 = __54__TSUReadChannelInputStreamAdapter_readToBuffer_size___block_invoke_7;
    v27 = &unk_26462AD30;
    v30 = &v41;
    v31 = v40;
    v28 = self;
    v32 = &v33;
    v15 = v14;
    v29 = v15;
    v16 = _Block_copy(&v24);
    readChannel = self->_readChannel;
    if (readChannel)
    {
      -[TSUReadChannel readFromOffset:length:queue:handler:](readChannel, "readFromOffset:length:queue:handler:", self->_offset, v42[3], self->_readQueue, v16, v24, v25, v26, v27, v28);
    }
    else
    {
      streamReadChannel = self->_streamReadChannel;
      if (streamReadChannel)
      {
        -[TSUStreamReadChannel readWithQueue:handler:](streamReadChannel, "readWithQueue:handler:", self->_readQueue, v16, v24, v25, v26, v27, v28);
      }
      else
      {
        v19 = +[TSUAssertionHandler currentHandler];
        v20 = [NSString stringWithUTF8String:"-[TSUReadChannelInputStreamAdapter readToBuffer:size:]"];
        objc_super v21 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUReadChannelInputStreamAdapter.m"];
        [v19 handleFailureInFunction:v20 file:v21 lineNumber:141 description:@"nil read channels"];

        dispatch_semaphore_signal(v15);
      }
    }
    dispatch_semaphore_wait(v15, 0xFFFFFFFFFFFFFFFFLL);
    if (v34[5]) {
      objc_msgSend(MEMORY[0x263EFF940], "tsu_raiseWithError:");
    }

    _Block_object_dispose(&v33, 8);
    unint64_t v8 = v42[3];
  }
  unint64_t v22 = a4 - v8;
  _Block_object_dispose(v40, 8);
  _Block_object_dispose(&v41, 8);
  return v22;
}

BOOL __54__TSUReadChannelInputStreamAdapter_readToBuffer_size___block_invoke(void *a1, int a2, int a3, void *__src, size_t a5)
{
  if (*(void *)(*(void *)(a1[5] + 8) + 24) >= a5) {
    size_t v6 = a5;
  }
  else {
    size_t v6 = *(void *)(*(void *)(a1[5] + 8) + 24);
  }
  memcpy(*(void **)(*(void *)(a1[6] + 8) + 24), __src, v6);
  *(void *)(*(void *)(a1[5] + 8) + 24) -= v6;
  *(void *)(*(void *)(a1[6] + 8) + 24) += v6;
  *(void *)(a1[4] + 40) += v6;
  return *(void *)(*(void *)(a1[5] + 8) + 24) != 0;
}

void __54__TSUReadChannelInputStreamAdapter_readToBuffer_size___block_invoke_7(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (!v7 || v8)
  {
    if (v8)
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), a4);
LABEL_11:
      dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
      goto LABEL_12;
    }
  }
  else
  {
    uint64_t v20 = 0;
    objc_super v21 = &v20;
    uint64_t v22 = 0x2020000000;
    uint64_t v23 = 0;
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __54__TSUReadChannelInputStreamAdapter_readToBuffer_size___block_invoke_2;
    v17[3] = &unk_26462AD08;
    long long v18 = *(_OWORD *)(a1 + 48);
    v17[4] = *(void *)(a1 + 32);
    v19 = &v20;
    dispatch_data_apply(v7, v17);
    if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
    {
      size_t size = dispatch_data_get_size(v7);
      size_t v11 = v21[3];
      if (size > v11)
      {
        size_t v12 = *(NSObject **)(*(void *)(a1 + 32) + 24);
        subrange = dispatch_data_create_subrange(v7, v11, size - v11);
        dispatch_data_t concat = dispatch_data_create_concat(v12, subrange);
        uint64_t v15 = *(void *)(a1 + 32);
        v16 = *(void **)(v15 + 24);
        *(void *)(v15 + 24) = concat;
      }
    }
    _Block_object_dispose(&v20, 8);
  }
  if (v9 || a2) {
    goto LABEL_11;
  }
LABEL_12:
}

BOOL __54__TSUReadChannelInputStreamAdapter_readToBuffer_size___block_invoke_2(void *a1, int a2, uint64_t a3, void *__src, size_t a5)
{
  if (*(void *)(*(void *)(a1[5] + 8) + 24) >= a5) {
    size_t v7 = a5;
  }
  else {
    size_t v7 = *(void *)(*(void *)(a1[5] + 8) + 24);
  }
  memcpy(*(void **)(*(void *)(a1[6] + 8) + 24), __src, v7);
  *(void *)(*(void *)(a1[5] + 8) + 24) -= v7;
  *(void *)(*(void *)(a1[6] + 8) + 24) += v7;
  *(void *)(a1[4] + 40) += v7;
  *(void *)(*(void *)(a1[7] + 8) + 24) = v7 + a3;
  return *(void *)(*(void *)(a1[5] + 8) + 24) != 0;
}

- (void)close
{
  [(TSUReadChannel *)self->_readChannel close];
  readChannel = self->_readChannel;
  self->_readChannel = 0;

  [(TSUStreamReadChannel *)self->_streamReadChannel close];
  streamReadChannel = self->_streamReadChannel;
  self->_streamReadChannel = 0;
}

- (BOOL)canSeek
{
  return self->_readChannel != 0;
}

- (void)seekToOffset:(int64_t)a3
{
  if (self->_readChannel)
  {
    self->_offset = a3;
    v4 = (OS_dispatch_data *)MEMORY[0x263EF8388];
    id v5 = MEMORY[0x263EF8388];
    leftoverData = self->_leftoverData;
    self->_leftoverData = v4;
  }
  else
  {
    id v9 = +[TSUAssertionHandler currentHandler];
    size_t v7 = [NSString stringWithUTF8String:"-[TSUReadChannelInputStreamAdapter seekToOffset:]"];
    id v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUReadChannelInputStreamAdapter.m"];
    [v9 handleFailureInFunction:v7 file:v8 lineNumber:183 description:@"Not a seekable stream"];

    leftoverData = (OS_dispatch_data *)v9;
  }
}

- (id)closeLocalStream
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_readQueue, 0);
  objc_storeStrong((id *)&self->_leftoverData, 0);
  objc_storeStrong((id *)&self->_streamReadChannel, 0);
  objc_storeStrong((id *)&self->_readChannel, 0);
}

@end