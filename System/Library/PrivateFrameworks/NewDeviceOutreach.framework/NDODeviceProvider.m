@interface NDODeviceProvider
+ (id)sharedProvider;
@end

@implementation NDODeviceProvider

+ (id)sharedProvider
{
  if (qword_1000259A8 != -1) {
    dispatch_once(&qword_1000259A8, &stru_10001CA60);
  }
  v2 = (void *)qword_1000259A0;
  return v2;
}

@end