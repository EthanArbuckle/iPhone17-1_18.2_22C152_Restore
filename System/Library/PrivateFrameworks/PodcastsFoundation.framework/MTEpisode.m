@interface MTEpisode
+ (BOOL)exists:(id)a3;
+ (BOOL)isExternalMedia:(id)a3;
+ (BOOL)isPlayhead:(double)a3 resumableForDuration:(double)a4;
+ (double)endOfTrackForDuration:(double)a3;
+ (id)_dateWithOffset:(id)a3 fromDate:(id)a4;
+ (id)_predicateForNotEntitlementState:(int64_t)a3;
+ (id)_predicateForPriceType:(int64_t)a3 excluding:(BOOL)a4;
+ (id)_predicateForPriceType:(int64_t)a3 forPriceTypeKey:(id)a4 excluding:(BOOL)a5;
+ (id)assetURLIsPackagedMedia;
+ (id)episodicSortDescriptors:(int64_t)a3;
+ (id)friendlyPubDateStringForEpisode:(id)a3;
+ (id)friendlyPubDateStringForEpisode:(id)a3 abbreviated:(BOOL)a4;
+ (id)insertNewEpisodeInManagedObjectContext:(id)a3 canSendNotifications:(BOOL)a4;
+ (id)insertNewEpisodeInManagedObjectContext:(id)a3 title:(id)a4 podcast:(id)a5 pubDate:(id)a6 byteSize:(int64_t)a7 guid:(id)a8 uti:(id)a9 contentId:(int64_t)a10 enclosureUrl:(id)a11 playStateSource:(int)a12 importSource:(int)a13 canSendNotifications:(BOOL)a14;
+ (id)isHLSEpisode;
+ (id)legacyPredicateForAutomaticDeletionOnShow:(id)a3 deletePlayedEpisodes:(BOOL)a4 episodeLimit:(int64_t)a5;
+ (id)legacyPredicateForAutomaticDownloadsOnShow:(id)a3 deletePlayedEpisodes:(BOOL)a4 episodeLimit:(int64_t)a5 serialNextEpisodesSort:(BOOL)a6 includePlayableWithoutAccount:(BOOL)a7;
+ (id)optimizedPredicateForAutomaticDeletionOnShow:(id)a3 deletePlayedEpisodes:(BOOL)a4 episodeLimit:(int64_t)a5;
+ (id)optimizedPredicateForAutomaticDownloadsOnShow:(id)a3 deletePlayedEpisodes:(BOOL)a4 episodeLimit:(int64_t)a5 serialNextEpisodesSort:(BOOL)a6 includePlayableWithoutAccount:(BOOL)a7;
+ (id)optimizedPredicateForPlayedEpisodePreservation:(BOOL)a3;
+ (id)optimizedPredicatePlaystateForPreservation:(BOOL)a3;
+ (id)optimizedRemovalPredicateForRecentlyPlayed:(BOOL)a3;
+ (id)predicateForAllBookmarkedEpisodes;
+ (id)predicateForAllBookmarksMigrationRecoveredEpisodes;
+ (id)predicateForAllEpisodes;
+ (id)predicateForAllEpisodesIncludingHiddenOnPodcastUuid:(id)a3;
+ (id)predicateForAllEpisodesOnPodcast:(id)a3;
+ (id)predicateForAllEpisodesOnPodcast:(id)a3 includeNonAudioEpisodes:(BOOL)a4;
+ (id)predicateForAllEpisodesOnPodcastUuid:(id)a3;
+ (id)predicateForAllEpisodesOnPodcastUuid:(id)a3 includeNonAudioEpisodes:(BOOL)a4;
+ (id)predicateForAllEpisodesOnPodcastUuids:(id)a3;
+ (id)predicateForAllEpisodesOnPodcastUuids:(id)a3 includeNonAudioEpisodes:(BOOL)a4;
+ (id)predicateForAllUnbookmarkedEpisodes;
+ (id)predicateForAtLeastPartiallyPlayedInInterval:(double)a3;
+ (id)predicateForAudio:(BOOL)a3;
+ (id)predicateForAutomaticDeletionOnShow:(id)a3 deletePlayedEpisodes:(BOOL)a4 episodeLimit:(int64_t)a5;
+ (id)predicateForAutomaticDeletionOnShow:(id)a3 deletePlayedEpisodes:(BOOL)a4 episodeLimit:(int64_t)a5 useOptimizedPredicate:(BOOL)a6;
+ (id)predicateForAutomaticDownloadsOnShow:(id)a3 deletePlayedEpisodes:(BOOL)a4 episodeLimit:(int64_t)a5 serialNextEpisodesSort:(BOOL)a6 includePlayableWithoutAccount:(BOOL)a7;
+ (id)predicateForAutomaticallyDownloadedEpisodes;
+ (id)predicateForAutomaticallyDownloadedEpisodesExcludedByGlobalLimitSettings:(int64_t)a3 excludeHidden:(BOOL)a4;
+ (id)predicateForAutomaticallyDownloadedEpisodesExcludedByShowLimitSettings:(int64_t)a3 excludeHidden:(BOOL)a4;
+ (id)predicateForBacklog:(BOOL)a3;
+ (id)predicateForBookmarkedEpisodes;
+ (id)predicateForBookmarkedEpisodesExcludingUUIDs:(id)a3;
+ (id)predicateForBookmarkedEpisodesOnPodcastUuid:(id)a3;
+ (id)predicateForBookmarksMigrationRecoveredEpisodesOnPodcastUuid:(id)a3;
+ (id)predicateForCategoryPageFromYourShows:(id)a3 ctx:(id)a4;
+ (id)predicateForDRMKeyRequired;
+ (id)predicateForDerivedEntitlementStateEntitled;
+ (id)predicateForDerivedEntitlementStateFree;
+ (id)predicateForDerivedEntitlementStateUnentitled;
+ (id)predicateForDownloadBehavior:(int64_t)a3;
+ (id)predicateForDownloadLimitForEpisodeLimit:(int64_t)a3;
+ (id)predicateForDownloaded:(BOOL)a3;
+ (id)predicateForDownloaded:(BOOL)a3 excludeHidden:(BOOL)a4;
+ (id)predicateForDownloadedEpisodesOnPodcastUuid:(id)a3;
+ (id)predicateForDownloadedFairPlayEpisodes;
+ (id)predicateForEntitledEpisodes;
+ (id)predicateForEpisodeGuid:(id)a3;
+ (id)predicateForEpisodeGuid:(id)a3 onFeedURL:(id)a4;
+ (id)predicateForEpisodeGuid:(id)a3 onPodcastUuid:(id)a4;
+ (id)predicateForEpisodeGuids:(id)a3;
+ (id)predicateForEpisodeStoreTrackId:(int64_t)a3;
+ (id)predicateForEpisodeStoreTrackIds:(id)a3;
+ (id)predicateForEpisodeTitle:(id)a3;
+ (id)predicateForEpisodeTitle:(id)a3 onPodcastUuid:(id)a4;
+ (id)predicateForEpisodeType:(int64_t)a3;
+ (id)predicateForEpisodeTypeFilter:(int64_t)a3;
+ (id)predicateForEpisodeUuid:(id)a3;
+ (id)predicateForEpisodeUuids:(id)a3;
+ (id)predicateForEpisodesDeterminedByLimitSettings:(int64_t)a3;
+ (id)predicateForEpisodesFromiTunesSyncOnPodcastUuid:(id)a3;
+ (id)predicateForEpisodesImportedAfterDate:(id)a3;
+ (id)predicateForEpisodesInFeedForPodcastUuid:(id)a3;
+ (id)predicateForEpisodesInSearchResults;
+ (id)predicateForEpisodesInStationShow:(id)a3;
+ (id)predicateForEpisodesIsFromiTunesSyncOnPodcastUuid:(id)a3;
+ (id)predicateForEpisodesOnPodcastUuid:(id)a3 deletePlayedEpisodes:(BOOL)a4;
+ (id)predicateForEpisodesOnUnplayedTab;
+ (id)predicateForEpisodesOnUnplayedTabOnPodcastUuid:(id)a3 ctx:(id)a4;
+ (id)predicateForEpisodesOnUnplayedTabOnPodcastUuid:(id)a3 deletePlayedEpisodes:(BOOL)a4;
+ (id)predicateForEpisodesOnUnplayedTabOnPodcastUuid:(id)a3 episodeLimit:(int64_t)a4 deletePlayedEpisodes:(BOOL)a5;
+ (id)predicateForEpisodesOnUnplayedTabOnPodcastUuid:(id)a3 episodeLimit:(int64_t)a4 deletePlayedEpisodes:(BOOL)a5 limitToDownloadBehaviorAutomatic:(BOOL)a6;
+ (id)predicateForEpisodesPlayableWithoutAccount;
+ (id)predicateForEpisodesPriceChangedAfterOffset:(id)a3 fromDate:(id)a4;
+ (id)predicateForEpisodesPriceTypeChangedThisWeek;
+ (id)predicateForEpisodesPublishedAfterDate:(id)a3;
+ (id)predicateForEpisodesPublishedAfterOffset:(id)a3 fromDate:(id)a4;
+ (id)predicateForEpisodesPublishedBeforeDate:(id)a3;
+ (id)predicateForEpisodesPublishedLastTwoWeeks;
+ (id)predicateForEpisodesPublishedLastTwoWeeksWithTodayDate:(id)a3;
+ (id)predicateForEpisodesPublishedOnDate:(id)a3;
+ (id)predicateForEpisodesPublishedThisMonth;
+ (id)predicateForEpisodesPublishedThisMonthWithTodayDate:(id)a3;
+ (id)predicateForEpisodesPublishedThisWeek;
+ (id)predicateForEpisodesPublishedThisWeekWithTodayDate:(id)a3;
+ (id)predicateForEpisodesPublishedToday;
+ (id)predicateForEpisodesRequiringAccount;
+ (id)predicateForEpisodesThatShouldBeAutodownloadedForShow:(id)a3 deletePlayedEpisodes:(BOOL)a4 episodeLimit:(int64_t)a5 serialNextEpisodesSort:(BOOL)a6 includePlayableWithoutAccount:(BOOL)a7;
+ (id)predicateForEpisodesToPreserveForUser:(BOOL)a3 episodeLimit:(int64_t)a4;
+ (id)predicateForEpisodesWhichNeedEntitlementStateUpdate;
+ (id)predicateForEpisodesWhichNeedEntitlementStateUpdateForShowUUID:(id)a3 subscriptionState:(BOOL)a4;
+ (id)predicateForEpisodesWithEpisodeNumbersGreaterThan:(int64_t)a3;
+ (id)predicateForEpisodesWithGlobalLimitSetting;
+ (id)predicateForEpisodesWithSeasonAndEpisodeNumbersGreaterThanOrEqualTo:(int64_t)a3 seasonNumber:(int64_t)a4;
+ (id)predicateForEpisodesWithSeasonNumbersOnPodcastUuid:(id)a3;
+ (id)predicateForEpisodesWithUnsatisfiedAvailabilityDate;
+ (id)predicateForEpisodesWithinLevel:(unint64_t)a3;
+ (id)predicateForExplicit:(BOOL)a3;
+ (id)predicateForExternalType:(BOOL)a3;
+ (id)predicateForFeedDeleted:(BOOL)a3;
+ (id)predicateForFeedURL:(id)a3;
+ (id)predicateForFeedURLs:(id)a3;
+ (id)predicateForHLS;
+ (id)predicateForHLSDownloadedExcludeHidden:(BOOL)a3;
+ (id)predicateForHasAnyVisualPlayState;
+ (id)predicateForHasBeenPlayed;
+ (id)predicateForHasEpisodeNumber;
+ (id)predicateForHasNonEmptyEnclosureURL;
+ (id)predicateForHasSeasonNumber;
+ (id)predicateForHasSomeSeasonNumberWithNoEpisodeNumber;
+ (id)predicateForHasValidPersistentId:(BOOL)a3;
+ (id)predicateForHiddenPodcastForEpisodeUuids:(id)a3;
+ (id)predicateForHidingFuturePlayedTimestamps;
+ (id)predicateForIsBackCatalogItem;
+ (id)predicateForIsFromiTunesSync:(BOOL)a3;
+ (id)predicateForIsNew:(BOOL)a3;
+ (id)predicateForIsNotTopLevel;
+ (id)predicateForIsTopLevel;
+ (id)predicateForLibraryEpisodesOnPodcastUuid:(id)a3;
+ (id)predicateForLimittedEpisodesOnPodcastUuid:(id)a3 determinedByLimit:(int64_t)a4 deletePlayedEpisodes:(BOOL)a5;
+ (id)predicateForListenNow;
+ (id)predicateForListenNowForPodcastUuid:(id)a3;
+ (id)predicateForListenNowLatestEpisodes;
+ (id)predicateForListenedAfterMarkedAsPlayed;
+ (id)predicateForMetadataFirstSyncEligible:(BOOL)a3;
+ (id)predicateForNilLastDatePlayed;
+ (id)predicateForNilLastUserMarkedAsPlayedDate;
+ (id)predicateForNonHLS;
+ (id)predicateForNonHLSDownloadedExcludeHidden:(BOOL)a3;
+ (id)predicateForNonNilLastDatePlayed;
+ (id)predicateForNonNilLastUserMarkedAsPlayedDate;
+ (id)predicateForNotManuallyMarkedAsPlayed;
+ (id)predicateForNotPriceType:(int64_t)a3;
+ (id)predicateForNotUnplayed;
+ (id)predicateForOtherEpisodesOnPodcastUuid:(id)a3 baseEpisodesPredicate:(id)a4 deletePlayedEpisodes:(BOOL)a5;
+ (id)predicateForPartiallyPlayedInLastTwoMonths;
+ (id)predicateForPersistentId:(id)a3;
+ (id)predicateForPersistentIds:(id)a3;
+ (id)predicateForPlayStateManuallySet:(BOOL)a3;
+ (id)predicateForPlayableEpisode:(BOOL)a3;
+ (id)predicateForPlayed:(BOOL)a3;
+ (id)predicateForPlayedDateSetByListening;
+ (id)predicateForPlayedInInterval:(double)a3;
+ (id)predicateForPlaylistEpisodes;
+ (id)predicateForPodcastIsNotHidden;
+ (id)predicateForPodcastIsNotHiddenNotImplicitlyFollowed;
+ (id)predicateForPodcastIsSerial:(BOOL)a3;
+ (id)predicateForPodcastIsSubscribed:(BOOL)a3;
+ (id)predicateForPodcastPaidSubscriptionActive:(BOOL)a3;
+ (id)predicateForPreviouslyPlayed;
+ (id)predicateForPreviouslyPlayedHidingFutureTimestamps;
+ (id)predicateForPriceType:(int64_t)a3;
+ (id)predicateForPubDateLimit:(int64_t)a3;
+ (id)predicateForRSSEpisodes;
+ (id)predicateForRecentlyPlayed;
+ (id)predicateForRecentlyPlayedEpisodesToBeDeletedOnPodcastUuid:(id)a3 deletePlayedEpisodes:(BOOL)a4;
+ (id)predicateForSaved:(BOOL)a3;
+ (id)predicateForSeasonNumber:(int64_t)a3;
+ (id)predicateForSeasonNumberWithNoEpisodeNumber:(int64_t)a3;
+ (id)predicateForSentNotification:(BOOL)a3;
+ (id)predicateForStationEligibleEpisodes;
+ (id)predicateForStoreIdentifier:(id)a3;
+ (id)predicateForSubscriptionOnly;
+ (id)predicateForSuppressAutoDownload:(BOOL)a3;
+ (id)predicateForUnbookmarkedEpisodes;
+ (id)predicateForUnplayedTabFlag:(BOOL)a3;
+ (id)predicateForUserEpisode:(BOOL)a3;
+ (id)predicateForUserEpisodes;
+ (id)predicateForUserEpisodesOnPodcastUuid:(id)a3 ctx:(id)a4;
+ (id)predicateForUserEpisodesOnPodcastUuid:(id)a3 episodeLimit:(int64_t)a4 deletePlayedEpisodes:(BOOL)a5 limitToDownloadBehaviorAutomatic:(BOOL)a6;
+ (id)predicateForUserPreservedDownload:(BOOL)a3;
+ (id)predicateForUserSetTopLevelEpisodes;
+ (id)predicateForVideo:(BOOL)a3;
+ (id)predicateForVisuallyPlayed:(BOOL)a3;
+ (id)predicateForWatchBaseEpisodesIncludingOnlyAudio:(BOOL)a3;
+ (id)predicateForWatchRecentlyPlayed;
+ (id)propertiesToFetchAssetURL;
+ (id)propertiesToFetchBestTitle;
+ (id)propertiesToFetchIsBackCatalogItem;
+ (id)propertiesToFetchIsExplicit;
+ (id)propertiesToFetchIsPartiallyPlayed;
+ (id)propertiesToFetchIsPartiallyPlayedBackCatalogItem;
+ (id)propertiesToFetchIsPlayed;
+ (id)propertiesToFetchIsPlayheadPartiallyPlayed;
+ (id)propertiesToFetchIsVisuallyPlayed;
+ (id)propertiesToFetchPlaybackProgress;
+ (id)propertiesToFetchTimeRemaining;
+ (id)propertiesToObserveForDownloadableEpisodes;
+ (id)propertyPathForPodcastProperty:(id)a3;
+ (id)relationshipKeyPathsForPrefetchingIsExplicit;
+ (id)seasonSortDescriptors:(int64_t)a3;
+ (id)sortDescriptorsForCalculatingEpisodeLevel;
+ (id)sortDescriptorsForDownloadedDateAscending:(BOOL)a3;
+ (id)sortDescriptorsForEpisodeNumberAscending:(BOOL)a3;
+ (id)sortDescriptorsForFirstAvailableAscending:(BOOL)a3;
+ (id)sortDescriptorsForLastBookmarkedDateAscending:(BOOL)a3;
+ (id)sortDescriptorsForLastDatePlayedAscending:(BOOL)a3;
+ (id)sortDescriptorsForListenNow;
+ (id)sortDescriptorsForListenNowLatestEpisodes;
+ (id)sortDescriptorsForModifiedDateUpNextScore;
+ (id)sortDescriptorsForPubDateAscending:(BOOL)a3;
+ (id)sortDescriptorsForRecentlyPlayed;
+ (id)sortDescriptorsForSeasonAndEpisodeNumberAscending:(BOOL)a3;
+ (id)sortDescriptorsForSeasonsWithOldestEpisodesFirst:(BOOL)a3;
+ (id)sortDescriptorsForTitle;
+ (id)sortDescriptorsForUpNextScore;
+ (id)timeRemainingStringForEpisode:(id)a3;
+ (id)timeRemainingStringForEpisode:(id)a3 abbreviated:(BOOL)a4;
+ (id)userDefaultPropertiesAffectingPredicates;
+ (void)episodeUuidForGUID:(id)a3 feedURL:(id)a4 completion:(id)a5;
- (BOOL)allowsDurationUpdateFromSource:(int)a3;
- (BOOL)hasFreeVersion;
- (BOOL)hasNonZeroSeasonNumber;
- (BOOL)isBackCatalogItem;
- (BOOL)isBonus;
- (BOOL)isDownloadable;
- (BOOL)isDownloaded;
- (BOOL)isEntitled;
- (BOOL)isExplicit;
- (BOOL)isInPodcastDetailsUnplayedTab;
- (BOOL)isInUserEpisodes;
- (BOOL)isMedia;
- (BOOL)isPartiallyPlayed;
- (BOOL)isPartiallyPlayedBackCatalogItem;
- (BOOL)isPlayed;
- (BOOL)isPlayheadPartiallyPlayed;
- (BOOL)isPlayheadResumable;
- (BOOL)isRestricted;
- (BOOL)isShareable;
- (BOOL)isTopLevel;
- (BOOL)isTrailer;
- (BOOL)isUnplayed;
- (BOOL)isVisuallyPlayed;
- (NSAttributedString)attributedDescriptionFromHTML;
- (NSString)assetURL;
- (double)endOfTrack;
- (double)playbackProgress;
- (double)playbackProgressSanitized;
- (double)timeRemaining;
- (id)bestSummary;
- (id)bestTitle;
- (id)bestUrl;
- (id)displayURL;
- (id)metricsContentIdentifier;
- (id)numberedTitle;
- (id)playURL;
- (id)playedText;
- (id)playedTextForCarplay;
- (id)transcriptProvider;
- (id)transcriptSnippet;
- (int64_t)_resolvedEntitlementState;
- (int64_t)bookmarksSyncType;
- (int64_t)episodeTypeResolvedValue;
- (int64_t)parsePriceType;
- (void)_setAssetUrl:(id)a3;
- (void)incremementPlayCount;
- (void)markAsBookmarked;
- (void)markAsBookmarkedOnTimestamp:(double)a3;
- (void)markAsUnbookmarked;
- (void)resolveAvailabilityDate;
- (void)setAssetURL:(id)a3;
- (void)setAttributedDescriptionFromHTML:(id)a3;
- (void)setByteSize:(int64_t)a3;
- (void)setCleanedTitle:(id)a3;
- (void)setDuration:(double)a3;
- (void)setEnclosureURL:(id)a3;
- (void)setEntitledDuration:(double)a3;
- (void)setEpisodeLevel:(int64_t)a3;
- (void)setEpisodeNumber:(int64_t)a3;
- (void)setEpisodeType:(id)a3;
- (void)setExplicit:(BOOL)a3;
- (void)setFeedDeleted:(BOOL)a3;
- (void)setFreeDuration:(double)a3;
- (void)setImportDate:(double)a3;
- (void)setIsNew:(BOOL)a3;
- (void)setIsTopLevel:(BOOL)a3;
- (void)setItemDescription:(id)a3;
- (void)setItunesSubtitle:(id)a3;
- (void)setItunesTitle:(id)a3;
- (void)setLastDatePlayed:(double)a3;
- (void)setListenNowEpisode:(BOOL)a3;
- (void)setMetadataFirstSyncEligible:(BOOL)a3;
- (void)setMetadataIdentifier:(id)a3;
- (void)setPersistentID:(int64_t)a3;
- (void)setPlayState:(int64_t)a3 manually:(BOOL)a4 source:(int)a5;
- (void)setPlayed:(BOOL)a3 manually:(BOOL)a4 source:(int)a5;
- (void)setPodcast:(id)a3;
- (void)setPodcastUuid:(id)a3;
- (void)setPubDate:(double)a3;
- (void)setSeasonNumber:(int64_t)a3;
- (void)setTrackNum:(int64_t)a3;
- (void)setUti:(id)a3;
- (void)setWebpageURL:(id)a3;
- (void)suppressAutomaticDownloadsIfNeeded;
- (void)unsuppressAutomaticDownloadsIfNeeded;
- (void)updateEntitlementState;
- (void)updateListenNowSortingDate;
- (void)updateUPPTimestamp;
@end

