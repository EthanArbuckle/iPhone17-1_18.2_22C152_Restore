@interface PASPosixDataCollector
@end

@implementation PASPosixDataCollector

void __36___PASPosixDataCollector_handleData__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(void **)(*(void *)(a1 + 32) + 8);
  id v8 = v3;
  if (!v4)
  {
    uint64_t v5 = objc_opt_new();
    uint64_t v6 = *(void *)(a1 + 32);
    v7 = *(void **)(v6 + 8);
    *(void *)(v6 + 8) = v5;

    id v3 = v8;
    v4 = *(void **)(*(void *)(a1 + 32) + 8);
  }
  [v4 addObject:v3];
  *(void *)(*(void *)(a1 + 32) + 16) += [v8 length];
}

@end