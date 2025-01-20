@interface SKPayment
+ (SKPayment)paymentWithProduct:(SKProduct *)product;
+ (id)paymentFromPurchaseIntentWithProduct:(id)a3;
+ (id)paymentWithProductIdentifier:(NSString *)identifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)isStoreOriginated;
- (BOOL)simulatesAskToBuyInSandbox;
- (NSData)requestData;
- (NSDictionary)requestParameters;
- (NSInteger)quantity;
- (NSString)applicationUsername;
- (NSString)partnerIdentifier;
- (NSString)partnerTransactionIdentifier;
- (NSString)productIdentifier;
- (SKPayment)init;
- (SKPaymentDiscount)paymentDiscount;
- (id)copyWithZone:(_NSZone *)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
@end

@implementation SKPayment

- (SKPayment)init
{
  v6.receiver = self;
  v6.super_class = (Class)SKPayment;
  v2 = [(SKPayment *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(SKPaymentInternal);
    id internal = v2->_internal;
    v2->_id internal = v3;
  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [+[SKPayment allocWithZone:](SKPayment, "allocWithZone:") init];
  id v6 = [self->_internal copyWithZone:a3];
  id internal = v5->_internal;
  v5->_id internal = v6;

  return v5;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v5 = [(SKPayment *)+[SKMutablePayment allocWithZone:](SKMutablePayment, "allocWithZone:") init];
  id v6 = [self->_internal copyWithZone:a3];
  id internal = v5->super._internal;
  v5->super._id internal = v6;

  return v5;
}

+ (SKPayment)paymentWithProduct:(SKProduct *)product
{
  v4 = product;
  v5 = (id *)objc_alloc_init((Class)a1);
  id v6 = v5[1];
  v7 = [(SKProduct *)v4 productIdentifier];
  id v8 = [v7 copy];
  v9 = (void *)v6[4];
  v6[4] = v8;

  if (qword_100401DC8)
  {
    v10 = [(SKProduct *)v4 productIdentifier];
    unsigned int v11 = [v10 isEqualToString:qword_100401DC8];

    if (v11) {
      *((unsigned char *)v6 + 65) = 1;
    }
  }

  return (SKPayment *)v5;
}

+ (id)paymentFromPurchaseIntentWithProduct:(id)a3
{
  id v4 = a3;
  v5 = (id *)objc_alloc_init((Class)a1);
  id v6 = v5[1];
  v7 = [v4 productIdentifier];
  id v8 = [v7 copy];
  v9 = (void *)v6[4];
  v6[4] = v8;

  *((unsigned char *)v6 + 65) = 1;
  v10 = (void *)qword_100401DC8;
  if (qword_100401DC8)
  {
    qword_100401DC8 = 0;
  }
  unsigned int v11 = [v4 productIdentifier];
  id v12 = [v11 copy];
  v13 = (void *)qword_100401DC8;
  qword_100401DC8 = (uint64_t)v12;

  return v5;
}

+ (id)paymentWithProductIdentifier:(NSString *)identifier
{
  id v4 = identifier;
  v5 = (id *)objc_alloc_init((Class)a1);
  id v6 = v5[1];
  id v7 = [(NSString *)v4 copy];

  id v8 = (void *)v6[4];
  v6[4] = v7;

  return v5;
}

- (NSString)applicationUsername
{
  return (NSString *)*((id *)self->_internal + 1);
}

- (unint64_t)hash
{
  id v3 = *((id *)self->_internal + 4);
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 hash];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SKPayment;
    id v5 = [(SKPayment *)&v8 hash];
  }
  unint64_t v6 = (unint64_t)v5;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  int v5 = (objc_opt_isKindOfClass() & 1) != 0 && *((void *)self->_internal + 5) == *(void *)(v4[1] + 40);
  id v6 = *((id *)self->_internal + 4);
  id v7 = *(id *)(v4[1] + 32);
  objc_super v8 = v7;
  if (v5)
  {
    if (v6 == v7) {
      LOBYTE(v5) = 1;
    }
    else {
      LOBYTE(v5) = [v6 isEqualToString:v7];
    }
  }

  return v5;
}

- (NSString)productIdentifier
{
  return (NSString *)*((id *)self->_internal + 4);
}

- (NSInteger)quantity
{
  return *((void *)self->_internal + 5);
}

- (NSData)requestData
{
  return (NSData *)*((id *)self->_internal + 6);
}

- (BOOL)simulatesAskToBuyInSandbox
{
  return *((unsigned char *)self->_internal + 64);
}

- (SKPaymentDiscount)paymentDiscount
{
  return (SKPaymentDiscount *)*((id *)self->_internal + 9);
}

- (BOOL)isStoreOriginated
{
  return *((unsigned char *)self->_internal + 65);
}

- (NSString)partnerIdentifier
{
  return (NSString *)*((id *)self->_internal + 2);
}

- (NSString)partnerTransactionIdentifier
{
  return (NSString *)*((id *)self->_internal + 3);
}

- (NSDictionary)requestParameters
{
  return (NSDictionary *)*((id *)self->_internal + 7);
}

- (void).cxx_destruct
{
}

@end