@interface SUUILayoutCache
- (SUUILayoutCache)init;
- (SUUILayoutCacheDelegate)delegate;
- (_NSRange)addLayoutRequests:(id)a3;
- (_NSRange)populateCacheWithLayoutRequests:(id)a3;
- (id)layoutForIndex:(int64_t)a3;
- (id)layoutForIndex:(int64_t)a3 forced:(BOOL)a4;
- (void)_addLayoutBatch:(id)a3;
- (void)_layoutRequestsInRange:(_NSRange)a3;
- (void)_populateCache;
- (void)commitLayoutRequests;
- (void)setDelegate:(id)a3;
@end

@implementation SUUILayoutCache

- (SUUILayoutCache)init
{
  v11.receiver = self;
  v11.super_class = (Class)SUUILayoutCache;
  v2 = [(SUUILayoutCache *)&v11 init];
  if (v2)
  {
    id v3 = objc_msgSend([NSString alloc], "initWithFormat:", @"com.apple.iTunesStoreUI.SUUILayoutCache.%p", v2);
    dispatch_queue_t v4 = dispatch_queue_create((const char *)[v3 UTF8String], 0);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v4;

    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    layouts = v2->_layouts;
    v2->_layouts = v6;

    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    requests = v2->_requests;
    v2->_requests = v8;
  }
  return v2;
}

- (_NSRange)addLayoutRequests:(id)a3
{
  id v4 = a3;
  if (!self->_batchedRequests)
  {
    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    batchedRequests = self->_batchedRequests;
    self->_batchedRequests = v5;
  }
  uint64_t v7 = [(NSMutableArray *)self->_requests count];
  NSUInteger v8 = [(NSMutableArray *)self->_batchedRequests count] + v7;
  uint64_t v9 = [v4 count];
  [(NSMutableArray *)self->_batchedRequests addObjectsFromArray:v4];

  NSUInteger v10 = v8;
  NSUInteger v11 = v9;
  result.length = v11;
  result.location = v10;
  return result;
}

- (void)commitLayoutRequests
{
  batchedRequests = self->_batchedRequests;
  if (batchedRequests)
  {
    id v5 = (id)[(NSMutableArray *)batchedRequests copy];
    id v4 = self->_batchedRequests;
    self->_batchedRequests = 0;

    [(SUUILayoutCache *)self populateCacheWithLayoutRequests:v5];
  }
}

- (id)layoutForIndex:(int64_t)a3
{
  return [(SUUILayoutCache *)self layoutForIndex:a3 forced:0];
}

- (id)layoutForIndex:(int64_t)a3 forced:(BOOL)a4
{
  BOOL v4 = a4;
  if ([(NSMutableArray *)self->_layouts count] <= (unint64_t)a3)
  {
    if (v4
      && (unint64_t v8 = a3 - [(NSMutableArray *)self->_layouts count],
          v8 < [(NSMutableArray *)self->_batchedRequests count]))
    {
      uint64_t v9 = [(NSMutableArray *)self->_batchedRequests objectAtIndex:v8];
      uint64_t v7 = objc_msgSend(objc_alloc((Class)objc_msgSend(v9, "layoutClass")), "initWithLayoutRequest:", v9);
    }
    else
    {
      uint64_t v7 = 0;
    }
  }
  else
  {
    uint64_t v7 = [(NSMutableArray *)self->_layouts objectAtIndex:a3];
  }
  return v7;
}

