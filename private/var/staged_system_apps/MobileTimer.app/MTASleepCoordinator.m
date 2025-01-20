@interface MTASleepCoordinator
- (BOOL)didCompleteSleepOnboarding;
- (BOOL)isHealthAppNotInstalled;
- (HKHealthStore)healthStore;
- (HKSPFeatureAvailabilityStore)featureStore;
- (HKSPSleepStore)sleepStore;
- (MTASleepCoordinator)init;
- (MTASleepCoordinatorDelegate)delegate;
- (NSCalendar)calendar;
- (OS_dispatch_queue)healthQueue;
- (id)sleepEditController;
- (id)sleepMetadata;
- (void)dealloc;
- (void)localSetup;
- (void)observedApplicationDidInstallForBundleIdentifier:(id)a3;
- (void)observedApplicationDidUninstallForBundleIdentifier:(id)a3;
- (void)quickScheduleManagementViewController:(id)a3 didSave:(id)a4;
- (void)quickScheduleManagementViewController:(id)a3 shouldPresent:(id)a4;
- (void)quickScheduleManagementViewControllerDidCancel:(id)a3;
- (void)quickScheduleManagementViewControllerWillSave:(id)a3;
- (void)setCalendar:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFeatureStore:(id)a3;
- (void)setHealthQueue:(id)a3;
- (void)setHealthStore:(id)a3;
- (void)setSleepStore:(id)a3;
- (void)sleepStore:(id)a3 sleepScheduleModelDidChange:(id)a4;
@end

@implementation MTASleepCoordinator

- (MTASleepCoordinator)init
{
  v3 = MTLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v9 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ initializing", buf, 0xCu);
  }

  v7.receiver = self;
  v7.super_class = (Class)MTASleepCoordinator;
  v4 = [(MTASleepCoordinator *)&v7 init];
  v5 = v4;
  if (v4) {
    [(MTASleepCoordinator *)v4 localSetup];
  }
  return v5;
}

- (BOOL)didCompleteSleepOnboarding
{
  v3 = [(MTASleepCoordinator *)self featureStore];
  id v9 = 0;
  v4 = [v3 isCurrentOnboardingVersionCompletedWithError:&v9];
  id v5 = v9;

  v6 = MTLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v11 = self;
    __int16 v12 = 2114;
    v13 = v4;
    __int16 v14 = 2114;
    id v15 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ completed sleep onboarding check with result: %{public}@, error: %{public}@ ", buf, 0x20u);
  }

  if (v5) {
    unsigned __int8 v7 = 0;
  }
  else {
    unsigned __int8 v7 = [v4 BOOLValue];
  }

  return v7;
}

- (void)localSetup
{
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x2050000000;
  v3 = (void *)qword_1000C7B70;
  uint64_t v30 = qword_1000C7B70;
  if (!qword_1000C7B70)
  {
    v22 = _NSConcreteStackBlock;
    uint64_t v23 = 3221225472;
    v24 = sub_10000C7B4;
    v25 = &unk_1000A1818;
    v26 = &v27;
    sub_10000C7B4((uint64_t)&v22);
    v3 = (void *)v28[3];
  }
  id v4 = v3;
  _Block_object_dispose(&v27, 8);
  id v5 = objc_opt_new();
  [(MTASleepCoordinator *)self setHealthStore:v5];

  id v6 = objc_alloc((Class)HKSPSleepStore);
  unsigned __int8 v7 = [(MTASleepCoordinator *)self healthStore];
  id v8 = [v6 initWithHealthStore:v7];
  [(MTASleepCoordinator *)self setSleepStore:v8];

  id v9 = [(MTASleepCoordinator *)self sleepStore];
  [v9 addObserver:self];

  dispatch_queue_t v10 = dispatch_queue_create("com.apple.mobiletimer.health", 0);
  [(MTASleepCoordinator *)self setHealthQueue:v10];

  id v11 = objc_alloc((Class)HKSPFeatureAvailabilityStore);
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x2020000000;
  __int16 v12 = (id *)qword_1000C7B80;
  uint64_t v30 = qword_1000C7B80;
  if (!qword_1000C7B80)
  {
    v22 = _NSConcreteStackBlock;
    uint64_t v23 = 3221225472;
    v24 = sub_10001CE48;
    v25 = &unk_1000A1818;
    v26 = &v27;
    v13 = (void *)sub_10000C9C4();
    __int16 v14 = dlsym(v13, "HKFeatureIdentifierSleepCoaching");
    *(void *)(v26[1] + 24) = v14;
    qword_1000C7B80 = *(void *)(v26[1] + 24);
    __int16 v12 = (id *)v28[3];
  }
  _Block_object_dispose(&v27, 8);
  if (!v12) {
    sub_10006C908();
  }
  id v15 = *v12;
  v16 = [(MTASleepCoordinator *)self sleepStore];
  id v17 = [v11 initWithFeatureIdentifier:v15 sleepStore:v16];

  [(MTASleepCoordinator *)self setFeatureStore:v17];
  id v18 = [objc_alloc((Class)NSCalendar) initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
  [(MTASleepCoordinator *)self setCalendar:v18];

  v19 = [(MTASleepCoordinator *)self calendar];
  v20 = +[NSTimeZone systemTimeZone];
  [v19 setTimeZone:v20];

  v21 = +[MTApplicationWorkspaceObserver sharedWorkspaceObserver];
  [v21 addObserver:self forBundleIdentifier:kHKHealthAppBundleIdentifier];
}

- (HKSPSleepStore)sleepStore
{
  return self->_sleepStore;
}

- (void)setSleepStore:(id)a3
{
}

- (void)setHealthStore:(id)a3
{
}

- (void)setHealthQueue:(id)a3
{
}

- (void)setFeatureStore:(id)a3
{
}

- (void)setDelegate:(id)a3
{
}

- (void)setCalendar:(id)a3
{
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (HKSPFeatureAvailabilityStore)featureStore
{
  return self->_featureStore;
}

- (NSCalendar)calendar
{
  return self->_calendar;
}

- (void)dealloc
{
  v3 = +[MTApplicationWorkspaceObserver sharedWorkspaceObserver];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)MTASleepCoordinator;
  [(MTASleepCoordinator *)&v4 dealloc];
}

- (id)sleepEditController
{
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x2050000000;
  v3 = (void *)qword_1000C7B88;
  uint64_t v13 = qword_1000C7B88;
  if (!qword_1000C7B88)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10001CE98;
    v9[3] = &unk_1000A1818;
    v9[4] = &v10;
    sub_10001CE98((uint64_t)v9);
    v3 = (void *)v11[3];
  }
  objc_super v4 = v3;
  _Block_object_dispose(&v10, 8);
  id v5 = [v4 alloc];
  id v6 = [(MTASleepCoordinator *)self sleepStore];
  id v7 = [v5 initWithSleepStore:v6];

  [v7 setSleepDelegate:self];

  return v7;
}

