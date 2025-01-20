@interface NDNoSupportFeedPersonalizer
- (double)decayedPublisherDiversificationPenalty;
- (id)limitItemsByFlowRate:(id)a3 timeInterval:(double)a4 publisherCount:(unint64_t)a5;
- (id)limitItemsByMinimumItemQuality:(id)a3;
- (id)rankTagIDsDescending:(id)a3;
- (id)scoresForTagIDs:(id)a3;
- (id)sortItems:(id)a3 options:(int64_t)a4 configurationSet:(int64_t)a5;
- (void)prepareForUseWithCompletionHandler:(id)a3;
@end

@implementation NDNoSupportFeedPersonalizer

- (void)prepareForUseWithCompletionHandler:(id)a3
{
}

- (id)rankTagIDsDescending:(id)a3
{
  id v3 = [a3 copy];

  return v3;
}

- (id)scoresForTagIDs:(id)a3
{
  return &__NSDictionary0__struct;
}

- (double)decayedPublisherDiversificationPenalty
{
  return 0.0;
}

- (id)limitItemsByFlowRate:(id)a3 timeInterval:(double)a4 publisherCount:(unint64_t)a5
{
  return &__NSArray0__struct;
}

- (id)limitItemsByMinimumItemQuality:(id)a3
{
  return &__NSArray0__struct;
}

- (id)sortItems:(id)a3 options:(int64_t)a4 configurationSet:(int64_t)a5
{
  id v5 = objc_alloc_init((Class)FCFeedPersonalizedItems);
  [v5 setSortedItems:&__NSArray0__struct];
  v6 = objc_opt_new();
  [v5 setScoreProfiles:v6];

  return v5;
}

@end