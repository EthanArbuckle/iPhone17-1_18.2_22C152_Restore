@interface PXGMetalTextureCache
- (PXGMetalRenderContext)metalRenderContext;
- (PXGMetalTextureCache)init;
- (PXGMetalTextureCache)initWithContext:(id)a3;
- (double)ageLimit;
- (id)_description;
- (id)description;
- (id)textureWithSize:(CGSize)a3 pixelFormat:(unint64_t)a4;
- (unint64_t)capacity;
- (unint64_t)count;
- (unint64_t)peakMemorySize;
- (unint64_t)peakTextureCount;
- (unint64_t)sizeLimit;
- (void)_enforceLimits;
- (void)_purgeOldestTexture;
- (void)recycleTexture:(id)a3;
- (void)setAgeLimit:(double)a3;
- (void)setCapacity:(unint64_t)a3;
- (void)setSizeLimit:(unint64_t)a3;
@end

@implementation PXGMetalTextureCache

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metalRenderContext, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_entries, 0);
}

- (PXGMetalRenderContext)metalRenderContext
{
  return self->_metalRenderContext;
}

- (void)_purgeOldestTexture
{
  v3 = [(NSMutableArray *)self->_entries lastObject];
  id v4 = [v3 texture];

  [v4 width];
  [v4 height];
  [v4 allocatedSize];
  kdebug_trace();
  [(NSMutableArray *)self->_entries removeLastObject];
}

- (void)_enforceLimits
{
  for (i = self->_entries; [(NSMutableArray *)i count] > self->_capacity; i = self->_entries)
    [(PXGMetalTextureCache *)self _purgeOldestTexture];
  uint64_t v4 = [(NSMutableArray *)self->_entries count];
  if (v4)
  {
    uint64_t v5 = v4;
    unint64_t v6 = 0;
    unint64_t v7 = 0;
    while (1)
    {
      v8 = [(NSMutableArray *)self->_entries objectAtIndexedSubscript:v7];
      v9 = [v8 texture];
      uint64_t v10 = [v9 allocatedSize];

      unint64_t v11 = v10 + v6;
      if (v10 + v6 > self->_sizeLimit) {
        break;
      }
      ++v7;
      v6 += v10;
      if (v5 == v7) {
        goto LABEL_13;
      }
    }
    while ([(NSMutableArray *)self->_entries count] > v7)
      [(PXGMetalTextureCache *)self _purgeOldestTexture];
    unint64_t v11 = v6;
  }
  else
  {
    unint64_t v11 = 0;
  }
LABEL_13:
  v12 = [MEMORY[0x263EFF910] now];
  while ([(NSMutableArray *)self->_entries count])
  {
    v13 = [(NSMutableArray *)self->_entries lastObject];
    v14 = [v13 time];
    [v12 timeIntervalSinceDate:v14];
    double v16 = v15;
    double ageLimit = self->_ageLimit;

    if (v16 <= ageLimit) {
      break;
    }
    [(PXGMetalTextureCache *)self _purgeOldestTexture];
  }
  unint64_t v18 = [(NSMutableArray *)self->_entries count];
  unint64_t peakMemory = self->_peakMemory;
  if (v18 > self->_peakCount || v11 > peakMemory)
  {
    if (v11 > peakMemory) {
      unint64_t peakMemory = v11;
    }
    self->_unint64_t peakMemory = peakMemory;
    unint64_t v21 = [(NSMutableArray *)self->_entries count];
    unint64_t peakCount = self->_peakCount;
    if (v21 > peakCount) {
      unint64_t peakCount = v21;
    }
    self->_unint64_t peakCount = peakCount;
  }
  [(NSMutableArray *)self->_entries count];
  kdebug_trace();
  if ([(NSMutableArray *)self->_entries count])
  {
    objc_initWeak(&location, self);
    dispatch_time_t v23 = dispatch_time(0, (uint64_t)(self->_ageLimit * 1000000000.0));
    queue = self->_queue;
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __38__PXGMetalTextureCache__enforceLimits__block_invoke;
    v25[3] = &unk_265556740;
    objc_copyWeak(&v26, &location);
    dispatch_after(v23, queue, v25);
    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
  }
}

void __38__PXGMetalTextureCache__enforceLimits__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _enforceLimits];
}

