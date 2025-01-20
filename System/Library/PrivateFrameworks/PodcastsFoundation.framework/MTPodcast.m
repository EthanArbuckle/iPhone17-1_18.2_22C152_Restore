@interface MTPodcast
+ (BOOL)autoDownloadDefaultValue;
+ (BOOL)isRedirectURL:(id)a3;
+ (BOOL)sortOrderAscForShowType:(int64_t)a3;
+ (double)defaultUpdateInterval;
+ (id)_predicateForShowsWithPlayableFreeEpisodes;
+ (id)episodeLimitsAllowingAutomaticDownloads;
+ (id)importedShowArtworkURLFor:(id)a3;
+ (id)insertNewPodcastInManagedObjectContext:(id)a3 subscribed:(BOOL)a4 feedUrl:(id)a5 showType:(int64_t)a6 showTypeInFeed:(id)a7 title:(id)a8 author:(id)a9 provider:(id)a10 imageUrl:(id)a11 description:(id)a12 adamId:(int64_t)a13 displayType:(id)a14 showSpecificUpsellCopy:(id)a15;
+ (id)insertNewPodcastInManagedObjectContext:(id)a3 subscribed:(BOOL)a4 feedUrl:(id)a5 showType:(int64_t)a6 showTypeInFeed:(id)a7 title:(id)a8 author:(id)a9 provider:(id)a10 imageUrl:(id)a11 description:(id)a12 displayType:(id)a13 showSpecificUpsellCopy:(id)a14;
+ (id)insertNewPodcastInManagedObjectContext:(id)a3 subscribed:(BOOL)a4 feedUrl:(id)a5 showType:(int64_t)a6 title:(id)a7 author:(id)a8 provider:(id)a9 imageUrl:(id)a10 description:(id)a11;
+ (id)podcastUuidForEpisodeUuid:(id)a3 ctx:(id)a4;
+ (id)predicateForAreMediaAPI:(BOOL)a3;
+ (id)predicateForAutoDownloadEnabled;
+ (id)predicateForEntitledShows;
+ (id)predicateForExcludingExplicitBasedOnSetting;
+ (id)predicateForHasBeenSynced:(BOOL)a3;
+ (id)predicateForHiddenOrImplicitlyFollowedPodcasts;
+ (id)predicateForHiddenPodcastUuids:(id)a3;
+ (id)predicateForHiddenPodcasts;
+ (id)predicateForIdentifer:(id)a3;
+ (id)predicateForImplicitlyFollowedPodcasts;
+ (id)predicateForImplicitlyFollowedPodcastsExcludingUUIDs:(id)a3;
+ (id)predicateForImporting:(BOOL)a3;
+ (id)predicateForLastDatePlayedAfterDate:(id)a3;
+ (id)predicateForLastDatePlayedNotInTheFuture;
+ (id)predicateForLastUnfollowedDateOlderThanDate:(id)a3;
+ (id)predicateForNilLastUnfollowedDate;
+ (id)predicateForNonFollowedShowsWithPlayState;
+ (id)predicateForNotHiddenNotImplicitlyFollowedPodcasts;
+ (id)predicateForNotHiddenPodcasts;
+ (id)predicateForNotImplicitlyFollowedPodcasts;
+ (id)predicateForNotImplicitlyFollowedPodcastsWithChannelStoreId:(int64_t)a3;
+ (id)predicateForNotSubscribedAndNotHiddenAndNotImplicitlyFollowed;
+ (id)predicateForNotSubscribedPodcasts;
+ (id)predicateForPaidSubscriptionActive:(BOOL)a3;
+ (id)predicateForPeriodicallyUpdatablePodcasts;
+ (id)predicateForPodcastStoreIDs:(id)a3;
+ (id)predicateForPodcastStoreId:(int64_t)a3;
+ (id)predicateForPodcastToAutoRemove;
+ (id)predicateForPodcastUUID:(id)a3;
+ (id)predicateForPodcastUuids:(id)a3;
+ (id)predicateForPodcastWithFeedUrl:(id)a3;
+ (id)predicateForPodcastWithPodcastPID:(int64_t)a3;
+ (id)predicateForPodcastWithTitle:(id)a3;
+ (id)predicateForPodcastsFetchedBefore:(id)a3;
+ (id)predicateForPodcastsFollowedSince:(id)a3;
+ (id)predicateForPodcastsNeedingRetry:(BOOL)a3;
+ (id)predicateForPodcastsToAutodownload;
+ (id)predicateForPodcastsUpdatedBefore:(id)a3;
+ (id)predicateForPodcastsWithBookmarkedEpisodes;
+ (id)predicateForPodcastsWithDownloadedEpisodes;
+ (id)predicateForPodcastsWithLibraryEpisodes;
+ (id)predicateForPodcastsWithUnplayedBookmarkedEpisodes;
+ (id)predicateForPodcastsWithUnplayedDownloadedEpisodes;
+ (id)predicateForRecentlyUnfollowed;
+ (id)predicateForRecentlyUnfollowedOlderThanCutoffDate;
+ (id)predicateForSubscribedAndNotHidden;
+ (id)predicateForSubscribedPodcasts;
+ (id)predicateForWatchLibraryShows;
+ (id)productURLForStoreCollectionId:(int64_t)a3 storeTrackId:(int64_t)a4;
+ (id)propertiesToObserveForDownloadableEpisodes;
+ (id)recentlyUnfollowedCutoffDate;
+ (id)redirectURLForStoreCollectionId:(int64_t)a3;
+ (id)sortDescriptorsForNewestToOldest:(BOOL)a3;
+ (id)sortDescriptorsForNewestToOldestFirstTimeAvailable:(BOOL)a3;
+ (id)storeCleanURLForAdamID:(int64_t)a3;
+ (id)userDefaultPropertiesAffectingPredicates;
+ (int64_t)defaultShowType;
+ (int64_t)deletePlayedEpisodesDefaultValue;
+ (int64_t)episodeLimitDefaultValue;
+ (int64_t)showTypeFromString:(id)a3;
+ (int64_t)storeCollectionIdForRedirectURL:(id)a3;
+ (unint64_t)totalUnplayedCount;
- (BOOL)currentEpisodeLimitAllowsAutomaticDownloads;
- (BOOL)currentEpisodeLimitIsNextNEpisodes;
- (BOOL)deletePlayedEpisodesResolvedValue;
- (BOOL)feedUpdateNeedsRetry;
- (BOOL)hasBeenSynced;
- (BOOL)importing;
- (BOOL)isAuthenticatedDark;
- (BOOL)isDark;
- (BOOL)isExplicit;
- (BOOL)isPastAutodownloadOrEpisodeLimitDark;
- (BOOL)isSerialShowTypeInFeed;
- (BOOL)isShareable;
- (BOOL)isTransitioningFromImplicit;
- (BOOL)needsArtworkUpdate;
- (BOOL)playbackNewestToOldest;
- (BOOL)requestsAreNonAppInitiated;
- (BOOL)shouldBeDeleted;
- (BOOL)shouldBeHiddenFromUpNext;
- (BOOL)sortAscending;
- (double)calculatedUpdateInterval;
- (double)darkDownloadTimeInterval;
- (id)_episodeNextToEpisode:(id)a3 after:(BOOL)a4 usePlayOrder:(BOOL)a5 restrictToUserEpisodes:(BOOL)a6 excludePlayed:(BOOL)a7 excludeExplicit:(int64_t)a8 episodeTypeFilter:(int64_t)a9;
- (id)_episodesNextTo:(double)a3 after:(BOOL)a4 usePlayOrder:(BOOL)a5 sortAsc:(BOOL)a6 restrictToUserEpisodes:(BOOL)a7 excludePlayed:(BOOL)a8 excludeExplicit:(int64_t)a9 episodeTypeFilter:(int64_t)a10 limit:(int64_t)a11;
- (id)_episodesNextTo:(double)a3 after:(BOOL)a4 usePlayOrder:(BOOL)a5 sortAsc:(BOOL)a6 sortByEpisodeNumber:(BOOL)a7 filter:(id)a8 limit:(int64_t)a9;
- (id)_episodesNextToEpisode:(id)a3 after:(BOOL)a4 usePlayOrder:(BOOL)a5 restrictToUserEpisodes:(BOOL)a6 excludePlayed:(BOOL)a7 excludeExplicit:(int64_t)a8 episodeTypeFilter:(int64_t)a9 limit:(int64_t)a10;
- (id)_latestOrOldestEpisode:(BOOL)a3 sortDate:(unint64_t)a4 filter:(id)a5;
- (id)_latestOrOldestEpisode:(BOOL)a3 sortDate:(unint64_t)a4 restrictToUserEpisodes:(BOOL)a5 excludePlayed:(BOOL)a6 excludeExplicit:(int64_t)a7 episodeTypeFilter:(int64_t)a8;
- (id)_latestOrOldestEpisode:(BOOL)a3 sortDate:(unint64_t)a4 restrictToUserEpisodes:(BOOL)a5 excludePlayed:(BOOL)a6 excludeExplicit:(int64_t)a7 excludingEpisodeUuid:(id)a8;
- (id)_latestOrOldestEpisode:(BOOL)a3 sortDate:(unint64_t)a4 restrictToUserEpisodes:(BOOL)a5 excludePlayed:(BOOL)a6 excludeExplicit:(int64_t)a7 excludingEpisodeUuid:(id)a8 episodeTypeFilter:(int64_t)a9;
- (id)_latestOrOldestEpisode:(BOOL)a3 sortDate:(unint64_t)a4 restrictToUserEpisodes:(BOOL)a5 playStateFilter:(int64_t)a6 excludeExplicit:(int64_t)a7 excludingEpisodeUuid:(id)a8 episodeTypeFilter:(int64_t)a9;
- (id)bestAvailableStoreCleanURL;
- (id)bestFeedURLExcludingRedirectURL:(BOOL)a3;
- (id)currentFeedURL;
- (id)displayURL;
- (id)earliestDateForFeedFetch:(id)a3;
- (id)episodePublishedAfter:(double)a3 filter:(id)a4;
- (id)episodePublishedBefore:(double)a3 filter:(id)a4;
- (id)episodesInLatestSeasonWithLimit:(int64_t)a3;
- (id)episodesInSeasonNumber:(int64_t)a3;
- (id)episodesInSeasonNumber:(int64_t)a3 lowestNumberedEpisodesFirst:(BOOL)a4 filter:(id)a5 limit:(int64_t)a6;
- (id)episodesInSeasonNumber:(int64_t)a3 oldestEpisodesFirst:(BOOL)a4;
- (id)episodesInSeasonNumber:(int64_t)a3 oldestEpisodesFirst:(BOOL)a4 excludePlayed:(BOOL)a5 excludeExplicit:(int64_t)a6 episodeTypeFilter:(int64_t)a7 limit:(unint64_t)a8;
- (id)episodesInSeasonNumber:(int64_t)a3 oldestEpisodesFirst:(BOOL)a4 excludePlayed:(BOOL)a5 excludeExplicit:(int64_t)a6 limit:(int64_t)a7;
- (id)episodesInSeasonNumber:(int64_t)a3 oldestEpisodesFirst:(BOOL)a4 filter:(id)a5 limit:(int64_t)a6;
- (id)episodesPublishedAfter:(double)a3 filter:(id)a4 limit:(int64_t)a5 sortAsc:(BOOL)a6;
- (id)highestNumberedEpisodePublishedBefore:(double)a3 filter:(id)a4;
- (id)highestNumberedPlayedEpisodeWithFilter:(id)a3;
- (id)lowestNumberedEpisodePublishedAfter:(double)a3 filter:(id)a4;
- (id)lowestNumberedEpisodeWithFilter:(id)a3;
- (id)metricsAdditionalData;
- (id)metricsContentIdentifier;
- (id)mostRecentlyPlayedEpisodeWithFilter:(id)a3;
- (id)newestEpisode;
- (id)newestEpisodeByAvailabiltyTime;
- (id)newestEpisodeExcludingUuid:(id)a3 excludeExplicit:(int64_t)a4;
- (id)newestEpisodeWithFilter:(id)a3;
- (id)newestFullEpisode;
- (id)newestUserEpisodeExcludingExplicit:(int64_t)a3;
- (id)nextEpisodeNotPlayedExcludingExplicit:(int64_t)a3 episodeTypeFilter:(int64_t)a4;
- (id)nextNumberedUnplayedEpisodeAfter:(id)a3 filter:(id)a4;
- (id)oldestEpisodeExcludingExplicit:(int64_t)a3;
- (id)oldestEpisodeExcludingExplicit:(int64_t)a3 episodeTypeFilter:(int64_t)a4;
- (id)oldestEpisodeInLatestSeasonOrShowWithFilter:(id)a3;
- (id)oldestUserEpisodeExcludingExplicit:(int64_t)a3;
- (id)redirectURL;
- (id)shareURL;
- (id)twitterShareURL;
- (id)updatedAtString;
- (id)userEpisodesAfterEpisode:(id)a3;
- (int64_t)darkDownloadCountLimit;
- (int64_t)episodeLimitResolvedValue;
- (int64_t)latestSeasonNumber;
- (int64_t)showTypeInFeedResolvedValue;
- (int64_t)syncType;
- (unint64_t)levelForDownloadsOnSubscription;
- (void)applyFollowedShowSettingsFor:(int64_t)a3;
- (void)applyUnfollowedShowSettings;
- (void)calculateEpisodicNewEpisodeCountIn:(id)a3;
- (void)calculateNewEpisodeCountIn:(id)a3 serialShowsUseExperimentalRules:(BOOL)a4;
- (void)calculateSerialNewEpisodeCountIn:(id)a3;
- (void)markPlaylistsForUpdate;
- (void)resetGoDarkWithReason:(unint64_t)a3;
- (void)setAuthenticatedDark:(BOOL)a3;
- (void)setFeedUpdateNeedsRetry:(BOOL)a3;
- (void)setFlags:(int64_t)a3;
- (void)setHasBeenSynced:(BOOL)a3;
- (void)setHidden:(BOOL)a3;
- (void)setImporting:(BOOL)a3;
- (void)setIsExplicit:(BOOL)a3;
- (void)setIsImplicitlyFollowed:(BOOL)a3;
- (void)setIsTransitioningFromImplicit:(BOOL)a3;
- (void)setNeedsArtworkUpdate:(BOOL)a3;
- (void)setPodcastPID:(int64_t)a3;
- (void)suppressEpisodesWithBasisDate:(id)a3;
- (void)updateIsHiddenOrImplicitlyFollowed;
- (void)updateLastImplicitlyFollowedDate;
- (void)updateLastTouchDate;
@end

