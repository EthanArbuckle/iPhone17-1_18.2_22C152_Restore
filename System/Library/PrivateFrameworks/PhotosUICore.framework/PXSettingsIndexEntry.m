@interface PXSettingsIndexEntry
@end

@implementation PXSettingsIndexEntry

uint64_t __88___PXSettingsIndexEntry__revealInTopOfSettingsController_drillIn_withCompletionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) selectRowAtIndexPath:*(void *)(a1 + 40) animated:0 scrollPosition:0];
  uint64_t v3 = *(void *)(a1 + 40);
  v2 = *(void **)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 32);
  return [v2 tableView:v4 didSelectRowAtIndexPath:v3];
}

void __88___PXSettingsIndexEntry__revealInTopOfSettingsController_drillIn_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  dispatch_time_t v2 = dispatch_time(0, 500000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __88___PXSettingsIndexEntry__revealInTopOfSettingsController_drillIn_withCompletionHandler___block_invoke_3;
  block[3] = &unk_1E5DD3128;
  id v4 = *(id *)(a1 + 32);
  dispatch_after(v2, MEMORY[0x1E4F14428], block);
}

void __88___PXSettingsIndexEntry__revealInTopOfSettingsController_drillIn_withCompletionHandler___block_invoke_4(uint64_t a1)
{
  dispatch_time_t v2 = [*(id *)(a1 + 32) backgroundColor];
  uint64_t v3 = (void *)MEMORY[0x1E4FB1EB0];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __88___PXSettingsIndexEntry__revealInTopOfSettingsController_drillIn_withCompletionHandler___block_invoke_5;
  v8[3] = &unk_1E5DD36F8;
  id v9 = *(id *)(a1 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __88___PXSettingsIndexEntry__revealInTopOfSettingsController_drillIn_withCompletionHandler___block_invoke_6;
  v5[3] = &unk_1E5DD0058;
  id v6 = *(id *)(a1 + 32);
  id v7 = v2;
  id v4 = v2;
  [v3 animateWithDuration:v8 animations:v5 completion:0.2];
}

void __88___PXSettingsIndexEntry__revealInTopOfSettingsController_drillIn_withCompletionHandler___block_invoke_5(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4FB1618] lightGrayColor];
  [*(id *)(a1 + 32) setBackgroundColor:v2];
}

void __88___PXSettingsIndexEntry__revealInTopOfSettingsController_drillIn_withCompletionHandler___block_invoke_6(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1E4FB1EB0];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __88___PXSettingsIndexEntry__revealInTopOfSettingsController_drillIn_withCompletionHandler___block_invoke_7;
  v3[3] = &unk_1E5DD32A8;
  id v4 = *(id *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  [v2 animateWithDuration:v3 animations:0.2];
}

uint64_t __88___PXSettingsIndexEntry__revealInTopOfSettingsController_drillIn_withCompletionHandler___block_invoke_7(uint64_t a1)
{
  return [*(id *)(a1 + 32) setBackgroundColor:*(void *)(a1 + 40)];
}

uint64_t __88___PXSettingsIndexEntry__revealInTopOfSettingsController_drillIn_withCompletionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __83___PXSettingsIndexEntry__revealInSettingsController_drillIn_withCompletionHandler___block_invoke(uint64_t a1, int a2)
{
  if (a2) {
    return [*(id *)(a1 + 32) _revealInTopOfSettingsController:*(void *)(a1 + 40) drillIn:*(unsigned __int8 *)(a1 + 56) withCompletionHandler:*(void *)(a1 + 48)];
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

@end