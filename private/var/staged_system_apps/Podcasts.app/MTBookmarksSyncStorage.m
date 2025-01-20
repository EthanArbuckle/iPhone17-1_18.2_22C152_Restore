@interface MTBookmarksSyncStorage
+ (BOOL)hasBookmarksSync;
+ (double)lastBookmarksSyncTimestampForSyncType:(int64_t)a3;
+ (id)bookmarksKeyForSyncType:(int64_t)a3;
+ (id)bookmarksLastSyncKeyForSyncType:(int64_t)a3;
+ (id)bookmarksSyncVersionForSyncType:(int64_t)a3;
+ (void)resetBookmarksSync;
+ (void)setBookmarksSyncVersion:(id)a3 syncType:(int64_t)a4;
+ (void)setLastBookmarksSyncTimestamp:(double)a3 syncType:(int64_t)a4;
- (BOOL)syncDirtyFlag;
- (MTBookmarksSyncStorage)initWithSyncType:(int64_t)a3;
- (NSString)logPrefix;
- (NSString)podcastsDomainVersion;
- (NSString)syncVersion;
- (double)lastSyncTimestamp;
- (id)importContext;
- (int64_t)syncType;
- (void)setLastSyncTimestamp:(double)a3;
- (void)setPodcastsDomainVersion:(id)a3;
- (void)setSyncDirtyFlag:(BOOL)a3;
- (void)setSyncType:(int64_t)a3;
- (void)setSyncVersion:(id)a3;
- (void)unsafeBookmarkEpisode:(id)a3 onTimestamp:(double)a4;
- (void)unsafeRemoveFromBookmarksEpisodes:(id)a3 context:(id)a4;
@end

@implementation MTBookmarksSyncStorage

+ (BOOL)hasBookmarksSync
{
  uint64_t v3 = 0;
  BOOL v4 = 0;
  char v5 = 1;
  do
  {
    char v6 = v5;
    if (v4)
    {
      BOOL v4 = 1;
    }
    else
    {
      v7 = [a1 bookmarksSyncVersionForSyncType:v3];
      if (v7)
      {
        BOOL v4 = 1;
      }
      else
      {
        [a1 lastBookmarksSyncTimestampForSyncType:v3];
        BOOL v4 = v8 != 0.0;
      }
    }
    char v5 = 0;
    uint64_t v3 = 1;
  }
  while ((v6 & 1) != 0);
  return v4;
}

+ (double)lastBookmarksSyncTimestampForSyncType:(int64_t)a3
{
  uint64_t v3 = [a1 bookmarksLastSyncKeyForSyncType:a3];
  BOOL v4 = +[NSUserDefaults standardUserDefaults];
  [v4 doubleForKey:v3];
  double v6 = v5;

  return v6;
}

+ (id)bookmarksSyncVersionForSyncType:(int64_t)a3
{
  uint64_t v3 = [a1 bookmarksKeyForSyncType:a3];
  BOOL v4 = +[NSUserDefaults standardUserDefaults];
  double v5 = [v4 stringForKey:v3];

  return v5;
}

+ (id)bookmarksLastSyncKeyForSyncType:(int64_t)a3
{
  if (a3 == 1) {
    return @"bookmarks-drm-last-sync";
  }
  else {
    return @"bookmarks-last-sync";
  }
}

+ (id)bookmarksKeyForSyncType:(int64_t)a3
{
  uint64_t v3 = (id *)&kMTBookmarksKey;
  if (a3 == 1) {
    uint64_t v3 = (id *)&kMTBookmarksDRMKey;
  }
  return *v3;
}

- (MTBookmarksSyncStorage)initWithSyncType:(int64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MTBookmarksSyncStorage;
  BOOL v4 = [(MTBookmarksSyncStorage *)&v7 init];
  double v5 = v4;
  if (v4) {
    [(MTBookmarksSyncStorage *)v4 setSyncType:a3];
  }
  return v5;
}

- (NSString)syncVersion
{
  int64_t v2 = [(MTBookmarksSyncStorage *)self syncType];

  return (NSString *)+[MTBookmarksSyncStorage bookmarksSyncVersionForSyncType:v2];
}

- (void)setSyncVersion:(id)a3
{
  id v4 = a3;
  +[MTBookmarksSyncStorage setBookmarksSyncVersion:v4 syncType:[(MTBookmarksSyncStorage *)self syncType]];
}

