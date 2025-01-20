@interface CSDPTTServiceUpdatePushMonitor
+ (BOOL)isPayloadPTTServiceUpdateMessage:(id)a3;
- (CSDPTTServiceUpdatePushBudgetDataSource)dataSource;
- (CSDPTTServiceUpdatePushMonitor)initWithServiceUpdatePushBudgetDataSource:(id)a3;
- (int64_t)remainingPTTWakingServiceUpdateBudgetForApplication:(id)a3;
- (void)_resetPTTWakingServiceUpdateCountForApplication:(id)a3;
- (void)displayPTTServiceUpdateOverBugetAlert:(id)a3;
- (void)incrementPTTWakingServiceUpdateCountForApplication:(id)a3;
- (void)removeApplicationFromPTTWakingServiceUpdateDictionary:(id)a3;
@end

@implementation CSDPTTServiceUpdatePushMonitor

- (CSDPTTServiceUpdatePushMonitor)initWithServiceUpdatePushBudgetDataSource:(id)a3
{
  id v5 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CSDPTTServiceUpdatePushMonitor;
  v6 = [(CSDPTTServiceUpdatePushMonitor *)&v8 init];
  if (v6)
  {
    if (!v5) {
      +[NSException raise:format:](NSException, "raise:format:", NSInvalidArgumentException, @"%s: parameter '%@' cannot be nil", "-[CSDPTTServiceUpdatePushMonitor initWithServiceUpdatePushBudgetDataSource:]", @"dataSource");
    }
    objc_storeStrong((id *)&v6->_dataSource, a3);
  }

  return v6;
}

+ (BOOL)isPayloadPTTServiceUpdateMessage:(id)a3
{
  v3 = [a3 objectForKey:@"aps"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = [v3 objectForKey:@"ptt-push-type"];
    id v5 = v4;
    if (v4) {
      unsigned __int8 v6 = [v4 isEqualToString:@"service-update"];
    }
    else {
      unsigned __int8 v6 = 0;
    }
  }
  else
  {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (void)_resetPTTWakingServiceUpdateCountForApplication:(id)a3
{
  id v4 = a3;
  id v5 = [CSDPTTServiceUpdatePushBudget alloc];
  unsigned __int8 v6 = [v4 bundleIdentifier];

  v7 = +[NSDate date];
  objc_super v8 = [(CSDPTTServiceUpdatePushBudget *)v5 initWithApplicationBundleIdentifier:v6 budgetStartTime:v7 serviceUpdatesDelivered:0];

  [(CSDPTTServiceUpdatePushBudgetDataSource *)self->_dataSource saveServiceUpdatePushBudget:v8];
}

- (void)removeApplicationFromPTTWakingServiceUpdateDictionary:(id)a3
{
}

- (void)incrementPTTWakingServiceUpdateCountForApplication:(id)a3
{
  id v4 = [(CSDPTTServiceUpdatePushBudgetDataSource *)self->_dataSource serviceUpdatePushBudgetForApplication:a3];
  objc_msgSend(v4, "setServiceUpdatesDelivered:", (char *)objc_msgSend(v4, "serviceUpdatesDelivered") + 1);
  [(CSDPTTServiceUpdatePushBudgetDataSource *)self->_dataSource saveServiceUpdatePushBudget:v4];
}

- (int64_t)remainingPTTWakingServiceUpdateBudgetForApplication:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDPTTServiceUpdatePushBudgetDataSource *)self->_dataSource serviceUpdatePushBudgetForApplication:v4];
  unsigned __int8 v6 = +[NSDate date];
  v7 = [v5 budgetStartTime];
  [v6 timeIntervalSinceDate:v7];
  double v9 = v8;

  if (v9 <= 3600.0)
  {
    if ((uint64_t)[v5 serviceUpdatesDelivered] <= 5) {
      int64_t v10 = 6 - (void)[v5 serviceUpdatesDelivered];
    }
    else {
      int64_t v10 = 0;
    }
  }
  else
  {
    [(CSDPTTServiceUpdatePushMonitor *)self _resetPTTWakingServiceUpdateCountForApplication:v4];
    int64_t v10 = 6;
  }

  return v10;
}

- (void)displayPTTServiceUpdateOverBugetAlert:(id)a3
{
  id v3 = a3;
  id v4 = +[NSMutableDictionary dictionary];
  id v5 = TUBundle();
  unsigned __int8 v6 = [v5 localizedStringForKey:@"PUSH_TO_TALK_SERVICE_UPDATE_BUDGET_TITLE" value:&stru_100517F40 table:@"TelephonyUtilities"];
  v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v6, v3);

  [v4 setObject:v7 forKeyedSubscript:kCFUserNotificationAlertHeaderKey];
  double v8 = TUBundle();
  double v9 = [v8 localizedStringForKey:@"PUSH_TO_TALK_SERVICE_UPDATE_BUDGET_MESSAGE" value:&stru_100517F40 table:@"TelephonyUtilities"];
  [v4 setObject:v9 forKeyedSubscript:kCFUserNotificationAlertMessageKey];

  int64_t v10 = TUBundle();
  v11 = [v10 localizedStringForKey:@"OK" value:&stru_100517F40 table:@"TelephonyUtilities"];
  [v4 setObject:v11 forKeyedSubscript:kCFUserNotificationDefaultButtonTitleKey];

  [v4 setObject:&__kCFBooleanTrue forKeyedSubscript:kCFUserNotificationAlertTopMostKey];
  [v4 setObject:&__kCFBooleanTrue forKeyedSubscript:SBUserNotificationForcesModalAlertAppearance];
  [v4 setObject:&__kCFBooleanFalse forKeyedSubscript:SBUserNotificationDisplayActionButtonOnLockScreen];
  [v4 setObject:&__kCFBooleanTrue forKeyedSubscript:SBUserNotificationAllowMenuButtonDismissal];
  [v4 setObject:&__kCFBooleanTrue forKeyedSubscript:SBUserNotificationDismissOnLock];
  SInt32 error = 0;
  CFUserNotificationRef v12 = CFUserNotificationCreate(0, 0.0, 0, &error, (CFDictionaryRef)v4);
  if (v12) {
    CFRelease(v12);
  }
}

- (CSDPTTServiceUpdatePushBudgetDataSource)dataSource
{
  return self->_dataSource;
}

- (void).cxx_destruct
{
}

@end