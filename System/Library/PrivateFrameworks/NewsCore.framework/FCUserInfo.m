@interface FCUserInfo
+ (BOOL)requiresBatchedSync;
+ (BOOL)requiresHighPriorityFirstSync;
+ (BOOL)requiresPushNotificationSupport;
+ (id)backingRecordIDs;
+ (id)backingRecordZoneIDs;
+ (id)commandStoreFileName;
+ (id)commandsToMergeLocalDataToCloud:(id)a3 privateDataDirectory:(id)a4;
+ (id)desiredKeys;
+ (id)localStoreFilename;
+ (id)overrideFeldsparID;
+ (id)userInfoCKRecordFromUserInfoDictionary:(uint64_t)a1;
+ (int64_t)commandQueueUrgency;
+ (unint64_t)localStoreVersion;
+ (unint64_t)progressivePersonalization;
- (BOOL)canHelpRestoreZoneName:(id)a3;
- (BOOL)endOfAudioTrackNotificationsEnabled;
- (BOOL)hasShownProgressivePersonalizationWelcomeBrick;
- (BOOL)isUsingPlaceholderFSID;
- (BOOL)marketingNotificationsEnabled;
- (BOOL)mightNeedToUpdateOnboardingVersion;
- (BOOL)newIssueNotificationsEnabled;
- (BOOL)puzzleNotificationsEnabled;
- (BOOL)shouldShowDefaultForYou;
- (BOOL)useParsecResults;
- (BOOL)userHasCompletedFavoritesSetup;
- (FCPuzzleTypeSettings)puzzleTypeSettings;
- (FCTagSettings)tagSettings;
- (FCUserInfo)initWithContext:(id)a3 pushNotificationCenter:(id)a4 storeDirectory:(id)a5;
- (NSDate)aLaCarteSubscriptionMeteredCountLastResetDate;
- (NSDate)appLaunchUpsellLastSeenDate;
- (NSDate)appReviewRequestLastShownDate;
- (NSDate)bundleSubscriptionMeteredCountLastResetDate;
- (NSDate)dateLastOpened;
- (NSDate)dateLastViewedSaved;
- (NSDate)dateLastViewedSharedWithYou;
- (NSDate)newsletterSignupLastSeenDate;
- (NSDate)postPurchaseOnboardingLastShownDate;
- (NSDate)puzzleNotificationsLastChangedDate;
- (NSDate)puzzleStatsStartDate;
- (NSDate)shortcutsOnboardingStateCompletedDate;
- (NSDate)sportsFavoritesLastModifiedDate;
- (NSDate)sportsOnboardingCompletedDate;
- (NSDate)sportsSyncStateLastSavedDate;
- (NSDate)userStartDate;
- (NSNumber)monthlyALaCarteSubscriptionMeteredCount;
- (NSNumber)monthlyBundleSubscriptionMeteredCount;
- (NSNumber)onboardingVersionNumber;
- (NSNumber)upsellAppLaunchCount;
- (NSString)adsUserID;
- (NSString)appLaunchUpsellLastPresenterBundleID;
- (NSString)appLaunchUpsellLastShownCampaignID;
- (NSString)canonicalLanguage;
- (NSString)editorialArticleVersion;
- (NSString)feldsparID;
- (NSString)lastAppLaunchUpsellInstanceID;
- (NSString)notificationsUserID;
- (NSString)sportsUserID;
- (double)ageOfPlaceholderFSID;
- (id)_temporaryUserIDForKey:(uint64_t)a1;
- (id)_userInfoValueForKey:(id *)a1;
- (id)allKnownRecordNamesWithinRecordZoneWithID:(id)a3;
- (id)asCKRecord;
- (id)recordsForRestoringZoneName:(id)a3;
- (int64_t)shortcutsOnboardingState;
- (int64_t)sportsOnboardingState;
- (int64_t)sportsSyncState;
- (uint64_t)_modifyUserInfoWithBlock:(uint64_t)result;
- (uint64_t)_shouldRotateAdsUserIDWithCreatedDate:(id *)a1;
- (unint64_t)progressivePersonalization;
- (unint64_t)sportsTopicNotificationsEnabledState;
- (void)_clearTemporaryUserIDForKey:(uint64_t)a1;
- (void)_generateTemporaryUserIDIfNeededForKey:(uint64_t)a1;
- (void)_persistAdsUserID:(void *)a3 createdDate:;
- (void)_persistSportsUserID:(id *)a1;
- (void)_setUserInfoValue:(void *)a3 forKey:;
- (void)accessTokenDidChangeForTagID:(id)a3;
- (void)accessTokenRemovedForTagID:(id)a3 userInitiated:(BOOL)a4;
- (void)addObserver:(id)a3;
- (void)handleSyncWithChangedRecords:(id)a3 deletedRecordNames:(id)a4;
- (void)handleSyncWithUserInfoRecord:(id *)a1;
- (void)loadFeldsparIDWithCompletion:(id)a3;
- (void)loadLocalCachesFromStore;
- (void)markSavedAsViewed;
- (void)markSharedWithYouAsViewed;
- (void)maybeUpdateOnboardingVersion:(id)a3;
- (void)prepareForUse;
- (void)refreshOnboardingVersion:(id)a3;
- (void)removeObserver:(id)a3;
- (void)resetPuzzleNotificationsState;
- (void)resetSportsID;
- (void)resetUserIDs;
- (void)setALaCarteSubscriptionMeteredCountLastResetDate:(id)a3;
- (void)setAdsUserID:(id)a3;
- (void)setAppLaunchUpsellLastPresenterBundleID:(id)a3;
- (void)setAppLaunchUpsellLastSeenDate:(id)a3;
- (void)setAppLaunchUpsellLastShownCampaignID:(id)a3;
- (void)setAppReviewRequestLastShownDate:(id)a3;
- (void)setBundleSubscriptionMeteredCountLastResetDate:(id)a3;
- (void)setCanonicalLanguage:(id)a3;
- (void)setDateLastOpened:(id)a3;
- (void)setEditorialArticleVersion:(id)a3;
- (void)setEndOfAudioTrackNotificationsEnabled:(BOOL)a3;
- (void)setFeldsparID:(id)a3;
- (void)setHasShownProgressivePersonalizationWelcomeBrick:(BOOL)a3;
- (void)setLastAppLaunchUpsellInstanceID:(id)a3;
- (void)setMarketingNotificationsEnabled:(BOOL)a3;
- (void)setMonthlyALaCarteSubscriptionMeteredCount:(id)a3;
- (void)setMonthlyBundleSubscriptionMeteredCount:(id)a3;
- (void)setNewIssueNotificationsEnabled:(BOOL)a3;
- (void)setNewsletterSignupLastSeenDate:(id)a3;
- (void)setOnboardingVersionNumber:(id)a3;
- (void)setPostPurchaseOnboardingLastShownDate:(id)a3;
- (void)setPuzzleNotificationsEnabled:(BOOL)a3 userTriggered:(BOOL)a4;
- (void)setPuzzleStatsStartDate:(id)a3;
- (void)setPuzzleTypeSettings:(id)a3;
- (void)setReadOnlyUserInfo:(uint64_t)a1;
- (void)setShortcutsOnboardingState:(int64_t)a3;
- (void)setSportsFavoritesLastModifiedDate:(id)a3;
- (void)setSportsOnboardingState:(int64_t)a3;
- (void)setSportsSyncState:(int64_t)a3;
- (void)setSportsTopicNotificationsEnabledState:(unint64_t)a3;
- (void)setSportsUserID:(id)a3;
- (void)setTagSettings:(id)a3;
- (void)setUpsellAppLaunchCount:(id)a3;
- (void)setUserHasCompletedFavoritesSetup:(BOOL)a3;
- (void)setUserStartDate:(id)a3;
- (void)settingsDataDidChangeForPuzzleTypeID:(id)a3;
- (void)syncWithCompletion:(id)a3;
- (void)updateOnboardingVersion;
@end

@implementation FCUserInfo

- (unint64_t)progressivePersonalization
{
  v2 = objc_opt_class();
  return [v2 progressivePersonalization];
}

- (int64_t)sportsSyncState
{
  v2 = -[FCUserInfo _userInfoValueForKey:]((id *)&self->super.super.isa, @"sportsSyncState");
  int64_t v3 = [v2 integerValue];

  return v3;
}

- (id)_userInfoValueForKey:(id *)a1
{
  id v3 = a2;
  if (a1)
  {
    [a1 assertReadyForUse];
    uint64_t v9 = 0;
    v10 = &v9;
    uint64_t v11 = 0x3032000000;
    v12 = __Block_byref_object_copy__25;
    v13 = __Block_byref_object_dispose__25;
    id v14 = 0;
    id v4 = a1[16];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __35__FCUserInfo__userInfoValueForKey___block_invoke;
    v6[3] = &unk_1E5B4C230;
    v8 = &v9;
    v6[4] = a1;
    id v7 = v3;
    [v4 performReadSync:v6];

    a1 = (id *)(id)v10[5];
    _Block_object_dispose(&v9, 8);
  }
  return a1;
}

void __35__FCUserInfo__userInfoValueForKey___block_invoke(void *a1)
{
  v2 = (void *)a1[4];
  if (v2) {
    v2 = (void *)v2[15];
  }
  uint64_t v3 = a1[5];
  id v7 = v2;
  uint64_t v4 = [v7 objectForKeyedSubscript:v3];
  uint64_t v5 = *(void *)(a1[6] + 8);
  v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (NSDate)userStartDate
{
  return (NSDate *)-[FCUserInfo _userInfoValueForKey:]((id *)&self->super.super.isa, @"userStartDate");
}

+ (unint64_t)localStoreVersion
{
  return 2;
}

+ (id)localStoreFilename
{
  return @"userinfo";
}

+ (id)commandStoreFileName
{
  return @"userinfo-commands";
}

+ (int64_t)commandQueueUrgency
{
  return 2;
}

+ (unint64_t)progressivePersonalization
{
  v2 = (void *)CFPreferencesCopyAppValue(@"AppCanShowSiriSuggestionsBlacklist", @"com.apple.suggestions");
  int v3 = [v2 containsObject:@"com.apple.news"];

  if (v3) {
    return 1;
  }
  else {
    return 2;
  }
}

- (int64_t)sportsOnboardingState
{
  v2 = -[FCUserInfo _userInfoValueForKey:]((id *)&self->super.super.isa, @"sportsOnboardingState");
  int64_t v3 = [v2 integerValue];

  return v3;
}

- (void)maybeUpdateOnboardingVersion:(id)a3
{
  uint64_t v4 = (void (**)(id, void))a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __43__FCUserInfo_maybeUpdateOnboardingVersion___block_invoke;
  aBlock[3] = &unk_1E5B4C090;
  aBlock[4] = self;
  uint64_t v5 = (unsigned int (**)(void))_Block_copy(aBlock);
  if (v5[2]())
  {
    if (v4) {
      v4[2](v4, 0);
    }
  }
  else
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __43__FCUserInfo_maybeUpdateOnboardingVersion___block_invoke_2;
    v6[3] = &unk_1E5B51300;
    id v7 = v5;
    v8 = v4;
    v6[4] = self;
    [(FCPrivateDataController *)self performFirstSyncWithCallbackQueue:MEMORY[0x1E4F14428] completion:v6];
  }
}

void __43__FCUserInfo_maybeUpdateOnboardingVersion___block_invoke_2(uint64_t a1)
{
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 40) + 16))())
  {
    uint64_t v2 = *(void *)(a1 + 48);
    if (v2)
    {
      int64_t v3 = *(void (**)(void))(v2 + 16);
      v3();
    }
  }
  else
  {
    id v5 = [*(id *)(a1 + 32) onboardingVersionNumber];
    if (v5)
    {
      if ([v5 integerValue] < 5)
      {
        [*(id *)(a1 + 32) setMarketingNotificationsEnabled:1];
        [*(id *)(a1 + 32) setOnboardingVersionNumber:&unk_1EF8D7B30];
      }
      if ([v5 integerValue] <= 5)
      {
        [*(id *)(a1 + 32) setEndOfAudioTrackNotificationsEnabled:1];
        [*(id *)(a1 + 32) setOnboardingVersionNumber:&unk_1EF8D7B48];
      }
    }
    uint64_t v4 = *(void *)(a1 + 48);
    if (v4) {
      (*(void (**)(uint64_t, void))(v4 + 16))(v4, 0);
    }
  }
}

uint64_t __43__FCUserInfo_maybeUpdateOnboardingVersion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) mightNeedToUpdateOnboardingVersion] ^ 1;
}

- (BOOL)mightNeedToUpdateOnboardingVersion
{
  int64_t v3 = [(FCUserInfo *)self onboardingVersionNumber];
  uint64_t v4 = [v3 integerValue];

  if (v4 > 6) {
    return 0;
  }
  v6 = [(FCUserInfo *)self onboardingVersionNumber];
  uint64_t v7 = [v6 integerValue];

  return v7 != 6;
}

- (NSNumber)onboardingVersionNumber
{
  return (NSNumber *)-[FCUserInfo _userInfoValueForKey:]((id *)&self->super.super.isa, @"finishFirstLaunchVersion");
}

- (void)setSportsTopicNotificationsEnabledState:(unint64_t)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  [MEMORY[0x1E4F29060] isMainThread];
  unint64_t v5 = [(FCUserInfo *)self sportsTopicNotificationsEnabledState];
  if (v5 != a3)
  {
    unint64_t v6 = v5;
    uint64_t v7 = FCPushNotificationsLog;
    if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      unint64_t v25 = v6;
      __int16 v26 = 2048;
      unint64_t v27 = a3;
      _os_log_impl(&dword_1A460D000, v7, OS_LOG_TYPE_DEFAULT, "Changing the sports topic notifications from: %ld to: %ld", buf, 0x16u);
    }
    v8 = [NSNumber numberWithInteger:a3];
    -[FCUserInfo _setUserInfoValue:forKey:]((uint64_t)self, v8, @"sportsTopicNotificationsEnabledState2");

    uint64_t v9 = [FCModifyUserInfoCommand alloc];
    v10 = -[FCUserInfo asCKRecord]((id *)&self->super.super.isa);
    uint64_t v11 = [(FCModifyUserInfoCommand *)v9 initWithUserInfoRecord:v10];

    [(FCPrivateDataController *)self addCommandToCommandQueue:v11];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    v12 = [(FCPrivateDataController *)self observers];
    v13 = (void *)[v12 copy];

    uint64_t v14 = [v13 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v20;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v20 != v16) {
            objc_enumerationMutation(v13);
          }
          v18 = *(void **)(*((void *)&v19 + 1) + 8 * v17);
          if (objc_opt_respondsToSelector()) {
            [v18 userInfoDidChangeSportsTopicNotificationsEnabledState:self fromCloud:0];
          }
          ++v17;
        }
        while (v15 != v17);
        uint64_t v15 = [v13 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v15);
    }
  }
}

- (unint64_t)sportsTopicNotificationsEnabledState
{
  uint64_t v2 = -[FCUserInfo _userInfoValueForKey:]((id *)&self->super.super.isa, @"sportsTopicNotificationsEnabledState2");
  unint64_t v3 = [v2 integerValue];

  return v3;
}

- (int64_t)shortcutsOnboardingState
{
  uint64_t v2 = -[FCUserInfo _userInfoValueForKey:]((id *)&self->super.super.isa, @"shortcutsOnboardingState");
  int64_t v3 = [v2 integerValue];

  return v3;
}

- (NSString)adsUserID
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  int64_t v3 = -[FCUserInfo _userInfoValueForKey:]((id *)&self->super.super.isa, @"adsUserID");
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    -[FCUserInfo _temporaryUserIDForKey:]((uint64_t)self, @"adsUserID");
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
      {
        uint64_t v7 = (void *)[[NSString alloc] initWithFormat:@"Ads user ID was requested from UserInfo before a temporary one had been generated"];
        int v8 = 136315906;
        uint64_t v9 = "-[FCUserInfo adsUserID]";
        __int16 v10 = 2080;
        uint64_t v11 = "FCUserInfo.m";
        __int16 v12 = 1024;
        int v13 = 396;
        __int16 v14 = 2114;
        uint64_t v15 = v7;
        _os_log_fault_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "*** Assertion failure (Identifier: MissingTemporaryAdsUserID) : %s %s:%d %{public}@", (uint8_t *)&v8, 0x26u);
      }
      id v5 = 0;
    }
  }

  return (NSString *)v5;
}

