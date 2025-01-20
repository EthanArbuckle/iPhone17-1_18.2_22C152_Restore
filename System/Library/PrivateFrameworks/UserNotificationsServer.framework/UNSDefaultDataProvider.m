@interface UNSDefaultDataProvider
- (BBDataProviderProxy)proxy;
- (BOOL)_isAppProtectionActive;
- (BOOL)_isEligibleForPipeline;
- (BOOL)_isResourceValidForPath:(id)a3 withContainerPath:(id)a4;
- (BOOL)_isTCCUserAvailabilityGrantedForBundleId:(id)a3;
- (BOOL)_queue_supportsCriticalAlertsForSubsectionIDs:(id)a3;
- (BOOL)_queue_supportsTimeSensitiveAlertsforSubsectionIDs:(id)a3;
- (BOOL)syncsBulletinDismissal;
- (BSCFBundle)bundle;
- (UNSDefaultDataProvider)initWithNotificationSourceDescription:(id)a3 applicationLauncher:(id)a4 daemonLauncher:(id)a5 categoryRepository:(id)a6 notificationRepository:(id)a7 topicRepository:(id)a8 attachmentsService:(id)a9 localizationService:(id)a10 summaryService:(id)a11 queue:(id)a12;
- (id)_actionFromActionRecord:(id)a3;
- (id)_actionsFromActionRecords:(id)a3;
- (id)_allBulletinsWithMaxCount:(unint64_t)a3 sinceDate:(id)a4;
- (id)_allCategories;
- (id)_bbContactFromUNContact:(id)a3;
- (id)_bbContentTypeFromUNContentType:(id)a3 toneAlertType:(int64_t)a4;
- (id)_categoryForIdentifier:(id)a3;
- (id)_categoryForNotification:(id)a3;
- (id)_defaultActionWithNotification:(id)a3;
- (id)_dismissActionForCategory:(id)a3;
- (id)_followActivityActionForCategory:(id)a3;
- (id)_localizeClientString:(id)a3 inBundle:(id)a4;
- (id)_pathForSoundName:(id)a3;
- (id)_queue_applicableSectionInfosForSubsectionIDs:(id)a3;
- (id)_queue_bulletinForNotification:(id)a3;
- (id)_safeAttributedMessageWithAttributedMessage:(id)a3 contentType:(id)a4;
- (id)_sectionIconForNotificationSourceDescription:(id)a3;
- (id)_sectionIconVariantForImageName:(id)a3 bundlePath:(id)a4 format:(int64_t)a5 precomposed:(BOOL)a6;
- (id)_silenceActionForCategory:(id)a3;
- (id)_soundsDirectoryPathForContainerBasePath:(id)a3;
- (id)_supplementaryActionsForForCategoryRecord:(id)a3;
- (id)_topicForIdentifier:(id)a3;
- (id)_unarchiveNotificationFromData:(id)a3;
- (id)_userAvailabilityTCCApprovedBundleIds;
- (id)bulletinsWithRequestParameters:(id)a3 lastCleared:(id)a4;
- (id)clearedInfoAndBulletinsForClearingAllBulletinsWithLimit:(unint64_t)a3 lastClearedInfo:(id)a4;
- (id)clearedInfoForBulletins:(id)a3 lastClearedInfo:(id)a4;
- (id)defaultSectionInfo;
- (id)defaultSubsectionInfos;
- (id)displayNameForSubsectionID:(id)a3;
- (id)notificationRecords;
- (id)sectionBundlePath;
- (id)sectionDisplayName;
- (id)sectionIcon;
- (id)sectionIdentifier;
- (id)sectionParameters;
- (id)sortDescriptors;
- (id)universalSectionIdentifier;
- (unint64_t)_bulletinInterruptionLevelForInterruptionLevel:(unint64_t)a3;
- (unint64_t)_bulletinPriorityStatusForNotificationPriorityStatus:(unint64_t)a3;
- (unint64_t)_bulletinSummaryStatusForNotificationSummaryStatus:(unint64_t)a3;
- (unint64_t)_destinationsForNotification:(id)a3;
- (unint64_t)_notificationRecordPriorityStatusForBulletinStatus:(unint64_t)a3;
- (unint64_t)_notificationRecordSummaryStatusForBulletinStatus:(unint64_t)a3;
- (void)_addAttachments:(id)a3 toBulletinRequest:(id)a4;
- (void)_handleBulletinActionResponse:(id)a3 withCompletion:(id)a4;
- (void)_queue_addBulletinForNotification:(id)a3 shouldRepost:(BOOL)a4;
- (void)_queue_fetchBulletinForNotification:(id)a3;
- (void)_queue_modifyBulletinForNotification:(id)a3;
- (void)_queue_notificationRepositoryDidPerformUpdates:(id)a3;
- (void)_queue_saveResultNotificationRecord:(id)a3 shouldRepost:(BOOL)a4 isFailure:(BOOL)a5 resultBulletin:(id)a6;
- (void)_queue_withdrawBulletinForNotification:(id)a3 shouldSync:(BOOL)a4;
- (void)_setNotificationSourceDescription:(id)a3;
- (void)categoryRepository:(id)a3 didChangeCategoriesForBundleIdentifier:(id)a4;
- (void)dataProviderDidLoad;
- (void)dealloc;
- (void)handleBulletinActionResponse:(id)a3 withCompletion:(id)a4;
- (void)invalidate;
- (void)notificationRepository:(id)a3 didDiscoverContentOnFirstUnlockForBundleIdentifier:(id)a4;
- (void)notificationRepository:(id)a3 didPerformUpdates:(id)a4 forBundleIdentifier:(id)a5;
- (void)setBundle:(id)a3;
- (void)setEffectiveSectionInfo:(id)a3;
- (void)setNotificationSourceDescription:(id)a3;
- (void)setProxy:(id)a3;
- (void)summaryServiceAdapter:(id)a3 didReceiveGroupSummariesForNotificationIdentifiers:(id)a4;
- (void)topicRepository:(id)a3 didChangeTopicsForBundleIdentifier:(id)a4;
- (void)uninstall;
- (void)unloadBundle;
@end

@implementation UNSDefaultDataProvider

- (UNSDefaultDataProvider)initWithNotificationSourceDescription:(id)a3 applicationLauncher:(id)a4 daemonLauncher:(id)a5 categoryRepository:(id)a6 notificationRepository:(id)a7 topicRepository:(id)a8 attachmentsService:(id)a9 localizationService:(id)a10 summaryService:(id)a11 queue:(id)a12
{
  id v34 = a3;
  id v33 = a4;
  id v32 = a5;
  id v31 = a6;
  id v30 = a7;
  id v29 = a8;
  id v28 = a9;
  id v27 = a10;
  id v26 = a11;
  id v25 = a12;
  v35.receiver = self;
  v35.super_class = (Class)UNSDefaultDataProvider;
  v18 = [(UNSDefaultDataProvider *)&v35 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_queue, a12);
    objc_storeStrong((id *)&v19->_appLauncher, a4);
    objc_storeStrong((id *)&v19->_daemonLauncher, a5);
    objc_storeStrong((id *)&v19->_categoryRepository, a6);
    objc_storeStrong((id *)&v19->_topicRepository, a8);
    objc_storeStrong((id *)&v19->_notificationRepository, a7);
    objc_storeStrong((id *)&v19->_attachmentsService, a9);
    objc_storeStrong((id *)&v19->_localizationService, a10);
    objc_storeStrong((id *)&v19->_summaryService, a11);
    uint64_t v20 = [MEMORY[0x263EFF9A0] dictionary];
    categoryToParamSubType = v19->_categoryToParamSubType;
    v19->_categoryToParamSubType = (NSMutableDictionary *)v20;

    [(UNSDefaultDataProvider *)v19 _setNotificationSourceDescription:v34];
    id v22 = [(UNSDefaultDataProvider *)v19 sectionParameters];
    v23 = [v34 bundleIdentifier];
    [(UNCNotificationRepository *)v19->_notificationRepository addObserver:v19 forBundleIdentifier:v23];
    [(UNSNotificationCategoryRepository *)v19->_categoryRepository addObserver:v19 forBundleIdentifier:v23];
    [(UNCNotificationTopicRepository *)v19->_topicRepository addObserver:v19 forBundleIdentifier:v23];
    [(UNSSummaryServiceAdapter *)v19->_summaryService addObserver:v19 forBundleIdentifier:v23];
  }
  return v19;
}

- (void)_setNotificationSourceDescription:(id)a3
{
  v4 = (UNCNotificationSourceDescription *)a3;
  v5 = [(UNSDefaultDataProvider *)self _sectionIconForNotificationSourceDescription:v4];
  sectionIcon = self->_sectionIcon;
  self->_sectionIcon = v5;

  notificationSourceDescription = self->_notificationSourceDescription;
  self->_notificationSourceDescription = v4;
  v8 = v4;

  LOBYTE(notificationSourceDescription) = [(UNCNotificationSourceDescription *)self->_notificationSourceDescription suppressUserAuthorizationPrompt];
  self->_suppressUserAuthorizationPrompt = (char)notificationSourceDescription;
}

- (BSCFBundle)bundle
{
  bundle = self->_bundle;
  if (!bundle)
  {
    bundle = self->_notificationSourceDescription;
    if (bundle)
    {
      localizationService = self->_localizationService;
      v5 = [(BSCFBundle *)bundle bundleIdentifier];
      v6 = [(UNCLocalizationService *)localizationService bundleWithIdentifier:v5];
      v7 = self->_bundle;
      self->_bundle = v6;

      bundle = self->_bundle;
    }
  }
  return bundle;
}

- (void)unloadBundle
{
  localizationService = self->_localizationService;
  v4 = [(BSCFBundle *)self->_bundle bundleIdentifier];
  [(UNCLocalizationService *)localizationService unloadBundleWithIdentifier:v4];

  bundle = self->_bundle;
  self->_bundle = 0;
}

- (void)setNotificationSourceDescription:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(UNSDefaultDataProvider *)self unloadBundle];
  int v5 = [(UNCNotificationSourceDescription *)self->_notificationSourceDescription isRestricted];
  int v6 = [(UNCNotificationSourceDescription *)self->_notificationSourceDescription allowTimeSensitive];
  int v7 = [(UNCNotificationSourceDescription *)self->_notificationSourceDescription allowMessages];
  [(UNSDefaultDataProvider *)self _setNotificationSourceDescription:v4];
  int v8 = [v4 isRestricted];
  int v9 = [v4 allowTimeSensitive];
  int v10 = [v4 allowMessages];

  if (v5 != v8 || ((v6 ^ v9) & 1) != 0 || v7 != v10)
  {
    v11 = (void *)*MEMORY[0x263F1E020];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E020], OS_LOG_TYPE_DEFAULT))
    {
      v12 = v11;
      v13 = [(UNSDefaultDataProvider *)self sectionIdentifier];
      *(_DWORD *)buf = 138544898;
      v17 = v13;
      __int16 v18 = 1024;
      int v19 = v5;
      __int16 v20 = 1024;
      int v21 = v8;
      __int16 v22 = 1024;
      int v23 = v6;
      __int16 v24 = 1024;
      int v25 = v9;
      __int16 v26 = 1024;
      int v27 = v7;
      __int16 v28 = 1024;
      int v29 = v10;
      _os_log_impl(&dword_22289A000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] defaultSectionInfo changed [ isRestricted %{BOOL}d -> %{BOOL}d, allowTimeSensitive %{BOOL}d -> %{BOOL}d, allowMessages %{BOOL}d -> %{BOOL}d]", buf, 0x30u);
    }
    queue = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __59__UNSDefaultDataProvider_setNotificationSourceDescription___block_invoke;
    block[3] = &unk_26462F900;
    block[4] = self;
    dispatch_async(queue, block);
  }
}

uint64_t __59__UNSDefaultDataProvider_setNotificationSourceDescription___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 104) reloadDefaultSectionInfo];
}

- (void)dealloc
{
  [(UNSDefaultDataProvider *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)UNSDefaultDataProvider;
  [(UNSDefaultDataProvider *)&v3 dealloc];
}

- (void)dataProviderDidLoad
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  objc_super v3 = (void *)*MEMORY[0x263F1E020];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E020], OS_LOG_TYPE_DEFAULT))
  {
    id v4 = v3;
    int v5 = [(UNSDefaultDataProvider *)self sectionIdentifier];
    int v6 = 138543362;
    int v7 = v5;
    _os_log_impl(&dword_22289A000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] data provider loaded", (uint8_t *)&v6, 0xCu);
  }
  [(UNSDefaultDataProvider *)self unloadBundle];
}

- (void)uninstall
{
  [(UNSDefaultDataProvider *)self invalidate];
  notificationRepository = self->_notificationRepository;
  id v4 = [(UNSDefaultDataProvider *)self sectionIdentifier];
  [(UNCNotificationRepository *)notificationRepository removeStoreForBundleIdentifier:v4];
}

- (void)invalidate
{
  notificationRepository = self->_notificationRepository;
  id v4 = [(UNSDefaultDataProvider *)self sectionIdentifier];
  [(UNCNotificationRepository *)notificationRepository removeObserver:self forBundleIdentifier:v4];

  summaryService = self->_summaryService;
  int v6 = [(UNSDefaultDataProvider *)self sectionIdentifier];
  [(UNSSummaryServiceAdapter *)summaryService removeObserver:self forBundleIdentifier:v6];

  int v7 = [MEMORY[0x263F08A00] defaultCenter];
  [v7 removeObserver:self];

  proxy = self->_proxy;
  self->_proxy = 0;
}

- (id)_localizeClientString:(id)a3 inBundle:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v7 = objc_msgSend(v5, "un_localizedStringKey");
    uint64_t v8 = objc_msgSend(v5, "un_localizedStringArguments");
    [v6 cfBundle];
    int v9 = objc_msgSend(v5, "un_localizedStringValue");
    int v10 = UNFormatLocalizedStringInBundleWithDefaultValue();
  }
  else
  {
    int v10 = [v6 localizedStringForKey:v5 value:&stru_26D509FA0 table:0];
  }

  return v10;
}

- (id)sectionParameters
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263F2BCB8]);
  [v3 setUsesVariableLayout:1];
  if ([(UNCNotificationSourceDescription *)self->_notificationSourceDescription allowUnlimitedContentBody])uint64_t v4 = -1; {
  else
  }
    uint64_t v4 = 4;
  [v3 setMessageNumberOfLines:v4];
  id v24 = v3;
  id v5 = [v3 defaultSubtypeParameters];
  [v5 setSuppressesAlertsWhenAppIsActive:0];
  [v5 setSuppressesTitle:1];
  __int16 v22 = v5;
  [v5 setIPodOutAlertType:3];
  [(UNSDefaultDataProvider *)self _allCategories];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v26 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v26)
  {
    uint64_t v25 = *(void *)v28;
    uint64_t v6 = 1;
    do
    {
      for (uint64_t i = 0; i != v26; ++i)
      {
        if (*(void *)v28 != v25) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        int v9 = [v8 identifier];
        if (v9)
        {
          categoryToParamSubType = self->_categoryToParamSubType;
          v11 = (void *)[objc_alloc(NSNumber) initWithInteger:v6];
          [(NSMutableDictionary *)categoryToParamSubType setObject:v11 forKey:v9];

          v12 = [v24 parametersForSubtype:v6];
          v13 = [v8 privateBody];
          v14 = [(UNSDefaultDataProvider *)self bundle];
          v15 = [(UNSDefaultDataProvider *)self _localizeClientString:v13 inBundle:v14];

          [v12 setHiddenPreviewsBodyPlaceholder:v15];
          v16 = [v8 summaryFormat];
          v17 = [(UNSDefaultDataProvider *)self bundle];
          __int16 v18 = [(UNSDefaultDataProvider *)self _localizeClientString:v16 inBundle:v17];

          [v12 setSubtypeSummaryFormat:v18];
          if ([(UNCNotificationSourceDescription *)self->_notificationSourceDescription allowPrivateProperties])
          {
            objc_msgSend(v12, "setAllowsAutomaticRemovalFromLockScreen:", objc_msgSend(v8, "preventAutomaticRemovalFromRecent") ^ 1);
            objc_msgSend(v12, "setRevealsAdditionalContentOnPresentation:", objc_msgSend(v8, "revealAdditionalContentWhenPresented"));
            objc_msgSend(v12, "setPlaysMediaWhenRaised:", objc_msgSend(v8, "playMediaWhenRaised"));
            objc_msgSend(v12, "setPreventLock:", objc_msgSend(v8, "preventAutomaticLock"));
            objc_msgSend(v12, "setShouldDismissBulletinWhenClosed:", objc_msgSend(v8, "preventDismissWhenClosed") ^ 1);
            objc_msgSend(v12, "setAllowsPersistentBannersInCarPlay:", objc_msgSend(v8, "shouldAllowPersistentBannersInCarPlay"));
            objc_msgSend(v12, "setAllowsSupplementaryActionsInCarPlay:", objc_msgSend(v8, "shouldAllowActionsInCarPlay"));
            objc_msgSend(v12, "setShowsUnreadIndicatorForNoticesFeed:", objc_msgSend(v8, "alwaysDisplayNotificationsIndicator"));
            objc_msgSend(v12, "setSuppressDelayForForwardedBulletins:", objc_msgSend(v8, "suppressDelayForForwardedNotifications"));
            objc_msgSend(v12, "setHideDismissActionInCarPlay:", objc_msgSend(v8, "suppressDismissActionInCarPlay"));
            objc_msgSend(v12, "setSuppressPresentationInAmbient:", objc_msgSend(v8, "suppressPresentationInAmbient"));
          }
          uint64_t v19 = [v8 privacyOptionShowTitle];
          if ([v8 privacyOptionShowSubtitle]) {
            uint64_t v20 = v19 | 2;
          }
          else {
            uint64_t v20 = v19;
          }
          [v12 setPrivacySettings:v20];
          ++v6;
        }
      }
      uint64_t v26 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v26);
  }

  return v24;
}

