@interface USUsageTrackingAgent
- (void)checkStatusOfAllBudgetsWithReplyHandler:(id)a3;
- (void)checkStatusOfBudgets:(id)a3 clientIdentifier:(id)a4 replyHandler:(id)a5;
- (void)checkStatusOfBudgets:(id)a3 clientIdentifiers:(id)a4 replyHandler:(id)a5;
- (void)downloadDataWithReplyHandler:(id)a3;
- (void)fetchActivitiesForClient:(id)a3 replyHandler:(id)a4;
- (void)fetchBudgetsWithIdentifier:(id)a3 clientIdentifier:(id)a4 replyHandler:(id)a5;
- (void)fetchEventsForActivity:(id)a3 withClient:(id)a4 replyHandler:(id)a5;
- (void)fetchReportsDuringInterval:(id)a3 partitionInterval:(double)a4 replyHandler:(id)a5;
- (void)fetchScheduleForActivity:(id)a3 withClient:(id)a4 replyHandler:(id)a5;
- (void)fetchUsageForApplications:(id)a3 webDomains:(id)a4 categories:(id)a5 interval:(id)a6 replyHandler:(id)a7;
- (void)overrideDeviceActivityAuthorizationStatus:(BOOL)a3 replyHandler:(id)a4;
- (void)startMonitoringActivity:(id)a3 withSchedule:(id)a4 events:(id)a5 forClient:(id)a6 withExtension:(id)a7 replyHandler:(id)a8;
- (void)startMonitoringBudgets:(id)a3 darwinNotificationName:(id)a4 notificationTimes:(id)a5 clientIdentifier:(id)a6 replyHandler:(id)a7;
- (void)stopMonitoringActivities:(id)a3 forClient:(id)a4 replyHandler:(id)a5;
- (void)stopMonitoringAllBudgetsWithReplyHandler:(id)a3;
- (void)stopMonitoringBudgets:(id)a3 clientIdentifier:(id)a4 replyHandler:(id)a5;
- (void)uploadLocalDataWithReplyHandler:(id)a3;
@end

@implementation USUsageTrackingAgent

- (void)fetchReportsDuringInterval:(id)a3 partitionInterval:(double)a4 replyHandler:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  id v9 = (id)objc_opt_new();
  [v9 queryUsageDuringInterval:v8 partitionInterval:v7 completionHandler:a4];
}

- (void)fetchUsageForApplications:(id)a3 webDomains:(id)a4 categories:(id)a5 interval:(id)a6 replyHandler:(id)a7
{
  v11 = (void (**)(id, void *, id))a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  v16 = objc_opt_new();
  id v19 = 0;
  v17 = [v16 queryForApplications:v15 webDomains:v14 categories:v13 interval:v12 segmentInterval:&v19 error:86400.0];

  id v18 = v19;
  v11[2](v11, v17, v18);
}

- (void)startMonitoringBudgets:(id)a3 darwinNotificationName:(id)a4 notificationTimes:(id)a5 clientIdentifier:(id)a6 replyHandler:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  id v16 = +[USBudgetRegistration sharedRegistration];
  [v16 addBudgets:v15 darwinNotificationName:v14 notificationTimes:v13 clientIdentifier:v12 completionHandler:v11];
}

- (void)stopMonitoringBudgets:(id)a3 clientIdentifier:(id)a4 replyHandler:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = +[USBudgetRegistration sharedRegistration];
  [v10 removeBudgets:v9 clientIdentifier:v8 completionHandler:v7];
}

- (void)stopMonitoringAllBudgetsWithReplyHandler:(id)a3
{
  id v3 = a3;
  id v4 = +[USBudgetRegistration sharedRegistration];
  [v4 removeAllBudgetsWithCompletionHandler:v3];
}

- (void)checkStatusOfBudgets:(id)a3 clientIdentifier:(id)a4 replyHandler:(id)a5
{
}

- (void)checkStatusOfAllBudgetsWithReplyHandler:(id)a3
{
}

- (void)checkStatusOfBudgets:(id)a3 clientIdentifiers:(id)a4 replyHandler:(id)a5
{
}

- (void)fetchBudgetsWithIdentifier:(id)a3 clientIdentifier:(id)a4 replyHandler:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = +[USBudgetRegistration sharedRegistration];
  [v10 fetchBudgetsWithIdentifier:v9 clientIdentifier:v8 completionHandler:v7];
}

