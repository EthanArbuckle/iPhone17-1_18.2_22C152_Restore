@interface SearchUIAsyncSectionLoaderCache
- (void)computeObjectForKey:(id)a3 completionHandler:(id)a4;
@end

@implementation SearchUIAsyncSectionLoaderCache

- (void)computeObjectForKey:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  v6 = [a3 computeBlock];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __73__SearchUIAsyncSectionLoaderCache_computeObjectForKey_completionHandler___block_invoke;
  v9[3] = &unk_1E6E724A0;
  id v10 = v5;
  v7 = (void (*)(void *, void *))v6[2];
  id v8 = v5;
  v7(v6, v9);
}

uint64_t __73__SearchUIAsyncSectionLoaderCache_computeObjectForKey_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end