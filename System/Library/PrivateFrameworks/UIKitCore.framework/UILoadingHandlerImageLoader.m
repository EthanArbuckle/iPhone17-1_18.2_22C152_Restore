@interface UILoadingHandlerImageLoader
@end

@implementation UILoadingHandlerImageLoader

void __50___UILoadingHandlerImageLoader__really_loadImage___block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) _isCancelled] & 1) == 0)
  {
    uint64_t v2 = *(void *)(a1 + 32);
    uint64_t v3 = *(void *)(v2 + 56);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __50___UILoadingHandlerImageLoader__really_loadImage___block_invoke_2;
    v8[3] = &unk_1E52DFE08;
    v8[4] = v2;
    id v9 = *(id *)(a1 + 40);
    (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v8);
    uint64_t v4 = *(void *)(a1 + 32);
    v5 = *(void **)(v4 + 56);
    *(void *)(v4 + 56) = 0;

    uint64_t v6 = *(void *)(a1 + 32);
    v7 = *(void **)(v6 + 48);
    *(void *)(v6 + 48) = 0;
  }
}

void __50___UILoadingHandlerImageLoader__really_loadImage___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 16), a2);
  id v6 = a2;
  id v7 = a3;
  id v9 = v7;
  if (v6) {
    v8 = 0;
  }
  else {
    v8 = v7;
  }
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 24), v8);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

@end