- (void)startMonitoringActivity:(id)a3 withSchedule:(id)a4 events:(id)a5 forClient:(id)a6 withExtension:(id)a7 replyHandler:(id)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  unint64_t v16 = (unint64_t)a6;
  unint64_t v17 = (unint64_t)a7;
  id v18 = (void (**)(id, id))a8;
  if (v16 | v17)
  {
    BOOL v19 = 1;
  }
  else
  {
    v20 = [v15 keysOfEntriesPassingTest:&stru_10008A6D0];
    BOOL v19 = [v20 count] != 0;
  }
  v21 = +[NSXPCConnection currentConnection];
  unsigned __int8 v22 = +[USTrackingAgentPrivateConnection connectionHasPrivateEntitlement:v21];

  if (!v19 || (v22 & 1) != 0)
  {
    v31 = +[USBudgetRegistration sharedRegistration];
    id v33 = 0;
    [v31 addBudgetForActivity:v13 withSchedule:v14 events:v15 forClient:v16 withExtension:v17 isPrivateClient:v19 error:&v33];
    id v30 = v33;
  }
  else
  {
    v23 = +[USUsageTrackingBundle usageTrackingBundle];
    v24 = [v23 localizedStringForKey:@"NotAuthorizedForSPIError" value:&stru_10008C828 table:0];
    [v23 localizedStringForKey:@"RequiresPrivateUsageTrackingAgentEntitlement" value:&stru_10008C828 table:0];
    id v32 = v15;
    id v25 = v14;
    v27 = id v26 = v13;
    v34[0] = NSLocalizedDescriptionKey;
    v34[1] = NSLocalizedRecoverySuggestionErrorKey;
    v35[0] = v24;
    v35[1] = v27;
    v28 = +[NSDictionary dictionaryWithObjects:v35 forKeys:v34 count:2];
    id v29 = objc_alloc((Class)NSError);
    id v30 = [v29 initWithDomain:USErrorDomain code:3 userInfo:v28];

    id v13 = v26;
    id v14 = v25;
    id v15 = v32;
  }
  v18[2](v18, v30);
}

- (void)stopMonitoringActivities:(id)a3 forClient:(id)a4 replyHandler:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, id))a5;
  if (v8
    && (+[NSXPCConnection currentConnection],
        id v10 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v11 = +[USTrackingAgentPrivateConnection connectionHasPrivateEntitlement:v10], v10, (v11 & 1) == 0))
  {
    id v12 = +[USUsageTrackingBundle usageTrackingBundle];
    id v14 = [v12 localizedStringForKey:@"NotAuthorizedForSPIError" value:&stru_10008C828 table:0];
    id v15 = [v12 localizedStringForKey:@"RequiresPrivateUsageTrackingAgentEntitlement" value:&stru_10008C828 table:0];
    v19[0] = NSLocalizedDescriptionKey;
    v19[1] = NSLocalizedRecoverySuggestionErrorKey;
    v20[0] = v14;
    v20[1] = v15;
    unint64_t v16 = +[NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:2];
    id v17 = objc_alloc((Class)NSError);
    id v13 = [v17 initWithDomain:USErrorDomain code:3 userInfo:v16];
  }
  else
  {
    id v12 = +[USBudgetRegistration sharedRegistration];
    id v18 = 0;
    [v12 removeBudgetsForActivities:v7 withClient:v8 error:&v18];
    id v13 = v18;
  }

  v9[2](v9, v13);
}

- (void)fetchActivitiesForClient:(id)a3 replyHandler:(id)a4
{
  id v5 = a3;
  v6 = (void (**)(id, void *, id))a4;
  if (v5
    && (+[NSXPCConnection currentConnection],
        id v7 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v8 = +[USTrackingAgentPrivateConnection connectionHasPrivateEntitlement:v7], v7, (v8 & 1) == 0))
  {
    id v12 = +[USUsageTrackingBundle usageTrackingBundle];
    id v13 = [v12 localizedStringForKey:@"NotAuthorizedForSPIError" value:&stru_10008C828 table:0];
    id v14 = [v12 localizedStringForKey:@"RequiresPrivateUsageTrackingAgentEntitlement" value:&stru_10008C828 table:0];
    v18[0] = NSLocalizedDescriptionKey;
    v18[1] = NSLocalizedRecoverySuggestionErrorKey;
    v19[0] = v13;
    v19[1] = v14;
    id v15 = +[NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:2];
    id v16 = objc_alloc((Class)NSError);
    id v11 = [v16 initWithDomain:USErrorDomain code:3 userInfo:v15];

    id v10 = 0;
  }
  else
  {
    id v9 = +[USBudgetRegistration sharedRegistration];
    id v17 = 0;
    id v10 = [v9 fetchActivitiesForClient:v5 error:&v17];
    id v11 = v17;
  }
  v6[2](v6, v10, v11);
}

