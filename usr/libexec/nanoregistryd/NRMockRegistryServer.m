@interface NRMockRegistryServer
+ (Class)xpcListenerClass;
@end

@implementation NRMockRegistryServer

+ (Class)xpcListenerClass
{
  return (Class)objc_opt_class();
}

@end