@implementation MTEpisode

+ (id)predicateForAllEpisodesOnPodcastUuid:(id)a3
{
  return (id)[a1 predicateForAllEpisodesOnPodcastUuid:a3 includeNonAudioEpisodes:1];
}

- (BOOL)isPlayheadPartiallyPlayed
{
  [(MTEpisode *)self playhead];
  return v2 > 15.0;
}

- (BOOL)isPartiallyPlayed
{
  return [(MTEpisode *)self playState] == 1;
}

- (BOOL)isPlayed
{
  return [(MTEpisode *)self playState] == 0;
}

+ (id)predicateForEpisodeUuid:(id)a3
{
  return (id)[MEMORY[0x1E4F28F60] predicateWithFormat:@"%K = %@", @"uuid", a3];
}

+ (id)sortDescriptorsForRecentlyPlayed
{
  return (id)[a1 sortDescriptorsForLastDatePlayedAscending:0];
}

- (BOOL)isVisuallyPlayed
{
  if ([(MTEpisode *)self isBackCatalogItem]) {
    return 0;
  }
  return [(MTEpisode *)self isPlayed];
}

- (BOOL)isPartiallyPlayedBackCatalogItem
{
  return [(MTEpisode *)self isBackCatalogItem]
      && [(MTEpisode *)self isPlayheadPartiallyPlayed];
}

- (BOOL)isBackCatalogItem
{
  if ([(MTEpisode *)self playState]
    || ![(MTEpisode *)self playStateManuallySet])
  {
    return 0;
  }
  return [(MTEpisode *)self backCatalog];
}

- (BOOL)hasFreeVersion
{
  float v2 = [(MTEpisode *)self freePriceType];
  uint64_t v3 = MTEpisodePriceTypeFromPersistentString(v2);

  return (v3 & 0xFFFFFFFFFFFFFFFDLL) == 1;
}

+ (id)predicateForAllEpisodesOnPodcastUuid:(id)a3 includeNonAudioEpisodes:(BOOL)a4
{
  v5 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(%K = %@)", @"podcastUuid", a3];
  if (!a4)
  {
    v6 = +[MTEpisode predicateForAudio:1];
    uint64_t v7 = [v5 AND:v6];

    v5 = (void *)v7;
  }
  return v5;
}

- (BOOL)isDownloaded
{
  float v2 = [(MTEpisode *)self assetURL];
  BOOL v3 = v2 != 0;

  return v3;
}

- (NSString)assetURL
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(MTEpisode *)self securityScopedAssetData];
  if (v3)
  {
    unsigned __int8 v11 = 0;
    id v10 = 0;
    v4 = [MEMORY[0x1E4F1CB10] URLByResolvingBookmarkData:v3 options:0 relativeToURL:0 bookmarkDataIsStale:&v11 error:&v10];
    id v5 = v10;
    if (v5) {
      BOOL v6 = 0;
    }
    else {
      BOOL v6 = v11 == 0;
    }
    if (!v6)
    {
      uint64_t v7 = _MTLogCategoryDatabase();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v13 = v5;
        __int16 v14 = 1024;
        int v15 = v11;
        _os_log_impl(&dword_1AC9D5000, v7, OS_LOG_TYPE_ERROR, "Error resolving security scoped bookmark data %@.  Data is stale %d", buf, 0x12u);
      }
    }
    if (v4)
    {
      v8 = [v4 absoluteString];

      goto LABEL_13;
    }
  }
  v8 = [(MTEpisode *)self primitiveValueForKey:@"assetURL"];
LABEL_13:

  return (NSString *)v8;
}

- (id)bestSummary
{
  if (os_feature_enabled_use_episode_description_for_summary())
  {
    BOOL v3 = [(MTEpisode *)self itemDescription];
    if ([v3 hasHTML]) {
      [(MTEpisode *)self itemDescriptionWithoutHTML];
    }
    else {
    v4 = [(MTEpisode *)self itemDescription];
    }
  }
  else
  {
    v4 = [(MTEpisode *)self itunesSubtitle];
  }
  return v4;
}

- (BOOL)isTrailer
{
  return [(MTEpisode *)self episodeTypeResolvedValue] == 1;
}

- (BOOL)isBonus
{
  return [(MTEpisode *)self episodeTypeResolvedValue] == 2;
}

- (int64_t)episodeTypeResolvedValue
{
  BOOL v3 = [(MTEpisode *)self episodeType];
  uint64_t v4 = [v3 length];

  if (!v4) {
    return 0;
  }
  id v5 = [(MTEpisode *)self episodeType];
  uint64_t v6 = [v5 caseInsensitiveCompare:@"trailer"];

  if (!v6) {
    return 1;
  }
  uint64_t v7 = [(MTEpisode *)self episodeType];
  BOOL v8 = [v7 caseInsensitiveCompare:@"bonus"] == 0;

  return 2 * v8;
}

- (id)numberedTitle
{
  uint64_t v3 = [(MTEpisode *)self itunesTitle];
  if (v3 && (v4 = (void *)v3, uint64_t v5 = [(MTEpisode *)self episodeNumber], v4, v5 >= 1))
  {
    uint64_t v6 = [MEMORY[0x1E4F28B50] podcastsFoundationBundle];
    uint64_t v7 = [v6 localizedStringForKey:@"EPISODE_NUMBER_AND_TITLE_FORMAT" value:&stru_1F03A51F0 table:0];

    BOOL v8 = NSString;
    uint64_t v9 = [(MTEpisode *)self episodeNumber];
    id v10 = [(MTEpisode *)self itunesTitle];
    unsigned __int8 v11 = objc_msgSend(v8, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v7, @"%1$lld %2$@", 0, v9, v10);
  }
  else
  {
    unsigned __int8 v11 = [(MTEpisode *)self bestTitle];
  }
  return v11;
}

- (id)bestTitle
{
  int v3 = os_feature_enabled_remove_clean_episode_title();
  uint64_t v4 = [(MTEpisode *)self itunesTitle];
  uint64_t v5 = v4;
  if (!v3)
  {
    if (!v4)
    {
      uint64_t v9 = [(MTEpisode *)self cleanedTitle];
      id v10 = v9;
      if (v9)
      {
        id v11 = v9;
      }
      else
      {
        id v11 = [(MTEpisode *)self title];
      }
      uint64_t v7 = v11;

      goto LABEL_7;
    }
    goto LABEL_5;
  }
  if (v4)
  {
LABEL_5:
    id v6 = v4;
    goto LABEL_6;
  }
  id v6 = [(MTEpisode *)self title];
LABEL_6:
  uint64_t v7 = v6;
LABEL_7:

  return v7;
}

+ (id)predicateForFeedDeleted:(BOOL)a3
{
  int v3 = (void *)MEMORY[0x1E4F28F60];
  uint64_t v4 = [MEMORY[0x1E4F28ED0] numberWithBool:a3];
  uint64_t v5 = [v3 predicateWithFormat:@"%K = %@", @"feedDeleted", v4];

  return v5;
}

+ (id)predicateForDownloadedFairPlayEpisodes
{
  float v2 = +[MTEpisode predicateForDownloaded:1 excludeHidden:1];
  int v3 = +[MTEpisode assetURLIsPackagedMedia];
  uint64_t v4 = [v2 AND:v3];

  return v4;
}

+ (id)assetURLIsPackagedMedia
{
  return (id)[MEMORY[0x1E4F28F60] predicateWithFormat:@"(%K ENDSWITH %@)", @"assetURL", @"movpkg"];
}

+ (id)predicateForExternalType:(BOOL)a3
{
  int v3 = (void *)MEMORY[0x1E4F28F60];
  uint64_t v4 = [MEMORY[0x1E4F28ED0] numberWithBool:a3];
  uint64_t v5 = [v3 predicateWithFormat:@"%K = %@", @"externalType", v4];

  return v5;
}

+ (id)predicateForPreviouslyPlayedHidingFutureTimestamps
{
  int v3 = [a1 predicateForPreviouslyPlayed];
  uint64_t v4 = [a1 predicateForHidingFuturePlayedTimestamps];
  uint64_t v5 = [v3 AND:v4];

  return v5;
}

+ (id)predicateForHidingFuturePlayedTimestamps
{
  float v2 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:2592000.0];
  int v3 = [MEMORY[0x1E4F28F60] predicateForDateKey:@"lastDatePlayed" isLessThanDate:v2];
  uint64_t v4 = [MEMORY[0x1E4F28F60] predicateForNilValueForKey:@"lastDatePlayed"];
  uint64_t v5 = [v3 OR:v4];

  return v5;
}

+ (id)predicateForListenNow
{
  int v3 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K = %@", @"listenNowEpisode", MEMORY[0x1E4F1CC38]];
  if (os_feature_enabled_unfollowed_shows_in_up_next()) {
    [a1 predicateForPodcastIsNotHidden];
  }
  else {
  uint64_t v4 = [a1 predicateForPodcastIsNotHiddenNotImplicitlyFollowed];
  }
  uint64_t v5 = [v3 AND:v4];

  return v5;
}

+ (id)predicateForPreviouslyPlayed
{
  int v3 = [a1 predicateForHasBeenPlayed];
  uint64_t v4 = [a1 predicateForPodcastIsNotHidden];
  uint64_t v5 = [v3 AND:v4];
  id v6 = [a1 predicateForPlayedDateSetByListening];
  uint64_t v7 = [v5 AND:v6];

  return v7;
}

+ (id)predicateForPodcastIsNotHidden
{
  return (id)objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"podcast.%K = 0", @"hidden");
}

+ (id)predicateForPlayedDateSetByListening
{
  int v3 = [a1 predicateForNotManuallyMarkedAsPlayed];
  uint64_t v4 = [a1 predicateForListenedAfterMarkedAsPlayed];
  uint64_t v5 = [v3 OR:v4];

  return v5;
}

+ (id)predicateForListenedAfterMarkedAsPlayed
{
  return (id)[MEMORY[0x1E4F28F60] predicateForDateKey:@"lastDatePlayed" isGreaterThanOrEqualToDateKey:@"lastUserMarkedAsPlayedDate"];
}

+ (id)predicateForNotManuallyMarkedAsPlayed
{
  return (id)objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == NULL", @"lastUserMarkedAsPlayedDate");
}

+ (id)predicateForHasBeenPlayed
{
  float v2 = (void *)MEMORY[0x1E4F28F60];
  int v3 = [MEMORY[0x1E4F1C9C8] distantPast];
  uint64_t v4 = [v2 predicateWithFormat:@"%K != NULL AND %K > %@", @"lastDatePlayed", @"lastDatePlayed", v3];

  return v4;
}

+ (id)sortDescriptorsForLastDatePlayedAscending:(BOOL)a3
{
  BOOL v3 = a3;
  v9[3] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"lastDatePlayed" ascending:a3];
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4F29008], "sortDescriptorWithKey:ascending:", @"episodeLevel", !v3, v4);
  v9[1] = v5;
  id v6 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"title" ascending:1 selector:sel_localizedStandardCompare_];
  v9[2] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:3];

  return v7;
}

+ (id)sortDescriptorsForListenNow
{
  v7[3] = *MEMORY[0x1E4F143B8];
  float v2 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"podcast.modifiedDate" ascending:0];
  BOOL v3 = objc_msgSend(MEMORY[0x1E4F29008], "sortDescriptorWithKey:ascending:", @"lastDatePlayed", 1, v2);
  v7[1] = v3;
  uint64_t v4 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"episodeLevel" ascending:1];
  v7[2] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:3];

  return v5;
}

+ (id)predicateForDownloadBehavior:(int64_t)a3
{
  uint64_t v4 = (void *)MEMORY[0x1E4F28B98];
  uint64_t v5 = [MEMORY[0x1E4F28C68] expressionForKeyPath:@"downloadBehavior"];
  id v6 = (void *)MEMORY[0x1E4F28C68];
  uint64_t v7 = [MEMORY[0x1E4F28ED0] numberWithLongLong:a3];
  BOOL v8 = [v6 expressionForConstantValue:v7];
  uint64_t v9 = [v4 predicateWithLeftExpression:v5 rightExpression:v8 modifier:0 type:4 options:0];

  return v9;
}

+ (id)predicateForVisuallyPlayed:(BOOL)a3
{
  if (a3)
  {
    uint64_t v4 = [a1 predicateForPlayed:1];
    uint64_t v5 = [a1 predicateForIsBackCatalogItem];
    id v6 = [v5 NOT];
    uint64_t v7 = [v4 AND:v6];
  }
  else
  {
    uint64_t v4 = objc_msgSend(a1, "predicateForPlayed:");
    uint64_t v5 = [a1 predicateForIsBackCatalogItem];
    uint64_t v7 = [v4 OR:v5];
  }

  return v7;
}

+ (id)predicateForIsBackCatalogItem
{
  v10[3] = *MEMORY[0x1E4F143B8];
  BOOL v3 = (void *)MEMORY[0x1E4F28BA0];
  uint64_t v4 = [a1 predicateForBacklog:1];
  uint64_t v5 = objc_msgSend(a1, "predicateForPlayed:", 1, v4);
  v10[1] = v5;
  id v6 = [a1 predicateForPlayStateManuallySet:1];
  v10[2] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:3];
  BOOL v8 = [v3 andPredicateWithSubpredicates:v7];

  return v8;
}

+ (id)predicateForPlayed:(BOOL)a3
{
  if (a3) {
    uint64_t v3 = 4;
  }
  else {
    uint64_t v3 = 5;
  }
  uint64_t v4 = (void *)MEMORY[0x1E4F28B98];
  uint64_t v5 = [MEMORY[0x1E4F28C68] expressionForKeyPath:@"playState"];
  id v6 = [MEMORY[0x1E4F28C68] expressionForConstantValue:&unk_1F03D88B0];
  uint64_t v7 = [v4 predicateWithLeftExpression:v5 rightExpression:v6 modifier:0 type:v3 options:0];

  return v7;
}

+ (id)predicateForBacklog:(BOOL)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F28F60];
  uint64_t v4 = [MEMORY[0x1E4F28ED0] numberWithBool:a3];
  uint64_t v5 = [v3 predicateWithFormat:@"%K = %@", @"backCatalog", v4];

  return v5;
}

+ (id)predicateForStationEligibleEpisodes
{
  uint64_t v3 = [a1 predicateForEntitledEpisodes];
  uint64_t v4 = [a1 predicateForSaved:1];
  uint64_t v5 = [a1 predicateForDownloaded:1 excludeHidden:1];
  id v6 = [v4 OR:v5];

  uint64_t v7 = [a1 predicateForPodcastIsSubscribed:1];
  BOOL v8 = [v7 OR:v6];

  uint64_t v9 = [v3 AND:v8];

  return v9;
}

+ (id)predicateForDownloaded:(BOOL)a3 excludeHidden:(BOOL)a4
{
  if (a3) {
    [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K != NULL AND %K > %@", a4, @"assetURL", @"assetURL", &stru_1F03A51F0];
  }
  else {
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K = NULL", a4, @"assetURL", v6, v7);
  }
  return v4;
}

+ (id)predicateForSaved:(BOOL)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F28F60];
  uint64_t v4 = [MEMORY[0x1E4F28ED0] numberWithBool:a3];
  uint64_t v5 = [v3 predicateWithFormat:@"%K = %@", @"saved", v4];

  return v5;
}

+ (id)predicateForPodcastIsSubscribed:(BOOL)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F28F60];
  uint64_t v4 = [MEMORY[0x1E4F28ED0] numberWithBool:a3];
  uint64_t v5 = [v3 predicateWithFormat:@"podcast.%K = %@", @"subscribed", v4];

  return v5;
}

+ (id)predicateForPlayStateManuallySet:(BOOL)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F28F60];
  uint64_t v4 = [MEMORY[0x1E4F28ED0] numberWithBool:a3];
  uint64_t v5 = [v3 predicateWithFormat:@"%K = %@", @"playStateManuallySet", v4];

  return v5;
}

+ (id)predicateForEntitledEpisodes
{
  return (id)[a1 _predicateForNotEntitlementState:2];
}

+ (id)_predicateForNotEntitlementState:(int64_t)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F28F60];
  uint64_t v4 = [MEMORY[0x1E4F28ED0] numberWithLongLong:a3];
  uint64_t v5 = [v3 predicateWithFormat:@"(%K != %@)", @"entitlementState", v4];

  return v5;
}

- (BOOL)isExplicit
{
  if ([(MTEpisode *)self explicit]) {
    return 1;
  }
  uint64_t v4 = [(MTEpisode *)self podcast];
  char v5 = [v4 isExplicit];

  return v5;
}

+ (id)predicateForEpisodeUuids:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F28F60];
  uint64_t v4 = [a3 allObjects];
  char v5 = [v3 predicateWithFormat:@"%K in %@", @"uuid", v4];

  return v5;
}

+ (id)episodicSortDescriptors:(int64_t)a3
{
  BOOL v4 = +[MTPodcast sortOrderAscForShowType:a3];
  return (id)[a1 sortDescriptorsForPubDateAscending:v4];
}

+ (id)sortDescriptorsForPubDateAscending:(BOOL)a3
{
  BOOL v3 = a3;
  void v10[4] = *MEMORY[0x1E4F143B8];
  BOOL v4 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"pubDate" ascending:a3];
  v10[0] = v4;
  char v5 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"episodeNumber" ascending:v3];
  v10[1] = v5;
  uint64_t v6 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"episodeLevel" ascending:v3 ^ 1];
  v10[2] = v6;
  uint64_t v7 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"title" ascending:1 selector:sel_localizedStandardCompare_];
  v10[3] = v7;
  BOOL v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:4];

  return v8;
}

+ (id)sortDescriptorsForFirstAvailableAscending:(BOOL)a3
{
  BOOL v3 = a3;
  void v10[4] = *MEMORY[0x1E4F143B8];
  BOOL v4 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"firstTimeAvailable" ascending:a3];
  v10[0] = v4;
  char v5 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"episodeNumber" ascending:v3];
  v10[1] = v5;
  uint64_t v6 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"episodeLevel" ascending:v3 ^ 1];
  v10[2] = v6;
  uint64_t v7 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"title" ascending:1 selector:sel_localizedStandardCompare_];
  v10[3] = v7;
  BOOL v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:4];

  return v8;
}

+ (id)sortDescriptorsForLastBookmarkedDateAscending:(BOOL)a3
{
  v7[2] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"lastBookmarkedDate" ascending:a3];
  v7[0] = v3;
  BOOL v4 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"title" ascending:1 selector:sel_localizedStandardCompare_];
  v7[1] = v4;
  char v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:2];

  return v5;
}

+ (id)sortDescriptorsForDownloadedDateAscending:(BOOL)a3
{
  v7[2] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"downloadDate" ascending:a3];
  v7[0] = v3;
  BOOL v4 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"title" ascending:1 selector:sel_localizedStandardCompare_];
  v7[1] = v4;
  char v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:2];

  return v5;
}

+ (id)sortDescriptorsForTitle
{
  void v7[3] = *MEMORY[0x1E4F143B8];
  float v2 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"title" ascending:1 selector:sel_localizedStandardCompare_];
  BOOL v3 = objc_msgSend(MEMORY[0x1E4F29008], "sortDescriptorWithKey:ascending:", @"lastDatePlayed", 1, v2);
  v7[1] = v3;
  BOOL v4 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"episodeLevel" ascending:1];
  v7[2] = v4;
  char v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:3];

  return v5;
}

+ (id)sortDescriptorsForUpNextScore
{
  v6[2] = *MEMORY[0x1E4F143B8];
  float v2 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"upNextScore" ascending:0];
  v6[0] = v2;
  BOOL v3 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"podcast.modifiedDate" ascending:0];
  v6[1] = v3;
  BOOL v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];

  return v4;
}

+ (id)sortDescriptorsForModifiedDateUpNextScore
{
  v5[1] = *MEMORY[0x1E4F143B8];
  float v2 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"modifiedDateScore" ascending:0];
  v5[0] = v2;
  BOOL v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

+ (id)sortDescriptorsForListenNowLatestEpisodes
{
  return (id)[a1 sortDescriptorsForPubDateAscending:0];
}

