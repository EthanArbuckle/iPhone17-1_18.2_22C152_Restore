@interface MAAutoAsset
@end

@implementation MAAutoAsset

uint64_t __97__MAAutoAsset_SUCoreBorderMAAutoAsset___SUCoreBorder_stageDetermineResultAtBegin_withCompletion___block_invoke(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6]);
}

uint64_t __114__MAAutoAsset_SUCoreBorderMAAutoAsset___SUCoreBorder_stageDetermineResultAtEnd_assets_bytes_error_withCompletion___block_invoke(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6]);
}

uint64_t __90__MAAutoAsset_SUCoreBorderMAAutoAsset___SUCoreBorder_stageDownloadAtBegin_withCompletion___block_invoke(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6]);
}

uint64_t __107__MAAutoAsset_SUCoreBorderMAAutoAsset___SUCoreBorder_stageDownloadAtEnd_assets_bytes_error_withCompletion___block_invoke(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6]);
}

uint64_t __88__MAAutoAsset_SUCoreBorderMAAutoAsset___SUCoreBorder_stageCancelAtBegin_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __101__MAAutoAsset_SUCoreBorderMAAutoAsset___SUCoreBorder_stageCancelAtEnd_operationError_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __90__MAAutoAsset_SUCoreBorderMAAutoAsset___SUCoreBorder_stagePurgeAllAtBegin_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __103__MAAutoAsset_SUCoreBorderMAAutoAsset___SUCoreBorder_stagePurgeAllAtEnd_operationError_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __67__MAAutoAsset_SUCoreBorderMAAutoAsset__SUCoreBorder_stagePurgeAll___block_invoke(uint64_t a1, void *a2)
{
  v3 = (void *)MEMORY[0x263F77E20];
  id v4 = a2;
  v5 = [v3 sharedSimulator];
  id v6 = [v5 end:@"ma" atFunction:@"stagePurgeAll"];

  if (v6) {
    objc_msgSend(*(id *)(a1 + 40), "_SUCoreBorder_stagePurgeAllAtEnd:operationError:withCompletion:", v6, v4, *(void *)(a1 + 32));
  }
  else {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

@end