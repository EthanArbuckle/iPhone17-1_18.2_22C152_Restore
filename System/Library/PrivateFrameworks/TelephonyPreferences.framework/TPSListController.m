@interface TPSListController
- (CTXPCServiceSubscriptionContext)subscriptionContext;
- (NSOrderedSet)subscriptions;
- (void)setSpecifier:(id)a3;
- (void)setSubscriptionContext:(id)a3;
- (void)setSubscriptions:(id)a3;
@end

@implementation TPSListController

- (void)setSpecifier:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TPSListController;
  id v5 = [(TPSListController *)&v9 specifier];

  if (v5 != v4)
  {
    v8.receiver = self;
    v8.super_class = (Class)TPSListController;
    [(TPSListController *)&v8 setSpecifier:v4];
    v6 = objc_msgSend(v4, "tps_subscriptionContext");
    [(TPSListController *)self setSubscriptionContext:v6];

    v7 = objc_msgSend(v4, "tps_subscriptions");
    [(TPSListController *)self setSubscriptions:v7];
  }
}

- (CTXPCServiceSubscriptionContext)subscriptionContext
{
  return self->_subscriptionContext;
}

- (void)setSubscriptionContext:(id)a3
{
}

- (NSOrderedSet)subscriptions
{
  return self->_subscriptions;
}

- (void)setSubscriptions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscriptions, 0);
  objc_storeStrong((id *)&self->_subscriptionContext, 0);
}

@end