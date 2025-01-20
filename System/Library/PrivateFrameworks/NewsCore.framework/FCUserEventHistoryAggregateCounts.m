@interface FCUserEventHistoryAggregateCounts
+ (FCUserEventHistoryAggregateCounts)empty;
- (int64_t)channelTopic;
- (int64_t)group;
- (int64_t)tag;
- (void)setChannelTopic:(int64_t)a3;
- (void)setGroup:(int64_t)a3;
- (void)setTag:(int64_t)a3;
@end

@implementation FCUserEventHistoryAggregateCounts

+ (FCUserEventHistoryAggregateCounts)empty
{
  v2 = objc_opt_new();
  [v2 setTag:-1];
  [v2 setChannelTopic:-1];
  [v2 setGroup:-1];
  return (FCUserEventHistoryAggregateCounts *)v2;
}

- (int64_t)tag
{
  return self->_tag;
}

- (void)setTag:(int64_t)a3
{
  self->_tag = a3;
}

- (int64_t)channelTopic
{
  return self->_channelTopic;
}

- (void)setChannelTopic:(int64_t)a3
{
  self->_channelTopic = a3;
}

- (int64_t)group
{
  return self->_group;
}

- (void)setGroup:(int64_t)a3
{
  self->_group = a3;
}

@end