- (void)recycleTexture:(id)a3
{
  id v4 = a3;
  [v4 width];
  [v4 height];
  [v4 allocatedSize];
  kdebug_trace();
  uint64_t v5 = [[PXGMetalTextureCacheEntry alloc] initWithTexture:v4];
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x2020000000;
  v11[3] = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __39__PXGMetalTextureCache_recycleTexture___block_invoke;
  block[3] = &unk_265556718;
  block[4] = self;
  v9 = v5;
  uint64_t v10 = v11;
  unint64_t v7 = v5;
  dispatch_sync(queue, block);

  _Block_object_dispose(v11, 8);
}

uint64_t __39__PXGMetalTextureCache_recycleTexture___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 8) insertObject:*(void *)(a1 + 40) atIndex:0];
  [*(id *)(a1 + 32) _enforceLimits];
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 8) count];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (id)textureWithSize:(CGSize)a3 pixelFormat:(unint64_t)a4
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__1071;
  dispatch_time_t v23 = __Block_byref_object_dispose__1072;
  id v24 = 0;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x2020000000;
  v18[3] = 0;
  queue = self->_queue;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __52__PXGMetalTextureCache_textureWithSize_pixelFormat___block_invoke;
  v17[3] = &unk_2655566F0;
  v17[8] = (unint64_t)a3.height;
  v17[9] = a4;
  v17[4] = self;
  v17[5] = &v19;
  v17[6] = v18;
  v17[7] = (unint64_t)a3.width;
  dispatch_sync(queue, v17);
  v9 = (void *)v20[5];
  if (v9)
  {
    [(id)v20[5] allocatedSize];
    id v10 = v9;
  }
  else
  {
    unint64_t v11 = [(PXGMetalTextureCache *)self metalRenderContext];
    uint64_t v12 = _createMetal2DTextureWithPixelFormat(a4, v11, 1, width, height);
    v13 = (void *)v20[5];
    v20[5] = v12;

    v14 = (void *)v20[5];
    [v14 allocatedSize];
    id v10 = v14;
  }
  kdebug_trace();

  id v15 = (id)v20[5];
  _Block_object_dispose(v18, 8);
  _Block_object_dispose(&v19, 8);

  return v15;
}

uint64_t __52__PXGMetalTextureCache_textureWithSize_pixelFormat___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 8);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __52__PXGMetalTextureCache_textureWithSize_pixelFormat___block_invoke_2;
  v10[3] = &__block_descriptor_56_e42_B32__0__PXGMetalTextureCacheEntry_8Q16_B24l;
  long long v11 = *(_OWORD *)(a1 + 56);
  uint64_t v12 = *(void *)(a1 + 72);
  uint64_t v3 = [v2 indexOfObjectPassingTest:v10];
  if (v3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v4 = v3;
    uint64_t v5 = [*(id *)(*(void *)(a1 + 32) + 8) objectAtIndexedSubscript:v3];
    uint64_t v6 = [v5 texture];
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    [*(id *)(*(void *)(a1 + 32) + 8) removeObjectAtIndex:v4];
  }
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 8) count];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

BOOL __52__PXGMetalTextureCache_textureWithSize_pixelFormat___block_invoke_2(void *a1, void *a2)
{
  uint64_t v3 = [a2 texture];
  BOOL v4 = [v3 width] == a1[4]
    && [v3 height] == a1[5]
    && [v3 pixelFormat] == a1[6];

  return v4;
}

- (void)setSizeLimit:(unint64_t)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __37__PXGMetalTextureCache_setSizeLimit___block_invoke;
  v4[3] = &unk_2655566A8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(queue, v4);
}

uint64_t __37__PXGMetalTextureCache_setSizeLimit___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 32) = *(void *)(a1 + 40);
  return [*(id *)(a1 + 32) _enforceLimits];
}

- (unint64_t)sizeLimit
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __33__PXGMetalTextureCache_sizeLimit__block_invoke;
  v5[3] = &unk_265556680;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __33__PXGMetalTextureCache_sizeLimit__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 32);
  return result;
}

