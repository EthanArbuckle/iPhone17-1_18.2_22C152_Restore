@interface SABaseAceObject
+ (id)baseAceObject;
- (NSString)metricsContext;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setMetricsContext:(id)a3;
@end

@implementation SABaseAceObject

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"BaseAceObject";
}

+ (id)baseAceObject
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)metricsContext
{
  return (NSString *)[(AceObject *)self propertyForKey:@"metricsContext"];
}

- (void)setMetricsContext:(id)a3
{
}

@end