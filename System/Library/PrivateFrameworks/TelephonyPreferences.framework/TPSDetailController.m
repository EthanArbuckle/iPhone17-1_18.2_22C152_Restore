@interface TPSDetailController
- (CTXPCServiceSubscriptionContext)subscriptionContext;
@end

@implementation TPSDetailController

- (CTXPCServiceSubscriptionContext)subscriptionContext
{
  v2 = [(TPSDetailController *)self specifier];
  v3 = objc_msgSend(v2, "tps_subscriptionContext");

  return (CTXPCServiceSubscriptionContext *)v3;
}

@end