@interface _DASDefaultsBudgetPersistence
+ (id)persistence;
- (NSDate)lastModulationDate;
- (NSMutableDictionary)budgetsInfo;
- (NSUserDefaults)defaults;
- (OS_dispatch_queue)queue;
- (OS_os_log)log;
- (_DASDefaultsBudgetPersistence)init;
- (id)convertNameFromCompactToFull:(id)a3;
- (id)convertNameFromFullToCompact:(id)a3;
- (id)loadBudgetsWithExpectedNames:(id)a3;
- (void)saveBudgets:(id)a3;
- (void)saveModulationDate:(id)a3;
- (void)setBudgetsInfo:(id)a3;
- (void)setDefaults:(id)a3;
- (void)setLastModulationDate:(id)a3;
- (void)setLog:(id)a3;
- (void)setQueue:(id)a3;
- (void)updateBudget:(id)a3;
@end

@implementation _DASDefaultsBudgetPersistence

- (_DASDefaultsBudgetPersistence)init
{
  v18.receiver = self;
  v18.super_class = (Class)_DASDefaultsBudgetPersistence;
  v2 = [(_DASDefaultsBudgetPersistence *)&v18 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.dasd.budgetPersistence.defaultsqueue", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    os_log_t v6 = os_log_create("com.apple.duetactivityscheduler", "budgetDefaults");
    log = v2->_log;
    v2->_log = (OS_os_log *)v6;

    v8 = (NSUserDefaults *)[objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.dasd.widgetRefreshBudgets"];
    defaults = v2->_defaults;
    v2->_defaults = v8;

    v10 = [(NSUserDefaults *)v2->_defaults objectForKey:@"budgets"];
    v11 = (NSMutableDictionary *)[v10 mutableCopy];
    budgetsInfo = v2->_budgetsInfo;
    v2->_budgetsInfo = v11;

    if (!v2->_budgetsInfo)
    {
      v13 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      v14 = v2->_budgetsInfo;
      v2->_budgetsInfo = v13;
    }
    uint64_t v15 = [(NSUserDefaults *)v2->_defaults objectForKey:@"lastModulation"];
    lastModulationDate = v2->_lastModulationDate;
    v2->_lastModulationDate = (NSDate *)v15;
  }
  return v2;
}

+ (id)persistence
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001C9E0;
  block[3] = &unk_1001753E0;
  block[4] = a1;
  if (qword_1001C3AB8 != -1) {
    dispatch_once(&qword_1001C3AB8, block);
  }
  v2 = (void *)qword_1001C3AC0;

  return v2;
}

- (id)loadBudgetsWithExpectedNames:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableArray);
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001CAF0;
  block[3] = &unk_100175548;
  block[4] = self;
  id v13 = v4;
  id v7 = v5;
  id v14 = v7;
  id v8 = v4;
  dispatch_sync(queue, block);
  v9 = v14;
  id v10 = v7;

  return v10;
}

- (void)saveBudgets:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001CE2C;
  v7[3] = &unk_100175570;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

- (void)updateBudget:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001D048;
  v7[3] = &unk_100175570;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

- (void)saveModulationDate:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001D184;
  v7[3] = &unk_100175570;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

- (NSDate)lastModulationDate
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = sub_10001D2C0;
  id v10 = sub_10001D2D0;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10001D2D8;
  v5[3] = &unk_100175598;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDate *)v3;
}

- (id)convertNameFromFullToCompact:(id)a3
{
  id v3 = a3;
  id v4 = [v3 copy];
  if ([v3 hasPrefix:@"com.apple.dasd.widget"])
  {
    uint64_t v5 = [v3 substringFromIndex:[@"com.apple.dasd.widget" length]];

    id v4 = (id)v5;
  }

  return v4;
}

- (id)convertNameFromCompactToFull:(id)a3
{
  return +[NSString stringWithFormat:@"%@%@", @"com.apple.dasd.widget", a3];
}

- (NSUserDefaults)defaults
{
  return self->_defaults;
}

- (void)setDefaults:(id)a3
{
}

- (NSMutableDictionary)budgetsInfo
{
  return self->_budgetsInfo;
}

- (void)setBudgetsInfo:(id)a3
{
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void)setLastModulationDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastModulationDate, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_budgetsInfo, 0);

  objc_storeStrong((id *)&self->_defaults, 0);
}

@end