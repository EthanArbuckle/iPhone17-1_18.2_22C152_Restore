@interface PDNFCPayloadStateUpdateUserNotification
+ (BOOL)supportsSecureCoding;
- (PDNFCPayloadStateUpdateUserNotification)initWithTitle:(id)a3 message:(id)a4 forPassUniqueIdentifier:(id)a5;
- (id)description;
- (unint64_t)notificationType;
@end

@implementation PDNFCPayloadStateUpdateUserNotification

- (PDNFCPayloadStateUpdateUserNotification)initWithTitle:(id)a3 message:(id)a4 forPassUniqueIdentifier:(id)a5
{
  v8.receiver = self;
  v8.super_class = (Class)PDNFCPayloadStateUpdateUserNotification;
  v5 = [(PDGenericUserNotification *)&v8 initWithTitle:a3 message:a4 forPassUniqueIdentifier:a5];
  v6 = v5;
  if (v5)
  {
    [(PDUserNotification *)v5 setCustomActionRoute:PKUserNotificationActionRouteViewPass];
    [(PDUserNotification *)v6 setReissueBannerOnUpdate:1];
  }
  return v6;
}

- (unint64_t)notificationType
{
  return 47;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v5 = +[NSMutableString stringWithFormat:@"<%@: %p; ", v4, self];

  v6 = [(PDUserNotification *)self passUniqueIdentifier];
  [v5 appendFormat:@"passIdentifier: '%@'; ", v6];

  v7 = [(PDGenericUserNotification *)self title];
  [v5 appendFormat:@"title: '%@'; ", v7];

  objc_super v8 = [(PDGenericUserNotification *)self message];
  [v5 appendFormat:@"message: '%@'; ", v8];

  [v5 appendFormat:@">"];
  v9 = +[NSString stringWithString:v5];

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end