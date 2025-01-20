@interface UNSNotificationDeliveryAuthorizationAlertController
- (void)presentAuthorizationAlertForBundleIdentifier:(id)a3 displayName:(id)a4 usageDescription:(id)a5 withResult:(id)a6;
@end

@implementation UNSNotificationDeliveryAuthorizationAlertController

- (void)presentAuthorizationAlertForBundleIdentifier:(id)a3 displayName:(id)a4 usageDescription:(id)a5 withResult:(id)a6
{
  id v9 = a6;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __140__UNSNotificationDeliveryAuthorizationAlertController_presentAuthorizationAlertForBundleIdentifier_displayName_usageDescription_withResult___block_invoke;
  v11[3] = &unk_26462FCA0;
  id v12 = v9;
  id v10 = v9;
  UNSShowNotificationDeliveryAuthorizationAlert(a3, a4, a5, v11);
}

uint64_t __140__UNSNotificationDeliveryAuthorizationAlertController_presentAuthorizationAlertForBundleIdentifier_displayName_usageDescription_withResult___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

@end