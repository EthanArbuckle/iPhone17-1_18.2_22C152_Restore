@interface REMDaemonUserDefaults
+ (id)defaultValues;
+ (id)storageNumberForTodayNotificationTime:(id)a3;
+ (id)todayNotificationFireTimeFromStorageNumber:(id)a3;
- (BOOL)cloudKitMigrationDisableCleanUp;
- (BOOL)dataaccessDaemonStopSyncingReminders;
- (BOOL)databaseMigrationTestModeEnabled;
- (BOOL)databaseMigrationTimedOut;
- (BOOL)debugForceSupportCloudKitSchemaCatchUpSyncBackgroundScheduling;
- (BOOL)debugSimulateSqliteFull;
- (BOOL)didShowReminderDeletePrivacyWarning;
- (BOOL)disableAlarmEngineDataSourcePrefetching;
- (BOOL)enableAssignmentNotifications;
- (BOOL)enableAutoCompleteReminders;
- (BOOL)enableAutoGenerateCKPersonIDSalt;
- (BOOL)enableGroceryFeedbackSurvey;
- (BOOL)enableHashingUserIdentifiablesWithPersonIDSalt;
- (BOOL)enableInAppDebugMenu;
- (BOOL)enableWelcomeScreen;
- (BOOL)extraneousAlarmsCollectorContainerDeemedClean;
- (BOOL)forceBasicAAAccountEligibleForCloudKitReminders;
- (BOOL)forceEligibleForAutoCloudKitMigration;
- (BOOL)forceShowWelcomeScreen;
- (BOOL)forceShowWhatsNewScreen;
- (BOOL)groceryTipDismissed;
- (BOOL)hasCreatedGroceryList;
- (BOOL)hasSeenGroceryFeedbackSurvey;
- (BOOL)hasViewedContactsAccessAlertForCalDAVSharing;
- (BOOL)hasViewedContactsAccessAlertForLocation;
- (BOOL)hasViewedContactsAccessAlertForMessaging;
- (BOOL)hideEmptySectionsForGroceryList:(id)a3;
- (BOOL)isDatabaseMigrated;
- (BOOL)isSpotlightQueryLoggingEnabled;
- (BOOL)newAppShouldTakeoverEKReminderNotifications;
- (BOOL)sharedListActivityNotifications_demoMode;
- (BOOL)shouldIncludeRemindersDueTodayInBadgeCount;
- (BOOL)showRemindersAsOverdueWithShouldBypassCache:(BOOL)a3;
- (BOOL)simulateMAIDAccount;
- (BOOL)siriShouldRouteIntentsToNewRemindersApp;
- (BOOL)staledFileAttachmentCleanupContainerDeemedClean;
- (NSArray)acAccountIdentifiersToMigrateInactivatedCalDavData;
- (NSArray)automaticSecondaryGroceryLocales;
- (NSArray)imageDeduplicationLegacyAttachmentsMarkedForDeletion;
- (NSArray)preferredLocalizations;
- (NSArray)savedImageDeduplicationLegacyAttachmentsMarkedForDeletion;
- (NSData)accountsListCategorizedCountsCache;
- (NSData)hashtagLabelsInCustomSmartListFilterCache;
- (NSData)lastSuggestedAttributesAutoTrainingToken;
- (NSData)userInteractionsData;
- (NSDate)analyticsActivityLastExecutionDate;
- (NSDate)automaticSecondaryGroceryLocalesLastModifiedDate;
- (NSDate)batchDeleteExpiredRemindersLastExecutionDate;
- (NSDate)cloudKitMergeLocalLastDateMaxRetryReached;
- (NSDate)cloudKitSchemaCatchUpSyncLastScheduledDate;
- (NSDate)cloudKitSchemaCatchUpSyncLastSuccessDate;
- (NSDate)imageDeduplicationLastExecutionDate;
- (NSDate)lastCloudConfigurationDownload;
- (NSDate)lastDataSeparationMigrationDate;
- (NSDate)lastDismissedNotificationsPermissionInlineRequestDate;
- (NSDate)lastExtraneousAlarmsCollectorExecutionDate;
- (NSDate)lastPresentAlarmDate;
- (NSDate)lastSuggestedAttributesAutoTrainingExecutionDate;
- (NSDate)lastSyncPoll;
- (NSDate)lastViewedNotificationsPermissionWarmingSheetDate;
- (NSDate)nextScheduledAlarmDate;
- (NSDate)savedImageDeduplicationLastExecutionDate;
- (NSDate)staledFileAttachmentCleanupLastExecutionDate;
- (NSDate)suggestConversionToGroceryListLastExecutionDate;
- (NSDateComponents)todayNotificationFireTime;
- (NSDictionary)dataSeparationAppDocumentsURLDebugOverride;
- (NSDictionary)hideEmptySectionsForGroceryList;
- (NSDictionary)muteNotificationForSharedList;
- (NSDictionary)suggestedAttributesHarvestingOverrides;
- (NSDictionary)suggestedAttributesTrainingOverrides;
- (NSDictionary)syncActivityNotificationEngine_accountSignInTime;
- (NSNumber)cloudKitMaxNumAlarmIDsInReminderCKRecordDebugOverride;
- (NSNumber)cloudKitMigrationDelayAfterError;
- (NSNumber)cloudKitMigrationMaxNumFailures;
- (NSNumber)cloudKitMigrationMaxNumInvocations;
- (NSNumber)cloudKitMigrationObserverPollingInterval;
- (NSNumber)cloudKitMigrationSimulatedError;
- (NSNumber)cloudKitResultsLimitPerSyncOperation;
- (NSNumber)cloudKitSchemaCatchUpSyncSchedulingState;
- (NSNumber)debugSimulatedCKErrorCode;
- (NSNumber)remCurrentRuntimeVersionDebuggingOverride;
- (NSNumber)spotlightIndexVersion;
- (NSNumber)tipKitCachedCountOfCustomSmartLists;
- (NSNumber)tipKitCachedCountOfHashtags;
- (NSNumber)tipKitCachedCountOfLists;
- (NSNumber)tipKitCachedCountOfListsWithCustomBadge;
- (NSNumber)tipKitCachedCountOfUncompletedReminders;
- (NSString)acAccountIdentifierToMergeLocalDataIntoSyncData;
- (NSString)cloudKitMergeLocalLastBuildVersionMaxRetryReached;
- (NSString)cloudKitSchemaCatchUpSyncLastSuccessBuildVersion;
- (NSString)lastDatabaseMigrationSystemBuildVersion;
- (NSString)trialAssetsDirectoryDebugOverride;
- (NSURL)preferredDefaultListObjectIDUrl;
- (REMDaemonUserDefaults)initWithSuiteName:(id)a3 containerURL:(id)a4;
- (REMObjectID)preferredDefaultListID;
- (id)_pptPreferredDefaultListIDKey;
- (id)observeEnableAssignmentNotificationsWithBlock:(id)a3;
- (id)observeEnableAutoCompleteRemindersWithBlock:(id)a3;
- (id)observePreferredDefaultListIDWithBlock:(id)a3;
- (id)observeShouldIncludeRemindersDueTodayInBadgeCountWithBlock:(id)a3;
- (id)observeShowRemindersAsOverdueWithBlock:(id)a3;
- (id)observeTodayNotificationFireTimeWithBlock:(id)a3;
- (id)streamShouldIncludeRemindersDueTodayInBadgeCount:(id)a3;
- (id)streamTodayNotificationFireTime:(id)a3;
- (unint64_t)muteNotificationOptionsForSharedList:(id)a3;
- (void)deletePreferredDefaultListID;
- (void)deletePreferredDefaultListObjectIDUrl;
- (void)ppt_handleInstall;
- (void)ppt_handleRestore;
- (void)removeHideEmptySectionsForGroceryList:(id)a3;
- (void)removeMuteNotificationOptionsForSharedList:(id)a3;
- (void)setAcAccountIdentifierToMergeLocalDataIntoSyncData:(id)a3;
- (void)setAcAccountIdentifiersToMigrateInactivatedCalDavData:(id)a3;
- (void)setAccountsListCategorizedCountsCache:(id)a3;
- (void)setAnalyticsActivityLastExecutionDate:(id)a3;
- (void)setAutomaticSecondaryGroceryLocales:(id)a3;
- (void)setAutomaticSecondaryGroceryLocalesLastModifiedDate:(id)a3;
- (void)setBatchDeleteExpiredRemindersLastExecutionDate:(id)a3;
- (void)setBestKForKNN:(id)a3;
- (void)setCloudKitMaxNumAlarmIDsInReminderCKRecordDebugOverride:(id)a3;
- (void)setCloudKitMergeLocalLastBuildVersionMaxRetryReached:(id)a3;
- (void)setCloudKitMergeLocalLastDateMaxRetryReached:(id)a3;
- (void)setCloudKitMigrationDelayAfterError:(id)a3;
- (void)setCloudKitMigrationDisableCleanUp:(BOOL)a3;
- (void)setCloudKitMigrationMaxNumFailures:(id)a3;
- (void)setCloudKitMigrationMaxNumInvocations:(id)a3;
- (void)setCloudKitMigrationObserverPollingInterval:(id)a3;
- (void)setCloudKitMigrationSimulatedError:(id)a3;
- (void)setCloudKitResultsLimitPerSyncOperation:(id)a3;
- (void)setCloudKitSchemaCatchUpSyncLastScheduledDate:(id)a3;
- (void)setCloudKitSchemaCatchUpSyncLastSuccessBuildVersion:(id)a3;
- (void)setCloudKitSchemaCatchUpSyncLastSuccessDate:(id)a3;
- (void)setCloudKitSchemaCatchUpSyncSchedulingState:(id)a3;
- (void)setCoreBehaviorTrainingParameters:(id)a3;
- (void)setDataSeparationAppDocumentsURLDebugOverride:(id)a3;
- (void)setDatabaseMigrationTestModeEnabled:(BOOL)a3;
- (void)setDatabaseMigrationTimedOut:(BOOL)a3;
- (void)setDebugForceSupportCloudKitSchemaCatchUpSyncBackgroundScheduling:(BOOL)a3;
- (void)setDebugSimulateSqliteFull:(BOOL)a3;
- (void)setDebugSimulatedCKErrorCode:(id)a3;
- (void)setDidShowReminderDeletePrivacyWarning:(BOOL)a3;
- (void)setDisableAlarmEngineDataSourcePrefetching:(BOOL)a3;
- (void)setEnableAssignmentNotifications:(BOOL)a3;
- (void)setEnableAutoCompleteReminders:(BOOL)a3;
- (void)setEnableGroceryFeedbackSurvey:(BOOL)a3;
- (void)setEnableHashingUserIdentifiablesWithPersonIDSalt:(BOOL)a3;
- (void)setEnableInAppDebugMenu:(BOOL)a3;
- (void)setEnableWelcomeScreen:(BOOL)a3;
- (void)setExtraneousAlarmsCollectorContainerDeemedClean:(BOOL)a3;
- (void)setForceBasicAAAccountEligibleForCloudKitReminders:(BOOL)a3;
- (void)setForceEligibleForAutoCloudKitMigration:(BOOL)a3;
- (void)setForceShowWelcomeScreen:(BOOL)a3;
- (void)setForceShowWhatsNewScreen:(BOOL)a3;
- (void)setGroceryTipDismissed:(BOOL)a3;
- (void)setHasCreatedGroceryList:(BOOL)a3;
- (void)setHasSeenGroceryFeedbackSurvey:(BOOL)a3;
- (void)setHasViewedContactsAccessAlertForCalDAVSharing:(BOOL)a3;
- (void)setHasViewedContactsAccessAlertForLocation:(BOOL)a3;
- (void)setHasViewedContactsAccessAlertForMessaging:(BOOL)a3;
- (void)setHashtagLabelsInCustomSmartListFilterCache:(id)a3;
- (void)setHideEmptySections:(BOOL)a3 forGroceryList:(id)a4;
- (void)setHideEmptySectionsForGroceryList:(id)a3;
- (void)setImageDeduplicationLastExecutionDate:(id)a3;
- (void)setImageDeduplicationLegacyAttachmentsMarkedForDeletion:(id)a3;
- (void)setIsDatabaseMigrated:(BOOL)a3;
- (void)setIsSpotlightQueryLoggingEnabled:(BOOL)a3;
- (void)setLastCloudConfigurationDownload:(id)a3;
- (void)setLastDataSeparationMigrationDate:(id)a3;
- (void)setLastDatabaseMigrationSystemBuildVersion:(id)a3;
- (void)setLastDismissedNotificationsPermissionInlineRequestDate:(id)a3;
- (void)setLastExtraneousAlarmsCollectorExecutionDate:(id)a3;
- (void)setLastPresentAlarmDate:(id)a3;
- (void)setLastSuggestedAttributesAutoTrainingExecutionDate:(id)a3;
- (void)setLastSuggestedAttributesAutoTrainingToken:(id)a3;
- (void)setLastSyncPoll:(id)a3;
- (void)setLastViewedNotificationsPermissionWarmingSheetDate:(id)a3;
- (void)setMuteNotificationForSharedList:(id)a3;
- (void)setMuteNotificationOptions:(unint64_t)a3 forSharedList:(id)a4;
- (void)setNextScheduledAlarmDate:(id)a3;
- (void)setPreferredDefaultListID:(id)a3;
- (void)setPreferredDefaultListObjectIDUrl:(id)a3;
- (void)setPreferredLocalizations:(id)a3;
- (void)setRemCurrentRuntimeVersionDebuggingOverride:(id)a3;
- (void)setSavedImageDeduplicationLastExecutionDate:(id)a3;
- (void)setSavedImageDeduplicationLegacyAttachmentsMarkedForDeletion:(id)a3;
- (void)setSharedListActivityNotifications_demoMode:(BOOL)a3;
- (void)setShouldIncludeRemindersDueTodayInBadgeCount:(BOOL)a3;
- (void)setShowRemindersAsOverdue:(BOOL)a3;
- (void)setSimulateMAIDAccount:(BOOL)a3;
- (void)setSpotlightIndexVersion:(id)a3;
- (void)setStaledFileAttachmentCleanupContainerDeemedClean:(BOOL)a3;
- (void)setStaledFileAttachmentCleanupLastExecutionDate:(id)a3;
- (void)setSuggestConversionToGroceryListLastExecutionDate:(id)a3;
- (void)setSuggestedAttributesHarvestingOverrides:(id)a3;
- (void)setSuggestedAttributesTrainingOverrides:(id)a3;
- (void)setSyncActivityNotificationEngine_accountSignInTime:(id)a3;
- (void)setTipKitCachedCountOfCustomSmartLists:(id)a3;
- (void)setTipKitCachedCountOfHashtags:(id)a3;
- (void)setTipKitCachedCountOfLists:(id)a3;
- (void)setTipKitCachedCountOfListsWithCustomBadge:(id)a3;
- (void)setTipKitCachedCountOfUncompletedReminders:(id)a3;
- (void)setTodayNotificationFireTime:(id)a3;
- (void)setTrialAssetsDirectoryDebugOverride:(id)a3;
- (void)setUserInteractionsData:(id)a3;
@end

