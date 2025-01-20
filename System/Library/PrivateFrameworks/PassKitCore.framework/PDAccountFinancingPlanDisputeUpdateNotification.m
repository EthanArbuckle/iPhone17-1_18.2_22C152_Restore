@interface PDAccountFinancingPlanDisputeUpdateNotification
+ (BOOL)supportsSecureCoding;
+ (id)notificationIdentifierForFinancingPlan:(id)a3 dispute:(id)a4 type:(int64_t)a5;
- (BOOL)isValid;
- (PDAccountFinancingPlanDisputeUpdateNotification)initWithCoder:(id)a3;
- (PDAccountFinancingPlanDisputeUpdateNotification)initWithFinancingPlan:(id)a3 dispute:(id)a4 type:(int64_t)a5 passUniqueIdentifier:(id)a6;
- (id)disputeIdentifier;
- (id)notificationContentWithDataSource:(id)a3;
- (id)planIdentifier;
- (unint64_t)notificationType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PDAccountFinancingPlanDisputeUpdateNotification

+ (id)notificationIdentifierForFinancingPlan:(id)a3 dispute:(id)a4 type:(int64_t)a5
{
  id v7 = a4;
  id v8 = a3;
  [v7 state];
  v9 = PKPayLaterFinancingPlanDisputeStateToString();
  if ((unint64_t)a5 > 2) {
    CFStringRef v10 = @"unknown";
  }
  else {
    CFStringRef v10 = *(&off_100748D60 + a5);
  }
  v11 = [v7 identifier];

  v12 = [v8 planIdentifier];

  v13 = +[NSString stringWithFormat:@"financingPlanDisputeUpdate-%@-type-%@-diputeID-%@-planID-%@", v9, v10, v11, v12];

  return v13;
}

- (PDAccountFinancingPlanDisputeUpdateNotification)initWithFinancingPlan:(id)a3 dispute:(id)a4 type:(int64_t)a5 passUniqueIdentifier:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v14 = 0;
  if (v11)
  {
    if (v12)
    {
      id v15 = [v12 state];
      v14 = 0;
      if (a5 != 2)
      {
        if (v15)
        {
          v16 = [(id)objc_opt_class() notificationIdentifierForFinancingPlan:v11 dispute:v12 type:a5];
          v35.receiver = self;
          v35.super_class = (Class)PDAccountFinancingPlanDisputeUpdateNotification;
          v17 = [(PDUserNotification *)&v35 initWithNotificationIdentifier:v16 forPassUniqueIdentifier:v13];
          v18 = v17;
          if (v17)
          {
            objc_storeStrong((id *)&v17->_financingPlan, a3);
            objc_storeStrong((id *)&v18->_dispute, a4);
            v18->_type = a5;
            id v19 = v12;
            v20 = +[NSDate date];
            if (a5 && [v19 state] == (id)2)
            {
              v21 = [v19 deadlineDate];
              if (v21)
              {
                v22 = +[NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
                v34 = v21;
                v23 = [v22 components:28 fromDate:v21];
                [v23 setHour:18];
                v32 = v23;
                v33 = v22;
                v24 = [v22 dateFromComponents:v23];

                v20 = [v24 dateByAddingTimeInterval:-86400.0];

                v25 = +[NSDate date];
                id v26 = [v25 compare:v20];

                if (v26 == (id)1)
                {
                  uint64_t v27 = +[NSDate date];

                  v20 = (void *)v27;
                }

                v28 = v33;
                v21 = v34;
              }
              else
              {
                v28 = PKLogFacilityTypeGetObject();
                if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  id v39 = v19;
                  _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Error, no deadlineDate defined for financing plan dispute %@", buf, 0xCu);
                }
              }
            }
            [(PDUserNotification *)v18 setDate:v20];
            [(PDUserNotification *)v18 setCustomActionRoute:PKUserNotificationActionRoutePayLaterViewFinancingPlan];
            uint64_t v36 = PKUserNotificationActionQueryItemFinancingPlanIdentifier;
            v29 = [v11 planIdentifier];
            v37 = v29;
            v30 = +[NSDictionary dictionaryWithObjects:&v37 forKeys:&v36 count:1];
            [(PDUserNotification *)v18 setCustomActionQueryParameters:v30];
          }
          self = v18;

          v14 = self;
        }
      }
    }
  }

  return v14;
}

