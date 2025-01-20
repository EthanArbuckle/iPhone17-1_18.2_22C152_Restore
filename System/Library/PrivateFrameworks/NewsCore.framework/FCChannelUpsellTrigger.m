@interface FCChannelUpsellTrigger
- (FCChannelUpsellTrigger)initWithConfigDictionary:(id)a3;
- (NSString)nonSubscriberUpsellArticleID;
- (NSString)subscriberUpsellArticleID;
- (int64_t)triggerCount;
- (unint64_t)triggerMethod;
- (void)setNonSubscriberUpsellArticleID:(id)a3;
- (void)setSubscriberUpsellArticleID:(id)a3;
- (void)setTriggerCount:(int64_t)a3;
- (void)setTriggerMethod:(unint64_t)a3;
@end

@implementation FCChannelUpsellTrigger

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nonSubscriberUpsellArticleID, 0);
  objc_storeStrong((id *)&self->_subscriberUpsellArticleID, 0);
}

- (unint64_t)triggerMethod
{
  return self->_triggerMethod;
}

- (FCChannelUpsellTrigger)initWithConfigDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)FCChannelUpsellTrigger;
  v5 = [(FCChannelUpsellTrigger *)&v12 init];
  if (v5)
  {
    v6 = FCAppConfigurationStringValue(v4, @"triggerMethod", 0);
    v5->_triggerMethod = FCChannelUpsellTriggerMethodForValue(v6);

    v5->_triggerCount = FCAppConfigurationIntegerValue(v4, @"triggerCount", 0);
    uint64_t v7 = FCAppConfigurationStringValue(v4, @"subscriberUpsellArticleID", 0);
    subscriberUpsellArticleID = v5->_subscriberUpsellArticleID;
    v5->_subscriberUpsellArticleID = (NSString *)v7;

    uint64_t v9 = FCAppConfigurationStringValue(v4, @"nonSubscriberUpsellArticleID", 0);
    nonSubscriberUpsellArticleID = v5->_nonSubscriberUpsellArticleID;
    v5->_nonSubscriberUpsellArticleID = (NSString *)v9;
  }
  return v5;
}

- (void)setTriggerMethod:(unint64_t)a3
{
  self->_triggerMethod = a3;
}

- (int64_t)triggerCount
{
  return self->_triggerCount;
}

- (void)setTriggerCount:(int64_t)a3
{
  self->_triggerCount = a3;
}

- (NSString)subscriberUpsellArticleID
{
  return self->_subscriberUpsellArticleID;
}

- (void)setSubscriberUpsellArticleID:(id)a3
{
}

- (NSString)nonSubscriberUpsellArticleID
{
  return self->_nonSubscriberUpsellArticleID;
}

- (void)setNonSubscriberUpsellArticleID:(id)a3
{
}

@end