@interface RangingLimitSystemConfiguratorClient
- (void)didUpdateResourceUsageLimitExceeded:(BOOL)a3 forSessionConfigurationType:(Class)a4;
@end

@implementation RangingLimitSystemConfiguratorClient

- (void)didUpdateResourceUsageLimitExceeded:(BOOL)a3 forSessionConfigurationType:(Class)a4
{
  BOOL v5 = a3;
  v6 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = NSStringFromClass(a4);
    v8 = (void *)v7;
    CFStringRef v9 = @"NO";
    if (v5) {
      CFStringRef v9 = @"YES";
    }
    int v10 = 138412546;
    CFStringRef v11 = v9;
    __int16 v12 = 2112;
    uint64_t v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#rlm,didUpdateResourceUsageLimitExceeded: %@, for: %@", (uint8_t *)&v10, 0x16u);
  }
}

@end