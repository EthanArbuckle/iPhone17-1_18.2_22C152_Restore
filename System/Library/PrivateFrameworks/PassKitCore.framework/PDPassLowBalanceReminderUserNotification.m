@interface PDPassLowBalanceReminderUserNotification
+ (BOOL)supportsSecureCoding;
- (NSDecimalNumber)currentBalanceAmount;
- (NSDecimalNumber)reminderAmount;
- (NSString)balanceIdentifier;
- (NSString)currentBalanceCurrency;
- (NSString)reminderCurrency;
- (PDPassLowBalanceReminderUserNotification)initWithCoder:(id)a3;
- (PDPassLowBalanceReminderUserNotification)initWithCurrentBalance:(id)a3 balanceCurrency:(id)a4 exponent:(int64_t)a5 reminderAmount:(id)a6 reminderCurrency:(id)a7 passUniqueIdentifier:(id)a8 balanceIdentifier:(id)a9;
- (id)_messageString;
- (id)_titleString;
- (id)notificationContentWithDataSource:(id)a3;
- (int64_t)exponent;
- (unint64_t)notificationType;
- (void)encodeWithCoder:(id)a3;
- (void)updateBalanceAmount:(id)a3 currency:(id)a4 exponent:(int64_t)a5;
- (void)updateReminderAmount:(id)a3 currency:(id)a4;
@end

@implementation PDPassLowBalanceReminderUserNotification

- (PDPassLowBalanceReminderUserNotification)initWithCurrentBalance:(id)a3 balanceCurrency:(id)a4 exponent:(int64_t)a5 reminderAmount:(id)a6 reminderCurrency:(id)a7 passUniqueIdentifier:(id)a8 balanceIdentifier:(id)a9
{
  id v24 = a3;
  id v23 = a4;
  id v22 = a6;
  id v21 = a7;
  id v15 = a9;
  id v16 = a8;
  v17 = [v16 stringByAppendingString:@"-LowBalance"];
  v25.receiver = self;
  v25.super_class = (Class)PDPassLowBalanceReminderUserNotification;
  v18 = [(PDUserNotification *)&v25 initWithNotificationIdentifier:v17 forPassUniqueIdentifier:v16];

  if (v18)
  {
    objc_storeStrong((id *)&v18->_currentBalanceAmount, a3);
    objc_storeStrong((id *)&v18->_currentBalanceCurrency, a4);
    objc_storeStrong((id *)&v18->_reminderAmount, a6);
    objc_storeStrong((id *)&v18->_reminderCurrency, a7);
    objc_storeStrong((id *)&v18->_balanceIdentifier, a9);
    v18->_exponent = a5;
  }

  return v18;
}

- (void)updateBalanceAmount:(id)a3 currency:(id)a4 exponent:(int64_t)a5
{
  v8 = (NSDecimalNumber *)a3;
  v9 = (NSString *)a4;
  currentBalanceAmount = self->_currentBalanceAmount;
  self->_currentBalanceAmount = v8;
  v11 = v8;

  currentBalanceCurrency = self->_currentBalanceCurrency;
  self->_currentBalanceCurrency = v9;

  self->_exponent = a5;
}

