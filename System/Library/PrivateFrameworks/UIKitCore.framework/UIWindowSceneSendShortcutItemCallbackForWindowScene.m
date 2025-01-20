@interface UIWindowSceneSendShortcutItemCallbackForWindowScene
@end

@implementation UIWindowSceneSendShortcutItemCallbackForWindowScene

void ___UIWindowSceneSendShortcutItemCallbackForWindowScene_block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    v3 = (void *)UIApp;
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = ___UIWindowSceneSendShortcutItemCallbackForWindowScene_block_invoke_2;
    v4[3] = &unk_1E52D9FC0;
    char v6 = *(unsigned char *)(a1 + 48);
    id v5 = *(id *)(a1 + 32);
    [v3 _updateStateRestorationArchiveForBackgroundEvent:v4 saveState:1 exitIfCouldNotRestoreState:1 updateSnapshot:1 windowScene:*(void *)(a1 + 40)];
  }
}

void ___UIWindowSceneSendShortcutItemCallbackForWindowScene_block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40))
  {
    id v1 = [*(id *)(a1 + 32) anyObject];
    if ([v1 canSendResponse]) {
      [v1 sendResponse:0];
    }
  }
}

void ___UIWindowSceneSendShortcutItemCallbackForWindowScene_block_invoke_3(uint64_t a1, int a2)
{
  if (a2)
  {
    v3 = (void *)UIApp;
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = ___UIWindowSceneSendShortcutItemCallbackForWindowScene_block_invoke_4;
    v4[3] = &unk_1E52D9FC0;
    char v6 = *(unsigned char *)(a1 + 48);
    id v5 = *(id *)(a1 + 32);
    [v3 _updateStateRestorationArchiveForBackgroundEvent:v4 saveState:1 exitIfCouldNotRestoreState:1 updateSnapshot:1 windowScene:*(void *)(a1 + 40)];
  }
}

void ___UIWindowSceneSendShortcutItemCallbackForWindowScene_block_invoke_4(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(a1 + 40))
  {
    long long v9 = 0u;
    long long v10 = 0u;
    long long v7 = 0u;
    long long v8 = 0u;
    id v1 = *(id *)(a1 + 32);
    uint64_t v2 = [v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
    if (v2)
    {
      uint64_t v3 = v2;
      uint64_t v4 = *(void *)v8;
      do
      {
        for (uint64_t i = 0; i != v3; ++i)
        {
          if (*(void *)v8 != v4) {
            objc_enumerationMutation(v1);
          }
          char v6 = *(void **)(*((void *)&v7 + 1) + 8 * i);
          if (objc_msgSend(v6, "canSendResponse", (void)v7)) {
            [v6 sendResponse:0];
          }
        }
        uint64_t v3 = [v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
      }
      while (v3);
    }
  }
}

@end