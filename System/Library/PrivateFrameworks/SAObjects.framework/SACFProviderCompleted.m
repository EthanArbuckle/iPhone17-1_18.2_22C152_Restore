@interface SACFProviderCompleted
+ (id)providerCompleted;
- (BOOL)requiresResponse;
- (id)encodedClassName;
- (id)groupIdentifier;
@end

@implementation SACFProviderCompleted

- (id)groupIdentifier
{
  return @"com.apple.ace.clientflow";
}

- (id)encodedClassName
{
  return @"ProviderCompleted";
}

+ (id)providerCompleted
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (BOOL)requiresResponse
{
  return 0;
}

@end