@interface HKCVKernelCache
- (HKCVKernelCache)init;
- (NSMutableDictionary)cache;
- (uint64_t)kernelWithIdentifier:(void *)a3 fromLibrary:(uint64_t)a4 archive:;
- (void)dealloc;
@end

@implementation HKCVKernelCache

- (uint64_t)kernelWithIdentifier:(void *)a3 fromLibrary:(uint64_t)a4 archive:
{
  if (!a1) {
    return 0;
  }
  v8 = (void *)[*(id *)(a1 + 8) objectForKey:a2];
  if (v8)
  {
    uint64_t v9 = (uint64_t)v8;
    id v10 = v8;
  }
  else
  {
    uint64_t v9 = NewComputePipelineState(a3, a4);
    [*(id *)(a1 + 8) setObject:v9 forKey:a2];
  }
  return v9;
}

- (HKCVKernelCache)init
{
  v4.receiver = self;
  v4.super_class = (Class)HKCVKernelCache;
  v2 = [(HKCVKernelCache *)&v4 init];
  if (v2) {
    v2->_cache = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  }
  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)HKCVKernelCache;
  [(HKCVKernelCache *)&v3 dealloc];
}

- (NSMutableDictionary)cache
{
  return self->_cache;
}

@end