@implementation MTPodcast

- (BOOL)feedUpdateNeedsRetry
{
  return ((unint64_t)[(MTPodcast *)self flags] >> 12) & 1;
}

+ (id)predicateForNotHiddenPodcasts
{
  return (id)objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K = 0", @"hidden");
}

+ (id)predicateForPeriodicallyUpdatablePodcasts
{
  v2 = +[MTPodcast predicateForNotImplicitlyFollowedPodcasts];
  v3 = +[IMURLBag sharedInstance];
  v4 = [v3 syncValueForKey:@"podcast-skip-feed-update-interval-seconds"];
  [v4 doubleValue];
  double v6 = v5;

  v7 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-v6];
  v8 = +[MTPodcast predicateForPodcastsUpdatedBefore:v7];
  v9 = [v8 AND:v2];

  return v9;
}

+ (id)predicateForPodcastsUpdatedBefore:(id)a3
{
  return (id)[MEMORY[0x1E4F28F60] predicateForDateKey:@"updatedDate" isLessThanDate:a3];
}

+ (id)predicateForNotImplicitlyFollowedPodcasts
{
  return (id)objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K = 0", @"isImplicitlyFollowed");
}

- (id)metricsAdditionalData
{
  v9[7] = *MEMORY[0x1E4F143B8];
  v9[0] = @"subscribed";
  v9[1] = @"updatedDate";
  v9[2] = @"playbackNewestToOldest";
  v9[3] = @"episodeLimit";
  v9[4] = @"darkCount";
  v9[5] = @"deletePlayedEpisodes";
  v9[6] = @"sortAscending";
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:7];
  v4 = [(MTPodcast *)self dictionaryWithValuesForKeys:v3];
  v7 = @"settings";
  v8 = v4;
  double v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v8 forKeys:&v7 count:1];

  return v5;
}

- (BOOL)isPastAutodownloadOrEpisodeLimitDark
{
  int v3 = +[PFClientUtil supportsDownloads];
  if (v3)
  {
    int v3 = [(MTPodcast *)self subscribed];
    if (v3)
    {
      int v3 = [(MTPodcast *)self currentEpisodeLimitAllowsAutomaticDownloads];
      if (v3)
      {
        uint64_t v4 = [(MTPodcast *)self darkCountLocal];
        if (v4 >= [(MTPodcast *)self darkDownloadCountLimit])
        {
          [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
          double v6 = v5;
          [(MTPodcast *)self lastTouchDate];
          double v8 = v7;
          [(MTPodcast *)self darkDownloadTimeInterval];
          LOBYTE(v3) = v6 > v8 + v9;
        }
        else
        {
          LOBYTE(v3) = 0;
        }
      }
    }
  }
  return v3;
}

- (double)darkDownloadTimeInterval
{
  v2 = [MEMORY[0x1E4F1CB18] _applePodcastsFoundationSharedUserDefaults];
  int v3 = [v2 objectForKey:@"kMTDarkDownloadDurationOverride"];

  if (v3)
  {
    [v2 doubleForKey:@"kMTDarkDownloadDurationOverride"];
    double v5 = v4;
  }
  else
  {
    double v5 = 1296000.0;
  }

  return v5;
}

- (int64_t)darkDownloadCountLimit
{
  v2 = [MEMORY[0x1E4F1CB18] _applePodcastsFoundationSharedUserDefaults];
  int v3 = [v2 objectForKey:@"kMTDarkDownloadCountOverride"];

  if (v3) {
    int64_t v4 = [v2 integerForKey:@"kMTDarkDownloadCountOverride"];
  }
  else {
    int64_t v4 = 5;
  }

  return v4;
}

- (BOOL)isSerialShowTypeInFeed
{
  v2 = [(MTPodcast *)self showTypeInFeed];
  BOOL v3 = +[MTPodcast showTypeFromString:v2] == 2;

  return v3;
}

+ (int64_t)showTypeFromString:(id)a3
{
  id v3 = a3;
  int64_t v4 = +[MTPodcast defaultShowType];
  if (v3)
  {
    if ([v3 caseInsensitiveCompare:@"serial"])
    {
      if ([v3 caseInsensitiveCompare:@"episodic"])
      {
        if (![v3 caseInsensitiveCompare:@"oldestToNewest"]) {
          int64_t v4 = 4;
        }
      }
      else
      {
        int64_t v4 = 1;
      }
    }
    else
    {
      int64_t v4 = 2;
    }
  }

  return v4;
}

+ (int64_t)defaultShowType
{
  return 1;
}

- (id)bestFeedURLExcludingRedirectURL:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  double v5 = [MEMORY[0x1E4F1CA48] array];
  double v6 = [(MTPodcast *)self redirectURL];
  double v7 = [v6 absoluteString];

  if ([(__CFString *)v7 length] && !v3) {
    [v5 addObject:v7];
  }
  double v8 = [(MTPodcast *)self updatedFeedURL];
  uint64_t v9 = [v8 length];

  if (v9)
  {
    v10 = [(MTPodcast *)self updatedFeedURL];
    [v5 addObject:v10];
  }
  v11 = [(MTPodcast *)self feedURL];
  uint64_t v12 = [v11 length];

  if (v12)
  {
    v13 = [(MTPodcast *)self feedURL];
    [v5 addObject:v13];
  }
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v14 = v5;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v30 objects:v36 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v31;
LABEL_10:
    uint64_t v18 = 0;
    while (1)
    {
      if (*(void *)v31 != v17) {
        objc_enumerationMutation(v14);
      }
      uint64_t v19 = *(void *)(*((void *)&v30 + 1) + 8 * v18);
      if (!v3
        || !objc_msgSend(*(id *)(*((void *)&v30 + 1) + 8 * v18), "isEqualToString:", v7, (void)v30))
      {
        break;
      }
      if (v16 == ++v18)
      {
        uint64_t v16 = [v14 countByEnumeratingWithState:&v30 objects:v36 count:16];
        if (v16) {
          goto LABEL_10;
        }
        goto LABEL_17;
      }
    }
    objc_msgSend(MEMORY[0x1E4F1CB10], "URLWithString:", v19, (void)v30);
    id v20 = (id)objc_claimAutoreleasedReturnValue();

    if (!v3) {
      goto LABEL_30;
    }
    if (!v20) {
      goto LABEL_30;
    }
    v21 = [v20 absoluteString];
    BOOL v22 = +[MTPodcast isRedirectURL:v21];

    if (!v22) {
      goto LABEL_30;
    }
    if (+[PFClientUtil supportsMetrics])
    {
      if (v7) {
        v23 = v7;
      }
      else {
        v23 = &stru_1F03A51F0;
      }
      v34[0] = @"firstAttempt";
      v34[1] = @"skippedFeedURL";
      v35[0] = v23;
      uint64_t v24 = [v20 absoluteString];
      v25 = (void *)v24;
      if (v24) {
        v26 = (__CFString *)v24;
      }
      else {
        v26 = &stru_1F03A51F0;
      }
      v35[1] = v26;
      v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:v34 count:2];
      +[IMMetrics recordUserAction:@"skipping_redirect_url_fallback" dataSource:self withData:v27];
    }
    v28 = 0;
  }
  else
  {
LABEL_17:

    id v20 = 0;
LABEL_30:
    id v20 = v20;
    v28 = v20;
  }

  return v28;
}

- (id)metricsContentIdentifier
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if ([(MTPodcast *)self storeCollectionId])
  {
    int64_t v4 = objc_msgSend(NSString, "stringWithFormat:", @"%lld", -[MTPodcast storeCollectionId](self, "storeCollectionId"));
    [v3 setObject:v4 forKeyedSubscript:@"adamId"];
  }
  double v5 = [(MTPodcast *)self currentFeedURL];
  double v6 = [v5 absoluteString];

  if (v6) {
    [v3 setObject:v6 forKeyedSubscript:@"feedUrl"];
  }
  double v7 = [(MTPodcast *)self title];
  if (v7) {
    [v3 setObject:v7 forKeyedSubscript:@"title"];
  }

  return v3;
}

- (id)currentFeedURL
{
  id v3 = [(MTPodcast *)self updatedFeedURL];
  BOOL v4 = +[MTDBUtil isSupportedUrlString:v3];

  if (v4)
  {
    double v5 = (void *)MEMORY[0x1E4F1CB10];
    uint64_t v6 = [(MTPodcast *)self updatedFeedURL];
LABEL_5:
    uint64_t v9 = (void *)v6;
    v10 = [v5 URLWithString:v6];

    goto LABEL_7;
  }
  double v7 = [(MTPodcast *)self feedURL];
  BOOL v8 = +[MTDBUtil isSupportedUrlString:v7];

  if (v8)
  {
    double v5 = (void *)MEMORY[0x1E4F1CB10];
    uint64_t v6 = [(MTPodcast *)self feedURL];
    goto LABEL_5;
  }
  v10 = 0;
LABEL_7:
  return v10;
}

- (id)redirectURL
{
  uint64_t v2 = [(MTPodcast *)self storeCollectionId];
  return +[MTPodcast redirectURLForStoreCollectionId:v2];
}

+ (id)redirectURLForStoreCollectionId:(int64_t)a3
{
  if (+[MTStoreIdentifier isEmpty:](MTStoreIdentifier, "isEmpty:"))
  {
    BOOL v4 = 0;
  }
  else
  {
    double v5 = objc_msgSend(NSString, "stringWithFormat:", @"%lld", a3);
    uint64_t v6 = +[IMURLBag sharedInstance];
    double v7 = [v6 syncStringForKey:@"podcast-redirect-url-prefix"];

    BOOL v8 = [v7 stringByAppendingString:v5];
    BOOL v4 = [MEMORY[0x1E4F1CB10] URLWithString:v8];
  }
  return v4;
}

+ (double)defaultUpdateInterval
{
  return 3600.0;
}

+ (id)predicateForNotHiddenNotImplicitlyFollowedPodcasts
{
  return (id)objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K = 0", @"isHiddenOrImplicitlyFollowed");
}

+ (id)sortDescriptorsForNewestToOldest:(BOOL)a3
{
  v11[4] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v3 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"pubDate" ascending:0];
    v11[0] = v3;
    BOOL v4 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"episodeNumber" ascending:0];
    v11[1] = v4;
    double v5 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"episodeLevel" ascending:1];
    v11[2] = v5;
    uint64_t v6 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"title" ascending:1 selector:sel_localizedStandardCompare_];
    v11[3] = v6;
    double v7 = v11;
  }
  else
  {
    id v3 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"pubDate" ascending:1];
    v10[0] = v3;
    BOOL v4 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"episodeNumber" ascending:1];
    v10[1] = v4;
    double v5 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"episodeLevel" ascending:0];
    v10[2] = v5;
    uint64_t v6 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"title" ascending:1 selector:sel_localizedStandardCompare_];
    v10[3] = v6;
    double v7 = v10;
  }
  BOOL v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:4];

  return v8;
}

+ (id)predicateForPodcastWithFeedUrl:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    double v5 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K = %@", @"feedURL", v4];
    uint64_t v6 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K = %@", @"updatedFeedURL", v4];
    double v7 = [v5 OR:v6];

    if (+[MTPodcast isRedirectURL:v4])
    {
      uint64_t v8 = +[MTPodcast storeCollectionIdForRedirectURL:v4];
      if (v8 >= 1)
      {
        uint64_t v9 = [a1 predicateForPodcastStoreId:v8];
        uint64_t v10 = [v7 OR:v9];

        double v7 = (void *)v10;
      }
    }
  }
  else
  {
    double v7 = [MEMORY[0x1E4F28F60] falsePredicate];
  }

  return v7;
}

+ (BOOL)isRedirectURL:(id)a3
{
  id v3 = a3;
  id v4 = +[IMURLBag sharedInstance];
  double v5 = [v4 syncStringForKey:@"podcast-redirect-url-prefix"];

  if ([v5 length]) {
    char v6 = [v3 hasPrefix:v5];
  }
  else {
    char v6 = 0;
  }

  return v6;
}

+ (id)predicateForPodcastStoreId:(int64_t)a3
{
  id v3 = (void *)MEMORY[0x1E4F28F60];
  id v4 = [MEMORY[0x1E4F28ED0] numberWithLongLong:a3];
  double v5 = [v3 predicateWithFormat:@"%K = %@", @"storeCollectionId", v4];

  return v5;
}

