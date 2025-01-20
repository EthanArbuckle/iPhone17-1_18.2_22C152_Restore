@interface OITSUFastReadInvalidatingCache
- (id)initForReentrant:(BOOL)a3 withGenerator:(id)a4;
- (id)value;
- (void)dealloc;
- (void)invalidate;
- (void)p_setValue:(id)a3;
@end

@implementation OITSUFastReadInvalidatingCache

- (id)initForReentrant:(BOOL)a3 withGenerator:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)OITSUFastReadInvalidatingCache;
  v6 = [(OITSUFastReadInvalidatingCache *)&v10 init];
  v7 = v6;
  if (v6)
  {
    if (a4)
    {
      v6->mGenerator = _Block_copy(a4);
      v7->mReentrant = a3;
      if (!a3) {
        v7->mCondition = (NSCondition *)objc_alloc_init(MEMORY[0x263F08740]);
      }
    }
    else
    {
      v8 = v6;
      return 0;
    }
  }
  return v7;
}

- (void)dealloc
{
  id mGenerator = self->mGenerator;
  if (mGenerator) {
    _Block_release(mGenerator);
  }
  v4 = (void *)atomic_load((unint64_t *)&self->mValue);

  v5 = (void *)atomic_load((unint64_t *)&self->mToDispose);
  v6.receiver = self;
  v6.super_class = (Class)OITSUFastReadInvalidatingCache;
  [(OITSUFastReadInvalidatingCache *)&v6 dealloc];
}

- (void)p_setValue:(id)a3
{
  id v5 = a3;
  do
  {
    unint64_t v6 = atomic_load((unint64_t *)&self->mValue);
    v7 = (void *)v6;
    atomic_compare_exchange_strong((atomic_ullong *volatile)&self->mValue, (unint64_t *)&v7, (unint64_t)a3);
  }
  while (v7 != (void *)v6);
  if (v6)
  {
    id v11 = v7;
    id v8 = 0;
    do
    {

      v9 = (void *)atomic_load((unint64_t *)&self->mToDispose);
      if (v9) {
        id v8 = (id)[v9 arrayByAddingObject:v11];
      }
      else {
        id v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x263EFF8C0]), "initWithObjects:", v11, 0);
      }
      objc_super v10 = v9;
      atomic_compare_exchange_strong((atomic_ullong *volatile)&self->mToDispose, (unint64_t *)&v10, (unint64_t)v8);
    }
    while (v10 != v9);
  }
}

- (id)value
{
  p_mReaderCount = &self->mReaderCount;
  atomic_fetch_add(&self->mReaderCount, 1uLL);
  v4 = (void *)atomic_load((unint64_t *)&self->mValue);
  id v5 = v4;
  unint64_t v6 = atomic_load((unint64_t *)&self->mToDispose);
  unint64_t add = atomic_fetch_add(p_mReaderCount, 0xFFFFFFFFFFFFFFFFLL);
  if (v5)
  {
LABEL_2:
    id v8 = v5;
  }
  else
  {
    while (!self->mReentrant)
    {
      [(NSCondition *)self->mCondition lock];
      if (!self->mIsGenerating)
      {
        self->mIsGenerating = 1;
        [(NSCondition *)self->mCondition unlock];
        break;
      }
      [(NSCondition *)self->mCondition wait];
      [(NSCondition *)self->mCondition unlock];
      atomic_fetch_add(&self->mReaderCount, 1uLL);
      v13 = (void *)atomic_load((unint64_t *)&self->mValue);
      id v5 = v13;
      unint64_t v6 = atomic_load((unint64_t *)&self->mToDispose);
      unint64_t add = atomic_fetch_add(&self->mReaderCount, 0xFFFFFFFFFFFFFFFFLL);
      if (v5) {
        goto LABEL_2;
      }
    }
    id v8 = (id)(*((uint64_t (**)(void))self->mGenerator + 2))();
    [(OITSUFastReadInvalidatingCache *)self p_setValue:v8];
    if (!self->mReentrant)
    {
      [(NSCondition *)self->mCondition lock];
      self->mIsGenerating = 0;
      [(NSCondition *)self->mCondition broadcast];
      [(NSCondition *)self->mCondition unlock];
    }
  }
  if (add == 1 && v6 != 0)
  {
    unint64_t v10 = v6;
    atomic_compare_exchange_strong((atomic_ullong *volatile)&self->mToDispose, &v10, 0);
    if (v10 == v6)
    {
      global_queue = dispatch_get_global_queue(0, 0);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __39__OITSUFastReadInvalidatingCache_value__block_invoke;
      block[3] = &unk_264D60B18;
      block[4] = v6;
      dispatch_async(global_queue, block);
    }
  }
  return v8;
}

void __39__OITSUFastReadInvalidatingCache_value__block_invoke(uint64_t a1)
{
}

- (void)invalidate
{
}

@end