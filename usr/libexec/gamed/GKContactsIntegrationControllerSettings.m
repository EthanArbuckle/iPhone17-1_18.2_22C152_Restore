@interface GKContactsIntegrationControllerSettings
+ (id)allBagKeys;
- (BOOL)allowUpdates;
- (BOOL)allowUpdatesWithoutFriends;
- (GKContactsIntegrationControllerSettings)init;
- (GKContactsIntegrationControllerSettings)initWithBagValues:(id)a3;
- (double)expirationTimeForCohort:(int)a3;
- (double)idsBatchFetchDelayInterval;
- (double)idsBatchFetchJitterInterval;
- (double)idsExpirationTimeNonAppleUser;
- (double)idsExpirationTimeNotSet;
- (double)idsExpirationTimeNotUpgraded;
- (double)idsExpirationTimeOptedIn;
- (double)idsExpirationTimeOptedOut;
- (double)idsExpirationTimeUnknown;
- (double)idsUpdateInterval;
- (double)notificationCoalescingWaitTime;
- (unint64_t)idsV2BatchFetchSize;
- (unint64_t)idsV2FetchSize;
- (unint64_t)localBatchFetchSize;
- (unint64_t)localSyncLimit;
- (void)setIdsExpirationTimeNonAppleUser:(double)a3;
- (void)setIdsExpirationTimeNotSet:(double)a3;
- (void)setIdsExpirationTimeNotUpgraded:(double)a3;
- (void)setIdsExpirationTimeOptedIn:(double)a3;
- (void)setIdsExpirationTimeOptedOut:(double)a3;
- (void)setIdsExpirationTimeUnknown:(double)a3;
@end

@implementation GKContactsIntegrationControllerSettings

- (GKContactsIntegrationControllerSettings)init
{
  return [(GKContactsIntegrationControllerSettings *)self initWithBagValues:0];
}

- (GKContactsIntegrationControllerSettings)initWithBagValues:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)GKContactsIntegrationControllerSettings;
  v5 = [(GKContactsIntegrationControllerSettings *)&v14 init];
  if (v5)
  {
    v5->_localSyncLimit = (unint64_t)[v4 unsignedIntegerValueFromKey:@"gk-contactid-local-sync-limit" defaultValue:1000];
    v5->_localBatchFetchSize = (unint64_t)[v4 unsignedIntegerValueFromKey:@"gk-contactid-local-batch-fetch-size" defaultValue:100];
    v5->_idsV2BatchFetchSize = (unint64_t)[v4 unsignedIntegerValueFromKey:@"gk-contactid-ids-v2-batch-fetch-size" defaultValue:20];
    v5->_idsV2FetchSize = (unint64_t)[v4 unsignedIntegerValueFromKey:@"gk-contactid-ids-v2-fetch-size" defaultValue:20];
    [v4 doubleValueFromKey:@"gk-contactid-ids-update-interval-sec" defaultValue:18030.0];
    v5->_idsUpdateInterval = v6;
    [v4 doubleValueFromKey:@"gk-contactid-ids-expiration-opted-in-sec" defaultValue:604800.0];
    v5->_idsExpirationTimeOptedIn = v7;
    [v4 doubleValueFromKey:@"gk-contactid-ids-expiration-opted-out-sec" defaultValue:604800.0];
    v5->_idsExpirationTimeOptedOut = v8;
    [v4 doubleValueFromKey:@"gk-contactid-ids-expiration-not-set-sec" defaultValue:86400.0];
    v5->_idsExpirationTimeNotSet = v9;
    [v4 doubleValueFromKey:@"gk-contactid-ids-expiration-unknown-sec" defaultValue:86400.0];
    v5->_idsExpirationTimeUnknown = v10;
    v5->_allowUpdates = [v4 unsignedIntegerValueFromKey:@"gk-contactid-allow-updates" defaultValue:1] == (id)1;
    v5->_allowUpdatesWithoutFriends = [v4 unsignedIntegerValueFromKey:@"gk-contactid-allow-updates-without-friends" defaultValue:1] == (id)1;
    v5->_notificationCoalescingWaitTime = 7.0;
    [v4 doubleValueFromKey:@"gk-contactid-ids-v2-batch-fetch-delay-sec" defaultValue:3.0];
    v5->_idsBatchFetchDelayInterval = v11;
    [v4 doubleValueFromKey:@"gk-contactid-ids-v2-batch-fetch-jitter-sec" defaultValue:0.0];
    v5->_idsBatchFetchJitterInterval = v12;
  }

  return v5;
}