- (NSString)sportsUserID
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  int64_t v3 = -[FCUserInfo _userInfoValueForKey:]((id *)&self->super.super.isa, @"sportsUserID");
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    -[FCUserInfo _temporaryUserIDForKey:]((uint64_t)self, @"sportsUserID");
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
      {
        uint64_t v7 = (void *)[[NSString alloc] initWithFormat:@"Sports user ID was requested from UserInfo before a temporary one had been generated"];
        int v8 = 136315906;
        uint64_t v9 = "-[FCUserInfo sportsUserID]";
        __int16 v10 = 2080;
        uint64_t v11 = "FCUserInfo.m";
        __int16 v12 = 1024;
        int v13 = 409;
        __int16 v14 = 2114;
        uint64_t v15 = v7;
        _os_log_fault_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "*** Assertion failure (Identifier: MissingTemporarySportsUserID) : %s %s:%d %{public}@", (uint8_t *)&v8, 0x26u);
      }
      id v5 = 0;
    }
  }

  return (NSString *)v5;
}

- (void)loadLocalCachesFromStore
{
  int64_t v3 = [(FCPrivateDataController *)self localStore];
  uint64_t v4 = [v3 asDictionary];
  -[FCUserInfo setReadOnlyUserInfo:]((uint64_t)self, v4);

  id v5 = NewsCoreSensitiveUserDefaults();
  id v20 = [v5 stringForKey:@"widget_assigned_user_id"];

  unint64_t v6 = NewsCoreSensitiveUserDefaults();
  [v6 removeObjectForKey:@"widget_assigned_user_id"];

  if (self) {
    readOnlyUserInfo = self->_readOnlyUserInfo;
  }
  else {
    readOnlyUserInfo = 0;
  }
  int v8 = [(NSDictionary *)readOnlyUserInfo objectForKeyedSubscript:@"feldsparID"];

  uint64_t v9 = NewsCoreSensitiveUserDefaults();
  __int16 v10 = v9;
  if (v8)
  {
    [v9 removeObjectForKey:@"temporary-fsid"];

    uint64_t v11 = NewsCoreSensitiveUserDefaults();
    [v11 removeObjectForKey:@"temporary-fsid-creation-date"];
  }
  else
  {
    uint64_t v11 = [v9 objectForKey:@"temporary-fsid"];

    if (!v11)
    {
      __int16 v12 = NewsCoreSensitiveUserDefaults();
      int v13 = v12;
      if (v20)
      {
        [v12 setObject:v20 forKey:@"temporary-fsid"];
      }
      else
      {
        __int16 v14 = [MEMORY[0x1E4F29128] UUID];
        uint64_t v15 = [v14 UUIDString];
        [v13 setObject:v15 forKey:@"temporary-fsid"];
      }
      uint64_t v16 = NewsCoreSensitiveUserDefaults();
      uint64_t v17 = [MEMORY[0x1E4F1C9C8] date];
      [v16 setObject:v17 forKey:@"temporary-fsid-creation-date"];

      uint64_t v11 = 0;
    }
  }

  -[FCUserInfo _generateTemporaryUserIDIfNeededForKey:]((uint64_t)self, @"sportsUserID");
  -[FCUserInfo _generateTemporaryUserIDIfNeededForKey:]((uint64_t)self, @"adsUserID");
  v18 = [(FCUserInfo *)self tagSettings];
  [v18 loadLocalCachesFromStore];

  long long v19 = [(FCUserInfo *)self puzzleTypeSettings];
  [v19 loadLocalCachesFromStore];
}

- (id)_temporaryUserIDForKey:(uint64_t)a1
{
  if (a1)
  {
    uint64_t v2 = [@"temporary-user-id-" stringByAppendingString:a2];
    int64_t v3 = NewsCoreSensitiveUserDefaults();
    uint64_t v4 = [v3 objectForKey:v2];
  }
  else
  {
    uint64_t v4 = 0;
  }
  return v4;
}

- (void)_generateTemporaryUserIDIfNeededForKey:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    id v11 = [@"temporary-user-id-" stringByAppendingString:v3];
    uint64_t v4 = [*(id *)(a1 + 120) objectForKeyedSubscript:v3];

    id v5 = NewsCoreSensitiveUserDefaults();
    unint64_t v6 = v5;
    if (v4)
    {
      [v5 removeObjectForKey:v11];
    }
    else
    {
      uint64_t v7 = [v5 objectForKey:v11];

      unint64_t v6 = (void *)v7;
      if (!v7)
      {
        int v8 = NewsCoreSensitiveUserDefaults();
        uint64_t v9 = [MEMORY[0x1E4F29128] UUID];
        __int16 v10 = [v9 UUIDString];
        [v8 setObject:v10 forKey:v11];

        unint64_t v6 = 0;
      }
    }
  }
}

- (void)setReadOnlyUserInfo:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 120), a2);
  }
}

- (NSDate)puzzleStatsStartDate
{
  return (NSDate *)-[FCUserInfo _userInfoValueForKey:]((id *)&self->super.super.isa, @"puzzleStatsStartDate");
}

void __32__FCUserInfo_overrideFeldsparID__block_invoke()
{
  if (NFInternalBuild())
  {
    NewsCoreUserDefaults();
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    if ([v4 BOOLForKey:@"enable_overrides_user_segmentation"])
    {
      v0 = NewsCoreUserDefaults();
      uint64_t v1 = [v0 stringForKey:@"override_feldspar_id_user_segmentation"];
      uint64_t v2 = (void *)qword_1EB5D0F38;
      qword_1EB5D0F38 = v1;
    }
    else
    {
      v0 = (void *)qword_1EB5D0F38;
      qword_1EB5D0F38 = 0;
    }

    id v3 = v4;
  }
  else
  {
    id v3 = (void *)qword_1EB5D0F38;
    qword_1EB5D0F38 = 0;
  }
}

- (void)prepareForUse
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v21.receiver = self;
  v21.super_class = (Class)FCUserInfo;
  [(FCPrivateDataController *)&v21 prepareForUse];
  uint64_t v3 = [(FCUserInfo *)self notificationsUserID];
  if (!v3
    || (id v4 = (void *)v3,
        [(FCUserInfo *)self notificationsUserID],
        id v5 = objc_claimAutoreleasedReturnValue(),
        uint64_t v6 = [v5 length],
        v5,
        v4,
        !v6))
  {
    uint64_t v7 = [MEMORY[0x1E4F29128] UUID];
    int v8 = [v7 UUIDString];

    -[FCUserInfo _setUserInfoValue:forKey:]((uint64_t)self, v8, @"notificationsUserID");
    uint64_t v9 = FCPushNotificationsLog;
    if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v23 = v8;
      _os_log_impl(&dword_1A460D000, v9, OS_LOG_TYPE_INFO, "Generated a new notificationsUserID: %@", buf, 0xCu);
    }
  }
  __int16 v10 = +[FCAppleAccount sharedAccount];
  char v11 = [v10 isPrivateDataSyncingEnabled];

  if ((v11 & 1) == 0)
  {
    __int16 v12 = -[FCUserInfo _userInfoValueForKey:]((id *)&self->super.super.isa, @"notificationsUserID");
    if (([v12 hasSuffix:@"-NoSync"] & 1) == 0)
    {
      int v13 = [MEMORY[0x1E4F29128] UUID];
      __int16 v14 = [v13 UUIDString];

      __int16 v12 = [v14 stringByAppendingString:@"-NoSync"];

      -[FCUserInfo _setUserInfoValue:forKey:]((uint64_t)self, v12, @"notificationsUserID");
      uint64_t v15 = FCPushNotificationsLog;
      if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v23 = v12;
        _os_log_impl(&dword_1A460D000, v15, OS_LOG_TYPE_INFO, "Private data syncing is disabled, generated a new notificationsUserID: %@", buf, 0xCu);
      }
    }
  }
  if (self)
  {
    uint64_t v16 = -[FCUserInfo _userInfoValueForKey:]((id *)&self->super.super.isa, @"adsUserIDCreatedDate");
  }
  else
  {
    uint64_t v16 = 0;
  }
  int v17 = -[FCUserInfo _shouldRotateAdsUserIDWithCreatedDate:]((id *)&self->super.super.isa, v16);

  if (v17)
  {
    v18 = [MEMORY[0x1E4F29128] UUID];
    long long v19 = [v18 UUIDString];

    -[FCUserInfo _setUserInfoValue:forKey:]((uint64_t)self, v19, @"adsUserID");
    id v20 = [MEMORY[0x1E4F1C9C8] date];
    -[FCUserInfo _setUserInfoValue:forKey:]((uint64_t)self, v20, @"adsUserIDCreatedDate");
  }
}

- (NSString)notificationsUserID
{
  return -[FCUserInfo _userInfoValueForKey:]((id *)&self->super.super.isa, @"notificationsUserID");
}

- (uint64_t)_shouldRotateAdsUserIDWithCreatedDate:(id *)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    if (v3)
    {
      id v5 = NewsCoreUserDefaults();
      uint64_t v6 = [v5 objectForKey:@"settings.analytics.identifiers.ad_identifier_rotation_interval"];

      double v7 = 5184000.0;
      if (v6)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          double v7 = (double)[v6 integerValue] * 86400.0;
        }
      }
      int v8 = [v4 dateByAddingTimeInterval:v7];
      uint64_t v9 = [MEMORY[0x1E4F1C9C8] date];
      uint64_t v10 = objc_msgSend(v8, "fc_isEarlierThanOrEqualTo:", v9);
    }
    else
    {
      uint64_t v6 = -[FCUserInfo _userInfoValueForKey:](a1, @"adsUserID");
      uint64_t v10 = v6 != 0;
    }
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (void)addObserver:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)FCUserInfo;
  [(FCPrivateDataController *)&v3 addObserver:a3];
}

- (BOOL)isUsingPlaceholderFSID
{
  uint64_t v2 = -[FCUserInfo _userInfoValueForKey:]((id *)&self->super.super.isa, @"feldsparID");
  BOOL v3 = v2 == 0;

  return v3;
}

- (BOOL)puzzleNotificationsEnabled
{
  uint64_t v2 = -[FCUserInfo _userInfoValueForKey:]((id *)&self->super.super.isa, @"puzzleNotificationsEnabled2");
  char v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)endOfAudioTrackNotificationsEnabled
{
  uint64_t v2 = -[FCUserInfo _userInfoValueForKey:]((id *)&self->super.super.isa, @"endOfAudioNotificationsEnabled");
  char v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)newIssueNotificationsEnabled
{
  uint64_t v2 = -[FCUserInfo _userInfoValueForKey:]((id *)&self->super.super.isa, @"newIssueNotificationsEnabled");
  char v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)marketingNotificationsEnabled
{
  uint64_t v2 = -[FCUserInfo _userInfoValueForKey:]((id *)&self->super.super.isa, @"marketingNotificationsEnabled");
  char v3 = [v2 BOOLValue];

  return v3;
}

- (NSString)feldsparID
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  char v3 = +[FCUserInfo overrideFeldsparID];
  if ([v3 length])
  {
    id v4 = v3;
  }
  else
  {
    id v5 = -[FCUserInfo _userInfoValueForKey:]((id *)&self->super.super.isa, @"feldsparID");
    uint64_t v6 = v5;
    if (v5)
    {
      id v4 = v5;
    }
    else
    {
      double v7 = NewsCoreSensitiveUserDefaults();
      id v4 = [v7 objectForKey:@"temporary-fsid"];

      if (!v4)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
        {
          uint64_t v9 = (void *)[[NSString alloc] initWithFormat:@"FSID was requested from UserInfo before a temporary one had been generated"];
          int v10 = 136315906;
          char v11 = "-[FCUserInfo feldsparID]";
          __int16 v12 = 2080;
          int v13 = "FCUserInfo.m";
          __int16 v14 = 1024;
          int v15 = 358;
          __int16 v16 = 2114;
          int v17 = v9;
          _os_log_fault_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "*** Assertion failure (Identifier: MissingTemporaryFSID) : %s %s:%d %{public}@", (uint8_t *)&v10, 0x26u);
        }
        id v4 = 0;
      }
    }
  }
  return (NSString *)v4;
}

+ (id)overrideFeldsparID
{
  if (qword_1EB5D0F40 != -1) {
    dispatch_once(&qword_1EB5D0F40, &__block_literal_global_171);
  }
  uint64_t v2 = (void *)qword_1EB5D0F38;
  return v2;
}

- (NSDate)puzzleNotificationsLastChangedDate
{
  return (NSDate *)-[FCUserInfo _userInfoValueForKey:]((id *)&self->super.super.isa, @"puzzleNotificationsLastChangedDate");
}

- (NSString)canonicalLanguage
{
  return -[FCUserInfo _userInfoValueForKey:]((id *)&self->super.super.isa, @"canonicalLanguage");
}

- (void)setDateLastOpened:(id)a3
{
  id v11 = a3;
  [MEMORY[0x1E4F29060] isMainThread];
  id v4 = [(FCUserInfo *)self dateLastOpened];
  id v5 = v4;
  if (!v4
    || ([v4 dateByAddingTimeInterval:86400.0],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        int v7 = objc_msgSend(v11, "fc_isLaterThan:", v6),
        v6,
        v7))
  {
    -[FCUserInfo _setUserInfoValue:forKey:]((uint64_t)self, v11, @"lastOpenedDate");
    int v8 = [FCModifyUserInfoCommand alloc];
    uint64_t v9 = -[FCUserInfo asCKRecord]((id *)&self->super.super.isa);
    int v10 = [(FCModifyUserInfoCommand *)v8 initWithUserInfoRecord:v9];

    [(FCPrivateDataController *)self addCommandToCommandQueue:v10];
  }
}

- (NSDate)dateLastOpened
{
  return (NSDate *)-[FCUserInfo _userInfoValueForKey:]((id *)&self->super.super.isa, @"lastOpenedDate");
}

- (FCTagSettings)tagSettings
{
  return self->_tagSettings;
}

- (FCPuzzleTypeSettings)puzzleTypeSettings
{
  return self->_puzzleTypeSettings;
}

- (FCUserInfo)initWithContext:(id)a3 pushNotificationCenter:(id)a4 storeDirectory:(id)a5
{
  v17.receiver = self;
  v17.super_class = (Class)FCUserInfo;
  id v5 = [(FCPrivateDataController *)&v17 initWithContext:a3 pushNotificationCenter:a4 storeDirectory:a5];
  if (v5)
  {
    uint64_t v6 = [FCTagSettings alloc];
    int v7 = [(FCPrivateDataController *)v5 localStore];
    uint64_t v8 = [(FCTagSettings *)v6 initWithStore:v7 tagSettingsDelegate:v5];
    tagSettings = v5->_tagSettings;
    v5->_tagSettings = (FCTagSettings *)v8;

    int v10 = [FCPuzzleTypeSettings alloc];
    id v11 = [(FCPrivateDataController *)v5 localStore];
    uint64_t v12 = [(FCPuzzleTypeSettings *)v10 initWithStore:v11 delegate:v5];
    puzzleTypeSettings = v5->_puzzleTypeSettings;
    v5->_puzzleTypeSettings = (FCPuzzleTypeSettings *)v12;

    __int16 v14 = objc_alloc_init(FCMTWriterLock);
    userInfoLock = v5->_userInfoLock;
    v5->_userInfoLock = v14;
  }
  return v5;
}

- (void)loadFeldsparIDWithCompletion:(id)a3
{
  id v4 = (void (**)(void))a3;
  [MEMORY[0x1E4F29060] isMainThread];
  id v5 = -[FCUserInfo _userInfoValueForKey:]((id *)&self->super.super.isa, @"feldsparID");

  if (v5)
  {
    v9[1] = MEMORY[0x1E4F143A8];
    v9[2] = 3221225472;
    v9[3] = __43__FCUserInfo_loadFeldsparIDWithCompletion___block_invoke;
    v9[4] = &unk_1E5B4CA88;
    uint64_t v6 = (id *)&v10;
    int v10 = v4;
    v4[2](v4);
  }
  else
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __43__FCUserInfo_loadFeldsparIDWithCompletion___block_invoke_2;
    v8[3] = &unk_1E5B4EC68;
    uint64_t v6 = (id *)v9;
    v8[4] = self;
    v9[0] = v4;
    int v7 = v4;
    [(FCPrivateDataController *)self performFirstSyncWithCallbackQueue:MEMORY[0x1E4F14428] completion:v8];
  }
}

