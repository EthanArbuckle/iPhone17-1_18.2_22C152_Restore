@interface SPUIFeedbackManager
+ (id)feedbackListener;
+ (void)cardViewDidDisappearWithEvent:(unint64_t)a3 withQueryId:(unint64_t)a4;
+ (void)didAppearFromSource:(unint64_t)a3 withQueryId:(unint64_t)a4 queryString:(id)a5 deviceIsAuthenticated:(BOOL)a6;
+ (void)didClearInputWithEvent:(unint64_t)a3 withQueryId:(unint64_t)a4;
+ (void)didDisappearWithReason:(unint64_t)a3 withQueryId:(unint64_t)a4;
+ (void)flushFeedbackWithCompletion:(id)a3;
@end

@implementation SPUIFeedbackManager

+ (id)feedbackListener
{
  return (id)[MEMORY[0x263F674A0] sharedManager];
}

+ (void)didAppearFromSource:(unint64_t)a3 withQueryId:(unint64_t)a4 queryString:(id)a5 deviceIsAuthenticated:(BOOL)a6
{
  id v10 = a5;
  if (didAppearFromSource_withQueryId_queryString_deviceIsAuthenticated__onceToken != -1) {
    dispatch_once(&didAppearFromSource_withQueryId_queryString_deviceIsAuthenticated__onceToken, &__block_literal_global);
  }
  v11 = didAppearFromSource_withQueryId_queryString_deviceIsAuthenticated__queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __89__SPUIFeedbackManager_didAppearFromSource_withQueryId_queryString_deviceIsAuthenticated___block_invoke_4;
  block[3] = &unk_264E906C8;
  id v14 = v10;
  unint64_t v15 = a3;
  BOOL v18 = a6;
  unint64_t v16 = a4;
  id v17 = a1;
  id v12 = v10;
  dispatch_async(v11, block);
}

uint64_t __89__SPUIFeedbackManager_didAppearFromSource_withQueryId_queryString_deviceIsAuthenticated___block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.spotlightui.presentationFeedback", 0);
  v1 = (void *)didAppearFromSource_withQueryId_queryString_deviceIsAuthenticated__queue;
  didAppearFromSource_withQueryId_queryString_deviceIsAuthenticated__queue = (uint64_t)v0;

  didAppearFromSource_withQueryId_queryString_deviceIsAuthenticated__displayMonitor = [objc_alloc(MEMORY[0x263F3F728]) initWithDisplayType:0 handler:&__block_literal_global_92];
  return MEMORY[0x270F9A758]();
}

void __89__SPUIFeedbackManager_didAppearFromSource_withQueryId_queryString_deviceIsAuthenticated___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = didAppearFromSource_withQueryId_queryString_deviceIsAuthenticated__queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __89__SPUIFeedbackManager_didAppearFromSource_withQueryId_queryString_deviceIsAuthenticated___block_invoke_3;
  block[3] = &unk_264E90660;
  id v6 = v2;
  id v4 = v2;
  dispatch_async(v3, block);
}

void __89__SPUIFeedbackManager_didAppearFromSource_withQueryId_queryString_deviceIsAuthenticated___block_invoke_3(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  didAppearFromSource_withQueryId_queryString_deviceIsAuthenticated__isCurrentlyOverApp = 0;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v1 = objc_msgSend(*(id *)(a1 + 32), "elements", 0);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v12 != v4) {
          objc_enumerationMutation(v1);
        }
        id v6 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        uint64_t v7 = [v6 bundleIdentifier];
        if (v7)
        {
          v8 = (void *)v7;
          v9 = [v6 bundleIdentifier];
          char v10 = [v9 isEqualToString:@"com.apple.Spotlight"];

          if ((v10 & 1) == 0) {
            didAppearFromSource_withQueryId_queryString_deviceIsAuthenticated__isCurrentlyOverApp = 1;
          }
        }
      }
      uint64_t v3 = [v1 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v3);
  }
}

void __89__SPUIFeedbackManager_didAppearFromSource_withQueryId_queryString_deviceIsAuthenticated___block_invoke_4(uint64_t a1)
{
  unint64_t v2 = *(void *)(a1 + 40) - 1;
  if (v2 > 7) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = qword_23D314628[v2];
  }
  id v5 = (id)[objc_alloc(MEMORY[0x263F67A18]) initWithEvent:v3];
  [v5 setQueryId:*(void *)(a1 + 48)];
  [v5 setPreexistingInput:*(void *)(a1 + 32)];
  if (*(unsigned char *)(a1 + 64)) {
    [v5 setIsOverApp:didAppearFromSource_withQueryId_queryString_deviceIsAuthenticated__isCurrentlyOverApp];
  }
  else {
    [v5 setIsOnLockScreen:1];
  }
  uint64_t v4 = [*(id *)(a1 + 56) feedbackListener];
  [v4 searchViewDidAppear:v5];
}

+ (void)didClearInputWithEvent:(unint64_t)a3 withQueryId:(unint64_t)a4
{
  id v7 = (id)[objc_alloc(MEMORY[0x263F67800]) initWithEvent:a3];
  [v7 setQueryId:a4];
  id v6 = [a1 feedbackListener];
  [v6 didClearInput:v7];
}

+ (void)cardViewDidDisappearWithEvent:(unint64_t)a3 withQueryId:(unint64_t)a4
{
  id v7 = (id)[objc_alloc(MEMORY[0x263F677F8]) initWithEvent:a3];
  [v7 setQueryId:a4];
  id v6 = [a1 feedbackListener];
  [v6 cardViewDidDisappear:v7];
}

+ (void)didDisappearWithReason:(unint64_t)a3 withQueryId:(unint64_t)a4
{
  if (a3 - 1 > 7) {
    uint64_t v6 = 0;
  }
  else {
    uint64_t v6 = qword_23D314668[a3 - 1];
  }
  id v8 = (id)[objc_alloc(MEMORY[0x263F67A20]) initWithEvent:v6];
  [v8 setQueryId:a4];
  id v7 = [a1 feedbackListener];
  [v7 searchViewDidDisappear:v8];
}

+ (void)flushFeedbackWithCompletion:(id)a3
{
  id v3 = a3;
  uint64_t v4 = dispatch_group_create();
  id v5 = [MEMORY[0x263F674A0] sharedManager];
  uint64_t v6 = [v5 parsecFeedbackListener];

  id v7 = [v6 connection];

  if (v7)
  {
    dispatch_group_enter(v4);
    id v8 = [v6 connection];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __51__SPUIFeedbackManager_flushFeedbackWithCompletion___block_invoke;
    v13[3] = &unk_264E90660;
    long long v14 = v4;
    [v8 scheduleSendBarrierBlock:v13];
  }
  dispatch_group_enter(v4);
  v9 = (void *)MEMORY[0x263F674A0];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __51__SPUIFeedbackManager_flushFeedbackWithCompletion___block_invoke_2;
  v11[3] = &unk_264E90660;
  long long v12 = v4;
  char v10 = v4;
  [v9 flushFeedbackWithCompletion:v11];
  dispatch_group_notify(v10, MEMORY[0x263EF83A0], v3);
}

void __51__SPUIFeedbackManager_flushFeedbackWithCompletion___block_invoke(uint64_t a1)
{
}

void __51__SPUIFeedbackManager_flushFeedbackWithCompletion___block_invoke_2(uint64_t a1)
{
}

@end