- (void)fetchScheduleForActivity:(id)a3 withClient:(id)a4 replyHandler:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, void *, id))a5;
  if (v8
    && (+[NSXPCConnection currentConnection],
        id v10 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v11 = +[USTrackingAgentPrivateConnection connectionHasPrivateEntitlement:v10], v10, (v11 & 1) == 0))
  {
    id v15 = +[USUsageTrackingBundle usageTrackingBundle];
    id v16 = [v15 localizedStringForKey:@"NotAuthorizedForSPIError" value:&stru_10008C828 table:0];
    id v17 = [v15 localizedStringForKey:@"RequiresPrivateUsageTrackingAgentEntitlement" value:&stru_10008C828 table:0];
    v21[0] = NSLocalizedDescriptionKey;
    v21[1] = NSLocalizedRecoverySuggestionErrorKey;
    v22[0] = v16;
    v22[1] = v17;
    id v18 = +[NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:2];
    id v19 = objc_alloc((Class)NSError);
    id v14 = [v19 initWithDomain:USErrorDomain code:3 userInfo:v18];

    id v13 = 0;
  }
  else
  {
    id v12 = +[USBudgetRegistration sharedRegistration];
    id v20 = 0;
    id v13 = [v12 fetchScheduleForActivity:v7 withClient:v8 error:&v20];
    id v14 = v20;
  }
  v9[2](v9, v13, v14);
}

- (void)fetchEventsForActivity:(id)a3 withClient:(id)a4 replyHandler:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, void *, id))a5;
  id v10 = +[NSXPCConnection currentConnection];
  unsigned __int8 v11 = +[USTrackingAgentPrivateConnection connectionHasPrivateEntitlement:v10];

  if (!v8 || (v11 & 1) != 0)
  {
    id v19 = +[USBudgetRegistration sharedRegistration];
    id v29 = 0;
    id v18 = [v19 fetchEventsForActivity:v7 withClient:v8 error:&v29];
    id v17 = v29;

    id v20 = [v18 keysOfEntriesPassingTest:&stru_10008A6D0];
    id v21 = [v20 count];

    if (v21) {
      char v22 = v11;
    }
    else {
      char v22 = 1;
    }
    if ((v22 & 1) == 0)
    {

      v23 = +[USUsageTrackingBundle usageTrackingBundle];
      v24 = [v23 localizedStringForKey:@"NotAuthorizedForSPIError" value:&stru_10008C828 table:0];
      id v25 = [v23 localizedStringForKey:@"RequiresPrivateUsageTrackingAgentEntitlement" value:&stru_10008C828 table:0];
      NSErrorUserInfoKey v30 = NSLocalizedDescriptionKey;
      NSErrorUserInfoKey v31 = NSLocalizedRecoverySuggestionErrorKey;
      id v32 = v24;
      id v33 = v25;
      id v26 = +[NSDictionary dictionaryWithObjects:&v32 forKeys:&v30 count:2];
      id v27 = objc_alloc((Class)NSError);
      id v28 = [v27 initWithDomain:USErrorDomain code:3 userInfo:v26];

      id v18 = 0;
      id v17 = v28;
    }
  }
  else
  {
    id v12 = +[USUsageTrackingBundle usageTrackingBundle];
    id v13 = [v12 localizedStringForKey:@"NotAuthorizedForSPIError" value:&stru_10008C828 table:0];
    id v14 = [v12 localizedStringForKey:@"RequiresPrivateUsageTrackingAgentEntitlement" value:&stru_10008C828 table:0];
    NSErrorUserInfoKey v30 = NSLocalizedDescriptionKey;
    NSErrorUserInfoKey v31 = NSLocalizedRecoverySuggestionErrorKey;
    id v32 = v13;
    id v33 = v14;
    id v15 = +[NSDictionary dictionaryWithObjects:&v32 forKeys:&v30 count:2];
    id v16 = objc_alloc((Class)NSError);
    id v17 = [v16 initWithDomain:USErrorDomain code:3 userInfo:v15];

    id v18 = 0;
  }
  v9[2](v9, v18, v17);
}

