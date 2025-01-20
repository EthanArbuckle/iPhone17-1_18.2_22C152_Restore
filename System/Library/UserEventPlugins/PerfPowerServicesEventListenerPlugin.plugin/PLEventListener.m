@interface PLEventListener
+ (BOOL)hasBattery;
- (PLEventListener)initWithQueue:(id)a3;
- (void)dealloc;
- (void)registerForThermalNotification;
@end

@implementation PLEventListener

- (PLEventListener)initWithQueue:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PLEventListener;
  v4 = [(PLEventListener *)&v6 init];
  if (v4)
  {
    v4->_powerEventListener = [[PLPowerEventListener alloc] initWithQueue:a3];
    v4->_aggregateLogger = objc_alloc_init(PLAggregateLogger);
    [(PLEventListener *)v4 registerForThermalNotification];
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)PLEventListener;
  [(PLEventListener *)&v3 dealloc];
}

- (void)registerForThermalNotification
{
  if (qword_13DF8 != -1) {
    dispatch_once(&qword_13DF8, &stru_10650);
  }
}

+ (BOOL)hasBattery
{
  if (qword_13E08 != -1) {
    dispatch_once(&qword_13E08, &stru_106B0);
  }
  return byte_13E04;
}

@end