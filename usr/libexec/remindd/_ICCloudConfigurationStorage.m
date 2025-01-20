@interface _ICCloudConfigurationStorage
- (ICCloudThrottlingPolicy)throttlingPolicy;
- (NSDictionary)minimumSearchTermLengthByBaseLanguage;
- (NSDictionary)suggestedAttributesHarvestingOverrides;
- (NSDictionary)suggestedAttributesTrainingOverrides;
- (NSNumber)batchDeleteExpiredRemindersRateReduceFactor;
- (NSNumber)extraneousAlarmsCleanUpTriggerReductionFactor;
- (NSNumber)imageDeduplicationRateReduceFactor;
- (NSNumber)languageHypothesisThresholdForAdditionalLanguages;
- (NSNumber)languageHypothesisThresholdForPrimaryLanguage;
- (NSNumber)maximumAttachmentSizeMB;
- (NSNumber)miniumumAutomaticLanguageConfidenceScoreAllowed;
- (NSNumber)postAnalyticsRateReduceFactor;
- (NSNumber)savedImageDeduplicationRateReduceFactor;
- (NSNumber)staledFileAttachmentCleanupRateReduceFactor;
- (NSNumber)suggestConversionToGroceryListRateReduceFactor;
- (NSString)manualSortHintLastAccessedUpdatePolicy;
- (NSString)minimumClientVersion;
- (double)accountChangedDebouncerInterval;
- (double)appStoreReviewTimeIntervalOfInterest;
- (double)appStoreReviewTimeIntervalSinceInitialForeground;
- (double)appStoreReviewTimeIntervalSinceLastFetch;
- (double)appStoreReviewTimeIntervalSinceLastPrompt;
- (double)apsDebouncerDefaultInterval;
- (double)apsDebouncerMigrationInProgressInterval;
- (double)apsDebouncerWatchDefaultInterval;
- (double)apsDebouncerWatchMigrationInProgressInterval;
- (double)batchDeleteExpiredRemindersDefaultThrottleInterval;
- (double)batchDeleteExpiredRemindersMinimumDeletionTimeInterval;
- (double)cloudConfigurationDownloadThrottleInterval;
- (double)cloudSchemaCatchUpSyncInitialRetryInterval;
- (double)extraneousAlarmsBackoffThrottleInterval;
- (double)extraneousAlarmsCollectorDebounceInterval;
- (double)extraneousAlarmsCollectorThrottleInterval;
- (double)extraneousAlarmsThrottleInterval;
- (double)housekeepingActivityMinimumDelay;
- (double)iCloudIsOffTimeIntervalSinceLastPrompt;
- (double)imageDeduplicationBackoffThrottleInterval;
- (double)imageDeduplicationDefaultThrottleInterval;
- (double)launchAndSignificantTimeChangePollThrottleInterval;
- (double)manualSortHintClientSideExpiration;
- (double)mergeLocalObjectsInitialRetryInterval;
- (double)mergeLocalObjectsRetryStartOverThrottleInterval;
- (double)persistedSubscriptionIDsValidityPeriod;
- (double)pollingInterval;
- (double)postAnalyticsDefaultThrottleInterval;
- (double)reachabilityChangeSyncThrottleInterval;
- (double)savedImageDeduplicationBackoffThrottleInterval;
- (double)savedImageDeduplicationDefaultThrottleInterval;
- (double)staledFileAttachmentCleanupBackoffThrottleInterval;
- (double)staledFileAttachmentCleanupDefaultThrottleInterval;
- (double)suggestConversionToGroceryListDefaultThrottleInterval;
- (double)suggestedAttributesAutoTrainingThrottleInterval;
- (double)tapToRadarThrottlingInterval;
- (double)templatePublicLinkOperationTimeoutInterval;
- (double)templatePublicLinkTTL;
- (unint64_t)alarmIDsLimitPerReminder;
- (unint64_t)appStoreReviewCreatedOrCompletedRemindersCountThreshold;
- (unint64_t)appStoreReviewNumberOfForegroundsThreshold;
- (unint64_t)cloudSchemaCatchUpSyncMaximumRetryCount;
- (unint64_t)extraneousAlarmsDeleteCountLimit;
- (unint64_t)extraneousAlarmsDeleteCountThreshold;
- (unint64_t)fetchBatchSize;
- (unint64_t)fetchCacheCountLimit;
- (unint64_t)fetchDatabaseChangesOperationPerScopePerAccountMaximumRetryCount;
- (unint64_t)imageDeduplicationApproximatePerRunDeleteLimit;
- (unint64_t)maxAttachmentsPerNote;
- (unint64_t)maxInlineAssetSizeBytes;
- (unint64_t)maxSubAttachmentsPerAttachment;
- (unint64_t)mergeLocalObjectsMaximumRetryCount;
- (unint64_t)objectEffectiveVersionValidationFlushBatchSize;
- (unint64_t)resultsLimitPerSyncOperation;
- (unint64_t)savedImageDeduplicationApproximatePerRunDeleteLimit;
- (unint64_t)staledFileAttachmentCleanupPerRunDeleteLimit;
- (void)setAccountChangedDebouncerInterval:(double)a3;
- (void)setAlarmIDsLimitPerReminder:(unint64_t)a3;
- (void)setAppStoreReviewCreatedOrCompletedRemindersCountThreshold:(unint64_t)a3;
- (void)setAppStoreReviewNumberOfForegroundsThreshold:(unint64_t)a3;
- (void)setAppStoreReviewTimeIntervalOfInterest:(double)a3;
- (void)setAppStoreReviewTimeIntervalSinceInitialForeground:(double)a3;
- (void)setAppStoreReviewTimeIntervalSinceLastFetch:(double)a3;
- (void)setAppStoreReviewTimeIntervalSinceLastPrompt:(double)a3;
- (void)setApsDebouncerDefaultInterval:(double)a3;
- (void)setApsDebouncerMigrationInProgressInterval:(double)a3;
- (void)setApsDebouncerWatchDefaultInterval:(double)a3;
- (void)setApsDebouncerWatchMigrationInProgressInterval:(double)a3;
- (void)setBatchDeleteExpiredRemindersDefaultThrottleInterval:(double)a3;
- (void)setBatchDeleteExpiredRemindersMinimumDeletionTimeInterval:(double)a3;
- (void)setBatchDeleteExpiredRemindersRateReduceFactor:(id)a3;
- (void)setCloudConfigurationDownloadThrottleInterval:(double)a3;
- (void)setCloudSchemaCatchUpSyncInitialRetryInterval:(double)a3;
- (void)setCloudSchemaCatchUpSyncMaximumRetryCount:(unint64_t)a3;
- (void)setExtraneousAlarmsBackoffThrottleInterval:(double)a3;
- (void)setExtraneousAlarmsCleanUpTriggerReductionFactor:(id)a3;
- (void)setExtraneousAlarmsCollectorDebounceInterval:(double)a3;
- (void)setExtraneousAlarmsCollectorThrottleInterval:(double)a3;
- (void)setExtraneousAlarmsDeleteCountLimit:(unint64_t)a3;
- (void)setExtraneousAlarmsDeleteCountThreshold:(unint64_t)a3;
- (void)setExtraneousAlarmsThrottleInterval:(double)a3;
- (void)setFetchBatchSize:(unint64_t)a3;
- (void)setFetchCacheCountLimit:(unint64_t)a3;
- (void)setFetchDatabaseChangesOperationPerScopePerAccountMaximumRetryCount:(unint64_t)a3;
- (void)setHousekeepingActivityMinimumDelay:(double)a3;
- (void)setICloudIsOffTimeIntervalSinceLastPrompt:(double)a3;
- (void)setImageDeduplicationApproximatePerRunDeleteLimit:(unint64_t)a3;
- (void)setImageDeduplicationBackoffThrottleInterval:(double)a3;
- (void)setImageDeduplicationDefaultThrottleInterval:(double)a3;
- (void)setImageDeduplicationRateReduceFactor:(id)a3;
- (void)setLanguageHypothesisThresholdForAdditionalLanguages:(id)a3;
- (void)setLanguageHypothesisThresholdForPrimaryLanguage:(id)a3;
- (void)setLaunchAndSignificantTimeChangePollThrottleInterval:(double)a3;
- (void)setManualSortHintClientSideExpiration:(double)a3;
- (void)setManualSortHintLastAccessedUpdatePolicy:(id)a3;
- (void)setMaxAttachmentsPerNote:(unint64_t)a3;
- (void)setMaxInlineAssetSizeBytes:(unint64_t)a3;
- (void)setMaxSubAttachmentsPerAttachment:(unint64_t)a3;
- (void)setMaximumAttachmentSizeMB:(id)a3;
- (void)setMergeLocalObjectsInitialRetryInterval:(double)a3;
- (void)setMergeLocalObjectsMaximumRetryCount:(unint64_t)a3;
- (void)setMergeLocalObjectsRetryStartOverThrottleInterval:(double)a3;
- (void)setMinimumClientVersion:(id)a3;
- (void)setMinimumSearchTermLengthByBaseLanguage:(id)a3;
- (void)setMiniumumAutomaticLanguageConfidenceScoreAllowed:(id)a3;
- (void)setObjectEffectiveVersionValidationFlushBatchSize:(unint64_t)a3;
- (void)setPersistedSubscriptionIDsValidityPeriod:(double)a3;
- (void)setPollingInterval:(double)a3;
- (void)setPostAnalyticsDefaultThrottleInterval:(double)a3;
- (void)setPostAnalyticsRateReduceFactor:(id)a3;
- (void)setReachabilityChangeSyncThrottleInterval:(double)a3;
- (void)setResultsLimitPerSyncOperation:(unint64_t)a3;
- (void)setSavedImageDeduplicationApproximatePerRunDeleteLimit:(unint64_t)a3;
- (void)setSavedImageDeduplicationBackoffThrottleInterval:(double)a3;
- (void)setSavedImageDeduplicationDefaultThrottleInterval:(double)a3;
- (void)setSavedImageDeduplicationRateReduceFactor:(id)a3;
- (void)setStaledFileAttachmentCleanupBackoffThrottleInterval:(double)a3;
- (void)setStaledFileAttachmentCleanupDefaultThrottleInterval:(double)a3;
- (void)setStaledFileAttachmentCleanupPerRunDeleteLimit:(unint64_t)a3;
- (void)setStaledFileAttachmentCleanupRateReduceFactor:(id)a3;
- (void)setSuggestConversionToGroceryListDefaultThrottleInterval:(double)a3;
- (void)setSuggestConversionToGroceryListRateReduceFactor:(id)a3;
- (void)setSuggestedAttributesAutoTrainingThrottleInterval:(double)a3;
- (void)setSuggestedAttributesHarvestingOverrides:(id)a3;
- (void)setSuggestedAttributesTrainingOverrides:(id)a3;
- (void)setTapToRadarThrottlingInterval:(double)a3;
- (void)setTemplatePublicLinkOperationTimeoutInterval:(double)a3;
- (void)setTemplatePublicLinkTTL:(double)a3;
- (void)setThrottlingPolicy:(id)a3;
@end

