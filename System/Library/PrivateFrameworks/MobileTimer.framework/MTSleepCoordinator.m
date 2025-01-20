@interface MTSleepCoordinator
- (BOOL)handlesNotification:(id)a3 ofType:(int64_t)a4;
- (BOOL)isSleepModeOn;
- (BOOL)isUserAsleep;
- (MTAlarm)cachedSleepAlarm;
- (MTAlarm)sleepAlarm;
- (MTAlarmStorage)alarmStorage;
- (MTObserverStore)observers;
- (MTSleepCoordinator)initWithAlarmStorage:(id)a3;
- (MTSleepCoordinator)initWithAlarmStorage:(id)a3 currentDateProvider:(id)a4;
- (MTSleepCoordinatorStateMachine)stateMachine;
- (MTSleepModeMonitor)sleepModeMonitor;
- (MTXPCScheduler)alarmTimeoutScheduler;
- (NAFuture)sleepStateResolved;
- (NAScheduler)serializer;
- (NSDate)currentDate;
- (id)currentDateProvider;
- (id)gatherDiagnostics;
- (id)sourceIdentifier;
- (unint64_t)sleepTimeOutMinutes;
- (void)_notifyObserversForSleepAlarmChange:(id)a3;
- (void)handleBedtimeForAlarm:(id)a3 date:(id)a4;
- (void)handleBedtimeReminderForAlarm:(id)a3 date:(id)a4;
- (void)handleConfirmationOfGoToBedNotificationForAlarm:(id)a3 date:(id)a4;
- (void)handleDismissForAlarm:(id)a3 dismissAction:(unint64_t)a4 date:(id)a5;
- (void)handleNotification:(id)a3 ofType:(int64_t)a4 completion:(id)a5;
- (void)handleSleepSessionEndedForAlarm:(id)a3 date:(id)a4 reason:(unint64_t)a5;
- (void)handleSnoozeForAlarm:(id)a3 date:(id)a4;
- (void)handleSnoozeOfGoToBedNotificationForAlarm:(id)a3 date:(id)a4;
- (void)handleWakeUpAlarmForAlarm:(id)a3 date:(id)a4;
- (void)handleWakeUpTimeForAlarm:(id)a3 date:(id)a4;
- (void)notifyObserversForSleepAlarmChange:(id)a3;
- (void)notifyObserversForSleepAlarmChangeIfNecessary:(id)a3;
- (void)pairedDevicePreferencesChanged:(id)a3;
- (void)printDiagnostics;
- (void)registerObserver:(id)a3;
- (void)setAlarmStorage:(id)a3;
- (void)setAlarmTimeoutScheduler:(id)a3;
- (void)setCachedSleepAlarm:(id)a3;
- (void)setCurrentDateProvider:(id)a3;
- (void)setObservers:(id)a3;
- (void)setSerializer:(id)a3;
- (void)setSleepModeMonitor:(id)a3;
- (void)setSleepStateResolved:(id)a3;
- (void)setStateMachine:(id)a3;
- (void)sleepSessionTracker:(id)a3 sessionDidComplete:(id)a4;
- (void)source:(id)a3 didAddAlarms:(id)a4;
- (void)source:(id)a3 didDismissAlarm:(id)a4 dismissAction:(unint64_t)a5;
- (void)source:(id)a3 didFireAlarm:(id)a4 triggerType:(unint64_t)a5;
- (void)source:(id)a3 didRemoveAlarms:(id)a4;
- (void)source:(id)a3 didSnoozeAlarm:(id)a4 snoozeAction:(unint64_t)a5;
- (void)source:(id)a3 didUpdateAlarms:(id)a4;
- (void)stateMachine:(id)a3 dismissWakeUpAlarm:(id)a4 dismissAction:(unint64_t)a5;
- (void)stateMachine:(id)a3 shouldScheduleAlarmTimeoutForSecondsFromNow:(double)a4;
- (void)stateMachineUserWentToBed:(id)a3;
- (void)stateMachineUserWokeUp:(id)a3;
- (void)timeListener:(id)a3 didDetectSignificantTimeChangeWithCompletionBlock:(id)a4;
- (void)updateSleepState;
- (void)updateSleepStateWithSleepAlarm:(id)a3;
@end

@implementation MTSleepCoordinator

- (MTSleepCoordinator)initWithAlarmStorage:(id)a3
{
  id v4 = a3;
  v5 = MTCurrentDateProvider();
  v6 = [(MTSleepCoordinator *)self initWithAlarmStorage:v4 currentDateProvider:v5];

  return v6;
}

