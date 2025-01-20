@interface _ICCloudDefaultValuesConfigurationStorage
+ (id)sharedConfiguration;
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
- (id)batchDeleteExpiredRemindersRateReduceFactor;
- (id)extraneousAlarmsCleanUpTriggerReductionFactor;
- (id)imageDeduplicationRateReduceFactor;
- (id)languageHypothesisThresholdForAdditionalLanguages;
- (id)languageHypothesisThresholdForPrimaryLanguage;
- (id)manualSortHintLastAccessedUpdatePolicy;
- (id)maximumAttachmentSizeMB;
- (id)minimumClientVersion;
- (id)minimumSearchTermLengthByBaseLanguage;
- (id)miniumumAutomaticLanguageConfidenceScoreAllowed;
- (id)postAnalyticsRateReduceFactor;
- (id)savedImageDeduplicationRateReduceFactor;
- (id)staledFileAttachmentCleanupRateReduceFactor;
- (id)suggestConversionToGroceryListRateReduceFactor;
- (id)suggestedAttributesHarvestingOverrides;
- (id)suggestedAttributesTrainingOverrides;
- (id)throttlingPolicy;
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
@end

@implementation _ICCloudDefaultValuesConfigurationStorage

+ (id)sharedConfiguration
{
  if (qword_100922918 != -1) {
    dispatch_once(&qword_100922918, &stru_1008AF848);
  }
  v2 = (void *)qword_100922910;

  return v2;
}

- (id)minimumClientVersion
{
  return @"9,0,0";
}

- (id)throttlingPolicy
{
  v2 = [[ICCloudThrottlingLevel alloc] initWithBatchInterval:0 numberOfBatches:60.0];
  v3 = [ICCloudThrottlingPolicy alloc];
  v7 = v2;
  v4 = +[NSArray arrayWithObjects:&v7 count:1];
  v5 = [(ICCloudThrottlingPolicy *)v3 initWithThrottlingLevels:v4 resetInterval:86400.0];

  return v5;
}

- (double)pollingInterval
{
  return 0.0;
}

- (unint64_t)maxInlineAssetSizeBytes
{
  return 0x80000;
}

- (id)maximumAttachmentSizeMB
{
  return +[NSNumber numberWithUnsignedLongLong:0x4000];
}

- (unint64_t)maxAttachmentsPerNote
{
  return 100;
}

- (unint64_t)maxSubAttachmentsPerAttachment
{
  return 24;
}

- (unint64_t)resultsLimitPerSyncOperation
{
  return 50;
}

- (unint64_t)fetchBatchSize
{
  return 10;
}

- (unint64_t)fetchCacheCountLimit
{
  return 5000;
}

- (double)reachabilityChangeSyncThrottleInterval
{
  return 3600.0;
}

- (double)launchAndSignificantTimeChangePollThrottleInterval
{
  return 94608000.0;
}

- (double)persistedSubscriptionIDsValidityPeriod
{
  return 864000.0;
}

- (double)apsDebouncerDefaultInterval
{
  return 15.0;
}

- (double)apsDebouncerMigrationInProgressInterval
{
  return 180.0;
}

- (double)apsDebouncerWatchDefaultInterval
{
  return 15.0;
}

- (double)apsDebouncerWatchMigrationInProgressInterval
{
  return 180.0;
}

- (double)accountChangedDebouncerInterval
{
  return 10.0;
}

- (double)mergeLocalObjectsInitialRetryInterval
{
  return 30.0;
}

- (unint64_t)mergeLocalObjectsMaximumRetryCount
{
  return 6;
}

- (double)mergeLocalObjectsRetryStartOverThrottleInterval
{
  return 86400.0;
}

- (double)cloudSchemaCatchUpSyncInitialRetryInterval
{
  return 60.0;
}

- (unint64_t)cloudSchemaCatchUpSyncMaximumRetryCount
{
  return 3;
}

- (unint64_t)fetchDatabaseChangesOperationPerScopePerAccountMaximumRetryCount
{
  return 3;
}

- (unint64_t)objectEffectiveVersionValidationFlushBatchSize
{
  return 100;
}

- (id)suggestedAttributesTrainingOverrides
{
  return &off_1008D7B68;
}

- (id)suggestedAttributesHarvestingOverrides
{
  return &off_1008D7C08;
}

- (double)suggestedAttributesAutoTrainingThrottleInterval
{
  return 86400.0;
}

- (double)manualSortHintClientSideExpiration
{
  return 31536000.0;
}

- (double)templatePublicLinkTTL
{
  return 157680000.0;
}

- (double)templatePublicLinkOperationTimeoutInterval
{
  return 30.0;
}

- (unint64_t)alarmIDsLimitPerReminder
{
  return 1000;
}

