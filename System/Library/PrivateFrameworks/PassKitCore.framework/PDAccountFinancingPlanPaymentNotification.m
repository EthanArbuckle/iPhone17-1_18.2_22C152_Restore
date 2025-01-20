@interface PDAccountFinancingPlanPaymentNotification
+ (BOOL)supportsSecureCoding;
+ (id)notificationIdentifierForPayment:(id)a3;
+ (void)updateNotificationContentWithGenericMessaging:(id)a3;
- (BOOL)isValid;
- (PDAccountFinancingPlanPaymentNotification)initWithCoder:(id)a3;
- (PDAccountFinancingPlanPaymentNotification)initWithFinancingPlan:(id)a3 payment:(id)a4 requiresGenericMessaging:(BOOL)a5 passUniqueIdentifier:(id)a6;
- (id)applicationMessageContent;
- (id)notificationContentWithDataSource:(id)a3;
- (unint64_t)notificationType;
- (void)_updateContentForPaymentAdjustmentType:(id)a3;
- (void)_updateContentForPaymentDeclinedType:(id)a3;
- (void)_updateContentForPaymentRefundType:(id)a3;
- (void)_updateContentForPaymentType:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PDAccountFinancingPlanPaymentNotification

+ (void)updateNotificationContentWithGenericMessaging:(id)a3
{
  id v6 = a3;
  v3 = PKLocalizedCocoonString(@"NOTIFICATION_PAST_DUE_GENERIC_TITLE");
  [v6 setSubtitle:v3];

  if (PKPassbookIsSupported()) {
    v4 = @"NOTIFICATION_PAST_DUE_GENERIC_MESSAGE";
  }
  else {
    v4 = @"NOTIFICATION_PAST_DUE_GENERIC_MESSAGE_SETTINGS";
  }
  v5 = PKLocalizedCocoonString(&v4->isa);
  [v6 setBody:v5];
}

+ (id)notificationIdentifierForPayment:(id)a3
{
  id v3 = a3;
  [v3 type];
  v4 = PKPayLaterPaymentTypeToString();
  v5 = [v3 paymentIdentifier];

  id v6 = +[NSString stringWithFormat:@"financingPlanPayment-%@-%@", v4, v5];

  return v6;
}