- (MTSleepCoordinator)initWithAlarmStorage:(id)a3 currentDateProvider:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v24.receiver = self;
  v24.super_class = (Class)MTSleepCoordinator;
  v9 = [(MTSleepCoordinator *)&v24 init];
  if (v9)
  {
    v10 = MTLogForCategory(7);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v26 = v9;
      _os_log_impl(&dword_19CC95000, v10, OS_LOG_TYPE_DEFAULT, "Initializing %{public}@", buf, 0xCu);
    }

    uint64_t v11 = +[MTScheduler serialSchedulerWithName:priority:](MTScheduler, "serialSchedulerWithName:priority:", @"com.apple.MTSleepCoordinator.access-queue", +[MTScheduler defaultPriority]);
    serializer = v9->_serializer;
    v9->_serializer = (NAScheduler *)v11;

    uint64_t v13 = objc_opt_new();
    observers = v9->_observers;
    v9->_observers = (MTObserverStore *)v13;

    objc_storeStrong((id *)&v9->_alarmStorage, a3);
    [v7 registerObserver:v9];
    uint64_t v15 = [v8 copy];
    id currentDateProvider = v9->_currentDateProvider;
    v9->_id currentDateProvider = (id)v15;

    uint64_t v17 = +[MTXPCScheduler xpcSchedulerWithEvent:@"com.apple.MTSleepCoordinator.wakeupalarmtimeout-event"];
    alarmTimeoutScheduler = v9->_alarmTimeoutScheduler;
    v9->_alarmTimeoutScheduler = (MTXPCScheduler *)v17;

    uint64_t v19 = objc_opt_new();
    sleepStateResolved = v9->_sleepStateResolved;
    v9->_sleepStateResolved = (NAFuture *)v19;

    v21 = [[MTSleepCoordinatorStateMachine alloc] initWithDelegate:v9 infoProvider:v9];
    stateMachine = v9->_stateMachine;
    v9->_stateMachine = v21;
  }
  return v9;
}

- (void)setSleepModeMonitor:(id)a3
{
}

- (void)updateSleepState
{
  id v3 = [(MTAlarmStorage *)self->_alarmStorage sleepAlarm];
  [(MTSleepCoordinator *)self updateSleepStateWithSleepAlarm:v3];
}

- (void)updateSleepStateWithSleepAlarm:(id)a3
{
  id v4 = a3;
  serializer = self->_serializer;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__MTSleepCoordinator_updateSleepStateWithSleepAlarm___block_invoke;
  v7[3] = &unk_1E5915000;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(NAScheduler *)serializer performBlock:v7];
}

uint64_t __53__MTSleepCoordinator_updateSleepStateWithSleepAlarm___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 16), *(id *)(a1 + 40));
  v2 = [*(id *)(a1 + 32) stateMachine];
  [v2 updateState];

  id v3 = *(void **)(*(void *)(a1 + 32) + 32);
  return [v3 finishWithNoResult];
}

- (BOOL)isUserAsleep
{
  sleepStateResolved = self->_sleepStateResolved;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __34__MTSleepCoordinator_isUserAsleep__block_invoke;
  v7[3] = &unk_1E59166A8;
  v7[4] = self;
  id v3 = [(NAFuture *)sleepStateResolved flatMap:v7];
  id v4 = [v3 mtSynchronousResult:0];
  char v5 = [v4 BOOLValue];

  return v5;
}

id __34__MTSleepCoordinator_isUserAsleep__block_invoke(uint64_t a1)
{
  v2 = objc_opt_new();
  id v3 = *(void **)(*(void *)(a1 + 32) + 24);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __34__MTSleepCoordinator_isUserAsleep__block_invoke_2;
  v8[3] = &unk_1E5915000;
  id v4 = v2;
  uint64_t v5 = *(void *)(a1 + 32);
  id v9 = v4;
  uint64_t v10 = v5;
  [v3 performBlock:v8];
  id v6 = v4;

  return v6;
}

void __34__MTSleepCoordinator_isUserAsleep__block_invoke_2(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4F28ED0];
  v2 = *(void **)(a1 + 32);
  id v4 = [*(id *)(a1 + 40) stateMachine];
  id v3 = objc_msgSend(v1, "numberWithBool:", objc_msgSend(v4, "isUserAsleep"));
  [v2 finishWithResult:v3];
}

- (BOOL)isSleepModeOn
{
  return [(MTSleepModeMonitor *)self->_sleepModeMonitor sleepMode:0];
}

- (MTAlarm)sleepAlarm
{
  return self->_cachedSleepAlarm;
}

- (NSDate)currentDate
{
  return (NSDate *)(*((uint64_t (**)(void))self->_currentDateProvider + 2))();
}

- (unint64_t)sleepTimeOutMinutes
{
  v2 = +[MTUserDefaults sharedUserDefaults];
  unint64_t v3 = [v2 integerForKey:@"MTSleepTimeOutMinutesKey" defaultValue:60];

  return v3;
}

