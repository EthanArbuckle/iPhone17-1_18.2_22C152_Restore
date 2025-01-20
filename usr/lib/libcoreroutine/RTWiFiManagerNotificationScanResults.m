@interface RTWiFiManagerNotificationScanResults
- (NSArray)scanResults;
- (RTWiFiManagerNotificationScanResults)initWithScanResults:(id)a3;
@end

@implementation RTWiFiManagerNotificationScanResults

- (RTWiFiManagerNotificationScanResults)initWithScanResults:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RTWiFiManagerNotificationScanResults;
  v5 = [(RTNotification *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    scanResults = v5->_scanResults;
    v5->_scanResults = (NSArray *)v6;
  }
  return v5;
}

- (NSArray)scanResults
{
  return self->_scanResults;
}

- (void).cxx_destruct
{
}

@end