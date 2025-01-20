@interface PDPassPaymentDailyDailyCashUserNotification
+ (BOOL)supportsSecureCoding;
+ (id)notificationIdentifierForDate:(id)a3;
- (NSDateComponents)dateComponents;
- (NSSet)monthlyRewardTypes;
- (PDPassPaymentDailyDailyCashUserNotification)initWithCoder:(id)a3;
- (PDPassPaymentDailyDailyCashUserNotification)initWithMonthlyAmount:(id)a3 date:(id)a4 forPassUniqueIdentifier:(id)a5 lastRedemptionType:(unint64_t)a6 monthlyRewardTypes:(id)a7;
- (PKCurrencyAmount)monthlyAmount;
- (id)notificationContentWithDataSource:(id)a3;
- (unint64_t)notificationType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PDPassPaymentDailyDailyCashUserNotification

+ (id)notificationIdentifierForDate:(id)a3
{
  id v3 = a3;
  if (v3
    && (+[NSCalendar currentCalendar],
        v4 = objc_claimAutoreleasedReturnValue(),
        [v4 components:30 fromDate:v3],
        v5 = objc_claimAutoreleasedReturnValue(),
        v4,
        v5))
  {
    v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"dailycash-%lu-%lu-%lu-%lu", [v5 era], objc_msgSend(v5, "year"), objc_msgSend(v5, "month"), objc_msgSend(v5, "day"));
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (PDPassPaymentDailyDailyCashUserNotification)initWithMonthlyAmount:(id)a3 date:(id)a4 forPassUniqueIdentifier:(id)a5 lastRedemptionType:(unint64_t)a6 monthlyRewardTypes:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  if (!v14)
  {
    v18 = 0;
LABEL_7:

    v20 = 0;
    goto LABEL_8;
  }
  unint64_t v30 = a6;
  v17 = +[NSCalendar currentCalendar];
  v18 = [v17 components:30 fromDate:v14];

  if (!v15 || !v18) {
    goto LABEL_7;
  }
  v19 = [(id)objc_opt_class() notificationIdentifierForDate:v14];
  v31.receiver = self;
  v31.super_class = (Class)PDPassPaymentDailyDailyCashUserNotification;
  v20 = [(PDUserNotification *)&v31 initWithNotificationIdentifier:v19 forPassUniqueIdentifier:v15];

  if (v20)
  {
    uint32_t v21 = arc4random_uniform(0x384u);
    +[NSCalendar currentCalendar];
    v22 = id v29 = v13;
    v23 = [v22 dateFromComponents:v18];
    v24 = [v23 dateByAddingTimeInterval:(double)v21 + 115200.0];

    objc_storeStrong((id *)&v20->_monthlyAmount, a3);
    objc_storeStrong((id *)&v20->_dateComponents, v18);
    objc_storeStrong((id *)&v20->_monthlyRewardTypes, a7);
    [(PDUserNotification *)v20 setDate:v24];
    [(PDUserNotification *)v20 setReissueBannerOnUpdate:0];
    [(PDUserNotification *)v20 setAssetType:2];
    [(PDUserNotification *)v20 setCustomActionRoute:PKUserNotificationActionRouteViewDailyCash];
    v25 = PKW3CDateStringFromDate();
    v32[0] = PKUserNotificationActionQueryItemDate;
    v32[1] = PKUserNotificationActionQueryItemPassUniqueIdentifier;
    v33[0] = v25;
    v33[1] = v15;
    v32[2] = PKUserNotificationActionQueryItemRedemptionType;
    v26 = +[NSString stringWithFormat:@"%lu", v30];
    v33[2] = v26;
    v27 = +[NSDictionary dictionaryWithObjects:v33 forKeys:v32 count:3];
    [(PDUserNotification *)v20 setCustomActionQueryParameters:v27];

    id v13 = v29;
  }
LABEL_8:

  return v20;
}

- (PDPassPaymentDailyDailyCashUserNotification)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PDPassPaymentDailyDailyCashUserNotification;
  v5 = [(PDUserNotification *)&v15 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"monthlyAmount"];
    monthlyAmount = v5->_monthlyAmount;
    v5->_monthlyAmount = (PKCurrencyAmount *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"components"];
    dateComponents = v5->_dateComponents;
    v5->_dateComponents = (NSDateComponents *)v8;

    uint64_t v10 = objc_opt_class();
    v11 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v10, objc_opt_class(), 0);
    uint64_t v12 = [v4 decodeObjectOfClasses:v11 forKey:@"monthlyRewardTypes"];
    monthlyRewardTypes = v5->_monthlyRewardTypes;
    v5->_monthlyRewardTypes = (NSSet *)v12;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PDPassPaymentDailyDailyCashUserNotification;
  id v4 = a3;
  [(PDUserNotification *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_monthlyAmount, @"monthlyAmount", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_dateComponents forKey:@"components"];
  [v4 encodeObject:self->_monthlyRewardTypes forKey:@"monthlyRewardTypes"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)notificationType
{
  return 23;
}

- (id)notificationContentWithDataSource:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PDPassPaymentDailyDailyCashUserNotification;
  id v4 = [(PDUserNotification *)&v7 notificationContentWithDataSource:a3];
  objc_super v5 = [(PDUserNotification *)self date];
  [v4 setDate:v5];

  return v4;
}

- (NSDateComponents)dateComponents
{
  return self->_dateComponents;
}

- (PKCurrencyAmount)monthlyAmount
{
  return self->_monthlyAmount;
}

- (NSSet)monthlyRewardTypes
{
  return self->_monthlyRewardTypes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_monthlyRewardTypes, 0);
  objc_storeStrong((id *)&self->_monthlyAmount, 0);
  objc_storeStrong((id *)&self->_dateComponents, 0);
}

@end