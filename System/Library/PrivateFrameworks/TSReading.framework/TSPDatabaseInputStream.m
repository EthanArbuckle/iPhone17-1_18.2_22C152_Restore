@interface TSPDatabaseInputStream
- (BOOL)canSeek;
- (TSPDatabaseInputStream)initWithBlob:(sqlite3_blob *)a3;
- (id)closeLocalStream;
- (int64_t)offset;
- (unint64_t)readToBuffer:(char *)a3 size:(unint64_t)a4;
- (void)close;
- (void)dealloc;
- (void)readWithQueue:(id)a3 handler:(id)a4;
- (void)seekToOffset:(int64_t)a3;
@end

@implementation TSPDatabaseInputStream

- (TSPDatabaseInputStream)initWithBlob:(sqlite3_blob *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)TSPDatabaseInputStream;
  v4 = [(TSPDatabaseInputStream *)&v7 init];
  v5 = v4;
  if (v4)
  {
    v4->_blob = a3;
    v4->_length = sqlite3_blob_bytes(a3);
  }
  return v5;
}

- (void)dealloc
{
  [(TSPDatabaseInputStream *)self close];
  v3.receiver = self;
  v3.super_class = (Class)TSPDatabaseInputStream;
  [(TSPDatabaseInputStream *)&v3 dealloc];
}

- (void)close
{
  blob = self->_blob;
  if (blob)
  {
    sqlite3_blob_close(blob);
    self->_blob = 0;
  }
}

- (void)readWithQueue:(id)a3 handler:(id)a4
{
  v6 = a3;
  id v7 = a4;
  unint64_t length = self->_length;
  if (length)
  {
    int v9 = 0;
    v10 = (void *)*MEMORY[0x263EF8378];
    while (1)
    {
      uint64_t v11 = length >= 0x2000 ? 0x2000 : length;
      v12 = malloc_type_malloc(v11, 0xE5D21517uLL);
      if (!v12) {
        break;
      }
      v13 = v12;
      if (sqlite3_blob_read(self->_blob, v12, v11, v9))
      {
        free(v13);
        break;
      }
      v9 += v11;
      length -= v11;
      dispatch_data_t v14 = dispatch_data_create(v13, v11, v6, v10);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __48__TSPDatabaseInputStream_readWithQueue_handler___block_invoke_2;
      block[3] = &unk_2646B02E0;
      id v21 = v7;
      unint64_t v22 = length;
      dispatch_data_t v20 = v14;
      v15 = v14;
      dispatch_sync(v6, block);

      if (!length) {
        goto LABEL_14;
      }
    }
    v16 = v18;
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v17 = __48__TSPDatabaseInputStream_readWithQueue_handler___block_invoke_3;
  }
  else
  {
    v16 = v23;
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v17 = __48__TSPDatabaseInputStream_readWithQueue_handler___block_invoke;
  }
  v16[2] = v17;
  v16[3] = &unk_2646B02B8;
  v16[4] = v7;
  dispatch_async(v6, v16);

LABEL_14:
}

uint64_t __48__TSPDatabaseInputStream_readWithQueue_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __48__TSPDatabaseInputStream_readWithQueue_handler___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, BOOL, void, void))(a1[5] + 16))(a1[5], a1[6] == 0, a1[4], 0);
}

void __48__TSPDatabaseInputStream_readWithQueue_handler___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  objc_msgSend(MEMORY[0x263F087E8], "tsp_errorWithCode:", 1);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, void, id))(v1 + 16))(v1, 1, MEMORY[0x263EF8388], v2);
}

- (int64_t)offset
{
  return self->_offset;
}

- (unint64_t)readToBuffer:(char *)a3 size:(unint64_t)a4
{
  if (a4 >> 31)
  {
    v8 = [MEMORY[0x263F7C7F0] currentHandler];
    int v9 = [NSString stringWithUTF8String:"-[TSPDatabaseInputStream readToBuffer:size:]"];
    v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPDatabaseInputStream.m"];
    [v8 handleFailureInFunction:v9 file:v10 lineNumber:97 description:@"Out-of-bounds type assignment was clamped to max"];

    LODWORD(a4) = 0x7FFFFFFF;
  }
  if ((int)a4 >= self->_length - self->_offset) {
    int v6 = self->_length - self->_offset;
  }
  else {
    int v6 = a4;
  }
  if (sqlite3_blob_read(self->_blob, a3, v6, self->_offset)) {
    return 0;
  }
  self->_offset += v6;
  return v6;
}

- (BOOL)canSeek
{
  return 1;
}

- (void)seekToOffset:(int64_t)a3
{
  if (a3 > 0x7FFFFFFF || self->_length < a3)
  {
    v5 = [MEMORY[0x263F7C7F0] currentHandler];
    int v6 = [NSString stringWithUTF8String:"-[TSPDatabaseInputStream seekToOffset:]"];
    id v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPDatabaseInputStream.m"];
    [v5 handleFailureInFunction:v6 file:v7 lineNumber:124 description:@"Requested seek to offset past end of stream"];

    LODWORD(a3) = self->_length;
  }
  self->_offset = a3;
}

- (id)closeLocalStream
{
  return 0;
}

@end