- (void)_setUserInfoValue:(void *)a3 forKey:
{
  id v5 = a2;
  id v6 = a3;
  int v7 = v6;
  if (a1)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __39__FCUserInfo__setUserInfoValue_forKey___block_invoke;
    v8[3] = &unk_1E5B51328;
    id v9 = v6;
    id v10 = v5;
    -[FCUserInfo _modifyUserInfoWithBlock:](a1, v8);
  }
}

+ (id)desiredKeys
{
  if (qword_1EB5D0F30 != -1) {
    dispatch_once(&qword_1EB5D0F30, &__block_literal_global_83);
  }
  uint64_t v2 = (void *)_MergedGlobals_13;
  return v2;
}

void __25__FCUserInfo_desiredKeys__block_invoke()
{
  v0 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v1 = __FCCKUserInfoKeys_block_invoke();
  [v0 addObjectsFromArray:v1];

  uint64_t v2 = __FCCKTagSettingsKeys_block_invoke();
  [v0 addObjectsFromArray:v2];

  char v3 = __FCCKPuzzleTypeSettingsKeys_block_invoke();
  [v0 addObjectsFromArray:v3];

  id v4 = (void *)_MergedGlobals_13;
  _MergedGlobals_13 = (uint64_t)v0;
}

- (void)setOnboardingVersionNumber:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [MEMORY[0x1E4F29060] isMainThread];
  id v5 = (void *)FCDefaultLog;
  if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_INFO))
  {
    id v6 = v5;
    int v7 = NSStringFromFCOnboardingVersionNumber([v4 integerValue]);
    *(_DWORD *)buf = 138412546;
    id v27 = v4;
    __int16 v28 = 2112;
    v29 = v7;
    _os_log_impl(&dword_1A460D000, v6, OS_LOG_TYPE_INFO, "Onboarding version number being set to %@ (%@)", buf, 0x16u);
  }
  if ([v4 intValue] == 4)
  {
    uint64_t v8 = [(FCUserInfo *)self onboardingVersionNumber];
    int v9 = [v8 intValue];

    if (v9 == 3)
    {
      id v10 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
      [v10 setBool:1 forKey:@"onboarding_completed_from_personalize_news"];
    }
  }
  -[FCUserInfo _setUserInfoValue:forKey:]((uint64_t)self, v4, @"finishFirstLaunchVersion");
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v11 = [(FCPrivateDataController *)self observers];
  uint64_t v12 = (void *)[v11 copy];

  uint64_t v13 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v22;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v22 != v15) {
          objc_enumerationMutation(v12);
        }
        objc_super v17 = *(void **)(*((void *)&v21 + 1) + 8 * v16);
        if (objc_opt_respondsToSelector()) {
          [v17 userInfoDidChangeOnboardingStatus:self];
        }
        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v14);
  }

  uint64_t v18 = [FCModifyUserInfoCommand alloc];
  long long v19 = -[FCUserInfo asCKRecord]((id *)&self->super.super.isa);
  id v20 = [(FCModifyUserInfoCommand *)v18 initWithUserInfoRecord:v19];

  [(FCPrivateDataController *)self addCommandToCommandQueue:v20];
}

- (id)asCKRecord
{
  uint64_t v1 = a1;
  if (a1)
  {
    uint64_t v5 = 0;
    id v6 = &v5;
    uint64_t v7 = 0x3032000000;
    uint64_t v8 = __Block_byref_object_copy__25;
    int v9 = __Block_byref_object_dispose__25;
    id v10 = 0;
    id v2 = a1[16];
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __24__FCUserInfo_asCKRecord__block_invoke;
    v4[3] = &unk_1E5B4C258;
    v4[4] = v1;
    v4[5] = &v5;
    [v2 performReadSync:v4];

    uint64_t v1 = (id *)(id)v6[5];
    _Block_object_dispose(&v5, 8);
  }
  return v1;
}

uint64_t __43__FCUserInfo_loadFeldsparIDWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __43__FCUserInfo_loadFeldsparIDWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    uint64_t v24 = MEMORY[0x1E4F143A8];
    uint64_t v25 = 3221225472;
    __int16 v26 = __43__FCUserInfo_loadFeldsparIDWithCompletion___block_invoke_3;
    id v27 = &unk_1E5B4CA88;
    __int16 v28 = (void (**)(void))*(id *)(a1 + 40);
    v28[2]();
    id v4 = (FCModifyUserInfoCommand *)v28;
  }
  else
  {
    uint64_t v5 = -[FCUserInfo _userInfoValueForKey:](*(id **)(a1 + 32), @"feldsparID");

    if (v5)
    {
      uint64_t v19 = MEMORY[0x1E4F143A8];
      uint64_t v20 = 3221225472;
      long long v21 = __43__FCUserInfo_loadFeldsparIDWithCompletion___block_invoke_4;
      long long v22 = &unk_1E5B4CA88;
      long long v23 = (void (**)(void))*(id *)(a1 + 40);
      v23[2]();
      id v4 = (FCModifyUserInfoCommand *)v23;
    }
    else
    {
      -[FCUserInfo _modifyUserInfoWithBlock:](*(void *)(a1 + 32), &__block_literal_global_92);
      id v6 = [FCModifyUserInfoCommand alloc];
      uint64_t v7 = -[FCUserInfo asCKRecord](*(id **)(a1 + 32));
      id v4 = [(FCModifyUserInfoCommand *)v6 initWithUserInfoRecord:v7];

      [*(id *)(a1 + 32) addCommandToCommandQueue:v4];
      long long v17 = 0u;
      long long v18 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      uint64_t v8 = objc_msgSend(*(id *)(a1 + 32), "observers", 0);
      int v9 = (void *)[v8 copy];

      uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v29 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v16;
        do
        {
          uint64_t v13 = 0;
          do
          {
            if (*(void *)v16 != v12) {
              objc_enumerationMutation(v9);
            }
            uint64_t v14 = *(void **)(*((void *)&v15 + 1) + 8 * v13);
            if (objc_opt_respondsToSelector()) {
              [v14 userInfoDidChangeFeldsparID:*(void *)(a1 + 32) fromCloud:0];
            }
            ++v13;
          }
          while (v11 != v13);
          uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v29 count:16];
        }
        while (v11);
      }

      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
}

uint64_t __43__FCUserInfo_loadFeldsparIDWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __43__FCUserInfo_loadFeldsparIDWithCompletion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __43__FCUserInfo_loadFeldsparIDWithCompletion___block_invoke_5(uint64_t a1, void *a2)
{
  id v2 = a2;
  char v3 = NewsCoreSensitiveUserDefaults();
  id v4 = [v3 objectForKey:@"temporary-fsid"];
  uint64_t v5 = v4;
  if (v4)
  {
    id v7 = v4;
  }
  else
  {
    id v6 = [MEMORY[0x1E4F29128] UUID];
    id v7 = [v6 UUIDString];
  }
  [v2 setObject:v7 forKeyedSubscript:@"feldsparID"];
}

- (uint64_t)_modifyUserInfoWithBlock:(uint64_t)result
{
  if (result)
  {
    id v2 = (void *)result;
    char v3 = (void *)MEMORY[0x1E4F29060];
    id v4 = a2;
    [v3 isMainThread];
    uint64_t v5 = [v2 localStore];
    v4[2](v4, v5);

    id v6 = (void *)v2[16];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __39__FCUserInfo__modifyUserInfoWithBlock___block_invoke;
    v7[3] = &unk_1E5B4C018;
    v7[4] = v2;
    return [v6 performWriteSync:v7];
  }
  return result;
}

- (void)resetUserIDs
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  [MEMORY[0x1E4F29060] isMainThread];
  char v3 = FCUserInfoLog;
  if (os_log_type_enabled((os_log_t)FCUserInfoLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A460D000, v3, OS_LOG_TYPE_DEFAULT, "Resetting user IDs", buf, 2u);
  }
  -[FCUserInfo _modifyUserInfoWithBlock:]((uint64_t)self, &__block_literal_global_97);
  id v4 = NewsCoreSensitiveUserDefaults();
  [v4 removeObjectForKey:@"temporary-fsid"];

  uint64_t v5 = NewsCoreSensitiveUserDefaults();
  [v5 removeObjectForKey:@"temporary-fsid-creation-date"];

  id v6 = NewsCoreSensitiveUserDefaults();
  [v6 removeObjectForKey:@"report_concern_user_id"];

  -[FCUserInfo _clearTemporaryUserIDForKey:]((uint64_t)self, @"sportsUserID");
  -[FCUserInfo _clearTemporaryUserIDForKey:]((uint64_t)self, @"adsUserID");
  id v7 = [FCModifyUserInfoCommand alloc];
  uint64_t v8 = -[FCUserInfo asCKRecord]((id *)&self->super.super.isa);
  uint64_t v9 = [(FCModifyUserInfoCommand *)v7 initWithUserInfoRecord:v8];

  long long v17 = (void *)v9;
  [(FCPrivateDataController *)self addCommandToCommandQueue:v9];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v10 = [(FCPrivateDataController *)self observers];
  uint64_t v11 = (void *)[v10 copy];

  uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v19;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v11);
        }
        long long v16 = *(void **)(*((void *)&v18 + 1) + 8 * v15);
        if (objc_opt_respondsToSelector()) {
          [v16 userInfoDidChangeFeldsparID:self fromCloud:0];
        }
        if (objc_opt_respondsToSelector()) {
          [v16 userInfoDidChangeAdsUserID:self fromCloud:0];
        }
        if (objc_opt_respondsToSelector()) {
          [v16 userInfoDidChangeSportsUserID:self];
        }
        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v13);
  }
}

void __26__FCUserInfo_resetUserIDs__block_invoke(uint64_t a1, void *a2)
{
  id v2 = (void *)MEMORY[0x1E4F29128];
  id v3 = a2;
  id v4 = [v2 UUID];
  uint64_t v5 = [v4 UUIDString];
  [v3 setObject:v5 forKeyedSubscript:@"feldsparID"];

  id v6 = [MEMORY[0x1E4F29128] UUID];
  id v7 = [v6 UUIDString];
  [v3 setObject:v7 forKeyedSubscript:@"adsUserID"];

  id v9 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v8 = [v9 UUIDString];
  [v3 setObject:v8 forKeyedSubscript:@"sportsUserID"];
}

- (void)_clearTemporaryUserIDForKey:(uint64_t)a1
{
  if (a1)
  {
    id v3 = [@"temporary-user-id-" stringByAppendingString:a2];
    id v2 = NewsCoreSensitiveUserDefaults();
    [v2 removeObjectForKey:v3];
  }
}

- (void)resetSportsID
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  [MEMORY[0x1E4F29060] isMainThread];
  id v3 = FCUserInfoLog;
  if (os_log_type_enabled((os_log_t)FCUserInfoLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A460D000, v3, OS_LOG_TYPE_DEFAULT, "Resetting Sports ID", buf, 2u);
  }
  -[FCUserInfo _modifyUserInfoWithBlock:]((uint64_t)self, &__block_literal_global_103);
  -[FCUserInfo _clearTemporaryUserIDForKey:]((uint64_t)self, @"sportsUserID");
  id v4 = [FCModifyUserInfoCommand alloc];
  uint64_t v5 = -[FCUserInfo asCKRecord]((id *)&self->super.super.isa);
  id v6 = [(FCModifyUserInfoCommand *)v4 initWithUserInfoRecord:v5];

  [(FCPrivateDataController *)self addCommandToCommandQueue:v6];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = [(FCPrivateDataController *)self observers];
  uint64_t v8 = (void *)[v7 copy];

  uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v14 + 1) + 8 * v12);
        if (objc_opt_respondsToSelector()) {
          [v13 userInfoDidChangeSportsUserID:self];
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v19 count:16];
    }
    while (v10);
  }
}

void __27__FCUserInfo_resetSportsID__block_invoke(uint64_t a1, void *a2)
{
  id v2 = (void *)MEMORY[0x1E4F29128];
  id v3 = a2;
  id v5 = [v2 UUID];
  id v4 = [v5 UUIDString];
  [v3 setObject:v4 forKeyedSubscript:@"sportsUserID"];
}

- (void)setFeldsparID:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [MEMORY[0x1E4F29060] isMainThread];
  -[FCUserInfo _setUserInfoValue:forKey:]((uint64_t)self, v4, @"feldsparID");
  id v5 = [FCModifyUserInfoCommand alloc];
  id v6 = -[FCUserInfo asCKRecord]((id *)&self->super.super.isa);
  id v7 = [(FCModifyUserInfoCommand *)v5 initWithUserInfoRecord:v6];

  [(FCPrivateDataController *)self addCommandToCommandQueue:v7];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v8 = [(FCPrivateDataController *)self observers];
  uint64_t v9 = (void *)[v8 copy];

  uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v16;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v9);
        }
        long long v14 = *(void **)(*((void *)&v15 + 1) + 8 * v13);
        if (objc_opt_respondsToSelector()) {
          [v14 userInfoDidChangeFeldsparID:self fromCloud:0];
        }
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v11);
  }
}

- (double)ageOfPlaceholderFSID
{
  id v2 = NewsCoreSensitiveUserDefaults();
  id v3 = [v2 objectForKey:@"temporary-fsid-creation-date"];

  if (v3)
  {
    objc_msgSend(v3, "fc_timeIntervalUntilNow");
    double v5 = v4;
  }
  else
  {
    double v5 = 0.0;
  }

  return v5;
}

- (void)setAdsUserID:(id)a3
{
  double v4 = (void *)MEMORY[0x1E4F29060];
  id v5 = a3;
  [v4 isMainThread];
  id v6 = [MEMORY[0x1E4F1C9C8] date];
  -[FCUserInfo _persistAdsUserID:createdDate:]((id *)&self->super.super.isa, v5, v6);
}

- (void)_persistAdsUserID:(void *)a3 createdDate:
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a1)
  {
    -[FCUserInfo _setUserInfoValue:forKey:]((uint64_t)a1, a2, @"adsUserID");
    -[FCUserInfo _setUserInfoValue:forKey:]((uint64_t)a1, v5, @"adsUserIDCreatedDate");
    id v6 = [FCModifyUserInfoCommand alloc];
    id v7 = -[FCUserInfo asCKRecord](a1);
    uint64_t v8 = [(FCModifyUserInfoCommand *)v6 initWithUserInfoRecord:v7];

    [a1 addCommandToCommandQueue:v8];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v9 = objc_msgSend(a1, "observers", 0);
    uint64_t v10 = (void *)[v9 copy];

    uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v17;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v17 != v13) {
            objc_enumerationMutation(v10);
          }
          long long v15 = *(void **)(*((void *)&v16 + 1) + 8 * v14);
          if (objc_opt_respondsToSelector()) {
            [v15 userInfoDidChangeAdsUserID:a1 fromCloud:0];
          }
          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v12);
    }
  }
}

- (void)setSportsUserID:(id)a3
{
  double v4 = (void *)MEMORY[0x1E4F29060];
  id v5 = a3;
  [v4 isMainThread];
  -[FCUserInfo _persistSportsUserID:]((id *)&self->super.super.isa, v5);
}

- (void)_persistSportsUserID:(id *)a1
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    -[FCUserInfo _setUserInfoValue:forKey:]((uint64_t)a1, a2, @"sportsUserID");
    id v3 = [FCModifyUserInfoCommand alloc];
    double v4 = -[FCUserInfo asCKRecord](a1);
    id v5 = [(FCModifyUserInfoCommand *)v3 initWithUserInfoRecord:v4];

    [a1 addCommandToCommandQueue:v5];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v6 = objc_msgSend(a1, "observers", 0);
    id v7 = (void *)[v6 copy];

    uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v14;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void **)(*((void *)&v13 + 1) + 8 * v11);
          if (objc_opt_respondsToSelector()) {
            [v12 userInfoDidChangeSportsUserID:a1];
          }
          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v9);
    }
  }
}

- (NSString)editorialArticleVersion
{
  return -[FCUserInfo _userInfoValueForKey:]((id *)&self->super.super.isa, @"editorialArticleVersion");
}

