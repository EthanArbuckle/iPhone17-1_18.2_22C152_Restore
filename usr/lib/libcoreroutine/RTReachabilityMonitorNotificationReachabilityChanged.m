@interface RTReachabilityMonitorNotificationReachabilityChanged
- (RTReachabilityMonitorNotificationReachabilityChanged)initWithReachability:(unint64_t)a3;
- (unint64_t)reachability;
@end

@implementation RTReachabilityMonitorNotificationReachabilityChanged

- (RTReachabilityMonitorNotificationReachabilityChanged)initWithReachability:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)RTReachabilityMonitorNotificationReachabilityChanged;
  result = [(RTNotification *)&v5 init];
  if (result) {
    result->_reachability = a3;
  }
  return result;
}

- (unint64_t)reachability
{
  return self->_reachability;
}

@end