@implementation REMDaemonUserDefaults

- (NSURL)preferredDefaultListObjectIDUrl
{
  v2 = [(REMUserDefaults *)self userDefaults];
  v3 = [v2 objectForKey:@"preferredDefaultListObjectIDUrl"];

  v4 = [MEMORY[0x1E4F1CB10] URLWithString:v3];

  return (NSURL *)v4;
}

- (REMDaemonUserDefaults)initWithSuiteName:(id)a3 containerURL:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)REMDaemonUserDefaults;
  v4 = [(REMUserDefaults *)&v10 initWithSuiteName:a3 containerURL:a4];
  v5 = v4;
  if (v4)
  {
    v6 = [(REMUserDefaults *)v4 userDefaults];
    v7 = +[REMDaemonUserDefaults defaultValues];
    [v6 registerDefaults:v7];

    v8 = [(REMUserDefaults *)v5 userDefaults];
    -[REMUserDefaults setShowRemindersAsOverdue_cached:](v5, "setShowRemindersAsOverdue_cached:", [v8 BOOLForKey:@"showRemindersAsOverdue"]);
  }
  return v5;
}

+ (id)defaultValues
{
  return &unk_1F136C350;
}

- (REMObjectID)preferredDefaultListID
{
  v2 = [(REMUserDefaults *)self userDefaults];
  v3 = [v2 objectForKey:@"preferredDefaultListID"];

  v4 = [MEMORY[0x1E4F1CB10] URLWithString:v3];
  if (v4)
  {
    v5 = +[REMObjectID objectIDWithURL:v4];
  }
  else
  {
    v5 = 0;
  }

  return (REMObjectID *)v5;
}

- (NSNumber)remCurrentRuntimeVersionDebuggingOverride
{
  v2 = [(REMUserDefaults *)self userDefaults];
  v3 = [v2 objectForKey:@"remCurrentRuntimeVersionDebuggingOverride"];

  return (NSNumber *)v3;
}

- (NSDate)lastDismissedNotificationsPermissionInlineRequestDate
{
  v2 = [(REMUserDefaults *)self userDefaults];
  v3 = [v2 objectForKey:@"lastDismissedNotificationsPermissionInlineRequestDate"];

  return (NSDate *)v3;
}

- (NSData)hashtagLabelsInCustomSmartListFilterCache
{
  v2 = [(REMUserDefaults *)self userDefaults];
  v3 = [v2 objectForKey:@"hashtagLabelsInCustomSmartListFilterCache"];

  return (NSData *)v3;
}

- (NSData)accountsListCategorizedCountsCache
{
  v2 = [(REMUserDefaults *)self userDefaults];
  v3 = [v2 objectForKey:@"accountsListCategorizedCountsCache"];

  return (NSData *)v3;
}

- (void)setPreferredLocalizations:(id)a3
{
  id v4 = a3;
  id v5 = [(REMUserDefaults *)self userDefaults];
  [v5 setObject:v4 forKey:@"preferredLocalizations"];
}

- (BOOL)newAppShouldTakeoverEKReminderNotifications
{
  return 1;
}

- (BOOL)dataaccessDaemonStopSyncingReminders
{
  return 1;
}

- (BOOL)siriShouldRouteIntentsToNewRemindersApp
{
  return 1;
}

- (BOOL)databaseMigrationTestModeEnabled
{
  v2 = [(REMUserDefaults *)self userDefaults];
  char v3 = [v2 BOOLForKey:@"databaseMigrationTestModeEnabled"];

  return v3;
}

- (void)setDatabaseMigrationTestModeEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(REMUserDefaults *)self userDefaults];
  [v4 setBool:v3 forKey:@"databaseMigrationTestModeEnabled"];
}

- (BOOL)isDatabaseMigrated
{
  v2 = [(REMUserDefaults *)self userDefaults];
  char v3 = [v2 BOOLForKey:@"isDatabaseMigrated"];

  return v3;
}

- (void)setIsDatabaseMigrated:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(REMUserDefaults *)self userDefaults];
  [v4 setBool:v3 forKey:@"isDatabaseMigrated"];
}

- (BOOL)databaseMigrationTimedOut
{
  v2 = [(REMUserDefaults *)self userDefaults];
  char v3 = [v2 BOOLForKey:@"databaseMigrationTimedOut"];

  return v3;
}

- (void)setDatabaseMigrationTimedOut:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(REMUserDefaults *)self userDefaults];
  [v4 setBool:v3 forKey:@"databaseMigrationTimedOut"];
}

- (NSString)lastDatabaseMigrationSystemBuildVersion
{
  v2 = [(REMUserDefaults *)self userDefaults];
  BOOL v3 = [v2 stringForKey:@"lastDatabaseMigrationSystemBuildVersion"];

  return (NSString *)v3;
}