- (void)setUserStartDate:(id)a3
{
  double v4 = (void *)MEMORY[0x1E4F29060];
  id v5 = a3;
  [v4 isMainThread];
  -[FCUserInfo _setUserInfoValue:forKey:]((uint64_t)self, v5, @"userStartDate");

  id v6 = [FCModifyUserInfoCommand alloc];
  id v7 = -[FCUserInfo asCKRecord]((id *)&self->super.super.isa);
  uint64_t v8 = [(FCModifyUserInfoCommand *)v6 initWithUserInfoRecord:v7];

  [(FCPrivateDataController *)self addCommandToCommandQueue:v8];
}

- (BOOL)shouldShowDefaultForYou
{
  id v2 = [(FCUserInfo *)self onboardingVersionNumber];
  uint64_t v3 = [v2 integerValue];

  return v3 == 3;
}

- (BOOL)hasShownProgressivePersonalizationWelcomeBrick
{
  id v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  int v3 = [v2 BOOLForKey:@"personalization_reset_progressive_personalization_opt_in"];

  if (v3)
  {
    double v4 = NewsCoreUserDefaults();
    [v4 setBool:0 forKey:@"has_show_personalization_brick"];

    id v5 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    [v5 setBool:0 forKey:@"personalization_reset_progressive_personalization_opt_in"];
  }
  uint64_t v6 = [(id)objc_opt_class() progressivePersonalization];
  if (v6 != 1)
  {
    id v7 = NewsCoreUserDefaults();
    char v8 = [v7 BOOLForKey:@"has_show_personalization_brick"];

    LOBYTE(v6) = v8;
  }
  return v6;
}

- (void)setHasShownProgressivePersonalizationWelcomeBrick:(BOOL)a3
{
  BOOL v3 = a3;
  NewsCoreUserDefaults();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v4 setBool:v3 forKey:@"has_show_personalization_brick"];
}

- (BOOL)userHasCompletedFavoritesSetup
{
  id v2 = NewsCoreUserDefaults();
  char v3 = [v2 BOOLForKey:@"user_has_completed_favorites_setup"];

  return v3;
}

- (void)setUserHasCompletedFavoritesSetup:(BOOL)a3
{
  BOOL v3 = a3;
  NewsCoreUserDefaults();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v4 setBool:v3 forKey:@"user_has_completed_favorites_setup"];
}

- (void)setSportsOnboardingState:(int64_t)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  [MEMORY[0x1E4F29060] isMainThread];
  id v5 = [NSNumber numberWithInteger:a3];
  -[FCUserInfo _setUserInfoValue:forKey:]((uint64_t)self, v5, @"sportsOnboardingState");

  uint64_t v6 = [MEMORY[0x1E4F1C9C8] date];
  -[FCUserInfo _setUserInfoValue:forKey:]((uint64_t)self, v6, @"sportsOnboardingCompletedDate");

  id v7 = [FCModifyUserInfoCommand alloc];
  char v8 = -[FCUserInfo asCKRecord]((id *)&self->super.super.isa);
  uint64_t v9 = [(FCModifyUserInfoCommand *)v7 initWithUserInfoRecord:v8];

  [(FCPrivateDataController *)self addCommandToCommandQueue:v9];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v10 = [(FCPrivateDataController *)self observers];
  uint64_t v11 = (void *)[v10 copy];

  uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v18;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v18 != v14) {
          objc_enumerationMutation(v11);
        }
        long long v16 = *(void **)(*((void *)&v17 + 1) + 8 * v15);
        if (objc_opt_respondsToSelector()) {
          [v16 userInfoDidChangeSportsOnboardingState:self];
        }
        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v13);
  }
}

- (void)setShortcutsOnboardingState:(int64_t)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  [MEMORY[0x1E4F29060] isMainThread];
  id v5 = [NSNumber numberWithInteger:a3];
  -[FCUserInfo _setUserInfoValue:forKey:]((uint64_t)self, v5, @"shortcutsOnboardingState");

  uint64_t v6 = [MEMORY[0x1E4F1C9C8] date];
  -[FCUserInfo _setUserInfoValue:forKey:]((uint64_t)self, v6, @"shortcutsOnboardingCompletedDate");

  id v7 = [FCModifyUserInfoCommand alloc];
  char v8 = -[FCUserInfo asCKRecord]((id *)&self->super.super.isa);
  uint64_t v9 = [(FCModifyUserInfoCommand *)v7 initWithUserInfoRecord:v8];

  [(FCPrivateDataController *)self addCommandToCommandQueue:v9];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v10 = [(FCPrivateDataController *)self observers];
  uint64_t v11 = (void *)[v10 copy];

  uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v18;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v18 != v14) {
          objc_enumerationMutation(v11);
        }
        long long v16 = *(void **)(*((void *)&v17 + 1) + 8 * v15);
        if (objc_opt_respondsToSelector()) {
          [v16 userInfoDidChangeShortcutsOnboardingState:self];
        }
        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v13);
  }
}

- (NSDate)shortcutsOnboardingStateCompletedDate
{
  return (NSDate *)-[FCUserInfo _userInfoValueForKey:]((id *)&self->super.super.isa, @"shortcutsOnboardingCompletedDate");
}

- (NSDate)sportsOnboardingCompletedDate
{
  return (NSDate *)-[FCUserInfo _userInfoValueForKey:]((id *)&self->super.super.isa, @"sportsOnboardingCompletedDate");
}

- (NSDate)sportsSyncStateLastSavedDate
{
  return (NSDate *)-[FCUserInfo _userInfoValueForKey:]((id *)&self->super.super.isa, @"sportsSyncStateLastSavedDate");
}

- (void)setSportsSyncState:(int64_t)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  [MEMORY[0x1E4F29060] isMainThread];
  id v5 = -[FCUserInfo _userInfoValueForKey:]((id *)&self->super.super.isa, @"sportsSyncState");
  uint64_t v6 = [NSNumber numberWithInteger:a3];

  id v7 = [NSNumber numberWithInteger:a3];
  -[FCUserInfo _setUserInfoValue:forKey:]((uint64_t)self, v7, @"sportsSyncState");

  char v8 = [MEMORY[0x1E4F1C9C8] date];
  -[FCUserInfo _setUserInfoValue:forKey:]((uint64_t)self, v8, @"sportsSyncStateLastSavedDate");

  uint64_t v9 = [FCModifyUserInfoCommand alloc];
  uint64_t v10 = -[FCUserInfo asCKRecord]((id *)&self->super.super.isa);
  uint64_t v11 = [(FCModifyUserInfoCommand *)v9 initWithUserInfoRecord:v10];

  [(FCPrivateDataController *)self addCommandToCommandQueue:v11];
  if (v5 != v6)
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v12 = [(FCPrivateDataController *)self observers];
    uint64_t v13 = (void *)[v12 copy];

    uint64_t v14 = [v13 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v20;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v20 != v16) {
            objc_enumerationMutation(v13);
          }
          long long v18 = *(void **)(*((void *)&v19 + 1) + 8 * v17);
          if (objc_opt_respondsToSelector()) {
            [v18 userInfoDidChangeSportsSyncState:self];
          }
          ++v17;
        }
        while (v15 != v17);
        uint64_t v15 = [v13 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v15);
    }
  }
}

- (void)setSportsFavoritesLastModifiedDate:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)FCUserInfoLog;
  if (os_log_type_enabled((os_log_t)FCUserInfoLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = v5;
    id v7 = [v4 description];
    int v11 = 138412290;
    uint64_t v12 = v7;
    _os_log_impl(&dword_1A460D000, v6, OS_LOG_TYPE_DEFAULT, "Setting sports favorites last modified date=%@", (uint8_t *)&v11, 0xCu);
  }
  -[FCUserInfo _setUserInfoValue:forKey:]((uint64_t)self, v4, @"sportsFavoritesLastModifiedDate");
  char v8 = [FCModifyUserInfoCommand alloc];
  uint64_t v9 = -[FCUserInfo asCKRecord]((id *)&self->super.super.isa);
  uint64_t v10 = [(FCModifyUserInfoCommand *)v8 initWithUserInfoRecord:v9];

  [(FCPrivateDataController *)self addCommandToCommandQueue:v10];
}

- (NSDate)sportsFavoritesLastModifiedDate
{
  return (NSDate *)-[FCUserInfo _userInfoValueForKey:]((id *)&self->super.super.isa, @"sportsFavoritesLastModifiedDate");
}

- (NSDate)newsletterSignupLastSeenDate
{
  p_isa = (id *)&self->super.super.isa;
  BOOL v3 = (void *)MEMORY[0x1E4F1CA48];
  id v4 = -[FCUserInfo _userInfoValueForKey:]((id *)&self->super.super.isa, @"newsletterSignupLastSeenDate");
  if (p_isa)
  {
    id v5 = -[FCUserInfo _userInfoValueForKey:](p_isa, @"personalizedNewsletterSignupLastSeenDate");
    -[FCUserInfo _userInfoValueForKey:](p_isa, @"issuesNewsletterOptinLastSeenDate");
    p_isa = (id *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v5 = 0;
  }
  uint64_t v6 = objc_msgSend(v3, "arrayWithObjects:", v4, v5, p_isa, 0);

  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F29008]) initWithKey:0 ascending:0];
  char v8 = [MEMORY[0x1E4F1C978] arrayWithObject:v7];
  [v6 sortUsingDescriptors:v8];

  uint64_t v9 = [v6 firstObject];

  return (NSDate *)v9;
}

- (void)setNewsletterSignupLastSeenDate:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F29060];
  id v5 = a3;
  [v4 isMainThread];
  -[FCUserInfo _setUserInfoValue:forKey:]((uint64_t)self, v5, @"newsletterSignupLastSeenDate");
  uint64_t v6 = [FCModifyUserInfoCommand alloc];
  id v7 = -[FCUserInfo asCKRecord]((id *)&self->super.super.isa);
  long long v18 = [(FCModifyUserInfoCommand *)v6 initWithUserInfoRecord:v7];

  [(FCPrivateDataController *)self addCommandToCommandQueue:v18];
  if (self)
  {
    char v8 = (void *)MEMORY[0x1E4F29060];
    id v9 = v5;
    [v8 isMainThread];
    -[FCUserInfo _setUserInfoValue:forKey:]((uint64_t)self, v9, @"personalizedNewsletterSignupLastSeenDate");

    uint64_t v10 = [FCModifyUserInfoCommand alloc];
    int v11 = -[FCUserInfo asCKRecord]((id *)&self->super.super.isa);
    uint64_t v12 = [(FCModifyUserInfoCommand *)v10 initWithUserInfoRecord:v11];

    [(FCPrivateDataController *)self addCommandToCommandQueue:v12];
    uint64_t v13 = (void *)MEMORY[0x1E4F29060];
    id v14 = v9;
    [v13 isMainThread];
    -[FCUserInfo _setUserInfoValue:forKey:]((uint64_t)self, v14, @"issuesNewsletterOptinLastSeenDate");

    uint64_t v15 = [FCModifyUserInfoCommand alloc];
    uint64_t v16 = -[FCUserInfo asCKRecord]((id *)&self->super.super.isa);
    uint64_t v17 = [(FCModifyUserInfoCommand *)v15 initWithUserInfoRecord:v16];

    [(FCPrivateDataController *)self addCommandToCommandQueue:v17];
  }
}

- (NSNumber)monthlyALaCarteSubscriptionMeteredCount
{
  return (NSNumber *)-[FCUserInfo _userInfoValueForKey:]((id *)&self->super.super.isa, @"monthlyMeteredCount");
}

- (void)setMonthlyALaCarteSubscriptionMeteredCount:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F29060];
  id v5 = a3;
  [v4 isMainThread];
  -[FCUserInfo _setUserInfoValue:forKey:]((uint64_t)self, v5, @"monthlyMeteredCount");

  uint64_t v6 = [FCModifyUserInfoCommand alloc];
  id v7 = -[FCUserInfo asCKRecord]((id *)&self->super.super.isa);
  char v8 = [(FCModifyUserInfoCommand *)v6 initWithUserInfoRecord:v7];

  [(FCPrivateDataController *)self addCommandToCommandQueue:v8];
}

- (NSDate)aLaCarteSubscriptionMeteredCountLastResetDate
{
  return (NSDate *)-[FCUserInfo _userInfoValueForKey:]((id *)&self->super.super.isa, @"meteredCountLastResetDate");
}

- (void)setALaCarteSubscriptionMeteredCountLastResetDate:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F29060];
  id v5 = a3;
  [v4 isMainThread];
  -[FCUserInfo _setUserInfoValue:forKey:]((uint64_t)self, v5, @"meteredCountLastResetDate");

  uint64_t v6 = [FCModifyUserInfoCommand alloc];
  id v7 = -[FCUserInfo asCKRecord]((id *)&self->super.super.isa);
  char v8 = [(FCModifyUserInfoCommand *)v6 initWithUserInfoRecord:v7];

  [(FCPrivateDataController *)self addCommandToCommandQueue:v8];
}

- (NSNumber)monthlyBundleSubscriptionMeteredCount
{
  return (NSNumber *)-[FCUserInfo _userInfoValueForKey:]((id *)&self->super.super.isa, @"monthlyPaidBundleMeteredCount");
}

- (void)setMonthlyBundleSubscriptionMeteredCount:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F29060];
  id v5 = a3;
  [v4 isMainThread];
  -[FCUserInfo _setUserInfoValue:forKey:]((uint64_t)self, v5, @"monthlyPaidBundleMeteredCount");

  uint64_t v6 = [FCModifyUserInfoCommand alloc];
  id v7 = -[FCUserInfo asCKRecord]((id *)&self->super.super.isa);
  char v8 = [(FCModifyUserInfoCommand *)v6 initWithUserInfoRecord:v7];

  [(FCPrivateDataController *)self addCommandToCommandQueue:v8];
}

- (NSDate)bundleSubscriptionMeteredCountLastResetDate
{
  return (NSDate *)-[FCUserInfo _userInfoValueForKey:]((id *)&self->super.super.isa, @"paidBundleMeteredCountLastResetDate");
}

- (void)setBundleSubscriptionMeteredCountLastResetDate:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F29060];
  id v5 = a3;
  [v4 isMainThread];
  -[FCUserInfo _setUserInfoValue:forKey:]((uint64_t)self, v5, @"paidBundleMeteredCountLastResetDate");

  uint64_t v6 = [FCModifyUserInfoCommand alloc];
  id v7 = -[FCUserInfo asCKRecord]((id *)&self->super.super.isa);
  char v8 = [(FCModifyUserInfoCommand *)v6 initWithUserInfoRecord:v7];

  [(FCPrivateDataController *)self addCommandToCommandQueue:v8];
}

- (NSNumber)upsellAppLaunchCount
{
  return (NSNumber *)-[FCUserInfo _userInfoValueForKey:]((id *)&self->super.super.isa, @"upsellAppLaunchCount");
}

- (void)setUpsellAppLaunchCount:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F29060];
  id v5 = a3;
  [v4 isMainThread];
  -[FCUserInfo _setUserInfoValue:forKey:]((uint64_t)self, v5, @"upsellAppLaunchCount");

  uint64_t v6 = [FCModifyUserInfoCommand alloc];
  id v7 = -[FCUserInfo asCKRecord]((id *)&self->super.super.isa);
  char v8 = [(FCModifyUserInfoCommand *)v6 initWithUserInfoRecord:v7];

  [(FCPrivateDataController *)self addCommandToCommandQueue:v8];
}

- (NSString)lastAppLaunchUpsellInstanceID
{
  return -[FCUserInfo _userInfoValueForKey:]((id *)&self->super.super.isa, @"lastAppLaunchUpsellInstanceID");
}

- (void)setLastAppLaunchUpsellInstanceID:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F29060];
  id v5 = a3;
  [v4 isMainThread];
  -[FCUserInfo _setUserInfoValue:forKey:]((uint64_t)self, v5, @"lastAppLaunchUpsellInstanceID");

  uint64_t v6 = [FCModifyUserInfoCommand alloc];
  id v7 = -[FCUserInfo asCKRecord]((id *)&self->super.super.isa);
  char v8 = [(FCModifyUserInfoCommand *)v6 initWithUserInfoRecord:v7];

  [(FCPrivateDataController *)self addCommandToCommandQueue:v8];
}

- (NSDate)appLaunchUpsellLastSeenDate
{
  return (NSDate *)-[FCUserInfo _userInfoValueForKey:]((id *)&self->super.super.isa, @"upsellAppLaunchLastSeenDate");
}

