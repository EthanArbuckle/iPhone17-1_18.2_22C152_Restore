@interface MTPodcast
+ (id)allPossibleEpisodeListSortOrderProperties;
+ (id)podcastUuidForFeedUrl:(id)a3 ctx:(id)a4;
+ (id)podcastUuidForFeedUrlString:(id)a3 ctx:(id)a4;
+ (id)predicateForSubscriptionSyncType:(int64_t)a3;
+ (id)predicateForSyncablePodcastsForSyncType:(int64_t)a3;
+ (id)sortDescriptorsForNewestOnTop;
+ (id)sortDescriptorsForOldestOnTop;
- (BOOL)hasAtLeastOneSeason;
- (BOOL)hasMultipleSeasons;
- (BOOL)isValidShowTypeSetting:(int64_t)a3;
- (BOOL)sortAscending;
- (BOOL)updateCursorPosition:(BOOL)a3;
- (id)_fetchRequestForDistinctSeasons;
- (id)bestDescription;
- (id)seasonNumbers;
- (id)seasonSortDescriptorsForSortOrder;
- (id)seasonTrailerInSeason:(int64_t)a3;
- (id)smartPlayEpisode;
- (id)sortDescriptorsForPlayOrder;
- (id)sortDescriptorsForPlayOrderByEpisodeNumber;
- (id)sortDescriptorsForPlayOrderByPubDate;
- (id)sortDescriptorsForSortOrder;
- (void)applyShowTypeSetting:(int64_t)a3;
- (void)markPlaylistsForUpdate;
- (void)setAuthor:(id)a3;
- (void)setDeletePlayedEpisodes:(int64_t)a3;
- (void)setFeedChangedDate:(double)a3;
- (void)setImageURL:(id)a3;
- (void)setItemDescription:(id)a3;
- (void)setLastImplicitlyFollowedDate:(double)a3;
- (void)setModifiedDate:(double)a3;
- (void)setPlaybackNewestToOldest:(BOOL)a3;
- (void)setShowTypeInFeed:(id)a3;
- (void)setShowTypeSetting:(int64_t)a3;
- (void)setSortAscending:(BOOL)a3;
- (void)setUpdateAvg:(double)a3;
- (void)setUpdateStdDev:(double)a3;
- (void)setWebpageURL:(id)a3;
@end

@implementation MTPodcast

- (void)markPlaylistsForUpdate
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = [(MTPodcast *)self playlistSettings];
  id v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        v7 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        [v7 setNeedsUpdate:1];
        v8 = [v7 playlist];
        [v8 setNeedsUpdate:1];
      }
      id v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
}

- (void)setDeletePlayedEpisodes:(int64_t)a3
{
  uint64_t v5 = kPodcastDeletePlayedEpisodes;
  [(MTPodcast *)self willChangeValueForKey:kPodcastDeletePlayedEpisodes];
  v6 = +[NSNumber numberWithLongLong:a3];
  [(MTPodcast *)self setPrimitiveValue:v6 forKey:v5];

  [(MTPodcast *)self didChangeValueForKey:v5];

  [(MTPodcast *)self markPlaylistsForUpdate];
}

- (void)setLastImplicitlyFollowedDate:(double)a3
{
  [(MTPodcast *)self lastImplicitlyFollowedDate];
  if (v5 < a3)
  {
    uint64_t v6 = kPodcastLastImplicitlyFollowedDate;
    [(MTPodcast *)self willChangeValueForKey:kPodcastLastImplicitlyFollowedDate];
    v7 = +[NSDate dateWithTimeIntervalSinceReferenceDate:a3];
    [(MTPodcast *)self setPrimitiveValue:v7 forKey:v6];

    [(MTPodcast *)self didChangeValueForKey:v6];
  }
}