- (id)sectionIcon
{
  return self->_sectionIcon;
}

- (id)sectionDisplayName
{
  return (id)[(UNCNotificationSourceDescription *)self->_notificationSourceDescription displayName];
}

- (id)defaultSectionInfo
{
  id v3 = [(UNSDefaultDataProvider *)self sectionIdentifier];
  uint64_t v4 = [(UNCNotificationSourceDescription *)self->_notificationSourceDescription isRestricted];
  int v5 = [(UNCNotificationSourceDescription *)self->_notificationSourceDescription suppressUserAuthorizationPrompt];
  int v6 = [(UNCNotificationSourceDescription *)self->_notificationSourceDescription automaticallyShowSettings];
  uint64_t v7 = [(UNCNotificationSourceDescription *)self->_notificationSourceDescription hideSettings];
  if (_os_feature_enabled_impl()) {
    goto LABEL_2;
  }
  int v9 = [(UNCNotificationSourceDescription *)self->_notificationSourceDescription defaultTopics];
  if ([v9 count])
  {
  }
  else
  {
    int v10 = [(UNCNotificationTopicRepository *)self->_topicRepository topicsForBundleIdentifier:v3];
    uint64_t v11 = [v10 count];

    if (!v11)
    {
LABEL_2:
      uint64_t v8 = 0;
      goto LABEL_7;
    }
  }
  uint64_t v8 = -1;
LABEL_7:
  v12 = [MEMORY[0x263F2BCA8] defaultSectionInfoForType:0];
  [v12 setSectionID:v3];
  [v12 setIsRestricted:v4];
  objc_msgSend(v12, "setIsAppClip:", -[UNCNotificationSourceDescription isAppClip](self->_notificationSourceDescription, "isAppClip"));
  if ((v5 & (v7 | v6)) != 0) {
    uint64_t v13 = 2;
  }
  else {
    uint64_t v13 = 0;
  }
  [v12 setAuthorizationStatus:v13];
  [v12 setSuppressFromSettings:v7];
  [v12 setSuppressedSettings:v8];
  v14 = [(UNCNotificationSourceDescription *)self->_notificationSourceDescription customSettingsBundle];
  [v12 setCustomSettingsBundle:v14];

  v15 = [(UNCNotificationSourceDescription *)self->_notificationSourceDescription customSettingsDetailControllerClass];
  [v12 setCustomSettingsDetailControllerClass:v15];

  v16 = [(UNCNotificationSourceDescription *)self->_notificationSourceDescription defaultSettings];
  if ([(UNCNotificationSourceDescription *)self->_notificationSourceDescription allowTimeSensitive])uint64_t v17 = 2; {
  else
  }
    uint64_t v17 = 0;
  [v12 setTimeSensitiveSetting:v17];
  if ([(UNCNotificationSourceDescription *)self->_notificationSourceDescription allowMessages])uint64_t v18 = 2; {
  else
  }
    uint64_t v18 = 0;
  [v12 setDirectMessagesSetting:v18];
  if ([v12 timeSensitiveSetting] || objc_msgSend(v12, "directMessagesSetting")) {
    [v12 setAnnounceSetting:2];
  }
  if (v16) {
    objc_msgSend(v12, "uns_setPropertiesFromSourceSettingsDescription:", v16);
  }

  return v12;
}

- (id)defaultSubsectionInfos
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v4 = [(UNCNotificationSourceDescription *)self->_notificationSourceDescription defaultTopics];
  if ([v4 count])
  {
    int v5 = objc_msgSend(v4, "bs_map:", &__block_literal_global_6);
    [v3 addObjectsFromArray:v5];
  }
  topicRepository = self->_topicRepository;
  uint64_t v7 = [(UNSDefaultDataProvider *)self sectionIdentifier];
  uint64_t v8 = [(UNCNotificationTopicRepository *)topicRepository topicsForBundleIdentifier:v7];

  int v9 = [v8 sortedArrayUsingComparator:&__block_literal_global_15];
  if (-[UNCNotificationSourceDescription allowPrivateProperties](self->_notificationSourceDescription, "allowPrivateProperties")&& [v9 count])
  {
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __48__UNSDefaultDataProvider_defaultSubsectionInfos__block_invoke_3;
    v12[3] = &unk_26462F9B8;
    v12[4] = self;
    int v10 = objc_msgSend(v9, "bs_map:", v12);
    [v3 addObjectsFromArray:v10];
  }
  return v3;
}

id __48__UNSDefaultDataProvider_defaultSubsectionInfos__block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x263F2BCA8];
  id v3 = a2;
  uint64_t v4 = [v2 defaultSectionInfoForType:2];
  int v5 = [v3 identifier];
  [v4 setSubsectionID:v5];

  objc_msgSend(v4, "uns_setPropertiesFromTopicRecord:", v3);
  if (_os_feature_enabled_impl()) {
    [v4 setSuppressedSettings:-1];
  }
  return v4;
}

uint64_t __48__UNSDefaultDataProvider_defaultSubsectionInfos__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  int v5 = [a2 sortIdentifier];
  int v6 = [v4 sortIdentifier];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

id __48__UNSDefaultDataProvider_defaultSubsectionInfos__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = (void *)MEMORY[0x263F2BCA8];
  id v4 = a2;
  int v5 = [v3 defaultSectionInfoForType:2];
  int v6 = [v4 identifier];
  [v5 setSubsectionID:v6];

  objc_msgSend(v5, "uns_setPropertiesFromTopicRecord:", v4);
  if (_os_feature_enabled_impl())
  {
    uint64_t v7 = [*(id *)(a1 + 32) sectionIdentifier];
    int v8 = [v7 isEqual:@"com.apple.mobilemail"];

    if (v8) {
      uint64_t v9 = -8193;
    }
    else {
      uint64_t v9 = -1;
    }
    [v5 setSuppressedSettings:v9];
  }
  return v5;
}

- (id)_topicForIdentifier:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    [(UNCNotificationSourceDescription *)self->_notificationSourceDescription defaultTopics];
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = [v5 countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v31;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v31 != v8) {
            objc_enumerationMutation(v5);
          }
          int v10 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          uint64_t v11 = [v10 identifier];
          char v12 = [v4 isEqual:v11];

          if (v12)
          {
            id v24 = v10;
            id v16 = v5;
            goto LABEL_22;
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v30 objects:v35 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }

    topicRepository = self->_topicRepository;
    v14 = [(UNSDefaultDataProvider *)self sectionIdentifier];
    v15 = [(UNCNotificationTopicRepository *)topicRepository topicsForBundleIdentifier:v14];

    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v16 = v15;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v26 objects:v34 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v27;
      while (2)
      {
        for (uint64_t j = 0; j != v18; ++j)
        {
          if (*(void *)v27 != v19) {
            objc_enumerationMutation(v16);
          }
          int v21 = *(void **)(*((void *)&v26 + 1) + 8 * j);
          __int16 v22 = objc_msgSend(v21, "identifier", (void)v26);
          char v23 = [v4 isEqual:v22];

          if (v23)
          {
            id v24 = v21;

            goto LABEL_22;
          }
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v26 objects:v34 count:16];
        if (v18) {
          continue;
        }
        break;
      }
    }

    id v24 = 0;
LABEL_22:
  }
  else
  {
    id v24 = 0;
  }

  return v24;
}

- (id)displayNameForSubsectionID:(id)a3
{
  id v4 = [(UNSDefaultDataProvider *)self _topicForIdentifier:a3];
  if (v4)
  {
    id v5 = [(UNSDefaultDataProvider *)self bundle];
    [v5 cfBundle];

    uint64_t v6 = [v4 displayNameLocalizationKey];
    uint64_t v7 = [v4 displayName];
    uint64_t v8 = UNFormatLocalizedStringInBundleWithDefaultValue();
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)universalSectionIdentifier
{
  return (id)[(UNCNotificationSourceDescription *)self->_notificationSourceDescription universalApplicationIdentifier];
}

- (id)_queue_bulletinForNotification:(id)a3
{
  uint64_t v220 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!v4)
  {
    id v31 = 0;
    goto LABEL_165;
  }
  id v5 = [v4 identifier];
  if (![v5 length])
  {
    long long v32 = (void *)*MEMORY[0x263F1E020];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E020], OS_LOG_TYPE_ERROR)) {
      -[UNSDefaultDataProvider _queue_bulletinForNotification:](v32, self);
    }
    id v31 = 0;
    goto LABEL_164;
  }
  uint64_t v6 = [(UNSDefaultDataProvider *)self bundle];
  [v6 cfBundle];

  uint64_t v7 = [v4 titleLocalizationKey];
  uint64_t v8 = [v4 titleLocalizationArguments];
  uint64_t v9 = [v4 title];
  v199 = UNFormatLocalizedStringInBundleWithDefaultValue();

  int v10 = [v4 subtitleLocalizationKey];
  uint64_t v11 = [v4 subtitleLocalizationArguments];
  char v12 = [v4 subtitle];
  v198 = UNFormatLocalizedStringInBundleWithDefaultValue();

  uint64_t v13 = [v4 bodyLocalizationKey];
  v14 = [v4 bodyLocalizationArguments];
  v15 = [v4 body];
  v202 = UNFormatLocalizedStringInBundleWithDefaultValue();

  v204 = [v4 attributedBody];
  v197 = [v4 summaryArgument];
  uint64_t v167 = [v4 summaryArgumentCount];
  uint64_t v16 = [v4 badge];
  uint64_t v164 = [v4 targetContentIdentifier];
  v196 = [v4 userInfo];
  v201 = [(UNSDefaultDataProvider *)self sectionIdentifier];
  uint64_t v17 = [v4 categoryIdentifier];
  v194 = [(UNSDefaultDataProvider *)self _defaultActionWithNotification:v4];
  v195 = (void *)v17;
  v166 = [(UNSDefaultDataProvider *)self _categoryForIdentifier:v17];
  v193 = [(UNSDefaultDataProvider *)self _dismissActionForCategory:v166];
  v192 = [(UNSDefaultDataProvider *)self _followActivityActionForCategory:v166];
  v191 = [(UNSDefaultDataProvider *)self _silenceActionForCategory:v166];
  v190 = [(UNSDefaultDataProvider *)self _supplementaryActionsForForCategoryRecord:v166];
  v189 = [v166 intentIdentifiers];
  v188 = [v4 launchImageName];
  uint64_t v162 = [v4 realertCount];
  v205 = [v4 contentDate];
  id v18 = [v4 date];
  unint64_t v19 = -[UNSDefaultDataProvider _bulletinInterruptionLevelForInterruptionLevel:](self, "_bulletinInterruptionLevelForInterruptionLevel:", [v4 interruptionLevel]);
  [v4 relevanceScore];
  double v21 = v20;
  v187 = [v4 filterCriteria];
  unsigned int v156 = [v4 screenCaptureProhibited];
  v186 = [v4 speechLanguage];
  int v22 = [(UNCNotificationSourceDescription *)self->_notificationSourceDescription allowPrivateProperties];
  v203 = v18;
  if (!v22)
  {
    v182 = 0;
    id v183 = 0;
    uint64_t v33 = 0;
    uint64_t v158 = 0;
    unsigned int v146 = 0;
    int v169 = 0;
    unsigned int v160 = 0;
    unsigned int v143 = 0;
    unsigned int v152 = 0;
    unsigned int v150 = 0;
    unsigned int v180 = 0;
    v208 = 0;
    v184 = 0;
    v185 = 0;
    unsigned int v154 = 1;
    unsigned int v148 = 1;
    id v200 = v18;
    goto LABEL_26;
  }
  char v23 = [v4 headerLocalizationKey];
  id v24 = [v4 headerLocalizationArguments];
  uint64_t v25 = [v4 header];
  v185 = UNFormatLocalizedStringInBundleWithDefaultValue();

  uint64_t v26 = [v4 footerLocalizationKey];
  long long v27 = [v4 footerLocalizationArguments];
  long long v28 = [v4 footer];
  v184 = UNFormatLocalizedStringInBundleWithDefaultValue();

  unsigned int v160 = [v166 presentFullScreenAlertOverList];
  long long v29 = [v166 backgroundStyle];
  LOBYTE(v26) = [v29 isEqualToString:*MEMORY[0x263F84390]];

  if (v26)
  {
    uint64_t v30 = 1;
  }
  else
  {
    id v34 = [v166 backgroundStyle];
    unsigned int v35 = [v34 isEqualToString:*MEMORY[0x263F84388]];

    uint64_t v30 = v35;
  }
  uint64_t v158 = v30;
  uint64_t v36 = [v166 listPriority];
  char v37 = [v36 isEqualToString:*MEMORY[0x263F84398]];

  if (v37)
  {
    uint64_t v33 = 1;
  }
  else
  {
    v38 = [v166 listPriority];
    int v39 = [v38 isEqualToString:*MEMORY[0x263F843A0]];

    if (v39) {
      uint64_t v33 = 2;
    }
    else {
      uint64_t v33 = 0;
    }
  }
  if ([v4 shouldHideDate])
  {
    id v200 = 0;
LABEL_21:

    goto LABEL_22;
  }
  id v200 = v203;
  if (v205)
  {
    id v200 = v205;
    goto LABEL_21;
  }
LABEL_22:
  if ([v4 shouldUseRequestIdentifierForDismissalSync]) {
    id v183 = v5;
  }
  else {
    id v183 = 0;
  }
  v182 = [v4 expirationDate];
  v208 = [v4 topicIdentifiers];
  unsigned int v148 = [v4 shouldSuppressScreenLightUp] ^ 1;
  unsigned int v180 = [v4 shouldIgnoreDoNotDisturb];
  unsigned int v150 = [v4 shouldIgnoreDowntime];
  unsigned int v152 = [v4 shouldSuppressSyncDismissalWhenRemoved];
  unsigned int v143 = [v4 shouldHideTime];
  int v169 = [v4 shouldPreemptPresentedNotification];
  unsigned int v146 = [v4 shouldDisplayActionsInline];
  unsigned int v154 = [v166 preventClearFromList] ^ 1;
