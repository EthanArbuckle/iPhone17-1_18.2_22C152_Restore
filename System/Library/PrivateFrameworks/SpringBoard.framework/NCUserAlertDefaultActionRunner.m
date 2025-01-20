@interface NCUserAlertDefaultActionRunner
- (void)executeAction:(id)a3 fromOrigin:(id)a4 endpoint:(id)a5 withParameters:(id)a6 completion:(id)a7;
@end

@implementation NCUserAlertDefaultActionRunner

- (void)executeAction:(id)a3 fromOrigin:(id)a4 endpoint:(id)a5 withParameters:(id)a6 completion:(id)a7
{
  id v8 = a7;
  v9 = [(NCUserAlertActionRunner *)self alertItem];
  if (v9)
  {
    v10 = objc_alloc_init(SBLockScreenUnlockRequest);
    [(SBLockScreenUnlockRequest *)v10 setSource:10];
    [(SBLockScreenUnlockRequest *)v10 setIntent:3];
    [(SBLockScreenUnlockRequest *)v10 setName:@"NCUserAlertDefaultActionRunner"];
    v11 = +[SBLockScreenManager sharedInstance];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __94__NCUserAlertDefaultActionRunner_executeAction_fromOrigin_endpoint_withParameters_completion___block_invoke;
    v12[3] = &unk_1E6AF5AA0;
    id v13 = v9;
    id v14 = v8;
    [v11 unlockWithRequest:v10 completion:v12];
  }
}

uint64_t __94__NCUserAlertDefaultActionRunner_executeAction_fromOrigin_endpoint_withParameters_completion___block_invoke(uint64_t a1, int a2)
{
  if (a2) {
    [*(id *)(a1 + 32) performUnlockAction];
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

@end