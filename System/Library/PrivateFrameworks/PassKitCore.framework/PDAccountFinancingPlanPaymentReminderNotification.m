@interface PDAccountFinancingPlanPaymentReminderNotification
+ (BOOL)supportsSecureCoding;
+ (id)notificationIdentifierForInstallment:(id)a3 reminderOffset:(unint64_t)a4;
- (BOOL)isValid;
- (PDAccountFinancingPlanPaymentReminderNotification)initWithCoder:(id)a3;
- (PDAccountFinancingPlanPaymentReminderNotification)initWithInstallment:(id)a3 financingPlan:(id)a4 accountCreatedDate:(id)a5 passUniqueIdentifier:(id)a6 reminderOffset:(unint64_t)a7;
- (id)applicationMessageContent;
- (id)notificationContentWithDataSource:(id)a3;
- (id)planIdentifier;
- (unint64_t)notificationType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PDAccountFinancingPlanPaymentReminderNotification

+ (id)notificationIdentifierForInstallment:(id)a3 reminderOffset:(unint64_t)a4
{
  v4 = 0;
  switch(a4)
  {
    case 0uLL:
      v4 = @"Today";
      goto LABEL_5;
    case 1uLL:
      v4 = @"1-Day-Before";
      goto LABEL_5;
    case 2uLL:
      v4 = @"5-Days-Before";
      goto LABEL_5;
    case 3uLL:
      goto LABEL_6;
    default:
LABEL_5:
      v5 = [a3 installmentIdentifier];
      v4 = +[NSString stringWithFormat:@"installmentPaymentReminder-%@-%@", v4, v5];

LABEL_6:
      return v4;
  }
}

- (PDAccountFinancingPlanPaymentReminderNotification)initWithInstallment:(id)a3 financingPlan:(id)a4 accountCreatedDate:(id)a5 passUniqueIdentifier:(id)a6 reminderOffset:(unint64_t)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  v17 = 0;
  if (v13 && v14 && a7 != 3)
  {
    if (!a7)
    {
      v18 = [v14 fundingSource];
      unsigned int v19 = [v18 autoPayment];

      if (v19)
      {
        v20 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Ignoring financing plan payment reminder notification with offset 'today' since its only applicable for plans with auto payment off", buf, 2u);
        }
        v17 = 0;
        goto LABEL_25;
      }
    }
    v41 = self;
    v38 = v14;
    id v39 = v16;
    v40 = +[NSDate date];
    v21 = [v13 dueDate];
    id v37 = v15;
    id v22 = v15;
    v23 = +[NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
    v24 = [v23 components:28 fromDate:v21];
    [v24 setHour:18];
    v25 = [v23 dateFromComponents:v24];
    v26 = v25;
    double v27 = 86400.0;
    if (a7 != 1) {
      double v27 = 0.0;
    }
    if (a7 == 2) {
      double v27 = 432000.0;
    }
    v28 = [v25 dateByAddingTimeInterval:-v27];

    if (v22)
    {
      [v22 timeIntervalSince1970];
      uint64_t v30 = [v28 dateByAddingTimeInterval:(double)(18000 * ((uint64_t)v29 / 18000) - (uint64_t)v29)];

      v28 = (void *)v30;
    }

    id v14 = v38;
    if (v28 && [v40 compare:v28] == (id)1)
    {
      v31 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v46 = v28;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Ignoring financing plan payment reminder notification with a fire date in the past: %@", buf, 0xCu);
      }
    }
    else
    {
      v31 = [(id)objc_opt_class() notificationIdentifierForInstallment:v13 reminderOffset:a7];
      if (v31)
      {
        v42.receiver = v41;
        v42.super_class = (Class)PDAccountFinancingPlanPaymentReminderNotification;
        v32 = [(PDUserNotification *)&v42 initWithNotificationIdentifier:v31 forPassUniqueIdentifier:v39];
        v33 = v32;
        if (v32)
        {
          objc_storeStrong((id *)&v32->_installment, a3);
          objc_storeStrong((id *)&v33->_financingPlan, a4);
          v33->_paymentReminderOffset = a7;
          [(PDUserNotification *)v33 setDate:v28];
          [(PDUserNotification *)v33 setCustomActionRoute:PKUserNotificationActionRoutePayLaterViewFinancingPlan];
          uint64_t v43 = PKUserNotificationActionQueryItemFinancingPlanIdentifier;
          v34 = [v38 planIdentifier];
          v44 = v34;
          v35 = +[NSDictionary dictionaryWithObjects:&v44 forKeys:&v43 count:1];
          [(PDUserNotification *)v33 setCustomActionQueryParameters:v35];
        }
        v17 = v33;
        v41 = v17;
        goto LABEL_24;
      }
    }
    v17 = 0;
LABEL_24:
    v20 = v40;

    id v15 = v37;
    id v16 = v39;
    self = v41;
LABEL_25:
  }
  return v17;
}

