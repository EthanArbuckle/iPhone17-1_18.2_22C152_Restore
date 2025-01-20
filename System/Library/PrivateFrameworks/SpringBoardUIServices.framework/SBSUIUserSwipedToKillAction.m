@interface SBSUIUserSwipedToKillAction
+ (id)userSwipedToKillActionWithTimeoutHandler:(id)a3;
- (void)acknowledge;
@end

@implementation SBSUIUserSwipedToKillAction

+ (id)userSwipedToKillActionWithTimeoutHandler:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E4F4F670];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __72__SBSUIUserSwipedToKillAction_userSwipedToKillActionWithTimeoutHandler___block_invoke;
  v10[3] = &unk_1E5CCCED8;
  id v11 = v4;
  id v6 = v4;
  v7 = [v5 responderWithHandler:v10];
  [v7 setQueue:MEMORY[0x1E4F14428]];
  objc_msgSend(v7, "setTimeout:", dispatch_time(0, 100000000));
  v8 = (void *)[objc_alloc((Class)a1) initWithInfo:0 responder:v7];

  return v8;
}

void __72__SBSUIUserSwipedToKillAction_userSwipedToKillActionWithTimeoutHandler___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 error];

  if (v3)
  {
    id v4 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v4();
  }
}

- (void)acknowledge
{
  id v3 = [MEMORY[0x1E4F4F678] response];
  [(SBSUIUserSwipedToKillAction *)self sendResponse:v3];
}

@end