- (PDAccountFinancingPlanPaymentNotification)initWithFinancingPlan:(id)a3 payment:(id)a4 requiresGenericMessaging:(BOOL)a5 passUniqueIdentifier:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  v13 = v12;
  v14 = 0;
  if (v11 && v12)
  {
    id v15 = a6;
    v16 = [(id)objc_opt_class() notificationIdentifierForPayment:v13];
    v21.receiver = self;
    v21.super_class = (Class)PDAccountFinancingPlanPaymentNotification;
    v17 = [(PDUserNotification *)&v21 initWithNotificationIdentifier:v16 forPassUniqueIdentifier:v15];

    if (v17)
    {
      objc_storeStrong((id *)&v17->_payment, a4);
      objc_storeStrong((id *)&v17->_financingPlan, a3);
      v17->_requiresGenericMessaging = a5;
      [(PDUserNotification *)v17 setCustomActionRoute:PKUserNotificationActionRoutePayLaterViewFinancingPlan];
      uint64_t v22 = PKUserNotificationActionQueryItemFinancingPlanIdentifier;
      v18 = [v11 planIdentifier];
      v23 = v18;
      v19 = +[NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];
      [(PDUserNotification *)v17 setCustomActionQueryParameters:v19];
    }
    self = v17;

    v14 = self;
  }

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PDAccountFinancingPlanPaymentNotification)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PDAccountFinancingPlanPaymentNotification;
  v5 = [(PDUserNotification *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"payment"];
    payment = v5->_payment;
    v5->_payment = (PKPayLaterPayment *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"financingPlan"];
    financingPlan = v5->_financingPlan;
    v5->_financingPlan = (PKPayLaterFinancingPlan *)v8;

    v5->_requiresGenericMessaging = [v4 decodeBoolForKey:@"requiresGenericMessaging"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PDAccountFinancingPlanPaymentNotification;
  id v4 = a3;
  [(PDUserNotification *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_payment, @"payment", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_financingPlan forKey:@"financingPlan"];
  [v4 encodeBool:self->_requiresGenericMessaging forKey:@"account"];
}

- (unint64_t)notificationType
{
  return 51;
}

- (BOOL)isValid
{
  return 1;
}

- (id)notificationContentWithDataSource:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PDAccountFinancingPlanPaymentNotification;
  id v4 = a3;
  objc_super v5 = [(PDUserNotification *)&v8 notificationContentWithDataSource:v4];
  -[PDUserNotification updatePassNameForNotificationContent:dataSource:](self, "updatePassNameForNotificationContent:dataSource:", v5, v4, v8.receiver, v8.super_class);

  switch((unint64_t)[(PKPayLaterPayment *)self->_payment type])
  {
    case 1uLL:
      [(PDAccountFinancingPlanPaymentNotification *)self _updateContentForPaymentType:v5];
      break;
    case 3uLL:
      [(PDAccountFinancingPlanPaymentNotification *)self _updateContentForPaymentRefundType:v5];
      break;
    case 5uLL:
      [(PDAccountFinancingPlanPaymentNotification *)self _updateContentForPaymentDeclinedType:v5];
      break;
    case 7uLL:
      [(PDAccountFinancingPlanPaymentNotification *)self _updateContentForPaymentAdjustmentType:v5];
      break;
    default:
      break;
  }
  uint64_t v6 = +[NSDate date];
  [v5 setDate:v6];

  return v5;
}

- (id)applicationMessageContent
{
  if ([(PKPayLaterPayment *)self->_payment type] == (id)5)
  {
    id v3 = [(PKPayLaterPayment *)self->_payment amount];
    id v4 = [v3 formattedStringValue];

    objc_super v5 = PKLocalizedCocoonString(@"PAY_LATER_GROUP_PAYMENT_DECLINED_MESSAGE", @"%@", v4);
    uint64_t v6 = PKLocalizedCocoonString(@"PAY_LATER_GROUP_PAYMENT_DECLINED_TITLE");
    v7 = [(PDUserNotification *)self _payLaterApplicationMessageContentWithTitleText:v6 messageText:v5];
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (void)_updateContentForPaymentType:(id)a3
{
  id v23 = a3;
  if ([(PKPayLaterPayment *)self->_payment type] == (id)1)
  {
    id v4 = [(PKPayLaterFinancingPlan *)self->_financingPlan scheduleSummary];
    unsigned int v5 = 1;
    uint64_t v6 = [v4 paymentsOfType:1];
    v7 = [v6 sortedArrayUsingComparator:&stru_100748C28];

    objc_super v8 = [v7 firstObject];
    v9 = [v8 paymentIdentifier];
    v10 = [(PKPayLaterPayment *)self->_payment paymentIdentifier];
    id v11 = v9;
    id v12 = v10;
    v13 = v12;
    if (v11 != v12)
    {
      if (v11) {
        BOOL v14 = v12 == 0;
      }
      else {
        BOOL v14 = 1;
      }
      if (v14) {
        unsigned int v5 = 0;
      }
      else {
        unsigned int v5 = [v11 isEqualToString:v12];
      }
    }

    id v15 = [(PKPayLaterPayment *)self->_payment amount];
    v16 = [v15 formattedStringValue];

    v17 = [(PKPayLaterFinancingPlan *)self->_financingPlan merchant];
    v18 = [v17 displayName];

    if (v5)
    {
      v19 = PKLocalizedCocoonString(@"NOTIFICATION_FIRST_PAYMENT_TITLE");
      [v23 setSubtitle:v19];

      if (PKPassbookIsSupported()) {
        v20 = @"NOTIFICATION_FIRST_PAYMENT_MESSAGE";
      }
      else {
        v20 = @"NOTIFICATION_FIRST_PAYMENT_MESSAGE_SETTINGS";
      }
      PKLocalizedCocoonString(&v20->isa, @"%@", v18);
    }
    else
    {
      objc_super v21 = PKLocalizedCocoonString(@"NOTIFICATION_OTHER_PAYMENT_TITLE");
      [v23 setSubtitle:v21];

      PKLocalizedCocoonString(@"NOTIFICATION_OTHER_PAYMENT_MESSAGE", @"%@%@", v16, v18);
    uint64_t v22 = };
    [v23 setBody:v22];
  }
}

- (void)_updateContentForPaymentDeclinedType:(id)a3
{
  id v10 = a3;
  if ([(PKPayLaterPayment *)self->_payment type] == (id)5)
  {
    if (self->_requiresGenericMessaging)
    {
      [(id)objc_opt_class() updateNotificationContentWithGenericMessaging:v10];
    }
    else
    {
      id v4 = [(PKPayLaterPayment *)self->_payment amount];
      unsigned int v5 = [v4 formattedStringValue];

      uint64_t v6 = [(PKPayLaterFinancingPlan *)self->_financingPlan merchant];
      v7 = [v6 displayName];

      objc_super v8 = PKLocalizedCocoonString(@"NOTIFICATION_PAYMENT_DECLINED_TITLE");
      [v10 setSubtitle:v8];

      v9 = PKLocalizedCocoonString(@"NOTIFICATION_PAYMENT_DECLINED_MESSAGE", @"%@%@", v5, v7);
      [v10 setBody:v9];
    }
  }
}

- (void)_updateContentForPaymentRefundType:(id)a3
{
  id v14 = a3;
  BOOL v4 = [(PKPayLaterPayment *)self->_payment type] == (id)3;
  unsigned int v5 = v14;
  if (v4)
  {
    if (self->_requiresGenericMessaging)
    {
      [(id)objc_opt_class() updateNotificationContentWithGenericMessaging:v14];
    }
    else
    {
      uint64_t v6 = [(PKPayLaterPayment *)self->_payment amount];
      v7 = [v6 formattedStringValue];

      objc_super v8 = [(PKPayLaterFinancingPlan *)self->_financingPlan merchant];
      v9 = [v8 displayName];

      id v10 = [(PKPayLaterPayment *)self->_payment subtype];
      if ((unint64_t)v10 > 4)
      {
        id v12 = 0;
        v13 = 0;
      }
      else
      {
        id v11 = (NSString *)*(&off_100748DA0 + (void)v10);
        id v12 = PKLocalizedCocoonString(&(*(&off_100748D78 + (void)v10))->isa, @"%@%@", v7, v9);
        v13 = PKLocalizedCocoonString(v11);
      }
      [v14 setSubtitle:v13];
      [v14 setBody:v12];
    }
    unsigned int v5 = v14;
  }
}

- (void)_updateContentForPaymentAdjustmentType:(id)a3
{
  id v10 = a3;
  if ([(PKPayLaterPayment *)self->_payment type] == (id)7
    && [(PKPayLaterPayment *)self->_payment subtype]
    && [(PKPayLaterPayment *)self->_payment subtype] != (id)1)
  {
    if (self->_requiresGenericMessaging)
    {
      [(id)objc_opt_class() updateNotificationContentWithGenericMessaging:v10];
    }
    else
    {
      BOOL v4 = [(PKPayLaterFinancingPlan *)self->_financingPlan merchant];
      unsigned int v5 = [v4 displayName];

      uint64_t v6 = (char *)[(PKPayLaterPayment *)self->_payment subtype] - 2;
      if ((unint64_t)v6 > 2)
      {
        objc_super v8 = 0;
        v9 = 0;
      }
      else
      {
        v7 = (NSString *)*(&off_100748C98 + (void)v6);
        objc_super v8 = PKLocalizedCocoonString(&(*(&off_100748C80 + (void)v6))->isa, @"%@", v5);
        v9 = PKLocalizedCocoonString(v7);
      }
      [v10 setSubtitle:v9];
      [v10 setBody:v8];
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payment, 0);
  objc_storeStrong((id *)&self->_financingPlan, 0);
}

@end