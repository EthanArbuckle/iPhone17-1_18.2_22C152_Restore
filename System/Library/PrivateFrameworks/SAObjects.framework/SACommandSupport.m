@interface SACommandSupport
+ (id)commandSupport;
- (NSArray)supportedConstraints;
- (NSString)aceVersion;
- (NSString)commandId;
- (NSURL)serverEndpoint;
- (SAObjectSupport)resultSupport;
- (id)encodedClassName;
- (id)groupIdentifier;
- (int64_t)weight;
- (void)setAceVersion:(id)a3;
- (void)setCommandId:(id)a3;
- (void)setResultSupport:(id)a3;
- (void)setServerEndpoint:(id)a3;
- (void)setSupportedConstraints:(id)a3;
- (void)setWeight:(int64_t)a3;
@end

@implementation SACommandSupport

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"CommandSupport";
}

+ (id)commandSupport
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)aceVersion
{
  return (NSString *)[(AceObject *)self propertyForKey:@"aceVersion"];
}

- (void)setAceVersion:(id)a3
{
}

- (NSString)commandId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"commandId"];
}

- (void)setCommandId:(id)a3
{
}

- (SAObjectSupport)resultSupport
{
  return (SAObjectSupport *)AceObjectAceObjectForProperty(self, @"resultSupport");
}

- (void)setResultSupport:(id)a3
{
}

- (NSURL)serverEndpoint
{
  return (NSURL *)AceObjectURLForProperty(self, @"serverEndpoint");
}

- (void)setServerEndpoint:(id)a3
{
}

- (NSArray)supportedConstraints
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"supportedConstraints", v3);
}

- (void)setSupportedConstraints:(id)a3
{
}

- (int64_t)weight
{
  return AceObjectIntegerForProperty(self, @"weight");
}

- (void)setWeight:(int64_t)a3
{
}

@end