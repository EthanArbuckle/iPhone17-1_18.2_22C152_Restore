@interface STMSizeCacheEntry
- (NSNumber)itemSize;
- (NSOperationQueue)queue;
- (NSString)itemPath;
- (OS_dispatch_queue)dispatchQueue;
- (STMSizeCacheEntry)initWithContainer:(id)a3;
- (STMSizeCacheEntry)initWithPath:(id)a3;
- (STMSizeCacheEntry)initWithURL:(id)a3;
- (STMSizeCacheEntry)initWithURL:(id)a3 usingFastSizingIfPossible:(BOOL)a4;
- (id)item;
- (id)sizingBlock;
- (unint64_t)status;
- (void)calculateSize;
- (void)setDispatchQueue:(id)a3;
- (void)setItem:(id)a3;
- (void)setItemSize:(id)a3;
- (void)setQueue:(id)a3;
- (void)setSizingBlock:(id)a3;
- (void)setStatus:(unint64_t)a3;
@end

@implementation STMSizeCacheEntry

- (STMSizeCacheEntry)initWithContainer:(id)a3
{
  id v4 = a3;
  v5 = [v4 url];
  v6 = [v5 path];
  v7 = [(STMSizeCacheEntry *)self initWithPath:v6];
  if (v7)
  {
    v8 = STSharedContainerSizingQueue();
    [(STMSizeCacheEntry *)v7 setDispatchQueue:v8];

    [(STMSizeCacheEntry *)v7 setItem:v4];
    [(STMSizeCacheEntry *)v7 setSizingBlock:&__block_literal_global];
  }

  return v7;
}

id __50__STMSizeCacheEntry_Container__initWithContainer___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = 0;
  uint64_t v4 = [a2 diskUsageWithError:&v9];
  id v5 = v9;
  v6 = v5;
  if (v5)
  {
    v7 = 0;
    *a3 = v5;
  }
  else
  {
    v7 = [NSNumber numberWithUnsignedLongLong:v4];
  }

  return v7;
}

- (STMSizeCacheEntry)initWithURL:(id)a3
{
  return [(STMSizeCacheEntry *)self initWithURL:a3 usingFastSizingIfPossible:0];
}

- (STMSizeCacheEntry)initWithURL:(id)a3 usingFastSizingIfPossible:(BOOL)a4
{
  id v6 = a3;
  v7 = [v6 path];
  v8 = [(STMSizeCacheEntry *)self initWithPath:v7];

  if (v8)
  {
    id v9 = STSharedPathSizingOpQueue();
    [(STMSizeCacheEntry *)v8 setQueue:v9];

    [(STMSizeCacheEntry *)v8 setItem:v6];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __64__STMSizeCacheEntry_URL__initWithURL_usingFastSizingIfPossible___block_invoke;
    v11[3] = &unk_264305370;
    id v12 = v6;
    BOOL v13 = a4;
    [(STMSizeCacheEntry *)v8 setSizingBlock:v11];
  }
  return v8;
}

id __64__STMSizeCacheEntry_URL__initWithURL_usingFastSizingIfPossible___block_invoke(uint64_t a1)
{
  uint64_t v6 = 0;
  memset(v5, 0, sizeof(v5));
  v2 = [*(id *)(a1 + 32) path];
  STMSizeOfFileTree(v2, *(unsigned __int8 *)(a1 + 40), (uint64_t)v5);

  v3 = [NSNumber numberWithLongLong:*(void *)&v5[0]];

  return v3;
}

- (STMSizeCacheEntry)initWithPath:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)STMSizeCacheEntry;
  id v5 = [(STMSizeCacheEntry *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x263F08850] defaultManager];
    char v12 = 0;
    if ([v6 fileExistsAtPath:v4 isDirectory:&v12]) {
      BOOL v7 = v12 == 0;
    }
    else {
      BOOL v7 = 1;
    }
    if (!v7)
    {
      uint64_t v8 = STMakeDirPath(v4);

      id v4 = (id)v8;
    }
    objc_storeStrong((id *)&v5->_itemPath, v4);
    uint64_t v9 = objc_opt_new();
    calculateLock = v5->_calculateLock;
    v5->_calculateLock = (NSLock *)v9;
  }
  return v5;
}

- (NSString)itemPath
{
  return self->_itemPath;
}

- (void)calculateSize
{
  if ([(STMSizeCacheEntry *)self status] == 2)
  {
    id v23 = [(STMSizeCacheEntry *)self itemPath];
    STLog(0, @"-[STMSizeCacheEntry calculateSize]: Cache entry %@ will not be updated because it's valid", v3, v4, v5, v6, v7, v8, (uint64_t)v23);
  }
  else
  {
    [(NSLock *)self->_calculateLock lock];
    if ([(STMSizeCacheEntry *)self status] == 2)
    {
      calculateLock = self->_calculateLock;
      [(NSLock *)calculateLock unlock];
    }
    else
    {
      [(STMSizeCacheEntry *)self setStatus:1];
      sizingBlock = (void (**)(id, id, id *))self->_sizingBlock;
      if (sizingBlock)
      {
        id item = self->_item;
        id v24 = 0;
        char v12 = sizingBlock[2](sizingBlock, item, &v24);
        id v19 = v24;
        if (!v12) {
          STLog(2, @"Error sizing cache entry for path %@", v13, v14, v15, v16, v17, v18, (uint64_t)self->_itemPath);
        }
        [(STMSizeCacheEntry *)self setItemSize:v12];
      }
      else
      {
        v20 = [(STMSizeCacheEntry *)self itemSize];

        if (!v20) {
          [(STMSizeCacheEntry *)self setItemSize:&unk_26C92C300];
        }
      }
      v21 = [(STMSizeCacheEntry *)self itemSize];
      if (v21) {
        uint64_t v22 = 2;
      }
      else {
        uint64_t v22 = 5;
      }
      [(STMSizeCacheEntry *)self setStatus:v22];

      [(NSLock *)self->_calculateLock unlock];
    }
  }
}

- (id)item
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setItem:(id)a3
{
}

- (NSNumber)itemSize
{
  return (NSNumber *)objc_getProperty(self, a2, 32, 1);
}

- (void)setItemSize:(id)a3
{
}

- (unint64_t)status
{
  return self->_status;
}

- (void)setStatus:(unint64_t)a3
{
  self->_status = a3;
}

- (id)sizingBlock
{
  return objc_getProperty(self, a2, 48, 1);
}

- (void)setSizingBlock:(id)a3
{
}

- (NSOperationQueue)queue
{
  return (NSOperationQueue *)objc_getProperty(self, a2, 56, 1);
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 64, 1);
}

- (void)setDispatchQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_sizingBlock, 0);
  objc_storeStrong((id *)&self->_itemSize, 0);
  objc_storeStrong(&self->_item, 0);
  objc_storeStrong((id *)&self->_calculateLock, 0);

  objc_storeStrong((id *)&self->_itemPath, 0);
}

@end