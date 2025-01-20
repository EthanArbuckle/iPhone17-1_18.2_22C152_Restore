@interface SAClientFlowState
+ (id)clientFlowState;
+ (id)deliveryDeadline;
+ (id)persistencePolicy;
- (NSDictionary)cachedDomainClassJavascriptChecksumMap;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setCachedDomainClassJavascriptChecksumMap:(id)a3;
@end

@implementation SAClientFlowState

+ (id)deliveryDeadline
{
  return @"CUSTOM";
}

+ (id)persistencePolicy
{
  return @"LIFE_OF_USER_DATA";
}

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"ClientFlowState";
}

+ (id)clientFlowState
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSDictionary)cachedDomainClassJavascriptChecksumMap
{
  return (NSDictionary *)[(AceObject *)self propertyForKey:@"cachedDomainClassJavascriptChecksumMap"];
}

- (void)setCachedDomainClassJavascriptChecksumMap:(id)a3
{
}

@end