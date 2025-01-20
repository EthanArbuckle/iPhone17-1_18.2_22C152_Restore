@interface RDDeviceInfo
+ (void)initialize;
@end

@implementation RDDeviceInfo

+ (void)initialize
{
  if ((id)objc_opt_class() == a1) {
    qword_10006EBF8 = (uint64_t)os_log_create("com.apple.SensorKit", "RDDeviceInfo");
  }
}

@end