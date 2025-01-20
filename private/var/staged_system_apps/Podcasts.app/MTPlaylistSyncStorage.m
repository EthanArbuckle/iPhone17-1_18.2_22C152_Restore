@interface MTPlaylistSyncStorage
- (BOOL)playlistSyncDirtyFlag;
- (NSString)playlistSyncVersion;
- (NSString)podcastsDomainVersion;
- (id)importContext;
- (void)setPlaylistSyncDirtyFlag:(BOOL)a3;
- (void)setPlaylistSyncVersion:(id)a3;
- (void)setPodcastsDomainVersion:(id)a3;
@end

@implementation MTPlaylistSyncStorage

- (NSString)playlistSyncVersion
{
  v2 = +[SyncControllerFactory resolvedSyncController];
  v3 = [v2 playlistSyncVersion];

  return (NSString *)v3;
}

- (void)setPlaylistSyncVersion:(id)a3
{
  id v3 = a3;
  id v4 = +[SyncControllerFactory resolvedSyncController];
  [v4 setPlaylistSyncVersion:v3];
}

- (NSString)podcastsDomainVersion
{
  v2 = +[SyncKeysRepository shared];
  id v3 = [v2 podcastsDomainVersion];

  return (NSString *)v3;
}

- (void)setPodcastsDomainVersion:(id)a3
{
  id v3 = a3;
  id v4 = +[SyncKeysRepository shared];
  [v4 setPodcastsDomainVersion:v3];
}

- (BOOL)playlistSyncDirtyFlag
{
  v2 = +[SyncKeysRepository shared];
  unsigned __int8 v3 = [v2 isPlaylistSyncDirty];

  return v3;
}

- (void)setPlaylistSyncDirtyFlag:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = +[SyncKeysRepository shared];
  [v4 setIsPlaylistSyncDirty:v3];
}

- (id)importContext
{
  v2 = +[MTDB sharedInstance];
  BOOL v3 = [v2 importContext];

  return v3;
}

@end