@implementation _ICCloudConfigurationStorage

- (NSString)minimumClientVersion
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setMinimumClientVersion:(id)a3
{
}

- (ICCloudThrottlingPolicy)throttlingPolicy
{
  return (ICCloudThrottlingPolicy *)objc_getProperty(self, a2, 16, 1);
}

- (void)setThrottlingPolicy:(id)a3
{
}

- (double)pollingInterval
{
  return self->_pollingInterval;
}

- (void)setPollingInterval:(double)a3
{
  self->_pollingInterval = a3;
}

- (unint64_t)maxInlineAssetSizeBytes
{
  return self->_maxInlineAssetSizeBytes;
}

- (void)setMaxInlineAssetSizeBytes:(unint64_t)a3
{
  self->_maxInlineAssetSizeBytes = a3;
}

- (NSNumber)maximumAttachmentSizeMB
{
  return (NSNumber *)objc_getProperty(self, a2, 40, 1);
}

- (void)setMaximumAttachmentSizeMB:(id)a3
{
}

- (unint64_t)maxAttachmentsPerNote
{
  return self->_maxAttachmentsPerNote;
}

- (void)setMaxAttachmentsPerNote:(unint64_t)a3
{
  self->_maxAttachmentsPerNote = a3;
}

- (unint64_t)maxSubAttachmentsPerAttachment
{
  return self->_maxSubAttachmentsPerAttachment;
}

