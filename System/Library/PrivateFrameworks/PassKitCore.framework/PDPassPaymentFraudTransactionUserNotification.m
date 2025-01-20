@interface PDPassPaymentFraudTransactionUserNotification
+ (BOOL)supportsSecureCoding;
- (BOOL)accountSuspended;
- (BOOL)isValid;
- (BOOL)questionIsValid;
- (PDPassPaymentFraudTransactionUserNotification)initWithCoder:(id)a3;
- (PDPassPaymentFraudTransactionUserNotification)initWithPaymentTransaction:(id)a3 forPassUniqueIdentifier:(id)a4;
- (PKPaymentTransaction)paymentTransaction;
- (PKPaymentTransactionQuestion)question;
- (id)_fraudApplicationMessageContentWithTitleText:(id)a3 messageText:(id)a4;
- (id)_fraudApplicationMessageGroupDescriptor;
- (id)_messageString;
- (id)applicationMessageContent;
- (id)notificationContentWithDataSource:(id)a3;
- (unint64_t)notificationType;
- (void)encodeWithCoder:(id)a3;
- (void)setAccountSuspended:(BOOL)a3;
@end

@implementation PDPassPaymentFraudTransactionUserNotification

- (PDPassPaymentFraudTransactionUserNotification)initWithPaymentTransaction:(id)a3 forPassUniqueIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (v7)
  {
    v9 = [v7 identifier];
    v10 = +[NSString stringWithFormat:@"fraud-%@", v9];
    v20.receiver = self;
    v20.super_class = (Class)PDPassPaymentFraudTransactionUserNotification;
    v11 = [(PDUserNotification *)&v20 initWithNotificationIdentifier:v10 forPassUniqueIdentifier:v8];

    if (v11)
    {
      objc_storeStrong((id *)&v11->_paymentTransaction, a3);
      v12 = [(PKPaymentTransaction *)v11->_paymentTransaction questions];
      uint64_t v13 = [v12 anyObject];
      question = v11->_question;
      v11->_question = (PKPaymentTransactionQuestion *)v13;

      [(PDUserNotification *)v11 setCustomActionRoute:PKUserNotificationActionRouteViewTransaction];
      v15 = [(PKPaymentTransaction *)v11->_paymentTransaction identifier];
      v16 = [(PKPaymentTransaction *)v11->_paymentTransaction transactionSourceIdentifier];
      id v17 = objc_alloc_init((Class)NSMutableDictionary);
      if ([v15 length]) {
        [v17 setObject:v15 forKey:PKUserNotificationActionQueryItemTransactionIdentifier];
      }
      if ([v16 length]) {
        [v17 setObject:v16 forKey:PKUserNotificationActionQueryItemTransactionSourceIdentifier];
      }
      id v18 = [v17 copy];
      [(PDUserNotification *)v11 setCustomActionQueryParameters:v18];
    }
  }
  else
  {

    v11 = 0;
  }

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PDPassPaymentFraudTransactionUserNotification)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PDPassPaymentFraudTransactionUserNotification;
  v5 = [(PDUserNotification *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"paymentTransaction"];
    paymentTransaction = v5->_paymentTransaction;
    v5->_paymentTransaction = (PKPaymentTransaction *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"paymentTransactionQuestion"];
    question = v5->_question;
    v5->_question = (PKPaymentTransactionQuestion *)v8;

    v5->_accountSuspended = [v4 decodeBoolForKey:@"suspendedAccount"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PDPassPaymentFraudTransactionUserNotification;
  id v4 = a3;
  [(PDUserNotification *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_paymentTransaction, @"paymentTransaction", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_question forKey:@"paymentTransactionQuestion"];
  [v4 encodeBool:self->_accountSuspended forKey:@"suspendedAccount"];
}

- (unint64_t)notificationType
{
  return 16;
}

- (BOOL)isValid
{
  v3 = [(PKPaymentTransaction *)self->_paymentTransaction transactionDate];
  [v3 timeIntervalSinceNow];
  double v5 = fabs(v4);

  if (v5 > 259200.0) {
    return 0;
  }
  return [(PDPassPaymentFraudTransactionUserNotification *)self questionIsValid];
}

- (BOOL)questionIsValid
{
  question = self->_question;
  if (!question) {
    return 0;
  }
  double v4 = [(PKPaymentTransactionQuestion *)question expirationDate];
  if (v4)
  {
    double v5 = [(PKPaymentTransactionQuestion *)self->_question expirationDate];
    [v5 timeIntervalSinceNow];
    BOOL v7 = v6 > 0.0;
  }
  else
  {
    BOOL v7 = 1;
  }

  return v7;
}

- (id)notificationContentWithDataSource:(id)a3
{
  v22.receiver = self;
  v22.super_class = (Class)PDPassPaymentFraudTransactionUserNotification;
  double v4 = [(PDUserNotification *)&v22 notificationContentWithDataSource:a3];
  unsigned int v5 = [(PDPassPaymentFraudTransactionUserNotification *)self questionIsValid];
  double v6 = PKLocalizedFeatureString();
  [v4 setSubtitle:v6];
  BOOL v7 = [(PDPassPaymentFraudTransactionUserNotification *)self _messageString];
  [v4 setBody:v7];

  uint64_t v8 = [(PKPaymentTransaction *)self->_paymentTransaction transactionDate];
  [v4 setDate:v8];

  question = self->_question;
  if (question && (v5 & 1) != 0)
  {
    v10 = [(PKPaymentTransactionQuestion *)question expirationDate];
    [v4 setExpirationDate:v10];
  }
  else
  {
    [v4 setExpirationDate:0];
  }
  objc_super v11 = [v4 userInfo];
  id v12 = [v11 mutableCopy];
  uint64_t v13 = v12;
  if (v12) {
    id v14 = v12;
  }
  else {
    id v14 = objc_alloc_init((Class)NSMutableDictionary);
  }
  v15 = v14;

  v16 = [(PKPaymentTransaction *)self->_paymentTransaction identifier];
  [v15 setObject:v16 forKeyedSubscript:PKUserNotificationTransactionIdentifierContextKey];

  id v17 = [(PDUserNotification *)self passUniqueIdentifier];
  [v15 setObject:v17 forKeyedSubscript:PKUserNotificationPassUniqueIdentifierContextKey];

  id v18 = self->_question;
  if (v18) {
    unsigned int v19 = v5;
  }
  else {
    unsigned int v19 = 0;
  }
  if (v19 == 1)
  {
    objc_super v20 = +[NSNumber numberWithUnsignedInteger:[(PKPaymentTransactionQuestion *)v18 type]];
    [v15 setObject:v20 forKeyedSubscript:PKUserNotificationQuestionTypeContextKey];
  }
  [v4 setUserInfo:v15];
  [v4 setInterruptionLevel:2];

  return v4;
}

- (id)_messageString
{
  v2 = PKLocalizedFeatureString();
  return v2;
}

- (id)applicationMessageContent
{
  v3 = PKLocalizedFeatureString();
  double v4 = [(PDPassPaymentFraudTransactionUserNotification *)self _messageString];
  unsigned int v5 = [(PDPassPaymentFraudTransactionUserNotification *)self _fraudApplicationMessageContentWithTitleText:v3 messageText:v4];

  return v5;
}

- (id)_fraudApplicationMessageGroupDescriptor
{
  v2 = PKLocalizedFeatureString();
  id v3 = +[PKApplicationMessageGroupDescriptor createForIdentifier:@"PDPassPaymentFraudTransactionApplicationMessageGroupIdentifier" withSingularSummary:v2 pluralSummary:v2];

  return v3;
}

- (id)_fraudApplicationMessageContentWithTitleText:(id)a3 messageText:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(PDPassPaymentFraudTransactionUserNotification *)self _fraudApplicationMessageGroupDescriptor];
  v9 = [(PDUserNotification *)self actionURL];
  id v10 = +[PKApplicationMessageActionURL createWithURL:v9];
  objc_super v11 = +[PDUserNotification applicationMessageIconForFeature:2];
  id v12 = +[PKApplicationMessageContentDefault createWithGroup:v8 action:v10 icon:v11 title:v7 body:v6];

  return v12;
}

- (PKPaymentTransaction)paymentTransaction
{
  return self->_paymentTransaction;
}

- (PKPaymentTransactionQuestion)question
{
  return self->_question;
}

- (BOOL)accountSuspended
{
  return self->_accountSuspended;
}

- (void)setAccountSuspended:(BOOL)a3
{
  self->_accountSuspended = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_question, 0);
  objc_storeStrong((id *)&self->_paymentTransaction, 0);
}

@end