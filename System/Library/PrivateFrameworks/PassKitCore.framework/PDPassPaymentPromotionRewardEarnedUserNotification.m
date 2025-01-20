@interface PDPassPaymentPromotionRewardEarnedUserNotification
+ (BOOL)supportsSecureCoding;
- (BOOL)isValid;
- (NSArray)promotionalRewardItems;
- (PDPassPaymentPromotionRewardEarnedUserNotification)initWithCoder:(id)a3;
- (PDPassPaymentPromotionRewardEarnedUserNotification)initWithPaymentTransaction:(id)a3 forPassUniqueIdentifier:(id)a4 paymentApplication:(id)a5 promotionalRewardItems:(id)a6;
- (PKPaymentTransaction)paymentTransaction;
- (id)_amountsString;
- (id)_locationString;
- (id)_percentRewardsAmountString;
- (id)_promotionalAmountString;
- (id)currencyCode;
- (id)notificationContentWithDataSource:(id)a3;
- (unint64_t)notificationType;
- (void)_populateNotificationContent:(id)a3 withDataSource:(id)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PDPassPaymentPromotionRewardEarnedUserNotification

- (PDPassPaymentPromotionRewardEarnedUserNotification)initWithPaymentTransaction:(id)a3 forPassUniqueIdentifier:(id)a4 paymentApplication:(id)a5 promotionalRewardItems:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  if (v10)
  {
    id v12 = a4;
    v13 = [v10 identifier];
    v14 = +[NSString stringWithFormat:@"promotionreward-%@", v13];

    v23.receiver = self;
    v23.super_class = (Class)PDPassPaymentPromotionRewardEarnedUserNotification;
    v15 = [(PDUserNotification *)&v23 initWithNotificationIdentifier:v14 forPassUniqueIdentifier:v12];

    if (v15)
    {
      v15->_isValid = 1;
      objc_storeStrong((id *)&v15->_paymentTransaction, a3);
      objc_storeStrong((id *)&v15->_promotionalRewardItems, a6);
      v16 = [(PKPaymentTransaction *)v15->_paymentTransaction transactionDate];
      [(PDUserNotification *)v15 setDate:v16];

      [(PDUserNotification *)v15 setCustomActionRoute:PKUserNotificationActionRouteViewTransaction];
      v17 = [(PKPaymentTransaction *)v15->_paymentTransaction identifier];
      v18 = [(PKPaymentTransaction *)v15->_paymentTransaction transactionSourceIdentifier];
      id v19 = objc_alloc_init((Class)NSMutableDictionary);
      if ([v17 length]) {
        [v19 setObject:v17 forKey:PKUserNotificationActionQueryItemTransactionIdentifier];
      }
      if ([v18 length]) {
        [v19 setObject:v18 forKey:PKUserNotificationActionQueryItemTransactionSourceIdentifier];
      }
      id v20 = [v19 copy];
      [(PDUserNotification *)v15 setCustomActionQueryParameters:v20];
    }
    self = v15;

    v21 = self;
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PDPassPaymentPromotionRewardEarnedUserNotification)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PDPassPaymentPromotionRewardEarnedUserNotification;
  v5 = [(PDUserNotification *)&v15 initWithCoder:v4];
  v6 = v5;
  if (v5)
  {
    v5->_isValid = 1;
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"paymentTransaction"];
    paymentTransaction = v6->_paymentTransaction;
    v6->_paymentTransaction = (PKPaymentTransaction *)v7;

    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    id v11 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v9, v10, objc_opt_class(), 0);
    uint64_t v12 = [v4 decodeObjectOfClasses:v11 forKey:@"promotionalRewards"];
    promotionalRewardItems = v6->_promotionalRewardItems;
    v6->_promotionalRewardItems = (NSArray *)v12;
  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PDPassPaymentPromotionRewardEarnedUserNotification;
  id v4 = a3;
  [(PDUserNotification *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_paymentTransaction, @"paymentTransaction", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_promotionalRewardItems forKey:@"promotionalRewards"];
}

- (unint64_t)notificationType
{
  return 57;
}

- (BOOL)isValid
{
  return self->_isValid;
}

- (id)notificationContentWithDataSource:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PDPassPaymentPromotionRewardEarnedUserNotification;
  id v4 = a3;
  objc_super v5 = [(PDUserNotification *)&v7 notificationContentWithDataSource:v4];
  -[PDPassPaymentPromotionRewardEarnedUserNotification _populateNotificationContent:withDataSource:](self, "_populateNotificationContent:withDataSource:", v5, v4, v7.receiver, v7.super_class);

  return v5;
}