- (id)planIdentifier
{
  return [(PKPayLaterFinancingPlan *)self->_financingPlan planIdentifier];
}

- (id)disputeIdentifier
{
  return [(PKPayLaterFinancingPlanDispute *)self->_dispute identifier];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PDAccountFinancingPlanDisputeUpdateNotification)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PDAccountFinancingPlanDisputeUpdateNotification;
  v5 = [(PDUserNotification *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"financingPlan"];
    financingPlan = v5->_financingPlan;
    v5->_financingPlan = (PKPayLaterFinancingPlan *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dispute"];
    dispute = v5->_dispute;
    v5->_dispute = (PKPayLaterFinancingPlanDispute *)v8;

    v5->_type = (int64_t)[v4 decodeIntegerForKey:@"updateType"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PDAccountFinancingPlanDisputeUpdateNotification;
  id v4 = a3;
  [(PDUserNotification *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_financingPlan, @"financingPlan", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_dispute forKey:@"dispute"];
  [v4 encodeInteger:self->_type forKey:@"updateType"];
}

- (unint64_t)notificationType
{
  return 56;
}

- (BOOL)isValid
{
  return 1;
}

- (id)notificationContentWithDataSource:(id)a3
{
  v13.receiver = self;
  v13.super_class = (Class)PDAccountFinancingPlanDisputeUpdateNotification;
  id v4 = a3;
  objc_super v5 = [(PDUserNotification *)&v13 notificationContentWithDataSource:v4];
  [(PDUserNotification *)self updatePassNameForNotificationContent:v5 dataSource:v4];

  uint64_t v6 = [(PKPayLaterFinancingPlan *)self->_financingPlan merchant];
  id v7 = [v6 displayName];

  switch((unint64_t)[(PKPayLaterFinancingPlanDispute *)self->_dispute state])
  {
    case 1uLL:
      int64_t type = self->_type;
      if (type != 1) {
        goto LABEL_6;
      }
      goto LABEL_4;
    case 2uLL:
      int64_t type = self->_type;
      if (type == 1)
      {
        uint64_t v8 = PKLocalizedCocoonString(@"NOTIFICATION_FINANCING_PLAN_DISPUTE_EVIDENCE_TITLE");
        uint64_t v10 = PKLocalizedCocoonString(@"NOTIFICATION_FINANCING_PLAN_DISPUTE_EVIDENCE_MESSAGE");
      }
      else
      {
LABEL_6:
        if (type)
        {
LABEL_13:
          objc_super v11 = 0;
          goto LABEL_14;
        }
        uint64_t v8 = PKLocalizedCocoonString(@"NOTIFICATION_FINANCING_PLAN_DISPUTE_UNRESOLVED_TITLE");
        PKLocalizedCocoonString(@"NOTIFICATION_FINANCING_PLAN_DISPUTE_UNRESOLVED_MESSAGE", @"%@", v7);
        uint64_t v10 = LABEL_8:;
      }
      objc_super v11 = (void *)v10;
      if (v10) {
        [v5 setBody:v10];
      }
      if (v8)
      {
        [v5 setSubtitle:v8];
      }
LABEL_14:

      return v5;
    case 3uLL:
    case 4uLL:
    case 5uLL:
      uint64_t v8 = PKLocalizedCocoonString(@"NOTIFICATION_FINANCING_PLAN_DISPUTE_RESOLVED_TITLE");
      PKLocalizedCocoonString(@"NOTIFICATION_FINANCING_PLAN_DISPUTE_RESOLVED_MESSAGE", @"%@", v7);
      goto LABEL_8;
    case 6uLL:
LABEL_4:
      uint64_t v8 = PKLocalizedCocoonString(@"NOTIFICATION_FINANCING_PLAN_DISPUTE_GENERIC_TITLE");
      PKLocalizedCocoonString(@"NOTIFICATION_FINANCING_PLAN_DISPUTE_GENERIC_MESSAGE", @"%@", v7);
      goto LABEL_8;
    default:
      goto LABEL_13;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispute, 0);
  objc_storeStrong((id *)&self->_financingPlan, 0);
}

@end