- (void)setModifiedDate:(double)a3
{
  double v5 = +[FutureDateChecker lenientSharedInstance];
  [v5 timestampBoundByNow:a3];
  double v7 = v6;

  uint64_t v8 = kPodcastModifiedDate;
  [(MTPodcast *)self willChangeValueForKey:kPodcastModifiedDate];
  long long v9 = +[NSDate dateWithTimeIntervalSinceReferenceDate:v7];
  [(MTPodcast *)self setPrimitiveValue:v9 forKey:v8];

  [(MTPodcast *)self didChangeValueForKey:v8];
}

- (void)setAuthor:(id)a3
{
  unint64_t v9 = (unint64_t)a3;
  uint64_t v4 = [(MTPodcast *)self author];
  unint64_t v5 = v9 | v4;

  if (v5)
  {
    double v6 = [(MTPodcast *)self author];
    unsigned __int8 v7 = [v6 isEqualToString:v9];

    if ((v7 & 1) == 0)
    {
      uint64_t v8 = kPodcastAuthor;
      [(MTPodcast *)self willChangeValueForKey:kPodcastAuthor];
      [(MTPodcast *)self setPrimitiveValue:v9 forKey:v8];
      [(MTPodcast *)self didChangeValueForKey:v8];
    }
  }
}

- (void)setItemDescription:(id)a3
{
  unint64_t v9 = (unint64_t)a3;
  uint64_t v4 = [(MTPodcast *)self itemDescription];
  unint64_t v5 = v9 | v4;

  if (v5)
  {
    double v6 = [(MTPodcast *)self itemDescription];
    unsigned __int8 v7 = [v6 isEqualToString:v9];

    if ((v7 & 1) == 0)
    {
      uint64_t v8 = kPodcastDescription;
      [(MTPodcast *)self willChangeValueForKey:kPodcastDescription];
      [(MTPodcast *)self setPrimitiveValue:v9 forKey:v8];
      [(MTPodcast *)self didChangeValueForKey:v8];
    }
  }
}

- (void)setFeedChangedDate:(double)a3
{
  [(MTPodcast *)self feedChangedDate];
  if (vabdd_f64(v5, a3) > 2.22044605e-16)
  {
    uint64_t v6 = kPodcastFeedChangedDate;
    [(MTPodcast *)self willChangeValueForKey:kPodcastFeedChangedDate];
    unsigned __int8 v7 = +[NSDate dateWithTimeIntervalSinceReferenceDate:a3];
    [(MTPodcast *)self setPrimitiveValue:v7 forKey:v6];

    [(MTPodcast *)self didChangeValueForKey:v6];
  }
}

- (void)setUpdateStdDev:(double)a3
{
  [(MTPodcast *)self updateStdDev];
  if (vabdd_f64(v5, a3) > 2.22044605e-16)
  {
    uint64_t v6 = kPodcastUpdateStdDev;
    [(MTPodcast *)self willChangeValueForKey:kPodcastUpdateStdDev];
    unsigned __int8 v7 = +[NSNumber numberWithDouble:a3];
    [(MTPodcast *)self setPrimitiveValue:v7 forKey:v6];

    [(MTPodcast *)self didChangeValueForKey:v6];
  }
}

- (void)setUpdateAvg:(double)a3
{
  [(MTPodcast *)self updateAvg];
  if (vabdd_f64(v5, a3) > 2.22044605e-16)
  {
    uint64_t v6 = kPodcastUpdateAvg;
    [(MTPodcast *)self willChangeValueForKey:kPodcastUpdateAvg];
    unsigned __int8 v7 = +[NSNumber numberWithDouble:a3];
    [(MTPodcast *)self setPrimitiveValue:v7 forKey:v6];

    [(MTPodcast *)self didChangeValueForKey:v6];
  }
}

- (void)setImageURL:(id)a3
{
  unint64_t v9 = (unint64_t)a3;
  uint64_t v4 = [(MTPodcast *)self imageURL];
  unint64_t v5 = v9 | v4;

  if (v5)
  {
    uint64_t v6 = [(MTPodcast *)self imageURL];
    unsigned __int8 v7 = [v6 isEqualToString:v9];

    if ((v7 & 1) == 0)
    {
      uint64_t v8 = kPodcastImageUrl;
      [(MTPodcast *)self willChangeValueForKey:kPodcastImageUrl];
      [(MTPodcast *)self setPrimitiveValue:v9 forKey:v8];
      [(MTPodcast *)self didChangeValueForKey:v8];
    }
  }
}

