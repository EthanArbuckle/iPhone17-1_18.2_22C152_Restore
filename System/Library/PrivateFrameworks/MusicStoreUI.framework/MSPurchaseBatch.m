@interface MSPurchaseBatch
- (id)copyContinuationsForPurchases:(id)a3;
@end

@implementation MSPurchaseBatch

- (id)copyContinuationsForPurchases:(id)a3
{
  if ([a3 count] != 1) {
    return 0;
  }
  uint64_t v5 = [a3 objectAtIndex:0];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  v6 = [[MSTonePurchaseContinuation alloc] initWithPurchase:v5];
  [(SUPurchaseContinuation *)v6 setPurchaseManager:[(SUPurchaseBatch *)self purchaseManager]];
  v7 = objc_msgSend(objc_alloc(MEMORY[0x263EFF8C0]), "initWithObjects:", v6, 0);

  return v7;
}

@end