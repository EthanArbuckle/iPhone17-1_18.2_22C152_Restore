@interface PDAccountFinancingPlanPastDueNotification
+ (BOOL)supportsSecureCoding;
+ (id)notificationIdentifierForFinancingPlan:(id)a3 daysPastDueEnum:(int64_t)a4;
- (BOOL)isValid;
- (PDAccountFinancingPlanPastDueNotification)initWithCoder:(id)a3;
- (PDAccountFinancingPlanPastDueNotification)initWithFinancingPlan:(id)a3 requiresGenericMessaging:(BOOL)a4 daysPastDue:(int64_t)a5 passUniqueIdentifier:(id)a6;
- (id)_bodyStringForBNPL;
- (id)applicationMessageContent;
- (id)notificationContentWithDataSource:(id)a3;
- (id)planIdentifier;
- (unint64_t)notificationType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PDAccountFinancingPlanPastDueNotification

+ (id)notificationIdentifierForFinancingPlan:(id)a3 daysPastDueEnum:(int64_t)a4
{
  uint64_t v5 = [a3 planIdentifier];
  v6 = (void *)v5;
  if ((unint64_t)a4 > 0x10) {
    uint64_t v7 = 0;
  }
  else {
    uint64_t v7 = (uint64_t)*(&off_100748CB0 + a4);
  }
  v8 = +[NSString stringWithFormat:@"financingPlanPastDue-%@-%@", v5, v7];

  return v8;
}