- (void)setLastDatabaseMigrationSystemBuildVersion:(id)a3
{
  id v4 = a3;
  id v5 = [(REMUserDefaults *)self userDefaults];
  [v5 setObject:v4 forKey:@"lastDatabaseMigrationSystemBuildVersion"];
}

- (NSNumber)cloudKitMigrationMaxNumInvocations
{
  v2 = [(REMUserDefaults *)self userDefaults];
  BOOL v3 = [v2 objectForKey:@"cloudKitMigrationMaxNumInvocations"];

  return (NSNumber *)v3;
}

- (void)setCloudKitMigrationMaxNumInvocations:(id)a3
{
  id v4 = a3;
  id v5 = [(REMUserDefaults *)self userDefaults];
  [v5 setObject:v4 forKey:@"cloudKitMigrationMaxNumInvocations"];
}

- (NSNumber)cloudKitMigrationMaxNumFailures
{
  v2 = [(REMUserDefaults *)self userDefaults];
  BOOL v3 = [v2 objectForKey:@"cloudKitMigrationMaxNumFailures"];

  return (NSNumber *)v3;
}

- (void)setCloudKitMigrationMaxNumFailures:(id)a3
{
  id v4 = a3;
  id v5 = [(REMUserDefaults *)self userDefaults];
  [v5 setObject:v4 forKey:@"cloudKitMigrationMaxNumFailures"];
}

- (NSNumber)cloudKitMigrationDelayAfterError
{
  v2 = [(REMUserDefaults *)self userDefaults];
  BOOL v3 = [v2 objectForKey:@"cloudKitMigrationDelayAfterError"];

  return (NSNumber *)v3;
}

- (void)setCloudKitMigrationDelayAfterError:(id)a3
{
  id v4 = a3;
  id v5 = [(REMUserDefaults *)self userDefaults];
  [v5 setObject:v4 forKey:@"cloudKitMigrationDelayAfterError"];
}

- (NSNumber)cloudKitMigrationObserverPollingInterval
{
  v2 = [(REMUserDefaults *)self userDefaults];
  BOOL v3 = [v2 objectForKey:@"cloudKitMigrationObserverPollingInterval"];

  return (NSNumber *)v3;
}

- (void)setCloudKitMigrationObserverPollingInterval:(id)a3
{
  id v4 = a3;
  id v5 = [(REMUserDefaults *)self userDefaults];
  [v5 setObject:v4 forKey:@"cloudKitMigrationObserverPollingInterval"];
}

- (NSNumber)cloudKitMigrationSimulatedError
{
  v2 = [(REMUserDefaults *)self userDefaults];
  BOOL v3 = [v2 objectForKey:@"cloudKitMigrationSimulatedError"];

  return (NSNumber *)v3;
}

- (void)setCloudKitMigrationSimulatedError:(id)a3
{
  id v4 = a3;
  id v5 = [(REMUserDefaults *)self userDefaults];
  [v5 setObject:v4 forKey:@"cloudKitMigrationSimulatedError"];
}

- (NSNumber)cloudKitResultsLimitPerSyncOperation
{
  v2 = [(REMUserDefaults *)self userDefaults];
  BOOL v3 = [v2 objectForKey:@"cloudKitResultsLimitPerSyncOperation"];

  return (NSNumber *)v3;
}

- (void)setCloudKitResultsLimitPerSyncOperation:(id)a3
{
  id v4 = a3;
  id v5 = [(REMUserDefaults *)self userDefaults];
  [v5 setObject:v4 forKey:@"cloudKitResultsLimitPerSyncOperation"];
}

- (BOOL)cloudKitMigrationDisableCleanUp
{
  v2 = [(REMUserDefaults *)self userDefaults];
  char v3 = [v2 BOOLForKey:@"cloudKitMigrationDisableCleanUp"];

  return v3;
}

- (void)setCloudKitMigrationDisableCleanUp:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(REMUserDefaults *)self userDefaults];
  [v4 setBool:v3 forKey:@"cloudKitMigrationDisableCleanUp"];
}

- (void)setPreferredDefaultListID:(id)a3
{
  id v4 = a3;
  [(REMDaemonUserDefaults *)self deletePreferredDefaultListObjectIDUrl];
  id v5 = [v4 urlRepresentation];

  v6 = [v5 absoluteString];

  v7 = [(REMUserDefaults *)self userDefaults];
  [v7 setObject:v6 forKey:@"preferredDefaultListID"];

  v8 = +[REMLog utility];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_1B9AA2000, v8, OS_LOG_TYPE_DEFAULT, "Trigger NPS sync for preferredDefaultListID to paired device.", v12, 2u);
  }

  v9 = objc_opt_new();
  objc_super v10 = [(REMUserDefaults *)self suiteName];
  v11 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F136C170];
  [v9 synchronizeUserDefaultsDomain:v10 keys:v11];
}

- (void)deletePreferredDefaultListID
{
  [(REMDaemonUserDefaults *)self deletePreferredDefaultListObjectIDUrl];
  id v3 = [(REMUserDefaults *)self userDefaults];
  [v3 removeObjectForKey:@"preferredDefaultListID"];
}

- (void)deletePreferredDefaultListObjectIDUrl
{
  id v2 = [(REMUserDefaults *)self userDefaults];
  [v2 removeObjectForKey:@"preferredDefaultListObjectIDUrl"];
}

- (id)observePreferredDefaultListIDWithBlock:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __64__REMDaemonUserDefaults_observePreferredDefaultListIDWithBlock___block_invoke;
  v8[3] = &unk_1E61DC5B0;
  v8[4] = self;
  id v9 = v4;
  id v5 = v4;
  v6 = [(REMUserDefaults *)self _startObservingValuesForKey:@"preferredDefaultListID" block:v8];

  return v6;
}

void __64__REMDaemonUserDefaults_observePreferredDefaultListIDWithBlock___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) preferredDefaultListID];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)setPreferredDefaultListObjectIDUrl:(id)a3
{
  id v5 = [a3 absoluteString];
  id v4 = [(REMUserDefaults *)self userDefaults];
  [v4 setObject:v5 forKey:@"preferredDefaultListObjectIDUrl"];
}

- (NSArray)preferredLocalizations
{
  id v2 = [(REMUserDefaults *)self userDefaults];
  id v3 = [v2 objectForKey:@"preferredLocalizations"];

  return (NSArray *)v3;
}

- (NSString)acAccountIdentifierToMergeLocalDataIntoSyncData
{
  id v2 = [(REMUserDefaults *)self userDefaults];
  id v3 = [v2 objectForKey:@"acAccountIdentifierToMergeLocalDataIntoSyncData"];

  return (NSString *)v3;
}

- (void)setAcAccountIdentifierToMergeLocalDataIntoSyncData:(id)a3
{
  id v4 = a3;
  id v5 = [(REMUserDefaults *)self userDefaults];
  [v5 setObject:v4 forKey:@"acAccountIdentifierToMergeLocalDataIntoSyncData"];
}

- (NSArray)acAccountIdentifiersToMigrateInactivatedCalDavData
{
  id v2 = [(REMUserDefaults *)self userDefaults];
  id v3 = [v2 objectForKey:@"acAccountIdentifiersToMigrateInactivatedCalDavData"];

  return (NSArray *)v3;
}

- (void)setAcAccountIdentifiersToMigrateInactivatedCalDavData:(id)a3
{
  id v4 = a3;
  id v5 = [(REMUserDefaults *)self userDefaults];
  [v5 setObject:v4 forKey:@"acAccountIdentifiersToMigrateInactivatedCalDavData"];
}

- (NSDate)cloudKitMergeLocalLastDateMaxRetryReached
{
  id v2 = [(REMUserDefaults *)self userDefaults];
  id v3 = [v2 objectForKey:@"cloudKitMergeLocalLastDateMaxRetryReached"];

  return (NSDate *)v3;
}

- (void)setCloudKitMergeLocalLastDateMaxRetryReached:(id)a3
{
  id v4 = a3;
  id v5 = [(REMUserDefaults *)self userDefaults];
  [v5 setObject:v4 forKey:@"cloudKitMergeLocalLastDateMaxRetryReached"];
}

- (NSString)cloudKitMergeLocalLastBuildVersionMaxRetryReached
{
  id v2 = [(REMUserDefaults *)self userDefaults];
  id v3 = [v2 objectForKey:@"cloudKitMergeLocalLastBuildVersionMaxRetryReached"];

  return (NSString *)v3;
}

- (void)setCloudKitMergeLocalLastBuildVersionMaxRetryReached:(id)a3
{
  id v4 = a3;
  id v5 = [(REMUserDefaults *)self userDefaults];
  [v5 setObject:v4 forKey:@"cloudKitMergeLocalLastBuildVersionMaxRetryReached"];
}

- (NSDate)cloudKitSchemaCatchUpSyncLastSuccessDate
{
  id v2 = [(REMUserDefaults *)self userDefaults];
  id v3 = [v2 objectForKey:@"cloudKitSchemaCatchUpSyncLastSuccessDate"];

  return (NSDate *)v3;
}

- (void)setCloudKitSchemaCatchUpSyncLastSuccessDate:(id)a3
{
  id v4 = a3;
  id v5 = [(REMUserDefaults *)self userDefaults];
  [v5 setObject:v4 forKey:@"cloudKitSchemaCatchUpSyncLastSuccessDate"];
}

- (NSString)cloudKitSchemaCatchUpSyncLastSuccessBuildVersion
{
  id v2 = [(REMUserDefaults *)self userDefaults];
  id v3 = [v2 objectForKey:@"cloudKitSchemaCatchUpSyncLastSuccessBuildVersion"];

  return (NSString *)v3;
}

- (void)setCloudKitSchemaCatchUpSyncLastSuccessBuildVersion:(id)a3
{
  id v4 = a3;
  id v5 = [(REMUserDefaults *)self userDefaults];
  [v5 setObject:v4 forKey:@"cloudKitSchemaCatchUpSyncLastSuccessBuildVersion"];
}

