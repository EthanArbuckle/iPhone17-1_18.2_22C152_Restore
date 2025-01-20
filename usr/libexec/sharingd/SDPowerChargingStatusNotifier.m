@interface SDPowerChargingStatusNotifier
+ (id)sharedNotifier;
- (OS_dispatch_queue)internalQueue;
- (SDPowerChargingStatusNotifier)init;
- (void)notifyBatteryStatus;
- (void)setInternalQueue:(id)a3;
@end

@implementation SDPowerChargingStatusNotifier

- (SDPowerChargingStatusNotifier)init
{
  v7.receiver = self;
  v7.super_class = (Class)SDPowerChargingStatusNotifier;
  v2 = [(SDPowerChargingStatusNotifier *)&v7 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.sharing.powerStatusNotifier", v3);
    internalQueue = v2->_internalQueue;
    v2->_internalQueue = (OS_dispatch_queue *)v4;
  }
  return v2;
}

+ (id)sharedNotifier
{
  if (qword_1009801E0 != -1) {
    dispatch_once(&qword_1009801E0, &stru_1008CF138);
  }
  v2 = (void *)qword_1009801D8;

  return v2;
}

- (void)notifyBatteryStatus
{
}

- (OS_dispatch_queue)internalQueue
{
  return self->_internalQueue;
}

- (void)setInternalQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end