- (void)setShowTypeInFeed:(id)a3
{
  unint64_t v9 = (unint64_t)a3;
  uint64_t v4 = [(MTPodcast *)self showTypeInFeed];
  unint64_t v5 = v9 | v4;

  if (v5)
  {
    uint64_t v6 = [(MTPodcast *)self showTypeInFeed];
    unsigned __int8 v7 = [v6 isEqualToString:v9];

    if ((v7 & 1) == 0)
    {
      uint64_t v8 = kPodcastShowTypeInFeed;
      [(MTPodcast *)self willChangeValueForKey:kPodcastShowTypeInFeed];
      [(MTPodcast *)self setPrimitiveValue:v9 forKey:v8];
      [(MTPodcast *)self didChangeValueForKey:v8];
    }
  }
}

- (void)setWebpageURL:(id)a3
{
  unint64_t v9 = (unint64_t)a3;
  uint64_t v4 = [(MTPodcast *)self webpageURL];
  unint64_t v5 = v9 | v4;

  if (v5)
  {
    uint64_t v6 = [(MTPodcast *)self webpageURL];
    unsigned __int8 v7 = [v6 isEqualToString:v9];

    if ((v7 & 1) == 0)
    {
      uint64_t v8 = kPodcastWebpageURL;
      [(MTPodcast *)self willChangeValueForKey:kPodcastWebpageURL];
      [(MTPodcast *)self setPrimitiveValue:v9 forKey:v8];
      [(MTPodcast *)self didChangeValueForKey:v8];
    }
  }
}

- (BOOL)isValidShowTypeSetting:(int64_t)a3
{
  return ((unint64_t)a3 < 5) & (0x16u >> a3);
}

- (void)setShowTypeSetting:(int64_t)a3
{
  if ([(MTPodcast *)self showTypeSetting] != (id)a3)
  {
    unsigned __int8 v5 = [(MTPodcast *)self isValidShowTypeSetting:a3];
    uint64_t v6 = _MTLogCategoryDatabase();
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      if (v7)
      {
        uint64_t v8 = [(MTPodcast *)self title];
        unint64_t v9 = [(MTPodcast *)self feedURL];
        id v10 = [(MTPodcast *)self storeCollectionId];
        long long v11 = [(MTPodcast *)self uuid];
        int v14 = 134350083;
        int64_t v15 = a3;
        __int16 v16 = 2113;
        v17 = v8;
        __int16 v18 = 2113;
        v19 = v9;
        __int16 v20 = 2049;
        id v21 = v10;
        __int16 v22 = 2114;
        v23 = v11;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Switching show type setting to %{public}lld, show \"%{private}@\", %{private}@, %{private}lld, %{public}@", (uint8_t *)&v14, 0x34u);
      }
      uint64_t v12 = kPodcastShowTypeSetting;
      [(MTPodcast *)self willChangeValueForKey:kPodcastShowTypeSetting];
      v13 = +[NSNumber numberWithLongLong:a3];
      [(MTPodcast *)self setPrimitiveValue:v13 forKey:v12];

      [(MTPodcast *)self didChangeValueForKey:v12];
      [(MTPodcast *)self applyShowTypeSetting:a3];
    }
    else
    {
      if (v7)
      {
        LOWORD(v14) = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "WARNING: Ignoring attempt to set an invalid show type", (uint8_t *)&v14, 2u);
      }
    }
  }
}

- (void)applyShowTypeSetting:(int64_t)a3
{
  id v4 = +[MTPodcast sortOrderAscForShowType:a3];
  int v5 = (int)v4;
  [(MTPodcast *)self setSortAscending:v4];

  [(MTPodcast *)self setPlaybackNewestToOldest:v5 ^ 1u];
}

