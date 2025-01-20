@interface SASmsGroupSearchCompleted
+ (id)groupSearchCompleted;
- (BOOL)requiresResponse;
- (NSArray)smsGroups;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setSmsGroups:(id)a3;
@end

@implementation SASmsGroupSearchCompleted

- (id)groupIdentifier
{
  return @"com.apple.ace.sms";
}

- (id)encodedClassName
{
  return @"GroupSearchCompleted";
}

+ (id)groupSearchCompleted
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)smsGroups
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"smsGroups", v3);
}

- (void)setSmsGroups:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end