- (void)stateMachineUserWentToBed:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = MTLogForCategory(7);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v9 = self;
    _os_log_impl(&dword_19CC95000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ userWentToBed", buf, 0xCu);
  }

  uint64_t v5 = MTLogForCategory(7);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v9 = self;
    _os_log_impl(&dword_19CC95000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ telling observers user went to bed", buf, 0xCu);
  }

  observers = self->_observers;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__MTSleepCoordinator_stateMachineUserWentToBed___block_invoke;
  v7[3] = &unk_1E59166D0;
  v7[4] = self;
  [(MTObserverStore *)observers enumerateObserversWithBlock:v7];
}

void __48__MTSleepCoordinator_stateMachineUserWentToBed___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (objc_opt_respondsToSelector())
  {
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = (*(void (**)(void))(*(void *)(v3 + 72) + 16))();
    [v5 sleepCoordinator:v3 userWentToBed:v4 sleepAlarm:*(void *)(*(void *)(a1 + 32) + 16)];
  }
}

- (void)stateMachineUserWokeUp:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = MTLogForCategory(7);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v9 = self;
    _os_log_impl(&dword_19CC95000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ userWokeUp", buf, 0xCu);
  }

  id v5 = MTLogForCategory(7);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v9 = self;
    _os_log_impl(&dword_19CC95000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ telling observers user woke up", buf, 0xCu);
  }

  observers = self->_observers;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __45__MTSleepCoordinator_stateMachineUserWokeUp___block_invoke;
  v7[3] = &unk_1E59166D0;
  v7[4] = self;
  [(MTObserverStore *)observers enumerateObserversWithBlock:v7];
}

void __45__MTSleepCoordinator_stateMachineUserWokeUp___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (objc_opt_respondsToSelector())
  {
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = (*(void (**)(void))(*(void *)(v3 + 72) + 16))();
    [v5 sleepCoordinator:v3 userWokeUp:v4 sleepAlarm:*(void *)(*(void *)(a1 + 32) + 16)];
  }
}

- (void)stateMachine:(id)a3 dismissWakeUpAlarm:(id)a4 dismissAction:(unint64_t)a5
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = MTLogForCategory(7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = MTDismissAlarmActionDescription(a5);
    int v13 = 138543618;
    v14 = self;
    __int16 v15 = 2114;
    v16 = v9;
    _os_log_impl(&dword_19CC95000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ dismissWakeUpAlarm (%{public}@)", (uint8_t *)&v13, 0x16u);
  }
  uint64_t v10 = [(MTSleepCoordinator *)self alarmStorage];
  uint64_t v11 = [(MTAlarmStorage *)self->_alarmStorage sleepAlarm];
  v12 = [v11 alarmIDString];
  [v10 dismissAlarmWithIdentifier:v12 dismissDate:v7 dismissAction:a5 withCompletion:0 source:self];
}

- (void)stateMachine:(id)a3 shouldScheduleAlarmTimeoutForSecondsFromNow:(double)a4
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v6 = MTLogForCategory(7);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    id v8 = self;
    _os_log_impl(&dword_19CC95000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ shouldScheduleAlarmTimeoutForSecondsFromNow", (uint8_t *)&v7, 0xCu);
  }

  [(MTXPCScheduler *)self->_alarmTimeoutScheduler scheduleTimerForSeconds:a4];
}

- (void)registerObserver:(id)a3
{
}

- (void)source:(id)a3 didAddAlarms:(id)a4
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v5 = objc_msgSend(a4, "na_firstObjectPassingTest:", &__block_literal_global_19);
  if (v5)
  {
    id v6 = MTLogForCategory(7);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138543362;
      id v8 = self;
      _os_log_impl(&dword_19CC95000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ telling observers about added sleep alarm", (uint8_t *)&v7, 0xCu);
    }

    [(MTSleepCoordinator *)self notifyObserversForSleepAlarmChange:v5];
    [(MTSleepCoordinator *)self updateSleepStateWithSleepAlarm:v5];
  }
}

uint64_t __42__MTSleepCoordinator_source_didAddAlarms___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isSleepAlarm];
}

- (void)source:(id)a3 didRemoveAlarms:(id)a4
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (objc_msgSend(a4, "na_any:", &__block_literal_global_22))
  {
    id v5 = MTLogForCategory(7);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138543362;
      int v7 = self;
      _os_log_impl(&dword_19CC95000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ telling observers about removed sleep alarm", (uint8_t *)&v6, 0xCu);
    }

    [(MTSleepCoordinator *)self notifyObserversForSleepAlarmChange:0];
    [(MTSleepCoordinator *)self updateSleepStateWithSleepAlarm:0];
  }
}

uint64_t __45__MTSleepCoordinator_source_didRemoveAlarms___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isSleepAlarm];
}

