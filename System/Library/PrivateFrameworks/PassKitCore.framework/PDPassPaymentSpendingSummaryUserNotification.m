@interface PDPassPaymentSpendingSummaryUserNotification
+ (BOOL)supportsSecureCoding;
- (BOOL)isValid;
- (BOOL)summaryIncludesUsers;
- (PDPassPaymentSpendingSummaryUserNotification)initWithCoder:(id)a3;
- (PDPassPaymentSpendingSummaryUserNotification)initWithSpendingSummary:(id)a3 accountUserCollection:(id)a4 forPassUniqueIdentifier:(id)a5;
- (PKCurrencyAmount)rewardsAccrued;
- (PKCurrencyAmount)totalSpending;
- (id)_messageString;
- (id)_titleString;
- (id)notificationContentWithDataSource:(id)a3;
- (unint64_t)notificationType;
- (unint64_t)summaryType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PDPassPaymentSpendingSummaryUserNotification

- (PDPassPaymentSpendingSummaryUserNotification)initWithSpendingSummary:(id)a3 accountUserCollection:(id)a4 forPassUniqueIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [v8 totalSpending];
  v12 = [v8 rewards];
  v13 = [v12 totalAmount];

  v14 = [v9 accountUsers];
  if ((unint64_t)[v14 count] < 2)
  {
    BOOL v16 = 0;
  }
  else
  {
    v15 = [v9 currentAccountUser];
    BOOL v16 = [v15 accessLevel] != (id)2;
  }
  if (!v10 || !v8 || !v11 || !v13) {
    goto LABEL_13;
  }
  v17 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"spending-%lu-%lu", [v8 summaryType], objc_msgSend(v8, "summaryUnit"));
  v31.receiver = self;
  v31.super_class = (Class)PDPassPaymentSpendingSummaryUserNotification;
  self = [(PDUserNotification *)&v31 initWithNotificationIdentifier:v17 forPassUniqueIdentifier:v10];

  if (!self) {
    goto LABEL_16;
  }
  self->_unint64_t summaryType = (unint64_t)[v8 summaryType];
  objc_storeStrong((id *)&self->_rewardsAccrued, v13);
  objc_storeStrong((id *)&self->_totalSpending, v11);
  self->_summaryIncludesUsers = v16;
  [(PDUserNotification *)self setReissueBannerOnUpdate:0];
  uint32_t v18 = arc4random_uniform(0x1C20u);
  unint64_t summaryType = self->_summaryType;
  if (summaryType == 2)
  {
LABEL_13:

    self = 0;
    goto LABEL_16;
  }
  unsigned int v20 = v18;
  if (summaryType == 1)
  {
    v27 = [v8 endDate];
    v28 = [v27 dateByAddingTimeInterval:(double)v20 + 68400.0];
    [(PDUserNotification *)self setDate:v28];

    [(PDUserNotification *)self setCustomActionRoute:PKUserNotificationActionRouteViewSpendingSummary];
    v32[0] = PKUserNotificationActionQueryItemSpendingSummaryType;
    v23 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%lu", [v8 summaryType]);
    v33[0] = v23;
    v32[1] = PKUserNotificationActionQueryItemSpendingSummaryUnit;
    v24 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%lu", [v8 summaryUnit]);
    v32[2] = PKUserNotificationActionQueryItemPassUniqueIdentifier;
    v33[1] = v24;
    v33[2] = v10;
    v25 = v33;
    v26 = v32;
    goto LABEL_15;
  }
  if (!summaryType)
  {
    v21 = [v8 endDate];
    v22 = [v21 dateByAddingTimeInterval:(double)v20 + 68400.0];
    [(PDUserNotification *)self setDate:v22];

    [(PDUserNotification *)self setCustomActionRoute:PKUserNotificationActionRouteViewSpendingSummary];
    v34[0] = PKUserNotificationActionQueryItemSpendingSummaryType;
    v23 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%lu", [v8 summaryType]);
    v35[0] = v23;
    v34[1] = PKUserNotificationActionQueryItemSpendingSummaryUnit;
    v24 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%lu", [v8 summaryUnit]);
    v34[2] = PKUserNotificationActionQueryItemPassUniqueIdentifier;
    v35[1] = v24;
    v35[2] = v10;
    v25 = v35;
    v26 = v34;
LABEL_15:
    v29 = +[NSDictionary dictionaryWithObjects:v25 forKeys:v26 count:3];
    [(PDUserNotification *)self setCustomActionQueryParameters:v29];
  }