- (BOOL)importing
{
  return ((unint64_t)[(MTPodcast *)self flags] >> 5) & 1;
}

- (BOOL)isExplicit
{
  return ((unint64_t)[(MTPodcast *)self flags] >> 8) & 1;
}

- (BOOL)playbackNewestToOldest
{
  return ((unint64_t)[(MTPodcast *)self flags] >> 3) & 1;
}

+ (id)predicateForSubscribedAndNotHidden
{
  return (id)objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K = 1 AND %K = 0", @"subscribed", @"hidden");
}

+ (id)predicateForPodcastsWithLibraryEpisodes
{
  return (id)objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K != 0", @"libraryEpisodesCount");
}

+ (id)predicateForPodcastUuids:(id)a3
{
  return (id)[MEMORY[0x1E4F28F60] predicateWithFormat:@"%K in %@", @"uuid", a3];
}

+ (id)predicateForNotSubscribedAndNotHiddenAndNotImplicitlyFollowed
{
  return (id)objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K = 0 AND %K = 0", @"subscribed", @"isHiddenOrImplicitlyFollowed");
}

+ (id)predicateForPodcastsNeedingRetry:(BOOL)a3
{
  if (a3) {
    id v3 = @"(%K & %lld) == %lld";
  }
  else {
    id v3 = @"(%K & %lld) != %lld";
  }
  return (id)objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", v3, @"flags", 4096, 4096);
}

- (id)newestEpisodeExcludingUuid:(id)a3 excludeExplicit:(int64_t)a4
{
  return [(MTPodcast *)self _latestOrOldestEpisode:1 sortDate:0 restrictToUserEpisodes:0 excludePlayed:0 excludeExplicit:a4 excludingEpisodeUuid:a3];
}

- (id)newestEpisode
{
  return [(MTPodcast *)self newestEpisodeExcludingUuid:0 excludeExplicit:0];
}

- (id)newestEpisodeByAvailabiltyTime
{
  return [(MTPodcast *)self _latestOrOldestEpisode:1 sortDate:1 restrictToUserEpisodes:0 excludePlayed:0 excludeExplicit:0 excludingEpisodeUuid:0];
}

- (id)newestFullEpisode
{
  return [(MTPodcast *)self _latestOrOldestEpisode:1 sortDate:0 restrictToUserEpisodes:0 excludePlayed:0 excludeExplicit:0 episodeTypeFilter:1];
}

- (id)nextEpisodeNotPlayedExcludingExplicit:(int64_t)a3 episodeTypeFilter:(int64_t)a4
{
  return [(MTPodcast *)self _latestOrOldestEpisode:1 sortDate:0 restrictToUserEpisodes:0 excludePlayed:1 excludeExplicit:a3 excludingEpisodeUuid:0 episodeTypeFilter:a4];
}

- (id)newestUserEpisodeExcludingExplicit:(int64_t)a3
{
  return [(MTPodcast *)self _latestOrOldestEpisode:1 sortDate:0 restrictToUserEpisodes:1 excludePlayed:0 excludeExplicit:a3];
}

- (id)oldestEpisodeExcludingExplicit:(int64_t)a3
{
  return [(MTPodcast *)self oldestEpisodeExcludingExplicit:a3 episodeTypeFilter:0];
}

- (id)oldestEpisodeExcludingExplicit:(int64_t)a3 episodeTypeFilter:(int64_t)a4
{
  return [(MTPodcast *)self _latestOrOldestEpisode:0 sortDate:0 restrictToUserEpisodes:0 excludePlayed:0 excludeExplicit:a3 excludingEpisodeUuid:0 episodeTypeFilter:a4];
}

- (id)oldestUserEpisodeExcludingExplicit:(int64_t)a3
{
  return [(MTPodcast *)self _latestOrOldestEpisode:0 sortDate:0 restrictToUserEpisodes:1 excludePlayed:0 excludeExplicit:a3];
}

- (id)mostRecentlyPlayedEpisodeWithFilter:(id)a3
{
  id v4 = a3;
  if ([v4 playStateFilter])
  {
    double v5 = (void *)[v4 copy];

    [v5 setPlayStateFilter:0];
    id v4 = v5;
  }
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  id v20 = __Block_byref_object_copy__3;
  v21 = __Block_byref_object_dispose__3;
  id v22 = 0;
  objc_initWeak(&location, self);
  char v6 = [(MTPodcast *)self managedObjectContext];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __64__MTPodcast_EpisodeLookup__mostRecentlyPlayedEpisodeWithFilter___block_invoke;
  v11[3] = &unk_1E5E61690;
  objc_copyWeak(&v15, &location);
  id v7 = v4;
  id v12 = v7;
  id v8 = v6;
  id v13 = v8;
  id v14 = &v17;
  [v8 performBlockAndWait:v11];
  id v9 = (id)v18[5];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v17, 8);

  return v9;
}

void __64__MTPodcast_EpisodeLookup__mostRecentlyPlayedEpisodeWithFilter___block_invoke(uint64_t a1)
{
  v18[3] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v3 = [*(id *)(a1 + 32) predicateForPodcast:WeakRetained];
  id v4 = +[MTEpisode predicateForHasBeenPlayed];
  double v5 = [v3 AND:v4];

  char v6 = +[MTEpisode predicateForExternalType:0];
  id v7 = [v5 AND:v6];

  id v8 = +[MTEpisode predicateForHidingFuturePlayedTimestamps];
  id v9 = [v7 AND:v8];

  uint64_t v10 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"lastDatePlayed" ascending:0];
  v11 = objc_msgSend(MEMORY[0x1E4F29008], "sortDescriptorWithKey:ascending:", @"playState", 0, v10);
  v18[1] = v11;
  id v12 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"pubDate" ascending:1];
  v18[2] = v12;
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:3];

  id v14 = [*(id *)(a1 + 40) objectsInEntity:@"MTEpisode" predicate:v9 sortDescriptors:v13 returnsObjectsAsFaults:0 limit:1];
  uint64_t v15 = [v14 firstObject];
  uint64_t v16 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v17 = *(void **)(v16 + 40);
  *(void *)(v16 + 40) = v15;
}

- (id)highestNumberedEpisodePublishedBefore:(double)a3 filter:(id)a4
{
  id v4 = [(MTPodcast *)self _episodesNextTo:0 after:0 usePlayOrder:0 sortAsc:1 sortByEpisodeNumber:a4 filter:1 limit:a3];
  double v5 = [v4 firstObject];

  return v5;
}

- (id)newestEpisodeWithFilter:(id)a3
{
  return [(MTPodcast *)self _latestOrOldestEpisode:1 sortDate:0 filter:a3];
}

- (id)lowestNumberedEpisodePublishedAfter:(double)a3 filter:(id)a4
{
  id v4 = [(MTPodcast *)self _episodesNextTo:1 after:0 usePlayOrder:1 sortAsc:1 sortByEpisodeNumber:a4 filter:1 limit:a3];
  double v5 = [v4 firstObject];

  return v5;
}

- (id)episodePublishedBefore:(double)a3 filter:(id)a4
{
  id v4 = [(MTPodcast *)self _episodesNextTo:0 after:0 usePlayOrder:1 sortAsc:0 sortByEpisodeNumber:a4 filter:1 limit:a3];
  double v5 = [v4 firstObject];

  return v5;
}

- (id)episodesPublishedAfter:(double)a3 filter:(id)a4 limit:(int64_t)a5 sortAsc:(BOOL)a6
{
  return [(MTPodcast *)self _episodesNextTo:1 after:0 usePlayOrder:a6 sortAsc:0 sortByEpisodeNumber:a4 filter:a5 limit:a3];
}

- (id)episodePublishedAfter:(double)a3 filter:(id)a4
{
  id v4 = [(MTPodcast *)self _episodesNextTo:1 after:0 usePlayOrder:0 sortAsc:0 sortByEpisodeNumber:a4 filter:1 limit:a3];
  double v5 = [v4 firstObject];

  return v5;
}

- (id)highestNumberedPlayedEpisodeWithFilter:(id)a3
{
  id v4 = a3;
  double v5 = [(MTPodcast *)self managedObjectContext];
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = __Block_byref_object_copy__3;
  v23 = __Block_byref_object_dispose__3;
  id v24 = 0;
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  id v13 = __67__MTPodcast_EpisodeLookup__highestNumberedPlayedEpisodeWithFilter___block_invoke;
  id v14 = &unk_1E5E616B8;
  id v6 = v4;
  id v15 = v6;
  uint64_t v16 = self;
  uint64_t v18 = &v19;
  id v7 = v5;
  id v17 = v7;
  [v7 performBlockAndWait:&v11];
  id v8 = (void *)v20[5];
  if (v8)
  {
    id v9 = objc_msgSend(v8, "firstObject", v11, v12, v13, v14, v15, v16);
  }
  else
  {
    id v9 = 0;
  }

  _Block_object_dispose(&v19, 8);
  return v9;
}

void __67__MTPodcast_EpisodeLookup__highestNumberedPlayedEpisodeWithFilter___block_invoke(uint64_t a1)
{
  id v10 = [*(id *)(a1 + 32) predicateForPodcast:*(void *)(a1 + 40)];
  uint64_t v2 = +[MTEpisode predicateForVisuallyPlayed:1];
  id v3 = +[MTEpisode predicateForHasEpisodeNumber];
  id v4 = [v10 AND:v2];
  double v5 = [v4 AND:v3];

  id v6 = +[MTEpisode sortDescriptorsForSeasonAndEpisodeNumberAscending:0];
  uint64_t v7 = [*(id *)(a1 + 48) objectsInEntity:@"MTEpisode" predicate:v5 sortDescriptors:v6 returnsObjectsAsFaults:0 limit:1];
  uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;
}

- (id)nextNumberedUnplayedEpisodeAfter:(id)a3 filter:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(MTPodcast *)self managedObjectContext];
  if ([v6 isVisuallyPlayed]
    && [v6 episodeNumber]
    && [v6 episodeNumber] >= 1)
  {
    id v9 = v6;
  }
  else
  {
    id v9 = [(MTPodcast *)self highestNumberedPlayedEpisodeWithFilter:v7];
  }
  id v10 = v9;
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__3;
  v27 = __Block_byref_object_dispose__3;
  id v28 = 0;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __68__MTPodcast_EpisodeLookup__nextNumberedUnplayedEpisodeAfter_filter___block_invoke;
  v17[3] = &unk_1E5E616E0;
  id v11 = v7;
  id v18 = v11;
  uint64_t v19 = self;
  id v12 = v10;
  id v20 = v12;
  id v22 = &v23;
  id v13 = v8;
  id v21 = v13;
  [v13 performBlockAndWait:v17];
  id v14 = (void *)v24[5];
  if (v14)
  {
    id v15 = [v14 firstObject];
  }
  else
  {
    id v15 = 0;
  }

  _Block_object_dispose(&v23, 8);
  return v15;
}

void __68__MTPodcast_EpisodeLookup__nextNumberedUnplayedEpisodeAfter_filter___block_invoke(uint64_t a1)
{
  id v13 = [*(id *)(a1 + 32) predicateForPodcast:*(void *)(a1 + 40)];
  uint64_t v2 = +[MTEpisode predicateForEpisodeTypeFilter:5];
  id v3 = [v13 AND:v2];
  id v4 = +[MTEpisode predicateForVisuallyPlayed:0];
  double v5 = [v3 AND:v4];

  id v6 = *(void **)(a1 + 48);
  if (v6)
  {
    id v7 = +[MTEpisode predicateForEpisodesWithSeasonAndEpisodeNumbersGreaterThanOrEqualTo:seasonNumber:](MTEpisode, "predicateForEpisodesWithSeasonAndEpisodeNumbersGreaterThanOrEqualTo:seasonNumber:", [v6 episodeNumber], objc_msgSend(*(id *)(a1 + 48), "seasonNumber"));
    uint64_t v8 = [v5 AND:v7];

    double v5 = (void *)v8;
  }
  id v9 = +[MTEpisode sortDescriptorsForSeasonAndEpisodeNumberAscending:1];
  uint64_t v10 = [*(id *)(a1 + 56) objectsInEntity:@"MTEpisode" predicate:v5 sortDescriptors:v9 returnsObjectsAsFaults:0 limit:1];
  uint64_t v11 = *(void *)(*(void *)(a1 + 64) + 8);
  id v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;
}

- (id)oldestEpisodeInLatestSeasonOrShowWithFilter:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__3;
  uint64_t v16 = __Block_byref_object_dispose__3;
  id v17 = 0;
  double v5 = [(MTPodcast *)self managedObjectContext];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __72__MTPodcast_EpisodeLookup__oldestEpisodeInLatestSeasonOrShowWithFilter___block_invoke;
  v9[3] = &unk_1E5E61708;
  v9[4] = self;
  uint64_t v11 = &v12;
  id v6 = v4;
  id v10 = v6;
  [v5 performBlockAndWait:v9];
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

uint64_t __72__MTPodcast_EpisodeLookup__oldestEpisodeInLatestSeasonOrShowWithFilter___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) latestSeasonNumber];
  id v3 = *(void **)(a1 + 32);
  if (v2 < 1)
  {
    uint64_t v7 = [v3 lowestNumberedEpisodeWithFilter:*(void *)(a1 + 40)];
    uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v8 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v7;
  }
  else
  {
    uint64_t v11 = objc_msgSend(v3, "episodesInSeasonNumber:lowestNumberedEpisodesFirst:filter:limit:");
    uint64_t v4 = [v11 firstObject];
    uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;

    uint64_t v8 = v11;
  }
  return MEMORY[0x1F41817F8](v7, v8);
}

