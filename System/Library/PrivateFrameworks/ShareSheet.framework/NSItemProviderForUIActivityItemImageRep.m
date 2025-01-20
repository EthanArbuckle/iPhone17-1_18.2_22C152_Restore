@interface NSItemProviderForUIActivityItemImageRep
@end

@implementation NSItemProviderForUIActivityItemImageRep

void ___NSItemProviderForUIActivityItemImageRep_block_invoke(uint64_t a1, void (**a2)(void, void, void))
{
  v3 = *(void **)(a1 + 32);
  v4 = a2;
  id v5 = [v3 data];
  ((void (**)(void, id, void))a2)[2](v4, v5, 0);
}

void ___NSItemProviderForUIActivityItemImageRep_block_invoke_2(uint64_t a1, void *a2)
{
  id v9 = a2;
  v3 = (void *)MEMORY[0x1E4F28C70];
  v4 = [*(id *)(a1 + 32) extensionIdentifier];
  id v5 = [v3 extensionWithIdentifier:v4 error:0];

  if ([v5 _isPhotoServiceAccessGranted])
  {
    (*((void (**)(id, void, void))v9 + 2))(v9, *(void *)(a1 + 40), 0);
  }
  else
  {
    v6 = (void *)MEMORY[0x1E4F28C58];
    v7 = getALAssetsLibraryErrorDomain();
    v8 = [v6 errorWithDomain:v7 code:-3311 userInfo:0];

    (*((void (**)(id, void, void *))v9 + 2))(v9, 0, v8);
  }
}

void ___NSItemProviderForUIActivityItemImageRep_block_invoke_3(uint64_t a1, void (**a2)(void, void, void))
{
  v3 = *(void **)(a1 + 32);
  v4 = a2;
  id v5 = [v3 thumbnail];
  ((void (**)(void, id, void))a2)[2](v4, v5, 0);
}

@end