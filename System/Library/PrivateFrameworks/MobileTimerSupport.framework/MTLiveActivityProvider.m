@interface MTLiveActivityProvider
- (MTLiveActivityProvider)init;
- (void)endActivityForAlarmID:(id)a3;
- (void)startActivityForAlarmID:(id)a3 withFiringDate:(id)a4;
@end

@implementation MTLiveActivityProvider

- (MTLiveActivityProvider)init
{
  v6.receiver = self;
  v6.super_class = (Class)MTLiveActivityProvider;
  v2 = [(MTLiveActivityProvider *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[MTWatchActivityManager shared];
    manager = v2->_manager;
    v2->_manager = (_TtC18MobileTimerSupport22MTWatchActivityManager *)v3;
  }
  return v2;
}

- (void)startActivityForAlarmID:(id)a3 withFiringDate:(id)a4
{
}

- (void)endActivityForAlarmID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end