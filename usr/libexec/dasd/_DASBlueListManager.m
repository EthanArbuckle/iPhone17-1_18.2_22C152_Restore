@interface _DASBlueListManager
+ (id)managerWithContext:(id)a3;
+ (int64_t)nextHoursBudgetWithPreviousBudget:(int64_t)a3;
- (BOOL)blueListEnabled;
- (BOOL)shouldBlueListPushes;
- (OS_dispatch_source)budgetResetTimer;
- (_CDContextualKeyPath)blueListKeyPath;
- (_CDContextualKeyPath)pushBudgetKeyPath;
- (_CDContextualKeyPath)pushBudgetResetKeyPath;
- (_CDLocalContext)context;
- (_DASBlueListManager)initWithContext:(id)a3;
- (int)lpmNotifyToken;
- (int64_t)pushBudget;
- (void)decrementPushBudgetRemaining;
- (void)registerForBlueListNotifications;
- (void)setBlueListEnabled:(BOOL)a3;
- (void)setBlueListKeyPath:(id)a3;
- (void)setBudgetResetTimer:(id)a3;
- (void)setContext:(id)a3;
- (void)setLpmNotifyToken:(int)a3;
- (void)setPushBudget:(int64_t)a3;
- (void)setPushBudgetKeyPath:(id)a3;
- (void)setPushBudgetResetKeyPath:(id)a3;
- (void)setupResetTimer;
- (void)updateBlueListStatus:(BOOL)a3;
- (void)updateBudgetsForNextSlot;
- (void)updateGlobalBudget:(int64_t)a3;
@end

@implementation _DASBlueListManager

+ (int64_t)nextHoursBudgetWithPreviousBudget:(int64_t)a3
{
  double v3 = (double)(a3 + 8);
  if (v3 > 12.0) {
    return (uint64_t)12.0;
  }
  return (uint64_t)v3;
}

+ (id)managerWithContext:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) initWithContext:v4];

  return v5;
}

- (_DASBlueListManager)initWithContext:(id)a3
{
  id v5 = a3;
  v23.receiver = self;
  v23.super_class = (Class)_DASBlueListManager;
  v6 = [(_DASBlueListManager *)&v23 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_context, a3);
    uint64_t v8 = +[_CDContextualKeyPath keyPathWithKey:@"/push/bluelist"];
    blueListKeyPath = v7->_blueListKeyPath;
    v7->_blueListKeyPath = (_CDContextualKeyPath *)v8;

    uint64_t v10 = +[_CDContextualKeyPath keyPathWithKey:@"/push/globalBudget"];
    pushBudgetKeyPath = v7->_pushBudgetKeyPath;
    v7->_pushBudgetKeyPath = (_CDContextualKeyPath *)v10;

    uint64_t v12 = +[_CDContextualKeyPath keyPathWithKey:@"/push/globalBudgetResetDate"];
    pushBudgetResetKeyPath = v7->_pushBudgetResetKeyPath;
    v7->_pushBudgetResetKeyPath = (_CDContextualKeyPath *)v12;

    v14 = [(_CDLocalContext *)v7->_context objectForKeyedSubscript:v7->_blueListKeyPath];
    v7->_blueListEnabled = [v14 BOOLValue];

    v15 = [(_CDLocalContext *)v7->_context objectForKeyedSubscript:v7->_pushBudgetKeyPath];
    v16 = v15;
    if (v15) {
      v7->_pushBudget = (int64_t)[v15 integerValue];
    }
    else {
      [(_DASBlueListManager *)v7 updateGlobalBudget:8];
    }
    v17 = +[NSDate date];
    v18 = [(_CDLocalContext *)v7->_context objectForKeyedSubscript:v7->_pushBudgetResetKeyPath];
    v19 = v18;
    if (v18 && ([v18 timeIntervalSinceDate:v17], v20 >= 0.0))
    {
      v21 = v19;
    }
    else
    {
      v21 = +[NSDate dateWithTimeInterval:v17 sinceDate:3600.0];

      [(_CDLocalContext *)v7->_context setObject:v21 forKeyedSubscript:v7->_pushBudgetResetKeyPath];
      if (v16) {
        [(_DASBlueListManager *)v7 updateBudgetsForNextSlot];
      }
    }
    [(_DASBlueListManager *)v7 registerForBlueListNotifications];
    [(_DASBlueListManager *)v7 setupResetTimer];
  }
  return v7;
}