+ (id)sortDescriptorsForSeasonsWithOldestEpisodesFirst:(BOOL)a3
{
  BOOL v3 = a3;
  void v10[4] = *MEMORY[0x1E4F143B8];
  BOOL v4 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"seasonNumber" ascending:0];
  v10[0] = v4;
  char v5 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"pubDate" ascending:v3];
  v10[1] = v5;
  uint64_t v6 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"episodeNumber" ascending:v3];
  v10[2] = v6;
  uint64_t v7 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"episodeLevel" ascending:v3 ^ 1];
  v10[3] = v7;
  BOOL v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:4];

  return v8;
}

+ (id)seasonSortDescriptors:(int64_t)a3
{
  BOOL v5 = +[MTPodcast sortOrderAscForShowType:](MTPodcast, "sortOrderAscForShowType:");
  if (a3 == 4) {
    [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"seasonNumber" ascending:1 reverseNullOrder:1];
  }
  else {
  uint64_t v6 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"seasonNumber" ascending:0];
  }
  uint64_t v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v6, 0);
  BOOL v8 = [a1 sortDescriptorsForEpisodeNumberAscending:v5];
  [v7 addObjectsFromArray:v8];

  return v7;
}

+ (id)sortDescriptorsForSeasonAndEpisodeNumberAscending:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"seasonNumber" ascending:v3 reverseNullOrder:v3];
  uint64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v5, 0);
  uint64_t v7 = [a1 sortDescriptorsForEpisodeNumberAscending:v3];
  [v6 addObjectsFromArray:v7];

  return v6;
}

+ (id)sortDescriptorsForEpisodeNumberAscending:(BOOL)a3
{
  BOOL v3 = a3;
  void v10[4] = *MEMORY[0x1E4F143B8];
  BOOL v4 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"episodeNumber" ascending:v3 reverseNullOrder:v3];
  v10[0] = v4;
  BOOL v5 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"episodeType" ascending:0];
  v10[1] = v5;
  uint64_t v6 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"pubDate" ascending:v3];
  v10[2] = v6;
  uint64_t v7 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"title" ascending:1 selector:sel_localizedStandardCompare_];
  v10[3] = v7;
  BOOL v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:4];

  return v8;
}

+ (id)sortDescriptorsForCalculatingEpisodeLevel
{
  void v7[3] = *MEMORY[0x1E4F143B8];
  float v2 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"pubDate" ascending:0];
  BOOL v3 = objc_msgSend(MEMORY[0x1E4F29008], "sortDescriptorWithKey:ascending:", @"episodeNumber", 0, v2);
  v7[1] = v3;
  BOOL v4 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"title" ascending:1 selector:sel_localizedStandardCompare_];
  v7[2] = v4;
  BOOL v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:3];

  return v5;
}

+ (id)propertyPathForPodcastProperty:(id)a3
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v8[0] = @"podcast";
  v8[1] = a3;
  BOOL v3 = (void *)MEMORY[0x1E4F1C978];
  id v4 = a3;
  BOOL v5 = [v3 arrayWithObjects:v8 count:2];

  uint64_t v6 = [v5 componentsJoinedByString:@"."];

  return v6;
}

- (void)setPersistentID:(int64_t)a3
{
  if ([(MTEpisode *)self persistentID] != a3)
  {
    [(MTEpisode *)self willChangeValueForKey:@"persistentID"];
    BOOL v5 = [MEMORY[0x1E4F28ED0] numberWithLongLong:a3];
    [(MTEpisode *)self setPrimitiveValue:v5 forKey:@"persistentID"];

    [(MTEpisode *)self didChangeValueForKey:@"persistentID"];
    if (objc_opt_respondsToSelector())
    {
      [(MTEpisode *)self didChangePersistentID];
    }
  }
}

- (void)setPodcast:(id)a3
{
  id v5 = a3;
  [(MTEpisode *)self willChangeValueForKey:@"podcast"];
  [(MTEpisode *)self setPrimitiveValue:v5 forKey:@"podcast"];
  [(MTEpisode *)self didChangeValueForKey:@"podcast"];
  id v4 = [v5 uuid];
  [(MTEpisode *)self setPodcastUuid:v4];

  if (([v5 currentEpisodeLimitAllowsAutomaticDownloads] & 1) == 0) {
    [(MTEpisode *)self suppressAutomaticDownloadsIfNeeded];
  }
  if (([v5 notifications] & 1) == 0) {
    [(MTEpisode *)self setSentNotification:1];
  }
}

- (void)setFeedDeleted:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(MTEpisode *)self feedDeleted] != a3)
  {
    [(MTEpisode *)self willChangeValueForKey:@"feedDeleted"];
    id v5 = [MEMORY[0x1E4F28ED0] numberWithBool:v3];
    [(MTEpisode *)self setPrimitiveValue:v5 forKey:@"feedDeleted"];

    [(MTEpisode *)self didChangeValueForKey:@"feedDeleted"];
  }
}

- (void)setImportDate:(double)a3
{
  id v5 = +[FutureDateChecker lenientSharedInstance];
  [v5 timestampBoundByNow:a3];
  double v7 = v6;

  [(MTEpisode *)self importDate];
  if (v8 != v7)
  {
    [(MTEpisode *)self willChangeValueForKey:@"importDate"];
    uint64_t v9 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:v7];
    [(MTEpisode *)self setPrimitiveValue:v9 forKey:@"importDate"];

    [(MTEpisode *)self didChangeValueForKey:@"importDate"];
  }
}

- (void)setCleanedTitle:(id)a3
{
  unint64_t v8 = (unint64_t)a3;
  uint64_t v4 = [(MTEpisode *)self cleanedTitle];
  unint64_t v5 = v8 | v4;

  if (v5)
  {
    double v6 = [(MTEpisode *)self cleanedTitle];
    char v7 = [v6 isEqualToString:v8];

    if ((v7 & 1) == 0)
    {
      [(MTEpisode *)self willChangeValueForKey:@"cleanedTitle"];
      [(MTEpisode *)self setPrimitiveValue:v8 forKey:@"cleanedTitle"];
      [(MTEpisode *)self didChangeValueForKey:@"cleanedTitle"];
    }
  }
}

- (void)setByteSize:(int64_t)a3
{
  if ([(MTEpisode *)self byteSize] != a3)
  {
    [(MTEpisode *)self willChangeValueForKey:@"byteSize"];
    unint64_t v5 = [MEMORY[0x1E4F28ED0] numberWithLongLong:a3];
    [(MTEpisode *)self setPrimitiveValue:v5 forKey:@"byteSize"];

    [(MTEpisode *)self didChangeValueForKey:@"byteSize"];
  }
}

- (void)setEnclosureURL:(id)a3
{
  unint64_t v8 = (unint64_t)a3;
  uint64_t v4 = [(MTEpisode *)self enclosureURL];
  unint64_t v5 = v8 | v4;

  if (v5)
  {
    double v6 = [(MTEpisode *)self enclosureURL];
    char v7 = [v6 isEqualToString:v8];

    if ((v7 & 1) == 0)
    {
      [(MTEpisode *)self willChangeValueForKey:@"enclosureURL"];
      [(MTEpisode *)self setPrimitiveValue:v8 forKey:@"enclosureURL"];
      [(MTEpisode *)self didChangeValueForKey:@"enclosureURL"];
    }
  }
}

- (void)setPodcastUuid:(id)a3
{
  id v4 = a3;
  if (!v4 && ([(MTEpisode *)self isDeleted] & 1) == 0)
  {
    unint64_t v5 = _MTLogCategoryDatabase();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      -[MTEpisode(Core) setPodcastUuid:](self, v5);
    }
  }
  [(MTEpisode *)self willChangeValueForKey:@"podcastUuid"];
  [(MTEpisode *)self setPrimitiveValue:v4 forKey:@"podcastUuid"];
  [(MTEpisode *)self didChangeValueForKey:@"podcastUuid"];
}

- (void)setExplicit:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(MTEpisode *)self explicit] != a3)
  {
    [(MTEpisode *)self willChangeValueForKey:@"explicit"];
    unint64_t v5 = [MEMORY[0x1E4F28ED0] numberWithBool:v3];
    [(MTEpisode *)self setPrimitiveValue:v5 forKey:@"explicit"];

    [(MTEpisode *)self didChangeValueForKey:@"explicit"];
  }
}

- (void)setEpisodeLevel:(int64_t)a3
{
  if ([(MTEpisode *)self episodeLevel] != a3)
  {
    [(MTEpisode *)self willChangeValueForKey:@"episodeLevel"];
    unint64_t v5 = [MEMORY[0x1E4F28ED0] numberWithLongLong:a3];
    [(MTEpisode *)self setPrimitiveValue:v5 forKey:@"episodeLevel"];

    [(MTEpisode *)self didChangeValueForKey:@"episodeLevel"];
  }
}

- (void)setIsNew:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(MTEpisode *)self isNew] != a3)
  {
    [(MTEpisode *)self willChangeValueForKey:@"isNew"];
    unint64_t v5 = [MEMORY[0x1E4F28ED0] numberWithBool:v3];
    [(MTEpisode *)self setPrimitiveValue:v5 forKey:@"isNew"];

    [(MTEpisode *)self didChangeValueForKey:@"isNew"];
  }
}

- (void)setItunesTitle:(id)a3
{
  unint64_t v8 = (unint64_t)a3;
  uint64_t v4 = [(MTEpisode *)self itunesTitle];
  unint64_t v5 = v8 | v4;

  if (v5)
  {
    double v6 = [(MTEpisode *)self itunesTitle];
    char v7 = [v6 isEqualToString:v8];

    if ((v7 & 1) == 0)
    {
      [(MTEpisode *)self willChangeValueForKey:@"itunesTitle"];
      [(MTEpisode *)self setPrimitiveValue:v8 forKey:@"itunesTitle"];
      [(MTEpisode *)self didChangeValueForKey:@"itunesTitle"];
    }
  }
}

- (void)setEpisodeType:(id)a3
{
  unint64_t v8 = (unint64_t)a3;
  uint64_t v4 = [(MTEpisode *)self episodeType];
  unint64_t v5 = v8 | v4;

  if (v5)
  {
    double v6 = [(MTEpisode *)self episodeType];
    char v7 = [v6 isEqualToString:v8];

    if ((v7 & 1) == 0)
    {
      [(MTEpisode *)self willChangeValueForKey:@"episodeType"];
      [(MTEpisode *)self setPrimitiveValue:v8 forKey:@"episodeType"];
      [(MTEpisode *)self didChangeValueForKey:@"episodeType"];
    }
  }
}

- (void)setWebpageURL:(id)a3
{
  unint64_t v8 = (unint64_t)a3;
  uint64_t v4 = [(MTEpisode *)self webpageURL];
  unint64_t v5 = v8 | v4;

  if (v5)
  {
    double v6 = [(MTEpisode *)self webpageURL];
    char v7 = [v6 isEqualToString:v8];

    if ((v7 & 1) == 0)
    {
      [(MTEpisode *)self willChangeValueForKey:@"webpageURL"];
      [(MTEpisode *)self setPrimitiveValue:v8 forKey:@"webpageURL"];
      [(MTEpisode *)self didChangeValueForKey:@"webpageURL"];
    }
  }
}

- (void)setEpisodeNumber:(int64_t)a3
{
  unint64_t v5 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithLongLong:");
  if (a3)
  {
    id v7 = v5;
  }
  else
  {

    id v7 = 0;
  }
  id v6 = [(MTEpisode *)self primitiveValueForKey:@"episodeNumber"];
  if (v7 != v6 && ([v7 isEqual:v6] & 1) == 0)
  {
    [(MTEpisode *)self willChangeValueForKey:@"episodeNumber"];
    [(MTEpisode *)self setPrimitiveValue:v7 forKey:@"episodeNumber"];
    [(MTEpisode *)self didChangeValueForKey:@"episodeNumber"];
  }
}

- (void)setSeasonNumber:(int64_t)a3
{
  if ([(MTEpisode *)self seasonNumber] != a3)
  {
    if (a3)
    {
      id v5 = [MEMORY[0x1E4F28ED0] numberWithLongLong:a3];
    }
    else
    {
      id v5 = 0;
    }
    [(MTEpisode *)self willChangeValueForKey:@"seasonNumber"];
    [(MTEpisode *)self setPrimitiveValue:v5 forKey:@"seasonNumber"];
    [(MTEpisode *)self didChangeValueForKey:@"seasonNumber"];
  }
}

- (void)setDuration:(double)a3
{
  [(MTEpisode *)self duration];
  if (vabdd_f64(v5, a3) > 2.22044605e-16)
  {
    [(MTEpisode *)self willChangeValueForKey:@"duration"];
    id v6 = [MEMORY[0x1E4F28ED0] numberWithDouble:a3];
    [(MTEpisode *)self setPrimitiveValue:v6 forKey:@"duration"];

    [(MTEpisode *)self didChangeValueForKey:@"duration"];
  }
}

- (void)setEntitledDuration:(double)a3
{
  [(MTEpisode *)self entitledDuration];
  if (vabdd_f64(v5, a3) > 2.22044605e-16)
  {
    [(MTEpisode *)self willChangeValueForKey:@"entitledDuration"];
    id v6 = [MEMORY[0x1E4F28ED0] numberWithDouble:a3];
    [(MTEpisode *)self setPrimitiveValue:v6 forKey:@"entitledDuration"];

    [(MTEpisode *)self didChangeValueForKey:@"entitledDuration"];
  }
}

- (void)setFreeDuration:(double)a3
{
  [(MTEpisode *)self freeDuration];
  if (vabdd_f64(v5, a3) > 2.22044605e-16)
  {
    [(MTEpisode *)self willChangeValueForKey:@"freeDuration"];
    id v6 = [MEMORY[0x1E4F28ED0] numberWithDouble:a3];
    [(MTEpisode *)self setPrimitiveValue:v6 forKey:@"freeDuration"];

    [(MTEpisode *)self didChangeValueForKey:@"freeDuration"];
  }
}

- (void)setTrackNum:(int64_t)a3
{
  if ([(MTEpisode *)self trackNum] != a3)
  {
    [(MTEpisode *)self willChangeValueForKey:@"trackNum"];
    double v5 = [MEMORY[0x1E4F28ED0] numberWithLongLong:a3];
    [(MTEpisode *)self setPrimitiveValue:v5 forKey:@"trackNum"];

    [(MTEpisode *)self didChangeValueForKey:@"trackNum"];
  }
}

- (void)setPubDate:(double)a3
{
  [(MTEpisode *)self pubDate];
  if (vabdd_f64(v5, a3) > 2.22044605e-16)
  {
    [(MTEpisode *)self willChangeValueForKey:@"pubDate"];
    id v6 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:a3];
    [(MTEpisode *)self setPrimitiveValue:v6 forKey:@"pubDate"];

    [(MTEpisode *)self didChangeValueForKey:@"pubDate"];
  }
}

+ (id)propertiesToFetchBestTitle
{
  v4[3] = *MEMORY[0x1E4F143B8];
  v4[0] = @"itunesTitle";
  v4[1] = @"cleanedTitle";
  v4[2] = @"title";
  float v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:3];
  return v2;
}

+ (id)propertiesToFetchIsPlayed
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = @"playState";
  float v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  return v2;
}

+ (id)propertiesToFetchIsPartiallyPlayed
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = @"playState";
  float v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  return v2;
}

- (BOOL)isUnplayed
{
  return [(MTEpisode *)self playState] == 2;
}

+ (id)propertiesToFetchIsVisuallyPlayed
{
  BOOL v3 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v4 = [a1 propertiesToFetchIsBackCatalogItem];
  [v3 addObjectsFromArray:v4];

  double v5 = [a1 propertiesToFetchIsPlayed];
  [v3 addObjectsFromArray:v5];

  id v6 = (void *)[v3 copy];
  return v6;
}

+ (id)propertiesToFetchIsBackCatalogItem
{
  v4[3] = *MEMORY[0x1E4F143B8];
  v4[0] = @"playState";
  v4[1] = @"playStateManuallySet";
  void v4[2] = @"backCatalog";
  float v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:3];
  return v2;
}

+ (id)propertiesToFetchIsPartiallyPlayedBackCatalogItem
{
  BOOL v3 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v4 = [a1 propertiesToFetchIsBackCatalogItem];
  [v3 addObjectsFromArray:v4];

  double v5 = [a1 propertiesToFetchIsPlayheadPartiallyPlayed];
  [v3 addObjectsFromArray:v5];

  id v6 = (void *)[v3 copy];
  return v6;
}

+ (id)propertiesToFetchPlaybackProgress
{
  void v4[2] = *MEMORY[0x1E4F143B8];
  v4[0] = @"duration";
  v4[1] = @"playhead";
  float v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:2];
  return v2;
}

- (double)playbackProgress
{
  [(MTEpisode *)self duration];
  double v4 = v3;
  double result = 0.0;
  if (v4 != 0.0)
  {
    [(MTEpisode *)self playhead];
    double v7 = v6;
    [(MTEpisode *)self duration];
    return v7 / v8;
  }
  return result;
}

- (double)playbackProgressSanitized
{
  uint64_t v3 = [(MTEpisode *)self playState];
  if (!v3) {
    return 1.0;
  }
  if (v3 == 2) {
    return 0.0;
  }
  if (v3 != 1) {
    return -1.0;
  }
  [(MTEpisode *)self duration];
  double v5 = v4;
  [(MTEpisode *)self playhead];
  double v7 = v6;
  double result = 0.5;
  if (v5 > v7)
  {
    [(MTEpisode *)self playhead];
    double v10 = v9;
    [(MTEpisode *)self duration];
    float v12 = v10 / v11;
    BOOL v13 = v12 > 1.0 || v12 < 0.0;
    double result = v12;
    if (v13) {
      return 0.5;
    }
  }
  return result;
}

+ (id)propertiesToFetchTimeRemaining
{
  void v4[2] = *MEMORY[0x1E4F143B8];
  v4[0] = @"duration";
  v4[1] = @"playhead";
  float v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:2];
  return v2;
}

- (double)timeRemaining
{
  [(MTEpisode *)self duration];
  double v4 = v3;
  [(MTEpisode *)self playhead];
  return v4 - v5;
}

- (double)endOfTrack
{
  [(MTEpisode *)self duration];
  +[MTEpisode endOfTrackForDuration:](MTEpisode, "endOfTrackForDuration:");
  return result;
}

- (BOOL)isPlayheadResumable
{
  [(MTEpisode *)self playhead];
  double v4 = v3;
  [(MTEpisode *)self duration];
  return +[MTEpisode isPlayhead:v4 resumableForDuration:v5];
}

+ (id)propertiesToFetchIsPlayheadPartiallyPlayed
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = @"playhead";
  float v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  return v2;
}

+ (id)propertiesToFetchAssetURL
{
  void v4[2] = *MEMORY[0x1E4F143B8];
  v4[0] = @"securityScopedAssetData";
  v4[1] = @"assetURL";
  float v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:2];
  return v2;
}

- (void)_setAssetUrl:(id)a3
{
  id v4 = a3;
  [(MTEpisode *)self willChangeValueForKey:@"assetURL"];
  [(MTEpisode *)self setPrimitiveValue:v4 forKey:@"assetURL"];

  [(MTEpisode *)self didChangeValueForKey:@"assetURL"];
}

- (id)bestUrl
{
  float v3 = [(MTEpisode *)self assetURL];

  if (!v3 || ([(MTEpisode *)self assetURL], (id v4 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    id v4 = [(MTEpisode *)self enclosureURL];
  }
  double v5 = [MEMORY[0x1E4F1CB10] URLWithString:v4];

  return v5;
}

+ (double)endOfTrackForDuration:(double)a3
{
  if (a3 <= 360.0) {
    return a3 * 0.9;
  }
  else {
    return a3 + -240.0;
  }
}

+ (BOOL)isPlayhead:(double)a3 resumableForDuration:(double)a4
{
  if (a3 < 0.100000001) {
    return 0;
  }
  +[MTEpisode endOfTrackForDuration:a4];
  return v6 > a3;
}

+ (id)propertiesToFetchIsExplicit
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = @"explicit";
  float v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  return v2;
}

+ (id)relationshipKeyPathsForPrefetchingIsExplicit
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v6[0] = @"podcast";
  v6[1] = @"flags";
  float v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];
  float v3 = [v2 componentsJoinedByString:@"."];
  v7[0] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];

  return v4;
}

- (BOOL)isShareable
{
  if ([(MTEpisode *)self isExternalType]) {
    return 0;
  }
  id v4 = [(MTEpisode *)self podcast];
  char v5 = [v4 isShareable];

  return v5;
}

- (void)suppressAutomaticDownloadsIfNeeded
{
  if (![(MTEpisode *)self downloadBehavior])
  {
    [(MTEpisode *)self setDownloadBehavior:1];
  }
}

- (void)unsuppressAutomaticDownloadsIfNeeded
{
  if ([(MTEpisode *)self downloadBehavior] == 1)
  {
    [(MTEpisode *)self setDownloadBehavior:0];
  }
}

- (BOOL)hasNonZeroSeasonNumber
{
  return [(MTEpisode *)self seasonNumber] > 0;
}

- (id)transcriptSnippet
{
  float v3 = [(MTEpisode *)self podcast];
  id v4 = [v3 channel];
  int v5 = [v4 subscriptionActive];

  if (v5) {
    [(MTEpisode *)self entitledTranscriptSnippet];
  }
  else {
  double v6 = [(MTEpisode *)self freeTranscriptSnippet];
  }
  return v6;
}

