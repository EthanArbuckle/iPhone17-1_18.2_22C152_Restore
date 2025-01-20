@interface PDAccountFinancingPlanPaidOffNotification
+ (BOOL)supportsSecureCoding;
+ (id)notificationIdentifierForFinancingPlan:(id)a3;
- (BOOL)isValid;
- (PDAccountFinancingPlanPaidOffNotification)initWithCoder:(id)a3;
- (PDAccountFinancingPlanPaidOffNotification)initWithFinancingPlan:(id)a3 passUniqueIdentifier:(id)a4;
- (id)notificationContentWithDataSource:(id)a3;
- (unint64_t)notificationType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PDAccountFinancingPlanPaidOffNotification

+ (id)notificationIdentifierForFinancingPlan:(id)a3
{
  v3 = [a3 planIdentifier];
  v4 = +[NSString stringWithFormat:@"planPaidOff-%@", v3];

  return v4;
}

- (PDAccountFinancingPlanPaidOffNotification)initWithFinancingPlan:(id)a3 passUniqueIdentifier:(id)a4
{
  id v7 = a3;
  if (v7)
  {
    id v8 = a4;
    v9 = [(id)objc_opt_class() notificationIdentifierForFinancingPlan:v7];
    v15.receiver = self;
    v15.super_class = (Class)PDAccountFinancingPlanPaidOffNotification;
    v10 = [(PDUserNotification *)&v15 initWithNotificationIdentifier:v9 forPassUniqueIdentifier:v8];

    if (v10)
    {
      objc_storeStrong((id *)&v10->_financingPlan, a3);
      [(PDUserNotification *)v10 setCustomActionRoute:PKUserNotificationActionRoutePayLaterViewFinancingPlan];
      uint64_t v16 = PKUserNotificationActionQueryItemFinancingPlanIdentifier;
      v11 = [v7 planIdentifier];
      v17 = v11;
      v12 = +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
      [(PDUserNotification *)v10 setCustomActionQueryParameters:v12];
    }
    self = v10;

    v13 = self;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PDAccountFinancingPlanPaidOffNotification)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PDAccountFinancingPlanPaidOffNotification;
  v5 = [(PDUserNotification *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"financingPlan"];
    financingPlan = v5->_financingPlan;
    v5->_financingPlan = (PKPayLaterFinancingPlan *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PDAccountFinancingPlanPaidOffNotification;
  id v4 = a3;
  [(PDUserNotification *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_financingPlan, @"financingPlan", v5.receiver, v5.super_class);
}

- (unint64_t)notificationType
{
  return 52;
}

- (BOOL)isValid
{
  return 1;
}

- (id)notificationContentWithDataSource:(id)a3
{
  v17.receiver = self;
  v17.super_class = (Class)PDAccountFinancingPlanPaidOffNotification;
  id v4 = a3;
  objc_super v5 = [(PDUserNotification *)&v17 notificationContentWithDataSource:v4];
  [(PDUserNotification *)self updatePassNameForNotificationContent:v5 dataSource:v4];

  uint64_t v6 = [(PKPayLaterFinancingPlan *)self->_financingPlan scheduleSummary];
  id v7 = [v6 lastPayment];

  id v8 = [(PKPayLaterFinancingPlan *)self->_financingPlan merchant];
  objc_super v9 = [v8 displayName];

  v10 = PKLocalizedCocoonString(@"NOTIFICATION_LAST_PAYMENT_TITLE");
  [v5 setSubtitle:v10];

  v11 = PKLocalizedCocoonString(@"NOTIFICATION_LAST_PAYMENT_MESSAGE", @"%@", v9);
  [v5 setBody:v11];

  v12 = [v7 postedDate];
  v13 = +[NSDate date];
  v14 = v13;
  if (v12)
  {
    if ([v13 compare:v12] == (id)1) {
      objc_super v15 = v12;
    }
    else {
      objc_super v15 = v14;
    }
  }
  else
  {
    objc_super v15 = 0;
  }
  [v5 setDate:v15];

  return v5;
}

- (void).cxx_destruct
{
}

@end