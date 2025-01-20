@interface UISApplicationState
- (BOOL)_usesBackgroundNetwork;
- (NSDate)_nextWakeDate;
- (UISApplicationState)init;
- (UISApplicationState)initWithBundleIdentifier:(id)a3;
- (id)badgeValue;
- (id)initForCurrentApplication;
- (void)_setMinimumBackgroundFetchInterval:(double)a3;
- (void)_setNextWakeDate:(id)a3;
- (void)_setUsesBackgroundNetwork:(BOOL)a3;
- (void)dealloc;
- (void)setBadgeValue:(id)a3;
@end

@implementation UISApplicationState

- (id)initForCurrentApplication
{
  v3 = [MEMORY[0x1E4F28B50] mainBundle];
  v4 = [v3 bundleIdentifier];
  v5 = [(UISApplicationState *)self initWithBundleIdentifier:v4];

  return v5;
}

- (UISApplicationState)initWithBundleIdentifier:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)UISApplicationState;
  v6 = [(UISApplicationState *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_bundleIdentifier, a3);
    v8 = [[UISApplicationStateClient alloc] initWithBundleIdentifier:v5];
    client = v7->_client;
    v7->_client = v8;
  }
  return v7;
}

- (void)setBadgeValue:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v5 = _UISStateServiceLogger();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = [MEMORY[0x1E4F62878] processHandle];
      bundleIdentifier = self->_bundleIdentifier;
      int v8 = 138543874;
      v9 = v6;
      __int16 v10 = 2114;
      objc_super v11 = bundleIdentifier;
      __int16 v12 = 2114;
      id v13 = v4;
      _os_log_impl(&dword_191ABF000, v5, OS_LOG_TYPE_DEFAULT, "Client \"%{public}@\" is requesting to change the badge value of %{public}@ to %{public}@", (uint8_t *)&v8, 0x20u);
    }
    [(UISApplicationStateClient *)self->_client setBadgeValue:v4];
  }
}

- (id)badgeValue
{
  return [(UISApplicationStateClient *)self->_client badgeValue];
}

- (void)dealloc
{
  [(UISApplicationStateClient *)self->_client invalidate];
  v3.receiver = self;
  v3.super_class = (Class)UISApplicationState;
  [(UISApplicationState *)&v3 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

- (void)_setMinimumBackgroundFetchInterval:(double)a3
{
}

- (UISApplicationState)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"UISApplicationState.m" lineNumber:27 description:@"[-init] is unavailable for UIApplicationState."];

  return 0;
}

- (BOOL)_usesBackgroundNetwork
{
  return [(UISApplicationStateClient *)self->_client usesBackgroundNetwork];
}

- (void)_setUsesBackgroundNetwork:(BOOL)a3
{
}

- (NSDate)_nextWakeDate
{
  [(UISApplicationStateClient *)self->_client nextWakeIntervalSinceReferenceDate];
  if (v2 == -1.0)
  {
    objc_super v3 = 0;
  }
  else
  {
    objc_super v3 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceReferenceDate:");
  }
  return (NSDate *)v3;
}

- (void)_setNextWakeDate:(id)a3
{
  client = self->_client;
  [a3 timeIntervalSinceReferenceDate];
  -[UISApplicationStateClient setNextWakeIntervalSinceReferenceDate:](client, "setNextWakeIntervalSinceReferenceDate:");
}

@end