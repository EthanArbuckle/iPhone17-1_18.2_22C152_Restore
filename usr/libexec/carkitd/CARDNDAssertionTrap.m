@interface CARDNDAssertionTrap
- (BOOL)hasAssertion:(int64_t)a3;
- (BOOL)isActive;
- (CARAutomaticDNDStatus)preferences;
- (CARDNDAssertionTrap)initWithPreferences:(id)a3;
- (CARDNDAssertionTrapDelegate)delegate;
- (NSString)activeAssertionsDebugString;
- (NSUserDefaults)userDefaults;
- (int64_t)activeAssertions;
- (void)_mutateAssertionsCallingDelegate:(BOOL)a3 withBlock:(id)a4;
- (void)releaseAllAssertions;
- (void)releaseAllTemporaryAssertions;
- (void)releaseAssertion:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setUserDefaults:(id)a3;
- (void)takeAssertion:(int64_t)a3;
@end

@implementation CARDNDAssertionTrap

- (CARDNDAssertionTrap)initWithPreferences:(id)a3
{
  id v4 = a3;
  v5 = [(CARDNDAssertionTrap *)self init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_preferences, v4);
    uint64_t v7 = +[NSUserDefaults standardUserDefaults];
    userDefaults = v6->_userDefaults;
    v6->_userDefaults = (NSUserDefaults *)v7;

    v9 = [(CARDNDAssertionTrap *)v6 userDefaults];
    v6->_activeAssertions = (int64_t)[v9 integerForKey:@"CARDNDAssertionStateKey"];
  }
  return v6;
}

- (BOOL)isActive
{
  if ([(CARDNDAssertionTrap *)self hasAssertion:8])
  {
    v3 = [(CARDNDAssertionTrap *)self preferences];
    id v4 = [v3 disableTimerTimestamp];

    if (!v4
      || (+[NSDate date],
          v5 = objc_claimAutoreleasedReturnValue(),
          uint64_t v6 = +[CARAnalytics calendarUnitsOfType:64 fromDate:v4 toDate:v5], v5, v6 >= 8))
    {
      self->_activeAssertions &= ~8uLL;
    }
  }
  return [(CARDNDAssertionTrap *)self activeAssertions] != 0;
}

- (BOOL)hasAssertion:(int64_t)a3
{
  return (a3 & ~(unint64_t)[(CARDNDAssertionTrap *)self activeAssertions]) == 0;
}

- (void)takeAssertion:(int64_t)a3
{
  if (!-[CARDNDAssertionTrap hasAssertion:](self, "hasAssertion:"))
  {
    v5 = CarDNDWDLogging();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = +[NSNumber numberWithInteger:a3];
      *(_DWORD *)buf = 138412290;
      v11 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Taking assertion trap for %@", buf, 0xCu);
    }
    if (a3 == 8)
    {
      uint64_t v7 = +[NSDate date];
      v8 = [(CARDNDAssertionTrap *)self preferences];
      [v8 setDisableTimerTimestamp:v7];
    }
  }
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000377E8;
  v9[3] = &unk_1000BE388;
  v9[4] = self;
  v9[5] = a3;
  [(CARDNDAssertionTrap *)self _mutateAssertionsCallingDelegate:1 withBlock:v9];
}

- (void)releaseAssertion:(int64_t)a3
{
  if (-[CARDNDAssertionTrap hasAssertion:](self, "hasAssertion:"))
  {
    v5 = CarDNDWDLogging();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = +[NSNumber numberWithInteger:a3];
      *(_DWORD *)buf = 138412290;
      v10 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Releasing assertion trap for %@", buf, 0xCu);
    }
    if (a3 == 8)
    {
      uint64_t v7 = [(CARDNDAssertionTrap *)self preferences];
      [v7 setDisableTimerTimestamp:0];
    }
  }
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10003794C;
  v8[3] = &unk_1000BE388;
  v8[4] = self;
  v8[5] = a3;
  [(CARDNDAssertionTrap *)self _mutateAssertionsCallingDelegate:1 withBlock:v8];
}

- (void)releaseAllAssertions
{
  v3 = CarDNDWDLogging();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Clearing all assertion traps.", buf, 2u);
  }

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100037A40;
  v5[3] = &unk_1000BD1B0;
  v5[4] = self;
  [(CARDNDAssertionTrap *)self _mutateAssertionsCallingDelegate:1 withBlock:v5];
  id v4 = [(CARDNDAssertionTrap *)self preferences];
  [v4 setDisableTimerTimestamp:0];
}

- (void)releaseAllTemporaryAssertions
{
  v3 = CarDNDWDLogging();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Clearing all temporary assertions.", buf, 2u);
  }

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100037B10;
  v4[3] = &unk_1000BD1B0;
  v4[4] = self;
  [(CARDNDAssertionTrap *)self _mutateAssertionsCallingDelegate:0 withBlock:v4];
}

- (NSString)activeAssertionsDebugString
{
  if ([(CARDNDAssertionTrap *)self isActive])
  {
    v3 = objc_opt_new();
    if ([(CARDNDAssertionTrap *)self hasAssertion:4]) {
      [v3 addObject:@"Airplane Mode"];
    }
    if ([(CARDNDAssertionTrap *)self hasAssertion:1]) {
      [v3 addObject:@"CarPlay session"];
    }
    if ([(CARDNDAssertionTrap *)self hasAssertion:2]) {
      [v3 addObject:@"User-disabled until end of drive"];
    }
    if ([(CARDNDAssertionTrap *)self hasAssertion:8]) {
      [v3 addObject:@"8-minute hold"];
    }
    if ([(CARDNDAssertionTrap *)self hasAssertion:16]) {
      [v3 addObject:@"System-disabled until end of drive"];
    }
    if ([(CARDNDAssertionTrap *)self hasAssertion:32]) {
      [v3 addObject:@"Find My Device mode"];
    }
    id v4 = [v3 componentsJoinedByString:@", "];
    v5 = +[NSString stringWithFormat:@"Active assertions: %@", v4];
  }
  else
  {
    v5 = @"No active assertions.";
  }

  return (NSString *)v5;
}

- (void)_mutateAssertionsCallingDelegate:(BOOL)a3 withBlock:(id)a4
{
  BOOL v4 = a3;
  v13 = (void (**)(void))a4;
  uint64_t v6 = self;
  objc_sync_enter(v6);
  unsigned int v7 = [(CARDNDAssertionTrap *)v6 isActive];
  v13[2]();
  BOOL v8 = [(CARDNDAssertionTrap *)v6 isActive];
  v9 = [(CARDNDAssertionTrap *)v6 userDefaults];
  [v9 setInteger:-[CARDNDAssertionTrap activeAssertions](v6, "activeAssertions") forKey:@"CARDNDAssertionStateKey"];

  if (v4 && v8 | v7)
  {
    v10 = [(CARDNDAssertionTrap *)v6 delegate];
    char v11 = objc_opt_respondsToSelector();

    if (v11)
    {
      v12 = [(CARDNDAssertionTrap *)v6 delegate];
      [v12 assertionTrap:v6 didBecomeActive:v8];
    }
  }
  objc_sync_exit(v6);
}

- (CARAutomaticDNDStatus)preferences
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_preferences);

  return (CARAutomaticDNDStatus *)WeakRetained;
}

- (CARDNDAssertionTrapDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CARDNDAssertionTrapDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)activeAssertions
{
  return self->_activeAssertions;
}

- (NSUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (void)setUserDefaults:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_destroyWeak((id *)&self->_preferences);
}

@end