- (double)lastSyncTimestamp
{
  int64_t v2 = [(MTBookmarksSyncStorage *)self syncType];

  +[MTBookmarksSyncStorage lastBookmarksSyncTimestampForSyncType:v2];
  return result;
}

- (void)setLastSyncTimestamp:(double)a3
{
  int64_t v4 = [(MTBookmarksSyncStorage *)self syncType];

  +[MTBookmarksSyncStorage setLastBookmarksSyncTimestamp:v4 syncType:a3];
}

+ (void)setBookmarksSyncVersion:(id)a3 syncType:(int64_t)a4
{
  id v10 = a3;
  double v6 = [a1 bookmarksKeyForSyncType:a4];
  id v7 = [v10 length];
  double v8 = +[NSUserDefaults standardUserDefaults];
  v9 = v8;
  if (v7) {
    [v8 setObject:v10 forKey:v6];
  }
  else {
    [v8 removeObjectForKey:v6];
  }
}

+ (void)setLastBookmarksSyncTimestamp:(double)a3 syncType:(int64_t)a4
{
  id v7 = [a1 bookmarksLastSyncKeyForSyncType:a4];
  double v5 = +[NSUserDefaults standardUserDefaults];
  double v6 = v5;
  if (a3 <= 0.0) {
    [v5 removeObjectForKey:v7];
  }
  else {
    [v5 setDouble:v7 forKey:a3];
  }
}

+ (void)resetBookmarksSync
{
  [a1 setBookmarksSyncVersion:0 syncType:0];
  [a1 setLastBookmarksSyncTimestamp:0 syncType:0.0];
  uint64_t v3 = +[SyncKeysRepository shared];
  [v3 markBookmarksSyncDirty:1 for:0];

  [a1 setBookmarksSyncVersion:0 syncType:1];
  [a1 setLastBookmarksSyncTimestamp:1 syncType:0.0];
  id v4 = +[SyncKeysRepository shared];
  [v4 markBookmarksSyncDirty:1 for:1];
}

- (NSString)podcastsDomainVersion
{
  int64_t v2 = +[SyncKeysRepository shared];
  uint64_t v3 = [v2 podcastsDomainVersion];

  return (NSString *)v3;
}

- (void)setPodcastsDomainVersion:(id)a3
{
  id v3 = a3;
  id v4 = +[SyncKeysRepository shared];
  [v4 setPodcastsDomainVersion:v3];
}

- (void)setSyncDirtyFlag:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = +[SyncKeysRepository shared];
  [v5 markBookmarksSyncDirty:v3 for:self->syncType];
}

- (BOOL)syncDirtyFlag
{
  BOOL v3 = +[SyncKeysRepository shared];
  LOBYTE(self) = [v3 isBookmarksSyncDirtyFor:[self syncType]];

  return (char)self;
}

- (id)importContext
{
  int64_t v2 = +[MTDB sharedInstance];
  BOOL v3 = [v2 importContext];

  return v3;
}

- (void)unsafeBookmarkEpisode:(id)a3 onTimestamp:(double)a4
{
  id v5 = a3;
  id v6 = +[PodcastsStateCoordinator shared];
  [v6 unsafeBookmarkEpisode:v5 onTimestamp:0 shouldDownloadEpisode:1 from:a4];
}

- (void)unsafeRemoveFromBookmarksEpisodes:(id)a3 context:(id)a4
{
  id v5 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        v11 = _MTLogCategoryCloudSync();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          v12 = [(MTBookmarksSyncStorage *)self logPrefix];
          id v13 = [v10 storeTrackId];
          *(_DWORD *)buf = 138412546;
          v20 = v12;
          __int16 v21 = 2048;
          id v22 = v13;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%@ Step 2: missing bookmark adam id from cloud: %lld", buf, 0x16u);
        }
        v14 = +[PodcastsStateCoordinator shared];
        [v14 unsafeRemoveEpisodeFromBookmarks:v10 from:1];
      }
      id v7 = [v5 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v7);
  }
}

- (NSString)logPrefix
{
  if (self->syncType == 1) {
    return (NSString *)@"[Bookmarks DRM Sync]";
  }
  else {
    return (NSString *)@"[Bookmarks Sync]";
  }
}

- (int64_t)syncType
{
  return self->syncType;
}

- (void)setSyncType:(int64_t)a3
{
  self->syncType = a3;
}

@end