- (id)planIdentifier
{
  return [(PKPayLaterFinancingPlan *)self->_financingPlan planIdentifier];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PDAccountFinancingPlanPaymentReminderNotification)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PDAccountFinancingPlanPaymentReminderNotification;
  v5 = [(PDUserNotification *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"installment"];
    installment = v5->_installment;
    v5->_installment = (PKPayLaterInstallment *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"financingPlan"];
    financingPlan = v5->_financingPlan;
    v5->_financingPlan = (PKPayLaterFinancingPlan *)v8;

    v5->_paymentReminderOffset = (unint64_t)[v4 decodeIntegerForKey:@"paymentReminderOffset"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PDAccountFinancingPlanPaymentReminderNotification;
  id v4 = a3;
  [(PDUserNotification *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_installment, @"installment", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_financingPlan forKey:@"financingPlan"];
  [v4 encodeInteger:self->_paymentReminderOffset forKey:@"paymentReminderOffset"];
}

- (unint64_t)notificationType
{
  return 53;
}

- (BOOL)isValid
{
  return 1;
}

- (id)notificationContentWithDataSource:(id)a3
{
  v24.receiver = self;
  v24.super_class = (Class)PDAccountFinancingPlanPaymentReminderNotification;
  id v4 = a3;
  objc_super v5 = [(PDUserNotification *)&v24 notificationContentWithDataSource:v4];
  [(PDUserNotification *)self updatePassNameForNotificationContent:v5 dataSource:v4];

  if (qword_100808E28 != -1) {
    dispatch_once(&qword_100808E28, &stru_100748C48);
  }
  uint64_t v6 = [(PKPayLaterFinancingPlan *)self->_financingPlan fundingSource];
  unsigned int v7 = [v6 autoPayment];

  uint64_t v8 = [(PKPayLaterInstallment *)self->_installment currentBalance];
  v9 = [v8 formattedStringValue];

  v10 = [(PKPayLaterFinancingPlan *)self->_financingPlan merchant];
  objc_super v11 = [v10 displayName];

  v12 = [(PKPayLaterInstallment *)self->_installment dueDate];
  id v13 = [(id)qword_100808E20 stringFromDate:v12];
  id v14 = +[NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
  unint64_t paymentReminderOffset = self->_paymentReminderOffset;
  if (paymentReminderOffset == 2)
  {
    if (v7)
    {
      PKLocalizedCocoonString(@"NOTIFICATION_AUTO_PAYMENT_DUE_FIVE_DAYS_MESSAGE", @"%@%@%@", v9, v11, v13);
      unsigned int v19 = LABEL_14:;
      goto LABEL_19;
    }
    PKLocalizedCocoonString(@"NOTIFICATION_MANUAL_PAYMENT_DUE_FIVE_DAYS_MESSAGE", @"%@%@%@", v9, v11, v13);
    unsigned int v19 = LABEL_22:;
    goto LABEL_23;
  }
  if (paymentReminderOffset == 1)
  {
    if (v7)
    {
      PKLocalizedCocoonString(@"NOTIFICATION_AUTO_PAYMENT_DUE_TOMORROW_MESSAGE", @"%@%@", v9, v11);
      goto LABEL_14;
    }
    PKLocalizedCocoonString(@"NOTIFICATION_MANUAL_PAYMENT_DUE_TOMORROW_MESSAGE", @"%@%@", v9, v11);
    goto LABEL_22;
  }
  if (paymentReminderOffset)
  {
    unsigned int v19 = 0;
    if ((v7 & 1) == 0) {
      goto LABEL_23;
    }
LABEL_19:
    v20 = @"NOTIFICATION_AUTO_PAYMENT_REMINDER";
    goto LABEL_24;
  }
  id v16 = [(PDUserNotification *)self date];
  unsigned int v17 = [v14 isDate:v12 inSameDayAsDate:v16];

  if (v17)
  {
    if (PKPassbookIsSupported()) {
      v18 = @"NOTIFICATION_MANUAL_PAYMENT_DUE_TODAY_MESSAGE";
    }
    else {
      v18 = @"NOTIFICATION_MANUAL_PAYMENT_DUE_TODAY_MESSAGE_SETTINGS";
    }
  }
  else
  {
    v18 = @"NOTIFICATION_MANUAL_PAYMENT_DUE_TOMORROW_MESSAGE";
  }
  unsigned int v19 = PKLocalizedCocoonString(&v18->isa, @"%@%@", v9, v11);
  if (v7) {
    goto LABEL_19;
  }
LABEL_23:
  v20 = @"NOTIFICATION_PAYMENT_REMINDER";
LABEL_24:
  v21 = PKLocalizedCocoonString(&v20->isa);
  [v5 setSubtitle:v21];

  if (v19) {
    [v5 setBody:v19];
  }
  id v22 = [(PDUserNotification *)self date];
  [v5 setDate:v22];

  return v5;
}

- (id)applicationMessageContent
{
  v3 = [(PKPayLaterFinancingPlan *)self->_financingPlan fundingSource];
  unsigned __int8 v4 = [v3 autoPayment];

  if (v4)
  {
    objc_super v5 = 0;
  }
  else
  {
    uint64_t v6 = [(PKPayLaterInstallment *)self->_installment currentBalance];
    unsigned int v7 = [v6 formattedStringValue];

    if (self->_paymentReminderOffset)
    {
      objc_super v5 = 0;
    }
    else
    {
      uint64_t v8 = PKLocalizedCocoonString(@"PAY_LATER_GROUP_PAYMENT_DUE_TODAY_MESSAGE", @"%@", v7);
      v9 = PKLocalizedCocoonString(@"PAY_LATER_GROUP_PAYMENT_DUE_TODAY_TITLE");
      objc_super v5 = [(PDUserNotification *)self _payLaterApplicationMessageContentWithTitleText:v9 messageText:v8];
    }
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_financingPlan, 0);
  objc_storeStrong((id *)&self->_installment, 0);
}

@end