- (void)setAppLaunchUpsellLastSeenDate:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F29060];
  id v5 = a3;
  [v4 isMainThread];
  -[FCUserInfo _setUserInfoValue:forKey:]((uint64_t)self, v5, @"upsellAppLaunchLastSeenDate");

  uint64_t v6 = [FCModifyUserInfoCommand alloc];
  id v7 = -[FCUserInfo asCKRecord]((id *)&self->super.super.isa);
  char v8 = [(FCModifyUserInfoCommand *)v6 initWithUserInfoRecord:v7];

  [(FCPrivateDataController *)self addCommandToCommandQueue:v8];
}

- (NSString)appLaunchUpsellLastShownCampaignID
{
  return -[FCUserInfo _userInfoValueForKey:]((id *)&self->super.super.isa, @"upsellAppLaunchLastShownCampaignID");
}

- (void)setAppLaunchUpsellLastShownCampaignID:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F29060];
  id v5 = a3;
  [v4 isMainThread];
  -[FCUserInfo _setUserInfoValue:forKey:]((uint64_t)self, v5, @"upsellAppLaunchLastShownCampaignID");

  uint64_t v6 = [FCModifyUserInfoCommand alloc];
  id v7 = -[FCUserInfo asCKRecord]((id *)&self->super.super.isa);
  char v8 = [(FCModifyUserInfoCommand *)v6 initWithUserInfoRecord:v7];

  [(FCPrivateDataController *)self addCommandToCommandQueue:v8];
}

- (NSString)appLaunchUpsellLastPresenterBundleID
{
  return -[FCUserInfo _userInfoValueForKey:]((id *)&self->super.super.isa, @"upsellAppLaunchLastPresenterBundleID");
}

- (void)setAppLaunchUpsellLastPresenterBundleID:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F29060];
  id v5 = a3;
  [v4 isMainThread];
  -[FCUserInfo _setUserInfoValue:forKey:]((uint64_t)self, v5, @"upsellAppLaunchLastPresenterBundleID");

  uint64_t v6 = [FCModifyUserInfoCommand alloc];
  id v7 = -[FCUserInfo asCKRecord]((id *)&self->super.super.isa);
  char v8 = [(FCModifyUserInfoCommand *)v6 initWithUserInfoRecord:v7];

  [(FCPrivateDataController *)self addCommandToCommandQueue:v8];
}

- (NSDate)postPurchaseOnboardingLastShownDate
{
  return (NSDate *)-[FCUserInfo _userInfoValueForKey:]((id *)&self->super.super.isa, @"postPurchaseOnboardingLastSeenDate");
}

- (void)setPostPurchaseOnboardingLastShownDate:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F29060];
  id v5 = a3;
  [v4 isMainThread];
  -[FCUserInfo _setUserInfoValue:forKey:]((uint64_t)self, v5, @"postPurchaseOnboardingLastSeenDate");

  uint64_t v6 = [FCModifyUserInfoCommand alloc];
  id v7 = -[FCUserInfo asCKRecord]((id *)&self->super.super.isa);
  char v8 = [(FCModifyUserInfoCommand *)v6 initWithUserInfoRecord:v7];

  [(FCPrivateDataController *)self addCommandToCommandQueue:v8];
}

- (void)refreshOnboardingVersion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __39__FCUserInfo_refreshOnboardingVersion___block_invoke;
  v6[3] = &unk_1E5B4EC68;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(FCPrivateDataController *)self performFirstSyncWithCallbackQueue:MEMORY[0x1E4F14428] completion:v6];
}

void __39__FCUserInfo_refreshOnboardingVersion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  if (v1)
  {
    id v2 = [*(id *)(a1 + 32) onboardingVersionNumber];
    (*(void (**)(uint64_t, id, void))(v1 + 16))(v1, v2, 0);
  }
}

- (void)updateOnboardingVersion
{
  BOOL v3 = [(FCUserInfo *)self onboardingVersionNumber];
  uint64_t v4 = [v3 integerValue];

  if (v4 < 5)
  {
    [(FCUserInfo *)self setMarketingNotificationsEnabled:1];
    [(FCUserInfo *)self setOnboardingVersionNumber:&unk_1EF8D7B30];
  }
  id v5 = [(FCUserInfo *)self onboardingVersionNumber];
  uint64_t v6 = [v5 integerValue];

  if (v6 <= 5)
  {
    [(FCUserInfo *)self setEndOfAudioTrackNotificationsEnabled:1];
    [(FCUserInfo *)self setOnboardingVersionNumber:&unk_1EF8D7B48];
  }
  id v7 = FCBundle();
  id v9 = [v7 objectForInfoDictionaryKey:@"CFBundleShortVersionString"];

  char v8 = [NSNumber numberWithInteger:FCIntegerRepresentationOfBundleShortVersionString(v9)];
  [(FCUserInfo *)self setOnboardingVersionNumber:v8];
}

- (void)markSavedAsViewed
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  [MEMORY[0x1E4F29060] isMainThread];
  BOOL v3 = [MEMORY[0x1E4F1C9C8] date];
  -[FCUserInfo _setUserInfoValue:forKey:]((uint64_t)self, v3, @"lastViewedSavedDate");
  uint64_t v4 = [FCModifyUserInfoCommand alloc];
  id v5 = -[FCUserInfo asCKRecord]((id *)&self->super.super.isa);
  uint64_t v6 = [(FCModifyUserInfoCommand *)v4 initWithUserInfoRecord:v5];

  [(FCPrivateDataController *)self addCommandToCommandQueue:v6];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v7 = [(FCPrivateDataController *)self observers];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v13 + 1) + 8 * v11);
        if (objc_opt_respondsToSelector()) {
          [v12 userInfoDidChangeDateLastViewedSaved:self fromCloud:0];
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }
}

- (NSDate)dateLastViewedSaved
{
  return (NSDate *)-[FCUserInfo _userInfoValueForKey:]((id *)&self->super.super.isa, @"lastViewedSavedDate");
}

- (void)setEditorialArticleVersion:(id)a3
{
  id v9 = a3;
  if (v9)
  {
    uint64_t v4 = -[FCUserInfo _userInfoValueForKey:]((id *)&self->super.super.isa, @"editorialArticleVersion");
    id v5 = v4;
    if (!v4 || ([v4 isEqualToString:v9] & 1) == 0)
    {
      -[FCUserInfo _setUserInfoValue:forKey:]((uint64_t)self, v9, @"editorialArticleVersion");
      uint64_t v6 = [FCModifyUserInfoCommand alloc];
      id v7 = -[FCUserInfo asCKRecord]((id *)&self->super.super.isa);
      uint64_t v8 = [(FCModifyUserInfoCommand *)v6 initWithUserInfoRecord:v7];

      [(FCPrivateDataController *)self addCommandToCommandQueue:v8];
    }
  }
}

- (void)setCanonicalLanguage:(id)a3
{
  id v9 = a3;
  if (v9)
  {
    uint64_t v4 = -[FCUserInfo _userInfoValueForKey:]((id *)&self->super.super.isa, @"canonicalLanguage");
    id v5 = v4;
    if (!v4 || ([v4 isEqualToString:v9] & 1) == 0)
    {
      -[FCUserInfo _setUserInfoValue:forKey:]((uint64_t)self, v9, @"canonicalLanguage");
      uint64_t v6 = [FCModifyUserInfoCommand alloc];
      id v7 = -[FCUserInfo asCKRecord]((id *)&self->super.super.isa);
      uint64_t v8 = [(FCModifyUserInfoCommand *)v6 initWithUserInfoRecord:v7];

      [(FCPrivateDataController *)self addCommandToCommandQueue:v8];
    }
  }
}

- (void)setMarketingNotificationsEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  BOOL v5 = [(FCUserInfo *)self marketingNotificationsEnabled];
  if (v5 != v3)
  {
    BOOL v6 = v5;
    id v7 = FCPushNotificationsLog;
    if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      BOOL v25 = v6;
      __int16 v26 = 1024;
      BOOL v27 = v3;
      _os_log_impl(&dword_1A460D000, v7, OS_LOG_TYPE_DEFAULT, "Changing the marketing notifications switch from: %d to: %d", buf, 0xEu);
    }
    uint64_t v8 = [NSNumber numberWithBool:v3];
    -[FCUserInfo _setUserInfoValue:forKey:]((uint64_t)self, v8, @"marketingNotificationsEnabled");

    id v9 = [FCModifyUserInfoCommand alloc];
    uint64_t v10 = -[FCUserInfo asCKRecord]((id *)&self->super.super.isa);
    uint64_t v11 = [(FCModifyUserInfoCommand *)v9 initWithUserInfoRecord:v10];

    [(FCPrivateDataController *)self addCommandToCommandQueue:v11];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v12 = [(FCPrivateDataController *)self observers];
    long long v13 = (void *)[v12 copy];

    uint64_t v14 = [v13 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v20;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v20 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = *(void **)(*((void *)&v19 + 1) + 8 * v17);
          if (objc_opt_respondsToSelector()) {
            [v18 userInfoDidChangeMarketingNotificationsEnabled:self fromCloud:0];
          }
          ++v17;
        }
        while (v15 != v17);
        uint64_t v15 = [v13 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v15);
    }
  }
}

- (void)setNewIssueNotificationsEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  BOOL v5 = [(FCUserInfo *)self newIssueNotificationsEnabled];
  if (v5 != v3)
  {
    BOOL v6 = v5;
    id v7 = FCPushNotificationsLog;
    if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      BOOL v25 = v6;
      __int16 v26 = 1024;
      BOOL v27 = v3;
      _os_log_impl(&dword_1A460D000, v7, OS_LOG_TYPE_DEFAULT, "Changing the new issue notifications switch from: %d to: %d", buf, 0xEu);
    }
    uint64_t v8 = [NSNumber numberWithBool:v3];
    -[FCUserInfo _setUserInfoValue:forKey:]((uint64_t)self, v8, @"newIssueNotificationsEnabled");

    id v9 = [FCModifyUserInfoCommand alloc];
    uint64_t v10 = -[FCUserInfo asCKRecord]((id *)&self->super.super.isa);
    uint64_t v11 = [(FCModifyUserInfoCommand *)v9 initWithUserInfoRecord:v10];

    [(FCPrivateDataController *)self addCommandToCommandQueue:v11];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v12 = [(FCPrivateDataController *)self observers];
    long long v13 = (void *)[v12 copy];

    uint64_t v14 = [v13 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v20;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v20 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = *(void **)(*((void *)&v19 + 1) + 8 * v17);
          if (objc_opt_respondsToSelector()) {
            [v18 userInfoDidChangeNewIssueNotificationsEnabled:self fromCloud:0];
          }
          ++v17;
        }
        while (v15 != v17);
        uint64_t v15 = [v13 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v15);
    }
  }
}

- (void)setEndOfAudioTrackNotificationsEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  BOOL v5 = [(FCUserInfo *)self endOfAudioTrackNotificationsEnabled];
  if (v5 != v3)
  {
    BOOL v6 = v5;
    id v7 = FCPushNotificationsLog;
    if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      BOOL v25 = v6;
      __int16 v26 = 1024;
      BOOL v27 = v3;
      _os_log_impl(&dword_1A460D000, v7, OS_LOG_TYPE_DEFAULT, "Changing the end of audio track notifications switch from: %d to: %d", buf, 0xEu);
    }
    uint64_t v8 = [NSNumber numberWithBool:v3];
    -[FCUserInfo _setUserInfoValue:forKey:]((uint64_t)self, v8, @"endOfAudioNotificationsEnabled");

    id v9 = [FCModifyUserInfoCommand alloc];
    uint64_t v10 = -[FCUserInfo asCKRecord]((id *)&self->super.super.isa);
    uint64_t v11 = [(FCModifyUserInfoCommand *)v9 initWithUserInfoRecord:v10];

    [(FCPrivateDataController *)self addCommandToCommandQueue:v11];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v12 = [(FCPrivateDataController *)self observers];
    long long v13 = (void *)[v12 copy];

    uint64_t v14 = [v13 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v20;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v20 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = *(void **)(*((void *)&v19 + 1) + 8 * v17);
          if (objc_opt_respondsToSelector()) {
            [v18 userInfoDidChangeEndOfAudioTrackNotificationsEnabled:self fromCloud:0];
          }
          ++v17;
        }
        while (v15 != v17);
        uint64_t v15 = [v13 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v15);
    }
  }
}

- (NSDate)appReviewRequestLastShownDate
{
  return (NSDate *)-[FCUserInfo _userInfoValueForKey:]((id *)&self->super.super.isa, @"appReviewRequestLastSeenDate");
}

- (void)setAppReviewRequestLastShownDate:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x1E4F29060];
  id v5 = a3;
  [v4 isMainThread];
  -[FCUserInfo _setUserInfoValue:forKey:]((uint64_t)self, v5, @"appReviewRequestLastSeenDate");

  BOOL v6 = [FCModifyUserInfoCommand alloc];
  id v7 = -[FCUserInfo asCKRecord]((id *)&self->super.super.isa);
  uint64_t v8 = [(FCModifyUserInfoCommand *)v6 initWithUserInfoRecord:v7];

  [(FCPrivateDataController *)self addCommandToCommandQueue:v8];
}

- (void)setPuzzleNotificationsEnabled:(BOOL)a3 userTriggered:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  [MEMORY[0x1E4F29060] isMainThread];
  BOOL v7 = [(FCUserInfo *)self puzzleNotificationsEnabled];
  uint64_t v8 = [(FCUserInfo *)self puzzleNotificationsLastChangedDate];

  if (v7 != v5 || (((v8 == 0) ^ v4) & 1) == 0)
  {
    id v9 = FCPushNotificationsLog;
    if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v29 = v7;
      *(_WORD *)&v29[4] = 1024;
      *(_DWORD *)&v29[6] = v5;
      _os_log_impl(&dword_1A460D000, v9, OS_LOG_TYPE_DEFAULT, "Changing the puzzle notifications switch from: %d to: %d", buf, 0xEu);
    }
    uint64_t v10 = [NSNumber numberWithBool:v5];
    -[FCUserInfo _setUserInfoValue:forKey:]((uint64_t)self, v10, @"puzzleNotificationsEnabled2");

    uint64_t v11 = [MEMORY[0x1E4F1C9C8] now];
    if (v4)
    {
      uint64_t v12 = FCPushNotificationsLog;
      if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)v29 = v11;
        _os_log_impl(&dword_1A460D000, v12, OS_LOG_TYPE_DEFAULT, "Changing the puzzle notifications last changed date to: %@", buf, 0xCu);
      }
      -[FCUserInfo _setUserInfoValue:forKey:]((uint64_t)self, v11, @"puzzleNotificationsLastChangedDate");
    }
    long long v13 = [FCModifyUserInfoCommand alloc];
    uint64_t v14 = -[FCUserInfo asCKRecord]((id *)&self->super.super.isa);
    uint64_t v15 = [(FCModifyUserInfoCommand *)v13 initWithUserInfoRecord:v14];

    [(FCPrivateDataController *)self addCommandToCommandQueue:v15];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    uint64_t v16 = [(FCPrivateDataController *)self observers];
    uint64_t v17 = (void *)[v16 copy];

    uint64_t v18 = [v17 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v24 != v20) {
            objc_enumerationMutation(v17);
          }
          long long v22 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          if (objc_opt_respondsToSelector()) {
            [v22 userInfoDidChangePuzzleNotificationsEnabled:self fromCloud:0];
          }
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v19);
    }
  }
}

- (void)resetPuzzleNotificationsState
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  [MEMORY[0x1E4F29060] isMainThread];
  BOOL v3 = FCPushNotificationsLog;
  if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A460D000, v3, OS_LOG_TYPE_DEFAULT, "Resetting puzzle notifications state", buf, 2u);
  }
  BOOL v4 = [NSNumber numberWithBool:0];
  -[FCUserInfo _setUserInfoValue:forKey:]((uint64_t)self, v4, @"puzzleNotificationsEnabled2");

  -[FCUserInfo _setUserInfoValue:forKey:]((uint64_t)self, 0, @"puzzleNotificationsLastChangedDate");
  BOOL v5 = [FCModifyUserInfoCommand alloc];
  BOOL v6 = -[FCUserInfo asCKRecord]((id *)&self->super.super.isa);
  BOOL v7 = [(FCModifyUserInfoCommand *)v5 initWithUserInfoRecord:v6];

  [(FCPrivateDataController *)self addCommandToCommandQueue:v7];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v8 = [(FCPrivateDataController *)self observers];
  id v9 = (void *)[v8 copy];

  uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v16;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void **)(*((void *)&v15 + 1) + 8 * v13);
        if (objc_opt_respondsToSelector()) {
          [v14 userInfoDidChangePuzzleNotificationsEnabled:self fromCloud:0];
        }
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v20 count:16];
    }
    while (v11);
  }
}

