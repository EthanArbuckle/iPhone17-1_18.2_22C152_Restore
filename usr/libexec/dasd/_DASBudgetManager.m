@interface _DASBudgetManager
+ (id)sharedInstance;
- (BOOL)isWidgetRefreshBudget:(id)a3;
- (NSDictionary)budgets;
- (OS_dispatch_queue)queue;
- (OS_os_log)log;
- (_DASBudgetManager)init;
- (_DASSystemBudgetManager)systemBudgetManager;
- (_DASWidgetRefreshBudgetManager)widgetRefreshBudgetManager;
- (double)balanceForBudgetWithName:(id)a3;
- (double)capacityForBudgetWithName:(id)a3;
- (id)allBudgets;
- (id)budgetKeyPathForBudgetName:(id)a3;
- (void)decrementBy:(double)a3 forBudgetWithName:(id)a4;
- (void)reinstantiateConfiguredBudgets;
- (void)reportActivityNoLongerRunning:(id)a3;
- (void)reportActivityNoLongerRunningWithParameters:(id)a3;
- (void)reportActivityRunning:(id)a3;
- (void)reportActivityRunningWithParameters:(id)a3;
- (void)reportUpdateForActivity:(id)a3 withDataConsumed:(id)a4;
- (void)setBalance:(double)a3 forBudgetWithName:(id)a4;
- (void)setBudgets:(id)a3;
- (void)setCapacity:(double)a3 forBudgetWithName:(id)a4;
- (void)setLog:(id)a3;
- (void)setQueue:(id)a3;
- (void)setSystemBudgetManager:(id)a3;
- (void)setWidgetRefreshBudgetManager:(id)a3;
@end

@implementation _DASBudgetManager

- (void)reportActivityRunningWithParameters:(id)a3
{
  id v4 = a3;
  if (objc_opt_respondsToSelector()) {
    [(_DASWidgetRefreshBudgetManager *)self->_widgetRefreshBudgetManager reportActivityRunningWithParameters:v4];
  }
  if (objc_opt_respondsToSelector()) {
    [(_DASSystemBudgetManager *)self->_systemBudgetManager reportActivityRunningWithParameters:v4];
  }
}

- (_DASBudgetManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)_DASBudgetManager;
  v2 = [(_DASBudgetManager *)&v8 init];
  if (v2)
  {
    uint64_t v3 = +[_DASSystemBudgetManager sharedInstance];
    systemBudgetManager = v2->_systemBudgetManager;
    v2->_systemBudgetManager = (_DASSystemBudgetManager *)v3;

    uint64_t v5 = +[_DASWidgetRefreshBudgetManager sharedInstance];
    widgetRefreshBudgetManager = v2->_widgetRefreshBudgetManager;
    v2->_widgetRefreshBudgetManager = (_DASWidgetRefreshBudgetManager *)v5;
  }
  return v2;
}

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000832C4;
  block[3] = &unk_1001753E0;
  block[4] = a1;
  if (qword_1001C41E8 != -1) {
    dispatch_once(&qword_1001C41E8, block);
  }
  v2 = (void *)qword_1001C41F0;

  return v2;
}

- (id)budgetKeyPathForBudgetName:(id)a3
{
  return [(_DASSystemBudgetManager *)self->_systemBudgetManager budgetKeyPathForBudgetName:a3];
}

- (id)allBudgets
{
  uint64_t v3 = +[NSMutableArray array];
  id v4 = [(_DASSystemBudgetManager *)self->_systemBudgetManager allBudgets];
  [v3 addObjectsFromArray:v4];

  uint64_t v5 = [(_DASWidgetRefreshBudgetManager *)self->_widgetRefreshBudgetManager allBudgets];
  [v3 addObjectsFromArray:v5];

  return v3;
}

- (double)balanceForBudgetWithName:(id)a3
{
  widgetRefreshBudgetManager = self->_widgetRefreshBudgetManager;
  id v5 = a3;
  unsigned int v6 = [(_DASWidgetRefreshBudgetManager *)widgetRefreshBudgetManager managesBudgetWithName:v5];
  uint64_t v7 = 8;
  if (v6) {
    uint64_t v7 = 16;
  }
  [*(id *)((char *)&self->super.isa + v7) balanceForBudgetWithName:v5];
  double v9 = v8;

  return v9;
}

- (double)capacityForBudgetWithName:(id)a3
{
  widgetRefreshBudgetManager = self->_widgetRefreshBudgetManager;
  id v5 = a3;
  unsigned int v6 = [(_DASWidgetRefreshBudgetManager *)widgetRefreshBudgetManager managesBudgetWithName:v5];
  uint64_t v7 = 8;
  if (v6) {
    uint64_t v7 = 16;
  }
  [*(id *)((char *)&self->super.isa + v7) capacityForBudgetWithName:v5];
  double v9 = v8;

  return v9;
}

