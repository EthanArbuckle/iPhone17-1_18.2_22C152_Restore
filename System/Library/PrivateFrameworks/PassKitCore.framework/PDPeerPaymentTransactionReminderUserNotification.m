@interface PDPeerPaymentTransactionReminderUserNotification
+ (id)notificationIdentifierForTransactionServiceIdentifier:(id)a3 reminderPeriod:(unint64_t)a4;
- (PDPeerPaymentTransactionReminderUserNotification)initWithPaymentTransaction:(id)a3 forPassUniqueIdentifier:(id)a4 familyMember:(id)a5 reminderPeriod:(unint64_t)a6;
- (id)_acceptanceReminderApplicationMessageContentWithTitleText:(id)a3 messageText:(id)a4;
- (id)_acceptanceReminderApplicationMessageGroupDescriptor;
- (id)_messageString;
- (id)_titleString;
- (id)applicationMessageContent;
- (unint64_t)notificationType;
- (unint64_t)reminderPeriod;
@end

@implementation PDPeerPaymentTransactionReminderUserNotification

+ (id)notificationIdentifierForTransactionServiceIdentifier:(id)a3 reminderPeriod:(unint64_t)a4
{
  CFStringRef v4 = @"ReminderOneDayBeforeExpiration";
  if (!a4) {
    CFStringRef v4 = @"ReminderOneHourAfter";
  }
  return +[NSString stringWithFormat:@"%@-%@", a3, v4];
}

- (PDPeerPaymentTransactionReminderUserNotification)initWithPaymentTransaction:(id)a3 forPassUniqueIdentifier:(id)a4 familyMember:(id)a5 reminderPeriod:(unint64_t)a6
{
  id v10 = a3;
  v11 = NSString;
  id v12 = a5;
  id v13 = a4;
  uint64_t v14 = [v10 serviceIdentifier];
  v15 = (void *)v14;
  CFStringRef v16 = @"ReminderOneDayBeforeExpiration";
  if (!a6) {
    CFStringRef v16 = @"ReminderOneHourAfter";
  }
  v17 = +[NSString stringWithFormat:@"%@-%@", v14, v16];

  v25.receiver = self;
  v25.super_class = (Class)PDPeerPaymentTransactionReminderUserNotification;
  v18 = [(PDPeerPaymentTransactionUserNotification *)&v25 initWithPaymentTransaction:v10 forPassUniqueIdentifier:v13 familyMember:v12 notificationIdentifier:v17];

  if (v18)
  {
    v18->_reminderPeriod = a6;
    id v19 = v10;
    v20 = v19;
    if (a6 == 1)
    {
      v21 = [v19 expirationDate];
      v22 = v21;
      double v23 = -86400.0;
    }
    else
    {
      if (a6)
      {
LABEL_9:

        [(PDUserNotification *)v18 setDate:v11];
        goto LABEL_10;
      }
      v21 = [v19 transactionDate];
      v22 = v21;
      double v23 = 3600.0;
    }
    v11 = [v21 dateByAddingTimeInterval:v23];

    goto LABEL_9;
  }
LABEL_10:

  return v18;
}

- (unint64_t)notificationType
{
  return 12;
}

- (id)_titleString
{
  unint64_t reminderPeriod = self->_reminderPeriod;
  if (!reminderPeriod)
  {
    v3 = @"PEER_PAYMENT_TRANSACTION_ONE_HOUR_REMINDER_NOTIFICATION_TITLE";
    goto LABEL_5;
  }
  if (reminderPeriod == 1)
  {
    v3 = @"PEER_PAYMENT_TRANSACTION_ONE_DAY_REMINDER_NOTIFICATION_TITLE";
LABEL_5:
    CFStringRef v4 = PKLocalizedPeerPaymentString(&v3->isa);
    goto LABEL_7;
  }
  CFStringRef v4 = 0;
LABEL_7:
  return v4;
}

- (id)_messageString
{
  uint64_t v3 = [(PDPeerPaymentTransactionUserNotification *)self _formattedCounterpartName];
  CFStringRef v4 = (void *)v3;
  unint64_t reminderPeriod = self->_reminderPeriod;
  if (reminderPeriod == 1)
  {
    id v10 = PKLocalizedPeerPaymentString(@"PEER_PAYMENT_TRANSACTION_ONE_DAY_REMINDER_NOTIFICATION_MESSAGE", @"%@", v3);
  }
  else if (reminderPeriod)
  {
    id v10 = 0;
  }
  else
  {
    v6 = [(PDPeerPaymentTransactionUserNotification *)self paymentTransaction];
    v7 = [v6 subtotalCurrencyAmount];
    v8 = v7;
    if (v7)
    {
      id v9 = v7;
    }
    else
    {
      id v9 = [v6 currencyAmount];
    }
    v11 = v9;

    id v12 = [v11 minimalFormattedStringValue];
    id v10 = PKLocalizedPeerPaymentString(@"PEER_PAYMENT_TRANSACTION_ONE_HOUR_REMINDER_NOTIFICATION_MESSAGE", @"%@%@", v4, v12);
  }
  return v10;
}

- (id)applicationMessageContent
{
  uint64_t v3 = [(PDPeerPaymentTransactionReminderUserNotification *)self _titleString];
  CFStringRef v4 = [(PDPeerPaymentTransactionReminderUserNotification *)self _messageString];
  v5 = [(PDPeerPaymentTransactionReminderUserNotification *)self _acceptanceReminderApplicationMessageContentWithTitleText:v3 messageText:v4];

  return v5;
}

- (id)_acceptanceReminderApplicationMessageGroupDescriptor
{
  v2 = PKLocalizedPeerPaymentString(@"PEER_PAYMENT_SUMMARY_GROUP");
  id v3 = +[PKApplicationMessageGroupDescriptor createForIdentifier:@"PDPeerPaymentTransactionAcceptanceReminderApplicationMessageGroupIdentifier" withSingularSummary:v2 pluralSummary:v2];

  return v3;
}

- (id)_acceptanceReminderApplicationMessageContentWithTitleText:(id)a3 messageText:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(PDPeerPaymentTransactionReminderUserNotification *)self _acceptanceReminderApplicationMessageGroupDescriptor];
  id v9 = [(PDUserNotification *)self actionURL];
  id v10 = +[PKApplicationMessageActionURL createWithURL:v9];
  v11 = +[PDUserNotification applicationMessageIconForFeature:1];
  id v12 = +[PKApplicationMessageContentDefault createWithGroup:v8 action:v10 icon:v11 title:v7 body:v6];

  return v12;
}

- (unint64_t)reminderPeriod
{
  return self->_reminderPeriod;
}

@end