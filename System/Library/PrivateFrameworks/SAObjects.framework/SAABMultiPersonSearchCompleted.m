@interface SAABMultiPersonSearchCompleted
+ (id)multiPersonSearchCompleted;
- (BOOL)requiresResponse;
- (NSArray)personSearchCompleteds;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setPersonSearchCompleteds:(id)a3;
@end

@implementation SAABMultiPersonSearchCompleted

- (id)groupIdentifier
{
  return @"com.apple.ace.contact";
}

- (id)encodedClassName
{
  return @"MultiPersonSearchCompleted";
}

+ (id)multiPersonSearchCompleted
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)personSearchCompleteds
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"personSearchCompleteds", v3);
}

- (void)setPersonSearchCompleteds:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end