- (void)setSortAscending:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = _MTLogCategoryDatabase();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    if (v3) {
      CFStringRef v6 = @"true";
    }
    else {
      CFStringRef v6 = @"false";
    }
    BOOL v7 = [(MTPodcast *)self title];
    uint64_t v8 = [(MTPodcast *)self feedURL];
    id v9 = [(MTPodcast *)self storeCollectionId];
    id v10 = [(MTPodcast *)self uuid];
    int v14 = 138544387;
    CFStringRef v15 = v6;
    __int16 v16 = 2113;
    v17 = v7;
    __int16 v18 = 2113;
    v19 = v8;
    __int16 v20 = 2049;
    id v21 = v9;
    __int16 v22 = 2114;
    v23 = v10;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Switching SortAscendingFlag to %{public}@, show \"%{private}@\", %{private}@, %{private}lld, %{public}@", (uint8_t *)&v14, 0x34u);
  }
  unint64_t v11 = (unint64_t)[(MTPodcast *)self flags];
  if (((((v11 & 2) == 0) ^ v3) & 1) == 0)
  {
    uint64_t v12 = 2;
    if (!v3) {
      uint64_t v12 = 0;
    }
    [(MTPodcast *)self setFlags:v11 & 0xFFFFFFFFFFFFFFFDLL | v12];
    [(MTPodcast *)self markPlaylistsForUpdate];
    v13 = +[SyncKeysRepository shared];
    [v13 markSubscriptionSyncDirty:1 for:[self syncType]];
  }
}

- (BOOL)sortAscending
{
  return ((unint64_t)[(MTPodcast *)self flags] >> 1) & 1;
}

