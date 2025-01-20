@interface STConcretePrimitiveBackgroundActivityScheduler
- (NSMutableDictionary)scheduledActivitiesByType;
- (STConcretePrimitiveBackgroundActivityScheduler)init;
- (STPrimitiveBackgroundActivitySchedulerDelegate)delegate;
- (void)invalidateBackgroundActivityOfType:(int64_t)a3;
- (void)scheduleBackgroundActivityOfType:(int64_t)a3 interval:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation STConcretePrimitiveBackgroundActivityScheduler

- (STConcretePrimitiveBackgroundActivityScheduler)init
{
  v6.receiver = self;
  v6.super_class = (Class)STConcretePrimitiveBackgroundActivityScheduler;
  v2 = [(STConcretePrimitiveBackgroundActivityScheduler *)&v6 init];
  uint64_t v3 = objc_opt_new();
  scheduledActivitiesByType = v2->_scheduledActivitiesByType;
  v2->_scheduledActivitiesByType = (NSMutableDictionary *)v3;

  return v2;
}

- (void)scheduleBackgroundActivityOfType:(int64_t)a3 interval:(id)a4
{
  id v6 = a4;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10001C368;
  v10[3] = &unk_1002FBC38;
  v10[4] = self;
  v7 = [[STConcretePrimitiveBackgroundActivity alloc] initWithType:a3 interval:v6 willBegin:v10 didEnd:&stru_1002FBC78];

  v8 = [(STConcretePrimitiveBackgroundActivityScheduler *)self scheduledActivitiesByType];
  v9 = +[NSNumber numberWithInteger:a3];
  [v8 setObject:v7 forKeyedSubscript:v9];
}

- (void)invalidateBackgroundActivityOfType:(int64_t)a3
{
  id v6 = [(STConcretePrimitiveBackgroundActivityScheduler *)self scheduledActivitiesByType];
  v4 = +[NSNumber numberWithInteger:a3];
  v5 = [v6 objectForKeyedSubscript:v4];
  [v5 invalidate];
}

- (STPrimitiveBackgroundActivitySchedulerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);
  return (STPrimitiveBackgroundActivitySchedulerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSMutableDictionary)scheduledActivitiesByType
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scheduledActivitiesByType, 0);
  objc_destroyWeak((id *)&self->delegate);
}

@end