- (NSNumber)cloudKitSchemaCatchUpSyncSchedulingState
{
  id v2 = [(REMUserDefaults *)self userDefaults];
  id v3 = [v2 objectForKey:@"cloudKitSchemaCatchUpSyncSchedulingState"];

  return (NSNumber *)v3;
}

- (void)setCloudKitSchemaCatchUpSyncSchedulingState:(id)a3
{
  id v4 = a3;
  id v5 = [(REMUserDefaults *)self userDefaults];
  [v5 setObject:v4 forKey:@"cloudKitSchemaCatchUpSyncSchedulingState"];
}

- (NSDate)cloudKitSchemaCatchUpSyncLastScheduledDate
{
  id v2 = [(REMUserDefaults *)self userDefaults];
  id v3 = [v2 objectForKey:@"cloudKitSchemaCatchUpSyncLastScheduledDate"];

  return (NSDate *)v3;
}

- (void)setCloudKitSchemaCatchUpSyncLastScheduledDate:(id)a3
{
  id v4 = a3;
  id v5 = [(REMUserDefaults *)self userDefaults];
  [v5 setObject:v4 forKey:@"cloudKitSchemaCatchUpSyncLastScheduledDate"];
}

- (BOOL)debugForceSupportCloudKitSchemaCatchUpSyncBackgroundScheduling
{
  id v2 = [(REMUserDefaults *)self userDefaults];
  char v3 = [v2 BOOLForKey:@"debugForceSupportCloudKitSchemaCatchUpSyncBackgroundScheduling"];

  return v3;
}

- (void)setDebugForceSupportCloudKitSchemaCatchUpSyncBackgroundScheduling:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(REMUserDefaults *)self userDefaults];
  [v4 setBool:v3 forKey:@"debugForceSupportCloudKitSchemaCatchUpSyncBackgroundScheduling"];
}

- (NSNumber)cloudKitMaxNumAlarmIDsInReminderCKRecordDebugOverride
{
  id v2 = [(REMUserDefaults *)self userDefaults];
  BOOL v3 = [v2 objectForKey:@"cloudKitMaxNumAlarmIDsInReminderCKRecordDebugOverride"];

  return (NSNumber *)v3;
}

- (void)setCloudKitMaxNumAlarmIDsInReminderCKRecordDebugOverride:(id)a3
{
  id v4 = a3;
  id v5 = [(REMUserDefaults *)self userDefaults];
  [v5 setObject:v4 forKey:@"cloudKitMaxNumAlarmIDsInReminderCKRecordDebugOverride"];
}

- (NSNumber)debugSimulatedCKErrorCode
{
  id v2 = [(REMUserDefaults *)self userDefaults];
  BOOL v3 = [v2 objectForKey:@"debugSimulatedCKErrorCode"];

  return (NSNumber *)v3;
}

- (void)setDebugSimulatedCKErrorCode:(id)a3
{
  id v4 = a3;
  id v5 = [(REMUserDefaults *)self userDefaults];
  [v5 setObject:v4 forKey:@"debugSimulatedCKErrorCode"];
}

- (NSNumber)spotlightIndexVersion
{
  id v2 = [(REMUserDefaults *)self userDefaults];
  BOOL v3 = [v2 objectForKey:@"spotlightIndexVersion"];

  return (NSNumber *)v3;
}

- (void)setSpotlightIndexVersion:(id)a3
{
  id v4 = a3;
  id v5 = [(REMUserDefaults *)self userDefaults];
  [v5 setObject:v4 forKey:@"spotlightIndexVersion"];
}

- (NSDate)nextScheduledAlarmDate
{
  id v2 = [(REMUserDefaults *)self userDefaults];
  BOOL v3 = [v2 objectForKey:@"nextScheduledAlarmDate"];

  return (NSDate *)v3;
}

- (void)setNextScheduledAlarmDate:(id)a3
{
  id v4 = a3;
  id v5 = [(REMUserDefaults *)self userDefaults];
  [v5 setObject:v4 forKey:@"nextScheduledAlarmDate"];
}

- (NSDate)lastPresentAlarmDate
{
  id v2 = [(REMUserDefaults *)self userDefaults];
  BOOL v3 = [v2 objectForKey:@"lastPresentAlarmDate"];

  return (NSDate *)v3;
}

- (void)setLastPresentAlarmDate:(id)a3
{
  id v4 = a3;
  id v5 = [(REMUserDefaults *)self userDefaults];
  [v5 setObject:v4 forKey:@"lastPresentAlarmDate"];
}

- (NSData)lastSuggestedAttributesAutoTrainingToken
{
  id v2 = [(REMUserDefaults *)self userDefaults];
  BOOL v3 = [v2 objectForKey:@"lastSuggestedAttributesAutoTrainingToken"];

  return (NSData *)v3;
}

- (void)setLastSuggestedAttributesAutoTrainingToken:(id)a3
{
  id v4 = a3;
  id v5 = [(REMUserDefaults *)self userDefaults];
  [v5 setObject:v4 forKey:@"lastSuggestedAttributesAutoTrainingToken"];
}

- (NSDate)lastSuggestedAttributesAutoTrainingExecutionDate
{
  id v2 = [(REMUserDefaults *)self userDefaults];
  BOOL v3 = [v2 objectForKey:@"lastSuggestedAttributesAutoTrainingExecutionDate"];

  return (NSDate *)v3;
}

- (void)setLastSuggestedAttributesAutoTrainingExecutionDate:(id)a3
{
  id v4 = a3;
  id v5 = [(REMUserDefaults *)self userDefaults];
  [v5 setObject:v4 forKey:@"lastSuggestedAttributesAutoTrainingExecutionDate"];
}

- (void)setSuggestedAttributesHarvestingOverrides:(id)a3
{
  id v4 = a3;
  id v5 = [(REMUserDefaults *)self userDefaults];
  [v5 setObject:v4 forKey:@"suggestedAttributesHarvestingOverrides"];
}

- (void)setMuteNotificationForSharedList:(id)a3
{
  id v4 = a3;
  id v5 = [(REMUserDefaults *)self userDefaults];
  [v5 setObject:v4 forKey:@"muteNotificationForSharedList"];

  v6 = +[REMLog utility];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v10 = 0;
    _os_log_impl(&dword_1B9AA2000, v6, OS_LOG_TYPE_DEFAULT, "Trigger NPS sync for muteNotificationForSharedList to paired device.", v10, 2u);
  }

  v7 = objc_opt_new();
  v8 = [(REMUserDefaults *)self suiteName];
  id v9 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F136C188];
  [v7 synchronizeUserDefaultsDomain:v8 keys:v9];
}

- (unint64_t)muteNotificationOptionsForSharedList:(id)a3
{
  id v4 = a3;
  id v5 = [(REMDaemonUserDefaults *)self muteNotificationForSharedList];
  v6 = [v5 objectForKeyedSubscript:v4];

  if (v6) {
    unint64_t v7 = [v6 integerValue];
  }
  else {
    unint64_t v7 = 2;
  }

  return v7;
}

- (void)setMuteNotificationOptions:(unint64_t)a3 forSharedList:(id)a4
{
  id v6 = a4;
  unint64_t v7 = [(REMDaemonUserDefaults *)self muteNotificationForSharedList];
  id v9 = (id)[v7 mutableCopy];

  v8 = [NSNumber numberWithInteger:a3];
  if (v9)
  {
    [v9 setObject:v8 forKeyedSubscript:v6];
  }
  else
  {
    id v9 = [MEMORY[0x1E4F1CA60] dictionaryWithObject:v8 forKey:v6];
  }

  [(REMDaemonUserDefaults *)self setMuteNotificationForSharedList:v9];
}

- (void)removeMuteNotificationOptionsForSharedList:(id)a3
{
  id v7 = a3;
  id v4 = [(REMDaemonUserDefaults *)self muteNotificationForSharedList];
  id v5 = (void *)[v4 mutableCopy];

  id v6 = [v5 objectForKeyedSubscript:v7];

  if (v6)
  {
    [v5 removeObjectForKey:v7];
    [(REMDaemonUserDefaults *)self setMuteNotificationForSharedList:v5];
  }
}

- (void)setHideEmptySectionsForGroceryList:(id)a3
{
  id v4 = a3;
  id v5 = [(REMUserDefaults *)self userDefaults];
  [v5 setObject:v4 forKey:@"hideEmptySectionsForGroceryList"];

  id v6 = +[REMLog utility];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v10 = 0;
    _os_log_impl(&dword_1B9AA2000, v6, OS_LOG_TYPE_DEFAULT, "Trigger NPS sync for hideEmptySectionsForGroceryList to paired device.", v10, 2u);
  }

  id v7 = objc_opt_new();
  v8 = [(REMUserDefaults *)self suiteName];
  id v9 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F136C1A0];
  [v7 synchronizeUserDefaultsDomain:v8 keys:v9];
}

- (void)setHideEmptySections:(BOOL)a3 forGroceryList:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [(REMDaemonUserDefaults *)self hideEmptySectionsForGroceryList];
  id v9 = (id)[v7 mutableCopy];

  v8 = [NSNumber numberWithBool:v4];
  if (v9)
  {
    [v9 setObject:v8 forKeyedSubscript:v6];
  }
  else
  {
    id v9 = [MEMORY[0x1E4F1CA60] dictionaryWithObject:v8 forKey:v6];
  }

  [(REMDaemonUserDefaults *)self setHideEmptySectionsForGroceryList:v9];
}

- (BOOL)hideEmptySectionsForGroceryList:(id)a3
{
  id v4 = a3;
  id v5 = [(REMDaemonUserDefaults *)self hideEmptySectionsForGroceryList];
  id v6 = [v5 objectForKeyedSubscript:v4];

  if (v6) {
    char v7 = [v6 BOOLValue];
  }
  else {
    char v7 = 1;
  }

  return v7;
}

- (void)removeHideEmptySectionsForGroceryList:(id)a3
{
  id v7 = a3;
  id v4 = [(REMDaemonUserDefaults *)self hideEmptySectionsForGroceryList];
  id v5 = (void *)[v4 mutableCopy];

  id v6 = [v5 objectForKeyedSubscript:v7];

  if (v6)
  {
    [v5 removeObjectForKey:v7];
    [(REMDaemonUserDefaults *)self setHideEmptySectionsForGroceryList:v5];
  }
}

