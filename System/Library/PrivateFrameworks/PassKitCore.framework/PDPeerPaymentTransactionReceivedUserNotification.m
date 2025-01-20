@interface PDPeerPaymentTransactionReceivedUserNotification
+ (BOOL)supportsSecureCoding;
- (BOOL)isValid;
- (PDPeerPaymentTransactionReceivedUserNotification)initWithCoder:(id)a3;
- (PDPeerPaymentTransactionReceivedUserNotification)initWithPassUniqueIdentifier:(id)a3 accountBalance:(id)a4;
- (PKCurrencyAmount)updatedBalance;
- (id)notificationContentWithDataSource:(id)a3;
- (unint64_t)notificationType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PDPeerPaymentTransactionReceivedUserNotification

- (PDPeerPaymentTransactionReceivedUserNotification)initWithPassUniqueIdentifier:(id)a3 accountBalance:(id)a4
{
  id v7 = a4;
  id v8 = a3;
  v9 = +[NSString stringWithFormat:@"PDPeerPaymentTransactionReceived-%@", v8];
  v12.receiver = self;
  v12.super_class = (Class)PDPeerPaymentTransactionReceivedUserNotification;
  v10 = [(PDUserNotification *)&v12 initWithNotificationIdentifier:v9 forPassUniqueIdentifier:v8];

  if (v10) {
    objc_storeStrong((id *)&v10->_updatedBalance, a4);
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PDPeerPaymentTransactionReceivedUserNotification)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PDPeerPaymentTransactionReceivedUserNotification;
  v5 = [(PDUserNotification *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"updatedBalance"];
    updatedBalance = v5->_updatedBalance;
    v5->_updatedBalance = (PKCurrencyAmount *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PDPeerPaymentTransactionReceivedUserNotification;
  id v4 = a3;
  [(PDUserNotification *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_updatedBalance, @"updatedBalance", v5.receiver, v5.super_class);
}

- (BOOL)isValid
{
  v2 = [(PKCurrencyAmount *)self->_updatedBalance amount];
  v3 = +[NSDecimalNumber zero];
  BOOL v4 = [v2 compare:v3] == (id)1;

  return v4;
}

- (unint64_t)notificationType
{
  return 49;
}

- (id)notificationContentWithDataSource:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PDPeerPaymentTransactionReceivedUserNotification;
  BOOL v4 = [(PDUserNotification *)&v9 notificationContentWithDataSource:a3];
  objc_super v5 = PKLocalizedPeerPaymentString(@"PEER_PAYMENT_TRANSACTION_RECEIVED_NOTIFICATION_TITLE");
  [v4 setTitle:v5];

  uint64_t v6 = [(PKCurrencyAmount *)self->_updatedBalance formattedStringValue];
  id v7 = PKLocalizedPeerPaymentString(@"PEER_PAYMENT_TRANSACTION_RECEIVED_NOTIFICATION_MESSAGE", @"%@", v6);
  [v4 setBody:v7];

  return v4;
}

- (PKCurrencyAmount)updatedBalance
{
  return self->_updatedBalance;
}

- (void).cxx_destruct
{
}

@end