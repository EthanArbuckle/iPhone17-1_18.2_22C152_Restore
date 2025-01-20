@interface NCNotificationRootList
+ (NSSet)presentableTypes;
+ (id)sharedInstance;
- (BOOL)_areHighlightsEnabled;
- (BOOL)_hasLiveActivitiesWithThreshold:(int64_t)a3;
- (BOOL)_isAdditionalPanGestureActive;
- (BOOL)_isAlertingNotificationRequest:(id)a3;
- (BOOL)_isCriticalNotificationRequest:(id)a3;
- (BOOL)_isCurrentDigestListAboveHistorySectionList;
- (BOOL)_isCurrentDigestListInHistorySectionList;
- (BOOL)_isCurrentDigestListInMissedSectionList;
- (BOOL)_isCurrentListDisplayStyleSettingEqualTo:(int64_t)a3;
- (BOOL)_isEligibleForStackElevationMigrationWithGroupList:(id)a3 areGenerativeModelsAvailable:(BOOL)a4;
- (BOOL)_isLockScreenPersistenceNotificationRequest:(id)a3;
- (BOOL)_isNotificationRequest:(id)a3 forSectionList:(id)a4;
- (BOOL)_isPersistentStateCurrentDigestInMissedSection;
- (BOOL)_isRequestEligibleForStackElevation:(id)a3;
- (BOOL)_shouldInsertCurrentDigestIntoMissedSectionList;
- (BOOL)_shouldInsertNotificationRequestToHighlightedSectionList:(id)a3;
- (BOOL)_shouldInsertNotificationRequestToProminentIncomingSectionList:(id)a3;
- (BOOL)_suppressesCurrentDigestForNotifications;
- (BOOL)_suppressesForLists:(id)a3 forProminentContentThreshold:(int64_t)a4;
- (BOOL)_suppressesHighlightsPlatterForNotifications;
- (BOOL)adjustForContentSizeCategoryChange;
- (BOOL)adjustsFontForContentSizeCategory;
- (BOOL)containsNotificationRequest:(id)a3;
- (BOOL)deferCurrentDigestPresentationForPersistedDataLoad;
- (BOOL)deferDigestMigration;
- (BOOL)deviceAuthenticated;
- (BOOL)expandsVisibleRegionOnSignificantScroll;
- (BOOL)handleTapOnNotificationListBaseComponent:(id)a3;
- (BOOL)hasVisibleContentToReveal;
- (BOOL)hasVisibleUrgentBreakthroughContent;
- (BOOL)isListDisplayStyleHiddenForUserInteraction;
- (BOOL)isMissedSectionActive;
- (BOOL)isNotificationHistoryRevealed;
- (BOOL)isOnboardingSummaryVisible;
- (BOOL)isPerformingClearAll;
- (BOOL)isScheduledDeliveryEnabled;
- (BOOL)isScrollingListContent;
- (BOOL)isUpcomingDigestVisible;
- (BOOL)notificationStructuredSectionList:(id)a3 areNotificationsLoadedForSectionIdentifier:(id)a4;
- (BOOL)notificationStructuredSectionList:(id)a3 shouldFilterNotificationRequest:(id)a4;
- (BOOL)overrideMigrationToHistory;
- (BOOL)respondsToSelector:(SEL)a3;
- (BOOL)shouldDelayDeliveryOfNotificationRequest:(id)a3;
- (BOOL)shouldScrollToTopForNotificationListBaseComponent:(id)a3;
- (BOOL)suggestionManager:(id)a3 isSummaryVisibleForNotificationRequest:(id)a4;
- (BOOL)suggestionManager:(id)a3 isThreadSummaryVisibleForNotificationRequest:(id)a4;
- (CGRect)aggregatedVisibleContentExtent;
- (Class)notificationListCacheNotificationViewControllerClass:(id)a3;
- (DNDModeConfiguration)activeDNDModeConfiguration;
- (NCDigestScheduleManager)digestScheduleManager;
- (NCNotificationCombinedSectionList)historySectionList;
- (NCNotificationListCache)notificationListCache;
- (NCNotificationListCache)notificationSummaryCache;
- (NCNotificationListCache)supplementaryCache;
- (NCNotificationListMigrationScheduler)migrationScheduler;
- (NCNotificationListPersistentStateManager)persistentStateManager;
- (NCNotificationListStalenessEventTracker)notificationListStalenessEventTracker;
- (NCNotificationListViewProtocol)rootListView;
- (NCNotificationRootList)initWithListView:(id)a3;
- (NCNotificationRootListDelegate)delegate;
- (NCNotificationStructuredSectionList)criticalSectionList;
- (NCNotificationStructuredSectionList)highlightedSectionList;
- (NCNotificationStructuredSectionList)incomingSectionList;
- (NCNotificationStructuredSectionList)prominentIncomingSectionList;
- (NCNotificationSummarizedSectionList)currentDigestSectionList;
- (NCNotificationSummarizedSectionList)upcomingDigestSectionList;
- (NCNotificationSummarizedSectionList)upcomingMissedSectionList;
- (NCSuggestionManager)suggestionManager;
- (NSDate)comparisonDate;
- (NSDictionary)persistentStoredListInfo;
- (NSMutableArray)notificationRequestsPendingMigration;
- (NSMutableArray)notificationSections;
- (NSMutableArray)supplementaryViewsSections;
- (NSMutableDictionary)notificationListDisplayStyleSettingsForReason;
- (NSMutableSet)loadedNotificationSections;
- (NSString)currentListDisplayStyleSettingReason;
- (NSString)incomingTitle;
- (NSString)logDescription;
- (UILabel)overrideMigrationOverlayLabel;
- (double)footerViewHeightForNotificationList:(id)a3 withWidth:(double)a4;
- (double)notificationListView:(id)a3 heightForItemAtIndex:(unint64_t)a4 withWidth:(double)a5;
- (double)overrideNotificationMigrateHighlightToHistoryTimeIntervalKey;
- (double)overrideNotificationMigrateTimeSensitiveToHistoryTimeIntervalKey;
- (double)scrollViewVisibleContentLayoutOffsetY;
- (id)_digestTestRecipe;
- (id)_filterNotificationsInGroupLists:(id)a3 withDestinationsForSectionList:(id)a4;
- (id)_higherSectionToElevateForNotificationRequest:(id)a3 currentSectionType:(unint64_t)a4;
- (id)_insertNotificationRequest:(id)a3;
- (id)_listInfoForPersistentState;
- (id)_listInfoForStateCapture;
- (id)_missedSectionTitleForDNDMode:(id)a3;
- (id)_newDigestSectionListWithTitle:(id)a3 sectionType:(unint64_t)a4 summaryOrderProvider:(id)a5 logDescription:(id)a6;
- (id)_newMissedSectionWithTitle:(id)a3 summaryHeading:(id)a4 logDescription:(id)a5 dndMode:(id)a6;
- (id)_newSummaryOrderProviderOfType:(unint64_t)a3 fromSummaryOrderProvider:(id)a4;
- (id)_newSummaryOrderProviderOfType:(unint64_t)a3 summaryHeading:(id)a4 summaryDate:(id)a5 atxDigestDeliveryTime:(int64_t)a6 isOnboardingSummary:(BOOL)a7;
- (id)_notificationListSections;
- (id)_notificationMigrationOverrideTestRecipe;
- (id)_notificationSectionListsForEnumeration;
- (id)_sectionContainsNotificationRequest:(id)a3;
- (id)_sectionForInsertingNotificationRequest:(id)a3;
- (id)_sectionForStoredNotificationRequestOfSectionType:(unint64_t)a3;
- (id)_sectionListsForPersistentState;
- (id)_sectionListsThatSuppressDigest;
- (id)_sectionListsThatSuppressLargeFormatContent;
- (id)_sectionOfSectionType:(unint64_t)a3;
- (id)_sectionsForStateDump;
- (id)_visibleNotificationRequests;
- (id)activeDNDMode;
- (id)initForTesting;
- (id)insertSupplementaryViewsContainerAtListPosition:(unint64_t)a3 identifier:(id)a4 withDescription:(id)a5;
- (id)matchingRequestForRequest:(id)a3 inList:(id)a4;
- (id)notificationListView:(id)a3 viewForItemAtIndex:(unint64_t)a4;
- (id)notificationRequestWithNotificationIdentifier:(id)a3 sectionIdentifier:(id)a4;
- (id)notificationStructuredSectionList:(id)a3 requestsAuxiliaryOptionsContentProviderForNotificationRequest:(id)a4 isLongLook:(BOOL)a5;
- (id)suggestionManager:(id)a3 notificationRequestForUUID:(id)a4;
- (id)suggestionManager:(id)a3 requestsSectionSettingsForSectionIdentifier:(id)a4;
- (id)suggestionManagerRequestsCurrentModeConfiguration:(id)a3;
- (int64_t)_atxDigestDeliveryTimeForDeliveryOrder:(int64_t)a3;
- (int64_t)_numberOfLiveActivities;
- (int64_t)currentListDisplayStyleSetting;
- (unint64_t)_indexForReveal;
- (unint64_t)_upcomingDigestSectionListIndexInHistorySectionList;
- (unint64_t)count;
- (unint64_t)historyCount;
- (unint64_t)incomingCount;
- (unint64_t)notificationCount;
- (unint64_t)notificationListViewNumberOfItems:(id)a3;
- (unint64_t)totalNotificationCount;
- (unint64_t)visibleNotificationCount;
- (void)_addStateCaptureBlock;
- (void)_cancelTouchesOnLiveActivities:(BOOL)a3;
- (void)_checkAndReloadSuggestionForNotificationRequest:(id)a3;
- (void)_clearAllNotifications:(BOOL)a3 supplementaryViewControllers:(BOOL)a4;
- (void)_configureCurrentDigestSectionListWithDigestInfo:(id)a3 sectionType:(unint64_t)a4 summaryOrderProviderType:(unint64_t)a5;
- (void)_configureHighlightsSectionListIfNeeded;
- (void)_configureNotificationSectionList:(id)a3 notificationCache:(id)a4 notificationListViewRevealed:(BOOL)a5 logDescription:(id)a6;
- (void)_configureOverrideMigrationOverlayLabelIfNecessary;
- (void)_configureUpcomingDigestSectionListWithDigestInfo:(id)a3;
- (void)_configureUpcomingMissedSectionForDNDMode:(id)a3;
- (void)_dissolveCurrentDigestSectionListToHistorySection;
- (void)_dissolveUpcomingDigestSectionListToHistorySection;
- (void)_elevateGroupInOtherSectionsIfNeededWithRequest:(id)a3 toSection:(id)a4;
- (void)_insertCurrentDigestSectionList;
- (void)_insertCurrentDigestSectionListToHistorySectionList;
- (void)_insertCurrentDigestSectionListToMissedSectionList;
- (void)_insertCurrentDigestSectionListToSectionList:(id)a3 atIndex:(unint64_t)a4;
- (void)_insertSectionListInHistorySectionList:(id)a3 atIndex:(unint64_t)a4 animated:(BOOL)a5;
- (void)_migrateCurrentDigestSectionListToReadSection;
- (void)_migrateNonActiveHighlightNotificationRequestsFromHighlightToIncomingSection:(id)a3;
- (void)_migrateNotificationsFromList:(id)a3 toList:(id)a4 passingTest:(id)a5 filterRequestsPassingTest:(id)a6 hideToList:(BOOL)a7 clearRequests:(BOOL)a8 filterForDestination:(BOOL)a9 animateRemoval:(BOOL)a10 reorderGroupNotifications:(BOOL)a11;
- (void)_migrateNotificationsFromProminentIncomingSectionToIncomingSection;
- (void)_migrateOnScheduleNotificationRequests:(id)a3 fromSection:(id)a4 toSection:(id)a5 clearRequests:(BOOL)a6 filterForDestination:(BOOL)a7 animateRemoval:(BOOL)a8;
- (void)_migrateOnScheduleNotificationRequestsFromIncomingSectionToHistorySection:(id)a3;
- (void)_migrateOnScheduleNotificationRequestsFromProminentIncomingSectionToIncomingSection:(id)a3;
- (void)_migrateUpcomingDigestSectionListToCurrentDigestSectionList;
- (void)_migrateUpcomingMissedSectionToIncoming;
- (void)_notificationListDidChangeContent;
- (void)_performDeferredMigrationIfNecessary;
- (void)_regroupAllNotificationGroups;
- (void)_removeCurrentDigestSectionList;
- (void)_removeCurrentDigestSectionListFromContainingSectionList;
- (void)_removeCurrentDigestSectionListFromHistorySectionList;
- (void)_removeCurrentDigestSectionListFromMissedSectionList;
- (void)_removeCurrentDigestSectionListFromSectionList:(id)a3;
- (void)_removeSectionListInHistorySectionList:(id)a3 animated:(BOOL)a4;
- (void)_scheduleAllNotificationRequestsForMigrationFromHighlightList;
- (void)_scheduleNotificationDigestMigrationIfNecessary;
- (void)_scheduleNotificationRequestsForMigrationFromIncomingListPassingTest:(id)a3;
- (void)_setHighlightsFeatureEnabled:(BOOL)a3;
- (void)_setNotificationHistoryWasRevealed:(BOOL)a3;
- (void)_setupNotificationSectionLists;
- (void)_signpostScrollingBegan:(BOOL)a3;
- (void)_sortNotificationGroupsIfNecessary;
- (void)_toggleCurrentDigestSectionListVisibility;
- (void)_toggleCurrentDigestSectionListVisibilityInHistorySection;
- (void)_toggleUpcomingDigestSectionListVisibility;
- (void)_toggleUpcomingMissedSectionListVisibility;
- (void)_toggleVisibilityInHistorySectionListForSectionList:(id)a3 atIndex:(unint64_t)a4 isSectionHidden:(BOOL)a5 animated:(BOOL)a6;
- (void)_updateDelegateAndSubclassIfNecessaryOfContentChange;
- (void)_updateForceExpansionForHighlights;
- (void)_updateNotificationListDisplayStyleSetting;
- (void)_updateNotificationListPersistentState;
- (void)_updateOverrideMigrationOverlayLabelWithText:(id)a3 forOverrideState:(BOOL)a4;
- (void)_updateSystemSettingsForUpdatedNotificationListDisplayStyleSetting:(int64_t)a3;
- (void)_updateUpcomingDigestSectionListWithDigestInfo:(id)a3;
- (void)_updateVisibilityForSectionLists;
- (void)_updateVisibilityOfHistorySection;
- (void)_updateVisibleRectForContentOffset:(CGPoint)a3 size:(CGSize)a4;
- (void)_upgradeCurrentDigestSectionListForPromotionAboveFold;
- (void)adjustForLegibilitySettingsChange:(id)a3;
- (void)clearAll;
- (void)collapseGroupForNotificationRequest:(id)a3 withCompletion:(id)a4;
- (void)didTapCountIndicator;
- (void)expandGroupForNotificationRequest:(id)a3 withCompletion:(id)a4;
- (void)forwardInvocation:(id)a3;
- (void)handleWake:(BOOL)a3;
- (void)listViewControllerPresentedByUserAction;
- (void)migrateNotificationsFromIncomingSectionToHistorySection;
- (void)migrateNotificationsFromIncomingSectionToHistorySectionAndHideHistorySection:(BOOL)a3;
- (void)modifyNotificationRequest:(id)a3;
- (void)notificationListBaseComponentDidRemoveAll:(id)a3;
- (void)notificationListBaseComponentRequestsClearingAll:(id)a3;
- (void)notificationListComponent:(id)a3 didRemoveNotificationRequest:(id)a4;
- (void)notificationListDidLayoutSubviews;
- (void)notificationListMigrationScheduler:(id)a3 requestsMigratingNotificationRequests:(id)a4;
- (void)notificationListMigrationSchedulerRequestsMigratingNotificationDigest:(id)a3;
- (void)notificationStructuredSectionList:(id)a3 transitionedGroupedStateIsGrouped:(BOOL)a4;
- (void)notificationStructuredSectionListDidClearAllNotificationRequests:(id)a3;
- (void)notificationStructuredSectionListRequestsClearingSection:(id)a3;
- (void)notificationsLoadedForSectionIdentifier:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)persistentStateManager:(id)a3 didFetchMigrationTime:(id)a4 forNotificationRequest:(id)a5;
- (void)persistentStateManager:(id)a3 didFetchStoredListInfo:(id)a4;
- (void)persistentStateManager:(id)a3 didFetchSummaryMigrationTime:(id)a4;
- (void)persistentStateManager:(id)a3 didMigratedTimeSensitiveForNotificationRequest:(id)a4;
- (void)persistentStateManager:(id)a3 finishedLoadingDataForSectionType:(unint64_t)a4;
- (void)persistentStateManager:(id)a3 hasStoredDataForSectionType:(unint64_t)a4;
- (void)prepareForUIAppear;
- (void)publishScheduledDigest:(id)a3 upcomingDigest:(id)a4;
- (void)publishUpcomingDigest:(id)a3;
- (void)recycleView:(id)a3;
- (void)reloadNotificationRequest:(id)a3;
- (void)reloadRemoteSuggestions;
- (void)removeNotificationRequest:(id)a3;
- (void)removeOverrideNotificationListDisplayStyleSettingForReason:(id)a3;
- (void)revokeUpcomingDigest:(id)a3;
- (void)setActiveDNDModeConfiguration:(id)a3;
- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3;
- (void)setAggregatedVisibleContentExtent:(CGRect)a3;
- (void)setCriticalSectionList:(id)a3;
- (void)setCurrentDigestSectionList:(id)a3;
- (void)setCurrentListDisplayStyleSetting:(int64_t)a3;
- (void)setCurrentListDisplayStyleSettingReason:(id)a3;
- (void)setDeferCurrentDigestPresentationForPersistedDataLoad:(BOOL)a3;
- (void)setDeferDigestMigration:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setDeviceAuthenticated:(BOOL)a3;
- (void)setDigestScheduleManager:(id)a3;
- (void)setExpandsVisibleRegionOnSignificantScroll:(BOOL)a3;
- (void)setHighlightedSectionList:(id)a3;
- (void)setHistorySectionList:(id)a3;
- (void)setIncomingSectionList:(id)a3;
- (void)setListDisplayStyleHiddenForUserInteraction:(BOOL)a3;
- (void)setLoadedNotificationSections:(id)a3;
- (void)setLogDescription:(id)a3;
- (void)setMigrationScheduler:(id)a3;
- (void)setMissedSectionActive:(BOOL)a3;
- (void)setNotificationHistoryRevealed:(BOOL)a3;
- (void)setNotificationListCache:(id)a3;
- (void)setNotificationListDisplayStyleSettingsForReason:(id)a3;
- (void)setNotificationListStalenessEventTracker:(id)a3;
- (void)setNotificationRequestsPendingMigration:(id)a3;
- (void)setNotificationSections:(id)a3;
- (void)setNotificationSummaryCache:(id)a3;
- (void)setOnboardingSummaryVisible:(BOOL)a3;
- (void)setOverrideMigrationOverlayLabel:(id)a3;
- (void)setOverrideMigrationToHistory:(BOOL)a3;
- (void)setOverrideNotificationListDisplayStyleSetting:(int64_t)a3 forReason:(id)a4 hideNotificationCount:(BOOL)a5;
- (void)setOverrideNotificationMigrateHighlightToHistoryTimeIntervalKey:(double)a3;
- (void)setOverrideNotificationMigrateTimeSensitiveToHistoryTimeIntervalKey:(double)a3;
- (void)setPerformingClearAll:(BOOL)a3;
- (void)setPersistentStateManager:(id)a3;
- (void)setPersistentStoredListInfo:(id)a3;
- (void)setProminentIncomingSectionList:(id)a3;
- (void)setRootListView:(id)a3;
- (void)setScheduledDeliveryEnabled:(BOOL)a3;
- (void)setSuggestionManager:(id)a3;
- (void)setSupplementaryCache:(id)a3;
- (void)setSupplementaryViewsSections:(id)a3;
- (void)setUpcomingDigestSectionList:(id)a3;
- (void)setUpcomingDigestVisible:(BOOL)a3;
- (void)setUpcomingMissedSectionList:(id)a3;
- (void)setVisibleRectBottomMarginForRollUnder:(double)a3;
- (void)suggestionManager:(id)a3 requestsPresentingNotificationManagementViewType:(unint64_t)a4 forNotificationRequest:(id)a5 withPresentingView:(id)a6;
- (void)suggestionManager:(id)a3 requestsUpdatingContentForNotificationRequest:(id)a4;
- (void)suggestionManager:(id)a3 setAllowsDirectMessages:(BOOL)a4 forSectionIdentifier:(id)a5;
- (void)suggestionManager:(id)a3 setAllowsTimeSensitive:(BOOL)a4 forSectionIdentifier:(id)a5;
- (void)suggestionManager:(id)a3 setModeConfiguration:(id)a4;
- (void)suggestionManager:(id)a3 setMuted:(BOOL)a4 untilDate:(id)a5 forSectionIdentifier:(id)a6 threadIdentifier:(id)a7;
- (void)suggestionManager:(id)a3 setScheduledDelivery:(BOOL)a4 forSectionIdentifier:(id)a5;
- (void)supplementaryViewSectionDidChangeContent:(id)a3;
- (void)testClearPersistentStateManagerForTesting;
- (void)testDigestTimerFired;
- (void)testDigestTimerRevoke;
- (void)testDigestTimerUpdated;
- (void)testPromoteUpcomingDigestToCurrentDigest;
- (void)toggleFilteringForSectionIdentifier:(id)a3 shouldFilter:(BOOL)a4;
- (void)toggleMissedSectionActive:(BOOL)a3 forDNDMode:(id)a4 hideVisibleNotifications:(BOOL)a5;
- (void)updateListViewVisibleRectForSize:(CGSize)a3;
- (void)updateNotificationSectionSettings:(id)a3 previousSectionSettings:(id)a4;
- (void)updateNotificationSystemSettings:(id)a3 previousSystemSettings:(id)a4;
@end

@implementation NCNotificationRootList

- (NCNotificationRootList)initWithListView:(id)a3
{
  id v5 = a3;
  v53.receiver = self;
  v53.super_class = (Class)NCNotificationRootList;
  v6 = [(NCNotificationRootList *)&v53 init];
  if (v6)
  {
    objc_storeStrong((id *)&__sharedInstance, v6);
    v7 = objc_alloc_init(NCNotificationListCache);
    v8 = (void *)*((void *)v6 + 10);
    *((void *)v6 + 10) = v7;

    [*((id *)v6 + 10) setDelegate:v6];
    v9 = objc_alloc_init(NCNotificationListCache);
    v10 = (void *)*((void *)v6 + 11);
    *((void *)v6 + 11) = v9;

    [*((id *)v6 + 11) setDelegate:v6];
    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v12 = (void *)*((void *)v6 + 8);
    *((void *)v6 + 8) = v11;

    id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v14 = (void *)*((void *)v6 + 15);
    *((void *)v6 + 15) = v13;

    id v15 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v16 = (void *)*((void *)v6 + 30);
    *((void *)v6 + 30) = v15;

    id v17 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    v18 = (void *)*((void *)v6 + 16);
    *((void *)v6 + 16) = v17;

    v6[20] = 0;
    [v6 _setupNotificationSectionLists];
    v19 = (void *)*((void *)v6 + 1);
    *((void *)v6 + 1) = 0;

    v20 = (void *)*((void *)v6 + 29);
    *((void *)v6 + 29) = 0;

    v21 = objc_alloc_init(NCSuggestionManager);
    v22 = (void *)*((void *)v6 + 7);
    *((void *)v6 + 7) = v21;

    [*((id *)v6 + 7) setDelegate:v6];
    v6[23] = 0;
    *(_WORD *)(v6 + 21) = 0;
    v6[25] = 1;
    v23 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    v24 = [v23 objectForKey:@"NCOverrideNotificationMigrationToHistory"];
    if (v24)
    {
      v25 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
      v6[27] = [v25 BOOLForKey:@"NCOverrideNotificationMigrationToHistory"];
    }
    else
    {
      v6[27] = 0;
    }

    *((void *)v6 + 31) = 0xBFF0000000000000;
    v26 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    uint64_t v27 = [v26 objectForKey:@"NCOverrideNotificationMigrateHighlightToHistoryTimeIntervalKey"];
    if (v27)
    {
      v28 = (void *)v27;
      v29 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
      [v29 doubleForKey:@"NCOverrideNotificationMigrateHighlightToHistoryTimeIntervalKey"];
      double v31 = v30;

      if (v31 <= 0.0) {
        goto LABEL_9;
      }
      v26 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
      [v26 doubleForKey:@"NCOverrideNotificationMigrateHighlightToHistoryTimeIntervalKey"];
      *((void *)v6 + 31) = v32;
    }

LABEL_9:
    *((void *)v6 + 32) = 0xBFF0000000000000;
    v33 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    uint64_t v34 = [v33 objectForKey:@"NCOverrideNotificationMigrateTimeSensitiveToHistoryTimeIntervalKey"];
    if (v34)
    {
      v35 = (void *)v34;
      v36 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
      [v36 doubleForKey:@"NCOverrideNotificationMigrateTimeSensitiveToHistoryTimeIntervalKey"];
      double v38 = v37;

      if (v38 <= 0.0)
      {
LABEL_13:
        v40 = [v6 _digestTestRecipe];
        +[PTDomain registerTestRecipe:v40];

        v41 = [v6 _notificationMigrationOverrideTestRecipe];
        +[PTDomain registerTestRecipe:v41];

        uint64_t v42 = +[NCNotificationListStalenessEventTracker eventTrackerWithAutomaticCollation];
        v43 = (void *)*((void *)v6 + 13);
        *((void *)v6 + 13) = v42;

        v44 = [v6 notificationListStalenessEventTracker];
        v45 = [v6 incomingSectionList];
        [v44 setStructuredSectionList:v45];

        v46 = [[NCNotificationListPersistentStateManager alloc] initWithDelegate:v6];
        v47 = (void *)*((void *)v6 + 14);
        *((void *)v6 + 14) = v46;

        v48 = [[NCNotificationListMigrationScheduler alloc] initWithDelegate:v6];
        v49 = (void *)*((void *)v6 + 26);
        *((void *)v6 + 26) = v48;

        v50 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
        [v50 addObserver:v6 forKeyPath:@"NCOverrideNotificationMigrationToHistory" options:1 context:0];

        [v6 _addStateCaptureBlock];
        objc_storeStrong((id *)v6 + 6, a3);
        [*((id *)v6 + 6) setDataSource:v6];
        [*((id *)v6 + 6) _setAutomaticContentOffsetAdjustmentEnabled:0];
        v51 = (void *)*((void *)v6 + 6);
        objc_opt_class();
        [v51 setLayoutFromBottom:(objc_opt_isKindOfClass() & 1) == 0];
        [*((id *)v6 + 6) setShouldLimitViewHeightForRollUnder:1];
        [v6 _updateIndexForReveal];
        goto LABEL_14;
      }
      v33 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
      [v33 doubleForKey:@"NCOverrideNotificationMigrateTimeSensitiveToHistoryTimeIntervalKey"];
      *((void *)v6 + 32) = v39;
    }

    goto LABEL_13;
  }
LABEL_14:

  return (NCNotificationRootList *)v6;
}

- (void)setDelegate:(id)a3
{
  id v6 = a3;
  objc_storeWeak((id *)&self->_delegate, v6);
  v4 = v6;
  if (v6)
  {
    rootListView = self->_rootListView;
    [v6 insetHorizontalMarginForNotificationListComponent:self];
    -[NCNotificationListViewProtocol setHorizontalInsetMargin:](rootListView, "setHorizontalInsetMargin:");
    v4 = v6;
  }
}

+ (id)sharedInstance
{
  return (id)__sharedInstance;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (objc_msgSend(a3, "isEqualToString:", @"NCOverrideNotificationMigrationToHistory", a4, a5, a6))
  {
    v7 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    self->_BOOL overrideMigrationToHistory = [v7 BOOLForKey:@"NCOverrideNotificationMigrationToHistory"];

    v8 = (void *)*MEMORY[0x1E4FB3778];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
    {
      v9 = v8;
      v10 = [(NCNotificationRootList *)self logDescription];
      BOOL overrideMigrationToHistory = self->_overrideMigrationToHistory;
      int v12 = 138543618;
      id v13 = v10;
      __int16 v14 = 1024;
      BOOL v15 = overrideMigrationToHistory;
      _os_log_impl(&dword_1D7C04000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ setting override migration to history to %{BOOL}d on user defaults value change", (uint8_t *)&v12, 0x12u);
    }
  }
}

- (void)migrateNotificationsFromIncomingSectionToHistorySection
{
}

- (void)migrateNotificationsFromIncomingSectionToHistorySectionAndHideHistorySection:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  if ([(NCNotificationRootList *)self overrideMigrationToHistory])
  {
    id v5 = (void *)*MEMORY[0x1E4FB3778];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
    {
      id v6 = v5;
      v7 = [(NCNotificationRootList *)self logDescription];
      *(_DWORD *)buf = 138543362;
      v49 = v7;
      v8 = "%{public}@ not migrating notifications from incoming section to history section because override is set";
LABEL_4:
      _os_log_impl(&dword_1D7C04000, v6, OS_LOG_TYPE_DEFAULT, v8, buf, 0xCu);

      return;
    }
    return;
  }
  v9 = [(NCNotificationRootList *)self highlightedSectionList];
  if ([v9 count]) {
    goto LABEL_8;
  }
  v10 = [(NCNotificationRootList *)self prominentIncomingSectionList];
  if ([v10 count])
  {

LABEL_8:
LABEL_9:
    id v11 = (os_log_t *)MEMORY[0x1E4FB3778];
    int v12 = (void *)*MEMORY[0x1E4FB3778];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
    {
      id v13 = v12;
      __int16 v14 = [(NCNotificationRootList *)self logDescription];
      *(_DWORD *)buf = 138543362;
      v49 = v14;
      _os_log_impl(&dword_1D7C04000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ migrating notifications from incoming section to history section", buf, 0xCu);
    }
    BOOL v15 = [(NCNotificationRootList *)self prominentIncomingSectionList];
    uint64_t v16 = [(NCNotificationRootList *)self incomingSectionList];
    v47[0] = MEMORY[0x1E4F143A8];
    v47[1] = 3221225472;
    v47[2] = __103__NCNotificationRootList_migrateNotificationsFromIncomingSectionToHistorySectionAndHideHistorySection___block_invoke;
    v47[3] = &unk_1E6A925C8;
    v47[4] = self;
    BYTE2(v38) = 0;
    LOWORD(v38) = 0;
    -[NCNotificationRootList _migrateNotificationsFromList:toList:passingTest:filterRequestsPassingTest:hideToList:clearRequests:filterForDestination:animateRemoval:reorderGroupNotifications:](self, "_migrateNotificationsFromList:toList:passingTest:filterRequestsPassingTest:hideToList:clearRequests:filterForDestination:animateRemoval:reorderGroupNotifications:", v15, v16, 0, v47, 0, 0, v38);

    LODWORD(v16) = _NCStackElevation();
    os_log_t v17 = *v11;
    BOOL v18 = os_log_type_enabled(*v11, OS_LOG_TYPE_DEFAULT);
    if (v16)
    {
      if (v18)
      {
        v19 = v17;
        v20 = [(NCNotificationRootList *)self logDescription];
        *(_DWORD *)buf = 138543362;
        v49 = v20;
        _os_log_impl(&dword_1D7C04000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ migrating notifications in stack if needed", buf, 0xCu);
      }
      BOOL v21 = +[NCPlatformEligibility areGenerativeModelsAvailable];
      v22 = [(NCNotificationRootList *)self incomingSectionList];
      v23 = [(NCNotificationRootList *)self historySectionList];
      v45[0] = MEMORY[0x1E4F143A8];
      v45[1] = 3221225472;
      v45[2] = __103__NCNotificationRootList_migrateNotificationsFromIncomingSectionToHistorySectionAndHideHistorySection___block_invoke_31;
      v45[3] = &unk_1E6A925F0;
      v45[4] = self;
      BOOL v46 = v21;
      BYTE2(v39) = 0;
      LOWORD(v39) = 1;
      -[NCNotificationRootList _migrateNotificationsFromList:toList:passingTest:filterRequestsPassingTest:hideToList:clearRequests:filterForDestination:animateRemoval:reorderGroupNotifications:](self, "_migrateNotificationsFromList:toList:passingTest:filterRequestsPassingTest:hideToList:clearRequests:filterForDestination:animateRemoval:reorderGroupNotifications:", v22, v23, v45, 0, v3, 1, v39);

      v24 = [(NCNotificationRootList *)self incomingSectionList];
      v25 = [(NCNotificationRootList *)self historySectionList];
      v42[4] = self;
      v43[0] = MEMORY[0x1E4F143A8];
      v43[1] = 3221225472;
      v43[2] = __103__NCNotificationRootList_migrateNotificationsFromIncomingSectionToHistorySectionAndHideHistorySection___block_invoke_33;
      v43[3] = &unk_1E6A925F0;
      v43[4] = self;
      BOOL v44 = v21;
      v42[0] = MEMORY[0x1E4F143A8];
      v42[1] = 3221225472;
      v42[2] = __103__NCNotificationRootList_migrateNotificationsFromIncomingSectionToHistorySectionAndHideHistorySection___block_invoke_34;
      v42[3] = &unk_1E6A925C8;
      BYTE2(v40) = 0;
      LOWORD(v40) = 1;
      -[NCNotificationRootList _migrateNotificationsFromList:toList:passingTest:filterRequestsPassingTest:hideToList:clearRequests:filterForDestination:animateRemoval:reorderGroupNotifications:](self, "_migrateNotificationsFromList:toList:passingTest:filterRequestsPassingTest:hideToList:clearRequests:filterForDestination:animateRemoval:reorderGroupNotifications:", v24, v25, v43, v42, v3, 1, v40);
    }
    else
    {
      if (v18)
      {
        v26 = v17;
        uint64_t v27 = [(NCNotificationRootList *)self logDescription];
        *(_DWORD *)buf = 138543362;
        v49 = v27;
        _os_log_impl(&dword_1D7C04000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@ migrating individual notifications", buf, 0xCu);
      }
      v28 = [(NCNotificationRootList *)self incomingSectionList];
      v29 = [(NCNotificationRootList *)self historySectionList];
      v41[0] = MEMORY[0x1E4F143A8];
      v41[1] = 3221225472;
      v41[2] = __103__NCNotificationRootList_migrateNotificationsFromIncomingSectionToHistorySectionAndHideHistorySection___block_invoke_2;
      v41[3] = &unk_1E6A925C8;
      v41[4] = self;
      BYTE2(v39) = 0;
      LOWORD(v39) = 1;
      -[NCNotificationRootList _migrateNotificationsFromList:toList:passingTest:filterRequestsPassingTest:hideToList:clearRequests:filterForDestination:animateRemoval:reorderGroupNotifications:](self, "_migrateNotificationsFromList:toList:passingTest:filterRequestsPassingTest:hideToList:clearRequests:filterForDestination:animateRemoval:reorderGroupNotifications:", v28, v29, &__block_literal_global_5, v41, v3, 1, v39);
    }
    if ([(NCNotificationRootList *)self deferDigestMigration]
      && [(NCNotificationRootList *)self _isCurrentDigestListAboveHistorySectionList])
    {
      os_log_t v30 = *v11;
      if (os_log_type_enabled(*v11, OS_LOG_TYPE_DEFAULT))
      {
        double v31 = v30;
        uint64_t v32 = [(NCNotificationRootList *)self logDescription];
        *(_DWORD *)buf = 138543362;
        v49 = v32;
        _os_log_impl(&dword_1D7C04000, v31, OS_LOG_TYPE_DEFAULT, "%{public}@ performing deferred migration of current digest", buf, 0xCu);
      }
      [(NCNotificationRootList *)self _migrateCurrentDigestSectionListToReadSection];
      self->_deferDigestMigration = 0;
    }
    else
    {
      [(NCNotificationRootList *)self _scheduleNotificationDigestMigrationIfNecessary];
    }
    int v33 = _NCStackElevation();
    [(NCNotificationRootList *)self _scheduleAllNotificationRequestsForMigrationFromHighlightList];
    if (v33) {
      uint64_t v34 = &__block_literal_global_38;
    }
    else {
      uint64_t v34 = &__block_literal_global_41;
    }
    [(NCNotificationRootList *)self _scheduleNotificationRequestsForMigrationFromIncomingListPassingTest:v34];
    [(NCNotificationRootList *)self _notificationListDidChangeContent];
    return;
  }
  v35 = [(NCNotificationRootList *)self incomingSectionList];
  uint64_t v36 = [v35 count];

  if (v36) {
    goto LABEL_9;
  }
  double v37 = (void *)*MEMORY[0x1E4FB3778];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v37;
    v7 = [(NCNotificationRootList *)self logDescription];
    *(_DWORD *)buf = 138543362;
    v49 = v7;
    v8 = "%{public}@ not migrating notifications to history section because highlight/prominent/incoming are empty";
    goto LABEL_4;
  }
}

uint64_t __103__NCNotificationRootList_migrateNotificationsFromIncomingSectionToHistorySectionAndHideHistorySection___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) _isLockScreenPersistenceNotificationRequest:v3];
  if (v4)
  {
    id v5 = (void *)*MEMORY[0x1E4FB3778];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
    {
      id v6 = *(void **)(a1 + 32);
      v7 = v5;
      v8 = [v6 logDescription];
      v9 = [v3 notificationIdentifier];
      v10 = objc_msgSend(v9, "un_logDigest");
      id v11 = [v3 options];
      int v13 = 138543874;
      __int16 v14 = v8;
      __int16 v15 = 2114;
      uint64_t v16 = v10;
      __int16 v17 = 2048;
      uint64_t v18 = [v11 lockScreenPersistence];
      _os_log_impl(&dword_1D7C04000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ notification %{public}@ is persistent notification; lockScreenPersistence: %lu; skip migration from p"
        "rominent incoming to incoming.",
        (uint8_t *)&v13,
        0x20u);
    }
  }

  return v4;
}

uint64_t __103__NCNotificationRootList_migrateNotificationsFromIncomingSectionToHistorySectionAndHideHistorySection___block_invoke_31(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([*(id *)(a1 + 32) _isEligibleForStackElevationMigrationWithGroupList:v3 areGenerativeModelsAvailable:*(unsigned __int8 *)(a1 + 40)])
  {
    if ([v3 containsPersistentNotificationRequests])
    {
      uint64_t v4 = (void *)*MEMORY[0x1E4FB3778];
      uint64_t v5 = 0;
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
      {
        id v6 = *(void **)(a1 + 32);
        v7 = v4;
        v8 = [v6 logDescription];
        v9 = [v3 logDescription];
        int v24 = 138543618;
        v25 = v8;
        __int16 v26 = 2114;
        uint64_t v27 = v9;
        v10 = "%{public}@ thread %{public}@ contains persistent notification; skip migrate from incoming to history.";
        goto LABEL_10;
      }
    }
    else
    {
      int v13 = [*(id *)(a1 + 32) migrationScheduler];
      __int16 v14 = [v13 migratedTimeSensitiveNotificationRequests];
      int v15 = [v3 hasNewTimeSensitiveNotificationRequestsWithMigratedTimeSensitiveNotificationRequests:v14];

      uint64_t v16 = (void *)*MEMORY[0x1E4FB3778];
      BOOL v17 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT);
      if (v15)
      {
        if (!v17)
        {
LABEL_11:
          uint64_t v5 = 0;
          goto LABEL_15;
        }
        uint64_t v18 = *(void **)(a1 + 32);
        v7 = v16;
        v8 = [v18 logDescription];
        v9 = [v3 logDescription];
        int v24 = 138543618;
        v25 = v8;
        __int16 v26 = 2114;
        uint64_t v27 = v9;
        v10 = "%{public}@ thread %{public}@ contains new time sensitive notification; defer migrate from incoming to hist"
              "ory until migration timer fired.";
LABEL_10:
        _os_log_impl(&dword_1D7C04000, v7, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v24, 0x16u);

        goto LABEL_11;
      }
      if (v17)
      {
        uint64_t v19 = *(void **)(a1 + 32);
        v20 = v16;
        BOOL v21 = [v19 logDescription];
        v22 = [v3 logDescription];
        int v24 = 138543618;
        v25 = v21;
        __int16 v26 = 2114;
        uint64_t v27 = v22;
        _os_log_impl(&dword_1D7C04000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ migrate thread %{public}@ from incoming to history", (uint8_t *)&v24, 0x16u);
      }
      uint64_t v5 = 1;
    }
  }
  else
  {
    id v11 = (void *)*MEMORY[0x1E4FB3778];
    uint64_t v5 = 0;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
    {
      int v12 = *(void **)(a1 + 32);
      v7 = v11;
      v8 = [v12 logDescription];
      v9 = [v3 logDescription];
      int v24 = 138543618;
      v25 = v8;
      __int16 v26 = 2114;
      uint64_t v27 = v9;
      v10 = "%{public}@ thread %{public}@ is not eligible for stack elevation migration; skip group migration from incoming to history.";
      goto LABEL_10;
    }
  }
LABEL_15:

  return v5;
}

uint64_t __103__NCNotificationRootList_migrateNotificationsFromIncomingSectionToHistorySectionAndHideHistorySection___block_invoke_33(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = [*(id *)(a1 + 32) _isEligibleForStackElevationMigrationWithGroupList:v3 areGenerativeModelsAvailable:*(unsigned __int8 *)(a1 + 40)];
  uint64_t v5 = (void *)*MEMORY[0x1E4FB3778];
  BOOL v6 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      v7 = *(void **)(a1 + 32);
      v8 = v5;
      v9 = [v7 logDescription];
      v10 = [v3 logDescription];
      int v14 = 138543618;
      int v15 = v9;
      __int16 v16 = 2114;
      BOOL v17 = v10;
      id v11 = "%{public}@ thread %{public}@ eligible for stack elevation migration; skip migrating individually from incoming to history";
LABEL_6:
      _os_log_impl(&dword_1D7C04000, v8, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v14, 0x16u);
    }
  }
  else if (v6)
  {
    int v12 = *(void **)(a1 + 32);
    v8 = v5;
    v9 = [v12 logDescription];
    v10 = [v3 logDescription];
    int v14 = 138543618;
    int v15 = v9;
    __int16 v16 = 2114;
    BOOL v17 = v10;
    id v11 = "%{public}@ thread %{public}@ is not eligible for stack elevation migration; migrate individually from incoming to history.";
    goto LABEL_6;
  }

  return v4 ^ 1u;
}

uint64_t __103__NCNotificationRootList_migrateNotificationsFromIncomingSectionToHistorySectionAndHideHistorySection___block_invoke_34(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = [v3 options];
  uint64_t v5 = [v4 lockScreenPersistence];

  if (v5)
  {
    BOOL v6 = (void *)*MEMORY[0x1E4FB3778];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(void **)(a1 + 32);
      v8 = v6;
      v9 = [v7 logDescription];
      v10 = [v3 notificationIdentifier];
      id v11 = objc_msgSend(v10, "un_logDigest");
      int v24 = 138543618;
      v25 = v9;
      __int16 v26 = 2114;
      uint64_t v27 = v11;
      int v12 = "%{public}@ notification %{public}@ is persistent notification; skip migrate from incoming to history.";
LABEL_7:
      _os_log_impl(&dword_1D7C04000, v8, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v24, 0x16u);

      goto LABEL_8;
    }
    goto LABEL_8;
  }
  uint64_t v13 = [v3 interruptionLevel];
  int v14 = (void *)*MEMORY[0x1E4FB3778];
  BOOL v15 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT);
  if (v13 == 2)
  {
    if (v15)
    {
      __int16 v16 = *(void **)(a1 + 32);
      v8 = v14;
      v9 = [v16 logDescription];
      v10 = [v3 notificationIdentifier];
      id v11 = objc_msgSend(v10, "un_logDigest");
      int v24 = 138543618;
      v25 = v9;
      __int16 v26 = 2114;
      uint64_t v27 = v11;
      int v12 = "%{public}@ notification %{public}@ is time sensitive notification; defer migrate from incoming to history un"
            "til migration timer fired.";
      goto LABEL_7;
    }
LABEL_8:
    uint64_t v17 = 1;
    goto LABEL_9;
  }
  if (v15)
  {
    uint64_t v19 = *(void **)(a1 + 32);
    v20 = v14;
    BOOL v21 = [v19 logDescription];
    v22 = [v3 notificationIdentifier];
    v23 = objc_msgSend(v22, "un_logDigest");
    int v24 = 138543618;
    v25 = v21;
    __int16 v26 = 2114;
    uint64_t v27 = v23;
    _os_log_impl(&dword_1D7C04000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ migrate request %{public}@ from incoming to history", (uint8_t *)&v24, 0x16u);
  }
  uint64_t v17 = 0;
LABEL_9:

  return v17;
}

uint64_t __103__NCNotificationRootList_migrateNotificationsFromIncomingSectionToHistorySectionAndHideHistorySection___block_invoke_35(uint64_t a1, void *a2)
{
  return [a2 containsNonPersistentNotificationRequests];
}

uint64_t __103__NCNotificationRootList_migrateNotificationsFromIncomingSectionToHistorySectionAndHideHistorySection___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = [v3 options];
  uint64_t v5 = [v4 lockScreenPersistence];

  if (v5)
  {
    BOOL v6 = (void *)*MEMORY[0x1E4FB3778];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(void **)(a1 + 32);
      v8 = v6;
      v9 = [v7 logDescription];
      v10 = [v3 notificationIdentifier];
      id v11 = objc_msgSend(v10, "un_logDigest");
      int v24 = 138543618;
      v25 = v9;
      __int16 v26 = 2114;
      uint64_t v27 = v11;
      int v12 = "%{public}@ notification %{public}@ is persistent notification; skip migrate from incoming to history.";
LABEL_7:
      _os_log_impl(&dword_1D7C04000, v8, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v24, 0x16u);

      goto LABEL_8;
    }
    goto LABEL_8;
  }
  uint64_t v13 = [v3 interruptionLevel];
  int v14 = (void *)*MEMORY[0x1E4FB3778];
  BOOL v15 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT);
  if (v13 == 2)
  {
    if (v15)
    {
      __int16 v16 = *(void **)(a1 + 32);
      v8 = v14;
      v9 = [v16 logDescription];
      v10 = [v3 notificationIdentifier];
      id v11 = objc_msgSend(v10, "un_logDigest");
      int v24 = 138543618;
      v25 = v9;
      __int16 v26 = 2114;
      uint64_t v27 = v11;
      int v12 = "%{public}@ notification %{public}@ is time sensitive notification; defer migrate from incoming to history un"
            "til migration timer fired.";
      goto LABEL_7;
    }
LABEL_8:
    uint64_t v17 = 1;
    goto LABEL_9;
  }
  if (v15)
  {
    uint64_t v19 = *(void **)(a1 + 32);
    v20 = v14;
    BOOL v21 = [v19 logDescription];
    v22 = [v3 notificationIdentifier];
    v23 = objc_msgSend(v22, "un_logDigest");
    int v24 = 138543618;
    v25 = v21;
    __int16 v26 = 2114;
    uint64_t v27 = v23;
    _os_log_impl(&dword_1D7C04000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ migrate request %{public}@ from incoming to history", (uint8_t *)&v24, 0x16u);
  }
  uint64_t v17 = 0;
LABEL_9:

  return v17;
}

BOOL __103__NCNotificationRootList_migrateNotificationsFromIncomingSectionToHistorySectionAndHideHistorySection___block_invoke_36(uint64_t a1, void *a2)
{
  v2 = [a2 options];
  BOOL v3 = [v2 lockScreenPersistence] == 0;

  return v3;
}

BOOL __103__NCNotificationRootList_migrateNotificationsFromIncomingSectionToHistorySectionAndHideHistorySection___block_invoke_2_39(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 interruptionLevel] == 2)
  {
    BOOL v3 = [v2 options];
    BOOL v4 = [v3 lockScreenPersistence] == 0;
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

- (void)listViewControllerPresentedByUserAction
{
  id v2 = [(NCNotificationRootList *)self notificationListStalenessEventTracker];
  [v2 handleEvent:0];
}

- (void)toggleFilteringForSectionIdentifier:(id)a3 shouldFilter:(BOOL)a4
{
  id v6 = a3;
  v7 = [(NCNotificationRootList *)self _notificationSectionListsForEnumeration];
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  id v11 = __75__NCNotificationRootList_toggleFilteringForSectionIdentifier_shouldFilter___block_invoke;
  int v12 = &unk_1E6A92658;
  id v13 = v6;
  BOOL v14 = a4;
  id v8 = v6;
  [v7 enumerateObjectsUsingBlock:&v9];

  [(NCNotificationRootList *)self _notificationListDidChangeContent];
  [(NCNotificationRootList *)self _updateDelegateAndSubclassIfNecessaryOfContentChange];
}

uint64_t __75__NCNotificationRootList_toggleFilteringForSectionIdentifier_shouldFilter___block_invoke(uint64_t a1, void *a2)
{
  return [a2 toggleFilteringForSectionIdentifier:*(void *)(a1 + 32) shouldFilter:*(unsigned __int8 *)(a1 + 40)];
}

- (void)setNotificationHistoryRevealed:(BOOL)a3
{
  BOOL v3 = a3;
  if (self->_notificationHistoryRevealed != a3)
  {
    if (!a3)
    {
      self->_notificationHistoryRevealed = 0;
      goto LABEL_10;
    }
    if ([(NCNotificationCombinedSectionList *)self->_historySectionList count])
    {
      self->_notificationHistoryRevealed = v3;
      [(NCNotificationRootList *)self setOverrideNotificationListDisplayStyleSetting:0 forReason:@"NCNotificationListDisplayStyleReasonInteractiveTransition" hideNotificationCount:0];
    }
LABEL_7:
    if (![(NCNotificationCombinedSectionList *)self->_historySectionList count]) {
      return;
    }
    goto LABEL_16;
  }
  if (a3) {
    goto LABEL_7;
  }
LABEL_10:
  [(NCNotificationRootList *)self _regroupAllNotificationGroups];
  [(NCNotificationRootList *)self _sortNotificationGroupsIfNecessary];
  [(NSMutableArray *)self->_supplementaryViewsSections enumerateObjectsUsingBlock:&__block_literal_global_45];
  if ([(NCNotificationRootList *)self currentListDisplayStyleSetting] == 2
    && [(NCNotificationRootList *)self isListDisplayStyleHiddenForUserInteraction])
  {
    [(NCNotificationRootList *)self setOverrideNotificationListDisplayStyleSetting:2 forReason:@"NCNotificationListDisplayStyleReasonOverridePersistHidden" hideNotificationCount:0];
    [(NCNotificationRootList *)self setListDisplayStyleHiddenForUserInteraction:0];
  }
  else if (![(NCNotificationRootList *)self isListDisplayStyleHiddenForUserInteraction])
  {
    [(NCNotificationRootList *)self removeOverrideNotificationListDisplayStyleSettingForReason:@"NCNotificationListDisplayStyleReasonOverridePersistHidden"];
  }
  [(NCNotificationRootList *)self removeOverrideNotificationListDisplayStyleSettingForReason:@"NCNotificationListDisplayStyleReasonInteractiveTransition"];
LABEL_16:

  [(NCNotificationRootList *)self _setForceRevealed:v3];
}

uint64_t __57__NCNotificationRootList_setNotificationHistoryRevealed___block_invoke(uint64_t a1, void *a2)
{
  return [a2 collapseAllExpandedSupplementaryViewsGroups];
}

- (void)toggleMissedSectionActive:(BOOL)a3 forDNDMode:(id)a4 hideVisibleNotifications:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a3;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  uint64_t v9 = (os_log_t *)MEMORY[0x1E4FB3778];
  uint64_t v10 = (void *)*MEMORY[0x1E4FB3778];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
  {
    id v11 = v10;
    int v12 = [(NCNotificationRootList *)self logDescription];
    BOOL missedSectionActive = self->_missedSectionActive;
    int v20 = 138543874;
    BOOL v21 = v12;
    __int16 v22 = 1024;
    *(_DWORD *)v23 = missedSectionActive;
    *(_WORD *)&v23[4] = 1024;
    *(_DWORD *)&v23[6] = v6;
    _os_log_impl(&dword_1D7C04000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ toggle missed section; wasActive: %d, isActive: %d.",
      (uint8_t *)&v20,
      0x18u);
  }
  if (self->_missedSectionActive != v6)
  {
    if (v6)
    {
      if (v5)
      {
        [(NCNotificationRootList *)self migrateNotificationsFromIncomingSectionToHistorySectionAndHideHistorySection:[(NCNotificationRootList *)self deviceAuthenticated] ^ 1];
        [(NCNotificationRootList *)self _migrateCurrentDigestSectionListToReadSection];
      }
      [(NCNotificationRootList *)self _configureUpcomingMissedSectionForDNDMode:v8];
    }
    else
    {
      if ([(NCNotificationCombinedSectionList *)self->_upcomingMissedSectionList containsSectionList:self->_currentDigestSectionList])
      {
        os_log_t v14 = *v9;
        if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
        {
          BOOL v15 = v14;
          __int16 v16 = [(NCNotificationRootList *)self logDescription];
          uint64_t v17 = [(NCNotificationStructuredSectionList *)self->_currentDigestSectionList logDescription];
          uint64_t v18 = [(NCNotificationStructuredSectionList *)self->_upcomingMissedSectionList logDescription];
          uint64_t v19 = [(NCNotificationStructuredSectionList *)self->_incomingSectionList logDescription];
          int v20 = 138544130;
          BOOL v21 = v16;
          __int16 v22 = 2114;
          *(void *)v23 = v17;
          *(_WORD *)&v23[8] = 2114;
          int v24 = v18;
          __int16 v25 = 2114;
          __int16 v26 = v19;
          _os_log_impl(&dword_1D7C04000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ migrating current digest %{public}@ from %{public}@ to %{public}@ as missed section was deactivated.", (uint8_t *)&v20, 0x2Au);
        }
        [(NCNotificationRootList *)self _removeCurrentDigestSectionListFromMissedSectionList];
        [(NCNotificationRootList *)self _upgradeCurrentDigestSectionListForPromotionAboveFold];
        [(NCNotificationSummarizedSectionList *)self->_currentDigestSectionList collapseSummarizedSectionList];
        [(NCNotificationRootList *)self _insertCurrentDigestSectionList];
      }
      [(NCNotificationRootList *)self _migrateUpcomingMissedSectionToIncoming];
      [(NCNotificationRootList *)self _notificationListDidChangeContent];
    }
    self->_BOOL missedSectionActive = v6;
    [(NCNotificationRootList *)self _updateDelegateAndSubclassIfNecessaryOfContentChange];
  }
}

- (id)notificationRequestWithNotificationIdentifier:(id)a3 sectionIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  int v20 = __Block_byref_object_copy__0;
  BOOL v21 = __Block_byref_object_dispose__0;
  id v22 = 0;
  id v8 = [(NCNotificationRootList *)self notificationSections];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __90__NCNotificationRootList_notificationRequestWithNotificationIdentifier_sectionIdentifier___block_invoke;
  v13[3] = &unk_1E6A926A0;
  id v9 = v6;
  id v14 = v9;
  id v10 = v7;
  id v15 = v10;
  __int16 v16 = &v17;
  [v8 enumerateObjectsUsingBlock:v13];

  id v11 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  return v11;
}

void __90__NCNotificationRootList_notificationRequestWithNotificationIdentifier_sectionIdentifier___block_invoke(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  [a2 allNotificationRequests];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        int v12 = objc_msgSend(v11, "notificationIdentifier", (void)v15);
        if ([v12 isEqualToString:a1[4]])
        {
          id v13 = [v11 sectionIdentifier];
          int v14 = [v13 isEqualToString:a1[5]];

          if (v14)
          {
            objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), v11);
            *a4 = 1;
            goto LABEL_12;
          }
        }
        else
        {
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }
LABEL_12:
}

- (void)expandGroupForNotificationRequest:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(NCNotificationRootList *)self notificationSections];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __75__NCNotificationRootList_expandGroupForNotificationRequest_withCompletion___block_invoke;
  v11[3] = &unk_1E6A926C8;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 enumerateObjectsUsingBlock:v11];
}

uint64_t __75__NCNotificationRootList_expandGroupForNotificationRequest_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  return [a2 expandGroupForNotificationRequest:*(void *)(a1 + 32) withCompletion:*(void *)(a1 + 40)];
}

- (void)collapseGroupForNotificationRequest:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(NCNotificationRootList *)self notificationSections];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __77__NCNotificationRootList_collapseGroupForNotificationRequest_withCompletion___block_invoke;
  v11[3] = &unk_1E6A926C8;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 enumerateObjectsUsingBlock:v11];
}

uint64_t __77__NCNotificationRootList_collapseGroupForNotificationRequest_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  return [a2 collapseGroupForNotificationRequest:*(void *)(a1 + 32) withCompletion:*(void *)(a1 + 40)];
}

- (BOOL)hasVisibleContentToReveal
{
  if (![(NCNotificationRootList *)self deviceAuthenticated])
  {
    BOOL v5 = [(NCNotificationRootList *)self incomingSectionList];
    if ([v5 hasVisibleContentToReveal])
    {
      char v4 = 1;
LABEL_23:

      return v4;
    }
    id v6 = [(NCNotificationRootList *)self highlightedSectionList];
    if ([v6 hasVisibleContentToReveal])
    {
      char v4 = 1;
LABEL_22:

      goto LABEL_23;
    }
    BOOL v7 = [(NCNotificationRootList *)self _isCurrentDigestListAboveHistorySectionList];
    if (v7)
    {
      id v2 = [(NCNotificationRootList *)self currentDigestSectionList];
      if ([v2 hasVisibleContentToReveal])
      {
        char v4 = 1;
        goto LABEL_21;
      }
      if (![(NCNotificationRootList *)self isNotificationHistoryRevealed])
      {
        char v4 = 0;
        goto LABEL_21;
      }
    }
    else if (![(NCNotificationRootList *)self isNotificationHistoryRevealed])
    {
      char v4 = 0;
      goto LABEL_22;
    }
    uint64_t v8 = [(NCNotificationRootList *)self upcomingDigestSectionList];
    if ([v8 hasVisibleContentToReveal])
    {

      char v4 = 1;
      if (!v7) {
        goto LABEL_22;
      }
    }
    else
    {
      id v9 = [(NCNotificationRootList *)self upcomingMissedSectionList];
      if ([v9 hasVisibleContentToReveal])
      {

        char v4 = 1;
        if (!v7) {
          goto LABEL_22;
        }
      }
      else
      {
        id v10 = [(NCNotificationRootList *)self historySectionList];
        char v4 = [v10 hasVisibleContentToReveal];

        if (!v7) {
          goto LABEL_22;
        }
      }
    }
LABEL_21:

    goto LABEL_22;
  }
  return 0;
}

- (void)updateNotificationSystemSettings:(id)a3 previousSystemSettings:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  -[NCNotificationRootList setScheduledDeliveryEnabled:](self, "setScheduledDeliveryEnabled:", [v6 isScheduledDeliveryEnabled]);
  uint64_t v8 = [(NCNotificationRootList *)self digestScheduleManager];

  if (v8)
  {
    id v9 = [(NCNotificationRootList *)self digestScheduleManager];
    id v10 = [v6 scheduledDeliveryTimes];
    [v9 setDigestScheduleTimes:v10];
  }
  id v11 = (os_log_t *)MEMORY[0x1E4FB3778];
  if (!v7
    || (int v12 = [v6 shouldScheduledDeliveryShowNextSummary],
        v12 != [v7 shouldScheduledDeliveryShowNextSummary]))
  {
    self->_BOOL upcomingDigestVisible = [v6 shouldScheduledDeliveryShowNextSummary];
    os_log_t v13 = *v11;
    if (os_log_type_enabled(*v11, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = v13;
      long long v15 = [(NCNotificationRootList *)self logDescription];
      BOOL upcomingDigestVisible = self->_upcomingDigestVisible;
      int v27 = 138543618;
      uint64_t v28 = v15;
      __int16 v29 = 1024;
      LODWORD(v30) = upcomingDigestVisible;
      _os_log_impl(&dword_1D7C04000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ toggling visibility of upcoming digest to %{BOOL}d", (uint8_t *)&v27, 0x12u);
    }
    [(NCNotificationRootList *)self _toggleUpcomingDigestSectionListVisibility];
    if (!v7) {
      goto LABEL_17;
    }
  }
  uint64_t v17 = [v6 listDisplayStyleSetting];
  if (v17 != [v7 listDisplayStyleSetting])
  {
LABEL_17:
    os_log_t v18 = *v11;
    if (os_log_type_enabled(*v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v19 = v18;
      uint64_t v20 = [(NCNotificationRootList *)self logDescription];
      BOOL v21 = objc_msgSend(MEMORY[0x1E4FB3808], "stringForNotificationListDisplayStyleSetting:", objc_msgSend(v6, "listDisplayStyleSetting"));
      id v22 = objc_msgSend(MEMORY[0x1E4FB3808], "stringForNotificationListDisplayStyleSetting:", -[NCNotificationRootList currentListDisplayStyleSetting](self, "currentListDisplayStyleSetting"));
      int v27 = 138543874;
      uint64_t v28 = v20;
      __int16 v29 = 2114;
      os_log_t v30 = v21;
      __int16 v31 = 2114;
      uint64_t v32 = v22;
      _os_log_impl(&dword_1D7C04000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ updating notification list display system setting to %{public}@ from %{public}@ on system settings change", (uint8_t *)&v27, 0x20u);
    }
    v23 = [(NCNotificationRootList *)self notificationListDisplayStyleSettingsForReason];
    int v24 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v6, "listDisplayStyleSetting"));
    [v23 setValue:v24 forKey:@"NCNotificationListDisplayStyleReasonSystemSetting"];

    __int16 v25 = [(NCNotificationRootList *)self notificationListDisplayStyleSettingsForReason];
    [v25 removeObjectForKey:@"NCNotificationListDisplayStyleReasonInteractiveTransition"];

    [(NCNotificationRootList *)self _updateNotificationListDisplayStyleSetting];
    if (!v7) {
      goto LABEL_13;
    }
  }
  int v26 = [v6 areHighlightsEnabled];
  if (v26 != [v7 areHighlightsEnabled]) {
LABEL_13:
  }
    -[NCNotificationRootList _setHighlightsFeatureEnabled:](self, "_setHighlightsFeatureEnabled:", [v6 areHighlightsEnabled]);
}

- (BOOL)hasVisibleUrgentBreakthroughContent
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  BOOL v3 = [(NCNotificationRootList *)self _visibleNotificationRequests];
  if (-[NCNotificationRootList isMissedSectionActive](self, "isMissedSectionActive") && [v3 count])
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __61__NCNotificationRootList_hasVisibleUrgentBreakthroughContent__block_invoke;
    v6[3] = &unk_1E6A926F0;
    v6[4] = &v7;
    [v3 enumerateObjectsUsingBlock:v6];
  }
  char v4 = *((unsigned char *)v8 + 24);

  _Block_object_dispose(&v7, 8);
  return v4;
}

void __61__NCNotificationRootList_hasVisibleUrgentBreakthroughContent__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v8 = a2;
  id v6 = [v8 alertOptions];
  if ([v6 suppression]) {
    BOOL v7 = (unint64_t)[v8 interruptionLevel] > 1;
  }
  else {
    BOOL v7 = 1;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v7;

  *a4 = *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
}

- (void)_checkAndReloadSuggestionForNotificationRequest:(id)a3
{
  id v8 = a3;
  char v4 = [(NCNotificationRootList *)self suggestionManager];
  [v4 checkSuggestionNeededForNotificationRequest:v8];

  BOOL v5 = [(NCNotificationRootList *)self loadedNotificationSections];
  id v6 = [v8 sectionIdentifier];
  if ([v5 containsObject:v6])
  {
    BOOL v7 = [(NCNotificationRootList *)self containsNotificationRequest:v8];

    if (v7) {
      goto LABEL_6;
    }
    BOOL v5 = [(NCNotificationRootList *)self suggestionManager];
    [v5 reloadRemoteSuggestions];
  }
  else
  {
  }
LABEL_6:
}

- (void)reloadRemoteSuggestions
{
}

- (void)setOnboardingSummaryVisible:(BOOL)a3
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  if (self->_onboardingSummaryVisible != a3)
  {
    BOOL v3 = a3;
    BOOL v5 = (os_log_t *)MEMORY[0x1E4FB3778];
    id v6 = (void *)*MEMORY[0x1E4FB3778];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
    {
      BOOL v7 = v6;
      id v8 = [(NCNotificationRootList *)self logDescription];
      *(_DWORD *)buf = 138543618;
      v56 = v8;
      __int16 v57 = 1024;
      LODWORD(v58) = v3;
      _os_log_impl(&dword_1D7C04000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ setting onboarding summary visible = %{BOOL}d", buf, 0x12u);
    }
    if (v3)
    {
      if (self->_currentDigestSectionList)
      {
        os_log_t v9 = *v5;
        if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR)) {
          -[NCNotificationRootList setOnboardingSummaryVisible:](v9, self);
        }
      }
      else
      {
        long long v15 = [(NCNotificationCombinedSectionList *)self->_historySectionList allNotificationRequests];
        long long v16 = (void *)[v15 copy];

        uint64_t v17 = [MEMORY[0x1E4F1C9C8] date];
        os_log_t v18 = [v17 dateByAddingTimeInterval:-86400.0];
        v52[0] = MEMORY[0x1E4F143A8];
        v52[1] = 3221225472;
        v52[2] = __54__NCNotificationRootList_setOnboardingSummaryVisible___block_invoke;
        v52[3] = &unk_1E6A925C8;
        id v19 = v18;
        id v53 = v19;
        uint64_t v20 = objc_msgSend(v16, "bs_filter:", v52);
        unint64_t v21 = [v20 count];
        id v22 = *v5;
        if (v21 < 5)
        {
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
            -[NCNotificationRootList setOnboardingSummaryVisible:](v22);
          }
        }
        else
        {
          id v45 = v19;
          BOOL v46 = v16;
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            v23 = v22;
            int v24 = [(NCNotificationRootList *)self logDescription];
            *(_DWORD *)buf = 138543618;
            v56 = v24;
            __int16 v57 = 2048;
            unint64_t v58 = v21;
            _os_log_impl(&dword_1D7C04000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@ creating onboarding summary with notification count %lu", buf, 0x16u);
          }
          __int16 v25 = [MEMORY[0x1E4F1C9A8] currentCalendar];
          int v26 = [v25 components:124 fromDate:v17];

          uint64_t v27 = [v26 hour];
          uint64_t v28 = 18 - v27;
          if (v27 >= 18) {
            uint64_t v28 = v27 - 18;
          }
          uint64_t v29 = 8 - v27;
          if (v27 >= 8) {
            uint64_t v29 = v27 - 8;
          }
          if (v28 >= v29) {
            uint64_t v30 = 8;
          }
          else {
            uint64_t v30 = 18;
          }
          if (v28 >= v29) {
            __int16 v31 = @"NOTIFICATION_SUMMARY_HEADER_MORNING";
          }
          else {
            __int16 v31 = @"NOTIFICATION_SUMMARY_HEADER_EVENING";
          }
          [v26 setHour:v30];
          [v26 setMinute:0];
          uint64_t v32 = [MEMORY[0x1E4F1C9A8] currentCalendar];
          uint64_t v33 = [v32 dateFromComponents:v26];

          uint64_t v34 = NCUserNotificationsUIKitFrameworkBundle();
          uint64_t v35 = [v34 localizedStringForKey:v31 value:&stru_1F2F516F8 table:0];

          uint64_t v36 = objc_alloc_init(NCMutableDigestInfo);
          v43 = (void *)v35;
          [(NCMutableDigestInfo *)v36 setHeaderString:v35];
          BOOL v44 = (void *)v33;
          [(NCMutableDigestInfo *)v36 setScheduleDate:v33];
          [(NCNotificationRootList *)self _configureCurrentDigestSectionListWithDigestInfo:v36 sectionType:8 summaryOrderProviderType:1];
          long long v50 = 0u;
          long long v51 = 0u;
          long long v48 = 0u;
          long long v49 = 0u;
          id v37 = v20;
          uint64_t v38 = [v37 countByEnumeratingWithState:&v48 objects:v54 count:16];
          if (v38)
          {
            uint64_t v39 = v38;
            uint64_t v40 = *(void *)v49;
            do
            {
              for (uint64_t i = 0; i != v39; ++i)
              {
                if (*(void *)v49 != v40) {
                  objc_enumerationMutation(v37);
                }
                [(NCNotificationSummarizedSectionList *)self->_currentDigestSectionList insertNotificationRequest:*(void *)(*((void *)&v48 + 1) + 8 * i)];
              }
              uint64_t v39 = [v37 countByEnumeratingWithState:&v48 objects:v54 count:16];
            }
            while (v39);
          }

          dispatch_time_t v42 = dispatch_time(0, 500000000);
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __54__NCNotificationRootList_setOnboardingSummaryVisible___block_invoke_62;
          block[3] = &unk_1E6A91BB0;
          block[4] = self;
          dispatch_after(v42, MEMORY[0x1E4F14428], block);
          self->_onboardingSummaryVisible = v3;

          id v19 = v45;
          long long v16 = v46;
        }
      }
    }
    else
    {
      os_log_t v10 = *v5;
      if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
      {
        id v11 = v10;
        int v12 = [(NCNotificationRootList *)self logDescription];
        *(_DWORD *)buf = 138543362;
        v56 = v12;
        _os_log_impl(&dword_1D7C04000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ removing onboarding summary from list", buf, 0xCu);
      }
      os_log_t v13 = [(NCNotificationStructuredSectionList *)self->_currentDigestSectionList listView];
      [v13 setGrouped:1];

      [(NCNotificationRootList *)self _removeCurrentDigestSectionList];
      currentDigestSectionList = self->_currentDigestSectionList;
      self->_currentDigestSectionList = 0;

      self->_onboardingSummaryVisible = 0;
    }
  }
}

BOOL __54__NCNotificationRootList_setOnboardingSummaryVisible___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  char v4 = [v3 timestamp];
  BOOL v5 = [v4 earlierDate:*(void *)(a1 + 32)];
  if (v5 == *(void **)(a1 + 32))
  {
    BOOL v7 = [v3 content];
    BOOL v6 = ([v7 isCommunicationType] & 1) == 0
      && (unint64_t)[v3 interruptionLevel] < 2;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

uint64_t __54__NCNotificationRootList_setOnboardingSummaryVisible___block_invoke_62(uint64_t a1)
{
  return [*(id *)(a1 + 32) _toggleCurrentDigestSectionListVisibility];
}

- (id)insertSupplementaryViewsContainerAtListPosition:(unint64_t)a3 identifier:(id)a4 withDescription:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  os_log_t v10 = (void *)*MEMORY[0x1E4FB3778];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
  {
    id v11 = v10;
    int v12 = [(NCNotificationRootList *)self logDescription];
    *(_DWORD *)buf = 138543874;
    *(void *)&uint8_t buf[4] = v12;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v9;
    *(_WORD *)&buf[22] = 2048;
    unint64_t v23 = a3;
    _os_log_impl(&dword_1D7C04000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ inserting supplementary views container for %{public}@ at position %lu", buf, 0x20u);
  }
  os_log_t v13 = [[NCNotificationListSupplementaryViewsSection alloc] initWithPosition:a3];
  supplementaryCache = self->_supplementaryCache;
  if (!supplementaryCache)
  {
    long long v15 = objc_alloc_init(NCNotificationListCache);
    long long v16 = self->_supplementaryCache;
    self->_supplementaryCache = v15;

    [(NCNotificationListCache *)self->_supplementaryCache setDelegate:self];
    supplementaryCache = self->_supplementaryCache;
  }
  [(NCNotificationListSupplementaryViewsSection *)v13 setNotificationListCache:supplementaryCache];
  [(NCNotificationListSupplementaryViewsSection *)v13 setIdentifier:v8];
  [(NCNotificationListSupplementaryViewsSection *)v13 setDescriptionString:v9];
  [(NCNotificationListSupplementaryViewsSection *)v13 setDelegate:self];
  [(NCNotificationRootList *)self _updateIndexForReveal];
  uint64_t v17 = 0;
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  unint64_t v23 = 0;
  if (a3 != 1)
  {
    supplementaryViewsSections = self->_supplementaryViewsSections;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __101__NCNotificationRootList_insertSupplementaryViewsContainerAtListPosition_identifier_withDescription___block_invoke;
    v21[3] = &unk_1E6A92718;
    v21[4] = buf;
    -[NSMutableArray enumerateObjectsUsingBlock:](supplementaryViewsSections, "enumerateObjectsUsingBlock:", v21, 0);
    uint64_t v17 = *(void *)(*(void *)&buf[8] + 24);
  }
  [(NSMutableArray *)self->_supplementaryViewsSections insertObject:v13 atIndex:v17];
  id v19 = [(NCNotificationRootList *)self rootListView];
  [v19 insertViewAtIndex:*(void *)(*(void *)&buf[8] + 24) animated:0];

  _Block_object_dispose(buf, 8);

  return v13;
}

void __101__NCNotificationRootList_insertSupplementaryViewsContainerAtListPosition_identifier_withDescription___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v7 position] == 1) {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a3 + 1;
  }
  else {
    *a4 = 1;
  }
}

- (void)didTapCountIndicator
{
}

- (void)setOverrideNotificationListDisplayStyleSetting:(int64_t)a3 forReason:(id)a4 hideNotificationCount:(BOOL)a5
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  if ([v7 isEqualToString:@"NCNotificationListDisplayStyleReasonFooterUITapped"])
  {
    id v8 = [(NCNotificationRootList *)self delegate];
    id v9 = [(NCNotificationRootList *)self incomingSectionList];
    if (([v9 notificationCount]
       || [(NCNotificationRootList *)self _isCurrentDigestListAboveHistorySectionList])&& [(NCNotificationRootList *)self currentListDisplayStyleSetting] == 2)
    {
      BOOL v10 = [(NCNotificationRootList *)self isNotificationHistoryRevealed];

      if (!v10)
      {
        id v11 = (os_log_t *)MEMORY[0x1E4FB3778];
        int v12 = (void *)*MEMORY[0x1E4FB3778];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
        {
          os_log_t v13 = v12;
          int v14 = [(NCNotificationRootList *)self logDescription];
          int v45 = 138543362;
          BOOL v46 = v14;
          _os_log_impl(&dword_1D7C04000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ revealing incoming notification section for list string representation tapped", (uint8_t *)&v45, 0xCu);
        }
        [(NCNotificationRootList *)self setOverrideNotificationListDisplayStyleSetting:a3 forReason:@"NCNotificationListDisplayStyleReasonInteractiveTransition" hideNotificationCount:0];
        long long v15 = [(NCNotificationRootList *)self _notificationListSections];
        long long v16 = [(NCNotificationRootList *)self incomingSectionList];
        uint64_t v17 = [v15 indexOfObject:v16];

        if (v17 != 0x7FFFFFFFFFFFFFFFLL)
        {
          os_log_t v18 = [(NCNotificationRootList *)self rootListView];
          [v18 layoutOffsetForViewAtIndex:v17];
          double v20 = v19 + -100.0;

          unint64_t v21 = [(NCNotificationRootList *)self rootListView];
          id v22 = [(NCNotificationRootList *)self rootListView];
          [v22 frame];
          [(NCNotificationRootList *)self notificationListView:v21 heightForItemAtIndex:v17 withWidth:CGRectGetWidth(v52)];
          double v24 = v23;

          __int16 v25 = [(NCNotificationRootList *)self rootListView];
          [v25 frame];
          double v26 = v20 + v24 - CGRectGetHeight(v53);
          uint64_t v27 = [(NCNotificationRootList *)self rootListView];
          [v27 contentInset];
          double v29 = v26 + v28 + -100.0;

          if (v20 >= v29) {
            double v20 = v29;
          }
          uint64_t v30 = [(NCNotificationRootList *)self rootListView];
          [v30 contentOffset];
          double v32 = v31;

          if (v32 < v20) {
            double v32 = v20;
          }
          os_log_t v33 = *v11;
          if (os_log_type_enabled(*v11, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v34 = v33;
            uint64_t v35 = [(NCNotificationRootList *)self logDescription];
            uint64_t v36 = [(NCNotificationRootList *)self rootListView];
            [v36 contentOffset];
            int v45 = 138543874;
            BOOL v46 = v35;
            __int16 v47 = 2048;
            long long v48 = v37;
            __int16 v49 = 2048;
            double v50 = v32;
            _os_log_impl(&dword_1D7C04000, v34, OS_LOG_TYPE_DEFAULT, "%{public}@ currentContentOffset.y is %f; set to %f to reveal incoming section",
              (uint8_t *)&v45,
              0x20u);
          }
          uint64_t v38 = [(NCNotificationRootList *)self rootListView];
          objc_msgSend(v38, "_setContentOffsetWithDecelerationAnimation:", 0.0, v32);
        }
        [v8 notificationListBaseComponentDidSignificantUserInteraction:self];
      }
    }
    else
    {
    }
  }
  else
  {
    uint64_t v39 = (void *)*MEMORY[0x1E4FB3778];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v40 = v39;
      v41 = [(NCNotificationRootList *)self logDescription];
      dispatch_time_t v42 = [MEMORY[0x1E4FB3808] stringForNotificationListDisplayStyleSetting:a3];
      int v45 = 138543874;
      BOOL v46 = v41;
      __int16 v47 = 2114;
      long long v48 = v42;
      __int16 v49 = 2114;
      double v50 = *(double *)&v7;
      _os_log_impl(&dword_1D7C04000, v40, OS_LOG_TYPE_DEFAULT, "%{public}@ setting override notification list display style setting to %{public}@ for reason %{public}@", (uint8_t *)&v45, 0x20u);
    }
    v43 = [(NCNotificationRootList *)self notificationListDisplayStyleSettingsForReason];
    BOOL v44 = [NSNumber numberWithInteger:a3];
    [v43 setValue:v44 forKey:v7];

    [(NCNotificationRootList *)self _updateNotificationListDisplayStyleSetting];
  }
}

- (void)removeOverrideNotificationListDisplayStyleSettingForReason:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [(NCNotificationRootList *)self notificationListDisplayStyleSettingsForReason];
  BOOL v6 = [v5 objectForKey:v4];

  if (v6)
  {
    id v7 = (void *)*MEMORY[0x1E4FB3778];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
    {
      id v8 = v7;
      id v9 = [(NCNotificationRootList *)self logDescription];
      int v11 = 138543618;
      int v12 = v9;
      __int16 v13 = 2114;
      id v14 = v4;
      _os_log_impl(&dword_1D7C04000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ removing override notification list display style setting for reason %{public}@", (uint8_t *)&v11, 0x16u);
    }
    BOOL v10 = [(NCNotificationRootList *)self notificationListDisplayStyleSettingsForReason];
    [v10 removeObjectForKey:v4];

    [(NCNotificationRootList *)self _updateNotificationListDisplayStyleSetting];
  }
}

- (void)setActiveDNDModeConfiguration:(id)a3
{
  id v6 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_activeDNDModeConfiguration, a3);
    BOOL v5 = [(NCNotificationRootList *)self rootListView];
    [v5 setNeedsLayout];
  }
}

- (id)activeDNDMode
{
  return (id)[self->_activeDNDModeConfiguration mode];
}

- (void)updateListViewVisibleRectForSize:(CGSize)a3
{
  id v4 = [(NCNotificationRootList *)self rootListView];
  [v4 contentOffset];
  -[NCNotificationRootList _updateVisibleRectForContentOffset:size:](self, "_updateVisibleRectForContentOffset:size:");
}

- (BOOL)isScrollingListContent
{
  if (([(NCNotificationListViewProtocol *)self->_rootListView isTracking] & 1) == 0
    && ![(NCNotificationRootList *)self _isAdditionalPanGestureActive])
  {
    return 0;
  }
  id v3 = [(NCNotificationListViewProtocol *)self->_rootListView panGestureRecognizer];
  [v3 locationInView:self->_rootListView];
  double v5 = v4;
  [v3 velocityInView:self->_rootListView];
  double v7 = v6;
  int v8 = _NCReactiveListUI();
  rootListView = self->_rootListView;
  if (v8) {
    [(NCNotificationListViewProtocol *)rootListView firstItemOffset];
  }
  else {
    [(NCNotificationListViewProtocol *)rootListView contentLayoutOffset];
  }
  BOOL v11 = v5 >= v10 || v7 < 0.0;

  return v11;
}

- (unint64_t)visibleNotificationCount
{
  unint64_t v3 = [(NCNotificationStructuredSectionList *)self->_incomingSectionList notificationCount];
  unint64_t v4 = [(NCNotificationStructuredSectionList *)self->_criticalSectionList notificationCount] + v3;
  unint64_t v5 = [(NCNotificationStructuredSectionList *)self->_prominentIncomingSectionList notificationCount];
  unint64_t v6 = v4
     + v5
     + [(NCNotificationStructuredSectionList *)self->_highlightedSectionList notificationCount];
  return v6
       + [(NCNotificationRootList *)self _isCurrentDigestListAboveHistorySectionList];
}

- (void)prepareForUIAppear
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = self->_notificationSections;
  uint64_t v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "prepareForUIAppear", (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)handleWake:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v4 = self->_notificationSections;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v8++), "handleWake:", v3, (void)v9);
      }
      while (v6 != v8);
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)setVisibleRectBottomMarginForRollUnder:(double)a3
{
  id v4 = [(NCNotificationRootList *)self rootListView];
  [v4 setVisibleRectBottomMarginForRollUnder:a3];
}

- (unint64_t)count
{
  id v2 = [(NCNotificationRootList *)self notificationSections];
  unint64_t v3 = [v2 count];

  return v3;
}

+ (NSSet)presentableTypes
{
  id v2 = +[NCNotificationListSupplementaryViewsSection presentableTypes];
  unint64_t v3 = +[NCNotificationStructuredSectionList presentableTypes];
  id v4 = [v2 setByAddingObjectsFromSet:v3];

  return (NSSet *)v4;
}

- (void)clearAll
{
}

- (unint64_t)notificationCount
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  unint64_t v3 = [(NCNotificationRootList *)self notificationSections];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __43__NCNotificationRootList_notificationCount__block_invoke;
  v6[3] = &unk_1E6A92740;
  v6[4] = self;
  void v6[5] = &v7;
  [v3 enumerateObjectsUsingBlock:v6];

  unint64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __43__NCNotificationRootList_notificationCount__block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v7 = a2;
  uint64_t v5 = [*(id *)(a1 + 32) _indexForReveal];
  if (v5 - [*(id *)(*(void *)(a1 + 32) + 120) count] > a3
    || [*(id *)(a1 + 32) isNotificationHistoryRevealed])
  {
    uint64_t v6 = [v7 notificationCount];
  }
  else
  {
    uint64_t v6 = 0;
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += v6;
}

- (unint64_t)totalNotificationCount
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  id v2 = [(NCNotificationRootList *)self notificationSections];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __48__NCNotificationRootList_totalNotificationCount__block_invoke;
  v5[3] = &unk_1E6A92768;
  v5[4] = &v6;
  [v2 enumerateObjectsUsingBlock:v5];

  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __48__NCNotificationRootList_totalNotificationCount__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 notificationCount];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += result;
  return result;
}

- (id)matchingRequestForRequest:(id)a3 inList:(id)a4
{
  id v5 = a3;
  uint64_t v6 = [a4 allNotificationRequests];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __59__NCNotificationRootList_matchingRequestForRequest_inList___block_invoke;
  v11[3] = &unk_1E6A92790;
  id v12 = v5;
  id v7 = v5;
  uint64_t v8 = [v6 indexOfObjectPassingTest:v11];
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v9 = 0;
  }
  else
  {
    uint64_t v9 = [v6 objectAtIndex:v8];
  }

  return v9;
}

uint64_t __59__NCNotificationRootList_matchingRequestForRequest_inList___block_invoke(uint64_t a1, void *a2)
{
  return [a2 matchesRequest:*(void *)(a1 + 32)];
}

- (void)removeNotificationRequest:(id)a3
{
  uint64_t v119 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 requestDestinations];
  uint64_t v6 = [v5 count];

  id v7 = (os_log_t *)MEMORY[0x1E4FB3778];
  if (!v6)
  {
    uint64_t v8 = (void *)*MEMORY[0x1E4FB3778];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_ERROR)) {
      -[NCNotificationRootList removeNotificationRequest:](v8, self);
    }
  }
  uint64_t v9 = [(NCNotificationRootList *)self criticalSectionList];
  BOOL v10 = [(NCNotificationRootList *)self _isNotificationRequest:v4 forSectionList:v9];

  if (v10)
  {
    os_log_t v11 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = v11;
      __int16 v13 = [(NCNotificationRootList *)self logDescription];
      uint64_t v14 = [v4 notificationIdentifier];
      uint64_t v15 = objc_msgSend(v14, "un_logDigest");
      long long v16 = [(NCNotificationRootList *)self criticalSectionList];
      uint64_t v17 = [v16 logDescription];
      *(_DWORD *)buf = 138543874;
      v112 = v13;
      __int16 v113 = 2114;
      v114 = v15;
      __int16 v115 = 2114;
      v116 = v17;
      _os_log_impl(&dword_1D7C04000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ removing notification request %{public}@ from %{public}@", buf, 0x20u);
    }
    os_log_t v18 = [(NCNotificationRootList *)self criticalSectionList];
    [v18 removeNotificationRequest:v4];
  }
  double v19 = [(NCNotificationRootList *)self highlightedSectionList];
  BOOL v20 = [(NCNotificationRootList *)self _isNotificationRequest:v4 forSectionList:v19];

  if (v20)
  {
    os_log_t v21 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
    {
      id v22 = v21;
      double v23 = [(NCNotificationRootList *)self logDescription];
      double v24 = [v4 notificationIdentifier];
      __int16 v25 = objc_msgSend(v24, "un_logDigest");
      double v26 = [(NCNotificationRootList *)self highlightedSectionList];
      uint64_t v27 = [v26 logDescription];
      *(_DWORD *)buf = 138543874;
      v112 = v23;
      __int16 v113 = 2114;
      v114 = v25;
      __int16 v115 = 2114;
      v116 = v27;
      _os_log_impl(&dword_1D7C04000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@ removing notification request %{public}@ from %{public}@", buf, 0x20u);
    }
    double v28 = [(NCNotificationRootList *)self highlightedSectionList];
    [v28 removeNotificationRequest:v4];
  }
  double v29 = [(NCNotificationRootList *)self incomingSectionList];
  BOOL v30 = [(NCNotificationRootList *)self _isNotificationRequest:v4 forSectionList:v29];

  if (v30)
  {
    double v31 = [(NCNotificationRootList *)self incomingSectionList];
    double v32 = [(NCNotificationRootList *)self matchingRequestForRequest:v4 inList:v31];

    if (v32)
    {
      os_log_t v33 = [v32 requestDestinations];
      char v34 = [v33 containsObject:@"BulletinDestinationNotificationCenter"];

      char v35 = v34 ^ 1;
    }
    else
    {
      char v35 = 1;
    }
    uint64_t v36 = [v4 requestDestinations];
    char v37 = [v36 containsObject:@"BulletinDestinationNotificationCenter"];

    if ((v35 & 1) == 0 && (v37 & 1) == 0)
    {
      uint64_t v38 = [(NCNotificationRootList *)self historySectionList];
      [v38 insertNotificationRequest:v32];

      os_log_t v39 = *v7;
      if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
      {
        log = v39;
        v109 = [(NCNotificationRootList *)self logDescription];
        uint64_t v40 = [v32 notificationIdentifier];
        v41 = objc_msgSend(v40, "un_logDigest");
        dispatch_time_t v42 = [(NCNotificationRootList *)self incomingSectionList];
        v43 = [v42 logDescription];
        BOOL v44 = [(NCNotificationRootList *)self historySectionList];
        int v45 = [v44 logDescription];
        *(_DWORD *)buf = 138544130;
        v112 = v109;
        __int16 v113 = 2114;
        v114 = v41;
        __int16 v115 = 2114;
        v116 = v43;
        __int16 v117 = 2114;
        v118 = v45;
        _os_log_impl(&dword_1D7C04000, log, OS_LOG_TYPE_DEFAULT, "%{public}@ Migrating notification request %{public}@ from %{public}@ to %{public}@ on removal", buf, 0x2Au);

        id v7 = (os_log_t *)MEMORY[0x1E4FB3778];
      }
    }
    os_log_t v46 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v47 = v46;
      long long v48 = [(NCNotificationRootList *)self logDescription];
      __int16 v49 = [v4 notificationIdentifier];
      double v50 = objc_msgSend(v49, "un_logDigest");
      uint64_t v51 = [(NCNotificationRootList *)self incomingSectionList];
      CGRect v52 = [v51 logDescription];
      *(_DWORD *)buf = 138543874;
      v112 = v48;
      __int16 v113 = 2114;
      v114 = v50;
      __int16 v115 = 2114;
      v116 = v52;
      _os_log_impl(&dword_1D7C04000, v47, OS_LOG_TYPE_DEFAULT, "%{public}@ removing notification request %{public}@ from %{public}@", buf, 0x20u);
    }
    CGRect v53 = [(NCNotificationRootList *)self incomingSectionList];
    [v53 removeNotificationRequest:v4];

    if ([(NCNotificationRootList *)self isMissedSectionActive])
    {
      os_log_t v54 = *v7;
      if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
      {
        v55 = v54;
        v56 = [(NCNotificationRootList *)self logDescription];
        __int16 v57 = [v4 notificationIdentifier];
        unint64_t v58 = objc_msgSend(v57, "un_logDigest");
        uint64_t v59 = [(NCNotificationRootList *)self upcomingMissedSectionList];
        v60 = [v59 logDescription];
        *(_DWORD *)buf = 138543874;
        v112 = v56;
        __int16 v113 = 2114;
        v114 = v58;
        __int16 v115 = 2114;
        v116 = v60;
        _os_log_impl(&dword_1D7C04000, v55, OS_LOG_TYPE_DEFAULT, "%{public}@ removing notification request %{public}@ from %{public}@", buf, 0x20u);
      }
      v61 = [(NCNotificationRootList *)self upcomingMissedSectionList];
      [v61 removeNotificationRequest:v4];
    }
  }
  v62 = [(NCNotificationRootList *)self prominentIncomingSectionList];
  BOOL v63 = [(NCNotificationRootList *)self _isNotificationRequest:v4 forSectionList:v62];

  if (v63)
  {
    os_log_t v64 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
    {
      v65 = v64;
      v66 = [(NCNotificationRootList *)self logDescription];
      v67 = [v4 notificationIdentifier];
      v68 = objc_msgSend(v67, "un_logDigest");
      v69 = [(NCNotificationRootList *)self prominentIncomingSectionList];
      v70 = [v69 logDescription];
      *(_DWORD *)buf = 138543874;
      v112 = v66;
      __int16 v113 = 2114;
      v114 = v68;
      __int16 v115 = 2114;
      v116 = v70;
      _os_log_impl(&dword_1D7C04000, v65, OS_LOG_TYPE_DEFAULT, "%{public}@ removing notification request %{public}@ from %{public}@", buf, 0x20u);
    }
    v71 = [(NCNotificationRootList *)self prominentIncomingSectionList];
    [v71 removeNotificationRequest:v4];
  }
  v72 = [(NCNotificationRootList *)self historySectionList];
  BOOL v73 = [(NCNotificationRootList *)self _isNotificationRequest:v4 forSectionList:v72];

  if (v73)
  {
    os_log_t v74 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
    {
      v75 = v74;
      v76 = [(NCNotificationRootList *)self logDescription];
      v77 = [v4 notificationIdentifier];
      v78 = objc_msgSend(v77, "un_logDigest");
      v79 = [(NCNotificationRootList *)self historySectionList];
      v80 = [v79 logDescription];
      *(_DWORD *)buf = 138543874;
      v112 = v76;
      __int16 v113 = 2114;
      v114 = v78;
      __int16 v115 = 2114;
      v116 = v80;
      _os_log_impl(&dword_1D7C04000, v75, OS_LOG_TYPE_DEFAULT, "%{public}@ removing notification request %{public}@ from %{public}@", buf, 0x20u);
    }
    v81 = [(NCNotificationRootList *)self historySectionList];
    [v81 removeNotificationRequest:v4];
  }
  v82 = [(NCNotificationRootList *)self currentDigestSectionList];
  BOOL v83 = [(NCNotificationRootList *)self _isNotificationRequest:v4 forSectionList:v82];

  if (v83)
  {
    os_log_t v84 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
    {
      v85 = v84;
      v86 = [(NCNotificationRootList *)self logDescription];
      v87 = [v4 notificationIdentifier];
      v88 = objc_msgSend(v87, "un_logDigest");
      v89 = [(NCNotificationRootList *)self currentDigestSectionList];
      v90 = [v89 logDescription];
      *(_DWORD *)buf = 138543874;
      v112 = v86;
      __int16 v113 = 2114;
      v114 = v88;
      __int16 v115 = 2114;
      v116 = v90;
      _os_log_impl(&dword_1D7C04000, v85, OS_LOG_TYPE_DEFAULT, "%{public}@ removing notification request %{public}@ from %{public}@", buf, 0x20u);
    }
    v91 = [(NCNotificationRootList *)self currentDigestSectionList];
    [v91 removeNotificationRequest:v4];
  }
  v92 = [(NCNotificationRootList *)self upcomingDigestSectionList];
  BOOL v93 = [(NCNotificationRootList *)self _isNotificationRequest:v4 forSectionList:v92];

  if (v93)
  {
    os_log_t v94 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
    {
      v95 = v94;
      v96 = [(NCNotificationRootList *)self logDescription];
      v97 = [v4 notificationIdentifier];
      v98 = objc_msgSend(v97, "un_logDigest");
      v99 = [(NCNotificationRootList *)self upcomingDigestSectionList];
      v100 = [v99 logDescription];
      *(_DWORD *)buf = 138543874;
      v112 = v96;
      __int16 v113 = 2114;
      v114 = v98;
      __int16 v115 = 2114;
      v116 = v100;
      _os_log_impl(&dword_1D7C04000, v95, OS_LOG_TYPE_DEFAULT, "%{public}@ removing notification request %{public}@ from %{public}@", buf, 0x20u);
    }
    v101 = [(NCNotificationRootList *)self upcomingDigestSectionList];
    [v101 removeNotificationRequest:v4];
  }
  [(NCNotificationRootList *)self _notificationListDidChangeContent];
  [(NCNotificationRootList *)self _updateForceExpansionForHighlights];
  v102 = [(NCNotificationRootList *)self historySectionList];
  BOOL v103 = [(NCNotificationRootList *)self _isNotificationRequest:v4 forSectionList:v102];

  if (v103)
  {
    v104 = [(NCNotificationRootList *)self notificationListCache];
    [v104 removeNotificationRequest:v4];

    v105 = [(NCNotificationRootList *)self notificationSummaryCache];
    [v105 removeNotificationRequest:v4];

    v106 = [(NCNotificationRootList *)self suggestionManager];
    [v106 clearSuggestionForNotificationRequest:v4];

    v107 = [(NCNotificationRootList *)self migrationScheduler];
    [v107 removeMigrationForNotificationRequest:v4];

    v108 = [(NCNotificationRootList *)self migrationScheduler];
    [v108 removeMigratedTimeSensitiveNotificationRequests:v4];
  }
}

- (void)modifyNotificationRequest:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)*MEMORY[0x1E4FB3778];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = v5;
    id v7 = [(NCNotificationRootList *)self logDescription];
    uint64_t v8 = [v4 notificationIdentifier];
    uint64_t v9 = objc_msgSend(v8, "un_logDigest");
    int v11 = 138543618;
    id v12 = v7;
    __int16 v13 = 2114;
    uint64_t v14 = v9;
    _os_log_impl(&dword_1D7C04000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ modifying notification request %{public}@", (uint8_t *)&v11, 0x16u);
  }
  id v10 = [(NCNotificationRootList *)self _insertNotificationRequest:v4];
  [(NCNotificationRootList *)self _notificationListDidChangeContent];
}

- (void)reloadNotificationRequest:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)*MEMORY[0x1E4FB3778];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = v5;
    id v7 = [(NCNotificationRootList *)self logDescription];
    uint64_t v8 = [v4 notificationIdentifier];
    uint64_t v9 = objc_msgSend(v8, "un_logDigest");
    *(_DWORD *)buf = 138543618;
    uint64_t v17 = v7;
    __int16 v18 = 2114;
    double v19 = v9;
    _os_log_impl(&dword_1D7C04000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ reloading notification request %{public}@", buf, 0x16u);
  }
  id v10 = [(NCNotificationRootList *)self notificationListCache];
  [v10 clearCachedHeightsForNotificationRequest:v4];

  int v11 = [(NCNotificationRootList *)self notificationSummaryCache];
  [v11 clearCachedHeightsForNotificationRequest:v4];

  id v12 = [(NCNotificationRootList *)self notificationSections];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __52__NCNotificationRootList_reloadNotificationRequest___block_invoke;
  v14[3] = &unk_1E6A91C70;
  id v15 = v4;
  id v13 = v4;
  [v12 enumerateObjectsUsingBlock:v14];
}

uint64_t __52__NCNotificationRootList_reloadNotificationRequest___block_invoke(uint64_t a1, void *a2)
{
  return [a2 reloadNotificationRequest:*(void *)(a1 + 32)];
}

- (void)updateNotificationSectionSettings:(id)a3 previousSectionSettings:(id)a4
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v9 = [(NCNotificationRootList *)self criticalSectionList];

  if (v9)
  {
    id v10 = [(NCNotificationRootList *)self criticalSectionList];
    [v8 addObject:v10];
  }
  int v11 = [(NCNotificationRootList *)self highlightedSectionList];

  if (v11)
  {
    id v12 = [(NCNotificationRootList *)self highlightedSectionList];
    [v8 addObject:v12];
  }
  id v13 = [(NCNotificationRootList *)self prominentIncomingSectionList];

  if (v13)
  {
    uint64_t v14 = [(NCNotificationRootList *)self prominentIncomingSectionList];
    [v8 addObject:v14];
  }
  id v15 = [(NCNotificationRootList *)self incomingSectionList];

  if (v15)
  {
    long long v16 = [(NCNotificationRootList *)self incomingSectionList];
    [v8 addObject:v16];
  }
  uint64_t v17 = [(NCNotificationRootList *)self upcomingMissedSectionList];

  if (v17)
  {
    __int16 v18 = [(NCNotificationRootList *)self upcomingMissedSectionList];
    [v8 addObject:v18];
  }
  if (v7)
  {
    int v19 = [v6 showsInLockScreen];
    if (v19 != [v7 showsInLockScreen] && (objc_msgSend(v6, "showsInLockScreen") & 1) == 0)
    {
      uint64_t v20 = (void *)*MEMORY[0x1E4FB3778];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
      {
        os_log_t v21 = v20;
        id v22 = [(NCNotificationRootList *)self logDescription];
        double v23 = [v6 sectionIdentifier];
        *(_DWORD *)buf = 138543618;
        os_log_t v54 = v22;
        __int16 v55 = 2114;
        v56 = v23;
        _os_log_impl(&dword_1D7C04000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@ moving notifications to history section for %{public}@ on Show in Lock Screen turned OFF", buf, 0x16u);
      }
      v51[0] = MEMORY[0x1E4F143A8];
      v51[1] = 3221225472;
      v51[2] = __84__NCNotificationRootList_updateNotificationSectionSettings_previousSectionSettings___block_invoke;
      v51[3] = &unk_1E6A927E0;
      v51[4] = self;
      id v52 = v6;
      [v8 enumerateObjectsUsingBlock:v51];
      [(NCNotificationRootList *)self _updateDelegateAndSubclassIfNecessaryOfContentChange];
    }
    double v24 = [v6 muteAssertion];
    uint64_t v25 = [v7 muteAssertion];
    if (v24 == (void *)v25)
    {
    }
    else
    {
      double v26 = (void *)v25;
      uint64_t v27 = [v6 muteAssertion];

      if (v27)
      {
        double v28 = (void *)*MEMORY[0x1E4FB3778];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
        {
          double v29 = v28;
          BOOL v30 = [(NCNotificationRootList *)self logDescription];
          double v31 = [v6 sectionIdentifier];
          double v32 = [v6 muteAssertion];
          *(_DWORD *)buf = 138543874;
          os_log_t v54 = v30;
          __int16 v55 = 2114;
          v56 = v31;
          __int16 v57 = 2112;
          unint64_t v58 = v32;
          _os_log_impl(&dword_1D7C04000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@ moving notifications to history section for %{public}@ on mute assertion change to %@", buf, 0x20u);
        }
        v49[0] = MEMORY[0x1E4F143A8];
        v49[1] = 3221225472;
        v49[2] = __84__NCNotificationRootList_updateNotificationSectionSettings_previousSectionSettings___block_invoke_67;
        v49[3] = &unk_1E6A927E0;
        v49[4] = self;
        id v50 = v6;
        [v8 enumerateObjectsUsingBlock:v49];
        [(NCNotificationRootList *)self _updateDelegateAndSubclassIfNecessaryOfContentChange];
      }
    }
    int v33 = [v6 isScheduledDeliveryEnabled];
    if (v33 != [v7 isScheduledDeliveryEnabled]
      && [v6 isScheduledDeliveryEnabled])
    {
      char v34 = (void *)*MEMORY[0x1E4FB3778];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
      {
        char v35 = v34;
        uint64_t v36 = [(NCNotificationRootList *)self logDescription];
        char v37 = [v6 sectionIdentifier];
        *(_DWORD *)buf = 138543618;
        os_log_t v54 = v36;
        __int16 v55 = 2114;
        v56 = v37;
        _os_log_impl(&dword_1D7C04000, v35, OS_LOG_TYPE_DEFAULT, "%{public}@ moving notifications to upcoming digest for %{public}@ on Scheduled Delivery setting enabled", buf, 0x16u);
      }
      v47[0] = MEMORY[0x1E4F143A8];
      v47[1] = 3221225472;
      v47[2] = __84__NCNotificationRootList_updateNotificationSectionSettings_previousSectionSettings___block_invoke_69;
      v47[3] = &unk_1E6A927E0;
      v47[4] = self;
      id v48 = v6;
      [v8 enumerateObjectsUsingBlock:v47];
      [(NCNotificationRootList *)self _updateDelegateAndSubclassIfNecessaryOfContentChange];
    }
  }
  uint64_t v38 = [(NCNotificationRootList *)self notificationSections];
  uint64_t v41 = MEMORY[0x1E4F143A8];
  uint64_t v42 = 3221225472;
  v43 = __84__NCNotificationRootList_updateNotificationSectionSettings_previousSectionSettings___block_invoke_3;
  BOOL v44 = &unk_1E6A927E0;
  id v45 = v6;
  id v46 = v7;
  id v39 = v7;
  id v40 = v6;
  [v38 enumerateObjectsUsingBlock:&v41];

  -[NCSuggestionManager updateNotificationSectionSettings:previousSectionSettings:](self->_suggestionManager, "updateNotificationSectionSettings:previousSectionSettings:", v40, v39, v41, v42, v43, v44);
  [(NCNotificationRootList *)self _notificationListDidChangeContent];
}

void __84__NCNotificationRootList_updateNotificationSectionSettings_previousSectionSettings___block_invoke(uint64_t a1, void *a2)
{
  unint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 historySectionList];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __84__NCNotificationRootList_updateNotificationSectionSettings_previousSectionSettings___block_invoke_2;
  v7[3] = &unk_1E6A927B8;
  id v8 = *(id *)(a1 + 40);
  BYTE2(v6) = 1;
  LOWORD(v6) = 1;
  objc_msgSend(v3, "_migrateNotificationsFromList:toList:passingTest:filterRequestsPassingTest:hideToList:clearRequests:filterForDestination:animateRemoval:reorderGroupNotifications:", v4, v5, v7, 0, 0, 1, v6);
}

uint64_t __84__NCNotificationRootList_updateNotificationSectionSettings_previousSectionSettings___block_invoke_2(uint64_t a1, void *a2)
{
  unint64_t v3 = [a2 sectionIdentifier];
  id v4 = [*(id *)(a1 + 32) sectionIdentifier];
  uint64_t v5 = [v3 isEqualToString:v4];

  return v5;
}

void __84__NCNotificationRootList_updateNotificationSectionSettings_previousSectionSettings___block_invoke_67(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 notificationCount])
  {
    id v4 = *(void **)(a1 + 32);
    uint64_t v5 = [v4 historySectionList];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __84__NCNotificationRootList_updateNotificationSectionSettings_previousSectionSettings___block_invoke_2_68;
    v7[3] = &unk_1E6A927B8;
    id v8 = *(id *)(a1 + 40);
    BYTE2(v6) = 0;
    LOWORD(v6) = 257;
    objc_msgSend(v4, "_migrateNotificationsFromList:toList:passingTest:filterRequestsPassingTest:hideToList:clearRequests:filterForDestination:animateRemoval:reorderGroupNotifications:", v3, v5, v7, 0, 0, 1, v6);
  }
}

BOOL __84__NCNotificationRootList_updateNotificationSectionSettings_previousSectionSettings___block_invoke_2_68(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 sectionIdentifier];
  uint64_t v5 = [*(id *)(a1 + 32) sectionIdentifier];
  if ([v4 isEqualToString:v5])
  {
    uint64_t v6 = [*(id *)(a1 + 32) muteAssertion];
    id v7 = [v3 threadIdentifier];
    BOOL v8 = [v6 activeMuteAssertionLevelForThreadIdentifier:v7] != 0;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

void __84__NCNotificationRootList_updateNotificationSectionSettings_previousSectionSettings___block_invoke_69(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v3 upcomingDigestSectionList];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __84__NCNotificationRootList_updateNotificationSectionSettings_previousSectionSettings___block_invoke_2_70;
  v7[3] = &unk_1E6A927B8;
  id v8 = *(id *)(a1 + 40);
  BYTE2(v6) = 0;
  LOWORD(v6) = 256;
  objc_msgSend(v3, "_migrateNotificationsFromList:toList:passingTest:filterRequestsPassingTest:hideToList:clearRequests:filterForDestination:animateRemoval:reorderGroupNotifications:", v4, v5, v7, 0, 0, 0, v6);
}

uint64_t __84__NCNotificationRootList_updateNotificationSectionSettings_previousSectionSettings___block_invoke_2_70(uint64_t a1, void *a2)
{
  id v3 = [a2 sectionIdentifier];
  id v4 = [*(id *)(a1 + 32) sectionIdentifier];
  uint64_t v5 = [v3 isEqualToString:v4];

  return v5;
}

uint64_t __84__NCNotificationRootList_updateNotificationSectionSettings_previousSectionSettings___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 updateNotificationSectionSettings:*(void *)(a1 + 32) previousSectionSettings:*(void *)(a1 + 40)];
}

- (NSString)logDescription
{
  id v2 = NSString;
  id v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  uint64_t v5 = [v2 stringWithFormat:@"Notification Root List [%@]", v4];

  return (NSString *)v5;
}

- (double)scrollViewVisibleContentLayoutOffsetY
{
  id v3 = [(NCNotificationRootList *)self rootListView];
  [v3 contentLayoutOffset];
  double v5 = v4;

  uint64_t v6 = [(NCNotificationRootList *)self rootListView];
  [v6 contentOffset];
  double v8 = v7;
  uint64_t v9 = [(NCNotificationRootList *)self rootListView];
  [v9 contentInset];
  double v11 = v8 + v10;

  double v12 = 0.0;
  if (v11 > v5 && v5 > 0.0) {
    double v12 = v11;
  }
  return v5 - v12;
}

- (void)setDeviceAuthenticated:(BOOL)a3
{
  if (self->_deviceAuthenticated != a3)
  {
    BOOL v3 = a3;
    self->_deviceAuthenticated = a3;
    double v5 = [(NCNotificationRootList *)self suggestionManager];
    [v5 setDeviceAuthenticated:v3];

    uint64_t v6 = (void *)MEMORY[0x1E4F1CA80];
    double v7 = [(NCNotificationRootList *)self _notificationSectionListsForEnumeration];
    double v8 = [v6 setWithSet:v7];

    if (self->_upcomingDigestSectionList) {
      objc_msgSend(v8, "addObject:");
    }
    if (self->_currentDigestSectionList) {
      objc_msgSend(v8, "addObject:");
    }
    if (self->_upcomingMissedSectionList) {
      objc_msgSend(v8, "addObject:");
    }
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __49__NCNotificationRootList_setDeviceAuthenticated___block_invoke;
    v9[3] = &__block_descriptor_33_e49_v24__0__NCNotificationStructuredSectionList_8_B16l;
    BOOL v10 = v3;
    [v8 enumerateObjectsUsingBlock:v9];
    [(NCNotificationRootList *)self _performDeferredMigrationIfNecessary];
    if (![(NCNotificationRootList *)self isNotificationHistoryRevealed]) {
      [(NCNotificationRootList *)self _sortNotificationGroupsIfNecessary];
    }
    [(NCNotificationRootList *)self _notificationListDidChangeContent];
  }
}

uint64_t __49__NCNotificationRootList_setDeviceAuthenticated___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setDeviceAuthenticated:*(unsigned __int8 *)(a1 + 32)];
}

- (void)notificationsLoadedForSectionIdentifier:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = [(NCNotificationRootList *)self loadedNotificationSections];
  char v6 = [v5 containsObject:v4];

  if ((v6 & 1) == 0)
  {
    double v7 = (void *)*MEMORY[0x1E4FB3778];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
    {
      double v8 = v7;
      uint64_t v9 = [(NCNotificationRootList *)self logDescription];
      *(_DWORD *)buf = 138543618;
      uint64_t v25 = v9;
      __int16 v26 = 2114;
      id v27 = v4;
      _os_log_impl(&dword_1D7C04000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ notifications loaded for section %{public}@", buf, 0x16u);
    }
    BOOL v10 = [(NCNotificationRootList *)self loadedNotificationSections];
    double v11 = (void *)[v4 copy];
    [v10 addObject:v11];

    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    double v12 = [(NCNotificationRootList *)self notificationSections];
    uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v20 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          if ([v17 preloadsNotificationRequests]) {
            [v17 notificationsLoadedForSectionIdentifier:v4];
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v14);
    }

    __int16 v18 = [(NCNotificationRootList *)self persistentStateManager];
    [v18 notificationsLoadedForSectionIdentifier:v4];
  }
}

- (id)_sectionContainsNotificationRequest:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = [(NCNotificationRootList *)self notificationSections];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __62__NCNotificationRootList__sectionContainsNotificationRequest___block_invoke;
  v22[3] = &unk_1E6A92828;
  id v6 = v4;
  id v23 = v6;
  uint64_t v7 = [v5 indexOfObjectPassingTest:v22];

  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    double v8 = (void *)*MEMORY[0x1E4FB3778];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = v8;
      BOOL v10 = [(NCNotificationRootList *)self logDescription];
      double v11 = [v6 notificationIdentifier];
      double v12 = objc_msgSend(v11, "un_logDigest");
      *(_DWORD *)buf = 138543618;
      uint64_t v25 = v10;
      __int16 v26 = 2114;
      id v27 = v12;
      _os_log_impl(&dword_1D7C04000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ Request %{public}@ does not exist in the lists.", buf, 0x16u);
    }
    uint64_t v13 = 0;
  }
  else
  {
    uint64_t v14 = [(NCNotificationRootList *)self notificationSections];
    uint64_t v13 = [v14 objectAtIndex:v7];

    uint64_t v15 = (void *)*MEMORY[0x1E4FB3778];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
    {
      long long v16 = v15;
      uint64_t v17 = [(NCNotificationRootList *)self logDescription];
      __int16 v18 = [v6 notificationIdentifier];
      long long v19 = objc_msgSend(v18, "un_logDigest");
      long long v20 = NCNotificationListSectionTypeString([v13 sectionType]);
      *(_DWORD *)buf = 138543874;
      uint64_t v25 = v17;
      __int16 v26 = 2114;
      id v27 = v19;
      __int16 v28 = 2114;
      double v29 = v20;
      _os_log_impl(&dword_1D7C04000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ Found request %{public}@ in section %{public}@", buf, 0x20u);
    }
  }

  return v13;
}

uint64_t __62__NCNotificationRootList__sectionContainsNotificationRequest___block_invoke(uint64_t a1, void *a2)
{
  return [a2 containsNotificationRequest:*(void *)(a1 + 32)];
}

- (BOOL)containsNotificationRequest:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  double v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  double v5 = [(NCNotificationRootList *)self notificationSections];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __54__NCNotificationRootList_containsNotificationRequest___block_invoke;
  v8[3] = &unk_1E6A92850;
  id v6 = v4;
  id v9 = v6;
  BOOL v10 = &v11;
  [v5 enumerateObjectsUsingBlock:v8];

  LOBYTE(v5) = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);

  return (char)v5;
}

uint64_t __54__NCNotificationRootList_containsNotificationRequest___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 containsNotificationRequest:*(void *)(a1 + 32)];
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (NSDate)comparisonDate
{
  return 0;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)NCNotificationRootList;
  if (-[NCNotificationRootList respondsToSelector:](&v8, sel_respondsToSelector_))
  {
    char v5 = 1;
  }
  else if (+[NCNotificationStructuredListUtilities isNotificationListComponentDelegateMethod:a3])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v5 = objc_opt_respondsToSelector();
  }
  else
  {
    char v5 = 0;
  }
  return v5 & 1;
}

- (void)forwardInvocation:(id)a3
{
  id v4 = a3;
  if (+[NCNotificationStructuredListUtilities isNotificationListComponentDelegateMethod:](NCNotificationStructuredListUtilities, "isNotificationListComponentDelegateMethod:", [v4 selector]))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector())
    {
      [v4 invokeWithTarget:WeakRetained];
    }
    else
    {
      v6.receiver = self;
      v6.super_class = (Class)NCNotificationRootList;
      [(NCNotificationRootList *)&v6 forwardInvocation:v4];
    }
  }
}

- (void)notificationListBaseComponentRequestsClearingAll:(id)a3
{
  id v4 = a3;
  char v5 = [(id)objc_opt_class() presentableTypes];
  objc_super v6 = +[NCNotificationStructuredSectionList presentableTypes];
  uint64_t v7 = [v5 isSubsetOfSet:v6];

  objc_super v8 = objc_opt_class();
  id v9 = [v8 presentableTypes];
  BOOL v10 = +[NCNotificationListSupplementaryViewsSection presentableTypes];
  uint64_t v11 = [v9 isSubsetOfSet:v10];

  [(NCNotificationRootList *)self _clearAllNotifications:v7 supplementaryViewControllers:v11];
}

- (id)notificationStructuredSectionList:(id)a3 requestsAuxiliaryOptionsContentProviderForNotificationRequest:(id)a4 isLongLook:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  objc_super v8 = [(NCNotificationRootList *)self suggestionManager];
  id v9 = [v8 auxiliaryOptionsContentProviderForNotificationRequest:v7 isLongLook:v5];

  return v9;
}

- (BOOL)notificationStructuredSectionList:(id)a3 shouldFilterNotificationRequest:(id)a4
{
  id v5 = a4;
  objc_super v6 = [(NCNotificationRootList *)self delegate];
  LOBYTE(self) = [v6 notificationRootList:self shouldFilterNotificationRequest:v5];

  return (char)self;
}

- (BOOL)notificationStructuredSectionList:(id)a3 areNotificationsLoadedForSectionIdentifier:(id)a4
{
  id v5 = a4;
  objc_super v6 = [(NCNotificationRootList *)self loadedNotificationSections];
  char v7 = [v6 containsObject:v5];

  return v7;
}

- (void)notificationStructuredSectionList:(id)a3 transitionedGroupedStateIsGrouped:(BOOL)a4
{
  if (self->_currentDigestSectionList == a3 || self->_upcomingDigestSectionList == a3)
  {
    id v4 = [(NCNotificationRootList *)self rootListView];
    [v4 setNeedsLayout];
  }
}

- (void)notificationStructuredSectionListRequestsClearingSection:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)*MEMORY[0x1E4FB3778];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
  {
    objc_super v6 = v5;
    char v7 = [(NCNotificationRootList *)self logDescription];
    objc_super v8 = [v4 logDescription];
    int v9 = 138543618;
    BOOL v10 = v7;
    __int16 v11 = 2114;
    double v12 = v8;
    _os_log_impl(&dword_1D7C04000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ requested to clear %{public}@ from the list", (uint8_t *)&v9, 0x16u);
  }
  [v4 clearAll];
  [(NCNotificationRootList *)self _notificationListDidChangeContent];
}

- (void)notificationStructuredSectionListDidClearAllNotificationRequests:(id)a3
{
  if (self->_currentDigestSectionList == a3)
  {
    [(NCNotificationRootList *)self _removeCurrentDigestSectionListFromContainingSectionList];
    currentDigestSectionList = self->_currentDigestSectionList;
    self->_currentDigestSectionList = 0;
  }

  [(NCNotificationRootList *)self _notificationListDidChangeContent];
}

- (BOOL)shouldScrollToTopForNotificationListBaseComponent:(id)a3
{
  id v4 = a3;
  id v5 = [(NCNotificationRootList *)self rootListView];
  [v5 contentSize];
  double v7 = v6;

  objc_super v8 = [v4 listView];

  [v8 frame];
  double Height = CGRectGetHeight(v16);

  BOOL v10 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v10 bounds];
  double v11 = CGRectGetHeight(v17);

  double v12 = [(NCNotificationRootList *)self rootListView];
  [v12 contentInset];
  double v14 = v13;

  return v7 - Height + v14 < v11;
}

- (void)notificationListComponent:(id)a3 didRemoveNotificationRequest:(id)a4
{
  id v5 = a4;
  double v6 = [(NCNotificationRootList *)self delegate];
  [v6 notificationListComponent:self didRemoveNotificationRequest:v5];

  [(NCNotificationRootList *)self _notificationListDidChangeContent];
}

- (void)notificationListBaseComponentDidRemoveAll:(id)a3
{
  id v4 = [(NCNotificationRootList *)self delegate];
  [v4 notificationListBaseComponentDidRemoveAll:self];

  [(NCNotificationRootList *)self _notificationListDidChangeContent];
}

- (BOOL)handleTapOnNotificationListBaseComponent:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(NCNotificationRootList *)self incomingSectionList];
  if (v5 != v4)
  {

LABEL_7:
    BOOL v13 = 0;
    goto LABEL_8;
  }
  int64_t v6 = [(NCNotificationRootList *)self currentListDisplayStyleSetting];

  if (v6 != 1) {
    goto LABEL_7;
  }
  double v7 = (void *)*MEMORY[0x1E4FB3778];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
  {
    objc_super v8 = v7;
    int v9 = [(NCNotificationRootList *)self logDescription];
    BOOL v10 = [MEMORY[0x1E4FB3808] stringForNotificationListDisplayStyleSetting:1];
    double v11 = [MEMORY[0x1E4FB3808] stringForNotificationListDisplayStyleSetting:0];
    int v15 = 138543874;
    CGRect v16 = v9;
    __int16 v17 = 2114;
    __int16 v18 = v10;
    __int16 v19 = 2114;
    long long v20 = v11;
    _os_log_impl(&dword_1D7C04000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ transitioning to %{public}@ from %{public}@ on user tap", (uint8_t *)&v15, 0x20u);
  }
  [(NCNotificationRootList *)self setOverrideNotificationListDisplayStyleSetting:0 forReason:@"NCNotificationListDisplayStyleReasonInteractiveTransition" hideNotificationCount:0];
  double v12 = [(NCNotificationRootList *)self incomingSectionList];
  BOOL v13 = (unint64_t)[v12 count] > 1;

LABEL_8:
  return v13;
}

- (void)supplementaryViewSectionDidChangeContent:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(NCNotificationRootList *)self _hasLiveActivitiesWithThreshold:1])
  {
    id v5 = (void *)*MEMORY[0x1E4FB3778];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
    {
      int64_t v6 = v5;
      double v7 = [v4 descriptionString];
      int v9 = 138543362;
      BOOL v10 = v7;
      _os_log_impl(&dword_1D7C04000, v6, OS_LOG_TYPE_DEFAULT, "Moving digest for live activity %{public}@", (uint8_t *)&v9, 0xCu);
    }
    objc_super v8 = [(NCNotificationRootList *)self currentDigestSectionList];
    [v8 collapseSummarizedSectionList];

    [(NCNotificationRootList *)self _migrateCurrentDigestSectionListToReadSection];
  }
  [(NCNotificationRootList *)self _updateForceExpansionForHighlights];
}

- (double)notificationListView:(id)a3 heightForItemAtIndex:(unint64_t)a4 withWidth:(double)a5
{
  double v7 = [(NCNotificationRootList *)self _notificationListSections];
  double v8 = 0.0;
  if ([v7 count] > a4)
  {
    int v9 = [v7 objectAtIndex:a4];
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
    {
      uint64_t v10 = objc_opt_class();
      id v11 = v9;
      if (v10)
      {
        if (objc_opt_isKindOfClass()) {
          double v12 = v9;
        }
        else {
          double v12 = 0;
        }
      }
      else
      {
        double v12 = 0;
      }
      id v13 = v12;

      double v14 = [v13 listView];

      objc_msgSend(v14, "sizeThatFits:", a5, 0.0);
      double v8 = v15;
    }
  }

  return v8;
}

- (id)notificationListView:(id)a3 viewForItemAtIndex:(unint64_t)a4
{
  int64_t v6 = [(NCNotificationRootList *)self _notificationListSections];
  if ([v6 count] <= a4)
  {
    double v8 = 0;
  }
  else
  {
    double v7 = [v6 objectAtIndex:a4];
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
    {
      uint64_t v9 = objc_opt_class();
      id v10 = v7;
      if (v9)
      {
        if (objc_opt_isKindOfClass()) {
          id v11 = v7;
        }
        else {
          id v11 = 0;
        }
      }
      else
      {
        id v11 = 0;
      }
      id v12 = v11;

      double v8 = [v12 listView];
    }
    else
    {
      double v8 = 0;
    }
    id v13 = [(NCNotificationRootList *)self rootListView];
    [v13 frame];
    CGFloat v15 = v14;
    CGFloat v17 = v16;
    CGFloat v19 = v18;
    CGFloat v21 = v20;

    v25.origin.x = v15;
    v25.origin.y = v17;
    v25.size.width = v19;
    v25.size.height = v21;
    double Width = CGRectGetWidth(v25);
    v26.origin.x = v15;
    v26.origin.y = v17;
    v26.size.width = v19;
    v26.size.height = v21;
    objc_msgSend(v8, "setFrame:", 0.0, 0.0, Width, CGRectGetHeight(v26));
  }

  return v8;
}

- (unint64_t)notificationListViewNumberOfItems:(id)a3
{
  BOOL v3 = [(NCNotificationRootList *)self _notificationListSections];
  unint64_t v4 = [v3 count];

  return v4;
}

- (void)recycleView:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v3 recycleVisibleViews];
  }
}

- (double)footerViewHeightForNotificationList:(id)a3 withWidth:(double)a4
{
  return 60.0;
}

- (void)notificationListDidLayoutSubviews
{
  uint64_t v15 = 0;
  double v16 = (CGRect *)&v15;
  uint64_t v17 = 0x4010000000;
  double v18 = &unk_1D7DBF3F7;
  long long v3 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
  long long v19 = *MEMORY[0x1E4F1DB20];
  long long v20 = v3;
  unint64_t v4 = [(NCNotificationRootList *)self notificationSections];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __59__NCNotificationRootList_notificationListDidLayoutSubviews__block_invoke;
  v14[3] = &unk_1E6A92768;
  void v14[4] = &v15;
  [v4 enumerateObjectsUsingBlock:v14];

  id v5 = [(NCNotificationRootList *)self supplementaryViewsSections];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __59__NCNotificationRootList_notificationListDidLayoutSubviews__block_invoke_2;
  v13[3] = &unk_1E6A92718;
  void v13[4] = &v15;
  [v5 enumerateObjectsUsingBlock:v13];

  BOOL IsNull = CGRectIsNull(v16[1]);
  double v7 = v16;
  if (IsNull)
  {
    CGSize v8 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
    v16[1].origin = (CGPoint)*MEMORY[0x1E4F1DB28];
    v7[1].CGSize size = v8;
  }
  if (!CGRectEqualToRect(self->_aggregatedVisibleContentExtent, v7[1]))
  {
    CGSize size = v16[1].size;
    self->_aggregatedVisibleContentExtent.origin = v16[1].origin;
    self->_aggregatedVisibleContentExtent.CGSize size = size;
    id v10 = [(NCNotificationRootList *)self rootListView];
    id v11 = [v10 debugView];
    objc_msgSend(v11, "displayRect:withName:", @"aggregatedVisibleContentExtent", self->_aggregatedVisibleContentExtent.origin.x, self->_aggregatedVisibleContentExtent.origin.y, self->_aggregatedVisibleContentExtent.size.width, self->_aggregatedVisibleContentExtent.size.height);

    id v12 = [(NCNotificationRootList *)self delegate];
    [v12 notificationRootListDidUpdateVisibleContentExtent:self];
  }
  _Block_object_dispose(&v15, 8);
}

void __59__NCNotificationRootList_notificationListDidLayoutSubviews__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  unint64_t v4 = [v3 listView];
  [v4 frame];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;

  LODWORD(v4) = [v3 isSectionVisible];
  if (v4)
  {
    v13.origin.x = v6;
    v13.origin.y = v8;
    v13.size.width = v10;
    v13.size.height = v12;
    if (CGRectGetHeight(v13) > 0.0)
    {
      v14.origin.x = v6;
      v14.origin.y = v8;
      v14.size.width = v10;
      v14.size.height = v12;
      *(CGRect *)(*(void *)(*(void *)(a1 + 32) + 8) + 32) = CGRectUnion(*(CGRect *)(*(void *)(*(void *)(a1 + 32) + 8)+ 32), v14);
    }
  }
}

void __59__NCNotificationRootList_notificationListDidLayoutSubviews__block_invoke_2(uint64_t a1, void *a2)
{
  id v12 = a2;
  id v3 = [v12 supplementaryViewControllers];
  uint64_t v4 = [v3 count];

  uint64_t v5 = [v12 position];
  if (v4 && v5 != 1)
  {
    CGFloat v6 = *(CGRect **)(*(void *)(a1 + 32) + 8);
    double v7 = [v12 listView];
    [v7 frame];
    v14.origin.x = v8;
    v14.origin.y = v9;
    v14.size.width = v10;
    v14.size.height = v11;
    *(CGRect *)(*(void *)(*(void *)(a1 + 32) + 8) + 32) = CGRectUnion(v6[1], v14);
  }
}

- (void)suggestionManager:(id)a3 requestsUpdatingContentForNotificationRequest:(id)a4
{
}

- (void)suggestionManager:(id)a3 requestsPresentingNotificationManagementViewType:(unint64_t)a4 forNotificationRequest:(id)a5 withPresentingView:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = [(NCNotificationRootList *)self delegate];
  [v11 notificationListComponent:self requestsPresentingManagementViewForNotificationRequest:v10 managementViewType:a4 withPresentingView:v9 completion:0];
}

- (id)suggestionManager:(id)a3 requestsSectionSettingsForSectionIdentifier:(id)a4
{
  id v5 = a4;
  CGFloat v6 = [(NCNotificationRootList *)self delegate];
  double v7 = [v6 notificationListComponent:self sectionSettingsForSectionIdentifier:v5];

  return v7;
}

- (void)suggestionManager:(id)a3 setMuted:(BOOL)a4 untilDate:(id)a5 forSectionIdentifier:(id)a6 threadIdentifier:(id)a7
{
  BOOL v9 = a4;
  id v11 = a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = [(NCNotificationRootList *)self delegate];
  [v14 notificationListComponent:self setMuted:v9 untilDate:v13 forSectionIdentifier:v12 threadIdentifier:v11];
}

- (void)suggestionManager:(id)a3 setScheduledDelivery:(BOOL)a4 forSectionIdentifier:(id)a5
{
  BOOL v5 = a4;
  id v7 = a5;
  id v8 = [(NCNotificationRootList *)self delegate];
  [v8 notificationListComponent:self setScheduledDelivery:v5 forSectionIdentifier:v7];
}

- (void)suggestionManager:(id)a3 setAllowsTimeSensitive:(BOOL)a4 forSectionIdentifier:(id)a5
{
  BOOL v5 = a4;
  id v7 = a5;
  id v8 = [(NCNotificationRootList *)self delegate];
  [v8 notificationListComponent:self setAllowsTimeSensitive:v5 forSectionIdentifier:v7];
}

- (void)suggestionManager:(id)a3 setAllowsDirectMessages:(BOOL)a4 forSectionIdentifier:(id)a5
{
  BOOL v5 = a4;
  id v7 = a5;
  id v8 = [(NCNotificationRootList *)self delegate];
  [v8 notificationListComponent:self setAllowsDirectMessages:v5 forSectionIdentifier:v7];
}

- (id)suggestionManager:(id)a3 notificationRequestForUUID:(id)a4
{
  id v5 = a4;
  CGFloat v6 = [(NCNotificationRootList *)self delegate];
  id v7 = [v6 notificationListComponent:self notificationRequestForUUID:v5];

  return v7;
}

- (id)suggestionManagerRequestsCurrentModeConfiguration:(id)a3
{
  uint64_t v4 = [(NCNotificationRootList *)self delegate];
  id v5 = [v4 notificationListComponentRequestsCurrentModeConfiguration:self];

  return v5;
}

- (void)suggestionManager:(id)a3 setModeConfiguration:(id)a4
{
  id v5 = a4;
  id v6 = [(NCNotificationRootList *)self delegate];
  [v6 notificationListComponent:self setModeConfiguration:v5];
}

- (BOOL)suggestionManager:(id)a3 isSummaryVisibleForNotificationRequest:(id)a4
{
  id v5 = a4;
  id v6 = [(NCNotificationRootList *)self _sectionContainsNotificationRequest:v5];
  char v7 = [v6 isShowingSummaryForNotificationRequest:v5];

  return v7;
}

- (BOOL)suggestionManager:(id)a3 isThreadSummaryVisibleForNotificationRequest:(id)a4
{
  id v5 = a4;
  id v6 = [(NCNotificationRootList *)self _sectionContainsNotificationRequest:v5];
  char v7 = [v6 isShowingSummarizedStackForNotificationRequest:v5];

  return v7;
}

- (void)adjustForLegibilitySettingsChange:(id)a3
{
  id v4 = a3;
  id v5 = [(NCNotificationRootList *)self _notificationSectionListsForEnumeration];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __60__NCNotificationRootList_adjustForLegibilitySettingsChange___block_invoke;
  v7[3] = &unk_1E6A92878;
  id v8 = v4;
  id v6 = v4;
  [v5 enumerateObjectsUsingBlock:v7];
}

uint64_t __60__NCNotificationRootList_adjustForLegibilitySettingsChange___block_invoke(uint64_t a1, void *a2)
{
  return [a2 adjustForLegibilitySettingsChange:*(void *)(a1 + 32)];
}

- (BOOL)adjustForContentSizeCategoryChange
{
  id v3 = [(NCNotificationRootList *)self _notificationSectionListsForEnumeration];
  [v3 enumerateObjectsUsingBlock:&__block_literal_global_88];

  [(NSMutableArray *)self->_supplementaryViewsSections enumerateObjectsUsingBlock:&__block_literal_global_90];
  id v4 = [(NCNotificationRootList *)self notificationListCache];
  [v4 adjustForContentSizeCategoryChange];

  id v5 = [(NCNotificationRootList *)self supplementaryCache];
  [v5 adjustForContentSizeCategoryChange];

  id v6 = [(NCNotificationRootList *)self notificationSummaryCache];
  [v6 adjustForContentSizeCategoryChange];

  return 1;
}

uint64_t __60__NCNotificationRootList_adjustForContentSizeCategoryChange__block_invoke(uint64_t a1, void *a2)
{
  return [a2 adjustForContentSizeCategoryChange];
}

uint64_t __60__NCNotificationRootList_adjustForContentSizeCategoryChange__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 adjustForContentSizeCategoryChange];
}

- (Class)notificationListCacheNotificationViewControllerClass:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    id v5 = (void *)[WeakRetained notificationRootListNotificationViewControllerClass:self];
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  return v6;
}

- (void)publishScheduledDigest:(id)a3 upcomingDigest:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)*MEMORY[0x1E4FB3778];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
  {
    BOOL v9 = v8;
    id v10 = [(NCNotificationRootList *)self logDescription];
    int v11 = 138543618;
    id v12 = v10;
    __int16 v13 = 2114;
    id v14 = v6;
    _os_log_impl(&dword_1D7C04000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ received request from Digest Schedule Manager to promote upcoming digest to current with digest info = %{public}@", (uint8_t *)&v11, 0x16u);
  }
  [(NCNotificationRootList *)self _dissolveCurrentDigestSectionListToHistorySection];
  [(NCNotificationRootList *)self _migrateUpcomingDigestSectionListToCurrentDigestSectionList];
  [(NCNotificationRootList *)self _configureUpcomingDigestSectionListWithDigestInfo:v7];
  [(NCNotificationRootList *)self _notificationListDidChangeContent];
}

- (void)publishUpcomingDigest:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)*MEMORY[0x1E4FB3778];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v5;
    id v7 = [(NCNotificationRootList *)self logDescription];
    int v8 = 138543618;
    BOOL v9 = v7;
    __int16 v10 = 2114;
    id v11 = v4;
    _os_log_impl(&dword_1D7C04000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ received request Digest Schedule Manager to publish upcoming digest with digest info = %{public}@", (uint8_t *)&v8, 0x16u);
  }
  if (self->_upcomingDigestSectionList) {
    [(NCNotificationRootList *)self _updateUpcomingDigestSectionListWithDigestInfo:v4];
  }
  else {
    [(NCNotificationRootList *)self _configureUpcomingDigestSectionListWithDigestInfo:v4];
  }
  [(NCNotificationRootList *)self _notificationListDidChangeContent];
}

- (void)revokeUpcomingDigest:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)*MEMORY[0x1E4FB3778];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v5;
    id v7 = [(NCNotificationRootList *)self logDescription];
    int v8 = 138543618;
    BOOL v9 = v7;
    __int16 v10 = 2114;
    id v11 = v4;
    _os_log_impl(&dword_1D7C04000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ received request from Digest Schedule Manager to cancel digest with digest info = %{public}@", (uint8_t *)&v8, 0x16u);
  }
  [(NCNotificationRootList *)self _dissolveCurrentDigestSectionListToHistorySection];
  [(NCNotificationRootList *)self _dissolveUpcomingDigestSectionListToHistorySection];
  [(NCNotificationRootList *)self _notificationListDidChangeContent];
}

- (void)persistentStateManager:(id)a3 didFetchSummaryMigrationTime:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  [v5 timeIntervalSinceNow];
  double v7 = v6;
  int v8 = (void *)*MEMORY[0x1E4FB3778];
  BOOL v9 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT);
  if (v7 <= 0.0)
  {
    if (v9)
    {
      uint64_t v12 = v8;
      __int16 v13 = [(NCNotificationRootList *)self logDescription];
      int v14 = 138543618;
      uint64_t v15 = v13;
      __int16 v16 = 2112;
      id v17 = v5;
      _os_log_impl(&dword_1D7C04000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ persisted stored migration time for digest at %@ has expired!", (uint8_t *)&v14, 0x16u);
    }
  }
  else
  {
    if (v9)
    {
      __int16 v10 = v8;
      id v11 = [(NCNotificationRootList *)self logDescription];
      int v14 = 138543618;
      uint64_t v15 = v11;
      __int16 v16 = 2112;
      id v17 = v5;
      _os_log_impl(&dword_1D7C04000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ received persisted stored migration time for digest at %@", (uint8_t *)&v14, 0x16u);
    }
    [(NCNotificationListMigrationScheduler *)self->_migrationScheduler setMigrationDateForNotificationDigest:v5];
  }
}

- (void)persistentStateManager:(id)a3 hasStoredDataForSectionType:(unint64_t)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  double v7 = (os_log_t *)MEMORY[0x1E4FB3778];
  int v8 = (void *)*MEMORY[0x1E4FB3778];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
  {
    BOOL v9 = v8;
    __int16 v10 = [(NCNotificationRootList *)self logDescription];
    id v11 = NCNotificationListSectionTypeString(a4);
    int v16 = 138543618;
    id v17 = v10;
    __int16 v18 = 2114;
    long long v19 = v11;
    _os_log_impl(&dword_1D7C04000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ has persisted stored data for section %{public}@", (uint8_t *)&v16, 0x16u);
  }
  if (a4 == 4)
  {
    os_log_t v12 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v13 = v12;
      int v14 = [(NCNotificationRootList *)self logDescription];
      uint64_t v15 = NCNotificationListSectionTypeString(4uLL);
      int v16 = 138543618;
      id v17 = v14;
      __int16 v18 = 2114;
      long long v19 = v15;
      _os_log_impl(&dword_1D7C04000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ deferring presentation of section %{public}@ pending stored data load", (uint8_t *)&v16, 0x16u);
    }
    [(NCNotificationRootList *)self setDeferCurrentDigestPresentationForPersistedDataLoad:1];
  }
}

- (void)persistentStateManager:(id)a3 finishedLoadingDataForSectionType:(unint64_t)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  double v7 = (os_log_t *)MEMORY[0x1E4FB3778];
  int v8 = (void *)*MEMORY[0x1E4FB3778];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
  {
    BOOL v9 = v8;
    __int16 v10 = [(NCNotificationRootList *)self logDescription];
    id v11 = NCNotificationListSectionTypeString(a4);
    int v16 = 138543618;
    id v17 = v10;
    __int16 v18 = 2114;
    long long v19 = v11;
    _os_log_impl(&dword_1D7C04000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ finished loading stored data for section %{public}@", (uint8_t *)&v16, 0x16u);
  }
  if (a4 == 4)
  {
    os_log_t v12 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v13 = v12;
      int v14 = [(NCNotificationRootList *)self logDescription];
      uint64_t v15 = NCNotificationListSectionTypeString(4uLL);
      int v16 = 138543618;
      id v17 = v14;
      __int16 v18 = 2114;
      long long v19 = v15;
      _os_log_impl(&dword_1D7C04000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ enabling presentation for section %{public}@ on stored data load finish", (uint8_t *)&v16, 0x16u);
    }
    [(NCNotificationRootList *)self setDeferCurrentDigestPresentationForPersistedDataLoad:0];
    if (self->_currentDigestSectionList
      && ![(NCNotificationRootList *)self _isCurrentDigestListInHistorySectionList]&& [(NCNotificationStructuredSectionList *)self->_currentDigestSectionList sectionType] == 4)
    {
      if ([(NCNotificationRootList *)self _isPersistentStateCurrentDigestInMissedSection])
      {
        [(NCNotificationRootList *)self _insertCurrentDigestSectionListToMissedSectionList];
      }
      else
      {
        [(NCNotificationRootList *)self _insertCurrentDigestSectionList];
      }
    }
  }
}

- (void)persistentStateManager:(id)a3 didFetchMigrationTime:(id)a4 forNotificationRequest:(id)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  BOOL v9 = (void *)*MEMORY[0x1E4FB3778];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
  {
    __int16 v10 = v9;
    id v11 = [(NCNotificationRootList *)self logDescription];
    os_log_t v12 = [v8 notificationIdentifier];
    __int16 v13 = objc_msgSend(v12, "un_logDigest");
    *(_DWORD *)buf = 138543874;
    __int16 v18 = v11;
    __int16 v19 = 2114;
    uint64_t v20 = v13;
    __int16 v21 = 2112;
    id v22 = v7;
    _os_log_impl(&dword_1D7C04000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ received persisted stored migration time for request %{public}@ at %@", buf, 0x20u);
  }
  migrationScheduler = self->_migrationScheduler;
  id v16 = v8;
  uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v16 count:1];
  [(NCNotificationListMigrationScheduler *)migrationScheduler addMigrationForNotificationRequests:v15 forDate:v7];
}

- (void)persistentStateManager:(id)a3 didFetchStoredListInfo:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = (void *)*MEMORY[0x1E4FB3778];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
  {
    id v7 = v6;
    id v8 = [(NCNotificationRootList *)self logDescription];
    int v11 = 138543618;
    os_log_t v12 = v8;
    __int16 v13 = 2114;
    id v14 = v5;
    _os_log_impl(&dword_1D7C04000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ received persisted stored info = %{public}@", (uint8_t *)&v11, 0x16u);
  }
  BOOL v9 = (NSDictionary *)[v5 copy];
  persistentStoredListInfo = self->_persistentStoredListInfo;
  self->_persistentStoredListInfo = v9;
}

- (void)persistentStateManager:(id)a3 didMigratedTimeSensitiveForNotificationRequest:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = (void *)*MEMORY[0x1E4FB3778];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
  {
    id v7 = v6;
    id v8 = [(NCNotificationRootList *)self logDescription];
    BOOL v9 = [v5 notificationIdentifier];
    __int16 v10 = objc_msgSend(v9, "un_logDigest");
    int v11 = 138543618;
    os_log_t v12 = v8;
    __int16 v13 = 2114;
    id v14 = v10;
    _os_log_impl(&dword_1D7C04000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ received persisted stored migrated time sensitive request %{public}@", (uint8_t *)&v11, 0x16u);
  }
  [(NCNotificationListMigrationScheduler *)self->_migrationScheduler addMigratedTimeSensitiveNotificationRequests:v5];
}

- (void)notificationListMigrationSchedulerRequestsMigratingNotificationDigest:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (os_log_t *)MEMORY[0x1E4FB3778];
  id v6 = (void *)*MEMORY[0x1E4FB3778];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
  {
    id v7 = v6;
    id v8 = [(NCNotificationRootList *)self logDescription];
    int v13 = 138543362;
    id v14 = v8;
    _os_log_impl(&dword_1D7C04000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ migration scheduler requesting digest migration", (uint8_t *)&v13, 0xCu);
  }
  if (![(NCNotificationRootList *)self _isCurrentDigestListAboveHistorySectionList])goto LABEL_9; {
  if (![(NCNotificationRootList *)self deviceAuthenticated])
  }
  {
    [(NCNotificationRootList *)self _migrateCurrentDigestSectionListToReadSection];
LABEL_9:
    uint64_t v12 = 0;
    goto LABEL_10;
  }
  os_log_t v9 = *v5;
  if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v10 = v9;
    int v11 = [(NCNotificationRootList *)self logDescription];
    int v13 = 138543362;
    id v14 = v11;
    _os_log_impl(&dword_1D7C04000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ deferring digest migration while device is authenticated", (uint8_t *)&v13, 0xCu);
  }
  uint64_t v12 = 1;
LABEL_10:
  [(NCNotificationRootList *)self setDeferDigestMigration:v12];
  [(NCNotificationRootList *)self _notificationListDidChangeContent];
}

- (void)notificationListMigrationScheduler:(id)a3 requestsMigratingNotificationRequests:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (os_log_t *)MEMORY[0x1E4FB3778];
  os_log_t v9 = (void *)*MEMORY[0x1E4FB3778];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
  {
    __int16 v10 = v9;
    int v11 = [(NCNotificationRootList *)self logDescription];
    uint64_t v12 = [v7 count];
    int v13 = objc_msgSend(v7, "bs_map:", &__block_literal_global_96);
    *(_DWORD *)buf = 138543874;
    id v22 = v11;
    __int16 v23 = 2048;
    uint64_t v24 = v12;
    __int16 v25 = 2112;
    CGRect v26 = v13;
    _os_log_impl(&dword_1D7C04000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ migration scheduler requesting migration for %lu requests = %@", buf, 0x20u);
  }
  if ([(NCNotificationRootList *)self deviceAuthenticated])
  {
    os_log_t v14 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = v14;
      id v16 = [(NCNotificationRootList *)self logDescription];
      *(_DWORD *)buf = 138543362;
      id v22 = v16;
      _os_log_impl(&dword_1D7C04000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ deferring migration of requests while device is authenticated", buf, 0xCu);
    }
    notificationRequestsPendingMigration = self->_notificationRequestsPendingMigration;
    if (!notificationRequestsPendingMigration)
    {
      __int16 v18 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      __int16 v19 = self->_notificationRequestsPendingMigration;
      self->_notificationRequestsPendingMigration = v18;

      notificationRequestsPendingMigration = self->_notificationRequestsPendingMigration;
    }
    [(NSMutableArray *)notificationRequestsPendingMigration addObjectsFromArray:v7];
  }
  else
  {
    [(NCNotificationRootList *)self _migrateNonActiveHighlightNotificationRequestsFromHighlightToIncomingSection:v7];
    [(NCNotificationRootList *)self _migrateOnScheduleNotificationRequestsFromIncomingSectionToHistorySection:v7];
    if ((_NCReactiveListUI() & 1) == 0
      && [(NCNotificationRootList *)self currentListDisplayStyleSetting] == 2)
    {
      [(NCNotificationRootList *)self _migrateOnScheduleNotificationRequestsFromProminentIncomingSectionToIncomingSection:v7];
    }
  }
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __99__NCNotificationRootList_notificationListMigrationScheduler_requestsMigratingNotificationRequests___block_invoke_97;
  v20[3] = &unk_1E6A91B18;
  v20[4] = self;
  [v7 enumerateObjectsUsingBlock:v20];
  [(NCNotificationRootList *)self _notificationListDidChangeContent];
}

id __99__NCNotificationRootList_notificationListMigrationScheduler_requestsMigratingNotificationRequests___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 notificationIdentifier];
  id v3 = objc_msgSend(v2, "un_logDigest");

  return v3;
}

uint64_t __99__NCNotificationRootList_notificationListMigrationScheduler_requestsMigratingNotificationRequests___block_invoke_97(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 208) removeMigrationForNotificationRequest:a2];
}

- (BOOL)_isAdditionalPanGestureActive
{
  return 0;
}

- (unint64_t)_indexForReveal
{
  return 0;
}

- (void)_signpostScrollingBegan:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = *MEMORY[0x1E4FB3778];
  BOOL v5 = os_signpost_enabled((os_log_t)*MEMORY[0x1E4FB3778]);
  if (v3)
  {
    if (v5)
    {
      __int16 v11 = 0;
      id v6 = "NC_NOTIFICATION_LIST_SCROLL_BEGIN";
      id v7 = (uint8_t *)&v11;
      id v8 = v4;
      os_signpost_type_t v9 = OS_SIGNPOST_INTERVAL_BEGIN;
LABEL_6:
      _os_signpost_emit_with_name_impl(&dword_1D7C04000, v8, v9, 0xEEEEB0B5B2B2EEEELL, v6, " enableTelemetry=YES ", v7, 2u);
    }
  }
  else if (v5)
  {
    __int16 v10 = 0;
    id v6 = "NC_NOTIFICATION_LIST_SCROLL_END";
    id v7 = (uint8_t *)&v10;
    id v8 = v4;
    os_signpost_type_t v9 = OS_SIGNPOST_INTERVAL_END;
    goto LABEL_6;
  }
  kdebug_trace();
}

- (void)_setNotificationHistoryWasRevealed:(BOOL)a3
{
  self->_notificationHistoryRevealed = a3;
}

- (void)_cancelTouchesOnLiveActivities:(BOOL)a3
{
  supplementaryViewsSections = self->_supplementaryViewsSections;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __57__NCNotificationRootList__cancelTouchesOnLiveActivities___block_invoke;
  v4[3] = &__block_descriptor_33_e60_v32__0__NCNotificationListSupplementaryViewsSection_8Q16_B24l;
  BOOL v5 = a3;
  [(NSMutableArray *)supplementaryViewsSections enumerateObjectsUsingBlock:v4];
}

uint64_t __57__NCNotificationRootList__cancelTouchesOnLiveActivities___block_invoke(uint64_t a1, void *a2)
{
  return [a2 cancelTouchesOnHostedViews:*(unsigned __int8 *)(a1 + 32)];
}

- (void)_updateDelegateAndSubclassIfNecessaryOfContentChange
{
}

- (void)_clearAllNotifications:(BOOL)a3 supplementaryViewControllers:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (a3 || a4)
  {
    id v7 = (void *)*MEMORY[0x1E4FB3778];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
    {
      id v8 = v7;
      os_signpost_type_t v9 = [(NCNotificationRootList *)self logDescription];
      int v13 = 138543874;
      os_log_t v14 = v9;
      __int16 v15 = 1024;
      BOOL v16 = v5;
      __int16 v17 = 1024;
      BOOL v18 = v4;
      _os_log_impl(&dword_1D7C04000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ clearing all notification requests: %d supplementary view controller:%d", (uint8_t *)&v13, 0x18u);
    }
    __int16 v10 = +[NCNotificationEventTracker sharedInstance];
    [v10 notificationCenterClearAll];

    self->_performingClearAll = 1;
    if (v5)
    {
      __int16 v11 = [(NCNotificationRootList *)self notificationSections];
      [v11 enumerateObjectsUsingBlock:&__block_literal_global_101];
    }
    if (v4)
    {
      uint64_t v12 = [(NCNotificationRootList *)self supplementaryViewsSections];
      [v12 enumerateObjectsUsingBlock:&__block_literal_global_103];
    }
    self->_performingClearAll = 0;
    [(NCNotificationRootList *)self _setForceRevealed:0];
    [(NCNotificationRootList *)self _updateDelegateAndSubclassIfNecessaryOfContentChange];
    [(NCNotificationRootList *)self _notificationListDidChangeContent];
  }
}

uint64_t __78__NCNotificationRootList__clearAllNotifications_supplementaryViewControllers___block_invoke(uint64_t a1, void *a2)
{
  return [a2 clearAll];
}

uint64_t __78__NCNotificationRootList__clearAllNotifications_supplementaryViewControllers___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 clearAll];
}

- (id)_notificationListSections
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  BOOL v4 = [(NCNotificationRootList *)self supplementaryViewsSections];
  [v3 addObjectsFromArray:v4];

  BOOL v5 = [(NCNotificationRootList *)self notificationSections];
  [v3 addObjectsFromArray:v5];

  return v3;
}

- (void)setScheduledDeliveryEnabled:(BOOL)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (self->_scheduledDeliveryEnabled != a3)
  {
    BOOL v3 = a3;
    BOOL v5 = (void *)*MEMORY[0x1E4FB3778];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
    {
      id v6 = v5;
      uint64_t v7 = [(NCNotificationRootList *)self logDescription];
      id v8 = (void *)v7;
      os_signpost_type_t v9 = @"disabled";
      if (v3) {
        os_signpost_type_t v9 = @"enabled";
      }
      int v13 = 138543618;
      uint64_t v14 = v7;
      __int16 v15 = 2112;
      BOOL v16 = v9;
      _os_log_impl(&dword_1D7C04000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ setting scheduled delivery %@", (uint8_t *)&v13, 0x16u);
    }
    self->_scheduledDeliveryEnabled = v3;
    if (v3)
    {
      __int16 v10 = objc_alloc_init(NCDigestScheduleManager);
      digestScheduleManager = self->_digestScheduleManager;
      self->_digestScheduleManager = v10;

      [(NCDigestScheduleManager *)self->_digestScheduleManager addObserver:self];
    }
    else
    {
      [(NCNotificationRootList *)self _dissolveCurrentDigestSectionListToHistorySection];
      [(NCNotificationRootList *)self _dissolveUpcomingDigestSectionListToHistorySection];
      [(NCDigestScheduleManager *)self->_digestScheduleManager invalidateScheduledTimer];
      uint64_t v12 = self->_digestScheduleManager;
      self->_digestScheduleManager = 0;
    }
  }
}

- (void)_updateVisibleRectForContentOffset:(CGPoint)a3 size:(CGSize)a4
{
  double width = a4.width;
  double x = a3.x;
  double v6 = fmin(a3.y, 0.0);
  CGFloat v7 = a3.y - v6;
  CGFloat v8 = a4.height + v6;
  id v9 = [(NCNotificationRootList *)self rootListView];
  objc_msgSend(v9, "setVisibleRect:", x, v7, width, v8);
}

- (void)_configureNotificationSectionList:(id)a3 notificationCache:(id)a4 notificationListViewRevealed:(BOOL)a5 logDescription:(id)a6
{
  BOOL v6 = a5;
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  [v12 setDelegate:self];
  objc_msgSend(v12, "setDeviceAuthenticated:", -[NCNotificationRootList deviceAuthenticated](self, "deviceAuthenticated"));
  [v12 setNotificationListCache:v11];

  [v12 setNotificationListViewRevealed:v6];
  [v12 setLogDescription:v10];
}

- (CGRect)aggregatedVisibleContentExtent
{
  double x = self->_aggregatedVisibleContentExtent.origin.x;
  double y = self->_aggregatedVisibleContentExtent.origin.y;
  double width = self->_aggregatedVisibleContentExtent.size.width;
  double height = self->_aggregatedVisibleContentExtent.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)_setHighlightsFeatureEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  BOOL v5 = (os_log_t *)MEMORY[0x1E4FB3778];
  BOOL v6 = (void *)*MEMORY[0x1E4FB3778];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
  {
    CGFloat v7 = v6;
    CGFloat v8 = [(NCNotificationRootList *)self logDescription];
    *(_DWORD *)buf = 138543618;
    BOOL v44 = v8;
    __int16 v45 = 1024;
    LODWORD(v46) = v3;
    _os_log_impl(&dword_1D7C04000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ highlights feature enabled: %d", buf, 0x12u);
  }
  id v9 = [(NCNotificationRootList *)self notificationSections];
  id v10 = [(NCNotificationRootList *)self highlightedSectionList];
  int v11 = [v9 containsObject:v10];

  if (v3)
  {
    if ((v11 & 1) == 0)
    {
      [(NCNotificationRootList *)self _configureHighlightsSectionListIfNeeded];
      id v12 = [(NCNotificationRootList *)self highlightedSectionList];

      if (v12)
      {
        os_log_t v13 = *v5;
        if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v14 = v13;
          __int16 v15 = [(NCNotificationRootList *)self logDescription];
          BOOL v16 = [(NCNotificationRootList *)self highlightedSectionList];
          uint64_t v17 = [v16 logDescription];
          *(_DWORD *)buf = 138543618;
          BOOL v44 = v15;
          __int16 v45 = 2114;
          id v46 = v17;
          _os_log_impl(&dword_1D7C04000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ adding %{public}@ to visible section", buf, 0x16u);
        }
        BOOL v18 = [(NCNotificationRootList *)self highlightedSectionList];
        objc_msgSend(v18, "setDeviceAuthenticated:", -[NCNotificationRootList deviceAuthenticated](self, "deviceAuthenticated"));

        uint64_t v19 = [(NCNotificationRootList *)self _notificationListSections];
        uint64_t v20 = [v19 indexOfObject:self->_prominentIncomingSectionList];

        __int16 v21 = [(NCNotificationRootList *)self notificationSections];
        uint64_t v22 = [v21 indexOfObject:self->_prominentIncomingSectionList];

        __int16 v23 = [(NCNotificationRootList *)self notificationSections];
        uint64_t v24 = [(NCNotificationRootList *)self highlightedSectionList];
        [v23 insertObject:v24 atIndex:v22];

        __int16 v25 = [(NCNotificationRootList *)self rootListView];
        [v25 insertViewAtIndex:v20 animated:1];

        CGRect v26 = [(NCNotificationRootList *)self highlightedSectionList];
        [(NCNotificationRootList *)self _setRevealed:1 forSection:v26];

        [(NCNotificationRootList *)self _updateIndexForReveal];
        [(NCNotificationRootList *)self _notificationListDidChangeContent];
        uint64_t v27 = [(NCNotificationRootList *)self highlightedSectionList];
        [(NCNotificationRootList *)self _notificationSectionsDidAdd:v27];
      }
    }
  }
  else if (v11)
  {
    os_log_t v28 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      double v29 = v28;
      uint64_t v30 = [(NCNotificationRootList *)self logDescription];
      double v31 = [(NCNotificationRootList *)self highlightedSectionList];
      double v32 = [v31 logDescription];
      *(_DWORD *)buf = 138543618;
      BOOL v44 = v30;
      __int16 v45 = 2114;
      id v46 = v32;
      _os_log_impl(&dword_1D7C04000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@ removing %{public}@ from visible section", buf, 0x16u);
    }
    int v33 = [(NCNotificationRootList *)self highlightedSectionList];
    char v34 = [(NCNotificationRootList *)self incomingSectionList];
    BYTE2(v42) = 0;
    LOWORD(v42) = 256;
    -[NCNotificationRootList _migrateNotificationsFromList:toList:passingTest:filterRequestsPassingTest:hideToList:clearRequests:filterForDestination:animateRemoval:reorderGroupNotifications:](self, "_migrateNotificationsFromList:toList:passingTest:filterRequestsPassingTest:hideToList:clearRequests:filterForDestination:animateRemoval:reorderGroupNotifications:", v33, v34, 0, 0, 0, 0, v42);

    char v35 = [(NCNotificationRootList *)self _notificationListSections];
    uint64_t v36 = [(NCNotificationRootList *)self highlightedSectionList];
    uint64_t v37 = [v35 indexOfObject:v36];

    uint64_t v38 = [(NCNotificationRootList *)self notificationSections];
    id v39 = [(NCNotificationRootList *)self highlightedSectionList];
    [v38 removeObject:v39];

    id v40 = [(NCNotificationRootList *)self rootListView];
    [v40 removeViewAtIndex:v37 animated:1 isHorizontallyDisplaced:0];

    uint64_t v41 = [(NCNotificationRootList *)self highlightedSectionList];
    [(NCNotificationRootList *)self _setRevealed:0 forSection:v41];

    [(NCNotificationRootList *)self _updateIndexForReveal];
    [(NCNotificationRootList *)self _notificationListDidChangeContent];
  }
}

- (void)_configureHighlightsSectionListIfNeeded
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (_NCIsNotificationHighlightsAllowed()
    && +[NCPlatformEligibility areGenerativeModelsAvailable]&& [(NCNotificationRootList *)self _areHighlightsEnabled]&& ([(NCNotificationRootList *)self highlightedSectionList], BOOL v3 = objc_claimAutoreleasedReturnValue(), v3, !v3))
  {
    int v11 = (void *)*MEMORY[0x1E4FB3778];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
    {
      id v12 = v11;
      os_log_t v13 = [(NCNotificationRootList *)self logDescription];
      int v19 = 138543362;
      uint64_t v20 = v13;
      _os_log_impl(&dword_1D7C04000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ Configuring highlights sections", (uint8_t *)&v19, 0xCu);
    }
    uint64_t v14 = NCUserNotificationsUIKitFrameworkBundle();
    BOOL v5 = [v14 localizedStringForKey:@"NOTIFICATION_LIST_HEADER_IMPORTANT_HIGHLIGHTS" value:&stru_1F2F516F8 table:0];

    __int16 v15 = [[NCNotificationListHighlights alloc] initWithTitle:v5 sectionType:10];
    BOOL v16 = [(NCNotificationRootList *)self notificationListCache];
    [(NCNotificationRootList *)self _configureNotificationSectionList:v15 notificationCache:v16 notificationListViewRevealed:1 logDescription:@"Important Section"];

    uint64_t v17 = [(NCNotificationStructuredSectionList *)v15 listView];
    [v17 setGrouped:0];

    [(NCNotificationStructuredSectionList *)v15 setSupportsDynamicGrouping:0];
    [(NCNotificationStructuredSectionList *)v15 setSectionListDestination:@"BulletinDestinationLockScreen"];
    highlightedSectionList = self->_highlightedSectionList;
    self->_highlightedSectionList = &v15->super;
  }
  else
  {
    BOOL v4 = (void *)*MEMORY[0x1E4FB3778];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    BOOL v5 = v4;
    BOOL v6 = [(NCNotificationRootList *)self logDescription];
    int v7 = _NCIsNotificationHighlightsAllowed();
    BOOL v8 = +[NCPlatformEligibility areGenerativeModelsAvailable];
    BOOL v9 = [(NCNotificationRootList *)self _areHighlightsEnabled];
    id v10 = [(NCNotificationRootList *)self highlightedSectionList];
    int v19 = 138544386;
    uint64_t v20 = v6;
    __int16 v21 = 1024;
    int v22 = v7;
    __int16 v23 = 1024;
    BOOL v24 = v8;
    __int16 v25 = 1024;
    BOOL v26 = v9;
    __int16 v27 = 1024;
    BOOL v28 = v10 != 0;
    _os_log_impl(&dword_1D7C04000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Skip configuring Highlights sections list; highlightFF: %d; areGenerativeModelsAvailable: %d; areHighli"
      "ghtsEnabled: %d; highlightedSectionExisted: %d",
      (uint8_t *)&v19,
      0x24u);
  }
}

- (BOOL)_areHighlightsEnabled
{
  id v2 = self;
  BOOL v3 = [(NCNotificationRootList *)self delegate];
  LOBYTE(v2) = [v3 notificationRootListAreHighlightsEnabled:v2];

  return (char)v2;
}

- (void)_setupNotificationSectionLists
{
  BOOL v3 = [[NCNotificationStructuredSectionList alloc] initWithTitle:0 sectionType:11];
  BOOL v4 = [(NCNotificationRootList *)self notificationListCache];
  [(NCNotificationRootList *)self _configureNotificationSectionList:v3 notificationCache:v4 notificationListViewRevealed:1 logDescription:@"Critical Section"];

  [(NCNotificationStructuredSectionList *)v3 setSupportsDynamicGrouping:0];
  [(NCNotificationStructuredSectionList *)v3 setSectionListDestination:@"BulletinDestinationLockScreen"];
  BOOL v5 = [(NCNotificationRootList *)self notificationSections];
  [v5 addObject:v3];

  criticalSectionList = self->_criticalSectionList;
  self->_criticalSectionList = v3;
  int v7 = v3;

  [(NCNotificationRootList *)self _configureHighlightsSectionListIfNeeded];
  BOOL v8 = [(NCNotificationRootList *)self highlightedSectionList];

  if (v8)
  {
    BOOL v9 = [(NCNotificationRootList *)self notificationSections];
    id v10 = [(NCNotificationRootList *)self highlightedSectionList];
    [v9 addObject:v10];

    int v11 = [(NCNotificationRootList *)self highlightedSectionList];
    [(NCNotificationRootList *)self _setRevealed:1 forSection:v11];
  }
  id v12 = [[NCNotificationStructuredSectionList alloc] initWithTitle:0 sectionType:1];
  os_log_t v13 = [(NCNotificationRootList *)self notificationListCache];
  [(NCNotificationRootList *)self _configureNotificationSectionList:v12 notificationCache:v13 notificationListViewRevealed:1 logDescription:@"Prominent Incoming Section"];

  [(NCNotificationStructuredSectionList *)v12 setSupportsDynamicGrouping:0];
  [(NCNotificationStructuredSectionList *)v12 setSectionListDestination:@"BulletinDestinationLockScreen"];
  uint64_t v14 = [(NCNotificationRootList *)self notificationSections];
  [v14 addObject:v12];

  prominentIncomingSectionList = self->_prominentIncomingSectionList;
  self->_prominentIncomingSectionList = v12;
  BOOL v16 = v12;

  uint64_t v17 = [[NCNotificationStructuredSectionList alloc] initWithTitle:0 sectionType:2];
  BOOL v18 = [(NCNotificationRootList *)self notificationListCache];
  [(NCNotificationRootList *)self _configureNotificationSectionList:v17 notificationCache:v18 notificationListViewRevealed:1 logDescription:@"Incoming Section"];

  [(NCNotificationStructuredSectionList *)v17 setSupportsDynamicGrouping:1];
  [(NCNotificationStructuredSectionList *)v17 setSectionListDestination:@"BulletinDestinationLockScreen"];
  int v19 = [(NCNotificationRootList *)self notificationSections];
  [v19 addObject:v17];

  incomingSectionList = self->_incomingSectionList;
  self->_incomingSectionList = v17;
  __int16 v21 = v17;

  int v22 = NCUserNotificationsUIKitFrameworkBundle();
  uint64_t v31 = [v22 localizedStringForKey:@"NOTIFICATION_LIST_HEADER_NOTIFICATION_CENTER" value:&stru_1F2F516F8 table:0];

  __int16 v23 = [[NCNotificationCombinedSectionList alloc] initWithTitle:v31 sectionType:0];
  BOOL v24 = [(NCNotificationRootList *)self notificationListCache];
  [(NCNotificationRootList *)self _configureNotificationSectionList:v23 notificationCache:v24 notificationListViewRevealed:0 logDescription:@"History Section"];

  [(NCNotificationStructuredSectionList *)v23 setHistorySection:1];
  [(NCNotificationStructuredSectionList *)v23 setPreloadsNotificationRequests:1];
  [(NCNotificationStructuredSectionList *)v23 setSectionListDestination:@"BulletinDestinationNotificationCenter"];
  __int16 v25 = [(NCNotificationRootList *)self notificationSections];
  [v25 addObject:v23];

  historySectionList = self->_historySectionList;
  self->_historySectionList = v23;

  BOOL v27 = [(NCNotificationRootList *)self isScheduledDeliveryEnabled];
  BOOL v28 = (void *)v31;
  if (v27)
  {
    uint64_t v29 = [(NCNotificationRootList *)self digestScheduleManager];
    uint64_t v30 = [v29 upcomingScheduledDigestInfo];

    if (v30) {
      [(NCNotificationRootList *)self _configureUpcomingDigestSectionListWithDigestInfo:v30];
    }

    BOOL v28 = (void *)v31;
  }
}

- (BOOL)_shouldInsertNotificationRequestToProminentIncomingSectionList:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (_NCReactiveListUI()) {
    goto LABEL_6;
  }
  BOOL v5 = (void *)*MEMORY[0x1E4FB3778];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
  {
    BOOL v6 = v5;
    int v7 = [(NCNotificationRootList *)self logDescription];
    BOOL v8 = [v4 notificationIdentifier];
    BOOL v9 = objc_msgSend(v8, "un_logDigest");
    id v10 = [(NCNotificationRootList *)self highlightedSectionList];
    int v18 = 138544386;
    int v19 = v7;
    __int16 v20 = 2114;
    __int16 v21 = v9;
    __int16 v22 = 2048;
    uint64_t v23 = [v10 count];
    __int16 v24 = 1024;
    BOOL v25 = [(NCNotificationRootList *)self _isLockScreenPersistenceNotificationRequest:v4];
    __int16 v26 = 1024;
    BOOL v27 = [(NCNotificationRootList *)self _isAlertingNotificationRequest:v4];
    _os_log_impl(&dword_1D7C04000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ checking prominentIncoming eligibility for request %{public}@; highlight count %lu; lockScreenPersisten"
      "ce %{BOOL}d; isAlerting %{BOOL}d",
      (uint8_t *)&v18,
      0x2Cu);
  }
  uint64_t v11 = [(NCNotificationRootList *)self highlightedSectionList];
  if (!v11) {
    goto LABEL_9;
  }
  id v12 = (void *)v11;
  os_log_t v13 = [(NCNotificationRootList *)self highlightedSectionList];
  uint64_t v14 = [v13 count];

  if (v14)
  {
LABEL_6:
    BOOL v15 = [(NCNotificationRootList *)self _isLockScreenPersistenceNotificationRequest:v4];
  }
  else
  {
LABEL_9:
    if ([(NCNotificationRootList *)self _isLockScreenPersistenceNotificationRequest:v4])
    {
      BOOL v16 = 1;
      goto LABEL_8;
    }
    if ([(NCNotificationRootList *)self currentListDisplayStyleSetting] != 2)
    {
      BOOL v16 = 0;
      goto LABEL_8;
    }
    BOOL v15 = [(NCNotificationRootList *)self _isAlertingNotificationRequest:v4];
  }
  BOOL v16 = v15;
LABEL_8:

  return v16;
}

- (BOOL)_isLockScreenPersistenceNotificationRequest:(id)a3
{
  BOOL v3 = [a3 options];
  BOOL v4 = [v3 lockScreenPersistence] == 2;

  return v4;
}

- (BOOL)_isCriticalNotificationRequest:(id)a3
{
  return (unint64_t)[a3 interruptionLevel] > 2;
}

- (BOOL)_isAlertingNotificationRequest:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 options];
  if ([v4 canTurnOnDisplay]) {
    BOOL v5 = [v3 interruptionLevel] != 0;
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)_isNotificationRequest:(id)a3 forSectionList:(id)a4
{
  id v5 = a4;
  BOOL v6 = [a3 requestDestinations];
  int v7 = [v5 sectionListDestination];

  LOBYTE(v5) = [v6 containsObject:v7];
  return (char)v5;
}

- (BOOL)_shouldInsertNotificationRequestToHighlightedSectionList:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![(NCNotificationRootList *)self _areHighlightsEnabled])
  {
    BOOL v6 = (void *)*MEMORY[0x1E4FB3778];
    BOOL v5 = 0;
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_9;
    }
    int v7 = v6;
    BOOL v8 = [(NCNotificationRootList *)self logDescription];
    int v13 = 138543362;
    uint64_t v14 = v8;
    _os_log_impl(&dword_1D7C04000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ highlight setting is disabled", (uint8_t *)&v13, 0xCu);
LABEL_8:

    BOOL v5 = 0;
    goto LABEL_9;
  }
  if (([v4 isHighlight] & 1) == 0)
  {
    BOOL v9 = (void *)*MEMORY[0x1E4FB3778];
    BOOL v5 = 0;
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_9;
    }
    int v7 = v9;
    BOOL v8 = [(NCNotificationRootList *)self logDescription];
    id v10 = [v4 notificationIdentifier];
    uint64_t v11 = objc_msgSend(v10, "un_logDigest");
    int v13 = 138543618;
    uint64_t v14 = v8;
    __int16 v15 = 2114;
    BOOL v16 = v11;
    _os_log_impl(&dword_1D7C04000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ request %{public}@ is not highlighted", (uint8_t *)&v13, 0x16u);

    goto LABEL_8;
  }
  BOOL v5 = 1;
LABEL_9:

  return v5;
}

- (BOOL)shouldDelayDeliveryOfNotificationRequest:(id)a3
{
  id v3 = [a3 alertOptions];
  BOOL v4 = [v3 suppression] == 2;

  return v4;
}

- (id)_sectionForInsertingNotificationRequest:(id)a3
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [(NCNotificationRootList *)self persistentStateManager];
  unint64_t v6 = [v5 sectionForStoredNotificationRequest:v4];

  uint64_t v7 = [(NCNotificationRootList *)self _sectionForStoredNotificationRequestOfSectionType:v6];
  BOOL v8 = (os_log_t *)MEMORY[0x1E4FB3778];
  if (!v7)
  {
    if ([(NCNotificationRootList *)self isScheduledDeliveryEnabled])
    {
      BOOL v16 = [(NCNotificationRootList *)self currentDigestSectionList];
      if ([(NCNotificationRootList *)self _isNotificationRequest:v4 forSectionList:v16])
      {
        uint64_t v17 = [(NCNotificationRootList *)self currentDigestSectionList];
        int v18 = [v17 containsNotificationRequest:v4];

        if (v18)
        {
          uint64_t v19 = [(NCNotificationRootList *)self currentDigestSectionList];
          goto LABEL_30;
        }
      }
      else
      {
      }
    }
    if ([(NCNotificationRootList *)self isScheduledDeliveryEnabled]
      && ([(NCNotificationRootList *)self upcomingDigestSectionList],
          __int16 v20 = objc_claimAutoreleasedReturnValue(),
          BOOL v21 = [(NCNotificationRootList *)self _isNotificationRequest:v4 forSectionList:v20], v20, v21))
    {
      uint64_t v19 = [(NCNotificationRootList *)self upcomingDigestSectionList];
    }
    else if ([(NCNotificationRootList *)self isMissedSectionActive] {
           && [(NCNotificationRootList *)self shouldDelayDeliveryOfNotificationRequest:v4]&& ([(NCNotificationRootList *)self upcomingMissedSectionList], __int16 v22 = objc_claimAutoreleasedReturnValue(), v23 = [(NCNotificationRootList *)self _isNotificationRequest:v4 forSectionList:v22], v22, v23))
    }
    {
      uint64_t v19 = [(NCNotificationRootList *)self upcomingMissedSectionList];
    }
    else
    {
      if (![(NCNotificationRootList *)self _isCriticalNotificationRequest:v4])
      {
        __int16 v24 = [(NCNotificationRootList *)self highlightedSectionList];
        if ([(NCNotificationRootList *)self _isNotificationRequest:v4 forSectionList:v24])
        {
          BOOL v25 = [(NCNotificationRootList *)self _shouldInsertNotificationRequestToHighlightedSectionList:v4];

          if (v25)
          {
            uint64_t v19 = [(NCNotificationRootList *)self highlightedSectionList];
            goto LABEL_30;
          }
        }
        else
        {
        }
        __int16 v26 = [(NCNotificationRootList *)self prominentIncomingSectionList];
        if ([(NCNotificationRootList *)self _isNotificationRequest:v4 forSectionList:v26])
        {
          BOOL v27 = [(NCNotificationRootList *)self _shouldInsertNotificationRequestToProminentIncomingSectionList:v4];

          if (v27)
          {
            uint64_t v19 = [(NCNotificationRootList *)self prominentIncomingSectionList];
            goto LABEL_30;
          }
        }
        else
        {
        }
        uint64_t v28 = [(NCNotificationRootList *)self incomingSectionList];
        BOOL v29 = [(NCNotificationRootList *)self _isNotificationRequest:v4 forSectionList:v28];

        if (v29)
        {
          uint64_t v19 = [(NCNotificationRootList *)self incomingSectionList];
        }
        else
        {
          uint64_t v30 = [(NCNotificationRootList *)self historySectionList];
          BOOL v31 = [(NCNotificationRootList *)self _isNotificationRequest:v4 forSectionList:v30];

          if (!v31)
          {
            BOOL v9 = 0;
            goto LABEL_31;
          }
          uint64_t v19 = [(NCNotificationRootList *)self historySectionList];
        }
        goto LABEL_30;
      }
      uint64_t v19 = [(NCNotificationRootList *)self criticalSectionList];
    }
LABEL_30:
    BOOL v9 = (NCNotificationCombinedSectionList *)v19;
    goto LABEL_31;
  }
  BOOL v9 = (NCNotificationCombinedSectionList *)v7;
  id v10 = (void *)*MEMORY[0x1E4FB3778];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = v10;
    id v12 = [(NCNotificationRootList *)self logDescription];
    int v13 = NCNotificationListSectionTypeString(v6);
    uint64_t v14 = [v4 notificationIdentifier];
    __int16 v15 = objc_msgSend(v14, "un_logDigest");
    *(_DWORD *)buf = 138543874;
    __int16 v49 = v12;
    __int16 v50 = 2112;
    uint64_t v51 = v13;
    __int16 v52 = 2112;
    CGRect v53 = v15;
    _os_log_impl(&dword_1D7C04000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ found existing section %@ for request %@ from notification list persistent state", buf, 0x20u);
  }
LABEL_31:
  if (v9 == self->_historySectionList)
  {
    p_incomingSectionList = (id *)&self->_incomingSectionList;
    if ([(NCNotificationStructuredSectionList *)self->_incomingSectionList containsNotificationRequest:v4]|| (p_incomingSectionList = (id *)&self->_prominentIncomingSectionList, [(NCNotificationStructuredSectionList *)self->_prominentIncomingSectionList containsNotificationRequest:v4])|| (p_incomingSectionList = (id *)&self->_highlightedSectionList, [(NCNotificationStructuredSectionList *)self->_highlightedSectionList containsNotificationRequest:v4])|| (p_incomingSectionList = (id *)&self->_criticalSectionList, [(NCNotificationStructuredSectionList *)self->_criticalSectionList containsNotificationRequest:v4])|| (p_incomingSectionList = (id *)&self->_upcomingMissedSectionList,
          [(NCNotificationCombinedSectionList *)self->_upcomingMissedSectionList containsNotificationRequest:v4])|| (p_incomingSectionList = (id *)&self->_upcomingDigestSectionList, [(NCNotificationCombinedSectionList *)self->_upcomingDigestSectionList containsNotificationRequest:v4])|| (p_incomingSectionList = (id *)&self->_currentDigestSectionList, [(NCNotificationCombinedSectionList *)self->_currentDigestSectionList containsNotificationRequest:v4]))
    {
      int v33 = (NCNotificationCombinedSectionList *)*p_incomingSectionList;

      BOOL v9 = v33;
    }
  }
  char v34 = [(NCNotificationRootList *)self _higherSectionToElevateForNotificationRequest:v4 currentSectionType:[(NCNotificationStructuredSectionList *)v9 sectionType]];
  char v35 = v34;
  if (v34)
  {
    uint64_t v36 = v34;

    BOOL v9 = v36;
  }
  os_log_t v37 = *v8;
  if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v38 = v37;
    id v39 = [(NCNotificationRootList *)self logDescription];
    id v40 = [v4 notificationIdentifier];
    uint64_t v41 = objc_msgSend(v40, "un_logDigest");
    uint64_t v42 = [v4 sectionIdentifier];
    v43 = [v4 threadIdentifier];
    objc_msgSend(v43, "un_logDigest");
    BOOL v44 = v47 = v4;
    __int16 v45 = NCNotificationListSectionTypeString([(NCNotificationStructuredSectionList *)v9 sectionType]);
    *(_DWORD *)buf = 138544386;
    __int16 v49 = v39;
    __int16 v50 = 2114;
    uint64_t v51 = v41;
    __int16 v52 = 2114;
    CGRect v53 = v42;
    __int16 v54 = 2114;
    __int16 v55 = v44;
    __int16 v56 = 2114;
    __int16 v57 = v45;
    _os_log_impl(&dword_1D7C04000, v38, OS_LOG_TYPE_DEFAULT, "%{public}@ Section for new request %{public}@ for Group List [%{public}@:%{public}@] is %{public}@", buf, 0x34u);

    id v4 = v47;
  }

  return v9;
}

- (BOOL)_isRequestEligibleForStackElevation:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ((_NCStackElevation() & 1) == 0)
  {
    BOOL v8 = (void *)*MEMORY[0x1E4FB3778];
    BOOL v7 = 0;
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_11;
    }
    BOOL v9 = v8;
    id v10 = [(NCNotificationRootList *)self logDescription];
    int v17 = 138543362;
    int v18 = v10;
    uint64_t v11 = "%{public}@ stack elevation feature disabled";
    goto LABEL_9;
  }
  if (!+[NCPlatformEligibility areGenerativeModelsAvailable])
  {
    id v12 = (void *)*MEMORY[0x1E4FB3778];
    BOOL v7 = 0;
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_11;
    }
    BOOL v9 = v12;
    id v10 = [(NCNotificationRootList *)self logDescription];
    int v17 = 138543362;
    int v18 = v10;
    uint64_t v11 = "%{public}@ generative model unavailable";
LABEL_9:
    _os_log_impl(&dword_1D7C04000, v9, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v17, 0xCu);
LABEL_10:

    BOOL v7 = 0;
    goto LABEL_11;
  }
  BOOL v5 = [v4 options];
  char v6 = [v5 canShowSummary];

  if ((v6 & 1) == 0)
  {
    uint64_t v14 = (void *)*MEMORY[0x1E4FB3778];
    BOOL v7 = 0;
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_11;
    }
    BOOL v9 = v14;
    id v10 = [(NCNotificationRootList *)self logDescription];
    __int16 v15 = [v4 notificationIdentifier];
    BOOL v16 = objc_msgSend(v15, "un_logDigest");
    int v17 = 138543618;
    int v18 = v10;
    __int16 v19 = 2114;
    __int16 v20 = v16;
    _os_log_impl(&dword_1D7C04000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ request %{public}@ summarization settings disabled", (uint8_t *)&v17, 0x16u);

    goto LABEL_10;
  }
  BOOL v7 = 1;
LABEL_11:

  return v7;
}

- (id)_higherSectionToElevateForNotificationRequest:(id)a3 currentSectionType:(unint64_t)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (![(NCNotificationRootList *)self _isRequestEligibleForStackElevation:v6])
  {
    int v18 = (void *)*MEMORY[0x1E4FB3778];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
    {
      __int16 v19 = v18;
      __int16 v20 = [(NCNotificationRootList *)self logDescription];
      uint64_t v21 = [v6 notificationIdentifier];
      __int16 v22 = objc_msgSend(v21, "un_logDigest");
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v20;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v22;
      _os_log_impl(&dword_1D7C04000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ Skip finding hider section with request %{public}@; stack elevation not eligible",
        buf,
        0x16u);
    }
    goto LABEL_10;
  }
  BOOL v7 = [v6 content];
  char v8 = [v7 isCommunicationType];

  if ((v8 & 1) == 0)
  {
    BOOL v23 = (void *)*MEMORY[0x1E4FB3778];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
    {
      __int16 v24 = v23;
      BOOL v25 = [(NCNotificationRootList *)self logDescription];
      __int16 v26 = [v6 notificationIdentifier];
      BOOL v27 = objc_msgSend(v26, "un_logDigest");
      NCNotificationListSectionTypeString(a4);
      uint64_t v28 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      *(void *)&uint8_t buf[4] = v25;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v27;
      *(_WORD *)&buf[22] = 2114;
      uint64_t v38 = v28;
      _os_log_impl(&dword_1D7C04000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@ Skip finding hider section with request %{public}@ in current section %{public}@; it's not communication request",
        buf,
        0x20u);
    }
    goto LABEL_10;
  }
  BOOL v9 = NCStackElevationPriorityForSectionTypeString();
  id v10 = NCNotificationListSectionTypeString(a4);
  uint64_t v11 = [v9 indexOfObject:v10];

  if (v11 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v12 = (void *)*MEMORY[0x1E4FB3778];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
    {
      int v13 = v12;
      uint64_t v14 = [(NCNotificationRootList *)self logDescription];
      __int16 v15 = [v6 notificationIdentifier];
      BOOL v16 = objc_msgSend(v15, "un_logDigest");
      NCNotificationListSectionTypeString(a4);
      int v17 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      *(void *)&uint8_t buf[4] = v14;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v16;
      *(_WORD *)&buf[22] = 2114;
      uint64_t v38 = v17;
      _os_log_impl(&dword_1D7C04000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ Skip finding higher section with request %{public}@ in current section %{public}@; it's not in allow list",
        buf,
        0x20u);
    }
LABEL_10:
    id v29 = 0;
    goto LABEL_11;
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  uint64_t v38 = __Block_byref_object_copy__0;
  id v39 = __Block_byref_object_dispose__0;
  id v40 = 0;
  BOOL v31 = NCStackElevationPriorityForSectionTypeString();
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __91__NCNotificationRootList__higherSectionToElevateForNotificationRequest_currentSectionType___block_invoke;
  v32[3] = &unk_1E6A92900;
  uint64_t v35 = v11;
  unint64_t v36 = a4;
  v32[4] = self;
  id v33 = v6;
  char v34 = buf;
  [v31 enumerateObjectsUsingBlock:v32];

  id v29 = *(id *)(*(void *)&buf[8] + 40);
  _Block_object_dispose(buf, 8);

LABEL_11:

  return v29;
}

void __91__NCNotificationRootList__higherSectionToElevateForNotificationRequest_currentSectionType___block_invoke(uint64_t a1, void *a2, unint64_t a3, unsigned char *a4)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  char v8 = v7;
  if (*(void *)(a1 + 56) <= a3)
  {
    uint64_t v11 = (void *)*MEMORY[0x1E4FB3778];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
    {
      id v12 = *(void **)(a1 + 32);
      int v13 = v11;
      uint64_t v14 = [v12 logDescription];
      __int16 v15 = NCNotificationListSectionTypeString(*(void *)(a1 + 64));
      *(_DWORD *)buf = 138543874;
      char v34 = v14;
      __int16 v35 = 2114;
      unint64_t v36 = v15;
      __int16 v37 = 2114;
      uint64_t v38 = v8;
      _os_log_impl(&dword_1D7C04000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ Current section %{public}@ has higher or same priority than section %{public}@; Stop finding.",
        buf,
        0x20u);
    }
    *a4 = 1;
  }
  else
  {
    uint64_t v9 = NCNotificationListSectionTypeFromString(v7);
    if (v9 == 0x7FFFFFFFFFFFFFFFLL)
    {
      id v10 = (void *)*MEMORY[0x1E4FB3778];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_FAULT)) {
        __91__NCNotificationRootList__higherSectionToElevateForNotificationRequest_currentSectionType___block_invoke_cold_1(a1, v10);
      }
    }
    else
    {
      unint64_t v16 = v9;
      int v17 = [*(id *)(a1 + 32) _sectionOfSectionType:v9];
      int v18 = v17;
      if (v17)
      {
        if ([v17 existingIndexOfGroupForNotificationRequestForInsertion:*(void *)(a1 + 40)] != 0x7FFFFFFFFFFFFFFFLL)
        {
          __int16 v19 = (void *)*MEMORY[0x1E4FB3778];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
          {
            __int16 v20 = *(void **)(a1 + 32);
            log = v19;
            uint64_t v30 = [v20 logDescription];
            BOOL v31 = [*(id *)(a1 + 40) notificationIdentifier];
            uint64_t v21 = objc_msgSend(v31, "un_logDigest");
            __int16 v22 = [*(id *)(a1 + 40) threadIdentifier];
            BOOL v23 = objc_msgSend(v22, "un_logDigest");
            __int16 v24 = NCNotificationListSectionTypeString(v16);
            BOOL v25 = NCNotificationListSectionTypeString(*(void *)(a1 + 64));
            *(_DWORD *)buf = 138544386;
            char v34 = v30;
            __int16 v35 = 2114;
            unint64_t v36 = v21;
            __int16 v37 = 2114;
            uint64_t v38 = v23;
            __int16 v39 = 2114;
            id v40 = v24;
            __int16 v41 = 2114;
            uint64_t v42 = v25;
            _os_log_impl(&dword_1D7C04000, log, OS_LOG_TYPE_DEFAULT, "%{public}@ Elevate new request %{public}@ for thread %{public}@ to higher section %{public}@; original section %{public}@",
              buf,
              0x34u);
          }
          objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v18);
          *a4 = 1;
        }
      }
      else
      {
        __int16 v26 = (void *)*MEMORY[0x1E4FB3778];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
        {
          BOOL v27 = *(void **)(a1 + 32);
          uint64_t v28 = v26;
          id v29 = [v27 logDescription];
          *(_DWORD *)buf = 138543618;
          char v34 = v29;
          __int16 v35 = 2114;
          unint64_t v36 = v8;
          _os_log_impl(&dword_1D7C04000, v28, OS_LOG_TYPE_DEFAULT, "%{public}@ Higher section %{public}@ not exist; Skip checking.",
            buf,
            0x16u);
        }
      }
    }
  }
}

- (void)_regroupAllNotificationGroups
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)*MEMORY[0x1E4FB3778];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
  {
    id v4 = v3;
    BOOL v5 = [(NCNotificationRootList *)self logDescription];
    int v7 = 138543362;
    char v8 = v5;
    _os_log_impl(&dword_1D7C04000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ regrouping all expanded notification groups", (uint8_t *)&v7, 0xCu);
  }
  id v6 = [(NCNotificationRootList *)self notificationSections];
  [v6 enumerateObjectsUsingBlock:&__block_literal_global_136];
}

uint64_t __55__NCNotificationRootList__regroupAllNotificationGroups__block_invoke(uint64_t a1, void *a2)
{
  return [a2 regroupNotificationGroups];
}

- (void)_sortNotificationGroupsIfNecessary
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = [(NCNotificationRootList *)self _notificationSectionListsForEnumeration];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) sortNotificationGroupListsIfNecessary];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (id)_notificationSectionListsForEnumeration
{
  id v3 = objc_alloc(MEMORY[0x1E4F1CA80]);
  uint64_t v4 = [(NCNotificationRootList *)self notificationSections];
  uint64_t v5 = (void *)[v3 initWithArray:v4];

  if (self->_currentDigestSectionList
    && !-[NCNotificationCombinedSectionList containsSectionList:](self->_historySectionList, "containsSectionList:")
    && ([v5 containsObject:self->_currentDigestSectionList] & 1) == 0)
  {
    [v5 addObject:self->_currentDigestSectionList];
  }
  if (self->_upcomingDigestSectionList
    && !-[NCNotificationCombinedSectionList containsSectionList:](self->_historySectionList, "containsSectionList:"))
  {
    [v5 addObject:self->_upcomingDigestSectionList];
  }
  if (self->_upcomingMissedSectionList
    && !-[NCNotificationCombinedSectionList containsSectionList:](self->_historySectionList, "containsSectionList:"))
  {
    [v5 addObject:self->_upcomingMissedSectionList];
  }

  return v5;
}

- (id)_visibleNotificationRequests
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v4 = [(NCNotificationRootList *)self notificationSections];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __54__NCNotificationRootList__visibleNotificationRequests__block_invoke;
  v9[3] = &unk_1E6A927E0;
  void v9[4] = self;
  id v5 = v3;
  id v10 = v5;
  [v4 enumerateObjectsUsingBlock:v9];

  uint64_t v6 = v10;
  id v7 = v5;

  return v7;
}

void __54__NCNotificationRootList__visibleNotificationRequests__block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v8 = a2;
  uint64_t v5 = [*(id *)(a1 + 32) _indexForReveal];
  if (v5 - [*(id *)(*(void *)(a1 + 32) + 120) count] > a3
    || [*(id *)(a1 + 32) isNotificationHistoryRevealed])
  {
    uint64_t v6 = *(void **)(a1 + 40);
    id v7 = [v8 allNotificationRequests];
    [v6 addObjectsFromArray:v7];
  }
}

- (void)_notificationListDidChangeContent
{
  [(NCNotificationRootList *)self _updateVisibilityForSectionLists];
  [(NCNotificationRootList *)self _updateNotificationListPersistentState];
  [(NCNotificationRootList *)self _updateVisibilityOfHistorySection];

  [(NCNotificationRootList *)self _updateDelegateAndSubclassIfNecessaryOfContentChange];
}

- (unint64_t)incomingCount
{
  id v2 = [(NCNotificationRootList *)self incomingSectionList];
  unint64_t v3 = [v2 notificationCount];

  return v3;
}

- (unint64_t)historyCount
{
  id v2 = [(NCNotificationRootList *)self historySectionList];
  unint64_t v3 = [v2 notificationCount];

  return v3;
}

- (NSString)incomingTitle
{
  return [(NCNotificationStructuredSectionList *)self->_currentDigestSectionList title];
}

- (void)_updateVisibilityOfHistorySection
{
  if ([(NCNotificationRootList *)self isNotificationHistoryRevealed])
  {
    unint64_t v3 = [(NCNotificationRootList *)self historySectionList];
    uint64_t v4 = [v3 notificationCount];

    if (!v4)
    {
      self->_notificationHistoryRevealed = 0;
      [(NCNotificationRootList *)self _setForceRevealed:0];
    }
  }
}

- (void)setOverrideMigrationToHistory:(BOOL)a3
{
  if (self->_overrideMigrationToHistory != a3)
  {
    BOOL v3 = a3;
    self->_BOOL overrideMigrationToHistory = a3;
    id v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    [v4 setBool:v3 forKey:@"NCOverrideNotificationMigrationToHistory"];
  }
}

- (void)setCurrentListDisplayStyleSetting:(int64_t)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  if (!_NCReactiveListUI())
  {
    if ([(NCNotificationRootList *)self _isCurrentListDisplayStyleSettingEqualTo:a3])
    {
      return;
    }
    id v7 = [(NCNotificationRootList *)self delegate];
    id v8 = (id)*MEMORY[0x1E4FB3778];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      long long v9 = [(NCNotificationRootList *)self logDescription];
      id v10 = [MEMORY[0x1E4FB3808] stringForNotificationListDisplayStyleSetting:a3];
      currentListDisplayStyleSetting = self->_currentListDisplayStyleSetting;
      if (currentListDisplayStyleSetting)
      {
        uint64_t v12 = objc_msgSend(MEMORY[0x1E4FB3808], "stringForNotificationListDisplayStyleSetting:", -[NSNumber integerValue](self->_currentListDisplayStyleSetting, "integerValue"));
      }
      else
      {
        uint64_t v12 = 0;
      }
      int v37 = 138543874;
      uint64_t v38 = v9;
      __int16 v39 = 2114;
      id v40 = v10;
      __int16 v41 = 2114;
      uint64_t v42 = v12;
      _os_log_impl(&dword_1D7C04000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ changing list display visual style to %{public}@ from %{public}@", (uint8_t *)&v37, 0x20u);
      if (currentListDisplayStyleSetting) {
    }
      }
    BOOL v13 = [(NCNotificationRootList *)self _isCurrentListDisplayStyleSettingEqualTo:2];
    uint64_t v14 = [NSNumber numberWithInteger:a3];
    __int16 v15 = self->_currentListDisplayStyleSetting;
    self->_currentListDisplayStyleSetting = v14;

    [(NCNotificationRootList *)self _currentDisplayListStyleSettingsWillChange:a3];
    if (!v13)
    {
LABEL_21:
      if (a3 == 2)
      {
        BOOL v31 = [(NCNotificationRootList *)self incomingSectionList];
        [v31 setSectionListViewGroupedWithContentShown:1];

        double v32 = [(NCNotificationRootList *)self highlightedSectionList];
        [(NCNotificationRootList *)self _setRevealed:1 forSection:v32];

        BOOL v33 = [(NCNotificationRootList *)self isNotificationHistoryRevealed];
        char v34 = [(NCNotificationRootList *)self incomingSectionList];
        [(NCNotificationRootList *)self _setRevealed:v33 forSection:v34];

        if (![(NCNotificationRootList *)self _isCurrentDigestListAboveHistorySectionList])goto LABEL_28; {
        __int16 v35 = [(NCNotificationRootList *)self currentDigestSectionList];
        }
        [v35 collapseSummarizedSectionList];

        BOOL v36 = [(NCNotificationRootList *)self isNotificationHistoryRevealed];
        __int16 v26 = [(NCNotificationRootList *)self currentDigestSectionList];
        BOOL v27 = self;
        uint64_t v28 = v36;
      }
      else
      {
        if (a3 == 1)
        {
          __int16 v24 = [(NCNotificationRootList *)self incomingSectionList];
          [v24 setSectionListViewGroupedWithContentShown:1];
        }
        else
        {
          if (a3)
          {
LABEL_28:
            id v29 = [(NCNotificationRootList *)self prominentIncomingSectionList];
            [(NCNotificationRootList *)self _setRevealed:1 forSection:v29];

            uint64_t v30 = [(NCNotificationRootList *)self criticalSectionList];
            [(NCNotificationRootList *)self _setRevealed:1 forSection:v30];

            [(NCNotificationRootList *)self _updateIndexForReveal];
            [v7 notificationRootList:self displayStyleSettingChanged:a3];

            return;
          }
          BOOL v23 = [(NCNotificationRootList *)self incomingSectionList];
          [v23 setSectionListViewGroupedWithContentShown:0];

          __int16 v24 = [(NCNotificationRootList *)self incomingSectionList];
          [v24 setSupportsDynamicGrouping:1];
        }

        BOOL v25 = [(NCNotificationRootList *)self highlightedSectionList];
        [(NCNotificationRootList *)self _setRevealed:1 forSection:v25];

        __int16 v26 = [(NCNotificationRootList *)self incomingSectionList];
        BOOL v27 = self;
        uint64_t v28 = 1;
      }
      [(NCNotificationRootList *)v27 _setRevealed:v28 forSection:v26];

      goto LABEL_28;
    }
    unint64_t v16 = [(NCNotificationRootList *)self incomingSectionList];
    if ([v16 notificationCount])
    {
    }
    else
    {
      BOOL v17 = [(NCNotificationRootList *)self _isCurrentDigestListAboveHistorySectionList];

      if (!v17)
      {
LABEL_18:
        int v18 = [(NCNotificationRootList *)self highlightedSectionList];
        [(NCNotificationRootList *)self _setRevealed:1 forSection:v18];

        __int16 v19 = [(NCNotificationRootList *)self incomingSectionList];
        [(NCNotificationRootList *)self _setRevealed:1 forSection:v19];

        if ([(NCNotificationRootList *)self _isCurrentDigestListAboveHistorySectionList])
        {
          __int16 v20 = [(NCNotificationRootList *)self currentDigestSectionList];
          uint64_t v21 = [v20 listView];
          [v21 setRevealed:1];

          __int16 v22 = [(NCNotificationRootList *)self currentDigestSectionList];
          [(NCNotificationRootList *)self _setRevealed:1 forSection:v22];
        }
        [(NCNotificationRootList *)self _migrateNotificationsFromProminentIncomingSectionToIncomingSection];
        goto LABEL_21;
      }
    }
    [v7 notificationRootListWillExpandNotificationListCount:self];
    goto LABEL_18;
  }
  uint64_t v5 = [NSNumber numberWithInteger:a3];
  uint64_t v6 = self->_currentListDisplayStyleSetting;
  self->_currentListDisplayStyleSetting = v5;
}

- (int64_t)currentListDisplayStyleSetting
{
  int64_t result = (int64_t)self->_currentListDisplayStyleSetting;
  if (result) {
    return [(id)result integerValue];
  }
  return result;
}

- (BOOL)_isCurrentListDisplayStyleSettingEqualTo:(int64_t)a3
{
  currentListDisplayStyleSetting = self->_currentListDisplayStyleSetting;
  if (currentListDisplayStyleSetting) {
    LOBYTE(currentListDisplayStyleSetting) = [(NSNumber *)currentListDisplayStyleSetting integerValue] == a3;
  }
  return (char)currentListDisplayStyleSetting;
}

- (void)_migrateNotificationsFromProminentIncomingSectionToIncomingSection
{
  if ((_NCReactiveListUI() & 1) == 0)
  {
    BOOL v3 = [(NCNotificationRootList *)self prominentIncomingSectionList];
    id v4 = [v3 allNotificationRequests];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __92__NCNotificationRootList__migrateNotificationsFromProminentIncomingSectionToIncomingSection__block_invoke;
    v9[3] = &unk_1E6A91B18;
    void v9[4] = self;
    [v4 enumerateObjectsUsingBlock:v9];

    uint64_t v5 = [(NCNotificationRootList *)self prominentIncomingSectionList];
    uint64_t v6 = [(NCNotificationRootList *)self incomingSectionList];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __92__NCNotificationRootList__migrateNotificationsFromProminentIncomingSectionToIncomingSection__block_invoke_2;
    v8[3] = &unk_1E6A925C8;
    void v8[4] = self;
    BYTE2(v7) = 0;
    LOWORD(v7) = 0;
    -[NCNotificationRootList _migrateNotificationsFromList:toList:passingTest:filterRequestsPassingTest:hideToList:clearRequests:filterForDestination:animateRemoval:reorderGroupNotifications:](self, "_migrateNotificationsFromList:toList:passingTest:filterRequestsPassingTest:hideToList:clearRequests:filterForDestination:animateRemoval:reorderGroupNotifications:", v5, v6, 0, v8, 0, 0, v7);

    [(NCNotificationRootList *)self _updateDelegateAndSubclassIfNecessaryOfContentChange];
  }
}

void __92__NCNotificationRootList__migrateNotificationsFromProminentIncomingSectionToIncomingSection__block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 migrationScheduler];
  [v4 removeMigrationForNotificationRequest:v3];
}

uint64_t __92__NCNotificationRootList__migrateNotificationsFromProminentIncomingSectionToIncomingSection__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) _isLockScreenPersistenceNotificationRequest:v3];
  if (v4)
  {
    uint64_t v5 = (void *)*MEMORY[0x1E4FB3778];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void **)(a1 + 32);
      uint64_t v7 = v5;
      id v8 = [v6 logDescription];
      long long v9 = [v3 notificationIdentifier];
      id v10 = objc_msgSend(v9, "un_logDigest");
      uint64_t v11 = [v3 options];
      int v13 = 138543874;
      uint64_t v14 = v8;
      __int16 v15 = 2114;
      unint64_t v16 = v10;
      __int16 v17 = 2048;
      uint64_t v18 = [v11 lockScreenPersistence];
      _os_log_impl(&dword_1D7C04000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ notification %{public}@ is persistent notification; lockScreenPersistence: %lu; skip migration from p"
        "rominent incoming to incoming.",
        (uint8_t *)&v13,
        0x20u);
    }
  }

  return v4;
}

- (void)_updateSystemSettingsForUpdatedNotificationListDisplayStyleSetting:(int64_t)a3
{
  id v8 = [(NCNotificationRootList *)self delegate];
  if (v8 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    uint64_t v5 = [v8 notificationSystemSettingsForNotificationListComponent:self];
    uint64_t v6 = v5;
    if (v5 && [v5 listDisplayStyleSetting] != a3)
    {
      uint64_t v7 = (void *)[v6 mutableCopy];
      [v7 setListDisplayStyleSetting:a3];
      if (objc_opt_respondsToSelector()) {
        [v8 notificationListComponent:self setNotificationSystemSettings:v7];
      }
    }
  }
  else
  {
    uint64_t v6 = 0;
  }
}

- (void)_updateNotificationListDisplayStyleSetting
{
  v28[7] = *MEMORY[0x1E4F143B8];
  uint64_t v16 = 0;
  __int16 v17 = &v16;
  uint64_t v18 = 0x2020000000;
  int64_t v19 = 0;
  int64_t v19 = [(NCNotificationRootList *)self currentListDisplayStyleSetting];
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  int v13 = __Block_byref_object_copy__0;
  uint64_t v14 = __Block_byref_object_dispose__0;
  id v15 = 0;
  v28[0] = @"NCNotificationListDisplayStyleReasonOverrideLandscapeOrientation";
  v28[1] = @"NCNotificationListDisplayStyleReasonInteractiveTransition";
  v28[2] = @"NCNotificationListDisplayStyleSettingOverrideReasonSleep";
  v28[3] = @"NCNotificationListDisplayStyleReasonOverridePersistHidden";
  v28[4] = @"NCNotificationListDisplayStyleReasonOverrideDeviceLocked";
  v28[5] = @"NCNotificationListDisplayStyleReasonOverrideHighlightShowing";
  v28[6] = @"NCNotificationListDisplayStyleReasonSystemSetting";
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:7];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __68__NCNotificationRootList__updateNotificationListDisplayStyleSetting__block_invoke;
  v9[3] = &unk_1E6A92928;
  void v9[4] = self;
  void v9[5] = &v16;
  v9[6] = &v10;
  [v3 enumerateObjectsUsingBlock:v9];
  if (![(NCNotificationRootList *)self _isCurrentListDisplayStyleSettingEqualTo:v17[3]])
  {
    uint64_t v4 = (id)*MEMORY[0x1E4FB3778];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = [(NCNotificationRootList *)self logDescription];
      id v6 = [MEMORY[0x1E4FB3808] stringForNotificationListDisplayStyleSetting:v17[3]];
      uint64_t v7 = objc_msgSend(MEMORY[0x1E4FB3808], "stringForNotificationListDisplayStyleSetting:", -[NCNotificationRootList currentListDisplayStyleSetting](self, "currentListDisplayStyleSetting"));
      uint64_t v8 = v11[5];
      *(_DWORD *)buf = 138544130;
      id v21 = v5;
      __int16 v22 = 2114;
      id v23 = v6;
      __int16 v24 = 2114;
      BOOL v25 = v7;
      __int16 v26 = 2114;
      uint64_t v27 = v8;
      _os_log_impl(&dword_1D7C04000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ setting current list display setting to %{public}@ from %{public}@ for reason %{public}@", buf, 0x2Au);
    }
    [(NCNotificationRootList *)self setCurrentListDisplayStyleSetting:v17[3]];
  }
  [(NCNotificationRootList *)self setCurrentListDisplayStyleSettingReason:v11[5]];

  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v16, 8);
}

void __68__NCNotificationRootList__updateNotificationListDisplayStyleSetting__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  uint64_t v7 = [*(id *)(a1 + 32) notificationListDisplayStyleSettingsForReason];
  uint64_t v8 = [v7 objectForKey:v9];

  if (v8)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v8 unsignedIntegerValue];
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (id)_insertNotificationRequest:(id)a3
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(NCNotificationRootList *)self _sectionForInsertingNotificationRequest:v4];
  if ((_NCReactiveListUI() & 1) == 0)
  {
    id v6 = [(NCNotificationRootList *)self highlightedSectionList];

    uint64_t v7 = [(NCNotificationRootList *)self prominentIncomingSectionList];
    if (v7)
    {
      uint64_t v8 = (void *)v7;
      id v9 = [(NCNotificationRootList *)self prominentIncomingSectionList];
      uint64_t v10 = [v9 count];

      if (v5 == v6)
      {
        if (v10)
        {
          uint64_t v11 = (void *)*MEMORY[0x1E4FB3778];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v12 = v11;
            int v13 = [(NCNotificationRootList *)self logDescription];
            uint64_t v14 = [v4 notificationIdentifier];
            id v15 = objc_msgSend(v14, "un_logDigest");
            *(_DWORD *)buf = 138543618;
            id v47 = v13;
            __int16 v48 = 2114;
            __int16 v49 = v15;
            _os_log_impl(&dword_1D7C04000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ New request %{public}@ is highlighted; migrate existing prominentIncoming (non-lockScreenPersis"
              "tence) to incoming",
              buf,
              0x16u);
          }
          [(NCNotificationRootList *)self _migrateNotificationsFromProminentIncomingSectionToIncomingSection];
        }
      }
    }
  }
  uint64_t v16 = (void *)MEMORY[0x1E4F1CA80];
  __int16 v17 = [(NCNotificationRootList *)self _notificationSectionListsForEnumeration];
  uint64_t v18 = [v16 setWithSet:v17];

  if (self->_upcomingDigestSectionList) {
    objc_msgSend(v18, "addObject:");
  }
  if (self->_currentDigestSectionList)
  {
    if (_NCReactiveListUI())
    {
      int64_t v19 = [(NCNotificationRootList *)self _sectionListsThatSuppressDigest];
      uint64_t v20 = [(NCNotificationStructuredSectionList *)v5 sectionType];
      long long v40 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      id v21 = v19;
      uint64_t v22 = [v21 countByEnumeratingWithState:&v40 objects:v45 count:16];
      if (v22)
      {
        uint64_t v23 = v22;
        uint64_t v24 = *(void *)v41;
        while (2)
        {
          for (uint64_t i = 0; i != v23; ++i)
          {
            if (*(void *)v41 != v24) {
              objc_enumerationMutation(v21);
            }
            if ([*(id *)(*((void *)&v40 + 1) + 8 * i) sectionType] == v20)
            {

              __int16 v26 = (void *)*MEMORY[0x1E4FB3778];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v27 = v26;
                uint64_t v28 = [(NCNotificationRootList *)self logDescription];
                id v29 = [v4 notificationIdentifier];
                uint64_t v30 = objc_msgSend(v29, "un_logDigest");
                *(_DWORD *)buf = 138543618;
                id v47 = v28;
                __int16 v48 = 2114;
                __int16 v49 = v30;
                _os_log_impl(&dword_1D7C04000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@ Moving digest for inserted notification %{public}@", buf, 0x16u);
              }
              BOOL v31 = [(NCNotificationRootList *)self currentDigestSectionList];
              [v31 collapseSummarizedSectionList];

              [(NCNotificationRootList *)self _migrateCurrentDigestSectionListToReadSection];
              goto LABEL_24;
            }
          }
          uint64_t v23 = [v21 countByEnumeratingWithState:&v40 objects:v45 count:16];
          if (v23) {
            continue;
          }
          break;
        }
      }

LABEL_24:
    }
    if (self->_currentDigestSectionList) {
      objc_msgSend(v18, "addObject:");
    }
  }
  if (self->_upcomingMissedSectionList) {
    objc_msgSend(v18, "addObject:");
  }
  if (v5) {
    [v18 removeObject:v5];
  }
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __53__NCNotificationRootList__insertNotificationRequest___block_invoke;
  v38[3] = &unk_1E6A92878;
  id v32 = v4;
  id v39 = v32;
  [v18 enumerateObjectsUsingBlock:v38];
  [(NCNotificationStructuredSectionList *)v5 insertNotificationRequest:v32];
  if (_NCReactiveListUI())
  {
    [(NCNotificationRootList *)self _updateForceExpansionForHighlights];
  }
  else if (v5 == self->_prominentIncomingSectionList {
         && [(NCNotificationRootList *)self _isAlertingNotificationRequest:v32]
  }
         && ![(NCNotificationRootList *)self _isLockScreenPersistenceNotificationRequest:v32])
  {
    BOOL v33 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:30.0];
    char v34 = [(NCNotificationRootList *)self migrationScheduler];
    id v44 = v32;
    __int16 v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v44 count:1];
    [v34 addMigrationForNotificationRequests:v35 forDate:v33];
  }
  BOOL v36 = +[NCNotificationEventTracker sharedInstance];
  objc_msgSend(v36, "insertedNotificationRequest:toSectionType:", v32, -[NCNotificationStructuredSectionList sectionType](v5, "sectionType"));

  [(NCNotificationRootList *)self _elevateGroupInOtherSectionsIfNeededWithRequest:v32 toSection:v5];

  return v5;
}

uint64_t __53__NCNotificationRootList__insertNotificationRequest___block_invoke(uint64_t a1, void *a2)
{
  return [a2 removeNotificationRequest:*(void *)(a1 + 32)];
}

- (void)_migrateNotificationsFromList:(id)a3 toList:(id)a4 passingTest:(id)a5 filterRequestsPassingTest:(id)a6 hideToList:(BOOL)a7 clearRequests:(BOOL)a8 filterForDestination:(BOOL)a9 animateRemoval:(BOOL)a10 reorderGroupNotifications:(BOOL)a11
{
  BOOL v11 = a8;
  BOOL v12 = a7;
  BOOL v17 = a10;
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v18 = a3;
  id v19 = a4;
  id v20 = a5;
  id v21 = a6;
  uint64_t v22 = (void *)*MEMORY[0x1E4FB3778];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v23 = v22;
    [(NCNotificationRootList *)self logDescription];
    v24 = BOOL v37 = v12;
    [v18 logDescription];
    BOOL v25 = v11;
    id v26 = v18;
    id v27 = v21;
    v29 = id v28 = v20;
    uint64_t v30 = [v19 logDescription];
    *(_DWORD *)buf = 138543874;
    long long v41 = v24;
    __int16 v42 = 2114;
    long long v43 = v29;
    __int16 v44 = 2114;
    __int16 v45 = v30;
    _os_log_impl(&dword_1D7C04000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@ migrating notification requests from %{public}@ to %{public}@", buf, 0x20u);

    id v20 = v28;
    id v21 = v27;
    id v18 = v26;
    BOOL v11 = v25;
    BOOL v17 = a10;

    BOOL v12 = v37;
  }
  BOOL v31 = [v18 removeNotificationGroupListsForMigrationPassingTest:v20 filterRequestsPassingTest:v21 animate:v17];
  id v32 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  BOOL v33 = v32;
  if (v11)
  {
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __188__NCNotificationRootList__migrateNotificationsFromList_toList_passingTest_filterRequestsPassingTest_hideToList_clearRequests_filterForDestination_animateRemoval_reorderGroupNotifications___block_invoke;
    v38[3] = &unk_1E6A92950;
    id v39 = v32;
    [v31 enumerateObjectsUsingBlock:v38];
  }
  if (a9)
  {
    uint64_t v34 = [(NCNotificationRootList *)self _filterNotificationsInGroupLists:v31 withDestinationsForSectionList:v19];

    BOOL v31 = (void *)v34;
  }
  if ([v31 count]) {
    [(NCNotificationRootList *)self _regroupAllNotificationGroups];
  }
  if ([v31 count])
  {
    if (v12)
    {
      [(NCNotificationRootList *)self _setRevealed:0 forSection:v19];
      [(NCNotificationRootList *)self _setForceRevealed:0];
      if (![v19 sectionType])
      {
        __int16 v35 = [(NCNotificationRootList *)self rootListView];
        [v35 _scrollToTopIfPossible:1];
      }
    }
  }
  [v19 mergeNotificationGroups:v31 reorderGroupNotifications:a11];
  if ([v33 count])
  {
    BOOL v36 = [(NCNotificationRootList *)self delegate];
    [v36 notificationRootList:self requestsClearingFromIncomingSectionNotificationRequests:v33];

    if ([v18 sectionType] == 2 && !objc_msgSend(v19, "sectionType")) {
      [v33 enumerateObjectsUsingBlock:&__block_literal_global_143];
    }
  }
}

void __188__NCNotificationRootList__migrateNotificationsFromList_toList_passingTest_filterRequestsPassingTest_hideToList_clearRequests_filterForDestination_animateRemoval_reorderGroupNotifications___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 allNotificationRequests];
  [v2 addObjectsFromArray:v3];
}

void __188__NCNotificationRootList__migrateNotificationsFromList_toList_passingTest_filterRequestsPassingTest_hideToList_clearRequests_filterForDestination_animateRemoval_reorderGroupNotifications___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[NCNotificationEventTracker sharedInstance];
  [v3 hideNotificationRequest:v2];
}

- (id)_filterNotificationsInGroupLists:(id)a3 withDestinationsForSectionList:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v20 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  obuint64_t j = v6;
  uint64_t v8 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v21 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v27 != v21) {
          objc_enumerationMutation(obj);
        }
        BOOL v11 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        BOOL v12 = [v11 allNotificationRequests];
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        uint64_t v13 = [v12 countByEnumeratingWithState:&v22 objects:v30 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v23;
          do
          {
            for (uint64_t j = 0; j != v14; ++j)
            {
              if (*(void *)v23 != v15) {
                objc_enumerationMutation(v12);
              }
              uint64_t v17 = *(void *)(*((void *)&v22 + 1) + 8 * j);
              if (!-[NCNotificationRootList _isNotificationRequest:forSectionList:](self, "_isNotificationRequest:forSectionList:", v17, v7))[v11 removeNotificationRequest:v17]; {
            }
              }
            uint64_t v14 = [v12 countByEnumeratingWithState:&v22 objects:v30 count:16];
          }
          while (v14);
        }
        if ([v11 count]) {
          [v20 addObject:v11];
        }
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v9);
  }

  return v20;
}

- (void)_scheduleNotificationRequestsForMigrationFromIncomingListPassingTest:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (NSObject **)MEMORY[0x1E4FB3778];
  id v6 = (void *)*MEMORY[0x1E4FB3778];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
  {
    id v7 = v6;
    uint64_t v8 = [(NCNotificationRootList *)self logDescription];
    *(_DWORD *)buf = 138543362;
    long long v26 = v8;
    _os_log_impl(&dword_1D7C04000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ scheduling migration for incoming list.", buf, 0xCu);
  }
  uint64_t v9 = [(NCNotificationRootList *)self incomingSectionList];
  uint64_t v10 = [v9 allNotificationRequests];

  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __95__NCNotificationRootList__scheduleNotificationRequestsForMigrationFromIncomingListPassingTest___block_invoke;
  v22[3] = &unk_1E6A92998;
  id v12 = v4;
  id v24 = v12;
  void v22[4] = self;
  id v13 = v11;
  id v23 = v13;
  [v10 enumerateObjectsUsingBlock:v22];
  double v14 = 3600.0;
  if (os_variant_has_internal_content())
  {
    [(NCNotificationRootList *)self overrideNotificationMigrateTimeSensitiveToHistoryTimeIntervalKey];
    if (v15 > 0.0)
    {
      uint64_t v16 = *v5;
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v17 = v16;
        id v18 = [(NCNotificationRootList *)self logDescription];
        [(NCNotificationRootList *)self overrideNotificationMigrateTimeSensitiveToHistoryTimeIntervalKey];
        *(_DWORD *)buf = 138543618;
        long long v26 = v18;
        __int16 v27 = 2050;
        uint64_t v28 = v19;
        _os_log_impl(&dword_1D7C04000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ Found override value for TimeSensitive migrate timeInterval %{public}.2f.", buf, 0x16u);
      }
      [(NCNotificationRootList *)self overrideNotificationMigrateTimeSensitiveToHistoryTimeIntervalKey];
      double v14 = v20;
    }
  }
  uint64_t v21 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:v14];
  [(NCNotificationListMigrationScheduler *)self->_migrationScheduler addMigrationForNotificationRequests:v13 forDate:v21];
}

void __95__NCNotificationRootList__scheduleNotificationRequestsForMigrationFromIncomingListPassingTest___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 48);
  if (!v4 || (*(unsigned int (**)(uint64_t, id))(v4 + 16))(v4, v3))
  {
    id v5 = (void *)*MEMORY[0x1E4FB3778];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
    {
      id v6 = *(void **)(a1 + 32);
      id v7 = v5;
      uint64_t v8 = [v6 logDescription];
      uint64_t v9 = [v3 notificationIdentifier];
      uint64_t v10 = objc_msgSend(v9, "un_logDigest");
      int v11 = 138543618;
      id v12 = v8;
      __int16 v13 = 2114;
      double v14 = v10;
      _os_log_impl(&dword_1D7C04000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ schedule request %{public}@ for incoming to history migration.", (uint8_t *)&v11, 0x16u);
    }
    [*(id *)(a1 + 40) addObject:v3];
  }
}

- (void)_scheduleAllNotificationRequestsForMigrationFromHighlightList
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(NCNotificationRootList *)self highlightedSectionList];
  if (v3)
  {
    uint64_t v4 = (void *)v3;
    id v5 = [(NCNotificationRootList *)self highlightedSectionList];
    uint64_t v6 = [v5 notificationCount];

    if (v6)
    {
      id v7 = (os_log_t *)MEMORY[0x1E4FB3778];
      uint64_t v8 = (void *)*MEMORY[0x1E4FB3778];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v9 = v8;
        uint64_t v10 = [(NCNotificationRootList *)self logDescription];
        int v21 = 138543362;
        long long v22 = v10;
        _os_log_impl(&dword_1D7C04000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ scheduling migration for all notifications in highlight list.", (uint8_t *)&v21, 0xCu);
      }
      int v11 = [(NCNotificationRootList *)self highlightedSectionList];
      id v12 = [v11 allNotificationRequests];

      double v13 = 900.0;
      if (os_variant_has_internal_content())
      {
        [(NCNotificationRootList *)self overrideNotificationMigrateHighlightToHistoryTimeIntervalKey];
        if (v14 > 0.0)
        {
          os_log_t v15 = *v7;
          if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v16 = v15;
            uint64_t v17 = [(NCNotificationRootList *)self logDescription];
            [(NCNotificationRootList *)self overrideNotificationMigrateHighlightToHistoryTimeIntervalKey];
            int v21 = 138543618;
            long long v22 = v17;
            __int16 v23 = 2050;
            uint64_t v24 = v18;
            _os_log_impl(&dword_1D7C04000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ Found override value for Highlight migrate timeInterval %{public}.2f.", (uint8_t *)&v21, 0x16u);
          }
          [(NCNotificationRootList *)self overrideNotificationMigrateHighlightToHistoryTimeIntervalKey];
          double v13 = v19;
        }
      }
      double v20 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:v13];
      [(NCNotificationListMigrationScheduler *)self->_migrationScheduler addMigrationForNotificationRequests:v12 forDate:v20];
    }
  }
}

- (void)_scheduleNotificationDigestMigrationIfNecessary
{
  if ([(NCNotificationRootList *)self _isCurrentDigestListAboveHistorySectionList]&& ![(NCNotificationRootList *)self isOnboardingSummaryVisible])
  {
    uint64_t v3 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:1800.0];
  }
  else
  {
    uint64_t v3 = 0;
  }
  id v4 = (id)v3;
  [(NCNotificationListMigrationScheduler *)self->_migrationScheduler setMigrationDateForNotificationDigest:v3];
}

- (void)_performDeferredMigrationIfNecessary
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if ([(NCNotificationRootList *)self deferDigestMigration]
    && [(NCNotificationRootList *)self _isCurrentDigestListAboveHistorySectionList])
  {
    uint64_t v3 = (void *)*MEMORY[0x1E4FB3778];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
    {
      id v4 = v3;
      id v5 = [(NCNotificationRootList *)self logDescription];
      int v11 = 138543362;
      id v12 = v5;
      _os_log_impl(&dword_1D7C04000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ performing deferred migration of current digest", (uint8_t *)&v11, 0xCu);
    }
    [(NCNotificationRootList *)self _migrateCurrentDigestSectionListToReadSection];
    [(NCNotificationRootList *)self setDeferDigestMigration:0];
  }
  if ([(NSMutableArray *)self->_notificationRequestsPendingMigration count])
  {
    uint64_t v6 = (void *)*MEMORY[0x1E4FB3778];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
    {
      id v7 = v6;
      uint64_t v8 = [(NCNotificationRootList *)self logDescription];
      uint64_t v9 = [(NSMutableArray *)self->_notificationRequestsPendingMigration bs_map:&__block_literal_global_145];
      int v11 = 138543618;
      id v12 = v8;
      __int16 v13 = 2114;
      double v14 = v9;
      _os_log_impl(&dword_1D7C04000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ performing deferred migration of requests pending migration %{public}@", (uint8_t *)&v11, 0x16u);
    }
    [(NCNotificationRootList *)self _migrateNonActiveHighlightNotificationRequestsFromHighlightToIncomingSection:self->_notificationRequestsPendingMigration];
    [(NCNotificationRootList *)self _migrateOnScheduleNotificationRequestsFromIncomingSectionToHistorySection:self->_notificationRequestsPendingMigration];
    if ((_NCReactiveListUI() & 1) == 0
      && [(NCNotificationRootList *)self currentListDisplayStyleSetting] == 2)
    {
      [(NCNotificationRootList *)self _migrateOnScheduleNotificationRequestsFromProminentIncomingSectionToIncomingSection:self->_notificationRequestsPendingMigration];
    }
    notificationRequestsPendingMigration = self->_notificationRequestsPendingMigration;
    self->_notificationRequestsPendingMigration = 0;
  }
}

id __62__NCNotificationRootList__performDeferredMigrationIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 notificationIdentifier];
  uint64_t v3 = objc_msgSend(v2, "un_logDigest");

  return v3;
}

- (BOOL)_isEligibleForStackElevationMigrationWithGroupList:(id)a3 areGenerativeModelsAvailable:(BOOL)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = v6;
  if (!a4)
  {
    uint64_t v9 = (void *)*MEMORY[0x1E4FB3778];
    BOOL v8 = 0;
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_9;
    }
    uint64_t v10 = v9;
    int v11 = [(NCNotificationRootList *)self logDescription];
    int v15 = 138543362;
    uint64_t v16 = v11;
    _os_log_impl(&dword_1D7C04000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ generative models are not available", (uint8_t *)&v15, 0xCu);
LABEL_8:

    BOOL v8 = 0;
    goto LABEL_9;
  }
  if (([v6 isEligibleForStackElevationMigration] & 1) == 0)
  {
    id v12 = (void *)*MEMORY[0x1E4FB3778];
    BOOL v8 = 0;
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_9;
    }
    uint64_t v10 = v12;
    int v11 = [(NCNotificationRootList *)self logDescription];
    __int16 v13 = [v7 logDescription];
    int v15 = 138543618;
    uint64_t v16 = v11;
    __int16 v17 = 2114;
    uint64_t v18 = v13;
    _os_log_impl(&dword_1D7C04000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ thread %{public}@ is not is not eligible for stack elevation", (uint8_t *)&v15, 0x16u);

    goto LABEL_8;
  }
  BOOL v8 = 1;
LABEL_9:

  return v8;
}

- (void)_migrateNonActiveHighlightNotificationRequestsFromHighlightToIncomingSection:(id)a3
{
  id v4 = a3;
  id v5 = [(NCNotificationRootList *)self highlightedSectionList];

  if (v5)
  {
    if (_NCStackElevation())
    {
      BOOL v6 = +[NCPlatformEligibility areGenerativeModelsAvailable];
      id v7 = [(NCNotificationRootList *)self highlightedSectionList];
      BOOL v8 = [(NCNotificationRootList *)self incomingSectionList];
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __103__NCNotificationRootList__migrateNonActiveHighlightNotificationRequestsFromHighlightToIncomingSection___block_invoke;
      v26[3] = &unk_1E6A929C0;
      v26[4] = self;
      BOOL v28 = v6;
      id v9 = v4;
      id v27 = v9;
      BYTE2(v15) = 0;
      LOWORD(v15) = 0;
      -[NCNotificationRootList _migrateNotificationsFromList:toList:passingTest:filterRequestsPassingTest:hideToList:clearRequests:filterForDestination:animateRemoval:reorderGroupNotifications:](self, "_migrateNotificationsFromList:toList:passingTest:filterRequestsPassingTest:hideToList:clearRequests:filterForDestination:animateRemoval:reorderGroupNotifications:", v7, v8, v26, 0, 0, 0, v15);

      uint64_t v10 = [(NCNotificationRootList *)self highlightedSectionList];
      int v11 = [(NCNotificationRootList *)self incomingSectionList];
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __103__NCNotificationRootList__migrateNonActiveHighlightNotificationRequestsFromHighlightToIncomingSection___block_invoke_147;
      v24[3] = &unk_1E6A925F0;
      v24[4] = self;
      BOOL v25 = v6;
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __103__NCNotificationRootList__migrateNonActiveHighlightNotificationRequestsFromHighlightToIncomingSection___block_invoke_148;
      v21[3] = &unk_1E6A929E8;
      id v22 = v9;
      __int16 v23 = self;
      BYTE2(v16) = 0;
      LOWORD(v16) = 0;
      -[NCNotificationRootList _migrateNotificationsFromList:toList:passingTest:filterRequestsPassingTest:hideToList:clearRequests:filterForDestination:animateRemoval:reorderGroupNotifications:](self, "_migrateNotificationsFromList:toList:passingTest:filterRequestsPassingTest:hideToList:clearRequests:filterForDestination:animateRemoval:reorderGroupNotifications:", v10, v11, v24, v21, 0, 0, v16);

      id v12 = v27;
    }
    else
    {
      __int16 v13 = [(NCNotificationRootList *)self highlightedSectionList];
      double v14 = [(NCNotificationRootList *)self incomingSectionList];
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __103__NCNotificationRootList__migrateNonActiveHighlightNotificationRequestsFromHighlightToIncomingSection___block_invoke_149;
      v19[3] = &unk_1E6A927B8;
      id v20 = v4;
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __103__NCNotificationRootList__migrateNonActiveHighlightNotificationRequestsFromHighlightToIncomingSection___block_invoke_3;
      v17[3] = &unk_1E6A925C8;
      id v18 = v20;
      BYTE2(v15) = 0;
      LOWORD(v15) = 0;
      -[NCNotificationRootList _migrateNotificationsFromList:toList:passingTest:filterRequestsPassingTest:hideToList:clearRequests:filterForDestination:animateRemoval:reorderGroupNotifications:](self, "_migrateNotificationsFromList:toList:passingTest:filterRequestsPassingTest:hideToList:clearRequests:filterForDestination:animateRemoval:reorderGroupNotifications:", v13, v14, v19, v17, 0, 0, v15);

      id v12 = v20;
    }
  }
}

BOOL __103__NCNotificationRootList__migrateNonActiveHighlightNotificationRequestsFromHighlightToIncomingSection___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([*(id *)(a1 + 32) _isEligibleForStackElevationMigrationWithGroupList:v3 areGenerativeModelsAvailable:*(unsigned __int8 *)(a1 + 48)])
  {
    id v4 = [v3 leadingNotificationRequest];
    id v5 = *(void **)(a1 + 40);
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __103__NCNotificationRootList__migrateNonActiveHighlightNotificationRequestsFromHighlightToIncomingSection___block_invoke_146;
    v28[3] = &unk_1E6A92790;
    id v6 = v4;
    id v29 = v6;
    uint64_t v7 = [v5 indexOfObjectPassingTest:v28];
    BOOL v8 = (void *)*MEMORY[0x1E4FB3778];
    BOOL v9 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT);
    BOOL v10 = v7 == 0x7FFFFFFFFFFFFFFFLL;
    BOOL v11 = v7 != 0x7FFFFFFFFFFFFFFFLL;
    if (v10)
    {
      if (v9)
      {
        int v21 = *(void **)(a1 + 32);
        id v22 = v8;
        __int16 v23 = [v21 logDescription];
        uint64_t v24 = [v6 notificationIdentifier];
        BOOL v25 = objc_msgSend(v24, "un_logDigest");
        long long v26 = [v3 logDescription];
        *(_DWORD *)buf = 138543874;
        BOOL v31 = v23;
        __int16 v32 = 2114;
        BOOL v33 = v25;
        __int16 v34 = 2114;
        __int16 v35 = v26;
        _os_log_impl(&dword_1D7C04000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@ leading notification %{public}@ in the thread %{public}@ is not within the target requests we want to migrate this time; Skip migration from highlight to incoming.",
          buf,
          0x20u);
      }
    }
    else if (v9)
    {
      id v12 = *(void **)(a1 + 32);
      __int16 v13 = v8;
      double v14 = [v12 logDescription];
      uint64_t v15 = [v3 logDescription];
      *(_DWORD *)buf = 138543618;
      BOOL v31 = v14;
      __int16 v32 = 2114;
      BOOL v33 = v15;
      _os_log_impl(&dword_1D7C04000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ migrate thread %{public}@ from highlight to incoming.", buf, 0x16u);
    }
  }
  else
  {
    uint64_t v16 = (void *)*MEMORY[0x1E4FB3778];
    BOOL v11 = 0;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
    {
      __int16 v17 = *(void **)(a1 + 32);
      id v18 = v16;
      uint64_t v19 = [v17 logDescription];
      id v20 = [v3 logDescription];
      *(_DWORD *)buf = 138543618;
      BOOL v31 = v19;
      __int16 v32 = 2114;
      BOOL v33 = v20;
      _os_log_impl(&dword_1D7C04000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@ thread %{public}@ is not eligible for stack elevation migration; skip group migration from highlight to incoming.",
        buf,
        0x16u);

      BOOL v11 = 0;
    }
  }

  return v11;
}

uint64_t __103__NCNotificationRootList__migrateNonActiveHighlightNotificationRequestsFromHighlightToIncomingSection___block_invoke_146(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) matchesRequest:a2];
}

uint64_t __103__NCNotificationRootList__migrateNonActiveHighlightNotificationRequestsFromHighlightToIncomingSection___block_invoke_147(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = [*(id *)(a1 + 32) _isEligibleForStackElevationMigrationWithGroupList:v3 areGenerativeModelsAvailable:*(unsigned __int8 *)(a1 + 40)];
  id v5 = (void *)*MEMORY[0x1E4FB3778];
  BOOL v6 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      uint64_t v7 = *(void **)(a1 + 32);
      BOOL v8 = v5;
      BOOL v9 = [v7 logDescription];
      BOOL v10 = [v3 logDescription];
      int v14 = 138543618;
      uint64_t v15 = v9;
      __int16 v16 = 2114;
      __int16 v17 = v10;
      BOOL v11 = "%{public}@ thread %{public}@ eligible for stack elevation migration; skip migrating individually from highlight to incoming";
LABEL_6:
      _os_log_impl(&dword_1D7C04000, v8, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v14, 0x16u);
    }
  }
  else if (v6)
  {
    id v12 = *(void **)(a1 + 32);
    BOOL v8 = v5;
    BOOL v9 = [v12 logDescription];
    BOOL v10 = [v3 logDescription];
    int v14 = 138543618;
    uint64_t v15 = v9;
    __int16 v16 = 2114;
    __int16 v17 = v10;
    BOOL v11 = "%{public}@ thread %{public}@ is not eligible for stack elevation migration; migrate individually from highlight to incoming.";
    goto LABEL_6;
  }

  return v4 ^ 1u;
}

BOOL __103__NCNotificationRootList__migrateNonActiveHighlightNotificationRequestsFromHighlightToIncomingSection___block_invoke_148(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = *(void **)(a1 + 32);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __103__NCNotificationRootList__migrateNonActiveHighlightNotificationRequestsFromHighlightToIncomingSection___block_invoke_2;
  v14[3] = &unk_1E6A92790;
  id v5 = v3;
  id v15 = v5;
  uint64_t v6 = [v4 indexOfObjectPassingTest:v14];
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v7 = (void *)*MEMORY[0x1E4FB3778];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
    {
      BOOL v8 = *(void **)(a1 + 40);
      BOOL v9 = v7;
      BOOL v10 = [v8 logDescription];
      BOOL v11 = [v5 notificationIdentifier];
      id v12 = objc_msgSend(v11, "un_logDigest");
      *(_DWORD *)buf = 138543618;
      __int16 v17 = v10;
      __int16 v18 = 2114;
      uint64_t v19 = v12;
      _os_log_impl(&dword_1D7C04000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ migrate request %{public}@ from highlight to incoming.", buf, 0x16u);
    }
  }

  return v6 == 0x7FFFFFFFFFFFFFFFLL;
}

uint64_t __103__NCNotificationRootList__migrateNonActiveHighlightNotificationRequestsFromHighlightToIncomingSection___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 matchesRequest:*(void *)(a1 + 32)];
}

BOOL __103__NCNotificationRootList__migrateNonActiveHighlightNotificationRequestsFromHighlightToIncomingSection___block_invoke_149(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __103__NCNotificationRootList__migrateNonActiveHighlightNotificationRequestsFromHighlightToIncomingSection___block_invoke_2_150;
  v8[3] = &unk_1E6A92790;
  id v9 = v3;
  id v5 = v3;
  BOOL v6 = [v4 indexOfObjectPassingTest:v8] != 0x7FFFFFFFFFFFFFFFLL;

  return v6;
}

uint64_t __103__NCNotificationRootList__migrateNonActiveHighlightNotificationRequestsFromHighlightToIncomingSection___block_invoke_2_150(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = [*(id *)(a1 + 32) sectionIdentifier];
  id v5 = [v3 sectionIdentifier];
  if ([v4 isEqualToString:v5])
  {
    BOOL v6 = [*(id *)(a1 + 32) threadIdentifier];
    uint64_t v7 = [v3 threadIdentifier];
    uint64_t v8 = [v6 isEqualToString:v7];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

BOOL __103__NCNotificationRootList__migrateNonActiveHighlightNotificationRequestsFromHighlightToIncomingSection___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __103__NCNotificationRootList__migrateNonActiveHighlightNotificationRequestsFromHighlightToIncomingSection___block_invoke_4;
  v8[3] = &unk_1E6A92790;
  id v9 = v3;
  id v5 = v3;
  BOOL v6 = [v4 indexOfObjectPassingTest:v8] == 0x7FFFFFFFFFFFFFFFLL;

  return v6;
}

uint64_t __103__NCNotificationRootList__migrateNonActiveHighlightNotificationRequestsFromHighlightToIncomingSection___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 matchesRequest:*(void *)(a1 + 32)];
}

- (void)_migrateOnScheduleNotificationRequestsFromIncomingSectionToHistorySection:(id)a3
{
  id v4 = a3;
  id v6 = [(NCNotificationRootList *)self incomingSectionList];
  id v5 = [(NCNotificationRootList *)self historySectionList];
  [(NCNotificationRootList *)self _migrateOnScheduleNotificationRequests:v4 fromSection:v6 toSection:v5 clearRequests:1 filterForDestination:1 animateRemoval:0];
}

- (void)_migrateOnScheduleNotificationRequestsFromProminentIncomingSectionToIncomingSection:(id)a3
{
  id v4 = a3;
  id v5 = [(NCNotificationRootList *)self prominentIncomingSectionList];
  id v6 = [(NCNotificationRootList *)self incomingSectionList];
  [(NCNotificationRootList *)self _migrateOnScheduleNotificationRequests:v4 fromSection:v5 toSection:v6 clearRequests:0 filterForDestination:0 animateRemoval:0];

  [(NCNotificationRootList *)self _updateDelegateAndSubclassIfNecessaryOfContentChange];
}

- (void)_migrateOnScheduleNotificationRequests:(id)a3 fromSection:(id)a4 toSection:(id)a5 clearRequests:(BOOL)a6 filterForDestination:(BOOL)a7 animateRemoval:(BOOL)a8
{
  BOOL v10 = a6;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  if (_NCStackElevation())
  {
    BOOL v17 = +[NCPlatformEligibility areGenerativeModelsAvailable];
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __137__NCNotificationRootList__migrateOnScheduleNotificationRequests_fromSection_toSection_clearRequests_filterForDestination_animateRemoval___block_invoke;
    v41[3] = &unk_1E6A92A10;
    v41[4] = self;
    BOOL v45 = v17;
    id v18 = v14;
    id v42 = v18;
    id v26 = v14;
    id v19 = v15;
    id v43 = v19;
    id v20 = v16;
    id v44 = v20;
    BYTE2(v24) = 0;
    BYTE1(v24) = a8;
    LOBYTE(v24) = a7;
    -[NCNotificationRootList _migrateNotificationsFromList:toList:passingTest:filterRequestsPassingTest:hideToList:clearRequests:filterForDestination:animateRemoval:reorderGroupNotifications:](self, "_migrateNotificationsFromList:toList:passingTest:filterRequestsPassingTest:hideToList:clearRequests:filterForDestination:animateRemoval:reorderGroupNotifications:", v19, v20, v41, 0, 1, v10, v24);
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __137__NCNotificationRootList__migrateOnScheduleNotificationRequests_fromSection_toSection_clearRequests_filterForDestination_animateRemoval___block_invoke_152;
    v39[3] = &unk_1E6A925F0;
    v39[4] = self;
    BOOL v40 = v17;
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __137__NCNotificationRootList__migrateOnScheduleNotificationRequests_fromSection_toSection_clearRequests_filterForDestination_animateRemoval___block_invoke_153;
    v34[3] = &unk_1E6A92A38;
    id v35 = v18;
    uint64_t v36 = self;
    id v37 = v19;
    id v38 = v20;
    id v21 = v20;
    id v22 = v19;
    id v14 = v26;
    *(_WORD *)((char *)&v25 + 1) = a8;
    LOBYTE(v25) = a7;
    -[NCNotificationRootList _migrateNotificationsFromList:toList:passingTest:filterRequestsPassingTest:hideToList:clearRequests:filterForDestination:animateRemoval:reorderGroupNotifications:](self, "_migrateNotificationsFromList:toList:passingTest:filterRequestsPassingTest:hideToList:clearRequests:filterForDestination:animateRemoval:reorderGroupNotifications:", v22, v21, v39, v34, 1, v10, v25);

    id v23 = v42;
  }
  else
  {
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __137__NCNotificationRootList__migrateOnScheduleNotificationRequests_fromSection_toSection_clearRequests_filterForDestination_animateRemoval___block_invoke_154;
    v32[3] = &unk_1E6A927B8;
    id v33 = v14;
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __137__NCNotificationRootList__migrateOnScheduleNotificationRequests_fromSection_toSection_clearRequests_filterForDestination_animateRemoval___block_invoke_3;
    v27[3] = &unk_1E6A92A38;
    id v28 = v33;
    id v29 = self;
    id v30 = v15;
    id v31 = v16;
    BYTE2(v24) = 0;
    BYTE1(v24) = a8;
    LOBYTE(v24) = a7;
    -[NCNotificationRootList _migrateNotificationsFromList:toList:passingTest:filterRequestsPassingTest:hideToList:clearRequests:filterForDestination:animateRemoval:reorderGroupNotifications:](self, "_migrateNotificationsFromList:toList:passingTest:filterRequestsPassingTest:hideToList:clearRequests:filterForDestination:animateRemoval:reorderGroupNotifications:", v15, v16, v32, v27, 1, v10, v24);

    id v23 = v33;
  }
}

uint64_t __137__NCNotificationRootList__migrateOnScheduleNotificationRequests_fromSection_toSection_clearRequests_filterForDestination_animateRemoval___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([*(id *)(a1 + 32) _isEligibleForStackElevationMigrationWithGroupList:v3 areGenerativeModelsAvailable:*(unsigned __int8 *)(a1 + 64)])
  {
    id v4 = [v3 leadingNotificationRequest];
    id v5 = *(void **)(a1 + 40);
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __137__NCNotificationRootList__migrateOnScheduleNotificationRequests_fromSection_toSection_clearRequests_filterForDestination_animateRemoval___block_invoke_151;
    v34[3] = &unk_1E6A92790;
    id v6 = v4;
    id v35 = v6;
    if ([v5 indexOfObjectPassingTest:v34] == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v7 = (void *)*MEMORY[0x1E4FB3778];
      uint64_t v8 = 0;
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
      {
LABEL_15:

        goto LABEL_16;
      }
      id v9 = *(void **)(a1 + 32);
      BOOL v10 = v7;
      BOOL v11 = [v9 logDescription];
      id v12 = [v6 notificationIdentifier];
      __int16 v13 = objc_msgSend(v12, "un_logDigest");
      id v14 = [v3 logDescription];
      id v15 = NCNotificationListSectionTypeString([*(id *)(a1 + 48) sectionType]);
      id v16 = NCNotificationListSectionTypeString([*(id *)(a1 + 56) sectionType]);
      *(_DWORD *)buf = 138544386;
      id v37 = v11;
      __int16 v38 = 2114;
      id v39 = v13;
      __int16 v40 = 2114;
      long long v41 = v14;
      __int16 v42 = 2114;
      id v43 = v15;
      __int16 v44 = 2114;
      BOOL v45 = v16;
      _os_log_impl(&dword_1D7C04000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ leading notification %{public}@ in the thread %{public}@ is not within the target requests we want to migrate this time; skip migration from %{public}@ to %{public}@.",
        buf,
        0x34u);
    }
    else
    {
      int v22 = [v3 containsPersistentNotificationRequests];
      id v23 = (void *)*MEMORY[0x1E4FB3778];
      BOOL v24 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT);
      if (!v22)
      {
        if (v24)
        {
          id v27 = *(void **)(a1 + 32);
          id v28 = v23;
          id v29 = [v27 logDescription];
          id v30 = [v3 logDescription];
          id v31 = NCNotificationListSectionTypeString([*(id *)(a1 + 48) sectionType]);
          __int16 v32 = NCNotificationListSectionTypeString([*(id *)(a1 + 56) sectionType]);
          *(_DWORD *)buf = 138544130;
          id v37 = v29;
          __int16 v38 = 2114;
          id v39 = v30;
          __int16 v40 = 2114;
          long long v41 = v31;
          __int16 v42 = 2114;
          id v43 = v32;
          _os_log_impl(&dword_1D7C04000, v28, OS_LOG_TYPE_DEFAULT, "%{public}@ migrate thread %{public}@ from %{public}@ to %{public}@.", buf, 0x2Au);
        }
        uint64_t v8 = 1;
        goto LABEL_15;
      }
      if (!v24) {
        goto LABEL_11;
      }
      uint64_t v25 = *(void **)(a1 + 32);
      BOOL v10 = v23;
      BOOL v11 = [v25 logDescription];
      __int16 v13 = [v3 logDescription];
      id v14 = NCNotificationListSectionTypeString([*(id *)(a1 + 48) sectionType]);
      id v26 = NCNotificationListSectionTypeString([*(id *)(a1 + 56) sectionType]);
      *(_DWORD *)buf = 138544130;
      id v37 = v11;
      __int16 v38 = 2114;
      id v39 = v13;
      __int16 v40 = 2114;
      long long v41 = v14;
      __int16 v42 = 2114;
      id v43 = v26;
      _os_log_impl(&dword_1D7C04000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ found persistent notification in thread %{public}@; skip migration from %{public}@ to %{public}@.",
        buf,
        0x2Au);
    }
LABEL_11:
    uint64_t v8 = 0;
    goto LABEL_15;
  }
  BOOL v17 = (void *)*MEMORY[0x1E4FB3778];
  uint64_t v8 = 0;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
  {
    id v18 = *(void **)(a1 + 32);
    id v19 = v17;
    id v20 = [v18 logDescription];
    id v21 = [v3 logDescription];
    *(_DWORD *)buf = 138543618;
    id v37 = v20;
    __int16 v38 = 2114;
    id v39 = v21;
    _os_log_impl(&dword_1D7C04000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ thread %{public}@ is not eligible for stack elevation migration; skip group migration from incoming to history.",
      buf,
      0x16u);

    uint64_t v8 = 0;
  }
LABEL_16:

  return v8;
}

uint64_t __137__NCNotificationRootList__migrateOnScheduleNotificationRequests_fromSection_toSection_clearRequests_filterForDestination_animateRemoval___block_invoke_151(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) matchesRequest:a2];
}

uint64_t __137__NCNotificationRootList__migrateOnScheduleNotificationRequests_fromSection_toSection_clearRequests_filterForDestination_animateRemoval___block_invoke_152(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = [*(id *)(a1 + 32) _isEligibleForStackElevationMigrationWithGroupList:v3 areGenerativeModelsAvailable:*(unsigned __int8 *)(a1 + 40)];
  id v5 = (void *)*MEMORY[0x1E4FB3778];
  BOOL v6 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      uint64_t v7 = *(void **)(a1 + 32);
      uint64_t v8 = v5;
      id v9 = [v7 logDescription];
      BOOL v10 = [v3 logDescription];
      int v14 = 138543618;
      id v15 = v9;
      __int16 v16 = 2114;
      BOOL v17 = v10;
      BOOL v11 = "%{public}@ thread %{public}@ eligible for stack elevation migration; skip migrating individually from incoming to history";
LABEL_6:
      _os_log_impl(&dword_1D7C04000, v8, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v14, 0x16u);
    }
  }
  else if (v6)
  {
    id v12 = *(void **)(a1 + 32);
    uint64_t v8 = v5;
    id v9 = [v12 logDescription];
    BOOL v10 = [v3 logDescription];
    int v14 = 138543618;
    id v15 = v9;
    __int16 v16 = 2114;
    BOOL v17 = v10;
    BOOL v11 = "%{public}@ thread %{public}@ is not eligible for stack elevation migration; migrate individually from incoming to history.";
    goto LABEL_6;
  }

  return v4 ^ 1u;
}

BOOL __137__NCNotificationRootList__migrateOnScheduleNotificationRequests_fromSection_toSection_clearRequests_filterForDestination_animateRemoval___block_invoke_153(uint64_t a1, void *a2)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = *(void **)(a1 + 32);
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __137__NCNotificationRootList__migrateOnScheduleNotificationRequests_fromSection_toSection_clearRequests_filterForDestination_animateRemoval___block_invoke_2;
  v28[3] = &unk_1E6A92790;
  id v5 = v3;
  id v29 = v5;
  uint64_t v6 = [v4 indexOfObjectPassingTest:v28];
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v8 = [*(id *)(a1 + 32) objectAtIndexedSubscript:v6];
    id v9 = [v8 options];
    uint64_t v10 = [v9 lockScreenPersistence];
    BOOL v7 = v10 != 0;

    BOOL v11 = (void *)*MEMORY[0x1E4FB3778];
    BOOL v12 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT);
    if (v10)
    {
      if (v12)
      {
        __int16 v13 = *(void **)(a1 + 40);
        log = v11;
        int v14 = [v13 logDescription];
        id v15 = [v8 notificationIdentifier];
        __int16 v16 = objc_msgSend(v15, "un_logDigest");
        BOOL v17 = [v8 options];
        uint64_t v18 = [v17 lockScreenPersistence];
        id v19 = NCNotificationListSectionTypeString([*(id *)(a1 + 48) sectionType]);
        id v20 = NCNotificationListSectionTypeString([*(id *)(a1 + 56) sectionType]);
        *(_DWORD *)buf = 138544386;
        id v31 = v14;
        __int16 v32 = 2114;
        id v33 = v16;
        __int16 v34 = 2048;
        uint64_t v35 = v18;
        __int16 v36 = 2114;
        id v37 = v19;
        __int16 v38 = 2114;
        id v39 = v20;
        id v21 = log;
        _os_log_impl(&dword_1D7C04000, log, OS_LOG_TYPE_DEFAULT, "%{public}@ found the request %{public}@, but it's lock screen persistence %lu; Skip migration from %{public}@ to %{public}@.",
          buf,
          0x34u);

LABEL_8:
      }
    }
    else if (v12)
    {
      int v22 = *(void **)(a1 + 40);
      id v21 = v11;
      int v14 = [v22 logDescription];
      id v23 = [v8 notificationIdentifier];
      __int16 v16 = objc_msgSend(v23, "un_logDigest");
      BOOL v24 = NCNotificationListSectionTypeString([*(id *)(a1 + 48) sectionType]);
      uint64_t v25 = NCNotificationListSectionTypeString([*(id *)(a1 + 56) sectionType]);
      *(_DWORD *)buf = 138544130;
      id v31 = v14;
      __int16 v32 = 2114;
      id v33 = v16;
      __int16 v34 = 2114;
      uint64_t v35 = (uint64_t)v24;
      __int16 v36 = 2114;
      id v37 = v25;
      _os_log_impl(&dword_1D7C04000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@ migrate request %{public}@ from %{public}@ to %{public}@.", buf, 0x2Au);

      goto LABEL_8;
    }

    goto LABEL_10;
  }
  BOOL v7 = 1;
LABEL_10:

  return v7;
}

uint64_t __137__NCNotificationRootList__migrateOnScheduleNotificationRequests_fromSection_toSection_clearRequests_filterForDestination_animateRemoval___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 matchesRequest:*(void *)(a1 + 32)];
}

BOOL __137__NCNotificationRootList__migrateOnScheduleNotificationRequests_fromSection_toSection_clearRequests_filterForDestination_animateRemoval___block_invoke_154(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __137__NCNotificationRootList__migrateOnScheduleNotificationRequests_fromSection_toSection_clearRequests_filterForDestination_animateRemoval___block_invoke_2_155;
  v8[3] = &unk_1E6A92790;
  id v9 = v3;
  id v5 = v3;
  BOOL v6 = [v4 indexOfObjectPassingTest:v8] != 0x7FFFFFFFFFFFFFFFLL;

  return v6;
}

uint64_t __137__NCNotificationRootList__migrateOnScheduleNotificationRequests_fromSection_toSection_clearRequests_filterForDestination_animateRemoval___block_invoke_2_155(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = [*(id *)(a1 + 32) sectionIdentifier];
  id v5 = [v3 sectionIdentifier];
  if ([v4 isEqualToString:v5])
  {
    BOOL v6 = [*(id *)(a1 + 32) threadIdentifier];
    BOOL v7 = [v3 threadIdentifier];
    uint64_t v8 = [v6 isEqualToString:v7];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

BOOL __137__NCNotificationRootList__migrateOnScheduleNotificationRequests_fromSection_toSection_clearRequests_filterForDestination_animateRemoval___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = *(void **)(a1 + 32);
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __137__NCNotificationRootList__migrateOnScheduleNotificationRequests_fromSection_toSection_clearRequests_filterForDestination_animateRemoval___block_invoke_4;
  v28[3] = &unk_1E6A92790;
  id v5 = v3;
  id v29 = v5;
  uint64_t v6 = [v4 indexOfObjectPassingTest:v28];
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v8 = [*(id *)(a1 + 32) objectAtIndexedSubscript:v6];
    id v9 = [v8 options];
    uint64_t v10 = [v9 lockScreenPersistence];
    BOOL v7 = v10 != 0;

    BOOL v11 = (void *)*MEMORY[0x1E4FB3778];
    BOOL v12 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT);
    if (v10)
    {
      if (v12)
      {
        __int16 v13 = *(void **)(a1 + 40);
        log = v11;
        int v14 = [v13 logDescription];
        id v15 = [v8 notificationIdentifier];
        __int16 v16 = objc_msgSend(v15, "un_logDigest");
        BOOL v17 = [v8 options];
        uint64_t v18 = [v17 lockScreenPersistence];
        id v19 = NCNotificationListSectionTypeString([*(id *)(a1 + 48) sectionType]);
        id v20 = NCNotificationListSectionTypeString([*(id *)(a1 + 56) sectionType]);
        *(_DWORD *)buf = 138544386;
        id v31 = v14;
        __int16 v32 = 2114;
        id v33 = v16;
        __int16 v34 = 2048;
        uint64_t v35 = v18;
        __int16 v36 = 2114;
        id v37 = v19;
        __int16 v38 = 2114;
        id v39 = v20;
        id v21 = log;
        _os_log_impl(&dword_1D7C04000, log, OS_LOG_TYPE_DEFAULT, "%{public}@ found the request %{public}@, but it's lock screen persistence %lu; Skip migration from %{public}@ to %{public}@.",
          buf,
          0x34u);

LABEL_8:
      }
    }
    else if (v12)
    {
      int v22 = *(void **)(a1 + 40);
      id v21 = v11;
      int v14 = [v22 logDescription];
      id v23 = [v8 notificationIdentifier];
      __int16 v16 = objc_msgSend(v23, "un_logDigest");
      BOOL v24 = NCNotificationListSectionTypeString([*(id *)(a1 + 48) sectionType]);
      uint64_t v25 = NCNotificationListSectionTypeString([*(id *)(a1 + 56) sectionType]);
      *(_DWORD *)buf = 138544130;
      id v31 = v14;
      __int16 v32 = 2114;
      id v33 = v16;
      __int16 v34 = 2114;
      uint64_t v35 = (uint64_t)v24;
      __int16 v36 = 2114;
      id v37 = v25;
      _os_log_impl(&dword_1D7C04000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@ migrate request %{public}@ from %{public}@ to %{public}@.", buf, 0x2Au);

      goto LABEL_8;
    }

    goto LABEL_10;
  }
  BOOL v7 = 1;
LABEL_10:

  return v7;
}

uint64_t __137__NCNotificationRootList__migrateOnScheduleNotificationRequests_fromSection_toSection_clearRequests_filterForDestination_animateRemoval___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 matchesRequest:*(void *)(a1 + 32)];
}

- (void)_elevateGroupInOtherSectionsIfNeededWithRequest:(id)a3 toSection:(id)a4
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([(NCNotificationRootList *)self _isRequestEligibleForStackElevation:v6])
  {
    uint64_t v8 = [v6 content];
    char v9 = [v8 isCommunicationType];

    if (v9)
    {
      uint64_t v10 = NCStackElevationPriorityForSectionTypeString();
      BOOL v11 = NCNotificationListSectionTypeString([v7 sectionType]);
      uint64_t v12 = [v10 indexOfObject:v11];

      if (v12 == 0x7FFFFFFFFFFFFFFFLL)
      {
        __int16 v13 = (void *)*MEMORY[0x1E4FB3778];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
        {
          int v14 = v13;
          id v15 = [(NCNotificationRootList *)self logDescription];
          __int16 v16 = [v6 notificationIdentifier];
          BOOL v17 = objc_msgSend(v16, "un_logDigest");
          uint64_t v18 = NCNotificationListSectionTypeString([v7 sectionType]);
          *(_DWORD *)buf = 138543874;
          __int16 v42 = v15;
          __int16 v43 = 2114;
          __int16 v44 = v17;
          __int16 v45 = 2114;
          uint64_t v46 = v18;
          id v19 = "%{public}@ Skip elevate same groups in other section with request %{public}@ in section %{public}@; it's"
                " not in allow list";
LABEL_10:
          _os_log_impl(&dword_1D7C04000, v14, OS_LOG_TYPE_DEFAULT, v19, buf, 0x20u);
LABEL_11:

          goto LABEL_12;
        }
      }
      else
      {
        uint64_t v23 = [v7 existingIndexOfGroupForNotificationRequestForInsertion:v6];
        if (v23 == 0x7FFFFFFFFFFFFFFFLL)
        {
          BOOL v24 = (void *)*MEMORY[0x1E4FB3778];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_ERROR)) {
            goto LABEL_13;
          }
          int v14 = v24;
          id v15 = [(NCNotificationRootList *)self logDescription];
          __int16 v16 = [v6 notificationIdentifier];
          BOOL v17 = objc_msgSend(v16, "un_logDigest");
          uint64_t v18 = NCNotificationListSectionTypeString([v7 sectionType]);
          *(_DWORD *)buf = 138543874;
          __int16 v42 = v15;
          __int16 v43 = 2114;
          __int16 v44 = v17;
          __int16 v45 = 2114;
          uint64_t v46 = v18;
          _os_log_error_impl(&dword_1D7C04000, v14, OS_LOG_TYPE_ERROR, "%{public}@ No group found with request %{public}@ in section %{public}@", buf, 0x20u);
          goto LABEL_11;
        }
        uint64_t v25 = v23;
        id v26 = [v7 allNotificationGroups];
        id v27 = [v26 objectAtIndex:v25];

        id v28 = (void *)*MEMORY[0x1E4FB3778];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
        {
          log = v28;
          uint64_t v35 = [(NCNotificationRootList *)self logDescription];
          id v29 = [v27 logDescription];
          id v30 = [v6 notificationIdentifier];
          id v31 = objc_msgSend(v30, "un_logDigest");
          __int16 v32 = NCNotificationListSectionTypeString([v7 sectionType]);
          *(_DWORD *)buf = 138544130;
          __int16 v42 = v35;
          __int16 v43 = 2114;
          __int16 v44 = v29;
          __int16 v45 = 2114;
          uint64_t v46 = v31;
          __int16 v47 = 2114;
          __int16 v48 = v32;
          _os_log_impl(&dword_1D7C04000, log, OS_LOG_TYPE_DEFAULT, "%{public}@ Elevating same group %{public}@ in other sections with request %{public}@ in section %{public}@", buf, 0x2Au);
        }
        id v33 = NCStackElevationPriorityForSectionTypeString();
        v37[0] = MEMORY[0x1E4F143A8];
        v37[1] = 3221225472;
        v37[2] = __84__NCNotificationRootList__elevateGroupInOtherSectionsIfNeededWithRequest_toSection___block_invoke;
        v37[3] = &unk_1E6A92A88;
        uint64_t v40 = v12;
        v37[4] = self;
        id v38 = v7;
        id v39 = v27;
        id v34 = v27;
        [v33 enumerateObjectsUsingBlock:v37];
      }
    }
    else
    {
      int v22 = (void *)*MEMORY[0x1E4FB3778];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
      {
        int v14 = v22;
        id v15 = [(NCNotificationRootList *)self logDescription];
        __int16 v16 = [v6 notificationIdentifier];
        BOOL v17 = objc_msgSend(v16, "un_logDigest");
        uint64_t v18 = NCNotificationListSectionTypeString([v7 sectionType]);
        *(_DWORD *)buf = 138543874;
        __int16 v42 = v15;
        __int16 v43 = 2114;
        __int16 v44 = v17;
        __int16 v45 = 2114;
        uint64_t v46 = v18;
        id v19 = "%{public}@ Skip elevate same groups in other section with request %{public}@ in section %{public}@; it's n"
              "ot communication request";
        goto LABEL_10;
      }
    }
  }
  else
  {
    id v20 = (void *)*MEMORY[0x1E4FB3778];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
    {
      int v14 = v20;
      id v15 = [(NCNotificationRootList *)self logDescription];
      id v21 = [v6 notificationIdentifier];
      BOOL v17 = objc_msgSend(v21, "un_logDigest");
      *(_DWORD *)buf = 138543618;
      __int16 v42 = v15;
      __int16 v43 = 2114;
      __int16 v44 = v17;
      _os_log_impl(&dword_1D7C04000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ Skip elevate same groups in other section with request %{public}@; stack elevation not eligible",
        buf,
        0x16u);

LABEL_12:
    }
  }
LABEL_13:
}

void __84__NCNotificationRootList__elevateGroupInOtherSectionsIfNeededWithRequest_toSection___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = v5;
  if (*(void *)(a1 + 56) >= a3)
  {
    char v9 = (void *)*MEMORY[0x1E4FB3778];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_13;
    }
    uint64_t v10 = *(void **)(a1 + 32);
    BOOL v11 = v9;
    uint64_t v12 = [v10 logDescription];
    __int16 v13 = NCNotificationListSectionTypeString([*(id *)(a1 + 40) sectionType]);
    *(_DWORD *)buf = 138543874;
    id v30 = v12;
    __int16 v31 = 2114;
    __int16 v32 = v6;
    __int16 v33 = 2114;
    id v34 = v13;
    int v14 = "%{public}@ Section %{public}@ has higher or same priority than toSection %{public}@; Stop migrating to toSection.";
    id v15 = v11;
    uint32_t v16 = 32;
    goto LABEL_7;
  }
  uint64_t v7 = NCNotificationListSectionTypeFromString(v5);
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    BOOL v11 = [*(id *)(a1 + 32) _sectionOfSectionType:v7];
    if (v11)
    {
      BOOL v17 = *(void **)(a1 + 32);
      uint64_t v18 = *(void *)(a1 + 40);
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __84__NCNotificationRootList__elevateGroupInOtherSectionsIfNeededWithRequest_toSection___block_invoke_156;
      v24[3] = &unk_1E6A92A60;
      id v19 = *(id *)(a1 + 48);
      uint64_t v20 = *(void *)(a1 + 32);
      id v25 = v19;
      uint64_t v26 = v20;
      id v27 = v11;
      id v28 = *(id *)(a1 + 40);
      BYTE2(v23) = 1;
      LOWORD(v23) = 0;
      objc_msgSend(v17, "_migrateNotificationsFromList:toList:passingTest:filterRequestsPassingTest:hideToList:clearRequests:filterForDestination:animateRemoval:reorderGroupNotifications:", v27, v18, v24, 0, 0, 0, v23);

      goto LABEL_12;
    }
    id v21 = (void *)*MEMORY[0x1E4FB3778];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    int v22 = *(void **)(a1 + 32);
    uint64_t v12 = v21;
    __int16 v13 = [v22 logDescription];
    *(_DWORD *)buf = 138543618;
    id v30 = v13;
    __int16 v31 = 2114;
    __int16 v32 = v6;
    int v14 = "%{public}@ fromSection %{public}@ not exist; Skip migrating.";
    id v15 = v12;
    uint32_t v16 = 22;
LABEL_7:
    _os_log_impl(&dword_1D7C04000, v15, OS_LOG_TYPE_DEFAULT, v14, buf, v16);

LABEL_12:
    goto LABEL_13;
  }
  uint64_t v8 = (void *)*MEMORY[0x1E4FB3778];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_FAULT)) {
    __91__NCNotificationRootList__higherSectionToElevateForNotificationRequest_currentSectionType___block_invoke_cold_1(a1, v8);
  }
LABEL_13:
}

uint64_t __84__NCNotificationRootList__elevateGroupInOtherSectionsIfNeededWithRequest_toSection___block_invoke_156(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) matchesGroup:v3];
  if (v4)
  {
    id v5 = (void *)*MEMORY[0x1E4FB3778];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
    {
      id v6 = *(void **)(a1 + 40);
      uint64_t v7 = v5;
      uint64_t v8 = [v6 logDescription];
      char v9 = [v3 logDescription];
      uint64_t v10 = NCNotificationListSectionTypeString([*(id *)(a1 + 48) sectionType]);
      BOOL v11 = NCNotificationListSectionTypeString([*(id *)(a1 + 56) sectionType]);
      int v13 = 138544130;
      int v14 = v8;
      __int16 v15 = 2114;
      uint32_t v16 = v9;
      __int16 v17 = 2114;
      uint64_t v18 = v10;
      __int16 v19 = 2114;
      uint64_t v20 = v11;
      _os_log_impl(&dword_1D7C04000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Found same group %{public}@ in %{public}@, elevate to %{public}@", (uint8_t *)&v13, 0x2Au);
    }
  }

  return v4;
}

- (id)_sectionOfSectionType:(unint64_t)a3
{
  if (a3 <= 0xB && ((0xC7Fu >> a3) & 1) != 0)
  {
    id v4 = *(id *)((char *)&self->super.isa + qword_1D7D95A38[a3]);
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (void)_updateNotificationListPersistentState
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)*MEMORY[0x1E4FB3778];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
  {
    id v4 = v3;
    id v5 = [(NCNotificationRootList *)self logDescription];
    int v10 = 138543362;
    BOOL v11 = v5;
    _os_log_impl(&dword_1D7C04000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Updating Notification List Persistent State", (uint8_t *)&v10, 0xCu);
  }
  id v6 = [(NCNotificationRootList *)self _sectionListsForPersistentState];
  uint64_t v7 = [(NCNotificationRootList *)self persistentStateManager];
  migrationScheduler = self->_migrationScheduler;
  char v9 = [(NCNotificationRootList *)self _listInfoForPersistentState];
  [v7 updatePersistentStateForNotificationList:self sectionLists:v6 listCache:0 migrationScheduler:migrationScheduler listInfo:v9 detailed:0];
}

- (id)_listInfoForPersistentState
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if (self->_currentDigestSectionList
    || [(NCNotificationRootList *)self deferCurrentDigestPresentationForPersistedDataLoad])
  {
    upcomingMissedSectionList = self->_upcomingMissedSectionList;
    if (upcomingMissedSectionList
      && [(NCNotificationCombinedSectionList *)upcomingMissedSectionList containsSectionList:self->_currentDigestSectionList])
    {
      BOOL v5 = 1;
    }
    else if ([(NCNotificationRootList *)self deferCurrentDigestPresentationForPersistedDataLoad])
    {
      BOOL v5 = [(NCNotificationRootList *)self _isPersistentStateCurrentDigestInMissedSection];
    }
    else
    {
      BOOL v5 = 0;
    }
    id v6 = [NSNumber numberWithBool:v5];
    [v3 setObject:v6 forKey:@"isCurrentDigestInMissedSection"];
  }
  if ([v3 count]) {
    uint64_t v7 = v3;
  }
  else {
    uint64_t v7 = 0;
  }
  id v8 = v7;

  return v8;
}

- (BOOL)_isPersistentStateCurrentDigestInMissedSection
{
  persistentStoredListInfo = self->_persistentStoredListInfo;
  if (persistentStoredListInfo)
  {
    id v3 = [(NSDictionary *)persistentStoredListInfo objectForKey:@"isCurrentDigestInMissedSection"];
    char v4 = [v3 BOOLValue];

    LOBYTE(persistentStoredListInfo) = v4;
  }
  return (char)persistentStoredListInfo;
}

- (id)_sectionListsForPersistentState
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  char v4 = v3;
  if (self->_criticalSectionList) {
    objc_msgSend(v3, "addObject:");
  }
  if (self->_highlightedSectionList) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_prominentIncomingSectionList) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_incomingSectionList) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_currentDigestSectionList) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_upcomingDigestSectionList) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_upcomingMissedSectionList) {
    objc_msgSend(v4, "addObject:");
  }

  return v4;
}

- (id)_sectionForStoredNotificationRequestOfSectionType:(unint64_t)a3
{
  char v4 = 0;
  switch(a3)
  {
    case 1uLL:
      if (_NCReactiveListUI())
      {
        p_prominentIncomingSectionList = (NCNotificationSummarizedSectionList **)&self->_prominentIncomingSectionList;
      }
      else
      {
        int64_t v12 = [(NCNotificationRootList *)self currentListDisplayStyleSetting];
        uint64_t v13 = 160;
        if (v12 == 2) {
          uint64_t v13 = 152;
        }
        p_prominentIncomingSectionList = (NCNotificationSummarizedSectionList **)((char *)self + v13);
      }
      goto LABEL_20;
    case 2uLL:
      p_prominentIncomingSectionList = (NCNotificationSummarizedSectionList **)&self->_incomingSectionList;
      goto LABEL_20;
    case 3uLL:
      p_prominentIncomingSectionList = &self->_upcomingMissedSectionList;
      goto LABEL_20;
    case 4uLL:
    case 6uLL:
      p_prominentIncomingSectionList = &self->_currentDigestSectionList;
      currentDigestSectionList = self->_currentDigestSectionList;
      if (currentDigestSectionList) {
        goto LABEL_21;
      }
      id v8 = [(NCDigestScheduleManager *)self->_digestScheduleManager previouslyScheduledDigestInfo];
      BOOL v9 = [(NCNotificationRootList *)self _isPersistentStateCurrentDigestInMissedSection];
      if (a3 == 6 || v9) {
        uint64_t v11 = 2;
      }
      else {
        uint64_t v11 = 1;
      }
      [(NCNotificationRootList *)self _configureCurrentDigestSectionListWithDigestInfo:v8 sectionType:a3 summaryOrderProviderType:v11];

LABEL_20:
      currentDigestSectionList = *p_prominentIncomingSectionList;
LABEL_21:
      char v4 = currentDigestSectionList;
LABEL_22:
      return v4;
    case 5uLL:
      p_prominentIncomingSectionList = &self->_upcomingDigestSectionList;
      goto LABEL_20;
    case 0xAuLL:
      p_prominentIncomingSectionList = (NCNotificationSummarizedSectionList **)&self->_highlightedSectionList;
      goto LABEL_20;
    case 0xBuLL:
      p_prominentIncomingSectionList = (NCNotificationSummarizedSectionList **)&self->_criticalSectionList;
      goto LABEL_20;
    default:
      goto LABEL_22;
  }
}

- (void)_insertSectionListInHistorySectionList:(id)a3 atIndex:(unint64_t)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (![(NCNotificationCombinedSectionList *)self->_historySectionList containsSectionList:v8])
  {
    BOOL v9 = (void *)*MEMORY[0x1E4FB3778];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
    {
      int v10 = v9;
      uint64_t v11 = [(NCNotificationRootList *)self logDescription];
      int64_t v12 = [v8 logDescription];
      uint64_t v13 = [(NCNotificationStructuredSectionList *)self->_historySectionList logDescription];
      int v14 = 138543874;
      __int16 v15 = v11;
      __int16 v16 = 2114;
      __int16 v17 = v12;
      __int16 v18 = 2114;
      __int16 v19 = v13;
      _os_log_impl(&dword_1D7C04000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ inserting %{public}@ to %{public}@", (uint8_t *)&v14, 0x20u);
    }
    [(NCNotificationCombinedSectionList *)self->_historySectionList insertNotificationSectionList:v8 atIndex:a4 animated:v5];
    objc_msgSend(v8, "setDeviceAuthenticated:", -[NCNotificationRootList deviceAuthenticated](self, "deviceAuthenticated"));
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v8 collapseSummarizedSectionList];
    }
  }
}

- (void)_removeSectionListInHistorySectionList:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([(NCNotificationCombinedSectionList *)self->_historySectionList containsSectionList:v6])
  {
    uint64_t v7 = (void *)*MEMORY[0x1E4FB3778];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
    {
      id v8 = v7;
      BOOL v9 = [(NCNotificationRootList *)self logDescription];
      int v10 = [v6 logDescription];
      uint64_t v11 = [(NCNotificationStructuredSectionList *)self->_historySectionList logDescription];
      int v12 = 138543874;
      uint64_t v13 = v9;
      __int16 v14 = 2114;
      __int16 v15 = v10;
      __int16 v16 = 2114;
      __int16 v17 = v11;
      _os_log_impl(&dword_1D7C04000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ removing %{public}@ from %{public}@", (uint8_t *)&v12, 0x20u);
    }
    [(NCNotificationCombinedSectionList *)self->_historySectionList removeNotificationSectionList:v6 animated:v4];
  }
}

- (void)_toggleVisibilityInHistorySectionListForSectionList:(id)a3 atIndex:(unint64_t)a4 isSectionHidden:(BOOL)a5 animated:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v10 = a3;
  if (v10)
  {
    uint64_t v13 = v10;
    if (!-[NCNotificationCombinedSectionList containsSectionList:](self->_historySectionList, "containsSectionList:", v10)&& [v13 notificationCount]&& !v7)
    {
      [(NCNotificationRootList *)self _insertSectionListInHistorySectionList:v13 atIndex:a4 animated:v6];
      goto LABEL_10;
    }
    BOOL v11 = [(NCNotificationCombinedSectionList *)self->_historySectionList containsSectionList:v13];
    id v10 = v13;
    if (v11)
    {
      uint64_t v12 = [v13 notificationCount];
      id v10 = v13;
      if (!v12 || v7)
      {
        [(NCNotificationRootList *)self _removeSectionListInHistorySectionList:v13 animated:v6];
LABEL_10:
        id v10 = v13;
      }
    }
  }
}

- (void)_updateVisibilityForSectionLists
{
  [(NCNotificationRootList *)self _toggleUpcomingDigestSectionListVisibility];
  [(NCNotificationRootList *)self _toggleUpcomingMissedSectionListVisibility];
  [(NCNotificationRootList *)self _toggleCurrentDigestSectionListVisibility];
  [(NCNotificationRootList *)self _toggleCurrentDigestSectionListVisibilityInHistorySection];

  [(NCNotificationRootList *)self _updateRevealCoordinator];
}

- (id)_newMissedSectionWithTitle:(id)a3 summaryHeading:(id)a4 logDescription:(id)a5 dndMode:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  __int16 v14 = [(NCNotificationCombinedSectionList *)[NCNotificationSummarizedSectionList alloc] initWithTitle:v13 sectionType:3];

  id v15 = [(NCNotificationRootList *)self _newSummaryOrderProviderOfType:0 summaryHeading:v12 summaryDate:0 atxDigestDeliveryTime:2 isOnboardingSummary:0];
  [v15 setDndMode:v10];

  __int16 v16 = [(NCNotificationRootList *)self notificationListCache];
  [(NCNotificationRootList *)self _configureNotificationSectionList:v14 notificationCache:v16 notificationListViewRevealed:[(NCNotificationRootList *)self isNotificationHistoryRevealed] logDescription:v11];

  [(NCNotificationSummarizedSectionList *)v14 setSummaryOrderProvider:v15];
  [(NCNotificationStructuredSectionList *)v14 setSectionListDestination:@"BulletinDestinationLockScreen"];
  __int16 v17 = [(NCNotificationStructuredSectionList *)v14 listView];
  [v17 setGrouped:1];

  return v14;
}

- (void)_configureUpcomingMissedSectionForDNDMode:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!self->_upcomingMissedSectionList)
  {
    BOOL v5 = [(NCNotificationRootList *)self _missedSectionTitleForDNDMode:v4];
    BOOL v6 = [(NCNotificationRootList *)self _newMissedSectionWithTitle:v5 summaryHeading:v5 logDescription:@"Upcoming Missed Section" dndMode:v4];
    upcomingMissedSectionList = self->_upcomingMissedSectionList;
    self->_upcomingMissedSectionList = v6;

    id v8 = (void *)*MEMORY[0x1E4FB3778];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
    {
      BOOL v9 = v8;
      id v10 = [(NCNotificationRootList *)self logDescription];
      id v11 = [(NCNotificationStructuredSectionList *)self->_upcomingMissedSectionList logDescription];
      id v12 = [v4 modeIdentifier];
      int v13 = 138544130;
      __int16 v14 = v10;
      __int16 v15 = 2114;
      __int16 v16 = v11;
      __int16 v17 = 2112;
      uint64_t v18 = v5;
      __int16 v19 = 2114;
      uint64_t v20 = v12;
      _os_log_impl(&dword_1D7C04000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ configured new %{public}@ with title \"%@\" for mode %{public}@", (uint8_t *)&v13, 0x2Au);
    }
  }
}

- (id)_missedSectionTitleForDNDMode:(id)a3
{
  id v3 = a3;
  id v4 = NCUserNotificationsUIKitFrameworkBundle();
  BOOL v5 = [v4 localizedStringForKey:@"NOTIFICATION_LIST_MISSED_SECTION_HEADER_DO_NOT_DISTURB" value:&stru_1F2F516F8 table:0];

  switch([v3 semanticType])
  {
    case 0:
      BOOL v6 = NCUserNotificationsUIKitFrameworkBundle();
      BOOL v7 = v6;
      id v8 = @"NOTIFICATION_LIST_MISSED_SECTION_HEADER_DO_NOT_DISTURB";
      goto LABEL_12;
    case 1:
      BOOL v6 = NCUserNotificationsUIKitFrameworkBundle();
      BOOL v7 = v6;
      id v8 = @"NOTIFICATION_LIST_MISSED_SECTION_HEADER_SLEEP";
      goto LABEL_12;
    case 2:
      BOOL v6 = NCUserNotificationsUIKitFrameworkBundle();
      BOOL v7 = v6;
      id v8 = @"NOTIFICATION_LIST_MISSED_SECTION_HEADER_DRIVING";
      goto LABEL_12;
    case 3:
      BOOL v6 = NCUserNotificationsUIKitFrameworkBundle();
      BOOL v7 = v6;
      id v8 = @"NOTIFICATION_LIST_MISSED_SECTION_HEADER_FITNESS";
      goto LABEL_12;
    case 4:
      BOOL v6 = NCUserNotificationsUIKitFrameworkBundle();
      BOOL v7 = v6;
      id v8 = @"NOTIFICATION_LIST_MISSED_SECTION_HEADER_WORK";
      goto LABEL_12;
    case 5:
      BOOL v6 = NCUserNotificationsUIKitFrameworkBundle();
      BOOL v7 = v6;
      id v8 = @"NOTIFICATION_LIST_MISSED_SECTION_HEADER_PERSONAL";
      goto LABEL_12;
    case 6:
      BOOL v6 = NCUserNotificationsUIKitFrameworkBundle();
      BOOL v7 = v6;
      id v8 = @"NOTIFICATION_LIST_MISSED_SECTION_HEADER_READING";
      goto LABEL_12;
    case 7:
      BOOL v6 = NCUserNotificationsUIKitFrameworkBundle();
      BOOL v7 = v6;
      id v8 = @"NOTIFICATION_LIST_MISSED_SECTION_HEADER_GAMING";
      goto LABEL_12;
    case 8:
      BOOL v6 = NCUserNotificationsUIKitFrameworkBundle();
      BOOL v7 = v6;
      id v8 = @"NOTIFICATION_LIST_MISSED_SECTION_HEADER_MINDFULNESS";
LABEL_12:
      id v12 = [v6 localizedStringForKey:v8 value:&stru_1F2F516F8 table:0];
      break;
    default:
      BOOL v9 = NSString;
      BOOL v7 = NCUserNotificationsUIKitFrameworkBundle();
      uint64_t v10 = [v7 localizedStringForKey:@"NOTIFICATION_LIST_MISSED_SECTION_HEADER_GENERAL" value:&stru_1F2F516F8 table:0];
      id v11 = [v3 name];
      id v12 = objc_msgSend(v9, "stringWithFormat:", v10, v11);

      BOOL v5 = (void *)v10;
      break;
  }

  return v12;
}

- (void)_migrateUpcomingMissedSectionToIncoming
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (self->_upcomingMissedSectionList)
  {
    id v3 = (void *)*MEMORY[0x1E4FB3778];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
    {
      id v4 = v3;
      BOOL v5 = [(NCNotificationRootList *)self logDescription];
      BOOL v6 = [(NCNotificationStructuredSectionList *)self->_upcomingMissedSectionList logDescription];
      BOOL v7 = [(NCNotificationStructuredSectionList *)self->_incomingSectionList logDescription];
      *(_DWORD *)buf = 138543874;
      uint64_t v18 = v5;
      __int16 v19 = 2114;
      uint64_t v20 = v6;
      __int16 v21 = 2114;
      int v22 = v7;
      _os_log_impl(&dword_1D7C04000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ migrating all notifications from %{public}@ to %{public}@", buf, 0x20u);
    }
    id v8 = +[NCNotificationEventTracker sharedInstance];
    BOOL v9 = [(NCNotificationSummarizedSectionList *)self->_upcomingMissedSectionList atxUUID];
    [v8 missedBundleExpired:v9];

    uint64_t v10 = [(NCNotificationSummarizedSectionList *)self->_upcomingMissedSectionList summaryOrderProvider];
    [v10 atxLogSummaryPlatterRemoval];

    upcomingMissedSectionList = self->_upcomingMissedSectionList;
    prominentIncomingSectionList = self->_prominentIncomingSectionList;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __65__NCNotificationRootList__migrateUpcomingMissedSectionToIncoming__block_invoke;
    v16[3] = &unk_1E6A925C8;
    v16[4] = self;
    BYTE2(v14) = 1;
    LOWORD(v14) = 0;
    -[NCNotificationRootList _migrateNotificationsFromList:toList:passingTest:filterRequestsPassingTest:hideToList:clearRequests:filterForDestination:animateRemoval:reorderGroupNotifications:](self, "_migrateNotificationsFromList:toList:passingTest:filterRequestsPassingTest:hideToList:clearRequests:filterForDestination:animateRemoval:reorderGroupNotifications:", upcomingMissedSectionList, prominentIncomingSectionList, 0, v16, 0, 0, v14);
    BYTE2(v15) = 1;
    LOWORD(v15) = 0;
    -[NCNotificationRootList _migrateNotificationsFromList:toList:passingTest:filterRequestsPassingTest:hideToList:clearRequests:filterForDestination:animateRemoval:reorderGroupNotifications:](self, "_migrateNotificationsFromList:toList:passingTest:filterRequestsPassingTest:hideToList:clearRequests:filterForDestination:animateRemoval:reorderGroupNotifications:", self->_upcomingMissedSectionList, self->_incomingSectionList, 0, 0, 0, 0, v15);
    [(NCNotificationRootList *)self _removeSectionListInHistorySectionList:self->_upcomingMissedSectionList animated:[(NCNotificationRootList *)self isNotificationHistoryRevealed]];
    int v13 = self->_upcomingMissedSectionList;
    self->_upcomingMissedSectionList = 0;
  }
}

uint64_t __65__NCNotificationRootList__migrateUpcomingMissedSectionToIncoming__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _isLockScreenPersistenceNotificationRequest:a2] ^ 1;
}

- (void)_toggleUpcomingMissedSectionListVisibility
{
  upcomingMissedSectionList = self->_upcomingMissedSectionList;
  BOOL v4 = [(NCNotificationRootList *)self isNotificationHistoryRevealed];

  [(NCNotificationRootList *)self _toggleVisibilityInHistorySectionListForSectionList:upcomingMissedSectionList atIndex:0 isSectionHidden:0 animated:v4];
}

- (id)_newDigestSectionListWithTitle:(id)a3 sectionType:(unint64_t)a4 summaryOrderProvider:(id)a5 logDescription:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  int v13 = [[NCNotificationSummarizedInlineExpandingSectionList alloc] initWithTitle:v12 sectionType:a4];

  uint64_t v14 = [(NCNotificationRootList *)self notificationSummaryCache];
  [(NCNotificationRootList *)self _configureNotificationSectionList:v13 notificationCache:v14 notificationListViewRevealed:1 logDescription:v10];

  [(NCNotificationSummarizedSectionList *)v13 setSummaryOrderProvider:v11];
  uint64_t v15 = [(NCNotificationStructuredSectionList *)v13 listView];
  [v15 setGrouped:1];

  [(NCNotificationRootList *)self _setRevealed:1 forSection:v13];
  [(NCNotificationStructuredSectionList *)v13 setSectionListDestination:@"BulletinDestinationDigest"];
  return v13;
}

- (id)_newSummaryOrderProviderOfType:(unint64_t)a3 summaryHeading:(id)a4 summaryDate:(id)a5 atxDigestDeliveryTime:(int64_t)a6 isOnboardingSummary:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = a5;
  id v13 = a4;
  uint64_t v14 = +[NCNotificationSummaryOrderProvider notificationSummaryOrderProviderOfType:a3];
  [v14 setOnboardingSummary:v7];
  objc_msgSend(v14, "setDeviceAuthenticated:", -[NCNotificationRootList deviceAuthenticated](self, "deviceAuthenticated"));
  [v14 setSummaryHeading:v13];

  [v14 setSummaryDate:v12];
  [v14 setAtxDigestDeliveryTime:a6];
  return v14;
}

- (id)_newSummaryOrderProviderOfType:(unint64_t)a3 fromSummaryOrderProvider:(id)a4
{
  id v6 = a4;
  BOOL v7 = [v6 summaryHeading];
  id v8 = [v6 summaryDate];
  uint64_t v9 = [v6 atxDigestDeliveryTime];

  id v10 = [(NCNotificationRootList *)self _newSummaryOrderProviderOfType:a3 summaryHeading:v7 summaryDate:v8 atxDigestDeliveryTime:v9 isOnboardingSummary:0];
  return v10;
}

- (int64_t)_atxDigestDeliveryTimeForDeliveryOrder:(int64_t)a3
{
  if (a3) {
    return a3 == 2;
  }
  else {
    return 2;
  }
}

- (void)_configureUpcomingDigestSectionListWithDigestInfo:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_upcomingDigestSectionList)
  {
    BOOL v5 = (void *)*MEMORY[0x1E4FB3778];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_ERROR)) {
      [(NCNotificationRootList *)v5 _configureUpcomingDigestSectionListWithDigestInfo:(id *)&self->_upcomingDigestSectionList];
    }
  }
  else
  {
    id v6 = NCUserNotificationsUIKitFrameworkBundle();
    BOOL v7 = [v6 localizedStringForKey:@"NOTIFICATION_SUMMARY_HEADER_NEXT" value:&stru_1F2F516F8 table:0];
    id v8 = [v4 scheduleDate];
    id v9 = -[NCNotificationRootList _newSummaryOrderProviderOfType:summaryHeading:summaryDate:atxDigestDeliveryTime:isOnboardingSummary:](self, "_newSummaryOrderProviderOfType:summaryHeading:summaryDate:atxDigestDeliveryTime:isOnboardingSummary:", 2, v7, v8, -[NCNotificationRootList _atxDigestDeliveryTimeForDeliveryOrder:](self, "_atxDigestDeliveryTimeForDeliveryOrder:", [v4 deliveryOrder]), 0);

    id v10 = NCUserNotificationsUIKitFrameworkBundle();
    id v11 = [v10 localizedStringForKey:@"NOTIFICATION_SUMMARY_SECTION_TITLE_NEXT" value:&stru_1F2F516F8 table:0];
    id v12 = [(NCNotificationRootList *)self _newDigestSectionListWithTitle:v11 sectionType:5 summaryOrderProvider:v9 logDescription:@"Upcoming Digest"];
    upcomingDigestSectionList = self->_upcomingDigestSectionList;
    self->_upcomingDigestSectionList = v12;

    uint64_t v14 = (void *)*MEMORY[0x1E4FB3778];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = v14;
      __int16 v16 = [(NCNotificationRootList *)self logDescription];
      __int16 v17 = [(NCNotificationStructuredSectionList *)self->_upcomingDigestSectionList logDescription];
      int v18 = 138543874;
      __int16 v19 = v16;
      __int16 v20 = 2114;
      __int16 v21 = v17;
      __int16 v22 = 2114;
      id v23 = v4;
      _os_log_impl(&dword_1D7C04000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ configured new %{public}@ with digest info : %{public}@", (uint8_t *)&v18, 0x20u);
    }
  }
}

- (unint64_t)_upcomingDigestSectionListIndexInHistorySectionList
{
  return [(NCNotificationCombinedSectionList *)self->_historySectionList containsSectionList:self->_upcomingMissedSectionList];
}

- (void)_toggleUpcomingDigestSectionListVisibility
{
  if (self->_upcomingDigestSectionList)
  {
    unint64_t v3 = [(NCNotificationRootList *)self _upcomingDigestSectionListIndexInHistorySectionList];
    upcomingDigestSectionList = self->_upcomingDigestSectionList;
    uint64_t v5 = [(NCNotificationRootList *)self isUpcomingDigestVisible] ^ 1;
    BOOL v6 = [(NCNotificationRootList *)self isNotificationHistoryRevealed];
    [(NCNotificationRootList *)self _toggleVisibilityInHistorySectionListForSectionList:upcomingDigestSectionList atIndex:v3 isSectionHidden:v5 animated:v6];
  }
}

- (void)_updateUpcomingDigestSectionListWithDigestInfo:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(NCNotificationCombinedSectionList *)self->_upcomingDigestSectionList allNotificationRequests];
  BOOL v6 = (void *)[v5 copy];

  [(NCNotificationRootList *)self _removeSectionListInHistorySectionList:self->_upcomingDigestSectionList animated:0];
  upcomingDigestSectionList = self->_upcomingDigestSectionList;
  self->_upcomingDigestSectionList = 0;

  [(NCNotificationRootList *)self _configureUpcomingDigestSectionListWithDigestInfo:v4];
  id v8 = (void *)*MEMORY[0x1E4FB3778];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
  {
    id v9 = v8;
    id v10 = [(NCNotificationRootList *)self logDescription];
    id v11 = [(NCNotificationStructuredSectionList *)self->_upcomingDigestSectionList logDescription];
    *(_DWORD *)buf = 138543874;
    id v23 = v10;
    __int16 v24 = 2114;
    id v25 = v11;
    __int16 v26 = 2114;
    id v27 = v4;
    _os_log_impl(&dword_1D7C04000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ replaced existing with new %{public}@ with digest info : %{public}@", buf, 0x20u);
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v12 = v6;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v18;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(v12);
        }
        -[NCNotificationSummarizedSectionList insertNotificationRequest:](self->_upcomingDigestSectionList, "insertNotificationRequest:", *(void *)(*((void *)&v17 + 1) + 8 * v16++), (void)v17);
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v14);
  }
}

- (void)_dissolveUpcomingDigestSectionListToHistorySection
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (self->_upcomingDigestSectionList)
  {
    unint64_t v3 = (void *)*MEMORY[0x1E4FB3778];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
    {
      id v4 = v3;
      uint64_t v5 = [(NCNotificationRootList *)self logDescription];
      BOOL v6 = [(NCNotificationStructuredSectionList *)self->_upcomingDigestSectionList logDescription];
      BOOL v7 = [(NCNotificationStructuredSectionList *)self->_historySectionList logDescription];
      *(_DWORD *)buf = 138543874;
      id v11 = v5;
      __int16 v12 = 2114;
      uint64_t v13 = v6;
      __int16 v14 = 2114;
      uint64_t v15 = v7;
      _os_log_impl(&dword_1D7C04000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ removing %{public}@ and moving all notifications to %{public}@", buf, 0x20u);
    }
    BYTE2(v9) = 1;
    LOWORD(v9) = 1;
    -[NCNotificationRootList _migrateNotificationsFromList:toList:passingTest:filterRequestsPassingTest:hideToList:clearRequests:filterForDestination:animateRemoval:reorderGroupNotifications:](self, "_migrateNotificationsFromList:toList:passingTest:filterRequestsPassingTest:hideToList:clearRequests:filterForDestination:animateRemoval:reorderGroupNotifications:", self->_upcomingDigestSectionList, self->_historySectionList, 0, 0, 0, 1, v9);
    [(NCNotificationRootList *)self _removeSectionListInHistorySectionList:self->_upcomingDigestSectionList animated:0];
    upcomingDigestSectionList = self->_upcomingDigestSectionList;
    self->_upcomingDigestSectionList = 0;
  }
}

- (void)_configureCurrentDigestSectionListWithDigestInfo:(id)a3 sectionType:(unint64_t)a4 summaryOrderProviderType:(unint64_t)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  uint64_t v9 = v8;
  if (self->_currentDigestSectionList)
  {
    id v10 = (void *)*MEMORY[0x1E4FB3778];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_ERROR)) {
      -[NCNotificationRootList _configureCurrentDigestSectionListWithDigestInfo:sectionType:summaryOrderProviderType:](v10, (uint64_t)self, (id *)&self->_currentDigestSectionList);
    }
  }
  else
  {
    id v11 = [v8 headerString];
    __int16 v12 = [v9 scheduleDate];
    id v13 = -[NCNotificationRootList _newSummaryOrderProviderOfType:summaryHeading:summaryDate:atxDigestDeliveryTime:isOnboardingSummary:](self, "_newSummaryOrderProviderOfType:summaryHeading:summaryDate:atxDigestDeliveryTime:isOnboardingSummary:", a5, v11, v12, -[NCNotificationRootList _atxDigestDeliveryTimeForDeliveryOrder:](self, "_atxDigestDeliveryTimeForDeliveryOrder:", [v9 deliveryOrder]), a4 == 8);

    __int16 v14 = [v9 titleString];
    uint64_t v15 = NCNotificationListSectionTypeString(a4);
    uint64_t v16 = [(NCNotificationRootList *)self _newDigestSectionListWithTitle:v14 sectionType:a4 summaryOrderProvider:v13 logDescription:v15];
    currentDigestSectionList = self->_currentDigestSectionList;
    self->_currentDigestSectionList = v16;

    long long v18 = (void *)*MEMORY[0x1E4FB3778];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
    {
      long long v19 = v18;
      long long v20 = [(NCNotificationRootList *)self logDescription];
      __int16 v21 = [(NCNotificationStructuredSectionList *)self->_currentDigestSectionList logDescription];
      int v22 = 138543874;
      id v23 = v20;
      __int16 v24 = 2114;
      id v25 = v21;
      __int16 v26 = 2114;
      id v27 = v9;
      _os_log_impl(&dword_1D7C04000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ configured new %{public}@ with digest info : %{public}@", (uint8_t *)&v22, 0x20u);
    }
  }
}

- (void)_insertCurrentDigestSectionList
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (self->_currentDigestSectionList)
  {
    unint64_t v3 = (void *)*MEMORY[0x1E4FB3778];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
    {
      id v4 = v3;
      uint64_t v5 = [(NCNotificationRootList *)self logDescription];
      BOOL v6 = [(NCNotificationStructuredSectionList *)self->_currentDigestSectionList logDescription];
      int v16 = 138543618;
      long long v17 = v5;
      __int16 v18 = 2114;
      long long v19 = v6;
      _os_log_impl(&dword_1D7C04000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ inserting %{public}@ to visible section", (uint8_t *)&v16, 0x16u);
    }
    BOOL v7 = [(NCNotificationRootList *)self _notificationListSections];
    BOOL v8 = [(NCNotificationRootList *)self _suppressesCurrentDigestForNotifications];
    uint64_t v9 = [v7 indexOfObject:self->_incomingSectionList];
    id v10 = [(NCNotificationRootList *)self notificationSections];
    uint64_t v11 = [v10 indexOfObject:self->_incomingSectionList];

    [(NCNotificationSummarizedSectionList *)self->_currentDigestSectionList setDeviceAuthenticated:[(NCNotificationRootList *)self deviceAuthenticated]];
    __int16 v12 = [(NCNotificationRootList *)self notificationSections];
    [v12 insertObject:self->_currentDigestSectionList atIndex:v11];

    id v13 = [(NCNotificationRootList *)self rootListView];
    [v13 insertViewAtIndex:v9 animated:1];

    [(NCNotificationRootList *)self _updateIndexForReveal];
    if ([(NCNotificationRootList *)self currentListDisplayStyleSetting] == 2)
    {
      BOOL v14 = !v8 && [(NCNotificationRootList *)self isNotificationHistoryRevealed];
      [(NCNotificationRootList *)self _setRevealed:v14 forSection:self->_currentDigestSectionList];
    }
    [(NCNotificationRootList *)self _updateDelegateAndSubclassIfNecessaryOfContentChange];
    uint64_t v15 = [(NCNotificationRootList *)self currentDigestSectionList];
    [(NCNotificationRootList *)self _notificationSectionsDidAdd:v15];

    if (v8) {
      [(NCNotificationRootList *)self _migrateCurrentDigestSectionListToReadSection];
    }
  }
}

- (void)_removeCurrentDigestSectionList
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (self->_currentDigestSectionList)
  {
    unint64_t v3 = (void *)*MEMORY[0x1E4FB3778];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
    {
      id v4 = v3;
      uint64_t v5 = [(NCNotificationRootList *)self logDescription];
      BOOL v6 = [(NCNotificationStructuredSectionList *)self->_currentDigestSectionList logDescription];
      int v11 = 138543618;
      __int16 v12 = v5;
      __int16 v13 = 2114;
      BOOL v14 = v6;
      _os_log_impl(&dword_1D7C04000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ removing %{public}@ from visible section", (uint8_t *)&v11, 0x16u);
    }
    BOOL v7 = [(NCNotificationRootList *)self _notificationListSections];
    uint64_t v8 = [v7 indexOfObject:self->_currentDigestSectionList];
    uint64_t v9 = [(NCNotificationRootList *)self notificationSections];
    [v9 removeObject:self->_currentDigestSectionList];

    id v10 = [(NCNotificationRootList *)self rootListView];
    objc_msgSend(v10, "removeViewAtIndex:animated:isHorizontallyDisplaced:", v8, 1, -[NCNotificationSummarizedSectionList isHorizontallyDisplaced](self->_currentDigestSectionList, "isHorizontallyDisplaced"));

    [(NCNotificationRootList *)self _updateIndexForReveal];
    [(NCNotificationRootList *)self _updateDelegateAndSubclassIfNecessaryOfContentChange];
  }
}

- (void)_insertCurrentDigestSectionListToSectionList:(id)a3 atIndex:(unint64_t)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  currentDigestSectionList = self->_currentDigestSectionList;
  if (currentDigestSectionList
    && [(NCNotificationCombinedSectionList *)currentDigestSectionList count]
    && ([v6 containsSectionList:self->_currentDigestSectionList] & 1) == 0)
  {
    uint64_t v8 = (void *)*MEMORY[0x1E4FB3778];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = v8;
      id v10 = [(NCNotificationRootList *)self logDescription];
      int v11 = [(NCNotificationStructuredSectionList *)self->_currentDigestSectionList logDescription];
      __int16 v12 = [v6 logDescription];
      int v13 = 138544130;
      BOOL v14 = v10;
      __int16 v15 = 2114;
      int v16 = v11;
      __int16 v17 = 2114;
      __int16 v18 = v12;
      __int16 v19 = 2048;
      unint64_t v20 = a4;
      _os_log_impl(&dword_1D7C04000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ inserting %{public}@ to %{public}@ at index %lu", (uint8_t *)&v13, 0x2Au);
    }
    objc_msgSend(v6, "insertNotificationSectionList:atIndex:animated:", self->_currentDigestSectionList, a4, -[NCNotificationRootList isNotificationHistoryRevealed](self, "isNotificationHistoryRevealed"));
  }
}

- (void)_removeCurrentDigestSectionListFromSectionList:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = v4;
  if (self->_currentDigestSectionList && objc_msgSend(v4, "containsSectionList:"))
  {
    id v6 = (void *)*MEMORY[0x1E4FB3778];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
    {
      BOOL v7 = v6;
      uint64_t v8 = [(NCNotificationRootList *)self logDescription];
      uint64_t v9 = [(NCNotificationStructuredSectionList *)self->_currentDigestSectionList logDescription];
      id v10 = [v5 logDescription];
      int v11 = 138543874;
      __int16 v12 = v8;
      __int16 v13 = 2114;
      BOOL v14 = v9;
      __int16 v15 = 2114;
      int v16 = v10;
      _os_log_impl(&dword_1D7C04000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ removing %{public}@ from %{public}@", (uint8_t *)&v11, 0x20u);
    }
    objc_msgSend(v5, "removeNotificationSectionList:animated:", self->_currentDigestSectionList, -[NCNotificationRootList isNotificationHistoryRevealed](self, "isNotificationHistoryRevealed"));
  }
}

- (void)_insertCurrentDigestSectionListToMissedSectionList
{
  [(NCNotificationRootList *)self _insertCurrentDigestSectionListToSectionList:self->_upcomingMissedSectionList atIndex:0];
  id v3 = [(NCNotificationSummarizedSectionList *)self->_upcomingMissedSectionList summaryOrderProvider];
  [v3 updateLeadingSummaryPlatterView];
}

- (void)_removeCurrentDigestSectionListFromMissedSectionList
{
  [(NCNotificationRootList *)self _removeCurrentDigestSectionListFromSectionList:self->_upcomingMissedSectionList];
  id v3 = [(NCNotificationSummarizedSectionList *)self->_upcomingMissedSectionList summaryOrderProvider];
  [v3 updateLeadingSummaryPlatterView];
}

- (void)_insertCurrentDigestSectionListToHistorySectionList
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  currentDigestSectionList = self->_currentDigestSectionList;
  if (currentDigestSectionList
    && [(NCNotificationCombinedSectionList *)currentDigestSectionList count]
    && ![(NCNotificationCombinedSectionList *)self->_historySectionList containsSectionList:self->_currentDigestSectionList])
  {
    id v4 = (void *)*MEMORY[0x1E4FB3778];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = v4;
      id v6 = [(NCNotificationRootList *)self logDescription];
      BOOL v7 = [(NCNotificationStructuredSectionList *)self->_currentDigestSectionList logDescription];
      uint64_t v8 = [(NCNotificationStructuredSectionList *)self->_historySectionList logDescription];
      int v9 = 138543874;
      id v10 = v6;
      __int16 v11 = 2114;
      __int16 v12 = v7;
      __int16 v13 = 2114;
      BOOL v14 = v8;
      _os_log_impl(&dword_1D7C04000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ inserting %{public}@ to %{public}@ at chronologically", (uint8_t *)&v9, 0x20u);
    }
    [(NCNotificationCombinedSectionList *)self->_historySectionList insertNotificationSectionListChronologically:self->_currentDigestSectionList animated:[(NCNotificationRootList *)self isNotificationHistoryRevealed]];
  }
}

- (void)_removeCurrentDigestSectionListFromHistorySectionList
{
}

- (void)_removeCurrentDigestSectionListFromContainingSectionList
{
  id v3 = [(NCNotificationRootList *)self notificationSections];
  int v4 = [v3 containsObject:self->_currentDigestSectionList];

  if (v4)
  {
    [(NCNotificationRootList *)self _removeCurrentDigestSectionList];
  }
  else if ([(NCNotificationCombinedSectionList *)self->_upcomingMissedSectionList containsSectionList:self->_currentDigestSectionList])
  {
    [(NCNotificationRootList *)self _removeCurrentDigestSectionListFromMissedSectionList];
  }
  else if ([(NCNotificationCombinedSectionList *)self->_historySectionList containsSectionList:self->_currentDigestSectionList])
  {
    [(NCNotificationRootList *)self _removeCurrentDigestSectionListFromHistorySectionList];
  }
}

- (void)_toggleCurrentDigestSectionListVisibility
{
  if ([(NCNotificationRootList *)self isPerformingClearAll]) {
    return;
  }
  currentDigestSectionList = self->_currentDigestSectionList;
  if (!currentDigestSectionList) {
    return;
  }
  if ([(NCNotificationCombinedSectionList *)currentDigestSectionList count])
  {
    id v6 = [(NCNotificationRootList *)self notificationSections];
    if (([(NCNotificationSummarizedSectionList *)v6 containsObject:self->_currentDigestSectionList] & 1) == 0
      && ![(NCNotificationCombinedSectionList *)self->_historySectionList containsSectionList:self->_currentDigestSectionList]&& ![(NCNotificationCombinedSectionList *)self->_upcomingMissedSectionList containsSectionList:self->_currentDigestSectionList]&& [(NCNotificationCombinedSectionList *)self->_currentDigestSectionList count]&& ([(NCNotificationStructuredSectionList *)self->_currentDigestSectionList sectionType] == 4|| [(NCNotificationStructuredSectionList *)self->_currentDigestSectionList sectionType] == 8))
    {
      BOOL v4 = [(NCNotificationRootList *)self deferCurrentDigestPresentationForPersistedDataLoad];

      if (!v4)
      {
        [(NCNotificationSummarizedSectionList *)self->_currentDigestSectionList setDeviceAuthenticated:[(NCNotificationRootList *)self deviceAuthenticated]];
        [(NCNotificationRootList *)self _insertCurrentDigestSectionList];
      }
      return;
    }
    uint64_t v5 = v6;
  }
  else
  {
    [(NCNotificationRootList *)self _removeCurrentDigestSectionListFromContainingSectionList];
    uint64_t v5 = self->_currentDigestSectionList;
    self->_currentDigestSectionList = 0;
  }
}

- (void)_toggleCurrentDigestSectionListVisibilityInHistorySection
{
  if (self->_currentDigestSectionList)
  {
    if (-[NCNotificationCombinedSectionList containsSectionList:](self->_historySectionList, "containsSectionList:")
      && ![(NCNotificationCombinedSectionList *)self->_currentDigestSectionList count])
    {
      [(NCNotificationRootList *)self _removeCurrentDigestSectionListFromHistorySectionList];
    }
    else if (![(NCNotificationCombinedSectionList *)self->_historySectionList containsSectionList:self->_currentDigestSectionList])
    {
      id v4 = [(NCNotificationRootList *)self notificationSections];
      if (([v4 containsObject:self->_currentDigestSectionList] & 1) != 0
        || ![(NCNotificationCombinedSectionList *)self->_currentDigestSectionList count])
      {
      }
      else
      {
        unint64_t v3 = [(NCNotificationStructuredSectionList *)self->_currentDigestSectionList sectionType];

        if (v3 == 6)
        {
          [(NCNotificationRootList *)self _insertCurrentDigestSectionListToHistorySectionList];
        }
      }
    }
  }
}

- (void)_upgradeCurrentDigestSectionListForPromotionAboveFold
{
  currentDigestSectionList = self->_currentDigestSectionList;
  if (currentDigestSectionList)
  {
    id v7 = [(NCNotificationSummarizedSectionList *)currentDigestSectionList summaryOrderProvider];
    id v4 = [v7 summaryHeading];
    uint64_t v5 = [v7 summaryDate];
    id v6 = -[NCNotificationRootList _newSummaryOrderProviderOfType:summaryHeading:summaryDate:atxDigestDeliveryTime:isOnboardingSummary:](self, "_newSummaryOrderProviderOfType:summaryHeading:summaryDate:atxDigestDeliveryTime:isOnboardingSummary:", 1, v4, v5, [v7 atxDigestDeliveryTime], 0);

    [(NCNotificationSummarizedSectionList *)self->_currentDigestSectionList setSummaryOrderProvider:v6];
  }
}

- (void)_migrateUpcomingDigestSectionListToCurrentDigestSectionList
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  if (self->_upcomingDigestSectionList)
  {
    unint64_t v3 = (os_log_t *)MEMORY[0x1E4FB3778];
    id v4 = (void *)*MEMORY[0x1E4FB3778];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = v4;
      id v6 = [(NCNotificationRootList *)self logDescription];
      id v7 = [(NCNotificationStructuredSectionList *)self->_upcomingDigestSectionList logDescription];
      int v32 = 138543618;
      __int16 v33 = v6;
      __int16 v34 = 2114;
      uint64_t v35 = v7;
      _os_log_impl(&dword_1D7C04000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ moving %{public}@ to current digest", (uint8_t *)&v32, 0x16u);
    }
    p_currentDigestSectionList = &self->_currentDigestSectionList;
    currentDigestSectionList = self->_currentDigestSectionList;
    if (currentDigestSectionList
      && [(NCNotificationCombinedSectionList *)currentDigestSectionList notificationCount])
    {
      [(NCNotificationRootList *)self _dissolveCurrentDigestSectionListToHistorySection];
    }
    [(NCNotificationRootList *)self _removeSectionListInHistorySectionList:self->_upcomingDigestSectionList animated:0];
    objc_storeStrong((id *)&self->_currentDigestSectionList, self->_upcomingDigestSectionList);
    if ([(NCNotificationRootList *)self currentListDisplayStyleSetting] == 2) {
      [(NCNotificationRootList *)self _setRevealed:[(NCNotificationRootList *)self isNotificationHistoryRevealed] forSection:self->_currentDigestSectionList];
    }
    [(NCNotificationStructuredSectionList *)self->_currentDigestSectionList setLogDescription:@"Current Digest"];
    id v10 = [(NCNotificationRootList *)self digestScheduleManager];
    __int16 v11 = [v10 previouslyScheduledDigestInfo];

    __int16 v12 = self->_currentDigestSectionList;
    __int16 v13 = [v11 titleString];
    [(NCNotificationStructuredSectionList *)v12 setTitle:v13];

    if ([(NCNotificationRootList *)self isMissedSectionActive]) {
      uint64_t v14 = 2;
    }
    else {
      uint64_t v14 = 1;
    }
    uint64_t v15 = [v11 headerString];
    int v16 = [v11 scheduleDate];
    id v17 = -[NCNotificationRootList _newSummaryOrderProviderOfType:summaryHeading:summaryDate:atxDigestDeliveryTime:isOnboardingSummary:](self, "_newSummaryOrderProviderOfType:summaryHeading:summaryDate:atxDigestDeliveryTime:isOnboardingSummary:", v14, v15, v16, -[NCNotificationRootList _atxDigestDeliveryTimeForDeliveryOrder:](self, "_atxDigestDeliveryTimeForDeliveryOrder:", [v11 deliveryOrder]), 0);

    [(NCNotificationSummarizedSectionList *)self->_currentDigestSectionList setSummaryOrderProvider:v17];
    [(NCNotificationStructuredSectionList *)self->_currentDigestSectionList setSectionType:4];
    upcomingDigestSectionList = self->_upcomingDigestSectionList;
    self->_upcomingDigestSectionList = 0;

    if ([(NCNotificationCombinedSectionList *)self->_currentDigestSectionList notificationCount])
    {
      [(NCNotificationRootList *)self setDeferCurrentDigestPresentationForPersistedDataLoad:0];
      if ([(NCNotificationRootList *)self _shouldInsertCurrentDigestIntoMissedSectionList])
      {
        os_log_t v19 = *v3;
        if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
        {
          unint64_t v20 = v19;
          uint64_t v21 = [(NCNotificationRootList *)self logDescription];
          int v22 = [(NCNotificationStructuredSectionList *)self->_currentDigestSectionList logDescription];
          id v23 = [(NCNotificationStructuredSectionList *)self->_upcomingMissedSectionList logDescription];
          int v32 = 138543874;
          __int16 v33 = v21;
          __int16 v34 = 2114;
          uint64_t v35 = v22;
          __int16 v36 = 2114;
          id v37 = v23;
          _os_log_impl(&dword_1D7C04000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ moving %{public}@ to %{public}@ because missed section is active and exclusive.", (uint8_t *)&v32, 0x20u);
        }
        [(NCNotificationRootList *)self _insertCurrentDigestSectionListToMissedSectionList];
      }
      else
      {
        [(NCNotificationRootList *)self _insertCurrentDigestSectionList];
      }
      id v29 = [(NCNotificationSummarizedSectionList *)self->_currentDigestSectionList summaryOrderProvider];
      [v29 atxLogSummaryPlatterShownIsUpcoming:0];

      id v30 = +[NCNotificationEventTracker sharedInstance];
      __int16 v31 = [(NCNotificationSummarizedSectionList *)self->_currentDigestSectionList atxUUID];
      [v30 digestAppeared:v31];

      [(NCNotificationListMigrationScheduler *)self->_migrationScheduler setMigrationDateForNotificationDigest:0];
    }
    else
    {
      os_log_t v24 = *v3;
      if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
      {
        id v25 = v24;
        __int16 v26 = [(NCNotificationRootList *)self logDescription];
        id v27 = [(NCNotificationStructuredSectionList *)self->_currentDigestSectionList logDescription];
        int v32 = 138543618;
        __int16 v33 = v26;
        __int16 v34 = 2114;
        uint64_t v35 = v27;
        _os_log_impl(&dword_1D7C04000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@ not presenting current digest %{public}@ because it has no notifications", (uint8_t *)&v32, 0x16u);
      }
      uint64_t v28 = *p_currentDigestSectionList;
      *p_currentDigestSectionList = 0;
    }
  }
}

- (void)_migrateCurrentDigestSectionListToReadSection
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (self->_currentDigestSectionList
    && !-[NCNotificationCombinedSectionList containsSectionList:](self->_historySectionList, "containsSectionList:"))
  {
    BOOL v3 = [(NCNotificationRootList *)self _isCurrentDigestListInMissedSectionList];
    id v4 = (void *)*MEMORY[0x1E4FB3778];
    BOOL v5 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT);
    if (v3)
    {
      if (v5)
      {
        id v6 = v4;
        id v7 = [(NCNotificationRootList *)self logDescription];
        uint64_t v8 = [(NCNotificationStructuredSectionList *)self->_currentDigestSectionList logDescription];
        int v14 = 138543618;
        uint64_t v15 = v7;
        __int16 v16 = 2114;
        id v17 = v8;
        _os_log_impl(&dword_1D7C04000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ moving %{public}@ from missed section to history", (uint8_t *)&v14, 0x16u);
      }
      [(NCNotificationRootList *)self _removeCurrentDigestSectionListFromMissedSectionList];
    }
    else
    {
      if (v5)
      {
        int v9 = v4;
        id v10 = [(NCNotificationRootList *)self logDescription];
        __int16 v11 = [(NCNotificationStructuredSectionList *)self->_currentDigestSectionList logDescription];
        int v14 = 138543618;
        uint64_t v15 = v10;
        __int16 v16 = 2114;
        id v17 = v11;
        _os_log_impl(&dword_1D7C04000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ moving %{public}@ from visible section to history", (uint8_t *)&v14, 0x16u);
      }
      [(NCNotificationRootList *)self _removeCurrentDigestSectionList];
    }
    [(NCNotificationStructuredSectionList *)self->_currentDigestSectionList setLogDescription:@"Read Digest"];
    [(NCNotificationStructuredSectionList *)self->_currentDigestSectionList setSectionType:6];
    __int16 v12 = [(NCNotificationSummarizedSectionList *)self->_currentDigestSectionList summaryOrderProvider];
    id v13 = [(NCNotificationRootList *)self _newSummaryOrderProviderOfType:2 fromSummaryOrderProvider:v12];

    [(NCNotificationSummarizedSectionList *)self->_currentDigestSectionList setSummaryOrderProvider:v13];
    [(NCNotificationRootList *)self _setRevealed:1 forSection:self->_currentDigestSectionList];
    [(NCNotificationRootList *)self _insertCurrentDigestSectionListToHistorySectionList];
    [(NCNotificationRootList *)self _updateRevealCoordinator];
    [(NCNotificationListMigrationScheduler *)self->_migrationScheduler setMigrationDateForNotificationDigest:0];
  }
}

- (void)_dissolveCurrentDigestSectionListToHistorySection
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (self->_currentDigestSectionList)
  {
    BOOL v3 = (void *)*MEMORY[0x1E4FB3778];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
    {
      id v4 = v3;
      BOOL v5 = [(NCNotificationRootList *)self logDescription];
      id v6 = [(NCNotificationStructuredSectionList *)self->_currentDigestSectionList logDescription];
      id v7 = [(NCNotificationStructuredSectionList *)self->_historySectionList logDescription];
      *(_DWORD *)buf = 138543874;
      id v13 = v5;
      __int16 v14 = 2114;
      uint64_t v15 = v6;
      __int16 v16 = 2114;
      id v17 = v7;
      _os_log_impl(&dword_1D7C04000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ removing %{public}@ and moving all notifications to %{public}@", buf, 0x20u);
    }
    [(NCNotificationRootList *)self _removeCurrentDigestSectionListFromContainingSectionList];
    BYTE2(v11) = 1;
    LOWORD(v11) = 1;
    -[NCNotificationRootList _migrateNotificationsFromList:toList:passingTest:filterRequestsPassingTest:hideToList:clearRequests:filterForDestination:animateRemoval:reorderGroupNotifications:](self, "_migrateNotificationsFromList:toList:passingTest:filterRequestsPassingTest:hideToList:clearRequests:filterForDestination:animateRemoval:reorderGroupNotifications:", self->_currentDigestSectionList, self->_historySectionList, 0, 0, 0, 1, v11);
    uint64_t v8 = +[NCNotificationEventTracker sharedInstance];
    int v9 = [(NCNotificationSummarizedSectionList *)self->_currentDigestSectionList atxUUID];
    [v8 digestExpired:v9];

    currentDigestSectionList = self->_currentDigestSectionList;
    self->_currentDigestSectionList = 0;
  }
}

- (BOOL)_isCurrentDigestListAboveHistorySectionList
{
  if (!self->_currentDigestSectionList) {
    return 0;
  }
  id v2 = self;
  BOOL v3 = [(NCNotificationRootList *)self notificationSections];
  LOBYTE(v2) = [v3 containsObject:v2->_currentDigestSectionList];

  return (char)v2;
}

- (BOOL)_isCurrentDigestListInHistorySectionList
{
  return self->_currentDigestSectionList
      && -[NCNotificationCombinedSectionList containsSectionList:](self->_historySectionList, "containsSectionList:");
}

- (BOOL)_isCurrentDigestListInMissedSectionList
{
  return self->_currentDigestSectionList
      && (upcomingMissedSectionList = self->_upcomingMissedSectionList) != 0
      && -[NCNotificationCombinedSectionList containsSectionList:](upcomingMissedSectionList, "containsSectionList:");
}

- (BOOL)_shouldInsertCurrentDigestIntoMissedSectionList
{
  int v3 = [(NCNotificationRootList *)self isMissedSectionActive];
  id v4 = [(NCNotificationRootList *)self activeDNDModeConfiguration];
  BOOL v5 = v4;
  if (v3 && v4) {
    LOBYTE(v3) = objc_msgSend(v4, "nc_modeConfigurationHasExclusiveAppConfigurationType");
  }

  return v3;
}

- (id)_sectionListsThatSuppressDigest
{
  int v3 = (void *)MEMORY[0x1E4F1CA48];
  id v4 = [(NCNotificationRootList *)self _sectionListsThatSuppressLargeFormatContent];
  BOOL v5 = [v3 arrayWithArray:v4];

  if (v5)
  {
    if (self->_incomingSectionList) {
      objc_msgSend(v5, "addObject:");
    }
    if (self->_highlightedSectionList) {
      objc_msgSend(v5, "addObject:");
    }
  }
  id v6 = (void *)[v5 copy];

  return v6;
}

- (id)_sectionListsThatSuppressLargeFormatContent
{
  if (_NCReactiveListUI())
  {
    int v3 = [MEMORY[0x1E4F1CA48] array];
    id v4 = v3;
    if (self->_criticalSectionList) {
      objc_msgSend(v3, "addObject:");
    }
    if (self->_prominentIncomingSectionList) {
      objc_msgSend(v4, "addObject:");
    }
    BOOL v5 = (void *)[v4 copy];
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)_suppressesCurrentDigestForNotifications
{
  id v2 = self;
  int v3 = [(NCNotificationRootList *)self _sectionListsThatSuppressDigest];
  LOBYTE(v2) = [(NCNotificationRootList *)v2 _suppressesForLists:v3 forProminentContentThreshold:1];

  return (char)v2;
}

- (BOOL)_suppressesHighlightsPlatterForNotifications
{
  int v3 = +[NCUserNotificationsUIKitDefaults standardDefaults];
  uint64_t v4 = [v3 highlightDispersingProminentContentCount];

  BOOL v5 = [(NCNotificationRootList *)self _sectionListsThatSuppressLargeFormatContent];
  LOBYTE(self) = [(NCNotificationRootList *)self _suppressesForLists:v5 forProminentContentThreshold:v4];

  return (char)self;
}

- (void)_updateForceExpansionForHighlights
{
  id v5 = [(NCNotificationRootList *)self highlightedSectionList];
  int v3 = [v5 forceExpanded];
  BOOL v4 = [(NCNotificationRootList *)self _suppressesHighlightsPlatterForNotifications];
  if (v3 != v4) {
    [v5 setForceExpanded:v4];
  }
}

- (BOOL)_suppressesForLists:(id)a3 forProminentContentThreshold:(int64_t)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v7 = _NCReactiveListUI();
  BOOL v8 = 0;
  if (a4 && v7)
  {
    int64_t v9 = [(NCNotificationRootList *)self _numberOfLiveActivities];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v10 = v6;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v18 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "allNotificationRequests", (void)v17);
          v9 += [v15 count];
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v12);
    }

    BOOL v8 = v9 >= a4;
  }

  return v8;
}

- (BOOL)_hasLiveActivitiesWithThreshold:(int64_t)a3
{
  return [(NCNotificationRootList *)self _numberOfLiveActivities] >= a3;
}

- (int64_t)_numberOfLiveActivities
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v2 = [(NCNotificationRootList *)self supplementaryViewsSections];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v2);
        }
        int v7 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        BOOL v8 = [v7 identifier];
        char v9 = [v8 isEqualToString:@"LiveActivities"];

        if (v9)
        {
          int64_t v10 = [v7 supplementaryViewControllersCount];
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  int64_t v10 = 0;
LABEL_11:

  return v10;
}

- (void)_addStateCaptureBlock
{
  objc_initWeak(&location, self);
  id v2 = MEMORY[0x1E4F14428];
  v7[1] = (id)MEMORY[0x1E4F143A8];
  v7[2] = (id)3221225472;
  v7[3] = __47__NCNotificationRootList__addStateCaptureBlock__block_invoke;
  void v7[4] = &unk_1E6A92AB0;
  objc_copyWeak(&v8, &location);
  id v3 = (id)BSLogAddStateCaptureBlockWithTitle();

  v6[1] = (id)MEMORY[0x1E4F143A8];
  v6[2] = (id)3221225472;
  v6[3] = __47__NCNotificationRootList__addStateCaptureBlock__block_invoke_2;
  v6[4] = &unk_1E6A92AB0;
  objc_copyWeak(v7, &location);
  id v4 = (id)BSLogAddStateCaptureBlockWithTitle();

  objc_copyWeak(v6, &location);
  id v5 = (id)BSLogAddStateCaptureBlockWithTitle();

  objc_destroyWeak(v6);
  objc_destroyWeak(v7);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

id __47__NCNotificationRootList__addStateCaptureBlock__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = [WeakRetained persistentStateManager];
  id v3 = [WeakRetained _sectionsForStateDump];
  id v4 = [WeakRetained notificationListCache];
  id v5 = [WeakRetained migrationScheduler];
  id v6 = [WeakRetained _listInfoForStateCapture];
  int v7 = [v2 stateRepresentationForNotificationList:WeakRetained sectionLists:v3 listCache:v4 migrationScheduler:v5 listInfo:v6 detailed:1];

  return v7;
}

id __47__NCNotificationRootList__addStateCaptureBlock__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if (WeakRetained)
  {
    [WeakRetained overrideMigrationToHistory];
    id v3 = NSStringFromBOOL();
    [v2 setValue:v3 forKey:@"OverrideMigrationToHistory"];

    id v4 = NSNumber;
    [WeakRetained overrideNotificationMigrateTimeSensitiveToHistoryTimeIntervalKey];
    id v5 = objc_msgSend(v4, "numberWithDouble:");
    [v2 setValue:v5 forKey:@"OverrideMigrateTimeSensitiveToHistoryTimeInterval"];

    id v6 = NSNumber;
    [WeakRetained overrideNotificationMigrateHighlightToHistoryTimeIntervalKey];
    int v7 = objc_msgSend(v6, "numberWithDouble:");
    [v2 setValue:v7 forKey:@"OverrideMigrateHighlightToHistoryTimeInterval"];
  }

  return v2;
}

id __47__NCNotificationRootList__addStateCaptureBlock__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if (WeakRetained)
  {
    _NCIsNotificationHighlightsAllowed();
    id v4 = NSStringFromBOOL();
    [v3 setValue:v4 forKey:@"isNotificationHighlightsAllowed"];

    +[NCPlatformEligibility areGenerativeModelsAvailable];
    id v5 = NSStringFromBOOL();
    [v3 setValue:v5 forKey:@"areGenerativeModelsAvailable"];

    [WeakRetained _areHighlightsEnabled];
    id v6 = NSStringFromBOOL();
    [v3 setValue:v6 forKey:@"areHighlightEnabled"];

    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v8 = [*(id *)(a1 + 32) notificationSections];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __47__NCNotificationRootList__addStateCaptureBlock__block_invoke_4;
    v12[3] = &unk_1E6A91C70;
    id v13 = v7;
    id v9 = v7;
    [v8 enumerateObjectsUsingBlock:v12];

    int64_t v10 = [v9 componentsJoinedByString:@"/"];
    [v3 setValue:v10 forKey:@"availableSections"];
  }

  return v3;
}

void __47__NCNotificationRootList__addStateCaptureBlock__block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  NCNotificationListSectionTypeString([a2 sectionType]);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v2 addObject:v3];
}

- (id)_listInfoForStateCapture
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = [(NCNotificationRootList *)self _listInfoForPersistentState];
  if (v4) {
    [v3 addEntriesFromDictionary:v4];
  }
  if (self->_upcomingDigestSectionList)
  {
    id v5 = objc_msgSend(NSNumber, "numberWithBool:", -[NCNotificationRootList isUpcomingDigestVisible](self, "isUpcomingDigestVisible"));
    [v3 setObject:v5 forKey:@"isUpcomingDigestVisible"];
  }
  if ([(NCNotificationRootList *)self isOnboardingSummaryVisible])
  {
    id v6 = objc_msgSend(NSNumber, "numberWithBool:", -[NCNotificationRootList isOnboardingSummaryVisible](self, "isOnboardingSummaryVisible"));
    [v3 setObject:v6 forKey:@"isOnboardingDigestVisible"];
  }
  id v7 = objc_msgSend(MEMORY[0x1E4FB3808], "stringForNotificationListDisplayStyleSetting:", -[NCNotificationRootList currentListDisplayStyleSetting](self, "currentListDisplayStyleSetting"));
  [v3 setObject:v7 forKey:@"currentListDisplayStyleSetting"];

  if ([v3 count]) {
    id v8 = v3;
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;

  return v9;
}

- (id)_sectionsForStateDump
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v4 = v3;
  if (self->_criticalSectionList) {
    objc_msgSend(v3, "addObject:");
  }
  if (self->_highlightedSectionList) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_prominentIncomingSectionList) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_incomingSectionList) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_currentDigestSectionList) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_upcomingDigestSectionList) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_upcomingMissedSectionList) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_historySectionList) {
    objc_msgSend(v4, "addObject:");
  }

  return v4;
}

- (id)_digestTestRecipe
{
  void v4[4] = self;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __43__NCNotificationRootList__digestTestRecipe__block_invoke;
  v5[3] = &unk_1E6A91BB0;
  v5[4] = self;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __43__NCNotificationRootList__digestTestRecipe__block_invoke_262;
  v4[3] = &unk_1E6A91BB0;
  id v2 = [MEMORY[0x1E4F94120] recipeWithTitle:@"Notification Digest Promotion/Onboarding Suggestion" increaseAction:v5 decreaseAction:v4];

  return v2;
}

void __43__NCNotificationRootList__digestTestRecipe__block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (([*(id *)(a1 + 32) _isCurrentDigestListAboveHistorySectionList] & 1) != 0
    || [*(id *)(a1 + 32) _isCurrentDigestListInMissedSectionList])
  {
    id v2 = (void *)*MEMORY[0x1E4FB3778];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
    {
      id v3 = *(void **)(a1 + 32);
      id v4 = v2;
      id v5 = [v3 logDescription];
      int v15 = 138543362;
      __int16 v16 = v5;
      _os_log_impl(&dword_1D7C04000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ migrating current digest to Notification Center via test recipe", (uint8_t *)&v15, 0xCu);
    }
    [*(id *)(a1 + 32) _migrateCurrentDigestSectionListToReadSection];
LABEL_6:
    [*(id *)(a1 + 32) _notificationListDidChangeContent];
    return;
  }
  id v6 = [*(id *)(a1 + 32) upcomingDigestSectionList];
  uint64_t v7 = [v6 count];

  if (v7)
  {
    id v8 = (void *)*MEMORY[0x1E4FB3778];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
    {
      id v9 = *(void **)(a1 + 32);
      int64_t v10 = v8;
      uint64_t v11 = [v9 logDescription];
      int v15 = 138543362;
      __int16 v16 = v11;
      _os_log_impl(&dword_1D7C04000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ promoting upcoming digest to current digest via test recipe", (uint8_t *)&v15, 0xCu);
    }
    [*(id *)(a1 + 32) _migrateCurrentDigestSectionListToReadSection];
    [*(id *)(a1 + 32) _migrateUpcomingDigestSectionListToCurrentDigestSectionList];
    long long v12 = *(void **)(a1 + 32);
    id v13 = [v12 digestScheduleManager];
    long long v14 = [v13 upcomingScheduledDigestInfo];
    [v12 _configureUpcomingDigestSectionListWithDigestInfo:v14];

    goto LABEL_6;
  }
}

uint64_t __43__NCNotificationRootList__digestTestRecipe__block_invoke_262(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)*MEMORY[0x1E4FB3778];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
  {
    id v3 = *(void **)(a1 + 32);
    id v4 = v2;
    id v5 = [v3 logDescription];
    int v7 = 138543362;
    id v8 = v5;
    _os_log_impl(&dword_1D7C04000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ requests presenting digest onboarding platter via test recipe", (uint8_t *)&v7, 0xCu);
  }
  if ([*(id *)(a1 + 32) isOnboardingSummaryVisible]) {
    [*(id *)(a1 + 32) setOnboardingSummaryVisible:0];
  }
  [*(id *)(a1 + 32) _migrateCurrentDigestSectionListToReadSection];
  [*(id *)(a1 + 32) _dissolveCurrentDigestSectionListToHistorySection];
  return [*(id *)(a1 + 32) setOnboardingSummaryVisible:1];
}

- (id)_notificationMigrationOverrideTestRecipe
{
  void v4[4] = self;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __66__NCNotificationRootList__notificationMigrationOverrideTestRecipe__block_invoke;
  v5[3] = &unk_1E6A91BB0;
  v5[4] = self;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __66__NCNotificationRootList__notificationMigrationOverrideTestRecipe__block_invoke_269;
  v4[3] = &unk_1E6A91BB0;
  id v2 = [MEMORY[0x1E4F94120] recipeWithTitle:@"Notification List History Migration Override [UP: Enable, DN: Disable]", v5, v4 increaseAction decreaseAction];

  return v2;
}

uint64_t __66__NCNotificationRootList__notificationMigrationOverrideTestRecipe__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (([*(id *)(a1 + 32) overrideMigrationToHistory] & 1) == 0)
  {
    id v2 = (void *)*MEMORY[0x1E4FB3778];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
    {
      id v3 = *(void **)(a1 + 32);
      id v4 = v2;
      id v5 = [v3 logDescription];
      int v7 = 138543362;
      id v8 = v5;
      _os_log_impl(&dword_1D7C04000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ overriding notification migration to history via test recipe", (uint8_t *)&v7, 0xCu);
    }
    [*(id *)(a1 + 32) setOverrideMigrationToHistory:1];
  }
  return [*(id *)(a1 + 32) _updateOverrideMigrationOverlayLabelWithText:@"Overriding Notification Migration" forOverrideState:1];
}

uint64_t __66__NCNotificationRootList__notificationMigrationOverrideTestRecipe__block_invoke_269(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) overrideMigrationToHistory])
  {
    id v2 = (void *)*MEMORY[0x1E4FB3778];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
    {
      id v3 = *(void **)(a1 + 32);
      id v4 = v2;
      id v5 = [v3 logDescription];
      int v7 = 138543362;
      id v8 = v5;
      _os_log_impl(&dword_1D7C04000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ removing override for notification migration to history via test recipe", (uint8_t *)&v7, 0xCu);
    }
    [*(id *)(a1 + 32) setOverrideMigrationToHistory:0];
  }
  return [*(id *)(a1 + 32) _updateOverrideMigrationOverlayLabelWithText:@"Removing Notification Migration Override" forOverrideState:0];
}

- (void)_configureOverrideMigrationOverlayLabelIfNecessary
{
  id v3 = [(NCNotificationRootList *)self overrideMigrationOverlayLabel];

  if (!v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4FB1930]);
    id v5 = [(NCNotificationRootList *)self rootListView];
    [v5 bounds];
    id v13 = (id)objc_msgSend(v4, "initWithFrame:");

    [v13 setNumberOfLines:0];
    [v13 setTextAlignment:1];
    id v6 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2988]];
    [v13 setFont:v6];

    int v7 = [MEMORY[0x1E4FB1618] whiteColor];
    [v13 setTextColor:v7];

    id v8 = [v13 layer];
    LODWORD(v9) = 1041865114;
    [v8 setShadowOpacity:v9];

    int64_t v10 = [v13 layer];
    [v10 setShadowRadius:5.0];

    uint64_t v11 = [v13 layer];
    objc_msgSend(v11, "setShadowOffset:", 0.0, 2.0);

    long long v12 = [(NCNotificationRootList *)self rootListView];
    [v12 addSubview:v13];

    [(NCNotificationRootList *)self setOverrideMigrationOverlayLabel:v13];
  }
}

- (void)_updateOverrideMigrationOverlayLabelWithText:(id)a3 forOverrideState:(BOOL)a4
{
  id v6 = a3;
  [(NCNotificationRootList *)self _configureOverrideMigrationOverlayLabelIfNecessary];
  int v7 = [(NCNotificationRootList *)self overrideMigrationOverlayLabel];
  [v7 setText:v6];

  id v8 = [(NCNotificationRootList *)self overrideMigrationOverlayLabel];
  [v8 setAlpha:0.0];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __88__NCNotificationRootList__updateOverrideMigrationOverlayLabelWithText_forOverrideState___block_invoke;
  v11[3] = &unk_1E6A91BB0;
  void v11[4] = self;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __88__NCNotificationRootList__updateOverrideMigrationOverlayLabelWithText_forOverrideState___block_invoke_2;
  v9[3] = &unk_1E6A92B00;
  void v9[4] = self;
  BOOL v10 = a4;
  [MEMORY[0x1E4FB1EB0] animateWithDuration:0 delay:v11 options:v9 animations:0.3 completion:0.0];
}

void __88__NCNotificationRootList__updateOverrideMigrationOverlayLabelWithText_forOverrideState___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) overrideMigrationOverlayLabel];
  [v1 setAlpha:1.0];
}

uint64_t __88__NCNotificationRootList__updateOverrideMigrationOverlayLabelWithText_forOverrideState___block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) overrideMigrationToHistory];
  int v3 = *(unsigned __int8 *)(a1 + 40);
  if (v3 == result)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __88__NCNotificationRootList__updateOverrideMigrationOverlayLabelWithText_forOverrideState___block_invoke_3;
    v6[3] = &unk_1E6A91BB0;
    uint64_t v7 = *(void *)(a1 + 32);
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __88__NCNotificationRootList__updateOverrideMigrationOverlayLabelWithText_forOverrideState___block_invoke_4;
    v4[3] = &unk_1E6A92B00;
    void v4[4] = v7;
    char v5 = v3;
    return [MEMORY[0x1E4FB1EB0] animateWithDuration:0 delay:v6 options:v4 animations:1.0 completion:1.0];
  }
  return result;
}

void __88__NCNotificationRootList__updateOverrideMigrationOverlayLabelWithText_forOverrideState___block_invoke_3(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) overrideMigrationOverlayLabel];
  [v1 setAlpha:0.0];
}

uint64_t __88__NCNotificationRootList__updateOverrideMigrationOverlayLabelWithText_forOverrideState___block_invoke_4(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) overrideMigrationToHistory];
  if (*(unsigned __int8 *)(a1 + 40) == result)
  {
    int v3 = [*(id *)(a1 + 32) overrideMigrationOverlayLabel];
    [v3 removeFromSuperview];

    id v4 = *(void **)(a1 + 32);
    return [v4 setOverrideMigrationOverlayLabel:0];
  }
  return result;
}

- (void)setLogDescription:(id)a3
{
}

- (BOOL)deviceAuthenticated
{
  return self->_deviceAuthenticated;
}

- (BOOL)adjustsFontForContentSizeCategory
{
  return self->_adjustsFontForContentSizeCategory;
}

- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3
{
  self->_adjustsFontForContentSizeCategordouble y = a3;
}

- (NCNotificationRootListDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NCNotificationRootListDelegate *)WeakRetained;
}

- (NCNotificationListViewProtocol)rootListView
{
  return self->_rootListView;
}

- (void)setRootListView:(id)a3
{
}

- (NCSuggestionManager)suggestionManager
{
  return self->_suggestionManager;
}

- (void)setSuggestionManager:(id)a3
{
}

- (BOOL)isNotificationHistoryRevealed
{
  return self->_notificationHistoryRevealed;
}

- (NSMutableArray)notificationSections
{
  return self->_notificationSections;
}

- (void)setNotificationSections:(id)a3
{
}

- (BOOL)isOnboardingSummaryVisible
{
  return self->_onboardingSummaryVisible;
}

- (DNDModeConfiguration)activeDNDModeConfiguration
{
  return self->_activeDNDModeConfiguration;
}

- (BOOL)expandsVisibleRegionOnSignificantScroll
{
  return self->_expandsVisibleRegionOnSignificantScroll;
}

- (void)setExpandsVisibleRegionOnSignificantScroll:(BOOL)a3
{
  self->_expandsVisibleRegionOnSignificantScroll = a3;
}

- (NCNotificationListCache)notificationListCache
{
  return self->_notificationListCache;
}

- (void)setNotificationListCache:(id)a3
{
}

- (NCNotificationListCache)notificationSummaryCache
{
  return self->_notificationSummaryCache;
}

- (void)setNotificationSummaryCache:(id)a3
{
}

- (NCNotificationListCache)supplementaryCache
{
  return self->_supplementaryCache;
}

- (void)setSupplementaryCache:(id)a3
{
}

- (NCNotificationListStalenessEventTracker)notificationListStalenessEventTracker
{
  return self->_notificationListStalenessEventTracker;
}

- (void)setNotificationListStalenessEventTracker:(id)a3
{
}

- (BOOL)isMissedSectionActive
{
  return self->_missedSectionActive;
}

- (void)setMissedSectionActive:(BOOL)a3
{
  self->_BOOL missedSectionActive = a3;
}

- (BOOL)isScheduledDeliveryEnabled
{
  return self->_scheduledDeliveryEnabled;
}

- (NCNotificationListPersistentStateManager)persistentStateManager
{
  return self->_persistentStateManager;
}

- (void)setPersistentStateManager:(id)a3
{
}

- (NSMutableArray)supplementaryViewsSections
{
  return self->_supplementaryViewsSections;
}

- (void)setSupplementaryViewsSections:(id)a3
{
}

- (BOOL)isPerformingClearAll
{
  return self->_performingClearAll;
}

- (void)setPerformingClearAll:(BOOL)a3
{
  self->_performingClearAll = a3;
}

- (NSMutableSet)loadedNotificationSections
{
  return self->_loadedNotificationSections;
}

- (void)setLoadedNotificationSections:(id)a3
{
}

- (NCNotificationStructuredSectionList)criticalSectionList
{
  return self->_criticalSectionList;
}

- (void)setCriticalSectionList:(id)a3
{
}

- (NCNotificationStructuredSectionList)highlightedSectionList
{
  return self->_highlightedSectionList;
}

- (void)setHighlightedSectionList:(id)a3
{
}

- (NCNotificationStructuredSectionList)prominentIncomingSectionList
{
  return self->_prominentIncomingSectionList;
}

- (void)setProminentIncomingSectionList:(id)a3
{
}

- (NCNotificationStructuredSectionList)incomingSectionList
{
  return self->_incomingSectionList;
}

- (void)setIncomingSectionList:(id)a3
{
}

- (NCNotificationCombinedSectionList)historySectionList
{
  return self->_historySectionList;
}

- (void)setHistorySectionList:(id)a3
{
}

- (NCNotificationSummarizedSectionList)currentDigestSectionList
{
  return self->_currentDigestSectionList;
}

- (void)setCurrentDigestSectionList:(id)a3
{
}

- (NCNotificationSummarizedSectionList)upcomingDigestSectionList
{
  return self->_upcomingDigestSectionList;
}

- (void)setUpcomingDigestSectionList:(id)a3
{
}

- (NCNotificationSummarizedSectionList)upcomingMissedSectionList
{
  return self->_upcomingMissedSectionList;
}

- (void)setUpcomingMissedSectionList:(id)a3
{
}

- (NCDigestScheduleManager)digestScheduleManager
{
  return self->_digestScheduleManager;
}

- (void)setDigestScheduleManager:(id)a3
{
}

- (BOOL)deferCurrentDigestPresentationForPersistedDataLoad
{
  return self->_deferCurrentDigestPresentationForPersistedDataLoad;
}

- (void)setDeferCurrentDigestPresentationForPersistedDataLoad:(BOOL)a3
{
  self->_deferCurrentDigestPresentationForPersistedDataLoad = a3;
}

- (BOOL)isUpcomingDigestVisible
{
  return self->_upcomingDigestVisible;
}

- (void)setUpcomingDigestVisible:(BOOL)a3
{
  self->_BOOL upcomingDigestVisible = a3;
}

- (NCNotificationListMigrationScheduler)migrationScheduler
{
  return self->_migrationScheduler;
}

- (void)setMigrationScheduler:(id)a3
{
}

- (BOOL)deferDigestMigration
{
  return self->_deferDigestMigration;
}

- (void)setDeferDigestMigration:(BOOL)a3
{
  self->_deferDigestMigration = a3;
}

- (NSMutableArray)notificationRequestsPendingMigration
{
  return self->_notificationRequestsPendingMigration;
}

- (void)setNotificationRequestsPendingMigration:(id)a3
{
}

- (NSDictionary)persistentStoredListInfo
{
  return self->_persistentStoredListInfo;
}

- (void)setPersistentStoredListInfo:(id)a3
{
}

- (NSString)currentListDisplayStyleSettingReason
{
  return self->_currentListDisplayStyleSettingReason;
}

- (void)setCurrentListDisplayStyleSettingReason:(id)a3
{
}

- (NSMutableDictionary)notificationListDisplayStyleSettingsForReason
{
  return self->_notificationListDisplayStyleSettingsForReason;
}

- (void)setNotificationListDisplayStyleSettingsForReason:(id)a3
{
}

- (BOOL)overrideMigrationToHistory
{
  return self->_overrideMigrationToHistory;
}

- (double)overrideNotificationMigrateHighlightToHistoryTimeIntervalKey
{
  return self->_overrideNotificationMigrateHighlightToHistoryTimeIntervalKey;
}

- (void)setOverrideNotificationMigrateHighlightToHistoryTimeIntervalKey:(double)a3
{
  self->_overrideNotificationMigrateHighlightToHistoryTimeIntervalKedouble y = a3;
}

- (double)overrideNotificationMigrateTimeSensitiveToHistoryTimeIntervalKey
{
  return self->_overrideNotificationMigrateTimeSensitiveToHistoryTimeIntervalKey;
}

- (void)setOverrideNotificationMigrateTimeSensitiveToHistoryTimeIntervalKey:(double)a3
{
  self->_overrideNotificationMigrateTimeSensitiveToHistoryTimeIntervalKedouble y = a3;
}

- (UILabel)overrideMigrationOverlayLabel
{
  return self->_overrideMigrationOverlayLabel;
}

- (void)setOverrideMigrationOverlayLabel:(id)a3
{
}

- (BOOL)isListDisplayStyleHiddenForUserInteraction
{
  return self->_listDisplayStyleHiddenForUserInteraction;
}

- (void)setListDisplayStyleHiddenForUserInteraction:(BOOL)a3
{
  self->_listDisplayStyleHiddenForUserInteraction = a3;
}

- (void)setAggregatedVisibleContentExtent:(CGRect)a3
{
  self->_aggregatedVisibleContentExtent = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideMigrationOverlayLabel, 0);
  objc_storeStrong((id *)&self->_notificationListDisplayStyleSettingsForReason, 0);
  objc_storeStrong((id *)&self->_currentListDisplayStyleSettingReason, 0);
  objc_storeStrong((id *)&self->_persistentStoredListInfo, 0);
  objc_storeStrong((id *)&self->_notificationRequestsPendingMigration, 0);
  objc_storeStrong((id *)&self->_migrationScheduler, 0);
  objc_storeStrong((id *)&self->_digestScheduleManager, 0);
  objc_storeStrong((id *)&self->_upcomingMissedSectionList, 0);
  objc_storeStrong((id *)&self->_upcomingDigestSectionList, 0);
  objc_storeStrong((id *)&self->_currentDigestSectionList, 0);
  objc_storeStrong((id *)&self->_historySectionList, 0);
  objc_storeStrong((id *)&self->_incomingSectionList, 0);
  objc_storeStrong((id *)&self->_prominentIncomingSectionList, 0);
  objc_storeStrong((id *)&self->_highlightedSectionList, 0);
  objc_storeStrong((id *)&self->_criticalSectionList, 0);
  objc_storeStrong((id *)&self->_loadedNotificationSections, 0);
  objc_storeStrong((id *)&self->_supplementaryViewsSections, 0);
  objc_storeStrong((id *)&self->_persistentStateManager, 0);
  objc_storeStrong((id *)&self->_notificationListStalenessEventTracker, 0);
  objc_storeStrong((id *)&self->_supplementaryCache, 0);
  objc_storeStrong((id *)&self->_notificationSummaryCache, 0);
  objc_storeStrong((id *)&self->_notificationListCache, 0);
  objc_storeStrong((id *)&self->_activeDNDModeConfiguration, 0);
  objc_storeStrong((id *)&self->_notificationSections, 0);
  objc_storeStrong((id *)&self->_suggestionManager, 0);
  objc_storeStrong((id *)&self->_rootListView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_logDescription, 0);

  objc_storeStrong((id *)&self->_currentListDisplayStyleSetting, 0);
}

- (id)initForTesting
{
  int v3 = [[NCNotificationListView alloc] initWithModelType:objc_opt_class() purpose:@"Testing"];
  id v4 = [(NCNotificationRootList *)self initWithListView:v3];

  return v4;
}

- (void)testPromoteUpcomingDigestToCurrentDigest
{
  [(NCNotificationRootList *)self _migrateUpcomingDigestSectionListToCurrentDigestSectionList];

  [(NCNotificationRootList *)self _notificationListDidChangeContent];
}

- (void)testDigestTimerFired
{
  int v3 = [(NCNotificationRootList *)self digestScheduleManager];
  id v4 = [v3 upcomingScheduledDigestInfo];

  [(NCNotificationRootList *)self publishScheduledDigest:v4 upcomingDigest:v4];
}

- (void)testDigestTimerUpdated
{
  int v3 = [(NCNotificationRootList *)self digestScheduleManager];
  id v4 = [v3 upcomingScheduledDigestInfo];

  [(NCNotificationRootList *)self publishUpcomingDigest:v4];
}

- (void)testDigestTimerRevoke
{
  int v3 = [(NCNotificationRootList *)self digestScheduleManager];
  id v4 = [v3 upcomingScheduledDigestInfo];

  [(NCNotificationRootList *)self revokeUpcomingDigest:v4];
}

- (void)testClearPersistentStateManagerForTesting
{
}

- (void)setOnboardingSummaryVisible:(void *)a1 .cold.1(void *a1)
{
  id v2 = a1;
  int v3 = [(id)OUTLINED_FUNCTION_1() logDescription];
  OUTLINED_FUNCTION_0(&dword_1D7C04000, v4, v5, "%{public}@ not creating onboarding summary because notification count is %lu", v6, v7, v8, v9, 2u);
}

- (void)setOnboardingSummaryVisible:(void *)a1 .cold.2(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = a1;
  uint64_t v4 = [a2 logDescription];
  int v5 = 138543362;
  uint64_t v6 = v4;
  _os_log_error_impl(&dword_1D7C04000, v3, OS_LOG_TYPE_ERROR, "%{public}@ tried to create onboarding summary while a current digest already exists!", (uint8_t *)&v5, 0xCu);
}

- (void)removeNotificationRequest:(void *)a1 .cold.1(void *a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  int v3 = a1;
  [a2 logDescription];
  objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [(id)OUTLINED_FUNCTION_1() notificationIdentifier];
  int v5 = objc_msgSend(v4, "un_logDigest");
  int v6 = 138543618;
  uint64_t v7 = a2;
  __int16 v8 = 2114;
  uint64_t v9 = v5;
  _os_log_error_impl(&dword_1D7C04000, v3, OS_LOG_TYPE_ERROR, "%{public}@ notification request %{public}@ has empty requestDestinations! Please check with client or UN.", (uint8_t *)&v6, 0x16u);
}

void __91__NCNotificationRootList__higherSectionToElevateForNotificationRequest_currentSectionType___block_invoke_cold_1(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [(id)OUTLINED_FUNCTION_1() logDescription];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_1D7C04000, v5, v6, "%{public}@ Can't map %{public}@ to NCNotificationListSectionType enum!", v7, v8, v9, v10, v11);
}

- (void)_configureUpcomingDigestSectionListWithDigestInfo:(id *)a3 .cold.1(void *a1, uint64_t a2, id *a3)
{
  id v5 = a1;
  uint64_t v6 = [(id)OUTLINED_FUNCTION_1() logDescription];
  uint64_t v7 = [*a3 logDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1D7C04000, v8, v9, "%{public}@ configuring a new upcoming section while one already exists %{public}@", v10, v11, v12, v13, v14);
}

- (void)_configureCurrentDigestSectionListWithDigestInfo:(void *)a1 sectionType:(uint64_t)a2 summaryOrderProviderType:(id *)a3 .cold.1(void *a1, uint64_t a2, id *a3)
{
  id v5 = a1;
  uint64_t v6 = [(id)OUTLINED_FUNCTION_1() logDescription];
  uint64_t v7 = [*a3 logDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1D7C04000, v8, v9, "%{public}@ configuring a new current digest section while one already exists %{public}@", v10, v11, v12, v13, v14);
}

@end