- (void)setMaxSubAttachmentsPerAttachment:(unint64_t)a3
{
  self->_maxSubAttachmentsPerAttachment = a3;
}

- (unint64_t)resultsLimitPerSyncOperation
{
  return self->_resultsLimitPerSyncOperation;
}

- (void)setResultsLimitPerSyncOperation:(unint64_t)a3
{
  self->_resultsLimitPerSyncOperation = a3;
}

- (unint64_t)fetchBatchSize
{
  return self->_fetchBatchSize;
}

- (void)setFetchBatchSize:(unint64_t)a3
{
  self->_fetchBatchSize = a3;
}

- (unint64_t)fetchCacheCountLimit
{
  return self->_fetchCacheCountLimit;
}

- (void)setFetchCacheCountLimit:(unint64_t)a3
{
  self->_fetchCacheCountLimit = a3;
}

- (double)reachabilityChangeSyncThrottleInterval
{
  return self->_reachabilityChangeSyncThrottleInterval;
}

- (void)setReachabilityChangeSyncThrottleInterval:(double)a3
{
  self->_reachabilityChangeSyncThrottleInterval = a3;
}

- (double)launchAndSignificantTimeChangePollThrottleInterval
{
  return self->_launchAndSignificantTimeChangePollThrottleInterval;
}

