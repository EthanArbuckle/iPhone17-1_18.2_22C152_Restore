@interface RTNetworkOfInterestManagerWifiLinkQualityChangedNotification
- (RTNetworkOfInterestManagerWifiLinkQualityChangedNotification)initWithLinkQuality:(unint64_t)a3;
- (unint64_t)linkQuality;
@end

@implementation RTNetworkOfInterestManagerWifiLinkQualityChangedNotification

- (RTNetworkOfInterestManagerWifiLinkQualityChangedNotification)initWithLinkQuality:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)RTNetworkOfInterestManagerWifiLinkQualityChangedNotification;
  result = [(RTNotification *)&v5 init];
  if (result) {
    result->_linkQuality = a3;
  }
  return result;
}

- (unint64_t)linkQuality
{
  return self->_linkQuality;
}

@end