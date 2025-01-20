@interface MIBUMainController
+ (id)sharedInstance;
- (BOOL)_acquirePowerAssertion;
- (BOOL)disableCarrierMode;
- (BOOL)isCommandAllowed:(id)a3;
- (BOOL)running;
- (BOOL)shutDownReady;
- (MIBUDeviceControllerDelegate)deviceDelegate;
- (MIBUDeviceStatus)deviceStatus;
- (MIBUMainController)init;
- (MIBUNFCController)nfcController;
- (MIBUNetworkInfo)networkInfo;
- (MIBUOperation)operation;
- (MIBUOperationProducerProtocol)operationFactory;
- (NSDictionary)stateTransitionTable;
- (OS_os_transaction)transaction;
- (PCPersistentTimer)idleTimer;
- (double)idleTimeInterval;
- (id)_getStateTransitionTable;
- (unint64_t)state;
- (unsigned)powerAssertionID;
- (void)_acquireTransaction;
- (void)_releasePowerAssertion;
- (void)_releaseTransaction;
- (void)_setSystemTime:(id)a3;
- (void)_start:(id *)a3;
- (void)_startIdleTimerForState:(unint64_t)a3;
- (void)_stopIdleTimer;
- (void)_transitionToState:(unint64_t)a3 error:(id *)a4;
- (void)cleanup:(id *)a3;
- (void)didHandleCommand:(id)a3 withError:(id)a4;
- (void)didStopHeartbeat;
- (void)handleIdleTimer:(id)a3;
- (void)nfcActivityDidTimeout;
- (void)operationFinishedWithError:(id)a3;
- (void)setDeviceDelegate:(id)a3;
- (void)setDisableCarrierMode:(BOOL)a3;
- (void)setIdleTimeInterval:(double)a3;
- (void)setIdleTimer:(id)a3;
- (void)setNfcController:(id)a3;
- (void)setOperation:(id)a3;
- (void)setOperationFactory:(id)a3;
- (void)setPowerAssertionID:(unsigned int)a3;
- (void)setShutDownReady:(BOOL)a3;
- (void)setState:(unint64_t)a3;
- (void)setStateTransitionTable:(id)a3;
- (void)setTransaction:(id)a3;
- (void)start:(id *)a3;
@end

@implementation MIBUMainController

- (MIBUMainController)init
{
  v17.receiver = self;
  v17.super_class = (Class)MIBUMainController;
  v2 = [(MIBUMainController *)&v17 init];
  v3 = v2;
  if (v2)
  {
    [(MIBUMainController *)v2 setState:0];
    [(MIBUMainController *)v3 setOperation:0];
    [(MIBUMainController *)v3 setIdleTimer:0];
    [(MIBUMainController *)v3 setIdleTimeInterval:300.0];
    if (os_variant_has_internal_content())
    {
      v4 = +[MIBUTestPreferences sharedInstance];
      v5 = [v4 nfcIdleTime];

      if (v5)
      {
        v6 = +[MIBUTestPreferences sharedInstance];
        v7 = [v6 nfcIdleTime];
        [v7 doubleValue];
        -[MIBUMainController setIdleTimeInterval:](v3, "setIdleTimeInterval:");

        if (qword_10006C958 != -1) {
          dispatch_once(&qword_10006C958, &stru_10005A9B8);
        }
        v8 = (void *)qword_10006C950;
        if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
        {
          v9 = v8;
          [(MIBUMainController *)v3 idleTimeInterval];
          *(_DWORD *)buf = 134217984;
          uint64_t v19 = v10;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Overrding NFC Idle time to %lf", buf, 0xCu);
        }
      }
    }
    v11 = [[MIBUNFCController alloc] initWithDelegate:v3];
    [(MIBUMainController *)v3 setNfcController:v11];

    v12 = [(MIBUMainController *)v3 nfcController];
    [v12 addObserver:v3];

    v13 = +[MIBUDeviceController sharedInstance];
    [(MIBUMainController *)v3 setDeviceDelegate:v13];

    v14 = +[MIBUOperationFactory sharedInstance];
    [(MIBUMainController *)v3 setOperationFactory:v14];

    v15 = [(MIBUMainController *)v3 _getStateTransitionTable];
    [(MIBUMainController *)v3 setStateTransitionTable:v15];

    [(MIBUMainController *)v3 setShutDownReady:0];
    [(MIBUMainController *)v3 setDisableCarrierMode:1];
    [(MIBUMainController *)v3 setTransaction:0];
    [(MIBUMainController *)v3 setPowerAssertionID:0];
    v3->_running = 0;
  }
  return v3;
}