LABEL_26:
  if ([v4 hasCriticalAlertSound]) {
    BOOL v40 = [(UNSDefaultDataProvider *)self _queue_supportsCriticalAlertsForSubsectionIDs:v208];
  }
  else {
    BOOL v40 = 0;
  }
  unsigned int v142 = [v4 shouldShowSubordinateIcon];
  if (v33 == 0 && v40) {
    uint64_t v41 = 1;
  }
  else {
    uint64_t v41 = v33;
  }
  uint64_t v145 = v41;
  if (v40 && v19 != 3) {
    uint64_t v42 = 3;
  }
  else {
    uint64_t v42 = v19;
  }
  v207 = [v4 threadIdentifier];
  if (![v207 length] && v40)
  {
    v43 = [MEMORY[0x263F08C38] UUID];
    uint64_t v44 = [v43 UUIDString];

    v207 = (void *)v44;
  }
  v45 = [v4 contentType];
  v206 = -[UNSDefaultDataProvider _bbContentTypeFromUNContentType:toneAlertType:](self, "_bbContentTypeFromUNContentType:toneAlertType:", v45, [v4 toneAlertType]);

  v165 = (void *)v16;
  if (![v4 hasSound] || !objc_msgSend(v4, "shouldPlaySound"))
  {
    v47 = 0;
    v175 = 0;
    goto LABEL_90;
  }
  v138 = v5;
  BOOL v46 = v206 == (void *)*MEMORY[0x263F2BC00] && [v4 toneAlertType] == 1;
  if ((v22 | v46) == 1) {
    uint64_t v48 = [v4 toneAlertType];
  }
  else {
    uint64_t v48 = 17;
  }
  v49 = (void *)[objc_alloc(MEMORY[0x263F7FC70]) initWithType:v48];
  v50 = v49;
  if (v40) {
    [v49 setTopic:*MEMORY[0x263F7FCC8]];
  }
  v51 = [v4 toneFileName];
  if ([v51 length])
  {
    v52 = [(UNSDefaultDataProvider *)self _pathForSoundName:v51];
    if ([v52 length])
    {
      v53 = [NSURL fileURLWithPath:v52];
      [v50 setExternalToneFileURL:v53];
    }
    else
    {
      uint64_t v54 = v42;
      v55 = (id)*MEMORY[0x263F1E020];
      if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
      {
        id v174 = [(UNSDefaultDataProvider *)self sectionIdentifier];
        objc_msgSend(v138, "un_logDigest");
        id v177 = (id)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        id v215 = v174;
        __int16 v216 = 2114;
        v217 = v51;
        __int16 v218 = 2114;
        id v219 = v177;
        _os_log_error_impl(&dword_22289A000, v55, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to find sound \"%{public}@\" for notification %{public}@", buf, 0x20u);
      }
      uint64_t v42 = v54;
    }
  }
  if (v46)
  {
    [v4 soundMaximumDuration];
    double v57 = v56;
    double v58 = 30.0;
    if (v57 != 0.0)
    {
      objc_msgSend(v4, "soundMaximumDuration", 30.0);
      if (v58 > 30.0) {
        double v58 = 30.0;
      }
    }
    [v50 setMaximumDuration:v58];
    [v50 setTopic:*MEMORY[0x263F7FCE0]];
    id v5 = v138;
    if (!v22) {
      goto LABEL_84;
    }
    goto LABEL_65;
  }
  id v5 = v138;
  if (v22)
  {
    [v4 soundMaximumDuration];
    if (v59 != 0.0) {
      objc_msgSend(v50, "setMaximumDuration:");
    }
LABEL_65:
    v60 = [v4 audioCategory];
    if ([v60 length]) {
      [v50 setAudioCategory:v60];
    }
    uint64_t v176 = v42;
    uint64_t v61 = [v4 toneMediaLibraryItemIdentifier];
    if (v61) {
      [v50 setExternalToneMediaLibraryItemIdentifier:v61];
    }
    v62 = [v4 vibrationPatternFileURL];
    if (v62) {
      [v50 setExternalVibrationPatternFileURL:v62];
    }
    if ([v4 shouldSoundRepeat]) {
      [v50 setShouldRepeat:1];
    }
    v178 = v51;
    v63 = [v4 toneAlertTopic];
    if ([v63 length]) {
      [v50 setTopic:v63];
    }
    v64 = [v4 toneIdentifier];
    if ([v64 length]) {
      [v50 setToneIdentifier:v64];
    }
    v171 = v60;
    v65 = [v4 toneFileURL];
    if (v65) {
      [v50 setExternalToneFileURL:v65];
    }
    v66 = [v4 vibrationIdentifier];
    if ([v66 length]) {
      [v50 setVibrationIdentifier:v66];
    }
    if ([v4 shouldIgnoreAccessibilityDisabledVibrationSetting]) {
      [v50 setShouldIgnoreAccessibilityDisabledVibrationSetting:1];
    }

    id v5 = v138;
    uint64_t v42 = v176;
    v51 = v178;
  }
LABEL_84:
  v67 = [v4 audioVolume];
  v47 = v67;
  if (v22 | v40)
  {
    if (v67)
    {
      [v67 floatValue];
      objc_msgSend(v50, "setAudioVolume:");
    }
    if ([v4 shouldIgnoreRingerSwitch] | v40) {
      [v50 setShouldIgnoreRingerSwitch:1];
    }
  }
  v175 = (void *)[objc_alloc(MEMORY[0x263F2BCC8]) initWithToneAlertConfiguration:v50];

LABEL_90:
  v179 = v47;
  if (![(UNCNotificationSourceDescription *)self->_notificationSourceDescription allowPrivateProperties])
  {
    id v172 = 0;
    goto LABEL_101;
  }
  uint64_t v68 = v42;
  v69 = [v4 iconApplicationIdentifier];
  v70 = [v4 iconName];
  v71 = [v4 iconPath];
  uint64_t v72 = [v4 iconSystemImageName];
  v73 = (void *)v72;
  if (v69)
  {
    uint64_t v74 = [MEMORY[0x263F2BCA0] variantWithFormat:0 applicationIdentifier:v69];
  }
  else if (v71)
  {
    uint64_t v74 = [MEMORY[0x263F2BCA0] variantWithFormat:0 imagePath:v71];
  }
  else
  {
    if (v70)
    {
      v135 = (void *)MEMORY[0x263F2BCA0];
      [(UNSDefaultDataProvider *)self bundle];
      v173 = v141 = v5;
      v136 = [v173 bundlePath];
      v75 = [v135 variantWithFormat:0 imageName:v70 inBundleAtPath:v136];

      id v5 = v141;
      goto LABEL_97;
    }
    if (!v72)
    {
      v75 = 0;
      goto LABEL_97;
    }
    uint64_t v74 = [MEMORY[0x263F2BCA0] variantWithFormat:0 systemImageName:v72];
  }
  v75 = (void *)v74;
LABEL_97:
  objc_msgSend(v75, "setPrecomposed:", objc_msgSend(v4, "iconShouldSuppressMask"));
  if (v75)
  {
    id v172 = objc_alloc_init(MEMORY[0x263F2BC98]);
    [v172 addVariant:v75];
  }
  else
  {
    id v172 = 0;
  }

  uint64_t v42 = v68;
LABEL_101:
  uint64_t v76 = v40 | v169;
  if ([(UNCNotificationSourceDescription *)self->_notificationSourceDescription allowPrivateProperties])
  {
    v77 = [v4 accessoryImageName];
    if (v77)
    {
      uint64_t v78 = [MEMORY[0x263F2BC78] imageWithName:v77 inBundlePath:0];
    }
    else
    {
      uint64_t v78 = 0;
    }
  }
  else
  {
    uint64_t v78 = 0;
  }
  id v79 = objc_alloc(MEMORY[0x263F84258]);
  v80 = [(UNSDefaultDataProvider *)self bundle];
  v81 = (void *)[v79 initWithBundle:v80 categoryRepository:self->_categoryRepository];

  v144 = v81;
  v170 = [v81 notificationForNotificationRecord:v4];
  LODWORD(v81) = [(UNSDefaultDataProvider *)self _queue_supportsCriticalAlertsForSubsectionIDs:v208];
  BOOL v82 = [(UNSDefaultDataProvider *)self _queue_supportsTimeSensitiveAlertsforSubsectionIDs:v208];
  uint64_t v83 = 2;
  if (v81) {
    uint64_t v83 = 3;
  }
  if (v42 != 3) {
    uint64_t v83 = v42;
  }
  uint64_t v84 = 1;
  if (v82) {
    uint64_t v84 = 2;
  }
  if (v83 == 2) {
    uint64_t v85 = v84;
  }
  else {
    uint64_t v85 = v83;
  }
  char v139 = [v206 isEqualToString:*MEMORY[0x263F2BBF8]];
  id v86 = objc_alloc_init(MEMORY[0x263F2BC58]);
  [v86 setContentType:v206];
  [v86 setDefaultAction:v194];
  [v86 setDismissAction:v193];
  [v86 setFollowActivityAction:v192];
  [v86 setDate:v200];
  [v86 setInterruptionLevel:v85];
  *(float *)&double v87 = v21;
  [v86 setRelevanceScore:v87];
  [v86 setFilterCriteria:v187];
  [v86 setScreenCaptureProhibited:v156];
  [v86 setSpeechLanguage:v186];
  [v86 setDateIsAllDay:v143];
  [v86 setExpirationDate:v182];
  [v86 setHeader:v185];
  [v86 setFooter:v184];
  [v86 setMessage:v202];
  if (v204)
  {
    v88 = [(UNSDefaultDataProvider *)self _safeAttributedMessageWithAttributedMessage:v204 contentType:v206];
    if (v88)
    {
      [v86 setAttributedMessage:v88];
    }
    else if (!v202)
    {
      v89 = [v204 string];
      [v86 setMessage:v89];
    }
  }
  [v86 setSection:v201];
  [v86 setSubtitle:v198];
  [v86 setTitle:v199];
  [v86 setSummaryArgument:v197];
  [v86 setSummaryArgumentCount:v167];
  [v86 setSound:v175];
  [v86 setIcon:v172];
  [v86 setHasSubordinateIcon:v142];
  v157 = (void *)v78;
  [v86 setAccessoryImage:v78];
  [v86 setHasCriticalIcon:v40];
  [v86 setTurnsOnDisplay:v148];
  [v86 setIgnoresQuietMode:v40 | v180];
  [v86 setIgnoresDowntime:v150];
  [v86 setPreemptsPresentedAlert:v76];
  [v86 setDisplaysActionsInline:v146];
  [v86 setUsesExternalSync:v152];
  [v86 setPublisherBulletinID:v5];
  [v86 setRecordID:v5];
  [v86 setDismissalID:v183];
  [v86 setCategoryID:v195];
  v90 = [(NSMutableDictionary *)self->_categoryToParamSubType objectForKey:v195];
  objc_msgSend(v86, "setSectionSubtype:", objc_msgSend(v90, "integerValue"));

  [v86 setSilenceAction:v191];
  [v86 setThreadID:v207];
  [v86 setIntentIDs:v189];
  [v86 setSubsectionIDs:v208];
  [v86 setDateFormatStyle:1];
  [v86 setSupplementaryActions:v190];
  [v86 setWantsFullscreenPresentation:v160];
  [v86 setPreventAutomaticRemovalFromLockScreen:v40];
  [v86 setLockScreenPriority:v145];
  [v86 setBackgroundStyle:v158];
  [v86 setClearable:v154];
  if ([v4 pipelineState])
  {
    objc_msgSend(v86, "setIsHighlight:", objc_msgSend(v4, "isHighlight"));
    v91 = [v4 summary];
    [v86 setSummary:v91];

    objc_msgSend(v86, "setPriorityNotificationStatus:", -[UNSDefaultDataProvider _bulletinPriorityStatusForNotificationPriorityStatus:](self, "_bulletinPriorityStatusForNotificationPriorityStatus:", objc_msgSend(v4, "priorityStatus")));
    objc_msgSend(v86, "setNotificationSummaryStatus:", -[UNSDefaultDataProvider _bulletinSummaryStatusForNotificationSummaryStatus:](self, "_bulletinSummaryStatusForNotificationSummaryStatus:", objc_msgSend(v4, "summaryStatus")));
    v92 = [v4 eventBehavior];
    [v86 setEventBehavior:v92];
  }
  summaryService = self->_summaryService;
  v94 = [v4 identifier];
  v95 = [(UNSDefaultDataProvider *)self sectionIdentifier];
  v96 = [(UNSSummaryServiceAdapter *)summaryService groupSummariesForNotificationIdentifier:v94 bundleIdentifier:v95];

  v97 = [v96 threadSummary];
  [v86 setThreadSummary:v97];

  v168 = v96;
  v98 = [v96 spotlightIdentifier];
  [v86 setSpotlightIdentifier:v98];

  v99 = (id *)MEMORY[0x263F1E058];
  v100 = (id)*MEMORY[0x263F1E058];
  if (os_log_type_enabled(v100, OS_LOG_TYPE_DEFAULT))
  {
    id v101 = [v96 spotlightIdentifier];
    v102 = NSNumber;
    v103 = [v96 threadSummary];
    v104 = objc_msgSend(v102, "numberWithInt:", objc_msgSend(v103, "length") != 0);
    *(_DWORD *)buf = 138412546;
    id v215 = v101;
    __int16 v216 = 2112;
    v217 = v104;
    _os_log_impl(&dword_22289A000, v100, OS_LOG_TYPE_DEFAULT, "group summaries request for record with spotlightIdentifier: %@ hasThreadSummary: %@", buf, 0x16u);
  }
  v105 = *v99;
  if (os_log_type_enabled(v105, OS_LOG_TYPE_DEBUG)) {
    [(UNSDefaultDataProvider *)v168 _queue_bulletinForNotification:v105];
  }

  v106 = v165;
  if (v179) {
    [v86 setContextValue:v179 forKey:@"audioVolume"];
  }
  if (v165) {
    [v86 setContextValue:v165 forKey:@"badge"];
  }
  if (v205) {
    [v86 setContextValue:v205 forKey:@"contentDate"];
  }
  [v86 setContextValue:v188 forKey:*MEMORY[0x263F2BD08]];
  if (v203) {
    [v86 setContextValue:v203 forKey:@"recordDate"];
  }
  v107 = [NSNumber numberWithBool:v180];
  [v86 setContextValue:v107 forKey:@"shouldIgnoreDoNotDisturb"];

  v108 = (void *)v164;
  if (v164) {
    [v86 setContextValue:v164 forKey:@"targetContentIdentifier"];
  }
  if (v196) {
    [v86 setContextValue:v196 forKey:@"userInfo"];
  }
  [v86 setRealertCount:v162];
  v109 = [v170 request];
  v110 = [v109 content];
  uint64_t v111 = [v110 attachments];

  if (v111) {
    [(UNSDefaultDataProvider *)self _addAttachments:v111 toBulletinRequest:v86];
  }
  v181 = (void *)v111;
  v112 = [v170 request];
  uint64_t v113 = [v112 trigger];

  v114 = v205;
  if (v113)
  {
    v115 = [MEMORY[0x263F08910] archivedDataWithRootObject:v113 requiringSecureCoding:1 error:0];
    [v86 setContextValue:v115 forKey:@"notificationTriggerData"];
  }
  v163 = (void *)v113;
  v116 = [v170 request];
  v117 = [v116 content];
  v118 = [v117 communicationContext];

  v119 = v181;
  if (v118)
  {
    if (v139)
    {
      v120 = (id)*MEMORY[0x263F1E008];
      if (os_log_type_enabled(v120, OS_LOG_TYPE_ERROR)) {
        -[UNSDefaultDataProvider _queue_bulletinForNotification:]();
      }
    }
    else
    {
      v140 = v5;
      v120 = objc_alloc_init(MEMORY[0x263EFF980]);
      long long v209 = 0u;
      long long v210 = 0u;
      long long v211 = 0u;
      long long v212 = 0u;
      v121 = [v118 recipients];
      uint64_t v122 = [v121 countByEnumeratingWithState:&v209 objects:v213 count:16];
      if (v122)
      {
        uint64_t v123 = v122;
        uint64_t v124 = *(void *)v210;
        do
        {
          for (uint64_t i = 0; i != v123; ++i)
          {
            if (*(void *)v210 != v124) {
              objc_enumerationMutation(v121);
            }
            v126 = [(UNSDefaultDataProvider *)self _bbContactFromUNContact:*(void *)(*((void *)&v209 + 1) + 8 * i)];
            [v120 addObject:v126];
          }
          uint64_t v123 = [v121 countByEnumeratingWithState:&v209 objects:v213 count:16];
        }
        while (v123);
      }

      v127 = [v118 sender];

      if (v127)
      {
        v128 = [v118 sender];
        v161 = [(UNSDefaultDataProvider *)self _bbContactFromUNContact:v128];
      }
      else
      {
        v161 = 0;
      }
      if ([v118 notifyRecipientAnyway]) {
        BOOL v159 = [(UNSDefaultDataProvider *)self _isTCCUserAvailabilityGrantedForBundleId:v201];
      }
      else {
        BOOL v159 = 0;
      }
      v155 = (void *)MEMORY[0x263F2BC88];
      v153 = [v118 identifier];
      v151 = [v118 bundleIdentifier];
      v149 = [v118 associatedObjectUri];
      v129 = [v118 displayName];
      v147 = [v118 contentURL];
      v130 = [v118 imageName];
      char v131 = [v118 isSystemImage];
      char v132 = [v118 mentionsCurrentUser];
      BYTE3(v137) = [v118 isReplyToCurrentUser];
      BYTE2(v137) = v159;
      BYTE1(v137) = v132;
      LOBYTE(v137) = v131;
      v133 = objc_msgSend(v155, "communicationContextWithIdentifier:bundleIdentifier:associatedObjectUri:displayName:sender:recipients:contentURL:imageName:systemImage:mentionsCurrentUser:notifyRecipientAnyway:replyToCurrentUser:recipientCount:", v153, v151, v149, v129, v161, v120, v147, v130, v137, objc_msgSend(v118, "recipientCount"));

      objc_msgSend(v133, "setCapabilities:", objc_msgSend(v118, "capabilities") & 1);
      objc_msgSend(v133, "setBusinessCorrespondence:", objc_msgSend(v118, "isBusinessCorrespondence"));
      [v86 setCommunicationContext:v133];

      id v5 = v140;
      v108 = (void *)v164;
      v106 = v165;
      v114 = v205;
      v119 = v181;
    }
  }
  id v31 = v86;

LABEL_164:
LABEL_165:

  return v31;
}

