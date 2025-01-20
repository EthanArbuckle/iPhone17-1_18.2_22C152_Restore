@interface SUUISettingsFamilyViewStateCoordinator
- (void)_checkSubscriptionStatus:(id)a3 isFinal:(BOOL)a4 error:(id)a5;
- (void)_getSubscriptionStatus;
- (void)_returnFamilyViewState:(int64_t)a3;
- (void)checkSettingsFamilyViewStateWithBlock:(id)a3;
@end

@implementation SUUISettingsFamilyViewStateCoordinator

- (void)checkSettingsFamilyViewStateWithBlock:(id)a3
{
  id v5 = a3;
  id v9 = v5;
  if (!v5)
  {
    v8 = [MEMORY[0x263F08690] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"SUUISettingsFamilyViewStateCoordinator.m", 21, @"Invalid parameter not satisfying: %@", @"block" object file lineNumber description];

    id v5 = 0;
  }
  v6 = (void *)[v5 copy];
  id completionBlock = self->_completionBlock;
  self->_id completionBlock = v6;

  [(SUUISettingsFamilyViewStateCoordinator *)self _getSubscriptionStatus];
}

- (void)_checkSubscriptionStatus:(id)a3 isFinal:(BOOL)a4 error:(id)a5
{
  id v7 = a3;
  if ([v7 accountStatus] != 3 || !objc_msgSend(v7, "isFamilySubscription")) {
    goto LABEL_8;
  }
  if (![v7 hasFamily])
  {
    uint64_t v6 = 1;
    goto LABEL_9;
  }
  if (![v7 isFamilyOrganizer])
  {
LABEL_8:
    uint64_t v6 = 0;
    goto LABEL_9;
  }
  if ([v7 hasFamilyMembers]) {
    uint64_t v6 = 3;
  }
  else {
    uint64_t v6 = 2;
  }
LABEL_9:
  [(SUUISettingsFamilyViewStateCoordinator *)self _returnFamilyViewState:v6];
}

- (void)_getSubscriptionStatus
{
  v3 = [MEMORY[0x263F7B3E8] sharedCoordinator];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __64__SUUISettingsFamilyViewStateCoordinator__getSubscriptionStatus__block_invoke;
  v4[3] = &unk_265400E68;
  v4[4] = self;
  [v3 getStatusWithOptions:0 statusBlock:v4];
}

void __64__SUUISettingsFamilyViewStateCoordinator__getSubscriptionStatus__block_invoke(uint64_t a1, void *a2, char a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __64__SUUISettingsFamilyViewStateCoordinator__getSubscriptionStatus__block_invoke_2;
  v11[3] = &unk_265400E40;
  v11[4] = *(void *)(a1 + 32);
  id v12 = v7;
  char v14 = a3;
  id v13 = v8;
  id v9 = v8;
  id v10 = v7;
  dispatch_async(MEMORY[0x263EF83A0], v11);
}

uint64_t __64__SUUISettingsFamilyViewStateCoordinator__getSubscriptionStatus__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _checkSubscriptionStatus:*(void *)(a1 + 40) isFinal:*(unsigned __int8 *)(a1 + 56) error:*(void *)(a1 + 48)];
}

- (void)_returnFamilyViewState:(int64_t)a3
{
}

- (void).cxx_destruct
{
}

@end