+ (id)sharedInstance
{
  if (qword_10006C8C8 != -1) {
    dispatch_once(&qword_10006C8C8, &stru_10005A9D8);
  }
  v2 = (void *)qword_10006C8D0;

  return v2;
}

- (void)start:(id *)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10001CA28;
  v3[3] = &unk_10005AA00;
  v3[4] = self;
  v3[5] = a3;
  if (qword_10006C8D8 != -1) {
    dispatch_once(&qword_10006C8D8, v3);
  }
}

- (void)cleanup:(id *)a3
{
  v4 = self;
  objc_sync_enter(v4);
  if ((id)[(MIBUMainController *)v4 state] == (id)5)
  {
    if (![(MIBUMainController *)v4 disableCarrierMode])
    {
      v5 = [(MIBUMainController *)v4 deviceDelegate];
      [v5 disableCarrierMode];

      [(MIBUMainController *)v4 setDisableCarrierMode:1];
    }
  }
  else
  {
    [(MIBUMainController *)v4 setDisableCarrierMode:1];
    [(MIBUMainController *)v4 _transitionToState:5 error:a3];
  }
  if (qword_10006C958 != -1) {
    dispatch_once(&qword_10006C958, &stru_10005AA20);
  }
  v6 = qword_10006C950;
  if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "main controller cleaned up", v7, 2u);
  }
  objc_sync_exit(v4);
}

- (MIBUDeviceStatus)deviceStatus
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = objc_alloc_init(MIBUDeviceStatus);
  [(MIBUDeviceStatus *)v3 setState:[(MIBUMainController *)v2 state]];
  v4 = [(MIBUMainController *)v2 deviceDelegate];
  v5 = [v4 getBatteryLevel];
  [(MIBUDeviceStatus *)v3 setBatteryLevel:v5];

  v6 = [(MIBUMainController *)v2 deviceDelegate];
  v7 = [v6 thermalDetails];
  [(MIBUDeviceStatus *)v3 setThermalDetails:v7];

  v8 = [(MIBUMainController *)v2 deviceDelegate];
  v9 = [v8 batteryDetails];
  [(MIBUDeviceStatus *)v3 setBatteryDetails:v9];

  uint64_t v10 = [(MIBUMainController *)v2 operation];

  if (v10)
  {
    v11 = [(MIBUMainController *)v2 operation];
    -[MIBUDeviceStatus setOperation:](v3, "setOperation:", [v11 opCode]);

    v12 = [(MIBUMainController *)v2 operation];
    v13 = [v12 error];
    [(MIBUDeviceStatus *)v3 setOperationError:v13];

    v14 = [(MIBUMainController *)v2 operation];
    v15 = [v14 details];
    [(MIBUDeviceStatus *)v3 setOperationDetails:v15];
  }
  else
  {
    [(MIBUDeviceStatus *)v3 setOperation:0];
    [(MIBUDeviceStatus *)v3 setOperationError:0];
    [(MIBUDeviceStatus *)v3 setOperationDetails:0];
  }
  objc_sync_exit(v2);

  return v3;
}