- (id)_bbContentTypeFromUNContentType:(id)a3 toneAlertType:(int64_t)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (id)*MEMORY[0x263F2BBF8];
  int v8 = [(UNCNotificationSourceDescription *)self->_notificationSourceDescription allowCalls];
  int v9 = [(UNCNotificationSourceDescription *)self->_notificationSourceDescription allowMessages];
  int v10 = [(UNCNotificationSourceDescription *)self->_notificationSourceDescription allowIntercom];
  if ([v6 isEqualToString:*MEMORY[0x263F1E128]])
  {
    if (v9)
    {
      uint64_t v11 = (id *)MEMORY[0x263F2BC10];
LABEL_39:
      id v18 = *v11;

      id v7 = v18;
      goto LABEL_40;
    }
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F1E008], OS_LOG_TYPE_ERROR)) {
      goto LABEL_40;
    }
    goto LABEL_8;
  }
  if ([v6 isEqualToString:*MEMORY[0x263F1E130]])
  {
    if (v9)
    {
      uint64_t v11 = (id *)MEMORY[0x263F2BC18];
      goto LABEL_39;
    }
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F1E008], OS_LOG_TYPE_ERROR)) {
      goto LABEL_40;
    }
LABEL_8:
    -[UNSDefaultDataProvider _bbContentTypeFromUNContentType:toneAlertType:]();
    goto LABEL_40;
  }
  if (![v6 isEqualToString:*MEMORY[0x263F1E120]])
  {
    if ([v6 isEqualToString:*MEMORY[0x263F1E138]])
    {
      if (v8)
      {
        uint64_t v11 = (id *)MEMORY[0x263F2BC20];
        goto LABEL_39;
      }
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F1E008], OS_LOG_TYPE_ERROR)) {
        goto LABEL_40;
      }
    }
    else if ([v6 isEqualToString:*MEMORY[0x263F1E118]])
    {
      char v12 = v8 ^ 1;
      if (a4 == 1) {
        char v13 = v8 ^ 1;
      }
      else {
        char v13 = 1;
      }
      if ((v13 & 1) == 0)
      {
        uint64_t v11 = (id *)MEMORY[0x263F2BC00];
        goto LABEL_39;
      }
      if (a4 == 1) {
        char v12 = 1;
      }
      if ((v12 & 1) == 0)
      {
        id v14 = (id)*MEMORY[0x263F2BBF0];

        v15 = (void *)*MEMORY[0x263F1E008];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E008], OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v16 = v15;
          uint64_t v17 = [(UNSDefaultDataProvider *)self sectionIdentifier];
          int v20 = 138543362;
          double v21 = v17;
          _os_log_impl(&dword_22289A000, v16, OS_LOG_TYPE_DEFAULT, "[%{public}@] _UNNotificationContentType is '_UNNotificationContentTypeIncomingCall' but the tone alert type is NOT  'TLAlertTypeIncomingCall'. Tone alert type must be 'TLAlertTypeIncomingCall' for notification to be treated as an incoming call. Assigning 'BBBulletinContentTypeCallOther' to notification.", (uint8_t *)&v20, 0xCu);
        }
        id v7 = v14;
        goto LABEL_40;
      }
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F1E008], OS_LOG_TYPE_ERROR)) {
        goto LABEL_40;
      }
    }
    else if ([v6 isEqualToString:*MEMORY[0x263F1E140]])
    {
      if (v8)
      {
        uint64_t v11 = (id *)MEMORY[0x263F2BC28];
        goto LABEL_39;
      }
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F1E008], OS_LOG_TYPE_ERROR)) {
        goto LABEL_40;
      }
    }
    else
    {
      if (![v6 isEqualToString:*MEMORY[0x263F1E108]]) {
        goto LABEL_40;
      }
      if (v8)
      {
        uint64_t v11 = (id *)MEMORY[0x263F2BBF0];
        goto LABEL_39;
      }
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F1E008], OS_LOG_TYPE_ERROR)) {
        goto LABEL_40;
      }
    }
    -[UNSDefaultDataProvider _bbContentTypeFromUNContentType:toneAlertType:].cold.4();
    goto LABEL_40;
  }
  if (v10)
  {
    uint64_t v11 = (id *)MEMORY[0x263F2BC08];
    goto LABEL_39;
  }
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E008], OS_LOG_TYPE_ERROR)) {
    -[UNSDefaultDataProvider _bbContentTypeFromUNContentType:toneAlertType:]();
  }
LABEL_40:

  return v7;
}

- (id)_bbContactFromUNContact:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 handleType];
  uint64_t v5 = 2 * (v4 == 2);
  if (v4 == 1) {
    uint64_t v5 = 1;
  }
  uint64_t v18 = v5;
  id v6 = (void *)MEMORY[0x263F2BC68];
  id v7 = [v3 handle];
  int v8 = [v3 serviceName];
  int v9 = [v3 displayName];
  uint64_t v10 = [v3 isDisplayNameSuggested];
  uint64_t v11 = [v3 customIdentifier];
  char v12 = [v3 cnContactIdentifier];
  char v13 = [v3 cnContactFullname];
  char v14 = [v3 isCNContactIdentifierSuggested];

  LOBYTE(v17) = v14;
  v15 = [v6 contactWithHandle:v7 handleType:v18 serviceName:v8 displayName:v9 displayNameSuggested:v10 customIdentifier:v11 cnContactIdentifier:v12 cnContactFullname:v13 cnContactIdentifierSuggested:v17];

  return v15;
}

- (id)_safeAttributedMessageWithAttributedMessage:(id)a3 contentType:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (([v6 isEqualToString:*MEMORY[0x263F2BC10]] & 1) != 0
    || [v6 isEqualToString:*MEMORY[0x263F2BC18]])
  {
    id v7 = v5;
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (BOOL)_queue_supportsCriticalAlertsForSubsectionIDs:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  [(UNSDefaultDataProvider *)self _queue_applicableSectionInfosForSubsectionIDs:a3];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v3);
        }
        if (objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * i), "criticalAlertSetting", (void)v8) == 2)
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v4;
}

- (BOOL)_queue_supportsTimeSensitiveAlertsforSubsectionIDs:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  [(UNSDefaultDataProvider *)self _queue_applicableSectionInfosForSubsectionIDs:a3];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v3);
        }
        if (objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * i), "timeSensitiveSetting", (void)v8) == 2)
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v4;
}

- (id)_queue_applicableSectionInfosForSubsectionIDs:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x263EFF980] array];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = [(BBSectionInfo *)self->_effectiveSectionInfo subsections];
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
        long long v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        char v12 = [v11 subsectionID];
        int v13 = [v4 containsObject:v12];

        if (v13) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  if (![v5 count] && self->_effectiveSectionInfo) {
    objc_msgSend(v5, "addObject:");
  }

  return v5;
}

- (id)_soundsDirectoryPathForContainerBasePath:(id)a3
{
  id v3 = [a3 stringByStandardizingPath];
  id v4 = [v3 stringByAppendingPathComponent:@"Library"];
  uint64_t v5 = [v4 stringByAppendingPathComponent:@"Sounds"];

  return v5;
}

- (id)_pathForSoundName:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(UNCNotificationSourceDescription *)self->_notificationSourceDescription dataContainerURL];
  id v6 = v5;
  if (v5)
  {
    uint64_t v7 = [v5 path];
    uint64_t v8 = [(UNSDefaultDataProvider *)self _soundsDirectoryPathForContainerBasePath:v7];

    uint64_t v9 = [v8 stringByAppendingPathComponent:v4];
    id v10 = [v9 stringByStandardizingPath];

    if ([(UNSDefaultDataProvider *)self _isResourceValidForPath:v10 withContainerPath:v8])
    {

      if (v10) {
        goto LABEL_19;
      }
    }
    else
    {
    }
  }
  long long v11 = [(UNCNotificationSourceDescription *)self->_notificationSourceDescription groupContainerURLS];
  char v12 = [v11 allValues];

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v13 = v12;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v30;
LABEL_8:
    uint64_t v17 = 0;
    while (1)
    {
      if (*(void *)v30 != v16) {
        objc_enumerationMutation(v13);
      }
      long long v18 = objc_msgSend(*(id *)(*((void *)&v29 + 1) + 8 * v17), "path", (void)v29);
      unint64_t v19 = [v18 stringByStandardizingPath];
      uint64_t v20 = [(UNSDefaultDataProvider *)self _soundsDirectoryPathForContainerBasePath:v19];

      double v21 = [v20 stringByAppendingPathComponent:v4];
      id v10 = [v21 stringByStandardizingPath];

      if ([(UNSDefaultDataProvider *)self _isResourceValidForPath:v10 withContainerPath:v20])
      {
        break;
      }

      if (v15 == ++v17)
      {
        uint64_t v15 = [v13 countByEnumeratingWithState:&v29 objects:v33 count:16];
        if (v15) {
          goto LABEL_8;
        }
        goto LABEL_14;
      }
    }

    if (v10) {
      goto LABEL_19;
    }
  }
  else
  {
LABEL_14:
  }
  uint64_t v22 = [(UNSDefaultDataProvider *)self bundle];
  char v23 = [v22 bundlePath];
  id v24 = [v23 stringByStandardizingPath];

  uint64_t v25 = [(UNSDefaultDataProvider *)self bundle];
  uint64_t v26 = [v25 pathForResource:v4 ofType:0];
  long long v27 = [v26 stringByStandardizingPath];

  id v10 = 0;
  if ([(UNSDefaultDataProvider *)self _isResourceValidForPath:v27 withContainerPath:v24])
  {
    id v10 = v27;
  }

LABEL_19:
  return v10;
}

- (BOOL)_isResourceValidForPath:(id)a3 withContainerPath:(id)a4
{
  id v5 = a3;
  if ([v5 hasPrefix:a4] && (BSIsSymbolicLinkAtPath() & 1) == 0)
  {
    uint64_t v7 = [MEMORY[0x263F08850] defaultManager];
    char v6 = [v7 fileExistsAtPath:v5];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (id)_defaultActionWithNotification:(id)a3
{
  id v4 = a3;
  if (([v4 hasDefaultAction] & 1) != 0
    || ([(UNCNotificationSourceDescription *)self->_notificationSourceDescription allowPrivateProperties] & 1) == 0)
  {
    char v6 = [v4 defaultActionTitleLocalizationKey];
    uint64_t v7 = [(UNSDefaultDataProvider *)self bundle];
    [v7 cfBundle];
    uint64_t v8 = [v4 defaultActionTitle];
    uint64_t v9 = UNFormatLocalizedStringInBundleWithDefaultValue();

    id v5 = [MEMORY[0x263F2BC40] actionWithIdentifier:*MEMORY[0x263F1E0C8] title:v9];
    if ([(UNCNotificationSourceDescription *)self->_notificationSourceDescription allowPrivateProperties])
    {
      id v10 = [v4 defaultActionURL];
      [v5 setLaunchURL:v10];

      long long v11 = [v4 defaultActionBundleIdentifier];
      [v5 setLaunchBundleID:v11];

      objc_msgSend(v5, "setShouldDismissBulletin:", objc_msgSend(v4, "shouldPreventNotificationDismissalAfterDefaultAction") ^ 1);
      objc_msgSend(v5, "setActivationMode:", objc_msgSend(v4, "shouldBackgroundDefaultAction"));
      objc_msgSend(v5, "setAuthenticationRequired:", objc_msgSend(v4, "shouldAuthenticateDefaultAction"));
    }
    else
    {
      [v5 setActivationMode:0];
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)_dismissActionForCategory:(id)a3
{
  if ([a3 hasCustomDismissAction])
  {
    id v3 = [MEMORY[0x263F2BC40] actionWithIdentifier:*MEMORY[0x263F1E0D0]];
    [v3 setActivationMode:1];
  }
  else
  {
    id v3 = 0;
  }
  return v3;
}

- (id)_followActivityActionForCategory:(id)a3
{
  if ([a3 hasFollowActivityAction]
    && ((_os_feature_enabled_impl() & 1) != 0 || _os_feature_enabled_impl()))
  {
    id v3 = (void *)MEMORY[0x263F2BC40];
    uint64_t v4 = *MEMORY[0x263F1E0D8];
    id v5 = UNSLocalizedStringForKey(@"FOLLOW_ACTIVITY_ACTION_TITLE");
    char v6 = [v3 actionWithIdentifier:v4 title:v5];

    [v6 setActivationMode:1];
  }
  else
  {
    char v6 = 0;
  }
  return v6;
}

- (id)_silenceActionForCategory:(id)a3
{
  if ([a3 hasCustomSilenceAction]
    && [(UNCNotificationSourceDescription *)self->_notificationSourceDescription allowPrivateProperties])
  {
    uint64_t v4 = [MEMORY[0x263F2BC40] actionWithIdentifier:*MEMORY[0x263F1E0E8]];
    [v4 setActivationMode:1];
  }
  else
  {
    uint64_t v4 = 0;
  }
  return v4;
}

- (id)_supplementaryActionsForForCategoryRecord:(id)a3
{
  uint64_t v4 = [a3 actions];
  id v5 = objc_msgSend(v4, "bs_first:", 10);

  char v6 = [(UNSDefaultDataProvider *)self _actionsFromActionRecords:v5];

  return v6;
}

- (id)_allCategories
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263EFF980] array];
  uint64_t v4 = [(UNCNotificationSourceDescription *)self->_notificationSourceDescription defaultCategories];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v23 != v7) {
          objc_enumerationMutation(v4);
        }
        [v3 addObject:*(void *)(*((void *)&v22 + 1) + 8 * i)];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v6);
  }
  categoryRepository = self->_categoryRepository;
  id v10 = [(UNSDefaultDataProvider *)self sectionIdentifier];
  long long v11 = [(UNSNotificationCategoryRepository *)categoryRepository categoriesForBundleIdentifier:v10];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v12 = v11;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v19;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v19 != v15) {
          objc_enumerationMutation(v12);
        }
        objc_msgSend(v3, "addObject:", *(void *)(*((void *)&v18 + 1) + 8 * j), (void)v18);
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v14);
  }

  return v3;
}

- (id)_categoryForIdentifier:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    [(UNCNotificationSourceDescription *)self->_notificationSourceDescription defaultCategories];
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = [v5 countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v31;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v31 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          long long v11 = [v10 identifier];
          char v12 = [v4 isEqual:v11];

          if (v12)
          {
            id v24 = v10;
            id v16 = v5;
            goto LABEL_22;
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v30 objects:v35 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }

    categoryRepository = self->_categoryRepository;
    uint64_t v14 = [(UNSDefaultDataProvider *)self sectionIdentifier];
    uint64_t v15 = [(UNSNotificationCategoryRepository *)categoryRepository categoriesForBundleIdentifier:v14];

    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v16 = v15;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v26 objects:v34 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v27;
      while (2)
      {
        for (uint64_t j = 0; j != v18; ++j)
        {
          if (*(void *)v27 != v19) {
            objc_enumerationMutation(v16);
          }
          long long v21 = *(void **)(*((void *)&v26 + 1) + 8 * j);
          long long v22 = objc_msgSend(v21, "identifier", (void)v26);
          char v23 = [v4 isEqual:v22];

          if (v23)
          {
            id v24 = v21;

            goto LABEL_22;
          }
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v26 objects:v34 count:16];
        if (v18) {
          continue;
        }
        break;
      }
    }

    id v24 = 0;
LABEL_22:
  }
  else
  {
    id v24 = 0;
  }

  return v24;
}