- (id)transcriptProvider
{
  float v3 = [(MTEpisode *)self podcast];
  id v4 = [v3 channel];
  int v5 = [v4 subscriptionActive];

  if (v5) {
    [(MTEpisode *)self entitledTranscriptProvider];
  }
  else {
  double v6 = [(MTEpisode *)self freeTranscriptProvider];
  }
  return v6;
}

- (int64_t)parsePriceType
{
  float v2 = [(MTEpisode *)self priceType];
  int64_t v3 = MTEpisodePriceTypeFromPersistentString(v2);

  return v3;
}

- (BOOL)isEntitled
{
  return [(MTEpisode *)self entitlementState] != 2;
}

- (int64_t)_resolvedEntitlementState
{
  int64_t v3 = +[MTEpisode predicateForDerivedEntitlementStateFree];
  char v4 = [v3 evaluateWithObject:self];

  if (v4) {
    return 0;
  }
  double v6 = +[MTEpisode predicateForDerivedEntitlementStateEntitled];
  char v7 = [v6 evaluateWithObject:self];

  if (v7) {
    return 1;
  }
  double v8 = +[MTEpisode predicateForDerivedEntitlementStateUnentitled];
  int v9 = [v8 evaluateWithObject:self];

  if (v9) {
    return 2;
  }
  else {
    return 0;
  }
}

- (void)updateEntitlementState
{
  int64_t v3 = [(MTEpisode *)self _resolvedEntitlementState];
  [(MTEpisode *)self setEntitlementState:v3];
}

- (id)playURL
{
  int64_t v3 = NSString;
  uint64_t v4 = [(MTEpisode *)self podcastUuid];
  int v5 = (void *)v4;
  if (v4) {
    double v6 = (__CFString *)v4;
  }
  else {
    double v6 = @"null";
  }
  uint64_t v7 = [(MTEpisode *)self uuid];
  double v8 = (void *)v7;
  if (v7) {
    int v9 = (__CFString *)v7;
  }
  else {
    int v9 = @"null";
  }
  double v10 = [v3 stringWithFormat:@"podcasts://play?podcastUuid=%@&episodeUuid=%@", v6, v9];

  double v11 = [MEMORY[0x1E4F1CB10] URLWithString:v10];

  return v11;
}

- (id)displayURL
{
  int64_t v3 = NSString;
  uint64_t v4 = [(MTEpisode *)self podcastUuid];
  int v5 = (void *)v4;
  if (v4) {
    double v6 = (__CFString *)v4;
  }
  else {
    double v6 = @"null";
  }
  uint64_t v7 = [(MTEpisode *)self uuid];
  double v8 = (void *)v7;
  if (v7) {
    int v9 = (__CFString *)v7;
  }
  else {
    int v9 = @"null";
  }
  double v10 = [v3 stringWithFormat:@"podcasts://show?podcastUuid=%@&episodeUuid=%@", v6, v9];

  double v11 = [MEMORY[0x1E4F1CB10] URLWithString:v10];

  return v11;
}

- (BOOL)isMedia
{
  if ([(MTEpisode *)self isAudio]) {
    return 1;
  }
  return [(MTEpisode *)self isVideo];
}

- (BOOL)isTopLevel
{
  return [(MTEpisode *)self flags] & 1;
}

- (void)setIsTopLevel:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(MTEpisode *)self flags];
  if (((((v5 & 1) == 0) ^ v3) & 1) == 0)
  {
    [(MTEpisode *)self setFlags:v5 & 0xFFFFFFFFFFFFFFFELL | v3];
  }
}

+ (id)propertiesToObserveForDownloadableEpisodes
{
  v6[18] = *MEMORY[0x1E4F143B8];
  float v2 = (void *)MEMORY[0x1E4F1CAD0];
  v6[0] = @"uuid";
  v6[1] = @"podcastUuid";
  void v6[2] = @"pubDate";
  void v6[3] = @"flags";
  v6[4] = @"explicit";
  v6[5] = @"backCatalog";
  v6[6] = @"playState";
  v6[7] = @"userEpisode";
  v6[8] = @"listenNowEpisode";
  v6[9] = @"episodeNumber";
  v6[10] = @"seasonNumber";
  v6[11] = @"entitlementState";
  v6[12] = @"isHidden";
  v6[13] = @"isBookmarked";
  v6[14] = @"lastDatePlayed";
  v6[15] = @"episodeLevel";
  v6[16] = @"episodeShowTypeSpecificLevel";
  v6[17] = @"lastBookmarkedDate";
  BOOL v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:18];
  uint64_t v4 = [v2 setWithArray:v3];

  return v4;
}

+ (id)friendlyPubDateStringForEpisode:(id)a3
{
  return (id)[a1 friendlyPubDateStringForEpisode:a3 abbreviated:0];
}

+ (id)friendlyPubDateStringForEpisode:(id)a3 abbreviated:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = [a3 valueForKey:@"pubDate"];
  [v5 timeIntervalSinceReferenceDate];
  if (v6 == 0.0)
  {

    uint64_t v5 = 0;
  }
  else if (v5)
  {
    if (v4) {
      [v5 abbreviatedFriendlyDisplayString];
    }
    else {
    uint64_t v7 = [v5 friendlyDisplayString];
    }
    goto LABEL_9;
  }
  uint64_t v7 = 0;
LABEL_9:

  return v7;
}

+ (id)timeRemainingStringForEpisode:(id)a3
{
  return (id)[a1 timeRemainingStringForEpisode:a3 abbreviated:0];
}

+ (id)timeRemainingStringForEpisode:(id)a3 abbreviated:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  uint64_t v16 = 0;
  v17 = (double *)&v16;
  uint64_t v18 = 0x2020000000;
  uint64_t v19 = 0;
  double v6 = [v5 managedObjectContext];
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  float v12 = __64__MTEpisode_Library__timeRemainingStringForEpisode_abbreviated___block_invoke;
  BOOL v13 = &unk_1E5E61CF8;
  int v15 = &v16;
  id v7 = v5;
  id v14 = v7;
  [v6 performBlockAndWait:&v10];

  if (v17[3] <= 0.0)
  {
    double v8 = 0;
  }
  else
  {
    double v8 = objc_msgSend(NSString, "prettyShortStringWithDuration:includeTimeRemainingPhrase:abbreviated:", 1, v4, v10, v11, v12, v13);
  }

  _Block_object_dispose(&v16, 8);
  return v8;
}

uint64_t __64__MTEpisode_Library__timeRemainingStringForEpisode_abbreviated___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) timeRemaining];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

+ (BOOL)exists:(id)a3
{
  id v3 = a3;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  BOOL v4 = +[MTDB sharedInstance];
  id v5 = [v4 mainOrPrivateContext];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __29__MTEpisode_Library__exists___block_invoke;
  v9[3] = &unk_1E5E61780;
  id v6 = v5;
  id v10 = v6;
  id v7 = v3;
  id v11 = v7;
  float v12 = &v13;
  [v6 performBlockAndWait:v9];
  LOBYTE(v4) = *((unsigned char *)v14 + 24);

  _Block_object_dispose(&v13, 8);
  return (char)v4;
}

void __29__MTEpisode_Library__exists___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) episodeForUuid:*(void *)(a1 + 40)];
  float v2 = [v3 podcast];
  if (v3 && ([v2 hidden] & 1) == 0) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
}

+ (BOOL)isExternalMedia:(id)a3
{
  id v3 = a3;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  BOOL v4 = +[MTDB sharedInstance];
  id v5 = [v4 mainOrPrivateContext];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __38__MTEpisode_Library__isExternalMedia___block_invoke;
  v9[3] = &unk_1E5E61780;
  id v6 = v5;
  id v10 = v6;
  id v7 = v3;
  id v11 = v7;
  float v12 = &v13;
  [v6 performBlockAndWait:v9];
  LOBYTE(v4) = *((unsigned char *)v14 + 24);

  _Block_object_dispose(&v13, 8);
  return (char)v4;
}

void __38__MTEpisode_Library__isExternalMedia___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) episodeForUuid:*(void *)(a1 + 40)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v2 isExternalType];
}

- (void)setMetadataIdentifier:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = _MTLogCategoryDefault();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(MTEpisode *)self metadataIdentifier];
    id v7 = [(MTEpisode *)self podcast];
    double v8 = [v7 feedURL];
    int v9 = [(MTEpisode *)self podcast];
    id v10 = [v9 updatedFeedURL];
    id v11 = [(MTEpisode *)self guid];
    int v12 = 138544386;
    uint64_t v13 = v6;
    __int16 v14 = 2114;
    id v15 = v4;
    __int16 v16 = 2114;
    v17 = v8;
    __int16 v18 = 2114;
    uint64_t v19 = v10;
    __int16 v20 = 2114;
    v21 = v11;
    _os_log_impl(&dword_1AC9D5000, v5, OS_LOG_TYPE_DEFAULT, "Setting metadataIdentifier from %{public}@ to %{public}@, for feedUrl: %{public}@ updatedFeedUrl %{public}@, guid: %{public}@", (uint8_t *)&v12, 0x34u);
  }
  [(MTEpisode *)self willChangeValueForKey:@"metadataIdentifier"];
  [(MTEpisode *)self setPrimitiveValue:v4 forKey:@"metadataIdentifier"];
  [(MTEpisode *)self didChangeValueForKey:@"metadataIdentifier"];
}

- (BOOL)isRestricted
{
  if (+[PFRestrictionsController isExplicitContentAllowed])
  {
    return 0;
  }
  return [(MTEpisode *)self isExplicit];
}

- (BOOL)isInPodcastDetailsUnplayedTab
{
  id v2 = self;
  id v3 = [(MTEpisode *)self podcastUuid];
  id v4 = [(MTEpisode *)v2 podcast];
  id v5 = +[MTEpisode predicateForEpisodesOnUnplayedTabOnPodcastUuid:deletePlayedEpisodes:](MTEpisode, "predicateForEpisodesOnUnplayedTabOnPodcastUuid:deletePlayedEpisodes:", v3, [v4 deletePlayedEpisodesResolvedValue]);
  LOBYTE(v2) = [v5 evaluateWithObject:v2];

  return (char)v2;
}

- (void)setItunesSubtitle:(id)a3
{
  id v4 = a3;
  id v10 = v4;
  if (v4
    || ([(MTEpisode *)self itunesSubtitle],
        id v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        id v4 = 0,
        v5))
  {
    if ([v4 hasHTML])
    {
      uint64_t v6 = [v10 stringBySmartlyStrippingHTML];

      id v10 = (id)v6;
    }
    id v7 = [(MTEpisode *)self itunesSubtitle];
    char v8 = [v10 isEqualToString:v7];

    if ((v8 & 1) == 0)
    {
      [(MTEpisode *)self willChangeValueForKey:@"itunesSubtitle"];
      [(MTEpisode *)self setPrimitiveValue:v10 forKey:@"itunesSubtitle"];
      [(MTEpisode *)self didChangeValueForKey:@"itunesSubtitle"];
    }
    int v9 = v10;
  }
  else
  {
    int v9 = 0;
  }
}

- (void)setItemDescription:(id)a3
{
  id v12 = a3;
  if (v12
    || ([(MTEpisode *)self itemDescription], (id v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v5 = [(MTEpisode *)self itemDescription];
    char v6 = [v12 isEqualToString:v5];

    if (v12)
    {
      if (v6) {
        goto LABEL_11;
      }
    }
    else
    {

      if (v6) {
        goto LABEL_11;
      }
    }
    [(MTEpisode *)self willChangeValueForKey:@"itemDescription"];
    [(MTEpisode *)self setPrimitiveValue:v12 forKey:@"itemDescription"];
    id v7 = (void *)MEMORY[0x1AD11A870]([(MTEpisode *)self didChangeValueForKey:@"itemDescription"]);
    uint64_t v8 = [v12 hasHTML];
    [(MTEpisode *)self willChangeValueForKey:@"itemDescriptionHasHTML"];
    int v9 = [MEMORY[0x1E4F28ED0] numberWithBool:v8];
    [(MTEpisode *)self setPrimitiveValue:v9 forKey:@"itemDescriptionHasHTML"];

    id v10 = (void *)MEMORY[0x1AD11A870]([(MTEpisode *)self didChangeValueForKey:@"itemDescriptionHasHTML"]);
    if (v8)
    {
      id v11 = [v12 stringBySmartlyStrippingHTML];
    }
    else
    {
      id v11 = 0;
    }
    [(MTEpisode *)self willChangeValueForKey:@"itemDescriptionWithoutHTML"];
    [(MTEpisode *)self setPrimitiveValue:v11 forKey:@"itemDescriptionWithoutHTML"];
    [(MTEpisode *)self didChangeValueForKey:@"itemDescriptionWithoutHTML"];

    [(MTEpisode *)self setAttributedDescriptionFromHTML:0];
  }
LABEL_11:
}

- (id)playedText
{
  if ([(MTEpisode *)self isVisuallyPlayed])
  {
    id v3 = [(MTEpisode *)self valueForKey:@"lastDatePlayed"];
    id v4 = v3;
    if (v3)
    {
      id v5 = [v3 verboseDisplayStringWithoutTime];
      char v6 = [MEMORY[0x1E4F28B50] podcastsFoundationBundle];
      id v7 = [v6 localizedStringForKey:@"EPISODE_LAST_PLAYED_ON_DATE_FORMAT" value:&stru_1F03A51F0 table:0];

      uint64_t v8 = [NSString stringWithValidatedFormat:v7, @"%@", 0, v5 validFormatSpecifiers error];
    }
    else
    {
      id v5 = [MEMORY[0x1E4F28B50] podcastsFoundationBundle];
      uint64_t v8 = [v5 localizedStringForKey:@"EPISODE_PLAYED_TITLE" value:&stru_1F03A51F0 table:0];
    }
  }
  else
  {
    uint64_t v8 = 0;
  }
  return v8;
}

- (id)playedTextForCarplay
{
  if (![(MTEpisode *)self isVisuallyPlayed])
  {
    id v10 = 0;
    goto LABEL_13;
  }
  id v3 = [(MTEpisode *)self valueForKey:@"lastDatePlayed"];
  id v4 = [v3 friendlyDisplayString];
  if ([v4 length])
  {
    id v5 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    int v6 = [v5 isDateInToday:v3];

    if (!v6)
    {
      int v12 = [v3 isLessThanWeekOld];
      uint64_t v13 = [MEMORY[0x1E4F28B50] podcastsFoundationBundle];
      __int16 v14 = v13;
      if (v12) {
        id v15 = @"EPISODE_PLAYED_ON_DAY_FORMAT";
      }
      else {
        id v15 = @"EPISODE_PLAYED_ON_DATE_FORMAT";
      }
      uint64_t v8 = [v13 localizedStringForKey:v15 value:&stru_1F03A51F0 table:0];

      uint64_t v11 = [NSString stringWithValidatedFormat:v8, @"%@", 0, v4 validFormatSpecifiers error];
      goto LABEL_12;
    }
    id v7 = [MEMORY[0x1E4F28B50] podcastsFoundationBundle];
    uint64_t v8 = v7;
    int v9 = @"EPISODE_PLAYED_TODAY";
  }
  else
  {
    id v7 = [MEMORY[0x1E4F28B50] podcastsFoundationBundle];
    uint64_t v8 = v7;
    int v9 = @"EPISODE_PLAYED_TITLE";
  }
  uint64_t v11 = [v7 localizedStringForKey:v9 value:&stru_1F03A51F0 table:0];
LABEL_12:
  id v10 = (void *)v11;

LABEL_13:
  return v10;
}

- (void)setUti:(id)a3
{
  uint64_t v11 = +[MTUTIUtil convertUti:a3];
  uint64_t v4 = [(MTEpisode *)self uti];
  if (v4 | v11)
  {
    id v5 = (void *)v4;
    int v6 = [(MTEpisode *)self uti];
    char v7 = [v6 isEqualToString:v11];

    if ((v7 & 1) == 0)
    {
      [(MTEpisode *)self willChangeValueForKey:@"uti"];
      [(MTEpisode *)self setPrimitiveValue:v11 forKey:@"uti"];
      [(MTEpisode *)self didChangeValueForKey:@"uti"];
    }
  }
  BOOL v8 = +[MTUTIUtil isAudio:](MTUTIUtil, "isAudio:");
  if (v8 != [(MTEpisode *)self isAudio]) {
    [(MTEpisode *)self setAudio:v8];
  }
  BOOL v9 = +[MTUTIUtil isVideo:v11];
  if (v9 != [(MTEpisode *)self isVideo]) {
    [(MTEpisode *)self setVideo:v9];
  }
  BOOL v10 = v9 || v8;
  if (v10 == [(MTEpisode *)self isExternalType]) {
    [(MTEpisode *)self setExternalType:!v10];
  }
}

- (void)setAssetURL:(id)a3
{
  unint64_t v8 = (unint64_t)a3;
  uint64_t v4 = [(MTEpisode *)self assetURL];
  unint64_t v5 = v8 | v4;

  if (v5)
  {
    int v6 = [(MTEpisode *)self assetURL];
    char v7 = [v6 isEqualToString:v8];

    if ((v7 & 1) == 0)
    {
      [(MTEpisode *)self willChangeValueForKey:@"assetURL"];
      [(MTEpisode *)self setPrimitiveValue:v8 forKey:@"assetURL"];
      [(MTEpisode *)self didChangeValueForKey:@"assetURL"];
      [(MTEpisode *)self suppressAutomaticDownloadsIfNeeded];
      if (!v8)
      {
        [(MTEpisode *)self setDownloadDate:0.0];
        [(MTEpisode *)self setIsFromITunesSync:0];
      }
    }
  }
}

- (void)setMetadataFirstSyncEligible:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(MTEpisode *)self metadataFirstSyncEligible] != a3)
  {
    [(MTEpisode *)self willChangeValueForKey:@"metadataFirstSyncEligible"];
    unint64_t v5 = [MEMORY[0x1E4F28ED0] numberWithBool:v3];
    [(MTEpisode *)self setPrimitiveValue:v5 forKey:@"metadataFirstSyncEligible"];

    [(MTEpisode *)self didChangeValueForKey:@"metadataFirstSyncEligible"];
  }
}

- (void)incremementPlayCount
{
  uint64_t v3 = [(MTEpisode *)self playCount] + 1;
  [(MTEpisode *)self setPlayCount:v3];
}

- (void)updateListenNowSortingDate
{
  if ([(MTEpisode *)self listenNowEpisode])
  {
    uint64_t v3 = [(MTEpisode *)self podcast];
    [v3 lastDatePlayed];
    double v5 = v4;

    [(MTEpisode *)self lastDatePlayed];
    double v7 = v6;
    id v20 = [(MTEpisode *)self podcast];
    [v20 addedDate];
    double v9 = v8;
    if (v5 > 0.0 || v7 > 0.0)
    {

      [(MTEpisode *)self pubDate];
      if (v9 < v11) {
        double v9 = v11;
      }
      int v12 = +[FutureDateChecker sharedInstance];
      int v13 = [v12 isFutureWithTimestamp:v5];

      if (v9 >= v5) {
        double v14 = v9;
      }
      else {
        double v14 = v5;
      }
      if (v13) {
        double v15 = v9;
      }
      else {
        double v15 = v14;
      }
      __int16 v16 = +[FutureDateChecker sharedInstance];
      int v17 = [v16 isFutureWithTimestamp:v7];

      if (v15 >= v7) {
        double v18 = v15;
      }
      else {
        double v18 = v7;
      }
      if (v17) {
        double v19 = v15;
      }
      else {
        double v19 = v18;
      }
      id v20 = [(MTEpisode *)self podcast];
      [v20 setModifiedDate:v19];
    }
    else
    {
      BOOL v10 = [(MTEpisode *)self podcast];
      [v10 setModifiedDate:v9];
    }
  }
}

- (void)setLastDatePlayed:(double)a3
{
  [(MTEpisode *)self lastDatePlayed];
  if (v5 < a3)
  {
    [(MTEpisode *)self willChangeValueForKey:@"lastDatePlayed"];
    double v6 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:a3];
    [(MTEpisode *)self setPrimitiveValue:v6 forKey:@"lastDatePlayed"];

    [(MTEpisode *)self didChangeValueForKey:@"lastDatePlayed"];
    double v7 = [(MTEpisode *)self podcast];
    [v7 setLastDatePlayed:a3];

    [(MTEpisode *)self updateListenNowSortingDate];
  }
}

- (void)setListenNowEpisode:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if ([(MTEpisode *)self listenNowEpisode] != a3)
  {
    [(MTEpisode *)self willChangeValueForKey:@"listenNowEpisode"];
    double v5 = [MEMORY[0x1E4F28ED0] numberWithBool:v3];
    [(MTEpisode *)self setPrimitiveValue:v5 forKey:@"listenNowEpisode"];

    [(MTEpisode *)self didChangeValueForKey:@"listenNowEpisode"];
    double v6 = [(MTEpisode *)self podcast];
    double v7 = [v6 nextEpisodeUuid];
    double v8 = [(MTEpisode *)self uuid];
    int v9 = [v7 isEqualToString:v8];

    if (v3)
    {
      if (v9) {
        return;
      }
      BOOL v10 = _MTLogCategoryDefault();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        double v11 = [(MTEpisode *)self podcast];
        int v12 = [v11 nextEpisodeUuid];
        int v13 = [(MTEpisode *)self uuid];
        int v18 = 138543618;
        double v19 = v12;
        __int16 v20 = 2114;
        v21 = v13;
        _os_log_impl(&dword_1AC9D5000, v10, OS_LOG_TYPE_DEFAULT, "ListenNowEpisode changed. Update podcast nextEpisodeUUID from %{public}@ to %{public}@", (uint8_t *)&v18, 0x16u);
      }
      double v14 = [(MTEpisode *)self podcast];
      double v15 = [(MTEpisode *)self uuid];
      [v14 setNextEpisodeUuid:v15];
    }
    else
    {
      if (!v9) {
        return;
      }
      __int16 v16 = _MTLogCategoryDefault();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        int v17 = [(MTEpisode *)self uuid];
        int v18 = 138543362;
        double v19 = v17;
        _os_log_impl(&dword_1AC9D5000, v16, OS_LOG_TYPE_DEFAULT, "ListenNowEpisode changed. Clear podcast nextEpisodeUUID from episode %{public}@", (uint8_t *)&v18, 0xCu);
      }
      double v14 = [(MTEpisode *)self podcast];
      [v14 setNextEpisodeUuid:0];
    }
  }
}