- (void)source:(id)a3 didUpdateAlarms:(id)a4
{
  uint64_t v5 = objc_msgSend(a4, "na_firstObjectPassingTest:", &__block_literal_global_24);
  uint64_t v6 = v5;
  if (v5)
  {
    uint64_t v7 = v5;
    [(MTSleepCoordinator *)self notifyObserversForSleepAlarmChangeIfNecessary:v5];
    uint64_t v5 = [(MTSleepCoordinator *)self updateSleepStateWithSleepAlarm:v7];
    uint64_t v6 = v7;
  }
  MEMORY[0x1F41817F8](v5, v6);
}

uint64_t __45__MTSleepCoordinator_source_didUpdateAlarms___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isSleepAlarm];
}

- (void)notifyObserversForSleepAlarmChange:(id)a3
{
  id v4 = a3;
  serializer = self->_serializer;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__MTSleepCoordinator_notifyObserversForSleepAlarmChange___block_invoke;
  v7[3] = &unk_1E5915000;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(NAScheduler *)serializer performBlock:v7];
}

uint64_t __57__MTSleepCoordinator_notifyObserversForSleepAlarmChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _notifyObserversForSleepAlarmChange:*(void *)(a1 + 40)];
}

- (void)_notifyObserversForSleepAlarmChange:(id)a3
{
  id v4 = a3;
  observers = self->_observers;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__MTSleepCoordinator__notifyObserversForSleepAlarmChange___block_invoke;
  v7[3] = &unk_1E59166F8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(MTObserverStore *)observers enumerateObserversWithBlock:v7];
}

void __58__MTSleepCoordinator__notifyObserversForSleepAlarmChange___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 sleepCoordinator:*(void *)(a1 + 32) sleepAlarmDidChange:*(void *)(a1 + 40)];
  }
}

- (void)notifyObserversForSleepAlarmChangeIfNecessary:(id)a3
{
  id v4 = a3;
  serializer = self->_serializer;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __68__MTSleepCoordinator_notifyObserversForSleepAlarmChangeIfNecessary___block_invoke;
  v7[3] = &unk_1E5915000;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  [(NAScheduler *)serializer performBlock:v7];
}

void __68__MTSleepCoordinator_notifyObserversForSleepAlarmChangeIfNecessary___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = (uint64_t *)(a1 + 40);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 16);
  if (*(void *)(a1 + 32))
  {
    if (!v3) {
      goto LABEL_8;
    }
  }
  else if (v3)
  {
LABEL_8:
    id v8 = MTLogForCategory(7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *v2;
      int v11 = 138543362;
      uint64_t v12 = v9;
      _os_log_impl(&dword_19CC95000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ telling observers about modified sleep alarm", (uint8_t *)&v11, 0xCu);
    }

    [*(id *)(a1 + 40) _notifyObserversForSleepAlarmChange:*(void *)(a1 + 32)];
    return;
  }
  id v4 = +[MTChangeSet changeSetWithChangesFromObject:toObject:](MTChangeSet, "changeSetWithChangesFromObject:toObject:");
  uint64_t v5 = MTLogForCategory(7);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    __68__MTSleepCoordinator_notifyObserversForSleepAlarmChangeIfNecessary___block_invoke_cold_2(v2, (uint64_t)v4, v5);
  }

  id v6 = +[MTAlarm propertiesAffectingNotification];
  int v7 = [v4 hasChangesInProperties:v6];

  if (v7) {
    goto LABEL_8;
  }
  uint64_t v10 = MTLogForCategory(7);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    __68__MTSleepCoordinator_notifyObserversForSleepAlarmChangeIfNecessary___block_invoke_cold_1(v2, v10);
  }
}

- (void)source:(id)a3 didFireAlarm:(id)a4 triggerType:(unint64_t)a5
{
  id v8 = a4;
  if ([v8 isSleepAlarm])
  {
    if (a5 == 7)
    {
      int v7 = (*((void (**)(void))self->_currentDateProvider + 2))();
      [(MTSleepCoordinator *)self handleBedtimeForAlarm:v8 date:v7];
    }
    else if ((a5 & 0xFFFFFFFFFFFFFFFELL) == 4)
    {
      int v7 = [v8 firedDate];
      [(MTSleepCoordinator *)self handleWakeUpAlarmForAlarm:v8 date:v7];
    }
    else if ((a5 & 0xFFFFFFFFFFFFFFFELL) == 2)
    {
      int v7 = [v8 firedDate];
      [(MTSleepCoordinator *)self handleBedtimeReminderForAlarm:v8 date:v7];
    }
    else
    {
      if (a5 != 8) {
        goto LABEL_11;
      }
      int v7 = (*((void (**)(void))self->_currentDateProvider + 2))();
      [(MTSleepCoordinator *)self handleWakeUpTimeForAlarm:v8 date:v7];
    }
  }
LABEL_11:
}

