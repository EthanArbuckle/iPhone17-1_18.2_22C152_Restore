@interface NSUserDefaults(FCFeedPrewarmRequest)
- (uint64_t)fc_lastKnownFeedIDs;
- (uint64_t)setFc_lastKnownFeedIDs:()FCFeedPrewarmRequest;
@end

@implementation NSUserDefaults(FCFeedPrewarmRequest)

- (uint64_t)fc_lastKnownFeedIDs
{
  return [a1 objectForKey:@"my_articles_last_known_feed_ids"];
}

- (uint64_t)setFc_lastKnownFeedIDs:()FCFeedPrewarmRequest
{
  return [a1 setObject:a3 forKey:@"my_articles_last_known_feed_ids"];
}

@end