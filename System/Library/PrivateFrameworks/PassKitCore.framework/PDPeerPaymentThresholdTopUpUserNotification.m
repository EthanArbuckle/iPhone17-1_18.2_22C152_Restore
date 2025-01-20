@interface PDPeerPaymentThresholdTopUpUserNotification
+ (BOOL)supportsSecureCoding;
- (BOOL)isValid;
- (PDPeerPaymentThresholdTopUpUserNotification)initWithCoder:(id)a3;
- (PDPeerPaymentThresholdTopUpUserNotification)initWithPassUniqueIdentifier:(id)a3 transaction:(id)a4 updatedBalance:(id)a5;
- (PKCurrencyAmount)updatedBalance;
- (PKPaymentTransaction)transaction;
- (id)notificationContentWithDataSource:(id)a3;
- (unint64_t)notificationType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PDPeerPaymentThresholdTopUpUserNotification

- (PDPeerPaymentThresholdTopUpUserNotification)initWithPassUniqueIdentifier:(id)a3 transaction:(id)a4 updatedBalance:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a3;
  v12 = [v9 serviceIdentifier];
  v13 = +[NSString stringWithFormat:@"PDPeerPaymentThresholdTopUpTransaction-%@", v12];

  v20.receiver = self;
  v20.super_class = (Class)PDPeerPaymentThresholdTopUpUserNotification;
  v14 = [(PDUserNotification *)&v20 initWithNotificationIdentifier:v13 forPassUniqueIdentifier:v11];

  if (v14)
  {
    objc_storeStrong((id *)&v14->_transaction, a4);
    objc_storeStrong((id *)&v14->_updatedBalance, a5);
    [(PDUserNotification *)v14 setCustomActionRoute:PKUserNotificationActionRouteViewTransaction];
    v15 = [(PKPaymentTransaction *)v14->_transaction identifier];
    v16 = [(PKPaymentTransaction *)v14->_transaction transactionSourceIdentifier];
    id v17 = objc_alloc_init((Class)NSMutableDictionary);
    if ([v15 length]) {
      [v17 setObject:v15 forKey:PKUserNotificationActionQueryItemTransactionIdentifier];
    }
    if ([v16 length]) {
      [v17 setObject:v16 forKey:PKUserNotificationActionQueryItemTransactionSourceIdentifier];
    }
    id v18 = [v17 copy];
    [(PDUserNotification *)v14 setCustomActionQueryParameters:v18];
  }
  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PDPeerPaymentThresholdTopUpUserNotification)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PDPeerPaymentThresholdTopUpUserNotification;
  v5 = [(PDUserNotification *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"paymentTransaction"];
    transaction = v5->_transaction;
    v5->_transaction = (PKPaymentTransaction *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"updatedBalance"];
    updatedBalance = v5->_updatedBalance;
    v5->_updatedBalance = (PKCurrencyAmount *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PDPeerPaymentThresholdTopUpUserNotification;
  id v4 = a3;
  [(PDUserNotification *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_transaction, @"paymentTransaction", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_updatedBalance forKey:@"updatedBalance"];
}

- (BOOL)isValid
{
  return 1;
}

- (unint64_t)notificationType
{
  return 71;
}

- (id)notificationContentWithDataSource:(id)a3
{
  v21.receiver = self;
  v21.super_class = (Class)PDPeerPaymentThresholdTopUpUserNotification;
  id v4 = [(PDUserNotification *)&v21 notificationContentWithDataSource:a3];
  objc_super v5 = PKLocalizedPeerPaymentRecurringString(@"NOTIFICATION_THRESHOLD_TOP_UP_TRANSACTION_TITLE");
  [v4 setTitle:v5];

  updatedBalance = self->_updatedBalance;
  v7 = [(PKPaymentTransaction *)self->_transaction currencyAmount];
  uint64_t v8 = [v7 minimalFormattedStringValue];
  id v9 = (void *)v8;
  if (updatedBalance)
  {
    id v10 = [(PKCurrencyAmount *)self->_updatedBalance minimalFormattedStringValue];
    objc_super v11 = PKLocalizedPeerPaymentRecurringString(@"NOTIFICATION_THRESHOLD_TOP_UP_TRANSACTION_MESSAGE_BALANCE", @"%@%@", v9, v10);
    [v4 setBody:v11];
  }
  else
  {
    id v10 = PKLocalizedPeerPaymentRecurringString(@"NOTIFICATION_THRESHOLD_TOP_UP_TRANSACTION_MESSAGE_NO_BALANCE", @"%@", v8);
    [v4 setBody:v10];
  }

  v12 = [v4 userInfo];
  id v13 = [v12 mutableCopy];
  v14 = v13;
  if (v13) {
    id v15 = v13;
  }
  else {
    id v15 = objc_alloc_init((Class)NSMutableDictionary);
  }
  v16 = v15;

  id v17 = [(PKPaymentTransaction *)self->_transaction identifier];
  [v16 setObject:v17 forKeyedSubscript:PKUserNotificationTransactionIdentifierContextKey];

  id v18 = [(PDUserNotification *)self passUniqueIdentifier];
  [v16 setObject:v18 forKeyedSubscript:PKUserNotificationPassUniqueIdentifierContextKey];

  v19 = +[NSNumber numberWithInteger:[(PKPaymentTransaction *)self->_transaction accountType]];
  [v16 setObject:v19 forKeyedSubscript:PKUserNotificationAccountType];

  [v4 setUserInfo:v16];
  return v4;
}

- (PKPaymentTransaction)transaction
{
  return self->_transaction;
}

- (PKCurrencyAmount)updatedBalance
{
  return self->_updatedBalance;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updatedBalance, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
}

@end