- (void)overrideDeviceActivityAuthorizationStatus:(BOOL)a3 replyHandler:(id)a4
{
  BOOL v4 = a3;
  id v5 = (void (**)(id, void))a4;
  v6 = +[NSXPCConnection currentConnection];
  unsigned int v7 = +[USTrackingAgentPrivateConnection connectionHasPrivateEntitlement:v6];

  if (v7)
  {
    +[USDeviceActivityAuthorization setIsOverridden:v4];
    v5[2](v5, 0);
  }
  else
  {
    id v8 = +[USUsageTrackingBundle usageTrackingBundle];
    id v9 = [v8 localizedStringForKey:@"NotAuthorizedForSPIError" value:&stru_10008C828 table:0];
    id v10 = [v8 localizedStringForKey:@"RequiresPrivateUsageTrackingAgentEntitlement" value:&stru_10008C828 table:0];
    v14[0] = NSLocalizedDescriptionKey;
    v14[1] = NSLocalizedRecoverySuggestionErrorKey;
    v15[0] = v9;
    v15[1] = v10;
    unsigned __int8 v11 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:2];
    id v12 = objc_alloc((Class)NSError);
    id v13 = (void (**)(id, void))[v12 initWithDomain:USErrorDomain code:3 userInfo:v11];

    v5[2](v5, v13);
    id v5 = v13;
  }
}

- (void)uploadLocalDataWithReplyHandler:(id)a3
{
  id v3 = (void (**)(id, id))a3;
  BOOL v4 = +[NSXPCConnection currentConnection];
  unsigned int v5 = +[USTrackingAgentPrivateConnection connectionHasPrivateEntitlement:v4];

  if (_os_feature_enabled_impl() && v5)
  {
    +[SyncCoordinator uploadLocalDataWithCompletionHandler:v3];
  }
  else
  {
    v6 = +[USUsageTrackingBundle usageTrackingBundle];
    unsigned int v7 = [v6 localizedStringForKey:@"NotAuthorizedForSPIError" value:&stru_10008C828 table:0];
    id v8 = [v6 localizedStringForKey:@"RequiresPrivateUsageTrackingAgentEntitlement" value:&stru_10008C828 table:0];
    v12[0] = NSLocalizedDescriptionKey;
    v12[1] = NSLocalizedRecoverySuggestionErrorKey;
    v13[0] = v7;
    v13[1] = v8;
    id v9 = +[NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2];
    id v10 = objc_alloc((Class)NSError);
    id v11 = [v10 initWithDomain:USErrorDomain code:3 userInfo:v9];

    v3[2](v3, v11);
  }
}

- (void)downloadDataWithReplyHandler:(id)a3
{
  id v3 = (void (**)(id, id))a3;
  BOOL v4 = +[NSXPCConnection currentConnection];
  unsigned int v5 = +[USTrackingAgentPrivateConnection connectionHasPrivateEntitlement:v4];

  if (_os_feature_enabled_impl() && v5)
  {
    +[SyncCoordinator downloadWithCompletionHandler:v3];
  }
  else
  {
    v6 = +[USUsageTrackingBundle usageTrackingBundle];
    unsigned int v7 = [v6 localizedStringForKey:@"NotAuthorizedForSPIError" value:&stru_10008C828 table:0];
    id v8 = [v6 localizedStringForKey:@"RequiresPrivateUsageTrackingAgentEntitlement" value:&stru_10008C828 table:0];
    v12[0] = NSLocalizedDescriptionKey;
    v12[1] = NSLocalizedRecoverySuggestionErrorKey;
    v13[0] = v7;
    v13[1] = v8;
    id v9 = +[NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2];
    id v10 = objc_alloc((Class)NSError);
    id v11 = [v10 initWithDomain:USErrorDomain code:3 userInfo:v9];

    v3[2](v3, v11);
  }
}

@end