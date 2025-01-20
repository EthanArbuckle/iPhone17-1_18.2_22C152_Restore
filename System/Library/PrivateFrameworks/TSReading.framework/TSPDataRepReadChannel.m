@interface TSPDataRepReadChannel
- (TSPDataRepReadChannel)initWithRepresentation:(id)a3;
- (void)close;
- (void)dealloc;
- (void)readWithQueue:(id)a3 handler:(id)a4;
@end

@implementation TSPDataRepReadChannel

- (TSPDataRepReadChannel)initWithRepresentation:(id)a3
{
  id v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)TSPDataRepReadChannel;
  v6 = [(TSPDataRepReadChannel *)&v20 init];
  v7 = v6;
  if (!v6)
  {
LABEL_7:
    v15 = 0;
    goto LABEL_8;
  }
  p_representation = (id *)&v6->_representation;
  objc_storeStrong((id *)&v6->_representation, a3);
  uint64_t v9 = [(SFUDataRepresentation *)v7->_representation inputStream];
  inputStream = v7->_inputStream;
  v7->_inputStream = (SFUInputStream *)v9;

  if (([(SFUInputStream *)v7->_inputStream canSeek] & 1) == 0)
  {
    [(SFUInputStream *)v7->_inputStream close];
    uint64_t v11 = [*p_representation bufferedInputStream];
    v12 = v7->_inputStream;
    v7->_inputStream = (SFUInputStream *)v11;

    if (!v7->_inputStream)
    {
      if ([*p_representation encodedLength])
      {
        v16 = [MEMORY[0x263F7C7F0] currentHandler];
        v17 = [NSString stringWithUTF8String:"-[TSPDataRepReadChannel initWithRepresentation:]"];
        v18 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPDataRepReadChannel.mm"];
        [v16 handleFailureInFunction:v17 file:v18 lineNumber:35 description:@"Could not create the buffered input stream."];
      }
      goto LABEL_7;
    }
  }
  dispatch_queue_t v13 = dispatch_queue_create("TSPDataRepReadChannel.Read", 0);
  readQueue = v7->_readQueue;
  v7->_readQueue = (OS_dispatch_queue *)v13;

  v15 = v7;
LABEL_8:

  return v15;
}

- (void)dealloc
{
  [(SFUInputStream *)self->_inputStream close];
  v3.receiver = self;
  v3.super_class = (Class)TSPDataRepReadChannel;
  [(TSPDataRepReadChannel *)&v3 dealloc];
}

- (void)readWithQueue:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!self->_representation)
  {
    v8 = [MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v9 = [NSString stringWithUTF8String:"-[TSPDataRepReadChannel readWithQueue:handler:]"];
    v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPDataRepReadChannel.mm"];
    [v8 handleFailureInFunction:v9 file:v10 lineNumber:52 description:@"Stream is closed"];
  }
  readQueue = self->_readQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__TSPDataRepReadChannel_readWithQueue_handler___block_invoke;
  block[3] = &unk_2646B0290;
  block[4] = self;
  id v15 = v6;
  id v16 = v7;
  id v12 = v7;
  id v13 = v6;
  dispatch_async(readQueue, block);
}

void __47__TSPDataRepReadChannel_readWithQueue_handler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 8) dataLength];
  if (v2 < 1)
  {
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __47__TSPDataRepReadChannel_readWithQueue_handler___block_invoke_4;
    v17[3] = &unk_2646AFC00;
    id v13 = &v18;
    v14 = *(NSObject **)(a1 + 40);
    id v18 = *(id *)(a1 + 48);
    dispatch_async(v14, v17);
  }
  else
  {
    uint64_t v3 = v2;
    uint64_t v4 = 0;
    id v5 = (void *)*MEMORY[0x263EF8378];
    while (1)
    {
      size_t v6 = v3 - v4 >= 0x20000 ? 0x20000 : v3 - v4;
      id v7 = malloc_type_malloc(v6, 0x33CA86A1uLL);
      size_t v8 = [*(id *)(*(void *)(a1 + 32) + 16) readToBuffer:v7 size:v6];
      if (!v8) {
        break;
      }
      v4 += v8;
      dispatch_data_t v9 = dispatch_data_create(v7, v8, 0, v5);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __47__TSPDataRepReadChannel_readWithQueue_handler___block_invoke_2;
      block[3] = &unk_2646B0268;
      v10 = *(NSObject **)(a1 + 40);
      id v11 = *(id *)(a1 + 48);
      BOOL v25 = v4 == v3;
      dispatch_data_t v23 = v9;
      id v24 = v11;
      id v12 = v9;
      dispatch_async(v10, block);

      if (v4 >= v3) {
        return;
      }
    }
    free(v7);
    TSULogErrorInFunction();
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __47__TSPDataRepReadChannel_readWithQueue_handler___block_invoke_3;
    v19[3] = &unk_2646AFA50;
    id v13 = &v21;
    id v15 = *(NSObject **)(a1 + 40);
    id v16 = *(id *)(a1 + 48);
    id v20 = 0;
    id v21 = v16;
    dispatch_async(v15, v19);
  }
}

uint64_t __47__TSPDataRepReadChannel_readWithQueue_handler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32), 0);
}

uint64_t __47__TSPDataRepReadChannel_readWithQueue_handler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, uint64_t, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 1, 0, *(void *)(a1 + 32));
}

uint64_t __47__TSPDataRepReadChannel_readWithQueue_handler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)close
{
  readQueue = self->_readQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __30__TSPDataRepReadChannel_close__block_invoke;
  block[3] = &unk_2646AFA00;
  void block[4] = self;
  dispatch_async(readQueue, block);
}

void __30__TSPDataRepReadChannel_close__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 8);
  *(void *)(v2 + 8) = 0;

  [*(id *)(*(void *)(a1 + 32) + 16) close];
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 16);
  *(void *)(v4 + 16) = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_readQueue, 0);
  objc_storeStrong((id *)&self->_inputStream, 0);

  objc_storeStrong((id *)&self->_representation, 0);
}

@end