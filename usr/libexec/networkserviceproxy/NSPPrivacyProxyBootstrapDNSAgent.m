@interface NSPPrivacyProxyBootstrapDNSAgent
+ (id)dnsAgentUUID;
@end

@implementation NSPPrivacyProxyBootstrapDNSAgent

+ (id)dnsAgentUUID
{
  id v2 = [objc_alloc((Class)NSUUID) initWithUUIDBytes:&unk_100122DF0];

  return v2;
}

@end