@interface TSPTemporaryDataStorage
- (BOOL)isMissingData;
- (TSPTemporaryDataStorage)initWithURL:(id)a3;
- (TSPTemporaryDataStorage)initWithURL:(id)a3 decryptionKey:(id)a4;
- (void)dealloc;
- (void)performIOChannelReadWithAccessor:(id)a3;
- (void)performReadWithAccessor:(id)a3;
- (void)setIsMissingData:(BOOL)a3;
@end

@implementation TSPTemporaryDataStorage

- (TSPTemporaryDataStorage)initWithURL:(id)a3 decryptionKey:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (([v7 isFileURL] & 1) == 0)
  {
    v9 = [MEMORY[0x263F7C7F0] currentHandler];
    v10 = [NSString stringWithUTF8String:"-[TSPTemporaryDataStorage initWithURL:decryptionKey:]"];
    v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPTemporaryDataStorage.mm"];
    [v9 handleFailureInFunction:v10 file:v11 lineNumber:29 description:@"Expected a file URL"];
  }
  v16.receiver = self;
  v16.super_class = (Class)TSPTemporaryDataStorage;
  v12 = [(TSPTemporaryDataStorage *)&v16 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_URL, a3);
    objc_storeStrong((id *)&v13->_decryptionKey, a4);
    v14 = v13;
  }

  return v13;
}

- (TSPTemporaryDataStorage)initWithURL:(id)a3
{
  return [(TSPTemporaryDataStorage *)self initWithURL:a3 decryptionKey:0];
}

- (void)dealloc
{
  if (!self->_isMissingData)
  {
    v3 = [MEMORY[0x263F08850] defaultManager];
    URL = self->_URL;
    id v12 = 0;
    char v5 = [v3 removeItemAtURL:URL error:&v12];
    id v6 = v12;
    if ((v5 & 1) == 0)
    {
      id v7 = [(NSURL *)self->_URL path];
      id v8 = [v7 stringByDeletingLastPathComponent];

      if ([v3 fileExistsAtPath:v8])
      {
        v9 = self->_URL;
        id v10 = v6;
        TSULogErrorInFunction();
      }
    }
  }
  v11.receiver = self;
  v11.super_class = (Class)TSPTemporaryDataStorage;
  [(TSPTemporaryDataStorage *)&v11 dealloc];
}

- (void)performReadWithAccessor:(id)a3
{
  id v4 = a3;
  if (self->_isMissingData) {
    URL = 0;
  }
  else {
    URL = self->_URL;
  }
  id v6 = v4;
  (*((void (**)(id, NSURL *))v4 + 2))(v4, URL);
}

- (void)performIOChannelReadWithAccessor:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __60__TSPTemporaryDataStorage_performIOChannelReadWithAccessor___block_invoke;
  v6[3] = &unk_2646B0240;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(TSPTemporaryDataStorage *)self performReadWithAccessor:v6];
}

void __60__TSPTemporaryDataStorage_performIOChannelReadWithAccessor___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [objc_alloc(MEMORY[0x263F7C830]) initForReadingURL:v3];
  id v5 = (void *)v4;
  if (*(void *)(*(void *)(a1 + 32) + 16)) {
    BOOL v6 = v4 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id v7 = objc_alloc(MEMORY[0x263F7C7F8]);
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __60__TSPTemporaryDataStorage_performIOChannelReadWithAccessor___block_invoke_2;
    v9[3] = &unk_2646B0218;
    v9[4] = *(void *)(a1 + 32);
    id v8 = (void *)[v7 initWithReadChannel:v5 streamReadChannelBlock:v9];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

TSPCryptoReadChannel *__60__TSPTemporaryDataStorage_performIOChannelReadWithAccessor___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [[TSPCryptoReadChannel alloc] initWithReadChannel:v3 decryptionKey:*(void *)(*(void *)(a1 + 32) + 16)];

  return v4;
}

- (BOOL)isMissingData
{
  return self->_isMissingData;
}

- (void)setIsMissingData:(BOOL)a3
{
  self->_isMissingData = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_decryptionKey, 0);

  objc_storeStrong((id *)&self->_URL, 0);
}

@end