- (id)manualSortHintLastAccessedUpdatePolicy
{
  return @"month";
}

- (double)tapToRadarThrottlingInterval
{
  return 300.0;
}

- (double)housekeepingActivityMinimumDelay
{
  return 86400.0;
}

- (double)cloudConfigurationDownloadThrottleInterval
{
  return 86400.0;
}

- (id)extraneousAlarmsCleanUpTriggerReductionFactor
{
  return +[NSNumber numberWithDouble:0.0];
}

- (unint64_t)extraneousAlarmsDeleteCountLimit
{
  return 200;
}

- (unint64_t)extraneousAlarmsDeleteCountThreshold
{
  return 10;
}

- (double)extraneousAlarmsBackoffThrottleInterval
{
  return 86400.0;
}

- (double)extraneousAlarmsThrottleInterval
{
  return 21600.0;
}

- (double)extraneousAlarmsCollectorDebounceInterval
{
  return 5.0;
}

- (double)extraneousAlarmsCollectorThrottleInterval
{
  return 43200.0;
}

- (double)staledFileAttachmentCleanupDefaultThrottleInterval
{
  return 86400.0;
}

- (double)staledFileAttachmentCleanupBackoffThrottleInterval
{
  return 2678400.0;
}

- (id)staledFileAttachmentCleanupRateReduceFactor
{
  return +[NSNumber numberWithDouble:0.0];
}

- (unint64_t)staledFileAttachmentCleanupPerRunDeleteLimit
{
  return 50;
}

- (double)imageDeduplicationDefaultThrottleInterval
{
  return 86400.0;
}

- (double)imageDeduplicationBackoffThrottleInterval
{
  return 2678400.0;
}

- (id)imageDeduplicationRateReduceFactor
{
  return +[NSNumber numberWithDouble:0.0];
}

- (unint64_t)imageDeduplicationApproximatePerRunDeleteLimit
{
  return 50;
}

- (double)savedImageDeduplicationDefaultThrottleInterval
{
  return 86400.0;
}

- (double)savedImageDeduplicationBackoffThrottleInterval
{
  return 2678400.0;
}

- (id)savedImageDeduplicationRateReduceFactor
{
  return +[NSNumber numberWithDouble:0.0];
}

- (unint64_t)savedImageDeduplicationApproximatePerRunDeleteLimit
{
  return 50;
}

- (double)suggestConversionToGroceryListDefaultThrottleInterval
{
  return 86400.0;
}

- (id)suggestConversionToGroceryListRateReduceFactor
{
  return +[NSNumber numberWithDouble:0.0];
}

- (id)languageHypothesisThresholdForPrimaryLanguage
{
  return +[NSNumber numberWithDouble:0.3];
}

- (id)languageHypothesisThresholdForAdditionalLanguages
{
  return +[NSNumber numberWithDouble:0.3];
}

- (id)miniumumAutomaticLanguageConfidenceScoreAllowed
{
  return +[NSNumber numberWithDouble:0.05];
}

- (double)postAnalyticsDefaultThrottleInterval
{
  return 1209600.0;
}

- (id)postAnalyticsRateReduceFactor
{
  return +[NSNumber numberWithDouble:0.0];
}

- (double)batchDeleteExpiredRemindersDefaultThrottleInterval
{
  return 86400.0;
}

- (id)batchDeleteExpiredRemindersRateReduceFactor
{
  return +[NSNumber numberWithDouble:0.0];
}

- (double)batchDeleteExpiredRemindersMinimumDeletionTimeInterval
{
  return 3024000.0;
}

- (id)minimumSearchTermLengthByBaseLanguage
{
  v4[0] = REMMinimumSearchTermLengthBaseLanguageDefault;
  v4[1] = @"zh-Hans";
  v5[0] = &off_1008D7210;
  v5[1] = &off_1008D7228;
  v4[2] = @"zh-Hant";
  v4[3] = @"ja";
  v5[2] = &off_1008D7228;
  v5[3] = &off_1008D7228;
  v4[4] = @"ko";
  v5[4] = &off_1008D7228;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:5];

  return v2;
}

- (unint64_t)appStoreReviewCreatedOrCompletedRemindersCountThreshold
{
  return 20;
}

- (unint64_t)appStoreReviewNumberOfForegroundsThreshold
{
  return 3;
}

- (double)appStoreReviewTimeIntervalOfInterest
{
  return 2592000.0;
}

- (double)appStoreReviewTimeIntervalSinceInitialForeground
{
  return 604800.0;
}

- (double)appStoreReviewTimeIntervalSinceLastPrompt
{
  return 10368000.0;
}

- (double)appStoreReviewTimeIntervalSinceLastFetch
{
  return 1209600.0;
}

- (double)iCloudIsOffTimeIntervalSinceLastPrompt
{
  return 10368000.0;
}

@end