@interface SATime
- (BOOL)isReplay;
- (NSDate)now;
- (NSMutableSet)ongoingAlarms;
- (SATime)initWithExternalTimer:(id)a3 isReplay:(BOOL)a4;
- (SATimeEventRequestProtocol)externalTimer;
- (id)earliestAlarm;
- (id)getCurrentTime;
- (id)getEarliestAlarmDate;
- (id)setupAlarmFireAt:(id)a3 forClient:(id)a4;
- (unint64_t)alarmCount;
- (void)addAlarm:(id)a3;
- (void)advanceTimeWithEvent:(id)a3;
- (void)alarmFired:(id)a3;
- (void)alarmQueue;
- (void)cancelAlarmWithUUID:(id)a3;
- (void)dealloc;
- (void)fireAlarmsIfReady;
- (void)popAlarm;
- (void)setAlarmQueue:(void *)a3;
- (void)setExternalTimer:(id)a3;
- (void)setIsReplay:(BOOL)a3;
- (void)setOngoingAlarms:(id)a3;
@end

@implementation SATime

- (void)advanceTimeWithEvent:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 getDate];
  v6 = [MEMORY[0x1E4F1C9C8] now];
  uint64_t v7 = [v5 compare:v6];

  if (v7 == 1)
  {
    v8 = (id)TASALog;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = [v4 description];
      v15[0] = 68289283;
      v15[1] = 0;
      __int16 v16 = 2082;
      v17 = "";
      __int16 v18 = 2113;
      v19 = v9;
      _os_log_impl(&dword_1D15FC000, v8, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#SATime received event with future date\", \"Event\":\"%{private}@\"}", (uint8_t *)v15, 0x1Cu);
    }
  }
  else
  {
    now = self->_now;
    v11 = [v4 getDate];
    uint64_t v12 = [(NSDate *)now compare:v11];

    if (v12 == -1)
    {
      v13 = [v4 getDate];
      v14 = self->_now;
      self->_now = v13;
    }
    [(SATime *)self fireAlarmsIfReady];
  }
}

- (void)fireAlarmsIfReady
{
  id v8 = [(SATime *)self earliestAlarm];
  if (v8)
  {
    while (1)
    {
      v3 = [(SATime *)self now];
      id v4 = [v8 fireDate];
      uint64_t v5 = [v3 compare:v4];

      if (v5 == -1) {
        break;
      }
      [(SATime *)self alarmFired:v8];
      [(SATime *)self popAlarm];
      uint64_t v6 = [(SATime *)self earliestAlarm];

      id v8 = (id)v6;
      if (!v6)
      {
        uint64_t v7 = 0;
        goto LABEL_7;
      }
    }
    uint64_t v7 = v8;
LABEL_7:
  }
}

- (id)earliestAlarm
{
  v3 = [(SATime *)self alarmQueue];
  if (*v3 == v3[1]) {
    id v4 = 0;
  }
  else {
    id v4 = **(id **)[(SATime *)self alarmQueue];
  }
  return v4;
}

- (void)alarmQueue
{
  return self->_alarmQueue;
}

- (SATime)initWithExternalTimer:(id)a3 isReplay:(BOOL)a4
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SATime;
  uint64_t v6 = [(SATime *)&v12 init];
  if (v6)
  {
    uint64_t v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    ongoingAlarms = v6->_ongoingAlarms;
    v6->_ongoingAlarms = v7;

    uint64_t v9 = [MEMORY[0x1E4F1C9C8] distantPast];
    now = v6->_now;
    v6->_now = (NSDate *)v9;

    operator new();
  }

  return 0;
}

- (void)dealloc
{
  alarmQueue = self->_alarmQueue;
  if (alarmQueue)
  {
    id v5 = (void **)self->_alarmQueue;
    std::vector<SAAlarmTask * {__strong}>::__destroy_vector::operator()[abi:ne180100](&v5);
    MEMORY[0x1D25F7B10](alarmQueue, 0x80C402512154ALL);
  }
  self->_alarmQueue = 0;
  v4.receiver = self;
  v4.super_class = (Class)SATime;
  [(SATime *)&v4 dealloc];
}

- (unint64_t)alarmCount
{
  return (uint64_t)(*((void *)self->_alarmQueue + 1) - *(void *)self->_alarmQueue) >> 3;
}