- (void)setBestKForKNN:(id)a3
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(REMUserDefaults *)self userDefaults];
  id v6 = [v5 objectForKey:@"suggestedAttributesHarvestingOverrides"];

  id v7 = [(REMUserDefaults *)self userDefaults];
  v8 = v7;
  if (v6)
  {
    id v9 = [v7 dictionaryForKey:@"suggestedAttributesHarvestingOverrides"];
    objc_super v10 = (void *)[v9 mutableCopy];

    v11 = [v10 objectForKeyedSubscript:@"embedding"];

    if (v11)
    {
      v12 = [v10 objectForKey:@"embedding"];
      v13 = (void *)[v12 mutableCopy];

      [v13 setObject:v4 forKeyedSubscript:@"neighborsToConsider"];
      [v10 setObject:v13 forKeyedSubscript:@"embedding"];
      v14 = [(REMUserDefaults *)self userDefaults];
      [v14 setObject:v10 forKey:@"suggestedAttributesHarvestingOverrides"];
    }
    else
    {
      v19 = @"neighborsToConsider";
      id v20 = v4;
      v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v20 forKeys:&v19 count:1];
      [v10 setObject:v17 forKey:@"embedding"];

      v18 = [(REMUserDefaults *)self userDefaults];
      [v18 setObject:v10 forKey:@"suggestedAttributesHarvestingOverrides"];
    }
    v8 = v10;
  }
  else
  {
    id v22 = v4;
    v23 = @"embedding";
    v21 = @"neighborsToConsider";
    v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v22 forKeys:&v21 count:1];
    v24[0] = v15;
    v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];
    [v8 setObject:v16 forKey:@"suggestedAttributesHarvestingOverrides"];
  }
}

- (void)setSuggestedAttributesTrainingOverrides:(id)a3
{
  id v4 = a3;
  id v5 = [(REMUserDefaults *)self userDefaults];
  [v5 setObject:v4 forKey:@"suggestedAttributesTrainingOverrides"];
}

- (void)setCoreBehaviorTrainingParameters:(id)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(REMUserDefaults *)self userDefaults];
  id v6 = [v5 objectForKey:@"suggestedAttributesTrainingOverrides"];

  id v7 = [(REMUserDefaults *)self userDefaults];
  v8 = v7;
  if (v6)
  {
    id v9 = [v7 dictionaryForKey:@"suggestedAttributesTrainingOverrides"];
    id v12 = (id)[v9 mutableCopy];

    [v12 setObject:v4 forKey:@"corebehavior"];
    objc_super v10 = [(REMUserDefaults *)self userDefaults];
    [v10 setObject:v12 forKey:@"suggestedAttributesTrainingOverrides"];
  }
  else
  {
    v13 = @"corebehavior";
    v14[0] = v4;
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];

    [v8 setObject:v11 forKey:@"suggestedAttributesTrainingOverrides"];
  }
}

- (NSDate)lastSyncPoll
{
  id v2 = [(REMUserDefaults *)self userDefaults];
  BOOL v3 = [v2 objectForKey:@"lastSyncPoll"];

  return (NSDate *)v3;
}

- (void)setLastSyncPoll:(id)a3
{
  id v4 = a3;
  id v5 = [(REMUserDefaults *)self userDefaults];
  [v5 setObject:v4 forKey:@"lastSyncPoll"];
}

- (NSDate)lastCloudConfigurationDownload
{
  id v2 = [(REMUserDefaults *)self userDefaults];
  BOOL v3 = [v2 objectForKey:@"lastCloudConfigurationDownload"];

  return (NSDate *)v3;
}

- (void)setLastCloudConfigurationDownload:(id)a3
{
  id v4 = a3;
  id v5 = [(REMUserDefaults *)self userDefaults];
  [v5 setObject:v4 forKey:@"lastCloudConfigurationDownload"];
}

- (NSDate)staledFileAttachmentCleanupLastExecutionDate
{
  id v2 = [(REMUserDefaults *)self userDefaults];
  BOOL v3 = [v2 objectForKey:@"staledFileAttachmentCleanupLastExecutionDate"];

  return (NSDate *)v3;
}

- (void)setStaledFileAttachmentCleanupLastExecutionDate:(id)a3
{
  id v4 = a3;
  id v5 = [(REMUserDefaults *)self userDefaults];
  [v5 setObject:v4 forKey:@"staledFileAttachmentCleanupLastExecutionDate"];
}

- (BOOL)staledFileAttachmentCleanupContainerDeemedClean
{
  id v2 = [(REMUserDefaults *)self userDefaults];
  char v3 = [v2 BOOLForKey:@"staledFileAttachmentCleanupContainerDeemedClean"];

  return v3;
}

- (void)setStaledFileAttachmentCleanupContainerDeemedClean:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(REMUserDefaults *)self userDefaults];
  [v4 setBool:v3 forKey:@"staledFileAttachmentCleanupContainerDeemedClean"];
}

- (BOOL)extraneousAlarmsCollectorContainerDeemedClean
{
  id v2 = [(REMUserDefaults *)self userDefaults];
  char v3 = [v2 BOOLForKey:@"extraneousAlarmsCollectorContainerDeemedClean"];

  return v3;
}

- (void)setExtraneousAlarmsCollectorContainerDeemedClean:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(REMUserDefaults *)self userDefaults];
  [v4 setBool:v3 forKey:@"extraneousAlarmsCollectorContainerDeemedClean"];
}

- (NSDate)lastExtraneousAlarmsCollectorExecutionDate
{
  id v2 = [(REMUserDefaults *)self userDefaults];
  BOOL v3 = [v2 objectForKey:@"lastExtraneousAlarmsCollectorExecutionDate"];

  return (NSDate *)v3;
}

- (void)setLastExtraneousAlarmsCollectorExecutionDate:(id)a3
{
  id v4 = a3;
  id v5 = [(REMUserDefaults *)self userDefaults];
  [v5 setObject:v4 forKey:@"lastExtraneousAlarmsCollectorExecutionDate"];
}

- (NSDate)imageDeduplicationLastExecutionDate
{
  id v2 = [(REMUserDefaults *)self userDefaults];
  BOOL v3 = [v2 objectForKey:@"imageDeduplicationLastExecutionDate"];

  return (NSDate *)v3;
}

- (void)setImageDeduplicationLastExecutionDate:(id)a3
{
  id v4 = a3;
  id v5 = [(REMUserDefaults *)self userDefaults];
  [v5 setObject:v4 forKey:@"imageDeduplicationLastExecutionDate"];
}

- (NSDate)suggestConversionToGroceryListLastExecutionDate
{
  id v2 = [(REMUserDefaults *)self userDefaults];
  BOOL v3 = [v2 objectForKey:@"suggestConversionToGroceryListLastExecutionDate"];

  return (NSDate *)v3;
}

- (void)setSuggestConversionToGroceryListLastExecutionDate:(id)a3
{
  id v4 = a3;
  id v5 = [(REMUserDefaults *)self userDefaults];
  [v5 setObject:v4 forKey:@"suggestConversionToGroceryListLastExecutionDate"];
}

- (NSDate)analyticsActivityLastExecutionDate
{
  id v2 = [(REMUserDefaults *)self userDefaults];
  BOOL v3 = [v2 objectForKey:@"analyticsActivityLastExecutionDate"];

  return (NSDate *)v3;
}

- (void)setAnalyticsActivityLastExecutionDate:(id)a3
{
  id v4 = a3;
  id v5 = [(REMUserDefaults *)self userDefaults];
  [v5 setObject:v4 forKey:@"analyticsActivityLastExecutionDate"];
}

- (NSArray)imageDeduplicationLegacyAttachmentsMarkedForDeletion
{
  id v2 = [(REMUserDefaults *)self userDefaults];
  BOOL v3 = [v2 objectForKey:@"imageDeduplicationLegacyAttachmentsMarkedForDeletion"];

  return (NSArray *)v3;
}

- (void)setImageDeduplicationLegacyAttachmentsMarkedForDeletion:(id)a3
{
  id v4 = a3;
  id v5 = [(REMUserDefaults *)self userDefaults];
  [v5 setObject:v4 forKey:@"imageDeduplicationLegacyAttachmentsMarkedForDeletion"];
}

- (NSDate)savedImageDeduplicationLastExecutionDate
{
  id v2 = [(REMUserDefaults *)self userDefaults];
  BOOL v3 = [v2 objectForKey:@"savedImageDeduplicationLastExecutionDate"];

  return (NSDate *)v3;
}

- (void)setSavedImageDeduplicationLastExecutionDate:(id)a3
{
  id v4 = a3;
  id v5 = [(REMUserDefaults *)self userDefaults];
  [v5 setObject:v4 forKey:@"savedImageDeduplicationLastExecutionDate"];
}

- (NSArray)savedImageDeduplicationLegacyAttachmentsMarkedForDeletion
{
  id v2 = [(REMUserDefaults *)self userDefaults];
  BOOL v3 = [v2 objectForKey:@"savedImageDeduplicationLegacyAttachmentsMarkedForDeletion"];

  return (NSArray *)v3;
}

- (void)setSavedImageDeduplicationLegacyAttachmentsMarkedForDeletion:(id)a3
{
  id v4 = a3;
  id v5 = [(REMUserDefaults *)self userDefaults];
  [v5 setObject:v4 forKey:@"savedImageDeduplicationLegacyAttachmentsMarkedForDeletion"];
}

- (NSData)userInteractionsData
{
  id v2 = [(REMUserDefaults *)self userDefaults];
  BOOL v3 = [v2 objectForKey:@"userInteractionsData"];

  return (NSData *)v3;
}

- (void)setUserInteractionsData:(id)a3
{
  id v4 = a3;
  id v5 = [(REMUserDefaults *)self userDefaults];
  [v5 setObject:v4 forKey:@"userInteractionsData"];
}