- (void)_populateNotificationContent:(id)a3 withDataSource:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(PDUserNotification *)self passUniqueIdentifier];
  uint64_t v9 = [v7 passWithUniqueIdentifier:v8];

  uint64_t v10 = [v9 paymentPass];
  if ([v10 isAppleCardPass])
  {
    id v11 = [(PDPassPaymentPromotionRewardEarnedUserNotification *)self paymentTransaction];
    id v12 = [v11 transactionType];

    if (v12)
    {
      self->_isValid = 0;
      v13 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        int v20 = 134217984;
        id v21 = v12;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Unexpected transaction type in promotion reward notification: %ld", (uint8_t *)&v20, 0xCu);
      }

      v14 = 0;
      objc_super v15 = 0;
    }
    else
    {
      v14 = [(PDPassPaymentPromotionRewardEarnedUserNotification *)self _locationString];
      uint64_t v17 = [(PDPassPaymentPromotionRewardEarnedUserNotification *)self _amountsString];
      objc_super v15 = (void *)v17;
      if (v14 && v17)
      {
        [v6 setSubtitle:v14];
        [v6 setBody:v15];
LABEL_13:
        v18 = [(PDPassPaymentPromotionRewardEarnedUserNotification *)self paymentTransaction];
        id v19 = [v18 transactionDate];
        [v6 setDate:v19];

        goto LABEL_14;
      }
    }
    self->_isValid = 0;
    goto LABEL_13;
  }
  v16 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v20) = 0;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Unexpected promotion reward notification for payment pass other than Apple Card", (uint8_t *)&v20, 2u);
  }

  self->_isValid = 0;
LABEL_14:
}

- (id)_locationString
{
  v2 = [(PDPassPaymentPromotionRewardEarnedUserNotification *)self paymentTransaction];
  v3 = [v2 merchant];
  id v4 = [v3 displayName];

  if (v4)
  {
    objc_super v5 = PKLocalizedFeatureString();
  }
  else
  {
    objc_super v5 = 0;
  }

  return v5;
}

- (id)_amountsString
{
  v3 = [(PDPassPaymentPromotionRewardEarnedUserNotification *)self paymentTransaction];
  id v4 = [v3 merchant];
  objc_super v5 = [v4 displayName];

  id v6 = [(PDPassPaymentPromotionRewardEarnedUserNotification *)self _promotionalAmountString];
  uint64_t v7 = [(PDPassPaymentPromotionRewardEarnedUserNotification *)self _percentRewardsAmountString];
  v8 = (void *)v7;
  uint64_t v9 = 0;
  if (v5 && v6 && v7)
  {
    uint64_t v9 = PKLocalizedFeatureString();
  }

  return v9;
}

- (id)_promotionalAmountString
{
  promotionalRewardItems = self->_promotionalRewardItems;
  if (promotionalRewardItems && [(NSArray *)promotionalRewardItems count])
  {
    id v4 = [objc_alloc((Class)PKPaymentTransactionRewards) initWithRewardsItems:self->_promotionalRewardItems];
    objc_super v5 = [v4 totalAmountForUnit:2];
    id v6 = [v5 amount];
    uint64_t v7 = +[NSDecimalNumber zero];
    unsigned __int8 v8 = [v6 isEqualToNumber:v7];

    uint64_t v9 = 0;
    if ((v8 & 1) == 0 && v5)
    {
      uint64_t v9 = [v5 minimalFormattedStringValue];
    }
  }
  else
  {
    uint64_t v9 = 0;
  }
  return v9;
}

- (id)_percentRewardsAmountString
{
  v2 = [(PKPaymentTransaction *)self->_paymentTransaction rewards];
  v3 = v2;
  if (v2)
  {
    id v4 = [v2 totalAmountForUnit:1];
    objc_super v5 = [v4 amount];
    id v6 = +[NSDecimalNumber zero];
    unsigned __int8 v7 = [v5 isEqualToNumber:v6];

    unsigned __int8 v8 = 0;
    if ((v7 & 1) == 0 && v4)
    {
      unsigned __int8 v8 = [v4 minimalFormattedStringValue];
    }
  }
  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (id)currencyCode
{
  v3 = [(PDPassPaymentPromotionRewardEarnedUserNotification *)self paymentTransaction];
  id v4 = [v3 currencyCode];

  if (!v4)
  {
    objc_super v5 = [(PDPassPaymentPromotionRewardEarnedUserNotification *)self paymentTransaction];
    id v6 = [v5 amounts];
    unsigned __int8 v7 = [v6 firstObject];
    unsigned __int8 v8 = [v7 amount];
    id v4 = [v8 currency];
  }
  return v4;
}

- (PKPaymentTransaction)paymentTransaction
{
  return self->_paymentTransaction;
}

- (NSArray)promotionalRewardItems
{
  return self->_promotionalRewardItems;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_promotionalRewardItems, 0);
  objc_storeStrong((id *)&self->_paymentTransaction, 0);
}

@end