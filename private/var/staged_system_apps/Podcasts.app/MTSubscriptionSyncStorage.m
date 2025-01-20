@interface MTSubscriptionSyncStorage
+ (void)resetAllSubscriptionsSyncKeys;
+ (void)resetForSyncType:(int64_t)a3;
- (BOOL)syncDirtyFlag;
- (MTSubscriptionSyncStorage)init;
- (NSString)podcastsDomainVersion;
- (NSString)syncVersion;
- (double)subscriptionsLastSyncTimestamp;
- (id)importContext;
- (int64_t)syncType;
- (void)cleanUpOldHiddenPodcasts;
- (void)disableSubscriptionsWithUuids:(id)a3 ctx:(id)a4;
- (void)enableSubscriptionOnPodcastUuid:(id)a3 ctx:(id)a4;
- (void)immediatelyDeleteAllHiddenPodcasts;
- (void)recordUserAction:(id)a3 dataSource:(id)a4 withData:(id)a5;
- (void)setPodcastsDomainVersion:(id)a3;
- (void)setSyncDirtyFlag:(BOOL)a3;
- (void)setSyncType:(int64_t)a3;
- (void)setSyncVersion:(id)a3;
- (void)updateSubscriptionsLastSyncTimestamp;
@end

@implementation MTSubscriptionSyncStorage

- (MTSubscriptionSyncStorage)init
{
  v6.receiver = self;
  v6.super_class = (Class)MTSubscriptionSyncStorage;
  v2 = [(MTSubscriptionSyncStorage *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(_TtC8Podcasts20CloudSyncBugReporter);
    cloudSyncBugReporter = v2->_cloudSyncBugReporter;
    v2->_cloudSyncBugReporter = v3;
  }
  return v2;
}

- (void)setPodcastsDomainVersion:(id)a3
{
  id v3 = a3;
  id v4 = +[SyncKeysRepository shared];
  [v4 setPodcastsDomainVersion:v3];
}

- (NSString)podcastsDomainVersion
{
  v2 = +[SyncKeysRepository shared];
  id v3 = [v2 podcastsDomainVersion];

  return (NSString *)v3;
}

- (void)setSyncDirtyFlag:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = +[SyncKeysRepository shared];
  [v5 markSubscriptionSyncDirty:v3 for:[self syncType]];
}

- (BOOL)syncDirtyFlag
{
  BOOL v3 = +[SyncKeysRepository shared];
  LOBYTE(self) = [v3 isSubscriptionSyncDirtyFor:[self syncType]];

  return (char)self;
}

- (double)subscriptionsLastSyncTimestamp
{
  BOOL v3 = +[SyncKeysRepository shared];
  [v3 subscriptionsLastSyncTimestampFor:[self syncType]];
  double v5 = v4;

  return v5;
}

- (void)updateSubscriptionsLastSyncTimestamp
{
  id v3 = +[SyncKeysRepository shared];
  [v3 updateSubscriptionsLastSyncTimestampFor:[self syncType]];
}

- (NSString)syncVersion
{
  id v3 = +[SyncKeysRepository shared];
  double v4 = [v3 subscriptionsSyncVersionFor:[self syncType]];

  return (NSString *)v4;
}

- (void)setSyncVersion:(id)a3
{
  id v4 = a3;
  double v5 = +[SyncKeysRepository shared];
  [v5 updateSubscriptionsSyncVersionFor:[self syncType] newValue:v4];

  objc_super v6 = +[SyncControllerFactory resolvedSyncClass];
  int64_t v7 = [(MTSubscriptionSyncStorage *)self syncType];

  [(objc_class *)v6 didUpdateSubscriptionsSyncVersionForSyncType:v7];
}

+ (void)resetAllSubscriptionsSyncKeys
{
  [a1 resetForSyncType:0];

  [a1 resetForSyncType:1];
}

+ (void)resetForSyncType:(int64_t)a3
{
  id v4 = +[SyncKeysRepository shared];
  [v4 resetSubscriptionsSyncVersionFor:a3];

  double v5 = +[SyncKeysRepository shared];
  [v5 markSubscriptionSyncDirty:1 for:a3];

  id v6 = +[SyncKeysRepository shared];
  [v6 resetSubscriptionsLastSyncTimestampFor:a3];
}

- (void)recordUserAction:(id)a3 dataSource:(id)a4 withData:(id)a5
{
}

- (void)cleanUpOldHiddenPodcasts
{
  id v2 = +[MTLibrary sharedInstance];
  [v2 cleanUpOldHiddenPodcasts];
}

- (void)immediatelyDeleteAllHiddenPodcasts
{
  if (os_feature_enabled_recently_unfollowed())
  {
    id v3 = _MTLogCategoryCloudSync();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)double v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "This device is at the same time in read-only sync mode AND is supposed to have a Recently Unfollowed feature. This is a programming error and will break Recently Unfollowed badly.", v5, 2u);
    }

    [(CloudSyncBugReporter *)self->_cloudSyncBugReporter report:5 userInfo:0];
  }
  id v4 = +[MTLibrary sharedInstance];
  [v4 immediatelyDeleteAllHiddenPodcasts];
}

- (void)enableSubscriptionOnPodcastUuid:(id)a3 ctx:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[PodcastsStateCoordinator shared];
  [v7 unsafeEnableSubscriptionOnPodcastUUID:v6 from:0 context:v5];
}

- (void)disableSubscriptionsWithUuids:(id)a3 ctx:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[PodcastsStateCoordinator shared];
  [v7 disableSubscriptionsOnPodcastUUIDs:v6 from:0 context:v5];
}

- (id)importContext
{
  id v2 = +[MTDB sharedInstance];
  id v3 = [v2 importContext];

  return v3;
}

- (int64_t)syncType
{
  return self->syncType;
}

- (void)setSyncType:(int64_t)a3
{
  self->syncType = a3;
}

- (void).cxx_destruct
{
}

@end