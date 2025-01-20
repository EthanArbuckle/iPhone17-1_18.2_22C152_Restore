@interface SXSubscriptionStatusProvider
- (SXSubscriptionStatusProvider)init;
- (SXSubscriptionStatusProvider)initWithBundleSubscriptionStatus:(int64_t)a3 channelSubscriptionStatus:(int64_t)a4;
- (int64_t)bundleSubscriptionStatus;
- (int64_t)channelSubscriptionStatus;
@end

@implementation SXSubscriptionStatusProvider

- (SXSubscriptionStatusProvider)init
{
  return [(SXSubscriptionStatusProvider *)self initWithBundleSubscriptionStatus:0 channelSubscriptionStatus:0];
}

- (SXSubscriptionStatusProvider)initWithBundleSubscriptionStatus:(int64_t)a3 channelSubscriptionStatus:(int64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)SXSubscriptionStatusProvider;
  result = [(SXSubscriptionStatusProvider *)&v7 init];
  if (result)
  {
    result->_bundleSubscriptionStatus = a3;
    result->_channelSubscriptionStatus = a4;
  }
  return result;
}

- (int64_t)bundleSubscriptionStatus
{
  return self->_bundleSubscriptionStatus;
}

- (int64_t)channelSubscriptionStatus
{
  return self->_channelSubscriptionStatus;
}

@end