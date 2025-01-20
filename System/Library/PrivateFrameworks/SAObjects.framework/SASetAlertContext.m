@interface SASetAlertContext
+ (id)setAlertContext;
- (BOOL)requiresResponse;
- (NSArray)context;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setContext:(id)a3;
@end

@implementation SASetAlertContext

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"SetAlertContext";
}

+ (id)setAlertContext
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)context
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"context", v3);
}

- (void)setContext:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end