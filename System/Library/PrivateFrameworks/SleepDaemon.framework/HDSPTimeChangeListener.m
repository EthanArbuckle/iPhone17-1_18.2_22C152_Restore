@interface HDSPTimeChangeListener
- (HDSPEnvironment)environment;
- (HDSPTimeChangeListener)initWithEnvironment:(id)a3;
- (HKSPObserverSet)observers;
- (NSString)sourceIdentifier;
- (id)notificationListener:(id)a3 didReceiveNotificationWithName:(id)a4;
- (void)addObserver:(id)a3;
- (void)environmentWillBecomeReady:(id)a3;
- (void)handleSignificantTimeChange;
- (void)handleTimeZoneChange;
- (void)removeObserver:(id)a3;
@end

@implementation HDSPTimeChangeListener

- (HDSPTimeChangeListener)initWithEnvironment:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HDSPTimeChangeListener;
  v5 = [(HDSPTimeChangeListener *)&v12 init];
  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x263F75E20]);
    v7 = [v4 defaultCallbackScheduler];
    uint64_t v8 = [v6 initWithCallbackScheduler:v7];
    observers = v5->_observers;
    v5->_observers = (HKSPObserverSet *)v8;

    v10 = v5;
  }

  return v5;
}

- (void)addObserver:(id)a3
{
  if (a3) {
    -[HKSPObserverSet addObserver:](self->_observers, "addObserver:");
  }
}

- (void)removeObserver:(id)a3
{
  if (a3) {
    -[HKSPObserverSet removeObserver:](self->_observers, "removeObserver:");
  }
}

- (void)environmentWillBecomeReady:(id)a3
{
  id v4 = [a3 notificationListener];
  [v4 addObserver:self];
}

- (id)notificationListener:(id)a3 didReceiveNotificationWithName:(id)a4
{
  id v5 = a4;
  if ([v5 isEqualToString:@"SignificantTimeChange"])
  {
    [(HDSPTimeChangeListener *)self handleSignificantTimeChange];
  }
  else
  {
    id v6 = [NSString stringWithUTF8String:"com.apple.system.timezone"];
    int v7 = [v5 isEqualToString:v6];

    if (v7) {
      [(HDSPTimeChangeListener *)self handleTimeZoneChange];
    }
  }
  uint64_t v8 = [MEMORY[0x263F58190] futureWithNoResult];

  return v8;
}

- (void)handleSignificantTimeChange
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v3 = HKSPLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v13 = (id)objc_opt_class();
    id v4 = v13;
    _os_log_impl(&dword_221A52000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] handleSignificantTimeChange", buf, 0xCu);
  }
  [MEMORY[0x263EFFA18] resetSystemTimeZone];
  id v5 = HKSPLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = objc_opt_class();
    int v7 = (void *)MEMORY[0x263EFFA18];
    id v8 = v6;
    v9 = [v7 systemTimeZone];
    *(_DWORD *)buf = 138543618;
    id v13 = v6;
    __int16 v14 = 2114;
    v15 = v9;
    _os_log_impl(&dword_221A52000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] timeZone: %{public}@", buf, 0x16u);
  }
  observers = self->_observers;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __53__HDSPTimeChangeListener_handleSignificantTimeChange__block_invoke;
  v11[3] = &unk_2645DA918;
  v11[4] = self;
  [(HKSPObserverSet *)observers enumerateObserversWithBlock:v11];
}

void __53__HDSPTimeChangeListener_handleSignificantTimeChange__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 significantTimeChangeDetected:*(void *)(a1 + 32)];
  }
}

- (void)handleTimeZoneChange
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = HKSPLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v13 = (id)objc_opt_class();
    id v4 = v13;
    _os_log_impl(&dword_221A52000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] handleTimeZoneChange", buf, 0xCu);
  }
  [MEMORY[0x263EFFA18] resetSystemTimeZone];
  id v5 = HKSPLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = objc_opt_class();
    int v7 = (void *)MEMORY[0x263EFFA18];
    id v8 = v6;
    v9 = [v7 systemTimeZone];
    *(_DWORD *)buf = 138543618;
    id v13 = v6;
    __int16 v14 = 2114;
    v15 = v9;
    _os_log_impl(&dword_221A52000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] timeZone: %{public}@", buf, 0x16u);
  }
  observers = self->_observers;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __46__HDSPTimeChangeListener_handleTimeZoneChange__block_invoke;
  v11[3] = &unk_2645DA918;
  v11[4] = self;
  [(HKSPObserverSet *)observers enumerateObserversWithBlock:v11];
}

void __46__HDSPTimeChangeListener_handleTimeZoneChange__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 timeZoneChangeDetected:*(void *)(a1 + 32)];
  }
}

- (NSString)sourceIdentifier
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (HDSPEnvironment)environment
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->environment);

  return (HDSPEnvironment *)WeakRetained;
}

- (HKSPObserverSet)observers
{
  return self->_observers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);

  objc_destroyWeak((id *)&self->environment);
}

@end