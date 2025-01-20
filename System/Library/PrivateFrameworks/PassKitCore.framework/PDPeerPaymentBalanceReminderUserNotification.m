@interface PDPeerPaymentBalanceReminderUserNotification
+ (BOOL)supportsSecureCoding;
- (BOOL)isValid;
- (PDPeerPaymentBalanceReminderUserNotification)initWithCoder:(id)a3;
- (PDPeerPaymentBalanceReminderUserNotification)initWithPassUniqueIdentifier:(id)a3 currentBalance:(id)a4 reminderDate:(id)a5;
- (PKCurrencyAmount)currentBalance;
- (id)_messageString;
- (id)_titleString;
- (unint64_t)notificationType;
- (void)encodeWithCoder:(id)a3;
- (void)updateWithNewBalance:(id)a3 andNewReminderDate:(id)a4;
@end

@implementation PDPeerPaymentBalanceReminderUserNotification

- (PDPeerPaymentBalanceReminderUserNotification)initWithPassUniqueIdentifier:(id)a3 currentBalance:(id)a4 reminderDate:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a3;
  v12 = +[NSString stringWithFormat:@"PDBalanceReminderUserNotification-%@", v11];
  v15.receiver = self;
  v15.super_class = (Class)PDPeerPaymentBalanceReminderUserNotification;
  v13 = [(PDUserNotification *)&v15 initWithNotificationIdentifier:v12 forPassUniqueIdentifier:v11];

  if (v13)
  {
    objc_storeStrong((id *)&v13->_currentBalance, a4);
    [(PDUserNotification *)v13 setDate:v10];
  }

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PDPeerPaymentBalanceReminderUserNotification)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PDPeerPaymentBalanceReminderUserNotification;
  v5 = [(PDUserNotification *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"currentBalance"];
    currentBalance = v5->_currentBalance;
    v5->_currentBalance = (PKCurrencyAmount *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PDPeerPaymentBalanceReminderUserNotification;
  id v4 = a3;
  [(PDUserNotification *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_currentBalance, @"currentBalance", v5.receiver, v5.super_class);
}

- (void)updateWithNewBalance:(id)a3 andNewReminderDate:(id)a4
{
  objc_storeStrong((id *)&self->_currentBalance, a3);
  id v6 = a4;
  [(PDUserNotification *)self setDate:v6];
}

- (BOOL)isValid
{
  v2 = [(PKCurrencyAmount *)self->_currentBalance amount];
  v3 = +[NSDecimalNumber zero];
  BOOL v4 = [v2 compare:v3] == (id)1;

  return v4;
}

- (unint64_t)notificationType
{
  return 14;
}

- (id)_titleString
{
  v2 = [(PKCurrencyAmount *)self->_currentBalance formattedStringValue];
  v3 = PKLocalizedPeerPaymentString(@"PEER_PAYMENT_BALANCE_REMINDER_NOTIFICATION_TITLE", @"%@", v2);

  return v3;
}

- (id)_messageString
{
  return (id)PKLocalizedPeerPaymentString(@"PEER_PAYMENT_BALANCE_REMINDER_NOTIFICATION_MESSAGE");
}

- (PKCurrencyAmount)currentBalance
{
  return self->_currentBalance;
}

- (void).cxx_destruct
{
}

@end