- (void)source:(id)a3 didSnoozeAlarm:(id)a4 snoozeAction:(unint64_t)a5
{
  id v8 = a4;
  if ([v8 isSleepAlarm])
  {
    if (a5 == 2)
    {
      int v7 = [v8 snoozeFireDate];
      [(MTSleepCoordinator *)self handleSnoozeForAlarm:v8 date:v7];
    }
    else
    {
      if (a5 != 1) {
        goto LABEL_7;
      }
      int v7 = [v8 bedtimeSnoozeFireDate];
      [(MTSleepCoordinator *)self handleSnoozeOfGoToBedNotificationForAlarm:v8 date:v7];
    }
  }
LABEL_7:
}

- (void)source:(id)a3 didDismissAlarm:(id)a4 dismissAction:(unint64_t)a5
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  if ([v7 isSleepAlarm])
  {
    id v8 = MTLogForCategory(7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = MTDismissAlarmActionDescription(a5);
      int v11 = 138543618;
      uint64_t v12 = self;
      __int16 v13 = 2114;
      v14 = v9;
      _os_log_impl(&dword_19CC95000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ sleep alarm dismissed: (%{public}@)", (uint8_t *)&v11, 0x16u);
    }
    if (a5 == 2)
    {
      uint64_t v10 = [v7 bedtimeDismissedDate];
      [(MTSleepCoordinator *)self handleConfirmationOfGoToBedNotificationForAlarm:v7 date:v10];
LABEL_8:

      goto LABEL_9;
    }
    if (MTDismissAlarmActionCountsAsWakeUp(a5))
    {
      uint64_t v10 = [v7 dismissedDate];
      [(MTSleepCoordinator *)self handleDismissForAlarm:v7 dismissAction:a5 date:v10];
      goto LABEL_8;
    }
  }
LABEL_9:
}

- (void)sleepSessionTracker:(id)a3 sessionDidComplete:(id)a4
{
  id v8 = a4;
  uint64_t v5 = [(MTAlarmStorage *)self->_alarmStorage sleepAlarm];
  id v6 = [v8 endDate];
  id v7 = v6;
  if (!v6)
  {
    id v7 = [(MTSleepCoordinator *)self currentDate];
  }
  -[MTSleepCoordinator handleSleepSessionEndedForAlarm:date:reason:](self, "handleSleepSessionEndedForAlarm:date:reason:", v5, v7, [v8 endReason]);
  if (!v6) {
}
  }

- (void)handleBedtimeReminderForAlarm:(id)a3 date:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  [(MTSleepCoordinator *)self updateSleepStateWithSleepAlarm:v6];
  id v8 = MTLogForCategory(7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v16 = self;
    __int16 v17 = 2114;
    id v18 = v7;
    _os_log_impl(&dword_19CC95000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ telling observers bedtime reminder fired at %{public}@", buf, 0x16u);
  }

  observers = self->_observers;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __57__MTSleepCoordinator_handleBedtimeReminderForAlarm_date___block_invoke;
  v12[3] = &unk_1E5916720;
  v12[4] = self;
  id v13 = v7;
  id v14 = v6;
  id v10 = v6;
  id v11 = v7;
  [(MTObserverStore *)observers enumerateObserversWithBlock:v12];
}

void __57__MTSleepCoordinator_handleBedtimeReminderForAlarm_date___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 sleepCoordinator:a1[4] bedtimeReminderDidFire:a1[5] sleepAlarm:a1[6]];
  }
}

- (void)handleConfirmationOfGoToBedNotificationForAlarm:(id)a3 date:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  serializer = self->_serializer;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __75__MTSleepCoordinator_handleConfirmationOfGoToBedNotificationForAlarm_date___block_invoke;
  v16[3] = &unk_1E59150A8;
  v16[4] = self;
  [(NAScheduler *)serializer performBlock:v16];
  uint64_t v9 = MTLogForCategory(7);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v18 = self;
    __int16 v19 = 2114;
    id v20 = v7;
    _os_log_impl(&dword_19CC95000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ telling observers bedtime reminder was confirmed at %{public}@", buf, 0x16u);
  }

  observers = self->_observers;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __75__MTSleepCoordinator_handleConfirmationOfGoToBedNotificationForAlarm_date___block_invoke_31;
  v13[3] = &unk_1E5916720;
  v13[4] = self;
  id v14 = v7;
  id v15 = v6;
  id v11 = v6;
  id v12 = v7;
  [(MTObserverStore *)observers enumerateObserversWithBlock:v13];
}

void __75__MTSleepCoordinator_handleConfirmationOfGoToBedNotificationForAlarm_date___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) stateMachine];
  [v1 userWentToBed];
}

void __75__MTSleepCoordinator_handleConfirmationOfGoToBedNotificationForAlarm_date___block_invoke_31(void *a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 sleepCoordinator:a1[4] bedtimeReminderWasConfirmed:a1[5] sleepAlarm:a1[6]];
  }
}