- (MIBUNetworkInfo)networkInfo
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = +[MIBUNetworkInfo queryNetworkInfo];
  objc_sync_exit(v2);

  return (MIBUNetworkInfo *)v3;
}

- (BOOL)isCommandAllowed:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v15[0] = &off_100060210;
  v15[1] = &off_100060228;
  v16[0] = &__NSArray0__struct;
  v16[1] = &off_100061240;
  v15[2] = &off_100060318;
  v16[2] = &off_100061258;
  v6 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:3];
  if ((id)[(MIBUMainController *)v5 state] == (id)2)
  {
    v7 = [(MIBUMainController *)v5 operation];
    unsigned __int8 v8 = [v7 isCommandAllowed:v4];

    if (v8)
    {
LABEL_3:
      BOOL v9 = 1;
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v10 = +[NSNumber numberWithUnsignedInteger:[(MIBUMainController *)v5 state]];
    v11 = [v6 objectForKey:v10];

    LOBYTE(v10) = [v11 containsObject:v4];
    if (v10) {
      goto LABEL_3;
    }
  }
  if (qword_10006C958 != -1) {
    dispatch_once(&qword_10006C958, &stru_10005AA40);
  }
  v12 = (id)qword_10006C950;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    sub_10003FB84((uint64_t)v4, v14, [(MIBUMainController *)v5 state], v12);
  }

  BOOL v9 = 0;
LABEL_10:

  objc_sync_exit(v5);
  return v9;
}

- (void)nfcActivityDidTimeout
{
  if (qword_10006C958 != -1) {
    dispatch_once(&qword_10006C958, &stru_10005AA60);
  }
  v3 = qword_10006C950;
  if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v7) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Handling nfcActivity timeout", (uint8_t *)&v7, 2u);
  }
  id v4 = self;
  objc_sync_enter(v4);
  if ((id)[(MIBUMainController *)v4 state] == (id)5 || (id)[(MIBUMainController *)v4 state] == (id)4)
  {
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_10005AA80);
    }
    v5 = (id)qword_10006C950;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v6 = [(MIBUMainController *)v4 state];
      int v7 = 134217984;
      unint64_t v8 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Device already in state: %lu. No additional handling required", (uint8_t *)&v7, 0xCu);
    }
  }
  else
  {
    [(MIBUMainController *)v4 setShutDownReady:1];
    [(MIBUMainController *)v4 _transitionToState:5 error:0];
  }
  objc_sync_exit(v4);
}

- (void)didHandleCommand:(id)a3 withError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = self;
  objc_sync_enter(v8);
  id v9 = [v6 code];
  if (v7) {
    goto LABEL_28;
  }
  uint64_t v10 = (uint64_t)v9;
  id v11 = [(MIBUMainController *)v8 state];
  if (v11 == (id)1)
  {
    if (v10 > 6)
    {
      if (v10 == 7)
      {
        uint64_t v18 = 4;
        goto LABEL_27;
      }
      if (v10 != 11)
      {
LABEL_20:
        if (qword_10006C958 != -1) {
          dispatch_once(&qword_10006C958, &stru_10005AAC0);
        }
        uint64_t v19 = (id)qword_10006C950;
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          int v20 = 138412802;
          v21 = v8;
          __int16 v22 = 2048;
          uint64_t v23 = v10;
          __int16 v24 = 2048;
          unint64_t v25 = [(MIBUMainController *)v8 state];
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%@: Received command %ld at state %ld; resetting idle timer...",
            (uint8_t *)&v20,
            0x20u);
        }

        [(MIBUMainController *)v8 _startIdleTimerForState:[(MIBUMainController *)v8 state]];
        goto LABEL_28;
      }
      [(MIBUMainController *)v8 _stopIdleTimer];
      objc_super v17 = [v6 payload];
      v13 = [v17 objectForKey:@"TimeStamp"];

      [(MIBUMainController *)v8 _setSystemTime:v13];
      v14 = [(MIBUMainController *)v8 operationFactory];
      v15 = [v14 buildOperationFromCode:2 andDelegate:v8];
      [(MIBUMainController *)v8 setOperation:v15];
    }
    else
    {
      if (!v10) {
        goto LABEL_28;
      }
      if (v10 != 2) {
        goto LABEL_20;
      }
      [(MIBUMainController *)v8 _stopIdleTimer];
      v12 = [v6 payload];
      v13 = [v12 objectForKey:@"TimeStamp"];

      [(MIBUMainController *)v8 _setSystemTime:v13];
      v14 = [(MIBUMainController *)v8 operationFactory];
      v15 = [v14 buildOperationFromCode:1 andDelegate:v8];
      [(MIBUMainController *)v8 setOperation:v15];
    }

    uint64_t v18 = 2;