- (BOOL)isHealthAppNotInstalled
{
  v2 = +[_HKBehavior sharedBehavior];
  unsigned __int8 v3 = [v2 healthAppNotInstalled];

  return v3;
}

- (void)quickScheduleManagementViewControllerWillSave:(id)a3
{
  id v4 = a3;
  id v5 = MTLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    id v8 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ sleep occurrence controller will save schedule", (uint8_t *)&v7, 0xCu);
  }

  id v6 = [v4 presentingViewController];

  [v6 dismissViewControllerAnimated:1 completion:&stru_1000A17D0];
}

- (void)quickScheduleManagementViewController:(id)a3 didSave:(id)a4
{
  id v5 = MTLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    id v8 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ sleep occurrence controller did save schedule", (uint8_t *)&v7, 0xCu);
  }

  id v6 = [(MTASleepCoordinator *)self delegate];
  [v6 didDismissViewController];
}

- (void)quickScheduleManagementViewControllerDidCancel:(id)a3
{
  id v4 = a3;
  id v5 = MTLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543362;
    id v9 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ sleep occurrence controller did cancel", (uint8_t *)&v8, 0xCu);
  }

  id v6 = [v4 presentingViewController];

  [v6 dismissViewControllerAnimated:1 completion:&stru_1000A17F0];
  int v7 = [(MTASleepCoordinator *)self delegate];
  [v7 didDismissViewController];
}

- (void)quickScheduleManagementViewController:(id)a3 shouldPresent:(id)a4
{
  id v5 = a4;
  id v6 = MTLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543618;
    id v9 = self;
    __int16 v10 = 2114;
    id v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ sleep occurrence controller presenting alert: %{public}@", (uint8_t *)&v8, 0x16u);
  }

  int v7 = [(MTASleepCoordinator *)self delegate];
  [v7 presentSleepAlert:v5];
}

- (id)sleepMetadata
{
  unsigned __int8 v3 = [(MTASleepCoordinator *)self sleepStore];
  id v4 = [(MTASleepCoordinator *)self calendar];
  id v5 = [v3 mt_sleepMetaDataForUpcomingAlarmInCalendar:v4 error:0];

  return v5;
}

- (void)sleepStore:(id)a3 sleepScheduleModelDidChange:(id)a4
{
  id v5 = MTLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    int v8 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ sleep schedule model did change", (uint8_t *)&v7, 0xCu);
  }

  id v6 = [(MTASleepCoordinator *)self delegate];
  [v6 sleepScheduleModelDidChange];
}

- (void)observedApplicationDidInstallForBundleIdentifier:(id)a3
{
  id v3 = [(MTASleepCoordinator *)self delegate];
  [v3 healthAppInstallationDidChange];
}

- (void)observedApplicationDidUninstallForBundleIdentifier:(id)a3
{
  id v3 = [(MTASleepCoordinator *)self delegate];
  [v3 healthAppInstallationDidChange];
}

- (MTASleepCoordinatorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MTASleepCoordinatorDelegate *)WeakRetained;
}

- (OS_dispatch_queue)healthQueue
{
  return self->_healthQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_storeStrong((id *)&self->_featureStore, 0);
  objc_storeStrong((id *)&self->_healthQueue, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_sleepStore, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end