- (void)setPuzzleStatsStartDate:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [MEMORY[0x1E4F29060] isMainThread];
  BOOL v5 = FCUserInfoLog;
  if (os_log_type_enabled((os_log_t)FCUserInfoLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v21 = v4;
    _os_log_impl(&dword_1A460D000, v5, OS_LOG_TYPE_DEFAULT, "Changing the puzzle stats start date to: %@", buf, 0xCu);
  }
  -[FCUserInfo _setUserInfoValue:forKey:]((uint64_t)self, v4, @"puzzleStatsStartDate");
  BOOL v6 = [FCModifyUserInfoCommand alloc];
  BOOL v7 = -[FCUserInfo asCKRecord]((id *)&self->super.super.isa);
  uint64_t v8 = [(FCModifyUserInfoCommand *)v6 initWithUserInfoRecord:v7];

  [(FCPrivateDataController *)self addCommandToCommandQueue:v8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v9 = [(FCPrivateDataController *)self observers];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v16;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void **)(*((void *)&v15 + 1) + 8 * v13);
        if (objc_opt_respondsToSelector()) {
          [v14 userInfoDidChangeDatePuzzleStatsStart:self fromCloud:0];
        }
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v11);
  }
}

void __24__FCUserInfo_asCKRecord__block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  if (v2) {
    id v2 = (void *)v2[15];
  }
  BOOL v6 = v2;
  uint64_t v3 = +[FCUserInfo userInfoCKRecordFromUserInfoDictionary:]((uint64_t)FCUserInfo, v6);
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  BOOL v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

+ (id)userInfoCKRecordFromUserInfoDictionary:(uint64_t)a1
{
  id v2 = a2;
  self;
  v47 = [v2 objectForKey:@"feldsparID"];
  v46 = objc_msgSend(v2, "objectForKey:");
  v45 = objc_msgSend(v2, "objectForKey:");
  v44 = objc_msgSend(v2, "objectForKey:");
  v43 = objc_msgSend(v2, "objectForKey:");
  v42 = [v2 objectForKey:@"monthlyMeteredCount"];
  v41 = [v2 objectForKey:@"meteredCountLastResetDate"];
  v40 = objc_msgSend(v2, "objectForKey:");
  v39 = [v2 objectForKey:@"meteredCountLastResetDate"];
  v38 = objc_msgSend(v2, "objectForKey:");
  v37 = objc_msgSend(v2, "objectForKey:");
  v36 = objc_msgSend(v2, "objectForKey:");
  v35 = objc_msgSend(v2, "objectForKey:");
  v34 = objc_msgSend(v2, "objectForKey:");
  v33 = objc_msgSend(v2, "objectForKey:");
  v32 = objc_msgSend(v2, "objectForKey:");
  v31 = objc_msgSend(v2, "objectForKey:");
  long long v18 = [v2 objectForKey:@"lastOpenedDate"];
  uint64_t v30 = objc_msgSend(v2, "objectForKey:");
  uint64_t v10 = [v2 objectForKey:@"lastViewedSavedDate"];
  uint64_t v8 = [v2 objectForKey:@"lastViewedSharedWithYouDate"];
  v29 = objc_msgSend(v2, "objectForKey:");
  uint64_t v28 = objc_msgSend(v2, "objectForKey:");
  BOOL v27 = objc_msgSend(v2, "objectForKey:");
  long long v26 = objc_msgSend(v2, "objectForKey:");
  long long v25 = objc_msgSend(v2, "objectForKey:");
  long long v24 = objc_msgSend(v2, "objectForKey:");
  long long v23 = objc_msgSend(v2, "objectForKey:");
  uint64_t v22 = objc_msgSend(v2, "objectForKey:");
  id v21 = objc_msgSend(v2, "objectForKey:");
  uint64_t v20 = objc_msgSend(v2, "objectForKey:");
  uint64_t v19 = objc_msgSend(v2, "objectForKey:");
  long long v17 = objc_msgSend(v2, "objectForKey:");
  long long v16 = objc_msgSend(v2, "objectForKey:");
  long long v15 = objc_msgSend(v2, "objectForKey:");
  uint64_t v14 = objc_msgSend(v2, "objectForKey:");
  uint64_t v13 = objc_msgSend(v2, "objectForKey:");
  uint64_t v12 = objc_msgSend(v2, "objectForKey:");
  uint64_t v11 = objc_msgSend(v2, "objectForKey:");
  id v9 = objc_msgSend(v2, "objectForKey:");

  id v3 = objc_alloc(MEMORY[0x1E4F1A320]);
  BOOL v7 = (void *)[v3 initWithZoneName:@"UserInfo" ownerName:*MEMORY[0x1E4F19C08]];
  BOOL v6 = (void *)[objc_alloc(MEMORY[0x1E4F1A2F8]) initWithRecordName:@"user_info_static_record_name" zoneID:v7];
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F1A2D8]) initWithRecordType:@"UserInfo" recordID:v6];
  [v4 setValue:v43 forKey:@"finishFirstLaunchVersion"];
  [v4 setValue:v47 forKey:@"feldsparID"];
  [v4 setValue:v46 forKey:@"notificationsUserID"];
  [v4 setValue:v45 forKey:@"adsUserID"];
  [v4 setValue:v44 forKey:@"adsUserIDCreatedDate"];
  [v4 setValue:v18 forKey:@"lastOpenedDate"];
  [v4 setValue:v10 forKey:@"lastViewedSavedDate"];
  [v4 setValue:v8 forKey:@"lastViewedSharedWithYouDate"];
  [v4 setValue:v42 forKey:@"monthlyMeteredCount"];
  [v4 setValue:v41 forKey:@"meteredCountLastResetDate"];
  [v4 setValue:v40 forKey:@"monthlyPaidBundleMeteredCount"];
  [v4 setValue:v39 forKey:@"paidBundleMeteredCountLastResetDate"];
  [v4 setValue:v38 forKey:@"upsellAppLaunchCount"];
  [v4 setValue:v37 forKey:@"lastAppLaunchUpsellInstanceID"];
  [v4 setValue:v36 forKey:@"upsellAppLaunchLastSeenDate"];
  [v4 setValue:v35 forKey:@"upsellAppLaunchLastShownCampaignID"];
  [v4 setValue:v34 forKey:@"upsellAppLaunchLastPresenterBundleID"];
  [v4 setValue:v33 forKey:@"newsletterSignupLastSeenDate"];
  [v4 setValue:v32 forKey:@"personalizedNewsletterSignupLastSeenDate"];
  [v4 setValue:v31 forKey:@"issuesNewsletterOptinLastSeenDate"];
  [v4 setValue:v30 forKey:@"userStartDate"];
  [v4 setValue:v29 forKey:@"editorialArticleVersion"];
  [v4 setValue:v28 forKey:@"canonicalLanguage"];
  [v4 setValue:v27 forKey:@"marketingNotificationsEnabled"];
  [v4 setValue:v26 forKey:@"newIssueNotificationsEnabled"];
  [v4 setValue:v25 forKey:@"endOfAudioNotificationsEnabled"];
  [v4 setValue:v24 forKey:@"sportsTopicNotificationsEnabledState2"];
  [v4 setValue:v23 forKey:@"postPurchaseOnboardingLastSeenDate"];
  [v4 setValue:v22 forKey:@"appReviewRequestLastSeenDate"];
  [v4 setValue:v21 forKey:@"sportsOnboardingState"];
  [v4 setValue:v20 forKey:@"shortcutsOnboardingState"];
  [v4 setValue:v19 forKey:@"shortcutsOnboardingCompletedDate"];
  [v4 setValue:v17 forKey:@"sportsSyncState"];
  [v4 setValue:v16 forKey:@"sportsSyncStateLastSavedDate"];
  [v4 setValue:v15 forKey:@"sportsFavoritesLastModifiedDate"];
  [v4 setValue:v14 forKey:@"sportsOnboardingCompletedDate"];
  [v4 setValue:v13 forKey:@"sportsUserID"];
  [v4 setValue:v12 forKey:@"puzzleNotificationsEnabled2"];
  [v4 setValue:v11 forKey:@"puzzleNotificationsLastChangedDate"];
  [v4 setValue:v9 forKey:@"puzzleStatsStartDate"];

  return v4;
}

- (void)removeObserver:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)FCUserInfo;
  [(FCPrivateDataController *)&v3 removeObserver:a3];
}

- (void)syncWithCompletion:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __33__FCUserInfo_syncWithCompletion___block_invoke;
  v7[3] = &unk_1E5B508C0;
  v7[4] = self;
  id v8 = v4;
  v6.receiver = self;
  v6.super_class = (Class)FCUserInfo;
  id v5 = v4;
  [(FCPrivateDataController *)&v6 syncWithCompletion:v7];
}

void __33__FCUserInfo_syncWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v11 = a3;
  id v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  int v5 = [v4 BOOLForKey:@"reset_onboarding_version"];

  if (v5)
  {
    objc_super v6 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    uint64_t v7 = [v6 integerForKey:@"onboarding_version_to_reset_to"];

    id v8 = *(void **)(a1 + 32);
    id v9 = [NSNumber numberWithInteger:v7];
    [v8 setOnboardingVersionNumber:v9];

    uint64_t v10 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    [v10 setBool:0 forKey:@"reset_onboarding_version"];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)accessTokenDidChangeForTagID:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  int v5 = [(FCPrivateDataController *)self observers];
  objc_super v6 = (void *)[v5 copy];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v13 + 1) + 8 * v10);
        if (objc_opt_respondsToSelector())
        {
          uint64_t v12 = (void *)[v4 copy];
          [v11 userInfo:self didChangeAccessTokenForTagID:v12];
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
}

- (void)accessTokenRemovedForTagID:(id)a3 userInitiated:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v7 = [(FCPrivateDataController *)self observers];
  uint64_t v8 = (void *)[v7 copy];

  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = *(void **)(*((void *)&v15 + 1) + 8 * v12);
        if (objc_opt_respondsToSelector())
        {
          long long v14 = (void *)[v6 copy];
          [v13 userInfo:self didRemoveAccessTokenForTagID:v14 userInitiated:v4];
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }
}

- (void)settingsDataDidChangeForPuzzleTypeID:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  int v5 = [(FCPrivateDataController *)self observers];
  id v6 = (void *)[v5 copy];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v13 + 1) + 8 * v10);
        if (objc_opt_respondsToSelector())
        {
          uint64_t v12 = (void *)[v4 copy];
          [v11 userInfo:self didChangePuzzleTypeSettingsForPuzzleTypeID:v12];
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
}

- (void)handleSyncWithChangedRecords:(id)a3 deletedRecordNames:(id)a4
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v41 = a4;
  obuint64_t j = v6;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v48 objects:v53 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v49;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v49 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v48 + 1) + 8 * i);
        uint64_t v12 = [v11 recordType];
        if ([v12 isEqualToString:@"UserInfo"])
        {
          -[FCUserInfo handleSyncWithUserInfoRecord:]((id *)&self->super.super.isa, v11);
          goto LABEL_13;
        }
        if ([v12 isEqualToString:@"TagSettings"])
        {
          long long v13 = [(FCUserInfo *)self tagSettings];
          [v13 handleSyncWithTagSettingsRecord:v11];
        }
        else
        {
          if (![v12 isEqualToString:@"PuzzleTypeSettings"]) {
            goto LABEL_13;
          }
          long long v13 = [(FCUserInfo *)self puzzleTypeSettings];
          [v13 handleSyncWithPuzzleTypeSettingsRecord:v11];
        }

LABEL_13:
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v48 objects:v53 count:16];
    }
    while (v8);
  }
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v42 = v41;
  uint64_t v14 = [v42 countByEnumeratingWithState:&v44 objects:v52 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v45;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v45 != v16) {
          objc_enumerationMutation(v42);
        }
        uint64_t v18 = *(void **)(*((void *)&v44 + 1) + 8 * j);
        if ([v18 isEqualToString:@"user_info_static_record_name"])
        {
          if (!self) {
            continue;
          }
          uint64_t v20 = [(FCPrivateDataController *)self localStore];
          id v21 = __FCCKUserInfoKeys_block_invoke();
          [v20 removeObjectsForKeys:v21];

          uint64_t v22 = [(FCPrivateDataController *)self localStore];
          long long v23 = [MEMORY[0x1E4F29128] UUID];
          long long v24 = [v23 UUIDString];
          [v22 setObject:v24 forKey:@"feldsparID"];

          long long v25 = [(FCPrivateDataController *)self localStore];
          long long v26 = [MEMORY[0x1E4F29128] UUID];
          BOOL v27 = [v26 UUIDString];
          [v25 setObject:v27 forKey:@"notificationsUserID"];

          uint64_t v28 = [(FCPrivateDataController *)self localStore];
          v29 = [MEMORY[0x1E4F29128] UUID];
          uint64_t v30 = [v29 UUIDString];
          [v28 setObject:v30 forKey:@"adsUserID"];

          v31 = [(FCPrivateDataController *)self localStore];
          v32 = [MEMORY[0x1E4F29128] UUID];
          v33 = [v32 UUIDString];
          [v31 setObject:v33 forKey:@"sportsUserID"];

          v34 = [(FCPrivateDataController *)self localStore];
          v35 = [MEMORY[0x1E4F1C9C8] date];
          [v34 setObject:v35 forKey:@"adsUserIDCreatedDate"];

          v36 = [(FCPrivateDataController *)self localStore];
          v37 = [MEMORY[0x1E4F1C9C8] date];
          [v36 setObject:v37 forKey:@"lastOpenedDate"];

          v38 = [(FCPrivateDataController *)self localStore];
          v39 = [MEMORY[0x1E4F1C9C8] date];
          [v38 setObject:v39 forKey:@"userStartDate"];
        }
        else if (FCIsTagSettingsRecordName(v18, v19))
        {
          v38 = [(FCUserInfo *)self tagSettings];
          [v38 handleSyncWithDeletedTagSettingsRecordName:v18];
        }
        else
        {
          if (!FCIsPuzzleTypeSettingsRecordName(v18, v40)) {
            continue;
          }
          v38 = [(FCUserInfo *)self puzzleTypeSettings];
          [v38 handleSyncWithDeletedPuzzleTypeSettingsRecordName:v18];
        }
      }
      uint64_t v15 = [v42 countByEnumeratingWithState:&v44 objects:v52 count:16];
    }
    while (v15);
  }
}

