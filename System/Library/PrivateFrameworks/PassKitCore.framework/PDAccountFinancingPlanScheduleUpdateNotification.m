@interface PDAccountFinancingPlanScheduleUpdateNotification
+ (BOOL)supportsSecureCoding;
+ (id)notificationIdentifierForFinancingPlan:(id)a3 updateType:(int64_t)a4;
- (BOOL)isValid;
- (PDAccountFinancingPlanScheduleUpdateNotification)initWithCoder:(id)a3;
- (PDAccountFinancingPlanScheduleUpdateNotification)initWithFinancingPlan:(id)a3 updateType:(int64_t)a4 requiresGenericMessaging:(BOOL)a5 passUniqueIdentifier:(id)a6;
- (id)notificationContentWithDataSource:(id)a3;
- (id)planIdentifier;
- (unint64_t)notificationType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PDAccountFinancingPlanScheduleUpdateNotification

+ (id)notificationIdentifierForFinancingPlan:(id)a3 updateType:(int64_t)a4
{
  uint64_t v5 = [a3 planIdentifier];
  v6 = (void *)v5;
  if ((unint64_t)a4 > 4) {
    uint64_t v7 = 0;
  }
  else {
    uint64_t v7 = (uint64_t)*(&off_100748D38 + a4);
  }
  v8 = +[NSString stringWithFormat:@"financingPlanScheduleUpdate-%@-%@", v5, v7];

  return v8;
}

- (PDAccountFinancingPlanScheduleUpdateNotification)initWithFinancingPlan:(id)a3 updateType:(int64_t)a4 requiresGenericMessaging:(BOOL)a5 passUniqueIdentifier:(id)a6
{
  id v11 = a3;
  v12 = 0;
  if (v11 && a4)
  {
    id v13 = a6;
    v14 = [(id)objc_opt_class() notificationIdentifierForFinancingPlan:v11 updateType:a4];
    v20.receiver = self;
    v20.super_class = (Class)PDAccountFinancingPlanScheduleUpdateNotification;
    v15 = [(PDUserNotification *)&v20 initWithNotificationIdentifier:v14 forPassUniqueIdentifier:v13];

    if (v15)
    {
      objc_storeStrong((id *)&v15->_financingPlan, a3);
      v15->_updateType = a4;
      v15->_requiresGenericMessaging = a5;
      v16 = +[NSDate date];
      [(PDUserNotification *)v15 setDate:v16];

      [(PDUserNotification *)v15 setCustomActionRoute:PKUserNotificationActionRoutePayLaterViewFinancingPlan];
      uint64_t v21 = PKUserNotificationActionQueryItemFinancingPlanIdentifier;
      v17 = [v11 planIdentifier];
      v22 = v17;
      v18 = +[NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
      [(PDUserNotification *)v15 setCustomActionQueryParameters:v18];
    }
    self = v15;

    v12 = self;
  }

  return v12;
}

- (id)planIdentifier
{
  return [(PKPayLaterFinancingPlan *)self->_financingPlan planIdentifier];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PDAccountFinancingPlanScheduleUpdateNotification)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PDAccountFinancingPlanScheduleUpdateNotification;
  uint64_t v5 = [(PDUserNotification *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"financingPlan"];
    financingPlan = v5->_financingPlan;
    v5->_financingPlan = (PKPayLaterFinancingPlan *)v6;

    v5->_updateType = (int64_t)[v4 decodeIntegerForKey:@"updateType"];
    v5->_requiresGenericMessaging = [v4 decodeBoolForKey:@"requiresGenericMessaging"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PDAccountFinancingPlanScheduleUpdateNotification;
  id v4 = a3;
  [(PDUserNotification *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_financingPlan, @"financingPlan", v5.receiver, v5.super_class);
  [v4 encodeInteger:self->_updateType forKey:@"updateType"];
  [v4 encodeBool:self->_requiresGenericMessaging forKey:@"requiresGenericMessaging"];
}

- (unint64_t)notificationType
{
  return 55;
}

- (BOOL)isValid
{
  return self->_updateType != 0;
}

- (id)notificationContentWithDataSource:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)PDAccountFinancingPlanScheduleUpdateNotification;
  id v4 = a3;
  objc_super v5 = [(PDUserNotification *)&v12 notificationContentWithDataSource:v4];
  [(PDUserNotification *)self updatePassNameForNotificationContent:v5 dataSource:v4];

  uint64_t v6 = [(PKPayLaterFinancingPlan *)self->_financingPlan merchant];
  uint64_t v7 = [v6 displayName];

  switch(self->_updateType)
  {
    case 1:
      v8 = PKLocalizedCocoonString(@"NOTIFICATION_FINANCING_PLAN_SCHEDULE_UPDATE_TITLE");
      uint64_t v9 = PKLocalizedCocoonString(@"NOTIFICATION_FINANCING_PLAN_SCHEDULE_UPDATE_MESSAGE");
      goto LABEL_10;
    case 2:
      v8 = PKLocalizedCocoonString(@"NOTIFICATION_FINANCING_PLAN_AMOUNT_INCREASED_TITLE");
      PKLocalizedCocoonString(@"NOTIFICATION_FINANCING_PLAN_AMOUNT_INCREASED_MESSAGE", @"%@", v7);
      goto LABEL_9;
    case 3:
      v8 = PKLocalizedCocoonString(@"NOTIFICATION_FINANCING_PLAN_DEFERRAL_TITLE");
      PKLocalizedCocoonString(@"NOTIFICATION_FINANCING_PLAN_DEFERRAL_MESSAGE", @"%@", v7);
      goto LABEL_9;
    case 4:
      if (self->_requiresGenericMessaging)
      {
        +[PDAccountFinancingPlanPaymentNotification updateNotificationContentWithGenericMessaging:v5];
      }
      else
      {
        v8 = PKLocalizedCocoonString(@"NOTIFICATION_PAYMENT_REVERSED_TITLE");
        PKLocalizedCocoonString(@"NOTIFICATION_PAYMENT_REVERSED_MESSAGE", @"%@", v7);
        uint64_t v9 = LABEL_9:;
LABEL_10:
        v10 = (void *)v9;
        if (v9) {
          [v5 setBody:v9];
        }
        if (v8)
        {
          [v5 setSubtitle:v8];
        }
LABEL_14:
      }
      return v5;
    default:
      v10 = 0;
      goto LABEL_14;
  }
}

- (void).cxx_destruct
{
}

@end