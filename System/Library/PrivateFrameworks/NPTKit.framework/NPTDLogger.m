@interface NPTDLogger
+ (id)client;
+ (id)daemon;
@end

@implementation NPTDLogger

+ (id)daemon
{
  os_log_t v2 = os_log_create("com.apple.internal.networkperformancetesterd", "daemon");

  return v2;
}

+ (id)client
{
  os_log_t v2 = os_log_create("com.apple.internal.networkperformancetesterd", "client");

  return v2;
}

@end