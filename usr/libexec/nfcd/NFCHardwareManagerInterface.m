@interface NFCHardwareManagerInterface
+ (id)interface;
@end

@implementation NFCHardwareManagerInterface

+ (id)interface
{
  if (qword_100347350 != -1) {
    dispatch_once(&qword_100347350, &stru_1003028B8);
  }
  v2 = (void *)qword_100347348;

  return v2;
}

@end