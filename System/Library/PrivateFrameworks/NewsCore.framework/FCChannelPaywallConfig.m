@interface FCChannelPaywallConfig
- (BOOL)filterALaCartePaidArticlesForPaidBundleSubscribers;
- (FCChannelPaywallConfig)initWithChannelID:(id)a3 configDictionary:(id)a4;
- (NSString)channelID;
- (unint64_t)articleSoftPaywallPosition;
- (unint64_t)articleSoftPaywallPositionForPaidBundleSubscribers;
@end

@implementation FCChannelPaywallConfig

- (FCChannelPaywallConfig)initWithChannelID:(id)a3 configDictionary:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)FCChannelPaywallConfig;
  v8 = [(FCChannelPaywallConfig *)&v16 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    channelID = v8->_channelID;
    v8->_channelID = (NSString *)v9;

    v8->_filterALaCartePaidArticlesForPaidBundleSubscribers = FCAppConfigurationBoolValue(v7, @"filterALaCartePaidArticlesForPaidBundleSubscribers", 0);
    v11 = FCAppConfigurationStringValue(v7, @"articleSoftPaywallPosition", @"bottom");
    if ([v11 isEqualToString:@"top"])
    {
      uint64_t v12 = 2;
    }
    else if ([v11 isEqualToString:@"bottom"] {
           || ![v11 isEqualToString:@"none"])
    }
    {
      uint64_t v12 = 3;
    }
    else
    {
      uint64_t v12 = 1;
    }
    v8->_articleSoftPaywallPosition = v12;
    v13 = FCAppConfigurationStringValue(v7, @"articleSoftPaywallPositionForPaidBundleSubscribers", @"none");

    if ([v13 isEqualToString:@"top"])
    {
      uint64_t v14 = 2;
    }
    else if ([v13 isEqualToString:@"bottom"])
    {
      uint64_t v14 = 3;
    }
    else
    {
      [v13 isEqualToString:@"none"];
      uint64_t v14 = 1;
    }
    v8->_articleSoftPaywallPositionForPaidBundleSubscribers = v14;
  }
  return v8;
}

- (NSString)channelID
{
  return self->_channelID;
}

- (BOOL)filterALaCartePaidArticlesForPaidBundleSubscribers
{
  return self->_filterALaCartePaidArticlesForPaidBundleSubscribers;
}

- (unint64_t)articleSoftPaywallPosition
{
  return self->_articleSoftPaywallPosition;
}

- (unint64_t)articleSoftPaywallPositionForPaidBundleSubscribers
{
  return self->_articleSoftPaywallPositionForPaidBundleSubscribers;
}

- (void).cxx_destruct
{
}

@end