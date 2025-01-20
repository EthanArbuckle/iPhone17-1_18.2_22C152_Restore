@interface BYPowerLogAnalyticsManager
+ (id)nameForPowerLogEventType:(unint64_t)a3;
+ (id)persistenceKeyForPowerLogEventType:(unint64_t)a3;
- (BOOL)_shouldCommitEvent:(unint64_t)a3;
- (BYPowerLogAnalyticsManager)initWithPreferences:(id)a3;
- (BYPreferencesController)preferencesController;
- (NSMutableArray)events;
- (void)_persistIfApplicable:(unint64_t)a3;
- (void)_submitPayload:(id)a3;
- (void)addEvent:(id)a3;
- (void)commit;
- (void)setEvents:(id)a3;
- (void)setPreferencesController:(id)a3;
@end

@implementation BYPowerLogAnalyticsManager

- (BYPowerLogAnalyticsManager)initWithPreferences:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)BYPowerLogAnalyticsManager;
  v6 = [(BYPowerLogAnalyticsManager *)&v10 init];
  if (v6)
  {
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    events = v6->_events;
    v6->_events = v7;

    objc_storeStrong((id *)&v6->_preferencesController, a3);
  }

  return v6;
}

- (void)addEvent:(id)a3
{
}

- (void)commit
{
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  while ([(NSMutableArray *)self->_events count])
  {
    v3 = [(NSMutableArray *)self->_events objectAtIndex:0];
    [(NSMutableArray *)self->_events removeObjectAtIndex:0];
    if (v3)
    {
      if (-[BYPowerLogAnalyticsManager _shouldCommitEvent:](self, "_shouldCommitEvent:", [v3 type]))
      {
        v4 = objc_msgSend((id)objc_opt_class(), "nameForPowerLogEventType:", objc_msgSend(v3, "type"));
        id v5 = [v3 payload];
        [v6 setObject:v5 forKeyedSubscript:v4];

        -[BYPowerLogAnalyticsManager _persistIfApplicable:](self, "_persistIfApplicable:", [v3 type]);
      }
    }
  }
  if ([v6 count]) {
    [(BYPowerLogAnalyticsManager *)self _submitPayload:v6];
  }
}

- (void)_submitPayload:(id)a3
{
  id v3 = a3;
  v4 = _BYLoggingFacility();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1A7DED000, v4, OS_LOG_TYPE_DEFAULT, "Submit power log events.", v5, 2u);
  }

  if (_submitPayload__onceToken != -1) {
    dispatch_once(&_submitPayload__onceToken, &__block_literal_global_10);
  }
  PPSSendTelemetry();
}

uint64_t __45__BYPowerLogAnalyticsManager__submitPayload___block_invoke()
{
  uint64_t result = PPSCreateTelemetryIdentifier();
  _submitPayload__buddyPowerLogStream = result;
  return result;
}

- (BOOL)_shouldCommitEvent:(unint64_t)a3
{
  if (!self->_preferencesController)
  {
    id v10 = [MEMORY[0x1E4F1CA00] exceptionWithName:@"Preferences controller is missing" reason:0 userInfo:0];
    objc_exception_throw(v10);
  }
  v4 = [(id)objc_opt_class() persistenceKeyForPowerLogEventType:a3];
  if (v4)
  {
    id v5 = [(BYPreferencesController *)self->_preferencesController objectForKey:@"PowerLogSubmittedEvents"];
    id v6 = (void *)[v5 mutableCopy];

    if (v6)
    {
      v7 = [v6 objectForKey:v4];
      BOOL v8 = v7 == 0;
    }
    else
    {
      BOOL v8 = 1;
    }
  }
  else
  {
    BOOL v8 = 1;
  }

  return v8;
}

- (void)_persistIfApplicable:(unint64_t)a3
{
  if (!self->_preferencesController)
  {
    id v9 = [MEMORY[0x1E4F1CA00] exceptionWithName:@"Preferences controller is missing" reason:0 userInfo:0];
    objc_exception_throw(v9);
  }
  v4 = [(id)objc_opt_class() persistenceKeyForPowerLogEventType:a3];
  if (v4)
  {
    id v10 = v4;
    id v5 = [(BYPreferencesController *)self->_preferencesController objectForKey:@"PowerLogSubmittedEvents"];
    id v6 = (id)[v5 mutableCopy];

    if (!v6) {
      id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    }
    [v6 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:v10];
    preferencesController = self->_preferencesController;
    BOOL v8 = (void *)[v6 copy];
    [(BYPreferencesController *)preferencesController setObject:v8 forKey:@"PowerLogSubmittedEvents" persistImmediately:1];

    v4 = v10;
  }
}

+ (id)nameForPowerLogEventType:(unint64_t)a3
{
  id v3 = &stru_1EFE45E30;
  if (a3 == 1) {
    id v3 = @"TransferMethod";
  }
  if (a3) {
    return v3;
  }
  else {
    return @"SetupDate";
  }
}

+ (id)persistenceKeyForPowerLogEventType:(unint64_t)a3
{
  id v3 = @"TransferMethod";
  if (a3 != 1) {
    id v3 = 0;
  }
  if (a3) {
    return v3;
  }
  else {
    return @"SetupDate";
  }
}

- (NSMutableArray)events
{
  return self->_events;
}

- (void)setEvents:(id)a3
{
}

- (BYPreferencesController)preferencesController
{
  return self->_preferencesController;
}

- (void)setPreferencesController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferencesController, 0);
  objc_storeStrong((id *)&self->_events, 0);
}

@end