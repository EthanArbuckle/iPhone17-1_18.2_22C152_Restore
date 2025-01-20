@interface WBSFormDataController
@end

@implementation WBSFormDataController

void __120__WBSFormDataController_SafariSharedUIExtras__bestUsernameSuggestionForUsernamePromptOnURL_inContext_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __120__WBSFormDataController_SafariSharedUIExtras__bestUsernameSuggestionForUsernamePromptOnURL_inContext_completionHandler___block_invoke_2;
  block[3] = &unk_1E5E425D0;
  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  id v8 = v3;
  uint64_t v9 = v4;
  id v10 = v5;
  id v11 = *(id *)(a1 + 48);
  id v12 = *(id *)(a1 + 56);
  id v6 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __120__WBSFormDataController_SafariSharedUIExtras__bestUsernameSuggestionForUsernamePromptOnURL_inContext_completionHandler___block_invoke_2(uint64_t a1)
{
  if ([*(id *)(a1 + 32) state]) {
    [*(id *)(a1 + 40) lastUsedUsernameWithPasswordForURL:*(void *)(a1 + 48) inContext:*(void *)(a1 + 56)];
  }
  else {
  id v2 = [*(id *)(a1 + 32) privateEmailAddress];
  }
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
}

@end