- (void)reinstantiateConfiguredBudgets
{
  if (objc_opt_respondsToSelector()) {
    [(_DASWidgetRefreshBudgetManager *)self->_widgetRefreshBudgetManager reinstantiateConfiguredBudgets];
  }
  if (objc_opt_respondsToSelector())
  {
    systemBudgetManager = self->_systemBudgetManager;
    [(_DASSystemBudgetManager *)systemBudgetManager reinstantiateConfiguredBudgets];
  }
}

- (void)setBalance:(double)a3 forBudgetWithName:(id)a4
{
  widgetRefreshBudgetManager = self->_widgetRefreshBudgetManager;
  id v9 = a4;
  unsigned int v7 = [(_DASWidgetRefreshBudgetManager *)widgetRefreshBudgetManager managesBudgetWithName:v9];
  uint64_t v8 = 8;
  if (v7) {
    uint64_t v8 = 16;
  }
  [*(id *)((char *)&self->super.isa + v8) setBalance:v9 forBudgetWithName:a3];
}

- (void)decrementBy:(double)a3 forBudgetWithName:(id)a4
{
  widgetRefreshBudgetManager = self->_widgetRefreshBudgetManager;
  id v9 = a4;
  unsigned int v7 = [(_DASWidgetRefreshBudgetManager *)widgetRefreshBudgetManager managesBudgetWithName:v9];
  uint64_t v8 = 8;
  if (v7) {
    uint64_t v8 = 16;
  }
  [*(id *)((char *)&self->super.isa + v8) decrementBy:v9 forBudgetWithName:a3];
}

- (void)setCapacity:(double)a3 forBudgetWithName:(id)a4
{
  widgetRefreshBudgetManager = self->_widgetRefreshBudgetManager;
  id v9 = a4;
  unsigned int v7 = [(_DASWidgetRefreshBudgetManager *)widgetRefreshBudgetManager managesBudgetWithName:v9];
  uint64_t v8 = 8;
  if (v7) {
    uint64_t v8 = 16;
  }
  [*(id *)((char *)&self->super.isa + v8) setCapacity:v9 forBudgetWithName:a3];
}

- (BOOL)isWidgetRefreshBudget:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)reportActivityRunning:(id)a3
{
  id v5 = a3;
  id v4 = [v5 widgetBudgetID];

  if (v4) {
    [(_DASWidgetRefreshBudgetManager *)self->_widgetRefreshBudgetManager reportActivityRunning:v5];
  }
  [(_DASSystemBudgetManager *)self->_systemBudgetManager reportActivityRunning:v5];
}

- (void)reportActivityNoLongerRunning:(id)a3
{
  id v5 = a3;
  id v4 = [v5 widgetBudgetID];

  if (v4) {
    [(_DASWidgetRefreshBudgetManager *)self->_widgetRefreshBudgetManager reportActivityNoLongerRunning:v5];
  }
  [(_DASSystemBudgetManager *)self->_systemBudgetManager reportActivityNoLongerRunning:v5];
}

- (void)reportActivityNoLongerRunningWithParameters:(id)a3
{
  id v4 = a3;
  if (objc_opt_respondsToSelector()) {
    [(_DASWidgetRefreshBudgetManager *)self->_widgetRefreshBudgetManager reportActivityNoLongerRunningWithParameters:v4];
  }
  if (objc_opt_respondsToSelector()) {
    [(_DASSystemBudgetManager *)self->_systemBudgetManager reportActivityNoLongerRunningWithParameters:v4];
  }
}

- (void)reportUpdateForActivity:(id)a3 withDataConsumed:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  if (objc_opt_respondsToSelector()) {
    [(_DASWidgetRefreshBudgetManager *)self->_widgetRefreshBudgetManager reportUpdateForActivity:v7 withDataConsumed:v6];
  }
  if (objc_opt_respondsToSelector()) {
    [(_DASSystemBudgetManager *)self->_systemBudgetManager reportUpdateForActivity:v7 withDataConsumed:v6];
  }
}

- (_DASSystemBudgetManager)systemBudgetManager
{
  return self->_systemBudgetManager;
}

- (void)setSystemBudgetManager:(id)a3
{
}

- (_DASWidgetRefreshBudgetManager)widgetRefreshBudgetManager
{
  return self->_widgetRefreshBudgetManager;
}

- (void)setWidgetRefreshBudgetManager:(id)a3
{
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (NSDictionary)budgets
{
  return self->_budgets;
}

- (void)setBudgets:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_budgets, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_widgetRefreshBudgetManager, 0);

  objc_storeStrong((id *)&self->_systemBudgetManager, 0);
}

@end