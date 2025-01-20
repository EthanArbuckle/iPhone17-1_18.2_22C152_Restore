@interface PDAccountUserMonthlySpendLimitUserNotification
+ (BOOL)supportsSecureCoding;
+ (id)notificationIdentifierForAccountUserAltDSID:(id)a3 accountIdentifier:(id)a4;
- (BOOL)isValid;
- (PDAccountUserMonthlySpendLimitUserNotification)initWithAccountUser:(id)a3 familyMember:(id)a4 monthlySpendLimit:(id)a5 accountIdentifier:(id)a6 passUniqueIdentifier:(id)a7;
- (PDAccountUserMonthlySpendLimitUserNotification)initWithCoder:(id)a3;
- (PKAccountUser)accountUser;
- (PKCurrencyAmount)monthlySpendLimit;
- (PKFamilyMember)familyMember;
- (id)notificationContentWithDataSource:(id)a3;
- (unint64_t)notificationType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PDAccountUserMonthlySpendLimitUserNotification

+ (id)notificationIdentifierForAccountUserAltDSID:(id)a3 accountIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [objc_alloc((Class)NSString) initWithFormat:@"monthlySpendLimit-%@-%@", v5, v6];

  return v7;
}

- (PDAccountUserMonthlySpendLimitUserNotification)initWithAccountUser:(id)a3 familyMember:(id)a4 monthlySpendLimit:(id)a5 accountIdentifier:(id)a6 passUniqueIdentifier:(id)a7
{
  id v13 = a3;
  id v22 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v17 = objc_opt_class();
  v18 = [v13 altDSID];
  v19 = [v17 notificationIdentifierForAccountUserAltDSID:v18 accountIdentifier:v15];

  v23.receiver = self;
  v23.super_class = (Class)PDAccountUserMonthlySpendLimitUserNotification;
  v20 = [(PDUserNotification *)&v23 initWithNotificationIdentifier:v19 forPassUniqueIdentifier:v16];

  if (v20)
  {
    objc_storeStrong((id *)&v20->_accountUser, a3);
    objc_storeStrong((id *)&v20->_familyMember, a4);
    [(PDUserNotification *)v20 setAccountIdentifier:v15];
    objc_storeStrong((id *)&v20->_monthlySpendLimit, a5);
  }

  return v20;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PDAccountUserMonthlySpendLimitUserNotification)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PDAccountUserMonthlySpendLimitUserNotification;
  id v5 = [(PDUserNotification *)&v13 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accountUser"];
    accountUser = v5->_accountUser;
    v5->_accountUser = (PKAccountUser *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"familyMember"];
    familyMember = v5->_familyMember;
    v5->_familyMember = (PKFamilyMember *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"monthlySpendLimit"];
    monthlySpendLimit = v5->_monthlySpendLimit;
    v5->_monthlySpendLimit = (PKCurrencyAmount *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PDAccountUserMonthlySpendLimitUserNotification;
  id v4 = a3;
  [(PDUserNotification *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_accountUser, @"accountUser", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_familyMember forKey:@"familyMember"];
  [v4 encodeObject:self->_monthlySpendLimit forKey:@"monthlySpendLimit"];
}

- (unint64_t)notificationType
{
  return 37;
}

- (BOOL)isValid
{
  v5.receiver = self;
  v5.super_class = (Class)PDAccountUserMonthlySpendLimitUserNotification;
  BOOL v3 = [(PDUserNotification *)&v5 isValid];
  if (v3)
  {
    if (self->_accountUser) {
      LOBYTE(v3) = self->_monthlySpendLimit != 0;
    }
    else {
      LOBYTE(v3) = 0;
    }
  }
  return v3;
}

- (id)notificationContentWithDataSource:(id)a3
{
  v23.receiver = self;
  v23.super_class = (Class)PDAccountUserMonthlySpendLimitUserNotification;
  id v4 = [(PDUserNotification *)&v23 notificationContentWithDataSource:a3];
  familyMember = self->_familyMember;
  uint64_t v6 = [(PKAccountUser *)self->_accountUser nameComponents];
  id v7 = +[PKContactResolver contactForFamilyMember:familyMember nameComponents:v6 imageData:0];

  uint64_t v8 = [(PKCurrencyAmount *)self->_monthlySpendLimit amount];
  [v8 floatValue];
  double v10 = v9;
  v11 = [v7 givenName];
  v12 = [(PKCurrencyAmount *)self->_monthlySpendLimit formattedStringValue];
  objc_super v13 = PKLocalizedMadisonString(@"ACCOUNT_USER_MONTHLY_SPEND_LIMIT_EXCEEDED_NOTIFICATION_BODY", @"%lf%@%@", *(void *)&v10, v11, v12);
  [v4 setBody:v13];

  id v14 = PKLocalizedMadisonString(@"ACCOUNT_USER_MONTHLY_SPEND_LIMIT_EXCEEDED_NOTIFICATION_TITLE");
  [v4 setSubtitle:v14];
  id v15 = +[NSDate date];
  [v4 setDate:v15];

  id v16 = [v4 userInfo];
  id v17 = [v16 mutableCopy];
  v18 = v17;
  if (v17) {
    id v19 = v17;
  }
  else {
    id v19 = objc_alloc_init((Class)NSMutableDictionary);
  }
  v20 = v19;

  v21 = [(PDUserNotification *)self passUniqueIdentifier];
  [v20 setObject:v21 forKeyedSubscript:PKUserNotificationPassUniqueIdentifierContextKey];

  [v4 setUserInfo:v20];
  return v4;
}

- (PKAccountUser)accountUser
{
  return self->_accountUser;
}

- (PKFamilyMember)familyMember
{
  return self->_familyMember;
}

- (PKCurrencyAmount)monthlySpendLimit
{
  return self->_monthlySpendLimit;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_monthlySpendLimit, 0);
  objc_storeStrong((id *)&self->_familyMember, 0);
  objc_storeStrong((id *)&self->_accountUser, 0);
}

@end