- (BOOL)simulateMAIDAccount
{
  id v2 = [(REMUserDefaults *)self userDefaults];
  char v3 = [v2 BOOLForKey:@"simulateMAIDAccount"];

  return v3;
}

- (void)setSimulateMAIDAccount:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(REMUserDefaults *)self userDefaults];
  [v4 setBool:v3 forKey:@"simulateMAIDAccount"];
}

- (void)setShowRemindersAsOverdue:(BOOL)a3
{
  BOOL v3 = a3;
  -[REMUserDefaults setShowRemindersAsOverdue_cached:](self, "setShowRemindersAsOverdue_cached:");
  id v5 = [(REMUserDefaults *)self userDefaults];
  [v5 setBool:v3 forKey:@"showRemindersAsOverdue"];
}

- (BOOL)showRemindersAsOverdueWithShouldBypassCache:(BOOL)a3
{
  id v5 = [(REMUserDefaults *)self userDefaults];
  char v6 = [v5 BOOLForKey:@"showRemindersAsOverdue"];

  if (a3) {
    return v6;
  }

  return [(REMUserDefaults *)self showRemindersAsOverdue_cached];
}

- (id)observeShowRemindersAsOverdueWithBlock:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __64__REMDaemonUserDefaults_observeShowRemindersAsOverdueWithBlock___block_invoke;
  v8[3] = &unk_1E61DD990;
  v8[4] = self;
  id v9 = v4;
  id v5 = v4;
  char v6 = [(REMUserDefaults *)self _startObservingValuesForKey:@"showRemindersAsOverdue" block:v8];

  return v6;
}

uint64_t __64__REMDaemonUserDefaults_observeShowRemindersAsOverdueWithBlock___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) userDefaults];
  uint64_t v3 = [v2 BOOLForKey:@"showRemindersAsOverdue"];

  objc_msgSend(*(id *)(a1 + 32), "setShowRemindersAsOverdue_cached:", v3);
  id v4 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v4();
}

- (BOOL)enableWelcomeScreen
{
  id v2 = [(REMUserDefaults *)self userDefaults];
  uint64_t v3 = [v2 objectForKey:@"enableWelcomeScreen"];

  if (v3) {
    char v4 = [v3 BOOLValue];
  }
  else {
    char v4 = 1;
  }

  return v4;
}

- (void)setEnableWelcomeScreen:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(REMUserDefaults *)self userDefaults];
  [v4 setBool:v3 forKey:@"enableWelcomeScreen"];
}

- (BOOL)forceShowWelcomeScreen
{
  id v2 = [(REMUserDefaults *)self userDefaults];
  char v3 = [v2 BOOLForKey:@"forceShowWelcomeScreen"];

  return v3;
}

- (void)setForceShowWelcomeScreen:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(REMUserDefaults *)self userDefaults];
  [v4 setBool:v3 forKey:@"forceShowWelcomeScreen"];
}

- (BOOL)forceShowWhatsNewScreen
{
  id v2 = [(REMUserDefaults *)self userDefaults];
  char v3 = [v2 BOOLForKey:@"forceShowWhatsNewScreen"];

  return v3;
}

- (void)setForceShowWhatsNewScreen:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(REMUserDefaults *)self userDefaults];
  [v4 setBool:v3 forKey:@"forceShowWhatsNewScreen"];
}

- (BOOL)enableInAppDebugMenu
{
  id v2 = [(REMUserDefaults *)self userDefaults];
  char v3 = [v2 BOOLForKey:@"enableInAppDebugMenu"];

  return v3;
}

- (void)setEnableInAppDebugMenu:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(REMUserDefaults *)self userDefaults];
  [v4 setBool:v3 forKey:@"enableInAppDebugMenu"];
}

- (BOOL)enableAutoGenerateCKPersonIDSalt
{
  return 1;
}

- (BOOL)enableHashingUserIdentifiablesWithPersonIDSalt
{
  id v2 = [(REMUserDefaults *)self userDefaults];
  BOOL v3 = [v2 objectForKey:@"enableHashingUserIdentifiablesWithPersonIDSalt"];

  if (v3) {
    char v4 = [v3 BOOLValue];
  }
  else {
    char v4 = 1;
  }

  return v4;
}

- (void)setEnableHashingUserIdentifiablesWithPersonIDSalt:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(REMUserDefaults *)self userDefaults];
  [v4 setBool:v3 forKey:@"enableHashingUserIdentifiablesWithPersonIDSalt"];
}

+ (id)todayNotificationFireTimeFromStorageNumber:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 integerValue];
  if (v4 == -1)
  {
    id v5 = 0;
  }
  else
  {
    if (v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
      objc_msgSend(v5, "setHour:", objc_msgSend(v3, "integerValue") / 100);
      uint64_t v7 = [v3 integerValue] % 100;
      char v6 = v5;
    }
    else
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
      [v5 setHour:9];
      char v6 = v5;
      uint64_t v7 = 0;
    }
    [v6 setMinute:v7];
  }

  return v5;
}

+ (id)storageNumberForTodayNotificationTime:(id)a3
{
  if (a3)
  {
    uint64_t v4 = NSNumber;
    id v5 = a3;
    uint64_t v6 = [v5 hour];
    uint64_t v7 = [v5 minute];

    v8 = [v4 numberWithInteger:v7 + 100 * v6];
  }
  else
  {
    v8 = &unk_1F136C2D8;
  }
  return v8;
}

- (NSDateComponents)todayNotificationFireTime
{
  id v2 = [(REMUserDefaults *)self userDefaults];
  uint64_t v3 = [v2 objectForKey:@"todayNotificationFireTime"];

  uint64_t v4 = objc_opt_class();
  id v5 = REMCheckedDynamicCast(v4, (uint64_t)v3);
  uint64_t v6 = [(id)objc_opt_class() todayNotificationFireTimeFromStorageNumber:v5];

  return (NSDateComponents *)v6;
}

- (void)setTodayNotificationFireTime:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() storageNumberForTodayNotificationTime:v4];

  uint64_t v6 = [(REMUserDefaults *)self userDefaults];
  [v6 setObject:v5 forKey:@"todayNotificationFireTime"];

  uint64_t v7 = +[REMLog utility];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_1B9AA2000, v7, OS_LOG_TYPE_DEFAULT, "Trigger NPS sync for todayNotificationFireTime to paired device.", v11, 2u);
  }

  v8 = objc_opt_new();
  id v9 = [(REMUserDefaults *)self suiteName];
  objc_super v10 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F136C1B8];
  [v8 synchronizeUserDefaultsDomain:v9 keys:v10];
}

- (id)streamTodayNotificationFireTime:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __57__REMDaemonUserDefaults_streamTodayNotificationFireTime___block_invoke;
  v8[3] = &unk_1E61DC5B0;
  v8[4] = self;
  id v9 = v4;
  id v5 = v4;
  uint64_t v6 = [(REMUserDefaults *)self _startStreamingValuesForKey:@"todayNotificationFireTime" block:v8];

  return v6;
}

void __57__REMDaemonUserDefaults_streamTodayNotificationFireTime___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) todayNotificationFireTime];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (id)observeTodayNotificationFireTimeWithBlock:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __67__REMDaemonUserDefaults_observeTodayNotificationFireTimeWithBlock___block_invoke;
  v8[3] = &unk_1E61DC5B0;
  v8[4] = self;
  id v9 = v4;
  id v5 = v4;
  uint64_t v6 = [(REMUserDefaults *)self _startObservingValuesForKey:@"todayNotificationFireTime" block:v8];

  return v6;
}

void __67__REMDaemonUserDefaults_observeTodayNotificationFireTimeWithBlock___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) todayNotificationFireTime];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (BOOL)disableAlarmEngineDataSourcePrefetching
{
  id v2 = [(REMUserDefaults *)self userDefaults];
  char v3 = [v2 BOOLForKey:@"disableAlarmEngineDataSourcePrefetching"];

  return v3;
}

- (void)setDisableAlarmEngineDataSourcePrefetching:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(REMUserDefaults *)self userDefaults];
  [v4 setBool:v3 forKey:@"disableAlarmEngineDataSourcePrefetching"];
}

- (BOOL)enableAssignmentNotifications
{
  BOOL v3 = [(REMUserDefaults *)self userDefaults];
  id v4 = [v3 objectForKey:@"enableAssignmentNotifications"];

  if (!v4) {
    return 1;
  }
  id v5 = [(REMUserDefaults *)self userDefaults];
  char v6 = [v5 BOOLForKey:@"enableAssignmentNotifications"];

  return v6;
}

- (void)setEnableAssignmentNotifications:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(REMUserDefaults *)self userDefaults];
  [v4 setBool:v3 forKey:@"enableAssignmentNotifications"];
}

- (id)observeEnableAssignmentNotificationsWithBlock:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __71__REMDaemonUserDefaults_observeEnableAssignmentNotificationsWithBlock___block_invoke;
  v8[3] = &unk_1E61DC5B0;
  v8[4] = self;
  id v9 = v4;
  id v5 = v4;
  char v6 = [(REMUserDefaults *)self _startObservingValuesForKey:@"enableAssignmentNotifications" block:v8];

  return v6;
}

uint64_t __71__REMDaemonUserDefaults_observeEnableAssignmentNotificationsWithBlock___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v2 = [*(id *)(a1 + 32) enableAssignmentNotifications];
  BOOL v3 = *(uint64_t (**)(uint64_t, uint64_t))(v1 + 16);

  return v3(v1, v2);
}

- (BOOL)enableAutoCompleteReminders
{
  BOOL v3 = [(REMUserDefaults *)self userDefaults];
  id v4 = [v3 objectForKey:@"enableAutoCompleteReminders"];

  if (!v4) {
    return 1;
  }
  id v5 = [(REMUserDefaults *)self userDefaults];
  char v6 = [v5 BOOLForKey:@"enableAutoCompleteReminders"];

  return v6;
}