- (void)setLaunchAndSignificantTimeChangePollThrottleInterval:(double)a3
{
  self->_launchAndSignificantTimeChangePollThrottleInterval = a3;
}

- (double)persistedSubscriptionIDsValidityPeriod
{
  return self->_persistedSubscriptionIDsValidityPeriod;
}

- (void)setPersistedSubscriptionIDsValidityPeriod:(double)a3
{
  self->_persistedSubscriptionIDsValidityPeriod = a3;
}

- (double)apsDebouncerDefaultInterval
{
  return self->_apsDebouncerDefaultInterval;
}

- (void)setApsDebouncerDefaultInterval:(double)a3
{
  self->_apsDebouncerDefaultInterval = a3;
}

- (double)apsDebouncerMigrationInProgressInterval
{
  return self->_apsDebouncerMigrationInProgressInterval;
}

- (void)setApsDebouncerMigrationInProgressInterval:(double)a3
{
  self->_apsDebouncerMigrationInProgressInterval = a3;
}

- (double)apsDebouncerWatchDefaultInterval
{
  return self->_apsDebouncerWatchDefaultInterval;
}

- (void)setApsDebouncerWatchDefaultInterval:(double)a3
{
  self->_apsDebouncerWatchDefaultInterval = a3;
}

- (double)apsDebouncerWatchMigrationInProgressInterval
{
  return self->_apsDebouncerWatchMigrationInProgressInterval;
}

- (void)setApsDebouncerWatchMigrationInProgressInterval:(double)a3
{
  self->_apsDebouncerWatchMigrationInProgressInterval = a3;
}

- (double)accountChangedDebouncerInterval
{
  return self->_accountChangedDebouncerInterval;
}

- (void)setAccountChangedDebouncerInterval:(double)a3
{
  self->_accountChangedDebouncerInterval = a3;
}

- (double)mergeLocalObjectsInitialRetryInterval
{
  return self->_mergeLocalObjectsInitialRetryInterval;
}

- (void)setMergeLocalObjectsInitialRetryInterval:(double)a3
{
  self->_mergeLocalObjectsInitialRetryInterval = a3;
}

- (unint64_t)mergeLocalObjectsMaximumRetryCount
{
  return self->_mergeLocalObjectsMaximumRetryCount;
}

- (void)setMergeLocalObjectsMaximumRetryCount:(unint64_t)a3
{
  self->_mergeLocalObjectsMaximumRetryCount = a3;
}

- (double)mergeLocalObjectsRetryStartOverThrottleInterval
{
  return self->_mergeLocalObjectsRetryStartOverThrottleInterval;
}

- (void)setMergeLocalObjectsRetryStartOverThrottleInterval:(double)a3
{
  self->_mergeLocalObjectsRetryStartOverThrottleInterval = a3;
}

- (double)cloudSchemaCatchUpSyncInitialRetryInterval
{
  return self->_cloudSchemaCatchUpSyncInitialRetryInterval;
}

- (void)setCloudSchemaCatchUpSyncInitialRetryInterval:(double)a3
{
  self->_cloudSchemaCatchUpSyncInitialRetryInterval = a3;
}