- (void)setAgeLimit:(double)a3
{
  if (a3 < 0.0)
  {
    uint64_t v7 = [MEMORY[0x263F08690] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"PXGMetalTextureCache.m", 114, @"Invalid parameter not satisfying: %@", @"ageLimit >= 0.0" object file lineNumber description];
  }
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __36__PXGMetalTextureCache_setAgeLimit___block_invoke;
  block[3] = &unk_2655566A8;
  block[4] = self;
  *(double *)&void block[5] = a3;
  dispatch_sync(queue, block);
}

uint64_t __36__PXGMetalTextureCache_setAgeLimit___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 24) = *(void *)(a1 + 40);
  return [*(id *)(a1 + 32) _enforceLimits];
}

- (double)ageLimit
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __32__PXGMetalTextureCache_ageLimit__block_invoke;
  v5[3] = &unk_265556680;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  double v3 = (double)(unint64_t)v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

double __32__PXGMetalTextureCache_ageLimit__block_invoke(uint64_t a1)
{
  double result = *(double *)(*(void *)(a1 + 32) + 24);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = (unint64_t)result;
  return result;
}

- (void)setCapacity:(unint64_t)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __36__PXGMetalTextureCache_setCapacity___block_invoke;
  v4[3] = &unk_2655566A8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(queue, v4);
}

uint64_t __36__PXGMetalTextureCache_setCapacity___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 16) = *(void *)(a1 + 40);
  return [*(id *)(a1 + 32) _enforceLimits];
}

- (unint64_t)capacity
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __32__PXGMetalTextureCache_capacity__block_invoke;
  v5[3] = &unk_265556680;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __32__PXGMetalTextureCache_capacity__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 16);
  return result;
}

- (unint64_t)peakMemorySize
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __38__PXGMetalTextureCache_peakMemorySize__block_invoke;
  v5[3] = &unk_265556680;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __38__PXGMetalTextureCache_peakMemorySize__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 48);
  return result;
}

- (unint64_t)peakTextureCount
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __40__PXGMetalTextureCache_peakTextureCount__block_invoke;
  v5[3] = &unk_265556680;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __40__PXGMetalTextureCache_peakTextureCount__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 40);
  return result;
}

- (unint64_t)count
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __29__PXGMetalTextureCache_count__block_invoke;
  v5[3] = &unk_265556680;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __29__PXGMetalTextureCache_count__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 8) count];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (id)_description
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  unint64_t v3 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_entries, "count"));
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  BOOL v4 = self->_entries;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [*(id *)(*((void *)&v18 + 1) + 8 * i) description];
        [v3 addObject:v9];
      }
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v6);
  }

  id v10 = NSString;
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = [(NSMutableArray *)self->_entries count];
  unint64_t capacity = self->_capacity;
  double ageLimit = self->_ageLimit;
  id v15 = [v3 componentsJoinedByString:@"\n\t"];
  double v16 = [v10 stringWithFormat:@"<%@:%p count: %lu/%lu limit: %0.3f s textures: \n\t%@\npeak: %lu textures, %0.1f MB>", v11, self, v12, capacity, *(void *)&ageLimit, v15, self->_peakCount, (double)self->_peakMemory * 0.0009765625 * 0.0009765625, (void)v18];

  return v16;
}

- (id)description
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__1071;
  id v10 = __Block_byref_object_dispose__1072;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __35__PXGMetalTextureCache_description__block_invoke;
  v5[3] = &unk_265556680;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __35__PXGMetalTextureCache_description__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) _description];

  return MEMORY[0x270F9A758]();
}

- (PXGMetalTextureCache)initWithContext:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PXGMetalTextureCache;
  uint64_t v6 = [(PXGMetalTextureCache *)&v13 init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_metalRenderContext, a3);
    v7->_unint64_t capacity = 15;
    v7->_double ageLimit = 0.05;
    v7->_sizeLimit = 262144000;
    uint64_t v8 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:v7->_capacity];
    entries = v7->_entries;
    v7->_entries = (NSMutableArray *)v8;

    dispatch_queue_t v10 = dispatch_queue_create("PXGMetalTextureCache", 0);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v10;
  }
  return v7;
}

- (PXGMetalTextureCache)init
{
  BOOL v4 = [MEMORY[0x263F08690] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXGMetalTextureCache.m", 32, @"%s is not available as initializer", "-[PXGMetalTextureCache init]");

  abort();
}

@end