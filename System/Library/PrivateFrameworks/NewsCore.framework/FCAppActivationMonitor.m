@interface FCAppActivationMonitor
- (FCAppActivationMonitor)init;
- (FCAppActivationMonitor)initWithAppActivityMonitor:(id)a3;
- (NSDate)lastActivationDate;
- (NSDate)lastBackgroundDate;
- (void)activityObservingApplicationDidBecomeActive;
- (void)activityObservingApplicationDidEnterBackground;
- (void)setLastActivationDate:(id)a3;
- (void)setLastBackgroundDate:(id)a3;
@end

@implementation FCAppActivationMonitor

- (void)activityObservingApplicationDidBecomeActive
{
  id v3 = [MEMORY[0x1E4F1C9C8] date];
  [(FCAppActivationMonitor *)self setLastActivationDate:v3];
}

- (void)setLastActivationDate:(id)a3
{
}

- (FCAppActivationMonitor)initWithAppActivityMonitor:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)FCAppActivationMonitor;
  v5 = [(FCAppActivationMonitor *)&v7 init];
  if (v5) {
    [v4 addObserver:v5];
  }

  return v5;
}

- (FCAppActivationMonitor)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCAppActivationMonitor init]";
    __int16 v9 = 2080;
    v10 = "FCAppActivationMonitor.m";
    __int16 v11 = 1024;
    int v12 = 21;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  id v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCAppActivationMonitor init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (void)activityObservingApplicationDidEnterBackground
{
  id v3 = [MEMORY[0x1E4F1C9C8] date];
  [(FCAppActivationMonitor *)self setLastBackgroundDate:v3];
}

- (NSDate)lastActivationDate
{
  return (NSDate *)objc_getProperty(self, a2, 8, 1);
}

- (NSDate)lastBackgroundDate
{
  return (NSDate *)objc_getProperty(self, a2, 16, 1);
}

- (void)setLastBackgroundDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastBackgroundDate, 0);
  objc_storeStrong((id *)&self->_lastActivationDate, 0);
}

@end