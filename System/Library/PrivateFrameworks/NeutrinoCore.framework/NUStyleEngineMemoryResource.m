@interface NUStyleEngineMemoryResource
@end

@implementation NUStyleEngineMemoryResource

BOOL __90___NUStyleEngineMemoryResource_usingSharedMemoryResourceForDevice_withDescriptor_perform___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 device];
  if (v4 == *(void **)(a1 + 32))
  {
    v6 = [v3 descriptor];
    unint64_t v7 = [v6 memSize];
    BOOL v5 = v7 >= [*(id *)(a1 + 40) memSize];
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

@end