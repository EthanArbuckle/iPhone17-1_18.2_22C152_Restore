@interface RTWiFiManagerNotificationLinkStatusChanged
- (NSArray)accessPoints;
- (RTWiFiManagerNotificationLinkStatusChanged)initWithLinkStatus:(unint64_t)a3 accessPoints:(id)a4;
- (unint64_t)linkStatus;
@end

@implementation RTWiFiManagerNotificationLinkStatusChanged

- (RTWiFiManagerNotificationLinkStatusChanged)initWithLinkStatus:(unint64_t)a3 accessPoints:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)RTWiFiManagerNotificationLinkStatusChanged;
  v7 = [(RTNotification *)&v12 init];
  v8 = v7;
  if (v7)
  {
    v7->_linkStatus = a3;
    uint64_t v9 = [v6 copy];
    accessPoints = v8->_accessPoints;
    v8->_accessPoints = (NSArray *)v9;
  }
  return v8;
}

- (unint64_t)linkStatus
{
  return self->_linkStatus;
}

- (NSArray)accessPoints
{
  return self->_accessPoints;
}

- (void).cxx_destruct
{
}

@end