- (void)handleSnoozeOfGoToBedNotificationForAlarm:(id)a3 date:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  [(MTSleepCoordinator *)self updateSleepStateWithSleepAlarm:v6];
  id v8 = MTLogForCategory(7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v16 = self;
    __int16 v17 = 2114;
    id v18 = v7;
    _os_log_impl(&dword_19CC95000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ telling observers bedtime reminder was snoozed until %{public}@", buf, 0x16u);
  }

  observers = self->_observers;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __69__MTSleepCoordinator_handleSnoozeOfGoToBedNotificationForAlarm_date___block_invoke;
  v12[3] = &unk_1E5916720;
  v12[4] = self;
  id v13 = v7;
  id v14 = v6;
  id v10 = v6;
  id v11 = v7;
  [(MTObserverStore *)observers enumerateObserversWithBlock:v12];
}

void __69__MTSleepCoordinator_handleSnoozeOfGoToBedNotificationForAlarm_date___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 sleepCoordinator:a1[4] bedtimeReminderWasSnoozed:a1[5] sleepAlarm:a1[6]];
  }
}

- (void)handleBedtimeForAlarm:(id)a3 date:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  serializer = self->_serializer;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __49__MTSleepCoordinator_handleBedtimeForAlarm_date___block_invoke;
  v17[3] = &unk_1E5915000;
  v17[4] = self;
  id v9 = v7;
  id v18 = v9;
  [(NAScheduler *)serializer performBlock:v17];
  id v10 = MTLogForCategory(7);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v20 = self;
    __int16 v21 = 2114;
    id v22 = v9;
    _os_log_impl(&dword_19CC95000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ telling observers bedtime was reached at %{public}@", buf, 0x16u);
  }

  observers = self->_observers;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __49__MTSleepCoordinator_handleBedtimeForAlarm_date___block_invoke_36;
  v14[3] = &unk_1E5916720;
  v14[4] = self;
  id v15 = v9;
  id v16 = v6;
  id v12 = v6;
  id v13 = v9;
  [(MTObserverStore *)observers enumerateObserversWithBlock:v14];
}

void __49__MTSleepCoordinator_handleBedtimeForAlarm_date___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) stateMachine];
  [v2 userBedTimeReached:*(void *)(a1 + 40)];
}

void __49__MTSleepCoordinator_handleBedtimeForAlarm_date___block_invoke_36(void *a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 sleepCoordinator:a1[4] bedtimeWasReached:a1[5] sleepAlarm:a1[6]];
  }
}

- (void)handleWakeUpTimeForAlarm:(id)a3 date:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  serializer = self->_serializer;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __52__MTSleepCoordinator_handleWakeUpTimeForAlarm_date___block_invoke;
  v17[3] = &unk_1E5915000;
  v17[4] = self;
  id v9 = v7;
  id v18 = v9;
  [(NAScheduler *)serializer performBlock:v17];
  id v10 = MTLogForCategory(7);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v20 = self;
    __int16 v21 = 2114;
    id v22 = v9;
    _os_log_impl(&dword_19CC95000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ telling observers waketime time was reached at %{public}@", buf, 0x16u);
  }

  observers = self->_observers;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __52__MTSleepCoordinator_handleWakeUpTimeForAlarm_date___block_invoke_39;
  v14[3] = &unk_1E5916720;
  v14[4] = self;
  id v15 = v9;
  id v16 = v6;
  id v12 = v6;
  id v13 = v9;
  [(MTObserverStore *)observers enumerateObserversWithBlock:v14];
}

void __52__MTSleepCoordinator_handleWakeUpTimeForAlarm_date___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) stateMachine];
  [v2 userWakeTimeReached:*(void *)(a1 + 40)];
}

void __52__MTSleepCoordinator_handleWakeUpTimeForAlarm_date___block_invoke_39(void *a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 sleepCoordinator:a1[4] waketimeWasReached:a1[5] sleepAlarm:a1[6]];
  }
}

- (void)handleWakeUpAlarmForAlarm:(id)a3 date:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  serializer = self->_serializer;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __53__MTSleepCoordinator_handleWakeUpAlarmForAlarm_date___block_invoke;
  v16[3] = &unk_1E59150A8;
  v16[4] = self;
  [(NAScheduler *)serializer performBlock:v16];
  id v9 = MTLogForCategory(7);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v18 = self;
    __int16 v19 = 2114;
    id v20 = v7;
    _os_log_impl(&dword_19CC95000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ telling observers wake up alarm fired at %{public}@", buf, 0x16u);
  }

  observers = self->_observers;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __53__MTSleepCoordinator_handleWakeUpAlarmForAlarm_date___block_invoke_42;
  v13[3] = &unk_1E5916720;
  v13[4] = self;
  id v14 = v7;
  id v15 = v6;
  id v11 = v6;
  id v12 = v7;
  [(MTObserverStore *)observers enumerateObserversWithBlock:v13];
}