- (id)metricsContentIdentifier
{
  if (+[PFClientUtil isPodcastsApp])
  {
    BOOL v3 = [MEMORY[0x1E4F1CA60] dictionary];
    if ([(MTEpisode *)self storeTrackId])
    {
      double v4 = objc_msgSend(NSString, "stringWithFormat:", @"%lld", -[MTEpisode storeTrackId](self, "storeTrackId"));
      [v3 setObject:v4 forKeyedSubscript:@"adamId"];
    }
    double v5 = [(MTEpisode *)self guid];

    if (v5)
    {
      double v6 = [(MTEpisode *)self guid];
      [v3 setObject:v6 forKeyedSubscript:@"guid"];
    }
    double v7 = [(MTEpisode *)self title];

    if (v7)
    {
      double v8 = [(MTEpisode *)self title];
      [v3 setObject:v8 forKeyedSubscript:@"title"];
    }
    int v9 = [(MTEpisode *)self podcast];
    BOOL v10 = [v9 title];

    if (v10)
    {
      double v11 = [(MTEpisode *)self podcast];
      int v12 = [v11 title];
      [v3 setObject:v12 forKeyedSubscript:@"podcast"];
    }
  }
  else
  {
    int v13 = (objc_class *)objc_opt_class();
    BOOL v3 = NSStringFromClass(v13);
  }
  return v3;
}

+ (id)insertNewEpisodeInManagedObjectContext:(id)a3 title:(id)a4 podcast:(id)a5 pubDate:(id)a6 byteSize:(int64_t)a7 guid:(id)a8 uti:(id)a9 contentId:(int64_t)a10 enclosureUrl:(id)a11 playStateSource:(int)a12 importSource:(int)a13 canSendNotifications:(BOOL)a14
{
  id v27 = a4;
  id v18 = a6;
  id v19 = a8;
  id v25 = a9;
  id v20 = a11;
  id v21 = a5;
  uint64_t v22 = +[MTEpisode insertNewEpisodeInManagedObjectContext:a3 canSendNotifications:a14];
  [v22 setPodcast:v21];

  [v22 setStoreTrackId:a10];
  [v22 setImportSource:a13];
  [v22 setByteSize:a7];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v18 timeIntervalSinceReferenceDate];
    objc_msgSend(v22, "setPubDate:");
  }
  objc_msgSend(v22, "setUti:", v25, a7);
  if (v19) {
    [v22 setGuid:v19];
  }
  if (v27) {
    [v22 setTitle:v27];
  }
  if (v20) {
    [v22 setEnclosureURL:v20];
  }
  [a1 prepareForPlatform:v22];

  return v22;
}

+ (id)insertNewEpisodeInManagedObjectContext:(id)a3 canSendNotifications:(BOOL)a4
{
  BOOL v4 = a4;
  double v6 = [MEMORY[0x1E4F1C0A8] insertNewObjectForEntityForName:@"MTEpisode" inManagedObjectContext:a3];
  double v7 = [NSString UUID];
  [v6 setUuid:v7];

  [v6 setPlayState:2 manually:0 source:2];
  [v6 setVideo:0];
  [v6 setAudio:0];
  [v6 setExternalType:0];
  [v6 setMetadataTimestamp:0.0];
  [v6 setLastDatePlayed:0.0];
  [v6 setMetadataFirstSyncEligible:1];
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  objc_msgSend(v6, "setImportDate:");
  [v6 setIsNew:1];
  [v6 setSentNotification:!v4];
  [a1 prepareForPlatform:v6];
  return v6;
}

- (void)setPlayed:(BOOL)a3 manually:(BOOL)a4 source:(int)a5
{
  if (a3) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = 2;
  }
  [(MTEpisode *)self setPlayState:v5 manually:a4 source:*(void *)&a5];
}

- (void)setPlayState:(int64_t)a3 manually:(BOOL)a4 source:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  BOOL v6 = a4;
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  int v9 = _MTLogCategoryDefault();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = [(MTEpisode *)self playState];
    int v11 = [(MTEpisode *)self playStateManuallySet];
    int v12 = [(MTEpisode *)self title];
    int v13 = [(MTEpisode *)self uuid];
    int v24 = 134350594;
    uint64_t v25 = v10;
    __int16 v26 = 2050;
    int64_t v27 = a3;
    __int16 v28 = 1026;
    int v29 = v11;
    __int16 v30 = 1026;
    BOOL v31 = v6;
    __int16 v32 = 1026;
    int v33 = v5;
    __int16 v34 = 2114;
    v35 = v12;
    __int16 v36 = 2114;
    v37 = v13;
    _os_log_impl(&dword_1AC9D5000, v9, OS_LOG_TYPE_DEFAULT, "Setting Playstate from %{public}lld to %{public}lld , Manual: from %{public}d to %{public}d, Source: %{public}u For: %{public}@, UUID: %{public}@", (uint8_t *)&v24, 0x3Cu);
  }
  if ([(MTEpisode *)self playState] != a3
    || ([(MTEpisode *)self valueForKey:@"playState"],
        (uint64_t v14 = objc_claimAutoreleasedReturnValue()) == 0)
    || (double v15 = (void *)v14,
        int v16 = [(MTEpisode *)self playStateManuallySet],
        v15,
        v16 != v6))
  {
    uint64_t v17 = [(MTEpisode *)self playState];
    [(MTEpisode *)self willChangeValueForKey:@"playState"];
    id v18 = [MEMORY[0x1E4F28ED0] numberWithLongLong:a3];
    [(MTEpisode *)self setPrimitiveValue:v18 forKey:@"playState"];

    [(MTEpisode *)self didChangeValueForKey:@"playState"];
    [(MTEpisode *)self updateUPPTimestamp];
    if (a3 == 2)
    {
      BOOL v19 = 0;
    }
    else
    {
      [(MTEpisode *)self setIsNew:0];
      BOOL v19 = a3 == 0;
      if (!a3 && v17)
      {
        [(MTEpisode *)self setPlayhead:0.0];
        BOOL v19 = 1;
      }
    }
    id v20 = [(MTEpisode *)self podcast];
    [v20 markPlaylistsForUpdate];

    [(MTEpisode *)self willChangeValueForKey:@"playStateManuallySet"];
    id v21 = [MEMORY[0x1E4F28ED0] numberWithBool:v6];
    [(MTEpisode *)self setPrimitiveValue:v21 forKey:@"playStateManuallySet"];

    [(MTEpisode *)self didChangeValueForKey:@"playStateManuallySet"];
    [(MTEpisode *)self willChangeValueForKey:@"playStateSource"];
    uint64_t v22 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInt:v5];
    [(MTEpisode *)self setPrimitiveValue:v22 forKey:@"playStateSource"];

    [(MTEpisode *)self didChangeValueForKey:@"playStateSource"];
    if ([(MTEpisode *)self backCatalog])
    {
      [(MTEpisode *)self willChangeValueForKey:@"backCatalog"];
      [(MTEpisode *)self setPrimitiveValue:MEMORY[0x1E4F1CC28] forKey:@"backCatalog"];
      [(MTEpisode *)self didChangeValueForKey:@"backCatalog"];
    }
    char v23 = !v19;
    if (v5 != 1) {
      char v23 = 1;
    }
    if ((v23 & 1) == 0)
    {
      [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
      -[MTEpisode setLastUserMarkedAsPlayedDate:](self, "setLastUserMarkedAsPlayedDate:");
    }
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    -[MTEpisode setPlayStateLastModifiedDate:](self, "setPlayStateLastModifiedDate:");
  }
}

+ (void)episodeUuidForGUID:(id)a3 feedURL:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([v7 length])
  {
    if ([v8 length]) {
      +[MTEpisode predicateForEpisodeGuid:v7 onFeedURL:v8];
    }
    else {
    uint64_t v10 = +[MTEpisode predicateForEpisodeGuid:v7];
    }
    int v11 = +[MTDB sharedInstance];
    int v12 = [v11 playbackContext];

    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __60__MTEpisode_Library__episodeUuidForGUID_feedURL_completion___block_invoke;
    v15[3] = &unk_1E5E630E0;
    id v16 = v12;
    id v17 = v10;
    id v18 = v9;
    id v13 = v10;
    id v14 = v12;
    [v14 performBlock:v15];
  }
  else
  {
    (*((void (**)(id, void))v9 + 2))(v9, 0);
  }
}

void __60__MTEpisode_Library__episodeUuidForGUID_feedURL_completion___block_invoke(void *a1)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  BOOL v3 = (void *)a1[4];
  uint64_t v2 = a1[5];
  v8[0] = @"uuid";
  BOOL v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  uint64_t v5 = [v3 objectsInEntity:@"MTEpisode" predicate:v2 propertiesToFetch:v4 limit:1];

  BOOL v6 = [v5 firstObject];
  id v7 = [v6 uuid];

  (*(void (**)(void))(a1[6] + 16))();
}

- (void)updateUPPTimestamp
{
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  -[MTEpisode setMetadataTimestamp:](self, "setMetadataTimestamp:");
}

- (BOOL)allowsDurationUpdateFromSource:(int)a3
{
  if (!os_feature_enabled_preserve_player_set_duration()) {
    return 1;
  }
  if (a3 == 6)
  {
    [(MTEpisode *)self playhead];
    if (v7 != 0.0)
    {
      id v8 = [(MTEpisode *)self assetURL];
      BOOL v6 = v8 == 0;

      return v6;
    }
    return 1;
  }
  if (a3 != 7) {
    return 1;
  }
  [(MTEpisode *)self playhead];
  return v5 == 0.0;
}

- (BOOL)isInUserEpisodes
{
  uint64_t v2 = self;
  BOOL v3 = [(MTEpisode *)self podcastUuid];
  BOOL v4 = [(MTEpisode *)v2 podcast];
  float v5 = +[MTEpisode predicateForUserEpisodesOnPodcastUuid:episodeLimit:deletePlayedEpisodes:limitToDownloadBehaviorAutomatic:](MTEpisode, "predicateForUserEpisodesOnPodcastUuid:episodeLimit:deletePlayedEpisodes:limitToDownloadBehaviorAutomatic:", v3, 0, [v4 deletePlayedEpisodesResolvedValue], 0);
  LOBYTE(v2) = [v5 evaluateWithObject:v2];

  return (char)v2;
}

+ (id)userDefaultPropertiesAffectingPredicates
{
  v6[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1E4F1CAD0];
  v6[0] = @"MTPodcastDeletePlayedEpisodesDefaultKey";
  BOOL v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  BOOL v4 = [v2 setWithArray:v3];

  return v4;
}

+ (id)predicateForEpisodesWithGlobalLimitSetting
{
  return (id)objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K.%K == %ld", @"podcast", @"episodeLimit", 0x100000001);
}

+ (id)predicateForDownloadLimitForEpisodeLimit:(int64_t)a3
{
  v10[2] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    BOOL v3 = [MEMORY[0x1E4F28F60] truePredicate];
  }
  else
  {
    float v5 = (void *)MEMORY[0x1E4F28BA0];
    BOOL v6 = [a1 predicateForPodcastIsSerial:1];
    v10[0] = v6;
    float v7 = [a1 predicateForEpisodesDeterminedByLimitSettings:7];
    v10[1] = v7;
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:2];
    BOOL v3 = [v5 orPredicateWithSubpredicates:v8];
  }
  return v3;
}

+ (id)predicateForEpisodesDeterminedByLimitSettings:(int64_t)a3
{
  int64_t v3 = a3;
  switch(a3)
  {
    case 0:
      goto LABEL_6;
    case 1:
    case 2:
    case 3:
      goto LABEL_8;
    case 4:
      int64_t v3 = 5;
      goto LABEL_8;
    case 5:
      int64_t v3 = 10;
LABEL_8:
      if (os_feature_enabled_serial_sort_auto_downloads()) {
        id v8 = kEpisodeShowTypeSpecificLevel;
      }
      else {
        id v8 = kEpisodeLevel;
      }
      uint64_t v7 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K < %ld", *v8, v3);
      goto LABEL_12;
    case 6:
      unint64_t v10 = -1;
      goto LABEL_18;
    case 7:
      unint64_t v10 = -7;
      goto LABEL_18;
    case 8:
      unint64_t v10 = -14;
      goto LABEL_18;
    case 9:
      unint64_t v10 = -30;
      goto LABEL_18;
    default:
      if (a3 == 0x100000000)
      {
LABEL_6:
        uint64_t v7 = [MEMORY[0x1E4F28F60] truePredicate];
        goto LABEL_12;
      }
      if (a3 == 0x100000001)
      {
        float v5 = [MEMORY[0x1E4F1CB18] _applePodcastsFoundationSettingsUserDefaults];
        uint64_t v6 = [v5 episodeLimitForKey:@"MTPodcastEpisodeLimitDefaultKey"];

        uint64_t v7 = [a1 predicateForEpisodesDeterminedByLimitSettings:v6];
LABEL_12:
        id v9 = (void *)v7;
        goto LABEL_19;
      }
      unint64_t v10 = 0x8000000000000001;
LABEL_18:
      int v11 = [MEMORY[0x1E4F1C9A8] currentCalendar];
      int v12 = [MEMORY[0x1E4F1C9C8] date];
      id v13 = [v11 components:28 fromDate:v12];

      objc_msgSend(v13, "setDay:", objc_msgSend(v13, "day") + v10);
      id v14 = [v11 dateFromComponents:v13];
      id v9 = [MEMORY[0x1E4F28F60] predicateForDateKey:@"pubDate" isGreaterThanOrEqualToDate:v14];

LABEL_19:
      return v9;
  }
}

+ (id)predicateForEpisodesOnPodcastUuid:(id)a3 deletePlayedEpisodes:(BOOL)a4
{
  return (id)[a1 predicateForLimittedEpisodesOnPodcastUuid:a3 determinedByLimit:0 deletePlayedEpisodes:a4];
}

+ (id)predicateForLimittedEpisodesOnPodcastUuid:(id)a3 determinedByLimit:(int64_t)a4 deletePlayedEpisodes:(BOOL)a5
{
  id v8 = a3;
  id v9 = [a1 predicateForEpisodesDeterminedByLimitSettings:a4];
  unint64_t v10 = +[MTEpisode predicateForVisuallyPlayed:0];
  if (!a5)
  {
    int v11 = +[MTEpisode predicateForVisuallyPlayed:1];
    int v12 = +[MTEpisode predicateForPlayStateManuallySet:0];
    id v13 = [v11 AND:v12];
    uint64_t v14 = [v10 OR:v13];

    unint64_t v10 = (void *)v14;
  }
  double v15 = [v9 AND:v10];
  id v16 = [a1 predicateForAllEpisodesOnPodcastUuid:v8];

  id v17 = [v15 AND:v16];

  return v17;
}

+ (id)predicateForAllEpisodesOnPodcastUuids:(id)a3
{
  return (id)[a1 predicateForAllEpisodesOnPodcastUuids:a3 includeNonAudioEpisodes:1];
}

+ (id)predicateForHiddenPodcastForEpisodeUuids:(id)a3
{
  BOOL v4 = [a1 predicateForEpisodeUuids:a3];
  float v5 = [a1 predicateForPodcastIsNotHidden];
  uint64_t v6 = [v5 NOT];
  uint64_t v7 = [v4 AND:v6];

  return v7;
}

+ (id)predicateForBookmarkedEpisodesOnPodcastUuid:(id)a3
{
  int64_t v3 = [a1 predicateForAllEpisodesOnPodcastUuid:a3];
  BOOL v4 = (void *)MEMORY[0x1E4F28F60];
  float v5 = [MEMORY[0x1E4F28ED0] numberWithBool:1];
  uint64_t v6 = [v4 predicateWithFormat:@"%K = %@", @"isBookmarked", v5];
  uint64_t v7 = [v3 AND:v6];

  return v7;
}

+ (id)predicateForDownloadedEpisodesOnPodcastUuid:(id)a3
{
  BOOL v4 = [a1 predicateForAllEpisodesOnPodcastUuid:a3];
  float v5 = [a1 predicateForDownloaded:1 excludeHidden:1];
  uint64_t v6 = [v4 AND:v5];

  return v6;
}

+ (id)predicateForAllEpisodesIncludingHiddenOnPodcastUuid:(id)a3
{
  return (id)[MEMORY[0x1E4F28F60] predicateWithFormat:@"(%K = %@)", @"podcastUuid", a3];
}

+ (id)predicateForAllEpisodesOnPodcastUuids:(id)a3 includeNonAudioEpisodes:(BOOL)a4
{
  float v5 = (void *)MEMORY[0x1E4F28F60];
  uint64_t v6 = [a3 array];
  uint64_t v7 = [v5 predicateWithFormat:@"%K in %@", @"podcastUuid", v6];

  if (!a4)
  {
    id v8 = +[MTEpisode predicateForAudio:1];
    uint64_t v9 = [v7 AND:v8];

    uint64_t v7 = (void *)v9;
  }
  unint64_t v10 = +[MTEpisode predicateForAllEpisodes];
  int v11 = [v7 AND:v10];

  return v11;
}

+ (id)predicateForAllEpisodesOnPodcast:(id)a3
{
  return (id)[a1 predicateForAllEpisodesOnPodcast:a3 includeNonAudioEpisodes:1];
}

+ (id)predicateForAllEpisodesOnPodcast:(id)a3 includeNonAudioEpisodes:(BOOL)a4
{
  float v5 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(%K = %@)", @"podcast", a3];
  if (!a4)
  {
    uint64_t v6 = +[MTEpisode predicateForAudio:1];
    uint64_t v7 = [v5 AND:v6];

    float v5 = (void *)v7;
  }
  return v5;
}

+ (id)predicateForLibraryEpisodesOnPodcastUuid:(id)a3
{
  id v4 = a3;
  float v5 = [a1 predicateForAllBookmarkedEpisodes];
  uint64_t v6 = [a1 predicateForDownloaded:1 excludeHidden:0];
  uint64_t v7 = [a1 predicateForAllBookmarksMigrationRecoveredEpisodes];
  id v8 = [v5 OR:v6];
  uint64_t v9 = [v8 OR:v7];

  unint64_t v10 = [a1 predicateForAllEpisodesOnPodcastUuid:v4];

  int v11 = [v9 AND:v10];

  return v11;
}

+ (id)predicateForNilLastDatePlayed
{
  return (id)[MEMORY[0x1E4F28F60] predicateForNilValueForKey:@"lastDatePlayed"];
}

+ (id)predicateForNonNilLastDatePlayed
{
  return (id)[MEMORY[0x1E4F28F60] predicateForNonNilValueForKey:@"lastDatePlayed"];
}

+ (id)predicateForNilLastUserMarkedAsPlayedDate
{
  return (id)[MEMORY[0x1E4F28F60] predicateForNilValueForKey:@"lastUserMarkedAsPlayedDate"];
}

+ (id)predicateForNonNilLastUserMarkedAsPlayedDate
{
  return (id)[MEMORY[0x1E4F28F60] predicateForNonNilValueForKey:@"lastUserMarkedAsPlayedDate"];
}

+ (id)predicateForEpisodesWhichNeedEntitlementStateUpdateForShowUUID:(id)a3 subscriptionState:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v6 = [a1 predicateForAllEpisodesOnPodcastUuid:a3 includeNonAudioEpisodes:1];
  uint64_t v7 = [a1 predicateForDerivedEntitlementStateFree];
  id v8 = [a1 _predicateForNotEntitlementState:0];
  uint64_t v9 = [v7 AND:v8];

  unint64_t v10 = [a1 predicateForPriceType:2];
  if (v4) {
    uint64_t v11 = 1;
  }
  else {
    uint64_t v11 = 2;
  }
  int v12 = [a1 _predicateForNotEntitlementState:v11];
  id v13 = [v10 AND:v12];

  uint64_t v14 = [v9 OR:v13];
  double v15 = [v6 AND:v14];

  return v15;
}

+ (id)predicateForEpisodesWhichNeedEntitlementStateUpdate
{
  int64_t v3 = [a1 predicateForDerivedEntitlementStateFree];
  BOOL v4 = [a1 _predicateForNotEntitlementState:0];
  float v5 = [v3 AND:v4];

  uint64_t v6 = [a1 predicateForDerivedEntitlementStateEntitled];
  uint64_t v7 = [a1 _predicateForNotEntitlementState:1];
  id v8 = [v6 AND:v7];

  uint64_t v9 = [a1 predicateForDerivedEntitlementStateUnentitled];
  unint64_t v10 = [a1 _predicateForNotEntitlementState:2];
  uint64_t v11 = [v9 AND:v10];

  int v12 = [v5 OR:v8];
  id v13 = [v12 OR:v11];

  return v13;
}

+ (id)predicateForDerivedEntitlementStateFree
{
  return (id)[a1 predicateForNotPriceType:2];
}