- (id)_actionsFromActionRecords:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [MEMORY[0x263EFF980] array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = -[UNSDefaultDataProvider _actionFromActionRecord:](self, "_actionFromActionRecord:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
        objc_msgSend(v5, "bs_safeAddObject:", v11);
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)_actionFromActionRecord:(id)a3
{
  id v4 = a3;
  id v5 = [v4 identifier];
  id v6 = [v4 titleLocalizationKey];
  uint64_t v7 = [v4 titleLocalizationArguments];
  uint64_t v8 = [(UNSDefaultDataProvider *)self bundle];
  [v8 cfBundle];
  uint64_t v9 = [v4 title];
  id v10 = UNFormatLocalizedStringInBundleWithDefaultValue();

  long long v11 = [MEMORY[0x263F2BC40] actionWithIdentifier:v5 title:v10];
  objc_msgSend(v11, "setActivationMode:", objc_msgSend(v4, "isForeground") ^ 1);
  objc_msgSend(v11, "setAuthenticationRequired:", objc_msgSend(v4, "isAuthenticationRequired"));
  if ([(UNCNotificationSourceDescription *)self->_notificationSourceDescription allowPrivateProperties])
  {
    char v12 = [v4 url];
    [v11 setLaunchURL:v12];

    objc_msgSend(v11, "setShouldDismissBulletin:", objc_msgSend(v4, "shouldPreventNotificationDismiss") ^ 1);
  }
  if ([v4 isDestructive])
  {
    long long v13 = [v11 appearance];
    [v13 setStyle:1];
  }
  long long v14 = [v4 actionType];
  int v15 = [v14 isEqualToString:*MEMORY[0x263F84378]];

  if (v15)
  {
    long long v16 = [(UNSDefaultDataProvider *)self bundle];
    [v16 cfBundle];

    uint64_t v17 = [v4 textInputButtonTitleLocalizationKey];
    uint64_t v18 = [v4 textInputButtonTitleLocalizationArguments];
    uint64_t v19 = [v4 textInputButtonTitle];
    long long v20 = UNFormatLocalizedStringInBundleWithDefaultValue();

    long long v21 = [v4 textInputPlaceholderLocalizationKey];
    long long v22 = [v4 textInputPlaceholderLocalizationArguments];
    char v23 = [v4 textInputPlaceholder];
    id v24 = UNFormatLocalizedStringInBundleWithDefaultValue();

    id v25 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    objc_msgSend(v25, "bs_setSafeObject:forKey:", v20, *MEMORY[0x263F1E090]);
    objc_msgSend(v25, "bs_setSafeObject:forKey:", v24, *MEMORY[0x263F1E098]);
    [v11 setBehaviorParameters:v25];
    [v11 setBehavior:1];
  }
  else
  {
    [v11 setBehavior:0];
  }
  long long v26 = [v4 iconImageName];
  uint64_t v27 = [v26 length];

  if (v27)
  {
    long long v28 = [v4 iconImageName];
    if (v28)
    {
      if ([v4 hasSystemIcon])
      {
        long long v29 = 0;
      }
      else
      {
        long long v31 = [(UNSDefaultDataProvider *)self bundle];
        long long v29 = [v31 bundlePath];
      }
      long long v30 = [MEMORY[0x263F2BC78] imageWithName:v28 inBundlePath:v29];
    }
    else
    {
      long long v30 = 0;
    }
  }
  else
  {
    long long v30 = 0;
  }
  long long v32 = [v11 appearance];
  [v32 setImage:v30];

  return v11;
}

- (id)_allBulletinsWithMaxCount:(unint64_t)a3 sinceDate:(id)a4
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  uint64_t v8 = [(UNSDefaultDataProvider *)self notificationRecords];
  uint64_t v9 = self;
  id v10 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v11 = v8;
  uint64_t v33 = [v11 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v33)
  {
    uint64_t v32 = *(void *)v35;
    id v30 = v11;
LABEL_3:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v35 != v32) {
        objc_enumerationMutation(v11);
      }
      long long v13 = *(void **)(*((void *)&v34 + 1) + 8 * v12);
      if (!objc_msgSend(v13, "allowsNotificationCenterDestination", v30)) {
        goto LABEL_29;
      }
      char v14 = [v13 shouldHideDate];
      if (!v6 || (v14 & 1) != 0) {
        break;
      }
      uint64_t v15 = [v13 contentDate];
      if (!v15)
      {
        uint64_t v15 = [v13 date];
      }
      long long v16 = (void *)v15;
      char v17 = [v6 isAfterDate:v15];

      if ((v17 & 1) == 0) {
        break;
      }
LABEL_22:
      if (v33 == ++v12)
      {
        uint64_t v28 = [v11 countByEnumeratingWithState:&v34 objects:v38 count:16];
        uint64_t v33 = v28;
        if (v28) {
          goto LABEL_3;
        }
        goto LABEL_29;
      }
    }
    uint64_t v18 = [(UNSDefaultDataProvider *)v9 _queue_bulletinForNotification:v13];
    uint64_t v19 = [v18 message];
    if (![v19 length])
    {
      long long v20 = [v18 subtitle];
      if (![v20 length])
      {
        [v18 title];
        id v22 = v6;
        id v23 = v10;
        id v24 = v9;
        unint64_t v25 = a3;
        v27 = id v26 = v7;
        uint64_t v31 = [v27 length];

        id v7 = v26;
        a3 = v25;
        uint64_t v9 = v24;
        id v10 = v23;
        id v6 = v22;
        id v11 = v30;

        if (!v31)
        {
LABEL_19:
          if (a3 && [v7 count] == a3)
          {

            goto LABEL_29;
          }

          goto LABEL_22;
        }
LABEL_16:
        long long v21 = [v18 publisherBulletinID];
        if (([v10 containsObject:v21] & 1) == 0)
        {
          [v7 addObject:v18];
          [v10 addObject:v21];
        }

        goto LABEL_19;
      }
    }
    goto LABEL_16;
  }
LABEL_29:

  return v7;
}

- (id)notificationRecords
{
  notificationRepository = self->_notificationRepository;
  id v3 = [(UNSDefaultDataProvider *)self sectionIdentifier];
  id v4 = [(UNCNotificationRepository *)notificationRepository notificationRecordsForBundleIdentifier:v3];

  return v4;
}

- (id)bulletinsWithRequestParameters:(id)a3 lastCleared:(id)a4
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ([v5 publisherDestination] == 2)
  {
    uint64_t v6 = [v5 maximumCount];
    id v7 = [v5 sinceDate];
    uint64_t v8 = [(UNSDefaultDataProvider *)self _allBulletinsWithMaxCount:v6 sinceDate:v7];

    uint64_t v9 = (void *)*MEMORY[0x263F1E020];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E020], OS_LOG_TYPE_DEFAULT))
    {
      id v10 = v9;
      id v11 = [(UNSDefaultDataProvider *)self sectionIdentifier];
      uint64_t v12 = [v8 count];
      long long v13 = [v5 sinceDate];
      *(_DWORD *)buf = 138544130;
      long long v37 = v11;
      __int16 v38 = 2048;
      uint64_t v39 = v12;
      __int16 v40 = 2114;
      uint64_t v41 = v13;
      __int16 v42 = 2048;
      uint64_t v43 = [v5 maximumCount];
      _os_log_impl(&dword_22289A000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] Returning %ld bulletins since %{public}@ (max %ld)", buf, 0x2Au);
    }
    if (UNCUseGroupService()
      && [(UNSDefaultDataProvider *)self _isEligibleForPipeline])
    {
      id v30 = v5;
      id v14 = objc_alloc_init(MEMORY[0x263EFF9A0]);
      id v15 = objc_alloc(MEMORY[0x263F84240]);
      long long v16 = [(UNSDefaultDataProvider *)self bundle];
      char v17 = (void *)[v15 initWithBundle:v16];

      long long v33 = 0u;
      long long v34 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = v8;
      uint64_t v18 = [v8 allObjects];
      uint64_t v19 = [v18 countByEnumeratingWithState:&v31 objects:v35 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v32;
        do
        {
          for (uint64_t i = 0; i != v20; ++i)
          {
            if (*(void *)v32 != v21) {
              objc_enumerationMutation(v18);
            }
            id v23 = [*(id *)(*((void *)&v31 + 1) + 8 * i) categoryID];
            if (v23)
            {
              id v24 = [v14 objectForKey:v23];

              if (!v24)
              {
                unint64_t v25 = [(UNSDefaultDataProvider *)self _categoryForIdentifier:v23];
                if (v25)
                {
                  id v26 = [v17 notificationCategoryForNotificationCategoryRecord:v25];
                  objc_msgSend(v14, "bs_setSafeObject:forKey:", v26, v23);
                }
              }
            }
          }
          uint64_t v20 = [v18 countByEnumeratingWithState:&v31 objects:v35 count:16];
        }
        while (v20);
      }

      uint64_t v8 = v29;
      uint64_t v27 = [v29 allObjects];
      +[UNSNotificationPipelineAdapter addInitialBulletins:v27 categories:v14 sourceDescription:self->_notificationSourceDescription];

      id v5 = v30;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (BOOL)_isAppProtectionActive
{
  v2 = (void *)MEMORY[0x263F251D0];
  id v3 = [(BBSectionInfo *)self->_effectiveSectionInfo sectionID];
  id v4 = [v2 applicationWithBundleIdentifier:v3];

  if ([v4 isHidden]) {
    char v5 = 1;
  }
  else {
    char v5 = [v4 isLocked];
  }

  return v5;
}

- (BOOL)_isEligibleForPipeline
{
  id v3 = [(BBSectionInfo *)self->_effectiveSectionInfo uns_notificationSettings];
  int v4 = [v3 isEligibleForIndexing];

  int v5 = UNCUsePipeline();
  BOOL result = 0;
  if (v5)
  {
    if (v4) {
      return ![(UNSDefaultDataProvider *)self _isAppProtectionActive];
    }
  }
  return result;
}

- (id)clearedInfoAndBulletinsForClearingAllBulletinsWithLimit:(unint64_t)a3 lastClearedInfo:(id)a4
{
  v13[2] = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v6 = [(UNSDefaultDataProvider *)self _allBulletinsWithMaxCount:a3 sinceDate:0];
  notificationRepository = self->_notificationRepository;
  uint64_t v8 = [(UNSDefaultDataProvider *)self sectionIdentifier];
  [(UNCNotificationRepository *)notificationRepository removeAllNotificationRecordsForBundleIdentifier:v8];

  v12[0] = *MEMORY[0x263F2BC38];
  uint64_t v9 = [MEMORY[0x263EFF9D0] null];
  v12[1] = *MEMORY[0x263F2BC30];
  v13[0] = v9;
  v13[1] = v6;
  id v10 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2];

  return v10;
}

- (id)clearedInfoForBulletins:(id)a3 lastClearedInfo:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v6 = (void *)*MEMORY[0x263F1E020];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E020], OS_LOG_TYPE_DEFAULT))
  {
    id v7 = v6;
    uint64_t v8 = [(UNSDefaultDataProvider *)self sectionIdentifier];
    *(_DWORD *)buf = 138543618;
    unint64_t v25 = v8;
    __int16 v26 = 2048;
    uint64_t v27 = [v5 count];
    _os_log_impl(&dword_22289A000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Clear %ld bulletins", buf, 0x16u);
  }
  uint64_t v9 = [MEMORY[0x263EFF9C0] set];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v10 = v5;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v20;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v20 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * v14), "publisherBulletinID", (void)v19);
        [v9 addObject:v15];

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v12);
  }

  notificationRepository = self->_notificationRepository;
  char v17 = [(UNSDefaultDataProvider *)self sectionIdentifier];
  [(UNCNotificationRepository *)notificationRepository removeNotificationRecordsForIdentifiers:v9 bundleIdentifier:v17];

  return 0;
}

- (id)sortDescriptors
{
  v2 = (void *)MEMORY[0x263EFF8C0];
  id v3 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"date" ascending:0];
  int v4 = [v2 arrayWithObject:v3];

  return v4;
}

- (void)setEffectiveSectionInfo:(id)a3
{
  id v5 = a3;
  p_effectiveSectionInfo = &self->_effectiveSectionInfo;
  effectiveSectionInfo = self->_effectiveSectionInfo;
  id v15 = v5;
  if (effectiveSectionInfo)
  {
    char v8 = [(BBSectionInfo *)effectiveSectionInfo isEqual:v5];
    objc_storeStrong((id *)&self->_effectiveSectionInfo, a3);
    if (v8) {
      goto LABEL_8;
    }
    if ([(UNCNotificationSourceDescription *)self->_notificationSourceDescription daemonShouldReceiveNotificationSettingsUpdates])
    {
      daemonLauncher = self->_daemonLauncher;
      id v10 = [(BBSectionInfo *)self->_effectiveSectionInfo uns_notificationSettings];
      uint64_t v11 = [(BBSectionInfo *)self->_effectiveSectionInfo sectionID];
      [(UNSDaemonLauncher *)daemonLauncher didChangeSettings:v10 forBundleIdentifier:v11];
    }
    notificationRepository = self->_notificationRepository;
    uint64_t v13 = [(BBSectionInfo *)self->_effectiveSectionInfo sectionID];
    [(UNCNotificationRepository *)notificationRepository removeInvalidNotificationRecordsForBundleIdentifier:v13];
  }
  else
  {
    uint64_t v14 = (BBSectionInfo *)v5;
    uint64_t v13 = *p_effectiveSectionInfo;
    *p_effectiveSectionInfo = v14;
  }

LABEL_8:
}

- (id)sectionIdentifier
{
  return (id)[(UNCNotificationSourceDescription *)self->_notificationSourceDescription bundleIdentifier];
}

- (id)sectionBundlePath
{
  v2 = [(UNCNotificationSourceDescription *)self->_notificationSourceDescription bundleURL];
  id v3 = [v2 path];

  return v3;
}

- (void)handleBulletinActionResponse:(id)a3 withCompletion:(id)a4
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t))a4;
  char v8 = (os_log_t *)MEMORY[0x263F1E020];
  uint64_t v9 = (void *)*MEMORY[0x263F1E020];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E020], OS_LOG_TYPE_DEFAULT))
  {
    id v10 = v9;
    uint64_t v11 = [(UNSDefaultDataProvider *)self sectionIdentifier];
    uint64_t v12 = [v6 bulletinPublisherID];
    uint64_t v13 = objc_msgSend(v12, "un_logDigest");
    uint64_t v14 = [v6 actionID];
    int v27 = 138544130;
    uint64_t v28 = v11;
    __int16 v29 = 2114;
    id v30 = v13;
    __int16 v31 = 2114;
    long long v32 = v14;
    __int16 v33 = 2048;
    uint64_t v34 = [v6 actionType];
    _os_log_impl(&dword_22289A000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] Received response to %{public}@ for action %{public}@ (%ld)  ", (uint8_t *)&v27, 0x2Au);
  }
  unint64_t v15 = [v6 actionType];
  if (v15 > 0xB) {
    goto LABEL_15;
  }
  if (((1 << v15) & 0xD82) != 0)
  {
    [(UNSDefaultDataProvider *)self _handleBulletinActionResponse:v6 withCompletion:v7];
    goto LABEL_6;
  }
  if (v15 == 5)
  {
    os_log_t v16 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
    {
      char v17 = v16;
      uint64_t v18 = [(UNSDefaultDataProvider *)self sectionIdentifier];
      long long v19 = [v6 bulletinPublisherID];
      long long v20 = objc_msgSend(v19, "un_logDigest");
      long long v21 = [v6 actionID];
      uint64_t v22 = [v6 actionType];
      int v27 = 138544130;
      uint64_t v28 = v18;
      __int16 v29 = 2114;
      id v30 = v20;
      __int16 v31 = 2114;
      long long v32 = v21;
      __int16 v33 = 2048;
      uint64_t v34 = v22;
      _os_log_impl(&dword_22289A000, v17, OS_LOG_TYPE_DEFAULT, "[%{public}@] Removing record with identifier %{public}@ from notification repository for action %{public}@ (%ld)  ", (uint8_t *)&v27, 0x2Au);
    }
    id v23 = [v6 bulletinPublisherID];
    if (v23)
    {
      notificationRepository = self->_notificationRepository;
      unint64_t v25 = [MEMORY[0x263EFFA08] setWithObject:v23];
      __int16 v26 = [(UNSDefaultDataProvider *)self sectionIdentifier];
      [(UNCNotificationRepository *)notificationRepository removeNotificationRecordsForIdentifiers:v25 bundleIdentifier:v26];
    }
    if (v7) {
      v7[2](v7, 1);
    }
  }
  else
  {
LABEL_15:
    if (v7) {
      v7[2](v7, 0);
    }
  }
LABEL_6:
}

