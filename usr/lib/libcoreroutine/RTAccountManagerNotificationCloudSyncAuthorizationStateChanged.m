@interface RTAccountManagerNotificationCloudSyncAuthorizationStateChanged
- (RTAccountManagerNotificationCloudSyncAuthorizationStateChanged)initWithCloudSyncAuthorizationState:(int64_t)a3;
- (int64_t)cloudSyncAuthorizationState;
@end

@implementation RTAccountManagerNotificationCloudSyncAuthorizationStateChanged

- (RTAccountManagerNotificationCloudSyncAuthorizationStateChanged)initWithCloudSyncAuthorizationState:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)RTAccountManagerNotificationCloudSyncAuthorizationStateChanged;
  result = [(RTNotification *)&v5 init];
  if (result) {
    result->_cloudSyncAuthorizationState = a3;
  }
  return result;
}

- (int64_t)cloudSyncAuthorizationState
{
  return self->_cloudSyncAuthorizationState;
}

@end