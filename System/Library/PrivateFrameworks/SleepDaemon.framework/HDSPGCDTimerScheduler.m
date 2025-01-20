@interface HDSPGCDTimerScheduler
- (HDSPEventScheduleDelegate)delegate;
- (HDSPGCDTimerScheduler)initWithCurrentDateProvider:(id)a3;
- (id)currentDateProvider;
- (void)scheduleEventForDate:(id)a3 options:(unint64_t)a4;
- (void)setDelegate:(id)a3;
@end

@implementation HDSPGCDTimerScheduler

- (HDSPGCDTimerScheduler)initWithCurrentDateProvider:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HDSPGCDTimerScheduler;
  v5 = [(HDSPGCDTimerScheduler *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    id currentDateProvider = v5->_currentDateProvider;
    v5->_id currentDateProvider = (id)v6;

    v8 = v5;
  }

  return v5;
}

- (void)scheduleEventForDate:(id)a3 options:(unint64_t)a4
{
  id currentDateProvider = self->_currentDateProvider;
  uint64_t v6 = (void (*)(void *))currentDateProvider[2];
  id v7 = a3;
  v8 = v6(currentDateProvider);
  [v7 timeIntervalSinceDate:v8];
  double v10 = v9;

  dispatch_time_t v11 = dispatch_time(0, (uint64_t)(v10 * 1000000000.0));
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__HDSPGCDTimerScheduler_scheduleEventForDate_options___block_invoke;
  block[3] = &unk_2645D90C0;
  block[4] = self;
  dispatch_after(v11, MEMORY[0x263EF83A0], block);
}

void __54__HDSPGCDTimerScheduler_scheduleEventForDate_options___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) delegate];
  [v1 scheduledEventIsDue];
}

- (HDSPEventScheduleDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);

  return (HDSPEventScheduleDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (id)currentDateProvider
{
  return self->_currentDateProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_currentDateProvider, 0);

  objc_destroyWeak((id *)&self->delegate);
}

@end