- (unint64_t)cloudSchemaCatchUpSyncMaximumRetryCount
{
  return self->_cloudSchemaCatchUpSyncMaximumRetryCount;
}

- (void)setCloudSchemaCatchUpSyncMaximumRetryCount:(unint64_t)a3
{
  self->_cloudSchemaCatchUpSyncMaximumRetryCount = a3;
}

- (unint64_t)fetchDatabaseChangesOperationPerScopePerAccountMaximumRetryCount
{
  return self->_fetchDatabaseChangesOperationPerScopePerAccountMaximumRetryCount;
}

- (void)setFetchDatabaseChangesOperationPerScopePerAccountMaximumRetryCount:(unint64_t)a3
{
  self->_fetchDatabaseChangesOperationPerScopePerAccountMaximumRetryCount = a3;
}

- (unint64_t)objectEffectiveVersionValidationFlushBatchSize
{
  return self->_objectEffectiveVersionValidationFlushBatchSize;
}

- (void)setObjectEffectiveVersionValidationFlushBatchSize:(unint64_t)a3
{
  self->_objectEffectiveVersionValidationFlushBatchSize = a3;
}

- (NSDictionary)suggestedAttributesTrainingOverrides
{
  return (NSDictionary *)objc_getProperty(self, a2, 208, 1);
}

- (void)setSuggestedAttributesTrainingOverrides:(id)a3
{
}

- (NSDictionary)suggestedAttributesHarvestingOverrides
{
  return (NSDictionary *)objc_getProperty(self, a2, 216, 1);
}

- (void)setSuggestedAttributesHarvestingOverrides:(id)a3
{
}

- (double)suggestedAttributesAutoTrainingThrottleInterval
{
  return self->_suggestedAttributesAutoTrainingThrottleInterval;
}

- (void)setSuggestedAttributesAutoTrainingThrottleInterval:(double)a3
{
  self->_suggestedAttributesAutoTrainingThrottleInterval = a3;
}

- (double)manualSortHintClientSideExpiration
{
  return self->_manualSortHintClientSideExpiration;
}

- (void)setManualSortHintClientSideExpiration:(double)a3
{
  self->_manualSortHintClientSideExpiration = a3;
}

- (NSString)manualSortHintLastAccessedUpdatePolicy
{
  return (NSString *)objc_getProperty(self, a2, 240, 1);
}

- (void)setManualSortHintLastAccessedUpdatePolicy:(id)a3
{
}

- (double)templatePublicLinkTTL
{
  return self->_templatePublicLinkTTL;
}

- (void)setTemplatePublicLinkTTL:(double)a3
{
  self->_templatePublicLinkTTL = a3;
}

- (double)templatePublicLinkOperationTimeoutInterval
{
  return self->_templatePublicLinkOperationTimeoutInterval;
}

- (void)setTemplatePublicLinkOperationTimeoutInterval:(double)a3
{
  self->_templatePublicLinkOperationTimeoutInterval = a3;
}

- (unint64_t)alarmIDsLimitPerReminder
{
  return self->_alarmIDsLimitPerReminder;
}

- (void)setAlarmIDsLimitPerReminder:(unint64_t)a3
{
  self->_alarmIDsLimitPerReminder = a3;
}

- (double)tapToRadarThrottlingInterval
{
  return self->_tapToRadarThrottlingInterval;
}

- (void)setTapToRadarThrottlingInterval:(double)a3
{
  self->_tapToRadarThrottlingInterval = a3;
}

- (double)housekeepingActivityMinimumDelay
{
  return self->_housekeepingActivityMinimumDelay;
}

- (void)setHousekeepingActivityMinimumDelay:(double)a3
{
  self->_housekeepingActivityMinimumDelay = a3;
}

- (double)cloudConfigurationDownloadThrottleInterval
{
  return self->_cloudConfigurationDownloadThrottleInterval;
}

- (void)setCloudConfigurationDownloadThrottleInterval:(double)a3
{
  self->_cloudConfigurationDownloadThrottleInterval = a3;
}

- (NSNumber)extraneousAlarmsCleanUpTriggerReductionFactor
{
  return (NSNumber *)objc_getProperty(self, a2, 296, 1);
}

