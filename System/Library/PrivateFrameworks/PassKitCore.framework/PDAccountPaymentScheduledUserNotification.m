@interface PDAccountPaymentScheduledUserNotification
+ (BOOL)supportsSecureCoding;
- (BOOL)isValid;
- (NSString)messageString;
- (PDAccountPaymentScheduledUserNotification)initWithAccount:(id)a3 payment:(id)a4 reminderOffset:(unint64_t)a5;
- (PDAccountPaymentScheduledUserNotification)initWithCoder:(id)a3;
- (id)_messageStringForPayment:(id)a3 account:(id)a4 reminderOffset:(unint64_t)a5;
- (id)_titleString;
- (id)notificationContentWithDataSource:(id)a3;
- (unint64_t)featureIdentifier;
- (unint64_t)notificationType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PDAccountPaymentScheduledUserNotification

- (PDAccountPaymentScheduledUserNotification)initWithAccount:(id)a3 payment:(id)a4 reminderOffset:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = v9;
  if (v8 && v9)
  {
    v11 = [v9 paymentDate];
    v12 = +[NSCalendar currentCalendar];
    v13 = [v11 dateByAddingTimeInterval:21600.0];
    v14 = [v12 components:28 fromDate:v13];
    [v14 setHour:18];
    v15 = [v12 dateFromComponents:v14];
    v16 = v15;
    uint64_t v17 = 7;
    if (a5 != 1) {
      uint64_t v17 = 1;
    }
    v18 = [v15 dateByAddingTimeInterval:(double)v17 * -86400.0];

    v19 = +[NSDate date];
    v20 = v19;
    if (v18 && [v19 compare:v18] == (id)1)
    {
      v21 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v35 = v18;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Ignoring evaluation of 'Upcoming Scheduled Payment' notification with fireDate: %@", buf, 0xCu);
      }
      v22 = self;
    }
    else
    {
      v23 = [v10 referenceIdentifier];
      CFStringRef v24 = @"7-Days-Before";
      if (a5 != 1) {
        CFStringRef v24 = 0;
      }
      if (!a5) {
        CFStringRef v24 = @"1-Day-Before";
      }
      v22 = +[NSString stringWithFormat:@"PaymentScheduled-%@-%@", v24, v23];

      v21 = [v8 associatedPassUniqueID];
      v31.receiver = self;
      v31.super_class = (Class)PDAccountPaymentScheduledUserNotification;
      self = [(PDUserNotification *)&v31 initWithNotificationIdentifier:v22 forPassUniqueIdentifier:v21];
      if (!self) {
        goto LABEL_21;
      }
      self->_featureIdentifier = (unint64_t)[v8 feature];
      v25 = [(PDAccountPaymentScheduledUserNotification *)self _messageStringForPayment:v10 account:v8 reminderOffset:a5];
      messageString = self->_messageString;
      self->_messageString = v25;

      if (self->_messageString)
      {
        [(PDUserNotification *)self setDate:v18];
        [(PDUserNotification *)self setCustomActionRoute:PKUserNotificationActionRouteAccountServicePaymentDetails];
        uint64_t v27 = [v10 referenceIdentifier];
        v28 = (void *)v27;
        if (v27)
        {
          uint64_t v32 = PKUserNotificationActionQueryItemPaymentReferenceIdentifier;
          uint64_t v33 = v27;
          v29 = +[NSDictionary dictionaryWithObjects:&v33 forKeys:&v32 count:1];
          [(PDUserNotification *)self setCustomActionQueryParameters:v29];
        }
        goto LABEL_21;
      }
    }
    self = 0;
