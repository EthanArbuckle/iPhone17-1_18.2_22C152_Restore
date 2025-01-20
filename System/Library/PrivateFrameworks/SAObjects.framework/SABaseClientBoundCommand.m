@interface SABaseClientBoundCommand
+ (id)baseClientBoundCommand;
- (BOOL)mutatingCommand;
- (BOOL)requiresResponse;
- (NSArray)callbacks;
- (NSNumber)usefulnessScore;
- (NSString)appId;
- (NSString)metricsContext;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAppId:(id)a3;
- (void)setCallbacks:(id)a3;
- (void)setMetricsContext:(id)a3;
- (void)setUsefulnessScore:(id)a3;
@end

@implementation SABaseClientBoundCommand

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"BaseClientBoundCommand";
}

+ (id)baseClientBoundCommand
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)appId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"appId"];
}

- (void)setAppId:(id)a3
{
}

- (NSArray)callbacks
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"callbacks", v3);
}

- (void)setCallbacks:(id)a3
{
}

- (NSString)metricsContext
{
  return (NSString *)[(AceObject *)self propertyForKey:@"metricsContext"];
}

- (void)setMetricsContext:(id)a3
{
}

- (NSNumber)usefulnessScore
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"usefulnessScore"];
}

- (void)setUsefulnessScore:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

- (BOOL)mutatingCommand
{
  return 1;
}

@end