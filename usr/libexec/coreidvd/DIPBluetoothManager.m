@interface DIPBluetoothManager
+ (BOOL)isAvailable;
+ (int64_t)powerState;
+ (void)configureManager;
@end

@implementation DIPBluetoothManager

+ (BOOL)isAvailable
{
  +[DIPBluetoothManager configureManager];
  v2 = +[BluetoothManager sharedInstance];
  unsigned __int8 v3 = [v2 available];

  return v3;
}

+ (int64_t)powerState
{
  +[DIPBluetoothManager configureManager];
  v2 = +[BluetoothManager sharedInstance];
  int64_t v3 = [v2 powerState];

  return v3;
}

+ (void)configureManager
{
  if (qword_100734A50[0] != -1) {
    dispatch_once(qword_100734A50, &stru_1006F0CF0);
  }
}

@end