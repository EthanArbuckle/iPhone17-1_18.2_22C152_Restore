@interface PDAccountBackgroundProvisionCompleteUserNotification
+ (BOOL)supportsSecureCoding;
- (BOOL)isValid;
- (PDAccountBackgroundProvisionCompleteUserNotification)initWithCoder:(id)a3;
- (PDAccountBackgroundProvisionCompleteUserNotification)initWithFeatureIdentifier:(unint64_t)a3 passUniqueIdentifier:(id)a4 supportsInStorePayment:(BOOL)a5;
- (id)_messageString;
- (id)_titleString;
- (id)notificationContentWithDataSource:(id)a3;
- (unint64_t)notificationType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PDAccountBackgroundProvisionCompleteUserNotification

- (PDAccountBackgroundProvisionCompleteUserNotification)initWithFeatureIdentifier:(unint64_t)a3 passUniqueIdentifier:(id)a4 supportsInStorePayment:(BOOL)a5
{
  id v8 = a4;
  id v9 = objc_alloc((Class)NSString);
  v10 = PKFeatureIdentifierToString();
  id v11 = [v9 initWithFormat:@"accountBackgroundProvisionComplete-%@", v10];

  v14.receiver = self;
  v14.super_class = (Class)PDAccountBackgroundProvisionCompleteUserNotification;
  v12 = [(PDUserNotification *)&v14 initWithNotificationIdentifier:v11 forPassUniqueIdentifier:v8];

  if (v12)
  {
    v12->_feature = a3;
    v12->_supportsInStorePayment = a5;
    [(PDUserNotification *)v12 setSuppressionBehavior:0];
    [(PDUserNotification *)v12 setCustomActionRoute:PKUserNotificationActionRouteViewPass];
  }

  return v12;
}

- (unint64_t)notificationType
{
  return 46;
}

- (BOOL)isValid
{
  return self->_feature != 0;
}

- (id)notificationContentWithDataSource:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PDAccountBackgroundProvisionCompleteUserNotification;
  v4 = [(PDGenericUserNotification *)&v8 notificationContentWithDataSource:a3];
  v5 = [(PDAccountBackgroundProvisionCompleteUserNotification *)self _titleString];
  [v4 setTitle:v5];

  v6 = [(PDAccountBackgroundProvisionCompleteUserNotification *)self _messageString];
  [v4 setBody:v6];

  return v4;
}

- (id)_titleString
{
  if (self->_feature == 4)
  {
    v2 = PKLocalizedLynxString(@"PROVISION_NOTIFICATION_TITLE");
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)_messageString
{
  if (self->_feature == 4)
  {
    id v3 = objc_alloc((Class)NSString);
    if (self->_supportsInStorePayment) {
      CFStringRef v4 = &stru_10075AAD8;
    }
    else {
      CFStringRef v4 = @"_NO_IN_STORE_PAYMENT";
    }
    v5 = (NSString *)[v3 initWithFormat:@"PROVISION_NOTIFICATION_MESSAGE%@", v4];
    v6 = PKLocalizedLynxString(v5);
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PDAccountBackgroundProvisionCompleteUserNotification)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PDAccountBackgroundProvisionCompleteUserNotification;
  v5 = [(PDGenericUserNotification *)&v8 initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"featureIdentifier"];
    v5->_feature = (unint64_t)[v6 unsignedIntegerValue];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PDAccountBackgroundProvisionCompleteUserNotification;
  id v4 = a3;
  [(PDGenericUserNotification *)&v6 encodeWithCoder:v4];
  v5 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", self->_feature, v6.receiver, v6.super_class);
  [v4 encodeObject:v5 forKey:@"featureIdentifier"];
}

@end