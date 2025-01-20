@interface TSUReadChannelInputStreamAdapter
- (BOOL)canSeek;
- (TSUReadChannelInputStreamAdapter)initWithReadChannel:(id)a3;
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
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TSUReadChannelInputStreamAdapter;
  v6 = [(TSUReadChannelInputStreamAdapter *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_readChannel, a3);
    objc_storeStrong((id *)&v7->_leftoverData, MEMORY[0x263EF8388]);
  }

  return v7;
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
  uint64_t v38 = 0;
  v39 = &v38;
  uint64_t v40 = 0x2020000000;
  unint64_t v41 = a4;
  v37[0] = 0;
  v37[1] = v37;
  v37[2] = 0x2020000000;
  v37[3] = a3;
  leftoverData = self->_leftoverData;
  size_t size = dispatch_data_get_size(leftoverData);
  unint64_t v8 = a4;
  if (size)
  {
    applier[0] = MEMORY[0x263EF8330];
    applier[1] = 3221225472;
    applier[2] = __54__TSUReadChannelInputStreamAdapter_readToBuffer_size___block_invoke;
    applier[3] = &unk_264D61E78;
    applier[5] = &v38;
    applier[6] = v37;
    applier[4] = self;
    dispatch_data_apply(leftoverData, applier);
    if (v39[3])
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

    unint64_t v8 = v39[3];
  }
  if (v8 && self->_readChannel)
  {
    uint64_t v30 = 0;
    v31 = &v30;
    uint64_t v32 = 0x3032000000;
    v33 = __Block_byref_object_copy__17;
    v34 = __Block_byref_object_dispose__17;
    id v35 = 0;
    v28[0] = 0;
    v28[1] = v28;
    v28[2] = 0x2020000000;
    char v29 = 0;
    dispatch_semaphore_t v14 = dispatch_semaphore_create(0);
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __54__TSUReadChannelInputStreamAdapter_readToBuffer_size___block_invoke_3;
    aBlock[3] = &unk_264D61EC8;
    v24 = &v38;
    v25 = v37;
    aBlock[4] = self;
    v26 = &v30;
    v27 = v28;
    v15 = v14;
    v23 = v15;
    v16 = _Block_copy(aBlock);
    readChannel = self->_readChannel;
    if (readChannel)
    {
      [(TSUReadChannel *)readChannel readFromOffset:self->_offset length:v39[3] handler:v16];
    }
    else
    {
      v18 = [NSString stringWithUTF8String:"-[TSUReadChannelInputStreamAdapter readToBuffer:size:]"];
      v19 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUReadChannelInputStreamAdapter.m"];
      +[OITSUAssertionHandler handleFailureInFunction:v18 file:v19 lineNumber:105 isFatal:0 description:"nil read channels"];

      +[OITSUAssertionHandler logBacktraceThrottled];
      dispatch_semaphore_signal(v15);
    }
    dispatch_semaphore_wait(v15, 0xFFFFFFFFFFFFFFFFLL);
    if (v31[5]) {
      objc_msgSend(MEMORY[0x263EFF940], "tsu_raiseWithError:");
    }

    _Block_object_dispose(v28, 8);
    _Block_object_dispose(&v30, 8);

    unint64_t v8 = v39[3];
  }
  unint64_t v20 = a4 - v8;
  _Block_object_dispose(v37, 8);
  _Block_object_dispose(&v38, 8);
  return v20;
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
  *(void *)(a1[4] + 24) += v6;
  return *(void *)(*(void *)(a1[5] + 8) + 24) != 0;
}

void __54__TSUReadChannelInputStreamAdapter_readToBuffer_size___block_invoke_3(uint64_t a1, char a2, void *a3, void *a4)
{
  v7 = a3;
  id v8 = a4;
  objc_super v9 = v8;
  if (!v7 || v8)
  {
    if (v8) {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), a4);
    }
  }
  else
  {
    uint64_t v21 = 0;
    v22 = &v21;
    uint64_t v23 = 0x2020000000;
    uint64_t v24 = 0;
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __54__TSUReadChannelInputStreamAdapter_readToBuffer_size___block_invoke_2;
    v18[3] = &unk_264D61EA0;
    long long v19 = *(_OWORD *)(a1 + 48);
    v18[4] = *(void *)(a1 + 32);
    unint64_t v20 = &v21;
    dispatch_data_apply(v7, v18);
    if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
    {
      size_t size = dispatch_data_get_size(v7);
      size_t v11 = v22[3];
      if (size > v11)
      {
        size_t v12 = *(NSObject **)(*(void *)(a1 + 32) + 16);
        subrange = dispatch_data_create_subrange(v7, v11, size - v11);
        dispatch_data_t concat = dispatch_data_create_concat(v12, subrange);
        uint64_t v15 = *(void *)(a1 + 32);
        v16 = *(void **)(v15 + 16);
        *(void *)(v15 + 16) = concat;
      }
    }
    _Block_object_dispose(&v21, 8);
  }
  char v17 = a2 ^ 1;
  if (v9) {
    char v17 = 0;
  }
  if ((v17 & 1) == 0 && !*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24))
  {
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
    *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
  }
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
  *(void *)(a1[4] + 24) += v7;
  *(void *)(*(void *)(a1[7] + 8) + 24) = v7 + a3;
  return *(void *)(*(void *)(a1[5] + 8) + 24) != 0;
}

- (void)close
{
  [(TSUReadChannel *)self->_readChannel close];
  readChannel = self->_readChannel;
  self->_readChannel = 0;
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
    p_leftoverData = &self->_leftoverData;
    v4 = (void *)MEMORY[0x263EF8388];
    objc_storeStrong((id *)p_leftoverData, v4);
  }
  else
  {
    id v5 = [NSString stringWithUTF8String:"-[TSUReadChannelInputStreamAdapter seekToOffset:]"];
    size_t v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUReadChannelInputStreamAdapter.m"];
    +[OITSUAssertionHandler handleFailureInFunction:v5 file:v6 lineNumber:137 isFatal:0 description:"Not a seekable stream"];

    +[OITSUAssertionHandler logBacktraceThrottled];
  }
}

- (id)closeLocalStream
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_leftoverData, 0);
  objc_storeStrong((id *)&self->_readChannel, 0);
}

@end