- (void)setExtraneousAlarmsCleanUpTriggerReductionFactor:(id)a3
{
}

- (unint64_t)extraneousAlarmsDeleteCountLimit
{
  return self->_extraneousAlarmsDeleteCountLimit;
}

- (void)setExtraneousAlarmsDeleteCountLimit:(unint64_t)a3
{
  self->_extraneousAlarmsDeleteCountLimit = a3;
}

- (unint64_t)extraneousAlarmsDeleteCountThreshold
{
  return self->_extraneousAlarmsDeleteCountThreshold;
}

- (void)setExtraneousAlarmsDeleteCountThreshold:(unint64_t)a3
{
  self->_extraneousAlarmsDeleteCountThreshold = a3;
}

- (double)extraneousAlarmsBackoffThrottleInterval
{
  return self->_extraneousAlarmsBackoffThrottleInterval;
}

- (void)setExtraneousAlarmsBackoffThrottleInterval:(double)a3
{
  self->_extraneousAlarmsBackoffThrottleInterval = a3;
}

- (double)extraneousAlarmsThrottleInterval
{
  return self->_extraneousAlarmsThrottleInterval;
}

- (void)setExtraneousAlarmsThrottleInterval:(double)a3
{
  self->_extraneousAlarmsThrottleInterval = a3;
}

- (double)extraneousAlarmsCollectorDebounceInterval
{
  return self->_extraneousAlarmsCollectorDebounceInterval;
}

- (void)setExtraneousAlarmsCollectorDebounceInterval:(double)a3
{
  self->_extraneousAlarmsCollectorDebounceInterval = a3;
}

- (double)extraneousAlarmsCollectorThrottleInterval
{
  return self->_extraneousAlarmsCollectorThrottleInterval;
}

- (void)setExtraneousAlarmsCollectorThrottleInterval:(double)a3
{
  self->_extraneousAlarmsCollectorThrottleInterval = a3;
}

- (double)staledFileAttachmentCleanupDefaultThrottleInterval
{
  return self->_staledFileAttachmentCleanupDefaultThrottleInterval;
}

- (void)setStaledFileAttachmentCleanupDefaultThrottleInterval:(double)a3
{
  self->_staledFileAttachmentCleanupDefaultThrottleInterval = a3;
}

- (double)staledFileAttachmentCleanupBackoffThrottleInterval
{
  return self->_staledFileAttachmentCleanupBackoffThrottleInterval;
}

- (void)setStaledFileAttachmentCleanupBackoffThrottleInterval:(double)a3
{
  self->_staledFileAttachmentCleanupBackoffThrottleInterval = a3;
}

- (NSNumber)staledFileAttachmentCleanupRateReduceFactor
{
  return (NSNumber *)objc_getProperty(self, a2, 368, 1);
}

- (void)setStaledFileAttachmentCleanupRateReduceFactor:(id)a3
{
}

- (unint64_t)staledFileAttachmentCleanupPerRunDeleteLimit
{
  return self->_staledFileAttachmentCleanupPerRunDeleteLimit;
}

- (void)setStaledFileAttachmentCleanupPerRunDeleteLimit:(unint64_t)a3
{
  self->_staledFileAttachmentCleanupPerRunDeleteLimit = a3;
}

- (double)imageDeduplicationDefaultThrottleInterval
{
  return self->_imageDeduplicationDefaultThrottleInterval;
}

- (void)setImageDeduplicationDefaultThrottleInterval:(double)a3
{
  self->_imageDeduplicationDefaultThrottleInterval = a3;
}

- (double)imageDeduplicationBackoffThrottleInterval
{
  return self->_imageDeduplicationBackoffThrottleInterval;
}

- (void)setImageDeduplicationBackoffThrottleInterval:(double)a3
{
  self->_imageDeduplicationBackoffThrottleInterval = a3;
}

- (NSNumber)imageDeduplicationRateReduceFactor
{
  return (NSNumber *)objc_getProperty(self, a2, 400, 1);
}

- (void)setImageDeduplicationRateReduceFactor:(id)a3
{
}

- (unint64_t)imageDeduplicationApproximatePerRunDeleteLimit
{
  return self->_imageDeduplicationApproximatePerRunDeleteLimit;
}

- (void)setImageDeduplicationApproximatePerRunDeleteLimit:(unint64_t)a3
{
  self->_imageDeduplicationApproximatePerRunDeleteLimit = a3;
}

