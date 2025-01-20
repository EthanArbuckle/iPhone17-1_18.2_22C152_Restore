@interface BTAVRCP_PodcastItemsFolder
- (id)baseQuery;
- (id)targetApp;
@end

@implementation BTAVRCP_PodcastItemsFolder

- (id)baseQuery
{
  return +[MPMediaQuery podcastsQuery];
}

- (id)targetApp
{
  return off_10001F050;
}

@end