@interface PDPassPaymentDailyDailyCashWithPercentageUserNotification
+ (BOOL)supportsSecureCoding;
- (NSArray)merchantNames;
- (NSDecimalNumber)percentage;
- (PDPassPaymentDailyDailyCashWithPercentageUserNotification)initWithCoder:(id)a3;
- (PDPassPaymentDailyDailyCashWithPercentageUserNotification)initWithPercentage:(id)a3 merchantNames:(id)a4 monthlyAmount:(id)a5 date:(id)a6 forPassUniqueIdentifier:(id)a7;
- (id)notificationContentWithDataSource:(id)a3;
- (unint64_t)notificationType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PDPassPaymentDailyDailyCashWithPercentageUserNotification

- (PDPassPaymentDailyDailyCashWithPercentageUserNotification)initWithPercentage:(id)a3 merchantNames:(id)a4 monthlyAmount:(id)a5 date:(id)a6 forPassUniqueIdentifier:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  v15 = v14;
  if (v13 && v14)
  {
    v19.receiver = self;
    v19.super_class = (Class)PDPassPaymentDailyDailyCashWithPercentageUserNotification;
    v16 = [(PDPassPaymentDailyDailyCashUserNotification *)&v19 initWithMonthlyAmount:a5 date:a6 forPassUniqueIdentifier:a7 lastRedemptionType:0 monthlyRewardTypes:0];
    v17 = v16;
    if (v16)
    {
      objc_storeStrong((id *)&v16->_percentage, a3);
      objc_storeStrong((id *)&v17->_merchantNames, a4);
    }
  }
  else
  {

    v17 = 0;
  }

  return v17;
}

- (PDPassPaymentDailyDailyCashWithPercentageUserNotification)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PDPassPaymentDailyDailyCashWithPercentageUserNotification;
  v5 = [(PDPassPaymentDailyDailyCashUserNotification *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"percentage"];
    percentage = v5->_percentage;
    v5->_percentage = (NSDecimalNumber *)v6;

    uint64_t v8 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"merchantNames"];
    merchantNames = v5->_merchantNames;
    v5->_merchantNames = (NSArray *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PDPassPaymentDailyDailyCashWithPercentageUserNotification;
  id v4 = a3;
  [(PDPassPaymentDailyDailyCashUserNotification *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_percentage, @"percentage", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_merchantNames forKey:@"merchantNames"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)notificationContentWithDataSource:(id)a3
{
  v20.receiver = self;
  v20.super_class = (Class)PDPassPaymentDailyDailyCashWithPercentageUserNotification;
  id v4 = [(PDPassPaymentDailyDailyCashUserNotification *)&v20 notificationContentWithDataSource:a3];
  objc_super v5 = PKLocalizedFeatureString();
  [v4 setTitle:v5];

  uint64_t v6 = [(PDPassPaymentDailyDailyCashUserNotification *)self monthlyAmount];
  if (v6)
  {
    v7 = +[NSDecimalNumber zero];
    unsigned __int8 v8 = [v6 isEqual:v7];

    if ((v8 & 1) == 0)
    {
      id v9 = objc_alloc_init((Class)NSDateFormatter);
      [v9 setLocalizedDateFormatFromTemplate:@"MMMM"];
      NSUInteger v10 = [(NSArray *)self->_merchantNames count];
      v17 = PKFormattedStringMinimalFractionDigitsFromNumber();
      objc_super v11 = PKLocalizedFeatureString();

      v12 = &stru_10075AAD8;
      switch(v10)
      {
        case 0uLL:
          goto LABEL_9;
        case 1uLL:
          v12 = [(NSArray *)self->_merchantNames firstObject];
          break;
        case 2uLL:
          id v13 = [(NSArray *)self->_merchantNames firstObject];
          id v14 = [(NSArray *)self->_merchantNames objectAtIndex:1];
          PKLocalizedFeatureString();
          v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
          goto LABEL_7;
        case 3uLL:
          id v13 = [(NSArray *)self->_merchantNames firstObject];
          id v14 = [(NSArray *)self->_merchantNames objectAtIndex:1];
          objc_super v19 = [(NSArray *)self->_merchantNames objectAtIndex:2];
          PKLocalizedFeatureString();
          v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_7:
          break;
        default:
          break;
      }
      v17 = v11;
      v18 = v12;
      uint64_t v15 = PKLocalizedFeatureString();

      v12 = (__CFString *)v15;
LABEL_9:
      objc_msgSend(v4, "setBody:", v12, v17, v18, v19);
    }
  }

  return v4;
}

- (unint64_t)notificationType
{
  return 43;
}

- (NSDecimalNumber)percentage
{
  return self->_percentage;
}

- (NSArray)merchantNames
{
  return self->_merchantNames;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_merchantNames, 0);
  objc_storeStrong((id *)&self->_percentage, 0);
}

@end