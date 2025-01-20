@interface FCFeedItemHeadlinesOperationProperties
- (FCMapTable)feedItemScoreProfiles;
- (FCMapTable)resultHeadlinesByFeedItem;
- (void)dealloc;
- (void)setFeedItemScoreProfiles:(id)a3;
- (void)setResultHeadlinesByFeedItem:(id)a3;
@end

@implementation FCFeedItemHeadlinesOperationProperties

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)FCFeedItemHeadlinesOperationProperties;
  [(FCFeedItemHeadlinesOperationProperties *)&v3 dealloc];
}

- (FCMapTable)resultHeadlinesByFeedItem
{
  return self->_resultHeadlinesByFeedItem;
}

- (void)setResultHeadlinesByFeedItem:(id)a3
{
}

- (FCMapTable)feedItemScoreProfiles
{
  return self->_feedItemScoreProfiles;
}

- (void)setFeedItemScoreProfiles:(id)a3
{
}

@end