+ (id)predicateForDerivedEntitlementStateEntitled
{
  int64_t v3 = [a1 predicateForPodcastPaidSubscriptionActive:1];
  BOOL v4 = [a1 predicateForPriceType:2];
  float v5 = [v3 AND:v4];

  return v5;
}

+ (id)predicateForDerivedEntitlementStateUnentitled
{
  int64_t v3 = [a1 predicateForPodcastPaidSubscriptionActive:0];
  BOOL v4 = [a1 predicateForPriceType:2];
  float v5 = [v3 AND:v4];

  return v5;
}

+ (id)predicateForEpisodesPlayableWithoutAccount
{
  uint64_t v2 = (void *)MEMORY[0x1E4F28BA0];
  int64_t v3 = [a1 predicateForEpisodesRequiringAccount];
  BOOL v4 = [v2 notPredicateWithSubpredicate:v3];

  return v4;
}

+ (id)predicateForEpisodesRequiringAccount
{
  int64_t v3 = [a1 predicateForPriceType:3];
  BOOL v4 = [a1 predicateForPriceType:2];
  float v5 = [v3 OR:v4];

  return v5;
}

+ (id)predicateForPodcastPaidSubscriptionActive:(BOOL)a3
{
  if (a3) {
    [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K.%K != NULL && %K.%K.%K = %@", @"podcast", @"channel", @"podcast", @"channel", @"subscriptionActive", &unk_1F03D8880];
  }
  else {
  int64_t v3 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K.%K == NULL || %K.%K.%K = %@", @"podcast", @"channel", @"podcast", @"channel", @"subscriptionActive", &unk_1F03D8898];
  }
  return v3;
}

+ (id)predicateForSubscriptionOnly
{
  uint64_t v2 = objc_opt_class();
  return (id)[v2 _predicateForPriceType:2 forPriceTypeKey:@"freePriceType" excluding:0];
}

+ (id)predicateForRSSEpisodes
{
  uint64_t v2 = (void *)MEMORY[0x1E4F28F60];
  int64_t v3 = NSPersistentStringForMTEpisodePriceType(0);
  BOOL v4 = NSPersistentStringForMTEpisodePriceType(1);
  float v5 = [v2 predicateWithFormat:@"(%K == %@) || (%K == %@) || (%K == NULL)", @"priceType", v3, @"priceType", v4, @"priceType"];

  return v5;
}

+ (id)predicateForAllEpisodes
{
  return (id)[MEMORY[0x1E4F28F60] truePredicate];
}

+ (id)predicateForPodcastIsNotHiddenNotImplicitlyFollowed
{
  return (id)objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"podcast.%K = 0", @"isHiddenOrImplicitlyFollowed");
}

+ (id)predicateForPodcastIsSerial:(BOOL)a3
{
  int64_t v3 = @"episodic";
  if (a3) {
    int64_t v3 = @"serial";
  }
  BOOL v4 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"podcast.%K = %@", @"showTypeInFeed", v3];
  return v4;
}

+ (id)predicateForSuppressAutoDownload:(BOOL)a3
{
  int64_t v3 = (void *)MEMORY[0x1E4F28F60];
  BOOL v4 = [MEMORY[0x1E4F28ED0] numberWithBool:a3];
  float v5 = [v3 predicateWithFormat:@"%K = %@", @"suppressAutoDownload", v4];

  return v5;
}

+ (id)predicateForIsNew:(BOOL)a3
{
  int64_t v3 = (void *)MEMORY[0x1E4F28F60];
  BOOL v4 = [MEMORY[0x1E4F28ED0] numberWithBool:a3];
  float v5 = [v3 predicateWithFormat:@"%K = %@", @"isNew", v4];

  return v5;
}

+ (id)predicateForSentNotification:(BOOL)a3
{
  int64_t v3 = (void *)MEMORY[0x1E4F28F60];
  BOOL v4 = [MEMORY[0x1E4F28ED0] numberWithBool:a3];
  float v5 = [v3 predicateWithFormat:@"%K = %@", @"sentNotification", v4];

  return v5;
}

+ (id)predicateForExplicit:(BOOL)a3
{
  int64_t v3 = (void *)MEMORY[0x1E4F28F60];
  BOOL v4 = [MEMORY[0x1E4F28ED0] numberWithBool:a3];
  float v5 = [v3 predicateWithFormat:@"%K = %@", @"explicit", v4];

  return v5;
}

+ (id)predicateForUnplayedTabFlag:(BOOL)a3
{
  int64_t v3 = (void *)MEMORY[0x1E4F28F60];
  BOOL v4 = [MEMORY[0x1E4F28ED0] numberWithBool:a3];
  float v5 = [v3 predicateWithFormat:@"%K = %@", @"unplayedTab", v4];

  return v5;
}

+ (id)predicateForUserEpisode:(BOOL)a3
{
  int64_t v3 = (void *)MEMORY[0x1E4F28F60];
  BOOL v4 = [MEMORY[0x1E4F28ED0] numberWithBool:a3];
  float v5 = [v3 predicateWithFormat:@"%K = %@", @"userEpisode", v4];

  return v5;
}

+ (id)predicateForAllBookmarkedEpisodes
{
  uint64_t v2 = (void *)MEMORY[0x1E4F28F60];
  int64_t v3 = [MEMORY[0x1E4F28ED0] numberWithBool:1];
  BOOL v4 = [v2 predicateWithFormat:@"%K = %@", @"isBookmarked", v3];

  return v4;
}

+ (id)predicateForAllUnbookmarkedEpisodes
{
  uint64_t v2 = (void *)MEMORY[0x1E4F28F60];
  int64_t v3 = [MEMORY[0x1E4F28ED0] numberWithBool:0];
  BOOL v4 = [v2 predicateWithFormat:@"%K = %@", @"isBookmarked", v3];

  return v4;
}

+ (id)predicateForHasAnyVisualPlayState
{
  int64_t v3 = [a1 predicateForNotUnplayed];
  BOOL v4 = [a1 predicateForIsBackCatalogItem];
  float v5 = [v4 NOT];
  uint64_t v6 = [v3 AND:v5];

  return v6;
}

+ (id)predicateForNotUnplayed
{
  return (id)[MEMORY[0x1E4F28F60] predicateWithFormat:@"%K != %@", @"playState", &unk_1F03D88C8];
}

+ (id)predicateForEpisodesOnUnplayedTab
{
  int64_t v3 = [a1 predicateForUnplayedTabFlag:1];
  BOOL v4 = [a1 predicateForPodcastIsNotHiddenNotImplicitlyFollowed];
  float v5 = [v3 AND:v4];

  return v5;
}

+ (id)predicateForUserEpisodes
{
  int64_t v3 = [a1 predicateForUserEpisode:1];
  BOOL v4 = [a1 predicateForPodcastIsNotHiddenNotImplicitlyFollowed];
  float v5 = [v3 AND:v4];

  return v5;
}

+ (id)predicateForEpisodesInSearchResults
{
  int64_t v3 = [a1 predicateForBookmarkedEpisodes];
  BOOL v4 = [a1 predicateForDownloaded:1 excludeHidden:1];
  float v5 = [v3 OR:v4];
  uint64_t v6 = [a1 predicateForPodcastIsSubscribed:1];
  uint64_t v7 = [v5 OR:v6];

  return v7;
}

+ (id)predicateForBookmarkedEpisodes
{
  int64_t v3 = [a1 predicateForAllBookmarkedEpisodes];
  BOOL v4 = [a1 predicateForPodcastIsNotHiddenNotImplicitlyFollowed];
  float v5 = [v3 AND:v4];

  return v5;
}

+ (id)predicateForUnbookmarkedEpisodes
{
  int64_t v3 = [a1 predicateForAllUnbookmarkedEpisodes];
  BOOL v4 = [a1 predicateForPodcastIsNotHiddenNotImplicitlyFollowed];
  float v5 = [v3 AND:v4];

  return v5;
}

+ (id)predicateForBookmarksMigrationRecoveredEpisodesOnPodcastUuid:(id)a3
{
  id v4 = a3;
  float v5 = [a1 predicateForAllBookmarksMigrationRecoveredEpisodes];
  uint64_t v6 = [a1 predicateForAllEpisodesOnPodcastUuid:v4];

  uint64_t v7 = [v5 AND:v6];

  return v7;
}

+ (id)predicateForAllBookmarksMigrationRecoveredEpisodes
{
  uint64_t v2 = (void *)MEMORY[0x1E4F28F60];
  int64_t v3 = [MEMORY[0x1E4F28ED0] numberWithBool:1];
  id v4 = [v2 predicateWithFormat:@"%K = %@", @"isBookmarksMigrationRecoveredEpisode", v3];

  return v4;
}

+ (id)predicateForListenNowForPodcastUuid:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F28F60];
  id v5 = a3;
  uint64_t v6 = [v4 predicateWithFormat:@"%K = %@", @"listenNowEpisode", MEMORY[0x1E4F1CC38]];
  if (os_feature_enabled_unfollowed_shows_in_up_next()) {
    [a1 predicateForPodcastIsNotHidden];
  }
  else {
  uint64_t v7 = [a1 predicateForPodcastIsNotHiddenNotImplicitlyFollowed];
  }
  id v8 = [v6 AND:v7];
  uint64_t v9 = [a1 predicateForAllEpisodesOnPodcastUuid:v5];

  unint64_t v10 = [v8 AND:v9];

  return v10;
}

+ (id)predicateForListenNowLatestEpisodes
{
  int64_t v3 = [a1 predicateForFeedDeleted:0];
  id v4 = [a1 predicateForPodcastIsNotHiddenNotImplicitlyFollowed];
  id v5 = [v3 AND:v4];
  uint64_t v6 = [a1 predicateForPodcastIsSubscribed:1];
  uint64_t v7 = [v5 AND:v6];
  id v8 = [a1 predicateForEntitledEpisodes];
  uint64_t v9 = [v7 AND:v8];

  return v9;
}

+ (id)predicateForCategoryPageFromYourShows:(id)a3 ctx:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_opt_new();
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  BOOL v19 = __68__MTEpisode_NSPredicate__predicateForCategoryPageFromYourShows_ctx___block_invoke;
  id v20 = &unk_1E5E63B78;
  id v21 = v6;
  id v22 = v8;
  id v9 = v8;
  id v10 = v6;
  [v7 enumerateObjectsUsingBlock:&v17];

  uint64_t v11 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K in %@", @"podcast", v9, v17, v18, v19, v20];
  int v12 = [a1 predicateForEntitledEpisodes];
  id v13 = [a1 predicateForVisuallyPlayed:0];
  uint64_t v14 = [v11 AND:v12];
  double v15 = [v14 AND:v13];

  return v15;
}

void __68__MTEpisode_NSPredicate__predicateForCategoryPageFromYourShows_ctx___block_invoke(uint64_t a1, uint64_t a2)
{
  id v5 = [MEMORY[0x1E4F1CB10] URLWithString:a2];
  int64_t v3 = [*(id *)(a1 + 32) persistentStoreCoordinator];
  id v4 = [v3 managedObjectIDForURIRepresentation:v5];

  [*(id *)(a1 + 40) addObject:v4];
}

+ (id)predicateForPubDateLimit:(int64_t)a3
{
  switch(a3)
  {
    case 0:
      objc_msgSend(a1, "predicateForEpisodesPublishedThisWeek", v3);
      a1 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 1:
      objc_msgSend(a1, "predicateForEpisodesPublishedLastTwoWeeks", v3);
      a1 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 2:
      objc_msgSend(a1, "predicateForEpisodesPublishedThisMonth", v3);
      a1 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 3:
      objc_msgSend(MEMORY[0x1E4F28F60], "truePredicate", v3);
      a1 = (id)objc_claimAutoreleasedReturnValue();
LABEL_9:
      break;
    default:
      break;
  }
  return a1;
}

+ (id)predicateForDownloaded:(BOOL)a3
{
  if (a3) {
    [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K != NULL AND %K > %@", @"assetURL", @"assetURL", &stru_1F03A51F0];
  }
  else {
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K = NULL", @"assetURL", v5, v6);
  }
  return v3;
}

+ (id)predicateForHLS
{
  return (id)objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K ENDSWITH '.movpkg'", @"assetURL");
}

+ (id)predicateForNonHLS
{
  uint64_t v2 = [a1 predicateForHLS];
  uint64_t v3 = [v2 NOT];

  return v3;
}

+ (id)predicateForHLSDownloadedExcludeHidden:(BOOL)a3
{
  uint64_t v4 = [a1 predicateForDownloaded:1 excludeHidden:a3];
  uint64_t v5 = [a1 predicateForHLS];
  uint64_t v6 = [v4 AND:v5];

  return v6;
}

+ (id)predicateForNonHLSDownloadedExcludeHidden:(BOOL)a3
{
  uint64_t v4 = [a1 predicateForDownloaded:1 excludeHidden:a3];
  uint64_t v5 = [a1 predicateForNonHLS];
  uint64_t v6 = [v4 AND:v5];

  return v6;
}

+ (id)predicateForIsFromiTunesSync:(BOOL)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F28F60];
  uint64_t v4 = [MEMORY[0x1E4F28ED0] numberWithBool:a3];
  uint64_t v5 = [v3 predicateWithFormat:@"%K = %@", @"isFromITunesSync", v4];

  return v5;
}

+ (id)predicateForVideo:(BOOL)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F28F60];
  uint64_t v4 = [MEMORY[0x1E4F28ED0] numberWithBool:a3];
  uint64_t v5 = [v3 predicateWithFormat:@"%K = %@", @"video", v4];

  return v5;
}

+ (id)predicateForAudio:(BOOL)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F28F60];
  uint64_t v4 = [MEMORY[0x1E4F28ED0] numberWithBool:a3];
  uint64_t v5 = [v3 predicateWithFormat:@"%K = %@", @"audio", v4];

  return v5;
}

+ (id)predicateForMetadataFirstSyncEligible:(BOOL)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F28F60];
  uint64_t v4 = [MEMORY[0x1E4F28ED0] numberWithBool:a3];
  uint64_t v5 = [v3 predicateWithFormat:@"%K = %@", @"metadataFirstSyncEligible", v4];

  return v5;
}

+ (id)predicateForRecentlyPlayed
{
  return (id)[a1 predicateForPlayedInInterval:86400.0];
}

+ (id)predicateForPartiallyPlayedInLastTwoMonths
{
  return (id)[a1 predicateForAtLeastPartiallyPlayedInInterval:5184000.0];
}

+ (id)predicateForAtLeastPartiallyPlayedInInterval:(double)a3
{
  uint64_t v3 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-a3];
  uint64_t v4 = [v3 dateForBeginningOfHour];

  uint64_t v5 = [MEMORY[0x1E4F28F60] predicateForDateKey:@"lastDatePlayed" isGreaterThanOrEqualToDate:v4];
  uint64_t v6 = [MEMORY[0x1E4F28F60] predicateForDateKey:@"lastUserMarkedAsPlayedDate" isGreaterThanOrEqualToDate:v4];
  id v7 = [v5 OR:v6];

  return v7;
}

+ (id)predicateForPlayedInInterval:(double)a3
{
  uint64_t v4 = [a1 predicateForAtLeastPartiallyPlayedInInterval:a3];
  uint64_t v5 = [a1 predicateForPlayed:1];
  uint64_t v6 = [v4 AND:v5];

  return v6;
}

+ (id)predicateForEpisodeGuid:(id)a3
{
  return (id)[MEMORY[0x1E4F28F60] predicateWithFormat:@"%K = %@", @"guid", a3];
}

+ (id)predicateForEpisodeGuids:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F28F60];
  uint64_t v4 = [a3 allObjects];
  uint64_t v5 = [v3 predicateWithFormat:@"%K in %@", @"guid", v4];

  return v5;
}

+ (id)predicateForFeedURL:(id)a3
{
  return (id)[MEMORY[0x1E4F28F60] predicateWithFormat:@"%K.%K = %@", @"podcast", @"feedURL", a3];
}

+ (id)predicateForFeedURLs:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F28F60];
  uint64_t v4 = [a3 allObjects];
  uint64_t v5 = [v3 predicateWithFormat:@"%K.%K in %@", @"podcast", @"feedURL", v4];

  return v5;
}

+ (id)predicateForPersistentId:(id)a3
{
  return (id)[MEMORY[0x1E4F28F60] predicateWithFormat:@"%K = %@", @"persistentID", a3];
}

+ (id)predicateForPersistentIds:(id)a3
{
  return (id)[MEMORY[0x1E4F28F60] predicateWithFormat:@"%K in %@", @"persistentID", a3];
}

+ (id)predicateForHasValidPersistentId:(BOOL)a3
{
  if (a3) {
    [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K != NULL AND (%K > %@ OR %K < %@)", @"persistentID", @"persistentID", &unk_1F03D8898, @"persistentID", &unk_1F03D8898];
  }
  else {
  uint64_t v3 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K = NULL OR %K == %@", @"persistentID", @"persistentID", &unk_1F03D8898, v5, v6];
  }
  return v3;
}

+ (id)predicateForEpisodeTitle:(id)a3
{
  return (id)[MEMORY[0x1E4F28F60] predicateWithFormat:@"%K = %@", @"title", a3];
}

+ (id)predicateForHasNonEmptyEnclosureURL
{
  return (id)[MEMORY[0x1E4F28F60] predicateWithFormat:@"%K != NULL AND %K != %@", @"enclosureURL", @"enclosureURL", &stru_1F03A51F0];
}

+ (id)predicateForEpisodesImportedAfterDate:(id)a3
{
  if (a3) {
    [MEMORY[0x1E4F28F60] predicateForDateKey:@"importDate" isGreaterThanDate:a3];
  }
  else {
  uint64_t v3 = [MEMORY[0x1E4F28F60] predicateWithValue:1];
  }
  return v3;
}

+ (id)predicateForEpisodeType:(int64_t)a3
{
  if (a3 == 2)
  {
    uint64_t v3 = (void *)MEMORY[0x1E4F28F60];
    uint64_t v4 = kEpisodeTypeBonus;
LABEL_7:
    [v3 predicateWithFormat:@"%K ==[c] %@", @"episodeType", *v4, v6, v7, v8];
    goto LABEL_8;
  }
  if (a3 == 1)
  {
    uint64_t v3 = (void *)MEMORY[0x1E4F28F60];
    uint64_t v4 = kEpisodeTypeTrailer;
    goto LABEL_7;
  }
  if (a3) {
    goto LABEL_9;
  }
  [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == NULL OR (%K !=[c] %@ AND %K !=[c] %@)", @"episodeType", @"episodeType", @"trailer", @"episodeType", @"bonus"];
LABEL_8:
  a1 = (id)objc_claimAutoreleasedReturnValue();
LABEL_9:
  return a1;
}

+ (id)predicateForEpisodeTypeFilter:(int64_t)a3
{
  uint64_t v3 = a1;
  switch(a3)
  {
    case 0:
      uint64_t v4 = [MEMORY[0x1E4F28F60] truePredicate];
      goto LABEL_7;
    case 1:
      uint64_t v5 = 0;
      goto LABEL_6;
    case 2:
      uint64_t v5 = 1;
      goto LABEL_6;
    case 3:
      uint64_t v5 = 2;
LABEL_6:
      uint64_t v4 = [a1 predicateForEpisodeType:v5];
LABEL_7:
      uint64_t v3 = (void *)v4;
      break;
    case 4:
      uint64_t v6 = [a1 predicateForEpisodeType:1];
      uint64_t v7 = [v3 predicateForEpisodeType:2];
      uint64_t v3 = [v6 OR:v7];

      goto LABEL_10;
    case 5:
      uint64_t v6 = [a1 predicateForEpisodeType:1];
      uint64_t v3 = [v6 NOT];
LABEL_10:

      break;
    case 6:
      uint64_t v8 = [a1 predicateForEpisodeType:1];
      id v9 = [v3 predicateForHasSomeSeasonNumberWithNoEpisodeNumber];
      id v10 = [v8 AND:v9];

      uint64_t v3 = [v10 NOT];

      break;
    default:
      break;
  }
  return v3;
}

+ (id)predicateForOtherEpisodesOnPodcastUuid:(id)a3 baseEpisodesPredicate:(id)a4 deletePlayedEpisodes:(BOOL)a5
{
  uint64_t v8 = (void *)MEMORY[0x1E4F28BA0];
  id v9 = a3;
  id v10 = [v8 notPredicateWithSubpredicate:a4];
  uint64_t v11 = [a1 predicateForAllEpisodesOnPodcastUuid:v9];

  int v12 = [v11 AND:v10];

  id v13 = [a1 predicateForPlayStateManuallySet:1];
  uint64_t v14 = [a1 predicateForIsFromiTunesSync:1];
  double v15 = [v13 OR:v14];

  id v16 = +[MTEpisode predicateForPlayed:0];
  uint64_t v17 = [v16 AND:v15];

  if (!a5)
  {
    uint64_t v18 = +[MTEpisode predicateForPlayed:1];
    BOOL v19 = +[MTEpisode predicateForPlayStateManuallySet:0];
    id v20 = [v18 AND:v19];
    uint64_t v21 = [v17 OR:v20];

    uint64_t v17 = (void *)v21;
  }
  id v22 = [v12 AND:v17];

  return v22;
}

+ (id)predicateForRecentlyPlayedEpisodesToBeDeletedOnPodcastUuid:(id)a3 deletePlayedEpisodes:(BOOL)a4
{
  if (a4)
  {
    uint64_t v5 = [a1 predicateForAllEpisodesOnPodcastUuid:a3];
    uint64_t v6 = [a1 predicateForRecentlyPlayed];
    uint64_t v7 = [v5 AND:v6];
    uint64_t v8 = [a1 predicateForPlayStateManuallySet:0];
    id v9 = [v7 AND:v8];
    id v10 = [a1 predicateForIsFromiTunesSync:0];
    uint64_t v11 = [v9 AND:v10];
  }
  else
  {
    uint64_t v11 = [MEMORY[0x1E4F28F60] predicateWithValue:0];
  }
  return v11;
}

+ (id)predicateForEpisodesIsFromiTunesSyncOnPodcastUuid:(id)a3
{
  uint64_t v4 = [a1 predicateForAllEpisodesOnPodcastUuid:a3];
  uint64_t v5 = [a1 predicateForIsFromiTunesSync:1];
  uint64_t v6 = [v4 AND:v5];

  return v6;
}

+ (id)predicateForEpisodesOnUnplayedTabOnPodcastUuid:(id)a3 deletePlayedEpisodes:(BOOL)a4
{
  return (id)[a1 predicateForEpisodesOnUnplayedTabOnPodcastUuid:a3 episodeLimit:0 deletePlayedEpisodes:a4];
}

+ (id)predicateForEpisodesOnUnplayedTabOnPodcastUuid:(id)a3 episodeLimit:(int64_t)a4 deletePlayedEpisodes:(BOOL)a5
{
  return (id)[a1 predicateForEpisodesOnUnplayedTabOnPodcastUuid:a3 episodeLimit:a4 deletePlayedEpisodes:a5 limitToDownloadBehaviorAutomatic:0];
}

+ (id)predicateForEpisodesOnUnplayedTabOnPodcastUuid:(id)a3 episodeLimit:(int64_t)a4 deletePlayedEpisodes:(BOOL)a5 limitToDownloadBehaviorAutomatic:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v10 = a3;
  uint64_t v11 = +[MTEpisode predicateForLimittedEpisodesOnPodcastUuid:v10 determinedByLimit:a4 deletePlayedEpisodes:v7];
  int v12 = +[MTEpisode predicateForOtherEpisodesOnPodcastUuid:v10 baseEpisodesPredicate:v11 deletePlayedEpisodes:v7];
  if (v6)
  {
    id v13 = +[MTEpisode predicateForDownloadBehavior:0];
    uint64_t v14 = [v12 AND:v13];

    int v12 = (void *)v14;
  }
  double v15 = [v11 OR:v12];
  id v16 = [a1 predicateForAllEpisodesOnPodcastUuid:v10];
  uint64_t v17 = [v15 AND:v16];

  return v17;
}

+ (id)predicateForEpisodesInFeedForPodcastUuid:(id)a3
{
  uint64_t v4 = [a1 predicateForAllEpisodesOnPodcastUuid:a3];
  uint64_t v5 = [a1 predicateForFeedDeleted:0];
  BOOL v6 = [v4 AND:v5];

  return v6;
}

+ (id)predicateForEpisodesFromiTunesSyncOnPodcastUuid:(id)a3
{
  uint64_t v4 = [a1 predicateForAllEpisodesOnPodcastUuid:a3];
  uint64_t v5 = [a1 predicateForIsFromiTunesSync:1];
  BOOL v6 = [v4 AND:v5];

  return v6;
}

+ (id)predicateForUserEpisodesOnPodcastUuid:(id)a3 episodeLimit:(int64_t)a4 deletePlayedEpisodes:(BOOL)a5 limitToDownloadBehaviorAutomatic:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v10 = a3;
  uint64_t v11 = [a1 predicateForEpisodesOnUnplayedTabOnPodcastUuid:v10 episodeLimit:a4 deletePlayedEpisodes:v7 limitToDownloadBehaviorAutomatic:v6];
  int v12 = +[MTEpisode predicateForEpisodesFromiTunesSyncOnPodcastUuid:v10];
  id v13 = [v11 OR:v12];

  uint64_t v14 = [a1 predicateForAllEpisodesOnPodcastUuid:v10];

  double v15 = [v13 AND:v14];

  return v15;
}