+ (id)allPossibleEpisodeListSortOrderProperties
{
  id v19 = objc_alloc((Class)NSMutableArray);
  uint64_t v21 = kEpisodePubDate;
  v2 = +[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:");
  v23[0] = v2;
  uint64_t v3 = kEpisodeEpisodeNumber;
  id v4 = +[NSSortDescriptor sortDescriptorWithKey:kEpisodeEpisodeNumber ascending:1];
  v23[1] = v4;
  uint64_t v5 = kEpisodeLevel;
  CFStringRef v6 = +[NSSortDescriptor sortDescriptorWithKey:kEpisodeLevel ascending:0];
  v23[2] = v6;
  uint64_t v7 = kEpisodeTitle;
  uint64_t v8 = +[NSSortDescriptor sortDescriptorWithKey:kEpisodeTitle ascending:1 selector:"localizedStandardCompare:"];
  v23[3] = v8;
  id v9 = +[NSArray arrayWithObjects:v23 count:4];
  id v20 = [v19 initWithArray:v9];

  id v10 = +[NSSortDescriptor sortDescriptorWithKey:v21 ascending:0];
  v22[0] = v10;
  unint64_t v11 = +[NSSortDescriptor sortDescriptorWithKey:v3 ascending:0];
  v22[1] = v11;
  uint64_t v12 = +[NSSortDescriptor sortDescriptorWithKey:v5 ascending:1];
  v22[2] = v12;
  v13 = +[NSSortDescriptor sortDescriptorWithKey:v7 ascending:1 selector:"localizedStandardCompare:"];
  v22[3] = v13;
  int v14 = +[NSArray arrayWithObjects:v22 count:4];
  [v20 addObjectsFromArray:v14];

  CFStringRef v15 = [v20 mt_compactMap:&stru_10009E5C0];
  __int16 v16 = +[NSSet setWithArray:v15];
  v17 = [v16 allObjects];

  return v17;
}

- (id)sortDescriptorsForSortOrder
{
  if ([(MTPodcast *)self isSerialShowTypeInFeed])
  {
    id v3 = [(MTPodcast *)self seasonSortDescriptorsForSortOrder];
  }
  else
  {
    unsigned __int8 v4 = [(MTPodcast *)self sortAscending];
    id v5 = objc_alloc((Class)NSMutableArray);
    if (v4)
    {
      CFStringRef v6 = +[NSSortDescriptor sortDescriptorWithKey:kEpisodePubDate ascending:1];
      v14[0] = v6;
      uint64_t v7 = +[NSSortDescriptor sortDescriptorWithKey:kEpisodeEpisodeNumber ascending:1];
      v14[1] = v7;
      uint64_t v8 = +[NSSortDescriptor sortDescriptorWithKey:kEpisodeLevel ascending:0];
      v14[2] = v8;
      id v9 = +[NSSortDescriptor sortDescriptorWithKey:kEpisodeTitle ascending:1 selector:"localizedStandardCompare:"];
      v14[3] = v9;
      id v10 = v14;
    }
    else
    {
      CFStringRef v6 = +[NSSortDescriptor sortDescriptorWithKey:kEpisodePubDate ascending:0];
      v13[0] = v6;
      uint64_t v7 = +[NSSortDescriptor sortDescriptorWithKey:kEpisodeEpisodeNumber ascending:0];
      v13[1] = v7;
      uint64_t v8 = +[NSSortDescriptor sortDescriptorWithKey:kEpisodeLevel ascending:1];
      v13[2] = v8;
      id v9 = +[NSSortDescriptor sortDescriptorWithKey:kEpisodeTitle ascending:1 selector:"localizedStandardCompare:"];
      v13[3] = v9;
      id v10 = v13;
    }
    unint64_t v11 = +[NSArray arrayWithObjects:v10 count:4];
    id v3 = [v5 initWithArray:v11];
  }

  return v3;
}

- (id)seasonSortDescriptorsForSortOrder
{
  id v2 = [(MTPodcast *)self showTypeSetting];

  return +[MTEpisode seasonSortDescriptors:v2];
}

+ (id)sortDescriptorsForOldestOnTop
{
  id v2 = +[NSSortDescriptor sortDescriptorWithKey:kEpisodePubDate ascending:1];
  v8[0] = v2;
  id v3 = +[NSSortDescriptor sortDescriptorWithKey:kEpisodeEpisodeNumber ascending:1];
  v8[1] = v3;
  unsigned __int8 v4 = +[NSSortDescriptor sortDescriptorWithKey:kEpisodeLevel ascending:0];
  v8[2] = v4;
  id v5 = +[NSSortDescriptor sortDescriptorWithKey:kEpisodeTitle ascending:1 selector:"localizedStandardCompare:"];
  v8[3] = v5;
  CFStringRef v6 = +[NSArray arrayWithObjects:v8 count:4];

  return v6;
}

+ (id)sortDescriptorsForNewestOnTop
{
  id v2 = +[NSSortDescriptor sortDescriptorWithKey:kEpisodePubDate ascending:0];
  v8[0] = v2;
  id v3 = +[NSSortDescriptor sortDescriptorWithKey:kEpisodeEpisodeNumber ascending:0];
  v8[1] = v3;
  unsigned __int8 v4 = +[NSSortDescriptor sortDescriptorWithKey:kEpisodeLevel ascending:1];
  v8[2] = v4;
  id v5 = +[NSSortDescriptor sortDescriptorWithKey:kEpisodeTitle ascending:1 selector:"localizedStandardCompare:"];
  v8[3] = v5;
  CFStringRef v6 = +[NSArray arrayWithObjects:v8 count:4];

  return v6;
}

- (id)sortDescriptorsForPlayOrder
{
  if ([(MTPodcast *)self isSerialShowTypeInFeed]) {
    [(MTPodcast *)self sortDescriptorsForPlayOrderByEpisodeNumber];
  }
  else {
  id v3 = [(MTPodcast *)self sortDescriptorsForPlayOrderByPubDate];
  }

  return v3;
}

- (id)sortDescriptorsForPlayOrderByPubDate
{
  id v2 = [(MTPodcast *)self playbackNewestToOldest];
  id v3 = objc_opt_class();

  return _[v3 sortDescriptorsForNewestToOldest:v2];
}

- (id)sortDescriptorsForPlayOrderByEpisodeNumber
{
  id v2 = [(MTPodcast *)self showTypeSetting];

  return +[MTEpisode seasonSortDescriptors:v2];
}

- (void)setPlaybackNewestToOldest:(BOOL)a3
{
  int v3 = a3;
  unsigned int v5 = [(MTPodcast *)self playbackNewestToOldest];
  unint64_t v6 = (unint64_t)[(MTPodcast *)self flags];
  if (((((v6 & 8) == 0) ^ v3) & 1) == 0)
  {
    uint64_t v7 = 8;
    if (!v3) {
      uint64_t v7 = 0;
    }
    [(MTPodcast *)self setFlags:v6 & 0xFFFFFFFFFFFFFFF7 | v7];
    [(MTPodcast *)self markPlaylistsForUpdate];
    uint64_t v8 = +[SyncKeysRepository shared];
    [v8 markSubscriptionSyncDirty:1 for:[self syncType]];

    if (v5 != v3)
    {
      [(MTPodcast *)self updateCursorPosition:0];
    }
  }
}

- (BOOL)updateCursorPosition:(BOOL)a3
{
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  [(MTPodcast *)self managedObjectContext];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100007064;
  v8[3] = &unk_10009E5E8;
  void v8[4] = self;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v9 = v5;
  id v10 = &v12;
  BOOL v11 = a3;
  [v5 performBlockAndWait:v8];
  char v6 = *((unsigned char *)v13 + 24);

  _Block_object_dispose(&v12, 8);
  return v6;
}

+ (id)podcastUuidForFeedUrlString:(id)a3 ctx:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 length])
  {
    uint64_t v13 = 0;
    uint64_t v14 = &v13;
    uint64_t v15 = 0x3032000000;
    __int16 v16 = sub_10000746C;
    v17 = sub_10000747C;
    id v18 = 0;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100007484;
    v9[3] = &unk_10009E610;
    id v10 = v6;
    id v11 = v5;
    uint64_t v12 = &v13;
    [v10 performBlockAndWait:v9];
    id v7 = (id)v14[5];

    _Block_object_dispose(&v13, 8);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

+ (id)podcastUuidForFeedUrl:(id)a3 ctx:(id)a4
{
  id v6 = a4;
  id v7 = [a3 absoluteString];
  uint64_t v8 = [a1 podcastUuidForFeedUrlString:v7 ctx:v6];

  return v8;
}

- (id)smartPlayEpisode
{
  if (([(MTPodcast *)self subscribed] & 1) != 0
    || ![(MTPodcast *)self isSerialShowTypeInFeed]
    || (uint64_t)[(MTPodcast *)self latestSeasonNumber] < 1
    || ([(MTPodcast *)self lastDatePlayed], v3 != 0.0)
    || ([(MTPodcast *)self seasonTrailerInSeason:[(MTPodcast *)self latestSeasonNumber]], (unsigned __int8 v4 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    id v5 = [(MTPodcast *)self nextEpisodeUuid];

    if (!v5) {
      goto LABEL_8;
    }
    id v6 = [(MTPodcast *)self managedObjectContext];
    id v7 = [(MTPodcast *)self nextEpisodeUuid];
    unsigned __int8 v4 = [v6 episodeForUuid:v7];

    if (!v4)
    {
LABEL_8:
      uint64_t v8 = objc_opt_new();
      [v8 setExcludeUnentitled:1];
      unsigned __int8 v4 = [(MTPodcast *)self newestEpisodeWithFilter:v8];
    }
  }

  return v4;
}

- (id)_fetchRequestForDistinctSeasons
{
  id v2 = [(MTPodcast *)self uuid];
  double v3 = +[MTEpisode predicateForEpisodesWithSeasonNumbersOnPodcastUuid:v2];

  uint64_t v4 = kEpisodeSeasonNumber;
  id v5 = +[NSSortDescriptor sortDescriptorWithKey:kEpisodeSeasonNumber ascending:1];
  id v6 = +[NSFetchRequest fetchRequestWithEntityName:kMTEpisodeEntityName];
  [v6 setResultType:2];
  uint64_t v11 = v4;
  id v7 = +[NSArray arrayWithObjects:&v11 count:1];
  [v6 setPropertiesToFetch:v7];

  [v6 setReturnsDistinctResults:1];
  [v6 setPredicate:v3];
  id v10 = v5;
  uint64_t v8 = +[NSArray arrayWithObjects:&v10 count:1];
  [v6 setSortDescriptors:v8];

  return v6;
}

- (BOOL)hasAtLeastOneSeason
{
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  [(MTPodcast *)self managedObjectContext];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000078D0;
  v6[3] = &unk_10009E638;
  v6[4] = self;
  uint64_t v8 = &v9;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = v3;
  [v3 performBlockAndWait:v6];
  char v4 = *((unsigned char *)v10 + 24);

  _Block_object_dispose(&v9, 8);
  return v4;
}

- (BOOL)hasMultipleSeasons
{
  id v2 = [(MTPodcast *)self seasonNumbers];
  BOOL v3 = (unint64_t)[v2 count] > 1;

  return v3;
}

- (id)seasonNumbers
{
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  char v12 = sub_10000746C;
  uint64_t v13 = sub_10000747C;
  id v14 = +[NSArray array];
  [(MTPodcast *)self managedObjectContext];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100007B40;
  v6[3] = &unk_10009E610;
  v6[4] = self;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = v3;
  uint64_t v8 = &v9;
  [v3 performBlockAndWait:v6];
  id v4 = (id)v10[5];

  _Block_object_dispose(&v9, 8);

  return v4;
}

- (id)seasonTrailerInSeason:(int64_t)a3
{
  id v5 = objc_opt_new();
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = sub_10000746C;
  __int16 v22 = sub_10000747C;
  id v23 = 0;
  id v6 = [(MTPodcast *)self managedObjectContext];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100007D60;
  v12[3] = &unk_10009E660;
  id v7 = v5;
  id v13 = v7;
  id v14 = self;
  __int16 v16 = &v18;
  int64_t v17 = a3;
  id v8 = v6;
  id v15 = v8;
  [v8 performBlockAndWait:v12];
  uint64_t v9 = (void *)v19[5];
  if (v9)
  {
    id v10 = [v9 firstObject];
  }
  else
  {
    id v10 = 0;
  }

  _Block_object_dispose(&v18, 8);

  return v10;
}

- (id)bestDescription
{
  id v2 = [(MTPodcast *)self itemDescription];
  if ([v2 hasHTML])
  {
    uint64_t v3 = [v2 stringBySmartlyStrippingHTML];

    id v2 = (void *)v3;
  }

  return v2;
}

+ (id)predicateForSyncablePodcastsForSyncType:(int64_t)a3
{
  id v4 = [a1 predicateForNotHiddenNotImplicitlyFollowedPodcasts];
  id v5 = +[MTPodcast predicateForSubscriptionSyncType:a3];
  id v6 = [v4 AND:v5];

  return v6;
}

+ (id)predicateForSubscriptionSyncType:(int64_t)a3
{
  uint64_t v4 = kPodcastDisplayType;
  id v5 = NSPersistentStringForMTDisplayType();
  id v6 = NSPersistentStringForMTDisplayType();
  id v7 = +[NSPredicate predicateWithFormat:@"(%K == %@) || (%K == %@) || (%K == NULL)", v4, v5, v4, v6, v4];

  if (a3 == 1)
  {
    id v8 = NSPersistentStringForMTDisplayType();
    +[NSPredicate predicateWithFormat:@"%K == %@", v4, v8];
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v9 = v7;
  }

  return v9;
}

@end