- (void)updateReminderAmount:(id)a3 currency:(id)a4
{
  v6 = (NSDecimalNumber *)a3;
  v7 = (NSString *)a4;
  reminderAmount = self->_reminderAmount;
  self->_reminderAmount = v6;
  v10 = v6;

  reminderCurrency = self->_reminderCurrency;
  self->_reminderCurrency = v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PDPassLowBalanceReminderUserNotification)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PDPassLowBalanceReminderUserNotification;
  v5 = [(PDUserNotification *)&v17 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"currentBalanceAmount"];
    currentBalanceAmount = v5->_currentBalanceAmount;
    v5->_currentBalanceAmount = (NSDecimalNumber *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"currentBalanceCurrency"];
    currentBalanceCurrency = v5->_currentBalanceCurrency;
    v5->_currentBalanceCurrency = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"reminderCurrency"];
    reminderCurrency = v5->_reminderCurrency;
    v5->_reminderCurrency = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"reminderAmount"];
    reminderAmount = v5->_reminderAmount;
    v5->_reminderAmount = (NSDecimalNumber *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"balanceIdentifier"];
    balanceIdentifier = v5->_balanceIdentifier;
    v5->_balanceIdentifier = (NSString *)v14;

    v5->_exponent = (int64_t)[v4 decodeIntegerForKey:@"exponent"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PDPassLowBalanceReminderUserNotification;
  id v4 = a3;
  [(PDUserNotification *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_currentBalanceAmount, @"currentBalanceAmount", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_currentBalanceCurrency forKey:@"currentBalanceCurrency"];
  [v4 encodeObject:self->_reminderCurrency forKey:@"reminderCurrency"];
  [v4 encodeObject:self->_reminderAmount forKey:@"reminderAmount"];
  [v4 encodeObject:self->_balanceIdentifier forKey:@"balanceIdentifier"];
  [v4 encodeInteger:self->_exponent forKey:@"exponent"];
}

- (unint64_t)notificationType
{
  return 7;
}

- (id)_titleString
{
  v2 = (void *)PKNoCurrencyCode;
  v3 = self->_reminderCurrency;
  id v4 = v2;
  if (v3 == v4)
  {

LABEL_10:
    uint64_t v8 = PKFormattedStringMinimalFractionDigitsFromNumber();
    goto LABEL_12;
  }
  objc_super v5 = v4;
  if (v3) {
    BOOL v6 = v4 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
  }
  else
  {
    unsigned int v7 = [(NSString *)v3 isEqualToString:v4];

    if (v7) {
      goto LABEL_10;
    }
  }
  uint64_t v8 = PKFormattedCurrencyStringFromNumber();
LABEL_12:
  v9 = (void *)v8;
  uint64_t v10 = PKLocalizedPaymentString(@"LOW_BALANCE_REMINDER_NOTIFICATION_TITLE", @"%@", v8);

  return v10;
}

- (id)_messageString
{
  v2 = (void *)PKNoCurrencyCode;
  v3 = self->_currentBalanceCurrency;
  id v4 = v2;
  if (v3 == v4)
  {

LABEL_10:
    uint64_t v8 = PKFormattedStringMinimalFractionDigitsFromNumber();
    goto LABEL_12;
  }
  objc_super v5 = v4;
  if (v3) {
    BOOL v6 = v4 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
  }
  else
  {
    unsigned int v7 = [(NSString *)v3 isEqualToString:v4];

    if (v7) {
      goto LABEL_10;
    }
  }
  uint64_t v8 = PKFormattedCurrencyStringFromNumber();
LABEL_12:
  v9 = (void *)v8;
  uint64_t v10 = PKLocalizedPaymentString(@"LOW_BALANCE_REMINDER_NOTIFICATION_MESSAGE", @"%@", v8);

  return v10;
}

- (id)notificationContentWithDataSource:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PDPassLowBalanceReminderUserNotification;
  v3 = [(PDPassReminderUserNotification *)&v6 notificationContentWithDataSource:a3];
  id v4 = +[NSDate date];
  [v3 setDate:v4];

  [v3 setInterruptionLevel:2];
  return v3;
}

- (NSDecimalNumber)currentBalanceAmount
{
  return self->_currentBalanceAmount;
}

- (NSString)currentBalanceCurrency
{
  return self->_currentBalanceCurrency;
}

- (int64_t)exponent
{
  return self->_exponent;
}

- (NSDecimalNumber)reminderAmount
{
  return self->_reminderAmount;
}

- (NSString)reminderCurrency
{
  return self->_reminderCurrency;
}

- (NSString)balanceIdentifier
{
  return self->_balanceIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_balanceIdentifier, 0);
  objc_storeStrong((id *)&self->_reminderCurrency, 0);
  objc_storeStrong((id *)&self->_reminderAmount, 0);
  objc_storeStrong((id *)&self->_currentBalanceCurrency, 0);
  objc_storeStrong((id *)&self->_currentBalanceAmount, 0);
}

@end