- (PDAccountFinancingPlanPastDueNotification)initWithFinancingPlan:(id)a3 requiresGenericMessaging:(BOOL)a4 daysPastDue:(int64_t)a5 passUniqueIdentifier:(id)a6
{
  id v11 = a3;
  id v12 = a6;
  if (a5 > 55)
  {
    if (a5 > 83)
    {
      if (a5 > 104)
      {
        if (a5 != 105)
        {
          if (a5 != 112) {
            goto LABEL_63;
          }
          uint64_t v13 = 16;
          if (!v11) {
            goto LABEL_63;
          }
          goto LABEL_52;
        }
        uint64_t v13 = 15;
        if (v11) {
          goto LABEL_52;
        }
      }
      else
      {
        if (a5 != 84)
        {
          if (a5 != 98) {
            goto LABEL_63;
          }
          uint64_t v13 = 14;
          if (!v11) {
            goto LABEL_63;
          }
          goto LABEL_52;
        }
        uint64_t v13 = 13;
        if (v11) {
          goto LABEL_52;
        }
      }
    }
    else if (a5 > 69)
    {
      if (a5 != 70)
      {
        if (a5 != 77) {
          goto LABEL_63;
        }
        uint64_t v13 = 12;
        if (!v11) {
          goto LABEL_63;
        }
        goto LABEL_52;
      }
      uint64_t v13 = 11;
      if (v11) {
        goto LABEL_52;
      }
    }
    else
    {
      if (a5 != 56)
      {
        if (a5 != 63) {
          goto LABEL_63;
        }
        uint64_t v13 = 10;
        if (!v11) {
          goto LABEL_63;
        }
        goto LABEL_52;
      }
      uint64_t v13 = 9;
      if (v11) {
        goto LABEL_52;
      }
    }
    goto LABEL_63;
  }
  if (a5 > 27)
  {
    if (a5 > 41)
    {
      if (a5 != 42)
      {
        if (a5 != 49) {
          goto LABEL_63;
        }
        uint64_t v13 = 7;
        if (!v11) {
          goto LABEL_63;
        }
        goto LABEL_52;
      }
      uint64_t v13 = 6;
      goto LABEL_51;
    }
    if (a5 != 28)
    {
      if (a5 != 35) {
        goto LABEL_63;
      }
      uint64_t v13 = 5;
      if (!v11) {
        goto LABEL_63;
      }
      goto LABEL_52;
    }
    uint64_t v13 = 4;
    if (v11) {
      goto LABEL_52;
    }
LABEL_63:
    v26 = 0;
    goto LABEL_64;
  }
  if (a5 > 13)
  {
    if (a5 != 14)
    {
      if (a5 != 21) {
        goto LABEL_63;
      }
      uint64_t v13 = 3;
      if (!v11) {
        goto LABEL_63;
      }
      goto LABEL_52;
    }
    uint64_t v13 = 2;
    if (v11) {
      goto LABEL_52;
    }
    goto LABEL_63;
  }
  uint64_t v13 = 0;
  if (a5 == 1)
  {
LABEL_51:
    if (v11) {
      goto LABEL_52;
    }
    goto LABEL_63;
  }
  if (a5 != 7) {
    goto LABEL_63;
  }
  uint64_t v13 = 1;
  if (!v11) {
    goto LABEL_63;
  }
LABEL_52:
  v14 = [v11 planSummary];
  v15 = [v14 pastDueAmount];

  if (v15)
  {
    BOOL v28 = a4;
    id v29 = v12;
    v16 = +[NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
    v17 = +[NSDate date];
    v18 = [v16 components:28 fromDate:v17];
    [v18 setHour:18];
    v19 = [v16 dateFromComponents:v18];
    if ([v19 compare:v17] != (id)1)
    {
      id v20 = v17;

      v19 = v20;
    }
    v21 = [(id)objc_opt_class() notificationIdentifierForFinancingPlan:v11 daysPastDueEnum:v13];
    v30.receiver = self;
    v30.super_class = (Class)PDAccountFinancingPlanPastDueNotification;
    v22 = [(PDUserNotification *)&v30 initWithNotificationIdentifier:v21 forPassUniqueIdentifier:v29];
    v23 = v22;
    if (v22)
    {
      objc_storeStrong((id *)&v22->_financingPlan, a3);
      v23->_requiresGenericMessaging = v28;
      v23->_daysPastDue = v13;
      [(PDUserNotification *)v23 setDate:v19];
      [(PDUserNotification *)v23 setCustomActionRoute:PKUserNotificationActionRoutePayLaterViewFinancingPlan];
      uint64_t v32 = PKUserNotificationActionQueryItemFinancingPlanIdentifier;
      v24 = [v11 planIdentifier];
      v33 = v24;
      v25 = +[NSDictionary dictionaryWithObjects:&v33 forKeys:&v32 count:1];
      [(PDUserNotification *)v23 setCustomActionQueryParameters:v25];

      [(PDUserNotification *)v23 setPreventAutomaticDismissal:1];
    }
    self = v23;

    v26 = self;
    id v12 = v29;
  }
  else
  {
    v16 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Cannot create financing plan past due notification for a nil pastDueAmount", buf, 2u);
    }
    v26 = 0;
  }

LABEL_64:
  return v26;
}