void __53__MTSleepCoordinator_handleWakeUpAlarmForAlarm_date___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) stateMachine];
  [v1 userWakeUpAlarmFired];
}

void __53__MTSleepCoordinator_handleWakeUpAlarmForAlarm_date___block_invoke_42(void *a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 sleepCoordinator:a1[4] wakeUpAlarmDidFire:a1[5] sleepAlarm:a1[6]];
  }
}

- (void)handleSnoozeForAlarm:(id)a3 date:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  [(MTXPCScheduler *)self->_alarmTimeoutScheduler unscheduleTimer];
  [(MTSleepCoordinator *)self updateSleepStateWithSleepAlarm:v6];
  id v8 = MTLogForCategory(7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v16 = self;
    __int16 v17 = 2114;
    id v18 = v7;
    _os_log_impl(&dword_19CC95000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ telling observers wake up alarm was snoozed until %{public}@", buf, 0x16u);
  }

  observers = self->_observers;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __48__MTSleepCoordinator_handleSnoozeForAlarm_date___block_invoke;
  v12[3] = &unk_1E5916720;
  v12[4] = self;
  id v13 = v7;
  id v14 = v6;
  id v10 = v6;
  id v11 = v7;
  [(MTObserverStore *)observers enumerateObserversWithBlock:v12];
}

void __48__MTSleepCoordinator_handleSnoozeForAlarm_date___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 sleepCoordinator:a1[4] wakeUpAlarmWasSnoozed:a1[5] sleepAlarm:a1[6]];
  }
}

- (void)handleDismissForAlarm:(id)a3 dismissAction:(unint64_t)a4 date:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  [(MTXPCScheduler *)self->_alarmTimeoutScheduler unscheduleTimer];
  serializer = self->_serializer;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __63__MTSleepCoordinator_handleDismissForAlarm_dismissAction_date___block_invoke;
  v20[3] = &unk_1E59150A8;
  v20[4] = self;
  [(NAScheduler *)serializer performBlock:v20];
  id v11 = MTLogForCategory(7);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = MTDismissAlarmActionDescription(a4);
    *(_DWORD *)buf = 138543874;
    id v22 = self;
    __int16 v23 = 2114;
    id v24 = v9;
    __int16 v25 = 2114;
    v26 = v12;
    _os_log_impl(&dword_19CC95000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ telling observers wake up alarm was dismissed at %{public}@ (%{public}@)", buf, 0x20u);
  }
  observers = self->_observers;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __63__MTSleepCoordinator_handleDismissForAlarm_dismissAction_date___block_invoke_47;
  v16[3] = &unk_1E5916748;
  v16[4] = self;
  id v17 = v9;
  id v18 = v8;
  unint64_t v19 = a4;
  id v14 = v8;
  id v15 = v9;
  [(MTObserverStore *)observers enumerateObserversWithBlock:v16];
}

void __63__MTSleepCoordinator_handleDismissForAlarm_dismissAction_date___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) stateMachine];
  [v1 userWokeUp];
}

void __63__MTSleepCoordinator_handleDismissForAlarm_dismissAction_date___block_invoke_47(void *a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 sleepCoordinator:a1[4] wakeUpAlarmWasDismissed:a1[5] dismissAction:a1[7] sleepAlarm:a1[6]];
  }
}

- (void)handleSleepSessionEndedForAlarm:(id)a3 date:(id)a4 reason:(unint64_t)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = MTLogForCategory(7);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    unint64_t v19 = self;
    __int16 v20 = 2114;
    uint64_t v21 = @"sleep session";
    __int16 v22 = 2114;
    id v23 = v9;
    _os_log_impl(&dword_19CC95000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ telling observers %{public}@ ended at %{public}@", buf, 0x20u);
  }

  observers = self->_observers;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __66__MTSleepCoordinator_handleSleepSessionEndedForAlarm_date_reason___block_invoke;
  v14[3] = &unk_1E5916748;
  v14[4] = self;
  id v15 = v9;
  id v16 = v8;
  unint64_t v17 = a5;
  id v12 = v8;
  id v13 = v9;
  [(MTObserverStore *)observers enumerateObserversWithBlock:v14];
}

void __66__MTSleepCoordinator_handleSleepSessionEndedForAlarm_date_reason___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 sleepCoordinator:a1[4] sleepSessionEnded:a1[5] reason:a1[7] sleepAlarm:a1[6]];
  }
}

- (void)timeListener:(id)a3 didDetectSignificantTimeChangeWithCompletionBlock:(id)a4
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = MTLogForCategory(7);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    id v7 = self;
    _os_log_impl(&dword_19CC95000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ significant time change detected", (uint8_t *)&v6, 0xCu);
  }

  [(MTSleepCoordinator *)self updateSleepState];
}

