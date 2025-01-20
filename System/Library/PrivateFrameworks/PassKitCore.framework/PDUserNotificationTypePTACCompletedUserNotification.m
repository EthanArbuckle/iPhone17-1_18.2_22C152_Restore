@interface PDUserNotificationTypePTACCompletedUserNotification
- (PDUserNotificationTypePTACCompletedUserNotification)initWithApplicationIdentifier:(id)a3;
- (unint64_t)notificationType;
@end

@implementation PDUserNotificationTypePTACCompletedUserNotification

- (PDUserNotificationTypePTACCompletedUserNotification)initWithApplicationIdentifier:(id)a3
{
  id v4 = a3;
  v5 = PKLocalizedFeatureString();
  v6 = PKLocalizedFeatureString();
  v14.receiver = self;
  v14.super_class = (Class)PDUserNotificationTypePTACCompletedUserNotification;
  v7 = [(PDGenericUserNotification *)&v14 initWithTitle:v5 message:v6];
  v8 = v7;
  if (v7)
  {
    [(PDUserNotification *)v7 setSuppressionBehavior:0];
    uint64_t v9 = PKURLActionSetup;
    uint64_t v10 = PKURLActionFeature;
    v11 = PKFeatureIdentifierToString();
    v12 = +[NSString stringWithFormat:@"%@/%@/%@", v9, v10, v11];
    [(PDUserNotification *)v8 setCustomActionRoute:v12];

    [(PDUserNotification *)v8 setNotificationIdentifier:v4];
  }

  return v8;
}

- (unint64_t)notificationType
{
  return 45;
}

@end