@interface PDPassPaymentTransactionAuthenticationUserNotification
+ (BOOL)supportsSecureCoding;
+ (id)notificationIdentifierForTransactionIdentifier:(id)a3;
- (BOOL)isValid;
- (PDPassPaymentTransactionAuthenticationUserNotification)initWithCoder:(id)a3;
- (PDPassPaymentTransactionAuthenticationUserNotification)initWithPaymentTransaction:(id)a3 forPassUniqueIdentifier:(id)a4;
- (PKPaymentTransaction)paymentTransaction;
- (id)notificationContentWithDataSource:(id)a3;
- (unint64_t)notificationType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PDPassPaymentTransactionAuthenticationUserNotification

+ (id)notificationIdentifierForTransactionIdentifier:(id)a3
{
  return +[NSString stringWithFormat:@"authenticate-%@", a3];
}

- (PDPassPaymentTransactionAuthenticationUserNotification)initWithPaymentTransaction:(id)a3 forPassUniqueIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (v7)
  {
    v9 = objc_opt_class();
    v10 = [v7 identifier];
    v11 = [v9 notificationIdentifierForTransactionIdentifier:v10];
    v18.receiver = self;
    v18.super_class = (Class)PDPassPaymentTransactionAuthenticationUserNotification;
    v12 = [(PDUserNotification *)&v18 initWithNotificationIdentifier:v11 forPassUniqueIdentifier:v8];

    if (v12)
    {
      objc_storeStrong((id *)&v12->_paymentTransaction, a3);
      [(PDUserNotification *)v12 setCustomActionRoute:PKUserNotificationActionRouteViewTransaction];
      v13 = [(PKPaymentTransaction *)v12->_paymentTransaction identifier];
      v14 = [(PKPaymentTransaction *)v12->_paymentTransaction transactionSourceIdentifier];
      id v15 = objc_alloc_init((Class)NSMutableDictionary);
      if ([v13 length]) {
        [v15 setObject:v13 forKey:PKUserNotificationActionQueryItemTransactionIdentifier];
      }
      if ([v14 length]) {
        [v15 setObject:v14 forKey:PKUserNotificationActionQueryItemTransactionSourceIdentifier];
      }
      id v16 = [v15 copy];
      [(PDUserNotification *)v12 setCustomActionQueryParameters:v16];
    }
  }
  else
  {

    v12 = 0;
  }

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PDPassPaymentTransactionAuthenticationUserNotification)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PDPassPaymentTransactionAuthenticationUserNotification;
  v5 = [(PDUserNotification *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"paymentTransaction"];
    paymentTransaction = v5->_paymentTransaction;
    v5->_paymentTransaction = (PKPaymentTransaction *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PDPassPaymentTransactionAuthenticationUserNotification;
  id v4 = a3;
  [(PDUserNotification *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_paymentTransaction, @"paymentTransaction", v5.receiver, v5.super_class);
}

- (unint64_t)notificationType
{
  return 30;
}

- (BOOL)isValid
{
  v3 = [(PKPaymentTransaction *)self->_paymentTransaction transactionDate];
  [v3 timeIntervalSinceNow];
  double v5 = fabs(v4);

  uint64_t v6 = [(PKPaymentTransaction *)self->_paymentTransaction authenticationContext];
  if (v5 > PKPaymentTransactionAuthenticationValidPeriod
    || [(PKPaymentTransaction *)self->_paymentTransaction transactionStatus]
    || ![v6 requestedAuthenticationMechanisms]
    || [v6 requestedAuthenticationMechanisms] == (id)2)
  {
    LOBYTE(v7) = 0;
  }
  else
  {
    unsigned int v7 = [v6 complete] ^ 1;
  }

  return v7;
}

- (id)notificationContentWithDataSource:(id)a3
{
  v35.receiver = self;
  v35.super_class = (Class)PDPassPaymentTransactionAuthenticationUserNotification;
  id v4 = a3;
  double v5 = [(PDUserNotification *)&v35 notificationContentWithDataSource:v4];
  uint64_t v6 = [(PDUserNotification *)self passUniqueIdentifier];
  unsigned int v7 = [v4 passWithUniqueIdentifier:v6];

  id v8 = [(PKPaymentTransaction *)self->_paymentTransaction authenticationContext];
  id v9 = [v8 requestedAuthenticationMechanisms];

  if ((v9 & 4) != 0)
  {
    v12 = [(PKPaymentTransaction *)self->_paymentTransaction currencyAmount];
    v13 = [v12 formattedStringValue];
    v14 = [(PKPaymentTransaction *)self->_paymentTransaction merchant];
    id v15 = [v14 displayName];
    v11 = PKLocalizedAquamanString(@"TRANSACTION_AUTHENTICATION_USER_CONFIRMATION_MESSAGE", @"%@%@", v13, v15);

    goto LABEL_17;
  }
  if ((v9 & 8) == 0)
  {
    if ((v9 & 1) == 0)
    {
      v10 = 0;
      v11 = 0;
      goto LABEL_10;
    }
    v34 = [(PKPaymentTransaction *)self->_paymentTransaction currencyAmount];
    v29 = [v34 formattedStringValue];
    v30 = [(PKPaymentTransaction *)self->_paymentTransaction merchant];
    v31 = [v30 displayName];
    [v7 organizationName];
    v33 = v32 = v7;
    v11 = PKLocalizedAquamanString(@"TRANSACTION_AUTHENTICATION_PAYMENT_PIN_NOTIFICATION_BODY", @"%@%@%@", v29, v31, v33);

    unsigned int v7 = v32;
LABEL_17:
    v10 = 0;
    if (!v11) {
      goto LABEL_10;
    }
LABEL_9:
    [v5 setBody:v11];
    goto LABEL_10;
  }
  v10 = PKLocalizedAquamanString(@"TRANSACTION_AUTHENTICATION_APP_REDIRECT_NOTIFICATION_TITLE");
  id v16 = [v7 organizationName];
  v11 = PKLocalizedAquamanString(@"TRANSACTION_AUTHENTICATION_APP_REDIRECT_NOTIFICATION_BODY", @"%@", v16);

  if (v10) {
    [v5 setSubtitle:v10];
  }
  if (v11) {
    goto LABEL_9;
  }
LABEL_10:
  v17 = [(PKPaymentTransaction *)self->_paymentTransaction transactionDate];
  [v5 setDate:v17];

  objc_super v18 = [(PKPaymentTransaction *)self->_paymentTransaction transactionDate];
  v19 = [v18 dateByAddingTimeInterval:PKPaymentTransactionAuthenticationValidPeriod];
  [v5 setExpirationDate:v19];

  v20 = [v5 userInfo];
  id v21 = [v20 mutableCopy];
  v22 = v21;
  if (v21) {
    id v23 = v21;
  }
  else {
    id v23 = objc_alloc_init((Class)NSMutableDictionary);
  }
  v24 = v23;

  v25 = [(PKPaymentTransaction *)self->_paymentTransaction identifier];
  [v24 setObject:v25 forKeyedSubscript:PKUserNotificationTransactionIdentifierContextKey];

  v26 = [(PDUserNotification *)self passUniqueIdentifier];
  [v24 setObject:v26 forKeyedSubscript:PKUserNotificationPassUniqueIdentifierContextKey];

  v27 = +[NSNumber numberWithUnsignedInteger:v9];
  [v24 setObject:v27 forKeyedSubscript:PKUserNotificationRequestedAuthenticationMechanismsContextKey];

  [v5 setUserInfo:v24];
  return v5;
}

- (PKPaymentTransaction)paymentTransaction
{
  return self->_paymentTransaction;
}

- (void).cxx_destruct
{
}

@end