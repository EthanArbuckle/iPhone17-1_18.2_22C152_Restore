@interface PXStoryRecipeEnumerator
@end

@implementation PXStoryRecipeEnumerator

id __34___PXStoryRecipeEnumerator__flush__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:v3];
  v5 = [v4 localIdentifier];
  if (!v5)
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v10 = a1 + 40;
    uint64_t v8 = *(void *)(a1 + 40);
    uint64_t v9 = *(void *)(v10 + 8);
    v11 = [v4 error];
    [v7 handleFailureInMethod:v9, v8, @"PFStoryRecipe+PXStory+PhotoKit.m", 280, @"Error mapping cloud identifier (%@) to local identifier: %@", v3, v11 object file lineNumber description];
  }
  return v5;
}

void __34___PXStoryRecipeEnumerator__flush__block_invoke_3(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  v6 = *(void **)(a1 + 32);
  id v7 = a2;
  uint64_t v8 = [v7 localIdentifier];
  id v11 = [v6 objectForKeyedSubscript:v8];

  uint64_t v9 = [*(id *)(*(void *)(a1 + 40) + 32) objectForKeyedSubscript:v11];
  uint64_t v10 = [*(id *)(a1 + 40) block];
  ((void (**)(void, void *, id, uint64_t))v10)[2](v10, v9, v7, a4);
}

id __34___PXStoryRecipeEnumerator__flush__block_invoke(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x1E4F38FD0];
  id v3 = a2;
  v4 = (void *)[[v2 alloc] initWithStringValue:v3];

  return v4;
}

@end