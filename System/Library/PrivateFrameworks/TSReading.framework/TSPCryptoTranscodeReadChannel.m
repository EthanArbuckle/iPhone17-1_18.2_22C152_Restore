@interface TSPCryptoTranscodeReadChannel
- (TSPCryptoTranscodeReadChannel)initWithReadChannel:(id)a3 decryptionKey:(id)a4 encryptionKey:(id)a5;
- (void)close;
- (void)readWithQueue:(id)a3 handler:(id)a4;
@end

@implementation TSPCryptoTranscodeReadChannel

- (TSPCryptoTranscodeReadChannel)initWithReadChannel:(id)a3 decryptionKey:(id)a4 encryptionKey:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)TSPCryptoTranscodeReadChannel;
  v11 = [(TSPCryptoTranscodeReadChannel *)&v17 init];
  if (v11)
  {
    dispatch_queue_t v12 = dispatch_queue_create("TSPCryptoTranscodeReadChannel.Read", 0);
    readQueue = v11->_readQueue;
    v11->_readQueue = (OS_dispatch_queue *)v12;

    if (v9) {
      v14 = [[TSPCryptoReadChannel alloc] initWithReadChannel:v8 decryptionKey:v9];
    }
    else {
      v14 = (TSPCryptoReadChannel *)v8;
    }
    readChannel = v11->_readChannel;
    v11->_readChannel = (TSUStreamReadChannel *)v14;

    objc_storeStrong((id *)&v11->_encryptionKey, a5);
    if (!v11->_readChannel)
    {

      v11 = 0;
    }
  }

  return v11;
}

- (void)readWithQueue:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->_encryptionKey)
  {
    id v8 = [[TSPIOHandlerWriteChannelAdapter alloc] initWithQueue:v6 handler:v7];
    id v9 = [[TSPCryptoComponentWriteChannel alloc] initWithWriteChannel:v8 encryptionKey:self->_encryptionKey];
    v23[0] = 0;
    v23[1] = v23;
    v23[2] = 0x2020000000;
    char v24 = 0;
    readChannel = self->_readChannel;
    readQueue = self->_readQueue;
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __55__TSPCryptoTranscodeReadChannel_readWithQueue_handler___block_invoke;
    v19[3] = &unk_2646B01A0;
    v22 = v23;
    dispatch_queue_t v12 = v8;
    v20 = v12;
    v21 = v9;
    v13 = v9;
    [(TSUStreamReadChannel *)readChannel readWithQueue:readQueue handler:v19];

    _Block_object_dispose(v23, 8);
  }
  else
  {
    v14 = self->_readChannel;
    v15 = self->_readQueue;
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __55__TSPCryptoTranscodeReadChannel_readWithQueue_handler___block_invoke_2;
    v16[3] = &unk_2646B0500;
    objc_super v17 = (TSPIOHandlerWriteChannelAdapter *)v6;
    id v18 = v7;
    [(TSUStreamReadChannel *)v14 readWithQueue:v15 handler:v16];

    dispatch_queue_t v12 = v17;
  }
}

void __55__TSPCryptoTranscodeReadChannel_readWithQueue_handler___block_invoke(uint64_t a1, int a2, void *a3, void *a4)
{
  id v9 = a3;
  id v7 = a4;
  int v8 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  if (v7 && !*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    [*(id *)(a1 + 32) setError:v7];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    int v8 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  }
  if (v9 && !v8) {
    [*(id *)(a1 + 40) writeData:v9];
  }
  if (a2) {
    [*(id *)(a1 + 40) close];
  }
}

void __55__TSPCryptoTranscodeReadChannel_readWithQueue_handler___block_invoke_2(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __55__TSPCryptoTranscodeReadChannel_readWithQueue_handler___block_invoke_3;
  v13[3] = &unk_2646B04D8;
  id v9 = *(NSObject **)(a1 + 32);
  id v10 = *(id *)(a1 + 40);
  id v15 = v8;
  id v16 = v10;
  char v17 = a2;
  id v14 = v7;
  id v11 = v8;
  id v12 = v7;
  dispatch_async(v9, v13);
}

uint64_t __55__TSPCryptoTranscodeReadChannel_readWithQueue_handler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), *(unsigned __int8 *)(a1 + 56), *(void *)(a1 + 32), *(void *)(a1 + 40));
}

- (void)close
{
  [(TSUStreamReadChannel *)self->_readChannel close];
  readChannel = self->_readChannel;
  self->_readChannel = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_readQueue, 0);
  objc_storeStrong((id *)&self->_encryptionKey, 0);

  objc_storeStrong((id *)&self->_readChannel, 0);
}

@end