- (void)addAlarm:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    objc_super v4 = [(SATime *)self alarmQueue];
    std::vector<SAAlarmTask * {__strong}>::push_back[abi:ne180100]((char **)v4, &v5);
    std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,SAAlarmClassCompare &,std::__wrap_iter<SAAlarmTask * {__strong}*>>(*v4, v4[1], (uint64_t)&v6, (v4[1] - *v4) >> 3);
  }
}

- (void)popAlarm
{
  v3 = [(SATime *)self alarmQueue];
  if (*v3 != v3[1])
  {
    objc_super v4 = [(SATime *)self alarmQueue];
    std::priority_queue<SAAlarmTask * {__strong},std::vector<SAAlarmTask * {__strong}>,SAAlarmClassCompare>::pop((uint64_t)v4);
  }
}

- (void)cancelAlarmWithUUID:(id)a3
{
  id v5 = a3;
  if (-[NSMutableSet containsObject:](self->_ongoingAlarms, "containsObject:"))
  {
    [(NSMutableSet *)self->_ongoingAlarms removeObject:v5];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_externalTimer);
    [WeakRetained cancelSATimeEventForAlarm:v5];
  }
}

- (id)setupAlarmFireAt:(id)a3 forClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v9 = objc_alloc_init(SAAlarmTask);
    [(SAAlarmTask *)v9 setAlarmUUID:v8];
    [(SAAlarmTask *)v9 setFireDate:v6];
    [(SAAlarmTask *)v9 setClient:v7];
    [(NSMutableSet *)self->_ongoingAlarms addObject:v8];
    [(SATime *)self addAlarm:v9];
    v10 = [(SATime *)self getCurrentTime];
    [v6 timeIntervalSinceDate:v10];
    double v12 = v11;

    if (v12 > 0.0)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_externalTimer);
      [WeakRetained scheduleSATimeEvent:v8 forAlarm:v12];
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (void)alarmFired:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 client];
  id v6 = (id)TASALog;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [v4 alarmUUID];
    id v8 = [v4 fireDate];
    v16[0] = 68289795;
    v16[1] = 0;
    __int16 v17 = 2082;
    __int16 v18 = "";
    __int16 v19 = 2113;
    uint64_t v20 = v7;
    __int16 v21 = 2113;
    v22 = v8;
    __int16 v23 = 2113;
    v24 = v5;
    _os_log_impl(&dword_1D15FC000, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SATime alarm fired\", \"uuid\":\"%{private}@\", \"alarmDate\":\"%{private}@\", \"client\":\"%{private}@\"}", (uint8_t *)v16, 0x30u);
  }
  ongoingAlarms = self->_ongoingAlarms;
  v10 = [v4 alarmUUID];
  char v11 = [(NSMutableSet *)ongoingAlarms containsObject:v10];
  if (v5) {
    char v12 = v11;
  }
  else {
    char v12 = 0;
  }

  if (v12)
  {
    v13 = self->_ongoingAlarms;
    v14 = [v4 alarmUUID];
    [(NSMutableSet *)v13 removeObject:v14];

    v15 = [v4 alarmUUID];
    [v5 alarmFiredForUUID:v15];
  }
}

- (id)getCurrentTime
{
  if ([(SATime *)self isReplay])
  {
    v3 = self->_now;
  }
  else
  {
    v3 = [MEMORY[0x1E4F1C9C8] now];
  }
  return v3;
}

- (id)getEarliestAlarmDate
{
  v3 = [(SATime *)self alarmQueue];
  if (*v3 == v3[1])
  {
    id v4 = 0;
  }
  else
  {
    id v4 = objc_msgSend(**(id **)-[SATime alarmQueue](self, "alarmQueue"), "fireDate");
  }
  return v4;
}

- (NSDate)now
{
  return self->_now;
}

- (NSMutableSet)ongoingAlarms
{
  return self->_ongoingAlarms;
}

- (void)setOngoingAlarms:(id)a3
{
}

- (void)setAlarmQueue:(void *)a3
{
  self->_alarmQueue = a3;
}

- (SATimeEventRequestProtocol)externalTimer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_externalTimer);
  return (SATimeEventRequestProtocol *)WeakRetained;
}

- (void)setExternalTimer:(id)a3
{
}

- (BOOL)isReplay
{
  return self->_isReplay;
}

- (void)setIsReplay:(BOOL)a3
{
  self->_isReplay = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_externalTimer);
  objc_storeStrong((id *)&self->_ongoingAlarms, 0);
  objc_storeStrong((id *)&self->_now, 0);
}

@end