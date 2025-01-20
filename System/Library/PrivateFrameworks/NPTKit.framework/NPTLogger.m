@interface NPTLogger
+ (id)cellular;
+ (id)fileSystem;
+ (id)metadata;
+ (id)network;
+ (id)wifiVelocity;
@end

@implementation NPTLogger

+ (id)network
{
  os_log_t v2 = os_log_create("com.apple.wifiqa.NPTKit", "networking");

  return v2;
}

+ (id)fileSystem
{
  os_log_t v2 = os_log_create("com.apple.wifiqa.NPTKit", "fileSystem");

  return v2;
}

+ (id)wifiVelocity
{
  os_log_t v2 = os_log_create("com.apple.wifiqa.NPTKit", "wifiVelocity");

  return v2;
}

+ (id)cellular
{
  os_log_t v2 = os_log_create("com.apple.wifiqa.NPTKit", "cellular");

  return v2;
}

+ (id)metadata
{
  os_log_t v2 = os_log_create("com.apple.wifiqa.NPTKit", "metadata");

  return v2;
}

@end