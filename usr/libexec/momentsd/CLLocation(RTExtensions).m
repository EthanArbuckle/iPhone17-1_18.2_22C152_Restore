@interface CLLocation(RTExtensions)
@end

@implementation CLLocation(RTExtensions)

- (void)initWithRTLocation:()RTExtensions .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: location", v1, 2u);
}

@end