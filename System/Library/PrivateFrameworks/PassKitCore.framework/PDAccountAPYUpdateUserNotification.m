@interface PDAccountAPYUpdateUserNotification
+ (BOOL)supportsSecureCoding;
+ (id)notificationIdentifierForAccountIdentifier:(id)a3;
- (BOOL)isValid;
- (PDAccountAPYUpdateUserNotification)initWithAccount:(id)a3;
- (PDAccountAPYUpdateUserNotification)initWithCoder:(id)a3;
- (PKAccount)account;
- (id)_messageStringForAPY:(id)a3 apyDidIncrease:(BOOL)a4;
- (id)_subtitleStringForAPYDidIncrease:(BOOL)a3;
- (id)_titleString;
- (id)notificationContentWithDataSource:(id)a3;
- (unint64_t)notificationType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PDAccountAPYUpdateUserNotification

+ (id)notificationIdentifierForAccountIdentifier:(id)a3
{
  return +[NSString stringWithFormat:@"%@-apyUpdate", a3];
}

- (PDAccountAPYUpdateUserNotification)initWithAccount:(id)a3
{
  id v5 = a3;
  v6 = v5;
  if (v5)
  {
    v7 = [v5 accountIdentifier];
    v8 = [(id)objc_opt_class() notificationIdentifierForAccountIdentifier:v7];
    v12.receiver = self;
    v12.super_class = (Class)PDAccountAPYUpdateUserNotification;
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
  return 65;
}

- (BOOL)isValid
{
  return PKIsMac() ^ 1;
}

- (id)notificationContentWithDataSource:(id)a3
{
  account = self->_account;
  id v5 = a3;
  v6 = [(PKAccount *)account savingsDetails];
  v7 = [v6 accountSummary];
  v8 = [v7 formattedAPY];

  v9 = [(PKAccount *)self->_account savingsDetails];
  v10 = [v9 accountSummary];
  v11 = [v10 apy];

  objc_super v12 = PKSavingsPreviousAPYForUpdateMessage();
  BOOL v13 = [v11 compare:v12] == (id)1;
  v19.receiver = self;
  v19.super_class = (Class)PDAccountAPYUpdateUserNotification;
  v14 = [(PDUserNotification *)&v19 notificationContentWithDataSource:v5];

  v15 = [(PDAccountAPYUpdateUserNotification *)self _titleString];
  [v14 setTitle:v15];

  v16 = [(PDAccountAPYUpdateUserNotification *)self _subtitleStringForAPYDidIncrease:v13];
  [v14 setSubtitle:v16];

  v17 = [(PDAccountAPYUpdateUserNotification *)self _messageStringForAPY:v8 apyDidIncrease:v13];
  [v14 setBody:v17];

  return v14;
}

- (id)_titleString
{
  return (id)PKLocalizedFeatureString();
}

- (id)_subtitleStringForAPYDidIncrease:(BOOL)a3
{
  return (id)PKLocalizedFeatureString();
}

- (id)_messageStringForAPY:(id)a3 apyDidIncrease:(BOOL)a4
{
  return (id)PKLocalizedFeatureString();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PDAccountAPYUpdateUserNotification)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PDAccountAPYUpdateUserNotification;
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
  v5.super_class = (Class)PDAccountAPYUpdateUserNotification;
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