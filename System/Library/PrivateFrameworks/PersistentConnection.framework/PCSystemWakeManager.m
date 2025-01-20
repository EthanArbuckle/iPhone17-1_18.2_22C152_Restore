@interface PCSystemWakeManager
+ (void)scheduleWake:(BOOL)a3 wakeDate:(id)a4 acceptableDelay:(double)a5 userVisible:(BOOL)a6 serviceIdentifier:(id)a7 uniqueIdentifier:(void *)a8;
@end

@implementation PCSystemWakeManager

+ (void)scheduleWake:(BOOL)a3 wakeDate:(id)a4 acceptableDelay:(double)a5 userVisible:(BOOL)a6 serviceIdentifier:(id)a7 uniqueIdentifier:(void *)a8
{
  BOOL v10 = a6;
  BOOL v12 = a3;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v13 = a4;
  id v14 = a7;
  if (scheduleWake_wakeDate_acceptableDelay_userVisible_serviceIdentifier_uniqueIdentifier__pred != -1) {
    dispatch_once(&scheduleWake_wakeDate_acceptableDelay_userVisible_serviceIdentifier_uniqueIdentifier__pred, &__block_literal_global_3);
  }
  v15 = +[PCLog wakeManager];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = PCStringFromDate(v13);
    v18[0] = 67110146;
    v18[1] = v12;
    __int16 v19 = 2114;
    v20 = v16;
    __int16 v21 = 2048;
    double v22 = a5;
    __int16 v23 = 2114;
    id v24 = v14;
    __int16 v25 = 2114;
    v26 = a8;
    _os_log_impl(&dword_1D340D000, v15, OS_LOG_TYPE_DEFAULT, "Request to schedule wake %d date %{public}@ leeway %g service identifier %{public}@ unique identifier %{public}@", (uint8_t *)v18, 0x30u);
  }
  id v17 = [[PCScheduleSystemWakeOperation alloc] initForScheduledWake:v12 wakeDate:v13 acceptableDelay:v10 userVisible:v14 serviceIdentifier:a8 uniqueIdentifier:a5];
  [(id)scheduleWake_wakeDate_acceptableDelay_userVisible_serviceIdentifier_uniqueIdentifier__queue addOperation:v17];
}

void __108__PCSystemWakeManager_scheduleWake_wakeDate_acceptableDelay_userVisible_serviceIdentifier_uniqueIdentifier___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28F08]);
  v1 = (void *)scheduleWake_wakeDate_acceptableDelay_userVisible_serviceIdentifier_uniqueIdentifier__queue;
  scheduleWake_wakeDate_acceptableDelay_userVisible_serviceIdentifier_uniqueIdentifier__queue = (uint64_t)v0;

  [(id)scheduleWake_wakeDate_acceptableDelay_userVisible_serviceIdentifier_uniqueIdentifier__queue setMaxConcurrentOperationCount:1];
  v2 = objc_alloc_init(PCCancelAllProcessWakesOperation);
  [(id)scheduleWake_wakeDate_acceptableDelay_userVisible_serviceIdentifier_uniqueIdentifier__queue addOperation:v2];
}

@end