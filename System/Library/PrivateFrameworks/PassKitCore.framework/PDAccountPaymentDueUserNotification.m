@interface PDAccountPaymentDueUserNotification
+ (BOOL)supportsSecureCoding;
- (BOOL)isTimeSensitive;
- (BOOL)isValid;
- (BOOL)useGenericMessaging;
- (NSString)messageString;
- (PDAccountPaymentDueUserNotification)initWithAccount:(id)a3 estimatedRemainingMinimumPayment:(id)a4 reminderOffset:(unint64_t)a5;
- (PDAccountPaymentDueUserNotification)initWithCoder:(id)a3;
- (id)_messageString;
- (id)_messageStringForAccount:(id)a3 amount:(id)a4 reminderOffset:(unint64_t)a5 fireDate:(id)a6;
- (id)_paymentDueApplicationMessageContentWithTitleText:(id)a3 messageText:(id)a4;
- (id)_paymentDueApplicationMessageGroupDescriptor;
- (id)_titleString;
- (id)applicationMessageContent;
- (id)notificationContentWithDataSource:(id)a3;
- (unint64_t)featureIdentifier;
- (unint64_t)notificationType;
- (void)encodeWithCoder:(id)a3;
- (void)setIsTimeSensitive:(BOOL)a3;
@end

@implementation PDAccountPaymentDueUserNotification

- (PDAccountPaymentDueUserNotification)initWithAccount:(id)a3 estimatedRemainingMinimumPayment:(id)a4 reminderOffset:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  if (v8)
  {
    v10 = [v8 creditDetails];
    v11 = [v10 accountSummary];

    v12 = [v11 currentStatement];
    v13 = [v11 paymentDueDate];
    v14 = v13;
    if (!v13)
    {
      p_super = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v51 = 0;
        _os_log_impl((void *)&_mh_execute_header, p_super, OS_LOG_TYPE_DEFAULT, "Ignoring evaluation of payment due notification with paymentDueDate: %@", buf, 0xCu);
      }
      v27 = 0;
      goto LABEL_48;
    }
    v47 = v12;
    id v48 = v9;
    if ([v13 isToday]) {
      self->_isTimeSensitive = 1;
    }
    v15 = [v8 creditDetails];
    v16 = [v15 createdDate];
    v46 = v14;
    id v17 = v14;
    v18 = +[NSCalendar currentCalendar];
    v19 = [v18 components:28 fromDate:v17];
    [v19 setHour:8];
    v20 = [v18 dateFromComponents:v19];
    [v17 timeIntervalSinceDate:v20];
    double v22 = v21;

    v45 = self;
    if (a5)
    {
      if (a5 == 2) {
        uint64_t v23 = -7;
      }
      else {
        uint64_t v23 = -1;
      }
      [v19 setHour:18];
      if (a5 == 1 && v22 < 35997.0) {
        [v19 setHour:8];
      }
      v24 = [v18 dateFromComponents:v19];
      v25 = v18;
      uint64_t v26 = v23;
    }
    else
    {
      if (v22 >= 35997.0)
      {
LABEL_22:
        [v16 timeIntervalSince1970];
        self = [v20 dateByAddingTimeInterval:(double)(18000 * ((uint64_t)v30 / 18000) - (uint64_t)v30)];

        v14 = v46;
        if (self)
        {
          v12 = v47;
          v31 = [v47 identifier];
          id v9 = v48;
          if (a5 > 2) {
            v32 = 0;
          }
          else {
            v32 = off_1007441B0[a5];
          }
          p_super = +[NSString stringWithFormat:@"PaymentDue-%@-%@", v32, v31];

          v33 = [v8 associatedPassUniqueID];
          v49.receiver = v45;
          v49.super_class = (Class)PDAccountPaymentDueUserNotification;
          v27 = [(PDUserNotification *)&v49 initWithNotificationIdentifier:p_super forPassUniqueIdentifier:v33];
          if (v27)
          {
            v34 = +[NSDecimalNumber zero];
            if ([v34 compare:v48] == (id)-1) {
              v35 = v48;
            }
            else {
              v35 = 0;
            }
            id v36 = v35;

            v37 = [v11 pastDueAmount];
            v27->_featureIdentifier = (unint64_t)[v8 feature];
            unsigned __int8 v38 = [v11 requiresDebtCollectionNotices];
            if ((v38 & 1) != 0 || !v37)
            {
              v27->_useGenericMessaging = v38;
            }
            else
            {
              v39 = +[NSDecimalNumber zero];
              v27->_useGenericMessaging = [v39 compare:v37] == (id)-1;
            }
            uint64_t v40 = [(PDAccountPaymentDueUserNotification *)v27 _messageStringForAccount:v8 amount:v36 reminderOffset:a5 fireDate:self];
            messageString = v27->_messageString;
            v27->_messageString = (NSString *)v40;

            if (a5) {
              BOOL v42 = 1;
            }
            else {
              BOOL v42 = v36 == 0;
            }
            uint64_t v43 = !v42;
            [(PDUserNotification *)v27 setPreventAutomaticDismissal:v43];
            if (v27->_messageString)
            {
              [(PDUserNotification *)v27 setDate:self];
              [(PDUserNotification *)v27 setCustomActionRoute:PKUserNotificationActionRouteAccountServiceSchedulePayment];
            }
            else
            {

              v27 = 0;
            }
            v14 = v46;

            v12 = v47;
            id v9 = v48;
          }
        }
        else
        {
          v33 = PKLogFacilityTypeGetObject();
          v12 = v47;
          id v9 = v48;
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Ignoring evaluation of payment due notification with nil fireDate", buf, 2u);
          }
          v27 = 0;
          p_super = &v45->super.super;
        }

LABEL_48:
        goto LABEL_49;
      }
      [v19 setHour:18];
      v24 = [v18 dateFromComponents:v19];
      v25 = v18;
      uint64_t v26 = -1;
    }
    uint64_t v29 = [v25 dateByAddingUnit:16 value:v26 toDate:v24 options:0];

    v20 = (void *)v29;
    goto LABEL_22;
  }
  v12 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Ignoring evaluation of payment due notification with nil account", buf, 2u);
  }
  v27 = 0;
  v11 = self;
