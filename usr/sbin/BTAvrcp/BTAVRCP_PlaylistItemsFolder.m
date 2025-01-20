@interface BTAVRCP_PlaylistItemsFolder
- (id)baseQuery;
- (id)targetApp;
@end

@implementation BTAVRCP_PlaylistItemsFolder

- (id)baseQuery
{
  return +[MPMediaQuery playlistsQuery];
}

- (id)targetApp
{
  return off_10001F048;
}

@end