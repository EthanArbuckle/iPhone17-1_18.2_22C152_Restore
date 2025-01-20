@interface FMDBluetoothFrameworkBTManagingFactory
+ (BOOL)isAutomationActive;
+ (id)bluetoothManagerWithQueue:(id)a3 delegate:(id)a4;
@end

@implementation FMDBluetoothFrameworkBTManagingFactory

+ (BOOL)isAutomationActive
{
  if (qword_10031EBF8 != -1) {
    dispatch_once(&qword_10031EBF8, &stru_1002DCE88);
  }
  v2 = sub_100004238();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 67109120;
    v4[1] = byte_10031EBF0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "FMDAutomationBluetoothManager: isAutomationActive: %d", (uint8_t *)v4, 8u);
  }

  return byte_10031EBF0;
}

+ (id)bluetoothManagerWithQueue:(id)a3 delegate:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (+[FMDBluetoothFrameworkBTManagingFactory isAutomationActive])
  {
    if (qword_10031EC10 != -1) {
      dispatch_once(&qword_10031EC10, &stru_1002DCEA8);
    }
    [(id)qword_10031EC08 setBluetoothManager:v6];
    id v7 = (id)qword_10031EC08;
  }
  else
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000BCAF8;
    block[3] = &unk_1002D9378;
    id v10 = v5;
    if (qword_10031EC00 != -1) {
      dispatch_once(&qword_10031EC00, block);
    }
    id v7 = +[BluetoothManager sharedInstance];
  }

  return v7;
}

@end