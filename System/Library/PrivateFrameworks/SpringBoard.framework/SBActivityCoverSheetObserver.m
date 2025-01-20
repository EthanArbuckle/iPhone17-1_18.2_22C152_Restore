@interface SBActivityCoverSheetObserver
- (BOOL)shouldHandleActivityItem:(id)a3;
- (SBActivityCoverSheetObserver)init;
- (void)activityDidDismiss:(id)a3;
- (void)activityDidExceedReducedPushBudget:(id)a3;
- (void)activityDidStart:(id)a3;
- (void)activityDidUpdate:(id)a3;
- (void)activityWasBlocked:(id)a3;
- (void)activityWasUnblocked:(id)a3;
@end

@implementation SBActivityCoverSheetObserver

- (SBActivityCoverSheetObserver)init
{
  v6.receiver = self;
  v6.super_class = (Class)SBActivityCoverSheetObserver;
  v2 = [(SBActivityCoverSheetObserver *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F5E388] sharedInstance];
    activityManager = v2->_activityManager;
    v2->_activityManager = (CSActivityManager *)v3;
  }
  return v2;
}

- (void)activityDidStart:(id)a3
{
  activityManager = self->_activityManager;
  id v4 = [a3 contentUpdate];
  [(CSActivityManager *)activityManager addActivityWithContentUpdate:v4];
}

- (void)activityDidUpdate:(id)a3
{
  activityManager = self->_activityManager;
  id v4 = [a3 contentUpdate];
  [(CSActivityManager *)activityManager updateActivityWithContentUpdate:v4];
}

- (void)activityDidDismiss:(id)a3
{
  activityManager = self->_activityManager;
  id v4 = [a3 contentUpdate];
  [(CSActivityManager *)activityManager removeActivityWithContentUpdate:v4];
}

- (BOOL)shouldHandleActivityItem:(id)a3
{
  if (!a3) {
    return 0;
  }
  uint64_t v3 = [a3 descriptor];
  id v4 = [v3 presentationOptions];
  v5 = [v4 destinations];
  char v6 = objc_msgSend(v5, "bs_containsObjectPassingTest:", &__block_literal_global_108);

  v7 = +[SBLiveActivityDomain rootSettings];
  char v8 = [v7 hideActivitiesInLockScreen];

  char v9 = v6 & ~v8;
  return v9;
}

BOOL __57__SBActivityCoverSheetObserver_shouldHandleActivityItem___block_invoke(uint64_t a1, void *a2)
{
  return [a2 destination] == 0;
}

- (void)activityWasBlocked:(id)a3
{
  activityManager = self->_activityManager;
  id v4 = [a3 identifier];
  [(CSActivityManager *)activityManager setActivityHidden:1 forIdentifier:v4];
}

- (void)activityWasUnblocked:(id)a3
{
  activityManager = self->_activityManager;
  id v4 = [a3 identifier];
  [(CSActivityManager *)activityManager setActivityHidden:0 forIdentifier:v4];
}

- (void)activityDidExceedReducedPushBudget:(id)a3
{
  activityManager = self->_activityManager;
  id v4 = [a3 identifier];
  [(CSActivityManager *)activityManager handleActivityExceedingReducedPushBudgetForIdentifier:v4];
}

- (void).cxx_destruct
{
}

@end