LABEL_49:

  return v27;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PDAccountPaymentDueUserNotification)initWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PDAccountPaymentDueUserNotification;
  id v3 = a3;
  v4 = [(PDUserNotification *)&v8 initWithCoder:v3];
  v4->_featureIdentifier = (unint64_t)objc_msgSend(v3, "decodeIntegerForKey:", @"accountFeatureIdentifier", v8.receiver, v8.super_class);
  v4->_useGenericMessaging = [v3 decodeBoolForKey:@"useGenericMessaging"];
  uint64_t v5 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"messageString"];

  messageString = v4->_messageString;
  v4->_messageString = (NSString *)v5;

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PDAccountPaymentDueUserNotification;
  id v4 = a3;
  [(PDUserNotification *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", self->_featureIdentifier, @"accountFeatureIdentifier", v5.receiver, v5.super_class);
  [v4 encodeBool:self->_useGenericMessaging forKey:@"useGenericMessaging"];
  [v4 encodeObject:self->_messageString forKey:@"messageString"];
}

- (id)_titleString
{
  v2 = PKLocalizedFeatureString();
  return v2;
}

- (id)_messageStringForAccount:(id)a3 amount:(id)a4 reminderOffset:(unint64_t)a5 fireDate:(id)a6
{
  id v9 = a4;
  id v10 = a6;
  v11 = [a3 creditDetails];
  v12 = [v11 accountSummary];
  v13 = [v12 paymentDueDate];
  v14 = [v11 currencyCode];
  unsigned int v15 = [v12 inGrace];
  if (qword_100808DD8 == -1)
  {
    if (v9)
    {
LABEL_3:
      v16 = [v12 remainingStatementBalance];
      if (a5 == 2)
      {
        PKFormattedCurrencyStringFromNumber();
        v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
        double v21 = PKLocalizedFeatureString();
        v31 = [(id)qword_100808DD0 stringFromDate:v13];
        double v22 = PKStringWithValidatedFormat();
      }
      else if (a5 == 1)
      {
        PKFormattedCurrencyStringFromNumber();
        v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
        double v21 = PKLocalizedFeatureString();
        double v22 = PKStringWithValidatedFormat();
      }
      else
      {
        if (a5)
        {
          double v22 = 0;
LABEL_15:

          goto LABEL_16;
        }
        id v17 = +[NSCalendar currentCalendar];
        id v18 = v10;
        v19 = v17;
        v35 = v18;
        objc_msgSend(v17, "isDate:inSameDayAsDate:", v13);

        PKLocalizedFeatureString();
        v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          double v21 = [(id)qword_100808DC8 stringFromDate:v13];
          double v22 = PKStringWithValidatedFormat();
        }
        else
        {
          double v21 = PKFormattedCurrencyStringFromNumber();
          v32 = [(id)qword_100808DC8 stringFromDate:v13];
          double v22 = PKStringWithValidatedFormat();
        }
        id v10 = v35;
      }

LABEL_14:
      goto LABEL_15;
    }
  }
  else
  {
    dispatch_once(&qword_100808DD8, &stru_100744160);
    if (v9) {
      goto LABEL_3;
    }
  }
  switch(a5)
  {
    case 2uLL:
      uint64_t v29 = @"ACCOUNT_SERVICE_PAYMENT_REMINDER_NOTIFICATION_STATEMENT_BALANCE_7_DAYS_BODY_REVOLVER_FORMAT";
      if (v15) {
        uint64_t v29 = @"ACCOUNT_SERVICE_PAYMENT_REMINDER_NOTIFICATION_STATEMENT_BALANCE_7_DAYS_BODY_TRANSACTOR_FORMAT";
      }
      v20 = v29;
      PKLocalizedFeatureString();
      v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v34 = [(id)qword_100808DD0 stringFromDate:v13];
      double v22 = PKStringWithValidatedFormat();

      goto LABEL_14;
    case 1uLL:
      double v30 = @"ACCOUNT_SERVICE_PAYMENT_REMINDER_NOTIFICATION_STATEMENT_BALANCE_1_DAY_BODY_REVOLVER_TEXT";
      if (v15) {
        double v30 = @"ACCOUNT_SERVICE_PAYMENT_REMINDER_NOTIFICATION_STATEMENT_BALANCE_1_DAY_BODY_TRANSACTOR_TEXT";
      }
      v16 = v30;
      double v22 = PKLocalizedFeatureString();
      goto LABEL_15;
    case 0uLL:
      +[NSCalendar currentCalendar];
      v24 = id v36 = v10;
      unsigned int v25 = [v24 isDate:v13 inSameDayAsDate:v36];

      uint64_t v26 = @"ACCOUNT_SERVICE_PAYMENT_REMINDER_NOTIFICATION_STATEMENT_BALANCE_TOMORROW_BODY_REVOLVER_FORMAT";
      if (v15) {
        uint64_t v26 = @"ACCOUNT_SERVICE_PAYMENT_REMINDER_NOTIFICATION_STATEMENT_BALANCE_TOMORROW_BODY_TRANSACTOR_FORMAT";
      }
      CFStringRef v27 = @"ACCOUNT_SERVICE_PAYMENT_REMINDER_NOTIFICATION_STATEMENT_BALANCE_TODAY_BODY_TRANSACTOR_FORMAT";
      if (!v15) {
        CFStringRef v27 = @"ACCOUNT_SERVICE_PAYMENT_REMINDER_NOTIFICATION_STATEMENT_BALANCE_TODAY_BODY_REVOLVER_FORMAT";
      }
      if (v25) {
        uint64_t v26 = (__CFString *)v27;
      }
      v28 = v26;
      PKLocalizedFeatureString();
      v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v33 = [(id)qword_100808DC8 stringFromDate:v13];
      double v22 = PKStringWithValidatedFormat();

      id v10 = v36;
      goto LABEL_15;
  }
  double v22 = 0;
LABEL_16:

  return v22;
}

