@interface DPCConnectivityPolicy
- (BOOL)hasBeenConnected;
- (DPCConnectivityPolicy)initWithStateMachine:(id)a3;
- (unint64_t)onRSSIChange:(id)a3;
- (void)notifyNewEvent:(unint64_t)a3;
- (void)onWatchConnectivityChange:(BOOL)a3;
- (void)setHasBeenConnected:(BOOL)a3;
@end

@implementation DPCConnectivityPolicy

- (DPCConnectivityPolicy)initWithStateMachine:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)DPCConnectivityPolicy;
  v5 = [(DPCBasePolicy *)&v8 init];
  v6 = v5;
  if (v5)
  {
    [(DPCBasePolicy *)v5 setRequireRSSI:0];
    [(DPCBasePolicy *)v6 setStateMachine:v4];
    [(DPCConnectivityPolicy *)v6 setHasBeenConnected:0];
  }

  return v6;
}

- (void)notifyNewEvent:(unint64_t)a3
{
  v5 = sub_100006A24((uint64_t)off_100016CB8);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = [(DPCBasePolicy *)self stateMachine];
    unint64_t v7 = (unint64_t)[v6 currentWatchWristState];
    if (v7 >= 4)
    {
      objc_super v8 = +[NSString stringWithFormat:@"Undefined state (%ld)", v7];
    }
    else
    {
      objc_super v8 = off_1000104A8[v7];
    }
    v9 = v8;
    if (a3 >= 3)
    {
      v10 = +[NSString stringWithFormat:@"Undefined state (%ld)", a3];
    }
    else
    {
      v10 = off_1000104C8[a3];
    }
    *(_DWORD *)buf = 138412546;
    v17 = v9;
    __int16 v18 = 2112;
    v19 = v10;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Current wrist state: %@, checking if need to notify with watch state: %@", buf, 0x16u);
  }
  if (a3 == 2)
  {
    [(DPCBasePolicy *)self scheduleSendAbsenceEvent];
  }
  else
  {
    [(DPCBasePolicy *)self invalidateAbsenceEvent];
    v11 = [(DPCBasePolicy *)self detectedNewEventBlock];
    v11[2](v11, a3);

    v12 = +[NSDate date];
    [v12 timeIntervalSince1970];
    double v14 = v13;
    v15 = [(DPCBasePolicy *)self stateMachine];
    [v15 setLastPresenceEventTimestamp:v14];
  }
}

- (unint64_t)onRSSIChange:(id)a3
{
  return 0;
}

- (void)onWatchConnectivityChange:(BOOL)a3
{
  if (a3)
  {
    [(DPCBasePolicy *)self invalidateAbsenceEvent];
    [(DPCConnectivityPolicy *)self notifyNewEvent:1];
    id v4 = [(DPCBasePolicy *)self stateMachine];
    [v4 setIsMonitoringAbsence:1];

    [(DPCConnectivityPolicy *)self setHasBeenConnected:1];
  }
  else if ([(DPCConnectivityPolicy *)self hasBeenConnected])
  {
    v5 = [(DPCBasePolicy *)self stateMachine];
    id v6 = [v5 currentWatchWristState];

    if (v6 == (id)3)
    {
      [(DPCBasePolicy *)self scheduleSendAbsenceEvent];
      id v8 = [(DPCBasePolicy *)self stateMachine];
      [v8 setIsMonitoringAbsence:0];
    }
  }
  else
  {
    unint64_t v7 = sub_100006A24((uint64_t)off_100016CB8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      sub_10000B004(v7);
    }
  }
}

- (BOOL)hasBeenConnected
{
  return self->_hasBeenConnected;
}

- (void)setHasBeenConnected:(BOOL)a3
{
  self->_hasBeenConnected = a3;
}

@end