- (BOOL)handlesNotification:(id)a3 ofType:(int64_t)a4
{
  return objc_msgSend(a3, "isEqualToString:", @"com.apple.MTSleepCoordinator.wakeupalarmtimeout-event", a4);
}

- (void)handleNotification:(id)a3 ofType:(int64_t)a4 completion:(id)a5
{
  int v6 = (void (**)(void))a5;
  id v7 = [(MTSleepCoordinator *)self alarmStorage];
  uint64_t v8 = [v7 sleepAlarm];

  if (v8)
  {
    serializer = self->_serializer;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __59__MTSleepCoordinator_handleNotification_ofType_completion___block_invoke;
    v10[3] = &unk_1E59150A8;
    v10[4] = self;
    [(NAScheduler *)serializer performBlock:v10];
  }
  if (v6) {
    v6[2](v6);
  }
}

void __59__MTSleepCoordinator_handleNotification_ofType_completion___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) stateMachine];
  [v1 wakeUpAlarmTimedOut];
}

- (void)pairedDevicePreferencesChanged:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v4 = MTLogForCategory(7);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    int v6 = self;
    _os_log_impl(&dword_19CC95000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ pairedDevicePreferencesChanged", (uint8_t *)&v5, 0xCu);
  }

  [(MTSleepCoordinator *)self updateSleepState];
}

- (id)sourceIdentifier
{
  return @"MTSleepCoordinator";
}

- (void)printDiagnostics
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = MTLogForCategory(7);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v6) = 0;
    _os_log_impl(&dword_19CC95000, v3, OS_LOG_TYPE_DEFAULT, "-----MTSleepCoordinator-----", (uint8_t *)&v6, 2u);
  }

  id v4 = MTLogForCategory(7);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v5 = [(MTSleepCoordinator *)self isUserAsleep];
    int v6 = 138412546;
    uint64_t v7 = @"isUserAsleep";
    __int16 v8 = 1024;
    BOOL v9 = v5;
    _os_log_impl(&dword_19CC95000, v4, OS_LOG_TYPE_DEFAULT, "%@: %d", (uint8_t *)&v6, 0x12u);
  }
}

- (id)gatherDiagnostics
{
  v7[1] = *MEMORY[0x1E4F143B8];
  int v6 = @"isUserAsleep";
  BOOL v2 = [(MTSleepCoordinator *)self isUserAsleep];
  id v3 = @"NO";
  if (v2) {
    id v3 = @"YES";
  }
  v7[0] = v3;
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  return v4;
}

- (MTSleepCoordinatorStateMachine)stateMachine
{
  return self->_stateMachine;
}

- (void)setStateMachine:(id)a3
{
}

- (MTAlarm)cachedSleepAlarm
{
  return self->_cachedSleepAlarm;
}

- (void)setCachedSleepAlarm:(id)a3
{
}

- (NAScheduler)serializer
{
  return self->_serializer;
}

- (void)setSerializer:(id)a3
{
}

- (NAFuture)sleepStateResolved
{
  return self->_sleepStateResolved;
}

- (void)setSleepStateResolved:(id)a3
{
}

- (MTObserverStore)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (MTAlarmStorage)alarmStorage
{
  return self->_alarmStorage;
}

- (void)setAlarmStorage:(id)a3
{
}

- (MTXPCScheduler)alarmTimeoutScheduler
{
  return self->_alarmTimeoutScheduler;
}

- (void)setAlarmTimeoutScheduler:(id)a3
{
}

- (MTSleepModeMonitor)sleepModeMonitor
{
  return self->_sleepModeMonitor;
}

- (id)currentDateProvider
{
  return self->_currentDateProvider;
}

- (void)setCurrentDateProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_currentDateProvider, 0);
  objc_storeStrong((id *)&self->_sleepModeMonitor, 0);
  objc_storeStrong((id *)&self->_alarmTimeoutScheduler, 0);
  objc_storeStrong((id *)&self->_alarmStorage, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_sleepStateResolved, 0);
  objc_storeStrong((id *)&self->_serializer, 0);
  objc_storeStrong((id *)&self->_cachedSleepAlarm, 0);
  objc_storeStrong((id *)&self->_stateMachine, 0);
}

void __68__MTSleepCoordinator_notifyObserversForSleepAlarmChangeIfNecessary___block_invoke_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_19CC95000, a2, OS_LOG_TYPE_DEBUG, "%{public}@ sleep alarm changes unimportant.", (uint8_t *)&v3, 0xCu);
}

void __68__MTSleepCoordinator_notifyObserversForSleepAlarmChangeIfNecessary___block_invoke_cold_2(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *a1;
  int v4 = 138543618;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_debug_impl(&dword_19CC95000, log, OS_LOG_TYPE_DEBUG, "%{public}@ sleep alarm changes: %@", (uint8_t *)&v4, 0x16u);
}

@end