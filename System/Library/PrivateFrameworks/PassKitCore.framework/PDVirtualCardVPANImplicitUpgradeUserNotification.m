@interface PDVirtualCardVPANImplicitUpgradeUserNotification
+ (BOOL)supportsSecureCoding;
+ (id)notificationIdentifierForPassUniqueIdentifier:(id)a3;
- (PDVirtualCardVPANImplicitUpgradeUserNotification)initWithCardName:(id)a3 passUniqueIdentifier:(id)a4;
- (PDVirtualCardVPANImplicitUpgradeUserNotification)initWithCoder:(id)a3;
- (id)_messageString;
- (id)notificationContentWithDataSource:(id)a3;
- (unint64_t)notificationType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PDVirtualCardVPANImplicitUpgradeUserNotification

+ (id)notificationIdentifierForPassUniqueIdentifier:(id)a3
{
  return +[NSString stringWithFormat:@"ImplicitVPANUpgrade-%@", a3];
}

- (PDVirtualCardVPANImplicitUpgradeUserNotification)initWithCardName:(id)a3 passUniqueIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = +[PDVirtualCardVPANImplicitUpgradeUserNotification notificationIdentifierForPassUniqueIdentifier:v7];
  v13.receiver = self;
  v13.super_class = (Class)PDVirtualCardVPANImplicitUpgradeUserNotification;
  v9 = [(PDUserNotification *)&v13 initWithNotificationIdentifier:v8 forPassUniqueIdentifier:v7];

  if (v9)
  {
    v10 = (NSString *)[v6 copy];
    cardName = v9->_cardName;
    v9->_cardName = v10;

    [(PDUserNotification *)v9 setCustomActionRoute:PKUserNotificationActionRouteViewPass];
  }

  return v9;
}

- (unint64_t)notificationType
{
  return 62;
}

- (id)notificationContentWithDataSource:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PDVirtualCardVPANImplicitUpgradeUserNotification;
  v4 = [(PDGenericUserNotification *)&v7 notificationContentWithDataSource:a3];
  v5 = [(PDVirtualCardVPANImplicitUpgradeUserNotification *)self _messageString];
  [v4 setBody:v5];

  return v4;
}

- (id)_messageString
{
  return (id)PKLocalizedVirtualCardString(@"VIRTUAL_CARD_NOTIFICATION_IMPLICIT_UPGRADE_BODY", @"%@", self->_cardName);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PDVirtualCardVPANImplicitUpgradeUserNotification)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PDVirtualCardVPANImplicitUpgradeUserNotification;
  v5 = [(PDGenericUserNotification *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cardName"];
    cardName = v5->_cardName;
    v5->_cardName = (NSString *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PDVirtualCardVPANImplicitUpgradeUserNotification;
  id v4 = a3;
  [(PDGenericUserNotification *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_cardName, @"cardName", v5.receiver, v5.super_class);
}

- (void).cxx_destruct
{
}

@end