- (void)setEnableAutoCompleteReminders:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(REMUserDefaults *)self userDefaults];
  [v4 setBool:v3 forKey:@"enableAutoCompleteReminders"];
}

- (id)observeEnableAutoCompleteRemindersWithBlock:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __69__REMDaemonUserDefaults_observeEnableAutoCompleteRemindersWithBlock___block_invoke;
  v8[3] = &unk_1E61DC5B0;
  v8[4] = self;
  id v9 = v4;
  id v5 = v4;
  char v6 = [(REMUserDefaults *)self _startObservingValuesForKey:@"enableAutoCompleteReminders" block:v8];

  return v6;
}

uint64_t __69__REMDaemonUserDefaults_observeEnableAutoCompleteRemindersWithBlock___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v2 = [*(id *)(a1 + 32) enableAutoCompleteReminders];
  BOOL v3 = *(uint64_t (**)(uint64_t, uint64_t))(v1 + 16);

  return v3(v1, v2);
}

- (NSDictionary)suggestedAttributesTrainingOverrides
{
  uint64_t v2 = [(REMUserDefaults *)self userDefaults];
  BOOL v3 = [v2 objectForKey:@"suggestedAttributesTrainingOverrides"];

  return (NSDictionary *)v3;
}

- (NSDictionary)suggestedAttributesHarvestingOverrides
{
  uint64_t v2 = [(REMUserDefaults *)self userDefaults];
  BOOL v3 = [v2 objectForKey:@"suggestedAttributesHarvestingOverrides"];

  return (NSDictionary *)v3;
}

- (NSDictionary)muteNotificationForSharedList
{
  uint64_t v2 = [(REMUserDefaults *)self userDefaults];
  BOOL v3 = [v2 objectForKey:@"muteNotificationForSharedList"];

  return (NSDictionary *)v3;
}

- (NSDictionary)hideEmptySectionsForGroceryList
{
  uint64_t v2 = [(REMUserDefaults *)self userDefaults];
  BOOL v3 = [v2 objectForKey:@"hideEmptySectionsForGroceryList"];

  return (NSDictionary *)v3;
}

- (void)setAccountsListCategorizedCountsCache:(id)a3
{
  id v4 = a3;
  id v5 = [(REMUserDefaults *)self userDefaults];
  [v5 setObject:v4 forKey:@"accountsListCategorizedCountsCache"];
}

- (void)setHashtagLabelsInCustomSmartListFilterCache:(id)a3
{
  id v4 = a3;
  id v5 = [(REMUserDefaults *)self userDefaults];
  [v5 setObject:v4 forKey:@"hashtagLabelsInCustomSmartListFilterCache"];
}

- (BOOL)debugSimulateSqliteFull
{
  uint64_t v2 = [(REMUserDefaults *)self userDefaults];
  char v3 = [v2 BOOLForKey:@"debugSimulateSqliteFull"];

  return v3;
}

- (void)setDebugSimulateSqliteFull:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(REMUserDefaults *)self userDefaults];
  [v4 setBool:v3 forKey:@"debugSimulateSqliteFull"];
}

- (NSNumber)tipKitCachedCountOfUncompletedReminders
{
  uint64_t v2 = [(REMUserDefaults *)self userDefaults];
  BOOL v3 = [v2 objectForKey:@"tipKitCachedCountOfUncompletedReminders"];

  return (NSNumber *)v3;
}

- (void)setTipKitCachedCountOfUncompletedReminders:(id)a3
{
  id v4 = a3;
  id v5 = [(REMUserDefaults *)self userDefaults];
  [v5 setObject:v4 forKey:@"tipKitCachedCountOfUncompletedReminders"];
}

- (NSNumber)tipKitCachedCountOfLists
{
  uint64_t v2 = [(REMUserDefaults *)self userDefaults];
  BOOL v3 = [v2 objectForKey:@"tipKitCachedCountOfLists"];

  return (NSNumber *)v3;
}

- (void)setTipKitCachedCountOfLists:(id)a3
{
  id v4 = a3;
  id v5 = [(REMUserDefaults *)self userDefaults];
  [v5 setObject:v4 forKey:@"tipKitCachedCountOfLists"];
}

- (NSNumber)tipKitCachedCountOfListsWithCustomBadge
{
  uint64_t v2 = [(REMUserDefaults *)self userDefaults];
  BOOL v3 = [v2 objectForKey:@"tipKitCachedCountOfListsWithCustomBadge"];

  return (NSNumber *)v3;
}

- (void)setTipKitCachedCountOfListsWithCustomBadge:(id)a3
{
  id v4 = a3;
  id v5 = [(REMUserDefaults *)self userDefaults];
  [v5 setObject:v4 forKey:@"tipKitCachedCountOfListsWithCustomBadge"];
}

- (NSNumber)tipKitCachedCountOfCustomSmartLists
{
  uint64_t v2 = [(REMUserDefaults *)self userDefaults];
  BOOL v3 = [v2 objectForKey:@"tipKitCachedCountOfCustomSmartLists"];

  return (NSNumber *)v3;
}

- (void)setTipKitCachedCountOfCustomSmartLists:(id)a3
{
  id v4 = a3;
  id v5 = [(REMUserDefaults *)self userDefaults];
  [v5 setObject:v4 forKey:@"tipKitCachedCountOfCustomSmartLists"];
}

- (NSNumber)tipKitCachedCountOfHashtags
{
  uint64_t v2 = [(REMUserDefaults *)self userDefaults];
  BOOL v3 = [v2 objectForKey:@"tipKitCachedCountOfHashtags"];

  return (NSNumber *)v3;
}

- (void)setTipKitCachedCountOfHashtags:(id)a3
{
  id v4 = a3;
  id v5 = [(REMUserDefaults *)self userDefaults];
  [v5 setObject:v4 forKey:@"tipKitCachedCountOfHashtags"];
}

- (NSDate)lastViewedNotificationsPermissionWarmingSheetDate
{
  uint64_t v2 = [(REMUserDefaults *)self userDefaults];
  BOOL v3 = [v2 objectForKey:@"lastViewedNotificationsPermissionWarmingSheetDate"];

  return (NSDate *)v3;
}

- (void)setLastViewedNotificationsPermissionWarmingSheetDate:(id)a3
{
  id v4 = a3;
  id v5 = [(REMUserDefaults *)self userDefaults];
  [v5 setObject:v4 forKey:@"lastViewedNotificationsPermissionWarmingSheetDate"];
}

- (void)setLastDismissedNotificationsPermissionInlineRequestDate:(id)a3
{
  id v4 = a3;
  id v5 = [(REMUserDefaults *)self userDefaults];
  [v5 setObject:v4 forKey:@"lastDismissedNotificationsPermissionInlineRequestDate"];
}

- (BOOL)hasViewedContactsAccessAlertForLocation
{
  uint64_t v2 = [(REMUserDefaults *)self userDefaults];
  char v3 = [v2 BOOLForKey:@"hasViewedContactsAccessAlertForLocation"];

  return v3;
}

- (void)setGroceryTipDismissed:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(REMUserDefaults *)self userDefaults];
  [v4 setBool:v3 forKey:@"groceryTipDismissed"];
}

- (BOOL)groceryTipDismissed
{
  uint64_t v2 = [(REMUserDefaults *)self userDefaults];
  char v3 = [v2 BOOLForKey:@"groceryTipDismissed"];

  return v3;
}

- (void)setHasCreatedGroceryList:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(REMUserDefaults *)self userDefaults];
  [v4 setBool:v3 forKey:@"hasCreatedGroceryList"];
}

- (BOOL)hasCreatedGroceryList
{
  uint64_t v2 = [(REMUserDefaults *)self userDefaults];
  char v3 = [v2 BOOLForKey:@"hasCreatedGroceryList"];

  return v3;
}

- (void)setHasViewedContactsAccessAlertForLocation:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(REMUserDefaults *)self userDefaults];
  [v4 setBool:v3 forKey:@"hasViewedContactsAccessAlertForLocation"];
}

- (BOOL)hasViewedContactsAccessAlertForMessaging
{
  uint64_t v2 = [(REMUserDefaults *)self userDefaults];
  char v3 = [v2 BOOLForKey:@"hasViewedContactsAccessAlertForMessaging"];

  return v3;
}

- (void)setHasViewedContactsAccessAlertForMessaging:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(REMUserDefaults *)self userDefaults];
  [v4 setBool:v3 forKey:@"hasViewedContactsAccessAlertForMessaging"];
}

- (BOOL)hasViewedContactsAccessAlertForCalDAVSharing
{
  uint64_t v2 = [(REMUserDefaults *)self userDefaults];
  char v3 = [v2 BOOLForKey:@"hasViewedContactsAccessAlertForCalDAVSharing"];

  return v3;
}

- (void)setHasViewedContactsAccessAlertForCalDAVSharing:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(REMUserDefaults *)self userDefaults];
  [v4 setBool:v3 forKey:@"hasViewedContactsAccessAlertForCalDAVSharing"];
}

- (BOOL)didShowReminderDeletePrivacyWarning
{
  uint64_t v2 = [(REMUserDefaults *)self userDefaults];
  char v3 = [v2 BOOLForKey:@"didShowReminderDeletePrivacyWarning"];

  return v3;
}

- (void)setDidShowReminderDeletePrivacyWarning:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(REMUserDefaults *)self userDefaults];
  [v4 setBool:v3 forKey:@"didShowReminderDeletePrivacyWarning"];
}

- (BOOL)hasSeenGroceryFeedbackSurvey
{
  uint64_t v2 = [(REMUserDefaults *)self userDefaults];
  char v3 = [v2 BOOLForKey:@"hasSeenGroceryFeedbackSurvey"];

  return v3;
}

- (void)setHasSeenGroceryFeedbackSurvey:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(REMUserDefaults *)self userDefaults];
  [v4 setBool:v3 forKey:@"hasSeenGroceryFeedbackSurvey"];
}

- (BOOL)enableGroceryFeedbackSurvey
{
  uint64_t v2 = [(REMUserDefaults *)self userDefaults];
  char v3 = [v2 BOOLForKey:@"enableGroceryFeedbackSurvey"];

  return v3;
}