- (id)lowestNumberedEpisodeWithFilter:(id)a3
{
  id v4 = a3;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy__3;
  id v20 = __Block_byref_object_dispose__3;
  id v21 = 0;
  objc_initWeak(&location, self);
  uint64_t v5 = [(MTPodcast *)self managedObjectContext];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __60__MTPodcast_EpisodeLookup__lowestNumberedEpisodeWithFilter___block_invoke;
  v10[3] = &unk_1E5E61690;
  objc_copyWeak(&v14, &location);
  id v6 = v4;
  id v11 = v6;
  id v7 = v5;
  id v12 = v7;
  id v13 = &v16;
  [v7 performBlockAndWait:v10];
  id v8 = (id)v17[5];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v16, 8);

  return v8;
}

void __60__MTPodcast_EpisodeLookup__lowestNumberedEpisodeWithFilter___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v2 = [*(id *)(a1 + 32) predicateForPodcast:WeakRetained];
  id v3 = +[MTEpisode predicateForHidingFuturePlayedTimestamps];
  id v4 = [v2 AND:v3];

  uint64_t v5 = +[MTEpisode predicateForExternalType:0];
  id v6 = [v4 AND:v5];

  id v7 = *(void **)(a1 + 40);
  id v8 = +[MTEpisode sortDescriptorsForEpisodeNumberAscending:1];
  uint64_t v9 = [v7 objectsInEntity:@"MTEpisode" predicate:v6 sortDescriptors:v8 returnsObjectsAsFaults:0 limit:1];

  uint64_t v10 = [v9 firstObject];
  uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
  id v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;
}

- (id)userEpisodesAfterEpisode:(id)a3
{
  return [(MTPodcast *)self _episodesNextToEpisode:a3 after:1 usePlayOrder:1 restrictToUserEpisodes:1 excludePlayed:0 excludeExplicit:0 episodeTypeFilter:0 limit:0];
}

- (id)_latestOrOldestEpisode:(BOOL)a3 sortDate:(unint64_t)a4 restrictToUserEpisodes:(BOOL)a5 excludePlayed:(BOOL)a6 excludeExplicit:(int64_t)a7 excludingEpisodeUuid:(id)a8
{
  return [(MTPodcast *)self _latestOrOldestEpisode:a3 sortDate:a4 restrictToUserEpisodes:a5 excludePlayed:a6 excludeExplicit:a7 excludingEpisodeUuid:a8 episodeTypeFilter:0];
}

- (id)_latestOrOldestEpisode:(BOOL)a3 sortDate:(unint64_t)a4 restrictToUserEpisodes:(BOOL)a5 excludePlayed:(BOOL)a6 excludeExplicit:(int64_t)a7 episodeTypeFilter:(int64_t)a8
{
  return [(MTPodcast *)self _latestOrOldestEpisode:a3 sortDate:a4 restrictToUserEpisodes:a5 excludePlayed:a6 excludeExplicit:a7 excludingEpisodeUuid:0 episodeTypeFilter:a8];
}

- (id)_latestOrOldestEpisode:(BOOL)a3 sortDate:(unint64_t)a4 restrictToUserEpisodes:(BOOL)a5 excludePlayed:(BOOL)a6 excludeExplicit:(int64_t)a7 excludingEpisodeUuid:(id)a8 episodeTypeFilter:(int64_t)a9
{
  return -[MTPodcast _latestOrOldestEpisode:sortDate:restrictToUserEpisodes:playStateFilter:excludeExplicit:excludingEpisodeUuid:episodeTypeFilter:](self, "_latestOrOldestEpisode:sortDate:restrictToUserEpisodes:playStateFilter:excludeExplicit:excludingEpisodeUuid:episodeTypeFilter:", a3, a4, a5, a6, a7, a8);
}

- (id)_latestOrOldestEpisode:(BOOL)a3 sortDate:(unint64_t)a4 restrictToUserEpisodes:(BOOL)a5 playStateFilter:(int64_t)a6 excludeExplicit:(int64_t)a7 excludingEpisodeUuid:(id)a8 episodeTypeFilter:(int64_t)a9
{
  BOOL v11 = a5;
  BOOL v13 = a3;
  id v15 = a8;
  uint64_t v16 = objc_opt_new();
  [v16 setRestrictToUserEpisodes:v11];
  [v16 setPlayStateFilter:a6];
  [v16 setExcludeExplicit:a7];
  [v16 setExcludingEpisodeUuid:v15];

  [v16 setEpisodeTypeFilter:a9];
  id v17 = [(MTPodcast *)self _latestOrOldestEpisode:v13 sortDate:a4 filter:v16];

  return v17;
}

- (id)_latestOrOldestEpisode:(BOOL)a3 sortDate:(unint64_t)a4 filter:(id)a5
{
  id v8 = a5;
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000;
  uint64_t v25 = __Block_byref_object_copy__3;
  v26 = __Block_byref_object_dispose__3;
  id v27 = 0;
  objc_initWeak(&location, self);
  uint64_t v9 = [(MTPodcast *)self managedObjectContext];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __67__MTPodcast_EpisodeLookup___latestOrOldestEpisode_sortDate_filter___block_invoke;
  v14[3] = &unk_1E5E61730;
  objc_copyWeak(v19, &location);
  id v10 = v8;
  v19[1] = (id)a4;
  id v15 = v10;
  uint64_t v16 = self;
  BOOL v20 = a3;
  id v11 = v9;
  id v17 = v11;
  uint64_t v18 = &v22;
  [v11 performBlockAndWait:v14];
  id v12 = (id)v23[5];

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v22, 8);

  return v12;
}

void __67__MTPodcast_EpisodeLookup___latestOrOldestEpisode_sortDate_filter___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "predicateForPodcast:");
  id v3 = +[MTEpisode predicateForHidingFuturePlayedTimestamps];
  id v4 = [v2 AND:v3];

  uint64_t v5 = +[MTEpisode predicateForExternalType:0];
  id v6 = [v4 AND:v5];

  uint64_t v7 = *(void *)(a1 + 72);
  id v8 = objc_opt_class();
  BOOL v9 = *(unsigned char *)(a1 + 80) != 0;
  if (v7) {
    [v8 sortDescriptorsForNewestToOldestFirstTimeAvailable:v9];
  }
  else {
  id v10 = [v8 sortDescriptorsForNewestToOldest:v9];
  }
  id v11 = [*(id *)(a1 + 48) objectsInEntity:@"MTEpisode" predicate:v6 sortDescriptors:v10 returnsObjectsAsFaults:0 limit:1];
  uint64_t v12 = [v11 firstObject];
  uint64_t v13 = *(void *)(*(void *)(a1 + 56) + 8);
  id v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v12;
}

- (id)_episodeNextToEpisode:(id)a3 after:(BOOL)a4 usePlayOrder:(BOOL)a5 restrictToUserEpisodes:(BOOL)a6 excludePlayed:(BOOL)a7 excludeExplicit:(int64_t)a8 episodeTypeFilter:(int64_t)a9
{
  BOOL v9 = [(MTPodcast *)self _episodesNextToEpisode:a3 after:a4 usePlayOrder:a5 restrictToUserEpisodes:a6 excludePlayed:a7 excludeExplicit:a8 episodeTypeFilter:a9 limit:1];
  id v10 = [v9 firstObject];

  return v10;
}

- (id)_episodesNextToEpisode:(id)a3 after:(BOOL)a4 usePlayOrder:(BOOL)a5 restrictToUserEpisodes:(BOOL)a6 excludePlayed:(BOOL)a7 excludeExplicit:(int64_t)a8 episodeTypeFilter:(int64_t)a9 limit:(int64_t)a10
{
  BOOL v11 = a7;
  BOOL v12 = a6;
  BOOL v13 = a5;
  BOOL v14 = a4;
  [a3 pubDate];
  return -[MTPodcast _episodesNextTo:after:usePlayOrder:sortAsc:restrictToUserEpisodes:excludePlayed:excludeExplicit:episodeTypeFilter:limit:](self, "_episodesNextTo:after:usePlayOrder:sortAsc:restrictToUserEpisodes:excludePlayed:excludeExplicit:episodeTypeFilter:limit:", v14, v13, 0, v12, v11, a8);
}

- (id)_episodesNextTo:(double)a3 after:(BOOL)a4 usePlayOrder:(BOOL)a5 sortAsc:(BOOL)a6 restrictToUserEpisodes:(BOOL)a7 excludePlayed:(BOOL)a8 excludeExplicit:(int64_t)a9 episodeTypeFilter:(int64_t)a10 limit:(int64_t)a11
{
  BOOL v12 = a8;
  BOOL v13 = a7;
  BOOL v21 = a6;
  BOOL v14 = a5;
  BOOL v15 = a4;
  uint64_t v18 = objc_opt_new();
  [v18 setRestrictToUserEpisodes:v13];
  objc_msgSend(v18, "setPlayStateFilter:", +[MTPodcastEpisodeFilter playStateFilterFromExcludePlayed:](MTPodcastEpisodeFilter, "playStateFilterFromExcludePlayed:", v12));
  [v18 setExcludeExplicit:a9];
  [v18 setEpisodeTypeFilter:a10];
  uint64_t v19 = [(MTPodcast *)self _episodesNextTo:v15 after:v14 usePlayOrder:v21 sortAsc:0 sortByEpisodeNumber:v18 filter:a11 limit:a3];

  return v19;
}

- (id)_episodesNextTo:(double)a3 after:(BOOL)a4 usePlayOrder:(BOOL)a5 sortAsc:(BOOL)a6 sortByEpisodeNumber:(BOOL)a7 filter:(id)a8 limit:(int64_t)a9
{
  id v16 = a8;
  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__3;
  uint64_t v37 = __Block_byref_object_dispose__3;
  id v38 = 0;
  objc_initWeak(&location, self);
  id v17 = [(MTPodcast *)self managedObjectContext];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __104__MTPodcast_EpisodeLookup___episodesNextTo_after_usePlayOrder_sortAsc_sortByEpisodeNumber_filter_limit___block_invoke;
  v22[3] = &unk_1E5E61758;
  objc_copyWeak(v27, &location);
  v27[1] = *(id *)&a3;
  BOOL v28 = a5;
  BOOL v29 = a4;
  id v18 = v16;
  BOOL v30 = a7;
  BOOL v31 = a6;
  id v23 = v18;
  uint64_t v24 = self;
  v26 = &v33;
  id v19 = v17;
  id v25 = v19;
  v27[2] = (id)a9;
  [v19 performBlockAndWait:v22];
  id v20 = (id)v34[5];

  objc_destroyWeak(v27);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v33, 8);

  return v20;
}

void __104__MTPodcast_EpisodeLookup___episodesNextTo_after_usePlayOrder_sortAsc_sortByEpisodeNumber_filter_limit___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  uint64_t v2 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:*(double *)(a1 + 72)];
  if (*(unsigned char *)(a1 + 88))
  {
    if (([WeakRetained playbackNewestToOldest] ^ (*(unsigned char *)(a1 + 89) == 0)))
    {
LABEL_3:
      id v3 = [MEMORY[0x1E4F28F60] predicateForDateKey:@"pubDate" isLessThanDate:v2];
      unsigned int v4 = 1;
      goto LABEL_6;
    }
  }
  else if (!*(unsigned char *)(a1 + 89))
  {
    goto LABEL_3;
  }
  id v3 = [MEMORY[0x1E4F28F60] predicateForDateKey:@"pubDate" isGreaterThanDate:v2];
  unsigned int v4 = 0;
LABEL_6:
  uint64_t v5 = [*(id *)(a1 + 32) predicateForPodcast:WeakRetained];
  id v6 = [v5 AND:v3];
  uint64_t v7 = +[MTEpisode predicateForExternalType:0];
  id v8 = [v6 AND:v7];

  if (*(unsigned char *)(a1 + 90))
  {
    BOOL v9 = +[MTEpisode sortDescriptorsForSeasonAndEpisodeNumberAscending:*(unsigned __int8 *)(a1 + 91)];
    id v10 = +[MTEpisode predicateForHasEpisodeNumber];
    uint64_t v11 = [v8 AND:v10];

    id v8 = (void *)v11;
  }
  else
  {
    BOOL v12 = objc_opt_class();
    if (*(unsigned char *)(a1 + 91)) {
      uint64_t v13 = 1;
    }
    else {
      uint64_t v13 = v4;
    }
    BOOL v9 = [v12 sortDescriptorsForNewestToOldest:v13];
  }
  uint64_t v14 = [*(id *)(a1 + 48) objectsInEntity:@"MTEpisode" predicate:v8 sortDescriptors:v9 returnsObjectsAsFaults:0 limit:*(void *)(a1 + 80)];
  uint64_t v15 = *(void *)(*(void *)(a1 + 56) + 8);
  id v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v14;
}

- (int64_t)latestSeasonNumber
{
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 0;
  id v3 = [(MTPodcast *)self managedObjectContext];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__MTPodcast_EpisodeLookup__latestSeasonNumber__block_invoke;
  v7[3] = &unk_1E5E61780;
  v7[4] = self;
  id v4 = v3;
  id v8 = v4;
  BOOL v9 = &v10;
  [v4 performBlockAndWait:v7];
  int64_t v5 = v11[3];

  _Block_object_dispose(&v10, 8);
  return v5;
}

