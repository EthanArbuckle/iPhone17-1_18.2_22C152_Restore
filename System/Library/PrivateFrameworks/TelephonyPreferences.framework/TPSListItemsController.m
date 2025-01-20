@interface TPSListItemsController
- (CTXPCServiceSubscriptionContext)subscriptionContext;
- (void)setSpecifier:(id)a3;
- (void)setSubscriptionContext:(id)a3;
@end

@implementation TPSListItemsController

- (void)setSpecifier:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)TPSListItemsController;
  id v5 = [(TPSListItemsController *)&v8 specifier];

  if (v5 != v4)
  {
    v7.receiver = self;
    v7.super_class = (Class)TPSListItemsController;
    [(TPSListItemsController *)&v7 setSpecifier:v4];
    v6 = objc_msgSend(v4, "tps_subscriptionContext");
    [(TPSListItemsController *)self setSubscriptionContext:v6];
  }
}

- (CTXPCServiceSubscriptionContext)subscriptionContext
{
  return self->_subscriptionContext;
}

- (void)setSubscriptionContext:(id)a3
{
}

- (void).cxx_destruct
{
}

@end