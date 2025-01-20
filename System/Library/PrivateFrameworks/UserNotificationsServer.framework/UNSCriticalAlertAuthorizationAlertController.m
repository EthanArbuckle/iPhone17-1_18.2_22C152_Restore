@interface UNSCriticalAlertAuthorizationAlertController
- (void)presentAuthorizationAlertForBundleIdentifier:(id)a3 displayName:(id)a4 usageDescription:(id)a5 withResult:(id)a6;
@end

@implementation UNSCriticalAlertAuthorizationAlertController

- (void)presentAuthorizationAlertForBundleIdentifier:(id)a3 displayName:(id)a4 usageDescription:(id)a5 withResult:(id)a6
{
  id v8 = a6;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __133__UNSCriticalAlertAuthorizationAlertController_presentAuthorizationAlertForBundleIdentifier_displayName_usageDescription_withResult___block_invoke;
  v10[3] = &unk_26462FCA0;
  id v11 = v8;
  id v9 = v8;
  UNSShowCriticalAlertAuthorizationAlert(a3, a4, v10);
}

uint64_t __133__UNSCriticalAlertAuthorizationAlertController_presentAuthorizationAlertForBundleIdentifier_displayName_usageDescription_withResult___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

@end