@interface PDPassPaymentDailyDailyCashWithAmountUserNotification
+ (BOOL)supportsSecureCoding;
- (BOOL)hasValidContent;
- (BOOL)includesMonthlyAggregate;
- (NSSet)dailyRewardTypes;
- (PDPassPaymentDailyDailyCashWithAmountUserNotification)initWithCoder:(id)a3;
- (PDPassPaymentDailyDailyCashWithAmountUserNotification)initWithDailyAmount:(id)a3 monthlyAmount:(id)a4 date:(id)a5 forPassUniqueIdentifier:(id)a6 dailyRewardTypes:(id)a7 monthlyRewardTypes:(id)a8;
- (PKCurrencyAmount)dailyAmount;
- (id)_firstRedemptionInMonthMessage;
- (id)_runningTotalInMonthMessage;
- (id)notificationContentWithDataSource:(id)a3;
- (unint64_t)notificationType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PDPassPaymentDailyDailyCashWithAmountUserNotification

- (PDPassPaymentDailyDailyCashWithAmountUserNotification)initWithDailyAmount:(id)a3 monthlyAmount:(id)a4 date:(id)a5 forPassUniqueIdentifier:(id)a6 dailyRewardTypes:(id)a7 monthlyRewardTypes:(id)a8
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  if (!v15) {
    goto LABEL_7;
  }
  [v15 amount];
  v21 = id v28 = v17;
  +[NSDecimalNumber zero];
  v22 = v29 = v19;
  id v23 = [v21 compare:v22];

  id v19 = v29;
  id v17 = v28;
  if (v23)
  {
    v24 = [v29 anyObject];
    v30.receiver = self;
    v30.super_class = (Class)PDPassPaymentDailyDailyCashWithAmountUserNotification;
    v25 = -[PDPassPaymentDailyDailyCashUserNotification initWithMonthlyAmount:date:forPassUniqueIdentifier:lastRedemptionType:monthlyRewardTypes:](&v30, "initWithMonthlyAmount:date:forPassUniqueIdentifier:lastRedemptionType:monthlyRewardTypes:", v16, v28, v18, [v24 integerValue], v20);

    if (v25)
    {
      objc_storeStrong((id *)&v25->_dailyAmount, a3);
      objc_storeStrong((id *)&v25->_dailyRewardTypes, a7);
      if (v16 && !PKEqualObjects())
      {
        v26 = +[NSDecimalNumber zero];
        v25->_includesMonthlyAggregate = [v16 isEqual:v26] ^ 1;
      }
      else
      {
        v25->_includesMonthlyAggregate = 0;
      }
      id v17 = v28;
    }
    id v19 = v29;
  }
  else
  {
LABEL_7:

    v25 = 0;
  }

  return v25;
}

- (PDPassPaymentDailyDailyCashWithAmountUserNotification)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PDPassPaymentDailyDailyCashWithAmountUserNotification;
  v5 = [(PDPassPaymentDailyDailyCashUserNotification *)&v13 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dailyAmount"];
    dailyAmount = v5->_dailyAmount;
    v5->_dailyAmount = (PKCurrencyAmount *)v6;

    uint64_t v8 = objc_opt_class();
    v9 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v8, objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"dailyRewardTypes"];
    dailyRewardTypes = v5->_dailyRewardTypes;
    v5->_dailyRewardTypes = (NSSet *)v10;

    v5->_includesMonthlyAggregate = [v4 decodeBoolForKey:@"includesMonthlyAggregate"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PDPassPaymentDailyDailyCashWithAmountUserNotification;
  id v4 = a3;
  [(PDPassPaymentDailyDailyCashUserNotification *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_dailyAmount, @"dailyAmount", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_dailyRewardTypes forKey:@"dailyRewardTypes"];
  [v4 encodeBool:self->_includesMonthlyAggregate forKey:@"includesMonthlyAggregate"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)notificationContentWithDataSource:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PDPassPaymentDailyDailyCashWithAmountUserNotification;
  id v4 = [(PDPassPaymentDailyDailyCashUserNotification *)&v8 notificationContentWithDataSource:a3];
  objc_super v5 = PKLocalizedFeatureString();
  [v4 setTitle:v5];

  if (self->_includesMonthlyAggregate) {
    [(PDPassPaymentDailyDailyCashWithAmountUserNotification *)self _runningTotalInMonthMessage];
  }
  else {
  uint64_t v6 = [(PDPassPaymentDailyDailyCashWithAmountUserNotification *)self _firstRedemptionInMonthMessage];
  }
  [v4 setBody:v6];

  return v4;
}

- (unint64_t)notificationType
{
  return 42;
}

- (BOOL)hasValidContent
{
  if (self->_includesMonthlyAggregate) {
    [(PDPassPaymentDailyDailyCashWithAmountUserNotification *)self _runningTotalInMonthMessage];
  }
  else {
  v2 = [(PDPassPaymentDailyDailyCashWithAmountUserNotification *)self _firstRedemptionInMonthMessage];
  }
  id v3 = [v2 length];

  return v3 != 0;
}

- (id)_runningTotalInMonthMessage
{
  id v3 = [(PDPassPaymentDailyDailyCashUserNotification *)self monthlyAmount];
  id v4 = objc_alloc_init((Class)NSDateFormatter);
  [v4 setLocalizedDateFormatFromTemplate:@"MMMM"];
  objc_super v5 = [(PDPassPaymentDailyDailyCashUserNotification *)self monthlyRewardTypes];
  uint64_t v6 = [v5 anyObject];
  id v7 = [v6 unsignedIntegerValue];

  if (v7 == (id)3 || v7 == (id)1)
  {
    objc_super v8 = [(PDPassPaymentDailyDailyCashWithAmountUserNotification *)self dailyAmount];
    v9 = [v8 minimalFormattedStringValue];
    uint64_t v10 = +[NSCalendar currentCalendar];
    v11 = [(PDPassPaymentDailyDailyCashUserNotification *)self dateComponents];
    v12 = [v10 dateFromComponents:v11];
    objc_super v13 = [v4 stringFromDate:v12];
    v14 = [v3 minimalFormattedStringValue];
    id v15 = PKLocalizedFeatureString();
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

- (id)_firstRedemptionInMonthMessage
{
  id v3 = [(PDPassPaymentDailyDailyCashWithAmountUserNotification *)self dailyRewardTypes];
  id v4 = [v3 anyObject];
  id v5 = [v4 unsignedIntegerValue];

  if (v5 == (id)3 || v5 == (id)1)
  {
    uint64_t v6 = [(PDPassPaymentDailyDailyCashWithAmountUserNotification *)self dailyAmount];
    id v7 = [v6 minimalFormattedStringValue];
    objc_super v8 = PKLocalizedFeatureString();
  }
  else
  {
    objc_super v8 = 0;
  }
  return v8;
}

- (PKCurrencyAmount)dailyAmount
{
  return self->_dailyAmount;
}

- (NSSet)dailyRewardTypes
{
  return self->_dailyRewardTypes;
}

- (BOOL)includesMonthlyAggregate
{
  return self->_includesMonthlyAggregate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dailyRewardTypes, 0);
  objc_storeStrong((id *)&self->_dailyAmount, 0);
}

@end