void __46__MTPodcast_EpisodeLookup__latestSeasonNumber__block_invoke(uint64_t a1)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) uuid];
  id v3 = +[MTEpisode predicateForEpisodesWithSeasonNumbersOnPodcastUuid:v2];

  id v4 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"seasonNumber" ascending:0];
  int64_t v5 = *(void **)(a1 + 40);
  v10[0] = v4;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  uint64_t v7 = [v5 objectsInEntity:@"MTEpisode" predicate:v3 sortDescriptors:v6 returnsObjectsAsFaults:0 limit:1];

  id v8 = [v7 firstObject];
  BOOL v9 = [v8 valueForKey:@"seasonNumber"];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v9 longLongValue];
}

- (id)episodesInLatestSeasonWithLimit:(int64_t)a3
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  uint64_t v12 = __Block_byref_object_copy__3;
  uint64_t v13 = __Block_byref_object_dispose__3;
  id v14 = 0;
  int64_t v5 = [(MTPodcast *)self managedObjectContext];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __60__MTPodcast_EpisodeLookup__episodesInLatestSeasonWithLimit___block_invoke;
  v8[3] = &unk_1E5E617A8;
  v8[4] = self;
  v8[5] = &v9;
  v8[6] = a3;
  [v5 performBlockAndWait:v8];
  id v6 = (id)v10[5];

  _Block_object_dispose(&v9, 8);
  return v6;
}

uint64_t __60__MTPodcast_EpisodeLookup__episodesInLatestSeasonWithLimit___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "episodesInSeasonNumber:oldestEpisodesFirst:excludePlayed:excludeExplicit:episodeTypeFilter:limit:", objc_msgSend(*(id *)(a1 + 32), "latestSeasonNumber"), objc_msgSend(*(id *)(a1 + 32), "sortAscending"), 0, 0, 1, *(void *)(a1 + 48));
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;
  return MEMORY[0x1F41817F8](v2, v4);
}

- (id)episodesInSeasonNumber:(int64_t)a3
{
  if (a3 < 1)
  {
    id v6 = 0;
  }
  else
  {
    uint64_t v9 = 0;
    uint64_t v10 = &v9;
    uint64_t v11 = 0x3032000000;
    uint64_t v12 = __Block_byref_object_copy__3;
    uint64_t v13 = __Block_byref_object_dispose__3;
    id v14 = 0;
    int64_t v5 = [(MTPodcast *)self managedObjectContext];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __51__MTPodcast_EpisodeLookup__episodesInSeasonNumber___block_invoke;
    v8[3] = &unk_1E5E617A8;
    v8[4] = self;
    v8[5] = &v9;
    v8[6] = a3;
    [v5 performBlockAndWait:v8];
    id v6 = (id)v10[5];

    _Block_object_dispose(&v9, 8);
  }
  return v6;
}

uint64_t __51__MTPodcast_EpisodeLookup__episodesInSeasonNumber___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "episodesInSeasonNumber:oldestEpisodesFirst:", *(void *)(a1 + 48), objc_msgSend(*(id *)(a1 + 32), "sortAscending"));
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;
  return MEMORY[0x1F41817F8](v2, v4);
}

- (id)episodesInSeasonNumber:(int64_t)a3 oldestEpisodesFirst:(BOOL)a4
{
  return [(MTPodcast *)self episodesInSeasonNumber:a3 oldestEpisodesFirst:a4 excludePlayed:0 excludeExplicit:0 limit:0];
}

- (id)episodesInSeasonNumber:(int64_t)a3 oldestEpisodesFirst:(BOOL)a4 excludePlayed:(BOOL)a5 excludeExplicit:(int64_t)a6 limit:(int64_t)a7
{
  return [(MTPodcast *)self episodesInSeasonNumber:a3 oldestEpisodesFirst:a4 excludePlayed:a5 excludeExplicit:a6 episodeTypeFilter:0 limit:a7];
}

- (id)episodesInSeasonNumber:(int64_t)a3 oldestEpisodesFirst:(BOOL)a4 excludePlayed:(BOOL)a5 excludeExplicit:(int64_t)a6 episodeTypeFilter:(int64_t)a7 limit:(unint64_t)a8
{
  BOOL v11 = a5;
  BOOL v12 = a4;
  uint64_t v15 = objc_opt_new();
  objc_msgSend(v15, "setPlayStateFilter:", +[MTPodcastEpisodeFilter playStateFilterFromExcludePlayed:](MTPodcastEpisodeFilter, "playStateFilterFromExcludePlayed:", v11));
  [v15 setExcludeExplicit:a6];
  [v15 setEpisodeTypeFilter:a7];
  id v16 = [(MTPodcast *)self episodesInSeasonNumber:a3 oldestEpisodesFirst:v12 filter:v15 limit:a8];

  return v16;
}

- (id)episodesInSeasonNumber:(int64_t)a3 oldestEpisodesFirst:(BOOL)a4 filter:(id)a5 limit:(int64_t)a6
{
  id v10 = a5;
  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x3032000000;
  id v27 = __Block_byref_object_copy__3;
  BOOL v28 = __Block_byref_object_dispose__3;
  id v29 = 0;
  BOOL v11 = [(MTPodcast *)self managedObjectContext];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __84__MTPodcast_EpisodeLookup__episodesInSeasonNumber_oldestEpisodesFirst_filter_limit___block_invoke;
  v16[3] = &unk_1E5E617D0;
  int64_t v21 = a3;
  id v12 = v10;
  id v17 = v12;
  id v18 = self;
  BOOL v23 = a4;
  id v20 = &v24;
  id v13 = v11;
  id v19 = v13;
  int64_t v22 = a6;
  [v13 performBlockAndWait:v16];
  id v14 = (id)v25[5];

  _Block_object_dispose(&v24, 8);
  return v14;
}

void __84__MTPodcast_EpisodeLookup__episodesInSeasonNumber_oldestEpisodesFirst_filter_limit___block_invoke(uint64_t a1)
{
  id v8 = +[MTEpisode predicateForSeasonNumber:*(void *)(a1 + 64)];
  uint64_t v2 = [*(id *)(a1 + 32) predicateForPodcast:*(void *)(a1 + 40)];
  uint64_t v3 = [v2 AND:v8];
  uint64_t v4 = +[MTEpisode sortDescriptorsForSeasonsWithOldestEpisodesFirst:*(unsigned __int8 *)(a1 + 80)];
  uint64_t v5 = [*(id *)(a1 + 48) objectsInEntity:@"MTEpisode" predicate:v3 sortDescriptors:v4 returnsObjectsAsFaults:0 limit:*(void *)(a1 + 72)];
  uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (id)episodesInSeasonNumber:(int64_t)a3 lowestNumberedEpisodesFirst:(BOOL)a4 filter:(id)a5 limit:(int64_t)a6
{
  id v10 = a5;
  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x3032000000;
  id v27 = __Block_byref_object_copy__3;
  BOOL v28 = __Block_byref_object_dispose__3;
  id v29 = 0;
  BOOL v11 = [(MTPodcast *)self managedObjectContext];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __92__MTPodcast_EpisodeLookup__episodesInSeasonNumber_lowestNumberedEpisodesFirst_filter_limit___block_invoke;
  v16[3] = &unk_1E5E617D0;
  int64_t v21 = a3;
  id v12 = v10;
  id v17 = v12;
  id v18 = self;
  BOOL v23 = a4;
  id v20 = &v24;
  id v13 = v11;
  id v19 = v13;
  int64_t v22 = a6;
  [v13 performBlockAndWait:v16];
  id v14 = (id)v25[5];

  _Block_object_dispose(&v24, 8);
  return v14;
}

void __92__MTPodcast_EpisodeLookup__episodesInSeasonNumber_lowestNumberedEpisodesFirst_filter_limit___block_invoke(uint64_t a1)
{
  id v8 = +[MTEpisode predicateForSeasonNumber:*(void *)(a1 + 64)];
  uint64_t v2 = [*(id *)(a1 + 32) predicateForPodcast:*(void *)(a1 + 40)];
  uint64_t v3 = [v2 AND:v8];
  uint64_t v4 = +[MTEpisode sortDescriptorsForEpisodeNumberAscending:*(unsigned __int8 *)(a1 + 80)];
  uint64_t v5 = [*(id *)(a1 + 48) objectsInEntity:@"MTEpisode" predicate:v3 sortDescriptors:v4 returnsObjectsAsFaults:0 limit:*(void *)(a1 + 72)];
  uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

+ (id)sortDescriptorsForNewestToOldestFirstTimeAvailable:(BOOL)a3
{
  return +[MTEpisode sortDescriptorsForFirstAvailableAscending:!a3];
}

- (void)setPodcastPID:(int64_t)a3
{
  if ([(MTPodcast *)self podcastPID] != a3)
  {
    [(MTPodcast *)self willChangeValueForKey:@"podcastPID"];
    uint64_t v5 = [MEMORY[0x1E4F28ED0] numberWithLongLong:a3];
    [(MTPodcast *)self setPrimitiveValue:v5 forKey:@"podcastPID"];

    [(MTPodcast *)self didChangeValueForKey:@"podcastPID"];
  }
}

- (void)setHidden:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(MTPodcast *)self hidden] != a3)
  {
    [(MTPodcast *)self willChangeValueForKey:@"hidden"];
    uint64_t v5 = [MEMORY[0x1E4F28ED0] numberWithBool:v3];
    [(MTPodcast *)self setPrimitiveValue:v5 forKey:@"hidden"];

    [(MTPodcast *)self didChangeValueForKey:@"hidden"];
    [(MTPodcast *)self updateIsHiddenOrImplicitlyFollowed];
  }
}

- (void)setIsImplicitlyFollowed:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(MTPodcast *)self isImplicitlyFollowed] != a3)
  {
    [(MTPodcast *)self willChangeValueForKey:@"isImplicitlyFollowed"];
    uint64_t v5 = [MEMORY[0x1E4F28ED0] numberWithBool:v3];
    [(MTPodcast *)self setPrimitiveValue:v5 forKey:@"isImplicitlyFollowed"];

    [(MTPodcast *)self didChangeValueForKey:@"isImplicitlyFollowed"];
    [(MTPodcast *)self updateIsHiddenOrImplicitlyFollowed];
    if (v3)
    {
      [(MTPodcast *)self updateLastImplicitlyFollowedDate];
    }
  }
}

- (void)updateLastImplicitlyFollowedDate
{
  id v3 = [MEMORY[0x1E4F1C9C8] now];
  [v3 timeIntervalSinceReferenceDate];
  -[MTPodcast setLastImplicitlyFollowedDate:](self, "setLastImplicitlyFollowedDate:");
}

- (void)updateIsHiddenOrImplicitlyFollowed
{
  if ([(MTPodcast *)self hidden]) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = [(MTPodcast *)self isImplicitlyFollowed];
  }
  [(MTPodcast *)self setIsHiddenOrImplicitlyFollowed:v3];
}

- (BOOL)isShareable
{
  uint64_t v2 = [(MTPodcast *)self feedURL];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)setFlags:(int64_t)a3
{
  if ([(MTPodcast *)self flags] != a3)
  {
    [(MTPodcast *)self willChangeValueForKey:@"flags"];
    uint64_t v5 = [MEMORY[0x1E4F28ED0] numberWithLongLong:a3];
    [(MTPodcast *)self setPrimitiveValue:v5 forKey:@"flags"];

    [(MTPodcast *)self didChangeValueForKey:@"flags"];
  }
}

- (BOOL)sortAscending
{
  return ((unint64_t)[(MTPodcast *)self flags] >> 1) & 1;
}

- (void)setIsExplicit:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(MTPodcast *)self flags];
  if (((((v5 & 0x100) == 0) ^ v3) & 1) == 0)
  {
    uint64_t v6 = 256;
    if (!v3) {
      uint64_t v6 = 0;
    }
    [(MTPodcast *)self setFlags:v5 & 0xFFFFFFFFFFFFFEFFLL | v6];
  }
}

- (void)setFeedUpdateNeedsRetry:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(MTPodcast *)self flags];
  if (((((v5 & 0x1000) == 0) ^ v3) & 1) == 0)
  {
    uint64_t v6 = 4096;
    if (!v3) {
      uint64_t v6 = 0;
    }
    [(MTPodcast *)self setFlags:v5 & 0xFFFFFFFFFFFFEFFFLL | v6];
  }
}

- (void)setHasBeenSynced:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(MTPodcast *)self flags];
  if (((((v5 & 4) == 0) ^ v3) & 1) == 0)
  {
    uint64_t v6 = 4;
    if (!v3) {
      uint64_t v6 = 0;
    }
    [(MTPodcast *)self setFlags:v5 & 0xFFFFFFFFFFFFFFFBLL | v6];
  }
}

- (BOOL)hasBeenSynced
{
  return ((unint64_t)[(MTPodcast *)self flags] >> 2) & 1;
}

- (void)setImporting:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(MTPodcast *)self flags];
  if (((((v5 & 0x20) == 0) ^ v3) & 1) == 0)
  {
    uint64_t v6 = 32;
    if (!v3) {
      uint64_t v6 = 0;
    }
    [(MTPodcast *)self setFlags:v5 & 0xFFFFFFFFFFFFFFDFLL | v6];
  }
}

- (void)setIsTransitioningFromImplicit:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(MTPodcast *)self flags];
  if (((((v5 & 0x10000) == 0) ^ v3) & 1) == 0)
  {
    uint64_t v6 = 0x10000;
    if (!v3) {
      uint64_t v6 = 0;
    }
    [(MTPodcast *)self setFlags:v5 & 0xFFFFFFFFFFFEFFFFLL | v6];
  }
}

