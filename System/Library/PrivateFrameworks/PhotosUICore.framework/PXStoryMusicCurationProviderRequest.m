@interface PXStoryMusicCurationProviderRequest
@end

@implementation PXStoryMusicCurationProviderRequest

uint64_t __62___PXStoryMusicCurationProviderRequest__handleCurationResult___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, void))(a2 + 16))(a2, *(void *)(a1 + 32));
}

void __45___PXStoryMusicCurationProviderRequest_start__block_invoke_287(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __45___PXStoryMusicCurationProviderRequest_start__block_invoke_2_289(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __45___PXStoryMusicCurationProviderRequest_start__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 hasPrefix:@"FlexMusic"];
}

uint64_t __45___PXStoryMusicCurationProviderRequest_start__block_invoke(uint64_t a1, void *a2)
{
  return [a2 hasPrefix:@"AppleMusic"];
}

@end