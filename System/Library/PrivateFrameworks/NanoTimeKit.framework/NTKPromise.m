@interface NTKPromise
+ (id)metalPipelinePromiseNamed:(id)a3 withBlock:(id)a4;
+ (id)promiseNamed:(id)a3 withBackgroundPriority:(unsigned int)a4 foregroundPriority:(unsigned int)a5 block:(id)a6;
+ (id)promiseNamed:(id)a3 withBlock:(id)a4;
- (NSString)name;
- (NTKPromise)initWithName:(id)a3 backgroundPriority:(unsigned int)a4 foregroundPriority:(unsigned int)a5 block:(id)a6;
- (NTKPromise)initWithName:(id)a3 block:(id)a4;
- (id)object;
- (void)_beginLoadingBlock:(id)a3;
@end

@implementation NTKPromise

+ (id)promiseNamed:(id)a3 withBackgroundPriority:(unsigned int)a4 foregroundPriority:(unsigned int)a5 block:(id)a6
{
  uint64_t v6 = *(void *)&a5;
  uint64_t v7 = *(void *)&a4;
  id v9 = a6;
  id v10 = a3;
  v11 = [[NTKPromise alloc] initWithName:v10 backgroundPriority:v7 foregroundPriority:v6 block:v9];

  return v11;
}

- (NTKPromise)initWithName:(id)a3 backgroundPriority:(unsigned int)a4 foregroundPriority:(unsigned int)a5 block:(id)a6
{
  id v11 = a3;
  id v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)NTKPromise;
  v13 = [(NTKPromise *)&v16 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_name, a3);
    v14->_bgPriority = a4;
    v14->_fgPriority = a5;
    v14->_lock_promiseState = 0;
    v14->_lock._os_unfair_lock_opaque = 0;
    [(NTKPromise *)v14 _beginLoadingBlock:v12];
  }

  return v14;
}

- (void)_beginLoadingBlock:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_lock_promiseState)
  {
    self->_lock_promiseState = 1;
    objc_initWeak(&location, self);
    dispatch_qos_class_t bgPriority = self->_bgPriority;
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    v14 = __33__NTKPromise__beginLoadingBlock___block_invoke;
    v15 = &unk_1E62C3398;
    objc_copyWeak(&v17, &location);
    id v16 = v4;
    dispatch_block_t v6 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, bgPriority, 0, &block);
    loaderQueue = self->_loaderQueue;
    if (!loaderQueue)
    {
      v8 = dispatch_queue_attr_make_with_qos_class(0, (dispatch_qos_class_t)self->_bgPriority, 0);
      id v9 = [NSString stringWithFormat:@"NTKPromise Queue - %@", self->_name, block, v13, v14, v15];
      id v10 = (OS_dispatch_queue *)dispatch_queue_create((const char *)[v9 cStringUsingEncoding:4], v8);
      id v11 = self->_loaderQueue;
      self->_loaderQueue = v10;

      loaderQueue = self->_loaderQueue;
    }
    dispatch_async(loaderQueue, v6);

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
  os_unfair_lock_unlock(&self->_lock);
}

void __33__NTKPromise__beginLoadingBlock___block_invoke(uint64_t a1)
{
  v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  kdebug_trace();

  uint64_t v7 = objc_loadWeakRetained(v2);
  if (v7)
  {
    uint64_t v4 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    v5 = (void *)v7[3];
    v7[3] = v4;
  }
  id v6 = objc_loadWeakRetained(v2);
  kdebug_trace();
}

+ (id)promiseNamed:(id)a3 withBlock:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = [[NTKPromise alloc] initWithName:v6 block:v5];

  return v7;
}

+ (id)metalPipelinePromiseNamed:(id)a3 withBlock:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = [[NTKPromise alloc] initWithName:v6 backgroundPriority:25 foregroundPriority:33 block:v5];

  return v7;
}

- (NTKPromise)initWithName:(id)a3 block:(id)a4
{
  return [(NTKPromise *)self initWithName:a3 backgroundPriority:25 foregroundPriority:33 block:a4];
}

- (id)object
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_promiseState == 1)
  {
    dispatch_qos_class_t fgPriority = self->_fgPriority;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __20__NTKPromise_object__block_invoke;
    block[3] = &unk_1E62BFF20;
    block[4] = self;
    dispatch_block_t v5 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, fgPriority, 0, block);
    kdebug_trace();
    dispatch_sync((dispatch_queue_t)self->_loaderQueue, v5);
    loaderQueue = self->_loaderQueue;
    self->_loaderQueue = 0;
  }
  id v7 = self->_lock_loadedObject;
  os_unfair_lock_unlock(p_lock);
  return v7;
}

void __20__NTKPromise_object__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 40), *(id *)(*(void *)(a1 + 32) + 24));
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 24);
  *(void *)(v2 + 24) = 0;

  *(void *)(*(void *)(a1 + 32) + 48) = 2;
}

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong(&self->_lock_loadedObject, 0);
  objc_storeStrong(&self->_loaderQueue_loadedObject, 0);
  objc_storeStrong((id *)&self->_loaderQueue, 0);
}

@end