@interface UIApplicationModalProgressController
@end

@implementation UIApplicationModalProgressController

void __55___UIApplicationModalProgressController_sharedInstance__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)_MergedGlobals_1013;
  _MergedGlobals_1013 = (uint64_t)v1;
}

uint64_t __100___UIApplicationModalProgressController_hideAfterDelay_forceCompletion_replacementDismissalHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) hideAfterMinimumUptimeWithDismissalHandler:*(void *)(a1 + 40)];
}

uint64_t __108___UIApplicationModalProgressController_reconfigureWithTitle_message_progress_buttonTitle_dismissalHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _hideImmediatelyWasDismissedByUser:1];
}

uint64_t __115___UIApplicationModalProgressController_displayForDownloadingURL_copyToURL_sourceViewController_completionHandler___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  [*(id *)(a1 + 32) cancel];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t result = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  if (result)
  {
    v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

id __115___UIApplicationModalProgressController_displayForDownloadingURL_copyToURL_sourceViewController_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setUrlProgress:a2];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __115___UIApplicationModalProgressController_displayForDownloadingURL_copyToURL_sourceViewController_completionHandler___block_invoke_3;
  aBlock[3] = &unk_1E52D9F70;
  aBlock[4] = *(void *)(a1 + 32);
  v3 = _Block_copy(aBlock);
  return v3;
}

uint64_t __115___UIApplicationModalProgressController_displayForDownloadingURL_copyToURL_sourceViewController_completionHandler___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) setUrlProgress:0];
}

void __115___UIApplicationModalProgressController_displayForDownloadingURL_copyToURL_sourceViewController_completionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __115___UIApplicationModalProgressController_displayForDownloadingURL_copyToURL_sourceViewController_completionHandler___block_invoke_5;
  v9[3] = &unk_1E52EA6A0;
  uint64_t v4 = *(void *)(a1 + 80);
  id v10 = v3;
  uint64_t v17 = v4;
  id v11 = *(id *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  v7 = *(void **)(a1 + 56);
  id v12 = v5;
  uint64_t v13 = v6;
  id v14 = v7;
  id v15 = *(id *)(a1 + 64);
  id v16 = *(id *)(a1 + 72);
  id v8 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v9);
}

void __115___UIApplicationModalProgressController_displayForDownloadingURL_copyToURL_sourceViewController_completionHandler___block_invoke_5(void *a1)
{
  v2 = (void *)a1[4];
  if (v2)
  {
    [v2 floatValue];
    id v10 = [MEMORY[0x1E4F28B68] stringFromByteCount:(unint64_t)(float)(v3 * (float)(unint64_t)a1[11]) countStyle:0];
    uint64_t v4 = objc_msgSend(NSString, "localizedStringWithFormat:", a1[5], v10, a1[6]);
    id v5 = (void *)a1[7];
    uint64_t v6 = a1[8];
    v7 = [v5 urlProgress];
    [v5 reconfigureWithTitle:v6 message:v4 progress:v7 buttonTitle:a1[9] dismissalHandler:a1[10]];
  }
  else
  {
    id v8 = (void *)a1[7];
    uint64_t v9 = a1[8];
    id v10 = [v8 urlProgress];
    objc_msgSend(v8, "reconfigureWithTitle:message:progress:buttonTitle:dismissalHandler:", v9, 0);
  }
}

void __115___UIApplicationModalProgressController_displayForDownloadingURL_copyToURL_sourceViewController_completionHandler___block_invoke_6(uint64_t a1)
{
  [*(id *)(a1 + 32) finishObserving];
  [*(id *)(a1 + 40) setUrlProgress:0];
  [MEMORY[0x1E4F28F90] _removeSubscriber:*(void *)(a1 + 48)];
  uint64_t v2 = *(void *)(*(void *)(a1 + 56) + 8);
  float v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;
}