- (void)_handleBulletinActionResponse:(id)a3 withCompletion:(id)a4
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  char v8 = [(UNSDefaultDataProvider *)self sectionIdentifier];
  uint64_t v9 = [v6 actionID];
  uint64_t v43 = [v6 actionType];
  uint64_t v48 = [v6 context];
  id v10 = [v48 objectForKey:*MEMORY[0x263F2BD10]];
  uint64_t v44 = [v6 actionActivationMode];
  v52 = [v6 originID];
  v51 = [v6 endpoint];
  notificationRepository = self->_notificationRepository;
  uint64_t v12 = [v6 bulletinPublisherID];
  uint64_t v13 = [(UNCNotificationRepository *)notificationRepository notificationRecordForIdentifier:v12 bundleIdentifier:v8];

  v49 = v10;
  v50 = [v10 objectForKey:*MEMORY[0x263F1E148]];
  uint64_t v14 = v8;
  unint64_t v15 = [v13 defaultActionBundleIdentifier];
  os_log_t v16 = (NSObject **)MEMORY[0x263F1E020];
  char v17 = v14;
  if (v15)
  {
    if ([(UNCNotificationSourceDescription *)self->_notificationSourceDescription allowAlternateLaunchBundleIdentifiers])
    {
      char v17 = v15;

      uint64_t v18 = *v16;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        loga = v18;
        __int16 v40 = [(UNSDefaultDataProvider *)self sectionIdentifier];
        long long v19 = [v6 bulletinPublisherID];
        *(_DWORD *)buf = 138543874;
        double v58 = v40;
        __int16 v59 = 2114;
        v60 = v19;
        __int16 v61 = 2114;
        v62 = v17;
        _os_log_error_impl(&dword_22289A000, loga, OS_LOG_TYPE_ERROR, "[%{public}@] Launching action response '%{public}@' with alternate bundle identifier '%{public}@'", buf, 0x20u);
      }
    }
    else
    {
      long long v20 = *v16;
      char v17 = v14;
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        long long v37 = v20;
        __int16 v38 = [(UNSDefaultDataProvider *)self sectionIdentifier];
        uint64_t v39 = [v6 bulletinPublisherID];
        *(_DWORD *)buf = 138543874;
        double v58 = v38;
        __int16 v59 = 2114;
        v60 = v39;
        __int16 v61 = 2114;
        v62 = v15;
        _os_log_error_impl(&dword_22289A000, v37, OS_LOG_TYPE_ERROR, "[%{public}@] Permission denied to launch action response '%{public}@' with alternate bundle identifier '%{public}@'", buf, 0x20u);

        char v17 = v14;
      }
    }
  }
  os_log_t log = v15;
  if (v13)
  {
    id v21 = objc_alloc(MEMORY[0x263F84258]);
    [(UNSDefaultDataProvider *)self bundle];
    v23 = uint64_t v22 = v7;
    id v24 = (id)[v21 initWithBundle:v23 categoryRepository:self->_categoryRepository];

    id v7 = v22;
    unint64_t v25 = [v24 notificationForNotificationRecord:v13];
    __int16 v26 = (void *)v9;
  }
  else
  {
    __int16 v26 = (void *)v9;
    if (!v50)
    {
LABEL_18:
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E020], OS_LOG_TYPE_ERROR))
      {
        -[UNSDefaultDataProvider _handleBulletinActionResponse:withCompletion:]();
        if (!v7) {
          goto LABEL_36;
        }
      }
      else if (!v7)
      {
        goto LABEL_36;
      }
      v7[2](v7, 0);
      goto LABEL_36;
    }
    uint64_t v28 = [(UNSDefaultDataProvider *)self _unarchiveNotificationFromData:v50];
    id v24 = v28;
    if (v28)
    {
      uint64_t v41 = v7;
      __int16 v29 = [v28 sourceIdentifier];
      int v30 = [v14 isEqualToString:v29];

      if (v30)
      {
        id v24 = v24;
        unint64_t v25 = v24;
      }
      else
      {
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E020], OS_LOG_TYPE_FAULT)) {
          -[UNSDefaultDataProvider _handleBulletinActionResponse:withCompletion:]();
        }
        unint64_t v25 = 0;
      }
      id v7 = v41;
    }
    else
    {
      unint64_t v25 = 0;
    }
  }

  if (!v25) {
    goto LABEL_18;
  }
  switch(v43)
  {
    case 1:
      int v27 = (id *)MEMORY[0x263F1E0C8];
      goto LABEL_23;
    case 10:
      int v27 = (id *)MEMORY[0x263F1E0E8];
      goto LABEL_23;
    case 8:
      int v27 = (id *)MEMORY[0x263F1E0D0];
LABEL_23:
      id v31 = *v27;

      __int16 v26 = v31;
      break;
  }
  if ([v6 actionBehavior] == 1)
  {
    long long v32 = [v49 objectForKey:*MEMORY[0x263F2BD18]];
    __int16 v33 = [MEMORY[0x263F1DFA0] responseWithNotification:v25 actionIdentifier:v26 originIdentifier:v52 targetConnectionEndpoint:v51 userText:v32];
  }
  else
  {
    __int16 v33 = [MEMORY[0x263F1DF50] responseWithNotification:v25 actionIdentifier:v26 originIdentifier:v52 targetConnectionEndpoint:v51];
  }
  if (v44)
  {
    if ([(UNCNotificationSourceDescription *)self->_notificationSourceDescription daemonShouldReceiveBackgroundResponses])[(UNSDaemonLauncher *)self->_daemonLauncher didReceiveNotificationResponse:v33 forBundleIdentifier:v17 withCompletionHandler:v7]; {
    else
    }
      [(UNSApplicationLauncher *)self->_appLauncher backgroundLaunchApplication:v17 withResponse:v33 completionHandler:v7];
  }
  else if ([v6 didOpenApplication])
  {
    if ([(UNCNotificationSourceDescription *)self->_notificationSourceDescription daemonShouldReceiveApplicationEvents])[(UNSDaemonLauncher *)self->_daemonLauncher didOpenApplicationForResponse:v33 forBundleIdentifier:v17]; {
  }
    }
  else
  {
    [v25 request];
    uint64_t v34 = v42 = v7;
    uint64_t v35 = [v34 content];
    v45 = [v35 launchImageName];

    appLauncher = self->_appLauncher;
    v53[0] = MEMORY[0x263EF8330];
    v53[1] = 3221225472;
    v53[2] = __71__UNSDefaultDataProvider__handleBulletinActionResponse_withCompletion___block_invoke;
    v53[3] = &unk_26462F9E0;
    v53[4] = self;
    id v54 = v33;
    v55 = v17;
    id v56 = v42;
    id v7 = (void (**)(id, void))v42;
    [(UNSApplicationLauncher *)appLauncher foregroundLaunchApplication:v55 withResponse:v54 launchImageName:v45 origin:v52 endpoint:v51 completionHandler:v53];
  }
LABEL_36:
}

uint64_t __71__UNSDefaultDataProvider__handleBulletinActionResponse_withCompletion___block_invoke(void *a1, int a2)
{
  if (a2 && [*(id *)(a1[4] + 32) daemonShouldReceiveApplicationEvents]) {
    [*(id *)(a1[4] + 48) didOpenApplicationForResponse:a1[5] forBundleIdentifier:a1[6]];
  }
  uint64_t result = a1[7];
  if (result)
  {
    int v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

- (id)_unarchiveNotificationFromData:(id)a3
{
  id v3 = a3;
  int v4 = (void *)MEMORY[0x223CA06B0]();
  if (v3)
  {
    id v5 = (void *)[objc_alloc(MEMORY[0x263F08928]) initForReadingFromData:v3 error:0];
    id v6 = [v5 decodeObjectOfClass:objc_opt_class() forKey:*MEMORY[0x263F081D0]];
    [v5 finishDecoding];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (BOOL)syncsBulletinDismissal
{
  return [(UNCNotificationSourceDescription *)self->_notificationSourceDescription suppressDismissalSync] ^ 1;
}

- (void)notificationRepository:(id)a3 didDiscoverContentOnFirstUnlockForBundleIdentifier:(id)a4
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __100__UNSDefaultDataProvider_notificationRepository_didDiscoverContentOnFirstUnlockForBundleIdentifier___block_invoke;
  block[3] = &unk_26462F900;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __100__UNSDefaultDataProvider_notificationRepository_didDiscoverContentOnFirstUnlockForBundleIdentifier___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 104) invalidateBulletins];
}

- (void)notificationRepository:(id)a3 didPerformUpdates:(id)a4 forBundleIdentifier:(id)a5
{
  id v6 = a4;
  queue = self->_queue;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __87__UNSDefaultDataProvider_notificationRepository_didPerformUpdates_forBundleIdentifier___block_invoke;
  v9[3] = &unk_26462F430;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(queue, v9);
}

uint64_t __87__UNSDefaultDataProvider_notificationRepository_didPerformUpdates_forBundleIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_notificationRepositoryDidPerformUpdates:", *(void *)(a1 + 40));
}

- (void)categoryRepository:(id)a3 didChangeCategoriesForBundleIdentifier:(id)a4
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __84__UNSDefaultDataProvider_categoryRepository_didChangeCategoriesForBundleIdentifier___block_invoke;
  block[3] = &unk_26462F900;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __84__UNSDefaultDataProvider_categoryRepository_didChangeCategoriesForBundleIdentifier___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 104) reloadSectionParameters];
  v2 = *(void **)(*(void *)(a1 + 32) + 104);
  return [v2 invalidateBulletins];
}

- (void)topicRepository:(id)a3 didChangeTopicsForBundleIdentifier:(id)a4
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __77__UNSDefaultDataProvider_topicRepository_didChangeTopicsForBundleIdentifier___block_invoke;
  block[3] = &unk_26462F900;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __77__UNSDefaultDataProvider_topicRepository_didChangeTopicsForBundleIdentifier___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 104) reloadDefaultSectionInfo];
  v2 = *(void **)(*(void *)(a1 + 32) + 104);
  return [v2 invalidateBulletins];
}

- (void)summaryServiceAdapter:(id)a3 didReceiveGroupSummariesForNotificationIdentifiers:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __99__UNSDefaultDataProvider_summaryServiceAdapter_didReceiveGroupSummariesForNotificationIdentifiers___block_invoke;
  v8[3] = &unk_26462F430;
  id v9 = v5;
  id v10 = self;
  id v7 = v5;
  dispatch_async(queue, v8);
}

void __99__UNSDefaultDataProvider_summaryServiceAdapter_didReceiveGroupSummariesForNotificationIdentifiers___block_invoke(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v3)
  {
    uint64_t v5 = v3;
    uint64_t v6 = *(void *)v24;
    id v7 = (os_log_t *)MEMORY[0x263F1E020];
    *(void *)&long long v4 = 138543618;
    long long v22 = v4;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v24 != v6) {
          objc_enumerationMutation(v2);
        }
        uint64_t v9 = *(void *)(*((void *)&v23 + 1) + 8 * v8);
        os_log_t v10 = *v7;
        if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v11 = *(void **)(a1 + 40);
          uint64_t v12 = v10;
          uint64_t v13 = [v11 sectionIdentifier];
          *(_DWORD *)buf = v22;
          uint64_t v28 = v13;
          __int16 v29 = 2114;
          uint64_t v30 = v9;
          _os_log_impl(&dword_22289A000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] updating group summary for notification %{public}@", buf, 0x16u);
        }
        uint64_t v14 = *(void **)(a1 + 40);
        unint64_t v15 = (void *)v14[7];
        os_log_t v16 = objc_msgSend(v14, "sectionIdentifier", v22, (void)v23);
        char v17 = [v15 notificationRecordForIdentifier:v9 bundleIdentifier:v16];

        if (v17)
        {
          objc_msgSend(*(id *)(a1 + 40), "_queue_fetchBulletinForNotification:", v17);
        }
        else
        {
          os_log_t v18 = *v7;
          if (os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR))
          {
            long long v19 = *(void **)(a1 + 40);
            long long v20 = v18;
            id v21 = [v19 sectionIdentifier];
            *(_DWORD *)buf = v22;
            uint64_t v28 = v21;
            __int16 v29 = 2114;
            uint64_t v30 = v9;
            _os_log_error_impl(&dword_22289A000, v20, OS_LOG_TYPE_ERROR, "[%{public}@] notification %{public}@ record not found; Can't update group summary.",
              buf,
              0x16u);
          }
        }

        ++v8;
      }
      while (v5 != v8);
      uint64_t v5 = [v2 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v5);
  }
}

- (void)_queue_notificationRepositoryDidPerformUpdates:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        os_log_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * v9);
        uint64_t v11 = objc_msgSend(v10, "notificationRecord", (void)v14);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0
          && ([v10 shouldRepost] & 1) == 0
          && [(UNCNotificationSourceDescription *)self->_notificationSourceDescription allowPrivateProperties])
        {
          [(UNSDefaultDataProvider *)self _queue_modifyBulletinForNotification:v11];
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              uint64_t v12 = [v10 shouldRepost];
            }
            else {
              uint64_t v12 = 1;
            }
            [(UNSDefaultDataProvider *)self _queue_addBulletinForNotification:v11 shouldRepost:v12];
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              -[UNSDefaultDataProvider _queue_withdrawBulletinForNotification:shouldSync:](self, "_queue_withdrawBulletinForNotification:shouldSync:", v11, [v10 shouldSync]);
            }
          }
        }

        ++v9;
      }
      while (v7 != v9);
      uint64_t v13 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      uint64_t v7 = v13;
    }
    while (v13);
  }
}

- (void)_queue_fetchBulletinForNotification:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 identifier];
  if (v5)
  {
    unint64_t v6 = [(UNSDefaultDataProvider *)self _destinationsForNotification:v4];
    uint64_t v7 = (void *)*MEMORY[0x263F1E020];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E020], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = v7;
      uint64_t v9 = [(UNSDefaultDataProvider *)self sectionIdentifier];
      os_log_t v10 = [v4 identifier];
      uint64_t v11 = objc_msgSend(v10, "un_logDigest");
      uint64_t v12 = BBPublisherDestinationStrings();
      int v15 = 138544130;
      long long v16 = v9;
      __int16 v17 = 2114;
      os_log_t v18 = v11;
      __int16 v19 = 2048;
      unint64_t v20 = v6;
      __int16 v21 = 2114;
      long long v22 = v12;
      _os_log_impl(&dword_22289A000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Fetching notification %{public}@ destinations %ld: %{public}@", (uint8_t *)&v15, 0x2Au);
    }
    uint64_t v13 = [(UNSDefaultDataProvider *)self _queue_bulletinForNotification:v4];
    [(BBDataProviderProxy *)self->_proxy modifyBulletin:v13];
  }
  else
  {
    long long v14 = (void *)*MEMORY[0x263F1E020];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E020], OS_LOG_TYPE_ERROR)) {
      -[UNSDefaultDataProvider _queue_fetchBulletinForNotification:](v14, self);
    }
  }
}

- (void)_queue_modifyBulletinForNotification:(id)a3
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (![v4 pipelineState])
  {
    id v5 = [v4 identifier];
    if (v5)
    {
      long long v24 = [(UNSDefaultDataProvider *)self _categoryForNotification:v4];
      unint64_t v6 = [(UNSDefaultDataProvider *)self _destinationsForNotification:v4];
      uint64_t v7 = (os_log_t *)MEMORY[0x263F1E020];
      uint64_t v8 = (void *)*MEMORY[0x263F1E020];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E020], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v9 = v8;
        os_log_t v10 = [(UNSDefaultDataProvider *)self sectionIdentifier];
        uint64_t v11 = [v4 identifier];
        uint64_t v12 = objc_msgSend(v11, "un_logDigest");
        uint64_t v13 = BBPublisherDestinationStrings();
        *(_DWORD *)buf = 138544130;
        uint64_t v30 = v10;
        __int16 v31 = 2114;
        uint64_t v32 = v12;
        __int16 v33 = 2048;
        unint64_t v34 = v6;
        __int16 v35 = 2114;
        long long v36 = v13;
        _os_log_impl(&dword_22289A000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Modifying notification %{public}@ destinations %ld: %{public}@", buf, 0x2Au);
      }
      long long v14 = [(UNSDefaultDataProvider *)self _queue_bulletinForNotification:v4];
      if ([(UNSDefaultDataProvider *)self _isEligibleForPipeline])
      {
        os_log_t v15 = *v7;
        if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
        {
          long long v16 = v15;
          __int16 v17 = [(UNSDefaultDataProvider *)self sectionIdentifier];
          os_log_t v18 = [v4 identifier];
          __int16 v19 = objc_msgSend(v18, "un_logDigest");
          *(_DWORD *)buf = 138543618;
          uint64_t v30 = v17;
          __int16 v31 = 2114;
          uint64_t v32 = v19;
          _os_log_impl(&dword_22289A000, v16, OS_LOG_TYPE_DEFAULT, "[%{public}@] Starting modify notification pipeline for %{public}@", buf, 0x16u);
        }
        objc_initWeak((id *)buf, self);
        id v20 = objc_alloc_init(MEMORY[0x263F84250]);
        notificationSourceDescription = self->_notificationSourceDescription;
        v25[0] = MEMORY[0x263EF8330];
        v25[1] = 3221225472;
        v25[2] = __63__UNSDefaultDataProvider__queue_modifyBulletinForNotification___block_invoke;
        v25[3] = &unk_26462FA30;
        v25[4] = self;
        id v26 = v4;
        objc_copyWeak(&v28, (id *)buf);
        id v22 = v20;
        id v27 = v22;
        +[UNSNotificationPipelineAdapter updateBulletin:v14 category:v24 destinations:v6 sourceDescription:notificationSourceDescription completion:v25];

        objc_destroyWeak(&v28);
        objc_destroyWeak((id *)buf);
      }
      else
      {
        [(UNSDefaultDataProvider *)self _queue_saveResultNotificationRecord:v4 shouldRepost:0 isFailure:0 resultBulletin:0];
        [(BBDataProviderProxy *)self->_proxy modifyBulletin:v14];
      }
    }
    else
    {
      uint64_t v23 = (void *)*MEMORY[0x263F1E020];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E020], OS_LOG_TYPE_ERROR)) {
        -[UNSDefaultDataProvider _queue_modifyBulletinForNotification:](v23, self);
      }
    }
  }
}

