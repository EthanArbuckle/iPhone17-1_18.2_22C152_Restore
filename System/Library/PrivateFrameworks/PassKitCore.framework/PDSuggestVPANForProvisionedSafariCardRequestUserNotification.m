@interface PDSuggestVPANForProvisionedSafariCardRequestUserNotification
+ (BOOL)supportsSecureCoding;
+ (id)notificationIdentifierForPassUniqueIdentifier:(id)a3;
- (PDSuggestVPANForProvisionedSafariCardRequestUserNotification)initWithCoder:(id)a3;
- (PDSuggestVPANForProvisionedSafariCardRequestUserNotification)initWithFPANSuffix:(id)a3 networkName:(id)a4 passUniqueIdentifier:(id)a5;
- (id)_messageString;
- (id)notificationContentWithDataSource:(id)a3;
- (unint64_t)notificationType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PDSuggestVPANForProvisionedSafariCardRequestUserNotification

+ (id)notificationIdentifierForPassUniqueIdentifier:(id)a3
{
  return +[NSString stringWithFormat:@"SuggestVPANForProvisionedSafariCard-%@", a3];
}

- (PDSuggestVPANForProvisionedSafariCardRequestUserNotification)initWithFPANSuffix:(id)a3 networkName:(id)a4 passUniqueIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = +[PDSuggestVPANForProvisionedSafariCardRequestUserNotification notificationIdentifierForPassUniqueIdentifier:v10];
  v18.receiver = self;
  v18.super_class = (Class)PDSuggestVPANForProvisionedSafariCardRequestUserNotification;
  v12 = [(PDUserNotification *)&v18 initWithNotificationIdentifier:v11 forPassUniqueIdentifier:v10];

  if (v12)
  {
    v13 = (NSString *)[v8 copy];
    fpanSuffix = v12->_fpanSuffix;
    v12->_fpanSuffix = v13;

    v15 = (NSString *)[v9 copy];
    networkName = v12->_networkName;
    v12->_networkName = v15;

    [(PDUserNotification *)v12 setCustomActionRoute:PKUserNotificationActionRouteViewPass];
    [(PDUserNotification *)v12 setCustomActionVerb:PKUserNotificationActionRouteSetupVirtualCardNumber];
  }

  return v12;
}

- (unint64_t)notificationType
{
  return 64;
}

- (id)notificationContentWithDataSource:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PDSuggestVPANForProvisionedSafariCardRequestUserNotification;
  v4 = [(PDGenericUserNotification *)&v7 notificationContentWithDataSource:a3];
  v5 = [(PDSuggestVPANForProvisionedSafariCardRequestUserNotification *)self _messageString];
  [v4 setBody:v5];

  return v4;
}

- (id)_messageString
{
  return (id)PKLocalizedVirtualCardString(@"VIRTUAL_CARD_NOTIFICATION_SUGGEST_UPGRADE_BODY", @"%1$@%2$@", self->_networkName, self->_fpanSuffix);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PDSuggestVPANForProvisionedSafariCardRequestUserNotification)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PDSuggestVPANForProvisionedSafariCardRequestUserNotification;
  v5 = [(PDGenericUserNotification *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"networkName"];
    networkName = v5->_networkName;
    v5->_networkName = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fpanSuffix"];
    fpanSuffix = v5->_fpanSuffix;
    v5->_fpanSuffix = (NSString *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PDSuggestVPANForProvisionedSafariCardRequestUserNotification;
  id v4 = a3;
  [(PDGenericUserNotification *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_networkName, @"networkName", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_fpanSuffix forKey:@"fpanSuffix"];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fpanSuffix, 0);
  objc_storeStrong((id *)&self->_networkName, 0);
}

@end