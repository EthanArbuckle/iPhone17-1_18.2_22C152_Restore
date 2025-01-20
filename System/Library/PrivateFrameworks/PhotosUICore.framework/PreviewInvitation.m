@interface PreviewInvitation
@end

@implementation PreviewInvitation

void ___PreviewInvitation_block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    uint64_t v3 = *(void *)(a1 + 56);
    v4 = *(void **)(a1 + 32);
    id v6 = [*(id *)(a1 + 40) assetLocalIdentifiers];
    _MoveAssetsIfNecessary(v4, v3, v6, *(void **)(a1 + 48));
  }
  else
  {
    v5 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v5();
  }
}

@end