void __63__UNSDefaultDataProvider__queue_modifyBulletinForNotification___block_invoke(uint64_t a1, void *a2, uint64_t a3, char a4)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a2;
  uint64_t v7 = (void *)*MEMORY[0x263F1E020];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E020], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void **)(a1 + 32);
    uint64_t v9 = v7;
    os_log_t v10 = [v8 sectionIdentifier];
    uint64_t v11 = [*(id *)(a1 + 40) identifier];
    uint64_t v12 = objc_msgSend(v11, "un_logDigest");
    *(_DWORD *)buf = 138543618;
    id v22 = v10;
    __int16 v23 = 2114;
    long long v24 = v12;
    _os_log_impl(&dword_22289A000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Completed modify notification pipeline for %{public}@", buf, 0x16u);
  }
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 56));
  long long v14 = WeakRetained;
  if (WeakRetained)
  {
    os_log_t v15 = WeakRetained[14];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __63__UNSDefaultDataProvider__queue_modifyBulletinForNotification___block_invoke_90;
    block[3] = &unk_26462FA08;
    block[4] = WeakRetained;
    id v17 = *(id *)(a1 + 40);
    char v20 = a4;
    id v18 = v6;
    id v19 = *(id *)(a1 + 48);
    dispatch_async(v15, block);
  }
}

uint64_t __63__UNSDefaultDataProvider__queue_modifyBulletinForNotification___block_invoke_90(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_queue_saveResultNotificationRecord:shouldRepost:isFailure:resultBulletin:", *(void *)(a1 + 40), 0, *(unsigned __int8 *)(a1 + 64), *(void *)(a1 + 48));
  [*(id *)(*(void *)(a1 + 32) + 104) modifyBulletin:*(void *)(a1 + 48)];
  return objc_opt_class();
}

- (void)_queue_addBulletinForNotification:(id)a3 shouldRepost:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v57 = *MEMORY[0x263EF8340];
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (![v6 pipelineState])
  {
    BOOL v29 = v4;
    uint64_t v30 = [(UNSDefaultDataProvider *)self _categoryForNotification:v6];
    unint64_t v31 = [(UNSDefaultDataProvider *)self _destinationsForNotification:v6];
    uint64_t v7 = (void *)*MEMORY[0x263F1E020];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E020], OS_LOG_TYPE_DEFAULT))
    {
      os_log_t log = v7;
      id v27 = [(UNSDefaultDataProvider *)self sectionIdentifier];
      id v28 = [v6 identifier];
      uint64_t v25 = objc_msgSend(v28, "un_logDigest");
      int v8 = [v6 hasAlertContent];
      int v9 = [v6 shouldPresentAlert];
      int v10 = [v6 hasSound];
      int v11 = [v6 shouldPlaySound];
      uint64_t v12 = [v6 interruptionLevel];
      uint64_t v13 = BBPublisherDestinationStrings();
      long long v14 = [v6 contentDate];
      os_log_t v15 = objc_msgSend(v14, "un_logString");
      *(_DWORD *)buf = 138545666;
      __int16 v38 = v27;
      __int16 v39 = 2114;
      __int16 v40 = v25;
      __int16 v41 = 1024;
      int v42 = v8;
      __int16 v43 = 1024;
      int v44 = v9;
      __int16 v45 = 1024;
      int v46 = v10;
      __int16 v47 = 1024;
      int v48 = v11;
      __int16 v49 = 2048;
      uint64_t v50 = v12;
      __int16 v51 = 2048;
      unint64_t v52 = v31;
      __int16 v53 = 2114;
      id v54 = v13;
      __int16 v55 = 2114;
      id v56 = v15;
      _os_log_impl(&dword_22289A000, log, OS_LOG_TYPE_DEFAULT, "[%{public}@] Adding notification %{public}@ [ hasAlertContent: %d, shouldPresentAlert: %d hasSound: %d shouldPlaySound: %d ]; interruption-level: %lu; destinations %ld: %{public}@; contentDate: %{public}@",
        buf,
        0x56u);
    }
    if (v31)
    {
      long long v16 = [(UNSDefaultDataProvider *)self _queue_bulletinForNotification:v6];
      if ([(UNSDefaultDataProvider *)self _isEligibleForPipeline])
      {
        id v17 = (void *)*MEMORY[0x263F1E020];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E020], OS_LOG_TYPE_DEFAULT))
        {
          id v18 = v17;
          id v19 = [(UNSDefaultDataProvider *)self sectionIdentifier];
          char v20 = [v6 identifier];
          __int16 v21 = objc_msgSend(v20, "un_logDigest");
          *(_DWORD *)buf = 138543618;
          __int16 v38 = v19;
          __int16 v39 = 2114;
          __int16 v40 = v21;
          _os_log_impl(&dword_22289A000, v18, OS_LOG_TYPE_DEFAULT, "[%{public}@] Starting add notification pipeline for %{public}@", buf, 0x16u);
        }
        objc_initWeak((id *)buf, self);
        id v22 = objc_alloc_init(MEMORY[0x263F84250]);
        notificationSourceDescription = self->_notificationSourceDescription;
        v32[0] = MEMORY[0x263EF8330];
        v32[1] = 3221225472;
        v32[2] = __73__UNSDefaultDataProvider__queue_addBulletinForNotification_shouldRepost___block_invoke;
        v32[3] = &unk_26462FA80;
        v32[4] = self;
        id v33 = v6;
        objc_copyWeak(&v35, (id *)buf);
        BOOL v36 = v29;
        id v24 = v22;
        id v34 = v24;
        +[UNSNotificationPipelineAdapter createBulletin:v16 category:v30 destinations:v31 sourceDescription:notificationSourceDescription completion:v32];

        objc_destroyWeak(&v35);
        objc_destroyWeak((id *)buf);
      }
      else
      {
        [(UNSDefaultDataProvider *)self _queue_saveResultNotificationRecord:v6 shouldRepost:v29 isFailure:0 resultBulletin:0];
        [(BBDataProviderProxy *)self->_proxy addBulletin:v16 forDestinations:v31];
      }
    }
  }
}

void __73__UNSDefaultDataProvider__queue_addBulletinForNotification_shouldRepost___block_invoke(uint64_t a1, void *a2, uint64_t a3, char a4)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v7 = a2;
  int v8 = (void *)*MEMORY[0x263F1E020];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E020], OS_LOG_TYPE_DEFAULT))
  {
    int v9 = *(void **)(a1 + 32);
    int v10 = v8;
    int v11 = [v9 sectionIdentifier];
    uint64_t v12 = [*(id *)(a1 + 40) identifier];
    uint64_t v13 = objc_msgSend(v12, "un_logDigest");
    *(_DWORD *)buf = 138543618;
    uint64_t v25 = v11;
    __int16 v26 = 2114;
    id v27 = v13;
    _os_log_impl(&dword_22289A000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] Completed add notification pipeline for %{public}@", buf, 0x16u);
  }
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 56));
  os_log_t v15 = WeakRetained;
  if (WeakRetained)
  {
    long long v16 = WeakRetained[14];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __73__UNSDefaultDataProvider__queue_addBulletinForNotification_shouldRepost___block_invoke_92;
    v17[3] = &unk_26462FA58;
    v17[4] = WeakRetained;
    id v18 = *(id *)(a1 + 40);
    char v22 = *(unsigned char *)(a1 + 64);
    char v23 = a4;
    id v19 = v7;
    uint64_t v21 = a3;
    id v20 = *(id *)(a1 + 48);
    dispatch_async(v16, v17);
  }
}

uint64_t __73__UNSDefaultDataProvider__queue_addBulletinForNotification_shouldRepost___block_invoke_92(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_queue_saveResultNotificationRecord:shouldRepost:isFailure:resultBulletin:", *(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 72), *(unsigned __int8 *)(a1 + 73), *(void *)(a1 + 48));
  [*(id *)(*(void *)(a1 + 32) + 104) addBulletin:*(void *)(a1 + 48) forDestinations:*(void *)(a1 + 64)];
  return objc_opt_class();
}

- (void)_queue_withdrawBulletinForNotification:(id)a3 shouldSync:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v7 = [v6 identifier];
  int v8 = (os_log_t *)MEMORY[0x263F1E020];
  int v9 = (void *)*MEMORY[0x263F1E020];
  int v10 = *MEMORY[0x263F1E020];
  if (v7)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = v9;
      uint64_t v12 = [(UNSDefaultDataProvider *)self sectionIdentifier];
      uint64_t v13 = objc_msgSend(v7, "un_logDigest");
      *(_DWORD *)buf = 138543618;
      uint64_t v30 = v12;
      __int16 v31 = 2114;
      uint64_t v32 = v13;
      _os_log_impl(&dword_22289A000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] Withdrawing notification %{public}@", buf, 0x16u);
    }
    long long v14 = [(UNSDefaultDataProvider *)self _queue_bulletinForNotification:v6];
    if ([(UNSDefaultDataProvider *)self _isEligibleForPipeline])
    {
      os_log_t v15 = *v8;
      if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
      {
        long long v16 = v15;
        id v17 = [(UNSDefaultDataProvider *)self sectionIdentifier];
        id v18 = [v6 identifier];
        id v19 = objc_msgSend(v18, "un_logDigest");
        *(_DWORD *)buf = 138543618;
        uint64_t v30 = v17;
        __int16 v31 = 2114;
        uint64_t v32 = v19;
        _os_log_impl(&dword_22289A000, v16, OS_LOG_TYPE_DEFAULT, "[%{public}@] Starting delete notification pipeline for %{public}@", buf, 0x16u);
      }
      objc_initWeak((id *)buf, self);
      id v20 = objc_alloc_init(MEMORY[0x263F84250]);
      notificationSourceDescription = self->_notificationSourceDescription;
      v23[0] = MEMORY[0x263EF8330];
      v23[1] = 3221225472;
      v23[2] = __76__UNSDefaultDataProvider__queue_withdrawBulletinForNotification_shouldSync___block_invoke;
      v23[3] = &unk_26462FAD0;
      v23[4] = self;
      id v24 = v6;
      objc_copyWeak(&v27, (id *)buf);
      id v25 = v7;
      BOOL v28 = v4;
      id v22 = v20;
      id v26 = v22;
      +[UNSNotificationPipelineAdapter deleteBulletin:v14 sourceDescription:notificationSourceDescription completion:v23];

      objc_destroyWeak(&v27);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      [(BBDataProviderProxy *)self->_proxy withdrawBulletinWithPublisherBulletinID:v7 shouldSync:v4];
    }
  }
  else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    -[UNSDefaultDataProvider _queue_withdrawBulletinForNotification:shouldSync:](v9, self);
  }
}

void __76__UNSDefaultDataProvider__queue_withdrawBulletinForNotification_shouldSync___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v2 = (void *)*MEMORY[0x263F1E020];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E020], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void **)(a1 + 32);
    BOOL v4 = v2;
    id v5 = [v3 sectionIdentifier];
    id v6 = [*(id *)(a1 + 40) identifier];
    id v7 = objc_msgSend(v6, "un_logDigest");
    *(_DWORD *)buf = 138543618;
    long long v16 = v5;
    __int16 v17 = 2114;
    id v18 = v7;
    _os_log_impl(&dword_22289A000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Completed delete notification pipeline for %{public}@", buf, 0x16u);
  }
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 64));
  int v9 = WeakRetained;
  if (WeakRetained)
  {
    int v10 = WeakRetained[14];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __76__UNSDefaultDataProvider__queue_withdrawBulletinForNotification_shouldSync___block_invoke_93;
    v11[3] = &unk_26462FAA8;
    v11[4] = WeakRetained;
    id v12 = *(id *)(a1 + 48);
    char v14 = *(unsigned char *)(a1 + 72);
    id v13 = *(id *)(a1 + 56);
    dispatch_async(v10, v11);
  }
}

uint64_t __76__UNSDefaultDataProvider__queue_withdrawBulletinForNotification_shouldSync___block_invoke_93(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 104) withdrawBulletinWithPublisherBulletinID:*(void *)(a1 + 40) shouldSync:*(unsigned __int8 *)(a1 + 56)];
  return objc_opt_class();
}

- (void)_queue_saveResultNotificationRecord:(id)a3 shouldRepost:(BOOL)a4 isFailure:(BOOL)a5 resultBulletin:(id)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  id v17 = a3;
  id v10 = a6;
  if (v7) {
    uint64_t v11 = 2;
  }
  else {
    uint64_t v11 = 1;
  }
  [v17 setPipelineState:v11];
  if (v10)
  {
    objc_msgSend(v17, "setIsHighlight:", objc_msgSend(v10, "isHighlight"));
    id v12 = [v10 summary];
    [v17 setSummary:v12];

    objc_msgSend(v17, "setPriorityStatus:", -[UNSDefaultDataProvider _notificationRecordPriorityStatusForBulletinStatus:](self, "_notificationRecordPriorityStatusForBulletinStatus:", objc_msgSend(v10, "priorityNotificationStatus")));
    objc_msgSend(v17, "setSummaryStatus:", -[UNSDefaultDataProvider _notificationRecordSummaryStatusForBulletinStatus:](self, "_notificationRecordSummaryStatusForBulletinStatus:", objc_msgSend(v10, "notificationSummaryStatus")));
    id v13 = [v10 eventBehavior];
    [v17 setEventBehavior:v13];
  }
  char v14 = [(UNCNotificationSourceDescription *)self->_notificationSourceDescription bundleIdentifier];
  notificationRepository = self->_notificationRepository;
  long long v16 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v17, "revisionNumber"));
  [(UNCNotificationRepository *)notificationRepository saveNotificationRecord:v17 targetRevisionNumber:v16 shouldRepost:v8 forBundleIdentifier:v14 withCompletionHandler:&__block_literal_global_96_0];
}

- (id)_categoryForNotification:(id)a3
{
  BOOL v4 = [a3 categoryIdentifier];
  id v5 = [(UNSDefaultDataProvider *)self _categoryForIdentifier:v4];

  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x263F84240]);
    BOOL v7 = [(UNSDefaultDataProvider *)self bundle];
    BOOL v8 = (void *)[v6 initWithBundle:v7];

    int v9 = [v8 notificationCategoryForNotificationCategoryRecord:v5];
  }
  else
  {
    int v9 = 0;
  }

  return v9;
}

- (unint64_t)_destinationsForNotification:(id)a3
{
  id v4 = a3;
  id v5 = [v4 categoryIdentifier];
  id v6 = [(UNSDefaultDataProvider *)self _categoryForIdentifier:v5];

  unint64_t v7 = [v4 presentationOptions];
  BOOL v8 = [MEMORY[0x263F29CA0] sharedInstance];
  int v9 = [v8 deviceClass];

  BOOL v10 = v9 != 4;
  if (![v4 shouldPresentAlert] || !objc_msgSend(v4, "hasAlertContent"))
  {
    if ([v4 shouldPlaySound]) {
      uint64_t v20 = [v4 hasSound];
    }
    else {
      uint64_t v20 = 0;
    }
    goto LABEL_21;
  }
  unint64_t v11 = v7 & 0x14;
  int v12 = v10 & (v7 >> 3) | (v7 >> 2) & 1;
  unint64_t v13 = v7 & 0xC;
  if (![(UNCNotificationSourceDescription *)self->_notificationSourceDescription allowPrivateProperties])
  {
    if (v12) {
      uint64_t v26 = (8 * (v11 != 0)) | 4;
    }
    else {
      uint64_t v26 = 8 * (v11 != 0);
    }
    if (v13) {
      uint64_t v19 = v26 | 2;
    }
    else {
      uint64_t v19 = v26;
    }
    uint64_t v20 = v19 | 0x80;
    if (![v6 shouldAllowInCarPlay]) {
      goto LABEL_21;
    }
    goto LABEL_37;
  }
  BOOL v14 = v11 != 0;
  if ([v4 allowsAlertDestination]) {
    uint64_t v15 = 8 * v14;
  }
  else {
    uint64_t v15 = 0;
  }
  if (([v4 allowsLockScreenDestination] & v12) != 0) {
    uint64_t v16 = v15 | 4;
  }
  else {
    uint64_t v16 = v15;
  }
  int v17 = [v4 allowsNotificationCenterDestination];
  uint64_t v18 = v16 | 2;
  if (!v13) {
    uint64_t v18 = v16;
  }
  if (v17) {
    uint64_t v19 = v18;
  }
  else {
    uint64_t v19 = v16;
  }
  uint64_t v20 = v19 | 0x80;
  if ([v6 shouldAllowInCarPlay]
    && [v4 allowsCarPlayDestination])
  {
LABEL_37:
    if (![(UNSDefaultDataProvider *)self _isAppProtectionActive]) {
      uint64_t v20 = v19 | 0xC0;
    }
  }
LABEL_21:
  if ([(UNCNotificationSourceDescription *)self->_notificationSourceDescription allowPrivateProperties])
  {
    uint64_t v21 = [v4 topicIdentifiers];
  }
  else
  {
    uint64_t v21 = 0;
  }
  if ([v4 hasCriticalAlertSound])
  {
    BOOL v22 = [(UNSDefaultDataProvider *)self _queue_supportsCriticalAlertsForSubsectionIDs:v21];
    uint64_t v23 = 256;
    if (v22) {
      uint64_t v23 = 66304;
    }
  }
  else
  {
    uint64_t v23 = 256;
  }
  unint64_t v24 = v23 | v20;

  return v24;
}