LABEL_16:

  return self;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PDPassPaymentSpendingSummaryUserNotification)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PDPassPaymentSpendingSummaryUserNotification;
  v5 = [(PDUserNotification *)&v11 initWithCoder:v4];
  if (v5)
  {
    v5->_unint64_t summaryType = (unint64_t)[v4 decodeIntegerForKey:@"spendingSummaryType"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"spendingRewards"];
    rewardsAccrued = v5->_rewardsAccrued;
    v5->_rewardsAccrued = (PKCurrencyAmount *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"spendingTotal"];
    totalSpending = v5->_totalSpending;
    v5->_totalSpending = (PKCurrencyAmount *)v8;

    v5->_summaryIncludesUsers = [v4 decodeBoolForKey:@"summaryIncludesUsers"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PDPassPaymentSpendingSummaryUserNotification;
  id v4 = a3;
  [(PDUserNotification *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", self->_summaryType, @"spendingSummaryType", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_rewardsAccrued forKey:@"spendingRewards"];
  [v4 encodeObject:self->_totalSpending forKey:@"spendingTotal"];
  [v4 encodeBool:self->_summaryIncludesUsers forKey:@"summaryIncludesUsers"];
}

- (unint64_t)notificationType
{
  return 18;
}

- (BOOL)isValid
{
  v2 = [(PKCurrencyAmount *)self->_totalSpending amount];
  v3 = +[NSDecimalNumber zero];
  BOOL v4 = [v2 compare:v3] == (id)1;

  return v4;
}

- (id)notificationContentWithDataSource:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PDPassPaymentSpendingSummaryUserNotification;
  BOOL v4 = [(PDUserNotification *)&v9 notificationContentWithDataSource:a3];
  objc_super v5 = [(PDPassPaymentSpendingSummaryUserNotification *)self _titleString];
  [v4 setSubtitle:v5];

  uint64_t v6 = [(PDPassPaymentSpendingSummaryUserNotification *)self _messageString];
  [v4 setBody:v6];

  v7 = [(PDUserNotification *)self date];
  [v4 setDate:v7];

  return v4;
}

- (id)_messageString
{
  v3 = [(PKCurrencyAmount *)self->_rewardsAccrued amount];
  BOOL v4 = +[NSDecimalNumber zero];
  id v5 = [v3 compare:v4];

  uint64_t v6 = [(PKCurrencyAmount *)self->_totalSpending minimalFormattedStringValue];
  v7 = [(PKCurrencyAmount *)self->_rewardsAccrued minimalFormattedStringValue];
  uint64_t v8 = [(PKCurrencyAmount *)self->_totalSpending amount];
  [v8 floatValue];
  float v10 = v9;

  objc_super v11 = [(PKCurrencyAmount *)self->_rewardsAccrued amount];
  [v11 floatValue];
  float v13 = v12;

  unint64_t summaryType = self->_summaryType;
  if (summaryType == 1)
  {
    double v16 = v10;
    if (v5 == (id)1)
    {
      double v17 = v13;
      if (self->_summaryIncludesUsers)
      {
        v24 = v6;
        v25 = v7;
        double v22 = v10;
        double v23 = v13;
        uint32_t v18 = @"ACCOUNT_NOTIFICATION_SPENDING_SUMMARY_FAMILY_MONTH_MESSAGE";
        goto LABEL_9;
      }
    }
    else if (self->_summaryIncludesUsers)
    {
      PKLocalizedMadisonString(@"ACCOUNT_NOTIFICATION_SPENDING_SUMMARY_FAMILY_MONTH_MESSAGE_NO_REWARDS", @"%lf%@", v16, v14, v10, v6);
      goto LABEL_15;
    }
LABEL_16:
    uint64_t v20 = PKLocalizedFeatureString();
    goto LABEL_17;
  }
  if (summaryType)
  {
    v19 = 0;
    goto LABEL_18;
  }
  double v16 = v10;
  if (v5 != (id)1)
  {
    if (self->_summaryIncludesUsers)
    {
      PKLocalizedMadisonString(@"ACCOUNT_NOTIFICATION_SPENDING_SUMMARY_FAMILY_WEEK_MESSAGE_NO_REWARDS", @"%lf%@", v16, v14, v10, v6);
      goto LABEL_15;
    }
    goto LABEL_16;
  }
  double v17 = v13;
  if (!self->_summaryIncludesUsers) {
    goto LABEL_16;
  }
  v24 = v6;
  v25 = v7;
  double v22 = v10;
  double v23 = v13;
  uint32_t v18 = @"ACCOUNT_NOTIFICATION_SPENDING_SUMMARY_FAMILY_WEEK_MESSAGE";
LABEL_9:
  PKLocalizedMadisonString(&v18->isa, @"%lf%lf%@%@", v16, v17, *(void *)&v22, *(void *)&v23, v24, v25);
  uint64_t v20 = LABEL_15:;
LABEL_17:
  v19 = (void *)v20;
LABEL_18:

  return v19;
}

- (id)_titleString
{
  if (self->_summaryType > 1)
  {
    v2 = 0;
  }
  else
  {
    v2 = PKLocalizedFeatureString();
  }
  return v2;
}

- (PKCurrencyAmount)totalSpending
{
  return self->_totalSpending;
}

- (PKCurrencyAmount)rewardsAccrued
{
  return self->_rewardsAccrued;
}

- (unint64_t)summaryType
{
  return self->_summaryType;
}

- (BOOL)summaryIncludesUsers
{
  return self->_summaryIncludesUsers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rewardsAccrued, 0);
  objc_storeStrong((id *)&self->_totalSpending, 0);
}

@end