- (BOOL)isTransitioningFromImplicit
{
  return ((unint64_t)[(MTPodcast *)self flags] >> 16) & 1;
}

- (BOOL)isAuthenticatedDark
{
  return ((unint64_t)[(MTPodcast *)self flags] >> 11) & 1;
}

- (void)setAuthenticatedDark:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(MTPodcast *)self isDark];
  uint64_t v6 = [(MTPodcast *)self flags];
  if (((((v6 & 0x800) == 0) ^ v3) & 1) == 0)
  {
    uint64_t v7 = 2048;
    if (!v3) {
      uint64_t v7 = 0;
    }
    [(MTPodcast *)self setFlags:v6 & 0xFFFFFFFFFFFFF7FFLL | v7];
    BOOL v8 = [(MTPodcast *)self isDark];
    uint64_t v9 = [(MTPodcast *)self latestExitFromDarkDownloads];
    if (v9)
    {
      id v12 = +[PFAnalyticsEvent darkDownloadsChangeWithWasDark:v5 isDark:v8 reason:1 previousExit:v9];
    }
    else
    {
      id v10 = [MEMORY[0x1E4F1C9C8] now];
      id v12 = +[PFAnalyticsEvent darkDownloadsChangeWithWasDark:v5 isDark:v8 reason:1 previousExit:v10];
    }
    BOOL v11 = objc_opt_new();
    [v11 sendEvent:v12];
  }
}

- (id)displayURL
{
  uint64_t v2 = NSString;
  uint64_t v3 = [(MTPodcast *)self uuid];
  uint64_t v4 = (void *)v3;
  BOOL v5 = @"null";
  if (v3) {
    BOOL v5 = (__CFString *)v3;
  }
  uint64_t v6 = [v2 stringWithFormat:@"podcasts://show?podcastUuid=%@", v5];

  uint64_t v7 = [MEMORY[0x1E4F1CB10] URLWithString:v6];

  return v7;
}

- (int64_t)episodeLimitResolvedValue
{
  if ([(MTPodcast *)self episodeLimit] == 0xFFFFFFFFLL)
  {
    return +[MTPodcast episodeLimitDefaultValue];
  }
  else
  {
    int64_t result = [(MTPodcast *)self episodeLimit];
    if (result == 0x100000001)
    {
      if ([(MTPodcast *)self isSerialShowTypeInFeed]
        && !os_feature_enabled_serial_sort_auto_downloads())
      {
        return 0;
      }
      else
      {
        uint64_t v4 = [MEMORY[0x1E4F1CB18] _applePodcastsFoundationSettingsUserDefaults];
        int64_t v5 = [v4 episodeLimitForKey:@"MTPodcastEpisodeLimitDefaultKey"];

        return v5;
      }
    }
  }
  return result;
}

- (BOOL)deletePlayedEpisodesResolvedValue
{
  if ([(MTPodcast *)self deletePlayedEpisodes] == 0xFFFFFFFFLL) {
    uint64_t v3 = +[MTPodcast deletePlayedEpisodesDefaultValue];
  }
  else {
    uint64_t v3 = [(MTPodcast *)self deletePlayedEpisodes];
  }
  return v3 != 0;
}

- (id)earliestDateForFeedFetch:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x1E4F1C9C8];
  id v5 = a3;
  [(MTPodcast *)self lastFetchedDate];
  uint64_t v6 = objc_msgSend(v4, "dateWithTimeIntervalSinceReferenceDate:");
  [(MTPodcast *)self calculatedUpdateInterval];
  uint64_t v7 = objc_msgSend(v6, "dateByAddingTimeInterval:");
  BOOL v8 = [v5 laterDate:v7];

  return v8;
}

- (double)calculatedUpdateInterval
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(MTPodcast *)self consecutiveFeedFetchErrors];
  if (v3 > 5)
  {
    unint64_t v7 = v3;
    BOOL v8 = _MTLogCategoryFeedUpdate();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v7 > 0xA)
    {
      if (v9)
      {
        BOOL v11 = [(MTPodcast *)self feedURL];
        int v12 = 138412546;
        id v13 = v11;
        __int16 v14 = 2048;
        uint64_t v15 = [(MTPodcast *)self storeCollectionId];
        _os_log_impl(&dword_1AC9D5000, v8, OS_LOG_TYPE_DEFAULT, "calculatedUpdateInterval for podcast with feedUrl %@ and storeId %lld: 1 week", (uint8_t *)&v12, 0x16u);
      }
      return 604800.0;
    }
    else
    {
      if (v9)
      {
        id v10 = [(MTPodcast *)self feedURL];
        int v12 = 138412546;
        id v13 = v10;
        __int16 v14 = 2048;
        uint64_t v15 = [(MTPodcast *)self storeCollectionId];
        _os_log_impl(&dword_1AC9D5000, v8, OS_LOG_TYPE_DEFAULT, "calculatedUpdateInterval for podcast with feedUrl %@ and storeId %lld: 1 day", (uint8_t *)&v12, 0x16u);
      }
      return 86400.0;
    }
  }
  else
  {
    uint64_t v4 = _MTLogCategoryFeedUpdate();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = [(MTPodcast *)self feedURL];
      int v12 = 138412546;
      id v13 = v5;
      __int16 v14 = 2048;
      uint64_t v15 = [(MTPodcast *)self storeCollectionId];
      _os_log_impl(&dword_1AC9D5000, v4, OS_LOG_TYPE_DEFAULT, "calculatedUpdateInterval for podcast with feedUrl %@ and storeId %lld: 4 hours", (uint8_t *)&v12, 0x16u);
    }
    +[MTPodcast defaultUpdateInterval];
  }
  return result;
}

+ (int64_t)episodeLimitDefaultValue
{
  uint64_t v2 = [MEMORY[0x1E4F1CB18] _applePodcastsFoundationSettingsUserDefaults];
  int64_t v3 = [v2 episodeLimitForKey:@"MTPodcastEpisodeLimitDefaultKey"];

  return v3;
}

+ (int64_t)deletePlayedEpisodesDefaultValue
{
  uint64_t v2 = [MEMORY[0x1E4F1CB18] _applePodcastsFoundationSettingsUserDefaults];
  int64_t v3 = [v2 integerForKey:@"MTPodcastDeletePlayedEpisodesDefaultKey"];

  return v3;
}

+ (BOOL)autoDownloadDefaultValue
{
  uint64_t v2 = [MEMORY[0x1E4F1CB18] _applePodcastsFoundationSettingsUserDefaults];
  BOOL v3 = [v2 integerForKey:@"MTPodcastAutoDownloadStateDefaultKey"] != 0;

  return v3;
}

- (int64_t)showTypeInFeedResolvedValue
{
  uint64_t v2 = [(MTPodcast *)self showTypeInFeed];
  int64_t v3 = +[MTPodcast showTypeFromString:v2];

  return v3;
}

+ (BOOL)sortOrderAscForShowType:(int64_t)a3
{
  if (a3 == 1) {
    return 0;
  }
  if (a3 == 4 || a3 == 2) {
    return 1;
  }
  return +[MTPodcast defaultShowType] != 1;
}

+ (id)propertiesToObserveForDownloadableEpisodes
{
  v6[12] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1E4F1CAD0];
  v6[0] = @"flags";
  v6[1] = @"feedURL";
  v6[2] = @"sortOrder";
  v6[3] = @"hidden";
  v6[4] = @"playbackNewestToOldest";
  v6[5] = @"episodeLimit";
  v6[6] = @"nextEpisodeUuid";
  v6[7] = @"deletePlayedEpisodes";
  v6[8] = @"sortAscending";
  v6[9] = @"showTypeSetting";
  v6[10] = @"showTypeInFeed";
  v6[11] = @"episodes";
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:12];
  uint64_t v4 = [v2 setWithArray:v3];

  return v4;
}

- (BOOL)isDark
{
  if ([(MTPodcast *)self isAuthenticatedDark]) {
    return 1;
  }
  return [(MTPodcast *)self isPastAutodownloadOrEpisodeLimitDark];
}

- (void)resetGoDarkWithReason:(unint64_t)a3
{
  if ([(MTPodcast *)self darkCount] >= 5)
  {
    id v5 = +[SyncKeysRepository shared];
    objc_msgSend(v5, "markSubscriptionSyncDirty:for:", 1, -[MTPodcast syncType](self, "syncType"));
  }
  if ([(MTPodcast *)self isDark])
  {
    uint64_t v6 = [(MTPodcast *)self latestExitFromDarkDownloads];
    if (v6)
    {
      unint64_t v7 = +[PFAnalyticsEvent darkDownloadsChangeWithWasDark:1 isDark:0 reason:a3 previousExit:v6];
    }
    else
    {
      BOOL v8 = [MEMORY[0x1E4F1C9C8] now];
      unint64_t v7 = +[PFAnalyticsEvent darkDownloadsChangeWithWasDark:1 isDark:0 reason:a3 previousExit:v8];
    }
    BOOL v9 = objc_opt_new();
    [v9 sendEvent:v7];

    id v10 = [MEMORY[0x1E4F1C9C8] now];
    [(MTPodcast *)self suppressEpisodesWithBasisDate:v10];
    [(MTPodcast *)self setLatestExitFromDarkDownloads:v10];
  }
  [(MTPodcast *)self setDarkCount:0];
  [(MTPodcast *)self setDarkCountLocal:0];
  [(MTPodcast *)self updateLastTouchDate];
}

- (void)updateLastTouchDate
{
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  -[MTPodcast setLastTouchDate:](self, "setLastTouchDate:");
}

- (void)suppressEpisodesWithBasisDate:(id)a3
{
  v39[4] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1C038] batchUpdateRequestWithEntityName:@"MTEpisode"];
  uint64_t v6 = (void *)MEMORY[0x1E4F28BA0];
  unint64_t v7 = [(MTPodcast *)self uuid];
  BOOL v8 = +[MTEpisode predicateForAllEpisodesOnPodcastUuid:v7];
  v39[0] = v8;
  BOOL v9 = +[MTEpisode predicateForDownloadBehavior:0];
  v39[1] = v9;
  id v28 = v4;
  id v10 = +[MTEpisode predicateForEpisodesPublishedBeforeDate:v4];
  v39[2] = v10;
  BOOL v11 = +[MTEpisode predicateForEpisodesWithinLevel:[(MTPodcast *)self levelForDownloadsOnSubscription]];
  int v12 = [v11 NOT];
  v39[3] = v12;
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:4];
  __int16 v14 = [v6 andPredicateWithSubpredicates:v13];
  [v5 setPredicate:v14];

  uint64_t v37 = @"downloadBehavior";
  id v38 = &unk_1F03D7F50;
  uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v38 forKeys:&v37 count:1];
  [v5 setPropertiesToUpdate:v15];

  [v5 setResultType:1];
  uint64_t v16 = [(MTPodcast *)self managedObjectContext];
  id v29 = 0;
  id v17 = [v16 executeRequest:v5 error:&v29];
  id v18 = v29;

  id v19 = [v17 result];

  if (v19)
  {
    uint64_t v35 = *MEMORY[0x1E4F1BFA8];
    id v20 = [v17 result];
    v36 = v20;
    int64_t v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v36 forKeys:&v35 count:1];

    int64_t v22 = (void *)MEMORY[0x1E4F1C110];
    BOOL v23 = [(MTPodcast *)self managedObjectContext];
    v34 = v23;
    uint64_t v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v34 count:1];
    [v22 mergeChangesFromRemoteContextSave:v21 intoContexts:v24];

    id v25 = _MTLogCategoryDatabase();
    uint64_t v26 = v28;
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      id v27 = [v17 result];
      *(_DWORD *)buf = 138412546;
      id v31 = v28;
      __int16 v32 = 2112;
      id v33 = v27;
      _os_log_impl(&dword_1AC9D5000, v25, OS_LOG_TYPE_INFO, "Batch suppressed episodes because of basis date (%@): %@", buf, 0x16u);
    }
  }
  else
  {
    int64_t v21 = _MTLogCategoryDatabase();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v26 = v28;
      id v31 = v28;
      __int16 v32 = 2112;
      id v33 = v18;
      _os_log_impl(&dword_1AC9D5000, v21, OS_LOG_TYPE_ERROR, "Failed to suppressed episodes with basis date. (%@): %@", buf, 0x16u);
    }
    else
    {
      uint64_t v26 = v28;
    }
  }
}

- (unint64_t)levelForDownloadsOnSubscription
{
  BOOL v2 = [(MTPodcast *)self isSerialShowTypeInFeed];
  uint64_t v3 = (unint64_t *)&kMaxSubscribeDownloadForSerialWithSeasons;
  if (!v2) {
    uint64_t v3 = (unint64_t *)&kMaxSubscribeDownloadForNonSerialShow;
  }
  return *v3;
}

+ (id)insertNewPodcastInManagedObjectContext:(id)a3 subscribed:(BOOL)a4 feedUrl:(id)a5 showType:(int64_t)a6 showTypeInFeed:(id)a7 title:(id)a8 author:(id)a9 provider:(id)a10 imageUrl:(id)a11 description:(id)a12 adamId:(int64_t)a13 displayType:(id)a14 showSpecificUpsellCopy:(id)a15
{
  uint64_t v15 = +[MTPodcast insertNewPodcastInManagedObjectContext:a3 subscribed:a4 feedUrl:a5 showType:a6 showTypeInFeed:a7 title:a8 author:a9 provider:a10 imageUrl:a11 description:a12 displayType:a14 showSpecificUpsellCopy:a15];
  if (+[MTStoreIdentifier isNotEmpty:a13]) {
    [v15 setStoreCollectionId:a13];
  }
  return v15;
}