- (void)_addAttachments:(id)a3 toBulletinRequest:(id)a4
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id obj = v5;
  uint64_t v7 = [v5 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v32 != v9) {
          objc_enumerationMutation(obj);
        }
        unint64_t v11 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        unint64_t v12 = [v11 family] - 1;
        if (v12 > 2) {
          uint64_t v13 = 0;
        }
        else {
          uint64_t v13 = qword_2228DAA78[v12];
        }
        BOOL v14 = [v11 options];
        uint64_t v15 = [v14 displayLocation];

        uint64_t v16 = [v11 options];
        BOOL v17 = [v16 displayLocation] == 1;

        id v18 = objc_alloc_init(MEMORY[0x263F2BC80]);
        [v18 setType:v13];
        uint64_t v19 = [v11 URL];
        [v18 setURL:v19];

        uint64_t v20 = [v11 identifier];
        [v18 setIdentifier:v20];

        uint64_t v21 = [v11 type];
        [v18 setUniformType:v21];

        BOOL v22 = [v11 options];
        uint64_t v23 = [v22 thumbnailGeneratorUserInfo];
        [v18 setThumbnailGeneratorUserInfo:v23];

        [v18 setThumbnailHidden:v15 == 2];
        [v18 setHiddenFromDefaultExpandedView:v17];
        unint64_t v24 = [v6 primaryAttachment];

        if (v24 || v15 == 2)
        {
          id v25 = [v6 additionalAttachments];
          uint64_t v26 = v25;
          if (v25)
          {
            id v27 = v25;
          }
          else
          {
            id v27 = [MEMORY[0x263EFF8C0] array];
          }
          BOOL v28 = v27;

          BOOL v29 = [v28 arrayByAddingObject:v18];

          [v6 setAdditionalAttachments:v29];
        }
        else
        {
          [v6 setPrimaryAttachment:v18];
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v8);
  }
}

- (id)_sectionIconVariantForImageName:(id)a3 bundlePath:(id)a4 format:(int64_t)a5 precomposed:(BOOL)a6
{
  BOOL v6 = a6;
  id v9 = a3;
  id v10 = a4;
  if ([v9 length])
  {
    unint64_t v11 = [MEMORY[0x263F2BCA0] variantWithFormat:a5 imageName:v9 inBundleAtPath:v10];
    [v11 setPrecomposed:v6];
  }
  else
  {
    unint64_t v11 = 0;
  }

  return v11;
}

- (id)_sectionIconForNotificationSourceDescription:(id)a3
{
  id v4 = a3;
  id v5 = [v4 bundleURL];
  BOOL v6 = [v5 path];

  uint64_t v7 = [v4 suppressIconMask];
  uint64_t v8 = [v4 defaultIconFile];
  id v35 = [(UNSDefaultDataProvider *)self _sectionIconVariantForImageName:v8 bundlePath:v6 format:0 precomposed:v7];

  id v9 = [v4 subordinateIconFile];
  long long v34 = [(UNSDefaultDataProvider *)self _sectionIconVariantForImageName:v9 bundlePath:v6 format:26 precomposed:v7];

  id v10 = [v4 carPlayIconFile];
  int v44 = [(UNSDefaultDataProvider *)self _sectionIconVariantForImageName:v10 bundlePath:v6 format:14 precomposed:v7];

  unint64_t v11 = [v4 settingsIconFile];
  __int16 v43 = [(UNSDefaultDataProvider *)self _sectionIconVariantForImageName:v11 bundlePath:v6 format:1 precomposed:v7];

  unint64_t v12 = [v4 settingsSheetIconFile];
  int v42 = [(UNSDefaultDataProvider *)self _sectionIconVariantForImageName:v12 bundlePath:v6 format:17 precomposed:v7];

  uint64_t v13 = [v4 watchQuickLookSmallIconFile];
  BOOL v14 = [(UNSDefaultDataProvider *)self _sectionIconVariantForImageName:v13 bundlePath:v6 format:2 precomposed:v7];

  uint64_t v15 = [v4 watchQuickLookLargeIconFile];
  __int16 v41 = [(UNSDefaultDataProvider *)self _sectionIconVariantForImageName:v15 bundlePath:v6 format:4 precomposed:v7];

  uint64_t v16 = [v4 watchListSmallIconFile];
  __int16 v40 = [(UNSDefaultDataProvider *)self _sectionIconVariantForImageName:v16 bundlePath:v6 format:10 precomposed:v7];

  BOOL v17 = [v4 watchListLargeIconFile];
  __int16 v39 = [(UNSDefaultDataProvider *)self _sectionIconVariantForImageName:v17 bundlePath:v6 format:12 precomposed:v7];

  id v18 = [v4 watchQuickLook394hIconFile];
  uint64_t v37 = [(UNSDefaultDataProvider *)self _sectionIconVariantForImageName:v18 bundlePath:v6 format:4 precomposed:v7];

  uint64_t v19 = [v4 watchQuickLook448hIconFile];
  uint64_t v36 = [(UNSDefaultDataProvider *)self _sectionIconVariantForImageName:v19 bundlePath:v6 format:15 precomposed:v7];

  uint64_t v20 = [v4 watchList394hIconFile];
  __int16 v38 = [(UNSDefaultDataProvider *)self _sectionIconVariantForImageName:v20 bundlePath:v6 format:12 precomposed:v7];

  uint64_t v21 = [v4 watchList448hIconFile];
  BOOL v22 = [(UNSDefaultDataProvider *)self _sectionIconVariantForImageName:v21 bundlePath:v6 format:18 precomposed:v7];

  uint64_t v23 = [v4 watchQuickLook430hIconFile];
  unint64_t v24 = [(UNSDefaultDataProvider *)self _sectionIconVariantForImageName:v23 bundlePath:v6 format:4 precomposed:v7];

  id v25 = [v4 watchQuickLook484hIconFile];
  uint64_t v26 = [(UNSDefaultDataProvider *)self _sectionIconVariantForImageName:v25 bundlePath:v6 format:20 precomposed:v7];

  id v27 = [v4 watchList430hIconFile];
  BOOL v28 = [(UNSDefaultDataProvider *)self _sectionIconVariantForImageName:v27 bundlePath:v6 format:12 precomposed:v7];

  BOOL v29 = [v4 watchList484hIconFile];

  uint64_t v30 = [(UNSDefaultDataProvider *)self _sectionIconVariantForImageName:v29 bundlePath:v6 format:20 precomposed:v7];

  if (v14
    || v41
    || v34
    || v35
    || v44
    || v43
    || v42
    || v40
    || v39
    || v38
    || v22
    || v24
    || v26
    || v28
    || (long long v31 = 0, v30))
  {
    id v32 = objc_alloc_init(MEMORY[0x263F2BC98]);
    long long v31 = v32;
    if (v35) {
      [v32 addVariant:v35];
    }
    if (v34) {
      [v31 addVariant:v34];
    }
    if (v44) {
      objc_msgSend(v31, "addVariant:");
    }
    if (v43) {
      objc_msgSend(v31, "addVariant:");
    }
    if (v42) {
      objc_msgSend(v31, "addVariant:");
    }
    if (v14) {
      objc_msgSend(v31, "addVariant:");
    }
    if (v41) {
      [v31 addVariant:v41];
    }
    if (v40) {
      objc_msgSend(v31, "addVariant:");
    }
    if (v39) {
      objc_msgSend(v31, "addVariant:");
    }
    if (v37) {
      [v31 addVariant:v37];
    }
    if (v36) {
      objc_msgSend(v31, "addVariant:");
    }
    if (v38) {
      objc_msgSend(v31, "addVariant:");
    }
    if (v22) {
      [v31 addVariant:v22];
    }
    if (v24) {
      [v31 addVariant:v24];
    }
    if (v26) {
      [v31 addVariant:v26];
    }
    if (v28) {
      [v31 addVariant:v28];
    }
    if (v30) {
      [v31 addVariant:v30];
    }
  }

  return v31;
}

- (unint64_t)_bulletinInterruptionLevelForInterruptionLevel:(unint64_t)a3
{
  if (a3 - 1 >= 3) {
    return 0;
  }
  else {
    return a3;
  }
}

- (unint64_t)_bulletinPriorityStatusForNotificationPriorityStatus:(unint64_t)a3
{
  if (a3 - 1 >= 5) {
    return 0;
  }
  else {
    return a3;
  }
}

- (unint64_t)_notificationRecordPriorityStatusForBulletinStatus:(unint64_t)a3
{
  if (a3 - 1 >= 5) {
    return 0;
  }
  else {
    return a3;
  }
}

- (unint64_t)_bulletinSummaryStatusForNotificationSummaryStatus:(unint64_t)a3
{
  if (a3 - 1 >= 4) {
    return 0;
  }
  else {
    return a3;
  }
}

- (unint64_t)_notificationRecordSummaryStatusForBulletinStatus:(unint64_t)a3
{
  if (a3 - 1 >= 4) {
    return 0;
  }
  else {
    return a3;
  }
}

- (BOOL)_isTCCUserAvailabilityGrantedForBundleId:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (os_log_t *)MEMORY[0x263F1E008];
  BOOL v6 = *MEMORY[0x263F1E008];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E008], OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138543362;
    id v12 = v4;
    _os_log_impl(&dword_22289A000, v6, OS_LOG_TYPE_DEFAULT, "Looking up User Availability permission for bundleId: %{public}@", (uint8_t *)&v11, 0xCu);
  }
  if ([v4 length])
  {
    uint64_t v7 = [(UNSDefaultDataProvider *)self _userAvailabilityTCCApprovedBundleIds];
    char v8 = [v7 containsObject:v4];
  }
  else
  {
    id v9 = *v5;
    char v8 = 0;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v11) = 0;
      _os_log_impl(&dword_22289A000, v9, OS_LOG_TYPE_DEFAULT, "Empty bundleId passed to isTCCUserAvailabilityGrantedForBundleId", (uint8_t *)&v11, 2u);
      char v8 = 0;
    }
  }

  return v8;
}

- (id)_userAvailabilityTCCApprovedBundleIds
{
  id v2 = (void *)MEMORY[0x263EFFA08];
  uint64_t v3 = (void *)TCCAccessCopyBundleIdentifiersForService();
  id v4 = [v2 setWithArray:v3];

  return v4;
}

- (BBDataProviderProxy)proxy
{
  return self->_proxy;
}

- (void)setProxy:(id)a3
{
}

- (void)setBundle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundle, 0);
  objc_storeStrong((id *)&self->_categoryToParamSubType, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_proxy, 0);
  objc_storeStrong((id *)&self->_summaryService, 0);
  objc_storeStrong((id *)&self->_localizationService, 0);
  objc_storeStrong((id *)&self->_attachmentsService, 0);
  objc_storeStrong((id *)&self->_topicRepository, 0);
  objc_storeStrong((id *)&self->_categoryRepository, 0);
  objc_storeStrong((id *)&self->_notificationRepository, 0);
  objc_storeStrong((id *)&self->_daemonLauncher, 0);
  objc_storeStrong((id *)&self->_appLauncher, 0);
  objc_storeStrong((id *)&self->_notificationSourceDescription, 0);
  objc_storeStrong((id *)&self->_effectiveSectionInfo, 0);
  objc_storeStrong((id *)&self->_sectionIcon, 0);
}

- (void)_queue_bulletinForNotification:(void *)a1 .cold.1(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v3 = a1;
  id v4 = [a2 sectionIdentifier];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_4_0(&dword_22289A000, v3, v5, "[%{public}@] Notification record has no identifier", v6);
}

- (void)_queue_bulletinForNotification:.cold.2()
{
  OUTLINED_FUNCTION_2_0();
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = [v2 sectionIdentifier];
  int v4 = 138543618;
  id v5 = v3;
  __int16 v6 = 2114;
  uint64_t v7 = v1;
  _os_log_error_impl(&dword_22289A000, v0, OS_LOG_TYPE_ERROR, "[%{public}@] Communication context is not nil but contentType is '%{public}@'. Abandoning communication API features.", (uint8_t *)&v4, 0x16u);
}

- (void)_queue_bulletinForNotification:(NSObject *)a3 .cold.3(void *a1, void *a2, NSObject *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = [a1 spotlightIdentifier];
  id v7 = [a2 title];
  id v8 = [a2 subtitle];
  id v9 = [a1 threadSummary];
  int v10 = 138413059;
  id v11 = v6;
  __int16 v12 = 2117;
  id v13 = v7;
  __int16 v14 = 2117;
  id v15 = v8;
  __int16 v16 = 2117;
  id v17 = v9;
  _os_log_debug_impl(&dword_22289A000, a3, OS_LOG_TYPE_DEBUG, "group summaries request for record with spotlightIdentifier: %@ title: %{sensitive}@ subtitle: %{sensitive}@ threadSummary: %{sensitive}@", (uint8_t *)&v10, 0x2Au);
}

- (void)_bbContentTypeFromUNContentType:toneAlertType:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  id v2 = v1;
  id v3 = [(id)OUTLINED_FUNCTION_3_0() sectionIdentifier];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_22289A000, v4, v5, "[%{public}@] _UNNotificationContentType is '%{public}@' but messaging notifications are  not allowed. Abandoning communication API features for all messaging notifications. Perhaps app isn't allowed to donate messaging intents or is missing the communication entitlement.", v6, v7, v8, v9, v10);
}

- (void)_bbContentTypeFromUNContentType:toneAlertType:.cold.3()
{
  OUTLINED_FUNCTION_2_0();
  id v2 = v1;
  id v3 = [(id)OUTLINED_FUNCTION_3_0() sectionIdentifier];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_22289A000, v4, v5, "[%{public}@] _UNNotificationContentType is '%{public}@' but intercom-type notifications are  not allowed. Abandoning communication API features for all intercom notifications. Perhaps app isn't allowed to donate read announcement intents or is missing the communication entitlement.", v6, v7, v8, v9, v10);
}

- (void)_bbContentTypeFromUNContentType:toneAlertType:.cold.4()
{
  OUTLINED_FUNCTION_2_0();
  id v2 = v1;
  id v3 = [(id)OUTLINED_FUNCTION_3_0() sectionIdentifier];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_22289A000, v4, v5, "[%{public}@] _UNNotificationContentType is '%{public}@' but call-type notifications are  not allowed. Abandoning communication API features for all call-related notifications. Perhaps app isn't allowed to donate start call intents or is missing the communication entitlement.", v6, v7, v8, v9, v10);
}

- (void)_handleBulletinActionResponse:withCompletion:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  id v3 = v2;
  uint64_t v4 = [(id)OUTLINED_FUNCTION_3_0() sectionIdentifier];
  id v11 = [v0 bulletinPublisherID];
  OUTLINED_FUNCTION_1_1(&dword_22289A000, v5, v6, "[%{public}@] Unable to fetch or unarchive notification to handle action response for: %{public}@", v7, v8, v9, v10, 2u);
}

- (void)_handleBulletinActionResponse:withCompletion:.cold.2()
{
  OUTLINED_FUNCTION_2_0();
  uint64_t v5 = *MEMORY[0x263EF8340];
  id v2 = v1;
  id v3 = [(id)OUTLINED_FUNCTION_3_0() sourceIdentifier];
  OUTLINED_FUNCTION_0_1();
  _os_log_fault_impl(&dword_22289A000, v0, OS_LOG_TYPE_FAULT, "Received unexpected notification response for section %{public}@ in data provider for section %{public}@", v4, 0x16u);
}

- (void)_unarchiveNotificationFromData:(uint8_t *)buf .cold.1(void *a1, uint64_t a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543618;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl(&dword_22289A000, log, OS_LOG_TYPE_ERROR, "[%{public}@] Ignoring keyed archive data contains that invalid classes: %{public}@", buf, 0x16u);
}

- (void)_queue_fetchBulletinForNotification:(void *)a1 .cold.1(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = a1;
  uint64_t v4 = [a2 sectionIdentifier];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_4_0(&dword_22289A000, v3, v5, "[%{public}@] Cannot fetch notification becuase identifier is nil", v6);
}

- (void)_queue_modifyBulletinForNotification:(void *)a1 .cold.1(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = a1;
  uint64_t v4 = [a2 sectionIdentifier];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_4_0(&dword_22289A000, v3, v5, "[%{public}@] Cannot modify notification becuase identifier is nil", v6);
}

- (void)_queue_withdrawBulletinForNotification:(void *)a1 shouldSync:(void *)a2 .cold.1(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = a1;
  uint64_t v4 = [a2 sectionIdentifier];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_4_0(&dword_22289A000, v3, v5, "[%{public}@] Cannot withdraw notification becuase identifier is nil", v6);
}

@end