@interface SUPurchaseContinuation
- (SUPurchaseContinuation)initWithPurchase:(id)a3;
- (SUPurchaseManager)purchaseManager;
- (id)purchase;
- (void)cancel;
- (void)dealloc;
- (void)setPurchaseManager:(id)a3;
- (void)start;
@end

@implementation SUPurchaseContinuation

- (SUPurchaseContinuation)initWithPurchase:(id)a3
{
  v4 = [(SUPurchaseContinuation *)self init];
  if (v4) {
    v4->_purchase = a3;
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SUPurchaseContinuation;
  [(SUPurchaseContinuation *)&v3 dealloc];
}

- (void)cancel
{
  [(SUPurchaseManager *)[(SUPurchaseContinuation *)self purchaseManager] cancelFuturePurchase:self->_purchase];
  v3.receiver = self;
  v3.super_class = (Class)SUPurchaseContinuation;
  [(SUContinuation *)&v3 cancel];
}

- (void)start
{
  objc_super v3 = [(SUPurchaseContinuation *)self purchaseManager];
  id purchase = self->_purchase;

  [(SUPurchaseManager *)v3 addFuturePurchase:purchase];
}

- (id)purchase
{
  return self->_purchase;
}

- (SUPurchaseManager)purchaseManager
{
  return self->_purchaseManager;
}

- (void)setPurchaseManager:(id)a3
{
  self->_purchaseManager = (SUPurchaseManager *)a3;
}

@end