LABEL_27:
    [(MIBUMainController *)v8 _transitionToState:v18 error:0];
    goto LABEL_28;
  }
  if (v11 == (id)3)
  {
    if (v10 != 3)
    {
      if (v10 != 6) {
        goto LABEL_28;
      }
      goto LABEL_20;
    }
    uint64_t v18 = 1;
    goto LABEL_27;
  }
  if (qword_10006C958 != -1) {
    dispatch_once(&qword_10006C958, &stru_10005AAA0);
  }
  v16 = (id)qword_10006C950;
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    int v20 = 138412802;
    v21 = v8;
    __int16 v22 = 2048;
    uint64_t v23 = v10;
    __int16 v24 = 2048;
    unint64_t v25 = [(MIBUMainController *)v8 state];
    _os_log_debug_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "%@: Nothing to do for cmd %lu at state %lu", (uint8_t *)&v20, 0x20u);
  }

LABEL_28:
  objc_sync_exit(v8);
}

- (void)didStopHeartbeat
{
  v2 = self;
  objc_sync_enter(v2);
  if ((id)[(MIBUMainController *)v2 state] == (id)4)
  {
    [(MIBUMainController *)v2 _transitionToState:5 error:0];
  }
  else
  {
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_10005AAE0);
    }
    v3 = (id)qword_10006C950;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_10003FBDC(v4, [(MIBUMainController *)v2 state], v3);
    }
  }
  objc_sync_exit(v2);
}

- (void)operationFinishedWithError:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (qword_10006C958 != -1) {
    dispatch_once(&qword_10006C958, &stru_10005AB00);
  }
  id v6 = (id)qword_10006C950;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [(MIBUMainController *)v5 operation];
    int v8 = 138543618;
    id v9 = v7;
    __int16 v10 = 2114;
    id v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Operation %{public}@ finished with error: %{public}@", (uint8_t *)&v8, 0x16u);
  }
  if ((id)[(MIBUMainController *)v5 state] == (id)2) {
    [(MIBUMainController *)v5 _transitionToState:3 error:0];
  }
  objc_sync_exit(v5);
}

- (void)handleIdleTimer:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  id v6 = [v4 userInfo];
  if (qword_10006C958 != -1) {
    dispatch_once(&qword_10006C958, &stru_10005AB20);
  }
  id v7 = qword_10006C950;
  if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Idle timer fired!", buf, 2u);
  }
  [(MIBUMainController *)v5 _stopIdleTimer];
  signed int v8 = [v6 intValue];
  if ((id)[(MIBUMainController *)v5 state] != (id)v8)
  {
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_10005AB40);
    }
    v13 = (id)qword_10006C950;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v14 = [(MIBUMainController *)v5 state];
      unsigned int v15 = [v6 intValue];
      *(_DWORD *)buf = 134218240;
      *(void *)__int16 v22 = v14;
      *(_WORD *)&v22[8] = 1024;
      *(_DWORD *)&v22[10] = v15;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Current state %lu != launch state %d, device is not idle", buf, 0x12u);
    }

    goto LABEL_17;
  }
  if ([v6 unsignedIntValue] == 3)
  {
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_10005AB60);
    }
    id v9 = (id)qword_10006C950;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v10 = [v6 intValue];
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)__int16 v22 = v10;
      *(_WORD *)&v22[4] = 2048;
      *(void *)&v22[6] = 1;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Timed out in state %d, moving to state %lu", buf, 0x12u);
    }

    id v11 = [(MIBUMainController *)v5 nfcController];
    [v11 terminate:0];

    [(MIBUMainController *)v5 _transitionToState:1 error:0];
    id v12 = 0;
    goto LABEL_18;
  }
  if ((id)[(MIBUMainController *)v5 state] == (id)5)
  {
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_10005ABA0);
    }
    v16 = qword_10006C950;
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(void *)__int16 v22 = 5;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Device already in cleanup state: %lu, no cleanup", buf, 0xCu);
    }
