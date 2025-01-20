@interface DADeliveryAccount
+ (id)accountTypeIdentifier;
- (Class)deliveryClass;
- (DADeliveryAccount)initWithDAMailAccount:(id)a3;
- (id)mailAccountIfAvailable;
- (id)newDeliveryWithHeaders:(id)a3 HTML:(id)a4 plainTextAlternative:(id)a5 other:(id)a6;
- (id)newDeliveryWithHeaders:(id)a3 mixedContent:(id)a4 textPartsAreHTML:(BOOL)a5;
- (id)newDeliveryWithMessage:(id)a3;
@end

@implementation DADeliveryAccount

- (DADeliveryAccount)initWithDAMailAccount:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DADeliveryAccount;
  v6 = [(MFAccount *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_DAMailAccount, a3);
  }

  return v7;
}

- (Class)deliveryClass
{
  return (Class)objc_opt_class();
}

+ (id)accountTypeIdentifier
{
  return 0;
}

- (id)newDeliveryWithMessage:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)DADeliveryAccount;
  id v4 = [(DeliveryAccount *)&v6 newDeliveryWithMessage:a3];
  [v4 setDAMailAccount:self->_DAMailAccount];
  return v4;
}

- (id)newDeliveryWithHeaders:(id)a3 mixedContent:(id)a4 textPartsAreHTML:(BOOL)a5
{
  v8.receiver = self;
  v8.super_class = (Class)DADeliveryAccount;
  id v6 = [(DeliveryAccount *)&v8 newDeliveryWithHeaders:a3 mixedContent:a4 textPartsAreHTML:a5];
  [v6 setDAMailAccount:self->_DAMailAccount];
  return v6;
}

- (id)newDeliveryWithHeaders:(id)a3 HTML:(id)a4 plainTextAlternative:(id)a5 other:(id)a6
{
  v9.receiver = self;
  v9.super_class = (Class)DADeliveryAccount;
  id v7 = [(DeliveryAccount *)&v9 newDeliveryWithHeaders:a3 HTML:a4 plainTextAlternative:a5 other:a6];
  [v7 setDAMailAccount:self->_DAMailAccount];
  return v7;
}

- (id)mailAccountIfAvailable
{
  return self->_DAMailAccount;
}

- (void).cxx_destruct
{
}

@end