@interface SPSecureLocationsGreenTeaLogger
+ (void)sentSecureLocation;
@end

@implementation SPSecureLocationsGreenTeaLogger

+ (void)sentSecureLocation
{
  ct_green_tea_logger_create_static();
  v2 = getCTGreenTeaOsLogHandle();
  v3 = v2;
  if (v2 && os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Transmitting Encrypted Location.", v4, 2u);
  }
}

@end