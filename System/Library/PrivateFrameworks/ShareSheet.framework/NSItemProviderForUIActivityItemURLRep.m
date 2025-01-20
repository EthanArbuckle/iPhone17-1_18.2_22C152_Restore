@interface NSItemProviderForUIActivityItemURLRep
@end

@implementation NSItemProviderForUIActivityItemURLRep

void ___NSItemProviderForUIActivityItemURLRep_block_invoke(uint64_t a1, void (**a2)(void, void, void))
{
  v3 = *(void **)(a1 + 32);
  v4 = a2;
  id v5 = [v3 URL];
  ((void (**)(void, id, void))a2)[2](v4, v5, 0);
}

void ___NSItemProviderForUIActivityItemURLRep_block_invoke_2(uint64_t a1, void (**a2)(void, void, void))
{
  v3 = *(void **)(a1 + 32);
  v4 = a2;
  id v5 = [v3 thumbnail];
  ((void (**)(void, id, void))a2)[2](v4, v5, 0);
}

@end