- (id)_messageString
{
  id v3 = self->_messageString;
  if (self->_useGenericMessaging)
  {
    id v4 = PDDeviceSpecificLocalizedStringKeyForKey();
    uint64_t v5 = PKLocalizedFeatureString();

    id v3 = (NSString *)v5;
  }
  return v3;
}

- (id)applicationMessageContent
{
  id v3 = [(PDAccountPaymentDueUserNotification *)self _titleString];
  id v4 = [(PDAccountPaymentDueUserNotification *)self _paymentDueApplicationMessageContentWithTitleText:v3 messageText:self->_messageString];

  return v4;
}

- (id)_paymentDueApplicationMessageGroupDescriptor
{
  v2 = PKLocalizedFeatureString();
  id v3 = +[PKApplicationMessageGroupDescriptor createForIdentifier:@"PDPassAccountEventApplicationMessageGroupIdentifier" withSingularSummary:v2 pluralSummary:v2];

  return v3;
}

- (id)_paymentDueApplicationMessageContentWithTitleText:(id)a3 messageText:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_super v8 = [(PDAccountPaymentDueUserNotification *)self _paymentDueApplicationMessageGroupDescriptor];
  id v9 = [(PDUserNotification *)self actionURL];
  id v10 = +[PKApplicationMessageActionURL createWithURL:v9];
  v11 = +[PDUserNotification applicationMessageIconForFeature:2];
  id v12 = +[PKApplicationMessageContentDefault createWithGroup:v8 action:v10 icon:v11 title:v7 body:v6];

  return v12;
}

- (BOOL)isValid
{
  id v3 = [(PDAccountPaymentDueUserNotification *)self _titleString];
  if ([v3 length]) {
    BOOL v4 = [(NSString *)self->_messageString length] != 0;
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (id)notificationContentWithDataSource:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PDAccountPaymentDueUserNotification;
  BOOL v4 = [(PDUserNotification *)&v9 notificationContentWithDataSource:a3];
  uint64_t v5 = [(PDAccountPaymentDueUserNotification *)self _titleString];
  [v4 setSubtitle:v5];

  id v6 = [(PDAccountPaymentDueUserNotification *)self _messageString];
  [v4 setBody:v6];

  id v7 = [(PDUserNotification *)self date];
  [v4 setDate:v7];

  if (self->_isTimeSensitive) {
    [v4 setInterruptionLevel:2];
  }
  return v4;
}

- (unint64_t)notificationType
{
  return 22;
}

- (unint64_t)featureIdentifier
{
  return self->_featureIdentifier;
}

- (BOOL)useGenericMessaging
{
  return self->_useGenericMessaging;
}

- (NSString)messageString
{
  return self->_messageString;
}

- (BOOL)isTimeSensitive
{
  return self->_isTimeSensitive;
}

- (void)setIsTimeSensitive:(BOOL)a3
{
  self->_isTimeSensitive = a3;
}

- (void).cxx_destruct
{
}

@end