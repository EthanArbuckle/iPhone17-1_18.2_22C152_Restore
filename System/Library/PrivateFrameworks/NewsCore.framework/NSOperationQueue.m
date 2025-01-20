@interface NSOperationQueue
@end

@implementation NSOperationQueue

uint64_t __57__NSOperationQueue_FCAdditions__fc_sharedConcurrentQueue__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28F08]);
  v1 = (void *)_MergedGlobals_227;
  _MergedGlobals_227 = (uint64_t)v0;

  [(id)_MergedGlobals_227 setQualityOfService:17];
  v2 = (void *)_MergedGlobals_227;
  return [v2 setName:@"com.apple.newscore.concurrentQ"];
}

uint64_t __53__NSOperationQueue_FCAdditions__fc_sharedSerialQueue__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28F08]);
  v1 = (void *)qword_1EB5D1BF0;
  qword_1EB5D1BF0 = (uint64_t)v0;

  [(id)qword_1EB5D1BF0 setQualityOfService:9];
  [(id)qword_1EB5D1BF0 setMaxConcurrentOperationCount:1];
  v2 = (void *)qword_1EB5D1BF0;
  return [v2 setName:@"com.apple.newscore.serialQ"];
}

uint64_t __48__NSOperationQueue_FCAdditions__fc_prewarmQueue__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28F08]);
  v1 = (void *)qword_1EB5D1C00;
  qword_1EB5D1C00 = (uint64_t)v0;

  [(id)qword_1EB5D1C00 setMaxConcurrentOperationCount:1];
  v2 = (void *)qword_1EB5D1C00;
  return [v2 setName:@"com.apple.newscore.prewarmQ"];
}

uint64_t __68__NSOperationQueue_FCAdditions__fc_throttledCKRequestOperationQueue__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28F08]);
  v1 = (void *)qword_1EB5D1C10;
  qword_1EB5D1C10 = (uint64_t)v0;

  [(id)qword_1EB5D1C10 setMaxConcurrentOperationCount:4];
  v2 = (void *)qword_1EB5D1C10;
  return [v2 setName:@"com.apple.news.throttledCKRequestQueue"];
}

void __68__NSOperationQueue_FCAdditions__fc_addMainThreadOperationWithBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __68__NSOperationQueue_FCAdditions__fc_addMainThreadOperationWithBlock___block_invoke_2;
  v5[3] = &unk_1E5B4E128;
  id v6 = *(id *)(a1 + 32);
  id v7 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

uint64_t __68__NSOperationQueue_FCAdditions__fc_addMainThreadOperationWithBlock___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

@end