- (void)updateGlobalBudget:(int64_t)a3
{
  obj = self;
  objc_sync_enter(obj);
  obj->_pushBudget = a3 & ~(a3 >> 63);
  id v4 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:");
  [(_CDLocalContext *)obj->_context setObject:v4 forKeyedSubscript:obj->_pushBudgetKeyPath];

  [(_DASBlueListManager *)obj updateBlueListStatus:[(_DASBlueListManager *)obj shouldBlueListPushes]];
  objc_sync_exit(obj);
}

- (void)updateBudgetsForNextSlot
{
  id v3 = [(id)objc_opt_class() nextHoursBudgetWithPreviousBudget:self->_pushBudget];

  [(_DASBlueListManager *)self updateGlobalBudget:v3];
}

- (void)decrementPushBudgetRemaining
{
  obj = self;
  objc_sync_enter(obj);
  [(_DASBlueListManager *)obj updateGlobalBudget:obj->_pushBudget - 1];
  objc_sync_exit(obj);
}

- (void)setupResetTimer
{
  id v3 = dispatch_get_global_queue(-32768, 0);
  id v4 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v3);
  budgetResetTimer = self->_budgetResetTimer;
  self->_budgetResetTimer = v4;

  v6 = self->_budgetResetTimer;
  dispatch_time_t v7 = dispatch_walltime(0, 3600000000000);
  dispatch_source_set_timer(v6, v7, 0x34630B8A000uLL, 0x174876E800uLL);
  uint64_t v8 = self->_budgetResetTimer;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100097E90;
  handler[3] = &unk_1001754F8;
  handler[4] = self;
  dispatch_source_set_event_handler(v8, handler);
  dispatch_resume((dispatch_object_t)self->_budgetResetTimer);
}

- (void)updateBlueListStatus:(BOOL)a3
{
  BOOL v3 = a3;
  obj = self;
  objc_sync_enter(obj);
  id v4 = obj;
  if (obj->_blueListEnabled != v3)
  {
    id v5 = +[NSNumber numberWithBool:v3];
    [(_CDLocalContext *)obj->_context setObject:v5 forKeyedSubscript:obj->_blueListKeyPath];

    id v4 = obj;
    obj->_blueListEnabled = v3;
  }
  objc_sync_exit(v4);
}

- (BOOL)shouldBlueListPushes
{
  context = self->_context;
  id v4 = +[_CDContextQueries keyPathForThermalPressureLevel];
  id v5 = [(_CDLocalContext *)context objectForKeyedSubscript:v4];
  int v6 = [v5 intValue];

  if (v6 > 20 || self->_pushBudget < 1) {
    return 1;
  }
  if (+[_DASSystemContext isPluggedIn:self->_context]) {
    return 0;
  }
  v9 = self->_context;
  uint64_t v10 = +[_CDContextQueries keyPathForBatteryLevel];
  v11 = [(_CDLocalContext *)v9 objectForKeyedSubscript:v10];
  int v12 = [v11 intValue];

  v13 = self->_context;
  v14 = +[_CDContextQueries keyPathForWiFiConnectionQuality];
  v15 = [(_CDLocalContext *)v13 objectForKeyedSubscript:v14];

  v16 = self->_context;
  v17 = +[_CDContextQueries keyPathForWiredConnectionQuality];
  v18 = [(_CDLocalContext *)v16 objectForKeyedSubscript:v17];

  v19 = self->_context;
  double v20 = +[_CDContextQueries keyPathForCellConnectionQuality];
  v21 = [(_CDLocalContext *)v19 objectForKeyedSubscript:v20];

  BOOL v22 = (uint64_t)[v15 integerValue] <= 49
     && (uint64_t)[v18 integerValue] <= 49
     && (uint64_t)[v21 integerValue] < 100;
  objc_super v23 = +[NSProcessInfo processInfo];
  unsigned __int8 v24 = [v23 isLowPowerModeEnabled];

  if (v12 >= 21) {
    char v7 = v22 | v24;
  }
  else {
    char v7 = 1;
  }

  return v7;
}