- (double)savedImageDeduplicationDefaultThrottleInterval
{
  return self->_savedImageDeduplicationDefaultThrottleInterval;
}

- (void)setSavedImageDeduplicationDefaultThrottleInterval:(double)a3
{
  self->_savedImageDeduplicationDefaultThrottleInterval = a3;
}

- (double)savedImageDeduplicationBackoffThrottleInterval
{
  return self->_savedImageDeduplicationBackoffThrottleInterval;
}

- (void)setSavedImageDeduplicationBackoffThrottleInterval:(double)a3
{
  self->_savedImageDeduplicationBackoffThrottleInterval = a3;
}

- (NSNumber)savedImageDeduplicationRateReduceFactor
{
  return (NSNumber *)objc_getProperty(self, a2, 432, 1);
}

- (void)setSavedImageDeduplicationRateReduceFactor:(id)a3
{
}

- (unint64_t)savedImageDeduplicationApproximatePerRunDeleteLimit
{
  return self->_savedImageDeduplicationApproximatePerRunDeleteLimit;
}

- (void)setSavedImageDeduplicationApproximatePerRunDeleteLimit:(unint64_t)a3
{
  self->_savedImageDeduplicationApproximatePerRunDeleteLimit = a3;
}

- (double)suggestConversionToGroceryListDefaultThrottleInterval
{
  return self->_suggestConversionToGroceryListDefaultThrottleInterval;
}

- (void)setSuggestConversionToGroceryListDefaultThrottleInterval:(double)a3
{
  self->_suggestConversionToGroceryListDefaultThrottleInterval = a3;
}

- (NSNumber)suggestConversionToGroceryListRateReduceFactor
{
  return (NSNumber *)objc_getProperty(self, a2, 456, 1);
}

- (void)setSuggestConversionToGroceryListRateReduceFactor:(id)a3
{
}

- (NSNumber)languageHypothesisThresholdForPrimaryLanguage
{
  return (NSNumber *)objc_getProperty(self, a2, 464, 1);
}

- (void)setLanguageHypothesisThresholdForPrimaryLanguage:(id)a3
{
}

- (NSNumber)languageHypothesisThresholdForAdditionalLanguages
{
  return (NSNumber *)objc_getProperty(self, a2, 472, 1);
}

- (void)setLanguageHypothesisThresholdForAdditionalLanguages:(id)a3
{
}

- (NSNumber)miniumumAutomaticLanguageConfidenceScoreAllowed
{
  return (NSNumber *)objc_getProperty(self, a2, 480, 1);
}

- (void)setMiniumumAutomaticLanguageConfidenceScoreAllowed:(id)a3
{
}

- (double)postAnalyticsDefaultThrottleInterval
{
  return self->_postAnalyticsDefaultThrottleInterval;
}

- (void)setPostAnalyticsDefaultThrottleInterval:(double)a3
{
  self->_postAnalyticsDefaultThrottleInterval = a3;
}

- (NSNumber)postAnalyticsRateReduceFactor
{
  return (NSNumber *)objc_getProperty(self, a2, 496, 1);
}

- (void)setPostAnalyticsRateReduceFactor:(id)a3
{
}

- (double)batchDeleteExpiredRemindersDefaultThrottleInterval
{
  return self->_batchDeleteExpiredRemindersDefaultThrottleInterval;
}

- (void)setBatchDeleteExpiredRemindersDefaultThrottleInterval:(double)a3
{
  self->_batchDeleteExpiredRemindersDefaultThrottleInterval = a3;
}

- (NSNumber)batchDeleteExpiredRemindersRateReduceFactor
{
  return (NSNumber *)objc_getProperty(self, a2, 512, 1);
}

- (void)setBatchDeleteExpiredRemindersRateReduceFactor:(id)a3
{
}

- (double)batchDeleteExpiredRemindersMinimumDeletionTimeInterval
{
  return self->_batchDeleteExpiredRemindersMinimumDeletionTimeInterval;
}

- (void)setBatchDeleteExpiredRemindersMinimumDeletionTimeInterval:(double)a3
{
  self->_batchDeleteExpiredRemindersMinimumDeletionTimeInterval = a3;
}

