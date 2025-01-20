@interface PDAccountFinancingPlanUserNotification
+ (BOOL)supportsSecureCoding;
+ (id)notificationIdentifierForFinancingPlan:(id)a3 updateType:(int64_t)a4;
- (BOOL)isValid;
- (PDAccountFinancingPlanUserNotification)initWithCoder:(id)a3;
- (PDAccountFinancingPlanUserNotification)initWithFinancingPlan:(id)a3 updateType:(int64_t)a4 passUniqueIdentifier:(id)a5;
- (id)applicationMessageContent;
- (id)notificationContentWithDataSource:(id)a3;
- (unint64_t)notificationType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PDAccountFinancingPlanUserNotification

+ (id)notificationIdentifierForFinancingPlan:(id)a3 updateType:(int64_t)a4
{
  uint64_t v5 = [a3 planIdentifier];
  v6 = (void *)v5;
  if ((unint64_t)a4 > 2) {
    uint64_t v7 = 0;
  }
  else {
    uint64_t v7 = (uint64_t)*(&off_100748C68 + a4);
  }
  v8 = +[NSString stringWithFormat:@"financingPlan-%@-updateType-%@", v5, v7];

  return v8;
}

- (PDAccountFinancingPlanUserNotification)initWithFinancingPlan:(id)a3 updateType:(int64_t)a4 passUniqueIdentifier:(id)a5
{
  id v9 = a3;
  v10 = 0;
  if (v9 && a4)
  {
    id v11 = a5;
    v12 = [(id)objc_opt_class() notificationIdentifierForFinancingPlan:v9 updateType:a4];
    v17.receiver = self;
    v17.super_class = (Class)PDAccountFinancingPlanUserNotification;
    v13 = [(PDUserNotification *)&v17 initWithNotificationIdentifier:v12 forPassUniqueIdentifier:v11];

    if (v13)
    {
      objc_storeStrong((id *)&v13->_financingPlan, a3);
      v13->_updateType = a4;
      [(PDUserNotification *)v13 setCustomActionRoute:PKUserNotificationActionRoutePayLaterViewFinancingPlan];
      uint64_t v18 = PKUserNotificationActionQueryItemFinancingPlanIdentifier;
      v14 = [v9 planIdentifier];
      v19 = v14;
      v15 = +[NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
      [(PDUserNotification *)v13 setCustomActionQueryParameters:v15];
    }
    self = v13;

    v10 = self;
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PDAccountFinancingPlanUserNotification)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PDAccountFinancingPlanUserNotification;
  uint64_t v5 = [(PDUserNotification *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"financingPlan"];
    financingPlan = v5->_financingPlan;
    v5->_financingPlan = (PKPayLaterFinancingPlan *)v6;

    v5->_updateType = (int64_t)[v4 decodeIntegerForKey:@"updateType"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PDAccountFinancingPlanUserNotification;
  id v4 = a3;
  [(PDUserNotification *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_financingPlan, @"financingPlan", v5.receiver, v5.super_class);
  [v4 encodeInteger:self->_updateType forKey:@"updateType"];
}

- (unint64_t)notificationType
{
  return 44;
}

- (BOOL)isValid
{
  return self->_updateType != 0;
}

- (id)notificationContentWithDataSource:(id)a3
{
  v15.receiver = self;
  v15.super_class = (Class)PDAccountFinancingPlanUserNotification;
  id v4 = a3;
  objc_super v5 = [(PDUserNotification *)&v15 notificationContentWithDataSource:v4];
  [(PDUserNotification *)self updatePassNameForNotificationContent:v5 dataSource:v4];

  uint64_t v6 = +[NSDate date];
  int64_t updateType = self->_updateType;
  if (updateType == 2)
  {
    v8 = PKLocalizedCocoonString(@"NOTIFICATION_PAYMENT_CANCELED_TITLE");
    v10 = PKLocalizedCocoonString(@"NOTIFICATION_PAYMENT_CANCELED_MESSAGE_NO_MERCHANT");
    id v11 = [(PKPayLaterFinancingPlan *)self->_financingPlan merchant];
    v12 = [v11 displayName];
    if (v11 && ([v11 displayNameIsFallbackString] & 1) == 0 && v12)
    {
      uint64_t v13 = PKLocalizedCocoonString(@"NOTIFICATION_PAYMENT_CANCELED_MESSAGE", @"%@", v12);

      v10 = (void *)v13;
    }
  }
  else
  {
    if (updateType != 1)
    {
      v8 = 0;
      v10 = 0;
      goto LABEL_16;
    }
    v8 = PKLocalizedCocoonString(@"NOTIFICATION_NEW_PURCHASE_TITLE");
    if (PKPassbookIsSupported()) {
      objc_super v9 = @"NOTIFICATION_NEW_PURCHASE_MESSAGE";
    }
    else {
      objc_super v9 = @"NOTIFICATION_NEW_PURCHASE_MESSAGE_SETTINGS";
    }
    v10 = PKLocalizedCocoonString(&v9->isa);
    id v11 = [(PKPayLaterFinancingPlan *)self->_financingPlan planSummary];
    [v11 transactionDate];
    uint64_t v6 = v12 = v6;
  }

  if (v8) {
    [v5 setSubtitle:v8];
  }
  if (v10) {
    [v5 setBody:v10];
  }
LABEL_16:
  [v5 setDate:v6];

  return v5;
}

- (id)applicationMessageContent
{
  v3 = [(PKPayLaterFinancingPlan *)self->_financingPlan merchant];
  id v4 = [v3 displayName];
  if (v3) {
    unsigned int v5 = [v3 displayNameIsFallbackString] ^ 1;
  }
  else {
    unsigned int v5 = 0;
  }
  int64_t updateType = self->_updateType;
  if (updateType == 2)
  {
    v8 = PKLocalizedCocoonString(@"PAY_LATER_GROUP_CANCELED_FINANCING_PLAN_MESSAGE_NO_MERCHANT");
    if (v5)
    {
      uint64_t v14 = PKLocalizedCocoonString(@"PAY_LATER_GROUP_CANCELED_FINANCING_PLAN_MESSAGE", @"%@", v4);

      v8 = (void *)v14;
    }
    v10 = PKLocalizedCocoonString(@"PAY_LATER_GROUP_CANCELED_FINANCING_PLAN_TITLE");
    id v11 = self;
    v12 = v10;
    uint64_t v13 = v8;
    goto LABEL_12;
  }
  if (updateType == 1)
  {
    id v7 = v4;
    v8 = v7;
    if (v5)
    {
      uint64_t v9 = PKLocalizedCocoonString(@"PAY_LATER_GROUP_NEW_FINANCING_PLAN_TITLE", @"%@", v7);

      v8 = (void *)v9;
    }
    v10 = PKLocalizedCocoonString(@"PAY_LATER_GROUP_NEW_FINANCING_PLAN_MESSAGE");
    id v11 = self;
    v12 = v8;
    uint64_t v13 = v10;
LABEL_12:
    objc_super v15 = [(PDUserNotification *)v11 _payLaterApplicationMessageContentWithTitleText:v12 messageText:v13];

    goto LABEL_14;
  }
  objc_super v15 = 0;
LABEL_14:

  return v15;
}

- (void).cxx_destruct
{
}

@end