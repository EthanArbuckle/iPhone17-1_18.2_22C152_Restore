@interface PDAccountFailedIdentityVerificationUserNotification
+ (BOOL)supportsSecureCoding;
- (BOOL)isValid;
- (PDAccountFailedIdentityVerificationUserNotification)initWithAccount:(id)a3 accountUser:(id)a4;
- (PDAccountFailedIdentityVerificationUserNotification)initWithCoder:(id)a3;
- (id)_messageString;
- (id)_titleString;
- (id)notificationContentWithDataSource:(id)a3;
- (unint64_t)notificationType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PDAccountFailedIdentityVerificationUserNotification

- (PDAccountFailedIdentityVerificationUserNotification)initWithAccount:(id)a3 accountUser:(id)a4
{
  id v7 = a4;
  id v8 = a3;
  id v9 = objc_alloc((Class)NSString);
  v10 = [v8 accountIdentifier];
  id v11 = [v9 initWithFormat:@"accountFailedIdentityVerification-%@", v10];

  v12 = [v8 associatedPassUniqueID];

  v16.receiver = self;
  v16.super_class = (Class)PDAccountFailedIdentityVerificationUserNotification;
  v13 = [(PDUserNotification *)&v16 initWithNotificationIdentifier:v11 forPassUniqueIdentifier:v12];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_accountUser, a4);
    [(PDUserNotification *)v14 setCustomActionVerb:PKUserNotificationActionRouteViewPassDetails];
  }

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PDAccountFailedIdentityVerificationUserNotification)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PDAccountFailedIdentityVerificationUserNotification;
  v5 = [(PDUserNotification *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accountUser"];
    accountUser = v5->_accountUser;
    v5->_accountUser = (PKAccountUser *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PDAccountFailedIdentityVerificationUserNotification;
  id v4 = a3;
  [(PDUserNotification *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_accountUser, @"accountUser", v5.receiver, v5.super_class);
}

- (unint64_t)notificationType
{
  return 40;
}

- (BOOL)isValid
{
  return self->_accountUser != 0;
}

- (id)notificationContentWithDataSource:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PDAccountFailedIdentityVerificationUserNotification;
  id v4 = [(PDUserNotification *)&v8 notificationContentWithDataSource:a3];
  objc_super v5 = [(PDAccountFailedIdentityVerificationUserNotification *)self _titleString];
  [v4 setSubtitle:v5];

  uint64_t v6 = [(PDAccountFailedIdentityVerificationUserNotification *)self _messageString];
  [v4 setBody:v6];

  return v4;
}

- (id)_titleString
{
  return (id)PKLocalizedMadisonString(@"ACCOUNT_FAILED_IDENTITY_VERIFICATION_TITLE");
}

- (id)_messageString
{
  return (id)PKLocalizedMadisonString(@"ACCOUNT_FAILED_IDENTITY_VERIFICATION_MESSAGE");
}

- (void).cxx_destruct
{
}

@end