- (NSDictionary)minimumSearchTermLengthByBaseLanguage
{
  return (NSDictionary *)objc_getProperty(self, a2, 528, 1);
}

- (void)setMinimumSearchTermLengthByBaseLanguage:(id)a3
{
}

- (unint64_t)appStoreReviewCreatedOrCompletedRemindersCountThreshold
{
  return self->_appStoreReviewCreatedOrCompletedRemindersCountThreshold;
}

- (void)setAppStoreReviewCreatedOrCompletedRemindersCountThreshold:(unint64_t)a3
{
  self->_appStoreReviewCreatedOrCompletedRemindersCountThreshold = a3;
}

- (unint64_t)appStoreReviewNumberOfForegroundsThreshold
{
  return self->_appStoreReviewNumberOfForegroundsThreshold;
}

- (void)setAppStoreReviewNumberOfForegroundsThreshold:(unint64_t)a3
{
  self->_appStoreReviewNumberOfForegroundsThreshold = a3;
}

- (double)appStoreReviewTimeIntervalOfInterest
{
  return self->_appStoreReviewTimeIntervalOfInterest;
}

- (void)setAppStoreReviewTimeIntervalOfInterest:(double)a3
{
  self->_appStoreReviewTimeIntervalOfInterest = a3;
}

- (double)appStoreReviewTimeIntervalSinceInitialForeground
{
  return self->_appStoreReviewTimeIntervalSinceInitialForeground;
}

- (void)setAppStoreReviewTimeIntervalSinceInitialForeground:(double)a3
{
  self->_appStoreReviewTimeIntervalSinceInitialForeground = a3;
}

- (double)appStoreReviewTimeIntervalSinceLastPrompt
{
  return self->_appStoreReviewTimeIntervalSinceLastPrompt;
}

- (void)setAppStoreReviewTimeIntervalSinceLastPrompt:(double)a3
{
  self->_appStoreReviewTimeIntervalSinceLastPrompt = a3;
}

- (double)appStoreReviewTimeIntervalSinceLastFetch
{
  return self->_appStoreReviewTimeIntervalSinceLastFetch;
}

- (void)setAppStoreReviewTimeIntervalSinceLastFetch:(double)a3
{
  self->_appStoreReviewTimeIntervalSinceLastFetch = a3;
}

- (double)iCloudIsOffTimeIntervalSinceLastPrompt
{
  return self->_iCloudIsOffTimeIntervalSinceLastPrompt;
}

- (void)setICloudIsOffTimeIntervalSinceLastPrompt:(double)a3
{
  self->_iCloudIsOffTimeIntervalSinceLastPrompt = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_minimumSearchTermLengthByBaseLanguage, 0);
  objc_storeStrong((id *)&self->_batchDeleteExpiredRemindersRateReduceFactor, 0);
  objc_storeStrong((id *)&self->_postAnalyticsRateReduceFactor, 0);
  objc_storeStrong((id *)&self->_miniumumAutomaticLanguageConfidenceScoreAllowed, 0);
  objc_storeStrong((id *)&self->_languageHypothesisThresholdForAdditionalLanguages, 0);
  objc_storeStrong((id *)&self->_languageHypothesisThresholdForPrimaryLanguage, 0);
  objc_storeStrong((id *)&self->_suggestConversionToGroceryListRateReduceFactor, 0);
  objc_storeStrong((id *)&self->_savedImageDeduplicationRateReduceFactor, 0);
  objc_storeStrong((id *)&self->_imageDeduplicationRateReduceFactor, 0);
  objc_storeStrong((id *)&self->_staledFileAttachmentCleanupRateReduceFactor, 0);
  objc_storeStrong((id *)&self->_extraneousAlarmsCleanUpTriggerReductionFactor, 0);
  objc_storeStrong((id *)&self->_manualSortHintLastAccessedUpdatePolicy, 0);
  objc_storeStrong((id *)&self->_suggestedAttributesHarvestingOverrides, 0);
  objc_storeStrong((id *)&self->_suggestedAttributesTrainingOverrides, 0);
  objc_storeStrong((id *)&self->_maximumAttachmentSizeMB, 0);
  objc_storeStrong((id *)&self->_throttlingPolicy, 0);

  objc_storeStrong((id *)&self->_minimumClientVersion, 0);
}

@end