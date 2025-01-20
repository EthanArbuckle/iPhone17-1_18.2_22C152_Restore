@interface DPCBasePolicy
- (BOOL)requireRSSI;
- (DPCBasePolicy)init;
- (DPCStateMachine)stateMachine;
- (DPCTelemetry)telemetry;
- (id)detectedNewErrorBlock;
- (id)detectedNewEventBlock;
- (id)detectedNewWatchStatusEventBlock;
- (unint64_t)onRSSIChange:(id)a3;
- (void)invalidateAbsenceEvent;
- (void)scheduleSendAbsenceEvent;
- (void)setDetectedNewErrorBlock:(id)a3;
- (void)setDetectedNewEventBlock:(id)a3;
- (void)setDetectedNewWatchStatusEventBlock:(id)a3;
- (void)setRequireRSSI:(BOOL)a3;
- (void)setStateMachine:(id)a3;
- (void)setTelemetry:(id)a3;
@end

@implementation DPCBasePolicy

- (DPCBasePolicy)init
{
  v9.receiver = self;
  v9.super_class = (Class)DPCBasePolicy;
  v2 = [(DPCBasePolicy *)&v9 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency((dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_USER_INTERACTIVE, 0);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.watchpresenced.fireQueue", v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    v7 = +[DPCTelemetry sharedInstance];
    [(DPCBasePolicy *)v2 setTelemetry:v7];
  }
  return v2;
}

- (void)invalidateAbsenceEvent
{
  id absenceEventBlock = self->_absenceEventBlock;
  if (absenceEventBlock)
  {
    dispatch_block_cancel(absenceEventBlock);
    id v4 = self->_absenceEventBlock;
    self->_id absenceEventBlock = 0;
  }
}

- (void)scheduleSendAbsenceEvent
{
  [(DPCBasePolicy *)self invalidateAbsenceEvent];
  v3 = sub_100006A24((uint64_t)off_100016CB8);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Kicking off Absence Event timer.", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472;
  v12 = sub_10000544C;
  v13 = &unk_1000104E8;
  objc_copyWeak(&v15, buf);
  v14 = self;
  dispatch_block_t v4 = dispatch_block_create(DISPATCH_BLOCK_INHERIT_QOS_CLASS, &v10);
  id absenceEventBlock = self->_absenceEventBlock;
  self->_id absenceEventBlock = v4;

  v6 = +[DPCDefaults sharedInstance];
  v7 = [v6 NSNumberForDefault:@"DPCDefaultsHoldOffSec"];
  [v7 floatValue];
  dispatch_time_t v9 = dispatch_time(0, (uint64_t)(float)(v8 * 1000000000.0) + 1);
  dispatch_after(v9, (dispatch_queue_t)self->_queue, self->_absenceEventBlock);

  objc_destroyWeak(&v15);
  objc_destroyWeak(buf);
}

- (unint64_t)onRSSIChange:(id)a3
{
  return 0;
}

- (id)detectedNewEventBlock
{
  return objc_getProperty(self, a2, 32, 1);
}

- (void)setDetectedNewEventBlock:(id)a3
{
}

- (id)detectedNewErrorBlock
{
  return objc_getProperty(self, a2, 40, 1);
}

- (void)setDetectedNewErrorBlock:(id)a3
{
}

- (id)detectedNewWatchStatusEventBlock
{
  return objc_getProperty(self, a2, 48, 1);
}

- (void)setDetectedNewWatchStatusEventBlock:(id)a3
{
}

- (BOOL)requireRSSI
{
  return self->_requireRSSI;
}

- (void)setRequireRSSI:(BOOL)a3
{
  self->_requireRSSI = a3;
}

- (DPCStateMachine)stateMachine
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_stateMachine);

  return (DPCStateMachine *)WeakRetained;
}

- (void)setStateMachine:(id)a3
{
}

- (DPCTelemetry)telemetry
{
  return (DPCTelemetry *)objc_getProperty(self, a2, 64, 1);
}

- (void)setTelemetry:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_telemetry, 0);
  objc_destroyWeak((id *)&self->_stateMachine);
  objc_storeStrong(&self->_detectedNewWatchStatusEventBlock, 0);
  objc_storeStrong(&self->_detectedNewErrorBlock, 0);
  objc_storeStrong(&self->_detectedNewEventBlock, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong(&self->_absenceEventBlock, 0);
}

@end