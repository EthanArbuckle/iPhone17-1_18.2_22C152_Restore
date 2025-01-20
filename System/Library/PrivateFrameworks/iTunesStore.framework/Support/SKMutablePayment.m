@interface SKMutablePayment
- (void)setApplicationUsername:(NSString *)applicationUsername;
- (void)setIsStoreOriginated:(BOOL)a3;
- (void)setPartnerIdentifier:(id)a3;
- (void)setPartnerTransactionIdentifier:(id)a3;
- (void)setPaymentDiscount:(SKPaymentDiscount *)paymentDiscount;
- (void)setProductIdentifier:(NSString *)productIdentifier;
- (void)setQuantity:(NSInteger)quantity;
- (void)setRequestData:(NSData *)requestData;
- (void)setRequestParameters:(id)a3;
- (void)setSimulatesAskToBuyInSandbox:(BOOL)simulatesAskToBuyInSandbox;
@end

@implementation SKMutablePayment

- (void)setApplicationUsername:(NSString *)applicationUsername
{
  internal = self->super._internal;
  if ((NSString *)internal[1] != applicationUsername)
  {
    v7 = internal;
    id v5 = [(NSString *)applicationUsername copy];
    v6 = (void *)internal[1];
    internal[1] = v5;
  }
}

- (void)setIsStoreOriginated:(BOOL)a3
{
  *((unsigned char *)self->super._internal + 65) = a3;
}

- (void)setProductIdentifier:(NSString *)productIdentifier
{
  internal = self->super._internal;
  if ((NSString *)internal[4] != productIdentifier)
  {
    v7 = internal;
    id v5 = [(NSString *)productIdentifier copy];
    v6 = (void *)internal[4];
    internal[4] = v5;
  }
}

- (void)setQuantity:(NSInteger)quantity
{
  *((void *)self->super._internal + 5) = quantity;
}

- (void)setRequestData:(NSData *)requestData
{
  v9 = requestData;
  if ([(NSData *)v9 length] > 0x2000) {
    +[NSException raise:NSInvalidArgumentException, @"The request data must be less than %d bytes", 0x2000 format];
  }
  internal = self->super._internal;
  id v5 = v9;
  if ((NSData *)internal[6] != v9)
  {
    v6 = internal;
    id v7 = [(NSData *)v9 copy];
    v8 = (void *)internal[6];
    internal[6] = v7;

    id v5 = v9;
  }
}

- (void)setSimulatesAskToBuyInSandbox:(BOOL)simulatesAskToBuyInSandbox
{
  *((unsigned char *)self->super._internal + 64) = simulatesAskToBuyInSandbox;
}

- (void)setPaymentDiscount:(SKPaymentDiscount *)paymentDiscount
{
  objc_storeStrong((id *)self->super._internal + 9, paymentDiscount);
  v4 = paymentDiscount;
}

- (void)setPartnerIdentifier:(id)a3
{
  internal = self->super._internal;
  if ((id)internal[2] != a3)
  {
    id v7 = internal;
    id v5 = [a3 copy];
    v6 = (void *)internal[2];
    internal[2] = v5;
  }
}

- (void)setPartnerTransactionIdentifier:(id)a3
{
  internal = self->super._internal;
  if ((id)internal[3] != a3)
  {
    id v7 = internal;
    id v5 = [a3 copy];
    v6 = (void *)internal[3];
    internal[3] = v5;
  }
}

- (void)setRequestParameters:(id)a3
{
  internal = self->super._internal;
  if ((id)internal[7] != a3)
  {
    id v7 = internal;
    id v5 = [a3 copy];
    v6 = (void *)internal[7];
    internal[7] = v5;
  }
}

@end