+ (id)predicateForPlaylistEpisodes
{
  return (id)objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K.@count > 0", @"playlists");
}

+ (id)_dateWithOffset:(id)a3 fromDate:(id)a4
{
  id v5 = a3;
  BOOL v6 = (objc_class *)MEMORY[0x1E4F1C9A8];
  id v7 = a4;
  id v8 = [v6 alloc];
  id v9 = (void *)[v8 initWithCalendarIdentifier:*MEMORY[0x1E4F1C318]];
  id v10 = [v9 components:28 fromDate:v7];

  uint64_t v11 = [v10 day];
  uint64_t v12 = [v10 month];
  uint64_t v13 = [v10 year];
  id v14 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
  [v14 setDay:v11];
  [v14 setMonth:v12];
  [v14 setYear:v13];
  double v15 = [v9 dateFromComponents:v14];
  if (!v5) {
    id v5 = (id)objc_opt_new();
  }
  id v16 = [v9 dateByAddingComponents:v5 toDate:v15 options:0];

  return v16;
}

+ (id)predicateForEpisodesWithUnsatisfiedAvailabilityDate
{
  uint64_t v2 = [a1 predicateForEpisodesPublishedThisWeek];
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K != NULL", @"firstTimeAvailableAsPaid");
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K > %K", @"pubDate", @"firstTimeAvailableAsPaid");
  id v5 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K != %K", @"firstTimeAvailable", @"pubDate");
  BOOL v6 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K != %K", @"firstTimeAvailable", @"firstTimeAvailableAsPaid");
  id v7 = [v3 NOT];
  id v8 = [v5 AND:v7];

  id v9 = [v6 AND:v4];
  id v10 = [v9 AND:v3];

  uint64_t v11 = [v8 OR:v10];
  uint64_t v12 = [v2 AND:v11];

  return v12;
}

+ (id)predicateForAutomaticallyDownloadedEpisodesExcludedByGlobalLimitSettings:(int64_t)a3 excludeHidden:(BOOL)a4
{
  id v5 = [a1 predicateForAutomaticallyDownloadedEpisodesExcludedByShowLimitSettings:a3 excludeHidden:a4];
  BOOL v6 = [a1 predicateForEpisodesWithGlobalLimitSetting];
  id v7 = [v5 AND:v6];
  if ((os_feature_enabled_serial_sort_auto_downloads() & 1) == 0)
  {
    id v8 = [a1 predicateForPodcastIsSerial:0];
    uint64_t v9 = [v7 AND:v8];

    id v7 = (void *)v9;
  }

  return v7;
}

+ (id)predicateForAutomaticallyDownloadedEpisodesExcludedByShowLimitSettings:(int64_t)a3 excludeHidden:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v6 = [a1 predicateForEpisodesDeterminedByLimitSettings:a3];
  id v7 = [v6 NOT];

  id v8 = [a1 predicateForDownloaded:1 excludeHidden:v4];
  uint64_t v9 = [a1 predicateForDownloadBehavior:4];
  id v10 = [a1 predicateForDownloadBehavior:2];
  uint64_t v11 = [v9 OR:v10];
  uint64_t v12 = [v11 NOT];

  uint64_t v13 = +[MTEpisode predicateForAllUnbookmarkedEpisodes];
  id v14 = [v7 AND:v8];
  double v15 = [v14 AND:v12];
  id v16 = [v15 AND:v13];

  return v16;
}

+ (id)predicateForEpisodesPriceChangedAfterOffset:(id)a3 fromDate:(id)a4
{
  BOOL v4 = +[MTEpisode _dateWithOffset:a3 fromDate:a4];
  id v5 = [MEMORY[0x1E4F28F60] predicateForDateKey:@"priceTypeChangedDate" isGreaterThanOrEqualToDate:v4];

  return v5;
}

+ (id)predicateForEpisodesPublishedAfterOffset:(id)a3 fromDate:(id)a4
{
  BOOL v4 = +[MTEpisode _dateWithOffset:a3 fromDate:a4];
  id v5 = [MEMORY[0x1E4F28F60] predicateForDateKey:@"pubDate" isGreaterThanOrEqualToDate:v4];

  return v5;
}

+ (id)predicateForEpisodesPublishedToday
{
  uint64_t v3 = [MEMORY[0x1E4F1C9C8] date];
  BOOL v4 = [a1 predicateForEpisodesPublishedOnDate:v3];

  return v4;
}

+ (id)predicateForEpisodesPublishedOnDate:(id)a3
{
  return (id)[a1 predicateForEpisodesPublishedAfterOffset:0 fromDate:a3];
}

+ (id)predicateForEpisodesPriceTypeChangedThisWeek
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
  [v3 setWeekOfYear:-1];
  BOOL v4 = [MEMORY[0x1E4F1C9C8] date];
  id v5 = [a1 predicateForEpisodesPriceChangedAfterOffset:v3 fromDate:v4];

  return v5;
}

+ (id)predicateForEpisodesPublishedThisWeek
{
  id v3 = [MEMORY[0x1E4F1C9C8] date];
  BOOL v4 = [a1 predicateForEpisodesPublishedThisWeekWithTodayDate:v3];

  return v4;
}

+ (id)predicateForEpisodesPublishedThisWeekWithTodayDate:(id)a3
{
  BOOL v4 = (objc_class *)MEMORY[0x1E4F1C9D8];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  [v6 setWeekOfYear:-1];
  id v7 = [a1 predicateForEpisodesPublishedAfterOffset:v6 fromDate:v5];

  return v7;
}

+ (id)predicateForEpisodesPublishedLastTwoWeeks
{
  id v3 = [MEMORY[0x1E4F1C9C8] date];
  BOOL v4 = [a1 predicateForEpisodesPublishedLastTwoWeeksWithTodayDate:v3];

  return v4;
}

+ (id)predicateForEpisodesPublishedLastTwoWeeksWithTodayDate:(id)a3
{
  BOOL v4 = (objc_class *)MEMORY[0x1E4F1C9D8];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  [v6 setWeekOfYear:-2];
  id v7 = [a1 predicateForEpisodesPublishedAfterOffset:v6 fromDate:v5];

  return v7;
}

+ (id)predicateForEpisodesPublishedThisMonth
{
  id v3 = [MEMORY[0x1E4F1C9C8] date];
  BOOL v4 = [a1 predicateForEpisodesPublishedThisMonthWithTodayDate:v3];

  return v4;
}

+ (id)predicateForEpisodesPublishedAfterDate:(id)a3
{
  return (id)[MEMORY[0x1E4F28F60] predicateForDateKey:@"firstTimeAvailable" isGreaterThanDate:a3];
}

+ (id)predicateForEpisodesPublishedBeforeDate:(id)a3
{
  return (id)[MEMORY[0x1E4F28F60] predicateForDateKey:@"firstTimeAvailable" isLessThanDate:a3];
}

+ (id)predicateForEpisodesWithinLevel:(unint64_t)a3
{
  int v4 = os_feature_enabled_serial_sort_auto_downloads();
  id v5 = kEpisodeShowTypeSpecificLevel;
  if (!v4) {
    id v5 = kEpisodeLevel;
  }
  id v6 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K < %ld", *v5, a3);
  return v6;
}

+ (id)predicateForEpisodesPublishedThisMonthWithTodayDate:(id)a3
{
  int v4 = (objc_class *)MEMORY[0x1E4F1C9D8];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  [v6 setMonth:-1];
  id v7 = [a1 predicateForEpisodesPublishedAfterOffset:v6 fromDate:v5];

  return v7;
}

+ (id)predicateForEpisodesInStationShow:(id)a3
{
  id v4 = a3;
  id v5 = [a1 predicateForStationEligibleEpisodes];
  id v6 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"ANY %K.%K = %@", @"settings", @"uuid", v4];

  id v7 = [v6 AND:v5];

  return v7;
}

+ (id)predicateForUserEpisodesOnPodcastUuid:(id)a3 ctx:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __68__MTEpisode_NSPredicate__predicateForUserEpisodesOnPodcastUuid_ctx___block_invoke;
  v12[3] = &unk_1E5E61780;
  id v8 = v7;
  id v13 = v8;
  id v9 = v6;
  id v14 = v9;
  double v15 = &v16;
  [v8 performBlockAndWait:v12];
  id v10 = [a1 predicateForUserEpisodesOnPodcastUuid:v9 episodeLimit:0 deletePlayedEpisodes:*((unsigned __int8 *)v17 + 24) limitToDownloadBehaviorAutomatic:0];

  _Block_object_dispose(&v16, 8);
  return v10;
}

void __68__MTEpisode_NSPredicate__predicateForUserEpisodesOnPodcastUuid_ctx___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) objectForUuid:*(void *)(a1 + 40) entityName:@"MTPodcast"];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v2 deletePlayedEpisodesResolvedValue];
}

+ (id)predicateForEpisodesOnUnplayedTabOnPodcastUuid:(id)a3 ctx:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __77__MTEpisode_NSPredicate__predicateForEpisodesOnUnplayedTabOnPodcastUuid_ctx___block_invoke;
  v12[3] = &unk_1E5E61780;
  id v8 = v7;
  id v13 = v8;
  id v9 = v6;
  id v14 = v9;
  double v15 = &v16;
  [v8 performBlockAndWait:v12];
  id v10 = [a1 predicateForEpisodesOnUnplayedTabOnPodcastUuid:v9 deletePlayedEpisodes:*((unsigned __int8 *)v17 + 24)];

  _Block_object_dispose(&v16, 8);
  return v10;
}

void __77__MTEpisode_NSPredicate__predicateForEpisodesOnUnplayedTabOnPodcastUuid_ctx___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) objectForUuid:*(void *)(a1 + 40) entityName:@"MTPodcast"];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v2 deletePlayedEpisodesResolvedValue];
}

+ (id)predicateForStoreIdentifier:(id)a3
{
  id v3 = [a3 storeIdentifier];
  if (+[MTStoreIdentifier isEmptyNumber:v3]) {
    [MEMORY[0x1E4F28F60] falsePredicate];
  }
  else {
  id v4 = +[MTEpisode predicateForEpisodeStoreTrackId:](MTEpisode, "predicateForEpisodeStoreTrackId:", [v3 longLongValue]);
  }

  return v4;
}

+ (id)predicateForEpisodeStoreTrackId:(int64_t)a3
{
  id v3 = (void *)MEMORY[0x1E4F28F60];
  id v4 = [MEMORY[0x1E4F28ED0] numberWithLongLong:a3];
  id v5 = [v3 predicateWithFormat:@"%K = %@", @"storeTrackId", v4];

  return v5;
}

+ (id)predicateForEpisodeStoreTrackIds:(id)a3
{
  id v3 = [a3 allObjects];
  id v4 = objc_msgSend(v3, "mt_filter:", &__block_literal_global_23);

  id v5 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K in %@", @"storeTrackId", v4];

  return v5;
}

uint64_t __59__MTEpisode_NSPredicate__predicateForEpisodeStoreTrackIds___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[MTStoreIdentifier isEmptyNumber:a2] ^ 1;
}

+ (id)predicateForEpisodeGuid:(id)a3 onFeedURL:(id)a4
{
  return (id)[MEMORY[0x1E4F28F60] predicateWithFormat:@"%K = %@ AND %K.%K = %@", @"guid", a3, @"podcast", @"feedURL", a4];
}

+ (id)predicateForEpisodeGuid:(id)a3 onPodcastUuid:(id)a4
{
  return (id)[MEMORY[0x1E4F28F60] predicateWithFormat:@"%K = %@ AND %K = %@", @"guid", a3, @"podcastUuid", a4];
}

+ (id)predicateForEpisodeTitle:(id)a3 onPodcastUuid:(id)a4
{
  return (id)[MEMORY[0x1E4F28F60] predicateWithFormat:@"%K = %@ AND %K = %@", @"title", a3, @"podcastUuid", a4];
}

+ (id)predicateForHasEpisodeNumber
{
  return (id)objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K > 0", @"episodeNumber");
}

+ (id)predicateForHasSeasonNumber
{
  return (id)objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K > 0", @"seasonNumber");
}

+ (id)predicateForSeasonNumber:(int64_t)a3
{
  id v3 = (void *)MEMORY[0x1E4F28F60];
  if (a3 <= 0)
  {
    id v5 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"(%K = NULL OR %K = 0)", @"seasonNumber", @"seasonNumber");
  }
  else
  {
    id v4 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithLongLong:");
    id v5 = [v3 predicateWithFormat:@"%K = %@", @"seasonNumber", v4];
  }
  return v5;
}

+ (id)predicateForEpisodesWithSeasonNumbersOnPodcastUuid:(id)a3
{
  id v3 = a3;
  id v4 = +[MTEpisode predicateForHasSeasonNumber];
  id v5 = +[MTEpisode predicateForAllEpisodesOnPodcastUuid:v3];

  id v6 = [v5 AND:v4];

  return v6;
}

+ (id)predicateForEpisodesWithEpisodeNumbersGreaterThan:(int64_t)a3
{
  id v3 = (void *)MEMORY[0x1E4F28F60];
  id v4 = [MEMORY[0x1E4F28ED0] numberWithLongLong:a3];
  id v5 = [v3 predicateWithFormat:@"%K > %@", @"episodeNumber", v4];

  return v5;
}

+ (id)predicateForEpisodesWithSeasonAndEpisodeNumbersGreaterThanOrEqualTo:(int64_t)a3 seasonNumber:(int64_t)a4
{
  id v6 = (void *)MEMORY[0x1E4F28F60];
  id v7 = [MEMORY[0x1E4F28ED0] numberWithLongLong:a4];
  id v8 = [v6 predicateWithFormat:@"%K == %@", @"seasonNumber", v7];
  id v9 = (void *)MEMORY[0x1E4F28F60];
  id v10 = [MEMORY[0x1E4F28ED0] numberWithLongLong:a3];
  uint64_t v11 = [v9 predicateWithFormat:@"%K >= %@", @"episodeNumber", v10];
  uint64_t v12 = [v8 AND:v11];

  id v13 = (void *)MEMORY[0x1E4F28F60];
  id v14 = [MEMORY[0x1E4F28ED0] numberWithLongLong:a4];
  double v15 = [v13 predicateWithFormat:@"%K > %@", @"seasonNumber", v14];

  uint64_t v16 = [v12 OR:v15];

  return v16;
}

+ (id)predicateForHasSomeSeasonNumberWithNoEpisodeNumber
{
  return (id)objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K > 0 && (%K == 0 || %K == NULL)", @"seasonNumber", @"episodeNumber", @"episodeNumber");
}

+ (id)predicateForSeasonNumberWithNoEpisodeNumber:(int64_t)a3
{
  id v3 = (void *)MEMORY[0x1E4F28F60];
  id v4 = [MEMORY[0x1E4F28ED0] numberWithLongLong:a3];
  id v5 = [v3 predicateWithFormat:@"%K == %@ && (%K == 0 || %K == NULL)", @"seasonNumber", v4, @"episodeNumber", @"episodeNumber"];

  return v5;
}

+ (id)predicateForBookmarkedEpisodesExcludingUUIDs:(id)a3
{
  id v3 = a3;
  id v4 = +[MTEpisode predicateForAllBookmarkedEpisodes];
  id v5 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"!(%K IN %@)", @"uuid", v3];

  id v6 = [v4 AND:v5];

  return v6;
}

+ (id)predicateForIsTopLevel
{
  return (id)objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"(%K != NULL) && (%K == %d)", @"flags", @"flags", 1);
}

+ (id)predicateForIsNotTopLevel
{
  return (id)objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"(%K == NULL) || (%K == 0)", @"flags", @"flags");
}

+ (id)predicateForUserSetTopLevelEpisodes
{
  id v3 = [a1 predicateForIsTopLevel];
  id v4 = [a1 predicateForPodcastIsNotHiddenNotImplicitlyFollowed];
  id v5 = [v3 AND:v4];

  return v5;
}

+ (id)predicateForWatchBaseEpisodesIncludingOnlyAudio:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = +[MTEpisode predicateForPodcastIsNotHiddenNotImplicitlyFollowed];
  if (v3)
  {
    id v5 = +[MTEpisode predicateForAudio:1];
    uint64_t v6 = [v4 AND:v5];

    id v4 = (void *)v6;
  }
  return v4;
}

+ (id)predicateForWatchRecentlyPlayed
{
  id v2 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-2592000.0];
  BOOL v3 = [MEMORY[0x1E4F28F60] predicateForDateKey:@"lastDatePlayed" isGreaterThanOrEqualToDate:v2];
  id v4 = +[MTEpisode predicateForPreviouslyPlayedHidingFutureTimestamps];
  id v5 = +[MTEpisode predicateForAudio:1];
  uint64_t v6 = [v4 AND:v5];
  id v7 = [v6 AND:v3];

  return v7;
}

+ (id)predicateForNotPriceType:(int64_t)a3
{
  return (id)[a1 _predicateForPriceType:a3 excluding:1];
}

+ (id)predicateForPriceType:(int64_t)a3
{
  return (id)[a1 _predicateForPriceType:a3 excluding:0];
}

+ (id)predicateForDRMKeyRequired
{
  BOOL v3 = [a1 isHLSEpisode];
  id v4 = [a1 predicateForDownloaded:1 excludeHidden:1];
  id v5 = [v3 AND:v4];

  return v5;
}