+ (id)insertNewPodcastInManagedObjectContext:(id)a3 subscribed:(BOOL)a4 feedUrl:(id)a5 showType:(int64_t)a6 title:(id)a7 author:(id)a8 provider:(id)a9 imageUrl:(id)a10 description:(id)a11
{
  return (id)[a1 insertNewPodcastInManagedObjectContext:a3 subscribed:a4 feedUrl:a5 showType:a6 showTypeInFeed:0 title:a7 author:a8 provider:a9 imageUrl:a10 description:a11 displayType:0 showSpecificUpsellCopy:0];
}

+ (id)insertNewPodcastInManagedObjectContext:(id)a3 subscribed:(BOOL)a4 feedUrl:(id)a5 showType:(int64_t)a6 showTypeInFeed:(id)a7 title:(id)a8 author:(id)a9 provider:(id)a10 imageUrl:(id)a11 description:(id)a12 displayType:(id)a13 showSpecificUpsellCopy:(id)a14
{
  BOOL v31 = a4;
  id v17 = a3;
  id v18 = a5;
  id v35 = a7;
  id v19 = a8;
  id v20 = a9;
  id v21 = a10;
  id v22 = a11;
  id v23 = a12;
  id v34 = a13;
  id v24 = a14;
  v36 = v17;
  id v25 = [v17 podcastForFeedUrl:v18];
  [v25 setHidden:0];
  if (!v25)
  {
    id v25 = [MEMORY[0x1E4F1C0A8] insertNewObjectForEntityForName:@"MTPodcast" inManagedObjectContext:v17];
    uint64_t v26 = [NSString UUID];
    [v25 setUuid:v26];

    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    objc_msgSend(v25, "setAddedDate:");
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    objc_msgSend(v25, "setModifiedDate:");
    [v25 setUpdateInterval:0];
    [v25 updateLastTouchDate];
    [v25 setFeedURL:v18];
    [v25 setAuthor:v20];
    [v25 setProvider:v21];
    [v25 setImageURL:v22];
    [v25 setTitle:v19];
    [v25 setItemDescription:v23];
    objc_msgSend(v25, "setSubscribed:");
    [v25 setDeletePlayedEpisodes:0xFFFFFFFFLL];
    [v25 setNeedsArtworkUpdate:1];
    [v25 setDisplayType:v34];
    [v25 setShowSpecificUpsellCopy:v24];
    if (v35) {
      [v25 setShowTypeInFeed:v35];
    }
    if (v31) {
      [v25 applyFollowedShowSettingsFor:a6];
    }
    else {
      objc_msgSend(v25, "applyUnfollowedShowSettings", a6);
    }
    [v25 setUpdatedDate:0.0];
    objc_msgSend(v25, "setSortOrder:", objc_msgSend(v17, "nextSortOrderForPodcasts"));
    [a1 prepareForPlatform:v25];
  }
  id v27 = +[SyncKeysRepository shared];
  objc_msgSend(v27, "markSubscriptionSyncDirty:for:", 1, objc_msgSend(v25, "syncType"));

  id v28 = objc_opt_new();
  id v29 = [v25 feedURL];
  [v28 resetVersionForFeedUrl:v29];

  return v25;
}

+ (unint64_t)totalUnplayedCount
{
  uint64_t v10 = 0;
  BOOL v11 = &v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 0;
  BOOL v2 = +[MTDB sharedInstance];
  uint64_t v3 = [v2 mainOrPrivateContext];

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __40__MTPodcast_Library__totalUnplayedCount__block_invoke;
  v7[3] = &unk_1E5E61CF8;
  BOOL v9 = &v10;
  id v4 = v3;
  id v8 = v4;
  [v4 performBlockAndWait:v7];
  unint64_t v5 = v11[3];

  _Block_object_dispose(&v10, 8);
  return v5;
}

void __40__MTPodcast_Library__totalUnplayedCount__block_invoke(uint64_t a1)
{
  id v2 = +[MTEpisode predicateForEpisodesOnUnplayedTab];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(a1 + 32) countOfObjectsInEntity:@"MTEpisode" predicate:v2];
}

- (id)shareURL
{
  uint64_t v3 = [(MTPodcast *)self bestAvailableStoreCleanURL];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(MTPodcast *)self currentFeedURL];
  }
  uint64_t v6 = v5;

  return v6;
}

- (id)bestAvailableStoreCleanURL
{
  uint64_t v3 = [(MTPodcast *)self storeCleanURL];
  uint64_t v4 = [v3 length];

  if (v4)
  {
    id v5 = (void *)MEMORY[0x1E4F1CB10];
    uint64_t v6 = [(MTPodcast *)self storeCleanURL];
    unint64_t v7 = [v5 URLWithString:v6];
  }
  else
  {
    if (!+[MTStoreIdentifier isEmpty:](MTStoreIdentifier, "isEmpty:", [(MTPodcast *)self storeCollectionId]))id v8 = +[MTPodcast storeCleanURLForAdamID:[(MTPodcast *)self storeCollectionId]]; {
    unint64_t v7 = 0;
    }
  }
  return v7;
}

+ (id)storeCleanURLForAdamID:(int64_t)a3
{
  if (+[MTStoreIdentifier isEmpty:](MTStoreIdentifier, "isEmpty:"))
  {
    uint64_t v4 = 0;
  }
  else
  {
    id v5 = +[IMURLBag sharedInstance];
    uint64_t v6 = [v5 syncStringForKey:@"viewPodcast"];
    unint64_t v7 = v6;
    if (v6)
    {
      id v8 = objc_msgSend(v6, "stringByAppendingFormat:", @"/id%lld", a3);
      uint64_t v4 = [MEMORY[0x1E4F1CB10] URLWithString:v8];
    }
    else
    {
      uint64_t v4 = 0;
    }
  }
  return v4;
}

+ (id)productURLForStoreCollectionId:(int64_t)a3 storeTrackId:(int64_t)a4
{
  id v5 = +[MTPodcast storeCleanURLForAdamID:a3];
  if (+[MTStoreIdentifier isNotEmpty:a4])
  {
    uint64_t v6 = objc_msgSend(NSString, "stringWithFormat:", @"%lld", a4);
    objc_msgSend(v5, "pf_URLByAppendingQueryParameterKey:value:", @"i", v6);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v7 = v5;
  }

  return v7;
}

- (id)twitterShareURL
{
  uint64_t v3 = [(MTPodcast *)self storeCleanURL];
  if (v3)
  {
    uint64_t v4 = (void *)MEMORY[0x1E4F1CB10];
    id v5 = [(MTPodcast *)self storeShortURL];
    uint64_t v6 = [v4 URLWithString:v5];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

+ (int64_t)storeCollectionIdForRedirectURL:(id)a3
{
  id v4 = a3;
  if ([a1 isRedirectURL:v4])
  {
    id v5 = +[IMURLBag sharedInstance];
    uint64_t v6 = [v5 syncStringForKey:@"podcast-redirect-url-prefix"];

    id v7 = [v4 stringByReplacingOccurrencesOfString:v6 withString:&stru_1F03A51F0];
    uint64_t v8 = [v7 longLongValue];
    if ((unint64_t)(v8 - 0x7FFFFFFFFFFFFFFFLL) >= 2) {
      int64_t v9 = v8;
    }
    else {
      int64_t v9 = 0;
    }
  }
  else
  {
    int64_t v9 = 0;
  }

  return v9;
}

- (id)updatedAtString
{
  uint64_t v3 = [MEMORY[0x1E4F28B50] podcastsFoundationBundle];
  id v4 = [v3 localizedStringForKey:@"SHOW_UPDATED_AT_FORMAT" value:&stru_1F03A51F0 table:0];

  id v5 = (void *)MEMORY[0x1E4F1C9C8];
  [(MTPodcast *)self latestEpisodeAvailabilityTime];
  uint64_t v6 = objc_msgSend(v5, "dateWithTimeIntervalSinceReferenceDate:");
  id v7 = [v6 friendlyDisplayString];

  uint64_t v8 = [NSString localizedStringWithValidatedFormat:v4, @"%@", 0, v7 validFormatSpecifiers error];

  return v8;
}

- (BOOL)requestsAreNonAppInitiated
{
  uint64_t v2 = [(MTPodcast *)self storeCollectionId];
  return +[MTStoreIdentifier isEmpty:v2];
}

- (void)markPlaylistsForUpdate
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v2 = [(MTPodcast *)self playlistSettings];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        [v7 setNeedsUpdate:1];
        uint64_t v8 = [v7 playlist];
        [v8 setNeedsUpdate:1];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
}

+ (id)episodeLimitsAllowingAutomaticDownloads
{
  if (episodeLimitsAllowingAutomaticDownloads_onceToken != -1) {
    dispatch_once(&episodeLimitsAllowingAutomaticDownloads_onceToken, &__block_literal_global_13);
  }
  uint64_t v2 = (void *)episodeLimitsAllowingAutomaticDownloads_limits;
  return v2;
}

void __65__MTPodcast_NSPredicate__episodeLimitsAllowingAutomaticDownloads__block_invoke()
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v0 = [MEMORY[0x1E4F1CA80] set];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v1 = +[MTPodcastEpisodeLimitHelper allGlobalLimits];
  uint64_t v2 = [v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v8;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v1);
        }
        uint64_t v6 = *(void **)(*((void *)&v7 + 1) + 8 * i);
        if (+[MTPodcastEpisodeLimitHelper limitAllowsAutomaticDownloads:](MTPodcastEpisodeLimitHelper, "limitAllowsAutomaticDownloads:", [v6 longLongValue]))
        {
          [v0 addObject:v6];
        }
        objc_storeStrong((id *)&episodeLimitsAllowingAutomaticDownloads_limits, v0);
      }
      uint64_t v3 = [v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v3);
  }
}

+ (id)userDefaultPropertiesAffectingPredicates
{
  v6[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1E4F1CAD0];
  v6[0] = @"MTPodcastAutoDownloadStateDefaultKey";
  v6[1] = @"MTPodcastEpisodeLimitDefaultKey";
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];
  uint64_t v4 = [v2 setWithArray:v3];

  return v4;
}

+ (id)predicateForHiddenPodcasts
{
  return (id)objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K = 1", @"hidden");
}

+ (id)predicateForImplicitlyFollowedPodcasts
{
  return (id)objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K = 1", @"isImplicitlyFollowed");
}

+ (id)predicateForImplicitlyFollowedPodcastsExcludingUUIDs:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [a1 predicateForImplicitlyFollowedPodcasts];
  uint64_t v6 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"!(%K IN %@)", @"uuid", v4];

  long long v7 = [v5 AND:v6];

  return v7;
}

+ (id)predicateForHiddenOrImplicitlyFollowedPodcasts
{
  return (id)objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K = 1", @"isHiddenOrImplicitlyFollowed");
}

+ (id)predicateForNotImplicitlyFollowedPodcastsWithChannelStoreId:(int64_t)a3
{
  id v4 = [a1 predicateForNotHiddenNotImplicitlyFollowedPodcasts];
  uint64_t v5 = (void *)MEMORY[0x1E4F28F60];
  uint64_t v6 = [MEMORY[0x1E4F28ED0] numberWithLongLong:a3];
  long long v7 = [v5 predicateWithFormat:@"%K = %@", @"channelStoreId", v6];
  long long v8 = [v4 AND:v7];

  return v8;
}

+ (id)predicateForSubscribedPodcasts
{
  return (id)objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K = 1", @"subscribed");
}

+ (id)predicateForNonFollowedShowsWithPlayState
{
  uint64_t v3 = [a1 predicateForNotHiddenPodcasts];
  id v4 = [a1 predicateForNotSubscribedPodcasts];
  uint64_t v5 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"SUBQUERY(%K, $episode, $episode.%K != %@ AND ($episode.%K = %@ OR $episode.%K != %@ OR $episode.%K = %@)).@count > 0", @"episodes", @"playState", &unk_1F03D86B8, @"backCatalog", MEMORY[0x1E4F1CC28], @"playState", &unk_1F03D86D0, @"playStateManuallySet", MEMORY[0x1E4F1CC28]];
  uint64_t v6 = [v3 AND:v4];
  long long v7 = [v6 AND:v5];

  long long v8 = [a1 predicateForImplicitlyFollowedPodcasts];
  long long v9 = [v7 OR:v8];

  return v9;
}

+ (id)predicateForLastDatePlayedAfterDate:(id)a3
{
  return (id)[MEMORY[0x1E4F28F60] predicateForDateKey:@"lastDatePlayed" isGreaterThanDate:a3];
}

+ (id)predicateForLastDatePlayedNotInTheFuture
{
  uint64_t v2 = (void *)MEMORY[0x1E4F28F60];
  uint64_t v3 = [MEMORY[0x1E4F1C9C8] now];
  id v4 = [v2 predicateForDateKey:@"lastDatePlayed" isLessThanOrEqualToDate:v3];

  return v4;
}

+ (id)predicateForNotSubscribedPodcasts
{
  return (id)objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K = 0", @"subscribed");
}

+ (id)predicateForHasBeenSynced:(BOOL)a3
{
  if (a3) {
    uint64_t v3 = 4;
  }
  else {
    uint64_t v3 = 0;
  }
  return (id)objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"(%K != NULL) && ((%K & %lld) == %lld)", @"flags", @"flags", 4, v3);
}