LABEL_17:
    id v12 = 0;
    goto LABEL_18;
  }
  if (qword_10006C958 != -1) {
    dispatch_once(&qword_10006C958, &stru_10005AB80);
  }
  objc_super v17 = (id)qword_10006C950;
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v18 = [v6 intValue];
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)__int16 v22 = v18;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Cleaning up after idling in state: %d...", buf, 8u);
  }

  id v20 = 0;
  [(MIBUMainController *)v5 _transitionToState:5 error:&v20];
  id v12 = v20;
  if (v12)
  {
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_10005ABC0);
    }
    uint64_t v19 = qword_10006C950;
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(void *)__int16 v22 = v12;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Failed to cleanup device with error: %{public}@; restarting timer",
        buf,
        0xCu);
    }
    -[MIBUMainController _startIdleTimerForState:](v5, "_startIdleTimerForState:", (int)[v6 intValue]);
  }
LABEL_18:

  objc_sync_exit(v5);
}

- (void)_start:(id *)a3
{
  self->_running = 1;
  v5 = [(MIBUMainController *)self operationFactory];
  id v6 = [v5 buildCurrentOperationWithDelegate:self];
  [(MIBUMainController *)self setOperation:v6];

  id v7 = [(MIBUMainController *)self operation];

  if (v7) {
    uint64_t v8 = 2;
  }
  else {
    uint64_t v8 = 1;
  }

  [(MIBUMainController *)self _transitionToState:v8 error:a3];
}

- (void)_transitionToState:(unint64_t)a3 error:(id *)a4
{
  if (![(MIBUMainController *)self state]) {
    goto LABEL_5;
  }
  id v7 = [(MIBUMainController *)self stateTransitionTable];
  uint64_t v8 = +[NSNumber numberWithUnsignedInteger:[(MIBUMainController *)self state]];
  id v9 = [v7 objectForKey:v8];

  if (!v9)
  {
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_10005ABE0);
    }
    v38 = (void *)qword_10006C950;
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
      sub_10003FCC0(v38, self);
    }
    goto LABEL_48;
  }
  unsigned int v10 = +[NSNumber numberWithUnsignedInteger:a3];
  unsigned __int8 v11 = [v9 containsObject:v10];

  if ((v11 & 1) == 0)
  {
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_10005AC00);
    }
    v39 = (void *)qword_10006C950;
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
      sub_10003FD54(v39, self);
    }
LABEL_48:

    id v19 = 0;
    goto LABEL_37;
  }

