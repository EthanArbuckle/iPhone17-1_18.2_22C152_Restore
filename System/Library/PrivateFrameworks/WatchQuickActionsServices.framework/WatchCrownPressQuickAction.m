@interface WatchCrownPressQuickAction
- (WatchCrownPressQuickAction)initWithLocalizedTitle:(id)a3 completionHandler:(id)a4;
@end

@implementation WatchCrownPressQuickAction

- (WatchCrownPressQuickAction)initWithLocalizedTitle:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __71__WatchCrownPressQuickAction_initWithLocalizedTitle_completionHandler___block_invoke;
  v11[3] = &unk_264DB84A8;
  id v12 = v6;
  v10.receiver = self;
  v10.super_class = (Class)WatchCrownPressQuickAction;
  id v7 = v6;
  v8 = [(WatchQuickAction *)&v10 initWithLocalizedTitle:a3 activationCallback:v11];

  return v8;
}

void __71__WatchCrownPressQuickAction_initWithLocalizedTitle_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = +[WatchQuickActionsServices sharedInstance];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __71__WatchCrownPressQuickAction_initWithLocalizedTitle_completionHandler___block_invoke_2;
  v7[3] = &unk_264DB7FE8;
  id v5 = *(id *)(a1 + 32);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  [v4 requestCrownPressWithCompletionHandler:v7];
}

uint64_t __71__WatchCrownPressQuickAction_initWithLocalizedTitle_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

@end