+ (id)predicateForImporting:(BOOL)a3
{
  if (a3) {
    uint64_t v3 = @"(%K & %lld) == %lld";
  }
  else {
    uint64_t v3 = @"(%K & %lld) != %lld";
  }
  return (id)objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", v3, @"flags", 32, 32);
}

+ (id)predicateForAutoDownloadEnabled
{
  uint64_t v2 = (void *)MEMORY[0x1E4F28F60];
  uint64_t v3 = [a1 episodeLimitsAllowingAutomaticDownloads];
  id v4 = [v2 predicateWithFormat:@"%K IN %@", @"episodeLimit", v3];

  uint64_t v5 = [MEMORY[0x1E4F1CB18] _applePodcastsFoundationSettingsUserDefaults];
  uint64_t v6 = [v5 episodeLimitForKey:@"MTPodcastEpisodeLimitDefaultKey"];

  if (+[MTPodcastEpisodeLimitHelper limitAllowsAutomaticDownloads:v6])
  {
    long long v7 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K = %llu", @"episodeLimit", 0x100000001);
    uint64_t v8 = [v4 OR:v7];

    id v4 = (void *)v8;
  }
  return v4;
}

+ (id)predicateForPodcastsFetchedBefore:(id)a3
{
  return (id)[MEMORY[0x1E4F28F60] predicateForDateKey:@"lastFetchedDate" isLessThanDate:a3];
}

+ (id)predicateForPodcastsFollowedSince:(id)a3
{
  id v4 = [MEMORY[0x1E4F28F60] predicateForDateKey:@"addedDate" isGreaterThanDate:a3];
  uint64_t v5 = [a1 predicateForSubscribedPodcasts];
  uint64_t v6 = [v4 AND:v5];

  return v6;
}

+ (id)predicateForPodcastWithTitle:(id)a3
{
  id v3 = a3;
  if ([v3 length]) {
    [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K = %@", @"title", v3];
  }
  else {
  id v4 = [MEMORY[0x1E4F28F60] falsePredicate];
  }

  return v4;
}

+ (id)predicateForHiddenPodcastUuids:(id)a3
{
  id v4 = [a1 predicateForPodcastUuids:a3];
  uint64_t v5 = [a1 predicateForHiddenPodcasts];
  uint64_t v6 = [v4 AND:v5];

  return v6;
}

+ (id)predicateForPodcastUUID:(id)a3
{
  return (id)[MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == %@", @"uuid", a3];
}

+ (id)predicateForIdentifer:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F28F60] falsePredicate];
  uint64_t v5 = [v3 feedUrl];
  uint64_t v6 = [v5 length];

  if (v6)
  {
    long long v7 = [v3 feedUrl];
    uint64_t v8 = +[MTPodcast predicateForPodcastWithFeedUrl:v7];

    id v4 = (void *)v8;
  }
  long long v9 = [v3 storeIdentifier];
  uint64_t v10 = [v9 longLongValue];
  if (v10)
  {
    long long v11 = +[MTPodcast predicateForPodcastStoreId:v10];
    uint64_t v12 = [v4 OR:v11];

    id v4 = (void *)v12;
  }

  return v4;
}

+ (id)predicateForPodcastStoreIDs:(id)a3
{
  return (id)[MEMORY[0x1E4F28F60] predicateWithFormat:@"%K in %@", @"storeCollectionId", a3];
}

+ (id)predicateForAreMediaAPI:(BOOL)a3
{
  if (a3) {
    id v3 = @"%K != %@";
  }
  else {
    id v3 = @"%K = %@";
  }
  id v4 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", v3, @"storeCollectionId", &unk_1F03D86E8);
  return v4;
}

+ (id)predicateForPodcastWithPodcastPID:(int64_t)a3
{
  id v3 = (void *)MEMORY[0x1E4F28F60];
  id v4 = [MEMORY[0x1E4F28ED0] numberWithLongLong:a3];
  uint64_t v5 = [v3 predicateWithFormat:@"%K == %@", @"podcastPID", v4];

  return v5;
}

+ (id)predicateForPaidSubscriptionActive:(BOOL)a3
{
  if (a3) {
    id v3 = @"(%K.%K != NULL) && (%K.%K = 1)";
  }
  else {
    id v3 = @"NOT ((%K.%K != NULL) && (%K.%K = 1))";
  }
  return (id)objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", v3, @"channel", @"subscriptionActive", @"channel", @"subscriptionActive");
}

+ (id)predicateForEntitledShows
{
  id v3 = [a1 predicateForPaidSubscriptionActive:1];
  id v4 = [a1 _predicateForShowsWithPlayableFreeEpisodes];
  uint64_t v5 = [v3 OR:v4];

  return v5;
}

+ (id)predicateForPodcastsWithDownloadedEpisodes
{
  return (id)objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K != 0", @"downloadedEpisodesCount");
}

+ (id)predicateForPodcastsWithUnplayedDownloadedEpisodes
{
  return (id)objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K != 0", @"downloadedUnplayedEpisodesCount");
}

+ (id)predicateForPodcastsWithBookmarkedEpisodes
{
  return (id)objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K != 0", @"savedEpisodesCount");
}

+ (id)predicateForPodcastsWithUnplayedBookmarkedEpisodes
{
  return (id)objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K != 0", @"savedUnplayedEpisodesCount");
}

+ (id)predicateForWatchLibraryShows
{
  uint64_t v2 = +[MTPodcast predicateForNotHiddenNotImplicitlyFollowedPodcasts];
  id v3 = +[MTPodcast predicateForEntitledShows];
  id v4 = [v2 AND:v3];

  return v4;
}

+ (id)recentlyUnfollowedCutoffDate
{
  return (id)[MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-2592000.0];
}

+ (id)predicateForRecentlyUnfollowed
{
  uint64_t v2 = (void *)MEMORY[0x1E4F28F60];
  id v3 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:0.0];
  id v4 = [v2 predicateForDateKey:@"lastUnfollowedDate" isGreaterThanDate:v3];

  return v4;
}

+ (id)predicateForRecentlyUnfollowedOlderThanCutoffDate
{
  uint64_t v2 = [a1 recentlyUnfollowedCutoffDate];
  id v3 = +[MTPodcast predicateForLastUnfollowedDateOlderThanDate:v2];
  id v4 = +[MTPodcast predicateForNilLastUnfollowedDate];
  uint64_t v5 = [v3 OR:v4];

  return v5;
}

+ (id)predicateForLastUnfollowedDateOlderThanDate:(id)a3
{
  return (id)[MEMORY[0x1E4F28F60] predicateForDateKey:@"lastUnfollowedDate" isLessThanDate:a3];
}

+ (id)predicateForNilLastUnfollowedDate
{
  return (id)[MEMORY[0x1E4F28F60] predicateForNilValueForKey:@"lastUnfollowedDate"];
}

+ (id)_predicateForShowsWithPlayableFreeEpisodes
{
  return (id)objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K != %lu", @"offerTypes", 2);
}

+ (id)predicateForPodcastsToAutodownload
{
  uint64_t v2 = +[MTPodcast predicateForNotHiddenNotImplicitlyFollowedPodcasts];
  id v3 = +[MTPodcast predicateForAutoDownloadEnabled];
  id v4 = [v2 AND:v3];
  uint64_t v5 = +[MTPodcast predicateForExcludingExplicitBasedOnSetting];
  uint64_t v6 = [v4 AND:v5];

  return v6;
}

+ (id)predicateForPodcastToAutoRemove
{
  return +[MTPodcast predicateForNotHiddenNotImplicitlyFollowedPodcasts];
}

+ (id)predicateForExcludingExplicitBasedOnSetting
{
  if (+[PFRestrictionsController isExplicitContentAllowed])
  {
    [MEMORY[0x1E4F28F60] truePredicate];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"(%K & %lld) == 0", @"flags", 256);
  uint64_t v2 = };
  return v2;
}

+ (id)podcastUuidForEpisodeUuid:(id)a3 ctx:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 length])
  {
    uint64_t v13 = 0;
    uint64_t v14 = &v13;
    uint64_t v15 = 0x3032000000;
    uint64_t v16 = __Block_byref_object_copy__8;
    id v17 = __Block_byref_object_dispose__8;
    id v18 = 0;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __49__MTPodcast_PFDB__podcastUuidForEpisodeUuid_ctx___block_invoke;
    v9[3] = &unk_1E5E61780;
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

void __49__MTPodcast_PFDB__podcastUuidForEpisodeUuid_ctx___block_invoke(void *a1)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)a1[4];
  id v3 = +[MTEpisode predicateForEpisodeUuid:a1[5]];
  v10[0] = @"podcastUuid";
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  id v5 = [v2 objectDictionariesInEntity:@"MTEpisode" predicate:v3 sortDescriptors:MEMORY[0x1E4F1CBF0] propertiesToFetch:v4 includeObjectId:0];

  id v6 = [v5 firstObject];
  uint64_t v7 = [v6 objectForKeyedSubscript:@"podcastUuid"];
  uint64_t v8 = *(void *)(a1[6] + 8);
  long long v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;
}

- (BOOL)needsArtworkUpdate
{
  return [(MTPodcast *)self flags] & 1;
}

- (void)setNeedsArtworkUpdate:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(MTPodcast *)self needsArtworkUpdate] != a3)
  {
    uint64_t v5 = [(MTPodcast *)self flags];
    if (((((v5 & 1) == 0) ^ v3) & 1) == 0)
    {
      [(MTPodcast *)self setFlags:v5 & 0xFFFFFFFFFFFFFFFELL | v3];
    }
  }
}

- (int64_t)syncType
{
  uint64_t v2 = self;
  id v3 = [(MTPodcast *)v2 displayType];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = MTDisplayTypeFromPersistentString(v3);

    return v5 == 1;
  }
  else
  {

    return 0;
  }
}

- (void)calculateNewEpisodeCountIn:(id)a3 serialShowsUseExperimentalRules:(BOOL)a4
{
  uint64_t v7 = self;
  id v8 = a3;
  uint64_t v12 = self;
  id v9 = [(MTPodcast *)v12 showTypeInFeed];
  id v10 = objc_msgSend(v7, sel_showTypeFromString_, v9);

  id v11 = &selRef_calculateSerialNewEpisodeCountIn_;
  if (v10 == (id)1 || !a4) {
    id v11 = &selRef_calculateEpisodicNewEpisodeCountIn_;
  }
  objc_msgSend(v12, *v11, v8);
}

- (void)calculateEpisodicNewEpisodeCountIn:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1ACB61AEC();
}

- (void)calculateSerialNewEpisodeCountIn:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1ACB62690(v4);
}

- (BOOL)shouldBeDeleted
{
  uint64_t v2 = self;
  id v3 = [(MTPodcast *)v2 episodes];
  if (v3)
  {
    id v4 = v3;
    sub_1ACA6DC4C();
    sub_1ACBDF99C();
    uint64_t v5 = sub_1ACE76988();

    sub_1ACBDF54C(v5);
    LOBYTE(v4) = v6;
    swift_bridgeObjectRelease();
    char v7 = v4 ^ 1;
  }
  else
  {
    char v7 = 1;
  }
  unsigned __int8 v8 = [(MTPodcast *)v2 subscribed];

  return (v8 ^ 1) & v7;
}

- (BOOL)currentEpisodeLimitAllowsAutomaticDownloads
{
  uint64_t v2 = self;
  char v3 = MTPodcastEpisodeLimit.allowsAutomaticDownloads.getter([(MTPodcast *)v2 episodeLimit]);

  return v3 & 1;
}

- (BOOL)currentEpisodeLimitIsNextNEpisodes
{
  uint64_t v2 = self;
  if ([(MTPodcast *)v2 isSerialShowTypeInFeed]) {
    BOOL v3 = sub_1ACCB2380((char *)[(MTPodcast *)v2 episodeLimit]);
  }
  else {
    BOOL v3 = 0;
  }

  return v3;
}

+ (id)importedShowArtworkURLFor:(id)a3
{
  sub_1ACE761B8();
  sub_1ACE77268();
  swift_bridgeObjectRelease();
  sub_1ACE762C8();
  swift_bridgeObjectRelease();
  BOOL v3 = (void *)sub_1ACE76178();
  swift_bridgeObjectRelease();
  return v3;
}

- (BOOL)shouldBeHiddenFromUpNext
{
  uint64_t v2 = self;
  BOOL v3 = MTPodcast.shouldBeHiddenFromUpNext.getter();

  return v3;
}

- (void)applyFollowedShowSettingsFor:(int64_t)a3
{
  id v4 = self;
  [(MTPodcast *)v4 setNotifications:1];
  [(MTPodcast *)v4 setShowTypeSetting:a3];
  [(MTPodcast *)v4 setHidesPlayedEpisodes:0];
  [(MTPodcast *)v4 setEpisodeLimit:0x100000001];
  [(MTPodcast *)v4 setDeletePlayedEpisodes:0xFFFFFFFFLL];
}

- (void)applyUnfollowedShowSettings
{
  BOOL v3 = self;
  char v6 = self;
  id v4 = [(MTPodcast *)v6 showTypeInFeed];
  id v5 = objc_msgSend(v3, sel_showTypeFromString_, v4);

  [(MTPodcast *)v6 applyFollowedShowSettingsFor:v5];
  [(MTPodcast *)v6 setEpisodeLimit:0x100000000];
  [(MTPodcast *)v6 setNotifications:0];
}

@end