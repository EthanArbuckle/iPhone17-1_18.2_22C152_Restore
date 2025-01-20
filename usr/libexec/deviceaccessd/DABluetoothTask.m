@interface DABluetoothTask
- (BOOL)appConfirmsAuth;
- (BOOL)pairCTKD;
- (BOOL)pairedCTKD;
- (DABluetoothTask)init;
- (NSNumber)taskTimeout;
- (NSString)displayName;
- (NSUUID)bluetoothUUID;
- (id)description;
- (id)descriptionWithLevel:(int)a3;
- (id)eventHandler;
- (int64_t)btOperation;
- (void)cancelTimer;
- (void)setAppConfirmsAuth:(BOOL)a3;
- (void)setBluetoothUUID:(id)a3;
- (void)setBtOperation:(int64_t)a3;
- (void)setDisplayName:(id)a3;
- (void)setEventHandler:(id)a3;
- (void)setPairCTKD:(BOOL)a3;
- (void)setPairedCTKD:(BOOL)a3;
- (void)setTaskTimeout:(id)a3;
- (void)setTimerTimeout:(double)a3 queue:(id)a4 handler:(id)a5;
@end

@implementation DABluetoothTask

- (DABluetoothTask)init
{
  v6.receiver = self;
  v6.super_class = (Class)DABluetoothTask;
  v2 = [(DABluetoothTask *)&v6 init];
  v3 = v2;
  if (v2) {
    v4 = v2;
  }

  return v3;
}

- (id)description
{
  return [(DABluetoothTask *)self descriptionWithLevel:50];
}

- (void)setTimerTimeout:(double)a3 queue:(id)a4 handler:(id)a5
{
  id v7 = a5;
  v8 = a4;
  [(DABluetoothTask *)self cancelTimer];
  dispatch_source_t v9 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v8);

  objc_storeStrong((id *)&self->taskTimer, v9);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100024910;
  handler[3] = &unk_10003D578;
  handler[4] = self;
  id v13 = v7;
  id v10 = v7;
  dispatch_source_set_event_handler(v9, handler);
  if (dword_1000437C8 <= 30 && (dword_1000437C8 != -1 || _LogCategory_Initialize()))
  {
    v11 = CUPrintDurationDouble();
    LogPrintF();
  }
  CUDispatchTimerSet();
  dispatch_activate(v9);
}

- (void)cancelTimer
{
  taskTimer = self->taskTimer;
  if (taskTimer)
  {
    v5 = taskTimer;
    dispatch_source_cancel(v5);
    v4 = self->taskTimer;
    self->taskTimer = 0;
  }
}

- (id)descriptionWithLevel:(int)a3
{
  if ((a3 & 0x8000000) != 0)
  {
    id v3 = 0;
  }
  else
  {
    objc_opt_class();
    CUAppendF();
    id v3 = 0;
  }
  CUAppendF();
  id v4 = v3;

  CUAppendF();
  id v5 = v4;

  CUAppendF();
  id v6 = v5;

  CUAppendF();
  id v7 = v6;

  CUAppendF();
  id v8 = v7;

  CUAppendF();
  id v9 = v8;

  CUAppendF();
  id v10 = (__CFString *)v9;

  v11 = &stru_10003DF48;
  if (v10) {
    v11 = v10;
  }
  v12 = v11;

  return v12;
}

- (BOOL)appConfirmsAuth
{
  return self->_appConfirmsAuth;
}

- (void)setAppConfirmsAuth:(BOOL)a3
{
  self->_appConfirmsAuth = a3;
}

- (NSUUID)bluetoothUUID
{
  return self->_bluetoothUUID;
}

- (void)setBluetoothUUID:(id)a3
{
}

- (int64_t)btOperation
{
  return self->_btOperation;
}

- (void)setBtOperation:(int64_t)a3
{
  self->_btOperation = a3;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
}

- (id)eventHandler
{
  return self->_eventHandler;
}

- (void)setEventHandler:(id)a3
{
}

- (BOOL)pairCTKD
{
  return self->_pairCTKD;
}

- (void)setPairCTKD:(BOOL)a3
{
  self->_pairCTKD = a3;
}

- (BOOL)pairedCTKD
{
  return self->_pairedCTKD;
}

- (void)setPairedCTKD:(BOOL)a3
{
  self->_pairedCTKD = a3;
}

- (NSNumber)taskTimeout
{
  return self->_taskTimeout;
}

- (void)setTaskTimeout:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskTimeout, 0);
  objc_storeStrong(&self->_eventHandler, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_bluetoothUUID, 0);

  objc_storeStrong((id *)&self->taskTimer, 0);
}

@end