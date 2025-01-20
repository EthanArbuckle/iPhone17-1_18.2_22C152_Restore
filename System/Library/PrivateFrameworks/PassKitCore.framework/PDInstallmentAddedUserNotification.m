@interface PDInstallmentAddedUserNotification
+ (BOOL)supportsSecureCoding;
- (PDInstallmentAddedUserNotification)initWithAccount:(id)a3 installmentPlan:(id)a4 passUniqueIdentifier:(id)a5;
- (PDInstallmentAddedUserNotification)initWithCoder:(id)a3;
- (id)notificationContentWithDataSource:(id)a3;
- (unint64_t)notificationType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PDInstallmentAddedUserNotification

- (PDInstallmentAddedUserNotification)initWithAccount:(id)a3 installmentPlan:(id)a4 passUniqueIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v9)
  {
    v11 = [v9 identifier];
    v12 = +[NSString stringWithFormat:@"%@-installmentPlanAdded", v11];

    v22.receiver = self;
    v22.super_class = (Class)PDInstallmentAddedUserNotification;
    v13 = [(PDUserNotification *)&v22 initWithNotificationIdentifier:v12 forPassUniqueIdentifier:v10];
    if (v13)
    {
      v14 = [v8 accountIdentifier];
      [(PDUserNotification *)v13 setAccountIdentifier:v14];
      objc_storeStrong((id *)&v13->_installmentPlan, a4);
      v15 = [v8 creditDetails];
      v16 = [v15 accountSummary];
      unsigned __int8 v17 = [v16 requiresDebtCollectionNotices];

      if ((v17 & 1) == 0)
      {
        uint64_t v18 = PKInstallmentRoutePass;
        v19 = [(PKCreditInstallmentPlan *)v13->_installmentPlan identifier];
        v20 = +[NSString stringWithFormat:@"%@/%@/%@", v18, v19, v14];

        [(PDUserNotification *)v13 setCustomActionRoute:v20];
      }
    }
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

- (PDInstallmentAddedUserNotification)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PDInstallmentAddedUserNotification;
  v5 = [(PDUserNotification *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"installmentPlan"];
    installmentPlan = v5->_installmentPlan;
    v5->_installmentPlan = (PKCreditInstallmentPlan *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PDInstallmentAddedUserNotification;
  id v4 = a3;
  [(PDUserNotification *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_installmentPlan, @"installmentPlan", v5.receiver, v5.super_class);
}

- (unint64_t)notificationType
{
  return 25;
}

- (id)notificationContentWithDataSource:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)PDInstallmentAddedUserNotification;
  id v4 = [(PDUserNotification *)&v10 notificationContentWithDataSource:a3];
  objc_super v5 = [(PKCreditInstallmentPlan *)self->_installmentPlan product];
  uint64_t v6 = PKLocalizedBeekmanString(@"APPLE_CARD_INSTALLMENTS");
  v7 = [v5 model];
  id v8 = PKLocalizedBeekmanString(@"INSTALLMENT_ADDED_MESSAGE", @"%@", v7);

  [v4 setSubtitle:v6];
  [v4 setBody:v8];

  return v4;
}

- (void).cxx_destruct
{
}

@end