- (void)registerForBlueListNotifications
{
  uint64_t v3 = +[_CDContextQueries keyPathForThermalPressureLevel];
  v16 = +[_CDContextQueries keyPathForPluginStatus];
  uint64_t v4 = +[_CDContextQueries keyPathForWiFiConnectionQuality];
  uint64_t v5 = +[_CDContextQueries keyPathForWiredConnectionQuality];
  int v6 = +[_CDContextQueries keyPathForCellConnectionQuality];
  objc_super v23 = (void *)v3;
  double v20 = +[_CDContextualPredicate predicateForKeyPath:v3, @"self.%@.value > %@", v3, &off_100187210 withFormat];
  BOOL v22 = (void *)v4;
  v19 = +[_CDContextualPredicate predicateForKeyPath:v4, @"self.%@.value < %@", v4, &off_100187228 withFormat];
  v21 = (void *)v5;
  v18 = +[_CDContextualPredicate predicateForKeyPath:v5, @"self.%@.value < %@", v5, &off_100187228 withFormat];
  v17 = +[_CDContextualPredicate predicateForKeyPath:v6, @"self.%@.value < %@", v6, &off_100187240 withFormat];
  v26[0] = v20;
  v26[1] = v19;
  v26[2] = v18;
  v26[3] = v17;
  char v7 = +[NSArray arrayWithObjects:v26 count:4];
  uint64_t v8 = +[_CDContextualPredicate andPredicateWithSubpredicates:v7];

  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_10009853C;
  v25[3] = &unk_1001759F8;
  v25[4] = self;
  v9 = objc_retainBlock(v25);
  uint64_t v10 = +[_CDContextualChangeRegistration localNonWakingRegistrationWithIdentifier:@"com.apple.dasd.blueListEnable" contextualPredicate:v8 callback:v9];
  v11 = +[_CDContextualPredicate notPredicateWithSubpredicate:v8];
  int v12 = +[_CDContextualChangeRegistration localNonWakingRegistrationWithIdentifier:@"com.apple.dasd.blueListEnable" contextualPredicate:v11 callback:v9];

  v13 = +[_CDContextualPredicate predicateForChangeAtKeyPath:v16];
  v14 = +[_CDContextualChangeRegistration localNonWakingRegistrationWithIdentifier:@"com.apple.dasd.blueListPlugin" contextualPredicate:v13 callback:v9];

  [(_CDLocalContext *)self->_context registerCallback:v10];
  [(_CDLocalContext *)self->_context registerCallback:v12];
  [(_CDLocalContext *)self->_context registerCallback:v14];
  [(_DASBlueListManager *)self updateBlueListStatus:[(_DASBlueListManager *)self shouldBlueListPushes]];
  v15 = dispatch_get_global_queue(-32768, 0);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100098658;
  handler[3] = &unk_1001759D0;
  handler[4] = self;
  notify_register_dispatch("com.apple.system.lowpowermode", &self->_lpmNotifyToken, v15, handler);
}

- (_CDLocalContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (_CDContextualKeyPath)blueListKeyPath
{
  return self->_blueListKeyPath;
}

- (void)setBlueListKeyPath:(id)a3
{
}

- (_CDContextualKeyPath)pushBudgetKeyPath
{
  return self->_pushBudgetKeyPath;
}

- (void)setPushBudgetKeyPath:(id)a3
{
}

- (_CDContextualKeyPath)pushBudgetResetKeyPath
{
  return self->_pushBudgetResetKeyPath;
}

- (void)setPushBudgetResetKeyPath:(id)a3
{
}

- (int64_t)pushBudget
{
  return self->_pushBudget;
}

- (void)setPushBudget:(int64_t)a3
{
  self->_pushBudget = a3;
}

- (OS_dispatch_source)budgetResetTimer
{
  return self->_budgetResetTimer;
}

- (void)setBudgetResetTimer:(id)a3
{
}

- (BOOL)blueListEnabled
{
  return self->_blueListEnabled;
}

- (void)setBlueListEnabled:(BOOL)a3
{
  self->_blueListEnabled = a3;
}

- (int)lpmNotifyToken
{
  return self->_lpmNotifyToken;
}

- (void)setLpmNotifyToken:(int)a3
{
  self->_lpmNotifyToken = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_budgetResetTimer, 0);
  objc_storeStrong((id *)&self->_pushBudgetResetKeyPath, 0);
  objc_storeStrong((id *)&self->_pushBudgetKeyPath, 0);
  objc_storeStrong((id *)&self->_blueListKeyPath, 0);

  objc_storeStrong((id *)&self->_context, 0);
}

@end