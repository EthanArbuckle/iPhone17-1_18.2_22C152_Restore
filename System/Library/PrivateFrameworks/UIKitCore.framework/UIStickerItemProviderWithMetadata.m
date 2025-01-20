@interface UIStickerItemProviderWithMetadata
@end

@implementation UIStickerItemProviderWithMetadata

uint64_t ___UIStickerItemProviderWithMetadata_block_invoke(uint64_t a1, void (**a2)(void, void, void))
{
  v3 = *(UIImage **)(a1 + 32);
  v4 = a2;
  v5 = UIImagePNGRepresentation(v3);
  ((void (**)(void, void *, void))a2)[2](v4, v5, 0);

  return 0;
}

uint64_t ___UIStickerItemProviderWithMetadata_block_invoke_2(uint64_t a1, uint64_t a2)
{
  return 0;
}

uint64_t ___UIStickerItemProviderWithMetadata_block_invoke_3(uint64_t a1, void (**a2)(void, void, void))
{
  v3 = *(void **)(a1 + 32);
  v4 = a2;
  v5 = [v3 data];
  ((void (**)(void, void *, void))a2)[2](v4, v5, 0);

  return 0;
}

uint64_t ___UIStickerItemProviderWithMetadata_block_invoke_4(uint64_t a1, void (**a2)(void, void, void))
{
  v3 = (void *)MEMORY[0x1E4F1C9B8];
  v4 = a2;
  v5 = [v3 data];
  ((void (**)(void, void *, void))a2)[2](v4, v5, 0);

  return 0;
}

@end