LABEL_5:
  if (qword_10006C958 != -1) {
    dispatch_once(&qword_10006C958, &stru_10005AC20);
  }
  id v12 = (void *)qword_10006C950;
  if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
  {
    v13 = v12;
    unint64_t v14 = objc_opt_class();
    id v15 = v14;
    *(_DWORD *)buf = 138543874;
    unint64_t v44 = (unint64_t)v14;
    __int16 v45 = 2048;
    unint64_t v46 = [(MIBUMainController *)self state];
    __int16 v47 = 2048;
    unint64_t v48 = a3;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: changing device state from %lu to %lu", buf, 0x20u);
  }
  switch(a3)
  {
    case 1uLL:
      v16 = [(MIBUMainController *)self operation];

      if (v16)
      {
        objc_super v17 = [(MIBUMainController *)self operation];
        [v17 terminateNow];

        [(MIBUMainController *)self setOperation:0];
      }
      [(MIBUMainController *)self _acquireTransaction];
      unsigned int v18 = [(MIBUMainController *)self nfcController];
      id v42 = 0;
      [v18 start:&v42];
      id v19 = v42;

      [(MIBUMainController *)self _startIdleTimerForState:1];
      id v20 = [(MIBUMainController *)self deviceDelegate];
      [v20 enableCarrierMode];
      goto LABEL_27;
    case 2uLL:
      [(MIBUMainController *)self _stopIdleTimer];
      [(MIBUMainController *)self _acquirePowerAssertion];
      [(MIBUMainController *)self setDisableCarrierMode:0];
      __int16 v22 = [(MIBUMainController *)self operation];
      [v22 resume];

      goto LABEL_20;
    case 3uLL:
      uint64_t v23 = [(MIBUMainController *)self nfcController];
      id v41 = 0;
      [v23 start:&v41];
      id v19 = v41;

      [(MIBUMainController *)self _startIdleTimerForState:3];
      goto LABEL_28;
    case 4uLL:
      [(MIBUMainController *)self _stopIdleTimer];
      [(MIBUMainController *)self setShutDownReady:1];
      [(MIBUMainController *)self setDisableCarrierMode:1];
      goto LABEL_20;
    case 5uLL:
      [(MIBUMainController *)self _stopIdleTimer];
      __int16 v24 = [(MIBUMainController *)self operation];

      if (v24)
      {
        unint64_t v25 = [(MIBUMainController *)self operation];
        [v25 terminateNow];

        [(MIBUMainController *)self setOperation:0];
      }
      [(MIBUMainController *)self _releaseTransaction];
      [(MIBUMainController *)self _releasePowerAssertion];
      if ([(MIBUMainController *)self disableCarrierMode])
      {
        v26 = [(MIBUMainController *)self deviceDelegate];
        [v26 disableCarrierMode];
      }
      v27 = [(MIBUMainController *)self nfcController];
      id v40 = 0;
      [v27 terminate:&v40];
      id v19 = v40;

      if ([(MIBUMainController *)self shutDownReady])
      {
        v28 = [(MIBUMainController *)self deviceDelegate];
        [v28 removePowerLog];

        v29 = [(MIBUMainController *)self deviceDelegate];
        [v29 setShelfLifeMode];

        id v20 = [(MIBUMainController *)self deviceDelegate];
        [v20 shutdown];
LABEL_27:
      }
      goto LABEL_28;
    default:
      if (qword_10006C958 != -1) {
        dispatch_once(&qword_10006C958, &stru_10005AC40);
      }
      v21 = (void *)qword_10006C950;
      if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
        sub_10003FC24(v21, self);
      }
LABEL_20:
      id v19 = 0;
LABEL_28:
      if (qword_10006C958 != -1) {
        dispatch_once(&qword_10006C958, &stru_10005AC60);
      }
      v30 = (void *)qword_10006C950;
      if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
      {
        v31 = v30;
        v32 = objc_opt_class();
        id v33 = v32;
        unint64_t v34 = [(MIBUMainController *)self state];
        *(_DWORD *)buf = 138543874;
        unint64_t v44 = (unint64_t)v32;
        __int16 v45 = 2048;
        unint64_t v46 = v34;
        __int16 v47 = 2048;
        unint64_t v48 = a3;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "%{public}@: state changed from %lu to %lu", buf, 0x20u);
      }
      [(MIBUMainController *)self setState:a3];
      if (v19)
      {
        if (qword_10006C958 != -1) {
          dispatch_once(&qword_10006C958, &stru_10005AC80);
        }
        v35 = (void *)qword_10006C950;
        if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR))
        {
          v36 = v35;
          unint64_t v37 = [(MIBUMainController *)self state];
          *(_DWORD *)buf = 134218498;
          unint64_t v44 = a3;
          __int16 v45 = 2048;
          unint64_t v46 = v37;
          __int16 v47 = 2114;
          unint64_t v48 = (unint64_t)v19;
          _os_log_error_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "Failed to transition to state: %ld; current device state is: %ld; error: %{public}@",
            buf,
            0x20u);
        }
      }
      break;
  }