- (id)planIdentifier
{
  return [(PKPayLaterFinancingPlan *)self->_financingPlan planIdentifier];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PDAccountFinancingPlanPastDueNotification)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PDAccountFinancingPlanPastDueNotification;
  uint64_t v5 = [(PDUserNotification *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"financingPlan"];
    financingPlan = v5->_financingPlan;
    v5->_financingPlan = (PKPayLaterFinancingPlan *)v6;

    v5->_requiresGenericMessaging = [v4 decodeBoolForKey:@"requiresGenericMessaging"];
    v5->_daysPastDue = (int64_t)[v4 decodeIntegerForKey:@"daysPastDue"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PDAccountFinancingPlanPastDueNotification;
  id v4 = a3;
  [(PDUserNotification *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_financingPlan, @"financingPlan", v5.receiver, v5.super_class);
  [v4 encodeBool:self->_requiresGenericMessaging forKey:@"requiresGenericMessaging"];
  [v4 encodeInteger:self->_daysPastDue forKey:@"daysPastDue"];
}

- (unint64_t)notificationType
{
  return 54;
}

- (BOOL)isValid
{
  return 1;
}

- (id)notificationContentWithDataSource:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PDAccountFinancingPlanPastDueNotification;
  id v4 = a3;
  objc_super v5 = [(PDUserNotification *)&v9 notificationContentWithDataSource:v4];
  -[PDUserNotification updatePassNameForNotificationContent:dataSource:](self, "updatePassNameForNotificationContent:dataSource:", v5, v4, v9.receiver, v9.super_class);

  if (self->_requiresGenericMessaging)
  {
    +[PDAccountFinancingPlanPaymentNotification updateNotificationContentWithGenericMessaging:v5];
  }
  else
  {
    uint64_t v6 = PKLocalizedCocoonString(@"NOTIFICATION_YOUR_ACCOUNT_NEEDS_ATTENTION");
    if ([(PKPayLaterFinancingPlan *)self->_financingPlan productType] == (id)1)
    {
      uint64_t v7 = [(PDAccountFinancingPlanPastDueNotification *)self _bodyStringForBNPL];
      [v5 setSubtitle:v6];
      if (v7)
      {
        [v5 setBody:v7];
      }
    }
    else
    {
      [v5 setSubtitle:v6];
    }
  }
  return v5;
}

- (id)applicationMessageContent
{
  v3 = [(PKPayLaterFinancingPlan *)self->_financingPlan planSummary];
  id v4 = [v3 pastDueAmount];

  objc_super v5 = [v4 formattedStringValue];
  uint64_t v6 = PKLocalizedCocoonString(@"PAY_LATER_GROUP_PAYMENT_PAST_DUE_MESSAGE", @"%@", v5);

  uint64_t v7 = PKLocalizedCocoonString(@"PAY_LATER_GROUP_PAYMENT_PAST_DUE_TITLE");
  v8 = [(PDUserNotification *)self _payLaterApplicationMessageContentWithTitleText:v7 messageText:v6];

  return v8;
}

- (id)_bodyStringForBNPL
{
  if ([(PKPayLaterFinancingPlan *)self->_financingPlan productType] == (id)1)
  {
    v3 = [(PKPayLaterFinancingPlan *)self->_financingPlan planSummary];
    id v4 = [v3 pastDueAmount];

    switch(self->_daysPastDue)
    {
      case 0:
        int IsSupported = PKPassbookIsSupported();
        v10 = @"NOTIFICATION_BNPL_ONE_DAY_PAST_DUE_MESSAGE";
        if (!IsSupported) {
          v10 = @"NOTIFICATION_BNPL_ONE_DAY_PAST_DUE_MESSAGE_SETTINGS";
        }
        id v11 = v10;
        id v12 = [v4 formattedStringValue];
        uint64_t v6 = PKLocalizedCocoonString(v11, @"%@", v12);

        break;
      case 1:
      case 5:
      case 9:
      case 0xDLL:
        if (PKPassbookIsSupported()) {
          objc_super v5 = @"NOTIFICATION_BNPL_SEVEN_DAYS_PAST_DUE_MESSAGE";
        }
        else {
          objc_super v5 = @"NOTIFICATION_BNPL_SEVEN_DAYS_PAST_DUE_MESSAGE_SETTINGS";
        }
        goto LABEL_10;
      case 2:
      case 6:
      case 0xALL:
      case 0xELL:
        objc_super v5 = @"NOTIFICATION_BNPL_FOURTEEN_DAYS_PAST_DUE_MESSAGE";
        goto LABEL_10;
      case 3:
      case 7:
      case 0xBLL:
      case 0xFLL:
        uint64_t v7 = [v4 formattedStringValue];
        uint64_t v6 = PKLocalizedCocoonString(@"NOTIFICATION_BNPL_TWENTY_ONE_DAYS_PAST_DUE_MESSAGE", @"%@", v7);

        break;
      case 4:
      case 8:
      case 0xCLL:
      case 0x10:
        objc_super v5 = @"NOTIFICATION_BNPL_TWENTY_SEVEN_DAYS_PAST_DUE_MESSAGE";
LABEL_10:
        uint64_t v6 = PKLocalizedCocoonString(&v5->isa);
        break;
      default:
        uint64_t v6 = 0;
        break;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }
  return v6;
}

- (void).cxx_destruct
{
}

@end