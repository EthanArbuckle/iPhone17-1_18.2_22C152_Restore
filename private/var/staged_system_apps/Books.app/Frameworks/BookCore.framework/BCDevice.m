@interface BCDevice
+ (BOOL)isInternalInstall;
+ (int64_t)deviceClass;
@end

@implementation BCDevice

+ (BOOL)isInternalInstall
{
  if (qword_345C70 != -1) {
    dispatch_once(&qword_345C70, &stru_2C8698);
  }
  return byte_345C68;
}

+ (int64_t)deviceClass
{
  if (qword_345C80 != -1) {
    dispatch_once(&qword_345C80, &stru_2C86B8);
  }
  return qword_345C78;
}

@end