+ (id)isHLSEpisode
{
  void v10[3] = *MEMORY[0x1E4F143B8];
  BOOL v3 = (void *)MEMORY[0x1E4F28BA0];
  id v4 = [a1 predicateForPriceType:3];
  id v5 = objc_msgSend(a1, "predicateForPriceType:", 2, v4);
  v10[1] = v5;
  uint64_t v6 = [a1 assetURLIsPackagedMedia];
  v10[2] = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:3];
  id v8 = [v3 orPredicateWithSubpredicates:v7];

  return v8;
}

+ (id)_predicateForPriceType:(int64_t)a3 excluding:(BOOL)a4
{
  return (id)[a1 _predicateForPriceType:a3 forPriceTypeKey:@"priceType" excluding:a4];
}

+ (id)_predicateForPriceType:(int64_t)a3 forPriceTypeKey:(id)a4 excluding:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = (void *)MEMORY[0x1E4F28F60];
  id v8 = a4;
  id v9 = NSPersistentStringForMTEpisodePriceType(a3);
  id v10 = [v7 predicateWithFormat:@"(%K != NULL) && (%K = %@)", v8, v8, v9];

  if (v5)
  {
    uint64_t v11 = [v10 NOT];

    id v10 = (void *)v11;
  }
  return v10;
}

+ (id)predicateForAutomaticDownloadsOnShow:(id)a3 deletePlayedEpisodes:(BOOL)a4 episodeLimit:(int64_t)a5 serialNextEpisodesSort:(BOOL)a6 includePlayableWithoutAccount:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  BOOL v10 = a4;
  id v12 = a3;
  if (os_feature_enable_use_optimized_predicate()) {
    [a1 optimizedPredicateForAutomaticDownloadsOnShow:v12 deletePlayedEpisodes:v10 episodeLimit:a5 serialNextEpisodesSort:v8 includePlayableWithoutAccount:v7];
  }
  else {
  id v13 = [a1 legacyPredicateForAutomaticDownloadsOnShow:v12 deletePlayedEpisodes:v10 episodeLimit:a5 serialNextEpisodesSort:v8 includePlayableWithoutAccount:v7];
  }

  return v13;
}

+ (id)optimizedPredicateForAutomaticDownloadsOnShow:(id)a3 deletePlayedEpisodes:(BOOL)a4 episodeLimit:(int64_t)a5 serialNextEpisodesSort:(BOOL)a6 includePlayableWithoutAccount:(BOOL)a7
{
  BOOL v52 = a7;
  v61[2] = *MEMORY[0x1E4F143B8];
  id v53 = a3;
  uint64_t v9 = +[MTEpisode predicateForVisuallyPlayed:0];
  BOOL v10 = (void *)v9;
  if (!a4)
  {
    uint64_t v11 = (void *)MEMORY[0x1E4F28BA0];
    v61[0] = v9;
    id v12 = +[MTEpisode predicateForPlayStateManuallySet:0];
    v61[1] = v12;
    id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v61 count:2];
    uint64_t v14 = [v11 orPredicateWithSubpredicates:v13];

    BOOL v10 = (void *)v14;
  }
  v51 = v10;
  double v15 = (void *)MEMORY[0x1E4F28BA0];
  uint64_t v16 = +[MTEpisode predicateForEpisodesDeterminedByLimitSettings:a5];
  v60[0] = v16;
  uint64_t v17 = +[MTEpisode predicateForDownloadLimitForEpisodeLimit:a5];
  v60[1] = v17;
  uint64_t v18 = (void *)MEMORY[0x1E4F28BA0];
  v59[0] = v10;
  char v19 = +[MTEpisode predicateForIsBackCatalogItem];
  v58[0] = v19;
  id v20 = +[MTEpisode predicateForPlayStateManuallySet:1];
  v58[1] = v20;
  uint64_t v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v58 count:2];
  id v22 = [v18 andPredicateWithSubpredicates:v21];
  v59[1] = v22;
  char v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v59 count:2];
  int v24 = [v18 orPredicateWithSubpredicates:v23];
  v60[2] = v24;
  uint64_t v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v60 count:3];
  v50 = [v15 andPredicateWithSubpredicates:v25];

  __int16 v26 = (void *)MEMORY[0x1E4F28BA0];
  int64_t v27 = +[MTEpisode predicateForDownloadBehavior:0];
  v57[0] = v27;
  __int16 v28 = +[MTEpisode predicateForPlayStateManuallySet:1];
  v57[1] = v28;
  int v29 = +[MTEpisode predicateForPlayed:0];
  v57[2] = v29;
  __int16 v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v57 count:3];
  v49 = [v26 andPredicateWithSubpredicates:v30];

  BOOL v31 = (void *)MEMORY[0x1E4F28BA0];
  __int16 v32 = +[MTEpisode predicateForIsFromiTunesSync:1];
  v56[0] = v32;
  v56[1] = v50;
  v56[2] = v49;
  int v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:v56 count:3];
  __int16 v34 = [v31 orPredicateWithSubpredicates:v33];

  v35 = (void *)MEMORY[0x1E4F28BA0];
  __int16 v36 = +[MTEpisode predicateForDownloaded:0 excludeHidden:1];
  v55[0] = v36;
  v37 = +[MTEpisode predicateForPlayed:0];
  v55[1] = v37;
  uint64_t v38 = +[MTEpisode predicateForPlayableEpisode:v52];
  v55[2] = v38;
  v39 = +[MTEpisode predicateForFeedDeleted:0];
  v55[3] = v39;
  v40 = +[MTEpisode predicateForDownloadBehavior:0];
  v55[4] = v40;
  v41 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K != NULL", @"enclosureURL");
  v55[5] = v41;
  v42 = [MEMORY[0x1E4F1C978] arrayWithObjects:v55 count:6];
  v43 = [v35 andPredicateWithSubpredicates:v42];

  v44 = (void *)MEMORY[0x1E4F28BA0];
  v45 = +[MTEpisode predicateForAllEpisodesOnPodcastUuid:v53];

  v54[0] = v45;
  v54[1] = v43;
  v54[2] = v34;
  v46 = [MEMORY[0x1E4F1C978] arrayWithObjects:v54 count:3];
  v47 = [v44 andPredicateWithSubpredicates:v46];

  return v47;
}

+ (id)legacyPredicateForAutomaticDownloadsOnShow:(id)a3 deletePlayedEpisodes:(BOOL)a4 episodeLimit:(int64_t)a5 serialNextEpisodesSort:(BOOL)a6 includePlayableWithoutAccount:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  BOOL v10 = a4;
  id v11 = a3;
  id v12 = +[MTEpisode predicateForUserEpisodesOnPodcastUuid:v11 episodeLimit:a5 deletePlayedEpisodes:v10 limitToDownloadBehaviorAutomatic:1];
  id v13 = +[MTEpisode predicateForDownloadLimitForEpisodeLimit:a5];
  uint64_t v14 = [v12 AND:v13];

  double v15 = +[MTEpisode predicateForDownloadBehavior:0];
  if (v8)
  {
    uint64_t v16 = +[MTEpisode predicateForDownloadBehavior:1];
    uint64_t v17 = [v15 OR:v16];
    uint64_t v18 = [v14 AND:v17];

    uint64_t v14 = (void *)v16;
  }
  else
  {
    uint64_t v18 = [v14 AND:v15];
  }

  char v19 = +[MTEpisode predicateForFeedDeleted:0];
  id v20 = [v18 AND:v19];

  uint64_t v21 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K != NULL", @"enclosureURL");
  id v22 = [v20 AND:v21];

  char v23 = +[MTEpisode predicateForEntitledEpisodes];
  int v24 = [v22 AND:v23];

  if (v7)
  {
    uint64_t v25 = +[MTEpisode predicateForEpisodesPlayableWithoutAccount];
    uint64_t v26 = [v24 AND:v25];

    int v24 = (void *)v26;
  }
  if (v8) {
    +[MTEpisode predicateForVisuallyPlayed:0];
  }
  else {
  int64_t v27 = +[MTEpisode predicateForPlayed:0];
  }
  __int16 v28 = [v24 AND:v27];

  int v29 = +[MTEpisode predicateForDownloaded:0 excludeHidden:1];
  __int16 v30 = [v28 AND:v29];

  BOOL v31 = +[MTEpisode predicateForAllEpisodesOnPodcastUuid:v11];

  __int16 v32 = [v30 AND:v31];

  return v32;
}

+ (id)predicateForPlayableEpisode:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = +[MTEpisode predicateForEntitledEpisodes];
  if (v3)
  {
    BOOL v5 = +[MTEpisode predicateForEpisodesPlayableWithoutAccount];
    uint64_t v6 = [v4 AND:v5];

    id v4 = (void *)v6;
  }
  return v4;
}

+ (id)predicateForEpisodesThatShouldBeAutodownloadedForShow:(id)a3 deletePlayedEpisodes:(BOOL)a4 episodeLimit:(int64_t)a5 serialNextEpisodesSort:(BOOL)a6 includePlayableWithoutAccount:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  BOOL v10 = a4;
  id v11 = a3;
  id v12 = +[MTEpisode predicateForUserEpisodesOnPodcastUuid:v11 episodeLimit:a5 deletePlayedEpisodes:v10 limitToDownloadBehaviorAutomatic:1];
  id v13 = +[MTEpisode predicateForDownloadBehavior:0];
  uint64_t v14 = +[MTEpisode predicateForDownloadBehavior:1];
  double v15 = [v13 OR:v14];
  uint64_t v16 = [v12 AND:v15];

  uint64_t v17 = +[MTEpisode predicateForFeedDeleted:0];
  uint64_t v18 = [v16 AND:v17];

  char v19 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K != NULL", @"enclosureURL");
  id v20 = [v18 AND:v19];

  uint64_t v21 = +[MTEpisode predicateForEntitledEpisodes];
  id v22 = [v20 AND:v21];

  if (v7)
  {
    char v23 = +[MTEpisode predicateForEpisodesPlayableWithoutAccount];
    uint64_t v24 = [v22 AND:v23];

    id v22 = (void *)v24;
  }
  if (v8) {
    +[MTEpisode predicateForVisuallyPlayed:0];
  }
  else {
  uint64_t v25 = +[MTEpisode predicateForPlayed:0];
  }
  uint64_t v26 = [v22 AND:v25];

  int64_t v27 = +[MTEpisode predicateForAllEpisodesOnPodcastUuid:v11];

  __int16 v28 = [v26 AND:v27];

  return v28;
}

+ (id)predicateForAutomaticDeletionOnShow:(id)a3 deletePlayedEpisodes:(BOOL)a4 episodeLimit:(int64_t)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  uint64_t v9 = [a1 predicateForAutomaticDeletionOnShow:v8 deletePlayedEpisodes:v6 episodeLimit:a5 useOptimizedPredicate:os_feature_enable_use_optimized_predicate()];

  return v9;
}

+ (id)predicateForAutomaticDeletionOnShow:(id)a3 deletePlayedEpisodes:(BOOL)a4 episodeLimit:(int64_t)a5 useOptimizedPredicate:(BOOL)a6
{
  if (a6) {
    [a1 optimizedPredicateForAutomaticDeletionOnShow:a3 deletePlayedEpisodes:a4 episodeLimit:a5];
  }
  else {
  BOOL v6 = [a1 legacyPredicateForAutomaticDeletionOnShow:a3 deletePlayedEpisodes:a4 episodeLimit:a5];
  }
  return v6;
}

+ (id)optimizedPredicateForAutomaticDeletionOnShow:(id)a3 deletePlayedEpisodes:(BOOL)a4 episodeLimit:(int64_t)a5
{
  BOOL v6 = a4;
  v18[4] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  uint64_t v9 = [a1 predicateForEpisodesToPreserveForUser:v6 episodeLimit:a5];
  BOOL v10 = (void *)MEMORY[0x1E4F28BA0];
  id v11 = +[MTEpisode predicateForAllEpisodesOnPodcastUuid:v8];

  v18[0] = v11;
  id v12 = [a1 predicateForDownloaded:1];
  v18[1] = v12;
  id v13 = [a1 optimizedRemovalPredicateForRecentlyPlayed:v6];
  v18[2] = v13;
  uint64_t v14 = [MEMORY[0x1E4F28BA0] notPredicateWithSubpredicate:v9];
  v18[3] = v14;
  double v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:4];
  uint64_t v16 = [v10 andPredicateWithSubpredicates:v15];

  return v16;
}

+ (id)predicateForEpisodesToPreserveForUser:(BOOL)a3 episodeLimit:(int64_t)a4
{
  BOOL v4 = a3;
  v17[3] = *MEMORY[0x1E4F143B8];
  BOOL v6 = (void *)MEMORY[0x1E4F28BA0];
  BOOL v7 = [a1 predicateForEpisodesDeterminedByLimitSettings:a4];
  id v8 = objc_msgSend(a1, "optimizedPredicatePlaystateForPreservation:", v4, v7);
  v16[1] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
  BOOL v10 = [v6 andPredicateWithSubpredicates:v9];
  v17[0] = v10;
  id v11 = [a1 predicateForUserPreservedDownload:v4];
  v17[1] = v11;
  id v12 = [a1 predicateForIsFromiTunesSync:1];
  v17[2] = v12;
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:3];
  uint64_t v14 = [v6 orPredicateWithSubpredicates:v13];

  return v14;
}

+ (id)predicateForUserPreservedDownload:(BOOL)a3
{
  BOOL v3 = a3;
  v21[2] = *MEMORY[0x1E4F143B8];
  BOOL v5 = (void *)MEMORY[0x1E4F28BA0];
  BOOL v6 = [a1 predicateForDownloadBehavior:4];
  v21[0] = v6;
  BOOL v7 = (void *)MEMORY[0x1E4F28BA0];
  id v8 = [a1 predicateForDownloadBehavior:2];
  v20[0] = v8;
  uint64_t v9 = (void *)MEMORY[0x1E4F28BA0];
  BOOL v10 = [a1 optimizedPredicatePlaystateForPreservation:v3];
  v19[0] = v10;
  id v11 = [a1 predicateForIsBackCatalogItem];
  v19[1] = v11;
  id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
  id v13 = [v9 orPredicateWithSubpredicates:v12];
  v20[1] = v13;
  uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:2];
  double v15 = [v7 andPredicateWithSubpredicates:v14];
  v21[1] = v15;
  uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:2];
  uint64_t v17 = [v5 orPredicateWithSubpredicates:v16];

  return v17;
}

+ (id)optimizedPredicateForPlayedEpisodePreservation:(BOOL)a3
{
  BOOL v3 = a3;
  void v20[2] = *MEMORY[0x1E4F143B8];
  BOOL v5 = (void *)MEMORY[0x1E4F28BA0];
  BOOL v6 = [a1 predicateForPlayed:0];
  v20[0] = v6;
  BOOL v7 = [a1 predicateForIsBackCatalogItem];
  v20[1] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:2];
  uint64_t v9 = [v5 orPredicateWithSubpredicates:v8];

  if (v3)
  {
    BOOL v10 = (void *)MEMORY[0x1E4F28BA0];
    v19[0] = v9;
    id v11 = [a1 predicateForPlayed:1];
    v18[0] = v11;
    id v12 = [a1 predicateForPlayStateManuallySet:0];
    v18[1] = v12;
    id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
    uint64_t v14 = [v10 orPredicateWithSubpredicates:v13];
    v19[1] = v14;
    double v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
    uint64_t v16 = [v10 orPredicateWithSubpredicates:v15];

    uint64_t v9 = (void *)v16;
  }
  return v9;
}

+ (id)optimizedPredicatePlaystateForPreservation:(BOOL)a3
{
  if (a3)
  {
    BOOL v4 = [a1 predicateForPlayed:0];
    BOOL v5 = [a1 predicateForIsBackCatalogItem];
    BOOL v6 = [v4 OR:v5];
  }
  else
  {
    BOOL v6 = [MEMORY[0x1E4F28F60] truePredicate];
  }
  return v6;
}

+ (id)optimizedRemovalPredicateForRecentlyPlayed:(BOOL)a3
{
  void v17[4] = *MEMORY[0x1E4F143B8];
  BOOL v4 = (void *)MEMORY[0x1E4F28BA0];
  if (a3)
  {
    BOOL v5 = [a1 predicateForPlayed:1];
    v17[0] = v5;
    BOOL v6 = [a1 predicateForRecentlyPlayed];
    v17[1] = v6;
    BOOL v7 = [a1 predicateForPlayStateManuallySet:0];
    v17[2] = v7;
    id v8 = [a1 predicateForIsFromiTunesSync:0];
    v17[3] = v8;
    uint64_t v9 = (void *)MEMORY[0x1E4F1C978];
    BOOL v10 = v17;
    uint64_t v11 = 4;
  }
  else
  {
    BOOL v5 = [a1 predicateForDownloadBehavior:4];
    BOOL v6 = objc_msgSend(a1, "predicateForPlayed:", 1, v5);
    v16[1] = v6;
    BOOL v7 = [a1 predicateForIsBackCatalogItem];
    id v8 = [v7 NOT];
    void v16[2] = v8;
    uint64_t v9 = (void *)MEMORY[0x1E4F1C978];
    BOOL v10 = v16;
    uint64_t v11 = 3;
  }
  id v12 = [v9 arrayWithObjects:v10 count:v11];
  id v13 = [v4 andPredicateWithSubpredicates:v12];

  uint64_t v14 = [v13 NOT];

  return v14;
}

+ (id)legacyPredicateForAutomaticDeletionOnShow:(id)a3 deletePlayedEpisodes:(BOOL)a4 episodeLimit:(int64_t)a5
{
  BOOL v6 = a4;
  id v7 = a3;
  int v29 = +[MTEpisode predicateForUserEpisodesOnPodcastUuid:v7 episodeLimit:a5 deletePlayedEpisodes:v6 limitToDownloadBehaviorAutomatic:0];
  id v8 = [v29 NOT];
  uint64_t v9 = +[MTEpisode predicateForDownloadBehavior:4];
  BOOL v10 = [v9 NOT];
  uint64_t v11 = [v8 AND:v10];

  id v12 = (void *)MEMORY[0x1E4F28BA0];
  id v13 = +[MTEpisode predicateForDownloadBehavior:2];
  uint64_t v14 = +[MTEpisode predicateForVisuallyPlayed:0];
  double v15 = [v13 AND:v14];
  uint64_t v16 = [v12 notPredicateWithSubpredicate:v15];
  uint64_t v17 = [v11 AND:v16];

  uint64_t v18 = (void *)MEMORY[0x1E4F28BA0];
  if (v6)
  {
    char v19 = +[MTEpisode predicateForRecentlyPlayedEpisodesToBeDeletedOnPodcastUuid:v7 deletePlayedEpisodes:1];
    id v20 = [v18 notPredicateWithSubpredicate:v19];
    uint64_t v21 = [v17 AND:v20];
  }
  else
  {
    char v19 = +[MTEpisode predicateForDownloadBehavior:2];
    id v20 = +[MTEpisode predicateForVisuallyPlayed:1];
    uint64_t v22 = [v19 AND:v20];
    char v23 = [v18 notPredicateWithSubpredicate:v22];
    uint64_t v21 = [v17 AND:v23];

    uint64_t v17 = (void *)v22;
  }

  uint64_t v24 = +[MTEpisode predicateForDownloaded:1 excludeHidden:1];
  uint64_t v25 = [v21 AND:v24];

  uint64_t v26 = +[MTEpisode predicateForAllEpisodesOnPodcastUuid:v7];
  int64_t v27 = [v25 AND:v26];

  return v27;
}

- (int64_t)bookmarksSyncType
{
  id v2 = self;
  id v3 = [(MTEpisode *)v2 priceType];
  if (v3)
  {
    BOOL v4 = v3;
    sub_1ACE761B8();
  }
  BOOL v5 = (void *)sub_1ACE76178();
  swift_bridgeObjectRelease();
  uint64_t v6 = MTEpisodePriceTypeFromPersistentString(v5);

  return (unint64_t)(v6 - 2) < 3;
}

- (void)markAsBookmarked
{
  id v2 = self;
  if (([(MTEpisode *)v2 isBookmarked] & 1) == 0)
  {
    sub_1ACE74FC8();
    -[MTEpisode markAsBookmarkedOnTimestamp:](v2, sel_markAsBookmarkedOnTimestamp_);
  }
}

- (void)markAsBookmarkedOnTimestamp:(double)a3
{
  BOOL v5 = self;
  [(MTEpisode *)v5 setIsBookmarked:1];
  [(MTEpisode *)v5 lastBookmarkedDate];
  if (v4 < a3) {
    [(MTEpisode *)v5 setLastBookmarkedDate:a3];
  }
}

- (void)markAsUnbookmarked
{
  id v2 = self;
  if ([(MTEpisode *)v2 isBookmarked]) {
    [(MTEpisode *)v2 setIsBookmarked:0];
  }
}

- (NSAttributedString)attributedDescriptionFromHTML
{
  id v2 = self;
  id v3 = MTEpisode.attributedDescriptionFromHTML.getter();

  return (NSAttributedString *)v3;
}

- (void)setAttributedDescriptionFromHTML:(id)a3
{
  id v5 = a3;
  uint64_t v6 = self;
  MTEpisode.attributedDescriptionFromHTML.setter(a3);
}

+ (id)predicateForAutomaticallyDownloadedEpisodes
{
  id v2 = _sSo9MTEpisodeC18PodcastsFoundationE43predicateForAutomaticallyDownloadedEpisodesSo11NSPredicateCyFZ_0();
  return v2;
}

- (void)resolveAvailabilityDate
{
  id v2 = self;
  MTEpisode.resolveAvailabilityDate()();
}

- (BOOL)isDownloadable
{
  return ![(MTEpisode *)self isExternalType];
}

@end