- (_NSRange)populateCacheWithLayoutRequests:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NSMutableArray *)self->_requests count];
  uint64_t v6 = [v4 count];
  if (self->_batchedRequests)
  {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF498] format:@"-populateCacheWithLayoutRequests: before -commitLayoutRequests"];
  }
  else
  {
    uint64_t v7 = [(NSMutableArray *)self->_layouts count];
    uint64_t v8 = [(NSMutableArray *)self->_requests count];
    [(NSMutableArray *)self->_requests addObjectsFromArray:v4];
    if (v7 == v8)
    {
      [(SUUILayoutCache *)self _populateCache];
    }
    else
    {
      dispatchQueue = self->_dispatchQueue;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __51__SUUILayoutCache_populateCacheWithLayoutRequests___block_invoke;
      block[3] = &unk_265400868;
      block[4] = self;
      block[5] = v5;
      block[6] = v6;
      dispatch_async(dispatchQueue, block);
    }
  }

  NSUInteger v10 = v5;
  NSUInteger v11 = v6;
  result.length = v11;
  result.location = v10;
  return result;
}

uint64_t __51__SUUILayoutCache_populateCacheWithLayoutRequests___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_layoutRequestsInRange:", *(void *)(a1 + 40), *(void *)(a1 + 48));
}

- (void)_addLayoutBatch:(id)a3
{
  [(NSMutableArray *)self->_layouts addObjectsFromArray:a3];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)&self->_delegate);
    [v6 layoutCacheDidFinishBatch:self];
  }
}

- (void)_layoutRequestsInRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
  if (location < location + length)
  {
    do
    {
      uint64_t v7 = [(NSMutableArray *)self->_requests objectAtIndex:location];
      uint64_t v8 = objc_msgSend(objc_alloc((Class)objc_msgSend(v7, "layoutClass")), "initWithLayoutRequest:", v7);
      [v6 addObject:v8];
      if ([v6 count] == 250)
      {
        id v9 = v6;
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __42__SUUILayoutCache__layoutRequestsInRange___block_invoke;
        block[3] = &unk_265400890;
        block[4] = self;
        id v13 = v9;
        dispatch_async(MEMORY[0x263EF83A0], block);
        id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
      }
      ++location;
      --length;
    }
    while (length);
  }
  if ([v6 count])
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __42__SUUILayoutCache__layoutRequestsInRange___block_invoke_2;
    v10[3] = &unk_265400890;
    v10[4] = self;
    id v11 = v6;
    dispatch_async(MEMORY[0x263EF83A0], v10);
  }
}

uint64_t __42__SUUILayoutCache__layoutRequestsInRange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _addLayoutBatch:*(void *)(a1 + 40)];
}

uint64_t __42__SUUILayoutCache__layoutRequestsInRange___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _addLayoutBatch:*(void *)(a1 + 40)];
}

- (void)_populateCache
{
  uint64_t v3 = [(NSMutableArray *)self->_layouts count];
  uint64_t v4 = [(NSMutableArray *)self->_requests count];
  uint64_t v5 = v4 - v3;
  if (v4 - v3 >= 1)
  {
    uint64_t v6 = v4;
    if (v5 >= 250) {
      uint64_t v5 = 250;
    }
    uint64_t v7 = v5 + v3;
    do
    {
      uint64_t v8 = [(NSMutableArray *)self->_requests objectAtIndex:v3];
      id v9 = objc_msgSend(objc_alloc((Class)objc_msgSend(v8, "layoutClass")), "initWithLayoutRequest:", v8);
      [(NSMutableArray *)self->_layouts addObject:v9];

      ++v3;
    }
    while (v3 < v7);
    uint64_t v10 = [(NSMutableArray *)self->_layouts count];
    if (v10 < v6)
    {
      dispatchQueue = self->_dispatchQueue;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __33__SUUILayoutCache__populateCache__block_invoke;
      block[3] = &unk_265400868;
      block[4] = self;
      void block[5] = v10;
      block[6] = v6;
      dispatch_async(dispatchQueue, block);
    }
  }
}

uint64_t __33__SUUILayoutCache__populateCache__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_layoutRequestsInRange:", *(void *)(a1 + 40), *(void *)(a1 + 48) - *(void *)(a1 + 40));
}

- (SUUILayoutCacheDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SUUILayoutCacheDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requests, 0);
  objc_storeStrong((id *)&self->_layouts, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_batchedRequests, 0);
}

@end