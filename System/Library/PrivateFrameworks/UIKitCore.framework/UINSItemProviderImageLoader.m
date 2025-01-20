@interface UINSItemProviderImageLoader
@end

@implementation UINSItemProviderImageLoader

void __50___UINSItemProviderImageLoader__really_loadImage___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  [*(id *)(a1 + 32) _setProgress:0];
  if (v11)
  {
    uint64_t v6 = +[UIImage imageWithData:v11];
    uint64_t v7 = *(void *)(a1 + 32);
    v8 = *(void **)(v7 + 16);
    *(void *)(v7 + 16) = v6;
  }
  else
  {
    uint64_t v9 = [v5 copy];
    uint64_t v10 = *(void *)(a1 + 32);
    v8 = *(void **)(v10 + 24);
    *(void *)(v10 + 24) = v9;
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

@end