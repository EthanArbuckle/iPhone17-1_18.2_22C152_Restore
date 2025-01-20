@interface HKSHSleepApneaNotificationInteractedAnalyticsEvent
- (BOOL)isEventSubmissionIHAGated;
- (HKSHSleepApneaNotificationInteractedAnalyticsEvent)initWithNotificationResponse:(id)a3;
- (NSString)eventName;
- (id)_notificationAction;
- (id)_notificationType;
- (id)makeIHAGatedEventPayloadWithDataSource:(id)a3 error:(id *)a4;
- (id)makeUnrestrictedEventPayloadWithDataSource:(id)a3 error:(id *)a4;
@end

@implementation HKSHSleepApneaNotificationInteractedAnalyticsEvent

- (HKSHSleepApneaNotificationInteractedAnalyticsEvent)initWithNotificationResponse:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKSHSleepApneaNotificationInteractedAnalyticsEvent;
  v6 = [(HKSHSleepApneaNotificationInteractedAnalyticsEvent *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_response, a3);
  }

  return v7;
}

- (id)makeIHAGatedEventPayloadWithDataSource:(id)a3 error:(id *)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  [v6 setObject:@"true" forKeyedSubscript:@"areHealthNotificationsAuthorized"];
  v7 = [(HKSHSleepApneaNotificationInteractedAnalyticsEvent *)self _notificationType];
  [v6 setObject:v7 forKeyedSubscript:@"type"];

  v8 = [(HKSHSleepApneaNotificationInteractedAnalyticsEvent *)self _notificationAction];
  [v6 setObject:v8 forKeyedSubscript:@"action"];

  objc_super v9 = [v5 healthDataSource];
  v10 = [v5 environmentDataSource];
  v11 = [v10 currentDate];
  id v24 = 0;
  v12 = [v9 ageWithCurrentDate:v11 error:&v24];
  id v13 = v24;

  v14 = (os_log_t *)MEMORY[0x263F09958];
  v15 = v12;
  if (v13)
  {
    _HKInitializeLogging();
    v16 = *v14;
    if (os_log_type_enabled(*v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v26 = self;
      __int16 v27 = 2112;
      id v28 = v13;
      _os_log_error_impl(&dword_214A6B000, v16, OS_LOG_TYPE_ERROR, "[%{public}@] Error fetching age from data source: %@", buf, 0x16u);
    }
    v15 = (void *)*MEMORY[0x263F091B0];
  }
  [v6 setObject:v15 forKeyedSubscript:*MEMORY[0x263F091C8]];
  v17 = [v5 healthDataSource];
  id v23 = v13;
  v18 = [v17 biologicalSexWithError:&v23];
  id v19 = v23;

  if (v19)
  {
    _HKInitializeLogging();
    v20 = *v14;
    if (os_log_type_enabled(*v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v26 = self;
      __int16 v27 = 2112;
      id v28 = v19;
      _os_log_error_impl(&dword_214A6B000, v20, OS_LOG_TYPE_ERROR, "[%{public}@] Error biological sex from data source: %@", buf, 0x16u);
    }
    [v6 setObject:*MEMORY[0x263F09208] forKeyedSubscript:*MEMORY[0x263F091D8]];
  }
  else
  {
    v21 = HKAnalyticsPropertyValueForBiologicalSex();
    [v6 setObject:v21 forKeyedSubscript:*MEMORY[0x263F091D8]];
  }
  return v6;
}

- (id)makeUnrestrictedEventPayloadWithDataSource:(id)a3 error:(id *)a4
{
  return (id)MEMORY[0x263EFFA78];
}

- (id)_notificationType
{
  v2 = [(UNNotificationResponse *)self->_response notification];
  v3 = [v2 request];
  v4 = [v3 content];
  id v5 = [v4 categoryIdentifier];

  if ([v5 isEqualToString:@"PossibleSleepApnea"])
  {
    id v6 = @"possible sleep apnea";
  }
  else if ([v5 isEqualToString:@"SleepApneaNotificationsRemoteDisabled"])
  {
    id v6 = @"remote disabled";
  }
  else if ([v5 isEqualToString:@"SleepApneaNotificationsSeedExpired"])
  {
    id v6 = @"seed expired";
  }
  else if ([v5 isEqualToString:@"SleepApneaNotificationsLocalDeviceNoLongerSupported"])
  {
    id v6 = @"feature no longer supported on local device";
  }
  else if ([v5 isEqualToString:@"SleepApneaNotificationsActiveRemoteDeviceNoLongerSupported"])
  {
    id v6 = @"feature no longer supported on active remote device";
  }
  else if ([v5 isEqualToString:@"SleepApneaNotificationsFeatureIsAvailableAgainAndEnabled"])
  {
    id v6 = @"feature is available again and enabled";
  }
  else
  {
    id v6 = (__CFString *)(id)*MEMORY[0x263F09208];
  }

  return v6;
}

- (id)_notificationAction
{
  v2 = [(UNNotificationResponse *)self->_response actionIdentifier];
  if ([v2 isEqualToString:*MEMORY[0x263F1E0C8]])
  {
    v3 = @"openApp";
  }
  else if ([v2 isEqualToString:*MEMORY[0x263F1E0D0]])
  {
    v3 = @"dismiss";
  }
  else if ([v2 isEqualToString:@"SleepApneaNotificationInteractionAnalyticsNotificationActionLearnMore"])
  {
    v3 = @"learnMore";
  }
  else
  {
    v3 = (__CFString *)(id)*MEMORY[0x263F09208];
  }

  return v3;
}

- (BOOL)isEventSubmissionIHAGated
{
  return 1;
}

- (NSString)eventName
{
  return (NSString *)@"com.apple.health.bd.notificationinteractions";
}

- (void).cxx_destruct
{
}

@end