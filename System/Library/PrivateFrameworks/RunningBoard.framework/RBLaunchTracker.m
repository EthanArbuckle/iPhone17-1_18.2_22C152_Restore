@interface RBLaunchTracker
- (RBLaunchTracker)initWithTimeProvider:(id)a3;
- (double)nextAllowedLaunchOfIdentity:(id)a3;
- (void)trackLaunchOfIdentity:(id)a3;
@end

@implementation RBLaunchTracker

- (double)nextAllowedLaunchOfIdentity:(id)a3
{
  timeProvider = self->_timeProvider;
  id v5 = a3;
  [(RBTimeProviding *)timeProvider currentTime];
  double v7 = v6;
  v8 = [(NSMutableDictionary *)self->_launchBeforeLast objectForKey:v5];

  double v9 = 0.0;
  if (v8)
  {
    [v8 doubleValue];
    if (v7 - v10 < 10.0)
    {
      [v8 doubleValue];
      double v9 = v11 + 10.0;
    }
  }

  return v9;
}

- (void)trackLaunchOfIdentity:(id)a3
{
  id v4 = a3;
  if ([v4 isMultiInstanceExtension]) {
    goto LABEL_15;
  }
  [(RBTimeProviding *)self->_timeProvider currentTime];
  double v6 = v5;
  double v7 = [(NSMutableDictionary *)self->_lastLaunch objectForKey:v4];
  uint64_t v8 = [(NSMutableDictionary *)self->_launchBeforeLast objectForKey:v4];
  double v9 = (void *)v8;
  if (v7)
  {
    [v7 doubleValue];
    BOOL v11 = v6 - v10 < 10.0;
    if (!v9) {
      goto LABEL_10;
    }
LABEL_6:
    [v9 doubleValue];
    if (v6 - v12 < 10.0)
    {
      v13 = rbs_general_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
        -[RBLaunchTracker trackLaunchOfIdentity:](v13);
      }
    }
    goto LABEL_10;
  }
  BOOL v11 = 0;
  if (v8) {
    goto LABEL_6;
  }
LABEL_10:
  lastLaunch = self->_lastLaunch;
  v15 = [NSNumber numberWithDouble:v6];
  [(NSMutableDictionary *)lastLaunch setObject:v15 forKey:v4];

  if (v11)
  {
    [(NSMutableDictionary *)self->_launchBeforeLast setObject:v7 forKey:v4];
  }
  else if (v9)
  {
    [(NSMutableDictionary *)self->_launchBeforeLast removeObjectForKey:v4];
  }

LABEL_15:
}

- (RBLaunchTracker)initWithTimeProvider:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)RBLaunchTracker;
  double v6 = [(RBLaunchTracker *)&v13 init];
  if (v6)
  {
    uint64_t v7 = [MEMORY[0x263EFF9A0] dictionary];
    lastLaunch = v6->_lastLaunch;
    v6->_lastLaunch = (NSMutableDictionary *)v7;

    uint64_t v9 = [MEMORY[0x263EFF9A0] dictionary];
    launchBeforeLast = v6->_launchBeforeLast;
    v6->_launchBeforeLast = (NSMutableDictionary *)v9;

    objc_storeStrong((id *)&v6->_timeProvider, a3);
    BOOL v11 = v6;
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeProvider, 0);
  objc_storeStrong((id *)&self->_launchBeforeLast, 0);
  objc_storeStrong((id *)&self->_lastLaunch, 0);
}

- (void)trackLaunchOfIdentity:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_226AB3000, log, OS_LOG_TYPE_FAULT, "tracking a launch of an identity that shouldn't have been allowed", v1, 2u);
}

@end