- (void)handleSyncWithUserInfoRecord:(id *)a1
{
  uint64_t v252 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (!a1) {
    goto LABEL_218;
  }
  v212 = -[FCUserInfo _userInfoValueForKey:](a1, @"feldsparID");
  v211 = -[FCUserInfo _userInfoValueForKey:](a1, @"lastViewedSavedDate");
  v218 = -[FCUserInfo _userInfoValueForKey:](a1, @"editorialArticleVersion");
  v210 = -[FCUserInfo _userInfoValueForKey:](a1, @"finishFirstLaunchVersion");
  v209 = -[FCUserInfo _userInfoValueForKey:](a1, @"marketingNotificationsEnabled");
  v208 = -[FCUserInfo _userInfoValueForKey:](a1, @"newIssueNotificationsEnabled");
  v207 = -[FCUserInfo _userInfoValueForKey:](a1, @"endOfAudioNotificationsEnabled");
  v206 = -[FCUserInfo _userInfoValueForKey:](a1, @"sportsTopicNotificationsEnabledState2");
  v204 = -[FCUserInfo _userInfoValueForKey:](a1, @"lastViewedSharedWithYouDate");
  id v4 = -[FCUserInfo _userInfoValueForKey:](a1, @"notificationsUserID");
  v191 = -[FCUserInfo _userInfoValueForKey:](a1, @"adsUserID");
  v189 = -[FCUserInfo _userInfoValueForKey:](a1, @"adsUserIDCreatedDate");
  v199 = -[FCUserInfo _userInfoValueForKey:](a1, @"lastAppLaunchUpsellInstanceID");
  v201 = -[FCUserInfo _userInfoValueForKey:](a1, @"upsellAppLaunchLastSeenDate");
  v193 = -[FCUserInfo _userInfoValueForKey:](a1, @"sportsUserID");
  v216 = -[FCUserInfo _userInfoValueForKey:](a1, @"sportsSyncState");
  v187 = -[FCUserInfo _userInfoValueForKey:](a1, @"sportsSyncStateLastSavedDate");
  v214 = -[FCUserInfo _userInfoValueForKey:](a1, @"sportsOnboardingState");
  v185 = -[FCUserInfo _userInfoValueForKey:](a1, @"sportsOnboardingCompletedDate");
  v220 = -[FCUserInfo _userInfoValueForKey:](a1, @"shortcutsOnboardingState");
  v219 = -[FCUserInfo _userInfoValueForKey:](a1, @"shortcutsOnboardingCompletedDate");
  v197 = -[FCUserInfo _userInfoValueForKey:](a1, @"puzzleNotificationsEnabled2");
  v195 = -[FCUserInfo _userInfoValueForKey:](a1, @"puzzleNotificationsLastChangedDate");
  v203 = -[FCUserInfo _userInfoValueForKey:](a1, @"puzzleStatsStartDate");
  int v5 = (void *)MEMORY[0x1E4F1CAD0];
  v243[0] = @"lastAppLaunchUpsellInstanceID";
  v243[1] = @"upsellAppLaunchLastSeenDate";
  v243[2] = @"puzzleNotificationsEnabled2";
  v243[3] = @"puzzleNotificationsLastChangedDate";
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v243 count:4];
  uint64_t v7 = [v5 setWithArray:v6];

  v235[0] = MEMORY[0x1E4F143A8];
  v235[1] = 3221225472;
  v235[2] = __43__FCUserInfo_handleSyncWithUserInfoRecord___block_invoke;
  v235[3] = &unk_1E5B51328;
  id v182 = v7;
  id v236 = v182;
  id v8 = v3;
  id v237 = v8;
  -[FCUserInfo _modifyUserInfoWithBlock:]((uint64_t)a1, v235);
  uint64_t v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v9 postNotificationName:@"FCUserInfoChangedNotificationName" object:a1];

  obuint64_t j = v8;
  uint64_t v10 = [v8 objectForKeyedSubscript:@"notificationsUserID"];
  id v11 = v4;
  id v12 = v10;
  long long v13 = v12;
  id v184 = v3;
  v230 = a1;
  if (!v12 || ![v12 length])
  {
    if (!v11
      || ![v11 length]
      || (uint64_t v14 = v11, [v11 hasSuffix:@"-NoSync"]))
    {
      long long v17 = [MEMORY[0x1E4F29128] UUID];
      uint64_t v14 = [v17 UUIDString];

      uint64_t v18 = FCPushNotificationsLog;
      if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v245 = v14;
        _os_log_impl(&dword_1A460D000, v18, OS_LOG_TYPE_INFO, "Syncing enabled, generated a new notificationsUserID: %@", buf, 0xCu);
      }
    }
    -[FCUserInfo _setUserInfoValue:forKey:]((uint64_t)a1, v14, @"notificationsUserID");
    uint64_t v19 = [FCModifyUserInfoCommand alloc];
    uint64_t v20 = -[FCUserInfo asCKRecord](a1);
    id v21 = [(FCModifyUserInfoCommand *)v19 initWithUserInfoRecord:v20];

    [a1 addCommandToCommandQueue:v21];
    goto LABEL_18;
  }
  if (v11 && [v11 length])
  {
    uint64_t v14 = v11;
    if ([v11 isEqualToString:v13]) {
      goto LABEL_28;
    }
    -[FCUserInfo _setUserInfoValue:forKey:]((uint64_t)a1, v13, @"notificationsUserID");
    uint64_t v15 = FCPushNotificationsLog;
    uint64_t v14 = v11;
    if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v245 = v13;
      uint64_t v16 = "Syncing enabled, updated with remote notificationsUserID: %@";
LABEL_17:
      _os_log_impl(&dword_1A460D000, v15, OS_LOG_TYPE_INFO, v16, buf, 0xCu);
      uint64_t v14 = v11;
    }
  }
  else
  {
    -[FCUserInfo _setUserInfoValue:forKey:]((uint64_t)a1, v13, @"notificationsUserID");
    uint64_t v15 = FCPushNotificationsLog;
    uint64_t v14 = v11;
    if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v245 = v13;
      uint64_t v16 = "Syncing enabled, merged remote notificationsUserID: %@";
      goto LABEL_17;
    }
  }
LABEL_18:
  long long v240 = 0u;
  long long v241 = 0u;
  long long v238 = 0u;
  long long v239 = 0u;
  uint64_t v22 = [a1 observers];
  long long v23 = (void *)[v22 copy];

  uint64_t v24 = [v23 countByEnumeratingWithState:&v238 objects:buf count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v239;
    do
    {
      for (uint64_t i = 0; i != v25; ++i)
      {
        if (*(void *)v239 != v26) {
          objc_enumerationMutation(v23);
        }
        uint64_t v28 = *(void **)(*((void *)&v238 + 1) + 8 * i);
        if (objc_opt_respondsToSelector()) {
          [v28 userInfoDidChangeNotificationsUserID:v230];
        }
      }
      uint64_t v25 = [v23 countByEnumeratingWithState:&v238 objects:buf count:16];
    }
    while (v25);
  }

  a1 = v230;
LABEL_28:

  v29 = [v8 objectForKeyedSubscript:@"adsUserID"];
  uint64_t v30 = [v8 objectForKeyedSubscript:@"adsUserIDCreatedDate"];
  id v31 = v191;
  id v32 = v189;
  id v33 = v29;
  id v34 = v30;
  v190 = v32;
  v192 = v31;
  v183 = v11;
  id v178 = v34;
  if (!v33 || (v35 = v34, ![v33 length]))
  {
    if (!v31 || (id v36 = v31, ![v31 length]))
    {
      v38 = -[FCUserInfo _temporaryUserIDForKey:]((uint64_t)a1, @"adsUserID");
      v39 = v38;
      if (v38)
      {
        id v36 = v38;
        v40 = v31;
      }
      else
      {
        v40 = [MEMORY[0x1E4F29128] UUID];
        id v36 = [v40 UUIDString];
      }
      id v32 = [MEMORY[0x1E4F1C9C8] date];
    }
    v37 = a1;
LABEL_45:
    -[FCUserInfo _persistAdsUserID:createdDate:](v37, v36, v32);
    goto LABEL_46;
  }
  if (v31 && [v31 length])
  {
    if (([v31 isEqualToString:v33] & 1) != 0
      || (-[FCUserInfo _shouldRotateAdsUserIDWithCreatedDate:](a1, v35) & 1) != 0)
    {
      id v36 = v31;
      if (!-[FCUserInfo _shouldRotateAdsUserIDWithCreatedDate:](a1, v35)) {
        goto LABEL_56;
      }
      v37 = a1;
      id v36 = v31;
      goto LABEL_45;
    }
    -[FCUserInfo _setUserInfoValue:forKey:]((uint64_t)a1, v33, @"adsUserID");
    uint64_t v41 = (uint64_t)a1;
    id v42 = v35;
    v43 = @"adsUserIDCreatedDate";
  }
  else
  {
    uint64_t v41 = (uint64_t)a1;
    id v42 = v33;
    v43 = @"adsUserID";
  }
  -[FCUserInfo _setUserInfoValue:forKey:](v41, v42, v43);
  id v36 = v31;
LABEL_46:
  long long v240 = 0u;
  long long v241 = 0u;
  long long v238 = 0u;
  long long v239 = 0u;
  long long v44 = objc_msgSend(a1, "observers", v178);
  long long v45 = (void *)[v44 copy];

  uint64_t v46 = [v45 countByEnumeratingWithState:&v238 objects:buf count:16];
  if (v46)
  {
    uint64_t v47 = v46;
    uint64_t v48 = *(void *)v239;
    do
    {
      for (uint64_t j = 0; j != v47; ++j)
      {
        if (*(void *)v239 != v48) {
          objc_enumerationMutation(v45);
        }
        long long v50 = *(void **)(*((void *)&v238 + 1) + 8 * j);
        if (objc_opt_respondsToSelector()) {
          [v50 userInfoDidChangeAdsUserID:v230 fromCloud:1];
        }
      }
      uint64_t v47 = [v45 countByEnumeratingWithState:&v238 objects:buf count:16];
    }
    while (v47);
  }

  a1 = v230;
  v35 = v178;
LABEL_56:

  long long v51 = obj;
  v52 = [obj objectForKeyedSubscript:@"sportsUserID"];
  id v53 = v193;
  id v54 = v52;
  v55 = v54;
  v194 = v53;
  if (v54 && [v54 length])
  {
    if (v53 && [v53 length] && (objc_msgSend(v53, "isEqualToString:", v55) & 1) != 0) {
      goto LABEL_80;
    }
    -[FCUserInfo _setUserInfoValue:forKey:]((uint64_t)a1, v55, @"sportsUserID");
  }
  else
  {
    if (!v53 || ![v53 length])
    {
      v56 = -[FCUserInfo _temporaryUserIDForKey:]((uint64_t)a1, @"sportsUserID");
      v57 = v56;
      if (v56)
      {
        id v53 = v56;
        v58 = v194;
      }
      else
      {
        v58 = [MEMORY[0x1E4F29128] UUID];
        id v53 = [v58 UUIDString];
      }
    }
    -[FCUserInfo _persistSportsUserID:](a1, v53);
  }
  long long v240 = 0u;
  long long v241 = 0u;
  long long v238 = 0u;
  long long v239 = 0u;
  v59 = objc_msgSend(a1, "observers", v178);
  v60 = (void *)[v59 copy];

  uint64_t v61 = [v60 countByEnumeratingWithState:&v238 objects:buf count:16];
  if (v61)
  {
    uint64_t v62 = v61;
    uint64_t v63 = *(void *)v239;
    do
    {
      for (uint64_t k = 0; k != v62; ++k)
      {
        if (*(void *)v239 != v63) {
          objc_enumerationMutation(v60);
        }
        v65 = *(void **)(*((void *)&v238 + 1) + 8 * k);
        if (objc_opt_respondsToSelector()) {
          [v65 userInfoDidChangeSportsUserID:a1];
        }
      }
      uint64_t v62 = [v60 countByEnumeratingWithState:&v238 objects:buf count:16];
    }
    while (v62);
  }

  long long v51 = obj;
LABEL_80:

  v66 = [v51 objectForKeyedSubscript:@"upsellAppLaunchLastSeenDate"];
  v67 = [v51 objectForKeyedSubscript:@"lastAppLaunchUpsellInstanceID"];
  id v68 = v201;
  id v69 = v199;
  id v70 = v66;
  id v71 = v67;
  if (v70 && (!v68 || [v70 compare:v68] == 1)) {
    -[FCUserInfo _setUserInfoValue:forKey:]((uint64_t)a1, v70, @"upsellAppLaunchLastSeenDate");
  }
  v72 = objc_msgSend(v69, "fc_numberFollowingString:", @"v", v178);
  v73 = objc_msgSend(v71, "fc_numberFollowingString:", @"v");
  v74 = v73;
  if (v73 && (!v72 || [v73 compare:v72] == 1)) {
    -[FCUserInfo _setUserInfoValue:forKey:]((uint64_t)a1, v71, @"lastAppLaunchUpsellInstanceID");
  }

  v75 = [v51 objectForKeyedSubscript:@"puzzleNotificationsEnabled2"];
  v76 = [v51 objectForKeyedSubscript:@"puzzleNotificationsLastChangedDate"];
  id v77 = v197;
  id v78 = v195;
  id v79 = v75;
  id v80 = v76;
  v81 = v80;
  id v200 = v69;
  id v202 = v68;
  v196 = v78;
  v198 = v77;
  if (v80)
  {
    if (v78 && !objc_msgSend(v80, "fc_isLaterThan:", v78)) {
      goto LABEL_112;
    }
    v82 = FCPushNotificationsLog;
    if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v245 = v78;
      __int16 v246 = 2112;
      id v247 = v81;
      _os_log_impl(&dword_1A460D000, v82, OS_LOG_TYPE_DEFAULT, "Changing the puzzle notifications last change date from: %@ to: %@", buf, 0x16u);
    }
    -[FCUserInfo _setUserInfoValue:forKey:]((uint64_t)a1, v81, @"puzzleNotificationsLastChangedDate");
  }
  else if (v78)
  {
    goto LABEL_112;
  }
  int v83 = [v77 BOOLValue];
  if (v83 != [v79 BOOLValue])
  {
    v84 = FCPushNotificationsLog;
    if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v245 = v77;
      __int16 v246 = 2112;
      id v247 = v79;
      _os_log_impl(&dword_1A460D000, v84, OS_LOG_TYPE_DEFAULT, "Changing the puzzle notifications enabled state from: %@ to: %@", buf, 0x16u);
    }
    -[FCUserInfo _setUserInfoValue:forKey:]((uint64_t)a1, v79, @"puzzleNotificationsEnabled2");
    goto LABEL_100;
  }
  if (v81)
  {
LABEL_100:
    v85 = FCPushNotificationsLog;
    if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A460D000, v85, OS_LOG_TYPE_DEFAULT, "Applying changes to puzzle notification state and notifying observers.", buf, 2u);
    }
    long long v240 = 0u;
    long long v241 = 0u;
    long long v238 = 0u;
    long long v239 = 0u;
    v86 = [a1 observers];
    v87 = (void *)[v86 copy];

    uint64_t v88 = [v87 countByEnumeratingWithState:&v238 objects:buf count:16];
    if (v88)
    {
      uint64_t v89 = v88;
      uint64_t v90 = *(void *)v239;
      do
      {
        for (uint64_t m = 0; m != v89; ++m)
        {
          if (*(void *)v239 != v90) {
            objc_enumerationMutation(v87);
          }
          v92 = *(void **)(*((void *)&v238 + 1) + 8 * m);
          if (objc_opt_respondsToSelector()) {
            [v92 userInfoDidChangePuzzleNotificationsEnabled:a1 fromCloud:1];
          }
        }
        uint64_t v89 = [v87 countByEnumeratingWithState:&v238 objects:buf count:16];
      }
      while (v89);
    }

    long long v51 = obj;
    id v77 = v198;
    goto LABEL_114;
  }
LABEL_112:
  v93 = FCPushNotificationsLog;
  if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A460D000, v93, OS_LOG_TYPE_DEFAULT, "No changes to existing puzzle notification state, skipping...", buf, 2u);
  }
