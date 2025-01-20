@interface UITextLinkInteractionHandler
@end

@implementation UITextLinkInteractionHandler

uint64_t __64___UITextLinkInteractionHandler__defaultMenuForInteractableItem__block_invoke(uint64_t result, uint64_t a2)
{
  if (a2) {
    return [*(id *)(result + 32) addObject:a2];
  }
  return result;
}

void __73___UITextLinkInteractionHandler__handlerRequiringUnlockedDevice_handler___block_invoke(uint64_t a1)
{
  v1 = (void *)UIApp;
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __73___UITextLinkInteractionHandler__handlerRequiringUnlockedDevice_handler___block_invoke_2;
  v2[3] = &unk_1E52DB060;
  id v3 = *(id *)(a1 + 32);
  [v1 _requestDeviceUnlockWithCompletion:v2];
}

uint64_t __73___UITextLinkInteractionHandler__handlerRequiringUnlockedDevice_handler___block_invoke_2(uint64_t result, int a2)
{
  if (a2) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

uint64_t __73___UITextLinkInteractionHandler__handlerRequiringUnlockedDevice_handler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __48___UITextLinkInteractionHandler__openURLAction___block_invoke(uint64_t a1)
{
  return [(id)UIApp _openURL:*(void *)(a1 + 32) originatingView:*(void *)(a1 + 40) completionHandler:0];
}

void __49___UITextLinkInteractionHandler__copyLinkAction___block_invoke(uint64_t a1)
{
  id v2 = +[UIPasteboard generalPasteboard];
  [v2 setString:*(void *)(a1 + 32)];
}

void __50___UITextLinkInteractionHandler__shareLinkAction___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) textContentView];
  id v18 = [v2 textLayoutController];

  uint64_t v3 = [*(id *)(a1 + 32) range];
  objc_msgSend(v18, "boundingRectForCharacterRange:", v3, v4);
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  uint64_t v13 = *(void *)(a1 + 40);
  v14 = [*(id *)(a1 + 32) textContentView];
  v15 = +[_UITextServiceSessionContext sessionContextWithText:withRect:withView:](_UITextServiceSessionContext, "sessionContextWithText:withRect:withView:", v13, v14, v6, v8, v10, v12);

  v16 = [*(id *)(a1 + 32) textContentView];
  id v17 = (id)[v16 _showServiceForType:8 withContext:v15];
}

void __68___UITextLinkInteractionHandler__openAppLinkInDefaultBrowserAction___block_invoke(uint64_t a1)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v2 = (void *)UIApp;
  uint64_t v3 = [*(id *)(a1 + 32) URL];
  uint64_t v4 = *(void *)(a1 + 40);
  double v6 = @"UIApplicationOpenURLOptionIgnoreUniversalLinks";
  v7[0] = MEMORY[0x1E4F1CC38];
  double v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  [v2 _openURL:v3 originatingView:v4 options:v5 completionHandler:0];
}

void __73___UITextLinkInteractionHandler__openAppLinkInExternalApplicationAction___block_invoke(uint64_t a1)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v2 = (void *)UIApp;
  uint64_t v3 = [*(id *)(a1 + 32) URL];
  uint64_t v4 = *(void *)(a1 + 40);
  double v6 = @"UIApplicationOpenURLOptionIgnoreUniversalLinks";
  v7[0] = MEMORY[0x1E4F1CC28];
  double v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  [v2 _openURL:v3 originatingView:v4 options:v5 completionHandler:0];
}

void __61___UITextLinkInteractionHandler__addLinkToReadingListAction___block_invoke(uint64_t a1)
{
  id v2 = [getSSReadingListClass() defaultReadingList];
  [v2 addReadingListItemWithURL:*(void *)(a1 + 32) title:*(void *)(a1 + 40) previewText:0 error:0];
}

@end