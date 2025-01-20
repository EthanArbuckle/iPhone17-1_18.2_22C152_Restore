@interface SAConnectionPolicyRoute
+ (id)connectionPolicyRoute;
- (NSNumber)mptcp;
- (NSNumber)timeout;
- (NSString)cname;
- (NSString)connectionId;
- (NSString)host;
- (NSString)resolver;
- (NSString)resolverProtocol;
- (NSString)routeId;
- (NSString)type;
- (id)encodedClassName;
- (id)groupIdentifier;
- (int64_t)priority;
- (void)setCname:(id)a3;
- (void)setConnectionId:(id)a3;
- (void)setHost:(id)a3;
- (void)setMptcp:(id)a3;
- (void)setPriority:(int64_t)a3;
- (void)setResolver:(id)a3;
- (void)setResolverProtocol:(id)a3;
- (void)setRouteId:(id)a3;
- (void)setTimeout:(id)a3;
- (void)setType:(id)a3;
@end

@implementation SAConnectionPolicyRoute

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"ConnectionPolicyRoute";
}

+ (id)connectionPolicyRoute
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)cname
{
  return (NSString *)[(AceObject *)self propertyForKey:@"cname"];
}

- (void)setCname:(id)a3
{
}

- (NSString)connectionId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"connectionId"];
}

- (void)setConnectionId:(id)a3
{
}

- (NSString)host
{
  return (NSString *)[(AceObject *)self propertyForKey:@"host"];
}

- (void)setHost:(id)a3
{
}

- (NSNumber)mptcp
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"mptcp"];
}

- (void)setMptcp:(id)a3
{
}

- (int64_t)priority
{
  return AceObjectIntegerForProperty(self, @"priority");
}

- (void)setPriority:(int64_t)a3
{
}

- (NSString)resolver
{
  return (NSString *)[(AceObject *)self propertyForKey:@"resolver"];
}

- (void)setResolver:(id)a3
{
}

- (NSString)resolverProtocol
{
  return (NSString *)[(AceObject *)self propertyForKey:@"resolverProtocol"];
}

- (void)setResolverProtocol:(id)a3
{
}

- (NSString)routeId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"routeId"];
}

- (void)setRouteId:(id)a3
{
}

- (NSNumber)timeout
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"timeout"];
}

- (void)setTimeout:(id)a3
{
}

- (NSString)type
{
  return (NSString *)[(AceObject *)self propertyForKey:@"type"];
}

- (void)setType:(id)a3
{
}

@end