- (void)setEnableGroceryFeedbackSurvey:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(REMUserDefaults *)self userDefaults];
  [v4 setBool:v3 forKey:@"enableGroceryFeedbackSurvey"];
}

- (void)setRemCurrentRuntimeVersionDebuggingOverride:(id)a3
{
  id v4 = a3;
  id v5 = [(REMUserDefaults *)self userDefaults];
  [v5 setObject:v4 forKey:@"remCurrentRuntimeVersionDebuggingOverride"];
}

- (BOOL)forceEligibleForAutoCloudKitMigration
{
  uint64_t v2 = [(REMUserDefaults *)self userDefaults];
  char v3 = [v2 BOOLForKey:@"forceEligibleForAutoCloudKitMigration"];

  return v3;
}

- (void)setForceEligibleForAutoCloudKitMigration:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(REMUserDefaults *)self userDefaults];
  [v4 setBool:v3 forKey:@"forceEligibleForAutoCloudKitMigration"];
}

- (BOOL)forceBasicAAAccountEligibleForCloudKitReminders
{
  uint64_t v2 = [(REMUserDefaults *)self userDefaults];
  char v3 = [v2 BOOLForKey:@"forceBasicAAAccountEligibleForCloudKitReminders"];

  return v3;
}

- (void)setForceBasicAAAccountEligibleForCloudKitReminders:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(REMUserDefaults *)self userDefaults];
  [v4 setBool:v3 forKey:@"forceBasicAAAccountEligibleForCloudKitReminders"];
}

- (NSDictionary)dataSeparationAppDocumentsURLDebugOverride
{
  uint64_t v2 = [(REMUserDefaults *)self userDefaults];
  BOOL v3 = [v2 objectForKey:@"dataSeparationAppDocumentsURLDebugOverride"];

  return (NSDictionary *)v3;
}

- (void)setDataSeparationAppDocumentsURLDebugOverride:(id)a3
{
  id v4 = a3;
  id v5 = [(REMUserDefaults *)self userDefaults];
  [v5 setObject:v4 forKey:@"dataSeparationAppDocumentsURLDebugOverride"];
}

- (NSDate)lastDataSeparationMigrationDate
{
  uint64_t v2 = [(REMUserDefaults *)self userDefaults];
  BOOL v3 = [v2 objectForKey:@"lastDataSeparationMigrationDate"];

  return (NSDate *)v3;
}

- (void)setLastDataSeparationMigrationDate:(id)a3
{
  id v4 = a3;
  id v5 = [(REMUserDefaults *)self userDefaults];
  [v5 setObject:v4 forKey:@"lastDataSeparationMigrationDate"];
}

- (NSDictionary)syncActivityNotificationEngine_accountSignInTime
{
  uint64_t v2 = [(REMUserDefaults *)self userDefaults];
  BOOL v3 = [v2 objectForKey:@"syncActivityNotificationEngine_accountSignInTime"];

  return (NSDictionary *)v3;
}

- (void)setSyncActivityNotificationEngine_accountSignInTime:(id)a3
{
  id v4 = a3;
  id v5 = [(REMUserDefaults *)self userDefaults];
  [v5 setObject:v4 forKey:@"syncActivityNotificationEngine_accountSignInTime"];
}

- (void)setSharedListActivityNotifications_demoMode:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(REMUserDefaults *)self userDefaults];
  [v4 setBool:v3 forKey:@"sharedListActivityNotifications_demoMode"];
}

- (BOOL)sharedListActivityNotifications_demoMode
{
  uint64_t v2 = [(REMUserDefaults *)self userDefaults];
  char v3 = [v2 BOOLForKey:@"sharedListActivityNotifications_demoMode"];

  return v3;
}

- (void)setShouldIncludeRemindersDueTodayInBadgeCount:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(REMUserDefaults *)self userDefaults];
  [v4 setBool:v3 forKey:@"shouldIncludeRemindersDueTodayInBadgeCount"];
}

- (BOOL)shouldIncludeRemindersDueTodayInBadgeCount
{
  BOOL v3 = [(REMUserDefaults *)self userDefaults];
  id v4 = [v3 objectForKey:@"shouldIncludeRemindersDueTodayInBadgeCount"];

  if (!v4) {
    return 0;
  }
  id v5 = [(REMUserDefaults *)self userDefaults];
  char v6 = [v5 BOOLForKey:@"shouldIncludeRemindersDueTodayInBadgeCount"];

  return v6;
}

- (id)streamShouldIncludeRemindersDueTodayInBadgeCount:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __74__REMDaemonUserDefaults_streamShouldIncludeRemindersDueTodayInBadgeCount___block_invoke;
  v8[3] = &unk_1E61DC5B0;
  v8[4] = self;
  id v9 = v4;
  id v5 = v4;
  char v6 = [(REMUserDefaults *)self _startStreamingValuesForKey:@"shouldIncludeRemindersDueTodayInBadgeCount" block:v8];

  return v6;
}

uint64_t __74__REMDaemonUserDefaults_streamShouldIncludeRemindersDueTodayInBadgeCount___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v2 = [*(id *)(a1 + 32) shouldIncludeRemindersDueTodayInBadgeCount];
  BOOL v3 = *(uint64_t (**)(uint64_t, uint64_t))(v1 + 16);

  return v3(v1, v2);
}

- (id)observeShouldIncludeRemindersDueTodayInBadgeCountWithBlock:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __84__REMDaemonUserDefaults_observeShouldIncludeRemindersDueTodayInBadgeCountWithBlock___block_invoke;
  v8[3] = &unk_1E61DC5B0;
  v8[4] = self;
  id v9 = v4;
  id v5 = v4;
  char v6 = [(REMUserDefaults *)self _startObservingValuesForKey:@"shouldIncludeRemindersDueTodayInBadgeCount" block:v8];

  return v6;
}

uint64_t __84__REMDaemonUserDefaults_observeShouldIncludeRemindersDueTodayInBadgeCountWithBlock___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v2 = [*(id *)(a1 + 32) shouldIncludeRemindersDueTodayInBadgeCount];
  BOOL v3 = *(uint64_t (**)(uint64_t, uint64_t))(v1 + 16);

  return v3(v1, v2);
}

- (BOOL)isSpotlightQueryLoggingEnabled
{
  uint64_t v2 = [(REMUserDefaults *)self userDefaults];
  char v3 = [v2 BOOLForKey:@"isSpotlightQueryLoggingEnabled"];

  return v3;
}

- (void)setIsSpotlightQueryLoggingEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(REMUserDefaults *)self userDefaults];
  [v4 setBool:v3 forKey:@"isSpotlightQueryLoggingEnabled"];
}

- (NSString)trialAssetsDirectoryDebugOverride
{
  uint64_t v2 = [(REMUserDefaults *)self userDefaults];
  BOOL v3 = [v2 stringForKey:@"trialAssetsDirectoryDebugOverride"];

  return (NSString *)v3;
}

- (void)setTrialAssetsDirectoryDebugOverride:(id)a3
{
  id v4 = a3;
  id v5 = [(REMUserDefaults *)self userDefaults];
  [v5 setObject:v4 forKey:@"trialAssetsDirectoryDebugOverride"];
}

- (NSDate)automaticSecondaryGroceryLocalesLastModifiedDate
{
  uint64_t v2 = [(REMUserDefaults *)self userDefaults];
  BOOL v3 = [v2 objectForKey:@"automaticSecondaryGroceryLocalesLastModifiedDate"];

  return (NSDate *)v3;
}

- (void)setAutomaticSecondaryGroceryLocalesLastModifiedDate:(id)a3
{
  id v4 = a3;
  id v5 = [(REMUserDefaults *)self userDefaults];
  [v5 setObject:v4 forKey:@"automaticSecondaryGroceryLocalesLastModifiedDate"];
}

- (NSArray)automaticSecondaryGroceryLocales
{
  uint64_t v2 = [(REMUserDefaults *)self userDefaults];
  BOOL v3 = [v2 objectForKey:@"automaticSecondaryGroceryLocales"];

  return (NSArray *)v3;
}

- (void)setAutomaticSecondaryGroceryLocales:(id)a3
{
  id v4 = a3;
  id v5 = [(REMUserDefaults *)self userDefaults];
  [v5 setObject:v4 forKey:@"automaticSecondaryGroceryLocales"];
}

- (id)_pptPreferredDefaultListIDKey
{
  return (id)[@"preferredDefaultListID" stringByAppendingString:@"_temp"];
}

- (void)ppt_handleInstall
{
  id v5 = [(REMDaemonUserDefaults *)self preferredDefaultListID];
  [(REMDaemonUserDefaults *)self deletePreferredDefaultListID];
  BOOL v3 = [(REMUserDefaults *)self userDefaults];
  id v4 = [(REMDaemonUserDefaults *)self _pptPreferredDefaultListIDKey];
  [v3 setObjectID:v5 forKey:v4];
}

- (void)ppt_handleRestore
{
  [(REMDaemonUserDefaults *)self deletePreferredDefaultListID];
  BOOL v3 = [(REMUserDefaults *)self userDefaults];
  id v4 = [(REMDaemonUserDefaults *)self _pptPreferredDefaultListIDKey];
  id v9 = [v3 objectForKey:v4];

  id v5 = [MEMORY[0x1E4F1CB10] URLWithString:v9];
  if (v5)
  {
    char v6 = +[REMObjectID objectIDWithURL:v5];
    [(REMDaemonUserDefaults *)self setPreferredDefaultListID:v6];
  }
  uint64_t v7 = [(REMUserDefaults *)self userDefaults];
  v8 = [(REMDaemonUserDefaults *)self _pptPreferredDefaultListIDKey];
  [v7 removeObjectForKey:v8];
}

- (NSDate)batchDeleteExpiredRemindersLastExecutionDate
{
  return self->_batchDeleteExpiredRemindersLastExecutionDate;
}

- (void)setBatchDeleteExpiredRemindersLastExecutionDate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end