void __115___UIApplicationModalProgressController_displayForDownloadingURL_copyToURL_sourceViewController_completionHandler___block_invoke_7(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3032000000;
  v20[3] = __Block_byref_object_copy__56;
  v20[4] = __Block_byref_object_dispose__57;
  id v21 = 0;
  uint64_t v4 = *(void *)(a1 + 32);
  float v3 = *(void **)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  if (v4)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __115___UIApplicationModalProgressController_displayForDownloadingURL_copyToURL_sourceViewController_completionHandler___block_invoke_58;
    v12[3] = &unk_1E52EA740;
    long long v18 = *(_OWORD *)(a1 + 96);
    uint64_t v6 = *(void **)(a1 + 64);
    v12[4] = *(void *)(a1 + 56);
    id v13 = v6;
    id v14 = *(id *)(a1 + 72);
    id v17 = *(id *)(a1 + 80);
    id v15 = v2;
    id v16 = *(id *)(a1 + 32);
    v19 = v20;
    [v3 coordinateReadingItemAtURL:v5 options:0 writingItemAtURL:v4 options:0 error:0 byAccessor:v12];
  }
  else
  {
    [*(id *)(a1 + 40) coordinateReadingItemAtURL:*(void *)(a1 + 48) options:0x20000 error:0 byAccessor:&__block_literal_global_147];
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __115___UIApplicationModalProgressController_displayForDownloadingURL_copyToURL_sourceViewController_completionHandler___block_invoke_4_69;
  block[3] = &unk_1E52EA788;
  block[4] = *(void *)(a1 + 56);
  long long v8 = *(_OWORD *)(a1 + 88);
  id v7 = (id)v8;
  long long v10 = v8;
  uint64_t v11 = *(void *)(a1 + 104);
  dispatch_async(MEMORY[0x1E4F14428], block);

  _Block_object_dispose(v20, 8);
}

void __115___UIApplicationModalProgressController_displayForDownloadingURL_copyToURL_sourceViewController_completionHandler___block_invoke_58(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24))
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __115___UIApplicationModalProgressController_displayForDownloadingURL_copyToURL_sourceViewController_completionHandler___block_invoke_2_59;
    block[3] = &unk_1E52EA718;
    uint64_t v7 = *(void *)(a1 + 32);
    long long v8 = *(void **)(a1 + 40);
    uint64_t v20 = *(void *)(a1 + 88);
    block[4] = v7;
    id v17 = v8;
    id v18 = *(id *)(a1 + 48);
    id v19 = *(id *)(a1 + 72);
    dispatch_async(MEMORY[0x1E4F14428], block);
    [*(id *)(a1 + 56) removeItemAtURL:*(void *)(a1 + 64) error:0];
    uint64_t v9 = *(void **)(a1 + 56);
    long long v10 = [*(id *)(a1 + 64) URLByDeletingLastPathComponent];
    uint64_t v11 = *(void *)(*(void *)(a1 + 96) + 8);
    id obj = *(id *)(v11 + 40);
    LODWORD(v9) = [v9 createDirectoryAtURL:v10 withIntermediateDirectories:1 attributes:0 error:&obj];
    objc_storeStrong((id *)(v11 + 40), obj);

    if (v9)
    {
      id v12 = *(void **)(a1 + 56);
      uint64_t v13 = *(void *)(*(void *)(a1 + 96) + 8);
      id v14 = *(id *)(v13 + 40);
      [v12 copyItemAtURL:v5 toURL:v6 error:&v14];
      objc_storeStrong((id *)(v13 + 40), v14);
    }
  }
}

void __115___UIApplicationModalProgressController_displayForDownloadingURL_copyToURL_sourceViewController_completionHandler___block_invoke_2_59(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  float v3 = _UIKitBundle();
  id v4 = [v3 localizedStringForKey:@"Copying..." value:@"Copying…" table:@"Localizable"];

  [*(id *)(a1 + 32) reconfigureWithTitle:*(void *)(a1 + 40) message:v4 progress:0 buttonTitle:*(void *)(a1 + 48) dismissalHandler:*(void *)(a1 + 56)];
}

uint64_t __115___UIApplicationModalProgressController_displayForDownloadingURL_copyToURL_sourceViewController_completionHandler___block_invoke_4_69(uint64_t a1)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    [*(id *)(a1 + 32) hideAfterMinimumUptimeWithDismissalHandler:0];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  uint64_t result = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  if (result)
  {
    float v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

@end