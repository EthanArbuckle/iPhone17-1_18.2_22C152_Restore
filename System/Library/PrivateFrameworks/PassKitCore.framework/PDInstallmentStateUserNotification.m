@interface PDInstallmentStateUserNotification
+ (BOOL)supportsSecureCoding;
- (BOOL)isValid;
- (NSDate)statementClosingDate;
- (PDInstallmentStateUserNotification)initWithAccount:(id)a3 installmentPlan:(id)a4 passUniqueIdentifier:(id)a5;
- (PDInstallmentStateUserNotification)initWithCoder:(id)a3;
- (id)notificationContentWithDataSource:(id)a3;
- (unint64_t)notificationType;
- (void)encodeWithCoder:(id)a3;
- (void)setStatementClosingDate:(id)a3;
@end

@implementation PDInstallmentStateUserNotification

- (PDInstallmentStateUserNotification)initWithAccount:(id)a3 installmentPlan:(id)a4 passUniqueIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v9)
  {
    v11 = [v9 identifier];
    v12 = +[NSString stringWithFormat:@"%@-installmentPlanState", v11];

    v22.receiver = self;
    v22.super_class = (Class)PDInstallmentStateUserNotification;
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

- (PDInstallmentStateUserNotification)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PDInstallmentStateUserNotification;
  v5 = [(PDUserNotification *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"installmentPlan"];
    installmentPlan = v5->_installmentPlan;
    v5->_installmentPlan = (PKCreditInstallmentPlan *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"statementClosingDate"];
    statementClosingDate = v5->_statementClosingDate;
    v5->_statementClosingDate = (NSDate *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PDInstallmentStateUserNotification;
  id v4 = a3;
  [(PDUserNotification *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_installmentPlan, @"installmentPlan", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_statementClosingDate forKey:@"statementClosingDate"];
}

- (unint64_t)notificationType
{
  return 26;
}

- (BOOL)isValid
{
  return [(PKCreditInstallmentPlan *)self->_installmentPlan state] == (id)2
      && self->_statementClosingDate != 0;
}

- (id)notificationContentWithDataSource:(id)a3
{
  v19.receiver = self;
  v19.super_class = (Class)PDInstallmentStateUserNotification;
  id v4 = [(PDUserNotification *)&v19 notificationContentWithDataSource:a3];
  if ([(PKCreditInstallmentPlan *)self->_installmentPlan state] == (id)2)
  {
    objc_super v5 = [(PKCreditInstallmentPlan *)self->_installmentPlan payments];
    uint64_t v6 = [v5 firstObject];

    v7 = [(PKCreditInstallmentPlan *)self->_installmentPlan product];
    if (v6)
    {
      uint64_t v8 = [v6 amountDue];
      id v9 = [v6 currencyCode];
      id v10 = PKCurrencyAmountCreate(v8, v9, 0);

      objc_super v11 = +[NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
      v12 = [v11 components:8 fromDate:self->_statementClosingDate];
      [v12 month];

      PKGregorianMonthSpecificLocalizedStringKeyForKey();
      v13 = (NSString *)objc_claimAutoreleasedReturnValue();
      v14 = [v7 model];
      v15 = [v10 formattedStringValue];
      v16 = PKLocalizedBeekmanString(v13, @"%@%@", v14, v15);
    }
    else
    {
      v16 = 0;
    }
  }
  else
  {
    v16 = 0;
  }
  unsigned __int8 v17 = PKLocalizedBeekmanString(@"APPLE_CARD_INSTALLMENTS");
  [v4 setSubtitle:v17];
  if (v16) {
    [v4 setBody:v16];
  }

  return v4;
}

- (NSDate)statementClosingDate
{
  return self->_statementClosingDate;
}

- (void)setStatementClosingDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statementClosingDate, 0);
  objc_storeStrong((id *)&self->_installmentPlan, 0);
}

@end