LABEL_21:
  }
  return self;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PDAccountPaymentScheduledUserNotification)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PDAccountPaymentScheduledUserNotification;
  v5 = [(PDUserNotification *)&v9 initWithCoder:v4];
  if (v5)
  {
    v5->_featureIdentifier = (unint64_t)[v4 decodeIntegerForKey:@"accountFeatureIdentifier"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"messageString"];
    messageString = v5->_messageString;
    v5->_messageString = (NSString *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PDAccountPaymentScheduledUserNotification;
  id v4 = a3;
  [(PDUserNotification *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", self->_featureIdentifier, @"accountFeatureIdentifier", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_messageString forKey:@"messageString"];
}

- (id)_titleString
{
  return (id)PKLocalizedFeatureString();
}

- (id)_messageStringForPayment:(id)a3 account:(id)a4 reminderOffset:(unint64_t)a5
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v7 paymentDate];
  objc_super v9 = [v8 dateByAddingTimeInterval:21600.0];

  v10 = [v6 creditDetails];

  v11 = [v10 accountSummary];
  v12 = [v10 currencyCode];
  v13 = [v11 currentStatement];
  v14 = [v7 scheduleDetails];
  id v15 = [v14 preset];

  v16 = [v7 currencyAmount];

  uint64_t v17 = [v16 amount];

  if (qword_100808DC0 != -1) {
    dispatch_once(&qword_100808DC0, &stru_100744140);
  }
  if (v15 == (id)3)
  {
    v45 = v9;
    v18 = [v11 remainingStatementBalance];
    uint64_t v24 = [v13 statementBalance];
    v20 = (void *)v24;
    if (v24) {
      v25 = (void *)v24;
    }
    else {
      v25 = v18;
    }
    id v22 = v25;
    if (v20 && v18 && [v18 compare:v20] == (id)-1)
    {
      v42 = v13;
      v23 = v12;
      id v33 = v18;

      id v22 = v33;
    }
    else
    {
      if (!v22) {
        goto LABEL_24;
      }
      v42 = v13;
      v23 = v12;
    }
    v34 = +[NSDecimalNumber zero];
    id v35 = [v34 compare:v22];

    if (v35 == (id)-1)
    {
      v12 = v23;
      if (a5 != 1)
      {
        if (!a5)
        {
LABEL_39:
          uint64_t v36 = PKLocalizedFeatureString();
          v37 = PKFormattedCurrencyStringFromNumber();
          v44 = (void *)v36;
          v29 = PKStringWithValidatedFormat();
          objc_super v9 = v45;
LABEL_42:

          goto LABEL_43;
        }
        goto LABEL_40;
      }
LABEL_41:
      uint64_t v38 = PKLocalizedFeatureString();
      v37 = PKFormattedCurrencyStringFromNumber();
      objc_super v9 = v45;
      [(id)qword_100808DB8 stringFromDate:v45];
      v39 = v41 = v12;
      v44 = (void *)v38;
      v29 = PKStringWithValidatedFormat();

      v12 = v41;
      goto LABEL_42;
    }
LABEL_36:
    v29 = 0;
    objc_super v9 = v45;
    v12 = v23;
LABEL_43:
    v13 = v42;
    goto LABEL_44;
  }
  if (v15 == (id)2)
  {
    v45 = v9;
    v18 = [v11 remainingMinimumPayment];
    uint64_t v19 = [v13 minimumDue];
    v20 = (void *)v19;
    if (v19) {
      v21 = (void *)v19;
    }
    else {
      v21 = v18;
    }
    id v22 = v21;
    if (v20 && v18 && [v18 compare:v20] == (id)-1)
    {
      v42 = v13;
      v23 = v12;
      id v30 = v18;

      id v22 = v30;
LABEL_30:
      objc_super v31 = +[NSDecimalNumber zero];
      id v32 = [v31 compare:v22];

      if (v32 == (id)-1)
      {
        v12 = v23;
        if (a5 != 1)
        {
          if (!a5) {
            goto LABEL_39;
          }
LABEL_40:
          v29 = 0;
          objc_super v9 = v45;
          goto LABEL_43;
        }
        goto LABEL_41;
      }
      goto LABEL_36;
    }
    if (v22)
    {
      v42 = v13;
      v23 = v12;
      goto LABEL_30;
    }
LABEL_24:
    v29 = 0;
    objc_super v9 = v45;
LABEL_44:

    goto LABEL_45;
  }
  if (!v17) {
    goto LABEL_28;
  }
  v26 = v12;
  uint64_t v27 = +[NSDecimalNumber zero];
  id v28 = [v27 compare:v17];

  if (v28 != (id)-1)
  {
    v29 = 0;
    v12 = v26;
    goto LABEL_46;
  }
  v12 = v26;
  if (a5 == 1)
  {
    v18 = PKLocalizedFeatureString();
    v20 = PKFormattedCurrencyStringFromNumber();
    id v22 = [(id)qword_100808DB8 stringFromDate:v9];
    v29 = PKStringWithValidatedFormat();
    goto LABEL_44;
  }
  if (a5)
  {
LABEL_28:
    v29 = 0;
    goto LABEL_46;
  }
  v18 = PKLocalizedFeatureString();
  v20 = PKFormattedCurrencyStringFromNumber();
  v29 = PKStringWithValidatedFormat();
LABEL_45:

LABEL_46:
  return v29;
}

- (BOOL)isValid
{
  v3 = [(PDAccountPaymentScheduledUserNotification *)self _titleString];
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
  v8.receiver = self;
  v8.super_class = (Class)PDAccountPaymentScheduledUserNotification;
  BOOL v4 = [(PDUserNotification *)&v8 notificationContentWithDataSource:a3];
  objc_super v5 = [(PDAccountPaymentScheduledUserNotification *)self _titleString];
  [v4 setSubtitle:v5];

  [v4 setBody:self->_messageString];
  id v6 = [(PDUserNotification *)self date];
  [v4 setDate:v6];

  return v4;
}

- (unint64_t)notificationType
{
  return 21;
}

- (unint64_t)featureIdentifier
{
  return self->_featureIdentifier;
}

- (NSString)messageString
{
  return self->_messageString;
}

- (void).cxx_destruct
{
}

@end