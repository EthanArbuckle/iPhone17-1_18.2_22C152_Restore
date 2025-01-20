@interface PDAccountOverdrawnBalanceUserNotification
+ (BOOL)supportsSecureCoding;
+ (id)notificationIdentifierForAccountIdentifier:(id)a3;
- (BOOL)isValid;
- (PDAccountOverdrawnBalanceUserNotification)initWithAccount:(id)a3;
- (PDAccountOverdrawnBalanceUserNotification)initWithCoder:(id)a3;
- (PKAccount)account;
- (id)applicationMessageContent;
- (id)notificationContentWithDataSource:(id)a3;
- (unint64_t)notificationType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PDAccountOverdrawnBalanceUserNotification

+ (id)notificationIdentifierForAccountIdentifier:(id)a3
{
  return +[NSString stringWithFormat:@"%@-accountBalance", a3];
}

- (PDAccountOverdrawnBalanceUserNotification)initWithAccount:(id)a3
{
  id v5 = a3;
  v6 = v5;
  if (v5)
  {
    v7 = [v5 accountIdentifier];
    v8 = [(id)objc_opt_class() notificationIdentifierForAccountIdentifier:v7];
    v12.receiver = self;
    v12.super_class = (Class)PDAccountOverdrawnBalanceUserNotification;
    v9 = [(PDUserNotification *)&v12 initWithNotificationIdentifier:v8 forAccountIdentifier:v7];
    v10 = v9;
    if (v9)
    {
      objc_storeStrong((id *)&v9->_account, a3);
      [(PDUserNotification *)v10 setCustomActionRoute:PKURLActionRouteSavings];
    }
  }
  else
  {

    v10 = 0;
  }

  return v10;
}

- (unint64_t)notificationType
{
  return 66;
}

- (BOOL)isValid
{
  return PKIsMac() ^ 1;
}

- (id)notificationContentWithDataSource:(id)a3
{
  account = self->_account;
  id v5 = a3;
  [(PKAccount *)account feature];
  v10.receiver = self;
  v10.super_class = (Class)PDAccountOverdrawnBalanceUserNotification;
  v6 = [(PDUserNotification *)&v10 notificationContentWithDataSource:v5];

  v7 = PKLocalizedFeatureString();
  [v6 setTitle:v7];

  v8 = PKLocalizedFeatureString();
  [v6 setBody:v8];

  [v6 setInterruptionLevel:2];
  return v6;
}

- (id)applicationMessageContent
{
  [(PKAccount *)self->_account feature];
  v3 = PKLocalizedFeatureString();
  v4 = PKLocalizedFeatureString();
  id v5 = [(PDUserNotification *)self accountIdentifier];
  v6 = [@"PDSavingsAccountApplicationMessageGroupIdentifier" stringByAppendingString:v5];

  id v7 = +[PKApplicationMessageGroupDescriptor createForIdentifier:v6 withSingularSummary:v3 pluralSummary:v3];
  v8 = [(PDUserNotification *)self actionURL];
  id v9 = +[PKApplicationMessageActionURL createWithURL:v8];
  objc_super v10 = +[PDUserNotification applicationMessageIconForFeature:5];
  id v11 = +[PKApplicationMessageContentDefault createWithGroup:v7 action:v9 icon:v10 title:v3 body:v4];

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PDAccountOverdrawnBalanceUserNotification)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PDAccountOverdrawnBalanceUserNotification;
  id v5 = [(PDUserNotification *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"account"];
    account = v5->_account;
    v5->_account = (PKAccount *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PDAccountOverdrawnBalanceUserNotification;
  id v4 = a3;
  [(PDUserNotification *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_account, @"account", v5.receiver, v5.super_class);
}

- (PKAccount)account
{
  return self->_account;
}

- (void).cxx_destruct
{
}

@end