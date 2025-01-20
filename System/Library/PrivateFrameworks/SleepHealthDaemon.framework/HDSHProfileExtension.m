@interface HDSHProfileExtension
- (HDProfile)profile;
- (HDSHAccessibilityAssertionManager)accessibilityAssertionManager;
- (HDSHBreathingDisturbanceAnalysisScheduler)breathingDisturbanceAnalysisScheduler;
- (HDSHProfileExtension)initWithProfile:(id)a3;
- (HDSHWidgetSchedulingManager)widgetSchedulingManager;
- (id)featureAvailabilityExtensionForFeatureIdentifier:(id)a3;
- (void)setBreathingDisturbanceAnalysisScheduler:(id)a3;
@end

@implementation HDSHProfileExtension

- (id)featureAvailabilityExtensionForFeatureIdentifier:(id)a3
{
  if ([a3 isEqualToString:*MEMORY[0x263F097D8]]) {
    v4 = self->_sleepApneaNotificationsAvailabilityManager;
  }
  else {
    v4 = 0;
  }
  return v4;
}

- (HDSHProfileExtension)initWithProfile:(id)a3
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)HDSHProfileExtension;
  v5 = [(HDSHProfileExtension *)&v38 init];
  v6 = v5;
  if (!v5) {
    goto LABEL_14;
  }
  objc_storeWeak((id *)&v5->_profile, v4);
  v7 = [[HDSHAccessibilityAssertionManager alloc] initWithProfile:v4];
  accessibilityAssertionManager = v6->_accessibilityAssertionManager;
  v6->_accessibilityAssertionManager = v7;

  id WeakRetained = objc_loadWeakRetained((id *)&v6->_profile);
  v10 = [WeakRetained daemon];
  v11 = [v10 behavior];
  int v12 = objc_msgSend(v11, "hksp_supportsHealthData");

  if (v12)
  {
    v13 = [[HDSHWidgetSchedulingManager alloc] initWithProfile:v4];
    widgetSchedulingManager = v6->_widgetSchedulingManager;
    v6->_widgetSchedulingManager = v13;
  }
  v15 = [MEMORY[0x263F0A980] sharedBehavior];
  v16 = [v15 features];
  int v17 = [v16 nebula];

  if (v17)
  {
    uint64_t v18 = objc_msgSend(MEMORY[0x263F431E8], "hdsh_sleepApneaNotificationsAvailabilityManagerWithProfile:", v4);
    sleepApneaNotificationsAvailabilityManager = v6->_sleepApneaNotificationsAvailabilityManager;
    v6->_sleepApneaNotificationsAvailabilityManager = (HDFeatureAvailabilityManager *)v18;

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v20 = [MEMORY[0x263F0A980] sharedBehavior];
      char v21 = [v20 isAppleWatch];

      if ((v21 & 1) == 0)
      {
        triggerObserver = (HDSHSleepApneaNotificationUITriggerObserver *)[objc_alloc(MEMORY[0x263F0A3D0]) initWithFeatureAvailabilityProviding:v6->_sleepApneaNotificationsAvailabilityManager healthDataSource:v4];
        v26 = [[HDSHSleepApneaRescindedNotificationManager alloc] initWithProfile:v4 featureStatusProvider:triggerObserver];
        rescindedNotificationManager = v6->_rescindedNotificationManager;
        v6->_rescindedNotificationManager = v26;

        v28 = [HDSHBreathingDisturbanceAnalysisScheduler alloc];
        v29 = v6->_sleepApneaNotificationsAvailabilityManager;
        v30 = HKSPCurrentDateProvider();
        uint64_t v31 = [(HDSHBreathingDisturbanceAnalysisScheduler *)v28 initWithProfile:v4 featureStatusProvider:triggerObserver featureAvailabilityProviding:v29 currentDateProvider:v30];
        breathingDisturbanceAnalysisScheduler = v6->_breathingDisturbanceAnalysisScheduler;
        v6->_breathingDisturbanceAnalysisScheduler = (HDSHBreathingDisturbanceAnalysisScheduler *)v31;

        goto LABEL_11;
      }
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v22 = [MEMORY[0x263F0A980] sharedBehavior];
      int v23 = [v22 isAppleWatch];

      if (v23)
      {
        v24 = [[HDSHSleepApneaNotificationUITriggerObserver alloc] initWithProfile:v4];
        triggerObserver = v6->_triggerObserver;
        v6->_triggerObserver = v24;
LABEL_11:
      }
    }
  }
  _HKInitializeLogging();
  v33 = (void *)*MEMORY[0x263F09958];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09958], OS_LOG_TYPE_DEFAULT))
  {
    v34 = v33;
    v35 = objc_opt_class();
    *(_DWORD *)buf = 138543362;
    v40 = v35;
    id v36 = v35;
    _os_log_impl(&dword_226DD9000, v34, OS_LOG_TYPE_DEFAULT, "[%{public}@] Plugin loaded", buf, 0xCu);
  }
LABEL_14:

  return v6;
}

- (HDProfile)profile
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  return (HDProfile *)WeakRetained;
}

- (HDSHBreathingDisturbanceAnalysisScheduler)breathingDisturbanceAnalysisScheduler
{
  return self->_breathingDisturbanceAnalysisScheduler;
}

- (void)setBreathingDisturbanceAnalysisScheduler:(id)a3
{
}

- (HDSHAccessibilityAssertionManager)accessibilityAssertionManager
{
  return self->_accessibilityAssertionManager;
}

- (HDSHWidgetSchedulingManager)widgetSchedulingManager
{
  return self->_widgetSchedulingManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widgetSchedulingManager, 0);
  objc_storeStrong((id *)&self->_breathingDisturbanceAnalysisScheduler, 0);
  objc_destroyWeak((id *)&self->_profile);
  objc_storeStrong((id *)&self->_triggerObserver, 0);
  objc_storeStrong((id *)&self->_rescindedNotificationManager, 0);
  objc_storeStrong((id *)&self->_sleepApneaNotificationsAvailabilityManager, 0);
  objc_storeStrong((id *)&self->_accessibilityAssertionManager, 0);
}

@end