@interface SAAppSubscriptions
+ (id)appSubscriptions;
- (NSArray)activeSubscriptions;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setActiveSubscriptions:(id)a3;
@end

@implementation SAAppSubscriptions

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"AppSubscriptions";
}

+ (id)appSubscriptions
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)activeSubscriptions
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"activeSubscriptions", v3);
}

- (void)setActiveSubscriptions:(id)a3
{
}

@end