@interface PDPeerPaymentTransactionUserNotification
+ (BOOL)supportsSecureCoding;
- (PDPeerPaymentTransactionUserNotification)initWithCoder:(id)a3;
- (PDPeerPaymentTransactionUserNotification)initWithPaymentTransaction:(id)a3 forPassUniqueIdentifier:(id)a4 familyMember:(id)a5;
- (PDPeerPaymentTransactionUserNotification)initWithPaymentTransaction:(id)a3 forPassUniqueIdentifier:(id)a4 familyMember:(id)a5 notificationIdentifier:(id)a6;
- (PKFamilyMember)familyMember;
- (PKPaymentTransaction)paymentTransaction;
- (id)_formattedCounterpartName;
- (id)_peerPaymentNotificationType;
- (unint64_t)familyNotificationType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PDPeerPaymentTransactionUserNotification

- (PDPeerPaymentTransactionUserNotification)initWithPaymentTransaction:(id)a3 forPassUniqueIdentifier:(id)a4 familyMember:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [v10 serviceIdentifier];
  v12 = [(PDPeerPaymentTransactionUserNotification *)self _peerPaymentNotificationType];
  v13 = +[NSString stringWithFormat:@"%@-%@-%@", v9, v11, v12];

  v14 = [(PDPeerPaymentTransactionUserNotification *)self initWithPaymentTransaction:v10 forPassUniqueIdentifier:v9 familyMember:v8 notificationIdentifier:v13];
  return v14;
}

- (PDPeerPaymentTransactionUserNotification)initWithPaymentTransaction:(id)a3 forPassUniqueIdentifier:(id)a4 familyMember:(id)a5 notificationIdentifier:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  v21.receiver = self;
  v21.super_class = (Class)PDPeerPaymentTransactionUserNotification;
  v13 = [(PDUserNotification *)&v21 initWithNotificationIdentifier:a6 forPassUniqueIdentifier:a4];
  v14 = v13;
  if (v13)
  {
    p_paymentTransaction = (id *)&v13->_paymentTransaction;
    objc_storeStrong((id *)&v13->_paymentTransaction, a3);
    objc_storeStrong((id *)&v14->_familyMember, a5);
    [(PDUserNotification *)v14 setCustomActionRoute:PKUserNotificationActionRouteViewTransaction];
    v16 = [*p_paymentTransaction identifier];
    v17 = [*p_paymentTransaction transactionSourceIdentifier];
    id v18 = objc_alloc_init((Class)NSMutableDictionary);
    if ([v16 length]) {
      [v18 setObject:v16 forKey:PKUserNotificationActionQueryItemTransactionIdentifier];
    }
    if ([v17 length]) {
      [v18 setObject:v17 forKey:PKUserNotificationActionQueryItemTransactionSourceIdentifier];
    }
    id v19 = [v18 copy];
    [(PDUserNotification *)v14 setCustomActionQueryParameters:v19];
  }
  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PDPeerPaymentTransactionUserNotification)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PDPeerPaymentTransactionUserNotification;
  v5 = [(PDUserNotification *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"paymentTransaction"];
    paymentTransaction = v5->_paymentTransaction;
    v5->_paymentTransaction = (PKPaymentTransaction *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"familyMember"];
    familyMember = v5->_familyMember;
    v5->_familyMember = (PKFamilyMember *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PDPeerPaymentTransactionUserNotification;
  id v4 = a3;
  [(PDUserNotification *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_paymentTransaction, @"paymentTransaction", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_familyMember forKey:@"familyMember"];
}

- (id)_peerPaymentNotificationType
{
  uint64_t v2 = [(PDUserNotification *)self notificationType];
  id v3 = 0;
  if (v2 > 30)
  {
    switch(v2)
    {
      case 31:
        id v4 = (id *)&PDWalletUserNotificationPeerPaymentAssociatedAccountTransactionReceived;
        break;
      case 34:
        id v4 = (id *)&PDWalletUserNotificationPeerPaymentAssociatedAccountTransactionSend;
        break;
      case 49:
        id v4 = (id *)&PDWalletUserNotificationPeerPaymentTransactionReceived;
        break;
      default:
        goto LABEL_15;
    }
  }
  else
  {
    switch(v2)
    {
      case 9:
        id v4 = (id *)&PDWalletUserNotificationPeerPaymentTransactionAccepted;
        break;
      case 10:
        id v4 = (id *)&PDWalletUserNotificationPeerPaymentTransactionExpired;
        break;
      case 13:
        id v4 = (id *)&PDWalletUserNotificationPeerPaymentTransactionDeclined;
        break;
      default:
        goto LABEL_15;
    }
  }
  id v3 = *v4;
LABEL_15:
  return v3;
}

- (id)_formattedCounterpartName
{
  id v3 = [(PDPeerPaymentTransactionUserNotification *)self paymentTransaction];
  id v4 = [v3 peerPaymentCounterpartHandle];

  objc_super v5 = [(PDPeerPaymentTransactionUserNotification *)self paymentTransaction];
  id v6 = [v5 peerPaymentPaymentMode];

  if (v6 != (id)2)
  {
    id v7 = objc_alloc_init((Class)CNContactStore);
    uint64_t v8 = +[PKPeerPaymentCounterpartHandleFormatter requiredContactKeys];
    id v9 = [objc_alloc((Class)PKContactResolver) initWithContactStore:v7 keysToFetch:v8];
    id v10 = [v9 contactForHandle:v4];
    uint64_t v11 = +[PKPeerPaymentCounterpartHandleFormatter displayNameForCounterpartHandle:v4 contact:v10];

    id v4 = (void *)v11;
  }
  return v4;
}

- (unint64_t)familyNotificationType
{
  return self->_familyMember != 0;
}

- (PKPaymentTransaction)paymentTransaction
{
  return self->_paymentTransaction;
}

- (PKFamilyMember)familyMember
{
  return self->_familyMember;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_familyMember, 0);
  objc_storeStrong((id *)&self->_paymentTransaction, 0);
}

@end