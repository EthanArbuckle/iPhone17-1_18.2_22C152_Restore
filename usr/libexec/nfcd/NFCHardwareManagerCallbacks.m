@interface NFCHardwareManagerCallbacks
+ (id)interface;
@end

@implementation NFCHardwareManagerCallbacks

+ (id)interface
{
  if (qword_100347360 != -1) {
    dispatch_once(&qword_100347360, &stru_1003028D8);
  }
  v2 = (void *)qword_100347358;

  return v2;
}

@end