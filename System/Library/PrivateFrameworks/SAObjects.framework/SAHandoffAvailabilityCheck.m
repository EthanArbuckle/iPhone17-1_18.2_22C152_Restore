@interface SAHandoffAvailabilityCheck
+ (id)handoffAvailabilityCheck;
- (BOOL)requiresResponse;
- (id)encodedClassName;
- (id)groupIdentifier;
@end

@implementation SAHandoffAvailabilityCheck

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"HandoffAvailabilityCheck";
}

+ (id)handoffAvailabilityCheck
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (BOOL)requiresResponse
{
  return 0;
}

@end