LABEL_37:
  if (a4) {
    *a4 = v19;
  }
}

- (id)_getStateTransitionTable
{
  v4[0] = &off_100060210;
  v4[1] = &off_100060228;
  v5[0] = &__NSArray0__struct;
  v5[1] = &off_100061270;
  v4[2] = &off_100060330;
  v4[3] = &off_100060318;
  v5[2] = &off_100061288;
  v5[3] = &off_1000612A0;
  v4[4] = &off_100060360;
  v4[5] = &off_100060348;
  v5[4] = &off_1000612B8;
  v5[5] = &__NSArray0__struct;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:6];

  return v2;
}

- (void)_startIdleTimerForState:(unint64_t)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10001ED14;
  v3[3] = &unk_10005AA00;
  v3[4] = self;
  v3[5] = a3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v3);
}

- (void)_stopIdleTimer
{
  v3 = [(MIBUMainController *)self idleTimer];

  if (v3)
  {
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_10005ACC0);
    }
    id v4 = qword_10006C950;
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Stopping Idle Timer...", v6, 2u);
    }
    v5 = [(MIBUMainController *)self idleTimer];
    [v5 invalidate];

    [(MIBUMainController *)self setIdleTimer:0];
  }
}

- (void)_acquireTransaction
{
  v3 = [(MIBUMainController *)self transaction];

  if (!v3)
  {
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_10005ACE0);
    }
    id v4 = qword_10006C950;
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Acquiring transaction...", v6, 2u);
    }
    v5 = (void *)os_transaction_create();
    [(MIBUMainController *)self setTransaction:v5];
  }
}

- (void)_releaseTransaction
{
  if (qword_10006C958 != -1) {
    dispatch_once(&qword_10006C958, &stru_10005AD00);
  }
  v3 = qword_10006C950;
  if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Releasing transaction...", v4, 2u);
  }
  [(MIBUMainController *)self setTransaction:0];
}

- (BOOL)_acquirePowerAssertion
{
  if ([(MIBUMainController *)self powerAssertionID]) {
    return 1;
  }
  if (qword_10006C958 != -1) {
    dispatch_once(&qword_10006C958, &stru_10005AD20);
  }
  v3 = qword_10006C950;
  if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v11) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Acquiring power assertion...", (uint8_t *)&v11, 2u);
  }
  IOReturn v4 = IOPMAssertionCreateWithName(@"PreventUserIdleSystemSleep", 0xFFu, @"com.apple.inboxupdaterd", &self->_powerAssertionID);
  if (!v4)
  {
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_10005AD60);
    }
    v5 = (void *)qword_10006C950;
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = v5;
      unsigned int v7 = [(MIBUMainController *)self powerAssertionID];
      int v11 = 67109120;
      unsigned int v12 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Acquired power assertion ID: %u", (uint8_t *)&v11, 8u);
    }
    return 1;
  }
  IOReturn v9 = v4;
  if (qword_10006C958 != -1) {
    dispatch_once(&qword_10006C958, &stru_10005AD40);
  }
  unsigned int v10 = qword_10006C950;
  if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 67109120;
    unsigned int v12 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Failed to acquire power assertion with status: 0x%x", (uint8_t *)&v11, 8u);
  }
  [(MIBUMainController *)self setPowerAssertionID:0];
  return 0;
}

