@interface SASetNLAlertContext
- (BOOL)requiresResponse;
- (NSArray)context;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setContext:(id)a3;
@end

@implementation SASetNLAlertContext

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"SetNLAlertContext";
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