LABEL_114:

  v94 = [v51 objectForKeyedSubscript:@"sportsSyncState"];
  v95 = [v51 objectForKeyedSubscript:@"sportsSyncStateLastSavedDate"];
  id v217 = v216;
  id v96 = v187;
  id v97 = v94;
  id v98 = v95;
  v99 = (void *)FCUserInfoLog;
  if (os_log_type_enabled((os_log_t)FCUserInfoLog, OS_LOG_TYPE_DEFAULT))
  {
    v100 = v99;
    v101 = [v96 description];
    v102 = [v98 description];
    *(_DWORD *)buf = 138413058;
    id v245 = v217;
    __int16 v246 = 2112;
    id v247 = v101;
    __int16 v248 = 2112;
    id v249 = v97;
    __int16 v250 = 2112;
    v251 = v102;
    _os_log_impl(&dword_1A460D000, v100, OS_LOG_TYPE_DEFAULT, "Sync local sports sync state, local=%@ localDate=%@, with remote=%@, remoteDate=%@", buf, 0x2Au);
  }
  v188 = v96;
  if (v96 && ([v96 isEqualToDate:v98] & 1) == 0)
  {
    v103 = FCUserInfoLog;
    if (os_log_type_enabled((os_log_t)FCUserInfoLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A460D000, v103, OS_LOG_TYPE_DEFAULT, "Remote date and local sports sync state has changed, firing observers", buf, 2u);
    }
    long long v240 = 0u;
    long long v241 = 0u;
    long long v238 = 0u;
    long long v239 = 0u;
    v104 = [a1 observers];
    v105 = (void *)[v104 copy];

    uint64_t v106 = [v105 countByEnumeratingWithState:&v238 objects:buf count:16];
    if (v106)
    {
      uint64_t v107 = v106;
      uint64_t v108 = *(void *)v239;
      do
      {
        for (uint64_t n = 0; n != v107; ++n)
        {
          if (*(void *)v239 != v108) {
            objc_enumerationMutation(v105);
          }
          v110 = *(void **)(*((void *)&v238 + 1) + 8 * n);
          if (objc_opt_respondsToSelector()) {
            [v110 userInfoDidChangeSportsSyncState:v230];
          }
        }
        uint64_t v107 = [v105 countByEnumeratingWithState:&v238 objects:buf count:16];
      }
      while (v107);
    }

    a1 = v230;
    long long v51 = obj;
    id v96 = v188;
  }

  v111 = [v51 objectForKeyedSubscript:@"sportsOnboardingState"];
  v112 = [v51 objectForKeyedSubscript:@"sportsOnboardingCompletedDate"];
  id v215 = v214;
  id v113 = v185;
  id v114 = v111;
  id v115 = v112;
  v116 = (void *)FCUserInfoLog;
  if (os_log_type_enabled((os_log_t)FCUserInfoLog, OS_LOG_TYPE_DEFAULT))
  {
    v117 = v116;
    v118 = [v113 description];
    v119 = [v115 description];
    *(_DWORD *)buf = 138413058;
    id v245 = v215;
    __int16 v246 = 2112;
    id v247 = v118;
    __int16 v248 = 2112;
    id v249 = v114;
    __int16 v250 = 2112;
    v251 = v119;
    _os_log_impl(&dword_1A460D000, v117, OS_LOG_TYPE_DEFAULT, "Sync local sports onboarding state, local=%@ localDate=%@, with remote=%@, remoteDate=%@", buf, 0x2Au);
  }
  v186 = v113;
  if (v113 && ([v113 isEqualToDate:v115] & 1) == 0)
  {
    v120 = FCUserInfoLog;
    if (os_log_type_enabled((os_log_t)FCUserInfoLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A460D000, v120, OS_LOG_TYPE_DEFAULT, "Remote date and local sports onboarding state has changed, firing observers", buf, 2u);
    }
    long long v240 = 0u;
    long long v241 = 0u;
    long long v238 = 0u;
    long long v239 = 0u;
    v121 = [a1 observers];
    v122 = (void *)[v121 copy];

    uint64_t v123 = [v122 countByEnumeratingWithState:&v238 objects:buf count:16];
    if (v123)
    {
      uint64_t v124 = v123;
      uint64_t v125 = *(void *)v239;
      do
      {
        for (iuint64_t i = 0; ii != v124; ++ii)
        {
          if (*(void *)v239 != v125) {
            objc_enumerationMutation(v122);
          }
          v127 = *(void **)(*((void *)&v238 + 1) + 8 * ii);
          if (objc_opt_respondsToSelector()) {
            [v127 userInfoDidChangeSportsOnboardingState:v230];
          }
        }
        uint64_t v124 = [v122 countByEnumeratingWithState:&v238 objects:buf count:16];
      }
      while (v124);
    }

    a1 = v230;
    long long v51 = obj;
    id v113 = v186;
  }

  v128 = [v51 objectForKeyedSubscript:@"shortcutsOnboardingState"];
  v129 = [v51 objectForKeyedSubscript:@"shortcutsOnboardingCompletedDate"];
  id v130 = v220;
  id v131 = v219;
  id v132 = v128;
  id v133 = v129;
  v134 = (void *)FCUserInfoLog;
  v213 = v131;
  if (os_log_type_enabled((os_log_t)FCUserInfoLog, OS_LOG_TYPE_DEFAULT))
  {
    v135 = v134;
    v136 = [v131 description];
    v137 = [v133 description];
    *(_DWORD *)buf = 138413058;
    id v245 = v130;
    __int16 v246 = 2112;
    id v247 = v136;
    __int16 v248 = 2112;
    id v249 = v132;
    __int16 v250 = 2112;
    v251 = v137;
    _os_log_impl(&dword_1A460D000, v135, OS_LOG_TYPE_DEFAULT, "Sync local shortcuts onboarding state, local=%@ localDate=%@, with remote=%@, remoteDate=%@", buf, 0x2Au);

    id v131 = v213;
  }
  v205 = v130;
  if (v131 == v133)
  {
    if (v130 != v132)
    {
LABEL_153:
      v139 = FCUserInfoLog;
      if (os_log_type_enabled((os_log_t)FCUserInfoLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A460D000, v139, OS_LOG_TYPE_DEFAULT, "Remote date and local shortcuts onboarding state has changed, firing observers", buf, 2u);
      }
      long long v240 = 0u;
      long long v241 = 0u;
      long long v238 = 0u;
      long long v239 = 0u;
      v140 = [a1 observers];
      v141 = (void *)[v140 copy];

      uint64_t v142 = [v141 countByEnumeratingWithState:&v238 objects:buf count:16];
      if (v142)
      {
        uint64_t v143 = v142;
        uint64_t v144 = *(void *)v239;
        do
        {
          for (juint64_t j = 0; jj != v143; ++jj)
          {
            if (*(void *)v239 != v144) {
              objc_enumerationMutation(v141);
            }
            v146 = *(void **)(*((void *)&v238 + 1) + 8 * jj);
            if (objc_opt_respondsToSelector()) {
              [v146 userInfoDidChangeShortcutsOnboardingState:a1];
            }
          }
          uint64_t v143 = [v141 countByEnumeratingWithState:&v238 objects:buf count:16];
        }
        while (v143);
      }

      long long v51 = obj;
      id v130 = v205;
      id v131 = v213;
    }
  }
  else
  {
    char v138 = [v131 isEqualToDate:v133];
    if (v130 != v132 || (v138 & 1) == 0) {
      goto LABEL_153;
    }
  }

  v147 = [v51 objectForKeyedSubscript:@"feldsparID"];
  int v228 = [v212 isEqualToString:v147];

  v148 = [v51 objectForKeyedSubscript:@"finishFirstLaunchVersion"];
  int v227 = [v210 isEqual:v148];

  uint64_t v149 = [v51 objectForKeyedSubscript:@"lastViewedSavedDate"];
  v181 = (void *)v149;
  if (v211 == (void *)v149) {
    int v226 = 0;
  }
  else {
    int v226 = [v211 isEqualToDate:v149] ^ 1;
  }
  uint64_t v150 = [v51 objectForKeyedSubscript:@"editorialArticleVersion"];
  v151 = (void *)v150;
  int v229 = 0;
  if (v218 && v150) {
    int v229 = [v218 isEqualToString:v150] ^ 1;
  }
  v180 = v151;
  int v152 = [v209 BOOLValue];
  v153 = [v51 objectForKeyedSubscript:@"marketingNotificationsEnabled"];
  int v154 = [v153 BOOLValue];

  int v155 = [v208 BOOLValue];
  v156 = [v51 objectForKeyedSubscript:@"newIssueNotificationsEnabled"];
  int v157 = [v156 BOOLValue];

  int v222 = [v207 BOOLValue];
  v158 = [v51 objectForKeyedSubscript:@"endOfAudioNotificationsEnabled"];
  int v221 = [v158 BOOLValue];

  uint64_t v225 = [v206 integerValue];
  v159 = [v51 objectForKeyedSubscript:@"sportsTopicNotificationsEnabledState2"];
  uint64_t v160 = [v159 integerValue];

  uint64_t v161 = [v51 objectForKeyedSubscript:@"lastViewedSharedWithYouDate"];
  v162 = v204;
  v179 = (void *)v161;
  if (v204 == (void *)v161) {
    int v163 = 0;
  }
  else {
    int v163 = [v204 isEqualToDate:v161] ^ 1;
  }
  int v164 = v152 ^ v154;
  int v165 = v155 ^ v157;
  v166 = [obj objectForKeyedSubscript:@"puzzleStatsStartDate"];
  v167 = v203;
  if (v203 == v166) {
    int v168 = 0;
  }
  else {
    int v168 = [v203 isEqualToDate:v166] ^ 1;
  }
  v170 = v200;
  v169 = v202;
  if (((v228 & v227 ^ 1 | v226 | v229 | v164 | v165 | v163) & 1) != 0 || v168)
  {
    long long v233 = 0u;
    long long v234 = 0u;
    long long v231 = 0u;
    long long v232 = 0u;
    v171 = [v230 observers];
    v172 = (void *)[v171 copy];

    id obja = v172;
    uint64_t v173 = [v172 countByEnumeratingWithState:&v231 objects:v242 count:16];
    if (v173)
    {
      uint64_t v174 = v173;
      uint64_t v175 = *(void *)v232;
      do
      {
        for (kuint64_t k = 0; kk != v174; ++kk)
        {
          if (*(void *)v232 != v175) {
            objc_enumerationMutation(obja);
          }
          v177 = *(void **)(*((void *)&v231 + 1) + 8 * kk);
          if (v228 & 1) == 0 && (objc_opt_respondsToSelector()) {
            [v177 userInfoDidChangeFeldsparID:v230 fromCloud:1];
          }
          if (v227 & 1) == 0 && (objc_opt_respondsToSelector()) {
            [v177 userInfoDidChangeOnboardingStatus:v230];
          }
          if (v226 && (objc_opt_respondsToSelector() & 1) != 0) {
            [v177 userInfoDidChangeDateLastViewedSaved:v230 fromCloud:1];
          }
          if (v229 && (objc_opt_respondsToSelector() & 1) != 0) {
            [v177 userInfoDidChangeEditorialArticleVersion:v230];
          }
          if (v164 && (objc_opt_respondsToSelector() & 1) != 0) {
            [v177 userInfoDidChangeMarketingNotificationsEnabled:v230 fromCloud:1];
          }
          if (v165 && (objc_opt_respondsToSelector() & 1) != 0) {
            [v177 userInfoDidChangeNewIssueNotificationsEnabled:v230 fromCloud:1];
          }
          if (v222 != v221 && (objc_opt_respondsToSelector() & 1) != 0) {
            [v177 userInfoDidChangeEndOfAudioTrackNotificationsEnabled:v230 fromCloud:1];
          }
          if (v225 != v160 && (objc_opt_respondsToSelector() & 1) != 0) {
            [v177 userInfoDidChangeSportsTopicNotificationsEnabledState:v230 fromCloud:1];
          }
          if (v163 && (objc_opt_respondsToSelector() & 1) != 0) {
            [v177 userInfoDidChangeDateLastViewedSharedWithYou:v230 fromCloud:1];
          }
          if (v168 && (objc_opt_respondsToSelector() & 1) != 0) {
            [v177 userInfoDidChangeDatePuzzleStatsStart:v230 fromCloud:1];
          }
        }
        uint64_t v174 = [obja countByEnumeratingWithState:&v231 objects:v242 count:16];
      }
      while (v174);
    }

    v167 = v203;
    v162 = v204;
    v170 = v200;
    v169 = v202;
  }

  id v3 = v184;
LABEL_218:
}

- (id)allKnownRecordNamesWithinRecordZoneWithID:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F29060], "isMainThread", a3);
  id v4 = [MEMORY[0x1E4F1CA48] array];
  [v4 addObject:@"user_info_static_record_name"];
  int v5 = [(FCUserInfo *)self tagSettings];
  id v6 = [v5 allTagSettingsRecordNames];
  [v4 addObjectsFromArray:v6];

  uint64_t v7 = [(FCUserInfo *)self puzzleTypeSettings];
  id v8 = [v7 allPuzzleTypeSettingsRecordNames];
  [v4 addObjectsFromArray:v8];

  return v4;
}

void __43__FCUserInfo_handleSyncWithUserInfoRecord___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = __FCCKUserInfoKeys_block_invoke();
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", v9, (void)v11) & 1) == 0)
        {
          uint64_t v10 = [*(id *)(a1 + 40) objectForKeyedSubscript:v9];
          [v3 setObject:v10 forKey:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
}

- (void)markSharedWithYouAsViewed
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  [MEMORY[0x1E4F29060] isMainThread];
  id v3 = [MEMORY[0x1E4F1C9C8] date];
  -[FCUserInfo _setUserInfoValue:forKey:]((uint64_t)self, v3, @"lastViewedSharedWithYouDate");
  id v4 = [FCModifyUserInfoCommand alloc];
  uint64_t v5 = -[FCUserInfo asCKRecord]((id *)&self->super.super.isa);
  uint64_t v6 = [(FCModifyUserInfoCommand *)v4 initWithUserInfoRecord:v5];

  [(FCPrivateDataController *)self addCommandToCommandQueue:v6];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v7 = [(FCPrivateDataController *)self observers];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        long long v12 = *(void **)(*((void *)&v13 + 1) + 8 * v11);
        if (objc_opt_respondsToSelector()) {
          [v12 userInfoDidChangeDateLastViewedSharedWithYou:self fromCloud:0];
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }
}

- (NSDate)dateLastViewedSharedWithYou
{
  return (NSDate *)-[FCUserInfo _userInfoValueForKey:]((id *)&self->super.super.isa, @"lastViewedSharedWithYouDate");
}

+ (BOOL)requiresPushNotificationSupport
{
  return 1;
}

+ (BOOL)requiresBatchedSync
{
  return 0;
}

+ (BOOL)requiresHighPriorityFirstSync
{
  return 1;
}

+ (id)backingRecordZoneIDs
{
  v6[1] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F1A320]);
  id v3 = (void *)[v2 initWithZoneName:@"UserInfo" ownerName:*MEMORY[0x1E4F19C08]];
  v6[0] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];

  return v4;
}

+ (id)backingRecordIDs
{
  return (id)MEMORY[0x1E4F1CBF0];
}

+ (id)commandsToMergeLocalDataToCloud:(id)a3 privateDataDirectory:(id)a4
{
  uint64_t v5 = (void *)MEMORY[0x1E4F1CA48];
  id v6 = a3;
  uint64_t v7 = [v5 array];
  uint64_t v8 = [FCModifyUserInfoCommand alloc];
  uint64_t v9 = [v6 asDictionary];
  uint64_t v10 = +[FCUserInfo userInfoCKRecordFromUserInfoDictionary:]((uint64_t)a1, v9);
  uint64_t v11 = [(FCModifyUserInfoCommand *)v8 initWithUserInfoRecord:v10];

  [v7 addObject:v11];
  long long v12 = +[FCTagSettings commandsToMergeLocalDataToCloud:v6];
  [v7 addObjectsFromArray:v12];
  long long v13 = +[FCPuzzleTypeSettings commandsToMergeLocalDataToCloud:v6];

  [v7 addObjectsFromArray:v13];
  return v7;
}

- (BOOL)canHelpRestoreZoneName:(id)a3
{
  return [a3 isEqualToString:@"UserInfo"];
}

- (id)recordsForRestoringZoneName:(id)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __42__FCUserInfo_recordsForRestoringZoneName___block_invoke;
  v5[3] = &unk_1E5B4BF30;
  v5[4] = self;
  id v3 = objc_msgSend(MEMORY[0x1E4F1C978], "fc_array:", v5);
  return v3;
}

void __42__FCUserInfo_recordsForRestoringZoneName___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(id **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = -[FCUserInfo asCKRecord](v3);
  [v4 addObject:v5];

  id v6 = [*(id *)(a1 + 32) tagSettings];
  uint64_t v7 = [v6 allTagSettingsRecords];
  [v4 addObjectsFromArray:v7];

  id v9 = [*(id *)(a1 + 32) puzzleTypeSettings];
  uint64_t v8 = [v9 allPuzzleTypeSettingsRecords];
  [v4 addObjectsFromArray:v8];
}

uint64_t __39__FCUserInfo__setUserInfoValue_forKey___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setObject:*(void *)(a1 + 40) forKeyedSubscript:*(void *)(a1 + 32)];
}

void __39__FCUserInfo__modifyUserInfoWithBlock___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) localStore];
  id v2 = [v3 asDictionary];
  -[FCUserInfo setReadOnlyUserInfo:](*(void *)(a1 + 32), v2);
}

- (void)setTagSettings:(id)a3
{
}

- (void)setPuzzleTypeSettings:(id)a3
{
}

- (BOOL)useParsecResults
{
  return self->_useParsecResults;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfoLock, 0);
  objc_storeStrong((id *)&self->_readOnlyUserInfo, 0);
  objc_storeStrong((id *)&self->_puzzleTypeSettings, 0);
  objc_storeStrong((id *)&self->_tagSettings, 0);
}

@end