- (void)_releasePowerAssertion
{
  if ([(MIBUMainController *)self powerAssertionID])
  {
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_10005AD80);
    }
    v3 = (void *)qword_10006C950;
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
    {
      IOReturn v4 = v3;
      int v7 = 67109120;
      unsigned int v8 = [(MIBUMainController *)self powerAssertionID];
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Releasing power assertion ID: %u ...", (uint8_t *)&v7, 8u);
    }
    IOReturn v5 = IOPMAssertionRelease([(MIBUMainController *)self powerAssertionID]);
    [(MIBUMainController *)self setPowerAssertionID:0];
    if (v5)
    {
      if (qword_10006C958 != -1) {
        dispatch_once(&qword_10006C958, &stru_10005ADA0);
      }
      id v6 = qword_10006C950;
      if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
      {
        int v7 = 67109120;
        unsigned int v8 = v5;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Failed to release power assertion with status: 0x%x", (uint8_t *)&v7, 8u);
      }
    }
  }
}

- (void)_setSystemTime:(id)a3
{
  id v4 = a3;
  if (qword_10006C958 != -1) {
    dispatch_once(&qword_10006C958, &stru_10005ADC0);
  }
  IOReturn v5 = (void *)qword_10006C950;
  if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v5;
    int v17 = 134217984;
    id v18 = [v4 longValue];
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Setting system time stamp: %lu", (uint8_t *)&v17, 0xCu);
  }
  int v7 = [(MIBUMainController *)self deviceDelegate];
  unsigned __int8 v8 = [v7 setSystemTime:[v4 longValue]];

  if ((v8 & 1) == 0)
  {
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_10005ADE0);
    }
    IOReturn v9 = qword_10006C950;
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
      sub_10003FDE8(v9, v10, v11, v12, v13, v14, v15, v16);
    }
  }
}

- (BOOL)running
{
  return self->_running;
}

- (MIBUNFCController)nfcController
{
  return self->_nfcController;
}

- (void)setNfcController:(id)a3
{
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (MIBUOperation)operation
{
  return self->_operation;
}

- (void)setOperation:(id)a3
{
}

- (PCPersistentTimer)idleTimer
{
  return self->_idleTimer;
}

- (void)setIdleTimer:(id)a3
{
}

- (double)idleTimeInterval
{
  return self->_idleTimeInterval;
}

- (void)setIdleTimeInterval:(double)a3
{
  self->_idleTimeInterval = a3;
}

- (OS_os_transaction)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
}

- (unsigned)powerAssertionID
{
  return self->_powerAssertionID;
}

- (void)setPowerAssertionID:(unsigned int)a3
{
  self->_powerAssertionID = a3;
}

- (MIBUDeviceControllerDelegate)deviceDelegate
{
  return self->_deviceDelegate;
}

- (void)setDeviceDelegate:(id)a3
{
}

- (MIBUOperationProducerProtocol)operationFactory
{
  return self->_operationFactory;
}

- (void)setOperationFactory:(id)a3
{
}

- (NSDictionary)stateTransitionTable
{
  return self->_stateTransitionTable;
}

- (void)setStateTransitionTable:(id)a3
{
}

- (BOOL)shutDownReady
{
  return self->_shutDownReady;
}

- (void)setShutDownReady:(BOOL)a3
{
  self->_shutDownReady = a3;
}

- (BOOL)disableCarrierMode
{
  return self->_disableCarrierMode;
}

- (void)setDisableCarrierMode:(BOOL)a3
{
  self->_disableCarrierMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateTransitionTable, 0);
  objc_storeStrong((id *)&self->_operationFactory, 0);
  objc_storeStrong((id *)&self->_deviceDelegate, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_idleTimer, 0);
  objc_storeStrong((id *)&self->_operation, 0);

  objc_storeStrong((id *)&self->_nfcController, 0);
}

@end