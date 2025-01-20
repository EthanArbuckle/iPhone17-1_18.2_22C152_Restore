@interface MAAsset
@end

@implementation MAAsset

void __94__MAAsset_SUCoreBorderMAAsset__SUCoreBorder_startCatalogDownload_options_completionWithError___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v5 = (void *)MEMORY[0x263F77E20];
  id v6 = a3;
  v7 = [v5 sharedSimulator];
  id v8 = [v7 end:@"ma" atFunction:@"startCatalogDownload"];

  if (v8) {
    objc_msgSend(MEMORY[0x263F55938], "_SUCoreBorder_MADownloadResultAtEnd:withResult:withError:withCompletion:", v8, a2, v6, *(void *)(a1 + 32));
  }
  else {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __94__MAAsset_SUCoreBorderMAAsset__SUCoreBorder_cancelCatalogDownload_completionWithCancelResult___block_invoke(uint64_t a1, uint64_t a2)
{
  v4 = [MEMORY[0x263F77E20] sharedSimulator];
  id v5 = [v4 end:@"ma" atFunction:@"cancelCatalogDownload"];

  if (v5) {
    objc_msgSend(MEMORY[0x263F55938], "_SUCoreBorder_MACancelDownloadResultAtEnd:withResult:withCompletion:", v5, a2, *(void *)(a1 + 32));
  }
  else {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __79__MAAsset_SUCoreBorderMAAsset__SUCoreBorder_startDownload_completionWithError___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v9 = a3;
  id v5 = [MEMORY[0x263F77E20] sharedSimulator];
  id v6 = [v5 end:@"ma" atFunction:@"startDownload"];

  if (v6)
  {
    objc_msgSend(MEMORY[0x263F55938], "_SUCoreBorder_MADownloadResultAtEnd:withResult:withError:withCompletion:", v6, a2, v9, *(void *)(a1 + 48));
  }
  else
  {
    v7 = *(void **)(a1 + 32);
    id v8 = [*(id *)(a1 + 40) sessionId];
    [v7 _prepAndSendDownloadFinishedSplunkEvent:a2 withError:v9 withSessionId:v8];

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __60__MAAsset_SUCoreBorderMAAsset__SUCoreBorder_purgeWithError___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = (void *)MEMORY[0x263F77E20];
  id v6 = a3;
  v7 = [v5 sharedSimulator];
  id v8 = [v7 end:@"ma" atFunction:@"purgeWithError"];

  if (v8) {
    objc_msgSend(MEMORY[0x263F55938], "_SUCoreBorder_MAPurgeResultAtEnd:withResult:withError:withCompletion:", v8, a2, v6, *(void *)(a1 + 32));
  }
  else {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __60__MAAsset_SUCoreBorderMAAsset__SUCoreBorder_cancelDownload___block_invoke(uint64_t a1, uint64_t a2)
{
  v4 = [MEMORY[0x263F77E20] sharedSimulator];
  id v5 = [v4 end:@"ma" atFunction:@"cancelDownload"];

  if (v5) {
    objc_msgSend(MEMORY[0x263F55938], "_SUCoreBorder_MACancelDownloadResultAtEnd:withResult:withCompletion:", v5, a2, *(void *)(a1 + 32));
  }
  else {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __71__MAAsset_SUCoreBorderMAAsset__SUCoreBorder_configDownload_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  v4 = [MEMORY[0x263F77E20] sharedSimulator];
  id v5 = [v4 end:@"ma" atFunction:@"configDownload"];

  if (v5) {
    objc_msgSend(MEMORY[0x263F55938], "_SUCoreBorder_MAOperationResultAtEnd:withResult:withCompletion:", v5, a2, *(void *)(a1 + 32));
  }
  else {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

uint64_t __85__MAAsset_SUCoreBorderMAAsset___SUCoreBorder_MADownloadResultAtBegin_withCompletion___block_invoke(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[5] + 16))(a1[5], a1[6], a1[4]);
}

uint64_t __82__MAAsset_SUCoreBorderMAAsset___SUCoreBorder_MAPurgeResultAtBegin_withCompletion___block_invoke(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[5] + 16))(a1[5], a1[6], a1[4]);
}

uint64_t __91__MAAsset_SUCoreBorderMAAsset___SUCoreBorder_MACancelDownloadResultAtBegin_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t __86__MAAsset_SUCoreBorderMAAsset___SUCoreBorder_MAOperationResultAtBegin_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40));
}

@end