@interface SAConnectionPolicy
+ (id)connectionPolicy;
- (BOOL)enabled;
- (NSArray)routes;
- (NSNumber)disableMPTCP;
- (NSNumber)enableOptimisticDNS;
- (NSNumber)enableTLS13;
- (NSNumber)enableTLS13ZeroRTT;
- (NSNumber)enableTcpFastOpen;
- (NSNumber)globalTimeout;
- (NSNumber)mptcpFallbackPort;
- (NSNumber)timeToLive;
- (NSString)policyId;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setDisableMPTCP:(id)a3;
- (void)setEnableOptimisticDNS:(id)a3;
- (void)setEnableTLS13:(id)a3;
- (void)setEnableTLS13ZeroRTT:(id)a3;
- (void)setEnableTcpFastOpen:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setGlobalTimeout:(id)a3;
- (void)setMptcpFallbackPort:(id)a3;
- (void)setPolicyId:(id)a3;
- (void)setRoutes:(id)a3;
- (void)setTimeToLive:(id)a3;
@end

@implementation SAConnectionPolicy

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"ConnectionPolicy";
}

+ (id)connectionPolicy
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSNumber)disableMPTCP
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"disableMPTCP"];
}

- (void)setDisableMPTCP:(id)a3
{
}

- (NSNumber)enableOptimisticDNS
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"enableOptimisticDNS"];
}

- (void)setEnableOptimisticDNS:(id)a3
{
}

- (NSNumber)enableTLS13
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"enableTLS13"];
}

- (void)setEnableTLS13:(id)a3
{
}

- (NSNumber)enableTLS13ZeroRTT
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"enableTLS13ZeroRTT"];
}

- (void)setEnableTLS13ZeroRTT:(id)a3
{
}

- (NSNumber)enableTcpFastOpen
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"enableTcpFastOpen"];
}

- (void)setEnableTcpFastOpen:(id)a3
{
}

- (BOOL)enabled
{
  return AceObjectBoolForProperty(self, @"enabled");
}

- (void)setEnabled:(BOOL)a3
{
}

- (NSNumber)globalTimeout
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"globalTimeout"];
}

- (void)setGlobalTimeout:(id)a3
{
}

- (NSNumber)mptcpFallbackPort
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"mptcpFallbackPort"];
}

- (void)setMptcpFallbackPort:(id)a3
{
}

- (NSString)policyId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"policyId"];
}

- (void)setPolicyId:(id)a3
{
}

- (NSArray)routes
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"routes", v3);
}

- (void)setRoutes:(id)a3
{
}

- (NSNumber)timeToLive
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"timeToLive"];
}

- (void)setTimeToLive:(id)a3
{
}

@end