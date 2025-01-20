@interface PDISO18013UpdateUserNotification
- (PDISO18013UpdateUserNotification)initWithMessage:(id)a3 forPassUniqueIdentifier:(id)a4;
- (unint64_t)notificationType;
@end

@implementation PDISO18013UpdateUserNotification

- (PDISO18013UpdateUserNotification)initWithMessage:(id)a3 forPassUniqueIdentifier:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)PDISO18013UpdateUserNotification;
  v4 = [(PDGenericUserNotification *)&v7 initWithMessage:a3 forPassUniqueIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    [(PDUserNotification *)v4 setCustomActionRoute:PKUserNotificationActionRouteViewPass];
    [(PDUserNotification *)v5 setCustomActionVerb:PKUserNotificationActionRouteViewISO18013Details];
  }
  return v5;
}

- (unint64_t)notificationType
{
  return 41;
}

@end