+ (id)allBagKeys
{
  if (qword_100329928 != -1) {
    dispatch_once(&qword_100329928, &stru_1002DC180);
  }
  v2 = (void *)qword_100329920;

  return v2;
}

- (double)expirationTimeForCohort:(int)a3
{
  switch(a3)
  {
    case -1:
      double result = 0.0;
      break;
    case 1:
      [(GKContactsIntegrationControllerSettings *)self idsExpirationTimeNotSet];
      break;
    case 2:
      [(GKContactsIntegrationControllerSettings *)self idsExpirationTimeOptedIn];
      break;
    case 3:
      [(GKContactsIntegrationControllerSettings *)self idsExpirationTimeOptedOut];
      break;
    default:
      [(GKContactsIntegrationControllerSettings *)self idsExpirationTimeUnknown];
      break;
  }
  return result;
}

- (unint64_t)idsV2FetchSize
{
  return self->_idsV2FetchSize;
}

- (unint64_t)idsV2BatchFetchSize
{
  return self->_idsV2BatchFetchSize;
}

- (unint64_t)localSyncLimit
{
  return self->_localSyncLimit;
}

- (unint64_t)localBatchFetchSize
{
  return self->_localBatchFetchSize;
}

- (double)idsUpdateInterval
{
  return self->_idsUpdateInterval;
}

- (double)idsBatchFetchJitterInterval
{
  return self->_idsBatchFetchJitterInterval;
}

- (double)idsBatchFetchDelayInterval
{
  return self->_idsBatchFetchDelayInterval;
}

- (double)notificationCoalescingWaitTime
{
  return self->_notificationCoalescingWaitTime;
}

- (BOOL)allowUpdates
{
  return self->_allowUpdates;
}

- (BOOL)allowUpdatesWithoutFriends
{
  return self->_allowUpdatesWithoutFriends;
}

- (double)idsExpirationTimeOptedIn
{
  return self->_idsExpirationTimeOptedIn;
}

- (void)setIdsExpirationTimeOptedIn:(double)a3
{
  self->_idsExpirationTimeOptedIn = a3;
}

- (double)idsExpirationTimeNotUpgraded
{
  return self->_idsExpirationTimeNotUpgraded;
}

- (void)setIdsExpirationTimeNotUpgraded:(double)a3
{
  self->_idsExpirationTimeNotUpgraded = a3;
}

- (double)idsExpirationTimeNonAppleUser
{
  return self->_idsExpirationTimeNonAppleUser;
}

- (void)setIdsExpirationTimeNonAppleUser:(double)a3
{
  self->_idsExpirationTimeNonAppleUser = a3;
}

- (double)idsExpirationTimeOptedOut
{
  return self->_idsExpirationTimeOptedOut;
}

- (void)setIdsExpirationTimeOptedOut:(double)a3
{
  self->_idsExpirationTimeOptedOut = a3;
}

- (double)idsExpirationTimeNotSet
{
  return self->_idsExpirationTimeNotSet;
}

- (void)setIdsExpirationTimeNotSet:(double)a3
{
  self->_idsExpirationTimeNotSet = a3;
}

- (double)idsExpirationTimeUnknown
{
  return self->_idsExpirationTimeUnknown;
}

- (void)setIdsExpirationTimeUnknown:(double)a3
{
  self->_idsExpirationTimeUnknown = a3;
}

@end