@interface PDSharingRelayServerUpdateMailboxResponse
+ (BOOL)jsonDataOptional;
- (BOOL)supportsPushNotifications;
- (PDSharingRelayServerUpdateMailboxResponse)initWithData:(id)a3;
- (void)setSupportsPushNotifications:(BOOL)a3;
@end

@implementation PDSharingRelayServerUpdateMailboxResponse

- (PDSharingRelayServerUpdateMailboxResponse)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PDSharingRelayServerUpdateMailboxResponse;
  v3 = [(PDSharingRelayServerUpdateMailboxResponse *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v5 = [(PDSharingRelayServerUpdateMailboxResponse *)v3 JSONObject];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v4->_supportsPushNotifications = [v5 PKBoolForKey:@"isPushNotificationSupported"];
    }
  }
  return v4;
}

+ (BOOL)jsonDataOptional
{
  return 1;
}

- (BOOL)supportsPushNotifications
{
  return self->_supportsPushNotifications;
}

- (void)setSupportsPushNotifications:(BOOL)a3
{
  self->_supportsPushNotifications = a3;
}

@end